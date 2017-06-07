%%
%%-------------------------------------------------------------------
%% @author 罗维
%% @copyright (C) 2014, <haowan123>
%% @doc
%% 生物初始化 目前包括(宠物,怪物,载体)
%% @end
%% Created : 20. 六月 2014 17:27
%%-------------------------------------------------------------------


-module(creatureBase).
-author(luowei).

-include("monsterPrivate.hrl").
-define(RestoreHpPer, 5). %%回血百分比
-define(MonsterTickIntervalone, 200).
-define(MonsterTickIntervaltwo, 1000).
-define(MonsterDisappearTime, 10000).    %% 尸体腐烂时间（毫秒）
-define(MonsterDictClearTime, 60 * 1000). %% 怪物字典清理

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initCreature/2,
	initConvoyCreature/3,
	delCreature/1,
	getMonsterProp/1,
	tick/1
]).

-export([
	monsterDead/2
]).


%%初始化生物数据
-spec initCreature(Type, Arg) -> Code when
	Type :: ?InitPet | ?InitMonster | ?InitCarrier,
	Arg :: #recSpawnPet{} | #recSpawnMonster{},
	Code :: uint().
initCreature(?InitPet, #recSpawnPet{} = PetArg) ->
	Code = initCode(?InitPet),                                     %%初始化Code
	initFaceDir(Code),                                           %%初始化方向
	MapObject = initPet(Code, PetArg),                           %%初始化宠物                                   
	CodeType = monsterState:getCodeType(Code),
	creatureMap:addCreatureToEts(Code, MapObject, CodeType),     %%同步数据到地图里面
	spawnPetAck(Code, PetArg),
	Code;
initCreature(Type, #recSpawnMonster{} = MonsterArg) ->
	Code = initCode(Type),                                       %%初始化Code
	initCreature(Code, Type, MonsterArg);
initCreature(_, _OtherArg) ->
	0.

%% 创建护送生物数据
initConvoyCreature(?InitMonster = Type, #recSpawnMonster{id = ID} = MonsterArg, MonsterCode) ->
	?LOG_OUT("create convoy monster Code[~p], monster id [~p]", [MonsterCode, ID]),
	initCreature(MonsterCode, Type, MonsterArg).

initCreature(Code, Type, #recSpawnMonster{id = ID, params = Params} = MonsterArg) ->
	initFaceDir(Code),                                           %%初始化方向
	MapObject = initMonster(Code, MonsterArg, Type),             %%初始化怪物
	CodeType = monsterState:getCodeType(Code),
	creatureMap:addCreatureToEts(Code, MapObject, CodeType),     %%同步数据到地图里面
	libBstAI:spawnAI(ID, Code, monsterState:getMoveType(Code), Params),
	spawnMonsterAck(Code),
	case battle:isBoss(monsterState:getId(Code)) of
		true ->
			?LOG_OUT("create monster Code[~p], monster id [~p]", [Code, ID]);
		_ ->
			?DEBUG_OUT("create monster Code[~p], monster id [~p]", [Code, ID]),
			skip
	end,
	Code.


%%生存时间到,销毁生物数据
-spec delCreature(Code) -> ok when
	Code :: uint().
delCreature(Code) ->
	monsterAI:stopAI(Code),
	monsterBattle:delBothHate(Code),
	monsterState:setCurHp(Code, 0),
	monsterState:setActionStatus(Code, ?CreatureActionStatusDead),

	Now = time:getUTCNowMS(),
	Name = monsterState:getName(Code),
	MapPid = monsterState:getMapPid(Code),
	Type = monsterState:getCodeType(Code),
	GroupID = monsterState:getGroupID(Code),
	{X, Y} = monsterState:getMonsterPos(Code),
	CasterInfo = monsterState:getCasterInfo(Code),
	PlayerEts = monsterState:getMapPlayerEts(Code),

	Msg = #pk_GS2U_ForceDeadNow{
		skillID = 0,
		killerCode = Code,
		killerName = Name,
		deadActorCode = Code
	},

	{TX, TY} =
		case Type =:= ?SpawnPet orelse Type =:= ?SpawnCallPet of
			true ->
				case ets:lookup(PlayerEts, CasterInfo#recCasterInfo.casterCode) of
					[#recMapObject{x = CX, y = CY}] -> {CX, CY};
					_ -> {X, Y}
				end;
			_ ->
				{X, Y}
		end,

	%% 如果施法者为怪物，casterPid为地图PID
	NearPlayerList = mapView:getMutualObject(MapPid, PlayerEts, ?ObjTypePlayer, {TX, TY}, GroupID),
	case CasterInfo#recCasterInfo.casterType =:= ?AttackerTypePlayer andalso codeMgr:isCodeType(?CodeTypePlayer, CasterInfo#recCasterInfo.casterCode) of
		true ->
			CasterPid = CasterInfo#recCasterInfo.casterPid,
			case lists:keyfind(CasterPid, #recMapObject.pid, NearPlayerList) of
				false ->
					case misc:is_process_alive(CasterPid) of
						true -> psMgr:sendMsg2PS(CasterPid, broadcast, Msg);
						_ -> skip
					end;
				_ ->
					skip
			end;
		_ -> skip
	end,
	[mapView:sendNetMsgToNetPid(NetPid, Msg) || #recMapObject{netPid = NetPid} <- NearPlayerList],

	creatureMap:delCreatureFromEts(Code, Type),
	MonsterList = monsterState:getMonsterList(),
	monsterState:setMonsterList(lists:keydelete(Code, 1, MonsterList)),
	List = monsterState:getDelMonster(),
	monsterState:setDelMonster([{Code, Now} | List]).


-spec delDeadList(Now) -> ok when
	Now :: uint().
delDeadList(Now) ->
	List = monsterState:getDelMonster(),
	Fun = fun({Code, Time} = Pair, {AccIn, DelList}) ->
		case Now - Time >= ?MonsterDictClearTime of
			true ->
%%						  codeMgr:reclaimCode(Code),
				{AccIn, [Code | DelList]};
			_ ->
				{[Pair | AccIn], DelList}
		end
	      end,
	{L, DelL} = lists:foldl(Fun, {[], []}, List),
	case DelL of
		[] ->
			skip;
		_ ->
			monsterState:eraseAllProcessDict(DelL),
			monsterState:setDelMonster(L)
	end,
	ok.


-spec tick(Now) -> ok when
	Now :: uint().
tick(Now) ->
	LastTickTime = monsterState:getLastTickTime(),
	DiffTime = Now - LastTickTime,

	LastTickMoveTime = monsterState:getLastMoveTickTime(),
	DiffTimeMove = Now - LastTickMoveTime,

	libBstAI:tickAI(),

	MonsterList = monsterState:getMonsterList(),
	Fun =
		fun({Code}) ->
			try
				Type = monsterState:getCodeType(Code),
				tickByCode(Code, Type, Now, DiffTime, DiffTimeMove)
			catch
				_:Why ->
					?ERROR_OUT("Monster Tick Exception Why[~p]~n stack[~p]",
						[Why, erlang:get_stacktrace()])
			end
		end,
	lists:foreach(Fun, MonsterList),

	case DiffTime >= ?MonsterTickIntervaltwo of
		true ->
			tickDead(Now),
			delDeadList(Now),
			monsterState:setLastTickTime(Now);
		_ ->
			skip
	end,
	monsterState:setLastMoveTickTime(Now),
	ok.

tickByCode(Code, Type, Now, DiffTime, DiffTimeMove) ->
	monsterMove:shiftTo(Code),
	tickSyncEts(Code, Type, Now),
	monsterSkill:tickSkill(Type, Now, Code),
	monsterMove:tickMove(Code, DiffTimeMove),
	monsterBuff:tickBuff(Code, Now),

	%%后面的必须放在最后，因为可能会删除Code关联的进程字典，导致找不到信息
	case DiffTime >= ?MonsterTickIntervaltwo of
		true ->
			tickBySecond(Code, Type, Now);
		_ ->
			skip
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec tickBySecond(Code, Type, Now) -> ok when
	Code :: uint(),
	Type :: uint(),
	Now :: uint().
tickBySecond(Code, Type, Now) ->
	tickHp(Code, Type),
	creatureMap:searchEnemy(Type, Code),
	%%这句的必须放在最后，因为可能会删除Code关联的进程字典，导致找不到信息
	tickAliveTime(Code, Type, Now),
	ok.

%%初始化Code
-spec initCode(Type) -> uint() when
	Type :: ?InitPet | ?InitMonster | ?InitCarrier.
initCode(?InitPet) ->
	codeMgr:makeCode(?CodeTypePet);
initCode(?InitMonster) ->
	codeMgr:makeCode(?CodeTypeMonster);
initCode(?InitCarrier) ->
	codeMgr:makeCode(?CodeTypeCarrier).

%%初始化方向
-spec initFaceDir(Code) -> ok when
	Code :: uint().
initFaceDir(Code) ->
	Dir = {#posInfo{x = -1.0, y = 0.0},                    %%1 eDirection_Left
		#posInfo{x = 1.0, y = 0.0},                        %%2 eDirection_Right
		#posInfo{x = 0.0, y = 1.0},                        %%3 eDirection_Up
		#posInfo{x = -0.707107, y = 0.707107},            %%4 eDirection_LeftUp
		#posInfo{x = 0.707107, y = 0.707107},            %%5 eDirection_RightUp
		#posInfo{x = 0.0, y = -1.0},                        %%6 eDirection_Down
		#posInfo{x = -0.707107, y = -0.707107},            %%7 eDirection_LeftDown
		#posInfo{x = 0.707107, y = -0.707107}},            %%8 eDirection_RightDown
	R = misc:rand(1, 8),
	#posInfo{x = DirX, y = DirY} = erlang:element(R, Dir),
	monsterState:setFaceDir(Code, DirX, DirY),
	ok.

%%初始化存活时间
-spec initAliveTime(Code, Other) -> ok when
	Code :: uint(),
	Other :: list().
initAliveTime(_Code, [0 | _]) ->         %%永久存活
	ok;
initAliveTime(Code, [CallTime | _]) ->
	Now = time:getUTCNowMS(),
	monsterState:setMonsterAliveTime(Code, Now + CallTime).

%%初始化宿主信息
-spec initCasterInfo(Arg) -> #recCasterInfo{} when
	Arg :: #recSpawnPet{} | #recSpawnMonster{}.
initCasterInfo(#recSpawnPet{} = PetArg) ->
	#recCasterInfo{
		casterId = PetArg#recSpawnPet.caster_id,
		casterCode = PetArg#recSpawnPet.caster_code,
		casterPid = PetArg#recSpawnPet.caster_pid,
		casterType = PetArg#recSpawnPet.caster_type,
		casterPkMode = PetArg#recSpawnPet.caster_pkmode,
		casterName = PetArg#recSpawnPet.caster_name
	};
initCasterInfo(_) ->
	#recCasterInfo{
		casterId = 0,
		casterCode = 0,
		casterPid = 0,
		casterType = 0,
		casterPkMode = 0,
		casterName = ""
	}.

%%初始化宠物基本信息
-spec initPet(Code, PetArg) -> #recMapObject{} when
	Code :: uint(),
	PetArg :: #recSpawnPet{}.
initPet(Code, #recSpawnPet{} = PetArg) ->
	%%基本属性
	X = PetArg#recSpawnPet.pet_x,
	Y = PetArg#recSpawnPet.pet_y,
	ID = PetArg#recSpawnPet.pet_id,
	Props = PetArg#recSpawnPet.pet_props,
	Level = PetArg#recSpawnPet.pet_level,
	Camp = PetArg#recSpawnPet.pet_camp,
	TeamID = PetArg#recSpawnPet.pet_teamID,
	GuildID = PetArg#recSpawnPet.pet_guildID,
	GroupID = PetArg#recSpawnPet.pet_groupID,
	MapID = PetArg#recSpawnPet.pet_mapid,
	MapPid = PetArg#recSpawnPet.pet_mapPid,
	Status = PetArg#recSpawnPet.pet_status,
	Skills = PetArg#recSpawnPet.pet_skills,
	PetName = PetArg#recSpawnPet.pet_name,
	MaxHp = battleProp:getBattlePropTotalValue(Props, ?Prop_MaxHP),
	Speed = battleProp:getBattlePropTotalValue(Props, ?Prop_MoveSpeed),
	AttackSpeed = 0, %% battleProp:getBattlePropTotalValue(Props, ?Prop_attackspeed),
	%%初始化主人信息
	CasterInfo = initCasterInfo(PetArg),
	#petCfg{
		atkDelay = PetDelay,
		petType = PetType
	} = getCfg:getCfgPStack(cfg_pet, ID),
	case PetType of
		?CallPetTypeRMB ->
			monsterState:setCodeType(Code, ?SpawnPet);
		_ ->
			monsterState:setCodeType(Code, ?SpawnCallPet)
	end,

	%%初始化ETS表
	monsterState:setMapPlayerEts(Code, PetArg#recSpawnPet.pet_playerEts),
	monsterState:setMapPetEts(Code, PetArg#recSpawnPet.pet_petEts),
	monsterState:setMapMonsterEts(Code, PetArg#recSpawnPet.pet_monsterEts),

	%%初始化基本数据
	monsterState:setId(Code, ID),
	monsterState:setAttackSN(Code, 1),
	monsterState:setMapID(Code, MapID),
	monsterState:setMapPid(Code, MapPid),
	monsterState:setName(Code, PetName),
	monsterState:setLevel(Code, Level),
	monsterState:setMoveTarget(Code, X, Y),
	monsterState:setMonsterPos(Code, X, Y),
	monsterState:setSpawnInfo(Code, PetArg),
	monsterState:setCasterInfo(Code, CasterInfo),
	monsterState:setBattleProp(Code, Props),
	monsterState:setCurHp(Code, MaxHp),
	monsterState:setTeamID(Code, TeamID),
	monsterState:setMonsterList([{Code} | monsterState:getMonsterList()]),

	%%默认初始化
	monsterState:setAttackIntervalTime(Code, PetDelay),
	monsterState:setActionStatus(Code, Status),
	monsterState:setStartUseSkillTime(Code, 0),
	monsterState:setGlobalCDEndTime(Code, 0),
	monsterState:setCamp(Code, Camp),
	monsterState:setGroupID(Code, GroupID),
	monsterState:setGuildID(Code, GuildID),
	monsterState:setBuffList(Code, []),
	monsterState:setHateList(Code, []),
	monsterState:setMonsterSkill(Code, []),
	monsterState:setCurUseSkillEffect(Code, []),
	monsterState:resetStatus(Code),

	monsterSkill:initPetSkill(Code, ID, Skills),
	initAliveTime(Code, PetArg#recSpawnPet.pet_other),
	#recMapObject{
		code = Code,
		type = ?ObjTypePet,
		mapId = monsterState:getMapID(Code),
		name = PetName,
		id = ID,
		pid = self(),
		mapPid = MapPid,
		x = X,
		y = Y,
		actionStatus = Status,
		status = 0,
		level = Level,
		career = ?CareerUnknown,
		hp = erlang:trunc(MaxHp),
		maxHp = erlang:trunc(MaxHp),
		mp = 0,
		camp = Camp,
		guild = GuildID,
		groupID = GroupID,
		moveTargetList = [#pk_PosInfo{x = X, y = Y}],
		moveDir = 0,
		moveRealDir = 0,
		moveSpeed = Speed,
		attackSpeed = AttackSpeed,
		pkMode = CasterInfo#recCasterInfo.casterPkMode,
		ownId = CasterInfo#recCasterInfo.casterId,
		ownPid = CasterInfo#recCasterInfo.casterPid,
		ownCode = CasterInfo#recCasterInfo.casterCode,
		buffList = [],
		other = [CasterInfo#recCasterInfo.casterCode]
	}.

%%初始化怪物
-spec initMonster(Code, MonsterArg, Type) -> #recMapObject{} when
	Code :: uint(),
	Type :: ?InitMonster | ?InitCarrier,
	MonsterArg :: #recSpawnMonster{}.
initMonster(Code, MonsterArg, _Type) ->
	%%基本属性
	ID = MonsterArg#recSpawnMonster.id,
	X = MonsterArg#recSpawnMonster.x,
	Y = MonsterArg#recSpawnMonster.y,
	Other = MonsterArg#recSpawnMonster.other,
	Camp = MonsterArg#recSpawnMonster.camp,
	TeamID = MonsterArg#recSpawnMonster.teamID,
	GuildID = MonsterArg#recSpawnMonster.guildID,
	GroupID = MonsterArg#recSpawnMonster.groupID,
	MapID = MonsterArg#recSpawnMonster.mapID,
	MapPid = MonsterArg#recSpawnMonster.mapPid,


	BattlePropList = initProp(Code, MonsterArg),

	MaxHp = battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MaxHP),
	AttackSpeed = 0, %% battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_attackspeed),

	%%初始化ETS表
	monsterState:setMapPlayerEts(Code, MonsterArg#recSpawnMonster.playerEts),
	monsterState:setMapPetEts(Code, MonsterArg#recSpawnMonster.petEts),
	monsterState:setMapMonsterEts(Code, MonsterArg#recSpawnMonster.monsterEts),
	monsterState:setIsConvoy(Code, false),

	%%初始化基本数据
	{MoveType, Camp1, NewCasterInfo, SkillLv} =
		case Other of
			#recCallMonster{lifeTime = LifeTime, callCaster = CallCaster, caller = Caller} -> %%召唤怪物
				monsterState:setCaller(Code, Caller),
				monsterState:setCodeType(Code, ?SpawnCallMonster),
				initAliveTime(Code, [LifeTime]),
				monsterState:setCasterInfo(Code, CallCaster),
				monsterState:setBattleProp(Code, BattlePropList),
				monsterState:setCamp(Code, Camp),
				{?BST_MOVE_TARGET, Camp, CallCaster, 0};
			#recCallCarrier{skillLv = Lv, moveAi = MoveAi, lifeTime = LifeTime, battleProp = Props, callCaster = CallCaster} ->  %%载体
				monsterState:setCodeType(Code, ?SpawnCarrier),
				initAliveTime(Code, [LifeTime]),
				monsterState:setCasterInfo(Code, CallCaster),
				monsterState:setBattleProp(Code, Props),
				monsterState:setCamp(Code, Camp),
				{MoveAi, Camp, CallCaster, Lv};
			#recCallConvoy{roleID = RID, roleCode = RCode} ->    %% 护送
				CasterInfo = #recCasterInfo{
					casterId = RID, casterCode = RCode,
					casterPid = 0, casterType = 0, casterPkMode = 0, casterName = ""},
				monsterState:setCodeType(Code, ?SpawnMonster),
				initAliveTime(Code, [0]),
				monsterState:setCasterInfo(Code, CasterInfo),
				monsterState:setBattleProp(Code, BattlePropList),
				monsterState:setIsConvoy(Code, true),
				{?BST_MOVE_CONVOY, monsterState:getCamp(Code), CasterInfo, 0};
			_ ->
				%%初始化主人信息
				#monsterCfg{monsterSubType = SubType} = getCfg:getCfgPStack(cfg_monster, MonsterArg#recSpawnMonster.id),
				CasterInfo = initCasterInfo(MonsterArg),
				monsterState:setCodeType(Code, ?SpawnMonster),
				initAliveTime(Code, [0]),
				monsterState:setCasterInfo(Code, CasterInfo),
				monsterState:setBattleProp(Code, BattlePropList),
				case SubType of
					?MonsterSTypeTower ->
						{?BST_MOVE_STAND, monsterState:getCamp(Code), CasterInfo, 0};
					_ ->
						{?BST_MOVE_TARGET, monsterState:getCamp(Code), CasterInfo, 0}
				end
		end,

	InitRotW =
		case getCfg:getCfgByArgs(cfg_monster, MonsterArg#recSpawnMonster.id) of
			#monsterCfg{direction = RowW} ->
				float(RowW);
			_ ->
				0.0
		end,
	monsterState:setId(Code, MonsterArg#recSpawnMonster.id),
	monsterState:setAttackSN(Code, 1),
	monsterState:setMonsterPos(Code, X, Y),
	monsterState:setMoveTarget(Code, X, Y),
	monsterState:setCurHp(Code, MaxHp),
	monsterState:setGuildID(Code, GuildID),
	monsterState:setTeamID(Code, TeamID),
	monsterState:setMapID(Code, MapID),
	monsterState:setMapPid(Code, MapPid),
	monsterState:setMoveType(Code, MoveType),
	monsterState:setMonsterList([{Code} | monsterState:getMonsterList()]),

	%%默认初始化
	%%monsterState:setMoveOverDist(Code, 0), 没有在用，忽略
	monsterState:setStartUseSkillTime(Code, 0),
	monsterState:setGlobalCDEndTime(Code, 0),
	monsterState:setMoveStatus(Code, ?MonsterMoveStatusWalk),
	monsterState:setActionStatus(Code, ?CreatureActionStatusStand),
	monsterState:setBuffList(Code, []),
	monsterState:setHateList(Code, []),
	monsterState:setMonsterSkill(Code, []),
	monsterState:setCurUseSkillEffect(Code, []),
	monsterState:resetStatus(Code),
	monsterState:setGroupID(Code, GroupID),
	monsterState:setDirection(Code, InitRotW),
	Level =
		case monsterState:getMonsterWorldLevel(Code) of
			undefined ->
				case MonsterArg#recSpawnMonster.level of
					LevelTmp when erlang:is_integer(LevelTmp) andalso LevelTmp >= 1 ->
						monsterState:setLevel(Code, LevelTmp),
						LevelTmp;
					_ ->
						monsterState:getLevel(Code)
				end;
			Val ->
				Val
		end,

	case MonsterArg#recSpawnMonster.name of
		ValName when erlang:is_list(ValName), erlang:length(ValName) > 0 ->
			monsterState:setName(Code, ValName);
		_ ->
			skip
	end,
	Name = monsterState:getName(Code),
	Hp = monsterState:getCurHp(Code),
	Mp = monsterState:getCurMp(Code),
	Speed = monsterState:getMoveSpeed(Code),
	case monsterState:getCodeType(Code) of
		?SpawnCarrier ->
			monsterSkill:initMonsterSkill(Code, ID, SkillLv),
			Type1 = ?ObjTypeCarrier,
			Other1 = [{moveStatus, ?MonsterMoveStatusWalk},
				{subType, 1},
				{casterCode, NewCasterInfo#recCasterInfo.casterCode}];
		_ ->
			monsterSkill:initMonsterSkill(Code, ID, Level),
			Type1 = ?ObjTypeMonster,
			Other1 = [{moveStatus, ?MonsterMoveStatusWalk},
				{subType, 0},
				{casterCode, NewCasterInfo#recCasterInfo.casterCode}]
	end,
	#recMapObject{
		code = Code,
		type = Type1,
		mapId = monsterState:getMapID(Code),
		name = Name,
		id = ID,
		pid = self(),
		mapPid = MonsterArg#recSpawnMonster.mapPid,
		x = X,
		y = Y,
		rotW = InitRotW,
		actionStatus = ?CreatureActionStatusStand,
		status = 0,
		level = Level,
		career = ?CareerUnknown,
		maxHp = erlang:trunc(MaxHp),
		hp = Hp,
		mp = Mp,
		buffList = [],
		moveTargetList = [#pk_PosInfo{x = X, y = Y}],
		moveDir = 0,
		camp = Camp1,
		guild = GuildID,
		moveRealDir = 0,
		moveSpeed = Speed,
		attackSpeed = AttackSpeed,
		pkMode = NewCasterInfo#recCasterInfo.casterPkMode,
		ownId = NewCasterInfo#recCasterInfo.casterId,
		ownPid = NewCasterInfo#recCasterInfo.casterPid,
		ownCode = NewCasterInfo#recCasterInfo.casterCode,
		other = Other1,
		groupID = GroupID
	}.

%%初始化怪物属性
-spec initProp(Code, MonsterArg) -> BattlePropList when
	Code :: uint(),
	MonsterArg :: #recSpawnMonster{}, BattlePropList :: [#battleProp{}, ...].
initProp(Code, MonsterArg) ->
	#monsterCfg{
		%maxHP = MaxHp,
		maxMana = MaxMp,
		level = Level,
		faction = Faction,
		%patrolSpeed = PatrolSpeed,
		showName = Name,
		worldlevel = LevelList,
		monsterCd = SpawnCD,
		attackDelay = AttackDelay
	} = getCfg:getCfgPStack(cfg_monster, MonsterArg#recSpawnMonster.id),
	[AttackDelayMin, AttackDelayMax] = AttackDelay,
	PropList = battleProp:initMonsterBaseProp(MonsterArg#recSpawnMonster.id),
	monsterState:setName(Code, Name),
	monsterState:setLevel(Code, Level),
	monsterState:setCurMp(Code, MaxMp),
	case MonsterArg#recSpawnMonster.camp of
		Undefined when Undefined =:= undefined; Undefined =:= 0 ->
			monsterState:setCamp(Code, Faction);    %% 传参未指定阵营，使用配置阵营
		Camp ->
			monsterState:setCamp(Code, Camp)        %% 使用传参阵营
	end,
	monsterState:setSpawnInfo(Code, MonsterArg#recSpawnMonster{spawnCD = SpawnCD, code = Code}),
	monsterState:setAttackIntervalTime(Code, trunc(misc:rand(AttackDelayMin, AttackDelayMax))),
	BattlePropList0 = battleProp:initBattleProp(true),
	BattlePropList1 = battleProp:setBattlePropBaseValue(BattlePropList0, PropList),
	%%如果设置了怪物初始化战斗属性的回调函数，则会调用该函数，以允许设置怪物的基础战斗属性
	%%设置完成后，再统一进行总值计算。
	InitBattlePropCallBack = MonsterArg#recSpawnMonster.initBattlePropCallBack,
	BattlePropList2 = case erlang:is_function(InitBattlePropCallBack, 1) of
		                  true ->
			                  InitBattlePropCallBack(BattlePropList1);
		                  _ ->
			                  BattlePropList1
	                  end,
	BattlePropList3 = copyMapDemonBattle:createProp_WorldLevel(Code, LevelList, BattlePropList2),
	battleProp:calcCharBattleProp(BattlePropList3).

%%宠物创建后返回信息
-spec spawnPetAck(Code, PetArg) -> ok when
	Code :: uint(),
	PetArg :: #recSpawnPet{}.
spawnPetAck(Code, #recSpawnPet{} = PetArg) ->
	PetID = PetArg#recSpawnPet.pet_id,
	[_, Type] = PetArg#recSpawnPet.pet_other,
	CallPet = #recCallPet{
		pet_id = PetID,
		pet_pid = self(),
		pet_code = Code,
		pet_type = Type
	},
	monsterInterface:spawnPetAck(CallPet).

%%怪物或者载体创建后返回信息
-spec spawnMonsterAck(Code) -> ok when
	Code :: uint().
spawnMonsterAck(Code) ->
	PlayerEts = monsterState:getMapPlayerEts(Code),
	{X, Y} = monsterState:getMonsterPos(Code),
	{TX, TY} = monsterState:getMoveTarget(Code),
	ID = monsterState:getId(Code),
	MoveSpeed = monsterState:getMoveSpeed(Code),
	MonsterID = monsterState:getId(Code),
	CasterInfo = monsterState:getCasterInfo(Code),
	Level = monsterState:getLevel(Code),
	Camp = monsterState:getCamp(Code),
	Name = monsterState:getName(Code),
	CodeType = monsterState:getCodeType(Code),
	BuffList1 = monsterBuff:getBuffInfoList(Code),
	MaxHp = monsterState:getBattlePropTotal(Code, ?Prop_MaxHP),
	AttackSpeed = 0, %% monsterState:getBattlePropTotal(Code, ?Prop_attackspeed),
	GroupID = monsterState:getGroupID(Code),
	case getCfg:getCfgPStack(cfg_monster, MonsterID) of
		#monsterCfg{monsterBorn = [0]} ->
			Hp = monsterState:getCurHp(Code),
			Hp_Per = skill:getPercent(Hp, MaxHp),
			BuffList = [];
		#monsterCfg{monsterBorn = List} when is_list(List) ->
			Hp = monsterState:getCurHp(Code),
			Hp_Per = skill:getPercent(Hp, MaxHp),
			BuffList = List;
		#monsterCfg{} ->
			Hp = monsterState:getCurHp(Code),
			Hp_Per = skill:getPercent(Hp, MaxHp),
			BuffList = [];
		_ ->
			Hp_Per = 0,
			BuffList = []
	end,
	case CodeType of
		?SpawnCarrier ->
			Type = 1;
		_ ->
			Type = 0
	end,
	LookInfoMonster = #pk_LookInfoMonster{
		code = Code,
		id = ID,
		x = X,
		y = Y,
		rotW = monsterState:getDirection(Code),
		type = Type,
		usercode = CasterInfo#recCasterInfo.casterCode,
		targetX = TX,
		targetY = TY,
		camp = Camp,
		buffs = BuffList1,
		move_speed = MoveSpeed,
		attack_speed = AttackSpeed,
		moveStatus = ?MonsterMoveStatusWalk,
		hp_per = Hp_Per,
		groupID = GroupID,
		guildID = monsterState:getGuildID(Code),
		name = Name,
		level = Level
	},
	mapView:sendMsg2NearPlayerByPos(monsterState:getMapPid(Code), PlayerEts,
		#pk_GS2U_MonsterList{monster_list = [LookInfoMonster]}, X, Y, monsterState:getGroupID(Code)),
	%%增加初始buff
	Fun =
		fun(BuffID) ->
			monsterBuff:addBuff(Code, BuffID, Level)
		end,
	lists:foreach(Fun, BuffList),
	%%统计召唤信息
	monsterEffect:addCallInfo(CodeType, Code, CasterInfo),
	case monsterState:getCodeType(Code) of
		?SpawnCarrier ->
			%%获取载体参数
			#recSpawnMonster{other = #recCallCarrier{
				releaseAi = ReleaseType}} = monsterState:getSpawnInfo(Code),
			case ReleaseType of
				1 -> %%释放一次技能
					monsterAI:useSkill(Code);
				_ ->
					skip
			end;
		_ ->
			skip
	end.


%%tick血量
-spec tickHp(Code :: uint(), Type :: uint()) -> ok.
tickHp(Code, Type) ->
	tickHp(Code, Type, monsterState:getHateList(Code)).
tickHp(Code, Type, []) when Type =:= ?SpawnPet orelse Type =:= ?SpawnCallPet ->
	CurHp = monsterState:getCurHp(Code),
	MaxHp = trunc(monsterState:getBattlePropTotal(Code, ?Prop_MaxHP)),
	tickHp(Code, Type, CurHp, MaxHp);
tickHp(_, _, _) ->
	ok.
tickHp(Code, Type, CurHp, MaxHp) when CurHp > 0 andalso CurHp < MaxHp ->
	tickHp(Code, Type, CurHp, MaxHp, MaxHp * ?RestoreHpPer / 100);
tickHp(_, _, _, _) ->
	ok.
tickHp(Code, _Type, CurHp, MaxHp, AddHp) when CurHp + AddHp >= MaxHp ->
	monsterState:setCurHp(Code, MaxHp),
	sendPropHpPC(Code, MaxHp, MaxHp);
tickHp(Code, _Type, CurHp, MaxHp, AddHp) ->
	monsterState:setCurHp(Code, CurHp + AddHp),
	sendPropHpPC(Code, trunc(CurHp + AddHp), MaxHp).

%%发送给客户端血量信息
-spec sendPropHpPC(Code :: uint(), CurHP :: uint(), MaxHp :: uint()) -> ok.
sendPropHpPC(Code, CurHP, MaxHp) ->
	PC = skill:getPercent(CurHP, MaxHp),
	Pid = monsterState:getMapPid(Code),
	GroupID = monsterState:getGroupID(Code),
	{X, Y} = monsterState:getMonsterPos(Code),
	CasterInfo = monsterState:getCasterInfo(Code),
	PlayerEts = monsterState:getMapPlayerEts(Code),
	CasterPid = CasterInfo#recCasterInfo.casterPid,
	NearPlayerList = mapView:getMutualObject(
		Pid,
		PlayerEts,
		?ObjTypePlayer,
		{X, Y},
		GroupID
	),
	SyncHp = misc:clamp(CurHP, 0, MaxHp),
	Msg = #pk_GS2U_PlayerHp{
		code = Code,
		hp = SyncHp
	},
	Msg1 = #pk_GS2U_BroadcastPlayerHpPC{
		code = Code,
		hpPC = PC
	},
	case misc:is_process_alive(CasterPid) =:= true of
		true ->
			psMgr:sendMsg2PS(CasterPid, broadcast, Msg);
		_ ->
			skip
	end,

	[mapView:sendNetMsgToNetPid(NetPid, Msg1) || #recMapObject{netPid = NetPid} <- NearPlayerList],
	ok.


%%tick同步
-spec tickSyncEts(Code, Type, Now) -> ok when
	Code :: uint(),
	Type :: uint(),
	Now :: uint().
tickSyncEts(Code, ?SpawnPet, _Now) ->
	try
		creatureMap:syncCreatureToEts(Code)
	catch
		_:_ ->
			?ERROR_OUT("Pet[~p] syncPetToEts exception, MapPid:[~p] MapID:[~p]", [Code, monsterState:getMapPid(Code), monsterState:getMapID(Code)])
	end,
	ok;
tickSyncEts(Code, ?SpawnCallPet, _Now) ->
	try
		creatureMap:syncCreatureToEts(Code)
	catch
		_:_ ->
			?ERROR_OUT("Call Pet[~p] syncPetToEts exception , MapPid:[~p] MapID:[~p]", [Code, monsterState:getMapPid(Code), monsterState:getMapID(Code)])
	end,
	ok;
tickSyncEts(Code, ?SpawnMonster, _Now) ->
	try
		creatureMap:syncCreatureToEts(Code)
	catch
		_:_ ->
			?ERROR_OUT("Monster[~p] syncMonsterToEts exception , MapPid:[~p] MapID:[~p]", [Code, monsterState:getMapPid(Code), monsterState:getMapID(Code)])
	end,
	ok;
tickSyncEts(Code, ?SpawnCallMonster, _Now) ->
	try
		creatureMap:syncCreatureToEts(Code)
	catch
		_:_ ->
			?ERROR_OUT("CallMonster[~p] syncMonsterToEts exception , MapPid:[~p] MapID:[~p]", [Code, monsterState:getMapPid(Code), monsterState:getMapID(Code)])
	end,
	ok;
tickSyncEts(Code, ?SpawnCarrier, _Now) ->
	try
		creatureMap:syncCreatureToEts(Code)
	catch
		_:_ ->
			?ERROR_OUT("Carrier[~p] syncMonsterToEts exception  , MapPid:[~p] MapID:[~p]", [Code, monsterState:getMapPid(Code), monsterState:getMapID(Code)])
	end,
	ok;
tickSyncEts(_, _, _Now) ->
	ok.

%%tick存活时间
-spec tickAliveTime(Code, Type, Now) -> ok when
	Code :: uint(),
	Type :: uint(),
	Now :: uint().
tickAliveTime(Code, Type, Now) ->
	case monsterState:getMonsterAliveTime(Code) of
		undefined ->
			skip;
		Value ->
			case Now >= Value of
				true ->
					case Type of
						?SpawnCallPet ->
							monsterInterface:clearSpawnPet(Code);
						_ ->
							monsterInterface:clearSpawn(Code)
					end;
				_ ->
					skip
			end
	end,
	ok.

%%怪物重生
-spec tickDead(Now) -> ok when
	Now :: uint().
tickDead(Now) ->
	DeadList = monsterState:getDeadMonsterList(),
	Fun = fun(#recSpawnMonster{spawnCD = CD, deadTime = DeadTime} = SpawnData, AccIn) ->
		case CD > 0 of
			true ->
				case Now - DeadTime >= CD of
					true ->
						initCreature(?InitMonster, SpawnData),
						AccIn;
					_ ->
						[SpawnData | AccIn]
				end;
			_ ->
				AccIn
		end
	      end,
	OutList = lists:foldl(Fun, [], DeadList),
	monsterState:setDeadMonsterList(OutList).

%% 怪物死亡
-spec monsterDead(Code, CodeType) -> ok when
	Code :: uint(),
	CodeType :: ?SpawnCarrier | ?SpawnCallMonster | ?SpawnMonster | ?SpawnPet | ?SpawnCallPet.
monsterDead(Code, CodeType) when erlang:is_integer(Code) andalso Code > 0 ->
	monsterState:setActionStatus(Code, ?CreatureActionStatusDead),
	monsterAI:stopAI(Code),
	Now = time:getUTCNowMS(),
	MonsterList = monsterState:getMonsterList(),
	L1 = lists:keydelete(Code, 1, MonsterList),
	monsterState:setMonsterList(L1),
	creatureMap:delCreatureFromEts(Code, CodeType),
	addMonsterToDeadList(Code, CodeType),
	DelList = monsterState:getDelMonster(),
	monsterState:setDelMonster(lists:keystore(Code, 1, DelList, {Code, Now})).


%%增加怪物到死亡列表中
-spec addMonsterToDeadList(Code, CodeType) -> ok when
	Code :: uint(),
	CodeType :: ?SpawnCarrier | ?SpawnCallMonster | ?SpawnMonster | ?SpawnPet | ?SpawnCallPet.
addMonsterToDeadList(Code, ?SpawnMonster) ->
	DeadTime = time:getUTCNowMS(),
	SpawnInfo = monsterState:getSpawnInfo(Code),
	DeadList = monsterState:getDeadMonsterList(),
	case lists:keyfind(Code, #recSpawnMonster.code, DeadList) of
		false ->
			NewDeadList = [SpawnInfo#recSpawnMonster{deadTime = DeadTime} | DeadList],
			monsterState:setDeadMonsterList(NewDeadList);
		_ ->
			skip
	end,
	ok;
addMonsterToDeadList(_Code, _) ->
	ok.

-spec getMonsterProp(Code :: uint()) -> list().
getMonsterProp(Code) ->
	L = lists:seq(?Prop_PhysicalAttack, ?Prop_MagicAttack),
	Fun = fun(Prop, Acc) ->
		Float = monsterState:getBattlePropTotal(Code, Prop),
		[erlang:trunc(Float) | Acc]
	      end,
	lists:foldl(Fun, [], L).

