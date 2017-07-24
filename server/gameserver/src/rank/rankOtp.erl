%%%-------------------------------------------------------------------
%%% @author chengxs
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 排行榜
%%% @end
%%% Created : 11. 十一月 2014 16:57
%%%-------------------------------------------------------------------
-module(rankOtp).
-author("tiancheng").

-behaviour(myGenServer).

-include("rankPrivate.hrl").

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3,
    handle_exception/3]).

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
-spec(start_link() ->
    {ok, Pid :: pid()} | ignore | {error, Reason :: term()}).
start_link() ->
    myGenServer:start_link({local, ?PsNameRank}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

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
    ?LOG_OUT("init..."),

	%% 创建RAM数据表
	edb:createTable(recPlayerRank, [{type, bag}, {ram_copies, [node()]}, {attributes, record_info(fields, recPlayerRank)}]),
%%	mnesia:wait_for_tables([recPlayerRank], 20000),

    rankState:setRankIsLoadSuccess(false),

    ?LOG_OUT("init ok"),
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

handle_call(Request, _From, State) ->
    ?LOG_OUT("~p ~p handle_call:~p", [?MODULE, self(), Request]),
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

%% cs连接上数据库了
handle_info({alreadyConnectDBServer, _Pid, _}, State)->
    %% 加载已经保存的排行榜数据
    ?DEBUG_OUT("loadPlayerInfoDone..."),
    L = lists:seq(?PlayerRankType_Start, ?PlayerRankType_End),
    gsSendMsg:sendMsg2DBServer(getPlayerRankData, 0, L),
    {noreply, State};

handle_info({getPlayerRankDataAck, _Pid, {RankType, List}}, State) ->
	%% 加载的排行榜数据
    ?LOG_OUT("getPlayerRankDataAck type:~p,len:~p success!", [RankType,length(List)]),
	rankState:setRankCreateTime(RankType, 0),
	rankLogic:getPlayerRankDataAck(RankType, List),

    case RankType of
        ?PlayerRankType_End ->
            %% 设置加载成功
            rankState:setRankIsLoadSuccess(true),
	        rankLogic:synAllRankDataToEts(),

			%% 返回加载成功
			gsSendMsg:sendMsg2PublicDataMgr(loadModuleDataAck, 0),
	        ok;
        _ ->
            skip
    end,

	case rankState:getRankTickTimerRef() of
		undefined ->
            ?LOG_OUT("start rank[~p] fresh tick...",[RankType]),
            TimerRef = erlang:send_after(?RankRefreshTick, self(), ?RankRefreshTickAtom),
			rankState:setRankTickTimerRef(TimerRef);
		_ ->
            skip
	end,
	{noreply, State};

handle_info(?RankRefreshTickAtom, State) ->
	%% 心跳来了，判断是否有排行榜需要刷新
    TimerRef = erlang:send_after(?RankRefreshTick, self(), ?RankRefreshTickAtom),
    rankState:setRankTickTimerRef(TimerRef),

	rankLogic:refreshRankTick(),
	{noreply, State};

%% GS请求排行榜数据
%%handle_info({requestRankInfo, PidFromGS, {}}, State)->
%%    case rankState:getRankIsLoadSuccess() of
%%        true ->
%%            ?LOG_OUT("sync rank to gs, requestRankInfo:~p", [PidFromGS]),
%%            rankLogic:sendAllRankDataToGS(PidFromGS);
%%        _ ->
%%            %% 添加延迟同步
%%            ?LOG_OUT("add sync rank to gs, requestRankInfo:~p", [PidFromGS]),
%%            rankState:addNeedSyncGSPidToList(PidFromGS),
%%            skip
%%    end,
%%	{noreply, State};

%% 请求领排行榜奖励
handle_info({requestRankReward, PidFromGS, {RankType, RoleID, LastGetTime}}, State)->
    Ret = rankLogic:requestRankReward(RankType, RoleID, LastGetTime),
    psMgr:sendMsg2PS(PidFromGS, requestRankRewardAck, Ret),
    {noreply, State};

%% GM请求立即刷新排行榜
handle_info({immediatelyFreshRank, _PidFromGS, RankType}, State)->
    rankLogic:refreshRank(RankType, 0),
    {noreply, State};
%% GM请求立即刷新排行榜并且重启tick
handle_info({freshrankandtick, _PidFromGS, _Msg}, State)->
	?LOG_OUT("freshrankandtick"),
	%% 心跳来了，判断是否有排行榜需要刷新
	TimerRef = erlang:send_after(?RankRefreshTick, self(), ?RankRefreshTickAtom),
	rankState:setRankTickTimerRef(TimerRef),
	{noreply, State};

handle_info({guildWarRankListResult, _PidFromGS, Msg}, State) ->
    rankSpecial:refreshGuildWarRank(Msg),
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

handle_exception(Type,Why,State) ->
    myGenServer:default_handle_excetion(Type, Why, State).

%%%===================================================================
%%% Internal functions
%%%===================================================================