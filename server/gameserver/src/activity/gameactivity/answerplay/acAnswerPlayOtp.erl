%% @author Administrator
%% @doc @todo Add description to acAnswerPlayOtp.


-module(acAnswerPlayOtp).

-behaviour(myGenServer).

-include("../../activityPrivate.hrl").
-include("acAnswerPlayPrivate.hrl").

-record(state, {}).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start_link/1]).
-export([init/1, 
		 handle_call/3, 
		 handle_cast/2, 
		 handle_info/2, 
		 terminate/2, 
		 code_change/3, 
		 handle_exception/3]).

start_link(Name) ->
	myGenServer:start_link({local,Name}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([]) ->
	acAnswerPlayLogic:init(),
	{ok,#state{}}.

handle_call(Req, _From, State) ->
    ?ERROR_OUT("[~p] unhandle call ~p", [?MODULE, Req]),
    {noreply, State}.

%% 玩家答题情况
handle_cast(Request, State) ->
	?ERROR_OUT("[~p] unhandle cast ~p", [?MODULE, Request]),
	{noreply, State}.

%% 主活动模块给出的回调
handle_info({activityChangeCallBack, _Pid, {?ActivityType_AnswerPlay, Phase}}, State) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_LuckAnswerBtn) of
		true ->
			acAnswerPlayLogic:activityChangeCallBack(Phase);
		_ ->
			acAnswerPlayLogic:activityChangeCallBack(Phase),
			skip
	end,
	{noreply,State};

%% 活动地图的消息接口
handle_info({activityMapMsg, _Pid, {_MsgType, _Data}}, State) ->
	{noreply,State};

%% 玩家答题结果判断
handle_info({answerResult, Pid,{RoleID, Name, Level,QuestionID,IsRight,Answers}}, State) ->
    acAnswerPlayLogic:playerAnswerResult(RoleID, Name, Level,QuestionID, IsRight,Answers,Pid),
    {noreply,State};

%% 获取玩家答题活动信息
handle_info({getAnswerInfo, _Pid, {RoleID, NetPid}}, State) ->
    acAnswerPlayLogic:playerAnswerInfo(RoleID, NetPid),
    {noreply,State};

%% 发送题目和答案
handle_info(robitAutoAnswer, State) ->
	acAnswerPlayLogic:robitAutoAnswer(),
	{noreply,State};

handle_info(answerClose, State) ->
	acAnswerPlayLogic:activityChangeCallBack(?ActivityPhase_Close),
	{noreply,State};
handle_info({activityDataLoadAckCallBack, _Pid, _Data}, State) ->
	{noreply, State};

%%
handle_info(answer_timerTick, State) ->
	%?DEBUG_OUT("[DebugForDate] ?MsgTypeTimerMain ~p", [ExParam]),
	acAnswerPlayLogic:onTimerTick(),
	{noreply,State};

%%报名
handle_info({applyAnswer, _Pid, Data}, State) ->
	acAnswerPlayLogic:applyAnswer(Data),
	{noreply, State};



handle_info(Info, State) ->
	?ERROR_OUT("~p ~p recv undefined msg:~p", [?MODULE, self(), Info]),
	{noreply, State}.


terminate(_Reason, _State) ->
	ok.


code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).
%% ====================================================================
%% Internal functions
%% ====================================================================


