%%: 声明
-ifndef(cfg_gemproperty).
-define(cfg_gemproperty, 1).

-record(gempropertyCfg, {
        %%: 宝石插槽
        slot,

        %%: 宝石等级
        level,

        %%: 加成目标
        %%: 1 玩家
        %%: 2 技能召唤宠物
        %%: 3 收费宠物
        target,

        %%: 战士系职业属性
        %%: [{属性id，数值，加法或乘法值}]
        paladin,

        %%: 法师系职业
        wizard,

        %%: 刺客系职业
        assassin,

        %%: 预留系职业
        soulReaper,

        %%: 枪械师
        mechanic,

        %%: 枪械师的外观
        newplayer_1,

        %%: 枪械师的外观
        newplayer_2

 }).

-endif.