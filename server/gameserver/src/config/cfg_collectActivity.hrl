%%: 声明
-ifndef(cfg_collectActivity).
-define(cfg_collectActivity, 1).

-record(collectActivityCfg, {
        %%: 地图id
        %%: 可后台设置
        mapid,

        %%: 刷新坐标
        coordinate

 }).

-endif.