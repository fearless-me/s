%%: 声明
-ifndef(cfg_rank).
-define(cfg_rank, 1).

-record(rankCfg, {
        %%: 张龙:
        %%: 排行榜id，也是服务器用的type
        id,

        %%: 张龙:
        %%: 客户端显示的名字
        show_name,

        %%: 分页中的排行。角色名。的XXX中的XXX
        dec,

        show_id,

        %%: 张龙:
        %%: 客户端是否显示这个排行榜
        %%: 配0，不显示
        show_client,

        %%: 刷新周期
        %%: 2 按周刷新
        %%: 1 按天刷新
        %%: 0 不刷新 失效
        fresh_cycle,

        %%: 刷新时间
        %%: 400 凌晨4点
        %%: 1600 下午4点
        %%: 如果cycle是周，这里就配星期和时，1星期1，7星期天
        fresh_time,

        %%: 张龙:
        %%: 排行榜上的玩家数量 
        player_number,

        %%: 排行奖励（每次刷榜就可以重新开始领取）:
        %%: [{1,1,itemid,number},{2,10,itemid,number},,,,{101,-1,itemid,number}]
        rank_reward

 }).

-endif.