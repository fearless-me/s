%%: 声明
-ifndef(cfg_petWar).
-define(cfg_petWar, 1).

-record(petWarCfg, {
        id,

        %%: 章节
        chapter,

        %%: 章节名称
        chapterName,

        %%: 关卡点
        point,

        %%: 每次体力消耗
        cost,

        %%: 配置关卡怪物ID
        %%: 也对应站位
        monster,

        %%:  怪物头像，客户端用于显示,头像ID
        monstericon,

        %%: 怪物战力，仅用于客户端显示；
        monsterpower,

        %%: 道具奖励显示，仅客户端使用
        gift_1,

        %%: 掉落包ID
        dorpid,

        %%: 作者:
        %%: 经验奖励
        exp,

        %%: 金币奖励
        money,

        %%: 下一个关卡  
        %%: 0代表关卡终结
        nextid,

        %%: 结束回合数，全部人出手算一个回合
        roundoff

 }).

-endif.