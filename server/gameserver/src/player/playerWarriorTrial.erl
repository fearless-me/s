%% %%
%% %% @author chengxuesong
%% %% @doc @todo 勇者试炼.
%%
%%
-module(playerWarriorTrial).
-author(chengxuesong).

-include("playerPrivate.hrl").
%%存数据库时间
-define(SaveWarriorTrialTime, 30000).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initWarriorTrial/0,
	sendWarriorTrialInfoToClient/0,
	beginWarriorTrial/0,
	beginSweepMission/0,
	completeSchedule/0,
	missionInit/1,
	tickMaxTime/0,
	playerBeKilled/1,
	quitQuitMap/0,
	playerCompleteAllMissions/1,
	cleanRankData/0,
	setWarriorTrialInfoAck/1,
	saveWarriorTrialInfoDB/0
]).
%%初始化
initWarriorTrial() ->
	playerState:setWarriorTrialState(?WarriorTrialStateNotChalleng),
	playerState:setWarriorTrialTime(0),
	ok.

-spec setWarriorTrialInfoAck(#rec_warrior_trial{}) -> ok.
setWarriorTrialInfoAck(#rec_warrior_trial{} = WarriorTrialInfo) ->
	playerState:setWarriorTrialInfo(WarriorTrialInfo),
	ok.

sendWarriorTrialInfoToClient() ->
	MaxMission = getMissionNum(),
	CurMission = playerDaily:getDailyCounter(?DailyType_WarriorTrial, 1) + 1,
	#rec_warrior_trial{tswkTrialSchedule = MaxMissionIDOfWeek} = getWarriorTrialInfo(),
	?LOG_OUT("sendWarriorTrialInfoToClient = ~p", [#pk_GS2U_InitWarriorTrialAck{record = MaxMissionIDOfWeek, cur = CurMission, max = MaxMission, coin = 0}]),
	playerMsg:sendNetMsg(#pk_GS2U_InitWarriorTrialAck{record = MaxMissionIDOfWeek, cur = CurMission, max = MaxMission, coin = 0}),
	ok.

%%开始挑战关卡
beginWarriorTrial() ->
	Level = playerState:getLevel(),
	LimitedLevel = globalCfg:getGlobalCfg(sl_open),
	case Level >= LimitedLevel of
		true ->
			MaxMission = getMissionNum(),
			CurMission = playerDaily:getDailyCounter(?DailyType_WarriorTrial, 1) + 1,
			PlayerForce = playerPropSync:getProp(?PriProp_PlayerForce),
			PetForce = playerPropSync:getProp(?PriProp_PetForce),
			BuffIDList = [BuffID || #recBuff{buffID = BuffID} <- playerState:getBuffList()],
			?LOG_OUT("player:~p beginWarriorTrial MaxMission:~p CurMission:~p PlayerForce:~p PetForce:~p BuffIDList:~w",
				[playerState:getRoleID(),MaxMission,CurMission,PlayerForce,PetForce,BuffIDList]),
			case CurMission of
				1 ->
					playerLogAdd:addLogParticipatorInfo(?LogParticipator_WarriorTrialPlayerIn);
				_ ->skip
			end,
%%			case playerState:getTeamID() > 0 of
%%				true ->
%%					%%离开队伍
%%					playerTeam2:leaveTeam(?TeamTypeNormal);
%%				_ ->
%%					skip
%%			end,
			playerTeam:leaveTeam(false),
			case CurMission =< MaxMission of
				true ->
					#warriortrialCfg{mapid = MapID} = getCfg:getCfgPStack(cfg_warriortrial, CurMission),
					playerScene:onRequestEnterMap(MapID);
				_ ->
					%%已经到最大关卡了
					playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialMaxMission)
			end;
		_ ->
			%% 等级不足
			playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialLevelLimited)
	end,

	ok.
-spec missionInit(Pid::pid()) -> ok.
%%进入关卡初始化
missionInit(Pid) ->
	playerState:setWarriorTrialState(?WarriorTrialStateIsChallenging),
	CurMission = playerDaily:getDailyCounter(?DailyType_WarriorTrial, ?WarriorTrialSchedule) + 1,

	MaxMission = getMissionNum(),
	PlayerForce = playerPropSync:getProp(?PriProp_PlayerForce),
	PetForce = playerPropSync:getProp(?PriProp_PetForce),
	BuffIDList = [BuffID || #recBuff{buffID = BuffID} <- playerState:getBuffList()],
	?LOG_OUT("player:~p missionInit MaxMission:~p CurMission:~p PlayerForce:~p PetForce:~p BuffIDList:~w",
		[playerState:getRoleID(),MaxMission,CurMission,PlayerForce,PetForce,BuffIDList]),

	%%请求创建boss
	psMgr:sendMsg2PS(Pid, createWarriorTrialBoss, CurMission),
	%%给玩家加buff
	giveBuffToPlayer(),
	Time = time:getSyncTime1970FromDBS(),

	playerState:setWarriorTrialTime(Time),
	#warriortrialCfg{maxTime = MaxTime} = getCfg:getCfgPStack(cfg_warriortrial, CurMission),
	%%通知客户端
	playerMsg:sendNetMsg(#pk_GS2U_InitWarriorTrialMissionInfo{missionID = CurMission, time = MaxTime}),
	ok.
%%完成一个副本
completeSchedule() ->
	%%今天刷本的进度+1
	playerDaily:incDailyCounter(?DailyType_WarriorTrial, ?WarriorTrialSchedule),
	%%保存这次刷本的用时
	BeginTime = playerState:getWarriorTrialTime(),
	NowTime = time:getSyncTime1970FromDBS(),
	playerState:setWarriorTrialTime(0),
	MissionID = playerDaily:getDailyCounter(?DailyType_WarriorTrial, 1) ,%+1
	PlayerForce = playerPropSync:getProp(?PriProp_PlayerForce),
	PetForce = playerPropSync:getProp(?PriProp_PetForce),
	BuffIDList = [BuffID || #recBuff{buffID = BuffID} <- playerState:getBuffList()],
	?LOG_OUT("Player:~p complete warriortrial Schedule,cur counter:~p PlayerForce:~p PetForce:~p BuffIDList:~w",
		[playerState:getRoleID(),MissionID,PlayerForce,PetForce,BuffIDList]),
	#warriortrialCfg{maxTime = MaxTime}
		= getCfg:getCfgPStack(cfg_warriortrial, MissionID),
	%限定下时间
	UseTime = misc:clamp(NowTime - BeginTime, 1, MaxTime),
	WarriorTrialInfo = getWarriorTrialInfo(),
	#rec_warrior_trial{tswkTrialSchedule = TTS, tswkTrialTime = TTT} = WarriorTrialInfo,
 	TodayWarriorTrialSchedule = playerDaily:getDailyCounter(?DailyType_WarriorTrial, ?WarriorTrialSchedule),
	?DEBUG_OUT("TodayWarriorTrialSchedule[~p]TTS[~p]",[TodayWarriorTrialSchedule,TTS]),
	NewWarriorTrialInfo = case TodayWarriorTrialSchedule >= TTS of
							  true ->
								  case TodayWarriorTrialSchedule > TTS of
									  true ->
										  %%当前进度大于本周最大进度，保存进度和挑战时间
										  WarriorTrialInfo#rec_warrior_trial{tswkTrialSchedule = TodayWarriorTrialSchedule, tswkTrialTime = UseTime};
									  _ ->
										  %%当前进度等于本周最大进度，如果时间比以前短，就更新下
										  case UseTime < TTT of
											  true ->
												  WarriorTrialInfo#rec_warrior_trial{tswkTrialTime = UseTime};
											  _ ->
												  WarriorTrialInfo
										  end
								  end;
							  _ ->
								  %%当前进度小于本周最大进度，不保存任何信息
								  WarriorTrialInfo
						  end,


	%%勇者试炼成就
	playerAchieve:achieveEvent(?Achieve_brave_tried, [MissionID,1]),
	%%发奖励
	sendAward(TodayWarriorTrialSchedule, NewWarriorTrialInfo),
	playerState:setWarriorTrialState(?WarriorTrialStateSuccess),
	%%挑战成功
	playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialSuccess),

	playerSevenDays:onMissionEvent(?SevenDayMission_Event_15, 1, 0),

	%% 清技能CD和回血
	playerBase:clearSkillCDAndRestoreHp(),

	%%通知客户端
	playerMsg:sendNetMsg(#pk_GS2U_WarriorTrialSuccess{result = true}),
	ok.
%%开始扫荡关卡
-spec beginSweepMission() -> ok.
beginSweepMission() ->
	%%扫荡的关卡id
	MissionID = playerDaily:getDailyCounter(?DailyType_WarriorTrial, 1) + 1,
	?LOG_OUT("player:~p beginSweepMission:~p",[playerState:getRoleID(),MissionID]),
	case MissionID of
		1 ->
			playerLogAdd:addLogParticipatorInfo(?LogParticipator_WarriorTrialPlayerIn);
		_ ->skip
	end,
	case canSweep(MissionID) of
		true ->
			playerliveness:onFinishLiveness(?LivenessBraveTrain,1),
			#warriortrialCfg{mapid = MapID, coinnum = CoinNum, maxTime = MaxTime}
				= getCfg:getCfgPStack(cfg_warriortrial, MissionID),
			%%发普通奖励
			Result = getWarriorSweepingAward(MissionID),
			R =
				case Result of
					#pk_GS2U_RequestAutoDealAck{} ->
						%%扫荡成功
						WarriorTrialInfo = getWarriorTrialInfo(),
						#rec_warrior_trial{trialSchedule = RecordSchedule, tswkTrialSchedule = TTS} = WarriorTrialInfo,
						%%成功就增加今天刷本记录
						playerDaily:incDailyCounter(?DailyType_WarriorTrial, ?WarriorTrialSchedule),
						TodayWarriorTrialSchedule = playerDaily:getDailyCounter(?DailyType_WarriorTrial, ?WarriorTrialSchedule),
						?LOG_OUT("player:~p SweepMission:~p, count:~p TTS:~p",[playerState:getRoleID(),MissionID,TodayWarriorTrialSchedule,TTS]),
						case TodayWarriorTrialSchedule > TTS of
							true ->
								saveTrialInfo(WarriorTrialInfo#rec_warrior_trial{tswkTrialSchedule = TodayWarriorTrialSchedule, tswkTrialTime = MaxTime});
							_ ->
								skip
						end,

						playerMsg:sendNetMsg(#pk_GS2U_SweepWarriorTrialSuccess{record = RecordSchedule, cur = MissionID, coin = CoinNum}),
						playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialSweepSuccess),
						Result;
					_ ->
						%%扫荡失败
						playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialSweepFailed),
						#pk_GS2U_RequestAutoDealAck{
							isSuccess = false,
							copyMapID = MapID,
							coinReward = [],
							expReward = 0,
							dropItems = []
						}
				end,
			playerMsg:sendNetMsg(R);
		_ ->
			skip
	end,
	ok.
tickMaxTime() ->
	BeginTime = playerState:getWarriorTrialTime(),
	case BeginTime > 0 of
		true ->
			NowTime = time:getSyncTime1970FromDBS(),
			CurMission = playerDaily:getDailyCounter(?DailyType_WarriorTrial, 1) + 1,
			#warriortrialCfg{maxTime = MaxTime, mapid = MapID} = getCfg:getCfgPStack(cfg_warriortrial, CurMission),
			MapSubType = playerScene:getMapSubType(MapID),
			case MapSubType =:= ?MapSubTypeWarrior of
				true ->
					%%挑战时间到了
					case NowTime > BeginTime + MaxTime of
						true ->
							?LOG_OUT("player:~p WarriorTrial timeout MissionID:~p",[playerState:getRoleID(),CurMission]),
							playerState:setWarriorTrialTime(0),
							%%挑战时间到
							playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialTimeOut),
							%%通知客户端
							playerMsg:sendNetMsg(#pk_GS2U_WarriorTrialSuccess{result = false}),
							%%为了让客户端挑战失败的特效显示出来，延迟离开副本
							erlang:send_after(2000, self(), {warriorTrialResetCopyMap, MapID});
						_ ->
							skip
					end;
				_ ->
					%%不在勇者试炼副本了，退出
					quitQuitMap()
			end;
		_ ->
			skip
	end,
	ok.
%%玩家直接退出副本
quitQuitMap() ->
	playerState:setWarriorTrialTime(0),
	case playerState:getWarriorTrialState() of
		?WarriorTrialStateIsChallenging ->
			%%真正挑战中退出的话，挑战失败
			playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialFailed);
		_ ->
			skip
	end.


-spec playerBeKilled(MapID::uint32()) -> ok.
%%玩家被杀，挑战失败处理
playerBeKilled(MapID) ->
	?LOG_OUT("player:~p WarriorTrial Killed by Boss in MapID:~p",[playerState:getRoleID(),MapID]),
	playerState:setWarriorTrialTime(0),
	%%你已经死了
	playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialPlayerDead),
	%%重置副本
	core:sendMsgToMapMgr(MapID, resetCopyMap, {playerState:getRoleID(), playerState:getTeamID(), MapID}),
	ok.
%%完成所有关卡
-spec playerCompleteAllMissions(MapID::uint16()) -> ok.
playerCompleteAllMissions(MapID) ->
	?LOG_OUT("player:~p CompleteAllMissions of MapID:~p",[playerState:getRoleID(),MapID]),
	playerState:setWarriorTrialTime(0),
	%%你已经登峰造极啦
	playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialMaxMission),
	%%重置副本
	core:sendMsgToMapMgr(MapID, resetCopyMap, {playerState:getRoleID(), playerState:getTeamID(), MapID}),
	ok.
%%Internal Function%%
%%获取关卡数
getMissionNum() ->
	erlang:length(getCfg:get1KeyList(cfg_warriortrial)).
%%是否可以扫荡关卡
-spec canSweep(MissionID :: uint16()) -> boolean().
canSweep(MissionID) ->
	%%只能扫荡曾经通过的关卡,且这次扫荡关卡不能大于最大关卡
	#rec_warrior_trial{tswkTrialSchedule = RecordSchedule} = getWarriorTrialInfo(),
	MissionNumber = getMissionNum(),
	if
		MissionID =< MissionNumber ->
			if
				RecordSchedule =:= 0 ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialIsNone),
					false;
				MissionID =< RecordSchedule ->
					%%背包格子不小于5个
					case isPackageIdle() of
						true ->
							true;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialBagIsAmostFull),
							false
					end;
				true ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialCanOnlySweepPass),
					false
			end;
		true ->
			false
	end.
%%
%%	case MissionID =< RecordSchedule andalso MissionID =< getMissionNum() of
%%		true ->
%%			%%背包格子不小于5个
%%			case isPackageIdle() of
%%				true ->
%%					true;
%%				_ ->
%%					playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialBagIsAmostFull),
%%					false
%%			end;
%%		_ ->
%%			%%?DEBUG_OUT("[DebugForWT] canSweep MissionID(~p) RecordSchedule(~p) MissionNum(~p)", [MissionID, RecordSchedule, getMissionNum()]),
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialCanOnlySweepPass),
%%			false
%%	end.
%%给玩家加buff
giveBuffToPlayer() ->
	%%玩家战斗力
	PlayerForce = playerPropSync:getProp(?PriProp_PlayerForce),
	%%当前挑战的关卡
	MisstionID = playerDaily:getDailyCounter(?DailyType_WarriorTrial, 1) + 1,
	#warriortrialCfg{attack = Attack, buff = Buff}
		= getCfg:getCfgPStack(cfg_warriortrial, MisstionID),

	case PlayerForce > Attack of
		true ->
			?WARN_OUT("WarriorTrial give player:~p Buff:~p Force:~p Attack:~p,CurMissionID:~p,playerLevel:~p",
				[playerState:getRoleID(),Buff,PlayerForce,Attack,MisstionID,playerState:getLevel()]),
			%%玩家战力高于标准战力,加个buff让玩家一定能打过这个boss
			playerBuff:addBuff(Buff, playerState:getLevel());
		_ ->
			skip
	end,
	ok.
%%发奖励
-spec sendAward(MissionID::uint16(), WarriorTrialInfo::#rec_warrior_trial{}) -> ok.
sendAward(MissionID, WarriorTrialInfo) ->
	#warriortrialCfg{firstkillaward = Firstkillaward}
		= getCfg:getCfgPStack(cfg_warriortrial, MissionID),
	%%判断是不是首杀,是首杀肯定创最高纪录了，保存下
	#rec_warrior_trial{trialSchedule = RecordSchedule} = WarriorTrialInfo,
	case MissionID > RecordSchedule of
		true ->
			TrialInfo = WarriorTrialInfo#rec_warrior_trial{trialSchedule = MissionID},
			saveTrialInfo(TrialInfo),
			?LOG_OUT("RoleID[~p] Firstkillaward[~p]", [playerState:getRoleID(),Firstkillaward]),
			Fun = fun({ItemID, ItemNum}) ->
				Plog = #recPLogTSItem{
					old = 0,
					new = ItemNum,
					change = ItemNum,
					target = ?PLogTS_PlayerSelf,
					source = ?PLogTS_Warrior,
					gold = 0,
					goldtype = 0,
					changReason = ?ItemSourceWarriorTrial,
					reasonParam = MissionID
				},
				playerPackage:addGoodsAndMail(ItemID, ItemNum, true, 0, Plog)
			end,
			lists:foreach(Fun, Firstkillaward);
		_ ->
			saveTrialInfo(WarriorTrialInfo),
			skip
	end,
	ok.

-spec getWarriorSweepingAward( MissionID::uint16() ) ->#pk_GS2U_RequestAutoDealAck{} | skip.
getWarriorSweepingAward( MissionID ) ->
	case getCfg:getCfgPStack(cfg_warriortrial, MissionID) of
		#warriortrialCfg{
			mapid = MapID,
			drop = DropID,
			exp = Exp,
			gold = [BindGoldMin,BindGoldMax],
			purple = [PurpleMin,PurpleMax],
			golden = [GoldenMin,GoldenMax]
		} ->
			%%开掉落包
			DropList =
				case playerDrop:goodsDrop(DropID, 0, ?ItemSweepingCopyMap) of

					[{_, [#rec_item{}| _]}| _] = DropItemList ->
						[#pk_CopyMapDropItem{
							itemUID = ItemUID,
							itemID = ItemID,
							number = DropNum,
							quality = Quality,
							isBind = IsBind
						} ||
							{DropNum, [#rec_item{
								itemUID = ItemUID, itemID = ItemID, isBind = IsBind, quality = Quality
							}| _]}<- DropItemList];
					_ ->
						[]
				end,
			true = playerBase:addExp(Exp, ?ExpSourceCopyMap, 0),

			BindGold = misc:rand(BindGoldMin, BindGoldMax),
			Purple = misc:rand(PurpleMin, PurpleMax),
			Golden = misc:rand(GoldenMin, GoldenMax),
			case BindGold > 0 of
				true ->
					true = playerMoney:addCoin(?CoinTypeGold, BindGold,
						#recPLogTSMoney{reason=?CoinSourceCopyMapReward,param=MissionID,target=?PLogTS_PlayerSelf,source=?PLogTS_Warrior});
				_ ->
					skip
			end,
			case Purple > 0 of
				true ->
					true = playerMoney:addCoin(?CoinTypePurpleEssence, Purple,
						#recPLogTSMoney{reason=?CoinSourceCopyMapReward,param=MissionID,target=?PLogTS_PlayerSelf,source=?PLogTS_Warrior});
				_ ->
					skip
			end,
			case Golden > 0 of
				true ->
					true = playerMoney:addCoin(?CoinTypeGoldenEssence, Golden,
						#recPLogTSMoney{reason=?CoinSourceCopyMapReward,param=MissionID,target=?PLogTS_PlayerSelf,source=?PLogTS_Warrior});
				_ ->
					skip
			end,

			#pk_GS2U_RequestAutoDealAck{
				isSuccess = true,
				copyMapID = MapID,
				coinReward = [
					#pk_CoinData{coinType = ?CoinTypeGold, value = BindGold},
					#pk_CoinData{coinType = ?CoinTypePurpleEssence, value = Purple},
					#pk_CoinData{coinType = ?CoinTypeGoldenEssence, value = Golden}
				],
				expReward = Exp,
				dropItems = DropList
			};
		_ ->
			?ERROR_OUT("#warriortrialCfg err"),
			skip
	end.
%%清空玩家勇士排行榜需要数据
-spec cleanRankData() -> ok.
cleanRankData() ->
	Info = getWarriorTrialInfo(),
	NewInfo = Info#rec_warrior_trial{tswkTrialSchedule = 0, tswkTrialTime = 0},
	saveTrialInfo(NewInfo),
	ok.
%%所有背包不得少于5个
-spec isPackageIdle() -> boolean().
isPackageIdle() ->
	playerPackage:getBagIdleSlotNum(?Item_Location_Bag) >= 5 andalso
	playerPackage:getBagIdleSlotNum(?Item_Location_Equip_Bag) >= 5 andalso
	playerPackage:getBagIdleSlotNum(?Item_Location_Gem_Bag) >= 5.

-spec saveTrialInfo(WarriorTrialInfo::#rec_warrior_trial{}) -> ok.
saveTrialInfo(WarriorTrialInfo) ->
	?DEBUG_OUT("WarriorTrialInfo = ~p",[WarriorTrialInfo]),
	playerState:setWarriorTrialInfo(WarriorTrialInfo),
	ok.
saveWarriorTrialInfoDB() ->
	playerSave:saveWarriorTrialInfo(playerState:getWarriorTrialInfo()),
	ok.
getWarriorTrialInfo() ->
	case playerState:getWarriorTrialInfo() of
		#rec_warrior_trial{} = WarriorInfo ->
			WarriorInfo;
		_ ->
			#rec_warrior_trial{roleID = playerState:getRoleID()}
	end.
