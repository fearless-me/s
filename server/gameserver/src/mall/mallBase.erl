-module(mallBase).

-include("gsInc.hrl").

-export([
	changeMallInfoToCS/1,
	onMallInit/1,
	onLimitMallInit/1,
	saveMallToSqlAndEts/3,
	delMallItem/1,
	queryMallList/4,
	onMallBuyRequest/8,
	onMallBuySuccess/5,
	makeMallList/2,
	saveToMallSql/1,
	saveToMallLogSql/1,
	saveLimitMall/1,
	deleteRoleMemData/1
]).

%%GM设置接口
-export([
	mallsetlimitbuy/5,
	mallsetbuysend/1,
	mallsetbuytime/1,
	mallsetrebate/4
]).

%%平台设置接口
-export([
	malladdnewitem/1,
	malldelitem/1,
	endRebate/1,
	gmSetMallInfo/1
]).

-export([incMallSeed/0]).


%%初始化加载数据库数据
-spec onMallInit(MallList::list()) -> tuple().
onMallInit(MallList) ->
	State = #mallState{
					   mallItemEts = mallItemTable, 
					   mallSeed = 1
					  },
	Mall = changeMallInfoToCS(MallList),
	case Mall of
		[]->
			?ERROR_OUT("mallBase onMallInit info failed");
		_->
			Fun = fun(Record) ->
						  ets:insert(?MallItemTableEts, Record)
				  end,
			lists:foreach(Fun, Mall)
	end,
	showMallEts(),
	{ok, State}.

incMallSeed() ->
	Seed = getMallSeed(),
	put(mallSeed,Seed + 1),
	ok.

getMallSeed() ->
	case get(mallSeed) of
		undefined ->
			%%由于客户端默认为0，第一次时需要全部发送给客户端，所以需要设置为一个大于客户端默认值的值
			1;
		N ->
			N
	end.

%%打出mallets表
showMallEts() ->
%%	L = ets:tab2list(?MallItemTableEts),
	?LOG_OUT("Mall ets's size ~p", [myEts:getCount(?MallItemTableEts)]),
%%	Fun = fun(Mall) ->
%%		?DEBUG_OUT("mall item:~w", [Mall]),
%%		ok
%%	end,
%%	lists:foreach(Fun, L),
	ok.

%%初始化限购数据
-spec onLimitMallInit(MallLimitList::list()) ->ok.
onLimitMallInit([])->
	setLimitInfo([]),
	ok;
onLimitMallInit([#recSaveLimitMall{}|_] = MallLimitList) ->
	setLimitInfo(MallLimitList),
	ok.

%%组装数据到CS
-spec changeMallInfoToCS(MallList::list()) -> list().
changeMallInfoToCS(MallList) ->
	case MallList of
		[#recSaveMall{}|_]->
			MallList;
		_->%%为空，从配置表中读取
 			getMallByCfg()
	end.

%%从配置文件读取商城数据并写入数据库和内存
-spec getMallByCfg() -> list(). 
getMallByCfg() ->
	List = getCfg:getKeyList(cfg_mall),
	Fun = fun({Key1,Key2}, MallInfoRet) ->
			MallInfo = getCfg:getCfgPStack(cfg_mall, Key1,Key2),
			case MallInfo of
				#mallCfg{}->
					Now = time:getUTCNowSec(),
					Msg = #recSaveMall{
									 dbID = erlang:list_to_integer(erlang:integer_to_list(MallInfo#mallCfg.item_id) ++ 
										     erlang:integer_to_list(MallInfo#mallCfg.type) ++ 
											 erlang:integer_to_list(MallInfo#mallCfg.type1)),
									 itemID = MallInfo#mallCfg.item_id,
									 sort = MallInfo#mallCfg.sort,
									 type = MallInfo#mallCfg.type,
									 type1 = MallInfo#mallCfg.type1,
									 diamond = MallInfo#mallCfg.gold,
									 bindDiamond = MallInfo#mallCfg.bind_gold,
									 useIntegral = MallInfo#mallCfg.use_integral,
									 getIntegral = MallInfo#mallCfg.get_integral,
									 limitBuy = MallInfo#mallCfg.limit_buy,
									 limit_day = MallInfo#mallCfg.limit_day,
									 limitType = MallInfo#mallCfg.limit_type,
									 limitBeginTime = Now,
									 limitEndTime = Now+3600*24*365,
									 buyReset = MallInfo#mallCfg.buy_reset,
									 level = MallInfo#mallCfg.level,
									 recharge = MallInfo#mallCfg.recharge,
									 isHide = MallInfo#mallCfg.ishide,
									 beginTime = ?DEFULT_VALUE_1,
									 endTime = ?DEFULT_VALUE_1,
									 rebate = ?DEFULT_VALUE_2,
									 rebateBeginTime = ?DEFULT_VALUE_1,
									 rebateEndTime = ?DEFULT_VALUE_1,
									 showType = MallInfo#mallCfg.showtype,
									 buySendItem = ?DEFULT_VALUE_1,
									 buySendNum = ?DEFULT_VALUE_1,
									 buySendLimit = ?DEFULT_VALUE_1,
									 buySendBeginTime = ?DEFULT_VALUE_1,
									 buySendEndTime = ?DEFULT_VALUE_1
						},
					saveToMallSql(Msg),
					saveToMallLogSql(Msg),
					[Msg | MallInfoRet];
				_->
					MallInfoRet
			end
		end,
	lists:foldl(Fun, [], List).

%%获得数据并返回GS
-spec queryMallList(RoleID, Level, Recharge, Seed)-> list()
	when RoleID::uint(), Level::uint(), Recharge::uint(), Seed::uint().
queryMallList(RoleID, Level, _Recharge, Seed)->
	MallSeed = getMallSeed(),
	?DEBUG_OUT("queryMallList requestSeed:~p,oldSeed:~p  ~p",[Seed, MallSeed,{RoleID, Level}]),
	%%获取商城信息发数据到GS
	Fun = fun(#recSaveMall{type = Type} = Mallbaseinfo, MallRet) ->
		NewInfo = isReachLevel(RoleID, Mallbaseinfo, Seed, Type, _Recharge, Level),
		case NewInfo of
			#pk_MallInfo{}->
				[NewInfo | MallRet];
			_->
				MallRet
		end
	end,
	
	RetInfo =
		case Seed =:= MallSeed of
			true ->
				%%只更新优惠商品
				[?Type_YouH, Seed, ets:foldl(Fun, [], ?MallItemTableEts)];

			false ->
				%%更新所有商品
				[?Type_All, MallSeed, ets:foldl(Fun, [], ?MallItemTableEts)]
		end,
	?DEBUG_OUT("=========~p",[RetInfo]),
	RetInfo.

%%等级判断
isReachLevel(RoleID, Mallbaseinfo, Seed, Type, Recharge, Level) ->
	case Mallbaseinfo#recSaveMall.level =< Level of	%%等级达到
		true ->
			isReachRecharge(RoleID, Mallbaseinfo, Seed, Type, Recharge);
		false ->
			{}
	end.

%%充值判断
isReachRecharge(RoleID, Mallbaseinfo, Seed, Type, _Recharge2) ->
	Recharge = rechargeLogic:getRoleRechargeAmount(RoleID,0,time:getUTCNowSec()),
	case  Mallbaseinfo#recSaveMall.recharge =< Recharge of	%%充值达到
		true ->
			isHide(RoleID, Mallbaseinfo, Seed, Type);
		false ->
			{}
	end.

%%是否隐藏 0为隐藏  1为显示
isHide(RoleID, Mallbaseinfo, Seed, Type) ->
	case Mallbaseinfo#recSaveMall.isHide =:= 1 of	%%1 不隐藏
		true ->
			isInOnTime(RoleID, Mallbaseinfo, Seed, Type);
		false ->
			{}
	end.

%%判断是否在上架时间内  =< 0表示不限制
isInOnTime(RoleID, Mallbaseinfo, Seed, Type) ->
	Now = time:getUTCNowSec(),
	case (Mallbaseinfo#recSaveMall.beginTime =< Now andalso Mallbaseinfo#recSaveMall.endTime >= Now) orelse Mallbaseinfo#recSaveMall.beginTime =< ?DEFULT_VALUE_1 of
		true ->
			isOnSale(RoleID, Mallbaseinfo, Seed, Type);
		false ->
			{}
	end.

%%显示判断 优惠|全部
isOnSale(RoleID, Mallbaseinfo, Seed, Type) ->
	
	NowSec = time:getUTCNowSec(),
	Rebate = 
		case  (Mallbaseinfo#recSaveMall.rebateBeginTime == 0 orelse Mallbaseinfo#recSaveMall.rebateBeginTime =< NowSec)
				  andalso 
				  (Mallbaseinfo#recSaveMall.rebateEndTime == 0 orelse Mallbaseinfo#recSaveMall.rebateEndTime >= NowSec) of
			true ->
				Mallbaseinfo#recSaveMall.rebate;
			false ->
				%%不打折
				100
		end,
	MallbaseinfoArg = Mallbaseinfo#recSaveMall{rebate=Rebate},
	
	case Seed =:= getMallSeed() of	%%判定更新所有还是只更新优惠商品
		true ->
			%%优惠商品
			case Type of
				%%挑出优惠商品并组装
				?Type_YouH ->
					isShowLimitItem(RoleID, MallbaseinfoArg);
				_ ->
					{}
			end;
		false ->
			%%所有商品
			isShowLimitItem(RoleID, MallbaseinfoArg)
	end.

%%判断限购商品显示与否  鸭蛋说不能买了就不显示了
-spec isShowLimitItem(RoleID::uint64(), Mallbaseinfo::#recSaveMall{}) ->term().
isShowLimitItem(RoleID, Mallbaseinfo) ->
	LeftCount = getLeftCount(RoleID, Mallbaseinfo),
	?DEBUG_OUT("zzc===LeftTime======[~w] ~p",[LeftCount,{RoleID, Mallbaseinfo#recSaveMall.limitType}]),
%%	case Mallbaseinfo#recSaveMall.limitType =/= ?Nolimit of
%%		true when LeftCount < 1,Mallbaseinfo#recSaveMall.limitType =/= ?LimitType_3 ->
%%			{};
%%		_ ->
			makeMallList(LeftCount, Mallbaseinfo).
%%	end.

%%组装返回给客户端的数据
-spec makeMallList(LeftCount::uint(), Mallbaseinfo::#recSaveMall{}) -> #pk_MallInfo{}.
makeMallList(LeftCount, Mallbaseinfo)->
	LeftTime = getLeftTime(Mallbaseinfo#recSaveMall.endTime),
	LeftCountMax =
		case Mallbaseinfo#recSaveMall.limitBuy > 0 of
			true ->
				Mallbaseinfo#recSaveMall.limitBuy;
			_ ->
				Mallbaseinfo#recSaveMall.limit_day
		end,
	#pk_MallInfo{db_id = Mallbaseinfo#recSaveMall.dbID,
				 itemid = Mallbaseinfo#recSaveMall.itemID, 
				 mainmenu = Mallbaseinfo#recSaveMall.type,
				 buyNumDefalut = Mallbaseinfo#recSaveMall.buyDefaultNum,
				 submenu = Mallbaseinfo#recSaveMall.type1, 
				 gold = Mallbaseinfo#recSaveMall.diamond, 
				 bind_gold = Mallbaseinfo#recSaveMall.bindDiamond, 
				 use_integral = Mallbaseinfo#recSaveMall.useIntegral, 
				 get_integral = Mallbaseinfo#recSaveMall.getIntegral, 
				 lefttime = LeftTime,
				 leftcount = LeftCount,
				 leftcountMax = LeftCountMax,
				 sortNumber = Mallbaseinfo#recSaveMall.sort,
				 rebate =  Mallbaseinfo#recSaveMall.rebate, 
				 showtype =  Mallbaseinfo#recSaveMall.showType,
				 limitType = Mallbaseinfo#recSaveMall.limitType
				}.
	
	
%%取限购剩余次数给客户端
-spec getLeftCount(RoleID::uint(), Mallbaseinfo::#recSaveMall{}) -> uint().
getLeftCount(RoleID, #recSaveMall{dbID = Db_id, limitBuy = LimitBuy,limit_day=LimitDay, limitType = LimitType, limitBeginTime = BeginTime, limitEndTime = EndTime}) ->
	case LimitType of
		?LimitType_1->
			%%每人限购
			?DEBUG_OUT("======每人限购=====~w  ~w",[LimitBuy ,getLimitBuyNum(RoleID, Db_id, BeginTime, EndTime)]),
			LimitBuy - getLimitBuyNum(RoleID, Db_id, BeginTime, EndTime);
		?LimitType_2->
			%%全服限购
			LimitBuy;
		?LimitType_3->
			%%每人每天限购
			LimitDay;
		_ ->
			?DEFULT_VALUE_1
	end.
	
%%返回结束倒计时
-spec getLeftTime(EndTime::uint()) -> uint().
getLeftTime(EndTime) ->
	Now = time:getUTCNowSec(),
	case EndTime of
		?DEFULT_VALUE_1->
			?DEFULT_VALUE_1;
		_->
			EndTime - Now
	end.

%%购买力检查
checkMoneyCanUse(UseMoneyType,
				 {CoinTypeDiamondNum,CoinTypeBindDiamondNum,CoinTypeScoreNum}=_has,
				 {DiamondNum,BindDiamondNum,ScoreNum}=_need) ->
	case UseMoneyType of
		?CoinTypeDiamond when DiamondNum > 0,CoinTypeDiamondNum>=DiamondNum ->
			true;
		?CoinTypeBindDiamond when BindDiamondNum>0,CoinTypeBindDiamondNum>=BindDiamondNum ->
			true;
		?CoinTypeScore when ScoreNum>0,CoinTypeScoreNum>=ScoreNum ->
			true;
		_ ->false
	end.

%%购买道具请求
-spec onMallBuyRequest(RoleID, Db_id, Buy_Num,CoinTypeDiamondNum,CoinTypeBindDiamondNum,CoinTypeScoreNum,MoneyType,MallDaily) -> tuple()
	when RoleID::uint(), Db_id::uint(), Buy_Num::uint(),CoinTypeDiamondNum::uint32(),CoinTypeBindDiamondNum::uint32(),CoinTypeScoreNum::uint32(),MoneyType::uint32(),MallDaily::uint32().
onMallBuyRequest(RoleID, Db_id, Buy_Num,CoinTypeDiamondNum,CoinTypeBindDiamondNum,CoinTypeScoreNum,MoneyType,MallDaily) ->
	ItemCfg = ets:lookup(?MallItemTableEts, Db_id),
	Now = time:getUTCNowSec(),
	case ItemCfg of
		[#recSaveMall{itemID = ItemID} = Item] ->
			Rebate = getRebate(Item),
			%%商品打折数是存的整数，如50表示50%
			UdgetRebate = Rebate/100,
			IsMoneyEnough = checkMoneyCanUse(MoneyType,{CoinTypeDiamondNum,CoinTypeBindDiamondNum,CoinTypeScoreNum},
										   {misc:ceil(Item#recSaveMall.diamond*UdgetRebate ) * Buy_Num,
											misc:ceil(Item#recSaveMall.bindDiamond*UdgetRebate ) * Buy_Num,
											misc:ceil(Item#recSaveMall.useIntegral*UdgetRebate ) * Buy_Num}),
			case Item#recSaveMall.endTime =< ?DEFULT_VALUE_1 orelse (Item#recSaveMall.beginTime =< Now andalso Item#recSaveMall.endTime > Now) of
				
				true when IsMoneyEnough ->
					
					CanBuyMaxNum = case getGoodsCfg(ItemID) of
									   #itemCfg{maxAmount = MaxPileNum} ->
										   MaxPileNum;
									   #equipmentCfg{} ->
										   1;
									   _ ->
										   0
								   end,
					case Buy_Num < 1 orelse Buy_Num > CanBuyMaxNum of
						true->
							{?ErrorCode_MallBuy_Error_Num, Buy_Num, Item, Rebate,undefined};	%%购买失败，购买范围在1-999
						false->
							if
								Item#recSaveMall.limitType =:= ?Nolimit ->%%无限购
									{?ErrorCode_MallBuy_Succ, Buy_Num, Item, Rebate,undefined};
								Item#recSaveMall.limitBeginTime =< Now andalso Item#recSaveMall.limitEndTime >= Now ->%%当前正在限购
									case limitBuy(RoleID, Db_id, Buy_Num,MallDaily, Item) of %%返回false表示限购数量剩余不足Buy_Num个
										false->
											{?ErrorCode_MallBuy_Item_Not_Enough, Buy_Num, Item, Rebate,undefined};
										_ ->
											%%可以买，已经检查玩家购买力，且是call过来的，置成功购买标志
											case Item#recSaveMall.limitBuy =/= ?Nolimit andalso Item#recSaveMall.limitBeginTime =< Now andalso Item#recSaveMall.limitEndTime >= Now of
												true when  Item#recSaveMall.limitType =:= ?LimitType_1 ->
													%%个人限购
													NewLimitRec = #recSaveLimitMall{dbID = Db_id, itemID = ItemID, roleID = RoleID, haveBuy = Buy_Num, time = Now},
													%%保存限购数据库表
													saveLimitMall(NewLimitRec);
												true when Item#recSaveMall.limitType =:=?LimitType_2 ->
													%%全服限购
													%%存入内存
													case ets:update_element(?MallItemTableEts, Db_id, {#recSaveMall.limitBuy, (Item#recSaveMall.limitBuy - Buy_Num) }) of
														true ->skip;
														_ ->?ERROR_OUT("player limit fail ~p",[RoleID])
													end,
													[NewRecord] = ets:lookup(?MallItemTableEts, Db_id),
													%%保存商城数据库表，修改限购个数
													gsSendMsg:sendMsg2DBServer(saveMallData, 0, NewRecord),
													ok;
												_ ->
													skip
											end,
											{?ErrorCode_MallBuy_Succ, Buy_Num, Item, Rebate,Item#recSaveMall.limitType}
									end;
								true->
									{?ErrorCode_MallBuy_Delay, Buy_Num, Item, Rebate,undefined}%%下架
							end
					end;
				true ->
					%%玩家传过来的购买力不足，失败
					{?ErrorCode_BuyItemErrorNoWealth, Buy_Num, ItemCfg, 100,undefined};
				false->
					{?ErrorCode_MallBuy_Delay, Buy_Num, Item, 100,undefined}%%下架
			end;
		_->
			{?ErrorCode_MallBuy_failed, Buy_Num, ItemCfg, 100,undefined}%%已下架或者不存在
	end.
%%获取折扣信息
getRebate(#recSaveMall{rebate = Rebate, rebateBeginTime = BeginTime,rebateEndTime = EndTime}) ->
	Now = time:getUTCNowSec(),
	case BeginTime =< Now andalso EndTime >= Now of
		true->
			Rebate;
		false->
			100
	end.

getGoodsCfg(GoodsID) ->
	if
		GoodsID > ?Item_Differentiate ->
			%% 装备道具
			getCfg:getCfgByArgs(cfg_equipment,GoodsID);
		GoodsID > 0 andalso GoodsID =< ?Item_Differentiate ->
			%% 普通道具
			getCfg:getCfgByArgs(cfg_item,GoodsID);
		true ->
			?ERROR_OUT("Error GoodsID[~p] in ~p:getGoodsCfg",[GoodsID,?MODULE]),
			throw("Error in getGoodsCfg")
	end.

%%限购判断
-spec limitBuy(RoleID::uint(), Db_id::uint(), Buy_Num::uint(),MallDaily::uint(), Item::#recSaveMall{}) -> boolean().
limitBuy(RoleID, Db_id, Buy_Num,MallDaily, #recSaveMall{limit_day = LimitDay,limitBuy = LimitBuy, limitType = LimitType, limitBeginTime = Begintime, limitEndTime = EndTime})->
	case LimitType of
		?LimitType_1->
			HaveBuyNum = getLimitBuyNum(RoleID, Db_id, Begintime, EndTime),
			LimitBuy - HaveBuyNum >= Buy_Num;
		?LimitType_2->
			LimitBuy >= Buy_Num;
		?LimitType_3->
			LimitDay - MallDaily >= Buy_Num;
		_->
			false
	end.

%%限购处理 返回已购买个数
getLimitBuyNum(RoleID, Db_id, Begintime, EndTime) ->
	%%取出已购买数据 没有唯一key，所以不好存ets
	LimitList = getLimitInfo(),
	case LimitList of
		undefined->
			0;
		[]->
			0;
		_->
			Fun = fun(#recSaveLimitMall{dbID = NewDbID, roleID = NewRoleID , haveBuy = NewHaveBuy, time = BuyTime}, BuyCount) ->
						  case RoleID =:= NewRoleID andalso Db_id =:= NewDbID andalso Begintime =< BuyTime andalso EndTime >= BuyTime of
							  true->
								  BuyCount + NewHaveBuy;
							  false->
								  BuyCount
						  end
				  end,
			lists:foldl(Fun, 0, LimitList)
	end.

%%购买成功后的处理
-spec onMallBuySuccess(RoleID, Db_id, MoneyType, Item_ID, Buy_Num) -> tuple()
	when RoleID::uint(), Db_id::uint(), MoneyType::coinType(), Item_ID::uint(), Buy_Num::uint().
onMallBuySuccess(_RoleID, Db_id, MoneyType, Item_ID, Buy_Num) ->
	%%Now = time:getUTCNowSec(),
	case ets:lookup(?MallItemTableEts, Db_id) of
		[]->
			?ERROR_OUT("mallBase onMallBuySuccess ets:lookup failed"),
			{false, Item_ID, 0, 0,MoneyType};
		[#recSaveMall{} = Item]->
			%%购买赠送
			mallbuysend(Item, Item#recSaveMall.buySendItem, Buy_Num, MoneyType)
	 end.		

%%购买赠送  buysenditem, buysendNum, buysendlimit, buysendbegintime, buysendendtime 
-spec mallbuysend(Item::#recSaveMall{}, Item_ID::uint(), Buy_Num::uint(), MoneyType::coinType()) -> tuple().
mallbuysend(Item, Item_ID, Buy_Num, MoneyType) ->
	Now = time:getUTCNowSec(),
	SendTimeArea = (Item#recSaveMall.buySendItem > 0 andalso Item#recSaveMall.buySendBeginTime =< Now andalso Item#recSaveMall.buySendEndTime >= Now),
	case  SendTimeArea orelse Item#recSaveMall.getIntegral > 0 of
		true->
			%%有赠送
			%%策划要求只有钻石币购买才送积分，其它情况不再送积分
			Num = case MoneyType of
					  ?CoinTypeDiamond ->
						  Item#recSaveMall.getIntegral * Buy_Num;
					  _ ->
						  0
				  end,
			SendNum = 
			case SendTimeArea of
				true ->
					Item#recSaveMall.buySendNum * Buy_Num;
				_ ->0
			end,
			%%playerMall会根据每日计数判断buySendLimit；Num=0也不会送积分
			{true, Item#recSaveMall.buySendItem, {Item#recSaveMall.buySendLimit,SendNum}, Num,MoneyType};
		false->
			{false, Item_ID, {Item#recSaveMall.buySendLimit,0}, 0,MoneyType}
	end.

%%保存新数据到sql
-spec saveToMallSql(MsgInfo::tuple()) ->ok.
saveToMallSql(#recSaveMall{}=MsgInfo) -> 
	%% 保存商城数据
	gsSendMsg:sendMsg2DBServer(saveMallData, 0, MsgInfo),
	ok;
saveToMallSql(_) ->
	?ERROR_OUT("saveToMallSql failed"),
	ok.

%%保存新数据到sqllog
-spec saveToMallLogSql(MsgInfo::tuple()) ->ok.
saveToMallLogSql(#recSaveMall{}=MsgInfo) -> 
	%% 保存商城数据
	gsSendMsg:sendMsg2DBServer(saveMallChangeLog, 0, [?LogType_MallChange, MsgInfo, ?Mall_Change_Updata]),
	ok;
saveToMallLogSql(_) ->
	?LOG_OUT("saveToMallLogSql failed"),
	ok.

%%更改数据插接口 内存和数据库
saveMallToSqlAndEts(Db_id, Index, Value) ->
	ets:update_element(?MallItemTableEts, Db_id, {Index, Value}),
	[NewRecord] = ets:lookup(?MallItemTableEts, Db_id),
	gsSendMsg:sendMsg2DBServer(saveMallData, 0, NewRecord),
	ok.

%%删除数据 平台下发的删除
delMallItem(Db_ID) ->
	ets:delete(?MallItemTableEts, Db_ID),
	ok.

%%限购插入和更改
-spec saveLimitMall(LimitMsg::tuple()) ->ok.
saveLimitMall(#recSaveLimitMall{} = LimitMsg) ->
	incMallSeed(),
	setLimitInfo(getLimitInfo() ++ [LimitMsg]),
	gsSendMsg:sendMsg2DBServer(saveLimitMallData,0, LimitMsg),
	ok;
saveLimitMall({}) ->
	?LOG_OUT("saveLimitMall MsgList:[]"),
	ok.

%%限购数据信息
-spec setLimitInfo(Msg::[#recSaveLimitMall{},...] | []) -> [#recSaveLimitMall{},...] | undefined.
setLimitInfo(Msg) ->
	put(limitinfo, Msg).
getLimitInfo() ->
	case get(limitinfo) of
		undefined->
			[];
		Info->
			Info
	end.

%%删除角色在商城中的一些内存数据
deleteRoleMemData(RoleID) ->
	List = getLimitInfo(),
	NewList = lists:keydelete(RoleID,#recSaveLimitMall.roleID,List),
	setLimitInfo(NewList),
	ok.

%%添加道具到内存  平台添加道具
-spec malladdnewitem(NewMallItem::#recSaveMall{}) -> 0.
malladdnewitem(NewMallItem) ->
	case NewMallItem of
		#recSaveMall{dbID = DbID, itemID=ItemID}->
			case getCfg:getCfgPStack(cfg_item, ItemID) of
				#itemCfg{}->
					case ets:lookup(?MallItemTableEts, DbID) of
						[#recSaveMall{}]->
							ets:delete(?MallItemTableEts, DbID);
						_->
							ok
					end;
				_->
					ok
			end;
		_->
			ok
	end,
	ets:insert(?MallItemTableEts, NewMallItem),
	incMallSeed(),
	showMallEts(),
	0.

%%删除道具
-spec malldelitem(Db_id::uint()) -> 0.
malldelitem(Db_id) ->
	delMallItem(Db_id),
	incMallSeed(),
	showMallEts(),
	0.

%% GM 限购设置  限购完是应该要下架的，所以这里直接移除了
-spec mallsetlimitbuy(Db_id::uint(), LimitBuy::uint(), LimitType::uint(), BeginTime::uint(), EndTime::uint()) -> -1 | 0.
mallsetlimitbuy(Db_id, LimitBuy, LimitType, BeginTime, EndTime) ->
	case ets:lookup(?MallItemTableEts, Db_id) of
		[#recSaveMall{}]->
			{FirTime,SecTime} = getChangeTime(BeginTime, EndTime),
			ets:update_element(?MallItemTableEts, Db_id,
				[
					{#recSaveMall.limitBuy, LimitBuy},
					{#recSaveMall.limitType, LimitType},
					{#recSaveMall.limitBeginTime, BeginTime},%%控制限购时间
					{#recSaveMall.limitEndTime, EndTime},
					{#recSaveMall.beginTime, BeginTime},%%控制上下架时间
					{#recSaveMall.endTime, EndTime}
				]),
				erlang:send_after(FirTime*1000, self(), {addMallGoodsByGM, Db_id}),
				erlang:send_after(SecTime*1000, self(), {removeMallGoodsByGM, Db_id}),
				showMallEts(),
				0;
		_->
			-1
	end.

%% 平台 限购设置  限购完是应该要下架的，所以这里直接移除了
-spec mallsetlimitbuyByPlat(Db_id::uint(),BeginTime::uint(), EndTime::uint()) -> -1 | 0.
mallsetlimitbuyByPlat(Db_id, BeginTime, EndTime) ->
	case ets:lookup(?MallItemTableEts, Db_id) of
		[#recSaveMall{}]->
			{FirTime,SecTime} = getChangeTime(BeginTime, EndTime),
			erlang:send_after(FirTime*1000, self(), {addMallGoodsByPlat}),
			erlang:send_after(SecTime*1000, self(), {removeMallGoodsByPlat, Db_id}),
			showMallEts(),
			0;
		_->
			-1
	end.

%% GM 购买赠送设置
-spec mallsetbuysend(SendBuy::#sendbuy{}) -> -1 | 0.
mallsetbuysend(#sendbuy{} = SendBuy) ->
	case ets:lookup(?MallItemTableEts, SendBuy#sendbuy.db_id) of
		[#recSaveMall{}]->
			ets:update_element(?MallItemTableEts, SendBuy#sendbuy.db_id,
				[
					{#recSaveMall.buySendItem, SendBuy#sendbuy.sendItem},
					{#recSaveMall.buySendNum, SendBuy#sendbuy.sendNum},
					{#recSaveMall.buySendBeginTime, SendBuy#sendbuy.sendBeginTime},
					{#recSaveMall.buySendEndTime, SendBuy#sendbuy.sendAfterTime}
				]),
			incMallSeed(),
			showMallEts(),
			0;
		_->
			-1
	end.

%% GM 上下架时间设置
-spec mallsetbuytime(NewMallItem::#recSaveMall{}) -> 0.
mallsetbuytime(NewMallItem) ->
	Db_ID=NewMallItem#recSaveMall.dbID,
	{FirTime,SecTime} = getChangeTime(NewMallItem#recSaveMall.beginTime, NewMallItem#recSaveMall.endTime),
	case ets:lookup(?MallItemTableEts, Db_ID) of
		[#recSaveMall{}]->
			ets:update_element(?MallItemTableEts, Db_ID,
				[
					{#recSaveMall.itemID, NewMallItem#recSaveMall.itemID},
					{#recSaveMall.type, NewMallItem#recSaveMall.type},
					{#recSaveMall.type1, NewMallItem#recSaveMall.type1},
					{#recSaveMall.diamond, NewMallItem#recSaveMall.diamond},
					{#recSaveMall.bindDiamond, NewMallItem#recSaveMall.bindDiamond},
					{#recSaveMall.useIntegral, NewMallItem#recSaveMall.useIntegral},
					{#recSaveMall.getIntegral, NewMallItem#recSaveMall.getIntegral},
					{#recSaveMall.sort, NewMallItem#recSaveMall.sort},
					{#recSaveMall.beginTime, NewMallItem#recSaveMall.beginTime},
					{#recSaveMall.endTime, NewMallItem#recSaveMall.endTime},
					{#recSaveMall.isHide, ?Mall_Show}
				]),
			erlang:send_after(FirTime*1000, self(), {addMallGoodsByGM}),
			erlang:send_after(SecTime*1000, self(), {removeMallGoodsByGM, Db_ID}),
			0;
		_->
			case getCfg:getCfgPStack(cfg_item, NewMallItem#recSaveMall.itemID) of
				#itemCfg{}->
					ets:insert(?MallItemTableEts, NewMallItem);
				_->
					ok
			end,
			erlang:send_after(FirTime * 1000, self(), {addMallGoodsByGM}),
			erlang:send_after(SecTime * 1000, self(), {removeMallGoodsByGM, Db_ID}),
			0
	end.

%% 平台 上下架时间设置
-spec mallsetbuytimeByPlat(Db_id::uint(),BeginTime::uint(), EndTime::uint()) -> 0.
mallsetbuytimeByPlat(Db_id, BeginTime, EndTime) ->
	{FirTime, SecTime} = getChangeTime(BeginTime, EndTime),
	erlang:send_after(FirTime*1000, self(), {addMallGoodsByGM}),
	erlang:send_after(SecTime*1000, self(), {removeMallGoodsByGM, Db_id}),
	0.


%% GM 折扣
-spec mallsetrebate(Db_ID::uint(), Rebate::uint(), BeginTime::uint(), EndTime::uint()) -> -1 | 0.
mallsetrebate(Db_ID, Rebate, BeginTime, EndTime) ->
	case ets:lookup(?MallItemTableEts, Db_ID) of
		[#recSaveMall{}]->
			{FirTime,SecTime} = getChangeTime(BeginTime, EndTime),
			ets:update_element(?MallItemTableEts, Db_ID,
				[
					{#recSaveMall.rebate, Rebate},
					{#recSaveMall.rebateBeginTime, BeginTime},
					{#recSaveMall.rebateEndTime, EndTime}
				]),
			erlang:send_after(FirTime*1000, self(), {addRebate}),
			erlang:send_after(SecTime*1000, self(), {endRebate, Db_ID}),
			showMallEts(),
			0;
		_->
			-1
	end.

%%平台 折扣设置
-spec mallsetrebateByPlat(Db_ID::uint(),BeginTime::uint(), EndTime::uint()) -> 0.
mallsetrebateByPlat(Db_ID, BeginTime, EndTime) ->
	{FirTime,SecTime} = getChangeTime(BeginTime, EndTime),
	erlang:send_after(FirTime*1000, self(), {addRebate}),
	erlang:send_after(SecTime*1000, self(), {endRebate, Db_ID}),
	0.

%%恢复全价 刷新
endRebate(Db_ID) ->
	case ets:lookup(?MallItemTableEts, Db_ID) of
		[#recSaveMall{}]->
			ets:update_element(?MallItemTableEts, Db_ID, {#recSaveMall.rebate, ?DEFULT_VALUE_2}),
			0;
		_->
			-1
	end.

gmSetMallInfo({Data,Ret})->
	case Ret of
		{set,ok}->
			NowTime = time:getUTCNowSec(),
			
			%%不管如何都要先添加一个完整道具
			malladdnewitem(Data),
			
			%%限购设置
			case Data#recSaveMall.limitType > ?DEFULT_VALUE_1 andalso Data#recSaveMall.limitBeginTime > NowTime andalso 
				 Data#recSaveMall.limitEndTime>Data#recSaveMall.limitBeginTime andalso Data#recSaveMall.limitBuy > 0 of
				true->
					mallsetlimitbuyByPlat(Data#recSaveMall.dbID, Data#recSaveMall.limitBeginTime, Data#recSaveMall.limitEndTime);
				false->
					ok
			end,
			%%购买赠送提醒
			case Data#recSaveMall.buySendItem > ?DEFULT_VALUE_1 andalso Data#recSaveMall.buySendNum > ?DEFULT_VALUE_1 andalso
				 Data#recSaveMall.buySendBeginTime > NowTime andalso Data#recSaveMall.buySendEndTime > Data#recSaveMall.buySendBeginTime of
				true->
					incMallSeed();
				false->
					ok
			end,
			%%折扣设置提醒
			case Data#recSaveMall.rebate > ?DEFULT_VALUE_1 andalso Data#recSaveMall.rebate < ?DEFULT_VALUE_2 of
				true->
					mallsetrebateByPlat(Data#recSaveMall.dbID, Data#recSaveMall.rebateBeginTime, Data#recSaveMall.rebateEndTime);
				false->
					ok
			end,
			%%设置上下架时间
			case Data#recSaveMall.beginTime > ?DEFULT_VALUE_1 orelse  Data#recSaveMall.endTime > ?DEFULT_VALUE_1 of
				true->
					mallsetbuytimeByPlat(Data#recSaveMall.dbID, Data#recSaveMall.beginTime, Data#recSaveMall.endTime);
				_->
					ok
			end;
		{del,ok}->
			malldelitem(Data);
		_->
			?ERROR_OUT("set mall goods info error"),
			ok
	end.

getChangeTime(BeginTime, EndTime)->
	Now = time:getUTCNowSec(),
	case BeginTime - Now =< 0 of
		true->
			FirTime = 1;
		false->
			FirTime = BeginTime - Now
	end,
	case EndTime - Now =< 0 of
		true->
			SecTime = 1;
		false->
			SecTime = EndTime - Now
	end,
	{FirTime, SecTime}.
