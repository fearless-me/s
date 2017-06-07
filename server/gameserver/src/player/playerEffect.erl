%%%
%%%-------------------------------------------------------------------
%%% @author 罗维
%%% @copyright (C) 2014, <haowan123>
%%% @doc
%%% 技能效果
%%% @end
%%% Created : 23. 五月 2014 17:27
%%%-------------------------------------------------------------------
-module(playerEffect).
-author(luowei).

-include("gsInc.hrl").

-export([
		 filterEffect/1,
		 skillEffectRes/2,
		 addPassEffect/2,
		 delPassEffect/1,
		 addCallInfo/4,
		 delCallInfo/3
		]).

%%技能产生效果
-spec skillEffectRes(EffectCfg, RecEffect) -> ok when
       EffectCfg :: #skill_effectCfg{},
       RecEffect :: #recSkillEffect{}.
skillEffectRes(#skill_effectCfg{effectType = Type} = EffectCfg, #recSkillEffect{} = RecEffect) ->
	P1 = EffectCfg#skill_effectCfg.param1,
	P2 = EffectCfg#skill_effectCfg.param2,
	P3 = EffectCfg#skill_effectCfg.param3,
	P4 = EffectCfg#skill_effectCfg.param4,
	P5 = EffectCfg#skill_effectCfg.param5,
	P6 = EffectCfg#skill_effectCfg.param6,
	case Type of
		?ADDBUFF ->  
			%%创建buff
			createBuff(RecEffect, [P1, P2, P3, P4, P5, P6]);
		?REMOVEBUFFSTATE ->
			%%移除指定buff
			[playerBuff:delBuffByState(State) || State <- [P1, P2, P3, P4, P5, P6]];
		?RANDOMREMOVEBUFF ->
			%%随机移除buff
			playerBuff:delBuff(P1, P2);
		?CALLMONSTER ->
			%%召唤怪物
			callMonster(RecEffect, P1, P2, P3, P4, P5, P6);
		?TELEPORTSPRINT ->
			%%瞬移冲刺
			skip;
		?STRONGENMITY ->
			%%人物不支持强拉仇恨
			skip;
		?GRABTARGET ->
			%%抓取目标
			Status = playerState:getStatus(),
			case misc:testBit(Status, ?CreatureSpecStautsImmune) of
				true ->
					skip;
				_ ->
					grabTarget(P1, P2, RecEffect)
			end;
		?CALLPET ->
			%%召唤宠物
			callPet(RecEffect, P1, P2, P3, P4);
		?TRIGGERSKILL ->
			%%触发瞬移技能(后续功能)
			skip;
		?HURTRETRUNBLOOD ->
			%%技能伤害比例回血
			backBlood(P1, RecEffect#recSkillEffect.targetDamageList);
		?ENERGYVALUE ->
			%%获得能量值
			modifyEnergy(P1, P2);
		?CURRECTNOWHP ->
			%%修正当前生命值
			modifyHp(P1, P2);
		?CURRECTNOWMP ->
			%%修正当前魔法值(功能已废除)
			modifyMp(P1, P2); 
		?CARRIERSKILL ->
			%%载体技能
			createCarrier(RecEffect, P1, P2, P3, P4, P5, P6);
		?BEATBACK ->
			%%击退
			Status = playerState:getStatus(),
			case misc:testBit(Status, ?CreatureSpecStautsImmune) of
				true ->
					skip;
				_ ->
					beatBack(P1, RecEffect)
			end;
		?REDUCECD ->
			%%减少CD
			reduceCD(P1, P2, P3);
		?REMOVEBUFF ->
			%%移除指定BUFF
			[playerBuff:delBuff(BuffID) || BuffID <- [P1, P2, P3, P4, P5, P6]];
		?COURAGEVALUE ->
			%%怒气值
			modifyCourage(P1);
		?CONTROLEFFECT ->
			sepcEffect(P1, P2, P3, RecEffect);
		_ ->
			skip
	end,
	ok.

%%过滤针对自己加一次效果
-spec filterEffect(EffectList) -> list() when
       EffectList :: list().
filterEffect(EffectList) ->
	Fun = fun(#skill_effectCfg{iD = ID, effectTarget = Target}) ->
				  if
					  Target =/= ?TargetToMyselfOne ->
						  true;
					  true ->
						  case isHasEffect(ID) of
							  true ->
								  false;
							  _ -> 
								  true
						  end
				  end
		  end,
	lists:filter(Fun, EffectList).

%%增加被动技能产生效果
-spec addPassEffect(SkillID, Level) -> ok when
		  SkillID :: uint(),
          Level :: uint().
addPassEffect(SkillID, Level) ->
	?DEBUG_OUT("addPassEffect(~p,~p)",[SkillID, Level]),
	IntervalTime = playerState:getFinalAttackIntervalTime(),
	EffIDList = effect:getTriEffIDList(SkillID, IntervalTime),
	[AEffectList, _BEffectList] = effect:skillEffect([], EffIDList, true),
	addPassEffect(SkillID, Level, AEffectList).

addPassEffect(_SkillID, _Level,  []) ->
	ok;
addPassEffect(SkillID, Level, [#skill_effectCfg{
												effectType = ?ADDBUFF, 
												param1 = P1, 
												param2 = P2,
												param3 = P3,
												param4 = P4,
												param5 = P5,
												param6 = P6
											   } | List]) ->
	Fun = fun(BuffID) ->
				  case BuffID =/= 0 of
					  true ->
						  playerBuff:addBuff(BuffID, Level);
					  _ ->
						  skip
				  end
		  end,
	lists:foreach(Fun, [P1,P2,P3,P4,P5,P6]),		  
	addPassEffect(SkillID, Level, List);
addPassEffect(_SkillID, _Level, _) ->
	ok.

%%移除被动技能产生效果
-spec delPassEffect(SkillID) -> ok when
		  SkillID :: uint().
delPassEffect(SkillID) ->
	IntervalTime = playerState:getFinalAttackIntervalTime(),
	EffIDList = effect:getTriEffIDList(SkillID, IntervalTime),
	[AEffectList, _BEffectList] = effect:skillEffect([], EffIDList, true),
	delPassEffect(SkillID, AEffectList).

delPassEffect(_SkillID, []) ->
	ok;
delPassEffect(SkillID, [#skill_effectCfg{
										 effectType = ?ADDBUFF, 
										 param1 = P1, 
										 param2 = P2,
										 param3 = P3,
										 param4 = P4,
										 param5 = P5,
										 param6 = P6
										} | List]) ->
	Fun = fun(BuffID) ->
				  case BuffID =/= 0 of
					  true ->
						  playerBuff:delBuff(BuffID);
					  _ ->
						  skip
				  end
		  end,
	lists:foreach(Fun, [P1,P2,P3,P4,P5,P6]),	
	delPassEffect(SkillID, List);
delPassEffect(_SkillID, _) ->
	ok.		

%% ====================================================================
%% API functions
%% ====================================================================

%%创建buff
-spec createBuff(RecEffect, List) -> ok when
		  RecEffect :: #recSkillEffect{},
          List :: [uint(),...].
createBuff(_RecEffect, []) ->
	ok;
createBuff(RecEffect, [BuffID | List]) when BuffID > 0 ->
	playerBuff:addBuff(BuffID, RecEffect),
	createBuff(RecEffect, List);
createBuff(RecEffect, [_BuffID | List]) ->
	createBuff(RecEffect, List).

%%修正生命值
-spec modifyHp(Num, Percent) -> ok when 
       Num :: uint(),
       Percent :: uint().
modifyHp(Num, Percent) ->
	Hp = playerState:getCurHp(),
	MaxHp = playerState:getMaxHp(),
	ModifyValue = Num + Percent * MaxHp,
	case ModifyValue > 0 of
		true ->
			ModifyHp = ModifyValue;
		_ ->
			ModifyHp = ModifyValue
	end,
	NewHp = erlang:trunc(misc:clamp(Hp + ModifyHp, 0, MaxHp)),
	playerBattle:noticeBlood(NewHp, Hp),
	playerState:setCurHp(NewHp).
	

%%修正魔法值
-spec modifyMp(Num, Percent) -> ok when 
       Num :: uint(),
       Percent :: uint().
modifyMp(Num, Percent) ->
%%	Mp = playerState:getCurMp(),
%%	MaxMp = playerState:getBattlePropTotal(?Prop_mana),
%%	NewMp = Mp + Num + Percent * MaxMp,
%%	playerState:setCurMp(NewMp),
	ok.

%%获取能量值
-spec modifyEnergy(Type, Num) -> ok when 
       Type :: uint(),
       Num :: uint().
modifyEnergy(Type, Num) ->
	Carrer = playerState:getCareer(),
	modifyEnergy(Type, Num, Carrer).
modifyEnergy(Type, Num, Carrer) when Carrer =:= Type ->
	PowerEnergy = playerBase:getSpecBattlePropPower(),
	MaxEnergy = playerBase:getMaxSpecBattlePropPower(),
	CurEnergy = misc:clamp(Num + PowerEnergy, 0, MaxEnergy), 
	playerBase:setSpecBattlePropPower(CurEnergy),
	playerBase:sendPropSp(trunc(CurEnergy), trunc(PowerEnergy));
modifyEnergy(_, _, _) ->
	ok.

%%获取怒气值
-spec modifyCourage(Num) -> ok when
	Num :: uint().
modifyCourage(Num) ->
	OldCourage = playerState:getPlayerCourage(),
	CurCourage = misc:clamp(OldCourage + Num, 0, playerSkill:getMaxCourage()),
	playerState:setPlayerCourage(CurCourage),
	playerBase:sendPropCour(CurCourage),
	ok.

%%特殊效果
-spec sepcEffect(BuffID::uint(), PropID::uint(), Prob::uint(), #recSkillEffect{}) -> ok.
sepcEffect(BuffID, PropID, Prob, #recSkillEffect{attackerProp = BattleProp} = Rec) ->
	ok.
%%	IsAddBuff =
%%	case PropID of
%%		?Prop_sleepprob ->
%%			TargetNum = buff:getPropValue(?Prop_sleepprob, BattleProp),
%%			SourceNum = playerState:getBattlePropTotal(?Prop_sleepimmunity),
%%			buff:calcProb(TargetNum + Prob - SourceNum);
%%		?Prop_freezerprob ->
%%			TargetNum = buff:getPropValue(?Prop_freezerprob, BattleProp),
%%			SourceNum = playerState:getBattlePropTotal(?Prop_freezeimmunity),
%%			buff:calcProb(TargetNum + Prob - SourceNum);
%%		?Prop_slowdownprob ->
%%			TargetNum = buff:getPropValue(?Prop_slowdownprob, BattleProp),
%%			SourceNum = playerState:getBattlePropTotal(?Prop_slowdownimmunity),
%%			buff:calcProb(TargetNum + Prob - SourceNum)
%%	end,
%%	case IsAddBuff of
%%		true ->
%%			playerBuff:addBuff(BuffID, Rec);
%%		_ ->
%%			skip
%%	end.

%%召唤宠物
-spec callPet(RecEffect, PetID, MaxNum, Time, CallNum) -> ok when
	   RecEffect :: #recSkillEffect{},
       PetID :: uint(),
       MaxNum :: uint(),
       Time :: uint(),
       CallNum :: uint().
callPet(RecEffect, PetID, MaxNum, Time, CallNum) ->
	{X, Y} = playerState:getPos(),
	Level = playerState:getLevel(),
    #petCfg{petName = PetName} = getCfg:getCfgPStack(cfg_pet, PetID),
    PetArg = #recSpawnPet{
        caster_code = RecEffect#recSkillEffect.attackerCode,
        caster_pkmode = RecEffect#recSkillEffect.attackerPkMode,
        caster_id = RecEffect#recSkillEffect.attackerID,
        caster_name = RecEffect#recSkillEffect.attackerName,
        caster_pid = RecEffect#recSkillEffect.attackerPid,
        caster_type = ?AttackerTypePlayer,
        pet_status = ?CreatureActionStatusStand,
        pet_mapid = playerState:getMapID(),
        pet_mapPid = playerState:getMapPid(),
        pet_props = playerPet:makeSkillPetProp(PetID, Level),
        pet_level = Level,
        pet_name = PetName,
        pet_id = PetID,
        pet_x = X,
        pet_y = Y,
        pet_skills = [],
        pet_other = [Time, ?CallPetTypeSkill],
        pet_petEts = playerState:getMapPetEts(),
        pet_playerEts = playerState:getMapPlayerEts(),
        pet_monsterEts = playerState:getMapMonsterEts(),

        pet_camp = RecEffect#recSkillEffect.attackerCamp,
        pet_teamID = RecEffect#recSkillEffect.attackerTeamID,
        pet_guildID = RecEffect#recSkillEffect.attackerGuildID,
        pet_groupID = RecEffect#recSkillEffect.attackerGroupID
    },
	
	callPet1(PetID, MaxNum, CallNum, PetArg).

-spec callPet1(PetID, MaxNum, CallNum, PetArg) -> ok when
	   PetID :: uint(),
       MaxNum :: uint(),
       CallNum :: uint(),
       PetArg :: #recSpawnPet{}.
callPet1(PetID, MaxNum, CallNum, PetArg) ->
	SkillPetList = playerPet:getSkillPet(),
	SamePetList = effect:getSameIDList(PetID, SkillPetList, []),
	AllNum = CallNum + length(SamePetList),
	if
		AllNum > MaxNum ->
			Fun = fun(#recCallPet{pet_code = Code}) ->
						  playerPet:clearSpawnPet(Code)
				  end,
			lists:foreach(Fun, lists:sublist(SamePetList, AllNum - MaxNum));
		true ->
			skip
	end,
	Fun1 = fun(_Index) ->
				   playerPet:spawnPet(PetArg)
		   end,
	lists:foreach(Fun1, lists:seq(1, CallNum)).
               
%%伤害回血
-spec backBlood(Percent, RealDamageList) -> ok when 
       Percent :: uint(),
       RealDamageList :: list().
backBlood(Percent, RealDamageList) ->
	Hp = playerState:getCurHp(),
	MaxHp = playerState:getMaxHp(),
	Fun = fun(Damage, Acc) ->
				  Acc + Damage
		  end,
	TotalDamage = lists:foldl(Fun, 0, RealDamageList),
	GetHealtFactor = playerState:getBattlePropTotal(?Prop_GetHealthFactor),
	NewDamage = TotalDamage * Percent * GetHealtFactor,
	NewHp = erlang:trunc(misc:clamp(Hp + NewDamage, 0, MaxHp)),
	playerBattle:noticeBlood(NewHp, Hp),
	playerState:setCurHp(NewHp),
	ok.

%%召唤怪物
-spec callMonster(SkillEffect, MonsterID, MaxNum, Time, DiffX, DiffY, Num) -> ok when
       SkillEffect :: #recSkillEffect{},
       MonsterID :: uint(),
       MaxNum :: uint(),
       Time :: uint(),
		DiffX :: float(),
	    DiffY :: float(),
       Num :: uint().
callMonster(SkillEffect, MonsterID, MaxNum, Time, DiffX, DiffY, Num) ->
	PetEts = playerState:getMapPetEts(),
	PlayerEts = playerState:getMapPlayerEts(),
	MonsterEts = playerState:getMapMonsterEts(),
	MapPID = playerState:getMapPid(),
	MapID = playerState:getMapID(),
	{PosX, PosY} = playerState:getPos(),
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
        mapPid = MapPID,
        mapID = MapID,
        x = PosX + DiffX,
        y = PosY + DiffY,
        camp = SkillEffect#recSkillEffect.attackerCamp,
        teamID = SkillEffect#recSkillEffect.attackerTeamID,
        guildID = SkillEffect#recSkillEffect.attackerGuildID,
        groupID = SkillEffect#recSkillEffect.attackerGroupID,
        other = #recCallMonster{lifeTime = Time, callCaster = CasterInfo},
        petEts = PetEts,
        playerEts = PlayerEts,
        monsterEts = MonsterEts
    },
	callMonster1(MonsterID, CallMonsterList, MaxNum, Num, Arg, CasterInfo).

-spec callMonster1(MonsterID, CallMonsterList, MaxNum, CallNum, Arg, CasterInfo) -> ok when
	   MonsterID :: uint(),
	   CallMonsterList :: list(),
       MaxNum :: uint(),
       CallNum :: uint(),
       Arg :: #recSpawnMonster{},
       CasterInfo :: #recCasterInfo{}.
callMonster1(MonsterID, CallMonsterList, MaxNum, CallNum, Arg, CasterInfo) ->
	SameMonsterList = effect:getSameIDList(MonsterID, CallMonsterList, []),
	AllNum = CallNum + length(SameMonsterList),
	if
		AllNum > MaxNum ->
			Fun = fun({Code, _ID, _Pid}) ->
						  delCallInfo(?SpawnCallMonster, Code, CasterInfo),
						  playerPet:clearSpawn(Code)
				  end,
			lists:foreach(Fun, lists:sublist(SameMonsterList, AllNum - MaxNum));
		true ->
			skip
	end,
	Fun1 = fun(_Index) ->
				playerPet:spawnMonster(Arg)
		   end,
	lists:foreach(Fun1, lists:seq(1, CallNum)).

%%抓取目标(被攻击者进程)
-spec grabTarget(GrabType, Dist, RecEffect) -> ok when
       GrabType :: uint(),
       Dist :: uint(),
       RecEffect :: #recSkillEffect{}.
grabTarget(GrabType, Dist, RecEffect) ->
	%%中断技能
	playerSkill:breakUseSkill(true),
	PlayerEts = playerState:getMapPlayerEts(),
	SelfCode = playerState:getPlayerCode(),
	%%获取对象
	Attack =
		case GrabType of
			0 ->
				playerSkill:getObject(RecEffect#recSkillEffect.attackerCode);
			_ ->
				playerSkill:getObject(RecEffect#recSkillEffect.targetMainCode)
		end,
	case Attack of
		#recMapObject{} ->
			TX = Attack#recMapObject.x,
			TY = Attack#recMapObject.y,
			BodyR = mapView:getObjBodyR(Attack#recMapObject.type,Attack#recMapObject.id),
			{X,Y} = playerState:getPos(),
			DX = TX - X,
			DY = TY - Y,
			L = math:sqrt(DX * DX + DY * DY),
			{NX,NY} = 
				case  L > Dist + BodyR of
					true ->
						NewX = X + DX / L * (L - Dist - BodyR),
						NewY = Y + DY / L * (L - Dist - BodyR),
						{NewX,NewY};
					false ->
						{X,Y}
				end,
			playerState:setPos(NX,NY),
			EffectMsg = #pk_GS2U_AttackOffsetEffect{
													userCode = RecEffect#recSkillEffect.attackerCode,
													targetCode = RecEffect#recSkillEffect.targetCode,
													serial = RecEffect#recSkillEffect.serial,
													skillId = RecEffect#recSkillEffect.skillID,
													code = SelfCode,
													x = NX,
													y = NY
												   },
			mapView:sendMsg2NearPlayerByPos(playerState:getMapPid(),PlayerEts,EffectMsg,X,Y,playerState:getGroupID()),
			?DEBUG_OUT("player [~p] grabTarget dist ~p",[SelfCode,[X,Y,NX,NY]]);
		_ ->
			skip
	end,
	ok.

%%击退(被攻击者进程)
-spec beatBack(Dist, RecEffect) -> ok when
       Dist :: uint(),
       RecEffect :: #recSkillEffect{}.
beatBack(Dist, RecEffect) ->
	%%中断技能
	playerSkill:breakUseSkill(true),
	PlayerEts = playerState:getMapPlayerEts(),
	SelfCode = playerState:getPlayerCode(),
	%%获取攻击者对象
	Acttack = playerSkill:getObject(RecEffect#recSkillEffect.attackerCode),
	TX = Acttack#recMapObject.x,
	TY = Acttack#recMapObject.y,
	{X,Y} = playerState:getPos(),
	if
		TX == X andalso TY == Y ->
			{DX,DY} = {0.5, 0.5};  
		true ->
			{DX,DY} = {TX - X, TY - Y}
	end,
	L = math:sqrt(DX * DX + DY * DY),
   {RX, RY} = isBlock(X, Y, DX, DY, L, Dist, X, Y, 0),
	playerState:setPos(RX,RY),
	EffectMsg = #pk_GS2U_AttackOffsetEffect{
											userCode = RecEffect#recSkillEffect.attackerCode,
											targetCode = RecEffect#recSkillEffect.targetCode,
											serial = RecEffect#recSkillEffect.serial,
											skillId = RecEffect#recSkillEffect.skillID,
											code = SelfCode,
											x = RX,
											y = RY
										   },
	mapView:sendMsg2NearPlayerByPos(playerState:getMapPid(),PlayerEts,EffectMsg,X,Y,playerState:getGroupID()),
	ok.

%%减少CD
-spec reduceCD(SkillID, ReduceTime, MinTime) -> ok when
		  SkillID :: uint(),
          ReduceTime :: uint(),
          MinTime :: uint().
reduceCD(SkillID, ReduceTime, MinTime) ->
	Time = time:getUTCNowMSDiff2010(),
	SkillCDList = playerState:getSkillCD(),
	case lists:keyfind(SkillID, 1, SkillCDList) of
		{SkillID, CD} ->
			RemainCD = CD - Time,
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
					NewSkillCDList = lists:keyreplace(SkillID, 1, SkillCDList, {SkillID, Time + CurCD}),
					playerState:setSkillCD(NewSkillCDList),
					noticeSkillCD(SkillID, CurCD)
			end;
		_ ->
			skip
	end,
	ok.

-spec isBlock(X, Y, DX, DY, L, Dist, X1, Y1, SDist) -> {X,Y} when
	X::float(),Y::float(),DX::float(),DY::float(),L::number(),Dist::number(),X1::float(),Y1::float(),SDist::number().
isBlock(X, Y, _DX, _DY, _L, Dist, _X1, _Y1, Dist) ->
	{X, Y};
isBlock(X, Y, DX, DY, L, Dist, X1, Y1, SDist) ->
	NewX = X1 - DX / L * (SDist + 1),
	NewY = Y1 - DY / L * (SDist + 1),
	MapID = playerState:getMapID(),
	case mapView:isBlock(MapID,NewX, NewY) of
		true ->
			{X, Y};
		_ ->
			isBlock(NewX, NewY, DX, DY, L, Dist, X1, Y1, SDist + 1)
	end.

%%载体技能
-spec createCarrier(SkillEffect, CarrierID, Pos, MaxNum, Time, IsRelease, Num) -> ok when
       SkillEffect :: #recSkillEffect{},
       CarrierID :: uint(),
       Pos :: uint(),
       MaxNum :: uint(),
       Time :: uint(),
       IsRelease :: uint(),
       Num :: uint().
createCarrier(SkillEffect, CarrierID, Pos, MaxNum, Time, IsRelease, Num) ->
	PetEts = playerState:getMapPetEts(),
	PlayerEts = playerState:getMapPlayerEts(),
	MonsterEts = playerState:getMapMonsterEts(),
	{X, Y} = playerState:getPos(),
	CallCarrierList = SkillEffect#recSkillEffect.callCarrierList,
	AttackerProp = SkillEffect#recSkillEffect.attackerProp,
	TargetCode = SkillEffect#recSkillEffect.targetCode,
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
        id = CarrierID,
        mapPid = playerState:getMapPid(),
        mapID = playerState:getMapID(),
        x = X,
        y = Y,
        petEts = PetEts,
        camp = SkillEffect#recSkillEffect.attackerCamp,
        teamID = SkillEffect#recSkillEffect.attackerTeamID,
        guildID = SkillEffect#recSkillEffect.attackerGuildID,
        groupID = SkillEffect#recSkillEffect.attackerGroupID,
        playerEts = PlayerEts,
        monsterEts = MonsterEts,
        other = RecCallCarrier
    },
	createCarrier1(CarrierID, CallCarrierList, MaxNum, Num, Arg, CasterInfo).

-spec createCarrier1(CarrierID, CallCarrierList, MaxNum, CallNum, Arg, CasterInfo) -> ok when
	   CarrierID :: uint(),
	   CallCarrierList :: list(),
       MaxNum :: uint(),
       CallNum :: uint(),
       Arg :: #recSpawnMonster{},
       CasterInfo :: #recCasterInfo{}.
createCarrier1(CarrierID, CallCarrierList, MaxNum, CallNum, Arg, CasterInfo) ->
	SameCarrierList = effect:getSameIDList(CarrierID, CallCarrierList, []),
	AllNum = CallNum + length(SameCarrierList),
	if
		AllNum > MaxNum ->
			Fun = fun({Code, _ID, _Pid}) ->
						delCallInfo(?SpawnCarrier, Code, CasterInfo),
						playerPet:clearSpawn(Code)
				  end,
			lists:foreach(Fun, lists:sublist(SameCarrierList, AllNum - MaxNum));
		true ->
			skip
	end,
	Fun1 = fun(_Index) ->
					playerPet:spawnCarrier(Arg)
		   end,
	lists:foreach(Fun1, lists:seq(1, CallNum)).

%%判断当前效果是否已经生效
-spec isHasEffect(Id) -> boolean() when
       Id :: uint().
isHasEffect(Id) ->
	EffectList = playerState:getCurUseSkillEffect(),
	case  lists:member(Id, EffectList) of
		true ->
			true;
		_->
			NewEffectList = [Id | EffectList],
			playerState:setCurUseSkillEffect(NewEffectList),
			false
	end.

%%通知客服端技能CD缩短
-spec noticeSkillCD(SkillID, CD) -> ok when
		  SkillID :: uint(),
          CD :: uint().
noticeSkillCD(SkillID, CD) ->
	SkillCD = #pk_GS2U_ReduceCD{skillId = SkillID, cd = CD},
	playerMsg:sendNetMsg(SkillCD).

%%通知召唤者统计载体或者召唤怪物信息
-spec addCallInfo(CodeType, Code, ID, PID) -> ok | skip when
		  CodeType :: ?SpawnCarrier | ?SpawnCallMonster | ?SpawnMonster | ?SpawnPet | ?SpawnCallPet,
          Code :: uint(),
          ID :: uint(),
          PID :: pid().
addCallInfo(?SpawnCarrier, Code, CarrierID, CarrierPid) ->
	List = playerState:getCallCarrierList(),
	NewList = lists:keystore(Code, 1, List, {Code, CarrierID, CarrierPid}),
	playerState:setCallCarrierList(NewList);
addCallInfo(?SpawnCallMonster, Code, MonsterID, MonsterPid) ->
	List = playerState:getCallMonsterList(),
	NewList = lists:keystore(Code, 1, List, {Code, MonsterID, MonsterPid}),
	playerState:setCallMonsterList(NewList);
addCallInfo(_, _, _, _) ->
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
delCallInfo(?SpawnCarrier, Code, _) ->
	List = playerState:getCallCarrierList(),
	NewList = lists:keydelete(Code, 1, List),
	playerState:setCallCarrierList(NewList);
delCallInfo(?SpawnCallMonster, Code, _) ->
	List = playerState:getCallMonsterList(),
	NewList = lists:keydelete(Code, 1, List),
	playerState:setCallMonsterList(NewList);
delCallInfo(_, _, _) ->
	skip.
