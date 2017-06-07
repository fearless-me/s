%%: 声明
-ifndef(cfg_petAvatareffect).
-define(cfg_petAvatareffect, 1).

-record(petAvatareffectCfg, {
        %%: 骑宠转生等级
        petAvatarelevel,

        %%: 特效名字
        effect,

        %%: 特效缩放系数
        scale

 }).

-endif.