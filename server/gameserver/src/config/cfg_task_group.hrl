%%: 声明
-ifndef(cfg_task_group).
-define(cfg_task_group, 1).

-record(task_groupCfg, {
        %%: 组id
        id,

        %%: 组名字
        groupname,

        %%: admin:
        %%: 该组包含的地图
        groupmap,

        %%: 任务组在面板上的内容描述
        groupcontent,

        %%: Windows 用户:
        %%: 物品型奖励
        %%: item1 第一种道具奖励的名字
        %%: num1 第一种奖励道具的个数
        %%: 后面的以此类推，最多4种，每种最多一组
        group_reward_item,

        %%: Windows 用户:
        %%: 装备奖励
        %%: equip1 第一种道具装备的名字
        %%: quality1 第一种奖励装备的品质
        %%: equipjob1 第一奖励装备的职业限定 1 2 4 8 分别对应 1234 这4个职业，可累加
        %%: 后面的以此类推，目前最多4种，每种只有1件
        %%: 以后可能会扩展
        group_reward_equip

 }).

-record(group_reward_itemCfg, {
        item1,
        item2,
        item3,
        item4,
        num1,
        num2,
        num3,
        num4
 }).

-record(group_reward_equipCfg, {
        equip1,
        quality1,
        equipjob1,
        equip2,
        quality2,
        equipjob2,
        equip3,
        quality3,
        equipjob3,
        equip4,
        quality4,
        equipjob4
 }).

-endif.