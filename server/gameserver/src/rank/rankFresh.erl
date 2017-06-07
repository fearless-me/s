%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 排行榜刷新逻辑
%%% @end
%%% Created : 09. 六月 2015 10:07
%%%-------------------------------------------------------------------
-module(rankFresh).
-author("tiancheng").

-include("guild.hrl").
-include("rankPrivate.hrl").

%% API
-export([
	refreshRank/3,
	refreshRank2Ets/2
]).



%% 刷新等级经验排行榜
-spec refreshRank(Type::playerRankType(), RankNumber::uint(), FreshTime::uint()) -> list().
refreshRank(?PlayerRankType_LevelExp = Type, RankNumber, FreshTime) ->
    [MinLv,MaxLv]=rankLogic:getRankLVLimitCfg(),
    Q = ets:fun2ms(
        fun(#?RoleKeyRec{} = RankInfo) when RankInfo#?RoleKeyRec.roleID > 0,
            MinLv=<RankInfo#?RoleKeyRec.level,
            RankInfo#?RoleKeyRec.level=< MaxLv ->
            RankInfo
        end
    ),
    List = ets:select(ets_rolekeyinfo, Q),
    SortFun =
        fun(#?RoleKeyRec{level = L1, exp = E1, roleID = R1}, #?RoleKeyRec{level = L2, exp = E2, roleID = R2}) ->
            if
                L1 > L2 ->
                    true;
                L1 =:= L2 andalso E1 > E2 ->
                    true;
                L1 =:= L2 andalso E1 =:= E2 andalso R1 > R2 ->
                    true;
                true ->
                    false
            end
        end,
    NList1 = lists:sort(SortFun, List),
    NList2 = lists:sublist(NList1, RankNumber),
    Fun =
        fun(#?RoleKeyRec{roleID = RoleID,level = Level, exp = Exp}, {SortID, RList}) ->
            R = #recSaveRank{
                roleID		= RoleID,
                rankType	= Type,
                rankSort	= SortID,
                rankSortC 	= rankLogic:getRankSortC(Type, RoleID, SortID),
                value1		= Level,
                value2		= Exp,
                value3		= 0,
                createTime	= FreshTime
            },
            {SortID + 1, [R | RList]}
        end,
    {_, RankList} = lists:foldl(Fun, {1, []}, NList2),
    RankList;

%% 刷新财富排行榜
refreshRank(?PlayerRankType_Glod = Type, RankNumber, FreshTime) ->
    [MinLv,MaxLv]=rankLogic:getRankLVLimitCfg(),
    Q = ets:fun2ms(
        fun(#?RoleKeyRec{} = RankInfo) when RankInfo#?RoleKeyRec.roleID > 0,
            RankInfo#?RoleKeyRec.gold > 0,
            MinLv=<RankInfo#?RoleKeyRec.level,
            RankInfo#?RoleKeyRec.level=< MaxLv ->
            RankInfo
        end
    ),
    List = ets:select(ets_rolekeyinfo, Q),
    SortFun =
        fun(#?RoleKeyRec{gold = G1, roleID = R1}, #?RoleKeyRec{gold = G2, roleID = R2}) ->
            if
                G1 > G2 ->
                    true;
                G1 =:= G2 andalso R1 > R2 ->
                    true;
                true ->
                    false
            end
        end,
    NList1 = lists:sort(SortFun, List),
    NList2 = lists:sublist(NList1, RankNumber),
    Fun =
        fun(#?RoleKeyRec{roleID = RoleID,gold = Gold}, {SortID, RList}) ->
            R = #recSaveRank{
                roleID		= RoleID,
                rankType	= Type,
                rankSort	= SortID,
                rankSortC 	= rankLogic:getRankSortC(Type, RoleID, SortID),
                value1		= Gold,
                value2		= 0,
                value3		= 0,
                createTime	= FreshTime
            },
            {SortID + 1, [R | RList]}
        end,
    {_, RankList} = lists:foldl(Fun, {1, []}, NList2),
    RankList;

%% 刷新爵位声望排行榜
refreshRank(?PlayerRankType_VipReputation = Type, RankNumber, FreshTime) ->
    [MinLv,MaxLv]=rankLogic:getRankLVLimitCfg(),
    Q = ets:fun2ms(
        fun(#?RoleKeyRec{} = RankInfo) when RankInfo#?RoleKeyRec.roleID > 0,
            RankInfo#?RoleKeyRec.reputation > 0,
            MinLv=<RankInfo#?RoleKeyRec.level,
            RankInfo#?RoleKeyRec.level=< MaxLv ->
            RankInfo
        end
    ),
    List = ets:select(ets_rolekeyinfo, Q),
    SortFun =
        fun(#?RoleKeyRec{reputation = Re1, roleID = R1}, #?RoleKeyRec{reputation = Re2, roleID = R2}) ->
            if
                Re1 > Re2 ->
                    true;
                Re1 =:= Re2 andalso R1 > R2 ->
                    true;
                true ->
                    false
            end
        end,
    NList1 = lists:sort(SortFun, List),
    NList2 = lists:sublist(NList1, RankNumber),
    Fun =
        fun(#?RoleKeyRec{roleID = RoleID,reputation = Reputation}, {SortID, RList}) ->
            R = #recSaveRank{
                roleID		= RoleID,
                rankType	= Type,
                rankSort	= SortID,
                rankSortC 	= rankLogic:getRankSortC(Type, RoleID, SortID),
                value1		= Reputation,
                value2		= 0,
                value3		= 0,
                createTime	= FreshTime
            },
            {SortID + 1, [R | RList]}
        end,
    {_, RankList} = lists:foldl(Fun, {1, []}, NList2),
    RankList;

%% 玩家战力榜
refreshRank(?PlayerRankType_FightingCapacity = Type, RankNumber, FreshTime) ->
    [MinLv,MaxLv]=rankLogic:getRankLVLimitCfg(),
    Q = ets:fun2ms(
        fun(#?RoleKeyRec{} = RankInfo) when RankInfo#?RoleKeyRec.roleID > 0,
            RankInfo#?RoleKeyRec.playerForce > 0,
            MinLv=<RankInfo#?RoleKeyRec.level,
            RankInfo#?RoleKeyRec.level=< MaxLv ->
            RankInfo
        end
    ),
    List = ets:select(ets_rolekeyinfo, Q),
    SortFun =
        fun(#?RoleKeyRec{playerForce = P1, petForce = PetP1, roleID = R1}, #?RoleKeyRec{playerForce = P2, petForce = PetP2, roleID = R2}) ->
            V1 = P1 + PetP1,
            V2 = P2 + PetP2,
            if
                V1 > V2 ->
                    true;
                V1 =:= V2 andalso R1 > R2 ->
                    true;
                true ->
                    false
            end
        end,
    NList1 = lists:sort(SortFun, List),
    NList2 = lists:sublist(NList1, RankNumber),
    Fun =
        fun(#?RoleKeyRec{roleID = RoleID,playerForce = PlayerForce,petForce = PetForce}, {SortID, RList}) ->
            R = #recSaveRank{
                roleID		= RoleID,
                rankType	= Type,
                rankSort	= SortID,
                rankSortC 	= rankLogic:getRankSortC(Type, RoleID, SortID),
                value1		= PlayerForce + PetForce,
                value2		= 0,
                value3		= 0,
                createTime	= FreshTime
            },
            {SortID + 1, [R | RList]}
        end,
    {_, RankList} = lists:foldl(Fun, {1, []}, NList2),
    RankList;

%% 宠物战力榜
refreshRank(?PlayerRankType_FightingCapacityPet = Type, RankNumber, FreshTime) ->
    [MinLv,MaxLv]=rankLogic:getRankLVLimitCfg(),
    Q = ets:fun2ms(
        fun(#?RoleKeyRec{} = RankInfo) when RankInfo#?RoleKeyRec.roleID > 0,
            RankInfo#?RoleKeyRec.petForce > 0,
            MinLv=<RankInfo#?RoleKeyRec.level,
            RankInfo#?RoleKeyRec.level=< MaxLv ->
            RankInfo
        end
    ),
    List = ets:select(ets_rolekeyinfo, Q),
    SortFun =
        fun(#?RoleKeyRec{petForce = P1, roleID = R1}, #?RoleKeyRec{petForce = P2, roleID = R2}) ->
            if
                P1 > P2 ->
                    true;
                P1 =:= P2 andalso R1 > R2 ->
                    true;
                true ->
                    false
            end
        end,
    NList1 = lists:sort(SortFun, List),
    NList2 = lists:sublist(NList1, RankNumber),
    Fun =
        fun(#?RoleKeyRec{roleID = RoleID,petForce = PetForce,petID = PetID}, {SortID, RList}) ->
            R = #recSaveRank{
                roleID		= RoleID,
                rankType	= Type,
                rankSort	= SortID,
                rankSortC 	= rankLogic:getRankSortC(Type, RoleID, SortID),
                value1		= PetForce,
                value2		= PetID,
                value3		= 0,
                createTime	= FreshTime
            },
            {SortID + 1, [R | RList]}
        end,
    {_, RankList} = lists:foldl(Fun, {1, []}, NList2),
    RankList;

%% 玩家成就榜
refreshRank(?PlayerRankType_Achieve = Type, RankNumber, FreshTime) ->
    [MinLv,MaxLv]=rankLogic:getRankLVLimitCfg(),
    Q = ets:fun2ms(
        fun(#?RoleKeyRec{} = RankInfo) when RankInfo#?RoleKeyRec.roleID > 0,
            RankInfo#?RoleKeyRec.achieve > 0,
            MinLv=<RankInfo#?RoleKeyRec.level,
            RankInfo#?RoleKeyRec.level=< MaxLv ->
            RankInfo
        end
    ),
    List = ets:select(ets_rolekeyinfo, Q),
    SortFun =
        fun(#?RoleKeyRec{achieve = A1, roleID = R1}, #?RoleKeyRec{achieve = A2, roleID = R2}) ->
            if
                A1 > A2 ->
                    true;
                A1 =:= A2 andalso R1 > R2 ->
                    true;
                true ->
                    false
            end
        end,
    NList1 = lists:sort(SortFun, List),
    NList2 = lists:sublist(NList1, RankNumber),
    Fun =
        fun(#?RoleKeyRec{roleID = RoleID,achieve = Achieve}, {SortID, RList}) ->
            R = #recSaveRank{
                roleID		= RoleID,
                rankType	= Type,
                rankSort	= SortID,
                rankSortC 	= rankLogic:getRankSortC(Type, RoleID, SortID),
                value1		= Achieve,
                value2		= 0,
                value3		= 0,
                createTime	= FreshTime
            },
            {SortID + 1, [R | RList]}
        end,
    {_, RankList} = lists:foldl(Fun, {1, []}, NList2),
    RankList;

%% 玩家被点赞榜
refreshRank(?PlayerRankType_Praise = Type, RankNumber, FreshTime) ->
    [MinLv,MaxLv]=rankLogic:getRankLVLimitCfg(),
    Q = ets:fun2ms(
        fun(#?RoleKeyRec{} = RankInfo) when RankInfo#?RoleKeyRec.roleID > 0,
            RankInfo#?RoleKeyRec.praise > 0,
            MinLv=<RankInfo#?RoleKeyRec.level,
            RankInfo#?RoleKeyRec.level=< MaxLv ->
            RankInfo
        end
    ),
    List = ets:select(ets_rolekeyinfo, Q),
    SortFun =
        fun(#?RoleKeyRec{praise = P1, roleID = R1}, #?RoleKeyRec{praise = P2, roleID = R2}) ->
            if
                P1 > P2 ->
                    true;
                P1 =:= P2 andalso R1 > R2 ->
                    true;
                true ->
                    false
            end
        end,
    NList1 = lists:sort(SortFun, List),
    NList2 = lists:sublist(NList1, RankNumber),
    Fun =
        fun(#?RoleKeyRec{roleID = RoleID,praise = Praise}, {SortID, RList}) ->
            R = #recSaveRank{
                roleID		= RoleID,
                rankType	= Type,
                rankSort	= SortID,
                rankSortC 	= rankLogic:getRankSortC(Type, RoleID, SortID),
                value1		= Praise,
                value2		= 0,
                value3		= 0,
                createTime	= FreshTime
            },
            {SortID + 1, [R | RList]}
        end,
    {_, RankList} = lists:foldl(Fun, {1, []}, NList2),
    RankList;

%% (特殊排行榜－军团排行榜)
refreshRank(?PlayerRankType_Guild = Type, RankNumber, FreshTime) ->
	List = ets:tab2list(rec_guild),
	F2 =
		fun(#rec_guild{guildID = GuildID, fightForce = ForceAll}) ->
			{GuildID, ForceAll, guildLogic:getGuildLeaderRoleID(GuildID)}
		end,
	ListForce = lists:map(F2, List),
	F3 =
		fun({G1, F11, _}, {G2, F22, _}) ->
			if
				F11 > F22 -> true;
				F11 =:= F22 andalso G1 > G2 -> true;
				true -> false
			end
		end,
	ListForce2 = lists:sort(F3, ListForce),
	ListForce3 = lists:sublist(ListForce2, RankNumber),
	Fun =
		fun({GuildID, Force, LeaderRoleID}, {SortID, RList}) ->
			R = #recSaveRank{
				roleID		= LeaderRoleID,
				rankType	= Type,
				rankSort	= SortID,
				rankSortC 	= rankLogic:getRankSortC(Type, GuildID, SortID),
				value1		= Force,
				value2		= 0,
				value3		= GuildID,
				createTime	= FreshTime
			},
			{SortID + 1, [R | RList]}
		end,
	{_, RankList} = lists:foldl(Fun, {1, []}, ListForce3),
	RankList;

%% 玩家王者战天下排行榜
refreshRank(?PlayerRankType_GuardMirror = Type, RankNumber, FreshTime) ->
	%List = edb:readAllRecord(rec_guard_mirror_rank),
	F =
		fun() ->
			%[MinLv,MaxLv]=rankLogic:getRankLVLimitCfg(),
			Q1 = qlc:q([RankInfo || RankInfo <- mnesia:table(rec_guard_mirror_rank),
				RankInfo#rec_guard_mirror_rank.roleID > 0,
				RankInfo#rec_guard_mirror_rank.days > 0]),
			SortFun =
				fun(#rec_guard_mirror_rank{days = D1, roleID = R1}, #rec_guard_mirror_rank{days = D2, roleID = R2}) ->
					if
						D1 > D2 ->
							true;
						D1 =:= D2 andalso R1 > R2 ->
							true;
						true ->
							false
					end
				end,
			Q2 = qlc:sort(Q1, [{order, SortFun}]),
			Q3 = qlc:cursor(Q2),
			qlc:next_answers(Q3, RankNumber)
		end,
	Ret = mnesia:transaction(F),
	case Ret of
		{atomic, ResultOfFun} ->
			Fun =
				fun(#rec_guard_mirror_rank{roleID = RoleID, days = Days}, {SortID, RList}) ->
					R = #recSaveRank{
						roleID		= RoleID,
						rankType	= Type,
						rankSort	= SortID,
						rankSortC 	= rankLogic:getRankSortC(Type, RoleID, SortID),
						value1		= Days,
						value2		= 0,
						value3		= 0,
						createTime	= FreshTime
					},
					{SortID + 1, [R | RList]}
				end,
			{_, RankList} = lists:foldl(Fun, {1, []}, ResultOfFun),
			RankList;
		Other ->
			?ERROR_OUT("refreshRank[~p] error select:[~p]",[Type,Other]),
			[]
	end;

%% 勇者试炼排行榜
refreshRank(?PlayerRankType_WarriorTrial = Type, RankNumber, FreshTime) ->
    [MinLv,MaxLv]=rankLogic:getRankLVLimitCfg(),
    Q = ets:fun2ms(
        fun(#?RoleKeyRec{} = RankInfo) when RankInfo#?RoleKeyRec.wtPhase > 0,
            MinLv=<RankInfo#?RoleKeyRec.level,
            RankInfo#?RoleKeyRec.level=< MaxLv ->
            RankInfo
        end
    ),
    List = ets:select(ets_rolekeyinfo, Q),
    SortFun =
        fun(#?RoleKeyRec{wtPhase = W1, wtPhaseTime = WT1}, #?RoleKeyRec{wtPhase = W2, wtPhaseTime = WT2}) ->
            if
                W1 > W2 ->
                    true;
                W1 =:= W2 andalso WT1 < WT2 ->
                    true;
                true ->
                    false
            end
        end,
    NList1 = lists:sort(SortFun, List),
    NList2 = lists:sublist(NList1, RankNumber),
    Fun =
        fun(#?RoleKeyRec{roleID = RoleID, wtPhase = WtPhase, wtPhaseTime = WtPhaseTime}, {SortID, RList}) ->
            R = #recSaveRank{
                roleID		= RoleID,
                rankType	= Type,
                rankSort	= SortID,
                rankSortC 	= rankLogic:getRankSortC(Type, RoleID, SortID),
                value1		= WtPhase,
                value2		= WtPhaseTime,
                value3		= 0,
                createTime	= FreshTime
            },
            {SortID + 1, [R | RList]}
        end,
    {_, RankList} = lists:foldl(Fun, {1, []}, NList2),
    RankList;

%% 玩家pvp远征排行榜（领地积分榜）
refreshRank(?PlayerRankType_PetPvp = Type, RankNumber, FreshTime) ->
	CurTime = time:getWeekBeginSecondsByDay(time:getLocalNowDateTime1970()) + 4 * 60 * 60,
    [MinLv,MaxLv]=rankLogic:getRankLVLimitCfg(),
    Q = ets:fun2ms(
        fun(#?RoleKeyRec{} = RankInfo) when RankInfo#?RoleKeyRec.roleID > 0,
            MinLv=<RankInfo#?RoleKeyRec.level,
            RankInfo#?RoleKeyRec.level=< MaxLv ->
            RankInfo
        end
    ),
    List = ets:select(ets_rolekeyinfo, Q),
    SortFun =
        fun(#?RoleKeyRec{pvpIntegral = {Time1, Int1}, roleID = R1}, #?RoleKeyRec{pvpIntegral = {Time2, Int2}, roleID = R2}) ->
            case Time1 =:= CurTime of
                true ->
                    P1 = Int1;
                _ ->
                    P1 = 0
            end,
            case Time2 =:= CurTime of
                true ->
                    P2 = Int2;
                _ ->
                    P2 = 0
            end,
            if
                P1 > P2 ->
                    true;
                P1 =:= P2 andalso R1 > R2 ->
                    true;
                true ->
                    false
            end
        end,
    NList1 = lists:sort(SortFun, List),
    NList2 = lists:sublist(NList1, RankNumber),
    Fun =
        fun(#?RoleKeyRec{roleID = RoleID,pvpIntegral = {T, I}}, {SortID, RList}) ->
            case T =:= CurTime of
                true ->
                    I1 = I;
                _ ->
                    I1 = 0
            end,
            R = #recSaveRank{
                roleID		= RoleID,
                rankType	= Type,
                rankSort	= SortID,
                rankSortC 	= rankLogic:getRankSortC(Type, RoleID, SortID),
                value1		= I1,
                value2		= 0,
                value3		= 0,
                createTime	= FreshTime
            },
            {SortID + 1, [R | RList]}
        end,
    {_, RankList} = lists:foldl(Fun, {1, []}, NList2),
    RankList;

%% 玩家恶人榜
refreshRank(?PlayerRankType_KvNum = Type, RankNumber, FreshTime) ->
    [MinLv,MaxLv]=rankLogic:getRankLVLimitCfg(),
    Q = ets:fun2ms(
        fun(#?RoleKeyRec{} = RankInfo) when RankInfo#?RoleKeyRec.roleID > 0,
            RankInfo#?RoleKeyRec.kpNum > 0,
            MinLv=<RankInfo#?RoleKeyRec.level,
            RankInfo#?RoleKeyRec.level=< MaxLv ->
            RankInfo
        end
    ),
    List = ets:select(ets_rolekeyinfo, Q),
    SortFun =
        fun(#?RoleKeyRec{kpNum = A1, roleID = R1}, #?RoleKeyRec{kpNum = A2, roleID = R2}) ->
            if
                A1 > A2 ->
                    true;
                A1 =:= A2 andalso R1 > R2 ->
                    true;
                true ->
                    false
            end
        end,
    NList1 = lists:sort(SortFun, List),
    NList2 = lists:sublist(NList1, RankNumber),
    Fun =
        fun(#?RoleKeyRec{roleID = RoleID,kpNum = KpNum}, {SortID, RList}) ->
            R = #recSaveRank{
                roleID		= RoleID,
                rankType	= Type,
                rankSort	= SortID,
                rankSortC 	= rankLogic:getRankSortC(Type, RoleID, SortID),
                value1		= KpNum,
                value2		= 0,
                value3		= 0,
                createTime	= FreshTime
            },
            {SortID + 1, [R | RList]}
        end,
    {_, RankList} = lists:foldl(Fun, {1, []}, NList2),
    RankList;

%% 军团争霸杀人榜
refreshRank(?PlayerRankType_GuildWar, _RankNumber, _FreshTime) ->
	[];


refreshRank(Type, RankNumber, FreshTime) ->
	?ERROR_OUT("refreshRank:~p,~p,~p", [Type, RankNumber, FreshTime]),
	[].

refreshRank2Ets(RankType, RankList)->
	%% 清空以前的排行榜单
	ets:delete(?TABLE_RankInfo, RankType),

    %% 保存新的榜单
    ets:insert(?TABLE_RankInfo, RankList),

    %% 通知全服在线玩家刷新排行榜
    psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {sendRefreshMsgToAllOLPlayer, {RankType}}),

    case RankType of
        ?PlayerRankType_LevelExp ->
            Level = playerWorldLevel:getgsRankLevel(30),
            psMgr:sendMsg2PS(?PsNameMain, refreshWorldLevel, Level),
            ?DEBUG_OUT("send Rankinfo and refresh worldlevel [~p]",[Level]);
        _ ->ok
    end,
    ok.


