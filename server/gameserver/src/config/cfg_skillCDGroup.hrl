%%: 声明
-ifndef(cfg_skillCDGroup).
-define(cfg_skillCDGroup, 1).

-record(skillCDGroupCfg, {
        %%: 冷却组id
        id,

        %%: 冷却时间
        time

 }).

-endif.