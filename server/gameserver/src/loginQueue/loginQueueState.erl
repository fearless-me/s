%% @author zhengzhichun
%% @doc @todo Add description to loginQueueState.


-module(loginQueueState).
-include("loginQueue.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 get/1,
		 set/2
		 ]).

%%取出进程字典值
-spec get(Index::atom()) ->undefined|term().
get(?DictBroadcastSecond) ->
	erlang:get(broadcastSecond).

%%设置进程字典值
-spec set(Index::atom(),Value::term()) ->term().
set(?DictBroadcastSecond,Value) ->
	erlang:put(broadcastSecond,Value).
