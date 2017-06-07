%%: 声明
-ifndef(cfg_fightbossActivity).
-define(cfg_fightbossActivity, 1).

-record(fightbossActivityCfg, {
        %%: 地图id
        %%: 可后台设置
        mapid,

        %%: 刷新坐标
        coordinate

 }).

-endif.