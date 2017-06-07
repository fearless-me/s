%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 服务器内部公共配置
%%% @end
%%% Created : 01. 三月 2017 16:04
%%%-------------------------------------------------------------------
-module(globalSetup).
-author(tiancheng).

-include("globalSetup.hrl").
-include("logger.hrl").

%% API
-compile(export_all).

%% 服务器ID，强制设为1
getServerID() -> 1.

getServerIDIndex() -> getValue(?GSKey_ServerStartIndex).

getADBID() -> getValue(?GSKey_adbID).

getDBID() -> getValue(?GSKey_dbID).

getServerName() -> getValue(?GSKey_serverName).

getMaxPlayer() -> getValue(?GSKey_maxPlayer).

getAreaMaintain() -> getValue(?GSKey_areaMaintain).

getHasGs() -> getValue(?GSKey_hasGs).

getCheckProtoVer() -> getValue(?GSKey_checkProtoVer).

getValue(Key) ->
	case ets:lookup(?GlobalSetupTable, Key) of
		[{Key, Value}] ->
			Value;
		_Error ->
			undefined
	end.

new() ->
	ets:new(?GlobalSetupTable, [public, set, named_table, {keypos, 1}, {read_concurrency, true}, {write_concurrency, true}]).

insert(Key, Value) ->
	ets:insert(?GlobalSetupTable, {Key, Value}).

delete(Key) ->
	ets:delete(?GlobalSetupTable, Key).