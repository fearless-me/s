%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, <公司>
%%% @doc 背包系统
%%%
%%% @end
%%% Created : 19. 十一月 2014 14:39
%%%-------------------------------------------------------------------
-module(playerPackage).
-author("ZhongYuanWei").

-include("gsInc.hrl").
-include("common/playerPropSyncDefine.hrl").
-include("playerPrivate.hrl").

%% 背包系统的操作接口
-export([
	initPackage/0,                                %%初始化背包
	openSlot/2,                                    %%背包开格子
	initGoodsFromDB/1,                            %%从数据库中初始化背包道具
	initPackageInfoFromDB/1,                    %%从数据库中初始化背包信息
	addGoods/5,                                    %%添加一个物品，可以是普通道具也可以是装备，如果背包放不下所有需要添加的道具，则失败
	addGoodsAndMail/5,                            %%添加一个物品，可以是普通道具也可以是装备，如果背包放不下所有需要添加的道具，则尝试发送邮件
	deleteGoodsByUID/3,                            %%根据UID物理删除背包中的物品
	delGoodsByID/4,                                %%根据ID和数量物理删除背包中的物品
	useItemByUID/4,                                %%使用指定UID的普通道具指定数量
	goodsMove/3,                                %%背包间操作
	splitItem/5,                                %%拆分道具
	sortBag/1,                                    %%背包整理
	lockGoods/2,                                %%锁定物品
	sellAllPoorEquip/0,                            %%一键出售所有策划规定的较差品质的装备
	useItemByID/3,
	getCanPileItem/6
]).

%%其它系统的查询接口
-export([
	getBagIdleSlotNum/1,                        %%获取指定背包的空闲格子数
	getGoodsByUID/1,                            %%根据UID在所有普通背包，装备背包，宝石背包查询
	getGoodsByUID/2,                            %%根据UID在指定物品背包查询
	getBodyEquipInfo/0,                            %%获取身上的装备信息
	getBodyGemIds/0,                            %%获取身上的宝石ID
	getGoodsByID/2,                                %%获取指定背包的所有指定ID的物品
	getItemNumByID/1,                            %%获取普通背包指定ID的道具非锁定数量
	getGoodsNumByID/2,                           %%获取指定背包指定ID的道具非锁定数量
	getGoodsNumByID/3,                           %%获取指定背包指定ID的道具指定锁定数量
	getGoodsCountByID/2,                          %%获取指定背包指定ID的道具指定锁定数量
	getEquipNum/2,
    getEquipNumAll/1
]).

%%背包系统发送给客户端的接口
-export([
	sendInitBagSlotNetMsg/0,                    %%发送背包开启格子的信息给客户端
	sendInitGoodsNetMsg/0                        %%发送背包初始化消息给客户端
]).

-export([
	makeGoodsInstance/6,                        %%构建一个物品实例
	addGoodsInstance/2,                            %%添加一个物品实例，可以是普通道具也可以是装备
	updateEquipInstance/3,                        %%更新一具物品实例
	changeGoodsOwner/5,                            %%改变指定道具的归属，可以由自己改为系统，也可以由系统改为系统，但不能由系统改为自己
	changeGoodsOwner/6                          %%改变指定道具的归属，可以由自己改为系统，也可以由系统改为系统，但不能由系统改为自己
]).

-export([
	gemEmbedOn/1,                                %%宝石镶嵌
	gemEmbedOff/1,                                %%取下镶嵌的宝石
	gemComposition/3,                            %%宝石合成,
	gemCompositionOnce/3,                                                    %%宝石单次合成
	getAllPetGemIDFromPackage/0,                %%获取镶嵌背包中所有宠物宝石加的属性列表
	addGemSkill/0,
	getPackageType/1,
	getItemType/1
]).

-export([
	tickPackage/0
]).

%%单元测试用
-export([
	arrangeItem/2
]).

-export([
	gm_openAllSlot/0,
	gm_equipoff/1,
	gm_deleteExpiredTimeGoodsFromRecycle/1
]).

%%宝石合成，可以放的最大宝石数量
-define(MaxGemMixNum, 4).
-define(ActivateGemFun, 13).

-type itemList() :: [#rec_item{}, ...] | [].
-type equipList() :: [#recSaveEquip{}, ...] | [].
-type goodsList() :: itemList() | equipList().

-record(recExpiredTimeGoods,
{
	goodsUID,
	bagType,
	expiredTime
}).

getEquipNumAll(Quality)->
    Bags = [
        ?Item_Location_Equip_Bag,
        ?Item_Location_Equip_Storage,
        ?Item_Location_BodyEquipBag
    ],
    L0 = [getEquipNum(Bag, Quality) || Bag <- Bags],
    lists:sum(L0).

getEquipNum(BagType, Quality)->
    case playerState:getPackage(BagType) of
        undefined ->
            0;
        L0 ->
            L1 = [equipIsQuality(Quality, Item) || Item <- L0],
            lists:sum(L1)
    end.

equipIsQuality(Quality, #recSaveEquip{quality = Quality})->
    1;
equipIsQuality(_Any1, _Any2)->
    0.
%% ====================================================================
%% API functions
%% ====================================================================

%%初始化玩家所有类型背包为空列表,并设置各背包的默认开启格子数
-spec initPackage() -> ok.
initPackage() ->
	Fun = fun(BagType) ->
		playerState:setPackage(BagType, []),
		PackageInfo = #rec_package_info{
			roleID = playerState:getRoleID(),
			bagType = BagType,
			maxSlot = getBagDefaultSlotNum(BagType)
		},
		playerState:setPackageInfo(BagType, PackageInfo)
		  end,
	lists:foreach(Fun, ?Item_Location_AllList),
	ok.

%% gm开启所有背包格子
gm_openAllSlot() ->
	F =
		fun(BagType) ->
			PackageInfo = playerState:getPackageInfo(BagType),
			CurSlotNum = PackageInfo#rec_package_info.maxSlot,
			MaxSlotNum = getBagMaxSlotNum(BagType),
			case MaxSlotNum - CurSlotNum of
				0 -> skip;
				RequireOpenNum ->
					NewInfo = PackageInfo#rec_package_info{maxSlot = CurSlotNum + RequireOpenNum},
					%%成就统计
					statOpenSlotNum(BagType, RequireOpenNum),
					%%保存到内存
					playerState:setPackageInfo(BagType, NewInfo),
					%%保存到数据库
					playerSave:savePackageInfo(NewInfo),
					%%发送给客户端
					playerMsg:sendNetMsg(#pk_OpenNewBagSlot{bagType = BagType, openNum = RequireOpenNum})
			end,
			ok
		end,
	lists:foreach(F, ?Item_Location_AllList),
	ok.

%%背包新开格子
-spec openSlot(BagType, RequireOpenNum) -> ok
	when BagType :: bagType(), RequireOpenNum :: uint().
openSlot(BagType, RequireOpenNum) when erlang:is_integer(BagType), BagType >= ?Item_Location_Start, BagType =< ?Item_Location_Max, erlang:is_integer(RequireOpenNum) ->
	PackageInfo = playerState:getPackageInfo(BagType),
	CurSlotNum = PackageInfo#rec_package_info.maxSlot,
	%%是否所开数量是否超过最大数量
	case getBagMaxSlotNum(BagType) >= CurSlotNum + RequireOpenNum of
		true -> %%没有超限
			DefaultSlotNum = getBagDefaultSlotNum(BagType),
			case canOpenSlot(CurSlotNum, RequireOpenNum, DefaultSlotNum) of
				noMoney ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BagOpenNewSlotFailed_NoMoney);
				levelLimit ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BagOpenNewSlotFailed_LevelLimit);
				RequireMoneyList ->
					NewInfo = PackageInfo#rec_package_info{maxSlot = CurSlotNum + RequireOpenNum},
					%%成就统计
					statOpenSlotNum(BagType, RequireOpenNum),
					%%扣钱
					Fun = fun({CoinType, CoinValue}) ->
						playerMoney:useCoin(CoinType, CoinValue,
							#recPLogTSMoney{reason = ?CoinUseStrPetBagSlot, param = RequireOpenNum, target = ?PLogTS_Item, source = ?PLogTS_PlayerSelf})
						  end,
					lists:foreach(Fun, RequireMoneyList),
					%%保存到内存
					playerState:setPackageInfo(BagType, NewInfo),
					%%保存到数据库
					playerSave:savePackageInfo(NewInfo),
					%%发送给客户端
					playerMsg:sendNetMsg(#pk_OpenNewBagSlot{bagType = BagType, openNum = RequireOpenNum})
			end;
		_ -> %%超限
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagSlotOverConfigMax)
	end,
	ok;
openSlot(BagType, OpenNum) ->
	?ERROR_OUT("Player[~p][~ts] Error OpenSlot BagType:~p,Num:~p", [playerState:getRoleID(), playerState:getName(), BagType, OpenNum]),
	playerMsg:sendErrorCodeMsg(?ErrorCode_BagSlotOverConfigMax),
	ok.

%%初始化物品数据
-spec initGoodsFromDB(Goods) -> ok when Goods :: goods().
initGoodsFromDB(#rec_item{itemID = ItemID, itemUID = ItemUID, pos = Pos, expiredTime = ET, pileNum = PileNum} = GoodsInfo) ->
	RoleID = playerState:getRoleID(),
	case ItemID >= 30000 orelse Pos =:= ?Item_Location_Equip_Bag orelse Pos =:= ?Item_Location_Equip_Storage orelse Pos =:= ?Item_Location_BodyEquipBag of
		true ->
			%%从数据库中的删除
			deleteGoodsFromDB(GoodsInfo),
			%%记录删除日志
			Logrec = #recLogGoodsChange{
				itemUID = ItemUID,
				itemID = ItemID
			},
			dbLog:sendSaveLogChangeGoods(Logrec, #recPLogTSItem{changReason = ?ItemDelelteReasonException, reasonParam = 9999, old = PileNum, new = 0, change = PileNum}),
			?ERROR_OUT("player:~p Error initItemFromDB:~p ~p ~p,~p", [RoleID, ItemID, ItemUID, Pos, PileNum]);
		_ ->
			%%由于宝石背包的位置高8位有其Slot信息，所以需要只取低8位
			BagType = getBagType(Pos),
			%%取宝石孔位置
			Slot = getEmbedGemSlot(Pos),
			GoodsList = playerState:getPackage(BagType),
			NewGoods = GoodsInfo#rec_item{roleID = RoleID},
			NewGoodsList = case BagType of
							   ?Item_Location_Recycle ->
								   %%如果是回收站，则需要保持顺序
								   [GoodsInfo | GoodsList];
							   _ ->
								   lists:keystore(ItemUID, #rec_item.itemUID, GoodsList, NewGoods)
						   end,
			playerState:setPackage(BagType, NewGoodsList),
			%%判断是否是有时效性的道具，如果是则加入时效性道具列表中
			checkAndAddExpiredTimeGoodsList(ItemUID, BagType, ET),

			case BagType =:= ?Item_Location_GemEmbedBag of
				true ->
					%%如果是镶嵌背包，则需要应用镶嵌带来的属性改变
					gemEmbedOnChangeProp(ItemID, Slot);
				_ ->
					skip
			end
	end;
initGoodsFromDB(#recSaveEquip{itemUID = GoodsUID, itemID = ID, pos = BagType, deleteTime = _DT, expiredTime = ET} = GoodsInfo) ->
	RoleID = playerState:getRoleID(),
	case ID < 30000 orelse BagType =:= ?Item_Location_Bag orelse
		BagType =:= ?Item_Location_Storage orelse
		BagType =:= ?Item_Location_Gem_Bag orelse
		BagType =:= ?Item_Location_Gem_Storage orelse
		BagType =:= ?Item_Location_GemEmbedBag
	of
		true ->
			%%从数据库中的删除
			deleteGoodsFromDB(GoodsInfo),
			%%记录删除日志
			Logrec = #recLogGoodsChange{
				itemUID = GoodsUID,
				itemID = ID
			},
			dbLog:sendSaveLogChangeGoods(Logrec, #recPLogTSItem{changReason = ?ItemDelelteReasonException, reasonParam = 9999, old = 1, new = 0, change = 1}),
			?ERROR_OUT("player:~p Error initEquipFromDB:~p ~p ~p", [RoleID, ID, GoodsUID, BagType]);
		_ ->
			%%?WARN_OUT("initGoodsFromDB Equip:~p",[GoodsUID]),

			GoodsList = playerState:getPackage(BagType),
			NewGoods = GoodsInfo#recSaveEquip{roleID = RoleID},
			NewGoodsList = case BagType of
							   ?Item_Location_Recycle ->
								   %%如果是回收站，则需要保持顺序
								   [GoodsInfo | GoodsList];
							   _ ->
								   lists:keystore(GoodsUID, #recSaveEquip.itemUID, GoodsList, NewGoods)
						   end,
			playerState:setPackage(BagType, NewGoodsList),

			%%判断是否是有时效性的道具，如果是则加入时效性道具列表中
			checkAndAddExpiredTimeGoodsList(GoodsUID, BagType, ET),

			case BagType =:= ?Item_Location_BodyEquipBag of
				true ->
					%%如果是武器则需要设置武器对攻速的影响
					case getCfg:getCfgPStack(cfg_equipment, ID) of
						#equipmentCfg{type = ?EquipTypeWeapon, atkDelay = AtkDelay} ->
							playerState:setAttackIntervalTime(AtkDelay);
						_ ->
							skip
					end,
					playerEquip:onEquipOn(GoodsInfo, false);
				false ->
					skip
			end
	end,
	ok.

%%初始化各类背包开格子数据
-spec initPackageInfoFromDB(#rec_package_info{}) -> ok.
initPackageInfoFromDB(#rec_package_info{bagType = BagType} = PackageInfo) ->
	playerState:setPackageInfo(BagType, PackageInfo),
	ok.

%%发送背包格子使用消息
-spec sendInitBagSlotNetMsg() -> ok.
sendInitBagSlotNetMsg() ->
	SlotList = [
		#pk_BagSlot{max = ?BagMaxSlot, used = getBagOpenSlotNum(?Item_Location_Bag)},
		#pk_BagSlot{max = ?StorageMaxSlot, used = getBagOpenSlotNum(?Item_Location_Storage)},
		#pk_BagSlot{max = ?EquipBagMaxSlot, used = getBagOpenSlotNum(?Item_Location_Equip_Bag)},
		#pk_BagSlot{max = ?EquipStorageMaxSlot, used = getBagOpenSlotNum(?Item_Location_Equip_Storage)},
		#pk_BagSlot{max = ?RecycleBagMaxSlot, used = getBagOpenSlotNum(?Item_Location_Recycle)},
		#pk_BagSlot{max = ?BodyEquipBagMaxSlot, used = getBagOpenSlotNum(?Item_Location_BodyEquipBag)},
		#pk_BagSlot{max = ?GemBagMaxSlot, used = getBagOpenSlotNum(?Item_Location_Gem_Bag)},
		#pk_BagSlot{max = ?GemStorageMaxSlot, used = getBagOpenSlotNum(?Item_Location_Gem_Storage)},
		#pk_BagSlot{max = ?GemEmbedDefaultOpenSlotNum, used = getBagOpenSlotNum(?Item_Location_GemEmbedBag)},
		#pk_BagSlot{max = ?PiecesBagMaxSlot, used = getBagOpenSlotNum(?Item_Location_Pieces_Bag)},
		#pk_BagSlot{max = ?PiecesStorageMaxSlot, used = getBagOpenSlotNum(?Item_Location_Pieces_Storage)}
	],
	playerMsg:sendNetMsg(#pk_GS2U_InitSlot{slots = SlotList}),
	ok.

%%发送背包初始化消息给客户端
-spec sendInitGoodsNetMsg() -> ok.
sendInitGoodsNetMsg() ->
	sendInitItemNetMsg(?Item_Location_Bag),
	sendInitItemNetMsg(?Item_Location_Gem_Bag),
	sendInitItemNetMsg(?Item_Location_Pieces_Bag),
	sendInitItemNetMsg(?Item_Location_Storage),
	sendInitItemNetMsg(?Item_Location_Gem_Storage),
	sendInitItemNetMsg(?Item_Location_GemEmbedBag),
	sendInitItemNetMsg(?Item_Location_Pieces_Storage),

	sendInitEquipNetMsg(?Item_Location_Equip_Bag),
	sendInitEquipNetMsg(?Item_Location_Equip_Storage),
	sendInitEquipNetMsg(?Item_Location_BodyEquipBag),

	%%发送宝石镶嵌消息
%%	GembedList = playerState:getPackage(?Item_Location_GemEmbedBag),
%%	GembedInfoList = [#pk_GemEmbedInfo{
%%		gemUID = GemUID,
%%		slot = getEmbedGemSlot(Pos)
%%	} || #rec_item{itemUID = GemUID, pos = Pos} <- GembedList],
%%	playerMsg:sendNetMsg(#pk_GS2U_GemEmbedInit{gemEmbedInfos = GembedInfoList}),

	%%发送回收站里的东西
	Fun = fun(#recSaveEquip{} = Equip, {ItemList, EquipList, N}) ->
		L = [#pk_RecycleEquip{
			slot = N,
			equip = goods:makeEquipNetMessage(Equip)
		} | EquipList],
		{ItemList, L, N + 1};
		(#rec_item{} = Item, {ItemList, EquipList, M}) ->
			L = [#pk_RecycleItem{
				slot = M,
				item = makeItemNetMessage(Item)
			} | ItemList],
			{L, EquipList, M + 1}
		  end,
	RecycleGoodsList0 = playerState:getPackage(?Item_Location_Recycle),
	RecycleGoodsList1 = lists:sort(fun sortRecycleGoods/2, RecycleGoodsList0),
	Len = erlang:length(RecycleGoodsList1),
	RecycleGoodsList = case Len > 10 of
						   true ->
							   lists:sublist(RecycleGoodsList1, 10);
						   _ ->
							   RecycleGoodsList1
					   end,
	%%这里需要把按删除时间整理的顺序放入回收站
	playerState:setPackage(?Item_Location_Recycle, RecycleGoodsList),
	{IL, EL, _} = lists:foldl(Fun, {[], [], 0}, RecycleGoodsList),
	playerMsg:sendNetMsg(#pk_GS2U_InitRecycle{items = IL, equips = EL}),
	ok.

sortRecycleGoods(#recSaveEquip{deleteTime = {datetime, DT1}}, #recSaveEquip{deleteTime = {datetime, DT2}}) ->
	compareTime(DT1, DT2);
sortRecycleGoods(#rec_item{deleteTime = {datetime, DT1}}, #rec_item{deleteTime = {datetime, DT2}}) ->
	compareTime(DT1, DT2);
sortRecycleGoods(#recSaveEquip{deleteTime = {datetime, DT1}}, #rec_item{deleteTime = {datetime, DT2}}) ->
	compareTime(DT1, DT2);
sortRecycleGoods(#rec_item{deleteTime = {datetime, DT1}}, #recSaveEquip{deleteTime = {datetime, DT2}}) ->
	compareTime(DT1, DT2).

compareTime(DT1, DT2) ->
	D1 = time:convertDateTime1970ToSec(DT1),
	D2 = time:convertDateTime1970ToSec(DT2),
	D1 >= D2.

%%增加物品，包括普通道具和装备，成功返回普通道具或者装备的列表，失败返回一个空列表
-spec addGoods(GoodsID, GoodsNum, IsBind, EquipQuality, #recPLogTSItem{}) -> goodsList() | ok
	when GoodsID :: uint(), GoodsNum :: uint(), IsBind :: boolean(), EquipQuality :: equipQuality().
addGoods(GoodsID, GoodsNum, _IsBind, EquipQuality, #recPLogTSItem{} = TS) when erlang:is_integer(GoodsID), erlang:is_integer(GoodsNum) ->
	addGoods(GoodsID, GoodsNum, false, EquipQuality, false, TS).

%%添加一个物品，可以是普通道具也可以是装备，如果背包放不下所有需要添加的道具，则尝试发送邮件
-spec addGoodsAndMail(GoodsID, GoodsNum, IsBind, EquipQuality, #recPLogTSItem{}) -> goodsList() | ok
	when GoodsID :: uint(), GoodsNum :: uint(), IsBind :: boolean(), EquipQuality :: equipQuality().
addGoodsAndMail(GoodsID, GoodsNum, _IsBind, EquipQuality, #recPLogTSItem{} = TS) when erlang:is_integer(GoodsID), erlang:is_integer(GoodsNum) ->
	addGoods(GoodsID, GoodsNum, false, EquipQuality, true, TS).

%%添加一个物品实例到背包中，同时更新到客户端
-spec addGoodsInstance(#rec_item{} | #recSaveEquip{}, #recPLogTSItem{}) -> boolean().
addGoodsInstance(#rec_item{itemID = ItemID} = Item, #recPLogTSItem{} = TS) ->
	%%有可能之前是一个不知道放哪里的道具，这里需要判定一下，同时也不管外部的背包位置在哪里
	%%都统一使用判定的正确位置，防止外部传入的位置错误。
	#itemCfg{itemType = ItemType} = getCfg:getCfgPStack(cfg_item, ItemID),
	BagType = getPackageType(ItemType),
%%	BagType = case goods:isGemItem(ItemID) of
%%				  true ->
%%					  ?Item_Location_Gem_Bag;
%%				  _ ->
%%					  ?Item_Location_Bag
%%			  end,
	addItemInstance(BagType, setupGoodsExpireTime(Item#rec_item{pos = BagType, isBind = false}), TS);
addGoodsInstance(#recSaveEquip{roleID = RoleID, pos = Pos} = Equip0, #recPLogTSItem{} = TS) ->
	Equip2 = case Pos =:= 0 of
				 true ->
					 setupGoodsExpireTime(Equip0#recSaveEquip{pos = ?Item_Location_Equip_Bag});
				 _ ->
					 setupGoodsExpireTime(Equip0)
			 end,
	Equip = Equip2#recSaveEquip{isBind = false},
	BagType = Equip#recSaveEquip.pos,
	case getBagIdleSlotNum(BagType) > 0 of
		true ->
			SelfRoleID = playerState:getRoleID(),
			NewGoods = case SelfRoleID =/= RoleID of
						   true ->
							   %%添加新道具实例到背包
							   NewEquip = Equip#recSaveEquip{roleID = SelfRoleID},
							   %%存储到内存中并保存到数据库
							   storeGoodsAndSave(BagType, NewEquip),

							   %% log拥有者改变
							   LogRec = #recLogGoodsChange{
								   itemUID = Equip#recSaveEquip.itemUID,
								   itemID = Equip#recSaveEquip.itemID
							   },
							   dbLog:sendSaveLogChangeGoods(LogRec, TS),
							   NewEquip;
						   _ ->
							   %%之前就是自己的道具
							   storeGoods(BagType, Equip),
							   Equip
					   end,
			Msg = goods:makeEquipNetMessage(NewGoods),
			sendAddEquipMessage(BagType, [Msg]),
			true;
		_ ->
			false
	end.

updateEquipInstance(#recSaveEquip{pos = BagType} = Equip, Operate, IsNotifyClient) ->
	storeGoodsAndSave(BagType, Equip),
	case IsNotifyClient of
		true ->
			EquipInfo = goods:makeEquipNetMessage(Equip),
			playerMsg:sendNetMsg(#pk_GS2U_UpdateEquipItem{type = BagType, items = [EquipInfo], operate = Operate});
		_ ->
			skip
	end,
	ok.

%%获取指定背包空闲的格子数
-spec getBagIdleSlotNum(BagType) -> uint()
	when BagType :: bagType().
getBagIdleSlotNum(BagType) ->
	Bag = playerState:getPackageInfo(BagType),
	CurSlotNum = Bag#rec_package_info.maxSlot,
	List = playerState:getPackage(BagType),
	UsedNum = erlang:length(List),
	CurSlotNum - UsedNum.

%%根据物品UID删除物品,包括分送同步消息
-spec deleteGoodsByUID(BagType, GoodsUID, #recPLogTSItem{}) -> boolean()
	when BagType :: 0..?Item_Location_Max, GoodsUID :: uint().
%%根据装备UID删除道具，要保存数据库(只能从普通背包，宝石背包，普通仓库以及宝石仓库中删除)
deleteGoodsByUID(BagType, GoodsUID, #recPLogTSItem{} = TS) when
	BagType =:= ?Item_Location_Bag; BagType =:= ?Item_Location_Storage;
	BagType =:= ?Item_Location_Gem_Bag; BagType =:= ?Item_Location_Gem_Storage;
	BagType =:= ?Item_Location_Pieces_Bag; BagType =:= ?Item_Location_Pieces_Storage ->

	BagGoodsList = playerState:getPackage(BagType),
	case lists:keyfind(GoodsUID, #rec_item.itemUID, BagGoodsList) of
		#rec_item{} = Item ->
			deleteGoodsFromBag(BagType, BagGoodsList, Item, TS),
			true;
		_ ->
			false
	end;
%%根据装备UID删除装备，要保存数据库
deleteGoodsByUID(BagType, UID, #recPLogTSItem{} = TS) ->
	BagGoodsList = playerState:getPackage(BagType),
	ItemInfo = lists:keyfind(UID, #recSaveEquip.itemUID, BagGoodsList),
	case ItemInfo of
		#recSaveEquip{} = Equip ->
			deleteGoodsFromBag(BagType, BagGoodsList, Equip, TS),
			true;
		_ ->
			false
	end.

%%使用指定UID的普通道具指定数量
-spec useItemByUID(ItemUID, Num, UseReason, ParamValue) -> boolean() when
	ItemUID :: uint(), Num :: uint(), UseReason :: uint(), ParamValue :: uint().
useItemByUID(ItemUID, Num, UseReason, ParamValue) ->
	Plog = #recPLogTSItem{
		old = Num,
		new = 0,
		change = -Num,
		target = ?PLogTS_UseItem,
		source = ?PLogTS_PlayerSelf,
		gold = 0,
		goldtype = 0,
		changReason = UseReason,
		reasonParam = ParamValue
	},
	useItemByUID2(ItemUID, Num, ?Item_Location_Bag, Plog).

%%根据ID删除指定背包中的N个道具
-spec delGoodsByID(BagType, GoodsID, GoodsNum, #recPLogTSItem{}) -> boolean() when
	BagType :: ?Item_Location_Bag | ?Item_Location_Gem_Bag | ?Item_Location_Equip_Bag, GoodsID :: uint(), GoodsNum :: uint().
delGoodsByID(BagType, GoodsID, GoodsNum, #recPLogTSItem{} = TS)
	when BagType =:= ?Item_Location_Bag orelse BagType =:= ?Item_Location_Gem_Bag orelse BagType =:= ?Item_Location_Pieces_Bag ->
	case getGoodsNumByID(BagType, GoodsID) >= GoodsNum of
		true ->
			BagGoodsList0 = playerState:getPackage(BagType),
			BagGoodsList = sortGoodsByIsBind(BagGoodsList0),
			Fun = fun(#rec_item{itemID = ItemID} = Item, RequireNum) ->
				case ItemID =:= GoodsID of
					true ->
						%%如果使用结果>=0则表示，使用完成，结束遍历，否则需要再遍历其它道具
						RemainNum = useItem(Item, RequireNum, true, TS),
						case RemainNum >= 0 of
							true ->
								{break, true};
							_ ->
								%%为负数，表示还需要删除RemainNum个
								-RemainNum
						end;
					_ ->
						RequireNum
				end
				  end,
			%%之前判定了，背包中有需要删除的个数，不应该删除不成功
			true = misc:mapAccList(BagGoodsList, GoodsNum, Fun),
			true;
		_ ->
			false
	end;
delGoodsByID(?Item_Location_Equip_Bag = BagType, GoodsID, GoodsNum, #recPLogTSItem{} = TS) ->
	case getGoodsNumByID(BagType, GoodsID) >= GoodsNum of
		true ->
			BagGoodsList0 = playerState:getPackage(BagType),
			BagGoodsList = sortGoodsByIsBind(BagGoodsList0),
			Fun = fun(#recSaveEquip{itemID = EquipID} = Equip, RequireDelNum) ->
				case EquipID =:= GoodsID of
					true ->
						deleteGoodsFromBag(BagType, BagGoodsList, Equip, TS),
						RequireDelNum - 1;
					_ ->
						RequireDelNum
				end
				  end,
			0 = misc:mapAccList(BagGoodsList, GoodsNum, Fun),
			true;
		_ ->
			false
	end.

sortGoodsByIsBind(List) ->
	Fun = fun(#rec_item{isBind = IsBind1}, #rec_item{isBind = IsBind2}) ->
		IsBind1 > IsBind2;
		(#recSaveEquip{isBind = IsBind1}, #recSaveEquip{isBind = IsBind2}) ->
			IsBind1 > IsBind2
		  end,
	lists:sort(Fun, List).


%%此函数会依次从普通背包，装备背包，宝石背包，身上进行查找
%%如果知道UID所在的具体背包直接定位到该背包进行查询，即使用getGoodsByUID/2接口函数
-spec getGoodsByUID(UID) -> #rec_item{} | #recSaveEquip{} | failed when UID :: uint().
getGoodsByUID(UID) when erlang:is_integer(UID), UID > 0 ->
	getGoodsByUID(UID, [
		%%首先从背包中查询
		?Item_Location_Bag,
		?Item_Location_Equip_Bag,
		?Item_Location_Gem_Bag,
		?Item_Location_Pieces_Bag,

		%%再从身上查询
		?Item_Location_BodyEquipBag
	]).

-spec getGoodsByUID(UID, BagTypeList) -> #rec_item{} | #recSaveEquip{} | failed when
	UID :: uint(), BagTypeList :: [bagType(), ...] | bagType().
getGoodsByUID(UID, BagType) when erlang:is_integer(BagType), erlang:is_integer(UID), UID > 0 ->
	getGoodsFromBagByUID(UID, BagType);
getGoodsByUID(UID, BagTypeList) when erlang:is_list(BagTypeList), erlang:is_integer(UID), UID > 0 ->
	Fun = fun(BagType, AccIn) ->
		case getGoodsFromBagByUID(UID, BagType) of
			#rec_item{} = Item ->
				%%找到一个匹配的普通道具，跳出循环
				{break, Item};
			#recSaveEquip{} = Equip ->
				%%找到一个匹配的装备，跳出循环
				{break, Equip};
			_ ->
				AccIn
		end
		  end,
	misc:mapAccList(BagTypeList, failed, Fun).

%%提供给查看远程玩家装备使用
-spec getBodyEquipInfo() -> []|[#pk_EquipItemInfo{}, ...].
getBodyEquipInfo() ->
	Fun = fun(#recSaveEquip{} = Goods, GoodsList) ->
		[goods:makeEquipNetMessage(Goods) | GoodsList]
		  end,
	EquipList = playerState:getPackage(?Item_Location_BodyEquipBag),
	lists:foldl(Fun, [], EquipList).

%%提供给查看远程玩家宝石使用
-spec getBodyGemIds() -> [] | [#pk_LookGemInfo{}, ...].
getBodyGemIds() ->
	case playerBase:getMainMenuAct(?ActivateGemFun) of
		true ->
			playerState:addMainMenuSta(?PlayerMainMenuGem),
			Fun = fun(#rec_item{itemID = Id, pos = Pos}, Acc) ->
				Slot = getEmbedGemSlot(Pos),
				case Slot =/= 0 of
					true ->
						[#pk_LookGemInfo{gemID = Id, slot = Slot} | Acc];
					_ ->
						Acc
				end
				  end,
			GemList = playerState:getPackage(?Item_Location_GemEmbedBag),
			lists:foldr(Fun, [], GemList);
		_ ->
			[]
	end.


%%处理物品的移动处理
-spec goodsMove(GoodsUID, TargetType, SourceType) -> ok
	when GoodsUID :: uint(), TargetType :: uint(), SourceType :: uint().
goodsMove(GoodsUID, TargetType, SourceType) ->
	if
	%%从普通道具背包移动到普通道具仓库
		SourceType =:= ?Item_Location_Bag andalso TargetType =:= ?Item_Location_Storage ->
			moveItem(GoodsUID, TargetType, SourceType);
	%%从普通道具仓库移动到普通道具背包
		SourceType =:= ?Item_Location_Storage andalso TargetType =:= ?Item_Location_Bag ->
			moveItem(GoodsUID, TargetType, SourceType);

	%%从宝石背包移动到宝石仓库
		SourceType =:= ?Item_Location_Gem_Bag andalso TargetType =:= ?Item_Location_Gem_Storage ->
			moveItem(GoodsUID, TargetType, SourceType);
	%%从宝石仓库移动到宝石背包
		SourceType =:= ?Item_Location_Gem_Storage andalso TargetType =:= ?Item_Location_Gem_Bag ->
			moveItem(GoodsUID, TargetType, SourceType);

	%%从装备背包移动到装备仓库
		SourceType =:= ?Item_Location_Equip_Bag andalso TargetType =:= ?Item_Location_Equip_Storage ->
			moveItem(GoodsUID, TargetType, SourceType);
	%%从装备仓库移动到装备背包
		SourceType =:= ?Item_Location_Equip_Storage andalso TargetType =:= ?Item_Location_Equip_Bag ->
			moveItem(GoodsUID, TargetType, SourceType);

	%%从碎片背包移动到碎片仓库
		SourceType =:= ?Item_Location_Pieces_Bag andalso TargetType =:= ?Item_Location_Pieces_Storage ->
			moveItem(GoodsUID, TargetType, SourceType);
	%%从碎片仓库移动到碎片背包
		SourceType =:= ?Item_Location_Pieces_Storage andalso TargetType =:= ?Item_Location_Pieces_Bag ->
			moveItem(GoodsUID, TargetType, SourceType);
%%------------------------------------------------------------------------------

	%%从普通道具背包移动到回收站
		SourceType =:= ?Item_Location_Bag andalso TargetType =:= ?Item_Location_Recycle ->
			moveGoodsToRecycle(GoodsUID, SourceType);
	%%从回收站移动到普通道具背包
%%		SourceType =:= ?Item_Location_Recycle andalso TargetType =:= ?Item_Location_Bag ->
%%			moveGoodsFromRecycle(GoodsUID);

	%%从宝石背包移动到回收站
		SourceType =:= ?Item_Location_Gem_Bag andalso TargetType =:= ?Item_Location_Recycle ->
			moveGoodsToRecycle(GoodsUID, SourceType);
%%	%%从回收站移动到宝石背包
%%		SourceType =:= ?Item_Location_Recycle andalso TargetType =:= ?Item_Location_Gem_Bag ->
%%			moveGoodsFromRecycle(GoodsUID);

	%%从宝石背包移动到回收站
		SourceType =:= ?Item_Location_Pieces_Bag andalso TargetType =:= ?Item_Location_Recycle ->
			moveGoodsToRecycle(GoodsUID, SourceType);
%%	%%从回收站移动到宝石背包
%%		SourceType =:= ?Item_Location_Recycle andalso TargetType =:= ?Item_Location_Pieces_Bag ->
%%			moveGoodsFromRecycle(GoodsUID);

	%%从装备背包移动到回收站（卖出装备）
		SourceType =:= ?Item_Location_Equip_Bag andalso TargetType =:= ?Item_Location_Recycle ->
			moveGoodsToRecycle(GoodsUID, SourceType);
%%	%%从回收站移动到装备背包（回购装备）
%%		SourceType =:= ?Item_Location_Recycle andalso TargetType =:= ?Item_Location_Equip_Bag ->
%%			moveGoodsFromRecycle(GoodsUID);

	%%从装备背包移动到身上（穿装备）
		SourceType =:= ?Item_Location_Equip_Bag andalso TargetType =:= ?Item_Location_BodyEquipBag ->
			equipOn(GoodsUID);
	%%从身上移动到装备背包（脱装备）
		SourceType =:= ?Item_Location_BodyEquipBag andalso TargetType =:= ?Item_Location_Equip_Bag ->
			equipOff(GoodsUID);
		true ->
			skip
	end,
	ok.

%%锁定或者解锁物品(目前只有装备可以锁定与解锁)
-spec lockGoods(GoodsUID, BagType) -> ok when
	GoodsUID :: uint(), BagType :: ?Item_Location_Equip_Bag.
lockGoods(GoodsUID, BagType = ?Item_Location_Equip_Bag) ->
	case getGoodsFromBagByUID(GoodsUID, BagType) of
		#recSaveEquip{isLocked = IsLocked} = Equip ->
			LockedFlag = not IsLocked,
			storeGoodsAndSave(BagType, Equip#recSaveEquip{isLocked = LockedFlag}),
			playerMsg:sendNetMsg(#pk_GS2U_LockGoods{goodsUID = GoodsUID, bagType = BagType, isLocked = LockedFlag});
		_ ->
			?ERROR_OUT("player[~ts][~p] lock Goods:~p from BagType:~p failed,notfound",
				[playerState:getName(), playerState:getRoleID(), GoodsUID, BagType]),
			notFound
	end,
	ok;
lockGoods(_GoodsUID, _) ->
	ok.

%%背包整理
-spec sortBag(BagType) -> ok when BagType :: 0..?Item_Location_Max.
sortBag(BagType) ->
	case BagType of
		?Item_Location_Bag ->
			sortItemBag(BagType),
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagSortItemBagComplete);
		?Item_Location_Gem_Bag ->
			sortItemBag(BagType),
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagSortGemBagComplete);
		?Item_Location_Storage ->
			sortItemBag(BagType),
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagSortItemStorageComplete);
		?Item_Location_Gem_Storage ->
			sortItemBag(BagType),
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagSortGemStorageComplete);

		?Item_Location_Equip_Bag ->
			sortEquipBag(BagType),
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagSortEquipBagComplete);
		?Item_Location_Equip_Storage ->
			sortEquipBag(BagType),
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagSortEquipStorageComplete);

		?Item_Location_Pieces_Bag ->
			sortItemBag(BagType),
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagSortPiecesBagComplete);
		?Item_Location_Pieces_Storage ->
			sortItemBag(BagType),
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagSortPiecesStorageComplete);
		_ ->
			skip
	end,
	ok.

%%根据数量拆分道具
-spec splitItem(ItemUID, ItemID, Num, IsStoreInBag :: boolean(), #recPLogTSItem{}) -> #rec_item{} | failed
	when ItemUID :: uint(), ItemID :: uint(), Num :: uint().
splitItem(ItemUID, ItemID, Num, IsStoreInBag, #recPLogTSItem{} = TS) ->
	#itemCfg{itemType = ItemType} = getCfg:getCfgPStack(cfg_item, ItemID),
	BagType = getPackageType(ItemType),
	Item = case getGoodsFromBagByUID(ItemUID, BagType) of
			   #rec_item{itemUID = ItemUID, isLocked = false} = NormalItem ->
				   NormalItem;
			   _ ->
				   case getGoodsFromBagByUID(ItemUID, BagType) of
					   #rec_item{itemUID = ItemUID, isLocked = false} = GemItem ->
						   GemItem;
					   _ ->
						   false
				   end
		   end,
	splitItem1(BagType, Item, Num, IsStoreInBag, TS).

%%一键卖出所有策划设定的品质较差的装备
-spec sellAllPoorEquip() -> ok.
sellAllPoorEquip() ->
	Fun = fun(#recSaveEquip{quality = Quality} = Equip, SellBindGold) ->
		case Quality < ?EquipColorTypeBlue of
			true ->
				Money = moveGoodsToRecycle(Equip),
				SellBindGold + Money;
			_ ->
				SellBindGold
		end
		  end,
	SellMoney = lists:foldl(Fun, 0, playerState:getPackage(?Item_Location_Equip_Bag)),
	%%根据策划需求，所有买到回收站的物品得到的都是绑定的货币
	playerMoney:addCoin(?CoinTypeGold, SellMoney,
		#recPLogTSMoney{reason = ?CoinSourceCreateRecycle, param = 0, target = ?PLogTS_PlayerSelf, source = ?PLogTS_Item}),
	ok.

%%根据物品ID、数量等等信息生成相应的实例列表
-spec makeGoodsInstance(GoodsID, GoodsNum, IsBind, Quality, OwnerID, #recPLogTSItem{}) -> [uint(), ...] | [uint(), ...] when
	GoodsID :: uint(), GoodsNum :: uint(), IsBind :: boolean(), Quality :: uint(), OwnerID :: uint().
makeGoodsInstance(GoodsID, GoodsNum, IsBind, Quality, OwnerID, #recPLogTSItem{} = TS) when
	erlang:is_integer(GoodsID), GoodsID > 0, erlang:is_integer(GoodsNum), GoodsNum > 0, erlang:is_boolean(IsBind) ->
	case goods:getGoodsCfg(GoodsID) of
		#itemCfg{maxAmount = MaxPileNum} ->
			ItemList = makeItemInstance(GoodsID, GoodsNum, false, OwnerID, MaxPileNum, TS),
			[UID || #rec_item{itemUID = UID} <- ItemList];
		#equipmentCfg{} ->
			makeEquipInstance(GoodsID, GoodsNum, false, Quality, OwnerID, TS);
		_ ->
			?ERROR_OUT("makeGoodsInstance cannot find GoodsID:~p in cfg,Reason:~p ParamValue:~p", [GoodsID, TS#recPLogTSItem.changReason, TS#recPLogTSItem.reasonParam]),
			[]
	end.

%%改变指定道具的归属，可以由自己改为系统（他人），也可以由系统（他人）改为系统（他人）
%%但不能由系统（他人）改为自己(请使用addGoodsInstance接口)
-spec changeGoodsOwner(GoodsUID, GoodsID, CurOwnerID, ToOwnerID, #recPLogTSItem{}) -> boolean() when
	GoodsUID :: uint(), GoodsID :: uint(), CurOwnerID :: uint(), ToOwnerID :: uint().
changeGoodsOwner(GoodsUID, GoodsID, CurOwnerID, ToOwnerID, #recPLogTSItem{} = TS) when CurOwnerID =/= ToOwnerID ->
	changeGoodsOwner(GoodsUID, GoodsID, CurOwnerID, ToOwnerID, true, TS).

%%改变指定道具的归属，可以由自己改为系统（他人），也可以由系统（他人）改为系统（他人）
%%但不能由系统（他人）改为自己(请使用addGoodsInstance接口)
-spec changeGoodsOwner(GoodsUID, GoodsID, CurOwnerID, ToOwnerID, IsInBag :: boolean(), #recPLogTSItem{}) -> boolean() when
	GoodsUID :: uint(), GoodsID :: uint(), CurOwnerID :: uint(), ToOwnerID :: uint().
changeGoodsOwner(GoodsUID, GoodsID, CurOwnerID, ToOwnerID, IsInBag, #recPLogTSItem{} = TS) when CurOwnerID =/= ToOwnerID ->
	RoleID = playerState:getRoleID(),
	case RoleID =:= CurOwnerID andalso IsInBag of
		true ->
			%%改变自己指定UID的物品为他人拥有
			changeMyGoodsOwner(GoodsUID, GoodsID, ToOwnerID, TS),
			true;
		_ ->
			case ToOwnerID =/= RoleID of
				true ->
					case goods:getGoodsCfg(GoodsID) of
						#itemCfg{} ->
							changeGoodsOwnerAndLog(CurOwnerID, GoodsUID, GoodsID, ToOwnerID, false, TS),
							true;
						#equipmentCfg{} ->
							changeGoodsOwnerAndLog(CurOwnerID, GoodsUID, GoodsID, ToOwnerID, true, TS),
							true;
						_ ->
							?ERROR_OUT("Error changeGoodsOwner can not found goodsID:~p,UID:~p,CurOwnerID:~p,ToOwnerID:~p",
								[GoodsID, GoodsUID, CurOwnerID, ToOwnerID]),
							false
					end;
				_ ->
					%%这里不能由他人改为自己，不应该使用这个接口，应该使用addGoodsInstance
					?ERROR_OUT("Error changeGoodsOwner can changeToSelf goodsID:~p,UID:~p,CurOwnerID:~p,ToOwnerID:~p",
						[GoodsID, GoodsUID, CurOwnerID, ToOwnerID]),
					false
			end
	end.

%%获取指定背包中所有指定ID的物品
-spec getGoodsByID(GoodsID, BagType) -> [] | [#rec_item{}, ...] | [#recSaveEquip{}, ...] when
	GoodsID :: uint(), BagType :: ?Item_Location_Bag | ?Item_Location_Gem_Bag | ?Item_Location_Equip_Bag | ?Item_Location_Pieces_Bag.
getGoodsByID(GoodsID, BagType) when
	BagType =:= ?Item_Location_Bag;
	BagType =:= ?Item_Location_Equip_Bag;
	BagType =:= ?Item_Location_Gem_Bag;
	BagType =:= ?Item_Location_Pieces_Bag ->
	Bag = playerState:getPackage(BagType),
	Fun = fun(Goods, AccIn) ->
		case Goods of
			#rec_item{itemID = GoodsID} ->
				[Goods | AccIn];
			#recSaveEquip{itemID = GoodsID} ->
				[Goods | AccIn];
			_ ->
				AccIn
		end
		  end,
	lists:foldl(Fun, [], Bag).

%%获取普通背包指定ID的非锁定道具数量
-spec getItemNumByID(GoodsID) -> uint() when GoodsID :: uint().
getItemNumByID(0) ->
	0;
getItemNumByID(GoodsID) ->
	PayItemType = playerPackage:getItemType(GoodsID),
	PacketType = playerPackage:getPackageType(PayItemType),
	getGoodsNumByID(PacketType, GoodsID).

-spec tickPackage() -> ok.
tickPackage() ->
	Now = time:getSyncUTCTimeFromDBS(),
	GoodsList = playerState:getHasExpiredTimeGoodsList(),
	Fun = fun(#recExpiredTimeGoods{goodsUID = UID, bagType = BagType, expiredTime = ET} = Goods, AccIn) ->
		case Now >= ET of
			true ->
				%%过期道具只需要从内存中删除即可，不需要从数据库中删除，因为在读取角色道具的时候会自动排除掉已经过期的道具
				EquipBagList = [?Item_Location_BodyEquipBag, ?Item_Location_Equip_Bag, ?Item_Location_Equip_Storage],
				ItemBagList = [?Item_Location_Bag, ?Item_Location_Storage],
				GemBagList = [?Item_Location_Gem_Bag, ?Item_Location_GemEmbedBag],

				Ret1 = deleteExpiredTimeGoods(false, BagType, UID, EquipBagList),
				Ret2 = deleteExpiredTimeGoods(Ret1, BagType, UID, ItemBagList),
				Ret3 = deleteExpiredTimeGoods(Ret2, BagType, UID, GemBagList),

				case Ret3 of
					true ->
						skip;
					_ ->
						%%回收站的需要单独特殊处理，因为底层获取道具的接口不支持回收站
						deleteExpiredTimeGoodsFromRecycle(UID)
				end,
				AccIn;
			_ ->
				[Goods | AccIn]
		end
		  end,
	NewList = lists:foldl(Fun, [], GoodsList),
	playerState:setHasExpiredTimeGoodsList(NewList),
	ok.

deleteExpiredTimeGoods(true, _BagType, _UID, _BagTypeList) ->
	true;
deleteExpiredTimeGoods(_, BagType, UID, BagTypeList) ->
	case lists:member(BagType, BagTypeList) of
		true ->
			deleteExpiredTimeGoods(UID, BagTypeList);
		_ ->
			false
	end.

deleteExpiredTimeGoods(UID, BagTypeList) ->
	case playerPackage:getGoodsByUID(UID, BagTypeList) of
		#rec_item{pos = Pos} ->
			BagType = getBagType(Pos),
			deleteExpiredTimeGoods1(BagType, UID),
			true;
		#recSaveEquip{pos = Pos} ->
			deleteExpiredTimeGoods1(Pos, UID),
			true;
		_ ->
			false
	end.

gm_deleteExpiredTimeGoodsFromRecycle(UID) ->
	?WARN_OUT("gm_deleteExpiredTimeGoodsFromRecycle:~p,~p", [playerState:getRoleID(), UID]),
	deleteExpiredTimeGoodsFromRecycle(UID).

deleteExpiredTimeGoodsFromRecycle(UID) ->
	Plog = #recPLogTSItem{
		old = 0,
		new = 0,
		change = 0,
		target = ?PLogTS_System,
		source = ?PLogTS_PlayerSelf,
		gold = 0,
		goldtype = 0,
		changReason = ?ItemDeleteReasonExpired,
		reasonParam = UID
	},
	Bag = playerState:getPackage(?Item_Location_Recycle),
	case getGoodsFromRecycleByUID(Bag, UID) of
		#rec_item{} = Item ->
			deleteGoodsFromBag(?Item_Location_Recycle, Bag, Item, Plog);
		#recSaveEquip{} = Equip ->
			deleteGoodsFromBag(?Item_Location_Recycle, Bag, Equip, Plog);
		_ ->
			skip
	end.

%% 额外处理穿在身上的失效装备
deleteExpiredTimeGoods1(BagType, UID) ->
	Equip = case BagType of
				?Item_Location_BodyEquipBag -> getGoodsFromBagByUID(UID, BagType);
				_ -> false
			end,

	Plog = #recPLogTSItem{
		old = 0,
		new = 0,
		change = 0,
		target = ?PLogTS_System,
		source = ?PLogTS_PlayerSelf,
		gold = 0,
		goldtype = 0,
		changReason = ?ItemDeleteReasonExpired,
		reasonParam = UID
	},
	deleteGoodsByUID(BagType, UID, Plog),

	case Equip of
		#recSaveEquip{} ->
			playerGem:onEquipOff(Equip),
			playerEquip:onEquipOff(Equip, true);
		_ ->
			skip
	end,
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================

%%检查是否可以开指定数量的格子，如果能返回需要的金钱，否则返回相应的错误
-spec canOpenSlot(CurSlotNum, RequireOpenNum, DefaultSlotNum) -> RequireMoney :: uint() | noMoney | levelLimit when
	CurSlotNum :: uint(), RequireOpenNum :: uint(), DefaultSlotNum :: uint().
canOpenSlot(CurSlotNum, RequireOpenNum, DefaultSlotNum) ->
	CurLevel = playerState:getLevel(),
	StartNum = CurSlotNum - DefaultSlotNum,
	EndNum = StartNum + RequireOpenNum,
	List = getCfg:get1KeyList(cfg_openbag),
	Fun = fun(ID, AccInCoinList) ->
		case ID > StartNum andalso ID =< EndNum of
			true ->
				case getCfg:getCfgPStack(cfg_openbag, ID) of
					#openbagCfg{needlevel = NeedLevel, needgold = [CoinUseType, NeedCoinValue]} ->
						case CoinUseType >= ?CoinUseTypeMin andalso CoinUseType =< ?CoinUseTypeMax of
							true ->
								case lists:keyfind(CoinUseType, 1, AccInCoinList) of
									{CoinUseType, CoinValue} ->
										TotalValue = CoinValue + NeedCoinValue,
										IsCanUseCoin = playerMoney:canUseCoin(CoinUseType, TotalValue),
										if
										%%金钱不足
											IsCanUseCoin =:= false ->
												{break, noMoney};
										%%等级不足
											NeedLevel > CurLevel ->
												{break, levelLimit};
										%%正常
											true ->
												lists:keyreplace(CoinUseType, 1, AccInCoinList, {CoinUseType, TotalValue})
										end;
									_ ->
										IsCanUseCoin = playerMoney:canUseCoin(CoinUseType, NeedCoinValue),
										if
										%%金钱不足
											IsCanUseCoin =:= false ->
												{break, noMoney};
										%%等级不足
											NeedLevel > CurLevel ->
												{break, levelLimit};
										%%正常
											true ->
												[{CoinUseType, NeedCoinValue} | AccInCoinList]
										end
								end;
							_ ->
								?ERROR_OUT("Error CoinType when open bag slot")
						end;
					_ ->
						?ERROR_OUT("player[~p][~ts] Error OpenSlotNum[~p], Can not find in cfg", [playerState:getRoleID(), playerState:getName(), ID]),
						{break, levelLimit}
				end;
			_ ->
				%%此ID所示数量应该是之前已经开过了
				AccInCoinList
		end
		  end,
	misc:mapAccList(List, [], Fun).


-spec statOpenSlotNum(BagType, OpenNum) -> ok when
	BagType :: bagType(), OpenNum :: uint().
statOpenSlotNum(?Item_Location_Bag, OpenNum) ->
	playerAchieve:achieveEvent(?Achieve_Bag, [OpenNum]);
statOpenSlotNum(?Item_Location_Equip_Bag, OpenNum) ->
	playerAchieve:achieveEvent(?Achieve_Bag, [OpenNum]);
statOpenSlotNum(?Item_Location_Gem_Bag, OpenNum) ->
	playerAchieve:achieveEvent(?Achieve_Bag, [OpenNum]);
statOpenSlotNum(?Item_Location_Pieces_Bag, OpenNum) ->
	playerAchieve:achieveEvent(?Achieve_Bag, [OpenNum]);
statOpenSlotNum(?Item_Location_Storage, OpenNum) ->
	playerAchieve:achieveEvent(?Achieve_Store, [OpenNum]);
statOpenSlotNum(?Item_Location_Equip_Storage, OpenNum) ->
	playerAchieve:achieveEvent(?Achieve_Store, [OpenNum]);
statOpenSlotNum(?Item_Location_Pieces_Storage, OpenNum) ->
	playerAchieve:achieveEvent(?Achieve_Store, [OpenNum]);
statOpenSlotNum(?Item_Location_Gem_Storage, OpenNum) ->
	playerAchieve:achieveEvent(?Achieve_Store, [OpenNum]).

-spec getBagMaxSlotNum(BagType) -> uint() when
	BagType :: bagType().
getBagMaxSlotNum(BagType) ->
	case BagType of
		%%背包类型							最大格子大小
		?Item_Location_Bag -> ?BagMaxSlot;
		?Item_Location_Equip_Bag -> ?EquipBagMaxSlot;
		?Item_Location_Storage -> ?StorageMaxSlot;
		?Item_Location_Equip_Storage -> ?EquipStorageMaxSlot;
		?Item_Location_Recycle -> ?RecycleBagMaxSlot;
		?Item_Location_BodyEquipBag -> ?BodyEquipBagMaxSlot;
		?Item_Location_Gem_Bag -> ?GemBagMaxSlot;
		?Item_Location_Gem_Storage -> ?GemStorageMaxSlot;
		?Item_Location_GemEmbedBag -> ?GemEmbedDefaultOpenSlotNum;
		?Item_Location_Pieces_Bag -> ?PiecesBagMaxSlot;
		?Item_Location_Pieces_Storage -> ?PiecesStorageMaxSlot
	end.

-spec getBagDefaultSlotNum(BagType) -> uint() when
	BagType :: bagType().
getBagDefaultSlotNum(BagType) ->
	case BagType of
		%%背包类型							默认格子大小
		?Item_Location_Bag -> ?BagDefaultOpenSlotNum;
		?Item_Location_Storage -> ?StorageDefaultOpenSlotNum;
		?Item_Location_Equip_Bag -> ?EquipBagDefaultOpenSlotNum;
		?Item_Location_Equip_Storage -> ?EquipStorageDefaultOpenSlotNum;
		?Item_Location_Recycle -> ?RecycleBagMaxSlot;
		?Item_Location_BodyEquipBag -> ?BodyEquipBagMaxSlot;
		?Item_Location_Gem_Bag -> ?GemBagDefaultSlotNum;
		?Item_Location_Gem_Storage -> ?GemStorageDefaultSlotNum;
		?Item_Location_GemEmbedBag -> ?GemEmbedDefaultOpenSlotNum;
		?Item_Location_Pieces_Bag -> ?PiecesBagDefaultSlotNum;
		?Item_Location_Pieces_Storage -> ?PiecesStorageDefaultSlotNum
	end.

%%获取指定背包开启的格子数
-spec getBagOpenSlotNum(BagType) -> uint()
	when BagType :: 0..?Item_Location_Max.
getBagOpenSlotNum(BagType) ->
	Bag = playerState:getPackageInfo(BagType),
	ConfigSlot = getBagDefaultSlotNum(BagType),
	MaxSlot = Bag#rec_package_info.maxSlot,
	case MaxSlot > ConfigSlot of
		true ->
			MaxSlot;
		false ->
			ConfigSlot
	end.

%%存储一个道具到内存
%%注意：这里不能再根据BagType设置#recSaveItem{}或者#recSaveEquip{}中的位置
%%否则，宝石镶嵌背包中的道具会出问题，丢失掉镶嵌孔索引
-spec storeGoods(BagType, goods()) -> ok when
	BagType :: bagType().
storeGoods(BagType, #rec_item{itemUID = ItemUID, itemID = ItemID, pos = Pos} = Item) when ItemID < ?Item_Differentiate andalso erlang:is_integer(Pos) andalso Pos > 0
	andalso (BagType =:= ?Item_Location_Bag orelse BagType =:= ?Item_Location_GemEmbedBag
		orelse BagType =:= ?Item_Location_Gem_Bag orelse BagType =:= ?Item_Location_Storage
		orelse BagType =:= ?Item_Location_Pieces_Bag orelse BagType =:= ?Item_Location_Pieces_Storage
		orelse BagType =:= ?Item_Location_Gem_Storage orelse BagType =:= ?Item_Location_Recycle) ->
	Bag = playerState:getPackage(BagType),
	case BagType =:= ?Item_Location_GemEmbedBag of
		true ->
			%%这里强匹配背包类型
			BagType = getBagType(Pos),
			NewBag = lists:keystore(ItemUID, #rec_item.itemUID, Bag, Item),
			playerState:setPackage(BagType, NewBag);
		_ ->
			NewBag = lists:keystore(ItemUID, #rec_item.itemUID, Bag, Item#rec_item{pos = BagType}),
			playerState:setPackage(BagType, NewBag)
	end,
	ok;
storeGoods(BagType, #recSaveEquip{itemUID = EquipUID, itemID = ItemID} = Equip)
	when ItemID >= ?Item_Differentiate andalso (BagType =:= ?Item_Location_Equip_Bag orelse
	BagType =:= ?Item_Location_BodyEquipBag orelse
	BagType =:= ?Item_Location_Equip_Storage orelse
	BagType =:= ?Item_Location_Recycle) ->
	Bag = playerState:getPackage(BagType),
	NewBag = lists:keystore(EquipUID, #recSaveEquip.itemUID, Bag, Equip#recSaveEquip{pos = BagType}),
	playerState:setPackage(BagType, NewBag),
	ok;
storeGoods(BagType, Rec) ->
	?ERROR_OUT("~p,~p", [BagType, Rec]).


%%存储一个道具到内存，同时保存到数据库
-spec storeGoodsAndSave(BagType, goods()) -> ok when
	BagType :: bagType().
storeGoodsAndSave(BagType, Goods) ->
	storeGoods(BagType, Goods),
	%%保存到数据库
	saveNewGoodsInfo(Goods),
	ok.

-spec addGoods(GoodsID, GoodsNum, IsBind, EquipQuality, IsSendMail, #recPLogTSItem{}) -> [#rec_item{}, ...] | [#recSaveEquip{}, ...] | [] | ok
	when GoodsID :: uint(), GoodsNum :: uint(), IsBind :: boolean(), EquipQuality :: equipQuality(), IsSendMail :: boolean().
addGoods(GoodsID, GoodsNum, IsBind, EquipQuality, IsSendMail,
	#recPLogTSItem{changReason = GoodsSource, reasonParam = ParamValue} = TS) when erlang:is_integer(GoodsSource), erlang:is_integer(ParamValue) ->
	case playerState:getIsPlayer() of
		true ->
			Ret =
				case goods:getGoodsCfg(GoodsID) of
					#equipmentCfg{name = EquipName} ->
						case addEquipment(GoodsID, GoodsNum, IsBind, EquipQuality, IsSendMail, TS) of
							[#recSaveEquip{} = Equips | _] = List ->
								case EquipQuality >= ?EquipColorTypeOrange andalso GoodsSource =:= ?ItemSourceKillMonster of
									true ->
										playerGameNotice:sendGameNotice(?EquipDrop_Notice, EquipName, EquipQuality, Equips#recSaveEquip.itemUID),
										List;
									_ ->
										List
								end;
							_ ->
								[]
						end;
					#itemCfg{itemType = ItemType, maxAmount = MaxPileNum, useStraightway = UseStraightway, useParam3 = GemLevel} ->
						BagType = getPackageType(ItemType),
						ItemList = addItem(BagType, GoodsID, GoodsNum, MaxPileNum, IsBind, IsSendMail, 0, TS),
						case misc:size(ItemList) > 0 andalso ItemType =:= ?ItemTypeGem andalso GoodsSource =:= ?ItemSourceGemMake of
							true ->
								playerGameNotice:sendGameNotice(?GemComposition_Notice, GemLevel, 0, 0);
							_ ->
								skip
						end,
						case BagType =:= ?Item_Location_Bag of
							true ->
								case UseStraightway of
									1 ->  %%该道具进入背包则直接使用
										Fun = fun(#rec_item{itemUID = ItemUID, pileNum = Num} = SaveItem, AccIn) ->
											case playerItem:useBagItem(ItemUID, Num, ?ItemDeleteReasonUsed, ItemUID) of
												ok ->
													AccIn;
												_ ->
													?ERROR_OUT("Use Item[~p] Num:~p Direct Failed!", [ItemUID, Num]),
													[SaveItem | AccIn]
											end
											  end,
										case lists:foldl(Fun, [], ItemList) of
											[] ->
												ok;
											List ->
												List
										end;
									_ -> %%该道具进入背包不直接使用
										ItemList
								end;
							_ ->
								ItemList
						end;
					_ ->
						?ERROR_OUT("Cannot addGoods ID:~p,Cannot found in cfg,Source:~p", [GoodsID, TS]),
						[]
				end,
			case Ret of
				[#recSaveEquip{itemID = ItemID} | _] = Equip ->
					if
						ItemID =:= ?AcUseItemID10 ->
							playerAchieve:achieveEvent(?Achieve_Act_Event16, [GoodsNum]);
%% 				ItemID =:= ? ->
%% 					playerAchieve:achieveEvent(?Achieve_Act_Event17, [GoodsNum]);
						true ->
							case lists:member(ItemID, ?AcUseItemID11) of
								true ->
									playerAchieve:achieveEvent(?Achieve_Act_Event17, [GoodsNum]);
								_ ->
									skip
							end
					end,
					playerSevenDayAim:updateCondition(?SevenDayAim_EquipQuality, []),
					addGoodCallBack(GoodsSource, Equip, GoodsNum);
				[#rec_item{} | _] = Item ->
					addGoodCallBack(GoodsSource, Item, GoodsNum);
				_ ->
					skip
			end,
			%%	?WARN_OUT("addGoods:source:~p,~s,item=~p", [GoodsSource, playerState:getName(),Ret]),
			Ret;
		_ ->
			[]
	end.

-spec addEquipment(EquipID, EquipNum, IsBind, Quality, IsSendMail, #recPLogTSItem{}) -> [] | [#recSaveEquip{}, ...] when
	EquipID :: uint(), EquipNum :: uint(), IsBind :: boolean(), Quality :: uint(), IsSendMail :: boolean().
addEquipment(EquipID, EquipNum, IsBind, Quality, IsSendMail, #recPLogTSItem{} = TS) ->
	%%装备
	EmptySlotNum = getBagIdleSlotNum(?Item_Location_Equip_Bag),
	case EmptySlotNum >= EquipNum of
		true ->
			%%有足够的空格子
			EquipList = addEquip(EquipID, EquipNum, IsBind, Quality, TS),
			%%通知添加装备消息到客户端
			EquipInfoList = [goods:makeEquipNetMessage(Equip) || Equip <- EquipList],
			sendAddEquipMessage(?Item_Location_Equip_Bag, EquipInfoList),

			%%返回添加成功的装备列表
			EquipList;
		_ ->
			case IsSendMail of
				true ->
					playerMail:sendGoodsMail(EquipID, EquipNum - EmptySlotNum, IsBind, Quality, TS#recPLogTSItem{changReason = ?ItemSourceBagEmptyMail});
				_ ->
					%%没有足够的空格子，发送消息给客户端进行提示
					case bagFullTipsIsCooldown(?Item_Location_Equip_Bag) of
						true ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_BagItem_EquipFull),
							bagFullTipsLastTime(?Item_Location_Equip_Bag);
						_ ->
							skip
					end,
					skip
			end,
			[]
	end.

-spec addEquip(EquipID, Num, IsBind, EquipQuality, #recPLogTSItem{}) -> [] | [#recSaveEquip{}, ...] when
	EquipID :: uint(), Num :: uint(), IsBind :: boolean(), EquipQuality :: uint().
addEquip(EquipID, Num, IsBind, EquipQuality, #recPLogTSItem{} = TS) ->
	List = lists:seq(1, Num),
	Fun = fun(_, AccIn) ->
		#recSaveEquip{} = Equip = playerEquip:makeEquip(EquipID, EquipQuality, ?Item_Location_Equip_Bag, IsBind),
		#recSaveEquip{} = NewEquip = setupGoodsExpireTime(Equip),
		addNewEquipInstance(NewEquip, TS),
		[NewEquip | AccIn]
		  end,
	lists:foldl(Fun, [], List).

%%设置道具或者道具的过期时间
setupGoodsExpireTime(#recSaveEquip{itemUID = ItemUID, itemID = ItemID, pos = Pos, expiredTime = 0} = Equip) ->
	#equipmentCfg{usefulLife = Life} = getCfg:getCfgPStack(cfg_equipment, ItemID),
	ET = calcExpiredTime(time:getSyncUTCTimeFromDBS(), Life),
	BagType = getBagType(Pos),
	checkAndAddExpiredTimeGoodsList(ItemUID, BagType, ET),
	Equip#recSaveEquip{expiredTime = ET};
setupGoodsExpireTime(#rec_item{itemUID = ItemUID, itemID = ItemID, pos = Pos, expiredTime = 0} = Item) ->
	#itemCfg{usefulLife = Life} = getCfg:getCfgPStack(cfg_item, ItemID),
	BagType = getBagType(Pos),
	ET = calcExpiredTime(time:getSyncUTCTimeFromDBS(), Life),
	checkAndAddExpiredTimeGoodsList(ItemUID, BagType, ET),
	Item#rec_item{
		expiredTime = ET
	};
setupGoodsExpireTime(Goods) ->
	Goods.

calcExpiredTime(Now, Life) when erlang:is_integer(Life) andalso Life > 0 ->
	Now + Life;
calcExpiredTime(_Now, _Life) ->
	0.

%%判断是否是有时效性的道具，如果是则加入时效性道具列表中
checkAndAddExpiredTimeGoodsList(ItemUID, BagType, ET) ->
	case ET > 0 of
		true ->
			ETList = playerState:getHasExpiredTimeGoodsList(),
			playerState:setHasExpiredTimeGoodsList([#recExpiredTimeGoods{goodsUID = ItemUID, bagType = BagType, expiredTime = ET} | ETList]);
		_ ->
			skip
	end,
	ok.

-spec addNewEquipInstance(#recSaveEquip{}, #recPLogTSItem{}) -> ok.
addNewEquipInstance(#recSaveEquip{itemID = ItemID, isBind = IsBind, quality = Quality, pos = BagType} = Equip, #recPLogTSItem{} = TS) ->
	%%存储到内存中并保存到数据库
	storeGoodsAndSave(BagType, Equip#recSaveEquip{roleID = playerState:getRoleID()}),
	dbLog:sendSaveLogCreateGoods(
		playerState:getRoleID(),
		Equip#recSaveEquip.itemUID,
		ItemID,
		1,
		IsBind,
		BagType,
		0,
		Quality,
		TS),
	ok.

addItemInstance(BagType,
	#rec_item{roleID = RoleID, itemUID = ItemUID, pileNum = PileNum, pos = Pos} = Item,
	#recPLogTSItem{changReason = Reason} = TS) when
	BagType =:= ?Item_Location_Bag; BagType =:= ?Item_Location_Pieces_Bag; BagType =:= ?Item_Location_Gem_Bag; BagType =:= ?Item_Location_GemEmbedBag ->

	case getBagIdleSlotNum(BagType) > 0 of
		true ->
			SelfRoleID = playerState:getRoleID(),
			NewGoods = Item#rec_item{roleID = SelfRoleID},
			%%这里必须先添加新道具实例到背包
			BagType = getBagType(Pos),
			%%存储到内存并保存到数据库
			storeGoodsAndSave(BagType, NewGoods),
			case SelfRoleID =/= RoleID of
				true ->
					%%之前不是自己的道具，需要改变归属，作为一个新道具添加到背包，并记录相应的日志
					%%通知数据库修改道具的拥有者
					Logrec = #recLogGoodsChange{
						itemUID = ItemUID,
						itemID = Item#rec_item.itemID
					},
					dbLog:sendSaveLogChangeGoods(Logrec, TS);
				_ ->
					%%之前就是自己的道具
					skip
			end,

			%%通知客户端
			case Reason of
				?ItemDeleteReasonGemOn ->
					playerMsg:sendNetMsg(#pk_GS2U_UpdateNormalItem{type = BagType, items = [makeItemNetMessage(NewGoods)]});
				_ ->
					Msg = makeItemNetMessage(NewGoods),
					sendAddItemMessage(BagType, PileNum, [Msg])
			end,
			%%检测是否是镶嵌宝石背包，如果是需要发送不同的消息
			case BagType =:= ?Item_Location_GemEmbedBag of
				true ->
					Slot = getEmbedGemSlot(Pos),
					%%宝石镶嵌带来的属性改变
					gemEmbedOnChangeProp(Item#rec_item.itemID, Slot),
					%%给客户端宝石增加的消息
					sendEmbedGemNetMsg(NewGoods);
				_ ->
					skip
			end,
			true;
		_ ->
			false
	end.

-spec addItem(BagType, ItemID, ItemNum, MaxPileNum, IsBind, IsSendMail, ExceptionUID, #recPLogTSItem{}) -> itemList() when
	BagType :: bagType(), ItemID :: uint(), ItemNum :: uint(), MaxPileNum :: uint(), IsBind :: boolean(), IsSendMail :: boolean(), ExceptionUID :: uint().
addItem(BagType, ItemID, ItemNum, MaxPileNum, IsBind, IsSendMail, ExceptionUID, #recPLogTSItem{source = GoodsSource} = TS) ->
	RoleID = playerState:getRoleID(),
	{{ItemList, ChangeList}, RemainNum} = getCanPileItem(BagType, ItemID, ItemNum, false, MaxPileNum, ExceptionUID),
	case RemainNum > 0 of
		true ->
			%%没有被全部堆叠到已有道具，还需要额外的格子来存放
			IdleSlotNum = getBagIdleSlotNum(BagType),
			CanPileNum = IdleSlotNum * MaxPileNum,
			case CanPileNum >= RemainNum of
				true ->
					updatePileItem(RoleID, BagType, ItemList, ChangeList, ItemID, ItemNum, false, RemainNum, MaxPileNum, TS);
				_ ->
					%%没有足够的空间存放
					case IsSendMail of
						true ->
							MailNum = RemainNum - CanPileNum,
							case MailNum =< ItemNum of
								true ->
									playerMail:sendGoodsMail(ItemID, MailNum, false, 0, TS#recPLogTSItem{changReason = ?ItemSourceBagEmptyMail}),
									updatePileItem(RoleID, BagType, ItemList, ChangeList, ItemID, ItemNum, false, CanPileNum, MaxPileNum, TS);
								_ ->
									%%数据异常？
									?ERROR_OUT("player:~ts RoleID:~p addItemAndMail ItemID:~p Num:~p to BagType:~p failed,~p",
										[playerState:getName(), playerState:getRoleID(), ItemID, ItemNum, BagType, {IdleSlotNum, MaxPileNum, RemainNum}]),
									[]
							end;
						_ ->
							%%当没足够空间存放，又不发邮件时，则提示客户端并返回空列表
							{BagType2, ErrorCode} =
								case goods:getGoodsCfg(ItemID) of
									#itemCfg{itemType = ?ItemTypeGem} ->
										{?Item_Location_Gem_Bag, ?ErrorCode_BagItem_GemFull};
									#itemCfg{itemType = ?ItemTypePieces} ->
										{?Item_Location_Pieces_Bag, ?ErrorCode_BagItem_PiecesFull};
									_ ->
										{?Item_Location_Bag, ?ErrorCode_BagItem_ItemFull}
								end,
							case bagFullTipsIsCooldown(BagType2) of
								true ->
									playerMsg:sendErrorCodeMsg(ErrorCode),
									bagFullTipsLastTime(BagType2);
								_ ->
									skip
							end,
							[]
					end
			end;
		_ ->
			%%全部被堆叠到已有的道具中
			storePileItem(RoleID, BagType, ItemID, ItemList, ChangeList, TS),
			%%通知客户端更新
			case GoodsSource of
				?ItemSourceGemOff ->
					%%如果是宝石卸载则发更新消息
					playerMsg:sendNetMsg(#pk_GS2U_UpdateNormalItem{type = BagType, items = [makeItemNetMessage(I) || I <- ItemList]}),
					ItemList;
				_ ->
					Fun = fun(#rec_item{} = Item, {AccIn1, AccIn2}) ->
						{[makeItemNetMessage(Item) | AccIn1], [Item | AccIn2]}
						  end,
					%%构造网络消息包列表以及返回的道具列表
					{NL1, L1} = lists:foldl(Fun, {[], []}, ItemList),
					sendAddItemMessage(BagType, ItemNum, NL1),
					L1
			end
	end.

-spec updatePileItem(RoleID, BagType, ItemList, ChangeList, ItemID, ItemNum, IsBind, RemainNum, MaxPileNum, #recPLogTSItem{}) -> itemList() when
	RoleID :: uint(), BagType :: bagType(), ItemList :: list(), ChangeList :: list(), ItemID :: uint(), ItemNum :: uint(), IsBind :: boolean(), RemainNum :: uint(),
	MaxPileNum :: uint().
updatePileItem(RoleID, BagType, ItemList, ChangeList, ItemID, ItemNum, IsBind, RemainNum, MaxPileNum,
	#recPLogTSItem{source = GoodsSource} = TS) ->
	%%更新堆叠到原来的道具
	storePileItem(RoleID, BagType, ItemID, ItemList, ChangeList, TS),
	%%存放新道具
	AllItemList = storeNewItem(RemainNum, MaxPileNum, ItemID, false, BagType, ItemList, TS),

	case GoodsSource of
		?ItemSourceGemOff ->
			%%如果是宝石卸载则发更新消息
			playerMsg:sendNetMsg(#pk_GS2U_UpdateNormalItem{type = BagType, items = [makeItemNetMessage(I) || I <- AllItemList]}),
			AllItemList;
		_ ->
			Fun = fun(#rec_item{} = Item, {AccIn1, AccIn2}) ->
				{[makeItemNetMessage(Item) | AccIn1], [Item | AccIn2]}
				  end,

			%%构造网络消息包列表以及返回的道具列表
			{NL1, L1} = lists:foldl(Fun, {[], []}, ItemList),
			{NL2, L2} = lists:foldl(Fun, {NL1, L1}, AllItemList),
			%%通知客户端更新
			sendAddItemMessage(BagType, ItemNum, NL2),
			L2
	end.

-spec storePileItem(RoleID, BagType, ItemID, ItemList, ChangeList, #recPLogTSItem{}) -> ok when
	RoleID :: uint(), BagType :: bagType(), ItemID :: uint(), ItemList :: itemList(), ChangeList :: [{ItemUID, NewValue, ChangeValue}, ...] | [],
	ItemUID :: uint(), NewValue :: uint(), ChangeValue :: int().
storePileItem(_RoleID, BagType, ItemID, ItemList, ChangeList, #recPLogTSItem{} = TS) ->
	%%记录堆叠数量改变日志
	Fun1 = fun({ItemUID, NewValue, ChangeValue}) ->
		#rec_item{pileNum = OldPileNum} = playerPackage:getGoodsByUID(ItemUID),
		Logrec = #recLogGoodsChange{
			itemUID = ItemUID,
			itemID = ItemID
		},
		dbLog:sendSaveLogChangeGoods(Logrec, TS#recPLogTSItem{old = OldPileNum, new = NewValue, change = ChangeValue})
		   end,
	lists:foreach(Fun1, ChangeList),

	%%有足够的空间存放
	Fun = fun(#rec_item{} = Item) ->
		%%存入内存并保存到数据库
		storeGoodsAndSave(BagType, Item)
		  end,
	%%存放堆叠的道具
	lists:foreach(Fun, ItemList).

%%增加道具消息
-spec makeItemNetMessage(Item) -> undefined | #pk_NormalItemInfo{} when Item :: #rec_item{}.
makeItemNetMessage(#rec_item{
	itemUID = UID,
	itemID = ID,
	pileNum = PileNum,
	isBind = IsBind,
	isLocked = IsLocked,
	expiredTime = ET
}) ->
	%%由于过期时间存储的是UTC时间，所以发给客户端时需要加上时区
	ExpiredTime = case ET > 0 of
					  true ->
						  ET + time:getLocalTimeAdjustHour() * 3600;
					  _ ->
						  0
				  end,
	#pk_NormalItemInfo{
		itemID = ID,
		itemUID = UID,
		itemSum = PileNum,
		isBind = IsBind,
		isLocked = IsLocked,
		expiredTime = ExpiredTime
	}.

%%发送增加道具消息
-spec sendAddItemMessage(BagType, AddItemNum, ItemList) -> ok when BagType :: 0 ..?Item_Location_Max, ItemList :: list(), AddItemNum :: uint().
sendAddItemMessage(BagType, AddItemNum, ItemList) when erlang:is_list(ItemList) ->
	Code = playerState:getKillMonsterCode(),
	playerMsg:sendNetMsg(#pk_GS2U_AddNormalItemToBag{code = Code, type = BagType, addNum = AddItemNum, items = ItemList}),
	ok.

-spec storeNewItem(ItemNum, MaxPileNum, ItemID, IsBind, BagType, AccIn, #recPLogTSItem{}) -> AccIn when
	ItemNum :: uint(), MaxPileNum :: uint(), ItemID :: itemId(), IsBind :: boolean(), BagType :: bagType(), AccIn :: list().
storeNewItem(0, _MaxPileNum, _ItemID, _IsBind, _BagType, AccIn, _TS) ->
	AccIn;
%%需要存放的道具不能在一个格子存放完
storeNewItem(ItemNum, MaxPileNum, ItemID, IsBind, BagType, AccIn, TS) when ItemNum > MaxPileNum ->
	%%需要堆叠的数量比最大可堆叠数量还要多，先堆叠一个最大数量的，再堆叠剩余的
	ItemList = storeNewItem(MaxPileNum, MaxPileNum, ItemID, IsBind, BagType, AccIn, TS),
	storeNewItem(ItemNum - MaxPileNum, MaxPileNum, ItemID, IsBind, BagType, ItemList, TS);
%%需要存放的道具可以在一个格子存放完
storeNewItem(ItemNum, _MaxPileNum, ItemID, IsBind, BagType, AccIn, TS) ->
	Item = createAnItemInstance(ItemID, ItemNum, IsBind, playerState:getRoleID(), BagType, true, TS),
	storeGoods(BagType, Item),
	[Item | AccIn].

-spec getCanPileItem(BagType, ItemID, ItemNum, IsBind, MaxPileNum, ExceptionUID) -> {{list(), list()}, RemainItemNum} when
	BagType :: bagType(), ItemID :: uint(), ItemNum :: uint(), IsBind :: boolean(), MaxPileNum :: uint(), ExceptionUID :: uint(), RemainItemNum :: uint().
getCanPileItem(_, _, ItemNum, _, 1, _) ->
	{{[], []}, ItemNum};
getCanPileItem(BagType, ItemID, ItemNum, IsBind, MaxPileNum, ExceptionUID) ->
	BagItemList = playerState:getPackage(BagType),
	pileNormalItem(BagItemList, ItemID, ItemNum, IsBind, MaxPileNum, ExceptionUID, {[], []}).

%%堆叠普通道具，返回堆叠后的道具列表、修改列表及剩余道具数量
-spec pileNormalItem(ItemList, ItemID, ItemNum, IsBind, MaxPileNum, ExceptionUID, AccIn) -> {AccIn, RemainItemNum} when ItemList :: itemList(),
	ItemID :: uint(), ItemNum :: uint(), IsBind :: boolean(), MaxPileNum :: uint(), ExceptionUID :: uint(), AccIn :: {list(), list()}, RemainItemNum :: uint().
pileNormalItem([], _ItemID, ItemNum, _IsBind, _MaxPileNum, _ExceptionUID, AccIn) ->
	{AccIn, ItemNum};
%%与目标道具的绑定属性相同，可以堆叠
pileNormalItem([#rec_item{itemUID = ItemUID, itemID = ItemID, pileNum = PileNum, isBind = IsBind, expiredTime = 0} = H | T], ItemID, ItemNum, IsBind, MaxPileNum, ExceptionUID, {ItemList, ChangeList} = AccIn) when ItemUID =/= ExceptionUID ->
	Num = ItemNum + PileNum,
	case Num =< MaxPileNum of
		true ->
			%%能够全部堆叠，退出递归
			{{[H#rec_item{pileNum = Num} | ItemList], [{ItemUID, Num, ItemNum} | ChangeList]}, 0};
		_ ->
			%%不能全部堆叠，继续查找
			case PileNum =:= MaxPileNum of
				true ->
					%%之前就是满的
					pileNormalItem(T, ItemID, ItemNum, IsBind, MaxPileNum, ExceptionUID, AccIn);
				_ ->
					%%之前不是满的
					CanPileNum = MaxPileNum - PileNum,
					pileNormalItem(T, ItemID, ItemNum - CanPileNum, IsBind, MaxPileNum, ExceptionUID,
						{[H#rec_item{pileNum = MaxPileNum} | ItemList], [{ItemUID, MaxPileNum, CanPileNum} | ChangeList]})
			end
	end;
%%与目标道具的绑定属性不同，不能堆叠
pileNormalItem([_ | T], ItemID, ItemNum, IsBind, MaxPileNum, ExceptionUID, AccIn) ->
	pileNormalItem(T, ItemID, ItemNum, IsBind, MaxPileNum, ExceptionUID, AccIn).

%%发送增加装备消息
-spec sendAddEquipMessage(BagType, EquipList) -> ok
	when BagType :: 0 ..?Item_Location_Max, EquipList :: list().
sendAddEquipMessage(BagType, EquipList) when erlang:is_list(EquipList) ->
	Code = playerState:getKillMonsterCode(),
	playerMsg:sendNetMsg(#pk_GS2U_AddEquipItemToBag{code = Code, type = BagType, items = EquipList}),
	ok.

%%发送实时保存物品消息
-spec saveNewGoodsInfo(Goods) -> ok
	when Goods :: goods().
saveNewGoodsInfo(#rec_item{itemID = ItemID} = Item) when ItemID < ?Item_Differentiate ->
	playerSave:saveGoods(Item),
	ok;
saveNewGoodsInfo(#recSaveEquip{itemID = ItemID, baseProp = EquipBaseProp, extProp = EquipExtProp, enhanceProp = EquipEnhanceProp} = Equip) when ItemID >= ?Item_Differentiate ->
	%%确保数据正确
	#rec_equip_base_info{equipUID = EquipUID} = EquipBaseProp,
	#rec_equip_enhance_info{equipUID = EquipUID} = EquipEnhanceProp,
	case EquipExtProp of
		#rec_equip_ext_info{equipUID = UID} when UID =:= 0 orelse UID =:= EquipUID ->
			skip;
		_ ->
			?ERROR_OUT("Error EquipUID[~p] of ExtProp[~p]", [EquipUID, EquipExtProp]),
			throw("Error EquipUID of ExtProp")
	end,

	playerSave:saveGoods(Equip),
	ok.

%%从普通道具背包、宝石背包、装备背包或者回收站中真正删除道具，并保存数据库，同时通知客户端，记录删除日志
-spec deleteGoodsFromBag(BagType, BagGoodsList, #rec_item{} | #recSaveEquip{}, #recPLogTSItem{}) -> ok when
	BagType :: bagType(), BagGoodsList :: list().
deleteGoodsFromBag(BagType, BagGoodsList,
	#rec_item{itemUID = UID, itemID = ItemID, pileNum = PileNum} = Item,
	#recPLogTSItem{} = TS)
	when BagType =:= ?Item_Location_Bag; BagType =:= ?Item_Location_Storage; BagType =:= ?Item_Location_Gem_Bag;
	BagType =:= ?Item_Location_Gem_Storage; BagType =:= ?Item_Location_Recycle;
	BagType =:= ?Item_Location_Pieces_Bag; BagType =:= ?Item_Location_Pieces_Storage ->

	%%从内存中直接删除
	NewBag = lists:keydelete(UID, #rec_item.itemUID, BagGoodsList),
	playerState:setPackage(BagType, NewBag),
	%%从数据库中的删除
	deleteGoodsFromDB(Item),
	%%通知客户端删除
	sendDeleteGoodsNetMsg(BagType, [UID]),
	%%记录删除日志
	Logrec = #recLogGoodsChange{
		itemUID = UID,
		itemID = ItemID
	},
	dbLog:sendSaveLogChangeGoods(Logrec, TS#recPLogTSItem{old = PileNum, new = 0, change = PileNum}),
	ok;
deleteGoodsFromBag(BagType, BagGoodsList,
	#recSaveEquip{itemID = ItemID, itemUID = UID} = Equip,
	#recPLogTSItem{} = TS)
	when ItemID >= ?Item_Differentiate ->

	%%从内存中直接删除
	NewBag = lists:keydelete(UID, #recSaveEquip.itemUID, BagGoodsList),
	playerState:setPackage(BagType, NewBag),
	%%从数据库中的删除
	deleteGoodsFromDB(Equip),
	%%通知客户端删除
	sendDeleteGoodsNetMsg(BagType, [UID]),
	%%记录删除日志
	Logrec = #recLogGoodsChange{
		itemUID = UID,
		itemID = ItemID
	},
	dbLog:sendSaveLogChangeGoods(Logrec, TS#recPLogTSItem{old = 1, new = 0, change = 1}),
	ok.

%%根据UID删除物品
-spec deleteGoodsFromDB(#rec_item{} | #recSaveEquip{}) -> ok.
deleteGoodsFromDB(#rec_item{itemUID = ItemUID}) ->
	playerSave:deleteGoods(ItemUID),
	ok;
deleteGoodsFromDB(#recSaveEquip{
	itemUID = ItemUID                    %%道具UID
}) ->
	case playerSave:deleteGoods(ItemUID) of
		true ->
			skip;
%%			edb:deleteRecord(rec_equip_base_info, ItemUID),
%%			edb:deleteRecord(rec_equip_enhance_info, ItemUID),
%%			edb:deleteRecord(rec_equip_ext_info, ItemUID);
		_ ->
			skip
	end,
	ok.

%%发送删除物品消息
-spec sendDeleteGoodsNetMsg(BagType, UIDList) -> ok
	when BagType :: bagType(), UIDList :: list().
sendDeleteGoodsNetMsg(BagType, UIDList) when erlang:is_list(UIDList) ->
	playerMsg:sendNetMsg(#pk_GS2U_DeleteGoods{type = BagType, goodsUIDs = UIDList}),
	ok.

-spec sendMoveGoodsNetMsg(GoodsUID, SrcBagType, DstBagType) -> ok when
	GoodsUID :: uint(), SrcBagType :: bagType(), DstBagType :: bagType().
sendMoveGoodsNetMsg(GoodsUID, SrcBagType, DstBagType) ->
	%%同步更新到客户端
	playerMsg:sendNetMsg(#pk_MoveGoods{itemUID = GoodsUID, target = DstBagType, source = SrcBagType}),
	ok.

%%此函数只能从普通背包，装备背包，宝石背包，身上，普通仓库，装备仓库，宝石仓库中进行查找
getGoodsFromBagByUID(UID, BagType) when BagType =:= ?Item_Location_Bag; BagType =:= ?Item_Location_Gem_Bag;
	BagType =:= ?Item_Location_Pieces_Bag;    BagType =:= ?Item_Location_Pieces_Storage;
	BagType =:= ?Item_Location_Storage;    BagType =:= ?Item_Location_Gem_Storage; BagType =:= ?Item_Location_Gem_Bag ->
	Bag = playerState:getPackage(BagType),
	case lists:keyfind(UID, #rec_item.itemUID, Bag) of
		#rec_item{} = Goods ->
			Goods;
		_ ->
			failed
	end;
getGoodsFromBagByUID(UID, BagType) when BagType =:= ?Item_Location_Equip_Bag;
	BagType =:= ?Item_Location_BodyEquipBag; BagType =:= ?Item_Location_Equip_Storage ->
	Bag = playerState:getPackage(BagType),
	case lists:keyfind(UID, #recSaveEquip.itemUID, Bag) of
		#recSaveEquip{} = Goods ->
			Goods;
		_ ->
			failed
	end.

%%%从回收站中查找指定UID的道具
%getGoodsFromRecycleByUID(UID) ->
%	Bag = playerState:getPackage(?Item_Location_Recycle),
%	getGoodsFromRecycleByUID(Bag, UID).

%%遍历回收站的物品查找指定UID的道具
getGoodsFromRecycleByUID([], _UID) ->
	notFound;
getGoodsFromRecycleByUID([#rec_item{itemUID = UID} = Goods | _T], UID) ->
	Goods;
getGoodsFromRecycleByUID([#recSaveEquip{itemUID = UID} = Goods | _T], UID) ->
	Goods;
getGoodsFromRecycleByUID([_H | T], UID) ->
	getGoodsFromRecycleByUID(T, UID).

%%移动道具具体处理函数
-spec moveItem(GoodsUID, DstBagType, SrcBagType) -> ok | noSlot | notFound
	when GoodsUID :: uint(), DstBagType :: bagType(), SrcBagType :: bagType().
moveItem(GoodsUID, DstBagType, SrcBagType) ->
	case getBagIdleSlotNum(DstBagType) > 0 of
		true ->
			case getGoodsFromBagByUID(GoodsUID, SrcBagType) of
				#rec_item{itemUID = GoodsUID} = Item ->
					moveItem(GoodsUID, DstBagType, SrcBagType, #rec_item.itemUID, Item#rec_item{pos = DstBagType}),
					ok;
				#recSaveEquip{itemUID = GoodsUID} = Equip ->
					moveItem(GoodsUID, DstBagType, SrcBagType, #recSaveEquip.itemUID, Equip#recSaveEquip{pos = DstBagType}),
					ok;
				_ ->
					%%没有查找到相应的道具，发送错误消息
					notFound
			end;
		_ ->
			%%无背包格子，发送错误消息
			noSlot
	end.

moveItem(GoodsUID, DstBagType, SrcBagType, UIDIndex, Goods) when DstBagType =/= SrcBagType ->
	SrcBag = playerState:getPackage(SrcBagType),
	%%从源背包中删除
	NewSrcBag = lists:keydelete(GoodsUID, UIDIndex, SrcBag),
	playerState:setPackage(SrcBagType, NewSrcBag),
	%%添加到目标背包中,同步更新到数据库
	storeGoodsAndSave(DstBagType, Goods),
	sendMoveGoodsNetMsg(GoodsUID, SrcBagType, DstBagType),

	%%同步更新到客户端
	if
		DstBagType =:= ?Item_Location_GemEmbedBag ->
			%%宝石镶嵌带来的属性改变
			#rec_item{itemID = ItemID, pos = Pos} = Goods,
			Slot = getEmbedGemSlot(Pos),
			gemEmbedOnChangeProp(ItemID, Slot),
			sendEmbedGemNetMsg(Goods);
		true ->
			skip
	end,
	ok.

%%移动物品到回收站，也会通知数据库删除
moveGoodsToRecycle(GoodsUID, SrcBagType) ->
	%%从背包中实际删除物品并通知数据库及时更新
	Money = case getGoodsFromBagByUID(GoodsUID, SrcBagType) of
				#rec_item{} = Item ->
					moveGoodsToRecycle(Item);
				#recSaveEquip{} = Equip ->
					moveGoodsToRecycle(Equip);
				_ ->
					?ERROR_OUT("player:~ts ID:~p move Goods UID:~p From Bag:~p To Recycle,but not found",
						[playerState:getName(), playerState:getRoleID(), GoodsUID, SrcBagType]),
					0
			end,
	%%根据策划需求，所有买到回收站的物品得到的都是绑定的货币
	playerMoney:addCoin(?CoinTypeGold, Money,
		#recPLogTSMoney{reason = ?CoinSourceCreateRecycle, param = GoodsUID, target = ?PLogTS_PlayerSelf, source = ?PLogTS_Item}),
	ok.

%%将指定物品移动到回收站，并返回可以卖得的钱
moveGoodsToRecycle(#rec_item{itemUID = GoodsUID, itemID = ItemID, pileNum = PileNum, pos = SrcBagType}) ->
	#itemCfg{price = Price, operate = OperateLimit} = getCfg:getCfgPStack(cfg_item, ItemID),
	%%断定是否可以被丢弃
	case goods:canBeDiscard(OperateLimit) of
		true ->
			deleteGoodsByUID(SrcBagType, GoodsUID, #recPLogTSItem{
				target = ?PLogTS_System,
				source = ?PLogTS_PlayerSelf,
				changReason = ?ItemDeleteReasonRecycle,
				reasonParam = SrcBagType,
				gold = Price * PileNum,
				goldtype = ?CoinTypeGold
			}),
%%			deleteTailGoodsFromRecycle(),
%%			NewItem = Item#rec_item{pos = ?Item_Location_Recycle, deleteTime = playerSave:getEMysqlNowDateTime()},
%%			moveItem(GoodsUID, ?Item_Location_Recycle, SrcBagType, #rec_item.itemUID, NewItem),
%%			%%为了重用moveItem，但由于moveItem是使用的keystore，不能保证删除的道具在列表的最后一个位置，
%%			%%所以需要把内存中刚才加的道具删除，重新加到列表的最后一个位置
%%			L = lists:keydelete(GoodsUID, #rec_item.itemUID, playerState:getPackage(?Item_Location_Recycle)),
%%			playerState:setPackage(?Item_Location_Recycle, [NewItem | L]),
			Price * PileNum;
		_ ->
			0
	end;
moveGoodsToRecycle(#recSaveEquip{itemUID = GoodsUID, pos = SrcBagType, isLocked = false} = Equip) ->
	Money = playerEquip:equipSalePrice(Equip),
	deleteGoodsByUID(SrcBagType, GoodsUID, #recPLogTSItem{
		target = ?PLogTS_System,
		source = ?PLogTS_PlayerSelf,
		changReason = ?ItemDeleteReasonRecycle,
		reasonParam = SrcBagType,
		gold = Money,
		goldtype = ?CoinTypeGold
	}),
%%	%%装备没有像普通道具一样的操作限制，都可以被丢弃
%%	deleteTailGoodsFromRecycle(),
%%	NewEquip = Equip#recSaveEquip{pos = ?Item_Location_Recycle, deleteTime = playerSave:getEMysqlNowDateTime()},
%%	moveItem(GoodsUID, ?Item_Location_Recycle, SrcBagType, #recSaveEquip.itemUID, NewEquip),
%%	%%为了重用moveItem，但由于moveItem是使用的keystore，不能保证删除的道具在列表的最后一个位置，
%%	%%所以需要把内存中刚才加的道具删除，重新加到列表的最后一个位置
%%	L = lists:keydelete(GoodsUID, #recSaveEquip.itemUID, playerState:getPackage(?Item_Location_Recycle)),
%%	playerState:setPackage(?Item_Location_Recycle, [NewEquip | L]),
	Money;
moveGoodsToRecycle(Item) ->
	?WARN_OUT("player:~ts move goods:~w to Recycle failed,maybe locked", [playerState:getName(), Item]),
	0.

%-spec deleteTailGoodsFromRecycle() -> ok.
%deleteTailGoodsFromRecycle() ->
%	case getBagIdleSlotNum(?Item_Location_Recycle) > 0 of
%		true ->
%			%%回收站还有空格子
%			skip;
%		_ ->
%			%%回收站没有空格子了，需要删除一个
%			GoodsList = playerState:getPackage(?Item_Location_Recycle),
%			[H | _T] = lists:reverse(GoodsList),
%			TS = #recPLogTSItem{
%				old = 0,
%				new = 0,
%				change = 0,
%				target = ?PLogTS_System,
%				source = ?PLogTS_PlayerSelf,
%				changReason = ?ItemDeleteReasonRecycle,
%				reasonParam = ?Item_Location_Recycle,
%				gold = 0,
%				goldtype = 0
%			},
%			deleteGoodsFromBag(?Item_Location_Recycle, GoodsList, H, TS)
%	end,
%	ok.

%%%从回收站回购道具
%-spec moveGoodsFromRecycle(GoodsUID) -> ok when GoodsUID :: uint().
%moveGoodsFromRecycle(GoodsUID) ->
%%	case getGoodsFromRecycleByUID(GoodsUID) of
%%		#rec_item{itemID = ItemID, pileNum = PileNum} = Item ->
%%			case getCfg:getCfgPStack(cfg_item, ItemID) of
%%				#itemCfg{price = Price, itemType = ?ItemTypeGem} ->
%%					%%宝石放入宝石背包
%%					moveGoodsFromRecycle(GoodsUID, Price * PileNum, Item#rec_item{pos = ?Item_Location_Gem_Bag}, #rec_item.itemUID, ?Item_Location_Gem_Bag);
%%				#itemCfg{price = Price} ->
%%					%%普通道具放入普通背包
%%					moveGoodsFromRecycle(GoodsUID, Price * PileNum, Item#rec_item{pos = ?Item_Location_Bag}, #rec_item.itemUID, ?Item_Location_Bag);
%%				_ ->
%%					?ERROR_OUT("player:[~p] [~ts] not found goods cfg in cfg_item by UID:~p ID:~p",
%%						[playerState:getRoleID(), playerState:getName(), GoodsUID, ItemID])
%%			end;
%%		#recSaveEquip{} = Equip ->
%%			Money = playerEquip:equipSalePrice(Equip),
%%			moveGoodsFromRecycle(GoodsUID, Money, Equip#recSaveEquip{pos = ?Item_Location_Equip_Bag}, #recSaveEquip.itemUID, ?Item_Location_Equip_Bag);
%%		_ ->
%%			?ERROR_OUT("player:[~p] [~ts] not found goods from recycle by UID:~p", [playerState:getRoleID(), playerState:getName(), GoodsUID])
%%	end,
%	ok.

%%从回收站移动到相应的背包
%%moveGoodsFromRecycle(GoodsUID, Money, Goods, UIDIndex, DstBagType) ->
%%	case getBagIdleSlotNum(DstBagType) > 0 of
%%		true ->
%%			case checkBuyMoneyFromRecycle(GoodsUID, Money) of
%%				true ->
%%					%%从回收站的内存中删除
%%					GoodsList = playerState:getPackage(?Item_Location_Recycle),
%%					NewGoodsList = lists:keydelete(GoodsUID, UIDIndex, GoodsList),
%%					playerState:setPackage(?Item_Location_Recycle, NewGoodsList),
%%
%%					NewGoods = case Goods of
%%						           #rec_item{} ->
%%							           Goods#rec_item{
%%								           deleteTime = {datetime, {{1970, 1, 1}, {0, 0, 0}}}
%%							           };
%%						           #recSaveEquip{} ->
%%							           Goods#recSaveEquip{deleteTime = {datetime, {{1970, 1, 1}, {0, 0, 0}}}}
%%					           end,
%%					%%添加到装备背包，并保存到数据库910
%%
%%					storeGoodsAndSave(DstBagType, NewGoods),
%%
%%					%%同步更新到客户端
%%					sendMoveGoodsNetMsg(GoodsUID, ?Item_Location_Recycle, DstBagType);
%%				_ ->
%%					%%统一发了错误消息 ，此处不再发送
%%					skip
%%			end;
%%		_ ->
%%			%%发送背包空间不足错误消息
%%			skip
%%	end,
%%	ok.
%
%checkBuyMoneyFromRecycle(GoodsUID, Money) ->
%	case Money =< 0 orelse playerMoney:useCoin(?CoinUseTypeGold, Money,
%		#recPLogTSMoney{reason = ?CoinUseBackToRecycle, param = GoodsUID, target = ?PLogTS_Item, source = ?PLogTS_PlayerSelf}) of
%		true ->
%			%% 扣除金钱成功
%			true;
%		false ->
%			%% 金钱不足
%			playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNoWealth),
%			false
%	end.

%%处理穿装备
-spec equipOn(GoodsUID) -> ok
	when GoodsUID :: uint().
equipOn(GoodsUID) when erlang:is_integer(GoodsUID), GoodsUID > 0 ->
	case checkExchangeEquipCD() of
		false ->
			Equip = getGoodsFromBagByUID(GoodsUID, ?Item_Location_Equip_Bag),
			case Equip of
				#recSaveEquip{itemID = EquipID} ->
					case getCfg:getCfgPStack(cfg_equipment, EquipID) of
						#equipmentCfg{} = EquipCfg ->
							equipOn(Equip, EquipCfg);
						_ ->
							skip
					end;
				_ ->
					?ERROR_OUT("EquipOn Can not find EquipUID:~p In EquipBag", [GoodsUID]),
					skip
			end;
		_ ->
			%%CD中,发送一错误消息给客户端
			skip
	end,
	ok.

checkEquipRace(0) ->
	true;
checkEquipRace(L) when is_list(L) ->
	Race = playerState:getRace(),
	Sex = playerState:getSex(),
	FunFind =
		fun(C) ->
			case C of
				{Race, Sex} ->
					true;
				_ ->
					false
			end
		end,
	lists:any(FunFind, L);
checkEquipRace(_) ->
	false.

equipOn(#recSaveEquip{itemUID = EquipUID} = Equip,
	#equipmentCfg{type = Type, class = Class, race = RaceLimit, equipLevel = Level, atkDelay = AtkDelay}) ->
	PlayerCareer = playerState:getCareer(),
	PlayerLevel = playerState:getLevel(),

	SameClass = (?Career2CareerMain(PlayerCareer) =:= ?Career2CareerMain(Class)),

	%%检查玩家职业和等级，是否满足条件
	case (Class =:= 0 orelse SameClass) andalso PlayerLevel >= Level andalso checkEquipRace(RaceLimit) of
		true ->
			%%原来有装备，需要把原来的装备卸载下来
			OldEquip = getOldEquipByType(Type),
			case OldEquip of
				#recSaveEquip{} ->
					%%将旧装备从身上删除
					Bag = playerState:getPackage(?Item_Location_BodyEquipBag),
					BodyBag = lists:keydelete(OldEquip#recSaveEquip.itemUID, #recSaveEquip.itemUID, Bag),
					playerState:setPackage(?Item_Location_BodyEquipBag, BodyBag),
					%%将旧装备添加到装备背包中,同步更新到数据库
					storeGoodsAndSave(?Item_Location_Equip_Bag, OldEquip#recSaveEquip{pos = ?Item_Location_Equip_Bag}),

					%%修改属性
					playerEquip:onEquipOff(OldEquip, false);
				_ ->
					skip
			end,
			%%如果是武器则需要设置武器对攻速的影响
			case Type of
				?EquipTypeWeapon ->
					playerState:setAttackIntervalTime(AtkDelay);
				_ ->
					skip
			end,
			%%装备穿上即绑定
			NewEquip = Equip#recSaveEquip{pos = ?Item_Location_BodyEquipBag},
			moveItem(EquipUID, ?Item_Location_BodyEquipBag, ?Item_Location_Equip_Bag, #recSaveEquip.itemUID, NewEquip),

			%% 这个必须放在新装备计算属性之前
			playerGem:onEquipChange(Type, OldEquip, NewEquip),
			playerEquip:onEquipOn(NewEquip, true),

			playerState:setLastExchangeEquip(time:getUTCNowMS()),
			ok;
		_ ->
			skip
	end.

%%处理卸装备
-spec equipOff(GoodsUID) -> ok
	when GoodsUID :: uint().
equipOff(GoodsUID) when erlang:is_integer(GoodsUID), GoodsUID > 0 ->
	case checkExchangeEquipCD() of
		false ->
			case getBagIdleSlotNum(?Item_Location_Equip_Bag) > 0 of
				true ->
					Equip = getGoodsFromBagByUID(GoodsUID, ?Item_Location_BodyEquipBag),
					case Equip of
						#recSaveEquip{} ->
							moveItem(GoodsUID, ?Item_Location_Equip_Bag, ?Item_Location_BodyEquipBag, #recSaveEquip.itemUID, Equip#recSaveEquip{pos = ?Item_Location_Equip_Bag}),
							playerGem:onEquipOff(Equip),
							playerEquip:onEquipOff(Equip, true);
						_ ->
							?ERROR_OUT("equipOff Cannot found EquipUID:~p from BodyEquipBag", [GoodsUID])
					end;
				false ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNoEmptyBag)
			end;
		_ ->
			%%CD中，发送错误消息给客户端
			skip
	end,
	ok.

gm_equipoff(Equip) ->
	case Equip of
		#recSaveEquip{itemUID = GoodsUID} ->
			moveItem(GoodsUID, ?Item_Location_Equip_Bag, ?Item_Location_BodyEquipBag, #recSaveEquip.itemUID, Equip#recSaveEquip{pos = ?Item_Location_Equip_Bag}),
			playerGem:onEquipOff(Equip),
			playerEquip:onEquipOff(Equip, true);
		_ ->
			?ERROR_OUT("gm_equipoff Cannot found Equip:~p from BodyEquipBag", [Equip])
	end,
	ok.


%%获取玩家身上有相同类型的装备
-spec getOldEquipByType(Type) -> #recSaveEquip{} | [] when Type :: uint().
getOldEquipByType(EquipType) ->
	Fun =
		fun(#recSaveEquip{itemID = EquipID} = Equip, AccIn) ->
			case getCfg:getCfgPStack(cfg_equipment, EquipID) of
				#equipmentCfg{type = EquipType} ->
					{break, Equip};
				_ ->
					AccIn
			end
		end,
	misc:mapAccList(playerState:getPackage(?Item_Location_BodyEquipBag), [], Fun).

%%检查是否处于换装CD中，如果是战斗状态换装，则会有1.5秒的CD时间，非战斗状态有500毫秒的CD时间
%%CD中返回true，否则返回false
-spec checkExchangeEquipCD() -> boolean().
checkExchangeEquipCD() ->
	Time = playerState:getLastExchangeEquip(),
	Now = time:getUTCNowMS(),
	case playerState:isPlayerBattleStatus() of
		true ->
			Now - Time < 1500;
		_ ->
			Now - Time < 500
	end.

%%道具背包整理
-spec sortItemBag(BagType) -> ok when
	BagType :: bagType().
sortItemBag(BagType) ->
	Bag = playerState:getPackage(BagType),
	Bag1 = arrangeItem(Bag, BagType),
	%%将整理后的道具与整理前的道具作比对，决定是否要发送到数据库进行保存
	Fun = fun(#rec_item{itemUID = UID, pileNum = Number1} = Item) ->
		case lists:keyfind(UID, #rec_item.itemUID, Bag) of
			#rec_item{pileNum = Number2} when Number1 =/= Number2 ->
				playerSave:saveGoods(Item);
			_ ->
				skip
		end
		  end,
	lists:foreach(Fun, Bag1),
	playerState:setPackage(BagType, Bag1),

	logSort(BagType, Bag, Bag1),

	%%发送整理后的数据到客户端
	sendInitItemNetMsg(BagType),
	ok.

logSort(BagType, BeforeSortBag, AfterSortBag) when BagType =:= ?Item_Location_Bag orelse BagType =:= ?Item_Location_Storage ->
	Fun = fun(#rec_item{itemUID = UID, pileNum = Number1}, AccIn) ->
		io_lib:format("{UID:~p N:~p} ", [UID, Number1]) ++ AccIn
		  end,
	Before = lists:foldl(Fun, [], BeforeSortBag),
	After = lists:foldl(Fun, [], AfterSortBag),
	?LOG_OUT("player:~p Before sort:~ts ~nAfter Sort:~ts", [playerState:getRoleID(), Before, After]),
	ok;
logSort(_BagType, _BeforeSortBag, _AfterSortBag) ->
	ok.

sortEquipBag(BagType) ->
	%%装备整理规则
	Bag = playerState:getPackage(BagType),
	NewBag = lists:keysort(#recSaveEquip.itemID, Bag),
	playerState:setPackage(BagType, NewBag),

	%%发送整理后的数据到客户端
	sendInitEquipNetMsg(BagType),
	ok.

-spec sendInitItemNetMsg(BagType) -> ok
	when BagType :: bagType().
sendInitItemNetMsg(BagType) ->
	FunInter = fun(#rec_item{pileNum = PileNum} = Item, ItemList) when erlang:is_integer(PileNum), PileNum > 0 ->
		[makeItemNetMessage(Item) | ItemList]
			   end,
	ItemList = playerState:getPackage(BagType),
	GoodsList = lists:foldl(FunInter, [], ItemList),
	case GoodsList of
		[] ->
			skip;
		_ ->
			playerMsg:sendNetMsg(#pk_GS2U_InitItem{type = BagType, items = GoodsList})
	end,
	ok.

%%发送背包装备初始化消息
-spec sendInitEquipNetMsg(BagType) -> ok
	when BagType :: bagType().
sendInitEquipNetMsg(BagType) ->
	FunInter = fun(#recSaveEquip{} = Goods, GoodsList) ->
		[goods:makeEquipNetMessage(Goods) | GoodsList]
			   end,
	GoodsList = lists:foldl(FunInter, [], playerState:getPackage(BagType)),
	playerMsg:sendNetMsg(#pk_GS2U_InitEquip{type = BagType, items = GoodsList}),
	ok.

%%整理道具
-spec arrangeItem(ItemList, BagType) -> List when
	ItemList :: itemList(), BagType :: bagType(), List :: itemList().
arrangeItem(ItemList, BagType) ->
	arrangeItem(ItemList, BagType, []).

%%整理道具
%%基本思路：
%%1.遍历所有道具，从第一个开始处理，看第二个到最后一个道具是否可以堆叠到第一个道具上
%%2.后面的道具堆叠到目标道具，有以下几种情况：
%%	a.如果目标道具还没有堆叠到最大上限，但源道具已经完全被堆叠到目标道具上了，源道具被删除，则继续尝试把后面的道具堆叠到目标道具，直到遍历完所有后面的道具或者目标道具堆叠满
%%	b.如果目标道具还没有堆叠到最大上限，源道具也没被堆叠到目标道具上，源道具还存在（不能被堆叠），则继续尝试把后面的道具堆叠到目标道具，直到遍历完所有后面的道具或者目标道具堆叠满
%%  c.如果目标道具已经达到堆叠最大上限，源道具已经完全被堆叠到目标道具上了，源道具被删除（完全被堆叠），则此轮遍历结束，把后面的道具作为目标道具进行堆叠
%%	d.如果目标道具已经达到堆叠最大上限，源道具也没完全被堆叠到目标道具上，源道具还存在（可堆叠，但没堆叠完），则此轮遍历结束，把后面的道具作为目标道具进行堆叠
%%3.每次遍历，处理过的道具都放在一个列表中
-spec arrangeItem(ItemList, BagType, List) -> List when
	ItemList :: itemList(), BagType :: uint(), List :: itemList().
arrangeItem([], _, AccIn) ->
	lists:reverse(AccIn);
arrangeItem([DstItem | SrcItemList], BagType, AccIn) ->
	case arrangeItem(SrcItemList, DstItem, BagType, []) of
		{Tail, NewDstItem, Head} ->
			%%目标道具已经被堆叠满了
			%%为了保证下一轮的遍历与之前的遍历每一个元素的顺序一致，以保存每一个元素都遍历到，头需要反转
			NewList = lists:reverse(Head) ++ Tail,
			arrangeItem(NewList, BagType, [NewDstItem | AccIn]);
		{NewDstItem, ItemList} ->
			%%目标道具没堆叠满
			%%为了保证下一轮的遍历与之前的遍历每一个元素的顺序一致，以保存每一个元素都遍历到，需要反转
			L = lists:reverse(ItemList),
			arrangeItem(L, BagType, [NewDstItem | AccIn])
	end.

%%整理道具
-spec arrangeItem({FrontList, EndList}, #rec_item{}, BagType, ItemList) -> {Item, ItemList} | {ItemList, Item, ItemList} when
	FrontList :: itemList(), EndList :: itemList(), BagType :: uint(), Item :: #rec_item{}, ItemList :: itemList().
arrangeItem([], #rec_item{} = DstItem, _BagType, ItemList) ->
	{DstItem, ItemList};
arrangeItem([SrcItem | T], #rec_item{} = DstItem, BagType, ItemList) ->
	case pileItem(DstItem, SrcItem) of
		{false, NewDstItem, deleted} ->
			NewPileNum = NewDstItem#rec_item.pileNum,
			OldPileNum = SrcItem#rec_item.pileNum,
			%%目标道具还没有堆叠到最大上限，但源道具已经完全被堆叠到目标道具上了，源道具被删除（完全被堆叠）
			PlogDel = #recPLogTSItem{
				old = OldPileNum,
				new = 0,
				change = OldPileNum,
				target = ?PLogTS_Item,
				source = ?PLogTS_PlayerSelf,
				gold = 0,
				goldtype = 0,
				changReason = ?ItemDeleteReasonSort,
				reasonParam = NewDstItem#rec_item.itemUID
			},
			deleteGoodsByUID(BagType, SrcItem#rec_item.itemUID, PlogDel),

			%% log道具数据增加
			Plog = #recPLogTSItem{
				old = NewPileNum - OldPileNum,
				new = NewPileNum,
				change = OldPileNum,
				target = ?PLogTS_PlayerSelf,
				source = ?PLogTS_PlayerSelf,
				gold = 0,
				goldtype = 0,
				changReason = ?ItemDeleteReasonSort,
				reasonParam = SrcItem#rec_item.itemUID
			},
			Logrec = #recLogGoodsChange{
				itemUID = NewDstItem#rec_item.itemUID,
				itemID = NewDstItem#rec_item.itemID
			},
			dbLog:sendSaveLogChangeGoods(Logrec, Plog),

			arrangeItem(T, NewDstItem, BagType, ItemList);
		{false, NewDstItem, NewH} ->
			%%目标道具还没有堆叠到最大上限，源道具也没被堆叠到目标道具上，源道具还存在（不能被堆叠）
			arrangeItem(T, NewDstItem, BagType, [NewH | ItemList]);
		{true, NewDstItem, deleted} ->
			NewPileNum2 = NewDstItem#rec_item.pileNum,
			OldPileNum2 = SrcItem#rec_item.pileNum,
			%%目标道具已经达到堆叠最大上限，源道具已经完全被堆叠到目标道具上了，源道具被删除（完全被堆叠）
			PlogDel2 = #recPLogTSItem{
				old = OldPileNum2,
				new = 0,
				change = OldPileNum2,
				target = ?PLogTS_Item,
				source = ?PLogTS_PlayerSelf,
				gold = 0,
				goldtype = 0,
				changReason = ?ItemDeleteReasonSort,
				reasonParam = NewDstItem#rec_item.itemUID
			},
			deleteGoodsByUID(BagType, SrcItem#rec_item.itemUID, PlogDel2),

			%% log道具数据增加
			Plog2 = #recPLogTSItem{
				old = NewPileNum2 - OldPileNum2,
				new = NewPileNum2,
				change = OldPileNum2,
				target = ?PLogTS_PlayerSelf,
				source = ?PLogTS_PlayerSelf,
				gold = 0,
				goldtype = 0,
				changReason = ?ItemDeleteReasonSort,
				reasonParam = SrcItem#rec_item.itemUID
			},
			Logrec2 = #recLogGoodsChange{
				itemUID = NewDstItem#rec_item.itemUID,
				itemID = NewDstItem#rec_item.itemID
			},
			dbLog:sendSaveLogChangeGoods(Logrec2, Plog2),

			{T, NewDstItem, ItemList};
		{true, NewDstItem, NewH} ->
			%%目标道具已经达到堆叠最大上限，源道具也没完全被堆叠到目标道具上，源道具还存在（可堆叠，但没堆叠完）
			{T, NewDstItem, [NewH | ItemList]}
	end.

%%相同ID且相同绑定属性可以被堆叠,返回值：{是否达到最大堆叠上限，目标道具，源道具｜delete}
-spec pileItem(DstItem, SrcItem) -> {false, DstItem, deleted} | {false, DstItem, SrcItem}
| {true, DstItem, SrcItem} | {true, DstItem, deleted} when DstItem :: #rec_item{}, SrcItem :: #rec_item{}.
pileItem(#rec_item{itemID = ID, isBind = IsBind, pileNum = PileNum1} = DstItem,
	#rec_item{itemID = ID, isBind = IsBind, pileNum = PileNum2} = SrcItem) ->
	#itemCfg{maxAmount = MaxPileNum} = getCfg:getCfgPStack(cfg_item, ID),
	CanPileNum = MaxPileNum - PileNum1,
	if
		CanPileNum > PileNum2 ->
			%%目标道具还没有堆叠到最大上限，但源道具已经完全被堆叠到目标道具上了，源道具被删除
			{false, DstItem#rec_item{pileNum = PileNum1 + PileNum2}, deleted};
		CanPileNum < PileNum2 ->
			%%目标道具达到堆叠上限，但源道具还存在
			{true, DstItem#rec_item{pileNum = MaxPileNum}, SrcItem#rec_item{pileNum = PileNum2 - CanPileNum}};
		true ->
			%%目标道具达到堆叠上限，源道具被删除
			{true, DstItem#rec_item{pileNum = MaxPileNum}, deleted}
	end;
%%不能被堆叠
pileItem(#rec_item{} = DstItem, #rec_item{} = SrcItem) ->
	{false, DstItem, SrcItem}.

-spec makeItemInstance(GoodsID, GoodsNum, IsBind, OwnerID, MaxPileNum, #recPLogTSItem{}) -> [#rec_item{}, ...] when
	GoodsID :: uint(), GoodsNum :: uint(), IsBind :: boolean(), OwnerID :: uint(), MaxPileNum :: uint().
makeItemInstance(GoodsID, GoodsNum, IsBind, OwnerID, MaxPileNum, #recPLogTSItem{} = TS) ->
	List = case GoodsNum >= MaxPileNum of
			   true ->
				   L = lists:seq(1, GoodsNum div MaxPileNum),
				   Fun = fun(_, AccIn) ->
					   [createAnItemInstance(GoodsID, MaxPileNum, IsBind, OwnerID, 0, false, TS) | AccIn]
						 end,
				   lists:foldl(Fun, [], L);
			   _ ->
				   []
		   end,
	RemainNum = GoodsNum rem MaxPileNum,
	case RemainNum > 0 of
		true ->
			[createAnItemInstance(GoodsID, RemainNum, IsBind, OwnerID, 0, false, TS) | List];
		_ ->
			List
	end.

-spec makeEquipInstance(GoodsID, GoodsNum, IsBind, Quality, OwnerID, #recPLogTSItem{}) -> [UID, ...]
	when GoodsID :: uint(), GoodsNum :: uint(), IsBind :: boolean(), Quality :: equipQuality(), OwnerID :: uint(), UID :: uint().
makeEquipInstance(GoodsID, GoodsNum, IsBind, Quality, OwnerID, #recPLogTSItem{} = TS) when erlang:is_integer(OwnerID), OwnerID > 0 ->
	Fun = fun(_, AccIn) ->
		Equip = playerEquip:makeEquip(GoodsID, Quality, ?Item_Location_Equip_Bag, IsBind),
		saveNewGoodsInfo(Equip#recSaveEquip{roleID = OwnerID}),

		#recSaveEquip{itemUID = EquipUID} = Equip,

		%% log物品创建
		dbLog:sendSaveLogCreateGoods(
			OwnerID,
			EquipUID,
			GoodsID,
			1,
			IsBind,
			?Item_Location_Equip_Bag,
			0,
			0,
			TS#recPLogTSItem{old = 0, new = 1, change = 1}
		),

		[EquipUID | AccIn]
		  end,
	lists:foldl(Fun, [], lists:seq(1, GoodsNum)).

-spec createAnItemInstance(GoodsID, GoodsNum, IsBind, OwnerID, BagType, IsSetupExpiredTime :: boolean(), #recPLogTSItem{}) -> #rec_item{}
	when GoodsID :: uint(), GoodsNum :: uint(), IsBind :: boolean(), OwnerID :: uint(), BagType :: uint().
createAnItemInstance(GoodsID, GoodsNum, IsBind, OwnerID, BagType, IsSetupExpiredTime, #recPLogTSItem{} = TS) ->
	UID = uidMgr:makeItemUID(),
	?LOG_OUT("player:~p make itemID:~p UID:~p Num:~p BagType:~p IsBind:~p", [playerState:getRoleID(), GoodsID, UID, GoodsNum, BagType, IsBind]),
	Goods = #rec_item{
		itemUID = UID,                                %%道具UID bigint(20) unsigned
		roleID = OwnerID,                            %%角色ID bigint(20) unsigned
		itemID = GoodsID,                            %%道具ID smallint(6) unsigned
		pos = BagType,                                %%背包类型 smallint(6) unsigned
		pileNum = GoodsNum,                            %%堆叠数量 smallint(6) unsigned
		recastCount = 0,                            %%重铸次数 smallint(6) unsigned
		isBind = IsBind,                            %%是否绑定 tinyint(1) unsigned
		isLocked = false,                            %%玩家是否自己锁定 tinyint(1) unsigned
		quality = 0,                                %%品质 tinyint(4) unsigned
		deleteTime = 0,                                %%删除时间 datetime
		createTime = time:getSyncUTCTimeFromDBS(),    %%创建时间 int(10) unsigned
		expiredTime = 0                                %%过期时间，0为无过期时间 int(10) unsigned
	},

	NewGoods = case IsSetupExpiredTime of
				   true ->
					   setupGoodsExpireTime(Goods);
				   _ ->
					   Goods
			   end,
	saveNewGoodsInfo(NewGoods),

	%% log物品创建
	dbLog:sendSaveLogCreateGoods(
		OwnerID,
		UID,
		GoodsID,
		GoodsNum,
		IsBind,
		BagType,
		0,
		0,
		TS#recPLogTSItem{old = 0, new = GoodsNum, change = GoodsNum}
	),
	NewGoods.

-spec splitItem1(BagType, #rec_item{}, Num, IsStoreInBag, #recPLogTSItem{}) -> #rec_item{} | failed | cannotSplit when
	BagType :: bagType(), Num :: uint(), IsStoreInBag :: boolean().
splitItem1(BagType, #rec_item{itemUID = ItemUID, pileNum = PileNum, itemID = GoodsID, isBind = IsBind} = Item, Num, IsStoreInBag, #recPLogTSItem{} = TS) ->
	case PileNum > Num of
		true ->
			%%这里把需要拆分出指定数量的道具保留为原来的UID，这样才能使用addGoods接口，因为此接口可能会把拆分的道具堆叠到已有的道具中
			#itemCfg{maxAmount = MaxPileNum, operate = OperateLimit} = getCfg:getCfgPStack(cfg_item, GoodsID),
			case goods:canBeSplit(OperateLimit) of
				true ->
					case IsStoreInBag of
						true ->
							%%拆分后放的背包
							Ret = addItem(BagType, GoodsID, PileNum - Num, MaxPileNum, false, false, ItemUID, TS),
							case Ret of
								[#rec_item{itemUID = NewUID} | _] ->
									%%成功拆分
									NewItem = Item#rec_item{pileNum = Num},
									splitItemSaveAndLog(NewItem, BagType, PileNum, TS#recPLogTSItem{old = 0, new = Num, change = Num, reasonParam = NewUID}),
									NewItem;
								_ ->
									%%没有拆分成功
									failed
							end;
						_ ->
							%%拆分后不放入背包的，需要生成一个道具实例，而且拆分出来的一定只有一个道具实例
							[#rec_item{} = ItemInst] = makeItemInstance(GoodsID, Num, false, Item#rec_item.roleID, MaxPileNum, TS),
							%%成功拆分,保存剩余的数量
							splitItemSaveAndLog(Item#rec_item{pileNum = PileNum - Num}, BagType, PileNum, TS#recPLogTSItem{old = PileNum, new = PileNum - Num, change = Num, reasonParam = ItemInst#rec_item.itemUID}),
							%%返回拆分出来的道具
							ItemInst
					end;
				_ ->
					cannotSplit
			end;
		false ->
			failed
	end;
splitItem1(_, _, _, _, _) ->
	failed.

splitItemSaveAndLog(#rec_item{itemID = GoodsID, itemUID = ItemUID, pileNum = PileNum} = Item, BagType, OldNum,
	#recPLogTSItem{} = TS) when OldNum > PileNum ->
	%%log数量改变
	Logrec = #recLogGoodsChange{
		itemUID = ItemUID,
		itemID = GoodsID
	},
	dbLog:sendSaveLogChangeGoods(Logrec, TS),
	%%更新保存道具
	storeGoodsAndSave(BagType, Item),
	%% 更新客户端的显示
	sendUpdateItem(BagType, Item),
	ok.

sendUpdateItem(BagType, #rec_item{} = Item) ->
	playerMsg:sendNetMsg(#pk_GS2U_UpdateNormalItem{type = BagType, items = [makeItemNetMessage(Item)]}),
	ok.

-spec useItemByUID2(ItemUID, Num, BagType, #recPLogTSItem{}) -> boolean() when
	ItemUID :: uint(), Num :: uint(), BagType :: bagType().
useItemByUID2(ItemUID, Num, BagType, #recPLogTSItem{} = TS) ->
	case getGoodsFromBagByUID(ItemUID, BagType) of
		#rec_item{pileNum = PNum} = Item ->
			%%如果删除后的剩余数量大于等于0则表示足以删除，删除成功
			useItem(Item, Num, false, TS#recPLogTSItem{new = PNum, change = -(Num - PNum)}) >= 0;
		_ ->
			false
	end.

%%使用指定道具Num个，返回该道具使用后的剩余数量,IsForceUse决定当该道具数量不足删除数量时，要不要把整个道具删除
-spec useItem(#rec_item{}, Num, IsForceUse, #recPLogTSItem{}) -> ReaminNum :: int() when
	Num :: uint(), IsForceUse :: boolean().
useItem(#rec_item{itemUID = ItemUID, itemID = ItemID, pileNum = PileNum, pos = Pos} = Item, Num, IsForceUse,
	#recPLogTSItem{} = TS) when erlang:is_boolean(IsForceUse) ->
	BagType = getBagType(Pos),
	RemainNum = PileNum - Num,
	Logrec = #recLogGoodsChange{itemUID = ItemUID, itemID = ItemID},
	NTS = TS#recPLogTSItem{old = PileNum, new = RemainNum, change = Num},
	if
		PileNum > Num ->
			NewItem = Item#rec_item{pileNum = RemainNum},
			storeGoodsAndSave(BagType, NewItem),

			%%log数量改变
			dbLog:sendSaveLogChangeGoods(Logrec, NTS),

			%%通知客户端更新背包
			sendUpdateItem(BagType, NewItem);
		PileNum =:= Num ->
			%%如果当前数量与要使用的数量一样，则删除整个道具
			deleteGoodsByUID(BagType, ItemUID, NTS);
		true ->
			%%当该道具数量不足删除数量时，要不要把整个道具删除
			case IsForceUse of
				true ->
					deleteGoodsByUID(BagType, ItemUID, NTS);
				_ ->
					skip
			end
	end,
	RemainNum.

-spec changeMyGoodsOwner(GoodsUID, GoodsID, ToOwnerID, #recPLogTSItem{}) -> ok when
	GoodsUID :: uint(), GoodsID :: uint(), ToOwnerID :: uint().
changeMyGoodsOwner(GoodsUID, GoodsID, ToOwnerID, #recPLogTSItem{} = TS) ->
	RoleID = playerState:getRoleID(),
	%%物品当前归属自己，需要删除，但只能从内存中删除
	{IsEquip, Type} = case getGoodsByUID(GoodsUID, [?Item_Location_Bag, ?Item_Location_Equip_Bag, ?Item_Location_Gem_Bag, ?Item_Location_Pieces_Bag]) of
						  #rec_item{pos = BagType} ->
							  ItemList = playerState:getPackage(BagType),
							  NIL = lists:keydelete(GoodsUID, #rec_item.itemUID, ItemList),
							  playerState:setPackage(BagType, NIL),
							  {false, BagType};
						  #recSaveEquip{pos = BagType} ->
							  EquipList = playerState:getPackage(BagType),
							  EIL = lists:keydelete(GoodsUID, #recSaveEquip.itemUID, EquipList),
							  playerState:setPackage(BagType, EIL),
							  {true, BagType}
					  end,
	%%通知客户端删除
	sendDeleteGoodsNetMsg(Type, [GoodsUID]),

	%%通知数据库修改拥有者
	changeGoodsOwnerAndLog(RoleID, GoodsUID, GoodsID, ToOwnerID, IsEquip, TS),
	ok.

-spec changeGoodsOwnerAndLog(CurOwnerID, GoodsUID, GoodsID, ToOwnerID, IsEquip, #recPLogTSItem{}) -> ok when
	CurOwnerID :: uint(), GoodsUID :: uint(), GoodsID :: uint(), ToOwnerID :: uint(), IsEquip :: boolean().
changeGoodsOwnerAndLog(CurOwnerID, GoodsUID, GoodsID, ToOwnerID, _IsEquip, #recPLogTSItem{} = TS) ->
	Logrec = #recLogGoodsChange{
		itemUID = GoodsUID,
		itemID = GoodsID
	},
	dbLog:sendSaveLogChangeGoods(Logrec, TS),
	playerSave:changeGoodsOwner(GoodsUID, CurOwnerID, ToOwnerID),
	ok.

-spec getBagType(Pos) -> uint8() when Pos :: uint16().
getBagType(Pos) ->
	Pos band 16#FF.

-spec getEmbedGemSlot(Pos) -> uint8() when Pos :: uint16().
getEmbedGemSlot(Pos) ->
	(Pos bsr 8) band 16#FF.

-spec makeEmbedGemPos(Slot) -> uint16() when Slot :: uint8().
makeEmbedGemPos(Slot) ->
	(Slot bsl 8) bor ?Item_Location_GemEmbedBag.

%%==========================================================================
%%宝石背包
%%==========================================================================

-spec gemEmbedOn(List) -> ok when List :: list().
gemEmbedOn([]) ->
	playerForce:calcPlayerForce(?PlayerGemForce, true);
gemEmbedOn([#pk_GemEmbedInfo{} = H | T]) ->
%%	gemEmbedOn1(H),
	gemEmbedOn(T).
%%
%%gemEmbedOn1(#pk_GemEmbedInfo{gem = GemUID, slot = Slot}) when erlang:is_integer(Slot), Slot > 0, Slot =< ?GemEmbedDefaultOpenSlotNum ->
%%	case getGoodsFromBagByUID(GemUID, ?Item_Location_Gem_Bag) of
%%		#rec_item{itemUID = GemUID, itemID = GemID, pos = Pos, pileNum = PileNum} = GemItem ->
%%			CurSlot = getEmbedGemSlot(Pos),
%%			case CurSlot > 0 of
%%				false -> %%还没有被镶嵌
%%					%%检查客户端传过来的位置是否正确,以及位置上是否存在宝石
%%					case isValidSlot(GemID, Slot) andalso isExistEmbedGem(Slot) =:= false of
%%						true ->
%%							case PileNum > 1 of
%%								true ->
%%									%%如果原来的宝石有多个堆叠数量，需要拆分一个出来，再镶嵌
%%									PLogSplit = #recPLogTSItem{
%%										old = PileNum,
%%										new = PileNum - 1,
%%										change = 1,
%%										target = ?PLogTS_PlayerSelf,
%%										source = ?PLogTS_PlayerSelf,
%%										gold = 0,
%%										goldtype = 0,
%%										changReason = ?ItemSourceSplit,
%%										reasonParam = Slot
%%									},
%%									case splitItem1(?Item_Location_Gem_Bag, GemItem, 1, false, PLogSplit) of
%%										#rec_item{itemUID = NewGemUID, pileNum = PNum} = SplittedItem ->
%%											%%宝石镶嵌成就统计
%%											statEmbedGemLevel(GemID),
%%											playerTask:updateTask(?TaskSubType_System, ?TaskSubType_System_Sub_Gem),
%%											%%修改宝石镶嵌位置
%%											Item = SplittedItem#rec_item{pos = makeEmbedGemPos(Slot), isBind = false},
%%											PLog = #recPLogTSItem{
%%												old = 0,
%%												new = PNum,
%%												change = PNum,
%%												target = ?PLogTS_PlayerSelf,
%%												source = ?PLogTS_GemEmbed,
%%												gold = 0,
%%												goldtype = 0,
%%												changReason = ?ItemDeleteReasonGemOn,
%%												reasonParam = Slot
%%											},
%%											addItemInstance(?Item_Location_GemEmbedBag, Item, PLog),
%%											NewGemUID;
%%										_ ->
%%											?ERROR_OUT("SplitItem UID[~p] failed in gemEmbedOn", [GemUID]),
%%											skip
%%									end;
%%								_ ->
%%									%%宝石镶嵌成就统计
%%									statEmbedGemLevel(GemID),
%%									playerTask:updateTask(?TaskSubType_System, ?TaskSubType_System_Sub_Gem),
%%									%%如果原来的宝石只有一个，则直接移动到镶嵌位置
%%									Item = GemItem#rec_item{pos = makeEmbedGemPos(Slot), isBind = false},
%%									moveItem(GemUID, ?Item_Location_GemEmbedBag, ?Item_Location_Gem_Bag, #rec_item.itemUID, Item)
%%							end;
%%						_ ->
%%							?ERROR_OUT("InvalidSlot[~p] of GemID:~p or ExistGem In Slot[~p]", [Slot, GemID, Slot]),
%%							skip
%%					end;
%%				_ ->
%%					%%已经被镶嵌了
%%					?ERROR_OUT("GemID:~p already embed In Slot[~p]", [Slot, GemID, Slot]),
%%					skip
%%			end;
%%		_ ->
%%			%%没有找到此道具啊
%%			?ERROR_OUT("gemEmbedOn Cannot found GemUID:~p", [GemUID]),
%%			skip
%%	end,
%%	ok.

%% 宝石卸载
-spec gemEmbedOff(list() | integer()) -> boolean().
gemEmbedOff(GemUIDList) when erlang:is_list(GemUIDList) ->
	Fun = fun(GemUID) ->
		gemEmbedOff(GemUID)
		  end,
	case lists:filter(Fun, GemUIDList) of
		[] ->
			false;
		SuccessUIDList ->
			%%计算战斗力
			playerForce:calcPlayerForce(?PlayerGemForce, true),
			%%通知客户端更新镶嵌背包界面
			playerMsg:sendNetMsg(#pk_GS2U_GemEmbedDelete{gemUIDs = SuccessUIDList}),
			true
	end;
gemEmbedOff(GemUID) when erlang:is_integer(GemUID) ->
	Bag = playerState:getPackage(?Item_Location_GemEmbedBag),
	case lists:keyfind(GemUID, #rec_item.itemUID, Bag) of
		#rec_item{itemID = ItemID, pileNum = PileNum, pos = Pos} = Item ->
			Slot = getEmbedGemSlot(Pos),
			#itemCfg{maxAmount = MaxPileNum} = getCfg:getCfgPStack(cfg_item, ItemID),
			Plog = #recPLogTSItem{
				old = PileNum,
				new = PileNum,
				change = 0,
				target = ?PLogTS_GemEmbed,
				source = ?PLogTS_PlayerSelf,
				gold = 0,
				goldtype = 0,
				changReason = ?ItemSourceGemOff,
				reasonParam = GemUID
			},
			case addItem(?Item_Location_Gem_Bag, ItemID, PileNum, MaxPileNum, false, false, 0, Plog) of
				[] ->
					%%没有增加成功
					playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNoEmptyBag),
					false;
				_ ->
					%%增加成功，将原来的道具删除
					NewBag = lists:keydelete(GemUID, #rec_item.itemUID, Bag),
					playerState:setPackage(?Item_Location_GemEmbedBag, NewBag),

					case playerPackage:getGoodsByUID(GemUID, ?Item_Location_Gem_Bag) of
						#rec_item{} ->
							skip;
						_ ->
							%%原来的道具已经被堆叠了，从数据库中的删除
							deleteGoodsFromDB(Item)
					end,

					%%其实下面两条更新消息可以只使用GS2U_GemEmbedDelete的，
					%%但客户端的背包与镶嵌界面是分开处理的，为了与其它宝石操作一致，而分开发的消息
					%%需要通知客户端删除镶嵌背包中的道具
					sendDeleteGoodsNetMsg(?Item_Location_GemEmbedBag, [GemUID]),
					%%记录删除日志
					Logrec = #recLogGoodsChange{
						itemUID = GemUID,
						itemID = ItemID
					},
					dbLog:sendSaveLogChangeGoods(Logrec, Plog),
					%%宝石卸载带来的属性改变
					gemEmbedOffChangeProp(ItemID, Slot),
					true
			end;
		_ ->
			%%没有找到此道具啊
			?ERROR_OUT("gemEmbedOff GemUID:~p,but not found", [GemUID]),
			false
	end.
%%,


getPackageGemsUids(ItemID, BindCount, UnBindCount) ->
	%% 获取非锁定宝石及其数量
	Bag = playerState:getPackage(?Item_Location_Gem_Bag),
	getPackageGemsUids1(Bag, ItemID, BindCount, UnBindCount, {[], []}).

getPackageGemsUids1([#rec_item{itemID = ItemID, pileNum = PileNum,
	itemUID = UID, isLocked = false, isBind = false} | T], ItemID, BindCount, UnBindCount, {BindItemList, UnBindItemList}) when UnBindCount > length(UnBindItemList) ->
	case (UnBindCount) > (PileNum + length(UnBindItemList)) of
		true ->
			NeedItemNumber = PileNum;
		false ->
			NeedItemNumber = UnBindCount - length(UnBindItemList)
	end,
	NewUnBindItemList = lists:duplicate(NeedItemNumber, UID) ++ UnBindItemList,
	getPackageGemsUids1(T, ItemID, BindCount, UnBindCount, {BindItemList, NewUnBindItemList});
getPackageGemsUids1([#rec_item{itemID = ItemID, pileNum = PileNum,
	itemUID = UID, isLocked = false, isBind = true} | T], ItemID, BindCount, UnBindCount, {BindItemList, UnBindItemList}) when BindCount > length(BindItemList) ->
	case (BindCount) > (PileNum + length(BindItemList)) of
		true ->
			NeedItemNumber = PileNum;
		false ->
			NeedItemNumber = BindCount - length(BindItemList)
	end,
	NewBindItemList = lists:duplicate(NeedItemNumber, UID) ++ BindItemList,
	getPackageGemsUids1(T, ItemID, BindCount, UnBindCount, {NewBindItemList, UnBindItemList});
getPackageGemsUids1(_, _ItemID, BindCount, UnBindCount, {BindItemList, UnBindItemList}) when (BindCount =< length(BindItemList)) and (UnBindCount =< length(UnBindItemList)) ->
	{ok, {BindItemList, UnBindItemList}};
getPackageGemsUids1([_ | T], ItemID, BindCount, UnBindCount, {BindItemList, UnBindItemList}) ->
	getPackageGemsUids1(T, ItemID, BindCount, UnBindCount, {BindItemList, UnBindItemList});
getPackageGemsUids1([], _ItemID, _BindCount, _UnBindCount, {BindItemList, UnBindItemList}) ->
	{fail, {BindItemList, UnBindItemList}}.
%% 宝石单次合成
-spec gemCompositionOnce(ItemID :: uint(), BindCount :: uint(), UnBindCount :: uint()) -> ok.
gemCompositionOnce(ItemID, BindCount, UnBindCount) ->
	if
		((BindCount + UnBindCount) =:= ?MaxGemMixNum) ->
			%%优先使用绑定宝石
			case getPackageGemsUids(ItemID, BindCount, UnBindCount) of
				{ok, {BindUIDList, UnBindUIDList}} ->
					UIDList = BindUIDList ++ UnBindUIDList,
					gemMix(UIDList),
					playerSevenDays:onMissionEvent(?SevenDayMission_Event_6, 1, 0),
					ok;
				ErrorInfo ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BagSortGemUpgradeMakeFailed),
					%% 数量不够
					?ERROR_OUT("gemComposition roleID=:~p,ItemID=~p,BindCount=~p,UnBindCount=~p,ErrorInfo=~p", [playerState:getRoleID(), ItemID, BindCount, UnBindCount, ErrorInfo])
			end;
		true ->
			?ERROR_OUT("gemCompositionOnce error gem number is error number=~p,", [(BindCount + UnBindCount)]),
			skip
	end,
	ok.

-spec gemMix(GemUIDList) -> boolean() when GemUIDList :: [uint(), ...].
gemMix(GemUIDList) ->
	GemNum = erlang:length(GemUIDList),
	%% 必须是四个才能合成
	case GemNum =:= ?MaxGemMixNum of
		true ->
			case getGemMixItem(GemUIDList) of
				false ->
					false;
				List ->
					mixGem(List)
			end;
		_ ->
			%%超过最大可以合成的宝石数量
			false
	end.


calcGemCount(GemUIDList) ->
	calcGemCount(GemUIDList, []).

calcGemCount([], AccIn) ->
	AccIn;
calcGemCount([UID | T], AccInList) ->
	L = case lists:keyfind(UID, 1, AccInList) of
			{UID, N} ->
				lists:keystore(UID, 1, AccInList, {UID, N + 1});
			_ ->
				[{UID, 1} | AccInList]
		end,
	calcGemCount(T, L).

getGemMixItem(GemUIDList) ->
	List = calcGemCount(GemUIDList),
	Fun = fun({UID, N}, AccIn) ->
		case playerPackage:getGoodsByUID(UID, ?Item_Location_Gem_Bag) of
			#rec_item{itemID = ItemID, itemUID = UID, pileNum = PileNum} = GemItem ->
				%%检测指定UID的数量是否满足需要
				case PileNum >= N of
					true ->
						case AccIn of
							[] ->
								[GemItem#rec_item{pileNum = N} | AccIn];
							[#rec_item{itemID = GemID} | _] ->
								%%必须要ID相同且等级相同
								case GemID =:= ItemID of
									true ->
										[GemItem#rec_item{pileNum = N} | AccIn];
									_ ->
										{break, false}
								end
						end;
					_ ->
						%%客户端发过来的指定UID的数量不足，错误
						{break, false}
				end;
			_ ->
				%%客户端发过来的UID不存在？
				{break, false}
		end
		  end,
	misc:mapAccList(List, [], Fun).
mixGem([#rec_item{itemID = ItemID, itemUID = UID} | _] = List) ->
	case getCfg:getCfgPStack(cfg_item, ItemID) of
		#itemCfg{useParam2 = NextLevelGemID, useParam3 = GemCurLevel} when erlang:is_integer(NextLevelGemID), NextLevelGemID > 0 ->
			MixPrice = case getCfg:getCfgPStack(cfg_di_mixcost, GemCurLevel + 1) of
						   #di_mixcostCfg{di_mixcost = Price} ->
							   Price;
						   _ ->
							   ?ERROR_OUT("mixGem error,can not find gem level=~p,in cfg_di_mixcost", [GemCurLevel + 1]),
							   999999999
					   end,
			case getBagIdleSlotNum(?Item_Location_Gem_Bag) > 0 of
				true ->
					UseCoinType = ?CoinUseTypeGold,
					MoneyLog = #recPLogTSMoney{
						reason = ?CoinUseGemMix,
						param = NextLevelGemID,
						target = ?PLogTS_Item,
						source = ?PLogTS_PlayerSelf
					},

					%%检查玩家钻石是否足够支付合成费用
					case playerMoney:useCoin(UseCoinType, MixPrice, MoneyLog) of
						true ->
							%%扣除道具
							Fun =
								fun(#rec_item{itemUID = GemUID, pileNum = PileNum}) ->
									Plog = #recPLogTSItem{
										old = PileNum,
										new = 0,
										change = -PileNum,
										target = ?PLogTS_GemEmbed,
										source = ?PLogTS_PlayerSelf,
										gold = MixPrice,
										goldtype = UseCoinType,
										changReason = ?ItemDeleteReasonGemMake,
										reasonParam = NextLevelGemID
									},
									useItemByUID2(GemUID, PileNum, ?Item_Location_Gem_Bag, Plog)
								end,
							lists:foreach(Fun, List),
							playerAchieve:achieveEvent(?Achieve_AttachedSpec, [1]),
							PLog = #recPLogTSItem{
								old = 0,
								new = 1,
								change = 1,
								target = ?PLogTS_PlayerSelf,
								source = ?PLogTS_GemEmbed,
								gold = MixPrice,
								goldtype = UseCoinType,
								changReason = ?ItemSourceGemMake,
								reasonParam = UID
							},
							[#rec_item{itemUID = ItemUID}] = playerPackage:addGoods(NextLevelGemID, 1, false, 0, PLog),
							playerMsg:sendNetMsg(#pk_GS2U_GemEmbedMakeResult{gemUID = ItemUID}),
							true;
						_ ->
							%%金钱不足
							playerMsg:sendErrorCodeMsg(?ErrorCode_TradeGold),
							false
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNoEmptyBag),
					false
			end;
		_ ->
			%%没有找到策划配置
			?ERROR_OUT("Error MixGemID:~p,Cannot found cfg", [ItemID]),
			false
	end.

mixGem1(ItemID, GemNum, GemList) ->
	case getCfg:getCfgPStack(cfg_item, ItemID) of
		#itemCfg{useParam2 = NextLevelGemID, useParam3 = GemCurLevel} when erlang:is_integer(NextLevelGemID), NextLevelGemID > 0 ->
			MixPriceSingle = case getCfg:getCfgPStack(cfg_di_mixcost, GemCurLevel + 1) of
								 #di_mixcostCfg{di_mixcost = Price} ->
									 Price;
								 _ ->
									 ?ERROR_OUT("mixGem error,can not find gem level=~p,in cfg_di_mixcost", [GemCurLevel + 1]),
									 999999999
							 end,
			NextLevelGemPile =
				case getCfg:getCfgPStack(cfg_item, NextLevelGemID) of
					#itemCfg{maxAmount = PileNumber} ->
						PileNumber;
					_ ->
						-1
				end,

			NextGemNumber = trunc(GemNum div ?MaxGemMixNum),
			LeftGemNumber = trunc(GemNum rem ?MaxGemMixNum),
			TotalCostMoney = trunc(NextGemNumber * MixPriceSingle),
			NeedSlotNumber1 =
				if
					NextLevelGemPile =:= -1 ->
						99999999999999;
					(NextGemNumber rem NextLevelGemPile) =:= 0 ->
						trunc(NextGemNumber div NextLevelGemPile);
					true ->
						trunc(NextGemNumber div NextLevelGemPile) + 1
				end,

			NeedSlotNumber2 =
				if
					LeftGemNumber > 0 ->
						NeedSlotNumber1 + 1;
					true ->
						NeedSlotNumber1
				end,

			NeedSlotNumber = NeedSlotNumber2 - length(GemList),

			case getBagIdleSlotNum(?Item_Location_Gem_Bag) >= NeedSlotNumber of
				true ->
					MoneyLog = #recPLogTSMoney{
						reason = ?CoinUseGemMix,
						param = NextLevelGemID,
						target = ?PLogTS_Item,
						source = ?PLogTS_PlayerSelf
					},

					%%检查玩家钻石是否足够支付合成费用
					case playerMoney:useCoin(?CoinUseTypeGold, TotalCostMoney, MoneyLog) of
						true ->
							%%扣除道具
							Fun =
								fun(#rec_item{itemUID = GemUID, pileNum = PileNum}) ->
									PLog = #recPLogTSItem{
										old = PileNum,
										new = 0,
										change = -PileNum,
										target = ?PLogTS_GemEmbed,
										source = ?PLogTS_PlayerSelf,
										gold = TotalCostMoney,
										goldtype = ?CoinUseTypeGold,
										changReason = ?ItemDeleteReasonGemMake,
										reasonParam = NextLevelGemID
									},
									true = useItemByUID2(GemUID, PileNum, ?Item_Location_Gem_Bag, PLog)
								end,
							lists:foreach(Fun, GemList),
							playerAchieve:achieveEvent(?Achieve_AttachedSpec, [1]),
							?LOG_OUT("use item[~p][~p], mixto[~p][~p], left[~p]",
								[ItemID, GemNum, NextLevelGemID, NextGemNumber, LeftGemNumber]),

							%% 给下一级宝石
							PLog = #recPLogTSItem{
								old = 0,
								new = NextGemNumber,
								change = NextGemNumber,
								target = ?PLogTS_PlayerSelf,
								source = ?PLogTS_GemEmbed,
								gold = TotalCostMoney,
								goldtype = ?CoinUseTypeGold,
								changReason = ?ItemSourceGemMake,
								reasonParam = GemNum
							},
							NewItemList = playerPackage:addGoodsAndMail(NextLevelGemID, NextGemNumber, false, 0, PLog),
							lists:foreach(
								fun(#rec_item{itemUID = ItemUID})->
									playerMsg:sendNetMsg(#pk_GS2U_GemEmbedMakeResult{gemUID = ItemUID})
								end,
								NewItemList),
							case LeftGemNumber > 0 of
								true ->
									playerPackage:addGoodsAndMail(ItemID, LeftGemNumber, false, 0, PLog);
								_ ->
									skip
							end;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_TradeGold)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNoEmptyBag)
			end;
		_ ->
			skip
	end,
	ok.
%%
%%%% 宝石合成,Flag表示是否是使用非绑定钻石合成非绑定宝石
-spec gemComposition(ItemID :: uint(), Count :: uint(), Flag :: boolean()) -> ok.
gemComposition(ItemID, Count, _IsUnBind) ->
	%% 获取非锁定宝石及其数量
	Bag = playerState:getPackage(?Item_Location_Gem_Bag),
	Fun = fun(Goods, {AccInNum, AccItem} = AccIn) ->
		case Goods of
			#rec_item{itemID = ItemID, pileNum = PileNum, isLocked = false} = Item ->
				{PileNum + AccInNum, [Item | AccItem]};
			_ ->
				AccIn
		end
		  end,
	{GemNum, GemList} = lists:foldl(Fun, {0, []}, Bag),
	case (GemNum div ?MaxGemMixNum) >= Count of
		true ->
			mixGem1(ItemID, GemNum, GemList);
		_ ->
			skip
	end,
	ok;
gemComposition(ItemID, Count, IsUnBind) ->
	%% 获取非锁定宝石及其数量
	Bag = playerState:getPackage(?Item_Location_Gem_Bag),
	Fun = fun(Goods, {AccInNum, AccInBindItem, AccInNonBindItem} = AccIn) ->
		case Goods of
			#rec_item{itemID = ItemID, pileNum = PileNum, isLocked = false, isBind = IsBind} = Item ->
				case IsUnBind =:= true of
					true ->
						%%这里要求是非绑定
						case IsBind =:= false of
							true ->
								{PileNum + AccInNum, AccInBindItem, [Item | AccInNonBindItem]};
							_ ->
								AccIn
						end;
					_ ->
						case IsBind of
							true ->
								{PileNum + AccInNum, [Item | AccInBindItem], AccInNonBindItem};
							_ ->
								{PileNum + AccInNum, AccInBindItem, [Item | AccInNonBindItem]}
						end
				end;
			_ ->
				AccIn
		end
		  end,
	{GemNum, BindGemList, NonBindGemList} = lists:foldl(Fun, {0, [], []}, Bag),
	%%优先使用绑定宝石
	GemList = BindGemList ++ NonBindGemList,
	case (GemNum div ?MaxGemMixNum) >= Count of
		true ->
			%% 把堆叠数量全部变为uid
			FunDD = fun(#rec_item{itemUID = UID, pileNum = Num}, AccList) ->
				L = lists:seq(1, Num),
				FunFold = fun(_, AccIn) ->
					[UID | AccIn]
						  end,
				lists:foldl(FunFold, AccList, L)
					end,
			UIDList = lists:foldr(FunDD, [], GemList),

			%% 可以去合成了
			Fun1 = fun(_, {Result, DecUIDList} = Return) ->
				case Result of
					true ->
						%% 必须是上一次合成成功才能进行下一次合成
						{L1, L2} = lists:split(?MaxGemMixNum, DecUIDList),
						case gemMix(L1) of
							true ->
								{true, L2};
							_ ->
								{false, DecUIDList}
						end;
					_ ->
						Return
				end
				   end,
			lists:foldl(Fun1, {true, UIDList}, lists:seq(1, Count)),
			playerSevenDays:onMissionEvent(?SevenDayMission_Event_6, 1, 0),
			ok;
		_ ->
			%% 数量不够
			%%?ERROR_OUT("gemComposition:~p,~p,~p,~p", [playerState:getRoleID(),ItemID,Count,HaveNumber]),
			skip
	end,
	ok.


-spec statEmbedGemLevel(GemID :: uint()) -> ok.
statEmbedGemLevel(GemID) ->
	#itemCfg{useParam3 = Level} = getCfg:getCfgPStack(cfg_item, GemID),
	playerAchieve:achieveEvent(?Achieve_GemEmbed, [Level, 1]).

-spec sendEmbedGemNetMsg(#rec_item{}) -> ok.
sendEmbedGemNetMsg(#rec_item{itemUID = ItemUID, pos = Pos}) ->
%%	Slot = getEmbedGemSlot(Pos),
%%	playerMsg:sendNetMsg(#pk_GS2U_GemEmbedAdd{gemEmbedInfo = #pk_GemEmbedInfo{gemUID = ItemUID, slot = Slot}}),
	ok.

%%宝石镶嵌时改变战斗属性
-spec gemEmbedOnChangeProp(GemID, Slot) -> ok when GemID :: uint(), Slot :: uint().
gemEmbedOnChangeProp(GemID, Slot) ->
%%	mainGemChangeProp(?EquipOff, getMainGemLevel()),
%%	gemChangeProp(GemID, Slot, ?EquipOn),
%%	calcMainGemLevel(),
%%	mainGemChangeProp(?EquipOn, getMainGemLevel()),
	ok.

%%宝石拆卸时改变战斗属性
-spec gemEmbedOffChangeProp(GemID, Slot) -> ok when GemID :: uint(), Slot :: uint().
gemEmbedOffChangeProp(GemID, Slot) ->
%%	mainGemChangeProp(?EquipOff, getMainGemLevel()),
%%	gemChangeProp(GemID, Slot, ?EquipOff),
%%	calcMainGemLevel(),
%%	mainGemChangeProp(?EquipOn, getMainGemLevel()),
	ok.

%%解析宝石属性
-spec parseGemProp({PropKey, PropValue, AddOrMulti}, {AddPropList, MultiPropList, IsAddProp}) -> {AddPropList, MultiPropList, IsAddProp} when
	PropKey :: uint(), PropValue :: number(), AddOrMulti :: 0|1, AddPropList :: list(), MultiPropList :: list(), IsAddProp :: boolean().
parseGemProp({PropKey, PropValue, AddOrMulti}, {AddPropList, MultiPropList, IsAddProp} = AccIn) ->
	if
		erlang:is_number(PropKey) andalso PropKey > 0 andalso erlang:is_number(PropValue) andalso PropValue /= 0 ->
			case AddOrMulti of
				0 ->
					case IsAddProp of
						true ->
							{[{PropKey, PropValue} | AddPropList], MultiPropList, IsAddProp};
						_ ->
							{[{PropKey, -(PropValue)} | AddPropList], MultiPropList, IsAddProp}
					end;
				1 ->
					{AddPropList, [{PropKey, PropValue} | MultiPropList], IsAddProp}
			end;
		true ->
			AccIn
	end.

%%宝石改变属性
-spec gemChangeProp(GemID, Slot, Operate) -> ok when GemID :: uint(), Operate :: uint(), Slot :: uint().
gemChangeProp(GemID, Slot, Operate) ->
	{Target, ResultPropList} = getGemPropByID(Slot, GemID),
%%	{AddResultPropList, MultiResultPropList, IsAddProp} = lists:foldl(fun parseGemProp/2, {[], [], IsAddProp}, ResultPropList0),
	%%: 加成目标
	%%: 1 玩家
	%%: 2 技能召唤宠物
	%%: 3 收费宠物
	case Target of
		1 ->
			%%删除乘法值
			playerCalcProp:changeProp_CalcType(ResultPropList, Operate, true);
		2 ->
			skip;
		3 ->
			playerPet:onBattlePetAttrChange(?EquipOff, false),
			{AddResultPropList, MultiResultPropList} = battleProp:calcPropGroup(ResultPropList, Operate),
			playerPet:updateBattlePetProp(AddResultPropList, MultiResultPropList, Operate =:= ?EquipOn),
			playerPet:onBattlePetAttrChange(?EquipOn, true);
		_ ->
			skip
	end,
	case playerState:getRunStep() =:= ?PlayerStateRun of
		true ->
			skip;
%%			addGemSkill();
		_ ->
			skip
	end,
	ok.

setMainGemLevel(Level) ->
	put(mainGemLevel, Level).

getMainGemLevel() ->
	case get(mainGemLevel) of
		undefined ->
			0;
		V ->
			V
	end.

mainGemChangeProp(Operate, MainGemLevel) ->
	case getGemMainPropCfg(MainGemLevel) of
		[] ->
			ok;
		L ->
			playerCalcProp:changeProp_CalcType(L, Operate, true)
	end,
	ok.



calcMainGemLevel() ->
	L = playerState:getPackage(?Item_Location_GemEmbedBag),
	F = fun(#rec_item{itemID = GemID}, Acc) ->
		case getCfg:getCfgByArgs(cfg_item, GemID) of
			#itemCfg{useParam3 = Level} -> %%这里useParam3作为宝石激活宝石孔的等级
				Acc + Level;
			_ ->
				Acc
		end
		end,
	NewLevel = lists:foldl(F, 0, L),
	setMainGemLevel(NewLevel).

getGemMainPropCfg(TotalLevel) when TotalLevel =< 0 ->
	[];
getGemMainPropCfg(TotalLevel) ->
	Level = getGemPropCfgLevel(TotalLevel),
	case Level > 0 of
		true ->
			case getCfg:getCfgByKey(cfg_gem_level, Level) of
				#gem_levelCfg{
					warrior = Warrior,
					mage = Mage,
					assassin = Assassin
				} ->
					Career = playerState:getCareer(),
					PropList = case ?Career2CareerMain(Career) of
								   ?CareerMain_1_Warrior ->
									   %% 骑士
									   Warrior;
								   ?CareerMain_2_Magician ->
									   %% 魔法师
									   Mage;
								   ?CareerMain_3_Bravo ->
									   %% 刺客
									   Assassin;
								   _ ->
									   ?ERROR_OUT("gold weapon getPropList error Career[~p]", [Career]),
									   []
							   end,
					PropList;
				_ ->
					[]
			end;
		_ ->
			[]
	end.

getGemPropCfgLevel(Level) ->
	L = getCfg:get1KeyList(cfg_gem_level),
	lists:foldl(
		fun(CfgLevel, CurLevel) ->
			case CfgLevel =< Level of
				true when CfgLevel > CurLevel ->
					CfgLevel;
				_ ->
					CurLevel
			end
		end, 0, L).


addGemSkill() ->
	OldLevel = playerPropSync:getProp(?PubProp_GemSpriteLevel),
	#gorgeousCfg{skill = OldSkillList} = getCfg:getCfgPStack(cfg_gorgeous, OldLevel),
	Fun = fun(ID) ->
		try
			playerSkill:delGemSkill(ID)
		catch
			_ : _ ->
				?ERROR_OUT("gorgeousCfg.skill  playerSkill:delGemSkill(~p)", [ID])
		end
		  end,
	lists:foreach(Fun, OldSkillList),
	Level = calcGemSpriteLevel(),
	case Level >= 1 of
		true ->
			playerPropSync:setProp(?PubProp_GemSpriteLevel, Level),
			SkillList = case getCfg:getCfgByArgs(cfg_gorgeous, Level) of
							#gorgeousCfg{skill = NewSkillList} ->
								NewSkillList;
							_ ->
								?ERROR_OUT("RoleID:~p addGemSkill Level:~p,but not find cfg", [playerState:getRoleID(), Level]),
								[]
						end,
			Fun1 = fun(ID) ->
				playerSkill:addGemSkill(ID, Level)
				   end,
			lists:foreach(Fun1, SkillList);
		_ ->
			skip
	end,
	ok.

calcGemSpriteLevel() ->
	GemList = playerState:getPackage(?Item_Location_GemEmbedBag),
	%%计算各等级的宝石数量
	Fun = fun(#rec_item{itemID = ItemID}, AccIn) ->
		#itemCfg{useParam3 = Level} = getCfg:getCfgByArgs(cfg_item, ItemID),
		case Level >= 0 andalso Level =< 10 of
			true ->
				case lists:keyfind(Level, 1, AccIn) of
					{Level, N, Arg} ->
						lists:keyreplace(Level, 1, AccIn, {Level, N + 1, Arg});
					_ ->
						Arg = globalCfg:getGemValue(Level),
						[{Level, 1, Arg} | AccIn]
				end;
			_ ->
				?ERROR_OUT("Error Gem Level[~p] Cfg,out of range[0,10]", [Level]),
				AccIn
		end
		  end,
	%%根据公式计算一个值
	List = lists:foldl(Fun, [], GemList),
	Func = fun({_Level, N, Arg}, AccIn) ->
		N * Arg + AccIn
		   end,
	TotalValue = lists:foldl(Func, 0, List),
	Fun2 = fun(N, AccIn) ->
		#gorgeousCfg{id = Lv, unmber_G = Value} = getCfg:getCfgPStack(cfg_gorgeous, N),
		case TotalValue >= Value of
			true ->
				Lv;
			_ ->
				{break, AccIn}
		end
		   end,
	Level = misc:mapAccList(getCfg:get1KeyList(cfg_gorgeous), 0, Fun2),
	Level.


%%根据宝石ID从配置表中取出宝石的属性
-spec getGemPropByID(SlotID, GemID) -> {Target :: uint() | undefined, [{Prop, Value, AddOrMulti}, ...]} when GemID :: uint(), Prop :: uint(), Value :: number(), AddOrMulti :: 0|1, SlotID :: uint().
getGemPropByID(SlotID, GemID) -> {undefined, []}.
%%	case getCfg:getCfgByArgs(cfg_item, GemID) of
%%		#itemCfg{useParam3 = Level} -> %%这里useParam3作为宝石激活宝石孔的等级
%%			case getCfg:getCfgByArgs(cfg_gemproperty, SlotID, Level) of
%%				#gempropertyCfg{
%%					target = Target,
%%					paladin = Paladin,
%%					wizard = Wizard,
%%					mechanic = Mechanic,
%%					assassin = Assassin,
%%					soulReaper = SoulReaper
%%				} ->
%%					Career = playerState:getCareer(),
%%					PropList = case ?Career2CareerMain(Career) of
%%								   ?CareerMain_1_Warrior ->
%%									   %% 骑士
%%									   Paladin;
%%								   ?CareerMain_2_Magician ->
%%									   %% 魔法师
%%									   Wizard;
%%								   ?CareerMain_3_Bravo ->
%%									   %% 刺客
%%									   Assassin;
%%								   ?CareerMain_4 ->
%%									   %% 灵魂收割者
%%									   SoulReaper;
%%								   ?CareerMain_5 ->
%%									   Mechanic;
%%								   _ ->
%%									   ?ERROR_OUT("gold weapon getPropList error Career[~p]", [Career]),
%%									   []
%%							   end,
%%					{Target, PropList};
%%				_ ->
%%					?ERROR_OUT("Error getGemPropByID:~p by cfg_gemproperty:~p, no cfg", [SlotID, Level]),
%%					{undefined, []}
%%			end;
%%		_ ->
%%			?ERROR_OUT("Error getGemPropByID:~p by cfg_item, no cfg", [GemID]),
%%			{undefined, []}
%%	end.

%%获取镶嵌背包中所有宠物宝石加的属性列表，包括加法值和乘法值
-spec getAllPetGemIDFromPackage() -> {AddPropList, MultiPropList} when AddPropList :: [{Key, Value}, ...] | [], MultiPropList :: [{Key, Value}, ...] | [], Key :: uint(), Value :: uint().
getAllPetGemIDFromPackage() -> {[], []}.
%%	List = playerState:getPackage(?Item_Location_GemEmbedBag),
%%	Fun = fun(#rec_item{itemID = GemID, pos = Pos}, {APL, MPL} = AccIn) ->
%%		case erlang:is_integer(GemID) andalso GemID > 0 of
%%			true ->
%%				Slot = getEmbedGemSlot(Pos),
%%				{Target, PropList} = getGemPropByID(Slot, GemID),
%%				%%: 加成目标
%%				%%: 1 玩家
%%				%%: 2 技能召唤宠物
%%				%%: 3 收费宠物
%%				case Target of
%%					1 ->
%%						AccIn;
%%					2 ->
%%						{AddResultPropList, MultiResultPropList, true} = lists:foldl(fun parseGemProp/2, {[], [], true}, PropList),
%%						{AddResultPropList ++ APL, MultiResultPropList ++ MPL};
%%					3 ->
%%						{AddResultPropList, MultiResultPropList, true} = lists:foldl(fun parseGemProp/2, {[], [], true}, PropList),
%%						{AddResultPropList ++ APL, MultiResultPropList ++ MPL};
%%					_ ->
%%						AccIn
%%				end
%%		end
%%		  end,
%%	lists:foldl(Fun, {[], []}, List).

-spec isValidSlot(GemID, Slot) -> boolean() when GemID :: uint(), Slot :: uint8().
isValidSlot(GemID, Slot) ->
	false.
%%	case getCfg:getCfgPStack(cfg_gembox_info, Slot) of
%%		#gembox_infoCfg{gem_type = Type} ->
%%			case getCfg:getCfgPStack(cfg_item, GemID) of
%%				#itemCfg{useParam4 = Type} ->
%%					true;
%%				_ ->
%%					?WARN_OUT("GemID[~p] is InValid Slot:~p,Type:~p", [GemID, Slot, Type]),
%%					false
%%			end;
%%		_ ->
%%			?WARN_OUT("GemID[~p] cannot find Slot:~p of cfg in cfg_gembox_info", [GemID, Slot]),
%%			false
%%	end.

-spec isExistEmbedGem(Slot) -> boolean() when Slot :: uint8().
isExistEmbedGem(Slot) ->
	GemList = playerState:getPackage(?Item_Location_GemEmbedBag),
	Fun = fun(#rec_item{pos = Pos}, AccIn) ->
		case getEmbedGemSlot(Pos) of
			Slot ->
				{break, true};
			_ ->
				AccIn
		end
		  end,
	misc:mapAccList(GemList, false, Fun).

%%计算非锁定的物品数量
-spec getGoodsNumByID(BagType, GoodsID) -> uint() when
	BagType :: bagType(), GoodsID :: uint().
getGoodsNumByID(BagType, GoodsID) ->
	Bag = playerState:getPackage(BagType),
	Fun = fun(Goods, AccIn) ->
		case Goods of
			#rec_item{itemID = GoodsID, pileNum = PileNum, isLocked = false} ->
				PileNum + AccIn;
			#recSaveEquip{itemID = GoodsID, isLocked = false} ->
				1 + AccIn;
			_ ->
				AccIn
		end
		  end,
	lists:foldl(Fun, 0, Bag).

-spec getGoodsNumByID(BagType, GoodsID, IsBind :: boolean()) -> uint() when
	BagType :: bagType(), GoodsID :: uint().
getGoodsNumByID(BagType, GoodsID, IsBind) ->
	Bag = playerState:getPackage(BagType),
	Fun = fun(Goods, AccIn) ->
		case Goods of
			#rec_item{itemID = GoodsID, pileNum = PileNum, isLocked = false, isBind = IsBind} ->
				PileNum + AccIn;
			#recSaveEquip{itemID = GoodsID, isLocked = false, isBind = IsBind} ->
				1 + AccIn;
			_ ->
				AccIn
		end
		  end,
	lists:foldl(Fun, 0, Bag).

%% 添加物品成功的回调
-spec addGoodCallBack(GoodsSource :: uint(), Goods :: [#rec_item{}, ...] | [#recSaveEquip{}, ...], GoodsNum :: uint()) -> ok.
addGoodCallBack(?ItemSourceKillMonster, Goods, GoodsNum) ->
	killMonsterOrPassCopyMap(Goods, GoodsNum);
addGoodCallBack(?ItemSourcePassCopyMap, Goods, GoodsNum) ->
	killMonsterOrPassCopyMap(Goods, GoodsNum);
addGoodCallBack(?ItemSourceNormalCollect, Goods, _GoodsNum) ->
	%% 普通采集得到物品
	playerGather:gatherSuccess(Goods),
	ok;
addGoodCallBack(_GoodsSource, _Goods, _GoodsNum) ->
	ok.

%% 击杀怪物或者通关副本
killMonsterOrPassCopyMap(Goods, GoodsNum) ->
	NewGoods = case Goods of
				   [#rec_item{} = Item | _] ->
					   [Item#rec_item{pileNum = GoodsNum}];
				   _ ->
					   Goods
			   end,
	playerCopyMap:addCopyMapDropList(NewGoods),
%% 	?DEBUG_OUT("killMonsterOrPassCopyMap:~p,~p,~p", [Goods,GoodsNum,NewGoods]),
	ok.

%%根据物品id来使用
useItemByID(ItemID, ItemNum, IsOnlyBind)
	when erlang:is_number(ItemNum), ItemID < ?Item_Differentiate, erlang:is_integer(ItemNum), ItemNum > 0 ->
	BagType = ?Item_Location_Bag,
	EnoughItemNum =
		case IsOnlyBind of
			true ->
				getGoodsNumByID(BagType, ItemID, IsOnlyBind);
			_ ->
				getGoodsNumByID(BagType, ItemID)
		end,
	case EnoughItemNum >= ItemNum of
		true ->
			L = playerPackage:getGoodsByID(ItemID, BagType),
			?DEBUG_OUT("useItemByID roleID:~p, goods:~p", [playerState:getRoleID(), L]),
			Fun = fun
					  (#rec_item{itemUID = UID, pileNum = Num, isBind = IsBind}, Acc) when (IsOnlyBind == false orelse
						  IsBind == IsOnlyBind), Acc < ItemNum ->
						  RealUseNum =
							  case ItemNum - Acc of
								  NeadNum when NeadNum >= Num ->
									  playerItem:useBagItem(UID, Num, ?ItemUseReasonPlayer, UID),
									  Num;
								  NeadNum2 ->
									  playerItem:useBagItem(UID, NeadNum2, ?ItemUseReasonPlayer, UID),
									  NeadNum2
							  end,
						  RealUseNum + Acc;
					  (_, Acc) -> Acc
				  end,
			lists:foldl(Fun, 0, L),
			ok;
		_ ->
			skip
%%			?ERROR_OUT("pk_U2GS_WingRise itemid:~p itemnum:~p bind:~p not in package;roleID:~p", [ItemID, ItemNum, IsOnlyBind, playerState:getRoleID()])
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_MallBuy_Item_Not_Enough)
	end;
useItemByID(ItemID, ItemNum, IsOnlyBind) ->
	?ERROR_OUT("badArgs itemID:~p,ItemNum:~p,IsOnlyBind:~p,roleID:~p", [ItemID, ItemNum, IsOnlyBind, playerState:getRoleID()]).

-spec getPackageType(ItemType :: uint) -> uint().
getPackageType(ItemType) ->
	case ItemType of
		?ItemTypeGem ->
			%%宝石道具需要存入宝石背包
			?Item_Location_Gem_Bag;
		?ItemTypePieces ->
			?Item_Location_Pieces_Bag;
		_ ->
			%%其它道具存入普通背包
			?Item_Location_Bag
	end.



getItemType(GoodsID) ->
	case goods:getGoodsCfg(GoodsID) of
		#itemCfg{itemType = ItemType} ->
			ItemType;
		_ ->
			0
	end.


%% 20170111 余淇星需求：背包已满时打怪无法获得掉落物则提示玩家对应背包已满，有时间间隔限制，写死5秒
-spec bagFullTipsIsCooldown(BagType :: uint()) -> boolean().
bagFullTipsIsCooldown(BagType)
	when BagType =:= ?Item_Location_Bag
	orelse BagType =:= ?Item_Location_Equip_Bag
	orelse BagType =:= ?Item_Location_Gem_Bag
	orelse BagType =:= ?Item_Location_Pieces_Bag ->
	L1 = playerPropSync:getProp(?SerProp_BagFullTipsLastTime),
	case lists:keyfind(BagType, 1, L1) of
		{_, TimeLast} ->
			time2:getTimestampSec() + 5 >= TimeLast;
		_ ->
			true
	end.
-spec bagFullTipsLastTime(BagType :: uint()) -> ok.
bagFullTipsLastTime(BagType)
	when BagType =:= ?Item_Location_Bag
	orelse BagType =:= ?Item_Location_Equip_Bag
	orelse BagType =:= ?Item_Location_Gem_Bag
	orelse BagType =:= ?Item_Location_Pieces_Bag ->
	L1 = playerPropSync:getProp(?SerProp_BagFullTipsLastTime),
	L2 = lists:keystore(BagType, 1, L1, {BagType, time2:getTimestampSec()}),
	playerPropSync:setAny(?SerProp_BagFullTipsLastTime, L2).

%% 获取指定道具ID在背包中的数量
-spec getGoodsCountByID(ItemID :: uint32(), IsBind :: boolean()) -> Count :: uint32().
getGoodsCountByID(ItemID, IsBind) ->
	case getCfg:getCfgByKey(cfg_item, ItemID) of
		#itemCfg{itemType = ItemType} ->
			BagType = playerPackage:getPackageType(ItemType),
			playerPackage:getGoodsNumByID(BagType, ItemID, IsBind);
		_ ->
			?ERROR_OUT("getGoodsCountByID can not find ItemID:~p from cfg_item", [ItemID]),
			0
	end.
