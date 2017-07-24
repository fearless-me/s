%%%-------------------------------------------------------------------
%%% @author 田诚
%%% @copyright (C) 2016, <haowan123>
%%% @doc
%%% 玩家资源找回
%%% @end
%%% Created : 1. 三月 2016 15:37
%%%-------------------------------------------------------------------

-module(playerFindRes).
-author(tiancheng).

-include("playerPrivate.hrl").

%% 资源找回定义
%%1：保卫小羊
%%2：每日任务（循环任务）
%%3：军团单人本
%%4：荒野护送
%%5：勇者试炼
%%6：惊天喵盗团（金币副本）
%%7：竞技场
%%8：经验副本
%%9：港口竞速
%%10：元素保卫战（材料副本）

-define(PlayerFindRes_Start, 1).
-define(PlayerFindRes1, 1).
-define(PlayerFindRes2, 2).
-define(PlayerFindRes3, 3).
-define(PlayerFindRes4, 4).
-define(PlayerFindRes5, 5).
-define(PlayerFindRes6, 6).
-define(PlayerFindRes7, 7).
-define(PlayerFindRes8, 8).
-define(PlayerFindRes9, 9).
-define(PlayerFindRes10, 10).
-define(PlayerFindRes_End, 10).

%% 循环任务ID
-define(PlayerXHRWID, 0).
%% 保卫小羊副本ID
-define(PlayerBWXYMapID, [190,191,192,193,194,195]).
%% 惊天喵盗团ID
-define(MoneyCopyMapID, 520).
%% 元素保卫战副本组ID
-define(MaterialCopyMapGroupID, 1).
%% 经验副本组ID
-define(ExpCopyMapGroupID, 2).
%% 军团单人本ID列表
-define(PlayerJTDRBMapList, []).

%% param1为今日剩余多少次，param2为今日还可以找回多少次

%% ====================================================================
%% API functions
%% ====================================================================

-export([
	init/0,
	dailyReset/5,
	initFindResList/0
]).

-export([
	requestFindRes/0,
	refindResOne/2,
	refindResAll/1
]).


%% 初始化
-spec init() -> ok.
init() ->
	case playerState:getIsPlayer() of
		true -> init2();
		_ -> skip
	end,
	ok.

init2() ->
	RoleID = playerState:getRoleID(),

	Match = #rec_player_find_res{roleID = {RoleID, _ = '_'}, _ = '_'},
	Res = edb:dirtyMatchRecord(rec_player_find_res, Match),

	%% 保存到进程字典
	playerPropSync:setAny(?SerProp_playerFindRes, Res),
	ok.

%% 玩家上线，初始化可找回资源列表
-spec initFindResList() -> ok.
initFindResList() ->
	case playerState:getIsPlayer() of
		true ->
			%% 真实玩家才进行初始化
			getFindResListByLevel();
		_ -> skip
	end,
	ok.

%% 请求资源找回列表
-spec requestFindRes() -> ok.
requestFindRes() ->
	List = getFindResListByLevel(),
	F =
		fun({#find_resCfg{id = ID}, #rec_player_find_res{param2 = P2}}) ->
			#pk_RefindResInfo{id = ID, number = P2}
		end,
	ResList = lists:map(F, List),
	playerMsg:sendNetMsg(#pk_RefindResList{resList = ResList}),
	ok.

%% 单个资源找回
refindResOne(ID, Type) ->
	case getCfg:getCfgByKey(cfg_find_res, ID) of
		#find_resCfg{ac_id = ACID} ->
			refindRes(ACID, misc:convertBoolFromInt(Type), 1);
		_ ->
			skip
	end,

	%% 重新刷新客户端
	requestFindRes(),
	ok.

%% 一健找回
refindResAll(Type) ->
	L = lists:seq(?PlayerFindRes_Start, ?PlayerFindRes_End),
	CanUseMoney = misc:convertBoolFromInt(Type),
	_ML = [refindRes(ACID, CanUseMoney, 999) || ACID <- L],

	%% todo 额外奖励

	%% 重新刷新客户端
	requestFindRes(),
	ok.

%% 返回消耗的钻石数量
refindRes(ACID, CanUseMoney, FindNum) ->
	case getFindResConfByLevel(ACID) of
		#find_resCfg{use_diamond = Diamond, diamonds_find = Ber, reward_exp = Exp, type_number = Moneys, value = Liveness,ext_item = ItemReward} = Conf ->
			Res = #rec_player_find_res{param2 = P2} = getFindResDataByConf(Conf),
			case P2 > 0 of
				true ->
					Number = erlang:min(FindNum, P2),
					NeedDiamond = Diamond * Number,
					Go =
						case CanUseMoney of
							true ->
								case playerMoney:canUseCoin(?CoinUseTypeDiamond, NeedDiamond) of
									true->
										PLog = #recPLogTSMoney{
											reason = ?CoinUseFindRes,
											param = ACID,
											target = ?PLogTS_FindRes,
											source = ?PLogTS_PlayerSelf
										},
										playerMoney:useCoin(?CoinUseTypeDiamond, NeedDiamond, PLog);
									_ ->
										playerMsg:sendErrorCodeMsg(?ErrorCode_TradeDiamond),
										false
								end;
							false ->
								true
						end,
					case Go of
						true ->
							%% 扣除次数
							NowTime = time:getSyncTime1970FromDBS(),
							NewRes = Res#rec_player_find_res{param2 = P2 - Number, freshtime = NowTime},
							saveRes(Res /= NewRes, NewRes, 1),

							%% 获取奖励，增加经验
							AddExp = case CanUseMoney of
										 true -> Exp * Ber * Number;
										 _ -> Exp * Number
							         end,
							case AddExp > 0 of
								true -> playerBase:addExp(erlang:trunc(AddExp), ?ExpSourceFindRes, ACID);
								_ -> skip
							end,

							%%增加神力
							AddLiveness = case CanUseMoney of
								              true -> trunc(Liveness * Ber * Number);
								              _ -> trunc(Liveness * Number)
										  end,
							playerliveness:addTotalLivenessValue(AddLiveness),


							%%增加道具
							%% 获取奖励，
							case ItemReward of
								[] ->
									skip;
								[ItemId, Num] ->
									AdditemNum = case CanUseMoney of
										             true -> Ber * Num;
										             _ -> Num
									             end,
									Plog = #recPLogTSItem{
										old = 0,
										new = AdditemNum,
										change = 1,
										target = ?PLogTS_PlayerSelf,
										source = ?PLogTS_FindRes,
										gold = 0,
										goldtype = 0,
										changReason = ?ItemSourceFindRes,
										reasonParam = ItemId
									},
									playerPackage:addGoodsAndMail(ItemId, AdditemNum, true, 0, Plog)
							end,



							%% 获取奖励，增加货币
							Log = #recPLogTSMoney{
								reason = ?CoinSourceFindRes,
								param = ACID,
								target = ?PLogTS_PlayerSelf,
								source = ?PLogTS_FindRes
							},
							F =
								fun({MoneyType, Money}) ->
									AddMoney = case CanUseMoney of
										           true -> Money * Ber * Number;
										           _ -> Money * Number
									           end,
									playerMoney:addCoin(MoneyType, erlang:trunc(AddMoney), Log)
								end,
							lists:foreach(F, Moneys),
							NeedDiamond;
						_ ->
							0
					end;
				_ ->
					0
			end;
		_ ->
			0
	end.

%% 根据当前等级获取玩家的资源找回列表
getFindResListByLevel() ->
	PlayerLvl = playerState:getLevel(),
	KeyList = getCfg:get1KeyList(cfg_find_res),
	ConfList = lists:map(fun(Key) -> getCfg:getCfgByKey(cfg_find_res, Key) end, KeyList),
	F =
		fun(Type, Acc) ->
			case getFindResConfByLevel(PlayerLvl, Type, ConfList) of
				#find_resCfg{} = Conf ->
					Data = getFindResDataByConf(Conf),
					[{Conf, Data} | Acc];
				_ ->
					Acc
			end
		end,
	lists:foldl(F, [], lists:seq(?PlayerFindRes_Start, ?PlayerFindRes_End)).

getFindResConfByLevel(ResType) ->
	Lvl = playerState:getLevel(),
	getFindResConfByLevel(Lvl, ResType).
getFindResConfByLevel(PlayerLvl, ResType) ->
	KeyList = getCfg:get1KeyList(cfg_find_res),
	ConfList = lists:map(fun(Key) -> getCfg:getCfgByKey(cfg_find_res, Key) end, KeyList),
	getFindResConfByLevel(PlayerLvl, ResType, ConfList).
getFindResConfByLevel(PlayerLvl, ResType, ConfList) ->
	F =
		fun(#find_resCfg{ac_id = AcID, open_level = OLvl, lvl_s = LvlS, lvl_e = LvlE}) ->
			AcID =:= ResType andalso PlayerLvl >= OLvl andalso PlayerLvl >= LvlS andalso PlayerLvl =< LvlE
		end,
	case lists:filter(F, ConfList) of
		[] ->
			{};
		[#find_resCfg{} = Conf|_] ->
			Conf
	end.

newResState(ACID, Max) ->
	Cur = getCompleteTimes(ACID),
	NewP1 = erlang:max(0, Max - Cur),

	RoleID = playerState:getRoleID(),
	New = #rec_player_find_res{
		roleID = {RoleID, ACID},
		activityID = ACID,
		param1 = NewP1,
		param2 = 0,
		freshtime = time:getSyncTime1970FromDBS()
	},

	%% 保存
	saveRes(true, New, 0),
	New.

%% 保存资源找回
%% Type = 0 表示新插入
%% Type = 1 表示更新
saveRes(false, _Res, _Type) ->
	%% 没有改变，不保存
	ok;
saveRes(true, #rec_player_find_res{roleID = Key} = Res, Type) ->
	%% 保存到内存数据库
	edb:writeRecord(Res),

	%% 保存到进程字典
	List = playerPropSync:getProp(?SerProp_playerFindRes),
	NewList = lists:keystore(Key, #rec_player_find_res.roleID, List, Res),
	playerPropSync:setAny(?SerProp_playerFindRes, NewList),

	%% 保存到数据库
	gsSendMsg:sendMsg2DBServer(savePlayerFindRes, playerState:getAccountID(), {Res, Type}),
	ok.

dailyReset(DailyType, ResType, IsReset, Count, NowTime) ->
	case playerState:isFirstEnterMap() of
		false ->
			dailyReset2(DailyType, ResType, IsReset, Count, NowTime);
		_ ->
			skip
	end,
	ok.

dailyReset2(?DailyType_LoopTaskNum, ?PlayerXHRWID, IsReset, Count, NowTime) ->
	freshFindRes(?PlayerFindRes2, IsReset, Count, NowTime),
	ok;
dailyReset2(?DailyType_Everyday, ?PlayerEveryDay_Escort_Solo, IsReset, Count, NowTime) ->
	freshFindRes(?PlayerFindRes4, IsReset, Count, NowTime),
	ok;
dailyReset2(?DailyType_WarriorTrial, 1, IsReset, Count, NowTime) ->
	freshFindRes(?PlayerFindRes5, IsReset, Count, NowTime),
	ok;
dailyReset2(?DailyType_EnterCopyMap, ?MoneyCopyMapID, IsReset, Count, NowTime) ->
	freshFindRes(?PlayerFindRes6, IsReset, Count, NowTime),
	ok;
dailyReset2(?DailyType_Ladder1v1, 2, IsReset, Count, NowTime) ->
	freshFindRes(?PlayerFindRes7, IsReset, Count, NowTime),
	ok;
dailyReset2(?DailyType_Ladder1v1, 3, IsReset, Count, NowTime) ->
	freshFindRes(?PlayerFindRes7, IsReset, Count, NowTime),
	ok;
dailyReset2(?DailyType_EnterCopyMapGroup, ?ExpCopyMapGroupID, IsReset, Count, NowTime) ->
	freshFindRes(?PlayerFindRes8, IsReset, Count, NowTime),
	ok;
dailyReset2(?DailyType_NeedForSpeedJoinNumber, _, IsReset, Count, NowTime) ->
	freshFindRes(?PlayerFindRes9, IsReset, Count, NowTime),
	ok;
dailyReset2(?DailyType_EnterCopyMapGroup, ?MaterialCopyMapGroupID, IsReset, Count, NowTime) ->
	freshFindRes(?PlayerFindRes10, IsReset, Count, NowTime),
	ok;
dailyReset2(?DailyType_EnterCopyMap, MapID, IsReset, Count, NowTime) ->
	%% 要判断副本ID
	case lists:member(MapID, ?PlayerJTDRBMapList) of
		true ->
			%% 军团单人本
			case getCopyMapFilter(?PlayerJTDRBMapList) of
				[MapID|_] -> freshFindRes(?PlayerFindRes3, IsReset, Count, NowTime);
				_ -> skip
			end;
		_ ->
			skip
	end,
	case lists:member(MapID, ?PlayerBWXYMapID) of
		true ->
			case getCopyMapFilter(?PlayerBWXYMapID) of
				[MapID|_] ->
					freshFindRes(?PlayerFindRes1, IsReset, Count, NowTime);
				_ -> skip
			end;

		_ ->
			skip
	end,
	ok;
dailyReset2(_Type, _ID, _IsReset, _Count, _NowTime) ->
	ok.

%% 获取今日完成的次数
%%1：保卫小羊
%%2：每日任务（循环任务）
%%3：军团单人本
%%4：荒野护送
%%5：勇者试炼
%%6：惊天喵盗团（金币副本）
%%7：竞技场
%%8：经验副本
%%9：港口竞速
%%10：元素保卫战（材料副本）

getCompleteTimes(?PlayerFindRes1) ->
	%% 181
	getTimes(?PlayerBWXYMapID);
getCompleteTimes(?PlayerFindRes2) ->
	playerDaily:getDailyCounter(?DailyType_LoopTaskNum, ?PlayerXHRWID);
getCompleteTimes(?PlayerFindRes3) ->
	%% 5002~5006
	getTimes(?PlayerJTDRBMapList);
getCompleteTimes(?PlayerFindRes4) ->
	playerDaily:getDailyCounter(?DailyType_Everyday, ?PlayerEveryDay_Escort_Solo);
getCompleteTimes(?PlayerFindRes5) ->
	playerDaily:getDailyCounter(?DailyType_WarriorTrial, 1);
getCompleteTimes(?PlayerFindRes6) ->
	playerDaily:getDailyCounter(?DailyType_EnterCopyMap, ?MoneyCopyMapID);
getCompleteTimes(?PlayerFindRes7) ->
	playerDaily:getDailyCounter(?DailyType_Ladder1v1, 2) + playerDaily:getDailyCounter(?DailyType_Ladder1v1, 3);
getCompleteTimes(?PlayerFindRes8) ->
	playerDaily:getDailyCounter(?DailyType_EnterCopyMapGroup, ?ExpCopyMapGroupID);
getCompleteTimes(?PlayerFindRes9) ->
	playerDaily:getDailyCounter(?DailyType_NeedForSpeedJoinNumber, 0);
getCompleteTimes(?PlayerFindRes10) ->
	playerDaily:getDailyCounter(?DailyType_EnterCopyMapGroup, ?MaterialCopyMapGroupID);
getCompleteTimes(_) ->
	99999.

getTimes(L) ->
	case getCopyMapFilter(L) of
		[MID|_] -> playerDaily:getDailyCounter(?DailyType_EnterCopyMap, MID);
		_ -> 99999
	end.
getCopyMapFilter(L) ->
	Lvl = playerState:getLevel(),
	F =
		fun(MapID) ->
			case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
				#mapsettingCfg{playerEnter_MinLevel = Lvls, playerEnter_MaxLevel = Lvle} ->
					Lvl >= Lvls andalso Lvl =< Lvle;
				_ ->
					false
			end
		end,
	lists:filter(F, L).

getFindResDataByConf({}) ->
	{};
getFindResDataByConf(#find_resCfg{ac_id = ACID, max_times = Max}) ->
	List = playerPropSync:getProp(?SerProp_playerFindRes),
	case lists:keyfind(ACID, #rec_player_find_res.activityID, List) of
		#rec_player_find_res{freshtime = FreshTime, param1 = P1} = Res ->
			%% 要更新
			NowTime = time:getSyncTime1970FromDBS(),

			{{Year, Month, Day}, {Hour, _Minute, _Second}} = time:convertSec2DateTime(FreshTime),
			Mid = time:convertDateTime1970ToSec({{Year, Month, Day}, {?ResetTimeHour, 0, 0}}),
			{Start, End} = case Hour >= ?ResetTimeHour of
				               true ->
					               {Mid, Mid + ?One_Day_Second};
				               _ ->
					               {Mid - ?One_Day_Second, Mid}
			               end,

			Cur = getCompleteTimes(ACID),
			NewP1 = erlang:max(0, Max - Cur),

			NewRes =
				if
					NowTime < Start ->
						%% 这种情况，除了调服务器时间，其它不可能发生，那么保持不变
						Res;
					NowTime >= Start andalso NowTime < End ->
						%% 同一天，不改变
						Res;
					NowTime >= End andalso NowTime - End < ?One_Day_Second ->
						%% 只大了一天
						Res#rec_player_find_res{param1 = NewP1, param2 = P1, freshtime = NowTime};
					true ->
						%% 大了很多天
						Res#rec_player_find_res{param1 = NewP1, param2 = Max, freshtime = NowTime}
				end,

			%% 保存并返回
			saveRes(Res /= NewRes, NewRes, 1),
			NewRes;
		_ ->
			newResState(ACID, Max)
	end.

%% IsReset不需要重置时，Count为今日的次数，需要重置时，Count为上一次的次数（上一次可能是昨天，也可能是久远）
freshFindRes(ACID, IsReset, Count, NowTime) ->
	case getFindResConfByLevel(ACID) of
		#find_resCfg{max_times = Max} ->
			List = playerPropSync:getProp(?SerProp_playerFindRes),
			case lists:keyfind(ACID, #rec_player_find_res.activityID, List) of
				#rec_player_find_res{param1 = P1, freshtime = FreshTime} = Res ->
					NewRes =
						case IsReset of
							false ->
								NewP1 = erlang:max(0, Max - Count),

								%% 判断刷新时间是否已跨天
								case core:timeIsOnDay(NowTime, FreshTime) of
									true ->
										Res#rec_player_find_res{param1 = NewP1, freshtime = NowTime};
									_ ->
										Res#rec_player_find_res{param1 = NewP1, param2 = P1, freshtime = NowTime}
								end;
							true ->
								%% 需要重置了
								case core:timeIsOnDay(NowTime, FreshTime) of
									true ->
										Res;
									_ ->
										Res#rec_player_find_res{param1 = Max, param2 = P1, freshtime = NowTime}
								end
						end,
					%% 保存
					saveRes(Res /= NewRes, NewRes, 1);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.