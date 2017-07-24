%%: 声明
-ifndef(cfg_thirty_day_login_gift).
-define(cfg_thirty_day_login_gift, 1).

-record(thirty_day_login_giftCfg, {
        id,

        %%: 王轶俊:
        %%: 页签名称（同样用于显示在主界面的icon上）
        name,

        %%: 王轶俊:
        %%: 领取条件1表示等级，2表示登录时间
        type,

        %%: 王轶俊:
        %%: 具体表示多少级或多少天
        value,

        %%: 王轶俊:
        %%: 标题说明
        title,

        %%: 王轶俊:
        %%: 描述说明
        text,

        %%: 王轶俊:
        %%: 1为装备，2为时装，3为道具
        rewardstype,

        %%: 王轶俊:
        %%: 物品道具奖励id
        rewards,

        %%: admin:
        %%: 0装备
        %%: 1骑宠
        %%: 2NPC
        %%: 3时装
        %%: 4monster
        modelType,

        %%: 王轶俊:
        %%: 是否显示道具icon，是为1，否为2，是的话直接读取道具表icon
        display,

        %%: 王轶俊:
        %%: 页签图标资源id
        tabIcon,

        %%: 王轶俊:
        %%: 展示模型资源id
        model

 }).

-endif.