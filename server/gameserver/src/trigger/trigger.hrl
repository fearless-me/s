%%
-ifndef(Trigger_Hrl).
-define(Trigger_Hrl,1).

-include("gsInc.hrl").

%%----------------------------------------------------------------------------------------------------------------------------------------
%%以下是触发器record
%%----------------------------------------------------------------------------------------------------------------------------------------

-record(trigger,
		{
		 triggerId,										%%触发器Id
		 triggerType,									%%触发器类型
		 ownerType,										%%触发器拥有者类型
		 ownerId,										%%触发器拥有者Id
		 triggerCount,									%%触发次数
		 call_module,									%%触发函数模块
		 call_func										%%触发函数
		 }).

%%----------------------------------------------------------------------------------------------------------------------------------------
%%以下是触发器次数
%%----------------------------------------------------------------------------------------------------------------------------------------

-define(TriggerCount_Circulation,-1).					%%循环触发
-define(TriggerCount_Once,1).							%%默认触发一次

%%----------------------------------------------------------------------------------------------------------------------------------------
%%以下是触发器owner类型
%%----------------------------------------------------------------------------------------------------------------------------------------

-define(TriggerOwnerType_Player,1).						%%玩家触发器
-define(TriggerOwnerType_Map,2).						%%地图触发器
-define(TriggerOwnerType_NPC,3).						%%NPC触发器
-define(TriggerOwnerType_Monster,4).					%%Monster触发器
-define(TriggerOwnerType_Item,5).						%%物品触发器

-define(TriggerOwnerType_NotExists,-1).					%%触发器拥有者类型不存在

%%----------------------------------------------------------------------------------------------------------------------------------------
%%以下是触发器类型
%%----------------------------------------------------------------------------------------------------------------------------------------
%%EventParam为onTriggerEvent响应触发器事件函数传入的参数，每个触发器类型传入的参数不同
%%EventParam作为参数传入call_func,EventParam参数改动和增加触发器类型需修改trigger模块下triggeringCondition函数,ExtParm额外参数
%%------------------------------------------------------------------------------------------------------

%%玩家触发器类型
-define(TriggerPlayerType_OnLine,1).					%%玩家上线;{ExtParm}=EventParm	
-define(TriggerPlayerType_Life_Change,2).				%%玩家血量变化;{OldLife,NowLife,ExtParm}=EventParm
-define(TriggerPlayerType_Level_Change,3).				%%玩家等级变化;{OldLevel,NowLevel,ExtParm}=EventParm
-define(TriggerPlayerType_Dead,4).						%%玩家死亡;{SelfCode,AttackerType,AttackerCode,ExtParm}=EventParm
-define(TriggerPlayerType_OffLine,5).					%%玩家下线;{}=EventParm

-define(TriggerPlayerType_MaxCount,6).					%%玩家触发器类型数量，每加1个类型，这个值需加1

%%------------------------------------------------------------------------------------------------------

%%地图触发器类型
-define(TriggerMapType_Create,1).						%%地图创建;{MapDataId,ExtParm}=EventParm
-define(TriggerMapType_Destory,2).						%%地图销毁;{MapDataId,ExtParm}=EventParm

-define(TriggerMapType_MaxCount,3).						%%地图触发器类型数量，每加1个类型，这个值需加1

%%------------------------------------------------------------------------------------------------------

%%NPC触发器类型
-define(TriggerNPCType_Create,1).						%%NPC创建;{NPCDataId,ExtParm}=EventParm
-define(TriggerNPCType_Talk,2).							%%NPC对话;{NPCDataId,PlayerCode,ExtParm}=EventParm
-define(TriggerNPCType_GiveOutTask,3).					%%发放任务;{NPCDataId,TaskId,PlayerCode,ExtParm}=EventParm
-define(TriggerNPCType_GiveBackTask,4).					%%归还任务;{NPCDataId,TaskId,PlayerCode,ExtParm}=EventParm

-define(TriggerNPCType_MaxCount,5).						%%玩家触发器类型数量，每加1个类型，这个值需加1

%%------------------------------------------------------------------------------------------------------

%%Monster触发器
-define(TriggerMonsterType_Create,1).					%%Monster创建;{MonsterDataId,ExtParm}=EventParm
-define(TriggerMonsterType_BloodChange,2).				%%Monster血量变化;{MonsterDataId,OldLife,NowLife,AttackerType,AttackerCode,ExtParm}=EventParm
-define(TriggerMonsterType_Dead,3).						%%Monster死亡;{MonsterDataId,AttackerType,AttackerCode,ExtParm}=EventParm

-define(TriggerMonsterType_MaxCount,4).					%%Monster触发器类型数量，每加1个类型，这个值需加1

%%------------------------------------------------------------------------------------------------------

%%物品触发器
-define(TriggerItemType_Use,1).							%%物品使用;{ItemDataId,UseCount,EffectObjectType,EffectObjectCode,ExtParm}=EventParm
-define(TriggerItemType_Destory,2).						%%物品销毁;{ItemDataId,DestoryCount,ExtParm}=EventParm

-define(TriggerItemType_MaxCount,3).					%%物品触发器类型数量，每加1个类型，这个值需加1

%%------------------------------------------------------------------------------------------------------
	
%%注册主触发器结果
-define(RegisterTriggerSuccess,1).						%%注册触发器成功
-define(RegisterTriggerFail_OwnerNotExists,-1).			%%触发器拥有者不存在
-define(RegisterTriggerFail_OwnerTypeNotExists,-2).		%%触发器拥有者类型不存在
-define(RegisterTriggerFail_TriggerTypeNotxists,-3).	%%触发器类型不存在
-define(RegisterTriggerFail_Exists,-4).					%%触发器id已存在
-define(RegisterTriggerFail_CallFuncExists,-5).			%%触发函数已存在
-define(RegisterTriggerFail_UnKnow,-6).					%%未知错误


%%------------------------------------------------------------------------------------------------------

-endif.