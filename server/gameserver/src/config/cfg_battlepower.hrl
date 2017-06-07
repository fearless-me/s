%%: 声明
-ifndef(cfg_battlepower).
-define(cfg_battlepower, 1).

-record(battlepowerCfg, {
        %%: 作者:
        %%: 战斗力相关的各类等级
        id,

        %%: 张龙:
        %%: 玩家等级战斗力
        playerlvpower,

        %%: 张龙:
        %%: 女神等级战斗力
        godpower,

        %%: 张龙:
        %%: 宝石等级战斗力
        gempower,

        %%: 张龙:
        %%: 单件装备强化各级战斗力
        equipintpower,

        %%: 张龙:
        %%: 单件神器各级战斗力
        sqpower,

        %%: 张龙:
        %%: 单个神器技能各等级战力
        sqskillpower,

        %%: 张龙:
        %%: 单件装备各等级战斗力
        equipbasepower,

        %%: 张龙:
        %%: 单条装备附加属性各等级战斗力
        equipaddpower,

        %%: 张龙:
        %%: 宠物等级战斗力
        petlvpower,

        %%: 张龙:
        %%: 宠物装备单件各等级战斗力
        petequippower,

        %%: 张龙:
        %%: 天赋技能战斗力，加到玩家身上
        talentpower1,

        %%: 张龙:
        %%: 天赋技能战斗力，加到宠物身上
        talentpower2,

        %%: 张龙:
        %%: 军团技能战斗力
        legionSkills,

        %%: 翅膀的战斗力
        wingpower,

        %%: 唐斯然:
        %%: 时装战力
        %%: ID=时装ID
        fashion

 }).

-endif.