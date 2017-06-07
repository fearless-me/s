%%: 声明
-ifndef(cfg_petSkillRoll).
-define(cfg_petSkillRoll, 1).

-record(petSkillRollCfg, {
        %%: 宠物品质：
        %%: 0：白色
        %%: 1：绿色
        %%: 2：蓝色
        %%: 3：紫色
        %%: 4：橙色
        petquality,

        %%: PetSkillroll骑宠技能品质随机权重表：
        %%: 对应品质宠物在每次洗练时可获得的技能品质权重
        %%: {[技能品质,权重],[技能品质,权重]，，，，}
        %%: 0 白色品质技能
        %%: 1 绿色技能品质
        %%: 2 蓝色技能品质
        %%: 3 紫色技能品质
        %%: 4 橙色技能品质
        petSkillroll

 }).

-endif.