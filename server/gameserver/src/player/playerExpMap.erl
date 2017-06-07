%%
%% @author zhongyunawei
%% @doc @todo 玩家技能相关.


-module(playerExpMap).
-author(zhongyuanwei).

-include("playerPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	goToExpMap/0,
	onExpMap/1
]).
%%传送到经验地图
goToExpMap()->
	RoleBaseArgu=logicArguLib:getRoleBaseInfoArgu(),
	MapIdArgu = logicArguLib:getCurrentMapId(),
	R=logicLib:runLogicGroup(?LOGIC_GROUP_ID_ENTER_EXP_MAP,[RoleBaseArgu,MapIdArgu]),
	?DEBUG_OUT("R============~p~n",[R]),
	ok.
%%用户在经验地图
onExpMap(TickSubTime)->
	case playerState:getIsPlayer() of
		true ->
			RoleBaseArgu=logicArguLib:getRoleBaseInfoArgu(),
			MapIdArgu = logicArguLib:getCurrentMapId(),
			DailyCounterArgu=logicArguLib:getDailyCountArgu(?DailyType_EXP_MAP_EFFECT_TIME,0,TickSubTime),
			logicLib:runLogicGroup(?LOGIC_ID_ON_EXP_MAP,[RoleBaseArgu,MapIdArgu,DailyCounterArgu]);
		_ ->
			skip
	end,
	ok.