%%%处理与LoginServer的消息通信

-module(lsMsgHandler).

-include("netmsgRecords.hrl").
-include("logger.hrl").
-include("../player/playerPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	revokeRoleMoney/3,
	revokeRoleItem/3,
	revokeRoleReputation/3
]).

-spec revokeRoleItem(ItemList::[{UID::uint64(),ItemID::uint32(),Num::int32()}],RoleID::uint64(),OperateUser::string())->ok.
revokeRoleItem(ItemList,RoleID,OperateUser)->
	gsSendMsg:sendMsg2DBServer(revokeRoleItem, 0, {ItemList,RoleID}),

	[ addRevokeItem(UID,ItemID,Num,DecNum,RoleID,OperateUser) || {UID,ItemID,Num,DecNum}<- ItemList],
	ok.

%%扣物品日志
addRevokeItem(UID,ItemID,Old,Num,RoleID,OperateUser) ->
	Plog = #recPLogTSItem{
		old = Old,
		new = Old-Num,
		change = Num,
		target = ?PLogTS_Revoke,
		source = ?PLogTS_PlayerSelf,
		gold = 0,
		goldtype = 0,
		changReason = ?ItemDeleteReasonRevokeItem,
		reasonParam = ItemID
	},
	%%记录删除日志
	Logrec = #recLogGoodsChange{
		itemUID = UID,
		itemID = ItemID,
		change = Num,
		playerID = RoleID,
		changReason = OperateUser,
		reasonParam = ItemID
	},
	dbLog:sendSaveLogChangeGoods(Logrec, Plog),
	ok.

-spec revokeRoleMoney(MoneyList::[{MoneyType::uint32(),MoneyValue::int32(),OldMoneyValue::uint32()}],RoleID::uint64(),OperateUser::string()) ->ok.
revokeRoleMoney(MoneyList,RoleID,OperateUser) ->
	MoneyList2 = [ #rec_player_coin{
		roleID ={RoleID,MoneyType},
		coinType =MoneyType,
		coinNumber=MoneyValue
	} || {MoneyType,MoneyValue,_OldMoneyValue} <- MoneyList],
	[addLog(MoneyType,0,-MoneyValue,OldMoneyValue,RoleID,OperateUser) || {MoneyType,MoneyValue,OldMoneyValue} <- MoneyList],
	?WARN_OUT("revokeRoleMoney ~p",[MoneyList2]),
	gsSendMsg:sendMsg2DBServer(revokeRoleMoney, 0, {MoneyList2}),
	ok.

-spec revokeRoleReputation( Old_Dec::list() , RoleID::uint32(),OperateUser::string() ) ->ok.
revokeRoleReputation([Old, Dec], RoleID,OperateUser) ->
	?WARN_OUT("revokeRoleReputation Old:~p, Dec:~p, RoleID:~p,OperateUser:~ts",[Old, Dec, RoleID,OperateUser]),
	gsSendMsg:sendMsg2DBServer(revokeRoleReputation, 0, {Old, Dec, RoleID}),
	ok.

%%添加金钱变化LOG
-spec addLog(CoinType, NewCoin, CoinNum, OldCoin, RoleID::uint64(),OperateUser::string()) -> ok when
	CoinType::coinType(),NewCoin::uint(),CoinNum::uint(),OldCoin::uint().
addLog(CoinType, NewCoin, CoinNum, OldCoin,RoleID,OperateUser) ->
%% 	{Fgi,FedID,PlatformName} = playerState:getFuncellInfo(),
	Rec = #recLogCoin{
		playerID = RoleID,
		accountID = 0,
		platformName = "null",
		oldcoin = OldCoin,
		newcoin = NewCoin,
		addOrDec = ?DelCoin,
		changecoin = CoinNum,
		reason = ?CoinUseRevokeMoney,
		target = ?PLogTS_Revoke,
		source = ?PLogTS_PlayerSelf,
		param = OperateUser,
		dbID = gsMainLogic:getDBID4GS(),
		moneyType = CoinType
	},
	case CoinNum >= 0 of
		true->
			dbLog:sendSaveLogCoinChange(CoinType, Rec);
		false->
			dbLog:sendSaveLogCoinChange(CoinType, Rec#recLogCoin{addOrDec = ?DelCoin})
	end,
	case CoinType of
		?CoinTypeDiamond ->
			GoldRec = erlang:setelement(1, Rec, recLogGold),
			case CoinNum >= 0 of
				true->
					dbLog:sendSaveLogGold(GoldRec);
				false->
					dbLog:sendSaveLogGold(GoldRec#recLogGold{addOrDec = ?DelCoin})
			end;
		_->
			skip
	end,
	ok.
%% ====================================================================
%% Internal functions
%% ====================================================================

%dealMsg(State,Cmd,Bin) ->
%	{Pk, LeftBin} = netmsgRead:readNetMsg(Cmd, Bin),
%	onMsg(Cmd, Pk, State),
%	LeftBin.
%
%onMsg(_, Pk, _) ->
%	?DEBUG_OUT("UnHandle Info ~p", [Pk]).

