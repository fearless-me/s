%% @author zhengzhichun
%% @doc @todo Add description to playerLowCopyMapAuto.
%%副本扫荡（策划王亚栋）


-module(playerLowCopyMapAuto).
-include("playerPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	getLowCopyMapReward/1
]).

%%副本扫荡，条件满足，直接得指定副本的奖励
-spec getLowCopyMapReward(MapID :: uint32()) -> ok.
getLowCopyMapReward(MapID) ->
	Score = playerCopyMapReward:getCopyMapMaxScore(MapID),
	case getCfg:getCfgByKey(cfg_dungeonschallenge, MapID) of
		#dungeonschallengeCfg{time_1 = SupperScore} ->
			SupperScore;
		_ ->
			?WARN_OUT("getLowCopyMapReward MapID:~p is can not found from cfg_dungeonschallenge", [MapID]),
			SupperScore = 0
	end,
	if
		(Score =< SupperScore) and (Score > 0) ->
			getLowCopyMapReward1(MapID);
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_CopyMap_NOT_GET_SUPER_SCORE)
	end.
getLowCopyMapReward1(MapID) ->
	DayCount = playerDaily:getDailyCounter(?DailyType_EnterCopyMap, MapID),
	LevelDeffer =
		case getCfg:getCfgPStack(cfg_globalsetup, sweep_level) of
			#globalsetupCfg{setpara = [LevelDeffer1]} ->
				LevelDeffer1;
			_ ->
				0
		end,
	PlayerLevel = playerState:getLevel() - LevelDeffer,
	BuyCount = playerDaily:getDailyCounter(?DailyType_BuyCopyMap_Number, MapID),
	Result =
		case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
			#mapsettingCfg{daily_effectivecount = MaxAwardLimit, daily_entercount = EnterCount, playerEnter_MinLevel = MinLevel, useVitality = UseVitality} when ((DayCount < EnterCount + BuyCount) orelse (EnterCount =:= 0)) and (DayCount < MaxAwardLimit + BuyCount) ->
				IsEnoughActivePoint = playerActionPoint:getActionPoint() >= UseVitality,
				if
					erlang:is_integer(MinLevel) andalso MinLevel =< PlayerLevel ->
						if
							IsEnoughActivePoint =:= true ->
								playerActionPoint:deductActionPoint(UseVitality),
								getSweeping(MapID);
							true ->
								playerMsg:sendErrorCodeMsg(?ErrorCode_ActionPointNotEnough)
						end;
					true ->
						playerMsg:sendErrorCodeMsg(?ErrorCode_CopyMapLevelLimit),
						skip
				end;
			_ ->
				playerMsg:sendErrorCodeMsg(?ErrorCode_CopyMapEffectiveCountLimit),
				skip
		end,

	R =
		case Result of
			#pk_GS2U_RequestAutoDealAck{} ->
				Result;
			_ ->
				#pk_GS2U_RequestAutoDealAck{
					isSuccess = false,
					copyMapID = MapID,
					coinReward = [],
					expReward = 0,
					dropItems = []
				}
		end,
	?DEBUG_OUT("zzc======~p", [R]),
	playerMsg:sendNetMsg(R),

	#mapsettingCfg{type = Type, subtype = SubType, useVitality = DecrActionPoint} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
	case SubType of
		?MapSubTypeNormal -> playerliveness:onFinishLiveness(?LivenessNormalCopy, 1);
		?MapSubTypeHeroCopy ->
			playerliveness:onFinishLiveness(?LivenessHeroCopy, 1);
		?MapSubTypeChanllengeCopy ->
			playerliveness:onFinishLiveness(?LivenessChallageCopy, 1);
		?MapSubTypeExpCopyMap ->
			playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_LuoLi),
			playerliveness:onFinishLiveness(?LivenessExpCopyMap, 1)
		% 金币副本只是一个假装自己是副本的活动，此处不会被执行到，请移驾playerCopyMapReward:onPassCopyMap_MoneyDungeon
		%?MapSubTypeMoneyDungeon->
		%	playerliveness:onFinishLiveness(?LivenessMoneyDungeon,1)
	end,

	%% 记录副本日志
	case Type of
		?MapTypeCopyMap ->
			if SubType =:= ?MapSubTypeNormal orelse SubType =:= ?MapSubTypeHeroCopy orelse SubType =:= ?MapSubTypeChanllengeCopy ->
				EndTime = time:getLogTimeSec(),
				FunH = fun(#pk_CoinData{coinType = CoinType, value = Value}, AccList) ->
					if Value > 0 ->
						[{CoinType, Value} | AccList];
						true ->
							AccList
					end
				       end,
				LL1 = lists:foldl(FunH, [], R#pk_GS2U_RequestAutoDealAck.coinReward),

				FunD = fun(X, AccList) ->
					case X of
						#pk_CopyMapDropItem{itemID = ItemID, number = Number} ->
							[{ItemID, Number} | AccList];
						#rec_item{itemID = ItemID, pileNum = PileNum} ->
							[{ItemID, PileNum} | AccList];
						_ ->
							AccList
					end
				       end,
				LL2 = lists:foldl(FunD, [], R#pk_GS2U_RequestAutoDealAck.dropItems),
				LogCopy = #rec_log_copy{
					accountID = playerState:getAccountID(),
					roleID = playerState:getRoleID(),
					copyMapType = SubType,            %%副本类型（剧情、英雄、挑战）
					copyMapID = MapID,
					startTime = EndTime,
					decrActionPoint = DecrActionPoint,
					isPass = 1,                    %%是否通关 （0表示未通关  1表示通关）
					endTime = EndTime,
					goldReward = LL1,
					expReward = R#pk_GS2U_RequestAutoDealAck.expReward,
					dropItems = LL2
				},
				dbLog:sendSaveLogCopyInfo(LogCopy);
				true ->
					ok
			end;
		_ ->
			ok
	end,
	ok.

%%根据copymapID掉落扫荡包
-spec getSweeping(CopyMapID :: uint16()) -> #pk_GS2U_RequestAutoDealAck{} | skip.
getSweeping(CopyMapID) ->
	case getCfg:getCfgPStack(cfg_sweeping_drop, CopyMapID) of
		#sweeping_dropCfg{
			cost_money = CostMoney,
			drop = DropID,
			exp = Exp,
			gold = [BindGoldMin, BindGoldMax],
			purple = [PurpleMin, PurpleMax],
			golden = [GoldenMin, GoldenMax]
		} ->
			LogParam = #recPLogTSMoney{reason = ?CoinUseLowCopyMapAuto, param = CopyMapID, target = ?PLogTS_Sweep, source = ?PLogTS_PlayerSelf},
			case playerMoney:useCoin(?CoinUseTypeGold, CostMoney, LogParam) of
				true ->
					?DEBUG_OUT("getSweeping================CopyMapID=~p~n", [CopyMapID]),
					playerDaily:incDailyCounter(?DailyType_EnterCopyMap, CopyMapID),
					playerCopyMap:incEnterCopyMapGroupDailyCount(CopyMapID),
					%%开掉落包
					DropItemList = playerDrop:goodsDrop(DropID, CopyMapID, ?ItemSweepingCopyMap),

%%							[{_, [#rec_item{}| _]}| _] = DropItemList ->
%%								[#pk_CopyMapDropItem{
%%									itemUID = ItemUID,
%%									itemID = ItemID,
%%									number = DropNum,
%%									quality = Quality,
%%									isBind = IsBind
%%								} ||
%%									{DropNum,
%%										[#rec_item{
%%											itemUID = ItemUID, itemID = ItemID, isBind = IsBind, quality = Quality
%%										} | _]
%%									} <- DropItemList];
%%							_ ->
%%								[]
%%						end,

					DropList =
						lists:foldl(
							fun(Rec, Acc) ->
								case Rec of
									{DropNum, [#rec_item{itemUID = ItemUID, itemID = ItemID, isBind = IsBind, quality = Quality} | _]} ->
										[#pk_CopyMapDropItem{
											itemUID = ItemUID,
											itemID = ItemID,
											number = DropNum,
											quality = Quality,
											isBind = IsBind
										} | Acc];
									{DropNum1, [#recSaveEquip{itemUID = ItemUID1, itemID = ItemID1, isBind = IsBind1, quality = Quality1} | _]} ->
										[#pk_CopyMapDropItem{
											itemUID = ItemUID1,
											itemID = ItemID1,
											number = DropNum1,
											quality = Quality1,
											isBind = IsBind1
										} | Acc];
									_ ->
										Acc
								end
							end, [], DropItemList),


					?DEBUG_OUT("sweeping droplist:~p,~p", [DropItemList, DropList]),

					true = playerBase:addExp(Exp, ?ExpSourceCopyMap, CopyMapID),

					BindGold = misc:rand(BindGoldMin, BindGoldMax),
					Purple = misc:rand(PurpleMin, PurpleMax),
					Golden = misc:rand(GoldenMin, GoldenMax),
					case BindGold > 0 of
						true ->
							true = playerMoney:addCoin(?CoinTypeGold, BindGold,
								#recPLogTSMoney{reason = ?CoinSourceCopyMapReward, param = CopyMapID, target = ?PLogTS_PlayerSelf, source = ?PLogTS_Sweep});
						_ ->
							skip
					end,
					case Purple > 0 of
						true ->
							true = playerMoney:addCoin(?CoinTypePurpleEssence, Purple,
								#recPLogTSMoney{reason = ?CoinSourceCopyMapReward, param = CopyMapID, target = ?PLogTS_PlayerSelf, source = ?PLogTS_Sweep});
						_ ->
							skip
					end,
					case Golden > 0 of
						true ->
							true = playerMoney:addCoin(?CoinTypeGoldenEssence, Golden,
								#recPLogTSMoney{reason = ?CoinSourceCopyMapReward, param = CopyMapID, target = ?PLogTS_PlayerSelf, source = ?PLogTS_Sweep});
						_ ->
							skip
					end,

					#pk_GS2U_RequestAutoDealAck{
						isSuccess = true,
						copyMapID = CopyMapID,
						coinReward = [
							#pk_CoinData{coinType = ?CoinTypeGold, value = BindGold},
							#pk_CoinData{coinType = ?CoinTypePurpleEssence, value = Purple},
							#pk_CoinData{coinType = ?CoinTypeGoldenEssence, value = Golden}
						],
						expReward = Exp,
						dropItems = DropList
					};
				false ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_TradeGold),
					skip
			end;
		_ ->
			?ERROR_OUT("#sweeping_dropCfg err"),
			skip
	end.
