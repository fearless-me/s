%%任务模块
-author(caochunjiu).

-ifndef(Task_hrl).
-define(Task_hrl,1).

-define(FirstTaskID, 1).

%%可接任务最大值
-define(TaskAcceptedMax, 10).
-define(LoopTaskAcceptNum, 10).	%%环任务每环最大接受任务数
-define(LoopTaskLindID, 4001).  %%环任务的UI操作任务ID
-define(GetTaskRewardSuccess, 1). %%领取环任务成功


%%任务职业
-define(TaskJob_None, 0).                 %无类型
-define(TaskJob_All,  1).                 %无职业限制
-define(TaskJob_Max,  2).

%%任务奖励类型
-define(TaskAward_None,  0).              %无类型
-define(TaskAward_Money, 1).              %金钱
-define(TaskAward_Exp,   2).              %经验
-define(TaskAward_Max,   3).

%% 任务主类型，对应cfg_task.type
-define(TaskMainType_Main,    1). % 主线
-define(TaskMainType_EveryDay,      2). % 日常
-define(TaskMainType_Marriage,  3). % 情缘任务
-define(TaskMainType_Link,  4). % 引导任务

%%具体任务类型，对应策划配置的sub_type字段
-define(TaskType_Link, 0).		  %UI操作任务
-define(TaskType_Monster,     1).        %杀怪
-define(TaskType_Talk,        2).        %对话
-define(TaskType_CollectItem, 3).    	  %任务采集物品
-define(TaskType_Drop,        4).        %掉落收集
-define(TaskType_UseItem,     5).        %使用物品
-define(TaskType_CopyMap,	  6).		  %副本任务
-define(TaskType_MiniCopy,	  7).		  %位面任务
-define(TaskType_Operation,   8).           %客户端、策划把这个叫这名字
-define(TaskType_Active,	  9).		  %活动任务
-define(TaskType_CareerChang, 10).		  %转职任务

%% 任务 log
-define(TaskLogAccept, 1). %%接受任务
-define(TaskLogCancel, 2). %%放弃任务
-define(TaskLogSubmit, 3). %%完成任务

%% 特殊奖励
-define(TaskReward_SPT_Buff, 1).    %buff
-define(TaskReward_SPT_Livenes, 2).%女神好感度

-endif.
