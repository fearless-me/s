%%
%% @author zhongyunawei
%% @doc @todo 怪物AI模块.


-module(monsterAI).
-author(zhongyuanwei).

-include("monsterPrivate.hrl").

-define(ErrorSelTarget, 1).
-define(ErrorSelSkill, 2).


%% ====================================================================
%% API functions
%% ====================================================================

-export([
	initAI/2,
	initSpecWayLine/2,
	initSpecWayLine2/2,
	spawnAI/3,
	stopAI/1,
	selSkill/2,
	setAIEvent/3,
	handleAIAction/3,
	useSkill/1
]).

-spec spawnAI(Code, ID, MoveType) -> ok when
	Code :: uint(), ID :: uint16(), MoveType :: bstMoveType().
spawnAI(Code, ID, MoveType) ->
	libBstAI:spawnAI(ID, Code, MoveType, 0),
	ok.

-spec stopAI(Code) -> ok when
	Code :: uint().
stopAI(Code) ->
	libBstAI:delObj(Code),
	ok.

-spec initAI(Code, AIPid) -> ok when
	Code :: uint(), AIPid :: pid().
initAI(Code, AIPid) when erlang:is_pid(AIPid) ->
	%%初始化怪物AI变量
	monsterAI:setAIEvent(Code, ?BSTCondVar_HasTarget, 0),
	monsterAI:setAIEvent(Code, ?BSTCondVar_IsAttackCD, 0),
	%%初始化载体AI
	initCarrierAI(Code),
	ok.

-spec initCarrierAI(Code) -> ok when
	Code :: uint().
initCarrierAI(Code) ->
	case monsterState:getCodeType(Code) of
		?SpawnCarrier ->
			%%获取载体参数
			#recSpawnMonster{other = #recCallCarrier{
				moveAi = MoveType,
				targetCode = TargetCode,
				releaseAi = ReleaseType
			}} = monsterState:getSpawnInfo(Code),
			%%初始化选择技能
			selSkill(Code, ?BST_SELSKILL_NORMAL_MONSTER),
			%%初始化目标
			monsterState:setAttackTarget(Code, TargetCode),

			%%初始化载体进入战斗状态
			monsterBattle:enterBattle(Code),

			%%初始化载体技能释放方式
			case ReleaseType of
				1 -> %%释放一次技能
					skip; %%客户端还没有创建这个载体所以释放技能会有问题
%%					useSkill(Code);
				_ ->
					Now = time:getUTCNowMS(),
					monsterAI:setAIEvent(Code, ?BSTCondVar_IsInAttackRange, 1),
					monsterState:setStartUseSkillTime(Code, Now),
					Time = monsterState:getFinalAttackIntervalTime(Code),
					#selSkill{skillID = SkillID} = monsterState:getSelSkill(Code),
					monsterAI:setAIEvent(Code, ?BSTCondVar_IsAttackCD, 1),
					L = monsterState:getMonsterSkillCDList(Code),
					NL = lists:keystore(SkillID, 1, L, {SkillID, Time}),
					monsterState:setMonsterSkillCDList(Code, NL)
			end,

			%%初始化载体移动方式
			case MoveType of
				?BST_MOVE_NO_TRACE_TARGET -> %%向目标方向移动
					monsterMove:towardMove(Code);
				_ ->
					skip
			end;
		_ ->
			skip
	end.

splitWayPt([], _Pt, AccIn) ->
	lists:reverse(AccIn);
splitWayPt([H | _T] = L, Pt, _AccIn) when H =:= Pt ->
	L;
splitWayPt([H | T], Pt, AccIn) ->
	splitWayPt(T, Pt, [H | AccIn]).

initSpecWayLine(Code, IsType1) ->
	case monsterState:getMoveTargetList(Code) of
		undefined ->
			MapID = monsterState:getMapID(Code),
			List = core:getMapWayPt(MapID),
			SortList = lists:keysort(#recMapWayPt.id, List),
			Fun = fun(#recMapWayPt{x = X, y = Y}, AccIn) ->
				[{X, Y} | AccIn]
				  end,
			SL = case IsType1 of
					 true ->
						 lists:reverse(SortList);
					 _ ->
						 SortList
				 end,
			WayPtList = lists:foldl(Fun, [], SL),
			CurPos = monsterState:getMonsterPos(Code),
			L = splitWayPt(WayPtList, CurPos, []),
			case L of
				[{TX, TY} | T] ->
					MonID = monsterState:getId(Code),
					#monsterCfg{moveSpeed = MS} = getCfg:getCfgPStack(cfg_monster, MonID),
					MoveSpeed = float(MS),
					monsterState:setMoveSpeed(Code, MoveSpeed),
					monsterMove:moveTo(Code, TX, TY),
					monsterState:setMoveTargetList(Code, T);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

initSpecWayLine2(Code, StartWID) ->
	case monsterState:getMoveTargetList(Code) of
		undefined ->
			MapID = monsterState:getMapID(Code),
			List = core:getMapWayPt(MapID),

			SortList1 = lists:keysort(#recMapWayPt.id, List),
			SortList2 = lists:filter(fun(#recMapWayPt{id = ID}) -> ID >= StartWID end, SortList1),
			{PL1, _WL1} = makeWay(StartWID, SortList2),
			PL = lists:reverse(PL1),
			case PL of
				[{TX, TY} | _] ->
					MonID = monsterState:getId(Code),
					#monsterCfg{moveSpeed = MS} = getCfg:getCfgPStack(cfg_monster, MonID),
					MoveSpeed = float(MS),
					monsterState:setMoveSpeed(Code, MoveSpeed),
					monsterMove:moveTo(Code, TX, TY),
					monsterState:setMoveTargetList(Code, PL);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

makeWay(StartWID, WPList) ->
	case lists:keyfind(StartWID, #recMapWayPt.id, WPList) of
		#recMapWayPt{neighborCount = NC} when NC < 1 ->
			{[], []};
		#recMapWayPt{x = X, y = Y, neighborIds = NL} ->
			NextWID = lists:max(NL),
			makeWay1(StartWID, NextWID, WPList, {[{X, Y}], [StartWID]}, 20);
		_ ->
			{[], []}
	end.
makeWay1(_, _, _, AccPL, Limit) when Limit =< 0 ->
	AccPL;
makeWay1(PreWID, CurWID, _, AccPL, _) when CurWID =< PreWID ->
	AccPL;
makeWay1(_, CurWID, WPList, {ACCP, ACCW} = AccPL, Limit) ->
	case lists:keyfind(CurWID, #recMapWayPt.id, WPList) of
		#recMapWayPt{x = X, y = Y, neighborCount = NC} when NC =< 1 ->
			{[{X, Y} | ACCP], [CurWID | ACCW]};
		#recMapWayPt{x = X, y = Y, neighborIds = NL} ->
			NextWID = lists:max(NL),
			makeWay1(CurWID, NextWID, WPList, {[{X, Y} | ACCP], [CurWID | ACCW]}, Limit - 1);
		_ ->
			AccPL
	end.

-spec setAIEvent(Code, VarName, VarValue) -> ok when
	Code :: uint(), VarName :: uint(), VarValue :: number().
setAIEvent(Code, VarName, VarValue) when erlang:is_number(VarValue) ->
	bstTreeRE:setVar(Code, VarName, VarValue),
	ok.


-spec handleAIAction(Code, ActionType, ActionArg) -> ok when
	Code :: uint(), ActionType :: bstActionType(), ActionArg :: term().
handleAIAction(Code, ActionType, ActionArg) ->
	case ActionType of
		?BSTActionMove ->
			move(Code, ActionArg);
		?BSTActionSelTarget ->
			selTarget(Code, ActionArg);
		?BSTActionSelSkill ->
			selSkill(Code, ActionArg);
		?BSTActionAttack ->
			attack(Code);
		_ ->
			skip
	end,
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================

%%选择目标
-spec selTarget(Code, Arg) -> ok when
	Code :: uint(),
	Arg :: bstActSelTargetType().
selTarget(Code, Arg) ->
	HateList = monsterState:getHateList(Code),
	AttackTarget = monsterState:getAttackTarget(Code),
	%MonsterID = monsterState:getId(Code),
	case Arg of
		?BST_SELTARGET_RANDOM ->
			%%随机攻击目标,目标死亡后,未脱离战斗,则再次随机
			case isForceSel(Code) of
				true ->
					forceSelTarget(Code, AttackTarget);
				_ ->
					randomSelTarget(Code, HateList, AttackTarget)
			end;
		?BST_SELTARGET_HIGHESTHATE ->
			%%选择仇恨值最高
			ok;
		?BST_SELTARGET_TIMER ->
			%%定时随机目标
			case isForceSel(Code) of
				true ->
					forceSelTarget(Code, AttackTarget);
				_ ->
					timerSelTarget(Code, HateList, AttackTarget)
			end;
		?BST_SELTARGET_ENEMY_CTRLER ->
			%%选择敌对玩家或者宠物
			ok;
		?BST_SELTARGET_ENEMY_MONSTER ->
			%%选择敌对怪物
			ok;
		?BST_SELTARGET_ENEMY_MONSTER_FIRST ->
			%%选择敌对玩家或者宠物
			Fun = fun(#recHate{hateCode = HateCode} = Hate, {NewHateList, DelHateList}) ->
				case codeMgr:isCodeType(?CodeTypePlayer, HateCode) of
					true ->
						{[Hate | NewHateList], DelHateList};
					_ ->
						{NewHateList, [Hate | DelHateList]}
				end
				  end,
			{NewHList, DelHList} = lists:foldl(Fun, {[], []}, HateList),
			%%这里需要确认新的仇恨列表是有目标的
			case NewHList of
				[#recHate{hateCode = TargetCode} | _] when AttackTarget =/= TargetCode ->
					monsterState:setAttackTarget(Code, TargetCode),
					monsterState:setHateList(Code, NewHList),
					Fun1 = fun(#recHate{} = Hate) ->
						monsterBattle:delHate(Code, Hate)
						   end,
					lists:foreach(Fun1, DelHList);
				_ ->
					skip
			end,
			ok;
		?BST_SELTARGET_DEAD_RANDOM ->
			randomSelTarget0(Code, HateList, AttackTarget);
		_ ->
			?ERROR_OUT("Error sel args!, can't sel target"),
			ok
	end,
%%	case MonsterID >= 8300 andalso MonsterID < 8302 of
%%		true ->
%%			?DEBUG_OUT("@@@@@@@@@@@@@@@@@@@@@@@@@@ selectTarget(~w,~w,~w -> ~w )",
%%				[MonsterID, Arg,AttackTarget, monsterState:getAttackTarget(Code)]);
%%		_ -> skip
%%	end,
	ok.

%%额外技能选择目标
extSkillSelTarget(Code, Arg) ->
	HateList = monsterState:getHateList(Code),
	AttackTarget = monsterState:getAttackTarget(Code),
	case Arg of
		?BST_EXT_SKILL_SELTARGET_MYSELF -> %%技能选择目标，自己
			monsterState:setExSkillAttackTarget(Code, Code);
		?BST_EXT_SKILL_SELTARGET_DEFALT -> %%技能选择目标，默认当前目标
			monsterState:setExSkillAttackTarget(Code, AttackTarget);
		?BST_EXT_SKILL_SELTARGET_RANDOM1 -> %%技能选择目标，非当前目标随机(玩家)
			randomSelTarget1(Code, HateList);
		?BST_EXT_SKILL_SELTARGET_RANDOM2 -> %%技能选择目标，随机攻击目标(玩家)
			randomSelTarget2(Code, HateList);
		_ ->
			?ERROR_OUT("Error sel args!, can't sel target"),
			ok
	end.

%%选择技能
-spec selSkill(Code, Arg) -> ok when
	Code :: uint(),
	Arg :: bstActSelSkillType().
selSkill(Code, Arg) ->
	MonID = monsterState:getId(Code),
	#monsterCfg{
		monsterSkill = SkillList,
		monsterExSkill = ExSkillList,
		skillInterval = SkillInterVal
	} = getCfg:getCfgPStack(cfg_monster, MonID),
	case Arg of
		?BST_SELSKILL_NORMAL_MONSTER ->
			normalRandomSelSkill(Code, SkillList);
		?BST_SELSKILL_BOSS ->
			Now = time:getUTCNowMS(),
			SelTime = monsterState:getBossSelSkillTime(Code),
			{MinTime, MaxTime} =
				case SkillInterVal of
					[SMinTime, SMaxTime] ->
						{SMinTime, SMaxTime};
					_ ->
						{?DefaultAttackInternalTime * 3, ?DefaultAttackInternalTime * 3}
				end,

			if
				SelTime =:= 0 ->
					Random = misc:rand(MinTime, MaxTime),
					monsterState:setBossSelSkillTime(Code, Random + Now),
					normalRandomSelSkill(Code, SkillList);
				SelTime =/= 0 andalso SelTime > Now ->
					normalRandomSelSkill(Code, SkillList);
				true ->
					specRandomSelSkill(Code, ExSkillList),
					#selSkill{castTime = CastTime, targetType = TargetType} = monsterState:getSelSkill(Code),
					%%特殊技能,重新设置技能目标
					extSkillSelTarget(Code, TargetType),
					Random = misc:rand(MinTime, MaxTime),
					monsterState:setBossSelSkillTime(Code, CastTime + Random + Now)
			end;
		_ ->
			?ERROR_OUT("Error sel args!, can't sel skill, monster(~w),Arg(~w)",
				[monsterState:getId(Code), Arg]),
			ok
	end.

%%移动
-spec move(Code, MoveType) -> ok when
	Code :: uint(), MoveType :: bstMoveType().
move(Code, MoveType) ->
	case MoveType of
		?BST_MOVE_STAND ->
			skip;
		?BST_MOVE_TRACE_TARGET ->
			%%向目标移动,并跟踪
			monsterMove:moveToTarget(Code);
		?BST_MOVE_WAY_LIST ->
			%%向目标移动,并跟踪
			monsterMove:aiTickMove(Code);
		?BST_MOVE_CONVOY ->
			monsterMove:moveToConvoy(Code);
		_ -> %%随机移动
			monsterMove:randMove(Code)
	end.

%%攻击
-spec attack(Code) -> ok when
	Code :: uint().
attack(Code) ->
	CurHp = monsterState:getCurHp(Code),
	case CurHp > 0 of
		true ->
			ID = monsterState:getId(Code),
			SN = monsterState:getAttackSN(Code),
			#selSkill{skillID = SkillID} = monsterState:getSelSkill(Code),
			#monsterCfg{monsterSkill = SkillList} = getCfg:getCfgPStack(cfg_monster, ID),
			TargetCode =
				case lists:member(SkillID, SkillList) of
					true ->
						monsterState:getAttackTarget(Code);
					_ ->
						monsterState:getExSkillAttackTarget(Code)
				end,
			case monsterState:getCodeType(Code) of
				?SpawnCarrier ->
					case TargetCode =/= undefined of
						true ->
							monsterSkill:useSkill(Code, SkillID, SN, TargetCode);
						_ ->
							monsterSkill:useSkill(Code, SkillID, SN, Code)
					end;
				_ ->
					NewSelSkill = #selSkill{lastSkillID = SkillID},
					monsterState:setSelSkill(Code, NewSelSkill),
					monsterSkill:useSkill(Code, SkillID, SN, TargetCode)
			end,
			monsterState:setAttackSN(Code, SN + 1),
			monsterState:setExSkillAttackTarget(Code, undefined);
		_ ->
			skip
	end,
	ok.

%%释放技能
-spec useSkill(Code) -> ok when
	Code :: uint().
useSkill(Code) ->
	#selSkill{skillID = SkillID} = monsterState:getSelSkill(Code),
	SN = monsterState:getAttackSN(Code),
	monsterState:setAttackSN(Code, SN + 1),
	TargetCode =
		case monsterState:getAttackTarget(Code) =/= undefined of
			true ->
				monsterState:getAttackTarget(Code);
			_ ->
				Code
		end,
	case monsterState:getCodeType(Code) of
		?SpawnCarrier ->
			monsterSkill:useSkill(Code, SkillID, SN, TargetCode);
		_ ->
			monsterSkill:useSkill(Code, SkillID, SN, TargetCode),
			NewSelSkill = #selSkill{lastSkillID = SkillID},
			monsterState:setSelSkill(Code, NewSelSkill)
	end,
	ok.

%%是否强制选择目标
-spec isForceSel(Code) -> boolean() when
	Code :: uint().
isForceSel(Code) ->
	Status = monsterState:getStatus(Code),
	case misc:testBit(Status, ?CreatureSpecStautsRidicule) of
		true ->
			true;
		_ ->
			false
	end.

-spec forceSelTarget(Code, AttackTarget) -> ok when
	Code :: uint(),
	AttackTarget :: uint() |undefined.
forceSelTarget(Code, AttackTarget) ->
	BuffList = monsterBuff:getBuffByEffect(Code, ?RIDICULE),
	Buff = lists:nth(1, BuffList),
	HateList = monsterState:getHateList(Code),
	case lists:keyfind(Buff#recBuff.casterCode, #recHate.hateCode, HateList) of
		false ->
			ok;
		_ ->
			monsterState:setAttackTarget(Code, Buff#recBuff.casterCode),
			case AttackTarget of
				undefined ->
					monsterBattle:enterBattle(Code);
				_ ->
					skip
			end
	end.

%%随机选择(包括玩家,宠物,召唤怪物)
-spec randomSelTarget(Code, HateList, AttackTarget) -> ok when
	Code :: uint(),
	HateList :: list(),
	AttackTarget :: uint() | undefined.
randomSelTarget(Code, HateList, AttackTarget) ->
	case HateList =:= [] of
		true ->
			%%第一次选择目标或者最后脱离战斗继续执行AI选择目标
			skip;
		_ ->
			Index = random:uniform(length(HateList)),
			#recHate{hateCode = SelCode} = lists:nth(Index, HateList),
			monsterState:setAttackTarget(Code, SelCode),
			case AttackTarget of
				undefined ->
					monsterBattle:enterBattle(Code);
				_ ->
					skip
			end
	end.

-spec randomSelTarget0(Code, HateList, AttackTarget) -> ok when
	Code :: uint(),
	HateList :: list(),
	AttackTarget :: uint() | undefined.
randomSelTarget0(Code, HateList, AttackTarget) ->
	case HateList =:= [] of
		true ->
			%%第一次选择目标或者最后脱离战斗继续执行AI选择目标
			skip;
		_ ->
			case AttackTarget of
				undefined ->
					Index = random:uniform(length(HateList)),
					#recHate{hateCode = SelCode} = lists:nth(Index, HateList),
					monsterState:setAttackTarget(Code, SelCode),

					MonsterID = monsterState:getId(Code),
					#monsterCfg{monsterSubType = SubType} = getCfg:getCfgPStack(cfg_monster, MonsterID),
					case SubType =:= ?MonsterSTypeWildBoss of
						true ->
%%							HateList2 = [Hate || Hate = #recHate{hateCode = SelCode} <- HateList, codeMgr:getObjectTypeByCode(SelCode) =:= ?ObjTypePlayer],
							?LOG_OUT("wildboss monster select target [~p] Type [~p]", [SelCode, codeMgr:getObjectTypeByCode(SelCode)]),
							{RSelCode,_} = mapWildBoss:getRealAttacker(Code, SelCode, 0),
							mapWildBoss:updateWildBossTargetCode(Code, RSelCode),

							RealHateList = monsterBattle:getRealHatePidList(Code,HateList),
							[psMgr:sendMsg2PS(PPid, wildBossChangeTarget, {RSelCode, true}) || PPid <- RealHateList],

							PlayerEts = monsterState:getMapPlayerEts(Code),
							Fun =
								fun(#recMapObject{code = PlayerCode, pid = PlayerPid}, AccIn) ->
									psMgr:sendMsg2PS(PlayerPid, changeBuffState, PlayerCode =:= RSelCode),
									AccIn
								end,
							ets:foldl(Fun, 0, PlayerEts);
						_ ->
							skip
					end;
				_ ->
					skip
			end,
			monsterBattle:enterBattle(Code)
	end.

%%定时随机选择目标(包括玩家,宠物,召唤怪物)
-spec timerSelTarget(Code, HateList, AttackTarget) -> ok when
	Code :: uint(),
	HateList :: list(),
	AttackTarget :: uint() | undefined.
timerSelTarget(Code, HateList, AttackTarget) ->
	Now = time:getUTCNowMS(),
	MonsterID = monsterState:getId(Code),
	#monsterCfg{changeInterval = Timer} = getCfg:getCfgPStack(cfg_monster, MonsterID),
	SelTimer = monsterState:getTimerSelTargetTime(Code),
	if
		SelTimer =:= undefined andalso AttackTarget =:= undefined ->
			%%被动怪第一次定时选择目标
			monsterState:setTimerSelTargetTime(Code, Now),
			randomSelTarget(Code, HateList, AttackTarget);
		SelTimer =:= undefined andalso AttackTarget =/= undefined ->
			%%主动怪已经选择目标
			monsterState:setTimerSelTargetTime(Code, Now);
		SelTimer =:= 0 ->
			monsterState:setTimerSelTargetTime(Code, undefined);
		Now - SelTimer >= Timer ->
			%%定时选择目标
			monsterState:setTimerSelTargetTime(Code, Now),
			case HateList of
				[] ->
					skip;
				_ ->
					NewList = lists:keydelete(AttackTarget, #recHate.hateCode, HateList),
					case NewList of
						[] ->
							Index = random:uniform(length(HateList)),
							#recHate{hateCode = SelCode} = lists:nth(Index, HateList);
						_ ->
							Index = random:uniform(length(NewList)),
							#recHate{hateCode = SelCode} = lists:nth(Index, NewList)
					end,
					monsterState:setAttackTarget(Code, SelCode)
			end;
		true ->
			case HateList of
				[] ->
					skip;
				_ ->
					case lists:keyfind(AttackTarget, #recHate.hateCode, HateList) of
						false ->
							Index = random:uniform(length(HateList)),
							#recHate{hateCode = SelCode} = lists:nth(Index, HateList),
							monsterState:setAttackTarget(Code, SelCode);
						_ ->
							skip
					end
			end
	end.

%%非当前目标随机(只能玩家)
-spec randomSelTarget1(Code, HateList) -> ok when
	Code :: uint(),
	HateList :: list().
randomSelTarget1(Code, HateList) ->
	AttackCode = monsterState:getAttackTarget(Code),
	randomSelTarget1(Code, HateList, AttackCode).

randomSelTarget1(Code, HateList, AttackCode) ->
	case HateList =:= [] orelse AttackCode =:= undefined of
		true ->
			skip;
		_ ->
			NewList = filterTarget(AttackCode, HateList),
			case NewList of
				[] ->
					monsterState:setExSkillAttackTarget(Code, AttackCode);
				_ ->
					Index = random:uniform(length(NewList)),
					#recHate{hateCode = SelCode} = lists:nth(Index, NewList),
					monsterState:setExSkillAttackTarget(Code, SelCode)
			end
	end.

%%目标随机(只能玩家)
-spec randomSelTarget2(Code, HateList) -> ok when
	Code :: uint(),
	HateList :: list().

randomSelTarget2(Code, HateList) ->
	AttackCode = monsterState:getAttackTarget(Code),
	randomSelTarget2(Code, HateList, AttackCode).
randomSelTarget2(Code, HateList, AttackCode) ->
	case HateList =:= [] orelse AttackCode =:= undefined of
		true ->
			skip;
		_ ->
			NewList = filterTarget(HateList),
			case NewList of
				[] ->
					monsterState:setExSkillAttackTarget(Code, AttackCode);
				_ ->
					Index = random:uniform(length(NewList)),
					#recHate{hateCode = SelCode} = lists:nth(Index, NewList),
					monsterState:setExSkillAttackTarget(Code, SelCode)
			end
	end.

-spec normalRandomSelSkill(Code, SkillList) -> ok when
	Code :: uint(),
	SkillList :: list().
normalRandomSelSkill(Code, SkillList) when is_list(SkillList) andalso SkillList =/= [] ->
	Index = random:uniform(length(SkillList)),
	SkillID = lists:nth(Index, SkillList),
	monsterState:setSelSkill(Code, #selSkill{skillID = SkillID});
normalRandomSelSkill(_Code, _) ->
	ok.

-spec specRandomSelSkill(Code, SkillList) -> ok when
	Code :: uint(),
	SkillList :: list().
specRandomSelSkill(Code, SkillList) when is_list(SkillList) andalso SkillList =/= [] ->
	%%获取权重
	Fun = fun({SkillID, Weigth, _WaitTime, _CastTime, _MaxNum, _TargetType}, Acc) ->
		[{Weigth, SkillID} | Acc]
		  end,
	WeigthList = lists:foldl(Fun, [], SkillList),

	%%选择技能判断
	SelSkill = monsterState:getSelSkill(Code),
	case lists:keyfind(SelSkill#selSkill.lastSkillID, 1, SkillList) of
		{_, _, WaitTime, CastTime, MaxNum, TargetType} ->
			%%随机获得技能
			case #selSkill.count >= MaxNum of
				true ->
					%%超过最大选择次数
					NewWeigthList = lists:keydelete(SelSkill#selSkill.lastSkillID, 1, WeigthList),
					SkillID = misc:calcOddsByWeightList(NewWeigthList),
					{_, _, WaitTime1, CastTime1, _, TargetType1} = lists:keyfind(SkillID, 1, SkillList),
					NewSelSkill = SelSkill#selSkill{
						skillID = SkillID,
						count = 1,
						castTime = CastTime1,
						waitTime = WaitTime1,
						targetType = TargetType1
					},

					monsterState:setSelSkill(Code, NewSelSkill);
				_ ->
					%%没有超过最大选择次数
					SkillID = misc:calcOddsByWeightList(WeigthList),
					case SkillID =:= SelSkill#selSkill.lastSkillID of
						true ->
							NewSelSkill = SelSkill#selSkill{
								skillID = SkillID,
								count = SelSkill#selSkill.count + 1,
								castTime = CastTime,
								waitTime = WaitTime,
								targetType = TargetType
							};
						_ ->
							{_, _, WaitTime1, CastTime1, _, TargetType1} = lists:keyfind(SkillID, 1, SkillList),
							NewSelSkill = SelSkill#selSkill{
								skillID = SkillID,
								count = 1,
								castTime = CastTime1,
								waitTime = WaitTime1,
								targetType = TargetType1
							}
					end,
					monsterState:setSelSkill(Code, NewSelSkill)
			end;
		_ ->
			SkillID = misc:calcOddsByWeightList(WeigthList),
			{_, _, WaitTime1, CastTime1, _, TargetType1} = lists:keyfind(SkillID, 1, SkillList),

			NewSelSkill = SelSkill#selSkill{
				skillID = SkillID,
				count = 1,
				castTime = CastTime1,
				waitTime = WaitTime1,
				targetType = TargetType1
			},
			monsterState:setSelSkill(Code, NewSelSkill)

	end;
specRandomSelSkill(_Code, _) ->
	ok.

-spec filterTarget(HateList) -> list() when
	HateList :: list().
filterTarget(HateList) ->
	Fun = fun(#recHate{hateCode = HateCode} = Hate, Acc) ->
		case codeMgr:getObjectTypeByCode(HateCode) of
			?ObjTypePlayer ->
				[Hate | Acc];
			_ ->
				Acc
		end
		  end,
	lists:foldr(Fun, [], HateList).

-spec filterTarget(TargetCode, HateList) -> list() when
	TargetCode :: uint(),
	HateList :: list().
filterTarget(TargetCode, Hatelist) ->
	NewList = lists:keydelete(TargetCode, #recHate.hateCode, Hatelist),
	Fun = fun(#recHate{hateCode = HateCode} = Hate, Acc) ->
		case codeMgr:getObjectTypeByCode(HateCode) of
			?ObjTypePlayer ->
				[Hate | Acc];
			_ ->
				Acc
		end
		  end,
	lists:foldr(Fun, [], NewList).

