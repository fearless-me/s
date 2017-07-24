%%
%% @author luowei
%% @doc @todo 玩家宠物战斗力计算


-module(playerForce).
-author(luowei).

-include("playerPrivate.hrl").

-define(PutFashion, 0). %%穿戴时装
-define(ColFashion, 1). %%收集时装
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	calcBattlePetForce/2,
%%			calcPetForce/1,
	calcPetNoBattleForce/1,
	calcPlayerForce/1,
	calcPlayerForce/2,
	calcOnePetForce/2,
	calcAllPetForce/1
]).

%%计算人物战力
-spec calcPlayerForce(IsNotify :: boolean()) -> boolean().
calcPlayerForce(IsNotify) ->

	calcPlayerTotalForce(IsNotify).

%%计算未出战宠物战力
-spec calcPetNoBattleForce(#recPetInfo{}) -> uint().
calcPetNoBattleForce(#recPetInfo{} = Pet) ->
	trunc(calcPetAttrSys1(Pet) +
		calcPetCastSys1(Pet)).


-spec calcPlayerForce(ForceType :: uint(), IsNotify :: boolean()) -> boolean().
calcPlayerForce(?PlayerLvForce, IsNotify) ->
	calcPlayerTotalForce(IsNotify);

calcPlayerForce(?PlayerGoddessForce, IsNotify) ->
	calcPlayerTotalForce(IsNotify);

calcPlayerForce(?PlayerGemForce, IsNotify) ->
	calcPlayerTotalForce(IsNotify);

calcPlayerForce(?PlayerStrForce, IsNotify) ->
	calcPlayerTotalForce(IsNotify);

calcPlayerForce(?PlayerArtiForce, IsNotify) ->
%%	calcPlayerArtiSys(),
	calcPlayerTotalForce(IsNotify);

calcPlayerForce(?PlayerArtiSkillForce, IsNotify) ->
%%	calcPlayerArtiSkillSys(),
	calcPlayerTotalForce(IsNotify);

calcPlayerForce(?PlayerEquipForce, IsNotify) ->
%%	calcPlayerEquipSys(),
	calcPlayerTotalForce(IsNotify);

calcPlayerForce(?PlayerFashionForce, IsNotify) ->
%	F = 0,%%calcPlayerFashionSys(),
%%	playerState:setPlayerSysForce(?PlayerFashionForce, F),
	calcPlayerTotalForce(IsNotify);

calcPlayerForce(?PlayerFashionColForce, IsNotify) ->
%%	calcPlayerFashionColSys(),
	calcPlayerTotalForce(IsNotify);

calcPlayerForce(?PlayerTalentForce, IsNotify) ->
%%	calcPlayerTalentSys(),
	calcPlayerTotalForce(IsNotify);

calcPlayerForce(?PlayerGuildSkillForce, IsNotify) ->
%%	calcPlayerGuildSkillSys(),
	calcPlayerTotalForce(IsNotify);

calcPlayerForce(?PlayerWingForce, IsNotify) ->
%%	calcPlayerWingSys(),
	calcPlayerTotalForce(IsNotify);

calcPlayerForce(?PlayerRuneForce, IsNotify) ->
%%	calcPlayerRuneSys(),
	calcPlayerTotalForce(IsNotify).

%%该函数调用目前仅仅保留了天赋技能的战斗力计算调用。其余的全部不再处理。
%% 等天赋技能详细信息出来之后再将天赋技能的战斗力计算合并到新的战斗力计算内
-spec calcBattlePetForce(ForceType :: uint(), IsNotify :: boolean()) -> boolean().
calcBattlePetForce(_ForceType, _IsNotify) -> ok.


%%计算总战斗力=每个宠物战斗力+宠物装备战斗力
calcAllPetForce(IsNotify) ->
	Pets = playerState:getPets(),
	ForceList = lists:map(
		fun(#recPetInfo{pet_force = PetForce}) ->
			PetForce
		end, Pets),
	SumPetForce = lists:sum(ForceList),
	playerPropSync:setInt64(?PriProp_PlayerAllPetForce, erlang:trunc(SumPetForce), IsNotify).


calcOnePetForce(PetID, IsNotify) when is_integer(PetID) ->
	{ok, PetInfo} = playerPet:getPetByID(PetID),
	calcOnePetForce(PetInfo, IsNotify);
calcOnePetForce(#recPetInfo{pet_id = PetID, pet_status = Status} = Pet, IsNotify) ->
	NewBattlePropList = playerPetProp:makePetProp(Pet),
	Force = doCalcOnePetForce(PetID, NewBattlePropList),
	case erlang:trunc(Force) of
		0 ->
			?ERROR_OUT("pet fight force is 0,PetID=~p", [PetID]),
			Pet;
		_ ->
			case Status >= ?PetState_Battle_Show of
				true ->
					ForcePet = playerPropSync:getProp(?PriProp_PetForce),
					?DEBUG_OUT("petForce=~p->~p, diff = ~p",[ForcePet, Force, Force - ForcePet]),
					ForcePetNew = erlang:trunc(Force),
					playerPropSync:setInt64(?PriProp_PetForce, ForcePetNew, IsNotify),
					ForcePlayer = playerPropSync:getProp(?PriProp_PlayerForce),
					ForceMax = playerPropSync:getProp(?SerProp_SevenDayAim_Force),
					case ForcePetNew + ForcePlayer > ForceMax of
						true ->
							playerSevenDayAim:updateCondition(?SevenDayAim_Force, [ForcePetNew + ForcePlayer]);
						_ ->
							skip
					end;
				_ ->
					skip
			end,
			NewPetInfo = Pet#recPetInfo{pet_force = erlang:trunc(Force)},
			playerPet:savePetInfoToDB(NewPetInfo),
			playerPet:sendPetInfoToClient(NewPetInfo),
			calcAllPetForce(IsNotify),
			NewPetInfo
	end.


getPetSkillForce(PetID) ->
	SkillList = playerState:getPetSkills(PetID),
	lists:foldl(
		fun(#recPetSkill{skill_id = SkillID, skill_level = SkillLevel, skill_is_unlock = Lock}, Acc) ->
			case Lock of
				?PetSkillUnLock ->
					Acc + calcSkillForce(SkillID, SkillLevel);
				_ ->
					Acc
			end
		end, 0, SkillList).

doCalcOnePetForce(PetID, BattlePropList) ->
	%% 战斗属性产生的战力
	#petCfg{prosType = ProsType} = getCfg:getCfgPStack(cfg_pet, PetID),
	#petfightForceCfg{
		hp = Hp,
		prop_physicaldamage = Prop_PhysicalAttack,
		prop_MagicAttack = Prop_MagicAttack,
		prop_physicaldefence = Prop_PhysicalDefence,
		prop_MagicDefence = Prop_MagicDefence,
		prop_critical = Prop_critical,
		prop_criticalimmunity = Prop_CriticalResistLevel,
		prop_CriticalDamageLevel = Prop_CriticalDamageLevel,
		prop_TenaciousLevel = Prop_TenaciousLevel,
		prop_hitratio = Prop_HitLevel,
		prop_dodge = Prop_dodge,
		prop_ArmorPenetrationLevel = Prop_ArmorPenetrationLevel,
		prop_firm = Prop_ArmorLevel,
		prop_DgeAdd1 = Prop_DamagePlusPhysical,
		prop_DgeAdd2 = Prop_DamagePlusMagic,
		prop_dgeCut = Prop_DamageReduce,
		prop_CD = Prop_SkillMinusCDFactor
	} = getCfg:getCfgByArgs(cfg_petfightForce, ProsType),
%% 特别注意，这个人物战力计算的方式不太一样	%%%
	ForceOfBattleProp =
		battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MaxHP) * Hp +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_PhysicalAttack) * Prop_PhysicalAttack +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MagicAttack) * Prop_MagicAttack +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_PhysicalDefence) * Prop_PhysicalDefence +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MagicDefence) * Prop_MagicDefence +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_CriticalLevel) * Prop_critical +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_CriticalResistLevel) * Prop_CriticalResistLevel +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_CriticalDamageLevel) * Prop_CriticalDamageLevel +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_TenaciousLevel) * Prop_TenaciousLevel +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_HitLevel) * Prop_HitLevel +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_DodgeLevel) * Prop_dodge +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_ArmorPenetrationLevel) * Prop_ArmorPenetrationLevel +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_ArmorLevel) * Prop_ArmorLevel +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_PetDamagePlus) * Prop_DamagePlusPhysical * battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_PhysicalAttack) +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_PetDamagePlus) * Prop_DamagePlusMagic * battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MagicAttack) +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_PetDamageReduce) * Prop_DamageReduce * battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_PhysicalDefence) +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_PetDamageReduce) * Prop_DamageReduce * battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MagicDefence),

	%% 技能相关战力暂时不用
			%SkillAllForce = getPetSkillForce(PetID),
			%battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_SkillMinusCDFactor) * Prop_SkillMinusCDFactor * SkillAllForce +
			%SkillAllForce,

	?DEBUG_OUT("[DebugForPetForce] roleID:~w petID:~w Force:~w", [playerState:getRoleID(), PetID, ForceOfBattleProp]),
	erlang:trunc(ForceOfBattleProp).


%%log(Index, Val, Factor) ->
%%	?DEBUG_OUT("[~p, ~p * ~p = ~p]", [Index, Val, Factor, Val * Factor]),
%%	ok.


%% ====================================================================
%% Internal functions
%% ====================================================================

%%计算人物总战力
%%-spec calcPlayerTotalForce(IsNotify::boolean()) -> boolean().

getSkillSlotSkillForce() ->
	SkillList = playerState:getSkill(),
	SlotSkillList = playerState:getSlotSkill(),
	lists:foldl(
		fun(#recSlotSkill{skillID = SkillID}, Acc) ->
			case lists:keyfind(SkillID, #recSkill.skillID, SkillList) of
				#recSkill{level = SkillLevel} ->
					Acc + calcSkillForce(SkillID, SkillLevel);
				_ ->
					Acc
			end
		end, 0, SlotSkillList).


calcSkillForce(SkillID, SkillLevel) ->
	case getCfg:getCfgByArgs(cfg_skill, SkillID) of
		#skillCfg{fightSkill = [{B, A} | _]} ->
			B + (SkillLevel - 1) * A;
		_ ->
			0
	end.

getSkillListForce() ->
	SkillList = playerState:getSkill(),
	lists:foldl(
		fun(#recSkill{skillID = SkillID, level = SkillLevel}, Acc) ->
			Acc + calcSkillForce(SkillID, SkillLevel)
		end, 0, SkillList).

-ifndef(RELEASE).
playerForceLog(SkillAllForce, SkillSlotForce, BattlePropList)->
	RoleID = playerState:getRoleID(),
	#fightForceCfg{
		hp = Hp,
		prop_physicaldamage = Prop_PhysicalAttack,
		prop_MagicAttack = Prop_MagicAttack,
		prop_physicaldefence = Prop_PhysicalDefence,
		prop_MagicDefence = Prop_MagicDefence,
		prop_hitratio = Prop_HitLevel,
		prop_critical = Prop_critical,
		prop_criticalimmunity = Prop_CriticalResistLevel,
		prop_CriticalDamageLevel = Prop_CriticalDamageLevel,
		prop_ArmorPenetrationLevel = Prop_ArmorPenetrationLevel,
		prop_dodge = Prop_dodge,
		prop_TenaciousLevel = Prop_TenaciousLevel,
		prop_DgeAdd1 = Prop_DamagePlusPhysical,
		prop_DgeAdd2 = Prop_DamagePlusMagic,
		prop_dgeCut = Prop_DamageReduce,
		prop_firm = Prop_ArmorLevel,
		prop_CD = Prop_SkillMinusCDFactor
	} = getCfg:getCfgByArgs(cfg_fightForce, playerState:getCareer()),
	?DEBUG_OUT("RoleID=~p,skillAll=~p,SkillSlot=~p,",[RoleID,SkillAllForce, SkillSlotForce]),
	?DEBUG_OUT(
		"~p*~p + ~p*~p+~p*~p +~p*~p+~p*~p +	~p*~p+~n"
		"~p*~p +~p*~p +~p*~p +~p*~p +~p*~p + ~n"
		"~p*~p +~p*~p+~p*~p*~p+~p*~p*~p+~n"
		"(~p*~p) * (~p + ~p)+~p*~p*~p+~p",
		[
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MaxHP) , Hp ,
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_PhysicalAttack) , Prop_PhysicalAttack ,
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MagicAttack) , Prop_MagicAttack ,
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_PhysicalDefence) , Prop_PhysicalDefence ,
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MagicDefence) , Prop_MagicDefence ,
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_CriticalLevel) , Prop_critical ,

			%%
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_CriticalResistLevel) , Prop_CriticalResistLevel ,
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_CriticalDamageLevel) , Prop_CriticalDamageLevel ,
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_TenaciousLevel) , Prop_TenaciousLevel ,
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_HitLevel) , Prop_HitLevel ,
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_DodgeLevel) , Prop_dodge ,

			%%
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_ArmorPenetrationLevel) , Prop_ArmorPenetrationLevel ,
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_ArmorLevel) , Prop_ArmorLevel ,
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_DamagePlus) - 1 , Prop_DamagePlusPhysical ,
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_PhysicalAttack) ,

			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_DamagePlus) - 1 , Prop_DamagePlusMagic ,
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MagicAttack) ,

			%%
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_DamageReduce) - 1 , Prop_DamageReduce,
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_PhysicalDefence) ,
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MagicDefence) ,

			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_SkillMinusCDFactor) - 1 , Prop_SkillMinusCDFactor , SkillSlotForce ,
			SkillAllForce
		]),

	ok.
-else.
playerForceLog(_SkillAllForce, _SkillSlotForce, _BattlePropList)->
	ok.
-endif.

calcPlayerTotalForce(IsNotify) ->
	#fightForceCfg{
		hp = Hp,
		prop_physicaldamage = Prop_PhysicalAttack,
		prop_MagicAttack = Prop_MagicAttack,
		prop_physicaldefence = Prop_PhysicalDefence,
		prop_MagicDefence = Prop_MagicDefence,
		prop_hitratio = Prop_HitLevel,
		prop_critical = Prop_critical,
		prop_criticalimmunity = Prop_CriticalResistLevel,
		prop_CriticalDamageLevel = Prop_CriticalDamageLevel,
		prop_ArmorPenetrationLevel = Prop_ArmorPenetrationLevel,
		prop_dodge = Prop_dodge,
		prop_TenaciousLevel = Prop_TenaciousLevel,
		prop_DgeAdd1 = Prop_DamagePlusPhysical,
		prop_DgeAdd2 = Prop_DamagePlusMagic,
		prop_dgeCut = Prop_DamageReduce,
		prop_firm = Prop_ArmorLevel,
		prop_CD = Prop_SkillMinusCDFactor
	} = getCfg:getCfgByArgs(cfg_fightForce, playerState:getCareer()),

%%
%%	生命*生命系数+物攻*物攻系数+法攻*法攻系数+物防*物防系数+法防*法防系数+暴击等级*暴击等级系数
%%	+抗暴*抗暴等级系数+爆伤等级*爆伤等级系数+韧性等级*韧性等级系数+命中等级*命中等级系数+闪避等级*闪避等级系数
%%	+ 破甲等级*破甲等级系数+坚固等级*坚固等级系数+伤害加成*物理伤害加成系数*物攻+伤害加成*法攻伤害加成系数*法攻
%%	+伤害减免*伤害减免系数*（物防+法防）+技能CD减免比例*CD减免系数*角色装备的4个槽位的技能战力之和+技能战斗力
	SkillAllForce = getSkillListForce(),
	SkillSlotForce = getSkillSlotSkillForce(),

	BattlePropList = playerCalcProp:changeProp_CalcForce(),
	Force =
		battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MaxHP) * Hp +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_PhysicalAttack) * Prop_PhysicalAttack +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MagicAttack) * Prop_MagicAttack +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_PhysicalDefence) * Prop_PhysicalDefence +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MagicDefence) * Prop_MagicDefence +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_CriticalLevel) * Prop_critical +

			%%
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_CriticalResistLevel) * Prop_CriticalResistLevel +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_CriticalDamageLevel) * Prop_CriticalDamageLevel +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_TenaciousLevel) * Prop_TenaciousLevel +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_HitLevel) * Prop_HitLevel +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_DodgeLevel) * Prop_dodge +

			%%
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_ArmorPenetrationLevel) * Prop_ArmorPenetrationLevel +
			battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_ArmorLevel) * Prop_ArmorLevel +
			(battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_DamagePlus) - 1) * Prop_DamagePlusPhysical *
				battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_PhysicalAttack) +

			(battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_DamagePlus)-1) * Prop_DamagePlusMagic *
				battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MagicAttack) +

			%%
			(battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_DamageReduce) - 1) * Prop_DamageReduce
				* (battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_PhysicalDefence) +
				battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MagicDefence)) +

			(battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_SkillMinusCDFactor)-1) * Prop_SkillMinusCDFactor * SkillSlotForce +
			SkillAllForce,
%%		playerState:getBattlePropTotal(?Prop_MaxHP) * Hp +
%%			playerState:getBattlePropTotal(?Prop_PhysicalAttack) * Prop_PhysicalAttack +
%%			playerState:getBattlePropTotal(?Prop_MagicAttack) * Prop_MagicAttack +
%%			playerState:getBattlePropTotal(?Prop_PhysicalDefence) * Prop_PhysicalDefence +
%%			playerState:getBattlePropTotal(?Prop_MagicDefence) * Prop_MagicDefence +
%%			playerState:getBattlePropTotal(?Prop_CriticalLevel) * Prop_critical +
%%
%%			playerState:getBattlePropTotal(?Prop_CriticalResistLevel) * Prop_CriticalResistLevel +
%%			playerState:getBattlePropTotal(?Prop_CriticalDamageLevel) * Prop_CriticalDamageLevel +
%%			playerState:getBattlePropTotal(?Prop_TenaciousLevel) * Prop_TenaciousLevel +
%%			playerState:getBattlePropTotal(?Prop_HitLevel) * Prop_HitLevel +
%%			playerState:getBattlePropTotal(?Prop_DodgeLevel) * Prop_dodge +
%%
%%			playerState:getBattlePropTotal(?Prop_ArmorPenetrationLevel) * Prop_ArmorPenetrationLevel +
%%			playerState:getBattlePropTotal(?Prop_ArmorLevel) * Prop_ArmorLevel +
%%			playerState:getBattlePropTotal(?Prop_DamagePlus) * Prop_DamagePlusPhysical * playerState:getBattlePropTotal(?Prop_PhysicalAttack) +
%%			playerState:getBattlePropTotal(?Prop_DamagePlus) * Prop_DamagePlusMagic * playerState:getBattlePropTotal(?Prop_MagicAttack) +
%%
%%			playerState:getBattlePropTotal(?Prop_DamageReduce) * Prop_DamageReduce
%%				* (playerState:getBattlePropTotal(?Prop_PhysicalDefence) + playerState:getBattlePropTotal(?Prop_MagicDefence)) +
%%
%%			playerState:getBattlePropTotal(?Prop_SkillMinusCDFactor) * Prop_SkillMinusCDFactor * SkillSlotForce +
%%			SkillAllForce,


	case Force >= 0 of
		true ->
			NewForce = trunc(Force),
			%%将战斗力改变同步到队员信息
			playerForceLog(SkillAllForce, SkillSlotForce, BattlePropList),
			?DEBUG_OUT("player[~p] fight force value:~p->~p , diff=~p, IsNotify= ~p",
				[playerState:getRoleID(), playerPropSync:getProp(?PriProp_PlayerForce), NewForce,NewForce - playerPropSync:getProp(?PriProp_PlayerForce),IsNotify]),
			playerPropSync:setInt64(?PriProp_PlayerForce, NewForce, IsNotify),
			ForceMax = playerPropSync:getProp(?SerProp_SevenDayAim_Force),
			ForcePet = playerPropSync:getProp(?PriProp_PetForce),
			case NewForce + ForcePet > ForceMax of
				true ->
					playerSevenDayAim:updateCondition(?SevenDayAim_Force, [NewForce + ForcePet]);
				_ ->
					skip
			end;
		_ ->
			?ERROR_OUT(
				"player fight force values:~p,cfg=~p",
				[
					[
						{?Prop_MaxHP, battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MaxHP)},
						{?Prop_PhysicalAttack, battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_PhysicalAttack)},
						{?Prop_MagicAttack, battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MagicAttack)},
						{?Prop_PhysicalDefence, battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_PhysicalDefence)},
						{?Prop_MagicDefence, battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_MagicDefence)},
						{?Prop_HitLevel, battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_HitLevel)},
						{?Prop_CriticalLevel, battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_CriticalLevel)},
						{?Prop_CriticalDamageLevel, battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_CriticalDamageLevel)},
						{?Prop_ArmorPenetrationLevel, battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_ArmorPenetrationLevel)},
						{?Prop_DodgeLevel, battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_DodgeLevel)},
						{?Prop_CriticalResistLevel, battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_CriticalResistLevel)},
						{?Prop_TenaciousLevel, battleProp:getBattlePropTotalValue(BattlePropList, ?Prop_TenaciousLevel)}
					],
					getCfg:getCfgByArgs(cfg_fightForce, playerState:getCareer())
				]
			),

			playerPropSync:setInt64(?PriProp_PlayerForce, 0)
	end.
%%计算人物总战力
%%-spec calcPlayerTotalForce(IsNotify::boolean()) -> boolean().
%%calcPlayerTotalForce(IsNotify) ->
%%	calcPlayerTotalForce(lists:seq(1, ?PlayerMaxForce), 0, IsNotify).
%%calcPlayerTotalForce([], Force, IsNotify) ->
%%	?DEBUG_OUT("player [~ts] total force value:~p, is notify [~p]", [playerState:getName(), erlang:trunc(Force), IsNotify]),
%%	HistoryForce = playerPropSync:getProp(?SerProp_PlayerHistoryForce),
%%	PetForce = playerPropSync:getProp(?PriProp_PetForce),
%%	playerPropSync:setInt64(?PriProp_PlayerForce, erlang:trunc(Force), IsNotify),
%%	syncfightingCapacityToTeam();
%%calcPlayerTotalForce([SysID | L], Force, IsNotify) ->
%%	SysForce = playerState:getPlayerSysForce(SysID),
%%	calcPlayerTotalForce(L, Force + SysForce, IsNotify).

%%计算宠物总战力
%%-spec calcPetTotalForce(IsNotify::boolean()) -> boolean().
%%calcPetTotalForce(IsNotify) ->
%%	calcPetTotalForce(lists:seq(1, ?PetMaxForce), 0, IsNotify).
%%calcPetTotalForce([], Force, IsNotify) ->
%%	?DEBUG_OUT("player [~ts] pet total force value:~p, is notify [~p]", [playerState:getName(), erlang:trunc(Force), IsNotify]),
%%	PlayerForce = playerPropSync:getProp(?PriProp_PlayerForce),
%%	playerPropSync:setInt64(?PriProp_PetForce, erlang:trunc(Force), IsNotify),
%%	syncfightingCapacityToTeam();
%%calcPetTotalForce([SysID | L], Force, IsNotify) ->
%%	SysForce = playerState:getPetSysForce(SysID),
%%	calcPetTotalForce(L, Force + SysForce, IsNotify).

%%计算人物等级战斗力
%%-spec calcPlayerLvSys() -> ok.
%%calcPlayerLvSys() ->
%%	Lv = playerState:getLevel(),
%%	case getCfg:getCfgPStack(cfg_battlepower, Lv) of
%%		#battlepowerCfg{playerlvpower = Force} ->
%%			playerState:setPlayerSysForce(?PlayerLvForce, Force);
%%		_ ->
%%			playerState:setPlayerSysForce(?PlayerLvForce, 0)
%%	end.

%%计算人物女神战斗力
%%-spec calcPlayerGoddessSys() -> ok.
%%calcPlayerGoddessSys() ->
%%	L = playerState:getWakes(),
%%	calcPlayerGoddessSys(L, 0).
%%calcPlayerGoddessSys([], Force) ->
%%	playerState:setPlayerSysForce(?PlayerGoddessForce, Force);
%%calcPlayerGoddessSys([#recWake{curLevel = Lv} | L], Force) ->
%%	case getCfg:getCfgPStack(cfg_battlepower, Lv) of
%%		#battlepowerCfg{godpower = GodForce} ->
%%			NewForce = GodForce + Force;
%%		_ ->
%%			NewForce = Force
%%	end,
%%	calcPlayerGoddessSys(L, NewForce).

%%计算人物宝石战斗力
%%-spec calcPlayerGemSys() -> ok.
%%calcPlayerGemSys() ->
%%	L = playerState:getPackage(?Item_Location_GemEmbedBag),
%%	calcPlayerGemSys(L, 0).
%%calcPlayerGemSys([], Force) ->
%%	playerState:setPlayerSysForce(?PlayerGemForce, Force);
%%calcPlayerGemSys([#rec_item{itemID = ItemID} | L], Force) ->
%%	case getCfg:getCfgPStack(cfg_item, ItemID) of
%%		#itemCfg{useParam3 = Lv} ->
%%			GemLv = Lv;
%%		_ ->
%%			GemLv = 0
%%	end,
%%	case getCfg:getCfgPStack(cfg_battlepower, GemLv) of
%%		#battlepowerCfg{gempower = GemForce} ->
%%			NewForce = GemForce + Force;
%%		_ ->
%%			NewForce = Force
%%	end,
%%	calcPlayerGemSys(L, NewForce).

%%计算人物强化战斗力
%%-spec calcPlayerStrSys() -> ok.
%%calcPlayerStrSys() ->
%%	L = playerState:getEquipRefine(),
%%	calcPlayerStrSys(L, 0).
%%calcPlayerStrSys([], Force) ->
%%	playerState:setPlayerSysForce(?PlayerStrForce, Force);
%%calcPlayerStrSys([{_, Lv} | L], Force) ->
%%	case getCfg:getCfgByArgs(cfg_battlepower, Lv) of
%%		#battlepowerCfg{equipintpower = StrForce} ->
%%			NewForce = StrForce + Force;
%%		_ ->
%%			NewForce = Force
%%	end,
%%	calcPlayerStrSys(L, NewForce).

%%计算人物神器战斗力
%%-spec calcPlayerArtiSys() -> ok.
%%calcPlayerArtiSys() ->
%%	L = playerState:getGodWeaponInfo(),
%%	calcPlayerArtiSys(L, 0).
%%calcPlayerArtiSys([], Force) ->
%%	playerState:setPlayerSysForce(?PlayerArtiForce, Force);
%%calcPlayerArtiSys([#rec_god_weapon{weaponLevel = Lv} | L], Force) ->
%%	case getCfg:getCfgPStack(cfg_battlepower, Lv) of
%%		#battlepowerCfg{sqpower = SqForce} ->
%%			NewForce = SqForce + Force;
%%		_ ->
%%			NewForce = Force
%%	end,
%%	calcPlayerArtiSys(L, NewForce).

%%%%计算人物神器技能战斗力
%%-spec calcPlayerArtiSkillSys() -> ok.
%%calcPlayerArtiSkillSys() ->
%%	L = playerState:getGodWeaponInfo(),
%%	calcPlayerArtiSkillSys(L, 0).
%%calcPlayerArtiSkillSys([], Force) ->
%%	playerState:setPlayerSysForce(?PlayerArtiSkillForce, Force);
%%calcPlayerArtiSkillSys([#rec_god_weapon{skillLevel = Lv} | L], Force) ->
%%	case getCfg:getCfgPStack(cfg_battlepower, Lv) of
%%		#battlepowerCfg{sqskillpower = SqSkillForce} ->
%%			NewForce = SqSkillForce + Force;
%%		_ ->
%%			NewForce = Force
%%	end,
%%	calcPlayerArtiSkillSys(L, NewForce).

%%%%计算装备战斗力
%%-spec calcPlayerEquipSys() -> ok.
%%calcPlayerEquipSys() ->
%%	L = playerState:getPackage(?Item_Location_BodyEquipBag),
%%	calcPlayerEquipSys(L, 0).
%%calcPlayerEquipSys([], Force) ->
%%	playerState:setPlayerSysForce(?PlayerEquipForce, Force);
%%calcPlayerEquipSys([#recSaveEquip{itemID = ItemID, quality = Qual, extProp = ExtProps} | L], Force) ->
%%	NewForce =
%%		case getCfg:getCfgPStack(cfg_equipment, ItemID) of
%%			#equipmentCfg{type = Type} ->
%%				SL = playerState:getEquipStarList(),
%%				QualArg = 1 + playerEquip:getEquipQuailtyRatio(Qual),
%%				case lists:keyfind(Type, #recEquipStar.pos, SL) of
%%					#recEquipStar{star = Star}->
%%						case getCfg:getCfgPStack(cfg_equipstar, Star) of
%%							#equipstarCfg{ratio = Ratio} ->
%%								StarArg = Ratio + 1;
%%							_ ->
%%								StarArg = 1
%%						end;
%%					_ ->
%%						StarArg = 1
%%				end,
%%				{NewLv, NewArg} =
%%					case getCfg:getCfgPStack(cfg_equipment, ItemID) of
%%						#equipmentCfg{battlepower_add = Arg, itemLevel = ItemLevel} ->
%%							{ItemLevel, Arg};
%%						_ ->
%%							{0, 0}
%%					end,
%%				case getCfg:getCfgPStack(cfg_battlepower, NewLv) of
%%					#battlepowerCfg{equipbasepower = EquipBaseForce} ->
%%						ExtForce = calcPlayerEquipExtSys(ExtProps, NewLv),
%%						(EquipBaseForce * QualArg * StarArg + ExtForce) * NewArg + Force;
%%					_ ->
%%						Force
%%				end;
%%			_ ->
%%				?ERROR_OUT("calcPlayerEquipSys not found item:roleid=~p,itemid=~p", [playerState:getRoleID(), ItemID]),
%%				Force
%%		end,
%%	calcPlayerEquipSys(L, NewForce).

%%计算装备额外属性战斗力
%%-spec calcPlayerEquipExtSys(#rec_equip_ext_info{}, Lv::uint()) -> float().
%%calcPlayerEquipExtSys(#rec_equip_ext_info{
%%	propAffixe1 = PropAffixe1, propValue1 = PropValue1,
%%	propAffixe2 = PropAffixe2, propValue2 = PropValue2,
%%	propAffixe3 = PropAffixe3, propValue3 = PropValue3,
%%	propAffixe4 = PropAffixe4, propValue4 = PropValue4,
%%	propAffixe5 = PropAffixe5, propValue5 = PropValue5,
%%	propAffixe6 = PropAffixe6, propValue6 = PropValue6
%%}, Lv) ->
%%	calcAffixeIDSys(PropAffixe1, PropValue1, Lv) +
%%		calcAffixeIDSys(PropAffixe2, PropValue2, Lv) +
%%		calcAffixeIDSys(PropAffixe3, PropValue3, Lv) +
%%		calcAffixeIDSys(PropAffixe4, PropValue4, Lv) +
%%		calcAffixeIDSys(PropAffixe5, PropValue5, Lv) +
%%		calcAffixeIDSys(PropAffixe6, PropValue6, Lv).

%%计算每条额外属性战斗力
%%-spec calcAffixeIDSys(ID::uint(), Value::uint(), Lv::uint()) -> float().
%%calcAffixeIDSys(0, _Value, _Lv) ->
%%	0;
%%calcAffixeIDSys(ID, Value, Lv) ->
%%	case playerEquip:getAffixesCfg(ID, Lv) of
%%		#equipAffixesCfg{max2 = Max2} ->
%%			NewValue = Value / Max2;
%%		_ ->
%%			NewValue = 0
%%	end,
%%	case getCfg:getCfgPStack(cfg_battlepower, Lv) of
%%		#battlepowerCfg{equipaddpower = AddForce} ->
%%			AddForce  * NewValue;
%%		_ ->
%%			0
%%	end.

%%计算角色时装战斗力
%%-spec calcPlayerFashionSys() -> ok.
%%calcPlayerFashionSys() ->
%%	Ma = playerPropSync:getProp(?PubProp_FashionMajorHand),
%%	Mi = playerPropSync:getProp(?PubProp_FashionHead),
%%	C = playerPropSync:getProp(?PubProp_FashionClothes),
%%	calcPlayerFashionForce(Ma) +
%%		calcPlayerFashionForce(Mi) +
%%		calcPlayerFashionForce(C).

%%计算玩家收集永久时装战斗力
%%-spec calcPlayerFashionColSys() -> ok.
%%calcPlayerFashionColSys() ->
%%	L = playerState:getFashionList(),
%%	calcPlayerFashionColSys(L, 0).
%%calcPlayerFashionColSys([], Force) ->
%%	playerState:setPlayerSysForce(?PlayerFashionColForce, Force);
%%calcPlayerFashionColSys([#recFashion{fashionID = ID, endTime = EndTime} | L], Force) ->
%%			NewForce = calcPlayerFashionForce(ID) + Force,
%%			calcPlayerFashionColSys(L, NewForce).

%%calcPlayerFashionForce(0) ->
%%	0;
%%calcPlayerFashionForce(ID) ->
%%	case getCfg:getCfgPStack(cfg_fashion, ID) of
%%		#fashionCfg{battlepower2 = Battlepower1} ->
%%			Battlepower1;
%%		_ ->
%%			0
%%	end.

%%计算人物天赋技能战斗力
%%-spec calcPlayerTalentSys() -> ok.
%%calcPlayerTalentSys() ->
%%	TalentInfo = playerState:getTalentInfo(),
%%	calcPlayerTalentSys(
%%		[{1, TalentInfo#rec_talent.propIntensify},
%%			{2, TalentInfo#rec_talent.phyDefIntensify},
%%			{3, TalentInfo#rec_talent.magDefIntensify},
%%			{4, TalentInfo#rec_talent.petDamIntensify},
%%			{5, TalentInfo#rec_talent.petDefIntensify}
%%		], 0).
%%calcPlayerTalentSys([], Force) ->
%%	playerState:setPlayerSysForce(?PlayerTalentForce, Force);
%%calcPlayerTalentSys([{_ID, Lv} | L], Force) when Lv =:= 0 ->
%%	calcPlayerTalentSys(L, Force);
%%calcPlayerTalentSys([{ID, Lv} | L], Force) ->
%%	case getCfg:getCfgByArgs(cfg_talentProp, ID) of
%%		#talentPropCfg{target = 1} ->
%%			case getCfg:getCfgPStack(cfg_battlepower, Lv) of
%%				#battlepowerCfg{talentpower1 = AddForce} ->
%%					NewForce = AddForce;
%%				_ ->
%%					NewForce = 0
%%			end,
%%			calcPlayerTalentSys(L, Force + NewForce);
%%		_ ->
%%			calcPlayerTalentSys(L, Force)
%%	end.

%%计算人物公会技能战斗力
%%-spec calcPlayerGuildSkillSys() -> ok.
%%calcPlayerGuildSkillSys() ->
%%	L = playerGuildSkillAndBuff:getGuildSelfSkillList(),
%%	calcPlayerGuildSkillSys(L, 0).

%%calcPlayerGuildSkillSys([], Force) ->
%%	playerState:setPlayerSysForce(?PlayerGuildSkillForce, Force);
%%calcPlayerGuildSkillSys([{_, Lv} | L], Force) ->
%%	case getCfg:getCfgPStack(cfg_battlepower, Lv) of
%%		#battlepowerCfg{legionSkills = SkillForce} ->
%%			NewForce = SkillForce + Force;
%%		_ ->
%%			NewForce = Force
%%	end,
%%	calcPlayerGuildSkillSys(L, NewForce).

%%计算人物翅膀战斗力
%%-spec calcPlayerWingSys() -> ok.
%%calcPlayerWingSys() ->
%%	Lv = playerWing:getWingLevel(),
%%	calcPlayerWingSys(Lv).

%%calcPlayerWingSys(0) ->
%%	playerState:setPlayerSysForce(?PlayerWingForce, 0);
%%calcPlayerWingSys(Lv) ->
%%	case getCfg:getCfgPStack(cfg_battlepower, Lv) of
%%		#battlepowerCfg{wingpower = WingForce} ->
%%			NewForce = WingForce;
%%		_ ->
%%			NewForce = 0
%%	end,
%%	playerState:setPlayerSysForce(?PlayerWingForce, NewForce).

%% 计算人物符文战斗力
%%calcPlayerRuneSys() ->
%%	V = playerRune:getPlayerRuneForce(),
%%	playerState:setPlayerSysForce(?PlayerRuneForce, V),
%%	ok.

%%计算宠物等级战斗力
-spec calcPetLvSys() -> float().
calcPetLvSys() ->
	Lv = playerState:getLevel(),
	case getCfg:getCfgPStack(cfg_battlepower, Lv) of
		#battlepowerCfg{petlvpower = Force} ->
			Force;
		_ ->
			0
	end.

%%计算助战宠物属性战斗力
-spec calcPetAttrSys1(Pet :: #recPetInfo{}) -> float().
calcPetAttrSys1(#recPetInfo{pet_time = PetTime} = Pet) when PetTime > 0 ->
	case getExpressPetCalcForce() of
		1 ->
			doCalcPetAttrSys1(Pet);
		_ ->
			float(0)
	end;
calcPetAttrSys1(#recPetInfo{} = Pet) ->
	doCalcPetAttrSys1(Pet).

doCalcPetAttrSys1(#recPetInfo{pet_id = ID, pet_star = Star, pet_raw = Raw}) ->
	#petCfg{enhCost = GroupID} = getCfg:getCfgPStack(cfg_pet, ID),
	LvForce = calcPetLvSys(),
	#petrebornCfg{
		star = StarArg
	} = getCfg:getCfgPStack(cfg_petreborn, GroupID, Star),
	#petrebornCfg{
		reborn = RawArg
	} = getCfg:getCfgPStack(cfg_petreborn, GroupID, Raw),
	LvForce * RawArg * StarArg.

-spec calcPetCastSys1(#recPetInfo{}) -> float().
calcPetCastSys1(#recPetInfo{pet_attas = Atta, pet_time = PetTime}) when PetTime > 0 ->
	case getExpressPetCalcForce() of
		1 ->
			doCalcPetCastSys1(Atta, 0);
		_ ->
			float(0)
	end;
calcPetCastSys1(#recPetInfo{pet_attas = Atta}) ->
	doCalcPetCastSys1(Atta, 0).

doCalcPetCastSys1([], Force) ->
	Force;
doCalcPetCastSys1([{K, V} | L], Force) ->
	#pet_strongerCfg{
		maxvalue = MaxValue,
		battlepower = BattlePower
	} = getCfg:getCfgPStack(cfg_pet_stronger, K),
	NewForce = BattlePower * (V / MaxValue) + Force,
	doCalcPetCastSys1(L, NewForce).


getExpressPetCalcForce() ->
	case getCfg:getCfgByKey(cfg_globalsetup, timemount_power) of
		#globalsetupCfg{setpara = [Val]} ->
			Val;
		_ ->
			1
	end.