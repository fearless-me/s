%%: 声明
-ifndef(cfg_panelHelp).
-define(cfg_panelHelp, 1).

-record(panelHelpCfg, {
        %%: Administrator:
        %%: 前一级打开帮助界面的界面名称，全部小写
        id,

        %%: Administrator:
        %%: 路径Client\Assets\ToolOutput\Help下的命名
        help,

        %%: Administrator:
        %%: 策划内部注释标记
        tesk

 }).

-endif.