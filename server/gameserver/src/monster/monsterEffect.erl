%%
%%%-------------------------------------------------------------------
%%% @author 罗维
%%% @copyright (C) 2014, <haowan123>
%%% @doc
%%% 技能效果
%%% @end
%%% Created : 23. 五月 2014 17:27
%%%-------------------------------------------------------------------
-module(monsterEffect).
-author(luowei).

-include("gsInc.hrl").

-export([skillEffectRes/3,
		 filterEffect/2,
		 addPassEffect/3,
		 delPassEffect/2,
		 addCallInfo/3,
         addCallInfo/5,
		 delCallInfo/3
		]).

%%技能产生效果
-spec skillEffectRes(MonsterCode, EffectCfg, RecEffect) -> ok when
       MonsterCode :: uint(),
       EffectCfg :: #skill_effectCfg{},
       RecEffect :: #recSkillEffect{}.
skillEffectRes(MonsterCode, #skill_effectCfg{effectType = Type} = EffectCfg, #recSkillEffect{} = RecEffect) ->
	P1 = EffectCfg#skill_effectCfg.param1,
	P2 = EffectCfg#skill_effectCfg.param2,
	P3 = EffectCfg#skill_effectCfg.param3,
	P4 = EffectCfg#skill_effectCfg.param4,
	P5 = EffectCfg#skill_effectCfg.param5,
	P6 = EffectCfg#skill_effectCfg.param6,
	case Type of
		?ADDBUFF ->  
			%%创建buff
			Fun = fun(ID) ->
						  case ID =/= 0 of
							  true ->
								  monsterBuff:addBuff(MonsterCode, ID, RecEffect);
							  _  ->
								  skip
						  end
				  end,
			lists:foreach(Fun, [P1,P2,P3,P4,P5,P6]);
		?REMOVEBUFFSTATE ->
			%%移除指定buff
			[monsterBuff:delBuffByState(MonsterCode, State) || State <- [P1,P2,P3,P4,P5,P6]];
		?RANDOMREMOVEBUFF ->
			%%随机移除buff
			monsterBuff:delBuff(MonsterCode, P1, P2);
		?CALLMONSTER ->
			%%召唤怪物
			callMonster(MonsterCode, RecEffect, P1, P2, P3, P4, P5, P6);
		?TELEPORTSPRINT ->
			%%怪物不支持冲刺
			skip;
		?STRONGENMITY ->
			%%强拉仇恨
			getHate(MonsterCode, RecEffect#recSkillEffect.attackerPid, RecEffect#recSkillEffect.attackerCode);
		?GRABTARGET ->
			%%抓取目标
			Status = monsterState:getStatus(MonsterCode),
			case misc:testBit(Status, ?CreatureSpecStautsImmune) of
				true ->
					skip;
				_ ->
					grabTarget(MonsterCode, P1, P2, RecEffect)
			end;
		?CALLPET ->
			%%怪物不支持召唤宠物
			skip;
		?TRIGGERSKILL ->
			%%触发瞬移技能(后续功能)
			skip;
		?HURTRETRUNBLOOD ->
			%%技能伤害比例回血
			backBlood(MonsterCode, P1, RecEffect#recSkillEffect.targetDamageList);
		?ENERGYVALUE ->
			%%修改能量值
			modifyEnergy(MonsterCode, P1, P2);
		?CURRECTNOWHP ->
			%%修正当前生命值
			modifyHp(MonsterCode, P1, P2);
		?CURRECTNOWMP ->
			%%修正当前魔法值(功能已废除)
			modifyMp(MonsterCode, P1, P2); 
		?CARRIERSKILL ->
			%%载体技能
			createCarrier(MonsterCode, RecEffect, P1, P2, P3, P4, P5, P6);
		?BEATBACK ->
			%%击退
			Status = monsterState:getStatus(MonsterCode),
			case misc:testBit(Status, ?CreatureSpecStautsImmune) of
				true ->
					skip;
				_ ->
					beatBack(MonsterCode,P1,RecEffect)
			end;
		?REDUCECD ->
			%%减少CD
			reduceCD(MonsterCode, P1, P2, P3);
		?REMOVEBUFF ->
			%%移除指定buff
			[monsterBuff:delBuff(MonsterCode, BuffID) || BuffID <- [P1,P2,P3,P4,P5,P6]];
		?CONTROLEFFECT ->
			sepcEffect(MonsterCode, P1, P2, P3, RecEffect);
		_ ->
			skip
	end.

%%过滤针对自己加一次效果
-spec filterEffect(MonsterCode,EffectList) -> list() when
       MonsterCode :: uint(),
       EffectList :: list().
filterEffect(MonsterCode, EffectList) ->
	Fun = fun(#skill_effectCfg{iD = ID, effectTarget = Target}) ->
				  if
					  Target =/= ?TargetToMyselfOne ->
						  true;
					  true ->
						  case isHasEffect(MonsterCode, ID) of
							  true ->
								  false;
							  _ -> 
								  true
						  end
				  end
		  end,
	lists:filter(Fun, EffectList).

%%增加被动技能产生效果
-spec addPassEffect(MonsterCode, SkillID, Level) -> ok when
		  MonsterCode :: uint(),
		  SkillID :: uint(),
          Level :: uint().
addPassEffect(MonsterCode, SkillID, Level) ->
	IntervalTime = monsterState:getFinalAttackIntervalTime(MonsterCode),
	EffIDList = effect:getTriEffIDList(SkillID, IntervalTime),
	[AEffectList, _BEffectList] = effect:skillEffect([], EffIDList, true),
	addPassEffect(MonsterCode, SkillID, Level, AEffectList).

addPassEffect(_MonsterCode, _SkillID, _Level,  []) ->
	ok;
addPassEffect(MonsterCode, SkillID, Level, [#skill_effectCfg{effectType = ?ADDBUFF, param1 = BuffID} | List]) ->
	monsterBuff:addBuff(MonsterCode, BuffID, Level),
	addPassEffect(MonsterCode, SkillID, Level, List);
addPassEffect(_MonsterCode, _SkillID, _Level, _) ->
	ok.

%%移除被动技能产生效果
-spec delPassEffect(MonsterCode, SkillID) -> ok when
		  MonsterCode :: uint(),
		  SkillID :: uint().
delPassEffect(MonsterCode, SkillID) ->
	IntervalTime = monsterState:getFinalAttackIntervalTime(MonsterCode),
	EffIDList = effect:getTriEffIDList(SkillID, IntervalTime),
	[AEffectList, _BEffectList] = effect:skillEffect([], EffIDList, true),
	delPassEffect(MonsterCode, SkillID, AEffectList).

delPassEffect(_MonsterCode, _SkillID, []) ->
	ok;
delPassEffect(MonsterCode, SkillID, [#skill_effectCfg{effectType = ?ADDBUFF, param1 = BuffID} | List]) ->
	monsterBuff:delBuff(MonsterCode, BuffID),
	delPassEffect(MonsterCode, SkillID, List);
delPassEffect(_MonsterCode, _SkillID, _) ->
	ok.		

%% ====================================================================
%% API functions
%% ====================================================================
%%召唤怪物
-spec callMonster(MonsterCode, SkillEffect, MonsterID, MaxNum, Time, DiffX, DiffY, Num) -> ok when
       MonsterCode :: uint(),
       SkillEffect :: #recSkillEffect{},
       MonsterID :: uint(),
       MaxNum :: uint(),
       Time :: uint(),
		DiffX :: float(),
		DiffY :: float(),
       Num :: uint().
callMonster(MonsterCode, SkillEffect, MonsterID, MaxNum, Time, DiffX, DiffY, Num) ->
    MapPid = monsterState:getMapPid(MonsterCode),
    MapID = monsterState:getMapID(MonsterCode),
    PetEts = monsterState:getMapPetEts(MonsterCode),
    PlayerEts = monsterState:getMapPlayerEts(MonsterCode),
    MonsterEts = monsterState:getMapMonsterEts(MonsterCode),
    {X, Y} = monsterState:getMonsterPos(MonsterCode),
    CallMonsterList = SkillEffect#recSkillEffect.callMonsterList,
    CasterInfo = #recCasterInfo{
        casterId = SkillEffect#recSkillEffect.attackerID,
        casterCode = SkillEffect#recSkillEffect.attackerCode,
        casterPid = SkillEffect#recSkillEffect.attackerPid,
        casterType = SkillEffect#recSkillEffect.attackerType,
        casterName = SkillEffect#recSkillEffect.attackerName,
        casterPkMode = SkillEffect#recSkillEffect.attackerPkMode
    },
    Arg = #recSpawnMonster{
        id = MonsterID,
        mapPid = MapPid,
        mapID = MapID,
        x = X + DiffX,
        y = Y + DiffY,
        camp = SkillEffect#recSkillEffect.attackerCamp,
        groupID = SkillEffect#recSkillEffect.attackerGroupID,
        guildID = SkillEffect#recSkillEffect.attackerGuildID,
        teamID = SkillEffect#recSkillEffect.attackerTeamID,
        other = #recCallMonster{lifeTime = Time, callCaster = CasterInfo},
        petEts = PetEts,
        playerEts = PlayerEts,
        monsterEts = MonsterEts
    },
    callMonster1(MonsterID, CallMonsterList, MaxNum, Num, Arg).

-spec callMonster1(MonsterID, CallMonsterList, MaxNum, CallNum, Arg) -> ok when
       MonsterID :: uint(),
       CallMonsterList :: list(),
       MaxNum :: uint(),
       CallNum :: uint(),
       Arg :: #recSpawnMonster{}.
callMonster1(MonsterID, CallMonsterList, MaxNum, CallNum, Arg) ->
    SameMonsterList = effect:getSameIDList(MonsterID, CallMonsterList, []),
	AllNum = CallNum + length(SameMonsterList),
	if
		AllNum > MaxNum ->
			Fun = fun({Code, _, _}) ->
						  monsterInterface:clearSpawn(Code)
				  end,
			lists:foreach(Fun, lists:sublist(SameMonsterList, AllNum - MaxNum));
		true ->
			skip
	end,
	Fun1 = fun(_Index) ->
				   monsterInterface:spawnMonster(Arg)
		   end,
	lists:foreach(Fun1, lists:seq(1, CallNum)).

%%获取强拉仇恨值
-spec getHate(MonsterCode, AttackerPid,AttackerCode) -> ok when
       MonsterCode :: uint(),
       AttackerPid :: pid(),
       AttackerCode :: uint().
getHate(MonsterCode, AttackerPid, AttackerCode) ->
	HateList = monsterState:getHateList(MonsterCode),
	%%获取最大仇恨值
	Fun = fun(#recHate{hateValue = HateValue}, Max) ->
				  case HateValue > Max of
					  true ->
						  HateValue;
					  _ ->
						  Max
				  end
		  end,
	Max = lists:foldl(Fun, 0, HateList),
	NewHateList = 
		case lists:keyfind(AttackerCode, #recHate.hateCode, HateList) of
			#recHate{hateValue = OldValue} = OldHate ->
				NewHate = OldHate#recHate{hateValue = OldValue + Max},
				lists:keyreplace(AttackerCode, #recHate.hateCode, HateList, NewHate);              
			_ ->
				Hate = #recHate{hateCode = AttackerCode, hatePid = AttackerPid, hateValue = Max},
				[Hate | HateList]
		end,
	monsterState:setHateList(MonsterCode, NewHateList).

%%抓取目标(被攻击者进程)
-spec grabTarget(MonsterCode, GrabType, Dist, RecEffect) -> ok when
       MonsterCode :: uint(),
       GrabType :: uint(),
       Dist :: uint(),
       RecEffect :: #recSkillEffect{}.
grabTarget(MonsterCode, GrabType, Dist, RecEffect) ->
	monsterSkill:breakUseSkill(MonsterCode),
	PlayerEts = monsterState:getMapPlayerEts(MonsterCode),
	PetEts = monsterState:getMapPetEts(MonsterCode),
	MonsterEts = monsterState:getMapMonsterEts(MonsterCode),
	ID = monsterState:getId(MonsterCode),
	Type = codeMgr:getObjectTypeByCode(MonsterCode),
	SelfBodyR = mapView:getObjBodyR(Type,ID),
	%%获取对象
	case GrabType of
		0 ->
			Attack = mapView:getMapObjectFromEts(RecEffect#recSkillEffect.attackerCode, {PlayerEts,MonsterEts,PetEts});
		_ ->
			Attack = mapView:getMapObjectFromEts(RecEffect#recSkillEffect.targetMainCode, {PlayerEts,MonsterEts,PetEts})
	end,
	case Attack of
		#recMapObject{} ->
			TX = Attack#recMapObject.x,
			TY = Attack#recMapObject.y,
			BodyR = mapView:getObjBodyR(Attack#recMapObject.type,Attack#recMapObject.id),
			{X,Y} = monsterState:getMonsterPos(MonsterCode),
			DX = TX - X,
			DY = TY - Y,
			L = math:sqrt(DX * DX + DY * DY),
			{NX,NY} = 
				case  L > Dist + BodyR + SelfBodyR of
					true ->
						NewX = X + DX / L * (L - Dist - BodyR - SelfBodyR),
						NewY = Y + DY / L * (L - Dist - BodyR - SelfBodyR),
						{NewX,NewY};
					false ->
						{X,Y}
				end,
			monsterState:setMonsterPos(MonsterCode, NX, NY),
			monsterState:setMoveTarget(MonsterCode,0,0),
			creatureMap:syncCreatureToEts(MonsterCode), %%同步位置,防止服务器还未来得及tick位置
			EffectMsg = #pk_GS2U_AttackOffsetEffect{
													userCode = RecEffect#recSkillEffect.attackerCode,
													targetCode = RecEffect#recSkillEffect.targetCode,
													serial = RecEffect#recSkillEffect.serial,
													skillId = RecEffect#recSkillEffect.skillID,
													code = MonsterCode,
													x = NX,
													y = NY
												   },
			mapView:sendMsg2NearPlayerByPos(monsterState:getMapPid(MonsterCode),PlayerEts,EffectMsg,X,Y,monsterState:getGroupID(MonsterCode));
			%%?DEBUG_OUT("monster [~p] grabTarget dist ~p",[MonsterCode,[X,Y,NX,NY]]);
		_ -> 
			skip
	end,
	ok.

%%击退(被攻击者进程)
-spec beatBack(MonsterCode, Dist, RecEffect) -> ok when
       MonsterCode :: uint(),
       Dist :: uint(),
       RecEffect :: #recSkillEffect{}.
beatBack(MonsterCode, Dist, RecEffect) ->
	monsterSkill:breakUseSkill(MonsterCode),
	PlayerEts = monsterState:getMapPlayerEts(MonsterCode),
	PetEts = monsterState:getMapPetEts(MonsterCode),
	MonsterEts = monsterState:getMapMonsterEts(MonsterCode),
	%%获取攻击者对象
	case mapView:getMapObjectFromEts(RecEffect#recSkillEffect.attackerCode, {PlayerEts,MonsterEts,PetEts}) of
		#recMapObject{x = TX, y = TY} ->
			{X,Y} = monsterState:getMonsterPos(MonsterCode),
			if
				TX == X andalso TY == Y ->
					{DX,DY} = {TX - X + 0.5, TY - Y + 0.5}; %%重复,加上误差值 
				true ->
					{DX,DY} = {TX - X, TY - Y}
			end,
			L = math:sqrt(DX * DX + DY * DY),
			{RX, RY} = isBlock(MonsterCode, X, Y, DX, DY, L, Dist, X, Y, 0),
			monsterState:setMonsterPos(MonsterCode, RX, RY),
			monsterState:setMoveTarget(MonsterCode,0,0),
			EffectMsg = #pk_GS2U_AttackOffsetEffect
				{
					userCode = RecEffect#recSkillEffect.attackerCode,
					targetCode = RecEffect#recSkillEffect.targetCode,
					serial = RecEffect#recSkillEffect.serial,
					skillId = RecEffect#recSkillEffect.skillID,
					code = MonsterCode,
					x = RX,
					y = RY
				},
				mapView:sendMsg2NearPlayerByPos(monsterState:getMapPid(MonsterCode),PlayerEts,EffectMsg,X,Y,monsterState:getGroupID(MonsterCode));
		_ ->
			skip
	end,
	ok.

isBlock(_Code, X, Y, _DX, _DY, _L, Dist, _X1, _Y1, Dist) ->
	{X, Y};
isBlock(Code, X, Y, DX, DY, L, Dist, X1, Y1, SDist) ->
	NewX = X1 - DX / L * (SDist + 1),
	NewY = Y1 - DY / L * (SDist + 1),
	MapID = monsterState:getMapID(Code),
	case mapView:isBlock(MapID,NewX, NewY) of
		true ->
			{X, Y};
		_ ->
			isBlock(Code, NewX, NewY, DX, DY, L, Dist, X1, Y1, SDist + 1)
	end.

%%伤害回血
-spec backBlood(MonsterCode, Percent, RealDamageList) -> ok when 
       MonsterCode :: uint(),
       Percent :: uint(),
       RealDamageList :: list().
backBlood(MonsterCode, Percent, RealDamageList) ->
	Hp = monsterState:getCurHp(MonsterCode),
	Fun = fun(Damage, Acc) ->
				  Acc + Damage
		  end,
	TotalDamage = lists:foldl(Fun, 0, RealDamageList),
	GetHealtFactor = monsterState:getBattlePropTotal(MonsterCode, ?Prop_GetHealthFactor),
	NewDamage = TotalDamage * Percent * GetHealtFactor,
	NewHp = misc:clamp( Hp + NewDamage, 0,  Hp + NewDamage),
	monsterState:setCurHp(MonsterCode, NewHp),
	ok.

%%修正生命值
-spec modifyHp(MonsterCode, Num, Percent) -> ok when 
       MonsterCode :: uint(),
       Num :: uint(),
       Percent :: uint().
modifyHp(MonsterCode, Num, Percent) ->

	Hp = monsterState:getCurHp(MonsterCode),
	MaxHp = monsterState:getBattlePropTotal(MonsterCode,?Prop_MaxHP),
	ModifyValue = Num + Percent * MaxHp,
	case ModifyValue > 0 of
		true ->
			ModifyHp = ModifyValue;
		_ ->
			ModifyHp = ModifyValue
	end,
	NewHp = erlang:trunc(misc:clamp(Hp + ModifyHp, 0, MaxHp)),
	monsterState:setCurHp(MonsterCode,NewHp).

%%修正魔法值
-spec modifyMp(MonsterCode, Num, Percent) -> ok when 
       MonsterCode :: uint(),
       Num :: uint(),
       Percent :: uint().
modifyMp(MonsterCode, Num, Percent) ->
%%	Mp = monsterState:getCurMp(MonsterCode),
%%    MaxMp = monsterState:getBattlePropTotal(MonsterCode,?Prop_mana),
%%	NewMp = Mp + Num + Percent * MaxMp,
%%	monsterState:setCurMp(MonsterCode, NewMp),
	ok.

%%获取能量值
-spec modifyEnergy(MonsterCode, Num, Percent) -> ok when
       MonsterCode :: uint(),
       Num :: uint(),
       Percent :: uint().
modifyEnergy(_MonsterCode, _Num, _Percent) ->
	ok.

%%载体技能
-spec createCarrier(MonsterCode, SkillEffect, CarrierID, Pos, MaxNum, Time, IsRelease, Num) -> ok when
       MonsterCode :: uint(),
       SkillEffect :: #recSkillEffect{},
       CarrierID :: uint(),
       Pos :: uint(),
       MaxNum :: uint(),
       Time :: uint(),
       IsRelease :: uint(),
       Num :: uint().
createCarrier(MonsterCode, SkillEffect, CarrierID, Pos, MaxNum, Time, IsRelease, Num) ->
	MapPid = monsterState:getMapPid(MonsterCode),
	MapID = monsterState:getMapID(MonsterCode),
	PetEts = monsterState:getMapPetEts(MonsterCode),
	PlayerEts = monsterState:getMapPlayerEts(MonsterCode),
	MonsterEts = monsterState:getMapMonsterEts(MonsterCode),
	{X, Y} = monsterState:getMonsterPos(MonsterCode),
	
	AttackerProp = SkillEffect#recSkillEffect.attackerProp,
	TargetCode = SkillEffect#recSkillEffect.targetCode,
	CallCarrierList = SkillEffect#recSkillEffect.callCarrierList,
	CasterInfo = #recCasterInfo{
		casterId = SkillEffect#recSkillEffect.attackerID,
		casterCode = SkillEffect#recSkillEffect.attackerCode,
		casterPid = SkillEffect#recSkillEffect.attackerPid, 
		casterType = SkillEffect#recSkillEffect.attackerType, 
		casterName = SkillEffect#recSkillEffect.attackerName,
		casterPkMode = SkillEffect#recSkillEffect.attackerPkMode
	},
	RecCallCarrier = #recCallCarrier{
		skillLv = SkillEffect#recSkillEffect.level,
		battleProp = AttackerProp,
		callCaster = CasterInfo,
		lifeTime = Time,
		moveAi = Pos,
		releaseAi = IsRelease,
		targetCode = TargetCode
	},
	Arg = #recSpawnMonster{
		camp = SkillEffect#recSkillEffect.attackerCamp,
		id = CarrierID,
		mapPid = MapPid,
		mapID = MapID,
		x = X,
		y = Y,
		petEts = PetEts,
		playerEts = PlayerEts,
		other = RecCallCarrier,
		monsterEts = MonsterEts,
		guildID = SkillEffect#recSkillEffect.attackerGuildID,
		groupID = SkillEffect#recSkillEffect.attackerGroupID,
		teamID = SkillEffect#recSkillEffect.attackerTeamID
	},
	createCarrier1(MonsterCode, CarrierID, MaxNum, Num, CallCarrierList, Arg, CasterInfo).


-spec createCarrier1(MonsterCode, CarrierID, MaxNum, CallNum, CallCarrierList, Arg, CasterInfo) -> ok when
	   MonsterCode :: uint(),
       CarrierID :: uint(),
       MaxNum :: uint(),
       CallNum :: uint(),
       CallCarrierList :: list(),
       Arg :: #recSpawnMonster{},
	   CasterInfo :: #recCasterInfo{}.
createCarrier1(MonsterCode, CarrierID, MaxNum, CallNum, CallCarrierList, Arg, CasterInfo) ->
	SameCarrierList = effect:getSameIDList(CarrierID, CallCarrierList, []),
	CodeType = monsterState:getCodeType(MonsterCode),
	AllNum = CallNum + length(SameCarrierList),
	if
		AllNum > MaxNum ->
			Fun = fun({Code, _ID, _Pid}) ->
						  if
							  CodeType =:= ?SpawnPet orelse CodeType =:= ?SpawnCallPet ->
								  monsterInterface:addPetClearCarrier(Code, CasterInfo);
							  true ->
								  monsterInterface:clearSpawn(Code)
						  end
				  end,
			lists:foreach(Fun, lists:sublist(SameCarrierList, AllNum - MaxNum));
		true ->
			skip
	end,
	Fun1 = fun(_Index) ->
				   if
					   CodeType =:= ?SpawnPet orelse CodeType =:= ?SpawnCallPet ->
						   monsterInterface:addPetSpawnCarrier(Arg);
					   true ->
						   monsterInterface:spawnCarrier(Arg)
				   end
		   end,
	lists:foreach(Fun1, lists:seq(1, CallNum)).

%%减少CD
-spec reduceCD(MonsterCode, SkillID, ReduceTime, MinTime) -> ok when
		  MonsterCode :: uint(),
		  SkillID :: uint(),
          ReduceTime :: uint(),
          MinTime :: uint().
reduceCD(MonsterCode, SkillID, ReduceTime, MinTime) ->
	L = monsterState:getMonsterSkillCDList(MonsterCode),
	case lists:keyfind(SkillID, 1, L) of
		false ->
			skip;
		{SkillID, RemainCD} ->
			if
				RemainCD =< MinTime ->
					skip;
				true ->
					NewCD = RemainCD - ReduceTime,
					case NewCD >= MinTime of
						true ->
							CurCD = NewCD;
						_ ->
							CurCD = MinTime
					end,
					NL = lists:keyreplace(SkillID, 1, L, {SkillID, CurCD}),
					monsterState:setMonsterSkillCDList(MonsterCode, NL)
			end
	end,
	ok.

%%增加特殊效果
-spec sepcEffect(MonsterCode::uint(), BuffID::uint(), PropID::uint(), Prob::uint(), #recSkillEffect{}) -> ok.
sepcEffect(MonsterCode, BuffID, PropID, Prob, #recSkillEffect{attackerProp = BattleProp} = Rec) ->
	ok.
%%	IsAddBuff =
%%	case PropID of
%%		?Prop_sleepprob ->
%%			TargetNum = buff:getPropValue(?Prop_sleepprob, BattleProp),
%%			SourceNum = monsterState:getBattlePropTotal(MonsterCode, ?Prop_sleepimmunity),
%%			buff:calcProb(TargetNum + Prob - SourceNum);
%%		?Prop_freezerprob ->
%%			TargetNum = buff:getPropValue(?Prop_freezerprob, BattleProp),
%%			SourceNum = monsterState:getBattlePropTotal(MonsterCode, ?Prop_freezeimmunity),
%%			buff:calcProb(TargetNum + Prob - SourceNum);
%%		?Prop_slowdownprob ->
%%			TargetNum = buff:getPropValue(?Prop_slowdownprob, BattleProp),
%%			SourceNum = monsterState:getBattlePropTotal(MonsterCode, ?Prop_slowdownimmunity),
%%			buff:calcProb(TargetNum + Prob - SourceNum);
%%		_V ->
%%			?ERROR_OUT("unknown sepcEffect: buffID=~p, PropID=~p",[BuffID, PropID])
%%	end,
%%	case IsAddBuff of
%%		true ->
%%			monsterBuff:addBuff(MonsterCode, BuffID, Rec);
%%		_ ->
%%			skip
%%	end.

%%判断当前效果是否已经生效
-spec isHasEffect(MonsterCode, Id) -> boolean() when
       MonsterCode :: uint(),
       Id :: uint().
isHasEffect(MonsterCode, Id) ->
	EffectList = monsterState:getCurUseSkillEffect(MonsterCode),
	case  lists:member(Id, EffectList) of
		true ->
			true;
		_->
			NewEffectList = [Id | EffectList],
			monsterState:setCurUseSkillEffect(MonsterCode,NewEffectList),
			false
	end.

%%通知召唤者统计载体或者召唤怪物信息
-spec addCallInfo(CodeType, Code, CasterInfo) -> ok | skip when
		  CodeType :: ?SpawnCarrier | ?SpawnCallMonster | ?SpawnMonster | ?SpawnPet | ?SpawnCallPet,
          Code :: uint(),
          CasterInfo :: #recCasterInfo{}.
addCallInfo(?SpawnCarrier, Code, #recCasterInfo{casterPid = Pid, casterCode = CasterCode}) ->
	CarrierID = monsterState:getId(Code),
	case Pid =:= self() of
		true ->
			addCallInfo(?SpawnCarrier, Code, CarrierID, self(), CasterCode);
		_ ->
			psMgr:sendMsg2PS(Pid, addCarrierInfo, {CasterCode, CarrierID, Code, self()})
	end;
addCallInfo(?SpawnCallMonster, Code, #recCasterInfo{casterPid = Pid, casterCode = CasterCode}) ->
	MonsterID = monsterState:getId(Code),
	case Pid =:= self() of
		true ->
			addCallInfo(?SpawnCallMonster, Code, MonsterID, self(), CasterCode);
		_ ->
			psMgr:sendMsg2PS(Pid, addMonsterInfo, {CasterCode, MonsterID, Code, self()})
	end;
addCallInfo(_, _, _) ->
	skip.

-spec addCallInfo(CodeType, Code, ID, PID, CasterCode) -> ok | skip when
		  CodeType :: ?SpawnCarrier | ?SpawnCallMonster | ?SpawnMonster | ?SpawnPet | ?SpawnCallPet,
          Code :: uint(),
          ID :: uint(),
          PID :: pid(),
		  CasterCode :: uint().
addCallInfo(?SpawnCarrier, Code, CarrierID, CarrierPid, CasterCode) ->
	List = monsterState:getCallCarrierList(CasterCode),
	NewList = lists:keystore(Code, 1, List, {Code, CarrierID, CarrierPid}),
	monsterState:setCallCarrierList(CasterCode, NewList);
addCallInfo(?SpawnCallMonster, Code, MonsterID, MonsterPid, CasterCode) ->
	List = monsterState:getCallMonsterList(CasterCode),
	NewList = lists:keystore(Code, 1, List, {Code, MonsterID, MonsterPid}),
	monsterState:setCallMonsterList(CasterCode, NewList);
addCallInfo(_, _, _, _, _) ->
	skip.

%%通知召唤者删除载体或者召唤怪物信息
-spec delCallInfo(CodeType, Code, CasterInfo) -> ok | skip when
		  CodeType :: ?SpawnCarrier | ?SpawnCallMonster | ?SpawnMonster | ?SpawnPet | ?SpawnCallPet,
          Code :: uint(),
          CasterInfo :: #recCasterInfo{} | uint().
delCallInfo(?SpawnCarrier, Code, #recCasterInfo{casterPid = Pid, casterCode = CasterCode}) ->
	case Pid =:= self() of
		true ->
			delCallInfo(?SpawnCarrier, Code, CasterCode);
		_ ->
			psMgr:sendMsg2PS(Pid, delCarrierInfo, {CasterCode, Code})
	end;
delCallInfo(?SpawnCallMonster, Code, #recCasterInfo{casterPid = Pid, casterCode = CasterCode}) ->
	case Pid =:= self() of
		true ->
			delCallInfo(?SpawnCallMonster, Code, CasterCode);
		_ ->
			psMgr:sendMsg2PS(Pid, delMonsterInfo, {CasterCode, Code})
	end;
delCallInfo(?SpawnCarrier, Code, CasterCode) ->
	List = monsterState:getCallCarrierList(CasterCode),
	NewList = lists:keydelete(Code, 1, List),
	monsterState:setCallCarrierList(CasterCode, NewList);
delCallInfo(?SpawnCallMonster, Code, CasterCode) ->
	List = monsterState:getCallMonsterList(CasterCode),
	NewList = lists:keydelete(Code, 1, List),
	monsterState:setCallMonsterList(CasterCode, NewList);
delCallInfo(_, _, _) ->
	skip.
