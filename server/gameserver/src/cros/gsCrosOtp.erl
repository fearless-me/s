%%%-------------------------------------------------------------------
%%% @author luowei
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 连通跨服服务器
%%% @end
%%% Created : 13. 十一月 2015 18:06
%%%-------------------------------------------------------------------
-module(gsCrosOtp).

-include("gsInc.hrl").

-behaviour(myGenServer).

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

-export([
	dealWeekRewardToHd/0
]).

-define(SERVER, ?MODULE).

-define(OneHourSec, 3600).
-define(OneDaySec,	86400).

-record(state,
		{
		 isConnent = false,
		 node = 0,
		 pid = 0
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
    myGenServer:start_link({local, ?PsNameCros}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).


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
	%% 创建活动排行榜存储ets
	ets:new(rec_cros_rank, [named_table, public, {keypos,#recCrosRank.rankID}]),
	ets:new(?EtsCrosArenaRank, [named_table, public, {keypos,#recCrosArenaRank.rankID}]),
	ets:new(?EtsCrosArenaHightRank, [named_table, public, duplicate_bag]),

	case core:isCross() of
		false ->
			case config:rpc_get_string("CrosNode", "" ) of
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

%%如果活动增加 需要通过统一进程管理(******目前真没时间统一)
handle_info({connectCrosServerAck, DbID}, State) ->
	?LOG_OUT("connect cros server ack crosHdPid[~p], crosArenaPid[~p], dbID [~p] ", [global:whereis_name(?PsNameCrosHd), global:whereis_name(?PsNameCrosArena), DbID]),
	%%发送消息给跨服服务器混沌战场
	psMgr:sendMsg2PS(?PsNameCrosHd, connectSuc, {DbID, self()}),
	
	%%发送消息给跨服竞技战场
	psMgr:sendMsg2PS(?PsNameCrosArena, connectSuc, {DbID, self()}),
	
	%%定时发送奖励
	Now = time:getLocalNowSec1970(),
	
	%%本周第一秒
	FirstSec = time:getWeekBeginSecondsByDay(time:getLocalNowDateTime1970()),
	
	%%本周一更新时间
	LocalWeek = FirstSec + 4 * ?OneHourSec,
	
	%%本周四更新时间
	LocalFourWeek = FirstSec + 4 * ?OneHourSec + 3 * ?OneDaySec,
	
	%%下周一更新时间
	NextWeek = LocalWeek + 7 * ?OneDaySec,
	
	if
		Now >= LocalWeek andalso Now =< LocalFourWeek ->
			%%周四发奖
			?LOG_OUT("init deal week reward1 cd [~p]",[LocalFourWeek - Now]),
			erlang:send_after((LocalFourWeek - Now) * 1000, self(), {dealWeekReward, four});
		Now < LocalWeek ->
			%%周一发奖
			?LOG_OUT("init deal week reward2 cd [~p]",[LocalWeek - Now]),
			erlang:send_after((LocalWeek - Now) * 1000, self(), {dealWeekReward, one});
		true ->
			%%周一发奖
			?LOG_OUT("init deal week reward3 cd [~p]",[NextWeek - Now]),
			erlang:send_after((NextWeek - Now) * 1000, self(), {dealWeekReward, one})
	end,
	{noreply, State};

handle_info({nodedown,NodeName}, State) ->

	?ERROR_OUT("CroS Node[~p] is down, Will reconnect it in 5 second",[NodeName]),
	erlang:send_after(5000, self(), {reconnect, NodeName}),
	{noreply,State#state{isConnent = false, node = 0}};

handle_info({reconnect, NodeName},State) ->
	?LOG_OUT("reconnect cros server node[~p]",[NodeName]),
	NewState = connect(NodeName, State),
	{noreply, NewState};


%%处理玩家跨服周一排行榜奖励
handle_info({dealWeekReward, one}, State) ->
	?LOG_OUT("dealWeekReward one"),
	
	Now = time:getLocalNowSec1970(),
	
	%%本周第一秒
	FirstSec = time:getWeekBeginSecondsByDay(time:getLocalNowDateTime1970()),
	
	%%本周四更新时间
	LocalFourWeek = FirstSec + 4 * ?OneHourSec + 3 * ?OneDaySec,
	
	?LOG_OUT("next deal week reward four cd [~p]",[LocalFourWeek - Now]),
	erlang:send_after((LocalFourWeek - Now) * 1000, self(), {dealWeekReward, four}),
	
	dealWeekRewardToHd(),
	
	dealWeekRewardToArena(),
	
	
	{noreply, State};

%%每次活动，把血腥角斗场的队伍重置
handle_info({resetArenaBattleTeam,_CrossPid}, State) ->
	R = ets:delete_all_objects(?TABLE_CrosTeam),
	?LOG_OUT("resetArenaBattleTeam:~p",[R]),
	{noreply, State};

%%处理玩家跨服周四排行榜奖励
handle_info({dealWeekReward, four}, State) ->
	?LOG_OUT("dealWeekReward four"),
	
	
	%%定时发送奖励
	Now = time:getLocalNowSec1970(),
	
	%%本周第一秒
	FirstSec = time:getWeekBeginSecondsByDay(time:getLocalNowDateTime1970()),
	
	%%本周一更新时间
	LocalWeek = FirstSec + 4 * ?OneHourSec,
	
	%%下周一更新时间
	NextWeek = LocalWeek + 7 * ?OneDaySec,
	?LOG_OUT("next deal week reward one cd [~p]",[NextWeek - Now]),
	erlang:send_after((NextWeek - Now) * 1000, self(), {dealWeekReward, one}),
	
	dealWeekRewardToHd(),
	
	{noreply, State};

%%处理玩家跨服竞技场更新排行榜
handle_info({updateArenaRank, _Pid, [RankList, HightRankList]}, State) ->
	?LOG_OUT("update arena rank [~p], [~p]",[RankList, HightRankList]),
	saveCrosArenaRank(RankList),
	saveCrosArenaHightRank(HightRankList),
	{noreply, State};

%%处理玩家跨服战场奖励
handle_info({dealReward, _Pid, [PlayerList, RankList]}, State) ->
	?LOG_OUT("deal cros hd battle reward ~p", [PlayerList]),
	[Record1, GoodsID1] = globalCfg:getBattleWarRewardNo1(),
	[Record2, GoodsID2] = globalCfg:getBattleWarRewardNo2(),
	[Record3, GoodsID3] = globalCfg:getBattleWarRewardNo3(),
	[Record4, GoodsID4] = globalCfg:getBattleWarRewardNo4(),
	[Record5, GoodsID5] = globalCfg:getBattleWarRewardNo5(),
	Fun = fun({RoleID, R}) ->
		if
			R >= Record5 andalso R < Record4 ->
				GoodsID = GoodsID5;
			R >= Record4 andalso R < Record3 ->
				GoodsID = GoodsID4;
			R >= Record3 andalso R < Record2 ->
				GoodsID = GoodsID3;
			R >= Record2 andalso R < Record1 ->
				GoodsID = GoodsID2;
			R >= Record1 ->
				GoodsID = GoodsID1;
			true ->
				GoodsID = 0
		end,
		case GoodsID of
			0 ->
				skip;
			_ ->
				L1 = case playerMail:createMailGoods(GoodsID, 1, true, 0, RoleID, ?ItemSourceCrosHdBattle) of
				 [#recMailItem{itemID = ItemID}|_] = MailItemList -> 
					 case goods:getGoodsCfg(ItemID) of
						 #itemCfg{name = Name} ->
							 ItemName = Name;
						 _ ->
							 ItemName = ""
					 end,
					 MailItemList;
				 _ ->
					 ItemName = "",
					 []
			 end,
			Title = stringCfg:getString(battle_war_MailTitle),
			Content = stringCfg:getString(battle_war_MailContent, [R, ItemName]),
			mail:sendSystemMail(RoleID, Title, Content, L1, "")
		end
	end,
	lists:foreach(Fun, PlayerList),
	
	%%保存排行榜
	?LOG_OUT("ac end get cros rank ~p", [RankList]),
	saveRankList(RankList),
	{noreply, State};

%%保存排行榜
handle_info({saveRank, _Pid, [RankList]}, State) ->
	?LOG_OUT("start server get cros rank ~p", [RankList]),
	saveRankList(RankList),
	{noreply, State};
	
%%窗口进程转发消息到cross
handle_info({sendDataToCrossServer,Pid,{Name,MsgID,Msg} = Data}, #state{isConnent = IsConnect} = State) ->
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
connect(Node, State) ->
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
					
					erlang:send_after(5000, self(), {connectCrosServerAck, DbID}),
					%%
					erlang:monitor_node(Node, true),

					%% 告诉跨服，保存本节点
					psMgr:sendMsg2PS({?PsNamePlayerMgr, Node}, connectCrossSuccess, {DbID, ServerName}),
					
					State#state{isConnent = true, node  = Node};
				pang ->
					?ERROR_OUT("connect cros server can't connected:~p", [Node]),
					erlang:send_after(5000, self(), {reconnect, Node}),
					State
			end
	end.
	

-spec saveRankList(RankList::list()) -> number().
saveRankList(RankList) ->
	ets:delete_all_objects(rec_cros_rank),
	Fun = fun(#battleRank{} = B, Num) ->
		Rank = #recCrosRank{
			rankID  = Num,
			dbID = B#battleRank.dbID,
			name  = B#battleRank.name,
			sname = B#battleRank.sname,
			roleID = B#battleRank.roleID,
			force = B#battleRank.force,
			record = B#battleRank.record, 
			carrer = B#battleRank.carrer
		},
		ets:insert(rec_cros_rank, Rank),
		Num + 1
	end,
	lists:foldl(Fun, 1, RankList).

%%保存跨服竞技场排行榜
-spec saveCrosArenaRank(RankList::list()) -> number().
saveCrosArenaRank(RankList) ->
	ets:delete_all_objects(?EtsCrosArenaRank),
	saveCrosArenaRank(RankList, 1).
saveCrosArenaRank([], Num) ->
	Num;
saveCrosArenaRank([#arenaBattleRank{} = B | L], Num) ->
	Rank = #recCrosArenaRank{
		rankID  = Num,
		win = B#arenaBattleRank.win,
		fail = B#arenaBattleRank.fail,
		dbID = B#arenaBattleRank.dbID,
		name  = B#arenaBattleRank.name,
		sname = B#arenaBattleRank.sname,
		roleID = B#arenaBattleRank.roleID,
		force = B#arenaBattleRank.force,
		record = B#arenaBattleRank.record, 
		carrer = B#arenaBattleRank.carrer
	},
	ets:insert(?EtsCrosArenaRank, Rank),
	saveCrosArenaRank(L, Num + 1).

%%保存跨服历史排行榜
-spec saveCrosArenaHightRank(RankList::list()) -> number().
saveCrosArenaHightRank(RankList) ->
	ets:delete_all_objects(?EtsCrosArenaHightRank),
	saveCrosArenaHightRank1(RankList).
saveCrosArenaHightRank1([]) ->
	ok;
saveCrosArenaHightRank1([#arenaBattleHightRank{} = B | L]) ->
	Rank = #recCrosArenaHightRank{
		win = B#arenaBattleHightRank.win,
		fail = B#arenaBattleHightRank.fail,
		dbID = B#arenaBattleHightRank.dbID,
		name  = B#arenaBattleHightRank.name,
		sname = B#arenaBattleHightRank.sname,
		roleID = B#arenaBattleHightRank.roleID,
		force = B#arenaBattleHightRank.force,
		record = B#arenaBattleHightRank.record, 
		carrer = B#arenaBattleHightRank.carrer,
		time = B#arenaBattleHightRank.time
	},
	ets:insert(?EtsCrosArenaHightRank, Rank),
	saveCrosArenaHightRank1(L).


%%处理跨服竞技场周奖励
-spec dealWeekRewardToArena() -> ok.
dealWeekRewardToArena() ->
	L = ets:tab2list(?EtsCrosArenaRank),
	L1 = globalCfg:getArenaWeekRewardNo1(),
	L2 = globalCfg:getArenaWeekRewardNo2(),
	L3 = globalCfg:getArenaWeekRewardNo3(),
	[Record4, GoodsID4] = globalCfg:getArenaWeekRewardNo4(),
	[Record5, GoodsID5] = globalCfg:getArenaWeekRewardNo5(),
	[Record6, GoodsID6] = globalCfg:getArenaWeekRewardNo6(),
	[Record7, GoodsID7] = globalCfg:getArenaWeekRewardNo7(),
	Fun = fun(#recCrosArenaRank{roleID = RoleID, carrer = Carrer, rankID = RankID}) ->
				  case core:queryRoleKeyInfoByRoleID(RoleID) of
					  {} ->
						  skip;
					  _->
						  if
							  RankID =:= 1 ->
								  {_, GoodsID} = lists:keyfind(Carrer, 1, L1);
							  RankID =:= 2 ->
								  {_, GoodsID} = lists:keyfind(Carrer, 1, L2);
							  RankID =:= 3 ->
								  {_, GoodsID} = lists:keyfind(Carrer, 1, L3);
							  RankID =< Record4 ->
								  GoodsID = GoodsID4;
							  RankID =< Record5 andalso RankID > Record4 ->
								  GoodsID = GoodsID5;
							  RankID =< Record6 andalso RankID > Record5 ->
								  GoodsID = GoodsID6;
							  RankID =< Record7 andalso RankID > Record6 ->
								  GoodsID = GoodsID7;
							  true ->
								  GoodsID = 0
						  end,
						  case GoodsID of
							  0 ->
								  skip;
							  _ ->
								  Ml = case playerMail:createMailGoods(GoodsID, 1, true, 0, RoleID, ?ItemSourceWeekCrosArenaReward) of
										   [#recMailItem{itemID = ItemID}|_] = MailItemList -> 
											   case goods:getGoodsCfg(ItemID) of
												   #itemCfg{name = Name} ->
													   ItemName = Name;
												   _ ->
													   ItemName = ""
											   end,
											   MailItemList;
										   _ ->
											   ItemName = "",
											   []
									   end,
								  Title = stringCfg:getString(arena_WeekMailTitle),
								  Content = stringCfg:getString(arena_WeekMailContent, [RankID, ItemName]),
								  mail:sendSystemMail(RoleID, Title, Content, Ml, "")
						  end		
				  end
		  end,
	lists:foreach(Fun, L).


%%处理跨服混沌战场周奖励
-spec dealWeekRewardToHd() -> ok.
dealWeekRewardToHd() ->
	L = ets:tab2list(rec_cros_rank),
	L1 = globalCfg:getBattleWarWeekRewardNo1(),
	L2 = globalCfg:getBattleWarWeekRewardNo2(),
	L3 = globalCfg:getBattleWarWeekRewardNo3(),
	[Record4, GoodsID4] = globalCfg:getBattleWarWeekRewardNo4(),
	[Record5, GoodsID5] = globalCfg:getBattleWarWeekRewardNo5(),
	[Record6, GoodsID6] = globalCfg:getBattleWarWeekRewardNo6(),
	[Record7, GoodsID7] = globalCfg:getBattleWarWeekRewardNo7(),
	Fun = fun(#recCrosRank{roleID = RoleID, carrer = Carrer, rankID = RankID}) ->
		case core:queryRoleKeyInfoByRoleID(RoleID) of
			{} ->
				skip;
			_->
				if
					RankID =:= 1 ->
						{_, GoodsID} = lists:keyfind(Carrer, 1, L1);
					RankID =:= 2 ->
						{_, GoodsID} = lists:keyfind(Carrer, 1, L2);
					RankID =:= 3 ->
						{_, GoodsID} = lists:keyfind(Carrer, 1, L3);
					RankID =< Record4 ->
						GoodsID = GoodsID4;
					RankID =< Record5 andalso RankID > Record4 ->
						GoodsID = GoodsID5;
					RankID =< Record6 andalso RankID > Record5 ->
						GoodsID = GoodsID6;
					RankID =< Record7 andalso RankID > Record6 ->
						GoodsID = GoodsID7;
					true ->
						GoodsID = 0
				end,
				case GoodsID of
					0 ->
						skip;
					_ ->
						Ml = case playerMail:createMailGoods(GoodsID, 1, true, 0, RoleID, ?ItemSourceWeekCrosHdBattle) of
							 [#recMailItem{itemID = ItemID}|_] = MailItemList -> 
					 			case goods:getGoodsCfg(ItemID) of
									 #itemCfg{name = Name} ->
										 ItemName = Name;
									 _ ->
							 			 ItemName = ""
					 			end,
								 MailItemList;
							 _ ->
					 			 ItemName = "",
								 []
			 				end,
							Title = stringCfg:getString(battle_war_WeekMailTitle),
							Content = stringCfg:getString(battle_war_WeekMailContent, [RankID, ItemName]),
							mail:sendSystemMail(RoleID, Title, Content, Ml, "")
				end		
		end
	end,
	lists:foreach(Fun, L).
