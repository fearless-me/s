%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 26. 八月 2017 10:46
%%%-------------------------------------------------------------------
-module(se).
-author(tiancheng).

-include("gsInc.hrl").

%% AES一次加密解密的字节数
-define(AES_Encrypt_Data_Len, 16).
-define(AES_Key, <<"vPoL2/+scQrw+uu9">>).

%% RSA一次加密解密的字节数，受限于RSAKey的长度，加密后均为128字节
-define(RSA_Encrypt_Data_Len, 96).
-define(RSA_Decrypt_Data_Len, 128).
%% RSA公有Key,128字节
-define(RSA_Public_Key, <<"-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDPkJQQuJKClSNrOmwNx/Fn34Lz
6C9v/rHEK8Prrrq6ttJuxofVHtUA4xphKYR2H9Oj8z6j9I2JULO8H/V6ixsyN634
dSPwVY4TFSe5K9edIr3mbKk08agrpUT+WOf1QPUcMOtWCbI/LQfQBR2LfZ4UUoZE
iQUcGk5cQHdlBaGjXwIDAQAB
-----END PUBLIC KEY-----
">>).

%% RSA私有Key
-define(RSA_Private_Key_PKCS1, <<"-----BEGIN RSA PRIVATE KEY-----
MIICWwIBAAKBgQDPkJQQuJKClSNrOmwNx/Fn34Lz6C9v/rHEK8Prrrq6ttJuxofV
HtUA4xphKYR2H9Oj8z6j9I2JULO8H/V6ixsyN634dSPwVY4TFSe5K9edIr3mbKk0
8agrpUT+WOf1QPUcMOtWCbI/LQfQBR2LfZ4UUoZEiQUcGk5cQHdlBaGjXwIDAQAB
AoGASG61nNgsGHGe+I5corqBXbQ76I2/8B87Pa/gIODKvNmLuaiCQjcOMc8Op5Vr
aiVVH8OEuoZe1epZrm6gpXDhvhWLH6RPPXYoeQhXyJPx7fDX9tbZxvQ5MKIfhUEg
jT4bFZ2DxIWnUvxVgCREVTgFCJLg5LhM4HSJYMHKZUdYstECQQDsvx0yIDo4n9Um
8cAeugROpang5cxlY8kviqrBsVtAuAsNXO7/gM0qyVTb9ypxByTcCnbAkPtfGz8I
UxhUMXabAkEA4HHr5ucgDpS/AdXgNEmzkqKMqU7LaSPBrmN+JFLCwtODcTme+FRo
Ril59FUsrluxEfKeSTVHJ5Q3Ws6Wr7bwjQJACfD8iN5Rk48ipEACkUe+Zo8OUyNT
Me6+xABOq1OHQXB5Blagspn2A5XwukvmvFhQc+z8j5mG9LdwLilPHDn3gQJAQGbP
7tiA7U4nJKqvA7HmMfwsamRun4OgDp8D0f5hXi/89l83S0BFD2TVVpOeF4W94E2C
t7Tu7t9rpsXCnTbb/QJAKnb7CLCoCvGCvX/KMUlwYEcONr8Rh8j2q9u/rgUWCAOs
nVP+ffwkvuTuf07ngdpgkS75rCdfF38Qzp2FaoggaQ==
-----END RSA PRIVATE KEY-----
">>).

%% RSA私有Key FIXME pkcs8的方式暂时不可用
-define(RSA_Private_Key_PKCS8, <<"-----BEGIN PRIVATE KEY-----
MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAM+QlBC4koKVI2s6
bA3H8WffgvPoL2/+scQrw+uuurq20m7Gh9Ue1QDjGmEphHYf06PzPqP0jYlQs7wf
9XqLGzI3rfh1I/BVjhMVJ7kr150iveZsqTTxqCulRP5Y5/VA9Rww61YJsj8tB9AF
HYt9nhRShkSJBRwaTlxAd2UFoaNfAgMBAAECgYBIbrWc2CwYcZ74jlyiuoFdtDvo
jb/wHzs9r+Ag4Mq82Yu5qIJCNw4xzw6nlWtqJVUfw4S6hl7V6lmubqClcOG+FYsf
pE89dih5CFfIk/Ht8Nf21tnG9Dkwoh+FQSCNPhsVnYPEhadS/FWAJERVOAUIkuDk
uEzgdIlgwcplR1iy0QJBAOy/HTIgOjif1SbxwB66BE6lqeDlzGVjyS+KqsGxW0C4
Cw1c7v+AzSrJVNv3KnEHJNwKdsCQ+18bPwhTGFQxdpsCQQDgcevm5yAOlL8B1eA0
SbOSooypTstpI8GuY34kUsLC04NxOZ74VGhGKXn0VSyuW7ER8p5JNUcnlDdazpav
tvCNAkAJ8PyI3lGTjyKkQAKRR75mjw5TI1Mx7r7EAE6rU4dBcHkGVqCymfYDlfC6
S+a8WFBz7PyPmYb0t3AuKU8cOfeBAkBAZs/u2IDtTickqq8DseYx/CxqZG6fg6AO
nwPR/mFeL/z2XzdLQEUPZNVWk54Xhb3gTYK3tO7u32umxcKdNtv9AkAqdvsIsKgK
8YK9f8oxSXBgRw42vxGHyPar27+uBRYIA6ydU/59/CS+5O5/TueB2mCRLvmsJ18X
fxDOnYVqiCBp
-----END PRIVATE KEY-----
">>).

%% API
-export([
	encrypt_config/1,
	decrypt_config/1
]).

-export([
	decrypt_bin/2
]).

%% 加密配置文件
encrypt_config(FileName) ->
	case file:read_file(FileName) of
		{ok, Bin1} ->
			Bin2 = encrypt_bin(rsa, Bin1),
			file:write_file(FileName ++ ".enc", Bin2);
		Error ->
			Error
	end.

%% 解密配置文件
decrypt_config(FileName) ->
	case file:read_file(FileName) of
		{ok, Bin1} ->
			Bin2 = decrypt_bin(rsa, Bin1),
			file:write_file(FileName ++ ".dec", Bin2);
		Error ->
			Error
	end.

%% RSA 公钥加密
encrypt_bin(rsa, Bin) ->
	encrypt_bin(rsa, Bin, <<>>).

encrypt_bin(rsa, <<>>, RetBin) ->
	RetBin;
encrypt_bin(rsa, Bin, RetBin) when erlang:byte_size(Bin) >= ?RSA_Encrypt_Data_Len ->
	{Bin1, Bin2} = erlang:split_binary(Bin, ?RSA_Encrypt_Data_Len),
	EBin = rsa:encrypt_public(Bin1, ?RSA_Public_Key),
	encrypt_bin(rsa, Bin2, <<RetBin/binary,EBin/binary>>);
encrypt_bin(rsa, Bin, RetBin) ->
	EBin = rsa:encrypt_public(Bin, ?RSA_Public_Key),
	encrypt_bin(rsa, <<>>, <<RetBin/binary,EBin/binary>>).

%% RSA 私钥解密
decrypt_bin(rsa, Bin) ->
	decrypt_bin(rsa, Bin, <<>>).

decrypt_bin(rsa, <<>>, RetBin) ->
	RetBin;
decrypt_bin(rsa, Bin, RetBin) when erlang:byte_size(Bin) >= ?RSA_Decrypt_Data_Len ->
	{Bin1, Bin2} = erlang:split_binary(Bin, ?RSA_Decrypt_Data_Len),
	EBin = rsa:decrypt_private(Bin1, ?RSA_Private_Key_PKCS1),
	decrypt_bin(rsa, Bin2, <<RetBin/binary,EBin/binary>>);
decrypt_bin(rsa, Bin, RetBin) ->
	EBin = rsa:decrypt_private(Bin, ?RSA_Private_Key_PKCS1),
	decrypt_bin(rsa, <<>>, <<RetBin/binary,EBin/binary>>).