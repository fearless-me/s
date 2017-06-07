%%: 声明
-ifndef(cfg_moneyDungeon).
-define(cfg_moneyDungeon, 1).

-record(moneyDungeonCfg, {
        %%: 作者:
        %%: mapsetting里的地图id
        id,

        %%: 菡琦:
        %%: 波数
        boshu,

        %%: 作者:
        %%: 每个地图刷怪数量，配成数组
        %%: [{怪物id，数量}]
        monster,

        %%: 作者:
        %%: 怪物刷新间隔，每隔多少秒出现一只
        time,

        %%: 作者:
        %%: 副本结束时间
        time_over

 }).

-endif.