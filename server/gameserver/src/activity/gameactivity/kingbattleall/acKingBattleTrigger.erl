%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 十二月 2016 14:23
%%%-------------------------------------------------------------------
-module(acKingBattleTrigger).
-author("wenshaofei").
-include("gsInc.hrl").
-include("acKingBattleAllPrivatePrivate.hrl").
-include("playerLog.hrl").
%% API
-compile(export_all).

%%给镜像增加buff，只能用在玩家进程内部
addBuff2mirror(#triggerCfg{} = Cfg, Args, FromCondationArgu) ->
  {ok,[BuffCfgID]}=logicLib:getLogicArguValue(?CK_KING_BATTLE_BUFF_CFG_ID,FromCondationArgu),
  #acKingBattleBuyBuffCfg{buffID = BuffID} = getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, BuffCfgID),
  CurrMapPid = playerState:getMapPid(),
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
  {ok, #rec_guard_mirror{} = MirrorInfo} = acKingBattleAllLogic:getDefenderInfo(RoleID),
  acKingBattleAllLogic:updateDefenderInfo(MirrorInfo#rec_guard_mirror{mirrorBuffCfgID = BuffCfgID}),
  psMgr:sendMsg2PS(CurrMapPid, addBuff4KingMarror, BuffID),
  triggerLib:getSuccessReturn(Cfg, Args, FromCondationArgu).

%%给防御者增加buff，只能用在玩家进程内部
addBuff2Defender(#triggerCfg{} = Cfg, Args, FromCondationArgu) ->

  {ok,[BuffCfgID]}=logicLib:getLogicArguValue(?CK_KING_BATTLE_BUFF_CFG_ID,FromCondationArgu),
  #acKingBattleBuyBuffCfg{buffID = BuffID} = getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, BuffCfgID),
  %CurrMapPid = playerState:getMapPid(),
  {ok, #rec_base_role{roleID = RoleID,level =Level }} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
  {ok, #rec_guard_mirror{} = MirrorInfo} = acKingBattleAllLogic:getDefenderInfo(RoleID),
  ?DEBUG_OUT("==addBuff2Defender==BuffCfgID==============~p~n",[{BuffCfgID,MirrorInfo,FromCondationArgu}]),
  acKingBattleAllLogic:updateDefenderInfo(MirrorInfo#rec_guard_mirror{roleBuffCffgID =  BuffCfgID}),
  playerBuff:addBuff(BuffID, Level),
  triggerLib:getSuccessReturn(Cfg, Args, FromCondationArgu).

%%给进攻方增加buff，只能用在玩家进程内部
addBuff2Attacker(#triggerCfg{} = Cfg, Args, FromCondationArgu) ->
  {ok,[BuffCfgID]}=logicLib:getLogicArguValue(?CK_KING_BATTLE_BUFF_CFG_ID,FromCondationArgu),
  #acKingBattleBuyBuffCfg{buffID = BuffID} = getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, BuffCfgID),
  %CurrMapPid = playerState:getMapPid(),
  {ok, #rec_base_role{roleID = RoleID,level =Level }} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
  acKingBattleAllLogic:updateAttackerInfo(RoleID ,[{#king_battle_attacker.buffCfgID,BuffCfgID}]),
  playerBuff:addBuff(BuffID, Level),
  triggerLib:getSuccessReturn(Cfg, Args, FromCondationArgu).
%%将进攻者改成参与状态
changeAttackerStateJoin(#triggerCfg{} = Cfg, Args, FromCondationArgu) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
  acKingBattleAllLogic:updateAttackerInfo(RoleID ,[{#king_battle_attacker.isInActiveSence,true}]),
  triggerLib:getSuccessReturn(Cfg, Args, FromCondationArgu).
%%将进攻者改成离开状态
changeAttackerStateLeave(#triggerCfg{} = Cfg, Args, FromCondationArgu) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
  acKingBattleAllLogic:updateAttackerInfo(RoleID ,[{#king_battle_attacker.isInActiveSence,false}]),
  triggerLib:getSuccessReturn(Cfg, Args, FromCondationArgu).
%%扣钱:当防守者给自己购买buff时
deductCoinWhenDeferderSelfByBuff(#triggerCfg{id=TriggerID} = Cfg, Args, FromCondationArgu) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
  {ok,[BuyBuffCfgID]}=logicLib:getLogicArguValue(?CK_KING_BATTLE_BUFF_CFG_ID,FromCondationArgu),
  #acKingBattleBuyBuffCfg{} = getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, BuyBuffCfgID),
  {ok,#rec_guard_mirror{roleBuffCffgID = RoleBuffID}}=acKingBattleAllLogic:getDefenderInfo(RoleID),
  #acKingBattleBuyBuffCfg{nextCfgID = NextBuffID,coinType = CoinType,coin = Coin,oneKeyBuyCoin = OnekeyCoinValue,oneKeyBuyCoinType = OnKeyType } = getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, RoleBuffID),
  if
    NextBuffID =:= BuyBuffCfgID ->
      true =playerMoney:useCoin(CoinType, Coin, #recPLogTSMoney{reason = ?CoinUseKingBattleAll, param = TriggerID, target = ?PLogTS_Item4KingBattleAll, source = ?PLogTS_PlayerSelf});
    true ->
      true =playerMoney:useCoin(OnKeyType, OnekeyCoinValue, #recPLogTSMoney{reason = ?CoinUseKingBattleAll, param = TriggerID, target = ?PLogTS_Item4KingBattleAll, source = ?PLogTS_PlayerSelf})
  end,
  triggerLib:getSuccessReturn(Cfg, Args, FromCondationArgu).
%%扣钱：当防守者给镜像购买buff时
deductCoinWhenMirrorByBuff(#triggerCfg{id=TriggerID} = Cfg, Args, FromCondationArgu) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
  {ok,[BuyBuffCfgID]}=logicLib:getLogicArguValue(?CK_KING_BATTLE_BUFF_CFG_ID,FromCondationArgu),
  #acKingBattleBuyBuffCfg{} = getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, BuyBuffCfgID),
  {ok,#rec_guard_mirror{mirrorBuffCfgID = CurrentBuffID}}=acKingBattleAllLogic:getDefenderInfo(RoleID),
  #acKingBattleBuyBuffCfg{nextCfgID = NextBuffID,coinType = CoinType,coin = Coin,oneKeyBuyCoin = OnekeyCoinValue,oneKeyBuyCoinType = OnKeyType } = getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, CurrentBuffID),
  if
    NextBuffID =:= BuyBuffCfgID ->
      true =playerMoney:useCoin(CoinType, Coin, #recPLogTSMoney{reason = ?CoinUseKingBattleAll, param = TriggerID, target = ?PLogTS_Item4KingBattleAll, source = ?PLogTS_PlayerSelf});
    true ->
      true =playerMoney:useCoin(OnKeyType, OnekeyCoinValue, #recPLogTSMoney{reason = ?CoinUseKingBattleAll, param = TriggerID, target = ?PLogTS_Item4KingBattleAll, source = ?PLogTS_PlayerSelf})
  end,
  triggerLib:getSuccessReturn(Cfg, Args, FromCondationArgu).
%%扣钱：当进攻方购买buff时
deductCoinWhenAttackerByBuff(#triggerCfg{id=TriggerID} = Cfg, Args, FromCondationArgu) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
  {ok,[BuyBuffCfgID]}=logicLib:getLogicArguValue(?CK_KING_BATTLE_BUFF_CFG_ID,FromCondationArgu),
  #acKingBattleBuyBuffCfg{} = getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, BuyBuffCfgID),
  {ok,#king_battle_attacker{buffCfgID =  CurrentBuffID}}=acKingBattleAllLogic:getAttackerInfo(RoleID),
  #acKingBattleBuyBuffCfg{nextCfgID = NextBuffID,coinType = CoinType,coin = Coin,oneKeyBuyCoin = OnekeyCoinValue,oneKeyBuyCoinType = OnKeyType } = getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, CurrentBuffID),
  if
    NextBuffID =:= BuyBuffCfgID ->
      true =playerMoney:useCoin(CoinType, Coin, #recPLogTSMoney{reason = ?CoinUseKingBattleAll, param = TriggerID, target = ?PLogTS_Item4KingBattleAll, source = ?PLogTS_PlayerSelf});
    true ->
      true =playerMoney:useCoin(OnKeyType, OnekeyCoinValue, #recPLogTSMoney{reason = ?CoinUseKingBattleAll, param = TriggerID, target = ?PLogTS_Item4KingBattleAll, source = ?PLogTS_PlayerSelf})
  end,
  triggerLib:getSuccessReturn(Cfg, Args, FromCondationArgu).