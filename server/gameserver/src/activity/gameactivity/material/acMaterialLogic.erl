%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 十二月 2016 14:11
%%%-------------------------------------------------------------------
-module(acMaterialLogic).
-author("Administrator").

-include("../../activityPrivate.hrl").
-include("../activityPhaseDefine.hrl").
-include("acMaterialPrivate.hrl").


%% API
-export([
	tick/0,
	activityMapMsg/2,
	activityChangeCallBack/1
]).

-export([
	upTower/2,
	onEnterMap/2,
	setRoleDropList/1,
	monsterReachedEnd/1
]).

-export([
	playerRealEnterMap/2
]).


-export([
	gmfinish/1
]).

%%----------------------------------------------------------------------------------------------
playerRealEnterMap(_Pid, Data)->
	{NetPid, RoleID, MapID, MapPid} = Data,
	L1 = acMaterialState:getMapList(),
	case lists:keyfind(MapPid, #materialMap.mapPID, L1) of
		#materialMap{ } = R ->
			Msg1 = makeMaterialMapInfo(R),
			playerMsg:sendNetMsg(NetPid, Msg1),
			?DEBUG_OUT("############################# playerEnterMapReal(~w,~w,~w,~w) ###########################",
				[NetPid,RoleID,MapID, MapPid]);
		_ ->
			skip
	end.
%%----------------------------------------------------------------------------------------------
makeMaterialMapInfo(#materialMap{
	mapID = MapID
	,deadlineTime = DeadLine
	%,chapterData = Chapter
	,towerData = TowerList
} = R)->
	NowTime = myNow(),
	LefScond = case NowTime >= DeadLine of
				   true ->
					   0;
				   _ ->
					   trunc( (DeadLine - NowTime)/1000)
	           end,

	Towers = lists:foldl(
			fun(#tower{dataId = DataID, type = Type, lv = Level}, Acc) ->
				[#pk_towerInfo{ dataID = DataID, type = Type, level = Level} | Acc]
			end, [], TowerList),

	ChapterInfo = makeChapterInfo(R),
	#pk_GS2U_MaterialInfo{
		mapID = MapID,
		leftSeconds = LefScond,
		towerList = Towers,
		chapter = ChapterInfo
	}.

makeChapterInfo(#materialMap{
	%mapID = MapID
	monsterEts = MonsterEts
	,chapterData = Chapter
	%,towerData = TowerList
}) ->
	NowTime = myNow(),
	NextChapterSecond = case Chapter#chapter.createMonsterTime > NowTime of
		                    true ->
			                    99999999;
		                    _ ->
			                    trunc( (NowTime - Chapter#chapter.createMonsterTime)/1000 )
	                    end,
	HeaCount = case Chapter#chapter.headCount of
				   V when V >= 0 ->
					   V;
				   _ ->
					   0
	           end,
	#pk_chapterInfo{
		nextChapterSeconds = NextChapterSecond,
		headCount = HeaCount,
		maxChapter = Chapter#chapter.maxChapter,
		curChapter = Chapter#chapter.curChapter,
		materialVal = Chapter#chapter.materialVal,
		curChapterMonsterMax = Chapter#chapter.createdMonster,
		curChapterMonsterKilled =  Chapter#chapter.killedMonster,
		mapMonterMax = myEtsSize(MonsterEts)
	}.

%%----------------------------------------------------------------------------------------------
monsterReachedEnd(Data)->
	{MonsterID, Code, _MapID, MapPid, _SX, _SY} = Data,
	case getCfg:getCfgByArgs(cfg_monster, MonsterID) of
		#monsterCfg{monsterSubType = ?MonsterSTypeTower} ->
			skip;
		_ ->
			L1 = acMaterialState:getMapList(),
			L2 =
				case lists:keyfind(MapPid, #materialMap.mapPID, L1) of
					#materialMap{ chapterData = Chapter,playerEts = PlayerEts } = R ->
						psMgr:sendMsg2PS(MapPid, clearObject, {?CodeTypeMonster,[Code]}),
						Msg = playerMsg:getErrorCodeMsg(?ErrorCode_MaterialCopyMonsterReached,[]),
						sendNetMsgToMapPlayer(PlayerEts, Msg),
						?DEBUG_OUT("######## headcount=~p",[Chapter#chapter.headCount - 1]),
						NewR = R#materialMap{ chapterData = Chapter#chapter{
							disappearMonster = Chapter#chapter.disappearMonster + 1,
							headCount = Chapter#chapter.headCount - 1
						}},
						lists:keystore(MapPid,#materialMap.mapPID, L1, NewR);
					_ ->
						L1
				end,
			acMaterialState:setMapList(L2)
	end.

%%----------------------------------------------------------------------------------------------
onEnterMap(FromPid, Data) ->
	{Creator, MapID, TeamID} = Data,
	TeamLeaderID = teamInterface:getLeaderIDWithTeamID(TeamID),
	%%team2:getTeamLeaderID(TeamID),
	case acMaterialState:isCreatingMap(Creator) of
		false  ->
			case TeamID =:= 0 orelse TeamLeaderID =:= Creator of
				true ->
					?LOG_OUT("~w requestEnterMap map ~w",[Creator,MapID]),
					Map = #materialMap{ creator = Creator, mapID = MapID, createTime =  myNow(),
						teamID = TeamID, isCreating = true, deadlineTime = myNow() + getLiftTimeCfg(MapID)},
					acMaterialState:addMap(Map);
				_ ->
					skip
			end,
			psMgr:sendMsg2PS(FromPid, 'EnterMaterialCopyMap', MapID);
		V ->
			?DEBUG_OUT("is creating(~w)",[V]),
			skip
	end.
%%----------------------------------------------------------------------------------------------
setRoleDropList(Data) ->
	{RoleID, MapPid, _MapID, L} = Data,
	L1 = acMaterialState:getMapList(),
	L2 =
		case lists:keyfind(MapPid, #materialMap.mapPID, L1) of
			#materialMap{ roleDropList = DropList } = R ->
				NewDropList =
					case lists:keyfind(RoleID, #playerDrop.roleID, DropList) of
						#playerDrop{} = R ->
							lists:keystore(RoleID, #playerDrop.roleID, DropList, L);
						_ ->
							[#playerDrop{roleID = RoleID, drops = L} | DropList]
					end,
				NewR = R#materialMap{roleDropList = NewDropList},
				lists:keystore(MapPid,#materialMap.mapPID, L1, NewR);
			_ ->
				L1
		end,
	acMaterialState:setMapList(L2),
	ok.
%%----------------------------------------------------------------------------------------------
upTower(_PidFrom, Data)->
	{NetPid, _RoleID, MapPid, DataID, NextMonsterCost, NextMonsterID,Type,NextLevel,X,Y} = Data,
	L1 = acMaterialState:getMapList(),
	L2 =
		case lists:keyfind(MapPid, #materialMap.mapPID, L1) of
			#materialMap{ towerData = TowerList, chapterData = Chapter, playerEts = PlayerEts } = R ->
				OldMaterialVal = Chapter#chapter.materialVal,
				case OldMaterialVal >= NextMonsterCost of
					true ->
						psMgr:sendMsg2PS(MapPid, createTowerMonsetr,{DataID, NextMonsterID,X,Y}),
						NewTowerData = doUpTower(PlayerEts, TowerList,DataID, NextMonsterID,Type,NextLevel,X,Y),
						NewR = R#materialMap{towerData =  NewTowerData,
							chapterData = Chapter#chapter{materialVal = OldMaterialVal - NextMonsterCost}},
						lists:keystore(MapPid,#materialMap.mapPID, L1, NewR);
					_ ->
						playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_MaterialCopyResourceNo),
						L1
				end;
			_ ->
				L1
		end,
	acMaterialState:setMapList(L2).

doUpTower(PlayerEts, TowerList,DataID, NextMonsterID,Type,NextLevel,_X,_Y)->
	case lists:keyfind(DataID, #tower.dataId, TowerList) of
		#tower{} ->
			?DEBUG_OUT("upTower(~w,~w->~w,~w)",[Type,DataID,NextMonsterID,NextLevel]),
			%%---------------
			Msg = #pk_GS2U_TowerInfo{ info = #pk_towerInfo{dataID = NextMonsterID, type = Type, level = NextLevel}},
			sendNetMsgToMapPlayer(PlayerEts, Msg),
			%%---------------
			lists:keystore(DataID, #tower.dataId, TowerList,
				#tower{dataId = NextMonsterID, type = Type, lv = NextLevel});
		_ ->
			TowerList
	end.

%%----------------------------------------------------------------------------------------------
createInitTower(MapID, MapPid)->
	L = lists:seq(1,?TowerMaxType),
	F = fun(Type, Acc)->
			ML = playerMaterialCopy:getMonterList(MapID,Type),
			case length(ML) > 0 of
				true ->
					case playerMaterialCopy:getMonsterPos(Type) of
						{X, Y} ->
							[{MonsterID,_}| _] =  ML,
							psMgr:sendMsg2PS(MapPid, createTowerMonsetr,{0, MonsterID,X,Y}),
							[#tower{dataId = MonsterID, lv = 1, type = Type} | Acc];
						_ ->
							?ERROR_OUT("create tower(~w)",[Type]),
							Acc
					end;
				_ ->
					?ERROR_OUT("create init tower list empty"),
					Acc
			end
		end,
	lists:foldl(F,[], L).

%%----------------------------------------------------------------------------------------------
%% 主活动模块进程回调
-spec activityChangeCallBack(Phase::uint()) -> ok.
activityChangeCallBack(Phase) ->
	?DEBUG_OUT("~p activityChangeCallBack:~p", [self(), Phase]),
	ok.

%%----------------------------------------------------------------------------------------------
%% 活动地图的消息 | 地图进程init返回
-spec activityMapMsg(MsgType::uint(), Data::term()) -> ok.
activityMapMsg(?ACMapMsg_CreateMap,
		{CreateRoleID,MapID,MapPid,PlayerEts,MonsterEts,_CollectEts,_NpcEts}) ->
	?DEBUG_OUT("########################### ~w create map ~w ~w",[CreateRoleID,MapID, MapPid]),
	case acMaterialState:isCreatingMap(CreateRoleID) of
		#materialMap{chapterData = Chapter, mapID = MapID } = R ->
			TL = createInitTower(MapID, MapPid),
			acMaterialState:updateMap(R#materialMap{
				mapPID =  MapPid,
				playerEts = PlayerEts,
				monsterEts = MonsterEts,
				towerData = TL,
				createTime =  myNow(),
				chapterData = Chapter#chapter{
					materialVal = getStartVal(),
					headCount = getMaxHeadCount(),
					maxChapter = getMaxChapterCfg(MapID)}});
		_ ->
			ok
	end;
%%----------------------------------------------------------------------------------------------
activityMapMsg(?ACMapMsg_DestoryMap, MapPid) ->
	?DEBUG_OUT("########################### destroy map ~w",[MapPid]),
	L1 = acMaterialState:getMapList(),	L2 = lists:keydelete(MapPid, #materialMap.mapPID, L1),
	acMaterialState:setMapList(L2);
%%----------------------------------------------------------------------------------------------
activityMapMsg(?ACMapMsg_KillMonster, {_MapID, MapPid, _AttackRoleID, _MonsterCode, _MonsterID}) ->
	L1 = acMaterialState:getMapList(),
	L2 =
		case lists:keyfind(MapPid, #materialMap.mapPID, L1) of
			#materialMap{ chapterData = Data} = R ->
				KillVal = getChapterKillVal(Data#chapter.curChapter),
				NewR = R#materialMap{ chapterData = Data#chapter{
					killedMonster = Data#chapter.killedMonster + 1,
					materialVal =  Data#chapter.materialVal + KillVal }},
				lists:keystore(MapPid,#materialMap.mapPID, L1, NewR);
			_ ->
				L1
		end,
	acMaterialState:setMapList(L2);
%%----------------------------------------------------------------------------------------------
activityMapMsg(?ACMapMsg_PlayerEnter, {_RoleID, _MapPID, #recMapObject{}}) ->
	ok;
activityMapMsg(?ACMapMsg_PlayerLeave, {RoleID, MapPid, #recMapObject{}}) ->
	?DEBUG_OUT("########################### ~w leave map ~w",[RoleID, MapPid]);
%%	L1 = acMaterialState:getMapList(),
%%	L2 = lists:keydelete(MapPid, #materialMap.mapPID, L1),
%%	acMaterialState:setMapList(L2);
activityMapMsg(_MsgType, _Data) -> ok.

%%----------------------------------------------------------------------------------------------
tick()->
	allMapRun( ).

%%----------------------------------------------------------------------------------------------
allMapRun()->
	L1 = acMaterialState:getMapList(),
	L2 = allMapRun1(L1, []),
	acMaterialState:setMapList(L2).

allMapRun1([],Acc) ->
	Acc;
allMapRun1([Map | L], Acc) ->
	NewAcc=
		case oneMapRun(Map) of
			#materialMap{} = NewMap ->
				[NewMap | Acc];
			_ ->
				Acc
		end,
	allMapRun1(L, NewAcc).

%%----------------------------------------------------------------------------------------------
oneMapRun(#materialMap{state = ?CHAPTER_0} = R) ->
	check(R);
oneMapRun(#materialMap{state = ?CHAPTER_PREPARE} = R) ->
	prepare(R);
oneMapRun(#materialMap{state = ?CHAPTER_GOING} = R) ->
	working(R);
oneMapRun(#materialMap{state = ?CHAPTER_FINISH}= R) ->
	reward(R);
oneMapRun(#materialMap{state = ?CHAPTER_TIMEOUT}= R) ->
	reward(R);
oneMapRun(#materialMap{state = ?CHAPTER_FAILED}= R) ->
	reward(R);
oneMapRun(#materialMap{state = ?CHAPTER_GIVE}= R) ->
	waitDestroy(R);
oneMapRun(#materialMap{state = ?CHAPTER_KICK, mapPID = MapPID}) ->
	%% 清理怪物和采集物
	?DEBUG_OUT("###########################~w reset",[MapPID]),
	case is_pid(MapPID) of
		true ->
			psMgr:sendMsg2PS(MapPID, resetCopyMap, {});
		_ ->
			skip
	end,
	ok;
oneMapRun(_) ->
	ok.

%%----------------------------------------------------------------------------------------------
-spec check(R::#materialMap{}) -> #materialMap{}.
check(#materialMap{mapPID = MapPid, playerEts = Ets,createTime = CreateTime} = R) ->
	IsWaitTimeOut = myNow() > CreateTime + ?PrepareTime,
	case is_pid(MapPid) andalso myEtsSize(Ets) > 0 of
		true->
			R#materialMap{state = ?CHAPTER_PREPARE};
		_ when IsWaitTimeOut =:= true ->
			R#materialMap{state = ?CHAPTER_KICK};
		_ ->
			R
	end.

%%----------------------------------------------------------------------------------------------
-spec prepare(R::#materialMap{}) -> #materialMap{}.
prepare(#materialMap{createTime = CreateTime} = R) ->
	case myNow() > CreateTime + ?PrepareTime of
		true ->
			R#materialMap{state = ?CHAPTER_GOING};
		_ ->
			R
	end.

%%----------------------------------------------------------------------------------------------
-spec working(R::#materialMap{}) -> #materialMap{}.
working(#materialMap{chapterData = Data,deadlineTime = DeadLine} = R)->
	#chapter{
		maxChapter = Max,
		curChapter = Cur,
		headCount = HeadCount
	} = Data,

	acMaterialState:addTickCount(),
	Timeout = isIimeoutNow(DeadLine),
%%	必须先判断异常结束
	if
		HeadCount =< 0 ->
			failed(R);
		Timeout =:= true ->
			timeout(R);
		Max =:= Cur->
			pass(R);
		Cur < Max ->
			next(R);
		true->
			R
	end.

%%----------------------------------------------------------------------------------------------
-spec reward(R::#materialMap{}) -> #materialMap{}.
reward(#materialMap{mapID = MapID, mapPID = MapPid,
	state = State, playerEts = PlayerEts, chapterData = Chapter} = R) ->
%%===============
	psMgr:sendMsg2PS(MapPid, clearAllObject, ?CodeTypeMonster),
	{CopyFinishState, Score} = calcScore(State),
	sendMsgToMapPlayer(PlayerEts, completeMaterialCopyMap,
		{Score, CopyFinishState, MapID, Chapter#chapter.maxChapter, Chapter#chapter.curChapter, ?MapSubTypeMaterial}),
	R#materialMap{state = ?CHAPTER_GIVE, finishTime = myNow()}.

calcScore(?CHAPTER_FINISH)-> {0,100};
calcScore(?CHAPTER_TIMEOUT)-> {1,0} ;
calcScore(?CHAPTER_FAILED)-> {2,0} .

%%----------------------------------------------------------------------------------------------
-spec timeout(R::#materialMap{}) -> #materialMap{}.
timeout(#materialMap{playerEts = PlayerEts} = R)->
	?DEBUG_OUT("~w timout",[R]),
	sycnChapterInfo(R, true),
	Msg = playerMsg:getErrorCodeMsg(?ErrorCode_MaterialCopyTimeoutSoon,[]),
	sendNetMsgToMapPlayer(PlayerEts, Msg),
	R#materialMap{state = ?CHAPTER_TIMEOUT}.

%%----------------------------------------------------------------------------------------------
-spec failed(R::#materialMap{}) -> #materialMap{}.
failed(#materialMap{} = R)->
	?LOG_OUT("~w failed",[R]),
	sycnChapterInfo(R,true),
	R#materialMap{state = ?CHAPTER_FAILED}.

%%----------------------------------------------------------------------------------------------
-spec pass(R::#materialMap{}) -> #materialMap{}.
pass(#materialMap{chapterData = Data, monsterEts = Ets,playerEts = PlayerEts} = R)->
	#chapter{
		disappearMonster = Disappeared,
		killedMonster = KilledNumber,
		createdMonster = CreatedNumber
	} = Data,
	LeftNumber = myEtsSize(Ets),
	PlayerSize = myEtsSize(PlayerEts),
	sycnChapterInfo(R, true),
	if
		KilledNumber + Disappeared >= CreatedNumber andalso LeftNumber =< ?TowerMaxNumber ->
			?LOG_OUT("~w pass",[R]),
			R#materialMap{state = ?CHAPTER_FINISH};
		PlayerSize =< 0 ->
			?LOG_OUT("no player reset[~w]",[R]),
			R#materialMap{state = ?CHAPTER_KICK};
		true ->
			R
	end.

%%----------------------------------------------------------------------------------------------
-spec next(R::#materialMap{}) -> #materialMap{}.
next(#materialMap{playerEts = PlayerEts, mapID = MapID, mapPID = MapPID,chapterData = Data} = R)->
	#chapter{
		curChapter = Cur,
		createMonsterTime = MonsterCreateTime,
		curFinishTime = CurFinishTime,
		disappearMonster = Disappeared,
		killedMonster = Killed,
		createdMonster = Created
	} = Data,
	sycnChapterInfo(R,false),
	PlayerSize = myEtsSize(PlayerEts),
	case canNextChapter(MapID, MonsterCreateTime, Cur, erlang:trunc(Disappeared + Killed), Created) of
		_ when PlayerSize =< 0 ->
			?LOG_OUT("no player reset[~w]",[R]),
			R#materialMap{state = ?CHAPTER_KICK};
		true ->
			case myNow() >= MonsterCreateTime + getNextChapterTimeCfg(MapID, Cur) of
				true ->
					?DEBUG_OUT("###########################~w next",[R]),
%%					sendMsgToMapPlayer(PlayerEts, startMaterialChapter, {MapID,Cur + 1}),
					Msg =
						case isBossChapterFlag(MapID, Cur+1) of
							true ->
								playerMsg:getErrorCodeMsg(?ErrorCode_MaterialCopyBossComing,[]);
							_ ->
								playerMsg:getErrorCodeMsg(?ErrorCode_MaterialCopyChapterStart, [Cur + 1])
						end,

					sendNetMsgToMapPlayer(PlayerEts, Msg),
					V = spawnMonster(Cur + 1, MapID, MapPID),
					R#materialMap{
						chapterData = Data#chapter{
							curFinishTime = 0,
							curChapter = Cur + 1,
							createdMonster = V,
							killedMonster = 0,
							disappearMonster = 0,
							createMonsterTime = myNow()
						}
					};
				_ when CurFinishTime =< 0  ->
					?DEBUG_OUT("###########################~w  wait startNext",[R]),
					R#materialMap{
						chapterData = Data#chapter{curFinishTime = myNow()}};
				_ ->
					R
			end;
		_ ->
			R
	end.

%%----------------------------------------------------------------------------------------------
-spec waitDestroy(R::#materialMap{}) -> #materialMap{}.
waitDestroy(#materialMap{finishTime = FT} = R)->
	case myNow() >= FT + ?EndWaitTime of
		true ->
			?DEBUG_OUT("###########################~w Destroy",[R]),
			R#materialMap{state = ?CHAPTER_KICK};
		_ ->
			R
	end.

%%----------------------------------------------------------------------------------------------
sycnChapterInfo(#materialMap{} = R, IsForce)->
	V = acMaterialState:getTickCount(),
	if
		V > 0 andalso V rem 5 =:= 0 ->
			doSycnChapterInfo(R);
		IsForce =:= true ->
			doSycnChapterInfo(R);
		true ->
			ok
	end.

doSycnChapterInfo(#materialMap{playerEts = Ets} = R)->
	ChapterInfo = makeChapterInfo(R),
	Msg = #pk_GS2U_ChapterInfo{ chapter = ChapterInfo},
	sendNetMsgToMapPlayer(Ets, Msg).

%%----------------------------------------------------------------------------------------------
spawnMonster(Chapter, MapID, MapPid) ->
	L0 = getMonsterListCfg(MapID, Chapter),
	L1 = lists:foldl(
			fun({MonsterID,MonsterNum,CfgWPID}, Acc)->
				case getMapWayPointPos(MapID, CfgWPID) of
					{X, Y, WPId}->
						[{MonsterID,MonsterNum,X,Y,WPId} | Acc];
					_ ->
						Acc
				end
			end,
		[], L0),
	case length(L1) > 0 of
		true ->
			psMgr:sendMsg2PS(MapPid, 'CreateMonster1By1', {getNextChapterSpawnTickCfg(MapID, Chapter), L1});
		_ ->
			skip
	end,
	lists:foldl(fun({_,Num,_,_,_}, Acc)-> Acc + Num end, 0, L1).

%%----------------------------------------------------------------------------------------------
canNextChapter(_,0,_,_,_)-> true;
canNextChapter(_MapID, _PreTime, _CurChapter, Killed, Created)->
	 Killed >= Created.

%%----------------------------------------------------------------------------------------------
isIimeoutNow(DeadLine) -> myNow() > DeadLine.

%%----------------------------------------------------------------------------------------------
myNow() -> time:getUTCNowMS().

%%----------------------------------------------------------------------------------------------
myEtsSize(Ets) ->
	case myEts:getCount(Ets) of
		undefined ->
			0;
		V ->
			V
	end.


%%----------------------------------------------------------------------------------------------
sendMsgToMapPlayer(PlayerEts, MsgID, Msg)->
	try
		MatchSpec = ets:fun2ms(fun(Object) ->  Object#recMapObject.pid end),
		MapPlayerNetPidList = myEts:selectEts(PlayerEts, MatchSpec),
		lists:foreach(fun(Pid) -> psMgr:sendMsg2PS(Pid, MsgID, Msg) end, MapPlayerNetPidList)
	catch
	    _ : _  -> skip
	end.

sendNetMsgToMapPlayer(PlayerEts, Msg)->
	try
		MatchSpec = ets:fun2ms(fun(Object) ->  Object#recMapObject.netPid end),
		MapPlayerNetPidList = myEts:selectEts(PlayerEts, MatchSpec),
		lists:foreach(fun(NetPid) -> playerMsg:sendNetMsg(NetPid, Msg) end, MapPlayerNetPidList)
	catch
		_ : _  -> skip
	end.
%%----------------------------------------------------------------------------------------------

isBossChapterFlag(MapID, Chapter)->
	case getCfg:getCfgByArgs(cfg_specialinstance, MapID, Chapter) of
		#specialinstanceCfg{boss = V} ->
			misc:convertBoolFromInt(V);
		_ ->
			false
	end.

getMaxChapterCfg(MapID)->
	L = getCfg:get2KeyList(cfg_specialinstance, MapID),
	length(L).

getLiftTimeCfg(MapID)->
	case getCfg:getCfgByArgs(cfg_specialinstance,MapID, 1) of
		#specialinstanceCfg{time_over = OverTime} ->
			trunc(OverTime*1000);
		_ ->
			99999999
	end.

getMonsterListCfg(MapID, Chapter)->
	case getCfg:getCfgByArgs(cfg_specialinstance, MapID, Chapter) of
		#specialinstanceCfg{monster_way1 = V} ->
			V;
		_ ->
			[]
	end.

getNextChapterTimeCfg(MapID, Chapter)->
	case getCfg:getCfgByArgs(cfg_specialinstance, MapID, Chapter) of
		#specialinstanceCfg{time_turn = V} ->
			V * 1000;
		_ ->
			5000
	end.

getNextChapterSpawnTickCfg(MapID, Chapter)->
	case getCfg:getCfgByArgs(cfg_specialinstance, MapID, Chapter) of
		#specialinstanceCfg{time = V} ->
			trunc(V * 1000);
		_ ->
			1000
	end.


getMapWayPointPos(MapID, CfgWPID) ->
	case core:getMapWayPt(MapID) of
		WayPtList when erlang:is_list(WayPtList) ->
			Ret = lists:keyfind(CfgWPID, #recMapWayPt.id, WayPtList),
			case Ret of
				#recMapWayPt{x = InitX,y = InitY, id = Id} ->
					{InitX, InitY, Id};
				_ ->
					undefined
			end;
		_ ->
			undefined
	end.

getMaxHeadCount()->
	case getCfg:getCfgByArgs(cfg_globalsetup, specialinstancehealth) of
		#globalsetupCfg{setpara = [V]} -> V;
		_ -> 20
	end.

getStartVal()->
	case getCfg:getCfgByArgs(cfg_globalsetup, specialinstancestartmoney) of
		#globalsetupCfg{setpara = [V]} -> V;
		_ -> ?AddMVDefault
	end.

getChapterKillVal(Chapter)->
	case getCfg:getCfgByArgs(cfg_globalsetup, specialinstancemoney) of
		#globalsetupCfg{setpara = L } ->
			case length(L) >= Chapter of
				true when Chapter > 0 -> lists:nth(Chapter, L);
				_ -> 1
			end;
		_ -> 1
	end.

gmfinish(Params)->
	{_RoleID, _MapID, MapPid} = Params,
	L1 = acMaterialState:getMapList(),
	L2 =
		case lists:keyfind(MapPid, #materialMap.mapPID, L1) of
			#materialMap{ } = R  ->
				NewR = R#materialMap{state = ?CHAPTER_FINISH},
				lists:keystore(MapPid,#materialMap.mapPID, L1, NewR);
			_ ->
				L1
		end,
	acMaterialState:setMapList(L2).
