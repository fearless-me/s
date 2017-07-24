%% @author zhengzhichun
%% @doc @todo Add description to gameMapAcKingBattleAll.
%%王者战天下

-module(gameMapAcKingBattleAll).
-include("mapPrivate.hrl").
-include("common/activityDef.hrl").
-include("cfg_fightall.hrl").
-include("common/PlayerPropSyncDefine.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
%%		 onMarrorDead/2,
		 onMarrorBeAttack/3,
		 createKingStatueToMapOnMapInit/0,
		 createKingMirroringToMap/0,
		 createKingStatueToMap/0,
	     addBuffToMirror/2
%%		 activityEnd/0
		 ]).


%%镜像被攻击(只记录玩家的攻击)
-spec onMarrorBeAttack(BeAttackCode::uint(),AttackerID::uint64(),AttackerCode::uint64()) ->ok.
onMarrorBeAttack(BeAttackCode,AttackerID,AttackerCode) ->
	AcKingBattleAllMapID = globalCfg:getGlobalCfg(fightall_map_id),
	Type = codeMgr:getObjectTypeByCode(AttackerCode),
	CurMapID = mapState:getMapId(),
	case CurMapID=:=AcKingBattleAllMapID of
		true when Type == ?ObjTypePlayer ->
			monsterInterface:setMarrorAttackerID( BeAttackCode,AttackerID ),
			ok;
		true ->
			skip;
		false ->
			skip
	end,
ok.

%%主城初始化时，把王者雕像npc产出来
-spec createKingStatueToMapOnMapInit() ->ok.
createKingStatueToMapOnMapInit() ->
	MarrorMapID = globalCfg:getGlobalCfg(main_map_id),
	CurMapID = mapState:getMapId(),
	?DEBUG_OUT("createKingStatueToMapOnMapInit------~p  ~p",[MarrorMapID,CurMapID]),
	case MarrorMapID =:= CurMapID of
		true -> createKingStatueToMap();
		false -> skip
	end,
	ok.

%%生产王者的雕像：保留此代码客户端尚未完成该功能
-spec createKingStatueToMap() ->ok.
createKingStatueToMap() ->
	case edb:readAllRecord(rec_guard_mirror) of
		[#rec_guard_mirror{
						   roleName = Name,
						   roleCareer = Career
						  }|_] ->
			#globalsetupCfg{setpara=MirroringList} = getCfg:getCfgByArgs(cfg_globalsetup, fightall_statue),
			?DEBUG_OUT("globalsetupCfg  ~p",[MirroringList]),
			
			NpcEts = mapState:getMapNpcEts(),
			Fun = fun({IDOne,_X,_Y,_RotW}) ->
						  CodeList = getNpcCodeByID(IDOne),
						  [gatherNpcMgr:deleteObject(NpcEts,Code1) || Code1 <- CodeList]
				  end,
			lists:foreach(Fun, MirroringList),
			
			{ID,X1,Y1,RotW} = lists:nth(Career,MirroringList),
			StrName = stringCfg:getString(cnTextKingBattleAllStatueNamePostfix, [binToString(Name)]),
			NpcInstance = #recSpawnNpc{id = ID,name=StrName,rotW =RotW,x = erlang:float(X1),y = erlang:float(Y1)},
			mapBase:npcSpawn(NpcInstance),
			
			?LOG_OUT("createKingStatueToMap mapPid=~p  ~p",[self(),NpcInstance]);
		_ ->
			skip
	end,
	ok.

%%生产王者镜像
-spec createKingMirroringToMap() ->ok.
createKingMirroringToMap() ->
	[#rec_guard_mirror{
		roleID = RoleID,
		roleName = Name,
		roleLevel = Level,
		hpNumber = Hp,
		fightForce = FightForce,
		mirrorBuffCfgID = MirrorBiffCfgID
	} | _] = edb:readAllRecord(rec_guard_mirror),
	case acKingBattleAllLogic:getMirrorInfo(RoleID) of
		{ok, {MonsterID, X1, Y1}} ->

			Fightall_mirror_atk = configfightall_mirror_atk(),
			Fightall_fightall_mirror_def =  configfightall_mirror_def(),
			Fightall_mirror_crit  = configfightall_mirror_crit(),
			Fightall_mirror_redef = configfightall_mirror_redef(),
			Fightall_mirror_critdamage= configfightall_mirror_critdamage(),
			Fightall_mirror_toughness= configfightall_mirror_toughness(),
			Fightall_mirror_dodge = configfightall_mirror_dodge(),
			Fightall_mirror_hit =   configfightall_mirror_hit(),
			Fightall_mirror_armor = configfightall_mirror_armor(),
			StrName = stringCfg:getString(cnTextKingBattleAllMonsterNamePostfix, [binToString(Name)]),
			LocationInstance = #recMapObjData{id = MonsterID, name = StrName, mapX = erlang:float(X1), mapY = erlang:float(Y1)},

			PropKvList = [{?Prop_MaxHP, Hp}, {?Prop_PhysicalAttack, FightForce * Fightall_mirror_atk},
				{?Prop_PhysicalDefence, FightForce * Fightall_fightall_mirror_def}, {?Prop_CriticalLevel, FightForce * Fightall_mirror_crit}, {?Prop_CriticalResistLevel, FightForce * Fightall_mirror_redef},
				{?Prop_CriticalDamageLevel, FightForce * Fightall_mirror_critdamage}, {?Prop_TenaciousLevel, FightForce * Fightall_mirror_toughness}, {?Prop_HitLevel, FightForce *Fightall_mirror_hit}, {?Prop_DodgeLevel, FightForce *Fightall_mirror_dodge}, {?Prop_ArmorPenetrationLevel, FightForce * Fightall_mirror_armor}],
			CallBack = copyMapDemonBattle:createPropCallback_Mirror(PropKvList),
			mapBase:spawnAllMonster([LocationInstance], CallBack, Level),
			#acKingBattleBuyBuffCfg{buffID = BuffID} = getCfg:getCfgByKey(cfg_acKingBattleBuyBuff, MirrorBiffCfgID),
			gameMapAcKingBattleAll:addBuffToMirror(MonsterID,BuffID),
			?LOG_OUT("createKingMirroring mapPid=~p  ~p ~p ", [self(), LocationInstance, RoleID]);
		_ ->
			?ERROR_OUT("createKingMirroringToMap fail RoleID may be del RoleID=~p", [RoleID])
	end,
	ok.

addBuffToMirror(MonsterID, BuffCfgID) ->
%%	case acWorldBossLogic:getMonsterInfoByID(MonsterID) of
%%		[] ->
%%			skip;
%%		[#recMapObject{
%%			code = MonsterCode,
%%			level = MonstgerLevel
%%		} | _] ->
%%			monsterBuff:addBuff(MonsterCode, BuffCfgID, MonstgerLevel),
%%			?DEBUG_OUT("zzc========marror add buff MonsterCode[~p], BuffID2[~p], MonstgerLevel[~p]", [MonsterCode, BuffCfgID, MonstgerLevel]),
%%			ok
%%	end,
	ok.

%%通过id检查npc的code
-spec getNpcCodeByID(NpcID::uint32()) ->[uint64()].
getNpcCodeByID(NpcID) ->
	NpcEts = mapState:getMapNpcEts(),
	MatchSpec = ets:fun2ms(fun
				  (R) when R#recMapObject.id==NpcID ->
					   R#recMapObject.code
			   end),
	L = myEts:selectEts(NpcEts, MatchSpec),
	L.

%% ====================================================================
%% Internal functions
%% ====================================================================

binToString(BinStr) when erlang:is_list(BinStr) ->
	BinStr;
binToString(BinStr) ->
	erlang:binary_to_list(BinStr).

configfightall_mirror_atk() ->
	#globalsetupCfg{setpara = [Value]} =
		getCfg:getCfgPStack(cfg_globalsetup, fightall_mirror_atk),
	Value.
configfightall_mirror_def()->
	#globalsetupCfg{setpara = [Value]} =
		getCfg:getCfgPStack(cfg_globalsetup, fightall_mirror_def),
	Value.

configfightall_mirror_crit()->
	#globalsetupCfg{setpara = [Value]} =
		getCfg:getCfgPStack(cfg_globalsetup, fightall_mirror_crit),
	Value.
configfightall_mirror_redef()->
	#globalsetupCfg{setpara = [Value]} =
		getCfg:getCfgPStack(cfg_globalsetup, fightall_mirror_redef),
	Value.

configfightall_mirror_critdamage()->
	#globalsetupCfg{setpara = [Value]} =
		getCfg:getCfgPStack(cfg_globalsetup, fightall_mirror_critdamage),
	Value.

configfightall_mirror_toughness()->
	#globalsetupCfg{setpara = [Value]} =
		getCfg:getCfgPStack(cfg_globalsetup, fightall_mirror_toughness),
	Value.

configfightall_mirror_hit()->
	#globalsetupCfg{setpara = [Value]} =
		getCfg:getCfgPStack(cfg_globalsetup, fightall_mirror_hit),
	Value.
configfightall_mirror_dodge()->
	#globalsetupCfg{setpara = [Value]} =
		getCfg:getCfgPStack(cfg_globalsetup, fightall_mirror_dodge),
	Value.
configfightall_mirror_armor()->
	#globalsetupCfg{setpara = [Value]} =
		getCfg:getCfgPStack(cfg_globalsetup, fightall_mirror_armor),
	Value.

configfightall_mirror_HP()->
	#globalsetupCfg{setpara = [Value]} =
		getCfg:getCfgPStack(cfg_globalsetup, fightall_mirror_HP),
	Value.
