%%: 声明
-ifndef(cfg_buff).
-define(cfg_buff, 1).

-record(buffCfg, {
        %%: ID<=65535
        %%: id=1000-1100 BUFF 模板（勿占）
        buffId,

        %%: 名称
        buffName,

        %%: 描述
        buffDescribe,

        %%: 特效路径文件名
        buffSfx,

        %%: 特效缩放
        %%: 特效挂载点
        %%: slot_head     头部挂载点           head(0)
        %%: slot_neck     颈部挂载点           neck(1)
        %%: slot_l        左手武器挂载点       LeftWeapon(2)  
        %%: slot_r        右手武器挂载点       RightWeapon(3)
        %%: slot_hit      胸部命中点           Hit(4)
        %%: slot_wing        翅膀挂载点       wing(5)
        %%: p_m_origin    两腿中间地面点   Origin(6) 
        %%: slot_lf       左脚挂载点           LeftFoot(7)
        %%: slot_rf       右脚挂载点           RightFoot(8)
        %%: slot_1        刀光拖尾-武器顶部    BFTip(9)       
        %%: slot_2        刀光拖尾-武器尾部    BFBase(10)
        %%: slot_p_1      刀光拖尾-武器尾部    BFBase(11)
        %%: slot_p_2      刀光拖尾-武器尾部    BFBase(12)
        sfxScal,

        %%: 特效挂载点
        %%: slot_head     头部挂载点           head(0)
        %%: slot_neck     颈部挂载点           neck(1)
        %%: slot_l        左手武器挂载点       LeftWeapon(2)  
        %%: slot_r        右手武器挂载点       RightWeapon(3)
        %%: slot_hit      胸部命中点           Hit(4)
        %%: slot_wing        翅膀挂载点       wing(5)
        %%: p_m_origin    两腿中间地面点   Origin(6) 
        %%: slot_lf       左脚挂载点           LeftFoot(7)
        %%: slot_rf       右脚挂载点           RightFoot(8)
        %%: slot_1        刀光拖尾-武器顶部    BFTip(9)       
        %%: slot_2        刀光拖尾-武器尾部    BFBase(10)
        %%: slot_p_1      刀光拖尾-武器尾部    BFBase(11)
        %%: slot_p_2      刀光拖尾-武器尾部    BFBase(12)
        buffSfxSlots,

        %%: buff图标
        %%: 填写0就无图标不显示
        %%: 大于0 就是图标id
        buffICON,

        %%: 同BuffID不同施法者是否共存
        %%: 0 共存
        %%: 1 等级替换
        oneBuffMultiCaster,

        %%: 同buffid，同施法者可以叠加的层数
        %%: 0 共存
        %%: 1 等级替换
        %%: 大于1 叠加
        oneBuffOneCaster,

        %%: 不同buffid，同施法者冲突索引值
        %%: 0 无冲突
        %%: 大于0 相同值先后替换
        multiBuffOneCaster,

        %%: 不同buffid，不同施法者冲突索引值
        %%: 0 无冲突
        %%: 大于0 相同值先后替换
        multiBuffMultiCaster,

        %%: 0 增益
        %%: 1 减益
        buffType,

        %%: 豁免检定
        %%: 0 无检定
        %%: 1 强韧检定
        %%: 2 意志检定
        %%: 3 反射检定
        saveCheck,

        %%: 如果没有通过检定buff正常施放，如果通过检定，则为以下结果
        %%: 0 免疫
        %%: 1 buff时间减25%
        %%: 2 buff时间减50%
        %%: 3 buff时间减75% 
        %%: 4 受另一个技能作用
        checkResult,

        %%: CheckResult值为2时，另一个技能的id
        resultSkill,

        %%: 持续时间
        %%: 格式【参数1，参数2】，参数1为buff1级基础持续时间，参数2为buff单次升级提升基础持续时间
        %%: buff持续时间=参数1+（buff等级-1）*参数2
        %%: 最终实际时间还需要配合 DurationFactor 字段使用
        %%: 最终实际时间=BuffDuration*（1+DurationFactor字段配置属性id详细数值）
        %%: [0,0]  被动永久BUFF
        buffDuration,

        %%: 单次间隔时间，影响：
        %%: buff伤害间隔
        %%: buffeffect 中的 9，10，13，14
        buffDelay,

        %%: 0 第0秒不起作用
        %%: 1 第0秒起作用
        buffStart,

        %%: buff增加的属性值是否计算战力
        %%: 0，不计算
        %%: 1，计算
        battlepower,

        %%: buff效果类型
        %%: 0. 无特殊效果；1. 无敌；2. 昏迷；3. 冻结；4. 形变；5. 沉默；6. 缴械
        %%: 7. 减速 ，减少的速度填写到属性列
        %%: 8. pk保护，所有来自玩家的攻击无效。
        %%: 9. 临时获得触发技能，p1-4 技能id
        %%: 10.属性转化，p1施法者源总属性,p2 目标属性，p3 转化比例，p4 0加法值，1乘法值
        %%: 11.红名状态
        %%: 12.buff伤害的百分比转化为生命值恢复,p1 百分比
        %%: 13 .修改当前生命值 p1-整数， p2-目标生命上限比例，填写负数就是扣除生命
        %%: 14. 修改当前法力值 p1整数 ， p2-目标法力上限比例，填写负数就是扣除法力（废弃）
        %%: 15.虚化：不会被选中和受到伤害。
        %%: 16.伤害吸收盾（最小默认为1），吸收盾整数值+施法者某属性值*填写值 
        %%:     p1 吸收盾整数值 
        %%:     p2 属性索引值
        %%:     p3 填写值 
        %%: 17. 觉醒变身，p1-模型ID
        %%: 19. 修改能量值 p1-1圣力，2秘法，4魔怒，3影力， p2-能量值，正数获得，负数减少（废弃）
        %%: 20. 免疫特定效果：昏迷，冻结，形变，沉默，缴械，减速，定身   
        %%: 21. 免疫位移效果：免疫位移效果，击退，抓取位运算
        %%: 22. 击退抓取目标不受控制
        %%: 23. buff调用技能，p1 技能id
        %%: 24. 定身
        %%: 25. 嘲讽:怪物会攻击该buff的释放者
        %%: 26. 特殊处理过的自爆
        %%: 27. 霸体（被守护类怪物用）
        %%: 28. 灵力冥想
        %%: 30.控制女神小精灵隐藏
        %%: 31.治疗，用于持续治疗
        %%: 32.变形buff，p1为变大比例，负数为变小比例，p2为buff最大等级
        %%: 33. 人物变身buff，可以变身为monster/npc模型，p1-1 变身怪物；2 变身npc，p2 对应怪物/npcid
        %%: 34. 任务双人骑宠预先体验中npc上副驾驶位的跟随buff，p1为上双人坐骑副位的npcid
        %%: 35. 不可攻击其他玩家也不受其他玩家的攻击
        %%: 36. 光环总调用BUFF， p1半径， p2-4为buffid，需要配置成周期性触发buff（用于增加与删除）
        %%: 37. 伤害（实际伤害血量）反弹（反弹后的伤害不经过目标防御削减），p1-1 物理伤害反弹，2 法术伤害反弹，3 物理&法术伤害反弹，p2 反弹比例,100=100%
        buffEffect,

        %%: buff效果附加值1
        %%: buffeffect=33表示任务变身
        %%: 1-monster
        %%: 2-npc
        %%: buffeffect=34表示跟随的npcid
        buffParam1,

        %%: buff效果附加值2
        %%: buffeffect=33时，此参数表示对应的变身目标的id，与param1关联
        buffParam2,

        %%: buff效果附加值3
        buffParam3,

        %%: buff效果附加值4
        buffParam4,

        %%: 技能伤害类型，影响乘法值和加法值
        %%: 1 物理伤害，调用施法者的物攻
        %%: 2 魔法伤害，调用施法者的法攻
        %%: 6 治疗
        %%: 7 治疗，目标生命百分比
        %%: 8 伤害，目标生命百分比
        damageType,

        %%: 填写属性ID作为治疗量计算的参考值
        healProperty,

        %%: buff伤害是否暴击
        %%: 0 不暴击
        %%: 1 暴击
        criAble,

        %%: 伤害乘法值
        %%: 格式【公式类型，乘法值，等级成长值】
        %%: 公式类型：
        %%: 1.DamageMultiply= (a +(SkLv-1)*b)*layer[{1,a,b}]
        %%: 2.DamageMultiply= (a +SkLvIndex)*layer[{2,a,IndexName}]
        %%: 3.DamageMultiply= (a +b*某属性总值)*layer[{3,a,b,属性ID}]
        %%: 4.DamageMultiply= (a +b*能量当前值)*layer[{4,a,b}]
        %%: 多个花括号之间为求和关系
        damageMultiply,

        %%: 伤害加法值
        %%: 格式【公式类型，加法值，等级成长值】
        %%: 1.DamagePlus= (a +(SkLv-1)*b)*layer
        %%: 2.DamagePlus=( a +SkLvIndex)*layer
        %%: [{2,a,IndexName}]
        %%: 3.DamagePlus=( a +b*某属性总值)*layer
        %%: [{3,a,b,属性ID}]
        %%: 4.DamagePlus=( a +b*能量当前值)*layer
        %%: [{4,a,b}]
        %%: 多个花括号之间为求和关系
        damagePlus,

        %%: 属性类型和值
        %%: [{公式类型，加法值or乘法值，属性类型，参数…}]
        %%: 加法值填0，乘法值填1
        %%: 1.DamagePlus= (a +(SkLv-1)*b)*layer
        %%: [{1,1,属性类型,a,b}]
        %%: 2.DamagePlus= (a +SkLvIndex)*layer
        %%: [{2,0,属性类型,a,IndexName}]
        %%: 多个花括号之间为各自独立关系关系
        property,

        %%: buff死亡删除
        %%: 0 不删除
        %%: 1 删除
        %%: 只有在上线和镶嵌取下技能时才会移除buff
        buffDeathdel,

        %%: 可否被移除
        %%: 0 不可被移除
        %%: 1 可被移除
        buffRemove,

        %%: buff保存
        %%: 剩余时间小于1分钟不保存
        %%: 0 不保存
        %%: 1 保存不计时，下线后不会走时间
        %%: 2 保存计时，下线后会走时间
        buffstore,

        %%: 0 跨地图,离开位面不删除
        %%: 1 跨地图,离开位面删除
        outSenceDel,

        %%: 特定伤害系数
        damFactor,

        %%: buff持续时间系数属性id
        %%: 最终实际时间=BuffDuration*（1+DurationFactor配置的属性id具体数值）
        durationFactor,

        %%: 是否显示在主界面左上的BUFF按钮中
        %%: 1 显示
        %%: 0 不显示
        isdisplay,

        %%: 是否为被光环增加buff
        %%: 0 不是
        %%: 1 是
        %%: 如果是的话，则此BUFF会在时间处显示N/A
        ishaloed,

        %%: 该字段已废弃，默认配1
        %%: 剩余时间显示
        %%: 0 不显示
        %%: 1 显示
        durationDisplay

 }).

-endif.