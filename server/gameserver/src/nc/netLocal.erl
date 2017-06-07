%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. 五月 2017 14:17
%%%-------------------------------------------------------------------
-module(netLocal).
-author("Administrator").

-include("lsInc.hrl").
-include("logRecord.hrl").
-include("dataDefine.hrl").
-include("table.hrl").

%% API
-export([
	getSocket/0,
	getSocketOpt/0,
	getUserPid/0,
	setUsePid/1
]).

getUserPid() ->
	get('PlayerPid').

setUsePid(Pid) when erlang:is_pid(Pid)->
	put('PlayerPid',Pid).

getSocket()->
	socketHandler:getUserSocket().

getSocketOpt()->
	socketHandler:getListenOption().
