%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 10. 二月 2015 20:08
%%%-------------------------------------------------------------------
-module(miscTest).
-author("ZhongYuanWei").

%% API
-export([randTest/0]).

randTest() ->
	L = randTest(100000,[]),
	Fun = fun({N,C}) ->
		io:format("~p : ~p ~n", [N,C])
	end,
	lists:foreach(Fun, L),
	ok.


randTest(0,AccIn) ->
	AccIn;
randTest(M,AccIn) ->
	N = misc:rand(1, 5),
	List = case lists:keyfind(N, 1, AccIn) of
			   {N,C} ->
				   lists:keyreplace(N, 1, AccIn, {N,C + 1});
			   _ ->
				   [{N,1} | AccIn]
		   end,
	randTest(M - 1,List).
