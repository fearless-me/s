%% @author zhongyunawei
%% @doc @todo 战斗属性相关计算.


-module(battleProp).
-author(zhongyuanwei).

-include("type.hrl").
-include("char.hrl").
-include("config.hrl").
-include("logger.hrl").
-include("equip.hrl").
-include("item.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initBattleProp/1,
%%		 initRmbPetBaseProp/4,
	initMonsterBaseProp/1
%%		 initSkillPetBaseProp/2,
]).
-export([
	setBattlePropBaseValue/2,
	addBattlePropAddValue/2,
	addBattlePropRateValue/2,
	delBattlePropRateValue/2,
	getBattlePropTotalValue/2
]).

-export([
	calcRoleBattleProp/2,
	calcCharBattleProp/1,
	calcPropGroup/2,
	calcPropGroup/3
]).



calcPropGroup( PropList, Operate) ->
	calcPropGroup([], PropList, Operate).

calcPropGroup(undefined, _ExtPropList, _Operate) ->
	{[],[]};
calcPropGroup(_EnhancePropList, undefined, _Operate) ->
	{[],[]};
calcPropGroup(EnhancePropList, ExtPropList, Operate) ->
	Fun = fun({Key, Val, Calc}, {AddProps, MulProps}) ->
		case Key > 0 of
			true ->
				if
					Calc =:= ?PropCalcType_Add andalso Operate =:= ?EquipOn ->
						{[{Key, Val} | AddProps], MulProps};
					Calc =:= ?PropCalcType_Add andalso Operate =:= ?EquipOff ->
						{[{Key, -(Val)} | AddProps], MulProps};
					Calc =:= ?PropCalcType_Mul ->
						{AddProps, [{Key, Val} | MulProps]};
					true ->
						?ERROR_OUT("unknown calc type(~p)",[Operate]),
						{AddProps, MulProps}
				end;
			false ->
				{AddProps, MulProps}
		end
	      end,
	{List1, List2} = lists:foldl(Fun, {[], []}, EnhancePropList),
	lists:foldl(Fun, {List1, List2}, ExtPropList).

%%
%%%%初始化人民币宠物基础属性
%%-spec initRmbPetBaseProp(PetID::uint(),Lv::uint(),Star::uint(),Raw::uint()) -> list().
%%initRmbPetBaseProp(PetID, Lv, Star, Raw) ->
%%	#petCfg{
%%		pveSpeed = PveSpeed,
%%		petquality = Quality,
%%		runSpeed = RunSpeed,
%%		hpMulti = HpMulti,
%%		tough = Tough,
%%		score = Score,
%%		eleDamMulti = EleDamMulti,
%%		eleDefMulti = EleDefMulti,
%%		phycDefMulti = PhycDefMulti,
%%		holyDefMulti = HolyDefMulti,
%%		shadDefMulti = ShadDefMulti,
%%		phycDamMulti = PhycDamMulti,
%%		holyDamMulti = HolyDamMulti,
%%		shadDamMulti = ShadDamMulti
%%	} = getCfg:getCfgPStack(cfg_pet, PetID),
%%	#petLevelPropertyCfg{
%%		holyDef = HolyDef,
%%		shadDef = ShadDef,
%%		phyDef = PhyDef,
%%		eleDef = EleDef,
%%		maxHP = MaxHp,
%%		eleDam = EleDam,
%%		phycDam = PhycDam,
%%		holyDam = HolyDam,
%%		shadDam = ShadDam
%%	} = getCfg:getCfgPStack(cfg_petLevelProperty, Lv),
%%	#petrebornCfg{
%%		star = StarArg
%%	} = getCfg:getCfgPStack(cfg_petreborn, Star),
%%	#petrebornCfg{
%%		reborn = RawArg
%%	} = getCfg:getCfgPStack(cfg_petreborn, Raw),
%%	#petrebornCfg{
%%		quanlity  = QualityArg
%%	} = getCfg:getCfgPStack(cfg_petreborn, Quality),
%%	[
%%	 {?Prop_physicaldamage, PhycDamMulti * PhycDam * StarArg * QualityArg * RawArg},
%%	 {?Prop_MaxHP, MaxHp * HpMulti * StarArg * QualityArg * RawArg},
%%	 {?Prop_physicaldefence, PhycDefMulti * PhyDef},
%%	 {?Prop_shadowdefence, ShadDefMulti * ShadDef},
%%	 {?Prop_holydefence, HolyDefMulti * HolyDef},
%%	 {?Prop_tough, Tough},
%%	 {?Prop_hitratio, Score},
%%	 {?Prop_movespeed, RunSpeed},
%%	 {?Prop_petattackspeed, PveSpeed},
%%	 {?Prop_elementdefence, EleDefMulti * EleDef},
%%	 {?Prop_holydamage, HolyDamMulti * HolyDam * StarArg * QualityArg * RawArg},
%%	 {?Prop_elementdamage, EleDamMulti * EleDam * StarArg * QualityArg * RawArg},
%%	 {?Prop_shadowdamage, ShadDamMulti * ShadDam * StarArg * QualityArg * RawArg}
%%	].
%%
%%%%初始化技能宠物基础属性
%%-spec initSkillPetBaseProp(PetID::uint(),Lv::uint()) -> list().
%%initSkillPetBaseProp(PetID, Lv) ->
%%	#petCfg{
%%		score = Score,
%%		runSpeed = RunSpeed,
%%		hpMulti = HpMulti,
%%		tough = Tough,
%%		eleDamMulti = EleDamMulti,
%%		eleDefMulti = EleDefMulti,
%%		phycDefMulti = PhycDefMulti,
%%		holyDefMulti = HolyDefMulti,
%%		shadDefMulti = ShadDefMulti,
%%		phycDamMulti = PhycDamMulti,
%%		holyDamMulti = HolyDamMulti,
%%		shadDamMulti = ShadDamMulti
%%	} = getCfg:getCfgPStack(cfg_pet, PetID),
%%	#petLevelPropertyCfg{
%%		holyDef = HolyDef,
%%		shadDef = ShadDef,
%%		eleDef = EleDef,
%%		phyDef = PhyDef,
%%		maxHP = MaxHp,
%%		eleDam = EleDam,
%%		phycDam = PhycDam,
%%		holyDam = HolyDam,
%%		shadDam = ShadDam
%%	} = getCfg:getCfgPStack(cfg_petLevelProperty, Lv),
%%	[
%%	 {?Prop_physicaldefence, PhycDefMulti * PhyDef},
%%	 {?Prop_physicaldamage, PhycDamMulti * PhycDam},
%%	 {?Prop_shadowdefence, ShadDefMulti * ShadDef},
%%	 {?Prop_holydefence, HolyDefMulti * HolyDef},
%%	 {?Prop_tough, Tough},
%%	 {?Prop_hitratio, Score},
%%	 {?Prop_movespeed, RunSpeed},
%%	 {?Prop_MaxHP, MaxHp * HpMulti},
%%	 {?Prop_holydamage, HolyDamMulti * HolyDam},
%%	 {?Prop_elementdamage, EleDamMulti * EleDam},
%%	 {?Prop_shadowdamage, ShadDamMulti * ShadDam},
%%	 {?Prop_elementdefence, EleDefMulti * EleDef}
%%	].

%%初始化怪物基础属性
-spec initMonsterBaseProp(ID :: uint()) -> list().
initMonsterBaseProp(MonsterID) ->
	#monsterCfg{
		maxHP = MaxHp,
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
	} = getCfg:getCfgPStack(cfg_monster, MonsterID),
	[
		{?Prop_MaxHP, MaxHp},                                    %%生命：标志着单位的生存能力，改变到0时，执行其死亡后的逻辑
		{?Prop_PhysicalAttack, PhysicalAttack},                %%物攻：物理职业只有物攻
		{?Prop_MagicAttack, MagicAttack},                        %%法攻：法术职业只有法攻
		{?Prop_PhysicalDefence, PhysicalDefence},                %%物防：所有职业都有，细微偏差
		{?Prop_MagicDefence, MagicDefence},                    %%法防：所有职业都有，细微偏差
		{?Prop_CriticalLevel, CriticalLevel},                    %%暴击等级：通过公式转换成暴击率
		{?Prop_CriticalResistLevel, CriticalResistLevel},        %%抗爆等级：通过公式转换成减免暴击率
		{?Prop_CriticalDamageLevel, CriticalDamageLevel},        %%爆伤等级：初始为普通攻击的2倍伤害，通过公式转换成暴击伤害增加到暴击伤害上
		{?Prop_TenaciousLevel, TenaciousLevel},                %%韧性等级：爆伤等级的反属性
		{?Prop_HitLevel, HitLevel},                            %%命中等级：通过公式转换成命中率
		{?Prop_DodgeLevel, DodgeLevel},                        %%闪避等级：通过公式转换成闪避等级
		{?Prop_ArmorPenetrationLevel, ArmorPenetrationLevel},    %%破甲等级：通过转换公式，转换成破甲率，当命中公式判断为破甲伤害时，则忽略对方护甲
		{?Prop_HPRecover, HPRecover},                            %%生命秒回值
		{?Prop_MPRecover, MPRecover}                            %%法术秒回值
	].

%%初始化战斗属性记录
-spec initBattleProp(IsMonster) -> BattlePropList when
	IsMonster :: boolean(), BattlePropList :: [#battleProp{}, ...] | [].
initBattleProp(_IsMonster) ->
	List = lists:seq(?Prop_Min, ?PropMax),
	%%设置默认值
	Fun = fun(N, AccIn) ->
		PropInfo = getCfg:getCfgPStack(cfg_battlePropInfo, N),
		case PropInfo of
			#battlePropInfoCfg{baseValue = BaseValue} ->
				BP = #battleProp{
					propIndex = N,
					baseValue = float(BaseValue),
					addValue = 0.0,
					multiValueList = [],
					totalValue = 0.0,
					isModified = (BaseValue =/= 0)
				},
				lists:keystore(N, #battleProp.propIndex, AccIn, BP)
		end
	      end,
	lists:foldl(Fun, [], List).

%%设置战斗属性基础值
-spec setBattlePropBaseValue(BattlePropList, PropList) ->
	BattlePropList when BattlePropList :: [#battleProp{}, ...] | [], PropList :: [{Prop, Value}, ...], Prop :: uint(), Value :: float().
setBattlePropBaseValue(BattlePropList, PropList) when erlang:is_list(BattlePropList), erlang:is_list(PropList) ->
	Fun = fun({Prop, Value}, List) ->
		%%这里一定会找到这个索引，否则就是PropList中的索引有问题或者是BattlePropList没有使用initBattleProp初始化
		BP = lists:keyfind(Prop, #battleProp.propIndex, List),
		BattleProp = BP#battleProp{
			baseValue = Value,
			isModified = true
		},
		lists:keystore(Prop, #battleProp.propIndex, List, BattleProp)
	      end,
	lists:foldl(Fun, BattlePropList, PropList).

%%增加或者减少战斗属性加法值
-spec addBattlePropAddValue(BattlePropList, PropList) ->
	BattlePropList when BattlePropList :: [#battleProp{}, ...], PropList :: [{Prop, Value}, ...], Prop :: uint(), Value :: float().
addBattlePropAddValue(OldBattlePropList, PropList) when erlang:is_list(OldBattlePropList), erlang:is_list(PropList) ->
	Fun = fun({Prop, Value}, List) ->
		%%这里一定会找到这个索引，否则就是PropList中的索引有问题或者是BattlePropList没有使用initBattleProp初始化
		BP = case lists:keyfind(Prop, #battleProp.propIndex, List) of
			     #battleProp{} = RR ->
				     RR;
			     Ret ->
				     ?ERROR_OUT("Prop(~p) not exist", [Prop]),
				     Ret
		     end,

		NewValue = BP#battleProp.addValue + Value,
		BattleProp = BP#battleProp{
			addValue = NewValue,
			isModified = true
		},
		lists:keystore(Prop, #battleProp.propIndex, List, BattleProp)
	      end,
	lists:foldl(Fun, OldBattlePropList, PropList).

%%添加战斗属性比例值
-spec addBattlePropRateValue(BattlePropList, PropList) ->
	BattlePropList when BattlePropList :: [#battleProp{}, ...], PropList :: [{Prop, Value}|T], Prop :: uint(), Value :: float(), T :: list().
addBattlePropRateValue(BattlePropList, PropList) when erlang:is_list(BattlePropList), erlang:is_list(PropList) ->
	Fun = fun({Prop, Value}, List) ->
		%%这里一定会找到这个索引，否则就是PropList中的索引有问题或者是BattlePropList没有使用initBattleProp初始化
		BP = lists:keyfind(Prop, #battleProp.propIndex, List),
		ML = [Value | BP#battleProp.multiValueList],
		BattleProp = BP#battleProp{
			multiValueList = ML,
			isModified = true
		},
		lists:keystore(Prop, #battleProp.propIndex, List, BattleProp)
	      end,
	lists:foldl(Fun, BattlePropList, PropList).

%%删除战斗属性比例值
-spec delBattlePropRateValue(BattlePropList, PropList) ->
	BattlePropList when BattlePropList :: [#battleProp{}, ...], PropList :: [{Prop, Value}|T], Prop :: uint(), Value :: float(), T :: list().
delBattlePropRateValue(BattlePropList, PropList) when erlang:is_list(BattlePropList), erlang:is_list(PropList) ->
	Fun = fun({Prop, Value}, List) ->
		%%这里一定会找到这个索引，否则就是PropList中的索引有问题或者是BattlePropList没有使用initBattleProp初始化
		BP = lists:keyfind(Prop, #battleProp.propIndex, List),
		ML = lists:delete(Value, BP#battleProp.multiValueList),
		BattleProp = BP#battleProp{
			multiValueList = ML,
			isModified = true
		},
		lists:keystore(Prop, #battleProp.propIndex, List, BattleProp)
	      end,
	lists:foldl(Fun, BattlePropList, PropList).

%%计算各项战斗属性的最后会影响其它属性的总值
-spec calcRoleBattleProp(BattlePropList, Level) -> BattlePropList when
	BattlePropList :: [#battleProp{}, ...], Level :: uint().
calcRoleBattleProp(BattlePropList, _) ->
	calcEachCharBattlePropTotal(BattlePropList).
%%1.对一级属性进行总值计算
%%	BattlePropList1 = calcEachLv1BattlePropTotal(BattlePropList),
%%2.根据属性转换表将一级属性转换到二级属性，保存到最后的结果总值中，作为属性转化值
%%	ModList = calcBattlePropAlter(BattlePropList1,Level),
%%3.计算所有二级属性的总值
%%	calcEachLv2BattlePropTotal(BattlePropList1,ModList).

%%计算Char的所有战斗属性
-spec calcCharBattleProp(BattlePropList) -> BattleProList :: [#battleProp{}, ...] when BattlePropList :: [#battleProp{}, ...].
calcCharBattleProp(BattlePropList) ->
	BPList = calcEachCharBattlePropTotal(BattlePropList),
	%%这里统一清除属性的修改标记
	Fun = fun(#battleProp{propIndex = PropIndex} = BP, AccIn) ->
		lists:keystore(PropIndex, #battleProp.propIndex, AccIn, BP#battleProp{isModified = false})
	      end,
	lists:foldl(Fun, BPList, BPList).

%% ====================================================================
%% Internal functions
%% ====================================================================
%%
%%-spec getAlterProp(Prop,#attributeRegentCfg{}) -> {ToProp, AlterArg} | false when
%%		  Prop::uint(),ToProp::uint() | list(),AlterArg::uint() | list().
%%getAlterProp(Prop,#attributeRegentCfg{} = PropAlterTable) ->
%%	if
%%		Prop =:= PropAlterTable#attributeRegentCfg.attribute1 ->
%%			{
%%			 PropAlterTable#attributeRegentCfg.toAttribute1,
%%			 PropAlterTable#attributeRegentCfg.regent1
%%			};
%%		Prop =:= PropAlterTable#attributeRegentCfg.attribute2 ->
%%			{
%%			 PropAlterTable#attributeRegentCfg.toAttribute2,
%%			 PropAlterTable#attributeRegentCfg.regent2
%%			};
%%		Prop =:= PropAlterTable#attributeRegentCfg.attribute3 ->
%%			{
%%			 PropAlterTable#attributeRegentCfg.toAttribute3,
%%			 PropAlterTable#attributeRegentCfg.regent3
%%			};
%%		true ->
%%			false
%%	end.
%%
%%-spec alterProp(Value,ToProp,AlterArg,ModList) -> ModList when
%%	Value::number(),ToProp::uint(),AlterArg::number(),ModList::[{PropIndex,Value},...] | [],
%%	PropIndex::battle_prop(),Value::number().
%%alterProp(Value,ToProp,AlterArg,ModList) ->
%%	%%根据公式计算加成值
%%	if
%%		ToProp =:= ?Prop_dodge ->
%%			Result = Value / (Value + AlterArg);
%%		true ->
%%			Result = Value / AlterArg
%%	end,
%%	%%将属性转换后的值设置到最后的总值中作为转化值
%%	lists:keystore(ToProp,1,ModList,{ToProp,Result}).

%%-spec calcEachBattlePropAlter(Value,ToProp,AlterArg,ModList) -> ModList when
%%		  Value::float(),ToProp::list()|int(),AlterArg::list()|int(),ModList::[{PropIndex,Value},...] | [],
%%		PropIndex::battle_prop(),Value::number().
%%calcEachBattlePropAlter(Value,ToProp,AlterArg,ModList) ->
%%	case erlang:is_list(ToProp) of
%%		true -> %%ToProp是一个列表
%%			F = fun(I,MList) ->
%%				alterProp(Value,I,AlterArg,MList)
%%			end,
%%			lists:foldl(F, ModList, ToProp);
%%		_ -> %%ToProp不是一个列表，而是一个值
%%			alterProp(Value,ToProp,AlterArg,ModList)
%%	end.
%%
%%%%计算属性转换
%%-spec calcBattlePropAlter(BattlePropList,Level) -> ModList when
%%	BattlePropList::[#battleProp{},...],Level::uint(),ModList::[{ToProp,Value},...] | [],ToProp::battle_prop(),Value::number().
%%calcBattlePropAlter(BattlePropList,Level) ->
%%	PropAlterCfg = getCfg:getCfgPStack(cfg_attributeRegent, Level),
%%	Fun = fun(Prop,ModList) ->
%%				  %%取一级属性中的总值
%%				  Value = getBattlePropTotalValue(BattlePropList,Prop),
%%				  %%取转换表中一级属性对应的转换信息，ToProp为要转换到的属性索引，AlterArg为转换系数
%%				  %%ToProp与AlterArg可能为一个列表，也可能是一个值
%%				  case getAlterProp(Prop, PropAlterCfg) of
%%					  {ToProp,AlterArg} ->
%%						  calcEachBattlePropAlter(Value,ToProp,AlterArg,ModList);
%%					  _ ->
%%						  ModList
%%				  end
%%		  end,
%%	lists:foldl(Fun, [], ?RoleBaseProp).

%%%%计算一级属性的总值
%%-spec calcEachLv1BattlePropTotal(BattlePropList) -> BattlePropList when
%%	BattlePropList::[#battleProp{},...].
%%calcEachLv1BattlePropTotal(BattlePropList) ->
%%	Fun = fun(Prop,AccIn) ->
%%				  calcOneBattlePropTotal(Prop,AccIn,0.0)
%%		  end,
%%	lists:foldl(Fun, BattlePropList, ?RoleBaseProp).
%%
%%%%计算每一项二级属性的总值，带转化属性
%%-spec calcEachLv2BattlePropTotal(BattlePropList,AlterPropList) -> BattlePropList when
%%	BattlePropList::[#battleProp{},...],AlterPropList::list().
%%calcEachLv2BattlePropTotal(BattlePropList,AlterPropList) ->
%%	PropList = lists:seq(?Prop_lv2_start, ?PropMax),
%%	Fun = fun(Prop,AccIn) ->
%%		%%获取该其它属性转化到本属性的值
%%		PropAlterValue = case lists:keyfind(Prop,1,AlterPropList) of
%%			                 {Prop,Value} ->
%%				                 Value;
%%			                 _ ->
%%				                 0.0
%%		                 end,
%%		%%计算该属性的总值
%%		calcOneBattlePropTotal(Prop,AccIn,PropAlterValue)
%%	end,
%%	lists:foldl(Fun, BattlePropList, PropList).

%%计算Char的每一项属性的总值，不带转化属性
-spec calcEachCharBattlePropTotal(BattlePropList) -> BattlePropList when BattlePropList :: [#battleProp{}, ...].
calcEachCharBattlePropTotal(BattlePropList) ->
	PropList = lists:seq(?Prop_Min, ?PropMax),
	Fun =
		fun(Prop, BPList) ->
			calcOneBattlePropTotal(Prop, BPList, 0.0)
		end,
	lists:foldl(Fun, BattlePropList, PropList).

%%计算指定属性的总值
-spec calcOneBattlePropTotal(Prop, BattlePropList, PropAlterValue) -> BattlePropList when
	Prop :: uint(), BattlePropList :: [#battleProp{}, ...], PropAlterValue :: float().
calcOneBattlePropTotal(Prop, BattlePropList, PropAlterValue) ->
	BP = lists:keyfind(Prop, #battleProp.propIndex, BattlePropList),
	#battleProp{propIndex = PropIndex,
		baseValue = Base,
		addValue = AddValue,
		multiValueList = MultiList,
		isModified = IsModified} = BP,
	%%首先检查是否有修改，以及是否有转化来的属性值，没修改也没有转化属性值就不计算
	case IsModified of
		true ->
			%%取出指定属性的配置
			PropInfo = getCfg:getCfgPStack(cfg_battlePropInfo, PropIndex),
			Min = PropInfo#battlePropInfoCfg.minNum,
			Max = PropInfo#battlePropInfoCfg.maxNum,

			%%根据属性获取相应的属性计算公式
			UseFormula = PropInfo#battlePropInfoCfg.formulaIndex,
			Total = case UseFormula of
				2 ->
					Total0 = calcPropTotalByF2(Base, AddValue, MultiList),
					misc:clamp(Total0, Min, Max);
				3 ->
					Total0 = calcPropTotalByF3(Base, AddValue, MultiList, PropAlterValue),
					misc:clamp(Total0, Min, Max);
				4 ->
					AddResistAll = 0,%%getBattlePropAddValue(BattlePropList, ?Prop_resistall),
					PCResistAll = 0,%%getBattlePropMultiValue(BattlePropList, ?Prop_resistall),
					Total0 = calcPropTotalByF4(Base, AddValue, MultiList, AddResistAll, PCResistAll),
					misc:clamp(Total0, Min, Max);
				5 ->
					AddDefenseAll = 0,%% getBattlePropAddValue(BattlePropList, ?Prop_defenseall),
					PCDefenseAll = 0,%% getBattlePropMultiValue(BattlePropList, ?Prop_defenseall),
					Total0 = calcPropTotalByF5(Base, AddValue, MultiList, AddDefenseAll, PCDefenseAll),
					misc:clamp(Total0, Min, Max);
				6 ->
					AddDefenseAll = 0,%% getBattlePropAddValue(BattlePropList, ?Prop_defenseall),
					PCDefenseAll = 0,%% getBattlePropMultiValue(BattlePropList, ?Prop_defenseall),
					Total0 = calcPropTotalByF6(Base, AddValue, MultiList, AddDefenseAll, PCDefenseAll, PropAlterValue),
					misc:clamp(Total0, Min, Max);
				_ ->
					Total0 = calcPropTotalByF1(Base, AddValue, MultiList),
					misc:clamp(Total0, Min, Max)
			end,
%%			Total = case Prop =:= ?Prop_MaxHP of
%%				        true ->
%%					        %%最大生命值的计算公式比较特殊，单独写
%%					        %%总生命值上限=（基础生命值上限+总体质值*10 +∑生命值上限加法值）* (1 + 总生存精通) * ∏( 1 +生命值上限乘法值)
%%					        Constitution = getBattlePropTotalValue(BattlePropList, ?Prop_constitution),
%%					        Survivemas = getBattlePropTotalValue(BattlePropList, ?Prop_survivemas),
%%					        Func = fun(X, AccIn) ->
%%						        AccIn * (1.0 + X)
%%					               end,
%%					        Total0 = lists:foldl(Func, (Base + Constitution * 10 + AddValue) * (1 + Survivemas), MultiList),
%%					        misc:clamp(Total0, Min, Max);
%%				        _ ->
%%					        UseFormula = PropInfo#battlePropInfoCfg.formulaIndex,
%%					        case UseFormula of
%%						        2 ->
%%							        Total0 = calcPropTotalByF2(Base, AddValue, MultiList),
%%							        misc:clamp(Total0, Min, Max);
%%						        3 ->
%%							        Total0 = calcPropTotalByF3(Base, AddValue, MultiList, PropAlterValue),
%%							        misc:clamp(Total0, Min, Max);
%%						        4 ->
%%							        AddResistAll = getBattlePropAddValue(BattlePropList, ?Prop_resistall),
%%							        PCResistAll = getBattlePropMultiValue(BattlePropList, ?Prop_resistall),
%%							        Total0 = calcPropTotalByF4(Base, AddValue, MultiList, AddResistAll, PCResistAll),
%%							        misc:clamp(Total0, Min, Max);
%%						        5 ->
%%							        AddDefenseAll = getBattlePropAddValue(BattlePropList, ?Prop_defenseall),
%%							        PCDefenseAll = getBattlePropMultiValue(BattlePropList, ?Prop_defenseall),
%%							        Total0 = calcPropTotalByF5(Base, AddValue, MultiList, AddDefenseAll, PCDefenseAll),
%%							        misc:clamp(Total0, Min, Max);
%%						        6 ->
%%							        AddDefenseAll = getBattlePropAddValue(BattlePropList, ?Prop_defenseall),
%%							        PCDefenseAll = getBattlePropMultiValue(BattlePropList, ?Prop_defenseall),
%%							        Total0 = calcPropTotalByF6(Base, AddValue, MultiList, AddDefenseAll, PCDefenseAll, PropAlterValue),
%%							        misc:clamp(Total0, Min, Max);
%%						        _ ->
%%							        Total0 = calcPropTotalByF1(Base, AddValue, MultiList),
%%							        misc:clamp(Total0, Min, Max)
%%					        end
%%			        end,
			BattleProp = lists:keyfind(Prop, #battleProp.propIndex, BattlePropList),
			%%这里暂时保留该属性的修改标记，等后面通知客户端后统一清除
			BL = lists:keystore(Prop, #battleProp.propIndex,
				BattlePropList,
				BattleProp#battleProp{totalValue = Total, isModified = true}),
			BL;
		_ ->
			BattlePropList
	end.


-spec getBattlePropAddValue(BattlePropList, PropIndex) -> float() when
	BattlePropList :: [#battleProp{}, ...], PropIndex :: battle_prop().
getBattlePropAddValue(BattlePropList, PropIndex) ->
	#battleProp{addValue = Value} = lists:keyfind(PropIndex, #battleProp.propIndex, BattlePropList),
	Value.

-spec getBattlePropMultiValue(BattlePropList, PropIndex) -> list() when
	BattlePropList :: [#battleProp{}, ...], PropIndex :: battle_prop().
getBattlePropMultiValue(BattlePropList, PropIndex) ->
	#battleProp{multiValueList = List} = lists:keyfind(PropIndex, #battleProp.propIndex, BattlePropList),
	List.

-spec getBattlePropTotalValue(BattlePropList, PropIndex) -> float() when
	BattlePropList :: [#battleProp{}, ...], PropIndex :: battle_prop().
getBattlePropTotalValue(BattlePropList, PropIndex) ->
	%%在计算怪物属性时，由于公式是按角色的属性来设计的，而怪物没有的属性则为0，所以怪物可能会出现找不到的属性
	case lists:keyfind(PropIndex, #battleProp.propIndex, BattlePropList) of
		#battleProp{totalValue = Total} ->
			Total;
		_ ->
			0.0
	end.

%%按照公式1计算某项属性的总值
%%公式1为：总值=基础值*（1+∑b）+∑a， a为加法值，b为乘法值
-spec calcPropTotalByF1(Base, AddValue, PCList) -> float() when
	Base :: number(), AddValue :: number(), PCList :: list().
calcPropTotalByF1(Base, AddValue, PCList) ->
	Multi = lists:sum(PCList),
	Base * (1.0 + Multi ) + AddValue.

%%按照公式2计算某项属性的总值
%%总值=1- (1 - a) * ∏(1 - b) + ∑c, a为基础值，b为增加比例，c为增加值
-spec calcPropTotalByF2(Base, AddValue, PCList) -> float() when
	Base :: number(), AddValue :: number(), PCList :: list().
calcPropTotalByF2(Base, AddValue, PCList) ->
	Func = fun(X, AccIn) ->
		AccIn * (1.0 - X)
	       end,
	AccOut = lists:foldl(Func, (1.0 - Base), PCList),
	1.0 - AccOut + AddValue.

%%按照公式3计算某项属性的总值
%%总值=1-（1-基础值）*（1-转化值）*∏（1-乘法值）+∑加法值，转化值为其它属性转化过来的值
-spec calcPropTotalByF3(Base, AddValue, PCList, PropAlterValue) -> float() when
	Base :: number(), AddValue :: number(), PCList :: list(), PropAlterValue :: float().
calcPropTotalByF3(Base, AddValue, PCList, PropAlterValue) ->
	Func = fun(X, AccIn) ->
		AccIn * (1.0 - X)
	       end,
	AccOut = lists:foldl(Func, (1.0 - Base) * (1.0 - PropAlterValue), PCList),
	1 - AccOut + AddValue.

%%按照公式4计算某项属性的总值
%%总值=1- (1 - a) * ∏(1 - b) * ∏(1 - d) + ∑c + ∑e， a为基础值，b为增加比例，c为增加值 d为全抗性属性增加比例 e为全抗性属性增加值
-spec calcPropTotalByF4(Base, AddValue, PCList, AddResistAll, PCResistAll) -> float() when
	Base :: number(), AddValue :: number(), PCList :: list(), AddResistAll :: number(), PCResistAll :: list().
calcPropTotalByF4(Base, AddValue, PCList, AddResistAll, PCResistAll) ->
	Func = fun(X, AccIn) ->
		AccIn * (1.0 - X)
	       end,
	AccOut = lists:foldl(Func, (1.0 - Base), PCList),
	AccOut1 = lists:foldl(Func, AccOut, PCResistAll),
	1.0 - AccOut1 + AddValue + AddResistAll.

%%按照公式5计算某项属性的总值
%%总值=（基础值+ ∑a + ∑c)*∏(1+b) * ∏(1+d)， a为增加值，b为增加比例  c为全防御属性增加值 d为全防御属性增加比例
-spec calcPropTotalByF5(Base, AddValue, PCList, AddDefenseAll, PCDefenseAll) -> float() when
	Base :: number(), AddValue :: number(), PCList :: list(), AddDefenseAll :: number(), PCDefenseAll :: list().
calcPropTotalByF5(Base, AddValue, PCList, AddDefenseAll, PCDefenseAll) ->
	Func = fun(X, AccIn) ->
		AccIn * (1.0 + X)
	       end,
	AccOut1 = lists:foldl(Func, (Base + AddValue + AddDefenseAll), PCList),
	lists:foldl(Func, AccOut1, PCDefenseAll).

%%按照公式6计算某项属性的总值
%%总值=（基础值+ ∑a + ∑c + 转化值)*∏(1+b) * ∏(1+d)， a为增加值，b为增加比例  c为全防御属性增加值 d为全防御属性增加比例
-spec calcPropTotalByF6(Base, AddValue, PCList, AddDefenseAll, PCDefenseAll, PropAlterValue) -> float() when
	Base :: number(), AddValue :: number(), PCList :: list(), AddDefenseAll :: number(), PCDefenseAll :: list(), PropAlterValue :: float().
calcPropTotalByF6(Base, AddValue, PCList, AddDefenseAll, PCDefenseAll, PropAlterValue) ->
	Func = fun(X, AccIn) ->
		AccIn * (1.0 + X)
	       end,
	AccOut1 = lists:foldl(Func, (Base + AddValue + AddDefenseAll + PropAlterValue), PCList),
	lists:foldl(Func, AccOut1, PCDefenseAll).
