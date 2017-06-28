%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. 六月 2017 14:31
%%%-------------------------------------------------------------------
-module(playerPetProp).
-author("Administrator").


-include("playerPrivate.hrl").
-include("pet.hrl").



-define(PetPropToMaster, [
	?Prop_MaxHP,
	?Prop_PhysicalAttack,
	?Prop_MagicAttack,
	?Prop_PhysicalDefence,
	?Prop_MagicDefence,
	?Prop_CriticalLevel,
	?Prop_CriticalResistLevel,
	?Prop_CriticalDamageLevel,
	?Prop_TenaciousLevel,
	?Prop_HitLevel,
	?Prop_DodgeLevel,
	?Prop_ArmorPenetrationLevel
]).

%% API
-export([
	makePetProp/2,
	makePetBaseProp/4,
	onPetAttrChange2Master/3,
	updateBattlePetProp/3,
	onBattlePetAttrChange/2,
	makePetEquipProp/0,
	makePetEquipProp/3,
	makeSkillPetProp/2,
	calcBattlePetForce/1,
	getPetProps/1    %% 提取指定骑宠的所有属性，用于新版骑宠领地模拟战斗时的创建骑宠
]).


%%生成宠物属性,所有属性
makePetProp(Level, #recPetInfo{
	pet_id = PetID,
	pet_star = Star,
	pet_raw = Raw,
	pet_status = Status
}) when Status >= ?PetState_Battle_Show ->
	%%宠物基础值
	#petCfg{
		petquality = Quality,
		quality_Multi = QualityMulti
	} = getCfg:getCfgByKey(cfg_pet, PetID),
	PropList = makePetBaseProp(PetID, Level, Star, Raw),
	BattlePropList = battleProp:initBattleProp(false),
	BattlePropList0 = battleProp:setBattlePropBaseValue(BattlePropList, PropList),

	%%宠物提升属性
	{UpAddProps, UpMultiProps} = makePetAddProp(PetID),

	{TurnAddProps, TurnMultiProps} = makePetTurnProp(Raw, Quality, QualityMulti),
	{UpStarAddProps, UpStarMultiProps} = makePetUpStarProp(Star, Quality),

	%%天赋系统
	{TalAddProps, TalMultiProps} = makePetTalentProp(),

	%%宠物宝石
	{GemAddProps, GemMultiProps} = makePetGemProp(),

	{OwnerPetAddProps, OwnerPetMultiProps} = makePetOwnerProp(),
	%%宠物装备
	{EquipAddProps, EquipMultiProps} = makePetEquipProp(),
	%%宠物符文
	{RuneAddProps, RuneMultiProps} = playerRune:getPetRunePropList([PetID]),

	BattlePropList1 = battleProp:addBattlePropAddValue(
		BattlePropList0,
		UpStarAddProps ++ TurnAddProps ++ UpAddProps ++
			TalAddProps ++ GemAddProps ++ EquipAddProps ++
			RuneAddProps ++ OwnerPetAddProps
	),
	BattlePropList2 = battleProp:addBattlePropRateValue(
		BattlePropList1,
		UpStarMultiProps ++ TurnMultiProps ++ UpMultiProps ++ TalMultiProps ++ GemMultiProps ++
			EquipMultiProps ++ RuneMultiProps ++ OwnerPetMultiProps
	),
	battleProp:calcCharBattleProp(BattlePropList2);
makePetProp(Level, #recPetInfo{
	pet_id = PetID,
	pet_star = Star,
	pet_raw = Raw
}) ->
	%%宠物基础值
	#petCfg{
		petquality = Quality,
		quality_Multi = QualityMulti
	} = getCfg:getCfgByKey(cfg_pet, PetID),
	PropList = makePetBaseProp(PetID, Level, Star, Raw),
	BattlePropList = battleProp:initBattleProp(false),
	BattlePropList0 = battleProp:setBattlePropBaseValue(BattlePropList, PropList),

	%%宠物提升属性
	{AttrAddProps, AttrMultiProps} = makePetAddProp(PetID),

	{TurnAddProps, TurnMultiProps} = makePetTurnProp(Raw, Quality,QualityMulti),
	{UpStarAddProps, UpStarMultiProps} = makePetUpStarProp(Star, Quality),

	%%宠物符文
	{RuneAddProps, RuneMultiProps} = playerRune:getPetRunePropList([PetID]),

	BattlePropList1 = battleProp:addBattlePropAddValue(
		BattlePropList0,
		UpStarAddProps ++ TurnAddProps ++ AttrAddProps ++ RuneAddProps
	),
	BattlePropList2 = battleProp:addBattlePropRateValue(
		BattlePropList1,
		UpStarMultiProps ++ TurnMultiProps ++  AttrMultiProps ++ RuneMultiProps
	),
	battleProp:calcCharBattleProp(BattlePropList2).



%%生成技能宠物属性，计算出来的结果将会被放到地图上面
makeSkillPetProp(PetID, Level) ->
	%%技能召唤宠物受人物属性加成列表
	BattlePropList = battleProp:initBattleProp(false),
	BasePropListInitValue = makePetBaseProp(PetID, Level, 0, 0),
	BattlePropList0 = battleProp:setBattlePropBaseValue(BattlePropList, BasePropListInitValue),
	battleProp:calcCharBattleProp(BattlePropList0).

makePetTurnProp(Raw, Quality, _QualityMulti) ->
	case getCfg:getCfgByKey(cfg_pet_rebirth, Raw, Quality) of
		#pet_rebirthCfg{
			maxHP2 = MaxHP,
			physicalAttack = PhysicalAttack,
			magicAttack = MagicAttack,
			physicalDefence = PhysicalDefence,
			magicDefence = MagicDefence
		} ->
			{
				[
					{?Prop_MaxHP, MaxHP},
					{?Prop_PhysicalAttack, PhysicalAttack},
					{?Prop_MagicAttack, MagicAttack},
					{?Prop_PhysicalDefence, PhysicalDefence},
					{?Prop_MagicDefence, MagicDefence}
				]
				, []
			};
		_ ->
			{[], []}
	end.

makePetUpStarProp(Star, Quality) ->
	case getCfg:getCfgByKey(cfg_pet_star, Star, Quality) of
		#pet_starCfg{
			maxHP2 = MaxHP,
			physicalAttack = PhysicalAttack,
			magicAttack = MagicAttack,
			physicalDefence = PhysicalDefence,
			magicDefence = MagicDefence
		} ->
			{
				[
					{?Prop_MaxHP, MaxHP},
					{?Prop_PhysicalAttack, PhysicalAttack},
					{?Prop_MagicAttack, MagicAttack},
					{?Prop_PhysicalDefence, PhysicalDefence},
					{?Prop_MagicDefence, MagicDefence}
				]
				, []
			};
		_ ->
			{[], []}
	end.

getPetLevelUpProp() ->
	#petLevelPropertyCfg{
		maxHP2 = MaxHp2,
		physicalAttack = PhysicalAttack2,
		magicAttack = MagicAttack2,
		physicalDefence = PhysicalDefence2,
		magicDefence = MagicDefence2,
		criticalLevel = CriticalLevel2,
		criticalResistLevel = CriticalResistLevel2,
		criticalDamageLevel = CriticalDamageLevel2,
		tenaciousLevel = TenaciousLevel2,
		hitLevel = HitLevel2,
		dodgeLevel = DodgeLevel2,
		armorPenetrationLevel = ArmorPenetrationLevel2,
		hPRecover = HPRecover2,
		mPRecover = MPRecover2
	} = getCfg:getCfgPStack(cfg_petLevelProperty, 2),
	[
		{?Prop_MaxHP, MaxHp2},
		{?Prop_PhysicalAttack, PhysicalAttack2},
		{?Prop_MagicAttack, MagicAttack2},
		{?Prop_PhysicalDefence, PhysicalDefence2},
		{?Prop_MagicDefence, MagicDefence2},
		{?Prop_CriticalLevel, CriticalLevel2},
		{?Prop_CriticalResistLevel, CriticalResistLevel2},
		{?Prop_CriticalDamageLevel, CriticalDamageLevel2},
		{?Prop_TenaciousLevel, TenaciousLevel2},
		{?Prop_HitLevel, HitLevel2},
		{?Prop_DodgeLevel, DodgeLevel2},
		{?Prop_ArmorPenetrationLevel, ArmorPenetrationLevel2},
		{?Prop_HPRecover, HPRecover2},
		{?Prop_MPRecover, MPRecover2}
	].

%%生成人民币宠物基础属性，计算出来的结果会被存放到进程字典内
%% -spec makePetBaseProp(PetID :: uint(), Leve::uint(), Star::uint(), Raw::uint()) -> list().
makePetBaseProp(PetID, Level, _Star, Raw) ->
	#petCfg{
		petquality = Quality,
		base_Multi = LevelFactor,
		quality_Multi = QualityFactor,
		runSpeed = RunSpeed,
		maxHP_Multi = HPMulti,
		physicalAttack_Multi = PSAMulti,
		magicAttack_Multi = MSAMulti,
		physicalDefence_Multi = PDMulti,
		magicDefence_Multi = MDMulti,
		criticalLevel_Multi = CLMulti,
		criticalResistLevel_Multi = CRLMulti,
		criticalDamageLevel_Multi = CDLMulti,
		tenaciousLevel_Multi = TLMulti,
		hitLevel_Multi = HLMulti,
		dodgeLevel_Multi = DLMulti,
		armorPenetrationLevel_Multi = APLMulti,
		hPRecover_Multi = HPRMulti,
		mPRecover_Multi = MPRMulti
	} = getCfg:getCfgPStack(cfg_pet, PetID),


	PetPropFactors =
		[
			{?Prop_MaxHP, HPMulti},
			{?Prop_PhysicalAttack,PSAMulti},
			{?Prop_MagicAttack, MSAMulti},
			{?Prop_PhysicalDefence, PDMulti},
			{?Prop_MagicDefence, MDMulti},
			{?Prop_CriticalLevel,CLMulti},
			{?Prop_CriticalResistLevel, CRLMulti},
			{?Prop_CriticalDamageLevel, CDLMulti},
			{?Prop_TenaciousLevel, TLMulti},
			{?Prop_HitLevel, HLMulti},
			{?Prop_DodgeLevel,DLMulti},
			{?Prop_ArmorPenetrationLevel,APLMulti},
			{?Prop_HPRecover,HPRMulti},
			{?Prop_MPRecover,MPRMulti}
		],

	LevelUpProps = getPetLevelUpProp(),
	PetLevelBaseProps =  getLevel1PetProps(),
	RebornFactors = getRebornFactorList(Raw, Quality),
	
	lists:foldl(
		fun({PropID, Value}, Acc) ->

			PetFactor = getKeyValue(PetPropFactors, PropID, 1),
			AddBaseValue = getKeyValue(LevelUpProps, PropID, 0),
			RebornFactor = getKeyValue(RebornFactors, PropID, 0),

			FinalValue =
				(Value * LevelFactor + AddBaseValue * QualityFactor * (1 + RebornFactor) * (Level - 1)) * PetFactor,

			lists:keystore(PropID, 1, Acc, {PropID, FinalValue})
			
		end, PetLevelBaseProps, [{?Prop_MoveSpeed, RunSpeed} | LevelUpProps]).


getRebornFactorList(Raw, Quality)->
  case getCfg:getCfgByKey(cfg_pet_rebirth, Raw, Quality) of
	  #pet_rebirthCfg{
		  maxHP2Multiply = MaxHP2Multiply,
		  physicalAttackMultiply = PhysicalAttackMultiply,
		  magicAttackMultiply = MagicAttackMultiply,
		  physicalDefenceMultiply = PhysicalDefenceMultiply,
		  magicDefenceMultiply = MagicDefenceMultiply
	  } ->

		  [
			  {?Prop_MaxHP, MaxHP2Multiply},
			  {?Prop_PhysicalAttack,PhysicalAttackMultiply},
			  {?Prop_MagicAttack, MagicAttackMultiply},
			  {?Prop_PhysicalDefence, PhysicalDefenceMultiply},
			  {?Prop_MagicDefence, MagicDefenceMultiply}
		  ];
	  _ ->
		  []
  end.


getLevel1PetProps()->
    case getCfg:getCfgPStack(cfg_petLevelProperty, 1) of
	    #petLevelPropertyCfg{
		    maxHP2 = MaxHp1,
		    physicalAttack = PhysicalAttack1,
		    magicAttack = MagicAttack1,
		    physicalDefence = PhysicalDefence1,
		    magicDefence = MagicDefence1,
		    criticalLevel = CriticalLevel1,
		    criticalResistLevel = CriticalResistLevel1,
		    criticalDamageLevel = CriticalDamageLevel1,
		    tenaciousLevel = TenaciousLevel1,
		    hitLevel = HitLevel1,
		    dodgeLevel = DodgeLevel1,
		    armorPenetrationLevel = ArmorPenetrationLevel1,
		    hPRecover = HPRecover1,
		    mPRecover = MPRecover1
	    } ->
		    [
			    {?Prop_MaxHP, MaxHp1},
			    {?Prop_PhysicalAttack,PhysicalAttack1},
			    {?Prop_MagicAttack, MagicAttack1},
			    {?Prop_PhysicalDefence, PhysicalDefence1},
			    {?Prop_MagicDefence, MagicDefence1},
			    {?Prop_CriticalLevel,CriticalLevel1},
			    {?Prop_CriticalResistLevel, CriticalResistLevel1},
			    {?Prop_CriticalDamageLevel, CriticalDamageLevel1},
			    {?Prop_TenaciousLevel, TenaciousLevel1},
			    {?Prop_HitLevel, HitLevel1},
			    {?Prop_DodgeLevel,DodgeLevel1},
			    {?Prop_ArmorPenetrationLevel,ArmorPenetrationLevel1},
			    {?Prop_HPRecover,HPRecover1},
			    {?Prop_MPRecover,MPRecover1}
		    ];
		_ ->
			[]
    end.


getKeyValue(L, Key, D)->
	case lists:keyfind(Key, 1, L) of
		{_, V2}->
			V2;
		_ ->
			float(D)
	end.



%%生成宠物装备属性
%% -spec makePetEquipProp() -> {list(), list()}.
makePetEquipProp() ->
	EquipList = playerState:getPetEquip(),
	makePetEquipProp(EquipList, [], []).
makePetEquipProp([], AddProps, MultiProps) ->
	{AddProps, MultiProps};
makePetEquipProp([#recPetEquip{equip_id = ID, equip_lv = Lv} | EquipList], AddProps, MultiProps) ->
	#petEquipmentCfg{baseProperty = Props} = getCfg:getCfgPStack(cfg_petEquipment, ID),
	makePetEquipProp(EquipList, AddProps, MultiProps, Lv, Props).
makePetEquipProp(EquipList, AddProps, MultiProps, _Lv, []) ->
	makePetEquipProp(EquipList, AddProps, MultiProps);
makePetEquipProp(EquipList, AddProps, MultiProps, Lv, [{Key, ParaA, ParaB} | Props]) ->
	#petEquipmentLevelCfg{propertyIndex = PropIndexs} = getCfg:getCfgPStack(cfg_petEquipmentLevel, Lv),
	{Key, Value, CalcType} = lists:keyfind(Key, 1, PropIndexs),
	case CalcType of
		0 ->
			NewAddProps = [{Key, Value * ParaA + Lv * ParaB} | AddProps],
			makePetEquipProp(EquipList, NewAddProps, MultiProps, Lv, Props);
		1 ->
			NewMultiProps = [{Key, Value * ParaA + Lv * ParaB} | MultiProps],
			makePetEquipProp(EquipList, AddProps, NewMultiProps, Lv, Props)
	end.

%%生成天赋系统属性
-spec makePetTalentProp() -> {list(), list()}.
makePetTalentProp() ->
	playerTalent:getPetTalentProp().

%%生成宠物宝石属性
-spec makePetGemProp() -> {list(), list()}.
makePetGemProp() ->
	playerPackage:getAllPetGemIDFromPackage().

makePetOwnerProp() ->
	PetPlus = playerState:getBattlePropTotal(?Prop_PetDamagePlus),
	PetReduce = playerState:getBattlePropTotal(?Prop_PetDamageReduce),
	{[{?Prop_PetDamagePlus, PetPlus}, {?Prop_PetDamageReduce, PetReduce}], []}.


%%生成宠物提升属性
-spec makePetAddProp(PetID :: uint()) -> {list(), list()}.
makePetAddProp(PetID) ->
	Pets = playerState:getPets(),
	case lists:keyfind(PetID, #recPetInfo.pet_id, Pets) of
		#recPetInfo{pet_attas = Attas} ->
			{Attas, []};
		_ ->
			{[], []}
	end.



%% 提取指定骑宠的所有附加属性，用于新版骑宠领地模拟战斗时的创建骑宠
%% 模拟makCallPetProp/4
-spec getPetProps(PetID :: uint64()) -> {[{PropPIndex :: uint32(), PropPValue :: float()}, ...], [{PropMIndex :: uint32(), PropMValue :: float()}, ...]}.
getPetProps(PetID) ->
	case lists:keyfind(PetID, #recPetInfo.pet_id, playerState:getPets()) of
		#recPetInfo{pet_star = Star, pet_raw = Raw} ->
			%%基础属性
			PropList = makePetBaseProp(PetID, playerState:getLevel(), Star, Raw),
			%%宠物提升属性
			{AttaAddProps, AttaMultiProps} = makePetAddProp(PetID),
			%%天赋系统
			{TalAddProps, TalMultiProps} = makePetTalentProp(),
			%%宠物宝石
			{GemAddProps, GemMultiProps} = makePetGemProp(),
			%%拥有者附加属性（这个名字是我胡诌的）
			{OwnerPetAddProps, OwnerPetMultiProps} = makePetOwnerProp(),
			%%宠物装备
			{EquipAddProps, EquipMultiProps} = makePetEquipProp(),
			%%宠物符文
			{RuneAddProps, RuneMultProps} = playerRune:getPetRunePropList([PetID]),
			%%合并相同属性并返回
			FunCombine =
				fun({Key, Value}, R) ->
					case lists:keyfind(Key, 1, R) of
						{_, ValueOld} ->
							lists:keyreplace(Key, 1, R, {Key, Value + ValueOld});
						_ ->
							[{Key, Value} | R]
					end
				end,
			ListAddOld = PropList ++ AttaAddProps ++ TalAddProps ++ GemAddProps ++ EquipAddProps ++ RuneAddProps ++ OwnerPetAddProps,
			ListMultiOld = AttaMultiProps ++ TalMultiProps ++ GemMultiProps ++ EquipMultiProps ++ RuneMultProps ++ OwnerPetMultiProps,
			ListAddNew = lists:foldl(FunCombine, [], ListAddOld),
			ListMultiNew = lists:foldl(FunCombine, [], ListMultiOld),
			{ListAddNew, ListMultiNew};
		_ ->
			?ERROR_OUT("getPetProps can not find PetID:~p from RoleID:~p", [PetID, playerState:getRoleID()]),
			{[], []}
	end.

%%% 提取指定骑宠的战力，用于新版骑宠领地模拟战斗时的创建骑宠
%-spec getPetForce(PetID :: uint64()) -> uint64().
%getPetForce(PetID) ->
%	case lists:keyfind(PetID, #recPetInfo.pet_id, playerState:getPets()) of
%		#recPetInfo{pet_force = PetForce} ->
%			PetForce;
%		_ ->
%			0
%	end.

%% 属性修改只针对出战宠物
onBattlePetAttrChange(Op, IsNotify) ->
	case playerPet:getPetBattle() of
		#recPetInfo{pet_id = PetID} ->
			onPetAttrChange2Master(PetID, Op, IsNotify);
		_ ->
			skip
	end,
	ok.

calcBattlePetForce(IsNotify) ->
	case playerPet:getPetBattle() of
		#recPetInfo{pet_id = PetID} ->
			playerForce:calcOnePetForce(PetID, IsNotify);
		_ ->
			skip
	end.

%% 通用
onPetAttrChange2Master(PetID, Op, IsNotify) ->
	case lists:keyfind(PetID, #recPetInfo.pet_id, playerState:getPets()) of
		#recPetInfo{pet_id = PetID} = Pet ->
			doPetAttrChange2Master(Pet, Op, IsNotify);
		_ ->
			skip
	end.


%% 出战
doPetAttrChange2Master(#recPetInfo{
	pet_id = PetID,
	pet_star = Star,
	pet_raw = Raw,
	pet_status = Status} = Pet,
	?EquipOn,
	IsNotify
) when Status >= ?PetState_Battle_Show ->
	Level = playerState:getLevel(),
	AddProps = makePetAllProps2MasterList(Pet),
	BaseProps = makePetBaseProp(PetID, Level, Star, Raw),
	playerCalcProp:changeProp_CalcType(AddProps, ?EquipOn, IsNotify),
	?DEBUG_OUT("role[~p],pet[~p] add to master ~w",
		[playerState:getRoleID(), PetID, AddProps]),
	resetBattlePetBaseProp2Local(playerPet:getPetBattleCode(), BaseProps, Level, Pet),
	ok;
%% 其他情况
doPetAttrChange2Master(
	#recPetInfo{pet_id = PetID} = Pet,
	?EquipOn,
	IsNotify
) ->
	AddProps = makePetAllProps2MasterList(Pet),
	?DEBUG_OUT("role[~p],pet[~p] add to master ~w",
		[playerState:getRoleID(), PetID, AddProps]),
	playerCalcProp:changeProp_CalcType(AddProps, ?EquipOn, IsNotify),
	ok;
doPetAttrChange2Master(
	#recPetInfo{pet_id = PetID} = Pet,
	?EquipOff,
	IsNotify
) ->
	AddProps = makePetAllProps2MasterList(Pet),
	?DEBUG_OUT("role[~p],pet[~p] dec to master ~w",
		[playerState:getRoleID(), PetID, AddProps]),
	playerCalcProp:changeProp_CalcType(AddProps, ?EquipOff, IsNotify),
	ok;
doPetAttrChange2Master(_Pet, _OP, _IsNotify) ->
	error.


makePetAllProps2MasterList(#recPetInfo{
	pet_id = PetID, pet_status = Status } = Pet
) ->
	Level = playerState:getLevel(),
	Props = makePetProp(Level, Pet),
	calcAddPropList(Props, getPropPercent(PetID, Status)).

getPropPercent(PetID, Status) when Status >= ?PetState_Battle_Show ->
	case getCfg:getCfgByArgs(cfg_pet, PetID) of
		#petCfg{masterAdd = BP} -> BP;
		_ -> 0
	end;
getPropPercent(PetID, ?PetState_Assist) ->
	case getCfg:getCfgByArgs(cfg_pet, PetID) of
		#petCfg{petToMaster = AP} -> AP;
		_ -> 0
	end;
getPropPercent(PetID, _Status) ->
	case getCfg:getCfgByArgs(cfg_pet, PetID) of
		#petCfg{idlePetToMaster = IP} -> IP;
		_ -> 0
	end.

calcAddPropList(_Props, 0) ->
	[];
calcAddPropList(Props, Percent) ->
	[{Key, Val * Percent, ?PropCalcType_Add} ||
		#battleProp{propIndex = Key, totalValue = Val} <- Props, lists:member(Key, ?PetPropToMaster)].


resetBattlePetBaseProp2Local(0, _, _, #recPetInfo{pet_status = ?PetState_Battle_Hide}) ->
	skip;
resetBattlePetBaseProp2Local(0, _, _, Pet) ->
	?ERROR_OUT("player[~ts] update pet base prop failed, pet info[~p]~n~p",
		[playerState:getName(), Pet, misc:getStackTrace()]);
resetBattlePetBaseProp2Local(Code, Prop, Lv, Pet) ->
	playerPropSync:setInt(?PubProp_PetTurnRaw, Pet#recPetInfo.pet_raw),
	monsterInterface:updatePetLevel(Code, Lv),
	?DEBUG_OUT("battlepetprop,~p,~p,~p", [Pet#recPetInfo.pet_id, Code, Prop]),
	monsterInterface:setPetBaseProp(Code, Prop).


%%更新宠物属性(加法和乘法值),仅仅给出战宠物加成
-spec updateBattlePetProp(AddProps :: list(), MultiProps :: list(), Flag :: boolean()) -> ok.
updateBattlePetProp(AddProps, MultiProps, Flag) ->
	%PetBattle = getPetBattle(),
	monsterInterface:changeProp_AddMulti(playerPet:getPetBattleCode(), AddProps, MultiProps, Flag).
