%%: 声明
-ifndef(cfg_home_zoofood).
-define(cfg_home_zoofood, 1).

-record(home_zoofoodCfg, {
        %%: 林凯强:
        %%: 喂食的道具id
        give_item_id,

        %%: 宠物返还的道具参数
        %%: [{道具id,min数量,max数量,产生该奖励的起始随机,产生该奖励的结束随机范围}]
        back_item,

        %%: 该食物宠物是否喜欢
        %%: 都喜欢填0，不喜欢的填宠物id
        pet_like,

        %%: admin:
        %%: 权重范围
        range

 }).

-endif.