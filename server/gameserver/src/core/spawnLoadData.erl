%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%% 多进程加载数据
%%% @end
%%% Created : 09. 十月 2016 20:02
%%%-------------------------------------------------------------------
-module(spawnLoadData).
-author("tiancheng").

-include("databankPrivate.hrl").

%% API
-compile(export_all).

%% 注意，要使用本监控加载方式的，都需要在dbMainOtp:init中，先注册，避免还没开始加载，就检测到已经完成的尴尬情况
%% tiancheng
putLoadDataPid(#recProcess{} = R) ->
    ?LOG_OUT("load data process:~p, ~p", [R#recProcess.name, R#recProcess.pid]),
    ets:insert(recProcess, R).

delLoadDataPid(Pid) ->
    ?LOG_OUT("delete data process:~p", [Pid]),
    ets:delete(recProcess, Pid).

getLoadDataList(Name) ->
    Match = ets:fun2ms(fun(#recProcess{} = Process) when Process#recProcess.name =:= Name -> Process end),
    ets:select(recProcess, Match).