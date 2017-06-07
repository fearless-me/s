%%: 声明
-ifndef(cfg_escort_event).
-define(cfg_escort_event, 1).

-record(escort_eventCfg, {
        %%: 刘展:
        %%: 怪物分组
        id,

        %%: 触发事件
        %%: 1.奖励增加[1,增加百分比]
        %%: 2.马车buf[2,bufid]
        %%: 3.护送玩家buf[3,bufid]
        %%: 4.劫掠玩家buf[4,bufid]
        %%: 5.额外刷新怪物[5,怪物组id（0=随机）,刷新半径]
        event,

        %%: 刘展:
        %%: 事件中文名用于客户端显示
        event_name,

        %%: 刘展:
        %%: 单次护送中事件触发次数
        %%: 超过后将不会再触发该事件
        %%: -1代表不限制次数
        event_num

 }).

-endif.