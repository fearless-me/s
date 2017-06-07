%%: 声明
-ifndef(cfg_strref).
-define(cfg_strref, 1).

-record(strrefCfg, {
        %%: admin:
        %%: 需要替换的字符串
        refdesc,

        %%: admin:
        %%: 替换后的类型id
        id

 }).

-endif.