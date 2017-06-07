%% @author zhongyunawei
%% @doc @todo 邮件进程.

-module(mailOtp).
-author(zhongyuanwei).

-behaviour(myGenServer).

-include("mailPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3,handle_exception/3]).

start_link() ->
	myGenServer:start_link({local,?PsNameMail}, ?MODULE, [], []).
	
init([]) ->
	?LOG_OUT("init..."),

    edb:createTable(?MnesiaMail, [{type, ordered_set}, {attributes, record_info(fields, ?MnesiaMail)}, {index, [toRoleID]}]),
    edb:createTable(?MnesiaSysMail, [{type, ordered_set}, {attributes, record_info(fields, ?MnesiaSysMail)}, {index, [toRoleID]}]),

    %% 等待加载完成
    mnesia:wait_for_tables([?MnesiaMail, ?MnesiaSysMail], 20000),

    %% 判断过期邮件
    judgeTimeOutMail(),

	?LOG_OUT("send to dbs getMailList per ~p",[?QueryNumberEveryTimes]),
	gsSendMsg:sendMsg2DBServer(getMailList, 0, {?QueryNumberEveryTimes}),

	?LOG_OUT("init ok"),
	{ok, {}}.

%% 新邮件
handle_call({newMail, {NewMail}}, _From, State) ->
    Ret = libMail:newMail(NewMail),
    {reply, {newMail, Ret}, State};

%% 获取货币
handle_call({getMailCoin, Msg}, _From, State) ->
    Ret = libMail:getMailCoin(Msg),
    {reply, {getMailCoin, Ret}, State};

%% 获取道具
handle_call({getMailItem, Msg}, _From, State) ->
    Ret = libMail:getMailItem(Msg),
    {reply, {getMailItem, Ret}, State};

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

handle_exception(Type, Why, State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

handle_info({quit, _Pid, {}}, State) ->
	{stop, quit, State};

%% cs 与 db 连通了
%%handle_info({alreadyConnectDBServer, _Pid, _Msg}, State)->
%%
%%	{noreply, State};

%% 判断过期邮件
handle_info(judgeTimeOutMailTick, State) ->
    libMail:dealOverTimeMail(),
    judgeTimeOutMail(),
    {noreply, State};

%% 获取邮件列表返回结果
handle_info({getMailListAck, _Pid, {MailListRec, AttachMent}}, State) ->
	?DEBUG_OUT("===receive getMailListAck mail=~p,attachment=~p ===",
		[length(MailListRec),length(AttachMent)]),

    libMail:initMailFromDB(MailListRec, AttachMent),
    {noreply, State};

%% DBS返回的新邮件结果
handle_info({newMailAck, _Pid, {Mail, Attachments, Ret}}, State)->
    libMail:newMailAck(Mail, Attachments, Ret),
    {noreply,State};

%% 阅读邮件
handle_info({readMail, PidFromGS, Msg},State) ->
    Ret = libMail:readMail(Msg),
    psMgr:sendMsg2PS(PidFromGS, readMailAck, {Ret}),
    {noreply, State};

%% 锁定邮件
handle_info({lockMail, PidFromGS, Msg},State) ->
    Ret = libMail:lockMail(Msg),
    psMgr:sendMsg2PS(PidFromGS, lockMailAck, {Ret}),
    {noreply, State};

%% 解锁邮件
handle_info({unlockMail, PidFromGS, Msg},State) ->
	Ret = libMail:unlockMail(Msg),
    psMgr:sendMsg2PS(PidFromGS, unlockMailAck, {Ret}),
	{noreply, State};

handle_info({deleteMail, PidFromGS, Msg},State) ->
    Ret = libMail:deleteMail(Msg),
    psMgr:sendMsg2PS(PidFromGS, deleteMailAck, {Ret}),
    {noreply, State};

handle_info({deleteMailUnConditional, _PidFromGS, Msg}, State) ->
    libMail:deleteMailUnConditional(Msg),
    {noreply, State};

handle_info({delay_noticeRecvNewMail, RoleID}, State) ->
    libMail:noticeNewMail(RoleID),
    {noreply, State};

handle_info(Info, State) ->
	?ERROR_OUT("unhandle info:[~p] in [~p] [~p,~p]",[Info,node(),?MODULE,self()]),
	{noreply, State}.

%% ====================================================================
%% Internal functions
%% ====================================================================
%% 判断过期邮件心跳
judgeTimeOutMail() ->
    erlang:send_after(?Judge_TimeOut_Tick, self(), judgeTimeOutMailTick),
    ok.