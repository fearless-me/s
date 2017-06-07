%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%% 公会管理逻辑模块
%%% @end
%%% Created : 26. 八月 2014 16:59
%%%-------------------------------------------------------------------
-module(guildLogic).
-author("tiancheng").

-include("guildPrivate.hrl").

%% API
-export([
	binaryStringToList/1,
	canJoinGuild/2,
	saveToMySql/1,
	canCreateGuild/2,
	queryRoleGuildInfo/1,
	getGuildPower/2,
	getGuildName/1,
	canAddGuildLevel/2,
	deleteRequestRole/2,
	deleteTimeOutRequestRole/0,
	getGuildMaxLvlAndExp/0,
	getGuildLvlByExp/1,
	getOnlinePidList/1,
	getGuildLeaderRoleID/1,
    getGuildMember/1,
	getGuildMember/2,
	deleteGuild/1,
	guildRankFreshSuccess/1,
	getGuildLevelMaxNumber/2,
	targetGuildIsDelete/1,
	sendMail/8,
    updateGuildMemberAndForce/3,
    checkGuildIsDelete/0,
    repairGuildData/0,
    checkrepairGuildData/0,
	getGuildMemberByRoleID/1,
	getGuildNameByRoleID/1,

	useRide/2,				%% 游乐场_使用设施
	useRide_time/1,			%% 游乐场_计时消息
	tickForFairground/0,	%% 游乐场_长心跳
	freshRide/1,			%% 刷新游乐场设施
	maintainRide/0			%% 游乐场_维护
]).

%% 去掉已经超时的申请列表
-spec deleteTimeOutRequestRole() -> ok.
deleteTimeOutRequestRole() ->
	Count =
		case get(tickCountRequest) of
			undefined ->
				0;
			V ->
				V
		end,
	case Count >= 30 of
		true ->
			#globalsetupCfg{setpara = [Sec]} =
				getCfg:getCfgPStack(cfg_globalsetup, guild_apply_cd),
			Time = time:getSyncTime1970FromDBS() - Sec,
			FunFilter =
				fun(#rec_guild_apply{applyTime = T} = Rec, {IsHit, R}) ->
					case T > Time of
						true ->
							{IsHit, [Rec | R]};
						_ ->
							{true, R}
					end
				end,
			case ets:foldl(FunFilter, {false, []}, rec_guild_apply) of
				{true, ListFilter} ->
					ets:delete_all_objects(rec_guild_apply),
					lists:foreach(fun(R) -> ets:insert(rec_guild_apply, R) end, ListFilter);
				_ ->
					skip
			end,
			put(tickCountRequest, 0);
		_ ->
			put(tickCountRequest, Count + 1)
	end,
	ok.

%% 检查并修复军团数据(如果数据未改变，则最大60分钟检查一次，如果有改变，根据改变的军团多少逐渐递减，时间最小为1分钟)
-spec checkrepairGuildData() -> ok.
checkrepairGuildData() ->
    NT = time:getUTCNowSec(),
    {LT, DiffMinute} = guildState:getNextCheckGuildDataTime(),
    case NT - LT >= DiffMinute * 60 of
        true ->
            {_GuildNumber, ChangeNumber} = repairGuildData(),
            NewDiff =
                case ChangeNumber =:= 0 of
                    true -> erlang:min(DiffMinute + 1, 60);
                    _ -> erlang:max(DiffMinute - 1, 1)
                end,
            guildState:setNextCheckGuildDataTime({NT, NewDiff}),
            ok;
        _ ->
            skip
    end,
    ok.

%% 修复军团数据
-spec repairGuildData() -> {GuildNumber::uint(), ChangeNumber::uint()}.
repairGuildData() ->
    ?LOG_OUT("repairGuildData start..."),
    FMember =
        fun(#rec_guild_member{roleID = RoleID}, {Num, Force}) ->
            PlayerForce = core:queryPlayerMaxForce(RoleID),
            {Num + 1, Force + PlayerForce}
        end,
    FGuild =
        fun(#rec_guild{guildID = GuildID} = Guild, {GuildNum, ChangeNum}) ->
            MemberList = getGuildMember(GuildID),
            {Number, AllForce} = lists:foldl(FMember, {0, 0}, MemberList),

            NewGuild = Guild#rec_guild{member = Number, fightForce = AllForce},
            NewChange =
                case NewGuild =:= Guild of
                    true ->
                        ChangeNum;
                    _ ->
                        ?LOG_OUT("guild change:~p", [GuildID]),
                        ets:update_element(rec_guild, GuildID,
                            [
                                {#rec_guild.member, NewGuild#rec_guild.member},
                                {#rec_guild.fightForce, NewGuild#rec_guild.fightForce}
                            ]),
                        saveToMySql(NewGuild),
                        ChangeNum + 1
                end,
            {GuildNum + 1, NewChange}
        end,
    {GuildNumber, ChangeNumber} = ets:foldl(FGuild, {0, 0}, rec_guild),
    ?LOG_OUT("repairGuildData end, repair num [~p/~p]", [ChangeNumber, GuildNumber]),
    {GuildNumber, ChangeNumber}.

%% 检查军团是否需要解散
-spec checkGuildIsDelete() -> ok.
checkGuildIsDelete() ->
    case getCfg:getCfgByKey(cfg_globalsetup, guild_member_latelylogintime) of
        #globalsetupCfg{setpara = [CDS]} ->
            LatelyTimeList = guildState:getGuildUpdateTime(),
            NowTime = time:getSyncTime1970FromDBS(),
            F =
                fun(#rec_guild{guildID = GuildID}, AccList) ->
                    NeedVerification =
                        case lists:keyfind(GuildID, 1, LatelyTimeList) of
                            {GuildID, LatelyUpdateTime} ->
                                case NowTime - LatelyUpdateTime >= CDS of
                                    true ->
                                        true;
                                    _ ->
                                        {GuildID, LatelyUpdateTime}
                                end;
                            _ ->
                                true
                        end,

                    case NeedVerification of
                        true ->
                            LUTime = getGuildMemberLatelyUpdateTime(GuildID),
                            case NowTime - LUTime >= CDS of
                                true ->
                                    guildBase:onDeleteGuild(GuildID, ?DeleteGuildReason_BD),
                                    AccList;
                                _ ->
                                    [{GuildID, LUTime} | AccList]
                            end;
                        V ->
                            [V | AccList]
                    end
                end,
            NewLatelyTimeList = ets:foldl(F, [], rec_guild),
            guildState:setGuildUpdateTime(NewLatelyTimeList);
        _ ->
            ?ERROR_OUT("checkGuildIsDelete not config:guild_member_latelylogintime"),
            skip
    end,
    ok.

%% 获取所有成员中，最近的一次更新时间
getGuildMemberLatelyUpdateTime(GuildID) ->
    L = getGuildMember(GuildID),
    F =
        fun(#rec_guild_member{roleID = RoleID}, LatelyTime) ->
            case core:queryRoleKeyInfoByRoleID(RoleID) of
                #?RoleKeyRec{lastUpdateTime = UT} when UT > LatelyTime ->
                    UT;
                _ ->
                    LatelyTime
            end
        end,
    lists:foldl(F, 0, L).

%% 更新军团人数和战斗力
updateGuildMemberAndForce(GuildID, RoleID, IsAdd) ->
    case ets:lookup(rec_guild, GuildID) of
        [#rec_guild{member = Member, fightForce = Force} = Guild] ->
            PlayerForce = core:queryPlayerMaxForce(RoleID),
            case IsAdd of
                true ->
                    ets:update_element(rec_guild, GuildID, [{#rec_guild.member, Member+1},{#rec_guild.fightForce,PlayerForce+Force}]),
                    saveToMySql(Guild#rec_guild{member = Member+1, fightForce = PlayerForce+Force}),
                    ok;
                _ ->
                    ets:update_element(rec_guild, GuildID, [{#rec_guild.member, Member-1},{#rec_guild.fightForce,Force-PlayerForce}]),
                    saveToMySql(Guild#rec_guild{member = Member-1, fightForce = Force-PlayerForce}),
                    ok
            end;
        _ ->
            skip
    end,
    ok.

%% 能否创建工会
-spec canCreateGuild(RoleID::uint(), GuildName::list()) -> boolean().
canCreateGuild(RoleID, GuildName) ->
    case ets:lookup(rec_guild_member, RoleID) of
        [] ->
            MS = ets:fun2ms(fun(G) when G#rec_guild.guildName =:= GuildName -> G end),
            ets:select(rec_guild, MS) =:= [];
        _ ->
            false
    end.

%% 更新到数据库
-spec saveToMySql(Msg::tuple()) -> ok.
saveToMySql({deleteGuildWarPaid, GuildID}) ->
	gsSendMsg:sendMsg2DBServer(saveGuildWarPaidData, 0, GuildID),
	ok;
saveToMySql(#rec_guild_war_paid{} = Guild) ->
	gsSendMsg:sendMsg2DBServer(saveGuildWarPaidData, 0, Guild),
	ok;
saveToMySql({deleteGuildWar, Stage}) ->
	gsSendMsg:sendMsg2DBServer(saveGuildWarData, 0, Stage),
	ok;
saveToMySql(#rec_guild_war{} = GuildWar) ->
	gsSendMsg:sendMsg2DBServer(saveGuildWarData, 0, GuildWar),
	ok;
saveToMySql(Msg) ->
	%% 保存工会数据
	gsSendMsg:sendMsg2DBServer(saveGuildData, 0, Msg),
	ok.

%% 把从数据库中读出二进制字符串转换为list
-spec binaryStringToList(Data::binary() | list() | undefined) -> list().
binaryStringToList(Data) when erlang:is_binary(Data) ->
	binary_to_list(Data);
binaryStringToList(Other) when erlang:is_list(Other) ->
	Other;
binaryStringToList(undefined) ->
	[];
binaryStringToList(Other) ->
	?ERROR_OUT("~p binaryStringToList:~p", [?MODULE, Other]),
	[].

%% 判断能否加入工会
-spec canJoinGuild(GuildID::uint(), RoleID::uint()) -> boolean().
canJoinGuild(GuildID, RoleID) ->
    case ets:lookup(rec_guild_member, RoleID) of
        [#rec_guild_member{}] ->
            %% 已经加入，且是正式成员
            false;
        _ ->
            case ets:lookup(rec_guild, GuildID) of
                [#rec_guild{guildLevel = Lvl}] ->
                    %% 先更新公会总人数
                    Num = erlang:length(getGuildMember(GuildID)),

                    %% 判断工会是否达到最大人数
                    #guildCfg{member_number = MaxNum} = getCfg:getCfgPStack(cfg_guild, Lvl),
                    Num < MaxNum;
                _ ->
                    false
            end
    end.

%% 删除申请者
-spec deleteRequestRole(GuildID::uint(), RoleID::uint()) -> boolean().
deleteRequestRole(GuildID, RoleID) ->
	case ets:lookup(rec_guild_apply, RoleID) of
		[#rec_guild_apply{}|_] = List ->
            case lists:keyfind(GuildID, #rec_guild_apply.guildID, List) of
                #rec_guild_apply{} = Apply ->
                    ets:delete_object(rec_guild_apply, Apply),
                    true;
                _ ->
                    false
            end;
		_ ->
			false
	end.

%% 查询角色所在的帮派信息(确定角色是帮派的正式成员才能查出)
-spec queryRoleGuildInfo(RoleID::uint()) -> {#rec_guild{}, #rec_guild_member{}} | false.
queryRoleGuildInfo(RoleID) ->
    case ets:lookup(rec_guild_member, RoleID) of
        [#rec_guild_member{guildID = GuildID} = Member] ->
            case ets:lookup(rec_guild, GuildID) of
                [#rec_guild{} = Guild] ->
                    {Guild, Member};
                _ ->
                    false
            end;
        _ ->
            false
    end.

%% 查询成员的权限
-spec getGuildPower(GuildID::uint(), RoleID::uint()) -> integer().
getGuildPower(_GuildID, RoleID) ->
	%% 获取自己的权限
	case ets:lookup(rec_guild_member, RoleID) of
		[#rec_guild_member{power = Lvl}] ->
			Lvl;
		_ ->
			-1
	end.

%% 获取军团的名字
-spec getGuildName(GuildID::uint()) -> list().
getGuildName(GuildID) when erlang:is_integer(GuildID) andalso GuildID > 0 ->
	case ets:lookup(rec_guild, GuildID) of
		[#rec_guild{guildName = GuildName}] ->
			GuildName;
		_ ->
			""
	end;
getGuildName(_GuildID) -> "".

%% 能否增加某个职位的人数
-spec canAddGuildLevel(GuildID::uint(), Lvl::uint()) -> boolean().
canAddGuildLevel(GuildID, Lvl) ->
	Now = getGuildLevelNowNumber(GuildID, Lvl),
	Max = getGuildLevelMaxNumber(GuildID, Lvl),
	Now < Max.

-spec getGuildLevelNowNumber(GuildID::uint(), Lvl::uint()) -> uint().
getGuildLevelNowNumber(GuildID, Lvl) ->
	MemberList = getGuildMember(GuildID, [Lvl]),
	erlang:length(MemberList).

-spec getGuildLevelMaxNumber(GuildID::uint(), Lvl::uint()) -> uint().
getGuildLevelMaxNumber(GuildID, Lvl) ->
	[#rec_guild{guildLevel = GuildLvl}] = ets:lookup(rec_guild, GuildID),
	#guildCfg{leader_1 = L1, leader_2 = L2} = getCfg:getCfgPStack(cfg_guild, GuildLvl),
	if
		Lvl =:= ?GuildMemLevel_Admin ->
			L2;
		Lvl =:= ?GuildMemLevel_ViceLeader ->
			L1;
		Lvl =:= ?GuildMemLevel_Leader ->
			1;
		true ->
			%% 无限个
			9999999999999999
	end.

getGuildMaxLvlAndExp() ->
	L = getCfg:get1KeyList(cfg_guild),
	[MaxLvl|_] = lists:reverse(L),
	#guildCfg{need_res = MaxExp} = getCfg:getCfgPStack(cfg_guild, MaxLvl),
	{MaxLvl, MaxExp}.

getGuildLvlByExp(Exp) when erlang:is_integer(Exp) ->
	{MaxLvl, MaxExp} = getGuildMaxLvlAndExp(),
	case Exp >= MaxExp of
		false ->
			L = getCfg:get1KeyList(cfg_guild),
			Fun = fun(Lvl) ->
				#guildCfg{need_res = NextExp} = getCfg:getCfgPStack(cfg_guild, Lvl),
				Exp < NextExp
			end,
			[NowLvl|_] = lists:filter(Fun, L),
			NowLvl;
		_ -> MaxLvl
	end.

%% 军团被删除了
-spec deleteGuild(GuildID::uint64()) -> ok.
deleteGuild(GuildID) ->
	%% 通知GS，该军团解散了
%%	csSendMsg:sendMsg2AllGSServer(guildIsDeleted, GuildID),
	case ets:lookup(?EtsGuildFairground, GuildID) of
		[#recGuildFairground{mapPid = MapPID} = GuildFairground] ->
			?LOG_OUT("guildIsDeleted:~p", [GuildFairground]),
			case misc:is_process_alive(MapPID) of
				true ->
					psMgr:sendMsg2PS(MapPID, resetCopyMap, {});
				_ ->
					skip
			end,
			ok;
		_ ->
			skip
	end,
	ok.




%% 军团排行榜刷新成功了
-spec guildRankFreshSuccess({_RankNumber::uint(), GuildRankList::[{uint(), uint64()}, ...]}) -> ok.
guildRankFreshSuccess({_RankNumber, []}) ->
	ok;
guildRankFreshSuccess({_RankNumber, GuildRankList}) ->
	case ets:tab2list(rec_guild) of
		[] ->
			skip;
		[#rec_guild{} = Guild] ->
			%% 只有一个军团，这个驻地任务没法展开咯
			NewGuild = Guild#rec_guild{guildTaskTargetGuild = 0, guildTaskTime = 0},
            ets:insert(rec_guild, NewGuild),
			saveToMySql(NewGuild),
			ok;
		Guilds ->
			%% 先处理排行榜上的军团
			GuildRankList2 = lists:keysort(1, GuildRankList),
			GuildRankList3 = [GuildID || {_, GuildID} <- GuildRankList2],
			dealRankGuild(GuildRankList3, GuildRankList3),

			%% 再处理不在排行榜中的军团
			AllGuildIDs = [GuildID || #rec_guild{guildID = GuildID} <- Guilds],
			%% 过滤掉在排行榜上的军团
			F1 =
				fun(GuildID, Acc) ->
					case lists:member(GuildID, GuildRankList3) of
						true -> Acc;
						_ -> [GuildID | Acc]
					end
				end,
			OutGuildIDs = lists:foldl(F1, [], AllGuildIDs),
			dealNotRankGuild(AllGuildIDs, OutGuildIDs),
			ok
	end,
	ok.

-spec getOnlinePidList(GuildID::uint64()) -> [pid(),...].
getOnlinePidList(GuildID) ->
	L = getGuildMember(GuildID),
	Fun =
		fun(#rec_guild_member{roleID = RoleID}, AccList) ->
			case playerMgrOtp:getOnlinePlayerInfoByID(RoleID) of
				#rec_OnlinePlayer{pid = PPid} ->
					[PPid | AccList];
				_ ->
					AccList
			end
		end,
	lists:foldl(Fun, [], L).

%% 获取某军团长
-spec getGuildLeaderRoleID(GuildID::uint64()) -> RoleID::uint64().
getGuildLeaderRoleID(GuildID) ->
	case getGuildMember(GuildID, [?GuildMemLevel_Leader]) of
        [#rec_guild_member{roleID = RoleID}|_] -> RoleID;
        _ -> 0
    end.

%% 获取目标军团的成员
-spec getGuildMember(GuildID :: uint64()) -> [#rec_guild_member{}, ...].
getGuildMember(GuildID) ->
    MS = ets:fun2ms(fun(Member) when Member#rec_guild_member.guildID =:= GuildID -> Member end),
    ets:select(rec_guild_member, MS).
getGuildMember(GuildID, LvlList) ->
    MemberList = getGuildMember(GuildID),
    lists:filter(fun(#rec_guild_member{power = Lvl}) -> lists:member(Lvl, LvlList) end, MemberList).

dealRankGuild(_AllGuildRankList, []) ->
	ok;
dealRankGuild(AllGuildRankList, GuildRankList) ->
	SubList = lists:sublist(GuildRankList, 5),
	dealRankGuildTarget(AllGuildRankList, SubList, erlang:length(SubList)),
	dealRankGuild(AllGuildRankList, GuildRankList -- SubList).

dealRankGuildTarget(_AllGuildRankList, _, 0) ->
	ok;
dealRankGuildTarget(_AllGuildRankList, [], _) ->
	ok;
dealRankGuildTarget(AllGuildRankList, [GuildID], _) ->
	GuildRankList2 = lists:delete(GuildID, AllGuildRankList),
	TargetGuildID = getTargetGuildID(GuildRankList2),
	[#rec_guild{} = Guild] = ets:lookup(rec_guild, GuildID),
	NewGuild = Guild#rec_guild{guildTaskTargetGuild = TargetGuildID, guildTaskTime = time:getSyncTime1970FromDBS()},
    ets:insert(rec_guild, NewGuild),
	saveToMySql(NewGuild),
	ok;
dealRankGuildTarget(AllGuildRankList, [GuildID | RightList], Number) ->
	TargetGuildID = getTargetGuildID(RightList),
	[#rec_guild{} = Guild] = ets:lookup(rec_guild, GuildID),
	NewGuild = Guild#rec_guild{guildTaskTargetGuild = TargetGuildID, guildTaskTime = time:getSyncTime1970FromDBS()},
    ets:insert(rec_guild, NewGuild),
	saveToMySql(NewGuild),
	dealRankGuildTarget(AllGuildRankList, RightList ++ [GuildID], Number - 1).

getTargetGuildID([GuildID]) ->
	GuildID;
getTargetGuildID(List) ->
	Len = erlang:length(List),
	Rand = misc:rand(1, Len),
	lists:nth(Rand, List).

dealNotRankGuild(_AllGuildIDs, []) ->
	ok;
dealNotRankGuild(AllGuildIDs, OutGuildIDs) ->
	Len = erlang:length(AllGuildIDs) - 1,
	case Len > 0 of
		true ->
			NowTime = time:getSyncTime1970FromDBS(),
			F2 =
				fun(GuildID) ->
					AllGuildIDs2 = lists:delete(GuildID, AllGuildIDs),
					Rand = misc:rand(1, Len),
					TargetGuildID = lists:nth(Rand, AllGuildIDs2),
					[#rec_guild{} = Guild] = ets:lookup(rec_guild, GuildID),
					NewGuild = Guild#rec_guild{guildTaskTargetGuild = TargetGuildID, guildTaskTime = NowTime},
                    ets:insert(rec_guild, NewGuild),
					saveToMySql(NewGuild),
					ok
				end,
			lists:foreach(F2, OutGuildIDs),
			ok;
		_ ->
			skip
	end,
	ok.

%% 目标军团被解散
-spec targetGuildIsDelete(GuildID::uint64()) -> ok.
targetGuildIsDelete(JieShanGuildID) ->
	F =
		fun(#rec_guild{guildID = GID, guildTaskTargetGuild = TargetGuildID}, {All, Out}) ->
			case GID =:= JieShanGuildID of
				true ->
					%% 这个军团已经解散了，都不处理了
					{All, Out};
				_ ->
					case JieShanGuildID =:= TargetGuildID of
						true ->
							%% 这个军团需要重新分配
							{[GID | All], [GID | Out]};
						_ ->
							%% 这个军团目标存在，不需要重新分配
							{[GID | All], Out}
					end
			end
		end,
	{AllGuildIDs, OutGuildIDs} = ets:foldl(F, {[], []}, rec_guild),

	%% 重新分配目标军团ID
	dealNotRankGuild(AllGuildIDs, OutGuildIDs),
	ok.


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


%% 通过角色id获取军团的名字
-spec getGuildNameByRoleID(RoleID::uint()) -> list().
getGuildNameByRoleID(RoleID) when erlang:is_integer(RoleID) andalso RoleID > 0 ->
	case getGuildMemberByRoleID(RoleID) of
		{ok,#rec_guild_member{guildID = GuildID}}->
			case ets:lookup(rec_guild, GuildID) of
				[#rec_guild{guildName = GuildName}] ->
					GuildName;
				_ ->
					""
			end;
		_ ->
			""
	end;
getGuildNameByRoleID(_RoleID) -> "".

%% 通过角色id获取工会成员
getGuildMemberByRoleID( RoleID) ->
	case ets:lookup(rec_guild_member, RoleID) of
		[#rec_guild_member{}=GuildMember] ->
			{ok,GuildMember};
		_ ->
			{error,none}
	end.

%% 游乐场_使用设施
-spec useRide(FromPid::pid(), #recUseRide{}) -> ok.
useRide(FromPid, #recUseRide{
	type = ?RideUseType_Up,
	roleID = RoleID,
	netPid = NetPid,
	mapPid = MapPid,
	guildID = GuildID,
	rideID = RideID
} = UseRide) ->
	case playerGuildFairground:useRide_check(RoleID, NetPid, GuildID, RideID, true, MapPid) of
		false ->
			%% 失败时反馈角色进程以便返还计数和消费
			psMgr:sendMsg2PS(FromPid, guildFairground_rideAck, UseRide);
		#recGuildRideParam{} = P2 ->
			%% 将玩家添加到设施上
			useRideUp(UseRide, P2)
	end,
	ok;
useRide(_FromPid, #recUseRide{
	type = ?RideUseType_Down,
	roleID = RoleID,
	netPid = NetPid,
	mapPid = MapPid,
	guildID = GuildID,
	rideID = RideID
} = UseRide) ->
	case playerGuildFairground:useRide_check(RoleID, NetPid, GuildID, RideID, false, MapPid) of
		false ->
			skip;	%% 此处失败不需要反馈
		#recGuildRideParam{} = P2 ->
			%% 将玩家从设施上取下
			useRideDown(UseRide, P2)
	end,
	ok;
useRide(_FromPid, #recUseRide{
	type = ?RideUseType_Upgrade,
	roleID = RoleID,
	netPid = NetPid,
	guildID = GuildID,
	rideID = RideID,
	exParam = RideLevel
} = Data) ->
	case playerGuildFairground:useRide_check(RoleID, NetPid, GuildID, RideID) of
		false ->
			skip;	%% 此处失败不需要反馈
		{RideLevel, NeedRes, Res} ->
			%% 扣除资源并升级设施
			[#rec_guild{} = GuildOld] = ets:lookup(rec_guild, GuildID),
			GuildNew = GuildOld#rec_guild{resource = Res - NeedRes},
			RideOld = guildState:queryRide(GuildID, RideID),
			RideNew = RideOld#rec_guild_ride{rideLevel = RideLevel + 1},
			gsSendMsg:sendMsg2DBServer(saveGuildData, 0, [GuildNew, RideNew]),

			%% 更新内存数据
			#recGuildRide{listRide = ListRide} = guildState:queryGuildRide(GuildID),
			NewListRide = lists:keystore(RideID, #rec_guild_ride.rideID, ListRide, RideNew),
			ets:update_element(?EtsGuildRide, GuildID, {#recGuildRide.listRide, NewListRide}),

			%% 通知操作者以及目标游乐场中的角色
			Ride =
				#pk_Ride{
					id = RideID,
					level = RideLevel + 1,
					state = RideNew#rec_guild_ride.rideState
				},
			Role =
				case ets:lookup(?EtsGuildRideUser, RoleID) of
					[#recGuildRideUser{role = Role_}] ->
						Role_;
					_ ->
						#pk_RideRole{roleID = RoleID, guildID = GuildID, rideID = 0, seatID = 0, time = 0}
				end,
			useRideNotice(Ride, Role, ?RideUseType_Upgrade, GuildID, NetPid);
		Error ->
			?ERROR_OUT("useRide:~p,~p", [Data, Error])
	end,
	ok.

%% 乘坐
-spec useRideUp(P1::#recUseRide{}, P2::#recGuildRideParam{}) -> ok.
useRideUp(
	#recUseRide{
		type = ?RideUseType_Up,
		roleID = RoleID,
		rideID = RideID
	},
	#recGuildRideParam{
		guildID = GuildID,
		cfg =
			#guild_rideCfg{
				playerMax = PlayerMax,
				timeMin = TimeMin,
				timeMax = TimeMax
			},
		ride =
			#rec_guild_ride{
				rideLevel = RideLevel,
				rideState = RideState
			},
		listUser = ListUser
	}
) ->
	%% 选择一个位置用于乘坐
	FunSelectSeat =
		fun(SeatID, {_, _}) ->
			case lists:any(
				fun(#pk_RideRole{seatID = SeatID_}) ->
					SeatID =:= SeatID_
				end,
				ListUser
			) of
				false ->
					{true, SeatID};
				_ ->
					{false, 0}
			end
		end,
	{_, SeatID} = misc:foldlEx(FunSelectSeat, {false, 0}, lists:seq(1, PlayerMax)),

	%% 执行乘坐动作
	TimeNow = time:getSyncTimeFromDBS(),
	TimeMsg = {guildFairground_rideTime, self(), {RoleID, GuildID, RideID, SeatID, erlang:max(TimeMax - TimeMin, 1)}},
	TimeRef = erlang:send_after(TimeMin * 1000, self(), TimeMsg),
	GuildRideUser =
		#recGuildRideUser{
			roleID = RoleID,
			role =
				#pk_RideRole{
					roleID = RoleID,
					guildID = GuildID,
					rideID = RideID,
					seatID = SeatID,
					time = TimeNow
				},
			timeRef = TimeRef
		},
	ets:insert(?EtsGuildRideUser, GuildRideUser),
	%% 通知当前地图所有角色
	Ride =
		#pk_Ride{
			id = RideID,
			level = RideLevel,
			state = RideState
		},
	Role = GuildRideUser#recGuildRideUser.role,
	useRideNotice(Ride, Role, ?RideUseType_Up, GuildID, undefined),
	ok.

%% 取消乘坐
-spec useRideDown(P1::#recUseRide{}, P2::#recGuildRideParam{}) -> ok.
useRideDown(
	#recUseRide{
		type = ?RideUseType_Down,
		roleID = RoleID,
		rideID = RideID
	},
	#recGuildRideParam{
		guildID = GuildID,
		cfg =
			#guild_rideCfg{
				timeMin = TimeMin,
				buffID = BuffID
			},
		ride =
			#rec_guild_ride{
				rideLevel = RideLevel,
				rideState = RideState
			}
	}
) ->
	%% 获取乘客信息
	case ets:lookup(?EtsGuildRideUser, RoleID) of
		[#recGuildRideUser{role = #pk_RideRole{time = Time}, timeRef = TimeRef}] ->
			%% 判断是否需要添加BUFF
			TimeNow = time:getSyncTimeFromDBS(),
			TimeCost = TimeNow - Time,
			%% 添加BUFF
			case TimeCost >= TimeMin of
				true ->
					case core:queryOnLineRoleByRoleID(RoleID) of
						#rec_OnlinePlayer{pid = Pid} ->
							psMgr:sendMsg2PS(Pid, guildFairground_rideBuff, BuffID);
						_ ->
							skip
					end;
				_ ->
					skip
			end,
			%% 取消乘坐（包含取消计时器）
			erlang:cancel_timer(TimeRef),
			ets:delete(?EtsGuildRideUser, RoleID),
			%% 通知当前地图所有角色
			Ride =
				#pk_Ride{
					id = RideID,
					level = RideLevel,
					state = RideState
				},
			Role = #pk_RideRole{roleID = RoleID, guildID = GuildID, rideID = 0, seatID = 0, time = 0},
			useRideNotice(Ride, Role, ?RideUseType_Down, GuildID, undefined);
		_ ->
			%% 没有这个乘客的信息，忽略
			skip
	end,
	ok.

%% 使用设备后的消息通知
-spec useRideNotice(Ride::#pk_Ride{}, Role::#pk_RideRole{}, Type::typeRideUseType(), GuildID::uint64(), NetPid::pid()|undefined) -> ok.
useRideNotice(#pk_Ride{id = RideID} = Ride, #pk_RideRole{roleID = RoleID} = Role, Type, GuildID, NetPid) ->
	?DEBUG_OUT("guildID=~p, roleID=~p, rideID=~p, up=~p", [GuildID, RoleID, RideID, Type =:= ?RideUseType_Up]),
	Msg = #pk_GS2U_Guild_FairgroundRide_Sync{ride = Ride, role = Role, type = Type},
	ListNetPid =
		case {ets:lookup(?EtsGuildFairground, GuildID), NetPid} of
			{[#recGuildFairground{playerEts = PlayerEts}], undefined} ->
				FunFilter =
					fun
						(#recMapObject{netPid = NetPid_}, R) ->
							[NetPid_ | R]
					end,
				ets:foldl(FunFilter, [], PlayerEts);
			{[#recGuildFairground{playerEts = PlayerEts}], _} ->
				FunFilter =
					fun
						(#recMapObject{netPid = NetPid_}, R)
							when NetPid =/= NetPid_ ->
							[NetPid_ | R];
						(_, R) ->
							R
					end,
				[NetPid | ets:foldl(FunFilter, [], PlayerEts)];
			{_, undefined} ->
				[];
			_ ->
				[NetPid]
		end,
	lists:foreach(fun(NetPid_) -> playerMsg:sendNetMsg(NetPid_, Msg) end, ListNetPid).

-spec useRide_time({RoleID::uint64(), GuildID::uint64(), RideID::uint32(), SeatID::uint32(), TimeMax::uint32()}) -> ok.
useRide_time({RoleID, GuildID, RideID, _SeatID, undefined}) ->
	%% 满足了最大时间，执行取消乘坐逻辑
	NetPid =
		case core:queryOnLineRoleByRoleID(RoleID) of
			#rec_OnlinePlayer{netPid = NetPid_} ->
				NetPid_;
			_ ->
				undefined
		end,
	P1 =
		#recUseRide{
			type = ?RideUseType_Down,
			roleID = RoleID,
			netPid = NetPid,
			guildID = GuildID,
			rideID = RideID,
			exParam = undefined
		},
	Ride =
		#rec_guild_ride{
			rideLevel = RideLevel
		} = guildState:queryRide(GuildID, RideID),
	P2 =
		#recGuildRideParam{
			guildID = GuildID,
			cfg = getCfg:getCfgPStack(cfg_guild_ride, RideID, RideLevel),
			ride = Ride,
			listUser = playerGuildFairground:queryRideUser(GuildID, RideID)
		},
	useRideDown(P1, P2),
	ok;
useRide_time({RoleID, GuildID, RideID, SeatID, TimeMax}) ->
	%% 满足了最小时间，添加一次BUFF后继续计时
	#rec_guild_ride{
		rideLevel = RideLevel
	} = guildState:queryRide(GuildID, RideID),
	#guild_rideCfg{
		buffID = BuffID
	} = getCfg:getCfgPStack(cfg_guild_ride, RideID, RideLevel),
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{pid = Pid} ->
			psMgr:sendMsg2PS(Pid, guildFairground_rideBuff, BuffID);
		_ ->
			skip
	end,
	TimeMsg = {guildFairground_rideTime, self(), {RoleID, GuildID, RideID, SeatID, undefined}},
	TimeRef = erlang:send_after(TimeMax * 1000, self(), TimeMsg),
	ets:update_element(?EtsGuildRideUser, RoleID, [{#recGuildRideUser.timeRef, TimeRef}]),
	ok.

%% 游乐场长心跳
%% 用于更新设施是否开放的状态（不需要写入数据库）
-spec tickForFairground() -> ok.
tickForFairground() ->
	ListGuildRide = ets:tab2list(?EtsGuildRide),
	{
		ListRideWillSave,
		ListGuildRideWillUpdate
	} = tickForFairground_guild(ListGuildRide, [], [], getTimeMark()),
	lists:foreach(fun(R) -> ets:insert(?EtsGuildRide, R) end, ListGuildRideWillUpdate),
	%% 对于进入维护状态的设施，强制玩家取消乘坐
	useRideDownF(ListRideWillSave),
	ok.
-spec tickForFairground_guild(
	ListGuildRideIn::[#recGuildRide{}, ...],
	ListRideWillSaveAcc::[#rec_guild_ride{}, ...],
	ListGuildRideWillUpdateAcc::[#recGuildRide{}, ...],
	TimeMark::uint()
) ->
	{
		ListRideWillSaveOut::[#rec_guild_ride{}, ...],
		ListGuildRideWillUpdateOut::[#recGuildRide{}, ...]
	}.
tickForFairground_guild([], ListRideWillSaveAcc, ListGuildRideWillUpdateAcc, _TimeMark) ->
	{ListRideWillSaveAcc, ListGuildRideWillUpdateAcc};
tickForFairground_guild(
	[#recGuildRide{guildID = GuildID, listRide = ListRide} = H | T],
	ListRideWillSaveAcc,
	ListGuildRideWillUpdateAcc,
	TimeMark
) ->
	case ets:lookup(?EtsGuildFairground, GuildID) of
		[#recGuildFairground{}] ->
			ListRideSort = lists:sort(fun sortRide/2, ListRide),
			case tickForFairground_ride(ListRideSort, ListRideWillSaveAcc, [], TimeMark) of
				{ListRideWillSaveAccNew, ListRideSort} ->
					tickForFairground_guild(T, ListRideWillSaveAccNew, ListGuildRideWillUpdateAcc, TimeMark);
				{ListRideWillSaveAccNew, ListRideNew} ->
					tickForFairground_guild(T, ListRideWillSaveAccNew, [H#recGuildRide{listRide = ListRideNew} | ListGuildRideWillUpdateAcc], TimeMark)
			end;
		_ ->
			tickForFairground_guild(T, ListRideWillSaveAcc, ListGuildRideWillUpdateAcc, TimeMark)
	end.
-spec tickForFairground_ride(
	ListRideIn::[#rec_guild_ride{}, ...],
	ListRideWillSaveAcc::[#rec_guild_ride{}, ...],
	ListRideAcc::[#rec_guild_ride{}, ...],
	TimeMark::uint()
) ->
	{
		ListRideWillSaveAccNew::[#rec_guild_ride{}, ...],
		ListRideOut::[#rec_guild_ride{}, ...]
	}.
tickForFairground_ride([], ListRideWillSaveAcc, ListRideAcc, _TimeMark) ->
	{ListRideWillSaveAcc, lists:reverse(ListRideAcc)};
tickForFairground_ride(
	[#rec_guild_ride{rideState = ?RideState_Maintain} = H | T],
	ListRideWillSaveAcc,
	ListRideAcc,
	TimeMark
) ->
	tickForFairground_ride(T, ListRideWillSaveAcc, [H | ListRideAcc], TimeMark);
tickForFairground_ride(
	[#rec_guild_ride{rideID = RideID, rideLevel = RideLevel, rideState = RideState} = H | T],
	ListRideWillSaveAcc,
	ListRideAcc,
	TimeMark
) ->
	RideStateNew = getGuildRideConfigState(RideID, RideLevel, TimeMark),
	case RideStateNew of
		RideState ->
			tickForFairground_ride(T, ListRideWillSaveAcc, [H | ListRideAcc], TimeMark);
		_ ->
			HNew = H#rec_guild_ride{rideState = RideStateNew},

			?LOG_OUT("tick guild=~p, ride=~p, level=~p state=~p -> ~p",
				[H#rec_guild_ride.guildID, RideID, RideLevel, H#rec_guild_ride.rideState, RideStateNew]),

			tickForFairground_ride(T, [HNew | ListRideWillSaveAcc], [HNew | ListRideAcc], TimeMark)
	end.

getTimeMark() ->
	TimeNow = time:getSyncTime1970FromDBS() + time2:getTimezoneSec(),
	{_, {Hour, Minute, _Second}} = time:convertSec2DateTime(TimeNow),
	Hour * 60 + Minute.

%% 获取指定游乐设施，指定等级的当前时间状态
getGuildRideConfigState(RideID, RideLevel, TimeMark) ->
	case getCfg:getCfgPStack(cfg_guild_ride, RideID, RideLevel) of
		#guild_rideCfg{timeBegin = undefined, timeEnd = undefined} ->
			?RideState_Open;
		#guild_rideCfg{timeBegin = [H1, M1], timeEnd = [H2, M2]}
			when TimeMark >= H1 * 60 + M1, TimeMark < H2 * 60 + M2 ->
			?RideState_Open;
		_ ->
			?RideState_Close
	end.

%% 刷新游乐场设施
-spec freshRide(#rec_guild{}) -> #rec_guild{}.
freshRide(#rec_guild{guildID = GuildID} = Guild) ->
	%% 军团资金变动，设施重新打开
	GuildRide = guildState:queryGuildRide(GuildID),
	{
		ListRideWillSave,
		ListGuildRideWillUpdate,
		ListGuildWillSave
	} = maintainRide_guild(true, [GuildRide], [], [], []),
	lists:foreach(fun(R) -> ets:insert(?EtsGuildRide, R) end, ListGuildRideWillUpdate),
	lists:foreach(fun(R) -> ets:insert(rec_guild, R) end, ListGuildWillSave),
	gsSendMsg:sendMsg2DBServer(saveGuildData, 0, ListGuildWillSave ++ ListRideWillSave),
	case ListGuildWillSave of
		[#rec_guild{} = NewGuild] -> NewGuild;
		[] -> Guild
	end.

%% 游乐场维护
%% 用于更新设施是否维护的状态（需要写入数据库）
-spec maintainRide() -> ok.
maintainRide() ->
	%% 该花钱花钱，没钱进入维护，变动的家族数据和设施数据需要写入数据库
	ListGuildRide = ets:tab2list(?EtsGuildRide),
	{
		ListRideWillSave,
		ListGuildRideWillUpdate,
		ListGuildWillSave
	} = maintainRide_guild(false, ListGuildRide, [], [], []),
	lists:foreach(fun(R) -> ets:insert(?EtsGuildRide, R) end, ListGuildRideWillUpdate),
	lists:foreach(fun(R) -> ets:insert(rec_guild, R) end, ListGuildWillSave),
	gsSendMsg:sendMsg2DBServer(saveGuildData, 0, ListGuildWillSave ++ ListRideWillSave),
	%% 对于进入维护状态的设施，强制玩家取消乘坐
	useRideDownF(ListRideWillSave),
	ok.
-spec maintainRide_guild(
	ResChanged :: boolean(),
	ListGuildRideIn::[#recGuildRide{}, ...],
	ListRideWillSaveAcc::[#rec_guild_ride{}, ...],
	ListGuildRideWillUpdateAcc::[#recGuildRide{}, ...],
	ListGuildWillSaveAcc::[#rec_guild{}, ...]
) ->
	{
		ListRideWillSaveOut::[#rec_guild_ride{}, ...],
		ListGuildRideWillUpdateOut::[#recGuildRide{}, ...],
		ListGuildWillSaveOut::[#rec_guild{}, ...]
	}.
maintainRide_guild(_ResChanged, [], ListRideWillSaveAcc, ListGuildRideWillUpdateAcc, ListGuildWillSaveAcc) ->
	{ListRideWillSaveAcc, ListGuildRideWillUpdateAcc, ListGuildWillSaveAcc};
maintainRide_guild(
	ResChanged,
	[#recGuildRide{guildID = GuildID, listRide = ListRide} = H | T],
	ListRideWillSaveAcc,
	ListGuildRideWillUpdateAcc,
	ListGuildWillSaveAcc
) ->
	ListRideSort = lists:sort(fun sortRide/2, ListRide),
	[Guild] = ets:lookup(rec_guild, GuildID),
	case maintainRide_ride(ResChanged, ListRideSort, ListRideWillSaveAcc, [], Guild) of
		{ListRideWillSaveAccNew, ListRideNew, Guild} ->	%% 没扣钱，表示所有设施都需要维护
			maintainRide_guild(ResChanged, T, ListRideWillSaveAccNew, [H#recGuildRide{listRide = ListRideNew} | ListGuildRideWillUpdateAcc], ListGuildWillSaveAcc);
		{ListRideWillSaveAccNew, ListRideSort, GuildNew} ->	%% 所有设施都没有维护，肯定扣了钱
			maintainRide_guild(ResChanged, T, ListRideWillSaveAccNew, ListGuildRideWillUpdateAcc, [GuildNew | ListGuildWillSaveAcc]);
		{ListRideWillSaveAccNew, ListRideNew, GuildNew} -> %% 也许只是维护了部分设施
			maintainRide_guild(ResChanged, T, ListRideWillSaveAccNew, [H#recGuildRide{listRide = ListRideNew} | ListGuildRideWillUpdateAcc], [GuildNew | ListGuildWillSaveAcc])
	end.

-spec sortRide(#rec_guild_ride{}, #rec_guild_ride{}) -> boolean().
sortRide(#rec_guild_ride{rideID = RID1}, #rec_guild_ride{rideID = RID2}) ->
	RID1 < RID2.

-spec maintainRide_ride(
	ResChanged :: boolean(),
	ListRideIn::[#rec_guild_ride{}, ...],
	ListRideWillSaveAcc::[#rec_guild_ride{}, ...],
	ListRideAcc::[#rec_guild_ride{}, ...],
	GuildAcc::#rec_guild{}
) ->
	{
		ListRideWillSaveAccNew::[#rec_guild_ride{}, ...],
		ListRideOut::[#rec_guild_ride{}, ...],
		GuildOut::#rec_guild{}
	}.
maintainRide_ride(_ResChanged, [], ListRideWillSaveAcc, ListRideAcc, GuildAcc) ->
	{ListRideWillSaveAcc, lists:reverse(ListRideAcc), GuildAcc};
maintainRide_ride(
	ResChanged,
	[#rec_guild_ride{rideState = ?RideState_Maintain, rideID = RideID, rideLevel = RideLevel} = H | T],
	ListRideWillSaveAcc,
	ListRideAcc,
	#rec_guild{
		resource = Res
	} = Guild
) ->
	case ResChanged of
		true ->
			%% 资金变动，如果是维护状态，则需要重新打开
			#guild_rideCfg{
				maintain = NeedRes
			} = getCfg:getCfgPStack(cfg_guild_ride, RideID, RideLevel),
			case Res >= NeedRes of
				true ->
					RideStateNew = getGuildRideConfigState(RideID, RideLevel, getTimeMark()),
					HNew = H#rec_guild_ride{rideState = RideStateNew},

					?LOG_OUT("maintainRide guild=~p, ride=~p, level=~p state=~p -> ~p",
						[Guild#rec_guild.guildID, RideID, RideLevel, ?RideState_Maintain, RideStateNew]),

					GuildNew = Guild#rec_guild{resource = Res - NeedRes},
					maintainRide_ride(ResChanged, T, ListRideWillSaveAcc, [HNew | ListRideAcc], GuildNew);
				_ ->
					%% 资金仍然不够，保持原样
					maintainRide_ride(ResChanged, T, ListRideWillSaveAcc, [H | ListRideAcc], Guild)
			end;
		_ ->
			%% 非资金变动的维护状态，不处理
			maintainRide_ride(ResChanged, T, ListRideWillSaveAcc, [H | ListRideAcc], Guild)
	end;
maintainRide_ride(
	ResChanged,
	[#rec_guild_ride{rideID = RideID, rideLevel = RideLevel} = H | T],
	ListRideWillSaveAcc,
	ListRideAcc,
	#rec_guild{
		resource = Res
	} = Guild
) ->
	case ResChanged of
		false ->
			%% 非维护状态的重置，处理
			#guild_rideCfg{
				maintain = NeedRes
			} = getCfg:getCfgPStack(cfg_guild_ride, RideID, RideLevel),
			case Res >= NeedRes of
				true ->
					GuildNew = Guild#rec_guild{resource = Res - NeedRes},
					maintainRide_ride(ResChanged, T, ListRideWillSaveAcc, [H | ListRideAcc], GuildNew);
				_ ->
					HNew = H#rec_guild_ride{rideState = ?RideState_Maintain},

					?LOG_OUT("maintainRide not guild=~p, ride=~p, level=~p state=~p -> ~p",
						[Guild#rec_guild.guildID, RideID, RideLevel, H#rec_guild_ride.rideState, ?RideState_Maintain]),

					maintainRide_ride(ResChanged, T, [HNew | ListRideWillSaveAcc], [HNew | ListRideAcc], Guild)
			end;
		true ->
			%% 非维护状态的资金变动，不处理
			maintainRide_ride(ResChanged, T, ListRideWillSaveAcc, [H | ListRideAcc], Guild)
	end.

%% 强制玩家取消乘坐
-spec useRideDownF(ListRide::[#rec_guild_ride{}, ...]) -> ok.
useRideDownF([]) ->
	ok;
useRideDownF([#rec_guild_ride{rideState = ?RideState_Open} | T]) ->
	useRideDownF(T);
useRideDownF([#rec_guild_ride{guildID = GuildID, rideID = RideID, rideLevel = RideLevel, rideState = RideState} | T]) ->
	ListUser = playerGuildFairground:queryRideUser(GuildID, RideID),
	Ride =
		#pk_Ride{
			id = RideID,
			level = RideLevel,
			state = RideState
		},
	#guild_rideCfg{
		buffID = BuffID
	} = getCfg:getCfgPStack(cfg_guild_ride, RideID, RideLevel),
	useRideDownF_user(ListUser, Ride, BuffID),
	useRideDownF(T).
-spec useRideDownF_user(ListRideUser::[#recGuildRideUser{}, ...], Ride::#pk_Ride{}, BuffID::uint32()) -> ok.
useRideDownF_user([], _Ride, _BuffID) ->
	ok;
useRideDownF_user([#recGuildRideUser{roleID = RoleID, role = Role, timeRef = TimeRef} | T], Ride, BuffID) ->
	%% 添加BUFF
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{pid = Pid} ->
			psMgr:sendMsg2PS(Pid, guildFairground_rideBuff, BuffID);
		_ ->
			skip
	end,
	%% 取消乘坐（包含取消计时器）
	erlang:cancel_timer(TimeRef),
	ets:delete(?EtsGuildRideUser, RoleID),
	%% 通知当前地图所有角色
	useRideNotice(Ride, Role, ?RideUseType_Down, Ride#rec_guild_ride.guildID, undefined),
	useRideDownF_user(T, Ride, BuffID).
