%%: 声明
-ifndef(cfg_knighted_level).
-define(cfg_knighted_level, 1).

-record(knighted_levelCfg, {
        %%: 爵位等级
        level,

        %%: 升级到该爵位需要的声望值；
        exp,

        %%: 该等级爵位的中文名称
        txt,

        %%: 特权
        %%: 特权ID
        %%: {特权ID，特权等级}
        power,

        %%: 开启的福利ID  1
        %%: 此参数已作废
        welfare,

        %%: 道具奖励 1
        reward_item,

        %%: 作者:
        %%: 是否显示展示光圈特效
        %%: 0不显示
        %%: 1显示
        is_effect,

        %%: 作者:
        %%: 爵位图标
        icon,

        %%: 作者:
        %%: 头像上显示爵位图标
        show,

        vip_buff,

        vip_buff_explain

 }).

-endif.