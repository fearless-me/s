%%: 声明
-ifndef(cfg_demonreward).
-define(cfg_demonreward, 1).

-record(demonrewardCfg, {
        %%: 角色等级
        %%: 怪物波数
        id,

        %%: 对应玩家等级获取到的经验
        expreward,

        %%: 对应波数获得的奖励倍率
        waverate

 }).

-endif.