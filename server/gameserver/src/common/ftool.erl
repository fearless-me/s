%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015
%%% @doc
%%%
%%% @end
%%% Created : 28. 二月 2015 15:28
%%%-------------------------------------------------------------------
-module(ftool).

-export([
	fstart/0,
	fstart/1,
	fstart/2,
	fstop/0
]).

%%使用示例：
%%	ftool:fstart(),timer:sleep(3000),ftool:fstop().
%%	ftool:fstart(5).
%%	ftool:fstart(pid(0,18,0),5).

-spec fstart(Sec) -> ok when Sec::non_neg_integer().
fstart(Sec) when erlang:is_integer(Sec), Sec > 0 ->
	fstart(),
	Pid = spawn(fun ps_loop/0),
	erlang:send_after(Sec * 1000,Pid,stop),
	ok.

-spec fstart(Pid,Sec) -> ok when Pid::pid(),Sec::non_neg_integer().
fstart(Pid,Sec) when erlang:is_pid(Pid),erlang:is_integer(Sec), Sec > 0 ->
	fprof:trace([start,{procs,[Pid]}]),
	Pid = spawn(fun ps_loop/0),
	erlang:send_after(Sec * 1000,Pid,stop),
	ok.

-spec fstart() -> ok.
fstart() ->
	Procs = erlang:processes(),
	fprof:trace([start,{procs,Procs}]),
	ok.

-spec fstop() -> ok.
fstop() ->
	fprof:trace(stop),
	fprof:profile(),
	{{Y,M,D},{H,Min,S}} = calendar:now_to_local_time(os:timestamp()),
	FileName = io_lib:format("fprof_~p_~p_~p_~p_~p_~p.txt",[Y,M,D,H,Min,S]),
	fprof:analyse([totals, details, {sort, own},callers,{dest, FileName}]),
	fprof:stop(),
	ok.

%%=============================
%%内部函数
%%=============================
ps_loop() ->
	receive
		stop ->
			fstop()
	end.
