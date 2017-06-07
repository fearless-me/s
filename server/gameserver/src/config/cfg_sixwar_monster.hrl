%%: 声明
-ifndef(cfg_sixwar_monster).
-define(cfg_sixwar_monster, 1).

-record(sixwar_monsterCfg, {
        %%: 对应map表的地图ID
        mapid,

        %%: 作者:
        %%: 刷怪范例
        %%: [{怪物id,个数,坐标X,坐标Y}]
        %%: [{306,1,101,105},{306,1,21,35},{307,4,85,96}]
        addmonster,

        %%: 坐标为0,0时，随机刷新点的范围大小单位米
        radius

 }).

-endif.