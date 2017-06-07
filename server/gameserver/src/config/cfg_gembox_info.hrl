%%: 声明
-ifndef(cfg_gembox_info).
-define(cfg_gembox_info, 1).

-record(gembox_infoCfg, {
        %%: 作者:
        %%: 格子的id顺序
        id,

        %%: 作者:
        %%: 格子能镶嵌的宝石类型，用的item_usetype4的参数
        %%: 1.红
        %%: 2.蓝
        %%: 3.绿
        gem_type,

        %%: 作者:
        %%: 多少级开启该宝石孔
        gem_show,

        %%: 作者:
        %%: 宝石孔的背景名
        gem_black

 }).

-endif.