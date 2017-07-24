%%%-------------------------------------------------------------------
%%% @author luowei
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 跨服混沌战场模块
%%% @end
%%% Created : 16. 十一月 2015 17:36
%%%-------------------------------------------------------------------
-module(hdBattleOtp).

-behaviour(myGenServer).

-include("gsInc.hrl").
-include("hdBattlePrivate.hrl").
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
	myGenServer:start_link({global, ?PsNameCrosHd}, ?MODULE, [], []).

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
	case file:read_file_info(?Ets_Tab_Rank_Txt) of
		{ok,_Info} ->
			%%有缓存文件，强制加载成功，否则报错
			case ets:file2tab(?Ets_Tab_Rank_Txt) of
				{ok,_} ->
					?LOG_OUT("ets[~w],load cache ok",[?Ets_Tab_Rank_Txt]);
				Reason ->
					ets:new(?Ets_Tab_Rank, [named_table, protected, {keypos,#?Ets_Tab_Rank.roleID}]),
					?ERROR_OUT("ets[~w],load cache error[~p]",[?Ets_Tab_Rank_Txt, Reason])
			end;
		_ ->
			ets:new(?Ets_Tab_Rank, [named_table, protected, {keypos,#?Ets_Tab_Rank.roleID}]),
			?LOG_OUT("ets[~w],no cache;normal init ets",[?Ets_Tab_Rank]),
			skip
	end,
	hdBattleLogic:init(),
	erlang:send_after(?CorsHdBattleTick, self(), tick),
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

%%心跳
handle_info(tick, State) ->
	erlang:send_after(?CorsHdBattleTick, self(), tick),
	hdBattleLogic:tickPhase(),
	{noreply, State};

%%踢玩家
handle_info({noticeDestoryCrosMap, L}, State) ->
	Fun = fun(#battleMapInfo{mapPid = MapPid}) ->			
		psMgr:sendMsg2PS(MapPid, clearBitMapPlayer, 0)
	end,
	lists:foreach(Fun, L),
	{noreply, State};

%%连接各节点成功
handle_info({connectSuc, _PidFrom, {DBID, Pid}}, State) ->
	?LOG_OUT("Node connect Suc DBID:~p,Pid:~p",[DBID, Pid]),
	L = hdBattleLogic:getNodeList(),
	hdBattleLogic:setNodeList(lists:keystore(DBID, 1, L, {DBID, Pid})),
	erlang:monitor_node(node(Pid), true),
	
	%%返回排行榜
	RankList = hdBattleLogic:getRankData(),
	psMgr:sendMsg2PS(Pid, saveRank, [RankList]),
	{noreply, State};

%%监听节点
handle_info({nodedown, NodeName},State) ->
	?ERROR_OUT("Node[~p] is down",[NodeName]),
	{noreply,State};


%% 开启活动心跳
handle_info(startHdAc, State) ->
	%%关闭活动心跳启动
	#activityCfg{starttime = [{_, Starttime} | _], lenghtime = Sec} = hdBattleLogic:getAcData(),
	{{_Year,_Month,_Day}, {Hour,Minute,Second}} = time:getLocalNowDateTime1970(),
	EndTime = Starttime * ?OneHourAcSec + Sec,
	NowTime = Hour * ?OneHourAcSec + Minute * ?OneMinAcSec + Second,
	erlang:send_after((EndTime - NowTime) * 1000, self(), closeHdAc),
	hdBattleLogic:startAc(true, EndTime - NowTime),
	{noreply, State};

%%关闭活动心跳
handle_info(closeHdAc, State) ->
	%%开启活动心跳启动
	#activityCfg{starttime = [{_, Starttime} | _], lenghtime = _Sec} = hdBattleLogic:getAcData(),
	{{_Year,_Month,_Day}, {Hour,Minute,Second}} = time:getLocalNowDateTime1970(),
	OpenTime = Starttime * ?OneHourAcSec,
	NowTime = Hour * ?OneHourAcSec + Minute * ?OneMinAcSec + Second,
	erlang:send_after((?OneDayAcSec - NowTime + OpenTime) * 1000, self(), startHdAc),
	hdBattleLogic:closeAc(true),
	{noreply, State};

%%gm
handle_info({setAc, _, {Flag}}, State) ->
	case Flag of
		0 ->
			hdBattleLogic:startAc(false, 1800);
		_ ->
			hdBattleLogic:closeAc(false)
	end,
	{noreply, State};

handle_info({clearRank, _, {}}, State) ->
	ets:delete_all_objects(?Ets_Tab_Rank),
	ets:tab2file(?Ets_Tab_Rank, ?Ets_Tab_Rank_Txt),	
	?LOG_OUT("clear rank ~p",[ets:tab2list(?Ets_Tab_Rank)]),
	{noreply, State};

%%分配地图线路
handle_info({allocMapLine, PidFrom, {_RoleID, _RoleName, _RolePID, RoleNetPID, _Carrer, _DbID, _AreaName, _Force, _HistoryForce, _Level} = Msg}, State) ->
	case hdBattleLogic:getAcSwitch() of
		false ->
			playerMsg:sendErrorCodeMsg(RoleNetPID, ?ErrorCode_CrosBattle_AcHasNotOpen);
		_ ->
			case hdBattleLogic:allocMapLine(Msg) of
				{newLine, Class} ->
					%%分配新线路
					L = hdBattleLogic:getAcAllocLine(),
					case lists:member(Class, L) of
						false ->
							#activityCfg{mapidlist = [MapID | _]} = hdBattleLogic:getAcData(),
							core:sendMsgToMapMgr(MapID, createActivityMap, {MapID, 1, {Class, Msg}}),
							%%加入分配列表
							hdBattleLogic:setAcAllocLine([Class | L]);
						_ ->
							%%正在分配
							playerMsg:sendErrorCodeMsg(RoleNetPID, ?ErrorCode_CrosBattle_AllocLineBusy)
					end;
				{maxLine, ErrorCode} ->
					%%线路已满
					playerMsg:sendErrorCodeMsg(RoleNetPID, ErrorCode);
				#battleMapInfo{mapNum = MapNum, mapPid = MapPid, mapANum = MapANum, mapBNum = MapBNum} = B->
					%%分配线路成功
					%%分配阵营
					case MapANum > MapBNum of
						true ->
							Camp = ?CampRedBattle,
							B1 = B#battleMapInfo{mapNum = MapNum + 1, mapBNum = MapBNum + 1};
						_ ->
							Camp = ?CampBlueBattle,
							B1 = B#battleMapInfo{mapNum = MapNum + 1, mapANum = MapANum + 1}
					end,
					%%更新
					hdBattleLogic:updateMapLineInfo(B1),
					%%通知玩家
					#activityCfg{mapidlist = [MapID | _]} = hdBattleLogic:getAcData(),
					psMgr:sendMsg2PS(PidFrom, loginCross, {requestJoinCroHDBattleAck,{MapID, MapPid, Camp, Msg}} )
%% 					psMgr:sendMsg2PS(PidFrom, requestJoinCroHDBattleAck, {MapID, MapPid, Camp, Msg})
			end
	end,
	{noreply, State};

%%创建线路成功返回消息(新线路)
handle_info({createActivityMapAck, _, {MapID, [MapPid | _], {Class, Msg}}}, State) ->
	case hdBattleLogic:getAcSwitch() of
		true ->
			{_RoleID, _RoleName, RolePID, _RoleNetPID, _Carrer, _DbID, _AreaName, _Force, _HistoryForce, _Level} = Msg,
			%%清理线路列表
			L = hdBattleLogic:getAcAllocLine(),
			hdBattleLogic:setAcAllocLine(lists:delete(Class, L)),
			
			%%分配成功
			B= #battleMapInfo{
							  mapType = Class,
							  mapP = ?OnePhase,
							  mapA = 0,
							  mapB = 0,
							  mapPid = MapPid,
							  mapNum = 1,
							  mapANum = 1
							 },
			
			%%进入下一阶段
			hdBattleLogic:enterPhaseOne(MapPid),
			
			%%更新
			hdBattleLogic:updateMapLineInfo(B),
			
			%%通知玩家
			psMgr:sendMsg2PS(RolePID, loginCross, {requestJoinCroHDBattleAck,{MapID, MapPid, ?CampBlueBattle, Msg}} );
%% 			psMgr:sendMsg2PS(RolePID, requestJoinCroHDBattleAck, {MapID, MapPid, ?CampBlueBattle, Msg});
		_ ->
			?WARN_OUT("ac close, still createActivityMapAck")
	end,
	{noreply, State};

%%进入地图成功
handle_info({enterMapSuc, _, {Camp, MapPid, Msg}}, State) ->
	case hdBattleLogic:getAcSwitch() of
		true ->
			{RoleID, RoleName, RolePID, RoleNetPID, Carrer, DbID, AreaName, Force, _HistoryForce, _} = Msg,
			%%更新玩家信息
			case hdBattleLogic:getMapLinePlayerByRoleID(RoleID) of
				[] ->%%玩家不存在
					B1 = #battlePlayerInfo{
										   camp = Camp,
										   asKill = 0, 
										   carrer = Carrer, 
										   dbID = DbID, 
										   force = Force, 
										   inAc = ?OnLine, 
										   isCol = ?HasNoCol,
										   kill = 0,
										   mapPid = MapPid, 
										   name = RoleName, 
										   sname = AreaName,
										   netPid = RoleNetPID, 
										   pid = RolePID, 
										   record = 0, 
										   roleID = RoleID
										  };
				#battlePlayerInfo{cd = CD} = B ->
					%%玩家存在
					B1 = B#battlePlayerInfo{
											cd = CD,
											camp = Camp,
											asKill = 0,
											dbID = DbID,
											sname = AreaName,
											force = Force,
											inAc = ?OnLine,
											isCol = ?HasNoCol,
											kill = 0,
											mapPid = MapPid,
											name = RoleName,
											netPid = RoleNetPID,
											pid = RolePID
										   }
			end,
			hdBattleLogic:updatePlayerInfo(B1),
			
			%%进入统计人数
			CurPlayerNum = hdBattleLogic:getStatPlayerNum(),
			hdBattleLogic:setStatPlayerNum(CurPlayerNum + 1),
			
			%%发送阶段
			hdBattleLogic:broadCastPhase([B1], hdBattleLogic:getMapLine(MapPid)),
			
			%%发送活动倒计时
			hdBattleLogic:getAcCd(RoleNetPID);
		_ ->
			?WARN_OUT("ac close, still enterMapSuc")
	end,
	
	{noreply, State};

handle_info({getCD, _, {RoleNetPID}}, State) ->
	case hdBattleLogic:getAcSwitch() of
		true ->
			hdBattleLogic:getAcCd(RoleNetPID);
		_ ->
			?WARN_OUT("ac close, still getCD")
	end,
	{noreply, State};
	
%%进入地图失败
handle_info({enterMapFail, _, {Camp, MapPid}}, State) ->	
	%%更新地图信息
	case hdBattleLogic:getAcSwitch() of
		true ->
			B = #battleMapInfo{mapNum = MapNum, mapANum = MapANum, mapBNum = MapBNum} = hdBattleLogic:getMapLine(MapPid),
			case Camp of
				?CampRedBattle ->
					B1 = B#battleMapInfo{mapBNum = MapBNum - 1, mapNum = MapNum - 1};
				_ ->
					B1 = B#battleMapInfo{mapANum = MapANum - 1, mapNum = MapNum - 1}
			end,
			hdBattleLogic:updateMapLineInfo(B1);
		_ ->
			?WARN_OUT("ac close, still enterMapFail")
	end,
	
	{noreply, State};

%%地图线路销毁
handle_info({destoryMap, _Pid, {MapPid}}, State) ->
	case hdBattleLogic:getAcSwitch() of
		true ->
			case hdBattleLogic:getMapLine(MapPid) of
				#battleMapInfo{} = B ->
					?LOG_OUT("cros hd battle destory map pid [~p], map info [~p]",[MapPid, B]),
					L = hdBattleLogic:getMapLineInfoList(),
					case lists:keyfind(MapPid, #battleMapInfo.mapPid, L) of
						false ->
							?ERROR_OUT("cros hd battle map pid not exist, map pid [~p]",[MapPid]);
						#battleMapInfo{} = B ->
							L1 = lists:keydelete(MapPid, #battleMapInfo.mapPid, L),
							hdBattleLogic:setMapLineInfoList(L1)
					end;
				_ ->
					skip
			end;
		_ ->
			?WARN_OUT("ac close, still destoryMap")
	end,
	{noreply, State};

%%玩家离开地图
handle_info({playerLevelMap, _Pid, {RoleID, MapPid}}, State) ->
	case hdBattleLogic:getAcSwitch() of
		true ->
			case hdBattleLogic:getMapLinePlayerByRoleID(RoleID) of
				[] ->%%玩家不存在
					?ERROR_OUT("cros hd battle player not exist, roleID [~p]",[RoleID]);
				#battlePlayerInfo{camp = Camp} = B ->
					
					%%进入统计人数
					CurPlayerNum = hdBattleLogic:getStatPlayerNum(),
					%%可能活动关闭后玩家离开地图不进行统计
					case CurPlayerNum > 0 of
						true ->
							hdBattleLogic:setStatPlayerNum(CurPlayerNum - 1);
						_ ->
							skip
					end,
					
					%%玩家存在
					B1 = B#battlePlayerInfo{
											inAc = ?OffLine
										   },
					hdBattleLogic:updatePlayerInfo(B1),
					
					%%更新地图信息
					B2 = #battleMapInfo{mapNum = MapNum, mapANum = MapANum, mapBNum = MapBNum} = hdBattleLogic:getMapLine(MapPid),
					case Camp of
						?CampRedBattle ->
							B3 = B2#battleMapInfo{mapBNum = MapBNum - 1, mapNum = MapNum - 1};
						_ ->
							B3 = B2#battleMapInfo{mapANum = MapANum - 1, mapNum = MapNum - 1}
					end,
					hdBattleLogic:updateMapLineInfo(B3)
			end;
		_ ->
			?WARN_OUT("ac close, still playerLevelMap")
	end,
	{noreply, State};

%%杀死马车
handle_info({killedHorse, _Pid, {MapPid, Camp}}, State) ->
	case hdBattleLogic:getAcSwitch() of
		true ->
			hdBattleLogic:killedHorse(MapPid, Camp);
		_ ->
			?WARN_OUT("ac close, still killedHorse")
	end,
	{noreply, State};

%%杀死守卫
handle_info({killedGuard, _Pid, {MapPid, Camp}}, State) ->
	case hdBattleLogic:getAcSwitch() of
		true ->
			hdBattleLogic:killedGuard(MapPid, Camp);
		_ ->
			?WARN_OUT("ac close, still killedGuard")
	end,
	{noreply, State};

%%杀死玩家
handle_info({killedPlayer, _Pid, {RoleID, MapPid, RoleIDList}}, State) ->
	case hdBattleLogic:getAcSwitch() of
		true ->
			hdBattleLogic:killedPlayer(RoleID, MapPid),
			hdBattleLogic:assKilledPlayer(RoleIDList, MapPid);
		_ ->
			?WARN_OUT("ac close, still killedPlayer")
	end,
	{noreply, State};

%%杀死水晶
handle_info({killedCryStal, _Pid, {RoleID, MapPid, MonsterID, Code, Camp}}, State) ->
	case hdBattleLogic:getAcSwitch() of
		true ->
			hdBattleLogic:killedCryStal(RoleID, MapPid, MonsterID, Code, Camp);
		_ ->
			?WARN_OUT("ac close, still killedCryStal")
	end,
	{noreply, State};

%%马车到达目的地
handle_info({horseToTarget, _Pid, {MapPid, X, Y, Pc, Camp}}, State) ->
	case hdBattleLogic:getAcSwitch() of
		true ->
			hdBattleLogic:horseToTarget(MapPid, X, Y, Pc, Camp);
		_ ->
			?WARN_OUT("ac close, still horseToTarget")
	end,
	{noreply, State};

%%同步马车血量
handle_info({horseHp, _Pid, {MapPid, Hp}}, State) ->
	case hdBattleLogic:getAcSwitch() of
		true ->
			hdBattleLogic:horseHp(MapPid, Hp);
		_ ->
			?WARN_OUT("ac close, still horseHp")
	end,
	{noreply, State};


%%采集宝箱
handle_info({collectBox, _Pid, {MapPid, RoleID}}, State) ->
	case hdBattleLogic:getAcSwitch() of
		true ->
			hdBattleLogic:collectBox(MapPid, RoleID);
		_ ->
			?WARN_OUT("ac close, still collectBox")
	end,
	{noreply, State};

%%获取战功列表
handle_info({getExploits, _Pid, {MapPid, NetPid}}, State) ->
	case hdBattleLogic:getAcSwitch() of
		true ->	
			hdBattleLogic:getExploits(MapPid, NetPid);
		_ ->
			?WARN_OUT("ac close, still getExploits")
	end,
	{noreply, State};

%%获取活动倒计时
handle_info({getAcCd, _Pid, {NetPid}}, State) ->
	case hdBattleLogic:getAcSwitch() of
		true ->
			hdBattleLogic:getAcCd(NetPid);
		_ ->
			?WARN_OUT("ac close, still getAcCd")
	end,
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
	Options = [{extended_info, [object_count]} , {sync, true}],
	case ets:tab2file(?Ets_Tab_Rank, ?Ets_Tab_Rank_Txt, Options) of
		ok ->
			?LOG_OUT("sycn ets Ets_Tab_Rank_Txt to file ok");
		Error1 ->
			?ERROR_OUT("sycn ets Ets_Tab_Rank_Txt to file failed,y=~p",[Error1])
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
