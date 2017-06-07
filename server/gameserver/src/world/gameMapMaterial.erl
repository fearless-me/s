%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 十二月 2016 11:05
%%%-------------------------------------------------------------------
-module(gameMapMaterial).
-author("Administrator").

-include("mapPrivate.hrl").
-include("common/activityDef.hrl").
-include("common/PlayerPropSyncDefine.hrl").

-export([
	createTower/1,
	newMonsterData/1,
	createMonster1By1/1
]).

%%
createTower(Data)->
	{DataID, NextMonsterID,X,Y} = Data,
	?DEBUG_OUT("tower ~p",[Data]),
	case DataID > 0 of
		true ->
			MonsterEts = mapState:getMapMonsterEts(),
			CodeList = getMonsterCodeByID(DataID),
			?DEBUG_OUT("tower del old ~p,~p",[DataID, CodeList]),
			[ gatherNpcMgr:deleteObject(MonsterEts,Code1) || Code1 <- CodeList ];
		_ ->
			skip
	end,
	spawnOneMonster(NextMonsterID, X, Y, 0).

%% API
createMonster1By1(NowTime) ->
	ST = getSpawnTick(),
	LST =  getLastSpawnTick(),
	Diff =  NowTime - LST,
	N =
		case Diff >= ST of
			true when LST =:= 0 ->
				setLastSpawnTick(NowTime),
				1;
			true ->
				setLastSpawnTick(NowTime),
				trunc(Diff/ST);
			_ ->
				0
		end,
	doCreateMonster1By1(N).

doCreateMonster1By1(N) when N =< 0 ->
	skip;
doCreateMonster1By1(N)->
	createMonster(getSpawnData()),
	doCreateMonster1By1(N - 1).

%%%-------------------------------------------------------------------
createMonster([])->
	ok;
createMonster([{ID, 1, X, Y, WID}| L])->
	spawnOneMonster(ID, X, Y, WID),
	setSpawnData( L );
createMonster([{ID, Num, X, Y, WID } | L]) when Num > 1->
	spawnOneMonster(ID, X, Y, WID),
	setSpawnData( [{ID, Num - 1, X, Y,WID} | L] );
createMonster(V)->
	?ERROR_OUT("createMonster(~w)",[V]).

%%%-------------------------------------------------------------------
spawnOneMonster(MonsterID, InitX, InitY, WID) ->
	?DEBUG_OUT("spawnOneMonster(~w)",[MonsterID]),
	case getCfg:getCfgPStack(cfg_monster, MonsterID) of
		#monsterCfg{level = Lvl } ->
			TMapID = mapState:getMapId(),
%%			#recGameMapCfg{
%%				initX = InitX,
%%				initY = InitY} = core:getMapCfg(TMapID),
			Arg = #recSpawnMonster{
				id = MonsterID,
				mapID = TMapID,
				mapPid = self(),
				x = float(InitX),
				y = float(InitY),
				level = Lvl,
				guildID = 0,
				params = WID,
				playerEts = mapState:getMapPlayerEts(),
				monsterEts = mapState:getMapMonsterEts(),
				petEts = mapState:getMapPetEts(),
				groupID = 0
			},
			monsterInterface:spawnMonster(Arg),
			ok;
		_ ->
			ok
	end.

%%%-------------------------------------------------------------------
newMonsterData(Data)->
	{Tick, List} = Data,
	setSpawnTick(Tick),
	setSpawnDataAcc(List).

%%%-------------------------------------------------------------------
setLastSpawnTick(Tick)-> put('LastSpawnTickTime', Tick).
getLastSpawnTick()->
	case get('LastSpawnTickTime') of
		undefined ->
			0;
		V ->
			V
	end.

%%%-------------------------------------------------------------------
setSpawnTick(Tick)-> put('SpawnTickTime', Tick).
getSpawnTick()->
	case get('SpawnTickTime') of
		undefined ->
			1000;
		V ->
			V
	end.

%%%-------------------------------------------------------------------
setSpawnDataAcc(List)->
	L1 = getSpawnData(),
	L2 = lists:append(L1, List),
	put('SpawnList', L2).

%%%-------------------------------------------------------------------
setSpawnData(L)-> put('SpawnList', L).

%%%-------------------------------------------------------------------
getSpawnData()->
	case get('SpawnList') of
		undefined ->
			[];
		V ->
			V
	end.
%%%-------------------------------------------------------------------

%%通过id检查npc的code
-spec getMonsterCodeByID(NpcID::uint32()) ->[uint64()].
getMonsterCodeByID(NpcID) ->
	MonsterEts = mapState:getMapMonsterEts(),
	MatchSpec = ets:fun2ms(fun(R) when R#recMapObject.id==NpcID -> R#recMapObject.code end),
	L = myEts:selectEts(MonsterEts, MatchSpec),
	L.