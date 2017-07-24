%%: 声明
-ifndef(cfg_indexFunction).
-define(cfg_indexFunction, 1).

-record(indexFunctionCfg, {
        %%: 等级
        level,

        %%: 升级到下一级所需经验
        exp,

        %%: 魔神地宫怪物伤害（等级）系数
        demonDamLv,

        %%: 魔神地宫怪物抗性（等级）系数
        demonResLv,

        %%: 魔神地宫怪物生命（等级）系数
        demonHPLv,

        %%: 魔神地宫怪物伤害（波数）系数
        demonDamWave,

        %%: 魔神地宫怪物抗性（波数）系数
        demonResWave,

        %%: 魔神地宫怪物生命（波数）系数
        demonHPWave,

        %%: 时空裂痕怪物伤害（等级）系数
        riftDamLv,

        %%: 时空裂痕怪物抗性（等级）系数
        riftResLv,

        %%: 时空裂痕怪物生命（等级）系数
        riftHPLv,

        %%: 英雄副本怪物伤害（难度）系数
        heroDgDamLv,

        %%: 英雄副本怪物生命（难度）系数
        heroDgHPLv,

        %%: 英雄副本掉落（难度）系数
        heroDgDropLv,

        %%: Administrator:
        %%: 生命秒回值
        hPRecover,

        %%: 离线经验——
        %%: 每分钟积累经验
        offLineExpFree,

        %%: 离线经验——
        %%: 离线经验累积上限（按照12小时计算）
        offLineExpFreeAll,

        %%: 离线经验——
        %%: 金币领取的经验倍率
        offLineExpGold,

        %%: 离线经验——
        %%: 领取每点经验时消耗的金币数
        offLineGoldCost,

        %%: 离线经验——
        %%: 钻石领取的经验倍率
        offLineExpDiamond,

        %%: 离线经验——
        %%: 领取经验时每点经验消耗的钻石数
        %%: 填入值需乘以10000
        %%: 代码中取值会除以10000
        offLineDiamondCost,

        %%: 答题经验
        question_exp,

        %%: 答题金币
        question_money,

        coinAddition,

        coinHand_box,

        %%: Luoch:
        %%: 广场舞经验配置，秒
        %%: [每秒获得的经验值，当日可通过广场舞获得经验上限]
        squaredance_exp,

        field_exp_up,

        map_name,

        monster_id

 }).

-endif.