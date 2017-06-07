%%: 声明
-ifndef(cfg_rndname).
-define(cfg_rndname, 1).

-record(rndnameCfg, {
        %%: admin:
        %%: 序列id
        id,

        %%: admin:
        %%: 姓氏
        firstname,

        %%: admin:
        %%: 男性名字
        boyname,

        %%: admin:
        %%: 女性名字
        girlname

 }).

-endif.