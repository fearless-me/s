%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 十二月 2016 14:22
%%%-------------------------------------------------------------------
-module(acKingBattleCondition).
-author("wenshaofei").
-include("gsInc.hrl").
-include("acKingBattleAllPrivatePrivate.hrl").
%% API
-compile(export_all).
%%当前的用户是守护方
currentPlayerIsDefender(Args, #conditionCfg{argu = []} = Cfg) ->
    {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
    case acKingBattleAllLogic:getDefenderInfo(RoleID) of
        {ok, #rec_guard_mirror{}} ->
            conditionLib:getSuccessReturn(Cfg);
        _ ->
            conditionLib:getFailReturn(Cfg)
    end.

%%当前用户是进攻方
currentPlayerIsAttacker(Args, #conditionCfg{argu = []} = Cfg) ->
    {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
    case acKingBattleAllLogic:getAttackerInfo(RoleID) of
        {ok, #king_battle_attacker{}} ->
            conditionLib:getSuccessReturn(Cfg);
        _ ->
            conditionLib:getFailReturn(Cfg)
    end.


%%当前的用户是守护方:在玩家进入活动地图加buff时使用，判断的同时会把当前的buff信息加到触发器参数内
currentPlayerIsDefenderAddBufInArgu(Args, #conditionCfg{argu = []} = Cfg) ->
    {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
    case acKingBattleAllLogic:getDefenderInfo(RoleID) of
        {ok, #rec_guard_mirror{roleBuffCffgID = BuffCfgID}} ->
            conditionLib:getSuccessReturn(Cfg#conditionCfg{toTriggleValue = [BuffCfgID], toTriggleValueKey = [?CK_KING_BATTLE_BUFF_CFG_ID]});
        _ ->
            conditionLib:getFailReturn(Cfg)
    end.

%%当前用户是进攻方:在玩家进入活动地图加buff时使用，判断的同时会把当前的buff信息加到触发器参数内
currentPlayerIsAttackerAddBufInArgu(Args, #conditionCfg{argu = []} = Cfg) ->
    {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
    case acKingBattleAllLogic:getAttackerInfo(RoleID) of
        {ok, #king_battle_attacker{buffCfgID = BuffCfgID}} ->
            conditionLib:getSuccessReturn(Cfg#conditionCfg{toTriggleValue = [BuffCfgID], toTriggleValueKey = [?CK_KING_BATTLE_BUFF_CFG_ID]});
        _ ->
            conditionLib:getFailReturn(Cfg)
    end.

%%升级角色buff需要使用的钱足够
upLevelRoleBuffCoinEnough(Args, #conditionCfg{} = Cfg) ->
    {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
    {ok, BuffCfgID} = acKingBattleAllLogic:getUserNextFoolBuffCfgIDByRole(RoleID),
    #acKingBattleBuyBuffCfg{coinType = CoinType, coin = Value} = getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, BuffCfgID),
    ?DEBUG_OUT("=====upLevelRoleBuffCoinEnough======~p~n", [{CoinType, Value}]),
    %%  如果货币花费校验通过，则将新的buffID传递给后续的trigger，trigger会根据传递进来的参数来加对应的buff
    playerCondation:canUseCoinGe(Args, Cfg#conditionCfg{argu = [CoinType, Value], toTriggleValue = [BuffCfgID], toTriggleValueKey = [?CK_KING_BATTLE_BUFF_CFG_ID]}).
%%升级角色buff需要使用的钱不足
upLevelRoleBuffCoinNotEnough(Args, #conditionCfg{} = Cfg) ->
    {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
    {ok, BuffCfgID} = acKingBattleAllLogic:getUserNextFoolBuffCfgIDByRole(RoleID),
    #acKingBattleBuyBuffCfg{coinType = CoinType, coin = Value} = getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, BuffCfgID),
    playerCondation:canUseCoinL(Args, Cfg#conditionCfg{argu = [CoinType, Value]}).

%%一键升级角色buff需要使用的钱足够
upLevelRoleBuffOneKeyCoinEnough(Args, #conditionCfg{} = Cfg) ->
    {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
    {ok, BuffCfgID} = acKingBattleAllLogic:getUserCurrentFoolBuffCfgIDByRole(RoleID),
    #acKingBattleBuyBuffCfg{oneKeyBuyCoin = Value, oneKeyBuyCoinType = CoinType} = getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, BuffCfgID),
    {ok,MaxBuffCfgID}=acKingBattleAllLogic:getUserMaxFoolBuffIDByRole(RoleID),
    %%  如果货币花费校验通过，则将新的buffID传递给后续的trigger，trigger会根据传递进来的参数来加对应的buff
    playerCondation:canUseCoinGe(Args, Cfg#conditionCfg{argu = [CoinType, Value], toTriggleValue = [MaxBuffCfgID], toTriggleValueKey = [?CK_KING_BATTLE_BUFF_CFG_ID]}).
%%一键升级角色buff需要使用的钱不足
upLevelRoleBuffOneKeyCoinNotEnough(Args, #conditionCfg{} = Cfg) ->
    {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
    {ok, BuffCfgID} = acKingBattleAllLogic:getUserCurrentFoolBuffCfgIDByRole(RoleID),
    #acKingBattleBuyBuffCfg{oneKeyBuyCoin = Value, oneKeyBuyCoinType = CoinType} = getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, BuffCfgID),
    playerCondation:canUseCoinL(Args, Cfg#conditionCfg{argu = [CoinType, Value]}).


%%升级镜像buff需要使用的钱足够
upLevelMirrorBuffCoinEnough(Args, #conditionCfg{argu = []} = Cfg) ->
    {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
    {ok, #rec_guard_mirror{mirrorBuffCfgID = MirrorBuffID}} = acKingBattleAllLogic:getDefenderInfo(RoleID),
    {ok, BuffCfgID} = acKingBattleAllLogic:getNextBuffByCfgID(MirrorBuffID),
    #acKingBattleBuyBuffCfg{coinType = CoinType, coin = Value} = getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, BuffCfgID),
    %%  如果货币花费校验通过，则将新的buffID传递给后续的trigger，trigger会根据传递进来的参数来加对应的buff
    playerCondation:canUseCoinGe(Args, Cfg#conditionCfg{argu = [CoinType, Value], toTriggleValue = [BuffCfgID], toTriggleValueKey = [?CK_KING_BATTLE_BUFF_CFG_ID]}).
%%升级镜像buff需要使用的钱不足
upLevelMirrorBuffCoinNotEnough(Args, #conditionCfg{argu = []} = Cfg) ->
    {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
    {ok, #rec_guard_mirror{mirrorBuffCfgID = MirrorBuffID}} = acKingBattleAllLogic:getDefenderInfo(RoleID),
    {ok, BuffCfgID} = acKingBattleAllLogic:getNextBuffByCfgID(MirrorBuffID),
    #acKingBattleBuyBuffCfg{coinType = CoinType, coin = Value} = getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, BuffCfgID),
    playerCondation:canUseCoinL(Args, Cfg#conditionCfg{argu = [CoinType, Value]}).

%%一键升级镜像buff需要使用的钱足够
upLevelMirrorBuffOneKeyCoinEnough(Args, #conditionCfg{argu = []} = Cfg) ->
    {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
    {ok, #rec_guard_mirror{mirrorBuffCfgID = MirrorBuffID}} = acKingBattleAllLogic:getDefenderInfo(RoleID),
    {ok, MaxLevelBuffCfgID} = acKingBattleAllLogic:getMaxBuffByCfgID(MirrorBuffID),
    #acKingBattleBuyBuffCfg{oneKeyBuyCoin = Value, oneKeyBuyCoinType = CoinType} = getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, MirrorBuffID),
    %%  如果货币花费校验通过，则将新的buffID传递给后续的trigger，trigger会根据传递进来的参数来加对应的buff
    playerCondation:canUseCoinGe(Args, Cfg#conditionCfg{argu = [CoinType, Value], toTriggleValue = [MaxLevelBuffCfgID], toTriggleValueKey = [?CK_KING_BATTLE_BUFF_CFG_ID]}).

%%一键升级镜像buff需要使用的钱不足
upLevelMirrorBuffOneKeyCoinNotEnough(Args, #conditionCfg{argu = []} = Cfg) ->
    {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
    {ok, #rec_guard_mirror{mirrorBuffCfgID = MirrorBuffID}} = acKingBattleAllLogic:getDefenderInfo(RoleID),
    #acKingBattleBuyBuffCfg{oneKeyBuyCoin = Value, oneKeyBuyCoinType = CoinType} = getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, MirrorBuffID),
    playerCondation:canUseCoinL(Args, Cfg#conditionCfg{argu = [CoinType, Value]}).

%%玩家的buff还没有购买到最高层
playerBuffNotMax(Args, #conditionCfg{} = Cfg) ->
    {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
    case acKingBattleAllLogic:getUserNextFoolBuffCfgIDByRole(RoleID) of
        {ok, _BuffCfgID} ->
            conditionLib:getSuccessReturn(Cfg);
        _ ->
            conditionLib:getFailReturn(Cfg)
    end.

%%玩家的buff已经购买到最高层
playerBuffMax(Args, #conditionCfg{} = Cfg) ->
    {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
    case acKingBattleAllLogic:getUserNextFoolBuffCfgIDByRole(RoleID) of
        {ok, _BuffCfgID} ->
            conditionLib:getFailReturn(Cfg);
        _ ->
            conditionLib:getSuccessReturn(Cfg)
    end.


%%玩家的buff还没有购买到最高层
mirrorBuffNotMax(Args, #conditionCfg{} = Cfg) ->
    {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
    {ok, #rec_guard_mirror{mirrorBuffCfgID = MirrorBuffID}} = acKingBattleAllLogic:getDefenderInfo(RoleID),
    case acKingBattleAllLogic:getNextBuffByCfgID(MirrorBuffID) of
        {ok, _BuffCfgID} ->
            conditionLib:getSuccessReturn(Cfg);
        _ ->
            conditionLib:getFailReturn(Cfg)
    end.

%%玩家的buff已经购买到最高层
mirrorBuffMax(Args, #conditionCfg{} = Cfg) ->
    {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
    {ok, #rec_guard_mirror{mirrorBuffCfgID = MirrorBuffID}} = acKingBattleAllLogic:getDefenderInfo(RoleID),
    case acKingBattleAllLogic:getNextBuffByCfgID(MirrorBuffID) of
        {ok, _BuffCfgID} ->
            conditionLib:getFailReturn(Cfg);
        _ ->
            conditionLib:getSuccessReturn(Cfg)
    end.

