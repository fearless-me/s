%%: 声明
-ifndef(cfg_acKingBattleBuyBuff).
-define(cfg_acKingBattleBuyBuff, 1).

-record(acKingBattleBuyBuffCfg, {
        %%: 作者:
        %%: 1为攻击方
        %%: 2为镜像
        %%: 3为防守
        id,

        buffID,

        %%: 作者:
        %%: 从当前等级升级到下一级需要的费用
        coin,

        %%: 作者:
        %%: 购买类型货币
        %%: 1 金币
        %%: 2 绑金
        %%: 3 钻石
        %%: 4 声望
        %%: 5 荣誉值
        %%: 6 绑钻
        %%: 7 紫色精华
        %%: 8 金色精华
        %%: 9 功勋
        %%: 10 积分
        %%: 11 魔能水晶
        %%: 12 最大货币类型
        coinType,

        %%: 作者:
        %%: 下一级BUFF ID
        nextCfgID,

        %%: 作者:
        %%: 一键达到BUFF ID
        oneKeyBuyCfgID,

        %%: 作者:
        %%: 从当前等级、一键升级到最高级消耗的费用
        oneKeyBuyCoin,

        %%: 作者:
        %%: 一键消耗类型
        oneKeyBuyCoinType,

        floor

 }).

-endif.