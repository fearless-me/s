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
-module(apply_test).
-author("wenshaofei").
%% API
-export([test/0, calculate/1]).
%%程序逻辑运算次数
-define(CALCULATE_NUMBER, 10000000).
%%程序执行次数用来计算平均运行时长
-define(CALL_TIMES, 100).
test() ->
    erlang:spawn(
        fun() ->
            Lists = lists:duplicate(?CALL_TIMES,0),
            %%apply调用
            Times1=lists:map(
                fun(_) ->
                    {Time, _} = timer:tc(fun() -> test_apply1(?CALCULATE_NUMBER) end),
                    Time
                end, Lists),
            %%(lists:sum(Times1)*1000000000) 将微秒单位转换为纳秒
            AvgTime1=trunc((lists:sum(Times1)*1000000000)/length(Times1)),
            %%直接调用
            Times2=lists:map(
                fun(_) ->
                    {Time, _} = timer:tc(fun() -> test_noapply1(?CALCULATE_NUMBER) end),
                    Time
                end, Lists),
            AvgTime2=trunc((lists:sum(Times2)*1000000000)/length(Times2)),
            %%直接调用
            Times3=lists:map(
                fun(_) ->
                    {Time, _} = timer:tc(fun() -> test_dynamic_call(?CALCULATE_NUMBER) end),
                    Time
                end, Lists),
            AvgTime3=trunc((lists:sum(Times3)*1000000000)/length(Times3)),
            io:format("=test_apply1:[~w],test_noapply1:[~w],test_dynamic_call[~w]~n", [AvgTime1,AvgTime2,AvgTime3])
        end).
%%调用erlang apply执行函数
test_apply1(0) ->
    ok;
test_apply1(N) ->
    erlang:apply(?MODULE, calculate, [N]),
    test_apply1(N - 1).
%%不调用apply执行函数
test_noapply1(0) ->
    ok;
test_noapply1(N) ->
    calculate(N),
    test_noapply1(N - 1).


%%让erlang在运行中进行动态调用执行函数
test_dynamic_call(0) ->
    ok;
test_dynamic_call(N) ->
    Method=calculate,
    ?MODULE:Method(N),
    test_dynamic_call(N - 1).

calculate(N) -> N.