%%: 声明
-ifndef(cfg_identity_zodiac).
-define(cfg_identity_zodiac, 1).

-record(identity_zodiacCfg, {
        %%: id，界面排序按此顺序
        id,

        %%: 身份证星座筛选中的星座名称
        name

 }).

-endif.