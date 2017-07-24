%%: 声明
-ifndef(cfg_home_zoo).
-define(cfg_home_zoo, 1).

-record(home_zooCfg, {
        %%: 林凯强:
        %%: 饲养区等级
        zoo_level,

        %%: 林凯强:
        %%: 可寄放动物数量
        pet_num,

        %%: 林凯强:
        %%: [经验值/分钟,可寄放的时间上限（分钟）]
        exp_get,

        %%: 林凯强:
        %%: 每只宠物可投喂次数
        food_times

 }).

-endif.