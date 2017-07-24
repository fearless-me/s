%%: 声明
-ifndef(cfg_animation).
-define(cfg_animation, 1).

-record(animationCfg, {
        %%: 动画id
        %%: 1-100         副本
        %%: 101-1000   活动
        %%: 1001-2000 场景浏览
        %%: 2001-...       剧情
        id,

        %%: 动画名称，调用路径Client\Assets\GameAssets\Cinema
        name,

        %%: 动画播放是否每次触发都播放
        %%: 1.是（每次触发都播放）
        %%: 0.否（只在第一次触发时播放）（适用于野外地图进入与任务剧情等）
        isloop

 }).

-endif.