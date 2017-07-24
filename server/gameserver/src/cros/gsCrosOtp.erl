%%%-------------------------------------------------------------------
%%% @author luowei
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 普通服与跨服服务器连接进程
%%% @end
%%% Created : 13. 十一月 2015 18:06
%%%-------------------------------------------------------------------
-module(gsCrosOtp).

-include("gsInc.hrl").
-include("gsCrosPrivate.hrl").

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
	handle_exception/3
]).

-define(SERVER, ?MODULE).

-record(state, {
	isConnect = false,
	node = 0,
	pid = 0,
	lsMainOtpPid = undefined,
	lsMainOtpAckMsg = undefined
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
	myGenServer:start_link({local, ?PsNameNormalCross}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).


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
	?LOG_OUT("~p init",[?MODULE]),

	gsCrosLogic:init(),

	case core:isCross() of
		false ->
			case config:getString("CrosNode", "" ) of
				"" ->
					?WARN_OUT("~p node found CrosNode!", [?MODULE]);
				NodeStr ->
					Node = list_to_atom(NodeStr),
					erlang:send_after(2000, self(), {connectCrosServer, Node})
			end;
		_ ->
			skip
	end,
	?LOG_OUT("~p init OK",[?MODULE]),
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

handle_info({connectCrosServer, Node}, State) ->
	NewState = connect(Node, State),
	{noreply, NewState};

%%连通跨服进程，如果活动增加 需要通过统一进程管理(******目前真没时间统一)
handle_info({connectCrosServerAck, DbID}, State) ->
	gsCrosLogic:connectCrossServerAck({DbID}),
	{noreply, State};

handle_info({nodedown, NodeName}, State) ->
	?ERROR_OUT("CroS Node[~p] is down, Will reconnect it in 5 second",[NodeName]),
	erlang:send_after(5000, self(), {reconnect, NodeName}),
	{noreply,State#state{isConnect = false, node = 0}};

handle_info({reconnect, NodeName},State) ->
	?LOG_OUT("reconnect cros server node[~p]",[NodeName]),
	NewState = connect(NodeName, State),
	{noreply, NewState};

handle_info({waitConnectCrossSuccess, PidFrom, AckMsg}, #state{isConnect = IsConnect} = State) ->
	case IsConnect of
		true ->
			psMgr:sendMsg2PS(PidFrom, AckMsg, 0),
			{noreply, State#state{lsMainOtpPid = undefined, lsMainOtpAckMsg = undefined}};
		_ ->
			{noreply, State#state{lsMainOtpPid = PidFrom, lsMainOtpAckMsg = AckMsg}}
	end;

%%窗口进程转发消息到cross
handle_info({sendDataToCrossServer,Pid,{Name,MsgID,Msg} = Data}, #state{isConnect = IsConnect} = State) ->
	case IsConnect of
		true ->
			psMgr:sendMsg2PS({Name,State#state.node}, MsgID, Pid, Msg);
		_ ->
			psMgr:sendMsg2PS(Pid, cross_not_connect, 0),
			?ERROR_OUT("sendDataToCrossServer: in [~p] [~p,~p] state:~p, Data=~p",[node(),?MODULE,self(),State, Data])
	end,
	{noreply,State};

%%跨服消息，通过本窗口进程中转，发给指定进程
handle_info({sendDataToSourceServer, PidFromCross, {OtpName, MsgID, MsgData}}, State) ->
	psMgr:sendMsg2PS(OtpName, MsgID, PidFromCross, MsgData),
	{noreply,State};



%%%%处理玩家跨服周一排行榜奖励
%%handle_info({dealWeekReward, one}, State) ->
%%	?LOG_OUT("dealWeekReward one"),
%%
%%	Now = time:getLocalNowSec1970(),
%%
%%	%%本周第一秒
%%	FirstSec = time:getWeekBeginSecondsByDay(time:getLocalNowDateTime1970()),
%%
%%	%%本周四更新时间
%%	LocalFourWeek = FirstSec + 4 * ?OneHourSec + 3 * ?OneDaySec,
%%
%%	?LOG_OUT("next deal week reward four cd [~p]",[LocalFourWeek - Now]),
%%	erlang:send_after((LocalFourWeek - Now) * 1000, self(), {dealWeekReward, four}),
%%
%%	gsCrosLogic:dealWeekRewardToHd(),
%%	gsCrosLogic:dealWeekRewardToArena(),
%%	{noreply, State};
%%
%%%%处理玩家跨服周四排行榜奖励
%%handle_info({dealWeekReward, four}, State) ->
%%	?LOG_OUT("dealWeekReward four"),
%%
%%	%%定时发送奖励
%%	Now = time:getLocalNowSec1970(),
%%
%%	%%本周第一秒
%%	FirstSec = time:getWeekBeginSecondsByDay(time:getLocalNowDateTime1970()),
%%
%%	%%本周一更新时间
%%	LocalWeek = FirstSec + 4 * ?OneHourSec,
%%
%%	%%下周一更新时间
%%	NextWeek = LocalWeek + 7 * ?OneDaySec,
%%	?LOG_OUT("next deal week reward one cd [~p]",[NextWeek - Now]),
%%	erlang:send_after((NextWeek - Now) * 1000, self(), {dealWeekReward, one}),
%%	gsCrosLogic:dealWeekRewardToHd(),
%%	{noreply, State};
%%
%%%%每次活动，把血腥角斗场的队伍重置
%%handle_info({resetArenaBattleTeam,_CrossPid}, State) ->
%%	R = ets:delete_all_objects(?TABLE_CrosTeam),
%%	?LOG_OUT("resetArenaBattleTeam:~p",[R]),
%%	{noreply, State};
%%
%%%%处理玩家跨服竞技场更新排行榜
%%handle_info({updateArenaRank, _Pid, [RankList, HightRankList]}, State) ->
%%	?LOG_OUT("update arena rank [~p], [~p]",[RankList, HightRankList]),
%%	gsCrosLogic:saveCrosArenaRank(RankList),
%%	gsCrosLogic:saveCrosArenaHightRank(HightRankList),
%%	{noreply, State};
%%
%%%%处理玩家跨服战场奖励
%%handle_info({dealReward, _Pid, [PlayerList, RankList]}, State) ->
%%	gsCrosLogic:dealReward(PlayerList),
%%	%%保存排行榜
%%	?LOG_OUT("ac end get cros rank ~p", [RankList]),
%%	gsCrosLogic:saveRankList(RankList),
%%	{noreply, State};
%%
%%%%保存排行榜
%%handle_info({saveRank, _Pid, [RankList]}, State) ->
%%	?LOG_OUT("start server get cros rank ~p", [RankList]),
%%	gsCrosLogic:saveRankList(RankList),
%%	{noreply, State};

handle_info(Info,State) ->
	?ERROR_OUT("unhandle info:[~p] in [~p] [~p,~p]",[Info,node(),?MODULE,self()]),
	{noreply,State}.

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
terminate(Reason, State) ->
	?LOG_OUT("Module[~p] terminate by[~p], State[~p]",[?MODULE,Reason,State]),
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
connect(Node, #state{lsMainOtpPid = LsPid, lsMainOtpAckMsg = LsAckMsg} = State) ->
	DbID = gsMainLogic:getDBID4GS(),
	ServerName = gsMainLogic:getAreaName(),
	case DbID of
		undefined ->
			erlang:send_after(5000, self(), {reconnect, Node}),
			State;
		_ ->
			case net_adm:ping(Node) of
				pong ->
					%% 已连通，打印信息
					?LOG_OUT("crosOtp is ready [~p][~p], DbID = [~p], ~ts", [Node, self(), DbID, ServerName]),

					%% 延迟回调连接成功的消息
					erlang:send_after(5000, self(), {connectCrosServerAck, DbID}),

					%% 监控节点
					erlang:monitor_node(Node, true),

					%% 告诉跨服，保存本节点
					psMgr:sendMsg2PS({?PsNameCrossNormal, Node}, connectCrossSuccess, {DbID, ServerName}),

					case erlang:is_pid(LsPid) of
						true ->
							psMgr:sendMsg2PS(LsPid, LsAckMsg, 0),
							State#state{isConnect = true, node  = Node, lsMainOtpPid = undefined, lsMainOtpAckMsg = undefined};
						_ ->
							State#state{isConnect = true, node  = Node}
					end;
				pang ->
					?ERROR_OUT("connect cros server can't connected:~p", [Node]),
					erlang:send_after(5000, self(), {reconnect, Node}),
					State
			end
	end.