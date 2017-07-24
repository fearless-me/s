%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%% 副本或者位面进程初始化
%%% @end
%%% Created : 04. 九月 2014 10:53
%%%-------------------------------------------------------------------
-module(copyMapScheduleInit).
-author("tiancheng").

-include("copyMapScheduleDefine.hrl").
-include("cfg_show2.hrl").

%% API
-export([
	setCopyMapMaxSchedule/1,
	initCopyMapSchedule/2,
	initCopyMapSchedule/1,
	show2/1,
	initParallelScheduleConf/1,
	initParallelScheduleConf/3,
	getOpenBlockList/1,
	getMapObjDataList/3
]).

-export([
	addCollectToMap/3,
	addMonsterToMap/3,
	addNpcToMap/3,
	addMonsterToMap_EscortPower/1,
	addMonsterToMap_EscortGharry/1
]).

-export([
	tryDoEvent/5,
	findShow2ByGroupID/1
]).

%% 设置副本最大进度为，当前配置的最大进度
-spec setCopyMapMaxSchedule(GroupID::uint()) -> ok.
setCopyMapMaxSchedule(GroupID) ->
	MapID = gameMapLogic:getMapID(GroupID),
	Max = case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
			  #mapsettingCfg{scheduleConf = Conf} when ?IsListValid(Conf) ->
				  length(Conf);
			  _ ->
				  1
		  end,
	copyMapScheduleState:setMapScheduleMax(GroupID, Max),
	ok.

%% 进度初始化
-spec initCopyMapSchedule(GroupID::uint(), Schedule) -> ok when Schedule::uint().
initCopyMapSchedule(GroupID, Schedule) ->
	MapID = gameMapLogic:getMapID(GroupID),
	case copyMapScheduleComplete:getCopyMapScheduleConf(MapID, Schedule) of
		{InitConf, _SettleConf} when InitConf > 0 ->

			Args = #copyMapScheduleInit{
				groupID = GroupID,
				scheduleID = Schedule,
				configID = InitConf
			},

			%% 清空上个进度死忘的友方怪物列表
			copyMapScheduleState:setScheduleFriendMonsterIDList(GroupID, []),
			%% 清空上个进度杀怪列表
			copyMapScheduleState:setKilledMonsterList(GroupID, []),
			%% 清空上个进度的采集列表
			copyMapScheduleState:setCollectItemList(GroupID, []),

			case getCfg:getCfgPStack(cfg_copymapScheduleInit, InitConf) of
				#copymapScheduleInitCfg{play_show2 = Show2ID, cd_show2 = CD} ->
					case findShow2ByGroupID(Show2ID) of
						true ->
							?DEBUG_OUT("[DebugForShow2] initCopyMapSchedule/2 GroupID:~w InitConf:~w Show2ID:~w CD:~w", [GroupID, InitConf, Show2ID, CD]),
							TimerRef = erlang:send_after(CD * 1000, self(), {show2, self(), {GroupID, InitConf, Show2ID, true}}),
							mapState:setShow2Data(GroupID, {TimerRef, Args#copyMapScheduleInit{show2ID = Show2ID}});
						_ ->
							initCopyMapSchedule(Args)
					end;
				_ ->
					?ERROR_OUT("initCopyMapSchedule cannot find cfg[~p]",[InitConf]),
					false
			end;
		_ ->
			skip
	end,
	ok.

%% 进度初始化
-spec initCopyMapSchedule(#copyMapScheduleInit{}) -> ok.
initCopyMapSchedule(#copyMapScheduleInit{groupID = GroupID, scheduleID = ScheduleID, configID = ConfigID}) ->
	?DEBUG_OUT("[DebugForShow2] initCopyMapSchedule/1 hit GroupID:~w ConfigID:~w ScheduleID:~w", [GroupID, ConfigID, ScheduleID]),
	#copymapScheduleInitCfg{
		addcollect = AddCollect,
		openthedoor1 = OpenBlock1,
		openthedoor2 = OpenBlock2,
		openthedoor3 = OpenBlock3,
		openthedoor4 = OpenBlock4,
		progress = ScheduleNotice,
		radius = Radius,
		camera_boss = CameraBoss,
		addmonster = AddMonster,
		condition = Condition,
		event = Event,
		animation = AN,
		characters = Characters
	} = Conf = getCfg:getCfgPStack(cfg_copymapScheduleInit, ConfigID),
	MapID = gameMapLogic:getMapID(GroupID),

	%?LOG_OUT(
	%	"initCopyMapSchedule: ~p, ~p, ~p, ~p",
	%	[
	%		MapID,
	%		self(),
	%		ScheduleID,
	%		copyMapScheduleState:getMapScheduleMax(GroupID)
	%	]
	%),

	%% LUNA-897
	%% LUNA-1699
	%% 尝试触发事件
	?DEBUG_OUT("[DebugForCopyMap] initCopyMapSchedule GroupID:~p ConfigID:~p", [GroupID, ConfigID]),
	copyMapScheduleInit:tryDoEvent(Condition, Event, {true, ConfigID}, mapState:getMapPlayerEts(), GroupID),

	%% 刷怪
	addMonsterToMap(GroupID, Conf),

	%% 刷采集物
	%?DEBUG_OUT("[DebugForCopyMapC] init false for collect begin ..."),
	case ScheduleID > 1 of
		true ->
			{LastConfigID, _} = copyMapScheduleComplete:getCopyMapScheduleConf(MapID, ScheduleID - 1),
			%?DEBUG_OUT(
			%	"[DebugForCopyMapC] init false MapPID:~w ScheduleID:~w ConfigID:~w LastScheduleID:~w LastConfigID:~w",
			%	[self(), ScheduleID, ConfigID, ScheduleID - 1, LastConfigID]
			%),
			clearOldCollect(GroupID, LastConfigID, false);
		_ ->
			%?DEBUG_OUT(
			%	"[DebugForCopyMapC] init false MapID:~w ScheduleID:~w ConfigID:~w LastScheduleID:~w LastConfigID:~w",
			%	[MapID, ScheduleID, ConfigID, 0, 0]
			%),
			skip
	end,
	ListCollectCode = addCollectToMap(GroupID, AddCollect, Radius),
	%?DEBUG_OUT("[DebugForCopyMapC] init false addCollect:~w", [ListCollectCode]),
	copyMapScheduleState:setMapScheduleCollectCode(GroupID, ConfigID, false, ListCollectCode),
	%?DEBUG_OUT("[DebugForCopyMapC] init false for collect end ..."),

	%% 阻档npc打开
	openNpcBlock(GroupID, [OpenBlock1, OpenBlock2, OpenBlock3, OpenBlock4]),

	%% 播放动画
	startPlayAnimation(GroupID, mapState:getMapPlayerEts(), AN, ScheduleID),

	%% 播放字幕
	startPlayCharacter(GroupID, mapState:getMapPlayerEts(), Characters, ScheduleID),

	%% 进度完成提示
	case ScheduleNotice of
		[Plan, MaxPlan] ->
			Msg = playerMsg:getErrorCodeMsg(?ErrorCode_CopyMapScheduleComplete, [MaxPlan, Plan]),
			List = mapView:getGroupObject(mapState:getMapPlayerEts(), GroupID),
			[mapView:sendNetMsgToNetPid(NetPid, Msg) || #recMapObject{netPid = NetPid} <- List];
		_ ->
			skip
	end,

	%% 特殊关卡
	case CameraBoss of
		1 ->
			MonsterCode = case AddMonster of
							  [ {O, _, _, _} | _] ->
								  case gameMapLogic:getMonsterCodeByID(O) of
									  [BossCode | _] -> BossCode;
									  _ -> 0
								  end;
							  _ ->
								  0
						  end,
			sendNetMsgToMapPlayer(mapState:getMapPlayerEts(), GroupID,
				#pk_GS2U_CopySpecialSchedule{
					mapID = MapID,
					schedule = ConfigID,	%% 这里以前就填的是配置ID而不是进度ID
					code = MonsterCode
				});
		_ ->
			skip
	end,
	ok.

%% 处理show2完成事件
-spec show2({GroupID::uint(), ConfigID::uint(), Show2ID::uint(), true}) -> ok.
show2({GroupID, ConfigID, Show2ID, true}) ->
	case mapState:getShow2Data(GroupID) of
		{TimerRef, #copyMapScheduleInit{groupID = GroupID, configID = ConfigID, show2ID = Show2ID} = Rec} ->
			?DEBUG_OUT("[DebugForShow2] show2/1 true hit GroupID:~w ConfigID:~w Show2ID:~w", [GroupID, ConfigID, Show2ID]),

			%% 清除暂存数据
			case erlang:is_reference(TimerRef) of
				true ->
					erlang:cancel_timer(TimerRef);
				_ ->
					skip
			end,
			mapState:delShow2Data(GroupID),

			%% 通知客户端完成show2
			MapID = gameMapLogic:getMapID(GroupID),
			Msg = #pk_U2GS2U_CopyMapScheduleShow2{
				mapID = MapID,
				show2ID = Show2ID,
				groupID = GroupID,
				scheduleID = ConfigID,
				isInit = true
			},
			List = mapView:getGroupObject(mapState:getMapPlayerEts(), GroupID),
			[mapView:sendNetMsgToNetPid(NetPid, Msg) || #recMapObject{netPid = NetPid} <- List],

			%% 正式初始化进度
			initCopyMapSchedule(Rec);
		_ ->
			?DEBUG_OUT("[DebugForShow2] show2/1 true skip GroupID:~w ConfigID:~w Show2ID:~w", [GroupID, ConfigID, Show2ID]),
			skip
	end,
	ok.

%% 初始化并行进度
-spec initParallelScheduleConf(GroupID::uint()) -> ok.
initParallelScheduleConf(GroupID) ->
	MapID = gameMapLogic:getMapID(GroupID),
	PCList = case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
				 #mapsettingCfg{parallelScheduleConf = PConf} when ?IsListValid(PConf) ->
					 Fun =
						 fun({CompleteCondition, CompleteDo}, AccList) ->
							 case getCfg:getCfgPStack(cfg_copymapScheduleSettle, CompleteCondition) of
								 #copymapScheduleSettleCfg{killmonster = K, collect = C, countdown = _CD, task = _T} ->
									 KList = analysisList(K),    %% 取当前杀的怪物个数
									 CList = analysisList(C),    %% 取当前采集的物品个数
									 case KList =/= [] orelse CList =/= [] of
										 true ->
											 [#recPSConf{myConfigID = CompleteCondition, completeDo = CompleteDo, killMonster = KList, collectItem = CList} | AccList];
										 _ ->
											 AccList
									 end;
								 _ ->
									 AccList
							 end
						 end,
					 lists:foldl(Fun, [], PConf);
				 _ ->
					 []
			 end,
	copyMapScheduleState:setParallelScheduleConfList(GroupID, PCList),
	ok.

%% 完成了一个并行子进度，做一个初始化
%% 不支持show2及类似需要等待的事件
-spec initParallelScheduleConf(GroupID::uint(), CompleteID::uint(), InitID::uint()) -> ok.
initParallelScheduleConf(GroupID, CompleteID, InitID) when erlang:is_integer(InitID) andalso InitID > 0 ->
	case getCfg:getCfgPStack(cfg_copymapScheduleInit, InitID) of
		#copymapScheduleInitCfg{addcollect = AddCollect,
			openthedoor1 = OpenBlock1, openthedoor2 = OpenBlock2, openthedoor3 = OpenBlock3, openthedoor4 = OpenBlock4,
			radius = Radius, condition = Condition, event = Event} = Conf ->
			?DEBUG_OUT("initParallelScheduleConf: ~p, ~p, ~p", [gameMapLogic:getMapID(GroupID), self(), InitID]),

			%% LUNA-897
			%% LUNA-1699
			%% 尝试触发事件
			?DEBUG_OUT("[DebugForCopyMap] initParallelScheduleConf GroupID:~p InitID:~p", [GroupID, InitID]),
			copyMapScheduleInit:tryDoEvent(Condition, Event, {true, InitID}, mapState:getMapPlayerEts(), GroupID),

			%% 刷怪
			addMonsterToMap(GroupID, Conf),

			%% 刷采集物
			%?DEBUG_OUT("[DebugForCopyMapC] init true for collect begin ..."),
			%?DEBUG_OUT(
			%	"[DebugForCopyMapC] init true MapPID:~w ScheduleID:~w ConfigID:~w LastScheduleID:~w LastConfigID:~w",
			%	[self(), unknown, InitID, unknown, CompleteID]
			%),
			clearOldCollect(GroupID, CompleteID, true),
			ListCollectCode = addCollectToMap(GroupID, AddCollect, Radius),
			%?DEBUG_OUT("[DebugForCopyMapC] init true addCollect:~w", [ListCollectCode]),
			copyMapScheduleState:setMapScheduleCollectCode(GroupID, InitID, true, ListCollectCode),
			%?DEBUG_OUT("[DebugForCopyMapC] init true for collect end ..."),

			%% 阻档npc打开
			openNpcBlock(GroupID, [OpenBlock1, OpenBlock2, OpenBlock3, OpenBlock4]),

			%% 保存并行进度
			copyMapScheduleState:setMapParallelSchedule(GroupID, InitID),
			ok;
		_ ->
			false
	end,
	ok;
initParallelScheduleConf(GroupID, CompleteID, _InitID) ->
	%?DEBUG_OUT("[DebugForCopyMapC] init true for collect begin ..."),
	%?DEBUG_OUT(
	%	"[DebugForCopyMapC] init true MapPID:~w ScheduleID:~w ConfigID:~w LastScheduleID:~w LastConfigID:~w",
	%	[self(), unknown, _InitID, unknown, CompleteID]
	%),
	clearOldCollect(GroupID, CompleteID, true),
	%?DEBUG_OUT("[DebugForCopyMapC] init true for collect end ..."),
	ok.

%% 解析并行进度配置list
-spec analysisList(InList::list() | term()) -> list().
analysisList(InList) when ?IsListValid(InList) ->
	Fun =
		fun({TargetID, NeedNumber}, List) ->
			[#recKCcalc{id = TargetID, needNumber = NeedNumber, curNumber = 0} | List]
		end,
	lists:foldl(Fun, [], InList);
analysisList(_) ->
	[].

%% 往地图中刷怪
-spec addMonsterToMap(GroupID::uint(), #copymapScheduleInitCfg{}) -> ok.
addMonsterToMap(GroupID, #copymapScheduleInitCfg{} = Conf) ->
	#copymapScheduleInitCfg{
		addmonster = AddMonster,
		radius = Radius,
		monster = RandMonster,
		elite = RandElite,
		elitenum = RandEliteNum,
		boss = Boss,
		coordinate = PosList
	} = Conf,
	%%?LOG_OUT("addMonsterToMap:~p", [Conf]),

	%% 正常刷怪
	addMonsterToMap(GroupID, AddMonster, Radius),

	%% 往地图中随机刷普通怪
	addRandMonsterToMap(GroupID, RandMonster, PosList, Radius),

	%% 往地图中随机刷精英怪
	addRandEliteToMap(GroupID, RandElite, RandEliteNum, PosList, Radius),

	%% 往地图中刷boss
	addBossToMap(GroupID, Boss, Radius),
	ok.

addMonsterToMap_EscortPower({GroupID, Radius, AddList, {_RoleID, Level}}) ->
	List = getMapObjDataList(GroupID, AddList, Radius),
	CallBack = copyMapDemonBattle:createPropCallback_EscortPower(Level),
	mapBase:spawnAllMonster(List,CallBack,Level),
	ok.

addMonsterToMap_EscortGharry({GroupID, Radius, AddList, {_RoleID, _Level, HDRatio, MonsterLevel}}) ->
	List = getMapObjDataList(GroupID, AddList, Radius),
	CallBack = copyMapDemonBattle:createPropCallback_EscortGharry(HDRatio),
	mapBase:spawnAllMonster(List,CallBack,MonsterLevel),
	ok.

%% 往地图中指定刷怪
-spec addMonsterToMap(GroupID, AddList, Radius::uint() | float()) -> ok when
	GroupID::uint(), AddList::list().
addMonsterToMap(GroupID, AddList, Radius) when ?IsListValid(AddList) ->
	List = getMapObjDataList(GroupID, AddList, Radius),

	%% fixme %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%% 提前展示变身的特殊处理
	bitplaneMapPlayerAni(GroupID, List),
	%% fixme %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	MapID = mapState:getMapId(GroupID),
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{matching = 1} ->
			MapLevel = mapState:getMapLevel(GroupID),
			CallBack = copyMapDemonBattle:createPropCallback_Rift(MapLevel),

			%%?DEBUG_OUT("addMonsterToMap matching:~p,~p,~p,~p", [self(),GroupID,MapLevel,List]),
			mapBase:spawnAllMonster(List,CallBack,MapLevel);
		_ ->
			case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
				#mapsettingCfg{difficulty = Difficulty} when erlang:is_integer(Difficulty) andalso Difficulty > 0 ->
					%% 这是副本配置得有难度
					%%?DEBUG_OUT("addMonsterToMap difficulty:~p,~p,~p", [self(),GroupID,List]),
					CallBack2 = copyMapDemonBattle:createPropCallback_CopyMap(Difficulty),
					mapBase:spawnAllMonster(List, CallBack2, 0);
				_ ->
					%% 没有配置，直接刷怪
					%%?DEBUG_OUT("addMonsterToMap:~p,~p,~p", [self(),GroupID,List]),
					mapBase:spawnAllMonster(List)
			end
	end,
	ok;
addMonsterToMap(_,_,_) ->
	ok.

%% 往地图中随机刷普通怪
addRandMonsterToMap(GroupID, RandMonster, PosList, Radius) when ?IsListValid(RandMonster) andalso ?IsListValid(PosList) ->
	Len = length(RandMonster),
	Fun = fun([TX, TY]) ->
		Index = misc:rand(1, Len),
		MonsterList = lists:nth(Index, RandMonster),
		AddList = [{ID, 1, TX, TY} || ID <- MonsterList],
		addMonsterToMap(GroupID, AddList, Radius)
		  end,
	lists:foreach(Fun, PosList),
	ok;
addRandMonsterToMap(_,_,_,_) ->
	ok.

%% 往地图中随机刷精英怪
addRandEliteToMap(GroupID, RandElite, RandEliteNum, PosList, Radius) when ?IsListValid(RandElite) andalso ?IsListValid(PosList) ->
	LLLL = lists:seq(1, RandEliteNum),
	Len = length(RandElite),
	FunTupleList = fun(_, List) ->
		Index = misc:rand(1, Len),
		Elite = lists:nth(Index, RandElite),
		[Elite | List]
				   end,
	TupleList = lists:foldl(FunTupleList, [], LLLL),

	Fun = fun(EliteList, SurplusPoss) ->
		Poss = case SurplusPoss of
				   [] ->
					   PosList;
				   _ ->
					   SurplusPoss
			   end,
		PosLen = length(Poss),
		PosIndex = misc:rand(1, PosLen),
		Pos = [TX, TY] = lists:nth(PosIndex, Poss),
		AddList = [[ID, 1, TX, TY] || ID <- EliteList],
		addMonsterToMap(GroupID, AddList, Radius),
		lists:delete(Pos, Poss)
		  end,
	lists:foldl(Fun, PosList, TupleList),
	ok;
addRandEliteToMap(_,_,_,_,_) ->
	ok.

%% 往地图中刷boss
addBossToMap(GroupID, Boss, Radius) ->
	addMonsterToMap(GroupID, Boss, Radius),
	ok.

%% 往地图中刷采集物
-spec addCollectToMap(GroupID::uint(), AddList::list(), Radius::uint() | float()) -> [{Code::uint(),ID::uint16(),X::number(),Y::number()},...] | [].
addCollectToMap(GroupID, AddList, Radius) when ?IsListValid(AddList) ->
	List = getMapObjDataList(GroupID, AddList, Radius),
	%%?DEBUG_OUT("addCollectToMap:~p,~p,~p", [GroupID, AddList,List]),
	mapBase:spawnAllCollect(List);
addCollectToMap(_,_,_) ->
	[].

%% 往地图中刷采NPC
-spec addNpcToMap(GroupID::uint(), AddList::list(), Radius::uint() | float()) -> ok.
addNpcToMap(GroupID, AddList, Radius) when ?IsListValid(AddList) ->
	List = getMapObjDataList(GroupID, AddList, Radius),
	%%?DEBUG_OUT("addCollectToMap:~p,~p,~p", [GroupID, AddList,List]),
	mapBase:spawnAllNpc(List),
	ok;
addNpcToMap(_,_,_) ->
	ok.

%% 打开npc阻挡
-spec openNpcBlock(GroupID::uint(), BlockList::list()) -> ok.
openNpcBlock(GroupID, [BlockID | List] = BlockList) when ?IsListValid(BlockList) ->
	%% 打开这个阻挡npc
	setBlockNpcStatus(GroupID, BlockID, ?BlockNpc_Open),

	%% 继续
	openNpcBlock(GroupID, List);
openNpcBlock(_,_) ->
	ok.

%% 设置阻挡NPC的状态
-spec setBlockNpcStatus(GroupID::uint(), BlockStringID::string() | uint(), Status::?BlockNpc_Close | ?BlockNpc_Open) -> boolean().
setBlockNpcStatus(_GroupID, BlockStringID, _Status) when erlang:is_integer(BlockStringID) ->
	false;
setBlockNpcStatus(_GroupID, "", _Status) ->
	false;
setBlockNpcStatus(_GroupID, "0", _Status) ->
	false;
setBlockNpcStatus(_GroupID, undefined, _Status) ->
	false;
setBlockNpcStatus(GroupID, BlockStringID, Status) when erlang:is_list(BlockStringID) ->
	List = copyMapScheduleState:getOpenBlockList(GroupID),
	NList = case Status of
				?BlockNpc_Open ->
					case lists:member(BlockStringID, List) of
						true ->
							false;
						_ ->
							%% 添加
							[BlockStringID | List]
					end;
				?BlockNpc_Close ->
					case lists:member(BlockStringID, List) of
						true ->
							%% 移除
							[Str || Str <- List, BlockStringID =/= Str];
						_ ->
							false
					end
			end,
	case NList =/= false of
		true ->
			%% 通知客户端
			sendBlockStatusChangeToPlayer(GroupID, BlockStringID, Status),

			copyMapScheduleState:setOpenBlockList(GroupID, NList),
			true;
		_ ->
			false
	end.

%% 获得已经通过进度的阻档名
-spec getOpenBlockList(PassedSchedule::[{_,_},...]) -> list().
getOpenBlockList(PassedSchedule) ->
	?DEBUG_OUT("getOpenBlockList:~p,~p", [mapState:getMapOwnerID(0), PassedSchedule]),
	Fun =
		fun({InitConf, _}, AccList) ->
			case InitConf > 0 of
				true ->
					case getCfg:getCfgPStack(cfg_copymapScheduleInit, InitConf) of
						#copymapScheduleInitCfg{openthedoor1 = OpenBlock1, openthedoor2 = OpenBlock2,
							openthedoor3 = OpenBlock3, openthedoor4 = OpenBlock4} ->
							%% 阻档npc打开
							L = [OpenBlock1, OpenBlock2, OpenBlock3, OpenBlock4],
							LL = [AA || AA <- L, AA /= "", AA /= "0", AA /= undefined, not erlang:is_integer(AA)],
							LL ++ AccList;
						_ ->
							AccList
					end;
				_ ->
					AccList
			end
		end,
	lists:foldl(Fun, [], PassedSchedule).

%% 发送阻挡的改变状态给客户端
-spec sendBlockStatusChangeToPlayer(GroupID::uint(), BlockStringID::string(), Status::?BlockNpc_Close | ?BlockNpc_Open) -> ok.
sendBlockStatusChangeToPlayer(GroupID, BlockStringID, Status) ->
	Ets = mapState:getMapPlayerEts(),
	Fun =
		fun(#recMapObject{pid = PID, mapPid = MPid, groupID = GID}, _) ->
			case MPid =:= self() andalso misc:is_process_alive(PID) andalso GID =:= GroupID of
				true ->
					R = #pk_BlockStatusChange{
						blockName = BlockStringID,
						blockStatus = Status
					},
					psMgr:sendMsg2PS(PID, broadcast, #pk_GS2U_BlockStatusChange{changes = [R]});
				_ ->
					skip
			end,
			ok
		end,
	ets:foldl(Fun, 0, Ets),
	ok.

%% 根据添加列表，或者能识别的mapobj对象
-spec getMapObjDataList(GroupID::uint(), AddList::list(), Radius::uint() | float()) -> list().
getMapObjDataList(GroupID, AddList, Radius) when ?IsListValid(AddList) ->
	R = erlang:float(Radius),

	MapID = mapState:getMapId(),
	MapCfg = #recGameMapCfg{} = core:getMapCfg(MapID),
%%	Ret = mapView:isBlock(erlang:float(X), erlang:float(Y), ColCellNum, RowCellNum, CellSize, BlockBinary),

	Fun =
		fun(Need, ObjList) ->
			{ObjID, Number, XX, YY, IsRand} =
				case Need of
					{O, N, X, Y} ->
						{O, N, erlang:float(X), erlang:float(Y), false};
					[O, N, X, Y] ->
						{O, N, erlang:float(X), erlang:float(Y), false};
					{O, N} ->
						{LX, LY} = getMapOwnerPos(GroupID),
						{O, N, LX, LY, true};
					[O, N] ->
						{LX, LY} = getMapOwnerPos(GroupID),
						{O, N, LX, LY, true}
				end,
			if
				Number > 1 ->
					%% 在X,Y附近两米的范围随机刷
					L = lists:seq(1, Number),
					FunAddObj =
						fun(_, List) ->
							{NX, NY} = case IsRand of
										   true ->
											   getAddMonsterPos(MapCfg, XX, YY, R);
										   _ ->
											   {XX, YY}
									   end,
							[#recMapObjData{id = ObjID, mapX = NX, mapY = NY, groupID = GroupID} | List]
						end,
					lists:foldl(FunAddObj, ObjList, L);
				Number =:= 1 ->
					{NX, NY} = case IsRand of
								   true ->
									   getAddMonsterPos(MapCfg, XX, YY, R);
								   _ ->
									   {XX, YY}
							   end,
					[#recMapObjData{id = ObjID, mapX = NX, mapY = NY, groupID = GroupID} | ObjList];
				true ->
					ObjList
			end
		end,
	lists:foldl(Fun, [], AddList);
getMapObjDataList(_,_,_) ->
	[].

%% 获取副本或者位面拥有者的当前坐标
-spec getMapOwnerPos(GroupID::uint()) -> {X::float(), Y::float()}.
getMapOwnerPos(GroupID) ->
	PlayerEts = mapState:getMapPlayerEts(),
	case mapView:getGroupObject(PlayerEts, GroupID) of
		[#recMapObject{teamID = TeamID, x = X, y = Y}|_] = PlayerList ->
			case TeamID /= undefined andalso TeamID > 0 of
				true ->
					LeaderID = teamInterface:getLeaderIDWithTeamID(TeamID),%%team2:getTeamLeaderID(TeamID),
					case lists:keyfind(LeaderID, #recMapObject.id, PlayerList) of
						#recMapObject{x = LX, y = LY} ->
							{LX, LY};
						_ ->
							{X, Y}
					end;
				false ->
					{X, Y}
			end;
		_ ->
			?ERROR_OUT("getMapOwnerPos:~p,~p,~p,~p", [mapState:getMapId(),self(),GroupID,PlayerEts]),
			{0.0, 0.0}
	end.

%% 获取随机坐标并判断阻挡，如果是阻挡，则刷新到目标点，默认随机三次
-spec getAddMonsterPos(#recGameMapCfg{}, X::float(), Y::float(), Radius::float()) -> {NX::float(),NY::float()}.
getAddMonsterPos(#recGameMapCfg{} = MapCfg, X, Y, Radius) ->
	getAddMonsterPos(MapCfg, X, Y, Radius, 3).

%% 获取随机坐标并判断阻挡，如果是阻挡，则刷新到目标点
-spec getAddMonsterPos(#recGameMapCfg{}, X::float(), Y::float(), Radius::float(), Circulation::uint32()) -> {NX::float(),NY::float()}.
getAddMonsterPos(#recGameMapCfg{}, X, Y, _Radius, 0) ->
	%% 没有循环次数
	{X, Y};
getAddMonsterPos(#recGameMapCfg{}, X, Y, Radius, _Circulation) when Radius =< 0 ->
	%% 没有随机半径
	{X, Y};
getAddMonsterPos(
	#recGameMapCfg{
		colCellNum = ColCellNum,
		rowCellNum = RowCellNum,
		cellSize = CellSize,
		block = BlockBinary} = MapCfg, X, Y, Radius, Circulation) ->
	%% 有循环次数，也有随机半径
	{NX, NY} = getAddMonsterPos(X, Y, Radius),
	case mapView:isBlock(erlang:float(NX), erlang:float(NY), ColCellNum, RowCellNum, CellSize, BlockBinary) of
		false ->
			%% 坐标可以使用
			{NX, NY};
		_ ->
			%% 是阻挡，重新随机一次
			getAddMonsterPos(MapCfg, X, Y, Radius, Circulation - 1)
	end.

%% 获取随机坐标
-spec getAddMonsterPos(X, Y, Radius) -> {NX,NY} when
	X::float(),Y::float(),NX::float(),NY::float(),Radius::float().
getAddMonsterPos(X, Y, Radius) when erlang:is_float(X) andalso erlang:is_float(Y) ->
	case Radius > 0 of
		true ->
			XMin = X - Radius,
			XMax = X + Radius,
			YMin = Y - Radius,
			YMax = Y + Radius,
			NX = misc:rand(XMin, XMax),
			NY = misc:rand(YMin, YMax),
			{NX, NY};
		_ ->
			{X, Y}
	end.

bitplaneMapPlayerAni(GroupID, List) ->
	%% 提前展示变身的特殊处理
	BitMapID = mapState:getMapId(GroupID),
	case BitMapID =:= 1001 orelse BitMapID =:= 1116 of
		true ->
			%% 指定位面，查找是否刷指定怪
			case lists:keyfind(663, #recMapObjData.id, List) of
				#recMapObjData{} ->
					%% 通知这个地图，这个分组里的所有玩家，这个特殊展示已经触发
					MapPid = self(),
					Ets = mapState:getMapPlayerEts(),
					MatchSpec = ets:fun2ms(
						fun(Object) when
							Object#recMapObject.mapPid =:= MapPid andalso Object#recMapObject.groupID =:= GroupID ->
							Object#recMapObject.pid
						end
					),

					L = myEts:selectEts(Ets, MatchSpec),
					Fun =
						fun(PID) ->
							case misc:is_process_alive(PID) of
								true ->
									psMgr:sendMsg2PS(PID, special_experience_cow, {});
								_ ->
									skip
							end
						end,
					lists:foreach(Fun, L);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

sendNetMsgToMapPlayer(PlayerEts, GroupID, Msg)->
	try
		MatchSpec = ets:fun2ms(
			fun(Object) when Object#recMapObject.groupID =:= GroupID ->
				Object#recMapObject.netPid
			end
		),
		MapPlayerNetPidList = myEts:selectEts(PlayerEts, MatchSpec),
		lists:foreach(fun(NetPid) -> playerMsg:sendNetMsg(NetPid, Msg) end, MapPlayerNetPidList)
	catch
		_ : _  -> skip
	end.

startPlayCharacter(_GroupID, _PlayerEts, [], _Schedule) ->
	skip;
startPlayCharacter(GroupID, PlayerEts, Characters, Schedule) when is_list(Characters) andalso Characters > 0 ->
	?DEBUG_OUT("map:~p,character:~p,schedule:~p",[mapState:getMapId(), Characters, Schedule]),
	erlang:send_after(30*1000, self(), {characterPlayTimeout, GroupID, Schedule}),
	copyMapScheduleState:setMapScheduleCharacterID(GroupID, Schedule),
	sendNetMsgToMapPlayer(PlayerEts, GroupID, #pk_GS2U_CopyMapSchedulePlayCharacter{
		mapID = mapState:getMapId(GroupID), schedule = Schedule, characterIDs = Characters});
startPlayCharacter(_GroupID, _PlayerEts, _Characters, _Schedule)->
	skip.

startPlayAnimation(GroupID, PlayerEts, AN, Schedule) when is_number(AN) andalso AN > 0 ->
	?DEBUG_OUT("map:~p,an:~p,schedule:~p",[mapState:getMapId(), AN, Schedule]),
	erlang:send_after(30*1000, self(), {animationPlayTimeout, GroupID, AN}),
	copyMapScheduleState:setMapScheduleAnimationID(GroupID, AN),
	sendNetMsgToMapPlayer(PlayerEts, GroupID, #pk_GS2U_CopyMapSchedulePlayAnimation{
		mapID = mapState:getMapId(GroupID), schedule = Schedule, animationID = AN });
startPlayAnimation(_GroupID, _PlayerEts, _AN, _Schedule)->
	skip.


%%%-------------------------------------------------------------------
%% 检查条件、事件是否齐全，是的话发给地图上存在的玩家进程进行处理
-spec tryDoEvent(Condition::list(), Event::list(), {InitOrSettle::boolean(), ScheduleID::uint32()}, PlayerEts::etsTab(), GroupID::uint()) -> ok.
tryDoEvent(_, [], _, _, _) ->
	ok;	%% 事件为空，忽略
tryDoEvent(_, 0, _, _, _) ->
	ok;	%% 事件为空，忽略
tryDoEvent(_, undefined, _, _, _) ->
	ok;	%% 事件为空，忽略
tryDoEvent(Condition, Event, ConfigKey, PlayerEts, GroupID) ->
	FunTry =
		fun(#recMapObject{pid = Pid, groupID = GroupID_}, _) ->
			case GroupID_ of
				GroupID ->
					psMgr:sendMsg2PS(Pid, copymapSpecEvent, {Condition, Event, ConfigKey});
				_ ->
					skip
			end
		end,
	ets:foldl(FunTry, 0, PlayerEts),
	ok.

%%%-------------------------------------------------------------------
%% 检查条件、事件是否齐全，是的话发给地图上存在的玩家进程进行处理
-spec findShow2ByGroupID(GroupID::uint()) -> boolean().
findShow2ByGroupID(GroupID) ->
	List1Key = getCfg:get1KeyList(cfg_show2),
	findShow2ByGroupID(GroupID, List1Key).
findShow2ByGroupID(_GroupID, []) ->
	false;
findShow2ByGroupID(GroupID, [ID | T]) ->
	case getCfg:getCfgByKey(cfg_show2, ID) of
		#show2Cfg{groupid = GroupID} ->
			true;
		_ ->
			findShow2ByGroupID(GroupID, T)
	end.

%%%-------------------------------------------------------------------
%% 清除旧有进度的采集物
-spec clearOldCollect(GroupID::uint(), ScheduleID::uint(), IsParallel::boolean()) -> no_return().
clearOldCollect(_GroupID, 0, _IsParallel) ->
	%?DEBUG_OUT("[DebugForCopyMapC] init ~w clearCollect:~w", [_IsParallel, []]),
	skip;
clearOldCollect(GroupID, ScheduleID, IsParallel) ->
	L = copyMapScheduleState:getMapScheduleCollectCode(GroupID, ScheduleID, IsParallel),
	copyMapScheduleState:setMapScheduleCollectCode(GroupID, ScheduleID, IsParallel, []),
	%?DEBUG_OUT("[DebugForCopyMapC] init ~w clearCollect:~w", [IsParallel, L]),
	[gatherNpcMgr:deleteCollect(Code) || {Code, _ID, _X, _Y} <- L],
	ok.
