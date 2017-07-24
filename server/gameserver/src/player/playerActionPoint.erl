%%%-------------------------------------------------------------------
%%% @author 温少飞
%%% @copyright (C) 2016, <COMPANY>
%%% @doc 用户体力值系统
%%%
%%% @end
%%% Created : 12. 十月 2016 17:47
%%%-------------------------------------------------------------------
-module(playerActionPoint).
-author("wenshaofei").
-include("playerPrivate.hrl").

-define(DaySeconds, 86400).
-define(DaysFrom0To1970, 719528).
%% API
-export([
	getActionPoint/0,
	queryActionPoint/0,
	deductActionPoint/1,
	addActionPoint/1,
	buyActionPoint/0
]).

buyActionPoint()->
	logicLib:runLogicGroup(?LOGIC_GROUP_ID_BUY_ACTION_POINT,[]).

getActionPoint()->
	[_,Value]=getActionPoint1(),
	Value.

queryActionPoint()->
	[LastUtcSec, NewValue] = getActionPoint1(),
	playerMsg:sendNetMsg(#pk_GS2U_action_point_info{
		value = NewValue,
		lastUpdateUtcTime = LastUtcSec  - ?DaySeconds * ?DaysFrom0To1970
	}).

%%获取用户体力点数
getActionPoint1() ->
	case playerPropSync:getProp(?SerProp_ActionPoint) of
		[LasFreshUTCSec, Value] ->
			case getActionPoint2([LasFreshUTCSec, Value]) of
				[LasFreshUTCSec, Value] ->
					[LasFreshUTCSec, Value];
				[NewFreshUTCSec, Value] ->
					playerPropSync:setAny(?SerProp_ActionPoint,  [NewFreshUTCSec, Value]),
					[NewFreshUTCSec, Value];
				[NewFreshUTCSec, NewValue] ->
					playerPropSync:setAny(?SerProp_ActionPoint,  [NewFreshUTCSec, NewValue]),
					[NewFreshUTCSec, NewValue]
			end;
		_ ->
			ResetMax = globalCfg:getGlobalCfg(player_action_point_reset_max),
			NewFreshUTCSec = time2:getUTCDateTimeSec(),
			playerPropSync:setAny(?SerProp_ActionPoint, [NewFreshUTCSec, ResetMax]),
			[NewFreshUTCSec, ResetMax]
	end.

getActionPoint2([0, 0]) ->
	[time2:getUTCDateTimeSec(), globalCfg:getGlobalCfg(player_action_point_reset_max)];	%% 初始化
getActionPoint2([LasFreshUTCSec, Value]) ->
	ResetMax = globalCfg:getGlobalCfg(player_action_point_reset_max),
	Max = globalCfg:getGlobalCfg(player_action_point_max),
	NowUTCSec = time2:getUTCDateTimeSec(),
	[NowUTCSec0, Value0] =
		case core:utcTimeIsDayReset(LasFreshUTCSec) of
%%			true when Value >= ResetMax ->
%%				[NowUTCSec, Value];
			true ->
				[NowUTCSec, 0];
			false ->
				case Value >= ResetMax of
					true ->
						[NowUTCSec, Value];	%% 达到重置值时禁止回复
					_ ->
						%% 此处可能由于巨大的时间差异导致回复量从低于重置值直接变为高于重置值，因此需要二次验证重置值
						[IncreaseTimeStep, IncreaseTimeValue] = globalCfg:getGlobalCfgList(
							action_point_increase_info),
						NewValue = erlang:trunc((NowUTCSec - LasFreshUTCSec) / IncreaseTimeStep) * IncreaseTimeValue + Value,
						if
							NewValue >= ResetMax ->
								[NowUTCSec, ResetMax];	%% 自动回复上限为重置值
							NewValue =:= Value ->
								[LasFreshUTCSec, NewValue];
							true ->
								[NowUTCSec, NewValue]
						end
				end
		end,
	%% 最后验证最大值
	case Value0 > Max of
		true ->
			[NowUTCSec0, Max];
		_ ->
			[NowUTCSec0, Value0]
	end.

%%扣除体力值
-spec deductActionPoint(Value::uint32()) -> boolean().
deductActionPoint(Value) when is_integer(Value)->
	{NewProp, NewValue, IsSuccess} =
		case getActionPoint1() of
			[UTCSec, CurrentValue] when CurrentValue < Value ->
				{[UTCSec, 0], 0, false};
			[UTCSec, CurrentValue] ->
				NewValue2 = CurrentValue - Value,
				{[UTCSec, NewValue2], NewValue2, true}
		end,
	case IsSuccess of
		true ->
			[NowUtc | _] = NewProp,
			playerMsg:sendNetMsg(#pk_GS2U_action_point_info{value = NewValue, lastUpdateUtcTime = NowUtc  - ?DaySeconds * ?DaysFrom0To1970 }),
			playerPropSync:setAny(?SerProp_ActionPoint, NewProp);
		_ ->
			?ERROR_OUT("deductActionPoint failed ~p,~p", [playerState:getRoleID(), Value]),
			skip
	end,
	IsSuccess.

%%增加体力值
addActionPoint(Value)->
	[UTCSec,CurrentValue] =getActionPoint1(),
	Max = globalCfg:getGlobalCfg(player_action_point_max),
	TempNewValue =  CurrentValue+Value,
	if
		TempNewValue >Max ->
			NewValue =Max;
		true ->
			NewValue =  CurrentValue + Value
	end,
	playerMsg:sendNetMsg(#pk_GS2U_action_point_info{value =NewValue,lastUpdateUtcTime = UTCSec  - ?DaySeconds * ?DaysFrom0To1970  }),
	playerPropSync:setAny(?SerProp_ActionPoint, [UTCSec, NewValue]).