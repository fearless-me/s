%%%定义生物的一些基础东西
-ifndef(Char_hrl).
-define(Char_hrl, 1).

-define(CharModeRadius, 2.0).

%% 性别定义
-define(SexWoman, 0).	% 女
-define(SexMan, 1).		% 男

%阵营定义
-define(CampPlayer, 1).                        %玩家阵营
-define(CampRedBattle, 2).                        %玩家战场红队阵营
-define(CampBlueBattle, 3).                        %玩家战场蓝队阵营
-define(CampMonsterFriendly, 4).                        %友好怪物阵营
-define(CampMonsterEnemies, 5).                       %敌对怪物阵营

-define(CampPeace, 6).                       %和平模式
-define(CampGeneralKill, 7).                       %杀戮模式
-define(CampGuildKill, 8).                        %公会杀戮

-type camp() :: 1 .. 8.

%%种族定义
-define(RaceUnknown, 0).    %%未知
-define(RaceHuman, 1).        %%人族
-define(RaceElf, 2).        %%精灵
-define(RaceEvilKind, 3).    %%魔族
-type race() :: 0 .. 3.


%%职业定义
-define(CareerUnknown, 0).                            %%非玩家使用

-define(Career_10_Warrior, 101).        %%战士
-define(Career_11_Guardian, 111).   %%守卫
-define(Career_11_Fighter, 112).   %%斗士
-define(Career_12_Footman, 121).   %%步兵
-define(Career_12_Swordsmen, 122).   %%剑士
-define(Career_12_Mercenary, 123).   %%佣兵


-define(Career_20_Magician, 201).     %%法师
-define(Career_21_GodSworn, 211).   %%修士
-define(Career_21_Wizard, 212).   %%巫师
-define(Career_22_Priest, 221).   %%牧师
-define(Career_22_Warlock, 222).   %%术士
-define(Career_22_Monk, 223).   %%僧侣


-define(Career_30_Bravo, 301).     %%刺客
-define(Career_21_Traveler, 311).   %%旅者
-define(Career_21_Rogue, 312).   %%流氓
-define(Career_22_Archer, 321).   %%弓箭手
-define(Career_22_Thief, 322).   %%盗贼
-define(Career_22_Scout, 323).   %%侦察兵


-define(CareerTrainee, 4).                            %%见习生(Trainee)
-define(CareerMechanic, 5).                            %%机械师(Mechanic)
-define(CareerMax, 6).


-define(CareerMain_1_Warrior, 1).
-define(CareerMain_2_Magician, 2).
-define(CareerMain_3_Bravo, 3).
-define(CareerMain_4, 4).
-define(CareerMain_5, 5).
-define(Career2CareerMain(C), trunc(C div 100)).
-define(Career2CareerBase(C), trunc(C div 100 * 100 + 1)).
-define(Career2CareerStage(C), trunc((C div 10) rem 10)).

-type career() :: 0 .. 5.

%%玩家PK状态
-define(PlayerPeaceStatus, 0).            %%和平模式
-define(PlayerSingleKillStatus, 1).            %%单人杀戮
-define(PlayerMutiKillStatus, 2).            %%多人杀戮

%%地图类型
-define(MapBttleLearn, 1).          %%可以切磋
-define(MapKill, 2).          %%可以杀戮

%%生物动作状态
-define(CreatureActionStatusNone, 0).                %%无
-define(CreatureActionStatusStand, 1).                %%站立
-define(CreatureActionStatusMove, 2).                %%移动
-define(CreatureActionStatusWillDie, 3).                %%将要死亡
-define(CreatureActionStatusDead, 4).                %%死亡
-define(CreatureActionStatusPick, 5).                %%拾取
-define(CreatureActionStatusChangeMap, 6).           %%切换地图
-define(CreatrueActionStatusStealth, 7).                %%隐身
-define(CreatureActionStatusMax, 8).                    %%动作最大状态
-type action_status() :: ?CreatureActionStatusNone .. ?CreatureActionStatusMax.

%%生物由技能或者BUFF产生的状态
-define(CreatureSpeStatusComa, 65536).    %16.昏迷
-define(CreatureSpeStautsFixed, 131072).    %17.定身
-define(CreatureSpeStautsFreeze, 262144).    %18.冻结
-define(CreatureSpeStautsDecSpeed, 524288).    %19.减速
-define(CreatureSpeStautsSilence, 1048576).    %20.沉默
-define(CreatureSpeStautsDeformation, 2097152).    %21.形变
-define(CreatureSpeStautsInvincible, 4194304).    %22.无敌
-define(CreatureSpeStautsBlur, 8388608).    %23.虚化
-define(CreatureSpeStautsDisarm, 16777216).    %24.缴械
-define(CreatureSpeStautsPkProtect, 33554432). %25.PK保护
-define(CreatureSpeStautsNoControl, 67108864). %26.不受控制
-define(CreatureSpeStautsShapeShifte, 134217728). %27.变身
-define(CreatureSpecStautsImmune, 268435456). %28.免疫
-define(CreatureSpecStautsImmuneShift, 536870912). %29.免疫位移
-define(CreatureSpecStautsRedName, 1073741824). %30.红名
-define(CreatureSpecStautsRidicule, 2147483648). %31.嘲讽

%%玩家主菜单激活状态
-define(PlayerMainMenuWake, 1). %%觉醒
-define(PlayerMainMenuGem, 2).  %%宝石
-define(PlayerMainMenuPet, 4).  %%坐骑

%移动方向
%% -define( EDirection_NULL, 16#0000 ).
%% -define( EDirection_Left, 16#0001 ).
%% -define( EDirection_Right, 16#0002 ).
%% -define( EDirection_Up, 16#0004 ).
%% -define( EDirection_Down, 16#0008 ).
%% -define( EDirection_LeftUp, (?EDirection_Left bor ?EDirection_Up) ).
%% -define( EDirection_RightUp, (?EDirection_Right bor ?EDirection_Up) ).
%% -define( EDirection_LeftDown, (?EDirection_Left bor ?EDirection_Down) ).
%% -define( EDirection_RightDown, (?EDirection_Right bor ?EDirection_Down) ).
%% -define( EDirection_ArrayLength, 16 ).

%% 攻击判定：
%% 0攻击做正常判定，
%% 1不做招架判定，
%% 2不做闪避判定，
%% 4 不做格挡判定
%% 8 不做暴击判定
-define(HitJudgeNormal, 0).
-define(HitJudgeNoParry, 1).
-define(HitJudgeNoDodge, 2).
-define(HitJudgeNoBlock, 4).
-define(HitJudgeNoCritical, 8).

-type hit_judge() :: ?HitJudgeNormal | ?HitJudgeNoParry | ?HitJudgeNoDodge | ?HitJudgeNoBlock | ?HitJudgeNoCritical.

%%攻击判定结果：
%%无敌为1
%%招架为2
%%闪避为4
%%暴击为8
%%击中为16
%%格挡为32
%%PK保护为64
%%治疗为128
%% -define(HitResultInvincible,1).
%% -define(HitResultParry,2).
%% -define(HitResultDodage,4).
%% -define(HitResultCritical,8).
%% -define(HitResultHit,16).
%% -define(HitResultBlock,32).
%% -define(HitResultPkResult,64).
%% -define(HitResultTreat,128).

-define(HitResultBreakHead, 1). %%破甲
-define(HitResultCritical, 2). %%暴击
-define(HitResultOrdinary, 4). %%普攻
-define(HitResultDodge, 8). %%闪避
-define(HitResultTreat, 16). %%治疗


%%玩家和宠物的一级属性
%%-define(Prop_strength, 1).        %%力量
%%-define(Prop_agility, 2).        %%敏捷
%%-define(Prop_intelligence, 3).        %%智力
%%-define(Prop_constitution, 4).        %%体质
%%-define(Prop_lucky, 5).        %%幸运

%%-define(Prop_lv2_start, 6).

%%角色以及宠物的二级属性
%%-define(Prop_medicinefactor, 6).        %%药瓶治疗效果
%%-define(Prop_survivemas, 7).        %%生存精通
%%-define(Prop_attackboss, 8).        %%攻击首领伤害乘数
%%-define(Prop_defenceboss, 9).        %%防御首领伤害乘数

%%-define(Prop_maxholypower, 10).        %%神圣之力上限，骑士专用
%%-define(Prop_holypowersec, 11).        %%神圣之力秒回，骑士专用
%%-define(Prop_maxmagicpower, 12).        %%秘法之力上限，法师专用
%%-define(Prop_magicpowersec, 13).        %%秘法之力秒回，法师专用
%%-define(Prop_maxragepower, 14).        %%恶魔之怒上限，收割者专用
%%-define(Prop_ragepowersec, 15).        %%恶魔之怒秒回，收割者专用
%%-define(Prop_maxshadowpower, 16).        %%暗影之力上限，刺客专用
%%-define(Prop_shadowpowersec, 17).        %%暗影之力秒回，刺客专用

%%-define(Prop_char_start, 18).

%%-define(Prop_maxhp, 18).        %%生命值上限
%%-define(Prop_hpsec, 19).        %%生命秒回值
%%-define(Prop_hppersec, 20).        %%生命秒回比
%%-define(Prop_hphit, 21).        %%击中回血
%%-define(Prop_hpdam, 22).        %%伤害回血
%%-define(Prop_mana, 23).        %%法力值上限（这个属性不再使用了，但保留到这里）
%%-define(Prop_manapersec, 24).        %%法力秒回（这个属性不再使用了，但保留到这里）

%%-define(Prop_holydefence, 25).        %%神圣防御
%%-define(Prop_physicaldefence, 26).        %%物理防御
%%-define(Prop_shadowdefence, 27).        %%暗影防御
%%-define(Prop_elementdefence, 28).        %%元素防御
%%-define(Prop_chaosdefence, 29).        %%混乱防御

%%-define(Prop_holydamage, 30).        %%神圣伤害
%%-define(Prop_physicaldamage, 31).        %%物理伤害
%%-define(Prop_shadowdamage, 32).        %%暗影伤害
%%-define(Prop_elementdamage, 33).        %%元素伤害
%%-define(Prop_chaosdamage, 34).        %%混乱伤害

%%-define(Prop_critical, 35).        %%暴击
%%-define(Prop_criticalfactor, 36).        %%暴击伤害系数
%%-define(Prop_blockfactor, 37).        %%格挡减伤系数
%%-define(Prop_healfactor, 38).        %%技能治疗效果
%%-define(Prop_gethealfactor, 39).        %%受到技能治疗效果
%%-define(Prop_movespeed, 40).        %%移动速度
%%-define(Prop_thorn, 41).        %%伤害反弹
%%-define(Prop_attackspeed, 42).        %%攻击速度
%%-define(Prop_saveenergy, 43).        %%节约能量
%%-define(Prop_coolspeed, 44).        %%冷却速度
%%-define(Prop_tough, 45).        %%坚韧
%%-define(Prop_absorbshield, 46).        %%吸收盾

%%-define(Prop_holyresist, 47).        %%神圣抗性
%%-define(Prop_physicalresist, 48).        %%物理抗性
%%-define(Prop_shadowresist, 49).        %%暗影抗性
%%-define(Prop_elementresist, 50).        %%元素抗性
%%-define(Prop_chaosresist, 51).        %%混乱抗性

%%-define(Prop_dominateresist, 52).        %%控制抵抗
%%-define(Prop_sealresist, 53).        %%封印抵抗
%%-define(Prop_slowresist, 54).        %%减速抵抗

%%-define(Prop_parry, 55).        %%招架
%%-define(Prop_dodge, 56).        %%闪避
%%-define(Prop_block, 57).        %%格挡
%%-define(Prop_damageabsorb, 58).        %%伤害吸收
%%-define(Prop_resistall, 59).       %%全抗性
%%-define(Prop_defenseall, 60).       %%全防御
%%-define(Prop_becritical, 61).       %%被暴击
%%-define(Prop_adddefense, 62).       %%防御增强

%%-define(Prop_shieldbash, 63).        %%神圣盾击伤害
%%-define(Prop_spiritual, 64).        %%净化伤害
%%-define(Prop_revenge, 65).        %%复仇伤害
%%-define(Prop_everlight, 66).        %%永恒之光伤害
%%-define(Prop_counterstrike, 67).       %%清算伤害
%%-define(Prop_punish, 68).       %%绝罚伤害
%%-define(Prop_honourlaw, 69).       %%荣耀圣令伤害
%%-define(Prop_fireball, 70).       %%烈焰飞弹伤害
%%-define(Prop_meteor, 71).        %%陨石术伤害
%%-define(Prop_fireblast, 72).        %%炎爆伤害
%%-define(Prop_icepike, 73).        %%冰枪伤害
%%-define(Prop_icestorm, 74).        %%冰风暴伤害
%%-define(Prop_disintegrate, 75).       %%灼热射线伤害
%%-define(Prop_lifereap, 76).       %%生命收割伤害
%%-define(Prop_soulreap, 77).       %%灵魂榨取伤害
%%-define(Prop_blasphemy, 78).       %%亵渎伤害
%%-define(Prop_leap, 79).        %%末日决战伤害
%%-define(Prop_soulstorm, 80).        %%灵魂漩涡伤害
%%-define(Prop_deathstorm, 81).        %%死亡风暴伤害
%%-define(Prop_cleave, 82).        %%死亡斩杀伤害
%%-define(Prop_crippling, 83).       %%裂空斩伤害
%%-define(Prop_impale, 84).       %%致命投掷伤害
%%-define(Prop_thunderstab, 85).       %%雷光刺伤害
%%-define(Prop_execute, 86).       %%灭寂伤害
%%-define(Prop_shadowstrike, 87).        %%乱影击伤害
%%-define(Prop_sweep, 88).        %%剪切伤害
%%-define(Prop_shock, 89).        %%一闪伤害
%%-define(Prop_evilstrike, 90).        %%影袭伤害
%%-define(Prop_dagronpet, 91).       %%魔宠伤害
%%-define(Prop_demon, 92).       %%恶魔仆人伤害
%%-define(Prop_ancientdemon, 93).       %%远古恶魔伤害

%%-define(Prop_regainmast, 94).       %%恢复精通
%%-define(Prop_master, 95).       %%伤害精通

%%-define(Prop_blasphemycd, 96).       %%亵渎冷却
%%-define(Prop_anciendemoncd, 97).       %%远古恶魔冷却
%%-define(Prop_counterstrikecost, 98).       %%清算能耗
%%-define(Prop_fireballcast, 99).       %%烈焰飞弹施法
%%-define(Prop_castmeteor, 100).      %%陨石术施法
%%-define(Prop_holyrestore, 101).      %%消耗圣力回血
%%-define(Prop_maxragerestore, 102).      %%消耗魔怒回血

%%-define(Prop_physical, 103).      %%体力
%%-define(Prop_physicalspec, 104).      %%体力秒回
%%-define(Prop_wakecd, 105).      %%觉醒冷却时间
%%-define(Prop_waketime, 106).      %%觉醒buff持续时间
%%-define(Prop_eternallight, 107).      %%永恒之光冷却加速
%%-define(Prop_kingholy, 108).      %%王者圣令持续时间
%%-define(Prop_hopeholy, 109).      %%希望圣令持续时间
%%-define(Prop_unholy, 110).      %%邪恶灵气冷却加速
%%-define(Prop_shadowaura, 111).      %%暗影灵气冷却加速
%%-define(Prop_nouse1, 112).
%%-define(Prop_nouse2, 113).
%%-define(Prop_petattackspeed, 114).        %%宠物出手速度
%%-define(Prop_absolutedamage, 115).        %%绝对伤害
%%-define(Prop_absolutedefence, 116).        %%绝对防御
%%-define(Prop_criticalimmunity, 117).        %%暴击豁免
%%-define(Prop_criticaldamagereduct, 118).        %%暴击减免伤害
%%
%%-define(Prop_sleepimmunity, 119).        %%眩晕豁免
%%-define(Prop_freezeimmunity, 120).        %%冰冻豁免
%%-define(Prop_slowdownimmunity, 121).        %%减速豁免
%%-define(Prop_sleepprob, 122).        %%眩晕概率
%%-define(Prop_freezerprob, 123).        %%冰冻概率
%%-define(Prop_slowdownprob, 124).        %%减速概率
%%-define(Prop_hitratio, 125).        %%命中率
%%-define(Prop_maxmechanicpower, 126).        %%机械师专用
%%-define(Prop_mechanicpowersec, 127).        %%机械师专用

%%-define(Prop_burstfire, 128).        %%点射
%%-define(Prop_fixedfire, 129).        %%爆炎手雷
%%-define(Prop_flamejet, 130).        %%火焰喷射
%%-define(Prop_aserray, 131).        %%激光射线
%%-define(Prop_gravitybomb, 132).        %%重力炸弹
%%-define(Prop_repulse, 133).        %%击退
%%-define(Prop_strafe, 134).        %%扫射

%% 新属性启用
-define(Prop_Min, 135).
-define(Prop_New, 135).
-define(Prop_MaxHP, 135).        %%生命：标志着单位的生存能力，改变到0时，执行其死亡后的逻辑
-define(Prop_PhysicalAttack, 136).        %%物攻：物理职业只有物攻
-define(Prop_MagicAttack, 137).        %%法攻：法术职业只有法攻
-define(Prop_PhysicalDefence, 138).        %%物防：所有职业都有，细微偏差
-define(Prop_MagicDefence, 139).        %%法防：所有职业都有，细微偏差
-define(Prop_CriticalLevel, 140).        %%暴击等级：通过公式转换成暴击率
-define(Prop_CriticalResistLevel, 141).        %%抗爆等级：通过公式转换成减免暴击率
-define(Prop_CriticalDamageLevel, 142).        %%爆伤等级：初始为普通攻击的2倍伤害，通过公式转换成暴击伤害增加到暴击伤害上
-define(Prop_TenaciousLevel, 143).        %%韧性等级：爆伤等级的反属性
-define(Prop_HitLevel, 144).        %%命中等级：通过公式转换成命中率
-define(Prop_DodgeLevel, 145).        %%闪避等级：通过公式转换成闪避等级
-define(Prop_ArmorPenetrationLevel, 146).        %%破甲等级：通过转换公式，转换成破甲率，当命中公式判断为破甲伤害时，则忽略对方护甲
-define(Prop_HPRecover, 147).        %%生命秒回值
-define(Prop_MPRecover, 148).        %%法术秒回值
-define(Prop_DamagePlus, 149).        %%伤害加成 %
-define(Prop_DamageReduce, 150).        %%伤害减免 %
-define(Prop_PetDamagePlus, 151).        %%宠物伤害加成 %
-define(Prop_PetDamageReduce, 152).       %%宠物伤害减免 %
-define(Prop_SkillMinusCDFactor, 153).       %%减少技能CD  \
-define(Prop_HealthFactor, 154).        %%技能治疗效果
-define(Prop_GetHealthFactor, 155).        %%受到技能治疗效果
-define(Prop_AbsorbShield, 156).        %%吸收盾
-define(Prop_MoveSpeed, 157).        %%移动速度
-define(Prop_ExpFactor, 158).        %%经验加成
-define(Prop_ItemHPRecoverFactor, 159).        %%药品回复加成
-define(Prop_ArmorLevel, 160).        %%护甲

-define(PropMax, 160).

-type battle_prop() :: ?Prop_Min .. ?PropMax.


%%战斗属性
-record(battleProp, {
	propIndex = 0 :: battle_prop(),           %%属性号
	baseValue = 0.0 :: float(),                    %%基础属性
	addValue = 0.0 :: float(),                    %%属性加法值
	multiValueList = [] :: list(),                    %%属性乘法值列表，这个是不能合并的
	totalValue = 0.0 :: float(),                    %%各属性项计算后的总值（计算属性转换后的总值）
	isModified = false :: boolean()                %%各属性项自上次计算总值后，有修改的属性
}).

%%玩家特有战斗属性
-record(recPlayerSpecBattleProp, {
	holypower = 0.0 :: float(),                        %%当前神圣之力值 （骑士专属）
	magicpower = 0.0 :: float(),                        %%当前秘法之力值 （法师专属）
	ragepower = 0.0 :: float(),                        %%当前恶魔之怒值 （收割者专属）
	shadowpower = 0.0 :: float(),                        %%暗影之力值          （刺客专属）
	mechanicpower = 0.0 :: float()                        %%机街师
}).

-record(posInfo, {
	x = 0.0 :: float(),
	y = 0.0 :: float()
}).

%%回合制战斗数据
-record(rec_turn_battle,
{
	id = 0,        %%战斗角色ID
	type = 0,        %%战斗角色类型(0:人物,1:宠物,2:怪物)
	pos = 0,        %%战斗角色位置
	skills = [],    %%战斗角色中技能列表
	atta = 0,        %%战斗角色攻击力
	def = 0,        %%战斗角色防御力
	res = 0,        %%战斗角色抗性
	hp = 0,        %%战斗角色血量
	crit = 0,        %%战斗角色暴击
	camp = 0,        %%战斗角色阵营
	speed = 0        %%战斗角色速度
}).

-record(rec_battle_ack,
{
	dunID = 0,        %%战斗副本
	res = 0,        %%战斗结果 (0:胜利,1失败,2平局)
	type = 0,        %%战斗类型(0:pve,1:pvp)
	oldAers = [],    %%战斗前队友角色列表
	oldDers = [],    %%战斗前敌人角色列表
	curAers = [],    %%战斗后队友角色列表
	curDers = [],    %%战斗后敌人角色列表
	oldOccID = 0,    %%战斗前占领者
	cityInfo = {}  %% 战斗后城池信息(pvp)
}).

%%战斗角色类型
-define(RoleBattle, 0).%%人物
-define(PetBattle, 1).%%宠物
-define(MonsterBattle, 2).%%怪物

%%战斗关系
-define(DerRole, 0).%%敌方(右边)
-define(AerRole, 1).%%友方(左边)


%%回合制战斗技能类型
-define(SingleAttack, 0).%%单体攻击技能
-define(AoeAttack, 1).%%群体攻击技能
-define(SingleNoAttack, 2).%%单体非攻击技能
-define(AoeNoAttack, 3).%%群体非攻击技能

-define(MaxTurnNum, 50). %%最大回合数

-define(BattleWin, 0).     %%胜利
-define(BattleFailed, 1).     %%失败
-define(BattleDraw, 2).     %%平局

-define(BattlePve, 0).     %%pve
-define(BattlePvp, 1).     %%pvp

-define(OccType1, 1).  %%占领空城
-define(OccType2, 2).  %%收益
-define(OccType3, 3).  %%防守失败
-define(OccType4, 4).  %%攻城失败
-define(OccType5, 5).  %%防守胜利
-define(OccType6, 6).  %%攻城胜利


%%回合制pvp战报
-record(rec_battle_report, {
	report_time = 0, %%战报时间
	report_type = 0, %%战报类型 1:占领 2:被占领
	report_city_id = 0,
	report_role_id = 0
}).

-endif.
