%%: 声明
-ifndef(cfg_identity_area).
-define(cfg_identity_area, 1).

-record(identity_areaCfg, {
        %%: id1，标记同省，界面省排序按此顺序
        id1,

        %%: id2，界面市排序按此顺序
        id2,

        %%: 身份证省筛选中的省名称
        area1,

        %%: 身份证市筛选中的市名称
        area2

 }).

-endif.