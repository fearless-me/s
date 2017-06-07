%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. 五月 2017 11:23
%%%-------------------------------------------------------------------
-module(userLocal).
-author("Administrator").

-include("userPrivate.hrl").

%% API
-export([
	getNetPid/0
	, setNetPid/1
	, getStatus/0
	, setStatus/1
	, getSocket/0
	, setSocket/1
]).


% 获取角色网络进程号
getNetPid() ->
	get(userNetPid).

% 设置角色网络进程号
-spec setNetPid(NetPid) -> OldVal | undefined when
	NetPid ::pid() | undefined, OldVal :: pid().
setNetPid(NetPid) ->
	put(userNetPid, NetPid).

setSocket(Socket)->
	put(userSocket, Socket).


getSocket()->
	get(userSocket).


setStatus(Status)->
	put(userStatus, Status).

getStatus()->
	case get(userStatus) of
		undefined ->
			?US_EMPTY;
		V ->
			V
	end.
