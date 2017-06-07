%%: 声明
-ifndef(cfg_specialinstance).
-define(cfg_specialinstance, 1).

-record(specialinstanceCfg, {
        %%: 作者:
        %%: mapsetting里的地图id
        id,

        %%: 菡琦:
        %%: 波数
        turn,

        %%: user:
        %%: boss关卡标识
        %%: 0，不是boss关
        %%: 1，是boss关
        boss,

        %%: 作者:
        %%: 每个地图刷怪数量，配成数组
        %%: 道路1（金币副本只有1条路）
        %%: [{怪物id，数量，X坐标，Z坐标}]
        monster_way1,

        %%: 作者:
        %%: 怪物刷新间隔，每隔多少秒出现一只
        time,

        %%: user:
        %%: 这一波结束后间隔多少秒刷下一波
        time_turn,

        %%: 作者:
        %%: 副本结束时间
        time_over,

        %%: user:
        %%: 副本结算奖励
        item,

        %%: user:
        %%: 伤害npc
        %%: {npcid，升级魔秽消耗}
        levelup_1,

        %%: user:
        %%: 减速npc
        %%: {npcid，升级魔秽消耗}
        levelup_2,

        %%: user:
        %%: 加伤npc
        %%: {npcid，升级魔秽消耗}
        levelup_3

 }).

-endif.