%% @author zhengzhichun
%% @doc @todo Add description to loginQueueOtp.


-module(loginQueueOtp).

-behaviour(myGenServer).

-include("setup.hrl").
-include("lsInc.hrl").
-include("loginQueue.hrl").


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
	start_link/0,
	send2me/2
]).

-spec send2me(MsgID::atom(), Msg::tuple()) ->ok.
send2me(MsgID, Msg) ->
	psMgr:sendMsg2PS(?MODULE, MsgID, Msg).

start_link() ->
	myGenServer:start_link({local, ?MODULE}, ?MODULE, [], []).

init([]) ->
	?LOG_OUT("[~w] start",[?MODULE]),
	LoginQue = queue:new(),
	ets:new(?QueCanLoginUserEts, [named_table,public, {keypos, #recQueCanLoginUserEts.accountID}]),
	{ok, #state{loginQueue = LoginQue , curNum = 0, maxNum = 0}}.

handle_call(Request, From, State) ->
	?ERROR_OUT("handle_call:[~p] in [~p],form:~p",[Request,?MODULE,From]),
	{noreply, State}.

handle_cast(_Msg, State) ->
	{noreply, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

handle_info(Info, State) ->
	loginQueue:dealInfo(Info, State).

terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.