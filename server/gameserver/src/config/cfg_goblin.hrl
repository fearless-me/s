%%: 声明
-ifndef(cfg_goblin).
-define(cfg_goblin, 1).

-record(goblinCfg, {
        %%: 地图id
        mapid,

        %%: 刷新时间
        refreshtime,

        %%: 要刷的怪物id
        monsterid,

        %%: 刷新坐标
        refreshpos,

        %%: boss的id
        bossid,

        bossrefreshpos

 }).

-endif.