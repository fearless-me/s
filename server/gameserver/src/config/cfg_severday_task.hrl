%%: 声明
-ifndef(cfg_severday_task).
-define(cfg_severday_task, 1).

-record(severday_taskCfg, {
        %%: id
        id,

        %%: 天数
        %%: 第几天
        type,

        %%: 1=装备精炼
        %%: 2=骑宠远征战斗
        %%: 3=每日必做活跃度
        %%: 4=竞技场战斗
        %%: 5=副本通关
        %%: 6=宝石合成
        %%: 7=商城钻石消费
        %%: 8=骑宠领地掠夺
        %%: 9=骑宠技能洗练
        %%: 10=装备冲星
        %%: 11=装备重铸
        %%: 12=每日环任务完成
        %%: 13=提升海神之戟
        %%: 14=军团技能学习
        %%: 15=勇者试炼
        %%: 16=军团单人副本 16,8（maptype 1,8）
        %%: [类型，参数]
        events,

        %%: 作者:
        %%: 界面跳转
        %%: [20,153]前值代表副本在mainMenu中取ID值，后值代表对应的副本在mapsetting取ID，可定位到副本界面的副本标签上
        %%: [22,3]前值代表活动在mainMenu取ID值，后值代表对应的活动标签在DailyInterface取ID，可定位到副本界面的副本标签上
        relation_UI,

        %%: 客户端显示成就条件
        show,

        %%: 任务次数
        task_num,

        %%: 可领取道具
        item1,

        %%: 道具数量
        num1,

        item2,

        num2

 }).

-endif.