%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%% 逻辑代码只需要增加onMsg处理
%%% @end
%%% Created : 24. 五月 2017 16:14
%%%-------------------------------------------------------------------
-module(userNet).
-author("Administrator").

-include("gsInc.hrl").
-include("userPrivate.hrl").

%% API
-export([
	netMsg/2
]).
-export([
	sendNetMsg/1
]).

%%%-------------------------------------------------------------------
 sendNetMsg(Msg)->
	NetPid = userLocal:getNetPid(),
	?DEBUG_OUT("send[~p] to netpid[~p]",[Msg, NetPid]),
	psMgr:sendMsg2PS(NetPid,netMsgSend,Msg),
	ok.

%%%-------------------------------------------------------------------
netMsg(Cmd, Pk)->
	Status = userLocal:getStatus(),
	doNetMsg(Status, Cmd, Pk).

doNetMsg(?US_EMPTY, Cmd, Pk)->
	onMsg(Cmd, Pk);
doNetMsg(?US_CONNECTED, Cmd, Pk)->
	onMsg(Cmd, Pk);
doNetMsg(?US_SELECT_ROLE, Cmd, Pk)->
	onMsg(Cmd, Pk);
doNetMsg(_Status, Cmd, Pk)->
	onMsg(Cmd, Pk).

%%%-------------------------------------------------------------------
onMsg(?CMD_U2LS_Login_Normal , #pk_U2LS_Login_Normal{} = Msg )->
	userLogin:auth(Msg),
	ok;
onMsg(?CMD_U2LS_RequestGSLine , #pk_U2LS_RequestGSLine{})->
	userLogin:gameServerList(),
	ok;
onMsg(?CMD_U2GS_RequestLogin , #pk_U2GS_RequestLogin{accountID = AccountID, key = Key})->
	userLogin:checkAccount(AccountID, Key),
	ok;
onMsg(Cmd, Pk)->
	?DEBUG_OUT("onMsg(~p,~p),state[~p]",[Cmd, Pk, userLocal:getStatus()]),
	ok.
