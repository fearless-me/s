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
	changeProp_CalcForce/0,
	changeProp_CalcType/3,  %[{id,value,calcType}]
	changeProp_CalcType/4,  %[{id,value,calcType}]
	changeProp_AddMulti/4,  %[{id,value}]
	changeProp_AddMulti/5
]).

-export([
	initBaseProp/2
]).

-export([
	makePropsGroup_Equip/3
]).

makePropsGroup_Equip(EquipBase, EnhanceProp, _Op) ->
	BaseProp = makeEquipBaseProps(EquipBase),
	makePropTuple(BaseProp, EnhanceProp).

makeEquipBaseProps(#rec_equip_base_info{
	propKey1 = K1, propValue1 = V1,
	propKey2 = K2, propValue2 = V2,
	propKey3 = K3, propValue3 = V3,
	propKey4 = K4, propValue4 = V4,
	propKey5 = K5, propValue5 = V5
}) ->
	[{K1, V1}, {K2, V2}, {K3, V3}, {K4, V4}, {K5, V5}];
makeEquipBaseProps(_) ->
	[].

makePropTuple(BaseProps, EnhanceProp) ->
	lists:foldl(
		fun({K, MV, AV}, Acc) ->
			BV =
				case lists:keyfind(K, 1, BaseProps) of
					{_, BV1} ->
						BV1;
					_ ->
						0
				end,
			[{K, BV * MV + AV, ?CalcTypeAdd} | Acc]
		end, [], EnhanceProp).


initBaseProp(Level, Career) ->
	Exp = playerBase:getCfgMaxExp(Level, Career),
	Props = playerBase:getCfgBaseProps(Level, Career),
	HPRecover = playerBase:getCfgHPRecover(Level, Career),
	playerState:setMaxExp(Exp),
	lists:foreach(
		fun({ID, Val, LevelAdd}) ->
			FV = Val + LevelAdd * (Level - 1),
			playerState:setBattlePropBase(ID, FV),
			playerState:setBattlePropModified(ID, true)
		end, [{?Prop_HPRecover, HPRecover, 0} | Props]),
	ok.

%%保存buff增加或者减少的属性
-spec saveBuffProp(BuffID :: uint(), PlusList :: list(), MultList :: list(), Opreate :: add|del) -> ok.
saveBuffProp(BuffID, PlusList, MultList, Op) ->
	case getCfg:getCfgByArgs(cfg_buff, BuffID) of
		#buffCfg{battlepower = 1} ->
			skip;
		_ ->
			saveBuffProp1(BuffID, PlusList, MultList, Op)
	end,
	ok.

saveBuffProp1(_BuffID, PlusList, MultList, add) ->
	PropPcList = playerState:getBuffBattlePropPcList(),
	PropAddList = playerState:getBuffBattlePropAddList(),
	Fun =
		fun({Prop, Value}, Acc) ->
			case lists:keyfind(Prop, 1, Acc) of
				{Prop, OldValue} ->
					lists:keyreplace(Prop, 1, Acc, {Prop, OldValue + Value});
				_ ->
					[{Prop, Value} | Acc]
			end
		end,
	Fun1 =
		fun(Elem, Acc) ->
			[Elem | Acc]
		end,
	NewPropAddList = lists:foldl(Fun, PropAddList, PlusList),
	NewPropPcList = lists:foldl(Fun1, PropPcList, MultList),
	playerState:setBuffBattlePropPcList(NewPropPcList),
	playerState:setBuffBattlePropAddList(NewPropAddList);
saveBuffProp1(BuffID, PlusList, MultiList, del) ->
	PropPcList = playerState:getBuffBattlePropPcList(),
	PropAddList = playerState:getBuffBattlePropAddList(),
	Fun =
		fun({Prop, Value}, Acc) ->
			{Prop, OldValue} =
				case lists:keyfind(Prop, 1, Acc) of
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
	Fun1 =
		fun(Elem, Acc) ->
			lists:delete(Elem, Acc)
		end,
	NewPropAddList = lists:foldl(Fun, PropAddList, PlusList),
	NewPropPcList = lists:foldl(Fun1, PropPcList, MultiList),
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
%%	?DEBUG_OUT("[~p]send battle prop ~n ~w,~nst=~p",
%%		[playerState:getRoleID(), List, misc:getStackTrace()]),
	Code = playerState:getPlayerCode(),
	Msg = #pk_GS2U_BattlePropList{code = Code, id = 0, battleProp = List},
	playerMsg:sendNetMsg(Msg),
	ok.


changeProp_CalcForce()->
	BattleProp = playerCalcProp:getBattleProp(),
	BuffPropAdd1 = playerState:getBuffBattlePropAddList(),
	ResultAddProp = [{PropID, -PropVal} || {PropID, PropVal} <- BuffPropAdd1],
	ResultMulProp = playerState:getBuffBattlePropPcList(),

	NewBattleProp1 = battleProp:addBattlePropAddValue(BattleProp, ResultAddProp),
	NewBattleProp2 = battleProp:delBattlePropRateValue(NewBattleProp1, ResultMulProp),

	NewBattlePropList = modifyProp(NewBattleProp2),
	battleProp:calcRoleBattleProp(NewBattlePropList, playerState:getLevel()).


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
changeProp_CalcType(EnhanceProp, ExtProp, ?EquipOff, IsNotify) ->
	{ResultAddProp, ResultMulProp} = battleProp:calcPropGroup(EnhanceProp, ExtProp, ?EquipOff),
	BattleProp = playerCalcProp:getBattleProp(),
	NewBattleProp1 = battleProp:addBattlePropAddValue(BattleProp, ResultAddProp),
	NewBattleProp2 = battleProp:delBattlePropRateValue(NewBattleProp1, ResultMulProp),
	playerCalcProp:calcBattleProp(NewBattleProp2, true, IsNotify);
changeProp_CalcType(_AnyEnc, _AnyExt, _AnyOp, _None) ->
	skip.


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
changeProp_AddMulti(AddPropList, MultiPropList, ?EquipOff, IsNotify) ->
	BattleProp = playerCalcProp:getBattleProp(),
	NewBattleProp1 = battleProp:addBattlePropAddValue(BattleProp, AddPropList),
	NewBattleProp2 = battleProp:delBattlePropRateValue(NewBattleProp1, MultiPropList),
	playerCalcProp:calcBattleProp(NewBattleProp2, true, IsNotify);
changeProp_AddMulti(_AnyProp, _AnyMulti, _AnyOp, _None) ->
	skip.
