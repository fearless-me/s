%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 27. 二月 2017 14:57
%%%-------------------------------------------------------------------
-module(web2lsMsgCommonLogic).
-author(tiancheng).

-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
-include("gsDef.hrl").

%% API
-export([
	refreshLoginAwardConf/1,
	web2lsRechargeRebate/1,
	web2lsMsgActExchange/1
]).

%% 平台gm ls2gs更新GS上登录有礼配置表
refreshLoginAwardConf({CmdSerial,CallbackPid}) ->
	?LOG_OUT( "refreshLoginAwardConf ~p", [CmdSerial] ),
	psMgr:sendMsg2PS( ?PsNamePlayerMgr, refreshLoginAwardConf, { } ),
	psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial, 0}),%0为成功
	ok.

%% 平台gm ls2gs 充值返利
web2lsRechargeRebate({CmdSerial,CallbackPid,ConfRow}) ->
	?LOG_OUT( "web2lsRechargeRebate ~p ,~p", [CmdSerial,ConfRow] ),
	psMgr:sendMsg2PS(?PsNameRecharge, web2lsRechargeRebate,ConfRow),
	psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial, 0}),%0为成功
	ok.

%% 平台gm 平台活动的兑换
web2lsMsgActExchange({CmdSerial,CallbackPid,OpCode,Exchange}) ->
	?LOG_OUT( "web2lsMsgActExchange ~p,~p,~p", [CmdSerial,OpCode,Exchange] ),
	psMgr:sendMsg2PS(?PsNameOperateExchange, handleExchange, {CmdSerial,CallbackPid,OpCode, Exchange}),
	ok.