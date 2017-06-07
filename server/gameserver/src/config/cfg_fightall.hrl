%%: 声明
-ifndef(cfg_fightall).
-define(cfg_fightall, 1).

-record(fightallCfg, {
        %%: 刘展:
        %%: 张龙:
        %%: 玩家战斗力小于参数则对应的bufID
        %%: 玩家战斗力＜fighting
        id,

        %%: 张龙:
        %%: 给与镜像的强化bufID
        bufid

 }).

-endif.