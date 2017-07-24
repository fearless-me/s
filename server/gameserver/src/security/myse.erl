%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 一个奇葩的匹配Key生成模块
%%% @end
%%% Created : 29. 八月 2017 11:53
%%%-------------------------------------------------------------------
-module(myse).
-author(tiancheng).

-include("gsInc.hrl").

-define(Src_List, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`1234567890-=!@#$%^&*()_+{}|<>?[];,.").

%% API
-export([
	getKeyPair/0,
	getKeyPairRight/1
]).

getKeyPair() ->
	L1 = randFromList(96, ?Src_List, ""),
	RList = getKeyPairRight(L1),
	?WARN_OUT("GameKey:~ts",[L1]),
	?WARN_OUT("RightPair:~ts",[RList]),
	{L1, RList}.

getKeyPairRight(InString) ->
	All = InString ++ lists:reverse(InString),
	Md51 = lists:reverse(md5:encrypt(base64:encode(All))),
	Md52 = lists:reverse(md5:encrypt(base64:encode(Md51))),
	Md53 = lists:reverse(md5:encrypt(base64:encode(Md52))),
	Md54 = lists:reverse(md5:encrypt(base64:encode(Md53))),
	Md55 = lists:reverse(md5:encrypt(base64:encode(Md54))),
	Md56 = lists:reverse(md5:encrypt(base64:encode(Md55))),
	{LL, LR} = lists:split(10, Md56),
	LR ++ LL.

%%从列表中不重复随机N次
randFromList(0, _List, RetList) ->
	RetList;
randFromList(N, List, RetList) ->
	Index = misc:rand(1, erlang:length(List)),
	randFromList(N - 1, List, [lists:nth(Index, List) | RetList]).