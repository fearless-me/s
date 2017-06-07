%%
%% @author Administrator
%% @doc @todo 关键字过滤测试.


-module(filterTest).

%% ====================================================================
%% API functions
%% ====================================================================
-export([filter_test/0, process_test/0]).
-include("gsInc.hrl").
%%-include_lib("eunit/include/eunit.hrl").


filter_test() ->
%% 	KeysList = keywordFilter:loadKeyWordCfg("keyWordFilter.txt"),
	keywordFilter:initKeyTree("keyWordFilter.txt"),
	%% 重量级回滚测试
	List = "AMDADMAMDDDAMDPAMamateraycityqqamateraycity",  %% 测试回滚  amateur 和 raycity 为 测试回滚关键字
	Fun = fun() ->
			[ keywordFilter:filterKeyWord(List) || _X <- lists:seq(1, 100000) ]
		  end,
	%% 测试结果(进程开销巨大)
	%% 37.44S/百万次	测试字符串：AMDADMAMDDDAMDPAMamateraycityqq
	%% 50.16S/百万次	测试字符串：AMDADMAMDDDAMDPAMamateraycityqqamateraycity
	timer:tc(Fun).

process_test() ->
	Fun = fun() ->
				  [ begin ?PsNameKeywordFilterMgr ! {testmsg, "AMDADMAMDDDAMDPAMamateraycityqqamateraycity"} end
				  																		|| _X <- lists:seq(1, 100000)]
		  end,
	
	timer:tc(Fun).


	

	