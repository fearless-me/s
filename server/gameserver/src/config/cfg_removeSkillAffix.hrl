%%: 声明
-ifndef(cfg_removeSkillAffix).
-define(cfg_removeSkillAffix, 1).

-record(removeSkillAffixCfg, {
        %%: ID
        id,

        %%: 1,骑士
        %%: 2,法师
        %%: 3,刺客
        %%: 4,魔女
        class,

        %%: buffid
        buff,

        %%: 载体id
        carrier,

        %%: 宠物id
        pet

 }).

-endif.