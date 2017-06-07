%%: 声明
-ifndef(cfg_talentExp).
-define(cfg_talentExp, 1).

-record(talentExpCfg, {
        %%: 玩家等级
        level,

        %%: 升级到下一级所需经验
        exp

 }).

-endif.