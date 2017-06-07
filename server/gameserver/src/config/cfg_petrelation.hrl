%%: 声明
-ifndef(cfg_petrelation).
-define(cfg_petrelation, 1).

-record(petrelationCfg, {
        id,

        %%: 技能ID
        skill,

        %%: 宠物ID
        petID1,

        %%: 宠物ID
        petID2,

        %%: 宠物ID
        petID3,

        %%: 宠物ID
        petID4,

        %%: 宠物ID
        petID5,

        %%: 宠物ID
        petID6

 }).

-endif.