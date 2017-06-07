%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 交易行数据库更新，删除，插入等处理进程
%%% @end
%%% Created : 07. 五月 2014 17:53
%%%-------------------------------------------------------------------
-module(tradeDataOpOtp).
-author("tiancheng").

-include("tradeDefine.hrl").

-behaviour(myGenServer).
%-behaviour(gen_server).

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
    myGenServer:start_link({local, ?TradeOpPIDName}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

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
    %% 获取交易行数据表(查询类型，每次查询条数)，延迟发消息
    gsSendMsg:sendMsg2DBServer(loadTradeData, 0, {0, ?NODE_Max_Send}),
    %% 初始化
    _Ret = init(),
    ?LOG_OUT("init ~p",[_Ret]),
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
handle_call({opTradeOrder, Msg}, _From, State) ->
    %% 操作订单
    Result = tradeDataOpLogic:opTradeOrder(Msg),
    {reply, Result, State};
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

%% cs 与 db 连通了
handle_info({alreadyConnectDBServer, _Pid, _Msg}, State)->
	?DEBUG_OUT("alreadyConnectDBServer"),
	%% 获取交易行数据表(查询类型，每次查询条数)，延迟发消息
	gsSendMsg:sendMsg2DBServer(loadTradeData, 0, {0, ?NODE_Max_Send}),
	{noreply, State};

handle_info({deleteRole, _Pid, {RoleID}}, State) ->
    tradeDataOpLogic:onDeleteRole(RoleID),
    {noreply, State};

handle_info(Info, State) ->
    case tradeDataOpLogic:getTradeDataInitResult() of
        false ->
            release();
        true ->
            case Info of
                {quit} ->
                    ?LOG_OUT("tradeDataOpOtp quit~n"),
                    release();

                {tradeInfo, _Pid, {Type, TradeInfo}} ->
                    tradeDataOpLogic:tradeInfo(Type, TradeInfo),
                    case length(TradeInfo) < ?NODE_Max_Send of
						true ->
							?DEBUG_OUT("receive tradeinfo data complete !!!"),

							%% 检查是否有空的静态数据
							tradeDataOpLogic:isHaveNoneStaticRow(),

							%% 检查过期订单的心跳
							downTimeOutOrderTick();
						_ ->
							skip
                    end;

                tickDownOrderTick ->
                    %% 处理
                    tradeDataOpLogic:downTimeOutOrder(),
                    downTimeOutOrderTick();

                tickRecoverTradeData ->
                    %% 定时回收内存
                    recover(),

                    recoverTrade();
                _ ->
                    ?LOG_OUT("tradeDataOpOtp receive unkown")
            end
    end,

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
    ?LOG_OUT("Module: ~p, terminate", [?MODULE]),
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

%% 初始化
init() ->
    %% 先释放一下
    %release(),

    %% 创建RAM数据表
    edb:createTable(?MNESIA_Trade_Silver,   [{attributes, record_info(fields, ?MNESIA_Trade_Silver)}]),
    edb:createTable(?MNESIA_Trade_Private,  [{attributes, record_info(fields, ?MNESIA_Trade_Private)}]),
    edb:createTable(?MNESIA_Trade_Gold,     [{attributes, record_info(fields, ?MNESIA_Trade_Gold)}]),

    mnesia:wait_for_tables([?MNESIA_Trade_Silver,?MNESIA_Trade_Private,?MNESIA_Trade_Gold], 20000),

    %% 表创建成功
    tradeDataOpLogic:setTradeDataInitResult(true),

    %% 定时回收数据心跳
    recoverTrade(),

    ok.

%% 释放
release() ->
    edb:deleteTable(?MNESIA_Trade_Silver),
    edb:deleteTable(?MNESIA_Trade_Private),
    edb:deleteTable(?MNESIA_Trade_Gold),
    ok.

recover() ->
    %% 定时回收内存
    try
        mnesia_recover:allow_garb()
        %%mnesia_recover:start_garb()
    catch
        _:Why1->
            ?LOG_OUT("ExceptionFunc_Module:[~p] ExceptionFunc[recover] Why[~p] stack[~p]", [?MODULE, Why1, erlang:get_stacktrace()])
    end.

%% 定时回收数据
recoverTrade() ->
    erlang:send_after(?Recover_Trade_Tick, self(), tickRecoverTradeData),
    ok.

%% 下架超时订单心跳
downTimeOutOrderTick() ->
    erlang:send_after(?DownOrder_Tick, self(), tickDownOrderTick),
    ok.