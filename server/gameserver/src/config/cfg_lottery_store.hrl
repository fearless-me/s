%%: 声明
-ifndef(cfg_lottery_store).
-define(cfg_lottery_store, 1).

-record(lottery_storeCfg, {
        id,

        %%: Windows 用户:
        %%: 1：金币抽奖的一般库
        %%: 2：金币抽奖的稀有库
        %%: 3：钻石抽奖的一般库
        %%: 4：钻石抽奖的稀有库
        %%: 其他随意
        storeID,

        %%: Windows 用户:
        %%: 格式：[2016,09,09]
        %%: 只能精确到日
        startTime,

        endTime,

        %%: 周几
        %%: 与starttime endtime不共存
        %%: 默认0：通用
        %%: 1-7就是周1-周末
        week,

        itemID,

        itemNumber,

        %%: Windows 用户:
        %%: 1绑定
        %%: 0非绑定
        isBind,

        weight,

        minLevel,

        maxLevel,

        %%: 是否为特产
        %%: 0 否
        %%: 1 是
        %%: 特产将出现在界面广告牌上
        specialty

 }).

-endif.