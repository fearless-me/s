%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 安全区
%%% @end
%%% Created : 24. 八月 2017 10:33
%%%-------------------------------------------------------------------
-module(playerSafe).
-author(tiancheng).

-include("playerPrivate.hrl").

%% 不可攻击，不可被攻击的BUFFID
-define(PeaceBuffID, 62020).

%% API
-export([
	playerChangeMap/2,
	playerChangePos/2
]).

playerChangePos(X, Y) ->
	playerChangePos(X, Y, mapSafeRange()).

playerChangePos(_X, _Y, 0) -> ok;
playerChangePos(X, Y, Range) ->
	case isInSafeRange(X, Y, Range) of
		true ->
			addPeaceMode();
		false ->
			deletePeaceMode()
	end.

playerChangeMap(X, Y) ->
	%% 如果是和平地图，则删除，否则调用ChangePos
	case mapSafeRange() of
		0 ->
			deletePeaceMode();
		Range ->
			playerChangePos(X, Y, Range)
	end.


addPeaceMode() ->
	case getPlayerSafeMode() of
		true ->
			skip;
		_ ->
			setPlayerSafeMode(true),

			Lvl = playerState:getLevel(),
			%% 安全区
			playerBuff:addBuff(?PeaceBuffID, Lvl),

			%% 宠物增加和平BUFF
			case playerPet:getPetBattleCode() of
				0 ->
					skip;
				Code ->
					monsterBuff:addBuff(Code, ?PeaceBuffID, Lvl)
			end,

			playerMsg:sendErrorCodeMsg(?ErrorCode_InPeaceSafeMode)
	end,
	ok.

deletePeaceMode() ->
	case getPlayerSafeMode() of
		false ->
			skip;
		_ ->
			setPlayerSafeMode(false),

			%% 非安全区
			playerBuff:delBuff(?PeaceBuffID),

			%% 删除宠物BUFF
			case playerPet:getPetBattleCode() of
				0 ->
					skip;
				Code ->
					monsterBuff:delBuff(Code, ?PeaceBuffID)
			end,

			playerMsg:sendErrorCodeMsg(?ErrorCode_NotInPeaceSafeMode)
	end,
	ok.

isInSafeRange(X, Y, Range) ->
	List = mapRelivePts(),
	F =
		fun(#recMapObjData{mapX = RX, mapY = RY}, Acc) ->
			case isInSafeSquareRange(X, Y, RX, RY, Range) of
				false ->
					Acc;
				true ->
					%% 在正方形大范围内，则再详细判断圆形
					{misc:calcDistSquare(X, Y, RX, RY) =< Range * Range, {RX, RY}}
			end
		end,
	case misc:foldlEx(F, false, List) of
		{true, _} ->
			true;
		_ ->
			false
	end.

%% 是否在安全区正方形范围内
isInSafeSquareRange(X, Y, RX, RY, Range) ->
	RX_L = RX - Range,
	RX_R = RX + Range,
	RY_D = RY - Range,
	RY_U = RY + Range,
	X >= RX_L andalso X =< RX_R andalso Y >= RY_D andalso Y =< RY_U.

mapRelivePts() ->
	case core:getMapCfg(playerState:getMapID()) of
		#recGameMapCfg{mapRelivePt = Pt} ->
			Pt;
		_ ->
			[]
	end.

mapSafeRange() ->
	case getCfg:getCfgByKey(cfg_mapsetting, playerState:getMapID()) of
		#mapsettingCfg{saferegionrange = V} when erlang:is_integer(V) andalso V > 0 -> V;
		_ -> 0
	end.

setPlayerSafeMode(IsInSafe) ->
	put('PlayerSafeMode', IsInSafe).
getPlayerSafeMode() ->
	case get('PlayerSafeMode') of
		undefined -> false;
		B -> B
	end.