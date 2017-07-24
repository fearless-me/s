%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 04. 七月 2017 14:27
%%%-------------------------------------------------------------------
-module(crossGsLogic).
-author(tiancheng).

-include("gsInc.hrl").
-include("crossGsPrivate.hrl").

%% API
-export([
	init/0,
	getServerName/1
]).

init() ->
	ets:new(?ETSNormalServers, [named_table, public, {keypos, #normalInfo.serverID}]),
	ok.

%% 获取普通服务器名字
getServerName(ServerID) ->
	case core:isCross() of
		true ->
			case ets:lookup(?ETSNormalServers, ServerID) of
				[#normalInfo{serverName = ServerName}] ->
					ServerName;
				_ ->
					?ERROR_OUT("not find serverID=~p", [ServerID]),
					""
			end;
		_ ->
			?ERROR_OUT("getServerName[~p] error not in cross!", [ServerID]),
			gsMainLogic:getAreaName()
	end.