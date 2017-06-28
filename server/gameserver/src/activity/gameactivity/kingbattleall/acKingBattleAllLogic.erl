%%%-------------------------------------------------------------------
%%% @author zzc
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 老版本为王者荣耀活动，新版本为世界守护活动
%%% @end
%%% Created : 13. 一月 2015 19:50
%%%-------------------------------------------------------------------
-module(acKingBattleAllLogic).
-author("zzc").

-include("../../activityPrivate.hrl").
-include("../activityPhaseDefine.hrl").
-include("acKingBattleAllPrivatePrivate.hrl").
-include("playerPropSyncDefine.hrl").
-include("../world/mapPrivate.hrl").
-include("gsInc.hrl").


%% API
-export([
    init/0,
    activityChangeCallBack/1,
    onMapDestroy/1,
    sendTipsToAllPlayer/1,
    playerDead/1,
%%  sendMail2AllRoleInHateList/1,
    monsterDead/1,
    monsterDamage/1,
%%    setMinGSID/1,
    killedTarget/1,
    getDefenderInfo/1,
    getAttackerInfo/1,
    updateAttackerInfo/2,
    clearAttackerInfo/0,
    getOnlineAttackerNumber/0,
    getKillRoleIDList/0,
    globalControlIsOpen/0,
    getMirrorInfo/1,
    getUserCurrentFoolBuffCfgIDByRole/1
]).

-export([
    joinKingBattleAC/1,
    offlineInMap/1,
    damageRank/1,
    setACMapPid/1,
    createKingMirroring/0,
    updateDefenderInfo/1,
    sortAttackerByDamage/0,
    playerForce2MirroeHp/1,
    getCurrentDefenderInfo/0,
    getUserNextFoolBuffCfgIDByRole/1,
    getUserMaxFoolBuffIDByRole/1,
    getMaxBuffByCfgID/1,
    getNextBuffByCfgID/1,
    getMirrorAppearance/1,
    saveMirrotApperance/1,
    resetKingData/2
]).

-export([
    getKingFromForceRank/0,
    activityDataLoadAckCallBack/0,
    deleteRole/1
]).

%% 初始化
-spec init() -> ok.
init() ->
    ets:new(king_battle_attacker, [set, public, named_table, {keypos, #king_battle_attacker.roleID}, {read_concurrency, true}, {write_concurrency, true}]),
    ets:new(king_battle_mirror_appearance, [set, public, named_table, {keypos, #king_battle_attacker.roleID}, {read_concurrency, true}]).

%%游戏服务器启动完之后数据加载完成回调
activityDataLoadAckCallBack() ->
    case getCurrentDefenderInfo() of
        {ok, #rec_guard_mirror{roleID = RoleID}} ->
			case core:queryRoleKeyInfoByRoleID(RoleID) of
				#?RoleKeyRec{} ->
                    getRolesAppearanceFromDB(RoleID);
                _ ->
                    ?ERROR_OUT(" king battle load defender fail role delete or fail roleID=~p~n", [RoleID]),
                    %%此处即便重置守护者数据失败也不需要执行活动关闭指令，因为活动此时是关闭的
                    resetKingDataExcludeRoleID(RoleID)
            end;
        {error, none} ->
            ?WARN_OUT(" king battle not king need init from rank "),
            %%此处即便重置守护者数据失败也不需要执行活动关闭指令，因为活动此时是关闭的
            resetKingData()
    end.
%%重置王者排除指定的角色
%%{ok,<<"success">>}| {error,none}
resetKingDataExcludeRoleID(ExcludeRoleID) ->
    case getKingFromForceRankExcludeRoleID(ExcludeRoleID) of
        {RoleID, FightForce} ->
            resetKingData(RoleID, FightForce);
        R ->
            ?ERROR_OUT("getKingFromRankAndMail no forceRank4king,R=~p~n", [R]),
%%            psMgr:sendMsg2PS(?PsNameActivity, setActivePhase, {?ActivityType_KingBattleAll, ?ActivityPhase_Close}),
            {error, none}
    end.
%%重新加载王者数据
%%{ok,<<"success">>}| {error,none}
resetKingData() ->
    case getKingFromForceRank() of
        {RoleID, FightForce} ->
            resetKingData(RoleID, FightForce);
        R ->
            ?ERROR_OUT("getKingFromRankAndMail no forceRank4king,R=~p~n", [R]),
%%            psMgr:sendMsg2PS(?PsNameActivity, setActivePhase, {?ActivityType_KingBattleAll, ?ActivityPhase_Close}),
            {error, none}
    end.
resetKingData(RoleID, FightForce) ->
	case core:queryRoleKeyInfoByRoleID(RoleID) of
		#?RoleKeyRec{roleName = RoleName, level = Level, career = Career} ->
			NewRow = #rec_guard_mirror{
				roleID = RoleID,
				roleName = binToString(RoleName),
				roleLevel = Level,
				roleCareer = Career,
				fightForce = FightForce
			},
			addNewDefenderInfo(NewRow),
			getRolesAppearanceFromDB(RoleID),
			MailContent = stringCfg:getString(cnTextKingBattleAllMailContent2, []),
			timer:apply_after(1000 * 60, systemMail, sendMail, [[], [RoleID], 0, stringCfg:getString(cnTextKingBattleAllMailTitle2), MailContent, ""]),
			{ok, <<"success">>};
		_ ->
			?ERROR_OUT("resetKingData fail can not find role info,{RoleID, FightForce}=~p~n", [{RoleID, FightForce}]),
%%            psMgr:sendMsg2PS(?PsNameActivity, setActivePhase, {?ActivityType_KingBattleAll, ?ActivityPhase_Close}),
			{error, none}
	end.
%% 主活动模块进程回调、活动关闭阶段主要任务是清理数据
-spec activityChangeCallBack(Phase :: uint()) -> ok.
activityChangeCallBack(?ActivityPhase_Close) ->
    CurrMapPid = getACMapPid(),
    case erlang:is_pid(CurrMapPid) of
        true ->
            erlang:send_after(30*1000,CurrMapPid, {resetCopyMap, self(), {}});
        _ -> skip
    end,

    List = sortAttackerByDamage(),
    setACMapPid(undefined),
    setKillRoleIDList([]),
%%    setActiveState(false),
%%    clearGMFightRoleID(),
    refreshMarrorStatue(),
    List = sortAttackerByDamage(),
    ok;
activityChangeCallBack(?ActivityPhase_KingBattleAll_1) ->
    ?LOG_OUT("~p ~p wait start1", [?MODULE, self()]),
    case edb:readAllRecord(rec_guard_mirror) of
        [#rec_guard_mirror{roleID = RoleID} | _] ->
			case core:queryRoleKeyInfoByRoleID(RoleID) of
				#?RoleKeyRec{} ->
                    getRolesAppearanceFromDB(RoleID);
                _ ->
                    case resetKingData() of
                        {ok, <<"success">>} -> skip;
                        _ ->
                            ?WARN_OUT(" king battle can not find king from rank "),
                            psMgr:sendMsg2PS(?PsNameActivity, setActivePhase, {?ActivityType_KingBattleAll, ?ActivityPhase_Close})
                    end
            end;
        _ ->
            case resetKingData() of
                {ok, <<"success">>} -> skip;
                _ ->
                    ?WARN_OUT(" king battle can not find king from rank "),
                    psMgr:sendMsg2PS(?PsNameActivity, setActivePhase, {?ActivityType_KingBattleAll, ?ActivityPhase_Close})
            end
    end,
    refreshKingRank();
activityChangeCallBack(?ActivityPhase_KingBattleAll_2) ->
    ?LOG_OUT("~p ~p wait start2", [?MODULE, self()]),
    case edb:readAllRecord(rec_guard_mirror) of
        [#rec_guard_mirror{
            roleName = Name
        } | _] ->
            Content = stringCfg:getString(cnTextKingBattleAllStart, [3, binToString(Name)]),
            activityCommon:sendBroadcastNotice(Content);
        _ ->
            skip
    end,
    ok;
activityChangeCallBack(?ActivityPhase_KingBattleAll_3) ->
    ?LOG_OUT("~p ~p wait start3", [?MODULE, self()]),
    case edb:readAllRecord(rec_guard_mirror) of
        [#rec_guard_mirror{
            roleName = Name
        } | _] ->
            Content = stringCfg:getString(cnTextKingBattleAllStart, [2, binToString(Name)]),
            activityCommon:sendBroadcastNotice(Content);
        _ ->
            skip
    end,
    ok;
activityChangeCallBack(?ActivityPhase_KingBattleAll_4) ->
    ?LOG_OUT("~p ~p wait start4", [?MODULE, self()]),
    case edb:readAllRecord(rec_guard_mirror) of
        [#rec_guard_mirror{
            roleName = Name
        } | _] ->
            Content = stringCfg:getString(cnTextKingBattleAllStart, [1, binToString(Name)]),
            activityCommon:sendBroadcastNotice(Content);
        _ ->
            skip
    end,
    ok;
activityChangeCallBack(?ActivityPhase_KingBattleAll_5) ->
    ?LOG_OUT("~p ~p start5", [?MODULE, self()]),
%%    case checkGSConfIDLeast() of
%%        true ->
    AcKingBattleAllMapID = globalCfg:getGlobalCfg(fightall_map_id),
    case edb:readAllRecord(rec_guard_mirror) of
        [#rec_guard_mirror{
            roleName = Name
        } | _] ->
            Content = stringCfg:getString(cnTextKingBattleAllStarting, [binToString(Name)]),
            activityCommon:sendBroadcastNotice(Content);
        _ ->
            skip
    end,
    %%创建地图进程
    core:sendMsgToMapMgr(AcKingBattleAllMapID, createActivityMap, {AcKingBattleAllMapID, 1, 0}),
%%            setActiveState(true);
%%        false ->
%%            ?ERROR_OUT("kingbattleAll activityChangeCallBack5 current GSID not least"),
%%            skip
%%    end,
    ok;

activityChangeCallBack(?ActivityPhase_KingBattleAll_6) ->
    %%服务器启动的时候会在此处调用一次关闭，此处判断是为了跳过启动回调
    case getNewDefender() of
        {ok, none} ->
            case getCurrentDefenderInfo() of
                {ok, #rec_guard_mirror{}=Row} ->
                    NewRow = Row#rec_guard_mirror{
                        guardTimes = Row#rec_guard_mirror.guardTimes + 1,
                        mirrorBuffCfgID = ?AC_KING_BATTLE_MIRROR_DEFAULT_BUFF_CFG_ID,
                        roleBuffCffgID = ?AC_KING_BATTLE_ROLE_DEFAULT_BUFF_CFG_ID
                    },
                    updateDefenderInfo(NewRow),
                    acKingbattleAward:sendDefenderWinAward(),
                    RoleID = NewRow#rec_guard_mirror.roleID,
                    Days = NewRow#rec_guard_mirror.guardTimes,
                    Declaration = NewRow#rec_guard_mirror.declaration,
                    %% .展示老王者的结算面板
                    KillNumber = erlang:length(getKillRoleIDList()),
                    #?RoleKeyRec{roleName = Name,career = Career,race = Race,sex = Sex,head = Head} = core:queryRoleKeyInfoByRoleID(RoleID),
                    %%[#rec_base_role{roleName = Name,career = Career,race = Race,sex = Sex,head = Head}] = ets:lookup(ets_rec_base_role,RoleID),
                    {ok,#king_battle_mirror_appearance{equipIDList =EquipList,equipLevelList = EquipLevelIDList,fashionIDList = FashionIDList,wingLevel=WingLevel }}=acKingBattleAllLogic:getMirrorAppearance(RoleID),
                    MsgEquipmentList = [#pk_PlayerKingBattleEquip{equipID =EquipID,quality = Quarlity }||#recVisibleEquip{equipID = EquipID,quality = Quarlity}<-EquipList],
                    MsgEquipLevelIDLis=[#pk_PlayerKingBattleEquipLevel{type = EqType,level = EqLv}||{ EqType, EqLv}<-EquipLevelIDList] ,
                    %% .发防守方
                    case core:queryOnLineRoleByRoleID(RoleID) of
                        #rec_OnlinePlayer{netPid = NetPid1} ->
                            NetMsg1 =
                                #pk_GS2U_KingBattleResult{
                                    isNewKing = true,
                                    killNumOrHurt = KillNumber,
                                    days = 0,
                                    declaration = "",
                                    name = Name,
                                    roleID =RoleID,
                                    career = Career,
                                    race = Race,
                                    sex = Sex,
                                    head = Head,
                                    wingLevel = WingLevel,
                                    fashionIDs = FashionIDList,
                                    equipIDList = MsgEquipmentList,
                                    equipLevelList = MsgEquipLevelIDLis
                                },
                            gsSendMsg:sendNetMsg(NetPid1, NetMsg1);
                        _ ->
                            skip
                    end,
                    %% .发防守方进攻方
                    AttackerSortList = acKingBattleAllLogic:sortAttackerByDamage(),
                    %%{ok, #king_battle_attacker{mirrorDamage = OldDamage}} = getAttackerInfo(RoleID),
                    F =  fun(#king_battle_attacker{roleID = RoleId}) ->
                        case core:queryOnLineRoleByRoleID(RoleId) of
                            #rec_OnlinePlayer{netPid = NetPid} ->
                                NetMsg =
                                    #pk_GS2U_KingBattleResult{
                                        isNewKing = false,
                                        killNumOrHurt = KillNumber,
                                        days = Days,
                                        declaration = binToString(Declaration),
                                        name = Name,
                                        roleID =RoleID,
                                        career = Career,
                                        race = Race,
                                        sex = Sex,
                                        head = Head,
                                        wingLevel = WingLevel,
                                        fashionIDs = FashionIDList,
                                        equipIDList = MsgEquipmentList,
                                        equipLevelList = MsgEquipLevelIDLis
                                    },
                                gsSendMsg:sendNetMsg(NetPid, NetMsg);
                            _ ->
                                skip
                        end
                         end,
                    lists:foreach(F,AttackerSortList);
                _ -> skip
            end;
        {ok, #king_battle_attacker{roleID = AttackRoleID, fightForce = FightForce}} ->
            %%产生了新的守护者活动提前结束
            OldDefenderInfo = getCurrentDefenderInfo(),

			case core:queryRoleKeyInfoByRoleID(AttackRoleID) of
				#?RoleKeyRec{roleName = AttackerName, level = Level, career = Career} ->
					%%雕像生命在获取雕像信息时再进行初始化
					addNewDefenderInfo(#rec_guard_mirror{
						roleID = AttackRoleID, roleName = AttackerName, roleLevel = Level,
						roleCareer = Career, fightForce = FightForce});
				_ ->
					?ERROR_OUT("KingBattleAll_6:~p", [AttackRoleID]),
					skip
			end,

			getRolesAppearanceFromDB(AttackRoleID),

            OldRoleID =
            case OldDefenderInfo of
                {ok, #rec_guard_mirror{roleID = OldDefenderRoleID}} ->
                    acKingbattleAward:sendAwardWhenDefenderFail(AttackRoleID, OldDefenderRoleID),
                    OldDefenderRoleID;
                _ ->
                    ok
            end,


            #?RoleKeyRec{roleName = Name,career = Career1,race = Race,sex = Sex,head = Head} = core:queryRoleKeyInfoByRoleID(AttackRoleID),
            %%[#rec_base_role{roleName = Name,career = Career1,race = Race,sex = Sex,head = Head}] = ets:lookup(ets_rec_base_role, AttackRoleID),
            {ok,#king_battle_mirror_appearance{equipIDList =EquipList,equipLevelList = EquipLevelIDList, fashionIDList = FashionIDList, wingLevel=WingLevel }}=acKingBattleAllLogic:getMirrorAppearance(AttackRoleID),
            MsgEquipmentList = [#pk_PlayerKingBattleEquip{equipID =EquipID,quality = Quarlity }||#recVisibleEquip{equipID = EquipID,quality = Quarlity}<-EquipList],
            MsgEquipLevelIDLis=[#pk_PlayerKingBattleEquipLevel{type = EqType,level = EqLv}||{ EqType, EqLv}<-EquipLevelIDList] ,
            {ok, #king_battle_attacker{mirrorDamage = OldDamage}} = getAttackerInfo(AttackRoleID),
            %% .展示新王者雕像结算面板，发防守方

            case core:queryOnLineRoleByRoleID(OldRoleID) of
                #rec_OnlinePlayer{netPid = NetPid1} ->
                    NetMsg1 =
                        #pk_GS2U_KingBattleResult{
                            isNewKing = true,
                            killNumOrHurt = OldDamage,
                            days = 0,
                            declaration = "",
                            name = Name,
                            roleID =AttackRoleID,
                            career = Career1,
                            race = Race,
                            sex = Sex,
                            head = Head,
                            wingLevel = WingLevel,
                            fashionIDs = FashionIDList,
                            equipIDList = MsgEquipmentList,
                            equipLevelList = MsgEquipLevelIDLis
                        },
                    gsSendMsg:sendNetMsg(NetPid1, NetMsg1);
                _ ->
                    skip
            end,
            %% .展示新王者雕像结算面板，发攻防
            AttackerSortList = acKingBattleAllLogic:sortAttackerByDamage(),
            F =  fun(#king_battle_attacker{roleID = RoleId}) ->
                 case core:queryOnLineRoleByRoleID(RoleId) of
                     #rec_OnlinePlayer{netPid = NetPid} ->
                         NetMsg =
                             #pk_GS2U_KingBattleResult{
                                 isNewKing = true,
                                 killNumOrHurt = OldDamage,
                                 days = 0,
                                 declaration = "",
                                 name = Name,
                                 roleID =AttackRoleID,
                                 career = Career1,
                                 race = Race,
                                 sex = Sex,
                                 head = Head,
                                 wingLevel = WingLevel,
                                 fashionIDs = FashionIDList,
                                 equipIDList = MsgEquipmentList,
                                 equipLevelList = MsgEquipLevelIDLis
                             },
                          gsSendMsg:sendNetMsg(NetPid, NetMsg);
                     _ ->
                         skip
                 end
              end,
            lists:foreach(F,AttackerSortList)
           %% delAttacker(AttackRoleID)
    end,
    acKingbattleAward:sendRankAward(),
    %%此处必须要强制关闭活动，活动有可能是因为防守方失败而关闭的
    psMgr:sendMsg2PS(?PsNameActivity, setActivePhase, {?ActivityType_KingBattleAll, ?ActivityPhase_Close}),
    ok;
activityChangeCallBack(Phase) ->
    ?ERROR_OUT("~p ~p activityChangeCallBack:~p", [?MODULE, self(), Phase]),
    ok.

%% 全服tips
-spec sendTipsToAllPlayer(ErrorCode :: uint()) -> ok.
sendTipsToAllPlayer(ErrorCode) ->
    Msg = playerMsg:getErrorCodeMsg(ErrorCode, []),
    playerMgrOtp:sendMsgToAllPlayer([Msg]),
    ok.

%% 怪物死亡
monsterDead({_MapID, _MapPID, AttackRoleID, _MonsterCode, MonsterID}) ->
    %%MonsterID是战天下才用的镜像id,就是镜像被杀了
    {ok, #rec_guard_mirror{roleID = DefenderID} = MirrorInfo} = getCurrentDefenderInfo(),
    case getMirrorInfo(DefenderID) of
        {ok,{MonsterID, _X1, _Y1}} ->
            updateDefenderInfo(MirrorInfo#rec_guard_mirror{hpNumber = 0}),
            updateAttackerInfo(AttackRoleID, [{#king_battle_attacker.isKillMirror, true}]),
            ?DEBUG_OUT("======monsterDead=======MonsterID=~p~n", [MonsterID]),
            psMgr:sendMsg2PS(?PsNameActivity, setActivePhase, {?ActivityType_KingBattleAll, ?ActivityPhase_KingBattleAll_6}),
            ok;
        _ ->
            skip
    end,
    ok.


%%镜像被伤害
-spec monsterDamage(Data :: tuple()) -> ok.
monsterDamage({_MapID, _MapPID, RealAttackOwnerID, _TargetCode, TargetID, DiffHP}) ->
    case getCurrentDefenderInfo() of
        {ok, #rec_guard_mirror{roleID = RoleID}} ->
            case getMirrorInfo(RoleID) of
                {ok,{TargetID, _, _}} ->
                    mirrorDamageByRole({RealAttackOwnerID, DiffHP});
                _ ->
                    skip
            end;
        _ -> skip
    end,
    ok.

%% 有人死亡
-spec playerDead(RoleID :: uint()) -> ok.
playerDead(_RoleID) ->
    ok.

%%%%地图消毁
onMapDestroy({_MapPid, [MarrorMonster | _]}) ->
    #globalsetupCfg{setpara = MirroringList} = getCfg:getCfgByArgs(cfg_globalsetup, mirroring),
    IDIsMirror = lists:keyfind(MarrorMonster#recMapObject.id, 1, MirroringList),
    ?LOG_OUT("~p:onMapDestroy  bossID[~p] hp[~p] keyfined[~p]", [
        ?MODULE,
        MarrorMonster#recMapObject.id,
        MarrorMonster#recMapObject.hp,
        IDIsMirror]),
    case MarrorMonster#recMapObject.hp > 0 of
        true when IDIsMirror =/= false ->
            [Row | _] = edb:readAllRecord(rec_guard_mirror),
            NewRow = Row#rec_guard_mirror{
                hpNumber = MarrorMonster#recMapObject.hp
            },
            updateDefenderInfo(NewRow),
            ok;
        _ ->
            skip
    end,
    clearAttackerInfo(),
    ok;
onMapDestroy(_) -> ok.

%% ====================================================================
%% state functions
%% ====================================================================

%%统计杀人次数
-spec killedTarget({InRoleID :: uint64(), AttackRoleID :: uint64()}) -> ok.
killedTarget({DeadRoleID, AttackRoleID}) ->
    ?DEBUG_OUT("killedTarget ~p", [DeadRoleID]),
    HasList = getKillRoleIDList(),
    case edb:readAllRecord(rec_guard_mirror) of
        [#rec_guard_mirror{roleID = RoleID} | _] when RoleID =:= AttackRoleID ->
            ?DEBUG_OUT("killedTarget2 ~p", [DeadRoleID]),
            setKillRoleIDList([DeadRoleID | HasList]);
        _ ->
            skip
    end,
    ok.

%%设置杀人数
setKillRoleIDList(RoleID) ->
    put('KillRoleID', RoleID).
getKillRoleIDList() ->
    case get('KillRoleID') of
        undefined ->
            [];
        Val ->
            Val
    end.

%%记录玩家对mirror的伤害
-spec mirrorDamageByRole({RoleID :: uint64(), Value :: number()}) -> ok.
mirrorDamageByRole({RoleID, Value}) ->
    {ok, #king_battle_attacker{mirrorDamage = OldDamage}} = getAttackerInfo(RoleID),
    updateAttackerInfo(RoleID, [{#king_battle_attacker.mirrorDamage, OldDamage + Value}]).

%%活动地图pid
-spec setACMapPid(MapPid :: pid() | undefined) -> term().
setACMapPid(MapPid) ->
    put('ACMapPid', MapPid).

-spec getACMapPid() -> pid() | undefined.
getACMapPid() ->
    get('ACMapPid').


%%角色离开活动时的名额处理
-spec offlineInMap(RoleID :: uint64()) -> ok.
offlineInMap(RoleID) ->
    Argu = logicArguLib:getRoleBaseInfoArgu(RoleID),
    R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_AC_KING_BATTLE_EXIT_ACTIVE_SENCE, [Argu]),
    ?DEBUG_OUT("R=====ACMapMsg_PlayerLeave====~p~n", [R]),
    ok.

%%角色试图进入本活动地图,判断人数是否足够,可进入就记录该玩家
%%-spec joinKingBattleAC(RoleID :: uint64()) -> ErrorCode :: uint32()|{MapID :: uint32(), MapPid :: pid(), X :: float(), Y :: float()}.
joinKingBattleAC({RoleID, PlayerHistoryForce}) ->
    ?DEBUG_OUT("canInMap ~p", [RoleID]),
    ActiveIsOpen = activeStateIsOpen(),
    case getACMapPid() of
        Pid when erlang:is_pid(Pid) and ActiveIsOpen ->
            case edb:readAllRecord(rec_guard_mirror) of
                [#rec_guard_mirror{roleID = KingRoleID} | _] ->
                    if
                        RoleID =:= KingRoleID ->
                            DCfgList = globalCfg:getGlobalCfgList(fightall_defend),
                            Index = misc:rand(1, erlang:length(DCfgList)),
                            XYPos = lists:nth(Index, DCfgList),
                            {globalCfg:getGlobalCfg(fightall_map_id), Pid, XYPos};
                        true ->
                            [{AttackerNumber}, _CostIDS] = globalCfg:getGlobalCfgList(fightall_attacker),
                            ACfgList = globalCfg:getGlobalCfgList(fightall_attack),
                            Index = misc:rand(1, erlang:length(ACfgList)),
                            XYPos = lists:nth(Index, ACfgList),
                            ?ERROR_OUT("Error   joinKingBattleAC   [~p]      ", [RoleID]),
                            addAttackerInfo(RoleID, PlayerHistoryForce),
                            case AttackerNumber > getOnlineAttackerNumber() of
                                true ->
                                    {globalCfg:getGlobalCfg(fightall_map_id), Pid, XYPos};
                                false ->
                                    ?ErrorCode_KingBattleNotHaveQuota
                            end
                    end;
                _ ->
                    ?ErrorCode_KingBattleNoKing
            end;
        _ ->
            ?ErrorCode_KingBattleNotStart
    end.

%%王者战天下 产雕像
-spec createKingMirroring() -> ok.
createKingMirroring() ->
    case edb:readAllRecord(rec_guard_mirror) of
        [] -> ?ERROR_OUT("rec_guard_mirror empty");
        [#rec_guard_mirror{ } | _] ->
            PID = getACMapPid(),
            psMgr:sendMsg2PS(PID, createKingMirroringToMap)
    end,
    ok.

binToString(BinStr) when erlang:is_list(BinStr) ->
    BinStr;
binToString(BinStr) ->
    erlang:binary_to_list(BinStr).

getKingFromForceRankExcludeRoleID(ExcludeRoleID) ->
    L = myEts:lookUpEts(?TABLE_RankInfo, ?PlayerRankType_FightingCapacity),
    LevelRank = myEts:lookUpEts(?TABLE_RankInfo, ?PlayerRankType_LevelExp),
    SortLevelRank = lists:keysort(#recPlayerRank.value1, LevelRank),
    %%把升序改为降序
    SortLevelRankDesc = lists:reverse(SortLevelRank),
    Count = erlang:length(SortLevelRank),
    CountCnf = globalCfg:getGlobalCfg(fightall_open_count),
    TopNList =
        case erlang:length(SortLevelRank) >= CountCnf of
            true ->
                {TopNList2, _} = lists:split(CountCnf, SortLevelRankDesc),
                TopNList2;
            false ->
                []
        end,
    Number = lists:foldl(fun(One, Acc) ->
        Acc + One#recPlayerRank.value1
                         end, 0, TopNList),
    Avg = Number / CountCnf,
    AvgCnf = globalCfg:getGlobalCfg(fightall_open_level),
    NewL = lists:keydelete(ExcludeRoleID, #recPlayerRank.roleID, L),
    SortL = lists:keysort(#recPlayerRank.value1, NewL),
    case SortL of
        [] ->
            undefined;
        _ when AvgCnf < Avg, CountCnf < Count ->
            TopOne = lists:last(SortL),
            ?LOG_OUT("getKingFromForceRank rank roleID:~p", [TopOne#recPlayerRank.roleID]),
            {TopOne#recPlayerRank.roleID, TopOne#recPlayerRank.value1};
        _ ->
            undefined
    end.
%%取战力排行榜第一名,将其作为王者
-spec getKingFromForceRank() -> RoleID :: uint64() | undefined.
getKingFromForceRank() ->
    getKingFromForceRankExcludeRoleID(0).

%%每天定时更新王者守卫榜
-spec refreshKingRank() -> ok.
refreshKingRank() ->
    case edb:readAllRecord(rec_guard_mirror) of
        [#rec_guard_mirror{roleID = RoleID, guardTimes = GuardTimes} | _] ->
            case edb:readRecord(rec_guard_mirror_rank, RoleID) of
                [H | _] when erlang:is_record(H, rec_guard_mirror_rank), GuardTimes > H#rec_guard_mirror_rank.days ->
                    NewRow =
                        H#rec_guard_mirror_rank{
                            days = GuardTimes
                        },
                    edb:writeRecord(update_rec_guard_mirror_rank, NewRow),

                    edb:deleteRecord(rec_guard_mirror_rank, RoleID),
                    edb:writeRecord(rec_guard_mirror_rank, NewRow);
                [] ->
                    NewRow =
                        #rec_guard_mirror_rank{
                            roleID = RoleID,
                            days = 1
                        },
                    edb:writeRecord(new_rec_guard_mirror_rank, NewRow),
                    edb:deleteRecord(rec_guard_mirror_rank, RoleID),
                    edb:writeRecord(rec_guard_mirror_rank, NewRow);
                _ ->
                    skip
            end;
        _ ->
            skip
    end,
    ok.

%%查找指定主城的所有mapPid，广播消息
-spec refreshMarrorStatue() -> ok.
refreshMarrorStatue() ->
    StatueInMapID = globalCfg:getGlobalCfg(main_map_id),
    PidList = mapMgrState:getMapInfoByMapID(StatueInMapID),
    ?LOG_OUT("statue map pidlist:~p", [PidList]),
    Fun = fun
              (MapPidInfo) when erlang:is_pid(MapPidInfo#recMapInfo.pid) ->
                  psMgr:sendMsg2PS(MapPidInfo#recMapInfo.pid, createKingStatueToMap);
              (_) ->
                  skip
          end,
    lists:foreach(Fun, PidList),
    ok.

%%根据当前数据，生成伤害榜与扩展数据
-spec damageRank(RoleID :: uint64()) -> {MsgData :: #pk_GS2U_ActivityMapRankData{}, MsgExt :: #pk_GS2U_MyRankingAndDamage{}| #pk_GS2U_MyKillNumber{}}.
damageRank(RoleID) ->
    List = sortAttackerByDamage(),
    RankNumMax = globalCfg:getGlobalCfg(fightall_InjuryStatistics),
    Data = createRankMsg([], 1, RankNumMax, List),
    MsgData = #pk_GS2U_ActivityMapRankData{type = ?ActivityType_KingBattleAll, data = Data},
    MsgExt = createExtData(RoleID, List),
    {MsgData, MsgExt}.

%%取前N名
-spec createRankMsg(HasMsgList :: [#pk_ActivityMapRankData{}], CurrNum :: uint(), MaxNum :: uint(), List :: list()) -> [#pk_ActivityMapRankData{}].
createRankMsg(HasMsgList, CurrNum, MaxNum, [#king_battle_attacker{roleID = RoleID, mirrorDamage = DamageValue} | Tail]) when CurrNum =< MaxNum ->
	RoleName = playerNameUID:getPlayerNameByUID(RoleID),
    N = #pk_ActivityMapRankData{name = RoleName, value = DamageValue},
    createRankMsg([N | HasMsgList], CurrNum + 1, MaxNum, Tail);
createRankMsg(HasMsgList, _CurrNum, _MaxNum, []) ->
    HasMsgList.

%%榜单扩展数据
createExtData(RoleID, Data) ->
    case edb:readAllRecord(rec_guard_mirror) of
        [#rec_guard_mirror{roleID = RoleIDEdb} | _] when RoleIDEdb =/= RoleID ->
            case getAttackerRankIndex(RoleID, Data, 1) of
                {ok, {Index, #king_battle_attacker{mirrorDamage = DamageValue}}} ->
                    ok;

                {error, none} ->
                    Index = 0,
                    DamageValue = 0
            end,
            #pk_GS2U_MyRankingAndDamage{
                type = ?ActivityType_KingBattleAll,
                ranking = Index,
                damage = DamageValue
            };
        _ ->
            case getAttackerRankIndex(RoleID, Data, 1) of
                {ok, {Index, #king_battle_attacker{mirrorDamage = DamageValue}}} ->
                    #pk_GS2U_MyRankingAndDamage{
                        type = ?ActivityType_KingBattleAll,
                        ranking = Index,
                        damage = DamageValue
                    };
                {error, none} ->
                    #pk_GS2U_MyKillNumber{
                        type = ?ActivityType_KingBattleAll,
                        killNumber = erlang:length(getKillRoleIDList())
                    };
            _->
                #pk_GS2U_MyKillNumber{
                   type = ?ActivityType_KingBattleAll,
                    killNumber = erlang:length(getKillRoleIDList())
                }
            end
    end.
%%获取进攻方的名次
%%@return {ok,index}|{error,none}
%%getAttackerRankIndex(RoleID) ->
%%    AttackSortList = sortAttackerByDamage(),
%%    case getAttackerRankIndex(RoleID, AttackSortList, 1) of
%%        {ok, {Index, AttackerInfo}} ->
%%            {ok, Index};
%%        {error, none} ->
%%            {error, none}
%%    end.
getAttackerRankIndex(_RoleID, [], _Index) ->
    {error, none};
getAttackerRankIndex(RoleID, [#king_battle_attacker{roleID = RoleID} = AttackerInfo | _], Index) ->
    {ok, {Index, AttackerInfo}};
getAttackerRankIndex(RoleID, [_ | AttackSortList], Index) ->
    getAttackerRankIndex(RoleID, AttackSortList, Index + 1).

addNewDefenderInfo(NewDefender0 = #rec_guard_mirror{fightForce = FightForce}) ->
    NewDefender = NewDefender0#rec_guard_mirror{

        hpNumber = playerForce2MirroeHp(FightForce),
        guardTimes = 0,
        mirrorBuffCfgID = ?AC_KING_BATTLE_MIRROR_DEFAULT_BUFF_CFG_ID,        %%给镜像购买的buffID,
        roleBuffCffgID = ?AC_KING_BATTLE_ROLE_DEFAULT_BUFF_CFG_ID %%玩家给自己购买的buffID
    },
    mnesia:clear_table(rec_guard_mirror),
    mnesia:clear_table(new_rec_guard_mirror),
    mnesia:clear_table(update_rec_guard_mirror),
    edb:writeRecord(rec_guard_mirror, NewDefender),
    edb:writeRecord(new_rec_guard_mirror, NewDefender),
    updateDefenderInfo(NewDefender).
getCurrentDefenderInfo() ->
    case edb:readAllRecord(rec_guard_mirror) of


        [#rec_guard_mirror{} = Info | _] ->
            {ok, Info};
        _ ->
            {error, none}
    end.
%%获取王者守护防御者信息
getDefenderInfo(RoleID) ->
    case mnesia:dirty_read(rec_guard_mirror, RoleID) of
        [] -> {error, none};
        [Info] -> {ok, Info}
    end.
%%更新王者守护防守方信息
updateDefenderInfo(#rec_guard_mirror{} = GuardMirror) ->
    edb:writeRecord(update_rec_guard_mirror, GuardMirror),
    mnesia:dirty_write(GuardMirror).
%%获取进攻方数据
getAttackerInfo(RoleID) ->
    case ets:lookup(king_battle_attacker, RoleID) of
        [] -> {error, none};
        [Info] -> {ok, Info}
    end.

%%更新进攻方数据
updateAttackerInfo(RoleID, AttrList) ->

    ets:update_element(king_battle_attacker, RoleID, AttrList).

%%更新进攻方数据
addAttackerInfo(RoleID, FightForce) ->
    case ets:lookup(king_battle_attacker, RoleID) of
        [] ->

            ets:insert(king_battle_attacker, #king_battle_attacker{roleID = RoleID, isInActiveSence = true, fightForce = FightForce, buffCfgID = ?AC_KING_BATTLE_ROLE_ATTACKER_BUFF_CFG_ID});
        _ -> skip
    end.
%%删除指定的进攻方
delAttacker(AttackRoleID) ->
    ets:delete(king_battle_attacker, AttackRoleID).
%%清除掉所有的进攻方数据
clearAttackerInfo() ->
    ets:delete_all_objects(king_battle_attacker).
%%获取在线的进攻方人数
getOnlineAttackerNumber() ->
    Condition = ets:fun2ms(
        fun(#king_battle_attacker{isInActiveSence = IsInActiveSence}) ->
            IsInActiveSence
        end),
    ets:select_count(king_battle_attacker, Condition).
%%通过伤害值来对攻击方人员进行排序
sortAttackerByDamage() ->
    AttackerList = ets:tab2list(king_battle_attacker),
    AscSortList = lists:keysort(#king_battle_attacker.mirrorDamage, AttackerList),
    lists:reverse(AscSortList).
%%将玩家战斗力转换成镜像血量
playerForce2MirroeHp(FightForce) ->
    erlang:trunc(FightForce * 400).
%%获取新的守护者
getNewDefender() ->
    AttackerList = ets:tab2list(king_battle_attacker),
    KillMirrorList =
        lists:filter(
            fun(#king_battle_attacker{isKillMirror = IsKillMirror}) ->
                IsKillMirror
            end, AttackerList),
    case KillMirrorList of
        [NewDefender] ->
            {ok, NewDefender};
        _ ->
            {ok, none}
    end.
%%获取镜像下一层配置的buffID
getUserNextFoolBuffCfgIDByRole(RoleID) ->
    case getUserCurrentFoolBuffCfgIDByRole(RoleID) of
        {ok, CurrentBuffCfgID} ->
            getNextBuffByCfgID(CurrentBuffCfgID);
        {error, Info} ->
            {error, Info}
    end.

%%获取镜像下一层配置的buffID
getUserCurrentFoolBuffCfgIDByRole(RoleID) ->
    case getAttackerInfo(RoleID) of
        {ok, #king_battle_attacker{buffCfgID = CurrentBuffCfgID}} ->
            {ok, CurrentBuffCfgID};
        _ ->
            case getDefenderInfo(RoleID) of
                {ok, #rec_guard_mirror{roleBuffCffgID = CurrentBuffCfgID}} ->
                    {ok, CurrentBuffCfgID};
                _ ->
                    {error, ?AC_KING_BATTLE_ERROR_CODE_NOT_JOIN}
            end
    end.

%%获取最高层buffID
getUserMaxFoolBuffIDByRole(RoleID) ->
    case getUserNextFoolBuffCfgIDByRole(RoleID) of
        {ok, NextBuffID} ->
            getMaxBuffByCfgID(NextBuffID);
        {error, ErrorCode} ->
            {error, ErrorCode}
    end.

getMaxBuffByCfgID(CurrentBuffID) ->
    case getNextBuffByCfgID(CurrentBuffID) of
        {ok, NextBuffID} ->
            getMaxBuffByCfgID(CurrentBuffID, NextBuffID);
        _ ->
            {ok, CurrentBuffID}
    end.

getMaxBuffByCfgID(_CurrentBuffID, NextBuffID) ->
    case getNextBuffByCfgID(NextBuffID) of
        {ok, NewNextBuffID} ->
            getMaxBuffByCfgID(NextBuffID, NewNextBuffID);
        _ ->
            {ok, NextBuffID}
    end.

getNextBuffByCfgID(CurrentBuffCfgID) ->
    ?DEBUG_OUT("=========cfg_acKingBattleBuyBuff========~p~n", [CurrentBuffCfgID]),
    case getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, CurrentBuffCfgID) of
        #acKingBattleBuyBuffCfg{nextCfgID = ?NEXT_CFG_BUFF_END_ID} ->
            {error, ?AC_KING_BATTLE_ERROR_CODE_BUFF_IS_MAX};
        #acKingBattleBuyBuffCfg{nextCfgID = NextCfgID} ->
            {ok, NextCfgID}
    end.
%%获取镜像外观信息
getMirrorAppearance(DefenderID) ->
    case ets:lookup(king_battle_mirror_appearance, DefenderID) of
        [] -> {error, none};
        [Info] -> {ok, Info}
    end.
%%保存镜像外观数据
saveMirrotApperance([]) ->
    ?ERROR_OUT("not found role!"),
    ok;
saveMirrotApperance([{RoleID, WingLevel, _TitleRec, EquipInfoList, EquipLvList, _FashionIDList} = TempInfo]) ->
    ?DEBUG_OUT("MirrorAppearance:~p", [TempInfo]),
    case getMirrorAppearance(RoleID) of
        {ok, _Info} ->
            ets:update_element(king_battle_mirror_appearance, RoleID, [{#king_battle_mirror_appearance.equipIDList, EquipInfoList},
                {#king_battle_mirror_appearance.equipLevelList, EquipLvList},
                {#king_battle_mirror_appearance.fashionIDList, _FashionIDList},
                {#king_battle_mirror_appearance.wingLevel, WingLevel}]);
        {error, none} ->
            ets:insert(king_battle_mirror_appearance, #king_battle_mirror_appearance{roleID = RoleID, equipLevelList = EquipLvList, equipIDList = EquipInfoList,fashionIDList = _FashionIDList, wingLevel = WingLevel})
    end.
%%全局开关控制，是否开启王者荣耀是否开启。true为开启
globalControlIsOpen() ->
    variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_KingBattleAll).
%%{ok,{MonsterID, X, Y}}|{error,none}
getMirrorInfo(RoleID) ->
    MirroringList = globalCfg:getGlobalCfgList(mirroring),
    case ets:lookup(ets_rec_base_role, RoleID) of
        [#rec_base_role{career = Career, sex = Sex, camp = Camp}] ->
            {_, {MonsterID, X, Y}} = lists:keyfind({Career, Sex, Camp}, 1, MirroringList),
            {ok,{MonsterID, X, Y}};
        _ ->
            {error,none}
    end.

getRolesAppearanceFromDB(RoleID) ->
    case ets:lookup(ets_recPlayerRankInfo, RoleID) of
        [#recPlayerRankInfo{} = Info] ->
            saveMirrotApperance([{
                Info#recPlayerRankInfo.roleID,
                Info#recPlayerRankInfo.wingLevel,
                Info#recPlayerRankInfo.title,
                Info#recPlayerRankInfo.visibleEquips,
                Info#recPlayerRankInfo.visibleEquipLevels,
                Info#recPlayerRankInfo.fashionIDs
            }]);
        _ ->
            gsSendMsg:sendMsg2DBServer(getRolesAppearanceFromDB, 0, [RoleID])
    end.
%%删除角色
%%这里只需要做守护者数据重置和进攻方数据清除的工作。数据库里面的守护者信息不需要刻意去删除。
%%当有新的守护者生成时会自动删除老的守护者信息。当服务器重启之后如果再缓存内获取不到守护者玩家信息，将会重新生成守护者
deleteRole(RoleID) ->
%%    clearGMFightRoleID(),
    case activityLogic:getActivePhase(?ActivityType_KingBattleAll) of
        {ok, Phase} when (Phase =:= ?ActivityPhase_KingBattleAll_6) or (Phase =:= ?ActivityPhase_Close) ->
            case getDefenderInfo(RoleID) of
                {ok, #rec_guard_mirror{}} ->
                    ?DEBUG_OUT("====deleteRole==0==~p~n", [{Phase, RoleID}]),
                    mnesia:clear_table(rec_guard_mirror),
                    %%重置新的守护者玩家
                    resetKingDataExcludeRoleID(RoleID),
                    ok;
                _ ->
                    ?DEBUG_OUT("====deleteRole==1==~p~n", [RoleID]),
                    delAttacker(RoleID)
            end;
        {ok, _} ->
            case getDefenderInfo(RoleID) of
                {ok, #rec_guard_mirror{}} ->
                    ?DEBUG_OUT("====deleteRole==2==~p~n", [RoleID]),
                    mnesia:clear_table(rec_guard_mirror),
                    psMgr:sendMsg2PS(activityOtp, setActivePhase, {?ActivityType_KingBattleAll, ?ActivityPhase_KingBattleAll_6}),
                    %%重置新的守护者玩家
                    resetKingDataExcludeRoleID(RoleID),
                    ok;
                _ ->
                    delAttacker(RoleID)
            end;
        _ ->
            skip
    end.
%%活动是否为开启状态
activeStateIsOpen() ->
    case activityLogic:getActivePhase(?ActivityType_KingBattleAll) of
        {ok, ?ActivityPhase_KingBattleAll_5} ->
            true;
        _ ->
            false
    end.