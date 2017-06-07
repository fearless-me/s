%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%
%%
%%
%%tetsV(V)-> V .
%%
%%test()->
%%	Pool0 = new(),
%%	Pool1 = add_task(Pool0, fun tetsV/1, [77777]),
%%	Pool2 = add_task(Pool1, fun tetsV/1, [88888]),
%%	Pool3 = add_task(Pool2, fun tetsV/1, [99999]),
%%	V = async_do(Pool3),
%%	io:format("all done retrun ~p~n",[V]),
%%	ok.
%%
%%
%%% @end
%%% Created : 07. 十一月 2016 14:01
%%%-------------------------------------------------------------------
-module(task_pool).
-author("Administrator").

-include("logger.hrl").

%% API
-record(task,{
	refs,
	mod,
	func,
	args
}).

-record(pools,{
	pk,
	all = 0,
	done = 0,
	tasks = [],
	workpids = []
}).

-record(work_ret,{
	res,
	ref,
	task,
	taskPid
}).

-define(NoTaskInPoolAtom, 'No__Task__in__Pool').


-define(TimoutMs, 5000).


-export([
	new/1,
	async_wait/1,
	add_task/2,
	add_task/3,
	add_task/4,
	on_sync_wait/4,
	sync_wait/2,
	sync_wait/3
]).

-export([
	v/0,
	vf/1
]).

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
new(Pk)->
	#pools{pk = Pk}.

%%%-------------------------------------------------------------------
%% 同步任务，执行完返回结果集
-spec on_sync_wait(Flag::atom(), GroupList::[list(),...], FoldlFun::function(), TimeOut::integer()) -> {RetList::list(), ErrorList::list()}.
on_sync_wait(Flag, GroupList, FoldlFun, TimeOut) when erlang:is_function(FoldlFun, 2) ->
	Pool1 = task_pool:new(Flag),
	Pool2 =
		lists:foldl(
			fun(ChildList, P) ->
				add_task(P,
					fun(CList) ->
						lists:foldl(FoldlFun, [], CList)
					end, [ChildList])
			end, Pool1, GroupList),
	{LR1, LR2} = task_pool:sync_wait(Pool2, TimeOut, {[],[]}),
	{lists:flatten(LR1), lists:flatten(LR2)}.

sync_wait(Pool, TimeOut) ->
	do_sync_wait(Pool, TimeOut).

sync_wait(Pool, TimeOut, DefaultV) ->
	case do_sync_wait(Pool, TimeOut) of
		?NoTaskInPoolAtom ->
			DefaultV;
		V ->
			V
	end.

%%%-------------------------------------------------------------------
async_wait(Pool)->
	do_async_wait(Pool).

%%%-------------------------------------------------------------------
-spec add_task(term(), function()) -> #pools{}.
add_task(Pool, Fun) when erlang:is_function(Fun) ->
	add_task(Pool, Fun, []).

%%%-------------------------------------------------------------------
-spec add_task(term(), atom(), [term()]) ->  #pools{}.
add_task(Pool, Fun, Args) ->
	Ref = make_ref(),
	Task =#task{refs = Ref, mod = undefined, func = Fun, args = Args},
	Pool#pools{ tasks = [ Task | Pool#pools.tasks ], all = Pool#pools.all + 1}.


%%%-------------------------------------------------------------------
-spec add_task(term(),  atom(), atom(), [term()]) ->  #pools{}.
add_task(Pool, Mod, Fun, Args) ->
	Ref = make_ref(),
	Task =#task{refs = Ref, mod = Mod, func = Fun, args = Args},
	Pool#pools{ tasks = [ Task | Pool#pools.tasks ], all = Pool#pools.all + 1}.

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
do_sync_wait(Pool, TimeOut) ->
	case Pool#pools.tasks of
		[] ->
			?LOG_OUT("sync_do, work pool(~p) emtpy",[Pool#pools.pk]),
			?NoTaskInPoolAtom;
		_ ->
			Pid = proc_lib:spawn( fun()-> sync_work(Pool, self()) end),
			{ok, V} = gen:call(Pid, wait_all_task_done, do, TimeOut),
			V
	end.

%%
do_async_wait(Pool)->
	case Pool#pools.tasks of
		[] ->
			?LOG_OUT("async_do, work pool(~p) emtpy",[Pool#pools.pk]);
		_ ->
			proc_lib:spawn( fun()-> async_work(Pool, self()) end)
	end.

%%
sync_work(Pool, From)->
	Tasks = Pool#pools.tasks,

	?LOG_OUT("pool_do[~p][~p]==>",[Pool#pools.pk, length(Tasks)]),
	Pool1 = pool_do(Pool,Tasks,From),
	?LOG_OUT("pool_do[~p] done",[Pool#pools.pk]),

	?LOG_OUT("pool_wait[~p]...",[Pool1#pools.pk]),
	pool_wait(Pool1, From),
	?LOG_OUT("pool_wait[~p] done",[Pool1#pools.pk]),

	?LOG_OUT("pool_wait_rrv[~p]...",[Pool1#pools.pk]),
	pool_wait_rrv(),
	?LOG_OUT("pool_wait_rrv[~p]done",[Pool1#pools.pk]).

%%
async_work(Pool, From)->
	Tasks = Pool#pools.tasks,

	?LOG_OUT("pool_do[~p][~p]",[Pool#pools.pk, length(Tasks)]),
	Pool1 = pool_do(Pool,Tasks,From),
	?LOG_OUT("pool_do[~p] done",[Pool1#pools.pk]),

	?LOG_OUT("pool_wait[~p]...",[Pool1#pools.pk]),
	pool_wait(Pool1, From),
	?LOG_OUT("pool_wait[~p] done",[Pool1#pools.pk]).

%%
pool_do(Pool,TaskList, From)->
	WL =
		lists:foldl(
		fun(Task, Acc) ->
			[do_work(Pool,From, Task) | Acc]
		end, [], TaskList),
	Pool#pools{workpids = WL}.

%%
do_work(Pool, From, #task{refs = Ref, mod = Mod, func = Fun, args = Args} = Task)->
	erlang:spawn(
		fun() ->
			?LOG_OUT("\t~p~p#~w# ->",[Pool#pools.pk, Ref, self()]),
			try
				V = case Mod of
					    undefined ->
						    erlang:apply(Fun, Args);
						_ ->
							erlang:apply(Mod, Fun, Args)
				    end,
				From ! {work_done, #work_ret{res = {ok,V}, ref = Ref, task = Task, taskPid = self()}}
			catch
			   _ : Error ->
				   ?ERROR_OUT("\t~p~p# -> ~w",[Pool#pools.pk, Ref, Error]),
				   From ! {work_done, #work_ret{res = {error,Error}, ref = Ref, task = Task, taskPid = self()}}
			end

		end).

%%
pool_wait(Pool, From)->
	Rec = wait_one_work_done(?TimoutMs),
	case one_work_done(Rec, Pool) of
		true ->
			ok;
		{false, Pool1} ->
			pool_wait(Pool1, From)
	end.

%%
one_work_done(#work_ret{res = V, ref = Ref, task = Task, taskPid = WorkerPid},
	#pools{all = All, done = Done, workpids = WL} = Pool)->

	DoneNew = Done + 1,
	?LOG_OUT("\t~p~p#~p# <- ~p%",
		[Pool#pools.pk, Ref,WorkerPid, misc:toPercent(DoneNew, All)]),

	add_rv(V,Task),
	case lists:keydelete(Ref, #task.refs, Pool#pools.tasks) of
		[] ->
			true;
		L ->
			{false, Pool#pools{ tasks = L, done = DoneNew, workpids = lists:delete(WorkerPid, WL)}}
	end.

%%
wait_one_work_done(Timeout) ->
	receive
		{work_done, V} ->
			V
	after Timeout ->
		wait_one_work_done(Timeout)
	end.

%%
pool_wait_rrv()->
	receive
		{wait_all_task_done, {From, Mref}, _} ->
			gen:reply({From, Mref}, get_rv())
	end.

%%
get_rv()->
	case  get('RetVal') of
		undefined ->
			{[],[]};
		V ->
			V
	end.

%%
add_rv(V,Task) ->
	{L1, L2} = get_rv(),
	case V of
		{ok, V1}->
			set_rv({[V1 | L1], L2});
		{error, V2}->
			set_rv({L1, [{V2,Task}|L2]})
	end.

%%
set_rv(L)->
	put('RetVal', L).


%%------------------------
%%
vf(V)-> V .

%vf2(V) -> V.

v()->
	ok = application:start(localLog),
	Pool0 = new(pool1),
	Pool1 = add_task(Pool0, fun vf/1, [77777]),
	Pool2 = add_task(Pool1, fun vf/1, [88888]),
	Pool3 = add_task(Pool2, fun vf/1, [99999]),
	V = async_wait(Pool3),
	?LOG_OUT("===============>pool1 all done retrun ~p~n",[V]),
%%
	L = lists:seq(1, 100),
	Pool12 = new(pool2),
	Pool13 = lists:foldl(
		fun(VI, Pool111)->
			add_task(Pool111, fun(X)-> X end, [VI])
		end, Pool12, L),
	V1 = sync_wait(Pool13,?TimoutMs),
	?LOG_OUT("===============>pool2 all done retrun ~p~n",[V1]),
	ok.


