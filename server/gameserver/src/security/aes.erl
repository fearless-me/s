%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 26. 八月 2017 18:02
%%%-------------------------------------------------------------------
-module(aes).
-author(tiancheng).

-include("gsInc.hrl").

%% API
-export([
	encrypt/2
]).

encrypt(CipherData, Key) ->
	IVec = <<0:128>>,
	crypto:block_decrypt(aes_cbc256, Key, IVec, CipherData).
