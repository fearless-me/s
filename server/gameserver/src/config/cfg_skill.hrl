%%: 声明
-ifndef(cfg_skill).
-define(cfg_skill, 1).

-record(skillCfg, {
        %%: 技能ID:10000开始
        %%: 职业技能ID规范：前三位是职业ID，后三位是技能编号
        %%: 举例：101001：战士的第一个技能
        %%: by姜泓妃
        skillID,

        %%: 技能名字
        skillName,

        %%: 技能描述,a * 100后面带百分号 ，b 不乘
        skillInfo,

        %%:           
        skillInfo_sp,

        %%: 技能描述用的技能数值
        %%: 1.value= a +(SkLv-1)*b
        %%: [{1,a,b}]
        %%: 2.value= a +SkLvIndex
        %%: [{2,a,IndexName}]
        skillData,

        %%: 技能图标
        skillIcon,

        %%: 纯客户端显示，目前只有主角技能界面使用
        skill_shortdesc,

        %%:           
        comboID,

        %%: 不显示该技能
        %%: 0 显示
        %%: 1 不显示
        hiden,

        %%: boss技能击中警告
        %%: 0 没有警告
        %%: 1 击中后闪红一次
        bossAlert,

        %%: 施法震动id
        cast_shake,

        %%: 击中震动id
        hit_shake,

        %%: 张龙:
        %%: 如果此技能杀死怪物，则触发击飞效果
        hit_away,

        %%: 主手武器特效绑定点：
        %%: slot_1
        %%: slot_2
        weaponSfxSlots,

        %%: 主手武器特效
        weaponSfx,

        %%: 冲锋声音
        chargeSound,

        %%: 姜泓妃
        %%: 如果配了冲锋，则这个参数代表冲锋之后的动作的释放时长
        chargeDelay,

        %%: 冲锋动作
        %%: 姜泓妃
        %%: 冲锋动作必须有skilleffect的冲锋效果，否则无效
        %%: 且skilleffect中的时长决定冲锋时长
        %%: 冲锋动作加事件侦：actionbegin 不加结束
        %%: 攻击动作加事件侦actionend 不加开始
        chargeAction,

        %%: 冲锋特效
        chargeSfx,

        %%: 冲锋特效缩放
        chargeSfxScal,

        %%: 特效绑定点
        chargeSfxSlots,

        %%: 姜泓妃
        %%: 冲锋特效是否跟随玩家还是残留在原地
        %%: 0跟随玩家（默认）
        %%: 1残留原地
        chargeSfxBind,

        %%: 瞬发施法音效
        actionSound,

        %%:           
        actionDelay,

        %%: 技能动姜泓妃
        %%: 同一个技能中的所有动作
        %%: 只有一个的skillbegin和end生效。
        %%: 没有的话不能填0 要置空
        skillAction,

        %%: 攻击特效
        skillAttackSfx,

        %%: 施法特效播放时间，单位毫秒,载体专用
        attackSfxDur,

        %%: 攻击特效缩放
        attackSfxScal,

        %%: admin:
        %%: 攻击特效挂载插槽，可以为多个，用,分隔
        skillAttackSfxSlots,

        %%: 姜泓妃
        %%: 施法特效是否跟随玩家还是残留在原地
        %%: 0跟随玩家（默认）
        %%: 1残留原地
        attackSfxBind,

        %%: 吟唱音效
        prepareSound,

        %%:           
        prepareDelay,

        %%: 技能吟唱动作
        skillPrepareAction,

        %%: 技能吟唱特效
        skillPrepareSfx,

        %%: 吟唱特效缩放
        prepareSfxScal,

        %%: 技能吟唱特效绑定的插槽，可以为多个，用,分隔
        skillPrepareSfxSlots,

        %%: 导弹飞行音效
        missileSound,

        %%:           
        missileDelay,

        %%: 弹道特效
        skillMissileSfx,

        %%: 弹道特效缩放
        missileSfxScal,

        %%: 弹道 特效插槽
        %%: slot_l        左手武器挂载点       LeftWeapon(1)  
        %%: slot_r        右手武器挂载点       RightWeapon(2)
        %%: slot_lf       左脚挂载点           LeftFoot(5)
        %%: slot_rf       右脚挂载点           RightFoot(6)
        %%: p_m_origin    两腿中间地面点           Origin(4)
        %%: slot_hit      胸部命中点           Hit(3)
        %%: slot_head     头部挂载点           head(0)      
        %%: slot_2        刀光拖尾-武器尾部    BFBase(8)
        %%: slot_1        刀光拖尾-武器顶部    BFTip(7)
        skillMissileSfxSlot,

        %%: 0:直线弹道
        %%: 1:上半圆曲线
        %%: 2:左右向曲线
        %%: 3:蛇形曲线
        skillMissileSfxType,

        %%: 0:一个目标
        %%: 1:从当前目标扩散到其他范围内目标
        %%: 2:多个目标多个飞行子弹
        %%: 3:连锁闪电
        %%: 4：连锁闪电同时触发行
        skillMissileSfxMode,

        %%: 飞行子弹飞行速度：
        %%: 米/秒
        skillMissileSpeed,

        %%: 受击音效
        beAtkSound,

        %%:           
        beAtkDelay,

        %%: 被攻击特效
        skillBeAtkSfx,

        %%: 受击特效缩放
        beAtkSfxScal,

        %%: slot_l        左手武器挂载点       LeftWeapon(1)  
        %%: slot_r        右手武器挂载点       RightWeapon(2)
        %%: slot_lf       左脚挂载点           LeftFoot(5)
        %%: slot_rf       右脚挂载点           RightFoot(6)
        %%: p_m_origin    两腿中间地面点           Origin(4)
        %%: slot_hit      胸部命中点           Hit(3)
        %%: slot_head     头部挂载点           head(0)      
        %%: slot_2        刀光拖尾-武器尾部    BFBase(8)
        %%: slot_1        刀光拖尾-武器顶部    BFTip(7)
        skillBeAtkSlots,

        %%: 被攻击特效数量
        skillBeAtkSfxNum,

        %%: 连线引导音效
        absorbSound,

        %%:           
        absorbDelay,

        %%: 吸取特效
        skillAbsorbSfx,

        %%: 吸取特效缩放
        absorbSfxScal,

        %%: 吸取特效插槽
        skillAbsorbSfxSlot,

        %%: 职业：
        %%: 5,怪物
        %%: 6,宠物
        %%: 7,公会
        %%: 8,物品
        %%: 9,系统
        %%: 10,变身技能
        %%: 11,变身获得的技能
        %%: 12,坐骑
        %%: 13,宝石精灵技能
        %%: 14,神器技能
        %%: 15,翅膀技能
        %%: 17,骑宠精灵技能
        %%: 所有涉及到职业的技能填写对应的职业ID
        %%: 20,女神技能
        %%: 18、变身怪物的技能（任务）
        skillClass,

        %%: 学习或获得技能最低玩家，宠物，坐骑等级：玩家达到指定等级可学习第1级技能，学习技能玩家等级公式：
        %%: BaseLevel+(要学习的技能等级-1）*NextLevelPlus
        baseLevel,

        %%: 技能每升下1级需求的玩家等级增量
        nextLevelPlus,

        %%: 0 技能等级等于玩家和宠物等级，坐骑等级
        %%: 1 技能需要学习升级
        %%: 2 宠物通用技能等级，随机
        %%: 3 技能只有1级
        %%: 4 技能等级为随机数，装备使用
        %%: 5 神器技能学习升级
        studySkill,

        %%: 技能可达到的最大等级
        maxLevel,

        %%: 是否攻击
        %%: 0 ，非攻击，不做攻击判定
        %%: 1 ，近战攻击，做攻击判定，会被伤害反弹
        %%: 2 ，远程攻击，做攻击判定，会被伤害反弹
        aggressivity,

        %%: 最大累积次数
        %%: 0表示没限制
        maxCount,

        %%: 累积次数技能：
        %%: -1表示不累积，不用累积功能
        %%: 0  其它方式累积
        %%: 大于0 时间累积，毫秒
        countTime,

        %%: -1不会触发和被触发公共冷却
        %%: 0正常触发和被触发公共冷却，角色公共冷却来自武器的攻击间隔，怪物，宠物，npc来自基础表中的设定
        %%: 填写大于0的其它值，为配置的公共冷却，毫秒
        %%: 吟唱和引导技能开始进行时就开始公共冷却
        %%: 主角技能：从begin到combo标记的帧为公共冷却。注意：combo帧距离end帧不能在3-6帧的范围内
        %%: BY姜泓妃
        skill_GlobeCoolDown,

        %%: 技能自身冷却时间，毫秒
        %%: 吟唱在成功释放后才会开始自身冷却
        %%: 引导技能一旦开始引导就开始自身冷却
        skillCoolDown,

        %%: 技能所属的冷却组
        %%: 0 ：不属于任何冷却组
        %%: 非0：比如当该技能A开始冷却时，与其同冷却组的所有技能都开始冷却，并且采用技能A的冷却时间，用于共享冷却时间的技能，道具等等
        skillCoolDownGroup,

        %%: 消耗的能量值（浮点）
        costEnergy,

        %%: 消耗的能量值（浮点）
        costCourage,

        %%: by姜泓妃
        %%: 1重剑 2轻剑 3剑盾
        %%: 4双持刺 5弓箭
        %%: 6法杖 7权杖
        %%: 一个职业只能有一类武器
        weaponNeed,

        %%: 0：混乱系。用于各种杂项
        %%: 1：物理系，
        %%: 2：魔法系，会被沉默
        skillSchool,

        %%: 0， 昏迷，冻结，形变，不受控制不可释放
        %%: 1， 昏迷，冻结，形变，不受控制可用
        use_Spec,

        %%: 0，敌人（主）
        %%: 1，自己（主）
        %%: 2，主人（主）
        %%: 3，技能召唤宠物（主）
        %%: 4. 敌人（主）和周围敌人（副），圆形
        %%: 5，自身周围敌人（副），可空放，圆形
        %%: 6，自身（主）周围队友(副，包括自己，包括自己和队友宠物），可空放，圆形
        %%: 7. 自身朝向扇形，攻击敌人（副），可空放，扇形
        %%: 8. 自身和敌人(主）连线朝向扇形，攻击敌人，（副）
        %%: 9. 自身朝向矩形，攻击敌人，(副）可空放，矩形
        %%: 10.自身和敌人（主）连线朝向矩形，攻击敌人。（副）
        %%: 11.敌人位置圆形（副）,需要选择一个敌人坐标作为圆心，吟唱和引导会在技能开始就确定坐标，释放时再确定敌人
        %%: 12.敌人位置扇形（副）,施法者朝向，需要选择一个敌人坐标作为圆心，吟唱和引导同11
        %%: 13. 自身朝向十字矩形，攻击敌人，(副）可空放，十字矩形
        %%: 注：圆形半径=AoeRange
        %%:     扇形半径=Ranger+AoeRange
        %%:     矩形长度=Ranger+AoeRange
        targetSearch,

        %%: 触发技能的目标
        %%: 0 与上个技能无关
        %%: 1 上个技能的目标作为主目标
        %%: 2 与攻击者无关
        %%: 3 以攻击者为主目标
        triggerTarget,

        %%: 技能目标类型
        %%: 0 ，无限制
        %%: 1 ，玩家
        %%: 2 ，怪物
        targetType,

        %%: 技能的施法距离，填米
        ranger,

        %%: 是否群体技能
        %%: 0 否
        %%: 1 是
        aoe,

        %%: 扇形角度（1-360）全角
        %%: 矩形宽度半宽
        aoeAngle,

        %%: 圆形半径2
        %%: 扇形加值4
        %%: 矩形加值8
        aoeRange,

        %%: Aoe技能影响目标个数：
        %%: 0:不限制目标个数（群体技能配12个，不要配0）
        %%: 非0：限制个数
        %%: 除当前目标之外的额外个数
        %%: 对于没有当前目标的技能就是填写的个数
        %%: 当前目标可以是主目标或副目标
        maxEffectCount,

        %%: 技能类型
        %%: 0，被动buff
        %%: 1，瞬发
        %%: 2，吟唱
        %%: 3，引导
        %%: 4，载体瞬发
        %%: 5，攻击目标触发
        %%: 6，非攻击目标触发
        %%: 7，被攻击触发
        %%: 8，释放技能触发
        %%: 9，死亡触发
        %%: 10，buff调用瞬发
        %%: 11，击杀和助攻触发
        %%: 12.宠物属性转化为主角属性
        %%: 13.血量百分比点触发，配合TriggerTarget，skillex，TriggerSkill，TriggerChance，TriggerAggressi，Triggercondition字段与monster表triggerskill字段使用
        skillType,

        %%: 引导和吟唱时移动，击退，抓取打断
        %%: 0 打断
        %%: 1 不打断
        moveBreak,

        %%: 姜泓妃
        %%: 人物朝向的直线方向移动。
        %%: 只能往前不能往后（不能负数）
        %%: 填[时间（毫秒），距离（米）]
        %%: 注意！有这个参数的动作必须加事件帧：movestartBegin
        moveDistance,

        %%: 引导时的buff
        channalBuff,

        %%: 被动buff技能额外特性（前6个类型）/触发特定技能条件（触发技能id组在monster表triggerskill字段配置）
        %%: 1.站立不动一定时间获得buff
        %%: [1,时间,buffid]
        %%: 2.给宠物加buff
        %%: [2,宠物id,buffid]
        %%: 3.角色生命低于一定百分比获得buff
        %%: [3,百分比,buffid]
        %%: 4.角色生命高于一定百分比获得buff
        %%: [4,百分比,buffid]
        %%: 5.对生命低于一定百分比的敌人伤害提高
        %%: [5,百分比,伤害系数]
        %%: 6.对生命高于一定百分比的敌人伤害提高
        %%: [6,百分比,伤害系数]
        %%: 7.小于等于血量百分比点触发技能
        %%: [7,血量百分比1,血量百分比2,血量百分比3,...]
        skillEx,

        %%: 只能被某个技能触发
        %%: 0 没有
        %%: >0 可以触发的技能ID
        triggerSkill,

        %%: 触发几率,仅对触发技能有效
        %%: 在0-1间触发概率 * 源技能触发系数
        %%: 0 不会触发
        %%: 1 一定触发
        %%: 大于1  使用公式计算触发概率=填写值*源技能触发系数*受攻速加成后的武器间隔/60000
        %%: 注意：
        %%: 原有规则基础上将其改为字段
        %%: [a，b]
        %%: 最终值= a +(SkLv-1)*b
        triggerChance,

        %%: 上个技能攻击性
        %%: 0，无意义，跳过判定
        %%: 1，非攻击
        %%: 2，近战攻击
        %%: 4，远程攻击
        %%: 8，魔法攻击
        triggerAggressi,

        %%: 触发条件
        %%: 0 无意义
        %%: 1 破甲
        %%: 2 暴击
        %%: 4 普工
        %%: 8 闪避
        %%: 16 治疗
        %%: 多个条件，加和
        triggercondition,

        %%: 0为使用默认武器攻击间隔
        %%: >0为呤唱，引导间隔
        %%: durationtimes>1时才会生效
        castDuration,

        %%: 吟唱后施法时间，毫秒
        afterCast,

        %%: 可否对CastDuration字段值加速，载体释放技能不会被加速
        %%: 0，不可加速
        %%: 1，可加速，即可受攻击速度改变
        hasteCast,

        %%: 如果技能是吟唱或者引导：
        %%: 0 默认吟唱引导时不会招架，闪避，格挡
        %%: 1 吟唱引导时会招架，闪避，格挡
        combatcast,

        %%: 引导次数
        %%: 引导或吟唱技能配置必须大于1（>=1才会生效），用于控制吟唱、引导技能生效次数
        durationTimes,

        %%: 引导技能
        %%: 0 第0秒不释放
        %%: 1 第0秒释放
        castStep,

        %%: user:
        %%: 技能额外暴击率
        critOther,

        %%: user:
        %%: 技能额外破甲率
        breakOther,

        %%: user:
        %%: 技能额外命中率
        hitOther,

        %%: 1次释放的伤害次数
        %%: 1：不做假值计算一次
        %%: 大于1：做假计算多次
        %%: 引导和aoe作假计算时强制第0秒释放，最后技能结束时不释放。
        effectTimes,

        %%: 技能伤害类型，影响乘法值和加法值
        %%: 1 物理伤害，调用施法者的物攻
        %%: 2 魔法伤害，调用施法者的法攻
        %%: 6 治疗
        %%: 7 治疗，目标生命百分比
        %%: 8 伤害，目标生命百分比
        damageType,

        %%: 填写属性ID作为治疗量计算的参考值
        healProperty,

        %%: 乘法值
        %%: 1.DamageMultiply= a +(SkLv-1)*b
        %%: [{1,a,b}]
        %%: 2.DamageMultiply= a +SkLvIndex
        %%: [{2,a,IndexName}]
        %%: 3.DamageMultiply= a +b*某属性总值
        %%: [{3,a,b,属性ID}]
        %%: 4.DamageMultiply= a +b*能量当前值
        %%: [{4,a,b}],暂时不做
        %%: 多个花括号之间为求和关系
        damageMultiply,

        %%: 加法值
        %%: 1.DamagePlus= a +(SkLv-1)*b
        %%: [{1,a,b}]
        %%: 2.DamagePlus= a +SkLvIndex
        %%: [{2,a,IndexName}]
        %%: 3.DamagePlus= a +b*某属性总值
        %%: [{3,a,b,属性ID}]
        %%: 4.DamagePlus= a +b*能量当前值
        %%: [{4,a,b}]
        %%: 多个花括号之间为求和关系
        damagePlus,

        %%: admin:
        %%: 技能战力系数
        fightSkill,

        %%: 副目标伤害衰减
        %%: 伤害 * 该系数
        secTarget,

        %%: 技能仇恨值
        skill_Hate,

        %%: 判定：
        %%: 0攻击做正常判定，
        %%: 1不做招架判定，
        %%: 2不做闪避判定，
        %%: 4 不做格挡判定
        %%: 8 不做暴击判定
        hit_Spec,

        %%: 震动类型
        %%: 0 攻击方向
        %%: 1 x方向
        %%: 2 y方向
        %%: 3 x.y随机方向
        shakeType,

        %%: 触发系数，影响击中回血量，触发技能的触发几率
        %%: 0 不会有任何触发
        %%: 非0 通过计算影响
        triggerFactor,

        %%: 特定技能伤害系数
        damFactor,

        %%: 特定技能冷却系数
        cDFactor,

        %%: 特定技能耗能系数
        costFactor,

        %%: 特定技能施法系数
        castFactor,

        %%: 技能效果
        %%: 0 无效果
        %%: 位移效果放在第一个
        effects,

        %%: 杂项字段
        %%: 0 无意义
        %%: 1.循环分配攻击，p1 最大次数
        %%: 3.不能被buff调用技能触发
        %%: 4.自带被动触发技能
        misc,

        %%: 杂项参数1
        miscP1,

        %%: 冲突技能，不能同时镶嵌
        %%: 0 无冲突
        %%: 非0 有冲突
        conflictSkill,

        %%: 使用技能是否消耗道具
        %%: 1.使用
        %%: 0.不使用
        getitem,

        %%: 0 正常的挂机释放顺序
        %%: 1 该技能为最低优先级，仅仅作为替换普通攻击的技能
        lowestPriority,

        %%: 挂机施放技能条件
        %%: [条件,条件判断]
        %%: 空，无任何条件，按原有挂机的判断施放
        %%: [1,a] 离自身最近敌对距离小于a则施放技能
        %%: [2,b]自身无buff b则施放技能
        %%: [3,c]宠物c不存在则释放技能
        %%: [4,d]自身生命比例<=d时释放
        autoSkillCondition,

        %%: 张龙:
        %%: 宠物Pve玩法，伤害倍率参数
        pveskillMult,

        %%: 张龙:
        %%: 标示该技能是否使用
        %%: 0 用
        %%: 1不用了
        nouse,

        %%: Administrator:
        %%: 是否是角色普攻。1是，0否
        unnormal,

        %%: 暂不使用
        %%: 技能消耗法力值，填写浮点数，消耗的值为
        %%: 填写值*角色，宠物，怪物属性表中法力上限
        manaCost,

        %%: Luoch:
        %%: 释放触发BUFF
        %%: 当技能释放是，为玩家自身添加该字段配置的BUFF。 
        %%: 如：配置为[1,2] 则玩家释放该技能时，只要技能释放成功，则释放者自身获得BUFF 1,2
        skill_release_trigger

 }).

-endif.