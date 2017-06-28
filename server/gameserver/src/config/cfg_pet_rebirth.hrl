%%: 声明
-ifndef(cfg_pet_rebirth).
-define(cfg_pet_rebirth, 1).

-record(pet_rebirthCfg, {
        %%: 作者:
        %%: 宠物转生次数
        petRebirth,

        %%: 作者:
        %%: 宠物品质
        petQuality,

        %%: 作者:
        %%: 转生必给血量
        maxHP2,

        %%: 作者:
        %%: 转生必给物攻
        physicalAttack,

        %%: 作者:
        %%: 转生必给魔攻
        magicAttack,

        %%: 作者:
        %%: 转生必给物防
        physicalDefence,

        %%: 作者:
        %%: 转生必给魔防
        magicDefence,

        %%: 作者:
        %%: 转生血量系数
        maxHP2Multiply,

        %%: 作者:
        %%: 转生物攻系数
        physicalAttackMultiply,

        %%: 作者:
        %%: 转生魔攻系数
        magicAttackMultiply,

        %%: 作者:
        %%: 转生物理防御系数
        physicalDefenceMultiply,

        %%: 作者:
        %%: 转生魔防系数
        magicDefenceMultiply,

        %%: 作者:
        %%: 宠物成长资质
        rebirthGrow

 }).

-endif.