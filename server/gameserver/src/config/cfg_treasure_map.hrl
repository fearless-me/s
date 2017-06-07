%%: 声明
-ifndef(cfg_treasure_map).
-define(cfg_treasure_map, 1).

-record(treasure_mapCfg, {
        id,

        %%: 地图的ID
        map,

        %%: 该地图下可能出现的坐标点
        coordinate

 }).

-endif.