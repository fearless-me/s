%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 26. 十二月 2016 11:43
%%%-------------------------------------------------------------------
-module(fx).
-author("tiancheng").

-include("common.hrl").

%% API
-export([
	cpu/0,
	cpu/2,
	memory/0,
	memory/2,
	q/0,
	q/2
]).

-export([
	stop/0
]).

cpu() ->
	start(10, 30, runtime).

cpu(Interval, Lines) ->
	start(erlang:max(10, Interval), erlang:max(10, Lines), runtime).

memory() ->
	start(10, 30, memory).

memory(Interval, Lines) ->
	start(erlang:max(10, Interval), erlang:max(10, Lines), memory).

%% 队列
q() ->
	start(10, 30, msg_q).

q(Interval, Lines) ->
	start(erlang:max(10, Interval), erlang:max(10, Lines), msg_q).

stop() ->
	etop:stop().

start(Interval, Lines, Sort) ->
	spawn(fun() -> etop:start([{output, text}, {interval, Interval}, {lines, Lines}, {sort, Sort}]) end).