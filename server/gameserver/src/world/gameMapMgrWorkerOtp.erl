%%
%%%游戏地图管理进程
%%%负责游戏地图的读取，创建、删除等等功能
%%%
%%%地图管理器在服务器启动时即创建所有地图，并生成所有NPC及怪物，
%%%当该地图没有玩家时，NPC及怪物的AI及所有Timer都停止工作，
%%%直到有玩家进入该地图，则触发NPC及怪物AI及其它Timer继续工作，
%%%这样做可以极大的减小地图动态创建与删除的开销。
%%%
-module(gameMapMgrWorkerOtp).
-author(zhongyuanwei).

-behaviour(myGenServer).
%%地图线创建多少时间后禁止玩家再进入地图线
-define(ForbidEnterTime, 259200).
-include("mapPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([start_link/2]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3,handle_exception/3]).


start_link(Name,Index) ->
	RealName = erlang:atom_to_list(Name) ++ erlang:integer_to_list(Index),
	myGenServer:start_link(
		{local,list_to_atom(RealName)},
		?MODULE,
		[],
		[{timeout,?Start_Link_TimeOut_ms}]
	).

init([]) ->
	erlang:process_flag(trap_exit, true),
	erlang:process_flag(priority, high),
	?LOG_OUT("~p init OK",[?MODULE]),
	{ok,{}}.

%%请勿调用此处call代码，请直接调用mapMgrState
handle_call({getLineInfo, {MapPid}}, _From, State) ->
	RecMapInfo = mapMgrState:getMapInfo(MapPid),
	{reply, {ok, RecMapInfo}, State};

%%请勿调用此处call代码，请直接调用mapMgrState
handle_call({getLineList, {MapID}}, _Form, State) ->
	List = mapMgrState:getMapInfoByMapID(MapID),
	{reply, {ok, List}, State};

handle_call(Req, _From,State) ->
	?ERROR_OUT("[~p] unhandle call ~p", [?MODULE, Req]),
	{reply, ok, State}.

handle_cast(Msg, State) ->
	?ERROR_OUT("[~p] unhandle cast ~p", [?MODULE, Msg]),
	{noreply, State}.

handle_info({gm_setmlpm, _Pid, {MapID, MaxPlayerNumber}}, State) ->
	case MaxPlayerNumber > 0 of
		true ->
			mapMgrState:setSpecialMaxPlayerNumber(MapID, MaxPlayerNumber);
		_ ->
			mapMgrState:delSpecialMaxPlayerNumber(MapID)
	end,
	{noreply, State};

handle_info({gm_setmapday, _Pid, {MapID, Day}}, State) ->
	case mapMgrState:getMapInfoByMapID(MapID) of
		[] ->
			skip;
		[#recMapInfo{pid = Pid}|_] ->
			psMgr:sendMsg2PS(Pid, gm_setmapday, Day)
	end,
	{noreply, State};

%% 优化：发送消息给可能存在的地图进程进行刷怪，避免心跳误差产生的大概率刷新延迟现象
%% 3.向存在的第一个地图进程转发刷新消息
handle_info({wildbossFresh, _Pid, ListMapID}, State) ->
	FunSend =
		fun(MapID) ->
			case mapMgrState:getMapInfoByMapID(MapID) of
				[] ->
					skip;
				[#recMapInfo{pid = Pid} | _] ->
					psMgr:sendMsg2PS(Pid, wildbossFresh, 0)
			end
		end,
	lists:foreach(FunSend, ListMapID),
	{noreply, State};

%% 创建指定活动地图(只能创建活动地图)
handle_info({createActivityMap, PidFrom, {MapID, CreateNumber, Data}}, State) ->
	case playerScene:getMapType(MapID) of
		?MapTypeActivity ->
			L = lists:seq(1, CreateNumber),
			Fun =
				fun(_, PIDList) ->
					case createMapLine(MapID, 0) of
						MapPid when erlang:is_pid(PidFrom) ->
							[MapPid | PIDList];
						Error ->
							?ERROR_OUT("createHDBattleMap.createMapLine:mapid=~p,~p", [MapID, Error]),
							PIDList
					end
				end,
			LL = lists:foldl(Fun, [], L),
			?LOG_OUT("createHDBattleMap:mapid=~p, number=~p, from=~p, pidlist=~p", [MapID, CreateNumber, PidFrom, LL]),
			psMgr:sendMsg2PS(PidFrom, createActivityMapAck, {MapID, LL, Data}),
			ok;
		ErrorType ->
			?ERROR_OUT("createHDBattleMap:from=~p, mapid=~p,type=~p,number=~p", [PidFrom, MapID, ErrorType, CreateNumber])
	end,
	{noreply, State};

%% 玩家请求进入地图
handle_info({requestEnterMap, _Pid, #recRequsetEnterMap{} = Request}, State) ->
	onRequestEnterMap(Request),
	{noreply, State};

%% 玩家请求直接进入地图（用于处理，玩家进入副本，但是最后一次，没有次数了的情况）
handle_info({requestEnterMap_ByDirect, Pid, {#recRequsetEnterMap{} = Request, Data}}, State) ->
	Ret =
		case canEnterCopyMap(Request) of
			ok ->
				true;
			_ ->
				false
		end,
	psMgr:sendMsg2PS(Pid, requestEnterMap_ByDirectAck, {Ret, Data}),
	{noreply, State};

%% 离开地图结果
handle_info({leaveMapAck, _Pid, {_BooleanOrErrorCode, #recRequsetEnterMap{}} = Msg}, State) ->
	leaveMapAck(Msg),
	{noreply, State};

%% 玩家进入地图成功
handle_info({playerEnterMapSuccess, MapPid, {RoleID, RolePID, MapID, Num}}, State) ->
	gameMapMgrWorkerLogic:playerEnterMapSuccess(RoleID, RolePID, MapID, MapPid, Num),
	{noreply, State};

%% 玩家普通方式离开地图
handle_info({playerLeaveMapNormal, _Pid, {RoleID, MapID, MapPid, PlayerNum}}, State) ->
	gameMapMgrWorkerLogic:playerLeaveMapNormal(RoleID, MapID, MapPid, PlayerNum),
	{noreply, State};

%% 组队队长发生改变
handle_info({changeTeamLeader, _Pid, {OldLeaderID, NewLeaderID}}, State) ->
	?ERROR_OUT("No longer transfer processing team ~p ->~p", [OldLeaderID, NewLeaderID]),
	{noreply, State};

%% 重置副本
handle_info({resetCopyMap, PidFrom, {RoleID, TeamID, CopyMapID}}, State) ->
	Ret = gameMapMgrWorkerLogic:resetCopyMap(RoleID, TeamID, CopyMapID),
	psMgr:sendMsg2PS(PidFrom, resetCopyMapAck, Ret),
	{noreply, State};

%% 玩家主动离开副本
handle_info({playerLeaveCopyMap, _PidFrom, {RoleID, CopyMapID, MapPID} = Data}, State) ->
	case gameMapMgrWorkerLogic:getCopyMapInfo(MapPID) of
		#recCopyMapInfo{mapID = CopyMapID, ownerMemberIDList = OList, enteredMemberIDList = EList} = Info ->
			case lists:member(RoleID, OList) andalso lists:member(RoleID, EList) of
				false ->
					?ERROR_OUT("playerLeaveCopyMap data:~p, info:~p", [Data, Info]);
				_ ->
					skip
			end,
			NewOList = lists:delete(RoleID, OList),
			mapMgrState:setCopyMap(Info#recCopyMapInfo{ownerMemberIDList = NewOList}),
			?LOG_OUT("player leave copymap:~p oldOwnerlist:~p newlist:~p", [Data, OList, NewOList]),

			case NewOList of
				[] ->
					?LOG_OUT("the copymap no owner, resetcopymap id=~p, mappid=~p", [CopyMapID, MapPID]),
					psMgr:sendMsg2PS(MapPID, resetCopyMap, {});
				_ ->
					skip
			end,
			ok;
		Error ->
			?ERROR_OUT("playerLeaveCopyMap data:~p, error:~p", [Data, Error])
	end,
	{noreply, State};

%% 地图准备销毁，这时许出不许进了
handle_info({prepareDestory, _Pid, {MapID, MapPid}}, State) ->
	gameMapMgrWorkerLogic:prepareDestroy(MapID, MapPid),
	{noreply, State};

%% 地图销毁
handle_info({destoryMap, _Pid, {MapID, MapPid}}, State) ->
	gameMapMgrWorkerLogic:destroyMap(MapID, MapPid),
	{noreply, State};

%% 地图销毁(循环刷本，只删除工作者进程中的缓存数据)
handle_info({destoryMap_goonCopyMap, _Pid, {MapID, MapPid, RolePID, RoleID} = Data}, State) ->
	?LOG_OUT("destoryMap_goonCopyMap:~p", [Data]),
	gameMapMgrWorkerLogic:destroyMap(MapID, MapPid),
	psMgr:sendMsg2PS(MapPid, goonCopyMap, MapID),
	psMgr:sendMsg2PS(RolePID, destoryMap_goonCopyMap_Ack, {MapID, RoleID}),
	{noreply, State};

%% 创建军团副本
handle_info({leaderCreateGuildCopyMap, PidFrom, {MapID, RoleID, GuildID}}, State) ->
	MapType = playerScene:getMapType(MapID),
	MapSubType = playerScene:getMapSubType(MapID),
	case MapType =:= ?MapTypeCopyMap andalso MapSubType =:= ?MapSubTypeGuild of
		true ->

			NowTime = time:getSyncTime1970FromDBS(),
			#mapsettingCfg{all_time = AllTime} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
			MaxOverTime = NowTime + AllTime,

			Code =
				case myEts:lookUpEts(recGuildMemory, GuildID) of
					[#recGuildMemory{isOpen = IsOpen}] ->
						case IsOpen of
							true ->
								?ErrorCode_GuildCopy_Already_Active;
							_->
								?ErrorCode_GuildCopy_Open
						end;
					_ ->
						?ErrorCode_GuildCopy_Open
				end,

			case Code of
				?ErrorCode_GuildCopy_Open ->
					myEts:insertEts(recGuildMemory,
						#recGuildMemory{guildID = GuildID, guildCopyMaxOverTime = MaxOverTime, isOpen = true, ownerID = RoleID});
				_ ->
					skip
			end,

			?LOG_OUT("leaderCreateGuildCopyMap,mapid=~p, from=~p, owner=~p, guildid=~p, code=~p",
				[MapID, PidFrom, RoleID, GuildID, Code]),
			psMgr:sendMsg2PS(PidFrom, leaderCreateGuildCopyMapAck, {MapID, MaxOverTime, Code}),
			ok;
		_ ->
			skip
	end,

	{noreply, State};

handle_info({guildCopyMapOver, PidFrom, {MapID,GuildID}}, State) ->
	NowTime = time:getSyncTime1970FromDBS(),
	case myEts:lookUpEts(recGuildMemory, GuildID) of
		[#recGuildMemory{ownerID = OwnerID}] ->
			myEts:updateEts(recGuildMemory, GuildID,
				[{#recGuildMemory.guildCopyMaxOverTime, 0}, {#recGuildMemory.isOpen, false},{#recGuildMemory.ownerID, 0}]),

			?LOG_OUT("guildCopyMapOver,mapid=~p, from=~p, owner=~p, guildid=~p, time=~p",
				[MapID, PidFrom, OwnerID, GuildID, NowTime]);
		_ ->
			?ERROR_OUT("guildCopyMapOver,not in ets, mapid=~p, from=~p,guildid=~p, time=~p",
				[MapID, PidFrom, GuildID, NowTime])
	end,

	{noreply, State};

handle_info(Info,State) ->
	?ERROR_OUT("unhandle info:[~p] in [~p] [~p,~p]",[Info,node(),?MODULE,self()]),
	{noreply,State}.

terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% 请求进入地图
-spec onRequestEnterMap(#recRequsetEnterMap{}) -> ok.
onRequestEnterMap(#recRequsetEnterMap{roleID = RoleID,
	targetMapID = TargetMapID,
	oldMapID = OldMapID,
	oldMapPID = OldMapPID
} = Request) ->
	?LOG_OUT("RoleID:~p onRequestEnterMap TMap:~p SMap:~p SMapPid:~p", [RoleID,TargetMapID,OldMapID,OldMapPID]),
	case playerScene:getMapType(TargetMapID) of
		?MapTypeNormal ->
			%% 普通地图不用设置进度
			checkAndLeaveMap(Request);
		?MapTypeActivity ->
			%% 活动地图
			case TargetMapID of
				?GuildFairgroundMapID ->
					case canEnterGuildFairground(Request) of
						true ->
							checkAndLeaveMap(Request);
						_ ->
							case core:queryOnLineRoleByRoleID(Request#recRequsetEnterMap.roleID) of
								#rec_OnlinePlayer{netPid = NetPid} ->
									playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_GuildHome_PlayerMoreEnterFailed);
								_ ->
									skip
							end
					end;
				_ ->
					checkAndLeaveMap(Request)
			end;
		?MapTypeCopyMap ->
			?LOG_OUT("RoleID:~p onRequestEnterMap enter rec=~p",[RoleID, Request]),

			%% 副本地图，需要判断进度
			CanEnter =
				case canEnterCopyMap(Request) of
					waitDestory ->
						?EnterMapErrorCode_CopyMapIsForceDestroy;
					ok ->
						true;
					?EnterMapErrorCode_TargetMapNotExist ->
						%% 其它条件满足，但是副本地图不存在，需要创建
						case createSelfCopyMap(Request) of
							Pid when erlang:is_pid(Pid) ->
								MapSubType = playerScene:getMapSubType(TargetMapID),
								MaxNum = getMaxNumber(TargetMapID),
								%%如果是军团副本或者单人副本不发消息
								case MapSubType =:= ?MapSubTypeGuild orelse MaxNum =< 1 of
									true->
										skip;
									_ ->
										%% 是组队进入副本，发消息给队长，副本创建成功
										psMgr:sendMsg2PS(
											Request#recRequsetEnterMap.rolePID,
											teamCopyMapCreateSuccess,
											{TargetMapID, Pid})
								end,
								true;
							_ ->
								?EnterMapErrorCode_CopyMapCreateFailed
						end;
					Other ->
						Other
				end,

			case CanEnter of
				true ->
					[
						MapInfo = #recCopyMapInfo{enteredMemberIDList = EnterList}
					] = gameMapMgrWorkerLogic:getCopyMapInfo(
						Request#recRequsetEnterMap.roleID,
						Request#recRequsetEnterMap.teamID,
						TargetMapID
					),
					NewMapInfo = case lists:member(RoleID,EnterList) of
									 false ->
										 %% 记录新成员
										 NMapInfo = MapInfo#recCopyMapInfo{enteredMemberIDList = [RoleID | EnterList]},
										 mapMgrState:setCopyMap(NMapInfo),
										 NMapInfo;
									 _ ->
										 MapInfo
								 end,
					?LOG_OUT("onRequestEnterMap new mapID:~p MapPid:~p,teamID:~p,isWaitDestroy:~p,enteredIDList:~w",
						[
							NewMapInfo#recCopyMapInfo.mapID,
							NewMapInfo#recCopyMapInfo.mapPid,
							NewMapInfo#recCopyMapInfo.teamID,
							NewMapInfo#recCopyMapInfo.isWaitDestroy,
							NewMapInfo#recCopyMapInfo.enteredMemberIDList
						]),
					checkAndLeaveMap(Request);
				ErrorCode ->
					leaveMapAck({ErrorCode, Request})
			end;
		ErrorType ->
			?ERROR_OUT("onRequestEnterMap error MapType:~p,~p", [Request, ErrorType])
	end,
	ok.

checkAndLeaveMap(#recRequsetEnterMap{roleID = RoleID,isRequireLeaveMap = IsRequireLeaveMap,oldMapID = OldMapID,oldMapPID = OldMapPID} = Request) ->
	case IsRequireLeaveMap andalso misc:is_process_alive(OldMapPID) of
		true ->
			%% 原来存在地图
			?LOG_OUT("Role:~p Leave OldMapID:~p Pid:~p",[RoleID,OldMapID,OldMapPID]),
			psMgr:sendMsg2PS(OldMapPID, leaveMap, Request);
		_ ->
			%% 原来的地图不存在
			leaveMapAck({true, Request})
	end,
	ok.

%% 能否进入家族游乐场地图
-spec canEnterGuildFairground(#recRequsetEnterMap{}) -> boolean().
canEnterGuildFairground(#recRequsetEnterMap{targetMapID = MapID, enterGuildFairgroundID = EnterGuildID}) ->
	case ets:lookup(?EtsGuildFairground, EnterGuildID) of
		[#recGuildFairground{mapPid = MapPid}] ->
			canEnterGuildFairground(MapID, MapPid);
		_ ->
			true
	end.
-spec canEnterGuildFairground(MapID::uint(), MapPid::pid()) -> boolean().
canEnterGuildFairground(MapID, MapPid) ->
	MaxPlayerNum = getMaxNumber(MapID),
	CurPlayerNum =
		case mapMgrState:getMapInfo(MapPid) of
			#recMapInfo{willEnterRoleIDList = List, totalPlayerNum = Num} ->
				erlang:length(List) + Num;
			_ ->
				0
		end,
	CurPlayerNum < MaxPlayerNum.

%% 离开地图结果
leaveMapAck({true, #recRequsetEnterMap{targetMapID = MapID, enterGuildFairgroundID = EnterGuildID} = Request}) when EnterGuildID > 0 ->
	MapPid =
		case MapID of
			?GuildFairgroundMapID ->
				case ets:lookup(?EtsGuildFairground, EnterGuildID) of
					[#recGuildFairground{mapPid = MapPid_} = V] ->
						case misc:is_process_alive(MapPid_) of
							true ->
								MapPid_;
							_ ->
								?ERROR_OUT("guild map destory, but in memory:~p,~p", [V, Request]),
								createMapLine(MapID, EnterGuildID)
						end;
					[] ->
						createMapLine(MapID, EnterGuildID)
				end;
			_ ->
				Request#recRequsetEnterMap.targetMapPID
		end,

	case MapID =:= ?GuildFairgroundMapID andalso MapPid =/= undefined of
		true ->
			case canEnterGuildFairground(MapID, MapPid) of
				true ->
					checkAndSendLeaveMapAck(MapPid, Request);
				_ ->
					psMgr:sendMsg2PS(Request#recRequsetEnterMap.rolePID, requestEnterMapAck, {?EnterMapErrorCode_EnterGuildHomeMap, Request})
			end;
		_ ->
			checkAndSendLeaveMapAck(MapPid, Request)
	end,
	ok;
leaveMapAck({true, #recRequsetEnterMap{roleID = RoleID, targetMapID = MapID, targetLine = Line} = Request}) ->
	case playerScene:getMapType(MapID) of
		?MapTypeNormal ->
			%%指定线路
			case Line > 0 of
				true ->
					List = mapMgrState:getMapInfoByMapID(MapID),
					case lists:keyfind(Line, #recMapInfo.line, List) of
						false ->
							?ERROR_OUT("cur line has destory:~p", [Line]);
						#recMapInfo{} = Info ->
							checkAndSendLeaveMapAck(Info#recMapInfo.pid, Request)
					end;
				_ ->
					%% 进入普通地图，分配一条地图线
					MapPID = allocMapLine(MapID, RoleID, true),
					checkAndSendLeaveMapAck(MapPID, Request)
			end;
		?MapTypeActivity ->
			TargetPID = case Request#recRequsetEnterMap.targetMapPID of
							undefined ->
%% 								?ERROR_OUT("activity not found:~p", [Request]),
								allocMapLine(MapID, RoleID, false);
							PID ->
								PID
						end,
			checkAndSendLeaveMapAck(TargetPID, Request);
		?MapTypeCopyMap ->
			leaveCopyMap(Request)
	end,
	ok;
leaveMapAck({_, #recRequsetEnterMap{rolePID = PID}} = Result) ->
	%% 返回给玩家进入，能否进入地图
	psMgr:sendMsg2PS(PID, requestEnterMapAck, Result),
	ok.

leaveCopyMap(#recRequsetEnterMap{roleID = RoleID, targetMapID = MapID, teamID = TeamID} = Request) ->
	case canEnterCopyMap(Request) of
		ok ->
			%% 这里强制匹配了
			[
				#recCopyMapInfo{
					isWaitDestroy = false,
					mapPid = NewMapPid
				}
			] = gameMapMgrWorkerLogic:getCopyMapInfo(RoleID, TeamID, MapID),
			checkAndSendLeaveMapAck(NewMapPid, Request),
			ok;
		_ ->
			%% 这里不能创建新地图让他进！
			checkAndSendLeaveMapAck(undefined, Request)
	end,
	ok.

checkAndSendLeaveMapAck(MapPID, #recRequsetEnterMap{roleID = RoleID, rolePID = PID, targetMapID = MapID} = Request) ->
	%% 这里判定是否是PID，如果是PID则一定存活
	case erlang:is_pid(MapPID) of
		false ->
			?WARN_OUT("RoleID [~p],leaveMapAck create new mapPid failed:~p,~p",[RoleID,MapPID,Request]),
			psMgr:sendMsg2PS(PID, requestEnterMapAck, {?EnterMapErrorCode_CRITIAL, Request});
		_ ->
			?LOG_OUT("RoleID [~p],leaveMapAck OK,TMap:~p,~p,SMap:~p,~p",
				[RoleID,MapID,MapPID,Request#recRequsetEnterMap.oldMapID,Request#recRequsetEnterMap.oldMapPID]),
			psMgr:sendMsg2PS(PID, requestEnterMapAck, {true, Request#recRequsetEnterMap{targetMapPID = MapPID}})
	end,
	ok.

%% 查看能否进入当前指定的副本
-spec canEnterCopyMap(#recRequsetEnterMap{}) -> ok | waitDestory | ErrorCode when ErrorCode::uint().
canEnterCopyMap(#recRequsetEnterMap{teamID = 0, targetMapID = CopyMapID, isFirstEnterMap = IsFirstEnterMap} = Request) ->
	case core:isSingleCopyMap(CopyMapID) of
		true ->
			canEnterSingleCopyMap(Request);
		_ ->
			case IsFirstEnterMap of
				true ->
					?EnterMapErrorCode_FirstEnterCopyMapButNotSchedule;
				_ ->
					?EnterMapErrorCode_NoTeam
			end
	end;
canEnterCopyMap(
	#recRequsetEnterMap{
		teamID = TeamID,
		roleID = RoleID,
		targetMapID = CopyMapID,
		teamLeaderRoleID = LeaderID,
		isFirstEnterMap = IsFirstEnterMap
	} = Request) ->
	case gameMapMgrWorkerLogic:getCopyMapInfo(RoleID, TeamID, CopyMapID) of
		[#recCopyMapInfo{isWaitDestroy = true}] when IsFirstEnterMap =:= true ->
			?EnterMapErrorCode_FirstEnterCopyMapButNotSchedule;
		[#recCopyMapInfo{isWaitDestroy = true}] ->
			waitDestory;
		[#recCopyMapInfo{mapPid = MapPID, ownerMemberIDList = RoleList, enteredMemberIDList = EnterList}] ->
			case lists:member(RoleID, RoleList) of
				true ->
					%% 队伍有这个副本的进度，再判断进入人数
					AllowMaxNum = getMaxNumber(CopyMapID),
					Len = length(EnterList),
					case AllowMaxNum > Len of
						true ->
							?LOG_OUT("~p enterCopyMap teamID:~p, MapPid:~p, mapID:~p", [RoleID, TeamID, MapPID, CopyMapID]),
							ok;
						_ ->
							%% 人数已满
							?ERROR_OUT("~p enterCopyMap teamID:~p mapPid:~p,~p AllowMaxNum:~p, OwnerList:~p EnterList:~p",
								[RoleID, TeamID, CopyMapID, MapPID, AllowMaxNum, RoleList, EnterList]),

							case IsFirstEnterMap of
								true ->
									?EnterMapErrorCode_FirstEnterCopyMapButNotSchedule;
								_ ->
									?EnterMapErrorCode_CopyMapMaxNum
							end
					end;
				_ ->
					%% 玩家所在的队伍拥有这个副本，但是玩家本身不属于这个副本，不允许进入
					?EnterMapErrorCode_PlayerNoBelongCopyMap
			end;
		[] ->
			case IsFirstEnterMap of
				true ->
					?EnterMapErrorCode_FirstEnterCopyMapButNotSchedule;
				_ ->
					case RoleID =:= LeaderID of
						true ->
							?EnterMapErrorCode_TargetMapNotExist;
						_ ->
							?EnterMapErrorCode_CopyMapLeaderNotStart
					end
			end;
		Error ->
			?ERROR_OUT("canEnterCopyMap Request:~p,Error:~p", [Request, Error]),
			?EnterMapErrorCode_CRITIAL
	end.

canEnterSingleCopyMap(
	#recRequsetEnterMap{
		teamID = 0,
		roleID = RoleID,
		targetMapID = CopyMapID,
		isFirstEnterMap = IsFirstEnterMap
	} = Request) ->
	%% 单人副本，需要用角色ID+地图ID为组合Key，复用TeamID
	case gameMapMgrWorkerLogic:getCopyMapInfo(RoleID, 0, CopyMapID) of
		[#recCopyMapInfo{isWaitDestroy = true}] when IsFirstEnterMap =:= true ->
			?EnterMapErrorCode_FirstEnterCopyMapButNotSchedule;
		[#recCopyMapInfo{isWaitDestroy = true}] ->
			waitDestory;
		[#recCopyMapInfo{mapPid = MapPID, ownerMemberIDList = [RoleID]}] ->
			?LOG_OUT("~p canEnterSingleCopyMap teamID:0, MapPid:~p, mapID:~p", [RoleID, MapPID, CopyMapID]),
			ok;
		[#recCopyMapInfo{mapPid = MapPID} = Info] ->
			%% 人数已满
			?ERROR_OUT("~p canEnterSingleCopyMap teamID:0, mapPid:~p,~p recCopyMapInfo:~p",
				[RoleID, CopyMapID, MapPID, Info]),

			case IsFirstEnterMap of
				true ->
					?EnterMapErrorCode_FirstEnterCopyMapButNotSchedule;
				_ ->
					?EnterMapErrorCode_CopyMapMaxNum
			end;
		[] ->
			case IsFirstEnterMap of
				true ->
					?EnterMapErrorCode_FirstEnterCopyMapButNotSchedule;
				_ ->
					?EnterMapErrorCode_TargetMapNotExist
			end;
		Error ->
			?ERROR_OUT("canEnterSingleCopyMap Request:~p,Error:~p", [Request, Error]),
			?EnterMapErrorCode_CRITIAL
	end.

%% 创建一个副本，并记录自己的进度
-spec createSelfCopyMap(Request::#recRequsetEnterMap{}) -> pid() | error.
createSelfCopyMap(
	#recRequsetEnterMap{
		roleID = RoleID,
		targetMapID = CopyMapID,
		roleLevel = RoleLevel,
		teamID = TeamID,
		guildID = GuildID} = Request) ->
	{SingleID, RoleIDList} =
		case core:isSingleCopyMap(CopyMapID) of
			true ->
				{gameMapMgrWorkerLogic:getSingleID(RoleID, CopyMapID), [RoleID]};
			_ ->
				{TeamID, teamInterface:getTeamMemberRoleIDListWithTeamID(TeamID)}
%%				{TeamID, team2:getTeamRoleIDList(TeamID)}
		end,


	case RoleIDList of
		[] ->
			?ERROR_OUT("createSelfCopyMap no team:~p", [Request]),
			error;
		_ ->
			%% 保存副本拥有者
			MapPid = createMapLine(CopyMapID, RoleID),
			case erlang:is_pid(MapPid) of
				true ->
					psMgr:sendMsg2PS(MapPid,createRoleLevelAndGuildID,{RoleLevel, TeamID, GuildID}),%把地图创建者等级和军团ID发给地图线PID

					?LOG_OUT("RoleID:~p createSelfCopyMap:~p,~p", [RoleID,CopyMapID,MapPid]),
					#mapsettingCfg{all_time = AT} = getCfg:getCfgByArgs(cfg_mapsetting, CopyMapID),

					%% 保存地图数据
					MapInfo = #recCopyMapInfo{
						mapID = CopyMapID,
						mapPid = MapPid,
						teamID = SingleID,
						isWaitDestroy = false,
						enteredMemberIDList = [],
						ownerMemberIDList = RoleIDList,
						destroyTime = time2:getUTCDateTimeSec() + AT
					},
					mapMgrState:setCopyMap(MapInfo),
					MapPid;
				_ ->
					?ERROR_OUT("createSelfCopyMap:~p,~p,~p SingleID:~p", [RoleID, CopyMapID, RoleLevel, SingleID]),
					error
			end
	end.

%分配线路
-spec allocMapLine(MapID, RoleID,IsCheckRecycle) -> MapPid | error when
	MapID::uint(),RoleID::uint(),MapPid::pid(),IsCheckRecycle::boolean().
allocMapLine(MapID, RoleID, IsCheckRecycle) ->
	MaxPlayerNum = getMaxNumber(MapID),
	case MaxPlayerNum > 0 of
		true ->
			case mapMgrState:getMapInfoByMapID(MapID) of
				[] ->
					%%之前还没有创建线路，现在创建
					createMapLine(MapID, RoleID);
				MapInfoList ->
					%分配到人数最多的线
					Func = fun(#recMapInfo{pid = Pid,
						isWaitDestroy = IsWaitDestroy,
						totalPlayerNum = Num,
						willEnterRoleIDList = WERList,
						isReachMaxNum = IsReachMaxNum,
						createTime = CreateTime
					},{MapPid,N} = AccIn) ->
						Now = time:getUTCNowSec(),
						%%这里检查是否达到过最大人数上限，以及是否是3天内创建的60 * 60 * 24 * 3 = 259200线路
						case IsWaitDestroy =:= false andalso (not IsCheckRecycle orelse (IsCheckRecycle andalso IsReachMaxNum =:= false andalso Now - CreateTime < ?ForbidEnterTime))  of
							true ->
								?DEBUG_OUT("Pid[~p]IsCheckRecycle[~p]IsReachMaxNum[~p]Now - CreateTime[~p]",[Pid,IsCheckRecycle,IsReachMaxNum,Now - CreateTime]),
								WEPN = erlang:length(WERList),
								%%Num为当前地图人数，N为之前查找到的地图的最大人数
								case Num > N of
									true ->
										%%如果当前地图人数比之前的查找到的最大人数还多
										%则检查是否达到上限，达到上限则忽略
										case Num + WEPN >= MaxPlayerNum of
											true ->
												AccIn;
											false ->
												{Pid,Num}
										end;
									false ->
										%%如果没有达到则记录下Pid与人数
										case MapPid of
											0 ->
												{Pid,Num};
											_ ->
												AccIn
										end
								end;
							_ ->
								%%地图将要销毁或者不允许再进入
								AccIn
						end
						   end,
					{MapPid, _} = lists:foldl(Func, {0, 0}, MapInfoList),
					case lists:keyfind(MapPid, #recMapInfo.pid, MapInfoList) of
						#recMapInfo{willEnterRoleIDList = WillEnterList, totalPlayerNum = TotalPlayerNum} = MapInfo ->
							WEList = case lists:member(RoleID, WillEnterList) of
										 true ->
											 WillEnterList;
										 _ ->
											 [RoleID | WillEnterList]
									 end,
							%%如果人数达到最大人数限制，则设置标志，此地图线不再让玩家进入，让此地图线的玩家慢慢离开了就销毁，以回收资源
							NewMapInfo = case IsCheckRecycle andalso erlang:length(WEList) + TotalPlayerNum >= MaxPlayerNum of
											 true ->
												 ?DEBUG_OUT("MapPid[~p]IsCheckRecycle[~p]Length[~p]TotalPlayerNum[~p]", [MapPid, IsCheckRecycle, erlang:length(WEList), TotalPlayerNum]),
												 MapInfo#recMapInfo{
													 willEnterRoleIDList = WEList,
													 isReachMaxNum = true
												 };
											 _ ->
												 MapInfo#recMapInfo{
													 willEnterRoleIDList = WEList
												 }
										 end,
							mapMgrState:setMapInfo(MapPid, NewMapInfo);
						_ ->
							skip
					end,
					case misc:is_process_alive(MapPid) of
						false ->
							mapMgrState:deleteMapInfo(MapPid),
							%%如果分配线路失败（可能所有线路都已经达到最大数），则创建一新线
							createMapLine(MapID, RoleID);
						_ ->
							MapPid
					end
			end;
		_ ->
			%%没有相应的地图配置
			error
	end.

%创建地图新线，不管该地图上的线是否承载已经满
-spec createMapLine(MapID, RoleID) -> MapPid when
	MapID::uint(),RoleID::uint(),MapPid::pid() | error.
createMapLine(MapID, RoleID) when erlang:is_integer(MapID) ->
	MapCfg = core:getMapCfg(MapID),
	MaxLine = mapMgrState:getMapMaxLine(MapID),
	Line = MaxLine + 1,
	Args = #recCreateMapArg{
		mapId = MapID,
		mapLine = Line,
		createRoleID = RoleID,
		mapCfg = MapCfg
	},

	Ret = gameMapSup:start_child(Args),
	case Ret of
		{ok,Pid0} ->
			?LOG_OUT("~p CreateMap[~p] Pid:~p",[self(),MapID,Pid0]),
			MapInfo = #recMapInfo{
				id = MapID,
				pid = Pid0,
				line = Line,
				totalPlayerNum = 0,
				isReachMaxNum = false,
				createTime = time:getUTCNowSec()
			},
			mapMgrState:setMapMaxLine(MapID,Line),
			mapMgrState:setMapInfo(Pid0, MapInfo),
			Name = erlang:list_to_atom(lists:concat(["mapOtp",integer_to_list(MapID),"_",integer_to_list(Line)])),
			try
				ets:insert(?MapInfoEts,#recMapPidInfo{pid = Pid0,mapID = MapID}),
				psMgr:sendMsg2PS(?PsNameOperateActivity,createNewMap,{MapID,Pid0}),
				erlang:register(Name,Pid0)
			catch
				_:_ ->
					?ERROR_OUT("MapPid:~p register Name:~p failed",[Pid0,Name])
			end,
			Pid0;
		_ ->
			?ERROR_OUT("Create Map[~p] Line:~p Failed,Ret:~p",[MapID,Line,Ret]),
			error
	end.

getMaxNumber(MapID) ->
	case mapMgrState:getSpecialMaxPlayerNumber(MapID) of
		undefined ->
			case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
				#mapsettingCfg{maxnum = MaxNum} ->
					MaxNum;
				_ ->
					0
			end;
		Num ->
			Num
	end.