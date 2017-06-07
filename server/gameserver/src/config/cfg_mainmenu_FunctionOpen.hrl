%%: 声明
-ifndef(cfg_mainmenu_FunctionOpen).
-define(cfg_mainmenu_FunctionOpen, 1).

-record(mainmenu_FunctionOpenCfg, {
        id,

        %%: 李菡琦:
        %%: 开启等级
        level,

        %%: 李菡琦:
        %%: 开启功能名称
        name,

        %%: 李菡琦:
        %%: 开启功能描述
        describe,

        %%: 李菡琦:
        %%: 功能涉及的icon
        icon

 }).

-endif.