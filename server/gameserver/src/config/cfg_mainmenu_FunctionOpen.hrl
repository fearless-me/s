%%: 声明
-ifndef(cfg_mainmenu_FunctionOpen).
-define(cfg_mainmenu_FunctionOpen, 1).

-record(mainmenu_FunctionOpenCfg, {
        id,

        %%: user:
        %%: 1，等级开启，param为等级
        %%: 2，完成任务开启，param为任务id
        type,

        %%: 参数 
        param,

        %%: 按钮名称
        name,

        %%: user:
        %%: 按钮描述
        namedescribe,

        %%: 李菡琦:
        %%: 开启功能描述
        describe,

        %%: 李菡琦:
        %%: 功能涉及的icon
        icon

 }).

-endif.