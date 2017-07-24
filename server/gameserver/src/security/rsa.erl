%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% RSA
%%% @end
%%% Created : 26. 八月 2017 10:59
%%%-------------------------------------------------------------------
-module(rsa).
-author(tiancheng).

-include("gsInc.hrl").
-include_lib("public_key/include/public_key.hrl").

%% API
-export([
	encrypt_public/2,
	encrypt_private/2,
	decrypt_private/2,
	decrypt_public/2
]).

%% 用公有Key加密
encrypt_public(Data, Key) ->
	public_key:encrypt_public(Data, get_rsa_key(Key)).

%% 用私有Key加密
encrypt_private(Data, Key) ->
	public_key:encrypt_private(Data, get_rsa_key(Key)).

%% 用私有key解密
decrypt_private(Data, Key) ->
	public_key:decrypt_private(Data, get_rsa_key(Key)).

%% 用公有key解密
decrypt_public(Data, Key) ->
	public_key:decrypt_public(Data, get_rsa_key(Key)).

get_rsa_key(PemBin) ->
	[Entry] = public_key:pem_decode(PemBin),
	public_key:pem_entry_decode(Entry).