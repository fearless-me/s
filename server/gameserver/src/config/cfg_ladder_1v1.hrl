%%: 声明
-ifndef(cfg_ladder_1v1).
-define(cfg_ladder_1v1, 1).

-record(ladder_1v1Cfg, {
        %%: tiancheng:
        %%: 竞技场起始排名
        rank_start,

        %%: tiancheng:
        %%: 竞技场终止排名
        rank_end,

        %%: tiancheng:
        %%: 竞技场随机怪物组的ID
        monsterID,

        %%: tiancheng:
        %%: 怪物战斗力
        fc_value

 }).

-endif.