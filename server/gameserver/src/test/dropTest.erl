%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 19. 一月 2015 14:12
%%%-------------------------------------------------------------------
-module(dropTest).
-author("ZhongYuanWei").

-include("gsInc.hrl").

%% API
-export([dropTest/0]).


dropTest() ->
	random:seed(os:timestamp()),
	List = lists:seq(1, 100000),
	Fun = fun(_) ->
				  playerDrop:equipDrop(4, 1, 16, ?Drop_Equip_Source_ByMonster, 0, ?ItemSourceKillMonster)
		  end,
	lists:foreach(Fun, List),
	ok.