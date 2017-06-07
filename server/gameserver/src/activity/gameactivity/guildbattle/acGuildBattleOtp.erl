%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 军团战
%%% @end
%%% Created : 08. 四月 2015 15:08
%%%-------------------------------------------------------------------
-module(acGuildBattleOtp).
-author("tiancheng").

-include("../../activityPrivate.hrl").
-include("acGuildBattlePrivate.hrl").

-behaviour(myGenServer).

%% API
-export([start_link/1]).

%% gen_server callbacks
-export([
	init/1,
	handle_call/3,
	handle_cast/2,
	handle_info/2,
	terminate/2,
	code_change/3,
	handle_exception/3
]).

-define(SERVER, ?MODULE).

-record(state, {}).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the server
%%
%% @end
%%--------------------------------------------------------------------
start_link(Name) ->
	myGenServer:start_link({local,Name}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Initializes the server
%%
%% @spec init(Args) -> {ok, State} |
%%                     {ok, State, Timeout} |
%%                     ignore |
%%                     {stop, Reason}
%% @end
%%--------------------------------------------------------------------
-spec(init(Args :: term()) ->
	{ok, State :: #state{}} | {ok, State :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term()} | ignore).
init([]) ->
	ets:new(rec_guildBattle, [named_table, public, {keypos,#rec_guildBattle.guildID}, {write_concurrency, true}, {read_concurrency, true}]),

    case getCfg:getCfgByKey(cfg_globalsetup, guildbattlecollectids) of
        #globalsetupCfg{setpara = [{_G1,_P1} = D1, {_G2,_P2} = D2, {_G3,_P3} = D3, {_G4,_P4} = _D4]} ->
            acGuildBattleState:setCollectIDs({D1, D2, D3}),
            ok;
        V ->
            ?ERROR_OUT("not find globalsetup guildbattlecollectids config:~p", [V]),
            acGuildBattleState:setCollectIDs({{0, 0}, {0, 0}, {0, 0}}),
            skip
    end,

    case getCfg:getCfgByKey(cfg_globalsetup, guildbattleBaseConfig) of
        #globalsetupCfg{setpara = [_MaxPoint,_RangeTime,_AttackLCTimes,_AddPoint,_KillPlayerAddPoint] = Data} ->
            acGuildBattleState:setBaseConfig(Data),
            ok;
        V1 ->
            ?ERROR_OUT("not find globalsetup guildbattleBaseConfig config:~p", [V1]),
            acGuildBattleState:setBaseConfig([1500,10,100,1,1]),
            skip
    end,

	?LOG_OUT("~p ~p init OK",[?MODULE, self()]),
	{ok, #state{}}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling call messages
%%
%% @end
%%--------------------------------------------------------------------
-spec(handle_call(Request :: term(), From :: {pid(), Tag :: term()},
	State :: #state{}) ->
	{reply, Reply :: term(), NewState :: #state{}} |
	{reply, Reply :: term(), NewState :: #state{}, timeout() | hibernate} |
	{noreply, NewState :: #state{}} |
	{noreply, NewState :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term(), Reply :: term(), NewState :: #state{}} |
	{stop, Reason :: term(), NewState :: #state{}}).
handle_call(_Request, _From, State) ->
	{reply, ok, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling cast messages
%%
%% @end
%%--------------------------------------------------------------------
-spec(handle_cast(Request :: term(), State :: #state{}) ->
	{noreply, NewState :: #state{}} |
	{noreply, NewState :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term(), NewState :: #state{}}).
handle_cast(_Request, State) ->
	{noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling all non call/cast messages
%%
%% @spec handle_info(Info, State) -> {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
-spec(handle_info(Info :: timeout() | term(), State :: #state{}) ->
	{noreply, NewState :: #state{}} |
	{noreply, NewState :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term(), NewState :: #state{}}).

%% 主活动模块给出的回调
handle_info({activityChangeCallBack, _Pid, {?ActivityType_GuildBattle, Phase}}, State) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_GuildBattle) of
		true ->
			acGuildBattleLogic:activityChangeCallBack(Phase);
		_ ->
			skip
	end,
	{noreply,State};

%% 活动地图的消息接口
handle_info({activityMapMsg, _Pid, {MsgType, Data}}, State) ->
	acGuildBattleLogic:activityMapMsg(MsgType, Data),
	{noreply,State};

handle_info(guildBattleGroup, State) ->
	acGuildBattleLogic:guildBattleGroup(),
	{noreply,State};

handle_info(resetEscortMapTick, State) ->
	acGuildBattleLogic:resetEscortMapTick(),
	{noreply,State};

handle_info(guildBattleHeart, State) ->
	acGuildBattleLogic:guildBattleHeart(),
	{noreply,State};

handle_info(guildBattle_ApplyStart, State) ->
    case acGuildBattleState:isApplyIng() of
        true ->
            erlang:send_after(3600 * 1000, self(), guildBattle_ApplyStart),

			%% 公告报名阶段
			Content = stringCfg:getString(guildBattle_ApplyStart),
			activityCommon:sendBroadcastNotice(Content),
			ok;
        _ ->
            skip
    end,
	{noreply,State};

handle_info({createActivityMapAck, _Pid, Data}, State) ->
    acGuildBattleLogic:createActivityMapAck(Data),
    {noreply,State};

handle_info({enterGuildBattle, Pid, Data}, State) ->
    Ret = acGuildBattleLogic:enterGuildBattle(Data),
    psMgr:sendMsg2PS(Pid, enterGuildBattleAck, Ret),
    {noreply,State};

handle_info({playerEnterMapReal, _Pid, Data}, State) ->
    acGuildBattleLogic:playerEnterMapReal(Data),
    {noreply,State};

handle_info({playerleaveGuild, _Pid, Data}, State) ->
    acGuildBattleLogic:playerleaveGuild(Data),
    {noreply,State};

handle_info({gatherSuccess, _Pid, Data}, State) ->
    acGuildBattleLogic:gatherSuccess(Data),
    {noreply,State};
handle_info({requestGuildBattleResult, _Pid, Data}, State) ->
    acGuildBattleLogic:requestGuildBattleResult(Data),
    {noreply,State};

handle_info({activityDataLoadAckCallBack, _Pid, _Data}, State) ->
	{noreply, State};

handle_info({addguildresourceAck, _Pid, Data}, State) ->
	?LOG_OUT("addguildresourceAck...:~p", [Data]),
	{noreply, State};

handle_info(Info, State) ->
	?ERROR_OUT("~p ~p recv undefined msg:~p", [?MODULE, self(), Info]),
	{noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
%%
%% @spec terminate(Reason, State) -> void()
%% @end
%%--------------------------------------------------------------------
-spec(terminate(Reason :: (normal | shutdown | {shutdown, term()} | term()),
	State :: #state{}) -> term()).
terminate(_Reason, _State) ->
	ok.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Convert process state when code is changed
%%
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%% @end
%%--------------------------------------------------------------------
-spec(code_change(OldVsn :: term() | {down, term()}, State :: #state{},
	Extra :: term()) ->
	{ok, NewState :: #state{}} | {error, Reason :: term()}).
code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type, Why, State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%%%===================================================================
%%% Internal functions
%%%===================================================================
