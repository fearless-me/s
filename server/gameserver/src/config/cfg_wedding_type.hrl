%%: 声明
-ifndef(cfg_wedding_type).
-define(cfg_wedding_type, 1).

-record(wedding_typeCfg, {
        id,

        %%: 婚宴类型名字
        name,

        %%: 婚礼时长单位秒s
        wedding_time,

        %%: 界面显示时间
        show_time,

        %%: 婚礼描述
        describe,

        %%: 预约所需花费非绑钻石金额数
        order_cost,

        %%: 取消预约时返还预约金的百分比
        percent_if_cancel,

        %%: 建立婚姻关系前遇到服务器维护，需要返还预约金额的百分比
        percent_if_stop_before,

        %%: 建立婚姻关系后但婚礼尚未结束，遇到服务器维护，需要返还预约金额的百分比
        percent_if_stop_after,

        %%: 普通宾客人数上限
        ordinary_limit,

        %%: 好友宾客拓展人数
        friend_limit,

        %%: 邀请宾客冷却CD单位秒
        invite_CD,

        %%: 系统赠送烟花类型
        sys_firework_type,

        %%: 系统赠送鲜花类型
        %%: 特效名字
        sys_flower_type,

        %%: 系统赠送鲜花个数
        sys_flower_numb,

        %%: 系统赠送喜糖类型
        sys_candy_type,

        %%: 系统赠送喜糖个数
        sys_candy_numb,

        %%: 玩家可以使用的鲜花类型。
        %%: [消耗非绑定钻石数目，冷却CD(单位S)]
        user_flower_type,

        %%: 玩家可以使用的喜糖类型
        user_candy_type

 }).

-endif.