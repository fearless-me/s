%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%% 金宝塔活动服务模块
%%% @end
%%% Created : 26. 四月 2016 10:56
%%%-------------------------------------------------------------------
-module(lotteryForTowerOtp).
-author("wenshaofei").

-behaviour(myGenServer).

-include("lotteryForTowerPrivate.hrl").
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

-record(state, {init_time=erlang:localtime(), lottery_for_tower_info =#lottery_for_tower_info{}}).

-spec(start_link() ->
	{ok, Pid :: pid()} | ignore | {error, Reason :: term()}).
start_link() ->
	myGenServer:start_link({local, ?PsNameLotteryForTower}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

-spec(init(Args :: term()) ->
	{ok, State :: #state{}} | {ok, State :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term()} | ignore).
init([]) ->
	case lotteryForTowerLogic:init() of
		{ok,LotteryForTowerInfo}->
			{ok, #state{lottery_for_tower_info = LotteryForTowerInfo}};
		R->
			{stop,R}
	end	.

-spec(handle_call(Request :: term(), From :: {pid(), Tag :: term()},
				  State :: #state{}) ->
					 {reply, Reply :: term(), NewState :: #state{}} |
					 {reply, Reply :: term(), NewState :: #state{}, timeout() | hibernate} |
					 {noreply, NewState :: #state{}} |
					 {noreply, NewState :: #state{}, timeout() | hibernate} |
					 {stop, Reason :: term(), Reply :: term(), NewState :: #state{}} |
					 {stop, Reason :: term(), NewState :: #state{}}).
handle_call({<<"random_award">>,{RoleName, CfgID, RandomNumber}}, _From, #state{lottery_for_tower_info =OldInfo }=State) ->
	case lotteryForTowerLogic:verify_date(OldInfo) of
			 {ok,Info}->
				 {NewInfo,RewardCfgList} = lotteryForTowerLogic:random_award(RoleName, CfgID, RandomNumber, Info),
				 {reply, {ok,RewardCfgList}, State#state{lottery_for_tower_info =NewInfo}};
			 {error,Reason}->
				 {reply, {error,Reason}, State}
	 end;
handle_call({<<"get_lottery_for_tower_info">>,_}, _From, #state{lottery_for_tower_info =#lottery_for_tower_info{notice_list = NoticeList,start_time = StartTime,end_time = EndTime} }=State) ->
		{reply, {ok,NoticeList,StartTime,EndTime}, State};
handle_call(_, _From,State)->
	{reply,fail,State}.




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
handle_info({edit_lottery_for_tower_info,_PidFrom,{NewStartDate,NewEndDate,IsReloadCfg}}, #state{lottery_for_tower_info =Info }=State) when is_integer(NewStartDate) and is_integer(NewEndDate) and (NewEndDate>NewStartDate) and is_boolean(IsReloadCfg)->
	NewInfo  =Info#lottery_for_tower_info{start_time =NewStartDate ,end_time = NewEndDate},
	memDBCache:dirtySaveSundries(?Sundries_ID_LotteryForTower, 1, NewInfo),
	BeginTimeEndTimeMsg = lotteryForTowerLogic:getBeginTimeEndTImeMsg(NewStartDate,NewEndDate),
	playerMgrOtp:sendMsgToAllPlayer([BeginTimeEndTimeMsg]),
	if
		IsReloadCfg ->
			NewInfo1=lotteryForTowerLogic:reloadConfig(NewInfo),
			{noreply,  State#state{lottery_for_tower_info =NewInfo1}};
		true ->
			{noreply,  State#state{lottery_for_tower_info =NewInfo}}
	end	;

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