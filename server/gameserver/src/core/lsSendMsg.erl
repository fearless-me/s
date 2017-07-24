%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 22. 二月 2017 21:30
%%%-------------------------------------------------------------------
-module(lsSendMsg).
-author(tiancheng).

%% API
-export([
	sendMsg2DBServer/2,
	sendMsg2DBServer/3,
	sendToLogDBServer/2
]).

%% 发消息给DB
-spec sendMsg2DBServer(MsgID, Msg) -> ok when MsgID :: atom(), Msg :: term().
sendMsg2DBServer(MsgID, Msg) when erlang:is_atom(MsgID) ->
	dbSendMsg:sendMsg2DBPID(MsgID, {self(), ls, Msg}).

%% 发消息给DB(带指定的返回PID)
-spec sendMsg2DBServer(MsgID, FromPid, Msg) -> ok when MsgID :: atom(), FromPid::pid(), Msg :: term().
sendMsg2DBServer(MsgID, FromPid, Msg) when erlang:is_atom(MsgID) ->
	dbSendMsg:sendMsg2DBPID(MsgID, {FromPid, ls, Msg}).

%% 发消息保存日志
-spec sendToLogDBServer(MsgID,Msg) -> ok when MsgID::atom(), Msg::term().
sendToLogDBServer(MsgID, Msg) ->
	gsSendMsg:sendMsg2LogDBServer(MsgID, Msg).