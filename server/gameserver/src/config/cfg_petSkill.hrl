%%: 声明
-ifndef(cfg_petSkill).
-define(cfg_petSkill, 1).

-record(petSkillCfg, {
        %%: 技能ID
        iD,

        %%: 品质：
        %%: 0：绿色
        %%: 1：蓝色
        %%: 2：紫色
        %%: 3：橙色
        %%: 4：红色
        quality,

        %%: 最小等级
        minLv,

        %%: 最大等级
        maxLv,

        %%: 战斗力系数
        battleEffi,

        %%: 作者:
        %%: 宠物技能的类型
        %%: 同类型的技能不会同时出现在同一个宠物上
        %%: 具体类型由策划定义，如
        %%: 1 主角生命加成型
        %%: 2 主角攻击加成型
        %%: 3 自身攻击加成型 
        %%: 当petskilltype相同时，洗炼不会同时出现
        petSkillType,

        %%: 作者:
        %%: 技能权重
        weight

 }).

-endif.