%%: 声明
-ifndef(cfg_signinaward).
-define(cfg_signinaward, 1).

-record(signinawardCfg, {
        id,

        %%: 签到类型
        %%: 0:每日签到
        %%: 1~7:七日签到
        %%: 8:手机绑定
        signtype,

        %%: 道具id
        itemid,

        %%: 道具数量
        itemnum,

        %%: 模型ID
        %%: 没有就不填
        model,

        %%: 坐标
        angle,

        size,

        posOffset

 }).

-endif.