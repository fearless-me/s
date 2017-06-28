%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 九月 2016 10:39
%%%-------------------------------------------------------------------
-module(lotterySys).
-author("wenshaofei").
-include("playerPrivate.hrl").
-include("cfg_lottery_once.hrl").
-include("cfg_lottery_store.hrl").
-include("cfg_lottery_ten_times.hrl").
-include("cfg_lottery_goblin_free_cd.hrl").
%-include("cfg_lottery_treasure_free_cd.hrl"). 固定每天1次，即24小时

%% API
-export([t_tenTimesLottery/3, t_onceLottery/3, tenTimesLottery/1, c_goblin_lottery_free_cd_check/2, c_treasure_lottery_free_cd_check/2, flush_lottery_info_2_client/0]).
%%库id哥布林抽奖宝藏库ID
-define(STORE_ID_GOBLIN, [1, 2]).
%%库id稀世宝藏抽奖宝藏库ID
-define(STORE_ID_TREASURE, [3, 4]).
%%单次抽最大次数
-define(LOTTERY_ONCE_MAX_COUNT, 15).
%%10连抽抽最大次数
-define(LOTTERY_TEN_TIMES_MAX_COUNT, 10).

%%十连抽触发器
t_tenTimesLottery(#triggerCfg{argu = [DailyID]} = Cfg, Args, FromCondationArgus) ->
	{ok, ItemList} = tenTimesLottery(DailyID),
	GiveItemList = tenTimesGive(DailyID),
	NewArgu = logicLib:addLogicArgu(?LK_ADD_GOODS_AND_MAIL, ItemList ++ GiveItemList, Args),
	ItemListMsg = [#pk_lottery_award_item_info{itemID = ItemID, itemNumber = ItemNumber} || {ItemID, ItemNumber, _} <- ItemList],
	ItemGiveListMsg = [#pk_lottery_award_item_info{itemID = ItemID1, itemNumber = ItemNumber1} || {ItemID1, ItemNumber1, _} <- GiveItemList],
	Msg = #pk_GS2U_lottery_award_items{
		award_item_list = ItemListMsg,
		award_item_list_sp = ItemGiveListMsg
	},
	playerMsg:sendNetMsg(Msg),
	flush_lottery_info_2_client(),
	triggerLib:getSuccessReturn(Cfg, NewArgu, FromCondationArgus).

%%单次抽奖触发器
t_onceLottery(#triggerCfg{argu = [DailyID]} = Cfg, Args, FromCondationArgus) ->
	{ok, Item} = onceLottery(DailyID),
	GiveItemList = onceLotteryGive(DailyID),
	NewArgu = logicLib:addLogicArgu(?LK_ADD_GOODS_AND_MAIL, [Item] ++ GiveItemList, Args),
	{ItemID, ItemNumber, _} = Item,
	ItemListMsg = [#pk_lottery_award_item_info{itemID = ItemID, itemNumber = ItemNumber}],
	ItemGiveListMsg = [#pk_lottery_award_item_info{itemID = ItemID1, itemNumber = ItemNumber1} || {ItemID1, ItemNumber1, _} <- GiveItemList],
	Msg = #pk_GS2U_lottery_award_items{
		award_item_list = ItemListMsg,
		award_item_list_sp = ItemGiveListMsg
	},
	playerMsg:sendNetMsg(Msg),
	flush_lottery_info_2_client(),
	triggerLib:getSuccessReturn(Cfg, NewArgu, FromCondationArgus).

%%单次哥布林抽奖cd校验--------该校验不通过不会给客户端任何响应，
%% 客户端不应该在免费抽奖cd没有结束的时候进行免费抽奖
c_goblin_lottery_free_cd_check(_Args, #conditionCfg{} = Cfg) ->
	NowSec = time2:getTimestampSec(),
	GoblinFreeCounts = globalCfg:getGlobalCfg(goblin_free_counts),
	GoblinFreeLotteryNumber = playerDaily:getDailyCounter(?DailyType_GOBLIN_FREE, 0),
	LastFreeGoblinLotteryTime = playerDaily:getDailyCounter(?DailyType_GOBLIN_FREE_LAST_SEC, 0),
	case GoblinFreeLotteryNumber < GoblinFreeCounts of
		true ->
			#lottery_goblin_free_cdCfg{cd = CDSec} =
				getCfg:getCfgPStack(cfg_lottery_goblin_free_cd, GoblinFreeLotteryNumber + 1),
			if
				CDSec < (NowSec - LastFreeGoblinLotteryTime) ->
					conditionLib:getSuccessReturn(Cfg);
				true ->
					conditionLib:getFailReturn(Cfg)
			end;
		_ ->
			conditionLib:getFailReturn(Cfg)
	end.

%%单次稀世抽奖cd校验--------该校验不通过不会给客户端任何响应，
%% 客户端不应该在免费抽奖cd没有结束的时候进行免费抽奖
c_treasure_lottery_free_cd_check(_Args, #conditionCfg{} = Cfg) ->
%%	NowSec = time2:getTimestampSec(),
	TreasureFreeCounts =
		case getCfg:getCfgPStack(cfg_globalsetup, treasure_free_counts) of
			#globalsetupCfg{setpara = [Counts]} ->
				Counts;
			_ ->
				0
		end,
	TreasureFreeLotteryNumber = playerDaily:getDailyCounter(?DailyType_TREASURE_FREE, 0),
%%	LastFreeTreasureLotteryTime = playerDaily:getDailyCounter(?DailyType_TREASURE_FREE_LAST_SEC, 0),
	case TreasureFreeLotteryNumber < TreasureFreeCounts of
		true ->
			conditionLib:getSuccessReturn(Cfg);
		_ ->
			conditionLib:getFailReturn(Cfg)
	end.

%%将抽奖信息刷新到客户端段
flush_lottery_info_2_client() ->
	NowSec = time2:getTimestampSec(),

	GoblinFreeCounts = globalCfg:getGlobalCfg(goblin_free_counts),
	GoblinFreeLotteryNumber = playerDaily:getDailyCounter(?DailyType_GOBLIN_FREE, 0),
	LastFreeGoblinLotteryTime = playerDaily:getDailyCounter(?DailyType_GOBLIN_FREE_LAST_SEC, 0),
	CDGoblinFree =
		case GoblinFreeLotteryNumber < GoblinFreeCounts of
			true ->
				#lottery_goblin_free_cdCfg{cd = CDSec} =
					getCfg:getCfgPStack(cfg_lottery_goblin_free_cd, GoblinFreeLotteryNumber + 1),
				if
					CDSec < (NowSec - LastFreeGoblinLotteryTime) ->
						0;
					true ->
						CDSec - (NowSec - LastFreeGoblinLotteryTime)
				end;
			_ ->
				0
		end,
	GoblinAllConfig = getCfg:getAllCfg(cfg_lottery_goblin_free_cd),
	GoblinLotteryLastFreeTimes = length(GoblinAllConfig) - GoblinFreeLotteryNumber,

	TreasureFreeCounts =
		case getCfg:getCfgPStack(cfg_globalsetup, treasure_free_counts) of
			#globalsetupCfg{setpara = [Counts]} ->
				Counts;
			_ ->
				0
		end,
	TreasureFreeLotteryNumber = playerDaily:getDailyCounter(?DailyType_TREASURE_FREE, 0),
%%	LastFreeTreasureLotteryTime = playerDaily:getDailyCounter(?DailyType_TREASURE_FREE_LAST_SEC, 0),
%%	CDTreasureFree =
%%		case TreasureFreeLotteryNumber < TreasureFreeCounts of
%%			true ->
%%				TreasureFreeCounts-TreasureFreeLotteryNumber;
%%			_ ->
%%				0
%%		end,
	if TreasureFreeCounts>TreasureFreeLotteryNumber ->
		TreasureLotteryLastFreeTimes = TreasureFreeCounts - TreasureFreeLotteryNumber;
		true->
			TreasureLotteryLastFreeTimes = 0
	end,

	%% CD不能超过凌晨4点重置时间，二次修正
	{YMD, _} = time2:convertSecToDateTime(NowSec + time2:getTimezoneSec()),
	TimeEnd = calendar:datetime_to_gregorian_seconds({YMD, {4, 0, 0}}) + 86400,
	CDGoblinFreeFix =
		case NowSec + CDGoblinFree - TimeEnd of
			CDGoblinFreeFix_ when CDGoblinFreeFix_ > 0 ->
				TimeEnd - NowSec;
			_ ->
				CDGoblinFree
		end,
%%	CDTreasureFreeFix =
%%		case NowSec + CDTreasureFree - TimeEnd of
%%			CDTreasureFreeFix_ when CDTreasureFreeFix_ > 0 ->
%%				TimeEnd - NowSec;
%%			_ ->
%%				CDTreasureFree
%%		end,

	Msg = #pk_GS2U_lottery_sys_info{
		goblin_lottery_free_cd = CDGoblinFreeFix,
		goblin_lottery_last_free_times = GoblinLotteryLastFreeTimes,
		treasure_lottery_free_cd = 0,
		treasure_lottery_last_free_times = TreasureLotteryLastFreeTimes
	},
	playerMsg:sendNetMsg(Msg),
	ok.
%%单次抽奖
%% return ItemList
%%
onceLottery(Type = ?DailyType_GOBLIN_FREE) ->
	onceLotteryFree(Type, ?STORE_ID_GOBLIN);
onceLottery(Type = ?DailyType_TREASURE_FREE) ->
	onceLotteryFree(Type, ?STORE_ID_TREASURE);
onceLottery(Type = ?SerProp_GoblinPayMoneyOnce) ->
	onceLotteryPayMoney(Type, ?STORE_ID_GOBLIN);
onceLottery(Type = ?SerProp_TreasurePayMoneyOnce) ->
	onceLotteryPayMoney(Type, ?STORE_ID_TREASURE).

%%单次免费抽
onceLotteryFree(DailyID, StoreIDList) ->
	?CheckDailyType(DailyID),
	OnceLotteryNumber = getFreeLotteryTimes(DailyID, ?LOTTERY_ONCE_MAX_COUNT),
	#lottery_onceCfg{goblin_free = FreeWeight, goblin_pay_money = PayMoneyWeight} = getCfg:getCfgByArgs(cfg_lottery_once, OnceLotteryNumber),
	%%goblin_free = 免费抽道具库1,goblin_pay_money =免费抽道具库2
	StoreID = randomStoreID([FreeWeight, PayMoneyWeight], StoreIDList),

	{ItemID, ItemNumber, ISBind} = onceLotteryFreeItemRand(StoreID,DailyID),

	?DEBUG_OUT("==============daily count=~p~n", [{DailyID, playerDaily:getDailyCounter(DailyID, 0)}]),
	playerDaily:incDailyCounter(DailyID, 0),
	NowSec = time2:getTimestampSec(),
	case DailyID of
		?DailyType_GOBLIN_FREE ->
			playerDaily:incCounter(?DailyType_GOBLIN_FREE_LAST_SEC, 0, NowSec);
		?DailyType_TREASURE_FREE ->
			ok
%%			playerDaily:incCounter(?DailyType_TREASURE_FREE_LAST_SEC, 0, NowSec)
	end,
	{ok, {ItemID, ItemNumber, ISBind}}.

onceLotteryFreeItemRand(StoreID,?DailyType_GOBLIN_FREE)->
	Career = playerState:getCareer(),
	Ret =
		case playerPropSync:getProp(?SerProp_LotterySys) > 0 of
			true ->
				randomStoreItem(StoreID);
			_ ->
				playerPropSync:setInt(?SerProp_LotterySys, 1),
				case getCfg:getCfgByArgs(cfg_globalsetup, goblin_first_lotterydraw) of
					#globalsetupCfg{setpara = V} ->
						case lists:keyfind(?Career2CareerBase(Career), 1, V) of
							{_, ItemID1, ItemNum1}->
								{ItemID1, ItemNum1, true};
							_ ->
								randomStoreItem(StoreID)
						end;
					_ ->
						randomStoreItem(StoreID)
				end
		end,
	case Ret of
		#lottery_storeCfg{itemID = ItemID, itemNumber = ItemNumber, isBind = ISBind} ->
			{ItemID, ItemNumber, ISBind};
		_ ->
			Ret
	end;
onceLotteryFreeItemRand(StoreID,_)->
	#lottery_storeCfg{
		itemID = ItemID,
		itemNumber = ItemNumber,
		isBind = ISBind } =	randomStoreItem(StoreID),
	{ItemID, ItemNumber, ISBind}.

%%单次付费抽
onceLotteryPayMoney(DailyID, StoreIDList) ->
	?CheckProp(DailyID),
	OnceLotteryNumber = getPayMoneyLotteryTimes(DailyID, ?LOTTERY_ONCE_MAX_COUNT),
	#lottery_onceCfg{treasure_free = FreeWeight, treasure_pay_money = PayMoneyWeight} = getCfg:getCfgByArgs(cfg_lottery_once, OnceLotteryNumber),
	%%treasure_free = 付费抽道具库3,treasure_pay_money =付费抽道具库4
	StoreID = randomStoreID([FreeWeight, PayMoneyWeight], StoreIDList),
	#lottery_storeCfg{itemID = ItemID, itemNumber = ItemNumber, isBind = ISBind} = randomStoreItem(StoreID),
	playerPropSync:setProp(DailyID, OnceLotteryNumber + 1),
	{ok, {ItemID, ItemNumber, ISBind}}.


%%哥布林十连抽
%% return {ok，#lottery_storeCfg{}}
tenTimesLottery(PropID) when PropID =:= ?SerProp_GoblinPayMoneyTenTimes ->
	tenTimesLottery(PropID, ?SerProp_GoblinPayMoneyOnce, ?STORE_ID_GOBLIN);
%%绝世宝藏十连抽
%% return {ok，#lottery_storeCfg{}}
tenTimesLottery(PropID) when PropID =:= ?SerProp_TreasurePayMoneyTenTimes ->
	tenTimesLottery(PropID, ?SerProp_TreasurePayMoneyOnce, ?STORE_ID_TREASURE).




%%十连抽
%%TenTimesPropID十连抽 propID
%%OncePropID 单次抽PropID
%%StoreIDList 随机仓库列表
%% return {ok，#lottery_storeCfg{}}
tenTimesLottery(TenTimesPropID, OncePropID, StoreIDList) ->
	?CheckProp(TenTimesPropID),
	%%十连抽中进行单次抽奖的次数
	OnceLotteryRandomNumber = 9,
	NineList = lists:duplicate(OnceLotteryRandomNumber, 1),
	%%前9次进行普通随机抽奖
	NineTimeRandomItemList = lists:map(
		fun(_) ->
			{ok, Item} = onceLotteryPayMoney(OncePropID, StoreIDList),
			Item
		end, NineList),
	TenTimesLotteryNumber = getPayMoneyLotteryTimes(TenTimesPropID, ?LOTTERY_TEN_TIMES_MAX_COUNT),
	#lottery_ten_timesCfg{goblin_ten_times = GoblinTenTimesStoreID, treasure_ten_times = TreasureTenTimesStoreID} = getCfg:getCfgByArgs(cfg_lottery_ten_times, TenTimesLotteryNumber),
	if
		TenTimesPropID =:= ?SerProp_TreasurePayMoneyTenTimes ->
			StoreID = TreasureTenTimesStoreID;
		TenTimesPropID =:= ?SerProp_GoblinPayMoneyTenTimes ->
			StoreID = GoblinTenTimesStoreID
	end,
	%%随机最终大奖
	#lottery_storeCfg{itemID = ItemID, itemNumber = ItemNumber, isBind = ISBind} = randomStoreItem(StoreID),
	BigLotteryItem = {ItemID, ItemNumber, ISBind},
	RandomIndex = misc:rand(1, OnceLotteryRandomNumber),
	HeadList = lists:sublist(NineTimeRandomItemList, RandomIndex),
	TailList = lists:sublist(NineTimeRandomItemList, RandomIndex + 1, OnceLotteryRandomNumber),
	%%十连抽最终或得的物品id信息
	TenTimelotterItemList = HeadList ++ [BigLotteryItem] ++ TailList,
	?DEBUG_OUT("============tenTimesLottery=========~p~n", [{TenTimelotterItemList, NineTimeRandomItemList, BigLotteryItem}]),
	playerPropSync:setProp(TenTimesPropID, TenTimesLotteryNumber + 1),
	{ok, TenTimelotterItemList}.


%%随机仓库id
randomStoreID(WeightList, StoreIDList) ->
	randomStoreID(WeightList, StoreIDList, []).
randomStoreID([], [], WeightInfoList) ->
	misc:calcOddsByWeightList(WeightInfoList);
randomStoreID([Weight | WeightList], [StoreID | StoreIDList], WeightInfoList) ->
	randomStoreID(WeightList, StoreIDList, [{Weight, StoreID} | WeightInfoList]).


%获取抽奖次数
getFreeLotteryTimes(DailyCountID, LotteryMaxNumber) ->
	?CheckDailyType(DailyCountID),
	CurrentLotterTimes = playerDaily:getDailyCounter(DailyCountID, 0),
	(CurrentLotterTimes rem LotteryMaxNumber) + 1.
%获取抽奖次数
getPayMoneyLotteryTimes(PropID, LotteryMaxNumber) ->
	?CheckProp(PropID),
	PropValue = playerPropSync:getProp(PropID),
	?DEBUG_OUT("getPayMoneyLotteryTimes====~w~n", [{PropID, PropValue, LotteryMaxNumber}]),
	(PropValue rem LotteryMaxNumber) + 1.

%%在随机舱内进行一次随机抽取
randomStoreItem(StoreID) ->
	SoreCfgList = getCfg:getAllCfg(cfg_lottery_store),
	randomStoreItem(SoreCfgList, StoreID, []).
randomStoreItem([], _StoreID, WeightItemInfoList) ->
	ItemID = misc:calcOddsByWeightList(WeightItemInfoList),
	getCfg:getCfgByArgs(cfg_lottery_store, ItemID);
randomStoreItem([#lottery_storeCfg{id = ID, weight = Weight, storeID = StoreID, week = NeedWeek, startTime = [SY, SM, SD], endTime = [EY, EM, ED], minLevel = MinLv, maxLevel = MaxLv} | T], StoreID, WeightItemInfoList) ->
	{NowYMD, _} = calendar:local_time(),
	StartTime = calendar:date_to_gregorian_days({SY, SM, SD}),
	EndTime = calendar:date_to_gregorian_days({EY, EM, ED}),
	Now = calendar:date_to_gregorian_days(NowYMD),
	NowWeek = calendar:day_of_the_week(NowYMD) ,
	NowLv = playerState:getLevel(),

	WeekOk = checkWeek(NowWeek, NeedWeek),
	TimeOk = checkTime(Now, StartTime, EndTime),
	LevelOk = checkLevel(NowLv, MinLv, MaxLv),

	if
		WeekOk andalso TimeOk andalso LevelOk ->
			randomStoreItem(T, StoreID, [{Weight, ID} | WeightItemInfoList]);
		true ->
			randomStoreItem(T, StoreID, WeightItemInfoList)
	end;
randomStoreItem([#lottery_storeCfg{id = ID, weight = Weight, storeID = StoreID, week = NeedWeek, minLevel = MinLv, maxLevel = MaxLv, startTime = StartTime, endTime = EndTime} | T], StoreID, WeightItemInfoList)
	when StartTime =:= "[]"; EndTime =:= "[]"; StartTime =:= []; EndTime =:= []; not erlang:is_list(StartTime); not erlang:is_list(EndTime) ->
	NowLv = playerState:getLevel(),
	{NowYMD, _} = calendar:local_time(),
	NowWeek = calendar:day_of_the_week(NowYMD) ,
	WeekOk = checkWeek(NowWeek, NeedWeek),
	LevelOk = checkLevel(NowLv, MinLv, MaxLv),
	if
		WeekOk andalso LevelOk ->
			randomStoreItem(T, StoreID, [{Weight, ID} | WeightItemInfoList]);
		true ->
			randomStoreItem(T, StoreID, WeightItemInfoList)
	end;
randomStoreItem([#lottery_storeCfg{} | T], StoreID, WeightItemInfoList) ->
	randomStoreItem(T, StoreID, WeightItemInfoList).

%%----------------------------------------------------------------
checkWeek(_NowWeek, 0)->
	true;
checkWeek(NowWeek, NeedWeek)->
	NeedWeek =:= NowWeek.

checkTime(Now, StartTime, EndTime) ->
	(StartTime =< Now) andalso (EndTime =< Now).

checkLevel(NowLv, MinLv, MaxLv)->
	(MinLv =< NowLv) andalso (NowLv =< MaxLv).


%%----------------------------------------------------------------
onceLotteryGive(Type)
	when Type =:= ?DailyType_TREASURE_FREE
	orelse Type =:= ?SerProp_TreasurePayMoneyOnce ->
%%	女神扭蛋单抽
	doLotteryGive(treasure_once_gift);
onceLotteryGive(_)->
	doLotteryGive(goblin_once_gift).

tenTimesGive(?SerProp_TreasurePayMoneyTenTimes)->
	doLotteryGive(treasure_ten_gift);
tenTimesGive(_)->
	doLotteryGive(goblin_ten_gift).

doLotteryGive(Key)->
	L1 = 
	case getCfg:getCfgByArgs(cfg_globalsetup, Key) of
		#globalsetupCfg{setpara = L}->
			L;
		_ ->
			[]
	end,
	[{ID, Number, 0} || {ID, Number} <- L1].