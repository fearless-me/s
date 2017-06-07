%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc 实现玩家数据条件校验的业务逻辑
%%%
%%% @end
%%% Created : 06. 九月 2016 10:41
%%%-------------------------------------------------------------------
-module(playerCondation).
-author("wenshaofei").
-include("../private_logic.hrl").
%% API
-compile(export_all).
%%监测玩家的等级在指定区间内
playerLevelInterregional(Args, #conditionCfg{argu = [MinLv, MaxLv]} = Cfg) ->
	{ok, #rec_base_role{level = Level}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
	if
		(MinLv =< Level) and (Level =< MaxLv) ->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)
	end.
%%监测玩家的等级不在指定区间内
playerLevelLe(Args, #conditionCfg{argu = [Lv]} = Cfg) ->
	{ok, #rec_base_role{level = Level}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
	if
		(Level =< Lv) ->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)
	end.
playerLevelGe(Args, #conditionCfg{argu = [Lv]} = Cfg) ->
	{ok, #rec_base_role{level = Level}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
	if
		(Level >= Lv) ->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)
	end.

%%监测玩家的等级不在指定区间内
playerLevelL(Args, #conditionCfg{argu = [Lv]} = Cfg) ->
	{ok, #rec_base_role{level = Level}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
	if
		Level < Lv ->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)
	end.
playerLevelG(Args, #conditionCfg{argu = [Lv]} = Cfg) ->
	{ok, #rec_base_role{level = Level}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
	if
		(Level > Lv) ->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)

	end.


%%校验每日计数是否小于等于指定的值
playerDailyCountLe(_Args, #conditionCfg{argu = [DailyType, DailyID, MaxValue]} = Cfg) ->
	?CheckDailyType(DailyType),
	CurrentNumber = playerDaily:getDailyCounter(DailyType, DailyID),
	if
		CurrentNumber =< MaxValue ->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)
	end.
%%校验每日计数是否大于等于指定的值
playerDailyCountGe(_Args, #conditionCfg{argu = [DailyType, DailyID, MinValue]} = Cfg) ->
	?CheckDailyType(DailyType),
	CurrentNumber = playerDaily:getDailyCounter(DailyType, DailyID),
	if
		CurrentNumber >= MinValue ->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)
	end.


%%校验每日计数是否小于等于指定的值
playerDailyCountL(_Args, #conditionCfg{argu = [DailyType, DailyID, MaxValue]} = Cfg) ->
	?CheckDailyType(DailyType),
	CurrentNumber = playerDaily:getDailyCounter(DailyType, DailyID),
	if
		CurrentNumber < MaxValue ->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)
	end.
%%校验每日计数是否大于等于指定的值
playerDailyCountG(_Args, #conditionCfg{argu = [DailyType, DailyID, MinValue]} = Cfg) ->
	?CheckDailyType(DailyType),
	CurrentNumber = playerDaily:getDailyCounter(DailyType, DailyID),
	if
		CurrentNumber > MinValue ->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)
	end.
%%判断玩家是否能按照货币使用规则来进行消费
canUseCoinGe(_Args, #conditionCfg{argu = [CoinType, ValueList, Reason]} = Cfg) when is_list(ValueList)->
	Num = case Reason of
			  ?CoinBuyActionPoint->
				  playerDaily:getDailyCounter(?DailyType_Action_Piont_Buy_Number, 0);
			  _ ->
				  0
		  end,
	Value = misc:getListValue(Num+1,lists:reverse(ValueList)),
	case playerMoney:canUseCoin(CoinType, Value) of
		true ->
			conditionLib:getSuccessReturn(Cfg);
		_ ->
			conditionLib:getFailReturn(Cfg)
	end;
canUseCoinGe(_Args, #conditionCfg{argu = [CoinType, Value]} = Cfg) ->
	case playerMoney:canUseCoin(CoinType, Value) of
		true ->
			conditionLib:getSuccessReturn(Cfg);
		_ ->
			conditionLib:getFailReturn(Cfg)
	end.

%%判断玩家是否能按照货币使用规则来进行消费
canUseCoinL(_Args, #conditionCfg{argu = [CoinType, ValueList, Reason]} = Cfg) when is_list(ValueList)->
	Num = case Reason of
			  ?CoinBuyActionPoint->
				  playerDaily:getDailyCounter(?DailyType_Action_Piont_Buy_Number, 0);
			  _ ->
				  0
		  end,
	Value = misc:getListValue(Num+1,lists:reverse(ValueList)),
	case playerMoney:canUseCoin(CoinType, Value) of
		true ->
			conditionLib:getFailReturn(Cfg);
		_ ->
			conditionLib:getSuccessReturn(Cfg)
	end;
canUseCoinL(_Args, #conditionCfg{argu = [CoinType, Value]} = Cfg) ->
	case playerMoney:canUseCoin(CoinType, Value) of
		true ->
			conditionLib:getFailReturn(Cfg);
		_ ->
			conditionLib:getSuccessReturn(Cfg)
	end.

%%判断玩家特定类型的货币是否大于等于指定的值
checkCoinByTypeGe(_Args, #conditionCfg{argu = [CoinType, Value]} = Cfg) ->
	CurrentValue = playerState:getCoin(CoinType),
	if
		CurrentValue >= Value ->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)
	end.
%%判断玩家特定类型的货币是否小于等于指定的值
checkCoinByTypeLe(_Args, #conditionCfg{argu = [CoinType, Value]} = Cfg) ->
	CurrentValue = playerState:getCoin(CoinType),
	if
		CurrentValue =< Value ->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)
	end.

%%%判断玩家属性是否大于等于指定的值
%playerPropGe(Args, #conditionCfg{argu = [PropType, Value]} = Cfg) ->
%  CurrentValue = playerPropSync:getProp(PropType),
%  if
%    CurrentValue >= Value ->
%      conditionLib:getSuccessReturn(Cfg);
%    true ->
%      conditionLib:getFailReturn(Cfg)
%  end.
%
%%%判断玩家属性是否大于指定的值
%playerPropG(Args, #conditionCfg{argu = [PropType, Value]} = Cfg) ->
%  CurrentValue = playerPropSync:getProp(PropType),
%  if
%    CurrentValue > Value ->
%      conditionLib:getSuccessReturn(Cfg);
%    true ->
%      conditionLib:getFailReturn(Cfg)
%  end.
%
%%%判断玩家属性是否小于等于指定的值
%playerPropLe(Args, #conditionCfg{argu = [PropType, Value]} = Cfg) ->
%  CurrentValue = playerPropSync:getProp(PropType),
%  if
%    CurrentValue =< Value ->
%      conditionLib:getSuccessReturn(Cfg);
%    true ->
%      conditionLib:getFailReturn(Cfg)
%  end.
%%%判断玩家属性是否小于指定的值
%playerPropL(Args, #conditionCfg{argu = [PropType, Value]} = Cfg) ->
%  CurrentValue = playerPropSync:getProp(PropType),
%  if
%    CurrentValue < Value ->
%      conditionLib:getSuccessReturn(Cfg);
%    true ->
%      conditionLib:getFailReturn(Cfg)
%  end.
%%当前玩家是骑乘状态
currentPlayerOnMount(_Args, #conditionCfg{} = Cfg) ->
	case playerPetDouble:isInDoubleMountState() of
		true ->
			conditionLib:getSuccessReturn(Cfg);
		_ ->
			case playerState:getPetMounts() of
				{_, ?PetOnMount} ->
					conditionLib:getSuccessReturn(Cfg);
				_ ->
					conditionLib:getFailReturn(Cfg)
			end
	end.
%%当前玩家不是骑乘状态
currentPlayerOffMount(_Args, #conditionCfg{} = Cfg) ->
	case playerState:getPetMounts() of
		{_, ?PetOnMount} ->
			conditionLib:getFailReturn(Cfg);
		_ ->
			conditionLib:getSuccessReturn(Cfg)
	end.

%%当前玩家是在双人骑乘状态
currentPlayerOnDoubbleMount(_Args, #conditionCfg{} = Cfg) ->
	case playerPetDouble:isInDoubleMountState() of
		true ->
			conditionLib:getSuccessReturn(Cfg);
		_ ->
			conditionLib:getFailReturn(Cfg)
	end.

%%当前玩家是在单人骑乘状态
currentPlayerNotOnDoubbleMount(_Args, #conditionCfg{} = Cfg) ->
	case playerPetDouble:isInDoubleMountState() of
		true ->
			conditionLib:getFailReturn(Cfg);
		_ ->
			conditionLib:getSuccessReturn(Cfg)
	end.