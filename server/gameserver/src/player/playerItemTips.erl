%%
%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 玩家查看道具的tips管理模块
%%% @end
%%% Created : 14. 七月 2014 19:27
%%%-------------------------------------------------------------------
-module(playerItemTips).
-author("tiancheng").

-include("playerPrivate.hrl").
-include("tradeDefine.hrl").

%% 系统的角色ID
-define(SysMail_Role_ID, 0).

%% API
-export([
	queryItemTips/1
]).

-export([
	queryItemFromDBMemCache/2
]).

%% 注：这里RoleID应该为TargetCode
-spec queryItemTips(#pk_U2GS_QueryEquipByUID{}) -> ok.
queryItemTips(#pk_U2GS_QueryEquipByUID{roleID = RoleID, equipUID = ItemUID}) when
	erlang:is_integer(RoleID) andalso erlang:is_integer(ItemUID) ->
%% 	?WARN_OUT("queryItemTips:~p", [PK]),
	SelfCode = playerState:getPlayerCode(),
	case RoleID =/= SelfCode of
		true -> sendItemTipsToClient(ItemUID);
		_ -> querySelfItemTips(ItemUID)
	end,
	ok.

%% 发送道具tips给客户端
-spec sendItemTipsToClient(ItemUID::uint64()) -> ok.
sendItemTipsToClient(ItemUID) ->
	Item = queryItemFromDBMemCache(ItemUID,true),
	sendTipsToClient(ItemUID, Item),
	ok.

%% 查看自己的道具tips
-spec querySelfItemTips(ItemUID::uint64()) -> ok.
querySelfItemTips(ItemUID) ->
	Item = case playerPackage:getGoodsByUID(ItemUID) of
		       #recSaveEquip{} = Equip ->
			       Equip;
		       #rec_item{} = NormalItem ->
			       NormalItem;
		       _ ->
			       false
	       end,
	sendTipsToClient(ItemUID, Item),
	ok.

%% 发送查看tips结果给客户端
-spec sendTipsToClient(ItemUID, #recSaveEquip{}) -> ok when
	ItemUID::uint().
sendTipsToClient(_ItemUID, #recSaveEquip{} = Equip) ->
	EquipInfo = goods:makeEquipNetMessage(Equip),
	playerMsg:sendNetMsg(#pk_GS2U_QueryEquipResult{equipInfo = EquipInfo}),
	ok;
sendTipsToClient(ItemUID, #rec_item{itemID = ItemID, pileNum = Number, isBind = IsBind,isLocked = IsLocked, expiredTime = ETime} = _Item) ->
	%% 普通道具的tips
	Item = #pk_NormalItemInfo{itemID = ItemID, itemUID = ItemUID, itemSum = Number, isBind = IsBind,isLocked = IsLocked, expiredTime = ETime},
	playerMsg:sendNetMsg(#pk_GS2U_QueryItemResult{itemInfo = Item}),
	ok;
sendTipsToClient(ItemUID, Item) ->
	?DEBUG_OUT("~p sendTipsToClient:~p,~p", [?MODULE, ItemUID, Item]),
	playerMsg:sendErrorCodeMsg(?ErrorCode_QueryItemTipsFailed),
	ok.

%% 从内存数据库中读取道具数据
-spec queryItemFromDBMemCache(ItemUID::uint64(),IsDirtyRead::boolean()) -> #rec_item{} | #recSaveEquip{} | false.
queryItemFromDBMemCache(ItemUID,IsDirtyRead) ->
	case readEDBRecord(IsDirtyRead,rec_item, ItemUID) of
		[#rec_item{itemID = ItemID, roleID = RoleID} = Rec] ->
			case itemUtils:makeEquipRecFromItem(RoleID, Rec) of
				#recSaveEquip{} = RecEquip ->
					RecEquip#recSaveEquip{
						itemUID = ItemUID,
						roleID = Rec#rec_item.roleID,
						itemID = ItemID,
						pos = Rec#rec_item.pos,
						recastCount = Rec#rec_item.recastCount,
						isBind = misc:convertBoolFromInt(Rec#rec_item.isBind),
						isLocked = misc:convertBoolFromInt(Rec#rec_item.isLocked),
						quality = Rec#rec_item.quality,
						createTime = time:getSyncUTCTimeFromDBS()
					};
				_ ->
					Rec#rec_item{
						itemUID = ItemUID,
						roleID = Rec#rec_item.roleID,
						itemID = ItemID,
						pos = Rec#rec_item.pos,
						pileNum = Rec#rec_item.pileNum,
						recastCount = Rec#rec_item.recastCount,
						isBind = misc:convertBoolFromInt(Rec#rec_item.isBind),
						isLocked = misc:convertBoolFromInt(Rec#rec_item.isLocked),
						quality = Rec#rec_item.quality,
						createTime = time:getSyncUTCTimeFromDBS()
					}
			end;
		_ ->
			false
	end.

readEDBRecord(true,Table,Key) ->
	edb:dirtyReadRecord(Table, Key);
readEDBRecord(_,Table,Key) ->
	edb:readRecord(Table, Key).
	

