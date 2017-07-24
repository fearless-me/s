%%: 声明
-ifndef(cfg_monster_file).
-define(cfg_monster_file, 1).

-record(monster_fileCfg, {
        monster_id,

        monster_name,

        size,

        area,

        area_name,

        rank,

        %%: [1,0]表示照相，
        %%: [2,N]表示击杀怪物，N表示数量
        unlock_way,

        %%: [1,N,0]表示奖励N经验
        %%: ,[2,x,y]表示奖励X类货币Y数量
        unlock_reward,

        monster_desc,

        monster_area,

        %%: [属性ID，属性值]
        extra_bonus,

        extra_target

 }).

-endif.