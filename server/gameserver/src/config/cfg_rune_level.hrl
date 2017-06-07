%%: 声明
-ifndef(cfg_rune_level).
-define(cfg_rune_level, 1).

-record(rune_levelCfg, {
        id,

        lv,

        %%: 升级经验
        exp,

        %%: 熔炼转换系数
        smeltRatio,

        %%: 基础属性升级系数
        growRatio,

        %%: Administrator:
        %%: 熔炼时消耗的非绑定金币数量
        cost

 }).

-endif.