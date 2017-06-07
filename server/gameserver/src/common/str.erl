%%%字符、字符串相关的函数

-module(str).

%% ====================================================================
%% API functions
%% ====================================================================
-export([isdigit/1,
		 isalpha/1,
		 islower/1,
		 isupper/1,
		 tolower/1,
		 toupper/1,
		 get_utf8_char/1,
		 utf8_to_utf16/1,
		 get_utf8_char_count/1
		 ]).

%是否为数字
-spec isdigit(C :: char()) -> boolean().
isdigit(C) ->
	C >= $0 andalso C =< $9.

%是否为字母
-spec isalpha(C :: char()) -> boolean().
isalpha(C) ->
	(C >= $a andalso C =< $z) orelse (C >= $A andalso C =< $Z).

%是否为小写字母
-spec islower(C :: char()) -> boolean().
islower(C) ->
	C >= $a andalso C =< $z.

%是否为大写字母
-spec isupper(C :: char()) -> boolean().
isupper(C) ->
	C >= $A andalso C =< $Z.

%将大写字母转换为小写字母，如果不是大写字母则不转换，原样返回
-spec tolower(C :: char()) -> char().
tolower(C) ->
	case isupper(C) of
		true ->
			C + $a - $A;
		false ->
			C
	end.

%将小写字母转换为大写字母，如果不是小写字母则不转换，原样返回
-spec toupper(C :: char()) -> char().
toupper(C) ->
	case islower(C) of
		true ->
			C + $A - $a;
		false ->
			C
	end.

-spec utf8_to_utf16(Data) -> Result when
      Data :: unicode:latin1_chardata() | unicode:chardata() | unicode:external_chardata(),
      Result :: list()
              | {error, list(), RestData}
              | {incomplete, list(), binary()},
      RestData :: unicode:latin1_chardata() | unicode:chardata() | unicode:external_chardata().
utf8_to_utf16(UTF8_Str) ->
	Bin = erlang:list_to_binary(UTF8_Str),
	do_i_utf8(Bin).

-spec get_utf8_char (String) -> {0 | tuple(),RemainString} when
	String::string(),RemainString::string().
get_utf8_char ([]) ->
    {0, []};
get_utf8_char ([Char1 | String]) ->
    get_utf8_char(Char1, String).

-spec get_utf8_char_count(String) -> non_neg_integer() when
	String::string().
get_utf8_char_count(String) ->
	get_utf8_char_count(String,0).

%% ====================================================================
%% Internal functions
%% ====================================================================

cbv(utf8,<<1:1,1:1,0:1,_:5>>) ->
	1;
cbv(utf8,<<1:1,1:1,1:1,0:1,_:4,R/binary>>) ->
	case R of
		<<>> ->
			2;
		<<1:1,0:1,_:6>> ->
			1;
		_ ->
			false
	end;
cbv(utf8,<<1:1,1:1,1:1,1:1,0:1,_:3,R/binary>>) ->
	case R of
		<<>> ->
			3;
		<<1:1,0:1,_:6>> ->
			2;
		<<1:1,0:1,_:6,1:1,0:1,_:6>> ->
			1;
		_ ->
			false
	end;
cbv(utf8,_) ->
	false.

do_i_utf8(<<>>) ->
	[];
do_i_utf8(<<U/utf8,R/binary>>) ->
	case do_i_utf8(R) of
		{error,Trans,Rest} ->
			{error, [U|Trans], Rest};
		{incomplete,Trans,Rest,N} ->
			{incomplete, [U|Trans], Rest, N};
		L when is_list(L) ->
			[U|L]
	end;
do_i_utf8(Bin) when is_binary(Bin) ->
	case cbv(utf8,Bin) of
		N when is_integer(N) ->
			{incomplete, [], Bin,N};
		false ->
			{error, [], Bin}
	end.


get_utf8_char (Char1, String) when Char1 < 16#80 ->
	{Char1, String};
get_utf8_char (Char1, String) when Char1 < 16#E0 ->
	[Char2 | String2] = String,
	{{Char1, Char2}, String2};
get_utf8_char (Char1, String) when Char1 < 16#F0 ->
	[Char2, Char3 | String2] = String,
	{{Char1, Char2, Char3}, String2};
get_utf8_char (Char1, String) when Char1 < 16#F8 ->
	[Char2, Char3, Char4 | String2] = String,
	{{Char1, Char2, Char3, Char4}, String2};
get_utf8_char (Char1, String) when Char1 < 16#FC->
	[Char2, Char3, Char4, Char5 | String2] = String,
	{{Char1, Char2, Char3, Char4, Char5}, String2};
get_utf8_char (Char1, String) when Char1 < 16#FE->
	[Char2, Char3, Char4, Char5, Char6 | String2] = String,
	{{Char1, Char2, Char3, Char4, Char5, Char6}, String2}.

-spec get_utf8_char_count(String,Count) -> Count when
	String::string(),Count::non_neg_integer().
get_utf8_char_count([],Count) ->
	Count;
get_utf8_char_count ([Char1|String],Count) when Char1 < 16#80 ->
    get_utf8_char_count(String,Count + 1);
get_utf8_char_count ([Char1|String],Count) when Char1 < 16#E0 ->
    [_Char2 | String2] = String,
    get_utf8_char_count(String2,Count + 1);
get_utf8_char_count ([Char1|String],Count) when Char1 < 16#F0 ->
    [_Char2, _Char3 | String2] = String,
    get_utf8_char_count(String2,Count + 1);
get_utf8_char_count ([Char1|String],Count) when Char1 < 16#F8 ->
    [_Char2, _Char3, _Char4 | String2] = String,
    get_utf8_char_count(String2,Count + 1);
get_utf8_char_count ([Char1|String],Count) when Char1 < 16#FC->
    [_Char2, _Char3, _Char4, _Char5 | String2] = String,
    get_utf8_char_count(String2,Count + 1);
get_utf8_char_count ([Char1|String],Count) when Char1 < 16#FE->
    [_Char2, _Char3, _Char4, _Char5, _Char6 | String2] = String,
    get_utf8_char_count(String2,Count + 1).
