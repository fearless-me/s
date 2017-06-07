%%: 声明
-ifndef(cfg_guild).
-define(cfg_guild, 1).

-record(guildCfg, {
        %%: 作者:
        %%: 帮会等级<=65535
        id,

        %%: 作者:
        %%: 资金上限
        max_res,

        %%: 作者:
        %%: 活跃上限
        max_liv,

        %%: 作者:
        %%: 升级所需资金
        need_res,

        %%: 作者:
        %%: 升级所需活跃度
        need_liv,

        %%: 作者:
        %%: 成员上限
        member_number,

        %%: 作者:
        %%: 副团长上限
        leader_1,

        %%: 作者:
        %%: 精英上限
        leader_2,

        %%: 作者:
        %%:   商店升级所需
        %%: {等级，需要资金，需要活跃度}
        shop_upgrade,

        reward,

        snowman

 }).

-endif.