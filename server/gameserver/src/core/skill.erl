%% @author zhongyunawei
%% @doc @todo 技能相关.


-module(skill).
-author(zhongyuanwei).

-include("gsInc.hrl").


%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 isCallSkill/1,
		 isBreakSkill/1,
		 is2ndGuideSkill/1,
		 isTriggerSkill/1,
		 isTriggerByPossible/2,
		 isTriggerBySkillType/2,
		 isTriggerByAttackType/2,
		 isTriggerByAttackResult/2,
		 getTriSkillCode/2,
		 getAttackTypeBit/1,
		 getAttackType/3,
		 clacAttackTargetNum/3,
		 calcUserSkillDamage/5,
		 calcUserSkillTreat/2,
%%		 calcTargetTotalDamage/5,
%%		 calcTargetTotalDamageFix/4,
		 getTargetByCode/4,
		 getAOETarget/10,
		 getTriggerTime/4,
		 getSkillParam/4,
		 getMinDamageArg/0,
		 getMaxDamageArg/0,
		 getDashPhys/1,
		 getDashDisc/1,
		 getDashCD/1,
		 getPercent/2,
		 getSlotOpenLevel/1
		]).


%%判断触发技能是否触发技能通过概率
-spec isTriggerByPossible(EffChance, InterValTime) -> boolean() when
       EffChance :: float(),
	   InterValTime :: uint().
isTriggerByPossible(0.0, _InterValTime) ->
	false;
isTriggerByPossible(1.0, _InterValTime) ->
	true;
isTriggerByPossible(EffChance, _InterValTime) when EffChance > 0 andalso EffChance < 1 ->
	RandomNum = random:uniform(?PROBALITY_WEIGHT), 
	if
		EffChance * ?PROBALITY_WEIGHT > RandomNum ->
			true;
		true -> 
			false
	end;
isTriggerByPossible(EffChance, InterValTime) when EffChance > 1 ->
	EffChance1 = EffChance * InterValTime / 60000,
	if
		EffChance1 >= 1 ->
			true;
		true -> 
			isTriggerByPossible(EffChance1, InterValTime)
	end;
isTriggerByPossible(_EffChance, _InterValTime) ->
	false.

%%根据调用技能类型是否触发技能
-spec isTriggerBySkillType(Type, Cond) -> boolean() when
	   Type :: uint(),
       Cond :: uint().
isTriggerBySkillType(?BuffCallSkill, ?SkillTrigger) ->
	false;
isTriggerBySkillType(_, ?SkillTrigger) ->
	true;
isTriggerBySkillType(_Type, _) ->
	true.

%%根据攻击方式判定是否触发技能
-spec  isTriggerByAttackType(AttackType, Cond) -> boolean() when
        AttackType :: uint(),
        Cond :: uint().
isTriggerByAttackType(_, 0) ->
	true;
isTriggerByAttackType(AttackType, Cond) ->
	case misc:testBit(AttackType, Cond) of
		true ->
			true;
		_ ->
			false
	end.

%%根据攻击结果判定是否触发技能
-spec isTriggerByAttackResult(Hit, HitList) -> boolean() when
       Hit :: uint(),
       HitList :: list().
isTriggerByAttackResult(_Hit, []) ->
	false;
isTriggerByAttackResult(Hit, [NewHit | HitList]) ->
	case misc:testBit(NewHit, Hit) of
		true ->
			true;
		_ ->
			isTriggerByAttackResult(Hit, HitList)
	end.

%%是否是触发技能
-spec isTriggerSkill(SkillID) -> boolean() when
		 SkillID :: uint().
isTriggerSkill(SkillID) ->
	#skillCfg{skillType = SkillType} = getCfg:getCfgPStack(cfg_skill, SkillID),
	if
		SkillType =:= ?AttackTriggerSkill ->
			true;
		SkillType =:= ?NoAttackTriggerSkill ->
			true;
		SkillType =:= ?BeAttackTriggerSkill ->
			true;
		SkillType =:= ?ReleaseTriggerSkill ->
			true;
		SkillType =:= ?DeadTriggerSkill ->
			true;
		SkillType =:= ?AssistTriggerSkill ->
			true;
		true ->
			false
	end.

%%是否打断吟唱或者引导技能
-spec isBreakSkill(SkillID) -> boolean() when
		  SkillID :: uint().
isBreakSkill(SkillID) ->
	#skillCfg{
			  moveBreak = MoveBreak
			 } = getCfg:getCfgPStack(cfg_skill, SkillID),
	case MoveBreak of
		1 ->
			false;
		_ ->
			true
	end.

%%是否是buff调用技能
-spec isCallSkill(SkillID) -> boolean() when
		  SkillID :: uint().
isCallSkill(SkillID) ->
	#skillCfg{skillType = SkillType} = getCfg:getCfgPStack(cfg_skill, SkillID),
	if
		SkillType =:= ?BuffCallSkill ->
			true;
		true ->
			false
	end.

%%是否为第二种引导技能
-spec is2ndGuideSkill(SkillID) -> boolean() when
	SkillID::skillId().
is2ndGuideSkill(SkillID) ->
	case getCfg:getCfgPStack(cfg_skill, SkillID) of
		#skillCfg{castStep = CastStep} ->
			CastStep =:= 1;
		_ ->
			false
	end.

%%获取触发技能目标
-spec getTriSkillCode(SkillID, TargetCode) -> uint() when
       SkillID :: uint(),
       TargetCode :: uint().
getTriSkillCode(SkillID, TargetCode) ->
	#skillCfg{triggerTarget = Target} = getCfg:getCfgPStack(cfg_skill, SkillID),
	getTriSkillCode(Target, SkillID, TargetCode).
getTriSkillCode(?RandomTarget, _SkillID, _TargetCode) ->
	0;
getTriSkillCode(?SelectTarget, _SkillID, TargetCode) ->
	TargetCode;
getTriSkillCode(?RandomTarget1, _SkillID, _TargetCode) ->
	0;
getTriSkillCode(?SelectTarget1, _SkillID, TargetCode) ->
	TargetCode.

%%获取技能攻击类型(转换位运算)
-spec getAttackTypeBit(Aggress::uint()) -> uint().
getAttackTypeBit(?NoAttack) ->
	1;
getAttackTypeBit(?NearAttack) ->
	2;
getAttackTypeBit(?FarAttack) ->
	4;
getAttackTypeBit(_) ->
	8.

%%获取攻击类型
-spec getAttackType(Code, IsCarrier, ID) -> uint() when
	ID :: uint(),
	Code::uint(),
    IsCarrier :: #recCasterInfo{} | false.
getAttackType(_Code, #recCasterInfo{casterType = Type}, _ID) ->
	Type;
getAttackType(Code, false, ID) ->
	case codeMgr:getObjectTypeByCode(Code) of
		?ObjTypePlayer ->
			?AttackerTypePlayer;
		?ObjTypeMonster ->
			case battle:isBoss(?SpawnMonster, ID) of
				true ->
					?AttackerTypeBoss;
				_ ->
					?AttackerTypeNormalMonster
			end;
		?ObjTypePet ->
			?AttackerTypePet;
		_ ->
			throw(badAttacker)
	end.

%%根据Code获取对应的且血量大于0的对象
-spec getTargetByCode(EtsList,SrcCode,TargetCode,SkillRange) -> [#recMapObject{}] | uint() when
       EtsList :: list(),
       SrcCode :: uint(),
       TargetCode :: uint(),
       SkillRange :: uint().
getTargetByCode(EtsList,SrcCode,TargetCode,SkillRange) ->
	case mapView:getObjectDist(EtsList, SrcCode, TargetCode) of
		{ok,Dist, #recMapObject{groupID = SrcGroupID}, #recMapObject{hp = DstHp,status = Status, groupID = GroupID} = Target} ->
			if
				DstHp =< 0 ->
					?ErrorCode_UseSkillErrorTargetDead;
				Dist > SkillRange ->
					?ErrorCode_UseSkillErrorTargetDist;
				SrcGroupID =/=  GroupID->
					?ErrorCode_UseSkillErrorTarget;
				true ->
					case misc:testBit(Status,?CreatureSpeStautsBlur) of
						true ->
							?ErrorCode_UseSkillErrorBlur;
						_ ->
							Target
					end
			end;
		_ ->
			?ErrorCode_UseSkillErrorNoTarget
	end.

%%根据技能范围选择攻击目标
-spec getAOETarget(SelfCode,{Sx,Sy},{DirX,DirY},PlayerEts,MonsterEts, PetEts, SkillID,Target,MyTeam,KillList) -> list() when
		    SelfCode :: uint(), 
            Sx :: float(),
            Sy :: float(),
            DirX :: float(),
            DirY :: float(),
			PlayerEts :: etsTab(),
            MonsterEts :: etsTab(),
            PetEts :: etsTab(),
            SkillID :: skillId(),
            Target :: #recMapObject{},
            MyTeam :: #rec_team{},
            KillList :: list().
getAOETarget(SelfCode,{Sx,Sy},{DirX,DirY},PlayerEts,MonsterEts,PetEts,SkillID,
			 #recMapObject{} = Target, MyTeam, KillList) ->
	SkillCfg = getCfg:getCfgPStack(cfg_skill, SkillID),
	Flag1 = lists:member(SkillCfg#skillCfg.targetSearch, ?SkillAOETypeCircle), 
	Flag2 = lists:member(SkillCfg#skillCfg.targetSearch, ?SkillAOETypeSector), 
	Flag3 = lists:member(SkillCfg#skillCfg.targetSearch, ?SkillAOETypeRect),
	Self = mapView:getMapObjectFromEts(SelfCode, {PlayerEts, MonsterEts, PetEts}),
	List = 
		if
			Flag1 =:= true ->  
				getCircleAoeTarget(PlayerEts,MonsterEts,PetEts,SkillCfg#skillCfg.aoeRange,Target);
			Flag2 =:= true -> 
				AoeRange = SkillCfg#skillCfg.aoeRange,
				AoeAngle = SkillCfg#skillCfg.aoeAngle,
				Dist = SkillCfg#skillCfg.ranger + AoeRange,
				getSectorAoeTarget(Self,{Sx,Sy},{DirX,DirY},PlayerEts,MonsterEts,PetEts,Dist,AoeAngle,Target);
			Flag3 =:= true -> 
				Width = SkillCfg#skillCfg.aoeAngle,
				Height = SkillCfg#skillCfg.aoeRange + SkillCfg#skillCfg.ranger, 
				getRectAoeTarget(Self,{Sx,Sy},{DirX,DirY},PlayerEts,MonsterEts,PetEts,Width,Height,Target);
			true ->
				[]
		end,
	camp:filterTarget(SkillID, MyTeam, KillList, Self, List).

%%计算乱影技能目标分配次数
-spec clacAttackTargetNum(SkillRan, DefaultNum, TargetList) -> list() when
		  SkillRan :: uint(),
          DefaultNum :: uint(),
          TargetList :: list().
clacAttackTargetNum(?SkillRan, DefaultNum, TargetList) ->
	ListLen = length(TargetList),
	case DefaultNum > ListLen of
		true ->
			DivArg = DefaultNum div ListLen,
			RemArg = DefaultNum - DivArg * ListLen,
			[{true, Target, DivArg + 1} || Target <- lists:sublist(TargetList, RemArg)] ++
				[{true, Target, DivArg} || Target <- lists:sublist(TargetList, RemArg + 1, ListLen)]; 
		_ ->
			[{true, Target, 1} || Target <- lists:sublist(TargetList, DefaultNum)] ++
				[{true, Target, 0} || Target <- lists:sublist(TargetList, DefaultNum + 1, ListLen)]
	end;
clacAttackTargetNum(_, _DefaultNum, TargetList) ->
	[{false, Target, 0} || Target <- TargetList].

%%计算技能产生的伤害
-spec calcUserSkillDamage(#recSkill{}, #recDamage{}, FactorValue::number(), Prop_master::number(), InternalTime::uint()) -> {boolean(), #recSkill{}}.
calcUserSkillDamage(#recSkill{damagePlus = DamagePlus, damageMultiply = DmageMultiply} = Skill, #recDamage{} = SkillDamage, _FactorValue, _Prop_master, _InternalTime) ->
	#skillCfg{damageType = DamageType} = getCfg:getCfgPStack(cfg_skill, Skill#recSkill.skillID),
	BasicDamage =
		case DamageType =:= ?SkillDamageTypePhys of
		true ->
			SkillDamage#recDamage.physDamage;
		_ ->
			SkillDamage#recDamage.magicDamage
	end,
	Damage = BasicDamage * DmageMultiply + DamagePlus,
%%	?DEBUG_OUT("skill id=~p, basic=~p, total=~p, mult/plus=~p/~p",[Skill#recSkill.skillID, BasicDamage, Damage, DmageMultiply, DamagePlus]),
	{true,Skill#recSkill{isModified = true, damage = Damage}}.

%%计算技能回血治疗
-spec calcUserSkillTreat(#recSkill{},#recDamage{}) -> {boolean(),#recSkill{}}.
calcUserSkillTreat(#recSkill{damagePlus = DamagePlus, damageMultiply = DmageMultiply} = Skill, #recDamage{} = SkillDamage) ->
	#skillCfg{damageType = DamageType} = getCfg:getCfgPStack(cfg_skill, Skill#recSkill.skillID),
	case DamageType =:= ?SkillDamageTypePhys of
		true ->
			Damage = SkillDamage#recDamage.physDamage * DmageMultiply + DamagePlus;
		_ ->
			Damage = SkillDamage#recDamage.magicDamage * DmageMultiply + DamagePlus
	end,
	{true, Skill#recSkill{isModified = true, damage = Damage}}.
%%
%%%%根据攻击者的伤害计算目标未修正的总伤害
%%%%后面需要根据攻击者与被攻击者的情况进行总伤害的修正
%%-spec (ALevel, RAD, SkillDamage, IsMainTarget, SecTarget) -> number() when
%%		  ALevel :: uint(),
%%          RAD :: #recResistAndDef{},
%%          SkillDamage :: #recDamage{},
%%          IsMainTarget :: boolean(),
%%          SecTarget :: float().
%%calcTargetTotalDamage(ALevel, RAD, SkillDamage, IsMainTarget, SecTarget) ->
%%	DefArg = getCfg:getCfgPStack(cfg_defRegent, ALevel),
%%
%%	Holyresist = RAD#recResistAndDef.holyresist,				%%神圣抗性
%%	Physicalresist = RAD#recResistAndDef.physicalresist,      	%%物理抗性
%%	Shadowresist = RAD#recResistAndDef.shadowresist,          	%%暗影抗性
%%	Elementresist =	RAD#recResistAndDef.elementresist,        	%%元素抗性
%%	Chaosresist = RAD#recResistAndDef.chaosresist,            	%%混乱抗性
%%
%%	_HolyDef = RAD#recResistAndDef.holyDef,						%%神圣防御
%%	PhysicalDef = RAD#recResistAndDef.physicalDef,      		%%物理防御
%%	_ShadowDef = RAD#recResistAndDef.shadowDef,          		%%暗影防御
%%	ElementDef = RAD#recResistAndDef.elementDef,       			%%元素防御
%%	ChaosDef = RAD#recResistAndDef.chaosDef,            		%%混乱防御
%%
%%	HolyDamage = SkillDamage#recDamage.magicDamage,					%%神圣伤害
%%	PhysDamage = SkillDamage#recDamage.physDamage,					%%物理伤害
%%	ShadowDamage = SkillDamage#recDamage.shadowDamage,				%%暗影伤害
%%	ElementDamage = SkillDamage#recDamage.elementDamage,			%%元素伤害
%%	ChaosDamage = SkillDamage#recDamage.chaosDamage,				%%混乱伤害
%%
%%	HolyDamage1 = HolyDamage * (1 - Holyresist) / (1 + ElementDef / DefArg#defRegentCfg.holyDefArg),
%%	PhysDamage1 = PhysDamage * (1 - Physicalresist) / (1 + PhysicalDef / DefArg#defRegentCfg.phyDefArg),
%%	ShadowDamage1 = ShadowDamage * (1 - Shadowresist) / (1 + ElementDef / DefArg#defRegentCfg.shadowDefArg),
%%	ElementDamage1 = ElementDamage * (1 - Elementresist) / (1 + ElementDef / DefArg#defRegentCfg.eleDefArg),
%%	ChaosDamage1 = ChaosDamage * (1 - Chaosresist) / (1 + ChaosDef / DefArg#defRegentCfg.chaosDefArg),
%%
%%	TotalDamage = misc:clamp(HolyDamage1, 0, HolyDamage1) +
%%					  misc:clamp(PhysDamage1, 0, PhysDamage1) +
%%					  misc:clamp(ShadowDamage1, 0, ShadowDamage1) +
%%					  misc:clamp(ElementDamage1, 0, ElementDamage1) +
%%					  misc:clamp(ChaosDamage1, 0, ChaosDamage1),
%%	case IsMainTarget of
%%		true ->
%%			TotalDamage;
%%		_ ->
%%			TotalDamage * SecTarget
%%	end.

%%%%计算伤害修正
%%-spec calcTargetTotalDamageFix(TargetTotalDamage,AttackerType,#recDamageFixArg{},TargetIsBoss) ->
%%		  FixedTargetTotalDamage when TargetTotalDamage::number(),AttackerType::number(),
%%			FixedTargetTotalDamage::number(),TargetIsBoss::boolean().
%%calcTargetTotalDamageFix(TargetTotalDamage,AttackerType,#recDamageFixArg{
%%																		 tough = Tough,
%%																		 defBoss = DefBoss,
%%																		 attackBoss = AttackBoss
%%																		},
%%						 TargetIsBoss) ->
%%	TargetTotalDamage1 = case AttackerType of
%%							 ?AttackerTypePlayer ->
%%								 TargetTotalDamage * (1 - Tough);
%%							 ?AttackerTypePet ->
%%								 TargetTotalDamage * (1 - Tough);
%%							 ?AttackerTypeBoss->
%%								 %%攻击者是BOSS，进行目标防御首领伤害乘数修正
%%								 TargetTotalDamage * (1 + DefBoss);
%%							 _ ->
%%								 TargetTotalDamage
%%						 end,
%%	%%如果目标是BOSS，进行攻击者攻击首领伤害乘数修正
%%	case TargetIsBoss of
%%		true ->
%%			TargetTotalDamage1 * (1 + AttackBoss);
%%		_ ->
%%			TargetTotalDamage1
%%	end.
%% ====================================================================
%% Internal functions
%% ====================================================================
%%获取圆形区域内的目标
-spec getCircleAoeTarget(PlayerEts,MonsterEts,PetEts,AoeRange,Target) -> list() when
          PlayerEts    ::etsTab(),
          MonsterEts   ::etsTab(),
          PetEts       ::etsTab(),
          AoeRange     ::uint(),
		  Target       ::#recMapObject{}.
getCircleAoeTarget(PlayerEts,MonsterEts,PetEts,AoeRange,#recMapObject{code = Code,mapPid = MapPid,groupID = GroupID} = Target) ->
	{Tx,Ty} = {Target#recMapObject.x,Target#recMapObject.y},
	PList = mapView:getNearViewObject(MapPid, PlayerEts, ?ObjTypePlayer, {Tx,Ty},GroupID),
	MList = mapView:getNearViewObject(MapPid, MonsterEts, ?ObjTypeMonster, {Tx,Ty},GroupID),
	PEList = mapView:getNearViewObject(MapPid, PetEts, ?ObjTypePet, {Tx,Ty},GroupID),
	Fun = fun(#recMapObject{code = ObjCode} = Obj,Acc) ->
				  if
					  ObjCode =:= Code ->
						  [Obj | Acc];
					  true ->
						  case mapView:getObjectDist(Target, Obj) of
							  {ok,Dist,_,_} ->
								  case Dist =< AoeRange of
									  true ->
										  [Obj | Acc];
									  _->
										  Acc
								  end;
							  _ ->
								  Acc
						  end
				  end
		  end,
	TargetList = lists:foldl(Fun, [], PList),
	TargetList1 = lists:foldl(Fun, TargetList, MList),
	lists:foldl(Fun, TargetList1, PEList).

%%获取扇形范围内目标
-spec getSectorAoeTarget(Self,{Sx,Sy},{DirX,DirY},PlayerEts,MonsterEts,PetEts,AoeRange,AoeAngle,Target) -> list() when
		  Self         ::#recMapObject{},
          Sx           ::float(),
          Sy           ::float(),
          DirX         ::float(),
          DirY         ::float(),
          PlayerEts    ::etsTab(),
          MonsterEts   ::etsTab(),
          PetEts       ::etsTab(),
          AoeRange     ::uint(),
          AoeAngle     ::uint(),
		  Target       ::#recMapObject{}.
getSectorAoeTarget(#recMapObject{code = SelfCode} = Self,
	{Sx,Sy},
	{DirX,DirY},
	PlayerEts, MonsterEts, PetEts,
	AoeRange, AoeAngle,
	#recMapObject{mapPid = MapPid,groupID = GroupID}) ->

	PList = mapView:getNearViewObject(MapPid,PlayerEts, ?ObjTypePlayer, {Sx,Sy},GroupID),
	MList = mapView:getNearViewObject(MapPid,MonsterEts, ?ObjTypeMonster, {Sx,Sy},GroupID),
	PEList = mapView:getNearViewObject(MapPid,PetEts, ?ObjTypePet, {Sx,Sy},GroupID),
	Fun = fun(#recMapObject{code = ObjCode} = Obj,Acc) ->
				  {X,Y} = {Obj#recMapObject.x,Obj#recMapObject.y},
				  if
					  SelfCode =:= ObjCode ->
						  [Obj | Acc];
					  X == Sx andalso Y == Sy ->
						  [Obj | Acc];
					  true ->
						  case mapView:getObjectDist(Self, Obj) of
							  {ok,Dist,_,_} ->
								  case Dist + 0.5 =< AoeRange of 
									  true ->
										  Dx1 = X - Sx,
										  Dy1 = Y - Sy,
										  DotMulti = Dx1 * DirX + Dy1 * DirY,
										  LenD = math:sqrt(DirX * DirX + DirY * DirY),
										  LenDir = math:sqrt(Dx1 * Dx1 + Dy1 * Dy1),
										  CosA = misc:clamp(DotMulti / (LenD * LenDir), -1, 1),
										  A = math:acos(CosA)/math:pi() * 180,
										  case A =< (AoeAngle / 2) of
											  true ->
												  [Obj | Acc];
											  _ ->
												  Acc
										  end;
									  _->
										  Acc
								  end;
							  _ ->
								  Acc
						  end
				  end
		  end,
	TargetList = lists:foldl(Fun,[],PList),
	TargetList1 = lists:foldl(Fun,TargetList,MList),
	lists:foldl(Fun, TargetList1, PEList).

%%获取矩形范围内的目标
-spec getRectAoeTarget(Self,{SX,SY},{DirX,DirY},PlayerEts,MonsterEts,PetEts,Width,Height,Target) -> list() when
		  Self         ::#recMapObject{},
          SX           ::float(),
          SY           ::float(),
          DirX         ::float(),
          DirY         ::float(),
          PlayerEts    ::etsTab(),
          MonsterEts   ::etsTab(),
          PetEts       ::etsTab(),
          Width        ::float(),
          Height       ::float(),
		  Target       ::#recMapObject{}.
getRectAoeTarget(#recMapObject{code = SelfCode},{SX,SY},{DirX,DirY},PlayerEts,MonsterEts,PetEts,Width,Height,#recMapObject{mapPid = MapPid,groupID = GroupID}) ->
	PList = mapView:getNearViewObject(MapPid,PlayerEts, ?ObjTypePlayer, {SX, SY},GroupID),
	MList = mapView:getNearViewObject(MapPid,MonsterEts, ?ObjTypeMonster, {SX, SY},GroupID),
	PEList = mapView:getNearViewObject(MapPid,PetEts, ?ObjTypePet, {SX, SY},GroupID),
	%%矩形范围
	Fun1 = fun(#recMapObject{code = ObjectCode} = Obj,AccIn) ->
				   {X,Y} = {Obj#recMapObject.x, Obj#recMapObject.y},
				   if
					   SelfCode =:= ObjectCode ->
						   [Obj | AccIn];
					   X == SX andalso Y == SY ->
						   [Obj | AccIn];
					   true ->
						   %%自己到目标方向
						   DirX1 = X - SX,
						   DirY1 = Y - SY,
						   DotMulti = DirX * DirX1 + DirY * DirY1,
						   Len1 = math:sqrt(DirX * DirX + DirY * DirY),
						   Len2 = math:sqrt(DirX1 * DirX1 + DirY1 * DirY1),
						   CosA = misc:clamp(DotMulti / (Len1 * Len2), -1, 1),
						   Len3 = Len2 * CosA, 
						   Len4 = DirX1 * DirX1 + DirY1 * DirY1 - (Len3 * Len3),
						   case Len3 =< Height andalso Len3 >= 0 of
							   true ->
								   case Len4 < 0 of
									   true ->
										   [Obj | AccIn];
									   _ ->
								   			Len5 = math:sqrt(Len4),
								   			case Len5 =< Width of
									   			true ->
										   			[Obj | AccIn];
									   			_ ->
										   			AccIn
								   			end
									end;
							   _ ->
								   AccIn
						   end     
				   end
		   end,
	TargetList = lists:foldl(Fun1,[],PList),
	TargetList1 = lists:foldl(Fun1,TargetList,MList),
	lists:foldl(Fun1, TargetList1, PEList).

%%获取吟唱和引导触发时间下次触发时间
-spec getTriggerTime(SkillID, AttackTime, AttackSpeed, CastFactor) -> uint() when
       SkillID :: skillId(),
       AttackTime :: uint(),
       AttackSpeed :: number(),
       CastFactor :: number().
getTriggerTime(SkillID, AttackTime, AttackSpeed, CastFactor) ->
	Now = time:getUTCNowMS(),
	NeedTime = getSkillParam(SkillID, AttackTime, AttackSpeed, CastFactor),
	Now + NeedTime.

%%获取吟唱和引导的时间或者次数
-spec getSkillParam(SkillID, AttackTime, AttackSpeed, CastValue) -> uint() when
       SkillID :: uint16(),
       AttackTime :: uint(),
       AttackSpeed :: number(),
       CastValue :: number().
getSkillParam(SkillID, AttackTime, AttackSpeed, CastValue) ->
	#skillCfg{skillType = SkillType, hasteCast = HastCast, castDuration = Dura} = getCfg:getCfgPStack(cfg_skill, SkillID),
	if
		SkillType =:= ?SingSkill andalso  Dura =:= 0 ->
			case HastCast of
				0 -> %%不加速
					erlang:trunc(AttackTime * (1- CastValue));
				_ ->
					erlang:trunc(AttackTime / (1 + AttackSpeed) * (1- CastValue))
			end;
		SkillType =:= ?GuideSkill andalso Dura =:= 0 ->
			case HastCast of
				0 -> %%不加速
					erlang:trunc(AttackTime * (1- CastValue));
				_ ->
					erlang:trunc(AttackTime / (1 + AttackSpeed) * (1- CastValue))
			end;
		SkillType =:= ?SingSkill andalso  Dura =/= 0 ->
			case HastCast of
				0 -> %%不加速
					erlang:trunc(Dura * (1- CastValue));
				_ ->
					erlang:trunc(Dura / (1 + AttackSpeed) * (1- CastValue))
			end;
		SkillType =:= ?GuideSkill andalso Dura =/= 0 ->
			case HastCast of
				0 -> %%不加速
					erlang:trunc(Dura * (1- CastValue));
				_ ->
					erlang:trunc(Dura / (1 + AttackSpeed) * (1- CastValue))
			end;
		true ->
			0
	end.

%%获取最小伤害因子
-spec getMinDamageArg() -> uint().
getMinDamageArg() ->
	case getCfg:getCfgPStack(cfg_globalsetup, minDamage) of
		#globalsetupCfg{setpara = [Percent]} ->
			Percent;
		_ ->
			0
	end.

%%获取最大伤害因子
-spec getMaxDamageArg() -> uint().
getMaxDamageArg() ->
	case getCfg:getCfgPStack(cfg_globalsetup, maxDamage) of
		#globalsetupCfg{setpara = [Percent]} ->
			Percent;
		_ ->
			0
	end.

%%获取滑屏需要能量值
-spec getDashPhys(Carrer) -> float() when
       Carrer :: uint().
getDashPhys(?Career_10_Warrior) ->
	case getCfg:getCfgPStack(cfg_globalsetup, knightcost) of
		#globalsetupCfg{setpara = [Phys]} ->
			Phys;
		_ ->
			0
	end;
getDashPhys(?Career_30_Bravo) ->
	case getCfg:getCfgPStack(cfg_globalsetup, assassincost) of
		#globalsetupCfg{setpara = [Phys]} ->
			Phys;
		_ ->
			0
	end;
getDashPhys(?CareerTrainee) ->
	case getCfg:getCfgPStack(cfg_globalsetup, azraelcost) of
		#globalsetupCfg{setpara = [Phys]} ->
			Phys;
		_ ->
			0
	end;
getDashPhys(?Career_20_Magician) ->
	case getCfg:getCfgPStack(cfg_globalsetup, magecost) of
		#globalsetupCfg{setpara = [Phys]} ->
			Phys;
		_ ->
			0
	end;
getDashPhys(_) ->
	0.

%%获取滑屏最大距离
-spec getDashDisc(Carrer) -> float() when
       Carrer :: uint().
getDashDisc(?Career_10_Warrior) ->
	case getCfg:getCfgPStack(cfg_globalsetup, knightrange) of
		#globalsetupCfg{setpara = [Range]} ->
			Range;
		_ ->
			0
	end;
getDashDisc(?Career_30_Bravo) ->
	case getCfg:getCfgPStack(cfg_globalsetup, assassinrange) of
		#globalsetupCfg{setpara = [Range]} ->
			Range;
		_ ->
			0
	end;
getDashDisc(?CareerTrainee) ->
	case getCfg:getCfgPStack(cfg_globalsetup, azraelrange) of
		#globalsetupCfg{setpara = [Range]} ->
			Range;
		_ ->
			0
	end;
getDashDisc(?Career_20_Magician) ->
	case getCfg:getCfgPStack(cfg_globalsetup, magerange) of
		#globalsetupCfg{setpara = [Range]} ->
			Range;
		_ ->
			0
	end;
getDashDisc(_) ->
	0.

%%获取滑屏冷却cd
-spec getDashCD(Carrer) -> float() when
       Carrer :: uint().
getDashCD(?Career_10_Warrior) ->
	case getCfg:getCfgPStack(cfg_globalsetup, knightcd) of
		#globalsetupCfg{setpara = [CD]} ->
			CD;
		_ ->
			0
	end;
getDashCD(?Career_30_Bravo) ->
	case getCfg:getCfgPStack(cfg_globalsetup, assassincd) of
		#globalsetupCfg{setpara = [CD]} ->
			CD;
		_ ->
			0
	end;
getDashCD(?CareerTrainee) ->
	case getCfg:getCfgPStack(cfg_globalsetup, azraelcd) of
		#globalsetupCfg{setpara = [CD]} ->
			CD;
		_ ->
			0
	end;
getDashCD(?Career_20_Magician) ->
	case getCfg:getCfgPStack(cfg_globalsetup, magecd) of
		#globalsetupCfg{setpara = [CD]} ->
			CD;
		_ ->
			0
	end;
getDashCD(_) ->
	0.

%%获取血量百分比
-spec getPercent(CurHp, MaxHp) -> uint() when
       CurHp :: number(),
       MaxHp :: number().
getPercent(CurHp, _MaxHp)  when CurHp =< 0 ->
	0;
getPercent(CurHp, MaxHp) ->
	HpPer = erlang:trunc(CurHp / MaxHp * 100),
	if
		HpPer =:= 0 ->
			1;
		true ->
			HpPer
	end.  

%%获取技能槽开放等级
-spec getSlotOpenLevel(Index) -> uint() when
		  Index :: uint().
getSlotOpenLevel(Index) ->
	if
		Index =:= ?ActiveSkill1 ->
			1;
		Index =:= ?ActiveSkill2 ->
			1;
		Index =:= ?ActiveSkill3 ->
			5;
		Index =:= ?ActiveSkill4 ->
			25;
		Index =:= ?ActiveSkill5 ->
			1000;
		Index =:= ?PassiveSkill1 ->
			15;
		Index =:= ?PassiveSkill2 ->
			35;
		Index =:= ?PassiveSkill3 ->
			55;
		Index =:= ?PassiveSkill4 ->
			1000;
		Index =:= ?PassiveSkill5 ->
			1000;
		Index =:= ?Transfiguration1 ->
			1;
		Index =:= ?Transfiguration2 ->
			1000;
		Index =:= ?Transfiguration3 ->
			1000;
		Index =:= ?Transfiguration4 ->
			1000;
		Index =:= ?Transfiguration5 ->
			1000;
		true ->
			0
	end.
		

