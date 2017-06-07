%% @author zhengzhichun
%% @doc @todo Add description to talkdataOtp.


-module(talkdataOtp).

-behaviour(myGenServer).
-include("talkdata.hrl").




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
		 notice2meConnectDbs/0,
		 send2me/3,
		 send2me/2,
		 send2me/1
		]).
-spec send2me(MsgID,FromPID,Msg) -> term() when
		  MsgID::term(),FromPID::pid(),Msg::tuple().
send2me(MsgID,FromPID,Msg) ->
	psMgr:sendMsg2PS(?MODULE, MsgID,FromPID, Msg).

-spec notice2meConnectDbs() ->ok.
notice2meConnectDbs() ->
	psMgr:sendMsg2PS(?MODULE, alreadyConnectDBServer, {}).

-spec send2me( MsgID::atom(), Msg::tuple() ) ->ok.
send2me( MsgID, Msg ) ->
	psMgr:sendMsg2PS(?MODULE, MsgID, Msg).

-spec send2me( MsgID::atom() ) ->ok.
send2me( MsgID ) ->
	psMgr:sendMsg2PS(?MODULE, MsgID).

start_link( ) ->
	myGenServer:start_link( {local, ?MODULE}, ?MODULE, [], []).

init([]) ->
	?LOG_OUT("[~w] start",[?MODULE]),
	erlang:send_after(2000, self(), {asyncInit,self()}),
	{ok, #state{}}.

handle_call(Request, From, State) ->
	?ERROR_OUT("handle_call:[~p] in [~p],form:~p",[Request,?MODULE,From]),
	{noreply, State}.

handle_cast(_Msg, State) ->
	{noreply, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

handle_info(Info, State) ->
	talkdataLogic:dealInfo(Info, State).


terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.