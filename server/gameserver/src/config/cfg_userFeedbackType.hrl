%%: 声明
-ifndef(cfg_userFeedbackType).
-define(cfg_userFeedbackType, 1).

-record(userFeedbackTypeCfg, {
        iD,

        desc

 }).

-endif.