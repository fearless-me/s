%%%-------------------------------------------------------------------
%%% @author luowei
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 宠物领地战otp
%%% @end
%%% Created : 25. 八月 2015 19:50
%%%-------------------------------------------------------------------
-module(acPetBattleOtp).
-author("luowei").

-behaviour(myGenServer).

-include("../../activityPrivate.hrl").
-include("acPetBattlePrivate.hrl").


-export([start_link/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3, handle_exception/3]).


start_link(Name) ->
	myGenServer:start_link({local,Name}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

init([]) ->
	?LOG_OUT("~p ~p init OK",[?MODULE, self()]),
	erlang:send_after(?PetBattleTick, self(), ?PetBattleMsg),
	{ok,{}}.

handle_call(Req, _From, State) ->
	?ERROR_OUT("[~p] unhandle call ~p", [?MODULE, Req]),
	{noreply, State}.

handle_cast(Msg, State) ->
	?ERROR_OUT("[~p] unhandle cast ~p", [?MODULE, Msg]),
	{noreply, State}.

handle_info(?PetBattleMsg, State) ->
	erlang:send_after(?PetBattleTick, self(), ?PetBattleMsg),
	acPetBattleLogic:tick(),
	{noreply, State};

handle_info(?PetBattleMsgReStart, State) ->
	acPetBattleLogic:openClearCity(),
	{noreply, State};
%% 主活动模块给出的回调
handle_info({activityChangeCallBack, _Pid, {?ActivityType_PetBattle, Phase}}, State) ->
	acPetBattleLogic:activityChangeCallBack(Phase),
	{noreply,State};

%% 活动地图的消息接口
handle_info({activityMapMsg, _Pid, {MsgType, Data}}, State) ->
	acPetBattleLogic:activityMapMsg(MsgType, Data),
	{noreply,State};
handle_info({activityDataLoadAckCallBack, _Pid, _Data}, State) ->
	{noreply, State};
handle_info(Info, State) ->
	?ERROR_OUT("unhandle info:[~p] in [~p] [~p,~p]",[Info,node(),?MODULE,self()]),
	{noreply,State}.

terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).