%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%% 最终测试结果test_dynamic_call性能要优于apply，
%%  erlang
%%          一次直接调用的消耗为  10296000 纳秒
%%          一次动态调用消耗为    10315000 纳秒
%%          一次apply调用为       10340000 纳秒
%%
%%% test_dynamic_call性能损坏要比直接调用多出来542分之1,即每542次动态调用会比直接调用多一次调用消耗
%%  test_apply1性能损坏要比直接调用多出来234分之1,即每234次Apply调用会比直接调用多一次调用消耗（apply调用api已被废弃）
%%%
%%% @end
%%% Created : 20. 九月 2016 15:54
%%%-------------------------------------------------------------------
-module(sort_test).
-author("wenshaofei").
%% API
-export([test/0]).

test() ->
    L=creat_list(5000,[]),
   {Time,_}= timer:tc(fun()->  lists:keysort(1,L),ok end),
	Time,
    TIme2 = timer:tc(fun()->  lists:keyfind(1,3000,L) end),
    {Time,TIme2}
	.
%%调用erlang apply执行函数
creat_list(0,List) ->
    List;
creat_list(N,List) ->
    creat_list(N-1,[{N,a}|List]) .