%%: 声明
-ifndef(cfg_ladder_1v1_rand).
-define(cfg_ladder_1v1_rand, 1).

-record(ladder_1v1_randCfg, {
        %%: tiancheng:
        %%: 排名开始
        rank_start,

        %%: tiancheng:
        %%: 排名结束
        rank_end,

        %%: tiancheng:
        %%: 向前增加的排名随机范围，如果为0，表示从1~10中随机取
        %%: 搜索排名在自己前面的玩家
        front_2,

        %%: tiancheng:
        %%: 向前增加的排名随机范围，如果为0，表示从1~10中随机取
        %%: 搜索排名在自己前面的玩家
        front_1,

        %%: tiancheng:
        %%: 向后增加的排名随机范围
        %%: 搜索排名在自己后面的玩家
        back_1,

        %%: tiancheng:
        %%: 向后增加的排名随机范围
        back_2,

        %%: tiancheng:
        %%: 向前增加的排名随机范围，如果为0，表示从1~10中随机取
        front_3,

        %%: tiancheng:
        %%: 向前增加的排名随机范围，如果为0，表示从1~10中随机取
        front_4

 }).

-endif.