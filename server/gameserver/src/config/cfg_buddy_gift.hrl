%%: 声明
-ifndef(cfg_buddy_gift).
-define(cfg_buddy_gift, 1).

-record(buddy_giftCfg, {
        id,

        %%: 宝箱图片路径
        pic,

        %%: 队伍总活跃度值
        active_team,

        %%: 队员达到多少贡献邮寄相应的物品，每档只邮寄最高
        mate_gift,

        %%: 队长达到多少贡献邮寄相应的物品，每档只邮寄最高
        leader_gift,

        %%: admin:
        %%: 队员获得道具item
        mate1,

        mate1_num,

        mate2,

        mate2_num,

        mate3,

        mate3_num,

        mate4,

        mate4_num,

        mate5,

        mate5_num,

        %%: admin:
        %%: 队员获得道具item
        mate6,

        mate6_num,

        mate7,

        mate7_num,

        mate8,

        mate8_num,

        mate9,

        mate9_num,

        mate10,

        mate10_num,

        %%: 队长获取道具item1
        leader1,

        %%: 队长第一个道具的数量
        leader1_num,

        leader2,

        leader2_num,

        leader3,

        leader3_num,

        leader4,

        leader4_num,

        leader5,

        leader5_num

 }).

-endif.