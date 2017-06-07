%%: 声明
-ifndef(cfg_mapConvey).
-define(cfg_mapConvey, 1).

-record(mapConveyCfg, {
        %%: 作者:
        %%: id 唯一标识符，没实际意义
        id,

        %%: 作者:
        %%: 地图Id和mapsetting配置表关联
        mapId,

        %%: 作者:
        %%: 该地图是否允许开启传送
        %%: 0不允许
        %%: 1允许
        %%: 此参数便于后期关闭部分传送地图
        isConvey,

        %%: 作者:
        %%: 开启传送条件
        %%: 0等级开启
        %%: 1任务开启
        opencondition,

        %%: 作者:
        %%: Opencondition的子类
        %%: 若Opencondition为0，则此处填玩家等级
        %%: 若Opencondition为1则此处填任务ID
        sparameter

 }).

-endif.