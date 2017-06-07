%%: 声明
-ifndef(cfg_serverstrings).
-define(cfg_serverstrings, 1).

-record(serverstringsCfg, {
        id,

        stringID,

        chs

 }).

-endif.