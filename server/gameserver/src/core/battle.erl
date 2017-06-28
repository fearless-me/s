%% @author luowei
%% @doc @todo 战斗相关.


-module(battle).
-author(luowei).

-include("gsInc.hrl").


%% ====================================================================
%% API functions
%% ====================================================================
-export([
	getAttackerTimes/3
	%% beAttackJudge/1
]).

-export([
	isBoss/1,
	isBoss/2,
	beJudge/6,
	isMainTarget/2,
	getPropValue/2,
	calcDamage/6,
	damageCalcForm/1,
	damageCalcAssistSkill/5,
	damageCalcAssistBuff/5
]).

finalFactor(?ObjTypePet, ?ObjTypePlayer) ->
	doFinalFactor(player_player_battlevalue);

finalFactor(?ObjTypePlayer, ?ObjTypePet) ->
	doFinalFactor(player_player_battlevalue);

finalFactor(?ObjTypePlayer, ?ObjTypePlayer) ->
	doFinalFactor(player_player_battlevalue);

finalFactor(?ObjTypePet, ?ObjTypeMonster) ->
	doFinalFactor(player_monster_battlevalue);

finalFactor(?ObjTypeMonster, ?ObjTypePet) ->
	doFinalFactor(player_monster_battlevalue);

finalFactor(?ObjTypePlayer, ?ObjTypeMonster) ->
	doFinalFactor(player_monster_battlevalue);

finalFactor(?ObjTypeMonster, ?ObjTypePlayer) ->
	doFinalFactor(player_monster_battlevalue);

finalFactor(_AttackerType, _DefenderType) ->
	float(1).

doFinalFactor(Key) ->
	case getCfg:getCfgByKey(cfg_skillBase, Key) of
		#skillBaseCfg{setpara = [V]} ->
			V;
		_ ->
			float(1)
	end.

%% 修改伤害计算
%% 要同步修改buff:doCalcBuffDamageToMe
%% 这两个暂时无法统一
calcDamage(
	AbsorbValue
	, DefenderCurHp
	, DefenderCode
	, DefenderProps
	, #recBeAttack{
		attackerProp = AttackProps
		, attackerCode = AttackerCode
		, skillID = SkillID
		, damagePlus = SkillPlus                        %%当前等级下的技能加法值
		, damageMultiply = SkillMultiply                    %%当前等级下的技能乘法值
		, kMagicFactor = KMagic
		, kPhysicalFactor = KPhysical
		, criticalDamageFactor = CriticalDamageFactor
	}
	, ResList
) ->
	#skillCfg{damageType = DamageType} = getCfg:getCfgPStack(cfg_skill, SkillID),

	{DamageBase, KFactor} =
		case DamageType of
			?SkillDamageTypePhys ->
				{battle:getPropValue(?Prop_PhysicalAttack, AttackProps), KPhysical};
			_ ->
				{battle:getPropValue(?Prop_MagicAttack, AttackProps), KMagic}
		end,

	DamageReduce = battle:getPropValue(?Prop_DamageReduce, DefenderProps),
	DamagePlus = battle:getPropValue(?Prop_DamagePlus, AttackProps),
	Fun =
		fun(R, {AccAbsorb, DefenderHp, Acc}) ->

			{NewAccAbsorb, NewHp, FinalDamage} = damageCalcForm(#recDamageCalcForm{
				skillOrBuffID = SkillID,
				attackerCode = AttackerCode,
				defenderCode = DefenderCode,
				defenderAbsorb = AccAbsorb,
				defenderHp = DefenderHp,
				result = R,
				damage = DamageBase,
				multiply = SkillMultiply,
				plus = SkillPlus,
				kFactor = KFactor,
				criticalDamageFactor = CriticalDamageFactor,
				damagePlus = DamagePlus,
				damageReduce = DamageReduce
			}),
			{NewAccAbsorb, NewHp, [-trunc(FinalDamage) | Acc]}
		end,
	{AV, HP, DL} = lists:foldl(Fun, {AbsorbValue, DefenderCurHp, []}, ResList),
	{AV, HP, lists:reverse(DL)}.


damageCalcForm(#recDamageCalcForm{
	skillOrBuffID = SkillID,
	attackerCode = AttackerCode,
	defenderCode = DefenderCode,
	defenderAbsorb = AccAbsorb,
	defenderHp = DefenderHp,
	result = R,
	damage = DamageBase,
	multiply = SkillMultiply,
	plus = SkillPlus,
	kFactor = KFactor,
	criticalDamageFactor = CriticalDamageFactor,
	damagePlus = DamagePlus,
	damageReduce = DamageReduce,
	layer = Layer
}) ->
	KDamageBase = (DamageBase * SkillMultiply * (1 - KFactor) + SkillPlus),
	FinalDamage1 =
		if
			R =:= ?HitResultBreakHead ->
				DamageBase * SkillMultiply + SkillPlus;
			R =:= ?HitResultCritical ->
				KDamageBase * CriticalDamageFactor;
			R =:= ?HitResultOrdinary ->
				KDamageBase;
			true ->
				0
		end,

	FinalFactor = finalFactor(
		codeMgr:getObjectTypeByCode(AttackerCode),
		codeMgr:getObjectTypeByCode(DefenderCode)
	),
	FinalDamage2 = FinalDamage1 * DamagePlus * DamageReduce * misc:rand(0.9, 1.1) * FinalFactor * Layer,
	{FinalDamage, NewAccAbsorb} =
		case AccAbsorb >= FinalDamage2 of
			true ->
				{0, AccAbsorb - FinalDamage2};
			_ ->
				{FinalDamage2 - AccAbsorb, 0}
		end,
	NewHp =
		case DefenderHp > FinalDamage of
			true ->
				DefenderHp - FinalDamage;
			_ ->
				0
		end,
	?DEBUG_OUT("skill/buff[~p],Result[~p],Base[~p],Multi[~p],Plus[~p],kFactor[~p],CriFactor[~p]",
		[SkillID, R, DamageBase, SkillMultiply, SkillPlus, KFactor, CriticalDamageFactor]),
	?DEBUG_OUT("DamgeR[~p],DamgePlus[~p],absorb[~p],F1[~p],F2[~p],F[~p]",
		[DamageReduce, DamagePlus, AccAbsorb, FinalDamage1, FinalDamage2, FinalDamage]),
	{NewAccAbsorb, NewHp, FinalDamage}.

%%获取攻击目标次数(如果攻击者使用乱影技能,则使用乱影技能攻击目标次数)
-spec getAttackerTimes(IsRan, RanTimes, Times) -> uint() when
	IsRan :: boolean(),
	RanTimes :: uint(),
	Times :: uint().
getAttackerTimes(true, RanTimes, _Times) ->
	RanTimes;
getAttackerTimes(_, _RanTimes, Times) ->
	Times.

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

%%判断是否为主目标
-spec isMainTarget(Code, MainCode) -> boolean() when
	Code :: uint(),
	MainCode :: uint().
isMainTarget(Code, MainCode) ->
	Code =:= MainCode.

-spec isBoss(CodeType, ID) -> boolean() when
	ID :: uint(),
	CodeType :: uint().
isBoss(?SpawnMonster, ID) ->
	#monsterCfg{monsterType = MonsterType} = getCfg:getCfgPStack(cfg_monster, ID),
	case MonsterType of
		1 ->
			true;
		_ ->
			false
	end;
isBoss(_, _) ->
	false.

isBoss(ID) ->
	#monsterCfg{
		monsterType = MonsterType
	} = getCfg:getCfgPStack(cfg_monster, ID),
	case MonsterType of
		1 ->
			true;
		_ ->
			false
	end.


getSkillKeyLevel(PropID, SkillLevel) ->
	Cfg = getCfg:getCfgByArgs(cfg_skillLevelParam, SkillLevel),
	case PropID of
		?Prop_HitLevel ->
			{Cfg#skillLevelParamCfg.dodgeParam1, Cfg#skillLevelParamCfg.dodgeParam2};
		?Prop_CriticalLevel ->
			{Cfg#skillLevelParamCfg.critParam1, Cfg#skillLevelParamCfg.critParam2};
		?Prop_ArmorPenetrationLevel ->
			{Cfg#skillLevelParamCfg.breakParam1, Cfg#skillLevelParamCfg.breakParam2};
		?Prop_CriticalDamageLevel ->
			{Cfg#skillLevelParamCfg.critdamage1, Cfg#skillLevelParamCfg.critdamage2};
		_ ->
			{0, 0}
	end.

getSkillPropRange(?Prop_HitLevel) ->
	doGetSkillPropRange(dodgeRange);
%%
getSkillPropRange(?Prop_CriticalLevel) ->
	doGetSkillPropRange(critRange);
%%
getSkillPropRange(?Prop_ArmorPenetrationLevel) ->
	doGetSkillPropRange(breakRange);
%%
getSkillPropRange(?Prop_DodgeLevel) ->
	doGetSkillPropRange(dodgeRange);
%%
getSkillPropRange(?Prop_PhysicalAttack) ->
	doGetSkillPropRange(phyAtkParam);
%%
getSkillPropRange(?Prop_MagicAttack) ->
	doGetSkillPropRange(magAtkParam);

%%
getSkillPropRange(?Prop_PhysicalDefence) ->
	doGetSkillPropRange(phyDefMax);
%%
getSkillPropRange(?Prop_MagicDefence) ->
	doGetSkillPropRange(magDefMax);
%%
getSkillPropRange(?Prop_CriticalDamageLevel) ->
	doGetSkillPropRange(critdamRange).

doGetSkillPropRange(Key) ->
	case getCfg:getCfgByArgs(cfg_skillBase, Key) of
		#skillBaseCfg{setpara = [V1, V2, V3]} ->
			{{V1, V2}, V3};
		#skillBaseCfg{setpara = [V11]} ->
			{{V11, V11}, 0};
		_ ->
			{{0, 1}, 0}
	end.

damageCalcAssistSkill(SkillID, SkillLv, AttackProps, DefenderProps, BeAttack) ->
	{MagicFactor, PhysicalFactor, CriticalDamageProp} =
		doDamageCalcAssist(SkillID, SkillLv, AttackProps, DefenderProps),
	BeAttack#recBeAttack{
		kMagicFactor = MagicFactor,
		kPhysicalFactor = PhysicalFactor,
		criticalDamageFactor = CriticalDamageProp
	}.

damageCalcAssistBuff(SkillID, SkillLv, AttackProps, DefenderProps, BuffData) ->
	{MagicFactor, PhysicalFactor, CriticalDamageProp} =
		doDamageCalcAssist(SkillID, SkillLv, AttackProps, DefenderProps),
	BuffData#recBuffInfo{
		kMagicFactor = MagicFactor,
		kPhysicalFactor = PhysicalFactor,
		criticalDamageFactor = CriticalDamageProp
	}.


doDamageCalcAssist(SkillID, SkillLv, AttackProps, DefenderProps) ->
	CriticalDamageProp = judgeForm(
		SkillID
		, SkillLv
		, AttackProps
		, ?Prop_CriticalDamageLevel
		, DefenderProps
		, ?Prop_TenaciousLevel
	),

	PhysicalFactor = kFactor(
		AttackProps
		, ?Prop_PhysicalAttack
		, DefenderProps
		, ?Prop_PhysicalDefence
	),

	MagicFactor = kFactor(
		AttackProps
		, ?Prop_MagicAttack
		, DefenderProps
		, ?Prop_MagicDefence
	),
	{MagicFactor, PhysicalFactor, CriticalDamageProp}.

kFactor(AttackProps, AttackKeyPropID, DefenderProps, DefenderKeyPropID) ->
	AttackPropVal = battle:getPropValue(AttackKeyPropID, AttackProps),
	DefenderPropVal = battle:getPropValue(DefenderKeyPropID, DefenderProps),
	{{AttackFactor, _}, _} = getSkillPropRange(AttackKeyPropID),
	{{DefenseFactor, _}, _} = getSkillPropRange(DefenderKeyPropID),
	DefenderPropVal / (DefenderPropVal + AttackPropVal * AttackFactor) * DefenseFactor.


skillCfgVal(PropID, SkillID) ->
	case getCfg:getCfgByArgs(cfg_skill, SkillID) of
		#skillCfg{} = Cfg ->
			doSkillCfgVal(PropID, Cfg);
		_ ->
			0
	end.

doSkillCfgVal(?Prop_CriticalLevel, #skillCfg{critOther = Cri}) ->
	Cri;
doSkillCfgVal(?Prop_HitLevel, #skillCfg{hitOther = Hit}) ->
	-Hit;
doSkillCfgVal(?Prop_ArmorPenetrationLevel, #skillCfg{breakOther = Armor}) ->
	Armor;
doSkillCfgVal(_Prop, _Cfg) ->
	0.

doPropProb(?Prop_CriticalLevel, AttackerProps, _DefenderProps) ->
	battle:getPropValue(?Prop_CriticalProb, AttackerProps);
doPropProb(?Prop_HitLevel, _AttackerProps, DefenderProps) ->
	battle:getPropValue(?Prob_DodgeProb, DefenderProps);
doPropProb(?Prop_ArmorPenetrationLevel, AttackerProps, _DefenderProps) ->
	battle:getPropValue(?Prop_ArmorPenetrationProb, AttackerProps);
doPropProb(_Prop, _AttackerProps, _DefenderProps) ->
	0.

calcBase(PropID, AttackerPropV, DefenderPropV) ->
	V =
		case PropID of
			?Prop_HitLevel ->
				DefenderPropV - AttackerPropV;
			_ ->
				AttackerPropV - DefenderPropV
		end,
	case V >= 0 of
		true ->
			V;
		_ ->
			0
	end.

judgeForm(SkillID, SkillLevel, AttackProps, AttackKeyPropID, DefenderProps, DefenderKeyPropID) ->
	AttackPropVal = battle:getPropValue(AttackKeyPropID, AttackProps),
	DefenderPropVal = battle:getPropValue(DefenderKeyPropID, DefenderProps),
	{SkillPropV1, SkillPropV2} = getSkillKeyLevel(AttackKeyPropID, SkillLevel),
	{{SkillPropMin, SkillPropMax}, SkillPropBase} = getSkillPropRange(AttackKeyPropID),

	SkillBaseVal = skillCfgVal(AttackKeyPropID, SkillID),
	PropProb = doPropProb(AttackKeyPropID, AttackProps, DefenderProps),

	BaseSubPropVal = calcBase(AttackKeyPropID, AttackPropVal, DefenderPropVal),
	Numerator = BaseSubPropVal + SkillPropV1,
	Denominator = BaseSubPropVal + SkillPropV2,

	Res1 =
		if
			Denominator =:= 0 ->
				float(0);
			true ->
				case Numerator / Denominator of
					V when is_number(V) ->
						V * SkillPropMax;
					Error ->
						?ERROR_OUT("error[~p]", [Error]),
						float(0)
				end
		end,


	Res2 = misc:clamp(Res1, SkillPropMin, SkillPropMax),
	Res2 + SkillBaseVal + SkillPropBase + PropProb.


beJudge(SkillID, SkillLv, _AttackLv, AttackProps, _DefenderLv, DefenderProps) ->
	CriticalProb = judgeForm(
		SkillID
		, SkillLv
		, AttackProps
		, ?Prop_CriticalLevel
		, DefenderProps
		, ?Prop_CriticalResistLevel
	),

	DodgeProp = judgeForm(
		SkillID
		, SkillLv
		, AttackProps
		, ?Prop_HitLevel
		, DefenderProps
		, ?Prop_DodgeLevel
	),

	ArmorPenetrationProb = judgeForm(
		SkillID
		, SkillLv
		, AttackProps
		, ?Prop_ArmorPenetrationLevel
		, DefenderProps
		, ?Prop_ArmorLevel
	),

	R = misc:rand(1, 100000) / 100000,

	?DEBUG_OUT("rand[~p], critiProb[~p], DodgeProb[~p], ArmorProb[~p]",
		[R, CriticalProb, DodgeProp, ArmorPenetrationProb]),

	if
		R =< CriticalProb ->
			?HitResultCritical;
		R =< (CriticalProb + DodgeProp) ->
			?HitResultDodge;
		R =< (CriticalProb + DodgeProp + ArmorPenetrationProb) ->
			?HitResultBreakHead;
		true ->
			?HitResultOrdinary
	end.



