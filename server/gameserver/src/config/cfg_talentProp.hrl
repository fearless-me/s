%%: 声明
-ifndef(cfg_talentProp).
-define(cfg_talentProp, 1).

-record(talentPropCfg, {
        id,

        name,

        icon,

        %%: 1 玩家
        %%: 2 玩家出战的骑宠
        target,

        maxLevel,

        %%: 骑士属性
        %%: [{属性id，数值，加法或乘法值}]
        %%: 实际属性=等级*数值
        paladin,

        %%: 法师
        wizard,

        %%: 刺客
        assassin,

        %%: 魔女
        soulReaper,

        %%: 枪械
        mechanic,

        newplayer_1,

        newplayer_2,

        %%: 描述
        txt

 }).

-endif.