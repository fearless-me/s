%%
%% @author Administrator
%% @doc @todo Add description to trigger.


-module(trigger).

-include("trigger.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([registerTriggerEvent/6,removeTriggerEventByTriggerId/1,removeTriggerEventByOwnerId/1,
		 removeTriggerEventByType/2,onTriggerEvent/2,onTriggerEvent/4,
		 test/0,testOnEvent/0,playerOnline/2,playerLifeChange/2,playerLifeChangeWork/2]).
-import(triggerState,[triggerInit/0,makeTriggerID/0,storeTrigger/1,getTrigger/1,getSameTypeTriggers/3,
					  deleteTrigger/1,deleteTrigger/3,getTriggers/0,setTriggers/1,
					  reduceTriggerCountById/1,reduceTriggerCountByRecord/1]).

%%------------------------------------------------------------------------------------------------------
%%测试用例
test()->
	triggerInit(),
	%%注册一个玩家上下触发器
	TriggerCount = 3,%%触发次数 
	ObjectId = 1,
	registerTriggerEvent(?TriggerPlayerType_OnLine,ObjectId,?TriggerOwnerType_Player,1,?MODULE,playerOnline),
	%%注册玩家血量变化，注册两个回调函数,循环触发
	registerTriggerEvent(?TriggerPlayerType_Life_Change,ObjectId,?TriggerOwnerType_Player,-1,?MODULE,playerLifeChange),
	registerTriggerEvent(?TriggerPlayerType_Life_Change,ObjectId,?TriggerOwnerType_Player,TriggerCount,?MODULE,playerLifeChangeWork),
	ok.

%%响应函数
testOnEvent()->
	onTriggerEvent(?TriggerPlayerType_OnLine,?TriggerOwnerType_Player,1,{1}),
	OldLife = 100,
	NowLife = 200,
	onTriggerEvent(?TriggerPlayerType_Life_Change,?TriggerOwnerType_Player,1,{OldLife,NowLife,1}).

%%回调函数
playerOnline(ObjectId,EventParam)->
	?DEBUG_OUT("playerCode:[~p] is online.Parm:[~p]",[ObjectId,EventParam]).
playerLifeChange(ObjectId,EventParam)->
	?DEBUG_OUT("playerCode:[~p] playerLifeChange.Parm:[~p]",[ObjectId,EventParam]).
playerLifeChangeWork(ObjectId,EventParam)->
	?DEBUG_OUT("playerCode:[~p] playerLifeChangeWork.Parm:[~p]",[ObjectId,EventParam]).
	
%%------------------------------------------------------------------------------------------------------
	
%%注册物件的触发器
%%TriggerType触发器类型，ObjectId触发器拥有者id，ObjectType触发器拥有者类型
%%CallModule回调模块，CallBackFunc回调函数名，Parama参数
-spec registerTriggerEvent( TriggerType,ObjectId,ObjectType,TriggerCount,CallModule,CallBackFunc ) -> uint() | 0 when
		  TriggerType :: uint(),
		  ObjectId :: uint(),
          ObjectType :: uint(),
          TriggerCount :: int(),
          CallModule :: atom(),
		  CallBackFunc :: atom().
registerTriggerEvent( TriggerType,ObjectId,ObjectType,TriggerCount,CallModule,CallBackFunc ) ->
	TriggerId = makeTriggerID(),
	case isCanRegisterTrigger(TriggerId,TriggerType,ObjectType,CallModule,CallBackFunc) of	%%判断是否能够注册触发器
		{false,FailReason}->	
			?ERROR_OUT("registerTriggerEvent failed Reason:[~p]",[FailReason]),
			0;
		{true,?RegisterTriggerSuccess}	->
			%%生成触发器
			Trigger = makeTrigger( TriggerId,TriggerType,ObjectId,ObjectType,TriggerCount,CallModule,CallBackFunc ),
			%%保存到 触发器字典中
			storeTrigger(Trigger),
			TriggerId
	end.


%%通过触发器id，响应触发器事件；EventParam根据不同触发器类型传入的参数不同
-spec onTriggerEvent(TriggerId,EventParam)-> ok when
		  	TriggerId :: uint(),
			EventParam	:: tuple().
onTriggerEvent(TriggerId,EventParam)->
	case getTrigger(TriggerId) of
		{}->ok;
		Trigger->
			case isCanTriggerEvent(Trigger,EventParam) of
				true->
					reduceTriggerCountByRecord(Trigger),%%内部做了判断是否是循环触发,如果触发次数为0，移除触发器
					Module = Trigger#trigger.call_module,
					CallBackFunc = Trigger#trigger.call_func,
					Module:CallBackFunc( Trigger#trigger.ownerId, EventParam );
				false->
					ok
			end
	end,
	ok.

%%通过触发器类型、拥有者id和拥有者类型，响应触发器事件;EventParam根据不同触发器类型传入的参数不同
-spec onTriggerEvent(TriggerType,ObjiectType,ObjectId,EventParam)-> ok when
		  	TriggerType :: uint(),
			ObjiectType :: uint(),
			ObjectId :: uint(),
			EventParam	:: tuple().
onTriggerEvent(TriggerType,ObjiectType,ObjectId,EventParam)->
	case getSameTypeTriggers(TriggerType,ObjectId,ObjiectType) of
		{}->ok;
		TriggerDicts->
			FunDelete = fun(_Key,Trigger,ok) ->
								 case isCanTriggerEvent(Trigger,EventParam) of
									true->
										reduceTriggerCountByRecord(Trigger),%%内部做了判断是否是循环触发,如果触发次数为0，移除触发器
										?DEBUG_OUT("Trigger#trigger.triggerCount [~p]",[Trigger#trigger.triggerCount]),
										Module = Trigger#trigger.call_module,
										CallBackFunc = Trigger#trigger.call_func,
										Module:CallBackFunc( Trigger#trigger.ownerId, EventParam ),
										ok;
									false->
										ok
								end
							end,
			dict:fold(FunDelete, ok, TriggerDicts)
	end,
	ok.


%%通过触发器id移除指定触发器
-spec removeTriggerEventByTriggerId( TriggerId ) -> ok when 
		  TriggerId :: uint().
removeTriggerEventByTriggerId( TriggerId ) ->
	deleteTrigger( TriggerId ),
	ok.

%%通过ownerId移除触发器
-spec removeTriggerEventByOwnerId( OwnerId ) -> ok when 
		  OwnerId :: uint().
removeTriggerEventByOwnerId( OwnerId ) ->
	case getTriggers() of
		undefined->ok;
		TriggerDicts->
			FunDelete = fun(_Key,Trigger,TDicts) ->
								 case Trigger#trigger.ownerId =:= OwnerId of
									 true->
										 deleteTrigger( Trigger#trigger.triggerId ),
										 getTriggers();
									 false->TDicts
								 end
							end,
			dict:fold(FunDelete, TriggerDicts, TriggerDicts)		 
	end,	
	ok.

%%通过type移除指定类型触发器
-spec removeTriggerEventByType( TriggerType,ObjectType ) -> ok when 
		  TriggerType :: uint(),
		  ObjectType :: uint().
removeTriggerEventByType( TriggerType,ObjectType ) ->
	case getTriggers() of
		undefined->ok;
		TriggerDicts->
			FunDelete = fun(_Key,Trigger,TDS) ->
								 case Trigger#trigger.triggerType =:= TriggerType andalso
										Trigger#trigger.ownerType =:= ObjectType	of
									 true->
										 deleteTrigger( Trigger#trigger.triggerId ),
										 getTriggers();
									 false->TDS
								 end
							end,
			dict:fold(FunDelete, TriggerDicts, TriggerDicts)		 
	end,	
	ok.



%% ====================================================================
%% Internal functions
%% ====================================================================

%%生成一个触发器
-spec makeTrigger( TriggerId,TriggerType,ObjectId,ObjectType,TriggerCount,CallModule,CallBackFunc ) -> 
		  #trigger{} when
		  TriggerId :: uint(),
		  TriggerType :: uint(),
		  ObjectId :: uint(),
          ObjectType :: uint(),
          TriggerCount :: int(),
          CallModule :: atom(),
		  CallBackFunc :: atom().
makeTrigger( TriggerId,TriggerType,ObjectId,ObjectType,TriggerCount,CallModule,CallBackFunc )->
	#trigger{
			triggerId = TriggerId,								%%触发器Id
		 	triggerType = TriggerType,							%%触发器类型
		 	ownerType = ObjectType,								%%触发器拥有者类型
		 	ownerId = ObjectId,									%%触发器拥有者Id
			triggerCount = TriggerCount,						%%触发次数
		 	call_module = CallModule,							%%触发函数模块
		 	call_func = CallBackFunc							%%触发函数
			}.

%%通过触发器id,CallModule,CallBackFunc判断判断触发器是否能够注册，成功返回{true,Success}，失败返回{false，Reason}
-spec isCanRegisterTrigger(TriggerId,TriggerType,ObjectType,CallModule,CallBackFunc) -> {true,Success} | {false,Reason}  when 
		  	TriggerId :: uint(),
			TriggerType :: uint(),
			ObjectType :: uint(),
			CallModule :: atom(),
			CallBackFunc :: atom(),
			Success :: uint(),
			Reason :: int().
isCanRegisterTrigger(TriggerId,TriggerType,ObjectType,CallModule,CallBackFunc) ->
	case getTrigger(TriggerId) of
		{}->
			case getRegisterTypeCountByOwnerType(ObjectType) of
				?TriggerOwnerType_NotExists->{false,?RegisterTriggerFail_OwnerTypeNotExists};	%%触发器拥有者类型不存在
				TriggerTypeCount->
					case TriggerType > 0 andalso TriggerType < TriggerTypeCount of
						true->
							case getTriggers() of
								undefined->{false,?RegisterTriggerFail_UnKnow}; %%触发器字典不存在，未知错误
								TriggerDicts->
									Predicate = fun(_K, V) -> 
														(V#trigger.call_module =:= CallModule) andalso
								  						(V#trigger.call_func =:= CallBackFunc) 
													end,
		 							TriggerDict = dict:filter(Predicate, TriggerDicts),
									case dict:size(TriggerDict) =:= 0 of
										true->{true,?RegisterTriggerSuccess};	%%成功，可注册
										false->{false,?RegisterTriggerFail_CallFuncExists}	%%触发函数已存在
									end
							end;
						false->{false,?RegisterTriggerFail_TriggerTypeNotxists} %%触发器类型不存在
					end
			end;
		_->
			{false,?RegisterTriggerFail_Exists}%%触发器已存在
	end.


%%判断触发器是否能够触发事件
-spec isCanTriggerEvent(Trigger,EventParam) -> boolean() when
		  Trigger :: #trigger{},
		  EventParam :: tuple().
isCanTriggerEvent(Trigger,EventParam) ->
	case ( Trigger#trigger.triggerCount > 0 ) orelse
			( Trigger#trigger.triggerCount =:= ?TriggerCount_Circulation )  of%%判断是否还有触发次数
		true->
			triggeringCondition(Trigger#trigger.ownerType,Trigger#trigger.triggerType,EventParam);%%判断是否满足触发条件		
		false->		
			%%没有触发次数了，移除触发器
			deleteTrigger(Trigger#trigger.triggerId),
			false
	end.
		
	
%%通过触发器拥有者类型返回触发器类型数量
-spec getRegisterTypeCountByOwnerType(OwnerType)-> int() when
		  OwnerType :: uint().
getRegisterTypeCountByOwnerType(OwnerType)->
	case OwnerType of
		?TriggerOwnerType_Player->
			?TriggerPlayerType_MaxCount;
		?TriggerOwnerType_Map->
			?TriggerMapType_MaxCount;
		?TriggerOwnerType_NPC->
			?TriggerNPCType_MaxCount;
		?TriggerOwnerType_Monster->
			?TriggerMonsterType_MaxCount;
		?TriggerOwnerType_Item->
			?TriggerItemType_MaxCount;
		_->?TriggerOwnerType_NotExists
	end.


%%触发条件判断,ExtParm额外参数
-spec triggeringCondition(OwnerType,TriggerType,EventParam)-> boolean() when
		  OwnerType :: uint(),
		  TriggerType :: uint(),
		  EventParam :: tuple().
triggeringCondition(OwnerType,TriggerType,EventParam)->
  	case OwnerType of
		?TriggerOwnerType_Player->
			triggeringConditionPlayer(TriggerType,EventParam);	
		?TriggerOwnerType_Map->
			triggeringConditionMap(TriggerType,EventParam);
		?TriggerOwnerType_NPC->
			triggeringConditionNPC(TriggerType,EventParam);
		?TriggerOwnerType_Monster->
			triggeringConditionMonster(TriggerType,EventParam);
		?TriggerOwnerType_Item->
			triggeringConditionItem(TriggerType,EventParam);
		%%未知
		_->
			?ERROR_OUT("triggeringCondition error.OwnerType:[~p],TriggerType:[~p],EventParam[~p] ",[OwnerType,TriggerType,EventParam]),
			false
	end.

%%玩家,触发条件判断,ExtParm额外参数
-spec triggeringConditionPlayer(TriggerType,EventParam)-> boolean() when
		  TriggerType :: uint(),
		  EventParam :: tuple().
triggeringConditionPlayer(TriggerType,EventParam)->
	case {TriggerType,EventParam} of
		{?TriggerPlayerType_OnLine,{_ExtParm}}->%%玩家上线;
			true;
		{?TriggerPlayerType_Life_Change,{OldLife,NowLife,_ExtParm}}->%%玩家血量变化;
			(OldLife=/=NowLife) andalso (OldLife>=0) andalso (NowLife>=0);
		{?TriggerPlayerType_Level_Change,{OldLevel,NowLevel,_ExtParm}}->%%玩家等级变化;
			(OldLevel=/=NowLevel) andalso (OldLevel>=0) andalso (NowLevel>=0);
		{?TriggerPlayerType_Dead,{SelfCode,AttackerType,AttackerCode,_ExtParm}}->%%玩家死亡;
			(SelfCode=/=AttackerCode) andalso (AttackerType>0) andalso (SelfCode>0) andalso (AttackerCode>0);
		{?TriggerPlayerType_OffLine,{}}-> %%玩家下线;
			true;
		_->
			%%未知
			?ERROR_OUT("triggeringConditionPlayer error.TriggerType:[~p],EventParam[~p] ",[TriggerType,EventParam]),
			false
	end.

%%地图,触发条件判断,ExtParm额外参数
-spec triggeringConditionMap(TriggerType,EventParam)-> boolean() when
		  TriggerType :: uint(),
		  EventParam :: tuple().
triggeringConditionMap(TriggerType,EventParam)->
	case {TriggerType,EventParam} of
		{?TriggerMapType_Create,{MapDataId,_ExtParm}}->%%地图创建;
			(MapDataId>0);
		{?TriggerMapType_Destory,{MapDataId,_ExtParm}}->%%地图销毁;
			(MapDataId>0);
		_->
			%%未知
			?ERROR_OUT("triggeringConditionMap error.TriggerType:[~p],EventParam[~p] ",[TriggerType,EventParam]),
			false
	end.

%%NPC,触发条件判断,ExtParm额外参数
-spec triggeringConditionNPC(TriggerType,EventParam)-> boolean() when
		  TriggerType :: uint(),
		  EventParam :: tuple().
triggeringConditionNPC(TriggerType,EventParam)->
	case {TriggerType,EventParam} of
		{?TriggerMonsterType_Create,{NPCDataId,_ExtParm}}->%%NPC创建;
			(NPCDataId>0);
		{?TriggerNPCType_Talk,{NPCDataId,PlayerCode,_ExtParm}}->%%NPC对话;
			(NPCDataId>0) andalso (PlayerCode>0);
		{?TriggerNPCType_GiveOutTask,{NPCDataId,TaskId,PlayerCode,_ExtParm}}->%%发放任务;
			(NPCDataId>0) andalso (TaskId>0) andalso (PlayerCode>0);
		{?TriggerNPCType_GiveBackTask,{NPCDataId,TaskId,PlayerCode,_ExtParm}}->%%归还任务;
			(NPCDataId>0) andalso (TaskId>0) andalso (PlayerCode>0);
		_->
			%%未知
			?ERROR_OUT("triggeringConditionNPC error.TriggerType:[~p],EventParam[~p] ",[TriggerType,EventParam]),
			false
	end.

%%Monster,触发条件判断,ExtParm额外参数
-spec triggeringConditionMonster(TriggerType,EventParam)-> boolean() when
		  TriggerType :: uint(),
		  EventParam :: tuple().
triggeringConditionMonster(TriggerType,EventParam)->
	case {TriggerType,EventParam} of
		{?TriggerMonsterType_Create,{MonsterDataId,_ExtParm}}->%%Monster创建;
			(MonsterDataId>0);
		{?TriggerMonsterType_BloodChange,{MonsterDataId,OldLife,NowLife,AttackerType,AttackerCode,_ExtParm}}->%%Monster血量变化;
			(MonsterDataId>0) andalso (OldLife=/=NowLife) andalso (OldLife>=0) andalso (NowLife>=0) 
				andalso (AttackerType>0) andalso (AttackerCode>0);
		{?TriggerMonsterType_Dead,{MonsterDataId,AttackerType,AttackerCode,_ExtParm}}->%%Monster死亡;
			(MonsterDataId>0) andalso (AttackerCode>0) andalso (AttackerType > 0);
		_->
			%%未知
			?ERROR_OUT("triggeringConditionMonster error.TriggerType:[~p],EventParam[~p] ",[TriggerType,EventParam]),
			false
	end.

%%Item,触发条件判断,ExtParm额外参数
-spec triggeringConditionItem(TriggerType,EventParam)-> boolean() when
		  TriggerType :: uint(),
		  EventParam :: tuple().
triggeringConditionItem(TriggerType,EventParam)->
	case {TriggerType,EventParam} of
		{?TriggerItemType_Use,{ItemDataId,UseCount,EffectObjectType,EffectObjectCode,_ExtParm}}->%%物品使用;
			(ItemDataId>0) andalso (UseCount>0) andalso (EffectObjectType>0) andalso (EffectObjectCode>0);
		{?TriggerItemType_Destory,{ItemDataId,DestoryCount,_ExtParm}}->%%物品销毁;
			(ItemDataId>0) andalso (DestoryCount>0);
		_->
			%%未知
			?ERROR_OUT("triggeringConditionItem error.OwnerType:[~p],TriggerType:[~p],EventParam[~p] ",[TriggerType,EventParam]),
			false
	end.

