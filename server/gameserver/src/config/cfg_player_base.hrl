%%: 声明
-ifndef(cfg_player_base).
-define(cfg_player_base, 1).

-record(player_baseCfg, {
        %%: 玩家等级
        level,

        %%: 职业：BY姜泓妃
        %%: 职业ID与play_desc中一致
        class,

        %%: 升级到下一级所需经验
        exp,

        %%: 生命上限
        maxHP,

        %%: Administrator:
        %%: 物攻
        physicalAttack,

        %%: Administrator:
        %%: 法攻
        magicAttack,

        %%: Administrator:
        %%: 物防
        physicalDefence,

        %%: Administrator:
        %%: 法防
        magicDefence,

        %%: Administrator:
        %%: 暴击等级
        criticalLevel,

        %%: Administrator:
        %%: 抗爆等级
        criticalResistLevel,

        %%: Administrator:
        %%: 爆伤等级
        criticalDamageLevel,

        %%: Administrator:
        %%: 韧性等级
        tenaciousLevel,

        %%: Administrator:
        %%: 命中等级
        hitLevel,

        %%: Administrator:
        %%: 闪避等级
        dodgeLevel,

        %%: Administrator:
        %%: 破甲等级
        armorPenetrationLevel,

        %%: admin:
        firmLevel,

        %%: Administrator:
        %%: 生命秒回值
        hPRecover,

        %%: Administrator:
        mPRecover,

        %%: 角色天生额外带有的属性
        %%: [属性id，值，加法或乘法值]
        %%: 0 加法
        %%: 1 乘法
        exraAttribute,

        %%: 掉宝率
        dropRate,

        %%: 坚韧
        tough,

        %%: 唐斯然:
        %%: 命中初始值
        score,

        %%: 力量
        strength,

        %%: 敏捷
        agility,

        %%: 智力
        intelligence,

        %%: 体质
        constitution,

        %%: 法力上限
        maxMana

 }).

-endif.