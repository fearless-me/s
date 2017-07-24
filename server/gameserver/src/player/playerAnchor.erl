%%%-------------------------------------------------------------------
%%% @author chenxiaolong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 七月 2017 11:55
%%%-------------------------------------------------------------------
-module('playerAnchor').
-author("chenxiaolong").
-include("playerPrivate.hrl").

%% API
-export([init/0,
	setupAnchor/1]).

%% 上线初始化并推送状态
-spec init() -> ok.
init() ->

	Value =  memDBCache:getSundriesValue(?Sundries_ID_Anchor,1),

	ValueList =
		case Value of
			undefined ->
				[];
			_->
				Value
		end,
	Msg = #pk_GS2U_SetUpAnchor{
		args =  ValueList

	},
	playerMsg:sendNetMsg(Msg),
	ok.


-spec setupAnchor(Args::list()) -> ok.
setupAnchor(Args)->
	FunToInt =
		fun(E, L) ->

			RoleId =  string_to_integer(E),
			case erlang:is_integer(RoleId) of
				true ->
					[RoleId | L];
				_ ->
					L
			end
		end,
	ValueList = lists:foldl(FunToInt, [], Args),

	memDBCache:dirtySaveSundries(?Sundries_ID_Anchor, 1, ValueList),
	Msg = #pk_GS2U_SetUpAnchor{
		args =  ValueList
	},
	playerMgrOtp:sendMsgToAllPlayer([Msg]),
	ok.

-spec string_to_integer(S) -> int() when
	S :: string().
string_to_integer(S) ->
	erlang:list_to_integer(S).
