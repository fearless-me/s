%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 神秘商店
%%% @end
%%% Created : 12. 五月 2015 17:29
%%%-------------------------------------------------------------------
-module(playerMSShop).
-author("tiancheng").

-include("playerPrivate.hrl").

%% API
-export([
	requestMysteriousShop/0,
	buyMysteriousShopItem/1,
	freshMSShop/0
]).

-export([
	freshMysteriousShopReal/0
]).

%% 刷新神秘商店
-spec freshMSShop() -> ok.
freshMSShop() ->
	Count = playerDaily:getDailyCounter(?DailyType_Everyday, ?PlayerEveryDay_FreshMS),
	case getCfg:getCfgPStack(cfg_globalsetup, randomshop_limit) of
		#globalsetupCfg{setpara = [Number]} when Count < Number ->
			case getCfg:getCfgPStack(cfg_globalsetup, randomshop_Diamonds) of
				#globalsetupCfg{setpara = L} when erlang:length(L) > 0 ->
					Len = erlang:length(L),
					NeedMoney =
						case Count >= Len of
							true ->
								lists:last(L);
							_ ->
								NCount = Count + 1,
								lists:nth(NCount, L)
						end,

					RLog = #recPLogTSMoney{reason=?CoinUseMSShopFresh,param=playerState:getRoleID(),target=?PLogTS_MSShop,source=?PLogTS_PlayerSelf},
					case playerMoney:decCoin(?CoinTypeDiamond, NeedMoney, RLog) of
						true ->
							playerDaily:incDailyCounter(?DailyType_Everyday, ?PlayerEveryDay_FreshMS),
							freshMysteriousShopRealByHand(playerState:getRoleID()),
							requestMysteriousShop(),
							playerMsg:sendErrorCodeMsg(?ErrorCode_MysteriousShop_FreshSuccess),
							playerLogAdd:addLogParticipatorInfo(?LogParticipator_PlayerFreshMSshop),
							ok;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_MallBuy_Diamond_Not_Enough)
					end;
				_ ->
					skip
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_PlayerMSShopNoFreshTimes)
	end,
	ok.

buyMysteriousShopItem(#pk_U2GS_BuyMysteriousShopItem{lvlPhase = Lvl, only_id = OnlyID, itemid = ID, buynumber = Count}) ->
	buyMysteriousShopItem(Lvl, OnlyID, ID, Count).

buyMysteriousShopItem(LvlPhase, OnlyID, ItemID, Count) when OnlyID > 0 andalso Count > 0 ->
	RoleID = playerState:getRoleID(),
	SelfPhase = getLvlPhase(),
	case LvlPhase =:= SelfPhase of
		true ->
			Key = {RoleID, OnlyID},
			case edb:dirtyReadRecord(rec_player_ms_shop, Key) of
				[#rec_player_ms_shop{itemID = ItemID, count = Num}] ->
					%% 可以购买
					#mysterious_shopCfg{limit_number = Limit, money_type = MType, money = Money} = getCfg:getCfgByArgs(cfg_mysterious_shop,LvlPhase, OnlyID),
					RealBuyNumber =
						if
							Limit =:= 0 -> 0;
							Limit < 0 -> Count;
							true ->
								Diff = erlang:max(Limit - Num, 0),
								erlang:min(Diff, Count)
						end,
					case RealBuyNumber > 0 of
						true ->
							case buyItem(OnlyID, ItemID, RealBuyNumber, MType, Money) of
								true ->
									%% 购买成功
									R = #rec_player_ms_shop{
										roleID = Key,
										only_id = OnlyID,
										itemID = ItemID,
										count = RealBuyNumber + Num
									},
									playerSave:savePlayerMSShop(R, false),

									ItemName = case getCfg:getCfgPStack(cfg_item,ItemID) of
												   #itemCfg{name = Name} -> Name;
												   _ -> []
											   end,
									playerLogAdd:addLogParticipatorInfo(?LogParticipator_PlayerBuyMSshop),
									playerMsg:sendErrorCodeMsg(?ErrorCode_MysteriousShop_BuySuccess, [ItemName]);
								ErrorCode ->
									playerMsg:sendErrorCodeMsg(ErrorCode)
							end;
						_ ->
							%% 售罄
							playerMsg:sendErrorCodeMsg(?ErrorCode_MysteriousShop_NoMore)
					end;
				_ ->
					%% 购买失败
					playerMsg:sendErrorCodeMsg(?ErrorCode_MysteriousShop_BuyFailed)
			end;
		_ ->
			?ERROR_OUT("buyMysteriousShopItem roleid=[~p] out of date", [RoleID]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_MysteriousShop_ItemOutOfDate)
	end,

	%% 发一份最新的给客户端
	requestMysteriousShop(),
	ok;
buyMysteriousShopItem(_,_,_,_) -> ok.

-spec buyItem(OnlyID::uint(), ItemID::uint(), Count::uint(), MoneyType::coinType(), Money::uint()) -> ErrorCode::uint() | true.
buyItem(OnlyID, ItemID, Count, MoneyType, Money) ->
	AllPrice = Money,
	{CanBuy, ErrorCode} =
		case MoneyType of
			?CoinTypeDiamond ->
				{playerState:getCoin(MoneyType) >= AllPrice, ?ErrorCode_MallBuy_Diamond_Not_Enough};
			?CoinTypeGold ->
				{playerState:getCoin(MoneyType) >= AllPrice, ?ErrorCode_TradeGold};
			_ ->
				{false, ?ErrorCode_BuyItemErrorNoWealth}
		end,
	case CanBuy of
		true ->
			%% 扣钱
			LogParam = #recPLogTSMoney{reason=?CoinUseMSShopBuyItem,param={ItemID,Count},target=?PLogTS_MSShop,source=?PLogTS_PlayerSelf},
			case MoneyType of
				?CoinTypeBindDiamond ->
					playerMoney:useCoin(?CoinUseTypeDiamond, AllPrice, LogParam);
				_ ->
					playerMoney:decCoin(MoneyType, AllPrice, LogParam)
			end,

			%% 加道具
			Plog = #recPLogTSItem{
				old = 0,
				new = Count,
				change = Count,
				target = ?PLogTS_PlayerSelf,
				source = ?PLogTS_MSShop,
				gold = AllPrice,
				goldtype = MoneyType,
				changReason = ?ItemSourceMSShopItem,
				reasonParam = OnlyID
			},
			%%http://192.168.2.32:8080/browse/LUNA-677
			%%【服务器】【神秘商店】神秘商店获得道具改为非绑定
			playerPackage:addGoodsAndMail(ItemID, Count, false, 0, Plog),
			true;
		false -> ErrorCode
	end.

%% 请求神秘商店商品列表
-spec requestMysteriousShop() -> ok.
requestMysteriousShop() ->
	%% 先刷新一下商品
	freshMysteriousShop(),

	RoleID = playerState:getRoleID(),
	case getLvlPhase() of
		Phase when Phase > 0 ->
			Match = #rec_player_ms_shop{roleID = {RoleID, _ = '_'}, _ = '_'},
			List = edb:dirtyMatchRecord(rec_player_ms_shop, Match),
			Fun =
				fun(#rec_player_ms_shop{only_id = OnlyID, itemID = ItemID, count = Num}) ->
					#mysterious_shopCfg{limit_number = Limit, money_type = MType, money = Money} = getCfg:getCfgByArgs(cfg_mysterious_shop,Phase, OnlyID),
					CanBuyNumber =
						if
							Limit =< 0 -> Limit;
							true ->
								erlang:max(Limit - Num, 0)
						end,

					#pk_MysteriousShopItem{
						only_id = OnlyID,
						itemid = ItemID,
						money_type = MType,
						money = Money,
						number = CanBuyNumber
					}
				end,
			L = lists:map(Fun, List),

			NextFreshTime = getNextFreshTime(),
			NowTime = time:getSyncTime1970FromDBS(),

			#globalsetupCfg{setpara = LLL} = getCfg:getCfgPStack(cfg_globalsetup, randomshop_Diamonds),
			Count = playerDaily:getDailyCounter(?DailyType_Everyday, ?PlayerEveryDay_FreshMS),
			NeedMoney =
				case Count >= erlang:length(LLL) of
					true ->
						lists:last(LLL);
					_ ->
						NCount = Count + 1,
						lists:nth(NCount, LLL)
				end,

			Msg = #pk_GS2U_MysteriousShop{
				lvlPhase = Phase,
				residueTime = erlang:max(0, NextFreshTime - NowTime),
				items = L,
				freshMSShopDaimond = NeedMoney
			},
%% 			?DEBUG_OUT("msshop:~s,~p, now=~p,~s, next=~p,~s",
%% 				[playerState:getName(),Msg, NowTime, time:convertSec2DateTimeStr(NowTime), NextFreshTime, time:convertSec2DateTimeStr(NextFreshTime)]),
			playerMsg:sendNetMsg(Msg);
		_ ->
			?ERROR_OUT("requestMysteriousShop:config error roleid=~p", [RoleID])
	end,
	ok.

%% 刷新神秘商店
-spec freshMysteriousShop() -> ok.
freshMysteriousShop() ->
	case getLvlPhase() > 0 of
		true ->
			NextTime = getNextFreshTime(),
			NowTime = time:getSyncTime1970FromDBS(),
			case NowTime >= NextTime of
				true ->
					%% 自然时间到，可以刷新
					freshMysteriousShopReal();
				_ ->
					%% 玩家当前阶段是否与神秘商店匹配
					RoleID = playerState:getRoleID(),
					Match = #rec_player_ms_shop{roleID = {RoleID, _ = '_'}, _ = '_'},
					case edb:dirtyMatchRecord(rec_player_ms_shop, Match) of
						[#rec_player_ms_shop{only_id = OnlyID}|_] ->
							PlayerPhase = getLvlPhase(),
							KeyList = getCfg:getKeyList(cfg_mysterious_shop),
							case lists:keyfind(OnlyID, 2, KeyList) of
								{PlayerPhase, _} ->
									skip;
								_ ->
									%% 这是当前玩家的阶段与神秘商店不匹配时执行，刷新
									freshMysteriousShopReal()
							end;
						[] ->
							?LOG_OUT("freshMysteriousShop roleid=~p, no data", [RoleID]),
							freshMysteriousShopReal();
						Error ->
							?ERROR_OUT("freshMysteriousShop roleid=~p, error=~p", [RoleID, Error])
					end
			end;
		_ ->
			skip
	end,
	ok.

freshMysteriousShopReal() ->
	freshMysteriousShopReal(playerState:getRoleID()).

freshMysteriousShopReal(RoleID) ->
	?DEBUG_OUT("freshMysteriousShopReal roleID=~p, roleName=~ts", [playerState:getRoleID(),playerState:getName()]),

	%% 删除老数据
	Match = #rec_player_ms_shop{roleID = {RoleID, _ = '_'}, _ = '_'},
	OldList = edb:dirtyMatchRecord(rec_player_ms_shop, Match),
	[playerSave:savePlayerMSShop(Rec, true) || Rec <- OldList],

	%% 玩家当前神秘商店的阶段
	PlayerPhase = getLvlPhase(),
	getSelectItemListAndInsert(PlayerPhase),

	%% 设置下一次刷新时间
	NowTime = time:getSyncTime1970FromDBS(),
	setNextFreshTime(NowTime),
	ok.
%% 这个方法提供给手动刷新用，不重置下次刷新时间
freshMysteriousShopRealByHand(RoleID) ->
	?DEBUG_OUT("freshMysteriousShopReal roleID=~p, roleName=~ts", [playerState:getRoleID(),playerState:getName()]),

	%% 删除老数据
	Match = #rec_player_ms_shop{roleID = {RoleID, _ = '_'}, _ = '_'},
	OldList = edb:dirtyMatchRecord(rec_player_ms_shop, Match),
	[playerSave:savePlayerMSShop(Rec, true) || Rec <- OldList],

	%% 玩家当前神秘商店的阶段
	PlayerPhase = getLvlPhase(),
	getSelectItemListAndInsert(PlayerPhase),
	ok.

setNextFreshTime(NowTime) ->
	case getCfg:getCfgPStack(cfg_globalsetup, shop_time) of
		#globalsetupCfg{setpara = TimeList} when erlang:is_list(TimeList) andalso erlang:length(TimeList) > 0 ->
			NTimeList = lists:usort(TimeList),
			{{Year, Month, Day}, {Hour, _Minute, _Second}} = time:convertSec2DateTime(NowTime),
			NextResetHour =
				case lists:filter(fun(T) -> T > Hour end, NTimeList) of
					[T1|_] ->
						T1;
					_ ->
						[T2|_] = NTimeList,
						T2
				end,

			NextFreshTime =
				case NextResetHour > Hour of
					true ->
						time:convertDateTime1970ToSec({{Year, Month, Day},{NextResetHour, 0, 0}});
					_ ->
						E = time:convertDateTime1970ToSec({{Year, Month, Day},{23, 59, 59}}) + 1,
						[StartHour|_] = NTimeList,
						E + StartHour * 3600
				end,
			playerPropSync:setInt64(?SerProp_MSShopNextFreshTime, NextFreshTime),
			ok;
		Conf ->
			?ERROR_OUT("setNextFreshTime error config:~p, roleID=~p", [playerState:getRoleID(), Conf]),
			false
	end,
	ok.

getNextFreshTime() ->
	playerPropSync:getProp(?SerProp_MSShopNextFreshTime).

getLvlPhase() ->
	PlayerLvl = playerState:getLevel(),
	Key1List = getCfg:get1KeyList(cfg_mysterious_shop),
	NKey1List = lists:reverse(Key1List),
	getLvlPhase(NKey1List, PlayerLvl).

getLvlPhase([], PlayerLvl) ->
	?ERROR_OUT("getLvlPhase, config error, roleid = ~p, lvl = ~p", [playerState:getRoleID(), PlayerLvl]),
	-1;
getLvlPhase([LvlPhase|List], PlayerLvl) ->
	case getCfg:get2KeyList(cfg_mysterious_shop,LvlPhase) of
		[OnlyID |_] ->
			#mysterious_shopCfg{lvl_min = Min, lvl_max = Max} = getCfg:getCfgByArgs(cfg_mysterious_shop,LvlPhase, OnlyID),
			case Min =< PlayerLvl andalso PlayerLvl =< Max of
				true -> LvlPhase;
				_ -> getLvlPhase(List, PlayerLvl)
			end;
		_ ->
			getLvlPhase(List, PlayerLvl)
	end.

getSelectItemListAndInsert(-1) ->
	ok;
getSelectItemListAndInsert(LvlPhase) ->
	OnlyIDList = getCfg:get2KeyList(cfg_mysterious_shop,LvlPhase),
	L = lists:map(fun(OnlyID) -> getCfg:getCfgByArgs(cfg_mysterious_shop,LvlPhase, OnlyID) end, OnlyIDList),

	%% 排序
	NL = lists:keysort(#mysterious_shopCfg.weight1, L),

	%% 必然随机出需要非绑定钻石购买的道具
	NeedDiamondList = lists:filter(fun(#mysterious_shopCfg{money_type = MoneyType}) -> MoneyType =:= ?CoinTypeDiamond end, NL),
	{L1_1, L1_2} = getRandItemList(NeedDiamondList, []),
	{_L2_1, L2_2} = getRandItemList(L1_1, L1_2),

	%% 其余的则全部随机
	ResidueList = NL -- L2_2,
	{L3_1, L3_2} = getRandItemList(ResidueList, L2_2),
	{L4_1, L4_2} = getRandItemList(L3_1, L3_2),
	{L5_1, L5_2} = getRandItemList(L4_1, L4_2),
	{_L6_1, L6_2} = getRandItemList(L5_1, L5_2),

	%% 把结果排序一次
	ListResult = lists:keysort(#mysterious_shopCfg.only_id, L6_2),

	%% 插入内存数据库
	RoleID = playerState:getRoleID(),
	FunWrite =
		fun(#mysterious_shopCfg{only_id = OnlyID, itemid = ItemID}) ->
			R = #rec_player_ms_shop{
				roleID = {RoleID, OnlyID},
				only_id = OnlyID,
				itemID = ItemID,
				count = 0
			},
			playerSave:savePlayerMSShop(R, false)
		end,
	lists:foreach(FunWrite, ListResult),
	ok.

%% Param1:总列表
%% Param2:根据权重筛选出来的列表
%% Return1:减去筛选的后，剩余的列表
%% Return2:根据权重筛选出来的列表
getRandItemList([], ItemList) ->
	{[], ItemList};
getRandItemList([#mysterious_shopCfg{}|_] = List, ItemList) ->
	%% 求总权重值
	QZ = getWeigthNumber(List),
	%% 根据权重取一个范围
	Fun =
		fun(#mysterious_shopCfg{only_id = OnlyID, weight1 = W}, {All, AccList}) ->
			case All =:= 0 of
				true ->
					{W, [{OnlyID, 1, W}]};
				_ ->
					F = All + 1,
					N = All + W,
					{N, [{OnlyID, F, N}|AccList]}
			end
		end,
	{_,LL} = lists:foldl(Fun, {0, []}, List),
	%% 选出满足的范围
	Rand = misc:rand(1, QZ),
	FunS =
		fun({_OnlyID, F, N}) ->
			Rand >= F andalso Rand =< N
		end,
	case lists:filter(FunS, LL) of
		[{OnlyID,_,_}] ->
			Rec = lists:keyfind(OnlyID, #mysterious_shopCfg.only_id, List),
			{lists:delete(Rec, List), [Rec | ItemList]};
		_ ->
			?ERROR_OUT("getRandItemList:allQZ=~p,Rand=~p,List=~p", [QZ,Rand,LL]),
			{List, ItemList}
	end.

getWeigthNumber(List) ->
	Fun =
		fun(#mysterious_shopCfg{weight1 = W}, Acc) ->
			Acc + W
		end,
	lists:foldl(Fun, 0, List).