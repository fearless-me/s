%%: 声明
-ifndef(cfg_arena).
-define(cfg_arena, 1).

-record(arenaCfg, {
        %%: 地图id
        mapid,

        %%: 事件类型
        %%: 1.刷怪
        %%: 2.刷采集物
        %%: 3.大炮
        event_type,

        %%: 刘展:
        %%: 事件对应的id
        %%: type=1时此处填怪物id
        %%: type=2时此处填采集物id
        %%: type=3时此处填大炮id
        event_id,

        %%: type=1时此处为怪物坐标
        %%: type=2时此处为采集物坐标
        %%: type=3时此处为大炮坐标
        coordinate,

        %%: 事件触发数量
        %%: type=1 此处填刷新怪物数量
        %%: type=2 此处填采集数量
        %%: type=3 此处填大炮数量
        event_num,

        %%: 刘展:
        %%: 事件触发时间
        %%: 单位秒
        event_time

 }).

-endif.