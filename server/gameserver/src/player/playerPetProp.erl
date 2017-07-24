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
	makePetProp/1,
%%	makePetProp/2,
%%	makePetProp_self/3,
	makePetProp_equip/3,

	onPetAttrChange2Master/3,
	updateBattlePetProp/3,
	onBattlePetAttrChange/2,

	makeSkillPetProp/2,
	calcBattlePetForce/1,
	getPetProps/1    %% 提取指定骑宠的所有属性，用于新版骑宠领地模拟战斗时的创建骑宠
]).

%%%-------------------------------------------------------------------
%% 生成骑宠最终战斗属性
%%
%% SVN-45132
%% \trunk\Doc\GDD\系统功能\数值改动\优化表格·.xlsx
%% 陈辉_策划 2017-07-12 12:01:04
%% 骑宠属性=骑宠自身属性+骑宠升星属性+骑宠转生属性+骑宠提升属性+骑宠装备属性（只针对出战生效）+骑宠提升属性
%% 1.基础成长属性=第2级的属性-第1级的属性 （注：配置表petLevelProperty中level=1表示第1级属性，level=2表示基础成长属性，其余废弃）
%% 2.骑宠自身属性=【骑宠一级属性*一级比例+基础成长属性*品质比例*（1+骑宠转生比例）*(LV-1)】*骑宠属性偏向
%% 3.骑宠升星属性=骑宠每次升星属性替换
%% 4.骑宠转生属性=骑宠每次转生必给属性
%% 5.骑宠装备属性=装备升级的属性
%% 6.骑宠提升属性=骑宠每次增加的提升属性
%% PS：骑宠转生比例，如果宠物没转生，默认骑宠转生比例等于0
%%
makePetProp(#recPetInfo{pet_level = Level} = PetInfo)->
	makePetProp(Level, PetInfo).

-spec makePetProp(Level::uint(), PetInfo::#recPetInfo{}) -> [#battleProp{}, ...].
makePetProp(Level, #recPetInfo{
	pet_id = PetID,
	pet_star = Star,
	pet_raw = Raw,
	pet_status = Status,
	pet_attas = PropListAdd	%% 【提升属性】
}) ->
	BattlePropList = battleProp:initBattleProp(false),
	{Quality, PropList} = makePetProp_self(Level, PetID, Raw),							%% 【自身属性】
	BattlePropList0 = battleProp:setBattlePropBaseValue(BattlePropList, PropList),
	PropListStar = makePetProp_star(Star, Quality),										%% 【升星属性】
	PropListRaw = makePetProp_raw(Raw, Quality),										%% 【转生属性】
	{PropListEquipAdd, PropListEquipMulti} = makePetProp_equip(Status),					%% 【装备属性】（仅出战时有效）
	BattlePropList1 = battleProp:addBattlePropAddValue(
		BattlePropList0,
		PropListStar ++ PropListRaw ++ PropListAdd ++ PropListEquipAdd
	),
	BattlePropList2 = battleProp:addBattlePropRateValue(
		BattlePropList1,
		PropListEquipMulti	%% 配置中依然保留接口可能导致骑宠装备产生乘法属性，与总公式略有区别
	),
	%% 原属性计算中，【天赋系统】【骑宠宝石】【骑宠符文】【角色属性附加（战斗属性151、152）】被去掉
	battleProp:calcCharBattleProp(BattlePropList2).

%%%-------------------------------------------------------------------
%% 1级属性与基础成长属性（目前配置支持14项属性）
%%
%% 1.基础成长属性=第2级的属性-第1级的属性 （注：配置表petLevelProperty中level=1表示第1级属性，level=2表示基础成长属性，其余废弃）
%% 陈辉_策划 2017-07-12  14:26:09
%% 额···那个等级没有意义额··· 等级1代表一级属性··· 等级2的那个代表成长属性···
%%
-spec petLevelProperty2PropList(#petLevelPropertyCfg{}) -> [{battle_prop(), number()}, ...].
petLevelProperty2PropList(#petLevelPropertyCfg{
	maxHP2 = MaxHp,
	physicalAttack = PhysicalAttack,
	magicAttack = MagicAttack,
	physicalDefence = PhysicalDefence,
	magicDefence = MagicDefence,
	criticalLevel = CriticalLevel,
	criticalResistLevel = CriticalResistLevel,
	criticalDamageLevel = CriticalDamageLevel,
	tenaciousLevel = TenaciousLevel,
	hitLevel = HitLevel,
	dodgeLevel = DodgeLevel,
	armorPenetrationLevel = ArmorPenetrationLevel,
	hPRecover = HPRecover,
	mPRecover = MPRecover
}) ->
	[
		{?Prop_MaxHP, MaxHp},
		{?Prop_PhysicalAttack, PhysicalAttack},
		{?Prop_MagicAttack, MagicAttack},
		{?Prop_PhysicalDefence, PhysicalDefence},
		{?Prop_MagicDefence, MagicDefence},
		{?Prop_CriticalLevel, CriticalLevel},
		{?Prop_CriticalResistLevel, CriticalResistLevel},
		{?Prop_CriticalDamageLevel, CriticalDamageLevel},
		{?Prop_TenaciousLevel, TenaciousLevel},
		{?Prop_HitLevel, HitLevel},
		{?Prop_DodgeLevel, DodgeLevel},
		{?Prop_ArmorPenetrationLevel, ArmorPenetrationLevel},
		{?Prop_HPRecover, HPRecover},
		{?Prop_MPRecover, MPRecover}
	].
-spec getLevel1PetProps() -> [{battle_prop(), number()}, ...].
getLevel1PetProps() ->
	Cfg = getCfg:getCfgPStack(cfg_petLevelProperty, 1),
	petLevelProperty2PropList(Cfg).
getPetLevelUpProp() ->
	Cfg = getCfg:getCfgPStack(cfg_petLevelProperty, 2),
	petLevelProperty2PropList(Cfg).

%%%-------------------------------------------------------------------
%% 骑宠自身属性
%%
%% 2.骑宠自身属性=【骑宠一级属性*一级比例+基础成长属性*品质比例*（1+骑宠转生比例）*(LV-1)】*骑宠属性偏向
%%
-spec makePetProp_self(Level::uint(), PetID::uint16(), Raw::uint()) -> {Quality::uint(), [#battleProp{}, ...]}.
makePetProp_self(Level, PetID, Raw) ->
	%% 【骑宠品质】【一级比例】【品质比例】【骑宠属性偏向集】【移动速度】【其它属性集】
	{Quality, LevelFactor, QualityFactor, PetPropFactors, RunSpeed, RareProp} =
		makePetProp_selfGetParams1(PetID),
	%% 【骑宠转生比例集】
	RebornFactors = makePetProp_selfGetParams2(Raw, Quality),
	%% 【骑宠一级属性集】
	PetLevelBaseProps = getLevel1PetProps(),
	%% 【基础成长属性集】
	LevelUpProps = getPetLevelUpProp(),
	%% 逐项属性执行公式
	%% 若【骑宠一级属性集】和【基础成长属性集】的元素数量或属性类型有差异
	%% 则需要扩展【骑宠一级属性集】之后再执行下列函数
	%% 此处由于这两个列表是由同一函数产生，故无此顾虑
	FunCalc =
		fun({PropID, Value}, Acc) ->	%% 传参为【骑宠一级属性】和计算结果
			AddBaseValue = getKeyValue(LevelUpProps, PropID, 0),	%% 【基础成长属性】
			RebornFactor = getKeyValue(RebornFactors, PropID, 0),	%% 【骑宠转生比例】
			PetFactor = getKeyValue(PetPropFactors, PropID, 1),		%% 【骑宠属性偏向】
			%% 按公式执行计算
			Calc =
				(Value * LevelFactor + AddBaseValue * QualityFactor * (1 + RebornFactor) * (Level - 1)) * PetFactor,
			[{PropID, Calc} | Acc]
		end,
	ListCalc = lists:foldl(FunCalc, [], PetLevelBaseProps),
	%% 策划陈辉确认
	%% pet.runSpeed作为移动速度未参与计算，而是直接添加到计算结果中；
	%% pet.rarePro作为附加的其它属性（与默认14条属性不同）未参与计算，而是直接添加到计算结果中。
	{Quality, [{?Prop_MoveSpeed, RunSpeed} | RareProp ++ ListCalc]}.

%% 提取计算参数
makePetProp_selfGetParams1(PetID) ->
	#petCfg{
		petquality = Quality,				%% 骑宠品质，用于后续计算
		base_Multi = LevelFactor,			%% 上述公式中所说的【一级比例】
		quality_Multi = QualityFactor,		%% 上述公式中所说的【品质比例】
		runSpeed = RunSpeed,				%% 附加不参与公式计算的【移动速度】
		rarePro = RareProp,					%% 附加不参与公式计算的【其它属性集】
		%% 上述公式中所说的【骑宠属性偏向】对应的14项属性参数
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
		mPRecover_Multi = MPRMulti,
		priProp_SkillMinusCDFactor = SkillMinusCDFactor

	} = getCfg:getCfgPStack(cfg_pet, PetID),
	%% 汇总【骑宠属性偏向】所需参数
	PetPropFactors =
		[
			{?Prop_MaxHP, HPMulti},
			{?Prop_PhysicalAttack, PSAMulti},
			{?Prop_MagicAttack, MSAMulti},
			{?Prop_PhysicalDefence, PDMulti},
			{?Prop_MagicDefence, MDMulti},
			{?Prop_CriticalLevel, CLMulti},
			{?Prop_CriticalResistLevel, CRLMulti},
			{?Prop_CriticalDamageLevel, CDLMulti},
			{?Prop_TenaciousLevel, TLMulti},
			{?Prop_HitLevel, HLMulti},
			{?Prop_DodgeLevel, DLMulti},
			{?Prop_ArmorPenetrationLevel, APLMulti},
			{?Prop_HPRecover, HPRMulti},
			{?Prop_MPRecover, MPRMulti},
			{?Prop_SkillMinusCDFactor, SkillMinusCDFactor}
		],
	{Quality, LevelFactor, QualityFactor, PetPropFactors, RunSpeed, RareProp}.
makePetProp_selfGetParams2(Raw, Quality) ->
	%% 上述公式中所说的【骑宠转生比例】对应的5项属性参数
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
				{?Prop_PhysicalAttack, PhysicalAttackMultiply},
				{?Prop_MagicAttack, MagicAttackMultiply},
				{?Prop_PhysicalDefence, PhysicalDefenceMultiply},
				{?Prop_MagicDefence, MagicDefenceMultiply}
			];
		_ ->
			[]
	end.

%%%-------------------------------------------------------------------
%% 骑宠升星属性
%%
%% 3.骑宠升星属性=骑宠每次升星属性替换
%%
-spec makePetProp_star(Star::uint(), Quality::uint()) -> [{battle_prop(), number()}, ...].
makePetProp_star(Star, Quality) ->
	%% 服务端数据存储时，Star从0开始，但客户端显示、策划配置均从1开始，因此逻辑计算需+1偏移
	case getCfg:getCfgByKey(cfg_pet_star, Star + 1, Quality) of
		#pet_starCfg{
			maxHP2 = MaxHP,
			physicalAttack = PhysicalAttack,
			magicAttack = MagicAttack,
			physicalDefence = PhysicalDefence,
			magicDefence = MagicDefence
		} ->
			[
				{?Prop_MaxHP, MaxHP},
				{?Prop_PhysicalAttack, PhysicalAttack},
				{?Prop_MagicAttack, MagicAttack},
				{?Prop_PhysicalDefence, PhysicalDefence},
				{?Prop_MagicDefence, MagicDefence}
			];
		_ ->
			[]
	end.

%%%-------------------------------------------------------------------
%% 骑宠转生属性
%%
%% 4.骑宠转生属性=骑宠每次转生必给属性
%%
-spec makePetProp_raw(Raw::uint(), Quality::uint()) -> [{battle_prop(), number()}, ...].
makePetProp_raw(Raw, Quality) ->
	case getCfg:getCfgByKey(cfg_pet_rebirth, Raw, Quality) of
		#pet_rebirthCfg{
			maxHP2 = MaxHP,
			physicalAttack = PhysicalAttack,
			magicAttack = MagicAttack,
			physicalDefence = PhysicalDefence,
			magicDefence = MagicDefence
		} ->
			[
				{?Prop_MaxHP, MaxHP},
				{?Prop_PhysicalAttack, PhysicalAttack},
				{?Prop_MagicAttack, MagicAttack},
				{?Prop_PhysicalDefence, PhysicalDefence},
				{?Prop_MagicDefence, MagicDefence}
			];
		_ ->
			[]
	end.

%%%-------------------------------------------------------------------
%% 骑宠装备属性
%%
%% 5.骑宠装备属性=装备升级的属性
%% 骑宠装备属性计算：
%% 遍历每一个装备，每个装备根据装备id和装备等级取配置petEquipment.baseProperty获得一个属性集
%% 再根据这个属性集与装备等级取配置petEquipmentLevel.propertyIndex，获得属性的计算方式
%%
-spec makePetProp_equip(Status::uint()) ->
	{
		[{battle_prop(), number()}, ...],
		[{battle_prop(), number()}, ...]
	}.
makePetProp_equip(Status) when Status >= ?PetState_Battle_Show ->
	EquipList = playerState:getPetEquip(),
	makePetProp_equip(EquipList, [], []);
makePetProp_equip(_Status) ->
	{[], []}.

%% 骑宠装备属性_遍历每一个装备（位置）
-spec makePetProp_equip(
	[#recPetEquip{}, ...],
	[{battle_prop(), number()}, ...],
	[{battle_prop(), number()}, ...]
) ->
	{
		[{battle_prop(), number()}, ...],
		[{battle_prop(), number()}, ...]
	}.
makePetProp_equip([], LA, LM) ->
	{LA, LM};
makePetProp_equip([#recPetEquip{equip_id = ID, equip_lv = Lv} | T], LA, LM) ->
	#petEquipmentCfg{baseProperty = Props} =
		getCfg:getCfgPStack(cfg_petEquipment, ID),
	{LANew, LMNew} = makePetProp_equip(Props, Lv, LA, LM),
	makePetProp_equip(T, LANew, LMNew).

%% 骑宠装备属性_生成每一个装备（位置）属性
-spec makePetProp_equip(
	[{Key::uint(), PA::float(), PB::float()}, ...],
	Lv::uint(),
	LA::[{battle_prop(), number()}, ...],
	LM::[{battle_prop(), number()}, ...]
) ->
	{
		[{battle_prop(), number()}, ...],
		[{battle_prop(), number()}, ...]
	}.
makePetProp_equip([], _Lv, LA, LM) ->
	{LA, LM};
makePetProp_equip([{Key, PA, PB} | T], Lv, LA, LM) ->
	#petEquipmentLevelCfg{propertyIndex = PropIndexs} =
		getCfg:getCfgPStack(cfg_petEquipmentLevel, Lv),
	{Key, Value, CalcType} = lists:keyfind(Key, 1, PropIndexs),
	case CalcType of
		0 ->
			makePetProp_equip(T, Lv, [{Key, Value * PA + Lv * PB} | LA], LM);
		1 ->
			makePetProp_equip(T, Lv, LA, [{Key, Value * PA + Lv * PB} | LM])
	end.

%%%-------------------------------------------------------------------
%% 生成技能宠物属性，计算出来的结果将会被放到地图上面
makeSkillPetProp(PetID, Level) ->
	%%技能召唤宠物受人物属性加成列表
	BattlePropList = battleProp:initBattleProp(false),
	{_, BasePropListInitValue} = makePetProp_self(Level, PetID, 0),

	BattlePropList0 = battleProp:setBattlePropBaseValue(BattlePropList, BasePropListInitValue),
	battleProp:calcCharBattleProp(BattlePropList0).


%%% 生成天赋系统属性
%-spec makePetTalentProp() -> {list(), list()}.
%makePetTalentProp() ->
%	playerTalent:getPetTalentProp().
%
%%% 生成宠物宝石属性
%-spec makePetGemProp() -> {list(), list()}.
%makePetGemProp() ->
%	playerPackage:getAllPetGemIDFromPackage().
%
%%% 角色属性加成
%makePetOwnerProp() ->
%	PetPlus = playerState:getBattlePropTotal(?Prop_PetDamagePlus),
%	PetReduce = playerState:getBattlePropTotal(?Prop_PetDamageReduce),
%	{[{?Prop_PetDamagePlus, PetPlus}, {?Prop_PetDamageReduce, PetReduce}], []}.



%%%-------------------------------------------------------------------
%% 提取指定骑宠的最终战斗属性，用于骑宠领地掠夺时模拟战斗重置战斗属性
-spec getPetProps(PetID :: uint64()) -> [#battleProp{}, ...].
getPetProps(PetID) ->
	case lists:keyfind(PetID, #recPetInfo.pet_id, playerState:getPets()) of
		#recPetInfo{} = Pet ->
			makePetProp(Pet);
		_ ->
			?ERROR_OUT("getPetProps can not find PetID:~p from RoleID:~p", [PetID, playerState:getRoleID()]),
			[]
	end.

%%%-------------------------------------------------------------------
%% 属性修改只针对出战宠物
onBattlePetAttrChange(Op, IsNotify) ->
	case playerPet:getPetBattle() of
		#recPetInfo{pet_id = PetID} ->
			onPetAttrChange2Master(PetID, Op, IsNotify);
		_ ->
			skip
	end,
	ok.

%%%-------------------------------------------------------------------
%% 计算骑宠战力
calcBattlePetForce(IsNotify) ->
	case playerPet:getPetBattle() of
		#recPetInfo{pet_id = PetID} ->
			playerForce:calcOnePetForce(PetID, IsNotify);
		_ ->
			skip
	end.

%%%-------------------------------------------------------------------
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
	pet_level = Level,
	pet_id = PetID,
	pet_raw = Raw,
	pet_status = Status} = Pet,
	?EquipOn,
	IsNotify
) when Status >= ?PetState_Battle_Show ->
	AddProps = makePetAllProps2MasterList(Pet),
	{_, BaseProps} = makePetProp_self(Level, PetID, Raw),
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
	pet_id = PetID, pet_status = Status} = Pet
) ->
	Props = makePetProp(Pet),
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
	?WARN_OUT("player[~p] update pet base prop failed, pet info[~p]",
		[playerState:getRoleID(), Pet]);
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



%%%-------------------------------------------------------------------
%% 属性计算时根据键值查找属性（带默认值），返回浮点数
getKeyValue(L, Key, D) ->
	case lists:keyfind(Key, 1, L) of
		{_, V2} ->
			V2;
		_ ->
			float(D)
	end.
