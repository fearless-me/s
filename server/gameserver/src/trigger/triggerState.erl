%%
%% @author Administrator
%% @doc @todo Add description to triggerState.


-module(triggerState).

-include("trigger.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-compile(export_all).

%%触发器字典初始化
-spec triggerInit() -> ok.
triggerInit() ->
	triggerIdCountInit(),
	setTriggers( dict:new() ),
	ok.

%%初始化触发器ID计数,测试暂用
-spec triggerIdCountInit()-> OldVal when
		OldVal :: int() | undefined.
triggerIdCountInit()->
	put('TriggerIdCount',0).

%%获取化触发器ID计数,测试暂用
-spec getTriggerIdCount()-> OldVal when
		OldVal :: int() | undefined.
getTriggerIdCount()->
	get('TriggerIdCount').

%%生成触发器ID,暂时测试用的
-spec makeTriggerID() -> TriggerID when 	  
		  TriggerID :: uint().
makeTriggerID()->
	case getTriggerIdCount() > 16#FFFFFFFF of
		true->
			put('TriggerIdCount',1),
			1;
		false->
			put('TriggerIdCount',getTriggerIdCount() + 1),
			getTriggerIdCount()
	end.

%%储存触发器
-spec storeTrigger(Trigger) -> dict:dict() | undefined when
		  Trigger :: #trigger{}.
storeTrigger(Trigger)->
	OldTriggerDicts = 
		case getTriggers() of
			undefined-> dict:new();
			TriggerDicts->TriggerDicts
		end,
	NewTriggerDicts = dict:store(Trigger#trigger.triggerId, Trigger, OldTriggerDicts),
	setTriggers(NewTriggerDicts).

%%通过触发器ID 获取唯一触发器
-spec getTrigger(TriggerID) -> Trigger when 
		  TriggerID :: uint(),
		  Trigger :: #trigger{} | {}.
getTrigger(TriggerID) ->
	case getTriggers() of
		undefined->{};
		TriggerDicts->
			case dict:find(TriggerID,TriggerDicts) of
				{ok,V} ->
					V;
				_ ->
					{}
			end
	end.

%%通过触发器类型、触发器拥有者Id和触发器拥有者类型 获取这一类型的触发器
-spec getSameTypeTriggers(TriggerType,OwnerId,OwnerType) -> TriggerDict when 
		  TriggerType :: uint(),
		  OwnerId :: uint(),
		  OwnerType :: uint(),
		  TriggerDict :: dict:dict() | {}.
getSameTypeTriggers(TriggerType,OwnerId,OwnerType) ->
	case getTriggers() of
		undefined->{};
		TriggerDicts->
			Predicate = fun(_K, V) -> 
								(V#trigger.ownerId =:= OwnerId) andalso
								  (V#trigger.triggerType =:= TriggerType) andalso
									(V#trigger.ownerType =:= OwnerType) andalso 
										( (V#trigger.triggerCount =:= ?TriggerCount_Circulation) orelse (V#trigger.triggerCount>0) )
						end,
		 	TriggerDict = dict:filter(Predicate, TriggerDicts),
			case dict:size(TriggerDict) > 0 of
				true->TriggerDict;
				false->{}
			end
	end.

%%通过触发器ID减少触发次数,触发器次数为0，删除触发器
-spec reduceTriggerCountById(TriggerID) -> ok when 
		  TriggerID :: uint().
reduceTriggerCountById(TriggerID)->
	case getTrigger(TriggerID) of
		{}->ok;
		Trigger->	
			TriggerCount = Trigger#trigger.triggerCount,
			case TriggerCount > 0 of
				true->
					NewTriger = Trigger#trigger{triggerCount=TriggerCount - 1},
					case NewTriger#trigger.triggerCount =:= 0 of
						true->deleteTrigger(NewTriger#trigger.triggerId);
						false->
							Dict = getTriggers(),
							NewTriggerDicts = case dict:find( NewTriger#trigger.triggerId,  Dict) of
								                  {ok,_V} ->
									                  dict:store(NewTriger#trigger.triggerId, NewTriger, Dict);
								                  _ ->
									                  Dict
							                  end,
							setTriggers( NewTriggerDicts ),
							ok
					end;
				false->ok
			end
	end.

%%减少触发次数,触发器次数为0，删除触发器
-spec reduceTriggerCountByRecord(Trigger) -> ok when 
		  Trigger :: #trigger{}.
reduceTriggerCountByRecord(Trigger)->
	TriggerCount = Trigger#trigger.triggerCount,
	case TriggerCount > 0 of
		true->
			NewTriger = Trigger#trigger{triggerCount=TriggerCount - 1},
			case NewTriger#trigger.triggerCount =:= 0 of
				true->
					deleteTrigger(NewTriger#trigger.triggerId);
				false->
					Dict = getTriggers(),
					NewTriggerDicts = case dict:find( NewTriger#trigger.triggerId,  Dict) of
						                  {ok,_V} ->
							                  dict:store(NewTriger#trigger.triggerId, NewTriger, Dict);
						                  _ ->
							                  Dict
					                  end,
					setTriggers( NewTriggerDicts ),
					ok
			end;
		false->ok
	end.



%%通过触发器ID删除触发器
-spec deleteTrigger(TriggerID) -> ok when 
		  TriggerID :: uint().
deleteTrigger(TriggerID)->
	case getTriggers() of
		undefined ->
			ok;
		_->	
			NewTriggerDicts = dict:erase( TriggerID, getTriggers() ),
			setTriggers( NewTriggerDicts ),
			ok
	end.


%%通过触发器类型、触发器拥有者Id和触发器拥有者类型 删除触发器
-spec deleteTrigger(TriggerType,OwnerId,OwnerType) -> ok when 
		  TriggerType :: uint(),
		  OwnerId :: uint(),
		  OwnerType :: uint().
deleteTrigger(TriggerType,OwnerId,OwnerType)->
	case getTriggers() of
		undefined ->
			ok;
		TriggerDicts->
			Predicate = fun(_K, V) -> 
								(V#trigger.ownerId =/= OwnerId) andalso
								  (V#trigger.triggerType =/= TriggerType) andalso
									(V#trigger.ownerType =/= OwnerType)
						end,
		 	setTriggers( dict:filter(Predicate, TriggerDicts) ),
			ok
	end.


%%获取触发器字典
-spec getTriggers() -> TriggerDicts when 
		  TriggerDicts :: dict:dict() | undefined.
getTriggers() ->
	get('Triggers').

%%设置 触发器字典
-spec setTriggers(TriggerDicts) -> OldVal when 
		  TriggerDicts :: dict:dict(),
		  OldVal :: dict:dict() | undefined.
setTriggers(TriggerDicts) ->
	put('Triggers',TriggerDicts).


%% ====================================================================
%% Internal functions
%% ====================================================================


