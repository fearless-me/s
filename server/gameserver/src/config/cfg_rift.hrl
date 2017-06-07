%%: 声明
-ifndef(cfg_rift).
-define(cfg_rift, 1).

-record(riftCfg, {
        %%: 地图ID
        mapid,

        %%: 描述
        desc1,

        %%: 描述
        desc2,

        %%: 更新间隔时间秒
        cd,

        move_npc_list,

        %%: 位面入口裂痕位置
        position

 }).

-endif.