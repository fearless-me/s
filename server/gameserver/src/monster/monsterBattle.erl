%%
%% @author zhongyunawei
%% @doc @todo 怪物战斗模块.


-module(monsterBattle).
-author(zhongyuanwei).

-include("monsterPrivate.hrl").
-include("activityDef.hrl").
-define(RmbPetReviveTime, 10 * 1000).
-define(IDList, [2610, 2611, 2612, 2613, 2614]).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	attack/5,
	beAttack/3,
	dealAttackRes/4,
	delBothHate/1,
	delHate/2,
	addHate/3,
	killedTarget/6,
	treat/5,
	addTreat/3,
	setAIBattleCondEvent/1,
	clearAIBattleCondEvent/1,
	enterBattle/1,
	leaveBattle/1,
	onDead/5,
	changeNewWildBossTarget/2,
	getRealHatePidList/2
]).
%%攻击目标
-spec attack(Code :: uint(), Skill :: #recSkill{skillID :: uint()}, SN :: uint(), TargetList :: list(), IsCarrier :: false | #recCasterInfo{}) -> ok.
attack(Code, #recSkill{} = Skill, SN, TargetList, IsCarrier) ->
	%%获取攻击者名字
	GetName =
		case IsCarrier of
			false ->
				monsterState:getName(Code);
			#recCasterInfo{casterName = CasterName} ->
				CasterName
		end,
	%%获取主目标Code
	GetMainCode =
		case TargetList of
			[{_, Target, _} | _] ->
				Target#recMapObject.code;
			_ ->
				0
		end,
	%%获取攻击者类型
	GetID = monsterState:getId(Code),
	GetSkillID = Skill#recSkill.skillID,
	GetCasterInfo = monsterState:getCasterInfo(Code),
	GetCasterCode = GetCasterInfo#recCasterInfo.casterCode,
	GetType = skill:getAttackType(Code, IsCarrier, GetID),
	%%获取攻击者效果列表
%%	GetInterTime = monsterState:getFinalAttackIntervalTime(Code),
	%?DEBUG_OUT("[DebugForMonsterAI] GetSkillID:~p GetInterTime:~p", [GetSkillID, GetInterTime]),
%%	GetEffIDList = effect:getTriEffIDList(GetSkillID, GetInterTime),
	BeAttack = #recBeAttack{
		callMonsterList = monsterState:getCallMonsterList(Code),
		callCarrierList = monsterState:getCallCarrierList(Code),
		damage = Skill#recSkill.damage,
		damageMultiply = Skill#recSkill.damageMultiply,
		damagePlus = Skill#recSkill.damagePlus,
		mainCode = GetMainCode,
		isCarrier = IsCarrier,
		skillID = GetSkillID,
		skillLevel = Skill#recSkill.level,
		attackerPid = self(),
		serial = SN,
		specSkillList = [],
		attackerPkMode = 0,
		attackerEnergy = 0,
		attackerID = GetID,
		attackerCode = Code,
		attackerType = GetType,
		attackerName = GetName,
		attackerCamp = monsterState:getCamp(Code),
		attackerLevel = monsterState:getLevel(Code),
		attackerTeamID = monsterState:getTeamID(Code),
		attackerProp = monsterState:getBattleProp(Code),
		attackerGroupID = monsterState:getGroupID(Code),
		attackerGuildID = monsterState:getGuildID(Code)
	},
	attack1(TargetList, BeAttack, Code, GetCasterCode).

-spec attack1(TargetList :: list(), BeAttack :: #recBeAttack{}, MonsterCode :: uint(), CasterCode :: uint()) -> ok.
attack1([], _BeAttack, _MonsterCode, _CasterCode) ->
	ok;
attack1([{IsRan, #recMapObject{type = Type, code = Code, pid = Pid}, Times} | List], BeAttack, MonsterCode, CasterCode) ->
	case mapState:getMapSubType() of
		%% 新版骑宠领地中，无法对玩家及骑宠造成伤害
		?MapSubTypePetTerritory when Type =:= ?ObjTypePlayer; Type =:= ?ObjTypePet ->
			attack1(List, BeAttack, MonsterCode, CasterCode);
		_ ->
			if
				MonsterCode =:= Code orelse CasterCode =:= Code ->
					attack1(List, BeAttack, MonsterCode, CasterCode);
				true ->
					Hate = #recHate{
						hateCode = Code,
						hatePid = Pid,
						hateValue = 1
					},
					addKillValue(MonsterCode, Code),
					addHate(MonsterCode, Hate, BeAttack#recBeAttack.isCarrier),
					NewBeAttack = BeAttack#recBeAttack{
						targetCode = Code,
						times = Times
					},
					case Pid =:= self() of
						true ->
							beAttack(Code, Pid, NewBeAttack);
						_ ->
							psMgr:sendMsg2PS(Pid, beAttacked, {Code, NewBeAttack})
					end,
					attack1(List, BeAttack, MonsterCode, CasterCode)
			end
	end;
attack1([_ | List], BeAttack, MonsterCode, CasterCode) ->
	attack1(List, BeAttack, MonsterCode, CasterCode).

%%被攻击者受到攻击
beAttack(_MonsterCode, AttackerPid, #recBeAttack{
	attackerProp = Props,
	times = RanTimes,
	skillID = SkillID,
	skillLevel = SkillLevel,
	isCarrier = IsCarrier,
	targetCode = TargetCode,
	attackerID = AttackerID,
	mainCode = MainTargetCode,
	attackerCode = AttackerCode
} = BeAttack) ->

	gameMapAcKingBattleAll:onMarrorBeAttack(TargetCode, AttackerID, AttackerCode),
	#skillCfg{
		secTarget = SecTarget,
		skill_Hate = HateValue,
		%hit_Spec = HitJudge,
		effectTimes = Times
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	ET = battle:getAttackerTimes(false, RanTimes, Times),
	%%如果不在攻击状态，则受到攻击就停止移动
	case codeMgr:getObjectTypeByCode(TargetCode) of
		?ObjTypeMonster ->
			case monsterState:getAttackTarget(TargetCode) of
				undefined ->
					TargetID = monsterState:getId(TargetCode),
					case getCfg:getCfgPStack(cfg_monster, TargetID) of
						#monsterCfg{monsterAI = [AIType | _]} when
							AIType =:= ?AI_Type_SpecWay1;
							AIType =:= ?AI_Type_SpecWay2;
							AIType =:= ?AI_Type_SpecWayList;
							AIType =:= ?AI_Type_PassiveSpecWay;
							AIType =:= ?AI_TYPE_ConvoyPlayerFollow ->
							%%沿设置的指定路径走的AI，受攻击不中断移动
							skip;
						_ ->
							monsterMove:stopMove(TargetCode, true)
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	case ET of
		0 ->
			skip;
		_ ->
			%%判断目标是否为主目标
			IsMainTarget = battle:isMainTarget(TargetCode, MainTargetCode),
			case monsterState:getCurHp(TargetCode) > 0 of
				true ->
					%%增加杀戮人
					addKillPlayer(TargetCode, AttackerCode),
					%%产生几个效果做几次判定
					List = lists:seq(1, ET),

					DefenderLevel = monsterState:getLevel(TargetCode),
					%%攻击者
					AttackLevel = BeAttack#recBeAttack.attackerLevel,
					Func =
						fun(_, AccIn) ->
							AttackResult = battle:beJudge(
								SkillID
								, SkillLevel
								, AttackLevel
								, Props
								, DefenderLevel
								, monsterState:getBattleProp(TargetCode)
							),
							[AttackResult | AccIn]
						end,
					HitResultList = lists:foldl(Func, [], List),
					checkAIVar(TargetCode, AttackerCode, IsCarrier),
					NewBeAttack = battle:damageCalcAssistSkill(
						SkillID
						, SkillLevel
						, Props
						, monsterState:getBattleProp(TargetCode)
						, BeAttack
					),
					calcBeAttack(AttackerPid, HitResultList, NewBeAttack, HateValue, IsCarrier, IsMainTarget, SecTarget);
				_ ->
					skip
			end
	end,
	ok.

%%杀死目标
-spec killedTarget(AttackerCode, TargetCode, Msg, X, Y, BossTargetCode) -> ok when
	AttackerCode :: uint(),
	TargetCode :: uint(),
	Msg :: term(),
	X :: float(),
	Y :: float(),
	BossTargetCode :: uint().
killedTarget(AttackerCode, TargetCode, Msg, X, Y, BossTargetCode) ->
	PlayerEts = monsterState:getMapPlayerEts(AttackerCode),
	mapView:sendMsg2NearPlayerByPos(monsterState:getMapPid(AttackerCode), PlayerEts, Msg, X, Y, monsterState:getGroupID(AttackerCode)),
	CodeType = monsterState:getCodeType(AttackerCode),
	case CodeType =:= ?SpawnCarrier orelse CodeType =:= ?SpawnPet orelse CodeType =:= ?SpawnCallPet of
		true ->
			case monsterState:getCasterInfo(AttackerCode) of
				#recCasterInfo{casterPid = Pid, casterType = ?AttackerTypePlayer} ->
					psMgr:sendMsg2PS(Pid, addKillValue, {false, TargetCode, BossTargetCode});
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%%处理技能回血
-spec treat(MonsterCode, #recSkill{}, SN, TargetList, IsCarrier) -> ok when
	MonsterCode :: uint(),
	SN :: uint(),
	TargetList :: list(),
	IsCarrier :: false | #recCasterInfo{}.
treat(_MonsterCode, _Skill, _SN, [], _IsCarrier) ->
	ok;
treat(MonsterCode, #recSkill{skillID = SkillID,
	level = Level,
	damageMultiply = Multi,
	damagePlus = Plus}, SN, TargetList, IsCarrier) ->
	#skillCfg{healProperty = Prop, damageType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	AttackerCamp = monsterState:getCamp(MonsterCode),
	AttackerID = monsterState:getId(MonsterCode),
	AttackerType = skill:getAttackType(MonsterCode, IsCarrier, AttackerID),
	AttackerGroupID = monsterState:getGroupID(MonsterCode),
	AttackerGuildID = monsterState:getGuildID(MonsterCode),
	AttackerTeamID = monsterState:getTeamID(MonsterCode),
	CallMonsterList = monsterState:getCallMonsterList(MonsterCode),
	CallCarrierList = monsterState:getCallCarrierList(MonsterCode),
	HealthFactor = monsterState:getBattlePropTotal(MonsterCode, ?Prop_HealthFactor),
	MaxHp = monsterState:getBattlePropTotal(MonsterCode, ?Prop_MaxHP),
	case Type of
		?SkillDamageTypeMedicine ->
			ProValue = monsterState:getBattlePropTotal(MonsterCode, Prop);
		_ ->
			ProValue = 0
	end,
	CurHp = monsterState:getCurHp(MonsterCode),
	Hp_Per = skill:getPercent(CurHp, MaxHp),

	case IsCarrier of
		#recCasterInfo{casterName = CasterName} ->
			Name = CasterName;
		false ->
			Name = monsterState:getName(MonsterCode)
	end,
	BPList = monsterState:getBattleProp(MonsterCode),
	%%技能效果ID列表
	IntervalTime = monsterState:getFinalAttackIntervalTime(MonsterCode),
	EffIDList = effect:getTriEffIDList(SkillID, IntervalTime),
	[MainTarget | _] = TargetList,
	TotalTreat = erlang:trunc((ProValue * Multi + Plus) * HealthFactor * misc:rand(0.9, 1.1)),
	RecBeTreat = #recBeTreat{skillID = SkillID,
		level = Level,
		serial = SN,
		attackerCode = MonsterCode,
		attackerName = Name,
		attackerID = AttackerID,
		attackerLevel = monsterState:getLevel(MonsterCode),
		attackerType = AttackerType,
		attackerCamp = AttackerCamp,
		attackerGroupID = AttackerGroupID,
		attackerGuildID = AttackerGuildID,
		attackerTeamID = AttackerTeamID,
		attackerPkMode = 0,
		attackerEnergy = 0,
		attackerPid = self(),
		attackerProp = BPList,
		callMonsterList = CallMonsterList,
		callCarrierList = CallCarrierList,
		mainTarget = MainTarget#recMapObject.code,
		effectList = EffIDList,
		isCarrier = IsCarrier,
		skillTotalTreat = TotalTreat
	},
	Fun = fun(#recMapObject{code = Code, pid = TargetPid}) when erlang:is_pid(TargetPid) ->
		case MonsterCode =:= Code of
			true ->
				addTreat(MonsterCode, RecBeTreat, Hp_Per);
			_ ->
				psMgr:sendMsg2PS(TargetPid, beTreat, {Code, RecBeTreat, Hp_Per})
		end
	      end,
	lists:foreach(Fun, TargetList).

%%玩家技能回血并通知客服端
-spec addTreat(Code :: uint(), #recBeTreat{}, AHp_Per :: uint()) -> ok.
addTreat(Code, #recBeTreat{
	skillTotalTreat = TreatValue,
	attackerCode = AttackerCode,
	attackerName = AttackerName,
	attackerID = AttackerID,
	attackerLevel = AttackerLevel,
	attackerPid = AttackerPid,
	attackerProp = AttackerProp,
	attackerCamp = AttackerCamp,
	attackerGroupID = AttackerGroupID,
	attackerGuildID = AttackerGuildID,
	attackerTeamID = AttackerTeamID,
	attackerType = AttackerType,
	attackerPkMode = AttackerPkMode,
	attackerEnergy = AttackerEnergy,
	callMonsterList = CallMonsterList,
	callCarrierList = CallCarrierList,
	effectList = EffIDList,
	skillID = SkillID,
	level = SkillLevel,
	serial = Serial,
	isCarrier = IsCarrier
}, AHp_Per) ->
	OldHp = monsterState:getCurHp(Code),
	case OldHp > 0 of
		true ->
			IDList = globalCfg:getFirstBloodMonster(),
			case lists:member(monsterState:getId(Code), IDList) of
				true ->
					skip;
				_ ->
					{X, Y} = monsterState:getMonsterPos(Code),

					%%构造执行效果所需要的record
					RecEffect = #recSkillEffect
					{
						skillID = SkillID,
						level = SkillLevel,
						serial = Serial,
						targetCode = Code,
						isCarrier = IsCarrier,
						attackerID = AttackerID,
						attackerLevel = AttackerLevel,
						attackerEnergy = AttackerEnergy,
						attackerCode = AttackerCode,
						attackerCamp = AttackerCamp,
						attackerGroupID = AttackerGroupID,
						attackerGuildID = AttackerGuildID,
						attackerTeamID = AttackerTeamID,
						attackerType = AttackerType,
						attackerName = AttackerName,
						attackerPkMode = AttackerPkMode,
						attackerPid = AttackerPid,
						attackerProp = AttackerProp,
						callMonsterList = CallMonsterList,
						callCarrierList = CallCarrierList
					},

					%%获取技能效果列表
					EffectList = effect:getEffList(EffIDList),
					[monsterEffect:skillEffectRes(Code, Effect, RecEffect) || Effect <- EffectList],

					%%构造治疗结果record
					MaxHp = monsterState:getBattlePropTotal(Code, ?Prop_MaxHP),
					GetHealthFactor = monsterState:getBattlePropTotal(Code, ?Prop_GetHealthFactor),
					NewTreatValue = erlang:trunc(TreatValue * GetHealthFactor),
					NewTreatValue1 = misc:clamp(NewTreatValue, 0, MaxHp),
					CurHp = misc:clamp(OldHp + NewTreatValue1, 0, MaxHp),
					DiffHp = erlang:trunc(CurHp - OldHp),
					Hp_Per = skill:getPercent(CurHp, MaxHp),
					monsterState:setCurHp(Code, CurHp),
					AttackResultList = [#pk_AttackResultList{type = ?RestoreHp, value = 0},
						#pk_AttackResultList{type = ?BackHp, value = 0}],
					TreatMsg = #pk_GS2U_AttackResult
					{
						userCode = AttackerCode,
						targetCode = Code,
						skillId = SkillID,
						serial = Serial,
						result = [?HitResultTreat],
						damageHp = [NewTreatValue1],
						ahp_per = AHp_Per,
						bhp_per = Hp_Per,
						diffHp = DiffHp,
						arList = AttackResultList
					},
					broadcastAttackResult(Code, TreatMsg, X, Y)
			end;
		_ ->
			skip
	end,
	ok.

-spec setAIBattleCondEvent(Code) -> ok when
	Code :: uint().
setAIBattleCondEvent(Code) ->
	monsterState:setInAttackRange(Code, true),
	monsterAI:setAIEvent(Code, ?BSTCondVar_IsTargetExist, 1),
	monsterAI:setAIEvent(Code, ?BSTCondVar_IsTargetAlive, 1),
	monsterAI:setAIEvent(Code, ?BSTCondVar_IsSelfAlive, 1),
	monsterAI:setAIEvent(Code, ?BSTCondVar_HasTarget, 1),
	ok.

-spec clearAIBattleCondEvent(Code) -> ok when
	Code :: uint().
clearAIBattleCondEvent(Code) ->
	monsterState:setInAttackRange(Code, false),
	monsterAI:setAIEvent(Code, ?BSTCondVar_IsTargetExist, 0),
	monsterAI:setAIEvent(Code, ?BSTCondVar_IsTargetAlive, 0),
	monsterAI:setAIEvent(Code, ?BSTCondVar_IsSelfAlive, 0),
	monsterAI:setAIEvent(Code, ?BSTCondVar_HasTarget, 0),
	monsterAI:setAIEvent(Code, ?BSTCondVar_IsBeAttacked, 0),
	ok.

-spec enterBattle(Code) -> ok when
	Code :: uint().
enterBattle(Code) ->
	%%monsterAI:setAIEvent(Code, ?BSTCondVar_IsAttackCD, 0),
	setAIBattleCondEvent(Code),
	ok.

-spec leaveBattle(Code) -> ok when
	Code :: uint().
leaveBattle(Code) ->
	clearAIBattleCondEvent(Code),
	_MapID = monsterState:getMapID(Code),
	monsterState:setTimerSelTargetTime(Code, 0),
	monsterState:setBossSelSkillTime(Code, undefined),
	monsterState:setAttackTarget(Code, undefined),
	monsterState:setFirstAttacker(Code, undefined),
	mapWildBoss:updateWildBossCode(Code),
	autoReturnHp(Code),
	ok.

%%怪物离战自动回血
-spec autoReturnHp(Code) -> ok when
	Code :: uint().
autoReturnHp(Code) ->
	CurHp = monsterState:getCurHp(Code),
	AcStatus = monsterState:getActionStatus(Code),
	case AcStatus =:= ?CreatureActionStatusDead orelse CurHp =< 0 of
		true ->
			ok;
		_ ->
			MonID = monsterState:getId(Code),
			if
				is_number(MonID) ->
					case getCfg:getCfgByKey(cfg_monster, MonID) of
						#monsterCfg{needrecover = NeedRecover} ->
							MaxHp = monsterState:getBattlePropTotal(Code, ?Prop_MaxHP),
							case NeedRecover of
								1 ->
									monsterState:setCurHp(Code, MaxHp),
									broadCastCurHp(Code);
								_ ->
									skip
							end;
						_ ->
							?ERROR_OUT("autoReturnHp---x,code[~p],id=~p,mapid=~p,mapPid=~p,status=~p, hp=~p",
								[Code, MonID, monsterState:getMapID(Code), monsterState:getMapPid(Code), AcStatus, CurHp])
					end;
				true ->
					skip
			end
	end.

%%向客服端广播当前血量
-spec broadCastCurHp(Code) -> ok when
	Code :: uint().
broadCastCurHp(Code) ->
	CurHp = monsterState:getCurHp(Code),
	MaxHp = monsterState:getBattlePropTotal(Code, ?Prop_MaxHP),
	PlayerEts = monsterState:getMapPlayerEts(Code),
	{X, Y} = monsterState:getMonsterPos(Code),
	MapPid = monsterState:getMapPid(Code),
	PC = skill:getPercent(CurHp, MaxHp),
	Msg = #pk_GS2U_BroadcastPlayerHpPC{code = Code, hpPC = PC},
	mapView:sendMsg2NearPlayerByPos(MapPid, PlayerEts, Msg, X, Y, monsterState:getGroupID(Code)),
	ok.
%% ====================================================================
%% Internal functions
%% ====================================================================
checkAIVar(Code, _AttackerCode, #recCasterInfo{casterCode = CasterCode}) ->
	PlayerEts = monsterState:getMapPlayerEts(Code),
	MonsterEts = monsterState:getMapMonsterEts(Code),
	PetEts = monsterState:getMapPetEts(Code),
	MapID = monsterState:getMapID(Code),
	case mapView:getMapObjectFromEts(CasterCode, {PlayerEts, MonsterEts, PetEts}) of
		#recMapObject{hp = Hp, mapId = CasterMapID} ->
			case Hp =< 0 orelse CasterMapID =/= MapID of
				true ->
					ok;
				_ ->
					checkAIVar(Code, CasterCode, false)
			end;
		_ ->
			ok
	end;
checkAIVar(Code, AttackerCode, _) ->
	monsterAI:setAIEvent(Code, ?BSTCondVar_IsBeAttacked, 1),
	PlayerEts = monsterState:getMapPlayerEts(Code),
	case monsterState:getFirstAttacker(Code) of
		0 ->
			monsterState:setFirstAttacker(Code, AttackerCode);
		FirstAttacker ->
			case myEts:lookUpEts(PlayerEts, FirstAttacker) of
				[] ->
					monsterState:setFirstAttacker(Code, AttackerCode);
				_ ->
					skip
			end
	end,
	ok.

-spec calcBeAttack(AttackerPid, HitResultList, #recBeAttack{}, HateValue, IsCarrier, IsMainTarget, SecTarget) -> ok when
	AttackerPid :: pid(),
	HitResultList :: list(),
	HateValue :: number(),
	IsCarrier :: boolean(),
	IsMainTarget :: boolean(),
	SecTarget :: float().
calcBeAttack(AttackerPid, HitResultList, #recBeAttack{} = BeAttack, HateValue, _IsCarrier, IsMainTarget, SecTarget) ->
	TargetCode = BeAttack#recBeAttack.targetCode,
	%%一血怪物特殊处理不走伤害计算流程
	IDList = globalCfg:getFirstBloodMonster(),
	case lists:member(monsterState:getId(TargetCode), IDList) of
		true ->
			calcActMonster(BeAttack);
		_ ->
			calcBeAttackDamage(AttackerPid, HitResultList, BeAttack, IsMainTarget, SecTarget, HateValue)
	end.

%%一血怪物特殊处理
calcActMonster(#recBeAttack{attackerCamp = Camp, targetCode = Code,
	attackerCode = AttackerCode, attackerPid = AttackerPid, isCarrier = IsCarrier} = BeAttack) ->
	%%构造仇恨
	Hate = #recHate{hateCode = AttackerCode,
		hatePid = AttackerPid},
	addHate(Code, Hate, IsCarrier),

	CfgHp = globalCfg:getMonsterBlood(),
	%%统计血量
	{RedCamp, BlueCamp} = monsterState:getMonsterHpStat(Code),
	case Camp of
		?CampRedBattle ->
			Stat = {RedCamp + CfgHp, BlueCamp},
			monsterState:setMonsterHpStat(Code, Stat);
		?CampBlueBattle ->
			Stat = {RedCamp, BlueCamp + CfgHp},
			monsterState:setMonsterHpStat(Code, Stat);
		_ ->
			skip
	end,
	RealDamageList = [-CfgHp],
	HitResultList = [?HitResultOrdinary],
	OldHp = monsterState:getCurHp(Code),
	case OldHp - CfgHp > 0 of
		true ->
			monsterState:setCurHp(Code, OldHp - CfgHp);
		_ ->
			monsterState:setCurHp(Code, 0)
	end,
	{TargetX, TargetY} = monsterState:getMonsterPos(Code),
	TargetID = monsterState:getId(Code),
	Name = monsterState:getName(Code),
	Type = codeMgr:getObjectTypeByCode(Code),
	%%构造执行效果所需要的record
	RecEffect = #recSkillEffect
	{
		targetX = TargetX,
		targetY = TargetY,
		targetID = TargetID,
		targetPid = self(),
		targetCode = Code,
		targetType = Type,
		targetDamageList = RealDamageList,
		serial = BeAttack#recBeAttack.serial,
		skillID = BeAttack#recBeAttack.skillID,
		level = BeAttack#recBeAttack.skillLevel,
		isCarrier = BeAttack#recBeAttack.isCarrier,
		targetMainCode = BeAttack#recBeAttack.mainCode,
		callMonsterList = BeAttack#recBeAttack.callMonsterList,
		callCarrierList = BeAttack#recBeAttack.callCarrierList,
		attackerID = BeAttack#recBeAttack.attackerID,
		attackerLevel = BeAttack#recBeAttack.attackerLevel,
		attackerPid = BeAttack#recBeAttack.attackerPid,
		attackerCode = BeAttack#recBeAttack.attackerCode,
		attackerCamp = BeAttack#recBeAttack.attackerCamp,
		attackerGroupID = BeAttack#recBeAttack.attackerGroupID,
		attackerGuildID = BeAttack#recBeAttack.attackerGuildID,
		attackerTeamID = BeAttack#recBeAttack.attackerTeamID,
		attackerType = BeAttack#recBeAttack.attackerType,
		attackerName = BeAttack#recBeAttack.attackerName,
		attackerProp = BeAttack#recBeAttack.attackerProp,
		attackerEnergy = BeAttack#recBeAttack.attackerEnergy,
		attackerPkMode = BeAttack#recBeAttack.attackerPkMode
	},

	%%构造被攻击者数据
	ATD = #recAttackTargetDamage{
		skillID = BeAttack#recBeAttack.skillID,
		serial = BeAttack#recBeAttack.serial,
		attackerCode = BeAttack#recBeAttack.attackerCode,
		attackerHit = HitResultList,
		targetCode = Code,
		targetName = Name,
		targetPid = self(),
		targetID = TargetID,
		targetDamageList = RealDamageList,
		totalDamageBack = 0
	},

	%%更新效果伤害百分比(不能更改顺序,必须要在效果包后面)
	CurHp = monsterState:getCurHp(Code),
	MaxHp = monsterState:getBattlePropTotal(Code, ?Prop_MaxHP),
	Hp_Per = skill:getPercent(CurHp, MaxHp),
	DiffHp = erlang:trunc(CurHp - OldHp),
	DamageMsg = #pk_GS2U_AttackResult{
		diffHp = DiffHp,
		userCode = BeAttack#recBeAttack.attackerCode,
		targetCode = Code,
		skillId = BeAttack#recBeAttack.skillID,
		serial = BeAttack#recBeAttack.serial,
		result = HitResultList,
		damageHp = RealDamageList,
		bhp_per = Hp_Per
	},
	?DEBUG_OUT("DamageMsg=~p", [DamageMsg]),
	MapID = monsterState:getMapID(Code),

	monsterBeHurt(isStatHurt(MapID), MapID,
		BeAttack#recBeAttack.attackerCode,
		BeAttack#recBeAttack.attackerPid,
		BeAttack#recBeAttack.attackerID,
		Code, TargetID,
		DamageMsg#pk_GS2U_AttackResult.diffHp
	),
	case BeAttack#recBeAttack.attackerPid =:= self() of
		true ->
			dealAttackRes([], RecEffect, ATD, DamageMsg);
		_ ->
			psMgr:sendMsg2PS(BeAttack#recBeAttack.attackerPid, attackRes, {BeAttack#recBeAttack.attackerCode, [], DamageMsg, RecEffect, ATD})
	end,
	%%检查是否死亡
	case CurHp =:= 0 of
		true ->
			monsterState:setCurHp(Code, 0),
			onDead(Code, BeAttack#recBeAttack.attackerPid, BeAttack#recBeAttack.attackerCode, BeAttack#recBeAttack.attackerName, BeAttack#recBeAttack.skillID);
		_ ->
			skip
	end.

-spec calcBeAttackDamage(AttackerPid, HitResultList, #recBeAttack{}, IsMainTarget, SecTarget, HateValue) -> ok when
	AttackerPid :: pid(), HitResultList :: list(), IsMainTarget :: boolean(), SecTarget :: float(), HateValue :: uint().
calcBeAttackDamage(AttackerPid, HitResultList, #recBeAttack{} = BeAttack, IsMainTarget, _SecTarget, _HateValue) ->
	SkillID = BeAttack#recBeAttack.skillID,
	TargetCode = BeAttack#recBeAttack.targetCode,
	AttackerCode = BeAttack#recBeAttack.attackerCode,
	AttackerName = BeAttack#recBeAttack.attackerName,
	IsCarrier = BeAttack#recBeAttack.isCarrier,
	OldHp = monsterState:getCurHp(TargetCode),
	RealDamageList = calcSkillDamageToTarget(TargetCode, BeAttack, HitResultList),
	%%构造仇恨
	Hate = #recHate{hateCode = AttackerCode,
		hatePid = AttackerPid},
	addHate(TargetCode, Hate, IsCarrier),
	%%处理效果
	calcSkillEffect(BeAttack, HitResultList, 0, RealDamageList, IsMainTarget, OldHp),
	CurHp = monsterState:getCurHp(TargetCode),
	%%检查是否死亡
	case CurHp =:= 0 of
		true ->
			monsterState:setCurHp(TargetCode, 0),
			onDead(TargetCode, AttackerPid, AttackerCode, AttackerName, SkillID);
		_ ->
			skip
	end,
	ok.

-spec calcSkillEffect(#recBeAttack{}, HitResultList, DamageBack, RealDamageList, IsMainTarget, OldHp) -> ok when
	HitResultList :: list(),
	DamageBack :: number(),
	RealDamageList :: list(),
	IsMainTarget :: boolean(),
	OldHp :: uint().
calcSkillEffect(
	#recBeAttack{targetCode = TargetCode} = BeAttack,
	HitResultList,
	DamageBack,
	RealDamageList,
	IsMainTarget,
	OldHp
) ->
	{TargetX, TargetY} = monsterState:getMonsterPos(TargetCode),
	TargetPid = self(),
	TargetID = monsterState:getId(TargetCode),
	Type = codeMgr:getObjectTypeByCode(TargetCode),
	Name = monsterState:getName(TargetCode),
	%%构造执行效果所需要的record
	RecEffect = #recSkillEffect
	{
		targetX = TargetX,
		targetY = TargetY,
		targetID = TargetID,
		targetPid = TargetPid,
		targetCode = TargetCode,
		targetType = Type,
		targetDamageList = RealDamageList,
		serial = BeAttack#recBeAttack.serial,
		skillID = BeAttack#recBeAttack.skillID,
		level = BeAttack#recBeAttack.skillLevel,
		isCarrier = BeAttack#recBeAttack.isCarrier,
		targetMainCode = BeAttack#recBeAttack.mainCode,
		callMonsterList = BeAttack#recBeAttack.callMonsterList,
		callCarrierList = BeAttack#recBeAttack.callCarrierList,
		attackerID = BeAttack#recBeAttack.attackerID,
		attackerLevel = BeAttack#recBeAttack.attackerLevel,
		attackerPid = BeAttack#recBeAttack.attackerPid,
		attackerCode = BeAttack#recBeAttack.attackerCode,
		attackerCamp = BeAttack#recBeAttack.attackerCamp,
		attackerGroupID = BeAttack#recBeAttack.attackerGroupID,
		attackerGuildID = BeAttack#recBeAttack.attackerGuildID,
		attackerTeamID = BeAttack#recBeAttack.attackerTeamID,
		attackerType = BeAttack#recBeAttack.attackerType,
		attackerName = BeAttack#recBeAttack.attackerName,
		attackerProp = BeAttack#recBeAttack.attackerProp,
		attackerEnergy = BeAttack#recBeAttack.attackerEnergy,
		attackerPkMode = BeAttack#recBeAttack.attackerPkMode
	},

	%%构造被攻击者数据
	ATD = #recAttackTargetDamage{
		skillID = BeAttack#recBeAttack.skillID,
		serial = BeAttack#recBeAttack.serial,
		attackerCode = BeAttack#recBeAttack.attackerCode,
		attackerHit = HitResultList,
		targetCode = TargetCode,
		targetName = Name,
		targetPid = TargetPid,
		targetID = TargetID,
		targetDamageList = RealDamageList,
		totalDamageBack = DamageBack
	},

	%%分离攻击者和被攻击者的效果列表
	GetInterTime = monsterState:getFinalAttackIntervalTime(TargetCode),
	EffIDList = effect:getTriEffIDList(BeAttack#recBeAttack.skillID, GetInterTime),
	[AttackEffect, BeAttackEffect] = effect:skillEffect(HitResultList, EffIDList, IsMainTarget),
	[monsterEffect:skillEffectRes(TargetCode, Effect, RecEffect) || Effect <- BeAttackEffect],

	%%更新效果伤害百分比(不能更改顺序,必须要在效果包后面)
	CurHp = monsterState:getCurHp(TargetCode),
	MaxHp = monsterState:getBattlePropTotal(TargetCode, ?Prop_MaxHP),
	Hp_Per = skill:getPercent(CurHp, MaxHp),
	DiffHp = erlang:trunc(CurHp - OldHp),
	MapID = monsterState:getMapID(TargetCode),
	DamageMsg = #pk_GS2U_AttackResult{
		diffHp = DiffHp,
		userCode = BeAttack#recBeAttack.attackerCode,
		targetCode = TargetCode,
		skillId = BeAttack#recBeAttack.skillID,
		serial = BeAttack#recBeAttack.serial,
		result = HitResultList,
		damageHp = RealDamageList,
		bhp_per = Hp_Per
	},
	%%同步血量
	case MapID of
		?CrosHdBattleMapID ->
			[RedHourseID, BlueHourseID] = globalCfg:getBattleWarCarriage(),
			case TargetID =:= RedHourseID orelse TargetID =:= BlueHourseID of
				true ->
					%%Old_Per = monsterState:getHourseHpStat(TargetCode),
					psMgr:sendMsg2PS(?PsNameCrosHd, horseHp, {self(), Hp_Per});
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	monsterBeHurt(isStatHurt(MapID), MapID,
		BeAttack#recBeAttack.attackerCode,
		BeAttack#recBeAttack.attackerPid,
		BeAttack#recBeAttack.attackerID,
		TargetCode, TargetID,
		-lists:sum(RealDamageList)
	),
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%% begin 【野外BOSS优化改动】 20160913
	%% 参照worldboss（首领入侵）相关模块，wildboss（野外BOSS）相关模块也需要记录玩家伤害
	%% 因两处功能代码结构不同，故不能完全照搬，但伤害数据源头都来自于这里
	case monsterState:getCodeType(TargetCode) of
		?SpawnMonster ->
			mapWildBoss:recordDamageValue(
				true,
				BeAttack#recBeAttack.attackerCode,
				BeAttack#recBeAttack.attackerID,
				BeAttack#recBeAttack.attackerPid,
				BeAttack#recBeAttack.attackerName,
				TargetCode,
				DamageMsg#pk_GS2U_AttackResult.diffHp
			);
		_ ->
			skip
	end,
	%% end 【野外BOSS优化改动】
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%通知攻击者执行效果,并广播伤害
	case BeAttack#recBeAttack.attackerPid =:= self() of
		true ->
			dealAttackRes(AttackEffect, RecEffect, ATD, DamageMsg);
		_ ->
			psMgr:sendMsg2PS(BeAttack#recBeAttack.attackerPid, attackRes, {BeAttack#recBeAttack.attackerCode, AttackEffect, DamageMsg, RecEffect, ATD})
	end.

%% 怪物受到伤害
monsterBeHurt(true, MapID, AttackCode, AttackPid, AttackID, TargetCode, TargetID, DiffHP) ->
	AttackType = codeMgr:getObjectTypeByCode(AttackCode),
	{RealAttackOwnerID, RealAttackOwnerPid} =
		case AttackType of
			?ObjTypePlayer ->
				{AttackID, AttackPid};
			?ObjTypePet ->
				PetEts = monsterState:getMapPetEts(TargetCode),
				case myEts:lookUpEts(PetEts, AttackCode) of
					[#recMapObject{ownId = EtsOwnId, ownCode = EtsOwnCode1} | _] ->
						%%根据附属字段的ownCode找创建者信息
						PlayerEts = monsterState:getMapPlayerEts(TargetCode),
						case myEts:lookUpEts(PlayerEts, EtsOwnCode1) of
							[#recMapObject{pid = EtsOwnPid1}] ->
								{EtsOwnId, EtsOwnPid1};
							_ ->
								{EtsOwnId, skip}
						end;
					_ ->
						{false, skip}
				end;
			_ ->
				MonsterEts = monsterState:getMapMonsterEts(TargetCode),
				case myEts:lookUpEts(MonsterEts, AttackCode) of
					[#recMapObject{ownId = EtsOwnId, ownCode = EtsOwnCode} | _] ->
						%%根据附属字段的ownCode找创建者信息
						PlayerEts = monsterState:getMapPlayerEts(TargetCode),
						case myEts:lookUpEts(PlayerEts, EtsOwnCode) of
							[#recMapObject{pid = EtsOwnPid}] ->
								{EtsOwnId, EtsOwnPid};
							_ ->
								{EtsOwnId, skip}
						end;
					_ ->
						{false, skip}
				end
		end,
	case RealAttackOwnerID /= false of
		true ->
			gameMapActivityLogic:hurtMonster(RealAttackOwnerID, TargetCode, TargetID, erlang:abs(DiffHP));
		_ ->
			skip
	end,
	case RealAttackOwnerPid =/= skip of
		true ->
			psMgr:sendMsg2PS(RealAttackOwnerPid, statHurt, {MapID, DiffHP, AttackType, AttackID});
		_ ->
			skip
	end;
monsterBeHurt(_, _MapID, _AttackCode, _AttackPid, _AttackID, _TargetCode, _TargetID, _DiffHP) ->
	skip.

isStatHurt(?CrosArenaMapID1) ->
	true;
isStatHurt(?CrosArenaMapID2) ->
	true;
isStatHurt(?CrosArenaMapID3) ->
	true;
isStatHurt(?HDBattleMapID) ->
	true;
isStatHurt(?GuildBattleMapID) ->
	true;
isStatHurt(?EscortMapID) ->
	true;
isStatHurt(?GuildWarMapID) ->
	true;
isStatHurt(MapID) ->
	case MapID =:= ?KingFightAllMapID of
		true -> true;
		false ->
			#mapsettingCfg{
				type = Type
			} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
			if
				Type =:= ?MapTypeActivity ->
					true;
				true ->
					false
			end
	end.

-spec isRecordDamage(Code :: uint(), MapID :: uint()) -> boolean().
isRecordDamage(Code, ?WorldBossMapID) ->
	case monsterState:getCodeType(Code) of
		?SpawnMonster ->
			true;
		_ ->
			false
	end;
isRecordDamage(_, _) ->
	false.

%% 怪物死亡
monsterDead(AttackCode, TargetCode) ->
	Camp = monsterState:getCamp(TargetCode),
	MonsterID = monsterState:getId(TargetCode),
	MapPid = monsterState:getMapPid(TargetCode),
	RealAttackOwnerID =
		case codeMgr:getObjectTypeByCode(AttackCode) of
			?ObjTypePlayer ->
				PlayerEts = monsterState:getMapPlayerEts(TargetCode),
				case myEts:lookUpEts(PlayerEts, AttackCode) of
					[#recMapObject{id = RoleID} | _] ->
						RoleID;
					_ ->
						0
				end;
			?ObjTypePet ->
				PetEts = monsterState:getMapPetEts(TargetCode),
				case myEts:lookUpEts(PetEts, AttackCode) of
					[#recMapObject{ownId = EtsOwnId} | _] ->
						EtsOwnId;
					_ ->
						0
				end;
			?ObjTypeCarrier ->
				MonsterEts = monsterState:getMapMonsterEts(TargetCode),
				case myEts:lookUpEts(MonsterEts, AttackCode) of
					[#recMapObject{ownId = EtsOwnId} | _] ->
						EtsOwnId;
					_ ->
						0
				end;
			_ ->
				0
		end,
	case RealAttackOwnerID > 0 of
		true ->
			%%杀死守卫
			[RedGuardID, BlueGuardID] = globalCfg:getBattleWarGuard(),
			case MonsterID =:= RedGuardID orelse MonsterID =:= BlueGuardID of
				true ->
					psMgr:sendMsg2PS(?PsNameCrosHd, killedGuard, {MapPid, Camp});
				_ ->
					skip
			end,

			%%杀死水晶
			MaxOreList = globalCfg:getBattleWarOreMax(),
			OreList = globalCfg:getBattleWarOre(),
			case lists:keyfind(MonsterID, 3, MaxOreList ++ OreList) of
				{_, _, MonsterID, _} ->
					{RedCamp, BlueCamp} = monsterState:getMonsterHpStat(TargetCode),
					case RedCamp > BlueCamp of
						true ->
							psMgr:sendMsg2PS(?PsNameCrosHd, killedCryStal, {RealAttackOwnerID, MapPid, MonsterID, TargetCode, ?CampRedBattle});
						_ ->
							psMgr:sendMsg2PS(?PsNameCrosHd, killedCryStal, {RealAttackOwnerID, MapPid, MonsterID, TargetCode, ?CampBlueBattle})
					end;
				_ ->
					skip
			end,

			%%杀死马车
			[RedHourseID, BlueHourseID] = globalCfg:getBattleWarCarriage(),
			if
				MonsterID =:= RedHourseID ->
					psMgr:sendMsg2PS(?PsNameCrosHd, killedHorse, {MapPid, ?CampRedBattle});
				MonsterID =:= BlueHourseID ->
					psMgr:sendMsg2PS(?PsNameCrosHd, killedHorse, {MapPid, ?CampBlueBattle});
				true ->
					skip
			end,

			gameMapActivityLogic:killMonster(RealAttackOwnerID, TargetCode, MonsterID);
		_ ->
			gameMapActivityLogic:killMonster(RealAttackOwnerID, TargetCode, MonsterID)
	end,
	ok.

%%攻击者处理效果
-spec dealAttackRes(AttackEffect, RecEffect, ATD, DamageMsg) -> ok when
	AttackEffect :: list(),
	RecEffect :: #recSkillEffect{},
	ATD :: #recAttackTargetDamage{},
	DamageMsg :: #pk_GS2U_AttackResult{}.
dealAttackRes(AttackEffect, #recSkillEffect{
	targetX = X,
	targetY = Y,
	skillID = SkillID,
	attackerCode = Code} = RecEffect,
	#recAttackTargetDamage{
		targetPid = TargetPid,
		targetName = TargetName,
		totalDamageBack = BackDamage,
		targetCode = TargetCode
	}, #pk_GS2U_AttackResult{} = DamageMsg) ->
	FilterEffect = monsterEffect:filterEffect(Code, AttackEffect),
	[monsterEffect:skillEffectRes(Code, Effect, RecEffect) || Effect <- FilterEffect],
	%%checkAIVar(Code, TargetCode, false),
	%%计算伤害和击中回血
	%%RestoreHp = calcAttackRestoreHp(Code, SkillID, SN, TargetDamageList),
	OldHp = monsterState:getCurHp(Code),
	case OldHp of
		undefined ->
			?ERROR_OUT("creature code [~p] has call back", [Code]);
		_ ->
			case OldHp > 0 of
				true ->
					IDList = globalCfg:getFirstBloodMonster(),
					case lists:member(monsterState:getId(Code), IDList) of
						true ->
							CurHp = OldHp,
							MaxHp = monsterState:getBattlePropTotal(Code, ?Prop_MaxHP),
							Hp_Per = skill:getPercent(CurHp, MaxHp),
							AttackResultList = [
								#pk_AttackResultList{type = ?RestoreHp, value = 0},
								#pk_AttackResultList{type = ?BackHp, value = 0}
							],
							NewDamageMsg = DamageMsg#pk_GS2U_AttackResult{
								arList = AttackResultList,
								ahp_per = Hp_Per
							},
							broadcastAttackResult(Code, NewDamageMsg, X, Y);
						_ ->
							CurHp = OldHp + 0 - BackDamage,
							MaxHp = monsterState:getBattlePropTotal(Code, ?Prop_MaxHP),
							Hp_Per = skill:getPercent(CurHp, MaxHp),
							AttackResultList = [
								#pk_AttackResultList{type = ?RestoreHp, value = 0},
								#pk_AttackResultList{type = ?BackHp, value = BackDamage}
							],
							NewDamageMsg = DamageMsg#pk_GS2U_AttackResult{
								arList = AttackResultList,
								ahp_per = Hp_Per
							},
							broadcastAttackResult(Code, NewDamageMsg, X, Y),
							case CurHp > 0 of
								true ->
									monsterState:setCurHp(Code, CurHp);
								_ ->
									monsterState:setCurHp(Code, 0),
									case monsterState:getCodeType(Code) of
										?SpawnCarrier ->
											?LOG_OUT("target code [~p] is carrier skip..", [Code]);
										_ ->
											onDead(Code, TargetPid, TargetCode, TargetName, SkillID)
									end
							end
					end;
				_ ->
					AttackResultList = [
						#pk_AttackResultList{type = ?RestoreHp, value = 0},
						#pk_AttackResultList{type = ?BackHp, value = 0}
					],
					NewDamageMsg = DamageMsg#pk_GS2U_AttackResult{
						arList = AttackResultList,
						ahp_per = 0
					},
					broadcastAttackResult(Code, NewDamageMsg, X, Y)
			end
	end.

broadcastAttackResult(
	Code,
	#pk_GS2U_AttackResult{
		userCode = UseCode,
		targetCode = TargetCode,
		skillId = SkillID,
		serial = Serial,
		bhp_per = BPer,
		ahp_per = APer,
		diffHp = DiffHp,
		damageHp = HpDamage
	} = DamageMsg,
	X,
	Y
) ->
	?DEBUG_OUT("skill(~p,~p),~p(~p) -> ~p(~p),diffHp:~p(~w)",
		[SkillID, Serial, UseCode, APer, TargetCode, BPer, DiffHp, HpDamage]),
	case mapState:getGoddessCode() of
		Val when erlang:is_number(Val) andalso Val =:= DamageMsg#pk_GS2U_AttackResult.targetCode ->
			Fun = fun(#recMapObject{pid = PlayerPid}) ->
				psMgr:sendMsg2PS(PlayerPid, sendNetMsg, {DamageMsg})
			      end,
			gameMapLogic:doFun4AllPlayer(Fun),
			ok;
		_ ->
			%%非女神受伤
			PlayerEts = monsterState:getMapPlayerEts(Code),
			%%后面发送网络消息的时候，会因为damageHp不是整数而报错，这里处理一下
			#pk_GS2U_AttackResult{damageHp = DList} = DamageMsg,
			NewDList = [erlang:trunc(DamageHp) || DamageHp <- DList],
			NewDamageMsg = DamageMsg#pk_GS2U_AttackResult{
				damageHp = NewDList
			},
			mapView:sendMsg2NearPlayerByPos(monsterState:getMapPid(Code), PlayerEts, NewDamageMsg, X, Y, monsterState:getGroupID(Code))

	end,
	ok.

calcSkillDamageToTarget(Code, BeAttack, ResList) ->
	AbsorbValue = monsterState:getAbsorbShield(Code),
	CurHp = monsterState:getCurHp(Code),
	BattleProps = monsterState:getBattleProp(Code),
	{NewAbsorbValue, NewHp, DamageList} = battle:calcDamage(
		AbsorbValue
		, CurHp
		, Code
		, BattleProps
		, BeAttack
		, ResList
	),
	monsterState:setAbsorbShield(Code, NewAbsorbValue),
	case monsterWorldBoss:isDirectDecHP(Code) of
		true ->
			monsterState:setCurHp(Code, trunc(NewHp));
		_ ->
			skip
	end,
	DamageList;
calcSkillDamageToTarget(Code, #recBeAttack{attackerProp = Props, attackerLevel = Alv, skillID = SkillID, damage = Damage}, ResList) ->

	Dlv = monsterState:getLevel(Code),

	%%护甲减伤
	#skillCfg{damageType = DamageType} = getCfg:getCfgPStack(cfg_skill, SkillID),

	%%系数
	#attedfCfg{dEF = Def, rES = Res, tOU = Tou} = getCfg:getCfgPStack(cfg_attedf, Dlv),

	#attedfCfg{cRITICAL = Critical} = getCfg:getCfgPStack(cfg_attedf, Alv),

	ArmorRatio =
		case DamageType of
			?SkillDamageTypePhys ->
				%%物攻
				monsterState:getBattlePropTotal(Code, ?Prop_PhysicalDefence) / (monsterState:getBattlePropTotal(Code, ?Prop_PhysicalDefence) + Def);
			_ ->
				%%法防
				monsterState:getBattlePropTotal(Code, ?Prop_MagicDefence) / (monsterState:getBattlePropTotal(Code, ?Prop_MagicDefence) + Res)
		end,

	TouDamage = monsterState:getBattlePropTotal(Code, ?Prop_TenaciousLevel) / Tou,
	CriDamage = 1.5 + battle:getPropValue(?Prop_CriticalLevel, Props) / Critical - TouDamage,

	DamageReduce = monsterState:getBattlePropTotal(Code, ?Prop_DamageReduce),
	DamagePlus = battle:getPropValue(?Prop_DamagePlus, Props),

	Fun =
		fun(R, Acc) ->
			Hp = monsterState:getCurHp(Code),

			DamageFactor = DamagePlus * DamageReduce,
			FinalDamage1 =
				if
					R =:= ?HitResultBreakHead ->
						Damage * DamageFactor;
					R =:= ?HitResultCritical ->
						Damage * CriDamage * (1 - ArmorRatio) * DamageFactor;
					R =:= ?HitResultOrdinary ->
						Damage * (1 - ArmorRatio) * DamageFactor;
					true ->
						0
				end,
			FinalDamage2 = case FinalDamage1 < 1 of
				               true ->
					               1;
				               _ ->
					               FinalDamage1
			               end,

			Absorb = monsterState:getAbsorbShield(Code),
			FinalDamage3 =
				case Absorb >= FinalDamage2 of
					true ->
						monsterState:setAbsorbShield(Code, Absorb - FinalDamage2),
						0;
					_ ->
						[monsterBuff:delBuff(BuffID) || BuffID <- [?AbsorbBuff1, ?AbsorbBuff2, ?AbsorbBuff3]],
						monsterState:setAbsorbShield(Code, 0),
						FinalDamage2 - Absorb
				end,

			FinalDamage =
				case FinalDamage3 > 1 of
					true ->
						FinalDamage3 * 0.95 + FinalDamage3 * 0.1 * random:uniform();
					_ ->
						FinalDamage3
				end,
%%			?DEBUG_OUT("//////attack(~w->~w), plus(~w), reduct(~w), addplus(~w),origian(~w), final(~w) \\\\\\\\\\\\",
%%				[BeAttack#recBeAttack.attackerCode, Code,DamagePlus, DamageReduce, DamageFactor,FinalDamage1, FinalDamage]),
			NewHp =
				case Hp > FinalDamage of
					true ->
						Hp - FinalDamage;
					_ ->
						0
				end,
			monsterState:setCurHp(Code, trunc(NewHp)),
			[-trunc(FinalDamage) | Acc]
		end,
	lists:reverse(lists:foldl(Fun, [], ResList)).

%% %%计算被攻击时技能作用到目标的伤害
%% -spec calcSkillDamageToTarget(Code, #recBeAttack{}, HitResultList, IsMainTarget, SecTarget) -> list() when
%% 	   Code :: uint(),
%%        HitResultList :: list(),
%%        IsMainTarget :: boolean(),
%%        SecTarget :: float().
%% calcSkillDamageToTarget(Code, #recBeAttack{} = BeAttack, HitResultList, IsMainTarget, SecTarget) ->
%% 	AttackerLevel = BeAttack#recBeAttack.attackerLevel,
%% 	AttackerType = BeAttack#recBeAttack.attackerType,
%% 	Damage = BeAttack#recBeAttack.damage,
%% 	AbsoluteDamage = BeAttack#recBeAttack.attackerAbsolutedamage,
%% 	UserCriticalArg = BeAttack#recBeAttack.attackerCriticalArg,
%% 	SpecSkillList = BeAttack#recBeAttack.specSkillList,
%% 	Prop = BeAttack#recBeAttack.attackerProp,
%% 	ID = monsterState:getId(Code),
%% 	CodeType = monsterState:getCodeType(Code),
%% 	IsBoss = battle:isBoss(CodeType, ID),
%% 	RAD = getResistAndDef(Code),
%% 	DamageFixArg = getDamageFixArg(Code, Prop),
%% 	TotalDamage = skill:calcTargetTotalDamage(AttackerLevel, RAD, SkillTotalDamage, IsMainTarget, SecTarget),
%% 	FixedTotalDamage = skill:calcTargetTotalDamageFix(TotalDamage, AttackerType, DamageFixArg, IsBoss),
%% 	ExtraTotalDamage = calcTargetExtraTotalDamage(Code, FixedTotalDamage, SpecSkillList),
%% 	TargetBlockArg = monsterState:getBattlePropTotal(Code,?Prop_blockfactor),
%% 	Absolutedefence = monsterState:getBattlePropTotal(Code, ?Prop_absolutedefence),
%% 	CriticalDamageReduct = monsterState:getBattlePropTotal(Code, ?Prop_criticaldamagereduct),
%% 	%%计算最终伤害
%% 	Fun = fun(HitResult,AccIn) ->
%% 				  Hp = monsterState:getCurHp(Code),
%% 				  FinalDamage = if
%% 									HitResult =:= (?HitResultHit bor ?HitResultBlock) ->
%% 										ExtraTotalDamage * (1 - TargetBlockArg);
%% 									HitResult =:= ?HitResultCritical ->
%% 										ExtraTotalDamage * (UserCriticalArg - CriticalDamageReduct);
%% 									HitResult =:= (?HitResultBlock bor ?HitResultCritical) ->
%% 										ExtraTotalDamage * (UserCriticalArg - CriticalDamageReduct) * (1 - TargetBlockArg);
%% 									HitResult =:= ?HitResultHit ->
%% 										ExtraTotalDamage;
%% 									true ->
%% 										0
%% 								end,
%% 				  %%计算实际伤害
%% 				  FinalDamage1 = FinalDamage + (AbsoluteDamage - Absolutedefence),
%% 				  MinArg = skill:getMinDamageArg(),
%% 				  MaxArg = skill:getMaxDamageArg(),
%% 				  Arg = misc:rand(MinArg,MaxArg),
%% 				  %%处理伤害吸收盾
%% 				  Absorb = monsterState:getAbsorbShield(Code),
%% 				  case Absorb >= FinalDamage * Arg of
%% 					  true ->
%% 						  monsterState:setAbsorbShield(Code, Absorb - FinalDamage1 * Arg),
%% 						  RealDamage = 0;
%% 					  _ ->
%% 						  [monsterBuff:delBuff(Code, BuffID) || BuffID <- [?AbsorbBuff4]],
%% 						  monsterState:setAbsorbShield(Code, 0),
%% 						  RealDamage = FinalDamage1 * Arg - Absorb
%% 				  end,
%% 				  case RealDamage > 0 of
%% 					  true ->
%% 						  case Hp > RealDamage of
%% 							  true ->
%% 								  NewHp = Hp - RealDamage;
%% 							  _ ->
%% 								  NewHp = 0
%% 						  end,
%% 						  %%处理伤害吸收
%% 						  case NewHp > 0 of
%% 							  true ->
%% 								  DamageAbsorb = monsterState:getBattlePropTotal(Code, ?Prop_damageabsorb),
%% 								  MaxHp = monsterState:getBattlePropTotal(Code, ?Prop_MaxHP),
%% 								  TotalDamageAbsorb = RealDamage * DamageAbsorb,
%% 								  AddHp = misc:clamp(TotalDamageAbsorb,0,MaxHp * 0.1),
%% 								  monsterState:setCurHp(Code, NewHp + AddHp);
%% 							  _ ->
%% 								  monsterState:setCurHp(Code, NewHp)
%% 						  end,
%% 						  [-erlang:trunc(RealDamage) | AccIn];
%% 					  _ ->
%% 						  [0 | AccIn]
%% 				  end
%% 		  end,
%% 	lists:reverse(lists:foldl(Fun, [], HitResultList)).

%%怪物死亡
-spec onDead(Code, AttackerPid1, AttackerCode1, AttackerName1, SkillID) -> ok when
	Code :: uint(),
	AttackerPid1 :: pid(),
	AttackerCode1 :: uint(),
	AttackerName1 :: list(),
	SkillID :: uint().
onDead(Code, AttackerPid1, AttackerCode1, AttackerName1, SkillID) ->
	Type = codeMgr:getObjectTypeByCode(Code),
	CodeType = monsterState:getCodeType(Code),
	{X, Y} = monsterState:getMonsterPos(Code),
	BossID = monsterState:getId(Code),
	MapPid = monsterState:getMapPid(Code),

	{AttackerPid, AttackerCode, AttackerName} = case getRandOwnerFromPlayerEts(Code, AttackerCode1, AttackerPid1) of
		                                            {true, AttackerPid2, AttackerCode2, AttackerName2} ->
			                                            {AttackerPid2, AttackerCode2, AttackerName2};
		                                            _ ->
			                                            {AttackerPid1, AttackerCode1, AttackerName1}
	                                            end,

	?DEBUG_OUT("onDead Code=~p,~p AttackerPid=~p->~p, AttackerCode=~p->~p, AttackerName=~ts-~ts, SkillID=~p",
		[Code, Type, AttackerPid1, AttackerPid, AttackerCode1, AttackerCode, AttackerName1, AttackerName, SkillID]),

	BossTargetCode = mapWildBoss:getWildBossTarget(BossID),
	case CodeType of
		?SpawnCarrier ->
			?ERROR_OUT("[~p] carrier can't dead", [Code]),
			ok;
		?SpawnPet ->
			delBothHate(Code),
			creatureMap:syncCreatureToEts(Code),
			monsterState:setActionStatus(Code, ?CreatureActionStatusDead),
			Msg1 = #pk_GS2U_PetSleep{
				code = Code
			},
			erlang:send_after(?RmbPetReviveTime, self(), {rmbPetRevive, Code}),
			case AttackerPid =:= self() of
				true ->
					killedTarget(AttackerCode, Code, Msg1, X, Y, BossTargetCode);
				_ ->
					psMgr:sendMsg2PS(AttackerPid, killedTarget, {AttackerCode, Code, Msg1, X, Y, BossTargetCode})
			end;
		_ ->
			case CodeType of
				?SpawnCallPet ->
					monsterInterface:clearSpawnPetAck(Code);
				?SpawnCallMonster ->
					CallerCode = monsterState:getCaller(Code),
					case erlang:is_integer(CallerCode) andalso CallerCode > 0 of
						true ->
							%%召唤出来挨打的怪需要有掉落
							dealOwnerAward(Code, AttackerCode, AttackerPid);
						_ ->
							CasterInfo = monsterState:getCasterInfo(Code),
							monsterEffect:delCallInfo(?SpawnCallPet, Code, CasterInfo)
					end;
				_ ->
					case battle:isBoss(monsterState:getId(Code)) of
						true ->
							?LOG_OUT("monster[~p] Code[~p] Kill Dead by Code[~p], monster hate list [~p] ",
								[monsterState:getId(Code), Code, AttackerCode, monsterState:getHateList(Code)]);
						_ ->
							case getCfg:getCfgPStack(cfg_monster, monsterState:getId(Code)) of
								#monsterCfg{monsterSubType = ?MonsterSTypeTower} ->
									?ERROR_OUT("tower be killed[~p] Code[~p] Kill Dead by Code[~p], monster hate list [~p] ",
										[monsterState:getId(Code), Code, AttackerCode, monsterState:getHateList(Code)]);
								_ ->
									skip
							end
					end,

					L = getBossRewardOwnerFromHateList(Code, monsterState:getHateList(Code)),
					Arg = #recAcReastBossArg{
						killedName = getAttackerRealName(Code, AttackerCode, AttackerName),
						mapID = monsterState:getMapID(Code),
						monsterID = monsterState:getId(Code),
						hateList = L
					},
					AcArg = #recOperateActivityArg{
						type = ?OperateActType_FeastBoss,
						arg = Arg,
						pid = self()
					},

					AcList = activity:getOperateActCfgByType(?OperateActType_FeastBoss),
					activity:operateActEvent(AcList, AcArg),
					case codeMgr:getObjectTypeByCode(AttackerCode) of
						?ObjTypePlayer ->
%%							gameMapAcKingBattleAll:onMarrorDead(Code, AttackerCode),
							dealOwnerAward(Code, AttackerCode, AttackerPid);
						?ObjTypePet ->
							dealOwnerAward(Code, AttackerCode, AttackerPid);
						?ObjTypeCarrier ->
							MonsterEts = monsterState:getMapMonsterEts(Code),
							case myEts:lookUpEts(MonsterEts, AttackerCode) of
								[#recMapObject{ownCode = OwnCode, pid = OwnPid} | _] ->
									case codeMgr:getObjectTypeByCode(OwnCode) of
										?ObjTypePlayer ->
											dealOwnerAward(Code, OwnCode, OwnPid);
										?ObjTypePet ->
											dealOwnerAward(Code, OwnCode, OwnPid);
										_ ->
											GroupID = monsterState:getGroupID(Code),
											MonsterID = monsterState:getId(Code),
											mapBase:killMonster(Code, MonsterID, GroupID, AttackerCode)
									end;
								_ ->
									skip
							end;
						_ ->
							case mapState:getMapSubType() of
								?MapSubTypeMaterial ->
									dealOwnerAward(Code, AttackerCode, AttackerPid);
								_ ->
									GroupID = monsterState:getGroupID(Code),
									MonsterID = monsterState:getId(Code),
									mapBase:killMonster(Code, MonsterID, GroupID, AttackerCode)
							end
					end
			end,

			%%?WARN_OUT("monster Code[~p] Kill Dead by Code[~p] ",[Code,AttackerCode]),
%%怪物分裂----------------
			TheMonsterID = monsterState:getId(Code),
			Fun2 =
				fun({MonsterID, Num}) ->
					?LOG_OUT("send hd battle SplietMonster, cur db id [~p], pid [~p]", [MonsterID, Num]),
					case TheMonsterID of
						MonsterID ->
							?ERROR_OUT("split error!!! split monster is dead monster!");
						_ ->
							psMgr:sendMsg2PS(MapPid, addMonsterToMap, {0, [{MonsterID, Num, X, Y}]})
					end
				end,

			case getCfg:getCfgPStack(cfg_monster, monsterState:getId(Code)) of
				#monsterCfg{monsterSplit = MonsterList} when erlang:is_list(MonsterList) ->
					lists:foreach(Fun2, MonsterList);
				_ ->
					skip
			end,
%%----------------
			gameMapConvoy:monsterDead(Code),

			%%协助击杀
			assistTrigger(Code, SkillID),

			%%删除双方仇恨值
			delBothHate(Code),

			%%立即同步一次信息
			creatureMap:syncCreatureToEts(Code),

			%% 怪物死亡特殊处理
			monsterDead(AttackerCode, Code),

			%%死亡了，通知周围玩家
			Msg = #pk_GS2U_Dead{
				deadActorCode = Code,
				killerCode = AttackerCode,
				killerName = AttackerName,
				skillID = SkillID
			},
			case AttackerPid =:= self() of
				true ->
					killedTarget(AttackerCode, Code, Msg, X, Y, BossTargetCode);
				_ ->
					psMgr:sendMsg2PS(AttackerPid, killedTarget, {AttackerCode, Code, Msg, X, Y, BossTargetCode})
			end,

			%%一定要在最后清除信息
			creatureBase:monsterDead(Code, CodeType)
	end.

pinterrorlog(Param, Code, AttackerCode, AttackerPid, HateList, MonsterID, MonsterLevel, CallerCode, DropOwnerCode, DropOwnerPid, DropOwnerCode2, DropOwnerPid2) ->
	Self = self(),
	if
		DropOwnerPid2 =:= Self ->
			?ERROR_OUT("pinterrorlog 222[~p] Code=~p, Self=~p, AttackerCode=~p, AttackerPid=~p, HateList=~p, MonsterID=~p, MonsterLevel=~p,
					CallerCode=~p, DropOwnerCode=~p, DropOwnerPid=~p, DropOwnerCode2=~p, DropOwnerPid2=~p Statck=~p",
				[Param, Code, Self, AttackerCode, AttackerPid, HateList, MonsterID, MonsterLevel,
					CallerCode, DropOwnerCode, DropOwnerPid, DropOwnerCode2, DropOwnerPid2, misc:getStackTrace()]),
			ok;
%%		DropOwnerPid =:= Self ->
%%			?ERROR_OUT("pinterrorlog 111[~p] Code=~p, Self=~p, AttackerCode=~p, AttackerPid=~p, HateList=~p, MonsterID=~p, MonsterLevel=~p,
%%					CallerCode=~p, DropOwnerCode=~p, DropOwnerPid=~p, DropOwnerCode2=~p, DropOwnerPid2=~p Statck=~p",
%%				[Param, Code, Self, AttackerCode, AttackerPid, HateList, MonsterID, MonsterLevel,
%%					CallerCode, DropOwnerCode, DropOwnerPid, DropOwnerCode2, DropOwnerPid2, misc:getStackTrace()]),
%%			ok;
%%		AttackerPid =:= Self ->
%%			?ERROR_OUT("pinterrorlog 000[~p] Code=~p, Self=~p, AttackerCode=~p, AttackerPid=~p, HateList=~p, MonsterID=~p, MonsterLevel=~p,
%%					CallerCode=~p, DropOwnerCode=~p, DropOwnerPid=~p, DropOwnerCode2=~p, DropOwnerPid2=~p Statck=~p",
%%				[Param, Code, Self, AttackerCode, AttackerPid, HateList, MonsterID, MonsterLevel,
%%					CallerCode, DropOwnerCode, DropOwnerPid, DropOwnerCode2, DropOwnerPid2, misc:getStackTrace()]),
%%			ok;
		true -> skip
	end,
	ok.

%%处理战斗结果拥有者奖励
-spec dealOwnerAward(Code :: uint(), AttackerCode :: uint(), AttackerPid :: pid()) -> ok.
dealOwnerAward(Code, AttackerCode, AttackerPid) ->
	HateList = monsterState:getHateList(Code),
	MonsterID = monsterState:getId(Code),
	MonsterLevel = monsterState:getLevel(Code),
	CallerCode = monsterState:getCaller(Code),

	#monsterCfg{ownerShip = OwnerShip, dropShip = DropShip} = getCfg:getCfgPStack(cfg_monster, MonsterID),

	%%掉落归属只能有一个人
	case getDropShipByKillMonster(DropShip, HateList, Code, AttackerCode, AttackerPid, CallerCode) of
		[{DropOwnerCode, DropOwnerPid}] ->
			case getPlayerRealPid(Code, DropOwnerCode, DropOwnerPid) of
				{DropOwnerCode2, DropOwnerPid2} ->
					case codeMgr:isCodeType(?CodeTypeMonster, DropOwnerCode2) of
						false ->
							pinterrorlog(11, Code, AttackerCode, AttackerPid, HateList, MonsterID, MonsterLevel, CallerCode, DropOwnerCode, DropOwnerPid, DropOwnerCode2, DropOwnerPid2),
							psMgr:sendMsg2PS(DropOwnerPid2, dropBykilledMonster, {Code, MonsterID, MonsterLevel});
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,

	%%经验归属只能是第一个攻击怪物的人及其同图队友
	case getOwnerShipByKillMonster(?MonsterOwnerShipFirstAttackerAndTeam, HateList, Code, AttackerCode, AttackerPid) of
		[{ExpOwnerCode, ExpOwnerPid} | _] ->
			case getPlayerRealPid(Code, ExpOwnerCode, ExpOwnerPid) of
				{ExpOwnerCode2, ExpOwnerPid2} ->
					case codeMgr:isCodeType(?CodeTypeMonster, ExpOwnerCode2) of
						false ->
							pinterrorlog(22, Code, AttackerCode, AttackerPid, HateList, MonsterID, MonsterLevel, CallerCode, ExpOwnerCode, ExpOwnerPid, ExpOwnerCode2, ExpOwnerPid2),
							psMgr:sendMsg2PS(ExpOwnerPid2, gainExpByKilledMonster, MonsterID),
							%% 姻缘系统：夫妻组队同图杀怪每日增加亲密度 begin
							%% 1.查找目标是否已婚
							CodeTarget =
								case ets:lookup(monsterState:getMapPetEts(Code), ExpOwnerCode2) of
									[#recMapObject{ownId = PetOwnID}] when PetOwnID > 0 ->
										case core:queryOnLineRoleByRoleID(PetOwnID) of
											#rec_OnlinePlayer{code = PetOwnCode} ->
												PetOwnCode;
											_ ->
												0
										end;
									_ ->
										ExpOwnerCode2
								end,
							PlayerEts = monsterState:getMapPlayerEts(Code),
							case ets:lookup(PlayerEts, CodeTarget) of
								[#recMapObject{id = RoleID_A, teamID = TeamID_A}] ->
									case marriageState:queryRelation(RoleID_A) of
										#rec_marriage{targetRoleID = RoleID_B} when RoleID_B > 0 ->
											case core:queryOnLineRoleByRoleID(RoleID_B) of
												#rec_OnlinePlayer{code = Code_B} ->
													case ets:lookup(PlayerEts, Code_B) of
														[#recMapObject{teamID = TeamID_A}] ->
															Value = marriageState:configKillMonsterAddCloseness(),
															playerMarriage:closenessAdd({RoleID_A, RoleID_B, Value, ?ClosenessSource_KillMonster});
														_ ->
															skip %% 伴侣不同队或者不同图
													end;
												_ ->
													skip %% 伴侣不在线
											end;
										_ ->
											skip %% 没有伴侣
									end;
								UnknownInfo ->
									?ERROR_OUT("dealOwnerAward can not find myself(~p) UnkownInfo(~p) from PlayerEts(~p)", [CodeTarget, UnknownInfo, PlayerEts]),
									%FunDebug =
									%	fun(#recMapObject{type = Type, code = Code, id = ID, x = X, y = Y, hp = HP, ownId = OwnId}, _) ->
									%		?DEBUG_OUT("[DebugForSnowman] gmCheckMonster Type:~p Code:~p ID:~p X:~p Y:~p HP:~p OwnID:~p", [Type, Code, ID, X, Y, HP, OwnId]),
									%		ok
									%	end,
									%ets:foldl(FunDebug, 0, PlayerEts),
									%ets:foldl(FunDebug, 0, monsterState:getMapMonsterEts(Code)),
									%ets:foldl(FunDebug, 0, monsterState:getMapPetEts(Code)),
									skip  %% 异常，找不到自己，应该是函数调用错误
							end;
						%% 姻缘系统：夫妻组队同图杀怪每日增加亲密度 end
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,

	%%任务归属可能有多个人
	OwnerList = getOwnerShipByKillMonster(OwnerShip, HateList, Code, AttackerCode, AttackerPid),
	Func = fun({OwnerCode, OwnerPid}) when erlang:is_pid(OwnerPid) ->
		case codeMgr:isCodeType(?CodeTypePlayer, OwnerCode) of
			true when OwnerPid =/= self() ->
				psMgr:sendMsg2PS(OwnerPid, killedMonster, MonsterID);
			_ ->
				case codeMgr:isCodeType(?CodeTypePet, OwnerCode) of
					true ->
						PetEts = monsterState:getMapPetEts(Code),
						case myEts:lookUpEts(PetEts, OwnerCode) of
							[#recMapObject{ownCode = EtsOwnCode} | _] ->
								case lists:keyfind(EtsOwnCode, 1, OwnerList) of
									false ->
										psMgr:sendMsg2PS(OwnerPid, killedMonster, MonsterID);
									_ ->
										skip
								end;
							_ ->
								skip
						end;
					_ ->
						skip
				end
		end
	       end,
	lists:foreach(Func, OwnerList),

	%% 最后处理杀死对象
	GroupID = monsterState:getGroupID(Code),
	mapBase:killMonster(Code, MonsterID, GroupID, AttackerCode),
	ok.

getAttackerRealName(Code, AttackerCode, OldName) ->
	RealAttackerCode =
		case codeMgr:getObjectTypeByCode(AttackerCode) of
			?ObjTypePet ->
				PetEts = monsterState:getMapPetEts(Code),
				case ets:lookup(PetEts, AttackerCode) of
					[#recMapObject{ownCode = OwnCode}] ->
						OwnCode;
					_ ->
						AttackerCode
				end;
			_ ->
				AttackerCode
		end,
	case AttackerCode =/= RealAttackerCode of
		true ->
			case codeMgr:getObjectTypeByCode(RealAttackerCode) of
				?ObjTypePlayer ->
					PlayerEts = monsterState:getMapPlayerEts(Code),
					case ets:lookup(PlayerEts, RealAttackerCode) of
						[#recMapObject{name = RealName}] ->
							RealName;
						_ ->
							OldName
					end;
				_ ->
					OldName
			end;
		_ ->
			OldName
	end.
%% 找到攻击者的实际PID
getPlayerRealPid(Code, AttackCode, AttackPid) ->
	case AttackPid =:= self() of
		true ->
			%% 对象的PID是地图，则要找玩家的
			case codeMgr:getObjectTypeByCode(AttackCode) of
				?ObjTypePlayer ->
					PlayerEts = monsterState:getMapPlayerEts(Code),
					case ets:lookup(PlayerEts, AttackCode) of
						[#recMapObject{pid = Pid}] ->
							{AttackCode, Pid};
						_ ->
							?ERROR_OUT("getPlayerPid ObjTypePlayer:~p,~p,~p", [Code, AttackCode, AttackPid]),
							false
					end;
				?ObjTypePet ->
					MonsterEts = monsterState:getMapPetEts(Code),
					case ets:lookup(MonsterEts, AttackCode) of
						[#recMapObject{ownCode = OwnCode, pid = OwnPid}] ->
							{OwnCode, OwnPid};
						_ ->
							?ERROR_OUT("getPlayerPid ObjTypePet:~p,~p,~p", [Code, AttackCode, AttackPid]),
							{AttackCode, AttackPid}
					end;
				?ObjTypeCarrier ->
					MonsterEts = monsterState:getMapMonsterEts(Code),
					case ets:lookup(MonsterEts, AttackCode) of
						[#recMapObject{ownCode = OwnCode, pid = OwnPid}] ->
							case codeMgr:getObjectTypeByCode(OwnCode) of
								?ObjTypePlayer ->
									{OwnCode, OwnPid};
								?ObjTypePet ->
									%% 攻击者是宠物，还得找宠物的主人
									PetEts = monsterState:getMapPetEts(Code),
									case ets:lookup(PetEts, OwnCode) of
										[#recMapObject{ownCode = PCode, pid = PPid}] ->
											{PCode, PPid};
										_ ->
											?ERROR_OUT("getPlayerPid ObjTypeCarrier 4:~p,~p,~p,~p", [Code, AttackCode, AttackPid, OwnCode]),
											{AttackCode, AttackPid}
									end;
								Error ->
									?ERROR_OUT("getPlayerPid ObjTypeCarrier 5:~p,~p,~p,~p,~p", [Code, AttackCode, AttackPid, OwnCode, Error]),
									{AttackCode, AttackPid}
							end;
						_ ->
							?ERROR_OUT("getPlayerPid ObjTypeCarrier 3:~p,~p,~p", [Code, AttackCode, AttackPid]),
							{AttackCode, AttackPid}
					end;
				?ObjTypeMonster ->
					MonsterEts = monsterState:getMapMonsterEts(Code),
					case ets:lookup(MonsterEts, AttackCode) of
						[#recMapObject{ownCode = OwnCode, pid = OwnPid}] ->
							{OwnCode, OwnPid};
						_ ->
							?ERROR_OUT("getPlayerPid ObjTypeMonster:~p,~p,~p", [Code, AttackCode, AttackPid]),
							{AttackCode, AttackPid}
					end;
				Other ->
					?ERROR_OUT("getPlayerPid ObjTypeCarrier other:~p,~p,~p,~p", [Code, AttackCode, AttackPid, Other]),
					false
			end;
		_ ->
			{AttackCode, AttackPid}
	end.

%%根据归属值，获取杀死一个怪物后的归属
getOwnerShipByKillMonster(OwnerShip, HateList, Code, AttackerCode1, AttackerPid1) ->
	{SkipSelect, AttackerPid, AttackerCode, _} = getRandOwnerFromPlayerEts(Code, AttackerCode1, AttackerPid1),

	if
		SkipSelect ->
			[{AttackerCode, AttackerPid}];
		OwnerShip =:= ?MonsterOwnerShipFirstAttackerAndTeam orelse OwnerShip =:= ?MonsterOwnerShipFirstAttacker -> %%第一个攻击怪物的玩家
			FirstAttackerCode = monsterState:getFirstAttacker(Code),
			getOwnerFromHateList(FirstAttackerCode, AttackerPid, HateList);
		OwnerShip =:= ?MonsterOwnerShipAllHateList -> %% 所有进入过怪物仇恨列表的玩家
			Fun =
				fun(#recHate{hateCode = Key, hatePid = APid}, AccIn) ->
					[{Key, APid} | AccIn]
				end,
			lists:foldl(Fun, [], HateList);
		true -> %% 最后一击杀死怪物的玩家
			getOwnerFromHateList(AttackerCode, AttackerPid, HateList)
	end.

getDropShipByKillMonster(DropShip, HateList, Code, AttackerCode1, AttackerPid1, CallerCode) ->
	%%特殊逻辑，我也没有办法，因为怪物杀了怪物，归属要属于玩家
	{SkipSelect, AttackerPid, AttackerCode, _} = getRandOwnerFromPlayerEts(Code, AttackerCode1, AttackerPid1),

	if
		SkipSelect ->
			[{AttackerCode, AttackerPid}];
		DropShip =:= ?MonsterDropShipFirstAttackerAndTeam orelse DropShip =:= ?MonsterDropShipFirstAttacker -> %%第一个攻击怪物的玩家
			FirstAttackerCode = monsterState:getFirstAttacker(Code),
			getOwnerFromHateList(FirstAttackerCode, AttackerPid, HateList);
		DropShip =:= ?MonsterDropShipCallMonsterPlayerAndTeam orelse DropShip =:= ?MonsterDropShipCallMonsterPlayer ->
			getOwnerFromHateList(CallerCode, AttackerPid, HateList);
		true -> %% 最后一击杀死怪物的玩家
			getOwnerFromHateList(AttackerCode, AttackerPid, HateList)
	end.

getRandOwnerFromPlayerEts(Code, AttackerCode1, AttackerPid1) ->
	case mapState:getMapSubType() of
		?MapSubTypeMaterial ->
			case codeMgr:getObjectTypeByCode(AttackerCode1) of
				?ObjTypeMonster ->
					MonsterID = monsterState:getId(AttackerCode1),
					case getCfg:getCfgByArgs(cfg_monster, MonsterID) of
						#monsterCfg{monsterSubType = ?MonsterSTypeTower} ->
							PlayerEts = monsterState:getMapPlayerEts(Code),
							case catch ets:tab2list(PlayerEts) of
								[#recMapObject{code = ACode, pid = APid, name = Name} | _] ->
									{true, APid, ACode, Name};
								_ ->
									{false, AttackerPid1, AttackerCode1, ""}
							end;
						_ ->
							{false, AttackerPid1, AttackerCode1, ""}
					end;
				?ObjTypePlayer ->
					{true, AttackerPid1, AttackerCode1, ""};
				_ ->
					{false, AttackerPid1, AttackerCode1, ""}
			end;
		_ ->
			{false, AttackerPid1, AttackerCode1, ""}
	end.

getOwnerFromHateList(AttackerCode, AttackerPid, HateList) ->
	case lists:keyfind(AttackerCode, #recHate.hateCode, HateList) of
		#recHate{hatePid = Pid} ->
			[{AttackerCode, Pid}];
		_ ->
			%%策划规定，如果找不到归属则从仇恨列表中找一个，所有都没有则返回空
			case HateList of
				[#recHate{hateCode = Code, hatePid = Pid} | _] ->
					[{Code, Pid}];
				_ ->
					[{AttackerCode, AttackerPid}]
			end
	end.

getBossRewardOwnerFromHateList(_Code, []) ->
	[];
getBossRewardOwnerFromHateList(Code, HateList) ->
	getBossRewardOwnerFromHateList(Code, HateList, HateList, []).
getBossRewardOwnerFromHateList(_Code, [], _HL, L) ->
	L;
getBossRewardOwnerFromHateList(Code, [#recHate{hateCode = HateCode, hatePid = Pid} | HateList], HL, L) ->
	case codeMgr:getObjectTypeByCode(HateCode) of
		?ObjTypePlayer ->
			PlayerEts = monsterState:getMapPlayerEts(Code),
			case myEts:lookUpEts(PlayerEts, HateCode) of
				[#recMapObject{name = Name} | _] ->
					E = #recKillBossPlayer{name = Name, pid = Pid},
					getBossRewardOwnerFromHateList(Code, HateList, HL, [E | L]);
				_ ->
					getBossRewardOwnerFromHateList(Code, HateList, HL, L)
			end;
		_ ->
			getBossRewardOwnerFromHateList(Code, HateList, HL, L)
	end.


%%根据仇恨值,攻击者协助击杀或者击杀触发的技能
-spec assistTrigger(Code, SkillID) -> ok when
	Code :: uint(),
	SkillID :: uint().
assistTrigger(Code, SkillID) ->
	HateList = monsterState:getHateList(Code),
	Fun = fun(#recHate{hatePid = AttackerPid, hateCode = AttackerCode}) ->
		psMgr:sendMsg2PS(AttackerPid, assistTrigger, {AttackerCode, SkillID})
	      end,
	lists:foreach(Fun, HateList).

%%增加仇恨值
-spec addHate(MonsterCode, Hate, IsCarrier) -> ok when
	MonsterCode :: uint(),
	Hate :: #recHate{},
	IsCarrier :: false | #recCasterInfo{}.
addHate(MonsterCode, #recHate{} = Hate, #recCasterInfo{casterCode = CasterCode, casterPid = CasterPid}) ->
	PlayerEts = monsterState:getMapPlayerEts(MonsterCode),
	MonsterEts = monsterState:getMapMonsterEts(MonsterCode),
	PetEts = monsterState:getMapPetEts(MonsterCode),
	MapID = monsterState:getMapID(MonsterCode),
	GroupID = monsterState:getGroupID(MonsterCode),
	case mapView:getMapObjectFromEts(CasterCode, {PlayerEts, MonsterEts, PetEts}) of
		#recMapObject{hp = Hp, mapId = CasterMapID, groupID = CasterGroupID} ->
			case Hp =< 0 orelse CasterMapID =/= MapID orelse GroupID =/= CasterGroupID of
				true ->
					ok;
				_ ->
					case monsterState:getCodeType(MonsterCode) of
						?SpawnCarrier ->
							case CasterPid =:= self() of
								true ->
									addHate(MonsterCode, Hate, false);
								_ ->
									psMgr:sendMsg2PS(CasterPid, addHate, {MonsterCode, Hate})
							end;
						_ ->
							NewHate = Hate#recHate{
								hateCode = CasterCode,
								hatePid = CasterPid
							},
							addHate(MonsterCode, NewHate, false)
					end
			end;
		_ ->
			ok
	end;
addHate(MonsterCode, #recHate{hateCode = Code, hatePid = HatePid} = Hate, false) ->
	HateList = monsterState:getHateList(MonsterCode),
	case lists:keyfind(Code, #recHate.hateCode, HateList) of
		false ->
			noticeHate(MonsterCode, Hate, ?AddHate),
			wildBossNoticePlayer(MonsterCode, Code, HatePid, true),
			monsterState:setHateList(MonsterCode, [Hate | HateList]),

			%% 立即显现对方
			playerMap:addScreenPKPlayer(Code);
		_ ->
			skip
	end,
	ok.

%%删除仇恨值
-spec delHate(MonsterCode, Hate) -> ok when
	MonsterCode :: uint(),
	Hate :: #recHate{}.
delHate(MonsterCode, #recHate{hateCode = AttackerCode, hatePid = HatePid} = Hate) ->
	noticeHate(MonsterCode, Hate, ?DelHate),
	HateList = monsterState:getHateList(MonsterCode),
	NewHateList = lists:keydelete(AttackerCode, #recHate.hateCode, HateList),
	monsterState:setHateList(MonsterCode, NewHateList),
	wildBossNoticePlayer(MonsterCode, AttackerCode, HatePid, false),
	case codeMgr:isCodeType(?CodeTypeMonster, MonsterCode) andalso NewHateList =:= [] of
		true ->
			?DEBUG_OUT("monster del hate [~p] leave battle", [MonsterCode]),
			leaveBattle(MonsterCode);
		_ ->
			case codeMgr:isCodeType(?CodeTypePlayer, #recHate.hateCode) of
				true ->
					case getCfg:getCfgByArgs(cfg_monster, monsterState:getId(MonsterCode)) of
						#monsterCfg{monsterAI = [?AI_Type_PassiveSpecWay, _, _]} ->
							leaveBattle(MonsterCode);
						_ ->
							skip
					end;
				_ ->
					skip
			end,
			skip
	end,
	ok.

%%删除双方仇恨值
-spec delBothHate(Code) -> ok when
	Code :: uint().
delBothHate(Code) ->
	HateList = monsterState:getHateList(Code),
	Fun = fun(#recHate{hateCode = HaterCode, hatePid = HatePid} = Hate) ->
		delHate(Code, Hate),
		Hate1 = #recHate{
			hateCode = Code,
			hatePid = self(),
			hateValue = 0
		},
		psMgr:sendMsg2PS(HatePid, delHate, {HaterCode, Hate1})
	      end,
	lists:foreach(Fun, HateList).

%%通知客服端宠物仇恨变化
-spec noticeHate(CasterCode, Hate, Operate) -> ok when
	CasterCode :: uint(),
	Hate :: #recHate{},
	Operate :: uint().
noticeHate(CasterCode, Hate, Operate) ->
	CodeType = monsterState:getCodeType(CasterCode),
	case CodeType =:= ?SpawnPet orelse CodeType =:= ?SpawnCallPet of
		true ->
			playerMsg:sendNetMsg(#pk_GS2U_HateInfo{
				code = CasterCode,
				hateCode = Hate#recHate.hateCode,
				opreate = Operate
			}
			);
		_ ->
			skip
	end.

%%增加杀戮值
-spec addKillValue(MonsterCode :: uint(), TargetCode :: uint()) -> ok.
addKillValue(MonsterCode, TargetCode) ->
	BossID = monsterState:getId(MonsterCode),
	CodeType = monsterState:getCodeType(MonsterCode),
	BossTargetCode = mapWildBoss:getWildBossTarget(BossID),
	addKillValue(MonsterCode, CodeType, TargetCode, BossTargetCode).
addKillValue(MonsterCode, CodeType, TargetCode, BossTargetCode) when CodeType =:= ?SpawnCarrier orelse CodeType =:= ?SpawnPet orelse CodeType =:= ?SpawnCallPet ->
	case monsterState:getCasterInfo(MonsterCode) of
		#recCasterInfo{casterPid = Pid, casterType = ?AttackerTypePlayer} ->
			case Pid =:= self() of
				true ->
					skip;
				_ ->
					psMgr:sendMsg2PS(Pid, addKillValue, {true, TargetCode, BossTargetCode})
			end;
		_ ->
			skip
	end;
addKillValue(_, _, _, _) ->
	ok.


%%增加杀戮人
-spec addKillPlayer(MonsterCode :: uint(), TargetCode :: uint()) -> ok.
addKillPlayer(MonsterCode, TargetCode) ->
	BossID = monsterState:getId(MonsterCode),
	CodeType = monsterState:getCodeType(MonsterCode),
	BossTargetCode = mapWildBoss:getWildBossTarget(BossID),
	addKillPlayer(MonsterCode, CodeType, TargetCode, BossTargetCode).
addKillPlayer(MonsterCode, CodeType, TargetCode, BossTargetCode) when CodeType =:= ?SpawnPet orelse CodeType =:= ?SpawnCallPet ->
	CasterInfo = monsterState:getCasterInfo(MonsterCode),
	psMgr:sendMsg2PS(CasterInfo#recCasterInfo.casterPid, addKillPlayer, {TargetCode, BossTargetCode});
addKillPlayer(_, _, _, _) ->
	ok.


-spec wildBossNoticePlayer(MonsterCode :: uint(), HateCode :: uint32(), HatePid :: pid(), IsShow :: boolean()) -> ok.
%%野外Boss仇恨列表变化处理，IsShow控制客户端仇恨目标界面显示与否
wildBossNoticePlayer(MonsterCode, HateCode, HatePid, IsShow) ->
	case codeMgr:isCodeType(?CodeTypeMonster, MonsterCode) of
		true ->
			%%如果是野外boss需要通知仇恨列表里的
			MonsterID = monsterState:getId(MonsterCode),
			case MonsterID =/= undefined of
				true ->
					#monsterCfg{monsterSubType = SubType} = getCfg:getCfgPStack(cfg_monster, MonsterID),
					case SubType =:= ?MonsterSTypeWildBoss of
						true ->
							TargetCode = monsterState:getAttackTarget(MonsterCode),
							{RTargetCode, RIsShow} = case TargetCode of
								                         undefined ->
									                         {0, false};
								                         _ ->
									                         IsShow1 = case codeMgr:getObjectTypeByCode(HateCode) of
										                                   ?ObjTypePlayer ->
											                                   IsShow;
										                                   _ ->
											                                   true
									                                   end,
									                         %%怪物当前目标有可能是玩家召唤的宠物，玩家，玩家召唤的怪物，均传玩家的ID,要通知的Code是非玩家的Code，IsShow为true
									                         case codeMgr:getObjectTypeByCode(TargetCode) of
										                         ?ObjTypePlayer ->
											                         case codeMgr:getObjectTypeByCode(HateCode) of
												                         ?ObjTypePlayer ->
													                         HateList = monsterState:getHateList(MonsterCode),
													                         ?DEBUG_OUT("changeBuffState[~p][~p][~p]", [TargetCode, IsShow, HateList]),
													                         psMgr:sendMsg2PS(HatePid, changeBuffState, IsShow andalso TargetCode =:= HateCode);
												                         _ ->
													                         skip
											                         end,
											                         {TargetCode, IsShow1};
										                         ?ObjTypePet ->
											                         PetEts = monsterState:getMapPetEts(MonsterCode),
											                         case myEts:lookUpEts(PetEts, TargetCode) of
												                         [#recMapObject{ownCode = EtsOwnCode} | _] ->
													                         {EtsOwnCode, IsShow1};
												                         _ ->
													                         {0, false}
											                         end;
										                         ?ObjTypeMonster ->
											                         MonsterEts = monsterState:getMapMonsterEts(MonsterCode),
											                         case myEts:lookUpEts(MonsterEts, TargetCode) of
												                         [#recMapObject{ownCode = EtsOwnCode} | _] ->
													                         {EtsOwnCode, IsShow1};
												                         _ ->
													                         {0, false}
											                         end;
										                         _ ->
											                         {0, false}
									                         end
							                         end,

							case RTargetCode > 0 of
								true ->
									mapWildBoss:updateWildBossTargetCode(MonsterCode, RTargetCode),

									Hate = #recHate{
										hateCode = HateCode,
										hatePid = HatePid
									},
									RealHateList = getRealHatePidList(MonsterCode, [Hate]),
									[psMgr:sendMsg2PS(PPid, wildBossChangeTarget, {RTargetCode, RIsShow}) || PPid <- RealHateList];
								_ ->
									skip
							end;
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.
-spec changeNewWildBossTarget(BossCode :: uint32(), AttackCode :: uint32()) -> ok.
changeNewWildBossTarget(BossCode, AttackCode) ->
	?LOG_OUT("changeNewWildBossTarget[~p][~p]", [BossCode, AttackCode]),
	monsterState:setAttackTarget(BossCode, AttackCode),
	monsterBattle:setAIBattleCondEvent(BossCode),
	mapWildBoss:updateWildBossTargetCode(BossCode, AttackCode),

	HateList_ = monsterState:getHateList(BossCode),
	RealHateList = getRealHatePidList(BossCode, HateList_),
	[psMgr:sendMsg2PS(PPid, wildBossChangeTarget, {AttackCode, true}) || PPid <- RealHateList],

	PlayerEts = monsterState:getMapPlayerEts(BossCode),
	Fun = fun(#recMapObject{code = PlayerCode, pid = PlayerPid}, AccIn) ->
		psMgr:sendMsg2PS(PlayerPid, changeBuffState, PlayerCode =:= AttackCode),
		AccIn
	      end,
	ets:foldl(Fun, 0, PlayerEts),
	ok.

%% 获取真实的仇恨列表PID
getRealHatePidList(BossCode, HateList) when is_list(HateList) ->
	F =
		fun(#recHate{hateCode = HateCode, hatePid = PPid}, Acc) ->
			case mapWildBoss:getRealAttacker(BossCode, HateCode, PPid) of
				{0, _} -> Acc;
				{_, RealPid} ->
					case lists:member(RealPid, Acc) of
						false ->
							[RealPid | Acc];
						_ -> Acc
					end
			end
		end,
	lists:foldl(F, [], HateList).