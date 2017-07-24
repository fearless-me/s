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
	calcDamage/3,
	damageCalcForm/1,
	damageCalcAssistSkill/5,
	damageCalcAssistBuff/5,
	judgeInvincible/1
]).

%%无敌判定

judgeInvincible(Status) ->
	misc:testBit(Status, ?CreatureSpeStautsInvincible).

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
	#recDefender{
		status = Status
		, absorbValue = AbsorbValue
		, curHp = DefenderCurHp
	} = Defender
	, BeAttack
	, ResList
) ->
	case battle:judgeInvincible(Status) of
		true ->
			{AbsorbValue, DefenderCurHp, []};
		_ ->
			doCalcDamage(Defender, BeAttack, ResList)
	end.

doCalcDamage(
	#recDefender{
		code = DefenderCode
		, absorbValue = AbsorbValue
		, curHp = DefenderCurHp
		, props = DefenderProps
	}
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


skillCfgVal(_PropID, 0) ->
	0;
skillCfgVal(0, _SkillID) ->
	0;
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


%%
%%
%%	战斗公式
%%	属性
%%	1	属性介绍
%%	生命：标志着单位的生存能力，改变到0时，执行其死亡后的逻辑
%%	物攻：物理技能以物攻计算其伤害 。
%%	法攻：法术技能以法攻计算其伤害。
%%	物防：所有职业都有，通过公式转化为减伤率
%%	法防：所有职业都有，通过公式转化为减伤率
%%	暴击等级：通过公式转换成暴击率。
%%	抗爆等级：通过公式转换成减免暴击率。
%%	爆伤等级：通过公式转换成暴击伤害率。
%%	韧性等级：通过公式转换成减免爆伤率。
%%	命中等级：通过公式转换成命中率。
%%	闪避等级：通过公式转换成闪避率。
%%	破甲等级：通过转换公式，转换成破甲率，当命中公式判断为破甲伤害时，则忽略对方护甲
%%	坚固等级：通过转换公式减免破甲率
%%	Hp自动回复：战斗外Hp自动回复						//目前此属性是一直会回复，需要改成战斗之外才回复。
%%
%%	战斗计算公式
%%	1	属性转换
%%	对象——攻方【A】，守方【D】，攻方技能【S】，攻方buff【B】
%%	定义——护甲减伤率【K】
%%	返回值——1暴击，2闪避，3破甲，4普攻。按照1234的顺序做圆桌判定。
%%
%%	float A.暴击率=（A.暴击等级-D.抗暴等级+暴击系数1）/（A.暴击等级-D.抗暴等级+暴击系数2）*暴击最大值 ；													//左侧红色字体属性为需要配置的值，黑色字体属性为读取角色的当前属性总值。
%%	（A.暴击等级-D.抗暴等级）≥0												//建立【SkillBase】表，用于配置固定数值。见下。
%%	暴击最小值<A.暴击率<暴击最大值												//建立【SkillLevelParam】表，用于配置和等级相关的数值。见下。
%%	float A.实际暴击率=A.暴击率 +暴击基础值 + S.暴击率 + 附加暴击率 ；													//S.命中率，S.暴击率，S.破甲率为【skill】表的新增配置字段。附加暴击率为属性。
%%
%%	float D.闪避率=（D.闪避等级-A.命中等级+闪避系数1）/（D.闪避等级-A.命中等级+闪避系数2）*闪避最大值；
%%	（D.闪避等级-A.命中等级）≥0												//暴击破甲爆伤有最小值和最大值的限制，闪避只有最大值的限制。
%%	闪避最小值<D.闪避率<闪避最大值
%%	float D.实际闪避率=A.闪避率+ 闪避基础值 - S.命中率 + 附加闪避率；
%%
%%	float A.破甲率=（A.破甲等级-D.坚固等级+破甲系数1）/（A.破甲等级-D.坚固等级+破甲系数2）*破甲最大值；
%%	（A.破甲等级-D.坚固等级）≥0
%%	破甲最小值<A.破甲率<破甲最大值
%%	float A.实际破甲率=A.破甲率 + 破甲基础值 + S.破甲率 + 附加破甲率；
%%
%%	float A.爆伤率=（A.爆伤等级-D.韧性等级+爆伤系数1）/（A.爆伤等级-D.韧性等级+爆伤系数2）*爆伤最大值 ;
%%	（A.爆伤等级-D.韧性等级）≥0
%%	爆伤最小值<A.实际爆伤率<爆伤最大值
%%	float A.实际爆伤率=A.爆伤率  + 爆伤基础值 ；
%%
%%
%%	【skill】字段
%%	if   (A.技能伤害类型=物理技能）							//技能是物理技能还是魔法技能在【skill】表中配置							S.暴击率	S.破甲率	S.命中率
%%	{														CritOther	BreakOther	HitOther
%%	K=D.物防/（D.物防+A.物理攻击*物攻系数）*物免最大系数						//物攻系数和法攻系数配置在【SkillBase】表中。
%%	}														【SkillBase】			【SkillLevelParam】		//level为人物等级，实际取  MIN（A.等级，D.等级），即进攻方和防守方等级较小的一方等级
%%	else																	字段注释	闪避系数1	闪避系数2	暴击系数1	暴击系数2	破甲系数1	破甲系数2	爆伤系数1	爆伤系数2
%%	{														Param	value		level	DodgeParam1	DodgeParam2	CritParam1	CritParam2	BreakParam1	BreakParam2	Critdamage1	Critdamage2
%%	K=D.法防/（D.法防+A.魔法攻击*法攻系数）*法免最大系数												字段注释	string	int		int	float	float	float	float	float	float	float	float
%%	}													暴击最大值	critMax			1
%%	endif									 				暴击最小值	CritMin			2
%%	闪避最大值	dodgeMax			3
%%	2	战斗判定														破甲最大值	breakMax			4
%%	A.物理技能伤害=A.物攻*S.乘法值*（1-K）+S.加法值							//技能乘法值和技能加法值随技能等级成长而成长						破甲最小值	breakMin			5
%%	A.魔法技能伤害=A.法攻*S.乘法值*（1-K）+S.加法值							//乘法值为等差成长，加法值为列表固定值成长						爆伤最大值	critdamMax			6
%%	float r=随机数【0,1)；													爆伤最小值	critdamMin			7
%%	if (r<=A.实际暴击率)													爆伤基础值	critdamBase			8
%%	{													物攻系数	phyAtkParam			9
%%	return 1;//暴击							//暴击时计算爆伤						法攻系数	magAtkParam			10
%%	A.实际物理伤害=A.物理技能伤害*A.实际爆伤率													物免最大系数	phyDefMax			11
%%	A.实际魔法伤害=A.魔法技能伤害*A.实际爆伤率													法免最大系数	magDefMax			12
%%	}																	13
%%	elseif (A.实际暴击率<r<=A.实际暴击率+D.实际闪避率)																	-----
%%	{																	50
%%	return 2;//闪避							//闪避时攻击无效
%%	攻击无效
%%	}
%%	elseif (A.实际暴击率+D.实际闪避率<r<=A.实际暴击率+D.实际闪避率+A.实际破甲率)
%%	{
%%	return 3;//破甲							//破甲时无视防御
%%	A.实际物理伤害=A.物攻*S.乘法值+S.加法值
%%	A.实际魔法伤害=A.法攻*S.乘法值+S.加法值
%%	}
%%	else
%%	{
%%	return 4;//普攻
%%	A.实际物理伤害=A.物理技能伤害
%%	A.实际魔法伤害=A.魔法技能伤害
%%	}
%%	endif
%%
%%	A.最终物理伤害=A.实际物理伤害*( 1 + A.伤害加成 ) * ( 1 - D.伤害减免 )* random(0.9,1.1)*类型系数 - D.吸收盾剩余											//伤害加成和减免为伤害计算的最后一步				//以下条件，表示两者相互攻击的类型系数为A：
%%	A.最终魔法伤害=A.实际魔法伤害*( 1 + A.伤害加成 ) * ( 1 - D.伤害减免 )*random(0.9,1.1)*类型系数 - D.吸收盾剩余											//采用累乘方式，使战斗力节奏更慢，突出技能效果。				//人vs怪物，宠物vs怪物
%%	end											//吸收盾公式见【特殊属性】分页。
%%	//以下条件，表示两者相互攻击的类型系数为B：
%%	3	buff伤害																//人vs人，人vs宠物，宠物vs宠物
%%	A.物理buff单次伤害=A.物攻*B.乘法值*（1-K）+B.加法值							//buff伤害计算取buff的乘法值和加法值
%%	A.魔法buff单次伤害=A.法攻*B.乘法值*（1-K）+B.加法值
%%	float r=随机数【0,1)；
%%	if (r<=A.实际暴击率)
%%	{
%%	return 1;//暴击
%%	A.实际物理buff伤害=A.物理buff单次伤害*A.实际爆伤率
%%	A.实际魔法buff伤害=A.魔法buff单次伤害*A.实际爆伤率
%%	}
%%	elseif (A.实际暴击率+D.实际闪避率<r<=A.实际暴击率+A.实际破甲率)								//buff伤害无闪避
%%	{
%%	return 3;//破甲
%%	A.实际物理buff伤害=A.物攻*B.乘法值+B.加法值
%%	A.实际魔法buff伤害=A.法攻*B.乘法值+B.加法值
%%	}
%%	else
%%	{
%%	return 4;//普攻
%%	A.实际物理buff伤害=A.物理buff单次伤害
%%	A.实际魔法buff伤害=A.魔法buff单次伤害
%%	}
%%	endif															//类型系数：
%%	A.最终物理buff伤害=A.实际物理伤害*( 1 + A.伤害加成 ) * ( 1 - D.伤害减免 )*random(0.9,1.1)*buff层数*类型系数 - D.吸收盾剩余															//攻守双方为人和怪物时，类型系数为配置值A
%%	A.最终魔法buff伤害=A.实际魔法伤害*( 1 + A.伤害加成 ) * ( 1 - D.伤害减免 )*random(0.9,1.1)*buff层数*类型系数 - D.吸收盾剩余												//吸收盾公式见【特殊属性】分页。			//攻守双方为人和人时，类型系数为配置值B
%%	end
%%
%%
%%	4	治疗
%%	A.技能治疗=A.属性索引值*S.乘法值+S.加法值							//属性索引值为玩家任意属性id的值。
%%
%%	A.最终治疗=A.技能治疗*（1 + A.治疗效果）*random(0.9,1.1)*buff层数							//治疗技能无暴击无破甲，必命中
%%
%%
%%	5	治疗buff
%%	A.buff单次治疗=A.属性索引值*B.乘法值+B.加法值							//属性索引值为玩家任意属性id的值。
%%
%%	A.最终buff单次治疗=A.buff单次治疗*（1 + A.治疗效果）*random(0.9,1.1)*buff层数								//治疗技能无暴击无破甲，必命中
%%
%%	A.buff治疗总量=A.最终buff单次治疗*时间间隔							//治疗buff每隔一定时间生效一次。
%%
%%






