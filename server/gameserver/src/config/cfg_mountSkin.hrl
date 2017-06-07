%%: 声明
-ifndef(cfg_mountSkin).
-define(cfg_mountSkin, 1).

-record(mountSkinCfg, {
        %%: 坐骑模型ID<=65535
        iD,

        %%: 名字
        name,

        %%: 图标
        icon,

        %%: 描述
        des,

        %%: 骑乘时调用骑乘动作，名称为mountmoveX
        animation_1,

        %%: 该坐姿对应的坐骑绑定点
        %%: 多人坐骑时，此为主位
        slot_1,

        animation_2,

        %%: 该坐姿对应的坐骑绑定点
        %%: 多人坐骑时，此为副位
        slot_2,

        %%: 作者:
        %%: 是否显出来给玩家看
        %%: 0 不显示
        %%: 1 显出来
        showout,

        %%: 作者:
        %%: 这个皮肤如何获得
        mount_getdesc,

        %%: 作者:
        %%: 排列顺序
        show_number,

        %%: 作者:
        %%: 模型显示大小百分比
        model_scale,

        %%: 作者:
        %%: 在这个坐骑上，摄像机默认增加的高度
        camera_up,

        %%: 作者:
        %%: 奔跑动画的播放速度
        playspeed,

        %%: 作者:
        %%: 显示类别
        %%: 0 成长系
        %%: 1其他系
        show_type,

        %%: Windows 用户:
        %%: 0不隐藏
        %%: 1隐藏
        weapon_hiden

 }).

-endif.