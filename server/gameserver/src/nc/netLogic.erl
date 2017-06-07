%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. 五月 2017 14:02
%%%-------------------------------------------------------------------
-module(netLogic).
-author("Administrator").

-include("netPrivate.hrl").
-include("lsInc.hrl").
-include("logRecord.hrl").
-include("dataDefine.hrl").
-include("table.hrl").

%% API
-export([
	sendNetMsg/1
]).


sendNetMsg(Msg)->
	?DEBUG_OUT("sendnetMsg:~p",[Msg]),
	try
		List = netmsgWrite:packNetMsg(Msg),
		socketHandler:sendNetMsg(List)
	catch
		_:ERR ->
			?ERROR_OUT("sendNetMsg[~p,~p]",
				[ERR,erlang:get_stacktrace()])
	end.
