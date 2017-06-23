%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. 五月 2017 14:02
%%%-------------------------------------------------------------------
-module(userLogic).
-author("Administrator").

-include("gsInc.hrl").
-include("userPrivate.hrl").

%% API
-export([
	init/2,
	tick/0,
	offline/1
]).


tickMsg()->
	psMgr:sendMsgAfter2PS(self(), tick, ?UserTickTime).

tick()->
	tickMsg(),
	ok.


init(NetPid, Socket)->
	?LOG_OUT("u[~p] bind net[~p],socket[~p]",
		[self(), NetPid, Socket]),
	userLocal:setNetPid(NetPid),
	userLocal:setSocket(Socket),
	userLocal:setStatus(?US_EMPTY),
	tickMsg(),
	ok.



offline(Reason)->
	doOffline(
		userLocal:getStatus(),
		Reason
	),
	ok.

doOffline(?US_Dead,Reason)->
	?LOG_OUT("network close[~p],client[~p]",
		[Reason, self()]);
doOffline(_State,Reason)->
	userLocal:setStatus(?US_Dead),
	?LOG_OUT("network close[~p],client[~p]",
		[Reason, self()]),
	ok.
