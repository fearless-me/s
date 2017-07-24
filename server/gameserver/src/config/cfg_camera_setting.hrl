%%: 声明
-ifndef(cfg_camera_setting).
-define(cfg_camera_setting, 1).

-record(camera_settingCfg, {
        %%: 视角类型
        %%: 1、2.5D视角
        %%: 2、3D
        %%: 3、3D+视角
        %%: 5，6，7、2.5D视角（约会地下城场景专用），如果新增需要同步程序
        type,

        %%: 视角高度
        %%: 第一个：初始值
        %%: 第二个：最大值
        %%: 第三个：最小值
        %%: -1：不可调整
        distance,

        %%: 视角角度
        angle,

        lens_following_sensitivity,

        operation_sensitivity

 }).

-endif.