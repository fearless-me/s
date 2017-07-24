%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 活动管理模块
%%% @end
%%% Created : 29. 十二月 2014 11:55
%%%-------------------------------------------------------------------
-module(activityMgrOtp).
-author("tiancheng").

-behaviour(myGenServer).

-include("../activityPrivate.hrl").

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([
	getActivityPhase/1,
	init/1,
	handle_call/3,
	handle_cast/2,
	handle_info/2,
	handle_exception/3,
	terminate/2,
	code_change/3
]).

-record(state, {}).


%%获取在线人数
-spec getActivityPhase(ActivityID::uint())-> uint().
getActivityPhase(ActivityID)->
	MS = ets:fun2ms(fun(Info) when Info#rec_activity.id =:= ActivityID ->
		Info
	end),
	case myEts:selectEts(?AcMgrEts,MS) of
		[#rec_activity{phase = Phase}] ->
			Phase;
		_ ->
			0
	end.

-spec(start_link() ->
	{ok, Pid :: pid()} | ignore | {error, Reason :: term()}).
start_link() ->
	myGenServer:start_link({local, ?PsNameActivityMgr}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

-spec(init(Args :: term()) ->
	{ok, State :: #state{}} | {ok, State :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term()} | ignore).
init([]) ->
	?LOG_OUT("[~p, ~p] init ...", [?MODULE, self()]),
	erlang:process_flag(trap_exit, true),
	erlang:process_flag(priority, high),

	%% 创建活动存储ets
	ets:new(?AcMgrEts, [named_table, protected, {keypos,#rec_activity.id}]),

	%% 创建跨服报名ETS
	ets:new(?EtsCrossApply, [named_table, protected, set, {keypos, #recCrossApply.id}, {read_concurrency, true}]),
	ets:new(?EtsCrossApplyHelper, [named_table, protected, set, {keypos, #recCrossApplyHelper.roleID}, {read_concurrency, true}]),

	%% 创建活动子进程
	activityMgrLogic:createActivityChildProcess(),

	psMgr:sendMsg2PS(?PsNameActivity, getAllActivityData, self(), {}),

	?LOG_OUT("[~p] init ok", [?MODULE]),
	{ok, #state{}}.

-spec(handle_call(Request :: term(), From :: {pid(), Tag :: term()},
				  State :: #state{}) ->
					 {reply, Reply :: term(), NewState :: #state{}} |
					 {reply, Reply :: term(), NewState :: #state{}, timeout() | hibernate} |
					 {noreply, NewState :: #state{}} |
					 {noreply, NewState :: #state{}, timeout() | hibernate} |
					 {stop, Reason :: term(), Reply :: term(), NewState :: #state{}} |
					 {stop, Reason :: term(), NewState :: #state{}}).
handle_call(Request, _From, State) ->
	?LOG_OUT("~p ~p handle_call:~p", [?MODULE, self(), Request]),
	{reply, ok, State}.

-spec(handle_cast(Request :: term(), State :: #state{}) ->
	{noreply, NewState :: #state{}} |
	{noreply, NewState :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term(), NewState :: #state{}}).
handle_cast(_Request, State) ->
	{noreply, State}.

-spec(handle_info(Info :: timeout() | term(), State :: #state{}) ->
	{noreply, NewState :: #state{}} |
	{noreply, NewState :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term(), NewState :: #state{}}).

%% gs 与 cs 连通了
%%handle_info({alreadyConnectCSServer, _Pid, _Msg}, State)->
%%%%	gsSendMsg:sendMsg2CSServer(getAllActivityData, {}),
%%	psMgr:sendMsg2PS(?PsNameActivity, getAllActivityData, self(), {}),
%%	{noreply, State};

%% cs 发送过来的所有活动时间数据
handle_info({getAllActivityDataAck, _Pid, Msg}, State)->
	?DEBUG_OUT("receive allActivityDataAck !!"),
	activityMgrLogic:getAllActivityDataAck(Msg),
	activityMgrLogic:activityDataLoadAckCallBack(),
	{noreply, State};

%% 活动改变
handle_info({activityChangeMsg, _Pid, #rec_activity{id = AID} = Activity}, State) ->
	?DEBUG_OUT("receive activityChangeMsg:~p", [AID]),
	activityMgrLogic:getAllActivityDataAck(Activity),
	psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {synAllActivityState,AID}),
	{noreply, State};

%%%-------------------------------------------------------------------
% 跨服活动相关处理

% 活动报名
handle_info({cac_apply, _Pid, Msg}, State) ->
	activityMgrLogicCross:apply(Msg),
	{noreply, State};

% 查询报名情况
handle_info({cac_query, _Pid, Msg}, State) ->
	activityMgrLogicCross:query(Msg),
	{noreply, State};

% 取消报名
handle_info({cac_cancel, _Pid, Msg}, State) ->
	activityMgrLogicCross:cancel(Msg),
	{noreply, State};

% 报名截止
handle_info({cac_applyEnd, _Pid, Msg}, State) ->
	activityMgrLogicCross:applyEnd(Msg),
	{noreply, State};

% 邮件发奖
handle_info({cac_mail, _Pid, Msg}, State) ->
	activityMgrLogicCross:mail(Msg),
	{noreply, State};

% gm指令
handle_info({gm, _Pid, Msg}, State) ->
	activityMgrLogicCross:gm(Msg),
	{noreply, State};

%% 子进程挂掉
handle_info({'EXIT',_PID,killed}, State) ->
	%% 这里不处理了
	{noreply, State};

%% 子进程挂掉
handle_info({'DOWN',Node,process,PID,killed}, State) ->
	?ERROR_OUT("~p child down:~p,~p, restart", [?MODULE, Node, PID]),
	activityMgrLogic:restartChildPID(PID),
	{noreply, State};

handle_info(Info, State) ->
	?ERROR_OUT("~p ~p recv undefined msg:~p", [?MODULE, self(), Info]),
	{noreply, State}.

-spec(terminate(Reason :: (normal | shutdown | {shutdown, term()} | term()),
				State :: #state{}) -> term()).
terminate(_Reason, _State) ->
	ok.

-spec(code_change(OldVsn :: term() | {down, term()}, State :: #state{},
				  Extra :: term()) ->
					 {ok, NewState :: #state{}} | {error, Reason :: term()}).
code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type, Why, State) ->
	myGenServer:default_handle_excetion(Type, Why, State).