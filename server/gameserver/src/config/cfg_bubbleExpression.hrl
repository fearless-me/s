%%: 声明
-ifndef(cfg_bubbleExpression).
-define(cfg_bubbleExpression, 1).

-record(bubbleExpressionCfg, {
        %%: 菡琦:
        %%: 气泡排序号,不得超过最大值
        %%: 预留：
        %%: 1-50气泡表情预留50个
        %%: 51-100动作表情
        id,

        %%: 李菡琦:
        %%: 表情类型
        %%: 1.气泡表情
        %%: 2.动作表情
        type,

        %%: 菡琦:
        %%: 气泡的名字
        name,

        %%: 李菡琦:
        %%: 动作表情显示的图标
        %%: 气泡表情不需要
        icon,

        %%: 菡琦:
        %%: 帧表情范围
        %%: [第一帧，最后一帧]
        expressionlist,

        %%: 李菡琦:
        %%: 表情是否循环播放
        %%: 1.循环
        %%: 2.非循环
        continueTime,

        %%: 李菡琦:
        %%: 初始是否锁定
        %%: 0.非锁定
        %%: 1.锁定（后期任务获得或购买）
        lock,

        %%: 李菡琦:
        %%: 点击锁定后的提示文字
        %%: 根据lock判断，锁定状态才给提示
        discription,

        %%: Luoch:
        %%: 是否是跳舞动作
        %%: 0 不是
        %%: 1 是
        action_dance

 }).

-endif.