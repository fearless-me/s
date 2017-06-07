%%: 声明
-ifndef(cfg_rift_rand).
-define(cfg_rift_rand, 1).

-record(rift_randCfg, {
        %%: 地图ID
        mapid,

        npcid,

        %%: 对应mapsetting位面列表
        mapsetting_id

 }).

-endif.