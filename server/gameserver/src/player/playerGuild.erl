%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%% 玩家工会处理模块
%%% @end
%%% Created : 28. 八月 2014 10:39
%%%-------------------------------------------------------------------
-module(playerGuild).
-author("tiancheng").
-include("setupLang.hrl").
-include("playerPrivate.hrl").
-include("../guild/guildPrivate.hrl").

-include("cfg_guildbless.hrl").
-include("cfg_guildbless_schedule.hrl").
-include("cfg_guildshop.hrl").

-define(GuildListPageNumber, 30).   %% 公会列表每页数量
-define(GuildMemberPageNumber, 25). %% 公会成员每页数量
-define(CreateGuildLevel, 30).      %% 创建军团需要的角色等级
-define(CreateGuildGold, 1000000).    %% 创建军团需要的金币数量
-define(CreateGuildNameLen, 7).     %% 军团的名字最大长度
%%-define(RUSCreateGuildNameLen, 14).        %% 俄罗斯军团的名字最大长度
-define(DonateGoldDailyCountType, 1).    %% 捐献金币的计数类型
-define(DonateDiamondDailyCountType, 2).    %% 捐献钻石的计数类型

%%-define(JoinGuildCDTime, 3). %%  加入军团CD

%% 客户端请求的消息接口
-export([
	guildList/1,
	changeGuildName/1,
	createGuild/3,
	deleteGuild/0,
	openGuildForm/0,
	memberList/1,
	requestJoinGuildList/0,
	recruitPlayer/1,
	agreeRecruit/3,
	requestJoinGuild/1,
	dealRequestJoin/3,
	exitGuild/0,
	kickGuild/1,
	giveGuildPower/2,
	changeGuildNotice/1,
	changeLeader/1,
	playerDonateMoney/1,
	requestDonateTimes/1,
	changeDenoter/2,
	upgrade/1,
	shopUpgrade/1,
	canJoinGuild/1,

	godBless/1,     			%% 女神祈福
	godBless_Schedule/0,		%% 女神祈福-查询进度
	godBless_Schedule_Reward/1,	%% 女神祈福-领取进度奖励
	shopBuy/2,      			%% 家族商店
	exchange/2,      			%% 兑换功能
	exchange_refresh_all/0,		%% 兑换功能（刷新属性）

	queryGuildInfo/1,			%% 查询指定公会信息
	queryGuildInfoByRoleID/1,	%% 查询指定角色的家族信息
	fastJoin_Get/1,				%% 查询允许快速加入的战力条件
	fastJoin_Set/2,				%% 设置允许快速加入的战力条件
	fastJoin/0,					%% 快速加入请求
	oneKeyRecruit/0,			%% 发布招募
	oneKeyRecruitAck/0			%% 发布招募
]).

%% 模块调用接口
-export([
	init/0,
	changeGuildName2/1,
	createGuildSuccess/1,
	deleteGuildAck/1,
	recruitPlayerAck/1,
	agreeRecruitAck/1,
	dealRequestJoinAck/1,
	joinGuildAck/1,
	exitGuildAck/1,
	kickGuildAck/1,
	giveGuildPowerAck/1,
	guildPowerLevelChange/1,
	changeGuildNoticeAck/1,
	changeLeaderAck/1,
	getOnlineMemberPid/0,
	getOnlineNetPidList/1,
	getGuildSelfLevel/0,
	guildLevelUp/1,
	shopUpgradeAck/1,
	canAddPlayerContribute/1,
	addPlayerContribute/2,
	getOnlinePidList/0,
	getOnlinePidList/1,
	guildChatNotice/1,
	addguildliveness/2,
	addguildresource/2,
	addguildresourceAck/1,
	freshGuildProp/1,
	getGuildMember/1,
	getGuildMember/2,
	getOnlineMemberPid/1,
	changeDenoterAck/1,
	getGuildShopID/0,
	noticeGuildApplyNumber/1
]).

-export([
	recordExitGuildTime/2
]).

%% 玩家公会上线初始化
-spec init() -> ok.
init() ->
	%% 在线列表初始化
	playerState:setGuildList([]),
	playerState:setGuildInfo({{}, [], []}),

	case playerState:getIsPlayer() andalso not core:isCross() of
		true ->
			playerState:updateSelfGuildInfo(),
			playerGuildFairground:init(),

			case playerState:getSelfGuildMember() of
				#rec_guild_member{power = Power, guildID = GuildID} when Power >= ?GuildMemLevel_ViceLeader ->
					noticeGuildApplyNumber(GuildID),
					ok;
				_ ->
					skip
			end,
			ok;
		_ ->
			skip
	end,

	exchange_refresh_all(),
	playerGuildSnowman:init(),

	ok.

guildChatNotice(Chat) ->
	playerChat:onChannelSystemChatMsg(?CHAT_CHANNEL_GUILD, Chat).

%% 修改军团标志
-spec changeDenoter(GuildID::uint64(), Denoter::uint()) -> ok.
changeDenoter(GuildID, Denoter) ->
	RoleID = playerState:getRoleID(),
	case ets:lookup(rec_guild_member, RoleID) of
		[#rec_guild_member{guildID = GuildID, power = Power}] when Power >= ?GuildMemLevel_Leader ->
			psMgr:sendMsg2PS(?PsNameGuild, changeDenoter, {GuildID, RoleID, Denoter}),
			ok;
		_ ->
			skip
	end,
	ok.

-spec changeDenoterAck(Result::boolean()) -> ok.
changeDenoterAck(Result) ->
	%% 修改成功还是失败
	case Result of
		{GuildID, Denoter, true} ->
			playerMsg:sendNetMsg(#pk_GS2U_ChangeDenoter{guildID = GuildID, denoter = Denoter}),
			ok;
		_ ->
			skip
	end,
	ok.

%% 军团升级
-spec upgrade(GuildID::uint64()) -> ok.
upgrade(GuildID) ->
	RoleID = playerState:getRoleID(),
	case ets:lookup(rec_guild_member, RoleID) of
		[#rec_guild_member{guildID = GuildID, power = Power}] when Power >= ?GuildMemLevel_ViceLeader ->
			case ets:lookup(rec_guild, GuildID) of
				[#rec_guild{guildLevel = Lvl, resource = Res, liveness = Liv}] ->
					#guildCfg{need_res = NeedRes, need_liv = NeedLiv} = getCfg:getCfgPStack(cfg_guild, Lvl),
					case Res >= NeedRes andalso Liv >= NeedLiv of
						true ->
							psMgr:sendMsg2PS(?PsNameGuild, upgrade, {GuildID, RoleID});
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_Guild_Res_Liv_isless)
					end;
				_ ->
					skip
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_Guild_Power_lower)
	end,
	ok.

%% 军团商店升级
-spec shopUpgrade(GuildID::uint64()) -> ok.
shopUpgrade(GuildID) ->
	RoleID = playerState:getRoleID(),
		case ets:lookup(rec_guild_member, RoleID) of
		[#rec_guild_member{guildID = GuildID, power = Power}] when Power >= ?GuildMemLevel_Leader ->
			case ets:lookup(rec_guild, GuildID) of
				[#rec_guild{guildLevel = Lvl, resource = Res, liveness = Liv, shopLevel = ShopLevel}] ->
					#guildCfg{shop_upgrade = ShopGradeList} = getCfg:getCfgPStack(cfg_guild, Lvl),
					case ShopGradeList =/= [] of
						true ->
							case lists:keyfind(ShopLevel, 1, ShopGradeList) of
								{ShopLevel, NeedRes, NeedLiv} ->
									case Res >= NeedRes andalso Liv >= NeedLiv of
										true ->
											psMgr:sendMsg2PS(?PsNameGuild, shopUpgrade, {GuildID, RoleID});
										_ ->
											playerMsg:sendErrorCodeMsg(?ErrorCode_Guild_Res_Liv_isless)
									end;
								_ ->
									false
							end;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_Guild_Not_UpShopLevel)
					end;
				_ ->
					skip
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_Guild_Power_lower)
	end,
	ok.

%% 军团升级
-spec guildLevelUp({GuildID :: uint(), NewLevel :: uint()} | false) -> ok.
guildLevelUp({GuildID, NewLevel}) ->
	case playerState:getGuildID() =:= GuildID of
		true ->
			Str = stringCfg:getString(guildLevelUp, [NewLevel]),
			guildChatNotice(Str),

			%% 重新刷新军团界面
			openGuildForm(),
			ok;
		_ ->
			skip
	end,
	ok;
guildLevelUp(false) ->
	ok.

shopUpgradeAck({GuildID, NewShopLevel}) ->
	case playerState:getGuildID() =:= GuildID of
		true ->
			Str = stringCfg:getString(guildShopLevelUp, [NewShopLevel]),
			guildChatNotice(Str);
		_ ->
			skip
	end,
	ok;
shopUpgradeAck(false) ->
	ok.

addguildresource(_, 0) ->
	false;
addguildresource(0, Value) ->
	GuildID = playerState:getGuildID(),
	case GuildID > 0 of
		true -> addguildresource(GuildID, Value);
		_ -> false
	end;
addguildresource(GuildID, Value) ->
	case ets:lookup(rec_guild, GuildID) of
		[#rec_guild{guildLevel = Lvl, resource = Res}] ->
			#guildCfg{max_res = MaxRes} = getCfg:getCfgPStack(cfg_guild, Lvl),
			case Value > 0 andalso Res >= MaxRes of
				true ->
					?LOG_OUT("guild res max:~p,~p", [GuildID, Res]),
					false;
				_ ->
					psMgr:sendMsg2PS(?PsNameGuild, addguildresource, {GuildID, Value}),
					true
			end;
		_ ->
			?ERROR_OUT("addguildresource:~p, ~p", [GuildID, Value]),
			false
	end.

addguildliveness(_, 0) ->
	false;
addguildliveness(0, Value) ->
	GuildID = playerState:getGuildID(),
	case GuildID > 0 of
		true -> addguildliveness(GuildID, Value);
		_ -> false
	end;
addguildliveness(GuildID, Value) ->
	case ets:lookup(rec_guild, GuildID) of
		[#rec_guild{guildLevel = Lvl, liveness = Liv}] ->
			#guildCfg{max_liv = MaxLiv} = getCfg:getCfgPStack(cfg_guild, Lvl),
			case Value > 0 andalso Liv >= MaxLiv of
				true ->
					?LOG_OUT("guild liv max:~p,~p", [GuildID, Liv]),
					false;
				_ ->
					psMgr:sendMsg2PS(?PsNameGuild, addguildliveness, {GuildID, Value}),
					true
			end;
		_ ->
			?ERROR_OUT("addguildresource:~p, ~p", [GuildID, Value]),
			false
	end.

addguildresourceAck(false) ->
	ok;
addguildresourceAck(#rec_guild{guildID = GuildID}) ->
	freshGuildProp(GuildID),
	ok.

%% 查看公会招募榜
-spec guildList(Page :: uint()) -> ok.
guildList(1) ->
	%% 请求最新的公会列表
	RoleID = playerState:getRoleID(),
	F =
		fun(#rec_guild{guildID = GuildID} = Guild, AccList) ->
			%% 先取军团和军团长
			MemberList = getGuildMember(GuildID),
			{LeaderRoleID, LeaderName} =
				case lists:keyfind(?GuildMemLevel_Leader, #rec_guild_member.power, MemberList) of
					#rec_guild_member{roleID = RID} -> {RID, playerNameUID:getPlayerNameByUID(RID)};
					_ -> {0, ""}
				end,

			%% 判断自己有没有申请加入该公会
			IsRequest =
				case lists:keyfind(RoleID, #rec_guild_member.roleID, MemberList) of
					#rec_guild_member{power = GLvl} when GLvl >= ?GuildMemLevel_Normal ->
						0;
					_ ->
						case queryGuildApply(GuildID, RoleID) of
							false -> 0;
							_ -> 1
						end
				end,
			[{LeaderName, LeaderRoleID, IsRequest, Guild} | AccList]
		end,
	Ret = ets:foldl(F, [], rec_guild),
	queryGuildListAck(Ret),
	ok;
guildList(Page) when Page > 1 ->
	sendGuildListToClient(Page),
	ok.

%% 查询公会列表返回的结果，把第一页发给客户端
-spec queryGuildListAck(Result :: list()) -> ok.
queryGuildListAck([]) ->
	?DEBUG_OUT("queryGuildListAck:null"),
	sendGuildListToClient(1),
	ok;
queryGuildListAck([{_LeaderName, _LeaderRoleID, _IsRequest, #rec_guild{}} | _] = Result) ->
	%% 排序
	Fun = fun({_, _, _, #rec_guild{member = Member1, guildLevel = GuildLevel1}}, {_, _, _, #rec_guild{member = Member2, guildLevel = GuildLevel2}}) ->
		if
			GuildLevel1 > GuildLevel2 -> true;
			GuildLevel1 =:= GuildLevel2 andalso Member1 > Member2 -> true;
			true -> false
		end
		  end,
	NList = lists:sort(Fun, Result),

	%% 保存结果
	playerState:setGuildList(NList),

	sendGuildListToClient(1),
	ok.

%% 发送公会列表给客户端
-spec sendGuildListToClient(Page :: uint()) -> ok.
sendGuildListToClient(Page) ->
	case playerState:getGuildList() of
		[] ->
			playerMsg:sendNetMsg(#pk_GS2U_GuildList{nowPage = Page, maxPage = 1, guildInfoList = []});
		List ->
			%% 最大页数
			MaxPage = myTrunc(length(List) / ?GuildListPageNumber),
			SubList = lists:sublist(List, (Page - 1) * ?GuildListPageNumber + 1, ?GuildListPageNumber),
			Fun =
				fun({LeaderName, LeaderRoleID, IsRequest, #rec_guild{guildLevel = Lvl} = Guild}) ->
					#guildCfg{member_number = MaxMember} = getCfg:getCfgPStack(cfg_guild, Lvl),
					#pk_GuildInfo{
						guildID         = Guild#rec_guild.guildID,
						guildName       = Guild#rec_guild.guildName,
						guildLevel      = Guild#rec_guild.guildLevel,
						denoter = 0,
						fightForce      = Guild#rec_guild.fightForce,
						memberNumber    = Guild#rec_guild.member,
						maxMemberNumber = MaxMember,
						leaderName      = LeaderName,
						leaderRoleID    = LeaderRoleID,
						isRequest       = IsRequest
					}
				end,
			InfoList = lists:map(Fun, SubList),
			playerMsg:sendNetMsg(#pk_GS2U_GuildList{nowPage = Page, maxPage = MaxPage, guildInfoList = InfoList})
	end,
	ok.

%% 公会改名
-spec changeGuildName(NewGuildName :: string()) -> ok.
changeGuildName(NewGuildName) ->
	#globalsetupCfg{setpara = [ItemID]} = getCfg:getCfgPStack(cfg_globalsetup, guild_modifyname),
	HaveItemNumber = playerPackage:getItemNumByID(ItemID),
	case HaveItemNumber > 0 of
		true ->
			%% 有道具
			case changeGuildName2(NewGuildName) of
				true ->
					GuildID = playerState:getGuildID(),

					%% 扣除道具
					Plog = #recPLogTSItem{
						old         = 1,
						new         = 0,
						change      = -1,
						target      = ?PLogTS_Guild,
						source      = ?PLogTS_PlayerSelf,
						gold        = 0,
						goldtype    = 0,
						changReason = ?ItemDeleteReasonModifyGuildName,
						reasonParam = GuildID
					},
					playerPackage:delGoodsByID(?Item_Location_Bag, ItemID, 1, Plog),

					%% 军团名更改成功
					playerMsg:sendNetMsg(#pk_GS2U_ChangeGuildName{newGuildName = NewGuildName}),

					playerState:updateSelfGuildInfo(),
					ok;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

getGuildNameLen()->
	case getCfg:getCfgByKey(cfg_globalsetup, guild_name_max_length) of
		#globalsetupCfg{setpara = [LenMax]} ->
			LenMax;
		_ ->
			?CreateGuildNameLen
	end.

getGuildJoinLevel()->
	case getCfg:getCfgByKey(cfg_globalsetup, guild_join_level) of
		#globalsetupCfg{setpara = [Level]} ->
			Level;
		_ ->
			?CreateGuildLevel
	end.

%% 公会改名
-spec changeGuildName2(NewName :: string()) -> boolean().
changeGuildName2(NewName) ->
	GuildID = playerState:getGuildID(),
	GuildLvl = getGuildSelfLevel(),
	case GuildID > 0 of
		true ->
			case GuildLvl =:= ?GuildMemLevel_Leader of
				true ->
					LenMax = getGuildNameLen(),
%%                    NameName1 =  erlang:list_to_binary(NewName),
%%                    NameName2 = unicode:characters_to_list(NameName1),
%%                    RusNameLen = erlang:length(NameName2),
					RusNameLen = str:get_utf8_char_count(NewName),
					case RusNameLen =< LenMax of
						true ->
							RoleID = playerState:getRoleID(),
							case psMgr:call( ?PsNameGuild, changeGuildName, {GuildID, NewName, RoleID}, ?Start_Link_TimeOut_ms) of
								{OldGuildName, NewName} ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_GuildChangeGuildNameSuccess),
									?LOG_OUT("changeGuildName success:roleid=~p, guildid=~p, oldname=~ts, newname=~ts", [RoleID, GuildID, OldGuildName, NewName]),

									%% 给聊天频道发消息
									Str = stringCfg:getString(changeGuildNameSuccess, [OldGuildName, NewName]),
									guildChatNotice(Str),
									true;
								repeat ->
									%% 重名
									playerMsg:sendErrorCodeMsg(?ErrorCode_GuildCreateFailedRepeatName),
									false;
								_ ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_GuildChangeGuildNameFailed),
									false
							end;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_GuildChangeGuildNameLong, [LenMax]),
							false
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_GuildChangeGuildNameLeader),
					false
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildNotJoin),
			false
	end.

%% 创建公会
-spec createGuild(GuildName :: list(), Denoter::uint(), Notice::list()) -> ok.
createGuild("", _, _) ->
	ok;
createGuild(GuildName, Denoter, Notice) ->
	Result =
		case canCreateGuild(GuildName) of
			0 ->
				case str:get_utf8_char_count(Notice) =< 60 of
					true ->
						RoleID = playerState:getRoleID(),
						case canJoinGuild_Master(RoleID) of
							true ->
								%% 可以创建
								%% call cs判断能否创建帮派
								RoleName = playerState:getName(),
								Career = playerState:getCareer(),
								Level = playerState:getLevel(),
								Msg = {GuildName, RoleID, RoleName, Career, Level, Denoter, Notice},
								case psMgr:call(?PsNameGuild, createGuild, Msg, ?Start_Link_TimeOut_ms) of
									{#rec_guild{guildID = GuildID}, #rec_guild_member{} = Member} ->
										%% 扣钱
										NeedMoney = getCreateGuildNeedMoney(),
										playerMoney:useCoin(?CoinUseTypeDiamondJustNotBind, NeedMoney,
											#recPLogTSMoney{reason = ?CoinUseCreateGuild, param = GuildID, target = ?PLogTS_Guild, source = ?PLogTS_PlayerSelf}),

										%%创建帮会成功增加成就
										playerAchieve:achieveEvent(?Achieve_Social_Event5, [1]),

										%% 创建帮会成功
										playerState:updateSelfGuildInfo(),

										playerGuildCopy:sendLastOverTime(),

										?LOG_OUT("createGuild success:~p", [Member]),

										%% 提示创建军团成功
										createGuildSuccess({RoleName, GuildName}),
										playerAchieve:achieveEvent(?Achieve_armygroup_build, [1]),
										true;
									_ ->
										%% 重名
										?LOG_OUT("createGuild failed:~s,~p,~p", [playerState:getName(), playerState:getRoleID(), GuildName]),
										playerMsg:sendErrorCodeMsg(?ErrorCode_GuildCreateFailedRepeatName),
										false
								end;
							_ ->
								playerMsg:sendErrorCodeMsg(?ErrorCode_GuildRequestGuildCDTime),
								false
						end;
					_ ->
						playerMsg:sendErrorCodeMsg(?ErrorCode_GuildCreateFailed),
						false
				end;
			ErrorCode ->
				playerMsg:sendErrorCodeMsg(ErrorCode),
				false
		end,

	%% 单独提示客户端
	playerMsg:sendNetMsg(#pk_GS2U_GuildOpResult{roleCode = playerState:getPlayerCode(), opType = 1, opResult = Result}),
	ok.

%% 公会创建成功
-spec createGuildSuccess(tuple()) -> ok.
createGuildSuccess({RoleName, GuildName}) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_GuildCreateSuccess, [RoleName, GuildName]),
	ok.

%% 能否创建军团
-spec canCreateGuild(GuildName :: list()) -> ErrorCode :: uint().
canCreateGuild(GuildName) ->
	case playerState:getGuildID() > 0 of
		true ->
			?ErrorCode_GuildCreateFailed;
		_ ->
			Level = getGuildJoinLevel(),
			case playerState:getLevel() < Level of
				true ->
					?ErrorCode_GuildCreateFailedLevel;
				_ ->
					LenMax = getGuildNameLen(),
					NameLen =  str:get_utf8_char_count(GuildName),
					case NameLen > LenMax of
						true ->
							?ErrorCode_GuildCreateFailedName;
						_ ->
							NeedMoney = getCreateGuildNeedMoney(),
							case playerMoney:canUseCoin(?CoinUseTypeDiamondJustNotBind, NeedMoney) =:= false of
								true ->
									?ErrorCode_GuildCreateFailedGold;
								_ ->
									0
							end
					end
			end
	end.

%% 解散公会
-spec deleteGuild() -> ok.
deleteGuild() ->
	GuildID = playerState:getGuildID(),
	case GuildID > 0 of
		true ->
			psMgr:sendMsg2PS(?PsNameGuild, deleteGuild, {GuildID, playerState:getRoleID()});
		_ ->
			false
	end,
	ok.

%% 公会被解散
-spec deleteGuildAck(boolean() | {true, RoleID::uint64(), Reason::uint()}) -> ok.
deleteGuildAck({true, RoleID, Reason}) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_GuildDeleteSuccess),

	leaveGuild(),

	%% 军团长主动解散，惩罚军团长
	case playerState:getRoleID() of
		RoleID ->
			playerMsg:sendNetMsg(#pk_GS2U_GuildOpResult{roleCode = playerState:getPlayerCode(), opType = 2, opResult = true}),
			case Reason of
				?DeleteGuildReason_ZD ->
					recordExitGuildTime(RoleID);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% 打开公会界面，获取数据
-spec openGuildForm() -> ok.
openGuildForm() ->
	%% 先更新一下数据
	playerState:updateSelfGuildInfo(),

	%% 有军团时，不显示军团列表，无军团时，显示其它军团列表
	GuildID = playerState:getGuildID(),

	%% 查询正式成员与申请成员
	queryGuildInfoAndMembers(),

	case GuildID > 0 of
		true ->
			%% 发送自己所在的公会信息给客户端
			sendGuildInfoToClient(),

			%% http://192.168.1.3:8080/browse/DDD-6273
			%% 副本开启后，加入的成员不会获取到帮会副本信息
			playerGuildCopy:sendLastOverTime(),
			ok;
		_ ->
			%% 发送军团列表
			guildList(1),
			ok
	end,
	ok.

%% 查看成员列表
-spec memberList(Page :: uint()) -> ok.
memberList(1) ->
	case playerState:getGuildID() > 0 of
		true ->
			queryGuildInfoAndMembers();
		_ ->
			skip
	end,
	sendGuildMemberListToClient(1),
	ok;
memberList(Page) when Page > 0 ->
	sendGuildMemberListToClient(Page),
	ok.

%% 发送自己所在的公会信息给客户端
-spec sendGuildInfoToClient() -> ok.
sendGuildInfoToClient() ->
	case playerState:getGuildInfo() of
		{#rec_guild{guildLevel = Lvl} = Guild, [#rec_guild_member{} | _] = MemberList, RequestList} ->
			#guildCfg{member_number = MaxMember} = getCfg:getCfgPStack(cfg_guild, Lvl),
			#rec_guild_member{power = Rolelvl} = playerState:getSelfGuildMember(),
			Contribute = playerState:getCoin(?CoinTypeGuildContribute),
			#globalsetupCfg{setpara = [Sec]} =
				getCfg:getCfgPStack(cfg_globalsetup, guild_request_notice_cd),
			TimeNow = time2:getTimestampSec(),
			CD =
				case Sec - TimeNow + Guild#rec_guild.recruit of
					CD_ when CD_ < 0 ->
						0;
					CD_ ->
						CD_
				end,
			R = #pk_GS2U_OpenGuildForm{
				guildID         = Guild#rec_guild.guildID,
				guildName       = Guild#rec_guild.guildName,
				guildLevel      = Lvl,
				fightForce      = Guild#rec_guild.fightForce,
				memberNumber    = erlang:length(MemberList),
				maxMemberNumber = MaxMember,
				resource        = Guild#rec_guild.resource,
				liveness        = Guild#rec_guild.liveness,
				notice          = Guild#rec_guild.notice,
				denoter         = Guild#rec_guild.denoter,
				shopLevel       = Guild#rec_guild.shopLevel,
				requestJoinNum  = length(RequestList),
				selfContribute  = Contribute,
				selfGuildLevel  = Rolelvl,
				cd  			= CD
			},

			playerMsg:sendNetMsg(R);
		_ ->
			skip
	end,
	ok.

%% 发送自己所在的公会成员到客户端
-spec sendGuildMemberListToClient(Page :: uint()) -> ok.
sendGuildMemberListToClient(Page) ->
	case playerState:getGuildInfo() of
		{#rec_guild{} = _Guild, [#rec_guild_member{} | _] = MemberList, _RequestList} ->
			MaxPage = myTrunc(length(MemberList) / ?GuildMemberPageNumber),
			SubList = lists:sublist(MemberList, (Page - 1) * ?GuildMemberPageNumber + 1, ?GuildMemberPageNumber),
			Fun =
				fun(#rec_guild_member{roleID = RoleID} = Member) ->
					{Code, Name, Lvl, _Career, VipLv, Combat, OfflineTime} = queryPlayerInfo(RoleID),


					#pk_GuildMemberInfo{
						roleID         = RoleID,
						roleCode       = Code,
						roleName       = Name,
						roleGuildLevel = Member#rec_guild_member.power,
						liveness       = Member#rec_guild_member.liveness,
						combatNum      = Combat,
						offlineTime    = OfflineTime,
						vipLevel       = VipLv,
						playerLevel    = Lvl
					}
				end,
			InfoList = lists:map(Fun, SubList),
			playerMsg:sendNetMsg(#pk_GS2U_RequestLookMemberList{nowPage = Page, maxPage = MaxPage, memberList = InfoList});
		_ ->
			skip
	end,
	ok.

%% 查看申请列表
-spec requestJoinGuildList() -> ok.
requestJoinGuildList() ->
	%% 判断自己的权限
	case getGuildSelfLevel() >= ?GuildMemLevel_ViceLeader of
		true ->
			{#rec_guild{} = _Guild, [#rec_guild_member{} | _] = _MemberList, RequestList} = playerState:getGuildInfo(),
			Fun =
				fun(#rec_guild_apply{roleID = RoleID} = Member) ->
					{Code, Name, Lvl, _Career, VipLv, Combat, _OfflineTime} = queryPlayerInfo(RoleID),
					#pk_GuildApplyMemberInfo{
						roleID         = RoleID,
						roleCode       = Code,
						roleName       = Name,
						combatNum      = Combat,
						vipLevel       = VipLv,
						playerLevel    = Lvl,
						applyTime      = Member#rec_guild_apply.applyTime
					}
				end,
			InfoList = lists:map(Fun, RequestList),
			playerMsg:sendNetMsg(#pk_GS2U_RequestJoinGuildList{requestList = InfoList});
		_ ->
			skip
	end,
	ok.

%% 招募成员
-spec recruitPlayer(TargetCode :: integer() | {#pk_GuildInfo{}, #pk_GuildMemberInfo{}, pid()}) -> ok.
recruitPlayer(TargetCode) when erlang:is_integer(TargetCode) ->
	case getGuildSelfLevel() >= ?GuildMemLevel_ViceLeader of
		true ->
			%% 获取远程玩家的进程id
			case playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode) of
				#rec_OnlinePlayer{pid = PlayerPid, roleID = TargetRoleID} ->
					case canJoinGuild(TargetRoleID) of
						true ->
							%% 发送本公会信息
							#rec_guild{guildLevel = Lvl, member = Member} = Guild = playerState:getSelfGuildInfo(),
							#rec_guild_member{} = Mem = playerState:getSelfGuildMember(),
							#guildCfg{member_number = MaxMember} = getCfg:getCfgPStack(cfg_guild, Lvl),
							case Member < MaxMember of
								true ->
									R = #pk_GuildInfo{
										guildID         = Guild#rec_guild.guildID,
										guildName       = Guild#rec_guild.guildName,
										guildLevel      = Guild#rec_guild.guildLevel,
										denoter			= Guild#rec_guild.denoter,
										fightForce      = Guild#rec_guild.fightForce,
										memberNumber    = Guild#rec_guild.member,
										maxMemberNumber = MaxMember,
										leaderName      = "",    %% 招募的时候，不显示领导者
										leaderRoleID    = 0,
										isRequest       = 0
									},
									SR = #pk_GuildMemberInfo{
										roleID         = playerState:getRoleID(),
										roleCode       = playerState:getPlayerCode(),
										roleName       = playerState:getName(),
										roleGuildLevel = Mem#rec_guild_member.power,
										liveness       = Mem#rec_guild_member.liveness,
										combatNum      = playerPropSync:getProp(?SerProp_PlayerHistoryForce),
										offlineTime    = 0,
										vipLevel       = playerState:getVip(),
										playerLevel    = playerState:getLevel()
									},
									psMgr:sendMsg2PS(PlayerPid, recruitPlayer, {R, SR, self()});
								_ ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_GuildRecruitMemberMax)
							end;
						_ ->
							%% 目标在CD时间内
							playerMsg:sendErrorCodeMsg(?ErrorCode_GuildRequestGuildCDTime_Target),
							false
					end;
				_ ->
					%% 目标不在线
					false
			end;
		_ ->
			skip
	end,
	ok;
recruitPlayer({#pk_GuildInfo{} = R, #pk_GuildMemberInfo{roleID = ZMRoleID, roleName = ZMRoleName}, ZMPid}) ->
	%% 接收到公会招募信息
	NeedLevel = getGuildJoinLevel(),
	case playerState:getLevel() >= NeedLevel of
		true ->
			GuildID = playerState:getGuildID(),
			case GuildID > 0 of
				true ->
					psMgr:sendMsg2PS(ZMPid, recruitPlayerAck, {playerState:getName(), 3}),
					skip;
				_ ->
					setZMPlayerPID(ZMRoleID, ZMPid),

					playerMsg:sendNetMsg(#pk_GS2U_Recruit{roleID = ZMRoleID, roleName = ZMRoleName, guildInfo = R})
			end;
		_ ->
			psMgr:sendMsg2PS(ZMPid, recruitPlayerAck, {playerState:getName(), 4}),
			playerMsg:sendErrorCodeMsg(?ErrorCode_JoinGuildFailed_PlayerLevel)
	end,
	ok.

%% 招募结果
-spec recruitPlayerAck({TargetName :: list(), 0 | 1 | 2 | 3}) -> ok.
recruitPlayerAck({TargetName, 0}) ->
	%% 对方拒绝
	playerMsg:sendErrorCodeMsg(?ErrorCode_GuildRecruitRefuse, [TargetName]),
	ok;
recruitPlayerAck({TargetName, 1}) ->
	%% 对方同意
	playerMsg:sendErrorCodeMsg(?ErrorCode_GuildRecruitAgree, [TargetName]),

	%% 军团内部提示
	Str = stringCfg:getString(playerJoinGuild, [TargetName]),
	guildChatNotice(Str),
	ok;
recruitPlayerAck({TargetName, 2}) ->
	%% 对方加入失败
	playerMsg:sendErrorCodeMsg(?ErrorCode_GuildRecruitJoinFailed, [TargetName]),
	ok;
recruitPlayerAck({TargetName, 3}) ->
	%% 对方已经有军团，招募失败
	playerMsg:sendErrorCodeMsg(?ErrorCode_GuildRecruitTargetHaveGuild, [TargetName]),
	ok;
recruitPlayerAck({_TargetName, 4}) ->
	%% 玩家等级不满足加入军团的条件
	playerMsg:sendErrorCodeMsg(?ErrorCode_JoinGuildFailed_PlayerLevel),
	ok.

%% 招募结果(1同意，0拒绝)
-spec agreeRecruit(GuildID :: uint(), ZMRoleID :: uint(), IsAgree :: uint()) -> ok.
agreeRecruit(_GuildID, ZMRoleID, 0) ->
	case getZMPlayerPID(ZMRoleID) of
		undefined ->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildRecruitTimeOut),
			skip;
		PID ->
			psMgr:sendMsg2PS(PID, recruitPlayerAck, {playerState:getName(), 0})
	end,
	ok;
agreeRecruit(GuildID, ZMRoleID, 1) ->
	%% 直接加入公会
	psMgr:sendMsg2PS(?PsNameGuild, agreeRecruit,
		{GuildID, ZMRoleID, playerState:getRoleID(), playerState:getName(), playerState:getCareer(), playerState:getLevel()}),
	ok.

%% 同意招募的结果
-spec agreeRecruitAck({ZMRoleID :: uint(), Ret :: boolean(), GuildName :: list()}) -> ok.
agreeRecruitAck({ZMRoleID, Ret, GuildName}) ->
	Result = case Ret of
				 true ->
					 %% 加入军团成功
					 1;
				 _ ->
					 %% 加入军团失败
					 2
			 end,

	%% 提示自己
	case Ret of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildAddSucc, [GuildName]);
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildAddFailed, [GuildName])
	end,

	case getZMPlayerPID(ZMRoleID) of
		undefined ->
			skip;
		PID ->
			%% 提示招募者
			psMgr:sendMsg2PS(PID, recruitPlayerAck, {playerState:getName(), Result})
	end,

	%% 查询自己的军团信息
	playerState:updateSelfGuildInfo(),
	ok.

%% 申请加入工会
-spec requestJoinGuild(GuildID :: uint()) -> ok.
requestJoinGuild(GuildID) ->
	case playerState:getGuildID() > 0 of
		true ->
			skip;
		_ ->
			NeedLevel = getGuildJoinLevel(),
			case playerState:getLevel() >= NeedLevel of
				true ->
					RoleID = playerState:getRoleID(),
					IsRequest = isRequestJoinGuild(GuildID, RoleID),
					case canJoinGuild() of
						true ->
							case IsRequest of
								false ->
									CancelID = requestJoinGuild_tryCancel(),

									%% 请求加入工会
									R = #rec_guild_apply{roleID = RoleID, guildID = GuildID, applyTime = time:getSyncTime1970FromDBS()},
									ets:insert(rec_guild_apply, R),

									noticeGuildApplyNumber(GuildID),
									playerMsg:sendNetMsg(#pk_GS2U_RequestJoinGuild_Ack{guildID = GuildID, cancelID = CancelID}),

									#globalsetupCfg{setpara = [Max]} =
										getCfg:getCfgPStack(cfg_globalsetup, guild_apply_maxcount),
									case CancelID of
										0 ->
											sendTipsMsg(true, ?ErrorCode_GuildRequestAddSucc, ?ErrorCode_GuildRequestAddFailed);
										_ ->
											playerMsg:sendErrorCodeMsg(?ErrorCode_GuildApplyMax, [Max, Max])
									end,
									ok;
								_ ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_GuildRequestGuildCDTimeRepeat)
							end;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_GuildRequestGuildCDTime)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_JoinGuildFailed_PlayerLevel)
			end
	end,
	ok.
-spec requestJoinGuild_tryCancel() -> CancelID::uint64()|0.
requestJoinGuild_tryCancel() ->
	RoleID = playerState:getRoleID(),
	case ets:lookup(rec_guild_apply, RoleID) of
		[] ->
			0;	%% 没有申请记录，忽略
		ListApply ->
			#globalsetupCfg{setpara = [Max]} =
				getCfg:getCfgPStack(cfg_globalsetup, guild_apply_maxcount),
			case erlang:length(ListApply) >= Max of
				true ->
					FunSort =
						fun(#rec_guild_apply{applyTime = T1}, #rec_guild_apply{applyTime = T2}) ->
							T1 < T2
						end,
					[#rec_guild_apply{guildID = CancelID} | T] = lists:sort(FunSort, ListApply),
					ets:delete(rec_guild_apply, RoleID),
					[ets:insert(rec_guild_apply, C) || C <- T],
					CancelID;
				_ ->
					0	%% 申请记录不足，忽略
			end
	end.

%% 通知军团申请个数变动
-spec noticeGuildApplyNumber(term()) -> ok.
noticeGuildApplyNumber({_GuildID, Number}) ->
	playerPropSync:setProp(?PriProp_GuildApplyNumber, Number),
	ok;
noticeGuildApplyNumber(GuildID) when erlang:is_integer(GuildID) andalso GuildID > 0 ->
	SelfRoleID = playerState:getRoleID(),

	%% 先取得申请个数
	FA =
		fun(#rec_guild_apply{guildID = GID}, Acc) ->
			case GuildID =:= GID of
				true -> Acc + 1;
				_ -> Acc
			end
		end,
	Number = ets:foldl(FA, 0, rec_guild_apply),

	List = getGuildMember(GuildID, [?GuildMemLevel_ViceLeader, ?GuildMemLevel_Leader]),
	FM =
		fun(#rec_guild_member{roleID = RID}) ->
			case SelfRoleID =:= RID of
				true -> playerPropSync:setProp(?PriProp_GuildApplyNumber, Number);
				_ ->
					case core:queryOnLineRoleByRoleID(RID) of
						#rec_OnlinePlayer{pid = Pid} ->
							psMgr:sendMsg2PS(Pid, noticeGuildApplyNumber, {GuildID, Number});
						_ -> skip
					end
			end
		end,
	lists:foreach(FM, List),
	ok.

%% 招募的成员同意加入工会的结果
joinGuildAck({1, Result, GuildID}) ->
	[#rec_guild{guildName = GuildName}] = ets:lookup(rec_guild, GuildID),

	playerState:updateSelfGuildInfo(),

	%% 直接加入工会的结果
	case Result of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildAddSucc, [GuildName]);
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildAddFailed, [GuildName])
	end,

	case Result of
		true ->
			%%% 重置军团任务
			%playerGuildHome:resetGuildHomeTask(),
			%%加入帮会成功增加成就
			playerAchieve:achieveEvent(?Achieve_Social_Event5, [1]);
		_ ->
			skip
	end,
	ok.

%% 管理员以上处理申请列表(1同意，0拒绝)
-spec dealRequestJoin(GuildID :: uint(), RoleIDList :: list(), IsAgree :: uint()) -> ok.
dealRequestJoin(GuildID, RoleIDList, IsAgree) ->
	case getGuildSelfLevel() >= ?GuildMemLevel_ViceLeader andalso playerState:getGuildID() =:= GuildID of
		true ->
			RoleID = playerState:getRoleID(),
			Fun =
				fun(TargetRoleID) ->
					psMgr:sendMsg2PS(?PsNameGuild, dealRequestJoin, {GuildID, RoleID, TargetRoleID, IsAgree})
				end,
			lists:foreach(Fun, RoleIDList),
			ok;
		_ ->
			skip
	end,
	ok.

%% 操作者操作结果
-spec dealRequestJoinAck({1, Ret :: boolean(), TargetName :: list()}) -> ok.
dealRequestJoinAck({1, Ret, TargetRoleID}) ->
	TargetName = playerNameUID:getPlayerNameByUID(TargetRoleID),
	case Ret of
		true ->
			%% 加入军团,发送军团副本信息
			playerGuildCopy:sendLastOverTime(),
			Str = stringCfg:getString(playerJoinGuild, [TargetName]),
			guildChatNotice(Str),

			noticeGuildApplyNumber(playerState:getGuildID()),
			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildDealJoinGuildSuccess, [TargetName]);
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildDealJoinGuildFailed, [TargetName])
	end,
	ok.

%% 退出工会
-spec exitGuild() -> ok.
exitGuild() ->
	GuildID = playerState:getGuildID(),
	case GuildID > 0 of
		true ->
			psMgr:sendMsg2PS(?PsNameGuild, exitGuild, {GuildID, playerState:getRoleID()});
		_ ->
			skip
	end,
	ok.

-spec exitGuildAck(Result :: boolean() | list()) -> ok.
exitGuildAck(TargetName) when erlang:is_list(TargetName) ->
	%% 退出军团
	Str = stringCfg:getString(playerExitGuild, [TargetName]),
	guildChatNotice(Str),
	ok;
exitGuildAck(Result) when erlang:is_boolean(Result) ->
	case Result of
		true ->
			recordExitGuildTime(playerState:getRoleID()),

			leaveGuild(),

			playerMsg:sendNetMsg(#pk_GS2U_GuildOpResult{roleCode = playerState:getPlayerCode(), opType = 3, opResult = true}),
			ok;
		_ -> skip
	end,
	sendTipsMsg(Result, ?ErrorCode_GuildExitSucc, ?ErrorCode_GuildExitFailed),
	ok.

%% 踢出工会
-spec kickGuild(TargetRoleID :: uint()) -> ok.
kickGuild(TargetRoleID) ->
	GuildID = playerState:getGuildID(),
	case GuildID =< 0 orelse getGuildSelfLevel() < ?GuildMemLevel_ViceLeader of
		true ->
			skip;
		_ ->
			psMgr:sendMsg2PS(?PsNameGuild, kickGuild, {GuildID, playerState:getRoleID(), TargetRoleID}),
			ok
	end,
	ok.

-spec kickGuildAck(Result :: boolean() | tuple()) -> ok.
kickGuildAck({TargetRoleID, Result}) ->
	TargetName = playerNameUID:getPlayerNameByUID(TargetRoleID),
	case Result of
		true ->
			GuildID = playerState:getGuildID(),
			playerGuildBattle:playerleaveGuild(GuildID, TargetRoleID),
			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildKickGuildMemberSuccess, [TargetName]);
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildKickGuildMemberFailed, [TargetName])
	end,
	ok;
kickGuildAck(Result) ->
	case Result of
		true ->
			case Result of
				true ->
					leaveGuild(),

					playerMsg:sendNetMsg(#pk_GS2U_GuildOpResult{roleCode = playerState:getPlayerCode(), opType = 3, opResult = true}),

					ok;
				_ -> skip
			end,
			sendTipsMsg(Result, ?ErrorCode_GuildBeKick, ?ErrorCode_GuildBeKick),
			ok;
		_ ->
			skip
	end,
	ok.

%% 赋予权限
-spec giveGuildPower(TargetRoleID :: uint(), TargetLvl :: uint()) -> ok.
giveGuildPower(TargetRoleID, TargetLvl) ->
	GuildID = playerState:getGuildID(),
	SelfLvl = getGuildSelfLevel(),
	case GuildID =< 0 orelse SelfLvl < ?GuildMemLevel_ViceLeader orelse TargetLvl >= SelfLvl orelse TargetLvl < ?GuildMemLevel_Normal of
		true ->
			skip;
		_ ->
			psMgr:sendMsg2PS(?PsNameGuild, giveGuildPower, {GuildID, playerState:getRoleID(), TargetRoleID, TargetLvl})
	end,
	ok.

-spec giveGuildPowerAck({Result :: boolean(), TargetRoleID :: uint64(), TargetLevel :: uint()}) -> ok.
giveGuildPowerAck({Result, TargetRoleID, TargetLevel}) ->
	sendTipsMsg(Result, ?ErrorCode_GuildSetPowerLevelSucc, ?ErrorCode_GuildSetPowerLevelFailed),

	case Result of
		true ->
			%% 通知自己，修改目标的权限成功
			Msg = #pk_GS2U_GivePower{targetRoleID = TargetRoleID, guileLevel = TargetLevel},
			playerMsg:sendNetMsg(Msg);
		_ ->
			skip
	end,
	ok.

%% 权限改变
-spec guildPowerLevelChange(Lvl :: uint()) -> ok.
guildPowerLevelChange(Lvl) ->
	%% 重新查询一下自己的公会
	playerState:updateSelfGuildInfo(),

	case Lvl < ?GuildMemLevel_Admin of
		true ->
			playerGuildWar:playerLeaveGuildWar();
		_ ->
			skip
	end,
	sendTipsMsg(true, ?ErrorCode_GuildPowerLevelChange, ?ErrorCode_GuildPowerLevelChange),
	ok.

%% 修改公告
-spec changeGuildNotice(Notice :: list()) -> ok.
changeGuildNotice(Notice) ->
	GuildID = playerState:getGuildID(),
	SelfLvl = getGuildSelfLevel(),
	case GuildID =< 0 orelse SelfLvl < ?GuildMemLevel_Leader orelse str:get_utf8_char_count(Notice) > 60 of
		true ->
			skip;
		_ ->
			psMgr:sendMsg2PS(?PsNameGuild, changeGuildNotice, {GuildID, playerState:getRoleID(), Notice})
	end,
	ok.

-spec changeGuildNoticeAck({Notice :: list(), Result :: boolean()}) -> ok.
changeGuildNoticeAck({Notice, Result}) ->
	sendTipsMsg(Result, ?ErrorCode_GuildChangeNoticeSucc, ?ErrorCode_GuildChangeNoticeFailed),
	playerMsg:sendNetMsg(#pk_GS2U_ChangeNotice{guildNotice = Notice}),
	ok.

%% 团长移交
-spec changeLeader(TargetRoleID :: uint()) -> ok.
changeLeader(TargetRoleID) ->
	GuildID = playerState:getGuildID(),
	SelfLvl = getGuildSelfLevel(),
	case GuildID =< 0 orelse SelfLvl =/= ?GuildMemLevel_Leader of
		true ->
			skip;
		_ ->
			psMgr:sendMsg2PS(?PsNameGuild, changeLeader, {GuildID, playerState:getRoleID(), TargetRoleID})
	end,
	ok.

-spec changeLeaderAck(Result :: boolean()) -> ok.
changeLeaderAck(Result) ->
	sendTipsMsg(Result, ?ErrorCode_GuildChangeLeaderSucc, ?ErrorCode_GuildChangeLeaderFailed),
	case Result of
		true ->
			playerState:updateSelfGuildInfo(),

			playerMsg:sendNetMsg(#pk_GS2U_GuildOpResult{roleCode = playerState:getPlayerCode(), opType = 4, opResult = Result});
		_ ->
			skip
	end,
	ok.

%% 获取在线公会成员的pid列表
-spec getOnlineMemberPid() -> list().
getOnlineMemberPid() ->
	getOnlineMemberPid(playerState:getGuildID()).
%% 获取在线公会成员的pid列表
-spec getOnlineMemberPid(GuildID :: uint64()) -> list().
getOnlineMemberPid(GuildID) ->
	getOnlinePidList(GuildID).

%% 获取自己的公会权限
-spec getGuildSelfLevel() -> uint().
getGuildSelfLevel() ->
	case playerState:getSelfGuildMember() of
		#rec_guild_member{power = Power} -> Power;
		_ -> 0
	end.

%% 向上取整
-spec myTrunc(Number :: float()) -> uint().
myTrunc(Number) ->
	Num = trunc(Number),
	case Num == Number of
		true ->
			Num;
		_ ->
			Num + 1
	end.

%% 发送系统消息到客户端
-spec sendTipsMsg(Result :: boolean(), Param1 :: uint(), Param2 :: uint()) -> ok.
sendTipsMsg(Result, Param1, Param2) ->
	case Result of
		true ->
			playerMsg:sendTipsErrorCodeMsg(Param1);
		_ ->
			playerMsg:sendTipsErrorCodeMsg(Param2)
	end,
	ok.

%% 设置招募者的pid
-spec setZMPlayerPID(ZMRoleID :: uint(), PID :: pid()) -> undefined | pid().
setZMPlayerPID(ZMRoleID, PID) ->
	put({zMPlayerPID, ZMRoleID}, {PID, time2:getTimestampSec()}).

%% 获取招募者的pid
-spec getZMPlayerPID(ZMRoleID :: uint()) -> undefined | pid().
getZMPlayerPID(ZMRoleID) ->
	TimeNow = time2:getTimestampSec(),
	case get({zMPlayerPID, ZMRoleID}) of
		undefined ->
			undefined;
		{Pid, TimeLast} ->
			#globalsetupCfg{setpara = [Sec]} =
				getCfg:getCfgPStack(cfg_globalsetup, guild_request_time),
			case TimeLast + Sec >= TimeNow of
				true ->
					erase({zMPlayerPID, ZMRoleID}),
					undefined;
				_ ->
					Pid
			end
	end.

-spec dealGuildMemberList(list()) -> ok.
dealGuildMemberList([#rec_guild_member{}|_] = MemberList) ->
	%% 对成员排序，在线的为第一顺序，职位为第二顺序，战斗力为第三顺序，活跃度为第四顺序
	Fun =
		fun(#rec_guild_member{roleID = RoleID1, power = Lvl1, liveness = Con1},
			#rec_guild_member{roleID = RoleID2, power = Lvl2, liveness = Con2}) ->
			Temp1 = case core:queryPlayerPidByRoleID(RoleID1) of
						offline -> 0;
						_ -> 1
					end,
			Temp2 = case core:queryPlayerPidByRoleID(RoleID2) of
						offline -> 0;
						_ -> 1
					end,
			Force1 =
				case core:queryRoleKeyInfoByRoleID(RoleID1) of
					#?RoleKeyRec{playerForce = F1} ->
						F1;
					_ ->
						0
				end,
			Force2 =
				case core:queryRoleKeyInfoByRoleID(RoleID2) of
					#?RoleKeyRec{playerForce = F2} ->
						F2;
					_ ->
						0
				end,
			if
				Temp1 =:= Temp2 ->
					if
						Lvl1 =:= Lvl2 ->
							if
								Force1 =:= Force2 ->
									Con1 > Con2;
								true ->
									Force1 > Force2
							end;
						true ->
							Lvl1 > Lvl2
					end;
				true ->
					Temp1 > Temp2
			end
		end,
	lists:sort(Fun, MemberList).

%% 获取创建军团需要的金钱
-spec getCreateGuildNeedMoney() -> uint().
getCreateGuildNeedMoney() ->
	case getCfg:getCfgPStack(cfg_globalsetup, guild_createCost) of
		#globalsetupCfg{setpara = [LValue]} ->
			LValue;
		_ ->
			?ERROR_OUT("[~p] No Config: [guild_createCost], ~p", [?MODULE, ?CreateGuildGold]),
			?CreateGuildGold
	end.

%% 玩家为军团捐献金钱
-spec playerDonateMoney(#pk_U2GS_DonateMoney{}) -> ok.
playerDonateMoney(#pk_U2GS_DonateMoney{moneyType = MType, moneyNumber = MNum})
	when MType =:= ?CoinTypeGold orelse MType =:= ?CoinTypeDiamond ->
	GuildID = playerState:getGuildID(),
	case GuildID > 0 andalso MNum > 0 of
		true ->
			{OneValue, MaxTimes, CurTimes} = case MType of
												 ?CoinTypeGold ->
													 {getConfig(guild_gold_onetime), getConfig(guild_goldmax_day),
														 playerDaily:getDailyCounter(?DailyType_GuildDonate, ?DonateGoldDailyCountType)};
												 ?CoinTypeDiamond ->
													 {getConfig(guild_dia_onetime), getConfig(guild_diamax_day),
														 playerDaily:getDailyCounter(?DailyType_GuildDonate, ?DonateDiamondDailyCountType)}
											 end,
			DiffTimes = MaxTimes - CurTimes,
			case OneValue =:= MNum andalso DiffTimes > 0 of
				true ->
					%% 可以捐献,扣钱
					case playerMoney:decCoin(MType, MNum,
						#recPLogTSMoney{reason = ?CoinUseGuildDonate, param = GuildID, target = ?PLogTS_Guild, source = ?PLogTS_PlayerSelf}) of
						true ->
							%AddGX = getConfig(guild_gx_add),
							AddSW = getConfig(guild_sw_add),
							addPlayerContriPrestige(AddSW, GuildID),

							case MType =:= ?CoinTypeGold of
								true ->
									%% 提示捐献成功
									playerDaily:incDailyCounter(?DailyType_GuildDonate, ?DonateGoldDailyCountType),
									Diff1 = MaxTimes - playerDaily:getDailyCounter(?DailyType_GuildDonate, ?DonateGoldDailyCountType),
									playerMsg:sendErrorCodeMsg(?ErrorCode_GuildDonateSuccess, [Diff1]),

									addPlayerContribute(?GuildSupplies_GoldDonate, 1);
								_ ->
									%% 提示捐献成功
									playerDaily:incDailyCounter(?DailyType_GuildDonate, ?DonateDiamondDailyCountType),
									playerMsg:sendErrorCodeMsg(?ErrorCode_GuildDonateSuccess2),

									addPlayerContribute(?GuildSupplies_DiamondDonate, 1)
							end,

							%% 返回捐献次数
							requestDonateTimes(MType);
						_ ->
							%% 金钱不足
							case MType of
								?CoinTypeGold ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_TradeGold);
								?CoinTypeDiamond ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_TradeDiamond);
								_ ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotEnoughMoney)
							end,
							ok
					end;
				_ ->
					%% 捐献失败，今日剩余
					playerMsg:sendErrorCodeMsg(?ErrorCode_GuildDonateFailed, [DiffTimes])
			end;
		_ ->
			skip
	end,
	ok.

%% 请求捐献次数
-spec requestDonateTimes(Type :: uint()) -> ok.
requestDonateTimes(Type) when Type =:= ?CoinTypeGold orelse Type =:= ?CoinTypeDiamond ->
	SYTimes =
		case Type of
			?CoinTypeGold ->
				getConfig(guild_goldmax_day) - playerDaily:getDailyCounter(?DailyType_GuildDonate, ?DonateGoldDailyCountType);
			?CoinTypeDiamond ->
				getConfig(guild_diamax_day) - playerDaily:getDailyCounter(?DailyType_GuildDonate, ?DonateDiamondDailyCountType)
		end,
	playerMsg:sendNetMsg(#pk_GS2U_ReturnDonateTimes{moneyType = Type, times = SYTimes}),

	#rec_guild{} = Guild = playerState:getSelfGuildInfo(),
	R = #pk_GS2U_DonateSuccess{
		guildID    = Guild#rec_guild.guildID,
		guildLevel = Guild#rec_guild.guildLevel,
		nowExp     = Guild#rec_guild.resource,
		roleID     = playerState:getRoleID(),
		contribute = playerState:getCoin(?CoinTypeGuildContribute)
	},
	playerMsg:sendNetMsg(R),
	ok.

getConfig(Key) ->
	case getCfg:getCfgPStack(cfg_globalsetup, Key) of
		#globalsetupCfg{setpara = [V]} ->
			V;
		_ ->
			0
	end.

addPlayerContribute(Type, Param) ->
	case playerState:getGuildID() > 0 of
		true ->
			WantAdd =
				if
					Type =:= ?GuildSupplies_GuildHome ->
						%% 军团工资与驻地任务增加物资
						Param;
					Type =:= ?GuildSupplies_CopyMap ->
						getContributeValue(Type, Param);
					Type =:= ?GuildSupplies_Task ->
						getContributeValue(Type, Param);
					Type =:= ?GuildSupplies_GoldDonate ->
						V = getContributeValue(Type, 1),
						V * Param;
					Type =:= ?GuildSupplies_DiamondDonate ->
						V = getContributeValue(Type, 1),
						V * Param;
					Type =:= ?GuildSupplies_UseItem ->
						%% 使用道具，直接增加
						Param;
					Type =:= ?GuildSupplies_GodBless ->
						%% 女神祈福，倍率已在外部计算，直接增加
						{_, ValueGodBless} = Param,
						ValueGodBless;
					Type =:= ?GuildSupplies_SnowmanDonate ->
						%% 堆雪人活动捐献材料，直接增加
						Param;
					true ->
						0
				end,

			case WantAdd > 0 of
				true ->
					%% 贡献点上限
					case canAddPlayerContribute(WantAdd) of
						0 ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_GuildContrionToMax),
							false;
						RealAdd when erlang:is_integer(RealAdd) andalso RealAdd > 0 ->
							addPlayerContribute(RealAdd),
							addPlayerLiveness(RealAdd),	%% 增加个人贡献时等量增加个人活跃
							true
					end;
				_ ->
					false
			end;
		_ ->
			false
	end.

%% 增加玩家军团贡献值
-spec addPlayerContribute(Value :: uint()) -> ok.
addPlayerContribute(Value) when erlang:is_integer(Value) andalso Value > 0 ->
	%% 计数
	playerDaily:addDailyCounter(?DailyType_Everyday, ?PlayerEveryDay_GuildContribute, Value),

	playerMsg:sendErrorCodeMsg(?ErrorCode_GuildContrionSuccess, [Value]),

	?DEBUG_OUT("addContribute:~p,~p,~p", [playerState:getRoleID(), playerState:getGuildID(), Value]),

	GuildID = playerState:getGuildID(),

	%% 增加个人军团贡献点
	playerMoney:addCoin(?CoinTypeGuildContribute, Value,
		#recPLogTSMoney{reason = ?CoinSourceGuildContri, param = GuildID, target = ?PLogTS_PlayerSelf, source = ?PLogTS_Guild}),

	%% 刷新贡献点
	freshGuildProp(GuildID),
	ok.

%% 增加玩家军团活跃度
addPlayerLiveness(Value) ->
	case playerState:getSelfGuildMember() of
		#rec_guild_member{guildID = GuildID} ->
			psMgr:sendMsg2PS(?PsNameGuild, addPlayerLiveness, {GuildID, playerState:getRoleID(), Value}),
			ok;
		_ ->
			skip
	end,
	ok.

%% 增加玩家军团声望值
-spec addPlayerContriPrestige(Value :: uint(), GuildID :: uint()) -> ok.
addPlayerContriPrestige(Value, GuildID) when erlang:is_integer(Value) andalso Value > 0 ->
	?DEBUG_OUT("addContriPrestige:~p,~p,~p", [playerState:getRoleID(), playerState:getGuildID(), Value]),
	playerMoney:addCoin(?CoinTypePrestige, Value,
		#recPLogTSMoney{reason = ?CoinSourceGuildContri, param = GuildID, target = ?PLogTS_PlayerSelf, source = ?PLogTS_Guild}),
	ok.

%% 记录退出军团时间
-spec recordExitGuildTime(RoleID :: uint64()) -> ok.
recordExitGuildTime(0) ->
	?ERROR_OUT("recordExitGuildTime self=~p, stack=~p", [playerState:getRoleID(), misc:getStackTrace()]),
	ok;
recordExitGuildTime(RoleID) ->
%%	?DEBUG_OUT("recordExitGuildTime:~p", [misc:getStackTrace()]),
	NowTime = time:getSyncTime1970FromDBS(),
	recordExitGuildTime(RoleID, NowTime).

-spec recordExitGuildTime(RoleID :: uint64(), NowTime :: uint64()) -> ok.
recordExitGuildTime(RoleID, NowTime) ->
	SelfRoleID = playerState:getRoleID(),
%% 	?LOG_OUT("recordExitGuildTime self=~p, target=~p, time=~p", [SelfRoleID, RoleID, NowTime]),
	F =
		fun() ->
			case mnesia:read(rec_player_data, RoleID, write) of
				[#rec_player_data{} = R] ->
					NR = R#rec_player_data{exitGuildTime = NowTime},

					%% 更新主表
					mnesia:write(rec_player_data, NR, write),
					%% 判断是不是在插入表
					case mnesia:read(new_rec_player_data, RoleID, write) of
						[#rec_player_data{}] ->
							mnesia:write(new_rec_player_data, NR, write);
						_ ->
							mnesia:write(update_rec_player_data, NR, write)
					end;
				_ ->
					%% 插入新数据
					Data = #rec_player_data{roleID = RoleID, exitGuildTime = NowTime},
					mnesia:write(rec_player_data, Data, write),
					mnesia:write(new_rec_player_data, Data, write)
			end
		end,
	case mnesia:transaction(F) of
		{atomic, _Val} ->
			true;
		Error ->
			?ERROR_OUT("recordExitGuildTime selfroleID=~p, target=~p, error=~p", [SelfRoleID, RoleID, Error])
	end,
	ok.

-spec canJoinGuild() -> boolean().
canJoinGuild() ->
	RoleID = playerState:getRoleID(),
	canJoinGuild(RoleID).

-ifdef(JoinGuildCDTime).
%% 自己定义了CD，用自己的CD
-spec canJoinGuild(RoleID :: uint64()) -> boolean().
canJoinGuild(RoleID) ->
	NowTime = time:getSyncTime1970FromDBS(),
	LastExitTime =
		case edb:dirtyReadRecord(rec_player_data, RoleID) of
			[#rec_player_data{exitGuildTime = T}] -> T;
			_ -> 0
		end,
	(NowTime - LastExitTime) >= ?JoinGuildCDTime.
-else.
%% 没有定义CD，取配置CD
-spec canJoinGuild(RoleID :: uint64()) -> boolean().
canJoinGuild(RoleID) ->
	NowTime = time:getSyncTime1970FromDBS(),
	LastExitTime =
		case edb:dirtyReadRecord(rec_player_data, RoleID) of
			[#rec_player_data{exitGuildTime = T}] -> T;
			_ -> 0
		end,
	#globalsetupCfg{setpara = [GuildCD]} = getCfg:getCfgPStack(cfg_globalsetup, guild_cd),
	(NowTime - LastExitTime) >= GuildCD.
-endif.

-spec canJoinGuild_Master(RoleID :: uint64()) -> boolean().
canJoinGuild_Master(RoleID) ->
	NowTime = time:getSyncTime1970FromDBS(),
	LastExitTime =
		case edb:dirtyReadRecord(rec_player_data, RoleID) of
			[#rec_player_data{exitGuildTime = T}] -> T;
			_ -> 0
		end,
	#globalsetupCfg{setpara = [GuildCD]} = getCfg:getCfgPStack(cfg_globalsetup, guild_cd_master),
	(NowTime - LastExitTime) >= GuildCD.

%% 只在打开军团主界面的时候查一次
queryGuildInfoAndMembers() ->
	GuildID = playerState:getGuildID(),
	case GuildID > 0 of
		true ->
			case ets:lookup(rec_guild, GuildID) of
				[#rec_guild{} = Guild] ->
					%% 正式成员
					AllMemberList = getGuildMember(GuildID),

					%% 申请成员
					MS = ets:fun2ms(fun(Apply) when Apply#rec_guild_apply.guildID =:= GuildID -> Apply end),
					AllApplyList = ets:select(rec_guild_apply, MS),

					AllMemberList2 = dealGuildMemberList(AllMemberList),

%%                    ?DEBUG_OUT("queryGuildInfoAndMembers:member:~p,apply:~p", [AllMemberList2, AllApplyList]),

					%% 这个是只请求成员列表的处理
					playerState:setGuildInfo({Guild, AllMemberList2, AllApplyList});
				_ ->
					playerState:setGuildInfo({{}, [], []})
			end;
		_ ->
			playerState:setGuildInfo({{}, [], []})
	end.

%% 获取目标军团的成员
-spec getGuildMember(GuildID :: uint64()) -> [#rec_guild_member{}, ...].
getGuildMember(GuildID) ->
	MS = ets:fun2ms(fun(Member) when Member#rec_guild_member.guildID =:= GuildID -> Member end),
	ets:select(rec_guild_member, MS).
getGuildMember(GuildID, LvlList) ->
	MemberList = getGuildMember(GuildID),
	lists:filter(fun(#rec_guild_member{power = Lvl}) -> lists:member(Lvl, LvlList) end, MemberList).

getOnlinePidList() ->
	getOnlinePidList(playerState:getGuildID()).
getOnlinePidList(GuildID) when erlang:is_integer(GuildID) andalso GuildID > 0 ->
	L = getGuildMember(GuildID, ?AllGuildMemberPower),
	getOnlinePidList(L);
getOnlinePidList([]) -> [];
getOnlinePidList([#rec_guild_member{} | _] = List) ->
	Fun =
		fun(#rec_guild_member{roleID = RoleID}, AccList) ->
			case core:queryPlayerPidByRoleID(RoleID) of
				Pid when erlang:is_pid(Pid) ->
					[Pid | AccList];
				_ ->
					AccList
			end
		end,
	lists:foldl(Fun, [], List);
getOnlinePidList(_)  -> [].


getOnlineNetPidList(GuildID) when erlang:is_integer(GuildID) andalso GuildID > 0 ->
	L = getGuildMember(GuildID, ?AllGuildMemberPower),
	getOnlineNetPidList(L);
getOnlineNetPidList([]) -> [];
getOnlineNetPidList([#rec_guild_member{} | _] = List) ->
	Fun =
		fun(#rec_guild_member{roleID = RoleID}, AccList) ->
			case core:queryNetPidByRoleID(RoleID) of
				Pid when erlang:is_pid(Pid) ->
					[Pid | AccList];
				_ ->
					AccList
			end
		end,
	lists:foldl(Fun, [], List);
getOnlineNetPidList(_)  -> [].

queryPlayerInfo(RoleID) ->
	case core:queryRoleKeyInfoByRoleID(RoleID) of
		{} ->
			{0, "", 0, ?Career_10_Warrior, 0, 0, 0};
		#?RoleKeyRec{roleName = Name, career = Career, level = Lvl, vipLv = VipLv, reputation = Reputation,
			maxForce = Maxforce, lastUpdateTime = LastUpdateTime, offlineTime = OfflineTime} ->
			Code = case core:queryOnLineRoleByRoleID(RoleID) of
					   #rec_OnlinePlayer{code = C} -> C;
					   _ -> 0
				   end,
			VipLvAdjust = mp_getOfflineVipLevel(Code, VipLv, Reputation),
			OffLineSeconds = offlineSeconds(Code, LastUpdateTime, OfflineTime),
			{Code, Name, Lvl, Career, VipLvAdjust, Maxforce, OffLineSeconds}
	end.

mp_getOfflineVipLevel(Code, CurVipLv, Reputation) ->
	%% 得到所有等级
	if
		Code =:= 0 andalso CurVipLv =< 0 andalso Reputation > 0 ->
			LvList = getCfg:get1KeyList(cfg_knighted_level),

			Fun =
				fun(Index) ->
					#knighted_levelCfg{exp = Exp} = getCfg:getCfgPStack(cfg_knighted_level, Index),
					RExp = if
							   Exp =:= 0 ->
								   ?MaxReputation;
							   Exp < 0 ->
								   ?MaxReputation;
							   true ->
								   Exp
						   end,
					Reputation >= RExp
				end,
			VipLevelList = lists:filter(Fun, LvList),
			case VipLevelList of
				LvlList when erlang:is_list(LvlList) andalso LvlList =/= [] ->
					erlang:max(0, lists:max(LvlList));
				_ ->
					0
			end;
		true ->
			CurVipLv
	end.

offlineSeconds(Code, LastUpdateTime, OfflineTime) ->
	OffLineSeconds =
		case Code of
			0 ->
				NowTime = time:getSyncTime1970FromDBS(),
				OffLineTimeMod =
					case OfflineTime > 0 of
						true -> OfflineTime;
						_ -> LastUpdateTime
					end,
				NowTime - OffLineTimeMod;
			_ -> 0
		end,
	if
		OffLineSeconds > 0 ->
			OffLineSeconds;
		true ->
			0
	end.

%% 离开军团(自己退或者被踢)
leaveGuild() ->
	GuildID = playerPropSync:getProp(?PubProp_GuildID),
	RoleID = playerState:getRoleID(),

	playerGuildWar:playerLeaveGuildWar(),
	playerGuildSkillAndBuff:removeGuildSkill() ,
	playerGuildFairground:callbackLeaveGuild(),
	playerGuildBattle:playerleaveGuild(GuildID, RoleID),

	%% 刷新兑换属性
	exchange_refresh_all(),

	%% 最后再更新自己的军团公共属性
	playerState:updateSelfGuildInfo(),
	ok.

getContributeValue(Type, Param) ->
	KeyList = getCfg:get1KeyList(cfg_guildsupplies),
	F =
		fun(Key, V) ->
			case getCfg:getCfgByArgs(cfg_guildsupplies, Key) of
				#guildsuppliesCfg{sourcematerial = Type, param = Param, quantity = Q} ->
					{break, Q};
				_ ->
					V
			end
		end,
	misc:mapAccList(KeyList, 0, F).

canAddPlayerContribute(0) -> 0;
canAddPlayerContribute(Value) ->
	Now = playerDaily:getDailyCounter(?DailyType_Everyday, ?PlayerEveryDay_GuildContribute),
	Max = getConfig(guild_suppliesOwn),
	Add = erlang:max(Max - Now, 0),
	erlang:min(Add, Value).

freshGuildProp(GuildID) ->
	case playerState:getRoleID() > 0 of
		true ->
			case ets:lookup(rec_guild, GuildID) of
				[#rec_guild{resource = Res, liveness = Liv}] ->
					SelfRec = playerState:getCoin(?CoinTypeGuildContribute),
					Msg = #pk_GS2U_RefreshGuildProp{guildID = GuildID, resource = Res, liveness = Liv, selfContribute = SelfRec},
					playerMsg:sendNetMsg(Msg),
					ok;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% 查询玩家的申请
queryGuildApply(GuildID, RoleID) ->
	case ets:lookup(rec_guild_apply, RoleID) of
		[#rec_guild_apply{}|_] = List ->
			lists:keyfind(GuildID, #rec_guild_apply.guildID, List);
		_ ->
			false
	end.

%% 是否申请过加入目标军团
isRequestJoinGuild(GuildID, RoleID) ->
	case ets:lookup(rec_guild_apply, RoleID) of
		[#rec_guild_apply{}|_] = List ->
			case lists:keyfind(GuildID, #rec_guild_apply.guildID, List) of
				#rec_guild_apply{} ->
					true;
				_ ->
					false
			end;
		_ ->
			false
	end.

getGuildShopID() ->
	case playerState:getSelfGuildInfo() of
		#rec_guild{shopLevel = Lvl} when Lvl > 0 ->
			#globalsetupCfg{setpara = List} = getCfg:getCfgPStack(cfg_globalsetup, guild_shop_level_ID),
			case lists:keyfind(Lvl, 1, List) of
				{Lvl, ShopID} ->
					ShopID;
				_ ->
					0
			end;
		_ ->
			0
	end.

%%% ====================================================================
%%% 女神祈福
%%% ====================================================================

%% 祈福请求
%% Type参考参考guildbless.typ
-spec godBless(Type::uint()) -> ok.
godBless(Type) ->
	%?DEBUG_OUT("[DebugForGuild] godBless Type:~p", [Type]),
	case playerState:getGuildID() of
		0 ->
			%% 没有加入家族
			playerMsg:sendNetMsg(?ErrorCode_GuildNotJoin);
		_ ->
			case godBless_CountAndCD() of
				0 ->
					case getCfg:getCfgByKey(cfg_guildbless, Type) of
						#guildblessCfg{} = Cfg ->
							case godBless_Coin(Cfg) of
								0 ->
									godBless_Bless(Cfg);
								{EC2, EP2} ->
									%?DEBUG_OUT("[DebugForGuild] godBless Error:~p", [{EC2, EP2}]),
									playerMsg:sendErrorCodeMsg(EC2, EP2)
							end;
						_ ->
							?ERROR_OUT("godBless can not find cfg from cfg_guildbless with Type:~p", [Type])
					end;
				{EC1, EP1} ->
					%?DEBUG_OUT("[DebugForGuild] godBless Error:~p", [{EC1, EP1}]),
					playerMsg:sendErrorCodeMsg(EC1, EP1)
			end
	end,
	ok.

%% 检查次数与冷却时间
-spec godBless_CountAndCD() -> 0 | {ErrorCode::uint32(), ErrorParam::list()}.
godBless_CountAndCD() ->
	%?DEBUG_OUT("[DebugForGuild] godBless_CountAndCD"),
	#globalsetupCfg{setpara = [CountMax, CD]} =
		getCfg:getCfgPStack(cfg_globalsetup, guild_godbless_limit),
	Count = playerDaily:getDailyCounter(?DailyType_Guild_GodBless, 0),
	%?DEBUG_OUT("[DebugForGuild] godBless_CountAndCD Count:~p CountMax:~p", [Count, CountMax]),
	case Count >= CountMax of
		true ->
			{?ErrorCode_GuildGodBlessCountMax, [CountMax]}; %% 已达最大限制
		_ ->
			TimeLast = playerPropSync:getProp(?PriProp_Guild_GodBless_LastTime),
			TimeNow = time:getSyncTimeFromDBS(),
			%?DEBUG_OUT("[DebugForGuild] godBless_CountAndCD CD:~p TimeLast:~p TimeNow:~p", [CD, TimeLast, TimeNow]),
			case TimeNow - TimeLast < CD of
				true ->
					{?ErrorCode_GuildGodBlessNotCoolDown, []};    %% 尚未冷却
				_ ->
					0
			end
	end.

%% 检查并扣除货币
-spec godBless_Coin(Cfg::#guildblessCfg{}) -> 0 | {ErrorCode::uint32(), ErrorParam::list()}.
godBless_Coin(#guildblessCfg{typ = Type, cost = Cost, costtype = CostType}) ->
	%?DEBUG_OUT("[DebugForGuild] godBless_Coin Type:~p Cost:~p CostType:~p", [Type, Cost, CostType]),
	case playerMoney:canUseCoin(CostType, Cost) of
		true ->
			case playerMoney:useCoin(
				CostType,
				Cost,
				#recPLogTSMoney{
					reason = ?CoinUseGuildGodBless,
					param = Type,
					target = ?PLogTS_Guild,
					source = ?PLogTS_PlayerSelf
				}
			) of
				true ->
					0;  %% 扣钱成功
				_ ->
					{?ErrorCode_GuildGodBlessNotEnoughGold, []} %% 扣钱失败
			end;
		_ ->
			{?ErrorCode_GuildGodBlessNotEnoughGold, []} %% 钱不够
	end.

%% 执行祝福
-spec godBless_Bless(Cfg::#guildblessCfg{}) -> ok.
godBless_Bless(#guildblessCfg{typ = Type, rate = Rate, contribute = Contribute, guildresource = Guildresource, guildliveness = Guildliveness}) ->
	%?DEBUG_OUT("[DebugForGuild] godBless_Bless Type:~p", [Type]),
	%%% 标记次数与时间
	CountOld = playerDaily:getDailyCounter(?DailyType_Guild_GodBless, 0),
	TimeNow = time:getSyncTimeFromDBS(),
	playerDaily:incDailyCounter(?DailyType_Guild_GodBless, 0),
	playerPropSync:setInt(?PriProp_Guild_GodBless_LastTime, TimeNow),
	%%% 添加资源_个人经验（受倍率影响）
	%% 祈福基础经验奖励=玩家等级*参数1+家族等级*参数2
	#globalsetupCfg{setpara = [P1, P2]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [500, 200000]},
			guild_godbless_param
		),
	ExpBase = playerState:getLevel() * P1 + playerState:getGuildLevel() * P2,
	Exp = erlang:trunc(ExpBase * Rate),
	playerBase:addExp(Exp, ?ExpSourceGuildGodBless, Type),
	%%% 添加资源_军团贡献
	addPlayerContribute(?GuildSupplies_GodBless, {Type, Contribute}),
	%%% 添加资源_军团资金
	GuildID = playerState:getGuildID(),
	addguildresource(GuildID, Guildresource),
	%%% 添加资源_军团活跃
	addguildliveness(GuildID, Guildliveness),
	%%% 反馈消息
	playerMsg:sendNetMsg(
		#pk_GS2U_Guild_GodBless_Ack{
			time = TimeNow,
			count = CountOld + 1
		}
	),
	%%% 新增并同步祈福进度（固定为1，未配置）
	psMgr:sendMsg2PS(?PsNameGuild, guild_godbless, {GuildID, 1}),
	godBless_Schedule(1),
	ok.

% 查询祈福进度
-spec godBless_Schedule() -> ok.
godBless_Schedule() ->
	Schedule =
		case playerState:getGuildID() of
			0 ->
				0;
			GuildID ->
				[#rec_guild{godBless = GodBless}] =
					ets:lookup(rec_guild, GuildID),
				GodBless
		end,
	godBless_Schedule_notice(Schedule).

-spec godBless_Schedule(AddSchedule::uint()) -> ok.
godBless_Schedule(AddSchedule) ->
	Schedule =
		case playerState:getGuildID() of
			0 ->
				0;
			GuildID ->
				[#rec_guild{godBless = GodBless}] =
					ets:lookup(rec_guild, GuildID),
				GodBless + AddSchedule
		end,
	godBless_Schedule_notice(Schedule).

-spec godBless_Schedule_notice(Schedule::uint()) -> ok.
godBless_Schedule_notice(Schedule) ->
	%% 从同步属性读取自身已领取的ID
	{TimeLast, ListID} = playerPropSync:getProp(?SerProp_Guild_GodBless_Schedule),
	ListIDNew =
		case ListID of
			[] ->
				ListID;
			_ ->
				case isToday(TimeLast) of
					true ->
						ListID;
					_ ->
						playerPropSync:setAny(?SerProp_Guild_GodBless_Schedule, {0, []}),
						[]
				end
		end,
	%% 反馈消息
	Msg = #pk_GS2U_Guild_GodBless_Schedule_Sync{
		schedule = Schedule,
		listID = ListIDNew
	},
	playerMsg:sendNetMsg(Msg).

%% 领取祈福进度奖励
-spec godBless_Schedule_Reward(ID::uint()) -> ok.
godBless_Schedule_Reward(ID) ->
	case playerState:getGuildID() of
		0 ->
			%% 没有加入家族
			playerMsg:sendNetMsg(?ErrorCode_GuildNotJoin);
		_ ->
			%% 验证ID是否有效
			case getCfg:getCfgPStack(cfg_guildbless_schedule, ID) of
				#guildbless_scheduleCfg{} = Cfg ->
					%% 是否已经领取
					case godBless_Schedule_Reward_check(ID) of
						false ->
							godBless_Schedule_Reward_mail(Cfg);
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_GuildGodBlessScheduleAlreadyGet)
					end;
				_ ->
					skip
			end
	end.

%% 验证是否已经领取
godBless_Schedule_Reward_check(ID) ->
	{TimeLast, ListID} = playerPropSync:getProp(?SerProp_Guild_GodBless_Schedule),
	{IsFind, ListIDNew} =
		case ListID of
			[] ->
				{false, [ID]};
			_ ->
				case isToday(TimeLast) of
					true ->
						case lists:any(fun(X) -> X =:= ID end, ListID) of
							true ->
								{true, ListID};
							_ ->
								{false, [ID | ListID]}
						end;
					_ ->
						{false, [ID]}
				end
		end,
	case IsFind of
		false ->
			TimeNow = time:getSyncTimeFromDBS(),
			playerPropSync:setAny(?SerProp_Guild_GodBless_Schedule, {TimeNow, ListIDNew});
		_ ->
			skip
	end,
	IsFind.

%% 邮件发奖
godBless_Schedule_Reward_mail(#guildbless_scheduleCfg{id = ID, itemID = ItemID}) ->
	%% 发奖
	case getCfg:getCfgPStack(cfg_item, ItemID) of
		#itemCfg{} ->
			RoleID = playerState:getRoleID(),
			case playerMail:createMailGoods(ItemID, 1, true, 0, RoleID, ?ItemSourceGuildGodblessSchedule) of
				[#recMailItem{}|_] = MailItemList ->
					Title = stringCfg:getString(guild_godbless_sr_title),
					Content = stringCfg:getString(guild_godbless_sr_content),
					mail:sendSystemMail(RoleID, Title, Content, MailItemList, "");
				_ ->
					?ERROR_OUT("godBless_Schedule_Reward_mail FunMail can not create mail goods ItemID:~p RoleID:~p", [ItemID, RoleID])
			end
	end,
	%% 同步的进度
	godBless_Schedule(),
	%% 通知客户端已领取
	playerMsg:sendNetMsg(#pk_GS2U_Guild_GodBless_Schedule_Reward_Ack{id = ID}),
	ok.

%% 输入时间（来源于time:getSyncTimeFromDBS/0）是否为当日的时间（凌晨4点开始算当日）
-spec isToday(Time::uint32()) -> boolean().
isToday(Time) ->
	TimeNow = time:getSyncTimeFromDBS(),
	{YMD, _} = time2:convertSecToDateTime(TimeNow),
	TimeBegin = calendar:datetime_to_gregorian_seconds({YMD, {4, 0, 0}}),
	Time >= TimeBegin andalso Time < TimeBegin + 86400.

%%% ====================================================================
%%% 家族商店
%%% ====================================================================

%% 购买请求
-spec shopBuy(ID::uint32(), Count::uint()) -> ok.
shopBuy(ID, Count) when Count > 0 ->
	%?DEBUG_OUT("[DebugForGuild] shopBuy ID:~p Count:~p", [ID, Count]),
	case playerState:getGuildID() of
		0 ->
			%% 没有加入家族
			playerMsg:sendNetMsg(?ErrorCode_GuildNotJoin);
		_ ->
			case getCfg:getCfgByKey(cfg_guildshop, ID) of
				#guildshopCfg{itemID = ItemID} = Cfg2 ->
					case getCfg:getCfgByKey(cfg_item, ItemID) of
						#itemCfg{} = Cfg1 ->
							case shopBuy_Bag(Cfg1, ID, Count) of
								0 ->
									case shopBuy_GuildLevel(Cfg2) of
										0 ->
											case shopBuy_Coin(Cfg2, Count) of
												0 ->
													shopBuy_Item(Cfg1, Cfg2, Count);
												_ ->
													skip
											end;
										_ ->
											skip
									end;
								_ ->
									skip
							end;
						_ ->
							?ERROR_OUT("shopBuy can not find cfg from cfg_item with ItemID:~p", [ItemID])   %% 道具表中没有这个，配置错误
					end;
				_ ->
					?ERROR_OUT("shopBuy can not find cfg from cfg_guildshop with ID:~p", [ID])   %% 家族商店表中没有这个，配置错误
			end
	end,
	ok.

%% 验证背包空间是否足够
-spec shopBuy_Bag(Cfg::#itemCfg{}, ID::uint(), Count::uint()) -> 0 | #pk_GS2U_Guild_ShopBuy_Ack{}.
shopBuy_Bag(#itemCfg{id = ItemID, itemType = ItemType, maxAmount = MaxAmount}, ID, Count) ->
	%?DEBUG_OUT("[DebugForGuild] shopBuy_Bag ItemType:~p", [ItemType]),
	BagType = playerPackage:getPackageType(ItemType),
	{_, RemainNum} = playerPackage:getCanPileItem(BagType, ItemID, Count, true, MaxAmount, 0),
	case RemainNum > 0 of
		true ->
			case playerPackage:getBagIdleSlotNum(BagType) > 0 of
				true ->
					0;  %% 不可堆叠，但有空余的位置
				_ ->
					%% 不可堆叠，没有空余的位置
					Msg =
						#pk_GS2U_Guild_ShopBuy_Ack{
							id = ID,
							count = 0,
							errorCode = ?ErrorCode_GuildShopBuyNotEnoughBag
						},
					playerMsg:sendNetMsg(Msg),
					Msg
			end;
		_ ->
			0   %% 可以堆叠，空间足够
	end.

%% 验证家族等级是否足够
-spec shopBuy_GuildLevel(Cfg::#guildshopCfg{}) -> 0 | #pk_GS2U_Guild_ShopBuy_Ack{}.
shopBuy_GuildLevel(#guildshopCfg{id = ID, itemID = ItemID, needLevel = NeedLevel}) ->
	%?DEBUG_OUT("[DebugForGuild] shopBuy_GuildLevel ItemID:~p NeedLevel:~p", [ItemID, NeedLevel]),
	case playerState:getGuildLevel() >= NeedLevel of
		true ->
			0;
		_ ->
			%% 家族等级不足
			Msg =
				#pk_GS2U_Guild_ShopBuy_Ack{
					id = ID,
					count = 0,
					errorCode = ?ErrorCode_GuildShopBuyItemIsLocked
				},
			playerMsg:sendNetMsg(Msg),
			Msg
	end.

%% 验证并消耗货币（本商店唯一指定法定货币：军团贡献）
-spec shopBuy_Coin(Cfg::#guildshopCfg{}, Count::uint()) -> 0 | #pk_GS2U_Guild_ShopBuy_Ack{}.
shopBuy_Coin(#guildshopCfg{id = ID, itemID = ItemID, cost = Cost}, Count) ->
	%?DEBUG_OUT("[DebugForGuild] shopBuy_Coin ItemID:~p Count:~p", [ItemID, Count]),
	Msg =
		#pk_GS2U_Guild_ShopBuy_Ack{
			id = ID,
			count = 0,	%% 此处为没有购买成功
			errorCode = ?ErrorCode_GuildShopBuyNotEnoughContribute
		},
	CostAll = Count * Cost,
	case playerMoney:canUseCoin(?CoinUseTypeGuildContribute, CostAll) of
		true ->
			case playerMoney:useCoin(
				?CoinUseTypeGuildContribute,
				CostAll,
				#recPLogTSMoney{
					reason = ?CoinUseGuildShopBuy,
					param = {ItemID, Count},
					target = ?PLogTS_Guild,
					source = ?PLogTS_PlayerSelf
				}
			) of
				true ->
					%% 军团贡献足够
					%% 消耗的军团贡献根据比率转换为家族资金（向下取整）

					0;
				_ ->
					playerMsg:sendNetMsg(Msg),
					Msg
			end;
		_ ->
			playerMsg:sendNetMsg(Msg),
			Msg
	end.

%% 发放道具
-spec shopBuy_Item(Cfg1::#itemCfg{}, Cfg2::#guildshopCfg{}, Count::uint()) -> ok.
shopBuy_Item(#itemCfg{id = ItemID, itemType = ItemType}, #guildshopCfg{id = ID}, Count) ->
	%?DEBUG_OUT("[DebugForGuild] shopBuy_Item ItemID:~p Count:~p", [ItemID, Count]),
	BagType = playerPackage:getPackageType(ItemType),
	CountOld = playerPackage:getGoodsNumByID(BagType, ItemID, true),
	Plog =
		#recPLogTSItem{
			old = CountOld,
			new = CountOld + Count,
			change = Count,
			target = ?PLogTS_PlayerSelf,
			source = ?PLogTS_Guild,
			changReason = ?ItemSourceGuildShopBuy,
			reasonParam = playerState:getGuildLevel(),
			gold = 0,
			goldtype = 0
		},
	playerPackage:addGoods(ItemID, Count, false, 0, Plog),
	Msg =
		#pk_GS2U_Guild_ShopBuy_Ack{
			id = ID,
			count = Count,
			errorCode = 0
		},
	playerMsg:sendNetMsg(Msg),
	ok.

%%% ====================================================================
%%% 兑换功能
%%% ====================================================================

%% 兑换请求
-spec exchange(ID::uint32(), Level::uint32()) -> ok.
exchange(ID, Level) ->
	%?DEBUG_OUT("[DebugForGuild] exchange ID:~p Level:~p", [ID, Level]),
	case playerState:getGuildID() of
		0 ->
			%% 没有加入家族
			playerMsg:sendNetMsg(?ErrorCode_GuildNotJoin);
		_ ->
			case getCfg:getCfgByKey(cfg_guildexchange, ID, Level) of
				#guildexchangeCfg{} = Cfg ->
					case exchange_GuildLevel(Cfg) of
						0 ->
							case exchange_Preposition(Cfg) of
								0 ->
									case exchange_Coin(Cfg) of
										0 ->
											exchange_refresh(Cfg);
										_ ->
											skip
									end;
								_ ->
									skip
							end;
						_ ->
							skip
					end;
				_ ->
					?ERROR_OUT("exchange can not find cfg from cfg_guildexchange with ID:~p Level:~p", [ID, Level])   %% 兑换功能表中没有这个，配置错误
			end
	end,
	ok.

%% 验证家族等级是否足够
-spec exchange_GuildLevel(Cfg::#guildexchangeCfg{}) -> 0 | #pk_GS2U_Guild_Exchange_Ack{}.
exchange_GuildLevel(#guildexchangeCfg{id = ID, level = Level, guildlevel = NeedGuildLevel}) ->
	GuildLevel = playerState:getGuildLevel(),
	%?DEBUG_OUT("[DebugForGuild] exchange_GuildLevel ID:~p Level:~p NeedGuildLevel:~p GuildLevel:~p", [ID, Level, NeedGuildLevel, GuildLevel]),
		case GuildLevel >= NeedGuildLevel of
		true ->
			0;
		_ ->
			%% 家族等级不足
			Msg =
				#pk_GS2U_Guild_Exchange_Ack{
					id = ID,
					level = Level,
					errorCode = ?ErrorCode_GuildExchangePropertyIsLocked
				},
			playerMsg:sendNetMsg(Msg),
			Msg
	end.

%% 验证是否已兑换前置（如果有）属性
-spec exchange_Preposition(Cfg::#guildexchangeCfg{}) -> 0 | #pk_GS2U_Guild_Exchange_Ack{}.
exchange_Preposition(#guildexchangeCfg{id = ID, level = 1}) ->
	%?DEBUG_OUT("[DebugForGuild] exchange_Preposition ID:~p Level:1", [ID]),
	0;  %% 没有前置，直接通过
exchange_Preposition(#guildexchangeCfg{id = ID, level = Level}) ->
	%?DEBUG_OUT("[DebugForGuild] exchange_Preposition ID:~p Level:~p", [ID, Level]),
	ListExchangeOld = playerPropSync:getProp(?SerProp_Guild_ExchangeMax),
	case lists:keyfind(ID, 1, ListExchangeOld) of
		{_, LevelMax} when Level =< LevelMax ->
			%% 无法重复兑换同一种类同一级别的属性
			MsgS =
				#pk_GS2U_Guild_Exchange_Ack{
					id = ID,
					level = Level,
					errorCode = ?ErrorCode_GuildExchangeCanNotAgain
				},
			playerMsg:sendNetMsg(MsgS),
			MsgS;
		{_, LevelMax} when LevelMax + 1 =:= Level ->
			0;
		_ ->
			%% 没找到前置或者前置不对，配置错误，忽略
			MsgR =
				#pk_GS2U_Guild_Exchange_Ack{
					id = ID,
					level = Level,
					errorCode = ?ErrorCode_GuildExchangePropertyIsLocked
				},
			playerMsg:sendNetMsg(MsgR),
			MsgR
	end.

%% 验证并消耗货币（本商店唯一指定法定货币：军团贡献）
-spec exchange_Coin(Cfg::#guildexchangeCfg{}) -> 0 | #pk_GS2U_Guild_Exchange_Ack{}.
exchange_Coin(#guildexchangeCfg{id = ID, level = Level, cost = Cost}) ->
	%?DEBUG_OUT("[DebugForGuild] exchange_Coin ID:~p Level:~p", [ID, Level]),
	Msg =
		#pk_GS2U_Guild_Exchange_Ack{
			id = ID,
			level = Level,
			errorCode = ?ErrorCode_GuildExchangeNotEnoughContribute
		},
	case playerMoney:canUseCoin(?CoinUseTypeGuildContribute, Cost) of
		true ->
			case playerMoney:useCoin(
				?CoinUseTypeGuildContribute,
				Cost,
				#recPLogTSMoney{
					reason = ?CoinUseGuildExchange,
					param = {ID, Level},
					target = ?PLogTS_Guild,
					source = ?PLogTS_PlayerSelf
				}
			) of
				true ->
					%% 军团贡献足够
					%% 根据配置比率转换为家族资金
					%% 每PA点军团贡献转换为PB点家族资金
					#globalsetupCfg{setpara = [PA, PB]} =
						getCfg:getCfgPStack(cfg_globalsetup, guild_shop_conver),
					Res = (Cost div PA) * PB,
					GuildID = playerState:getGuildID(),
					addguildresource(GuildID, Res),
					0;
				_ ->
					playerMsg:sendNetMsg(Msg),
					Msg
			end;
		_ ->
			playerMsg:sendNetMsg(Msg),
			Msg
	end.

%% 兑换完成后的刷新属性
-spec exchange_refresh(Cfg::#guildexchangeCfg{}) -> ok.
exchange_refresh(#guildexchangeCfg{id = ID, level = Level}) ->
	%?DEBUG_OUT("[DebugForGuild] exchange_refresh ID:~p Level:~p", [ID, Level]),
	%% 兑换并刷新
	ListExchangeMax = playerPropSync:getProp(?SerProp_Guild_ExchangeMax),
	case lists:keyfind(ID, 1, ListExchangeMax) of
		false ->
			playerPropSync:setAny(?SerProp_Guild_ExchangeMax, [{ID, Level} | ListExchangeMax]);
		_ ->
			ListExchangeNew = lists:keyreplace(ID, 1, ListExchangeMax, {ID, Level}),
			playerPropSync:setAny(?SerProp_Guild_ExchangeMax, ListExchangeNew)
	end,
	exchange_refresh_all(),
	%% 反馈消息
	playerMsg:sendNetMsg(
		#pk_GS2U_Guild_Exchange_Ack{
			id = ID,
			level = Level,
			errorCode = 0
		}
	),
	ok.

%% 刷新全部属性
-spec exchange_refresh_all() -> ok.
exchange_refresh_all() ->
	%?DEBUG_OUT("[DebugForGuild] exchange_refresh_all"),
	%% 计算属性
	{AddProps_Del, MultiProps_Del} = exchange_refresh_all_del(),
	ListExchangeMax = playerPropSync:getProp(?SerProp_Guild_ExchangeMax),
	{AddProps_Add, MultiProps_Add, ListExchangeNew} = exchange_refresh_all_add(ListExchangeMax),
	%% 刷新战斗属性
	playerPropSync:setAny(?SerProp_Guild_ExchangeCur, ListExchangeNew),
	playerCalcProp:changeProp_AddMulti(AddProps_Del, MultiProps_Del, AddProps_Add, MultiProps_Add, true),
	playerForce:calcPlayerForce(true),
	%% 同步已兑换的项目
	FunFilter =
		fun({ID_, Level_}, {LI, LL}) ->
			{[ID_ | LI], [Level_ | LL]}
		end,
	{ListID, ListLevel} =
		lists:foldl(FunFilter, {[], []}, ListExchangeMax),
	FunFind =
		fun({ID_, _}, LL) ->
			case lists:keyfind(ID_, 1, ListExchangeNew) of
				{_, Level_} ->
					[Level_ | LL];
				_ ->
					[0 | LL]
			end
		end,
	ListLevelCur = lists:foldl(FunFind, [], ListExchangeMax),
	Msg =
		#pk_GS2U_Guild_ExchangeAll_Sync{
			listID = ListID,
			listLevel = ListLevel,
			listLevelCur = ListLevelCur
		},
	%?DEBUG_OUT("[DebugForGuild] exchange_refresh_all~n~p", [Msg]),
	playerMsg:sendNetMsg(Msg),
	ok.

%% 刷新全部属性_计算删除旧有属性
-spec exchange_refresh_all_del() -> {AddProps_Del::list(), MultiProps_Del::list()}.
exchange_refresh_all_del() ->
	ListExchangeCur = playerPropSync:getProp(?SerProp_Guild_ExchangeCur),
	FunDelete =
		fun({ID, LevelCur}, {AddProps_Del, MultiProps_Del}) ->
			case getCfg:getCfgByKey(cfg_guildexchange, ID, LevelCur) of
				#guildexchangeCfg{property = [{0, PT, PV}]} ->
					case lists:keyfind(PT, 1, AddProps_Del) of
						false ->
							{[{PT, -PV} | AddProps_Del], MultiProps_Del};
						{_, _, PV_} ->
							{lists:keyreplace(PT, 1, AddProps_Del, {PT, PV_ - PV}), MultiProps_Del}
					end;
				#guildexchangeCfg{property = [{1, PT, PV}]} ->
					case lists:keyfind(PT, 1, MultiProps_Del) of
						false ->
							{AddProps_Del, [{PT, PV} | MultiProps_Del]};
						{_, _, PV_} ->
							{AddProps_Del, lists:keyreplace(PT, 1, MultiProps_Del, {PT, PV_ + PV})}
					end
			end
		end,
	R = lists:foldl(FunDelete, {[], []}, ListExchangeCur),
	playerPropSync:setAny(?SerProp_Guild_ExchangeCur, []),
	R.

%% 刷新全部属性_计算新增属性
-spec exchange_refresh_all_add(ListExchangeMax::list()) -> {AddProps_Add::list(), MultiProps_Add::list(), ListExchangeNew::list()}.
exchange_refresh_all_add(ListExchangeMax) ->
	case playerState:getGuildID() of
		0 ->
			{[], [], []};	%% 未加入家族
		_ ->
			#rec_guild{guildLevel = GuildLevel} = playerState:getSelfGuildInfo(),
			exchange_refresh_all_add_(ListExchangeMax, {[], [], []}, GuildLevel)
	end.
%% 计算属性
exchange_refresh_all_add_([], R, _GuildLevel) ->
	R;
exchange_refresh_all_add_([{ID, LevelMax} | T], {AddProps_Add, MultiProps_Add, ListExchangeNew}, GuildLevel) ->
	case exchange_refresh_all_add__({ID, LevelMax}, GuildLevel) of
		0 ->
			%% 没有有效的等级，略过
			exchange_refresh_all_add_(T, {AddProps_Add, MultiProps_Add, ListExchangeNew}, GuildLevel);
		#guildexchangeCfg{level = LevelCur, property = [{0, PT, PV}]} ->
			%% 需要添加加法属性
			R =
				case lists:keyfind(PT, 1, AddProps_Add) of
					false ->
						{[{PT, PV} | AddProps_Add], MultiProps_Add, [{ID, LevelCur} | ListExchangeNew]};
					{_, _, PV_} ->
						AddProps_AddNew = lists:keyreplace(PT, 1, AddProps_Add, {PT, PV_ + PV}),
						{AddProps_AddNew, MultiProps_Add, [{ID, LevelCur} | ListExchangeNew]}
				end,
			exchange_refresh_all_add_(T, R, GuildLevel);
		#guildexchangeCfg{level = LevelCur, property = [{1, PT, PV}]} ->
			%% 需要添加乘法属性
			R =
				case lists:keyfind(PT, 1, MultiProps_Add) of
					false ->
						{AddProps_Add, [{PT, PV} | MultiProps_Add], [{ID, LevelCur} | ListExchangeNew]};
					{_, _, PV_} ->
						MultiProps_New = lists:keyreplace(PT, 1, MultiProps_Add, {PT, PV_ + PV}),
						{AddProps_Add, MultiProps_New, [{ID, LevelCur} | ListExchangeNew]}
				end,
			exchange_refresh_all_add_(T, R, GuildLevel)
	end.
%% 计算有效等级
exchange_refresh_all_add__({_ID, 0}, _GuildLevel) ->
	0;	%% 没有找到符合要求的等级
exchange_refresh_all_add__({ID, Level}, GuildLevel) ->
	case getCfg:getCfgByKey(cfg_guildexchange, ID, Level) of
		#guildexchangeCfg{guildlevel = GuildLevel_} = Cfg when GuildLevel >= GuildLevel_ ->
			Cfg;	%% 当前家族等级必须满足配置所需家族等级
		_ ->
			exchange_refresh_all_add__({ID, Level - 1}, GuildLevel)	%% 不满足条件，查看下一级别
	end.

%% 请求指定公会信息
-spec queryGuildInfo(GuildID::uint64()) -> ok.
queryGuildInfo(GuildID) ->
	case playerState:getGuildID() of
		GuildID ->
			sendGuildInfoToClient();	%% 查询的是自己所在的公会
		_ ->
			case ets:lookup(rec_guild, GuildID) of
				[#rec_guild{guildLevel = Lvl, member = Member} = Guild] ->
					#guildCfg{member_number = MaxMember} = getCfg:getCfgPStack(cfg_guild, Lvl),
					Contribute = playerState:getCoin(?CoinTypeGuildContribute),
					R = #pk_GS2U_OpenGuildForm{
						guildID         = Guild#rec_guild.guildID,
						guildName       = Guild#rec_guild.guildName,
						guildLevel      = Lvl,
						fightForce      = Guild#rec_guild.fightForce,
						memberNumber    = Member,
						maxMemberNumber = MaxMember,
						resource        = Guild#rec_guild.resource,
						liveness        = Guild#rec_guild.liveness,
						notice          = Guild#rec_guild.notice,
						denoter         = Guild#rec_guild.denoter,
						shopLevel       = Guild#rec_guild.shopLevel,
						requestJoinNum  = 0,	%% 不能查看
						selfContribute  = Contribute,
						selfGuildLevel  = 0,	%% 没有
						cd				= 0		%% 不能查看
					},
					playerMsg:sendNetMsg(R);
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_Guild_TargetNotExist)
			end
	end.

%% 查询指定角色的家族信息
-spec queryGuildInfoByRoleID(RoleID::uint64()) -> ok.
queryGuildInfoByRoleID(RoleID) ->
	%?DEBUG_OUT("[DebugForGuild] queryGuildInfoByRoleID RoleID:~w", [RoleID]),
	Guild =
		case ets:lookup(rec_guild_member, RoleID) of
			[#rec_guild_member{guildID = GuildID_}] ->
				case ets:lookup(rec_guild, GuildID_) of
					[#rec_guild{} = Guild_] ->
						Guild_;
					_ ->
						[]
				end;
			_ ->
				[]
		end,
	%?DEBUG_OUT("[DebugForGuild] queryGuildInfoByRoleID RoleID:~w Guild:~w", [RoleID, Guild]),
	GuildInfo =
		case Guild of
			#rec_guild{
				guildID = GuildID,
				guildName = GuildName,
				guildLevel = GuildLevel,
				denoter = Denoter,
				fightForce = FightForce,
				member = MemberNumber
			} ->
				MaxMemberNumber =
					case getCfg:getCfgPStack(cfg_guild, GuildLevel) of
						#guildCfg{member_number = MaxMemberNumber_} ->
							MaxMemberNumber_;
						_ ->
							0
					end,
				MS = ets:fun2ms(
					fun(M) when
						M#rec_guild_member.power =:= ?GuildMemLevel_Leader,
						M#rec_guild_member.guildID =:= GuildID ->
						M#rec_guild_member.roleID
					end
				),
				[LeaderRoleID] = ets:select(rec_guild_member, MS),
				#pk_GuildInfo{
					guildID = GuildID,
					guildName = GuildName,
					guildLevel = GuildLevel,
					denoter = Denoter,
					fightForce = FightForce,
					memberNumber = MemberNumber,
					maxMemberNumber = MaxMemberNumber,
					leaderName = playerNameUID:getPlayerNameByUID(LeaderRoleID),
					leaderRoleID = LeaderRoleID,
					isRequest = 0
				};
			_ ->
				#pk_GuildInfo{
					guildID = 0,
					guildName = [],
					guildLevel = 0,
					denoter = 0,
					fightForce = 0,
					memberNumber = 0,
					maxMemberNumber = 0,
					leaderName = [],
					leaderRoleID = 0,
					isRequest = 0
				}
		end,
	%?DEBUG_OUT("[DebugForGuild] queryGuildInfoByRoleID RoleID:~w GuildInfo:~w", [RoleID, GuildInfo]),
	playerMsg:sendNetMsg(#pk_GS2U_QueryGuildInfoByRoleID_Ack{guildInfo = GuildInfo}).

%% 查询允许快速加入的战力条件
-spec fastJoin_Get(GuildID::uint64()) -> ok.
fastJoin_Get(GuildID) ->
	case ets:lookup(rec_guild, GuildID) of
		[#rec_guild{fastJoin = FastJoin}] ->
			R = #pk_GS2U_Guild_FastJoin_Set_Ack{
				guildID = GuildID,
				force = FastJoin
			},
			playerMsg:sendNetMsg(R);
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_Guild_TargetNotExist)
	end.

%% 设置允许快速加入的战力条件
-spec fastJoin_Set(GuildID::uint64(), Force::uint64()) -> ok.
fastJoin_Set(GuildID, Force) ->
	RoleID = playerState:getRoleID(),
	case ets:lookup(rec_guild_member, RoleID) of
		[#rec_guild_member{guildID = GuildID, power = ?GuildMemLevel_Leader}] ->
			case ets:lookup(rec_guild, GuildID) of
				[#rec_guild{fastJoin = Force}] ->
					%% 有权限，修改值等于现有值，直接反馈修改成功
					playerMsg:sendNetMsg(#pk_GS2U_Guild_FastJoin_Set_Ack{guildID = GuildID, force = Force});
				[#rec_guild{}] ->
					%% 有权限，通知公共进程操作
					psMgr:sendMsg2PS(?PsNameGuild, guild_fastJoin_Set, {GuildID, RoleID, Force});
				_ ->
					%% 没找到对应公会
					playerMsg:sendErrorCodeMsg(?ErrorCode_GuildFastJoinSetPowerless)
			end;
		_ ->
			%% 数据不对
			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildFastJoinSetPowerless)
	end.

%% 快速加入请求
-spec fastJoin() -> ok.
fastJoin() ->
	case playerState:getGuildID() > 0 of
		true ->
			%% 已经加入了公会
			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildFastJoinAlreadyJoin);
		_ ->
			RoleID = playerState:getRoleID(),
			case canJoinGuild(RoleID) of
				false ->
					%% 处于惩罚状态，无法加入公会
					playerMsg:sendErrorCodeMsg(?ErrorCode_GuildRequestGuildCDTime);
				_ ->
					%% 向公共进程请求快速加入
					Force = playerPropSync:getProp(?PriProp_PlayerForce),
					psMgr:sendMsg2PS(?PsNameGuild, guild_fastJoin, {RoleID, Force})
			end
	end,
	ok.

%% 发布招募
-spec oneKeyRecruit() -> ok.
oneKeyRecruit() ->
	%% 1.仅有族长、大长老可操作，其他人忽略
	case playerState:getGuildID() of
		GuildID when GuildID > 0 ->
			case playerState:getSelfGuildMember() of
				#rec_guild_member{power = Power} when Power >= ?GuildMemLevel_ViceLeader ->
					%% 2.验证CD
					case ets:lookup(rec_guild, GuildID) of
						[#rec_guild{recruit = Recruit}] ->
							#globalsetupCfg{setpara = [Sec]} =
								getCfg:getCfgPStack(cfg_globalsetup, guild_request_notice_cd),
							TimeNow = time2:getTimestampSec(),
							CD =
								case Sec - TimeNow + Recruit of
									CD_ when CD_ < 0 ->
										0;
									CD_ ->
										CD_
								end,
							case CD > 0 of
								true ->
									playerMsg:sendNetMsg(#pk_GS2U_OneKeyRecruit_Ack{cd = CD, ret = ?ErrorCode_GuildOneKeyRecruitCD});
								_ ->
									psMgr:sendMsg2PS(?PsNameGuild, oneKeyRecruit, {GuildID, playerState:getRoleID()})
							end
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

-spec oneKeyRecruitAck() -> ok.
oneKeyRecruitAck() ->
	case ets:lookup(rec_guild, playerState:getGuildID()) of
		[#rec_guild{guildName = Name, guildID = GuildID}] ->
			%% <t=X> X的值参考客户端枚举TNodeType
			Msg = stringCfg:getString(guild_request_notice, [Name, GuildID]),
			playerChat:onChannelSystemChatMsg(?CHAT_CHANNEL_SYSTEM, Msg);
		_ ->
			skip
	end,
	ok.
