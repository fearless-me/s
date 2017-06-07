%%: 声明
-ifndef(cfg_welfare).
-define(cfg_welfare, 1).

-record(welfareCfg, {
        %%: ID程序写死了~~ 不要插入~~ 请添加~
        id,

        %%: 作者:
        %%: 玩法名称
        name,

        %%: 作者:
        %%: 开启条件
        %%: 1.等级开启
        %%: 2.任务开启
        openconditions,

        %%: Administrator:
        %%: 排序
        sort,

        %%: 作者:
        %%: 开启条件参数
        %%: 若为等级开启，则该处为开启等级值；
        %%: 若为任务开启，则该处为开启任务ID；
        parameter,

        %%: 闪光特效
        %%: 1.闪
        %%: 0.不闪
        stars,

        %%: 作者:
        %%: 展示道具1
        item_1,

        %%: 作者:
        %%: 展示道具2
        item_2,

        %%: 作者:
        %%: 展示道具3
        item_3,

        %%: 作者:
        %%: 展示道具4
        item_4,

        %%: 作者:
        %%: 展示道具5
        item_5,

        %%: 作者:
        %%: 展示道具6
        item_6,

        %%: 作者:
        %%: 按钮相关
        button,

        %%: 作者:
        %%: 图片路径
        picture

 }).

-endif.