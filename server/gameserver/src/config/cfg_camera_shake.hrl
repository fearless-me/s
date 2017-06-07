%%: 声明
-ifndef(cfg_camera_shake).
-define(cfg_camera_shake, 1).

-record(camera_shakeCfg, {
        %%: 张龙:
        %%: 震动的id
        id,

        %%: 张龙:
        %%: 震动的类型
        %%: 0 横向
        %%: 1 纵向
        %%: 2 乱来
        shake_type,

        %%: 张龙:
        %%: 震动的时间，浮点数，秒为单位
        shake_time,

        %%: 张龙:
        %%: 震动力度，浮点数
        %%: 1为标准100%的力度
        shake_power,

        %%: 张龙:
        %%: 用哪一根曲线，填id
        %%: 这仨截止备注时间都是一条线
        use_wave

 }).

-endif.