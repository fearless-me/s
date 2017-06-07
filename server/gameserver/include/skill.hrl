%%%技能相关定义
-author(zhongyuanwei).
-ifndef(Skill_hrl).
-define(Skill_hrl, 1).

-include("char.hrl").

%%0 无伤害类型，依据武器来
%%1 物理伤害
%%2 魔法伤害
%%6 治疗
-define(SkillDamageTypeDefault, 0).
-define(SkillDamageTypePhys, 1).
-define(SkillDamageTypeMagic, 2).
-define(SkillDamageTypeMedicine, 6).

%% 技能系
-define(SkillMixture, 0).  %%混合系
-define(SkillPhysisc, 1).  %%物理系
-define(SkillMagic, 2).  %%魔法系

%% 技能目标范围(单体目标技能)
-define(SingleSkillEnemy, 0).  %%单个敌人(主)
-define(SingleSkillMy, 1).  %%自己(主)
-define(SingleSkillMyMaster, 2).  %%自己主人(宠物技能)(主)
-define(SingleSkillMyPet, 3).  %%自己宠物(主)
%% AOE对自己施放
-define(MutiSkillCirMyEnemy, 5).  %%自身周围敌人(圆形)
-define(MutiSkillCirMyTeam, 6).  %%自身周围队友(圆形)(主)
-define(MutiSkillSecEnemy, 7).  %%自身朝向敌人(扇形)
-define(MutiSkillAngEnemy, 9).  %%自身朝向敌人(矩形)
-define(MutiSkillSecMyEnemy, 8).  %%自身和敌人连线(扇形)(主)
-define(MutiSkillAngMyEnemy, 10).  %%自身和敌人连线(矩形)(主)
%% AOE对敌人施放
-define(MutiSkillCirEnemy, 4).  %%敌人周围目标(圆形) (主)
-define(MutiTranSkillCirMyEnermy, 11). %%敌人位置圆形（副）
-define(MutiTranSkillSecMyEnermy, 12). %%敌人位置扇形（副）


%% 技能目标类型
-define(SkillTargetTypeMonster, 1).   %%怪物
-define(SkillTargetTypePlayer, 2).   %%玩家
-define(SkillTargetTypePet, 4).   %%宠物

%%技能杂项
-define(SkillOther, 0).   %%其他技能
-define(SkillRan, 1).   %%乱影技能
-define(SkillTrigger, 3).   %%不能被Buff技能触发
-define(SkillCall, 4).   %%技能调用


%%技能类型
%%-define(KnightSkill, 101).   %%骑士技能
%%-define(MagicianSkill, 201).   %%法师技能
%%-define(BravoSkill, 301).   %%刺客技能
%%-define(ReaperSkill, 4).   %%萝莉技能
-define(MonsterSKill, 5).   %%怪物技能
-define(PetSkill, 6).   %%宠物技能
-define(GuildSkill, 7).   %%公会技能
-define(GoodsSkill, 8).   %%物品技能
-define(SystemSkill, 9).   %%系统技能
-define(ShapeSkill, 10).   %%变身技能
-define(ShapegetSkill, 11).   %%变身获得的技能
-define(MountSkill, 12).   %%坐骑技能
-define(GemSkill, 13).   %%宝石技能
-define(GodWeaponSkill, 14).   %%神器技能
-define(PlayerWingSkill, 15).   %%翅膀技能
-define(PlayerMechanicSkill, 16).   %%机械技能
-define(PetFairySkill, 17).  %%宠物精灵技能
-define(MarrigeSkill, 19).  %%夫妻技能
-define(GoddessSkill, 20).  %%女神技能

-define(RoleSkill, [
	?Career_10_Warrior,
	?Career_11_Guardian,?Career_11_Fighter,
	?Career_12_Footman, ?Career_12_Swordsmen,?Career_12_Mercenary,

	?Career_20_Magician,
	?Career_21_GodSworn,?Career_21_Wizard,
	?Career_22_Priest,?Career_22_Warlock,?Career_22_Monk,

	?Career_30_Bravo,
	?Career_21_Traveler,?Career_21_Rogue,
	?Career_22_Archer,?Career_22_Thief,?Career_22_Scout
]).

%% AOE类型
-define(SkillAOETypeNone, [?SingleSkillEnemy, ?SingleSkillMy, ?SingleSkillMyMaster, ?SingleSkillMyPet]).    %%   非AOE
-define(SkillAOETypeCircle, [?MutiSkillCirEnemy, ?MutiSkillCirMyEnemy, ?MutiSkillCirMyTeam, ?MutiTranSkillCirMyEnermy]).            %%   圆形Aoe
-define(SkillAOETypeSector, [?MutiSkillSecEnemy, ?MutiSkillSecMyEnemy]).                                %%   扇形Aoe
-define(SkillAOETypeRect, [?MutiSkillAngEnemy, ?MutiSkillAngMyEnemy, ?MutiTranSkillSecMyEnermy]).                                %%   矩形Aoe

%% 仇恨列表操作
-define(AddHate, 1).   %%新增仇恨列表
-define(DelHate, 2).   %%删除仇恨列表

%%攻击者类型

-define(AttackerTypePlayer, 1).  %%玩家
-define(AttackerTypePet, 2).  %%宠物
-define(AttackerTypeNormalMonster, 3).  %%普通怪物
-define(AttackerTypeBoss, 4).  %%BOSS怪物

%%攻击方式
-define(NoAttack, 0).  %%非攻击
-define(NearAttack, 1).  %%近战攻击
-define(FarAttack, 2).  %%远程攻击
-define(MagicAttack, 3).  %%魔法攻击

%%技能效果影响目标
-define(TargetToAll, 0).  %%作用技能选择所有目标
-define(TargetToMyselfOne, 1).  %%作用自己一次
-define(TargetToMyselfMulti, 2).  %%作用自己多次
-define(TargetToMain, 3).  %%作用技能选择的主目标
-define(TargetToAssi, 4).  %%作用技能选择的副目标

%%触发技能目标选择
-define(RandomTarget, 0).  %%与上个技能无关
-define(SelectTarget, 1).  %%上个技能的目标作为主目标
-define(RandomTarget1, 2).  %%与攻击者和载体主人无关
-define(SelectTarget1, 3).  %%以攻击者和载体主人为主目标

%%创建技能效果条件
-define(NoCondition, 0).  %%直接创建
-define(DodageCondition, 1).  %%非招架非闪避
-define(CriticalCondition, 2).  %%暴击创建

%%默认的攻击间隔时间
-define(DefaultAttackInternalTime, 1000).

%%技能类型
-define(PassivitySkill, 0).  %%被动技能
-define(InstantSkill, 1).  %%瞬发技能
-define(SingSkill, 2).  %%吟唱技能
-define(GuideSkill, 3).  %%引导技能
-define(CarrierSkill, 4).  %%载体技能
-define(AttackTriggerSkill, 5).  %%攻击目标触发技能
-define(NoAttackTriggerSkill, 6).  %%非攻击目标触发技能
-define(BeAttackTriggerSkill, 7).  %%被攻击目标触发技能
-define(ReleaseTriggerSkill, 8).  %%释放技能触发技能
-define(DeadTriggerSkill, 9).  %%死亡技能触发技能
-define(BuffCallSkill, 10). %%buff调用技能
-define(AssistTriggerSkill, 11). %%协助击杀触发技能
-define(ActiveSkillList, [?InstantSkill, ?SingSkill, ?GuideSkill]). %%主动技能列表
-define(TriggerSkill, [?AttackTriggerSkill, ?NoAttackTriggerSkill, ?BeAttackTriggerSkill,
	?ReleaseTriggerSkill, ?DeadTriggerSkill, ?AssistTriggerSkill]).
-define(PassSkillList, [?PassivitySkill | ?TriggerSkill]).%%被动技能列表

%%特殊被动技能
-define(SpecPassSkill1, 1). %%站立不动获得buff
-define(SpecPassSkill2, 2). %%给宠物增加buff
-define(SpecPassSkill3, 3). %%角色生命低于一定百分比获得buff
-define(SpecPassSkill4, 4). %%角色生命高于一定百分比获得buff
-define(SpecPassSkill5, 5). %%对敌人生命低于一定百分比增加伤害系数
-define(SpecPassSkill6, 6). %%对敌人生命高于一定百分比增加伤害系数

%%技能连击间隔时间
-define(ComboSkillInternalTime, 1000 * 5).

%%攻击结果类型
-define(RestoreHp, 1).   %%击中回血
-define(BackHp, 2).   %%反弹伤害

%%是否可以使用技能标示
-define(NoUseSpec, 0).   %%不能使用
-define(UseSpec, 1).   %%可以使用

%%技能槽编号
-define(HideSlot, 0).   %%隐藏技能槽编号

%%技能升级类型
-define(IncreMentUp, 0).   %%随着对象等级升级
-define(LearnUp, 1).   %%随着学习等级升级
-define(StrUp, 2).   %%强化升级
-define(FixedUp, 3).   %%固定升级
-define(RandomUp, 4).   %%随机升级

%%技能槽对应索引编号
-define(ActiveSkill1, 1).   %%主动技能1号位置
-define(ActiveSkill2, 2).   %%主动技能2号位置
-define(ActiveSkill3, 3).   %%主动技能3号位置
-define(ActiveSkill4, 4).   %%主动技能4号位置
-define(ActiveSkill5, 5).   %%主动技能5号位置

-define(PassiveSkill1, 51).  %%被动技能1号位置
-define(PassiveSkill2, 52).  %%被动技能2号位置
-define(PassiveSkill3, 53).  %%被动技能3号位置
-define(PassiveSkill4, 54).  %%被动技能4号位置
-define(PassiveSkill5, 55).  %%被动技能5号位置

-define(Transfiguration1, 101). %%变身技能1号位置
-define(Transfiguration2, 102). %%变身技能2号位置
-define(Transfiguration3, 103). %%变身技能3号位置
-define(Transfiguration4, 104). %%变身技能4号位置
-define(Transfiguration5, 105). %%变身技能5号位置

%%切磋相关宏
-define(BattleLearnInterval, 10). %%切磋间隔时间间隔(单位:秒)
-define(BattleLearnLv, 25). %%切磋最低等级
-define(BattleLearnAgree, 1).  %%同意切磋
-define(BattleLearnCdStart, 0).  %%开始倒计时
-define(BattleLearnCdEnd, 1).  %%结束倒计时
-define(BattleLearnTriggerCD, 1).  %%触发倒计时
-define(BattleLearnCDTime, 6000).  %%倒计时时间
-define(BattleLearnTime, 5 * 60 * 1000).%%切磋时间
-define(BattleLearnFailure, 0).  %%切磋失败
-define(BattleLearnWin, 1).  %%切磋胜利
-define(BattleLearnDraw, 2).  %%切磋平局

-record(recCurUseSkill, {
	skillID = 0,                    %%技能ID
	serial = 0,                    %%客户端发过来的战斗序号
	usedCount = 0,                %%已经释放次数
	targetCode = [],            %%目标列表
	mainCode = 0,               %%主目标
	triggerTime = 0,            %%下次触发时间
	costEnergy = 0              %%消耗能量值
}).

-record(recDamage, {
	magicDamage = 0,                    %%神圣伤害
	physDamage = 0,                    %%物理伤害
	shadowDamage = 0,                %%暗影伤害
	elementDamage = 0,                %%元素伤害
	chaosDamage = 0                    %%混乱伤害
}).

-record(recDamageCalcForm,{
	skillOrBuffID,
	attackerCode,
	defenderCode,
	defenderHp,
	defenderAbsorb,
	result,
	damage,
	multiply,
	plus,
	kFactor,
	criticalDamageFactor,
	damagePlus,
	damageReduce,
	layer = 1
}).

-record(recResistAndDef, {
%%	holyresist,                %%神圣抗性
%%	physicalresist,            %%物理抗性
%%	shadowresist,              %%暗影抗性
%%	elementresist,             %%元素抗性
%%	chaosresist,               %%混乱抗性
%%	holyDef,                   %%神圣防御
%%	physicalDef,               %%物理防御
%%	shadowDef,                 %%暗影防御
%%	elementDef,                %%元素防御
%%	chaosDef,                   %%混乱防御
%%	下面的才有用
	level,
	physicalDef, %%物理防御
	magicalDef,
	tenaciousLevel,
	criticalLv,
	dodgeLevel,
	damageReduce
}).

-record(recDamageFixArg, {
	tough,                        %%坚韧
	defBoss,                    %%防御首领伤害乘数
	attackBoss                    %%攻击者攻击首领伤害乘数修正
}).

-record(recSlotSkill, {
	skillID = 0,                      %%技能ID
	slot = 0,                         %%插槽索引
	type = 0,                         %%技能类型
	time = 0,                         %%装配时间
	canUseCount = 0,                  %%可使用次数
	isModified = false                %%是否有修改
}).

-record(recSkill, {
	skillID = 0,                        %%技能ID
	level = 0,                            %%技能等级
	damagePlus = 0,                        %%当前等级下的技能加法值
	damageMultiply = 1,                    %%当前等级下的技能乘法值
	%%自上次保存数据库后，是否有改变
	isModified = false,
	damage = 0
}).

-record(recSkillEffect, {
	skillID,                           %%技能ID
	level,                               %%技能等级
	targetDamageList,                   %%技能目标伤害列表
	targetCode,                        %%技能目标Code
	targetPid,                         %%技能目标Pid
	targetX,                           %%技能目标X坐标
	targetY,                           %%技能目标Y坐标
	targetType,                        %%技能目标类型
	targetID,                          %%技能目标ID
	targetMainCode,                    %%技能主目标Code
	callMonsterList,                   %%攻击者召唤怪物数量
	callCarrierList,                   %%攻击者召唤载体数量
	attackerCode,                      %%攻击者code
	attackerLevel,                        %%攻击者等级
	attackerName,                      %%攻击者名字
	attackerPid,                       %%攻击者Pid
	attackerID,                        %%攻击者ID
	attackerType,                      %%攻击者类型
	attackerEnergy,                    %%攻击者能量值
	attackerPkMode,                    %%攻击者PKmode
	attackerCamp,                      %%攻击者阵营
	attackerGroupID,                   %%攻击者分组ID
	attackerGuildID,                   %%攻击者公会ID
	attackerTeamID,                    %%攻击者队伍ID
	attackerProp,                      %%攻击者战斗属性
	serial,                            %%攻击者技能序列号
	isCarrier                          %%攻击者是否为载体
}).

-record(recCasterInfo, {
	casterId = 0,                            %%施法者ID
	casterCode = 0,                          %%施法者code
	casterName = "",                         %%施法者Name
	casterPid = 0,                           %%施法者Pid
	casterType = 0,                          %%施法者类型
	casterPkMode = 0                         %%施法者Pk模式
}).

-record(recBeAttack, {
	skillID,                            %%攻击者使用的技能ID
	skillLevel,                                %%技能等级
	serial,                            %%客户端发过来的战斗序号
	attackerCode,                        %%攻击者流水号
	attackerName,                      %%攻击者名称
	attackerProp,                      %%攻击者战斗属性
	attackerLevel,                        %%攻击者等级
	attackerEnergy,                    %%攻击者能量值
	attackerPkMode,                    %%攻击者PKmode
	attackerID,                        %%攻击者ID
	attackerPid,                       %%攻击者Pid
	attackerCamp,                      %%攻击者阵营
	attackerGuildID,                   %%攻击者公会ID
	attackerTeamID,                    %%攻击者队伍ID
	attackerGroupID,                   %%攻击者分组
	attackerType,                        %%攻击者的类型
	callMonsterList,                   %%攻击者召唤怪物列表
	callCarrierList,                   %%攻击者召唤载体列表
	specSkillList,                     %%攻击者特殊被动技能列表
	mainCode,                          %%攻击主目标Code
	targetCode,                        %%目标流水号
	damagePlus,                        %%当前等级下的技能加法值
	damageMultiply,                    %%当前等级下的技能乘法值
	isCarrier,                         %%是否是载体
	isRan,                             %%是否是乱影技能
	times,                             %%乱影次数
	damage,
	kMagicFactor = 0.0,
	kPhysicalFactor = 0.0,
	criticalDamageFactor = 0.0
}).

-record(recBeTreat, {
	skillID,                            %%攻击者使用的技能ID
	serial,                            %%客户端发过来的战斗序号
	level,                             %%攻击者技能等级
	attackerCode,                        %%攻击者流水号
	attackerName,                      %%攻击者名字
	attackerPid,                        %%攻击者的Pid
	attackerID,                        %%攻击者ID
	attackerLevel,                        %%攻击者等级
	attackerPkMode,                    %%攻击者PKmode
	attackerCamp,                      %%攻击者阵营
	attackerEnergy,                    %%攻击者能量值
	attackerGuildID,                   %%攻击者公会ID
	attackerGroupID,                   %%攻击者分组ID
	attackerTeamID,                    %%攻击者队伍ID
	attackerType,                        %%攻击者的类型
	callMonsterList,                   %%攻击者召唤怪物数量
	callCarrierList,                   %%攻击者召唤载体数量
	mainTarget,                        %%攻击主目标
	isCarrier,                         %%是否是载体
	attackerProp,                      %%攻击者战斗属性
	effectList,                        %%技能触发的效果列表ID
	skillTotalTreat                    %%技能治疗
}).

-record(recAttackTargetDamage, {
	skillID,                    %%攻击者使用的技能ID
	serial,                    %%客户端发过来的战斗序号
	attackerCode,            %%攻击者的Code
	attackerHit,             %%攻击者的技能效果列表(暴击，命中等)
	targetCode,                %%被攻击者的Code
	targetName,              %%被攻击者的名字
	targetType,              %%被攻击者类型
	targetPid,               %%被攻击者Pid
	targetID,                %%被攻击者的ID，如果为玩家则是RoleID，如果为怪物或者宠物则为其ID
	targetDamageList,        %%被攻击者产生的实际伤害
	totalDamageBack            %%反弹回来的总伤害
}).

-record(comboSkill, {
	skillID,                            %%技能ID
	comboID,                            %%连击技能组号
	lasttime                            %%上次释放连击技能时间戳
}).

-record(recHate, {
	hateCode,                       %%仇恨者Code,
	hatePid,                        %%仇恨者Pid,
	hateValue                       %%仇恨值
}).

-record(recbeAttackJudge, {
	hitJudge,              %%攻击者技能判定
	damageMultiply,        %%攻击者乘法值
	damagePlus,            %%攻击者加法值
	hitratioValue,         %%攻击者命中率
	criticalValue,         %%攻击者暴击值
	criticalimmunity,         %%被攻击者暴击豁免
	parryValue,            %%被攻击者招架值
	dodageValue,           %%被攻击者闪避值
	blockValue,            %%被攻击者格挡值
	isPlayer,              %%被攻击者是否是玩家
	equipList,             %%被攻击者装备列表
	status                 %%被攻击者状态
}).

-record(recBattleLearn, {
	code,                     %%切磋者code
	name,                     %%切磋者名字
	netPid,                     %%切磋者NetPid
	pid,                     %%切磋者Pid
	hp = 0,					%%进入切磋位面的血量
	isChallenger             %%是否是挑战者
}).


-endif.
