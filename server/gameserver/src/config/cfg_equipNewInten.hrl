%%: 声明
-ifndef(cfg_equipNewInten).
-define(cfg_equipNewInten, 1).

-record(equipNewIntenCfg, {
        %%: 职业
        %%: 1 战士系职业
        %%: 2 法师系职业
        %%: 3 刺客系职业
        %%: 4 预留系职业
        iD,

        %%: 主手属性奖励
        %%: 属性ID，系数a，系数b
        mainHandBonus,

        %%: 头盔属性奖励
        helmBonus,

        %%: 耳环属性奖励
        offHandBonus,

        %%: 衣服属性奖励
        chestBonus,

        %%: 项链属性奖励
        amuletBonus,

        %%: 裤子属性奖励
        pantBonus,

        %%: 戒指属性奖励
        ringBonus,

        %%: 鞋子属性奖励
        bootBonus

 }).

-endif.