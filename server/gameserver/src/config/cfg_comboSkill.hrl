%%: 声明
-ifndef(cfg_comboSkill).
-define(cfg_comboSkill, 1).

-record(comboSkillCfg, {
        %%: 连击ID
        iD,

        %%: 连击技能组
        skills

 }).

-endif.