%% @author luowei
%% @doc @todo buff伤害计算.


-module(buff).
-author(luowei).

-include("gsInc.hrl").


%% ====================================================================
%% API functions
%% ====================================================================
-export([
	calcBuffEndTime/3,
	calcProp/3,
	initBuffData/2,
	initBuffRec/3,
	makeBuffInfoFromBuff/1,
	calcProb/1,
	getPropValue/2,
	getGrowthValue/2,
	getBuffEffCount/2,
	getIndexGrowthValue/2,
	calcBuffDamageToMe/5,
	isCalcHurt/3,
	setParam/4,
	isTransformationBuff/1
]).

-export([
	getRingBuffTarget/7
]).
%% ====================================================================
calcBuffEndTime(Level, Factor, #buffCfg{buffDuration = Duration}) ->
	Now = time:getUTCNowMS(),
	case Duration of
		[0, _] ->
			0;
		[Duration1, AddLv] ->
			NewDuration = trunc(Duration1 + AddLv * (Level - 1)),
			Now + NewDuration * (1 + Factor)
	end.

%% ====================================================================
getRingBuffTarget(
	BuffID,
	#recMapObject{
		code = Code
		, x = Tx
		, y = Ty
		, mapPid = MapPid
		, groupID = GroupID
	} = Target
	, MapPid
	, PlayerEts
	, MonsterEts
	, KillList
	, Radius
) ->
	PList = mapView:getNearViewObject(MapPid, PlayerEts, ?ObjTypePlayer, {Tx, Ty}, GroupID),
	MList = mapView:getNearViewObject(MapPid, MonsterEts, ?ObjTypeMonster, {Tx, Ty}, GroupID),
	TargetCamp =
		case getCfg:getCfgByArgs(cfg_buff, BuffID) of
			#buffCfg{buffType = ?BuffTypeAdd} ->
				?Camp_Friendly;
			_ ->
				?Camp_Hostile
		end,
	filterTarget(
		codeMgr:getObjectTypeByCode(Code)
		, TargetCamp
		, Target
		, PList
		, MList
		, KillList
		, Radius
	).

filterTarget(
	?ObjTypePlayer
	, TargetCamp
	, Target
	, PlayerList
	, MonsterList
	, KillList
	, Radius
) ->
	PL = filterPlayerTarget(TargetCamp, Target, PlayerList, KillList, Radius),
	ML = filterTargetWithCamp(TargetCamp, Target, MonsterList, Radius),
	PL ++ ML;
filterTarget(
	_AnyType
	, TargetCamp
	, Target
	, PlayerList
	, MonsterList
	, _KillList
	, Radius
) ->
	PL = filterTargetWithCamp(TargetCamp, Target, PlayerList, Radius),
	ML = filterTargetWithCamp(TargetCamp, Target, MonsterList, Radius),
	PL ++ ML.

filterPlayerTarget(
	TargetCamp
	, #recMapObject{code = Code, id = ID} = Target
	, PlayerList
	, KillList
	, Radius
) ->
	TeamInfo = teamInterface:getTeamInfoWithRoleID(ID),
	lists:foldl(
		fun(#recMapObject{code = ObjCode} = Obj, Acc) ->
			if
				ObjCode =:= Code ->
					Acc;
				true ->
					case mapView:getObjectDist(Target, Obj) of
						{ok, Dist, _, _} ->
							case Dist =< Radius of
								true ->
									IsEnemy = camp:relationShip(false, TeamInfo, KillList, Target, Obj),
									case TargetCamp of
										?Camp_Hostile when IsEnemy ->
											[Obj | Acc];
										?Camp_Hostile ->
											Acc;
										_ when not IsEnemy ->
											[Obj | Acc];
										_ ->
											Acc
									end;
								_ ->
									Acc
							end;
						 _ ->
							 Acc
					end
			end
		end, [], PlayerList).

filterTargetWithCamp(
	TargetCamp
	, #recMapObject{code = Code, camp = TCamp} = Target
	, ObjectList
	, Radius
) ->
	Fun =
		fun(#recMapObject{code = ObjCode, camp = Camp} = Obj, Acc) ->
			if
				ObjCode =:= Code ->
					Acc;
				true ->
					case mapView:getObjectDist(Target, Obj) of
						{ok, Dist, _, _} ->
							case Dist =< Radius of
								true ->
									IsEnemy =
										case camp:getBattleCampRelationCfg(TCamp, Camp) of
											?Camp_Hostile ->
												true;
											_ ->
												false
										end,
									case TargetCamp of
										?Camp_Hostile when IsEnemy ->
											[Obj | Acc];
										?Camp_Hostile ->
											Acc;
										_ when not IsEnemy ->
											[Obj | Acc];
										_ ->
											Acc
									end;
								_ ->
									Acc
							end;
						_ ->
							Acc
					end
			end
		end,
	lists:foldl(Fun, [], ObjectList).
%% ====================================================================
%%判断buff是否计算伤害
isCalcHurt(DamagePlus, DamageMultiply, Status) ->
	case DamageMultiply =:= 0 andalso DamagePlus =:= 0 of
		true ->
			false;
		_ ->
			not battle:judgeInvincible(Status)
	end.
%%玩家战斗过程中buff初始化
-spec initBuffData(BuffID, SkillEffect) -> #recBuffInfo{} when
	BuffID :: uint(),
	SkillEffect :: #recSkillEffect{}.
initBuffData(BuffID, #recSkillEffect{} = SkillEffect) ->
	Now = time:getUTCNowMS(),
	Level = SkillEffect#recSkillEffect.level,
	Energy = SkillEffect#recSkillEffect.attackerEnergy,
	BattleProp = SkillEffect#recSkillEffect.attackerProp,
	BuffCfg = getCfg:getCfgPStack(cfg_buff, BuffID),
	Factor = getPropValue(BuffCfg#buffCfg.durationFactor, BattleProp),
	EndTime = calcBuffEndTime(Level, Factor, BuffCfg),
	InitBaseData =
		case SkillEffect#recSkillEffect.isCarrier of
			#recCasterInfo{} = CasterInfo ->
				#recBuffInfo{
					buffID = BuffID,
					level = Level,
					endTime = trunc(EndTime),
					attackerLevel = SkillEffect#recSkillEffect.attackerLevel,
					skillID = SkillEffect#recSkillEffect.skillID,
					casterSerial = SkillEffect#recSkillEffect.serial,
					attackerType = CasterInfo#recCasterInfo.casterType,
					attackerCode = CasterInfo#recCasterInfo.casterCode,
					attackerPid = CasterInfo#recCasterInfo.casterPid,
					attackerName = CasterInfo#recCasterInfo.casterName,
					attackPropList = BattleProp
				};
			_ ->
				#recBuffInfo{
					buffID = BuffID,
					level = Level,
					endTime = trunc(EndTime),
					attackerLevel = SkillEffect#recSkillEffect.attackerLevel,
					skillID = SkillEffect#recSkillEffect.skillID,
					casterSerial = SkillEffect#recSkillEffect.serial,
					attackerType = SkillEffect#recSkillEffect.attackerType,
					attackerCode = SkillEffect#recSkillEffect.attackerCode,
					attackerPid = SkillEffect#recSkillEffect.attackerPid,
					attackerName = SkillEffect#recSkillEffect.attackerName,
					attackPropList = BattleProp
				}
		end,
	setParam(InitBaseData, BattleProp, Level, Energy).


makeBuffInfoFromBuff(#recBuff{
	buffID = BuffID,
	layer = Layer,
	level = Level,
	skillID = SkillID,
	casterSerial = CasterSerial,
	endTime = EndTime,
	casterLevel = CasterLevel,
	casterType = CasterType,
	casterCode = CasterCode,
	casterPid = CasterPid,
	casterName = CasterName,
	casterPropList = CasterPropList,
	kMagicFactor = KMagicFactor,
	kPhysicalFactor = KPhysicalFactor,
	criticalDamageFactor = CriticalDamageFactor,
	damagePlus = DamagePlus,
	damageMultiply = DamageMultiply
}) ->
	#recBuffInfo{
		skillID = SkillID,
		casterSerial = CasterSerial,
		buffID = BuffID,
		layer = Layer,
		level = Level,
		endTime = EndTime,
		attackerLevel = CasterLevel,
		attackerType = CasterType,
		attackerCode = CasterCode,
		attackerPid = CasterPid,
		attackerName = CasterName,
		attackPropList = CasterPropList,
		kMagicFactor = KMagicFactor,
		kPhysicalFactor = KPhysicalFactor,
		criticalDamageFactor = CriticalDamageFactor,
		damagePlus = DamagePlus,
		damageMultiply = DamageMultiply
	}.

initBuffRec(
	Counter,
	BuffDamage,
	#recBuffInfo{buffID = BuffID, level = Level} = BuffData
) ->
	Now = time:getUTCNowMS(),
	Cfg = getCfg:getCfgPStack(cfg_buff, BuffID),
	BuffProp = buff:calcProp(BuffID, Level, 1),
	BuffDelay = Cfg#buffCfg.buffDelay,
	BuffStart = Cfg#buffCfg.buffStart,
	if
		BuffDelay =:= 0 ->
			TriggerTime = 0;
		BuffStart =:= 0 ->
			TriggerTime = BuffDelay + Now - ?Buff_DELAY_TIME;
		true ->
			TriggerTime = Now   %%立即触发有延迟
	end,
	#recBuff{
		buffID = BuffID,
		casterCode = BuffData#recBuffInfo.attackerCode,
		casterName = BuffData#recBuffInfo.attackerName,
		casterLevel = BuffData#recBuffInfo.attackerLevel,
		casterPid = BuffData#recBuffInfo.attackerPid,
		casterSerial = BuffData#recBuffInfo.casterSerial,
		casterPropList = BuffData#recBuffInfo.attackPropList,
		kMagicFactor = BuffData#recBuffInfo.kMagicFactor,
		kPhysicalFactor = BuffData#recBuffInfo.kPhysicalFactor,
		criticalDamageFactor = BuffData#recBuffInfo.criticalDamageFactor,
		skillID = BuffData#recBuffInfo.skillID,
		count = getBuffEffCount(BuffID, Level),
		layer = 1,
		level = Level,
		damage = BuffDamage,
		propList = BuffProp,
		type = Cfg#buffCfg.buffType,
		remove = Cfg#buffCfg.buffRemove,
		effect = Cfg#buffCfg.buffEffect,
		counter = Counter,
		multiBuffOneCaster = Cfg#buffCfg.multiBuffOneCaster,
		multiBuffMultiCaster = Cfg#buffCfg.multiBuffMultiCaster,
		endTime = BuffData#recBuffInfo.endTime,
		triggerTime = TriggerTime,
		damagePlus = BuffData#recBuffInfo.damagePlus,
		damageMultiply = BuffData#recBuffInfo.damageMultiply
	}.


calcBuffDamageToMe(BuffData, DefenderCode, AbsorbValue, DefenderLevel, DefenderProps) ->
	AttackProps = BuffData#recBuffInfo.attackPropList,
	Res = battle:beJudge(
		BuffData#recBuffInfo.skillID
		, BuffData#recBuffInfo.level
		, BuffData#recBuffInfo.attackerLevel
		, AttackProps
		, DefenderLevel
		, DefenderProps
	),

	NewBuffData = battle:damageCalcAssistBuff(
		BuffData#recBuffInfo.skillID
		, BuffData#recBuffInfo.level
		, AttackProps
		, DefenderProps
		, BuffData
	),

	doCalcBuffDamageToMe(DefenderProps, DefenderCode, AbsorbValue, NewBuffData, Res).


doCalcBuffDamageToMe(
	DefenderProps
	, DefenderCode
	, AbsorbValue
	, #recBuffInfo{
		buffID = BuffID
		, layer = Layer
		, attackerCode = AttackerCode
		, damagePlus = BuffPlus
		, damageMultiply = BuffMultiply
		, attackPropList = AttackProps
		, kMagicFactor = KMagic
		, kPhysicalFactor = KPhysical
		, criticalDamageFactor = CriticalDamageFactor
	}
	, R
) ->
	DamageReduce = battle:getPropValue(?Prop_DamageReduce, DefenderProps),
	DamagePlus = battle:getPropValue(?Prop_DamagePlus, AttackProps),
	#buffCfg{damageType = DamageType} = getCfg:getCfgPStack(cfg_buff, BuffID),

	{DamageBase, KFactor} =
		case DamageType of
			?SkillDamageTypePhys ->
				{battle:getPropValue(?Prop_PhysicalAttack, AttackProps), KPhysical};
			_ ->
				{battle:getPropValue(?Prop_MagicAttack, AttackProps), KMagic}
		end,

	{NewAccAbsorb, _NewHp, FinalDamage} = battle:damageCalcForm(#recDamageCalcForm{
		skillOrBuffID = BuffID,
		attackerCode = AttackerCode,
		defenderCode = DefenderCode,
		defenderAbsorb = AbsorbValue,
		defenderHp = 0,
		result = R,
		damage = DamageBase,
		multiply = BuffMultiply,
		plus = BuffPlus,
		kFactor = KFactor,
		criticalDamageFactor = CriticalDamageFactor,
		damagePlus = DamagePlus,
		damageReduce = DamageReduce,
		layer = Layer
	}),

	{FinalDamage, NewAccAbsorb}.

%%buff属性计算
-spec calcProp(BuffID, Level, Layer) -> list() when
	BuffID :: uint(),
	Level :: uint(),
	Layer :: uint().
calcProp(BuffID, Level, Layer) ->
	#buffCfg{property = Prop} = getCfg:getCfgPStack(cfg_buff, BuffID),
	calcProp(BuffID, Level, Layer, Prop).

calcProp(_BuffID, Level, Layer, Prop) when is_list(Prop) ->
	Fun = fun({CalcType, MutlOrPlus, PropIndex, Arg1, Arg2}, Acc) ->
		case CalcType of
			1 -> %%1号属性计算公式
				ProValue = (Arg1 + (Level - 1) * Arg2) * Layer;
			_ -> %%其它属性计算公式
				Value = getGrowthValue(Level, Arg2),
				ProValue = (Arg1 + Value) * Layer
		end,
		[{PropIndex, ProValue, MutlOrPlus} | Acc]
	      end,
	lists:foldl(Fun, [], Prop);
calcProp(_BuffID, _Level, _Layer, _) ->
	[].

%%获取配置表参数值
-spec getGrowthValue(Level, Arg) -> number() when
	Level :: uint(),
	Arg :: uint().
getGrowthValue(Level, Arg) ->
	Cfg = getCfg:getCfgPStack(cfg_indexGrowth, Level),
	case Arg of
		1 -> Cfg#indexGrowthCfg.index1;
		2 -> Cfg#indexGrowthCfg.index2;
		3 -> Cfg#indexGrowthCfg.index3;
		4 -> Cfg#indexGrowthCfg.index4;
		5 -> Cfg#indexGrowthCfg.index5;
		6 -> Cfg#indexGrowthCfg.index6;
		7 -> Cfg#indexGrowthCfg.index7;
		8 -> Cfg#indexGrowthCfg.index8;
		9 -> Cfg#indexGrowthCfg.index9;
		10 -> Cfg#indexGrowthCfg.index10;
		11 -> Cfg#indexGrowthCfg.index11;
		12 -> Cfg#indexGrowthCfg.index12;
		13 -> Cfg#indexGrowthCfg.index13;
		14 -> Cfg#indexGrowthCfg.index14;
		15 -> Cfg#indexGrowthCfg.index15;
		16 -> Cfg#indexGrowthCfg.index16;
		17 -> Cfg#indexGrowthCfg.index17;
		18 -> Cfg#indexGrowthCfg.index18;
		19 -> Cfg#indexGrowthCfg.index19;
		20 -> Cfg#indexGrowthCfg.index20;
		21 -> Cfg#indexGrowthCfg.index21;
		22 -> Cfg#indexGrowthCfg.index22;
		23 -> Cfg#indexGrowthCfg.index23;
		24 -> Cfg#indexGrowthCfg.index24;
		25 -> Cfg#indexGrowthCfg.index25;
		26 -> Cfg#indexGrowthCfg.index26;
		27 -> Cfg#indexGrowthCfg.index27;
		28 -> Cfg#indexGrowthCfg.index28;
		29 -> Cfg#indexGrowthCfg.index29;
		30 -> Cfg#indexGrowthCfg.index30;
		31 -> Cfg#indexGrowthCfg.index31;
		32 -> Cfg#indexGrowthCfg.index32;
		33 -> Cfg#indexGrowthCfg.index33;
		34 -> Cfg#indexGrowthCfg.index34;
		35 -> Cfg#indexGrowthCfg.index35;
		36 -> Cfg#indexGrowthCfg.index36;
		37 -> Cfg#indexGrowthCfg.index37;
		38 -> Cfg#indexGrowthCfg.index38;
		39 -> Cfg#indexGrowthCfg.index39;
		40 -> Cfg#indexGrowthCfg.index40;
		41 -> Cfg#indexGrowthCfg.index41;
		42 -> Cfg#indexGrowthCfg.index42;
		43 -> Cfg#indexGrowthCfg.index43;
		44 -> Cfg#indexGrowthCfg.index44;
		45 -> Cfg#indexGrowthCfg.index45;
		46 -> Cfg#indexGrowthCfg.index46;
		47 -> Cfg#indexGrowthCfg.index47;
		48 -> Cfg#indexGrowthCfg.index48;
		49 -> Cfg#indexGrowthCfg.index49;
		50 -> Cfg#indexGrowthCfg.index50;
		51 -> Cfg#indexGrowthCfg.index51;
		52 -> Cfg#indexGrowthCfg.index52;
		53 -> Cfg#indexGrowthCfg.index53;
		54 -> Cfg#indexGrowthCfg.index54;
		55 -> Cfg#indexGrowthCfg.index55;
		56 -> Cfg#indexGrowthCfg.index56;
		57 -> Cfg#indexGrowthCfg.index57;
		58 -> Cfg#indexGrowthCfg.index58;
		59 -> Cfg#indexGrowthCfg.index59;
		60 -> Cfg#indexGrowthCfg.index60;
		61 -> Cfg#indexGrowthCfg.index61;
		62 -> Cfg#indexGrowthCfg.index62;
		63 -> Cfg#indexGrowthCfg.index63;
		64 -> Cfg#indexGrowthCfg.index64;
		65 -> Cfg#indexGrowthCfg.index65;
		66 -> Cfg#indexGrowthCfg.index66;
		67 -> Cfg#indexGrowthCfg.index67;
		68 -> Cfg#indexGrowthCfg.index68;
		69 -> Cfg#indexGrowthCfg.index69;
		70 -> Cfg#indexGrowthCfg.index70;
		71 -> Cfg#indexGrowthCfg.index71;
		72 -> Cfg#indexGrowthCfg.index72;
		73 -> Cfg#indexGrowthCfg.index73;
		74 -> Cfg#indexGrowthCfg.index74;
		75 -> Cfg#indexGrowthCfg.index75;
		76 -> Cfg#indexGrowthCfg.index76;
		77 -> Cfg#indexGrowthCfg.index77;
		78 -> Cfg#indexGrowthCfg.index78;
		79 -> Cfg#indexGrowthCfg.index79;
		80 -> Cfg#indexGrowthCfg.index80;
		81 -> Cfg#indexGrowthCfg.index81;
		82 -> Cfg#indexGrowthCfg.index82;
		83 -> Cfg#indexGrowthCfg.index83;
		84 -> Cfg#indexGrowthCfg.index84;
		85 -> Cfg#indexGrowthCfg.index85;
		86 -> Cfg#indexGrowthCfg.index86;
		87 -> Cfg#indexGrowthCfg.index87;
		88 -> Cfg#indexGrowthCfg.index88;
		89 -> Cfg#indexGrowthCfg.index89;
		90 -> Cfg#indexGrowthCfg.index90;
		91 -> Cfg#indexGrowthCfg.index91;
		92 -> Cfg#indexGrowthCfg.index92;
		93 -> Cfg#indexGrowthCfg.index93;
		94 -> Cfg#indexGrowthCfg.index94;
		95 -> Cfg#indexGrowthCfg.index95;
		96 -> Cfg#indexGrowthCfg.index96;
		97 -> Cfg#indexGrowthCfg.index97;
		98 -> Cfg#indexGrowthCfg.index98;
		99 -> Cfg#indexGrowthCfg.index99;
		100 -> Cfg#indexGrowthCfg.index100;
		101 -> Cfg#indexGrowthCfg.index101;
		102 -> Cfg#indexGrowthCfg.index102;
		103 -> Cfg#indexGrowthCfg.index103;
		104 -> Cfg#indexGrowthCfg.index104;
		105 -> Cfg#indexGrowthCfg.index105;
		106 -> Cfg#indexGrowthCfg.index106;
		107 -> Cfg#indexGrowthCfg.index107;
		108 -> Cfg#indexGrowthCfg.index108;
		620 -> Cfg#indexGrowthCfg.index620;
		%109 -> Cfg#indexGrowthCfg.index109;
		_ ->
			?ERROR_OUT("getGrowthValue undefined index(~p)", [Arg]),
			0
	end.


%%获取配置表参数值
-spec getIndexGrowthValue(Level, Arg) -> number() when
	Level :: uint(),
	Arg :: uint().
getIndexGrowthValue(Level, Arg) ->
	Cfg = getCfg:getCfgPStack(cfg_indexGrowth, Level),
	case Arg of
		37 ->
			Cfg#indexGrowthCfg.index37;
		38 ->
			Cfg#indexGrowthCfg.index38;
		39 ->
			Cfg#indexGrowthCfg.index39;
		40 ->
			Cfg#indexGrowthCfg.index40;
		41 ->
			Cfg#indexGrowthCfg.index41;
		42 ->
			Cfg#indexGrowthCfg.index42;
		43 ->
			Cfg#indexGrowthCfg.index43;
		44 ->
			Cfg#indexGrowthCfg.index44;
		45 ->
			Cfg#indexGrowthCfg.index45;
		46 ->
			Cfg#indexGrowthCfg.index46;
		_ ->
			1
	end.


-spec getPropValue(PropIndex, PropList) -> number() when
	PropIndex :: uint(),
	PropList :: [#battleProp{}, ...].
getPropValue(PropIndex, PropList) ->
	case lists:keyfind(PropIndex, #battleProp.propIndex, PropList) of
		#battleProp{totalValue = TotalValue} ->
			TotalValue;
		_ ->
			0
	end.

calcProb(ProbValue) when ProbValue >= 1 ->
	true;
calcProb(ProbValue) when ProbValue > 0 andalso ProbValue < 1 ->
	RandomValue = random:uniform(10000),
	case ProbValue * 10000 >= RandomValue of
		true ->
			true;
		_ ->
			false
	end;
calcProb(_) ->
	false.

%%buff计算加法或者乘法值公式
setParam(#recBuffInfo{} = BuffData, BattleProp, Level, Energy) ->
	#buffCfg{
		damageMultiply = DamageMultiply,
		damagePlus = DamagePlus
	} = getCfg:getCfgPStack(cfg_buff, BuffData#recBuffInfo.buffID),
	BuffData#recBuffInfo{
		level = Level,
		damagePlus = calcForm(DamagePlus, Level, BattleProp, Energy),
		damageMultiply = calcForm(DamageMultiply, Level, BattleProp, Energy)
	}.

-spec calcForm(MultiplyOrPlus, SkillLevel, BattleProp, Energy) -> float() when
	MultiplyOrPlus :: number() | undefined,
	SkillLevel :: uint(),
	BattleProp :: [#battleProp{}, ...],
	Energy :: number().
calcForm(MultiplyOrPlus, SkillLevel, BattleProp, Energy) ->
	case is_list(MultiplyOrPlus) of
		true ->
			Fun = fun(Elem, Sum) ->
				case Elem of
					{1, Arg1, Arg2} ->
						Sum + Arg1 + (SkillLevel - 1) * Arg2;
					{2, Arg1, Arg2} ->
						Value = buff:getGrowthValue(SkillLevel, Arg2),
						Sum + Arg1 + Value;
					{3, Arg1, Arg2, PropKey} ->
						PropValue = getPropValue(PropKey, BattleProp),
						Sum + Arg1 + Arg2 * PropValue;
					{4, Arg1, Arg2} ->
						Sum + Arg1 + Arg2 * Energy;
					_ ->
						Sum
				end
			      end,
			lists:foldl(Fun, 0, MultiplyOrPlus);
		_ ->
			0
	end.

%%获取buff效果持续次数
-spec getBuffEffCount(BuffID, Level) -> uint() when
	BuffID :: uint(), Level :: uint().
getBuffEffCount(BuffID, Level) ->
	#buffCfg{
		buffDelay = Delay,
		buffDuration = [Dura, AddLevel],
		buffStart = Start
	} = getCfg:getCfgPStack(cfg_buff, BuffID),
	NewDura = Dura + AddLevel * (Level - 1),
	case NewDura =:= 0 orelse Delay =:= 0 of
		true ->
			0;
		_ ->
			case Start of
				0 ->
					NewDura div Delay;
				_ ->
					(NewDura div Delay) + 1
			end
	end.

%% 是否有变形BUFF
-spec isTransformationBuff(BuffID :: uint()) -> boolean().
isTransformationBuff(0) ->
	false;
isTransformationBuff(BuffID) ->
	L = globalCfg:getTransformationBuff(),
	lists:member(BuffID, L).