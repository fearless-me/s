%%: 声明
-ifndef(cfg_mapshadow).
-define(cfg_mapshadow, 1).

-record(mapshadowCfg, {
        %%: 地图资源名称，只针对有光照数据的场景
        mapname,

        %%: 白天受到的阴影
        day_r,

        %%: 白天受到的阴影
        day_g,

        %%: 白天受到的阴影
        day_b,

        %%: 晚上受到的阴影
        night_r,

        %%: 晚上受到的阴影
        night_g,

        %%: 晚上受到的阴影
        night_b

 }).

-endif.