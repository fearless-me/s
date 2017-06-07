%%: 声明
-ifndef(cfg_dailyActive).
-define(cfg_dailyActive, 1).

-record(dailyActiveCfg, {
        %%: 作者:
        %%: 事件ID
        iD,

        %%: 客户端排序
        sort,

        %%: 作者:
        %%: 事件名称，显示到客户端
        name,

        %%: 作者:
        %%: 事件类型：
        %%: 1代表副本
        %%: 2代表活动
        type,

        %%: 作者:
        %%: 子类型ID
        %%: tape为1时，子类型填写1-3,通过mapsetting获得subtype地图类型编号
        %%: 0普通副本
        %%: 6英雄副本
        %%: 9挑战副本
        %%: tape为2时，通过DailyInterface中的ID来获取对应活动
        subType,

        %%: 作者:
        %%: 单次事件的女神好感度奖励
        activeReward,

        %%: user:
        %%: 单次事件活跃度
        activeDegree,

        %%: 作者:
        %%: 每日可完成事件的次数上限
        limit,

        %%: 作者:
        %%: 界面跳转
        %%: [20,153]前值代表副本在mainMenu中取ID值，后值代表对应的副本在mapsetting取ID，可定位到副本界面的副本标签上
        %%: [22,3]前值代表活动在mainMenu取ID值，后值代表对应的活动标签在DailyInterface取ID，可定位到副本界面的副本标签上
        relation_UI,

        %%: 作者:
        %%: 事件完成判断条件
        %%: 0代表完成
        %%: 1代表进入
        completeCondition,

        %%: 作者:
        %%: 客户端该活动主要产出显示
        itemshow

 }).

-endif.