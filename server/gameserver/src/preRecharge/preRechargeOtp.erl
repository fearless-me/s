%% @author zhengzhichun
%% @doc @todo Add description to rechargeOtp.
%%没开过预充值的，可以不要本功能

-module(preRechargeOtp).

-behaviour(myGenServer).
-include("preRecharge.hrl").




-export([
		 init/1, 
		 handle_call/3, 
		 handle_cast/2, 
		 handle_info/2, 
		 terminate/2, 
		 code_change/3, 
		 handle_exception/3
		]).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 start_link/0
]).

start_link( ) ->
	myGenServer:start_link( {local, ?PsNamePreRecharge}, ?MODULE, [], []).

init([]) ->
	?LOG_OUT("init...",[]),
	ets:new(?EtsPreRecharge, [named_table,public, {keypos,#recPreChargeAccount.accountID}]),
	?LOG_OUT("init ok",[]),
	{ok, #state{}}.

handle_call(Request, From, State) ->
	?ERROR_OUT("handle_call:[~p] in [~p],form:~p",[Request,?MODULE,From]),
	{noreply, State}.

handle_cast(_Msg, State) ->
	{noreply, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

handle_info(Info, State) ->
	preRechargeLogic:dealInfo(Info, State).


terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.