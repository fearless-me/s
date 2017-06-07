%% @author zhongyuanwei
%% @doc @todo Add description to dbSendMsg.
-module(dbSendMsg).

-include("dbsInc.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	sendMsg2DBPID/2
]).

-spec sendMsg2DBPID(MsgID,Msg) -> ok when
		  MsgID :: atom(), Msg :: tuple().
sendMsg2DBPID(MsgID,Msg) when erlang:is_atom(MsgID) ->
	%%?LOG_OUT("dbs send msg to db"),
	psMgr:sendMsg2PS(?PsNameDB,toDBOtp,{MsgID,Msg}),
	ok;
sendMsg2DBPID(MsgID,Msg) ->
	?ERROR_OUT("Error sendMsg2DBPID[~p,~p]",[MsgID,Msg]),
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================


