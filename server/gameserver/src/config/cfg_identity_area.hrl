%%: 声明
-ifndef(cfg_identity_area).
-define(cfg_identity_area, 1).

-record(identity_areaCfg, {
        id1,

        id2,

        %%: 字符串类型，以下举例
        area1,

        %%: mty:
        %%: 字符串类型，以下举例
        area2

 }).

-endif.