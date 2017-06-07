%%
%% @author zhongyunawei
%% @doc @todo Add description to monsterSkill.


-module(monsterSkill).
-author(zhongyuanwei).

-include("monsterPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initPetSkill/3,
	initMonsterSkill/3,
	useSkill/4,
	tickSkill/3,
	breakUseSkill/1,
	onUsePetSkill/6,

	addTempSkill/3,
	delTempSkill/2
]).

%%触发技能
-export([
	deadTriggerSkill/2,
	attackTriggerSkill/5,
	releaseTriggerSkill/2,
	assistTriggerSkill/2,
	noAttackTriggerSkill/3,
	addTriggerSkill/3,
	delTriggerSkill/2
]).

%%调用技能
-export([
	addBuffCallSkill/3,
	delBuffCallSkill/2
]).

-export([
	canUseSkill/2
]).

%% ====================================================================
%% init creature skill
%% ====================================================================
%%初始化宠物技能
-spec initPetSkill(Code :: uint(), PetID :: uint(), SkillList :: list()) -> ok.
initPetSkill(Code, PetID, SkillList) ->
	%%初始化基础技能
	case getCfg:getCfgPStack(cfg_pet, PetID) of
		#petCfg{
			addSkill = AddSkill,
			baseSkill = SkillList1,
			talentSkill2 = TalenetSkill
		} ->
			case AddSkill of
				undefined ->
					initSkillList(Code, SkillList1, 1);
				_ ->
					initSkillList(Code, SkillList1 ++ AddSkill, 1)
			end,
			case TalenetSkill of
				undefined ->
					skip;
				_ ->
					initSkillList(Code, TalenetSkill, 1)
			end;
		_ ->
			?ERROR_OUT("Cannot found pet id in cfg")
	end,
	%%初始化额外技能
	Fun = fun(#recPetSkill{
		skill_id = SkillID,
		skill_cd = CD,
		skill_level = Level
	}) ->
		addSkill(Code, SkillID, Level),
		CDList = monsterState:getPetSkillCD(Code),
		NewCDList = [{SkillID, CD} | CDList],
		monsterState:setPetSkillCD(Code, NewCDList)
	      end,
	lists:foreach(Fun, SkillList).

%%初始化怪物技能
-spec initMonsterSkill(Code :: uint(), MonsterID :: uint(), Level :: uint()) -> ok.
initMonsterSkill(Code, MonsterID, Level) ->
	case getCfg:getCfgPStack(cfg_monster, MonsterID) of
		#monsterCfg{
			monsterSkill = SkillList,
			monsterExSkill = ExSkillList
		} ->
			NewSkillList = getExSkillList(ExSkillList) ++ SkillList,
			initSkillList(Code, NewSkillList, Level);
		_ ->
			?ERROR_OUT("Cannot found monster id [~p] in cfg", [MonsterID])
	end.

%%攻击目标和被攻击触发技能
-spec attackTriggerSkill(Code, Skill, HitList, TargetCode, TriType) -> ok when
	Code :: uint(),
	Skill :: uint(),
	HitList :: list(),
	TargetCode :: uint(),
	TriType :: uint().
attackTriggerSkill(Code, SkillID, HitList, TargetCode, TriType) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case lists:member(Type, ?TriggerSkill) of
		true ->
			ok;
		_ ->
			SkillList = getTriSkillList(Code, SkillID, TriType),
			#skillCfg{skillType = SkillType, aggressivity = AttackType} = getCfg:getCfgPStack(cfg_skill, SkillID),
			attackTriggerSkill(Code, SkillList, HitList, TargetCode, SkillType, AttackType)
	end.

attackTriggerSkill(Code, SkillList, HitList, TargetCode, SkillType, AttackType) ->
	BitAType = skill:getAttackTypeBit(AttackType),
	AttackTime = monsterState:getAttackIntervalTime(Code),
	Fun = fun(#recSkill{skillID = SkillID, level = SkillLevel}) ->
		#skillCfg{misc = Misc,
			triggerAggressi = Aggress,
			triggercondition = Cond,
			triggerChance = TriggerChance} = getCfg:getCfgPStack(cfg_skill, SkillID),
		%%触发概率跟技能等级相关
		TriggerChance1 = case TriggerChance of
			                 undefined ->
				                 [0, 0];
			                 _ ->
				                 TriggerChance
		                 end,
		[Chance, LevelAdd] = TriggerChance1,
		NewChance = erlang:float(Chance + LevelAdd * (SkillLevel - 1)),
		Flag0 = skill:isTriggerBySkillType(SkillType, Misc),
		Flag1 =
			case Flag0 of
				true ->
					skill:isTriggerByAttackType(BitAType, Aggress);
				_ ->
					Flag0
			end,
		Flag2 =
			case Flag1 of
				true ->
					skill:isTriggerByPossible(NewChance, AttackTime);
				_ ->
					Flag1
			end,
		Flag3 =
			case Flag2 of
				true ->
					skill:isTriggerByAttackResult(Cond, HitList);
				_ ->
					Flag2
			end,
		case Flag3 of
			true ->
				NewCode = skill:getTriSkillCode(SkillID, TargetCode),
				noticeUseTriggerSkill(Code, SkillID, NewCode);
			_ ->
				skip
		end
	      end,
	lists:foreach(Fun, SkillList).

%%非攻击触发技能
-spec noAttackTriggerSkill(Code, SkillID, TargetCode) -> ok when
	Code :: uint(),
	SkillID :: uint() | list(),
	TargetCode :: uint().
noAttackTriggerSkill(Code, SkillID, TargetCode) when is_integer(SkillID) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case lists:member(Type, ?TriggerSkill) of
		true ->
			ok;
		_ ->
			SkillList = getTriSkillList(Code, SkillID, ?NoAttackTriggerSkill),
			noAttackTriggerSkill(Code, SkillList, TargetCode)
	end;
noAttackTriggerSkill(Code, SkillList, TargetCode) when is_list(SkillList) ->
	AttackTime = monsterState:getAttackIntervalTime(Code),
	Fun = fun(#recSkill{skillID = SkillID, level = SkillLevel}) ->
		#skillCfg{triggerChance = TriggerChance} = getCfg:getCfgPStack(cfg_skill, SkillID),
		%%触发概率跟技能等级相关
		TriggerChance1 = case TriggerChance of
			                 undefined ->
				                 [0, 0];
			                 _ ->
				                 TriggerChance
		                 end,
		[Chance, LevelAdd] = TriggerChance1,
		NewChance = erlang:float(Chance + LevelAdd * (SkillLevel - 1)),
		case skill:isTriggerByPossible(NewChance, AttackTime) of
			true ->
				Code = skill:getTriSkillCode(SkillID, TargetCode),
				noticeUseTriggerSkill(Code, SkillID, Code);
			_ ->
				skip
		end
	      end,
	lists:foreach(Fun, SkillList).

%%释放技能触发
-spec releaseTriggerSkill(Code, SkillID) -> ok when
	Code :: uint(),
	SkillID :: uint() | list().
releaseTriggerSkill(Code, SkillID) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case lists:member(Type, ?TriggerSkill) of
		true ->
			ok;
		_ ->
			SkillList = getTriSkillList(Code, SkillID, ?ReleaseTriggerSkill),
			#skillCfg{skillType = SkillType, aggressivity = AttackType} = getCfg:getCfgPStack(cfg_skill, SkillID),
			releaseTriggerSkill(Code, SkillList, AttackType, SkillType)
	end.

releaseTriggerSkill(Code, SkillList, AttackType, SkillType) ->
	BitAType = skill:getAttackTypeBit(AttackType),
	AttackTime = monsterState:getAttackIntervalTime(Code),
	Fun = fun(#recSkill{skillID = SkillID, level = SkillLevel}) ->
		#skillCfg{misc = Misc,
			triggerAggressi = Aggress,
			triggerChance = TriggerChance} = getCfg:getCfgPStack(cfg_skill, SkillID),
		%%触发概率跟技能等级相关
		TriggerChance1 = case TriggerChance of
			                 undefined ->
				                 [0, 0];
			                 _ ->
				                 TriggerChance
		                 end,
		[Chance, LevelAdd] = TriggerChance1,
		NewChance = erlang:float(Chance + LevelAdd * (SkillLevel - 1)),
		Flag0 = skill:isTriggerBySkillType(SkillType, Misc),
		Flag1 =
			case Flag0 of
				true ->
					skill:isTriggerByAttackType(BitAType, Aggress);
				_ ->
					Flag0
			end,
		Flag2 =
			case Flag1 of
				true ->
					skill:isTriggerByPossible(NewChance, AttackTime);
				_ ->
					Flag1
			end,
		case Flag2 of
			true ->
				NewCode = skill:getTriSkillCode(SkillID, 0),
				noticeUseTriggerSkill(Code, SkillID, NewCode);
			_ ->
				skip
		end
	      end,
	lists:foreach(Fun, SkillList).

%%死亡技能触发
-spec deadTriggerSkill(Code, Skill) -> ok when
	Code :: uint(),
	Skill :: uint() | list().
deadTriggerSkill(Code, SkillID) when is_integer(SkillID) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case lists:member(Type, ?TriggerSkill) of
		true ->
			ok;
		_ ->
			SkillList = getTriSkillList(Code, SkillID, ?DeadTriggerSkill),
			deadTriggerSkill(Code, SkillList)
	end;
deadTriggerSkill(Code, SkillList) when is_list(SkillList) ->
	AttackTime = monsterState:getAttackIntervalTime(Code),
	Fun = fun(#recSkill{skillID = SkillID, level = SkillLevel}) ->
		#skillCfg{triggerChance = TriggerChance} = getCfg:getCfgPStack(cfg_skill, SkillID),
		%%触发概率跟技能等级相关
		TriggerChance1 = case TriggerChance of
			                 undefined ->
				                 [0, 0];
			                 _ ->
				                 TriggerChance
		                 end,
		[Chance, LevelAdd] = TriggerChance1,
		NewChance = erlang:float(Chance + LevelAdd * (SkillLevel - 1)),
		case skill:isTriggerByPossible(NewChance, AttackTime) of
			true ->
				noticeUseTriggerSkill(Code, SkillID, 0);
			_ ->
				skip
		end
	      end,
	lists:foreach(Fun, SkillList);
deadTriggerSkill(_, _) ->
	ok.

%%击杀目标或者协助击杀触发
-spec assistTriggerSkill(Code, Skill) -> ok when
	Code :: uint(),
	Skill :: uint() | list().
assistTriggerSkill(Code, SkillID) when is_integer(SkillID) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case lists:member(Type, ?TriggerSkill) of
		true ->
			ok;
		_ ->
			SkillList = getTriSkillList(Code, SkillID, ?AssistTriggerSkill),
			assistTriggerSkill(Code, SkillList)
	end;
assistTriggerSkill(Code, SkillList) when is_list(SkillList) ->
	AttackTime = monsterState:getAttackIntervalTime(Code),
	Fun = fun(#recSlotSkill{skillID = SkillID}) ->
		#skillCfg{triggerChance = TriggerChance} = getCfg:getCfgPStack(cfg_skill, SkillID),
		%%触发概率跟技能等级相关
		TriggerChance1 = case TriggerChance of
			                 undefined ->
				                 [0, 0];
			                 _ ->
				                 TriggerChance
		                 end,
		[Chance, LevelAdd] = TriggerChance1,
		SkillList1 = monsterState:getMonsterSkill(Code),
		#recSkill{level = SkillLevel} = lists:keyfind(SkillID, #recSkill.skillID, SkillList1),
		NewChance = erlang:float(Chance + LevelAdd * (SkillLevel - 1)),
		case skill:isTriggerByPossible(NewChance, AttackTime) of
			true ->
				noticeUseTriggerSkill(Code, SkillID, 0);
			_ ->
				skip
		end
	      end,
	lists:foreach(Fun, SkillList);
assistTriggerSkill(_, _) ->
	ok.

%%宠物使用技能
-spec onUsePetSkill(PetCode, SkillID, CodeList, SN, X, Y) -> ok when
	PetCode :: uint(),
	SkillID :: uint(),
	CodeList :: list(),
	SN :: uint(),
	X :: float(),
	Y :: float().
onUsePetSkill(PetCode, SkillID, CodeList, SN, X, Y) ->
	IsTriSkill = skill:isTriggerSkill(SkillID),
	CurSkill = monsterState:getCurUseSkill(PetCode),
	onUsePetSkill(PetCode, SkillID, CodeList, SN, X, Y, IsTriSkill, CurSkill).

%%引导技能和吟唱技能
onUsePetSkill(PetCode, SkillID, CodeList, SN, X, Y, false,
	#recCurUseSkill{
		skillID = SkillID,
		serial = Serial,
		usedCount = Count,
		mainCode = MainCode,
		triggerTime = TT
	}) when Serial =:= SN ->
	NowTime = time:getUTCNowMS(),
	#skillCfg{targetSearch = SearchType, durationTimes = Dura} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case isCanAttack(SearchType, CodeList, SkillID, PetCode) of
		{Code, CodeList} when Code =:= MainCode ->
			if
				Dura =< Count ->
					breakUseSkill(PetCode, true);
				NowTime + 100 < TT -> %%增加一点施法容错
					skip;
				true ->
					FilterCodeList = getFilterResList(PetCode, SkillID, MainCode, CodeList, X, Y),
					castSkill(PetCode, SkillID, FilterCodeList, MainCode, Count, SN),
					case Count + 1 =:= Dura of
						true ->
							breakUseSkill(PetCode);
						_ ->
							skip
					end,
					true
			end;
		_ ->
			breakUseSkill(PetCode)
	end;
%%正常使用技能
onUsePetSkill(PetCode, SkillID, CodeList, SN, X, Y, IsTriSkill, _CurSkill) ->
	case IsTriSkill of
		true ->
			Res = canUseSkill0(PetCode, SkillID);
		_ ->
			Res = canUseSkill(PetCode, SkillID)
	end,
	onUsePetSkill1(PetCode, SkillID, CodeList, SN, X, Y, Res).

onUsePetSkill1(PetCode, SkillID, _CodeList, _SN, _X, _Y, skip) ->
	delTriggerSkill(PetCode, SkillID);
onUsePetSkill1(PetCode, SkillID, CodeList, SN, X, Y, true) ->
	#skillCfg{targetSearch = SearchType} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case isCanAttack(SearchType, CodeList, SkillID, PetCode) of
		{MainCode, CodeList} ->
			FilterCodeList = getFilterResList(PetCode, SkillID, MainCode, CodeList, X, Y),
			useSkillAttack1(PetCode, SkillID, FilterCodeList, MainCode, SN, X, Y),
			true;
		_Error ->
			skip
	end;
onUsePetSkill1(_PetCode, _SkillID, _CodeList, _SN, _X, _Y, _Res) ->
	skip.


%%使用技能
-spec useSkill(Code :: uint(), SkillID :: uint(), SN :: uint(), TargetCode :: uint()) -> ok.
useSkill(Code, 0, _SN, _) ->
	?ERROR_OUT("mosnter id : [~p]", [monsterState:getId(Code)]),
	ok;
useSkill(_Code, _SkillID, _SN, undefined) ->
	ok;
useSkill(Code, SkillID, SN, TargetCode) ->
	Now = time:getUTCNowMS(),
	LUST = monsterState:getStartUseSkillTime(Code),
	FAIT = monsterState:getFinalAttackIntervalTime(Code),
	%MonID = monsterState:getId(Code),
	case Now - LUST >= FAIT + 100 of
		true ->
			#skillCfg{
				ranger = SkillRanger,
				skillType = SkillType,
				skillCoolDown = SkillCD
			} = getCfg:getCfgPStack(cfg_skill, SkillID),
			PlayerEts = monsterState:getMapPlayerEts(Code),
			MonsterEts = monsterState:getMapMonsterEts(Code),
			PetEts = monsterState:getMapPetEts(Code),
			Target = skill:getTargetByCode(
				[
					PlayerEts,
					MonsterEts,
					PetEts
				],
				Code,
				TargetCode,
				SkillRanger
			),
			case Target of
				#recMapObject{} ->
					%%在追击的时候，需要追到攻击范围内的位置才停止移动
					CodeType = monsterState:getCodeType(Code),
					if
						CodeType =:= ?SpawnMonster orelse CodeType =:= ?SpawnMonster ->
							case monsterState:getActionStatus(Code) =:= ?CreatureActionStatusMove of
								true ->
									monsterMove:stopMove(Code, true);
								_ ->
									skip
							end;
						true ->
							skip
					end,
					%%检查是否为主动技能
					case checkUseSkillIsActive(SkillType) of
						true ->
							useSkillAttack(Code, SkillID, SN, Target, Now, SkillCD);
						_ ->
							throw("Error Skill Type")
					end;
				_ ->
					case Target of
						?ErrorCode_UseSkillErrorTargetDist ->
							monsterAI:setAIEvent(Code, ?BSTCondVar_IsInAttackRange, 0);
						?ErrorCode_UseSkillErrorNoTarget ->
							case monsterState:getHateList(Code) of
								[] ->
									?DEBUG_OUT("monster [~p] leave battle", [Code]),
									monsterBattle:leaveBattle(Code);
								L ->
									monsterState:setHateList(Code, lists:keydelete(TargetCode, #recHate.hateCode, L)),
									monsterState:setAttackTarget(Code, undefined),
									mapWildBoss:updateWildBossCode(Code)
							end;
						_ ->
							monsterState:setAttackTarget(Code, undefined),
							mapWildBoss:updateWildBossCode(Code)
					end
			end;
		_ ->
			skip
	end,
	ok.

-spec tickSkill(Type, Now, Code) -> ok when
	Type :: uint(),
	Now :: uint(),
	Code :: uint().
tickSkill(?SpawnPet, _, _) ->
	ok;
tickSkill(?SpawnCallPet, _, _) ->
	okl;
tickSkill(_, Now, Code) ->
	tickGlobalCD(Code, Now),
	tickCastSkill(Code, Now),
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================

-spec getExSkillList(ExSkillList) -> list() when
	ExSkillList :: list().
getExSkillList(undefined) ->
	[];
getExSkillList(ExSkillList) ->
	Fun = fun({SkillID, _, _, _, _, _}, Acc) ->
		[SkillID | Acc]
	      end,
	lists:foldl(Fun, [], ExSkillList).

-spec initSkillList(Code, SkillList, Level) -> ok when
	Code :: uint(),
	SkillList :: list(),
	Level :: uint().
initSkillList(Code, SkillList, Level) when erlang:is_list(SkillList) ->
	Fun = fun(SkillID) ->
		addSkill(Code, SkillID, Level)
	      end,
	lists:foreach(Fun, SkillList).

-spec addSkill(Code, SkillID, Level) -> ok when
	Code :: uint(),
	SkillID :: uint(),
	Level :: uint().
addSkill(_Code, 0, _) ->
	ok;
addSkill(Code, SkillID, Level) ->
	case getCfg:getCfgPStack(cfg_skill, SkillID) of
		#skillCfg{
			%skillEx = Ex,
			maxLevel = MaxLevel,
			damFactor = DamFactor,
			aggressivity = Aggre,
			baseLevel = BaseLevel
			%skillType = SkillType
		} ->
			Skill = #recSkill{skillID = SkillID,
				level = BaseLevel},
			NewLevel = judgeLevel(Level, MaxLevel),
			Skill1 = setLevel(Code, Skill, NewLevel),
			Damage = #recDamage{
				magicDamage = monsterState:getBattlePropTotal(Code, ?Prop_MagicAttack),
				physDamage = monsterState:getBattlePropTotal(Code, ?Prop_PhysicalAttack)
			},
			case Aggre =:= 0 of
				true ->
					{_, Skill2} = skill:calcUserSkillTreat(Skill1, Damage);
				_ ->
					IntervalTime = monsterState:getAttackIntervalTime(Code),
					FactorValue = monsterState:getBattlePropTotal(Code, DamFactor),
					Prop_master = 0,%% monsterState:getBattlePropTotal(Code, ?Prop_master),
					{_, Skill2} = skill:calcUserSkillDamage(Skill1, Damage, FactorValue, Prop_master, IntervalTime)
			end,
			SkillList = monsterState:getMonsterSkill(Code),
			monsterState:setMonsterSkill(Code, [Skill2 | SkillList]);
		%%addPassSkill(Code, SkillID, NewLevel, SkillType, Ex, TargetSearch);
		_ ->
			?ERROR_OUT("Error skill[~p],can not found it", [SkillID])
	end,
	ok.

%%增加buff调用技能
-spec addBuffCallSkill(Code, SkillID, Level) -> ok when
	Code :: uint(),
	SkillID :: uint(),
	Level :: uint().
addBuffCallSkill(_Code, 0, _) ->
	ok;
addBuffCallSkill(Code, SkillID, Level) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	addBuffCallSkill(Type, Code, SkillID, Level).
addBuffCallSkill(?BuffCallSkill, Code, SkillID, Level) ->
	addTempSkill(Code, SkillID, Level);
%%调用技能
addBuffCallSkill(_, _, _, _) ->
	ok.

%%删除buff调用技能
-spec delBuffCallSkill(Code, SkillID) -> ok when
	Code :: uint(),
	SkillID :: uint().
delBuffCallSkill(_Code, 0) ->
	ok;
delBuffCallSkill(Code, SkillID) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	delBuffCallSkill(Type, Code, SkillID).

delBuffCallSkill(?BuffCallSkill, Code, SkillID) ->
	delTempSkill(Code, SkillID);
delBuffCallSkill(_, _, _) ->
	ok.

%%增加触发技能
-spec addTriggerSkill(Code, SkillID, Level) -> ok when
	Code :: uint(),
	SkillID :: uint(),
	Level :: uint().
addTriggerSkill(_Code, 0, _) ->
	ok;
addTriggerSkill(Code, SkillID, Level) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	Flag = lists:member(Type, ?TriggerSkill),
	addTriggerSkill(Flag, SkillID, Code, Level).
addTriggerSkill(true, SkillID, Code, Level) ->
	addTempSkill(Code, SkillID, Level);
addTriggerSkill(_, _, _, _) ->
	ok.

%%删除触发技能
-spec delTriggerSkill(Code, SkillID) -> ok when
	Code :: uint(),
	SkillID :: uint().
delTriggerSkill(_Code, 0) ->
	ok;
delTriggerSkill(Code, SkillID) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	Flag = lists:member(Type, ?TriggerSkill),
	delTriggerSkill(Flag, SkillID, Code).
delTriggerSkill(true, SkillID, Code) ->
	delTempSkill(Code, SkillID);
delTriggerSkill(_, _, _) ->
	ok.


%%增加战斗中或者装备获取的临时技能
-spec addTempSkill(Code, SkillID, Level) -> ok when
	Code :: uint(),
	SkillID :: uint(),
	Level :: uint().
addTempSkill(_Code, 0, _Level) ->
	ok;
addTempSkill(Code, SkillID, Level) ->
	SkillList = monsterState:getMonsterSkill(Code),
	Skill = #recSkill{
		skillID = SkillID,
		level = 1,
		damagePlus = 0,
		damageMultiply = 1,
		damage = 0
	},
	NewSkill = setLevel(Code, Skill, Level),
	NewSkilList = lists:keystore(SkillID, #recSkill.skillID, SkillList, NewSkill),
	monsterState:setMonsterSkill(Code, NewSkilList).

%%删除战斗中或者装备获取的临时技能
-spec delTempSkill(Code, SkillID) -> ok when
	Code :: uint(),
	SkillID :: uint().
delTempSkill(Code, SkillID) ->
	SkillList = monsterState:getMonsterSkill(Code),
	NewSkillList = lists:keydelete(SkillID, #recSkill.skillID, SkillList),
	monsterState:setMonsterSkill(Code, NewSkillList).

%%%增加被动技能
%-spec addPassSkill(Code, SkillID, Level, SkillType, Ex, TargetSearch) -> ok when
%	Code :: uint(),
%	SkillID :: uint(),
%	Level :: uint(),
%	SkillType :: uint(),
%	Ex :: list() | undefined,
%	TargetSearch :: uint().
%addPassSkill(Code, SkillID, Level, ?PassivitySkill, undefined, TargetSearch) -> %%被动技能
%	case TargetSearch of
%		?SingleSkillMyMaster ->
%			monsterInterface:addMasterPassEffect(SkillID, Level);
%		?SingleSkillMy ->
%			monsterEffect:addPassEffect(Code, SkillID, Level);
%		_ ->
%			skip
%	end;
%addPassSkill(_Code, _SkillID, _Level, _, _, _) ->
%	ok.

%%校正部分技能等级
-spec judgeLevel(Level, MaxLevel) -> uint() when
	Level :: uint(),
	MaxLevel :: uint().
judgeLevel(Level, MaxLevel) when Level > MaxLevel ->
	MaxLevel;
judgeLevel(Level, _MaxLevel) ->
	Level.

%%tick公共CD的时间
-spec tickGlobalCD(Code, Now) -> ok when
	Code :: uint(),
	Now :: uint().
tickGlobalCD(Code, Now) ->
	GlobalCDTime = monsterState:getGlobalCDEndTime(Code),
	tickGlobalCD(Code, Now, GlobalCDTime),
	ok.
tickGlobalCD(Code, Now, GlobalCDTime) when Now >= GlobalCDTime ->
	monsterAI:setAIEvent(Code, ?BSTCondVar_IsAttackCD, 0);
tickGlobalCD(_, _, _) ->
	ok.


%%tick引导和吟唱技能
-spec tickCastSkill(Code, NowTime) -> ok when
	Code :: uint(),
	NowTime :: uint().
tickCastSkill(Code, NowTime) ->
	CurSkill = monsterState:getCurUseSkill(Code),
	tickCastSkill(Code, NowTime, CurSkill).
tickCastSkill(Code, NowTime, #recCurUseSkill{
	skillID = SkillID,
	serial = SN,
	usedCount = Count,
	targetCode = Target,
	triggerTime = TT
}) ->
	#skillCfg{durationTimes = Dura, afterCast = AfterCast} = getCfg:getCfgPStack(cfg_skill, SkillID),
	if
		Dura =< Count ->
			if
				AfterCast =:= 0 ->
					monsterAI:setAIEvent(Code, ?BSTCondVar_IsCast, 0),
					monsterState:setCurUseSkill(Code, undefined);
				true ->
					case monsterState:getAfterCastTime(Code) of
						undefined ->
							monsterState:setAfterCastTime(Code, NowTime);
						EndTime ->
							case NowTime - EndTime >= AfterCast of
								true ->
									monsterAI:setAIEvent(Code, ?BSTCondVar_IsCast, 0),
									monsterState:setCurUseSkill(Code, undefined);
								_ ->
									skip
							end
					end
			end;
		NowTime < TT ->
			skip;
		true ->
			castSkill1(Code, SkillID, Target, Count, SN)
	end,
	ok;
tickCastSkill(_Code, _NowTime, _Other) ->
	ok.

castSkill1(Code, SkillID, Target, Count, SN) ->
	ActStatus = monsterState:getActionStatus(Code),
	castSkill1(Code, SkillID, Target, SN, Count, ActStatus).
castSkill1(Code, _SkillID, _Target, _SN, _Count, ?CreatureActionStatusDead) ->
	breakUseSkill(Code);
castSkill1(Code, SkillID, Target, SN, Count, _) ->
	#skillCfg{aoe = Aoe, aggressivity = Aggress} = getCfg:getCfgPStack(cfg_skill, SkillID),
	IsAttack = (Aggress =/= 0),
	PlayerEts = monsterState:getMapPlayerEts(Code),
	MonsterEts = monsterState:getMapMonsterEts(Code),
	PetEts = monsterState:getMapPetEts(Code),
	Pos = monsterState:getMonsterPos(Code),
	MyTeam = monsterState:getTeamInfo(Code),
	KillList = getCasterKillList(Code),
	Self = mapView:getMapObjectFromEts(Code, {PlayerEts, MonsterEts, PetEts}),
	NewTarget = mapView:getMapObjectFromEts(Target#recMapObject.code, {PlayerEts, MonsterEts, PetEts}),
	case Aoe of
		0 ->
			case camp:filterTarget(SkillID, MyTeam, KillList, Self, [NewTarget]) of
				[] ->
					breakUseSkill(Code);
				List ->
					useSkill2(Code, SkillID, SN, IsAttack, List),
					AttackTime = monsterState:getAttackIntervalTime(Code),
					BattlePropList = monsterState:getBattleProp(Code),
					AttackSpeed = 0, %% battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_attackspeed),
					setCurSkill(Code, SkillID, SN, Count + 1, Target, 0, AttackTime, AttackSpeed)
			end;
		_ ->
			FaceDir = monsterState:getBossFacePos(Code),
			TargetList =
				try
					skill:getAOETarget(Code, Pos, FaceDir, PlayerEts, MonsterEts, PetEts, SkillID, Target, MyTeam, KillList)
				catch
					_:_Why ->
						?ERROR_OUT("castSkill1 Code[~p] Pos [~p] FaceDir [~p] Use Skill [~p] Target is [~p], y=~p,stack=~p",
							[Code, Pos, FaceDir, SkillID, Target, _Why, erlang:get_stacktrace()]),
						[]
				end,
			useSkill2(Code, SkillID, SN, IsAttack, TargetList),
			AttackTime = monsterState:getAttackIntervalTime(Code),
			BattlePropList = monsterState:getBattleProp(Code),
			AttackSpeed = 0, %% battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_attackspeed),
			setCurSkill(Code, SkillID, SN, Count + 1, Target, 0, AttackTime, AttackSpeed)
	end.

%% 引导型或者吟唱型技能的释放，如果没有目标则打断施法
-spec castSkill(Code :: uint(), SkillID :: uint(), CodeList :: list(), MainCode :: uint(), Count :: uint(), SN :: uint()) -> ok.
castSkill(Code, SkillID, CodeList, MainCode, Count, SN) ->
	ActStatus = monsterState:getActionStatus(Code),
	castSkill(Code, SkillID, CodeList, MainCode, SN, Count, ActStatus).

castSkill(Code, _SkillID, _CodeList, _MainCode, _SN, _Count, ?CreatureActionStatusDead) ->
	breakUseSkill(Code, true);
castSkill(Code, SkillID, CodeList, MainCode, SN, Count, _) ->
	SkillCfg = getCfg:getCfgPStack(cfg_skill, SkillID),
	IsAttack = (SkillCfg#skillCfg.aggressivity =/= 0),
	Fun = fun(Code1, Acc) ->
		case getObject(Code, Code1) of
			#recMapObject{} = Object ->
				[Object | Acc];
			_ ->
				Acc
		end
	      end,
	TargetList = lists:foldl(Fun, [], CodeList),
	useSkill2(Code, SkillID, SN, IsAttack, TargetList),
	AttackTime = monsterState:getAttackIntervalTime(Code),
	BattlePropList = monsterState:getBattleProp(Code),
	AttackSpeed = 0, %% battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_attackspeed),
	setCurSkill(Code, SkillID, SN, Count + 1, CodeList, MainCode, AttackTime, AttackSpeed).

%%中断当前使用的技能
-spec breakUseSkill(Code) -> ok when
	Code :: uint().
breakUseSkill(Code) ->
	CurSkill = monsterState:getCurUseSkill(Code),
	breakUseSkill(Code, CurSkill).
breakUseSkill(Code, #recCurUseSkill{skillID = SkillID, serial = SN}) ->
	PlayerEts = monsterState:getMapPlayerEts(Code),
	Msg = #pk_GS2U_BreakSkill{userCode = Code,
		skillId = SkillID,
		serial = SN},
	{X, Y} = monsterState:getMonsterPos(Code),
	mapView:sendMsg2NearPlayerByPos(monsterState:getMapPid(Code), PlayerEts, Msg, X, Y, monsterState:getGroupID(Code)),
	monsterAI:setAIEvent(Code, ?BSTCondVar_IsCast, 0),
	monsterState:setCurUseSkill(Code, undefined),
	ok;
breakUseSkill(_, _) ->
	ok.

useSkillAttack(Code, SkillID, SN, #recMapObject{} = Target, Now, SkillCD) ->
	monsterAI:setAIEvent(Code, ?BSTCondVar_IsInAttackRange, 1),
	Skill = getCfg:getCfgPStack(cfg_skill, SkillID),
	case checkUseSkillState(Code, Skill#skillCfg.weaponNeed, Skill#skillCfg.use_Spec) of
		true ->
			monsterState:setCurUseSkillEffect(Code, []),
			useSkill1(Code, SN, SkillID, Target),
			%%设置开始使用技能的时间
			monsterState:setStartUseSkillTime(Code, Now),
			%%设定CD
			setSkillCD(Code, SkillID, Now + SkillCD);
		_ ->
			skip
	end,
	ok.

useSkillAttack1(PetCode, SkillID, CodeList, MainCode, SN, X, Y) ->
	#skillCfg{
		aggressivity = Aggress
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	IsAttack = (Aggress =/= 0),
	%%如果为触发技能,需要清除
	delTriggerSkill(PetCode, SkillID),
	monsterState:setMonsterPos(PetCode, X, Y),
	monsterState:setCurUseSkillEffect(PetCode, []),
	%%设置CD
	setSkillCD(PetCode, SkillID),
	Fun = fun(Code, Acc) ->
		case getObject(PetCode, Code) of
			#recMapObject{} = Object ->
				[Object | Acc];
			_ ->
				Acc
		end
	      end,
	TargetList = lists:foldl(Fun, [], CodeList),
	useSkill1(PetCode, SkillID, SN, IsAttack, MainCode, TargetList).
%------------------------------------------
%使用技能校验
%------------------------------------------
setSkillCD(Code, SkillID) ->
	Time = time:getUTCNowMSDiff2010(),
	#skillCfg{
		skillCoolDown = SCD,
		skill_GlobeCoolDown = GCD
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	%%设置自身CD
	SCDList = monsterState:getPetSkillCD(Code),
	case lists:keyfind(SkillID, 1, SCDList) of
		false ->
			NSCDList = [{SkillID, Time + SCD} | SCDList];
		_ ->
			NSCDList = lists:keyreplace(SkillID, 1, SCDList, {SkillID, Time + SCD})
	end,
	monsterState:setPetSkillCD(Code, NSCDList),
	%%检测这个技能是否触发全局CD
	if
		GCD =:= 0 ->
			AIT0 = monsterState:getAttackIntervalTime(Code),
			AttackSpeed = 0, %% monsterState:getBattlePropTotal(Code, ?Prop_attackspeed),
			%%计算减少后的公共CD时间
			AIT = AIT0 / (1 + AttackSpeed),
			monsterState:setPetGlobalCD(Code, Time + AIT);
		GCD > 0 ->
			monsterState:setPetGlobalCD(Code, GCD);
		true ->
			skip
	end.


setSkillCD(Code, SkillID, Time) ->
	#skillCfg{skill_GlobeCoolDown = GlobaeCoolDown} = getCfg:getCfgPStack(cfg_skill, SkillID),
	GlobalCD = calcGlobalCD(GlobaeCoolDown, Code),
	Now = time:getUTCNowMS(),
	monsterState:setGlobalCDEndTime(Code, GlobalCD + Now),

	monsterAI:setAIEvent(Code, ?BSTCondVar_IsAttackCD, 1),
	L = monsterState:getMonsterSkillCDList(Code),
	NL = lists:keystore(SkillID, 1, L, {SkillID, Time}),
	monsterState:setMonsterSkillCDList(Code, NL).

%%设置当前技能
-spec setCurSkill(Code, SkillID, SN, Count, Target, MainCode, AttackTime, AttackSpeed) -> ok when
	Code :: uint(),
	SkillID :: skillId(),
	SN :: uint(),
	Count :: uint(),
	Target :: #recMapObject{},
	MainCode :: uint(),
	AttackTime :: uint(),
	AttackSpeed :: number().
setCurSkill(Code, SkillID, SN, Count, Target, MainCode, AttackTime, AttackSpeed) ->
	#skillCfg{castFactor = CastFactor} = getCfg:getCfgPStack(cfg_skill, SkillID),
	TT = skill:getTriggerTime(SkillID, AttackTime, AttackSpeed, CastFactor),
	CurSkill = #recCurUseSkill{
		mainCode = MainCode,
		skillID = SkillID,
		serial = SN,
		usedCount = Count,
		targetCode = Target,
		triggerTime = TT
	},
	monsterAI:setAIEvent(Code, ?BSTCondVar_IsCast, 1),
	monsterState:setCurUseSkill(Code, CurSkill),
	ok.

%% -1不会触发和被触发公共冷却
%% 0正常触发和被触发公共冷却，角色公共冷却来自武器的攻击间隔，怪物，宠物，npc来自基础表中的设定
%% 填写大于0的其它值，为配置的公共冷却，毫秒
%% 吟唱和引导技能开始进行时就开始公共冷却
-spec calcGlobalCD(CoolDown, Code) -> uint() when
	CoolDown :: int(),
	Code :: uint().
calcGlobalCD(-1, _Code) ->
	0;
calcGlobalCD(0, Code) ->
	monsterState:getFinalAttackIntervalTime(Code);
calcGlobalCD(GlobeCoolDown, _Code) when erlang:is_integer(GlobeCoolDown) andalso GlobeCoolDown > 0 ->
	GlobeCoolDown;
calcGlobalCD(_, _) ->
	0.

-spec useSkill1(Code, SN, SkillID, Target) -> ok when
	Code :: uint(),
	SN :: uint(),
	SkillID :: uint(),
	Target :: #recMapObject{}.
useSkill1(Code, SN, SkillID, Target) ->
	#skillCfg{aoe = Aoe, aggressivity = Aggress} = getCfg:getCfgPStack(cfg_skill, SkillID),
	IsAttack = (Aggress =/= 0),
	case Aoe of
		0 ->
			useSkill1(Code, SkillID, SN, IsAttack, Target, [Target]);
		_ ->
			useAOESkill(Code, SkillID, SN, IsAttack, Target)
	end,
	ok.

-spec useSkill1(Code, SkillID, SN, IsAttack, TargetCode, TargetList) -> ok when
	Code :: uint(),
	SkillID :: uint(),
	SN :: uint(),
	TargetCode :: term(),
	TargetList :: list(),
	IsAttack :: boolean().
useSkill1(Code, SkillID, SN, IsAttack, Target, TargetList) ->
	AttackTime = monsterState:getAttackIntervalTime(Code),
	BattlePropList = monsterState:getBattleProp(Code),
	AttackSpeed = 0, %% battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_attackspeed),
	%%广播给周围，使用技能
	Fun = fun(Target1) ->
		Target1#recMapObject.code
	      end,
	TargetCodeList = lists:map(Fun, TargetList),
	broadcastUseSkill(Code, SkillID, SN, TargetCodeList),
	%%如果为瞬发技能或者是第二种引导技能（引导开始即释放伤害）则直接计算伤害,
	%%否则只保留状态，后面施法结束时计算伤害
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	IsTrigger = lists:member(Type, ?TriggerSkill),
	case Type =:= ?InstantSkill orelse IsTrigger =:= true orelse Type =:= ?CarrierSkill orelse Type =:= ?BuffCallSkill of
		true ->
			useSkill2(Code, SkillID, SN, IsAttack, TargetList);
		_ ->
			case skill:is2ndGuideSkill(SkillID) of
				true ->
					useSkill2(Code, SkillID, SN, IsAttack, TargetList),
					setCurSkill(Code, SkillID, SN, 0, Target, Target, AttackTime, AttackSpeed);
				_ ->
					setCurSkill(Code, SkillID, SN, 0, Target, Target, AttackTime, AttackSpeed)
			end
	end.

%%使用技能
-spec useSkill2(Code, SkillID, SN, IsAttack, TargetList) -> ok when
	Code :: uint(), SkillID :: uint(), SN :: uint(), TargetList :: list(), IsAttack :: boolean().
useSkill2(Code, SkillID, SN, IsAttack, TargetList) ->
	IsCarrier = isCarrier(Code),
	SkillList = monsterState:getMonsterSkill(Code),
	Skill = lists:keyfind(SkillID, #recSkill.skillID, SkillList),
	Damage = #recDamage{magicDamage = monsterState:getBattlePropTotal(Code, ?Prop_MagicAttack),
		physDamage = monsterState:getBattlePropTotal(Code, ?Prop_PhysicalAttack)},
	useSkill3(IsAttack, Code, SN, SkillID, Skill, Damage, TargetList, SkillList, IsCarrier),
	ok.

-spec useSkill3(IsAttack, Code, SN, SkillID, Skill, Damage, TargetList, SkillList, IsCarrier) -> ok when
	Code :: uint(),
	IsAttack :: boolean(),
	SN :: uint(),
	SkillID :: uint(),
	Skill :: #recSkill{},
	Damage :: #recDamage{},
	TargetList :: list(),
	SkillList :: list(),
	IsCarrier :: false | #recCasterInfo{}.
useSkill3(true, Code, SN, SkillID, Skill, Damage, TargetList, SkillList, IsCarrier) ->
	#skillCfg{misc = Misc, durationTimes = Times, damFactor = DamFactor} = getCfg:getCfgPStack(cfg_skill, SkillID),
	IntervalTime = monsterState:getAttackIntervalTime(Code),
	FactorValue = monsterState:getBattlePropTotal(Code, DamFactor),
	Prop_master = 0,%% monsterState:getBattlePropTotal(Code, ?Prop_master),
	{true, Skill1} = skill:calcUserSkillDamage(Skill, Damage, FactorValue, Prop_master, IntervalTime),
	NewSkillList = lists:keyreplace(SkillID, #recSkill.skillID, SkillList, Skill1),
	monsterState:setMonsterSkill(Code, NewSkillList),
	NewList = skill:clacAttackTargetNum(Misc, Times, TargetList),
	monsterBattle:attack(Code, Skill1, SN, NewList, IsCarrier);
useSkill3(_, Code, SN, SkillID, Skill, Damage, TargetList, SkillList, IsCarrier) ->
	{true, Skill1} = skill:calcUserSkillTreat(Skill, Damage),
	NewSkillList = lists:keyreplace(SkillID, #recSkill.skillID, SkillList, Skill1),
	monsterState:setMonsterSkill(Code, NewSkillList),
	monsterBattle:treat(Code, Skill1, SN, TargetList, IsCarrier).

%%广播当前使用的技能
-spec broadcastUseSkill(Code, SkillID, SN, TargetCodeList) -> ok when
	Code :: uint(), SkillID :: uint(), SN :: uint(), TargetCodeList :: list().
broadcastUseSkill(Code, SkillID, SN, TargetCodeList) ->
	#skillCfg{castFactor = CastFactor} = getCfg:getCfgPStack(cfg_skill, SkillID),
	PlayerEts = monsterState:getMapPlayerEts(Code),
	AttackTime = monsterState:getAttackIntervalTime(Code),
	BattlePropList = monsterState:getBattleProp(Code),
	AttackSpeed = 0, %% battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_attackspeed),
	CastValue = battleProp:getBattlePropTotalValue(BattlePropList, CastFactor),
	{X, Y} = monsterState:getMonsterPos(Code),
	%%配合客服端，如果载体需要走不同使用技能消息
	case monsterState:getCodeType(Code) of
		?SpawnCarrier ->
			UseSkill = #pk_GS2U_CarrierUseSkillToObject{
				userCode = Code,
				skillId = SkillID,
				serial = SN,
				targetCodeList = TargetCodeList,
				time = skill:getSkillParam(SkillID, AttackTime, AttackSpeed, CastValue)
			};
		_ ->
			UseSkill = #pk_GS2U_UseSkillToObject{
				userCode = Code,
				skillId = SkillID,
				serial = SN,
				targetCodeList = TargetCodeList,
				time = skill:getSkillParam(SkillID, AttackTime, AttackSpeed, CastValue)
			}
	end,
	{X, Y} = monsterState:getMonsterPos(Code),
	mapView:sendMsg2NearPlayerByPos(monsterState:getMapPid(Code), PlayerEts, UseSkill, X, Y, monsterState:getGroupID(Code)),
	ok.

%%通知客服端当前触发技能(如果是宠物通知玩家进程释放技能, 如果是怪物或者载体,通知AI释放技能)修改
-spec noticeUseTriggerSkill(Code, SkillID, TargetCode) -> ok when
	Code :: uint(),
	SkillID :: uint(),
	TargetCode :: uint().
noticeUseTriggerSkill(Code, SkillID, TargetCode) ->
	case monsterState:getCodeType(Code) of
		?SpawnPet ->
			skip;  %%通知玩家进程告诉客服端,宠物触发技能
		_ ->
			SN = monsterState:getAttackSN(Code),
			useSkill(Code, SkillID, SN + 1, TargetCode)
	end.

%%使用AOE技能，如果是瞬发技能或者是第二类引导技能则筛选出AOE目标，再使用调用一般技能函数
%%如果是第一类引导技能则保留当前使用技能，处于引导状态
-spec useAOESkill(Code, SkillID, SN, IsAttack, Target) -> ok when
	Code :: uint(), SkillID :: uint(), SN :: uint(), IsAttack :: boolean(), Target :: #recMapObject{}.
useAOESkill(Code, SkillID, SN, IsAttack, Target) ->
	Cfg = getCfg:getCfgPStack(cfg_skill, SkillID),
	PlayerEts = monsterState:getMapPlayerEts(Code),
	MonsterEts = monsterState:getMapMonsterEts(Code),
	PetEts = monsterState:getMapPetEts(Code),
	Pos = monsterState:getMonsterPos(Code),
	MyTeam = monsterState:getTeamInfo(Code),
	KillList = getCasterKillList(Code),
	Self = getObject(Code, Code),
	{DirX, DirY} = getFaceDir(Self, Target),
	monsterState:setBossFacePos(Code, DirX, DirY),
	TargetList =
		try
			skill:getAOETarget(Code, Pos, {DirX, DirY}, PlayerEts, MonsterEts, PetEts, SkillID, Target, MyTeam, KillList)
		catch
			_:Why ->
				FaceDir = {DirX, DirY},
				?ERROR_OUT("useAOESkill Code[~p,~w] Pos [~p] FaceDir [~p] Use Skill [~p],camp=[~w],y=[~p],Target is [~w],stack=~w",
					[Code, monsterState:getId(Code), Pos, FaceDir, SkillID, monsterState:getCamp(Code), Why, Target, erlang:get_stacktrace()]),
				[]
		end,
	case Cfg#skillCfg.skillType =:= 1 orelse skill:is2ndGuideSkill(SkillID) orelse Cfg#skillCfg.skillType =:= 4 of
		true ->
			useSkill1(Code, SkillID, SN, IsAttack, Target, TargetList);
		_ ->
			AttackTime = monsterState:getAttackIntervalTime(Code),
			BattlePropList = monsterState:getBattleProp(Code),
			AttackSpeed = 0, %% battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_attackspeed),
			Fun = fun(T) ->
				T#recMapObject.code
			      end,
			TargetCodeList = lists:map(Fun, TargetList),
			broadcastUseSkill(Code, SkillID, SN, TargetCodeList),
			setCurSkill(Code, SkillID, SN, 0, Target, Target, AttackTime, AttackSpeed)
	end,
	ok.

%%获取初始施法方向
-spec getFaceDir(#recMapObject{}, #recMapObject{}) -> {number(), number()}.
getFaceDir(#recMapObject{x = SX, y = SY}, #recMapObject{x = TX, y = TY}) ->
	DirX = TX - SX,
	DirY = TY - SY,
	case DirX == 0 andalso DirY == 0 of
		true ->
			{DirX + 0.1, DirY + 0.1};
		_ ->
			{DirX, DirY}
	end;
getFaceDir(_, _) ->
	{0.1, 0.1}.

%%是否是载体
-spec isCarrier(Code) -> false | #recCasterInfo{} when
	Code :: uint().
isCarrier(Code) ->
	Type = monsterState:getCodeType(Code),
	isCarrier(Type, Code).
isCarrier(?SpawnCarrier, Code) ->
	monsterState:getCasterInfo(Code);
isCarrier(_, _Code) ->
	false.

%%获取主人杀戮人列表
-spec getCasterKillList(Code) -> list() when
	Code :: uint().
getCasterKillList(Code) ->
	PlayerEts = monsterState:getMapPlayerEts(Code),
	CodeType = monsterState:getCodeType(Code),
	case CodeType =:= ?SpawnCarrier orelse CodeType =:= ?SpawnPet of
		true ->
			CasterInfo = monsterState:getCasterInfo(Code),
			case mapView:getMapObjectFromEts(CasterInfo#recCasterInfo.casterCode, {PlayerEts, false, false}) of
				#recMapObject{type = ?ObjTypePlayer, killList = List} ->
					List;
				_ ->
					[]
			end;
		_ ->
			[]
	end.

%------------------------------------------
% tools
%------------------------------------------

%%获取触发技能列表
-spec getTriSkillList(Code, SkillID, Type) -> list() when
	Code :: uint(),
	SkillID :: uint(),
	Type :: uint().
getTriSkillList(Code, SkillID, Type) ->
	SkillList = monsterState:getMonsterSkill(Code),
	FilterTypeList = filterTypeTriSkill(Type, SkillList),
	filterAssignTriSkill(SkillID, FilterTypeList).

%%过滤触发技能类型
-spec filterTypeTriSkill(Type, TriSkillList) -> list() when
	Type :: uint(),
	TriSkillList :: list().
filterTypeTriSkill(Type, TriSkillList) ->
	Fun = fun(#recSkill{skillID = SkillID}) ->
		#skillCfg{skillType = SkillType} = getCfg:getCfgPStack(cfg_skill, SkillID),
		case SkillType =:= Type of
			true ->
				true;
			_ ->
				false
		end
	      end,
	lists:filter(Fun, TriSkillList).

%%过滤指定技能触发
-spec filterAssignTriSkill(SkillID, TriSkillList) -> list() when
	SkillID :: uint(),
	TriSkillList :: list().
filterAssignTriSkill(SkillID, TriSkillList) ->
	Fun = fun(#recSkill{skillID = ID}) ->
		#skillCfg{triggerSkill = SkillList} = getCfg:getCfgPStack(cfg_skill, ID),
		if
			SkillList =:= undefined ->
				true;
			true ->
				lists:member(SkillID, SkillList)
		end
	      end,
	lists:filter(Fun, TriSkillList).

%%设置技能等级，同时会计算该等级下的加法值与乘法值
-spec setLevel(MonsterCode, #recSkill{}, SkillLevel) -> #recSkill{} when
	MonsterCode :: uint(),
	SkillLevel :: uint().
setLevel(MonsterCode, #recSkill{} = Skill, SkillLevel) ->
	Cfg = getCfg:getCfgPStack(cfg_skill, Skill#recSkill.skillID),
	DamageMultiply = Cfg#skillCfg.damageMultiply,
	DamagePlus = Cfg#skillCfg.damagePlus,
	Skill#recSkill{
		level = SkillLevel,
		damagePlus = calcForm(MonsterCode, DamagePlus, SkillLevel),
		damageMultiply = calcForm(MonsterCode, DamageMultiply, SkillLevel)
	}.

-spec calcForm(MonsterCode, MultOrPlus, SkillLevel) -> float() when
	MonsterCode :: uint(),
	MultOrPlus :: number() | undefined,
	SkillLevel :: uint().
calcForm(MonsterCode, MultOrPlus, SkillLevel) ->
	case is_list(MultOrPlus) of
		true ->
			Fun = fun(Elem, Sum) ->
				case Elem of
					{1, Arg1, Arg2} ->
						Sum + Arg1 + (SkillLevel - 1) * Arg2;
					{2, Arg1, Arg2} ->
						Value = buff:getGrowthValue(SkillLevel, Arg2),
						Sum + Arg1 + Value;
					{3, Arg1, Arg2, PropKey} ->
						PropValue = monsterState:getBattlePropTotal(MonsterCode, PropKey),
						Sum + Arg1 + Arg2 * PropValue;
					{4, Arg1, Arg2} ->
						Sum + Arg1 + Arg2 * 0;
					_ ->
						Sum
				end
			      end,
			lists:foldl(Fun, 0, MultOrPlus);
		_ ->
			0
	end.

%%%%%%%%%%%%%%%%%%%%%技能使用检查%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%检查技能是否存在
-spec canUseSkill(Code, SkillID) -> skip | true | uint() when
	Code :: uint(),
	SkillID :: uint().
canUseSkill(Code, SkillID) ->
	case getCfg:getCfgPStack(cfg_skill, SkillID) of
		#skillCfg{} = Skill ->
			canUseSkill1(Code, Skill);
		_ ->
			case skill:isTriggerSkill(SkillID) of
				true ->
					skip;
				_ ->
					?ErrorCode_UseSkillErrorSkill
			end
	end.

%%检查触发技能是否存在
-spec canUseSkill0(Code, SkillID) -> true | skip when
	Code :: uint(),
	SkillID :: uint().
canUseSkill0(Code, SkillID) ->
	TriList = monsterState:getTriggerSkill(Code),
	case lists:member(SkillID, TriList) of
		true ->
			true;
		_ ->
			skip
	end.

%%检查技能是否学习
canUseSkill1(Code, Skill) ->
	case checkUseSkillLearn(Code, Skill#skillCfg.skillID) of
		true ->
			canUseSkill2(Code, Skill);
		_ ->
			case skill:isTriggerSkill(Skill#skillCfg.skillID) of
				true ->
					skip;
				_ ->
					?ErrorCode_UseSkillErrorNotLearn
			end

	end.

%%检查是否为主动技能
canUseSkill2(Code, Skill) ->
	case checkUseSkillIsActive(Skill#skillCfg.skillType) of
		true ->
			canUseSkill3(Code, Skill);
		_ ->
			case skill:isTriggerSkill(Skill#skillCfg.skillID) of
				true ->
					skip;
				_ ->
					?ErrorCode_UseSkillErrorNotActive
			end
	end.

%%检查魔法系技能
canUseSkill3(Code, Skill) ->
	case checkUseSkillMagic(Code, Skill#skillCfg.skillSchool) of
		true ->
			canUseSkill4(Code, Skill);
		_ ->
			case skill:isTriggerSkill(Skill#skillCfg.skillID) of
				true ->
					skip;
				_ ->
					?ErrorCode_UseSkillErrorNoRelease
			end
	end.

%%检查人物特殊状态
canUseSkill4(Code, Skill) ->
	case checkUseSkillState(Code, Skill#skillCfg.weaponNeed, Skill#skillCfg.use_Spec) of
		true ->
			canUseSkill5(Code, Skill);
		_ ->
			case skill:isTriggerSkill(Skill#skillCfg.skillID) of
				true ->
					skip;
				_ ->
					?ErrorCode_UseSkillErrorNoMagic
			end
	end.

%%检查人物行为状态
canUseSkill5(Code, Skill) ->
	case checkUseSkillActionState(Code) of
		true ->
			canUseSkill6(Code, Skill);
		_ ->
			skip
	end.

%%检查技能CD
canUseSkill6(Code, Skill) ->
	case checkUseSkillCD(Code, Skill#skillCfg.skillID) of
		true ->
			true;
		globalCD ->
			case skill:isTriggerSkill(Skill#skillCfg.skillID) of
				true ->
					true;
				_ ->
					?ErrorCode_UseSkillErrorGlobalCD
			end;
		_ ->
			case skill:isTriggerSkill(Skill#skillCfg.skillID) of
				true ->
					skip;
				_ ->
					?ErrorCode_UseSkillErrorCD
			end
	end.

%%检查技能是否学习
-spec checkUseSkillLearn(Code, SkillID) -> boolean() when
	Code :: uint(),
	SkillID :: uint().
checkUseSkillLearn(Code, SkillID) ->
	SkillList = monsterState:getMonsterSkill(Code),
	case lists:keyfind(SkillID, #recSkill.skillID, SkillList) of
		#recSkill{} ->
			true;
		_ ->
			false
	end.

%%检查是否为主动技能
-spec checkUseSkillIsActive(SkillType) -> boolean() when
	SkillType :: uint().
checkUseSkillIsActive(?PassivitySkill) ->
	false;
checkUseSkillIsActive(_) ->
	true.

%%检查魔法系技能,如果沉默,不能使用该技能
-spec checkUseSkillMagic(Code, SkillSchool) -> boolean() when
	Code :: uint(),
	SkillSchool :: uint().
checkUseSkillMagic(_Code, ?SkillMixture) ->
	true;
checkUseSkillMagic(_Code, ?SkillPhysisc) ->
	true;
checkUseSkillMagic(Code, ?SkillMagic) ->
	Status = monsterState:getStatus(Code),
	misc:testBit(Status, ?CreatureSpeStautsSilence) =/= true.

%%检查特殊状态
-spec checkUseSkillState(Code, IsWeaponNeed, UseSpec) -> boolean() when
	Code :: uint(),
	IsWeaponNeed :: uint(),
	UseSpec :: uint().
checkUseSkillState(Code, IsWeaponNeed, UseSpec) ->
	Status = monsterState:getStatus(Code),
	IsUseSpec = UseSpec =:= ?NoUseSpec,
	Flag = misc:testBit(Status, ?CreatureSpeStautsDisarm) andalso lists:member(IsWeaponNeed, ?MajorWeapon),
	checkUseSkillState1(Code, IsWeaponNeed, IsUseSpec, Flag).
%%缴械状态
checkUseSkillState1(_Code, _IsWeaponNeed, _IsUseSpec, true) ->
	false;
checkUseSkillState1(Code, IsWeaponNeed, IsUseSpec, _) ->
	Status = monsterState:getStatus(Code),
	Flag = misc:testBit(Status, ?CreatureSpeStatusComa) orelse misc:testBit(Status, ?CreatureSpeStautsNoControl)
		orelse misc:testBit(Status, ?CreatureSpeStautsDeformation) orelse misc:testBit(Status, ?CreatureSpeStautsFreeze),
	checkUseSkillState2(Code, IsWeaponNeed, IsUseSpec, Flag).
%%眩晕，冰冻，变身 , %不受控制状态
checkUseSkillState2(_Code, _IsWeaponNeed, true, true) ->
	false;
checkUseSkillState2(_Code, _IsWeaponNeed, _IsUseSpec, _Flag) ->
	true.

%%检查人物行为状态
-spec checkUseSkillActionState(Code) -> boolean() when
	Code :: uint().
checkUseSkillActionState(Code) ->
	ActStatus = monsterState:getActionStatus(Code),
	case ActStatus of
		?CreatureActionStatusDead ->
			false;
		?CreatureActionStatusPick ->
			false;
		?CreatrueActionStatusStealth ->
			false;
		_ ->
			true
	end.

-spec checkUseSkillCD(Code :: uint(), SkillID :: uint()) -> globalCD | boolean().
checkUseSkillCD(Code, SkillID) ->
	NowTime = time:getUTCNowMSDiff2010(),
	GlobeCoolDown = monsterState:getPetGlobalCD(Code),
	%%检查全局CD
	case checkGlobalCD(GlobeCoolDown, NowTime) of
		true ->
			SkillCDList = monsterState:getPetSkillCD(Code),
			%%检查技能自身CD
			case lists:keyfind(SkillID, 1, SkillCDList) of
				{SkillID, CDTime} ->
					case NowTime >= CDTime of
						true ->
							true;
						_ ->
							false
					end;
				_ ->
					true
			end;
		_ ->
			globalCD
	end.

-spec checkGlobalCD(CoolDown :: uint(), NowTime :: uint()) -> boolean().
%% checkGlobalCD(Code, 0,NowTime) ->
%% 	%%公共CD时间是以角色的攻击间隔时间来确定的
%% 	GlobalCD = monsterState:getPetGlobalCD(Code),
%% 	AIT0 = monsterState:getAttackIntervalTime(Code),
%% 	AttackSpeed = monsterState:getBattlePropTotal(Code, ?Prop_attackspeed),
%% 	%%计算减少后的公共CD时间
%% 	AIT = AIT0 / (1 + AttackSpeed),
%% 	NowTime - GlobalCD =< AIT;
%% checkGlobalCD(Code, GlobeCoolDown,NowTime) when erlang:is_integer(GlobeCoolDown) andalso GlobeCoolDown > 0 ->
%% 	GlobalCD = monsterState:getPetGlobalCD(Code),
%% 	NowTime - GlobalCD =< GlobeCoolDown;
%% checkGlobalCD(_, _,_) ->
%% 	false.
checkGlobalCD(CoolDown, NowTime) when NowTime >= CoolDown ->
	true;
checkGlobalCD(_, _) ->
	false.
%%%%%%%%%%%%%%%%%%%%%检测目标合法性%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                       
-spec getObject(Code, TargetCode) -> #recMapObject{} | [] when
	Code :: uint(),
	TargetCode :: uint().
getObject(_Code, 0) ->
	[];
getObject(Code, TargetCode) ->
	PlayerEts = monsterState:getMapPlayerEts(Code),
	MonsterEts = monsterState:getMapMonsterEts(Code),
	PetEts = monsterState:getMapPetEts(Code),
	mapView:getMapObjectFromEts(TargetCode, {PlayerEts, MonsterEts, PetEts}).

getObject(_Code, 0, _X, _Y) ->
	[];
getObject(Code, TargetCode, X, Y) ->
	PlayerEts = monsterState:getMapPlayerEts(Code),
	MonsterEts = monsterState:getMapMonsterEts(Code),
	PetEts = monsterState:getMapPetEts(Code),
	case mapView:getMapObjectFromEts(TargetCode, {PlayerEts, MonsterEts, PetEts}) of
		#recMapObject{} = Object ->
			Object#recMapObject{x = X, y = Y};
		_ ->
			[]
	end.

-spec getObjectList(Code, CodeList) -> list() when
	Code :: uint(),
	CodeList :: list().
getObjectList(Code, CodeList) ->
	[getObject(Code, TargetCode) || TargetCode <- CodeList].

-spec getObjectCodeList(MainCode, List) -> list() when
	MainCode :: uint(),
	List :: [#recMapObject{}, ...].
getObjectCodeList(0, List) ->
	[Object#recMapObject.code || Object <- List];
getObjectCodeList(MainCode, List) ->
	[Object#recMapObject.code || Object <- List] ++ [MainCode].

-spec getFilterResList(Code, SkillID, MainCode, CodeList, X, Y) -> list() when
	Code :: uint(),
	SkillID :: uint(),
	MainCode :: uint(),
	CodeList :: list(),
	X :: float(),
	Y :: float().
getFilterResList(Code, SkillID, MainCode, CodeList, X, Y) ->
	MyTeam = monsterState:getTeamInfo(Code),
	SelfObject = getObject(Code, Code, X, Y),
	TargetList = getObjectList(Code, lists:delete(MainCode, CodeList)),
	FilterList = camp:filterTarget(SkillID, MyTeam, [], SelfObject, TargetList),
	getObjectCodeList(MainCode, FilterList).

-spec isCanAttack(SearchType, CodeList, SkillID, Code) -> uint() | {Code, CodeList} when
	SearchType :: uint(),
	CodeList :: list(),
	SkillID :: uint(),
	Code :: uint().
isCanAttack(?SingleSkillMyMaster, CodeList, _SkillID, Code) ->
	case length(CodeList) > 0 of
		true ->
			CasterInfo = monsterState:getCasterInfo(Code),
			MainCode = lists:nth(1, CodeList),
			case MainCode =:= CasterInfo#recCasterInfo.casterCode of
				true ->
					{MainCode, CodeList};
				_ ->
					?ErrorCode_UseSkillErrorNoTarget
			end;
		_ ->
			?ErrorCode_UseSkillErrorNoTarget
	end;
isCanAttack(?MutiSkillCirMyEnemy, CodeList, _SkillID, _Code) ->
	{0, CodeList};
isCanAttack(?MutiSkillSecEnemy, CodeList, _SkillID, _Code) ->
	{0, CodeList};
isCanAttack(?MutiSkillAngEnemy, CodeList, _SkillID, _Code) ->
	{0, CodeList};
isCanAttack(?MutiTranSkillCirMyEnermy, CodeList, _SkillID, _Code) ->
	{0, CodeList};
isCanAttack(?MutiTranSkillSecMyEnermy, CodeList, _SkillID, _Code) ->
	{0, CodeList};
isCanAttack(?SingleSkillMy, CodeList, _SkillID, Code) ->
	case length(CodeList) > 0 of
		true ->
			MainCode = lists:nth(1, CodeList),
			case MainCode =:= Code of
				true ->
					{MainCode, CodeList};
				_ ->
					?ErrorCode_UseSkillErrorNoTarget
			end;
		_ ->
			?ErrorCode_UseSkillErrorNoTarget
	end;
isCanAttack(?SingleSkillMyPet, _CodeList, _SkillID, _Code) ->
	?ErrorCode_UseSkillErrorSearchType;
isCanAttack(_, CodeList, SkillID, Code) ->
	case length(CodeList) > 0 of
		true ->
			MainCode = lists:nth(1, CodeList),
			case resFilter(Code, SkillID, MainCode, CodeList, true) of
				{MainCode1, CodeList1} ->
					{MainCode1, CodeList1};
				Error ->
					Error
			end;
		_ ->
			?ErrorCode_UseSkillErrorNoTarget
	end.

-spec resFilter(Code, SkillID, MainCode, CodeList, IsCheckShip) -> uint() | {uint, list()} when
	Code :: uint(),
	SkillID :: uint(),
	MainCode :: uint(),
	CodeList :: list(),
	IsCheckShip :: boolean().
resFilter(Code, SkillID, MainCode, CodeList, IsCheckShip) ->
	CasterInfo = monsterState:getCasterInfo(Code),
	SelfObject = getObject(Code, Code),
	TargetObject = getObject(Code, MainCode),
	MyTeam = monsterState:getTeamInfo(Code),
	case getObject(Code, CasterInfo#recCasterInfo.casterCode) of
		[] ->
			KillList = [];
		Object ->
			KillList = Object#recMapObject.killList
	end,
	case camp:isFilter(SkillID, MyTeam, KillList, SelfObject, TargetObject, IsCheckShip) of
		false ->
			{MainCode, CodeList};
		Error ->
			Error
	end.



