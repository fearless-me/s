%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. 五月 2017 11:19
%%%-------------------------------------------------------------------
-module(userMgrLogic).
-author("Administrator").
-include("lsInc.hrl").
-include("logRecord.hrl").
-include("dataDefine.hrl").
-include("table.hrl").
-include("userPrivate.hrl").

%% API
-export([
	init/0,
	unique/1
]).

init() ->
	ok.

unique({UPid,#account{accountID = AccountID} = Account})->
	RegName = "u" ++ erlang:integer_to_list(AccountID),
	OtpName = erlang:list_to_atom(RegName),
	case catch psMgr:registerPS(OtpName, UPid) of
		ok ->
			?LOG_OUT("register [~p] with [~p],acount[~p]",
				[UPid, OtpName, Account]),
			ok;
		Err ->
			?ERROR_OUT("register [~p],with [~p],~p",
				[UPid, OtpName,Err]),
			{error, whereis(OtpName)}
	end.
