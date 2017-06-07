%%%-------------------------------------------------------------------
%%% @author luowei
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 跨服角斗士
%%% @end
%%% Created : 22. 十二月 2015 17:36
%%%-------------------------------------------------------------------
-module(arenaBattleOtp).

-behaviour(myGenServer).

-include("gsInc.hrl").
-include("arenaBattlePrivate.hrl").
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
	myGenServer:start_link({global, ?PsNameCrosArena}, ?MODULE, [], []).

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
	?LOG_OUT("~p ~p init", [?MODULE, self()]),
	erlang:process_flag(trap_exit, true),
	erlang:process_flag(priority, high),
	%% 创建活动排行榜存储ets
	case file:read_file_info(?Ets_Tab_Arena_Rank_Txt) of
		{ok,_Info} ->
			%%有缓存文件，强制加载成功，否则报错
			case ets:file2tab(?Ets_Tab_Arena_Rank_Txt) of
				{ok,_} ->
					?LOG_OUT("ets arena rank[~ts],load cache ok",[?Ets_Tab_Arena_Rank_Txt]);
				Reason ->
					%% 加载不成功，打印一个错误
					ets:new(?Ets_Tab_Arena_Rank, [named_table, protected, {keypos,#?Ets_Tab_Arena_Rank.roleID}]),
					?ERROR_OUT("ets arena rank[~ts],load cache error[~p]", [?Ets_Tab_Arena_Rank_Txt, Reason])
			end;
		_ ->
			ets:new(?Ets_Tab_Arena_Rank, [named_table, protected, {keypos,#?Ets_Tab_Arena_Rank.roleID}]),
			?LOG_OUT("ets arena rank[~ts],no cache;normal init ets",[?Ets_Tab_Arena_Rank_Txt]),
			skip
	end,
	%% 创建活动最高排行榜存储ets
	case file:read_file_info(?Ets_Tab_Arena_Rank_Hight_Txt) of
		{ok, _Info1} ->
			%%有缓存文件，强制加载成功，否则报错
			case ets:file2tab(?Ets_Tab_Arena_Rank_Hight_Txt) of
				{ok,_} ->
					?LOG_OUT("ets arena hight rank[~ts],load cache ok",[?Ets_Tab_Arena_Rank_Hight_Txt]);
				Reason2 ->
					ets:new(?Ets_Tab_Arena_Hight_Rank, [named_table, protected, duplicate_bag]),
					?ERROR_OUT("ets arena hight rank[~ts],load cache error[~p]", [?Ets_Tab_Arena_Rank_Hight_Txt, Reason2])
			end;
		_ ->
			ets:new(?Ets_Tab_Arena_Hight_Rank, [named_table, protected, duplicate_bag]),
			?LOG_OUT("ets arena hight rank[~ts],no cache;normal init ets",[?Ets_Tab_Arena_Rank_Hight_Txt]),
			skip
	end,
	arenaBattleLogic:init(),
	erlang:send_after(?ArenaBattleTick, self(), tick),
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

handle_info(tick, State) ->
	erlang:send_after(?ArenaBattleTick, self(), tick),
	arenaBattleLogic:tick(),
	{noreply, State};

%% 开启活动心跳
handle_info(startArenaAc, State) ->
	%%关闭活动心跳启动
	#activityCfg{starttime = [{_, Starttime} | _], lenghtime = Sec} = arenaBattleLogic:getAcData(),
	{{_Year,_Month,_Day}, {Hour,Minute,Second}} = time:getLocalNowDateTime1970(),
	EndTime = Starttime * ?OneHourAcSec + Sec,
	NowTime = Hour * ?OneHourAcSec + Minute * ?OneMinAcSec + Second,
	erlang:send_after((EndTime - NowTime) * 1000, self(), closeArenaAc),
	arenaBattleLogic:startAc(true, EndTime - NowTime),

	[psMgr:sendMsg2PS(Pid, resetArenaBattleTeam) || {_, Pid} <- arenaBattleLogic:getNodeList()],
	{noreply, State};

%%关闭活动心跳
handle_info(closeArenaAc, State) ->
	%%开启活动心跳启动
	#activityCfg{starttime = [{_, Starttime} | _], lenghtime = _Sec} = arenaBattleLogic:getAcData(),
	{{_Year,_Month,_Day}, {Hour,Minute,Second}} = time:getLocalNowDateTime1970(),
	OpenTime = Starttime * ?OneHourAcSec,
	NowTime = Hour * ?OneHourAcSec + Minute * ?OneMinAcSec + Second,
	erlang:send_after((?OneDayAcSec - NowTime + OpenTime) * 1000, self(), startArenaAc),
	arenaBattleLogic:closeAc(true),
	{noreply, State};

handle_info({setAc, _, {Flag}}, State) ->
	case Flag of
		0 ->
			arenaBattleLogic:startAc(false, 3600);
		_ ->
			arenaBattleLogic:closeAc(false)
	end,
	[psMgr:sendMsg2PS(Pid, resetArenaBattleTeam) || {_, Pid} <- arenaBattleLogic:getNodeList()],
	{noreply, State};

%%更新teamid下roleid对应的playerPid，新跨服是要变玩家进程的
handle_info({updateTeamMemberPid, NewPlayerPid, {_TeamID,PlayerID}}, State) ->
	?DEBUG_OUT("updateTeamMemberPid ~p ~p",[PlayerID,NewPlayerPid]),
	arenaBattleLogic:updatePlayerPid(_TeamID,PlayerID,NewPlayerPid),
	{noreply, State};

handle_info({refreshHighRank, _, {}}, State) ->
	case arenaBattleLogic:getFirstRankData() of
		#?Ets_Tab_Arena_Rank{} = Info ->
			Rank = #?Ets_Tab_Arena_Hight_Rank{	
			 roleID = Info#?Ets_Tab_Arena_Rank.roleID,
			 name = Info#?Ets_Tab_Arena_Rank.name,
			 sname = Info#?Ets_Tab_Arena_Rank.sname,
			 dbID = Info#?Ets_Tab_Arena_Rank.dbID,
			 carrer	= Info#?Ets_Tab_Arena_Rank.carrer,
			 force	= Info#?Ets_Tab_Arena_Rank.force,
			 record = Info#?Ets_Tab_Arena_Rank.record,
			 win = Info#?Ets_Tab_Arena_Rank.win,
			 fail = Info#?Ets_Tab_Arena_Rank.fail,
			 time = time:getLocalNowSec1970()
			},
			ets:insert(?Ets_Tab_Arena_Hight_Rank, Rank),
			ets:tab2file(?Ets_Tab_Arena_Hight_Rank, ?Ets_Tab_Arena_Rank_Hight_Txt);
		 _ ->
			skip
	end,
	ets:tab2file(?Ets_Tab_Arena_Rank, ?Ets_Tab_Arena_Rank_Txt),	
	NodeList = arenaBattleLogic:getNodeList(),
	Fun = fun({_DBID, Pid}) ->
		psMgr:sendMsg2PS(Pid, updateArenaRank, [arenaBattleLogic:getRankData(), arenaBattleLogic:getHightRankData()])
	end,
	lists:foreach(Fun, NodeList),
	{noreply, State};

%%由于战场可能还有玩家需要延迟关闭活动处理
handle_info(delayCloseAc, State) ->
	arenaBattleLogic:delayCloseAc(),
	{noreply, State};

%%连接各节点成功
handle_info({connectSuc, _PidFrom, {DBID, Pid}}, State) ->
	?LOG_OUT("Node connect Suc DBID:~p,Pid:~p",[DBID, Pid]),
	L = arenaBattleLogic:getNodeList(),
	arenaBattleLogic:setNodeList(lists:keystore(DBID, 1, L, {DBID, Pid})),
	erlang:monitor_node(node(Pid), true),
	
	%%返回排行榜
	RankList = arenaBattleLogic:getRankData(),
	HightRankList = arenaBattleLogic:getHightRankData(),
	psMgr:sendMsg2PS(Pid, updateArenaRank, [RankList, HightRankList]),
	
	{noreply, State};

%%监听节点
handle_info({nodedown, NodeName},State) ->
	?ERROR_OUT("Node[~p] is down",[NodeName]),
	{noreply,State};


%%踢玩家
handle_info({noticeDestoryCrosMap, MapPid}, State) ->
	psMgr:sendMsg2PS(MapPid, clearBitMapPlayer, 0),
	{noreply, State};


handle_info({clearRank, _, {}}, State) ->
	ets:delete_all_objects(?Ets_Tab_Arena_Rank),
	ets:tab2file(?Ets_Tab_Arena_Rank, ?Ets_Tab_Arena_Rank_Txt),	
	?LOG_OUT("clear arena rank ~p",[ets:tab2list(?Ets_Tab_Arena_Rank)]),
	
	ets:delete_all_objects(?Ets_Tab_Arena_Hight_Rank),
	ets:tab2file(?Ets_Tab_Arena_Hight_Rank, ?Ets_Tab_Arena_Rank_Hight_Txt),	
	?LOG_OUT("clear arena hight rank ~p",[ets:tab2list(?Ets_Tab_Arena_Hight_Rank)]),	
	{noreply, State};

%%请求匹配
handle_info({requestMatch, _PidFrom, {[], ArenaName, DBID, _TeamID, IsGMMatch}}, State) ->
	?ERROR_OUT("request match fail , beacuse of member is null, server name [~ts], server db id [~p]~p", [ArenaName, DBID, IsGMMatch]),
	{noreply, State};

%% 包含GM执行匹配的通用逻辑
handle_info({requestMatch,	_PidFrom, {MemberList, ArenaName, DBID, TeamID, IsGMMatch}}, State) ->
	case arenaBattleLogic:getAcSwitch() of
		true ->
			MapLine = globalCfg:getArenaMaxMapLine(),
			L = arenaBattleLogic:getArenaJoinTeamList(),
			case length(L) >= MapLine of
				true ->
					Fun = fun(#recCrosTeamInfo{netPid = NetPid, pid = Pid}) ->
								  psMgr:sendMsg2PS(Pid, matchFail, {4}),
								  playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosArenaHasFull)
						  end,
					lists:foreach(Fun, MemberList);
				_ ->
					?DEBUG_OUT("rec match succ, member [~p], arenaName [~ts], dbid [~p], teamID [~p]",[MemberList, ArenaName, DBID, TeamID]),
					Fun = fun(#recCrosTeamInfo{} = Teamer) ->
								  #arenaPlayerInfo
								  {
								   roleID = Teamer#recCrosTeamInfo.roleID, 
								   arenaVal = Teamer#recCrosTeamInfo.arenaVal, 
								   career = Teamer#recCrosTeamInfo.career, 
								   sname = ArenaName, 
								   dbID = DBID, 
								   teamID = TeamID,
								   name = Teamer#recCrosTeamInfo.roleName,
								   level = Teamer#recCrosTeamInfo.level, 
								   force = Teamer#recCrosTeamInfo.force, 
								   time = time:getLocalNowSec1970(), 
								   pid = Teamer#recCrosTeamInfo.pid, 
								   netPid = Teamer#recCrosTeamInfo.netPid
								  }
						  end,
					case IsGMMatch of
						true ->
							arenaBattleLogic:gm_match(lists:map(Fun, MemberList));
						_ ->
							arenaBattleLogic:match(lists:map(Fun, MemberList))
					end
			end;
		_ ->
			?WARN_OUT("cros arena ac already close! not rec match"),
			Fun = fun(#recCrosTeamInfo{netPid = NetPid, pid = Pid}) ->
						  psMgr:sendMsg2PS(Pid, matchFail, {3}),
						  playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosArenaHasClose)
				  end,
			lists:foreach(Fun, MemberList)
	end,
	{noreply, State};

%%创建线路成功返回消息(新线路)
handle_info({createActivityMapAck, _, {MapID, [MapPid | _], {Aers, Ders}}}, State) ->
	Fun = fun(#arenaPlayerInfo{} = Info, {Camp, Acc}) ->
		{Camp, [Info#arenaPlayerInfo{camp = Camp} | Acc]}
	end,
	{_, NewAers} = lists:foldl(Fun,{?CampBlueBattle, []}, Aers),
	{_, NewDers} = lists:foldl(Fun, {?CampRedBattle, []}, Ders),
	%%增加比赛队伍
	arenaBattleLogic:addTeam(NewAers, NewDers, MapPid, MapID),
	
	%%刷炮塔
	arenaBattleLogic:refreshTurret(MapPid),
	
	%%通知玩家进入竞技场
	AerFun = fun(#arenaPlayerInfo{pid = Pid}) ->
					 psMgr:sendMsg2PS(Pid, loginCross, {requestJoinArenaBattleAck,{MapID, MapPid, ?CampBlueBattle}} )
%% 					 psMgr:sendMsg2PS(Pid, requestJoinArenaBattleAck, {MapID, MapPid, ?CampBlueBattle})
			 end,
	DerFun = fun(#arenaPlayerInfo{pid = Pid}) ->
					  psMgr:sendMsg2PS(Pid, loginCross, {requestJoinArenaBattleAck,{MapID, MapPid, ?CampRedBattle}} )
%% 					 psMgr:sendMsg2PS(Pid, requestJoinArenaBattleAck, {MapID, MapPid, ?CampRedBattle})
			 end,
	lists:foreach(AerFun, Aers),
	lists:foreach(DerFun, Ders),
	
	{noreply, State};

%%进入地图成功
handle_info({enterMapSuc, NewPlayPid, {Camp, MapPid, RoleID}}, State) ->
	%%统计在线人数
	CurPlayerNum = arenaBattleLogic:getStatPlayerNum(),
	arenaBattleLogic:setStatPlayerNum(CurPlayerNum + 1),
	arenaBattleLogic:updateTeam(MapPid, RoleID, Camp, ?InGame,NewPlayPid),
	{noreply, State};
	
%%进入地图失败
handle_info({enterMapFail, NewPlayPid, {Camp, MapPid, RoleID}}, State) ->
	arenaBattleLogic:updateTeam(MapPid, RoleID, Camp, ?OutGame,NewPlayPid),
	{noreply, State};

%%玩家死亡
handle_info({killedPlayer, _, {MapPid, RoleID, AttackRoleID, Camp, Hurt}}, State) ->
	arenaBattleLogic:playerDead(MapPid, RoleID, AttackRoleID, Camp, Hurt),
	{noreply, State};

%%地图线路销毁
handle_info({destoryMap, _Pid, {MapPid}}, State) ->
	arenaBattleLogic:destoryMap(MapPid),
	{noreply, State};

%%玩家离开地图
handle_info({playerLevelMap, _Pid, {Camp, RoleID, MapPid}}, State) ->
	%%统计在线人数
	CurPlayerNum = arenaBattleLogic:getStatPlayerNum(),
	case CurPlayerNum > 0 of
		true ->
			arenaBattleLogic:setStatPlayerNum(CurPlayerNum - 1);
		_ ->
			skip
	end,
	arenaBattleLogic:playerLevelMap(Camp, MapPid, RoleID),
	{noreply, State};

%%定时同步伤害
handle_info({sysHurt, _Pid, {Hurt, RoleID, MapPid}}, State) ->
	?DEBUG_OUT("RoleID [~p], hurt [~p]", [RoleID, Hurt]),
	arenaBattleLogic:sysHurt(Hurt, RoleID, MapPid),
	{noreply, State};

%%玩家取消匹配
handle_info({cancelMatch, Pid, {RoleID, TeamID, DBID}}, State) ->
	?DEBUG_OUT("RoleID [~p], cancel match [~p]", [RoleID, TeamID]),
	Boolean = arenaBattleLogic:cancelMatch(RoleID, TeamID, DBID),
	psMgr:sendMsg2PS(Pid, cancelMatchAck, {Boolean}),
	{noreply, State};

%%大炮造成的伤害
handle_info({gatherHurt, _Pid, {Camp, PcHurt, MapPid,RoleID, NetPid}}, State) ->
	arenaBattleLogic:gatherHurt(Camp, PcHurt, MapPid, RoleID, NetPid),
	{noreply, State};

handle_info(Info, State) ->
	?ERROR_OUT("recv unknow modeule=~p, msg=~p", [?MODULE,Info]),
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
	%% 强制让文件立即写入disk
	Options = [{extended_info, [object_count]} , {sync, true}],
	case ets:tab2file(?Ets_Tab_Arena_Rank, ?Ets_Tab_Arena_Rank_Txt, Options) of
		ok ->
			?LOG_OUT("sycn ets Ets_Tab_Arena_Rank to file ok");
		Error1 ->
			?ERROR_OUT("sycn ets Ets_Tab_Arena_Rank to file failed,y=~p",[Error1])
	end,
	case ets:tab2file(?Ets_Tab_Arena_Hight_Rank, ?Ets_Tab_Arena_Rank_Hight_Txt,Options) of
		ok ->
			?LOG_OUT("sycn ets Ets_Tab_Arena_Hight_Rank to file ok");
		Error2 ->
			?ERROR_OUT("sycn ets Ets_Tab_Arena_Hight_Rank to file failed,y=~p",[Error2])
	end,
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
