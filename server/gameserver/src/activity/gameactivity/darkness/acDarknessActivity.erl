%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 黑暗之地特殊活动玩法
%%% @end
%%% Created : 19. 十一月 2015 14:42
%%%-------------------------------------------------------------------
-module(acDarknessActivity).
-author("tiancheng").

-include("../../activityPrivate.hrl").
-include("../activityPhaseDefine.hrl").
-include("acDarknessPrivate.hrl").

%% API
-export([
	checkVersion/0,
	isInActivity/0,
	clearPoint/1,
	reward/0,
	freshRank/0,
	getDarknessPlayerRank/1,
	getCampList/1,
	getRankList/2,
	getCampName/1
]).

getRankList(RoleID, Camp) ->
	Sql = qlc:q([Rank || Rank = #rec_darkness_ac_rank{camp = CA} <- mnesia:table(rec_darkness_ac_rank), CA =:= Camp]),
	List = edb:selectRecord(Sql),

	RankNumber = getRankNumber(),

	List2 = lists:keysort(#rec_darkness_ac_rank.rank, List),
	List3 = lists:sublist(List2, RankNumber),

	List4 =
		case lists:keyfind(RoleID, #rec_darkness_ac_rank.roleID, List3) of
			#rec_darkness_ac_rank{} -> List3;
			_ ->
				case lists:keyfind(RoleID, #rec_darkness_ac_rank.roleID, List) of
					#rec_darkness_ac_rank{} = Self ->
						List3_2 = lists:reverse(List3),
						List3_3 = [Self | List3_2],
						lists:reverse(List3_3);
					_ ->
						List3
				end
		end,
	getDarknessPlayerRank(List4).

getCampList(EDBList) ->
	EDBList1 = lists:keysort(#rec_darkness_ac_rank.rank, EDBList),
	Len = erlang:length(EDBList),

	EDBList2 =
		if
			Len =< 6 -> EDBList1;
			Len > 6 -> lists:sublist(EDBList1, 5) ++ [lists:last(EDBList1)];
			true -> []
		end,
	getDarknessPlayerRank(EDBList2).

getDarknessPlayerRank([]) ->
	[];
getDarknessPlayerRank(#rec_darkness_ac_rank{roleID = RoleID, point = Point} = Rank) ->
	{RoleName, RoleLevel} = getRoleNameAndLvl(RoleID),
	{_MapID, Integral, MapPos} = getMapIDAndPos(RoleID),

	#pk_DarknessPlayerRank{
		rank = Rank#rec_darkness_ac_rank.rank,
		camp = Rank#rec_darkness_ac_rank.camp,
		roleID = RoleID,
		roleName = RoleName,
		roleLevel = RoleLevel,
		integral = Integral + Point,
		mapPos = MapPos
	};
getDarknessPlayerRank([#rec_darkness_ac_rank{}|_] = List) ->
	[getDarknessPlayerRank(Rank) || Rank <- List];
getDarknessPlayerRank(RoleID) when erlang:is_integer(RoleID) ->
	{RoleName, RoleLevel} = getRoleNameAndLvl(RoleID),
	{_MapID, Integral, MapPos} = getMapIDAndPos(RoleID),
	#pk_DarknessPlayerRank{
		rank = 0,
		camp = 0,
		roleID = RoleID,
		roleName = RoleName,
		roleLevel = RoleLevel,
		integral = Integral,
		mapPos = MapPos
	}.

reward() ->
	%% 先判断本版本是否已经发奖
	NowVersion = getNowVersion(),
	case NowVersion > 0 of
		true ->
			RewardVersion = getRewardVersion(),
			case NowVersion > RewardVersion of
				true ->
					%% 判断当前版本是否已经结束
					case nowVersionIsEnd(NowVersion) of
						true ->
							?LOG_OUT("~p reward:~p,~p", [?MODULE, NowVersion, RewardVersion]),

							%% 保存发奖版本号
							memDBCache:saveSundries(?Sundries_ID_DarknessVer, ?Darkness_Sundries_SubID_Reward, NowVersion),

							%% 发奖的时候，先立即刷新一波
							freshRank(),

							EDBList = edb:readAllRecord(rec_darkness_ac_rank),
							EDBList_1 = [Rec1 || Rec1 = #rec_darkness_ac_rank{camp = Camp1} <- EDBList, Camp1 =:= ?DarknessCamp_TS],
							EDBList_2 = [Rec2 || Rec2 = #rec_darkness_ac_rank{camp = Camp2} <- EDBList, Camp2 =:= ?DarknessCamp_XE],

							reward(EDBList_1),
							reward(EDBList_2),
							ok;
						_ ->
							?LOG_OUT("~p jump reward nowVersionIsEnd not end:~p,~p", [?MODULE, NowVersion, RewardVersion]),
							skip
					end;
				_ ->
					?LOG_OUT("~p jump reward:~p,~p", [?MODULE, NowVersion, RewardVersion]),
					skip
			end,
			ok;
		_ ->
			?LOG_OUT("~p jump reward nowversion=0:~p", [?MODULE, NowVersion]),
			skip
	end,
	ok.

reward(EDBList) ->
	RankNumber = getRankNumber(),

	EDBList2 = lists:keysort(#rec_darkness_ac_rank.rank, EDBList),

	Title = stringCfg:getString(darkness_choicepowertitle),

	%% 排名奖励
	RankList = lists:sublist(EDBList2, RankNumber),
	#globalsetupCfg{setpara = GiftList} = getCfg:getCfgPStack(cfg_globalsetup, darkness_gift),
	F1 =
		fun(#rec_darkness_ac_rank{roleID = RoleID, rank = Rank, camp = Camp, point = Point} = Rec, AccList) ->
			case lists:filter(fun({S, E, _, _}) -> Rank >= S andalso Rank =< E end, GiftList) of
				[{_,_,ItemID, TitleID}|_] ->
					case TitleID > 0 of
						true ->
							psMgr:sendMsg2PS(?PsNamePlayerMgr, addTitle, [{RoleID, TitleID}]);
						_ ->
							skip
					end,

					case playerMail:createMailGoods(ItemID, 1, true, 0, RoleID, ?ItemSourceDarkness) of
						[#recMailItem{}|_] = MailItemList ->
							Content = stringCfg:getString(darkness_mail, [getCampName(Camp), Rank, Point]),
							mail:sendSystemMail(RoleID, Title, Content, MailItemList, "");
						_ ->
							?ERROR_OUT("reward ItemID=~p, rec=~p", [ItemID, Rec])
					end,
					AccList;
				_ ->
					?ERROR_OUT("reward not find reward:~p,~p", [GiftList, Rec]),
					[Rec | AccList]
			end
		end,
	SXRankList = lists:foldl(F1, [], RankList),

	%% 按积分达到奖励
	OtherList = EDBList2 -- (RankList -- SXRankList),
	#globalsetupCfg{setpara = BasicgiftList} = getCfg:getCfgPStack(cfg_globalsetup, darkness_basicgift),
	BasicgiftList2 = lists:keysort(1, BasicgiftList),
	BasicgiftList3 = lists:reverse(BasicgiftList2),
	F2 =
		fun(#rec_darkness_ac_rank{roleID = RoleID, rank = Rank, camp = Camp, point = Point} = Rec) ->
			case lists:filter(fun({P, _, _}) -> Point >= P end, BasicgiftList3) of
				[{_, ItemID, TitleID}|_] ->
					case TitleID > 0 of
						true ->
							psMgr:sendMsg2PS(?PsNamePlayerMgr, addTitle, [{RoleID, TitleID}]);
						_ ->
							skip
					end,

					case playerMail:createMailGoods(ItemID, 1, true, 0, RoleID, ?ItemSourceDarkness) of
						[#recMailItem{}|_] = MailItemList ->
							Content = stringCfg:getString(darkness_mail, [getCampName(Camp), Rank, Point]),
							mail:sendSystemMail(RoleID, Title, Content, MailItemList, "");
						_ ->
							?ERROR_OUT("reward point ItemID=~p, rec=~p", [ItemID, Rec])
					end;
				_ ->
					skip
			end
		end,
	lists:foreach(F2, OtherList),
	ok.

freshRank() ->
	EDBList = edb:readAllRecord(rec_darkness_ac_rank),
	EDBList2 = lists:keysort(#rec_darkness_ac_rank.roleID, EDBList),

	Dict = acDarknessState:getDarknessPlayerDict(),
	List = dict:to_list(Dict),

	F =
		fun({RoleID, #darknessPlayer{integral = Integral} = Player}, AccList) ->
			case lists:keyfind(RoleID, #rec_darkness_ac_rank.roleID, AccList) of
				#rec_darkness_ac_rank{point = Point} = Rank ->
					%% 清理掉原来的
					acDarknessState:putDarknessPlayerObject(Player#darknessPlayer{integral = 0}),

					lists:keystore(RoleID, #rec_darkness_ac_rank.roleID, AccList, Rank#rec_darkness_ac_rank{point = Point + Integral});
				_ ->
					AccList
			end
		end,
	NewEDBList = lists:foldl(F, EDBList2, List),
	NewEDBList2 = lists:keysort(#rec_darkness_ac_rank.roleID, NewEDBList),
	case EDBList2 =:= NewEDBList2 of
		true ->
			skip;
		_ ->
			%% 刷新排行榜
			NewEDBList_1 = [Rec1 || Rec1 = #rec_darkness_ac_rank{camp = Camp1} <- NewEDBList2, Camp1 =:= ?DarknessCamp_TS],
			NewEDBList_2 = [Rec2 || Rec2 = #rec_darkness_ac_rank{camp = Camp2} <- NewEDBList2, Camp2 =:= ?DarknessCamp_XE],

			freshRank(EDBList, NewEDBList_1),
			freshRank(EDBList, NewEDBList_2),
			ok
	end,
	ok.
freshRank(OldEDBList, NewEDBList) ->
	FSort =
		fun(#rec_darkness_ac_rank{roleID = RID1, point = Point1}, #rec_darkness_ac_rank{roleID = RID2, point = Point2}) ->
			if
				Point1 > Point2 -> true;
				Point1 =:= Point2 andalso RID1 > RID2 -> true;
				true -> false
			end
		end,
	NewEDBList2 = lists:sort(FSort, NewEDBList),

	FRank =
		fun(#rec_darkness_ac_rank{} = Rank, {Index, Acc}) ->
			NewRank = Rank#rec_darkness_ac_rank{rank = Index},
			{Index + 1, [NewRank | Acc]}
		end,
	{_, NewEDBList3} = lists:foldl(FRank, {1, []}, NewEDBList2),

	%% 更新
	FSave =
		fun(#rec_darkness_ac_rank{roleID = RoleID} = Rank) ->
			case lists:keyfind(RoleID, #rec_darkness_ac_rank.roleID, OldEDBList) of
				Rank ->
					%% 与原来一样，不更新
					skip;
				#rec_darkness_ac_rank{} ->
					%% 不一样了，更新
					edb:checkAndSave(rec_darkness_ac_rank, RoleID, Rank, new_rec_darkness_ac_rank, update_rec_darkness_ac_rank),
					ok
			end
		end,
	lists:foreach(FSave, NewEDBList3),
	ok.

checkVersion() ->
	Reset =
		case isInActivityDay() of
			true ->
				NewVersion = getNewVersion(),
				OldVersion = getNowVersion(),

				if
					NewVersion =:= OldVersion ->
						false;
					NewVersion > OldVersion ->
						NewVersion;
					true ->
						false
				end;
			_ ->
				false
		end,

	clearPoint(Reset),
	ok.

clearPoint(false) ->
	skip;
clearPoint(NewVersion) ->
	%% 先设置新版本号
	memDBCache:saveSundries(?Sundries_ID_DarknessVer, ?Darkness_Sundries_SubID_Rank, NewVersion),

	%% 再清空积分数据
	Dict = acDarknessState:getDarknessPlayerDict(),
	List = dict:to_list(Dict),
	F =
		fun({RoleID, #darknessPlayer{} = Player}, AccDict) ->
			dict:store(RoleID, Player#darknessPlayer{integral = 0, killMonsterNumber = 0}, AccDict)
		end,
	NDict = lists:foldl(F, Dict, List),
	acDarknessState:setDarknessPlayerDict(NDict),

	%% 清空排行榜
	EDBList = edb:readAllRecord(rec_darkness_ac_rank),
	F2 =
		fun(#rec_darkness_ac_rank{roleID = RoleID} = Obj) ->
			edb:deleteRecord(rec_darkness_ac_rank, RoleID),
			edb:writeRecord(update_rec_darkness_ac_rank, Obj#rec_darkness_ac_rank{camp = 0}),
			ok
		end,
	lists:foreach(F2, EDBList),

	?LOG_OUT("~p clearPoint:~p", [?MODULE, NewVersion]),
	ok.

isInActivity() ->
	#globalsetupCfg{setpara = WeekList} = getCfg:getCfgPStack(cfg_globalsetup, darkness_open),
	NowTime = acDarknessLogic:getNowTime(),
	%% 判断是不是整周
	{{Year, Month, Day}, {Hour, _Minute, _Second}} = time:convertSec2DateTime(NowTime),
	%% 7表示星期天，1表示星期一
	Week = calendar:day_of_the_week(Year, Month, Day),
	IsMember = lists:member(Week, WeekList),
	IsMember2 = lists:member(Week - 1, WeekList),
	IsStart = acDarknessState:getACIsStart(),
	if
		IsMember andalso Hour >= ?ResetTimeHour -> true;
		IsMember2 andalso Hour =< ?ResetTimeHour andalso IsStart -> true;
		true -> false
	end.

isInActivityDay() ->
	#globalsetupCfg{setpara = WeekList} = getCfg:getCfgPStack(cfg_globalsetup, darkness_open),
	NowTime = acDarknessLogic:getNowTime(),
	%% 判断是不是整周
	{{Year, Month, Day}, {Hour, _Minute, _Second}} = time:convertSec2DateTime(NowTime),
	%% 7表示星期天，1表示星期一
	Week = calendar:day_of_the_week(Year, Month, Day),
	lists:member(Week, WeekList) andalso Hour >= ?ResetTimeHour.

getNewVersion() ->
	NowTime = acDarknessLogic:getNowTime(),
	Date = time:convertSec2DateTime(NowTime),
	NewVersion = time:getDayBeginSeconds(Date) + ?ResetTimeHour * 3600, %% 凌晨四点
	NewVersion.

getNowVersion() ->
	case memDBCache:getSundriesValue(?Sundries_ID_DarknessVer, ?Darkness_Sundries_SubID_Rank) of
		Value when erlang:is_integer(Value) andalso Value > 0 -> Value;
		_ -> 0
	end.

getRewardVersion() ->
	case memDBCache:getSundriesValue(?Sundries_ID_DarknessVer, ?Darkness_Sundries_SubID_Reward) of
		Value when erlang:is_integer(Value) andalso Value > 0 -> Value;
		_ -> 0
	end.

getRankNumber() ->
	#globalsetupCfg{setpara = GiftList} = getCfg:getCfgPStack(cfg_globalsetup, darkness_gift),
	L1 = lists:keysort(2, GiftList),
	case lists:reverse(L1) of
		[{_, Max, _, _}|_] -> 
			Max;
		_ -> 
			10
	end.

getCampName(?DarknessCamp_TS) ->
	stringCfg:getString(darkness_powername1);
getCampName(?DarknessCamp_XE) ->
	stringCfg:getString(darkness_powername2);
getCampName(_) -> "".

getRoleNameAndLvl(RoleID) ->
	case core:queryRoleKeyInfoByRoleID(RoleID) of
		#?RoleKeyRec{roleName = Name, level = Lvl} -> {Name, Lvl};
		_ -> {"", 0}
	end.

getMapIDAndPos(RoleID) ->
	case acDarknessState:getDarknessPlayerObject(RoleID) of
		#darknessPlayer{mapID = MID, integral = Integral} ->
			Pos2 =
				case MID > 0 of
					true ->
						case getCfg:getCfgPStack(cfg_mapsetting, MID) of
							#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeDarknessReady} -> 0;
							#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeDarkness} ->
								#activityCfg{mapidlist = MapIDList} = getCfg:getCfgPStack(cfg_activity, ?ActivityType_Darkness),
								case misc:getListPos(MID, MapIDList) of
									0 -> 255;
									Pos -> Pos
								end;
							_ -> 255
						end;
					_ ->
						255
				end,
			{MID, Integral, Pos2};
		_ ->
			{0, 0, 255}
	end.

nowVersionIsEnd(NowVersion) ->
	NowTime = acDarknessLogic:getNowTime(),
	#activityCfg{starttime = [{0, Hour}], lenghtime = LTime} = getCfg:getCfgPStack(cfg_activity, ?ActivityType_Darkness),
	VersionData = time:convertSec2DateTime(NowVersion),
	VersionEndTime = time:getDayBeginSeconds(VersionData) + Hour * 3600 + LTime - 60, %% 真正结束时间，这里减去60秒的误差
	?LOG_OUT("nowVersionIsEnd:nowversion:~p,nowtime:~p,versionendtime=~p, ret=~p",
		[NowVersion, NowTime, VersionEndTime, NowTime >= VersionEndTime]),
	NowTime >= VersionEndTime.