%%: 声明
-ifndef(cfg_skill_up).
-define(cfg_skill_up, 1).

-record(skill_upCfg, {
        %%: 技能ID
        id,

        level,

        %%: 升级所需要的道具
        %%: [{道具ID，数量}]
        up_item,

        %%: 升级需要的货币
        %%: [{类型，数量}]
        up_money

 }).

-endif.