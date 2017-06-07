%%: 声明
-ifndef(cfg_honor).
-define(cfg_honor, 1).

-record(honorCfg, {
        %%: 等级
        level,

        %%: 升级荣誉消耗
        consumption,

        %%: 骑士
        %%: {属性id,属性值,加法或乘法值}
        %%: 0 加法值
        %%: 1 乘法值
        paladin,

        %%: 法师
        wizard,

        %%: 刺客
        assassin,

        %%: 魔女
        soulReaper,

        %%: 枪械师
        mechanic,

        %%: 枪械师的外观
        newplayer_1,

        %%: 枪械师的外观
        newplayer_2,

        %%: 升级金币消耗
        money,

        %%: 图标
        model,

        %%: 神器的显示名
        name,

        icon

 }).

-endif.