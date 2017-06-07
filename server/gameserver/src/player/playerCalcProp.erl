%%%
%%%-------------------------------------------------------------------
%%% @author 罗维
%%% @copyright (C) 2014, <haowan123>
%%% @doc
%%% 玩家属性计算
%%% @end
%%% Created : 1. 七月 2014 20:30
%%%-------------------------------------------------------------------
-module(playerCalcProp).
-author(luowei).

-include("playerPrivate.hrl").

-export([
	saveBuffProp/4,
	getBattleProp/0,
	setBattleProp/1,
	calcBattleProp/0,
	calcBattleProp/3
]).

-export([
	changeProp_CalcType/3,  %[{id,value,calcType}]
	changeProp_CalcType/4,  %[{id,value,calcType}]
	changeProp_AddMulti/4,  %[{id,value}]
	changeProp_AddMulti/5
]).

-export([
	initBaseProp/2
]).

initBaseProp(Level, Career) ->
	Cfg = getCfg:getCfgPStack(cfg_player_base, Level, Career),
	case Cfg of
		#player_baseCfg{
			exp = Exp,
			maxHP = MaxHP,
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
		} ->
			playerState:setMaxExp(Exp),
			playerState:setBattlePropBase(?Prop_MaxHP, MaxHP),                                    %%生命：标志着单位的生存能力，改变到0时，执行其死亡后的逻辑
			playerState:setBattlePropBase(?Prop_PhysicalAttack, PhysicalAttack),                %%物攻：物理职业只有物攻
			playerState:setBattlePropBase(?Prop_MagicAttack, MagicAttack),                        %%法攻：法术职业只有法攻
			playerState:setBattlePropBase(?Prop_PhysicalDefence, PhysicalDefence),                %%物防：所有职业都有，细微偏差
			playerState:setBattlePropBase(?Prop_MagicDefence, MagicDefence),                    %%法防：所有职业都有，细微偏差
			playerState:setBattlePropBase(?Prop_CriticalLevel, CriticalLevel),                    %%暴击等级：通过公式转换成暴击率
			playerState:setBattlePropBase(?Prop_CriticalResistLevel, CriticalResistLevel),        %%抗爆等级：通过公式转换成减免暴击率
			playerState:setBattlePropBase(?Prop_CriticalDamageLevel, CriticalDamageLevel),        %%爆伤等级：初始为普通攻击的2倍伤害，通过公式转换成暴击伤害增加到暴击伤害上
			playerState:setBattlePropBase(?Prop_TenaciousLevel, TenaciousLevel),                %%韧性等级：爆伤等级的反属性
			playerState:setBattlePropBase(?Prop_HitLevel, HitLevel),                            %%命中等级：通过公式转换成命中率
			playerState:setBattlePropBase(?Prop_DodgeLevel, DodgeLevel),                        %%闪避等级：通过公式转换成闪避等级
			playerState:setBattlePropBase(?Prop_ArmorPenetrationLevel, ArmorPenetrationLevel),    %%破甲等级：通过转换公式，转换成破甲率，当命中公式判断为破甲伤害时，则忽略对方护甲
			playerState:setBattlePropBase(?Prop_HPRecover, HPRecover),                            %%生命秒回值
			playerState:setBattlePropBase(?Prop_MPRecover, MPRecover),                            %%法术秒回值

			playerState:setBattlePropModified(?Prop_MaxHP, true),
			playerState:setBattlePropModified(?Prop_PhysicalAttack, true),
			playerState:setBattlePropModified(?Prop_MagicAttack, true),
			playerState:setBattlePropModified(?Prop_PhysicalDefence, true),
			playerState:setBattlePropModified(?Prop_MagicDefence, true),
			playerState:setBattlePropModified(?Prop_CriticalLevel, true),
			playerState:setBattlePropModified(?Prop_CriticalResistLevel, true),
			playerState:setBattlePropModified(?Prop_CriticalDamageLevel, true),
			playerState:setBattlePropModified(?Prop_TenaciousLevel, true),
			playerState:setBattlePropModified(?Prop_HitLevel, true),
			playerState:setBattlePropModified(?Prop_DodgeLevel, true),
			playerState:setBattlePropModified(?Prop_ArmorPenetrationLevel, true),
			playerState:setBattlePropModified(?Prop_HPRecover, true),
			playerState:setBattlePropModified(?Prop_MPRecover, true),
			ok;
		Error ->
			?ERROR_OUT("error set RoleID[~p] Level[~p] career[~p] ret=~p", [playerState:getRoleID(), Level, Career, Error]),
			throw("player base no this career data cfg")
	end,
	ok.

%%保存buff增加或者减少的属性
-spec saveBuffProp(BuffID :: uint(), PlusList :: list(), MultList :: list(), Opreate :: add|del) -> ok.
saveBuffProp(_BuffID, PlusList, MultList, add) ->
	PropPcList = playerState:getBuffBattlePropPcList(),
	PropAddList = playerState:getBuffBattlePropAddList(),
	Fun = fun({Prop, Value}, Acc) ->
		case lists:keyfind(Prop, 1, Acc) of
			{Prop, OldValue} ->
				lists:keyreplace(Prop, 1, Acc, {Prop, OldValue + Value});
			_ ->
				[{Prop, Value} | Acc]
		end
	      end,
	Fun1 = fun(Elem, Acc) ->
		[Elem | Acc]
	       end,
	NewPropAddList = lists:foldl(Fun, PropAddList, PlusList),
	NewPropPcList = lists:foldl(Fun1, PropPcList, MultList),
	playerState:setBuffBattlePropPcList(NewPropPcList),
	playerState:setBuffBattlePropAddList(NewPropAddList);
saveBuffProp(BuffID, PlusList, MultList, del) ->
	PropPcList = playerState:getBuffBattlePropPcList(),
	PropAddList = playerState:getBuffBattlePropAddList(),
	Fun = fun({Prop, Value}, Acc) ->
		{Prop, OldValue} = case lists:keyfind(Prop, 1, Acc) of
			                   {Prop, _} = Pair ->
				                   Pair;
			                   _ ->
				                   ?ERROR_OUT("playerName [~ts] not find buff [~p] prop: [~p]", [playerState:getName(), BuffID, Prop]),
				                   {Prop, 0}
		                   end,
		case OldValue + Value == 0 of
			true ->
				lists:keydelete(Prop, 1, Acc);
			_ ->
				lists:keyreplace(Prop, 1, Acc, {Prop, OldValue + Value})
		end
	      end,
	Fun1 = fun(Elem, Acc) ->
		lists:delete(Elem, Acc)
	       end,
	NewPropAddList = lists:foldl(Fun, PropAddList, PlusList),
	NewPropPcList = lists:foldl(Fun1, PropPcList, MultList),
	playerState:setBuffBattlePropPcList(NewPropPcList),
	playerState:setBuffBattlePropAddList(NewPropAddList).

-spec getBattleProp() -> [#battleProp{}, ...].
getBattleProp() ->
	List = lists:seq(?Prop_Min, ?PropMax),
	Fun = fun(Prop, AccIn) ->
		Base = playerState:getBattlePropBase(Prop),
		AddValue = playerState:getBattlePropAdd(Prop),
		MVL = playerState:getBattlePropPC(Prop),
		Total = playerState:getBattlePropTotal(Prop),
		IsMod = playerState:getBattlePropModified(Prop),
		[#battleProp{
			propIndex = Prop,
			baseValue = Base,
			addValue = AddValue,
			multiValueList = MVL,
			totalValue = Total,
			isModified = IsMod
		} | AccIn]
	      end,
	lists:foldl(Fun, [], List).

-spec setBattleProp([#battleProp{}, ...]) -> ok.
setBattleProp(BattlePropList) ->
	Fun = fun(#battleProp{
		propIndex = Prop,
		baseValue = Base,
		addValue = AddValue,
		multiValueList = MVL,
		totalValue = Total,
		isModified = IsMod
	}) ->
		playerState:setBattlePropBase(Prop, Base),
		playerState:setBattlePropAdd(Prop, AddValue),
		playerState:setBattlePropPC(Prop, MVL),
		playerState:setBattlePropTotal(Prop, Total),
		playerState:setBattlePropModified(Prop, IsMod)
	      end,
	lists:foreach(Fun, BattlePropList).

%%计算战斗属性
-spec calcBattleProp() -> ok.
calcBattleProp() ->
	calcBattleProp(getBattleProp(), true, true).


-spec calcBattleProp(BattlePropList :: [#battleProp{}, ...], IsCalcFF :: boolean(), IsNotify :: boolean()) -> ok.
calcBattleProp(BattlePropList, _IsCalcFF, _IsNotify) ->
	NewBattlePropList = modifyProp(BattlePropList),
	BPL = battleProp:calcRoleBattleProp(
		NewBattlePropList,
		playerState:getLevel()
	),
	setBattleProp(BPL),
	notifyClientBattleProp(getBattleProp(), true).

%% ====================================================================
%% API functions
%% ====================================================================
%%修改属性状态
-spec modifyProp(BattlePropList :: [#battleProp{}, ...]) -> [#battleProp{}, ...].
modifyProp(BattlePropList) ->
	SetModFun =
		fun(Prop, L) ->
			BP0 = lists:keyfind(Prop, #battleProp.propIndex, L),
			lists:keystore(Prop, #battleProp.propIndex, L, BP0#battleProp{isModified = true})
		end,
	modifyProp(BattlePropList, BattlePropList, SetModFun).

modifyProp([], BattlePropList, _SetModFun) ->
	BattlePropList;
modifyProp([_ | L], BattlePropList, SetModFun) ->
	modifyProp(L, BattlePropList, SetModFun).


%%-spec calcDamageEquipFix(BattlePropList :: [#battleProp{}, ...]) -> {float(), float(), float(), float()}.
%%calcDamageEquipFix(BattlePropList) ->
%%	EquipList = playerState:getEquips(),
%%	case lists:keyfind(?EquipTypeWeapon, #recEquipEnhance.type, EquipList) of
%%		#recEquipEnhance{enhanceProp = EnhanceProp} ->
%%			EquipEnhanceProps = getEquipEnhanceValue(EnhanceProp),
%%			hasEquipFix(EquipEnhanceProps, BattlePropList);
%%		_ ->
%%			hasNotEquipFix(BattlePropList)
%%	end.
%%
%%-spec hasNotEquipFix(BattlePropList :: [#battleProp{}, ...]) -> {float(), float(), float(), float()}.
%%hasNotEquipFix(BattlePropList) ->
%%	%%总伤害值
%%	HolyBP = lists:keyfind(?Prop_holydamage, #battleProp.propIndex, BattlePropList),
%%	PhysBP = lists:keyfind(?Prop_physicaldamage, #battleProp.propIndex, BattlePropList),
%%	ShadowBP = lists:keyfind(?Prop_shadowdamage, #battleProp.propIndex, BattlePropList),
%%	ElementBP = lists:keyfind(?Prop_elementdamage, #battleProp.propIndex, BattlePropList),
%%	%%修正后值
%%	{
%%		HolyBP#battleProp.totalValue,
%%		PhysBP#battleProp.totalValue,
%%		ShadowBP#battleProp.totalValue,
%%		ElementBP#battleProp.totalValue
%%	}.
%%
%%-spec hasEquipFix(EquipBaseProps :: list(), BattlePropList :: [#battleProp{}, ...]) -> {float(), float(), float(), float()}.
%%hasEquipFix(EquipEnhanceProps, BattlePropList) ->
%%	InterValTime = playerState:getAttackIntervalTime(),
%%	%%武器伤害值
%%	HolyDamage = getEquipDamageValue(?Prop_holydamage, EquipEnhanceProps, BattlePropList),
%%	PhysDamage = getEquipDamageValue(?Prop_physicaldamage, EquipEnhanceProps, BattlePropList),
%%	ShadowDamage = getEquipDamageValue(?Prop_shadowdamage, EquipEnhanceProps, BattlePropList),
%%	ElementDamage = getEquipDamageValue(?Prop_elementdamage, EquipEnhanceProps, BattlePropList),
%%
%%	%%修正前伤害值
%%	HolyBP = lists:keyfind(?Prop_holydamage, #battleProp.propIndex, BattlePropList),
%%	PhysBP = lists:keyfind(?Prop_physicaldamage, #battleProp.propIndex, BattlePropList),
%%	ShadowBP = lists:keyfind(?Prop_shadowdamage, #battleProp.propIndex, BattlePropList),
%%	ElementBP = lists:keyfind(?Prop_elementdamage, #battleProp.propIndex, BattlePropList),
%%
%%	%%修正后伤害值
%%	FxHolyDamage = (HolyBP#battleProp.totalValue - HolyDamage) * InterValTime / 1000 + HolyDamage,
%%	FxPhysDamage = (PhysBP#battleProp.totalValue - PhysDamage) * InterValTime / 1000 + PhysDamage,
%%	FxShadowDamage = (ShadowBP#battleProp.totalValue - ShadowDamage) * InterValTime / 1000 + ShadowDamage,
%%	FxElementDamage = (ElementBP#battleProp.totalValue - ElementDamage) * InterValTime / 1000 + ElementDamage,
%%	{
%%		FxHolyDamage,
%%		FxPhysDamage,
%%		FxShadowDamage,
%%		FxElementDamage
%%	}.
%%
%%%%获取武器基础属性列表
%%-spec getEquipEnhanceValue(EnhanceProp) -> list() when
%%	EnhanceProp :: #rec_equip_enhance_info{}.
%%getEquipEnhanceValue(#rec_equip_enhance_info{
%%	propKey1 = EnhancePropKey1,
%%	propValue1 = EnhancePropValue1,
%%	propKey2 = EnhancePropKey2,
%%	propValue2 = EnhancePropValue2,
%%	propKey3 = EnhancePropKey3,
%%	propValue3 = EnhancePropValue3,
%%	propKey4 = EnhancePropKey4,
%%	propValue4 = EnhancePropValue4,
%%	propKey5 = EnhancePropKey5,
%%	propValue5 = EnhancePropValue5
%%}) ->
%%	EnhanceProp = [{EnhancePropKey1, EnhancePropValue1}, {EnhancePropKey2, EnhancePropValue2},
%%		{EnhancePropKey3, EnhancePropValue3}, {EnhancePropKey4, EnhancePropValue4},
%%		{EnhancePropKey5, EnhancePropValue5}],
%%	Fun = fun({PropKey, PropValue}, Acc) ->
%%		[{PropKey, PropValue} | Acc]
%%	      end,
%%	lists:foldl(Fun, [], EnhanceProp).
%%
%%%%获取武器上总属性值
%%-spec getEquipDamageValue(PropKey, EquipBaseProps, BattlePropList) -> float() when
%%	PropKey :: uint(), EquipBaseProps :: list(), BattlePropList :: [#battleProp{}, ...].
%%getEquipDamageValue(PropKey, EquipBaseProps, BattlePropList) ->
%%	case lists:keyfind(PropKey, 1, EquipBaseProps) of
%%		{PropKey, PropValue} ->
%%			EquipValue = PropValue;
%%		_ ->
%%			EquipValue = 0
%%	end,
%%	BP = lists:keyfind(PropKey, #battleProp.propIndex, BattlePropList),
%%	Fun = fun(Value, Acc) ->
%%		Acc * (1.0 + Value)
%%	      end,
%%	lists:foldl(Fun, EquipValue, BP#battleProp.multiValueList).
%%
%%%%根据职业进行伤害修正
%%-spec calcDamageCareerFix(HolyDamage, PhysDamage, ShadowDamage, ElementDamage, BattlePropList) -> {float(), float(), float(), float()} when
%%	HolyDamage :: float(), PhysDamage :: float(), ShadowDamage :: float(), ElementDamage :: float(), BattlePropList :: [#battleProp{}, ...].
%%calcDamageCareerFix(HolyDamage, PhysDamage, ShadowDamage, ElementDamage, BattlePropList) ->
%%	Rate = 1.0,%(1 + getFixArg(BattlePropList) * 0.002),
%%	{
%%		HolyDamage * Rate,
%%		PhysDamage * Rate,
%%		ShadowDamage * Rate,
%%		ElementDamage * Rate
%%	}.
%%
%%%%获取职业修正参数
%%-spec getFixArg(BattlePropList :: [#battleProp{}, ...]) -> float().
%%getFixArg(BattlePropList) ->
%%	Career = playerState:getCareer(),
%%	#player_descCfg{prime_attribute = Prop} = getCfg:getCfgPStack(cfg_player_desc, Career),
%%	getFixArg(Prop, BattlePropList).
%%getFixArg(Prop, BattlePropList) ->
%%	#battleProp{totalValue = TotalValue} = lists:keyfind(Prop, #battleProp.propIndex, BattlePropList),
%%	TotalValue.

%%通知客户端战斗属性改变
-spec notifyClientBattleProp(BattlePropList, IsNotify) -> ok when BattlePropList :: [#battleProp{}, ...], IsNotify :: boolean().
notifyClientBattleProp(BattlePropList, true) ->
	case playerState:isFirstEnterMap() of
		false -> %% 已上线
			Fun =
				fun(BP, {Num, AccIn}) ->
					#battleProp{propIndex = Index, totalValue = V} = BP,
					{Num + 1, [#pk_BattleProp{index = Index, value = V} | AccIn]}
				end,
			{N, List} = lists:foldl(Fun, {0, []}, BattlePropList),
			%%单个发送，每个需要9个字节
			%%所有发送，每个需要8个字节
			case N * 9 >= ?PropMax * 8 of
				true ->
					sendAllBattleProp(BattlePropList);
				_ ->
					sendBattleProp(List)
			end,
			notifyMoveSpeed(BattlePropList);
		_ -> %%未上线
			skip
	end,
	Fun1 = fun(#battleProp{propIndex = PropIndex} = BP, AccIn) ->
		lists:keystore(PropIndex, #battleProp.propIndex, AccIn, BP#battleProp{isModified = false})
	       end,
	NewBattlePropList = lists:foldl(Fun1, BattlePropList, BattlePropList),
	setBattleProp(NewBattlePropList);
notifyClientBattleProp(_, _) ->
	ok.

notifyMoveSpeed(BattlePropList) ->
	case lists:keyfind(?Prop_MoveSpeed, #battleProp.propIndex, BattlePropList) of
		#battleProp{totalValue = TV} ->
			playerPropSync:setFloat(?PubProp_MoveSpeed, float(TV));
		_ ->
			skip
	end,
	ok.


%%向客户端发送所有战斗属性
-spec sendAllBattleProp(BattlePropList) -> ok when
	BattlePropList :: [#battleProp{}, ...].
sendAllBattleProp(BattlePropList) ->
	?DEBUG_OUT("send battle prop ~p", [BattlePropList]),
	Code = playerState:getPlayerCode(),
	Fun = fun(BP, AccIn) ->
		Value = BP#battleProp.totalValue,
		[Value | AccIn]
	      end,
	List = lists:foldr(Fun, [], BattlePropList),
	Msg = #pk_GS2U_AllBattleProp{code = Code, battlePropInfo = List},
	playerMsg:sendNetMsg(Msg),
	ok.

%%向客户端发送列表中的战斗属性
-spec sendBattleProp(List) -> ok when
	List :: [#pk_BattleProp{}, ...].
sendBattleProp(List) ->
	?DEBUG_OUT("[~p]send battle prop ~n ~w,~nst=~w",
		[playerState:getRoleID(),List, misc:getStackTrace()]),
	Code = playerState:getPlayerCode(),
	Msg = #pk_GS2U_BattlePropList{code = Code, id = 0, battleProp = List},
	playerMsg:sendNetMsg(Msg),
	ok.



changeProp_CalcType([], _Operate, _IsNotify) ->
	ok;
changeProp_CalcType(PropList, Operate, IsNotify) ->
	changeProp_CalcType([], PropList, Operate, IsNotify).

%% 修改玩家的战斗属性值
-spec changeProp_CalcType(EnhanceProp1, ExtProp, Operate, IsNotify) -> ok when
	Prop :: {ExtPropKey4 :: integer(), ExtPropValue4 :: integer(), ExtCalcType4 :: integer()},
	EnhanceProp1 :: Prop, ExtProp :: Prop, Operate :: integer(), IsNotify :: boolean().
changeProp_CalcType(EnhanceProp, ExtProp, ?EquipOn, IsNotify) ->
	{ResultAddProp, ResultMulProp} = battleProp:calcPropGroup(EnhanceProp, ExtProp, ?EquipOn),
	BattleProp = playerCalcProp:getBattleProp(),
	NewBattleProp1 = battleProp:addBattlePropAddValue(BattleProp, ResultAddProp),
	NewBattleProp2 = battleProp:addBattlePropRateValue(NewBattleProp1, ResultMulProp),
	playerCalcProp:calcBattleProp(NewBattleProp2, true, IsNotify);
changeProp_CalcType(EnhanceProp, ExtProp, _, IsNotify) ->
	{ResultAddProp, ResultMulProp} = battleProp:calcPropGroup(EnhanceProp, ExtProp, ?EquipOff),
	BattleProp = playerCalcProp:getBattleProp(),
	NewBattleProp1 = battleProp:addBattlePropAddValue(BattleProp, ResultAddProp),
	NewBattleProp2 = battleProp:delBattlePropRateValue(NewBattleProp1, ResultMulProp),
	playerCalcProp:calcBattleProp(NewBattleProp2, true, IsNotify).


changeProp_AddMulti(AddPropList_Del, MultiPropList_Del, AddPropList, MultiPropList, IsNotify) ->
	BattleProp = playerCalcProp:getBattleProp(),
	NewBattleProp1 = battleProp:addBattlePropAddValue(BattleProp, AddPropList_Del),
	NewBattleProp2 = battleProp:delBattlePropRateValue(NewBattleProp1, MultiPropList_Del),
	NewBattleProp3 = battleProp:addBattlePropAddValue(NewBattleProp2, AddPropList),
	NewBattleProp4 = battleProp:addBattlePropRateValue(NewBattleProp3, MultiPropList),
	playerCalcProp:calcBattleProp(NewBattleProp4, true, IsNotify),
	ok.

changeProp_AddMulti(AddPropList, MultiPropList, ?EquipOn, IsNotify) ->
	BattleProp = playerCalcProp:getBattleProp(),
	NewBattleProp1 = battleProp:addBattlePropAddValue(BattleProp, AddPropList),
	NewBattleProp2 = battleProp:addBattlePropRateValue(NewBattleProp1, MultiPropList),
	playerCalcProp:calcBattleProp(NewBattleProp2, true, IsNotify);
changeProp_AddMulti(AddPropList, MultiPropList, _, IsNotify) ->
	BattleProp = playerCalcProp:getBattleProp(),
	NewBattleProp1 = battleProp:addBattlePropAddValue(BattleProp, AddPropList),
	NewBattleProp2 = battleProp:delBattlePropRateValue(NewBattleProp1, MultiPropList),
	playerCalcProp:calcBattleProp(NewBattleProp2, true, IsNotify).
