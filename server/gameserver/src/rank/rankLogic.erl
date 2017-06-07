%%%-------------------------------------------------------------------
%%% @author chengxs
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 排行榜逻辑处理模块
%%% @end
%%% Created : 11. 十一月 2014 16:57
%%%-------------------------------------------------------------------
-module(rankLogic).
-author("tiancheng").

-include("rankPrivate.hrl").

%% API

%% 模块回调
-export([
	refreshRankTick/0,
	saveRankLog/2,
	refreshRank/2,
	getPlayerRankDataAck/2,
	sendAllRankDataToGS/1,
	synAllRankDataToEts/0,
	loadRankPlayerData/1,
	requestRankReward/3,
	getRankSortC/3,
	getRankLVLimitCfg/0
]).

-export([
	clearRankData/1,
	queryRankData/1
]).

%% 把数据库的排行榜数据保存到内存中
getPlayerRankDataAck(_RankType, []) ->
	ok;
getPlayerRankDataAck(RankType, [#recSaveRank{rankType = RankType, createTime = CreateTime} = Rank|List]) ->
	CT = time:dateTimeToInt64(CreateTime),
	rankState:setRankCreateTime(RankType, CT),

	RoleID = Rank#recSaveRank.roleID,
	R = #recPlayerRank{
		roleID = RoleID,
		rankType = Rank#recSaveRank.rankType,
		rankSort = Rank#recSaveRank.rankSort,
		rankSortC = Rank#recSaveRank.rankSortC,
		value1 = Rank#recSaveRank.value1,
		value2 = Rank#recSaveRank.value2,
		value3 = Rank#recSaveRank.value3
	},

	%% 插入数据库
	edb:writeRecord(R),

	%% 加载该玩家的数据
	loadRankPlayerData(RoleID),

	%% 继续加载
	getPlayerRankDataAck(RankType, List).

%% 加载排行榜的玩家的数据
-spec loadRankPlayerData(RoleID::uint()) -> ok.
loadRankPlayerData(RoleID) ->
	case ets:lookup(ets_recPlayerRankInfo, RoleID) of
		[#recPlayerRankInfo{}] ->
			%% 原来有数据，不需要从数据库中增加了
			skip;
		_ ->
			gsSendMsg:sendMsg2DBServer(getPlayerDataInfoFromDB, 0, RoleID)
	end,
	ok.

%% 刷新排行榜心跳
-spec refreshRankTick() -> ok.
refreshRankTick() ->
	L = lists:seq(?PlayerRankType_Start, ?PlayerRankType_End),
	Fun = fun(RankType) ->
		case canRefreshRank(RankType) of
			false ->
%% 				NowTime = time:getSyncTime1970FromDBS(),
%% 				LasTime = rankState:getRankCreateTime(RankType),
%% 				?DEBUG_OUT("refreshRankTick:~p,~p,~p,~p", [RankType,NowTime,LasTime, _Flase]),
				skip;
			FreshTime ->
				%% 需要刷新
				refreshRank(RankType, FreshTime)
		end
	end,
	lists:foreach(Fun, L),
	ok.

%% 能否刷新排行榜
canRefreshRank(RankType) ->
	%% 当前时间
	NowTime = time:getSyncTime1970FromDBS(),

	%% 上一次刷新排行榜时间
	LastCTime = rankState:getRankCreateTime(RankType),

	case NowTime - LastCTime > ?RankRefreshErrorValue of
		true ->
			%% 先获取刷新时间
			case getCfg:getCfgPStack(cfg_rank, RankType) of
				#rankCfg{fresh_cycle = 1, fresh_time = FreshTimeList} ->
					%% 按天周期
					{{Year_N, Month_N, Day_N}, {Hour_N, Minute_N, Second_N}} = time:convertSec2DateTime(NowTime),

					HourMinute = Hour_N * 3600 + Minute_N * 60 + Second_N,

					%% 判断是否在误差范围内
					Fun =
						fun(TimeConf) ->
							TimeConf2 = (TimeConf div 100) * 3600 + (TimeConf rem 100) * 60,
							if
								HourMinute < TimeConf2 -> false;
								HourMinute =:= TimeConf2 -> true;
								true -> HourMinute - TimeConf2 < ?RankRefreshErrorValue
							end
						end,
					case lists:filter(Fun, FreshTimeList) of
						[TimeC] ->
							time:convertDateTime1970ToSec({{Year_N, Month_N, Day_N}, {TimeC div 100, TimeC rem 100, 0}});
						_ ->
							%% 配置不对
							false
					end;
				#rankCfg{fresh_cycle = 2, fresh_time = FreshTimeList} ->
					%% 按周周期
					{{Year_N, Month_N, Day_N}, {Hour_N, Minute_N, Second_N}} = time:convertSec2DateTime(NowTime),
					%% 7表示星期天，1表示星期一
					Week = calendar:day_of_the_week(Year_N, Month_N, Day_N),
					%% 过滤出当前星期
					FreshTimeList2 = [{W, H} || {W, H} <- FreshTimeList, W =:= Week],

					HourMinute = Hour_N * 3600 + Minute_N * 60 + Second_N,

					%% 判断是否在误差范围内
					Fun =
						fun({_, TimeConf}) ->
							TimeConf2 = (TimeConf div 100) * 3600 + (TimeConf rem 100) * 60,
							if
								HourMinute < TimeConf2 -> false;
								HourMinute =:= TimeConf2 -> true;
								true -> HourMinute - TimeConf2 < ?RankRefreshErrorValue
							end
						end,
					case lists:filter(Fun, FreshTimeList2) of
						[{_, TimeC}] ->
							time:convertDateTime1970ToSec({{Year_N, Month_N, Day_N}, {TimeC div 100, TimeC rem 100, 0}});
						_ ->
							%% 配置不对
							false
					end;
				#rankCfg{fresh_cycle = 0} ->
					false;
				_ ->
					false
			end;
		_ ->
			%% 误差太小，不刷新
			false
	end.

%% 刷新排行榜
-spec refreshRank(RankType::playerRankType(), FreshTime::uint()) -> ok.
refreshRank(RankType, FreshTime) ->
	?LOG_OUT("refreshRank:~p,~p", [RankType, FreshTime]),

	%% 取排行榜需要的人数
	#rankCfg{player_number = Number} = getCfg:getCfgPStack(cfg_rank, RankType),
	RealNumber = erlang:min(Number, 100),
	RankList = rankFresh:refreshRank(RankType, RealNumber, FreshTime),

	%% 清空老榜
	clearRankData(RankType),

	%% 保存新榜到内存
	getPlayerRankDataAck(RankType, RankList),

	%% 设置新榜刷新时间
	rankState:setRankCreateTime(RankType, FreshTime),

	%% 保存新榜到数据库
	FTime = fun(#recSaveRank{createTime = CTime} = Rank) ->
		TimeStr = case CTime > 0 of
					  true ->
						  time:convertSec2DateTimeStr(CTime);
					  _ ->
						  "1970-01-01 00:00:00"
				  end,
		Rank#recSaveRank{createTime = TimeStr}
	end,
	RankSqlList = lists:map(FTime, RankList),
	gsSendMsg:sendMsg2DBServer(saveRankData, 0, {RankType, RankSqlList}),

	%% 广播给连接的GS
	RL = queryRankData(RankType),
%%	csSendMsg:sendMsg2AllGSServer(newPlayerRank, {RankType, RL}),
	rankFresh:refreshRank2Ets(RankType, RL),

	dealWarriorTrialRank(FreshTime, RankType, RankList),
	%处理世界等级相关
	dealWorldLevel(RankType, RankList),

	%% 刷新军团榜了
	case RankType of
		?PlayerRankType_Guild ->
			GuildRankList = [{Sort, GuildID} || #recSaveRank{rankSort = Sort, value3 = GuildID} <- RankList],
			psMgr:sendMsg2PS(?PsNameGuild, guildRankFreshSuccess, {RealNumber, GuildRankList}),
			ok;
		_ ->
			skip
	end,

	%% 记录日志
	saveRankLog(RankType, RankSqlList),
	ok.


%% 发送所有的排行榜数据给GS缓存
-spec sendAllRankDataToGS(GSPid::pid()) -> ok.
sendAllRankDataToGS(GSPid) ->
	L = lists:seq(?PlayerRankType_Start, ?PlayerRankType_End),
	Fun = fun(RankType) ->
		RL = queryRankData(RankType),
		psMgr:sendMsg2PS(GSPid, newPlayerRank, {RankType, RL})
	end,
	lists:foreach(Fun, L),
	ok.

synAllRankDataToEts()->
	L = lists:seq(?PlayerRankType_Start, ?PlayerRankType_End),
	Fun =
		fun(RankType) ->
			RL = queryRankData(RankType),
			rankFresh:refreshRank2Ets(RankType, RL)
		end,
	lists:foreach(Fun, L),
	ok.

%% 先清空某排行榜
-spec clearRankData(RankType::playerRankType()) -> ok.
clearRankData(RankType) ->
	?LOG_OUT("clearRankData:~p", [RankType]),
	Match = #recPlayerRank{rankType = RankType, _ = '_'},
	Results = edb:dirtyMatchRecord(recPlayerRank, Match),
	Fun = fun(R) ->
		F = fun() ->
			mnesia:delete_object(R)
		end,
		Ret = mnesia:transaction(F),
		case Ret of
			{atomic,ok} ->
				true;
			Reason ->
				?ERROR_OUT("error delete record:[~p]",[Reason]),
				false
		end
	end,
	lists:foreach(Fun, Results),
	ok.

%% 获取指定排行榜，指定玩家的排名
getRankSort(RankType, RoleID) ->
	Match = #recPlayerRank{roleID = RoleID, rankType = RankType, _ = '_'},
	case edb:dirtyMatchRecord(recPlayerRank, Match) of
		[#recPlayerRank{rankSort = RankSort}] ->
			RankSort;
		_ ->
			0
	end.

%% 获取玩家排名变化
getRankSortC(RankType, RoleID, RankSort) ->
	case getRankSort(RankType, RoleID) of
		OldRankSort when OldRankSort > 0 ->
			OldRankSort - RankSort;
		_ ->
			0
	end.

-spec saveRankLog(RankType, RankList) -> ok when
	RankType :: integer(),
	RankList :: list().
saveRankLog(_RankType, RankList) ->
	Fun = fun(#recSaveRank{} = Rank) ->
		dbLog:sendSaveLogRank( Rank)
	end,
	lists:foreach(Fun, RankList).

queryRankData(RankType) ->
	Match = #recPlayerRank{rankType = RankType, _ = '_'},
	edb:dirtyMatchRecord(recPlayerRank, Match).

%% 请求领奖
-spec requestRankReward(RankType::playerRankType(), RoleID::uint(), LastGetTime::uint()) -> tuple() | false.
requestRankReward(RankType, RoleID, LastGetTime) ->
	%% 上一次刷新排行榜时间
	LastCTime = rankState:getRankCreateTime(RankType),
	DiffLastTime = LastCTime - time:diffSecFrom1970({{2010,1,1},{0,0,0}}),
	case DiffLastTime =:= LastGetTime of
		false ->
			%% 还没领过
			SortID = getRankSort(RankType, RoleID),
			case getCfg:getCfgPStack(cfg_rank, RankType) of
				#rankCfg{rank_reward = Reward} when erlang:is_list(Reward) ->
					Fun = fun({SS, SE, _ID, _Number}) ->
						if
							SortID >= SS andalso SortID =< SE ->
								false;
							SE =:= -1 ->
								%% 所有人都有奖
								false;
							true ->
								true
						end
					end,
					case lists:splitwith(Fun, Reward) of
						{_, [{_,_,ItemID,ItemNumber}|_]} ->
							{RankType, RoleID, DiffLastTime, ItemID, ItemNumber};
						_ ->
							false
					end;
				_ ->
					false
			end;
		true ->
			%% 已经领过了
			false
	end.
%%勇者试炼排行榜相关操作
-spec dealWarriorTrialRank(FreshTime :: uint64(), RankType::uint8(), RankList::[#recSaveRank{},...]) -> ok.
dealWarriorTrialRank(FreshTime, ?PlayerRankType_WarriorTrial, RankList) ->
	%%如果是星期一就清空玩家勇士试炼周数据
	NowTime = case FreshTime > 0 of
				  true ->
					  FreshTime;
				  _ ->
					  time:getSyncTime1970FromDBS()
			  end,
	{{Y, M, D}, {_H, _Min, _S}} = calendar:gregorian_seconds_to_datetime(NowTime),
	%% 如果FreshTime为0表示是GM指令强制刷新
	case FreshTime =:= 0 orelse calendar:day_of_the_week(Y, M, D) =:= 1 of
		true ->
			Sql = qlc:q([Infos || Infos <- mnesia:table(rec_warrior_trial), Infos#rec_warrior_trial.tswkTrialSchedule > 0]),
			case edb:selectRecord(Sql) of
				WarriorInfos ->
					%%给玩家发奖励
					Fun = fun(#rec_warrior_trial{roleID = RoleID} = WarriorInfo) ->
						%%获取该玩家的排名
						Rank = case lists:keyfind(RoleID, #recSaveRank.roleID, RankList) of
								   #recSaveRank{rankSort = R} ->
									   R;
								   _ ->
									   999999
							   end,
						%%发奖励
						AwardFun = fun({SS, SE, ID, Number}, {AccID, AccNum,Index}) ->
							case Rank >= SS andalso Rank =< SE of
								true ->
									{ID, Number, Index + 1};
								_ ->
									{AccID, AccNum, Index}
							end
						end,
						#globalsetupCfg{setpara = AwardList} = getCfg:getCfgPStack(cfg_globalsetup, shilianjiangli),
						{AwardID, AwardNumber, AwardIndex} = lists:foldl(AwardFun, {0, 0, 0}, AwardList),
						#itemCfg{name = Name} = getCfg:getCfgPStack(cfg_item, AwardID),
						MailTitle = stringCfg:getString(warriorMailTitle),
						MailContent = case AwardIndex < erlang:length(AwardList) of
										  true ->
											  stringCfg:getString(warriorMailContent1,[Rank, Name]);
										  _ ->
											  stringCfg:getString(warriorMailContent2,[Name])
									  end,
						%%发送奖励邮件
						sendRankAwardByMail(MailTitle, MailContent, RoleID, [{AwardID, AwardNumber}], ?ItemSourceWarriorRank, ""),
						?LOG_OUT("Clear RoleID:~p warriorTrial week Rank",[RoleID]),
						%%清空周数据
						NewWarriorInfo = WarriorInfo#rec_warrior_trial{tswkTrialSchedule = 0, tswkTrialTime = 0},
						edb:checkAndSave(rec_warrior_trial, RoleID, NewWarriorInfo, new_rec_warrior_trial, update_rec_warrior_trial),
						%%清rolekeyinfo的相关值
						case core:queryRoleKeyInfoByRoleID(RoleID) of
							#?RoleKeyRec{}->
                                gsSendMsg:sendMsg2PublicDMSaveData({?RoleKeyRec, RoleID, [{#?RoleKeyRec.wtPhase, 0}, {#?RoleKeyRec.wtPhaseTime, 0}]});
							_ ->
								?ERROR_OUT("can't find rolekeyinfo[~p]",[RoleID])
						end
					end,
					lists:foreach(Fun, WarriorInfos)
			end,
			%%清除RoleKeyInfo中的勇者试炼数据
			clearWarriorTrialDataInRoleKeyInfo(),
			%%通知在线玩家清零排行需要的缓存数据
			psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {cleanPlayerWarriorData, {}});
		_ ->
			skip
	end,
	ok;
dealWarriorTrialRank(_,_,_) ->
	ok.

clearWarriorTrialDataInRoleKeyInfo() ->
	gsSendMsg:sendMsg2PublicDMSaveData(clearWarriorTrialDataInRoleKeyInfo).

-spec dealWorldLevel(RankType::uint8, RankList::[#recSaveRank{},...]) -> ok.
dealWorldLevel(?PlayerRankType_LevelExp, RankList) ->
	%%取第几个人的等级作为世界等级
	Number =
	case getCfg:getCfgPStack(cfg_globalsetup, worldlevel_num) of
		#globalsetupCfg{setpara = [SetPara]} ->
			SetPara;
		[] ->
			100
	end,
	Level = case lists:keyfind(Number, #recSaveRank.rankSort, RankList) of
				#recSaveRank{value1 = V} ->
					V;
				_ ->
					0
			end,
	psMgr:sendMsg2PS(?PsNameMain, refreshWorldLevel, Level),
	ok;
dealWorldLevel(_,_) ->
	ok.
-spec sendRankAwardByMail(MailTitle :: string(), MailContent :: string(), ToRoleID :: int32(), AttachMentLists :: list(), ReasonCode :: uint32(), MailSubjoinMsg :: list()) -> ok.
sendRankAwardByMail(MailTitle, MailContent, ToRoleID, AttachMentLists, ReasonCode, MailSubjoinMsg) ->
	Fun = fun({ItemID, ItemNum}) ->
		sendMail(ToRoleID, MailTitle, MailContent, ItemID, ItemNum, true, ReasonCode,MailSubjoinMsg)
	end,
	lists:foreach(Fun, AttachMentLists),
	ok.

%%获取排行榜等级限制
getRankLVLimitCfg() ->
	case getCfg:getCfgPStack(cfg_globalsetup, ranklevel_limit) of
		#globalsetupCfg{setpara = SetPara} ->
			SetPara;
		[] ->
			not_found
	end.


sendMail(ToRoleID, Title, Content, ItemID, ItemNumber, IsBind, Reason,MailSubjoinMsg) ->
	case playerMail:createMailGoods(ItemID, ItemNumber, IsBind, 0, ToRoleID, Reason) of
		[#recMailItem{}|_] = MailItemList ->
			mail:sendSystemMail(ToRoleID, Title, Content, MailItemList, MailSubjoinMsg);
		_ ->
			?ERROR_OUT("~p, role=~p, item=~p,num=~p, reason=~p",
				[?MODULE, ToRoleID,  ItemID, ItemNumber,Reason]),
			skip
	end,
	ok.
