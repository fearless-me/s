%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170303
%%%-------------------------------------------------------------------

-module(playerPetTerritory).
-author("meitianyang").
-include("playerPrivate.hrl").
-include("../activity/gameactivity/petTerritory/acPetTerritoryPrivate.hrl").

-export([
	init/0,
	queryTerritory/0,
	queryHistory/1,
	exploit/4,
	search/1,
	searchAck/1,
	plunder/3,
	plunderAck/1,
	queryVigor/0,
	deleteRole/1
]).

-export([
	getVigor/0,
	costVigor/1,
	settleReward/1
]).

%%% ====================================================================
%%% MSG functions
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 上线初始化
-spec init() -> ok.
init() ->
	RoleID = playerState:getRoleID(),
	case ets:lookup(?EtsTerritoryPlayerData, RoleID) of
		[PlayerData] ->
			acPetTerritoryLogic:checkAndNoticeOnlineLordOne(PlayerData);
		_ ->
			skip
	end,
	ok.

%%% --------------------------------------------------------------------
%% 查询自己的领地信息
-spec queryTerritory() -> ok.
queryTerritory() ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForPetTerritory] queryTerritory RoleID:~p", [RoleID]),
	%% 首先检测领地是否需要结算
	ListTerritory = acPetTerritoryState:queryPlayer(RoleID),
	FunCheckSettle =
		fun(Territory, {_, _}) ->
			{acPetTerritoryLogic:checkTerritory_Settle(Territory) =/= ?TerritorySettleState_None, 0}
		end,
	case misc:foldlEx(FunCheckSettle, {false, 0}, ListTerritory) of
		{true, _} ->
			%?DEBUG_OUT("[DebugForPetTerritory] queryTerritory RoleID:~p ListTerritory:~n~p", [RoleID, ListTerritory]),
			%% 存在需要结算的领地，通知公共进程结算，等待反馈后再给客户端发送消息
			core:sendMsgToActivity(?ActivityType_PetTerritory, petTerritory_settle, RoleID);
		_ ->
			%?DEBUG_OUT("[DebugForPetTerritory] queryTerritory RoleID:~p ListTerritory:~n~p", [RoleID, ListTerritory]),
			%% 不存在需要结算的领地，向客户端发送消息
			queryTerritory_sendNetMsg(),
			%% 如果存在需要领奖的领地，则通知公共进程领奖
			FunCheckReward =
				fun(#rec_player_territory{timeFresh = TimeFresh, timeEnd = TimeEnd}, {_, _}) ->
					{TimeFresh >= TimeEnd, 0}
				end,
			case misc:foldlEx(FunCheckReward, {false, 0}, ListTerritory) of
				{true, _} ->
					%?DEBUG_OUT("[DebugForPetTerritory] queryTerritory"),
					core:sendMsgToActivity(?ActivityType_PetTerritory, petTerritory_reward, RoleID);
				_ ->
					%?DEBUG_OUT("[DebugForPetTerritory] queryTerritory"),
					skip
			end
	end,
	ok.

%%% --------------------------------------------------------------------
%% 查询自己的攻防记录
-spec queryHistory(AOD::boolean()) -> ok.
queryHistory(true) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForPetTerritory] queryHistoryA RoleID:~p", [RoleID]),
	FunCreateMsg =
		fun(
			#rec_player_territory_history_a{
				timeEvent		= TimeEvent,
				targetRoleID	= TargetRoleID,
				territoryID		= TerritoryID,
				cfgReward		= CfgReward,
				count1			= Count1,
				count2			= Count2
			},
			{Count, R}
		) ->
			case Count1 =:= 0 andalso Count2 =:= 0 of
				true ->
					{Count + 1, R};
				_ ->
					MsgCell =
						#pk_TerritoryHistoryCell{
							time		= TimeEvent,
							roleName	= playerNameUID:getPlayerNameByUID(TargetRoleID),
							roleID		= TargetRoleID,
							territoryID	= TerritoryID,
							cfgReward	= CfgReward,
							count1		= Count1,
							count2		= Count2
						},
					{Count + 1, [MsgCell | R]}
			end
		end,
	{Count, ListMsgCell} = lists:foldl(FunCreateMsg, {0, []}, acPetTerritoryState:queryHistoryA(RoleID)),
	playerMsg:sendNetMsg(
		#pk_GS2U_QueryTerritoryHistory_Ack{
			attackOrDefense = true,
			fightCount		= Count,
			listInfo		= ListMsgCell
		}
	),
	ok;
queryHistory(false) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForPetTerritory] queryHistoryD RoleID:~p", [RoleID]),
	FunCreateMsg =
		fun(
			#rec_player_territory_history_d{
				timeEvent		= TimeEvent,
				targetRoleID	= TargetRoleID,
				territoryID		= TerritoryID,
				cfgReward		= CfgReward,
				count1			= Count1,
				count2			= Count2
			},
			{Count, R}
		) ->
			case Count1 =:= 0 andalso Count2 =:= 0 of
				true ->
					{Count + 1, R};
				_ ->
					MsgCell =
						#pk_TerritoryHistoryCell{
							time		= TimeEvent,
							roleName	= playerNameUID:getPlayerNameByUID(TargetRoleID),
							roleID		= TargetRoleID,
							territoryID	= TerritoryID,
							cfgReward	= CfgReward,
							count1		= Count1,
							count2		= Count2
						},
					{Count + 1, [MsgCell | R]}
			end
		end,
	{Count, ListMsgCell} = lists:foldl(FunCreateMsg, {0, []}, acPetTerritoryState:queryHistoryD(RoleID)),
	playerMsg:sendNetMsg(
		#pk_GS2U_QueryTerritoryHistory_Ack{
			attackOrDefense = false,
			fightCount		= Count,
			listInfo		= ListMsgCell
		}
	),
	ok.

%%% --------------------------------------------------------------------
%% 开采请求
-spec exploit(TerritoryID::uint32(), ListPetIDMsg::[uint64(), ...], CfgTime::uint32(), CfgLevel::uint32()) -> ok.
exploit(TerritoryID, ListPetIDMsg, CfgTime, CfgLevel) ->
	RoleID = playerState:getRoleID(),
	ListPetID =
		case erlang:length(ListPetIDMsg) > ?CountPetMaxOfTerritory of
			true ->
				lists:split(?CountPetMaxOfTerritory, ListPetIDMsg);
			_ ->
				ListPetIDMsg
		end,
	%?DEBUG_OUT("[DebugForPetTerritory] exploit RoleID:~p TerritoryID:~p CfgTime:~p CfgLevel:~p ListPetID:~p",
	%	[RoleID, TerritoryID, CfgTime, CfgLevel, ListPetID]),
	%% 1.验证领地ID是否合法
	case exploit_TerritoryID(RoleID, TerritoryID) of
		false ->
			skip;
		_ ->
			%% 2.验证派驻骑宠是否合法
			case ListPetID of
				[] ->
					?ERROR_CODE(?ErrorCode_PetTerritory_Exploit_PetNone);	%% 需要派驻骑宠
				_ ->
					case exploit_checkPetID(ListPetID, 0) of
						0 ->
							%% 3.验证各种配置是否合法（除了领地等级配置）
							case exploit_Cfg(ListPetID, CfgTime) of
								{false, _} ->
									skip;
								{true, {CfgReward, CfgForce, TimeExploit}} ->
									%% 4.验证领地等级配置是否合法（要扣钱）
									case exploit_CfgLevel(CfgTime, CfgLevel) of
										false ->
											skip;
										_ ->
											%% z.执行开采
											exploit_Occupy(TerritoryID, ListPetID, CfgTime, CfgLevel, CfgReward, CfgForce, TimeExploit)
									end
							end;
						_ ->
							skip
					end
			end
	end,
	ok.

%%% --------------------------------------------------------------------
%% 搜索请求
-spec search(TargetRoleID::uint64()) -> ok.

%% 非针对性搜索
search(0) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForPetTerritory] search RoleID:~p", [RoleID]),
	case playerPropSync:getProp(?SerProp_PetTerritorySearch) of
		[] ->
			%% 根据搜索次数索要报酬，超过配置上限，使用最大配置
			CountDaily = playerDaily:getDailyCounter(?DailyType_PetTerritorySearch, 0) + 1,
			CountMax = erlang:length(getCfg:get1KeyList(cfg_pet_territory_search)),
			CountNow = erlang:min(CountDaily, CountMax),
			case getCfg:getCfgPStack(cfg_pet_territory_search, CountNow) of
				#pet_territory_searchCfg{coinUseCount = 0} ->
					playerPropSync:setAny(?SerProp_PetTerritorySearch, [{0, 0}]),
					playerDaily:incDailyCounter(?DailyType_PetTerritorySearch, 0),
					core:sendMsgToActivity(?ActivityType_PetTerritory, petTerritory_search, {RoleID, 0});
				#pet_territory_searchCfg{coinUseType = CoinUseType, coinUseCount = CoinUseCount} ->
					%?DEBUG_OUT("[DebugForPetTerritory] search RoleID:~p CountNow:~p CoinUseType:~p CoinUseCount:~p", [RoleID, CountNow, CoinUseType, CoinUseCount]),
					TS = #recPLogTSMoney{reason = ?CoinUsePetTerritorySearch, target = ?PLogTS_PetTerritory, source = ?PLogTS_PlayerSelf},
					case playerMoney:quickUseCoin(CoinUseType, CoinUseCount, TS, {?ErrorCode_PetTerritory_Search_NotEnoughCoin, []}) of
						true ->
							playerPropSync:setAny(?SerProp_PetTerritorySearch, [{CoinUseType, CoinUseCount}]),
							playerDaily:incDailyCounter(?DailyType_PetTerritorySearch, 0),
							core:sendMsgToActivity(?ActivityType_PetTerritory, petTerritory_search, {RoleID, 0});
						_ ->
							skip
					end
			end;
		_ ->
			%% 上一个搜索请求未执行结束，忽略本次请求
			skip
	end,
	ok;

%% 针对性搜索
search(TargetRoleID) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForPetTerritory] search RoleID:~p TargetRoleID:~p", [RoleID, TargetRoleID]),
	core:sendMsgToActivity(?ActivityType_PetTerritory, petTerritory_search, {RoleID, TargetRoleID}),
	ok.

%% 搜索反馈
-spec searchAck({#rec_player_territory{} | undefined, boolean()}) -> ok.

%% 仅非针对性搜索时反馈搜索失败，返还搜索花费货币，弥补搜索次数
searchAck({undefined, _}) ->
	case playerPropSync:getProp(?SerProp_PetTerritorySearch) of
		[{_, 0}] ->
			skip;
		[{?CoinUseTypeGold, CoinUseCount}] ->
			TS = #recPLogTSMoney{reason = ?CoinSourcePetTerritorySearchBack, target = ?PLogTS_PlayerSelf, source = ?PLogTS_PetTerritory},
			playerMoney:addCoin(?CoinTypeGold, CoinUseCount, TS);
		[{?CoinUseTypeDiamond, CoinUseCount}] ->
			TS = #recPLogTSMoney{reason = ?CoinSourcePetTerritorySearchBack, target = ?PLogTS_PlayerSelf, source = ?PLogTS_PetTerritory},
			playerMoney:addCoin(?CoinTypeBindDiamond, CoinUseCount, TS)
	end,
	playerPropSync:setAny(?SerProp_PetTerritorySearch, []),
	Count = playerDaily:getDailyCounter(?DailyType_PetTerritorySearch, 0),
	playerDaily:zeroDailyCount(?DailyType_PetTerritorySearch, 0),
	playerDaily:addDailyCounter(?DailyType_PetTerritorySearch, 0, Count - 1),
	ok;

%% 搜索成功，组织消息反馈客户端
searchAck({
	#rec_player_territory{
		roleID = RoleID,
		territoryID = TerritoryID,
		cfgReward = CfgReward,
		cfgTime = CfgTime,
		cfgLevel = CfgLevel,
		cfgForce = CfgForce,
		timeFresh = TimeFresh,
		timeEnd = TimeEnd,
		rewardCount1 = RewardCount1,
		rewardCount2 = RewardCount2,
		timeSafe = TimeSafe,
		timeSearch = TimeSearch
	},
	IsAntiPlunder
}) ->
	%% 消除临时消费记录
	case IsAntiPlunder of
		false ->
			playerPropSync:setAny(?SerProp_PetTerritorySearch, []);
		_ ->
			skip
	end,
	%% 构造领地信息
	#globalsetupCfg{setpara = [BattleCD]} =
		getCfg:getCfgPStack(cfg_globalsetup, petTerritory_battleCD),
	Territory =
		#pk_TerritoryInfo{
			territoryID = TerritoryID,
			cfgReward = CfgReward,
			cfgTime = CfgTime,
			cfgLevel = CfgLevel,
			cfgForce = CfgForce,
			timeFresh = TimeFresh,
			timeEnd = TimeEnd,
			rewardCount1 = RewardCount1,
			rewardCount2 = RewardCount2,
			timeSafe = TimeSafe,
			timeSearch = TimeSearch - BattleCD	%% 扣除战斗预留时间
		},
	%% 构造骑宠信息
	ListPet = acPetTerritoryState:queryPetByTerritoryID(RoleID, TerritoryID),
	ListPetForNetMsg =
		[
			#pk_PetTerritoryInfo{
				petID = PetID,
				petForce = PetForce,
				territoryID = TerritoryID,
				star = Star,
				raw = Raw
			} ||
			#rec_player_territory_pet{
				petID = PetID,
				petForce = PetForce,
				star = Star,
				raw = Raw
			} <- ListPet
		],
	%% 发送消息
	Msg =
		#pk_GS2U_FindTerritory_Ack{
			info = Territory,
			listInfo = ListPetForNetMsg,
			roleID = RoleID,
			roleName = playerNameUID:getPlayerNameByUID(RoleID),
			count = playerDaily:getDailyCounter(?DailyType_PetTerritorySearch, 0)
		},
	playerMsg:sendNetMsg(Msg),
	ok.

%%% --------------------------------------------------------------------
%% 掠夺请求
-spec plunder(TargetRoleID::uint64(), TerritoryID::uint32(), ListPetIDMsg::[uint64(), ...]) -> ok.
plunder(TargetRoleID, TerritoryID, ListPetIDMsg) ->
	RoleID = playerState:getRoleID(),
	ListPetID =
		case erlang:length(ListPetIDMsg) > ?CountPetMaxOfTerritory of
			true ->
				lists:split(?CountPetMaxOfTerritory, ListPetIDMsg);
			_ ->
				ListPetIDMsg
		end,
	%?DEBUG_OUT("[DebugForPetTerritory] plunder RoleID:~p TargetRoleID:~p TerritoryID:~p ListPetID:~p", [RoleID, TargetRoleID, TerritoryID, ListPetID]),
	%% 验证派驻骑宠是否合法
	case ListPetID of
		[] ->
			?ERROR_CODE(?ErrorCode_PetTerritory_Plunder_PetNone);	%% 需要派驻骑宠
		_ ->
			case plunder_checkPetID(ListPetID, 0) of
				0 ->
					%% 如果战斗地图已经存在则进入，否则交由公共进程处理
					case acPetTerritoryState:queryBattleMap(RoleID) of
						#recBattleMap{state = ?BattleMapState_Creating} ->
							skip;
						#recBattleMap{state = ?BattleMapState_Settle} ->
							skip;
						#recBattleMap{mapPid = MapPid} ->
							plunderAck(MapPid);
						_ ->
							#globalsetupCfg{setpara = [Cost]} =
								getCfg:getCfgPStack(cfg_globalsetup, petTerritory_vigorCost),
							case costVigor(Cost) of
								true ->
									ListPet = [makePetData(PetID, RoleID, TerritoryID) || PetID <- ListPetID],
									core:sendMsgToActivity(?ActivityType_PetTerritory, petTerritory_plunder, {RoleID, TargetRoleID, TerritoryID, ListPet});
								_ ->
									?ERROR_CODE(?ErrorCode_PetTerritory_Plunder_NotEnoughVigor)	%% 精力不够
							end
					end;
				_ ->
					skip
			end
	end,
	ok.

%%% --------------------------------------------------------------------
%% 掠夺反馈（进入掠夺场景）
-spec plunderAck(MapPid::pid()) -> ok.
plunderAck(MapPid) ->
	MapID = playerState:getMapID(),
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypePetTerritory} ->
			skip;
		#mapsettingCfg{} ->
			%%% 隐藏当前出战宠物（收回）
			% 20170329 余淇星需求，由客户端隐藏
			%case playerPet:getPetBattle() of
			%	false ->
			%		skip;
			%	_ ->
			%		playerPet:petHide()
			%end,
			playerScene:onRequestEnterActivityMap(?PetTerritoryMapID, MapPid);
		_ ->
			?ERROR_OUT("can not find MapID(~p) from cfg_mapsetting", [MapID]),
			false
	end,
	ok.

%%% --------------------------------------------------------------------
%% 查询精力
-spec queryVigor() -> ok.
queryVigor() ->
	%?DEBUG_OUT("[DebugForPetTerritory] queryVigor RoleID:~p", [playerState:getRoleID()]),
	playerMsg:sendNetMsg(
		#pk_GS2U_TerritoryVigor_Ack{
			vigor = getVigor()
		}
	),
	ok.

%%% --------------------------------------------------------------------
%% 删除角色异常处理
-spec deleteRole(RoleID::uint64()) -> ok.
deleteRole(RoleID) ->
	core:sendMsgToActivity(?ActivityType_PetTerritory, petTerritory_deleteRole, RoleID),
	ok.

%%% ====================================================================
%%% API functions
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 获取精力
-spec getVigor() -> uint32().
getVigor() ->
	%?DEBUG_OUT("[DebugForPetTerritory] getVigor RoleID:~p", [playerState:getRoleID()]),
	[TimeLast, Value] = playerPropSync:getProp(?SerProp_PetTerritoryVigor),
	TimeNow = time:getSyncTimeFromDBS(),
	#globalsetupCfg{setpara = [ValueRecover, TimeRecover]} =
		getCfg:getCfgPStack(cfg_globalsetup, petTerritory_vigorRecover),
	#globalsetupCfg{setpara = [ValueMax]} =
		getCfg:getCfgPStack(cfg_globalsetup, petTerritory_vigorMax),
	case (TimeNow - TimeLast) div TimeRecover of
		0 ->
			Value;
		RateDelta ->
			TimeInterval = (TimeNow - TimeLast) rem TimeRecover,
			ValueNew_ =
				case Value + RateDelta * ValueRecover of
					ValueNew when ValueNew > ValueMax ->
						ValueMax;
					ValueNew ->
						ValueNew
				end,
			playerPropSync:setAny(?SerProp_PetTerritoryVigor, [TimeNow - TimeInterval, ValueNew_]),
			ValueNew_
	end.

%%% --------------------------------------------------------------------
%% 尝试消耗精力
-spec costVigor(Cost::uint32()) -> boolean().
costVigor(Cost) ->
	VigorNow = getVigor(),
	case VigorNow >= Cost of
		true ->
			[TimeLast, _] = playerPropSync:getProp(?SerProp_PetTerritoryVigor),
			playerPropSync:setAny(?SerProp_PetTerritoryVigor, [TimeLast, VigorNow - Cost]),
			true;
		_ ->
			false
	end.

%%% --------------------------------------------------------------------
%% 对已最终结算的领地进行发奖
-spec settleReward(Territory::#rec_player_territory{}) -> ok.
settleReward(#rec_player_territory{timeEnd = 0}) ->
	%% 不允许对无效领地调用
	?ERROR_OUT("settleReward invalid territory~n~p", [misc:getStackTrace()]),
	ok;
settleReward(#rec_player_territory{timeFresh = TimeFresh, timeEnd = TimeEnd}) when TimeFresh < TimeEnd ->
	%% 不允许对未完成的领地调用
	?ERROR_OUT("settleReward invalid territory~n~p", [misc:getStackTrace()]),
	ok;
settleReward(#rec_player_territory{
	cfgReward = CfgReward,
	rewardCount1 = RewardCount1,
	rewardCount2 = RewardCount2
}) ->
	#pet_territory_rewardCfg{reward = [{ItemID1, _}, {ItemID2, _}]} =
		getCfg:getCfgPStack(cfg_pet_territory_reward, CfgReward),
	case RewardCount1 > 0 of
		true ->
			CountOld1 = playerPackage:getGoodsCountByID(ItemID1, true),
			TS1 =
				#recPLogTSItem{
					old = CountOld1,
					new = CountOld1 + RewardCount1,
					change = RewardCount1,
					target = ?PLogTS_PlayerSelf,
					source = ?PLogTS_PetTerritory,
					changReason = ?ItemSourcePetTerritoryExploit,
					reasonParam = ItemID1
				},
			playerPackage:addGoodsAndMail(ItemID1, RewardCount1, true, 0, TS1);
		_ ->
			skip
	end,
	case RewardCount2 > 0 of
		true ->
			CountOld2 = playerPackage:getGoodsCountByID(ItemID2, true),
			TS2 =
				#recPLogTSItem{
					old = CountOld2,
					new = CountOld2 + RewardCount2,
					change = RewardCount2,
					target = ?PLogTS_PlayerSelf,
					source = ?PLogTS_PetTerritory,
					changReason = ?ItemSourcePetTerritoryExploit,
					reasonParam = ItemID2
				},
			playerPackage:addGoodsAndMail(ItemID2, RewardCount2, true, 0, TS2);
		_ ->
			skip
	end,
	ok.

%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 查询自己的领地信息_发送网络消息
-spec queryTerritory_sendNetMsg() -> ok.
queryTerritory_sendNetMsg() ->
	%% 收集领地信息
	RoleID = playerState:getRoleID(),
	ListTerritory = acPetTerritoryState:queryPlayer(RoleID),
	ListTerritoryForNetMsg =
		[
			#pk_TerritoryInfo{
				territoryID		= TerritoryID,
				cfgReward		= CfgReward,
				cfgTime			= CfgTime,
				cfgLevel		= CfgLevel,
				cfgForce		= CfgForce,
				timeFresh		= TimeFresh,
				timeEnd			= TimeEnd,
				rewardCount1	= RewardCount1,
				rewardCount2	= RewardCount2,
				timeSafe		= TimeSafe,
				timeSearch		= TimeSearch
			} ||
			#rec_player_territory{
				territoryID		= TerritoryID,
				cfgReward		= CfgReward,
				cfgTime			= CfgTime,
				cfgLevel		= CfgLevel,
				cfgForce		= CfgForce,
				timeFresh		= TimeFresh,
				timeEnd			= TimeEnd,
				rewardCount1	= RewardCount1,
				rewardCount2	= RewardCount2,
				timeSafe		= TimeSafe,
				timeSearch		= TimeSearch
			} <- ListTerritory
		],
	%% 收集骑宠信息前特殊处理
	%% 执行该函数时，可能存在这种临界状态：
	%%		某领地已经完成最终结算，但没有执行领奖操作，所以仍然存在于ETS
	%%		因此该领地上的骑宠仍处于派驻状态
	%%		实际上该函数的下一步马上就会执行领奖操作，因此需要对该部分骑宠做特殊处理，视为空闲状态
	%% 同时也存在这样的临界状态：
	%%		某领地派驻的骑宠已过期
	ListPetOfPlayer = [{PetID, PetForce} || #recPetInfo{pet_id = PetID, pet_force = PetForce} <- playerState:getPets()],
	ListPetOfTerritoryOld = acPetTerritoryState:queryPet(RoleID),
	FunFilterPet =
		fun(#rec_player_territory_pet{territoryID = TerritoryID, petID = PetID} = Rec, R) ->
			case lists:keyfind(TerritoryID, #rec_player_territory.territoryID, ListTerritory) of
				#rec_player_territory{timeFresh = TimeFresh, timeEnd = TimeEnd} when TimeFresh >= TimeEnd ->
					R;
				_ ->
					case lists:keyfind(PetID, 1, ListPetOfPlayer) of
						{PetID, _} ->
							[Rec | R];
						_ ->
							R
					end
			end
		end,
	ListPetOfTerritory = lists:foldl(FunFilterPet, [], ListPetOfTerritoryOld),
	%%?DEBUG_OUT("[DebugForPetTerritory] queryTerritory_sendNetMsg ListPetOfTerritory~n~p", [ListPetOfTerritory]),
	%%?DEBUG_OUT("[DebugForPetTerritory] queryTerritory_sendNetMsg ListPetOfTerritoryOld~n~p", [ListPetOfTerritoryOld]),
	%%?DEBUG_OUT("[DebugForPetTerritory] queryTerritory_sendNetMsg ListPetOfPlayer~n~p", [ListPetOfPlayer]),
	%% 收集骑宠信息
	FunCreateMsg =
		fun
			({PetID, PetForce}, R) ->
				case lists:keyfind(PetID, #pk_PetTerritoryInfo.petID, R) of
					false ->
						[#pk_PetTerritoryInfo{petID = PetID, petForce = PetForce, territoryID = 0, star = 0, raw = 0} | R];
					_ ->
						R
				end;
			(#rec_player_territory_pet{petID = PetID, territoryID = TerritoryID, petForce = PetForce, star = Star, raw = Raw}, R) ->
				[#pk_PetTerritoryInfo{petID = PetID, petForce = PetForce, territoryID = TerritoryID, star = Star, raw = Raw} | R]
		end,
	ListPetForNetMsg = lists:foldl(FunCreateMsg, [], ListPetOfTerritory ++ ListPetOfPlayer),
	%% 发送网络消息
	NetMsg = #pk_GS2U_QueryTerritoryInfo_Ack{
		listTerritory = ListTerritoryForNetMsg,
		listPet = ListPetForNetMsg
	},
	playerMsg:sendNetMsg(NetMsg),
	%%?DEBUG_OUT("[DebugForPetTerritory] queryTerritory_sendNetMsg NetMsg~n~p", [NetMsg]),
	ok.

%%% --------------------------------------------------------------------
%% 开采请求_检查领地
-spec exploit_TerritoryID(RoleID::uint64(), TerritoryID::uint32()) -> boolean().
exploit_TerritoryID(RoleID, TerritoryID) ->
	%% 1.验证目标领地是否正在被开采
	case acPetTerritoryState:queryPlayer(RoleID, TerritoryID) of
		#rec_player_territory{} ->
			?ERROR_CODE(?ErrorCode_PetTerritory_Exploit_Again),	%% 目标正在被开采
			false;
		_E ->
			%?DEBUG_OUT("[DebugForPetTerritory] RoleID:~p TerritoryID:~p _E:~p", [RoleID, TerritoryID, _E]),
			%% 2.验证目标领地是否已开放
			#globalsetupCfg{setpara = [CountBase]} =
				getCfg:getCfgPStack(cfg_globalsetup, petTerritory_count),
			VipLevel = playerState:getVip(),
			CountAll =
				case VipLevel > 0 of
					true ->
						case getCfg:getCfgPStack(cfg_vip_power, ?Reputation_PetTerritory, VipLevel) of
							#vip_powerCfg{param1 = CountVip} ->
								CountVip + CountBase;
							_ ->
								CountBase
						end;
					_ ->
						CountBase
				end,
			case TerritoryID > 0 andalso TerritoryID =< CountAll of
				false ->
					?ERROR_CODE(?ErrorCode_PetTerritory_Exploit_VipLimit),	%% VIP等级不够（或者是ID错误）
					false;
				_ ->
					true
			end
	end.

%%% --------------------------------------------------------------------
%% 开采请求_检查派驻骑宠ID
-spec exploit_checkPetID(ListPetID::[uint64(), ...], MaybeErrorPetID::uint64()|0) -> Result::uint64()|0.
exploit_checkPetID([], MaybeErrorPetID) ->
	MaybeErrorPetID;
exploit_checkPetID([H|T], 0) ->
	R = exploit_checkPetID_(H),
	exploit_checkPetID(T, R);
exploit_checkPetID(_, MaybeErrorPetID) ->
	MaybeErrorPetID.
-spec exploit_checkPetID_(PetID::uint64()) -> Result::uint64()|0.
exploit_checkPetID_(PetID) ->
	%% 1.检测是否已派驻该骑宠
	case acPetTerritoryState:queryPet(playerState:getRoleID(), PetID) of
		#rec_player_territory_pet{territoryID = TerritoryID} when TerritoryID > 0 ->
			#petCfg{petName = PetName} = getCfg:getCfgPStack(cfg_pet, PetID),
			?ERROR_CODE(?ErrorCode_PetTerritory_Exploit_PetSent, [PetName]),	%% 该骑宠已被派驻
			PetID;
		_ ->
			%% 2.检测是否仍拥有该骑宠
			case lists:keyfind(PetID, #recPetInfo.pet_id, playerState:getPets()) of
				false ->
					#petCfg{petName = PetName} = getCfg:getCfgPStack(cfg_pet, PetID),
					?ERROR_CODE(?ErrorCode_PetTerritory_Exploit_PetInvalid, [PetName]),	%% 该骑宠已失效
					PetID;
				_ ->
					0
			end
	end.

%%% --------------------------------------------------------------------
%% 开采请求_检查配置项（领地等级选项不在此函数，因为那个需要扣钱，单独处理）
-spec exploit_Cfg(ListPetID::[uint64(), ...], CfgTime::uint32()) -> {boolean(), {CfgReward::uint32(), CfgForce::uint32(), TimeExploit::uint32()} | 0}.
exploit_Cfg(ListPetID, CfgTime) ->
	%% 1.验证等级段配置
	RoleLevel = playerState:getLevel(),
	List1KeyReward = getCfg:get1KeyList(cfg_pet_territory_reward),
	FunCheckReward =
		fun(Key, {_, OldKey}) ->
			case Key > RoleLevel of
				true ->
					{true, OldKey};
				_ ->
					{false, Key}
			end
		end,
	case misc:foldlEx(FunCheckReward, {false, 0}, List1KeyReward) of
		{_, 0} ->
			?ERROR_CODE(?ErrorCode_PetTerritory_Exploit_CfgReward),	%% 等级段奖励配置错误
			{false, 0};
		{_, CfgReward} ->
			%% 5.验证战力等级段配置
			PetForceAll =
				lists:foldl(
					fun(PetID, R) ->
						#recPetInfo{
							pet_force = PetForce
						} = lists:keyfind(PetID, #recPetInfo.pet_id, playerState:getPets()),
						PetForce + R
					end,
					0,
					ListPetID
				),
			List1KeyForce = getCfg:get1KeyList(cfg_pet_territory_force),
			FunCheckForce =
				fun(Key, {_, OldKey}) ->
					case Key > PetForceAll of
						true ->
							{true, OldKey};
						_ ->
							{false, Key}
					end
				end,
			case misc:foldlEx(FunCheckForce, {false, 0}, List1KeyForce) of
				{_, 0} ->
					?ERROR_CODE(?ErrorCode_PetTerritory_Exploit_CfgForce),	%% 战力段配置错误
					{false, 0};
				{_, CfgForce} ->
					%% 6.验证开采时间选项
					case lists:member(CfgTime, getCfg:get1KeyList(cfg_pet_territory_time)) of
						true ->
							{true, {CfgReward, CfgForce, CfgTime * 3600}};
						_ ->
							?ERROR_CODE(?ErrorCode_PetTerritory_Exploit_CfgTime),	%% 时间选项错误
							{false, 0}
					end
			end
	end.

%%% --------------------------------------------------------------------
%% 开采请求_验证领地等级配置是否合法（要扣钱）
-spec exploit_CfgLevel(CfgTime::uint32(), CfgLevel::uint32()) -> boolean().
exploit_CfgLevel(CfgTime, CfgLevel) ->
	case getCfg:getCfgByKey(cfg_pet_territory_time, CfgTime, CfgLevel) of
		#pet_territory_timeCfg{coinUseCount = 0} ->
			true;	%% 配置说免费
		#pet_territory_timeCfg{coinUseType = CoinUseType, coinUseCount = CoinUseCount} ->
			TS = #recPLogTSMoney{reason = ?CoinUsePetTerritoryBuild, target = ?PLogTS_PetTerritory, source = ?PLogTS_PlayerSelf},
			playerMoney:quickUseCoin(CoinUseType, CoinUseCount, TS, {?ErrorCode_PetTerritory_Exploit_CfgLevelCoin, []});
		_ ->
			?ERROR_CODE(?ErrorCode_PetTerritory_Exploit_CfgLevel),	%% 领地等级错误
			false
	end.

%%% --------------------------------------------------------------------
%% 开采请求_执行占领
%% 注：对未占领的领地只有该角色有操作权限，故角色进程可写
-spec exploit_Occupy(TerritoryID::uint32(), ListPetID::[uint64(), ...], CfgTime::uint32(), CfgLevel::uint32(), CfgReward::uint32(), CfgForce::uint64(), TimeExploit::uint32()) -> ok.
exploit_Occupy(TerritoryID, ListPetID, CfgTime, CfgLevel, CfgReward, CfgForce, TimeExploit) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForPetTerritory] exploit_Occupy RoleID:~p TerritoryID:~p CfgTime:~p CfgLevel:~p ListPetID:~p CfgReward:~p CfgForce:~p TimeExploit:~p",
	%	[RoleID, TerritoryID, CfgTime, CfgLevel, ListPetID, CfgReward, CfgForce, TimeExploit]),
	%% 生成领地数据
	TimeNow = time:getSyncTimeFromDBS(),
	Territory =
		#rec_player_territory{
			roleID = RoleID,
			territoryID = TerritoryID,
			cfgReward = CfgReward,
			cfgTime = CfgTime,
			cfgLevel = CfgLevel,
			cfgForce = CfgForce,
			timeFresh = TimeNow,
			timeEnd = TimeNow + TimeExploit,
			rewardCount1 = 1,
			rewardCount2 = 1,
			timeSafe = 0,
			timeSearch = 0
		},
	%% 生成骑宠数据
	ListPet = [makePetData(PetID, RoleID, TerritoryID) || PetID <- ListPetID],
	%% 写入数据
	MsgCell0 = {acPetTerritoryState:replacePlayer(Territory), Territory},
	Msg0 = [{acPetTerritoryState:replacePet(Pet), Pet} || Pet <- ListPet],
	gsSendMsg:sendMsg2DBWithDBOPT(petTerritory_dbsave, playerState:getAccountID(), [MsgCell0 | Msg0]),
	%% 反馈消息
	Msg =
		#pk_GS2U_TerritoryExploit_Ack{
			info = #pk_TerritoryInfo{
				territoryID = TerritoryID,
				cfgReward = CfgReward,
				cfgTime = CfgTime,
				cfgLevel = CfgLevel,
				cfgForce = CfgForce,
				timeFresh = TimeNow,
				timeEnd = TimeNow + TimeExploit,
				rewardCount1 = 1,
				rewardCount2 = 1,
				timeSafe = 0,
				timeSearch = 0
			},
			listInfo = [
				#pk_PetTerritoryInfo{
					petID			= PetID,
					territoryID		= TerritoryID,
					petForce		= PetForce,
					star			= Star,
					raw				= Raw
				} ||
				#rec_player_territory_pet{
					petID			= PetID,
					petForce		= PetForce,
					star			= Star,
					raw				= Raw
				} <- ListPet
			]
		},
	playerMsg:sendNetMsg(Msg),
	ok.

%%% --------------------------------------------------------------------
%% 掠夺请求_检查派驻骑宠ID（需求变更，已派驻的骑宠可以参与掠夺）
-spec plunder_checkPetID(ListPetID::[uint64(), ...], MaybeErrorPetID::uint64()|0) -> Result::uint64()|0.
plunder_checkPetID([], MaybeErrorPetID) ->
	MaybeErrorPetID;
plunder_checkPetID([H|T], 0) ->
	R = plunder_checkPetID_(H),
	plunder_checkPetID(T, R);
plunder_checkPetID(_, MaybeErrorPetID) ->
	MaybeErrorPetID.
-spec plunder_checkPetID_(PetID::uint64()) -> Result::uint64()|0.
plunder_checkPetID_(PetID) ->
	%% 检测是否仍拥有该骑宠
	case lists:keyfind(PetID, #recPetInfo.pet_id, playerState:getPets()) of
		false ->
			#petCfg{petName = PetName} = getCfg:getCfgPStack(cfg_pet, PetID),
			?ERROR_CODE(?ErrorCode_PetTerritory_Exploit_PetInvalid, [PetName]),	%% 该骑宠已失效
			PetID;
		_ ->
			0
	end.

%%% --------------------------------------------------------------------
%% 根据骑宠ID查找并生成骑宠数据（需要确认骑宠确实有效）
-spec makePetData(PetID::uint32(), RoleID::uint64(), TerritoryID::uint32()) -> #rec_player_territory_pet{}.
makePetData(PetID, RoleID, TerritoryID) ->
	Level = playerState:getLevel(),
	Pets = playerState:getPets(),
	{F, S, R} =
		case lists:keyfind(PetID, #recPetInfo.pet_id, Pets) of
			#recPetInfo{pet_force = F_, pet_star = S_, pet_raw = R_} ->
				{F_, S_, R_};
			_ ->
				{0, 0, 0}
		end,
	#rec_player_territory_pet{
		roleID = RoleID,
		petID = PetID,
		petLevel = Level,
		territoryID = TerritoryID,
		petForce = F,
		prop = playerPet:getPetProps(PetID),
		skill = playerPet:getPetSkills(PetID),
		star = S,
		raw = R
	}.
