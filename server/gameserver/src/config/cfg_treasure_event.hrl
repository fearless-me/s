%%: 声明
-ifndef(cfg_treasure_event).
-define(cfg_treasure_event, 1).

-record(treasure_eventCfg, {
        %%: 且与item表中使用参数关联
        id,

        %%: 触发事件
        %%: [{事件ID，触发权重}...]
        %%: 事件ID关联位面表
        event

 }).

-endif.