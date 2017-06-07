%% @author luowei
%% @doc @todo 技能效果公共函数.


-module(effect).
-author(luowei).

-include("gsInc.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	getTriEffIDList/2,
	skillEffect/3,
	getEffList/1,
	getSameIDList/3
]).

%%获取技能触发效果列表ID
-spec getTriEffIDList(SkillID, InterValTime) -> list() when
	SkillID :: uint(),
	InterValTime :: number().
getTriEffIDList(SkillID, InterValTime) ->
	case getCfg:getCfgPStack(cfg_skill, SkillID) of
		#skillCfg{effects = Effects} when erlang:is_list(Effects) ->
			Fun =
				fun(EffectID, Acc) ->
					if
						EffectID > 0->
							case getCfg:getCfgPStack(cfg_skill_effect, EffectID) of
								#skill_effectCfg{effectChance = EffChance} ->
									case isTrigger(EffChance, InterValTime) of
										true ->
											[EffectID | Acc];
										_ ->
											Acc
									end;
								_ ->
									Acc
							end;
						true ->
							Acc
					end
				end,
			lists:foldl(Fun, [], Effects);
		_ ->
			[]
	end.

%%分离攻击者和被攻击者技能效果列表
-spec skillEffect(HitList, EffIDList, IsMainTarget) -> list() when
	HitList :: list(),
	EffIDList :: list(),
	IsMainTarget :: boolean().
skillEffect(HitList, EffIDList, IsMainTarget) ->
	EffectList = getEffList(EffIDList),
	Fun = fun(#skill_effectCfg{effectcondition = Condition, effectTarget = ETarget} = Effect, [A, B]) ->
		if
			Condition =:= ?NoCondition ->
				joinEffectList(ETarget, A, B, IsMainTarget, Effect);
			Condition =:= ?DodageCondition ->
				case isSkillParryOrDodage(HitList) of
					true ->
						joinEffectList(ETarget, A, B, IsMainTarget, Effect);
					_ ->
						[A, B]
				end;
			Condition =:= ?CriticalCondition ->
				case isSkillCritical(HitList) of
					true ->
						joinEffectList(ETarget, A, B, IsMainTarget, Effect);
					_ ->
						[A, B]
				end;
			true ->
				[A, B]
		end
	      end,
	lists:foldl(Fun, [[], []], EffectList).

%%根据技能效果ID列表获取效果
-spec getEffList(EffIDList) -> list() when
	EffIDList :: list().
getEffList(EffIDList) ->
	lists:map(fun(Key) ->
		getCfg:getCfgPStack(cfg_skill_effect, Key)
	          end, EffIDList).

%% ====================================================================
%% Internal functions
%% ====================================================================

%%根据效果目标加入相应的效果列表
-spec joinEffectList(ETarget, AEffectList, BEffectList, IsMainTarget, Effect) -> list() when
	ETarget :: uint(),
	AEffectList :: list(),
	BEffectList :: list(),
	IsMainTarget :: boolean(),
	Effect :: #skill_effectCfg{}.
joinEffectList(?TargetToAll, AEffectList, BEffectList, _IsMainTarget, Effect) ->
	[AEffectList, [Effect | BEffectList]];
joinEffectList(?TargetToMyselfOne, AEffectList, BEffectList, _IsMainTarget, Effect) ->
	[[Effect | AEffectList], BEffectList];
joinEffectList(?TargetToMyselfMulti, AEffectList, BEffectList, _IsMainTarget, Effect) ->
	[[Effect | AEffectList], BEffectList];
joinEffectList(?TargetToMain, AEffectList, BEffectList, true, Effect) ->
	[AEffectList, [Effect | BEffectList]];
joinEffectList(?TargetToMain, AEffectList, BEffectList, false, _Effect) ->
	[AEffectList, BEffectList];
joinEffectList(?TargetToAssi, AEffectList, BEffectList, true, _Effect) ->
	[AEffectList, BEffectList];
joinEffectList(?TargetToAssi, AEffectList, BEffectList, false, Effect) ->
	[AEffectList, [Effect | BEffectList]];
joinEffectList(_ETarget, AEffectList, BEffectList, _IsMainTarget, _Effect) ->
	[AEffectList, BEffectList].

%%判断技能效果是否触发
-spec isTrigger(EffChance, InterValTime) -> boolean() when
	EffChance :: float(),
	InterValTime :: uint().
isTrigger(0, _InterValTime) ->
	false;
isTrigger(1, _InterValTime) ->
	true;
isTrigger(EffChance, _InterValTime) when EffChance > 0 andalso EffChance < 1 ->
	RandomNum = random:uniform(?PROBALITY_WEIGHT),
	if
		EffChance * ?PROBALITY_WEIGHT > RandomNum ->
			true;
		true ->
			false
	end;
isTrigger(EffChance, InterValTime) when EffChance > 1 ->
	EffChance1 = EffChance * InterValTime / 60000,
	if
		EffChance1 >= 1 ->
			true;
		true ->
			isTrigger(EffChance1, InterValTime)
	end;
isTrigger(_EffChance, _InterValTime) ->
	false.

%%判断技能是否暴击
-spec isSkillCritical(HitList) -> boolean() when
	HitList :: list().
isSkillCritical([]) ->
	false;
isSkillCritical([State | HitList]) ->
	if
		State =:= ?HitResultCritical ->
			true;
		State =:= ?HitResultCritical ->
			true;
		true ->
			isSkillCritical(HitList)
	end.

%%判断技能是否闪避和招架
-spec isSkillParryOrDodage(HitList) -> boolean() when
	HitList :: list().
isSkillParryOrDodage([]) ->
	false;
isSkillParryOrDodage([_State | _HitList]) ->
	false.
%%	if
%%		State =:= ?HitResultParry ->
%%			isSkillParryOrDodage(HitList);
%%		true ->
%%			case State =:= ?HitResultDodage of
%%				true ->
%%					isSkillParryOrDodage(HitList);
%%				_ ->
%%					true
%%			end
%%	end.

%%获取同ID的载体,怪物,宠物列表
-spec getSameIDList(ID, List, SameList) -> list() when
	ID :: uint(),
	List :: list(),
	SameList :: list().
getSameIDList(_ID, [], SameList) ->
	lists:reverse(SameList);
getSameIDList(ID, [{Code, NewID, Pid} | List], SameList) when ID =:= NewID ->
	getSameIDList(ID, List, [{Code, NewID, Pid} | SameList]);
getSameIDList(ID, [#recCallPet{pet_id = NewID} = CallPet | List], SameList) when ID =:= NewID ->
	getSameIDList(ID, List, [CallPet | SameList]);
getSameIDList(ID, [_ | List], SameList) ->
	getSameIDList(ID, List, SameList).
    
