%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%% 点金手
%%% @end
%%% Created : 24. 五月 2017 19:20
%%%-------------------------------------------------------------------
-module(playerMoneyTree).
-author("Administrator").

-include("playerPrivate.hrl").

-define(DailySubType_MoneyTree_Number, 1).
-define(DailySubType_MoneyTree_CD, 2).


-define(MoneyTreeFree_Times, 1).
%% API
-export([
	giveMeMoney/0
]).


%%%-------------------------------------------------------------------
giveMeMoney()->
	case canGiveMoney() of
		{true, Cost}->
			doGiveMoney(Cost);
		{_, ErrorCode}->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.

%%%-------------------------------------------------------------------
canGiveMoney()->
	NC = getNumber(),
	MC = getMaxNumber(),
	Cost = getCost(NC),
	case NC < MC of
		true->
			checkCost(Cost);
		_ ->
			{false, -1}
	end.

%%%-------------------------------------------------------------------
checkCost(0)->
	NowCD = getCD(),
	FreeCD = getCfgFreeCd(),
	Now = time2:getTimestampSec(),
	case Now + FreeCD >= NowCD of
		true ->
			{true, 0};
		_ ->
			{false, -2}
	end;
checkCost(Cost)->
	case playerState:getCoin(?CoinTypeBindDiamond) >= Cost of
		true ->
			{true, Cost};
		_ ->
			{false, -1}
	end.

%%%-------------------------------------------------------------------
doGiveMoney(Cost)->
	true = playerMoney:decCoin(
		?CoinTypeBindDiamond
		, Cost
		, #recPLogTSMoney{
			reason = ?CoinUseMoneyTree,
			param = [],
			target = ?PLogTS_Marriage,
			source = ?PLogTS_PlayerSelf
		}),

	incNumber(),
	
	RandRate = getRandRate(),
	BaseCoin = getBaseCoin(),
	TotalCoin = misc:ceil(RandRate * BaseCoin),
	playerMoney:addCoin(
		?CoinTypeGold
		, TotalCoin
		, #recPLogTSMoney{
			reason = ?CoinSourceMoneyTree,
			param = [],
			target = ?PLogTS_PlayerSelf,
			source = ?PLogTS_PlayerSelf
		}),

	playerMsg:sendNetMsg(#pk_GS2U_MoneyTreeAck{
		totalMoney = TotalCoin,rate = RandRate
	}),


	onGiveMoney(Cost, getNumber()),
	ok.

%%%-------------------------------------------------------------------
onGiveMoney(0, _Number)->
	setCD(),
	ok;
onGiveMoney(_Cost, Number)->
	BoxRate = getBoxRate(),
	BoxBase = getBoxBaseCoin(Number),
	BoxTotal = misc:ceil(BoxBase * BoxRate),
	case BoxTotal > 0 of
		true ->
			playerMoney:addCoin(
				?CoinTypeGold
				, BoxTotal
				, #recPLogTSMoney{
					reason = ?CoinSourceMoneyTree,
					param = [],
					target = ?PLogTS_PlayerSelf,
					source = ?PLogTS_PlayerSelf
				}),
			playerMsg:sendNetMsg(#pk_GS2U_MoneyTreeBox{
				totalMoney = BoxTotal, rate = BoxRate
			});
		_ ->
			skip
	end.

%%%-------------------------------------------------------------------
getCost(CN) ->
	case CN < ?MoneyTreeFree_Times of
		true ->
			0;
		_ ->
			999999999
	end.

%%%-------------------------------------------------------------------
getBaseCoin()->
	Level = playerState:getLevel(),
	case getCfg:getCfgByArgs(cfg_indexFunction_chs, Level) of
		#indexFunctionCfg{} ->
			0;
		_ ->
			1
	end.

%%%-------------------------------------------------------------------
getBoxBaseCoin(Number)->
	L =
	case getCfg:getCfgByArgs(cfg_globalsetup, coinHand_limit) of
		#globalsetupCfg{setpara = V} ->
			V;
		_ ->
			[]
	end,
	case lists:keyfind(Number, 1, L) of
		{_, Base} ->
			Base;
		_ ->
			0
	end.

getBoxRate()->
	Level = playerState:getLevel(),
	case getCfg:getCfgByArgs(cfg_indexFunction_chs, Level) of
		#indexFunctionCfg{} ->
			0;
		_ ->
			1
	end.

%%%-------------------------------------------------------------------
getRandRate()->
	L = getRandList(),
	misc:calcOddsByWeightList(L).

getRandList()-> [].

%%%-------------------------------------------------------------------
getMaxNumber() ->
	case getCfg:getCfgByArgs(cfg_globalsetup, coinHand_limit) of
		#globalsetupCfg{setpara = [V]} ->
			V;
		_ ->
			10
	end.

%%%-------------------------------------------------------------------
getCfgFreeCd()->
	case getCfg:getCfgByArgs(cfg_globalsetup, coinHand_cd) of
		#globalsetupCfg{setpara = [V]} ->
			V;
		_ ->
			3600
	end.

%%%-------------------------------------------------------------------
getNumber()->
	playerDaily:getDailyCounter(?DailyType_MoneyTree
		, ?DailySubType_MoneyTree_Number).


incNumber()->
	playerDaily:incDailyCounter(?DailyType_MoneyTree
		, ?DailySubType_MoneyTree_Number).

%%%-------------------------------------------------------------------

getCD()->
	playerDaily:getDailyCounter(?DailyType_MoneyTree
		, ?DailySubType_MoneyTree_CD).

setCD()->
	Now = time2:getTimestampSec(),
	FreeCD = getCfgFreeCd(),
	NewCD = Now + FreeCD,
	playerDaily:incDailyCounter(?DailyType_MoneyTree
		, ?DailySubType_MoneyTree_CD
		, NewCD).

