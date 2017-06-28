%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 六月 2017 17:20
%%%-------------------------------------------------------------------
-module(gameMapWorldBoss).
-author("Administrator").


-include("mapPrivate.hrl").
-include("common/activityDef.hrl").
-include("common/PlayerPropSyncDefine.hrl").

%% API
-export([
	goDie/1,
	setHp/2,
	createBoss/1
]).

createBoss({MonsterID,CurHp, PosX, PosY})->
	case getCfg:getCfgPStack(cfg_monster, MonsterID) of
		#monsterCfg{level = Lvl } ->
			TMapID = mapState:getMapId(),
			Arg = #recSpawnMonster{
				id = MonsterID,
				mapID = TMapID,
				mapPid = self(),
				x = float(PosX),
				y = float(PosY),
				level = Lvl,
				guildID = 0,
				params = 0,
				camp = ?CampMonsterEnemies,
				playerEts = mapState:getMapPlayerEts(),
				monsterEts = mapState:getMapMonsterEts(),
				petEts = mapState:getMapPetEts(),
				groupID = 0
			},
			Code = monsterInterface:spawnMonster(Arg),
			monsterState:setCurHp(Code, CurHp),
			ok;
		_ ->
			ok
	end,
	ok.


goDie(DataID)->
	Ets = mapState:getMapMonsterEts(),
	CodeList = getObjByID(Ets, DataID),
	[gatherNpcMgr:deleteObject(Ets, Code) || Code <- CodeList],
	ok.

setHp(DataID, Hp) when Hp > 0->
	?LOG_OUT("worldboss[~p],Hp[~p]",[DataID, Hp]),
	Ets = mapState:getMapMonsterEts(),
	CodeList = getObjByID(Ets, DataID),
	[monsterState:setCurHp(Code, Hp) || Code <- CodeList],
	ok;
setHp(_DataID, _Hp) ->
	ok.

getObjByID(Ets, DataID) ->
	MatchSpec = ets:fun2ms(fun(R) when R#recMapObject.id =:= DataID -> R#recMapObject.code end),
	L = myEts:selectEts(Ets, MatchSpec),
	L.
