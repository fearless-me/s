%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 副本奖励结算
%%% @end
%%% Created : 06. 一月 2015 16:38
%%%-------------------------------------------------------------------
-module(playerCopyMapReward).
-author("tiancheng").

-include("playerPrivate.hrl").

%% API
-export([
	getCopyMapMaxScore/1,
	onPassCopyMap_Rift/2,
	onPassCopyMap_Normal/2,
	onPassCopyMap_Goddess/2,
	onPassCopyMap_Material/5,
	onPassCopyMap_MoneyDungeon/6,
	isRewardInCopyMap/0
]).

%% 时空裂痕的奖励
-spec onPassCopyMap_Rift(Score::uint(), CopyMapID::uint()) -> ok.
onPassCopyMap_Rift(Score, CopyMapID) ->
	%% 是否还有次数
	HaveTimes = playerCopyMapRift:getSurplusTimes() > 0,
	case getCopyMapRewardList(Score, CopyMapID) of
		{Score, RewardExp, RewardGold, RewardList, ItemGift} ->
			{AddExp, AddMoney} = case HaveTimes of
									 true -> {erlang:trunc(RewardExp), erlang:trunc(RewardGold)};
									 _ ->
										 %% 时空裂痕获得奖励的比例
										 RiftRatio = playerCopyMapRift:getRiftMoneyAndExpRatio(),

										 %% 是时空裂痕，且没有次数了，金钱与经验都乘以一个比例系数
										 {erlang:trunc(RewardExp * RiftRatio), erlang:trunc(RewardGold * RiftRatio)}
								 end,

			%% 经验和金币奖励（根据通关时间等级换算得到）
			true = playerBase:addExp(AddExp, ?ExpSourceCopyMap, Score),
			true = playerMoney:addCoin(?CoinTypeGold, AddMoney,
				#recPLogTSMoney{reason = ?CoinSourceCopyMapReward, param = Score, target = ?PLogTS_PlayerSelf, source = ?PLogTS_CopyMapReward}),

			?LOG_OUT("onPassCopyMap_Rift [roleid=~p,mapid=~p] reward :score ~p, and got exp ~p, got gold ~p, reward list ~p, gift:~p",
				[playerState:getRoleID(), CopyMapID, Score, RewardExp, RewardGold, RewardList, ItemGift]),

%% 			%% 是时空裂痕，只有5，10，15次才给道具奖励
%% 			NowNumber = playerDaily:getDailyCounter(?DailyType_Everyday, ?PlayerEveryDay_Rift) + 1,
%% 			CanGiveItem = HaveTimes andalso NowNumber > 0 andalso NowNumber =< ?Rift_EveryDay_Max_Times andalso (NowNumber rem 5) =:= 0,

			case HaveTimes andalso ItemGift > 0 of
				true ->
					Plog = #recPLogTSItem{
						old = 0,
						new = 1,
						change = 1,
						target = ?PLogTS_PlayerSelf,
						source = ?PLogTS_RiftReward,
						gold = 0,
						goldtype = 0,
						changReason = ?ItemSourcePassCopyMap,
						reasonParam = CopyMapID
					},
					playerPackage:addGoodsAndMail(ItemGift, 1, true, 0, Plog);
				_ -> skip
			end,

			%% 计分
			case playerScene:getMapType(CopyMapID) of
				?MapTypeCopyMap -> updateCopyMapScore(CopyMapID, Score);
				_ -> skip
			end;
		_ -> skip
	end,
	ok.

%% 普通副本的奖励
-spec onPassCopyMap_Normal(Score::uint(), CopyMapID::uint()) -> ok.
onPassCopyMap_Normal(Score, CopyMapID) ->

	case getCopyMapRewardList(Score, CopyMapID) of
		{Score,RewardExp, RewardGold, RewardList, ItemGift} ->
			{AddExp, AddMoney} =  {erlang:trunc(RewardExp), erlang:trunc(RewardGold)},
			%% 获得爵位加成后的值
			New_AddMoney = playerVipInter:getCopyMapGold(AddMoney),
			New_AddExp = playerVipInter:getCopyMapExp(AddExp),
			%% 经验和金币奖励（根据通关时间等级换算得到）
			true = playerBase:addExp(New_AddExp, ?ExpSourceCopyMap, Score),
			case New_AddMoney > 0 of
				true ->
					true = playerMoney:addCoin(?CoinTypeGold, New_AddMoney,
						#recPLogTSMoney{reason = ?CoinSourceCopyMapReward, param = Score, target = ?PLogTS_PlayerSelf, source = ?PLogTS_CopyMapReward});
				_ -> skip
			end,

			?LOG_OUT("onPassCopyMap_Normal [roleid=~p,mapid=~p] reward :score ~p, and got exp ~p,~p, got gold ~p,~p, reward list ~p, gift:~p",
				[playerState:getRoleID(), CopyMapID, Score, RewardExp, New_AddExp, RewardGold, New_AddMoney, RewardList, ItemGift]),

			playerSevenDays:onMissionEvent(?SevenDayMission_Event_5, 1, CopyMapID),
			%% 直接物品奖励
			case ItemGift > 0 of
				true ->
					Plog = #recPLogTSItem{
						old = 0,
						new = 1,
						change = 1,
						target = ?PLogTS_PlayerSelf,
						source = ?PLogTS_CopyMapReward,
						gold = 0,
						goldtype = 0,
						changReason = ?ItemSourcePassCopyMap,
						reasonParam = CopyMapID
					},
					playerPackage:addGoodsAndMail(ItemGift, 1, true, 0, Plog);
				_ -> skip
			end,

			%% 额外奖励
			%% fixme 策划说的结束时的普通奖励不给了！
%% 			Len = length(RewardList),
%% 			case Len > 1 of
%% 				true ->
%% 					RateRewardIndex = misc:rand(1, Len),%% 					RewardID = lists:nth(RateRewardIndex, RewardList),
%% 					playerPackage:addGoodsAndMail(RewardID, 1, false, 0, ?ItemSourcePassCopyMap, RewardID),
%% 					?LOG_OUT("random reward id ~p", [RewardID]);
%% 				_ ->
%% 					skip
%% 			end,

			%% 取在副本中已经获利的掉落列表
			DropList = playerCopyMap:getCopyMapDropList(),
			R = #pk_GS2U_CopyMapResult{
				copyMapID = CopyMapID,
				second = Score,
				goldReward = New_AddMoney,
				expReward = New_AddExp,
				dropItems = DropList
			},
			playerMsg:sendNetMsg(R),

			%% 取副本伤害
			playerStatistics:sendCopyMapHurtToClient(),
			playerStatistics:clearCopyMapHurtStat(),

			%% 记录副本日志
			#mapsettingCfg{type = Type,subtype = Subtype,useVitality = UseVitality} = getCfg:getCfgPStack(cfg_mapsetting, CopyMapID),
			case Type of
				?MapTypeCopyMap ->
					if Subtype =:= ?MapSubTypeNormal orelse Subtype =:= ?MapSubTypeHeroCopy orelse Subtype =:= ?MapSubTypeChanllengeCopy ->
						EndTime = time:getLogTimeSec(),
						FunH = fun(X, AccList) ->
							case X of
								#pk_CopyMapDropItem{itemID = ItemID, number = Number} ->
									[{ItemID,Number} | AccList];
								#rec_item{itemID = ItemID, pileNum = PileNum} ->
									[{ItemID,PileNum} | AccList];
								_ ->
									AccList
							end
							   end,
						LL = lists:foldl(FunH, [], DropList),
						LogCopy = #rec_log_copy{
							accountID = playerState:getAccountID(),
							roleID = playerState:getRoleID(),
							copyMapType = Subtype,			%%副本类型（剧情、英雄、挑战）
							copyMapID = CopyMapID,
							startTime = EndTime-Score,
							decrActionPoint = UseVitality,
							isPass = 1,					%%是否通关 （0表示未通关  1表示通关）
							endTime = EndTime,
							goldReward = [{1,New_AddMoney}],
							expReward = New_AddExp,
							dropItems = LL
						},
						dbLog:sendSaveLogCopyInfo(LogCopy);
						true->
							ok
					end;
				_->
					ok
			end,

%%			?WARN_OUT("copymap drop:~s,~p", [playerState:getName(),DropList]),

			%% 有翻牌时，才发给客户端去翻牌
			%% 计分
			case playerScene:getMapType(CopyMapID) of
				?MapTypeCopyMap -> updateCopyMapScore(CopyMapID, Score);
				_ -> skip
			end;
		_ -> skip
	end,
	ok.

onPassCopyMap_Goddess(Score, _CopyMapID) ->
	DropList = playerCopyMap:getCopyMapDropList(),
	CMapPid = playerState:getMapPid(),
	{Exp,Gold} =
		case playerState:getMapAward() of
			#recMapAward{mapPid=MapPid,exp=OldExp,gold=OldGold} when CMapPid =:= MapPid ->
				{OldExp,OldGold};
			_ ->
				{0,0}
		end,

	R = #pk_GS2U_CopyMapResult{
		copyMapID = playerState:getMapID(),
		second = Score,
		goldReward = Gold,
		expReward = Exp,
		dropItems = DropList
	},
	playerMsg:sendNetMsg(R),
	%% 取副本伤害
	playerStatistics:sendCopyMapHurtToClient(),
	playerStatistics:clearCopyMapHurtStat(),
	ok.

onPassCopyMap_Material(Score,  CopyState, CopyMapID, MC, FC) ->
	DropList = playerCopyMap:getCopyMapDropList(),
	CMapPid = playerState:getMapPid(),
	{Exp,Gold} =
		case playerState:getMapAward() of
			#recMapAward{mapPid=MapPid,exp=OldExp,gold=OldGold} when CMapPid =:= MapPid ->
				{OldExp,OldGold};
			_ ->
				{0,0}
		end,

	?LOG_OUT("~w onPassCopyMap_Material(~w,~w,~w,~w),droplist(~w)",
		[playerState:getRoleID(), Score, CopyMapID, MC, FC, DropList]),
	R = #pk_GS2U_MaterialCopyMapResult{
		copyMapID = playerState:getMapID(),
		score = Score,
		state = CopyState,
		goldReward = Gold,
		expReward = Exp,
		dropItems = DropList,
		maxChapter = MC,
		finishChapter = FC
	},
	playerMsg:sendNetMsg(R),

	playerAchieve:achieveEvent(?Achieve_material_Copy, [1]),

	F = fun({ItemID, Num}) ->
		Plog = #recPLogTSItem{
			old = 0,
			new = Num,
			change = Num,
			target = ?PLogTS_PlayerSelf,
			source = ?PLogTS_CopyMapReward,
			gold = 0,
			goldtype = 0,
			changReason = ?ItemSourcePassCopyMap,
			reasonParam = CopyMapID
		},
		playerPackage:addGoodsAndMail(ItemID, Num, true, 0, Plog)
		end,

	playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_YuanSu),


	case getCfg:getCfgByArgs(cfg_specialinstance,CopyMapID, 1) of
		#specialinstanceCfg{item = ItemList} when Score > 0 ->
			lists:foreach(F, ItemList);
		_ ->
			ok
	end,


	%% 取副本伤害
	playerStatistics:sendCopyMapHurtToClient(),
	playerStatistics:clearCopyMapHurtStat(),
	%% 假装自己是副本，增加每日活跃
	playerliveness:onFinishLiveness(?LivenessMaterial,1),
	ok.

onPassCopyMap_MoneyDungeon(Score, _CopyMapID, MC, FC, ListMonsterID, ListMonsterCountKill) ->
	%DropList = playerCopyMap:getCopyMapDropList(),
	%CMapPid = playerState:getMapPid(),

	R = #pk_GS2U_MoneyDungeonCopyMapResult{
		copyMapID             = playerState:getMapID(),
		score                 = Score,
		maxChapter            = MC,
		finishChapter         = FC,
		listMonsterID         = ListMonsterID,
		listMonsterCountKill  = ListMonsterCountKill
	},
	playerMsg:sendNetMsg(R),
	playerAchieve:achieveEvent(?Achieve_Gold_Copy, [1]),

	%% 取副本伤害
	playerStatistics:sendCopyMapHurtToClient(),
	playerStatistics:clearCopyMapHurtStat(),
	playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_MiaoDaoTuan),

	%% 假装自己是副本，增加每日活跃
	playerliveness:onFinishLiveness(?LivenessMoneyDungeon,1),

	ok.

%% 更新副本分数
-spec updateCopyMapScore(CopyMapID::uint(), Score::uint()) -> ok.
updateCopyMapScore(CopyMapID, Score) ->
	Dict = playerState:getCopyMapScoreDict(),
	case dict:find(CopyMapID, Dict) of
		{ok, #recCopyMapScore{maxScore = OldScore}} when Score >= OldScore ->
			skip;
		_ ->
			RoleID = playerState:getRoleID(),
			R = #recCopyMapScore{roleID = RoleID, copyMapID = CopyMapID, maxScore = Score},
			NDict = dict:store(CopyMapID, R, Dict),
			playerState:setCopyMapScoreDict(NDict),

			?DEBUG_OUT("updateCopyMapScore:~p,~p,~p", [RoleID, CopyMapID, Score]),

			%% 发送给数据库保存
			gsSendMsg:sendMsg2DBServer(saveCopyMapHighestScore, playerState:getAccountID(), R)
	end,
	ok.

%% 获取副本的分数
-spec getCopyMapMaxScore(CopyMapID::uint()) -> uint().
getCopyMapMaxScore(CopyMapID) ->
	Dict = playerState:getCopyMapScoreDict(),
	case dict:find(CopyMapID, Dict) of
		{ok, #recCopyMapScore{copyMapID = CopyMapID, maxScore = Score}} ->
			Score;
		_ ->
			0
	end.

%% 获取通关副本奖励列表
-spec getCopyMapRewardList(Score :: uint(), CopyMapID :: uint()) -> Result when
	Result :: {SaveScore, AddExp, AddGold, RewardList} | false,
	SaveScore :: uint(),
	AddExp :: uint(),
	AddGold :: uint(),
	RewardList :: list().
getCopyMapRewardList(Score, CopyMapID) ->
	case getCfg:getCfgByKey(cfg_dungeonschallenge, CopyMapID) of
		#dungeonschallengeCfg{
			time_1 = Time1,
			time_2 = Time2,
			time_3 = Time3,
			time_4 = Time4,
			exp_reward = ExpReward,
			gold_reward = GoldReward,
			s_rate = S_Rate,
			a_rate = A_Rate,
			b_rate = B_Rate,
			c_rate = C_Rate,
			d_rate = D_Rate,

			reward_E1 = Raward1,
			reward_E2 = Raward2,
			reward_E3 = Raward3,
			reward_E4 = Raward4,
			reward_R1 = RawardRate1,
			reward_R2 = RawardRate2,
			reward_R3 = RawardRate3,
			reward_R4 = RawardRate4,

			giftid = ItemGift} ->
			if
				Score < Time1 ->
					AddExp = ExpReward * S_Rate,
					AddGold = GoldReward * S_Rate;
				Score < Time2 ->
					AddExp = ExpReward * A_Rate,
					AddGold = GoldReward * A_Rate;
				Score < Time3 ->
					AddExp = ExpReward * B_Rate,
					AddGold = GoldReward * B_Rate;
				Score < Time4 ->
					AddExp = ExpReward * C_Rate,
					AddGold = GoldReward * C_Rate;
				true ->
					AddExp = ExpReward * D_Rate,
					AddGold = GoldReward * D_Rate
			end,

			RewardList = case Raward1 =< 0 andalso Raward2 =< 0 andalso Raward3 =< 0 andalso Raward4 =< 0 of
							 true ->
								 %% 不需要翻牌奖励
								 [];
							 _ ->
								 All = RawardRate1 + RawardRate2 + RawardRate3 + RawardRate4,
								 DropRewardRate =
									 case All > 1 of
										 true -> random:uniform(All);
										 _ -> All
									 end,
								 DropReward = filterCopyMapRewardList([{Raward1, RawardRate1},
									 {Raward2, RawardRate2},
									 {Raward3, RawardRate3},
									 {Raward4, RawardRate4}], DropRewardRate),
								 [Raward1, Raward2, Raward3, Raward4] -- [DropReward]
						 end,

			{Score, AddExp, AddGold, RewardList, ItemGift};
		_ ->
			?WARN_OUT("getCopyMapRewardList CopyMapID:~p is can not found from cfg_dungeonschallenge", [CopyMapID]),
			false
	end.

%% 筛选副本通关奖励
-spec filterCopyMapRewardList(RewardList :: list(), Rate :: uint()) -> uint().
filterCopyMapRewardList([{RewardID, RewardRate} | LeftRewardList], Rate) ->
	case RewardID > 0 of
		true ->
			if
				Rate =< RewardRate ->
					RewardID;
				true ->
					filterCopyMapRewardList(LeftRewardList, Rate - RewardRate)
			end;
		_ ->
			filterCopyMapRewardList(LeftRewardList, Rate - RewardRate)
	end.
%% 用户当前副本地图是否可以获得奖励，只针对指定副本进行判断，未指定的副本均认为可以领取奖励
-spec isRewardInCopyMap() -> true | false.
isRewardInCopyMap() ->
	CopyMapID = playerState:getMapID(),
	DailyCount = playerDaily:getDailyCounter(?DailyType_EnterCopyMap, CopyMapID),
	BuyCount = playerDaily:getDailyCounter(?DailyType_BuyCopyMap_Number, CopyMapID),
	SubTypeList = [?MapSubTypeNormal, ?MapSubTypeChanllengeCopy, ?MapSubTypeHeroCopy],
	#mapsettingCfg{type = MapType, daily_effectivecount = MaxAwardLimit, subtype = SubType} = getCfg:getCfgPStack(cfg_mapsetting, CopyMapID),
	IsSubType = lists:member(SubType, SubTypeList),
	if
		IsSubType and (MapType =:= ?MapTypeCopyMap) ->
			DailyCount =< MaxAwardLimit+BuyCount;
		true ->
			true
	end.