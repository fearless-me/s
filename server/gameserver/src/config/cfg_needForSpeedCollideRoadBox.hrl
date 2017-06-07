%%: 声明
-ifndef(cfg_needForSpeedCollideRoadBox).
-define(cfg_needForSpeedCollideRoadBox, 1).

-record(needForSpeedCollideRoadBoxCfg, {
        %%: 作者:
        %%: 道具箱序列
        id,

        %%: 作者:
        %%: 触发原点坐标
        born_x,

        %%: 作者:
        %%: 触发原点坐标
        born_z,

        %%: 作者:
        %%: 触发半径
        check_area_range

 }).

-endif.