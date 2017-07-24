%%: 声明
-ifndef(cfg_home).
-define(cfg_home, 1).

-record(homeCfg, {
        %%: tiancheng:
        %%: 小区ID，唯一，指定后不允许删除修改
        id,

        %%: tiancheng:
        %%: 小区所属行政区ID
        adminID,

        %%: tiancheng:
        %%: 小区名字
        name,

        %%: tiancheng:
        %%: 家园小区不同等级对应的地图ID（房屋地图），前面依次按等级取，等级超过则取最后一个
        %%: [小屋id1小屋id2,小屋id3]
        mapIDs,

        %%: tiancheng:
        %%: 庭院地图IDs，前面依次按等级取，等级超过则取最后一个
        courtyardMapIDs

 }).

-endif.