%%商城模块
-module(playerMall).
-include("playerPrivate.hrl").

%%GS与客户端交互接口
-export([
		 requestMallInfo/2,				%%请求加载商城数据信息
		 mallBuyRequest/2				%%商城购买请求
%%		 mallBuy/6						%%购买的金钱判断
		 ]).

%%CS返回接口
-export([
		queryMallInfoAck/1,				%%CS返回玩家对商城的请求数据
		onMallBuySuccessAck/1			%%CS返回购买结果
		]).

%%查询商城道具信息 请求
requestMallInfo(Seed,SendType)->
	Role = playerState:getRoleID(),
	Level = playerState:getLevel(),
	Recharge = 0,
	psMgr:sendMsg2PS(?PsNameMall, queryMallList, {Role, Level, Recharge, Seed,SendType}),
	ok.

%%把请求的商城信息写入玩家信息中
-spec queryMallInfoAck(MsgList::list()) ->ok.
queryMallInfoAck([SendType,Type,Seed, [#pk_MallInfo{}|_] = MsgList])->
	Fun =  fun(X,Acc) ->
				   Count = playerDaily:getDailyCounter(?DailyType_MallDaily, X#pk_MallInfo.db_id),
				   LeftCount = X#pk_MallInfo.leftcount - Count,
				   case LeftCount of
%%					   Val when Val =< 0,Count>0 ->
%%						   Acc;
					   _ ->
						   ?DEBUG_OUT("mall id=~p, type=~p,left=~p",[X#pk_MallInfo.itemid, X#pk_MallInfo.mainmenu, X#pk_MallInfo.leftcount]),
						   [X#pk_MallInfo{leftcount = LeftCount } | Acc]
				   end
		   end,
	NewMsgList = lists:foldl(Fun, [], MsgList),
	sendMallListToClient(SendType,Type, Seed, NewMsgList),
	ok;
queryMallInfoAck(Ack)->
	?ERROR_OUT("playerMall queryMallInfoAck Error Param:~p",[Ack]),
	ok.

%%返回商城显示数据到客户端
-spec sendMallListToClient(SendType,Type, Seed, Msg) -> ok when SendType::uint(),Type::uint(),Seed::uint(),Msg::list().
sendMallListToClient(SendType, Type, Seed, Msg)->
	RealMsg = 
	case Type of
		?Type_YouH->
			%%优惠商品
			case SendType of
				?MallSendType_PushBuy ->
					#pk_GS2U_MallPriceList2{mallinfolist = Msg};
				_ ->
					#pk_GS2U_MallPriceList{mallinfolist = Msg}
			end;
		_->
			%%所有商品
			case SendType of
				?MallSendType_PushBuy ->
					#pk_GS2U_MallInfoList2{seed = Seed, mallinfolist = Msg};
				_ ->
					#pk_GS2U_MallInfoList{seed = Seed, mallinfolist = Msg}
			end
	end,
	playerMsg:sendNetMsg(RealMsg),
	ok.

%%商城购买请求 
%%-spec mallBuyRequest(PK::#pk_U2GS_ItemBuyRequest{},SendType::uint()) -> ok.
mallBuyRequest(#pk_U2GS_ItemBuyRequest2{db_id = Db_id, itemid = ItemId, itemnum = ItemNum, moneytype = MoneyType}, SendType) ->
	Msg = #pk_U2GS_ItemBuyRequest{tarRoleID = 0, db_id = Db_id, itemid = ItemId, itemnum = ItemNum, moneytype = MoneyType},
	mallBuyRequest(Msg, SendType);

mallBuyRequest(#pk_U2GS_ItemBuyRequest{tarRoleID = TarRoleID, db_id = Db_id, itemid = ItemId, itemnum = ItemNum, moneytype = MoneyType},SendType) ->
	%%发给CS处理
	RoleID = playerState:getRoleID(),
	CoinTypeDiamondNum = playerState:getCoin(?CoinTypeDiamond),
	CoinTypeBindDiamondNum = playerState:getCoin(?CoinTypeBindDiamond),
	CoinTypeScoreNum = playerState:getCoin(?CoinTypeScore),
	MallDaily = playerDaily:getDailyCounter(?DailyType_MallDaily, Db_id),
	{ErrorCode,CanBuyCount,ReturnItem,ReturnRebate,LimitType} = psMgr:call(?PsNameMall, onMallBuyRequest,
																 #recCallBuyArgs{
																				 roleID=RoleID, 
																				 db_id=Db_id, 
																				 itemNum=ItemNum,
																				 coinTypeDiamondNum=CoinTypeDiamondNum,
																				 coinTypeBindDiamondNum=CoinTypeBindDiamondNum,
																				 coinTypeScoreNum=CoinTypeScoreNum,
																				 useCoinType=MoneyType,
																				 db_idDayCouter=MallDaily
																				},
																 ?Start_Link_TimeOut_ms),
	RealBuyCount = 
	case ErrorCode of
		?ErrorCode_MallBuy_Succ ->
			case LimitType of
				?LimitType_3 ->
					playerDaily:addDailyCounter(?DailyType_MallDaily, Db_id, ItemNum);
				_ ->
					skip
			end,
			mallBuy(TarRoleID, ReturnItem, ItemId, CanBuyCount, ReturnRebate, MoneyType);
		_ ->
			playerMsg:sendErrorCodeMsg(ErrorCode),
			0
	end,
	RMsg = 
		case SendType of
			?MallSendType_PushBuy ->
				#pk_GS2U_MallBuyResult2{db_id=Db_id, buyCount=RealBuyCount };
			_ ->
				#pk_GS2U_MallBuyResult{db_id=Db_id, buyCount=RealBuyCount }
		end,
	playerMsg:sendNetMsg(RMsg),
	ok.

%%获取金钱
getMoney(MoneyNum)->
	case MoneyNum < 1 of
		true->
			1;
		false->
			MoneyNum
	end.
	
%%判定金钱够不够
-spec mallBuy(TarRoleID, MallInfo, ItemID, ItemNum, Rebate, MoneyType) -> uint()
	when TarRoleID::uint64(), MallInfo::#recSaveMall{}, ItemID::uint(),ItemNum::uint(), Rebate::uint(), MoneyType::uint().
mallBuy(TarRoleID, #recSaveMall{itemID=ItemID,dbID = Db_id, diamond = Gold, bindDiamond = Bind_gold, useIntegral = Use_integral}, _ItemIDMsg, ItemNum, Rebate, MoneyType) when ItemNum > 0->
	
	case MoneyType of
		?CoinTypeDiamond ->
			N = erlang:trunc( (Rebate / 100) *Gold ),
			GoldSellPrice = getMoney( N* ItemNum),
			case playerState:getCoin(?CoinTypeDiamond) >= GoldSellPrice andalso Gold > ?DEFULT_VALUE_1 of
				true->
					mallBuy1(TarRoleID, ?CoinTypeDiamond, GoldSellPrice, ItemID, ItemNum, Db_id);
				false->
					playerMsg:sendErrorCodeMsg(?ErrorCode_MallBuy_Diamond_Not_Enough),
					0
			end;
		?CoinTypeBindDiamond ->
			N = erlang:trunc( (Rebate / 100) *Bind_gold ),
			BGoldSellPrice = getMoney(N* ItemNum),
			case playerState:getCoin(?CoinTypeBindDiamond) >= BGoldSellPrice andalso Bind_gold > ?DEFULT_VALUE_1 of
				true->
					mallBuy1(TarRoleID, ?CoinTypeBindDiamond, BGoldSellPrice, ItemID, ItemNum, Db_id);
				false->
					playerMsg:sendErrorCodeMsg(?ErrorCode_MallBuy_BindDiamond_Not_Enough),
					0
			end;
		?CoinTypeScore ->
			N = erlang:trunc( (Rebate / 100) *Use_integral ),
			ScoreSellPrice = getMoney(N* ItemNum),
			case playerState:getCoin(?CoinTypeScore) >= ScoreSellPrice andalso Use_integral > ?DEFULT_VALUE_1 of
				true->
					mallBuy1(TarRoleID,?CoinTypeScore, ScoreSellPrice, ItemID, ItemNum, Db_id);
				false->
					playerMsg:sendErrorCodeMsg(?ErrorCode_MallBuy_Integral_Not_Enough),
					0
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_MallBuy_failed),
			0
	end.

%%添加道具+扣钱+购买赠送处理
-spec mallBuy1(TarRoleID, MoneyType, MoneyNum, ItemId, ItemNum, Db_id) -> uint()
	when TarRoleID::uint64(), MoneyType::uint(), MoneyNum::uint(), ItemNum::uint(), ItemId::uint(), Db_id::uint().
mallBuy1(TarRoleID, MoneyType, MoneyNum, ItemId, ItemNum, Db_id) ->
	case MoneyType >= ?CoinTypeMin andalso MoneyType =< ?CoinTypeMax of
		true ->
			%%保存购买记录
			saveMallBuyLog(ItemId, ItemNum, MoneyType, MoneyNum),
			%%本函数为内部函数，在调用本函数之前已经判定过货币是否足够，所以这里直接扣
			true = playerMoney:decCoin(MoneyType,MoneyNum,
				#recPLogTSMoney{reason=?CoinUseMall,param={ItemId,ItemNum},target=?PLogTS_Mall,source=?PLogTS_PlayerSelf}),
			playerSevenDays:onMissionEvent(?SevenDayMission_Event_7,MoneyNum, MoneyType),
			%%会发邮件，不会背包格子不够失败
			mallAddGoods(TarRoleID, MoneyType, MoneyNum, ItemId, ItemNum),
			%%通知CS处理购买赠送
			psMgr:sendMsg2PS(?PsNameMall, onMallBuySuccess, {playerState:getRoleID(), Db_id, MoneyType, ItemId, ItemNum}),
			ItemNum;
		_ ->
			?ERROR_OUT("roleid:~p playerMall buy send error money type:~p,MoneyNum:~p",[playerState:getRoleID(), MoneyType, MoneyNum]),
			0
	end.
	
%%添加商品到背包
-spec mallAddGoods(TarRoleID, MoneyType, MoneyNum, GoodsID, GoodsNum) -> [#rec_item{},...] | [#recSaveEquip{},...] | [] when
	TarRoleID::uint64(),MoneyType::uint(), MoneyNum::uint(), GoodsID::uint(), GoodsNum::uint().
mallAddGoods(TargetRoleID, MoneyType, MoneyNum, GoodsID, GoodsNum) ->
	case TargetRoleID > 0 of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_MallBuy_Send_Iteam),
			case playerMail:createMailGoods(GoodsID, GoodsNum, false, 0, TargetRoleID, ?ItemSourceMall) of
				[#recMailItem{}|_] = MailItemList ->
					Title = stringCfg:getString(mall_give_mail_title),
					Content = stringCfg:getString(mall_give_mail_Content, [playerState:getName()]),
					mail:sendSystemMail(TargetRoleID, Title, Content, MailItemList, "");
				_ ->
					?ERROR_OUT("role[~p] buy[~p,~p] to[~p]",
						[playerState:getRoleID(), GoodsID, GoodsNum, TargetRoleID])
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_MallBuy_Succ),
			PLog = #recPLogTSItem{
				old = 0,
				new = GoodsNum,
				change = GoodsNum,
				target = ?PLogTS_PlayerSelf,
				source = ?PLogTS_Mall,
				gold = MoneyNum,
				goldtype = MoneyType,
				changReason = ?ItemSourceMall,
				reasonParam = GoodsID
			},
			case MoneyType of
				?CoinTypeDiamond->
					playerPackage:addGoodsAndMail(GoodsID, GoodsNum, false, 0, PLog);
				?CoinTypeBindDiamond->
					playerPackage:addGoodsAndMail(GoodsID, GoodsNum, true, 0, PLog);
				_->%%其它的暂定为绑定，邮策划商定
					playerPackage:addGoodsAndMail(GoodsID, GoodsNum, true, 0, PLog)
			end
	end.

%%CS返回需赠送道具或者积分情况
-spec onMallBuySuccessAck(SucRet::tuple()) -> ok.
onMallBuySuccessAck(SucRet) ->
	case SucRet of
		{true, GoodsID, {AllSendNum,GoodsNum}, GetScore,_MoneyType}->
			%%商城不会买同一种itemid
			Count = playerDaily:getDailyCounter(?DailyType_MallDailySend, GoodsID),
			RealSend = 
				case AllSendNum - Count of
					Val when erlang:is_integer(GoodsNum),Val >= GoodsNum ->
						GoodsNum;
					Val when erlang:is_integer(GoodsNum),Val < GoodsNum ->
						Val;
					_ ->
						0
				end,
			?LOG_OUT("mall send args roleid:~p dayCount:~p,SendNum:~p allSendNumLimit:~p GetScore:~p",[playerState:getRoleID(),Count,GoodsNum,AllSendNum,GetScore]),
			%%送道具
			case GoodsID > 0 andalso GoodsNum > 0 of
				true when RealSend > 0 ->
					
					playerDaily:incCounter(?DailyType_MallDailySend, GoodsID, Count + RealSend),
					Plog = #recPLogTSItem{
						old = 0,
						new = RealSend,
						change = RealSend,
						target = ?PLogTS_PlayerSelf,
						source = ?PLogTS_Mall,
						gold = 0,
						goldtype = 0,
						changReason = ?ItemSourceBuySend,
						reasonParam = 0
					},
					playerPackage:addGoodsAndMail(GoodsID, RealSend, true, 0, Plog);
				true ->
					ok;
				_->
					ok
			end,
			%%添加积分
			case GetScore > 0 of
				true->
					playerMoney:addCoin(?CoinTypeScore, GetScore,
						#recPLogTSMoney{reason=?CoinSourceMallSend,param=GoodsID,target=?PLogTS_PlayerSelf,source=?PLogTS_Mall});
				false->
					ok
			end;
		_->
			ok
	end,
	ok.

%%保存玩家在商城的购买记录
-spec saveMallBuyLog(ItemId, ItemNum, MoneyType, MoneyNum) ->ok
	when ItemId::uint(), ItemNum::uint(), MoneyType::uint(), MoneyNum::uint().
saveMallBuyLog(ItemId, ItemNum, MoneyType, MoneyNum) ->
	dbLog:sendSaveLogMallBuy(
	  								playerState:getRoleID(),
									ItemId, 
									ItemNum, 
									MoneyType, 
									MoneyNum
								  ),
	ok.
