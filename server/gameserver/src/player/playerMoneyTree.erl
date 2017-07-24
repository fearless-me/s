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
-include("cfg_price.hrl").
-include("playerPrivate.hrl").

-define(DailySubType_MoneyTree_Number, 1).
-define(DailySubType_MoneyTree_CD, 2).
-define(MoneyTreeFree_Times, 2).
%% API
-export([
	giveMeMoney/0

]).



%%%-------------------------------------------------------------------
giveMeMoney()->

	case getCfg:getCfgPStack(cfg_welfare, 14) of
		#welfareCfg{parameter = Value2} ->

			case playerState:getLevel() >= Value2 of
				 true ->
					 case canGiveMoney() of
						 {true, Cost}->
							 doGiveMoney(Cost);
						 {_, ErrorCode}->
							 playerMsg:sendErrorCodeMsg(ErrorCode)
					 end;
				_->
					playerMsg:sendTipsErrorCodeMsg(?ErrorCode_YourLevelIsTooLower)
			end;
		_->
			skip
	end,

	ok.

%%%-------------------------------------------------------------------
canGiveMoney()->


	NC = getNumber()+1,
	MC = getMaxNumber(),
	Cost = getCost(NC),
	case NC =< MC of
		true->
			checkCost(Cost);
		_ ->
			{false, ?ErrorCode_UseSkillErrorNoUseCounter}
	end.

%%%-------------------------------------------------------------------
checkCost(0)->
	{true, 0};
checkCost(Cost)->
	case playerMoney:canUseCoin(?CoinUseTypeDiamond,Cost) of
		true ->
			{true, Cost};
		_ ->
			{false, ?ErrorCode_SystemNotEnoughMoney}
	end.

%%%-------------------------------------------------------------------
doGiveMoney(Cost)->


	PLog = #recPLogTSMoney{reason = ?CoinUseMoneyTree, param = [], target = ?PLogTS_MoneyTree, source = ?PLogTS_PlayerSelf},

	case playerMoney:useCoin(?CoinUseTypeDiamond, Cost, PLog) of
		  true->
			  incNumber(),
			  BoxRate = getBoxRate(),
			  {_,_,AddBoxMoney} =
				  case lists:keyfind(getNumber(),1,BoxRate) of
					  false ->  {0,0,0};
					  Rec ->
						  Rec
				  end,
			  BoxCoin =   getCoinBox(),
			  BoxTotal = misc:ceil(AddBoxMoney * BoxCoin),
			  RandRate = getRandRate(),
			  BaseCoin = getBaseCoin(),
			  TotalCoin = misc:ceil(RandRate * BaseCoin) ,

			  playerMoney:addCoin(
				  ?CoinTypeGold
				  , TotalCoin + BoxTotal
				  , #recPLogTSMoney{
					  reason = ?CoinSourceMoneyTree,
					  param = [],
					  target = ?PLogTS_PlayerSelf,
					  source = ?PLogTS_PlayerSelf
				  }),
			  playerMsg:sendNetMsg(#pk_GS2U_MoneyTreeAck{
				  totalMoney = TotalCoin, boxMoney = BoxTotal, rate = RandRate
			  });
		_->
			ship
	end,
	%%onGiveMoney(Cost, getNumber()),
	ok.

%%%-------------------------------------------------------------------
%%onGiveMoney(0, _Number)->
%%	%%setCD(),
%%	ok;
%%onGiveMoney(_Cost, Number)->
%%	BoxRate = getBoxRate(),
%%	{_,_,AddBoxMoney} =
%%	case lists:keyfind(Number,1,BoxRate) of
%%		  false ->  {0,0,0};
%%		Rec ->
%%			Rec
%%     end,
%%	BoxBase = getBoxBaseCoin(Number),
%%	BoxTotal = misc:ceil(AddBoxMoney * BoxRate),
%%	case BoxTotal > 0 of
%%		true ->
%%			playerMoney:addCoin(
%%				?CoinTypeGold
%%				, BoxTotal
%%				, #recPLogTSMoney{
%%					reason = ?CoinSourceMoneyTree,
%%					param = [],
%%					target = ?PLogTS_PlayerSelf,
%%					source = ?PLogTS_PlayerSelf
%%				}),
%%			playerMsg:sendNetMsg(#pk_GS2U_MoneyTreeBox{
%%				totalMoney = BoxTotal, rate = BoxRate
%%			});
%%		_ ->
%%			skip
%%	end.

%%%-------------------------------------------------------------------
getCost(CN) ->
	case CN < ?MoneyTreeFree_Times of
		true ->
			0;
		_ ->
			case getCfg:getCfgByArgs(cfg_price, CN) of
				#priceCfg{coinBuy   =  CoinBuy} ->
					CoinBuy;
				_ ->
					0
			end
	end.

%%%-------------------------------------------------------------------
getBaseCoin()->
	Level = playerState:getLevel(),
	case getCfg:getCfgByArgs(cfg_indexFunction, Level) of
		#indexFunctionCfg{coinAddition  =  CoinAddition} ->
			CoinAddition;
		_ ->
			0
	end.

getCoinBox()->
	Level = playerState:getLevel(),
	case getCfg:getCfgByArgs(cfg_indexFunction, Level) of
		#indexFunctionCfg{coinHand_box =   CoinHand_box} ->
			CoinHand_box;
		_ ->
			0
	end.

%%%-------------------------------------------------------------------
%%getBoxBaseCoin(Number)->
%%	L =
%%	case getCfg:getCfgByArgs(cfg_globalsetup, coinHand_limit) of
%%		#globalsetupCfg{setpara = V} ->
%%			V;
%%		_ ->
%%			[]
%%	end,
%%	case lists:keyfind(Number, 1, L) of
%%		{_, Base} ->
%%			Base;
%%		_ ->
%%			0
%%	end.

getBoxRate()->
	case getCfg:getCfgByArgs(cfg_globalsetup, coinHand_box) of
		#globalsetupCfg{setpara = V} ->
			V;
		_ ->
			[]
	end.

%%%-------------------------------------------------------------------
getRandRate()->
	L = getRandList(),
	misc:calcOddsByWeightList(L).

getRandList()->
	case getCfg:getCfgByArgs(cfg_globalsetup, coinHand_rate) of
         #globalsetupCfg{setpara = V} ->
           V;
         _ ->
         []
end.
%%%-------------------------------------------------------------------
getMaxNumber() ->
	case getCfg:getCfgByArgs(cfg_globalsetup, coinHand_limit) of
		#globalsetupCfg{setpara = [V]} ->
			V;
		_ ->
			10
	end.

%%%-------------------------------------------------------------------
%%getCfgFreeCd()->
%%	case getCfg:getCfgByArgs(cfg_globalsetup, coinHand_cd) of
%%		#globalsetupCfg{setpara = [V]} ->
%%			V;
%%		_ ->
%%			3600
%%	end.

%%%-------------------------------------------------------------------
getNumber()->
	playerDaily:getDailyCounter(?DailyType_MoneyTree
		, ?DailySubType_MoneyTree_Number).


incNumber()->
	playerDaily:incDailyCounter(?DailyType_MoneyTree
		, ?DailySubType_MoneyTree_Number).



%%%-------------------------------------------------------------------



