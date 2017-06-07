%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 活动管理模块
%%% @end
%%% Created : 29. 十二月 2014 11:55
%%%-------------------------------------------------------------------
-module(activityOtp).
-author("tiancheng").

-behaviour(myGenServer).

-include("activityPrivate.hrl").

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([
	init/1,
	handle_call/3,
	handle_cast/2,
	handle_info/2,
	handle_exception/3,
	terminate/2,
	code_change/3
]).

-record(state, {}).

-spec(start_link() ->
	{ok, Pid :: pid()} | ignore | {error, Reason :: term()}).
start_link() ->
	myGenServer:start_link({local, ?PsNameActivity}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

-spec(init(Args :: term()) ->
	{ok, State :: #state{}} | {ok, State :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term()} | ignore).
init([]) ->
	?LOG_OUT("[~p] init...", [?MODULE]),
	%% 创建活动存储ets
	ets:new(?AcEts, [named_table, public,set, {keypos,#rec_activity.id}]),
	activityLogic:init(),
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

%% cs 与 db 连通了
handle_info({alreadyConnectDBServer, _Pid, _Msg}, State) ->
	gsSendMsg:sendMsg2DBServer(getActivityData, 0, {}),
	{noreply, State};

%% 返回活动数据
handle_info({getActivityDataAck, _Pid, Msg}, State) ->
	activityLogic:getActivityDataAck(Msg),

	%% 设置加载活动成功
	activityLogic:setIsLoadSuccess(true),

	%% 返回加载成功
	gsSendMsg:sendMsg2PublicDataMgr(loadModuleDataAck, 0),

	%% 马上刷新几次，因为不晓得你是等了多久启服，你爷爷的
	[activityLogic:fresh() || _ <- lists:seq(1, 10)],

	%% 开启活动心跳
	erlang:send_after(?ActivityModuleTick, self(), ?ActivityModuleTickMsg),
	{noreply, State};

%% 活动时间心跳
handle_info(?ActivityModuleTickMsg, State) ->
	%% 刷新
	activityLogic:fresh(),

	%% 设置初始化完成并完成一次心跳
	activityLogic:setIsLoadDataInitEnd(true),

	%% 检查是否全同步一次给GS
	case activityLogic:getwaitGetActivityData() of
		[] ->
			%% 已经同步过了
			skip;
		GSPIDList ->
			%% 还没同步，同步了清空
			ACList = ets:tab2list(?AcEts),
			[psMgr:sendMsg2PS(PidFromGS, getAllActivityDataAck, ACList) || PidFromGS <- GSPIDList],
			activityLogic:setwaitGetActivityData([]),
			ok
	end,

	%% 下次心跳
	erlang:send_after(?ActivityModuleTick, self(), ?ActivityModuleTickMsg),
	{noreply, State};

%% 有GS过来了，获取最新活动数据
handle_info({getAllActivityData, PidFromGS, _Msg}, State) ->
	case activityLogic:getIsLoadDataInitEnd() of
		true ->
			case activityLogic:getIsLoadSuccess() of
				true ->
					List = ets:tab2list(?AcEts),
					psMgr:sendMsg2PS(PidFromGS, getAllActivityDataAck, List);
				_ ->
					%% 设置等待同步的GSPID
					activityLogic:addwaitGetActivityData(PidFromGS)
			end;
		_ ->
			%% 设置等待同步的GSPID
			activityLogic:addwaitGetActivityData(PidFromGS)
	end,
	{noreply, State};

%% 直接设置活动当前的阶段
handle_info({setActivePhase,_pid,{ActivityID, Phase}}, State) ->
	activityLogic:setActivePhase(ActivityID, Phase),
	{noreply, State};
%%通过GM指令开启活动
handle_info({gm_start_activity,_pid,{ActivityID,NPhase}}, State) ->
	activityLogic:gm_start_activity(ActivityID, NPhase),
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