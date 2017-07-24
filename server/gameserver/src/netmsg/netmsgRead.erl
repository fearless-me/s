%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% If you have any questions, please contact to ZHONGYUANWEI.

-module(netmsgRead).

-compile(nowarn_unused_vars).

-include("netmsgRecords.hrl").

-import(netmsg, [
	binary_read_int64/1,
	binary_read_int64/1,
	binary_read_int16/1,
	binary_read_int16/1,
	binary_read_int/1,
	binary_read_bool/1,
	binary_read_int8/1,
	binary_read_uint64/1,
	binary_read_uint16/1,
	binary_read_uint16/1,
	binary_read_uint/1,
	binary_read_uint8/1,
	binary_read_float/1,
	binary_read_double/1,
	binary_read_string/1,
	binary_read_array/2]).

-export([readNetMsg/2]).

%GENERATED from file:Date.h => GS2U_DateFindTreasure_Welcome_Sync
readNetMsg(?CMD_GS2U_DateFindTreasure_Welcome_Sync,Bin0) ->
	{ V_timeForBegin, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_timeForEnd, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_score, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_GS2U_DateFindTreasure_Welcome_Sync {
		timeForBegin = V_timeForBegin,
		timeForEnd = V_timeForEnd,
		score = V_score
		},
	Bin3 };

%GENERATED from file:Date.h => GS2U_DateLink_BuffAddScore_Sync
readNetMsg(?CMD_GS2U_DateLink_BuffAddScore_Sync,Bin0) ->
	{ V_score, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_scoreAll, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_GS2U_DateLink_BuffAddScore_Sync {
		score = V_score,
		scoreAll = V_scoreAll
		},
	Bin2 };

%GENERATED from file:Date.h => GS2U_DateLink_BuffAddTime_Sync
readNetMsg(?CMD_GS2U_DateLink_BuffAddTime_Sync,Bin0) ->
	{ V_timeAdd, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_timeRemainder, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_GS2U_DateLink_BuffAddTime_Sync {
		timeAdd = V_timeAdd,
		timeRemainder = V_timeRemainder
		},
	Bin2 };

%GENERATED from file:Date.h => GS2U_DateLink_BuffBuff_Sync
readNetMsg(?CMD_GS2U_DateLink_BuffBuff_Sync,Bin0) ->
	{ V_buffID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_DateLink_BuffBuff_Sync {
		buffID = V_buffID
		},
	Bin1 };

%GENERATED from file:Date.h => GS2U_DateLink_BuffPower_Sync
readNetMsg(?CMD_GS2U_DateLink_BuffPower_Sync,Bin0) ->
	{ V_time, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_power, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_GS2U_DateLink_BuffPower_Sync {
		time = V_time,
		power = V_power
		},
	Bin2 };

%GENERATED from file:Date.h => GS2U_DateLink_DeduffBuff_Sync
readNetMsg(?CMD_GS2U_DateLink_DeduffBuff_Sync,Bin0) ->
	{ V_buffID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_DateLink_DeduffBuff_Sync {
		buffID = V_buffID
		},
	Bin1 };

%GENERATED from file:Date.h => GS2U_DateLink_GameEnd_Sync
readNetMsg(?CMD_GS2U_DateLink_GameEnd_Sync,Bin0) ->
	{ V_reason, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_time, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_score, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_id, Bin4 } = binary_read_uint8( Bin3 ),
	{ #pk_GS2U_DateLink_GameEnd_Sync {
		reason = V_reason,
		time = V_time,
		score = V_score,
		id = V_id
		},
	Bin4 };

%GENERATED from file:Date.h => GS2U_DateLink_Link_Sync
readNetMsg(?CMD_GS2U_DateLink_Link_Sync,Bin0) ->
	{ V_indexA, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_xA, Bin2 } = binary_read_float( Bin1 ),
	{ V_yA, Bin3 } = binary_read_float( Bin2 ),
	{ V_indexB, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_xB, Bin5 } = binary_read_float( Bin4 ),
	{ V_yB, Bin6 } = binary_read_float( Bin5 ),
	{ V_combo, Bin7 } = binary_read_uint8( Bin6 ),
	{ V_comboMax, Bin8 } = binary_read_uint8( Bin7 ),
	{ V_score, Bin9 } = binary_read_uint16( Bin8 ),
	{ V_scoreAll, Bin10 } = binary_read_uint16( Bin9 ),
	{ V_listGemMatrix, Bin11 } = binary_read_array(Bin10, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_GS2U_DateLink_Link_Sync {
		indexA = V_indexA,
		xA = V_xA,
		yA = V_yA,
		indexB = V_indexB,
		xB = V_xB,
		yB = V_yB,
		combo = V_combo,
		comboMax = V_comboMax,
		score = V_score,
		scoreAll = V_scoreAll,
		listGemMatrix = V_listGemMatrix
		},
	Bin11 };

%GENERATED from file:Date.h => GS2U_DateLink_MainTime_Sync
readNetMsg(?CMD_GS2U_DateLink_MainTime_Sync,Bin0) ->
	{ V_timeRemainder, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_DateLink_MainTime_Sync {
		timeRemainder = V_timeRemainder
		},
	Bin1 };

%GENERATED from file:Date.h => GS2U_DateLink_ResetGem_Sync
readNetMsg(?CMD_GS2U_DateLink_ResetGem_Sync,Bin0) ->
	{ V_listGem, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint16( X ) end),
	{ V_resetCount, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_resetCD, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_listGemMatrix, Bin4 } = binary_read_array(Bin3, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_GS2U_DateLink_ResetGem_Sync {
		listGem = V_listGem,
		resetCount = V_resetCount,
		resetCD = V_resetCD,
		listGemMatrix = V_listGemMatrix
		},
	Bin4 };

%GENERATED from file:Date.h => GS2U_DateLink_Select_Ack
readNetMsg(?CMD_GS2U_DateLink_Select_Ack,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_index, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_x, Bin3 } = binary_read_float( Bin2 ),
	{ V_y, Bin4 } = binary_read_float( Bin3 ),
	{ V_isSelect, Bin5 } = binary_read_bool( Bin4 ),
	{ V_listGemMatrix, Bin6 } = binary_read_array(Bin5, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_GS2U_DateLink_Select_Ack {
		roleID = V_roleID,
		index = V_index,
		x = V_x,
		y = V_y,
		isSelect = V_isSelect,
		listGemMatrix = V_listGemMatrix
		},
	Bin6 };

%GENERATED from file:Date.h => GS2U_DateLink_Welcome_Sync
readNetMsg(?CMD_GS2U_DateLink_Welcome_Sync,Bin0) ->
	{ V_timeForBegin, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_timeForEnd, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_timePower, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_listGem, Bin4 } = binary_read_array(Bin3, fun(X) -> binary_read_uint16( X ) end),
	{ V_score, Bin5 } = binary_read_uint16( Bin4 ),
	{ V_indexA, Bin6 } = binary_read_uint8( Bin5 ),
	{ V_indexB, Bin7 } = binary_read_uint8( Bin6 ),
	{ V_power, Bin8 } = binary_read_uint8( Bin7 ),
	{ V_resetCount, Bin9 } = binary_read_uint8( Bin8 ),
	{ V_listGemMatrix, Bin10 } = binary_read_array(Bin9, fun(X) -> binary_read_uint8( X ) end),
	{ V_resetCD, Bin11 } = binary_read_uint8( Bin10 ),
	{ #pk_GS2U_DateLink_Welcome_Sync {
		timeForBegin = V_timeForBegin,
		timeForEnd = V_timeForEnd,
		timePower = V_timePower,
		listGem = V_listGem,
		score = V_score,
		indexA = V_indexA,
		indexB = V_indexB,
		power = V_power,
		resetCount = V_resetCount,
		listGemMatrix = V_listGemMatrix,
		resetCD = V_resetCD
		},
	Bin11 };

%GENERATED from file:Date.h => GS2U_DatePoolShooting_Welcome_Sync
readNetMsg(?CMD_GS2U_DatePoolShooting_Welcome_Sync,Bin0) ->
	{ V_timeForBegin, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_timeForEnd, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_score, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_GS2U_DatePoolShooting_Welcome_Sync {
		timeForBegin = V_timeForBegin,
		timeForEnd = V_timeForEnd,
		score = V_score
		},
	Bin3 };

%GENERATED from file:Date.h => GS2U_DatePushBox_GreateNPC_Sync
readNetMsg(?CMD_GS2U_DatePushBox_GreateNPC_Sync,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_x, Bin2 } = binary_read_float( Bin1 ),
	{ V_z, Bin3 } = binary_read_float( Bin2 ),
	{ #pk_GS2U_DatePushBox_GreateNPC_Sync {
		code = V_code,
		x = V_x,
		z = V_z
		},
	Bin3 };

%GENERATED from file:Date.h => GS2U_DatePushBox_Succeed_Sync
readNetMsg(?CMD_GS2U_DatePushBox_Succeed_Sync,Bin0) ->
	{ V_isSucceed, Bin1 } = binary_read_bool( Bin0 ),
	{ V_isDelete, Bin2 } = binary_read_bool( Bin1 ),
	{ V_code, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_x, Bin4 } = binary_read_float( Bin3 ),
	{ V_z, Bin5 } = binary_read_float( Bin4 ),
	{ V_score, Bin6 } = binary_read_uint16( Bin5 ),
	{ #pk_GS2U_DatePushBox_Succeed_Sync {
		isSucceed = V_isSucceed,
		isDelete = V_isDelete,
		code = V_code,
		x = V_x,
		z = V_z,
		score = V_score
		},
	Bin6 };

%GENERATED from file:Date.h => GS2U_DatePushBox_Welcome_Sync
readNetMsg(?CMD_GS2U_DatePushBox_Welcome_Sync,Bin0) ->
	{ V_timeForBegin, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_timeForEnd, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_score, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_listGemMatrix, Bin4 } = binary_read_array(Bin3, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_GS2U_DatePushBox_Welcome_Sync {
		timeForBegin = V_timeForBegin,
		timeForEnd = V_timeForEnd,
		score = V_score,
		listGemMatrix = V_listGemMatrix
		},
	Bin4 };

%GENERATED from file:Date.h => GS2U_Date_FindTreasure_Sync
readNetMsg(?CMD_GS2U_Date_FindTreasure_Sync,Bin0) ->
	{ V_score, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_Date_FindTreasure_Sync {
		score = V_score
		},
	Bin1 };

%GENERATED from file:Date.h => GS2U_Date_PlayerAnimation_Sync
readNetMsg(?CMD_GS2U_Date_PlayerAnimation_Sync,Bin0) ->
	{ #pk_GS2U_Date_PlayerAnimation_Sync {

		},
	Bin0 };

%GENERATED from file:Date.h => GS2U_Date_RefreshSocre_Sync
readNetMsg(?CMD_GS2U_Date_RefreshSocre_Sync,Bin0) ->
	{ V_score, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_hitA, Bin2 } = binary_read_bool( Bin1 ),
	{ V_hitB, Bin3 } = binary_read_bool( Bin2 ),
	{ #pk_GS2U_Date_RefreshSocre_Sync {
		score = V_score,
		hitA = V_hitA,
		hitB = V_hitB
		},
	Bin3 };

%GENERATED from file:Date.h => GS2U_Date_ResetBox_Sync
readNetMsg(?CMD_GS2U_Date_ResetBox_Sync,Bin0) ->
	{ V_refreshNum, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_Date_ResetBox_Sync {
		refreshNum = V_refreshNum
		},
	Bin1 };

%GENERATED from file:Date.h => GS2U_Date_ResetFindTreasure_Sync
readNetMsg(?CMD_GS2U_Date_ResetFindTreasure_Sync,Bin0) ->
	{ #pk_GS2U_Date_ResetFindTreasure_Sync {

		},
	Bin0 };

%GENERATED from file:Date.h => GS2U_Date_ResetPoolShooting_Sync
readNetMsg(?CMD_GS2U_Date_ResetPoolShooting_Sync,Bin0) ->
	{ V_listPoolShootingPosIndex, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_GS2U_Date_ResetPoolShooting_Sync {
		listPoolShootingPosIndex = V_listPoolShootingPosIndex
		},
	Bin1 };

%GENERATED from file:Date.h => GS2U_MonsterMoveSync
readNetMsg(?CMD_GS2U_MonsterMoveSync,Bin0) ->
	{ V_monsterPosList, Bin1 } = binary_read_array(Bin0, fun(X) -> readDateMonsterPos( X ) end),
	{ #pk_GS2U_MonsterMoveSync {
		monsterPosList = V_monsterPosList
		},
	Bin1 };

%GENERATED from file:Date.h => U2GS_DateEnter_Request
readNetMsg(?CMD_U2GS_DateEnter_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_DateEnter_Request {
		id = V_id
		},
	Bin1 };

%GENERATED from file:Date.h => U2GS_DateLink_Giveup_Requset
readNetMsg(?CMD_U2GS_DateLink_Giveup_Requset,Bin0) ->
	{ #pk_U2GS_DateLink_Giveup_Requset {

		},
	Bin0 };

%GENERATED from file:Date.h => U2GS_DateLink_ResetGem_Request
readNetMsg(?CMD_U2GS_DateLink_ResetGem_Request,Bin0) ->
	{ #pk_U2GS_DateLink_ResetGem_Request {

		},
	Bin0 };

%GENERATED from file:Date.h => U2GS_DateLink_Select_Request
readNetMsg(?CMD_U2GS_DateLink_Select_Request,Bin0) ->
	{ V_x, Bin1 } = binary_read_float( Bin0 ),
	{ V_y, Bin2 } = binary_read_float( Bin1 ),
	{ V_index, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_isSelect, Bin4 } = binary_read_bool( Bin3 ),
	{ #pk_U2GS_DateLink_Select_Request {
		x = V_x,
		y = V_y,
		index = V_index,
		isSelect = V_isSelect
		},
	Bin4 };

%GENERATED from file:Date.h => U2GS_DatePushBox_Request
readNetMsg(?CMD_U2GS_DatePushBox_Request,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_x, Bin2 } = binary_read_float( Bin1 ),
	{ V_z, Bin3 } = binary_read_float( Bin2 ),
	{ V_isDelete, Bin4 } = binary_read_bool( Bin3 ),
	{ #pk_U2GS_DatePushBox_Request {
		code = V_code,
		x = V_x,
		z = V_z,
		isDelete = V_isDelete
		},
	Bin4 };

%GENERATED from file:Date.h => U2GS_DateShooting_Over
readNetMsg(?CMD_U2GS_DateShooting_Over,Bin0) ->
	{ #pk_U2GS_DateShooting_Over {

		},
	Bin0 };

%GENERATED from file:LS2User.h => GS2U_ChangeLineResponse
readNetMsg(?CMD_GS2U_ChangeLineResponse,Bin0) ->
	{ V_gameServers, Bin1 } = binary_read_array(Bin0, fun(X) -> readGameServerInfo( X ) end),
	{ V_identity, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_GS2U_ChangeLineResponse {
		gameServers = V_gameServers,
		identity = V_identity
		},
	Bin2 };

%GENERATED from file:LS2User.h => LS2U_GameLineServerList
readNetMsg(?CMD_LS2U_GameLineServerList,Bin0) ->
	{ V_gameServers, Bin1 } = binary_read_array(Bin0, fun(X) -> readGameServerInfo( X ) end),
	{ #pk_LS2U_GameLineServerList {
		gameServers = V_gameServers
		},
	Bin1 };

%GENERATED from file:LS2User.h => LS2U_LoginQue
readNetMsg(?CMD_LS2U_LoginQue,Bin0) ->
	{ V_currentNumber, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_LS2U_LoginQue {
		currentNumber = V_currentNumber
		},
	Bin1 };

%GENERATED from file:LS2User.h => LS2U_LoginResult
readNetMsg(?CMD_LS2U_LoginResult,Bin0) ->
	{ V_result, Bin1 } = binary_read_int8( Bin0 ),
	{ V_accountID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_identity, Bin3 } = binary_read_string( Bin2 ),
	{ V_msg, Bin4 } = binary_read_string( Bin3 ),
	{ #pk_LS2U_LoginResult {
		result = V_result,
		accountID = V_accountID,
		identity = V_identity,
		msg = V_msg
		},
	Bin4 };

%GENERATED from file:LS2User.h => LS2Web_CryptoAck
readNetMsg(?CMD_LS2Web_CryptoAck,Bin0) ->
	{ V_bodyJsonStr, Bin1 } = binary_read_string( Bin0 ),
	{ #pk_LS2Web_CryptoAck {
		bodyJsonStr = V_bodyJsonStr
		},
	Bin1 };

%GENERATED from file:LS2User.h => LS2Web_NormalAck
readNetMsg(?CMD_LS2Web_NormalAck,Bin0) ->
	{ V_bodyJsonStr, Bin1 } = binary_read_string( Bin0 ),
	{ #pk_LS2Web_NormalAck {
		bodyJsonStr = V_bodyJsonStr
		},
	Bin1 };

%GENERATED from file:LS2User.h => U2LS_Login_Normal
readNetMsg(?CMD_U2LS_Login_Normal,Bin0) ->
	{ V_platformAccount, Bin1 } = binary_read_string( Bin0 ),
	{ V_platformName, Bin2 } = binary_read_string( Bin1 ),
	{ V_platformNickName, Bin3 } = binary_read_string( Bin2 ),
	{ V_time, Bin4 } = binary_read_int64( Bin3 ),
	{ V_sign, Bin5 } = binary_read_string( Bin4 ),
	{ V_deviceId, Bin6 } = binary_read_string( Bin5 ),
	{ V_imei, Bin7 } = binary_read_string( Bin6 ),
	{ V_idfa, Bin8 } = binary_read_string( Bin7 ),
	{ V_mac, Bin9 } = binary_read_string( Bin8 ),
	{ V_extParam, Bin10 } = binary_read_string( Bin9 ),
	{ V_versionRes, Bin11 } = binary_read_int( Bin10 ),
	{ V_versionExe, Bin12 } = binary_read_int( Bin11 ),
	{ V_versionGame, Bin13 } = binary_read_int( Bin12 ),
	{ V_versionPro, Bin14 } = binary_read_int( Bin13 ),
	{ #pk_U2LS_Login_Normal {
		platformAccount = V_platformAccount,
		platformName = V_platformName,
		platformNickName = V_platformNickName,
		time = V_time,
		sign = V_sign,
		deviceId = V_deviceId,
		imei = V_imei,
		idfa = V_idfa,
		mac = V_mac,
		extParam = V_extParam,
		versionRes = V_versionRes,
		versionExe = V_versionExe,
		versionGame = V_versionGame,
		versionPro = V_versionPro
		},
	Bin14 };

%GENERATED from file:LS2User.h => U2LS_RequestGSLine
readNetMsg(?CMD_U2LS_RequestGSLine,Bin0) ->
	{ #pk_U2LS_RequestGSLine {

		},
	Bin0 };

%GENERATED from file:LS2User.h => Web2LS_Crypto
readNetMsg(?CMD_Web2LS_Crypto,Bin0) ->
	{ V_bodyJsonStr, Bin1 } = binary_read_string( Bin0 ),
	{ #pk_Web2LS_Crypto {
		bodyJsonStr = V_bodyJsonStr
		},
	Bin1 };

%GENERATED from file:LS2User.h => Web2LS_Normal
readNetMsg(?CMD_Web2LS_Normal,Bin0) ->
	{ V_bodyJsonStr, Bin1 } = binary_read_string( Bin0 ),
	{ #pk_Web2LS_Normal {
		bodyJsonStr = V_bodyJsonStr
		},
	Bin1 };

%GENERATED from file:achieve.h => GS2U_AchieveSchedule
readNetMsg(?CMD_GS2U_AchieveSchedule,Bin0) ->
	{ V_achieveID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_scheduleRewardID, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_scheduleCompleteNum, Bin3 } = binary_read_uint( Bin2 ),
	{ V_scheduleCompleteID, Bin4 } = binary_read_uint8( Bin3 ),
	{ #pk_GS2U_AchieveSchedule {
		achieveID = V_achieveID,
		scheduleRewardID = V_scheduleRewardID,
		scheduleCompleteNum = V_scheduleCompleteNum,
		scheduleCompleteID = V_scheduleCompleteID
		},
	Bin4 };

%GENERATED from file:achieve.h => GS2U_AchieveScheduleList
readNetMsg(?CMD_GS2U_AchieveScheduleList,Bin0) ->
	{ V_scheduleList, Bin1 } = binary_read_array(Bin0, fun(X) -> readAchieveSchedule( X ) end),
	{ #pk_GS2U_AchieveScheduleList {
		scheduleList = V_scheduleList
		},
	Bin1 };

%GENERATED from file:achieve.h => GS2U_AddTitle
readNetMsg(?CMD_GS2U_AddTitle,Bin0) ->
	{ V_titleID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_endTime, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_AddTitle {
		titleID = V_titleID,
		endTime = V_endTime
		},
	Bin2 };

%GENERATED from file:achieve.h => GS2U_BadgeInfo
readNetMsg(?CMD_GS2U_BadgeInfo,Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_itemID, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_BadgeInfo {
		mapID = V_mapID,
		itemID = V_itemID
		},
	Bin2 };

%GENERATED from file:achieve.h => GS2U_BadgeInfoList
readNetMsg(?CMD_GS2U_BadgeInfoList,Bin0) ->
	{ V_badgeInfoList, Bin1 } = binary_read_array(Bin0, fun(X) -> readBadgeInfo( X ) end),
	{ #pk_GS2U_BadgeInfoList {
		badgeInfoList = V_badgeInfoList
		},
	Bin1 };

%GENERATED from file:achieve.h => GS2U_DelTitle
readNetMsg(?CMD_GS2U_DelTitle,Bin0) ->
	{ V_titleID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_DelTitle {
		titleID = V_titleID
		},
	Bin1 };

%GENERATED from file:achieve.h => GS2U_InitDailyActiveInfo
readNetMsg(?CMD_GS2U_InitDailyActiveInfo,Bin0) ->
	{ V_dailyActiveInfoList, Bin1 } = binary_read_array(Bin0, fun(X) -> readDailyActiveInfo( X ) end),
	{ V_receivedAwardList, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint16( X ) end),
	{ #pk_GS2U_InitDailyActiveInfo {
		dailyActiveInfoList = V_dailyActiveInfoList,
		receivedAwardList = V_receivedAwardList
		},
	Bin2 };

%GENERATED from file:achieve.h => GS2U_OwnTitleList
readNetMsg(?CMD_GS2U_OwnTitleList,Bin0) ->
	{ V_titleInfoList, Bin1 } = binary_read_array(Bin0, fun(X) -> readTitleInfo( X ) end),
	{ #pk_GS2U_OwnTitleList {
		titleInfoList = V_titleInfoList
		},
	Bin1 };

%GENERATED from file:achieve.h => GS2U_ReceiveDailyActiveAwardResult
readNetMsg(?CMD_GS2U_ReceiveDailyActiveAwardResult,Bin0) ->
	{ V_dailyActivityValue, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_ReceiveDailyActiveAwardResult {
		dailyActivityValue = V_dailyActivityValue
		},
	Bin1 };

%GENERATED from file:achieve.h => GS2U_UpdateDailyActiveInfo
readNetMsg(?CMD_GS2U_UpdateDailyActiveInfo,Bin0) ->
	{ V_dailyActiveInfo, Bin1 } = readDailyActiveInfo( Bin0 ),
	{ #pk_GS2U_UpdateDailyActiveInfo {
		dailyActiveInfo = V_dailyActiveInfo
		},
	Bin1 };

%GENERATED from file:achieve.h => U2GS_ChangeLimiteTitleState
readNetMsg(?CMD_U2GS_ChangeLimiteTitleState,Bin0) ->
	{ V_titleID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_ChangeLimiteTitleState {
		titleID = V_titleID
		},
	Bin1 };

%GENERATED from file:achieve.h => U2GS_ChangeTitleState
readNetMsg(?CMD_U2GS_ChangeTitleState,Bin0) ->
	{ V_titleSlot1, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_titleSlot2, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_titleSlot3, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_colorSlot, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_floorSlot, Bin5 } = binary_read_uint16( Bin4 ),
	{ #pk_U2GS_ChangeTitleState {
		titleSlot1 = V_titleSlot1,
		titleSlot2 = V_titleSlot2,
		titleSlot3 = V_titleSlot3,
		colorSlot = V_colorSlot,
		floorSlot = V_floorSlot
		},
	Bin5 };

%GENERATED from file:achieve.h => U2GS_ReceiveAchieveValue
readNetMsg(?CMD_U2GS_ReceiveAchieveValue,Bin0) ->
	{ V_achieveID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_ReceiveAchieveValue {
		achieveID = V_achieveID
		},
	Bin1 };

%GENERATED from file:achieve.h => U2GS_ReceiveDailyActiveAward
readNetMsg(?CMD_U2GS_ReceiveDailyActiveAward,Bin0) ->
	{ V_dailyActivityValue, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_ReceiveDailyActiveAward {
		dailyActivityValue = V_dailyActivityValue
		},
	Bin1 };

%GENERATED from file:activity.h => ArenaTeamMemberPrepare
readNetMsg(?CMD_ArenaTeamMemberPrepare,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_isPrepare, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_ArenaTeamMemberPrepare {
		id = V_id,
		isPrepare = V_isPrepare
		},
	Bin2 };

%GENERATED from file:activity.h => CrosArenaMatch
readNetMsg(?CMD_CrosArenaMatch,Bin0) ->
	{ V_isMatch, Bin1 } = binary_read_bool( Bin0 ),
	{ #pk_CrosArenaMatch {
		isMatch = V_isMatch
		},
	Bin1 };

%GENERATED from file:activity.h => DeleteArenaTeamMember
readNetMsg(?CMD_DeleteArenaTeamMember,Bin0) ->
	{ V_isMyself, Bin1 } = binary_read_bool( Bin0 ),
	{ V_id, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_DeleteArenaTeamMember {
		isMyself = V_isMyself,
		id = V_id
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_ACCityMonsterSurplusTime
readNetMsg(?CMD_GS2U_ACCityMonsterSurplusTime,Bin0) ->
	{ V_surplusTime, Bin1 } = binary_read_int( Bin0 ),
	{ #pk_GS2U_ACCityMonsterSurplusTime {
		surplusTime = V_surplusTime
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_ActionList
readNetMsg(?CMD_GS2U_ActionList,Bin0) ->
	{ V_correctID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_danceIDs, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint( X ) end),
	{ #pk_GS2U_ActionList {
		correctID = V_correctID,
		danceIDs = V_danceIDs
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_ActivityEnd
readNetMsg(?CMD_GS2U_ActivityEnd,Bin0) ->
	{ #pk_GS2U_ActivityEnd {

		},
	Bin0 };

%GENERATED from file:activity.h => GS2U_ActivityState
readNetMsg(?CMD_GS2U_ActivityState,Bin0) ->
	{ V_activityID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_mapID, Bin2 } = binary_read_uint( Bin1 ),
	{ V_phase, Bin3 } = binary_read_int16( Bin2 ),
	{ #pk_GS2U_ActivityState {
		activityID = V_activityID,
		mapID = V_mapID,
		phase = V_phase
		},
	Bin3 };

%GENERATED from file:activity.h => GS2U_AddArenaTeamMemberRequest
readNetMsg(?CMD_GS2U_AddArenaTeamMemberRequest,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_GS2U_AddArenaTeamMemberRequest {
		roleID = V_roleID,
		name = V_name
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_AllAnswerQuestion
readNetMsg(?CMD_GS2U_AllAnswerQuestion,Bin0) ->
	{ V_questionID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_startTime, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_AllAnswerQuestion {
		questionID = V_questionID,
		startTime = V_startTime
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_AngelInvestmentList
readNetMsg(?CMD_GS2U_AngelInvestmentList,Bin0) ->
	{ V_lists, Bin1 } = binary_read_array(Bin0, fun(X) -> readAngelInvestmentData( X ) end),
	{ #pk_GS2U_AngelInvestmentList {
		lists = V_lists
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_AnswerFirstAndLuckyPlayer
readNetMsg(?CMD_GS2U_AnswerFirstAndLuckyPlayer,Bin0) ->
	{ V_playerName, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_string( X ) end),
	{ #pk_GS2U_AnswerFirstAndLuckyPlayer {
		playerName = V_playerName
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_AnswerQuestion
readNetMsg(?CMD_GS2U_AnswerQuestion,Bin0) ->
	{ V_startTime, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_answerNum, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_questionList, Bin3 } = binary_read_array(Bin2, fun(X) -> readQuestion( X ) end),
	{ #pk_GS2U_AnswerQuestion {
		startTime = V_startTime,
		answerNum = V_answerNum,
		questionList = V_questionList
		},
	Bin3 };

%GENERATED from file:activity.h => GS2U_AnswerRank
readNetMsg(?CMD_GS2U_AnswerRank,Bin0) ->
	{ V_data, Bin1 } = binary_read_array(Bin0, fun(X) -> readActivityAnswerRankData( X ) end),
	{ V_isover, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_GS2U_AnswerRank {
		data = V_data,
		isover = V_isover
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_ApplyAnswerResult
readNetMsg(?CMD_GS2U_ApplyAnswerResult,Bin0) ->
	{ V_result, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_endTime, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_ApplyAnswerResult {
		result = V_result,
		endTime = V_endTime
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_ArenaBattleList
readNetMsg(?CMD_GS2U_ArenaBattleList,Bin0) ->
	{ V_res, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_bList, Bin2 } = binary_read_array(Bin1, fun(X) -> readArenaBattle( X ) end),
	{ #pk_GS2U_ArenaBattleList {
		res = V_res,
		bList = V_bList
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_ArenaRoleDead
readNetMsg(?CMD_GS2U_ArenaRoleDead,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_GS2U_ArenaRoleDead {
		id = V_id
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_ArenaRoleList
readNetMsg(?CMD_GS2U_ArenaRoleList,Bin0) ->
	{ V_time, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_roleList, Bin2 } = binary_read_array(Bin1, fun(X) -> readArenaRole( X ) end),
	{ #pk_GS2U_ArenaRoleList {
		time = V_time,
		roleList = V_roleList
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_AttackerDefenderQuotaNumberAck
readNetMsg(?CMD_GS2U_AttackerDefenderQuotaNumberAck,Bin0) ->
	{ V_activityID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_mapID, Bin2 } = binary_read_uint( Bin1 ),
	{ V_acctackerQuotaNum, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_GS2U_AttackerDefenderQuotaNumberAck {
		activityID = V_activityID,
		mapID = V_mapID,
		acctackerQuotaNum = V_acctackerQuotaNum
		},
	Bin3 };

%GENERATED from file:activity.h => GS2U_BreakDance
readNetMsg(?CMD_GS2U_BreakDance,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_GS2U_BreakDance {
		roleID = V_roleID
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_ChangeGuardianDeclaration
readNetMsg(?CMD_GS2U_ChangeGuardianDeclaration,Bin0) ->
	{ V_isChange, Bin1 } = binary_read_bool( Bin0 ),
	{ #pk_GS2U_ChangeGuardianDeclaration {
		isChange = V_isChange
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_CrosArenaBattleHighRanks
readNetMsg(?CMD_GS2U_CrosArenaBattleHighRanks,Bin0) ->
	{ V_ranks, Bin1 } = binary_read_array(Bin0, fun(X) -> readCrosArenaBattleHighRank( X ) end),
	{ #pk_GS2U_CrosArenaBattleHighRanks {
		ranks = V_ranks
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_CrosArenaBattleRanks
readNetMsg(?CMD_GS2U_CrosArenaBattleRanks,Bin0) ->
	{ V_ranks, Bin1 } = binary_read_array(Bin0, fun(X) -> readCrosArenaBattleRank( X ) end),
	{ #pk_GS2U_CrosArenaBattleRanks {
		ranks = V_ranks
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_CrosBattleExploits
readNetMsg(?CMD_GS2U_CrosBattleExploits,Bin0) ->
	{ V_ranks, Bin1 } = binary_read_array(Bin0, fun(X) -> readCrosBattleExploit( X ) end),
	{ #pk_GS2U_CrosBattleExploits {
		ranks = V_ranks
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_CurEscortType
readNetMsg(?CMD_GS2U_CurEscortType,Bin0) ->
	{ V_escortType, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_CurEscortType {
		escortType = V_escortType
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_DarknessCamp
readNetMsg(?CMD_GS2U_DarknessCamp,Bin0) ->
	{ V_camp, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_integral, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_DarknessCamp {
		camp = V_camp,
		integral = V_integral
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_DarknessInfo
readNetMsg(?CMD_GS2U_DarknessInfo,Bin0) ->
	{ V_state, Bin1 } = readDarknessState( Bin0 ),
	{ V_buyMoneyType, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_buyMoney, Bin3 } = binary_read_int( Bin2 ),
	{ #pk_GS2U_DarknessInfo {
		state = V_state,
		buyMoneyType = V_buyMoneyType,
		buyMoney = V_buyMoney
		},
	Bin3 };

%GENERATED from file:activity.h => GS2U_DarknessKillOrBeKill
readNetMsg(?CMD_GS2U_DarknessKillOrBeKill,Bin0) ->
	{ V_targetName, Bin1 } = binary_read_string( Bin0 ),
	{ V_isSuccess, Bin2 } = binary_read_bool( Bin1 ),
	{ V_changePebble, Bin3 } = binary_read_int( Bin2 ),
	{ #pk_GS2U_DarknessKillOrBeKill {
		targetName = V_targetName,
		isSuccess = V_isSuccess,
		changePebble = V_changePebble
		},
	Bin3 };

%GENERATED from file:activity.h => GS2U_DarknessQuenenState
readNetMsg(?CMD_GS2U_DarknessQuenenState,Bin0) ->
	{ V_entrance, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_floor, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_GS2U_DarknessQuenenState {
		entrance = V_entrance,
		floor = V_floor
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_DarknessRank
readNetMsg(?CMD_GS2U_DarknessRank,Bin0) ->
	{ V_camp1, Bin1 } = binary_read_array(Bin0, fun(X) -> readDarknessPlayerRank( X ) end),
	{ V_camp2, Bin2 } = binary_read_array(Bin1, fun(X) -> readDarknessPlayerRank( X ) end),
	{ #pk_GS2U_DarknessRank {
		camp1 = V_camp1,
		camp2 = V_camp2
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_DarknessState
readNetMsg(?CMD_GS2U_DarknessState,Bin0) ->
	{ V_state, Bin1 } = readDarknessState( Bin0 ),
	{ #pk_GS2U_DarknessState {
		state = V_state
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_DestinyStar
readNetMsg(?CMD_GS2U_DestinyStar,Bin0) ->
	{ V_stars, Bin1 } = binary_read_array(Bin0, fun(X) -> readLotteryItem( X ) end),
	{ #pk_GS2U_DestinyStar {
		stars = V_stars
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_EnterDarkness
readNetMsg(?CMD_GS2U_EnterDarkness,Bin0) ->
	{ V_entrances, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_GS2U_EnterDarkness {
		entrances = V_entrances
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_EscortResult
readNetMsg(?CMD_GS2U_EscortResult,Bin0) ->
	{ V_escortType, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_endReason, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_isSuccess, Bin3 } = binary_read_bool( Bin2 ),
	{ V_rewards, Bin4 } = binary_read_array(Bin3, fun(X) -> readEscortResultReward( X ) end),
	{ V_plunder, Bin5 } = binary_read_array(Bin4, fun(X) -> readEscortPlunderMoney( X ) end),
	{ #pk_GS2U_EscortResult {
		escortType = V_escortType,
		endReason = V_endReason,
		isSuccess = V_isSuccess,
		rewards = V_rewards,
		plunder = V_plunder
		},
	Bin5 };

%GENERATED from file:activity.h => GS2U_GetChargeOrUseGiftAck
readNetMsg(?CMD_GS2U_GetChargeOrUseGiftAck,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_ruleID, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_success, Bin3 } = binary_read_bool( Bin2 ),
	{ #pk_GS2U_GetChargeOrUseGiftAck {
		type = V_type,
		ruleID = V_ruleID,
		success = V_success
		},
	Bin3 };

%GENERATED from file:activity.h => GS2U_Goblin_Open_State
readNetMsg(?CMD_GS2U_Goblin_Open_State,Bin0) ->
	{ V_isOpen, Bin1 } = binary_read_bool( Bin0 ),
	{ V_mapID, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_Goblin_Open_State {
		isOpen = V_isOpen,
		mapID = V_mapID
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_HDBattleCD
readNetMsg(?CMD_GS2U_HDBattleCD,Bin0) ->
	{ V_time, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_HDBattleCD {
		time = V_time
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_HDBattleExploits
readNetMsg(?CMD_GS2U_HDBattleExploits,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_exploits, Bin2 } = binary_read_array(Bin1, fun(X) -> readHDBattleExploit( X ) end),
	{ #pk_GS2U_HDBattleExploits {
		type = V_type,
		exploits = V_exploits
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_HDBattleOpenSurplusTime
readNetMsg(?CMD_GS2U_HDBattleOpenSurplusTime,Bin0) ->
	{ V_surplusTime, Bin1 } = binary_read_int16( Bin0 ),
	{ #pk_GS2U_HDBattleOpenSurplusTime {
		surplusTime = V_surplusTime
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_HDBattlePhase
readNetMsg(?CMD_GS2U_HDBattlePhase,Bin0) ->
	{ V_phase, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_param1, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_param2, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_GS2U_HDBattlePhase {
		phase = V_phase,
		param1 = V_param1,
		param2 = V_param2
		},
	Bin3 };

%GENERATED from file:activity.h => GS2U_HDGatherSuccess
readNetMsg(?CMD_GS2U_HDGatherSuccess,Bin0) ->
	{ V_gatherID, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_HDGatherSuccess {
		gatherID = V_gatherID
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_IconLight
readNetMsg(?CMD_GS2U_IconLight,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_light, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_GS2U_IconLight {
		id = V_id,
		light = V_light
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_InitWildBossInfo
readNetMsg(?CMD_GS2U_InitWildBossInfo,Bin0) ->
	{ V_infos, Bin1 } = binary_read_array(Bin0, fun(X) -> readWildBossInfo( X ) end),
	{ #pk_GS2U_InitWildBossInfo {
		infos = V_infos
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_JoinHDBattle
readNetMsg(?CMD_GS2U_JoinHDBattle,Bin0) ->
	{ #pk_GS2U_JoinHDBattle {

		},
	Bin0 };

%GENERATED from file:activity.h => GS2U_KillPlayerNumber
readNetMsg(?CMD_GS2U_KillPlayerNumber,Bin0) ->
	{ V_sortNumber, Bin1 } = binary_read_uint( Bin0 ),
	{ V_killNumber, Bin2 } = binary_read_uint( Bin1 ),
	{ V_lxKillNumber, Bin3 } = binary_read_uint( Bin2 ),
	{ V_needKill, Bin4 } = binary_read_uint( Bin3 ),
	{ V_remainSecond, Bin5 } = binary_read_uint( Bin4 ),
	{ V_gatherNumber, Bin6 } = binary_read_uint( Bin5 ),
	{ V_needGatherNumber, Bin7 } = binary_read_uint( Bin6 ),
	{ #pk_GS2U_KillPlayerNumber {
		sortNumber = V_sortNumber,
		killNumber = V_killNumber,
		lxKillNumber = V_lxKillNumber,
		needKill = V_needKill,
		remainSecond = V_remainSecond,
		gatherNumber = V_gatherNumber,
		needGatherNumber = V_needGatherNumber
		},
	Bin7 };

%GENERATED from file:activity.h => GS2U_KillRank
readNetMsg(?CMD_GS2U_KillRank,Bin0) ->
	{ V_rank, Bin1 } = binary_read_array(Bin0, fun(X) -> readKillRank( X ) end),
	{ #pk_GS2U_KillRank {
		rank = V_rank
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_KingBattleBuffInfo
readNetMsg(?CMD_GS2U_KingBattleBuffInfo,Bin0) ->
	{ V_mirrorBuffcfgID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_defenderBuffcfgID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_attackerBuffcfgID, Bin3 } = binary_read_uint64( Bin2 ),
	{ #pk_GS2U_KingBattleBuffInfo {
		mirrorBuffcfgID = V_mirrorBuffcfgID,
		defenderBuffcfgID = V_defenderBuffcfgID,
		attackerBuffcfgID = V_attackerBuffcfgID
		},
	Bin3 };

%GENERATED from file:activity.h => GS2U_KingBattleRepairMirror
readNetMsg(?CMD_GS2U_KingBattleRepairMirror,Bin0) ->
	{ V_mirrorMaxHp, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_mirrorCurrentHp, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_KingBattleRepairMirror {
		mirrorMaxHp = V_mirrorMaxHp,
		mirrorCurrentHp = V_mirrorCurrentHp
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_KingBattleResult
readNetMsg(?CMD_GS2U_KingBattleResult,Bin0) ->
	{ V_isNewKing, Bin1 } = binary_read_bool( Bin0 ),
	{ V_killNumOrHurt, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_days, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_declaration, Bin4 } = binary_read_string( Bin3 ),
	{ V_name, Bin5 } = binary_read_string( Bin4 ),
	{ V_roleID, Bin6 } = binary_read_uint64( Bin5 ),
	{ V_career, Bin7 } = binary_read_uint( Bin6 ),
	{ V_race, Bin8 } = binary_read_int8( Bin7 ),
	{ V_sex, Bin9 } = binary_read_int8( Bin8 ),
	{ V_head, Bin10 } = binary_read_int( Bin9 ),
	{ V_wingLevel, Bin11 } = binary_read_int( Bin10 ),
	{ V_fashionIDs, Bin12 } = binary_read_array(Bin11, fun(X) -> binary_read_int( X ) end),
	{ V_equipIDList, Bin13 } = binary_read_array(Bin12, fun(X) -> readPlayerKingBattleEquip( X ) end),
	{ V_equipLevelList, Bin14 } = binary_read_array(Bin13, fun(X) -> readPlayerKingBattleEquipLevel( X ) end),
	{ #pk_GS2U_KingBattleResult {
		isNewKing = V_isNewKing,
		killNumOrHurt = V_killNumOrHurt,
		days = V_days,
		declaration = V_declaration,
		name = V_name,
		roleID = V_roleID,
		career = V_career,
		race = V_race,
		sex = V_sex,
		head = V_head,
		wingLevel = V_wingLevel,
		fashionIDs = V_fashionIDs,
		equipIDList = V_equipIDList,
		equipLevelList = V_equipLevelList
		},
	Bin14 };

%GENERATED from file:activity.h => GS2U_LotteryMoney
readNetMsg(?CMD_GS2U_LotteryMoney,Bin0) ->
	{ V_pondGold, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_pondDiamond, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_LotteryMoney {
		pondGold = V_pondGold,
		pondDiamond = V_pondDiamond
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_LotteryNote
readNetMsg(?CMD_GS2U_LotteryNote,Bin0) ->
	{ V_notes, Bin1 } = binary_read_array(Bin0, fun(X) -> readLotteryNote( X ) end),
	{ #pk_GS2U_LotteryNote {
		notes = V_notes
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_LotteryResetTime
readNetMsg(?CMD_GS2U_LotteryResetTime,Bin0) ->
	{ V_goldFreeRstTime, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_diamondFreeRstTime, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_LotteryResetTime {
		goldFreeRstTime = V_goldFreeRstTime,
		diamondFreeRstTime = V_diamondFreeRstTime
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_LotteryResult
readNetMsg(?CMD_GS2U_LotteryResult,Bin0) ->
	{ V_item, Bin1 } = binary_read_array(Bin0, fun(X) -> readLotteryItem( X ) end),
	{ #pk_GS2U_LotteryResult {
		item = V_item
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_MarrorInfoAck
readNetMsg(?CMD_GS2U_MarrorInfoAck,Bin0) ->
	{ V_nickName, Bin1 } = binary_read_string( Bin0 ),
	{ V_playerLevel, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_playerForce, Bin3 } = binary_read_uint( Bin2 ),
	{ V_roleID, Bin4 } = binary_read_uint64( Bin3 ),
	{ V_playerCode, Bin5 } = binary_read_uint64( Bin4 ),
	{ V_career, Bin6 } = binary_read_uint( Bin5 ),
	{ V_race, Bin7 } = binary_read_int8( Bin6 ),
	{ V_sex, Bin8 } = binary_read_int8( Bin7 ),
	{ V_head, Bin9 } = binary_read_int( Bin8 ),
	{ V_wingLevel, Bin10 } = binary_read_int( Bin9 ),
	{ V_clique, Bin11 } = binary_read_string( Bin10 ),
	{ V_defendDays, Bin12 } = binary_read_uint( Bin11 ),
	{ V_mirrorMaxHp, Bin13 } = binary_read_uint64( Bin12 ),
	{ V_mirrorLastHp, Bin14 } = binary_read_uint64( Bin13 ),
	{ V_fashionIDs, Bin15 } = binary_read_array(Bin14, fun(X) -> binary_read_int( X ) end),
	{ V_equipIDList, Bin16 } = binary_read_array(Bin15, fun(X) -> readPlayerKingBattleEquip( X ) end),
	{ V_equipLevelList, Bin17 } = binary_read_array(Bin16, fun(X) -> readPlayerKingBattleEquipLevel( X ) end),
	{ V_declaration, Bin18 } = binary_read_string( Bin17 ),
	{ #pk_GS2U_MarrorInfoAck {
		nickName = V_nickName,
		playerLevel = V_playerLevel,
		playerForce = V_playerForce,
		roleID = V_roleID,
		playerCode = V_playerCode,
		career = V_career,
		race = V_race,
		sex = V_sex,
		head = V_head,
		wingLevel = V_wingLevel,
		clique = V_clique,
		defendDays = V_defendDays,
		mirrorMaxHp = V_mirrorMaxHp,
		mirrorLastHp = V_mirrorLastHp,
		fashionIDs = V_fashionIDs,
		equipIDList = V_equipIDList,
		equipLevelList = V_equipLevelList,
		declaration = V_declaration
		},
	Bin18 };

%GENERATED from file:activity.h => GS2U_MyAnswerRank
readNetMsg(?CMD_GS2U_MyAnswerRank,Bin0) ->
	{ V_ranking, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_value, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_MyAnswerRank {
		ranking = V_ranking,
		value = V_value
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_NoticeWildBossDead
readNetMsg(?CMD_GS2U_NoticeWildBossDead,Bin0) ->
	{ V_info, Bin1 } = readWildBossInfo( Bin0 ),
	{ #pk_GS2U_NoticeWildBossDead {
		info = V_info
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_NoticeWildBossTarget
readNetMsg(?CMD_GS2U_NoticeWildBossTarget,Bin0) ->
	{ V_targetCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ V_isShow, Bin3 } = binary_read_bool( Bin2 ),
	{ #pk_GS2U_NoticeWildBossTarget {
		targetCode = V_targetCode,
		name = V_name,
		isShow = V_isShow
		},
	Bin3 };

%GENERATED from file:activity.h => GS2U_OperateAct_Exchange
readNetMsg(?CMD_GS2U_OperateAct_Exchange,Bin0) ->
	{ V_exchangeID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_exchangeType, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_roleExchangedNum, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_roleMaxExchangeNum, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_exchangeArg, Bin5 } = binary_read_uint16( Bin4 ),
	{ V_exchangeNum, Bin6 } = binary_read_uint16( Bin5 ),
	{ V_startTime, Bin7 } = binary_read_uint( Bin6 ),
	{ V_endTime, Bin8 } = binary_read_uint( Bin7 ),
	{ V_name, Bin9 } = binary_read_string( Bin8 ),
	{ V_title, Bin10 } = binary_read_string( Bin9 ),
	{ V_content, Bin11 } = binary_read_string( Bin10 ),
	{ V_requireList, Bin12 } = binary_read_array(Bin11, fun(X) -> readOperateActExchangeRequire( X ) end),
	{ #pk_GS2U_OperateAct_Exchange {
		exchangeID = V_exchangeID,
		exchangeType = V_exchangeType,
		roleExchangedNum = V_roleExchangedNum,
		roleMaxExchangeNum = V_roleMaxExchangeNum,
		exchangeArg = V_exchangeArg,
		exchangeNum = V_exchangeNum,
		startTime = V_startTime,
		endTime = V_endTime,
		name = V_name,
		title = V_title,
		content = V_content,
		requireList = V_requireList
		},
	Bin12 };

%GENERATED from file:activity.h => GS2U_OperateExchangeAck
readNetMsg(?CMD_GS2U_OperateExchangeAck,Bin0) ->
	{ V_exchangeID, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_OperateExchangeAck {
		exchangeID = V_exchangeID
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_PlayerAnswer
readNetMsg(?CMD_GS2U_PlayerAnswer,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_questionID, Bin2 } = binary_read_uint( Bin1 ),
	{ V_isright, Bin3 } = binary_read_bool( Bin2 ),
	{ V_answers, Bin4 } = binary_read_string( Bin3 ),
	{ V_isFirstAnser, Bin5 } = binary_read_uint( Bin4 ),
	{ V_roleName, Bin6 } = binary_read_string( Bin5 ),
	{ V_level, Bin7 } = binary_read_uint8( Bin6 ),
	{ V_career, Bin8 } = binary_read_uint( Bin7 ),
	{ V_sex, Bin9 } = binary_read_uint8( Bin8 ),
	{ V_race, Bin10 } = binary_read_uint8( Bin9 ),
	{ V_head, Bin11 } = binary_read_int( Bin10 ),
	{ #pk_GS2U_PlayerAnswer {
		roleID = V_roleID,
		questionID = V_questionID,
		isright = V_isright,
		answers = V_answers,
		isFirstAnser = V_isFirstAnser,
		roleName = V_roleName,
		level = V_level,
		career = V_career,
		sex = V_sex,
		race = V_race,
		head = V_head
		},
	Bin11 };

%GENERATED from file:activity.h => GS2U_PlayerAnswerInfo
readNetMsg(?CMD_GS2U_PlayerAnswerInfo,Bin0) ->
	{ V_trueNum, Bin1 } = binary_read_uint( Bin0 ),
	{ V_totalExp, Bin2 } = binary_read_uint( Bin1 ),
	{ V_totalCoin, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GS2U_PlayerAnswerInfo {
		trueNum = V_trueNum,
		totalExp = V_totalExp,
		totalCoin = V_totalCoin
		},
	Bin3 };

%GENERATED from file:activity.h => GS2U_PlayerAnswerResult
readNetMsg(?CMD_GS2U_PlayerAnswerResult,Bin0) ->
	{ V_result, Bin1 } = binary_read_int( Bin0 ),
	{ V_trueAnswer, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_GS2U_PlayerAnswerResult {
		result = V_result,
		trueAnswer = V_trueAnswer
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_QueueNumber
readNetMsg(?CMD_GS2U_QueueNumber,Bin0) ->
	{ V_queueNumber, Bin1 } = binary_read_uint( Bin0 ),
	{ V_isStart, Bin2 } = binary_read_bool( Bin1 ),
	{ V_isIMApply, Bin3 } = binary_read_bool( Bin2 ),
	{ #pk_GS2U_QueueNumber {
		queueNumber = V_queueNumber,
		isStart = V_isStart,
		isIMApply = V_isIMApply
		},
	Bin3 };

%GENERATED from file:activity.h => GS2U_RequestChargeOrUseListAck
readNetMsg(?CMD_GS2U_RequestChargeOrUseListAck,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_activityName, Bin2 } = binary_read_string( Bin1 ),
	{ V_activityDesc, Bin3 } = binary_read_string( Bin2 ),
	{ V_beginTime, Bin4 } = binary_read_uint( Bin3 ),
	{ V_endTime, Bin5 } = binary_read_uint( Bin4 ),
	{ V_amountInTime, Bin6 } = binary_read_uint( Bin5 ),
	{ V_ruleInfoList, Bin7 } = binary_read_array(Bin6, fun(X) -> readChargeOrUseRuleInfo( X ) end),
	{ #pk_GS2U_RequestChargeOrUseListAck {
		type = V_type,
		activityName = V_activityName,
		activityDesc = V_activityDesc,
		beginTime = V_beginTime,
		endTime = V_endTime,
		amountInTime = V_amountInTime,
		ruleInfoList = V_ruleInfoList
		},
	Bin7 };

%GENERATED from file:activity.h => GS2U_ReturnEscortList
readNetMsg(?CMD_GS2U_ReturnEscortList,Bin0) ->
	{ V_etlist, Bin1 } = binary_read_array(Bin0, fun(X) -> readEscortTeam( X ) end),
	{ #pk_GS2U_ReturnEscortList {
		etlist = V_etlist
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_RobitAutoAnswer
readNetMsg(?CMD_GS2U_RobitAutoAnswer,Bin0) ->
	{ V_answerList, Bin1 } = binary_read_array(Bin0, fun(X) -> readRobitAnswer( X ) end),
	{ #pk_GS2U_RobitAutoAnswer {
		answerList = V_answerList
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_SelectCamp
readNetMsg(?CMD_GS2U_SelectCamp,Bin0) ->
	{ V_camp1, Bin1 } = binary_read_array(Bin0, fun(X) -> readDarknessPlayerRank( X ) end),
	{ V_cam1Num, Bin2 } = binary_read_uint( Bin1 ),
	{ V_camp2, Bin3 } = binary_read_array(Bin2, fun(X) -> readDarknessPlayerRank( X ) end),
	{ V_cam2Num, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_GS2U_SelectCamp {
		camp1 = V_camp1,
		cam1Num = V_cam1Num,
		camp2 = V_camp2,
		cam2Num = V_cam2Num
		},
	Bin4 };

%GENERATED from file:activity.h => GS2U_SelectDanceID
readNetMsg(?CMD_GS2U_SelectDanceID,Bin0) ->
	{ V_danceID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_correct, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_GS2U_SelectDanceID {
		danceID = V_danceID,
		correct = V_correct
		},
	Bin2 };

%GENERATED from file:activity.h => GS2U_SelfDarkness
readNetMsg(?CMD_GS2U_SelfDarkness,Bin0) ->
	{ V_self, Bin1 } = readDarknessPlayerRank( Bin0 ),
	{ V_isNeedSelectCamp, Bin2 } = binary_read_bool( Bin1 ),
	{ V_bossID, Bin3 } = binary_read_uint( Bin2 ),
	{ V_syFreshTime, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_GS2U_SelfDarkness {
		self = V_self,
		isNeedSelectCamp = V_isNeedSelectCamp,
		bossID = V_bossID,
		syFreshTime = V_syFreshTime
		},
	Bin4 };

%GENERATED from file:activity.h => GS2U_SendAnswerData
readNetMsg(?CMD_GS2U_SendAnswerData,Bin0) ->
	{ V_questionID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_endTime, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_data, Bin3 } = binary_read_array(Bin2, fun(X) -> readActivityAnswerRankData( X ) end),
	{ #pk_GS2U_SendAnswerData {
		questionID = V_questionID,
		endTime = V_endTime,
		data = V_data
		},
	Bin3 };

%GENERATED from file:activity.h => GS2U_SevenMissionDataList
readNetMsg(?CMD_GS2U_SevenMissionDataList,Bin0) ->
	{ V_days, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_timeoutSeconds, Bin2 } = binary_read_uint( Bin1 ),
	{ V_lists, Bin3 } = binary_read_array(Bin2, fun(X) -> readSevenDayMissionData( X ) end),
	{ #pk_GS2U_SevenMissionDataList {
		days = V_days,
		timeoutSeconds = V_timeoutSeconds,
		lists = V_lists
		},
	Bin3 };

%GENERATED from file:activity.h => GS2U_SevenMissionDataUpdate
readNetMsg(?CMD_GS2U_SevenMissionDataUpdate,Bin0) ->
	{ V_isFinish, Bin1 } = binary_read_bool( Bin0 ),
	{ V_number, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_max, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_missionid, Bin4 } = binary_read_uint16( Bin3 ),
	{ #pk_GS2U_SevenMissionDataUpdate {
		isFinish = V_isFinish,
		number = V_number,
		max = V_max,
		missionid = V_missionid
		},
	Bin4 };

%GENERATED from file:activity.h => GS2U_SwitchDance
readNetMsg(?CMD_GS2U_SwitchDance,Bin0) ->
	{ V_second, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_GS2U_SwitchDance {
		second = V_second
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_TriggerEvent
readNetMsg(?CMD_GS2U_TriggerEvent,Bin0) ->
	{ #pk_GS2U_TriggerEvent {

		},
	Bin0 };

%GENERATED from file:activity.h => GS2U_TriggerEventResult
readNetMsg(?CMD_GS2U_TriggerEventResult,Bin0) ->
	{ V_eventID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_TriggerEventResult {
		eventID = V_eventID
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_UpdateArenaTeamMember
readNetMsg(?CMD_GS2U_UpdateArenaTeamMember,Bin0) ->
	{ V_teamMemberInfos, Bin1 } = binary_read_array(Bin0, fun(X) -> readArenaTeamMemberInfo( X ) end),
	{ #pk_GS2U_UpdateArenaTeamMember {
		teamMemberInfos = V_teamMemberInfos
		},
	Bin1 };

%GENERATED from file:activity.h => GS2U_WorldLevel
readNetMsg(?CMD_GS2U_WorldLevel,Bin0) ->
	{ V_worldLevel, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_GS2U_WorldLevel {
		worldLevel = V_worldLevel
		},
	Bin1 };

%GENERATED from file:activity.h => U2GS_AddArenaTeamMember
readNetMsg(?CMD_U2GS_AddArenaTeamMember,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_AddArenaTeamMember {
		id = V_id
		},
	Bin1 };

%GENERATED from file:activity.h => U2GS_AddArenaTeamMemberAck
readNetMsg(?CMD_U2GS_AddArenaTeamMemberAck,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_result, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_AddArenaTeamMemberAck {
		roleID = V_roleID,
		result = V_result
		},
	Bin2 };

%GENERATED from file:activity.h => U2GS_AngelInvestment
readNetMsg(?CMD_U2GS_AngelInvestment,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_AngelInvestment {
		id = V_id
		},
	Bin1 };

%GENERATED from file:activity.h => U2GS_AngelInvestmentGet
readNetMsg(?CMD_U2GS_AngelInvestmentGet,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_AngelInvestmentGet {
		id = V_id
		},
	Bin1 };

%GENERATED from file:activity.h => U2GS_ApplyAnswer
readNetMsg(?CMD_U2GS_ApplyAnswer,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_ApplyAnswer {
		type = V_type
		},
	Bin1 };

%GENERATED from file:activity.h => U2GS_ApplyDance
readNetMsg(?CMD_U2GS_ApplyDance,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_ApplyDance {
		type = V_type
		},
	Bin1 };

%GENERATED from file:activity.h => U2GS_AttackDefenderQuotaNumber
readNetMsg(?CMD_U2GS_AttackDefenderQuotaNumber,Bin0) ->
	{ V_activityID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_mapID, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_AttackDefenderQuotaNumber {
		activityID = V_activityID,
		mapID = V_mapID
		},
	Bin2 };

%GENERATED from file:activity.h => U2GS_BreakDance
readNetMsg(?CMD_U2GS_BreakDance,Bin0) ->
	{ #pk_U2GS_BreakDance {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_CancelApply
readNetMsg(?CMD_U2GS_CancelApply,Bin0) ->
	{ #pk_U2GS_CancelApply {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_DanceArea
readNetMsg(?CMD_U2GS_DanceArea,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_DanceArea {
		type = V_type
		},
	Bin1 };

%GENERATED from file:activity.h => U2GS_DarknessRank
readNetMsg(?CMD_U2GS_DarknessRank,Bin0) ->
	{ #pk_U2GS_DarknessRank {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_GetAnswerScore
readNetMsg(?CMD_U2GS_GetAnswerScore,Bin0) ->
	{ #pk_U2GS_GetAnswerScore {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_GetChargeOrUseGift
readNetMsg(?CMD_U2GS_GetChargeOrUseGift,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_ruleID, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_GetChargeOrUseGift {
		type = V_type,
		ruleID = V_ruleID
		},
	Bin2 };

%GENERATED from file:activity.h => U2GS_GiveMarrorFlower
readNetMsg(?CMD_U2GS_GiveMarrorFlower,Bin0) ->
	{ #pk_U2GS_GiveMarrorFlower {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_GuardianDeclaration
readNetMsg(?CMD_U2GS_GuardianDeclaration,Bin0) ->
	{ V_declaration, Bin1 } = binary_read_string( Bin0 ),
	{ #pk_U2GS_GuardianDeclaration {
		declaration = V_declaration
		},
	Bin1 };

%GENERATED from file:activity.h => U2GS_KillRank
readNetMsg(?CMD_U2GS_KillRank,Bin0) ->
	{ #pk_U2GS_KillRank {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_KingBattleBuyAttackerBuff
readNetMsg(?CMD_U2GS_KingBattleBuyAttackerBuff,Bin0) ->
	{ #pk_U2GS_KingBattleBuyAttackerBuff {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_KingBattleBuyAttackerBuffOneKey
readNetMsg(?CMD_U2GS_KingBattleBuyAttackerBuffOneKey,Bin0) ->
	{ #pk_U2GS_KingBattleBuyAttackerBuffOneKey {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_KingBattleBuyDeffenderBuff
readNetMsg(?CMD_U2GS_KingBattleBuyDeffenderBuff,Bin0) ->
	{ #pk_U2GS_KingBattleBuyDeffenderBuff {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_KingBattleBuyDeffenderBuffOneKey
readNetMsg(?CMD_U2GS_KingBattleBuyDeffenderBuffOneKey,Bin0) ->
	{ #pk_U2GS_KingBattleBuyDeffenderBuffOneKey {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_KingBattleBuyMirrorBuff
readNetMsg(?CMD_U2GS_KingBattleBuyMirrorBuff,Bin0) ->
	{ #pk_U2GS_KingBattleBuyMirrorBuff {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_KingBattleBuyMirrorBuffOneKey
readNetMsg(?CMD_U2GS_KingBattleBuyMirrorBuffOneKey,Bin0) ->
	{ #pk_U2GS_KingBattleBuyMirrorBuffOneKey {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_KingBattleGetBuffInfo
readNetMsg(?CMD_U2GS_KingBattleGetBuffInfo,Bin0) ->
	{ #pk_U2GS_KingBattleGetBuffInfo {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_KingBattleRepairMirror
readNetMsg(?CMD_U2GS_KingBattleRepairMirror,Bin0) ->
	{ V_isRepairAll, Bin1 } = binary_read_bool( Bin0 ),
	{ #pk_U2GS_KingBattleRepairMirror {
		isRepairAll = V_isRepairAll
		},
	Bin1 };

%GENERATED from file:activity.h => U2GS_OpenLotteryForm
readNetMsg(?CMD_U2GS_OpenLotteryForm,Bin0) ->
	{ #pk_U2GS_OpenLotteryForm {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_OpenSelectCamp
readNetMsg(?CMD_U2GS_OpenSelectCamp,Bin0) ->
	{ #pk_U2GS_OpenSelectCamp {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_OperateExchange
readNetMsg(?CMD_U2GS_OperateExchange,Bin0) ->
	{ V_exchangeID, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_OperateExchange {
		exchangeID = V_exchangeID
		},
	Bin1 };

%GENERATED from file:activity.h => U2GS_OperateExchangeRefresh
readNetMsg(?CMD_U2GS_OperateExchangeRefresh,Bin0) ->
	{ #pk_U2GS_OperateExchangeRefresh {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_PlayerAnswer
readNetMsg(?CMD_U2GS_PlayerAnswer,Bin0) ->
	{ V_questionID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_isright, Bin2 } = binary_read_bool( Bin1 ),
	{ V_answers, Bin3 } = binary_read_string( Bin2 ),
	{ #pk_U2GS_PlayerAnswer {
		questionID = V_questionID,
		isright = V_isright,
		answers = V_answers
		},
	Bin3 };

%GENERATED from file:activity.h => U2GS_PlayerAnswerQuestion
readNetMsg(?CMD_U2GS_PlayerAnswerQuestion,Bin0) ->
	{ V_questionID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_answers, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_PlayerAnswerQuestion {
		questionID = V_questionID,
		answers = V_answers
		},
	Bin2 };

%GENERATED from file:activity.h => U2GS_QueryAngelInvestment
readNetMsg(?CMD_U2GS_QueryAngelInvestment,Bin0) ->
	{ #pk_U2GS_QueryAngelInvestment {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_QuerySevenMissionData
readNetMsg(?CMD_U2GS_QuerySevenMissionData,Bin0) ->
	{ #pk_U2GS_QuerySevenMissionData {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_ReadyArena
readNetMsg(?CMD_U2GS_ReadyArena,Bin0) ->
	{ #pk_U2GS_ReadyArena {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_RequestCrosArenaRanks
readNetMsg(?CMD_U2GS_RequestCrosArenaRanks,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_RequestCrosArenaRanks {
		type = V_type
		},
	Bin1 };

%GENERATED from file:activity.h => U2GS_RequestCrosRanks
readNetMsg(?CMD_U2GS_RequestCrosRanks,Bin0) ->
	{ #pk_U2GS_RequestCrosRanks {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_RequestDarknessInfo
readNetMsg(?CMD_U2GS_RequestDarknessInfo,Bin0) ->
	{ #pk_U2GS_RequestDarknessInfo {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_RequestEnterDarkness
readNetMsg(?CMD_U2GS_RequestEnterDarkness,Bin0) ->
	{ V_entrance, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_RequestEnterDarkness {
		entrance = V_entrance
		},
	Bin1 };

%GENERATED from file:activity.h => U2GS_RequestEntrance
readNetMsg(?CMD_U2GS_RequestEntrance,Bin0) ->
	{ #pk_U2GS_RequestEntrance {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_RequestEscortList
readNetMsg(?CMD_U2GS_RequestEscortList,Bin0) ->
	{ #pk_U2GS_RequestEscortList {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_RequestEscortRob
readNetMsg(?CMD_U2GS_RequestEscortRob,Bin0) ->
	{ V_sequenceNumber, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_RequestEscortRob {
		sequenceNumber = V_sequenceNumber
		},
	Bin1 };

%GENERATED from file:activity.h => U2GS_RequestEscortSolo
readNetMsg(?CMD_U2GS_RequestEscortSolo,Bin0) ->
	{ #pk_U2GS_RequestEscortSolo {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_RequestEscortTeam
readNetMsg(?CMD_U2GS_RequestEscortTeam,Bin0) ->
	{ #pk_U2GS_RequestEscortTeam {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_RequestHDBattle
readNetMsg(?CMD_U2GS_RequestHDBattle,Bin0) ->
	{ #pk_U2GS_RequestHDBattle {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_RequestHDBattleCD
readNetMsg(?CMD_U2GS_RequestHDBattleCD,Bin0) ->
	{ #pk_U2GS_RequestHDBattleCD {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_RequestHDBattleExploits
readNetMsg(?CMD_U2GS_RequestHDBattleExploits,Bin0) ->
	{ #pk_U2GS_RequestHDBattleExploits {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_RequestInActivity
readNetMsg(?CMD_U2GS_RequestInActivity,Bin0) ->
	{ V_activityID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_mapID, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_RequestInActivity {
		activityID = V_activityID,
		mapID = V_mapID
		},
	Bin2 };

%GENERATED from file:activity.h => U2GS_RequestJoinHDBattle
readNetMsg(?CMD_U2GS_RequestJoinHDBattle,Bin0) ->
	{ #pk_U2GS_RequestJoinHDBattle {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_RequestLottery
readNetMsg(?CMD_U2GS_RequestLottery,Bin0) ->
	{ V_isGold, Bin1 } = binary_read_bool( Bin0 ),
	{ V_isFree, Bin2 } = binary_read_bool( Bin1 ),
	{ V_number, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_U2GS_RequestLottery {
		isGold = V_isGold,
		isFree = V_isFree,
		number = V_number
		},
	Bin3 };

%GENERATED from file:activity.h => U2GS_RequestLotteryResetTime
readNetMsg(?CMD_U2GS_RequestLotteryResetTime,Bin0) ->
	{ #pk_U2GS_RequestLotteryResetTime {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_RequestMarrorInfo
readNetMsg(?CMD_U2GS_RequestMarrorInfo,Bin0) ->
	{ #pk_U2GS_RequestMarrorInfo {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_RequestOPActivityConfList
readNetMsg(?CMD_U2GS_RequestOPActivityConfList,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_RequestOPActivityConfList {
		type = V_type
		},
	Bin1 };

%GENERATED from file:activity.h => U2GS_RequestQueueNumber
readNetMsg(?CMD_U2GS_RequestQueueNumber,Bin0) ->
	{ #pk_U2GS_RequestQueueNumber {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_SelectCamp
readNetMsg(?CMD_U2GS_SelectCamp,Bin0) ->
	{ V_camp, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_SelectCamp {
		camp = V_camp
		},
	Bin1 };

%GENERATED from file:activity.h => U2GS_SelectDanceID
readNetMsg(?CMD_U2GS_SelectDanceID,Bin0) ->
	{ V_danceID, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_SelectDanceID {
		danceID = V_danceID
		},
	Bin1 };

%GENERATED from file:activity.h => U2GS_SelfDarkness
readNetMsg(?CMD_U2GS_SelfDarkness,Bin0) ->
	{ #pk_U2GS_SelfDarkness {

		},
	Bin0 };

%GENERATED from file:activity.h => U2GS_SevenMissionCompletion
readNetMsg(?CMD_U2GS_SevenMissionCompletion,Bin0) ->
	{ V_missionid, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_SevenMissionCompletion {
		missionid = V_missionid
		},
	Bin1 };

%GENERATED from file:activity.h => U2GS_StartArena
readNetMsg(?CMD_U2GS_StartArena,Bin0) ->
	{ #pk_U2GS_StartArena {

		},
	Bin0 };

%GENERATED from file:arena.h => GS2U_BattleNotes
readNetMsg(?CMD_GS2U_BattleNotes,Bin0) ->
	{ V_lsInfo, Bin1 } = binary_read_array(Bin0, fun(X) -> readLadderLS( X ) end),
	{ V_selfInfo, Bin2 } = binary_read_array(Bin1, fun(X) -> readLadderMatchInfo( X ) end),
	{ #pk_GS2U_BattleNotes {
		lsInfo = V_lsInfo,
		selfInfo = V_selfInfo
		},
	Bin2 };

%GENERATED from file:arena.h => GS2U_BattleStartSec
readNetMsg(?CMD_GS2U_BattleStartSec,Bin0) ->
	{ V_second, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_BattleStartSec {
		second = V_second
		},
	Bin1 };

%GENERATED from file:arena.h => GS2U_Ladder1v1BattleEnd
readNetMsg(?CMD_GS2U_Ladder1v1BattleEnd,Bin0) ->
	{ V_result, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_exploit, Bin2 } = binary_read_uint( Bin1 ),
	{ V_rank, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GS2U_Ladder1v1BattleEnd {
		result = V_result,
		exploit = V_exploit,
		rank = V_rank
		},
	Bin3 };

%GENERATED from file:arena.h => GS2U_LadderTargetList
readNetMsg(?CMD_GS2U_LadderTargetList,Bin0) ->
	{ V_targets, Bin1 } = binary_read_array(Bin0, fun(X) -> readLadderTargetInfo( X ) end),
	{ V_selfInfo, Bin2 } = readSelfBattleInfo( Bin1 ),
	{ #pk_GS2U_LadderTargetList {
		targets = V_targets,
		selfInfo = V_selfInfo
		},
	Bin2 };

%GENERATED from file:arena.h => GS2U_PrepareSec
readNetMsg(?CMD_GS2U_PrepareSec,Bin0) ->
	{ V_second, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_GS2U_PrepareSec {
		second = V_second
		},
	Bin1 };

%GENERATED from file:arena.h => GS2U_ReturnKingList
readNetMsg(?CMD_GS2U_ReturnKingList,Bin0) ->
	{ V_kings, Bin1 } = binary_read_array(Bin0, fun(X) -> readKingRole( X ) end),
	{ #pk_GS2U_ReturnKingList {
		kings = V_kings
		},
	Bin1 };

%GENERATED from file:arena.h => U2GS_ChallengeTargetByRank
readNetMsg(?CMD_U2GS_ChallengeTargetByRank,Bin0) ->
	{ V_ranksort, Bin1 } = binary_read_uint( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_U2GS_ChallengeTargetByRank {
		ranksort = V_ranksort,
		name = V_name
		},
	Bin2 };

%GENERATED from file:arena.h => U2GS_ChallengeTargetByRoleID
readNetMsg(?CMD_U2GS_ChallengeTargetByRoleID,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_ChallengeTargetByRoleID {
		roleID = V_roleID
		},
	Bin1 };

%GENERATED from file:arena.h => U2GS_FreshLadderTargetList
readNetMsg(?CMD_U2GS_FreshLadderTargetList,Bin0) ->
	{ #pk_U2GS_FreshLadderTargetList {

		},
	Bin0 };

%GENERATED from file:arena.h => U2GS_GiveUpChallenge
readNetMsg(?CMD_U2GS_GiveUpChallenge,Bin0) ->
	{ #pk_U2GS_GiveUpChallenge {

		},
	Bin0 };

%GENERATED from file:arena.h => U2GS_OpenLadder1v1
readNetMsg(?CMD_U2GS_OpenLadder1v1,Bin0) ->
	{ #pk_U2GS_OpenLadder1v1 {

		},
	Bin0 };

%GENERATED from file:arena.h => U2GS_RequestBattleNotes
readNetMsg(?CMD_U2GS_RequestBattleNotes,Bin0) ->
	{ #pk_U2GS_RequestBattleNotes {

		},
	Bin0 };

%GENERATED from file:arena.h => U2GS_RequestKingList
readNetMsg(?CMD_U2GS_RequestKingList,Bin0) ->
	{ #pk_U2GS_RequestKingList {

		},
	Bin0 };

%GENERATED from file:arena.h => U2GS_RequestPlayerInfo
readNetMsg(?CMD_U2GS_RequestPlayerInfo,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_RequestPlayerInfo {
		roleID = V_roleID
		},
	Bin1 };

%GENERATED from file:arena.h => U2GS_WorshipTarget
readNetMsg(?CMD_U2GS_WorshipTarget,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleName, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_U2GS_WorshipTarget {
		roleID = V_roleID,
		roleName = V_roleName
		},
	Bin2 };

%GENERATED from file:bag.h => DelImpression
readNetMsg(?CMD_DelImpression,Bin0) ->
	{ V_uid, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_DelImpression {
		uid = V_uid
		},
	Bin1 };

%GENERATED from file:bag.h => DelTag
readNetMsg(?CMD_DelTag,Bin0) ->
	{ V_index, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_DelTag {
		index = V_index
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_AddEquipItemToBag
readNetMsg(?CMD_GS2U_AddEquipItemToBag,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_code, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_items, Bin3 } = binary_read_array(Bin2, fun(X) -> readEquipItemInfo( X ) end),
	{ #pk_GS2U_AddEquipItemToBag {
		type = V_type,
		code = V_code,
		items = V_items
		},
	Bin3 };

%GENERATED from file:bag.h => GS2U_AddImpressionResult
readNetMsg(?CMD_GS2U_AddImpressionResult,Bin0) ->
	{ V_result, Bin1 } = binary_read_bool( Bin0 ),
	{ #pk_GS2U_AddImpressionResult {
		result = V_result
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_AddNormalItemToBag
readNetMsg(?CMD_GS2U_AddNormalItemToBag,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_code, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_addNum, Bin3 } = binary_read_uint( Bin2 ),
	{ V_items, Bin4 } = binary_read_array(Bin3, fun(X) -> readNormalItemInfo( X ) end),
	{ #pk_GS2U_AddNormalItemToBag {
		type = V_type,
		code = V_code,
		addNum = V_addNum,
		items = V_items
		},
	Bin4 };

%GENERATED from file:bag.h => GS2U_AddPraise
readNetMsg(?CMD_GS2U_AddPraise,Bin0) ->
	{ #pk_GS2U_AddPraise {

		},
	Bin0 };

%GENERATED from file:bag.h => GS2U_AddTagResult
readNetMsg(?CMD_GS2U_AddTagResult,Bin0) ->
	{ V_result, Bin1 } = binary_read_bool( Bin0 ),
	{ #pk_GS2U_AddTagResult {
		result = V_result
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_DeleteGoods
readNetMsg(?CMD_GS2U_DeleteGoods,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_goodsUIDs, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_GS2U_DeleteGoods {
		type = V_type,
		goodsUIDs = V_goodsUIDs
		},
	Bin2 };

%GENERATED from file:bag.h => GS2U_EquipEnhancedProp
readNetMsg(?CMD_GS2U_EquipEnhancedProp,Bin0) ->
	{ V_equipUID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_enProps, Bin2 } = binary_read_array(Bin1, fun(X) -> readEquipEnhancedProp( X ) end),
	{ V_price, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GS2U_EquipEnhancedProp {
		equipUID = V_equipUID,
		enProps = V_enProps,
		price = V_price
		},
	Bin3 };

%GENERATED from file:bag.h => GS2U_EquipGemInfoUpdate
readNetMsg(?CMD_GS2U_EquipGemInfoUpdate,Bin0) ->
	{ V_equipGemInfo, Bin1 } = readEquipGemInfo( Bin0 ),
	{ #pk_GS2U_EquipGemInfoUpdate {
		equipGemInfo = V_equipGemInfo
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_EquipGemInfos
readNetMsg(?CMD_GS2U_EquipGemInfos,Bin0) ->
	{ V_equipGemInfos, Bin1 } = binary_read_array(Bin0, fun(X) -> readEquipGemInfo( X ) end),
	{ #pk_GS2U_EquipGemInfos {
		equipGemInfos = V_equipGemInfos
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_EquipRecastInfo
readNetMsg(?CMD_GS2U_EquipRecastInfo,Bin0) ->
	{ V_recastInfo, Bin1 } = readRecastPosInfo( Bin0 ),
	{ #pk_GS2U_EquipRecastInfo {
		recastInfo = V_recastInfo
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_EquipRecastInfoInit
readNetMsg(?CMD_GS2U_EquipRecastInfoInit,Bin0) ->
	{ V_recastInfoList, Bin1 } = binary_read_array(Bin0, fun(X) -> readRecastPosInfo( X ) end),
	{ #pk_GS2U_EquipRecastInfoInit {
		recastInfoList = V_recastInfoList
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_EquipRecastProp
readNetMsg(?CMD_GS2U_EquipRecastProp,Bin0) ->
	{ V_equipPos, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_recastVal, Bin2 } = binary_read_uint( Bin1 ),
	{ V_recastType, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_resultList, Bin4 } = binary_read_array(Bin3, fun(X) -> readRecastResultInfo( X ) end),
	{ #pk_GS2U_EquipRecastProp {
		equipPos = V_equipPos,
		recastVal = V_recastVal,
		recastType = V_recastType,
		resultList = V_resultList
		},
	Bin4 };

%GENERATED from file:bag.h => GS2U_EquipRefineLevel
readNetMsg(?CMD_GS2U_EquipRefineLevel,Bin0) ->
	{ V_equipRefines, Bin1 } = binary_read_array(Bin0, fun(X) -> readEquipRefineLevel( X ) end),
	{ #pk_GS2U_EquipRefineLevel {
		equipRefines = V_equipRefines
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_EquipRefineResult
readNetMsg(?CMD_GS2U_EquipRefineResult,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_type, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_level, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_GS2U_EquipRefineResult {
		code = V_code,
		type = V_type,
		level = V_level
		},
	Bin3 };

%GENERATED from file:bag.h => GS2U_EquipRefineResultOneKey
readNetMsg(?CMD_GS2U_EquipRefineResultOneKey,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_levelOld, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_levelNew, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_typeList, Bin4 } = binary_read_array(Bin3, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_GS2U_EquipRefineResultOneKey {
		code = V_code,
		levelOld = V_levelOld,
		levelNew = V_levelNew,
		typeList = V_typeList
		},
	Bin4 };

%GENERATED from file:bag.h => GS2U_EquipUpStarInfoList
readNetMsg(?CMD_GS2U_EquipUpStarInfoList,Bin0) ->
	{ V_equipUpStars, Bin1 } = binary_read_array(Bin0, fun(X) -> readEquipUpStarInfo( X ) end),
	{ #pk_GS2U_EquipUpStarInfoList {
		equipUpStars = V_equipUpStars
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_EquipUpStarRes
readNetMsg(?CMD_GS2U_EquipUpStarRes,Bin0) ->
	{ V_equipUpStarInfo, Bin1 } = readEquipUpStarInfo( Bin0 ),
	{ V_type, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_index, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_costList, Bin4 } = binary_read_array(Bin3, fun(X) -> readstarCostItem( X ) end),
	{ V_coin, Bin5 } = binary_read_uint( Bin4 ),
	{ V_res, Bin6 } = binary_read_uint8( Bin5 ),
	{ #pk_GS2U_EquipUpStarRes {
		equipUpStarInfo = V_equipUpStarInfo,
		type = V_type,
		index = V_index,
		costList = V_costList,
		coin = V_coin,
		res = V_res
		},
	Bin6 };

%GENERATED from file:bag.h => GS2U_ExchangeResult
readNetMsg(?CMD_GS2U_ExchangeResult,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_itemCount, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_GS2U_ExchangeResult {
		id = V_id,
		itemCount = V_itemCount
		},
	Bin2 };

%GENERATED from file:bag.h => GS2U_Forbidden_Load_Photo
readNetMsg(?CMD_GS2U_Forbidden_Load_Photo,Bin0) ->
	{ V_forbiddenTime, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_GS2U_Forbidden_Load_Photo {
		forbiddenTime = V_forbiddenTime
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_GainPraise
readNetMsg(?CMD_GS2U_GainPraise,Bin0) ->
	{ #pk_GS2U_GainPraise {

		},
	Bin0 };

%GENERATED from file:bag.h => GS2U_GemEmbedAdd
readNetMsg(?CMD_GS2U_GemEmbedAdd,Bin0) ->
	{ V_gemEmbedInfo, Bin1 } = readGemEmbedInfo( Bin0 ),
	{ #pk_GS2U_GemEmbedAdd {
		gemEmbedInfo = V_gemEmbedInfo
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_GemEmbedDelete
readNetMsg(?CMD_GS2U_GemEmbedDelete,Bin0) ->
	{ V_gemUIDs, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_GS2U_GemEmbedDelete {
		gemUIDs = V_gemUIDs
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_GemEmbedInit
readNetMsg(?CMD_GS2U_GemEmbedInit,Bin0) ->
	{ V_gemEmbedInfos, Bin1 } = binary_read_array(Bin0, fun(X) -> readGemEmbedInfo( X ) end),
	{ #pk_GS2U_GemEmbedInit {
		gemEmbedInfos = V_gemEmbedInfos
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_GemEmbedMakeResult
readNetMsg(?CMD_GS2U_GemEmbedMakeResult,Bin0) ->
	{ V_gemUID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_GS2U_GemEmbedMakeResult {
		gemUID = V_gemUID
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_GetEssenceNum
readNetMsg(?CMD_GS2U_GetEssenceNum,Bin0) ->
	{ V_purpleEssence, Bin1 } = binary_read_uint( Bin0 ),
	{ V_goldenEssence, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_GetEssenceNum {
		purpleEssence = V_purpleEssence,
		goldenEssence = V_goldenEssence
		},
	Bin2 };

%GENERATED from file:bag.h => GS2U_InitEquip
readNetMsg(?CMD_GS2U_InitEquip,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_items, Bin2 } = binary_read_array(Bin1, fun(X) -> readEquipItemInfo( X ) end),
	{ #pk_GS2U_InitEquip {
		type = V_type,
		items = V_items
		},
	Bin2 };

%GENERATED from file:bag.h => GS2U_InitItem
readNetMsg(?CMD_GS2U_InitItem,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_items, Bin2 } = binary_read_array(Bin1, fun(X) -> readNormalItemInfo( X ) end),
	{ #pk_GS2U_InitItem {
		type = V_type,
		items = V_items
		},
	Bin2 };

%GENERATED from file:bag.h => GS2U_InitRecycle
readNetMsg(?CMD_GS2U_InitRecycle,Bin0) ->
	{ V_items, Bin1 } = binary_read_array(Bin0, fun(X) -> readRecycleItem( X ) end),
	{ V_equips, Bin2 } = binary_read_array(Bin1, fun(X) -> readRecycleEquip( X ) end),
	{ #pk_GS2U_InitRecycle {
		items = V_items,
		equips = V_equips
		},
	Bin2 };

%GENERATED from file:bag.h => GS2U_InitSlot
readNetMsg(?CMD_GS2U_InitSlot,Bin0) ->
	{ V_slots, Bin1 } = binary_read_array(Bin0, fun(X) -> readBagSlot( X ) end),
	{ #pk_GS2U_InitSlot {
		slots = V_slots
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_LockGoods
readNetMsg(?CMD_GS2U_LockGoods,Bin0) ->
	{ V_goodsUID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_bagType, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_isLocked, Bin3 } = binary_read_bool( Bin2 ),
	{ #pk_GS2U_LockGoods {
		goodsUID = V_goodsUID,
		bagType = V_bagType,
		isLocked = V_isLocked
		},
	Bin3 };

%GENERATED from file:bag.h => GS2U_LookRPInfo_Fashion
readNetMsg(?CMD_GS2U_LookRPInfo_Fashion,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_datas, Bin2 } = binary_read_array(Bin1, fun(X) -> readRPView_FashionInfo( X ) end),
	{ V_activeFashionSuitList, Bin3 } = binary_read_array(Bin2, fun(X) -> binary_read_uint( X ) end),
	{ #pk_GS2U_LookRPInfo_Fashion {
		roleID = V_roleID,
		datas = V_datas,
		activeFashionSuitList = V_activeFashionSuitList
		},
	Bin3 };

%GENERATED from file:bag.h => GS2U_LookRPInfo_Marriage
readNetMsg(?CMD_GS2U_LookRPInfo_Marriage,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_id, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_name, Bin3 } = binary_read_string( Bin2 ),
	{ V_sex, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_weddingDay, Bin5 } = binary_read_uint( Bin4 ),
	{ V_closeness, Bin6 } = binary_read_uint( Bin5 ),
	{ #pk_GS2U_LookRPInfo_Marriage {
		roleID = V_roleID,
		id = V_id,
		name = V_name,
		sex = V_sex,
		weddingDay = V_weddingDay,
		closeness = V_closeness
		},
	Bin6 };

%GENERATED from file:bag.h => GS2U_LookRPInfo_Pet
readNetMsg(?CMD_GS2U_LookRPInfo_Pet,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_petInfoList, Bin2 } = binary_read_array(Bin1, fun(X) -> readRPView_PetBaseInfo( X ) end),
	{ V_infoList, Bin3 } = binary_read_array(Bin2, fun(X) -> readRPView_AssistBattleInfo( X ) end),
	{ #pk_GS2U_LookRPInfo_Pet {
		roleID = V_roleID,
		petInfoList = V_petInfoList,
		infoList = V_infoList
		},
	Bin3 };

%GENERATED from file:bag.h => GS2U_LookRPInfo_Result
readNetMsg(?CMD_GS2U_LookRPInfo_Result,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleName, Bin2 } = binary_read_string( Bin1 ),
	{ V_career, Bin3 } = binary_read_uint( Bin2 ),
	{ V_race, Bin4 } = binary_read_int8( Bin3 ),
	{ V_sex, Bin5 } = binary_read_int8( Bin4 ),
	{ V_head, Bin6 } = binary_read_uint( Bin5 ),
	{ V_level, Bin7 } = binary_read_uint8( Bin6 ),
	{ V_roleForce, Bin8 } = binary_read_uint( Bin7 ),
	{ V_equipHonorLevel, Bin9 } = binary_read_uint8( Bin8 ),
	{ V_guildName, Bin10 } = binary_read_string( Bin9 ),
	{ V_playerKillValue, Bin11 } = binary_read_int( Bin10 ),
	{ V_wingLevel, Bin12 } = binary_read_int( Bin11 ),
	{ V_propValues, Bin13 } = binary_read_array(Bin12, fun(X) -> binary_read_float( X ) end),
	{ V_equips, Bin14 } = binary_read_array(Bin13, fun(X) -> readEquipItemInfo( X ) end),
	{ V_fashionList, Bin15 } = binary_read_array(Bin14, fun(X) -> binary_read_uint( X ) end),
	{ V_equipRefines, Bin16 } = binary_read_array(Bin15, fun(X) -> readEquipRefineLevel( X ) end),
	{ V_equipStar, Bin17 } = binary_read_array(Bin16, fun(X) -> readEquipStarLevel( X ) end),
	{ #pk_GS2U_LookRPInfo_Result {
		roleID = V_roleID,
		roleName = V_roleName,
		career = V_career,
		race = V_race,
		sex = V_sex,
		head = V_head,
		level = V_level,
		roleForce = V_roleForce,
		equipHonorLevel = V_equipHonorLevel,
		guildName = V_guildName,
		playerKillValue = V_playerKillValue,
		wingLevel = V_wingLevel,
		propValues = V_propValues,
		equips = V_equips,
		fashionList = V_fashionList,
		equipRefines = V_equipRefines,
		equipStar = V_equipStar
		},
	Bin17 };

%GENERATED from file:bag.h => GS2U_PlayerExtenInfo
readNetMsg(?CMD_GS2U_PlayerExtenInfo,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_GS2U_PlayerExtenInfo {
		type = V_type
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_QueryEquipResult
readNetMsg(?CMD_GS2U_QueryEquipResult,Bin0) ->
	{ V_equipInfo, Bin1 } = readEquipItemInfo( Bin0 ),
	{ #pk_GS2U_QueryEquipResult {
		equipInfo = V_equipInfo
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_QueryItemResult
readNetMsg(?CMD_GS2U_QueryItemResult,Bin0) ->
	{ V_itemInfo, Bin1 } = readNormalItemInfo( Bin0 ),
	{ #pk_GS2U_QueryItemResult {
		itemInfo = V_itemInfo
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_Report
readNetMsg(?CMD_GS2U_Report,Bin0) ->
	{ #pk_GS2U_Report {

		},
	Bin0 };

%GENERATED from file:bag.h => GS2U_Report_Max
readNetMsg(?CMD_GS2U_Report_Max,Bin0) ->
	{ #pk_GS2U_Report_Max {

		},
	Bin0 };

%GENERATED from file:bag.h => GS2U_RequesBuyIDAck
readNetMsg(?CMD_GS2U_RequesBuyIDAck,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_id, Bin2 } = binary_read_uint( Bin1 ),
	{ V_succ, Bin3 } = binary_read_bool( Bin2 ),
	{ #pk_GS2U_RequesBuyIDAck {
		type = V_type,
		id = V_id,
		succ = V_succ
		},
	Bin3 };

%GENERATED from file:bag.h => GS2U_RequestExchangeResourceForeverLimitIDAck
readNetMsg(?CMD_GS2U_RequestExchangeResourceForeverLimitIDAck,Bin0) ->
	{ V_iDList, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint16( X ) end),
	{ #pk_GS2U_RequestExchangeResourceForeverLimitIDAck {
		iDList = V_iDList
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_RequestForeverLimitIDAck
readNetMsg(?CMD_GS2U_RequestForeverLimitIDAck,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_iDList, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint16( X ) end),
	{ #pk_GS2U_RequestForeverLimitIDAck {
		type = V_type,
		iDList = V_iDList
		},
	Bin2 };

%GENERATED from file:bag.h => GS2U_ResourceExchangeList
readNetMsg(?CMD_GS2U_ResourceExchangeList,Bin0) ->
	{ V_resources, Bin1 } = binary_read_array(Bin0, fun(X) -> readExchangeResource( X ) end),
	{ #pk_GS2U_ResourceExchangeList {
		resources = V_resources
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_UpLoadingPhotoResult
readNetMsg(?CMD_GS2U_UpLoadingPhotoResult,Bin0) ->
	{ V_result, Bin1 } = binary_read_bool( Bin0 ),
	{ #pk_GS2U_UpLoadingPhotoResult {
		result = V_result
		},
	Bin1 };

%GENERATED from file:bag.h => GS2U_UpdateEquipItem
readNetMsg(?CMD_GS2U_UpdateEquipItem,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_operate, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_items, Bin3 } = binary_read_array(Bin2, fun(X) -> readEquipItemInfo( X ) end),
	{ #pk_GS2U_UpdateEquipItem {
		type = V_type,
		operate = V_operate,
		items = V_items
		},
	Bin3 };

%GENERATED from file:bag.h => GS2U_UpdateNormalItem
readNetMsg(?CMD_GS2U_UpdateNormalItem,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_items, Bin2 } = binary_read_array(Bin1, fun(X) -> readNormalItemInfo( X ) end),
	{ #pk_GS2U_UpdateNormalItem {
		type = V_type,
		items = V_items
		},
	Bin2 };

%GENERATED from file:bag.h => MoveGoods
readNetMsg(?CMD_MoveGoods,Bin0) ->
	{ V_itemUID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_source, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_target, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_MoveGoods {
		itemUID = V_itemUID,
		source = V_source,
		target = V_target
		},
	Bin3 };

%GENERATED from file:bag.h => OpenNewBagSlot
readNetMsg(?CMD_OpenNewBagSlot,Bin0) ->
	{ V_bagType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_openNum, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_OpenNewBagSlot {
		bagType = V_bagType,
		openNum = V_openNum
		},
	Bin2 };

%GENERATED from file:bag.h => U2GS_AddImpression
readNetMsg(?CMD_U2GS_AddImpression,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_impression, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_U2GS_AddImpression {
		roleID = V_roleID,
		impression = V_impression
		},
	Bin2 };

%GENERATED from file:bag.h => U2GS_AddPraise
readNetMsg(?CMD_U2GS_AddPraise,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_AddPraise {
		roleID = V_roleID
		},
	Bin1 };

%GENERATED from file:bag.h => U2GS_AddTag
readNetMsg(?CMD_U2GS_AddTag,Bin0) ->
	{ V_tag, Bin1 } = binary_read_string( Bin0 ),
	{ #pk_U2GS_AddTag {
		tag = V_tag
		},
	Bin1 };

%GENERATED from file:bag.h => U2GS_EquipEnhanced
readNetMsg(?CMD_U2GS_EquipEnhanced,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_equipUID, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_U2GS_EquipEnhanced {
		type = V_type,
		equipUID = V_equipUID
		},
	Bin2 };

%GENERATED from file:bag.h => U2GS_EquipRecast
readNetMsg(?CMD_U2GS_EquipRecast,Bin0) ->
	{ V_equipPos, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_recastType, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_opType, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_locklist, Bin4 } = binary_read_array(Bin3, fun(X) -> binary_read_uint16( X ) end),
	{ #pk_U2GS_EquipRecast {
		equipPos = V_equipPos,
		recastType = V_recastType,
		opType = V_opType,
		locklist = V_locklist
		},
	Bin4 };

%GENERATED from file:bag.h => U2GS_EquipRefine
readNetMsg(?CMD_U2GS_EquipRefine,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_EquipRefine {
		type = V_type
		},
	Bin1 };

%GENERATED from file:bag.h => U2GS_EquipRefineOneKey
readNetMsg(?CMD_U2GS_EquipRefineOneKey,Bin0) ->
	{ #pk_U2GS_EquipRefineOneKey {

		},
	Bin0 };

%GENERATED from file:bag.h => U2GS_EquipResolve
readNetMsg(?CMD_U2GS_EquipResolve,Bin0) ->
	{ V_equipUIDs, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_U2GS_EquipResolve {
		equipUIDs = V_equipUIDs
		},
	Bin1 };

%GENERATED from file:bag.h => U2GS_EquipUpStar
readNetMsg(?CMD_U2GS_EquipUpStar,Bin0) ->
	{ V_pos, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_type, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_EquipUpStar {
		pos = V_pos,
		type = V_type
		},
	Bin2 };

%GENERATED from file:bag.h => U2GS_EquipUpStarOneKey
readNetMsg(?CMD_U2GS_EquipUpStarOneKey,Bin0) ->
	{ #pk_U2GS_EquipUpStarOneKey {

		},
	Bin0 };

%GENERATED from file:bag.h => U2GS_GemEmbedMake
readNetMsg(?CMD_U2GS_GemEmbedMake,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_count, Bin2 } = binary_read_uint( Bin1 ),
	{ V_flag, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_U2GS_GemEmbedMake {
		id = V_id,
		count = V_count,
		flag = V_flag
		},
	Bin3 };

%GENERATED from file:bag.h => U2GS_GemEmbedMakeOnce
readNetMsg(?CMD_U2GS_GemEmbedMakeOnce,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_bindCount, Bin2 } = binary_read_uint( Bin1 ),
	{ V_unBindCount, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_U2GS_GemEmbedMakeOnce {
		id = V_id,
		bindCount = V_bindCount,
		unBindCount = V_unBindCount
		},
	Bin3 };

%GENERATED from file:bag.h => U2GS_GemEmbedOff
readNetMsg(?CMD_U2GS_GemEmbedOff,Bin0) ->
	{ V_gemUIDs, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_U2GS_GemEmbedOff {
		gemUIDs = V_gemUIDs
		},
	Bin1 };

%GENERATED from file:bag.h => U2GS_GemEmbedOn
readNetMsg(?CMD_U2GS_GemEmbedOn,Bin0) ->
	{ V_gemEmbedInfoList, Bin1 } = binary_read_array(Bin0, fun(X) -> readGemEmbedInfo( X ) end),
	{ #pk_U2GS_GemEmbedOn {
		gemEmbedInfoList = V_gemEmbedInfoList
		},
	Bin1 };

%GENERATED from file:bag.h => U2GS_GemOperate
readNetMsg(?CMD_U2GS_GemOperate,Bin0) ->
	{ V_opType, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_equipPos, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_gemPos, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_params, Bin4 } = binary_read_uint64( Bin3 ),
	{ #pk_U2GS_GemOperate {
		opType = V_opType,
		equipPos = V_equipPos,
		gemPos = V_gemPos,
		params = V_params
		},
	Bin4 };

%GENERATED from file:bag.h => U2GS_HonorLevel
readNetMsg(?CMD_U2GS_HonorLevel,Bin0) ->
	{ #pk_U2GS_HonorLevel {

		},
	Bin0 };

%GENERATED from file:bag.h => U2GS_LockGoods
readNetMsg(?CMD_U2GS_LockGoods,Bin0) ->
	{ V_goodsUID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_bagType, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_LockGoods {
		goodsUID = V_goodsUID,
		bagType = V_bagType
		},
	Bin2 };

%GENERATED from file:bag.h => U2GS_LookRPInfo_Request
readNetMsg(?CMD_U2GS_LookRPInfo_Request,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_view_type, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_LookRPInfo_Request {
		roleID = V_roleID,
		view_type = V_view_type
		},
	Bin2 };

%GENERATED from file:bag.h => U2GS_PlayerExtenInfo
readNetMsg(?CMD_U2GS_PlayerExtenInfo,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_info, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_U2GS_PlayerExtenInfo {
		type = V_type,
		info = V_info
		},
	Bin2 };

%GENERATED from file:bag.h => U2GS_QueryEquipByUID
readNetMsg(?CMD_U2GS_QueryEquipByUID,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_equipUID, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_U2GS_QueryEquipByUID {
		roleID = V_roleID,
		equipUID = V_equipUID
		},
	Bin2 };

%GENERATED from file:bag.h => U2GS_Report
readNetMsg(?CMD_U2GS_Report,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_Report {
		roleID = V_roleID
		},
	Bin1 };

%GENERATED from file:bag.h => U2GS_RequesBuyID
readNetMsg(?CMD_U2GS_RequesBuyID,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_id, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_RequesBuyID {
		type = V_type,
		id = V_id
		},
	Bin2 };

%GENERATED from file:bag.h => U2GS_RequesForeverLimitID
readNetMsg(?CMD_U2GS_RequesForeverLimitID,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_RequesForeverLimitID {
		type = V_type
		},
	Bin1 };

%GENERATED from file:bag.h => U2GS_RequestExchangeResource
readNetMsg(?CMD_U2GS_RequestExchangeResource,Bin0) ->
	{ #pk_U2GS_RequestExchangeResource {

		},
	Bin0 };

%GENERATED from file:bag.h => U2GS_RequestExchangeResourceForeverLimitID
readNetMsg(?CMD_U2GS_RequestExchangeResourceForeverLimitID,Bin0) ->
	{ #pk_U2GS_RequestExchangeResourceForeverLimitID {

		},
	Bin0 };

%GENERATED from file:bag.h => U2GS_ResourceExchange
readNetMsg(?CMD_U2GS_ResourceExchange,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_itemCount, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_opType, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_U2GS_ResourceExchange {
		id = V_id,
		itemCount = V_itemCount,
		opType = V_opType
		},
	Bin3 };

%GENERATED from file:bag.h => U2GS_SellAllEquip
readNetMsg(?CMD_U2GS_SellAllEquip,Bin0) ->
	{ #pk_U2GS_SellAllEquip {

		},
	Bin0 };

%GENERATED from file:bag.h => U2GS_SharedEquip
readNetMsg(?CMD_U2GS_SharedEquip,Bin0) ->
	{ V_equipUIDs, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_U2GS_SharedEquip {
		equipUIDs = V_equipUIDs
		},
	Bin1 };

%GENERATED from file:bag.h => U2GS_SortItem
readNetMsg(?CMD_U2GS_SortItem,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_SortItem {
		type = V_type
		},
	Bin1 };

%GENERATED from file:bag.h => U2GS_UseItem
readNetMsg(?CMD_U2GS_UseItem,Bin0) ->
	{ V_itemUID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_useNum, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_U2GS_UseItem {
		itemUID = V_itemUID,
		useNum = V_useNum
		},
	Bin2 };

%GENERATED from file:bag.h => UpLoadingPhoto
readNetMsg(?CMD_UpLoadingPhoto,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_roleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_sectionNum, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_sectionIndex, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_data, Bin5 } = binary_read_array(Bin4, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_UpLoadingPhoto {
		type = V_type,
		roleID = V_roleID,
		sectionNum = V_sectionNum,
		sectionIndex = V_sectionIndex,
		data = V_data
		},
	Bin5 };

%GENERATED from file:battle.h => C2S_PlayerUseShiftSkill
readNetMsg(?CMD_C2S_PlayerUseShiftSkill,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_skillId, Bin2 } = binary_read_uint( Bin1 ),
	{ V_serial, Bin3 } = binary_read_uint( Bin2 ),
	{ V_targetCodeList, Bin4 } = binary_read_array(Bin3, fun(X) -> binary_read_uint64( X ) end),
	{ V_x, Bin5 } = binary_read_float( Bin4 ),
	{ V_y, Bin6 } = binary_read_float( Bin5 ),
	{ #pk_C2S_PlayerUseShiftSkill {
		code = V_code,
		skillId = V_skillId,
		serial = V_serial,
		targetCodeList = V_targetCodeList,
		x = V_x,
		y = V_y
		},
	Bin6 };

%GENERATED from file:battle.h => C2S_PlayerUseSkill
readNetMsg(?CMD_C2S_PlayerUseSkill,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_skillId, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_serial, Bin3 } = binary_read_uint( Bin2 ),
	{ V_targetCodeList, Bin4 } = binary_read_array(Bin3, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_C2S_PlayerUseSkill {
		code = V_code,
		skillId = V_skillId,
		serial = V_serial,
		targetCodeList = V_targetCodeList
		},
	Bin4 };

%GENERATED from file:battle.h => GS2U_AttackOffsetEffect
readNetMsg(?CMD_GS2U_AttackOffsetEffect,Bin0) ->
	{ V_userCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_targetCode, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_skillId, Bin3 } = binary_read_uint( Bin2 ),
	{ V_serial, Bin4 } = binary_read_uint( Bin3 ),
	{ V_code, Bin5 } = binary_read_uint64( Bin4 ),
	{ V_x, Bin6 } = binary_read_float( Bin5 ),
	{ V_y, Bin7 } = binary_read_float( Bin6 ),
	{ #pk_GS2U_AttackOffsetEffect {
		userCode = V_userCode,
		targetCode = V_targetCode,
		skillId = V_skillId,
		serial = V_serial,
		code = V_code,
		x = V_x,
		y = V_y
		},
	Bin7 };

%GENERATED from file:battle.h => GS2U_AttackResult
readNetMsg(?CMD_GS2U_AttackResult,Bin0) ->
	{ V_userCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_targetCode, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_skillId, Bin3 } = binary_read_uint( Bin2 ),
	{ V_serial, Bin4 } = binary_read_uint( Bin3 ),
	{ V_result, Bin5 } = binary_read_array(Bin4, fun(X) -> binary_read_uint( X ) end),
	{ V_bhp_per, Bin6 } = binary_read_uint8( Bin5 ),
	{ V_ahp_per, Bin7 } = binary_read_uint8( Bin6 ),
	{ V_diffHp, Bin8 } = binary_read_int( Bin7 ),
	{ V_damageHp, Bin9 } = binary_read_array(Bin8, fun(X) -> binary_read_int( X ) end),
	{ V_arList, Bin10 } = binary_read_array(Bin9, fun(X) -> readAttackResultList( X ) end),
	{ #pk_GS2U_AttackResult {
		userCode = V_userCode,
		targetCode = V_targetCode,
		skillId = V_skillId,
		serial = V_serial,
		result = V_result,
		bhp_per = V_bhp_per,
		ahp_per = V_ahp_per,
		diffHp = V_diffHp,
		damageHp = V_damageHp,
		arList = V_arList
		},
	Bin10 };

%GENERATED from file:battle.h => GS2U_AttackSpeed
readNetMsg(?CMD_GS2U_AttackSpeed,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_speed, Bin2 } = binary_read_float( Bin1 ),
	{ #pk_GS2U_AttackSpeed {
		code = V_code,
		speed = V_speed
		},
	Bin2 };

%GENERATED from file:battle.h => GS2U_BattleLearnRequest
readNetMsg(?CMD_GS2U_BattleLearnRequest,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_GS2U_BattleLearnRequest {
		code = V_code,
		name = V_name
		},
	Bin2 };

%GENERATED from file:battle.h => GS2U_BattleLearnResult
readNetMsg(?CMD_GS2U_BattleLearnResult,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_targetCode, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_name, Bin3 } = binary_read_string( Bin2 ),
	{ V_targetName, Bin4 } = binary_read_string( Bin3 ),
	{ V_result, Bin5 } = binary_read_uint8( Bin4 ),
	{ #pk_GS2U_BattleLearnResult {
		code = V_code,
		targetCode = V_targetCode,
		name = V_name,
		targetName = V_targetName,
		result = V_result
		},
	Bin5 };

%GENERATED from file:battle.h => GS2U_BreakSkill
readNetMsg(?CMD_GS2U_BreakSkill,Bin0) ->
	{ V_userCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_skillId, Bin2 } = binary_read_uint( Bin1 ),
	{ V_serial, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GS2U_BreakSkill {
		userCode = V_userCode,
		skillId = V_skillId,
		serial = V_serial
		},
	Bin3 };

%GENERATED from file:battle.h => GS2U_CallSkill
readNetMsg(?CMD_GS2U_CallSkill,Bin0) ->
	{ V_userCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_skillId, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_CallSkill {
		userCode = V_userCode,
		skillId = V_skillId
		},
	Bin2 };

%GENERATED from file:battle.h => GS2U_CarrierUseSkillToObject
readNetMsg(?CMD_GS2U_CarrierUseSkillToObject,Bin0) ->
	{ V_userCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_skillId, Bin2 } = binary_read_uint( Bin1 ),
	{ V_serial, Bin3 } = binary_read_uint( Bin2 ),
	{ V_targetCodeList, Bin4 } = binary_read_array(Bin3, fun(X) -> binary_read_uint64( X ) end),
	{ V_time, Bin5 } = binary_read_uint( Bin4 ),
	{ #pk_GS2U_CarrierUseSkillToObject {
		userCode = V_userCode,
		skillId = V_skillId,
		serial = V_serial,
		targetCodeList = V_targetCodeList,
		time = V_time
		},
	Bin5 };

%GENERATED from file:battle.h => GS2U_Dead
readNetMsg(?CMD_GS2U_Dead,Bin0) ->
	{ V_deadActorCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_killerCode, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_killerName, Bin3 } = binary_read_string( Bin2 ),
	{ V_skillID, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_GS2U_Dead {
		deadActorCode = V_deadActorCode,
		killerCode = V_killerCode,
		killerName = V_killerName,
		skillID = V_skillID
		},
	Bin4 };

%GENERATED from file:battle.h => GS2U_DeadToTeam
readNetMsg(?CMD_GS2U_DeadToTeam,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_killerCode, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_killerName, Bin3 } = binary_read_string( Bin2 ),
	{ #pk_GS2U_DeadToTeam {
		roleID = V_roleID,
		killerCode = V_killerCode,
		killerName = V_killerName
		},
	Bin3 };

%GENERATED from file:battle.h => GS2U_ForceDeadNow
readNetMsg(?CMD_GS2U_ForceDeadNow,Bin0) ->
	{ V_deadActorCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_killerCode, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_killerName, Bin3 } = binary_read_string( Bin2 ),
	{ V_skillID, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_GS2U_ForceDeadNow {
		deadActorCode = V_deadActorCode,
		killerCode = V_killerCode,
		killerName = V_killerName,
		skillID = V_skillID
		},
	Bin4 };

%GENERATED from file:battle.h => GS2U_IsTriggerCountDown
readNetMsg(?CMD_GS2U_IsTriggerCountDown,Bin0) ->
	{ V_flag, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_isTrigger, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_GS2U_IsTriggerCountDown {
		flag = V_flag,
		isTrigger = V_isTrigger
		},
	Bin2 };

%GENERATED from file:battle.h => GS2U_MonsterSpeed
readNetMsg(?CMD_GS2U_MonsterSpeed,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_speed, Bin2 } = binary_read_float( Bin1 ),
	{ V_moveStatus, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_GS2U_MonsterSpeed {
		code = V_code,
		speed = V_speed,
		moveStatus = V_moveStatus
		},
	Bin3 };

%GENERATED from file:battle.h => GS2U_ResponseBattleAck
readNetMsg(?CMD_GS2U_ResponseBattleAck,Bin0) ->
	{ #pk_GS2U_ResponseBattleAck {

		},
	Bin0 };

%GENERATED from file:battle.h => GS2U_ResponseChangePKMode
readNetMsg(?CMD_GS2U_ResponseChangePKMode,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_pkMode, Bin2 } = binary_read_int( Bin1 ),
	{ #pk_GS2U_ResponseChangePKMode {
		code = V_code,
		pkMode = V_pkMode
		},
	Bin2 };

%GENERATED from file:battle.h => GS2U_TriggerSkill
readNetMsg(?CMD_GS2U_TriggerSkill,Bin0) ->
	{ V_userCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_skillId, Bin2 } = binary_read_uint( Bin1 ),
	{ V_targetCode, Bin3 } = binary_read_uint64( Bin2 ),
	{ #pk_GS2U_TriggerSkill {
		userCode = V_userCode,
		skillId = V_skillId,
		targetCode = V_targetCode
		},
	Bin3 };

%GENERATED from file:battle.h => GS2U_TrunBattleInitList
readNetMsg(?CMD_GS2U_TrunBattleInitList,Bin0) ->
	{ V_il, Bin1 } = binary_read_array(Bin0, fun(X) -> readTurnBattleInit( X ) end),
	{ #pk_GS2U_TrunBattleInitList {
		il = V_il
		},
	Bin1 };

%GENERATED from file:battle.h => GS2U_TrunBattleResultList
readNetMsg(?CMD_GS2U_TrunBattleResultList,Bin0) ->
	{ V_rl, Bin1 } = binary_read_array(Bin0, fun(X) -> readTrunBattleResult( X ) end),
	{ #pk_GS2U_TrunBattleResultList {
		rl = V_rl
		},
	Bin1 };

%GENERATED from file:battle.h => GS2U_UseSkillToObject
readNetMsg(?CMD_GS2U_UseSkillToObject,Bin0) ->
	{ V_userCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_skillId, Bin2 } = binary_read_uint( Bin1 ),
	{ V_serial, Bin3 } = binary_read_uint( Bin2 ),
	{ V_targetCodeList, Bin4 } = binary_read_array(Bin3, fun(X) -> binary_read_uint64( X ) end),
	{ V_time, Bin5 } = binary_read_uint( Bin4 ),
	{ #pk_GS2U_UseSkillToObject {
		userCode = V_userCode,
		skillId = V_skillId,
		serial = V_serial,
		targetCodeList = V_targetCodeList,
		time = V_time
		},
	Bin5 };

%GENERATED from file:battle.h => GS2U_UseSkillToPos
readNetMsg(?CMD_GS2U_UseSkillToPos,Bin0) ->
	{ V_userCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_skillId, Bin2 } = binary_read_uint( Bin1 ),
	{ V_serial, Bin3 } = binary_read_uint( Bin2 ),
	{ V_targetCodeList, Bin4 } = binary_read_array(Bin3, fun(X) -> binary_read_uint64( X ) end),
	{ V_x, Bin5 } = binary_read_float( Bin4 ),
	{ V_y, Bin6 } = binary_read_float( Bin5 ),
	{ #pk_GS2U_UseSkillToPos {
		userCode = V_userCode,
		skillId = V_skillId,
		serial = V_serial,
		targetCodeList = V_targetCodeList,
		x = V_x,
		y = V_y
		},
	Bin6 };

%GENERATED from file:battle.h => U2GS_BattleLearn
readNetMsg(?CMD_U2GS_BattleLearn,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_BattleLearn {
		code = V_code
		},
	Bin1 };

%GENERATED from file:battle.h => U2GS_BattleLearnAck
readNetMsg(?CMD_U2GS_BattleLearnAck,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_result, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_BattleLearnAck {
		code = V_code,
		result = V_result
		},
	Bin2 };

%GENERATED from file:battle.h => U2GS_RequestBattleAck
readNetMsg(?CMD_U2GS_RequestBattleAck,Bin0) ->
	{ V_num, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_RequestBattleAck {
		num = V_num
		},
	Bin1 };

%GENERATED from file:battle.h => U2GS_RequestBattleEnd
readNetMsg(?CMD_U2GS_RequestBattleEnd,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_RequestBattleEnd {
		type = V_type
		},
	Bin1 };

%GENERATED from file:battle.h => U2GS_RequestChangePKMode
readNetMsg(?CMD_U2GS_RequestChangePKMode,Bin0) ->
	{ V_pkMode, Bin1 } = binary_read_int( Bin0 ),
	{ #pk_U2GS_RequestChangePKMode {
		pkMode = V_pkMode
		},
	Bin1 };

%GENERATED from file:buff.h => GS2U_BuffHurt
readNetMsg(?CMD_GS2U_BuffHurt,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_buffUID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_buffID, Bin3 } = binary_read_uint( Bin2 ),
	{ V_damageHp, Bin4 } = binary_read_int( Bin3 ),
	{ V_hp_per, Bin5 } = binary_read_uint8( Bin4 ),
	{ #pk_GS2U_BuffHurt {
		code = V_code,
		buffUID = V_buffUID,
		buffID = V_buffID,
		damageHp = V_damageHp,
		hp_per = V_hp_per
		},
	Bin5 };

%GENERATED from file:buff.h => GS2U_BuffInfo
readNetMsg(?CMD_GS2U_BuffInfo,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_buffUID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_buffID, Bin3 } = binary_read_uint( Bin2 ),
	{ V_skillID, Bin4 } = binary_read_uint( Bin3 ),
	{ V_level, Bin5 } = binary_read_uint( Bin4 ),
	{ V_flag, Bin6 } = binary_read_uint8( Bin5 ),
	{ V_serial, Bin7 } = binary_read_uint( Bin6 ),
	{ #pk_GS2U_BuffInfo {
		code = V_code,
		buffUID = V_buffUID,
		buffID = V_buffID,
		skillID = V_skillID,
		level = V_level,
		flag = V_flag,
		serial = V_serial
		},
	Bin7 };

%GENERATED from file:buff.h => U2GS_DelBuff
readNetMsg(?CMD_U2GS_DelBuff,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_buffID, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_DelBuff {
		code = V_code,
		buffID = V_buffID
		},
	Bin2 };

%GENERATED from file:companion.h => GS2U_InviteFriendToMe
readNetMsg(?CMD_GS2U_InviteFriendToMe,Bin0) ->
	{ V_inviteRoleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_inviteName, Bin2 } = binary_read_string( Bin1 ),
	{ V_mapID, Bin3 } = binary_read_uint( Bin2 ),
	{ V_x, Bin4 } = binary_read_float( Bin3 ),
	{ V_y, Bin5 } = binary_read_float( Bin4 ),
	{ #pk_GS2U_InviteFriendToMe {
		inviteRoleID = V_inviteRoleID,
		inviteName = V_inviteName,
		mapID = V_mapID,
		x = V_x,
		y = V_y
		},
	Bin5 };

%GENERATED from file:companion.h => GS2U_RecvInviteFriend
readNetMsg(?CMD_GS2U_RecvInviteFriend,Bin0) ->
	{ V_name, Bin1 } = binary_read_string( Bin0 ),
	{ V_companionID, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_RecvInviteFriend {
		name = V_name,
		companionID = V_companionID
		},
	Bin2 };

%GENERATED from file:companion.h => GS2U_RequestCompanion
readNetMsg(?CMD_GS2U_RequestCompanion,Bin0) ->
	{ V_members, Bin1 } = binary_read_array(Bin0, fun(X) -> readCompanionMember( X ) end),
	{ V_max_member, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_profileLevel, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_GS2U_RequestCompanion {
		members = V_members,
		max_member = V_max_member,
		profileLevel = V_profileLevel
		},
	Bin3 };

%GENERATED from file:companion.h => GS2U_ToTargetFriendAck
readNetMsg(?CMD_GS2U_ToTargetFriendAck,Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_x, Bin2 } = binary_read_float( Bin1 ),
	{ V_y, Bin3 } = binary_read_float( Bin2 ),
	{ #pk_GS2U_ToTargetFriendAck {
		mapID = V_mapID,
		x = V_x,
		y = V_y
		},
	Bin3 };

%GENERATED from file:companion.h => U2GS_AgreeInvite
readNetMsg(?CMD_U2GS_AgreeInvite,Bin0) ->
	{ V_companionID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_isAgree, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_U2GS_AgreeInvite {
		companionID = V_companionID,
		isAgree = V_isAgree
		},
	Bin2 };

%GENERATED from file:companion.h => U2GS_ChangePoseID
readNetMsg(?CMD_U2GS_ChangePoseID,Bin0) ->
	{ V_poseID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_ChangePoseID {
		poseID = V_poseID
		},
	Bin1 };

%GENERATED from file:companion.h => U2GS_CreateCompanion
readNetMsg(?CMD_U2GS_CreateCompanion,Bin0) ->
	{ #pk_U2GS_CreateCompanion {

		},
	Bin0 };

%GENERATED from file:companion.h => U2GS_ExitCompanion
readNetMsg(?CMD_U2GS_ExitCompanion,Bin0) ->
	{ #pk_U2GS_ExitCompanion {

		},
	Bin0 };

%GENERATED from file:companion.h => U2GS_InviteFriend
readNetMsg(?CMD_U2GS_InviteFriend,Bin0) ->
	{ V_target_roleid, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_InviteFriend {
		target_roleid = V_target_roleid
		},
	Bin1 };

%GENERATED from file:companion.h => U2GS_InviteToMe
readNetMsg(?CMD_U2GS_InviteToMe,Bin0) ->
	{ #pk_U2GS_InviteToMe {

		},
	Bin0 };

%GENERATED from file:companion.h => U2GS_KickCompanion
readNetMsg(?CMD_U2GS_KickCompanion,Bin0) ->
	{ V_target_roleid, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_KickCompanion {
		target_roleid = V_target_roleid
		},
	Bin1 };

%GENERATED from file:companion.h => U2GS_RequestCompanion
readNetMsg(?CMD_U2GS_RequestCompanion,Bin0) ->
	{ #pk_U2GS_RequestCompanion {

		},
	Bin0 };

%GENERATED from file:companion.h => U2GS_ToTargetFriend
readNetMsg(?CMD_U2GS_ToTargetFriend,Bin0) ->
	{ V_target_roleid, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_ToTargetFriend {
		target_roleid = V_target_roleid
		},
	Bin1 };

%GENERATED from file:companion.h => U2GS_ToTargetFriendResult
readNetMsg(?CMD_U2GS_ToTargetFriendResult,Bin0) ->
	{ V_inviteRoleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_comming, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_U2GS_ToTargetFriendResult {
		inviteRoleID = V_inviteRoleID,
		comming = V_comming
		},
	Bin2 };

%GENERATED from file:copy.h => ActiveGuildCopy
readNetMsg(?CMD_ActiveGuildCopy,Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_ActiveGuildCopy {
		mapID = V_mapID
		},
	Bin1 };

%GENERATED from file:copy.h => GS2U_BossBattleRankResult
readNetMsg(?CMD_GS2U_BossBattleRankResult,Bin0) ->
	{ V_curRankNum, Bin1 } = binary_read_uint( Bin0 ),
	{ V_rankList, Bin2 } = binary_read_array(Bin1, fun(X) -> readBossRankInfo( X ) end),
	{ #pk_GS2U_BossBattleRankResult {
		curRankNum = V_curRankNum,
		rankList = V_rankList
		},
	Bin2 };

%GENERATED from file:copy.h => GS2U_BossBattleState
readNetMsg(?CMD_GS2U_BossBattleState,Bin0) ->
	{ V_flag, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_mapID, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_BossBattleState {
		flag = V_flag,
		mapID = V_mapID
		},
	Bin2 };

%GENERATED from file:copy.h => GS2U_ChapterInfo
readNetMsg(?CMD_GS2U_ChapterInfo,Bin0) ->
	{ V_chapter, Bin1 } = readchapterInfo( Bin0 ),
	{ #pk_GS2U_ChapterInfo {
		chapter = V_chapter
		},
	Bin1 };

%GENERATED from file:copy.h => GS2U_CopyMapLeftTime
readNetMsg(?CMD_GS2U_CopyMapLeftTime,Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_leftTimeMs, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_CopyMapLeftTime {
		mapID = V_mapID,
		leftTimeMs = V_leftTimeMs
		},
	Bin2 };

%GENERATED from file:copy.h => GS2U_CopyMapSchedulePlayAnimation
readNetMsg(?CMD_GS2U_CopyMapSchedulePlayAnimation,Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_schedule, Bin2 } = binary_read_uint( Bin1 ),
	{ V_animationID, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GS2U_CopyMapSchedulePlayAnimation {
		mapID = V_mapID,
		schedule = V_schedule,
		animationID = V_animationID
		},
	Bin3 };

%GENERATED from file:copy.h => GS2U_CopyMapSchedulePlayCharacter
readNetMsg(?CMD_GS2U_CopyMapSchedulePlayCharacter,Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_schedule, Bin2 } = binary_read_uint( Bin1 ),
	{ V_characterIDs, Bin3 } = binary_read_array(Bin2, fun(X) -> binary_read_uint( X ) end),
	{ #pk_GS2U_CopyMapSchedulePlayCharacter {
		mapID = V_mapID,
		schedule = V_schedule,
		characterIDs = V_characterIDs
		},
	Bin3 };

%GENERATED from file:copy.h => GS2U_CopySpecialSchedule
readNetMsg(?CMD_GS2U_CopySpecialSchedule,Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_schedule, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_code, Bin3 } = binary_read_uint64( Bin2 ),
	{ #pk_GS2U_CopySpecialSchedule {
		mapID = V_mapID,
		schedule = V_schedule,
		code = V_code
		},
	Bin3 };

%GENERATED from file:copy.h => GS2U_IsGuildCopyOpen
readNetMsg(?CMD_GS2U_IsGuildCopyOpen,Bin0) ->
	{ V_flag, Bin1 } = binary_read_bool( Bin0 ),
	{ V_time, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_IsGuildCopyOpen {
		flag = V_flag,
		time = V_time
		},
	Bin2 };

%GENERATED from file:copy.h => GS2U_MaterialInfo
readNetMsg(?CMD_GS2U_MaterialInfo,Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_leftSeconds, Bin2 } = binary_read_uint( Bin1 ),
	{ V_chapter, Bin3 } = readchapterInfo( Bin2 ),
	{ V_towerList, Bin4 } = binary_read_array(Bin3, fun(X) -> readtowerInfo( X ) end),
	{ #pk_GS2U_MaterialInfo {
		mapID = V_mapID,
		leftSeconds = V_leftSeconds,
		chapter = V_chapter,
		towerList = V_towerList
		},
	Bin4 };

%GENERATED from file:copy.h => GS2U_MoneyDungeonInfo
readNetMsg(?CMD_GS2U_MoneyDungeonInfo,Bin0) ->
	{ V_leftSeconds, Bin1 } = binary_read_uint( Bin0 ),
	{ V_maxChapter, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_curChapter, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_listMonsterID, Bin4 } = binary_read_array(Bin3, fun(X) -> binary_read_uint16( X ) end),
	{ V_listMonsterCountMax, Bin5 } = binary_read_array(Bin4, fun(X) -> binary_read_uint8( X ) end),
	{ V_listMonsterCountKill, Bin6 } = binary_read_array(Bin5, fun(X) -> binary_read_uint8( X ) end),
	{ V_curLeftCount, Bin7 } = binary_read_uint8( Bin6 ),
	{ #pk_GS2U_MoneyDungeonInfo {
		leftSeconds = V_leftSeconds,
		maxChapter = V_maxChapter,
		curChapter = V_curChapter,
		listMonsterID = V_listMonsterID,
		listMonsterCountMax = V_listMonsterCountMax,
		listMonsterCountKill = V_listMonsterCountKill,
		curLeftCount = V_curLeftCount
		},
	Bin7 };

%GENERATED from file:copy.h => GS2U_SendGuildCopyOpenTime
readNetMsg(?CMD_GS2U_SendGuildCopyOpenTime,Bin0) ->
	{ V_time, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_GS2U_SendGuildCopyOpenTime {
		time = V_time
		},
	Bin1 };

%GENERATED from file:copy.h => GS2U_SpiritArea_Tick_Sync
readNetMsg(?CMD_GS2U_SpiritArea_Tick_Sync,Bin0) ->
	{ V_time, Bin1 } = binary_read_uint( Bin0 ),
	{ V_timeAll, Bin2 } = binary_read_uint( Bin1 ),
	{ V_wave, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_state, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_isAssist, Bin5 } = binary_read_bool( Bin4 ),
	{ #pk_GS2U_SpiritArea_Tick_Sync {
		time = V_time,
		timeAll = V_timeAll,
		wave = V_wave,
		state = V_state,
		isAssist = V_isAssist
		},
	Bin5 };

%GENERATED from file:copy.h => GS2U_SpiritArea_Wake_Sync
readNetMsg(?CMD_GS2U_SpiritArea_Wake_Sync,Bin0) ->
	{ V_skillID, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_SpiritArea_Wake_Sync {
		skillID = V_skillID
		},
	Bin1 };

%GENERATED from file:copy.h => GS2U_TowerInfo
readNetMsg(?CMD_GS2U_TowerInfo,Bin0) ->
	{ V_info, Bin1 } = readtowerInfo( Bin0 ),
	{ #pk_GS2U_TowerInfo {
		info = V_info
		},
	Bin1 };

%GENERATED from file:copy.h => U2GS2U_CopyMapScheduleShow2
readNetMsg(?CMD_U2GS2U_CopyMapScheduleShow2,Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_show2ID, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_groupID, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_scheduleID, Bin4 } = binary_read_uint( Bin3 ),
	{ V_isInit, Bin5 } = binary_read_bool( Bin4 ),
	{ #pk_U2GS2U_CopyMapScheduleShow2 {
		mapID = V_mapID,
		show2ID = V_show2ID,
		groupID = V_groupID,
		scheduleID = V_scheduleID,
		isInit = V_isInit
		},
	Bin5 };

%GENERATED from file:copy.h => U2GS_CopyMapSchedulePlayAnimationOver
readNetMsg(?CMD_U2GS_CopyMapSchedulePlayAnimationOver,Bin0) ->
	{ V_animationID, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_CopyMapSchedulePlayAnimationOver {
		animationID = V_animationID
		},
	Bin1 };

%GENERATED from file:copy.h => U2GS_CopyMapSchedulePlayCharacterOver
readNetMsg(?CMD_U2GS_CopyMapSchedulePlayCharacterOver,Bin0) ->
	{ V_schedule, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_CopyMapSchedulePlayCharacterOver {
		schedule = V_schedule
		},
	Bin1 };

%GENERATED from file:copy.h => U2GS_EnterBossBattle
readNetMsg(?CMD_U2GS_EnterBossBattle,Bin0) ->
	{ #pk_U2GS_EnterBossBattle {

		},
	Bin0 };

%GENERATED from file:copy.h => U2GS_EnterGuildCopy
readNetMsg(?CMD_U2GS_EnterGuildCopy,Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_EnterGuildCopy {
		mapID = V_mapID
		},
	Bin1 };

%GENERATED from file:copy.h => U2GS_GoonCopyMap
readNetMsg(?CMD_U2GS_GoonCopyMap,Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_GoonCopyMap {
		mapID = V_mapID
		},
	Bin1 };

%GENERATED from file:copy.h => U2GS_MoneyDungeonGiveup
readNetMsg(?CMD_U2GS_MoneyDungeonGiveup,Bin0) ->
	{ #pk_U2GS_MoneyDungeonGiveup {

		},
	Bin0 };

%GENERATED from file:copy.h => U2GS_MoneyDungeonNext
readNetMsg(?CMD_U2GS_MoneyDungeonNext,Bin0) ->
	{ #pk_U2GS_MoneyDungeonNext {

		},
	Bin0 };

%GENERATED from file:copy.h => U2GS_RequestAutoDeal
readNetMsg(?CMD_U2GS_RequestAutoDeal,Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_RequestAutoDeal {
		mapID = V_mapID
		},
	Bin1 };

%GENERATED from file:copy.h => U2GS_RequestMaterialInfo
readNetMsg(?CMD_U2GS_RequestMaterialInfo,Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_RequestMaterialInfo {
		mapID = V_mapID
		},
	Bin1 };

%GENERATED from file:copy.h => U2GS_UpTower
readNetMsg(?CMD_U2GS_UpTower,Bin0) ->
	{ V_dataID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_type, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_UpTower {
		dataID = V_dataID,
		type = V_type
		},
	Bin2 };

%GENERATED from file:copy.h => U2GS_startNextChapter
readNetMsg(?CMD_U2GS_startNextChapter,Bin0) ->
	{ #pk_U2GS_startNextChapter {

		},
	Bin0 };

%GENERATED from file:copy.h => UpdataHurtToBoss
readNetMsg(?CMD_UpdataHurtToBoss,Bin0) ->
	{ V_hurt, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_UpdataHurtToBoss {
		hurt = V_hurt
		},
	Bin1 };

%GENERATED from file:fashion.h => GS2U_ActiveFashionSuitList
readNetMsg(?CMD_GS2U_ActiveFashionSuitList,Bin0) ->
	{ V_activeFashionSuitList, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint( X ) end),
	{ #pk_GS2U_ActiveFashionSuitList {
		activeFashionSuitList = V_activeFashionSuitList
		},
	Bin1 };

%GENERATED from file:fashion.h => GS2U_FashionList
readNetMsg(?CMD_GS2U_FashionList,Bin0) ->
	{ V_datas, Bin1 } = binary_read_array(Bin0, fun(X) -> readFashionInfo( X ) end),
	{ #pk_GS2U_FashionList {
		datas = V_datas
		},
	Bin1 };

%GENERATED from file:fashion.h => GS2U_FashionResult
readNetMsg(?CMD_GS2U_FashionResult,Bin0) ->
	{ V_fashionID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_type, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_value, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GS2U_FashionResult {
		fashionID = V_fashionID,
		type = V_type,
		value = V_value
		},
	Bin3 };

%GENERATED from file:fashion.h => GS2U_FashionRoomLevelUp
readNetMsg(?CMD_GS2U_FashionRoomLevelUp,Bin0) ->
	{ V_roomLevel, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_FashionRoomLevelUp {
		roomLevel = V_roomLevel
		},
	Bin1 };

%GENERATED from file:fashion.h => U2GS_ActiveFashionSuit
readNetMsg(?CMD_U2GS_ActiveFashionSuit,Bin0) ->
	{ V_flag, Bin1 } = binary_read_bool( Bin0 ),
	{ V_fashionSuitID, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_ActiveFashionSuit {
		flag = V_flag,
		fashionSuitID = V_fashionSuitID
		},
	Bin2 };

%GENERATED from file:fashion.h => U2GS_BuyFashion
readNetMsg(?CMD_U2GS_BuyFashion,Bin0) ->
	{ V_fashionID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_time, Bin2 } = binary_read_uint( Bin1 ),
	{ V_type, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_U2GS_BuyFashion {
		fashionID = V_fashionID,
		time = V_time,
		type = V_type
		},
	Bin3 };

%GENERATED from file:fashion.h => U2GS_FashionRoomLevelUp
readNetMsg(?CMD_U2GS_FashionRoomLevelUp,Bin0) ->
	{ #pk_U2GS_FashionRoomLevelUp {

		},
	Bin0 };

%GENERATED from file:fashion.h => U2GS_IsDisplayFashion
readNetMsg(?CMD_U2GS_IsDisplayFashion,Bin0) ->
	{ V_flag, Bin1 } = binary_read_int8( Bin0 ),
	{ #pk_U2GS_IsDisplayFashion {
		flag = V_flag
		},
	Bin1 };

%GENERATED from file:fashion.h => U2GS_OperateFashion
readNetMsg(?CMD_U2GS_OperateFashion,Bin0) ->
	{ V_fashionID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_flag, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_U2GS_OperateFashion {
		fashionID = V_fashionID,
		flag = V_flag
		},
	Bin2 };

%GENERATED from file:friend.h => GS2U_Friend2AddFromBlack_Ask
readNetMsg(?CMD_GS2U_Friend2AddFromBlack_Ask,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_GS2U_Friend2AddFromBlack_Ask {
		id = V_id,
		name = V_name
		},
	Bin2 };

%GENERATED from file:friend.h => GS2U_Friend2ApplicantReset_Sync
readNetMsg(?CMD_GS2U_Friend2ApplicantReset_Sync,Bin0) ->
	{ V_count, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_page, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_listInfo, Bin3 } = binary_read_array(Bin2, fun(X) -> readFriend2InfoBase( X ) end),
	{ #pk_GS2U_Friend2ApplicantReset_Sync {
		count = V_count,
		page = V_page,
		listInfo = V_listInfo
		},
	Bin3 };

%GENERATED from file:friend.h => GS2U_Friend2BanFromFormal_Ask
readNetMsg(?CMD_GS2U_Friend2BanFromFormal_Ask,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_GS2U_Friend2BanFromFormal_Ask {
		id = V_id,
		name = V_name
		},
	Bin2 };

%GENERATED from file:friend.h => GS2U_Friend2BanWithUnbanAndDel_Ask
readNetMsg(?CMD_GS2U_Friend2BanWithUnbanAndDel_Ask,Bin0) ->
	{ V_idUnban, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_nameUnban, Bin2 } = binary_read_string( Bin1 ),
	{ V_idDel, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_nameDel, Bin4 } = binary_read_string( Bin3 ),
	{ #pk_GS2U_Friend2BanWithUnbanAndDel_Ask {
		idUnban = V_idUnban,
		nameUnban = V_nameUnban,
		idDel = V_idDel,
		nameDel = V_nameDel
		},
	Bin4 };

%GENERATED from file:friend.h => GS2U_Friend2BanWithUnban_Ask
readNetMsg(?CMD_GS2U_Friend2BanWithUnban_Ask,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_GS2U_Friend2BanWithUnban_Ask {
		id = V_id,
		name = V_name
		},
	Bin2 };

%GENERATED from file:friend.h => GS2U_Friend2BlackReset_Sync
readNetMsg(?CMD_GS2U_Friend2BlackReset_Sync,Bin0) ->
	{ V_count, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_page, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_listInfo, Bin3 } = binary_read_array(Bin2, fun(X) -> readFriend2InfoBase( X ) end),
	{ #pk_GS2U_Friend2BlackReset_Sync {
		count = V_count,
		page = V_page,
		listInfo = V_listInfo
		},
	Bin3 };

%GENERATED from file:friend.h => GS2U_Friend2ClosenessChange_Sync
readNetMsg(?CMD_GS2U_Friend2ClosenessChange_Sync,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_closeness, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_Friend2ClosenessChange_Sync {
		id = V_id,
		closeness = V_closeness
		},
	Bin2 };

%GENERATED from file:friend.h => GS2U_Friend2CrossAdd2Failed_Ack
readNetMsg(?CMD_GS2U_Friend2CrossAdd2Failed_Ack,Bin0) ->
	{ V_reason, Bin1 } = binary_read_uint( Bin0 ),
	{ V_listDel, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_GS2U_Friend2CrossAdd2Failed_Ack {
		reason = V_reason,
		listDel = V_listDel
		},
	Bin2 };

%GENERATED from file:friend.h => GS2U_Friend2CrossAdd2_Ack
readNetMsg(?CMD_GS2U_Friend2CrossAdd2_Ack,Bin0) ->
	{ V_info, Bin1 } = readFriend2InfoCross( Bin0 ),
	{ #pk_GS2U_Friend2CrossAdd2_Ack {
		info = V_info
		},
	Bin1 };

%GENERATED from file:friend.h => GS2U_Friend2CrossAdd_Sync
readNetMsg(?CMD_GS2U_Friend2CrossAdd_Sync,Bin0) ->
	{ V_info, Bin1 } = readFriend2InfoCross( Bin0 ),
	{ V_listDel, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_GS2U_Friend2CrossAdd_Sync {
		info = V_info,
		listDel = V_listDel
		},
	Bin2 };

%GENERATED from file:friend.h => GS2U_Friend2CrossAll_Sync
readNetMsg(?CMD_GS2U_Friend2CrossAll_Sync,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_listAll, Bin2 } = binary_read_array(Bin1, fun(X) -> readFriend2InfoCross( X ) end),
	{ #pk_GS2U_Friend2CrossAll_Sync {
		type = V_type,
		listAll = V_listAll
		},
	Bin2 };

%GENERATED from file:friend.h => GS2U_Friend2CrossDel_Ack
readNetMsg(?CMD_GS2U_Friend2CrossDel_Ack,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_isFix, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_GS2U_Friend2CrossDel_Ack {
		id = V_id,
		isFix = V_isFix
		},
	Bin2 };

%GENERATED from file:friend.h => GS2U_Friend2CrossInit_Sync
readNetMsg(?CMD_GS2U_Friend2CrossInit_Sync,Bin0) ->
	{ V_listCross, Bin1 } = binary_read_array(Bin0, fun(X) -> readFriend2InfoCross( X ) end),
	{ V_listApply, Bin2 } = binary_read_array(Bin1, fun(X) -> readFriend2InfoCross( X ) end),
	{ #pk_GS2U_Friend2CrossInit_Sync {
		listCross = V_listCross,
		listApply = V_listApply
		},
	Bin2 };

%GENERATED from file:friend.h => GS2U_Friend2ForLook_Ack
readNetMsg(?CMD_GS2U_Friend2ForLook_Ack,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ V_relation, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_like, Bin4 } = binary_read_uint( Bin3 ),
	{ V_isGiveLike, Bin5 } = binary_read_bool( Bin4 ),
	{ V_level, Bin6 } = binary_read_uint16( Bin5 ),
	{ V_charm, Bin7 } = binary_read_uint( Bin6 ),
	{ #pk_GS2U_Friend2ForLook_Ack {
		id = V_id,
		name = V_name,
		relation = V_relation,
		like = V_like,
		isGiveLike = V_isGiveLike,
		level = V_level,
		charm = V_charm
		},
	Bin7 };

%GENERATED from file:friend.h => GS2U_Friend2FormalChatVoice_AckR
readNetMsg(?CMD_GS2U_Friend2FormalChatVoice_AckR,Bin0) ->
	{ V_senderID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_receiverID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_time, Bin3 } = binary_read_uint( Bin2 ),
	{ V_duration, Bin4 } = binary_read_float( Bin3 ),
	{ V_count, Bin5 } = binary_read_uint8( Bin4 ),
	{ V_index, Bin6 } = binary_read_uint8( Bin5 ),
	{ V_data, Bin7 } = binary_read_array(Bin6, fun(X) -> binary_read_uint8( X ) end),
	{ V_relation, Bin8 } = binary_read_uint8( Bin7 ),
	{ #pk_GS2U_Friend2FormalChatVoice_AckR {
		senderID = V_senderID,
		receiverID = V_receiverID,
		time = V_time,
		duration = V_duration,
		count = V_count,
		index = V_index,
		data = V_data,
		relation = V_relation
		},
	Bin8 };

%GENERATED from file:friend.h => GS2U_Friend2FormalChatVoice_AckS
readNetMsg(?CMD_GS2U_Friend2FormalChatVoice_AckS,Bin0) ->
	{ V_senderID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_receiverID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_time, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GS2U_Friend2FormalChatVoice_AckS {
		senderID = V_senderID,
		receiverID = V_receiverID,
		time = V_time
		},
	Bin3 };

%GENERATED from file:friend.h => GS2U_Friend2FormalChat_Ack
readNetMsg(?CMD_GS2U_Friend2FormalChat_Ack,Bin0) ->
	{ V_senderID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_receiverID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_time, Bin3 } = binary_read_uint( Bin2 ),
	{ V_content, Bin4 } = binary_read_string( Bin3 ),
	{ V_relation, Bin5 } = binary_read_uint8( Bin4 ),
	{ #pk_GS2U_Friend2FormalChat_Ack {
		senderID = V_senderID,
		receiverID = V_receiverID,
		time = V_time,
		content = V_content,
		relation = V_relation
		},
	Bin5 };

%GENERATED from file:friend.h => GS2U_Friend2FormalForMarriage_Sync
readNetMsg(?CMD_GS2U_Friend2FormalForMarriage_Sync,Bin0) ->
	{ V_count, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_hasAP, Bin2 } = binary_read_bool( Bin1 ),
	{ V_page, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_listInfo, Bin4 } = binary_read_array(Bin3, fun(X) -> readFriend2InfoFormal( X ) end),
	{ #pk_GS2U_Friend2FormalForMarriage_Sync {
		count = V_count,
		hasAP = V_hasAP,
		page = V_page,
		listInfo = V_listInfo
		},
	Bin4 };

%GENERATED from file:friend.h => GS2U_Friend2FormalReset_Sync
readNetMsg(?CMD_GS2U_Friend2FormalReset_Sync,Bin0) ->
	{ V_count, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_hasAP, Bin2 } = binary_read_bool( Bin1 ),
	{ V_page, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_listInfo, Bin4 } = binary_read_array(Bin3, fun(X) -> readFriend2InfoFormal( X ) end),
	{ #pk_GS2U_Friend2FormalReset_Sync {
		count = V_count,
		hasAP = V_hasAP,
		page = V_page,
		listInfo = V_listInfo
		},
	Bin4 };

%GENERATED from file:friend.h => GS2U_Friend2MakeFormal_Sync
readNetMsg(?CMD_GS2U_Friend2MakeFormal_Sync,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_GS2U_Friend2MakeFormal_Sync {
		id = V_id
		},
	Bin1 };

%GENERATED from file:friend.h => GS2U_Friend2Recommend_Ack
readNetMsg(?CMD_GS2U_Friend2Recommend_Ack,Bin0) ->
	{ V_listInfo, Bin1 } = binary_read_array(Bin0, fun(X) -> readFriend2InfoBase( X ) end),
	{ #pk_GS2U_Friend2Recommend_Ack {
		listInfo = V_listInfo
		},
	Bin1 };

%GENERATED from file:friend.h => GS2U_Friend2Search_Ack
readNetMsg(?CMD_GS2U_Friend2Search_Ack,Bin0) ->
	{ V_listInfo, Bin1 } = binary_read_array(Bin0, fun(X) -> readFriend2InfoBase( X ) end),
	{ #pk_GS2U_Friend2Search_Ack {
		listInfo = V_listInfo
		},
	Bin1 };

%GENERATED from file:friend.h => GS2U_Friend2SimpleList_Ack
readNetMsg(?CMD_GS2U_Friend2SimpleList_Ack,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_count, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_index, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_listInfo, Bin4 } = binary_read_array(Bin3, fun(X) -> readFriend2InfoSimple( X ) end),
	{ #pk_GS2U_Friend2SimpleList_Ack {
		type = V_type,
		count = V_count,
		index = V_index,
		listInfo = V_listInfo
		},
	Bin4 };

%GENERATED from file:friend.h => GS2U_Friend2TempReset_Sync
readNetMsg(?CMD_GS2U_Friend2TempReset_Sync,Bin0) ->
	{ V_count, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_page, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_listInfo, Bin3 } = binary_read_array(Bin2, fun(X) -> readFriend2InfoBase( X ) end),
	{ #pk_GS2U_Friend2TempReset_Sync {
		count = V_count,
		page = V_page,
		listInfo = V_listInfo
		},
	Bin3 };

%GENERATED from file:friend.h => GS2U_Friend2WantChat_Ack
readNetMsg(?CMD_GS2U_Friend2WantChat_Ack,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_info, Bin2 } = readFriend2InfoBase( Bin1 ),
	{ V_relation, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_count, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_hasAP, Bin5 } = binary_read_bool( Bin4 ),
	{ V_page, Bin6 } = binary_read_uint8( Bin5 ),
	{ V_listInfo, Bin7 } = binary_read_array(Bin6, fun(X) -> readFriend2InfoFormal( X ) end),
	{ #pk_GS2U_Friend2WantChat_Ack {
		id = V_id,
		info = V_info,
		relation = V_relation,
		count = V_count,
		hasAP = V_hasAP,
		page = V_page,
		listInfo = V_listInfo
		},
	Bin7 };

%GENERATED from file:friend.h => GS2u_Friend2Like_Ack
readNetMsg(?CMD_GS2u_Friend2Like_Ack,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ V_like, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GS2u_Friend2Like_Ack {
		id = V_id,
		name = V_name,
		like = V_like
		},
	Bin3 };

%GENERATED from file:friend.h => U2GS_Friend2AddFromBlack_Reply
readNetMsg(?CMD_U2GS_Friend2AddFromBlack_Reply,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_isAgreed, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_U2GS_Friend2AddFromBlack_Reply {
		id = V_id,
		isAgreed = V_isAgreed
		},
	Bin2 };

%GENERATED from file:friend.h => U2GS_Friend2Add_Request
readNetMsg(?CMD_U2GS_Friend2Add_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_Friend2Add_Request {
		id = V_id
		},
	Bin1 };

%GENERATED from file:friend.h => U2GS_Friend2ApplicantUseOneKey_Request
readNetMsg(?CMD_U2GS_Friend2ApplicantUseOneKey_Request,Bin0) ->
	{ V_isAgreed, Bin1 } = binary_read_bool( Bin0 ),
	{ #pk_U2GS_Friend2ApplicantUseOneKey_Request {
		isAgreed = V_isAgreed
		},
	Bin1 };

%GENERATED from file:friend.h => U2GS_Friend2ApplicantUse_Request
readNetMsg(?CMD_U2GS_Friend2ApplicantUse_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_isAgreed, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_U2GS_Friend2ApplicantUse_Request {
		id = V_id,
		isAgreed = V_isAgreed
		},
	Bin2 };

%GENERATED from file:friend.h => U2GS_Friend2Applicant_Request
readNetMsg(?CMD_U2GS_Friend2Applicant_Request,Bin0) ->
	{ V_page, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_Friend2Applicant_Request {
		page = V_page
		},
	Bin1 };

%GENERATED from file:friend.h => U2GS_Friend2BanWithDel_Reply
readNetMsg(?CMD_U2GS_Friend2BanWithDel_Reply,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_isAgreed, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_U2GS_Friend2BanWithDel_Reply {
		id = V_id,
		isAgreed = V_isAgreed
		},
	Bin2 };

%GENERATED from file:friend.h => U2GS_Friend2BanWithUnbanAndDel_Reply
readNetMsg(?CMD_U2GS_Friend2BanWithUnbanAndDel_Reply,Bin0) ->
	{ V_idUnban, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_idDel, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_isAgreed, Bin3 } = binary_read_bool( Bin2 ),
	{ #pk_U2GS_Friend2BanWithUnbanAndDel_Reply {
		idUnban = V_idUnban,
		idDel = V_idDel,
		isAgreed = V_isAgreed
		},
	Bin3 };

%GENERATED from file:friend.h => U2GS_Friend2BanWithUnban_Reply
readNetMsg(?CMD_U2GS_Friend2BanWithUnban_Reply,Bin0) ->
	{ V_idUnban, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_idBan, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_isAgreed, Bin3 } = binary_read_bool( Bin2 ),
	{ #pk_U2GS_Friend2BanWithUnban_Reply {
		idUnban = V_idUnban,
		idBan = V_idBan,
		isAgreed = V_isAgreed
		},
	Bin3 };

%GENERATED from file:friend.h => U2GS_Friend2Ban_Request
readNetMsg(?CMD_U2GS_Friend2Ban_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_Friend2Ban_Request {
		id = V_id
		},
	Bin1 };

%GENERATED from file:friend.h => U2GS_Friend2Black_Request
readNetMsg(?CMD_U2GS_Friend2Black_Request,Bin0) ->
	{ V_page, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_Friend2Black_Request {
		page = V_page
		},
	Bin1 };

%GENERATED from file:friend.h => U2GS_Friend2CrossAdd2_Request
readNetMsg(?CMD_U2GS_Friend2CrossAdd2_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_isAgreed, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_U2GS_Friend2CrossAdd2_Request {
		id = V_id,
		isAgreed = V_isAgreed
		},
	Bin2 };

%GENERATED from file:friend.h => U2GS_Friend2CrossAdd_Request
readNetMsg(?CMD_U2GS_Friend2CrossAdd_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_Friend2CrossAdd_Request {
		id = V_id
		},
	Bin1 };

%GENERATED from file:friend.h => U2GS_Friend2CrossAll_Request
readNetMsg(?CMD_U2GS_Friend2CrossAll_Request,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_Friend2CrossAll_Request {
		type = V_type
		},
	Bin1 };

%GENERATED from file:friend.h => U2GS_Friend2CrossDel_Request
readNetMsg(?CMD_U2GS_Friend2CrossDel_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_Friend2CrossDel_Request {
		id = V_id
		},
	Bin1 };

%GENERATED from file:friend.h => U2GS_Friend2Del_Request
readNetMsg(?CMD_U2GS_Friend2Del_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_Friend2Del_Request {
		id = V_id
		},
	Bin1 };

%GENERATED from file:friend.h => U2GS_Friend2ForLook_Request
readNetMsg(?CMD_U2GS_Friend2ForLook_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_Friend2ForLook_Request {
		id = V_id
		},
	Bin1 };

%GENERATED from file:friend.h => U2GS_Friend2FormalChatVoice_Request
readNetMsg(?CMD_U2GS_Friend2FormalChatVoice_Request,Bin0) ->
	{ V_receiverID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_time, Bin2 } = binary_read_uint( Bin1 ),
	{ V_duration, Bin3 } = binary_read_float( Bin2 ),
	{ V_count, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_index, Bin5 } = binary_read_uint8( Bin4 ),
	{ V_data, Bin6 } = binary_read_array(Bin5, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_U2GS_Friend2FormalChatVoice_Request {
		receiverID = V_receiverID,
		time = V_time,
		duration = V_duration,
		count = V_count,
		index = V_index,
		data = V_data
		},
	Bin6 };

%GENERATED from file:friend.h => U2GS_Friend2FormalChat_Request
readNetMsg(?CMD_U2GS_Friend2FormalChat_Request,Bin0) ->
	{ V_receiverID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_content, Bin2 } = binary_read_string( Bin1 ),
	{ V_time, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_U2GS_Friend2FormalChat_Request {
		receiverID = V_receiverID,
		content = V_content,
		time = V_time
		},
	Bin3 };

%GENERATED from file:friend.h => U2GS_Friend2FormalForMarriage_Request
readNetMsg(?CMD_U2GS_Friend2FormalForMarriage_Request,Bin0) ->
	{ V_page, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_Friend2FormalForMarriage_Request {
		page = V_page
		},
	Bin1 };

%GENERATED from file:friend.h => U2GS_Friend2FormalOP_Request
readNetMsg(?CMD_U2GS_Friend2FormalOP_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_opType, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_Friend2FormalOP_Request {
		id = V_id,
		opType = V_opType
		},
	Bin2 };

%GENERATED from file:friend.h => U2GS_Friend2Formal_Request
readNetMsg(?CMD_U2GS_Friend2Formal_Request,Bin0) ->
	{ V_page, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_Friend2Formal_Request {
		page = V_page
		},
	Bin1 };

%GENERATED from file:friend.h => U2GS_Friend2LBS_Request
readNetMsg(?CMD_U2GS_Friend2LBS_Request,Bin0) ->
	{ V_longitude, Bin1 } = binary_read_float( Bin0 ),
	{ V_latitude, Bin2 } = binary_read_float( Bin1 ),
	{ #pk_U2GS_Friend2LBS_Request {
		longitude = V_longitude,
		latitude = V_latitude
		},
	Bin2 };

%GENERATED from file:friend.h => U2GS_Friend2Recommend_Request
readNetMsg(?CMD_U2GS_Friend2Recommend_Request,Bin0) ->
	{ V_sex, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_isNear, Bin2 } = binary_read_bool( Bin1 ),
	{ V_isPush, Bin3 } = binary_read_bool( Bin2 ),
	{ #pk_U2GS_Friend2Recommend_Request {
		sex = V_sex,
		isNear = V_isNear,
		isPush = V_isPush
		},
	Bin3 };

%GENERATED from file:friend.h => U2GS_Friend2Search_Request
readNetMsg(?CMD_U2GS_Friend2Search_Request,Bin0) ->
	{ V_name, Bin1 } = binary_read_string( Bin0 ),
	{ #pk_U2GS_Friend2Search_Request {
		name = V_name
		},
	Bin1 };

%GENERATED from file:friend.h => U2GS_Friend2SimpleList_Requets
readNetMsg(?CMD_U2GS_Friend2SimpleList_Requets,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_Friend2SimpleList_Requets {
		type = V_type
		},
	Bin1 };

%GENERATED from file:friend.h => U2GS_Friend2Temp_Request
readNetMsg(?CMD_U2GS_Friend2Temp_Request,Bin0) ->
	{ V_page, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_Friend2Temp_Request {
		page = V_page
		},
	Bin1 };

%GENERATED from file:friend.h => U2GS_Friend2Unban_Request
readNetMsg(?CMD_U2GS_Friend2Unban_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_Friend2Unban_Request {
		id = V_id
		},
	Bin1 };

%GENERATED from file:friend.h => U2GS_Friend2WantChat_Request
readNetMsg(?CMD_U2GS_Friend2WantChat_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_Friend2WantChat_Request {
		id = V_id
		},
	Bin1 };

%GENERATED from file:godweapon.h => GS2U_InitGodWeapon
readNetMsg(?CMD_GS2U_InitGodWeapon,Bin0) ->
	{ V_infos, Bin1 } = binary_read_array(Bin0, fun(X) -> readGodWeaponInfo( X ) end),
	{ #pk_GS2U_InitGodWeapon {
		infos = V_infos
		},
	Bin1 };

%GENERATED from file:godweapon.h => GS2U_LevelUpGodWeaponResult
readNetMsg(?CMD_GS2U_LevelUpGodWeaponResult,Bin0) ->
	{ V_weaponID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_weaponLevel, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_exp, Bin3 } = binary_read_uint( Bin2 ),
	{ V_wakeSkillLv, Bin4 } = binary_read_uint16( Bin3 ),
	{ #pk_GS2U_LevelUpGodWeaponResult {
		weaponID = V_weaponID,
		weaponLevel = V_weaponLevel,
		exp = V_exp,
		wakeSkillLv = V_wakeSkillLv
		},
	Bin4 };

%GENERATED from file:godweapon.h => GS2U_LevelUpGodWeaponSkillResult
readNetMsg(?CMD_GS2U_LevelUpGodWeaponSkillResult,Bin0) ->
	{ V_weaponID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_skillLevel, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_GS2U_LevelUpGodWeaponSkillResult {
		weaponID = V_weaponID,
		skillLevel = V_skillLevel
		},
	Bin2 };

%GENERATED from file:godweapon.h => U2GS_LevelUpGodWeapon
readNetMsg(?CMD_U2GS_LevelUpGodWeapon,Bin0) ->
	{ V_weaponID, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_LevelUpGodWeapon {
		weaponID = V_weaponID
		},
	Bin1 };

%GENERATED from file:godweapon.h => U2GS_LevelUpGodWeaponSkill
readNetMsg(?CMD_U2GS_LevelUpGodWeaponSkill,Bin0) ->
	{ V_weaponID, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_LevelUpGodWeaponSkill {
		weaponID = V_weaponID
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_BiddingGuildMsg
readNetMsg(?CMD_GS2U_BiddingGuildMsg,Bin0) ->
	{ V_list, Bin1 } = binary_read_array(Bin0, fun(X) -> readBiddingGuild( X ) end),
	{ V_resorce, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_BiddingGuildMsg {
		list = V_list,
		resorce = V_resorce
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_ChangeDenoter
readNetMsg(?CMD_GS2U_ChangeDenoter,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_denoter, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_GS2U_ChangeDenoter {
		guildID = V_guildID,
		denoter = V_denoter
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_ChangeGuildName
readNetMsg(?CMD_GS2U_ChangeGuildName,Bin0) ->
	{ V_newGuildName, Bin1 } = binary_read_string( Bin0 ),
	{ #pk_GS2U_ChangeGuildName {
		newGuildName = V_newGuildName
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_ChangeNotice
readNetMsg(?CMD_GS2U_ChangeNotice,Bin0) ->
	{ V_guildNotice, Bin1 } = binary_read_string( Bin0 ),
	{ #pk_GS2U_ChangeNotice {
		guildNotice = V_guildNotice
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_DonateSuccess
readNetMsg(?CMD_GS2U_DonateSuccess,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_guildLevel, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_nowExp, Bin3 } = binary_read_uint( Bin2 ),
	{ V_roleID, Bin4 } = binary_read_uint64( Bin3 ),
	{ V_contribute, Bin5 } = binary_read_uint( Bin4 ),
	{ #pk_GS2U_DonateSuccess {
		guildID = V_guildID,
		guildLevel = V_guildLevel,
		nowExp = V_nowExp,
		roleID = V_roleID,
		contribute = V_contribute
		},
	Bin5 };

%GENERATED from file:guild.h => GS2U_ExpeditionBroadcastPos
readNetMsg(?CMD_GS2U_ExpeditionBroadcastPos,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_broadcasterName, Bin2 } = binary_read_string( Bin1 ),
	{ V_x, Bin3 } = binary_read_float( Bin2 ),
	{ V_y, Bin4 } = binary_read_float( Bin3 ),
	{ #pk_GS2U_ExpeditionBroadcastPos {
		type = V_type,
		broadcasterName = V_broadcasterName,
		x = V_x,
		y = V_y
		},
	Bin4 };

%GENERATED from file:guild.h => GS2U_ExpeditionFinalInfo
readNetMsg(?CMD_GS2U_ExpeditionFinalInfo,Bin0) ->
	{ V_selfTotalScore, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_finalInfoList, Bin2 } = binary_read_array(Bin1, fun(X) -> readExpeditionFinalInfo( X ) end),
	{ #pk_GS2U_ExpeditionFinalInfo {
		selfTotalScore = V_selfTotalScore,
		finalInfoList = V_finalInfoList
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_ExpeditionGlobalMapInfoList
readNetMsg(?CMD_GS2U_ExpeditionGlobalMapInfoList,Bin0) ->
	{ V_leftSeconds, Bin1 } = binary_read_uint( Bin0 ),
	{ V_mapInfoList, Bin2 } = binary_read_array(Bin1, fun(X) -> readExpeditionGlobalMapInfo( X ) end),
	{ #pk_GS2U_ExpeditionGlobalMapInfoList {
		leftSeconds = V_leftSeconds,
		mapInfoList = V_mapInfoList
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_ExpeditionMapBattleInfoList
readNetMsg(?CMD_GS2U_ExpeditionMapBattleInfoList,Bin0) ->
	{ V_mapid, Bin1 } = binary_read_uint( Bin0 ),
	{ V_selfScore, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_selfGuildBattleInfo, Bin3 } = readExpeditionGuildBattleInfo( Bin2 ),
	{ V_pointInfoList, Bin4 } = binary_read_array(Bin3, fun(X) -> readExpeditionPointInfo( X ) end),
	{ V_topGuildInfoList, Bin5 } = binary_read_array(Bin4, fun(X) -> readExpeditionGuildBattleInfo( X ) end),
	{ #pk_GS2U_ExpeditionMapBattleInfoList {
		mapid = V_mapid,
		selfScore = V_selfScore,
		selfGuildBattleInfo = V_selfGuildBattleInfo,
		pointInfoList = V_pointInfoList,
		topGuildInfoList = V_topGuildInfoList
		},
	Bin5 };

%GENERATED from file:guild.h => GS2U_ExpeditionMapInfoList
readNetMsg(?CMD_GS2U_ExpeditionMapInfoList,Bin0) ->
	{ V_mapInfoList, Bin1 } = binary_read_array(Bin0, fun(X) -> readExpeditionMapInfo( X ) end),
	{ #pk_GS2U_ExpeditionMapInfoList {
		mapInfoList = V_mapInfoList
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_ExpeditionQuenenState
readNetMsg(?CMD_GS2U_ExpeditionQuenenState,Bin0) ->
	{ V_mapid, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_ExpeditionQuenenState {
		mapid = V_mapid
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_GivePower
readNetMsg(?CMD_GS2U_GivePower,Bin0) ->
	{ V_targetRoleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_guileLevel, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_GS2U_GivePower {
		targetRoleID = V_targetRoleID,
		guileLevel = V_guileLevel
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_GuildBattleApply
readNetMsg(?CMD_GS2U_GuildBattleApply,Bin0) ->
	{ V_list, Bin1 } = binary_read_array(Bin0, fun(X) -> readGuildBattleInfo( X ) end),
	{ V_selfGuildID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_targetGuildID, Bin3 } = binary_read_uint64( Bin2 ),
	{ #pk_GS2U_GuildBattleApply {
		list = V_list,
		selfGuildID = V_selfGuildID,
		targetGuildID = V_targetGuildID
		},
	Bin3 };

%GENERATED from file:guild.h => GS2U_GuildBattleResult
readNetMsg(?CMD_GS2U_GuildBattleResult,Bin0) ->
	{ V_isEnd, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_win, Bin2 } = readGuildBattleResultInfo( Bin1 ),
	{ V_lose, Bin3 } = readGuildBattleResultInfo( Bin2 ),
	{ #pk_GS2U_GuildBattleResult {
		isEnd = V_isEnd,
		win = V_win,
		lose = V_lose
		},
	Bin3 };

%GENERATED from file:guild.h => GS2U_GuildBuff
readNetMsg(?CMD_GS2U_GuildBuff,Bin0) ->
	{ V_buff, Bin1 } = binary_read_array(Bin0, fun(X) -> readGuildBuff( X ) end),
	{ #pk_GS2U_GuildBuff {
		buff = V_buff
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_GuildBuffRole
readNetMsg(?CMD_GS2U_GuildBuffRole,Bin0) ->
	{ V_bgrs, Bin1 } = binary_read_array(Bin0, fun(X) -> readGuildBuffRole( X ) end),
	{ #pk_GS2U_GuildBuffRole {
		bgrs = V_bgrs
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_GuildIDList
readNetMsg(?CMD_GS2U_GuildIDList,Bin0) ->
	{ V_list, Bin1 } = binary_read_array(Bin0, fun(X) -> readGuildIDList( X ) end),
	{ #pk_GS2U_GuildIDList {
		list = V_list
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_GuildList
readNetMsg(?CMD_GS2U_GuildList,Bin0) ->
	{ V_nowPage, Bin1 } = binary_read_uint( Bin0 ),
	{ V_maxPage, Bin2 } = binary_read_uint( Bin1 ),
	{ V_guildInfoList, Bin3 } = binary_read_array(Bin2, fun(X) -> readGuildInfo( X ) end),
	{ #pk_GS2U_GuildList {
		nowPage = V_nowPage,
		maxPage = V_maxPage,
		guildInfoList = V_guildInfoList
		},
	Bin3 };

%GENERATED from file:guild.h => GS2U_GuildOpResult
readNetMsg(?CMD_GS2U_GuildOpResult,Bin0) ->
	{ V_roleCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_opType, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_opResult, Bin3 } = binary_read_bool( Bin2 ),
	{ #pk_GS2U_GuildOpResult {
		roleCode = V_roleCode,
		opType = V_opType,
		opResult = V_opResult
		},
	Bin3 };

%GENERATED from file:guild.h => GS2U_GuildSkill
readNetMsg(?CMD_GS2U_GuildSkill,Bin0) ->
	{ V_skill, Bin1 } = binary_read_array(Bin0, fun(X) -> readGuildSkill( X ) end),
	{ V_selfskill, Bin2 } = binary_read_array(Bin1, fun(X) -> readGuildSkill( X ) end),
	{ #pk_GS2U_GuildSkill {
		skill = V_skill,
		selfskill = V_selfskill
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_GuildTask
readNetMsg(?CMD_GS2U_GuildTask,Bin0) ->
	{ V_tasks, Bin1 } = binary_read_array(Bin0, fun(X) -> readGuildTask( X ) end),
	{ #pk_GS2U_GuildTask {
		tasks = V_tasks
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_GuildWar
readNetMsg(?CMD_GS2U_GuildWar,Bin0) ->
	{ V_list, Bin1 } = binary_read_array(Bin0, fun(X) -> readGuildWar( X ) end),
	{ #pk_GS2U_GuildWar {
		list = V_list
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_GuildWarData
readNetMsg(?CMD_GS2U_GuildWarData,Bin0) ->
	{ V_ranks, Bin1 } = binary_read_array(Bin0, fun(X) -> readGuildWarRank( X ) end),
	{ V_pebbles, Bin2 } = binary_read_array(Bin1, fun(X) -> readPebbleState( X ) end),
	{ V_cannons, Bin3 } = binary_read_array(Bin2, fun(X) -> readCannonState( X ) end),
	{ V_syTime, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_GS2U_GuildWarData {
		ranks = V_ranks,
		pebbles = V_pebbles,
		cannons = V_cannons,
		syTime = V_syTime
		},
	Bin4 };

%GENERATED from file:guild.h => GS2U_GuildWarEnd
readNetMsg(?CMD_GS2U_GuildWarEnd,Bin0) ->
	{ V_infos, Bin1 } = binary_read_array(Bin0, fun(X) -> readGuildWarInfo( X ) end),
	{ V_items, Bin2 } = binary_read_array(Bin1, fun(X) -> readGuildWarReward_item( X ) end),
	{ V_coins, Bin3 } = binary_read_array(Bin2, fun(X) -> readGuildWarReward_coin( X ) end),
	{ #pk_GS2U_GuildWarEnd {
		infos = V_infos,
		items = V_items,
		coins = V_coins
		},
	Bin3 };

%GENERATED from file:guild.h => GS2U_Guild_ExchangeAll_Sync
readNetMsg(?CMD_GS2U_Guild_ExchangeAll_Sync,Bin0) ->
	{ V_listID, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint( X ) end),
	{ V_listLevel, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint( X ) end),
	{ V_listLevelCur, Bin3 } = binary_read_array(Bin2, fun(X) -> binary_read_uint( X ) end),
	{ #pk_GS2U_Guild_ExchangeAll_Sync {
		listID = V_listID,
		listLevel = V_listLevel,
		listLevelCur = V_listLevelCur
		},
	Bin3 };

%GENERATED from file:guild.h => GS2U_Guild_Exchange_Ack
readNetMsg(?CMD_GS2U_Guild_Exchange_Ack,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_level, Bin2 } = binary_read_uint( Bin1 ),
	{ V_errorCode, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GS2U_Guild_Exchange_Ack {
		id = V_id,
		level = V_level,
		errorCode = V_errorCode
		},
	Bin3 };

%GENERATED from file:guild.h => GS2U_Guild_FairgroundEnter_Ack
readNetMsg(?CMD_GS2U_Guild_FairgroundEnter_Ack,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_listRide, Bin2 } = binary_read_array(Bin1, fun(X) -> readRide( X ) end),
	{ V_listRole, Bin3 } = binary_read_array(Bin2, fun(X) -> readRideRole( X ) end),
	{ #pk_GS2U_Guild_FairgroundEnter_Ack {
		guildID = V_guildID,
		listRide = V_listRide,
		listRole = V_listRole
		},
	Bin3 };

%GENERATED from file:guild.h => GS2U_Guild_FairgroundRide_Sync
readNetMsg(?CMD_GS2U_Guild_FairgroundRide_Sync,Bin0) ->
	{ V_ride, Bin1 } = readRide( Bin0 ),
	{ V_role, Bin2 } = readRideRole( Bin1 ),
	{ V_type, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_GS2U_Guild_FairgroundRide_Sync {
		ride = V_ride,
		role = V_role,
		type = V_type
		},
	Bin3 };

%GENERATED from file:guild.h => GS2U_Guild_FastJoin_Ack
readNetMsg(?CMD_GS2U_Guild_FastJoin_Ack,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_GS2U_Guild_FastJoin_Ack {
		guildID = V_guildID
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_Guild_FastJoin_Get_Ack
readNetMsg(?CMD_GS2U_Guild_FastJoin_Get_Ack,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_force, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_Guild_FastJoin_Get_Ack {
		guildID = V_guildID,
		force = V_force
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_Guild_FastJoin_Set_Ack
readNetMsg(?CMD_GS2U_Guild_FastJoin_Set_Ack,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_force, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_Guild_FastJoin_Set_Ack {
		guildID = V_guildID,
		force = V_force
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_Guild_GodBless_Ack
readNetMsg(?CMD_GS2U_Guild_GodBless_Ack,Bin0) ->
	{ V_time, Bin1 } = binary_read_uint( Bin0 ),
	{ V_count, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_GS2U_Guild_GodBless_Ack {
		time = V_time,
		count = V_count
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_Guild_GodBless_Schedule_Reward_Ack
readNetMsg(?CMD_GS2U_Guild_GodBless_Schedule_Reward_Ack,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_Guild_GodBless_Schedule_Reward_Ack {
		id = V_id
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_Guild_GodBless_Schedule_Sync
readNetMsg(?CMD_GS2U_Guild_GodBless_Schedule_Sync,Bin0) ->
	{ V_schedule, Bin1 } = binary_read_uint( Bin0 ),
	{ V_listID, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint( X ) end),
	{ #pk_GS2U_Guild_GodBless_Schedule_Sync {
		schedule = V_schedule,
		listID = V_listID
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_Guild_OpenSupplication_Ack
readNetMsg(?CMD_GS2U_Guild_OpenSupplication_Ack,Bin0) ->
	{ V_listInfo, Bin1 } = binary_read_array(Bin0, fun(X) -> readSupplication( X ) end),
	{ #pk_GS2U_Guild_OpenSupplication_Ack {
		listInfo = V_listInfo
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_Guild_ShopBuy_Ack
readNetMsg(?CMD_GS2U_Guild_ShopBuy_Ack,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_count, Bin2 } = binary_read_uint( Bin1 ),
	{ V_errorCode, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GS2U_Guild_ShopBuy_Ack {
		id = V_id,
		count = V_count,
		errorCode = V_errorCode
		},
	Bin3 };

%GENERATED from file:guild.h => GS2U_Guild_SnowmanAll_Sync
readNetMsg(?CMD_GS2U_Guild_SnowmanAll_Sync,Bin0) ->
	{ V_count, Bin1 } = binary_read_uint( Bin0 ),
	{ V_countMax, Bin2 } = binary_read_uint( Bin1 ),
	{ V_subState, Bin3 } = binary_read_uint( Bin2 ),
	{ V_listResSnowman, Bin4 } = binary_read_array(Bin3, fun(X) -> binary_read_uint( X ) end),
	{ V_listResPlayer, Bin5 } = binary_read_array(Bin4, fun(X) -> binary_read_uint( X ) end),
	{ #pk_GS2U_Guild_SnowmanAll_Sync {
		count = V_count,
		countMax = V_countMax,
		subState = V_subState,
		listResSnowman = V_listResSnowman,
		listResPlayer = V_listResPlayer
		},
	Bin5 };

%GENERATED from file:guild.h => GS2U_Guild_SnowmanBegin_Sync
readNetMsg(?CMD_GS2U_Guild_SnowmanBegin_Sync,Bin0) ->
	{ #pk_GS2U_Guild_SnowmanBegin_Sync {

		},
	Bin0 };

%GENERATED from file:guild.h => GS2U_Guild_SnowmanCompleteCount_Sync
readNetMsg(?CMD_GS2U_Guild_SnowmanCompleteCount_Sync,Bin0) ->
	{ V_count, Bin1 } = binary_read_uint( Bin0 ),
	{ V_listMark, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_bool( X ) end),
	{ #pk_GS2U_Guild_SnowmanCompleteCount_Sync {
		count = V_count,
		listMark = V_listMark
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_Guild_SnowmanExtraRes_Sync
readNetMsg(?CMD_GS2U_Guild_SnowmanExtraRes_Sync,Bin0) ->
	{ V_count, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_Guild_SnowmanExtraRes_Sync {
		count = V_count
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_Guild_SnowmanPlayer_Sync
readNetMsg(?CMD_GS2U_Guild_SnowmanPlayer_Sync,Bin0) ->
	{ V_listResPlayer, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint( X ) end),
	{ #pk_GS2U_Guild_SnowmanPlayer_Sync {
		listResPlayer = V_listResPlayer
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_Guild_SnowmanSettle_Sync
readNetMsg(?CMD_GS2U_Guild_SnowmanSettle_Sync,Bin0) ->
	{ V_count, Bin1 } = binary_read_uint( Bin0 ),
	{ V_guildName, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_GS2U_Guild_SnowmanSettle_Sync {
		count = V_count,
		guildName = V_guildName
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_Guild_SnowmanSnowman_Sync
readNetMsg(?CMD_GS2U_Guild_SnowmanSnowman_Sync,Bin0) ->
	{ V_count, Bin1 } = binary_read_uint( Bin0 ),
	{ V_countMax, Bin2 } = binary_read_uint( Bin1 ),
	{ V_subState, Bin3 } = binary_read_uint( Bin2 ),
	{ V_listResSnowman, Bin4 } = binary_read_array(Bin3, fun(X) -> binary_read_uint( X ) end),
	{ #pk_GS2U_Guild_SnowmanSnowman_Sync {
		count = V_count,
		countMax = V_countMax,
		subState = V_subState,
		listResSnowman = V_listResSnowman
		},
	Bin4 };

%GENERATED from file:guild.h => GS2U_Guild_SupplicateGiveF_Ack
readNetMsg(?CMD_GS2U_Guild_SupplicateGiveF_Ack,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_tarRoleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_Guild_SupplicateGiveF_Ack {
		type = V_type,
		tarRoleID = V_tarRoleID
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_Guild_SupplicateGive_Ack
readNetMsg(?CMD_GS2U_Guild_SupplicateGive_Ack,Bin0) ->
	{ V_history, Bin1 } = readSuppHistory2( Bin0 ),
	{ V_nameTables, Bin2 } = binary_read_array(Bin1, fun(X) -> readNameTable2( X ) end),
	{ #pk_GS2U_Guild_SupplicateGive_Ack {
		history = V_history,
		nameTables = V_nameTables
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_Guild_SupplicateGive_Sync
readNetMsg(?CMD_GS2U_Guild_SupplicateGive_Sync,Bin0) ->
	{ V_listHistory, Bin1 } = binary_read_array(Bin0, fun(X) -> readSuppHistory2( X ) end),
	{ V_nameTables, Bin2 } = binary_read_array(Bin1, fun(X) -> readNameTable2( X ) end),
	{ #pk_GS2U_Guild_SupplicateGive_Sync {
		listHistory = V_listHistory,
		nameTables = V_nameTables
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_Guild_Supplicate_Ack
readNetMsg(?CMD_GS2U_Guild_Supplicate_Ack,Bin0) ->
	{ V_itemID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_Guild_Supplicate_Ack {
		itemID = V_itemID
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_ImpeachInfo
readNetMsg(?CMD_GS2U_ImpeachInfo,Bin0) ->
	{ V_canImpeach, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_supportNumber, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_impeacherID, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_impeacherName, Bin4 } = binary_read_string( Bin3 ),
	{ V_impeacheLeftTime, Bin5 } = binary_read_uint64( Bin4 ),
	{ #pk_GS2U_ImpeachInfo {
		canImpeach = V_canImpeach,
		supportNumber = V_supportNumber,
		impeacherID = V_impeacherID,
		impeacherName = V_impeacherName,
		impeacheLeftTime = V_impeacheLeftTime
		},
	Bin5 };

%GENERATED from file:guild.h => GS2U_JoinGuild_Sync
readNetMsg(?CMD_GS2U_JoinGuild_Sync,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_GS2U_JoinGuild_Sync {
		guildID = V_guildID
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_OccupyOwnerChange
readNetMsg(?CMD_GS2U_OccupyOwnerChange,Bin0) ->
	{ V_remainSec, Bin1 } = binary_read_uint( Bin0 ),
	{ V_owner, Bin2 } = readOccupyGuildInfo( Bin1 ),
	{ V_target, Bin3 } = readOccupyGuildInfo( Bin2 ),
	{ V_playerInfos, Bin4 } = binary_read_array(Bin3, fun(X) -> readGuildBattlePlayerInfo( X ) end),
	{ #pk_GS2U_OccupyOwnerChange {
		remainSec = V_remainSec,
		owner = V_owner,
		target = V_target,
		playerInfos = V_playerInfos
		},
	Bin4 };

%GENERATED from file:guild.h => GS2U_OneKeyRecruit_Ack
readNetMsg(?CMD_GS2U_OneKeyRecruit_Ack,Bin0) ->
	{ V_cd, Bin1 } = binary_read_uint( Bin0 ),
	{ V_ret, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_OneKeyRecruit_Ack {
		cd = V_cd,
		ret = V_ret
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_OpenGuildForm
readNetMsg(?CMD_GS2U_OpenGuildForm,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_guildName, Bin2 } = binary_read_string( Bin1 ),
	{ V_guildLevel, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_fightForce, Bin4 } = binary_read_uint( Bin3 ),
	{ V_memberNumber, Bin5 } = binary_read_uint( Bin4 ),
	{ V_maxMemberNumber, Bin6 } = binary_read_uint( Bin5 ),
	{ V_resource, Bin7 } = binary_read_uint( Bin6 ),
	{ V_liveness, Bin8 } = binary_read_uint( Bin7 ),
	{ V_notice, Bin9 } = binary_read_string( Bin8 ),
	{ V_denoter, Bin10 } = binary_read_uint8( Bin9 ),
	{ V_shopLevel, Bin11 } = binary_read_uint8( Bin10 ),
	{ V_requestJoinNum, Bin12 } = binary_read_uint( Bin11 ),
	{ V_selfContribute, Bin13 } = binary_read_uint( Bin12 ),
	{ V_selfGuildLevel, Bin14 } = binary_read_uint8( Bin13 ),
	{ V_cd, Bin15 } = binary_read_uint( Bin14 ),
	{ #pk_GS2U_OpenGuildForm {
		guildID = V_guildID,
		guildName = V_guildName,
		guildLevel = V_guildLevel,
		fightForce = V_fightForce,
		memberNumber = V_memberNumber,
		maxMemberNumber = V_maxMemberNumber,
		resource = V_resource,
		liveness = V_liveness,
		notice = V_notice,
		denoter = V_denoter,
		shopLevel = V_shopLevel,
		requestJoinNum = V_requestJoinNum,
		selfContribute = V_selfContribute,
		selfGuildLevel = V_selfGuildLevel,
		cd = V_cd
		},
	Bin15 };

%GENERATED from file:guild.h => GS2U_QueryGuildInfoByRoleID_Ack
readNetMsg(?CMD_GS2U_QueryGuildInfoByRoleID_Ack,Bin0) ->
	{ V_guildInfo, Bin1 } = readGuildInfo( Bin0 ),
	{ #pk_GS2U_QueryGuildInfoByRoleID_Ack {
		guildInfo = V_guildInfo
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_QueryImpeachInfo
readNetMsg(?CMD_GS2U_QueryImpeachInfo,Bin0) ->
	{ #pk_GS2U_QueryImpeachInfo {

		},
	Bin0 };

%GENERATED from file:guild.h => GS2U_Recruit
readNetMsg(?CMD_GS2U_Recruit,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleName, Bin2 } = binary_read_string( Bin1 ),
	{ V_guildInfo, Bin3 } = readGuildInfo( Bin2 ),
	{ #pk_GS2U_Recruit {
		roleID = V_roleID,
		roleName = V_roleName,
		guildInfo = V_guildInfo
		},
	Bin3 };

%GENERATED from file:guild.h => GS2U_RefreshGuildProp
readNetMsg(?CMD_GS2U_RefreshGuildProp,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_resource, Bin2 } = binary_read_uint( Bin1 ),
	{ V_liveness, Bin3 } = binary_read_uint( Bin2 ),
	{ V_selfContribute, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_GS2U_RefreshGuildProp {
		guildID = V_guildID,
		resource = V_resource,
		liveness = V_liveness,
		selfContribute = V_selfContribute
		},
	Bin4 };

%GENERATED from file:guild.h => GS2U_RequestJoinGuildList
readNetMsg(?CMD_GS2U_RequestJoinGuildList,Bin0) ->
	{ V_requestList, Bin1 } = binary_read_array(Bin0, fun(X) -> readGuildApplyMemberInfo( X ) end),
	{ #pk_GS2U_RequestJoinGuildList {
		requestList = V_requestList
		},
	Bin1 };

%GENERATED from file:guild.h => GS2U_RequestJoinGuild_Ack
readNetMsg(?CMD_GS2U_RequestJoinGuild_Ack,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_cancelID, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_RequestJoinGuild_Ack {
		guildID = V_guildID,
		cancelID = V_cancelID
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_RequestLookMemberList
readNetMsg(?CMD_GS2U_RequestLookMemberList,Bin0) ->
	{ V_nowPage, Bin1 } = binary_read_uint( Bin0 ),
	{ V_maxPage, Bin2 } = binary_read_uint( Bin1 ),
	{ V_memberList, Bin3 } = binary_read_array(Bin2, fun(X) -> readGuildMemberInfo( X ) end),
	{ #pk_GS2U_RequestLookMemberList {
		nowPage = V_nowPage,
		maxPage = V_maxPage,
		memberList = V_memberList
		},
	Bin3 };

%GENERATED from file:guild.h => GS2U_ReturnDonateTimes
readNetMsg(?CMD_GS2U_ReturnDonateTimes,Bin0) ->
	{ V_moneyType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_times, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_GS2U_ReturnDonateTimes {
		moneyType = V_moneyType,
		times = V_times
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_ShopUpgrade
readNetMsg(?CMD_GS2U_ShopUpgrade,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_shopLevel, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_GS2U_ShopUpgrade {
		guildID = V_guildID,
		shopLevel = V_shopLevel
		},
	Bin2 };

%GENERATED from file:guild.h => GS2U_Upgrade_Ack
readNetMsg(?CMD_GS2U_Upgrade_Ack,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_level, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_Upgrade_Ack {
		guildID = V_guildID,
		level = V_level
		},
	Bin2 };

%GENERATED from file:guild.h => U2GS_AcceptGuildTask
readNetMsg(?CMD_U2GS_AcceptGuildTask,Bin0) ->
	{ V_taskType, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_AcceptGuildTask {
		taskType = V_taskType
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_AgreeRecruit
readNetMsg(?CMD_U2GS_AgreeRecruit,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_agree, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_U2GS_AgreeRecruit {
		guildID = V_guildID,
		roleID = V_roleID,
		agree = V_agree
		},
	Bin3 };

%GENERATED from file:guild.h => U2GS_Bidding
readNetMsg(?CMD_U2GS_Bidding,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_Bidding {
		guildID = V_guildID
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_BuyGuildBuff
readNetMsg(?CMD_U2GS_BuyGuildBuff,Bin0) ->
	{ V_confId, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_BuyGuildBuff {
		confId = V_confId
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_ChangeDenoter
readNetMsg(?CMD_U2GS_ChangeDenoter,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_denoter, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_ChangeDenoter {
		guildID = V_guildID,
		denoter = V_denoter
		},
	Bin2 };

%GENERATED from file:guild.h => U2GS_ChangeGuildName
readNetMsg(?CMD_U2GS_ChangeGuildName,Bin0) ->
	{ V_newGuildName, Bin1 } = binary_read_string( Bin0 ),
	{ #pk_U2GS_ChangeGuildName {
		newGuildName = V_newGuildName
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_ChangeLeader
readNetMsg(?CMD_U2GS_ChangeLeader,Bin0) ->
	{ V_targetRoleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_ChangeLeader {
		targetRoleID = V_targetRoleID
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_ChangeNotice
readNetMsg(?CMD_U2GS_ChangeNotice,Bin0) ->
	{ V_guildNotice, Bin1 } = binary_read_string( Bin0 ),
	{ #pk_U2GS_ChangeNotice {
		guildNotice = V_guildNotice
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_CreateGuild
readNetMsg(?CMD_U2GS_CreateGuild,Bin0) ->
	{ V_guildName, Bin1 } = binary_read_string( Bin0 ),
	{ V_denoter, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_guildNotice, Bin3 } = binary_read_string( Bin2 ),
	{ #pk_U2GS_CreateGuild {
		guildName = V_guildName,
		denoter = V_denoter,
		guildNotice = V_guildNotice
		},
	Bin3 };

%GENERATED from file:guild.h => U2GS_DealRequestJoin
readNetMsg(?CMD_U2GS_DealRequestJoin,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleIDs, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint64( X ) end),
	{ V_agree, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_U2GS_DealRequestJoin {
		guildID = V_guildID,
		roleIDs = V_roleIDs,
		agree = V_agree
		},
	Bin3 };

%GENERATED from file:guild.h => U2GS_DeleteGuild
readNetMsg(?CMD_U2GS_DeleteGuild,Bin0) ->
	{ #pk_U2GS_DeleteGuild {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_DonateMoney
readNetMsg(?CMD_U2GS_DonateMoney,Bin0) ->
	{ V_moneyType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_moneyNumber, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_DonateMoney {
		moneyType = V_moneyType,
		moneyNumber = V_moneyNumber
		},
	Bin2 };

%GENERATED from file:guild.h => U2GS_EnterGuildBattle
readNetMsg(?CMD_U2GS_EnterGuildBattle,Bin0) ->
	{ #pk_U2GS_EnterGuildBattle {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_EnterGuildHome
readNetMsg(?CMD_U2GS_EnterGuildHome,Bin0) ->
	{ V_targetGuildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_EnterGuildHome {
		targetGuildID = V_targetGuildID
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_ExitGuild
readNetMsg(?CMD_U2GS_ExitGuild,Bin0) ->
	{ #pk_U2GS_ExitGuild {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_ExpeditionBroadcastPos
readNetMsg(?CMD_U2GS_ExpeditionBroadcastPos,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_ExpeditionBroadcastPos {
		type = V_type
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_GetGuildHomeReward
readNetMsg(?CMD_U2GS_GetGuildHomeReward,Bin0) ->
	{ V_taskType, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_GetGuildHomeReward {
		taskType = V_taskType
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_GetGuildPrize
readNetMsg(?CMD_U2GS_GetGuildPrize,Bin0) ->
	{ #pk_U2GS_GetGuildPrize {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_GiveMeExpeditionRewardEverDay
readNetMsg(?CMD_U2GS_GiveMeExpeditionRewardEverDay,Bin0) ->
	{ V_mapid, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_GiveMeExpeditionRewardEverDay {
		mapid = V_mapid
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_GivePower
readNetMsg(?CMD_U2GS_GivePower,Bin0) ->
	{ V_targetRoleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_guileLevel, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_GivePower {
		targetRoleID = V_targetRoleID,
		guileLevel = V_guileLevel
		},
	Bin2 };

%GENERATED from file:guild.h => U2GS_GiveUpGuildTask
readNetMsg(?CMD_U2GS_GiveUpGuildTask,Bin0) ->
	{ V_taskType, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_GiveUpGuildTask {
		taskType = V_taskType
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_GuildBattleApply
readNetMsg(?CMD_U2GS_GuildBattleApply,Bin0) ->
	{ #pk_U2GS_GuildBattleApply {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_GuildList
readNetMsg(?CMD_U2GS_GuildList,Bin0) ->
	{ V_requestPageNumber, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_GuildList {
		requestPageNumber = V_requestPageNumber
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_GuildReward
readNetMsg(?CMD_U2GS_GuildReward,Bin0) ->
	{ #pk_U2GS_GuildReward {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_Guild_Exchange_Request
readNetMsg(?CMD_U2GS_Guild_Exchange_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_level, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_Guild_Exchange_Request {
		id = V_id,
		level = V_level
		},
	Bin2 };

%GENERATED from file:guild.h => U2GS_Guild_FairgroundEnter_Request
readNetMsg(?CMD_U2GS_Guild_FairgroundEnter_Request,Bin0) ->
	{ V_targetGuildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_Guild_FairgroundEnter_Request {
		targetGuildID = V_targetGuildID
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_Guild_FairgroundRide_Request
readNetMsg(?CMD_U2GS_Guild_FairgroundRide_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_type, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_Guild_FairgroundRide_Request {
		id = V_id,
		type = V_type
		},
	Bin2 };

%GENERATED from file:guild.h => U2GS_Guild_FastJoin_Get_Request
readNetMsg(?CMD_U2GS_Guild_FastJoin_Get_Request,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_Guild_FastJoin_Get_Request {
		guildID = V_guildID
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_Guild_FastJoin_Request
readNetMsg(?CMD_U2GS_Guild_FastJoin_Request,Bin0) ->
	{ #pk_U2GS_Guild_FastJoin_Request {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_Guild_FastJoin_Set_Request
readNetMsg(?CMD_U2GS_Guild_FastJoin_Set_Request,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_force, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_U2GS_Guild_FastJoin_Set_Request {
		guildID = V_guildID,
		force = V_force
		},
	Bin2 };

%GENERATED from file:guild.h => U2GS_Guild_GodBless_Request
readNetMsg(?CMD_U2GS_Guild_GodBless_Request,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_Guild_GodBless_Request {
		type = V_type
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_Guild_GodBless_Schedule_Request
readNetMsg(?CMD_U2GS_Guild_GodBless_Schedule_Request,Bin0) ->
	{ #pk_U2GS_Guild_GodBless_Schedule_Request {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_Guild_GodBless_Schedule_Reward_Request
readNetMsg(?CMD_U2GS_Guild_GodBless_Schedule_Reward_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_Guild_GodBless_Schedule_Reward_Request {
		id = V_id
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_Guild_OpenSupplication_Request
readNetMsg(?CMD_U2GS_Guild_OpenSupplication_Request,Bin0) ->
	{ #pk_U2GS_Guild_OpenSupplication_Request {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_Guild_ShopBuy_Request
readNetMsg(?CMD_U2GS_Guild_ShopBuy_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_count, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_Guild_ShopBuy_Request {
		id = V_id,
		count = V_count
		},
	Bin2 };

%GENERATED from file:guild.h => U2GS_Guild_SnowmanCheck_Request
readNetMsg(?CMD_U2GS_Guild_SnowmanCheck_Request,Bin0) ->
	{ #pk_U2GS_Guild_SnowmanCheck_Request {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_Guild_SnowmanDonate_Request
readNetMsg(?CMD_U2GS_Guild_SnowmanDonate_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_snowmanID, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_Guild_SnowmanDonate_Request {
		id = V_id,
		snowmanID = V_snowmanID
		},
	Bin2 };

%GENERATED from file:guild.h => U2GS_Guild_SnowmanReward_Request
readNetMsg(?CMD_U2GS_Guild_SnowmanReward_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_Guild_SnowmanReward_Request {
		id = V_id
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_Guild_SupplicateGive_Request
readNetMsg(?CMD_U2GS_Guild_SupplicateGive_Request,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_itemID, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_U2GS_Guild_SupplicateGive_Request {
		roleID = V_roleID,
		itemID = V_itemID
		},
	Bin2 };

%GENERATED from file:guild.h => U2GS_Guild_Supplicate_Request
readNetMsg(?CMD_U2GS_Guild_Supplicate_Request,Bin0) ->
	{ V_itemID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_Guild_Supplicate_Request {
		itemID = V_itemID
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_ImpeachCreater
readNetMsg(?CMD_U2GS_ImpeachCreater,Bin0) ->
	{ #pk_U2GS_ImpeachCreater {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_KickGuild
readNetMsg(?CMD_U2GS_KickGuild,Bin0) ->
	{ V_targetRoleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_KickGuild {
		targetRoleID = V_targetRoleID
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_OneKeyRecruit_Request
readNetMsg(?CMD_U2GS_OneKeyRecruit_Request,Bin0) ->
	{ #pk_U2GS_OneKeyRecruit_Request {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_OpenGuildForm
readNetMsg(?CMD_U2GS_OpenGuildForm,Bin0) ->
	{ #pk_U2GS_OpenGuildForm {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_OpenGuildShop
readNetMsg(?CMD_U2GS_OpenGuildShop,Bin0) ->
	{ #pk_U2GS_OpenGuildShop {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_QueryExpeditionFinalInfo
readNetMsg(?CMD_U2GS_QueryExpeditionFinalInfo,Bin0) ->
	{ #pk_U2GS_QueryExpeditionFinalInfo {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_QueryExpeditionGlobalMapInfo
readNetMsg(?CMD_U2GS_QueryExpeditionGlobalMapInfo,Bin0) ->
	{ #pk_U2GS_QueryExpeditionGlobalMapInfo {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_QueryExpeditionMapBattleInfo
readNetMsg(?CMD_U2GS_QueryExpeditionMapBattleInfo,Bin0) ->
	{ V_mapid, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_QueryExpeditionMapBattleInfo {
		mapid = V_mapid
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_QueryExpeditionMapInfo
readNetMsg(?CMD_U2GS_QueryExpeditionMapInfo,Bin0) ->
	{ #pk_U2GS_QueryExpeditionMapInfo {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_QueryGuildInfoByRoleID_Request
readNetMsg(?CMD_U2GS_QueryGuildInfoByRoleID_Request,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_QueryGuildInfoByRoleID_Request {
		roleID = V_roleID
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_Recruit
readNetMsg(?CMD_U2GS_Recruit,Bin0) ->
	{ V_targetCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_Recruit {
		targetCode = V_targetCode
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_RequestDonateTimes
readNetMsg(?CMD_U2GS_RequestDonateTimes,Bin0) ->
	{ V_moneyType, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_RequestDonateTimes {
		moneyType = V_moneyType
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_RequestGuildBattleResult
readNetMsg(?CMD_U2GS_RequestGuildBattleResult,Bin0) ->
	{ #pk_U2GS_RequestGuildBattleResult {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_RequestGuildBuff
readNetMsg(?CMD_U2GS_RequestGuildBuff,Bin0) ->
	{ #pk_U2GS_RequestGuildBuff {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_RequestGuildInfo_Request
readNetMsg(?CMD_U2GS_RequestGuildInfo_Request,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_RequestGuildInfo_Request {
		guildID = V_guildID
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_RequestGuildSkill
readNetMsg(?CMD_U2GS_RequestGuildSkill,Bin0) ->
	{ #pk_U2GS_RequestGuildSkill {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_RequestGuildTask
readNetMsg(?CMD_U2GS_RequestGuildTask,Bin0) ->
	{ #pk_U2GS_RequestGuildTask {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_RequestGuildWar
readNetMsg(?CMD_U2GS_RequestGuildWar,Bin0) ->
	{ #pk_U2GS_RequestGuildWar {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_RequestJoinGuild
readNetMsg(?CMD_U2GS_RequestJoinGuild,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_RequestJoinGuild {
		guildID = V_guildID
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_RequestJoinGuildList
readNetMsg(?CMD_U2GS_RequestJoinGuildList,Bin0) ->
	{ #pk_U2GS_RequestJoinGuildList {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_RequestLookMemberList
readNetMsg(?CMD_U2GS_RequestLookMemberList,Bin0) ->
	{ V_requestPageNumber, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_RequestLookMemberList {
		requestPageNumber = V_requestPageNumber
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_ResearchGuildSkill
readNetMsg(?CMD_U2GS_ResearchGuildSkill,Bin0) ->
	{ V_confId, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_ResearchGuildSkill {
		confId = V_confId
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_ShopUpgrade
readNetMsg(?CMD_U2GS_ShopUpgrade,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_ShopUpgrade {
		guildID = V_guildID
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_StudyGuildSkill
readNetMsg(?CMD_U2GS_StudyGuildSkill,Bin0) ->
	{ V_confId, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_StudyGuildSkill {
		confId = V_confId
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_SummonHX
readNetMsg(?CMD_U2GS_SummonHX,Bin0) ->
	{ #pk_U2GS_SummonHX {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_SummonMonster
readNetMsg(?CMD_U2GS_SummonMonster,Bin0) ->
	{ #pk_U2GS_SummonMonster {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_SupportImpeachCreater
readNetMsg(?CMD_U2GS_SupportImpeachCreater,Bin0) ->
	{ #pk_U2GS_SupportImpeachCreater {

		},
	Bin0 };

%GENERATED from file:guild.h => U2GS_Upgrade
readNetMsg(?CMD_U2GS_Upgrade,Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_Upgrade {
		guildID = V_guildID
		},
	Bin1 };

%GENERATED from file:guild.h => U2GS_UseCannon
readNetMsg(?CMD_U2GS_UseCannon,Bin0) ->
	{ V_targetGuildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_selectCode, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_U2GS_UseCannon {
		targetGuildID = V_targetGuildID,
		selectCode = V_selectCode
		},
	Bin2 };

%GENERATED from file:guild.h => U2GS_getGuildBuff
readNetMsg(?CMD_U2GS_getGuildBuff,Bin0) ->
	{ V_confId, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_getGuildBuff {
		confId = V_confId
		},
	Bin1 };

%GENERATED from file:home.h => GS2U_FreshHomeAreaInfo
readNetMsg(?CMD_GS2U_FreshHomeAreaInfo,Bin0) ->
	{ V_homeID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_areas, Bin2 } = binary_read_array(Bin1, fun(X) -> readHomeArea( X ) end),
	{ #pk_GS2U_FreshHomeAreaInfo {
		homeID = V_homeID,
		areas = V_areas
		},
	Bin2 };

%GENERATED from file:home.h => GS2U_FreshHomeInfo
readNetMsg(?CMD_GS2U_FreshHomeInfo,Bin0) ->
	{ V_homeID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_homeName, Bin2 } = binary_read_string( Bin1 ),
	{ V_stylish, Bin3 } = binary_read_uint( Bin2 ),
	{ V_comfort, Bin4 } = binary_read_uint( Bin3 ),
	{ V_homeLvl, Bin5 } = binary_read_uint( Bin4 ),
	{ V_popularity, Bin6 } = binary_read_uint( Bin5 ),
	{ #pk_GS2U_FreshHomeInfo {
		homeID = V_homeID,
		homeName = V_homeName,
		stylish = V_stylish,
		comfort = V_comfort,
		homeLvl = V_homeLvl,
		popularity = V_popularity
		},
	Bin6 };

%GENERATED from file:home.h => GS2U_GetPetFoodResults_Sync
readNetMsg(?CMD_GS2U_GetPetFoodResults_Sync,Bin0) ->
	{ V_result, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_petID, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_itemID, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_num, Bin4 } = binary_read_uint8( Bin3 ),
	{ #pk_GS2U_GetPetFoodResults_Sync {
		result = V_result,
		petID = V_petID,
		itemID = V_itemID,
		num = V_num
		},
	Bin4 };

%GENERATED from file:home.h => GS2U_HomeFarming_Sync
readNetMsg(?CMD_GS2U_HomeFarming_Sync,Bin0) ->
	{ V_petList, Bin1 } = binary_read_array(Bin0, fun(X) -> readFarmingPet( X ) end),
	{ #pk_GS2U_HomeFarming_Sync {
		petList = V_petList
		},
	Bin1 };

%GENERATED from file:home.h => GS2U_HomeInfo
readNetMsg(?CMD_GS2U_HomeInfo,Bin0) ->
	{ V_homeID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_homeName, Bin2 } = binary_read_string( Bin1 ),
	{ V_serverName, Bin3 } = binary_read_string( Bin2 ),
	{ V_ownerID, Bin4 } = binary_read_uint64( Bin3 ),
	{ V_ownerName, Bin5 } = binary_read_string( Bin4 ),
	{ V_mateID, Bin6 } = binary_read_uint64( Bin5 ),
	{ V_mateName, Bin7 } = binary_read_string( Bin6 ),
	{ V_stylish, Bin8 } = binary_read_uint( Bin7 ),
	{ V_comfort, Bin9 } = binary_read_uint( Bin8 ),
	{ V_homeLvl, Bin10 } = binary_read_uint( Bin9 ),
	{ V_popularity, Bin11 } = binary_read_uint( Bin10 ),
	{ V_leftID, Bin12 } = binary_read_uint64( Bin11 ),
	{ V_leftName, Bin13 } = binary_read_string( Bin12 ),
	{ V_rightID, Bin14 } = binary_read_uint64( Bin13 ),
	{ V_rightName, Bin15 } = binary_read_string( Bin14 ),
	{ V_areas, Bin16 } = binary_read_array(Bin15, fun(X) -> readHomeArea( X ) end),
	{ #pk_GS2U_HomeInfo {
		homeID = V_homeID,
		homeName = V_homeName,
		serverName = V_serverName,
		ownerID = V_ownerID,
		ownerName = V_ownerName,
		mateID = V_mateID,
		mateName = V_mateName,
		stylish = V_stylish,
		comfort = V_comfort,
		homeLvl = V_homeLvl,
		popularity = V_popularity,
		leftID = V_leftID,
		leftName = V_leftName,
		rightID = V_rightID,
		rightName = V_rightName,
		areas = V_areas
		},
	Bin16 };

%GENERATED from file:home.h => GS2U_HomePlantOperate_Ack
readNetMsg(?CMD_GS2U_HomePlantOperate_Ack,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_operateType, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_reason, Bin3 } = binary_read_uint( Bin2 ),
	{ V_plant, Bin4 } = readPlant( Bin3 ),
	{ #pk_GS2U_HomePlantOperate_Ack {
		roleID = V_roleID,
		operateType = V_operateType,
		reason = V_reason,
		plant = V_plant
		},
	Bin4 };

%GENERATED from file:home.h => GS2U_HomePlant_Sync
readNetMsg(?CMD_GS2U_HomePlant_Sync,Bin0) ->
	{ V_listPlant, Bin1 } = binary_read_array(Bin0, fun(X) -> readPlant( X ) end),
	{ #pk_GS2U_HomePlant_Sync {
		listPlant = V_listPlant
		},
	Bin1 };

%GENERATED from file:home.h => GS2U_HomeVisitList
readNetMsg(?CMD_GS2U_HomeVisitList,Bin0) ->
	{ V_allnumber, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_paga, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_visits, Bin3 } = binary_read_array(Bin2, fun(X) -> readHomeVisit( X ) end),
	{ #pk_GS2U_HomeVisitList {
		allnumber = V_allnumber,
		paga = V_paga,
		visits = V_visits
		},
	Bin3 };

%GENERATED from file:home.h => GS2U_PutOutPetFarmingResults_Sync
readNetMsg(?CMD_GS2U_PutOutPetFarmingResults_Sync,Bin0) ->
	{ V_result, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_petID, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_exp, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_minutes, Bin4 } = binary_read_uint16( Bin3 ),
	{ #pk_GS2U_PutOutPetFarmingResults_Sync {
		result = V_result,
		petID = V_petID,
		exp = V_exp,
		minutes = V_minutes
		},
	Bin4 };

%GENERATED from file:home.h => GS2U_PutPetInFarmingResults_Sync
readNetMsg(?CMD_GS2U_PutPetInFarmingResults_Sync,Bin0) ->
	{ V_result, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_petFarming, Bin2 } = readFarmingPet( Bin1 ),
	{ #pk_GS2U_PutPetInFarmingResults_Sync {
		result = V_result,
		petFarming = V_petFarming
		},
	Bin2 };

%GENERATED from file:home.h => GS2U_VisitRecord
readNetMsg(?CMD_GS2U_VisitRecord,Bin0) ->
	{ V_lists, Bin1 } = binary_read_array(Bin0, fun(X) -> readVisitRecord( X ) end),
	{ #pk_GS2U_VisitRecord {
		lists = V_lists
		},
	Bin1 };

%GENERATED from file:home.h => U2GS_ChangeHomeName
readNetMsg(?CMD_U2GS_ChangeHomeName,Bin0) ->
	{ V_homeID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_homeName, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_U2GS_ChangeHomeName {
		homeID = V_homeID,
		homeName = V_homeName
		},
	Bin2 };

%GENERATED from file:home.h => U2GS_CreateHome
readNetMsg(?CMD_U2GS_CreateHome,Bin0) ->
	{ V_adminAreaID, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_CreateHome {
		adminAreaID = V_adminAreaID
		},
	Bin1 };

%GENERATED from file:home.h => U2GS_EnterHome
readNetMsg(?CMD_U2GS_EnterHome,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_flag, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_EnterHome {
		roleID = V_roleID,
		flag = V_flag
		},
	Bin2 };

%GENERATED from file:home.h => U2GS_GetPetFood
readNetMsg(?CMD_U2GS_GetPetFood,Bin0) ->
	{ V_homeID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_petID, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_itemID, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_areaType, Bin4 } = binary_read_uint8( Bin3 ),
	{ #pk_U2GS_GetPetFood {
		homeID = V_homeID,
		petID = V_petID,
		itemID = V_itemID,
		areaType = V_areaType
		},
	Bin4 };

%GENERATED from file:home.h => U2GS_HomePlantOperate_Request
readNetMsg(?CMD_U2GS_HomePlantOperate_Request,Bin0) ->
	{ V_homeID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_areaType, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_pos, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_operateType, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_itemID, Bin5 } = binary_read_uint16( Bin4 ),
	{ #pk_U2GS_HomePlantOperate_Request {
		homeID = V_homeID,
		areaType = V_areaType,
		pos = V_pos,
		operateType = V_operateType,
		itemID = V_itemID
		},
	Bin5 };

%GENERATED from file:home.h => U2GS_HomeVisit
readNetMsg(?CMD_U2GS_HomeVisit,Bin0) ->
	{ V_paga, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_number, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_HomeVisit {
		paga = V_paga,
		number = V_number
		},
	Bin2 };

%GENERATED from file:home.h => U2GS_PutOutPetFarming
readNetMsg(?CMD_U2GS_PutOutPetFarming,Bin0) ->
	{ V_homeID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_petID, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_areaType, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_U2GS_PutOutPetFarming {
		homeID = V_homeID,
		petID = V_petID,
		areaType = V_areaType
		},
	Bin3 };

%GENERATED from file:home.h => U2GS_PutPetInFarming
readNetMsg(?CMD_U2GS_PutPetInFarming,Bin0) ->
	{ V_homeID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_petID, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_areaType, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_U2GS_PutPetInFarming {
		homeID = V_homeID,
		petID = V_petID,
		areaType = V_areaType
		},
	Bin3 };

%GENERATED from file:home.h => U2GS_RequestHomeInfo
readNetMsg(?CMD_U2GS_RequestHomeInfo,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_RequestHomeInfo {
		roleID = V_roleID
		},
	Bin1 };

%GENERATED from file:home.h => U2GS_RequestVisitRecord
readNetMsg(?CMD_U2GS_RequestVisitRecord,Bin0) ->
	{ #pk_U2GS_RequestVisitRecord {

		},
	Bin0 };

%GENERATED from file:home.h => U2GS_UpgradeHomeArea
readNetMsg(?CMD_U2GS_UpgradeHomeArea,Bin0) ->
	{ V_homeID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_areaID, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_UpgradeHomeArea {
		homeID = V_homeID,
		areaID = V_areaID
		},
	Bin2 };

%GENERATED from file:identity.h => GS2U_GiftHistory_Sync
readNetMsg(?CMD_GS2U_GiftHistory_Sync,Bin0) ->
	{ V_listHistory, Bin1 } = binary_read_array(Bin0, fun(X) -> readGiftHistory( X ) end),
	{ V_nameTables, Bin2 } = binary_read_array(Bin1, fun(X) -> readNameTable( X ) end),
	{ V_listItemID, Bin3 } = binary_read_array(Bin2, fun(X) -> binary_read_uint16( X ) end),
	{ V_listItemCount, Bin4 } = binary_read_array(Bin3, fun(X) -> binary_read_uint16( X ) end),
	{ #pk_GS2U_GiftHistory_Sync {
		listHistory = V_listHistory,
		nameTables = V_nameTables,
		listItemID = V_listItemID,
		listItemCount = V_listItemCount
		},
	Bin4 };

%GENERATED from file:identity.h => GS2U_Gift_Ack
readNetMsg(?CMD_GS2U_Gift_Ack,Bin0) ->
	{ V_history, Bin1 } = readGiftHistory( Bin0 ),
	{ V_nameTables, Bin2 } = binary_read_array(Bin1, fun(X) -> readNameTable( X ) end),
	{ #pk_GS2U_Gift_Ack {
		history = V_history,
		nameTables = V_nameTables
		},
	Bin2 };

%GENERATED from file:identity.h => GS2U_IdentityCharm_Sync
readNetMsg(?CMD_GS2U_IdentityCharm_Sync,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_tarRoleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_valueUpdate, Bin3 } = binary_read_uint( Bin2 ),
	{ V_valueNew, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_GS2U_IdentityCharm_Sync {
		roleID = V_roleID,
		tarRoleID = V_tarRoleID,
		valueUpdate = V_valueUpdate,
		valueNew = V_valueNew
		},
	Bin4 };

%GENERATED from file:identity.h => GS2U_IdentityEditPic_Ack
readNetMsg(?CMD_GS2U_IdentityEditPic_Ack,Bin0) ->
	{ V_idi_listPic, Bin1 } = binary_read_array(Bin0, fun(X) -> readMD5( X ) end),
	{ #pk_GS2U_IdentityEditPic_Ack {
		idi_listPic = V_idi_listPic
		},
	Bin1 };

%GENERATED from file:identity.h => GS2U_IdentityEditTag_Ack
readNetMsg(?CMD_GS2U_IdentityEditTag_Ack,Bin0) ->
	{ V_idi_listTag, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_GS2U_IdentityEditTag_Ack {
		idi_listTag = V_idi_listTag
		},
	Bin1 };

%GENERATED from file:identity.h => GS2U_IdentityLike_Sync
readNetMsg(?CMD_GS2U_IdentityLike_Sync,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_tarRoleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_valueUpdate, Bin3 } = binary_read_uint( Bin2 ),
	{ V_valueNew, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_GS2U_IdentityLike_Sync {
		roleID = V_roleID,
		tarRoleID = V_tarRoleID,
		valueUpdate = V_valueUpdate,
		valueNew = V_valueNew
		},
	Bin4 };

%GENERATED from file:identity.h => GS2U_IdentityPicDownloadData_Ack
readNetMsg(?CMD_GS2U_IdentityPicDownloadData_Ack,Bin0) ->
	{ V_md5, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint8( X ) end),
	{ V_size, Bin2 } = binary_read_uint( Bin1 ),
	{ V_count, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_index, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_data, Bin5 } = binary_read_array(Bin4, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_GS2U_IdentityPicDownloadData_Ack {
		md5 = V_md5,
		size = V_size,
		count = V_count,
		index = V_index,
		data = V_data
		},
	Bin5 };

%GENERATED from file:identity.h => GS2U_IdentityPicDownloadData_Sync
readNetMsg(?CMD_GS2U_IdentityPicDownloadData_Sync,Bin0) ->
	{ V_md5, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint8( X ) end),
	{ V_size, Bin2 } = binary_read_uint( Bin1 ),
	{ V_count, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_index, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_data, Bin5 } = binary_read_array(Bin4, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_GS2U_IdentityPicDownloadData_Sync {
		md5 = V_md5,
		size = V_size,
		count = V_count,
		index = V_index,
		data = V_data
		},
	Bin5 };

%GENERATED from file:identity.h => GS2U_IdentityPicDownloadError_Ack
readNetMsg(?CMD_GS2U_IdentityPicDownloadError_Ack,Bin0) ->
	{ V_md5, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint8( X ) end),
	{ V_error, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_GS2U_IdentityPicDownloadError_Ack {
		md5 = V_md5,
		error = V_error
		},
	Bin2 };

%GENERATED from file:identity.h => GS2U_IdentityPicUpload_Ack
readNetMsg(?CMD_GS2U_IdentityPicUpload_Ack,Bin0) ->
	{ V_md5, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint8( X ) end),
	{ V_isComplete, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_GS2U_IdentityPicUpload_Ack {
		md5 = V_md5,
		isComplete = V_isComplete
		},
	Bin2 };

%GENERATED from file:identity.h => GS2U_Identity_Ack
readNetMsg(?CMD_GS2U_Identity_Ack,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_code, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_name, Bin3 } = binary_read_string( Bin2 ),
	{ V_level, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_career, Bin5 } = binary_read_uint( Bin4 ),
	{ V_race, Bin6 } = binary_read_uint8( Bin5 ),
	{ V_sex, Bin7 } = binary_read_uint8( Bin6 ),
	{ V_vipLv, Bin8 } = binary_read_uint8( Bin7 ),
	{ V_like, Bin9 } = binary_read_uint( Bin8 ),
	{ V_charm, Bin10 } = binary_read_uint( Bin9 ),
	{ V_isGiveLike, Bin11 } = binary_read_bool( Bin10 ),
	{ V_familyName, Bin12 } = binary_read_string( Bin11 ),
	{ V_idi_age, Bin13 } = binary_read_uint8( Bin12 ),
	{ V_idi_birthmonth, Bin14 } = binary_read_uint8( Bin13 ),
	{ V_idi_birthday, Bin15 } = binary_read_uint8( Bin14 ),
	{ V_idi_zodiac, Bin16 } = binary_read_uint8( Bin15 ),
	{ V_idi_bloodType, Bin17 } = binary_read_uint8( Bin16 ),
	{ V_idi_hometown1, Bin18 } = binary_read_uint8( Bin17 ),
	{ V_idi_hometown2, Bin19 } = binary_read_uint8( Bin18 ),
	{ V_idi_location1, Bin20 } = binary_read_uint8( Bin19 ),
	{ V_idi_location2, Bin21 } = binary_read_uint8( Bin20 ),
	{ V_idi_sign, Bin22 } = binary_read_string( Bin21 ),
	{ V_idi_face, Bin23 } = binary_read_array(Bin22, fun(X) -> binary_read_uint8( X ) end),
	{ V_idi_listTag, Bin24 } = binary_read_array(Bin23, fun(X) -> binary_read_uint8( X ) end),
	{ V_idi_listPic, Bin25 } = binary_read_array(Bin24, fun(X) -> readMD5( X ) end),
	{ #pk_GS2U_Identity_Ack {
		id = V_id,
		code = V_code,
		name = V_name,
		level = V_level,
		career = V_career,
		race = V_race,
		sex = V_sex,
		vipLv = V_vipLv,
		like = V_like,
		charm = V_charm,
		isGiveLike = V_isGiveLike,
		familyName = V_familyName,
		idi_age = V_idi_age,
		idi_birthmonth = V_idi_birthmonth,
		idi_birthday = V_idi_birthday,
		idi_zodiac = V_idi_zodiac,
		idi_bloodType = V_idi_bloodType,
		idi_hometown1 = V_idi_hometown1,
		idi_hometown2 = V_idi_hometown2,
		idi_location1 = V_idi_location1,
		idi_location2 = V_idi_location2,
		idi_sign = V_idi_sign,
		idi_face = V_idi_face,
		idi_listTag = V_idi_listTag,
		idi_listPic = V_idi_listPic
		},
	Bin25 };

%GENERATED from file:identity.h => U2GS2U_IdentityEditAge
readNetMsg(?CMD_U2GS2U_IdentityEditAge,Bin0) ->
	{ V_idi_age, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS2U_IdentityEditAge {
		idi_age = V_idi_age
		},
	Bin1 };

%GENERATED from file:identity.h => U2GS2U_IdentityEditBirth
readNetMsg(?CMD_U2GS2U_IdentityEditBirth,Bin0) ->
	{ V_idi_birthmonth, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_idi_birthday, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS2U_IdentityEditBirth {
		idi_birthmonth = V_idi_birthmonth,
		idi_birthday = V_idi_birthday
		},
	Bin2 };

%GENERATED from file:identity.h => U2GS2U_IdentityEditBloodType
readNetMsg(?CMD_U2GS2U_IdentityEditBloodType,Bin0) ->
	{ V_idi_bloodType, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS2U_IdentityEditBloodType {
		idi_bloodType = V_idi_bloodType
		},
	Bin1 };

%GENERATED from file:identity.h => U2GS2U_IdentityEditFace
readNetMsg(?CMD_U2GS2U_IdentityEditFace,Bin0) ->
	{ V_idi_face, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_U2GS2U_IdentityEditFace {
		idi_face = V_idi_face
		},
	Bin1 };

%GENERATED from file:identity.h => U2GS2U_IdentityEditHometown
readNetMsg(?CMD_U2GS2U_IdentityEditHometown,Bin0) ->
	{ V_idi_hometown1, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_idi_hometown2, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS2U_IdentityEditHometown {
		idi_hometown1 = V_idi_hometown1,
		idi_hometown2 = V_idi_hometown2
		},
	Bin2 };

%GENERATED from file:identity.h => U2GS2U_IdentityEditLocation
readNetMsg(?CMD_U2GS2U_IdentityEditLocation,Bin0) ->
	{ V_idi_location1, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_idi_location2, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS2U_IdentityEditLocation {
		idi_location1 = V_idi_location1,
		idi_location2 = V_idi_location2
		},
	Bin2 };

%GENERATED from file:identity.h => U2GS2U_IdentityEditSign
readNetMsg(?CMD_U2GS2U_IdentityEditSign,Bin0) ->
	{ V_idi_sign, Bin1 } = binary_read_string( Bin0 ),
	{ #pk_U2GS2U_IdentityEditSign {
		idi_sign = V_idi_sign
		},
	Bin1 };

%GENERATED from file:identity.h => U2GS2U_IdentityEditZodiac
readNetMsg(?CMD_U2GS2U_IdentityEditZodiac,Bin0) ->
	{ V_idi_zodiac, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS2U_IdentityEditZodiac {
		idi_zodiac = V_idi_zodiac
		},
	Bin1 };

%GENERATED from file:identity.h => U2GS2U_RequestRoleHeadPic
readNetMsg(?CMD_U2GS2U_RequestRoleHeadPic,Bin0) ->
	{ V_heads, Bin1 } = binary_read_array(Bin0, fun(X) -> readRoleHeadPic( X ) end),
	{ #pk_U2GS2U_RequestRoleHeadPic {
		heads = V_heads
		},
	Bin1 };

%GENERATED from file:identity.h => U2GS_Gift_Request
readNetMsg(?CMD_U2GS_Gift_Request,Bin0) ->
	{ V_tarRoleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_itemID, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_itemCount, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_content, Bin4 } = binary_read_string( Bin3 ),
	{ #pk_U2GS_Gift_Request {
		tarRoleID = V_tarRoleID,
		itemID = V_itemID,
		itemCount = V_itemCount,
		content = V_content
		},
	Bin4 };

%GENERATED from file:identity.h => U2GS_IdentityEditTagAdd_Request
readNetMsg(?CMD_U2GS_IdentityEditTagAdd_Request,Bin0) ->
	{ V_idi_listTag, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_U2GS_IdentityEditTagAdd_Request {
		idi_listTag = V_idi_listTag
		},
	Bin1 };

%GENERATED from file:identity.h => U2GS_IdentityEditTagDel_Request
readNetMsg(?CMD_U2GS_IdentityEditTagDel_Request,Bin0) ->
	{ V_idi_tag, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_IdentityEditTagDel_Request {
		idi_tag = V_idi_tag
		},
	Bin1 };

%GENERATED from file:identity.h => U2GS_IdentityPicDownloadBegin_Request
readNetMsg(?CMD_U2GS_IdentityPicDownloadBegin_Request,Bin0) ->
	{ V_md5, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint8( X ) end),
	{ V_id, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_U2GS_IdentityPicDownloadBegin_Request {
		md5 = V_md5,
		id = V_id
		},
	Bin2 };

%GENERATED from file:identity.h => U2GS_IdentityPicDownloadContinue_Request
readNetMsg(?CMD_U2GS_IdentityPicDownloadContinue_Request,Bin0) ->
	{ V_md5, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_U2GS_IdentityPicDownloadContinue_Request {
		md5 = V_md5
		},
	Bin1 };

%GENERATED from file:identity.h => U2GS_IdentityPicUploadBegin_Request
readNetMsg(?CMD_U2GS_IdentityPicUploadBegin_Request,Bin0) ->
	{ V_md5, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint8( X ) end),
	{ V_size, Bin2 } = binary_read_uint( Bin1 ),
	{ V_opType, Bin3 } = binary_read_bool( Bin2 ),
	{ V_pos, Bin4 } = binary_read_uint8( Bin3 ),
	{ #pk_U2GS_IdentityPicUploadBegin_Request {
		md5 = V_md5,
		size = V_size,
		opType = V_opType,
		pos = V_pos
		},
	Bin4 };

%GENERATED from file:identity.h => U2GS_IdentityPicUploadData_Request
readNetMsg(?CMD_U2GS_IdentityPicUploadData_Request,Bin0) ->
	{ V_md5, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint8( X ) end),
	{ V_count, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_index, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_data, Bin4 } = binary_read_array(Bin3, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_U2GS_IdentityPicUploadData_Request {
		md5 = V_md5,
		count = V_count,
		index = V_index,
		data = V_data
		},
	Bin4 };

%GENERATED from file:identity.h => U2GS_Identity_Request
readNetMsg(?CMD_U2GS_Identity_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_Identity_Request {
		id = V_id
		},
	Bin1 };

%GENERATED from file:item.h => GS2U_BuyItemQuotaNumber
readNetMsg(?CMD_GS2U_BuyItemQuotaNumber,Bin0) ->
	{ V_itemid, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_quotaNumber, Bin2 } = binary_read_int( Bin1 ),
	{ #pk_GS2U_BuyItemQuotaNumber {
		itemid = V_itemid,
		quotaNumber = V_quotaNumber
		},
	Bin2 };

%GENERATED from file:item.h => GS2U_LookInfoItemListAtMall
readNetMsg(?CMD_GS2U_LookInfoItemListAtMall,Bin0) ->
	{ V_item_list, Bin1 } = binary_read_array(Bin0, fun(X) -> readLookInfoItemAtMall( X ) end),
	{ #pk_GS2U_LookInfoItemListAtMall {
		item_list = V_item_list
		},
	Bin1 };

%GENERATED from file:item.h => GS2U_LookInfoItemListAtNpcStore
readNetMsg(?CMD_GS2U_LookInfoItemListAtNpcStore,Bin0) ->
	{ V_storeType, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_item_list, Bin2 } = binary_read_array(Bin1, fun(X) -> readLookInfoItem( X ) end),
	{ #pk_GS2U_LookInfoItemListAtNpcStore {
		storeType = V_storeType,
		item_list = V_item_list
		},
	Bin2 };

%GENERATED from file:item.h => GS2U_MysteriousShop
readNetMsg(?CMD_GS2U_MysteriousShop,Bin0) ->
	{ V_lvlPhase, Bin1 } = binary_read_uint( Bin0 ),
	{ V_residueTime, Bin2 } = binary_read_uint( Bin1 ),
	{ V_items, Bin3 } = binary_read_array(Bin2, fun(X) -> readMysteriousShopItem( X ) end),
	{ V_freshMSShopDaimond, Bin4 } = binary_read_int( Bin3 ),
	{ #pk_GS2U_MysteriousShop {
		lvlPhase = V_lvlPhase,
		residueTime = V_residueTime,
		items = V_items,
		freshMSShopDaimond = V_freshMSShopDaimond
		},
	Bin4 };

%GENERATED from file:item.h => GS2U_SingleUseItem
readNetMsg(?CMD_GS2U_SingleUseItem,Bin0) ->
	{ V_itemID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_SingleUseItem {
		itemID = V_itemID
		},
	Bin1 };

%GENERATED from file:item.h => GS2U_UseItem
readNetMsg(?CMD_GS2U_UseItem,Bin0) ->
	{ V_vctUseItem, Bin1 } = binary_read_array(Bin0, fun(X) -> readUseItemCD( X ) end),
	{ #pk_GS2U_UseItem {
		vctUseItem = V_vctUseItem
		},
	Bin1 };

%GENERATED from file:item.h => GS2U_UseItemExpInDanResult
readNetMsg(?CMD_GS2U_UseItemExpInDanResult,Bin0) ->
	{ V_expInDanType, Bin1 } = binary_read_uint( Bin0 ),
	{ V_remainTime, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_UseItemExpInDanResult {
		expInDanType = V_expInDanType,
		remainTime = V_remainTime
		},
	Bin2 };

%GENERATED from file:item.h => GS2U_UseItemGainGoodsTips
readNetMsg(?CMD_GS2U_UseItemGainGoodsTips,Bin0) ->
	{ V_listTips, Bin1 } = binary_read_array(Bin0, fun(X) -> readUseItemGainGoodsTips( X ) end),
	{ #pk_GS2U_UseItemGainGoodsTips {
		listTips = V_listTips
		},
	Bin1 };

%GENERATED from file:item.h => GS2U_UseItemResult
readNetMsg(?CMD_GS2U_UseItemResult,Bin0) ->
	{ V_itemID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_itemNum, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_result, Bin3 } = binary_read_int( Bin2 ),
	{ #pk_GS2U_UseItemResult {
		itemID = V_itemID,
		itemNum = V_itemNum,
		result = V_result
		},
	Bin3 };

%GENERATED from file:item.h => RefindResList
readNetMsg(?CMD_RefindResList,Bin0) ->
	{ V_resList, Bin1 } = binary_read_array(Bin0, fun(X) -> readRefindResInfo( X ) end),
	{ #pk_RefindResList {
		resList = V_resList
		},
	Bin1 };

%GENERATED from file:item.h => U2GS_BuyItemAtGuildShopRequest
readNetMsg(?CMD_U2GS_BuyItemAtGuildShopRequest,Bin0) ->
	{ V_itemid, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_number, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_U2GS_BuyItemAtGuildShopRequest {
		itemid = V_itemid,
		number = V_number
		},
	Bin2 };

%GENERATED from file:item.h => U2GS_BuyItemAtMallRequest
readNetMsg(?CMD_U2GS_BuyItemAtMallRequest,Bin0) ->
	{ V_itemid, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_number, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_U2GS_BuyItemAtMallRequest {
		itemid = V_itemid,
		number = V_number
		},
	Bin2 };

%GENERATED from file:item.h => U2GS_BuyItemAtNpcStoreRequest
readNetMsg(?CMD_U2GS_BuyItemAtNpcStoreRequest,Bin0) ->
	{ V_npccode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_itemid, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_number, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_U2GS_BuyItemAtNpcStoreRequest {
		npccode = V_npccode,
		itemid = V_itemid,
		number = V_number
		},
	Bin3 };

%GENERATED from file:item.h => U2GS_BuyItemAtShopIDRequest
readNetMsg(?CMD_U2GS_BuyItemAtShopIDRequest,Bin0) ->
	{ V_shopID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_itemid, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_number, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_U2GS_BuyItemAtShopIDRequest {
		shopID = V_shopID,
		itemid = V_itemid,
		number = V_number
		},
	Bin3 };

%GENERATED from file:item.h => U2GS_BuyMysteriousShopItem
readNetMsg(?CMD_U2GS_BuyMysteriousShopItem,Bin0) ->
	{ V_lvlPhase, Bin1 } = binary_read_uint( Bin0 ),
	{ V_buynumber, Bin2 } = binary_read_uint( Bin1 ),
	{ V_only_id, Bin3 } = binary_read_uint( Bin2 ),
	{ V_itemid, Bin4 } = binary_read_uint16( Bin3 ),
	{ #pk_U2GS_BuyMysteriousShopItem {
		lvlPhase = V_lvlPhase,
		buynumber = V_buynumber,
		only_id = V_only_id,
		itemid = V_itemid
		},
	Bin4 };

%GENERATED from file:item.h => U2GS_ConvenientBuyItem
readNetMsg(?CMD_U2GS_ConvenientBuyItem,Bin0) ->
	{ V_itemid, Bin1 } = binary_read_uint( Bin0 ),
	{ V_buynumber, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_ConvenientBuyItem {
		itemid = V_itemid,
		buynumber = V_buynumber
		},
	Bin2 };

%GENERATED from file:item.h => U2GS_FreshMSShop
readNetMsg(?CMD_U2GS_FreshMSShop,Bin0) ->
	{ #pk_U2GS_FreshMSShop {

		},
	Bin0 };

%GENERATED from file:item.h => U2GS_LookInfoItemListAtMall
readNetMsg(?CMD_U2GS_LookInfoItemListAtMall,Bin0) ->
	{ #pk_U2GS_LookInfoItemListAtMall {

		},
	Bin0 };

%GENERATED from file:item.h => U2GS_LookInfoItemListAtNpcStore
readNetMsg(?CMD_U2GS_LookInfoItemListAtNpcStore,Bin0) ->
	{ V_npccode, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_LookInfoItemListAtNpcStore {
		npccode = V_npccode
		},
	Bin1 };

%GENERATED from file:item.h => U2GS_LookInfoItemListAtShopID
readNetMsg(?CMD_U2GS_LookInfoItemListAtShopID,Bin0) ->
	{ V_shopID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_LookInfoItemListAtShopID {
		shopID = V_shopID
		},
	Bin1 };

%GENERATED from file:item.h => U2GS_RefindResAll
readNetMsg(?CMD_U2GS_RefindResAll,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_RefindResAll {
		type = V_type
		},
	Bin1 };

%GENERATED from file:item.h => U2GS_RefindResOne
readNetMsg(?CMD_U2GS_RefindResOne,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_type, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_RefindResOne {
		id = V_id,
		type = V_type
		},
	Bin2 };

%GENERATED from file:item.h => U2GS_RequestMysteriousShop
readNetMsg(?CMD_U2GS_RequestMysteriousShop,Bin0) ->
	{ #pk_U2GS_RequestMysteriousShop {

		},
	Bin0 };

%GENERATED from file:item.h => U2GS_UseStarMoonBox
readNetMsg(?CMD_U2GS_UseStarMoonBox,Bin0) ->
	{ V_itemUID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_useNum, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_U2GS_UseStarMoonBox {
		itemUID = V_itemUID,
		useNum = V_useNum
		},
	Bin2 };

%GENERATED from file:luckycoin.h => GS2U_GainLuckyCoin
readNetMsg(?CMD_GS2U_GainLuckyCoin,Bin0) ->
	{ V_gainLuckyCoinInfo, Bin1 } = readGainLuckyCoinInfo( Bin0 ),
	{ V_count, Bin2 } = binary_read_int( Bin1 ),
	{ V_time, Bin3 } = binary_read_uint64( Bin2 ),
	{ #pk_GS2U_GainLuckyCoin {
		gainLuckyCoinInfo = V_gainLuckyCoinInfo,
		count = V_count,
		time = V_time
		},
	Bin3 };

%GENERATED from file:luckycoin.h => GS2U_GiveLuckyCoinResult
readNetMsg(?CMD_GS2U_GiveLuckyCoinResult,Bin0) ->
	{ V_friendID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_result, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_GS2U_GiveLuckyCoinResult {
		friendID = V_friendID,
		result = V_result
		},
	Bin2 };

%GENERATED from file:luckycoin.h => GS2U_InitGainLuckyCoinInfo
readNetMsg(?CMD_GS2U_InitGainLuckyCoinInfo,Bin0) ->
	{ V_gainLuckyCoinInfoList, Bin1 } = binary_read_array(Bin0, fun(X) -> readGainLuckyCoinInfo( X ) end),
	{ V_count, Bin2 } = binary_read_int( Bin1 ),
	{ V_time, Bin3 } = binary_read_uint64( Bin2 ),
	{ #pk_GS2U_InitGainLuckyCoinInfo {
		gainLuckyCoinInfoList = V_gainLuckyCoinInfoList,
		count = V_count,
		time = V_time
		},
	Bin3 };

%GENERATED from file:luckycoin.h => GS2U_LuckyDrawResult
readNetMsg(?CMD_GS2U_LuckyDrawResult,Bin0) ->
	{ V_itemID, Bin1 } = binary_read_int( Bin0 ),
	{ V_count, Bin2 } = binary_read_int( Bin1 ),
	{ V_time, Bin3 } = binary_read_uint64( Bin2 ),
	{ #pk_GS2U_LuckyDrawResult {
		itemID = V_itemID,
		count = V_count,
		time = V_time
		},
	Bin3 };

%GENERATED from file:luckycoin.h => U2GS_GiveLuckyCoin
readNetMsg(?CMD_U2GS_GiveLuckyCoin,Bin0) ->
	{ V_friendID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_GiveLuckyCoin {
		friendID = V_friendID
		},
	Bin1 };

%GENERATED from file:luckycoin.h => U2GS_LuckyDraw
readNetMsg(?CMD_U2GS_LuckyDraw,Bin0) ->
	{ #pk_U2GS_LuckyDraw {

		},
	Bin0 };

%GENERATED from file:luckycoin.h => U2GS_LuckyDrawEnd
readNetMsg(?CMD_U2GS_LuckyDrawEnd,Bin0) ->
	{ #pk_U2GS_LuckyDrawEnd {

		},
	Bin0 };

%GENERATED from file:luckycoin.h => U2GS_OneKeyGiveLucky
readNetMsg(?CMD_U2GS_OneKeyGiveLucky,Bin0) ->
	{ #pk_U2GS_OneKeyGiveLucky {

		},
	Bin0 };

%GENERATED from file:mail.h => GS2U_DelMailCoin
readNetMsg(?CMD_GS2U_DelMailCoin,Bin0) ->
	{ V_mailID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_GS2U_DelMailCoin {
		mailID = V_mailID
		},
	Bin1 };

%GENERATED from file:mail.h => GS2U_DelMailItem
readNetMsg(?CMD_GS2U_DelMailItem,Bin0) ->
	{ V_mailID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_itemUID, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_DelMailItem {
		mailID = V_mailID,
		itemUID = V_itemUID
		},
	Bin2 };

%GENERATED from file:mail.h => GS2U_DeleteMail
readNetMsg(?CMD_GS2U_DeleteMail,Bin0) ->
	{ V_mailID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_GS2U_DeleteMail {
		mailID = V_mailID
		},
	Bin1 };

%GENERATED from file:mail.h => GS2U_GetMailItemAll
readNetMsg(?CMD_GS2U_GetMailItemAll,Bin0) ->
	{ V_number, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_items, Bin2 } = binary_read_array(Bin1, fun(X) -> readMailItemAll( X ) end),
	{ V_coins, Bin3 } = binary_read_array(Bin2, fun(X) -> readMailCoin( X ) end),
	{ #pk_GS2U_GetMailItemAll {
		number = V_number,
		items = V_items,
		coins = V_coins
		},
	Bin3 };

%GENERATED from file:mail.h => GS2U_LockMail
readNetMsg(?CMD_GS2U_LockMail,Bin0) ->
	{ V_ret, Bin1 } = readretMailOpt( Bin0 ),
	{ #pk_GS2U_LockMail {
		ret = V_ret
		},
	Bin1 };

%GENERATED from file:mail.h => GS2U_Mail
readNetMsg(?CMD_GS2U_Mail,Bin0) ->
	{ V_detail, Bin1 } = readMailDetail( Bin0 ),
	{ #pk_GS2U_Mail {
		detail = V_detail
		},
	Bin1 };

%GENERATED from file:mail.h => GS2U_MailInfo
readNetMsg(?CMD_GS2U_MailInfo,Bin0) ->
	{ V_mailInfoList, Bin1 } = binary_read_array(Bin0, fun(X) -> readMailInfo( X ) end),
	{ #pk_GS2U_MailInfo {
		mailInfoList = V_mailInfoList
		},
	Bin1 };

%GENERATED from file:mail.h => GS2U_SendMailAck
readNetMsg(?CMD_GS2U_SendMailAck,Bin0) ->
	{ V_toRoleName, Bin1 } = binary_read_string( Bin0 ),
	{ V_isOK, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_GS2U_SendMailAck {
		toRoleName = V_toRoleName,
		isOK = V_isOK
		},
	Bin2 };

%GENERATED from file:mail.h => GS2U_UnlockMail
readNetMsg(?CMD_GS2U_UnlockMail,Bin0) ->
	{ V_ret, Bin1 } = readretMailOpt( Bin0 ),
	{ #pk_GS2U_UnlockMail {
		ret = V_ret
		},
	Bin1 };

%GENERATED from file:mail.h => U2GS_DeleteAllReadMail
readNetMsg(?CMD_U2GS_DeleteAllReadMail,Bin0) ->
	{ #pk_U2GS_DeleteAllReadMail {

		},
	Bin0 };

%GENERATED from file:mail.h => U2GS_DeleteMail
readNetMsg(?CMD_U2GS_DeleteMail,Bin0) ->
	{ V_mailID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_DeleteMail {
		mailID = V_mailID
		},
	Bin1 };

%GENERATED from file:mail.h => U2GS_GetMailCoin
readNetMsg(?CMD_U2GS_GetMailCoin,Bin0) ->
	{ V_mailID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_GetMailCoin {
		mailID = V_mailID
		},
	Bin1 };

%GENERATED from file:mail.h => U2GS_GetMailItem
readNetMsg(?CMD_U2GS_GetMailItem,Bin0) ->
	{ V_mailID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_itemUID, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_U2GS_GetMailItem {
		mailID = V_mailID,
		itemUID = V_itemUID
		},
	Bin2 };

%GENERATED from file:mail.h => U2GS_GetMailItemAll
readNetMsg(?CMD_U2GS_GetMailItemAll,Bin0) ->
	{ #pk_U2GS_GetMailItemAll {

		},
	Bin0 };

%GENERATED from file:mail.h => U2GS_LockMail
readNetMsg(?CMD_U2GS_LockMail,Bin0) ->
	{ V_mailID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_LockMail {
		mailID = V_mailID
		},
	Bin1 };

%GENERATED from file:mail.h => U2GS_ReadMail
readNetMsg(?CMD_U2GS_ReadMail,Bin0) ->
	{ V_mailID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_ReadMail {
		mailID = V_mailID
		},
	Bin1 };

%GENERATED from file:mail.h => U2GS_SendMail
readNetMsg(?CMD_U2GS_SendMail,Bin0) ->
	{ V_toRoleName, Bin1 } = binary_read_string( Bin0 ),
	{ V_mailTitle, Bin2 } = binary_read_string( Bin1 ),
	{ V_mailContent, Bin3 } = binary_read_string( Bin2 ),
	{ #pk_U2GS_SendMail {
		toRoleName = V_toRoleName,
		mailTitle = V_mailTitle,
		mailContent = V_mailContent
		},
	Bin3 };

%GENERATED from file:mail.h => U2GS_UnlockMail
readNetMsg(?CMD_U2GS_UnlockMail,Bin0) ->
	{ V_mailID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_UnlockMail {
		mailID = V_mailID
		},
	Bin1 };

%GENERATED from file:mall.h => GS2U_MallBuyResult
readNetMsg(?CMD_GS2U_MallBuyResult,Bin0) ->
	{ V_db_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_buyCount, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_MallBuyResult {
		db_id = V_db_id,
		buyCount = V_buyCount
		},
	Bin2 };

%GENERATED from file:mall.h => GS2U_MallBuyResult2
readNetMsg(?CMD_GS2U_MallBuyResult2,Bin0) ->
	{ V_db_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_buyCount, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_MallBuyResult2 {
		db_id = V_db_id,
		buyCount = V_buyCount
		},
	Bin2 };

%GENERATED from file:mall.h => GS2U_MallInfoList
readNetMsg(?CMD_GS2U_MallInfoList,Bin0) ->
	{ V_seed, Bin1 } = binary_read_int( Bin0 ),
	{ V_mallinfolist, Bin2 } = binary_read_array(Bin1, fun(X) -> readMallInfo( X ) end),
	{ #pk_GS2U_MallInfoList {
		seed = V_seed,
		mallinfolist = V_mallinfolist
		},
	Bin2 };

%GENERATED from file:mall.h => GS2U_MallInfoList2
readNetMsg(?CMD_GS2U_MallInfoList2,Bin0) ->
	{ V_seed, Bin1 } = binary_read_int( Bin0 ),
	{ V_mallinfolist, Bin2 } = binary_read_array(Bin1, fun(X) -> readMallInfo( X ) end),
	{ #pk_GS2U_MallInfoList2 {
		seed = V_seed,
		mallinfolist = V_mallinfolist
		},
	Bin2 };

%GENERATED from file:mall.h => GS2U_MallPriceList
readNetMsg(?CMD_GS2U_MallPriceList,Bin0) ->
	{ V_mallinfolist, Bin1 } = binary_read_array(Bin0, fun(X) -> readMallInfo( X ) end),
	{ #pk_GS2U_MallPriceList {
		mallinfolist = V_mallinfolist
		},
	Bin1 };

%GENERATED from file:mall.h => GS2U_MallPriceList2
readNetMsg(?CMD_GS2U_MallPriceList2,Bin0) ->
	{ V_mallinfolist, Bin1 } = binary_read_array(Bin0, fun(X) -> readMallInfo( X ) end),
	{ #pk_GS2U_MallPriceList2 {
		mallinfolist = V_mallinfolist
		},
	Bin1 };

%GENERATED from file:mall.h => U2GS_ItemBuyRequest
readNetMsg(?CMD_U2GS_ItemBuyRequest,Bin0) ->
	{ V_db_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_itemid, Bin2 } = binary_read_uint( Bin1 ),
	{ V_itemnum, Bin3 } = binary_read_int( Bin2 ),
	{ V_moneytype, Bin4 } = binary_read_int8( Bin3 ),
	{ V_tarRoleID, Bin5 } = binary_read_uint64( Bin4 ),
	{ #pk_U2GS_ItemBuyRequest {
		db_id = V_db_id,
		itemid = V_itemid,
		itemnum = V_itemnum,
		moneytype = V_moneytype,
		tarRoleID = V_tarRoleID
		},
	Bin5 };

%GENERATED from file:mall.h => U2GS_ItemBuyRequest2
readNetMsg(?CMD_U2GS_ItemBuyRequest2,Bin0) ->
	{ V_db_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_itemid, Bin2 } = binary_read_uint( Bin1 ),
	{ V_itemnum, Bin3 } = binary_read_int( Bin2 ),
	{ V_moneytype, Bin4 } = binary_read_int8( Bin3 ),
	{ #pk_U2GS_ItemBuyRequest2 {
		db_id = V_db_id,
		itemid = V_itemid,
		itemnum = V_itemnum,
		moneytype = V_moneytype
		},
	Bin4 };

%GENERATED from file:mall.h => U2GS_MallInfo
readNetMsg(?CMD_U2GS_MallInfo,Bin0) ->
	{ V_seed, Bin1 } = binary_read_int( Bin0 ),
	{ #pk_U2GS_MallInfo {
		seed = V_seed
		},
	Bin1 };

%GENERATED from file:mall.h => U2GS_MallInfo2
readNetMsg(?CMD_U2GS_MallInfo2,Bin0) ->
	{ V_seed, Bin1 } = binary_read_int( Bin0 ),
	{ #pk_U2GS_MallInfo2 {
		seed = V_seed
		},
	Bin1 };

%GENERATED from file:marriage.h => GS2U_MarriageBaseInfo_Sync
readNetMsg(?CMD_GS2U_MarriageBaseInfo_Sync,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ V_sex, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_weddingDay, Bin4 } = binary_read_uint( Bin3 ),
	{ V_closeness, Bin5 } = binary_read_uint( Bin4 ),
	{ #pk_GS2U_MarriageBaseInfo_Sync {
		id = V_id,
		name = V_name,
		sex = V_sex,
		weddingDay = V_weddingDay,
		closeness = V_closeness
		},
	Bin5 };

%GENERATED from file:marriage.h => GS2U_MarriageBreak_Ack
readNetMsg(?CMD_GS2U_MarriageBreak_Ack,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_GS2U_MarriageBreak_Ack {
		id = V_id,
		name = V_name
		},
	Bin2 };

%GENERATED from file:marriage.h => GS2U_MarriageProposeRefresh_Ack
readNetMsg(?CMD_GS2U_MarriageProposeRefresh_Ack,Bin0) ->
	{ #pk_GS2U_MarriageProposeRefresh_Ack {

		},
	Bin0 };

%GENERATED from file:marriage.h => GS2U_MarriagePropose_Ack
readNetMsg(?CMD_GS2U_MarriagePropose_Ack,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ V_item, Bin3 } = binary_read_uint( Bin2 ),
	{ V_isS, Bin4 } = binary_read_bool( Bin3 ),
	{ #pk_GS2U_MarriagePropose_Ack {
		id = V_id,
		name = V_name,
		item = V_item,
		isS = V_isS
		},
	Bin4 };

%GENERATED from file:marriage.h => GS2U_MarriagePropose_Ask
readNetMsg(?CMD_GS2U_MarriagePropose_Ask,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ V_item, Bin3 } = binary_read_uint( Bin2 ),
	{ V_manifesto, Bin4 } = binary_read_string( Bin3 ),
	{ #pk_GS2U_MarriagePropose_Ask {
		id = V_id,
		name = V_name,
		item = V_item,
		manifesto = V_manifesto
		},
	Bin4 };

%GENERATED from file:marriage.h => GS2U_MarriageRingUpPartner_Sync
readNetMsg(?CMD_GS2U_MarriageRingUpPartner_Sync,Bin0) ->
	{ V_topOld, Bin1 } = binary_read_uint( Bin0 ),
	{ V_expOld, Bin2 } = binary_read_uint( Bin1 ),
	{ V_lvOld, Bin3 } = binary_read_uint( Bin2 ),
	{ V_topNew, Bin4 } = binary_read_uint( Bin3 ),
	{ V_expNew, Bin5 } = binary_read_uint( Bin4 ),
	{ V_lvNew, Bin6 } = binary_read_uint( Bin5 ),
	{ #pk_GS2U_MarriageRingUpPartner_Sync {
		topOld = V_topOld,
		expOld = V_expOld,
		lvOld = V_lvOld,
		topNew = V_topNew,
		expNew = V_expNew,
		lvNew = V_lvNew
		},
	Bin6 };

%GENERATED from file:marriage.h => GS2U_MarriageRingUp_Sync
readNetMsg(?CMD_GS2U_MarriageRingUp_Sync,Bin0) ->
	{ V_topOld, Bin1 } = binary_read_uint( Bin0 ),
	{ V_expOld, Bin2 } = binary_read_uint( Bin1 ),
	{ V_lvOld, Bin3 } = binary_read_uint( Bin2 ),
	{ V_topNew, Bin4 } = binary_read_uint( Bin3 ),
	{ V_expNew, Bin5 } = binary_read_uint( Bin4 ),
	{ V_lvNew, Bin6 } = binary_read_uint( Bin5 ),
	{ #pk_GS2U_MarriageRingUp_Sync {
		topOld = V_topOld,
		expOld = V_expOld,
		lvOld = V_lvOld,
		topNew = V_topNew,
		expNew = V_expNew,
		lvNew = V_lvNew
		},
	Bin6 };

%GENERATED from file:marriage.h => GS2U_MarriageSkillUp_Ack
readNetMsg(?CMD_GS2U_MarriageSkillUp_Ack,Bin0) ->
	{ V_skill, Bin1 } = readSkillInfoForMarraige( Bin0 ),
	{ V_lvOld, Bin2 } = binary_read_uint( Bin1 ),
	{ V_lvNew, Bin3 } = binary_read_uint( Bin2 ),
	{ V_expOld, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_GS2U_MarriageSkillUp_Ack {
		skill = V_skill,
		lvOld = V_lvOld,
		lvNew = V_lvNew,
		expOld = V_expOld
		},
	Bin4 };

%GENERATED from file:marriage.h => GS2U_MarriageSkill_Sync
readNetMsg(?CMD_GS2U_MarriageSkill_Sync,Bin0) ->
	{ V_listSkill, Bin1 } = binary_read_array(Bin0, fun(X) -> readSkillInfoForMarraige( X ) end),
	{ #pk_GS2U_MarriageSkill_Sync {
		listSkill = V_listSkill
		},
	Bin1 };

%GENERATED from file:marriage.h => U2GS_MarriageAcceptTask_Request
readNetMsg(?CMD_U2GS_MarriageAcceptTask_Request,Bin0) ->
	{ #pk_U2GS_MarriageAcceptTask_Request {

		},
	Bin0 };

%GENERATED from file:marriage.h => U2GS_MarriageBreak_Request
readNetMsg(?CMD_U2GS_MarriageBreak_Request,Bin0) ->
	{ V_isTeam, Bin1 } = binary_read_bool( Bin0 ),
	{ #pk_U2GS_MarriageBreak_Request {
		isTeam = V_isTeam
		},
	Bin1 };

%GENERATED from file:marriage.h => U2GS_MarriagePropose_Reply
readNetMsg(?CMD_U2GS_MarriagePropose_Reply,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_isAgreed, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_U2GS_MarriagePropose_Reply {
		id = V_id,
		isAgreed = V_isAgreed
		},
	Bin2 };

%GENERATED from file:marriage.h => U2GS_MarriagePropose_Request
readNetMsg(?CMD_U2GS_MarriagePropose_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_item, Bin2 } = binary_read_uint( Bin1 ),
	{ V_manifesto, Bin3 } = binary_read_string( Bin2 ),
	{ #pk_U2GS_MarriagePropose_Request {
		id = V_id,
		item = V_item,
		manifesto = V_manifesto
		},
	Bin3 };

%GENERATED from file:marriage.h => U2GS_MarriageRingUp_Request
readNetMsg(?CMD_U2GS_MarriageRingUp_Request,Bin0) ->
	{ V_cost, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_MarriageRingUp_Request {
		cost = V_cost
		},
	Bin1 };

%GENERATED from file:marriage.h => U2GS_MarriageSkillUp_Request
readNetMsg(?CMD_U2GS_MarriageSkillUp_Request,Bin0) ->
	{ V_cost, Bin1 } = binary_read_uint( Bin0 ),
	{ V_id, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_MarriageSkillUp_Request {
		cost = V_cost,
		id = V_id
		},
	Bin2 };

%GENERATED from file:marriage.h => U2GS_MarriageSubmitTask_Request
readNetMsg(?CMD_U2GS_MarriageSubmitTask_Request,Bin0) ->
	{ #pk_U2GS_MarriageSubmitTask_Request {

		},
	Bin0 };

%GENERATED from file:mount.h => GS2U_LookMountInfo
readNetMsg(?CMD_GS2U_LookMountInfo,Bin0) ->
	{ V_mountInfo, Bin1 } = readMountInfo( Bin0 ),
	{ #pk_GS2U_LookMountInfo {
		mountInfo = V_mountInfo
		},
	Bin1 };

%GENERATED from file:mount.h => GS2U_MountAck
readNetMsg(?CMD_GS2U_MountAck,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_shape_id, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_opreate, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GS2U_MountAck {
		code = V_code,
		shape_id = V_shape_id,
		opreate = V_opreate
		},
	Bin3 };

%GENERATED from file:mount.h => GS2U_MountShapeList
readNetMsg(?CMD_GS2U_MountShapeList,Bin0) ->
	{ V_shape_list, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint16( X ) end),
	{ #pk_GS2U_MountShapeList {
		shape_list = V_shape_list
		},
	Bin1 };

%GENERATED from file:mount.h => GS2U_NewMountShape
readNetMsg(?CMD_GS2U_NewMountShape,Bin0) ->
	{ V_new_shape_id, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_NewMountShape {
		new_shape_id = V_new_shape_id
		},
	Bin1 };

%GENERATED from file:mount.h => MountShapeShift
readNetMsg(?CMD_MountShapeShift,Bin0) ->
	{ V_new_shape_id, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_MountShapeShift {
		new_shape_id = V_new_shape_id
		},
	Bin1 };

%GENERATED from file:mount.h => U2GS_FeedMount
readNetMsg(?CMD_U2GS_FeedMount,Bin0) ->
	{ V_feedNum, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_FeedMount {
		feedNum = V_feedNum
		},
	Bin1 };

%GENERATED from file:mount.h => U2GS_OffMount
readNetMsg(?CMD_U2GS_OffMount,Bin0) ->
	{ #pk_U2GS_OffMount {

		},
	Bin0 };

%GENERATED from file:mount.h => U2GS_OnMount
readNetMsg(?CMD_U2GS_OnMount,Bin0) ->
	{ #pk_U2GS_OnMount {

		},
	Bin0 };

%GENERATED from file:npc.h => GS2U_NpcMomentMove
readNetMsg(?CMD_GS2U_NpcMomentMove,Bin0) ->
	{ V_npcCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_npcID, Bin2 } = binary_read_uint( Bin1 ),
	{ V_tX, Bin3 } = binary_read_float( Bin2 ),
	{ V_tY, Bin4 } = binary_read_float( Bin3 ),
	{ #pk_GS2U_NpcMomentMove {
		npcCode = V_npcCode,
		npcID = V_npcID,
		tX = V_tX,
		tY = V_tY
		},
	Bin4 };

%GENERATED from file:npc.h => GS2U_NpcTitleChange
readNetMsg(?CMD_GS2U_NpcTitleChange,Bin0) ->
	{ V_npclists, Bin1 } = binary_read_array(Bin0, fun(X) -> readNpcTitle( X ) end),
	{ #pk_GS2U_NpcTitleChange {
		npclists = V_npclists
		},
	Bin1 };

%GENERATED from file:npc.h => GS2U_RequestRiftNpcInfo
readNetMsg(?CMD_GS2U_RequestRiftNpcInfo,Bin0) ->
	{ V_npcCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_npcID, Bin2 } = binary_read_uint( Bin1 ),
	{ V_surplusTimes, Bin3 } = binary_read_uint( Bin2 ),
	{ V_disappearTime, Bin4 } = binary_read_uint( Bin3 ),
	{ V_groupID, Bin5 } = binary_read_uint64( Bin4 ),
	{ V_bitplaneMapID, Bin6 } = binary_read_uint( Bin5 ),
	{ #pk_GS2U_RequestRiftNpcInfo {
		npcCode = V_npcCode,
		npcID = V_npcID,
		surplusTimes = V_surplusTimes,
		disappearTime = V_disappearTime,
		groupID = V_groupID,
		bitplaneMapID = V_bitplaneMapID
		},
	Bin6 };

%GENERATED from file:npc.h => U2GS_RequestEnterRift
readNetMsg(?CMD_U2GS_RequestEnterRift,Bin0) ->
	{ V_groupID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_bitplaneMapID, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_RequestEnterRift {
		groupID = V_groupID,
		bitplaneMapID = V_bitplaneMapID
		},
	Bin2 };

%GENERATED from file:npc.h => U2GS_RequestRiftNpcInfo
readNetMsg(?CMD_U2GS_RequestRiftNpcInfo,Bin0) ->
	{ V_npcCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_RequestRiftNpcInfo {
		npcCode = V_npcCode
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_AckRewardLevel
readNetMsg(?CMD_GS2U_AckRewardLevel,Bin0) ->
	{ V_rewardLevel, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_GS2U_AckRewardLevel {
		rewardLevel = V_rewardLevel
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_AckStandSort
readNetMsg(?CMD_GS2U_AckStandSort,Bin0) ->
	{ V_petList, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint16( X ) end),
	{ #pk_GS2U_AckStandSort {
		petList = V_petList
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_BuyPowerInfo
readNetMsg(?CMD_GS2U_BuyPowerInfo,Bin0) ->
	{ V_money, Bin1 } = binary_read_int( Bin0 ),
	{ V_allCount, Bin2 } = binary_read_int8( Bin1 ),
	{ V_curCount, Bin3 } = binary_read_int8( Bin2 ),
	{ #pk_GS2U_BuyPowerInfo {
		money = V_money,
		allCount = V_allCount,
		curCount = V_curCount
		},
	Bin3 };

%GENERATED from file:pet.h => GS2U_DeletePet
readNetMsg(?CMD_GS2U_DeletePet,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_DeletePet {
		petID = V_petID
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_DoublePetMountInvite
readNetMsg(?CMD_GS2U_DoublePetMountInvite,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_srcName, Bin2 } = binary_read_string( Bin1 ),
	{ V_srcRoleID, Bin3 } = binary_read_uint64( Bin2 ),
	{ #pk_GS2U_DoublePetMountInvite {
		petID = V_petID,
		srcName = V_srcName,
		srcRoleID = V_srcRoleID
		},
	Bin3 };

%GENERATED from file:pet.h => GS2U_FindTerritoryFailed_Ack
readNetMsg(?CMD_GS2U_FindTerritoryFailed_Ack,Bin0) ->
	{ V_errorCode, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_FindTerritoryFailed_Ack {
		errorCode = V_errorCode
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_FindTerritory_Ack
readNetMsg(?CMD_GS2U_FindTerritory_Ack,Bin0) ->
	{ V_info, Bin1 } = readTerritoryInfo( Bin0 ),
	{ V_listInfo, Bin2 } = binary_read_array(Bin1, fun(X) -> readPetTerritoryInfo( X ) end),
	{ V_roleID, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_roleName, Bin4 } = binary_read_string( Bin3 ),
	{ V_count, Bin5 } = binary_read_uint( Bin4 ),
	{ #pk_GS2U_FindTerritory_Ack {
		info = V_info,
		listInfo = V_listInfo,
		roleID = V_roleID,
		roleName = V_roleName,
		count = V_count
		},
	Bin5 };

%GENERATED from file:pet.h => GS2U_OffMountPetAck
readNetMsg(?CMD_GS2U_OffMountPetAck,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_x, Bin2 } = binary_read_float( Bin1 ),
	{ V_y, Bin3 } = binary_read_float( Bin2 ),
	{ #pk_GS2U_OffMountPetAck {
		code = V_code,
		x = V_x,
		y = V_y
		},
	Bin3 };

%GENERATED from file:pet.h => GS2U_OnMountPetAck
readNetMsg(?CMD_GS2U_OnMountPetAck,Bin0) ->
	{ V_ownerCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_petCode, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_petId, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_guestCode, Bin4 } = binary_read_uint64( Bin3 ),
	{ #pk_GS2U_OnMountPetAck {
		ownerCode = V_ownerCode,
		petCode = V_petCode,
		petId = V_petId,
		guestCode = V_guestCode
		},
	Bin4 };

%GENERATED from file:pet.h => GS2U_PVEBattleResult
readNetMsg(?CMD_GS2U_PVEBattleResult,Bin0) ->
	{ V_res, Bin1 } = binary_read_int8( Bin0 ),
	{ V_coin, Bin2 } = binary_read_int( Bin1 ),
	{ V_exp, Bin3 } = binary_read_int( Bin2 ),
	{ V_score, Bin4 } = binary_read_int8( Bin3 ),
	{ V_itemList, Bin5 } = binary_read_array(Bin4, fun(X) -> readPveItem( X ) end),
	{ #pk_GS2U_PVEBattleResult {
		res = V_res,
		coin = V_coin,
		exp = V_exp,
		score = V_score,
		itemList = V_itemList
		},
	Bin5 };

%GENERATED from file:pet.h => GS2U_PetAddAttaRes
readNetMsg(?CMD_GS2U_PetAddAttaRes,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_propList, Bin2 } = binary_read_array(Bin1, fun(X) -> readAddProp( X ) end),
	{ #pk_GS2U_PetAddAttaRes {
		petID = V_petID,
		propList = V_propList
		},
	Bin2 };

%GENERATED from file:pet.h => GS2U_PetAssistInit
readNetMsg(?CMD_GS2U_PetAssistInit,Bin0) ->
	{ V_infoList, Bin1 } = binary_read_array(Bin0, fun(X) -> readAssistBattleInfo( X ) end),
	{ #pk_GS2U_PetAssistInit {
		infoList = V_infoList
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_PetAssistUpdateSlot
readNetMsg(?CMD_GS2U_PetAssistUpdateSlot,Bin0) ->
	{ V_slot, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_petID, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_GS2U_PetAssistUpdateSlot {
		slot = V_slot,
		petID = V_petID
		},
	Bin2 };

%GENERATED from file:pet.h => GS2U_PetAttaSaveRes
readNetMsg(?CMD_GS2U_PetAttaSaveRes,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_propList, Bin2 } = binary_read_array(Bin1, fun(X) -> readAddProp( X ) end),
	{ #pk_GS2U_PetAttaSaveRes {
		petID = V_petID,
		propList = V_propList
		},
	Bin2 };

%GENERATED from file:pet.h => GS2U_PetBaseInfo
readNetMsg(?CMD_GS2U_PetBaseInfo,Bin0) ->
	{ V_info, Bin1 } = readPetBaseInfo( Bin0 ),
	{ #pk_GS2U_PetBaseInfo {
		info = V_info
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_PetEquipInfoList
readNetMsg(?CMD_GS2U_PetEquipInfoList,Bin0) ->
	{ V_petEquipInfoList, Bin1 } = binary_read_array(Bin0, fun(X) -> readPetEquipInfo( X ) end),
	{ #pk_GS2U_PetEquipInfoList {
		petEquipInfoList = V_petEquipInfoList
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_PetFairyInfo
readNetMsg(?CMD_GS2U_PetFairyInfo,Bin0) ->
	{ V_point, Bin1 } = binary_read_int( Bin0 ),
	{ V_level, Bin2 } = binary_read_int16( Bin1 ),
	{ #pk_GS2U_PetFairyInfo {
		point = V_point,
		level = V_level
		},
	Bin2 };

%GENERATED from file:pet.h => GS2U_PetInfoList
readNetMsg(?CMD_GS2U_PetInfoList,Bin0) ->
	{ V_petInfoList, Bin1 } = binary_read_array(Bin0, fun(X) -> readPetBaseInfo( X ) end),
	{ #pk_GS2U_PetInfoList {
		petInfoList = V_petInfoList
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_PetLevelUp
readNetMsg(?CMD_GS2U_PetLevelUp,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_petLevel, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_petExp, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GS2U_PetLevelUp {
		petID = V_petID,
		petLevel = V_petLevel,
		petExp = V_petExp
		},
	Bin3 };

%GENERATED from file:pet.h => GS2U_PetPveSweepAck
readNetMsg(?CMD_GS2U_PetPveSweepAck,Bin0) ->
	{ V_sweepList, Bin1 } = binary_read_array(Bin0, fun(X) -> readPveSweep( X ) end),
	{ #pk_GS2U_PetPveSweepAck {
		sweepList = V_sweepList
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_PetReName
readNetMsg(?CMD_GS2U_PetReName,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_GS2U_PetReName {
		code = V_code,
		name = V_name
		},
	Bin2 };

%GENERATED from file:pet.h => GS2U_PetSkillCastResult
readNetMsg(?CMD_GS2U_PetSkillCastResult,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_skillList, Bin2 } = binary_read_array(Bin1, fun(X) -> readPetSkillCastResult( X ) end),
	{ #pk_GS2U_PetSkillCastResult {
		petID = V_petID,
		skillList = V_skillList
		},
	Bin2 };

%GENERATED from file:pet.h => GS2U_PetSleep
readNetMsg(?CMD_GS2U_PetSleep,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_GS2U_PetSleep {
		code = V_code
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_PetStrAck
readNetMsg(?CMD_GS2U_PetStrAck,Bin0) ->
	{ V_petEquipInfo, Bin1 } = readPetEquipInfo( Bin0 ),
	{ #pk_GS2U_PetStrAck {
		petEquipInfo = V_petEquipInfo
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_PvpBattleInfoRes
readNetMsg(?CMD_GS2U_PvpBattleInfoRes,Bin0) ->
	{ V_reel, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_pl, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint16( X ) end),
	{ V_point, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_cl, Bin4 } = binary_read_array(Bin3, fun(X) -> readPvPCityInfo( X ) end),
	{ V_bpl, Bin5 } = binary_read_array(Bin4, fun(X) -> readPvpBattleReportInfo( X ) end),
	{ #pk_GS2U_PvpBattleInfoRes {
		reel = V_reel,
		pl = V_pl,
		point = V_point,
		cl = V_cl,
		bpl = V_bpl
		},
	Bin5 };

%GENERATED from file:pet.h => GS2U_PvpBattleReportTip
readNetMsg(?CMD_GS2U_PvpBattleReportTip,Bin0) ->
	{ #pk_GS2U_PvpBattleReportTip {

		},
	Bin0 };

%GENERATED from file:pet.h => GS2U_PvpBattleResult
readNetMsg(?CMD_GS2U_PvpBattleResult,Bin0) ->
	{ V_res, Bin1 } = binary_read_int8( Bin0 ),
	{ V_coin, Bin2 } = binary_read_int( Bin1 ),
	{ V_exp, Bin3 } = binary_read_int( Bin2 ),
	{ V_pi, Bin4 } = readPvPCityInfo( Bin3 ),
	{ #pk_GS2U_PvpBattleResult {
		res = V_res,
		coin = V_coin,
		exp = V_exp,
		pi = V_pi
		},
	Bin4 };

%GENERATED from file:pet.h => GS2U_PvpBattleUpdateReport
readNetMsg(?CMD_GS2U_PvpBattleUpdateReport,Bin0) ->
	{ V_br, Bin1 } = readPvpBattleReportInfo( Bin0 ),
	{ #pk_GS2U_PvpBattleUpdateReport {
		br = V_br
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_PvpPosSaveAck
readNetMsg(?CMD_GS2U_PvpPosSaveAck,Bin0) ->
	{ V_petList, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint16( X ) end),
	{ #pk_GS2U_PvpPosSaveAck {
		petList = V_petList
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_QueryTerritoryHistory_Ack
readNetMsg(?CMD_GS2U_QueryTerritoryHistory_Ack,Bin0) ->
	{ V_attackOrDefense, Bin1 } = binary_read_bool( Bin0 ),
	{ V_fightCount, Bin2 } = binary_read_uint( Bin1 ),
	{ V_listInfo, Bin3 } = binary_read_array(Bin2, fun(X) -> readTerritoryHistoryCell( X ) end),
	{ #pk_GS2U_QueryTerritoryHistory_Ack {
		attackOrDefense = V_attackOrDefense,
		fightCount = V_fightCount,
		listInfo = V_listInfo
		},
	Bin3 };

%GENERATED from file:pet.h => GS2U_QueryTerritoryInfo_Ack
readNetMsg(?CMD_GS2U_QueryTerritoryInfo_Ack,Bin0) ->
	{ V_listTerritory, Bin1 } = binary_read_array(Bin0, fun(X) -> readTerritoryInfo( X ) end),
	{ V_listPet, Bin2 } = binary_read_array(Bin1, fun(X) -> readPetTerritoryInfo( X ) end),
	{ #pk_GS2U_QueryTerritoryInfo_Ack {
		listTerritory = V_listTerritory,
		listPet = V_listPet
		},
	Bin2 };

%GENERATED from file:pet.h => GS2U_RawPetResult
readNetMsg(?CMD_GS2U_RawPetResult,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_curRaw, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_GS2U_RawPetResult {
		petID = V_petID,
		curRaw = V_curRaw
		},
	Bin2 };

%GENERATED from file:pet.h => GS2U_ResetPetAck
readNetMsg(?CMD_GS2U_ResetPetAck,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_ResetPetAck {
		petID = V_petID
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_TerritoryBattle_Tick_Sync
readNetMsg(?CMD_GS2U_TerritoryBattle_Tick_Sync,Bin0) ->
	{ V_time, Bin1 } = binary_read_uint( Bin0 ),
	{ V_timeAll, Bin2 } = binary_read_uint( Bin1 ),
	{ V_state, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_GS2U_TerritoryBattle_Tick_Sync {
		time = V_time,
		timeAll = V_timeAll,
		state = V_state
		},
	Bin3 };

%GENERATED from file:pet.h => GS2U_TerritoryExploitEnd_Sync
readNetMsg(?CMD_GS2U_TerritoryExploitEnd_Sync,Bin0) ->
	{ #pk_GS2U_TerritoryExploitEnd_Sync {

		},
	Bin0 };

%GENERATED from file:pet.h => GS2U_TerritoryExploit_Ack
readNetMsg(?CMD_GS2U_TerritoryExploit_Ack,Bin0) ->
	{ V_info, Bin1 } = readTerritoryInfo( Bin0 ),
	{ V_listInfo, Bin2 } = binary_read_array(Bin1, fun(X) -> readPetTerritoryInfo( X ) end),
	{ #pk_GS2U_TerritoryExploit_Ack {
		info = V_info,
		listInfo = V_listInfo
		},
	Bin2 };

%GENERATED from file:pet.h => GS2U_TerritoryPlunder_Ack
readNetMsg(?CMD_GS2U_TerritoryPlunder_Ack,Bin0) ->
	{ V_cfgReward, Bin1 } = binary_read_uint( Bin0 ),
	{ V_count1, Bin2 } = binary_read_uint( Bin1 ),
	{ V_count2, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GS2U_TerritoryPlunder_Ack {
		cfgReward = V_cfgReward,
		count1 = V_count1,
		count2 = V_count2
		},
	Bin3 };

%GENERATED from file:pet.h => GS2U_TerritoryVigor_Ack
readNetMsg(?CMD_GS2U_TerritoryVigor_Ack,Bin0) ->
	{ V_vigor, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_TerritoryVigor_Ack {
		vigor = V_vigor
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_UpStartPetResult
readNetMsg(?CMD_GS2U_UpStartPetResult,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_curStar, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_petSkillID, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_GS2U_UpStartPetResult {
		petID = V_petID,
		curStar = V_curStar,
		petSkillID = V_petSkillID
		},
	Bin3 };

%GENERATED from file:pet.h => GS2U_UpdateCatalogList
readNetMsg(?CMD_GS2U_UpdateCatalogList,Bin0) ->
	{ V_catalogList, Bin1 } = binary_read_array(Bin0, fun(X) -> readCatalogNode( X ) end),
	{ #pk_GS2U_UpdateCatalogList {
		catalogList = V_catalogList
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_UpdatePetSkill
readNetMsg(?CMD_GS2U_UpdatePetSkill,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_skillInfo, Bin2 } = readPetSkillBaseInfo( Bin1 ),
	{ #pk_GS2U_UpdatePetSkill {
		petID = V_petID,
		skillInfo = V_skillInfo
		},
	Bin2 };

%GENERATED from file:pet.h => GS2U_UpdatePetStatus
readNetMsg(?CMD_GS2U_UpdatePetStatus,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_status, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_GS2U_UpdatePetStatus {
		petID = V_petID,
		status = V_status
		},
	Bin2 };

%GENERATED from file:pet.h => GS2U_UpdatePower
readNetMsg(?CMD_GS2U_UpdatePower,Bin0) ->
	{ V_power, Bin1 } = binary_read_int( Bin0 ),
	{ #pk_GS2U_UpdatePower {
		power = V_power
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_UpdateReel
readNetMsg(?CMD_GS2U_UpdateReel,Bin0) ->
	{ V_reel, Bin1 } = binary_read_int8( Bin0 ),
	{ #pk_GS2U_UpdateReel {
		reel = V_reel
		},
	Bin1 };

%GENERATED from file:pet.h => GS2U_UsePetSkillBook
readNetMsg(?CMD_GS2U_UsePetSkillBook,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_oldSkillId, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_newSkillId, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_newSkillLevel, Bin4 } = binary_read_uint16( Bin3 ),
	{ #pk_GS2U_UsePetSkillBook {
		petID = V_petID,
		oldSkillId = V_oldSkillId,
		newSkillId = V_newSkillId,
		newSkillLevel = V_newSkillLevel
		},
	Bin4 };

%GENERATED from file:pet.h => PetReName
readNetMsg(?CMD_PetReName,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_PetReName {
		petID = V_petID,
		name = V_name
		},
	Bin2 };

%GENERATED from file:pet.h => PetSkillReplace
readNetMsg(?CMD_PetSkillReplace,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_PetSkillReplace {
		petID = V_petID
		},
	Bin1 };

%GENERATED from file:pet.h => PetSwitch
readNetMsg(?CMD_PetSwitch,Bin0) ->
	{ V_petId, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_PetSwitch {
		petId = V_petId
		},
	Bin1 };

%GENERATED from file:pet.h => U2GS_BuyPower
readNetMsg(?CMD_U2GS_BuyPower,Bin0) ->
	{ #pk_U2GS_BuyPower {

		},
	Bin0 };

%GENERATED from file:pet.h => U2GS_BuyReel
readNetMsg(?CMD_U2GS_BuyReel,Bin0) ->
	{ #pk_U2GS_BuyReel {

		},
	Bin0 };

%GENERATED from file:pet.h => U2GS_DoublePetMountInvite
readNetMsg(?CMD_U2GS_DoublePetMountInvite,Bin0) ->
	{ V_tarRoleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_DoublePetMountInvite {
		tarRoleID = V_tarRoleID
		},
	Bin1 };

%GENERATED from file:pet.h => U2GS_DoublePetMountInviteAck
readNetMsg(?CMD_U2GS_DoublePetMountInviteAck,Bin0) ->
	{ V_agree, Bin1 } = binary_read_int8( Bin0 ),
	{ V_srcRoleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_U2GS_DoublePetMountInviteAck {
		agree = V_agree,
		srcRoleID = V_srcRoleID
		},
	Bin2 };

%GENERATED from file:pet.h => U2GS_FindTerritory_Request
readNetMsg(?CMD_U2GS_FindTerritory_Request,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_FindTerritory_Request {
		roleID = V_roleID
		},
	Bin1 };

%GENERATED from file:pet.h => U2GS_HideMountPet
readNetMsg(?CMD_U2GS_HideMountPet,Bin0) ->
	{ #pk_U2GS_HideMountPet {

		},
	Bin0 };

%GENERATED from file:pet.h => U2GS_OffMountPet
readNetMsg(?CMD_U2GS_OffMountPet,Bin0) ->
	{ #pk_U2GS_OffMountPet {

		},
	Bin0 };

%GENERATED from file:pet.h => U2GS_OnMountPet
readNetMsg(?CMD_U2GS_OnMountPet,Bin0) ->
	{ #pk_U2GS_OnMountPet {

		},
	Bin0 };

%GENERATED from file:pet.h => U2GS_PetAddAtta
readNetMsg(?CMD_U2GS_PetAddAtta,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_num, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_PetAddAtta {
		petID = V_petID,
		num = V_num
		},
	Bin2 };

%GENERATED from file:pet.h => U2GS_PetAssistBattle
readNetMsg(?CMD_U2GS_PetAssistBattle,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_slot, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_status, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_U2GS_PetAssistBattle {
		petID = V_petID,
		slot = V_slot,
		status = V_status
		},
	Bin3 };

%GENERATED from file:pet.h => U2GS_PetAttaSave
readNetMsg(?CMD_U2GS_PetAttaSave,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_PetAttaSave {
		petID = V_petID
		},
	Bin1 };

%GENERATED from file:pet.h => U2GS_PetDisapear
readNetMsg(?CMD_U2GS_PetDisapear,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_PetDisapear {
		code = V_code
		},
	Bin1 };

%GENERATED from file:pet.h => U2GS_PetLevelUp
readNetMsg(?CMD_U2GS_PetLevelUp,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_itemUID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_useNum, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_U2GS_PetLevelUp {
		petID = V_petID,
		itemUID = V_itemUID,
		useNum = V_useNum
		},
	Bin3 };

%GENERATED from file:pet.h => U2GS_PetPveSweep
readNetMsg(?CMD_U2GS_PetPveSweep,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_PetPveSweep {
		id = V_id
		},
	Bin1 };

%GENERATED from file:pet.h => U2GS_PetSkillCast
readNetMsg(?CMD_U2GS_PetSkillCast,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_skillIDs, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint16( X ) end),
	{ #pk_U2GS_PetSkillCast {
		petID = V_petID,
		skillIDs = V_skillIDs
		},
	Bin2 };

%GENERATED from file:pet.h => U2GS_PetSkillOperate
readNetMsg(?CMD_U2GS_PetSkillOperate,Bin0) ->
	{ V_operationType, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_petID, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_petSkillId, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_U2GS_PetSkillOperate {
		operationType = V_operationType,
		petID = V_petID,
		petSkillId = V_petSkillId
		},
	Bin3 };

%GENERATED from file:pet.h => U2GS_PetStr
readNetMsg(?CMD_U2GS_PetStr,Bin0) ->
	{ V_equipID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_type, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_PetStr {
		equipID = V_equipID,
		type = V_type
		},
	Bin2 };

%GENERATED from file:pet.h => U2GS_PvpBattleInfo
readNetMsg(?CMD_U2GS_PvpBattleInfo,Bin0) ->
	{ #pk_U2GS_PvpBattleInfo {

		},
	Bin0 };

%GENERATED from file:pet.h => U2GS_PvpPosSave
readNetMsg(?CMD_U2GS_PvpPosSave,Bin0) ->
	{ V_petList, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint16( X ) end),
	{ #pk_U2GS_PvpPosSave {
		petList = V_petList
		},
	Bin1 };

%GENERATED from file:pet.h => U2GS_QueryPetFairyInfo
readNetMsg(?CMD_U2GS_QueryPetFairyInfo,Bin0) ->
	{ #pk_U2GS_QueryPetFairyInfo {

		},
	Bin0 };

%GENERATED from file:pet.h => U2GS_QueryTerritoryHistory_Request
readNetMsg(?CMD_U2GS_QueryTerritoryHistory_Request,Bin0) ->
	{ V_attackOrDefense, Bin1 } = binary_read_bool( Bin0 ),
	{ #pk_U2GS_QueryTerritoryHistory_Request {
		attackOrDefense = V_attackOrDefense
		},
	Bin1 };

%GENERATED from file:pet.h => U2GS_QueryTerritoryInfo_Request
readNetMsg(?CMD_U2GS_QueryTerritoryInfo_Request,Bin0) ->
	{ #pk_U2GS_QueryTerritoryInfo_Request {

		},
	Bin0 };

%GENERATED from file:pet.h => U2GS_RawPet
readNetMsg(?CMD_U2GS_RawPet,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_RawPet {
		petID = V_petID
		},
	Bin1 };

%GENERATED from file:pet.h => U2GS_RequestBattle
readNetMsg(?CMD_U2GS_RequestBattle,Bin0) ->
	{ V_id, Bin1 } = binary_read_int( Bin0 ),
	{ #pk_U2GS_RequestBattle {
		id = V_id
		},
	Bin1 };

%GENERATED from file:pet.h => U2GS_RequestPvpBattle
readNetMsg(?CMD_U2GS_RequestPvpBattle,Bin0) ->
	{ V_cityID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_roleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_U2GS_RequestPvpBattle {
		cityID = V_cityID,
		roleID = V_roleID
		},
	Bin2 };

%GENERATED from file:pet.h => U2GS_RequstReward
readNetMsg(?CMD_U2GS_RequstReward,Bin0) ->
	{ #pk_U2GS_RequstReward {

		},
	Bin0 };

%GENERATED from file:pet.h => U2GS_ResetPet
readNetMsg(?CMD_U2GS_ResetPet,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_ResetPet {
		petID = V_petID
		},
	Bin1 };

%GENERATED from file:pet.h => U2GS_ShowMountPet
readNetMsg(?CMD_U2GS_ShowMountPet,Bin0) ->
	{ #pk_U2GS_ShowMountPet {

		},
	Bin0 };

%GENERATED from file:pet.h => U2GS_StandSort
readNetMsg(?CMD_U2GS_StandSort,Bin0) ->
	{ V_petList, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint16( X ) end),
	{ #pk_U2GS_StandSort {
		petList = V_petList
		},
	Bin1 };

%GENERATED from file:pet.h => U2GS_TerritoryExploit_Request
readNetMsg(?CMD_U2GS_TerritoryExploit_Request,Bin0) ->
	{ V_territoryID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_listPetID, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint( X ) end),
	{ V_cfgTime, Bin3 } = binary_read_uint( Bin2 ),
	{ V_cfgLevel, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_U2GS_TerritoryExploit_Request {
		territoryID = V_territoryID,
		listPetID = V_listPetID,
		cfgTime = V_cfgTime,
		cfgLevel = V_cfgLevel
		},
	Bin4 };

%GENERATED from file:pet.h => U2GS_TerritoryPlunder_Request
readNetMsg(?CMD_U2GS_TerritoryPlunder_Request,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_territoryID, Bin2 } = binary_read_uint( Bin1 ),
	{ V_listPetID, Bin3 } = binary_read_array(Bin2, fun(X) -> binary_read_uint( X ) end),
	{ #pk_U2GS_TerritoryPlunder_Request {
		roleID = V_roleID,
		territoryID = V_territoryID,
		listPetID = V_listPetID
		},
	Bin3 };

%GENERATED from file:pet.h => U2GS_TerritoryVigor_Request
readNetMsg(?CMD_U2GS_TerritoryVigor_Request,Bin0) ->
	{ #pk_U2GS_TerritoryVigor_Request {

		},
	Bin0 };

%GENERATED from file:pet.h => U2GS_UpStartPet
readNetMsg(?CMD_U2GS_UpStartPet,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_UpStartPet {
		petID = V_petID
		},
	Bin1 };

%GENERATED from file:pet.h => U2GS_UsePetSkillBook
readNetMsg(?CMD_U2GS_UsePetSkillBook,Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_petSkillId, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_itemid, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_U2GS_UsePetSkillBook {
		petID = V_petID,
		petSkillId = V_petSkillId,
		itemid = V_itemid
		},
	Bin3 };

%GENERATED from file:player.h => Any_ChangeMap
readNetMsg(?CMD_Any_ChangeMap,Bin0) ->
	{ V_mapId, Bin1 } = binary_read_uint( Bin0 ),
	{ V_x, Bin2 } = binary_read_float( Bin1 ),
	{ V_y, Bin3 } = binary_read_float( Bin2 ),
	{ #pk_Any_ChangeMap {
		mapId = V_mapId,
		x = V_x,
		y = V_y
		},
	Bin3 };

%GENERATED from file:player.h => Any_PlayerLogout
readNetMsg(?CMD_Any_PlayerLogout,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_reason, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_Any_PlayerLogout {
		code = V_code,
		reason = V_reason
		},
	Bin2 };

%GENERATED from file:player.h => C2S_ChangeMap
readNetMsg(?CMD_C2S_ChangeMap,Bin0) ->
	{ V_mapId, Bin1 } = binary_read_uint( Bin0 ),
	{ V_waypointName, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_C2S_ChangeMap {
		mapId = V_mapId,
		waypointName = V_waypointName
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_AcceptHolidayTaskSucc
readNetMsg(?CMD_GS2U_AcceptHolidayTaskSucc,Bin0) ->
	{ V_result, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_GS2U_AcceptHolidayTaskSucc {
		result = V_result
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_AllBattleProp
readNetMsg(?CMD_GS2U_AllBattleProp,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_battlePropInfo, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_float( X ) end),
	{ #pk_GS2U_AllBattleProp {
		code = V_code,
		battlePropInfo = V_battlePropInfo
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_BattlePropList
readNetMsg(?CMD_GS2U_BattlePropList,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_id, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_battleProp, Bin3 } = binary_read_array(Bin2, fun(X) -> readBattleProp( X ) end),
	{ #pk_GS2U_BattlePropList {
		code = V_code,
		id = V_id,
		battleProp = V_battleProp
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_BlockStatusChange
readNetMsg(?CMD_GS2U_BlockStatusChange,Bin0) ->
	{ V_changes, Bin1 } = binary_read_array(Bin0, fun(X) -> readBlockStatusChange( X ) end),
	{ #pk_GS2U_BlockStatusChange {
		changes = V_changes
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_BroadcastDisapear
readNetMsg(?CMD_GS2U_BroadcastDisapear,Bin0) ->
	{ V_code, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_GS2U_BroadcastDisapear {
		code = V_code
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_BroadcastDisapearFast
readNetMsg(?CMD_GS2U_BroadcastDisapearFast,Bin0) ->
	{ V_code, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_GS2U_BroadcastDisapearFast {
		code = V_code
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_BroadcastPlayerHpPC
readNetMsg(?CMD_GS2U_BroadcastPlayerHpPC,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_hpPC, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_GS2U_BroadcastPlayerHpPC {
		code = V_code,
		hpPC = V_hpPC
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_BroadcastPlayerRevive
readNetMsg(?CMD_GS2U_BroadcastPlayerRevive,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_mapId, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_x, Bin3 } = binary_read_float( Bin2 ),
	{ V_y, Bin4 } = binary_read_float( Bin3 ),
	{ V_hpPC, Bin5 } = binary_read_uint8( Bin4 ),
	{ #pk_GS2U_BroadcastPlayerRevive {
		code = V_code,
		mapId = V_mapId,
		x = V_x,
		y = V_y,
		hpPC = V_hpPC
		},
	Bin5 };

%GENERATED from file:player.h => GS2U_BroadcastTeamRevive
readNetMsg(?CMD_GS2U_BroadcastTeamRevive,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_mapId, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_x, Bin3 } = binary_read_float( Bin2 ),
	{ V_y, Bin4 } = binary_read_float( Bin3 ),
	{ V_hpPC, Bin5 } = binary_read_uint8( Bin4 ),
	{ #pk_GS2U_BroadcastTeamRevive {
		roleID = V_roleID,
		mapId = V_mapId,
		x = V_x,
		y = V_y,
		hpPC = V_hpPC
		},
	Bin5 };

%GENERATED from file:player.h => GS2U_BroadcastVisibleEquipOff
readNetMsg(?CMD_GS2U_BroadcastVisibleEquipOff,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_type, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_BroadcastVisibleEquipOff {
		code = V_code,
		type = V_type
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_BroadcastVisibleEquipOn
readNetMsg(?CMD_GS2U_BroadcastVisibleEquipOn,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_equip, Bin2 } = readvisibleEquip( Bin1 ),
	{ #pk_GS2U_BroadcastVisibleEquipOn {
		code = V_code,
		equip = V_equip
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_BuyLimitedResult
readNetMsg(?CMD_GS2U_BuyLimitedResult,Bin0) ->
	{ V_result, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_GS2U_BuyLimitedResult {
		result = V_result
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_ChangeCamp
readNetMsg(?CMD_GS2U_ChangeCamp,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_camp, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_ChangeCamp {
		code = V_code,
		camp = V_camp
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_ChangeCarrer
readNetMsg(?CMD_GS2U_ChangeCarrer,Bin0) ->
	{ V_result, Bin1 } = binary_read_bool( Bin0 ),
	{ V_newCareer, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_ChangeCarrer {
		result = V_result,
		newCareer = V_newCareer
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_ChangeNameResult
readNetMsg(?CMD_GS2U_ChangeNameResult,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ V_errorCode, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GS2U_ChangeNameResult {
		roleID = V_roleID,
		name = V_name,
		errorCode = V_errorCode
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_ChatErrorResult
readNetMsg(?CMD_GS2U_ChatErrorResult,Bin0) ->
	{ V_reason, Bin1 } = binary_read_int( Bin0 ),
	{ #pk_GS2U_ChatErrorResult {
		reason = V_reason
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_Chatinfo
readNetMsg(?CMD_GS2U_Chatinfo,Bin0) ->
	{ V_channel, Bin1 } = binary_read_int8( Bin0 ),
	{ V_senderID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_senderCode, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_senderName, Bin4 } = binary_read_string( Bin3 ),
	{ V_senderRace, Bin5 } = binary_read_int8( Bin4 ),
	{ V_senderCareer, Bin6 } = binary_read_uint( Bin5 ),
	{ V_senderSex, Bin7 } = binary_read_int8( Bin6 ),
	{ V_senderHead, Bin8 } = binary_read_int( Bin7 ),
	{ V_senderLevel, Bin9 } = binary_read_int16( Bin8 ),
	{ V_senderVip, Bin10 } = binary_read_int8( Bin9 ),
	{ V_content, Bin11 } = binary_read_string( Bin10 ),
	{ #pk_GS2U_Chatinfo {
		channel = V_channel,
		senderID = V_senderID,
		senderCode = V_senderCode,
		senderName = V_senderName,
		senderRace = V_senderRace,
		senderCareer = V_senderCareer,
		senderSex = V_senderSex,
		senderHead = V_senderHead,
		senderLevel = V_senderLevel,
		senderVip = V_senderVip,
		content = V_content
		},
	Bin11 };

%GENERATED from file:player.h => GS2U_ClearFightObject
readNetMsg(?CMD_GS2U_ClearFightObject,Bin0) ->
	{ V_objs, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint( X ) end),
	{ #pk_GS2U_ClearFightObject {
		objs = V_objs
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_CopyMapProcess
readNetMsg(?CMD_GS2U_CopyMapProcess,Bin0) ->
	{ V_curSchedule, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_allSchedule, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_scheduleList, Bin3 } = binary_read_array(Bin2, fun(X) -> readCopyObj( X ) end),
	{ #pk_GS2U_CopyMapProcess {
		curSchedule = V_curSchedule,
		allSchedule = V_allSchedule,
		scheduleList = V_scheduleList
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_CopyMapProcessCurrentScheduleStatus
readNetMsg(?CMD_GS2U_CopyMapProcessCurrentScheduleStatus,Bin0) ->
	{ V_curSchedule, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_status, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_GS2U_CopyMapProcessCurrentScheduleStatus {
		curSchedule = V_curSchedule,
		status = V_status
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_CopyMapProcessCurrentScheduleSurplusSecond
readNetMsg(?CMD_GS2U_CopyMapProcessCurrentScheduleSurplusSecond,Bin0) ->
	{ V_curSchedule, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_type, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_surplusSecond, Bin3 } = binary_read_uint64( Bin2 ),
	{ #pk_GS2U_CopyMapProcessCurrentScheduleSurplusSecond {
		curSchedule = V_curSchedule,
		type = V_type,
		surplusSecond = V_surplusSecond
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_CopyMapResult
readNetMsg(?CMD_GS2U_CopyMapResult,Bin0) ->
	{ V_copyMapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_second, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_goldReward, Bin3 } = binary_read_uint( Bin2 ),
	{ V_expReward, Bin4 } = binary_read_uint( Bin3 ),
	{ V_isAssist, Bin5 } = binary_read_bool( Bin4 ),
	{ V_dropItems, Bin6 } = binary_read_array(Bin5, fun(X) -> readCopyMapDropItem( X ) end),
	{ #pk_GS2U_CopyMapResult {
		copyMapID = V_copyMapID,
		second = V_second,
		goldReward = V_goldReward,
		expReward = V_expReward,
		isAssist = V_isAssist,
		dropItems = V_dropItems
		},
	Bin6 };

%GENERATED from file:player.h => GS2U_CopyMapStatHurtList
readNetMsg(?CMD_GS2U_CopyMapStatHurtList,Bin0) ->
	{ V_statList, Bin1 } = binary_read_array(Bin0, fun(X) -> readCopyMapStatHurt( X ) end),
	{ #pk_GS2U_CopyMapStatHurtList {
		statList = V_statList
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_CreatePlayerResult
readNetMsg(?CMD_GS2U_CreatePlayerResult,Bin0) ->
	{ V_errorCode, Bin1 } = binary_read_int( Bin0 ),
	{ V_roleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_CreatePlayerResult {
		errorCode = V_errorCode,
		roleID = V_roleID
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_CrossNewPlayerCode
readNetMsg(?CMD_GS2U_CrossNewPlayerCode,Bin0) ->
	{ V_uint64, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_CrossNewPlayerCode {
		uint64 = V_uint64
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_CrossStep
readNetMsg(?CMD_GS2U_CrossStep,Bin0) ->
	{ V_index, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_GS2U_CrossStep {
		index = V_index
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_DashTo
readNetMsg(?CMD_GS2U_DashTo,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_posX, Bin2 } = binary_read_float( Bin1 ),
	{ V_posY, Bin3 } = binary_read_float( Bin2 ),
	{ #pk_GS2U_DashTo {
		code = V_code,
		posX = V_posX,
		posY = V_posY
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_DeletePlayerResult
readNetMsg(?CMD_GS2U_DeletePlayerResult,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_errorCode, Bin2 } = binary_read_int( Bin1 ),
	{ #pk_GS2U_DeletePlayerResult {
		roleID = V_roleID,
		errorCode = V_errorCode
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_EqupmentCombinAck
readNetMsg(?CMD_GS2U_EqupmentCombinAck,Bin0) ->
	{ V_combinID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_success, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_GS2U_EqupmentCombinAck {
		combinID = V_combinID,
		success = V_success
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_Error
readNetMsg(?CMD_GS2U_Error,Bin0) ->
	{ V_errorCode, Bin1 } = binary_read_uint( Bin0 ),
	{ V_params, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_string( X ) end),
	{ #pk_GS2U_Error {
		errorCode = V_errorCode,
		params = V_params
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_GetRewardUpdateResource
readNetMsg(?CMD_GS2U_GetRewardUpdateResource,Bin0) ->
	{ V_resultList, Bin1 } = binary_read_array(Bin0, fun(X) -> readRewardUpdateResource( X ) end),
	{ #pk_GS2U_GetRewardUpdateResource {
		resultList = V_resultList
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_HateInfo
readNetMsg(?CMD_GS2U_HateInfo,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_hateCode, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_opreate, Bin3 } = binary_read_int8( Bin2 ),
	{ #pk_GS2U_HateInfo {
		code = V_code,
		hateCode = V_hateCode,
		opreate = V_opreate
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_HaveIconAndActionList
readNetMsg(?CMD_GS2U_HaveIconAndActionList,Bin0) ->
	{ V_icons, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint( X ) end),
	{ V_actions, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint( X ) end),
	{ #pk_GS2U_HaveIconAndActionList {
		icons = V_icons,
		actions = V_actions
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_HeartBeatAck
readNetMsg(?CMD_GS2U_HeartBeatAck,Bin0) ->
	{ V_time, Bin1 } = binary_read_uint( Bin0 ),
	{ V_version, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_HeartBeatAck {
		time = V_time,
		version = V_version
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_InvateEnterCopyMap
readNetMsg(?CMD_GS2U_InvateEnterCopyMap,Bin0) ->
	{ V_copyMapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_InvateEnterCopyMap {
		copyMapID = V_copyMapID
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_KickOutTip
readNetMsg(?CMD_GS2U_KickOutTip,Bin0) ->
	{ V_type, Bin1 } = binary_read_int8( Bin0 ),
	{ #pk_GS2U_KickOutTip {
		type = V_type
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_KillPlayerResponse
readNetMsg(?CMD_GS2U_KillPlayerResponse,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_GS2U_KillPlayerResponse {
		code = V_code
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_KillValueResponse
readNetMsg(?CMD_GS2U_KillValueResponse,Bin0) ->
	{ V_killValue, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_KillValueResponse {
		killValue = V_killValue
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_LoginResult
readNetMsg(?CMD_GS2U_LoginResult,Bin0) ->
	{ V_result, Bin1 } = binary_read_int( Bin0 ),
	{ #pk_GS2U_LoginResult {
		result = V_result
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_LookInfoPlayer
readNetMsg(?CMD_GS2U_LookInfoPlayer,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_name, Bin3 } = binary_read_string( Bin2 ),
	{ V_x, Bin4 } = binary_read_float( Bin3 ),
	{ V_y, Bin5 } = binary_read_float( Bin4 ),
	{ V_race, Bin6 } = binary_read_int8( Bin5 ),
	{ V_career, Bin7 } = binary_read_uint( Bin6 ),
	{ V_sex, Bin8 } = binary_read_int8( Bin7 ),
	{ V_camp, Bin9 } = binary_read_int8( Bin8 ),
	{ V_head, Bin10 } = binary_read_int( Bin9 ),
	{ V_move_speed, Bin11 } = binary_read_float( Bin10 ),
	{ V_level, Bin12 } = binary_read_int16( Bin11 ),
	{ V_hp_per, Bin13 } = binary_read_uint8( Bin12 ),
	{ V_petID, Bin14 } = binary_read_uint16( Bin13 ),
	{ V_otherCode, Bin15 } = binary_read_uint64( Bin14 ),
	{ V_servername, Bin16 } = binary_read_string( Bin15 ),
	{ V_myServerName, Bin17 } = binary_read_string( Bin16 ),
	{ V_isInCross, Bin18 } = binary_read_bool( Bin17 ),
	{ V_pkMode, Bin19 } = binary_read_uint8( Bin18 ),
	{ V_pet_list, Bin20 } = binary_read_array(Bin19, fun(X) -> binary_read_uint64( X ) end),
	{ V_move_list, Bin21 } = binary_read_array(Bin20, fun(X) -> readPosInfo( X ) end),
	{ V_buffs, Bin22 } = binary_read_array(Bin21, fun(X) -> readBuffBaseInfo( X ) end),
	{ V_visible_equips, Bin23 } = binary_read_array(Bin22, fun(X) -> readvisibleEquip( X ) end),
	{ V_refine_levels, Bin24 } = binary_read_array(Bin23, fun(X) -> readrefineLevel( X ) end),
	{ #pk_GS2U_LookInfoPlayer {
		code = V_code,
		roleID = V_roleID,
		name = V_name,
		x = V_x,
		y = V_y,
		race = V_race,
		career = V_career,
		sex = V_sex,
		camp = V_camp,
		head = V_head,
		move_speed = V_move_speed,
		level = V_level,
		hp_per = V_hp_per,
		petID = V_petID,
		otherCode = V_otherCode,
		servername = V_servername,
		myServerName = V_myServerName,
		isInCross = V_isInCross,
		pkMode = V_pkMode,
		pet_list = V_pet_list,
		move_list = V_move_list,
		buffs = V_buffs,
		visible_equips = V_visible_equips,
		refine_levels = V_refine_levels
		},
	Bin24 };

%GENERATED from file:player.h => GS2U_LotteryForTowerBeginTimeEndTime
readNetMsg(?CMD_GS2U_LotteryForTowerBeginTimeEndTime,Bin0) ->
	{ V_beginTime, Bin1 } = binary_read_uint( Bin0 ),
	{ V_endTime, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_LotteryForTowerBeginTimeEndTime {
		beginTime = V_beginTime,
		endTime = V_endTime
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_LotteryForTowerInfo
readNetMsg(?CMD_GS2U_LotteryForTowerInfo,Bin0) ->
	{ V_current_cfg_id, Bin1 } = binary_read_int16( Bin0 ),
	{ V_endTime, Bin2 } = binary_read_uint( Bin1 ),
	{ V_oneTimeCost, Bin3 } = binary_read_uint( Bin2 ),
	{ V_tenTimeCost, Bin4 } = binary_read_uint( Bin3 ),
	{ V_fiftyTimeCost, Bin5 } = binary_read_uint( Bin4 ),
	{ V_itemList, Bin6 } = binary_read_array(Bin5, fun(X) -> readlotteryForToweItem( X ) end),
	{ V_noticeList, Bin7 } = binary_read_array(Bin6, fun(X) -> readlotteryForTowerNotice( X ) end),
	{ #pk_GS2U_LotteryForTowerInfo {
		current_cfg_id = V_current_cfg_id,
		endTime = V_endTime,
		oneTimeCost = V_oneTimeCost,
		tenTimeCost = V_tenTimeCost,
		fiftyTimeCost = V_fiftyTimeCost,
		itemList = V_itemList,
		noticeList = V_noticeList
		},
	Bin7 };

%GENERATED from file:player.h => GS2U_LotteryForTowerRandonAward
readNetMsg(?CMD_GS2U_LotteryForTowerRandonAward,Bin0) ->
	{ V_current_cfg_id, Bin1 } = binary_read_int16( Bin0 ),
	{ V_noticeList, Bin2 } = binary_read_array(Bin1, fun(X) -> readlotteryForTowerNotice( X ) end),
	{ V_reward_cfg_id_list, Bin3 } = binary_read_array(Bin2, fun(X) -> binary_read_int16( X ) end),
	{ #pk_GS2U_LotteryForTowerRandonAward {
		current_cfg_id = V_current_cfg_id,
		noticeList = V_noticeList,
		reward_cfg_id_list = V_reward_cfg_id_list
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_MapLevel
readNetMsg(?CMD_GS2U_MapLevel,Bin0) ->
	{ V_level, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_MapLevel {
		level = V_level
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_MaterialCopyMapResult
readNetMsg(?CMD_GS2U_MaterialCopyMapResult,Bin0) ->
	{ V_copyMapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_score, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_state, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_goldReward, Bin4 } = binary_read_uint( Bin3 ),
	{ V_expReward, Bin5 } = binary_read_uint( Bin4 ),
	{ V_maxChapter, Bin6 } = binary_read_uint16( Bin5 ),
	{ V_finishChapter, Bin7 } = binary_read_uint16( Bin6 ),
	{ V_isAssist, Bin8 } = binary_read_bool( Bin7 ),
	{ V_dropItems, Bin9 } = binary_read_array(Bin8, fun(X) -> readCopyMapDropItem( X ) end),
	{ #pk_GS2U_MaterialCopyMapResult {
		copyMapID = V_copyMapID,
		score = V_score,
		state = V_state,
		goldReward = V_goldReward,
		expReward = V_expReward,
		maxChapter = V_maxChapter,
		finishChapter = V_finishChapter,
		isAssist = V_isAssist,
		dropItems = V_dropItems
		},
	Bin9 };

%GENERATED from file:player.h => GS2U_MissionObjectList
readNetMsg(?CMD_GS2U_MissionObjectList,Bin0) ->
	{ V_missionObj_list, Bin1 } = binary_read_array(Bin0, fun(X) -> readMissionObjectInfo( X ) end),
	{ #pk_GS2U_MissionObjectList {
		missionObj_list = V_missionObj_list
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_MoneyChanges
readNetMsg(?CMD_GS2U_MoneyChanges,Bin0) ->
	{ V_changes, Bin1 } = binary_read_array(Bin0, fun(X) -> readMoneyChanges( X ) end),
	{ #pk_GS2U_MoneyChanges {
		changes = V_changes
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_MoneyDungeonCopyMapResult
readNetMsg(?CMD_GS2U_MoneyDungeonCopyMapResult,Bin0) ->
	{ V_copyMapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_score, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_maxChapter, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_finishChapter, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_listMonsterID, Bin5 } = binary_read_array(Bin4, fun(X) -> binary_read_uint16( X ) end),
	{ V_listMonsterCountKill, Bin6 } = binary_read_array(Bin5, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_GS2U_MoneyDungeonCopyMapResult {
		copyMapID = V_copyMapID,
		score = V_score,
		maxChapter = V_maxChapter,
		finishChapter = V_finishChapter,
		listMonsterID = V_listMonsterID,
		listMonsterCountKill = V_listMonsterCountKill
		},
	Bin6 };

%GENERATED from file:player.h => GS2U_MoneyTreeAck
readNetMsg(?CMD_GS2U_MoneyTreeAck,Bin0) ->
	{ V_totalMoney, Bin1 } = binary_read_uint( Bin0 ),
	{ V_boxMoney, Bin2 } = binary_read_uint( Bin1 ),
	{ V_rate, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_GS2U_MoneyTreeAck {
		totalMoney = V_totalMoney,
		boxMoney = V_boxMoney,
		rate = V_rate
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_MoneyTreeBox
readNetMsg(?CMD_GS2U_MoneyTreeBox,Bin0) ->
	{ V_totalMoney, Bin1 } = binary_read_uint( Bin0 ),
	{ V_rate, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_GS2U_MoneyTreeBox {
		totalMoney = V_totalMoney,
		rate = V_rate
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_MonsterBookNeed_Sync
readNetMsg(?CMD_GS2U_MonsterBookNeed_Sync,Bin0) ->
	{ V_listUnlockID, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint16( X ) end),
	{ V_listRewardID, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint16( X ) end),
	{ #pk_GS2U_MonsterBookNeed_Sync {
		listUnlockID = V_listUnlockID,
		listRewardID = V_listRewardID
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_MonsterBookReward_Ack
readNetMsg(?CMD_GS2U_MonsterBookReward_Ack,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_MonsterBookReward_Ack {
		id = V_id
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_MonsterBookSnap_Ack
readNetMsg(?CMD_GS2U_MonsterBookSnap_Ack,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_MonsterBookSnap_Ack {
		id = V_id
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_MonsterBookUnlock_Ack
readNetMsg(?CMD_GS2U_MonsterBookUnlock_Ack,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_MonsterBookUnlock_Ack {
		id = V_id
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_MonsterBook_Ack
readNetMsg(?CMD_GS2U_MonsterBook_Ack,Bin0) ->
	{ V_listMapID, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint16( X ) end),
	{ V_listMonster, Bin2 } = binary_read_array(Bin1, fun(X) -> readMonsterBook( X ) end),
	{ #pk_GS2U_MonsterBook_Ack {
		listMapID = V_listMapID,
		listMonster = V_listMonster
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_MonsterList
readNetMsg(?CMD_GS2U_MonsterList,Bin0) ->
	{ V_monster_list, Bin1 } = binary_read_array(Bin0, fun(X) -> readLookInfoMonster( X ) end),
	{ #pk_GS2U_MonsterList {
		monster_list = V_monster_list
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_MonthCardEndTips
readNetMsg(?CMD_GS2U_MonthCardEndTips,Bin0) ->
	{ V_remainDays, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_GS2U_MonthCardEndTips {
		remainDays = V_remainDays
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_MoveInfo
readNetMsg(?CMD_GS2U_MoveInfo,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_posX, Bin2 } = binary_read_float( Bin1 ),
	{ V_posY, Bin3 } = binary_read_float( Bin2 ),
	{ V_posInfos, Bin4 } = binary_read_array(Bin3, fun(X) -> readPosInfo( X ) end),
	{ #pk_GS2U_MoveInfo {
		code = V_code,
		posX = V_posX,
		posY = V_posY,
		posInfos = V_posInfos
		},
	Bin4 };

%GENERATED from file:player.h => GS2U_MsgBoxTips
readNetMsg(?CMD_GS2U_MsgBoxTips,Bin0) ->
	{ V_code, Bin1 } = binary_read_int( Bin0 ),
	{ V_msg, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_GS2U_MsgBoxTips {
		code = V_code,
		msg = V_msg
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_NeedForSpeedCollideRoadBox
readNetMsg(?CMD_GS2U_NeedForSpeedCollideRoadBox,Bin0) ->
	{ V_collideItemID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_GS2U_NeedForSpeedCollideRoadBox {
		collideItemID = V_collideItemID
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_NeedForSpeedColliderBoxIDList
readNetMsg(?CMD_GS2U_NeedForSpeedColliderBoxIDList,Bin0) ->
	{ V_boxIdList, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint16( X ) end),
	{ #pk_GS2U_NeedForSpeedColliderBoxIDList {
		boxIdList = V_boxIdList
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_NeedForSpeedCompletionEndInfoList
readNetMsg(?CMD_GS2U_NeedForSpeedCompletionEndInfoList,Bin0) ->
	{ V_firstRoleNames, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_string( X ) end),
	{ V_secondRoleNames, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_string( X ) end),
	{ V_thirdRoleNames, Bin3 } = binary_read_array(Bin2, fun(X) -> binary_read_string( X ) end),
	{ V_selfIndex, Bin4 } = binary_read_uint8( Bin3 ),
	{ #pk_GS2U_NeedForSpeedCompletionEndInfoList {
		firstRoleNames = V_firstRoleNames,
		secondRoleNames = V_secondRoleNames,
		thirdRoleNames = V_thirdRoleNames,
		selfIndex = V_selfIndex
		},
	Bin4 };

%GENERATED from file:player.h => GS2U_NeedForSpeedCompletionInfoList
readNetMsg(?CMD_GS2U_NeedForSpeedCompletionInfoList,Bin0) ->
	{ V_lastTime, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_currentCircle, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_selfIndex, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_firstRoleName, Bin4 } = binary_read_string( Bin3 ),
	{ V_firstIsWin, Bin5 } = binary_read_bool( Bin4 ),
	{ V_completionState, Bin6 } = binary_read_uint8( Bin5 ),
	{ #pk_GS2U_NeedForSpeedCompletionInfoList {
		lastTime = V_lastTime,
		currentCircle = V_currentCircle,
		selfIndex = V_selfIndex,
		firstRoleName = V_firstRoleName,
		firstIsWin = V_firstIsWin,
		completionState = V_completionState
		},
	Bin6 };

%GENERATED from file:player.h => GS2U_NeedForSpeedMatchInfo
readNetMsg(?CMD_GS2U_NeedForSpeedMatchInfo,Bin0) ->
	{ V_currentPlayerNumber, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_countdownSec, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_GS2U_NeedForSpeedMatchInfo {
		currentPlayerNumber = V_currentPlayerNumber,
		countdownSec = V_countdownSec
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_NeedForSpeedUseItem
readNetMsg(?CMD_GS2U_NeedForSpeedUseItem,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_itemID, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_NeedForSpeedUseItem {
		roleID = V_roleID,
		itemID = V_itemID
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_NoticeAdd
readNetMsg(?CMD_GS2U_NoticeAdd,Bin0) ->
	{ V_notice, Bin1 } = binary_read_array(Bin0, fun(X) -> readNoticeInfo( X ) end),
	{ #pk_GS2U_NoticeAdd {
		notice = V_notice
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_NoticeDel
readNetMsg(?CMD_GS2U_NoticeDel,Bin0) ->
	{ V_id, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_int64( X ) end),
	{ #pk_GS2U_NoticeDel {
		id = V_id
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_NoticeResponse
readNetMsg(?CMD_GS2U_NoticeResponse,Bin0) ->
	{ V_result, Bin1 } = binary_read_int8( Bin0 ),
	{ V_noticeList, Bin2 } = binary_read_array(Bin1, fun(X) -> readNoticeInfo( X ) end),
	{ #pk_GS2U_NoticeResponse {
		result = V_result,
		noticeList = V_noticeList
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_NpcList
readNetMsg(?CMD_GS2U_NpcList,Bin0) ->
	{ V_npc_list, Bin1 } = binary_read_array(Bin0, fun(X) -> readLookInfoNpc( X ) end),
	{ #pk_GS2U_NpcList {
		npc_list = V_npc_list
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_NpcStatusChange
readNetMsg(?CMD_GS2U_NpcStatusChange,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_actionStatus, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_NpcStatusChange {
		code = V_code,
		actionStatus = V_actionStatus
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_ObjBrief
readNetMsg(?CMD_GS2U_ObjBrief,Bin0) ->
	{ V_obj_type, Bin1 } = binary_read_int8( Bin0 ),
	{ V_objs, Bin2 } = binary_read_array(Bin1, fun(X) -> readObjBrief( X ) end),
	{ #pk_GS2U_ObjBrief {
		obj_type = V_obj_type,
		objs = V_objs
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_PetList
readNetMsg(?CMD_GS2U_PetList,Bin0) ->
	{ V_pet_list, Bin1 } = binary_read_array(Bin0, fun(X) -> readLookInfoPet( X ) end),
	{ #pk_GS2U_PetList {
		pet_list = V_pet_list
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_PlayerAddExp
readNetMsg(?CMD_GS2U_PlayerAddExp,Bin0) ->
	{ V_curExp, Bin1 } = binary_read_uint( Bin0 ),
	{ V_addExp, Bin2 } = binary_read_int( Bin1 ),
	{ #pk_GS2U_PlayerAddExp {
		curExp = V_curExp,
		addExp = V_addExp
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_PlayerAwakenInfo
readNetMsg(?CMD_GS2U_PlayerAwakenInfo,Bin0) ->
	{ V_type, Bin1 } = binary_read_int8( Bin0 ),
	{ V_awakenLevel, Bin2 } = binary_read_int8( Bin1 ),
	{ V_itemNum, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_GS2U_PlayerAwakenInfo {
		type = V_type,
		awakenLevel = V_awakenLevel,
		itemNum = V_itemNum
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_PlayerBaseInfo
readNetMsg(?CMD_GS2U_PlayerBaseInfo,Bin0) ->
	{ V_baseInfo, Bin1 } = readRoleBaseInfo( Bin0 ),
	{ #pk_GS2U_PlayerBaseInfo {
		baseInfo = V_baseInfo
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_PlayerBlood
readNetMsg(?CMD_GS2U_PlayerBlood,Bin0) ->
	{ V_blood, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_PlayerBlood {
		blood = V_blood
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_PlayerChangedWealth
readNetMsg(?CMD_GS2U_PlayerChangedWealth,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint( Bin0 ),
	{ V_wealth, Bin2 } = binary_read_uint( Bin1 ),
	{ V_reason, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_GS2U_PlayerChangedWealth {
		type = V_type,
		wealth = V_wealth,
		reason = V_reason
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_PlayerCour
readNetMsg(?CMD_GS2U_PlayerCour,Bin0) ->
	{ V_cour, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_PlayerCour {
		cour = V_cour
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_PlayerDead
readNetMsg(?CMD_GS2U_PlayerDead,Bin0) ->
	{ V_deadTime, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_code, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_normalReviveCDTime, Bin3 } = binary_read_uint( Bin2 ),
	{ V_reviveCost, Bin4 } = readMoneyInit( Bin3 ),
	{ V_attackCode, Bin5 } = binary_read_uint64( Bin4 ),
	{ V_attackName, Bin6 } = binary_read_string( Bin5 ),
	{ V_lostMoney, Bin7 } = binary_read_array(Bin6, fun(X) -> readMoneyInit( X ) end),
	{ V_reviveType, Bin8 } = binary_read_uint( Bin7 ),
	{ #pk_GS2U_PlayerDead {
		deadTime = V_deadTime,
		code = V_code,
		normalReviveCDTime = V_normalReviveCDTime,
		reviveCost = V_reviveCost,
		attackCode = V_attackCode,
		attackName = V_attackName,
		lostMoney = V_lostMoney,
		reviveType = V_reviveType
		},
	Bin8 };

%GENERATED from file:player.h => GS2U_PlayerHp
readNetMsg(?CMD_GS2U_PlayerHp,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_hp, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_PlayerHp {
		code = V_code,
		hp = V_hp
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_PlayerInitEnd
readNetMsg(?CMD_GS2U_PlayerInitEnd,Bin0) ->
	{ #pk_GS2U_PlayerInitEnd {

		},
	Bin0 };

%GENERATED from file:player.h => GS2U_PlayerLevelUp
readNetMsg(?CMD_GS2U_PlayerLevelUp,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_curExp, Bin2 } = binary_read_uint( Bin1 ),
	{ V_maxExp, Bin3 } = binary_read_uint( Bin2 ),
	{ V_addExp, Bin4 } = binary_read_uint( Bin3 ),
	{ V_level, Bin5 } = binary_read_uint8( Bin4 ),
	{ #pk_GS2U_PlayerLevelUp {
		code = V_code,
		curExp = V_curExp,
		maxExp = V_maxExp,
		addExp = V_addExp,
		level = V_level
		},
	Bin5 };

%GENERATED from file:player.h => GS2U_PlayerPhys
readNetMsg(?CMD_GS2U_PlayerPhys,Bin0) ->
	{ V_phys, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_PlayerPhys {
		phys = V_phys
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_PlayerRevive
readNetMsg(?CMD_GS2U_PlayerRevive,Bin0) ->
	{ V_mapId, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_x, Bin2 } = binary_read_float( Bin1 ),
	{ V_y, Bin3 } = binary_read_float( Bin2 ),
	{ V_curHp, Bin4 } = binary_read_uint( Bin3 ),
	{ V_maxHp, Bin5 } = binary_read_uint( Bin4 ),
	{ V_curPower, Bin6 } = binary_read_uint( Bin5 ),
	{ V_curPhys, Bin7 } = binary_read_uint( Bin6 ),
	{ #pk_GS2U_PlayerRevive {
		mapId = V_mapId,
		x = V_x,
		y = V_y,
		curHp = V_curHp,
		maxHp = V_maxHp,
		curPower = V_curPower,
		curPhys = V_curPhys
		},
	Bin7 };

%GENERATED from file:player.h => GS2U_PlayerSp
readNetMsg(?CMD_GS2U_PlayerSp,Bin0) ->
	{ V_sp, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_PlayerSp {
		sp = V_sp
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_PlotDialogue
readNetMsg(?CMD_GS2U_PlotDialogue,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_PlotDialogue {
		id = V_id
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_PropSync
readNetMsg(?CMD_GS2U_PropSync,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_ints, Bin2 } = binary_read_array(Bin1, fun(X) -> readPropInt( X ) end),
	{ V_int64s, Bin3 } = binary_read_array(Bin2, fun(X) -> readPropInt64( X ) end),
	{ V_floats, Bin4 } = binary_read_array(Bin3, fun(X) -> readPropFloat( X ) end),
	{ V_strs, Bin5 } = binary_read_array(Bin4, fun(X) -> readPropString( X ) end),
	{ #pk_GS2U_PropSync {
		code = V_code,
		ints = V_ints,
		int64s = V_int64s,
		floats = V_floats,
		strs = V_strs
		},
	Bin5 };

%GENERATED from file:player.h => GS2U_PushInfo
readNetMsg(?CMD_GS2U_PushInfo,Bin0) ->
	{ V_items, Bin1 } = binary_read_array(Bin0, fun(X) -> readpushItem( X ) end),
	{ V_startTime, Bin2 } = binary_read_uint( Bin1 ),
	{ V_endTime, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GS2U_PushInfo {
		items = V_items,
		startTime = V_startTime,
		endTime = V_endTime
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_RaceApplyInfo_Sync
readNetMsg(?CMD_GS2U_RaceApplyInfo_Sync,Bin0) ->
	{ V_info, Bin1 } = readRaceTeamBase( Bin0 ),
	{ #pk_GS2U_RaceApplyInfo_Sync {
		info = V_info
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_RaceApply_Ack
readNetMsg(?CMD_GS2U_RaceApply_Ack,Bin0) ->
	{ V_info, Bin1 } = readRaceTeamBase( Bin0 ),
	{ #pk_GS2U_RaceApply_Ack {
		info = V_info
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_RaceCancel_Ack
readNetMsg(?CMD_GS2U_RaceCancel_Ack,Bin0) ->
	{ V_role, Bin1 } = readCrossRoleBase( Bin0 ),
	{ #pk_GS2U_RaceCancel_Ack {
		role = V_role
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_RaceMapGiveUp_Sync
readNetMsg(?CMD_GS2U_RaceMapGiveUp_Sync,Bin0) ->
	{ V_isComplete, Bin1 } = binary_read_bool( Bin0 ),
	{ V_reason, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_role, Bin3 } = readCrossRoleBase( Bin2 ),
	{ #pk_GS2U_RaceMapGiveUp_Sync {
		isComplete = V_isComplete,
		reason = V_reason,
		role = V_role
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_RaceMapItem_Sync
readNetMsg(?CMD_GS2U_RaceMapItem_Sync,Bin0) ->
	{ V_applyID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_getOrUse, Bin3 } = binary_read_bool( Bin2 ),
	{ V_itemID, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_item, Bin5 } = readRaceTeamItem( Bin4 ),
	{ #pk_GS2U_RaceMapItem_Sync {
		applyID = V_applyID,
		roleID = V_roleID,
		getOrUse = V_getOrUse,
		itemID = V_itemID,
		item = V_item
		},
	Bin5 };

%GENERATED from file:player.h => GS2U_RaceMapMilestone_Sync
readNetMsg(?CMD_GS2U_RaceMapMilestone_Sync,Bin0) ->
	{ V_applyID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_sort, Bin2 } = readRaceTeamSort( Bin1 ),
	{ #pk_GS2U_RaceMapMilestone_Sync {
		applyID = V_applyID,
		sort = V_sort
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_RaceMapState_Sync
readNetMsg(?CMD_GS2U_RaceMapState_Sync,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_state, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_sec, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_info, Bin4 } = binary_read_array(Bin3, fun(X) -> readRaceTeamEx( X ) end),
	{ #pk_GS2U_RaceMapState_Sync {
		type = V_type,
		state = V_state,
		sec = V_sec,
		info = V_info
		},
	Bin4 };

%GENERATED from file:player.h => GS2U_RaceType_Sync
readNetMsg(?CMD_GS2U_RaceType_Sync,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_GS2U_RaceType_Sync {
		type = V_type
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_ReceivePlayerLevelRewardResult
readNetMsg(?CMD_GS2U_ReceivePlayerLevelRewardResult,Bin0) ->
	{ V_level, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_GS2U_ReceivePlayerLevelRewardResult {
		level = V_level
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_ReconnectLoginRequestFail
readNetMsg(?CMD_GS2U_ReconnectLoginRequestFail,Bin0) ->
	{ #pk_GS2U_ReconnectLoginRequestFail {

		},
	Bin0 };

%GENERATED from file:player.h => GS2U_RequestAutoDealAck
readNetMsg(?CMD_GS2U_RequestAutoDealAck,Bin0) ->
	{ V_isSuccess, Bin1 } = binary_read_bool( Bin0 ),
	{ V_copyMapID, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_coinReward, Bin3 } = binary_read_array(Bin2, fun(X) -> readCoinData( X ) end),
	{ V_expReward, Bin4 } = binary_read_uint64( Bin3 ),
	{ V_dropItems, Bin5 } = binary_read_array(Bin4, fun(X) -> readCopyMapDropItem( X ) end),
	{ #pk_GS2U_RequestAutoDealAck {
		isSuccess = V_isSuccess,
		copyMapID = V_copyMapID,
		coinReward = V_coinReward,
		expReward = V_expReward,
		dropItems = V_dropItems
		},
	Bin5 };

%GENERATED from file:player.h => GS2U_RequestGoddessCodeAck
readNetMsg(?CMD_GS2U_RequestGoddessCodeAck,Bin0) ->
	{ V_goddessCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_GS2U_RequestGoddessCodeAck {
		goddessCode = V_goddessCode
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_RequestRechargeAck
readNetMsg(?CMD_GS2U_RequestRechargeAck,Bin0) ->
	{ V_funcellOrderID, Bin1 } = binary_read_string( Bin0 ),
	{ V_moneyNun, Bin2 } = binary_read_float( Bin1 ),
	{ #pk_GS2U_RequestRechargeAck {
		funcellOrderID = V_funcellOrderID,
		moneyNun = V_moneyNun
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_RequestRechargeHasGiftIDListAck
readNetMsg(?CMD_GS2U_RequestRechargeHasGiftIDListAck,Bin0) ->
	{ V_takenIDList, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint( X ) end),
	{ V_confIDList, Bin2 } = binary_read_array(Bin1, fun(X) -> readRechargeDoubleConf( X ) end),
	{ #pk_GS2U_RequestRechargeHasGiftIDListAck {
		takenIDList = V_takenIDList,
		confIDList = V_confIDList
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_RequestTargetCopyMapScore
readNetMsg(?CMD_GS2U_RequestTargetCopyMapScore,Bin0) ->
	{ V_targetCopyMapID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_highestScore, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_RequestTargetCopyMapScore {
		targetCopyMapID = V_targetCopyMapID,
		highestScore = V_highestScore
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_ResetCopyMap
readNetMsg(?CMD_GS2U_ResetCopyMap,Bin0) ->
	{ V_copyMapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_ResetCopyMap {
		copyMapID = V_copyMapID
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_RespChatVoice
readNetMsg(?CMD_GS2U_RespChatVoice,Bin0) ->
	{ V_count, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_index, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_playerCode, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_key, Bin4 } = binary_read_uint( Bin3 ),
	{ V_data, Bin5 } = binary_read_array(Bin4, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_GS2U_RespChatVoice {
		count = V_count,
		index = V_index,
		playerCode = V_playerCode,
		key = V_key,
		data = V_data
		},
	Bin5 };

%GENERATED from file:player.h => GS2U_RespChatVoiceError
readNetMsg(?CMD_GS2U_RespChatVoiceError,Bin0) ->
	{ V_playerCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_key, Bin2 } = binary_read_uint( Bin1 ),
	{ V_errorCode, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_GS2U_RespChatVoiceError {
		playerCode = V_playerCode,
		key = V_key,
		errorCode = V_errorCode
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_SelPlayerResult
readNetMsg(?CMD_GS2U_SelPlayerResult,Bin0) ->
	{ V_result, Bin1 } = binary_read_int( Bin0 ),
	{ #pk_GS2U_SelPlayerResult {
		result = V_result
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_SendGiftNotice
readNetMsg(?CMD_GS2U_SendGiftNotice,Bin0) ->
	{ V_ids, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_GS2U_SendGiftNotice {
		ids = V_ids
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_SendPlayerDailyCountList
readNetMsg(?CMD_GS2U_SendPlayerDailyCountList,Bin0) ->
	{ V_playerDailyCountList, Bin1 } = binary_read_array(Bin0, fun(X) -> readPlayerDailyCount( X ) end),
	{ #pk_GS2U_SendPlayerDailyCountList {
		playerDailyCountList = V_playerDailyCountList
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_SessionKey
readNetMsg(?CMD_GS2U_SessionKey,Bin0) ->
	{ V_key, Bin1 } = binary_read_string( Bin0 ),
	{ #pk_GS2U_SessionKey {
		key = V_key
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_SetUpAnchor
readNetMsg(?CMD_GS2U_SetUpAnchor,Bin0) ->
	{ V_args, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_int64( X ) end),
	{ #pk_GS2U_SetUpAnchor {
		args = V_args
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_SevenDayAimReward_Ack
readNetMsg(?CMD_GS2U_SevenDayAimReward_Ack,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_SevenDayAimReward_Ack {
		id = V_id
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_SevenDayAimState_Sync
readNetMsg(?CMD_GS2U_SevenDayAimState_Sync,Bin0) ->
	{ V_timeBegin, Bin1 } = binary_read_uint( Bin0 ),
	{ V_conditions, Bin2 } = binary_read_array(Bin1, fun(X) -> readSevenDayAimUpdate( X ) end),
	{ V_alreadyReward, Bin3 } = binary_read_array(Bin2, fun(X) -> binary_read_uint16( X ) end),
	{ #pk_GS2U_SevenDayAimState_Sync {
		timeBegin = V_timeBegin,
		conditions = V_conditions,
		alreadyReward = V_alreadyReward
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_SevenDayAimUpdate_Sync
readNetMsg(?CMD_GS2U_SevenDayAimUpdate_Sync,Bin0) ->
	{ V_type, Bin1 } = binary_read_int( Bin0 ),
	{ V_args, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_int64( X ) end),
	{ #pk_GS2U_SevenDayAimUpdate_Sync {
		type = V_type,
		args = V_args
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_ShiftTo
readNetMsg(?CMD_GS2U_ShiftTo,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_posX, Bin2 } = binary_read_float( Bin1 ),
	{ V_posY, Bin3 } = binary_read_float( Bin2 ),
	{ #pk_GS2U_ShiftTo {
		code = V_code,
		posX = V_posX,
		posY = V_posY
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_ShowAction
readNetMsg(?CMD_GS2U_ShowAction,Bin0) ->
	{ V_playerCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_actionIndex, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_ShowAction {
		playerCode = V_playerCode,
		actionIndex = V_actionIndex
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_SpecificEvent_Sync
readNetMsg(?CMD_GS2U_SpecificEvent_Sync,Bin0) ->
	{ V_eventID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_initOrSettle, Bin2 } = binary_read_bool( Bin1 ),
	{ V_scheduleID, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GS2U_SpecificEvent_Sync {
		eventID = V_eventID,
		initOrSettle = V_initOrSettle,
		scheduleID = V_scheduleID
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_StopMove
readNetMsg(?CMD_GS2U_StopMove,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_posX, Bin2 } = binary_read_float( Bin1 ),
	{ V_posY, Bin3 } = binary_read_float( Bin2 ),
	{ #pk_GS2U_StopMove {
		code = V_code,
		posX = V_posX,
		posY = V_posY
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_SyncServerTime
readNetMsg(?CMD_GS2U_SyncServerTime,Bin0) ->
	{ V_time, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_SyncServerTime {
		time = V_time
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_TaskUseItemList
readNetMsg(?CMD_GS2U_TaskUseItemList,Bin0) ->
	{ V_useItemlist, Bin1 } = binary_read_array(Bin0, fun(X) -> readTaskUseItem( X ) end),
	{ #pk_GS2U_TaskUseItemList {
		useItemlist = V_useItemlist
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_ThirtyDayLoginGiftState_Sync
readNetMsg(?CMD_GS2U_ThirtyDayLoginGiftState_Sync,Bin0) ->
	{ V_timeBegin, Bin1 } = binary_read_uint( Bin0 ),
	{ V_alreadyReward, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_GS2U_ThirtyDayLoginGiftState_Sync {
		timeBegin = V_timeBegin,
		alreadyReward = V_alreadyReward
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_ThirtyDayLoginGift_Ack
readNetMsg(?CMD_GS2U_ThirtyDayLoginGift_Ack,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_ThirtyDayLoginGift_Ack {
		id = V_id
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_TipsError
readNetMsg(?CMD_GS2U_TipsError,Bin0) ->
	{ V_errorCode, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_TipsError {
		errorCode = V_errorCode
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_TipsString
readNetMsg(?CMD_GS2U_TipsString,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_tips, Bin2 } = binary_read_string( Bin1 ),
	{ V_params, Bin3 } = binary_read_array(Bin2, fun(X) -> binary_read_string( X ) end),
	{ #pk_GS2U_TipsString {
		type = V_type,
		tips = V_tips,
		params = V_params
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_TransferNewPos
readNetMsg(?CMD_GS2U_TransferNewPos,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_pos, Bin2 } = readPosInfo( Bin1 ),
	{ #pk_GS2U_TransferNewPos {
		code = V_code,
		pos = V_pos
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_UserPlayerList
readNetMsg(?CMD_GS2U_UserPlayerList,Bin0) ->
	{ V_unlockNewRace, Bin1 } = binary_read_int( Bin0 ),
	{ V_info, Bin2 } = binary_read_array(Bin1, fun(X) -> readUserPlayerData( X ) end),
	{ #pk_GS2U_UserPlayerList {
		unlockNewRace = V_unlockNewRace,
		info = V_info
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_WingRise
readNetMsg(?CMD_GS2U_WingRise,Bin0) ->
	{ V_itemID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_expChange, Bin2 } = binary_read_int( Bin1 ),
	{ #pk_GS2U_WingRise {
		itemID = V_itemID,
		expChange = V_expChange
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_WorldBossBuyBuff
readNetMsg(?CMD_GS2U_WorldBossBuyBuff,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_GS2U_WorldBossBuyBuff {
		type = V_type
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_XmlNoticeResponse
readNetMsg(?CMD_GS2U_XmlNoticeResponse,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_ret, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_content, Bin3 } = binary_read_string( Bin2 ),
	{ V_sign, Bin4 } = binary_read_string( Bin3 ),
	{ #pk_GS2U_XmlNoticeResponse {
		type = V_type,
		ret = V_ret,
		content = V_content,
		sign = V_sign
		},
	Bin4 };

%GENERATED from file:player.h => GS2U_action_point_info
readNetMsg(?CMD_GS2U_action_point_info,Bin0) ->
	{ V_value, Bin1 } = binary_read_uint( Bin0 ),
	{ V_lastUpdateUtcTime, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_action_point_info {
		value = V_value,
		lastUpdateUtcTime = V_lastUpdateUtcTime
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_copy_map_destory_time
readNetMsg(?CMD_GS2U_copy_map_destory_time,Bin0) ->
	{ V_copyMapID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_destoryTime, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_waitTime, Bin3 } = binary_read_uint64( Bin2 ),
	{ #pk_GS2U_copy_map_destory_time {
		copyMapID = V_copyMapID,
		destoryTime = V_destoryTime,
		waitTime = V_waitTime
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_lottery_award_items
readNetMsg(?CMD_GS2U_lottery_award_items,Bin0) ->
	{ V_award_item_list, Bin1 } = binary_read_array(Bin0, fun(X) -> readlottery_award_item_info( X ) end),
	{ V_award_item_list_sp, Bin2 } = binary_read_array(Bin1, fun(X) -> readlottery_award_item_info( X ) end),
	{ #pk_GS2U_lottery_award_items {
		award_item_list = V_award_item_list,
		award_item_list_sp = V_award_item_list_sp
		},
	Bin2 };

%GENERATED from file:player.h => GS2U_lottery_sys_info
readNetMsg(?CMD_GS2U_lottery_sys_info,Bin0) ->
	{ V_goblin_lottery_last_free_times, Bin1 } = binary_read_int16( Bin0 ),
	{ V_goblin_lottery_free_cd, Bin2 } = binary_read_uint( Bin1 ),
	{ V_treasure_lottery_last_free_times, Bin3 } = binary_read_uint( Bin2 ),
	{ V_treasure_lottery_free_cd, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_GS2U_lottery_sys_info {
		goblin_lottery_last_free_times = V_goblin_lottery_last_free_times,
		goblin_lottery_free_cd = V_goblin_lottery_free_cd,
		treasure_lottery_last_free_times = V_treasure_lottery_last_free_times,
		treasure_lottery_free_cd = V_treasure_lottery_free_cd
		},
	Bin4 };

%GENERATED from file:player.h => GS2U_lsbattlefield_award_list
readNetMsg(?CMD_GS2U_lsbattlefield_award_list,Bin0) ->
	{ V_index, Bin1 } = binary_read_uint( Bin0 ),
	{ V_award_list, Bin2 } = binary_read_array(Bin1, fun(X) -> readlsbattlefield_award( X ) end),
	{ V_coinType, Bin3 } = binary_read_uint( Bin2 ),
	{ V_coinValue, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_GS2U_lsbattlefield_award_list {
		index = V_index,
		award_list = V_award_list,
		coinType = V_coinType,
		coinValue = V_coinValue
		},
	Bin4 };

%GENERATED from file:player.h => GS2U_lsbattlefield_rank_list
readNetMsg(?CMD_GS2U_lsbattlefield_rank_list,Bin0) ->
	{ V_rank_list, Bin1 } = binary_read_array(Bin0, fun(X) -> readlsbattlefield_rank( X ) end),
	{ #pk_GS2U_lsbattlefield_rank_list {
		rank_list = V_rank_list
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_monsterChange
readNetMsg(?CMD_GS2U_monsterChange,Bin0) ->
	{ V_number, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_monsterChange {
		number = V_number
		},
	Bin1 };

%GENERATED from file:player.h => GS2U_returnFriendPos
readNetMsg(?CMD_GS2U_returnFriendPos,Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_x, Bin2 } = binary_read_float( Bin1 ),
	{ V_y, Bin3 } = binary_read_float( Bin2 ),
	{ #pk_GS2U_returnFriendPos {
		mapID = V_mapID,
		x = V_x,
		y = V_y
		},
	Bin3 };

%GENERATED from file:player.h => GS2U_synch_lsbattlefield_state
readNetMsg(?CMD_GS2U_synch_lsbattlefield_state,Bin0) ->
	{ V_state, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_synch_lsbattlefield_state {
		state = V_state
		},
	Bin1 };

%GENERATED from file:player.h => GetPlayerOnlineReward
readNetMsg(?CMD_GetPlayerOnlineReward,Bin0) ->
	{ V_timeID, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GetPlayerOnlineReward {
		timeID = V_timeID
		},
	Bin1 };

%GENERATED from file:player.h => PlayerLevelReward
readNetMsg(?CMD_PlayerLevelReward,Bin0) ->
	{ V_receiveRewardLevel, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_PlayerLevelReward {
		receiveRewardLevel = V_receiveRewardLevel
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_AcceptHolidayTask
readNetMsg(?CMD_U2GS_AcceptHolidayTask,Bin0) ->
	{ #pk_U2GS_AcceptHolidayTask {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_ActiveCodeRequest
readNetMsg(?CMD_U2GS_ActiveCodeRequest,Bin0) ->
	{ V_code, Bin1 } = binary_read_string( Bin0 ),
	{ #pk_U2GS_ActiveCodeRequest {
		code = V_code
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_Buy4System
readNetMsg(?CMD_U2GS_Buy4System,Bin0) ->
	{ V_costID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_number, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_Buy4System {
		costID = V_costID,
		number = V_number
		},
	Bin2 };

%GENERATED from file:player.h => U2GS_BuyLimitSales
readNetMsg(?CMD_U2GS_BuyLimitSales,Bin0) ->
	{ V_sku, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_BuyLimitSales {
		sku = V_sku
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_ChangeCarrer
readNetMsg(?CMD_U2GS_ChangeCarrer,Bin0) ->
	{ V_newCareer, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_ChangeCarrer {
		newCareer = V_newCareer
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_ChangeLineLoginRequest
readNetMsg(?CMD_U2GS_ChangeLineLoginRequest,Bin0) ->
	{ V_accountID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_key, Bin3 } = binary_read_string( Bin2 ),
	{ V_protocolVer, Bin4 } = binary_read_int( Bin3 ),
	{ #pk_U2GS_ChangeLineLoginRequest {
		accountID = V_accountID,
		roleID = V_roleID,
		key = V_key,
		protocolVer = V_protocolVer
		},
	Bin4 };

%GENERATED from file:player.h => U2GS_ChangeLineRequest
readNetMsg(?CMD_U2GS_ChangeLineRequest,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_ChangeLineRequest {
		type = V_type
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_ChangeLineRequestAck
readNetMsg(?CMD_U2GS_ChangeLineRequestAck,Bin0) ->
	{ V_yes, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_ChangeLineRequestAck {
		yes = V_yes
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_ChangeName
readNetMsg(?CMD_U2GS_ChangeName,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_U2GS_ChangeName {
		roleID = V_roleID,
		name = V_name
		},
	Bin2 };

%GENERATED from file:player.h => U2GS_ChangeWingLevel
readNetMsg(?CMD_U2GS_ChangeWingLevel,Bin0) ->
	{ V_level, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_ChangeWingLevel {
		level = V_level
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_ChatInfo
readNetMsg(?CMD_U2GS_ChatInfo,Bin0) ->
	{ V_channel, Bin1 } = binary_read_int8( Bin0 ),
	{ V_receiverID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_receiverName, Bin3 } = binary_read_string( Bin2 ),
	{ V_content, Bin4 } = binary_read_string( Bin3 ),
	{ #pk_U2GS_ChatInfo {
		channel = V_channel,
		receiverID = V_receiverID,
		receiverName = V_receiverName,
		content = V_content
		},
	Bin4 };

%GENERATED from file:player.h => U2GS_ChatVoice
readNetMsg(?CMD_U2GS_ChatVoice,Bin0) ->
	{ V_count, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_index, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_playerCode, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_key, Bin4 } = binary_read_uint( Bin3 ),
	{ V_data, Bin5 } = binary_read_array(Bin4, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_U2GS_ChatVoice {
		count = V_count,
		index = V_index,
		playerCode = V_playerCode,
		key = V_key,
		data = V_data
		},
	Bin5 };

%GENERATED from file:player.h => U2GS_CommonditiesPush
readNetMsg(?CMD_U2GS_CommonditiesPush,Bin0) ->
	{ #pk_U2GS_CommonditiesPush {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_CopyChat
readNetMsg(?CMD_U2GS_CopyChat,Bin0) ->
	{ #pk_U2GS_CopyChat {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_DashTo
readNetMsg(?CMD_U2GS_DashTo,Bin0) ->
	{ V_posX, Bin1 } = binary_read_float( Bin0 ),
	{ V_posY, Bin2 } = binary_read_float( Bin1 ),
	{ #pk_U2GS_DashTo {
		posX = V_posX,
		posY = V_posY
		},
	Bin2 };

%GENERATED from file:player.h => U2GS_DigTransferMap
readNetMsg(?CMD_U2GS_DigTransferMap,Bin0) ->
	{ V_mapId, Bin1 } = binary_read_uint( Bin0 ),
	{ V_waypointName, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_U2GS_DigTransferMap {
		mapId = V_mapId,
		waypointName = V_waypointName
		},
	Bin2 };

%GENERATED from file:player.h => U2GS_EnterActiveMap
readNetMsg(?CMD_U2GS_EnterActiveMap,Bin0) ->
	{ V_npcCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_activeID, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_U2GS_EnterActiveMap {
		npcCode = V_npcCode,
		activeID = V_activeID
		},
	Bin2 };

%GENERATED from file:player.h => U2GS_EnterCopyMap
readNetMsg(?CMD_U2GS_EnterCopyMap,Bin0) ->
	{ V_copyMapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_EnterCopyMap {
		copyMapID = V_copyMapID
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_EnteredMap
readNetMsg(?CMD_U2GS_EnteredMap,Bin0) ->
	{ #pk_U2GS_EnteredMap {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_EqupmentCombin
readNetMsg(?CMD_U2GS_EqupmentCombin,Bin0) ->
	{ V_combinID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_equpmentUIDList, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_U2GS_EqupmentCombin {
		combinID = V_combinID,
		equpmentUIDList = V_equpmentUIDList
		},
	Bin2 };

%GENERATED from file:player.h => U2GS_GetLeavedExp
readNetMsg(?CMD_U2GS_GetLeavedExp,Bin0) ->
	{ V_getType, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_GetLeavedExp {
		getType = V_getType
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_GetMapLevel
readNetMsg(?CMD_U2GS_GetMapLevel,Bin0) ->
	{ #pk_U2GS_GetMapLevel {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_GetUpdateReward
readNetMsg(?CMD_U2GS_GetUpdateReward,Bin0) ->
	{ V_count, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_GetUpdateReward {
		count = V_count
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_GetVipReward
readNetMsg(?CMD_U2GS_GetVipReward,Bin0) ->
	{ V_vipLevel, Bin1 } = binary_read_int16( Bin0 ),
	{ #pk_U2GS_GetVipReward {
		vipLevel = V_vipLevel
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_GoToExpMap
readNetMsg(?CMD_U2GS_GoToExpMap,Bin0) ->
	{ #pk_U2GS_GoToExpMap {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_HeartBeat
readNetMsg(?CMD_U2GS_HeartBeat,Bin0) ->
	{ V_time, Bin1 } = binary_read_uint( Bin0 ),
	{ V_version, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_HeartBeat {
		time = V_time,
		version = V_version
		},
	Bin2 };

%GENERATED from file:player.h => U2GS_HeartBeatReal
readNetMsg(?CMD_U2GS_HeartBeatReal,Bin0) ->
	{ V_time, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_HeartBeatReal {
		time = V_time
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_Join_lsbattlefield
readNetMsg(?CMD_U2GS_Join_lsbattlefield,Bin0) ->
	{ #pk_U2GS_Join_lsbattlefield {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_KillValueRequest
readNetMsg(?CMD_U2GS_KillValueRequest,Bin0) ->
	{ #pk_U2GS_KillValueRequest {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_LeaveCopyMap
readNetMsg(?CMD_U2GS_LeaveCopyMap,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_LeaveCopyMap {
		type = V_type
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_LoadedMap
readNetMsg(?CMD_U2GS_LoadedMap,Bin0) ->
	{ #pk_U2GS_LoadedMap {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_LotteryForTowerInfo
readNetMsg(?CMD_U2GS_LotteryForTowerInfo,Bin0) ->
	{ #pk_U2GS_LotteryForTowerInfo {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_LotteryForTowerRandonAward
readNetMsg(?CMD_U2GS_LotteryForTowerRandonAward,Bin0) ->
	{ V_randomNumber, Bin1 } = binary_read_uint( Bin0 ),
	{ V_isShowPanel, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_U2GS_LotteryForTowerRandonAward {
		randomNumber = V_randomNumber,
		isShowPanel = V_isShowPanel
		},
	Bin2 };

%GENERATED from file:player.h => U2GS_MoneyTree
readNetMsg(?CMD_U2GS_MoneyTree,Bin0) ->
	{ #pk_U2GS_MoneyTree {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_MonsterBookReward_Request
readNetMsg(?CMD_U2GS_MonsterBookReward_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_MonsterBookReward_Request {
		id = V_id
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_MonsterBookSnap_Request
readNetMsg(?CMD_U2GS_MonsterBookSnap_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_MonsterBookSnap_Request {
		id = V_id
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_MonsterBookUnlock_Request
readNetMsg(?CMD_U2GS_MonsterBookUnlock_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_MonsterBookUnlock_Request {
		id = V_id
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_MonsterBook_Request
readNetMsg(?CMD_U2GS_MonsterBook_Request,Bin0) ->
	{ #pk_U2GS_MonsterBook_Request {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_MonthCardGettingEvent
readNetMsg(?CMD_U2GS_MonthCardGettingEvent,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_MonthCardGettingEvent {
		type = V_type
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_MoveTo
readNetMsg(?CMD_U2GS_MoveTo,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_posX, Bin2 } = binary_read_float( Bin1 ),
	{ V_posY, Bin3 } = binary_read_float( Bin2 ),
	{ V_posInfos, Bin4 } = binary_read_array(Bin3, fun(X) -> readPosInfo( X ) end),
	{ #pk_U2GS_MoveTo {
		code = V_code,
		posX = V_posX,
		posY = V_posY,
		posInfos = V_posInfos
		},
	Bin4 };

%GENERATED from file:player.h => U2GS_NeedForSpeedCancel
readNetMsg(?CMD_U2GS_NeedForSpeedCancel,Bin0) ->
	{ #pk_U2GS_NeedForSpeedCancel {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_NeedForSpeedCollideRoadBox
readNetMsg(?CMD_U2GS_NeedForSpeedCollideRoadBox,Bin0) ->
	{ V_collideBoxId, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_NeedForSpeedCollideRoadBox {
		collideBoxId = V_collideBoxId
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_NeedForSpeedCollideRoadScoreLine
readNetMsg(?CMD_U2GS_NeedForSpeedCollideRoadScoreLine,Bin0) ->
	{ V_collideScoreLineId, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_NeedForSpeedCollideRoadScoreLine {
		collideScoreLineId = V_collideScoreLineId
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_NeedForSpeedJoin
readNetMsg(?CMD_U2GS_NeedForSpeedJoin,Bin0) ->
	{ #pk_U2GS_NeedForSpeedJoin {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_NeedForSpeedQuite
readNetMsg(?CMD_U2GS_NeedForSpeedQuite,Bin0) ->
	{ #pk_U2GS_NeedForSpeedQuite {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_NeedForSpeedUseItem
readNetMsg(?CMD_U2GS_NeedForSpeedUseItem,Bin0) ->
	{ V_itemID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_targetRoleIDList, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_U2GS_NeedForSpeedUseItem {
		itemID = V_itemID,
		targetRoleIDList = V_targetRoleIDList
		},
	Bin2 };

%GENERATED from file:player.h => U2GS_NoticeRequest
readNetMsg(?CMD_U2GS_NoticeRequest,Bin0) ->
	{ V_md5, Bin1 } = binary_read_string( Bin0 ),
	{ #pk_U2GS_NoticeRequest {
		md5 = V_md5
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_PlayerAwakenUseItem
readNetMsg(?CMD_U2GS_PlayerAwakenUseItem,Bin0) ->
	{ V_num, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_PlayerAwakenUseItem {
		num = V_num
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_PlayerCoupleBack
readNetMsg(?CMD_U2GS_PlayerCoupleBack,Bin0) ->
	{ V_cbType, Bin1 } = binary_read_uint( Bin0 ),
	{ V_cbContent, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_U2GS_PlayerCoupleBack {
		cbType = V_cbType,
		cbContent = V_cbContent
		},
	Bin2 };

%GENERATED from file:player.h => U2GS_PlotDialogueEnd
readNetMsg(?CMD_U2GS_PlotDialogueEnd,Bin0) ->
	{ #pk_U2GS_PlotDialogueEnd {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_QueryTargetObject
readNetMsg(?CMD_U2GS_QueryTargetObject,Bin0) ->
	{ V_targetCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_QueryTargetObject {
		targetCode = V_targetCode
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_RaceApply_Request
readNetMsg(?CMD_U2GS_RaceApply_Request,Bin0) ->
	{ #pk_U2GS_RaceApply_Request {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_RaceCancel_Request
readNetMsg(?CMD_U2GS_RaceCancel_Request,Bin0) ->
	{ #pk_U2GS_RaceCancel_Request {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_RaceMapItem_Request
readNetMsg(?CMD_U2GS_RaceMapItem_Request,Bin0) ->
	{ V_itemID, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_RaceMapItem_Request {
		itemID = V_itemID
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_RecClientEvent
readNetMsg(?CMD_U2GS_RecClientEvent,Bin0) ->
	{ V_eventID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_eventTime, Bin2 } = binary_read_uint( Bin1 ),
	{ V_eventArgs, Bin3 } = binary_read_string( Bin2 ),
	{ #pk_U2GS_RecClientEvent {
		eventID = V_eventID,
		eventTime = V_eventTime,
		eventArgs = V_eventArgs
		},
	Bin3 };

%GENERATED from file:player.h => U2GS_ReceivePlayerLevelReward
readNetMsg(?CMD_U2GS_ReceivePlayerLevelReward,Bin0) ->
	{ V_level, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_ReceivePlayerLevelReward {
		level = V_level
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_RechargeGettingEvent
readNetMsg(?CMD_U2GS_RechargeGettingEvent,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint( Bin0 ),
	{ V_grade, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_RechargeGettingEvent {
		type = V_type,
		grade = V_grade
		},
	Bin2 };

%GENERATED from file:player.h => U2GS_ReconnectLoginRequest
readNetMsg(?CMD_U2GS_ReconnectLoginRequest,Bin0) ->
	{ V_accountID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_key, Bin3 } = binary_read_string( Bin2 ),
	{ V_protocolVer, Bin4 } = binary_read_int( Bin3 ),
	{ #pk_U2GS_ReconnectLoginRequest {
		accountID = V_accountID,
		roleID = V_roleID,
		key = V_key,
		protocolVer = V_protocolVer
		},
	Bin4 };

%GENERATED from file:player.h => U2GS_ReqChatVoice
readNetMsg(?CMD_U2GS_ReqChatVoice,Bin0) ->
	{ V_playerCode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_key, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_ReqChatVoice {
		playerCode = V_playerCode,
		key = V_key
		},
	Bin2 };

%GENERATED from file:player.h => U2GS_RequestCreatePlayer
readNetMsg(?CMD_U2GS_RequestCreatePlayer,Bin0) ->
	{ V_name, Bin1 } = binary_read_string( Bin0 ),
	{ V_camp, Bin2 } = binary_read_int8( Bin1 ),
	{ V_career, Bin3 } = binary_read_uint( Bin2 ),
	{ V_race, Bin4 } = binary_read_int8( Bin3 ),
	{ V_sex, Bin5 } = binary_read_int8( Bin4 ),
	{ V_head, Bin6 } = binary_read_int( Bin5 ),
	{ #pk_U2GS_RequestCreatePlayer {
		name = V_name,
		camp = V_camp,
		career = V_career,
		race = V_race,
		sex = V_sex,
		head = V_head
		},
	Bin6 };

%GENERATED from file:player.h => U2GS_RequestDeletePlayer
readNetMsg(?CMD_U2GS_RequestDeletePlayer,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_RequestDeletePlayer {
		roleID = V_roleID
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_RequestGoddessCode
readNetMsg(?CMD_U2GS_RequestGoddessCode,Bin0) ->
	{ #pk_U2GS_RequestGoddessCode {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_RequestLogin
readNetMsg(?CMD_U2GS_RequestLogin,Bin0) ->
	{ V_accountID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_key, Bin2 } = binary_read_string( Bin1 ),
	{ V_protocolVer, Bin3 } = binary_read_int( Bin2 ),
	{ #pk_U2GS_RequestLogin {
		accountID = V_accountID,
		key = V_key,
		protocolVer = V_protocolVer
		},
	Bin3 };

%GENERATED from file:player.h => U2GS_RequestObjInfo
readNetMsg(?CMD_U2GS_RequestObjInfo,Bin0) ->
	{ V_obj_type, Bin1 } = binary_read_int8( Bin0 ),
	{ V_codes, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_U2GS_RequestObjInfo {
		obj_type = V_obj_type,
		codes = V_codes
		},
	Bin2 };

%GENERATED from file:player.h => U2GS_RequestRecharge
readNetMsg(?CMD_U2GS_RequestRecharge,Bin0) ->
	{ V_funcellAccessToken, Bin1 } = binary_read_string( Bin0 ),
	{ V_funcellCilentID, Bin2 } = binary_read_string( Bin1 ),
	{ V_funcellOrderID, Bin3 } = binary_read_string( Bin2 ),
	{ V_extArgs, Bin4 } = binary_read_string( Bin3 ),
	{ #pk_U2GS_RequestRecharge {
		funcellAccessToken = V_funcellAccessToken,
		funcellCilentID = V_funcellCilentID,
		funcellOrderID = V_funcellOrderID,
		extArgs = V_extArgs
		},
	Bin4 };

%GENERATED from file:player.h => U2GS_RequestRechargeHasGiftIDList
readNetMsg(?CMD_U2GS_RequestRechargeHasGiftIDList,Bin0) ->
	{ #pk_U2GS_RequestRechargeHasGiftIDList {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_RequestRevive
readNetMsg(?CMD_U2GS_RequestRevive,Bin0) ->
	{ V_reviveType, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_RequestRevive {
		reviveType = V_reviveType
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_RequestTargetCopyMapScore
readNetMsg(?CMD_U2GS_RequestTargetCopyMapScore,Bin0) ->
	{ V_targetCopyMapID, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_RequestTargetCopyMapScore {
		targetCopyMapID = V_targetCopyMapID
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_ResetCopyMap
readNetMsg(?CMD_U2GS_ResetCopyMap,Bin0) ->
	{ V_copyMapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_ResetCopyMap {
		copyMapID = V_copyMapID
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_ResetPosToRevivePt
readNetMsg(?CMD_U2GS_ResetPosToRevivePt,Bin0) ->
	{ #pk_U2GS_ResetPosToRevivePt {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_SelPlayerEnterGame
readNetMsg(?CMD_U2GS_SelPlayerEnterGame,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_SelPlayerEnterGame {
		roleID = V_roleID
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_SelectTarget
readNetMsg(?CMD_U2GS_SelectTarget,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_SelectTarget {
		code = V_code
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_SessionKeyAck
readNetMsg(?CMD_U2GS_SessionKeyAck,Bin0) ->
	{ V_oldKey, Bin1 } = binary_read_string( Bin0 ),
	{ V_newKey, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_U2GS_SessionKeyAck {
		oldKey = V_oldKey,
		newKey = V_newKey
		},
	Bin2 };

%GENERATED from file:player.h => U2GS_SevenDayAimReward_Request
readNetMsg(?CMD_U2GS_SevenDayAimReward_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_SevenDayAimReward_Request {
		id = V_id
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_ShowAction
readNetMsg(?CMD_U2GS_ShowAction,Bin0) ->
	{ V_actionIndex, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_ShowAction {
		actionIndex = V_actionIndex
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_ShowHeadEmoticonIcon
readNetMsg(?CMD_U2GS_ShowHeadEmoticonIcon,Bin0) ->
	{ V_iconIndex, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_ShowHeadEmoticonIcon {
		iconIndex = V_iconIndex
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_StartMeditation
readNetMsg(?CMD_U2GS_StartMeditation,Bin0) ->
	{ V_istart, Bin1 } = binary_read_bool( Bin0 ),
	{ #pk_U2GS_StartMeditation {
		istart = V_istart
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_StopMove
readNetMsg(?CMD_U2GS_StopMove,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_posX, Bin2 } = binary_read_float( Bin1 ),
	{ V_posY, Bin3 } = binary_read_float( Bin2 ),
	{ #pk_U2GS_StopMove {
		code = V_code,
		posX = V_posX,
		posY = V_posY
		},
	Bin3 };

%GENERATED from file:player.h => U2GS_Telesport
readNetMsg(?CMD_U2GS_Telesport,Bin0) ->
	{ V_x, Bin1 } = binary_read_float( Bin0 ),
	{ V_y, Bin2 } = binary_read_float( Bin1 ),
	{ #pk_U2GS_Telesport {
		x = V_x,
		y = V_y
		},
	Bin2 };

%GENERATED from file:player.h => U2GS_ThirtyDayLoginGift_Request
readNetMsg(?CMD_U2GS_ThirtyDayLoginGift_Request,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_ThirtyDayLoginGift_Request {
		id = V_id
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_Transfer2NewPos
readNetMsg(?CMD_U2GS_Transfer2NewPos,Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_x, Bin2 } = binary_read_float( Bin1 ),
	{ V_y, Bin3 } = binary_read_float( Bin2 ),
	{ #pk_U2GS_Transfer2NewPos {
		mapID = V_mapID,
		x = V_x,
		y = V_y
		},
	Bin3 };

%GENERATED from file:player.h => U2GS_TransferMap
readNetMsg(?CMD_U2GS_TransferMap,Bin0) ->
	{ V_mapId, Bin1 } = binary_read_uint( Bin0 ),
	{ V_waypointName, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_U2GS_TransferMap {
		mapId = V_mapId,
		waypointName = V_waypointName
		},
	Bin2 };

%GENERATED from file:player.h => U2GS_WingRise
readNetMsg(?CMD_U2GS_WingRise,Bin0) ->
	{ V_itemID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_itemNum, Bin2 } = binary_read_uint( Bin1 ),
	{ V_firstBind, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_U2GS_WingRise {
		itemID = V_itemID,
		itemNum = V_itemNum,
		firstBind = V_firstBind
		},
	Bin3 };

%GENERATED from file:player.h => U2GS_WingRiseOneTouch
readNetMsg(?CMD_U2GS_WingRiseOneTouch,Bin0) ->
	{ #pk_U2GS_WingRiseOneTouch {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_XmlNoticeRequest
readNetMsg(?CMD_U2GS_XmlNoticeRequest,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_sign, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_U2GS_XmlNoticeRequest {
		type = V_type,
		sign = V_sign
		},
	Bin2 };

%GENERATED from file:player.h => U2GS_buy_action_count
readNetMsg(?CMD_U2GS_buy_action_count,Bin0) ->
	{ V_copyMapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_buy_action_count {
		copyMapID = V_copyMapID
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_buy_action_point
readNetMsg(?CMD_U2GS_buy_action_point,Bin0) ->
	{ #pk_U2GS_buy_action_point {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_getFriendPos
readNetMsg(?CMD_U2GS_getFriendPos,Bin0) ->
	{ V_friendID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_getFriendPos {
		friendID = V_friendID
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_get_action_point_info
readNetMsg(?CMD_U2GS_get_action_point_info,Bin0) ->
	{ #pk_U2GS_get_action_point_info {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_get_copy_map_destory_time
readNetMsg(?CMD_U2GS_get_copy_map_destory_time,Bin0) ->
	{ #pk_U2GS_get_copy_map_destory_time {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_get_lottery_sys_info
readNetMsg(?CMD_U2GS_get_lottery_sys_info,Bin0) ->
	{ #pk_U2GS_get_lottery_sys_info {

		},
	Bin0 };

%GENERATED from file:player.h => U2GS_lottery_start
readNetMsg(?CMD_U2GS_lottery_start,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_lottery_start {
		type = V_type
		},
	Bin1 };

%GENERATED from file:player.h => U2GS_save_current_guide_id
readNetMsg(?CMD_U2GS_save_current_guide_id,Bin0) ->
	{ V_guideID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_save_current_guide_id {
		guideID = V_guideID
		},
	Bin1 };

%GENERATED from file:rank.h => GS2U_ActivityMapRankData
readNetMsg(?CMD_GS2U_ActivityMapRankData,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_data, Bin2 } = binary_read_array(Bin1, fun(X) -> readActivityMapRankData( X ) end),
	{ #pk_GS2U_ActivityMapRankData {
		type = V_type,
		data = V_data
		},
	Bin2 };

%GENERATED from file:rank.h => GS2U_MyKillNumber
readNetMsg(?CMD_GS2U_MyKillNumber,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_killNumber, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_GS2U_MyKillNumber {
		type = V_type,
		killNumber = V_killNumber
		},
	Bin2 };

%GENERATED from file:rank.h => GS2U_MyRankingAndDamage
readNetMsg(?CMD_GS2U_MyRankingAndDamage,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_ranking, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_damage, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GS2U_MyRankingAndDamage {
		type = V_type,
		ranking = V_ranking,
		damage = V_damage
		},
	Bin3 };

%GENERATED from file:rank.h => GS2U_RefreshRank
readNetMsg(?CMD_GS2U_RefreshRank,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_GS2U_RefreshRank {
		type = V_type
		},
	Bin1 };

%GENERATED from file:rank.h => GS2U_SendPropList
readNetMsg(?CMD_GS2U_SendPropList,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_playerCode, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_career, Bin3 } = binary_read_uint( Bin2 ),
	{ V_race, Bin4 } = binary_read_int8( Bin3 ),
	{ V_sex, Bin5 } = binary_read_int8( Bin4 ),
	{ V_head, Bin6 } = binary_read_int( Bin5 ),
	{ V_wingLevel, Bin7 } = binary_read_int( Bin6 ),
	{ V_fashionIDs, Bin8 } = binary_read_array(Bin7, fun(X) -> binary_read_int( X ) end),
	{ V_equipIDList, Bin9 } = binary_read_array(Bin8, fun(X) -> readPlayerEquip( X ) end),
	{ V_equipLevelList, Bin10 } = binary_read_array(Bin9, fun(X) -> readPlayerEquipLevel( X ) end),
	{ #pk_GS2U_SendPropList {
		roleID = V_roleID,
		playerCode = V_playerCode,
		career = V_career,
		race = V_race,
		sex = V_sex,
		head = V_head,
		wingLevel = V_wingLevel,
		fashionIDs = V_fashionIDs,
		equipIDList = V_equipIDList,
		equipLevelList = V_equipLevelList
		},
	Bin10 };

%GENERATED from file:rank.h => GS2U_SendRank
readNetMsg(?CMD_GS2U_SendRank,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_datas, Bin2 } = binary_read_array(Bin1, fun(X) -> readRankInfo( X ) end),
	{ #pk_GS2U_SendRank {
		type = V_type,
		datas = V_datas
		},
	Bin2 };

%GENERATED from file:rank.h => U2GS_RequestActivityMapRank
readNetMsg(?CMD_U2GS_RequestActivityMapRank,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_RequestActivityMapRank {
		type = V_type
		},
	Bin1 };

%GENERATED from file:rank.h => U2GS_RequestPropList
readNetMsg(?CMD_U2GS_RequestPropList,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_roleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_U2GS_RequestPropList {
		type = V_type,
		roleID = V_roleID
		},
	Bin2 };

%GENERATED from file:rank.h => U2GS_RequestRank
readNetMsg(?CMD_U2GS_RequestRank,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_RequestRank {
		type = V_type
		},
	Bin1 };

%GENERATED from file:rank.h => U2GS_RequestRankAward
readNetMsg(?CMD_U2GS_RequestRankAward,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_RequestRankAward {
		type = V_type
		},
	Bin1 };

%GENERATED from file:redenvelope.h => GS2U_RedEnvelopeHistoryAck
readNetMsg(?CMD_GS2U_RedEnvelopeHistoryAck,Bin0) ->
	{ V_historyList, Bin1 } = binary_read_array(Bin0, fun(X) -> readredEnvelopeHistory( X ) end),
	{ #pk_GS2U_RedEnvelopeHistoryAck {
		historyList = V_historyList
		},
	Bin1 };

%GENERATED from file:redenvelope.h => GS2U_RedEnvelopeInfoAck
readNetMsg(?CMD_GS2U_RedEnvelopeInfoAck,Bin0) ->
	{ V_red, Bin1 } = readredEnvelopeInfo( Bin0 ),
	{ #pk_GS2U_RedEnvelopeInfoAck {
		red = V_red
		},
	Bin1 };

%GENERATED from file:redenvelope.h => GS2U_RedEnvelopeQuery
readNetMsg(?CMD_GS2U_RedEnvelopeQuery,Bin0) ->
	{ V_redEnvelopeList, Bin1 } = binary_read_array(Bin0, fun(X) -> readredEnvelopeBaseInfo( X ) end),
	{ #pk_GS2U_RedEnvelopeQuery {
		redEnvelopeList = V_redEnvelopeList
		},
	Bin1 };

%GENERATED from file:redenvelope.h => GS2U_RobRedEnvelopeAck
readNetMsg(?CMD_GS2U_RobRedEnvelopeAck,Bin0) ->
	{ V_robAmount, Bin1 } = binary_read_uint( Bin0 ),
	{ V_red, Bin2 } = readredEnvelopeInfo( Bin1 ),
	{ #pk_GS2U_RobRedEnvelopeAck {
		robAmount = V_robAmount,
		red = V_red
		},
	Bin2 };

%GENERATED from file:redenvelope.h => U2GS_GiveUpRedEnvelope
readNetMsg(?CMD_U2GS_GiveUpRedEnvelope,Bin0) ->
	{ #pk_U2GS_GiveUpRedEnvelope {

		},
	Bin0 };

%GENERATED from file:redenvelope.h => U2GS_RedEnvelopeHistory
readNetMsg(?CMD_U2GS_RedEnvelopeHistory,Bin0) ->
	{ #pk_U2GS_RedEnvelopeHistory {

		},
	Bin0 };

%GENERATED from file:redenvelope.h => U2GS_RedEnvelopeInfo
readNetMsg(?CMD_U2GS_RedEnvelopeInfo,Bin0) ->
	{ V_redUID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_RedEnvelopeInfo {
		redUID = V_redUID
		},
	Bin1 };

%GENERATED from file:redenvelope.h => U2GS_RedEnvelopeQuery
readNetMsg(?CMD_U2GS_RedEnvelopeQuery,Bin0) ->
	{ V_targetType, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_RedEnvelopeQuery {
		targetType = V_targetType
		},
	Bin1 };

%GENERATED from file:redenvelope.h => U2GS_RobRedEnvelope
readNetMsg(?CMD_U2GS_RobRedEnvelope,Bin0) ->
	{ V_redUID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_RobRedEnvelope {
		redUID = V_redUID
		},
	Bin1 };

%GENERATED from file:redenvelope.h => U2GS_SendRedEnvelope
readNetMsg(?CMD_U2GS_SendRedEnvelope,Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_targetType, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_targetUID, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_allNumber, Bin4 } = binary_read_uint( Bin3 ),
	{ V_allMoney, Bin5 } = binary_read_uint( Bin4 ),
	{ V_luckContent, Bin6 } = binary_read_string( Bin5 ),
	{ #pk_U2GS_SendRedEnvelope {
		type = V_type,
		targetType = V_targetType,
		targetUID = V_targetUID,
		allNumber = V_allNumber,
		allMoney = V_allMoney,
		luckContent = V_luckContent
		},
	Bin6 };

%GENERATED from file:rune.h => DeleteRunes
readNetMsg(?CMD_DeleteRunes,Bin0) ->
	{ V_runeUIDS, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_DeleteRunes {
		runeUIDS = V_runeUIDS
		},
	Bin1 };

%GENERATED from file:rune.h => GS2U_QueryRuneTipsAck
readNetMsg(?CMD_GS2U_QueryRuneTipsAck,Bin0) ->
	{ V_info, Bin1 } = readRuneInfo( Bin0 ),
	{ #pk_GS2U_QueryRuneTipsAck {
		info = V_info
		},
	Bin1 };

%GENERATED from file:rune.h => GS2U_RPRuneInfoList
readNetMsg(?CMD_GS2U_RPRuneInfoList,Bin0) ->
	{ V_targetRoleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_runeList, Bin2 } = binary_read_array(Bin1, fun(X) -> readRuneInfo( X ) end),
	{ #pk_GS2U_RPRuneInfoList {
		targetRoleID = V_targetRoleID,
		runeList = V_runeList
		},
	Bin2 };

%GENERATED from file:rune.h => GS2U_RuneCastAck
readNetMsg(?CMD_GS2U_RuneCastAck,Bin0) ->
	{ V_runeInfo, Bin1 } = readRuneInfo( Bin0 ),
	{ V_runeUIDS, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_GS2U_RuneCastAck {
		runeInfo = V_runeInfo,
		runeUIDS = V_runeUIDS
		},
	Bin2 };

%GENERATED from file:rune.h => GS2U_RuneCastProp
readNetMsg(?CMD_GS2U_RuneCastProp,Bin0) ->
	{ V_flagID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_oldprop, Bin2 } = readRuneBaseProp( Bin1 ),
	{ V_newprop, Bin3 } = readRuneBaseProp( Bin2 ),
	{ #pk_GS2U_RuneCastProp {
		flagID = V_flagID,
		oldprop = V_oldprop,
		newprop = V_newprop
		},
	Bin3 };

%GENERATED from file:rune.h => GS2U_RuneCompoundAck
readNetMsg(?CMD_GS2U_RuneCompoundAck,Bin0) ->
	{ V_runeInfo, Bin1 } = readRuneInfo( Bin0 ),
	{ #pk_GS2U_RuneCompoundAck {
		runeInfo = V_runeInfo
		},
	Bin1 };

%GENERATED from file:rune.h => GS2U_RuneEmbedOffAck
readNetMsg(?CMD_GS2U_RuneEmbedOffAck,Bin0) ->
	{ V_runeList, Bin1 } = binary_read_array(Bin0, fun(X) -> readRuneInfo( X ) end),
	{ #pk_GS2U_RuneEmbedOffAck {
		runeList = V_runeList
		},
	Bin1 };

%GENERATED from file:rune.h => GS2U_RuneEmbedOnAck
readNetMsg(?CMD_GS2U_RuneEmbedOnAck,Bin0) ->
	{ V_targetID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_runeList, Bin2 } = binary_read_array(Bin1, fun(X) -> readRuneInfo( X ) end),
	{ #pk_GS2U_RuneEmbedOnAck {
		targetID = V_targetID,
		runeList = V_runeList
		},
	Bin2 };

%GENERATED from file:rune.h => GS2U_RuneGrid
readNetMsg(?CMD_GS2U_RuneGrid,Bin0) ->
	{ V_ownerID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_cur, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_max, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_GS2U_RuneGrid {
		ownerID = V_ownerID,
		cur = V_cur,
		max = V_max
		},
	Bin3 };

%GENERATED from file:rune.h => GS2U_RuneInfoList
readNetMsg(?CMD_GS2U_RuneInfoList,Bin0) ->
	{ V_runeList, Bin1 } = binary_read_array(Bin0, fun(X) -> readRuneInfo( X ) end),
	{ #pk_GS2U_RuneInfoList {
		runeList = V_runeList
		},
	Bin1 };

%GENERATED from file:rune.h => GS2U_RuneMeltAck
readNetMsg(?CMD_GS2U_RuneMeltAck,Bin0) ->
	{ V_runeInfo, Bin1 } = readRuneInfo( Bin0 ),
	{ V_runeUIDS, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_GS2U_RuneMeltAck {
		runeInfo = V_runeInfo,
		runeUIDS = V_runeUIDS
		},
	Bin2 };

%GENERATED from file:rune.h => GS2U_RuneOpenBorad
readNetMsg(?CMD_GS2U_RuneOpenBorad,Bin0) ->
	{ V_code, Bin1 } = binary_read_int( Bin0 ),
	{ #pk_GS2U_RuneOpenBorad {
		code = V_code
		},
	Bin1 };

%GENERATED from file:rune.h => GS2U_RuneSuitPropList
readNetMsg(?CMD_GS2U_RuneSuitPropList,Bin0) ->
	{ V_suitProps, Bin1 } = binary_read_array(Bin0, fun(X) -> readRuneSuitProp( X ) end),
	{ #pk_GS2U_RuneSuitPropList {
		suitProps = V_suitProps
		},
	Bin1 };

%GENERATED from file:rune.h => RuneEmbedOn
readNetMsg(?CMD_RuneEmbedOn,Bin0) ->
	{ V_runeUIDs, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint64( X ) end),
	{ V_targetID, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_RuneEmbedOn {
		runeUIDs = V_runeUIDs,
		targetID = V_targetID
		},
	Bin2 };

%GENERATED from file:rune.h => U2GS_OpenRuneGrid
readNetMsg(?CMD_U2GS_OpenRuneGrid,Bin0) ->
	{ V_ownerID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_openNumber, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_U2GS_OpenRuneGrid {
		ownerID = V_ownerID,
		openNumber = V_openNumber
		},
	Bin2 };

%GENERATED from file:rune.h => U2GS_QueryRuneTips
readNetMsg(?CMD_U2GS_QueryRuneTips,Bin0) ->
	{ V_runeUID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_QueryRuneTips {
		runeUID = V_runeUID
		},
	Bin1 };

%GENERATED from file:rune.h => U2GS_RequestSuitProp
readNetMsg(?CMD_U2GS_RequestSuitProp,Bin0) ->
	{ V_ownerID, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_RequestSuitProp {
		ownerID = V_ownerID
		},
	Bin1 };

%GENERATED from file:rune.h => U2GS_RuneCast
readNetMsg(?CMD_U2GS_RuneCast,Bin0) ->
	{ V_targetUID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_indexNumber, Bin2 } = binary_read_uint( Bin1 ),
	{ V_materialUID, Bin3 } = binary_read_uint64( Bin2 ),
	{ #pk_U2GS_RuneCast {
		targetUID = V_targetUID,
		indexNumber = V_indexNumber,
		materialUID = V_materialUID
		},
	Bin3 };

%GENERATED from file:rune.h => U2GS_RuneCastAffirm
readNetMsg(?CMD_U2GS_RuneCastAffirm,Bin0) ->
	{ V_flagID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_isAffirm, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_U2GS_RuneCastAffirm {
		flagID = V_flagID,
		isAffirm = V_isAffirm
		},
	Bin2 };

%GENERATED from file:rune.h => U2GS_RuneCompound
readNetMsg(?CMD_U2GS_RuneCompound,Bin0) ->
	{ V_compoundID, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_RuneCompound {
		compoundID = V_compoundID
		},
	Bin1 };

%GENERATED from file:rune.h => U2GS_RuneEmbedOff
readNetMsg(?CMD_U2GS_RuneEmbedOff,Bin0) ->
	{ V_runeUIDs, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_U2GS_RuneEmbedOff {
		runeUIDs = V_runeUIDs
		},
	Bin1 };

%GENERATED from file:rune.h => U2GS_RuneMelt
readNetMsg(?CMD_U2GS_RuneMelt,Bin0) ->
	{ V_targetRuneUID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_materialUIDS, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_U2GS_RuneMelt {
		targetRuneUID = V_targetRuneUID,
		materialUIDS = V_materialUIDS
		},
	Bin2 };

%GENERATED from file:serverTest.h => GS2U_GridPlayerRotw
readNetMsg(?CMD_GS2U_GridPlayerRotw,Bin0) ->
	{ V_rotw, Bin1 } = binary_read_int( Bin0 ),
	{ V_codes, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint64( X ) end),
	{ #pk_GS2U_GridPlayerRotw {
		rotw = V_rotw,
		codes = V_codes
		},
	Bin2 };

%GENERATED from file:setting.h => Any_UpdateBitVariant
readNetMsg(?CMD_Any_UpdateBitVariant,Bin0) ->
	{ V_updateVariantList, Bin1 } = binary_read_array(Bin0, fun(X) -> readSwitchVariantInfo( X ) end),
	{ #pk_Any_UpdateBitVariant {
		updateVariantList = V_updateVariantList
		},
	Bin1 };

%GENERATED from file:setting.h => Any_UpdateVariant
readNetMsg(?CMD_Any_UpdateVariant,Bin0) ->
	{ V_updateVariantList, Bin1 } = binary_read_array(Bin0, fun(X) -> readVariantInfo( X ) end),
	{ #pk_Any_UpdateVariant {
		updateVariantList = V_updateVariantList
		},
	Bin1 };

%GENERATED from file:setting.h => GS2U_VariantInfo
readNetMsg(?CMD_GS2U_VariantInfo,Bin0) ->
	{ V_variantList, Bin1 } = binary_read_array(Bin0, fun(X) -> readVariantInfo( X ) end),
	{ #pk_GS2U_VariantInfo {
		variantList = V_variantList
		},
	Bin1 };

%GENERATED from file:setting.h => U2GS_AllTeamInvitationSetting
readNetMsg(?CMD_U2GS_AllTeamInvitationSetting,Bin0) ->
	{ V_onOrOff, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_AllTeamInvitationSetting {
		onOrOff = V_onOrOff
		},
	Bin1 };

%GENERATED from file:signin.h => BindPhoneAwardGet
readNetMsg(?CMD_BindPhoneAwardGet,Bin0) ->
	{ #pk_BindPhoneAwardGet {

		},
	Bin0 };

%GENERATED from file:signin.h => EveryDaySignIn
readNetMsg(?CMD_EveryDaySignIn,Bin0) ->
	{ #pk_EveryDaySignIn {

		},
	Bin0 };

%GENERATED from file:signin.h => GS2U_BindPhoneResult
readNetMsg(?CMD_GS2U_BindPhoneResult,Bin0) ->
	{ V_isSuccess, Bin1 } = binary_read_bool( Bin0 ),
	{ #pk_GS2U_BindPhoneResult {
		isSuccess = V_isSuccess
		},
	Bin1 };

%GENERATED from file:signin.h => GS2U_SignIn
readNetMsg(?CMD_GS2U_SignIn,Bin0) ->
	{ V_info_list, Bin1 } = binary_read_array(Bin0, fun(X) -> readSignInInfo( X ) end),
	{ V_time, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_SignIn {
		info_list = V_info_list,
		time = V_time
		},
	Bin2 };

%GENERATED from file:signin.h => SevenDaySignIn
readNetMsg(?CMD_SevenDaySignIn,Bin0) ->
	{ V_dayCount, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_SevenDaySignIn {
		dayCount = V_dayCount
		},
	Bin1 };

%GENERATED from file:signin.h => U2GS_AccuReward
readNetMsg(?CMD_U2GS_AccuReward,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_AccuReward {
		id = V_id
		},
	Bin1 };

%GENERATED from file:signin.h => U2GS_BindPhone
readNetMsg(?CMD_U2GS_BindPhone,Bin0) ->
	{ V_funcellCilentID, Bin1 } = binary_read_string( Bin0 ),
	{ V_accessToken, Bin2 } = binary_read_string( Bin1 ),
	{ V_phoneNum, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_verifyid, Bin4 } = binary_read_string( Bin3 ),
	{ V_content, Bin5 } = binary_read_string( Bin4 ),
	{ #pk_U2GS_BindPhone {
		funcellCilentID = V_funcellCilentID,
		accessToken = V_accessToken,
		phoneNum = V_phoneNum,
		verifyid = V_verifyid,
		content = V_content
		},
	Bin5 };

%GENERATED from file:signin.h => U2GS_SignIn
readNetMsg(?CMD_U2GS_SignIn,Bin0) ->
	{ #pk_U2GS_SignIn {

		},
	Bin0 };

%GENERATED from file:skill.h => GS2U_ChangeSkillSlotResult
readNetMsg(?CMD_GS2U_ChangeSkillSlotResult,Bin0) ->
	{ V_changeType, Bin1 } = binary_read_uint( Bin0 ),
	{ V_skillType, Bin2 } = binary_read_int8( Bin1 ),
	{ V_oldIndex, Bin3 } = binary_read_uint( Bin2 ),
	{ V_newSkillInfo, Bin4 } = readSkillSlotInfo( Bin3 ),
	{ #pk_GS2U_ChangeSkillSlotResult {
		changeType = V_changeType,
		skillType = V_skillType,
		oldIndex = V_oldIndex,
		newSkillInfo = V_newSkillInfo
		},
	Bin4 };

%GENERATED from file:skill.h => GS2U_InitiativeSkillSlotInfoList
readNetMsg(?CMD_GS2U_InitiativeSkillSlotInfoList,Bin0) ->
	{ V_skillSlotList, Bin1 } = binary_read_array(Bin0, fun(X) -> readSkillSlotInfo( X ) end),
	{ #pk_GS2U_InitiativeSkillSlotInfoList {
		skillSlotList = V_skillSlotList
		},
	Bin1 };

%GENERATED from file:skill.h => GS2U_OpenSkill
readNetMsg(?CMD_GS2U_OpenSkill,Bin0) ->
	{ V_skillId, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_OpenSkill {
		skillId = V_skillId
		},
	Bin1 };

%GENERATED from file:skill.h => GS2U_OpenSlot
readNetMsg(?CMD_GS2U_OpenSlot,Bin0) ->
	{ V_openSlot, Bin1 } = readOpenSlot( Bin0 ),
	{ #pk_GS2U_OpenSlot {
		openSlot = V_openSlot
		},
	Bin1 };

%GENERATED from file:skill.h => GS2U_OpenSlotList
readNetMsg(?CMD_GS2U_OpenSlotList,Bin0) ->
	{ V_slotList, Bin1 } = binary_read_array(Bin0, fun(X) -> readOpenSlot( X ) end),
	{ #pk_GS2U_OpenSlotList {
		slotList = V_slotList
		},
	Bin1 };

%GENERATED from file:skill.h => GS2U_PassiveSkillSlotInfoList
readNetMsg(?CMD_GS2U_PassiveSkillSlotInfoList,Bin0) ->
	{ V_skillSlotList, Bin1 } = binary_read_array(Bin0, fun(X) -> readSkillSlotInfo( X ) end),
	{ #pk_GS2U_PassiveSkillSlotInfoList {
		skillSlotList = V_skillSlotList
		},
	Bin1 };

%GENERATED from file:skill.h => GS2U_ReduceCD
readNetMsg(?CMD_GS2U_ReduceCD,Bin0) ->
	{ V_skillId, Bin1 } = binary_read_uint( Bin0 ),
	{ V_cd, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_ReduceCD {
		skillId = V_skillId,
		cd = V_cd
		},
	Bin2 };

%GENERATED from file:skill.h => GS2U_SkillInfo
readNetMsg(?CMD_GS2U_SkillInfo,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_level, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GS2U_SkillInfo {
		id = V_id,
		level = V_level
		},
	Bin2 };

%GENERATED from file:skill.h => GS2U_SkillInfoList
readNetMsg(?CMD_GS2U_SkillInfoList,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_skillInfoList, Bin2 } = binary_read_array(Bin1, fun(X) -> readSkillInfo( X ) end),
	{ #pk_GS2U_SkillInfoList {
		code = V_code,
		skillInfoList = V_skillInfoList
		},
	Bin2 };

%GENERATED from file:skill.h => GS2U_TransformSkillSlotInfoList
readNetMsg(?CMD_GS2U_TransformSkillSlotInfoList,Bin0) ->
	{ V_skillSlotList, Bin1 } = binary_read_array(Bin0, fun(X) -> readSkillSlotInfo( X ) end),
	{ #pk_GS2U_TransformSkillSlotInfoList {
		skillSlotList = V_skillSlotList
		},
	Bin1 };

%GENERATED from file:skill.h => GS2U_UpgradeSkill_Result
readNetMsg(?CMD_GS2U_UpgradeSkill_Result,Bin0) ->
	{ V_resultCode, Bin1 } = binary_read_uint( Bin0 ),
	{ V_skillinfo, Bin2 } = readSkillInfo( Bin1 ),
	{ #pk_GS2U_UpgradeSkill_Result {
		resultCode = V_resultCode,
		skillinfo = V_skillinfo
		},
	Bin2 };

%GENERATED from file:skill.h => U2GS_ChangeSkillSlotRequest
readNetMsg(?CMD_U2GS_ChangeSkillSlotRequest,Bin0) ->
	{ V_changeType, Bin1 } = binary_read_uint( Bin0 ),
	{ V_skillType, Bin2 } = binary_read_int8( Bin1 ),
	{ V_changeSkillInfo, Bin3 } = readSkillSlotInfo( Bin2 ),
	{ #pk_U2GS_ChangeSkillSlotRequest {
		changeType = V_changeType,
		skillType = V_skillType,
		changeSkillInfo = V_changeSkillInfo
		},
	Bin3 };

%GENERATED from file:skill.h => U2GS_ResetSkill
readNetMsg(?CMD_U2GS_ResetSkill,Bin0) ->
	{ #pk_U2GS_ResetSkill {

		},
	Bin0 };

%GENERATED from file:skill.h => U2GS_UpSkill
readNetMsg(?CMD_U2GS_UpSkill,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_type, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_UpSkill {
		id = V_id,
		type = V_type
		},
	Bin2 };

%GENERATED from file:skill.h => U2GS_UpgradeSkill_Request
readNetMsg(?CMD_U2GS_UpgradeSkill_Request,Bin0) ->
	{ V_skillId, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_UpgradeSkill_Request {
		skillId = V_skillId
		},
	Bin1 };

%GENERATED from file:talent.h => GS2U_TalentInitAck
readNetMsg(?CMD_GS2U_TalentInitAck,Bin0) ->
	{ V_talentInfos, Bin1 } = binary_read_array(Bin0, fun(X) -> readTalentInfo( X ) end),
	{ #pk_GS2U_TalentInitAck {
		talentInfos = V_talentInfos
		},
	Bin1 };

%GENERATED from file:talent.h => GS2U_TalentLevelUpSuccess
readNetMsg(?CMD_GS2U_TalentLevelUpSuccess,Bin0) ->
	{ V_talentInfo, Bin1 } = readTalentInfo( Bin0 ),
	{ #pk_GS2U_TalentLevelUpSuccess {
		talentInfo = V_talentInfo
		},
	Bin1 };

%GENERATED from file:talent.h => U2GS_TalentInit
readNetMsg(?CMD_U2GS_TalentInit,Bin0) ->
	{ #pk_U2GS_TalentInit {

		},
	Bin0 };

%GENERATED from file:talent.h => U2GS_TalentLevelUp
readNetMsg(?CMD_U2GS_TalentLevelUp,Bin0) ->
	{ V_id, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_TalentLevelUp {
		id = V_id
		},
	Bin1 };

%GENERATED from file:task.h => GS2U_AcceptTask
readNetMsg(?CMD_GS2U_AcceptTask,Bin0) ->
	{ V_info, Bin1 } = readtaskInfo( Bin0 ),
	{ #pk_GS2U_AcceptTask {
		info = V_info
		},
	Bin1 };

%GENERATED from file:task.h => GS2U_AcceptTaskList
readNetMsg(?CMD_GS2U_AcceptTaskList,Bin0) ->
	{ V_list, Bin1 } = binary_read_array(Bin0, fun(X) -> readacceptedBaseTask( X ) end),
	{ #pk_GS2U_AcceptTaskList {
		list = V_list
		},
	Bin1 };

%GENERATED from file:task.h => GS2U_AddNewAcceptTask
readNetMsg(?CMD_GS2U_AddNewAcceptTask,Bin0) ->
	{ V_taskID, Bin1 } = binary_read_int( Bin0 ),
	{ V_result, Bin2 } = binary_read_int( Bin1 ),
	{ #pk_GS2U_AddNewAcceptTask {
		taskID = V_taskID,
		result = V_result
		},
	Bin2 };

%GENERATED from file:task.h => GS2U_AddNewCompleteLoopTasks
readNetMsg(?CMD_GS2U_AddNewCompleteLoopTasks,Bin0) ->
	{ V_result, Bin1 } = binary_read_int( Bin0 ),
	{ V_progress, Bin2 } = binary_read_int( Bin1 ),
	{ V_allProgress, Bin3 } = binary_read_int( Bin2 ),
	{ V_listTaskID, Bin4 } = binary_read_array(Bin3, fun(X) -> binary_read_int( X ) end),
	{ V_listLevel, Bin5 } = binary_read_array(Bin4, fun(X) -> binary_read_int( X ) end),
	{ #pk_GS2U_AddNewCompleteLoopTasks {
		result = V_result,
		progress = V_progress,
		allProgress = V_allProgress,
		listTaskID = V_listTaskID,
		listLevel = V_listLevel
		},
	Bin5 };

%GENERATED from file:task.h => GS2U_AddNewCompleteTask
readNetMsg(?CMD_GS2U_AddNewCompleteTask,Bin0) ->
	{ V_result, Bin1 } = binary_read_int( Bin0 ),
	{ V_taskID, Bin2 } = binary_read_int( Bin1 ),
	{ #pk_GS2U_AddNewCompleteTask {
		result = V_result,
		taskID = V_taskID
		},
	Bin2 };

%GENERATED from file:task.h => GS2U_CompleteTaskList
readNetMsg(?CMD_GS2U_CompleteTaskList,Bin0) ->
	{ V_list, Bin1 } = binary_read_array(Bin0, fun(X) -> readSubmittedTaskInfo( X ) end),
	{ #pk_GS2U_CompleteTaskList {
		list = V_list
		},
	Bin1 };

%GENERATED from file:task.h => GS2U_DeleteAcceptTask
readNetMsg(?CMD_GS2U_DeleteAcceptTask,Bin0) ->
	{ V_taskID, Bin1 } = binary_read_int( Bin0 ),
	{ V_result, Bin2 } = binary_read_int( Bin1 ),
	{ #pk_GS2U_DeleteAcceptTask {
		taskID = V_taskID,
		result = V_result
		},
	Bin2 };

%GENERATED from file:task.h => GS2U_TalkToNpcResult
readNetMsg(?CMD_GS2U_TalkToNpcResult,Bin0) ->
	{ V_result, Bin1 } = binary_read_int( Bin0 ),
	{ V_code, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_TalkToNpcResult {
		result = V_result,
		code = V_code
		},
	Bin2 };

%GENERATED from file:task.h => GS2U_TaskList
readNetMsg(?CMD_GS2U_TaskList,Bin0) ->
	{ V_list, Bin1 } = binary_read_array(Bin0, fun(X) -> readtaskInfo( X ) end),
	{ #pk_GS2U_TaskList {
		list = V_list
		},
	Bin1 };

%GENERATED from file:task.h => GS2U_UpdateAcceptTask
readNetMsg(?CMD_GS2U_UpdateAcceptTask,Bin0) ->
	{ V_result, Bin1 } = binary_read_int( Bin0 ),
	{ V_acceptTaskInfo, Bin2 } = readacceptedBaseTask( Bin1 ),
	{ #pk_GS2U_UpdateAcceptTask {
		result = V_result,
		acceptTaskInfo = V_acceptTaskInfo
		},
	Bin2 };

%GENERATED from file:task.h => GS2U_UpdateTask
readNetMsg(?CMD_GS2U_UpdateTask,Bin0) ->
	{ V_info, Bin1 } = readtaskInfo( Bin0 ),
	{ #pk_GS2U_UpdateTask {
		info = V_info
		},
	Bin1 };

%GENERATED from file:task.h => U2GS_AcceptTask
readNetMsg(?CMD_U2GS_AcceptTask,Bin0) ->
	{ V_taskID, Bin1 } = binary_read_int( Bin0 ),
	{ V_npcCode, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_U2GS_AcceptTask {
		taskID = V_taskID,
		npcCode = V_npcCode
		},
	Bin2 };

%GENERATED from file:task.h => U2GS_CollectObj
readNetMsg(?CMD_U2GS_CollectObj,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_CollectObj {
		code = V_code
		},
	Bin1 };

%GENERATED from file:task.h => U2GS_DropTask
readNetMsg(?CMD_U2GS_DropTask,Bin0) ->
	{ V_taskID, Bin1 } = binary_read_int( Bin0 ),
	{ #pk_U2GS_DropTask {
		taskID = V_taskID
		},
	Bin1 };

%GENERATED from file:task.h => U2GS_RequestAcceptLoopTask
readNetMsg(?CMD_U2GS_RequestAcceptLoopTask,Bin0) ->
	{ #pk_U2GS_RequestAcceptLoopTask {

		},
	Bin0 };

%GENERATED from file:task.h => U2GS_RequestAcceptTask
readNetMsg(?CMD_U2GS_RequestAcceptTask,Bin0) ->
	{ V_taskID, Bin1 } = binary_read_int( Bin0 ),
	{ V_code, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_U2GS_RequestAcceptTask {
		taskID = V_taskID,
		code = V_code
		},
	Bin2 };

%GENERATED from file:task.h => U2GS_RequestCompleteLoopTaskByOneKey
readNetMsg(?CMD_U2GS_RequestCompleteLoopTaskByOneKey,Bin0) ->
	{ #pk_U2GS_RequestCompleteLoopTaskByOneKey {

		},
	Bin0 };

%GENERATED from file:task.h => U2GS_RequestCompleteOneLoopTaskByOneKey
readNetMsg(?CMD_U2GS_RequestCompleteOneLoopTaskByOneKey,Bin0) ->
	{ #pk_U2GS_RequestCompleteOneLoopTaskByOneKey {

		},
	Bin0 };

%GENERATED from file:task.h => U2GS_ResetTask
readNetMsg(?CMD_U2GS_ResetTask,Bin0) ->
	{ V_taskID, Bin1 } = binary_read_int( Bin0 ),
	{ #pk_U2GS_ResetTask {
		taskID = V_taskID
		},
	Bin1 };

%GENERATED from file:task.h => U2GS_SumbitTask
readNetMsg(?CMD_U2GS_SumbitTask,Bin0) ->
	{ V_taskID, Bin1 } = binary_read_int( Bin0 ),
	{ V_code, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_U2GS_SumbitTask {
		taskID = V_taskID,
		code = V_code
		},
	Bin2 };

%GENERATED from file:task.h => U2GS_TalkToNpc
readNetMsg(?CMD_U2GS_TalkToNpc,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_TalkToNpc {
		code = V_code
		},
	Bin1 };

%GENERATED from file:task.h => U2GS_TriggerTaskBuff
readNetMsg(?CMD_U2GS_TriggerTaskBuff,Bin0) ->
	{ V_taskID, Bin1 } = binary_read_int( Bin0 ),
	{ #pk_U2GS_TriggerTaskBuff {
		taskID = V_taskID
		},
	Bin1 };

%GENERATED from file:task.h => U2GS_UseItemObj
readNetMsg(?CMD_U2GS_UseItemObj,Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_U2GS_UseItemObj {
		code = V_code
		},
	Bin1 };

%GENERATED from file:team.h => GS2U_AddTeamMemberInfo
readNetMsg(?CMD_GS2U_AddTeamMemberInfo,Bin0) ->
	{ V_teamType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_memberInfo, Bin2 } = readTeamMemberInfo( Bin1 ),
	{ #pk_GS2U_AddTeamMemberInfo {
		teamType = V_teamType,
		memberInfo = V_memberInfo
		},
	Bin2 };

%GENERATED from file:team.h => GS2U_BeenInviteTeam
readNetMsg(?CMD_GS2U_BeenInviteTeam,Bin0) ->
	{ V_teamType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_inviteType, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_inviterPlayerID, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_inviterPlayerName, Bin4 } = binary_read_string( Bin3 ),
	{ #pk_GS2U_BeenInviteTeam {
		teamType = V_teamType,
		inviteType = V_inviteType,
		inviterPlayerID = V_inviterPlayerID,
		inviterPlayerName = V_inviterPlayerName
		},
	Bin4 };

%GENERATED from file:team.h => GS2U_DelTeammateInfo
readNetMsg(?CMD_GS2U_DelTeammateInfo,Bin0) ->
	{ V_teamType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_teammateID, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_DelTeammateInfo {
		teamType = V_teamType,
		teammateID = V_teammateID
		},
	Bin2 };

%GENERATED from file:team.h => GS2U_FastTeamAck
readNetMsg(?CMD_GS2U_FastTeamAck,Bin0) ->
	{ #pk_GS2U_FastTeamAck {

		},
	Bin0 };

%GENERATED from file:team.h => GS2U_FastTeamSucc
readNetMsg(?CMD_GS2U_FastTeamSucc,Bin0) ->
	{ V_time, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_GS2U_FastTeamSucc {
		time = V_time
		},
	Bin1 };

%GENERATED from file:team.h => GS2U_InviteUJoinTeam
readNetMsg(?CMD_GS2U_InviteUJoinTeam,Bin0) ->
	{ V_copyMapID, Bin1 } = binary_read_int( Bin0 ),
	{ V_inviterPlayerID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_inviterPlayerName, Bin3 } = binary_read_string( Bin2 ),
	{ V_guildID, Bin4 } = binary_read_uint64( Bin3 ),
	{ V_guildName, Bin5 } = binary_read_string( Bin4 ),
	{ V_friendState, Bin6 } = binary_read_uint8( Bin5 ),
	{ #pk_GS2U_InviteUJoinTeam {
		copyMapID = V_copyMapID,
		inviterPlayerID = V_inviterPlayerID,
		inviterPlayerName = V_inviterPlayerName,
		guildID = V_guildID,
		guildName = V_guildName,
		friendState = V_friendState
		},
	Bin6 };

%GENERATED from file:team.h => GS2U_KickOutByLeader
readNetMsg(?CMD_GS2U_KickOutByLeader,Bin0) ->
	{ V_teamType, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_GS2U_KickOutByLeader {
		teamType = V_teamType
		},
	Bin1 };

%GENERATED from file:team.h => GS2U_MyTeamInfo
readNetMsg(?CMD_GS2U_MyTeamInfo,Bin0) ->
	{ V_base, Bin1 } = readTeamBaseInfo( Bin0 ),
	{ V_infos, Bin2 } = binary_read_array(Bin1, fun(X) -> readTeamMemberInfo( X ) end),
	{ #pk_GS2U_MyTeamInfo {
		base = V_base,
		infos = V_infos
		},
	Bin2 };

%GENERATED from file:team.h => GS2U_NearTeamInfo
readNetMsg(?CMD_GS2U_NearTeamInfo,Bin0) ->
	{ V_teamType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_teamInfoList, Bin2 } = binary_read_array(Bin1, fun(X) -> readNearTeamInfo( X ) end),
	{ #pk_GS2U_NearTeamInfo {
		teamType = V_teamType,
		teamInfoList = V_teamInfoList
		},
	Bin2 };

%GENERATED from file:team.h => GS2U_NearbyPlayer_Ack
readNetMsg(?CMD_GS2U_NearbyPlayer_Ack,Bin0) ->
	{ V_list, Bin1 } = binary_read_array(Bin0, fun(X) -> readNotTeamMemberInfo( X ) end),
	{ #pk_GS2U_NearbyPlayer_Ack {
		list = V_list
		},
	Bin1 };

%GENERATED from file:team.h => GS2U_NewMemberJoin
readNetMsg(?CMD_GS2U_NewMemberJoin,Bin0) ->
	{ V_info, Bin1 } = readTeamMemberInfo( Bin0 ),
	{ #pk_GS2U_NewMemberJoin {
		info = V_info
		},
	Bin1 };

%GENERATED from file:team.h => GS2U_QueryRoleListAck
readNetMsg(?CMD_GS2U_QueryRoleListAck,Bin0) ->
	{ V_queryType, Bin1 } = binary_read_int( Bin0 ),
	{ V_playerList, Bin2 } = binary_read_array(Bin1, fun(X) -> readOnlineMemberSnapshot( X ) end),
	{ #pk_GS2U_QueryRoleListAck {
		queryType = V_queryType,
		playerList = V_playerList
		},
	Bin2 };

%GENERATED from file:team.h => GS2U_QueryTeamListAck
readNetMsg(?CMD_GS2U_QueryTeamListAck,Bin0) ->
	{ V_teamSnapshot, Bin1 } = binary_read_array(Bin0, fun(X) -> readTeamSnapshot( X ) end),
	{ #pk_GS2U_QueryTeamListAck {
		teamSnapshot = V_teamSnapshot
		},
	Bin1 };

%GENERATED from file:team.h => GS2U_QuickTeamMatchAck
readNetMsg(?CMD_GS2U_QuickTeamMatchAck,Bin0) ->
	{ V_result, Bin1 } = binary_read_int( Bin0 ),
	{ V_startTime, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_QuickTeamMatchAck {
		result = V_result,
		startTime = V_startTime
		},
	Bin2 };

%GENERATED from file:team.h => GS2U_RequestFightingCapacity
readNetMsg(?CMD_GS2U_RequestFightingCapacity,Bin0) ->
	{ V_fightingCapacityInfos, Bin1 } = binary_read_array(Bin0, fun(X) -> readFightingCapacityInfo( X ) end),
	{ #pk_GS2U_RequestFightingCapacity {
		fightingCapacityInfos = V_fightingCapacityInfos
		},
	Bin1 };

%GENERATED from file:team.h => GS2U_TeamChangeLeader
readNetMsg(?CMD_GS2U_TeamChangeLeader,Bin0) ->
	{ V_teamType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_newLeaderID, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_TeamChangeLeader {
		teamType = V_teamType,
		newLeaderID = V_newLeaderID
		},
	Bin2 };

%GENERATED from file:team.h => GS2U_TeamDisbanded
readNetMsg(?CMD_GS2U_TeamDisbanded,Bin0) ->
	{ V_teamType, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_GS2U_TeamDisbanded {
		teamType = V_teamType
		},
	Bin1 };

%GENERATED from file:team.h => GS2U_TeamInfo
readNetMsg(?CMD_GS2U_TeamInfo,Bin0) ->
	{ V_teamType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_teamID, Bin2 } = binary_read_int64( Bin1 ),
	{ V_leaderID, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_info_list, Bin4 } = binary_read_array(Bin3, fun(X) -> readTeamMemberInfo( X ) end),
	{ V_customProp, Bin5 } = binary_read_string( Bin4 ),
	{ #pk_GS2U_TeamInfo {
		teamType = V_teamType,
		teamID = V_teamID,
		leaderID = V_leaderID,
		info_list = V_info_list,
		customProp = V_customProp
		},
	Bin5 };

%GENERATED from file:team.h => GS2U_TeamLeaderStartCopymap
readNetMsg(?CMD_GS2U_TeamLeaderStartCopymap,Bin0) ->
	{ V_copyMapID, Bin1 } = binary_read_int( Bin0 ),
	{ #pk_GS2U_TeamLeaderStartCopymap {
		copyMapID = V_copyMapID
		},
	Bin1 };

%GENERATED from file:team.h => GS2U_TeamMemberExtInfo
readNetMsg(?CMD_GS2U_TeamMemberExtInfo,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_level, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_hpPC, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_mapID, Bin4 } = binary_read_uint16( Bin3 ),
	{ #pk_GS2U_TeamMemberExtInfo {
		roleID = V_roleID,
		level = V_level,
		hpPC = V_hpPC,
		mapID = V_mapID
		},
	Bin4 };

%GENERATED from file:team.h => GS2U_TeamMemberOffline
readNetMsg(?CMD_GS2U_TeamMemberOffline,Bin0) ->
	{ V_teamType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_playerID, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_TeamMemberOffline {
		teamType = V_teamType,
		playerID = V_playerID
		},
	Bin2 };

%GENERATED from file:team.h => GS2U_TeamMemberOnline
readNetMsg(?CMD_GS2U_TeamMemberOnline,Bin0) ->
	{ V_teamType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_playerID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_code, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_level, Bin4 } = binary_read_uint16( Bin3 ),
	{ #pk_GS2U_TeamMemberOnline {
		teamType = V_teamType,
		playerID = V_playerID,
		code = V_code,
		level = V_level
		},
	Bin4 };

%GENERATED from file:team.h => GS2U_TeamMemberOnlineState
readNetMsg(?CMD_GS2U_TeamMemberOnlineState,Bin0) ->
	{ V_playerID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_state, Bin2 } = binary_read_int( Bin1 ),
	{ #pk_GS2U_TeamMemberOnlineState {
		playerID = V_playerID,
		state = V_state
		},
	Bin2 };

%GENERATED from file:team.h => GS2U_TeamReset
readNetMsg(?CMD_GS2U_TeamReset,Bin0) ->
	{ V_reason, Bin1 } = binary_read_int( Bin0 ),
	{ #pk_GS2U_TeamReset {
		reason = V_reason
		},
	Bin1 };

%GENERATED from file:team.h => GS2U_TeammateLeave
readNetMsg(?CMD_GS2U_TeammateLeave,Bin0) ->
	{ V_teammateID, Bin1 } = binary_read_uint64( Bin0 ),
	{ #pk_GS2U_TeammateLeave {
		teammateID = V_teammateID
		},
	Bin1 };

%GENERATED from file:team.h => GS2U_TeammateLeaveAwayTeam
readNetMsg(?CMD_GS2U_TeammateLeaveAwayTeam,Bin0) ->
	{ V_teamType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_teammateID, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GS2U_TeammateLeaveAwayTeam {
		teamType = V_teamType,
		teammateID = V_teammateID
		},
	Bin2 };

%GENERATED from file:team.h => GS2U_TeammateLocation
readNetMsg(?CMD_GS2U_TeammateLocation,Bin0) ->
	{ V_teammateLocations, Bin1 } = binary_read_array(Bin0, fun(X) -> readTeamMemberLocation( X ) end),
	{ #pk_GS2U_TeammateLocation {
		teammateLocations = V_teammateLocations
		},
	Bin1 };

%GENERATED from file:team.h => GS2U_TeammateStartCopymapAck
readNetMsg(?CMD_GS2U_TeammateStartCopymapAck,Bin0) ->
	{ V_playerID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_isAgree, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_GS2U_TeammateStartCopymapAck {
		playerID = V_playerID,
		isAgree = V_isAgree
		},
	Bin2 };

%GENERATED from file:team.h => GS2U_UpdateMemberExInfo
readNetMsg(?CMD_GS2U_UpdateMemberExInfo,Bin0) ->
	{ V_infoEx, Bin1 } = readTeamMemberInfoEx( Bin0 ),
	{ #pk_GS2U_UpdateMemberExInfo {
		infoEx = V_infoEx
		},
	Bin1 };

%GENERATED from file:team.h => GS2U_UpdateTeamInfo
readNetMsg(?CMD_GS2U_UpdateTeamInfo,Bin0) ->
	{ V_base, Bin1 } = readTeamBaseInfo( Bin0 ),
	{ #pk_GS2U_UpdateTeamInfo {
		base = V_base
		},
	Bin1 };

%GENERATED from file:team.h => U2GS_AckInviteJoinTeam
readNetMsg(?CMD_U2GS_AckInviteJoinTeam,Bin0) ->
	{ V_isAgree, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_inviterPlayerID, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_U2GS_AckInviteJoinTeam {
		isAgree = V_isAgree,
		inviterPlayerID = V_inviterPlayerID
		},
	Bin2 };

%GENERATED from file:team.h => U2GS_AckInviteTeam
readNetMsg(?CMD_U2GS_AckInviteTeam,Bin0) ->
	{ V_teamType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_isAgree, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_inviteType, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_inviterPlayerID, Bin4 } = binary_read_uint64( Bin3 ),
	{ #pk_U2GS_AckInviteTeam {
		teamType = V_teamType,
		isAgree = V_isAgree,
		inviteType = V_inviteType,
		inviterPlayerID = V_inviterPlayerID
		},
	Bin4 };

%GENERATED from file:team.h => U2GS_CancelFastTeam
readNetMsg(?CMD_U2GS_CancelFastTeam,Bin0) ->
	{ #pk_U2GS_CancelFastTeam {

		},
	Bin0 };

%GENERATED from file:team.h => U2GS_IsOpenMapPanel
readNetMsg(?CMD_U2GS_IsOpenMapPanel,Bin0) ->
	{ V_isOpen, Bin1 } = binary_read_bool( Bin0 ),
	{ #pk_U2GS_IsOpenMapPanel {
		isOpen = V_isOpen
		},
	Bin1 };

%GENERATED from file:team.h => U2GS_LeaveAwayTeam
readNetMsg(?CMD_U2GS_LeaveAwayTeam,Bin0) ->
	{ V_teamType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_id, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_LeaveAwayTeam {
		teamType = V_teamType,
		id = V_id
		},
	Bin2 };

%GENERATED from file:team.h => U2GS_NearbyPlayer_Request
readNetMsg(?CMD_U2GS_NearbyPlayer_Request,Bin0) ->
	{ #pk_U2GS_NearbyPlayer_Request {

		},
	Bin0 };

%GENERATED from file:team.h => U2GS_OperateTeam
readNetMsg(?CMD_U2GS_OperateTeam,Bin0) ->
	{ V_teamType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_operateType, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_operatedID, Bin3 } = binary_read_uint64( Bin2 ),
	{ #pk_U2GS_OperateTeam {
		teamType = V_teamType,
		operateType = V_operateType,
		operatedID = V_operatedID
		},
	Bin3 };

%GENERATED from file:team.h => U2GS_QueryRoleList
readNetMsg(?CMD_U2GS_QueryRoleList,Bin0) ->
	{ V_queryType, Bin1 } = binary_read_int( Bin0 ),
	{ #pk_U2GS_QueryRoleList {
		queryType = V_queryType
		},
	Bin1 };

%GENERATED from file:team.h => U2GS_QueryTeamList
readNetMsg(?CMD_U2GS_QueryTeamList,Bin0) ->
	{ V_mapIDList, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_int( X ) end),
	{ #pk_U2GS_QueryTeamList {
		mapIDList = V_mapIDList
		},
	Bin1 };

%GENERATED from file:team.h => U2GS_QuickJoinTeam
readNetMsg(?CMD_U2GS_QuickJoinTeam,Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_mapID, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_U2GS_QuickJoinTeam {
		roleID = V_roleID,
		mapID = V_mapID
		},
	Bin2 };

%GENERATED from file:team.h => U2GS_QuickTeamMatch
readNetMsg(?CMD_U2GS_QuickTeamMatch,Bin0) ->
	{ V_mapList, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint16( X ) end),
	{ #pk_U2GS_QuickTeamMatch {
		mapList = V_mapList
		},
	Bin1 };

%GENERATED from file:team.h => U2GS_QuickTeamStart
readNetMsg(?CMD_U2GS_QuickTeamStart,Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_U2GS_QuickTeamStart {
		mapID = V_mapID
		},
	Bin1 };

%GENERATED from file:team.h => U2GS_RequestFightingCapacity
readNetMsg(?CMD_U2GS_RequestFightingCapacity,Bin0) ->
	{ #pk_U2GS_RequestFightingCapacity {

		},
	Bin0 };

%GENERATED from file:team.h => U2GS_RequestNearByTeamInfo
readNetMsg(?CMD_U2GS_RequestNearByTeamInfo,Bin0) ->
	{ V_teamType, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_RequestNearByTeamInfo {
		teamType = V_teamType
		},
	Bin1 };

%GENERATED from file:team.h => U2GS_TeamOp
readNetMsg(?CMD_U2GS_TeamOp,Bin0) ->
	{ V_operateType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_operatedID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_param1, Bin3 } = binary_read_uint64( Bin2 ),
	{ #pk_U2GS_TeamOp {
		operateType = V_operateType,
		operatedID = V_operatedID,
		param1 = V_param1
		},
	Bin3 };

%GENERATED from file:trade.h => GS2U_DealRecord
readNetMsg(?CMD_GS2U_DealRecord,Bin0) ->
	{ V_opCode, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_number, Bin2 } = binary_read_uint( Bin1 ),
	{ V_dealRecord, Bin3 } = binary_read_array(Bin2, fun(X) -> readDealRecord( X ) end),
	{ #pk_GS2U_DealRecord {
		opCode = V_opCode,
		number = V_number,
		dealRecord = V_dealRecord
		},
	Bin3 };

%GENERATED from file:trade.h => GS2U_OpTradeResult
readNetMsg(?CMD_GS2U_OpTradeResult,Bin0) ->
	{ V_tradeClass, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_orderID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_result, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_opCode, Bin4 } = binary_read_uint8( Bin3 ),
	{ #pk_GS2U_OpTradeResult {
		tradeClass = V_tradeClass,
		orderID = V_orderID,
		result = V_result,
		opCode = V_opCode
		},
	Bin4 };

%GENERATED from file:trade.h => GS2U_QueryTrade
readNetMsg(?CMD_GS2U_QueryTrade,Bin0) ->
	{ V_opCode, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_sortType, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_sortIndex, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_pageNumber, Bin4 } = binary_read_uint( Bin3 ),
	{ V_nowTime, Bin5 } = binary_read_uint64( Bin4 ),
	{ V_queryTradeList, Bin6 } = binary_read_array(Bin5, fun(X) -> readQueryTradeList( X ) end),
	{ #pk_GS2U_QueryTrade {
		opCode = V_opCode,
		sortType = V_sortType,
		sortIndex = V_sortIndex,
		pageNumber = V_pageNumber,
		nowTime = V_nowTime,
		queryTradeList = V_queryTradeList
		},
	Bin6 };

%GENERATED from file:trade.h => GS2U_QueryTradeInfo
readNetMsg(?CMD_GS2U_QueryTradeInfo,Bin0) ->
	{ V_opCode, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_tradeClass, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_itemClass, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_itemTypeList, Bin4 } = binary_read_array(Bin3, fun(X) -> binary_read_int8( X ) end),
	{ V_itemSubType, Bin5 } = binary_read_int8( Bin4 ),
	{ V_allNumber, Bin6 } = binary_read_int( Bin5 ),
	{ #pk_GS2U_QueryTradeInfo {
		opCode = V_opCode,
		tradeClass = V_tradeClass,
		itemClass = V_itemClass,
		itemTypeList = V_itemTypeList,
		itemSubType = V_itemSubType,
		allNumber = V_allNumber
		},
	Bin6 };

%GENERATED from file:trade.h => GS2U_ReferenceItem
readNetMsg(?CMD_GS2U_ReferenceItem,Bin0) ->
	{ V_tradeClass, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_referenceItems, Bin2 } = binary_read_array(Bin1, fun(X) -> readReferenceItem( X ) end),
	{ V_referenceItem, Bin3 } = readReferenceItem( Bin2 ),
	{ #pk_GS2U_ReferenceItem {
		tradeClass = V_tradeClass,
		referenceItems = V_referenceItems,
		referenceItem = V_referenceItem
		},
	Bin3 };

%GENERATED from file:trade.h => U2GS_DownTrade
readNetMsg(?CMD_U2GS_DownTrade,Bin0) ->
	{ V_tradeClass, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_orderID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_opCode, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_U2GS_DownTrade {
		tradeClass = V_tradeClass,
		orderID = V_orderID,
		opCode = V_opCode
		},
	Bin3 };

%GENERATED from file:trade.h => U2GS_NextResult
readNetMsg(?CMD_U2GS_NextResult,Bin0) ->
	{ V_pageNumber, Bin1 } = binary_read_uint( Bin0 ),
	{ V_opCode, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_NextResult {
		pageNumber = V_pageNumber,
		opCode = V_opCode
		},
	Bin2 };

%GENERATED from file:trade.h => U2GS_PutTrade
readNetMsg(?CMD_U2GS_PutTrade,Bin0) ->
	{ V_tradeClass, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_itemUID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_itemID, Bin3 } = binary_read_uint( Bin2 ),
	{ V_sellNumber, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_sellTime, Bin5 } = binary_read_uint8( Bin4 ),
	{ V_gold, Bin6 } = binary_read_uint( Bin5 ),
	{ V_diamond, Bin7 } = binary_read_uint( Bin6 ),
	{ V_destRoleName, Bin8 } = binary_read_string( Bin7 ),
	{ V_opCode, Bin9 } = binary_read_uint8( Bin8 ),
	{ #pk_U2GS_PutTrade {
		tradeClass = V_tradeClass,
		itemUID = V_itemUID,
		itemID = V_itemID,
		sellNumber = V_sellNumber,
		sellTime = V_sellTime,
		gold = V_gold,
		diamond = V_diamond,
		destRoleName = V_destRoleName,
		opCode = V_opCode
		},
	Bin9 };

%GENERATED from file:trade.h => U2GS_QueryNewestTrade
readNetMsg(?CMD_U2GS_QueryNewestTrade,Bin0) ->
	{ V_tradeClass, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_getNumber, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_oneNumber, Bin3 } = binary_read_int8( Bin2 ),
	{ V_opCode, Bin4 } = binary_read_uint8( Bin3 ),
	{ #pk_U2GS_QueryNewestTrade {
		tradeClass = V_tradeClass,
		getNumber = V_getNumber,
		oneNumber = V_oneNumber,
		opCode = V_opCode
		},
	Bin4 };

%GENERATED from file:trade.h => U2GS_QuerySelfTrade
readNetMsg(?CMD_U2GS_QuerySelfTrade,Bin0) ->
	{ V_tradeClass, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_opCode, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_QuerySelfTrade {
		tradeClass = V_tradeClass,
		opCode = V_opCode
		},
	Bin2 };

%GENERATED from file:trade.h => U2GS_QueryTrade
readNetMsg(?CMD_U2GS_QueryTrade,Bin0) ->
	{ V_tradeClass, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_itemClass, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_itemTypeList, Bin3 } = binary_read_array(Bin2, fun(X) -> binary_read_int8( X ) end),
	{ V_itemSubType, Bin4 } = binary_read_int8( Bin3 ),
	{ V_itemList, Bin5 } = binary_read_array(Bin4, fun(X) -> binary_read_string( X ) end),
	{ V_career, Bin6 } = binary_read_int16( Bin5 ),
	{ V_itemLvlMin, Bin7 } = binary_read_int8( Bin6 ),
	{ V_itemLvlMax, Bin8 } = binary_read_int8( Bin7 ),
	{ V_itemQuality, Bin9 } = binary_read_int8( Bin8 ),
	{ V_oneNumber, Bin10 } = binary_read_int8( Bin9 ),
	{ V_opCode, Bin11 } = binary_read_uint8( Bin10 ),
	{ #pk_U2GS_QueryTrade {
		tradeClass = V_tradeClass,
		itemClass = V_itemClass,
		itemTypeList = V_itemTypeList,
		itemSubType = V_itemSubType,
		itemList = V_itemList,
		career = V_career,
		itemLvlMin = V_itemLvlMin,
		itemLvlMax = V_itemLvlMax,
		itemQuality = V_itemQuality,
		oneNumber = V_oneNumber,
		opCode = V_opCode
		},
	Bin11 };

%GENERATED from file:trade.h => U2GS_ReferenceItem
readNetMsg(?CMD_U2GS_ReferenceItem,Bin0) ->
	{ V_tradeClass, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_itemID, Bin2 } = binary_read_uint( Bin1 ),
	{ V_requestNumber, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_U2GS_ReferenceItem {
		tradeClass = V_tradeClass,
		itemID = V_itemID,
		requestNumber = V_requestNumber
		},
	Bin3 };

%GENERATED from file:trade.h => U2GS_RequestDealRecord
readNetMsg(?CMD_U2GS_RequestDealRecord,Bin0) ->
	{ V_oneNumber, Bin1 } = binary_read_int8( Bin0 ),
	{ V_pageNumber, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_opCode, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_U2GS_RequestDealRecord {
		oneNumber = V_oneNumber,
		pageNumber = V_pageNumber,
		opCode = V_opCode
		},
	Bin3 };

%GENERATED from file:trade.h => U2GS_ResultSort
readNetMsg(?CMD_U2GS_ResultSort,Bin0) ->
	{ V_sortIndex, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_pageNumber, Bin2 } = binary_read_uint( Bin1 ),
	{ V_sortType, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_opCode, Bin4 } = binary_read_uint8( Bin3 ),
	{ #pk_U2GS_ResultSort {
		sortIndex = V_sortIndex,
		pageNumber = V_pageNumber,
		sortType = V_sortType,
		opCode = V_opCode
		},
	Bin4 };

%GENERATED from file:trade.h => U2GS_TradeBuy
readNetMsg(?CMD_U2GS_TradeBuy,Bin0) ->
	{ V_tradeClass, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_orderID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_opCode, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_U2GS_TradeBuy {
		tradeClass = V_tradeClass,
		orderID = V_orderID,
		opCode = V_opCode
		},
	Bin3 };

%GENERATED from file:trade.h => U2GS_TradeRefuse
readNetMsg(?CMD_U2GS_TradeRefuse,Bin0) ->
	{ V_tradeClass, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_orderID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_opCode, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_U2GS_TradeRefuse {
		tradeClass = V_tradeClass,
		orderID = V_orderID,
		opCode = V_opCode
		},
	Bin3 };

%GENERATED from file:wake.h => GS2U_GoddessActiveSkill
readNetMsg(?CMD_GS2U_GoddessActiveSkill,Bin0) ->
	{ V_skillID, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_GS2U_GoddessActiveSkill {
		skillID = V_skillID
		},
	Bin1 };

%GENERATED from file:wake.h => GS2U_WakeInfo
readNetMsg(?CMD_GS2U_WakeInfo,Bin0) ->
	{ V_wakeInfo, Bin1 } = readWakeInfo( Bin0 ),
	{ #pk_GS2U_WakeInfo {
		wakeInfo = V_wakeInfo
		},
	Bin1 };

%GENERATED from file:wake.h => GS2U_WakeInfoList
readNetMsg(?CMD_GS2U_WakeInfoList,Bin0) ->
	{ V_wakeInfoList, Bin1 } = binary_read_array(Bin0, fun(X) -> readWakeInfo( X ) end),
	{ #pk_GS2U_WakeInfoList {
		wakeInfoList = V_wakeInfoList
		},
	Bin1 };

%GENERATED from file:wake.h => U2GS_CallGoddess
readNetMsg(?CMD_U2GS_CallGoddess,Bin0) ->
	{ V_cardID, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_CallGoddess {
		cardID = V_cardID
		},
	Bin1 };

%GENERATED from file:wake.h => U2GS_ChangeState
readNetMsg(?CMD_U2GS_ChangeState,Bin0) ->
	{ V_cardID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_state, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_ChangeState {
		cardID = V_cardID,
		state = V_state
		},
	Bin2 };

%GENERATED from file:wake.h => U2GS_OnKeyUpWakeInfo
readNetMsg(?CMD_U2GS_OnKeyUpWakeInfo,Bin0) ->
	{ V_cardID, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_OnKeyUpWakeInfo {
		cardID = V_cardID
		},
	Bin1 };

%GENERATED from file:wake.h => U2GS_UnlockCard
readNetMsg(?CMD_U2GS_UnlockCard,Bin0) ->
	{ V_cardID, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_UnlockCard {
		cardID = V_cardID
		},
	Bin1 };

%GENERATED from file:wake.h => U2GS_UnlockState
readNetMsg(?CMD_U2GS_UnlockState,Bin0) ->
	{ V_cardID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_state, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_U2GS_UnlockState {
		cardID = V_cardID,
		state = V_state
		},
	Bin2 };

%GENERATED from file:wake.h => U2GS_UpGradeWakeInfo
readNetMsg(?CMD_U2GS_UpGradeWakeInfo,Bin0) ->
	{ V_cardID, Bin1 } = binary_read_uint8( Bin0 ),
	{ #pk_U2GS_UpGradeWakeInfo {
		cardID = V_cardID
		},
	Bin1 };

%GENERATED from file:wake.h => U2GS_UpWakeInfo
readNetMsg(?CMD_U2GS_UpWakeInfo,Bin0) ->
	{ V_cardID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_num, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_U2GS_UpWakeInfo {
		cardID = V_cardID,
		num = V_num
		},
	Bin2 };

%GENERATED from file:warriortrial.h => GS2U_InitWarriorTrialAck
readNetMsg(?CMD_GS2U_InitWarriorTrialAck,Bin0) ->
	{ V_record, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_cur, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_max, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_coin, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_GS2U_InitWarriorTrialAck {
		record = V_record,
		cur = V_cur,
		max = V_max,
		coin = V_coin
		},
	Bin4 };

%GENERATED from file:warriortrial.h => GS2U_InitWarriorTrialMissionInfo
readNetMsg(?CMD_GS2U_InitWarriorTrialMissionInfo,Bin0) ->
	{ V_missionID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_time, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_GS2U_InitWarriorTrialMissionInfo {
		missionID = V_missionID,
		time = V_time
		},
	Bin2 };

%GENERATED from file:warriortrial.h => GS2U_SweepWarriorTrialSuccess
readNetMsg(?CMD_GS2U_SweepWarriorTrialSuccess,Bin0) ->
	{ V_record, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_cur, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_coin, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GS2U_SweepWarriorTrialSuccess {
		record = V_record,
		cur = V_cur,
		coin = V_coin
		},
	Bin3 };

%GENERATED from file:warriortrial.h => GS2U_WarriorTrialSuccess
readNetMsg(?CMD_GS2U_WarriorTrialSuccess,Bin0) ->
	{ V_result, Bin1 } = binary_read_bool( Bin0 ),
	{ #pk_GS2U_WarriorTrialSuccess {
		result = V_result
		},
	Bin1 };

%GENERATED from file:warriortrial.h => U2GS_BeginWarriorTrial
readNetMsg(?CMD_U2GS_BeginWarriorTrial,Bin0) ->
	{ #pk_U2GS_BeginWarriorTrial {

		},
	Bin0 };

%GENERATED from file:warriortrial.h => U2GS_CompleteWarriorTrail
readNetMsg(?CMD_U2GS_CompleteWarriorTrail,Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_CompleteWarriorTrail {
		mapID = V_mapID
		},
	Bin1 };

%GENERATED from file:warriortrial.h => U2GS_SweepWarriorTrial
readNetMsg(?CMD_U2GS_SweepWarriorTrial,Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ #pk_U2GS_SweepWarriorTrial {
		mapID = V_mapID
		},
	Bin1 };

%GENERATED from file:warriortrial.h => U2GS_WarriorTrialInit
readNetMsg(?CMD_U2GS_WarriorTrialInit,Bin0) ->
	{ #pk_U2GS_WarriorTrialInit {

		},
	Bin0 }.

%GENERATED from file:Date.h => DateMonsterPos
-spec readDateMonsterPos(Bin0) -> { #pk_DateMonsterPos{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readDateMonsterPos(Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_x, Bin2 } = binary_read_float( Bin1 ),
	{ V_z, Bin3 } = binary_read_float( Bin2 ),
	{ #pk_DateMonsterPos {
		code = V_code,
		x = V_x,
		z = V_z
		},
	Bin3 }.

%GENERATED from file:LS2User.h => GameServerInfo
-spec readGameServerInfo(Bin0) -> { #pk_GameServerInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGameServerInfo(Bin0) ->
	{ V_lineid, Bin1 } = binary_read_int16( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ V_ip, Bin3 } = binary_read_string( Bin2 ),
	{ V_port, Bin4 } = binary_read_int16( Bin3 ),
	{ V_state, Bin5 } = binary_read_int8( Bin4 ),
	{ #pk_GameServerInfo {
		lineid = V_lineid,
		name = V_name,
		ip = V_ip,
		port = V_port,
		state = V_state
		},
	Bin5 }.

%GENERATED from file:achieve.h => AchieveSchedule
-spec readAchieveSchedule(Bin0) -> { #pk_AchieveSchedule{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readAchieveSchedule(Bin0) ->
	{ V_achieveID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_scheduleRewardID, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_scheduleCompleteNum, Bin3 } = binary_read_uint( Bin2 ),
	{ V_scheduleCompleteID, Bin4 } = binary_read_uint8( Bin3 ),
	{ #pk_AchieveSchedule {
		achieveID = V_achieveID,
		scheduleRewardID = V_scheduleRewardID,
		scheduleCompleteNum = V_scheduleCompleteNum,
		scheduleCompleteID = V_scheduleCompleteID
		},
	Bin4 }.

%GENERATED from file:achieve.h => BadgeInfo
-spec readBadgeInfo(Bin0) -> { #pk_BadgeInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readBadgeInfo(Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_itemList, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint( X ) end),
	{ #pk_BadgeInfo {
		mapID = V_mapID,
		itemList = V_itemList
		},
	Bin2 }.

%GENERATED from file:achieve.h => DailyActiveInfo
-spec readDailyActiveInfo(Bin0) -> { #pk_DailyActiveInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readDailyActiveInfo(Bin0) ->
	{ V_dailyID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_curTimes, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_DailyActiveInfo {
		dailyID = V_dailyID,
		curTimes = V_curTimes
		},
	Bin2 }.

%GENERATED from file:achieve.h => TitleInfo
-spec readTitleInfo(Bin0) -> { #pk_TitleInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readTitleInfo(Bin0) ->
	{ V_titleID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_endTime, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_TitleInfo {
		titleID = V_titleID,
		endTime = V_endTime
		},
	Bin2 }.

%GENERATED from file:activity.h => ActivityAnswerRankData
-spec readActivityAnswerRankData(Bin0) -> { #pk_ActivityAnswerRankData{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readActivityAnswerRankData(Bin0) ->
	{ V_name, Bin1 } = binary_read_string( Bin0 ),
	{ V_value, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_ActivityAnswerRankData {
		name = V_name,
		value = V_value
		},
	Bin2 }.

%GENERATED from file:activity.h => AngelInvestmentData
-spec readAngelInvestmentData(Bin0) -> { #pk_AngelInvestmentData{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readAngelInvestmentData(Bin0) ->
	{ V_isCanGet, Bin1 } = binary_read_bool( Bin0 ),
	{ V_leftNumber, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_id, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_AngelInvestmentData {
		isCanGet = V_isCanGet,
		leftNumber = V_leftNumber,
		id = V_id
		},
	Bin3 }.

%GENERATED from file:activity.h => ArenaBattle
-spec readArenaBattle(Bin0) -> { #pk_ArenaBattle{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readArenaBattle(Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_camp, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_name, Bin3 } = binary_read_string( Bin2 ),
	{ V_servername, Bin4 } = binary_read_string( Bin3 ),
	{ V_killnum, Bin5 } = binary_read_uint8( Bin4 ),
	{ V_force, Bin6 } = binary_read_uint64( Bin5 ),
	{ V_hurt, Bin7 } = binary_read_uint64( Bin6 ),
	{ V_arenaVal, Bin8 } = binary_read_uint( Bin7 ),
	{ #pk_ArenaBattle {
		id = V_id,
		camp = V_camp,
		name = V_name,
		servername = V_servername,
		killnum = V_killnum,
		force = V_force,
		hurt = V_hurt,
		arenaVal = V_arenaVal
		},
	Bin8 }.

%GENERATED from file:activity.h => ArenaRole
-spec readArenaRole(Bin0) -> { #pk_ArenaRole{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readArenaRole(Bin0) ->
	{ V_servername, Bin1 } = binary_read_string( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ V_id, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_camp, Bin4 } = binary_read_uint8( Bin3 ),
	{ #pk_ArenaRole {
		servername = V_servername,
		name = V_name,
		id = V_id,
		camp = V_camp
		},
	Bin4 }.

%GENERATED from file:activity.h => ArenaTeamMemberInfo
-spec readArenaTeamMemberInfo(Bin0) -> { #pk_ArenaTeamMemberInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readArenaTeamMemberInfo(Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_code, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_name, Bin3 } = binary_read_string( Bin2 ),
	{ V_isLeader, Bin4 } = binary_read_bool( Bin3 ),
	{ V_isPrepare, Bin5 } = binary_read_bool( Bin4 ),
	{ V_level, Bin6 } = binary_read_uint8( Bin5 ),
	{ V_career, Bin7 } = binary_read_uint( Bin6 ),
	{ V_force, Bin8 } = binary_read_uint64( Bin7 ),
	{ V_arenaVal, Bin9 } = binary_read_uint( Bin8 ),
	{ #pk_ArenaTeamMemberInfo {
		id = V_id,
		code = V_code,
		name = V_name,
		isLeader = V_isLeader,
		isPrepare = V_isPrepare,
		level = V_level,
		career = V_career,
		force = V_force,
		arenaVal = V_arenaVal
		},
	Bin9 }.

%GENERATED from file:activity.h => ChargeOrUseRuleInfo
-spec readChargeOrUseRuleInfo(Bin0) -> { #pk_ChargeOrUseRuleInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readChargeOrUseRuleInfo(Bin0) ->
	{ V_ruleID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_diamon, Bin2 } = binary_read_uint( Bin1 ),
	{ V_itemJson, Bin3 } = binary_read_string( Bin2 ),
	{ V_hasTake, Bin4 } = binary_read_bool( Bin3 ),
	{ #pk_ChargeOrUseRuleInfo {
		ruleID = V_ruleID,
		diamon = V_diamon,
		itemJson = V_itemJson,
		hasTake = V_hasTake
		},
	Bin4 }.

%GENERATED from file:activity.h => CrosArenaBattleHighRank
-spec readCrosArenaBattleHighRank(Bin0) -> { #pk_CrosArenaBattleHighRank{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readCrosArenaBattleHighRank(Bin0) ->
	{ V_career, Bin1 } = binary_read_uint( Bin0 ),
	{ V_roleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_name, Bin3 } = binary_read_string( Bin2 ),
	{ V_servername, Bin4 } = binary_read_string( Bin3 ),
	{ V_force, Bin5 } = binary_read_uint( Bin4 ),
	{ V_arenaVal, Bin6 } = binary_read_uint( Bin5 ),
	{ V_win, Bin7 } = binary_read_uint( Bin6 ),
	{ V_fail, Bin8 } = binary_read_uint( Bin7 ),
	{ V_time, Bin9 } = binary_read_uint64( Bin8 ),
	{ #pk_CrosArenaBattleHighRank {
		career = V_career,
		roleID = V_roleID,
		name = V_name,
		servername = V_servername,
		force = V_force,
		arenaVal = V_arenaVal,
		win = V_win,
		fail = V_fail,
		time = V_time
		},
	Bin9 }.

%GENERATED from file:activity.h => CrosArenaBattleRank
-spec readCrosArenaBattleRank(Bin0) -> { #pk_CrosArenaBattleRank{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readCrosArenaBattleRank(Bin0) ->
	{ V_rankID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_career, Bin2 } = binary_read_uint( Bin1 ),
	{ V_roleID, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_name, Bin4 } = binary_read_string( Bin3 ),
	{ V_servername, Bin5 } = binary_read_string( Bin4 ),
	{ V_force, Bin6 } = binary_read_uint( Bin5 ),
	{ V_arenaVal, Bin7 } = binary_read_uint( Bin6 ),
	{ V_win, Bin8 } = binary_read_uint( Bin7 ),
	{ V_fail, Bin9 } = binary_read_uint( Bin8 ),
	{ #pk_CrosArenaBattleRank {
		rankID = V_rankID,
		career = V_career,
		roleID = V_roleID,
		name = V_name,
		servername = V_servername,
		force = V_force,
		arenaVal = V_arenaVal,
		win = V_win,
		fail = V_fail
		},
	Bin9 }.

%GENERATED from file:activity.h => CrosBattleExploit
-spec readCrosBattleExploit(Bin0) -> { #pk_CrosBattleExploit{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readCrosBattleExploit(Bin0) ->
	{ V_rankID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_career, Bin2 } = binary_read_uint( Bin1 ),
	{ V_roleID, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_name, Bin4 } = binary_read_string( Bin3 ),
	{ V_servername, Bin5 } = binary_read_string( Bin4 ),
	{ V_force, Bin6 } = binary_read_uint( Bin5 ),
	{ V_exploit, Bin7 } = binary_read_uint( Bin6 ),
	{ #pk_CrosBattleExploit {
		rankID = V_rankID,
		career = V_career,
		roleID = V_roleID,
		name = V_name,
		servername = V_servername,
		force = V_force,
		exploit = V_exploit
		},
	Bin7 }.

%GENERATED from file:activity.h => DarknessPlayerRank
-spec readDarknessPlayerRank(Bin0) -> { #pk_DarknessPlayerRank{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readDarknessPlayerRank(Bin0) ->
	{ V_rank, Bin1 } = binary_read_uint( Bin0 ),
	{ V_camp, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_roleID, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_roleName, Bin4 } = binary_read_string( Bin3 ),
	{ V_roleLevel, Bin5 } = binary_read_uint( Bin4 ),
	{ V_integral, Bin6 } = binary_read_uint( Bin5 ),
	{ V_mapPos, Bin7 } = binary_read_uint8( Bin6 ),
	{ #pk_DarknessPlayerRank {
		rank = V_rank,
		camp = V_camp,
		roleID = V_roleID,
		roleName = V_roleName,
		roleLevel = V_roleLevel,
		integral = V_integral,
		mapPos = V_mapPos
		},
	Bin7 }.

%GENERATED from file:activity.h => DarknessState
-spec readDarknessState(Bin0) -> { #pk_DarknessState{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readDarknessState(Bin0) ->
	{ V_remainTime, Bin1 } = binary_read_uint( Bin0 ),
	{ #pk_DarknessState {
		remainTime = V_remainTime
		},
	Bin1 }.

%GENERATED from file:activity.h => EscortPlunderMoney
-spec readEscortPlunderMoney(Bin0) -> { #pk_EscortPlunderMoney{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readEscortPlunderMoney(Bin0) ->
	{ V_roleName, Bin1 } = binary_read_string( Bin0 ),
	{ V_plunderMoney, Bin2 } = binary_read_int64( Bin1 ),
	{ #pk_EscortPlunderMoney {
		roleName = V_roleName,
		plunderMoney = V_plunderMoney
		},
	Bin2 }.

%GENERATED from file:activity.h => EscortResultReward
-spec readEscortResultReward(Bin0) -> { #pk_EscortResultReward{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readEscortResultReward(Bin0) ->
	{ V_moneyType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_money, Bin2 } = binary_read_uint( Bin1 ),
	{ V_perValue, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_EscortResultReward {
		moneyType = V_moneyType,
		money = V_money,
		perValue = V_perValue
		},
	Bin3 }.

%GENERATED from file:activity.h => EscortTeam
-spec readEscortTeam(Bin0) -> { #pk_EscortTeam{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readEscortTeam(Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleName, Bin2 } = binary_read_string( Bin1 ),
	{ V_sequenceNumber, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_cur_RobNumber, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_max_RobNumber, Bin5 } = binary_read_uint16( Bin4 ),
	{ #pk_EscortTeam {
		roleID = V_roleID,
		roleName = V_roleName,
		sequenceNumber = V_sequenceNumber,
		cur_RobNumber = V_cur_RobNumber,
		max_RobNumber = V_max_RobNumber
		},
	Bin5 }.

%GENERATED from file:activity.h => HDBattleExploit
-spec readHDBattleExploit(Bin0) -> { #pk_HDBattleExploit{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readHDBattleExploit(Bin0) ->
	{ V_rankID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_camp, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_roleID, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_name, Bin4 } = binary_read_string( Bin3 ),
	{ V_servername, Bin5 } = binary_read_string( Bin4 ),
	{ V_killNum, Bin6 } = binary_read_uint16( Bin5 ),
	{ V_asKillNum, Bin7 } = binary_read_uint16( Bin6 ),
	{ V_exploit, Bin8 } = binary_read_uint( Bin7 ),
	{ #pk_HDBattleExploit {
		rankID = V_rankID,
		camp = V_camp,
		roleID = V_roleID,
		name = V_name,
		servername = V_servername,
		killNum = V_killNum,
		asKillNum = V_asKillNum,
		exploit = V_exploit
		},
	Bin8 }.

%GENERATED from file:activity.h => KillRank
-spec readKillRank(Bin0) -> { #pk_KillRank{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readKillRank(Bin0) ->
	{ V_sortNumber, Bin1 } = binary_read_uint( Bin0 ),
	{ V_killNumber, Bin2 } = binary_read_uint( Bin1 ),
	{ V_playerName, Bin3 } = binary_read_string( Bin2 ),
	{ #pk_KillRank {
		sortNumber = V_sortNumber,
		killNumber = V_killNumber,
		playerName = V_playerName
		},
	Bin3 }.

%GENERATED from file:activity.h => LotteryItem
-spec readLotteryItem(Bin0) -> { #pk_LotteryItem{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readLotteryItem(Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleName, Bin2 } = binary_read_string( Bin1 ),
	{ V_pondID, Bin3 } = binary_read_uint( Bin2 ),
	{ V_onlyID, Bin4 } = binary_read_uint( Bin3 ),
	{ V_itemId, Bin5 } = binary_read_uint( Bin4 ),
	{ V_itemNumber, Bin6 } = binary_read_uint( Bin5 ),
	{ V_isBind, Bin7 } = binary_read_uint8( Bin6 ),
	{ #pk_LotteryItem {
		roleID = V_roleID,
		roleName = V_roleName,
		pondID = V_pondID,
		onlyID = V_onlyID,
		itemId = V_itemId,
		itemNumber = V_itemNumber,
		isBind = V_isBind
		},
	Bin7 }.

%GENERATED from file:activity.h => LotteryNote
-spec readLotteryNote(Bin0) -> { #pk_LotteryNote{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readLotteryNote(Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleName, Bin2 } = binary_read_string( Bin1 ),
	{ V_itemID, Bin3 } = binary_read_uint( Bin2 ),
	{ V_itemNumber, Bin4 } = binary_read_uint( Bin3 ),
	{ V_isBind, Bin5 } = binary_read_uint8( Bin4 ),
	{ V_isServerNote, Bin6 } = binary_read_uint8( Bin5 ),
	{ V_zbTime, Bin7 } = binary_read_uint64( Bin6 ),
	{ #pk_LotteryNote {
		roleID = V_roleID,
		roleName = V_roleName,
		itemID = V_itemID,
		itemNumber = V_itemNumber,
		isBind = V_isBind,
		isServerNote = V_isServerNote,
		zbTime = V_zbTime
		},
	Bin7 }.

%GENERATED from file:activity.h => OperateActExchangeRequire
-spec readOperateActExchangeRequire(Bin0) -> { #pk_OperateActExchangeRequire{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readOperateActExchangeRequire(Bin0) ->
	{ V_itemID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_itemNum, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_OperateActExchangeRequire {
		itemID = V_itemID,
		itemNum = V_itemNum
		},
	Bin2 }.

%GENERATED from file:activity.h => PlayerKingBattleEquip
-spec readPlayerKingBattleEquip(Bin0) -> { #pk_PlayerKingBattleEquip{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPlayerKingBattleEquip(Bin0) ->
	{ V_equipID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_quality, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_PlayerKingBattleEquip {
		equipID = V_equipID,
		quality = V_quality
		},
	Bin2 }.

%GENERATED from file:activity.h => PlayerKingBattleEquipLevel
-spec readPlayerKingBattleEquipLevel(Bin0) -> { #pk_PlayerKingBattleEquipLevel{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPlayerKingBattleEquipLevel(Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_level, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_PlayerKingBattleEquipLevel {
		type = V_type,
		level = V_level
		},
	Bin2 }.

%GENERATED from file:activity.h => Question
-spec readQuestion(Bin0) -> { #pk_Question{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readQuestion(Bin0) ->
	{ V_questionID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_answers, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_Question {
		questionID = V_questionID,
		answers = V_answers
		},
	Bin2 }.

%GENERATED from file:activity.h => RobitAnswer
-spec readRobitAnswer(Bin0) -> { #pk_RobitAnswer{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRobitAnswer(Bin0) ->
	{ V_startTime, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_intervalTime, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_RobitAnswer {
		startTime = V_startTime,
		intervalTime = V_intervalTime
		},
	Bin2 }.

%GENERATED from file:activity.h => SevenDayMissionData
-spec readSevenDayMissionData(Bin0) -> { #pk_SevenDayMissionData{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readSevenDayMissionData(Bin0) ->
	{ V_isFinish, Bin1 } = binary_read_bool( Bin0 ),
	{ V_number, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_max, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_missionid, Bin4 } = binary_read_uint16( Bin3 ),
	{ #pk_SevenDayMissionData {
		isFinish = V_isFinish,
		number = V_number,
		max = V_max,
		missionid = V_missionid
		},
	Bin4 }.

%GENERATED from file:activity.h => WildBossInfo
-spec readWildBossInfo(Bin0) -> { #pk_WildBossInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readWildBossInfo(Bin0) ->
	{ V_mapID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_bossID, Bin2 } = binary_read_uint( Bin1 ),
	{ V_refreshTime, Bin3 } = binary_read_uint64( Bin2 ),
	{ #pk_WildBossInfo {
		mapID = V_mapID,
		bossID = V_bossID,
		refreshTime = V_refreshTime
		},
	Bin3 }.

%GENERATED from file:arena.h => KingRole
-spec readKingRole(Bin0) -> { #pk_KingRole{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readKingRole(Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_ranksort, Bin2 } = binary_read_uint( Bin1 ),
	{ V_career, Bin3 } = binary_read_uint( Bin2 ),
	{ V_roleName, Bin4 } = binary_read_string( Bin3 ),
	{ V_worshipTimes, Bin5 } = binary_read_uint( Bin4 ),
	{ #pk_KingRole {
		roleID = V_roleID,
		ranksort = V_ranksort,
		career = V_career,
		roleName = V_roleName,
		worshipTimes = V_worshipTimes
		},
	Bin5 }.

%GENERATED from file:arena.h => LadderLS
-spec readLadderLS(Bin0) -> { #pk_LadderLS{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readLadderLS(Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleName, Bin2 } = binary_read_string( Bin1 ),
	{ V_isTerminator, Bin3 } = binary_read_bool( Bin2 ),
	{ V_ls_times, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_targetID, Bin5 } = binary_read_uint64( Bin4 ),
	{ V_targetName, Bin6 } = binary_read_string( Bin5 ),
	{ #pk_LadderLS {
		roleID = V_roleID,
		roleName = V_roleName,
		isTerminator = V_isTerminator,
		ls_times = V_ls_times,
		targetID = V_targetID,
		targetName = V_targetName
		},
	Bin6 }.

%GENERATED from file:arena.h => LadderMatchInfo
-spec readLadderMatchInfo(Bin0) -> { #pk_LadderMatchInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readLadderMatchInfo(Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleName, Bin2 } = binary_read_string( Bin1 ),
	{ V_isChallenge, Bin3 } = binary_read_bool( Bin2 ),
	{ V_isWin, Bin4 } = binary_read_bool( Bin3 ),
	{ V_targetID, Bin5 } = binary_read_uint64( Bin4 ),
	{ V_targetName, Bin6 } = binary_read_string( Bin5 ),
	{ V_rank1, Bin7 } = binary_read_uint( Bin6 ),
	{ V_rank2, Bin8 } = binary_read_uint( Bin7 ),
	{ #pk_LadderMatchInfo {
		roleID = V_roleID,
		roleName = V_roleName,
		isChallenge = V_isChallenge,
		isWin = V_isWin,
		targetID = V_targetID,
		targetName = V_targetName,
		rank1 = V_rank1,
		rank2 = V_rank2
		},
	Bin8 }.

%GENERATED from file:arena.h => LadderTargetInfo
-spec readLadderTargetInfo(Bin0) -> { #pk_LadderTargetInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readLadderTargetInfo(Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ V_level, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_career, Bin4 } = binary_read_uint( Bin3 ),
	{ V_ranksort, Bin5 } = binary_read_uint( Bin4 ),
	{ V_fightingCapacity, Bin6 } = binary_read_uint( Bin5 ),
	{ V_sex, Bin7 } = binary_read_int8( Bin6 ),
	{ V_race, Bin8 } = binary_read_int8( Bin7 ),
	{ #pk_LadderTargetInfo {
		roleID = V_roleID,
		name = V_name,
		level = V_level,
		career = V_career,
		ranksort = V_ranksort,
		fightingCapacity = V_fightingCapacity,
		sex = V_sex,
		race = V_race
		},
	Bin8 }.

%GENERATED from file:arena.h => SelfBattleInfo
-spec readSelfBattleInfo(Bin0) -> { #pk_SelfBattleInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readSelfBattleInfo(Bin0) ->
	{ V_ranksort, Bin1 } = binary_read_uint( Bin0 ),
	{ V_fightingCapacity, Bin2 } = binary_read_uint( Bin1 ),
	{ V_exploit, Bin3 } = binary_read_uint( Bin2 ),
	{ V_cur_ChallengeTimes, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_max_ChallengeTimes, Bin5 } = binary_read_uint16( Bin4 ),
	{ V_moneyType, Bin6 } = binary_read_uint8( Bin5 ),
	{ V_money, Bin7 } = binary_read_uint( Bin6 ),
	{ V_cur_win, Bin8 } = binary_read_uint16( Bin7 ),
	{ V_max_win, Bin9 } = binary_read_uint16( Bin8 ),
	{ V_win_times, Bin10 } = binary_read_uint( Bin9 ),
	{ V_surplusSec, Bin11 } = binary_read_uint( Bin10 ),
	{ V_exploitValue, Bin12 } = binary_read_uint( Bin11 ),
	{ #pk_SelfBattleInfo {
		ranksort = V_ranksort,
		fightingCapacity = V_fightingCapacity,
		exploit = V_exploit,
		cur_ChallengeTimes = V_cur_ChallengeTimes,
		max_ChallengeTimes = V_max_ChallengeTimes,
		moneyType = V_moneyType,
		money = V_money,
		cur_win = V_cur_win,
		max_win = V_max_win,
		win_times = V_win_times,
		surplusSec = V_surplusSec,
		exploitValue = V_exploitValue
		},
	Bin12 }.

%GENERATED from file:bag.h => BagSlot
-spec readBagSlot(Bin0) -> { #pk_BagSlot{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readBagSlot(Bin0) ->
	{ V_max, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_used, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_BagSlot {
		max = V_max,
		used = V_used
		},
	Bin2 }.

%GENERATED from file:bag.h => EquipEnhancedProp
-spec readEquipEnhancedProp(Bin0) -> { #pk_EquipEnhancedProp{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readEquipEnhancedProp(Bin0) ->
	{ V_propKey, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_propValue, Bin2 } = binary_read_float( Bin1 ),
	{ #pk_EquipEnhancedProp {
		propKey = V_propKey,
		propValue = V_propValue
		},
	Bin2 }.

%GENERATED from file:bag.h => EquipGemInfo
-spec readEquipGemInfo(Bin0) -> { #pk_EquipGemInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readEquipGemInfo(Bin0) ->
	{ V_equipPos, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_gemList, Bin2 } = binary_read_array(Bin1, fun(X) -> readGemEmbedInfo( X ) end),
	{ #pk_EquipGemInfo {
		equipPos = V_equipPos,
		gemList = V_gemList
		},
	Bin2 }.

%GENERATED from file:bag.h => EquipItemInfo
-spec readEquipItemInfo(Bin0) -> { #pk_EquipItemInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readEquipItemInfo(Bin0) ->
	{ V_itemID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_itemUID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_recastNum, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_quality, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_isBind, Bin5 } = binary_read_bool( Bin4 ),
	{ V_isLocked, Bin6 } = binary_read_bool( Bin5 ),
	{ V_expiredTime, Bin7 } = binary_read_uint( Bin6 ),
	{ V_equipProps, Bin8 } = binary_read_array(Bin7, fun(X) -> readEquipPropInfo( X ) end),
	{ #pk_EquipItemInfo {
		itemID = V_itemID,
		itemUID = V_itemUID,
		recastNum = V_recastNum,
		quality = V_quality,
		isBind = V_isBind,
		isLocked = V_isLocked,
		expiredTime = V_expiredTime,
		equipProps = V_equipProps
		},
	Bin8 }.

%GENERATED from file:bag.h => EquipPropInfo
-spec readEquipPropInfo(Bin0) -> { #pk_EquipPropInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readEquipPropInfo(Bin0) ->
	{ V_propType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_propKey, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_propAffix, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_calcType, Bin4 } = binary_read_bool( Bin3 ),
	{ V_propValue, Bin5 } = binary_read_float( Bin4 ),
	{ #pk_EquipPropInfo {
		propType = V_propType,
		propKey = V_propKey,
		propAffix = V_propAffix,
		calcType = V_calcType,
		propValue = V_propValue
		},
	Bin5 }.

%GENERATED from file:bag.h => EquipRefineLevel
-spec readEquipRefineLevel(Bin0) -> { #pk_EquipRefineLevel{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readEquipRefineLevel(Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_level, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_EquipRefineLevel {
		type = V_type,
		level = V_level
		},
	Bin2 }.

%GENERATED from file:bag.h => EquipStarLevel
-spec readEquipStarLevel(Bin0) -> { #pk_EquipStarLevel{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readEquipStarLevel(Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_level, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_EquipStarLevel {
		type = V_type,
		level = V_level
		},
	Bin2 }.

%GENERATED from file:bag.h => EquipUpStarInfo
-spec readEquipUpStarInfo(Bin0) -> { #pk_EquipUpStarInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readEquipUpStarInfo(Bin0) ->
	{ V_pos, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_level, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_prog, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_bless, Bin4 } = binary_read_uint16( Bin3 ),
	{ #pk_EquipUpStarInfo {
		pos = V_pos,
		level = V_level,
		prog = V_prog,
		bless = V_bless
		},
	Bin4 }.

%GENERATED from file:bag.h => ExchangeResource
-spec readExchangeResource(Bin0) -> { #pk_ExchangeResource{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readExchangeResource(Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_groupID, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_itemID, Bin3 } = binary_read_uint( Bin2 ),
	{ V_payItem, Bin4 } = binary_read_array(Bin3, fun(X) -> readPayItemOfExchange( X ) end),
	{ V_playerLevel, Bin5 } = binary_read_uint8( Bin4 ),
	{ V_limit, Bin6 } = binary_read_uint16( Bin5 ),
	{ #pk_ExchangeResource {
		id = V_id,
		groupID = V_groupID,
		itemID = V_itemID,
		payItem = V_payItem,
		playerLevel = V_playerLevel,
		limit = V_limit
		},
	Bin6 }.

%GENERATED from file:bag.h => GemEmbedInfo
-spec readGemEmbedInfo(Bin0) -> { #pk_GemEmbedInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGemEmbedInfo(Bin0) ->
	{ V_gemID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_slot, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_GemEmbedInfo {
		gemID = V_gemID,
		slot = V_slot
		},
	Bin2 }.

%GENERATED from file:bag.h => LookGemInfo
-spec readLookGemInfo(Bin0) -> { #pk_LookGemInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readLookGemInfo(Bin0) ->
	{ V_gemID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_slot, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_LookGemInfo {
		gemID = V_gemID,
		slot = V_slot
		},
	Bin2 }.

%GENERATED from file:bag.h => LookGodWeaponInfo
-spec readLookGodWeaponInfo(Bin0) -> { #pk_LookGodWeaponInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readLookGodWeaponInfo(Bin0) ->
	{ V_weaponID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_weaponLevel, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_skillLevel, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_LookGodWeaponInfo {
		weaponID = V_weaponID,
		weaponLevel = V_weaponLevel,
		skillLevel = V_skillLevel
		},
	Bin3 }.

%GENERATED from file:bag.h => LookPetEquipInfo
-spec readLookPetEquipInfo(Bin0) -> { #pk_LookPetEquipInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readLookPetEquipInfo(Bin0) ->
	{ V_equipID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_equipLv, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_LookPetEquipInfo {
		equipID = V_equipID,
		equipLv = V_equipLv
		},
	Bin2 }.

%GENERATED from file:bag.h => LookPetInfo
-spec readLookPetInfo(Bin0) -> { #pk_LookPetInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readLookPetInfo(Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_petStar, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_petname, Bin3 } = binary_read_string( Bin2 ),
	{ V_petForce, Bin4 } = binary_read_uint( Bin3 ),
	{ V_petColNum, Bin5 } = binary_read_uint16( Bin4 ),
	{ V_petRaw, Bin6 } = binary_read_uint8( Bin5 ),
	{ V_petSkill, Bin7 } = binary_read_array(Bin6, fun(X) -> readLookPetSkill( X ) end),
	{ V_equalInfo, Bin8 } = binary_read_array(Bin7, fun(X) -> readLookPetEquipInfo( X ) end),
	{ V_petPropValues, Bin9 } = binary_read_array(Bin8, fun(X) -> binary_read_float( X ) end),
	{ #pk_LookPetInfo {
		petID = V_petID,
		petStar = V_petStar,
		petname = V_petname,
		petForce = V_petForce,
		petColNum = V_petColNum,
		petRaw = V_petRaw,
		petSkill = V_petSkill,
		equalInfo = V_equalInfo,
		petPropValues = V_petPropValues
		},
	Bin9 }.

%GENERATED from file:bag.h => LookPetSkill
-spec readLookPetSkill(Bin0) -> { #pk_LookPetSkill{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readLookPetSkill(Bin0) ->
	{ V_petSkillId, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_petSkillLv, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_petSkillType, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_LookPetSkill {
		petSkillId = V_petSkillId,
		petSkillLv = V_petSkillLv,
		petSkillType = V_petSkillType
		},
	Bin3 }.

%GENERATED from file:bag.h => LookWakeInfo
-spec readLookWakeInfo(Bin0) -> { #pk_LookWakeInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readLookWakeInfo(Bin0) ->
	{ V_cardID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_level, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_LookWakeInfo {
		cardID = V_cardID,
		level = V_level
		},
	Bin2 }.

%GENERATED from file:bag.h => NormalItemInfo
-spec readNormalItemInfo(Bin0) -> { #pk_NormalItemInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readNormalItemInfo(Bin0) ->
	{ V_itemID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_itemUID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_itemSum, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_isBind, Bin4 } = binary_read_bool( Bin3 ),
	{ V_isLocked, Bin5 } = binary_read_bool( Bin4 ),
	{ V_expiredTime, Bin6 } = binary_read_uint( Bin5 ),
	{ #pk_NormalItemInfo {
		itemID = V_itemID,
		itemUID = V_itemUID,
		itemSum = V_itemSum,
		isBind = V_isBind,
		isLocked = V_isLocked,
		expiredTime = V_expiredTime
		},
	Bin6 }.

%GENERATED from file:bag.h => PayItemOfExchange
-spec readPayItemOfExchange(Bin0) -> { #pk_PayItemOfExchange{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPayItemOfExchange(Bin0) ->
	{ V_item, Bin1 } = binary_read_int( Bin0 ),
	{ V_number, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_PayItemOfExchange {
		item = V_item,
		number = V_number
		},
	Bin2 }.

%GENERATED from file:bag.h => RPView_AddProp
-spec readRPView_AddProp(Bin0) -> { #pk_RPView_AddProp{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRPView_AddProp(Bin0) ->
	{ V_prop, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_value, Bin2 } = binary_read_float( Bin1 ),
	{ #pk_RPView_AddProp {
		prop = V_prop,
		value = V_value
		},
	Bin2 }.

%GENERATED from file:bag.h => RPView_AssistBattleInfo
-spec readRPView_AssistBattleInfo(Bin0) -> { #pk_RPView_AssistBattleInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRPView_AssistBattleInfo(Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_slot, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_RPView_AssistBattleInfo {
		petID = V_petID,
		slot = V_slot
		},
	Bin2 }.

%GENERATED from file:bag.h => RPView_FashionInfo
-spec readRPView_FashionInfo(Bin0) -> { #pk_RPView_FashionInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRPView_FashionInfo(Bin0) ->
	{ V_fashionID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_time, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_RPView_FashionInfo {
		fashionID = V_fashionID,
		time = V_time
		},
	Bin2 }.

%GENERATED from file:bag.h => RPView_PetBaseInfo
-spec readRPView_PetBaseInfo(Bin0) -> { #pk_RPView_PetBaseInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRPView_PetBaseInfo(Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_petStar, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_status, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_petName, Bin4 } = binary_read_string( Bin3 ),
	{ V_petRaw, Bin5 } = binary_read_uint8( Bin4 ),
	{ V_petProps, Bin6 } = binary_read_array(Bin5, fun(X) -> readRPView_AddProp( X ) end),
	{ V_petForce, Bin7 } = binary_read_uint64( Bin6 ),
	{ V_upCount, Bin8 } = binary_read_uint( Bin7 ),
	{ #pk_RPView_PetBaseInfo {
		petID = V_petID,
		petStar = V_petStar,
		status = V_status,
		petName = V_petName,
		petRaw = V_petRaw,
		petProps = V_petProps,
		petForce = V_petForce,
		upCount = V_upCount
		},
	Bin8 }.

%GENERATED from file:bag.h => RecastPosInfo
-spec readRecastPosInfo(Bin0) -> { #pk_RecastPosInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRecastPosInfo(Bin0) ->
	{ V_equipPos, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_recastVal, Bin2 } = binary_read_uint( Bin1 ),
	{ V_recastInfo, Bin3 } = binary_read_array(Bin2, fun(X) -> readRecastPropInfo( X ) end),
	{ V_recastInfo_ext, Bin4 } = binary_read_array(Bin3, fun(X) -> readRecastPropInfo( X ) end),
	{ #pk_RecastPosInfo {
		equipPos = V_equipPos,
		recastVal = V_recastVal,
		recastInfo = V_recastInfo,
		recastInfo_ext = V_recastInfo_ext
		},
	Bin4 }.

%GENERATED from file:bag.h => RecastPropInfo
-spec readRecastPropInfo(Bin0) -> { #pk_RecastPropInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRecastPropInfo(Bin0) ->
	{ V_pos, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_propIndex, Bin2 } = binary_read_uint( Bin1 ),
	{ V_propValue, Bin3 } = binary_read_uint( Bin2 ),
	{ V_propValMax, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_RecastPropInfo {
		pos = V_pos,
		propIndex = V_propIndex,
		propValue = V_propValue,
		propValMax = V_propValMax
		},
	Bin4 }.

%GENERATED from file:bag.h => RecastResultInfo
-spec readRecastResultInfo(Bin0) -> { #pk_RecastResultInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRecastResultInfo(Bin0) ->
	{ V_pos, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_propIndex, Bin2 } = binary_read_uint( Bin1 ),
	{ V_value, Bin3 } = binary_read_int( Bin2 ),
	{ #pk_RecastResultInfo {
		pos = V_pos,
		propIndex = V_propIndex,
		value = V_value
		},
	Bin3 }.

%GENERATED from file:bag.h => RecycleEquip
-spec readRecycleEquip(Bin0) -> { #pk_RecycleEquip{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRecycleEquip(Bin0) ->
	{ V_slot, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_equip, Bin2 } = readEquipItemInfo( Bin1 ),
	{ #pk_RecycleEquip {
		slot = V_slot,
		equip = V_equip
		},
	Bin2 }.

%GENERATED from file:bag.h => RecycleItem
-spec readRecycleItem(Bin0) -> { #pk_RecycleItem{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRecycleItem(Bin0) ->
	{ V_slot, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_item, Bin2 } = readNormalItemInfo( Bin1 ),
	{ #pk_RecycleItem {
		slot = V_slot,
		item = V_item
		},
	Bin2 }.

%GENERATED from file:bag.h => starCostItem
-spec readstarCostItem(Bin0) -> { #pk_starCostItem{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readstarCostItem(Bin0) ->
	{ V_itemID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_itemNum, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_starCostItem {
		itemID = V_itemID,
		itemNum = V_itemNum
		},
	Bin2 }.

%GENERATED from file:battle.h => AttackResultList
-spec readAttackResultList(Bin0) -> { #pk_AttackResultList{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readAttackResultList(Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_value, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_AttackResultList {
		type = V_type,
		value = V_value
		},
	Bin2 }.

%GENERATED from file:battle.h => BeAttack
-spec readBeAttack(Bin0) -> { #pk_BeAttack{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readBeAttack(Bin0) ->
	{ V_camp, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_pos, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_hp, Bin3 } = binary_read_int( Bin2 ),
	{ #pk_BeAttack {
		camp = V_camp,
		pos = V_pos,
		hp = V_hp
		},
	Bin3 }.

%GENERATED from file:battle.h => TrunBattleResult
-spec readTrunBattleResult(Bin0) -> { #pk_TrunBattleResult{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readTrunBattleResult(Bin0) ->
	{ V_camp, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_pos, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_id, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_turn, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_bl, Bin5 } = binary_read_array(Bin4, fun(X) -> readBeAttack( X ) end),
	{ #pk_TrunBattleResult {
		camp = V_camp,
		pos = V_pos,
		id = V_id,
		turn = V_turn,
		bl = V_bl
		},
	Bin5 }.

%GENERATED from file:battle.h => TurnBattleInit
-spec readTurnBattleInit(Bin0) -> { #pk_TurnBattleInit{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readTurnBattleInit(Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_type, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_camp, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_pos, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_hp, Bin5 } = binary_read_uint( Bin4 ),
	{ #pk_TurnBattleInit {
		id = V_id,
		type = V_type,
		camp = V_camp,
		pos = V_pos,
		hp = V_hp
		},
	Bin5 }.

%GENERATED from file:companion.h => CompanionMember
-spec readCompanionMember(Bin0) -> { #pk_CompanionMember{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readCompanionMember(Bin0) ->
	{ V_roleid, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ V_lvl, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_relation, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_cur_lively, Bin5 } = binary_read_uint( Bin4 ),
	{ V_max_lively, Bin6 } = binary_read_uint( Bin5 ),
	{ V_all_lively, Bin7 } = binary_read_uint( Bin6 ),
	{ V_offlinetime, Bin8 } = binary_read_uint64( Bin7 ),
	{ V_onlineTimeEnough, Bin9 } = binary_read_bool( Bin8 ),
	{ V_styleID, Bin10 } = binary_read_uint8( Bin9 ),
	{ V_mapID, Bin11 } = binary_read_uint16( Bin10 ),
	{ V_career, Bin12 } = binary_read_uint( Bin11 ),
	{ V_race, Bin13 } = binary_read_uint8( Bin12 ),
	{ V_sex, Bin14 } = binary_read_uint8( Bin13 ),
	{ V_head, Bin15 } = binary_read_uint( Bin14 ),
	{ #pk_CompanionMember {
		roleid = V_roleid,
		name = V_name,
		lvl = V_lvl,
		relation = V_relation,
		cur_lively = V_cur_lively,
		max_lively = V_max_lively,
		all_lively = V_all_lively,
		offlinetime = V_offlinetime,
		onlineTimeEnough = V_onlineTimeEnough,
		styleID = V_styleID,
		mapID = V_mapID,
		career = V_career,
		race = V_race,
		sex = V_sex,
		head = V_head
		},
	Bin15 }.

%GENERATED from file:copy.h => BossRankInfo
-spec readBossRankInfo(Bin0) -> { #pk_BossRankInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readBossRankInfo(Bin0) ->
	{ V_name, Bin1 } = binary_read_string( Bin0 ),
	{ V_hurt, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_BossRankInfo {
		name = V_name,
		hurt = V_hurt
		},
	Bin2 }.

%GENERATED from file:copy.h => chapterInfo
-spec readchapterInfo(Bin0) -> { #pk_chapterInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readchapterInfo(Bin0) ->
	{ V_nextChapterSeconds, Bin1 } = binary_read_uint( Bin0 ),
	{ V_headCount, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_maxChapter, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_curChapter, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_curChapterMonsterMax, Bin5 } = binary_read_uint16( Bin4 ),
	{ V_curChapterMonsterKilled, Bin6 } = binary_read_uint16( Bin5 ),
	{ V_mapMonterMax, Bin7 } = binary_read_uint16( Bin6 ),
	{ V_materialVal, Bin8 } = binary_read_uint( Bin7 ),
	{ #pk_chapterInfo {
		nextChapterSeconds = V_nextChapterSeconds,
		headCount = V_headCount,
		maxChapter = V_maxChapter,
		curChapter = V_curChapter,
		curChapterMonsterMax = V_curChapterMonsterMax,
		curChapterMonsterKilled = V_curChapterMonsterKilled,
		mapMonterMax = V_mapMonterMax,
		materialVal = V_materialVal
		},
	Bin8 }.

%GENERATED from file:copy.h => towerInfo
-spec readtowerInfo(Bin0) -> { #pk_towerInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readtowerInfo(Bin0) ->
	{ V_dataID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_type, Bin2 } = binary_read_uint( Bin1 ),
	{ V_level, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_towerInfo {
		dataID = V_dataID,
		type = V_type,
		level = V_level
		},
	Bin3 }.

%GENERATED from file:fashion.h => FashionInfo
-spec readFashionInfo(Bin0) -> { #pk_FashionInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readFashionInfo(Bin0) ->
	{ V_fashionID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_time, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_FashionInfo {
		fashionID = V_fashionID,
		time = V_time
		},
	Bin2 }.

%GENERATED from file:friend.h => Friend2InfoBase
-spec readFriend2InfoBase(Bin0) -> { #pk_Friend2InfoBase{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readFriend2InfoBase(Bin0) ->
	{ V_simple, Bin1 } = readFriend2InfoSimple( Bin0 ),
	{ V_code, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_face, Bin3 } = binary_read_array(Bin2, fun(X) -> binary_read_uint8( X ) end),
	{ V_vipLv, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_familyName, Bin5 } = binary_read_string( Bin4 ),
	{ V_force, Bin6 } = binary_read_uint64( Bin5 ),
	{ V_timeRelation, Bin7 } = binary_read_uint( Bin6 ),
	{ V_timeLastOnline, Bin8 } = binary_read_uint( Bin7 ),
	{ V_timeLastInteractive, Bin9 } = binary_read_uint( Bin8 ),
	{ V_like, Bin10 } = binary_read_uint( Bin9 ),
	{ V_charm, Bin11 } = binary_read_uint( Bin10 ),
	{ V_isGiveLike, Bin12 } = binary_read_bool( Bin11 ),
	{ V_isBeGiveLike, Bin13 } = binary_read_bool( Bin12 ),
	{ V_isMarried, Bin14 } = binary_read_bool( Bin13 ),
	{ V_distance, Bin15 } = binary_read_float( Bin14 ),
	{ #pk_Friend2InfoBase {
		simple = V_simple,
		code = V_code,
		face = V_face,
		vipLv = V_vipLv,
		familyName = V_familyName,
		force = V_force,
		timeRelation = V_timeRelation,
		timeLastOnline = V_timeLastOnline,
		timeLastInteractive = V_timeLastInteractive,
		like = V_like,
		charm = V_charm,
		isGiveLike = V_isGiveLike,
		isBeGiveLike = V_isBeGiveLike,
		isMarried = V_isMarried,
		distance = V_distance
		},
	Bin15 }.

%GENERATED from file:friend.h => Friend2InfoCross
-spec readFriend2InfoCross(Bin0) -> { #pk_Friend2InfoCross{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readFriend2InfoCross(Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ V_server, Bin3 } = binary_read_string( Bin2 ),
	{ V_level, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_career, Bin5 } = binary_read_uint( Bin4 ),
	{ V_race, Bin6 } = binary_read_uint8( Bin5 ),
	{ V_sex, Bin7 } = binary_read_uint8( Bin6 ),
	{ V_head, Bin8 } = binary_read_int( Bin7 ),
	{ V_face, Bin9 } = binary_read_array(Bin8, fun(X) -> binary_read_uint8( X ) end),
	{ V_timeRelation, Bin10 } = binary_read_uint( Bin9 ),
	{ V_timeLastOnline, Bin11 } = binary_read_uint( Bin10 ),
	{ V_timeLastInteractive, Bin12 } = binary_read_uint( Bin11 ),
	{ V_whereis, Bin13 } = binary_read_uint8( Bin12 ),
	{ #pk_Friend2InfoCross {
		id = V_id,
		name = V_name,
		server = V_server,
		level = V_level,
		career = V_career,
		race = V_race,
		sex = V_sex,
		head = V_head,
		face = V_face,
		timeRelation = V_timeRelation,
		timeLastOnline = V_timeLastOnline,
		timeLastInteractive = V_timeLastInteractive,
		whereis = V_whereis
		},
	Bin13 }.

%GENERATED from file:friend.h => Friend2InfoFormal
-spec readFriend2InfoFormal(Bin0) -> { #pk_Friend2InfoFormal{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readFriend2InfoFormal(Bin0) ->
	{ V_base, Bin1 } = readFriend2InfoBase( Bin0 ),
	{ V_closeness, Bin2 } = binary_read_uint( Bin1 ),
	{ V_isGiveAP, Bin3 } = binary_read_bool( Bin2 ),
	{ V_isGainAP, Bin4 } = binary_read_bool( Bin3 ),
	{ V_isBeGiveAP, Bin5 } = binary_read_bool( Bin4 ),
	{ V_isBeGainAP, Bin6 } = binary_read_bool( Bin5 ),
	{ #pk_Friend2InfoFormal {
		base = V_base,
		closeness = V_closeness,
		isGiveAP = V_isGiveAP,
		isGainAP = V_isGainAP,
		isBeGiveAP = V_isBeGiveAP,
		isBeGainAP = V_isBeGainAP
		},
	Bin6 }.

%GENERATED from file:friend.h => Friend2InfoSimple
-spec readFriend2InfoSimple(Bin0) -> { #pk_Friend2InfoSimple{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readFriend2InfoSimple(Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ V_level, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_career, Bin4 } = binary_read_uint( Bin3 ),
	{ V_race, Bin5 } = binary_read_uint8( Bin4 ),
	{ V_sex, Bin6 } = binary_read_uint8( Bin5 ),
	{ V_head, Bin7 } = binary_read_int( Bin6 ),
	{ #pk_Friend2InfoSimple {
		id = V_id,
		name = V_name,
		level = V_level,
		career = V_career,
		race = V_race,
		sex = V_sex,
		head = V_head
		},
	Bin7 }.

%GENERATED from file:godweapon.h => GodWeaponInfo
-spec readGodWeaponInfo(Bin0) -> { #pk_GodWeaponInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGodWeaponInfo(Bin0) ->
	{ V_weaponID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_weaponLevel, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_skillLevel, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_GodWeaponInfo {
		weaponID = V_weaponID,
		weaponLevel = V_weaponLevel,
		skillLevel = V_skillLevel
		},
	Bin3 }.

%GENERATED from file:guild.h => BiddingGuild
-spec readBiddingGuild(Bin0) -> { #pk_BiddingGuild{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readBiddingGuild(Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_guildName, Bin2 } = binary_read_string( Bin1 ),
	{ V_biddingMoney, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_BiddingGuild {
		guildID = V_guildID,
		guildName = V_guildName,
		biddingMoney = V_biddingMoney
		},
	Bin3 }.

%GENERATED from file:guild.h => CannonState
-spec readCannonState(Bin0) -> { #pk_CannonState{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readCannonState(Bin0) ->
	{ V_collectID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_resetTime, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_CannonState {
		collectID = V_collectID,
		resetTime = V_resetTime
		},
	Bin2 }.

%GENERATED from file:guild.h => ExpeditionFinalInfo
-spec readExpeditionFinalInfo(Bin0) -> { #pk_ExpeditionFinalInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readExpeditionFinalInfo(Bin0) ->
	{ V_mapid, Bin1 } = binary_read_uint( Bin0 ),
	{ V_topGuildInfoList, Bin2 } = binary_read_array(Bin1, fun(X) -> readExpeditionGuildBattleInfo( X ) end),
	{ #pk_ExpeditionFinalInfo {
		mapid = V_mapid,
		topGuildInfoList = V_topGuildInfoList
		},
	Bin2 }.

%GENERATED from file:guild.h => ExpeditionGlobalMapInfo
-spec readExpeditionGlobalMapInfo(Bin0) -> { #pk_ExpeditionGlobalMapInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readExpeditionGlobalMapInfo(Bin0) ->
	{ V_mapid, Bin1 } = binary_read_uint( Bin0 ),
	{ V_onlineNumber, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_queueNumber, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_ExpeditionGlobalMapInfo {
		mapid = V_mapid,
		onlineNumber = V_onlineNumber,
		queueNumber = V_queueNumber
		},
	Bin3 }.

%GENERATED from file:guild.h => ExpeditionGuildBattleInfo
-spec readExpeditionGuildBattleInfo(Bin0) -> { #pk_ExpeditionGuildBattleInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readExpeditionGuildBattleInfo(Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_guildName, Bin2 } = binary_read_string( Bin1 ),
	{ V_guildScore, Bin3 } = binary_read_uint64( Bin2 ),
	{ #pk_ExpeditionGuildBattleInfo {
		guildID = V_guildID,
		guildName = V_guildName,
		guildScore = V_guildScore
		},
	Bin3 }.

%GENERATED from file:guild.h => ExpeditionMapInfo
-spec readExpeditionMapInfo(Bin0) -> { #pk_ExpeditionMapInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readExpeditionMapInfo(Bin0) ->
	{ V_mapid, Bin1 } = binary_read_uint( Bin0 ),
	{ V_guildID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_guildName, Bin3 } = binary_read_string( Bin2 ),
	{ V_onlineNumber, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_queueNumber, Bin5 } = binary_read_uint16( Bin4 ),
	{ V_isGetReward, Bin6 } = binary_read_uint8( Bin5 ),
	{ #pk_ExpeditionMapInfo {
		mapid = V_mapid,
		guildID = V_guildID,
		guildName = V_guildName,
		onlineNumber = V_onlineNumber,
		queueNumber = V_queueNumber,
		isGetReward = V_isGetReward
		},
	Bin6 }.

%GENERATED from file:guild.h => ExpeditionPointInfo
-spec readExpeditionPointInfo(Bin0) -> { #pk_ExpeditionPointInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readExpeditionPointInfo(Bin0) ->
	{ V_pointIndex, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_guildID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_guildName, Bin3 } = binary_read_string( Bin2 ),
	{ #pk_ExpeditionPointInfo {
		pointIndex = V_pointIndex,
		guildID = V_guildID,
		guildName = V_guildName
		},
	Bin3 }.

%GENERATED from file:guild.h => GuildApplyMemberInfo
-spec readGuildApplyMemberInfo(Bin0) -> { #pk_GuildApplyMemberInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGuildApplyMemberInfo(Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleCode, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_roleName, Bin3 } = binary_read_string( Bin2 ),
	{ V_combatNum, Bin4 } = binary_read_uint( Bin3 ),
	{ V_vipLevel, Bin5 } = binary_read_uint8( Bin4 ),
	{ V_playerLevel, Bin6 } = binary_read_uint16( Bin5 ),
	{ V_applyTime, Bin7 } = binary_read_uint64( Bin6 ),
	{ #pk_GuildApplyMemberInfo {
		roleID = V_roleID,
		roleCode = V_roleCode,
		roleName = V_roleName,
		combatNum = V_combatNum,
		vipLevel = V_vipLevel,
		playerLevel = V_playerLevel,
		applyTime = V_applyTime
		},
	Bin7 }.

%GENERATED from file:guild.h => GuildBattleInfo
-spec readGuildBattleInfo(Bin0) -> { #pk_GuildBattleInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGuildBattleInfo(Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_guildName, Bin2 } = binary_read_string( Bin1 ),
	{ V_guildLevel, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_fightForce, Bin4 } = binary_read_uint( Bin3 ),
	{ V_leaderName, Bin5 } = binary_read_string( Bin4 ),
	{ V_leaderRoleID, Bin6 } = binary_read_uint64( Bin5 ),
	{ V_denoter, Bin7 } = binary_read_uint8( Bin6 ),
	{ #pk_GuildBattleInfo {
		guildID = V_guildID,
		guildName = V_guildName,
		guildLevel = V_guildLevel,
		fightForce = V_fightForce,
		leaderName = V_leaderName,
		leaderRoleID = V_leaderRoleID,
		denoter = V_denoter
		},
	Bin7 }.

%GENERATED from file:guild.h => GuildBattlePlayerInfo
-spec readGuildBattlePlayerInfo(Bin0) -> { #pk_GuildBattlePlayerInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGuildBattlePlayerInfo(Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_rank, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_roleID, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_roleName, Bin4 } = binary_read_string( Bin3 ),
	{ V_point, Bin5 } = binary_read_uint( Bin4 ),
	{ #pk_GuildBattlePlayerInfo {
		guildID = V_guildID,
		rank = V_rank,
		roleID = V_roleID,
		roleName = V_roleName,
		point = V_point
		},
	Bin5 }.

%GENERATED from file:guild.h => GuildBattleResultInfo
-spec readGuildBattleResultInfo(Bin0) -> { #pk_GuildBattleResultInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGuildBattleResultInfo(Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_guildName, Bin2 } = binary_read_string( Bin1 ),
	{ V_point, Bin3 } = binary_read_uint( Bin2 ),
	{ V_playerInfos, Bin4 } = binary_read_array(Bin3, fun(X) -> readGuildBattlePlayerInfo( X ) end),
	{ #pk_GuildBattleResultInfo {
		guildID = V_guildID,
		guildName = V_guildName,
		point = V_point,
		playerInfos = V_playerInfos
		},
	Bin4 }.

%GENERATED from file:guild.h => GuildBuff
-spec readGuildBuff(Bin0) -> { #pk_GuildBuff{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGuildBuff(Bin0) ->
	{ V_confId, Bin1 } = binary_read_uint( Bin0 ),
	{ V_buffID, Bin2 } = binary_read_uint( Bin1 ),
	{ V_getFlag, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_GuildBuff {
		confId = V_confId,
		buffID = V_buffID,
		getFlag = V_getFlag
		},
	Bin3 }.

%GENERATED from file:guild.h => GuildBuffRole
-spec readGuildBuffRole(Bin0) -> { #pk_GuildBuffRole{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGuildBuffRole(Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleName, Bin2 } = binary_read_string( Bin1 ),
	{ V_buyTime, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_confId, Bin4 } = binary_read_uint( Bin3 ),
	{ V_buffID, Bin5 } = binary_read_uint( Bin4 ),
	{ #pk_GuildBuffRole {
		roleID = V_roleID,
		roleName = V_roleName,
		buyTime = V_buyTime,
		confId = V_confId,
		buffID = V_buffID
		},
	Bin5 }.

%GENERATED from file:guild.h => GuildIDList
-spec readGuildIDList(Bin0) -> { #pk_GuildIDList{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGuildIDList(Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_guildName, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_GuildIDList {
		guildID = V_guildID,
		guildName = V_guildName
		},
	Bin2 }.

%GENERATED from file:guild.h => GuildInfo
-spec readGuildInfo(Bin0) -> { #pk_GuildInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGuildInfo(Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_guildName, Bin2 } = binary_read_string( Bin1 ),
	{ V_guildLevel, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_denoter, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_fightForce, Bin5 } = binary_read_uint( Bin4 ),
	{ V_memberNumber, Bin6 } = binary_read_uint( Bin5 ),
	{ V_maxMemberNumber, Bin7 } = binary_read_uint( Bin6 ),
	{ V_leaderName, Bin8 } = binary_read_string( Bin7 ),
	{ V_leaderRoleID, Bin9 } = binary_read_uint64( Bin8 ),
	{ V_isRequest, Bin10 } = binary_read_uint8( Bin9 ),
	{ #pk_GuildInfo {
		guildID = V_guildID,
		guildName = V_guildName,
		guildLevel = V_guildLevel,
		denoter = V_denoter,
		fightForce = V_fightForce,
		memberNumber = V_memberNumber,
		maxMemberNumber = V_maxMemberNumber,
		leaderName = V_leaderName,
		leaderRoleID = V_leaderRoleID,
		isRequest = V_isRequest
		},
	Bin10 }.

%GENERATED from file:guild.h => GuildMemberInfo
-spec readGuildMemberInfo(Bin0) -> { #pk_GuildMemberInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGuildMemberInfo(Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleCode, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_roleName, Bin3 } = binary_read_string( Bin2 ),
	{ V_roleGuildLevel, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_liveness, Bin5 } = binary_read_uint( Bin4 ),
	{ V_combatNum, Bin6 } = binary_read_uint( Bin5 ),
	{ V_offlineTime, Bin7 } = binary_read_uint64( Bin6 ),
	{ V_vipLevel, Bin8 } = binary_read_uint8( Bin7 ),
	{ V_playerLevel, Bin9 } = binary_read_uint16( Bin8 ),
	{ V_career, Bin10 } = binary_read_uint( Bin9 ),
	{ V_race, Bin11 } = binary_read_uint8( Bin10 ),
	{ V_sex, Bin12 } = binary_read_uint8( Bin11 ),
	{ V_head, Bin13 } = binary_read_int( Bin12 ),
	{ #pk_GuildMemberInfo {
		roleID = V_roleID,
		roleCode = V_roleCode,
		roleName = V_roleName,
		roleGuildLevel = V_roleGuildLevel,
		liveness = V_liveness,
		combatNum = V_combatNum,
		offlineTime = V_offlineTime,
		vipLevel = V_vipLevel,
		playerLevel = V_playerLevel,
		career = V_career,
		race = V_race,
		sex = V_sex,
		head = V_head
		},
	Bin13 }.

%GENERATED from file:guild.h => GuildSkill
-spec readGuildSkill(Bin0) -> { #pk_GuildSkill{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGuildSkill(Bin0) ->
	{ V_confId, Bin1 } = binary_read_uint( Bin0 ),
	{ V_skillID, Bin2 } = binary_read_uint( Bin1 ),
	{ V_skillLvl, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_next_confID, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_GuildSkill {
		confId = V_confId,
		skillID = V_skillID,
		skillLvl = V_skillLvl,
		next_confID = V_next_confID
		},
	Bin4 }.

%GENERATED from file:guild.h => GuildTask
-spec readGuildTask(Bin0) -> { #pk_GuildTask{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGuildTask(Bin0) ->
	{ V_taskType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_taskState, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_curTimes, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_maxTimes, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_accCDTime, Bin5 } = binary_read_uint( Bin4 ),
	{ V_taskID, Bin6 } = binary_read_uint16( Bin5 ),
	{ V_targetGuildID, Bin7 } = binary_read_uint64( Bin6 ),
	{ V_targetGuildName, Bin8 } = binary_read_string( Bin7 ),
	{ V_targetPlayerRoleID, Bin9 } = binary_read_uint64( Bin8 ),
	{ V_targetPLayerName, Bin10 } = binary_read_string( Bin9 ),
	{ V_number1, Bin11 } = binary_read_uint( Bin10 ),
	{ V_number2, Bin12 } = binary_read_uint( Bin11 ),
	{ V_number3, Bin13 } = binary_read_uint( Bin12 ),
	{ #pk_GuildTask {
		taskType = V_taskType,
		taskState = V_taskState,
		curTimes = V_curTimes,
		maxTimes = V_maxTimes,
		accCDTime = V_accCDTime,
		taskID = V_taskID,
		targetGuildID = V_targetGuildID,
		targetGuildName = V_targetGuildName,
		targetPlayerRoleID = V_targetPlayerRoleID,
		targetPLayerName = V_targetPLayerName,
		number1 = V_number1,
		number2 = V_number2,
		number3 = V_number3
		},
	Bin13 }.

%GENERATED from file:guild.h => GuildWar
-spec readGuildWar(Bin0) -> { #pk_GuildWar{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGuildWar(Bin0) ->
	{ V_stage, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_group, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_guildID1, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_guildName1, Bin4 } = binary_read_string( Bin3 ),
	{ V_guildID2, Bin5 } = binary_read_uint64( Bin4 ),
	{ V_guildName2, Bin6 } = binary_read_string( Bin5 ),
	{ V_guildID3, Bin7 } = binary_read_uint64( Bin6 ),
	{ V_guildName3, Bin8 } = binary_read_string( Bin7 ),
	{ V_winguildID, Bin9 } = binary_read_uint64( Bin8 ),
	{ V_winguildName, Bin10 } = binary_read_string( Bin9 ),
	{ #pk_GuildWar {
		stage = V_stage,
		group = V_group,
		guildID1 = V_guildID1,
		guildName1 = V_guildName1,
		guildID2 = V_guildID2,
		guildName2 = V_guildName2,
		guildID3 = V_guildID3,
		guildName3 = V_guildName3,
		winguildID = V_winguildID,
		winguildName = V_winguildName
		},
	Bin10 }.

%GENERATED from file:guild.h => GuildWarInfo
-spec readGuildWarInfo(Bin0) -> { #pk_GuildWarInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGuildWarInfo(Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_guildName, Bin2 } = binary_read_string( Bin1 ),
	{ V_all_integral, Bin3 } = binary_read_uint( Bin2 ),
	{ V_integrals, Bin4 } = binary_read_array(Bin3, fun(X) -> readGuildWarInfoIntegral( X ) end),
	{ #pk_GuildWarInfo {
		guildID = V_guildID,
		guildName = V_guildName,
		all_integral = V_all_integral,
		integrals = V_integrals
		},
	Bin4 }.

%GENERATED from file:guild.h => GuildWarInfoIntegral
-spec readGuildWarInfoIntegral(Bin0) -> { #pk_GuildWarInfoIntegral{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGuildWarInfoIntegral(Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_number, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_integral, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GuildWarInfoIntegral {
		type = V_type,
		number = V_number,
		integral = V_integral
		},
	Bin3 }.

%GENERATED from file:guild.h => GuildWarRank
-spec readGuildWarRank(Bin0) -> { #pk_GuildWarRank{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGuildWarRank(Bin0) ->
	{ V_rank, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_roleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_roleName, Bin3 } = binary_read_string( Bin2 ),
	{ V_killPlayer, Bin4 } = binary_read_uint( Bin3 ),
	{ V_secondAttack, Bin5 } = binary_read_uint( Bin4 ),
	{ #pk_GuildWarRank {
		rank = V_rank,
		roleID = V_roleID,
		roleName = V_roleName,
		killPlayer = V_killPlayer,
		secondAttack = V_secondAttack
		},
	Bin5 }.

%GENERATED from file:guild.h => GuildWarReward_coin
-spec readGuildWarReward_coin(Bin0) -> { #pk_GuildWarReward_coin{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGuildWarReward_coin(Bin0) ->
	{ V_cointype, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_number, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_GuildWarReward_coin {
		cointype = V_cointype,
		number = V_number
		},
	Bin2 }.

%GENERATED from file:guild.h => GuildWarReward_item
-spec readGuildWarReward_item(Bin0) -> { #pk_GuildWarReward_item{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGuildWarReward_item(Bin0) ->
	{ V_isBind, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_itemID, Bin2 } = binary_read_uint( Bin1 ),
	{ V_itemNumber, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_GuildWarReward_item {
		isBind = V_isBind,
		itemID = V_itemID,
		itemNumber = V_itemNumber
		},
	Bin3 }.

%GENERATED from file:guild.h => NameTable2
-spec readNameTable2(Bin0) -> { #pk_NameTable2{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readNameTable2(Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_NameTable2 {
		id = V_id,
		name = V_name
		},
	Bin2 }.

%GENERATED from file:guild.h => OccupyGuildInfo
-spec readOccupyGuildInfo(Bin0) -> { #pk_OccupyGuildInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readOccupyGuildInfo(Bin0) ->
	{ V_guildID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_guildName, Bin2 } = binary_read_string( Bin1 ),
	{ V_occupyIDs, Bin3 } = binary_read_array(Bin2, fun(X) -> binary_read_uint( X ) end),
	{ V_allPoint, Bin4 } = binary_read_uint( Bin3 ),
	{ V_denoter, Bin5 } = binary_read_uint8( Bin4 ),
	{ #pk_OccupyGuildInfo {
		guildID = V_guildID,
		guildName = V_guildName,
		occupyIDs = V_occupyIDs,
		allPoint = V_allPoint,
		denoter = V_denoter
		},
	Bin5 }.

%GENERATED from file:guild.h => PebbleState
-spec readPebbleState(Bin0) -> { #pk_PebbleState{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPebbleState(Bin0) ->
	{ V_monsterID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_curHP, Bin2 } = binary_read_uint( Bin1 ),
	{ V_maxHP, Bin3 } = binary_read_uint( Bin2 ),
	{ V_resetTime, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_PebbleState {
		monsterID = V_monsterID,
		curHP = V_curHP,
		maxHP = V_maxHP,
		resetTime = V_resetTime
		},
	Bin4 }.

%GENERATED from file:guild.h => Ride
-spec readRide(Bin0) -> { #pk_Ride{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRide(Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_level, Bin2 } = binary_read_uint( Bin1 ),
	{ V_state, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_Ride {
		id = V_id,
		level = V_level,
		state = V_state
		},
	Bin3 }.

%GENERATED from file:guild.h => RideRole
-spec readRideRole(Bin0) -> { #pk_RideRole{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRideRole(Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_guildID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_rideID, Bin3 } = binary_read_uint( Bin2 ),
	{ V_seatID, Bin4 } = binary_read_uint( Bin3 ),
	{ V_time, Bin5 } = binary_read_uint( Bin4 ),
	{ #pk_RideRole {
		roleID = V_roleID,
		guildID = V_guildID,
		rideID = V_rideID,
		seatID = V_seatID,
		time = V_time
		},
	Bin5 }.

%GENERATED from file:guild.h => SuppHistory
-spec readSuppHistory(Bin0) -> { #pk_SuppHistory{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readSuppHistory(Bin0) ->
	{ V_time, Bin1 } = binary_read_uint( Bin0 ),
	{ V_roleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_tarRoleID, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_itemID, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_itemM, Bin5 } = binary_read_uint16( Bin4 ),
	{ #pk_SuppHistory {
		time = V_time,
		roleID = V_roleID,
		tarRoleID = V_tarRoleID,
		itemID = V_itemID,
		itemM = V_itemM
		},
	Bin5 }.

%GENERATED from file:guild.h => SuppHistory2
-spec readSuppHistory2(Bin0) -> { #pk_SuppHistory2{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readSuppHistory2(Bin0) ->
	{ V_career, Bin1 } = binary_read_uint( Bin0 ),
	{ V_race, Bin2 } = binary_read_int8( Bin1 ),
	{ V_sex, Bin3 } = binary_read_int8( Bin2 ),
	{ V_head, Bin4 } = binary_read_int( Bin3 ),
	{ V_level, Bin5 } = binary_read_int( Bin4 ),
	{ V_history, Bin6 } = readSuppHistory( Bin5 ),
	{ #pk_SuppHistory2 {
		career = V_career,
		race = V_race,
		sex = V_sex,
		head = V_head,
		level = V_level,
		history = V_history
		},
	Bin6 }.

%GENERATED from file:guild.h => Supplication
-spec readSupplication(Bin0) -> { #pk_Supplication{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readSupplication(Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleCode, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_roleName, Bin3 } = binary_read_string( Bin2 ),
	{ V_roleGuildLevel, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_career, Bin5 } = binary_read_uint( Bin4 ),
	{ V_race, Bin6 } = binary_read_int8( Bin5 ),
	{ V_sex, Bin7 } = binary_read_int8( Bin6 ),
	{ V_head, Bin8 } = binary_read_int( Bin7 ),
	{ V_level, Bin9 } = binary_read_int( Bin8 ),
	{ V_itemID, Bin10 } = binary_read_uint16( Bin9 ),
	{ V_itemM, Bin11 } = binary_read_uint16( Bin10 ),
	{ V_isGive, Bin12 } = binary_read_bool( Bin11 ),
	{ #pk_Supplication {
		roleID = V_roleID,
		roleCode = V_roleCode,
		roleName = V_roleName,
		roleGuildLevel = V_roleGuildLevel,
		career = V_career,
		race = V_race,
		sex = V_sex,
		head = V_head,
		level = V_level,
		itemID = V_itemID,
		itemM = V_itemM,
		isGive = V_isGive
		},
	Bin12 }.

%GENERATED from file:home.h => FarmingPet
-spec readFarmingPet(Bin0) -> { #pk_FarmingPet{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readFarmingPet(Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_deltaTime, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_time, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_lastdeltaTime, Bin4 } = binary_read_uint16( Bin3 ),
	{ #pk_FarmingPet {
		petID = V_petID,
		deltaTime = V_deltaTime,
		time = V_time,
		lastdeltaTime = V_lastdeltaTime
		},
	Bin4 }.

%GENERATED from file:home.h => HomeArea
-spec readHomeArea(Bin0) -> { #pk_HomeArea{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readHomeArea(Bin0) ->
	{ V_homeID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_areaID, Bin2 } = binary_read_uint( Bin1 ),
	{ V_areaLvl, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_HomeArea {
		homeID = V_homeID,
		areaID = V_areaID,
		areaLvl = V_areaLvl
		},
	Bin3 }.

%GENERATED from file:home.h => HomeVisit
-spec readHomeVisit(Bin0) -> { #pk_HomeVisit{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readHomeVisit(Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleName, Bin2 } = binary_read_string( Bin1 ),
	{ V_level, Bin3 } = binary_read_uint( Bin2 ),
	{ V_homeID, Bin4 } = binary_read_uint64( Bin3 ),
	{ V_closeness, Bin5 } = binary_read_int( Bin4 ),
	{ V_face, Bin6 } = binary_read_array(Bin5, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_HomeVisit {
		roleID = V_roleID,
		roleName = V_roleName,
		level = V_level,
		homeID = V_homeID,
		closeness = V_closeness,
		face = V_face
		},
	Bin6 }.

%GENERATED from file:home.h => Plant
-spec readPlant(Bin0) -> { #pk_Plant{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPlant(Bin0) ->
	{ V_homeID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_areaType, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_pos, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_id, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_time, Bin5 } = binary_read_uint( Bin4 ),
	{ V_health, Bin6 } = binary_read_uint8( Bin5 ),
	{ V_wateringCount, Bin7 } = binary_read_uint8( Bin6 ),
	{ V_wateringTime, Bin8 } = binary_read_uint( Bin7 ),
	{ V_compostCount, Bin9 } = binary_read_uint8( Bin8 ),
	{ V_compostTime, Bin10 } = binary_read_uint8( Bin9 ),
	{ V_isPestis, Bin11 } = binary_read_bool( Bin10 ),
	{ #pk_Plant {
		homeID = V_homeID,
		areaType = V_areaType,
		pos = V_pos,
		id = V_id,
		time = V_time,
		health = V_health,
		wateringCount = V_wateringCount,
		wateringTime = V_wateringTime,
		compostCount = V_compostCount,
		compostTime = V_compostTime,
		isPestis = V_isPestis
		},
	Bin11 }.

%GENERATED from file:home.h => VisitRecord
-spec readVisitRecord(Bin0) -> { #pk_VisitRecord{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readVisitRecord(Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleName, Bin2 } = binary_read_string( Bin1 ),
	{ V_relationType, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_opType, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_opParam1, Bin5 } = binary_read_uint( Bin4 ),
	{ V_opParam2, Bin6 } = binary_read_uint( Bin5 ),
	{ V_opParam3, Bin7 } = binary_read_uint( Bin6 ),
	{ V_timestamp, Bin8 } = binary_read_uint64( Bin7 ),
	{ #pk_VisitRecord {
		roleID = V_roleID,
		roleName = V_roleName,
		relationType = V_relationType,
		opType = V_opType,
		opParam1 = V_opParam1,
		opParam2 = V_opParam2,
		opParam3 = V_opParam3,
		timestamp = V_timestamp
		},
	Bin8 }.

%GENERATED from file:identity.h => GiftHistory
-spec readGiftHistory(Bin0) -> { #pk_GiftHistory{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGiftHistory(Bin0) ->
	{ V_index, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_time, Bin2 } = binary_read_uint( Bin1 ),
	{ V_roleID, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_tarRoleID, Bin4 } = binary_read_uint64( Bin3 ),
	{ V_itemID, Bin5 } = binary_read_uint16( Bin4 ),
	{ V_itemCount, Bin6 } = binary_read_uint16( Bin5 ),
	{ V_charmUpdate, Bin7 } = binary_read_uint( Bin6 ),
	{ #pk_GiftHistory {
		index = V_index,
		time = V_time,
		roleID = V_roleID,
		tarRoleID = V_tarRoleID,
		itemID = V_itemID,
		itemCount = V_itemCount,
		charmUpdate = V_charmUpdate
		},
	Bin7 }.

%GENERATED from file:identity.h => MD5
-spec readMD5(Bin0) -> { #pk_MD5{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readMD5(Bin0) ->
	{ V_md5, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_MD5 {
		md5 = V_md5
		},
	Bin1 }.

%GENERATED from file:identity.h => NameTable
-spec readNameTable(Bin0) -> { #pk_NameTable{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readNameTable(Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_NameTable {
		id = V_id,
		name = V_name
		},
	Bin2 }.

%GENERATED from file:identity.h => RoleHeadPic
-spec readRoleHeadPic(Bin0) -> { #pk_RoleHeadPic{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRoleHeadPic(Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_md5, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_RoleHeadPic {
		roleID = V_roleID,
		md5 = V_md5
		},
	Bin2 }.

%GENERATED from file:item.h => GiftItemInfo
-spec readGiftItemInfo(Bin0) -> { #pk_GiftItemInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGiftItemInfo(Bin0) ->
	{ V_itemid, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_number, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_GiftItemInfo {
		itemid = V_itemid,
		number = V_number
		},
	Bin2 }.

%GENERATED from file:item.h => LookInfoItem
-spec readLookInfoItem(Bin0) -> { #pk_LookInfoItem{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readLookInfoItem(Bin0) ->
	{ V_itemid, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_sortid, Bin2 } = binary_read_uint( Bin1 ),
	{ V_type, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_value, Bin4 } = binary_read_uint( Bin3 ),
	{ V_quality, Bin5 } = binary_read_uint8( Bin4 ),
	{ V_useLevel, Bin6 } = binary_read_uint16( Bin5 ),
	{ V_quotaNumber, Bin7 } = binary_read_int( Bin6 ),
	{ #pk_LookInfoItem {
		itemid = V_itemid,
		sortid = V_sortid,
		type = V_type,
		value = V_value,
		quality = V_quality,
		useLevel = V_useLevel,
		quotaNumber = V_quotaNumber
		},
	Bin7 }.

%GENERATED from file:item.h => LookInfoItemAtMall
-spec readLookInfoItemAtMall(Bin0) -> { #pk_LookInfoItemAtMall{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readLookInfoItemAtMall(Bin0) ->
	{ V_itemid, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_sortid, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_type, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_value, Bin4 } = binary_read_uint( Bin3 ),
	{ V_stockCount, Bin5 } = binary_read_uint16( Bin4 ),
	{ V_stockGiftCount, Bin6 } = binary_read_uint16( Bin5 ),
	{ V_gifts, Bin7 } = binary_read_array(Bin6, fun(X) -> readGiftItemInfo( X ) end),
	{ V_saleStartTime, Bin8 } = binary_read_uint( Bin7 ),
	{ V_saleEndTime, Bin9 } = binary_read_uint( Bin8 ),
	{ V_quotaNum, Bin10 } = binary_read_uint8( Bin9 ),
	{ #pk_LookInfoItemAtMall {
		itemid = V_itemid,
		sortid = V_sortid,
		type = V_type,
		value = V_value,
		stockCount = V_stockCount,
		stockGiftCount = V_stockGiftCount,
		gifts = V_gifts,
		saleStartTime = V_saleStartTime,
		saleEndTime = V_saleEndTime,
		quotaNum = V_quotaNum
		},
	Bin10 }.

%GENERATED from file:item.h => MysteriousShopItem
-spec readMysteriousShopItem(Bin0) -> { #pk_MysteriousShopItem{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readMysteriousShopItem(Bin0) ->
	{ V_only_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_itemid, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_money_type, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_money, Bin4 } = binary_read_uint( Bin3 ),
	{ V_number, Bin5 } = binary_read_int( Bin4 ),
	{ #pk_MysteriousShopItem {
		only_id = V_only_id,
		itemid = V_itemid,
		money_type = V_money_type,
		money = V_money,
		number = V_number
		},
	Bin5 }.

%GENERATED from file:item.h => RefindResInfo
-spec readRefindResInfo(Bin0) -> { #pk_RefindResInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRefindResInfo(Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_number, Bin2 } = binary_read_int( Bin1 ),
	{ #pk_RefindResInfo {
		id = V_id,
		number = V_number
		},
	Bin2 }.

%GENERATED from file:item.h => UseItemCD
-spec readUseItemCD(Bin0) -> { #pk_UseItemCD{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readUseItemCD(Bin0) ->
	{ V_itemGroupID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_remainCDTime, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_UseItemCD {
		itemGroupID = V_itemGroupID,
		remainCDTime = V_remainCDTime
		},
	Bin2 }.

%GENERATED from file:item.h => UseItemGainGoodsTips
-spec readUseItemGainGoodsTips(Bin0) -> { #pk_UseItemGainGoodsTips{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readUseItemGainGoodsTips(Bin0) ->
	{ V_itemID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_itemNum, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_quality, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_isBind, Bin4 } = binary_read_uint8( Bin3 ),
	{ #pk_UseItemGainGoodsTips {
		itemID = V_itemID,
		itemNum = V_itemNum,
		quality = V_quality,
		isBind = V_isBind
		},
	Bin4 }.

%GENERATED from file:luckycoin.h => GainLuckyCoinInfo
-spec readGainLuckyCoinInfo(Bin0) -> { #pk_GainLuckyCoinInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readGainLuckyCoinInfo(Bin0) ->
	{ V_time, Bin1 } = binary_read_uint( Bin0 ),
	{ V_friendID, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_GainLuckyCoinInfo {
		time = V_time,
		friendID = V_friendID
		},
	Bin2 }.

%GENERATED from file:mail.h => MailCoin
-spec readMailCoin(Bin0) -> { #pk_MailCoin{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readMailCoin(Bin0) ->
	{ V_coinType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_coinNum, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_MailCoin {
		coinType = V_coinType,
		coinNum = V_coinNum
		},
	Bin2 }.

%GENERATED from file:mail.h => MailDetail
-spec readMailDetail(Bin0) -> { #pk_MailDetail{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readMailDetail(Bin0) ->
	{ V_mailID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_sendRoleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_isLocked, Bin3 } = binary_read_bool( Bin2 ),
	{ V_remainDay, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_sendPlayerName, Bin5 } = binary_read_string( Bin4 ),
	{ V_mailTitle, Bin6 } = binary_read_string( Bin5 ),
	{ V_mailContent, Bin7 } = binary_read_string( Bin6 ),
	{ V_itemList, Bin8 } = binary_read_array(Bin7, fun(X) -> readMailItem( X ) end),
	{ V_coinList, Bin9 } = binary_read_array(Bin8, fun(X) -> readMailCoin( X ) end),
	{ #pk_MailDetail {
		mailID = V_mailID,
		sendRoleID = V_sendRoleID,
		isLocked = V_isLocked,
		remainDay = V_remainDay,
		sendPlayerName = V_sendPlayerName,
		mailTitle = V_mailTitle,
		mailContent = V_mailContent,
		itemList = V_itemList,
		coinList = V_coinList
		},
	Bin9 }.

%GENERATED from file:mail.h => MailInfo
-spec readMailInfo(Bin0) -> { #pk_MailInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readMailInfo(Bin0) ->
	{ V_mailID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_mailTitle, Bin2 } = binary_read_string( Bin1 ),
	{ V_mailReadTime, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_mailSendTime, Bin4 } = binary_read_uint64( Bin3 ),
	{ V_ishaveAttach, Bin5 } = binary_read_bool( Bin4 ),
	{ V_senderName, Bin6 } = binary_read_string( Bin5 ),
	{ #pk_MailInfo {
		mailID = V_mailID,
		mailTitle = V_mailTitle,
		mailReadTime = V_mailReadTime,
		mailSendTime = V_mailSendTime,
		ishaveAttach = V_ishaveAttach,
		senderName = V_senderName
		},
	Bin6 }.

%GENERATED from file:mail.h => MailItem
-spec readMailItem(Bin0) -> { #pk_MailItem{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readMailItem(Bin0) ->
	{ V_itemUID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_itemID, Bin2 } = binary_read_uint( Bin1 ),
	{ V_itemNumber, Bin3 } = binary_read_uint( Bin2 ),
	{ V_quality, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_isBind, Bin5 } = binary_read_bool( Bin4 ),
	{ #pk_MailItem {
		itemUID = V_itemUID,
		itemID = V_itemID,
		itemNumber = V_itemNumber,
		quality = V_quality,
		isBind = V_isBind
		},
	Bin5 }.

%GENERATED from file:mail.h => MailItemAll
-spec readMailItemAll(Bin0) -> { #pk_MailItemAll{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readMailItemAll(Bin0) ->
	{ V_itemID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_itemNumber, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_MailItemAll {
		itemID = V_itemID,
		itemNumber = V_itemNumber
		},
	Bin2 }.

%GENERATED from file:mail.h => retMailOpt
-spec readretMailOpt(Bin0) -> { #pk_retMailOpt{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readretMailOpt(Bin0) ->
	{ V_mailID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_result, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_retMailOpt {
		mailID = V_mailID,
		result = V_result
		},
	Bin2 }.

%GENERATED from file:mall.h => MallInfo
-spec readMallInfo(Bin0) -> { #pk_MallInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readMallInfo(Bin0) ->
	{ V_db_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_itemid, Bin2 } = binary_read_uint( Bin1 ),
	{ V_buyNumDefalut, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_mainmenu, Bin4 } = binary_read_int8( Bin3 ),
	{ V_submenu, Bin5 } = binary_read_int8( Bin4 ),
	{ V_gold, Bin6 } = binary_read_int( Bin5 ),
	{ V_bind_gold, Bin7 } = binary_read_int( Bin6 ),
	{ V_use_integral, Bin8 } = binary_read_int( Bin7 ),
	{ V_get_integral, Bin9 } = binary_read_int( Bin8 ),
	{ V_lefttime, Bin10 } = binary_read_int( Bin9 ),
	{ V_leftcount, Bin11 } = binary_read_int( Bin10 ),
	{ V_leftcountMax, Bin12 } = binary_read_int( Bin11 ),
	{ V_sortNumber, Bin13 } = binary_read_int( Bin12 ),
	{ V_rebate, Bin14 } = binary_read_int8( Bin13 ),
	{ V_showtype, Bin15 } = binary_read_int8( Bin14 ),
	{ V_limitType, Bin16 } = binary_read_int8( Bin15 ),
	{ #pk_MallInfo {
		db_id = V_db_id,
		itemid = V_itemid,
		buyNumDefalut = V_buyNumDefalut,
		mainmenu = V_mainmenu,
		submenu = V_submenu,
		gold = V_gold,
		bind_gold = V_bind_gold,
		use_integral = V_use_integral,
		get_integral = V_get_integral,
		lefttime = V_lefttime,
		leftcount = V_leftcount,
		leftcountMax = V_leftcountMax,
		sortNumber = V_sortNumber,
		rebate = V_rebate,
		showtype = V_showtype,
		limitType = V_limitType
		},
	Bin16 }.

%GENERATED from file:marriage.h => SkillInfoForMarraige
-spec readSkillInfoForMarraige(Bin0) -> { #pk_SkillInfoForMarraige{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readSkillInfoForMarraige(Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_exp, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_SkillInfoForMarraige {
		id = V_id,
		exp = V_exp
		},
	Bin2 }.

%GENERATED from file:mount.h => MountInfo
-spec readMountInfo(Bin0) -> { #pk_MountInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readMountInfo(Bin0) ->
	{ V_level, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_state, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_curProcess, Bin3 } = binary_read_uint( Bin2 ),
	{ V_shape_id, Bin4 } = binary_read_uint16( Bin3 ),
	{ #pk_MountInfo {
		level = V_level,
		state = V_state,
		curProcess = V_curProcess,
		shape_id = V_shape_id
		},
	Bin4 }.

%GENERATED from file:npc.h => NpcTitle
-spec readNpcTitle(Bin0) -> { #pk_NpcTitle{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readNpcTitle(Bin0) ->
	{ V_npccode, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_new_title, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_NpcTitle {
		npccode = V_npccode,
		new_title = V_new_title
		},
	Bin2 }.

%GENERATED from file:pet.h => AddProp
-spec readAddProp(Bin0) -> { #pk_AddProp{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readAddProp(Bin0) ->
	{ V_prop, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_value, Bin2 } = binary_read_float( Bin1 ),
	{ #pk_AddProp {
		prop = V_prop,
		value = V_value
		},
	Bin2 }.

%GENERATED from file:pet.h => AssistBattleInfo
-spec readAssistBattleInfo(Bin0) -> { #pk_AssistBattleInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readAssistBattleInfo(Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_slot, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_AssistBattleInfo {
		petID = V_petID,
		slot = V_slot
		},
	Bin2 }.

%GENERATED from file:pet.h => CatalogNode
-spec readCatalogNode(Bin0) -> { #pk_CatalogNode{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readCatalogNode(Bin0) ->
	{ V_id, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_starLevel, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_CatalogNode {
		id = V_id,
		starLevel = V_starLevel
		},
	Bin2 }.

%GENERATED from file:pet.h => PetBaseInfo
-spec readPetBaseInfo(Bin0) -> { #pk_PetBaseInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPetBaseInfo(Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_petStar, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_status, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_skillList, Bin4 } = binary_read_array(Bin3, fun(X) -> readPetSkillBaseInfo( X ) end),
	{ V_petName, Bin5 } = binary_read_string( Bin4 ),
	{ V_petRaw, Bin6 } = binary_read_uint8( Bin5 ),
	{ V_petTime, Bin7 } = binary_read_uint64( Bin6 ),
	{ V_petProps, Bin8 } = binary_read_array(Bin7, fun(X) -> readAddProp( X ) end),
	{ V_petForce, Bin9 } = binary_read_uint64( Bin8 ),
	{ V_upCount, Bin10 } = binary_read_uint( Bin9 ),
	{ V_petLevel, Bin11 } = binary_read_uint( Bin10 ),
	{ V_petExp, Bin12 } = binary_read_uint( Bin11 ),
	{ #pk_PetBaseInfo {
		petID = V_petID,
		petStar = V_petStar,
		status = V_status,
		skillList = V_skillList,
		petName = V_petName,
		petRaw = V_petRaw,
		petTime = V_petTime,
		petProps = V_petProps,
		petForce = V_petForce,
		upCount = V_upCount,
		petLevel = V_petLevel,
		petExp = V_petExp
		},
	Bin12 }.

%GENERATED from file:pet.h => PetEquipInfo
-spec readPetEquipInfo(Bin0) -> { #pk_PetEquipInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPetEquipInfo(Bin0) ->
	{ V_equipID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_equipLv, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_PetEquipInfo {
		equipID = V_equipID,
		equipLv = V_equipLv
		},
	Bin2 }.

%GENERATED from file:pet.h => PetSkillBaseInfo
-spec readPetSkillBaseInfo(Bin0) -> { #pk_PetSkillBaseInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPetSkillBaseInfo(Bin0) ->
	{ V_petSkillIndex, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_petSkillId, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_petSkillCd, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_petSkillType, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_petSkillLv, Bin5 } = binary_read_uint8( Bin4 ),
	{ V_petSkillIsUnlock, Bin6 } = binary_read_uint8( Bin5 ),
	{ #pk_PetSkillBaseInfo {
		petSkillIndex = V_petSkillIndex,
		petSkillId = V_petSkillId,
		petSkillCd = V_petSkillCd,
		petSkillType = V_petSkillType,
		petSkillLv = V_petSkillLv,
		petSkillIsUnlock = V_petSkillIsUnlock
		},
	Bin6 }.

%GENERATED from file:pet.h => PetSkillCastResult
-spec readPetSkillCastResult(Bin0) -> { #pk_PetSkillCastResult{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPetSkillCastResult(Bin0) ->
	{ V_oldSkillID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_newSkillID, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_newSkillLevel, Bin3 } = binary_read_uint16( Bin2 ),
	{ #pk_PetSkillCastResult {
		oldSkillID = V_oldSkillID,
		newSkillID = V_newSkillID,
		newSkillLevel = V_newSkillLevel
		},
	Bin3 }.

%GENERATED from file:pet.h => PetTerritoryInfo
-spec readPetTerritoryInfo(Bin0) -> { #pk_PetTerritoryInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPetTerritoryInfo(Bin0) ->
	{ V_petID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_petForce, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_territoryID, Bin3 } = binary_read_uint( Bin2 ),
	{ V_star, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_raw, Bin5 } = binary_read_uint8( Bin4 ),
	{ #pk_PetTerritoryInfo {
		petID = V_petID,
		petForce = V_petForce,
		territoryID = V_territoryID,
		star = V_star,
		raw = V_raw
		},
	Bin5 }.

%GENERATED from file:pet.h => PvPCityInfo
-spec readPvPCityInfo(Bin0) -> { #pk_PvPCityInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPvPCityInfo(Bin0) ->
	{ V_cityID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_cityTime, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_roleID, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_cityHp, Bin4 } = binary_read_uint( Bin3 ),
	{ V_cityMax, Bin5 } = binary_read_uint( Bin4 ),
	{ V_force, Bin6 } = binary_read_uint( Bin5 ),
	{ V_roleName, Bin7 } = binary_read_string( Bin6 ),
	{ V_petList, Bin8 } = binary_read_array(Bin7, fun(X) -> binary_read_uint16( X ) end),
	{ #pk_PvPCityInfo {
		cityID = V_cityID,
		cityTime = V_cityTime,
		roleID = V_roleID,
		cityHp = V_cityHp,
		cityMax = V_cityMax,
		force = V_force,
		roleName = V_roleName,
		petList = V_petList
		},
	Bin8 }.

%GENERATED from file:pet.h => PveItem
-spec readPveItem(Bin0) -> { #pk_PveItem{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPveItem(Bin0) ->
	{ V_id, Bin1 } = binary_read_int16( Bin0 ),
	{ V_num, Bin2 } = binary_read_int16( Bin1 ),
	{ #pk_PveItem {
		id = V_id,
		num = V_num
		},
	Bin2 }.

%GENERATED from file:pet.h => PveSweep
-spec readPveSweep(Bin0) -> { #pk_PveSweep{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPveSweep(Bin0) ->
	{ V_num, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_coin, Bin2 } = binary_read_int( Bin1 ),
	{ V_exp, Bin3 } = binary_read_int( Bin2 ),
	{ V_itemList, Bin4 } = binary_read_array(Bin3, fun(X) -> readPveItem( X ) end),
	{ #pk_PveSweep {
		num = V_num,
		coin = V_coin,
		exp = V_exp,
		itemList = V_itemList
		},
	Bin4 }.

%GENERATED from file:pet.h => PvpBattleReportInfo
-spec readPvpBattleReportInfo(Bin0) -> { #pk_PvpBattleReportInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPvpBattleReportInfo(Bin0) ->
	{ V_time, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_type, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_cityID, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_roleID, Bin4 } = binary_read_uint64( Bin3 ),
	{ V_roleName, Bin5 } = binary_read_string( Bin4 ),
	{ #pk_PvpBattleReportInfo {
		time = V_time,
		type = V_type,
		cityID = V_cityID,
		roleID = V_roleID,
		roleName = V_roleName
		},
	Bin5 }.

%GENERATED from file:pet.h => TerritoryHistoryCell
-spec readTerritoryHistoryCell(Bin0) -> { #pk_TerritoryHistoryCell{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readTerritoryHistoryCell(Bin0) ->
	{ V_time, Bin1 } = binary_read_uint( Bin0 ),
	{ V_roleName, Bin2 } = binary_read_string( Bin1 ),
	{ V_roleID, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_territoryID, Bin4 } = binary_read_uint( Bin3 ),
	{ V_cfgReward, Bin5 } = binary_read_uint( Bin4 ),
	{ V_count1, Bin6 } = binary_read_uint( Bin5 ),
	{ V_count2, Bin7 } = binary_read_uint( Bin6 ),
	{ #pk_TerritoryHistoryCell {
		time = V_time,
		roleName = V_roleName,
		roleID = V_roleID,
		territoryID = V_territoryID,
		cfgReward = V_cfgReward,
		count1 = V_count1,
		count2 = V_count2
		},
	Bin7 }.

%GENERATED from file:pet.h => TerritoryInfo
-spec readTerritoryInfo(Bin0) -> { #pk_TerritoryInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readTerritoryInfo(Bin0) ->
	{ V_territoryID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_cfgReward, Bin2 } = binary_read_uint( Bin1 ),
	{ V_cfgTime, Bin3 } = binary_read_uint( Bin2 ),
	{ V_cfgLevel, Bin4 } = binary_read_uint( Bin3 ),
	{ V_cfgForce, Bin5 } = binary_read_uint( Bin4 ),
	{ V_timeFresh, Bin6 } = binary_read_uint( Bin5 ),
	{ V_timeEnd, Bin7 } = binary_read_uint( Bin6 ),
	{ V_rewardCount1, Bin8 } = binary_read_uint( Bin7 ),
	{ V_rewardCount2, Bin9 } = binary_read_uint( Bin8 ),
	{ V_timeSafe, Bin10 } = binary_read_uint( Bin9 ),
	{ V_timeSearch, Bin11 } = binary_read_uint( Bin10 ),
	{ #pk_TerritoryInfo {
		territoryID = V_territoryID,
		cfgReward = V_cfgReward,
		cfgTime = V_cfgTime,
		cfgLevel = V_cfgLevel,
		cfgForce = V_cfgForce,
		timeFresh = V_timeFresh,
		timeEnd = V_timeEnd,
		rewardCount1 = V_rewardCount1,
		rewardCount2 = V_rewardCount2,
		timeSafe = V_timeSafe,
		timeSearch = V_timeSearch
		},
	Bin11 }.

%GENERATED from file:player.h => BattleProp
-spec readBattleProp(Bin0) -> { #pk_BattleProp{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readBattleProp(Bin0) ->
	{ V_index, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_value, Bin2 } = binary_read_float( Bin1 ),
	{ #pk_BattleProp {
		index = V_index,
		value = V_value
		},
	Bin2 }.

%GENERATED from file:player.h => BlockStatusChange
-spec readBlockStatusChange(Bin0) -> { #pk_BlockStatusChange{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readBlockStatusChange(Bin0) ->
	{ V_blockName, Bin1 } = binary_read_string( Bin0 ),
	{ V_blockStatus, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_BlockStatusChange {
		blockName = V_blockName,
		blockStatus = V_blockStatus
		},
	Bin2 }.

%GENERATED from file:player.h => BuffBaseInfo
-spec readBuffBaseInfo(Bin0) -> { #pk_BuffBaseInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readBuffBaseInfo(Bin0) ->
	{ V_buffUID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_buffID, Bin2 } = binary_read_uint( Bin1 ),
	{ V_time, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_BuffBaseInfo {
		buffUID = V_buffUID,
		buffID = V_buffID,
		time = V_time
		},
	Bin3 }.

%GENERATED from file:player.h => CoinData
-spec readCoinData(Bin0) -> { #pk_CoinData{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readCoinData(Bin0) ->
	{ V_coinType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_value, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_CoinData {
		coinType = V_coinType,
		value = V_value
		},
	Bin2 }.

%GENERATED from file:player.h => CopyMapDropItem
-spec readCopyMapDropItem(Bin0) -> { #pk_CopyMapDropItem{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readCopyMapDropItem(Bin0) ->
	{ V_itemUID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_itemID, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_number, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_quality, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_isBind, Bin5 } = binary_read_bool( Bin4 ),
	{ #pk_CopyMapDropItem {
		itemUID = V_itemUID,
		itemID = V_itemID,
		number = V_number,
		quality = V_quality,
		isBind = V_isBind
		},
	Bin5 }.

%GENERATED from file:player.h => CopyMapStatHurt
-spec readCopyMapStatHurt(Bin0) -> { #pk_CopyMapStatHurt{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readCopyMapStatHurt(Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_beHurt, Bin2 } = binary_read_uint( Bin1 ),
	{ V_playerHurt, Bin3 } = binary_read_uint( Bin2 ),
	{ V_petHurt, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_CopyMapStatHurt {
		roleID = V_roleID,
		beHurt = V_beHurt,
		playerHurt = V_playerHurt,
		petHurt = V_petHurt
		},
	Bin4 }.

%GENERATED from file:player.h => CopyObj
-spec readCopyObj(Bin0) -> { #pk_CopyObj{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readCopyObj(Bin0) ->
	{ V_targetID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_targetType, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_curNumber, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_allNumber, Bin4 } = binary_read_uint16( Bin3 ),
	{ #pk_CopyObj {
		targetID = V_targetID,
		targetType = V_targetType,
		curNumber = V_curNumber,
		allNumber = V_allNumber
		},
	Bin4 }.

%GENERATED from file:player.h => CrossRoleBase
-spec readCrossRoleBase(Bin0) -> { #pk_CrossRoleBase{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readCrossRoleBase(Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ V_server, Bin3 } = binary_read_string( Bin2 ),
	{ V_level, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_career, Bin5 } = binary_read_uint( Bin4 ),
	{ V_race, Bin6 } = binary_read_uint8( Bin5 ),
	{ V_sex, Bin7 } = binary_read_uint8( Bin6 ),
	{ V_head, Bin8 } = binary_read_int( Bin7 ),
	{ V_face, Bin9 } = binary_read_array(Bin8, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_CrossRoleBase {
		id = V_id,
		name = V_name,
		server = V_server,
		level = V_level,
		career = V_career,
		race = V_race,
		sex = V_sex,
		head = V_head,
		face = V_face
		},
	Bin9 }.

%GENERATED from file:player.h => LookInfoMonster
-spec readLookInfoMonster(Bin0) -> { #pk_LookInfoMonster{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readLookInfoMonster(Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_id, Bin2 } = binary_read_uint( Bin1 ),
	{ V_x, Bin3 } = binary_read_float( Bin2 ),
	{ V_y, Bin4 } = binary_read_float( Bin3 ),
	{ V_rotW, Bin5 } = binary_read_float( Bin4 ),
	{ V_targetX, Bin6 } = binary_read_float( Bin5 ),
	{ V_targetY, Bin7 } = binary_read_float( Bin6 ),
	{ V_move_speed, Bin8 } = binary_read_float( Bin7 ),
	{ V_attack_speed, Bin9 } = binary_read_float( Bin8 ),
	{ V_moveStatus, Bin10 } = binary_read_uint8( Bin9 ),
	{ V_type, Bin11 } = binary_read_uint8( Bin10 ),
	{ V_hp_per, Bin12 } = binary_read_uint8( Bin11 ),
	{ V_camp, Bin13 } = binary_read_int8( Bin12 ),
	{ V_usercode, Bin14 } = binary_read_uint64( Bin13 ),
	{ V_groupID, Bin15 } = binary_read_uint64( Bin14 ),
	{ V_guildID, Bin16 } = binary_read_uint64( Bin15 ),
	{ V_buffs, Bin17 } = binary_read_array(Bin16, fun(X) -> readBuffBaseInfo( X ) end),
	{ V_name, Bin18 } = binary_read_string( Bin17 ),
	{ V_level, Bin19 } = binary_read_uint16( Bin18 ),
	{ #pk_LookInfoMonster {
		code = V_code,
		id = V_id,
		x = V_x,
		y = V_y,
		rotW = V_rotW,
		targetX = V_targetX,
		targetY = V_targetY,
		move_speed = V_move_speed,
		attack_speed = V_attack_speed,
		moveStatus = V_moveStatus,
		type = V_type,
		hp_per = V_hp_per,
		camp = V_camp,
		usercode = V_usercode,
		groupID = V_groupID,
		guildID = V_guildID,
		buffs = V_buffs,
		name = V_name,
		level = V_level
		},
	Bin19 }.

%GENERATED from file:player.h => LookInfoNpc
-spec readLookInfoNpc(Bin0) -> { #pk_LookInfoNpc{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readLookInfoNpc(Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_id, Bin2 } = binary_read_uint( Bin1 ),
	{ V_x, Bin3 } = binary_read_float( Bin2 ),
	{ V_y, Bin4 } = binary_read_float( Bin3 ),
	{ V_rotW, Bin5 } = binary_read_float( Bin4 ),
	{ V_name, Bin6 } = binary_read_string( Bin5 ),
	{ V_actionStatus, Bin7 } = binary_read_uint( Bin6 ),
	{ V_title, Bin8 } = binary_read_string( Bin7 ),
	{ #pk_LookInfoNpc {
		code = V_code,
		id = V_id,
		x = V_x,
		y = V_y,
		rotW = V_rotW,
		name = V_name,
		actionStatus = V_actionStatus,
		title = V_title
		},
	Bin8 }.

%GENERATED from file:player.h => LookInfoPet
-spec readLookInfoPet(Bin0) -> { #pk_LookInfoPet{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readLookInfoPet(Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_id, Bin2 } = binary_read_uint( Bin1 ),
	{ V_name, Bin3 } = binary_read_string( Bin2 ),
	{ V_playerCode, Bin4 } = binary_read_uint64( Bin3 ),
	{ V_x, Bin5 } = binary_read_float( Bin4 ),
	{ V_y, Bin6 } = binary_read_float( Bin5 ),
	{ V_targetX, Bin7 } = binary_read_float( Bin6 ),
	{ V_targetY, Bin8 } = binary_read_float( Bin7 ),
	{ V_move_speed, Bin9 } = binary_read_float( Bin8 ),
	{ V_hp_per, Bin10 } = binary_read_uint8( Bin9 ),
	{ V_status, Bin11 } = binary_read_int8( Bin10 ),
	{ V_camp, Bin12 } = binary_read_int8( Bin11 ),
	{ V_pkMode, Bin13 } = binary_read_uint8( Bin12 ),
	{ V_buffs, Bin14 } = binary_read_array(Bin13, fun(X) -> readBuffBaseInfo( X ) end),
	{ #pk_LookInfoPet {
		code = V_code,
		id = V_id,
		name = V_name,
		playerCode = V_playerCode,
		x = V_x,
		y = V_y,
		targetX = V_targetX,
		targetY = V_targetY,
		move_speed = V_move_speed,
		hp_per = V_hp_per,
		status = V_status,
		camp = V_camp,
		pkMode = V_pkMode,
		buffs = V_buffs
		},
	Bin14 }.

%GENERATED from file:player.h => MissionObjectInfo
-spec readMissionObjectInfo(Bin0) -> { #pk_MissionObjectInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readMissionObjectInfo(Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_id, Bin2 } = binary_read_uint( Bin1 ),
	{ V_x, Bin3 } = binary_read_float( Bin2 ),
	{ V_y, Bin4 } = binary_read_float( Bin3 ),
	{ V_rotW, Bin5 } = binary_read_float( Bin4 ),
	{ #pk_MissionObjectInfo {
		code = V_code,
		id = V_id,
		x = V_x,
		y = V_y,
		rotW = V_rotW
		},
	Bin5 }.

%GENERATED from file:player.h => MoneyChanges
-spec readMoneyChanges(Bin0) -> { #pk_MoneyChanges{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readMoneyChanges(Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_moneys, Bin2 } = binary_read_array(Bin1, fun(X) -> readMoneyInit( X ) end),
	{ #pk_MoneyChanges {
		code = V_code,
		moneys = V_moneys
		},
	Bin2 }.

%GENERATED from file:player.h => MoneyInit
-spec readMoneyInit(Bin0) -> { #pk_MoneyInit{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readMoneyInit(Bin0) ->
	{ V_moneyType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_value, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_MoneyInit {
		moneyType = V_moneyType,
		value = V_value
		},
	Bin2 }.

%GENERATED from file:player.h => MonsterBook
-spec readMonsterBook(Bin0) -> { #pk_MonsterBook{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readMonsterBook(Bin0) ->
	{ V_id, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_kill, Bin2 } = binary_read_uint( Bin1 ),
	{ V_isSnap, Bin3 } = binary_read_bool( Bin2 ),
	{ V_isUnlock, Bin4 } = binary_read_bool( Bin3 ),
	{ V_isReward, Bin5 } = binary_read_bool( Bin4 ),
	{ #pk_MonsterBook {
		id = V_id,
		kill = V_kill,
		isSnap = V_isSnap,
		isUnlock = V_isUnlock,
		isReward = V_isReward
		},
	Bin5 }.

%GENERATED from file:player.h => NoticeInfo
-spec readNoticeInfo(Bin0) -> { #pk_NoticeInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readNoticeInfo(Bin0) ->
	{ V_id, Bin1 } = binary_read_int64( Bin0 ),
	{ V_type, Bin2 } = binary_read_int8( Bin1 ),
	{ V_pos, Bin3 } = binary_read_int8( Bin2 ),
	{ V_content, Bin4 } = binary_read_string( Bin3 ),
	{ V_color, Bin5 } = binary_read_int( Bin4 ),
	{ V_afterSecondStart, Bin6 } = binary_read_int64( Bin5 ),
	{ V_duration, Bin7 } = binary_read_int64( Bin6 ),
	{ V_interval, Bin8 } = binary_read_int( Bin7 ),
	{ #pk_NoticeInfo {
		id = V_id,
		type = V_type,
		pos = V_pos,
		content = V_content,
		color = V_color,
		afterSecondStart = V_afterSecondStart,
		duration = V_duration,
		interval = V_interval
		},
	Bin8 }.

%GENERATED from file:player.h => ObjBrief
-spec readObjBrief(Bin0) -> { #pk_ObjBrief{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readObjBrief(Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ V_x, Bin3 } = binary_read_float( Bin2 ),
	{ V_y, Bin4 } = binary_read_float( Bin3 ),
	{ #pk_ObjBrief {
		code = V_code,
		name = V_name,
		x = V_x,
		y = V_y
		},
	Bin4 }.

%GENERATED from file:player.h => PlayerDailyCount
-spec readPlayerDailyCount(Bin0) -> { #pk_PlayerDailyCount{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPlayerDailyCount(Bin0) ->
	{ V_dailyType, Bin1 } = binary_read_uint( Bin0 ),
	{ V_dailyID, Bin2 } = binary_read_uint( Bin1 ),
	{ V_dailyValue, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_PlayerDailyCount {
		dailyType = V_dailyType,
		dailyID = V_dailyID,
		dailyValue = V_dailyValue
		},
	Bin3 }.

%GENERATED from file:player.h => PosInfo
-spec readPosInfo(Bin0) -> { #pk_PosInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPosInfo(Bin0) ->
	{ V_x, Bin1 } = binary_read_float( Bin0 ),
	{ V_y, Bin2 } = binary_read_float( Bin1 ),
	{ #pk_PosInfo {
		x = V_x,
		y = V_y
		},
	Bin2 }.

%GENERATED from file:player.h => PropFloat
-spec readPropFloat(Bin0) -> { #pk_PropFloat{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPropFloat(Bin0) ->
	{ V_index, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_value, Bin2 } = binary_read_float( Bin1 ),
	{ #pk_PropFloat {
		index = V_index,
		value = V_value
		},
	Bin2 }.

%GENERATED from file:player.h => PropInt
-spec readPropInt(Bin0) -> { #pk_PropInt{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPropInt(Bin0) ->
	{ V_index, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_value, Bin2 } = binary_read_int( Bin1 ),
	{ #pk_PropInt {
		index = V_index,
		value = V_value
		},
	Bin2 }.

%GENERATED from file:player.h => PropInt64
-spec readPropInt64(Bin0) -> { #pk_PropInt64{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPropInt64(Bin0) ->
	{ V_index, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_value, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_PropInt64 {
		index = V_index,
		value = V_value
		},
	Bin2 }.

%GENERATED from file:player.h => PropString
-spec readPropString(Bin0) -> { #pk_PropString{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPropString(Bin0) ->
	{ V_index, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_value, Bin2 } = binary_read_string( Bin1 ),
	{ #pk_PropString {
		index = V_index,
		value = V_value
		},
	Bin2 }.

%GENERATED from file:player.h => RaceTeamBase
-spec readRaceTeamBase(Bin0) -> { #pk_RaceTeamBase{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRaceTeamBase(Bin0) ->
	{ V_applyID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_leaderID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_members, Bin3 } = binary_read_array(Bin2, fun(X) -> readCrossRoleBase( X ) end),
	{ V_petID, Bin4 } = binary_read_uint16( Bin3 ),
	{ #pk_RaceTeamBase {
		applyID = V_applyID,
		leaderID = V_leaderID,
		members = V_members,
		petID = V_petID
		},
	Bin4 }.

%GENERATED from file:player.h => RaceTeamEx
-spec readRaceTeamEx(Bin0) -> { #pk_RaceTeamEx{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRaceTeamEx(Bin0) ->
	{ V_applyID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_base, Bin2 } = readRaceTeamBase( Bin1 ),
	{ V_item, Bin3 } = readRaceTeamItem( Bin2 ),
	{ V_sort, Bin4 } = readRaceTeamSort( Bin3 ),
	{ V_giveUpID, Bin5 } = binary_read_uint64( Bin4 ),
	{ #pk_RaceTeamEx {
		applyID = V_applyID,
		base = V_base,
		item = V_item,
		sort = V_sort,
		giveUpID = V_giveUpID
		},
	Bin5 }.

%GENERATED from file:player.h => RaceTeamItem
-spec readRaceTeamItem(Bin0) -> { #pk_RaceTeamItem{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRaceTeamItem(Bin0) ->
	{ V_listItemIDA, Bin1 } = binary_read_array(Bin0, fun(X) -> binary_read_uint8( X ) end),
	{ V_listItemIDB, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_uint8( X ) end),
	{ #pk_RaceTeamItem {
		listItemIDA = V_listItemIDA,
		listItemIDB = V_listItemIDB
		},
	Bin2 }.

%GENERATED from file:player.h => RaceTeamSort
-spec readRaceTeamSort(Bin0) -> { #pk_RaceTeamSort{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRaceTeamSort(Bin0) ->
	{ V_laps, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_milestone, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_time, Bin3 } = binary_read_uint64( Bin2 ),
	{ #pk_RaceTeamSort {
		laps = V_laps,
		milestone = V_milestone,
		time = V_time
		},
	Bin3 }.

%GENERATED from file:player.h => RechargeDoubleConf
-spec readRechargeDoubleConf(Bin0) -> { #pk_RechargeDoubleConf{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRechargeDoubleConf(Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_payMoney, Bin2 } = binary_read_float( Bin1 ),
	{ #pk_RechargeDoubleConf {
		id = V_id,
		payMoney = V_payMoney
		},
	Bin2 }.

%GENERATED from file:player.h => RewardUpdateResource
-spec readRewardUpdateResource(Bin0) -> { #pk_RewardUpdateResource{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRewardUpdateResource(Bin0) ->
	{ V_count, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_flag, Bin2 } = binary_read_bool( Bin1 ),
	{ V_rewardList, Bin3 } = binary_read_array(Bin2, fun(X) -> readUpdateReward( X ) end),
	{ #pk_RewardUpdateResource {
		count = V_count,
		flag = V_flag,
		rewardList = V_rewardList
		},
	Bin3 }.

%GENERATED from file:player.h => RoleBaseInfo
-spec readRoleBaseInfo(Bin0) -> { #pk_RoleBaseInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRoleBaseInfo(Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_roleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_name, Bin3 } = binary_read_string( Bin2 ),
	{ V_servername, Bin4 } = binary_read_string( Bin3 ),
	{ V_myServerName, Bin5 } = binary_read_string( Bin4 ),
	{ V_isInCross, Bin6 } = binary_read_bool( Bin5 ),
	{ V_x, Bin7 } = binary_read_float( Bin6 ),
	{ V_y, Bin8 } = binary_read_float( Bin7 ),
	{ V_head, Bin9 } = binary_read_uint( Bin8 ),
	{ V_level, Bin10 } = binary_read_int16( Bin9 ),
	{ V_camp, Bin11 } = binary_read_int8( Bin10 ),
	{ V_career, Bin12 } = binary_read_uint( Bin11 ),
	{ V_race, Bin13 } = binary_read_int8( Bin12 ),
	{ V_sex, Bin14 } = binary_read_int8( Bin13 ),
	{ V_vip, Bin15 } = binary_read_int8( Bin14 ),
	{ V_hp_per, Bin16 } = binary_read_uint8( Bin15 ),
	{ V_exp, Bin17 } = binary_read_uint( Bin16 ),
	{ V_maxExp, Bin18 } = binary_read_uint( Bin17 ),
	{ V_cur_hp, Bin19 } = binary_read_uint( Bin18 ),
	{ V_max_hp, Bin20 } = binary_read_uint( Bin19 ),
	{ V_mp, Bin21 } = binary_read_uint( Bin20 ),
	{ V_mountID, Bin22 } = binary_read_uint16( Bin21 ),
	{ V_otherCode, Bin23 } = binary_read_uint64( Bin22 ),
	{ V_pkMode, Bin24 } = binary_read_uint8( Bin23 ),
	{ V_maxCourage, Bin25 } = binary_read_uint16( Bin24 ),
	{ V_moneys, Bin26 } = binary_read_array(Bin25, fun(X) -> readMoneyInit( X ) end),
	{ V_visible_equips, Bin27 } = binary_read_array(Bin26, fun(X) -> readvisibleEquip( X ) end),
	{ V_refine_levels, Bin28 } = binary_read_array(Bin27, fun(X) -> readrefineLevel( X ) end),
	{ #pk_RoleBaseInfo {
		code = V_code,
		roleID = V_roleID,
		name = V_name,
		servername = V_servername,
		myServerName = V_myServerName,
		isInCross = V_isInCross,
		x = V_x,
		y = V_y,
		head = V_head,
		level = V_level,
		camp = V_camp,
		career = V_career,
		race = V_race,
		sex = V_sex,
		vip = V_vip,
		hp_per = V_hp_per,
		exp = V_exp,
		maxExp = V_maxExp,
		cur_hp = V_cur_hp,
		max_hp = V_max_hp,
		mp = V_mp,
		mountID = V_mountID,
		otherCode = V_otherCode,
		pkMode = V_pkMode,
		maxCourage = V_maxCourage,
		moneys = V_moneys,
		visible_equips = V_visible_equips,
		refine_levels = V_refine_levels
		},
	Bin28 }.

%GENERATED from file:player.h => SevenDayAimUpdate
-spec readSevenDayAimUpdate(Bin0) -> { #pk_SevenDayAimUpdate{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readSevenDayAimUpdate(Bin0) ->
	{ V_type, Bin1 } = binary_read_int( Bin0 ),
	{ V_args, Bin2 } = binary_read_array(Bin1, fun(X) -> binary_read_int64( X ) end),
	{ #pk_SevenDayAimUpdate {
		type = V_type,
		args = V_args
		},
	Bin2 }.

%GENERATED from file:player.h => TaskUseItem
-spec readTaskUseItem(Bin0) -> { #pk_TaskUseItem{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readTaskUseItem(Bin0) ->
	{ V_code, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_id, Bin2 } = binary_read_uint( Bin1 ),
	{ V_x, Bin3 } = binary_read_float( Bin2 ),
	{ V_y, Bin4 } = binary_read_float( Bin3 ),
	{ V_rotW, Bin5 } = binary_read_float( Bin4 ),
	{ #pk_TaskUseItem {
		code = V_code,
		id = V_id,
		x = V_x,
		y = V_y,
		rotW = V_rotW
		},
	Bin5 }.

%GENERATED from file:player.h => UpdateReward
-spec readUpdateReward(Bin0) -> { #pk_UpdateReward{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readUpdateReward(Bin0) ->
	{ V_itemid, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_number, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_UpdateReward {
		itemid = V_itemid,
		number = V_number
		},
	Bin2 }.

%GENERATED from file:player.h => UserPlayerData
-spec readUserPlayerData(Bin0) -> { #pk_UserPlayerData{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readUserPlayerData(Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ V_level, Bin3 } = binary_read_int( Bin2 ),
	{ V_wingLevel, Bin4 } = binary_read_int( Bin3 ),
	{ V_camp, Bin5 } = binary_read_int8( Bin4 ),
	{ V_race, Bin6 } = binary_read_int8( Bin5 ),
	{ V_career, Bin7 } = binary_read_uint( Bin6 ),
	{ V_sex, Bin8 } = binary_read_int8( Bin7 ),
	{ V_head, Bin9 } = binary_read_int( Bin8 ),
	{ V_mapID, Bin10 } = binary_read_uint16( Bin9 ),
	{ V_oldMapID, Bin11 } = binary_read_uint16( Bin10 ),
	{ V_canRename, Bin12 } = binary_read_bool( Bin11 ),
	{ V_visible_equips, Bin13 } = binary_read_array(Bin12, fun(X) -> readvisibleEquip( X ) end),
	{ V_fashionList, Bin14 } = binary_read_array(Bin13, fun(X) -> binary_read_uint16( X ) end),
	{ V_refine_levels, Bin15 } = binary_read_array(Bin14, fun(X) -> readrefineLevel( X ) end),
	{ #pk_UserPlayerData {
		roleID = V_roleID,
		name = V_name,
		level = V_level,
		wingLevel = V_wingLevel,
		camp = V_camp,
		race = V_race,
		career = V_career,
		sex = V_sex,
		head = V_head,
		mapID = V_mapID,
		oldMapID = V_oldMapID,
		canRename = V_canRename,
		visible_equips = V_visible_equips,
		fashionList = V_fashionList,
		refine_levels = V_refine_levels
		},
	Bin15 }.

%GENERATED from file:player.h => lotteryForToweItem
-spec readlotteryForToweItem(Bin0) -> { #pk_lotteryForToweItem{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readlotteryForToweItem(Bin0) ->
	{ V_pool_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_cfg_id, Bin2 } = binary_read_uint( Bin1 ),
	{ V_itemID, Bin3 } = binary_read_uint( Bin2 ),
	{ V_itemNumber, Bin4 } = binary_read_uint( Bin3 ),
	{ V_isBind, Bin5 } = binary_read_uint( Bin4 ),
	{ V_isWin, Bin6 } = binary_read_int16( Bin5 ),
	{ #pk_lotteryForToweItem {
		pool_id = V_pool_id,
		cfg_id = V_cfg_id,
		itemID = V_itemID,
		itemNumber = V_itemNumber,
		isBind = V_isBind,
		isWin = V_isWin
		},
	Bin6 }.

%GENERATED from file:player.h => lotteryForTowerNotice
-spec readlotteryForTowerNotice(Bin0) -> { #pk_lotteryForTowerNotice{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readlotteryForTowerNotice(Bin0) ->
	{ V_roleName, Bin1 } = binary_read_string( Bin0 ),
	{ V_itemID, Bin2 } = binary_read_uint( Bin1 ),
	{ V_itemNumber, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_lotteryForTowerNotice {
		roleName = V_roleName,
		itemID = V_itemID,
		itemNumber = V_itemNumber
		},
	Bin3 }.

%GENERATED from file:player.h => lottery_award_item_info
-spec readlottery_award_item_info(Bin0) -> { #pk_lottery_award_item_info{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readlottery_award_item_info(Bin0) ->
	{ V_itemID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_itemNumber, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_lottery_award_item_info {
		itemID = V_itemID,
		itemNumber = V_itemNumber
		},
	Bin2 }.

%GENERATED from file:player.h => lsbattlefield_award
-spec readlsbattlefield_award(Bin0) -> { #pk_lsbattlefield_award{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readlsbattlefield_award(Bin0) ->
	{ V_itemid, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_number, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_isBind, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_lsbattlefield_award {
		itemid = V_itemid,
		number = V_number,
		isBind = V_isBind
		},
	Bin3 }.

%GENERATED from file:player.h => lsbattlefield_rank
-spec readlsbattlefield_rank(Bin0) -> { #pk_lsbattlefield_rank{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readlsbattlefield_rank(Bin0) ->
	{ V_index, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_score, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_roleName, Bin3 } = binary_read_string( Bin2 ),
	{ #pk_lsbattlefield_rank {
		index = V_index,
		score = V_score,
		roleName = V_roleName
		},
	Bin3 }.

%GENERATED from file:player.h => pushItem
-spec readpushItem(Bin0) -> { #pk_pushItem{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readpushItem(Bin0) ->
	{ V_sku, Bin1 } = binary_read_uint( Bin0 ),
	{ V_itemID, Bin2 } = binary_read_uint( Bin1 ),
	{ V_num, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_isBinded, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_price, Bin5 } = binary_read_uint( Bin4 ),
	{ V_rebate, Bin6 } = binary_read_uint8( Bin5 ),
	{ V_coinType, Bin7 } = binary_read_uint8( Bin6 ),
	{ V_limited, Bin8 } = binary_read_uint8( Bin7 ),
	{ #pk_pushItem {
		sku = V_sku,
		itemID = V_itemID,
		num = V_num,
		isBinded = V_isBinded,
		price = V_price,
		rebate = V_rebate,
		coinType = V_coinType,
		limited = V_limited
		},
	Bin8 }.

%GENERATED from file:player.h => refineLevel
-spec readrefineLevel(Bin0) -> { #pk_refineLevel{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readrefineLevel(Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_level, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_refineLevel {
		type = V_type,
		level = V_level
		},
	Bin2 }.

%GENERATED from file:player.h => visibleEquip
-spec readvisibleEquip(Bin0) -> { #pk_visibleEquip{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readvisibleEquip(Bin0) ->
	{ V_equipID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_quality, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_visibleEquip {
		equipID = V_equipID,
		quality = V_quality
		},
	Bin2 }.

%GENERATED from file:rank.h => ActivityMapRankData
-spec readActivityMapRankData(Bin0) -> { #pk_ActivityMapRankData{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readActivityMapRankData(Bin0) ->
	{ V_name, Bin1 } = binary_read_string( Bin0 ),
	{ V_value, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_ActivityMapRankData {
		name = V_name,
		value = V_value
		},
	Bin2 }.

%GENERATED from file:rank.h => PlayerEquip
-spec readPlayerEquip(Bin0) -> { #pk_PlayerEquip{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPlayerEquip(Bin0) ->
	{ V_equipID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_quality, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_PlayerEquip {
		equipID = V_equipID,
		quality = V_quality
		},
	Bin2 }.

%GENERATED from file:rank.h => PlayerEquipLevel
-spec readPlayerEquipLevel(Bin0) -> { #pk_PlayerEquipLevel{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readPlayerEquipLevel(Bin0) ->
	{ V_type, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_level, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_PlayerEquipLevel {
		type = V_type,
		level = V_level
		},
	Bin2 }.

%GENERATED from file:rank.h => RankInfo
-spec readRankInfo(Bin0) -> { #pk_RankInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRankInfo(Bin0) ->
	{ V_rankSort, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_rankSortC, Bin2 } = binary_read_int8( Bin1 ),
	{ V_roleID, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_name, Bin4 } = binary_read_string( Bin3 ),
	{ V_wingLevel, Bin5 } = binary_read_int( Bin4 ),
	{ V_rankValue1, Bin6 } = binary_read_int64( Bin5 ),
	{ V_rankValue2, Bin7 } = binary_read_int64( Bin6 ),
	{ V_rankValue3, Bin8 } = binary_read_int64( Bin7 ),
	{ V_title, Bin9 } = readTitleData( Bin8 ),
	{ V_career, Bin10 } = binary_read_uint( Bin9 ),
	{ V_race, Bin11 } = binary_read_int8( Bin10 ),
	{ V_sex, Bin12 } = binary_read_int8( Bin11 ),
	{ V_head, Bin13 } = binary_read_int( Bin12 ),
	{ V_level, Bin14 } = binary_read_int( Bin13 ),
	{ #pk_RankInfo {
		rankSort = V_rankSort,
		rankSortC = V_rankSortC,
		roleID = V_roleID,
		name = V_name,
		wingLevel = V_wingLevel,
		rankValue1 = V_rankValue1,
		rankValue2 = V_rankValue2,
		rankValue3 = V_rankValue3,
		title = V_title,
		career = V_career,
		race = V_race,
		sex = V_sex,
		head = V_head,
		level = V_level
		},
	Bin14 }.

%GENERATED from file:rank.h => TitleData
-spec readTitleData(Bin0) -> { #pk_TitleData{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readTitleData(Bin0) ->
	{ V_title1, Bin1 } = binary_read_uint( Bin0 ),
	{ V_title2, Bin2 } = binary_read_uint( Bin1 ),
	{ V_title3, Bin3 } = binary_read_uint( Bin2 ),
	{ V_color, Bin4 } = binary_read_uint( Bin3 ),
	{ V_background, Bin5 } = binary_read_uint( Bin4 ),
	{ #pk_TitleData {
		title1 = V_title1,
		title2 = V_title2,
		title3 = V_title3,
		color = V_color,
		background = V_background
		},
	Bin5 }.

%GENERATED from file:redenvelope.h => redEnvelopeBaseInfo
-spec readredEnvelopeBaseInfo(Bin0) -> { #pk_redEnvelopeBaseInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readredEnvelopeBaseInfo(Bin0) ->
	{ V_redUID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_creatorRoleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_targetUID, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_luckContent, Bin4 } = binary_read_string( Bin3 ),
	{ V_creatorName, Bin5 } = binary_read_string( Bin4 ),
	{ V_creatorLevel, Bin6 } = binary_read_uint( Bin5 ),
	{ V_type, Bin7 } = binary_read_uint8( Bin6 ),
	{ V_targetType, Bin8 } = binary_read_uint8( Bin7 ),
	{ V_creatorCareer, Bin9 } = binary_read_uint( Bin8 ),
	{ V_creatorRace, Bin10 } = binary_read_uint8( Bin9 ),
	{ V_creatorSex, Bin11 } = binary_read_uint8( Bin10 ),
	{ V_creatorHead, Bin12 } = binary_read_int( Bin11 ),
	{ V_allMoney, Bin13 } = binary_read_uint( Bin12 ),
	{ V_allNumber, Bin14 } = binary_read_uint( Bin13 ),
	{ V_takenMoney, Bin15 } = binary_read_uint( Bin14 ),
	{ V_takenNumber, Bin16 } = binary_read_uint( Bin15 ),
	{ #pk_redEnvelopeBaseInfo {
		redUID = V_redUID,
		creatorRoleID = V_creatorRoleID,
		targetUID = V_targetUID,
		luckContent = V_luckContent,
		creatorName = V_creatorName,
		creatorLevel = V_creatorLevel,
		type = V_type,
		targetType = V_targetType,
		creatorCareer = V_creatorCareer,
		creatorRace = V_creatorRace,
		creatorSex = V_creatorSex,
		creatorHead = V_creatorHead,
		allMoney = V_allMoney,
		allNumber = V_allNumber,
		takenMoney = V_takenMoney,
		takenNumber = V_takenNumber
		},
	Bin16 }.

%GENERATED from file:redenvelope.h => redEnvelopeHistory
-spec readredEnvelopeHistory(Bin0) -> { #pk_redEnvelopeHistory{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readredEnvelopeHistory(Bin0) ->
	{ V_redUID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_creatorRoleID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_creatorName, Bin3 } = binary_read_string( Bin2 ),
	{ V_createTime, Bin4 } = binary_read_uint( Bin3 ),
	{ V_targetType, Bin5 } = binary_read_uint8( Bin4 ),
	{ V_moneyNumber, Bin6 } = binary_read_int( Bin5 ),
	{ #pk_redEnvelopeHistory {
		redUID = V_redUID,
		creatorRoleID = V_creatorRoleID,
		creatorName = V_creatorName,
		createTime = V_createTime,
		targetType = V_targetType,
		moneyNumber = V_moneyNumber
		},
	Bin6 }.

%GENERATED from file:redenvelope.h => redEnvelopeInfo
-spec readredEnvelopeInfo(Bin0) -> { #pk_redEnvelopeInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readredEnvelopeInfo(Bin0) ->
	{ V_baseInfo, Bin1 } = readredEnvelopeBaseInfo( Bin0 ),
	{ V_takenList, Bin2 } = binary_read_array(Bin1, fun(X) -> readtakeHistory( X ) end),
	{ #pk_redEnvelopeInfo {
		baseInfo = V_baseInfo,
		takenList = V_takenList
		},
	Bin2 }.

%GENERATED from file:redenvelope.h => takeHistory
-spec readtakeHistory(Bin0) -> { #pk_takeHistory{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readtakeHistory(Bin0) ->
	{ V_takeRoleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_takeName, Bin2 } = binary_read_string( Bin1 ),
	{ V_takeTime, Bin3 } = binary_read_uint( Bin2 ),
	{ V_takeMoney, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_takeHistory {
		takeRoleID = V_takeRoleID,
		takeName = V_takeName,
		takeTime = V_takeTime,
		takeMoney = V_takeMoney
		},
	Bin4 }.

%GENERATED from file:rune.h => RuneBaseProp
-spec readRuneBaseProp(Bin0) -> { #pk_RuneBaseProp{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRuneBaseProp(Bin0) ->
	{ V_prop, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_calcType, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_value, Bin3 } = binary_read_float( Bin2 ),
	{ #pk_RuneBaseProp {
		prop = V_prop,
		calcType = V_calcType,
		value = V_value
		},
	Bin3 }.

%GENERATED from file:rune.h => RuneInfo
-spec readRuneInfo(Bin0) -> { #pk_RuneInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRuneInfo(Bin0) ->
	{ V_runeUID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_pos, Bin2 } = binary_read_uint( Bin1 ),
	{ V_runeID, Bin3 } = binary_read_uint( Bin2 ),
	{ V_level, Bin4 } = binary_read_uint8( Bin3 ),
	{ V_exp, Bin5 } = binary_read_uint( Bin4 ),
	{ V_isBind, Bin6 } = binary_read_bool( Bin5 ),
	{ V_validSecond, Bin7 } = binary_read_uint( Bin6 ),
	{ V_baseProps, Bin8 } = binary_read_array(Bin7, fun(X) -> readRuneBaseProp( X ) end),
	{ V_randProps, Bin9 } = binary_read_array(Bin8, fun(X) -> readRuneRandProp( X ) end),
	{ #pk_RuneInfo {
		runeUID = V_runeUID,
		pos = V_pos,
		runeID = V_runeID,
		level = V_level,
		exp = V_exp,
		isBind = V_isBind,
		validSecond = V_validSecond,
		baseProps = V_baseProps,
		randProps = V_randProps
		},
	Bin9 }.

%GENERATED from file:rune.h => RuneRandProp
-spec readRuneRandProp(Bin0) -> { #pk_RuneRandProp{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRuneRandProp(Bin0) ->
	{ V_prop, Bin1 } = readRuneBaseProp( Bin0 ),
	{ V_indexNumber, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_RuneRandProp {
		prop = V_prop,
		indexNumber = V_indexNumber
		},
	Bin2 }.

%GENERATED from file:rune.h => RuneSuitProp
-spec readRuneSuitProp(Bin0) -> { #pk_RuneSuitProp{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readRuneSuitProp(Bin0) ->
	{ V_props, Bin1 } = binary_read_array(Bin0, fun(X) -> readRuneBaseProp( X ) end),
	{ V_suitID, Bin2 } = binary_read_uint( Bin1 ),
	{ V_suitNum, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_ownerID, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_RuneSuitProp {
		props = V_props,
		suitID = V_suitID,
		suitNum = V_suitNum,
		ownerID = V_ownerID
		},
	Bin4 }.

%GENERATED from file:setting.h => SwitchVariantInfo
-spec readSwitchVariantInfo(Bin0) -> { #pk_SwitchVariantInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readSwitchVariantInfo(Bin0) ->
	{ V_bitIndex, Bin1 } = binary_read_uint( Bin0 ),
	{ V_bitValue, Bin2 } = binary_read_bool( Bin1 ),
	{ #pk_SwitchVariantInfo {
		bitIndex = V_bitIndex,
		bitValue = V_bitValue
		},
	Bin2 }.

%GENERATED from file:setting.h => VariantInfo
-spec readVariantInfo(Bin0) -> { #pk_VariantInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readVariantInfo(Bin0) ->
	{ V_index, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_value, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_VariantInfo {
		index = V_index,
		value = V_value
		},
	Bin2 }.

%GENERATED from file:signin.h => SignInInfo
-spec readSignInInfo(Bin0) -> { #pk_SignInInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readSignInInfo(Bin0) ->
	{ V_signType, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_itemList, Bin2 } = binary_read_array(Bin1, fun(X) -> readSignItem( X ) end),
	{ V_signState, Bin3 } = binary_read_uint8( Bin2 ),
	{ #pk_SignInInfo {
		signType = V_signType,
		itemList = V_itemList,
		signState = V_signState
		},
	Bin3 }.

%GENERATED from file:signin.h => SignItem
-spec readSignItem(Bin0) -> { #pk_SignItem{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readSignItem(Bin0) ->
	{ V_itemID, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_itemNumber, Bin2 } = binary_read_uint16( Bin1 ),
	{ #pk_SignItem {
		itemID = V_itemID,
		itemNumber = V_itemNumber
		},
	Bin2 }.

%GENERATED from file:skill.h => OpenSlot
-spec readOpenSlot(Bin0) -> { #pk_OpenSlot{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readOpenSlot(Bin0) ->
	{ V_slot, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_type, Bin2 } = binary_read_uint8( Bin1 ),
	{ #pk_OpenSlot {
		slot = V_slot,
		type = V_type
		},
	Bin2 }.

%GENERATED from file:skill.h => SkillInfo
-spec readSkillInfo(Bin0) -> { #pk_SkillInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readSkillInfo(Bin0) ->
	{ V_id, Bin1 } = binary_read_uint( Bin0 ),
	{ V_level, Bin2 } = binary_read_uint( Bin1 ),
	{ V_remainCD, Bin3 } = binary_read_uint( Bin2 ),
	{ #pk_SkillInfo {
		id = V_id,
		level = V_level,
		remainCD = V_remainCD
		},
	Bin3 }.

%GENERATED from file:skill.h => SkillSlotInfo
-spec readSkillSlotInfo(Bin0) -> { #pk_SkillSlotInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readSkillSlotInfo(Bin0) ->
	{ V_index, Bin1 } = binary_read_uint( Bin0 ),
	{ V_skillID, Bin2 } = binary_read_uint( Bin1 ),
	{ #pk_SkillSlotInfo {
		index = V_index,
		skillID = V_skillID
		},
	Bin2 }.

%GENERATED from file:talent.h => TalentInfo
-spec readTalentInfo(Bin0) -> { #pk_TalentInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readTalentInfo(Bin0) ->
	{ V_id, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_level, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_nextlevelexp, Bin3 } = binary_read_uint64( Bin2 ),
	{ #pk_TalentInfo {
		id = V_id,
		level = V_level,
		nextlevelexp = V_nextlevelexp
		},
	Bin3 }.

%GENERATED from file:task.h => SubmittedTaskInfo
-spec readSubmittedTaskInfo(Bin0) -> { #pk_SubmittedTaskInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readSubmittedTaskInfo(Bin0) ->
	{ V_slot, Bin1 } = binary_read_uint16( Bin0 ),
	{ V_value, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_SubmittedTaskInfo {
		slot = V_slot,
		value = V_value
		},
	Bin2 }.

%GENERATED from file:task.h => acceptedAimTask
-spec readacceptedAimTask(Bin0) -> { #pk_acceptedAimTask{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readacceptedAimTask(Bin0) ->
	{ V_aimType, Bin1 } = binary_read_int( Bin0 ),
	{ V_aimIndex, Bin2 } = binary_read_int( Bin1 ),
	{ V_aimCurCount, Bin3 } = binary_read_int( Bin2 ),
	{ #pk_acceptedAimTask {
		aimType = V_aimType,
		aimIndex = V_aimIndex,
		aimCurCount = V_aimCurCount
		},
	Bin3 }.

%GENERATED from file:task.h => acceptedBaseTask
-spec readacceptedBaseTask(Bin0) -> { #pk_acceptedBaseTask{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readacceptedBaseTask(Bin0) ->
	{ V_taskID, Bin1 } = binary_read_int( Bin0 ),
	{ V_taskProcess, Bin2 } = binary_read_array(Bin1, fun(X) -> readacceptedAimTask( X ) end),
	{ #pk_acceptedBaseTask {
		taskID = V_taskID,
		taskProcess = V_taskProcess
		},
	Bin2 }.

%GENERATED from file:task.h => taskInfo
-spec readtaskInfo(Bin0) -> { #pk_taskInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readtaskInfo(Bin0) ->
	{ V_taskID, Bin1 } = binary_read_int( Bin0 ),
	{ V_target, Bin2 } = binary_read_int( Bin1 ),
	{ V_curNumber, Bin3 } = binary_read_int( Bin2 ),
	{ V_maxNumber, Bin4 } = binary_read_int( Bin3 ),
	{ #pk_taskInfo {
		taskID = V_taskID,
		target = V_target,
		curNumber = V_curNumber,
		maxNumber = V_maxNumber
		},
	Bin4 }.

%GENERATED from file:team.h => FightingCapacityInfo
-spec readFightingCapacityInfo(Bin0) -> { #pk_FightingCapacityInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readFightingCapacityInfo(Bin0) ->
	{ V_roleID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_fightingCapacity, Bin2 } = binary_read_uint64( Bin1 ),
	{ #pk_FightingCapacityInfo {
		roleID = V_roleID,
		fightingCapacity = V_fightingCapacity
		},
	Bin2 }.

%GENERATED from file:team.h => NearTeamInfo
-spec readNearTeamInfo(Bin0) -> { #pk_NearTeamInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readNearTeamInfo(Bin0) ->
	{ V_teamID, Bin1 } = binary_read_int64( Bin0 ),
	{ V_leaderID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_leaderName, Bin3 } = binary_read_string( Bin2 ),
	{ V_leaderLevel, Bin4 } = binary_read_int16( Bin3 ),
	{ V_numberOfTeam, Bin5 } = binary_read_uint8( Bin4 ),
	{ V_career, Bin6 } = binary_read_uint( Bin5 ),
	{ V_race, Bin7 } = binary_read_uint8( Bin6 ),
	{ V_sex, Bin8 } = binary_read_uint8( Bin7 ),
	{ V_head, Bin9 } = binary_read_int( Bin8 ),
	{ #pk_NearTeamInfo {
		teamID = V_teamID,
		leaderID = V_leaderID,
		leaderName = V_leaderName,
		leaderLevel = V_leaderLevel,
		numberOfTeam = V_numberOfTeam,
		career = V_career,
		race = V_race,
		sex = V_sex,
		head = V_head
		},
	Bin9 }.

%GENERATED from file:team.h => NotTeamMemberInfo
-spec readNotTeamMemberInfo(Bin0) -> { #pk_NotTeamMemberInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readNotTeamMemberInfo(Bin0) ->
	{ V_id, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_name, Bin2 } = binary_read_string( Bin1 ),
	{ V_level, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_career, Bin4 } = binary_read_uint( Bin3 ),
	{ V_race, Bin5 } = binary_read_uint8( Bin4 ),
	{ V_sex, Bin6 } = binary_read_uint8( Bin5 ),
	{ V_head, Bin7 } = binary_read_int( Bin6 ),
	{ #pk_NotTeamMemberInfo {
		id = V_id,
		name = V_name,
		level = V_level,
		career = V_career,
		race = V_race,
		sex = V_sex,
		head = V_head
		},
	Bin7 }.

%GENERATED from file:team.h => OnlineMemberSnapshot
-spec readOnlineMemberSnapshot(Bin0) -> { #pk_OnlineMemberSnapshot{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readOnlineMemberSnapshot(Bin0) ->
	{ V_playerID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_code, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_guildID, Bin3 } = binary_read_uint64( Bin2 ),
	{ V_playerName, Bin4 } = binary_read_string( Bin3 ),
	{ V_guildName, Bin5 } = binary_read_string( Bin4 ),
	{ V_career, Bin6 } = binary_read_uint( Bin5 ),
	{ V_level, Bin7 } = binary_read_uint16( Bin6 ),
	{ V_friendState, Bin8 } = binary_read_uint8( Bin7 ),
	{ V_race, Bin9 } = binary_read_uint8( Bin8 ),
	{ V_sex, Bin10 } = binary_read_uint8( Bin9 ),
	{ V_head, Bin11 } = binary_read_int( Bin10 ),
	{ V_force, Bin12 } = binary_read_uint( Bin11 ),
	{ #pk_OnlineMemberSnapshot {
		playerID = V_playerID,
		code = V_code,
		guildID = V_guildID,
		playerName = V_playerName,
		guildName = V_guildName,
		career = V_career,
		level = V_level,
		friendState = V_friendState,
		race = V_race,
		sex = V_sex,
		head = V_head,
		force = V_force
		},
	Bin12 }.

%GENERATED from file:team.h => TeamBaseInfo
-spec readTeamBaseInfo(Bin0) -> { #pk_TeamBaseInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readTeamBaseInfo(Bin0) ->
	{ V_teamID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_leaderID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_copyMapID, Bin3 } = binary_read_int( Bin2 ),
	{ V_canBeSearched, Bin4 } = binary_read_int( Bin3 ),
	{ V_searchStartTime, Bin5 } = binary_read_uint64( Bin4 ),
	{ #pk_TeamBaseInfo {
		teamID = V_teamID,
		leaderID = V_leaderID,
		copyMapID = V_copyMapID,
		canBeSearched = V_canBeSearched,
		searchStartTime = V_searchStartTime
		},
	Bin5 }.

%GENERATED from file:team.h => TeamMemberInfo
-spec readTeamMemberInfo(Bin0) -> { #pk_TeamMemberInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readTeamMemberInfo(Bin0) ->
	{ V_playerID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_code, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_playerName, Bin3 } = binary_read_string( Bin2 ),
	{ V_guildID, Bin4 } = binary_read_uint64( Bin3 ),
	{ V_guildName, Bin5 } = binary_read_string( Bin4 ),
	{ V_force, Bin6 } = binary_read_uint64( Bin5 ),
	{ V_level, Bin7 } = binary_read_uint16( Bin6 ),
	{ V_career, Bin8 } = binary_read_uint( Bin7 ),
	{ V_race, Bin9 } = binary_read_uint8( Bin8 ),
	{ V_sex, Bin10 } = binary_read_uint8( Bin9 ),
	{ V_head, Bin11 } = binary_read_int( Bin10 ),
	{ V_hpPercent, Bin12 } = binary_read_uint8( Bin11 ),
	{ V_mapID, Bin13 } = binary_read_uint16( Bin12 ),
	{ V_groupID, Bin14 } = binary_read_uint( Bin13 ),
	{ V_mapInstanceID, Bin15 } = binary_read_uint64( Bin14 ),
	{ V_assistMapID, Bin16 } = binary_read_uint16( Bin15 ),
	{ V_x, Bin17 } = binary_read_float( Bin16 ),
	{ V_y, Bin18 } = binary_read_float( Bin17 ),
	{ V_customInfo, Bin19 } = binary_read_string( Bin18 ),
	{ V_copyMapLeftCount, Bin20 } = binary_read_uint16( Bin19 ),
	{ V_actionPoint, Bin21 } = binary_read_uint( Bin20 ),
	{ #pk_TeamMemberInfo {
		playerID = V_playerID,
		code = V_code,
		playerName = V_playerName,
		guildID = V_guildID,
		guildName = V_guildName,
		force = V_force,
		level = V_level,
		career = V_career,
		race = V_race,
		sex = V_sex,
		head = V_head,
		hpPercent = V_hpPercent,
		mapID = V_mapID,
		groupID = V_groupID,
		mapInstanceID = V_mapInstanceID,
		assistMapID = V_assistMapID,
		x = V_x,
		y = V_y,
		customInfo = V_customInfo,
		copyMapLeftCount = V_copyMapLeftCount,
		actionPoint = V_actionPoint
		},
	Bin21 }.

%GENERATED from file:team.h => TeamMemberInfoEx
-spec readTeamMemberInfoEx(Bin0) -> { #pk_TeamMemberInfoEx{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readTeamMemberInfoEx(Bin0) ->
	{ V_playerID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_code, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_level, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_hpPercent, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_mapID, Bin5 } = binary_read_uint16( Bin4 ),
	{ V_groupID, Bin6 } = binary_read_uint( Bin5 ),
	{ V_mapInstanceID, Bin7 } = binary_read_uint64( Bin6 ),
	{ V_copyMapLeftCount, Bin8 } = binary_read_uint16( Bin7 ),
	{ V_actionPoint, Bin9 } = binary_read_uint( Bin8 ),
	{ V_force, Bin10 } = binary_read_uint64( Bin9 ),
	{ V_assistMapID, Bin11 } = binary_read_uint16( Bin10 ),
	{ V_x, Bin12 } = binary_read_float( Bin11 ),
	{ V_y, Bin13 } = binary_read_float( Bin12 ),
	{ #pk_TeamMemberInfoEx {
		playerID = V_playerID,
		code = V_code,
		level = V_level,
		hpPercent = V_hpPercent,
		mapID = V_mapID,
		groupID = V_groupID,
		mapInstanceID = V_mapInstanceID,
		copyMapLeftCount = V_copyMapLeftCount,
		actionPoint = V_actionPoint,
		force = V_force,
		assistMapID = V_assistMapID,
		x = V_x,
		y = V_y
		},
	Bin13 }.

%GENERATED from file:team.h => TeamMemberLocation
-spec readTeamMemberLocation(Bin0) -> { #pk_TeamMemberLocation{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readTeamMemberLocation(Bin0) ->
	{ V_playerID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_x, Bin2 } = binary_read_float( Bin1 ),
	{ V_y, Bin3 } = binary_read_float( Bin2 ),
	{ #pk_TeamMemberLocation {
		playerID = V_playerID,
		x = V_x,
		y = V_y
		},
	Bin3 }.

%GENERATED from file:team.h => TeamMemberSnapshot
-spec readTeamMemberSnapshot(Bin0) -> { #pk_TeamMemberSnapshot{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readTeamMemberSnapshot(Bin0) ->
	{ V_playerID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_code, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_playerName, Bin3 } = binary_read_string( Bin2 ),
	{ V_career, Bin4 } = binary_read_uint( Bin3 ),
	{ V_level, Bin5 } = binary_read_uint16( Bin4 ),
	{ V_race, Bin6 } = binary_read_uint8( Bin5 ),
	{ V_sex, Bin7 } = binary_read_uint8( Bin6 ),
	{ V_head, Bin8 } = binary_read_int( Bin7 ),
	{ V_force, Bin9 } = binary_read_uint64( Bin8 ),
	{ V_guildID, Bin10 } = binary_read_uint64( Bin9 ),
	{ #pk_TeamMemberSnapshot {
		playerID = V_playerID,
		code = V_code,
		playerName = V_playerName,
		career = V_career,
		level = V_level,
		race = V_race,
		sex = V_sex,
		head = V_head,
		force = V_force,
		guildID = V_guildID
		},
	Bin10 }.

%GENERATED from file:team.h => TeamSnapshot
-spec readTeamSnapshot(Bin0) -> { #pk_TeamSnapshot{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readTeamSnapshot(Bin0) ->
	{ V_base, Bin1 } = readTeamBaseInfo( Bin0 ),
	{ V_members, Bin2 } = binary_read_array(Bin1, fun(X) -> readTeamMemberSnapshot( X ) end),
	{ #pk_TeamSnapshot {
		base = V_base,
		members = V_members
		},
	Bin2 }.

%GENERATED from file:trade.h => DealRecord
-spec readDealRecord(Bin0) -> { #pk_DealRecord{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readDealRecord(Bin0) ->
	{ V_itemID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_sellType, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_buyorsell, Bin3 } = binary_read_uint8( Bin2 ),
	{ V_dealTime, Bin4 } = binary_read_uint64( Bin3 ),
	{ V_gold, Bin5 } = binary_read_uint( Bin4 ),
	{ V_diamond, Bin6 } = binary_read_uint( Bin5 ),
	{ V_tax, Bin7 } = binary_read_uint( Bin6 ),
	{ #pk_DealRecord {
		itemID = V_itemID,
		sellType = V_sellType,
		buyorsell = V_buyorsell,
		dealTime = V_dealTime,
		gold = V_gold,
		diamond = V_diamond,
		tax = V_tax
		},
	Bin7 }.

%GENERATED from file:trade.h => QueryTradeList
-spec readQueryTradeList(Bin0) -> { #pk_QueryTradeList{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readQueryTradeList(Bin0) ->
	{ V_orderID, Bin1 } = binary_read_uint64( Bin0 ),
	{ V_itemUID, Bin2 } = binary_read_uint64( Bin1 ),
	{ V_itemID, Bin3 } = binary_read_uint( Bin2 ),
	{ V_roleName, Bin4 } = binary_read_string( Bin3 ),
	{ V_sellType, Bin5 } = binary_read_uint8( Bin4 ),
	{ V_putTime, Bin6 } = binary_read_uint64( Bin5 ),
	{ V_downTime, Bin7 } = binary_read_uint64( Bin6 ),
	{ V_gold, Bin8 } = binary_read_uint( Bin7 ),
	{ V_diamond, Bin9 } = binary_read_uint( Bin8 ),
	{ V_destRoleName, Bin10 } = binary_read_string( Bin9 ),
	{ V_quality, Bin11 } = binary_read_uint8( Bin10 ),
	{ V_itemLevel, Bin12 } = binary_read_uint8( Bin11 ),
	{ V_pileCount, Bin13 } = binary_read_uint( Bin12 ),
	{ #pk_QueryTradeList {
		orderID = V_orderID,
		itemUID = V_itemUID,
		itemID = V_itemID,
		roleName = V_roleName,
		sellType = V_sellType,
		putTime = V_putTime,
		downTime = V_downTime,
		gold = V_gold,
		diamond = V_diamond,
		destRoleName = V_destRoleName,
		quality = V_quality,
		itemLevel = V_itemLevel,
		pileCount = V_pileCount
		},
	Bin13 }.

%GENERATED from file:trade.h => ReferenceItem
-spec readReferenceItem(Bin0) -> { #pk_ReferenceItem{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readReferenceItem(Bin0) ->
	{ V_itemID, Bin1 } = binary_read_uint( Bin0 ),
	{ V_sellNumber, Bin2 } = binary_read_uint16( Bin1 ),
	{ V_gold, Bin3 } = binary_read_uint( Bin2 ),
	{ V_diamond, Bin4 } = binary_read_uint( Bin3 ),
	{ #pk_ReferenceItem {
		itemID = V_itemID,
		sellNumber = V_sellNumber,
		gold = V_gold,
		diamond = V_diamond
		},
	Bin4 }.

%GENERATED from file:wake.h => WakeInfo
-spec readWakeInfo(Bin0) -> { #pk_WakeInfo{},LeftBin }
	when Bin0 :: binary(), LeftBin :: binary().
readWakeInfo(Bin0) ->
	{ V_cardID, Bin1 } = binary_read_uint8( Bin0 ),
	{ V_level, Bin2 } = binary_read_uint8( Bin1 ),
	{ V_curNum, Bin3 } = binary_read_uint16( Bin2 ),
	{ V_activeProgress, Bin4 } = binary_read_uint16( Bin3 ),
	{ V_unlockStateMax, Bin5 } = binary_read_uint8( Bin4 ),
	{ V_curState, Bin6 } = binary_read_uint8( Bin5 ),
	{ #pk_WakeInfo {
		cardID = V_cardID,
		level = V_level,
		curNum = V_curNum,
		activeProgress = V_activeProgress,
		unlockStateMax = V_unlockStateMax,
		curState = V_curState
		},
	Bin6 }.

