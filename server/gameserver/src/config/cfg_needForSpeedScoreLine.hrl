%%: 声明
-ifndef(cfg_needForSpeedScoreLine).
-define(cfg_needForSpeedScoreLine, 1).

-record(needForSpeedScoreLineCfg, {
        %%: 作者:
        %%: 触发区域序列
        id,

        %%: 作者:
        %%: 触发区域左上角坐标
        %%: [x,y]
        check_area_left_top,

        %%: 作者:
        %%: 触发区域右上角坐标
        %%: [x,y]
        check_area_right_top,

        %%: 作者:
        %%: 触发区域右下角坐标
        %%: [x,y]
        check_area_right_bottom,

        %%: 作者:
        %%: 触发区域左下角坐标
        %%: [x,y]
        check_area_left_bottom,

        %%: 作者:
        %%: 是否是终点，是1，否0
        isEndLine

 }).

-endif.