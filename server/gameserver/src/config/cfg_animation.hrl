%%: 声明
-ifndef(cfg_animation).
-define(cfg_animation, 1).

-record(animationCfg, {
        id,

        %%: user:
        name,

        %%: 该动画播放是否循环播放（适用于野外地图进入与任务剧情只在第一次播放入场动画）
        %%: 1.是
        %%: 0.否
        isloop

 }).

-endif.