%%任务模块
-author(caochunjiu).

-ifndef(Task_hrl).
-define(Task_hrl, 1).

-define(FirstTaskID, 1).

%%可接任务最大值
-define(TaskAcceptedMax, 50).
-define(TaskAcceptedSideMax, 30).
-define(LoopTaskAcceptNum, 10).    %%环任务每环最大接受任务数
-define(LoopTaskLindID, 1501).  %%环任务的UI操作任务ID
-define(GetTaskRewardSuccess, 1). %%领取环任务成功


%%任务职业
-define(TaskJob_None, 0).                 %无类型
-define(TaskJob_All, 1).                 %无职业限制
-define(TaskJob_Max, 2).

%%任务奖励类型
-define(TaskAward_None, 0).              %无类型
-define(TaskAward_Money, 1).              %金钱
-define(TaskAward_Exp, 2).              %经验
-define(TaskAward_Max, 3).

%% 任务主类型，对应cfg_task.type
-define(TaskMainType_Main, 1). % 主线
-define(TaskMainType_Side, 2). % 支线
-define(TaskMainType_EveryDay, 3). % 日常
-define(TaskMainType_Marriage, 4). % 情缘任务
-define(TaskMainType_Link, 5). % 引导任务

%%具体任务类型，对应策划配置的sub_type字段
%% type = 1 | 2 | 3 | 4
-define(TaskSubType_Monster, 1).        %杀怪
-define(TaskSubType_Talk, 2).        %对话
-define(TaskSubType_CollectItem, 3).          %任务采集物品
-define(TaskSubType_Drop, 4).    %掉落收集
-define(TaskSubType_UseItem, 5).    %使用物品
-define(TaskSubType_CopyMap, 6).    %副本任务
-define(TaskSubType_MiniCopy, 7).    %位面任务
-define(TaskSubType_Operation, 8).      %客户端、策划把这个叫这名字
-define(TaskSubType_CareerChang, 9).          %转职任务
-define(TaskSubType_Active, 10).          %活动任务
-define(TaskSubType_System, 11).          %系统任务
-define(TaskSubType_Convoy, 13).          %护送任务


%% 活动类型子任务ID与dailyInterface对应
%% 全部用拼音
-define(TaskSubType_Active_Sub_ShouHuNvShen, 1).
-define(TaskSubType_Active_Sub_ShouLingRuQing, 2).
-define(TaskSubType_Active_Sub_MiaoDaoTuan, 4).
-define(TaskSubType_Active_Sub_ShiJieShouHu, 5).
-define(TaskSubType_Active_Sub_YiJiXunLian, 9).
-define(TaskSubType_Active_Sub_NvShenJinBi, 13).
-define(TaskSubType_Active_Sub_JingJiChang, 16).
-define(TaskSubType_Active_Sub_YeWaiShouLing, 16).
-define(TaskSubType_Active_Sub_ShenHong, 21).
-define(TaskSubType_Active_Sub_LuanShi, 28).
-define(TaskSubType_Active_Sub_GangKou, 29).
-define(TaskSubType_Active_Sub_LuoLi, 30).
-define(TaskSubType_Active_Sub_YuanSu, 31).
-define(TaskSubType_Active_Sub_XueRen, 33).
-define(TaskSubType_Active_Sub_HunDun, 34).
-define(TaskSubType_Active_Sub_YueHui, 35).
-define(TaskSubType_Active_Sub_QiChongLingDi, 36).


%%
%%:    1 装备精炼:    2 装备升星:    3 器灵:    4 翅膀 :    5 纹章
%%:    6 女神:    7 合成:    8 好友:    9 家族:    10 时装:    11 骑宠升星
-define(TaskSubType_System_Sub_EquipRedefine, 1).
-define(TaskSubType_System_Sub_EquipStar, 2).
-define(TaskSubType_System_Sub_GodWeapon, 3).
-define(TaskSubType_System_Sub_Wing, 4).
-define(TaskSubType_System_Sub_Gem, 5).
-define(TaskSubType_System_Sub_Goddess, 6).
-define(TaskSubType_System_Sub_Tinker, 7).
-define(TaskSubType_System_Sub_Friend, 8).
-define(TaskSubType_System_Sub_Guild, 9).
-define(TaskSubType_System_Sub_Fashion, 10).
-define(TaskSubType_System_Sub_PetStar, 11).




%% 任务 log
-define(TaskLogAccept, 1). %%接受任务
-define(TaskLogCancel, 2). %%放弃任务
-define(TaskLogSubmit, 3). %%完成任务

%% 特殊奖励
-define(TaskReward_SPT_Buff,				1).		%% buff
-define(TaskReward_SPT_Liveness,			2).		%% 女神好感度
-define(TaskReward_SPT_MarriageCloseness,	3).		%% 亲密度奖励
-define(TaskReward_SPT_GuildResource,		4).		%% 家族资金奖励
-define(TaskReward_SPT_GuildLiveness,		5).		%% 家族活跃奖励

-endif.
