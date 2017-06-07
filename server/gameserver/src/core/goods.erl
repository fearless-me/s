%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 25. 十一月 2014 10:03
%%%-------------------------------------------------------------------
-module(goods).
-author("ZhongYuanWei").

-include("gsInc.hrl").
-include("tradeDefine.hrl").

%% API
-export([
	canBeDiscard/1,
	canBeUse/1,
	canBeStorage/1,
	canBeTrade/1,
	canBeSplit/1,
	makeEquipNetMessage/1,
	isGemItem/1,
	getGoodsCfg/1,
	itemCanSell/1,
	itemIsLife/1,
	getItemStaticMsg/1,
	getItemClass/1
]).

%% ====================================================================
%% API functions
%% ====================================================================

%%检测是否可以被丢弃
-spec canBeDiscard(OperateLimit) -> boolean() when OperateLimit::uint().
canBeDiscard(OperateLimit) ->
	(OperateLimit band ?Item_Operate_NotDelete) =:= 0.

%%检测是否可以被使用
-spec canBeUse(OperateLimit) -> boolean() when OperateLimit::uint().
canBeUse(OperateLimit) ->
	(OperateLimit band ?Item_Operate_NotUse) =:= 0.

%%检测是否可以被存入仓库
-spec canBeStorage(OperateLimit) -> boolean() when OperateLimit::uint().
canBeStorage(OperateLimit) ->
	(OperateLimit band ?Item_Operate_NotStore) =:= 0.

%%检测是否可以被放入交易行
-spec canBeTrade(OperateLimit) -> boolean() when OperateLimit::uint().
canBeTrade(OperateLimit) ->
	(OperateLimit band ?Item_Operate_NotDelete) =:= 0.

%%检测是否可以被拆分
-spec canBeSplit(OperateLimit) -> boolean() when OperateLimit::uint().
canBeSplit(OperateLimit) ->
	(OperateLimit band ?Item_Operate_NotSplit) =:= 0.

%%增加装备消息
-spec makeEquipNetMessage(Equip) -> undefined | #pk_EquipItemInfo{} when Equip::#recSaveEquip{}.
makeEquipNetMessage(#recSaveEquip{
	itemUID = UID,
	itemID = ID,
	recastCount = RecastCount,
	quality = Quality,
	isBind = IsBind,
	isLocked = IsLocked,
	baseProp = _BaseProp,
	extProp = ExtProp,
	enhanceProp = EnhanceProp,
	expiredTime = ET
}) ->
	case erlang:is_list(EnhanceProp) andalso erlang:length(EnhanceProp) > 0 of
		true ->
			[Enhance | _] = EnhanceProp;
		false ->
			Enhance = EnhanceProp
	end,
	case erlang:is_list(ExtProp) andalso erlang:length(ExtProp) > 0 of
		true ->
			[Ext | _] = ExtProp;
		false ->
			Ext = ExtProp
	end,
	NewEquipPropList = makeEquipPropNetMessage(Enhance, Ext),
	%%由于过期时间存储的是UTC时间，所以发给客户端时需要加上时区
	ExpiredTime = case ET > 0 of
		              true ->
			              ET + time:getLocalTimeAdjustHour() * 3600;
		              _ ->
			              0
	              end,
	#pk_EquipItemInfo{
		itemID = ID,
		itemUID = UID,
		recastNum = RecastCount,
		quality = Quality,
		isBind = IsBind,
		isLocked = IsLocked,
		equipProps  = NewEquipPropList,
		expiredTime = ExpiredTime
	}.

isGemItem(ItemID) ->
	case getCfg:getCfgPStack(cfg_item, ItemID) of
		#itemCfg{itemType = ?ItemTypeGem} ->
			true;
		_ ->
			false
	end.


-spec getGoodsCfg(GoodsID) -> #equipmentCfg{} | #itemCfg{} | [] when
	GoodsID::uint().
getGoodsCfg(GoodsID) ->
	if
		GoodsID >= ?Item_RuneIDStart ->
			getCfg:getCfgPStack(cfg_rune, GoodsID);
		GoodsID >= ?Item_Differentiate ->
			%% 装备道具
			getCfg:getCfgPStack(cfg_equipment, GoodsID);
		GoodsID > 0 andalso GoodsID < ?Item_Differentiate ->
			%% 普通道具
			getCfg:getCfgPStack(cfg_item, GoodsID);
		true ->
			?ERROR_OUT("Error GoodsID[~p] in ~p:getGoodsCfg",[GoodsID,?MODULE]),
			throw("Error in getGoodsCfg")
	end.

%% 获取道具的分类
-spec getItemClass(uint()) -> uint().
getItemClass(ItemID) ->
	if
		ItemID >= ?Item_RuneIDStart ->
			?Item_Rune;
		ItemID >= ?Item_Differentiate ->
			%% 装备道具
			?Item_Equip;
		true ->
			case getCfg:getCfgPStack(cfg_item, ItemID) of
				#itemCfg{itemType = ?ItemTypeGem} ->
					?Item_Gem;
				#itemCfg{} ->
					?Item_Item;
				_ ->
					0
			end
	end.

%% 获取道具的静态类型
-spec getItemStaticMsg(uint()) -> #tradeItemStaticRec{} | skip.
getItemStaticMsg(ItemID) ->
	Class = getItemClass(ItemID),
	if
		Class =:= ?Item_Equip ->
			%% 装备道具
			case getCfg:getCfgPStack(cfg_equipment, ItemID) of
				#equipmentCfg{type = ItemType, subType = ItemSubType, equipLevel = ItemLevel, class = ItemProfession} ->
					#tradeItemStaticRec{
						itemID = ItemID,
						itemType = ItemType,
						itemSubType = ItemSubType,
						itemLevel = ItemLevel,
						itemProfession = ItemProfession
					};
				_None ->
					skip
			end;
		Class =:= ?Item_Item orelse Class =:= ?Item_Gem ->
			%% 普通道具
			case getCfg:getCfgPStack(cfg_item, ItemID) of
				#itemCfg{itemType = ItemType, detailedType = ItemSubType, level = ItemLevel, usePlayerClass = ItemProfession} ->
					#tradeItemStaticRec{
						itemID = ItemID,
						itemType = ItemType,
						itemSubType = ItemSubType,
						itemLevel = ItemLevel,
						itemProfession = ItemProfession
					};
				_None ->
					skip
			end;
		Class =:= ?Item_Rune ->
			%% 符文道具
			case playerRune:getRuneConf(ItemID) of
				#runeCfg{type = Type,  equipLevel = EquipLevel} ->
					IType = case Type of
								0 -> ?ItemTypePlayerRune;
								1 -> ?ItemTypePlayerPetRune
					        end,
					#tradeItemStaticRec{
						itemID = ItemID,
						itemType = IType,
						itemSubType = Type,
						itemLevel = EquipLevel,
						itemProfession = 0
					};
				_ ->
					skip
			end;
		true ->
			%% 出错
			skip
	end.

%% 道具是否可以交易
-spec itemCanSell(uint()) -> boolean().
itemCanSell(ItemID) ->
	Class = getItemClass(ItemID),
	if
		Class =:= ?Item_Equip ->
			%% 装备都可以交易
			true;
		Class =:= ?Item_Item orelse Class =:= ?Item_Gem ->
			case getCfg:getCfgPStack(cfg_item, ItemID) of
				#itemCfg{operate = Operate} ->
					case misc:testBit(Operate, ?Item_Operate_NotTrade) of
						true ->
							%% 配置的不可以交易
							false;
						_ ->
							%% 其余的都可以交易
							true
					end;
				_None ->
					%% 没有找到该物品，不可交易
					false
			end;
		Class =:= ?Item_Rune ->
			true;
		true ->
			%% 其余不知名类型，不可交易
			false
	end.

%% 道具是否有有效期
-spec itemIsLife(uint()) -> boolean().
itemIsLife(ItemID) ->
	Class = getItemClass(ItemID),
	if
		Class =:= ?Item_Equip ->
			%% 装备没有有效期
			false;
		Class =:= ?Item_Item orelse Class =:= ?Item_Gem ->
			case getCfg:getCfgPStack(cfg_item, ItemID) of
				#itemCfg{usefulLife = UsefulLife} when erlang:is_integer(UsefulLife) andalso UsefulLife > 0 ->
					%% 只有配置大于0才有有效期
					true;
				_None ->
					false
			end;
		Class =:= ?Item_Rune ->
			case playerRune:getRuneConf(ItemID) of
				#runeCfg{usefulLife = Life} when erlang:is_integer(Life) andalso Life > 0 ->
					true;
				_ ->
					false
			end;
		true ->
			false
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================

makeEquipPropNetMessage(#rec_equip_enhance_info{
	propKey1 = BasePropKey1,
	propValue1 = BasePropValue1,
	propKey2 = BasePropKey2,
	propValue2 = BasePropValue2,
	propKey3 = BasePropKey3,
	propValue3 = BasePropValue3,
	propKey4 = BasePropKey4,
	propValue4 = BasePropValue4,
	propKey5 = BasePropKey5,
	propValue5 = BasePropValue5
},
	#rec_equip_ext_info{
		propKey1 = ExtPropKey1,
		propAffixe1 = ExtPropAffixe1,
		propRecast1 = ExtPropRecast1,
		propValue1 = ExtPropValue1,
		calcType1 = ExtCalcType1,
		propKey2 = ExtPropKey2,
		propAffixe2 = ExtPropAffixe2,
		propRecast2 = ExtPropRecast2,
		propValue2 = ExtPropValue2,
		calcType2 = ExtCalcType2,
		propKey3 = ExtPropKey3,
		propAffixe3 = ExtPropAffixe3,
		propRecast3 = ExtPropRecast3,
		propValue3 = ExtPropValue3,
		calcType3 = ExtCalcType3,
		propKey4 = ExtPropKey4,
		propAffixe4 = ExtPropAffixe4,
		propRecast4 = ExtPropRecast4,
		propValue4 = ExtPropValue4,
		calcType4 = ExtCalcType4,
		propKey5 = ExtPropKey5,
		propAffixe5 = ExtPropAffixe5,
		propRecast5 = ExtPropRecast5,
		propValue5 = ExtPropValue5,
		calcType5 = ExtCalcType5,
		propKey6 = ExtPropKey6,
		propAffixe6 = ExtPropAffixe6,
		propRecast6 = ExtPropRecast6,
		propValue6 = ExtPropValue6,
		calcType6 = ExtCalcType6
	}
) ->
	BaseProp = [
		{BasePropKey1, BasePropValue1,?PropCalcType_Add,?EquipPropTypeBase,0},
		{BasePropKey2, BasePropValue2,?PropCalcType_Add,?EquipPropTypeBase,0},
		{BasePropKey3, BasePropValue3,?PropCalcType_Add,?EquipPropTypeBase,0},
		{BasePropKey4, BasePropValue4,?PropCalcType_Add,?EquipPropTypeBase,0},
		{BasePropKey5, BasePropValue5,?PropCalcType_Add,?EquipPropTypeBase,0}
	],
	ExtProp = [
		{ExtPropKey1, ExtPropValue1, ExtCalcType1,ExtPropRecast1,ExtPropAffixe1},
		{ExtPropKey2, ExtPropValue2, ExtCalcType2,ExtPropRecast2,ExtPropAffixe2},
		{ExtPropKey3, ExtPropValue3, ExtCalcType3,ExtPropRecast3,ExtPropAffixe3},
		{ExtPropKey4, ExtPropValue4, ExtCalcType4,ExtPropRecast4,ExtPropAffixe4},
		{ExtPropKey5, ExtPropValue5, ExtCalcType5,ExtPropRecast5,ExtPropAffixe5},
		{ExtPropKey6, ExtPropValue6, ExtCalcType6,ExtPropRecast6,ExtPropAffixe6}
	],
	Fun = fun({PropKey, PropValue, CalcType, PropRecast, PropAffixe}, EquipPropList) ->
		ResultCalcType = case CalcType of
							 ?PropCalcType_Add ->
								 false;
							 ?PropCalcType_Mul ->
								 true;
							 _ ->
								 false
						 end,
		EquipProp = #pk_EquipPropInfo{
			propType = PropRecast,
			propKey = PropKey,
			propAffix = PropAffixe,
			calcType = ResultCalcType,
			propValue = float(PropValue)
		},
		[EquipProp | EquipPropList]
	end,
	BasePropList = lists:foldl(Fun, [], BaseProp),
	lists:foldl(Fun, BasePropList, ExtProp);
makeEquipPropNetMessage(_, _) ->
	[].
