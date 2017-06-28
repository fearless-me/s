%%: 声明
-ifndef(cfg_seven_day_aim).
-define(cfg_seven_day_aim, 1).

-record(seven_day_aimCfg, {
        id,

        day,

        type,

        name,

        show,

        preview,

        subType1,

        args1,

        subType2,

        args2,

        subType3,

        args3,

        rewardCoin,

        rewardItem

 }).

-endif.