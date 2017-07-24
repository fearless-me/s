%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 九月 2017 16:09
%%%-------------------------------------------------------------------
-module(monsterEventTrigger).
-author("mawenhong").

-include("monsterPrivate.hrl").

-define(TriggerEventType_Skill, 1).
-define(TriggerEventType_Buff, 2).


%% API
-export([
	triggerEvent/3,
	monsterTrigger/1
]).

%%
triggerEvent(EventID, MonsterCode, Params) ->
	try
		triggerEvent1(EventID, MonsterCode, Params)
	catch
		_ : Error ->
			?ERROR_OUT("triggerEvent(~p, ~p, ~p), error=~p,~p",
				[EventID, MonsterCode, Params, Error, erlang:get_stacktrace()])
	end,
	ok.

%%
triggerEvent1(EventID, MonsterCode, Params) ->
	MonsterID = monsterState:getId(MonsterCode),
	#monsterCfg{triggermonster = L} = getCfg:getCfgByArgs(cfg_monster, MonsterID),
	doTriggerEvent(L, EventID, MonsterCode, Params),
	ok.

%%%-------------------------------------------------------------------
doTriggerEvent(undefined, _EventID, _MonsterCode, _Params) ->
	ok;
doTriggerEvent([], _EventID, _MonsterCode, _Params) ->
	ok;
doTriggerEvent(
	[E = {EventID, _EventParam, _TargetMonsterID, _EventType, _EventTypeParam} | Left]
	, EventID
	, MonsterCode
	, Params
) ->
	doEvent(EventID, E, MonsterCode, Params),
	doTriggerEvent(Left, EventID, MonsterCode, Params);
doTriggerEvent(_Any, _EventID, _MonsterCode, _Params) ->
	ok.
%%%-------------------------------------------------------------------
doEvent(
	?MonsterTriggerE_Hp
	, {_EventID, EventParam, TargetMonsterID, EventType, EventTypeParam}
	, MonsterCode
	, _Params
) ->
	MonsterEts = monsterState:getMapMonsterEts(MonsterCode),
	MonsterList = getObjByID(MonsterEts, TargetMonsterID),
	CurHp = monsterState:getCurHp(MonsterCode),
	MaxHp = monsterState:getMaxHp(MonsterCode),
	HpPer = skill:getPercent(CurHp, MaxHp),
	MonsterID = monsterState:getId(MonsterCode),
	lists:foreach(
		fun(#recMapObject{code = ObjCode, id = ObjID, hp = ObjHp, maxHp = ObjMaxHp, pid = ObjPid}) ->
			ObjHpPer = skill:getPercent(ObjHp, ObjMaxHp),
			HpPerDiff = abs(HpPer - ObjHpPer),
			case HpPerDiff >= EventParam of
				true ->
					psMgr:sendMsg2PS(
						ObjPid
						, monsterTrigger
						, {MonsterCode, MonsterID, ObjCode, ObjID, EventType, EventTypeParam}
					);
				_ ->
					skip
			end
		end, MonsterList),
	ok;
doEvent(
	?MonsterTriggerE_Dead
	, {_EventID, _EventParam, TargetMonsterID, EventType, EventTypeParam}
	, MonsterCode
	, _Params
) ->
	MonsterEts = monsterState:getMapMonsterEts(MonsterCode),
	MonsterList = getObjByID(MonsterEts, TargetMonsterID),
	MonsterID = monsterState:getId(MonsterCode),
	lists:foreach(
		fun(#recMapObject{code = ObjCode, id = ObjID, pid = ObjPid}) ->
			catch erlang:send_after(
				EventTypeParam * 1000
				, ObjPid
				, {monsterDelayTrigger, {MonsterCode, MonsterID, ObjCode, ObjID, EventType, EventTypeParam}}
			)
		end, MonsterList),
	ok.

%%%-------------------------------------------------------------------
monsterTrigger({_SrcCode, _SrcID, MonsterCode, _MonsterID, EventType, EventTypeParam})->
	case canExeTrigger(MonsterCode) of
		true ->
			exeTrigger(EventType, MonsterCode, EventTypeParam);
		_ ->
			skip
	end,
	ok.

%%%-------------------------------------------------------------------
exeTrigger(?TriggerEventType_Buff, MonsterCode, BuffID)->
	Level = monsterState:getLevel(MonsterCode),
	monsterBuff:addBuff(MonsterCode, BuffID, Level),
	ok;
exeTrigger(?TriggerEventType_Skill, MonsterCode, SkillID)->
	SN = monsterState:getAttackSN(MonsterCode),
	monsterState:setAttackSN(MonsterCode, SN + 1),
	TargetCode = monsterState:getAttackTarget(MonsterCode),
	Level = monsterState:getLevel(MonsterCode),
	monsterSkill:addTempSkill(MonsterCode, SkillID, Level),
	monsterSkill:useSkill(MonsterCode, SkillID, SN, TargetCode, true),
	monsterSkill:delTempSkill(MonsterCode, SkillID),
	ok;
exeTrigger(_Any, _MonsterCode, _Param)->
	ok.

%%%-------------------------------------------------------------------
canExeTrigger(MonsterCode)->
	case monsterState:getActionStatus(MonsterCode) of
		?CreatureActionStatusDead ->
			false;
		undefined ->
			false;
		_ ->
			true
	end.

%%%-------------------------------------------------------------------
getObjByID(Ets, DataID) ->
	MatchSpec = ets:fun2ms(fun(R) when R#recMapObject.id =:= DataID -> R end),
	myEts:selectEts(Ets, MatchSpec).




