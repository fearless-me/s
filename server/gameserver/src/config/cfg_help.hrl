%%: 声明
-ifndef(cfg_help).
-define(cfg_help, 1).

-record(helpCfg, {
        %%: Assets\ToolOutput\Help再下一级文件夹中的命名
        %%: 全部小写，不能重复；保证子一级文件夹名与子二级文件名称一致
        id,

        %%: 帮助界面页签的名称显示（左侧id对应的各国翻译）
        chinese,

        traditional,

        korean,

        english

 }).

-endif.