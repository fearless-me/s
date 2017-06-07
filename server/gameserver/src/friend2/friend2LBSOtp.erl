%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20161115
%%%-------------------------------------------------------------------
-module(friend2LBSOtp).
-author("meitianyang").

-include("friend2Private.hrl").

-behaviour(myGenServer).

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3,
    handle_exception/3,

    queryDistance/2
]).

-define(SERVER, ?MODULE).

%% 心跳频率
%% 执行心跳时用于在线角色队列中的数据计算，假设最大在线量3000，那也仅仅是3000次遍历，一瞬间的事情
%% 不执行心跳时用于接收角色的上线、下线消息，用于进一步维护在线角色队列
-define(TimeTick, 1000).

%% 计算冷却时间
%% 如果一个计算结果还是新鲜热乎的，那么就不必再进行计算了
-define(TimeCD, 7200).

%% 距离小于临界值时按照临界值记录计算结果，以根据法律保护隐私
-define(DistanceMin, 1.0).
-define(DistanceMax, 120.0).

%% 在线角色队列 [{RoleID::uint64(), Time::uint32()}, ...]
%% Time from time2:getTimestampSec/0
%% 策略：
%% 1.上线时添加至列表尾
%% 2.下线时从列表中移除，同时需要移除缓存的计算结果
%% 3.计算时将首元素与其它元素遍历计算，后将首元素移值列表尾
-record(state, {
    queueOnline = [] :: [{uint64(), uint32()}, ...] %% 在线角色队列
}).

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
    myGenServer:start_link({local, ?PsNameFriend2LBS}, ?MODULE, [], [{timeout, ?Start_Link_TimeOut_ms}]).

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
    ?LOG_OUT("~p ~p init OK",[?MODULE, self()]),
    erlang:send_after(?TimeTick, self(), tick),
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

%% DBS初始化完毕
handle_info({alreadyConnectDBServer, _Pid, _}, State) ->
    {noreply, State};

%% 心跳
handle_info(tick, #state{queueOnline = Q0} = State) ->
    erlang:send_after(?TimeTick, self(), tick),
    case Q0 of
        [] ->
            {noreply, State};   %% 无可计算之物
        [H|T] ->
            updateDistance0(H, T),
            {noreply, State#state{queueOnline = T ++ [H]}}
    end;

%% 上下线
handle_info({friend2_online, _, RoleID}, #state{queueOnline = Q0} = State) ->
    Q1 = lists:keydelete(RoleID, 1, Q0),                %% 插入前的删除是为了防止意外导致的重复插入
    Q2 = lists:keystore(RoleID, 1, Q1, {RoleID, 0}),    %% 上线时插入时间为0以便尽快计算距离
    {noreply, State#state{queueOnline = Q2}};
handle_info({friend2_offline, _, RoleID}, #state{queueOnline = Q0} = State) ->
    Q1 = lists:keydelete(RoleID, 1, Q0),
    %% 删除相关的计算结果（计算结果的累积并不是什么好事）
    FunFilter =
        fun(#recFriend2LBS{mixRoleID = {R1, R2}}, R) ->
            case RoleID of
                R1 ->
                    [{R1, R2} | R];
                R2 ->
                    [{R1, R2} | R];
                _ ->
                    R
            end
        end,
    List1 = ets:foldl(FunFilter, [], ?EtsFriend2LBS),
    List2 = lists:usort(List1),
    [ets:delete(?EtsFriend2LBS, Key) || Key <- List2],
    {noreply, State#state{queueOnline = Q1}};

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
    State :: #state{}) ->
    term()).
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

%%--------------------------------------------------------------------
%%--------------------------------------------------------------------
%% 查询两个角色的现实距离
%%     任意进程可调用
-spec queryDistance(RoleID::uint64(), TargetRoleID::uint64()) -> Distance::float().
queryDistance(RoleID, TargetRoleID) ->
    case ets:lookup(?EtsFriend2LBS, mixRoleID(RoleID, TargetRoleID)) of
        [#recFriend2LBS{distance = Distance}] ->
            Distance;
        _ ->
            ?DistanceMax    %% 没有计算出结果时给出最大值
    end.

%%--------------------------------------------------------------------
%%--------------------------------------------------------------------

%% 生成混合角色ID
%% 较小ID在前
-spec mixRoleID(RoleID::uint64(), TargetRoleID::uint64()) -> {R1::uint64(), R2::uint64()}.
mixRoleID(RoleID, TargetRoleID) when RoleID < TargetRoleID -> {RoleID, TargetRoleID};
mixRoleID(RoleID, TargetRoleID) -> {TargetRoleID, RoleID}.

%% 更新距离
-spec updateDistance0({RoleID::uint64(), Time::uint32()}, ListRoleIDTime::[{uint64(), uint32()}, ...]) -> ok.
updateDistance0({RoleID, Time}, ListRoleIDTime) ->
    TimeNow = time2:getTimestampSec(),
    case Time + ?TimeCD < TimeNow of
        false ->
            %% 未冷却，忽略
            %?DEBUG_OUT("[DebugForLBS] updateDistance1 skipT"),
            skip;
        _ ->
            {RatLongitudeHT, RatLatitudeHT} =
                {
                    variant:getPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_RatLongitudeHT),
                    variant:getPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_RatLatitudeHT)
                },
            case {RatLongitudeHT, RatLatitudeHT} of
                {0, 0} ->
                    %% 未初始化经纬，忽略
                    %?DEBUG_OUT("[DebugForLBS] updateDistance1 skip0"),
                    skip;
                _ ->
                    updateDistance1(RoleID, ListRoleIDTime, TimeNow, {RatLongitudeHT / 100000.0, RatLatitudeHT / 100000.0})
            end
    end,
    ok.

-spec updateDistance1(RoleID::uint64(), ListRoleIDTime::[{uint64(), uint32()}, ...], TimeNow::uint32(), LongitudeLatitude1::{float(), float()}) -> ok.
updateDistance1(_, [], _, _) ->
    ok; %% 计算结束
updateDistance1(RoleID, [{TargetRoleID, _} | T], TimeNow, LL1) ->
    {RatLongitudeHT, RatLatitudeHT} =
        {
            variant:getPlayerVariant(TargetRoleID, ?Setting_PlayerVarReadOnly_RatLongitudeHT),
            variant:getPlayerVariant(TargetRoleID, ?Setting_PlayerVarReadOnly_RatLatitudeHT)
        },
    case {RatLongitudeHT, RatLatitudeHT} of
        {0, 0} ->
            %% 未初始化经纬，忽略
            %?DEBUG_OUT("[DebugForLBS] updateDistance1 skip0"),
            skip;
        _ ->
            LL2 = {RatLongitudeHT / 100000.0, RatLatitudeHT / 100000.0},
            MixRoleID = mixRoleID(RoleID, TargetRoleID),
            case ets:lookup(?EtsFriend2LBS, MixRoleID) of
                [#recFriend2LBS{time = Time}] when Time + ?TimeCD < TimeNow ->
                    %?DEBUG_OUT("[DebugForLBS] updateDistance1 update"),
                    %% 计算结果太陈旧，准许更新
                    Distance = updateDistance2(LL1, LL2),
                    ets:insert(?EtsFriend2LBS, #recFriend2LBS{mixRoleID = MixRoleID, distance = Distance, time = TimeNow});
                [] ->
                    %?DEBUG_OUT("[DebugForLBS] updateDistance1 new"),
                    %% 没有旧的结果，新建
                    Distance = updateDistance2(LL1, LL2),
                    ets:insert(?EtsFriend2LBS, #recFriend2LBS{mixRoleID = MixRoleID, distance = Distance, time = TimeNow});
                _T ->
                    %?DEBUG_OUT("[DebugForLBS] updateDistance1 skip Time:~p TimeNow:~p", [_T, TimeNow]),
                    skip
            end
    end,
    updateDistance1(RoleID, T, TimeNow, LL1).

-spec updateDistance2(LongitudeLatitude1::{float(), float()}, LongitudeLatitude2::{float(), float()}) -> ok.
updateDistance2({Longitude1, Latitude1}, {Longitude2, Latitude2}) ->
    %% 算法参考 http://www.w2bc.com/article/183194
    %?DEBUG_OUT("[DebugForLBS] updateDistance2 P1:~p P2:~p", [{Longitude1, Latitude1}, {Longitude2, Latitude2}]),
    DX = Longitude1 - Longitude2,         %% 经度差值
    DY = Latitude1 - Latitude2,           %% 纬度差值
    ALat = (Latitude1 + Latitude2) / 2.0, %% 平均纬度
    %% 6366707.02676 是地球平均半径（米）
    DLon = DX * 6366707.02676 * math:cos(ALat),
    DLat = DY * 6366707.02676,
    Distance = math:sqrt(DLon * DLon + DLat * DLat) / 1000.0,
    case Distance < ?DistanceMin of
        true ->
            ?DistanceMin;
        _ ->
            %?DEBUG_OUT("[DebugForLBS] updateDistance2 Distance:~p", [Distance]),
            Distance
    end.
