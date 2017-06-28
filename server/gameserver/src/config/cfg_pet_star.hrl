%%: 声明
-ifndef(cfg_pet_star).
-define(cfg_pet_star, 1).

-record(pet_starCfg, {
        %%: 作者:
        %%: 宠物升星
        petStar,

        %%: 作者:
        %%: 宠物品质
        petQuality,

        maxHP2,

        physicalAttack,

        magicAttack,

        physicalDefence,

        magicDefence

 }).

-endif.