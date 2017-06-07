%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 交易行加载静态数据模块
%%% @end
%%% Created : 10. 七月 2014 17:51
%%%-------------------------------------------------------------------
-module(tradeLoadStaticInfo).
-author("tiancheng").

-include("tradeDefine.hrl").

%% API
-export([
	saveTradeItemList/3,
	getItemStaticMsg/1,
	getItemClass/1
]).

%% 得到道具列表
saveTradeItemList(OrderID, ItemUID, ItemID) ->
	%% 获取静态数据
	StaticRec = case getItemStaticMsg(ItemID) of
		            skip ->
			            ?ERROR_OUT("[~p] [~p,~p,~p] not found", [?MODULE, OrderID, ItemUID, ItemID]),
			            skip;
		            Rec ->
			            Rec#tradeItemStaticRec{orderID = OrderID, itemUID = ItemUID}
	            end,
	StaticRec.

%% 获取道具的分类
getItemClass(ItemID) ->
	if
		ItemID >= ?Item_RuneIDStart ->
			?Item_Rune;
		ItemID >= ?Item_Differentiate ->
			%% 装备道具
			?Item_Equip;
		ItemID >= 0 andalso ItemID =< ?Item_Differentiate ->
			%% 普通道具
			?Item_Item;
		true ->
			0
	end.

%% 获取道具的静态类型
getItemStaticMsg(ItemID) ->
	case getItemClass(ItemID) of
		?Item_Equip ->
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
		?Item_Item ->
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
		?Item_Rune ->
			%% 符文道具
			case getCfg:getCfgPStack(cfg_rune, ItemID) of
				#runeCfg{type = Type,  equipLevel = EquipLevel} ->
					IType = case Type of
						        0 -> 24;
						        1 -> 25
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
		_ ->
			%% 出错
			skip
	end.