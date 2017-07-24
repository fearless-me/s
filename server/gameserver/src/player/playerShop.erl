%%
%% @author zhongyunawei
%% @doc @todo 商店模块.


-module(playerShop).
-author(zhongyuanwei).

-include("gsInc.hrl").
-include("playerPrivate.hrl").

-define(EquipExchage,3).%%装备兑换用的groupID
-define(Rec_sourceshop_forever_limit_Type,0).%%标记表中的类型
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	getItemList/1,
	buyItem/3,
	buyItemWithShopID/3,
	buyGuildItem/2,
	buyConvenientItem/2,
	resourceExchange/2,
	resourceExchange/3,
	resourceExchange4Equpment/2,
	
	sendAllExchangeResource/0,
	sendStoreToClient/1,
	getMyHasForeverLimitID/1,
	getMyHasForeverLimitID/0,
	setMyHasForeverLimitID/2
]).

%% 获取Npc商店物品列表
getItemList(NpcCode) when erlang:is_integer(NpcCode) andalso NpcCode > 0 ->
	case getNpcID(NpcCode) of
		notFound ->
			skip;
		NpcID when erlang:is_integer(NpcID) ->
			getItemList2(NpcID)
	end.

%% 购买军团商品
-spec buyGuildItem(ItemID::uint(), Number::uint()) -> ok.
buyGuildItem(ItemID, Number) ->
    case playerGuild:getGuildShopID() of
        0 -> skip;
        ShopID ->
            buyItem3(ShopID, ItemID, Number)
    end,
	ok.

%% 便捷购买道具
-spec buyConvenientItem(ItemID::uint(), Number::uint()) -> ok.
buyConvenientItem(ItemID, Number) ->
	case getCfg:getCfgPStack(cfg_globalsetup, horn_diamond) of
		#globalsetupCfg{setpara = [HornDiamond]} ->
			buyItemHorn(ItemID, Number, HornDiamond);
		_ ->
			skip
	end,
	ok.

%% 购买商品
-spec buyItem(NpcCode, ItemID, Number) -> ok when
		  NpcCode :: uint(),
		  ItemID :: uint(),
		  Number :: uint().
buyItem(NpcCode, ItemID, Number) when erlang:is_integer(Number) andalso Number > 0 ->
	case goods:getGoodsCfg(ItemID) of
		#equipmentCfg{} ->
			case Number =:= 1 of
				true ->
					case getNpcID(NpcCode) of
						notFound ->
							skip;
						NpcID when erlang:is_integer(NpcID) ->
							buyItem2(NpcID, ItemID, Number)
					end;
				false ->
					skip
			end;
		#itemCfg{maxAmount = MaxAmount} ->
			case Number =< MaxAmount of
				true ->
					case getNpcID(NpcCode) of
						notFound ->
							skip;
						NpcID when erlang:is_integer(NpcID) ->
							buyItem2(NpcID, ItemID, Number)
					end;
				false ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNumberLimit)
			end;
		_ ->
			skip		%% 错误的商品ID
	end.

%% 购买商品
-spec buyItemWithShopID(ShopID, ItemID, Number) -> ok when
	ShopID :: uint(),
	ItemID :: uint(),
	Number :: uint().
buyItemWithShopID(ShopID, ItemID, Number) when erlang:is_integer(Number) andalso Number > 0 ->
	case goods:getGoodsCfg(ItemID) of
		#equipmentCfg{} ->
			buyItem3(ShopID, ItemID, Number);
		#itemCfg{maxAmount = MaxAmount} ->
			case Number =< MaxAmount of
				true ->
					buyItem3(ShopID, ItemID, Number);
				false ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNumberLimit)
			end;
		_ ->
			skip		%% 错误的商品ID
	end.

%%资源兑换，使用装备分解的代币，兑换物品
-spec resourceExchange(ItemID, Count) ->ok when ItemID::uint(), Count::uint().
resourceExchange(SourceID, ExchangeCount) -> resourceExchange(SourceID, ExchangeCount, 0).

resourceExchange(SourceID, ExchangeCount, OpType) ->
	{Ret, GroupID} =
		case getCfg:getCfgPStack(cfg_sourceshop, SourceID) of
			#sourceshopCfg{groupid = GroupID1} = CfgInfo ->
				Res = resourceExchange2(CfgInfo, ExchangeCount),
				{Res, GroupID1};
			_ ->
				{false, 0}
		end,
	resourceExchangeOver(Ret, GroupID, OpType),
	ok.

resourceExchangeOver(true, _, 1)->
	playerMsg:sendErrorCodeMsg(?ErrorCode_BagResourceBuyBack);
resourceExchangeOver(true, GroupID, _) when GroupID =/= 6 ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_BagResourceExchangeSuccess);
resourceExchangeOver(_, _, _)->
	skip.


%%资源兑换配置，依次找要兑换的资源，如果找到兑换则兑换然后兑换完成，否则继续递归
resourceExchange2(CfgInfo, ExchangeCount) ->
	#sourceshopCfg{id = ID, itemid = ItemID, itemNumber = ItemNumber, payItem = PayItemList, openlv = MustPlayerLevel,
		maxchange_day = MaxCount4Day, maxchange = MaxCount, level = PlayerLevel, quality = Quality, occupation = Career} = CfgInfo,
	case exchangeDeal(ID, ExchangeCount, ID, ItemID, ItemNumber, PayItemList, MustPlayerLevel, MaxCount4Day, MaxCount, PlayerLevel, Quality, Career) of
		true ->
			{RealCount, _RealEquipQuality} =
				case ItemID < ?Item_Differentiate of
					true -> {ExchangeCount, 0};
					false -> {1, Quality}
				end,
			%%添加资源兑换成就统计
			playerAchieve:achieveEvent(?Achieve_Exchange, [RealCount]),
			true;
		_ ->
			false
	end.

%%装备合成(各种物品兑换成指定装备)
-spec resourceExchange4Equpment(SourceID::list(), EqupmentUIDList::list()) ->boolean().
resourceExchange4Equpment(SourceID, EqupmentUIDList) ->
	Count = 1,
	case getCfg:getCfgPStack(cfg_itemTinker, SourceID) of
		#itemTinkerCfg{id=ID,itemid = ItemID, payItem=PayItemList, openlv = MustPlayerLevel,
					   maxchange_day = MaxCount4Day,maxchange=MaxCount,level=PlayerLevel,quality=Quality,occupation=Career} ->
			case checkEqupmentUID( PayItemList ,EqupmentUIDList ) of
				PayItemListExceptUID when erlang:is_list(PayItemListExceptUID),PayItemListExceptUID =/= [] ->
					case exchangeDeal(SourceID, Count,ID,ItemID,1,PayItemListExceptUID,MustPlayerLevel,MaxCount4Day,MaxCount,PlayerLevel,Quality,Career) of
						false ->
							false;
						_ ->
							Plog = #recPLogTSItem{
												  old = 1,
												  new = 0,
												  change = -1,
												  target = ?PLogTS_EqupmentCombin,
												  source = ?PLogTS_PlayerSelf,
												  gold = 0,
												  goldtype = 0,
												  changReason = ?ItemDeleteReasonEqupmentCombin,
												  reasonParam = 0
												 },
							[ playerPackage:deleteGoodsByUID(?Item_Location_Equip_Bag, UID, Plog) || UID <- EqupmentUIDList ],
							true
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BagResourceExchangeFailedCanPay),
					false
			end;
		_ ->
			?ERROR_OUT("cfg_sourceshop cant find  ~p",[SourceID]),
			false
	end.

%%装备合成需要的装备UID(装备是不能叠加的，即数量只能为1)
-spec checkEqupmentUID( PayItemList::list() ,EqupmentUIDList::list() ) ->list()|false.
checkEqupmentUID( PayItemList ,EqupmentUIDList ) ->
	EqupmentObjs = [ playerPackage:getGoodsByUID(UID, ?Item_Location_Equip_Bag) || UID <- EqupmentUIDList ],
	
	Fun = fun
			 ({PayItemID,Num},Acc) when erlang:is_list(Acc) ->
				  case lists:keyfind( PayItemID, #recSaveEquip.itemID, EqupmentObjs) of
					  false when PayItemID>=?Item_Differentiate ->
						  false;
					  _ when PayItemID>=?Item_Differentiate ->
						  Acc;
					  _ ->
						  [ {PayItemID,Num} | Acc ]
				  end;
			 (_PayItem,_Acc) ->
				  false
		  end,
	
	lists:foldl(Fun, [], PayItemList).

%%发送所有的兑换资源列表
-spec sendAllExchangeResource() -> ok.
sendAllExchangeResource() ->
	SourceIDList = getCfg:get1KeyList(cfg_sourceshop),
	Fun = fun(ID, ExchangeList) ->
		case getCfg:getCfgPStack(cfg_sourceshop, ID) of
			#sourceshopCfg{groupid = GroupID, itemid = ItemID, payItem=CnfPayItemList
						   , openlv = MustPlayerLevel, maxchange_day = Limit,id=ID} when GroupID =/= ?EquipExchage ->

				DailyCounter = playerDaily:getDailyCounter(?DailyType_ResourceExchange, ID),
				SurplusCounter = Limit - DailyCounter,
				
				PayItem = [ #pk_PayItemOfExchange{item=CnfPayItemID,number=CnfPayItemNumber} || {CnfPayItemID,CnfPayItemNumber} <- CnfPayItemList],
				Exchange = #pk_ExchangeResource{
												id = ID,
												groupID = GroupID,
												itemID = ItemID,
												payItem = PayItem,
												playerLevel = MustPlayerLevel,
												limit = SurplusCounter
											   },
				[Exchange | ExchangeList];
			_ ->
				ExchangeList
		end
	end,
	ExchangeResource = lists:foldl(Fun, [], SourceIDList),
	playerMsg:sendNetMsg(#pk_GS2U_ResourceExchangeList{resources = ExchangeResource}),
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================


%% 判断玩家和Npc的距离，获取NpcID
getNpcID(NpcCode) ->
	{X, Y} = playerState:getPos(),	% 玩家必须在Npc附近
	case playerState:getNpcByCode(NpcCode) of
		notFound ->
			notFound;
		#recMapObject{x = Npc_X, y = Npc_Y, id = NpcID}->
			Dist = misc:calcDistSquare(X, Y, Npc_X, Npc_Y),
			case Dist > ?TalkToNpc_Distance * ?TalkToNpc_Distance of
				true ->
					notFound;
				false ->
					NpcID
			end
	end.


% 获取Npc上得物品列表结果
getItemList2(NpcID) ->
	case getCfg:getCfgPStack(cfg_npc, NpcID) of
		#npcCfg{button_para1 = StoreID} ->
			sendStoreToClient(StoreID);
		_ ->
			skip
	end,
	ok.

%% 发送商店给客户端
-spec sendStoreToClient(StoreID::uint()) -> ok.
sendStoreToClient(StoreID) ->
	ItemIDList = getCfg:get2KeyList(cfg_npcstore,StoreID),
	Fun =
		fun(ItemID, {AccItem, Type}) ->
			case getCfg:getCfgPStack(cfg_npcstore, StoreID, ItemID) of
				[] ->
					{AccItem, Type};
				#npcstoreCfg{number_d = XG_Number} = NpcStoreCfg ->

					%% 获取使用等级
					UseLevel = case goods:getGoodsCfg(ItemID) of
						           #itemCfg{level = Level} ->
							           Level;
						           #equipmentCfg{equipLevel = Level} ->
							           Level
					           end,
					QuotaNumber = case XG_Number > 0 of
						              true ->
							              BuyNumber = playerDaily:getDailyCounter(?DailyType_BuyItemNumber, ItemID),
							              XG_Number - BuyNumber;
						              _ ->
							              %% 没有限购
							              -1
					              end,
					%% 通过爵位获取新的单价
					UseType = NpcStoreCfg#npcstoreCfg.pricetype,
					OldPrice = NpcStoreCfg#npcstoreCfg.itemprice,
					NewPrice = playerVipInter:getBuyItemMoney(UseType, OldPrice),
					LookInfoItem = #pk_LookInfoItem{
						itemid = NpcStoreCfg#npcstoreCfg.itemid,
						sortid = NpcStoreCfg#npcstoreCfg.id,
						type = UseType,
						value = NewPrice,
						quality = NpcStoreCfg#npcstoreCfg.quality,
						useLevel = UseLevel,
						quotaNumber = QuotaNumber
					},
					{[LookInfoItem | AccItem], NpcStoreCfg#npcstoreCfg.type}
			end
		end,
	{LookInfoItemList, StoreType} = lists:foldl(Fun, {[], 0}, ItemIDList),
	case LookInfoItemList of
		[] ->
			skip;
		_ ->
			playerMsg:sendNetMsg(#pk_GS2U_LookInfoItemListAtNpcStore{storeType = StoreType, item_list = LookInfoItemList})
	end,
	ok.

% 购买商品结果
buyItem2(NpcID, ItemID, Number) when erlang:is_integer(Number) andalso Number > 0 ->
	case getCfg:getCfgPStack(cfg_npc, NpcID) of
		#npcCfg{button_para1 = StoreID} ->
			buyItem3(StoreID, ItemID, Number);
		_ ->
			skip
	end,
	ok.

buyItem3(StoreID, ItemID, Number) ->
	case getCfg:getCfgByKey(cfg_npcstore, StoreID, ItemID) of
		#npcstoreCfg{itemprice = ItemPrice, pricetype = UseCoinType, quality = Quality, number_d = XG_Number} ->
			{CanBuy, AlreadyBuyNumber} =
				case XG_Number > 0 of
					false ->
						%% 没有限购
						{true, 0};
					true ->
						%% 如果有限购，判断是否购买足够
						ABN = playerDaily:getDailyCounter(?DailyType_BuyItemNumber, ItemID),
						{(ABN + Number) =< XG_Number, ABN}
				end,
			CanBuy1 = case playerTrade:getBagNumber(ItemID) > 0 of
						  true -> true;
						  _ -> false
					  end,
			if
				not CanBuy ->
					%% 不能购买了
					playerMsg:sendErrorCodeMsg(?ErrorCode_MallBuy_failed);
				not CanBuy1 ->
					%% 背包已满
					playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNoEmptyBag);
				true ->
					%% 可以购买
					NeedWealth = ItemPrice * Number,

					%% 通过爵位获取新的实际价钱
					NewNeedWealth = playerVipInter:getBuyItemMoney(UseCoinType, NeedWealth),
					%%?DEBUG_OUT("ItemID:~p, PriceType:~p, Number:~p, ItemPrice :~p", [ItemID, UseCoinType, Number, ItemPrice]),
					case playerMoney:canUseCoin(UseCoinType,NewNeedWealth) of
						true ->
							Plog = #recPLogTSItem{
								old = 0,
								new = Number,
								change = Number,
								target = ?PLogTS_PlayerSelf,
								source = ?PLogTS_Shop,
								gold = 0,
								goldtype = 0,
								changReason = ?ItemSourceShop,
								reasonParam = StoreID
							},
							AddedItemList = playerPackage:addGoods(ItemID, Number, false, Quality, Plog),
							case AddedItemList of						%% 先收货后给钱
								[AddedItem | _T] ->
									%%?DEBUG_OUT("Item is In your bag now"),
									ItemUID = case AddedItem of
												  #rec_item{itemUID=ItemUID2} ->
													  ItemUID2;
												  #recSaveEquip{itemUID=ItemUID2} ->
													  ItemUID2
											  end,
									playerMoney:useCoin(UseCoinType, NewNeedWealth,
										#recPLogTSMoney{reason=?CoinUseShop,param=ItemUID,target=?PLogTS_Shop,source=?PLogTS_PlayerSelf}),
									playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNone),
									case XG_Number > 0 of
										true ->
											%% 计数
											playerDaily:addDailyCounter(?DailyType_BuyItemNumber, ItemID, Number),
											Q = XG_Number - AlreadyBuyNumber - Number,

											%% 通知客户端，剩余可购买次数
											playerMsg:sendNetMsg(#pk_GS2U_BuyItemQuotaNumber{itemid = ItemID, quotaNumber = Q});
										_ ->
											skip
									end;
								[] ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNoEmptyBag);
								_ -> %%有可能是自动使用的道具
									skip
							end;
						false ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNoWealth)
					end
			end;
		_ ->
			?ERROR_OUT("Error buyItem:~p from storeID:~p,not cfg",[ItemID,StoreID]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNoThisItem)
	end,
	ok.

%%购买小喇叭道具
buyItemHorn(ItemID, Number, HornDiamond) ->
    Plog = #recPLogTSItem{
        old = 0,
        new = Number,
        change = Number,
        target = ?PLogTS_PlayerSelf,
        source = ?PLogTS_ConvenientBuy,
        gold = Number*HornDiamond,
        goldtype = ?CoinTypeDiamond,
        changReason = ?PLogTS_ConvenientBuy,
        reasonParam = ItemID
    },
	case playerMoney:decCoin(?CoinTypeDiamond, Number*HornDiamond, #recPLogTSMoney{reason=?CoinUseShop,param=ItemID,target=?PLogTS_ConvenientBuy,source=?PLogTS_PlayerSelf}) of
		true ->
			playerPackage:addGoodsAndMail(ItemID, Number, true, 0, Plog),
			playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNone);
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNoWealth)
	end,
	ok.
	

%%具体兑换
-spec exchangeDeal(SourceID::uint(), Count::uint(),ID::uint(),ItemID::uint(),ItemNumber::uint(),PayItemList::uint(),MustPlayerLevel::uint(),MaxCount4Day::uint(),
				   MaxCount::uint(),PlayerLevel::uint(),Quality::uint(),Career::uint()) ->boolean().
exchangeDeal(SourceID, ExchangeCount,ID,ItemID,ItemNumber,PayItemList,MustPlayerLevel,MaxCount4Day,MaxCount,PlayerLevel,Quality,Career) ->
	CurPlayerLevel = playerState:getLevel(),
	CurPlayerCareer = playerState:getCareer(),
	
	{RealExchangeCount,RealEquipQuality} =
		case ItemID < ?Item_Differentiate of
			true ->	{ExchangeCount,0};
			false ->{1,Quality}
		end,
	RealExchangeItemCount = RealExchangeCount*ItemNumber,
	{IsNotLimit,SurplusCount} = isNotLimit(ID, RealExchangeCount,MaxCount4Day,MaxCount),
	IsCanPay = isCanPay(PayItemList, RealExchangeCount),
	LevelCheck = CurPlayerLevel >= MustPlayerLevel andalso CurPlayerLevel >= PlayerLevel,
	CareerCheck = case Career of
					  undefined ->
						  true;
		              [0] ->
			              true;
					  _ when is_list(Career)->
						  lists:member(CurPlayerCareer,Career);
					  _ ->
						  false
	              end,
	
	Continue = LevelCheck andalso IsCanPay andalso IsNotLimit andalso CareerCheck,
	case Continue of
		true ->
			Plog = #recPLogTSItem{
								  old = 0,
								  new = RealExchangeItemCount,
								  change = RealExchangeItemCount,
								  target = ?PLogTS_PlayerSelf,
								  source = ?PLogTS_ResourceExchange,
								  gold = 0,
								  goldtype = 0,
								  changReason = ?ItemSourceExchange,
								  reasonParam = SourceID
								 },

%%			case isPackageIdle() of
%%				true ->
			setLimitFlag(ID, RealExchangeCount,MaxCount4Day,MaxCount),
			%%不检查操作状态，上面已经查过是否有交易能力
			lists:foreach(fun({PayItemID,PayItemNum}) ->
				deductItem(PayItemID,erlang:round(PayItemNum* RealExchangeCount),ItemID)
			              end, PayItemList),
			sendExchangeResultMessage(SourceID, SurplusCount),
			?LOG_OUT("exchangeDeal playerID:~p itemID:~p,num:~p,quality:~p",[playerState:getRoleID(),
				ItemID, RealExchangeItemCount, RealEquipQuality]),
			playerPackage:addGoodsAndMail(ItemID,erlang:trunc(RealExchangeItemCount), false, RealEquipQuality, Plog),
			playerTask:updateTask(?TaskSubType_System, ?TaskSubType_System_Sub_Tinker, RealEquipQuality),
			true;
%%				_ ->
%%					 背包格子小于五个，请先清理背包
%%					playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialBagIsAmostFullGeneral),
%%					false
%%			end;
		_ when LevelCheck ==false  ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagResourceExchangeFailedLevel),
			false;
		_ when IsCanPay ==false  ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagResourceExchangeFailedCanPay),
			false;
		_ when IsNotLimit ==false  ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagResourceExchangeFailedLimit),
			false;
		_ when CareerCheck ==false  ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagResourceExchangeFailedCareer),
			false;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagResourceExchangeFailed),
			false
	end.

%%所有背包不得少于5个
-spec isPackageIdle() -> boolean().
isPackageIdle() ->
	playerPackage:getBagIdleSlotNum(?Item_Location_Bag) >= 5 andalso
		playerPackage:getBagIdleSlotNum(?Item_Location_Equip_Bag) >= 5 andalso
		playerPackage:getBagIdleSlotNum(?Item_Location_Gem_Bag) >= 5.

%%兑换财力检查(满足所有的且条件才为true)
-spec isCanPay( PayItemList, Count ) ->boolean()
		  when PayItemList::[{PayItemID::integer(),PayItemNum::uint32()}],
				Count::uint32().
isCanPay(PayItemList,Count) ->
	CanPayCheckList = 
		lists:foldl(fun
					   ({PayItemID,PayItemNum},Acc) ->
							S = checkItemCanPay(PayItemID,erlang:round(PayItemNum*Count)),
							[S|Acc];
					   (Other,Acc) ->
							?ERROR_OUT("resourceExchange2,error[~w],playerPid[~w]",[Other,self()]),
							[false|Acc]
					end,[], PayItemList),
	%%都没有false
	not ( lists:member(false, CanPayCheckList) ).

%%兑换上限检查（日限，终身限/-1为不限）配置表中两种方式只能选其一(互斥)
-spec isNotLimit(ID::uint32(),Count::uint32(),MaxCount4Day::uint32(),MaxCount::uint32()) 
		->{IsNotLimit::boolean(),Surplus::integer()}.
isNotLimit(ID,Count,MaxCount4Day,MaxCount) ->
	DayLimit = MaxCount4Day =:= -1,
	ForeverLimit = MaxCount =:= -1,
	NoLimit = DayLimit andalso ForeverLimit,
	
	case NoLimit of
		true ->{true,-1};
		false when (not DayLimit) ->
			%% 日限
			DailyCounter = playerDaily:getDailyCounter(?DailyType_ResourceExchange, ID),
			SurplusCounter = MaxCount4Day - DailyCounter,
			{SurplusCounter >= Count,SurplusCounter - Count};
		false when (not ForeverLimit) ->
			%% 终身限
			DoneNum = 
				case edb:dirtyReadRecord(rec_sourceshop_forever_limit, {playerState:getRoleID(),?Rec_sourceshop_forever_limit_Type} ) of
					[#rec_sourceshop_forever_limit{
												   sourceshopIDList=LBinStr
												  }|_] ->
														 LStr = misc:binToString(LBinStr),
														 L = misc:string_to_term(LStr),
														 DoneItmeList = [E || E <- L,E=:= ID],
														 erlang:length(DoneItmeList);
					[] ->
						0
				end,
			SurplusCounter = MaxCount - DoneNum,
			{SurplusCounter>=Count,SurplusCounter - Count}
	end.

%%限兑标记设置（日限，终身限/-1为不限）配置表中两种方式只能选其一(互斥)
-spec setLimitFlag(ID::uint32(),Count::uint32(),MaxCount4Day::uint32(),MaxCount::uint32()) ->ok.
setLimitFlag(ID,Count,MaxCount4Day,MaxCount) ->
	case MaxCount4Day > 0 of
		true ->
			playerDaily:addDailyCounter(?DailyType_ResourceExchange, ID, Count);
		false when MaxCount>0 ->
			IDs = lists:duplicate(Count,ID),
			PlayerID = playerState:getRoleID(),
			case edb:dirtyReadRecord(rec_sourceshop_forever_limit, {PlayerID,?Rec_sourceshop_forever_limit_Type} ) of
				[#rec_sourceshop_forever_limit{sourceshopIDList=LBinStr}|_] ->
					SaveIDS1 = misc:string_to_term( misc:binToString(LBinStr) ),
					SaveIDS = SaveIDS1 ++IDs,
					NewRec = #rec_sourceshop_forever_limit{
														   roleID = {PlayerID,?Rec_sourceshop_forever_limit_Type},
														   type = ?Rec_sourceshop_forever_limit_Type,
														   sourceshopIDList = misc:term_to_string(SaveIDS)
														  },
					edb:writeRecord(update_rec_sourceshop_forever_limit,NewRec),
					edb:writeRecord(rec_sourceshop_forever_limit, NewRec),
					ok;
				[] ->
					NewRec = #rec_sourceshop_forever_limit{
														   roleID = {PlayerID,?Rec_sourceshop_forever_limit_Type},
														   type = ?Rec_sourceshop_forever_limit_Type,
														   sourceshopIDList = misc:term_to_string(IDs)
														  },
					edb:writeRecord(new_rec_sourceshop_forever_limit,NewRec),
					edb:writeRecord(rec_sourceshop_forever_limit, NewRec),
					ok
			end,
			?LOG_OUT("rec_sourceshop_forever_limit roleid:~p type=~p NewRec:~p additem:~p",[PlayerID,
																							?Rec_sourceshop_forever_limit_Type,
																							NewRec#rec_sourceshop_forever_limit.sourceshopIDList,
																							IDs]),
			ok;
		false ->
			skip
	end.

%%取出已经参与了终身限兑的配置id
-spec getMyHasForeverLimitID() ->[uint32()].
getMyHasForeverLimitID() ->
	getMyHasForeverLimitID(?Rec_sourceshop_forever_limit_Type).

-spec getMyHasForeverLimitID(Type::uint32()) ->[uint32()].
getMyHasForeverLimitID(Type) ->
	PlayerID = playerState:getRoleID(),
	case edb:dirtyReadRecord(rec_sourceshop_forever_limit, {PlayerID,Type} ) of
		[#rec_sourceshop_forever_limit{sourceshopIDList=LBinStr}|_] ->
			SaveIDS1 = misc:string_to_term( misc:binToString(LBinStr) ),
			SaveIDS1;
		[] ->
			[]
	end.

%%设置参与了终身限购的id
-spec setMyHasForeverLimitID( IDs::[int32()],Type::uint32() ) ->ok.
setMyHasForeverLimitID(IDs,Type) ->
	PlayerID = playerState:getRoleID(),
	case edb:dirtyReadRecord(rec_sourceshop_forever_limit, {PlayerID,Type} ) of
		[#rec_sourceshop_forever_limit{sourceshopIDList=LBinStr}|_] ->
			SaveIDS1 = misc:string_to_term( misc:binToString(LBinStr) ),
			SaveIDS = SaveIDS1 ++IDs,
			NewRec = #rec_sourceshop_forever_limit{
												   roleID = {PlayerID,Type},
												   type = Type,
												   sourceshopIDList = misc:term_to_string(SaveIDS)
												  },
			edb:writeRecord(update_rec_sourceshop_forever_limit,NewRec),
			edb:writeRecord(rec_sourceshop_forever_limit, NewRec),
			ok;
		[] ->
			NewRec = #rec_sourceshop_forever_limit{
												   roleID = {PlayerID,Type},
												   type = Type,
												   sourceshopIDList = misc:term_to_string(IDs)
												  },
			edb:writeRecord(new_rec_sourceshop_forever_limit,NewRec),
			edb:writeRecord(rec_sourceshop_forever_limit, NewRec),
			ok
	end,
	?LOG_OUT("setMyHasForeverLimitID roleid:~p type=~p NewRec:~p additem:~p",[PlayerID,
																					Type,
																					NewRec#rec_sourceshop_forever_limit.sourceshopIDList,
																					IDs]),
	ok.

%%发送兑换结果消息
-spec sendExchangeResultMessage(ID, SurplusCount) -> ok 
	when ID::uint(), SurplusCount::uint().
sendExchangeResultMessage(ID, SurplusCount) ->
	playerMsg:sendNetMsg(#pk_GS2U_ExchangeResult{id = ID, itemCount = SurplusCount}),
	ok.

-spec checkItemCanPay(ItemID::integer(),Num::integer()) -> boolean().
checkItemCanPay(ItemID,Num) when ItemID<0, erlang:is_integer(Num),erlang:abs(ItemID) =:= ?CoinTypeGold ->
	%%itemID为负数，表示绝对值的货币类型(配置的金币)优先使用绑定金币，绑定金币不足再使用非绑定金币
	GoldenEssence = playerState:getCoin(?CoinTypeGold),
	GoldenEssence >= Num;
checkItemCanPay(ItemID,Num) when ItemID<0 andalso erlang:is_integer(Num) andalso erlang:abs(ItemID) =:= ?CoinTypeDiamond ->
	GoldenEssence = playerState:getCoin(?CoinTypeDiamond),
	GoldenEssence >= Num;
checkItemCanPay(ItemID,Num) when ItemID<0 andalso erlang:is_integer(Num) andalso erlang:abs(ItemID) =:= ?CoinTypeBindDiamond ->
	GoldenEssence = playerState:getCoin(?CoinTypeBindDiamond) + playerState:getCoin(?CoinTypeDiamond),
	GoldenEssence >= Num;
checkItemCanPay(ItemID,Num) when ItemID<0, erlang:is_integer(Num)->
	%%itemID为负数，表示绝对值的货币类型
	Coin = erlang:abs(ItemID),
	GoldenEssence = playerState:getCoin(Coin),
	GoldenEssence >= Num;
checkItemCanPay(ItemID,Num) when erlang:is_integer(Num) andalso ItemID > 0->
	%%item表的物品id
	PayItemType = playerPackage:getItemType(ItemID),
	PacketType = playerPackage:getPackageType(PayItemType),
	PlayerPackageItemNum = playerPackage:getGoodsNumByID(PacketType, ItemID),
	?DEBUG_OUT("getItemNumByID item:~w num:[~w]",[ItemID,PlayerPackageItemNum]),
	PlayerPackageItemNum >= Num.

-spec deductItem(PayItemID::integer(),Num::integer(),ItemID::integer()) -> boolean().
deductItem(PayItemID,Num,ItemID) when PayItemID<0,erlang:is_integer(Num),erlang:abs(PayItemID) =:= ?CoinTypeGold ->
	%%PayItemID为负数，表示绝对值的货币类型
	playerMoney:decCoin(?CoinTypeGold, Num,
		#recPLogTSMoney{reason=?CoinUseEquipExchange,param=ItemID,target=?PLogTS_Shop,source=?PLogTS_PlayerSelf});
deductItem(PayItemID,Num,ItemID) when PayItemID<0,erlang:is_integer(Num),erlang:abs(PayItemID) =:= ?CoinTypeDiamond ->
	%%PayItemID为负数，表示绝对值的货币类型
	playerMoney:useCoin(?CoinUseTypeDiamondJustNotBind, Num,
		#recPLogTSMoney{reason=?CoinUseEquipExchange,param=ItemID,target=?PLogTS_Shop,source=?PLogTS_PlayerSelf});
deductItem(PayItemID,Num,ItemID) when PayItemID<0,erlang:is_integer(Num),erlang:abs(PayItemID) =:= ?CoinTypeBindDiamond ->
	%%PayItemID为负数，表示绝对值的货币类型
	playerMoney:useCoin(?CoinUseTypeDiamond, Num,
		#recPLogTSMoney{reason=?CoinUseEquipExchange,param=ItemID,target=?PLogTS_Shop,source=?PLogTS_PlayerSelf});
deductItem(PayItemID,Num,ItemID) when PayItemID<0,erlang:is_integer(Num) ->
	%%PayItemID为负数，表示绝对值的货币类型
	CoinType = erlang:abs(PayItemID),
	playerMoney:decCoin(CoinType, Num,
		#recPLogTSMoney{reason=?CoinUseEquipExchange,param=ItemID,target=?PLogTS_Shop,source=?PLogTS_PlayerSelf});
deductItem(PayItemID,Num,ItemID) when erlang:is_integer(Num) andalso PayItemID > 0->
	%%item表的物品id
	Plog = #recPLogTSItem{
		old = Num,
		new = 0,
		change = -Num,
		target = ?PLogTS_Shop,
		source = ?PLogTS_PlayerSelf,
		gold = 0,
		goldtype = 0,
		changReason = ?ItemDeleteReasonExchange,
		reasonParam = ItemID
	},
	PayItemType = playerPackage:getItemType(PayItemID),
	PacketType = playerPackage:getPackageType(PayItemType),
	playerPackage:delGoodsByID(PacketType, PayItemID, Num, Plog).

