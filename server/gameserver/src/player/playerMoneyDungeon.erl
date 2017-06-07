%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20161215
%%%-------------------------------------------------------------------

-module(playerMoneyDungeon).
-author("meitianyang").
-include("playerPrivate.hrl").
-include("../activity/gameactivity/moneyDungeon/acMoneyDungeonPrivate.hrl").

%% API
-export([
	onEnterMap/1,
	enterCopyMap/1,
	giveup/0,
	next/0
]).

%%-------------------------------------------------------------------
%% 请求进入金币副本
-spec onEnterMap(CopyMapID::uint()) -> ok.
onEnterMap(CopyMapID)->
	case playerState:getTeamID() of
		0 ->
			core:sendMsgToActivity(
				?ActivityType_MoneyDungeon,
				moneyDungeon_Enter,
				{
					playerState:getRoleID(),
					CopyMapID,
					playerState:getTeamID()
				}
			);
		_ ->
			?DEBUG_OUT("[DebugForMoneyDungeon] onEnterMap have team"),
			playerMsg:sendErrorCodeMsg(?ErrorCode_CopyMap_OnePlayer_LeaveTeam)
	end.

%%-------------------------------------------------------------------
%% 被允许进入金币副本
-spec enterCopyMap(CopyMapID::uint()) -> boolean().
enterCopyMap(CopyMapID) ->
	playerScene:onRequestEnterMap(CopyMapID).

%%-------------------------------------------------------------------
%% 放弃游戏
-spec giveup() -> ok.
giveup() ->
	case isInMap() of
		true ->
			core:sendMsgToActivity(
				?ActivityType_MoneyDungeon,
				moneyDungeon_Giveup,
				playerState:getRoleID()
			);
		_ ->
			skip
	end,
	ok.

%%-------------------------------------------------------------------
%% 下一波
-spec next() -> ok.
next() ->
	case isInMap() of
		true ->
			core:sendMsgToActivity(
				?ActivityType_MoneyDungeon,
				moneyDungeon_Next,
				playerState:getRoleID()
			);
		_ ->
			skip
	end,
	ok.

%%-------------------------------------------------------------------
%% 是否处于目标玩法地图，用于过滤一些无效操作
-spec isInMap() -> boolean().
isInMap() ->
	MapID = playerState:getMapID(),
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeMoneyDungeon} ->
			true;
		#mapsettingCfg{} ->
			false;
		_ ->
			?ERROR_OUT("can not find MapID(~p) from cfg_mapsetting", [MapID]),
			false
	end.