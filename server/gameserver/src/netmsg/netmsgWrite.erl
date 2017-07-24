%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% If you have any questions, please contact to ZHONGYUANWEI.

-module(netmsgWrite).

-compile(nowarn_unused_vars).

-include("netmsgRecords.hrl").

-import(netmsg, [
	binary_write_int64/1,
	binary_write_int64/1,
	binary_write_int16/1,
	binary_write_int16/1,
	binary_write_int/1,
	binary_write_bool/1,
	binary_write_int8/1,
	binary_write_uint64/1,
	binary_write_uint16/1,
	binary_write_uint16/1,
	binary_write_uint/1,
	binary_write_uint8/1,
	binary_write_float/1,
	binary_write_double/1,
	binary_write_string/1,
	binary_write_array/2
	]).

-export([packNetMsg/1]).

%GENERATED from file:Date.h => GS2U_DateFindTreasure_Welcome_Sync
packNetMsg(#pk_GS2U_DateFindTreasure_Welcome_Sync{} = P) ->
	Bin_timeForBegin = binary_write_uint16( P#pk_GS2U_DateFindTreasure_Welcome_Sync.timeForBegin ),
	Bin_timeForEnd = binary_write_uint16( P#pk_GS2U_DateFindTreasure_Welcome_Sync.timeForEnd ),
	Bin_score = binary_write_uint16( P#pk_GS2U_DateFindTreasure_Welcome_Sync.score ),
	[
		<<?CMD_GS2U_DateFindTreasure_Welcome_Sync:16/little>>,
		Bin_timeForBegin,
		Bin_timeForEnd,
		Bin_score
	];

%GENERATED from file:Date.h => GS2U_DateLink_BuffAddScore_Sync
packNetMsg(#pk_GS2U_DateLink_BuffAddScore_Sync{} = P) ->
	Bin_score = binary_write_uint16( P#pk_GS2U_DateLink_BuffAddScore_Sync.score ),
	Bin_scoreAll = binary_write_uint16( P#pk_GS2U_DateLink_BuffAddScore_Sync.scoreAll ),
	[
		<<?CMD_GS2U_DateLink_BuffAddScore_Sync:16/little>>,
		Bin_score,
		Bin_scoreAll
	];

%GENERATED from file:Date.h => GS2U_DateLink_BuffAddTime_Sync
packNetMsg(#pk_GS2U_DateLink_BuffAddTime_Sync{} = P) ->
	Bin_timeAdd = binary_write_uint16( P#pk_GS2U_DateLink_BuffAddTime_Sync.timeAdd ),
	Bin_timeRemainder = binary_write_uint16( P#pk_GS2U_DateLink_BuffAddTime_Sync.timeRemainder ),
	[
		<<?CMD_GS2U_DateLink_BuffAddTime_Sync:16/little>>,
		Bin_timeAdd,
		Bin_timeRemainder
	];

%GENERATED from file:Date.h => GS2U_DateLink_BuffBuff_Sync
packNetMsg(#pk_GS2U_DateLink_BuffBuff_Sync{} = P) ->
	Bin_buffID = binary_write_uint16( P#pk_GS2U_DateLink_BuffBuff_Sync.buffID ),
	[
		<<?CMD_GS2U_DateLink_BuffBuff_Sync:16/little>>,
		Bin_buffID
	];

%GENERATED from file:Date.h => GS2U_DateLink_BuffPower_Sync
packNetMsg(#pk_GS2U_DateLink_BuffPower_Sync{} = P) ->
	Bin_time = binary_write_uint8( P#pk_GS2U_DateLink_BuffPower_Sync.time ),
	Bin_power = binary_write_uint8( P#pk_GS2U_DateLink_BuffPower_Sync.power ),
	[
		<<?CMD_GS2U_DateLink_BuffPower_Sync:16/little>>,
		Bin_time,
		Bin_power
	];

%GENERATED from file:Date.h => GS2U_DateLink_DeduffBuff_Sync
packNetMsg(#pk_GS2U_DateLink_DeduffBuff_Sync{} = P) ->
	Bin_buffID = binary_write_uint16( P#pk_GS2U_DateLink_DeduffBuff_Sync.buffID ),
	[
		<<?CMD_GS2U_DateLink_DeduffBuff_Sync:16/little>>,
		Bin_buffID
	];

%GENERATED from file:Date.h => GS2U_DateLink_GameEnd_Sync
packNetMsg(#pk_GS2U_DateLink_GameEnd_Sync{} = P) ->
	Bin_reason = binary_write_uint8( P#pk_GS2U_DateLink_GameEnd_Sync.reason ),
	Bin_time = binary_write_uint8( P#pk_GS2U_DateLink_GameEnd_Sync.time ),
	Bin_score = binary_write_uint16( P#pk_GS2U_DateLink_GameEnd_Sync.score ),
	Bin_id = binary_write_uint8( P#pk_GS2U_DateLink_GameEnd_Sync.id ),
	[
		<<?CMD_GS2U_DateLink_GameEnd_Sync:16/little>>,
		Bin_reason,
		Bin_time,
		Bin_score,
		Bin_id
	];

%GENERATED from file:Date.h => GS2U_DateLink_Link_Sync
packNetMsg(#pk_GS2U_DateLink_Link_Sync{} = P) ->
	Bin_indexA = binary_write_uint8( P#pk_GS2U_DateLink_Link_Sync.indexA ),
	Bin_xA = binary_write_float( P#pk_GS2U_DateLink_Link_Sync.xA ),
	Bin_yA = binary_write_float( P#pk_GS2U_DateLink_Link_Sync.yA ),
	Bin_indexB = binary_write_uint8( P#pk_GS2U_DateLink_Link_Sync.indexB ),
	Bin_xB = binary_write_float( P#pk_GS2U_DateLink_Link_Sync.xB ),
	Bin_yB = binary_write_float( P#pk_GS2U_DateLink_Link_Sync.yB ),
	Bin_combo = binary_write_uint8( P#pk_GS2U_DateLink_Link_Sync.combo ),
	Bin_comboMax = binary_write_uint8( P#pk_GS2U_DateLink_Link_Sync.comboMax ),
	Bin_score = binary_write_uint16( P#pk_GS2U_DateLink_Link_Sync.score ),
	Bin_scoreAll = binary_write_uint16( P#pk_GS2U_DateLink_Link_Sync.scoreAll ),
	Bin_listGemMatrix = binary_write_array(P#pk_GS2U_DateLink_Link_Sync.listGemMatrix, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_GS2U_DateLink_Link_Sync:16/little>>,
		Bin_indexA,
		Bin_xA,
		Bin_yA,
		Bin_indexB,
		Bin_xB,
		Bin_yB,
		Bin_combo,
		Bin_comboMax,
		Bin_score,
		Bin_scoreAll,
		Bin_listGemMatrix
	];

%GENERATED from file:Date.h => GS2U_DateLink_MainTime_Sync
packNetMsg(#pk_GS2U_DateLink_MainTime_Sync{} = P) ->
	Bin_timeRemainder = binary_write_uint16( P#pk_GS2U_DateLink_MainTime_Sync.timeRemainder ),
	[
		<<?CMD_GS2U_DateLink_MainTime_Sync:16/little>>,
		Bin_timeRemainder
	];

%GENERATED from file:Date.h => GS2U_DateLink_ResetGem_Sync
packNetMsg(#pk_GS2U_DateLink_ResetGem_Sync{} = P) ->
	Bin_listGem = binary_write_array(P#pk_GS2U_DateLink_ResetGem_Sync.listGem, fun(X) -> binary_write_uint16( X ) end),
	Bin_resetCount = binary_write_uint8( P#pk_GS2U_DateLink_ResetGem_Sync.resetCount ),
	Bin_resetCD = binary_write_uint8( P#pk_GS2U_DateLink_ResetGem_Sync.resetCD ),
	Bin_listGemMatrix = binary_write_array(P#pk_GS2U_DateLink_ResetGem_Sync.listGemMatrix, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_GS2U_DateLink_ResetGem_Sync:16/little>>,
		Bin_listGem,
		Bin_resetCount,
		Bin_resetCD,
		Bin_listGemMatrix
	];

%GENERATED from file:Date.h => GS2U_DateLink_Select_Ack
packNetMsg(#pk_GS2U_DateLink_Select_Ack{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_DateLink_Select_Ack.roleID ),
	Bin_index = binary_write_uint8( P#pk_GS2U_DateLink_Select_Ack.index ),
	Bin_x = binary_write_float( P#pk_GS2U_DateLink_Select_Ack.x ),
	Bin_y = binary_write_float( P#pk_GS2U_DateLink_Select_Ack.y ),
	Bin_isSelect = binary_write_bool( P#pk_GS2U_DateLink_Select_Ack.isSelect ),
	Bin_listGemMatrix = binary_write_array(P#pk_GS2U_DateLink_Select_Ack.listGemMatrix, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_GS2U_DateLink_Select_Ack:16/little>>,
		Bin_roleID,
		Bin_index,
		Bin_x,
		Bin_y,
		Bin_isSelect,
		Bin_listGemMatrix
	];

%GENERATED from file:Date.h => GS2U_DateLink_Welcome_Sync
packNetMsg(#pk_GS2U_DateLink_Welcome_Sync{} = P) ->
	Bin_timeForBegin = binary_write_uint16( P#pk_GS2U_DateLink_Welcome_Sync.timeForBegin ),
	Bin_timeForEnd = binary_write_uint16( P#pk_GS2U_DateLink_Welcome_Sync.timeForEnd ),
	Bin_timePower = binary_write_uint8( P#pk_GS2U_DateLink_Welcome_Sync.timePower ),
	Bin_listGem = binary_write_array(P#pk_GS2U_DateLink_Welcome_Sync.listGem, fun(X) -> binary_write_uint16( X ) end),
	Bin_score = binary_write_uint16( P#pk_GS2U_DateLink_Welcome_Sync.score ),
	Bin_indexA = binary_write_uint8( P#pk_GS2U_DateLink_Welcome_Sync.indexA ),
	Bin_indexB = binary_write_uint8( P#pk_GS2U_DateLink_Welcome_Sync.indexB ),
	Bin_power = binary_write_uint8( P#pk_GS2U_DateLink_Welcome_Sync.power ),
	Bin_resetCount = binary_write_uint8( P#pk_GS2U_DateLink_Welcome_Sync.resetCount ),
	Bin_listGemMatrix = binary_write_array(P#pk_GS2U_DateLink_Welcome_Sync.listGemMatrix, fun(X) -> binary_write_uint8( X ) end),
	Bin_resetCD = binary_write_uint8( P#pk_GS2U_DateLink_Welcome_Sync.resetCD ),
	[
		<<?CMD_GS2U_DateLink_Welcome_Sync:16/little>>,
		Bin_timeForBegin,
		Bin_timeForEnd,
		Bin_timePower,
		Bin_listGem,
		Bin_score,
		Bin_indexA,
		Bin_indexB,
		Bin_power,
		Bin_resetCount,
		Bin_listGemMatrix,
		Bin_resetCD
	];

%GENERATED from file:Date.h => GS2U_DatePoolShooting_Welcome_Sync
packNetMsg(#pk_GS2U_DatePoolShooting_Welcome_Sync{} = P) ->
	Bin_timeForBegin = binary_write_uint16( P#pk_GS2U_DatePoolShooting_Welcome_Sync.timeForBegin ),
	Bin_timeForEnd = binary_write_uint16( P#pk_GS2U_DatePoolShooting_Welcome_Sync.timeForEnd ),
	Bin_score = binary_write_uint16( P#pk_GS2U_DatePoolShooting_Welcome_Sync.score ),
	[
		<<?CMD_GS2U_DatePoolShooting_Welcome_Sync:16/little>>,
		Bin_timeForBegin,
		Bin_timeForEnd,
		Bin_score
	];

%GENERATED from file:Date.h => GS2U_DatePushBox_GreateNPC_Sync
packNetMsg(#pk_GS2U_DatePushBox_GreateNPC_Sync{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_DatePushBox_GreateNPC_Sync.code ),
	Bin_x = binary_write_float( P#pk_GS2U_DatePushBox_GreateNPC_Sync.x ),
	Bin_z = binary_write_float( P#pk_GS2U_DatePushBox_GreateNPC_Sync.z ),
	[
		<<?CMD_GS2U_DatePushBox_GreateNPC_Sync:16/little>>,
		Bin_code,
		Bin_x,
		Bin_z
	];

%GENERATED from file:Date.h => GS2U_DatePushBox_Succeed_Sync
packNetMsg(#pk_GS2U_DatePushBox_Succeed_Sync{} = P) ->
	Bin_isSucceed = binary_write_bool( P#pk_GS2U_DatePushBox_Succeed_Sync.isSucceed ),
	Bin_isDelete = binary_write_bool( P#pk_GS2U_DatePushBox_Succeed_Sync.isDelete ),
	Bin_code = binary_write_uint64( P#pk_GS2U_DatePushBox_Succeed_Sync.code ),
	Bin_x = binary_write_float( P#pk_GS2U_DatePushBox_Succeed_Sync.x ),
	Bin_z = binary_write_float( P#pk_GS2U_DatePushBox_Succeed_Sync.z ),
	Bin_score = binary_write_uint16( P#pk_GS2U_DatePushBox_Succeed_Sync.score ),
	[
		<<?CMD_GS2U_DatePushBox_Succeed_Sync:16/little>>,
		Bin_isSucceed,
		Bin_isDelete,
		Bin_code,
		Bin_x,
		Bin_z,
		Bin_score
	];

%GENERATED from file:Date.h => GS2U_DatePushBox_Welcome_Sync
packNetMsg(#pk_GS2U_DatePushBox_Welcome_Sync{} = P) ->
	Bin_timeForBegin = binary_write_uint16( P#pk_GS2U_DatePushBox_Welcome_Sync.timeForBegin ),
	Bin_timeForEnd = binary_write_uint16( P#pk_GS2U_DatePushBox_Welcome_Sync.timeForEnd ),
	Bin_score = binary_write_uint16( P#pk_GS2U_DatePushBox_Welcome_Sync.score ),
	Bin_listGemMatrix = binary_write_array(P#pk_GS2U_DatePushBox_Welcome_Sync.listGemMatrix, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_GS2U_DatePushBox_Welcome_Sync:16/little>>,
		Bin_timeForBegin,
		Bin_timeForEnd,
		Bin_score,
		Bin_listGemMatrix
	];

%GENERATED from file:Date.h => GS2U_Date_FindTreasure_Sync
packNetMsg(#pk_GS2U_Date_FindTreasure_Sync{} = P) ->
	Bin_score = binary_write_uint16( P#pk_GS2U_Date_FindTreasure_Sync.score ),
	[
		<<?CMD_GS2U_Date_FindTreasure_Sync:16/little>>,
		Bin_score
	];

%GENERATED from file:Date.h => GS2U_Date_PlayerAnimation_Sync
packNetMsg(#pk_GS2U_Date_PlayerAnimation_Sync{}) ->
	[
		<<?CMD_GS2U_Date_PlayerAnimation_Sync:16/little>>

	];

%GENERATED from file:Date.h => GS2U_Date_RefreshSocre_Sync
packNetMsg(#pk_GS2U_Date_RefreshSocre_Sync{} = P) ->
	Bin_score = binary_write_uint16( P#pk_GS2U_Date_RefreshSocre_Sync.score ),
	Bin_hitA = binary_write_bool( P#pk_GS2U_Date_RefreshSocre_Sync.hitA ),
	Bin_hitB = binary_write_bool( P#pk_GS2U_Date_RefreshSocre_Sync.hitB ),
	[
		<<?CMD_GS2U_Date_RefreshSocre_Sync:16/little>>,
		Bin_score,
		Bin_hitA,
		Bin_hitB
	];

%GENERATED from file:Date.h => GS2U_Date_ResetBox_Sync
packNetMsg(#pk_GS2U_Date_ResetBox_Sync{} = P) ->
	Bin_refreshNum = binary_write_uint( P#pk_GS2U_Date_ResetBox_Sync.refreshNum ),
	[
		<<?CMD_GS2U_Date_ResetBox_Sync:16/little>>,
		Bin_refreshNum
	];

%GENERATED from file:Date.h => GS2U_Date_ResetFindTreasure_Sync
packNetMsg(#pk_GS2U_Date_ResetFindTreasure_Sync{}) ->
	[
		<<?CMD_GS2U_Date_ResetFindTreasure_Sync:16/little>>

	];

%GENERATED from file:Date.h => GS2U_Date_ResetPoolShooting_Sync
packNetMsg(#pk_GS2U_Date_ResetPoolShooting_Sync{} = P) ->
	Bin_listPoolShootingPosIndex = binary_write_array(P#pk_GS2U_Date_ResetPoolShooting_Sync.listPoolShootingPosIndex, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_GS2U_Date_ResetPoolShooting_Sync:16/little>>,
		Bin_listPoolShootingPosIndex
	];

%GENERATED from file:Date.h => GS2U_MonsterMoveSync
packNetMsg(#pk_GS2U_MonsterMoveSync{} = P) ->
	Bin_monsterPosList = binary_write_array(P#pk_GS2U_MonsterMoveSync.monsterPosList, fun(X) -> writeDateMonsterPos( X ) end),
	[
		<<?CMD_GS2U_MonsterMoveSync:16/little>>,
		Bin_monsterPosList
	];

%GENERATED from file:Date.h => U2GS_DateEnter_Request
packNetMsg(#pk_U2GS_DateEnter_Request{} = P) ->
	Bin_id = binary_write_uint8( P#pk_U2GS_DateEnter_Request.id ),
	[
		<<?CMD_U2GS_DateEnter_Request:16/little>>,
		Bin_id
	];

%GENERATED from file:Date.h => U2GS_DateLink_Giveup_Requset
packNetMsg(#pk_U2GS_DateLink_Giveup_Requset{}) ->
	[
		<<?CMD_U2GS_DateLink_Giveup_Requset:16/little>>

	];

%GENERATED from file:Date.h => U2GS_DateLink_ResetGem_Request
packNetMsg(#pk_U2GS_DateLink_ResetGem_Request{}) ->
	[
		<<?CMD_U2GS_DateLink_ResetGem_Request:16/little>>

	];

%GENERATED from file:Date.h => U2GS_DateLink_Select_Request
packNetMsg(#pk_U2GS_DateLink_Select_Request{} = P) ->
	Bin_x = binary_write_float( P#pk_U2GS_DateLink_Select_Request.x ),
	Bin_y = binary_write_float( P#pk_U2GS_DateLink_Select_Request.y ),
	Bin_index = binary_write_uint8( P#pk_U2GS_DateLink_Select_Request.index ),
	Bin_isSelect = binary_write_bool( P#pk_U2GS_DateLink_Select_Request.isSelect ),
	[
		<<?CMD_U2GS_DateLink_Select_Request:16/little>>,
		Bin_x,
		Bin_y,
		Bin_index,
		Bin_isSelect
	];

%GENERATED from file:Date.h => U2GS_DatePushBox_Request
packNetMsg(#pk_U2GS_DatePushBox_Request{} = P) ->
	Bin_code = binary_write_uint64( P#pk_U2GS_DatePushBox_Request.code ),
	Bin_x = binary_write_float( P#pk_U2GS_DatePushBox_Request.x ),
	Bin_z = binary_write_float( P#pk_U2GS_DatePushBox_Request.z ),
	Bin_isDelete = binary_write_bool( P#pk_U2GS_DatePushBox_Request.isDelete ),
	[
		<<?CMD_U2GS_DatePushBox_Request:16/little>>,
		Bin_code,
		Bin_x,
		Bin_z,
		Bin_isDelete
	];

%GENERATED from file:Date.h => U2GS_DateShooting_Over
packNetMsg(#pk_U2GS_DateShooting_Over{}) ->
	[
		<<?CMD_U2GS_DateShooting_Over:16/little>>

	];

%GENERATED from file:LS2User.h => GS2U_ChangeLineResponse
packNetMsg(#pk_GS2U_ChangeLineResponse{} = P) ->
	Bin_gameServers = binary_write_array(P#pk_GS2U_ChangeLineResponse.gameServers, fun(X) -> writeGameServerInfo( X ) end),
	Bin_identity = binary_write_string( P#pk_GS2U_ChangeLineResponse.identity ),
	[
		<<?CMD_GS2U_ChangeLineResponse:16/little>>,
		Bin_gameServers,
		Bin_identity
	];

%GENERATED from file:LS2User.h => LS2U_GameLineServerList
packNetMsg(#pk_LS2U_GameLineServerList{} = P) ->
	Bin_gameServers = binary_write_array(P#pk_LS2U_GameLineServerList.gameServers, fun(X) -> writeGameServerInfo( X ) end),
	[
		<<?CMD_LS2U_GameLineServerList:16/little>>,
		Bin_gameServers
	];

%GENERATED from file:LS2User.h => LS2U_LoginQue
packNetMsg(#pk_LS2U_LoginQue{} = P) ->
	Bin_currentNumber = binary_write_uint64( P#pk_LS2U_LoginQue.currentNumber ),
	[
		<<?CMD_LS2U_LoginQue:16/little>>,
		Bin_currentNumber
	];

%GENERATED from file:LS2User.h => LS2U_LoginResult
packNetMsg(#pk_LS2U_LoginResult{} = P) ->
	Bin_result = binary_write_int8( P#pk_LS2U_LoginResult.result ),
	Bin_accountID = binary_write_uint64( P#pk_LS2U_LoginResult.accountID ),
	Bin_identity = binary_write_string( P#pk_LS2U_LoginResult.identity ),
	Bin_msg = binary_write_string( P#pk_LS2U_LoginResult.msg ),
	[
		<<?CMD_LS2U_LoginResult:16/little>>,
		Bin_result,
		Bin_accountID,
		Bin_identity,
		Bin_msg
	];

%GENERATED from file:LS2User.h => LS2Web_CryptoAck
packNetMsg(#pk_LS2Web_CryptoAck{} = P) ->
	Bin_bodyJsonStr = binary_write_string( P#pk_LS2Web_CryptoAck.bodyJsonStr ),
	[
		<<?CMD_LS2Web_CryptoAck:16/little>>,
		Bin_bodyJsonStr
	];

%GENERATED from file:LS2User.h => LS2Web_NormalAck
packNetMsg(#pk_LS2Web_NormalAck{} = P) ->
	Bin_bodyJsonStr = binary_write_string( P#pk_LS2Web_NormalAck.bodyJsonStr ),
	[
		<<?CMD_LS2Web_NormalAck:16/little>>,
		Bin_bodyJsonStr
	];

%GENERATED from file:LS2User.h => U2LS_Login_Normal
packNetMsg(#pk_U2LS_Login_Normal{} = P) ->
	Bin_platformAccount = binary_write_string( P#pk_U2LS_Login_Normal.platformAccount ),
	Bin_platformName = binary_write_string( P#pk_U2LS_Login_Normal.platformName ),
	Bin_platformNickName = binary_write_string( P#pk_U2LS_Login_Normal.platformNickName ),
	Bin_time = binary_write_int64( P#pk_U2LS_Login_Normal.time ),
	Bin_sign = binary_write_string( P#pk_U2LS_Login_Normal.sign ),
	Bin_deviceId = binary_write_string( P#pk_U2LS_Login_Normal.deviceId ),
	Bin_imei = binary_write_string( P#pk_U2LS_Login_Normal.imei ),
	Bin_idfa = binary_write_string( P#pk_U2LS_Login_Normal.idfa ),
	Bin_mac = binary_write_string( P#pk_U2LS_Login_Normal.mac ),
	Bin_extParam = binary_write_string( P#pk_U2LS_Login_Normal.extParam ),
	Bin_versionRes = binary_write_int( P#pk_U2LS_Login_Normal.versionRes ),
	Bin_versionExe = binary_write_int( P#pk_U2LS_Login_Normal.versionExe ),
	Bin_versionGame = binary_write_int( P#pk_U2LS_Login_Normal.versionGame ),
	Bin_versionPro = binary_write_int( P#pk_U2LS_Login_Normal.versionPro ),
	[
		<<?CMD_U2LS_Login_Normal:16/little>>,
		Bin_platformAccount,
		Bin_platformName,
		Bin_platformNickName,
		Bin_time,
		Bin_sign,
		Bin_deviceId,
		Bin_imei,
		Bin_idfa,
		Bin_mac,
		Bin_extParam,
		Bin_versionRes,
		Bin_versionExe,
		Bin_versionGame,
		Bin_versionPro
	];

%GENERATED from file:LS2User.h => U2LS_RequestGSLine
packNetMsg(#pk_U2LS_RequestGSLine{}) ->
	[
		<<?CMD_U2LS_RequestGSLine:16/little>>

	];

%GENERATED from file:LS2User.h => Web2LS_Crypto
packNetMsg(#pk_Web2LS_Crypto{} = P) ->
	Bin_bodyJsonStr = binary_write_string( P#pk_Web2LS_Crypto.bodyJsonStr ),
	[
		<<?CMD_Web2LS_Crypto:16/little>>,
		Bin_bodyJsonStr
	];

%GENERATED from file:LS2User.h => Web2LS_Normal
packNetMsg(#pk_Web2LS_Normal{} = P) ->
	Bin_bodyJsonStr = binary_write_string( P#pk_Web2LS_Normal.bodyJsonStr ),
	[
		<<?CMD_Web2LS_Normal:16/little>>,
		Bin_bodyJsonStr
	];

%GENERATED from file:achieve.h => GS2U_AchieveSchedule
packNetMsg(#pk_GS2U_AchieveSchedule{} = P) ->
	Bin_achieveID = binary_write_uint16( P#pk_GS2U_AchieveSchedule.achieveID ),
	Bin_scheduleRewardID = binary_write_uint8( P#pk_GS2U_AchieveSchedule.scheduleRewardID ),
	Bin_scheduleCompleteNum = binary_write_uint( P#pk_GS2U_AchieveSchedule.scheduleCompleteNum ),
	Bin_scheduleCompleteID = binary_write_uint8( P#pk_GS2U_AchieveSchedule.scheduleCompleteID ),
	[
		<<?CMD_GS2U_AchieveSchedule:16/little>>,
		Bin_achieveID,
		Bin_scheduleRewardID,
		Bin_scheduleCompleteNum,
		Bin_scheduleCompleteID
	];

%GENERATED from file:achieve.h => GS2U_AchieveScheduleList
packNetMsg(#pk_GS2U_AchieveScheduleList{} = P) ->
	Bin_scheduleList = binary_write_array(P#pk_GS2U_AchieveScheduleList.scheduleList, fun(X) -> writeAchieveSchedule( X ) end),
	[
		<<?CMD_GS2U_AchieveScheduleList:16/little>>,
		Bin_scheduleList
	];

%GENERATED from file:achieve.h => GS2U_AddTitle
packNetMsg(#pk_GS2U_AddTitle{} = P) ->
	Bin_titleID = binary_write_uint16( P#pk_GS2U_AddTitle.titleID ),
	Bin_endTime = binary_write_uint( P#pk_GS2U_AddTitle.endTime ),
	[
		<<?CMD_GS2U_AddTitle:16/little>>,
		Bin_titleID,
		Bin_endTime
	];

%GENERATED from file:achieve.h => GS2U_BadgeInfo
packNetMsg(#pk_GS2U_BadgeInfo{} = P) ->
	Bin_mapID = binary_write_uint16( P#pk_GS2U_BadgeInfo.mapID ),
	Bin_itemID = binary_write_uint( P#pk_GS2U_BadgeInfo.itemID ),
	[
		<<?CMD_GS2U_BadgeInfo:16/little>>,
		Bin_mapID,
		Bin_itemID
	];

%GENERATED from file:achieve.h => GS2U_BadgeInfoList
packNetMsg(#pk_GS2U_BadgeInfoList{} = P) ->
	Bin_badgeInfoList = binary_write_array(P#pk_GS2U_BadgeInfoList.badgeInfoList, fun(X) -> writeBadgeInfo( X ) end),
	[
		<<?CMD_GS2U_BadgeInfoList:16/little>>,
		Bin_badgeInfoList
	];

%GENERATED from file:achieve.h => GS2U_DelTitle
packNetMsg(#pk_GS2U_DelTitle{} = P) ->
	Bin_titleID = binary_write_uint16( P#pk_GS2U_DelTitle.titleID ),
	[
		<<?CMD_GS2U_DelTitle:16/little>>,
		Bin_titleID
	];

%GENERATED from file:achieve.h => GS2U_InitDailyActiveInfo
packNetMsg(#pk_GS2U_InitDailyActiveInfo{} = P) ->
	Bin_dailyActiveInfoList = binary_write_array(P#pk_GS2U_InitDailyActiveInfo.dailyActiveInfoList, fun(X) -> writeDailyActiveInfo( X ) end),
	Bin_receivedAwardList = binary_write_array(P#pk_GS2U_InitDailyActiveInfo.receivedAwardList, fun(X) -> binary_write_uint16( X ) end),
	[
		<<?CMD_GS2U_InitDailyActiveInfo:16/little>>,
		Bin_dailyActiveInfoList,
		Bin_receivedAwardList
	];

%GENERATED from file:achieve.h => GS2U_OwnTitleList
packNetMsg(#pk_GS2U_OwnTitleList{} = P) ->
	Bin_titleInfoList = binary_write_array(P#pk_GS2U_OwnTitleList.titleInfoList, fun(X) -> writeTitleInfo( X ) end),
	[
		<<?CMD_GS2U_OwnTitleList:16/little>>,
		Bin_titleInfoList
	];

%GENERATED from file:achieve.h => GS2U_ReceiveDailyActiveAwardResult
packNetMsg(#pk_GS2U_ReceiveDailyActiveAwardResult{} = P) ->
	Bin_dailyActivityValue = binary_write_uint16( P#pk_GS2U_ReceiveDailyActiveAwardResult.dailyActivityValue ),
	[
		<<?CMD_GS2U_ReceiveDailyActiveAwardResult:16/little>>,
		Bin_dailyActivityValue
	];

%GENERATED from file:achieve.h => GS2U_UpdateDailyActiveInfo
packNetMsg(#pk_GS2U_UpdateDailyActiveInfo{} = P) ->
	Bin_dailyActiveInfo = writeDailyActiveInfo( P#pk_GS2U_UpdateDailyActiveInfo.dailyActiveInfo ),
	[
		<<?CMD_GS2U_UpdateDailyActiveInfo:16/little>>,
		Bin_dailyActiveInfo
	];

%GENERATED from file:achieve.h => U2GS_ChangeLimiteTitleState
packNetMsg(#pk_U2GS_ChangeLimiteTitleState{} = P) ->
	Bin_titleID = binary_write_uint16( P#pk_U2GS_ChangeLimiteTitleState.titleID ),
	[
		<<?CMD_U2GS_ChangeLimiteTitleState:16/little>>,
		Bin_titleID
	];

%GENERATED from file:achieve.h => U2GS_ChangeTitleState
packNetMsg(#pk_U2GS_ChangeTitleState{} = P) ->
	Bin_titleSlot1 = binary_write_uint16( P#pk_U2GS_ChangeTitleState.titleSlot1 ),
	Bin_titleSlot2 = binary_write_uint16( P#pk_U2GS_ChangeTitleState.titleSlot2 ),
	Bin_titleSlot3 = binary_write_uint16( P#pk_U2GS_ChangeTitleState.titleSlot3 ),
	Bin_colorSlot = binary_write_uint16( P#pk_U2GS_ChangeTitleState.colorSlot ),
	Bin_floorSlot = binary_write_uint16( P#pk_U2GS_ChangeTitleState.floorSlot ),
	[
		<<?CMD_U2GS_ChangeTitleState:16/little>>,
		Bin_titleSlot1,
		Bin_titleSlot2,
		Bin_titleSlot3,
		Bin_colorSlot,
		Bin_floorSlot
	];

%GENERATED from file:achieve.h => U2GS_ReceiveAchieveValue
packNetMsg(#pk_U2GS_ReceiveAchieveValue{} = P) ->
	Bin_achieveID = binary_write_uint16( P#pk_U2GS_ReceiveAchieveValue.achieveID ),
	[
		<<?CMD_U2GS_ReceiveAchieveValue:16/little>>,
		Bin_achieveID
	];

%GENERATED from file:achieve.h => U2GS_ReceiveDailyActiveAward
packNetMsg(#pk_U2GS_ReceiveDailyActiveAward{} = P) ->
	Bin_dailyActivityValue = binary_write_uint16( P#pk_U2GS_ReceiveDailyActiveAward.dailyActivityValue ),
	[
		<<?CMD_U2GS_ReceiveDailyActiveAward:16/little>>,
		Bin_dailyActivityValue
	];

%GENERATED from file:activity.h => ArenaTeamMemberPrepare
packNetMsg(#pk_ArenaTeamMemberPrepare{} = P) ->
	Bin_id = binary_write_uint64( P#pk_ArenaTeamMemberPrepare.id ),
	Bin_isPrepare = binary_write_bool( P#pk_ArenaTeamMemberPrepare.isPrepare ),
	[
		<<?CMD_ArenaTeamMemberPrepare:16/little>>,
		Bin_id,
		Bin_isPrepare
	];

%GENERATED from file:activity.h => CrosArenaMatch
packNetMsg(#pk_CrosArenaMatch{} = P) ->
	Bin_isMatch = binary_write_bool( P#pk_CrosArenaMatch.isMatch ),
	[
		<<?CMD_CrosArenaMatch:16/little>>,
		Bin_isMatch
	];

%GENERATED from file:activity.h => DeleteArenaTeamMember
packNetMsg(#pk_DeleteArenaTeamMember{} = P) ->
	Bin_isMyself = binary_write_bool( P#pk_DeleteArenaTeamMember.isMyself ),
	Bin_id = binary_write_uint64( P#pk_DeleteArenaTeamMember.id ),
	[
		<<?CMD_DeleteArenaTeamMember:16/little>>,
		Bin_isMyself,
		Bin_id
	];

%GENERATED from file:activity.h => GS2U_ACCityMonsterSurplusTime
packNetMsg(#pk_GS2U_ACCityMonsterSurplusTime{} = P) ->
	Bin_surplusTime = binary_write_int( P#pk_GS2U_ACCityMonsterSurplusTime.surplusTime ),
	[
		<<?CMD_GS2U_ACCityMonsterSurplusTime:16/little>>,
		Bin_surplusTime
	];

%GENERATED from file:activity.h => GS2U_ActionList
packNetMsg(#pk_GS2U_ActionList{} = P) ->
	Bin_correctID = binary_write_uint( P#pk_GS2U_ActionList.correctID ),
	Bin_danceIDs = binary_write_array(P#pk_GS2U_ActionList.danceIDs, fun(X) -> binary_write_uint( X ) end),
	[
		<<?CMD_GS2U_ActionList:16/little>>,
		Bin_correctID,
		Bin_danceIDs
	];

%GENERATED from file:activity.h => GS2U_ActivityEnd
packNetMsg(#pk_GS2U_ActivityEnd{}) ->
	[
		<<?CMD_GS2U_ActivityEnd:16/little>>

	];

%GENERATED from file:activity.h => GS2U_ActivityState
packNetMsg(#pk_GS2U_ActivityState{} = P) ->
	Bin_activityID = binary_write_uint16( P#pk_GS2U_ActivityState.activityID ),
	Bin_mapID = binary_write_uint( P#pk_GS2U_ActivityState.mapID ),
	Bin_phase = binary_write_int16( P#pk_GS2U_ActivityState.phase ),
	[
		<<?CMD_GS2U_ActivityState:16/little>>,
		Bin_activityID,
		Bin_mapID,
		Bin_phase
	];

%GENERATED from file:activity.h => GS2U_AddArenaTeamMemberRequest
packNetMsg(#pk_GS2U_AddArenaTeamMemberRequest{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_AddArenaTeamMemberRequest.roleID ),
	Bin_name = binary_write_string( P#pk_GS2U_AddArenaTeamMemberRequest.name ),
	[
		<<?CMD_GS2U_AddArenaTeamMemberRequest:16/little>>,
		Bin_roleID,
		Bin_name
	];

%GENERATED from file:activity.h => GS2U_AllAnswerQuestion
packNetMsg(#pk_GS2U_AllAnswerQuestion{} = P) ->
	Bin_questionID = binary_write_uint8( P#pk_GS2U_AllAnswerQuestion.questionID ),
	Bin_startTime = binary_write_uint64( P#pk_GS2U_AllAnswerQuestion.startTime ),
	[
		<<?CMD_GS2U_AllAnswerQuestion:16/little>>,
		Bin_questionID,
		Bin_startTime
	];

%GENERATED from file:activity.h => GS2U_AngelInvestmentList
packNetMsg(#pk_GS2U_AngelInvestmentList{} = P) ->
	Bin_lists = binary_write_array(P#pk_GS2U_AngelInvestmentList.lists, fun(X) -> writeAngelInvestmentData( X ) end),
	[
		<<?CMD_GS2U_AngelInvestmentList:16/little>>,
		Bin_lists
	];

%GENERATED from file:activity.h => GS2U_AnswerFirstAndLuckyPlayer
packNetMsg(#pk_GS2U_AnswerFirstAndLuckyPlayer{} = P) ->
	Bin_playerName = binary_write_array(P#pk_GS2U_AnswerFirstAndLuckyPlayer.playerName, fun(X) -> binary_write_string( X ) end),
	[
		<<?CMD_GS2U_AnswerFirstAndLuckyPlayer:16/little>>,
		Bin_playerName
	];

%GENERATED from file:activity.h => GS2U_AnswerQuestion
packNetMsg(#pk_GS2U_AnswerQuestion{} = P) ->
	Bin_startTime = binary_write_uint64( P#pk_GS2U_AnswerQuestion.startTime ),
	Bin_answerNum = binary_write_uint8( P#pk_GS2U_AnswerQuestion.answerNum ),
	Bin_questionList = binary_write_array(P#pk_GS2U_AnswerQuestion.questionList, fun(X) -> writeQuestion( X ) end),
	[
		<<?CMD_GS2U_AnswerQuestion:16/little>>,
		Bin_startTime,
		Bin_answerNum,
		Bin_questionList
	];

%GENERATED from file:activity.h => GS2U_AnswerRank
packNetMsg(#pk_GS2U_AnswerRank{} = P) ->
	Bin_data = binary_write_array(P#pk_GS2U_AnswerRank.data, fun(X) -> writeActivityAnswerRankData( X ) end),
	Bin_isover = binary_write_bool( P#pk_GS2U_AnswerRank.isover ),
	[
		<<?CMD_GS2U_AnswerRank:16/little>>,
		Bin_data,
		Bin_isover
	];

%GENERATED from file:activity.h => GS2U_ApplyAnswerResult
packNetMsg(#pk_GS2U_ApplyAnswerResult{} = P) ->
	Bin_result = binary_write_uint8( P#pk_GS2U_ApplyAnswerResult.result ),
	Bin_endTime = binary_write_uint64( P#pk_GS2U_ApplyAnswerResult.endTime ),
	[
		<<?CMD_GS2U_ApplyAnswerResult:16/little>>,
		Bin_result,
		Bin_endTime
	];

%GENERATED from file:activity.h => GS2U_ArenaBattleList
packNetMsg(#pk_GS2U_ArenaBattleList{} = P) ->
	Bin_res = binary_write_uint8( P#pk_GS2U_ArenaBattleList.res ),
	Bin_bList = binary_write_array(P#pk_GS2U_ArenaBattleList.bList, fun(X) -> writeArenaBattle( X ) end),
	[
		<<?CMD_GS2U_ArenaBattleList:16/little>>,
		Bin_res,
		Bin_bList
	];

%GENERATED from file:activity.h => GS2U_ArenaRoleDead
packNetMsg(#pk_GS2U_ArenaRoleDead{} = P) ->
	Bin_id = binary_write_uint64( P#pk_GS2U_ArenaRoleDead.id ),
	[
		<<?CMD_GS2U_ArenaRoleDead:16/little>>,
		Bin_id
	];

%GENERATED from file:activity.h => GS2U_ArenaRoleList
packNetMsg(#pk_GS2U_ArenaRoleList{} = P) ->
	Bin_time = binary_write_uint16( P#pk_GS2U_ArenaRoleList.time ),
	Bin_roleList = binary_write_array(P#pk_GS2U_ArenaRoleList.roleList, fun(X) -> writeArenaRole( X ) end),
	[
		<<?CMD_GS2U_ArenaRoleList:16/little>>,
		Bin_time,
		Bin_roleList
	];

%GENERATED from file:activity.h => GS2U_AttackerDefenderQuotaNumberAck
packNetMsg(#pk_GS2U_AttackerDefenderQuotaNumberAck{} = P) ->
	Bin_activityID = binary_write_uint16( P#pk_GS2U_AttackerDefenderQuotaNumberAck.activityID ),
	Bin_mapID = binary_write_uint( P#pk_GS2U_AttackerDefenderQuotaNumberAck.mapID ),
	Bin_acctackerQuotaNum = binary_write_uint16( P#pk_GS2U_AttackerDefenderQuotaNumberAck.acctackerQuotaNum ),
	[
		<<?CMD_GS2U_AttackerDefenderQuotaNumberAck:16/little>>,
		Bin_activityID,
		Bin_mapID,
		Bin_acctackerQuotaNum
	];

%GENERATED from file:activity.h => GS2U_BreakDance
packNetMsg(#pk_GS2U_BreakDance{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_BreakDance.roleID ),
	[
		<<?CMD_GS2U_BreakDance:16/little>>,
		Bin_roleID
	];

%GENERATED from file:activity.h => GS2U_ChangeGuardianDeclaration
packNetMsg(#pk_GS2U_ChangeGuardianDeclaration{} = P) ->
	Bin_isChange = binary_write_bool( P#pk_GS2U_ChangeGuardianDeclaration.isChange ),
	[
		<<?CMD_GS2U_ChangeGuardianDeclaration:16/little>>,
		Bin_isChange
	];

%GENERATED from file:activity.h => GS2U_CrosArenaBattleHighRanks
packNetMsg(#pk_GS2U_CrosArenaBattleHighRanks{} = P) ->
	Bin_ranks = binary_write_array(P#pk_GS2U_CrosArenaBattleHighRanks.ranks, fun(X) -> writeCrosArenaBattleHighRank( X ) end),
	[
		<<?CMD_GS2U_CrosArenaBattleHighRanks:16/little>>,
		Bin_ranks
	];

%GENERATED from file:activity.h => GS2U_CrosArenaBattleRanks
packNetMsg(#pk_GS2U_CrosArenaBattleRanks{} = P) ->
	Bin_ranks = binary_write_array(P#pk_GS2U_CrosArenaBattleRanks.ranks, fun(X) -> writeCrosArenaBattleRank( X ) end),
	[
		<<?CMD_GS2U_CrosArenaBattleRanks:16/little>>,
		Bin_ranks
	];

%GENERATED from file:activity.h => GS2U_CrosBattleExploits
packNetMsg(#pk_GS2U_CrosBattleExploits{} = P) ->
	Bin_ranks = binary_write_array(P#pk_GS2U_CrosBattleExploits.ranks, fun(X) -> writeCrosBattleExploit( X ) end),
	[
		<<?CMD_GS2U_CrosBattleExploits:16/little>>,
		Bin_ranks
	];

%GENERATED from file:activity.h => GS2U_CurEscortType
packNetMsg(#pk_GS2U_CurEscortType{} = P) ->
	Bin_escortType = binary_write_uint16( P#pk_GS2U_CurEscortType.escortType ),
	[
		<<?CMD_GS2U_CurEscortType:16/little>>,
		Bin_escortType
	];

%GENERATED from file:activity.h => GS2U_DarknessCamp
packNetMsg(#pk_GS2U_DarknessCamp{} = P) ->
	Bin_camp = binary_write_uint8( P#pk_GS2U_DarknessCamp.camp ),
	Bin_integral = binary_write_uint( P#pk_GS2U_DarknessCamp.integral ),
	[
		<<?CMD_GS2U_DarknessCamp:16/little>>,
		Bin_camp,
		Bin_integral
	];

%GENERATED from file:activity.h => GS2U_DarknessInfo
packNetMsg(#pk_GS2U_DarknessInfo{} = P) ->
	Bin_state = writeDarknessState( P#pk_GS2U_DarknessInfo.state ),
	Bin_buyMoneyType = binary_write_uint8( P#pk_GS2U_DarknessInfo.buyMoneyType ),
	Bin_buyMoney = binary_write_int( P#pk_GS2U_DarknessInfo.buyMoney ),
	[
		<<?CMD_GS2U_DarknessInfo:16/little>>,
		Bin_state,
		Bin_buyMoneyType,
		Bin_buyMoney
	];

%GENERATED from file:activity.h => GS2U_DarknessKillOrBeKill
packNetMsg(#pk_GS2U_DarknessKillOrBeKill{} = P) ->
	Bin_targetName = binary_write_string( P#pk_GS2U_DarknessKillOrBeKill.targetName ),
	Bin_isSuccess = binary_write_bool( P#pk_GS2U_DarknessKillOrBeKill.isSuccess ),
	Bin_changePebble = binary_write_int( P#pk_GS2U_DarknessKillOrBeKill.changePebble ),
	[
		<<?CMD_GS2U_DarknessKillOrBeKill:16/little>>,
		Bin_targetName,
		Bin_isSuccess,
		Bin_changePebble
	];

%GENERATED from file:activity.h => GS2U_DarknessQuenenState
packNetMsg(#pk_GS2U_DarknessQuenenState{} = P) ->
	Bin_entrance = binary_write_uint8( P#pk_GS2U_DarknessQuenenState.entrance ),
	Bin_floor = binary_write_uint8( P#pk_GS2U_DarknessQuenenState.floor ),
	[
		<<?CMD_GS2U_DarknessQuenenState:16/little>>,
		Bin_entrance,
		Bin_floor
	];

%GENERATED from file:activity.h => GS2U_DarknessRank
packNetMsg(#pk_GS2U_DarknessRank{} = P) ->
	Bin_camp1 = binary_write_array(P#pk_GS2U_DarknessRank.camp1, fun(X) -> writeDarknessPlayerRank( X ) end),
	Bin_camp2 = binary_write_array(P#pk_GS2U_DarknessRank.camp2, fun(X) -> writeDarknessPlayerRank( X ) end),
	[
		<<?CMD_GS2U_DarknessRank:16/little>>,
		Bin_camp1,
		Bin_camp2
	];

%GENERATED from file:activity.h => GS2U_DarknessState
packNetMsg(#pk_GS2U_DarknessState{} = P) ->
	Bin_state = writeDarknessState( P#pk_GS2U_DarknessState.state ),
	[
		<<?CMD_GS2U_DarknessState:16/little>>,
		Bin_state
	];

%GENERATED from file:activity.h => GS2U_DestinyStar
packNetMsg(#pk_GS2U_DestinyStar{} = P) ->
	Bin_stars = binary_write_array(P#pk_GS2U_DestinyStar.stars, fun(X) -> writeLotteryItem( X ) end),
	[
		<<?CMD_GS2U_DestinyStar:16/little>>,
		Bin_stars
	];

%GENERATED from file:activity.h => GS2U_EnterDarkness
packNetMsg(#pk_GS2U_EnterDarkness{} = P) ->
	Bin_entrances = binary_write_array(P#pk_GS2U_EnterDarkness.entrances, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_GS2U_EnterDarkness:16/little>>,
		Bin_entrances
	];

%GENERATED from file:activity.h => GS2U_EscortResult
packNetMsg(#pk_GS2U_EscortResult{} = P) ->
	Bin_escortType = binary_write_uint16( P#pk_GS2U_EscortResult.escortType ),
	Bin_endReason = binary_write_uint8( P#pk_GS2U_EscortResult.endReason ),
	Bin_isSuccess = binary_write_bool( P#pk_GS2U_EscortResult.isSuccess ),
	Bin_rewards = binary_write_array(P#pk_GS2U_EscortResult.rewards, fun(X) -> writeEscortResultReward( X ) end),
	Bin_plunder = binary_write_array(P#pk_GS2U_EscortResult.plunder, fun(X) -> writeEscortPlunderMoney( X ) end),
	[
		<<?CMD_GS2U_EscortResult:16/little>>,
		Bin_escortType,
		Bin_endReason,
		Bin_isSuccess,
		Bin_rewards,
		Bin_plunder
	];

%GENERATED from file:activity.h => GS2U_GetChargeOrUseGiftAck
packNetMsg(#pk_GS2U_GetChargeOrUseGiftAck{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_GetChargeOrUseGiftAck.type ),
	Bin_ruleID = binary_write_uint8( P#pk_GS2U_GetChargeOrUseGiftAck.ruleID ),
	Bin_success = binary_write_bool( P#pk_GS2U_GetChargeOrUseGiftAck.success ),
	[
		<<?CMD_GS2U_GetChargeOrUseGiftAck:16/little>>,
		Bin_type,
		Bin_ruleID,
		Bin_success
	];

%GENERATED from file:activity.h => GS2U_Goblin_Open_State
packNetMsg(#pk_GS2U_Goblin_Open_State{} = P) ->
	Bin_isOpen = binary_write_bool( P#pk_GS2U_Goblin_Open_State.isOpen ),
	Bin_mapID = binary_write_uint( P#pk_GS2U_Goblin_Open_State.mapID ),
	[
		<<?CMD_GS2U_Goblin_Open_State:16/little>>,
		Bin_isOpen,
		Bin_mapID
	];

%GENERATED from file:activity.h => GS2U_HDBattleCD
packNetMsg(#pk_GS2U_HDBattleCD{} = P) ->
	Bin_time = binary_write_uint16( P#pk_GS2U_HDBattleCD.time ),
	[
		<<?CMD_GS2U_HDBattleCD:16/little>>,
		Bin_time
	];

%GENERATED from file:activity.h => GS2U_HDBattleExploits
packNetMsg(#pk_GS2U_HDBattleExploits{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_HDBattleExploits.type ),
	Bin_exploits = binary_write_array(P#pk_GS2U_HDBattleExploits.exploits, fun(X) -> writeHDBattleExploit( X ) end),
	[
		<<?CMD_GS2U_HDBattleExploits:16/little>>,
		Bin_type,
		Bin_exploits
	];

%GENERATED from file:activity.h => GS2U_HDBattleOpenSurplusTime
packNetMsg(#pk_GS2U_HDBattleOpenSurplusTime{} = P) ->
	Bin_surplusTime = binary_write_int16( P#pk_GS2U_HDBattleOpenSurplusTime.surplusTime ),
	[
		<<?CMD_GS2U_HDBattleOpenSurplusTime:16/little>>,
		Bin_surplusTime
	];

%GENERATED from file:activity.h => GS2U_HDBattlePhase
packNetMsg(#pk_GS2U_HDBattlePhase{} = P) ->
	Bin_phase = binary_write_uint8( P#pk_GS2U_HDBattlePhase.phase ),
	Bin_param1 = binary_write_uint16( P#pk_GS2U_HDBattlePhase.param1 ),
	Bin_param2 = binary_write_uint16( P#pk_GS2U_HDBattlePhase.param2 ),
	[
		<<?CMD_GS2U_HDBattlePhase:16/little>>,
		Bin_phase,
		Bin_param1,
		Bin_param2
	];

%GENERATED from file:activity.h => GS2U_HDGatherSuccess
packNetMsg(#pk_GS2U_HDGatherSuccess{} = P) ->
	Bin_gatherID = binary_write_uint( P#pk_GS2U_HDGatherSuccess.gatherID ),
	[
		<<?CMD_GS2U_HDGatherSuccess:16/little>>,
		Bin_gatherID
	];

%GENERATED from file:activity.h => GS2U_IconLight
packNetMsg(#pk_GS2U_IconLight{} = P) ->
	Bin_id = binary_write_uint8( P#pk_GS2U_IconLight.id ),
	Bin_light = binary_write_bool( P#pk_GS2U_IconLight.light ),
	[
		<<?CMD_GS2U_IconLight:16/little>>,
		Bin_id,
		Bin_light
	];

%GENERATED from file:activity.h => GS2U_InitWildBossInfo
packNetMsg(#pk_GS2U_InitWildBossInfo{} = P) ->
	Bin_infos = binary_write_array(P#pk_GS2U_InitWildBossInfo.infos, fun(X) -> writeWildBossInfo( X ) end),
	[
		<<?CMD_GS2U_InitWildBossInfo:16/little>>,
		Bin_infos
	];

%GENERATED from file:activity.h => GS2U_JoinHDBattle
packNetMsg(#pk_GS2U_JoinHDBattle{}) ->
	[
		<<?CMD_GS2U_JoinHDBattle:16/little>>

	];

%GENERATED from file:activity.h => GS2U_KillPlayerNumber
packNetMsg(#pk_GS2U_KillPlayerNumber{} = P) ->
	Bin_sortNumber = binary_write_uint( P#pk_GS2U_KillPlayerNumber.sortNumber ),
	Bin_killNumber = binary_write_uint( P#pk_GS2U_KillPlayerNumber.killNumber ),
	Bin_lxKillNumber = binary_write_uint( P#pk_GS2U_KillPlayerNumber.lxKillNumber ),
	Bin_needKill = binary_write_uint( P#pk_GS2U_KillPlayerNumber.needKill ),
	Bin_remainSecond = binary_write_uint( P#pk_GS2U_KillPlayerNumber.remainSecond ),
	Bin_gatherNumber = binary_write_uint( P#pk_GS2U_KillPlayerNumber.gatherNumber ),
	Bin_needGatherNumber = binary_write_uint( P#pk_GS2U_KillPlayerNumber.needGatherNumber ),
	[
		<<?CMD_GS2U_KillPlayerNumber:16/little>>,
		Bin_sortNumber,
		Bin_killNumber,
		Bin_lxKillNumber,
		Bin_needKill,
		Bin_remainSecond,
		Bin_gatherNumber,
		Bin_needGatherNumber
	];

%GENERATED from file:activity.h => GS2U_KillRank
packNetMsg(#pk_GS2U_KillRank{} = P) ->
	Bin_rank = binary_write_array(P#pk_GS2U_KillRank.rank, fun(X) -> writeKillRank( X ) end),
	[
		<<?CMD_GS2U_KillRank:16/little>>,
		Bin_rank
	];

%GENERATED from file:activity.h => GS2U_KingBattleBuffInfo
packNetMsg(#pk_GS2U_KingBattleBuffInfo{} = P) ->
	Bin_mirrorBuffcfgID = binary_write_uint64( P#pk_GS2U_KingBattleBuffInfo.mirrorBuffcfgID ),
	Bin_defenderBuffcfgID = binary_write_uint64( P#pk_GS2U_KingBattleBuffInfo.defenderBuffcfgID ),
	Bin_attackerBuffcfgID = binary_write_uint64( P#pk_GS2U_KingBattleBuffInfo.attackerBuffcfgID ),
	[
		<<?CMD_GS2U_KingBattleBuffInfo:16/little>>,
		Bin_mirrorBuffcfgID,
		Bin_defenderBuffcfgID,
		Bin_attackerBuffcfgID
	];

%GENERATED from file:activity.h => GS2U_KingBattleRepairMirror
packNetMsg(#pk_GS2U_KingBattleRepairMirror{} = P) ->
	Bin_mirrorMaxHp = binary_write_uint64( P#pk_GS2U_KingBattleRepairMirror.mirrorMaxHp ),
	Bin_mirrorCurrentHp = binary_write_uint64( P#pk_GS2U_KingBattleRepairMirror.mirrorCurrentHp ),
	[
		<<?CMD_GS2U_KingBattleRepairMirror:16/little>>,
		Bin_mirrorMaxHp,
		Bin_mirrorCurrentHp
	];

%GENERATED from file:activity.h => GS2U_KingBattleResult
packNetMsg(#pk_GS2U_KingBattleResult{} = P) ->
	Bin_isNewKing = binary_write_bool( P#pk_GS2U_KingBattleResult.isNewKing ),
	Bin_killNumOrHurt = binary_write_uint64( P#pk_GS2U_KingBattleResult.killNumOrHurt ),
	Bin_days = binary_write_uint8( P#pk_GS2U_KingBattleResult.days ),
	Bin_declaration = binary_write_string( P#pk_GS2U_KingBattleResult.declaration ),
	Bin_name = binary_write_string( P#pk_GS2U_KingBattleResult.name ),
	Bin_roleID = binary_write_uint64( P#pk_GS2U_KingBattleResult.roleID ),
	Bin_career = binary_write_uint( P#pk_GS2U_KingBattleResult.career ),
	Bin_race = binary_write_int8( P#pk_GS2U_KingBattleResult.race ),
	Bin_sex = binary_write_int8( P#pk_GS2U_KingBattleResult.sex ),
	Bin_head = binary_write_int( P#pk_GS2U_KingBattleResult.head ),
	Bin_wingLevel = binary_write_int( P#pk_GS2U_KingBattleResult.wingLevel ),
	Bin_fashionIDs = binary_write_array(P#pk_GS2U_KingBattleResult.fashionIDs, fun(X) -> binary_write_int( X ) end),
	Bin_equipIDList = binary_write_array(P#pk_GS2U_KingBattleResult.equipIDList, fun(X) -> writePlayerKingBattleEquip( X ) end),
	Bin_equipLevelList = binary_write_array(P#pk_GS2U_KingBattleResult.equipLevelList, fun(X) -> writePlayerKingBattleEquipLevel( X ) end),
	[
		<<?CMD_GS2U_KingBattleResult:16/little>>,
		Bin_isNewKing,
		Bin_killNumOrHurt,
		Bin_days,
		Bin_declaration,
		Bin_name,
		Bin_roleID,
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_head,
		Bin_wingLevel,
		Bin_fashionIDs,
		Bin_equipIDList,
		Bin_equipLevelList
	];

%GENERATED from file:activity.h => GS2U_LotteryMoney
packNetMsg(#pk_GS2U_LotteryMoney{} = P) ->
	Bin_pondGold = binary_write_uint64( P#pk_GS2U_LotteryMoney.pondGold ),
	Bin_pondDiamond = binary_write_uint64( P#pk_GS2U_LotteryMoney.pondDiamond ),
	[
		<<?CMD_GS2U_LotteryMoney:16/little>>,
		Bin_pondGold,
		Bin_pondDiamond
	];

%GENERATED from file:activity.h => GS2U_LotteryNote
packNetMsg(#pk_GS2U_LotteryNote{} = P) ->
	Bin_notes = binary_write_array(P#pk_GS2U_LotteryNote.notes, fun(X) -> writeLotteryNote( X ) end),
	[
		<<?CMD_GS2U_LotteryNote:16/little>>,
		Bin_notes
	];

%GENERATED from file:activity.h => GS2U_LotteryResetTime
packNetMsg(#pk_GS2U_LotteryResetTime{} = P) ->
	Bin_goldFreeRstTime = binary_write_uint64( P#pk_GS2U_LotteryResetTime.goldFreeRstTime ),
	Bin_diamondFreeRstTime = binary_write_uint64( P#pk_GS2U_LotteryResetTime.diamondFreeRstTime ),
	[
		<<?CMD_GS2U_LotteryResetTime:16/little>>,
		Bin_goldFreeRstTime,
		Bin_diamondFreeRstTime
	];

%GENERATED from file:activity.h => GS2U_LotteryResult
packNetMsg(#pk_GS2U_LotteryResult{} = P) ->
	Bin_item = binary_write_array(P#pk_GS2U_LotteryResult.item, fun(X) -> writeLotteryItem( X ) end),
	[
		<<?CMD_GS2U_LotteryResult:16/little>>,
		Bin_item
	];

%GENERATED from file:activity.h => GS2U_MarrorInfoAck
packNetMsg(#pk_GS2U_MarrorInfoAck{} = P) ->
	Bin_nickName = binary_write_string( P#pk_GS2U_MarrorInfoAck.nickName ),
	Bin_playerLevel = binary_write_uint16( P#pk_GS2U_MarrorInfoAck.playerLevel ),
	Bin_playerForce = binary_write_uint( P#pk_GS2U_MarrorInfoAck.playerForce ),
	Bin_roleID = binary_write_uint64( P#pk_GS2U_MarrorInfoAck.roleID ),
	Bin_playerCode = binary_write_uint64( P#pk_GS2U_MarrorInfoAck.playerCode ),
	Bin_career = binary_write_uint( P#pk_GS2U_MarrorInfoAck.career ),
	Bin_race = binary_write_int8( P#pk_GS2U_MarrorInfoAck.race ),
	Bin_sex = binary_write_int8( P#pk_GS2U_MarrorInfoAck.sex ),
	Bin_head = binary_write_int( P#pk_GS2U_MarrorInfoAck.head ),
	Bin_wingLevel = binary_write_int( P#pk_GS2U_MarrorInfoAck.wingLevel ),
	Bin_clique = binary_write_string( P#pk_GS2U_MarrorInfoAck.clique ),
	Bin_defendDays = binary_write_uint( P#pk_GS2U_MarrorInfoAck.defendDays ),
	Bin_mirrorMaxHp = binary_write_uint64( P#pk_GS2U_MarrorInfoAck.mirrorMaxHp ),
	Bin_mirrorLastHp = binary_write_uint64( P#pk_GS2U_MarrorInfoAck.mirrorLastHp ),
	Bin_fashionIDs = binary_write_array(P#pk_GS2U_MarrorInfoAck.fashionIDs, fun(X) -> binary_write_int( X ) end),
	Bin_equipIDList = binary_write_array(P#pk_GS2U_MarrorInfoAck.equipIDList, fun(X) -> writePlayerKingBattleEquip( X ) end),
	Bin_equipLevelList = binary_write_array(P#pk_GS2U_MarrorInfoAck.equipLevelList, fun(X) -> writePlayerKingBattleEquipLevel( X ) end),
	Bin_declaration = binary_write_string( P#pk_GS2U_MarrorInfoAck.declaration ),
	[
		<<?CMD_GS2U_MarrorInfoAck:16/little>>,
		Bin_nickName,
		Bin_playerLevel,
		Bin_playerForce,
		Bin_roleID,
		Bin_playerCode,
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_head,
		Bin_wingLevel,
		Bin_clique,
		Bin_defendDays,
		Bin_mirrorMaxHp,
		Bin_mirrorLastHp,
		Bin_fashionIDs,
		Bin_equipIDList,
		Bin_equipLevelList,
		Bin_declaration
	];

%GENERATED from file:activity.h => GS2U_MyAnswerRank
packNetMsg(#pk_GS2U_MyAnswerRank{} = P) ->
	Bin_ranking = binary_write_uint16( P#pk_GS2U_MyAnswerRank.ranking ),
	Bin_value = binary_write_uint( P#pk_GS2U_MyAnswerRank.value ),
	[
		<<?CMD_GS2U_MyAnswerRank:16/little>>,
		Bin_ranking,
		Bin_value
	];

%GENERATED from file:activity.h => GS2U_NoticeWildBossDead
packNetMsg(#pk_GS2U_NoticeWildBossDead{} = P) ->
	Bin_info = writeWildBossInfo( P#pk_GS2U_NoticeWildBossDead.info ),
	[
		<<?CMD_GS2U_NoticeWildBossDead:16/little>>,
		Bin_info
	];

%GENERATED from file:activity.h => GS2U_NoticeWildBossTarget
packNetMsg(#pk_GS2U_NoticeWildBossTarget{} = P) ->
	Bin_targetCode = binary_write_uint64( P#pk_GS2U_NoticeWildBossTarget.targetCode ),
	Bin_name = binary_write_string( P#pk_GS2U_NoticeWildBossTarget.name ),
	Bin_isShow = binary_write_bool( P#pk_GS2U_NoticeWildBossTarget.isShow ),
	[
		<<?CMD_GS2U_NoticeWildBossTarget:16/little>>,
		Bin_targetCode,
		Bin_name,
		Bin_isShow
	];

%GENERATED from file:activity.h => GS2U_OperateAct_Exchange
packNetMsg(#pk_GS2U_OperateAct_Exchange{} = P) ->
	Bin_exchangeID = binary_write_uint( P#pk_GS2U_OperateAct_Exchange.exchangeID ),
	Bin_exchangeType = binary_write_uint8( P#pk_GS2U_OperateAct_Exchange.exchangeType ),
	Bin_roleExchangedNum = binary_write_uint8( P#pk_GS2U_OperateAct_Exchange.roleExchangedNum ),
	Bin_roleMaxExchangeNum = binary_write_uint8( P#pk_GS2U_OperateAct_Exchange.roleMaxExchangeNum ),
	Bin_exchangeArg = binary_write_uint16( P#pk_GS2U_OperateAct_Exchange.exchangeArg ),
	Bin_exchangeNum = binary_write_uint16( P#pk_GS2U_OperateAct_Exchange.exchangeNum ),
	Bin_startTime = binary_write_uint( P#pk_GS2U_OperateAct_Exchange.startTime ),
	Bin_endTime = binary_write_uint( P#pk_GS2U_OperateAct_Exchange.endTime ),
	Bin_name = binary_write_string( P#pk_GS2U_OperateAct_Exchange.name ),
	Bin_title = binary_write_string( P#pk_GS2U_OperateAct_Exchange.title ),
	Bin_content = binary_write_string( P#pk_GS2U_OperateAct_Exchange.content ),
	Bin_requireList = binary_write_array(P#pk_GS2U_OperateAct_Exchange.requireList, fun(X) -> writeOperateActExchangeRequire( X ) end),
	[
		<<?CMD_GS2U_OperateAct_Exchange:16/little>>,
		Bin_exchangeID,
		Bin_exchangeType,
		Bin_roleExchangedNum,
		Bin_roleMaxExchangeNum,
		Bin_exchangeArg,
		Bin_exchangeNum,
		Bin_startTime,
		Bin_endTime,
		Bin_name,
		Bin_title,
		Bin_content,
		Bin_requireList
	];

%GENERATED from file:activity.h => GS2U_OperateExchangeAck
packNetMsg(#pk_GS2U_OperateExchangeAck{} = P) ->
	Bin_exchangeID = binary_write_uint( P#pk_GS2U_OperateExchangeAck.exchangeID ),
	[
		<<?CMD_GS2U_OperateExchangeAck:16/little>>,
		Bin_exchangeID
	];

%GENERATED from file:activity.h => GS2U_PlayerAnswer
packNetMsg(#pk_GS2U_PlayerAnswer{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_PlayerAnswer.roleID ),
	Bin_questionID = binary_write_uint( P#pk_GS2U_PlayerAnswer.questionID ),
	Bin_isright = binary_write_bool( P#pk_GS2U_PlayerAnswer.isright ),
	Bin_answers = binary_write_string( P#pk_GS2U_PlayerAnswer.answers ),
	Bin_isFirstAnser = binary_write_uint( P#pk_GS2U_PlayerAnswer.isFirstAnser ),
	Bin_roleName = binary_write_string( P#pk_GS2U_PlayerAnswer.roleName ),
	Bin_level = binary_write_uint8( P#pk_GS2U_PlayerAnswer.level ),
	Bin_career = binary_write_uint( P#pk_GS2U_PlayerAnswer.career ),
	Bin_sex = binary_write_uint8( P#pk_GS2U_PlayerAnswer.sex ),
	Bin_race = binary_write_uint8( P#pk_GS2U_PlayerAnswer.race ),
	Bin_head = binary_write_int( P#pk_GS2U_PlayerAnswer.head ),
	[
		<<?CMD_GS2U_PlayerAnswer:16/little>>,
		Bin_roleID,
		Bin_questionID,
		Bin_isright,
		Bin_answers,
		Bin_isFirstAnser,
		Bin_roleName,
		Bin_level,
		Bin_career,
		Bin_sex,
		Bin_race,
		Bin_head
	];

%GENERATED from file:activity.h => GS2U_PlayerAnswerInfo
packNetMsg(#pk_GS2U_PlayerAnswerInfo{} = P) ->
	Bin_trueNum = binary_write_uint( P#pk_GS2U_PlayerAnswerInfo.trueNum ),
	Bin_totalExp = binary_write_uint( P#pk_GS2U_PlayerAnswerInfo.totalExp ),
	Bin_totalCoin = binary_write_uint( P#pk_GS2U_PlayerAnswerInfo.totalCoin ),
	[
		<<?CMD_GS2U_PlayerAnswerInfo:16/little>>,
		Bin_trueNum,
		Bin_totalExp,
		Bin_totalCoin
	];

%GENERATED from file:activity.h => GS2U_PlayerAnswerResult
packNetMsg(#pk_GS2U_PlayerAnswerResult{} = P) ->
	Bin_result = binary_write_int( P#pk_GS2U_PlayerAnswerResult.result ),
	Bin_trueAnswer = binary_write_uint8( P#pk_GS2U_PlayerAnswerResult.trueAnswer ),
	[
		<<?CMD_GS2U_PlayerAnswerResult:16/little>>,
		Bin_result,
		Bin_trueAnswer
	];

%GENERATED from file:activity.h => GS2U_QueueNumber
packNetMsg(#pk_GS2U_QueueNumber{} = P) ->
	Bin_queueNumber = binary_write_uint( P#pk_GS2U_QueueNumber.queueNumber ),
	Bin_isStart = binary_write_bool( P#pk_GS2U_QueueNumber.isStart ),
	Bin_isIMApply = binary_write_bool( P#pk_GS2U_QueueNumber.isIMApply ),
	[
		<<?CMD_GS2U_QueueNumber:16/little>>,
		Bin_queueNumber,
		Bin_isStart,
		Bin_isIMApply
	];

%GENERATED from file:activity.h => GS2U_RequestChargeOrUseListAck
packNetMsg(#pk_GS2U_RequestChargeOrUseListAck{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_RequestChargeOrUseListAck.type ),
	Bin_activityName = binary_write_string( P#pk_GS2U_RequestChargeOrUseListAck.activityName ),
	Bin_activityDesc = binary_write_string( P#pk_GS2U_RequestChargeOrUseListAck.activityDesc ),
	Bin_beginTime = binary_write_uint( P#pk_GS2U_RequestChargeOrUseListAck.beginTime ),
	Bin_endTime = binary_write_uint( P#pk_GS2U_RequestChargeOrUseListAck.endTime ),
	Bin_amountInTime = binary_write_uint( P#pk_GS2U_RequestChargeOrUseListAck.amountInTime ),
	Bin_ruleInfoList = binary_write_array(P#pk_GS2U_RequestChargeOrUseListAck.ruleInfoList, fun(X) -> writeChargeOrUseRuleInfo( X ) end),
	[
		<<?CMD_GS2U_RequestChargeOrUseListAck:16/little>>,
		Bin_type,
		Bin_activityName,
		Bin_activityDesc,
		Bin_beginTime,
		Bin_endTime,
		Bin_amountInTime,
		Bin_ruleInfoList
	];

%GENERATED from file:activity.h => GS2U_ReturnEscortList
packNetMsg(#pk_GS2U_ReturnEscortList{} = P) ->
	Bin_etlist = binary_write_array(P#pk_GS2U_ReturnEscortList.etlist, fun(X) -> writeEscortTeam( X ) end),
	[
		<<?CMD_GS2U_ReturnEscortList:16/little>>,
		Bin_etlist
	];

%GENERATED from file:activity.h => GS2U_RobitAutoAnswer
packNetMsg(#pk_GS2U_RobitAutoAnswer{} = P) ->
	Bin_answerList = binary_write_array(P#pk_GS2U_RobitAutoAnswer.answerList, fun(X) -> writeRobitAnswer( X ) end),
	[
		<<?CMD_GS2U_RobitAutoAnswer:16/little>>,
		Bin_answerList
	];

%GENERATED from file:activity.h => GS2U_SelectCamp
packNetMsg(#pk_GS2U_SelectCamp{} = P) ->
	Bin_camp1 = binary_write_array(P#pk_GS2U_SelectCamp.camp1, fun(X) -> writeDarknessPlayerRank( X ) end),
	Bin_cam1Num = binary_write_uint( P#pk_GS2U_SelectCamp.cam1Num ),
	Bin_camp2 = binary_write_array(P#pk_GS2U_SelectCamp.camp2, fun(X) -> writeDarknessPlayerRank( X ) end),
	Bin_cam2Num = binary_write_uint( P#pk_GS2U_SelectCamp.cam2Num ),
	[
		<<?CMD_GS2U_SelectCamp:16/little>>,
		Bin_camp1,
		Bin_cam1Num,
		Bin_camp2,
		Bin_cam2Num
	];

%GENERATED from file:activity.h => GS2U_SelectDanceID
packNetMsg(#pk_GS2U_SelectDanceID{} = P) ->
	Bin_danceID = binary_write_uint( P#pk_GS2U_SelectDanceID.danceID ),
	Bin_correct = binary_write_bool( P#pk_GS2U_SelectDanceID.correct ),
	[
		<<?CMD_GS2U_SelectDanceID:16/little>>,
		Bin_danceID,
		Bin_correct
	];

%GENERATED from file:activity.h => GS2U_SelfDarkness
packNetMsg(#pk_GS2U_SelfDarkness{} = P) ->
	Bin_self = writeDarknessPlayerRank( P#pk_GS2U_SelfDarkness.self ),
	Bin_isNeedSelectCamp = binary_write_bool( P#pk_GS2U_SelfDarkness.isNeedSelectCamp ),
	Bin_bossID = binary_write_uint( P#pk_GS2U_SelfDarkness.bossID ),
	Bin_syFreshTime = binary_write_uint( P#pk_GS2U_SelfDarkness.syFreshTime ),
	[
		<<?CMD_GS2U_SelfDarkness:16/little>>,
		Bin_self,
		Bin_isNeedSelectCamp,
		Bin_bossID,
		Bin_syFreshTime
	];

%GENERATED from file:activity.h => GS2U_SendAnswerData
packNetMsg(#pk_GS2U_SendAnswerData{} = P) ->
	Bin_questionID = binary_write_uint8( P#pk_GS2U_SendAnswerData.questionID ),
	Bin_endTime = binary_write_uint64( P#pk_GS2U_SendAnswerData.endTime ),
	Bin_data = binary_write_array(P#pk_GS2U_SendAnswerData.data, fun(X) -> writeActivityAnswerRankData( X ) end),
	[
		<<?CMD_GS2U_SendAnswerData:16/little>>,
		Bin_questionID,
		Bin_endTime,
		Bin_data
	];

%GENERATED from file:activity.h => GS2U_SevenMissionDataList
packNetMsg(#pk_GS2U_SevenMissionDataList{} = P) ->
	Bin_days = binary_write_uint8( P#pk_GS2U_SevenMissionDataList.days ),
	Bin_timeoutSeconds = binary_write_uint( P#pk_GS2U_SevenMissionDataList.timeoutSeconds ),
	Bin_lists = binary_write_array(P#pk_GS2U_SevenMissionDataList.lists, fun(X) -> writeSevenDayMissionData( X ) end),
	[
		<<?CMD_GS2U_SevenMissionDataList:16/little>>,
		Bin_days,
		Bin_timeoutSeconds,
		Bin_lists
	];

%GENERATED from file:activity.h => GS2U_SevenMissionDataUpdate
packNetMsg(#pk_GS2U_SevenMissionDataUpdate{} = P) ->
	Bin_isFinish = binary_write_bool( P#pk_GS2U_SevenMissionDataUpdate.isFinish ),
	Bin_number = binary_write_uint16( P#pk_GS2U_SevenMissionDataUpdate.number ),
	Bin_max = binary_write_uint16( P#pk_GS2U_SevenMissionDataUpdate.max ),
	Bin_missionid = binary_write_uint16( P#pk_GS2U_SevenMissionDataUpdate.missionid ),
	[
		<<?CMD_GS2U_SevenMissionDataUpdate:16/little>>,
		Bin_isFinish,
		Bin_number,
		Bin_max,
		Bin_missionid
	];

%GENERATED from file:activity.h => GS2U_SwitchDance
packNetMsg(#pk_GS2U_SwitchDance{} = P) ->
	Bin_second = binary_write_uint8( P#pk_GS2U_SwitchDance.second ),
	[
		<<?CMD_GS2U_SwitchDance:16/little>>,
		Bin_second
	];

%GENERATED from file:activity.h => GS2U_TriggerEvent
packNetMsg(#pk_GS2U_TriggerEvent{}) ->
	[
		<<?CMD_GS2U_TriggerEvent:16/little>>

	];

%GENERATED from file:activity.h => GS2U_TriggerEventResult
packNetMsg(#pk_GS2U_TriggerEventResult{} = P) ->
	Bin_eventID = binary_write_uint16( P#pk_GS2U_TriggerEventResult.eventID ),
	[
		<<?CMD_GS2U_TriggerEventResult:16/little>>,
		Bin_eventID
	];

%GENERATED from file:activity.h => GS2U_UpdateArenaTeamMember
packNetMsg(#pk_GS2U_UpdateArenaTeamMember{} = P) ->
	Bin_teamMemberInfos = binary_write_array(P#pk_GS2U_UpdateArenaTeamMember.teamMemberInfos, fun(X) -> writeArenaTeamMemberInfo( X ) end),
	[
		<<?CMD_GS2U_UpdateArenaTeamMember:16/little>>,
		Bin_teamMemberInfos
	];

%GENERATED from file:activity.h => GS2U_WorldLevel
packNetMsg(#pk_GS2U_WorldLevel{} = P) ->
	Bin_worldLevel = binary_write_uint8( P#pk_GS2U_WorldLevel.worldLevel ),
	[
		<<?CMD_GS2U_WorldLevel:16/little>>,
		Bin_worldLevel
	];

%GENERATED from file:activity.h => U2GS_AddArenaTeamMember
packNetMsg(#pk_U2GS_AddArenaTeamMember{} = P) ->
	Bin_id = binary_write_uint64( P#pk_U2GS_AddArenaTeamMember.id ),
	[
		<<?CMD_U2GS_AddArenaTeamMember:16/little>>,
		Bin_id
	];

%GENERATED from file:activity.h => U2GS_AddArenaTeamMemberAck
packNetMsg(#pk_U2GS_AddArenaTeamMemberAck{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_AddArenaTeamMemberAck.roleID ),
	Bin_result = binary_write_uint8( P#pk_U2GS_AddArenaTeamMemberAck.result ),
	[
		<<?CMD_U2GS_AddArenaTeamMemberAck:16/little>>,
		Bin_roleID,
		Bin_result
	];

%GENERATED from file:activity.h => U2GS_AngelInvestment
packNetMsg(#pk_U2GS_AngelInvestment{} = P) ->
	Bin_id = binary_write_uint16( P#pk_U2GS_AngelInvestment.id ),
	[
		<<?CMD_U2GS_AngelInvestment:16/little>>,
		Bin_id
	];

%GENERATED from file:activity.h => U2GS_AngelInvestmentGet
packNetMsg(#pk_U2GS_AngelInvestmentGet{} = P) ->
	Bin_id = binary_write_uint16( P#pk_U2GS_AngelInvestmentGet.id ),
	[
		<<?CMD_U2GS_AngelInvestmentGet:16/little>>,
		Bin_id
	];

%GENERATED from file:activity.h => U2GS_ApplyAnswer
packNetMsg(#pk_U2GS_ApplyAnswer{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_ApplyAnswer.type ),
	[
		<<?CMD_U2GS_ApplyAnswer:16/little>>,
		Bin_type
	];

%GENERATED from file:activity.h => U2GS_ApplyDance
packNetMsg(#pk_U2GS_ApplyDance{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_ApplyDance.type ),
	[
		<<?CMD_U2GS_ApplyDance:16/little>>,
		Bin_type
	];

%GENERATED from file:activity.h => U2GS_AttackDefenderQuotaNumber
packNetMsg(#pk_U2GS_AttackDefenderQuotaNumber{} = P) ->
	Bin_activityID = binary_write_uint16( P#pk_U2GS_AttackDefenderQuotaNumber.activityID ),
	Bin_mapID = binary_write_uint( P#pk_U2GS_AttackDefenderQuotaNumber.mapID ),
	[
		<<?CMD_U2GS_AttackDefenderQuotaNumber:16/little>>,
		Bin_activityID,
		Bin_mapID
	];

%GENERATED from file:activity.h => U2GS_BreakDance
packNetMsg(#pk_U2GS_BreakDance{}) ->
	[
		<<?CMD_U2GS_BreakDance:16/little>>

	];

%GENERATED from file:activity.h => U2GS_CancelApply
packNetMsg(#pk_U2GS_CancelApply{}) ->
	[
		<<?CMD_U2GS_CancelApply:16/little>>

	];

%GENERATED from file:activity.h => U2GS_DanceArea
packNetMsg(#pk_U2GS_DanceArea{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_DanceArea.type ),
	[
		<<?CMD_U2GS_DanceArea:16/little>>,
		Bin_type
	];

%GENERATED from file:activity.h => U2GS_DarknessRank
packNetMsg(#pk_U2GS_DarknessRank{}) ->
	[
		<<?CMD_U2GS_DarknessRank:16/little>>

	];

%GENERATED from file:activity.h => U2GS_GetAnswerScore
packNetMsg(#pk_U2GS_GetAnswerScore{}) ->
	[
		<<?CMD_U2GS_GetAnswerScore:16/little>>

	];

%GENERATED from file:activity.h => U2GS_GetChargeOrUseGift
packNetMsg(#pk_U2GS_GetChargeOrUseGift{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_GetChargeOrUseGift.type ),
	Bin_ruleID = binary_write_uint8( P#pk_U2GS_GetChargeOrUseGift.ruleID ),
	[
		<<?CMD_U2GS_GetChargeOrUseGift:16/little>>,
		Bin_type,
		Bin_ruleID
	];

%GENERATED from file:activity.h => U2GS_GiveMarrorFlower
packNetMsg(#pk_U2GS_GiveMarrorFlower{}) ->
	[
		<<?CMD_U2GS_GiveMarrorFlower:16/little>>

	];

%GENERATED from file:activity.h => U2GS_GuardianDeclaration
packNetMsg(#pk_U2GS_GuardianDeclaration{} = P) ->
	Bin_declaration = binary_write_string( P#pk_U2GS_GuardianDeclaration.declaration ),
	[
		<<?CMD_U2GS_GuardianDeclaration:16/little>>,
		Bin_declaration
	];

%GENERATED from file:activity.h => U2GS_KillRank
packNetMsg(#pk_U2GS_KillRank{}) ->
	[
		<<?CMD_U2GS_KillRank:16/little>>

	];

%GENERATED from file:activity.h => U2GS_KingBattleBuyAttackerBuff
packNetMsg(#pk_U2GS_KingBattleBuyAttackerBuff{}) ->
	[
		<<?CMD_U2GS_KingBattleBuyAttackerBuff:16/little>>

	];

%GENERATED from file:activity.h => U2GS_KingBattleBuyAttackerBuffOneKey
packNetMsg(#pk_U2GS_KingBattleBuyAttackerBuffOneKey{}) ->
	[
		<<?CMD_U2GS_KingBattleBuyAttackerBuffOneKey:16/little>>

	];

%GENERATED from file:activity.h => U2GS_KingBattleBuyDeffenderBuff
packNetMsg(#pk_U2GS_KingBattleBuyDeffenderBuff{}) ->
	[
		<<?CMD_U2GS_KingBattleBuyDeffenderBuff:16/little>>

	];

%GENERATED from file:activity.h => U2GS_KingBattleBuyDeffenderBuffOneKey
packNetMsg(#pk_U2GS_KingBattleBuyDeffenderBuffOneKey{}) ->
	[
		<<?CMD_U2GS_KingBattleBuyDeffenderBuffOneKey:16/little>>

	];

%GENERATED from file:activity.h => U2GS_KingBattleBuyMirrorBuff
packNetMsg(#pk_U2GS_KingBattleBuyMirrorBuff{}) ->
	[
		<<?CMD_U2GS_KingBattleBuyMirrorBuff:16/little>>

	];

%GENERATED from file:activity.h => U2GS_KingBattleBuyMirrorBuffOneKey
packNetMsg(#pk_U2GS_KingBattleBuyMirrorBuffOneKey{}) ->
	[
		<<?CMD_U2GS_KingBattleBuyMirrorBuffOneKey:16/little>>

	];

%GENERATED from file:activity.h => U2GS_KingBattleGetBuffInfo
packNetMsg(#pk_U2GS_KingBattleGetBuffInfo{}) ->
	[
		<<?CMD_U2GS_KingBattleGetBuffInfo:16/little>>

	];

%GENERATED from file:activity.h => U2GS_KingBattleRepairMirror
packNetMsg(#pk_U2GS_KingBattleRepairMirror{} = P) ->
	Bin_isRepairAll = binary_write_bool( P#pk_U2GS_KingBattleRepairMirror.isRepairAll ),
	[
		<<?CMD_U2GS_KingBattleRepairMirror:16/little>>,
		Bin_isRepairAll
	];

%GENERATED from file:activity.h => U2GS_OpenLotteryForm
packNetMsg(#pk_U2GS_OpenLotteryForm{}) ->
	[
		<<?CMD_U2GS_OpenLotteryForm:16/little>>

	];

%GENERATED from file:activity.h => U2GS_OpenSelectCamp
packNetMsg(#pk_U2GS_OpenSelectCamp{}) ->
	[
		<<?CMD_U2GS_OpenSelectCamp:16/little>>

	];

%GENERATED from file:activity.h => U2GS_OperateExchange
packNetMsg(#pk_U2GS_OperateExchange{} = P) ->
	Bin_exchangeID = binary_write_uint( P#pk_U2GS_OperateExchange.exchangeID ),
	[
		<<?CMD_U2GS_OperateExchange:16/little>>,
		Bin_exchangeID
	];

%GENERATED from file:activity.h => U2GS_OperateExchangeRefresh
packNetMsg(#pk_U2GS_OperateExchangeRefresh{}) ->
	[
		<<?CMD_U2GS_OperateExchangeRefresh:16/little>>

	];

%GENERATED from file:activity.h => U2GS_PlayerAnswer
packNetMsg(#pk_U2GS_PlayerAnswer{} = P) ->
	Bin_questionID = binary_write_uint( P#pk_U2GS_PlayerAnswer.questionID ),
	Bin_isright = binary_write_bool( P#pk_U2GS_PlayerAnswer.isright ),
	Bin_answers = binary_write_string( P#pk_U2GS_PlayerAnswer.answers ),
	[
		<<?CMD_U2GS_PlayerAnswer:16/little>>,
		Bin_questionID,
		Bin_isright,
		Bin_answers
	];

%GENERATED from file:activity.h => U2GS_PlayerAnswerQuestion
packNetMsg(#pk_U2GS_PlayerAnswerQuestion{} = P) ->
	Bin_questionID = binary_write_uint( P#pk_U2GS_PlayerAnswerQuestion.questionID ),
	Bin_answers = binary_write_uint8( P#pk_U2GS_PlayerAnswerQuestion.answers ),
	[
		<<?CMD_U2GS_PlayerAnswerQuestion:16/little>>,
		Bin_questionID,
		Bin_answers
	];

%GENERATED from file:activity.h => U2GS_QueryAngelInvestment
packNetMsg(#pk_U2GS_QueryAngelInvestment{}) ->
	[
		<<?CMD_U2GS_QueryAngelInvestment:16/little>>

	];

%GENERATED from file:activity.h => U2GS_QuerySevenMissionData
packNetMsg(#pk_U2GS_QuerySevenMissionData{}) ->
	[
		<<?CMD_U2GS_QuerySevenMissionData:16/little>>

	];

%GENERATED from file:activity.h => U2GS_ReadyArena
packNetMsg(#pk_U2GS_ReadyArena{}) ->
	[
		<<?CMD_U2GS_ReadyArena:16/little>>

	];

%GENERATED from file:activity.h => U2GS_RequestCrosArenaRanks
packNetMsg(#pk_U2GS_RequestCrosArenaRanks{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_RequestCrosArenaRanks.type ),
	[
		<<?CMD_U2GS_RequestCrosArenaRanks:16/little>>,
		Bin_type
	];

%GENERATED from file:activity.h => U2GS_RequestCrosRanks
packNetMsg(#pk_U2GS_RequestCrosRanks{}) ->
	[
		<<?CMD_U2GS_RequestCrosRanks:16/little>>

	];

%GENERATED from file:activity.h => U2GS_RequestDarknessInfo
packNetMsg(#pk_U2GS_RequestDarknessInfo{}) ->
	[
		<<?CMD_U2GS_RequestDarknessInfo:16/little>>

	];

%GENERATED from file:activity.h => U2GS_RequestEnterDarkness
packNetMsg(#pk_U2GS_RequestEnterDarkness{} = P) ->
	Bin_entrance = binary_write_uint8( P#pk_U2GS_RequestEnterDarkness.entrance ),
	[
		<<?CMD_U2GS_RequestEnterDarkness:16/little>>,
		Bin_entrance
	];

%GENERATED from file:activity.h => U2GS_RequestEntrance
packNetMsg(#pk_U2GS_RequestEntrance{}) ->
	[
		<<?CMD_U2GS_RequestEntrance:16/little>>

	];

%GENERATED from file:activity.h => U2GS_RequestEscortList
packNetMsg(#pk_U2GS_RequestEscortList{}) ->
	[
		<<?CMD_U2GS_RequestEscortList:16/little>>

	];

%GENERATED from file:activity.h => U2GS_RequestEscortRob
packNetMsg(#pk_U2GS_RequestEscortRob{} = P) ->
	Bin_sequenceNumber = binary_write_uint16( P#pk_U2GS_RequestEscortRob.sequenceNumber ),
	[
		<<?CMD_U2GS_RequestEscortRob:16/little>>,
		Bin_sequenceNumber
	];

%GENERATED from file:activity.h => U2GS_RequestEscortSolo
packNetMsg(#pk_U2GS_RequestEscortSolo{}) ->
	[
		<<?CMD_U2GS_RequestEscortSolo:16/little>>

	];

%GENERATED from file:activity.h => U2GS_RequestEscortTeam
packNetMsg(#pk_U2GS_RequestEscortTeam{}) ->
	[
		<<?CMD_U2GS_RequestEscortTeam:16/little>>

	];

%GENERATED from file:activity.h => U2GS_RequestHDBattle
packNetMsg(#pk_U2GS_RequestHDBattle{}) ->
	[
		<<?CMD_U2GS_RequestHDBattle:16/little>>

	];

%GENERATED from file:activity.h => U2GS_RequestHDBattleCD
packNetMsg(#pk_U2GS_RequestHDBattleCD{}) ->
	[
		<<?CMD_U2GS_RequestHDBattleCD:16/little>>

	];

%GENERATED from file:activity.h => U2GS_RequestHDBattleExploits
packNetMsg(#pk_U2GS_RequestHDBattleExploits{}) ->
	[
		<<?CMD_U2GS_RequestHDBattleExploits:16/little>>

	];

%GENERATED from file:activity.h => U2GS_RequestInActivity
packNetMsg(#pk_U2GS_RequestInActivity{} = P) ->
	Bin_activityID = binary_write_uint16( P#pk_U2GS_RequestInActivity.activityID ),
	Bin_mapID = binary_write_uint( P#pk_U2GS_RequestInActivity.mapID ),
	[
		<<?CMD_U2GS_RequestInActivity:16/little>>,
		Bin_activityID,
		Bin_mapID
	];

%GENERATED from file:activity.h => U2GS_RequestJoinHDBattle
packNetMsg(#pk_U2GS_RequestJoinHDBattle{}) ->
	[
		<<?CMD_U2GS_RequestJoinHDBattle:16/little>>

	];

%GENERATED from file:activity.h => U2GS_RequestLottery
packNetMsg(#pk_U2GS_RequestLottery{} = P) ->
	Bin_isGold = binary_write_bool( P#pk_U2GS_RequestLottery.isGold ),
	Bin_isFree = binary_write_bool( P#pk_U2GS_RequestLottery.isFree ),
	Bin_number = binary_write_uint8( P#pk_U2GS_RequestLottery.number ),
	[
		<<?CMD_U2GS_RequestLottery:16/little>>,
		Bin_isGold,
		Bin_isFree,
		Bin_number
	];

%GENERATED from file:activity.h => U2GS_RequestLotteryResetTime
packNetMsg(#pk_U2GS_RequestLotteryResetTime{}) ->
	[
		<<?CMD_U2GS_RequestLotteryResetTime:16/little>>

	];

%GENERATED from file:activity.h => U2GS_RequestMarrorInfo
packNetMsg(#pk_U2GS_RequestMarrorInfo{}) ->
	[
		<<?CMD_U2GS_RequestMarrorInfo:16/little>>

	];

%GENERATED from file:activity.h => U2GS_RequestOPActivityConfList
packNetMsg(#pk_U2GS_RequestOPActivityConfList{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_RequestOPActivityConfList.type ),
	[
		<<?CMD_U2GS_RequestOPActivityConfList:16/little>>,
		Bin_type
	];

%GENERATED from file:activity.h => U2GS_RequestQueueNumber
packNetMsg(#pk_U2GS_RequestQueueNumber{}) ->
	[
		<<?CMD_U2GS_RequestQueueNumber:16/little>>

	];

%GENERATED from file:activity.h => U2GS_SelectCamp
packNetMsg(#pk_U2GS_SelectCamp{} = P) ->
	Bin_camp = binary_write_uint8( P#pk_U2GS_SelectCamp.camp ),
	[
		<<?CMD_U2GS_SelectCamp:16/little>>,
		Bin_camp
	];

%GENERATED from file:activity.h => U2GS_SelectDanceID
packNetMsg(#pk_U2GS_SelectDanceID{} = P) ->
	Bin_danceID = binary_write_uint( P#pk_U2GS_SelectDanceID.danceID ),
	[
		<<?CMD_U2GS_SelectDanceID:16/little>>,
		Bin_danceID
	];

%GENERATED from file:activity.h => U2GS_SelfDarkness
packNetMsg(#pk_U2GS_SelfDarkness{}) ->
	[
		<<?CMD_U2GS_SelfDarkness:16/little>>

	];

%GENERATED from file:activity.h => U2GS_SevenMissionCompletion
packNetMsg(#pk_U2GS_SevenMissionCompletion{} = P) ->
	Bin_missionid = binary_write_uint16( P#pk_U2GS_SevenMissionCompletion.missionid ),
	[
		<<?CMD_U2GS_SevenMissionCompletion:16/little>>,
		Bin_missionid
	];

%GENERATED from file:activity.h => U2GS_StartArena
packNetMsg(#pk_U2GS_StartArena{}) ->
	[
		<<?CMD_U2GS_StartArena:16/little>>

	];

%GENERATED from file:arena.h => GS2U_BattleNotes
packNetMsg(#pk_GS2U_BattleNotes{} = P) ->
	Bin_lsInfo = binary_write_array(P#pk_GS2U_BattleNotes.lsInfo, fun(X) -> writeLadderLS( X ) end),
	Bin_selfInfo = binary_write_array(P#pk_GS2U_BattleNotes.selfInfo, fun(X) -> writeLadderMatchInfo( X ) end),
	[
		<<?CMD_GS2U_BattleNotes:16/little>>,
		Bin_lsInfo,
		Bin_selfInfo
	];

%GENERATED from file:arena.h => GS2U_BattleStartSec
packNetMsg(#pk_GS2U_BattleStartSec{} = P) ->
	Bin_second = binary_write_uint( P#pk_GS2U_BattleStartSec.second ),
	[
		<<?CMD_GS2U_BattleStartSec:16/little>>,
		Bin_second
	];

%GENERATED from file:arena.h => GS2U_Ladder1v1BattleEnd
packNetMsg(#pk_GS2U_Ladder1v1BattleEnd{} = P) ->
	Bin_result = binary_write_uint8( P#pk_GS2U_Ladder1v1BattleEnd.result ),
	Bin_exploit = binary_write_uint( P#pk_GS2U_Ladder1v1BattleEnd.exploit ),
	Bin_rank = binary_write_uint( P#pk_GS2U_Ladder1v1BattleEnd.rank ),
	[
		<<?CMD_GS2U_Ladder1v1BattleEnd:16/little>>,
		Bin_result,
		Bin_exploit,
		Bin_rank
	];

%GENERATED from file:arena.h => GS2U_LadderTargetList
packNetMsg(#pk_GS2U_LadderTargetList{} = P) ->
	Bin_targets = binary_write_array(P#pk_GS2U_LadderTargetList.targets, fun(X) -> writeLadderTargetInfo( X ) end),
	Bin_selfInfo = writeSelfBattleInfo( P#pk_GS2U_LadderTargetList.selfInfo ),
	[
		<<?CMD_GS2U_LadderTargetList:16/little>>,
		Bin_targets,
		Bin_selfInfo
	];

%GENERATED from file:arena.h => GS2U_PrepareSec
packNetMsg(#pk_GS2U_PrepareSec{} = P) ->
	Bin_second = binary_write_uint8( P#pk_GS2U_PrepareSec.second ),
	[
		<<?CMD_GS2U_PrepareSec:16/little>>,
		Bin_second
	];

%GENERATED from file:arena.h => GS2U_ReturnKingList
packNetMsg(#pk_GS2U_ReturnKingList{} = P) ->
	Bin_kings = binary_write_array(P#pk_GS2U_ReturnKingList.kings, fun(X) -> writeKingRole( X ) end),
	[
		<<?CMD_GS2U_ReturnKingList:16/little>>,
		Bin_kings
	];

%GENERATED from file:arena.h => U2GS_ChallengeTargetByRank
packNetMsg(#pk_U2GS_ChallengeTargetByRank{} = P) ->
	Bin_ranksort = binary_write_uint( P#pk_U2GS_ChallengeTargetByRank.ranksort ),
	Bin_name = binary_write_string( P#pk_U2GS_ChallengeTargetByRank.name ),
	[
		<<?CMD_U2GS_ChallengeTargetByRank:16/little>>,
		Bin_ranksort,
		Bin_name
	];

%GENERATED from file:arena.h => U2GS_ChallengeTargetByRoleID
packNetMsg(#pk_U2GS_ChallengeTargetByRoleID{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_ChallengeTargetByRoleID.roleID ),
	[
		<<?CMD_U2GS_ChallengeTargetByRoleID:16/little>>,
		Bin_roleID
	];

%GENERATED from file:arena.h => U2GS_FreshLadderTargetList
packNetMsg(#pk_U2GS_FreshLadderTargetList{}) ->
	[
		<<?CMD_U2GS_FreshLadderTargetList:16/little>>

	];

%GENERATED from file:arena.h => U2GS_GiveUpChallenge
packNetMsg(#pk_U2GS_GiveUpChallenge{}) ->
	[
		<<?CMD_U2GS_GiveUpChallenge:16/little>>

	];

%GENERATED from file:arena.h => U2GS_OpenLadder1v1
packNetMsg(#pk_U2GS_OpenLadder1v1{}) ->
	[
		<<?CMD_U2GS_OpenLadder1v1:16/little>>

	];

%GENERATED from file:arena.h => U2GS_RequestBattleNotes
packNetMsg(#pk_U2GS_RequestBattleNotes{}) ->
	[
		<<?CMD_U2GS_RequestBattleNotes:16/little>>

	];

%GENERATED from file:arena.h => U2GS_RequestKingList
packNetMsg(#pk_U2GS_RequestKingList{}) ->
	[
		<<?CMD_U2GS_RequestKingList:16/little>>

	];

%GENERATED from file:arena.h => U2GS_RequestPlayerInfo
packNetMsg(#pk_U2GS_RequestPlayerInfo{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_RequestPlayerInfo.roleID ),
	[
		<<?CMD_U2GS_RequestPlayerInfo:16/little>>,
		Bin_roleID
	];

%GENERATED from file:arena.h => U2GS_WorshipTarget
packNetMsg(#pk_U2GS_WorshipTarget{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_WorshipTarget.roleID ),
	Bin_roleName = binary_write_string( P#pk_U2GS_WorshipTarget.roleName ),
	[
		<<?CMD_U2GS_WorshipTarget:16/little>>,
		Bin_roleID,
		Bin_roleName
	];

%GENERATED from file:bag.h => DelImpression
packNetMsg(#pk_DelImpression{} = P) ->
	Bin_uid = binary_write_uint16( P#pk_DelImpression.uid ),
	[
		<<?CMD_DelImpression:16/little>>,
		Bin_uid
	];

%GENERATED from file:bag.h => DelTag
packNetMsg(#pk_DelTag{} = P) ->
	Bin_index = binary_write_uint8( P#pk_DelTag.index ),
	[
		<<?CMD_DelTag:16/little>>,
		Bin_index
	];

%GENERATED from file:bag.h => GS2U_AddEquipItemToBag
packNetMsg(#pk_GS2U_AddEquipItemToBag{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_AddEquipItemToBag.type ),
	Bin_code = binary_write_uint64( P#pk_GS2U_AddEquipItemToBag.code ),
	Bin_items = binary_write_array(P#pk_GS2U_AddEquipItemToBag.items, fun(X) -> writeEquipItemInfo( X ) end),
	[
		<<?CMD_GS2U_AddEquipItemToBag:16/little>>,
		Bin_type,
		Bin_code,
		Bin_items
	];

%GENERATED from file:bag.h => GS2U_AddImpressionResult
packNetMsg(#pk_GS2U_AddImpressionResult{} = P) ->
	Bin_result = binary_write_bool( P#pk_GS2U_AddImpressionResult.result ),
	[
		<<?CMD_GS2U_AddImpressionResult:16/little>>,
		Bin_result
	];

%GENERATED from file:bag.h => GS2U_AddNormalItemToBag
packNetMsg(#pk_GS2U_AddNormalItemToBag{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_AddNormalItemToBag.type ),
	Bin_code = binary_write_uint64( P#pk_GS2U_AddNormalItemToBag.code ),
	Bin_addNum = binary_write_uint( P#pk_GS2U_AddNormalItemToBag.addNum ),
	Bin_items = binary_write_array(P#pk_GS2U_AddNormalItemToBag.items, fun(X) -> writeNormalItemInfo( X ) end),
	[
		<<?CMD_GS2U_AddNormalItemToBag:16/little>>,
		Bin_type,
		Bin_code,
		Bin_addNum,
		Bin_items
	];

%GENERATED from file:bag.h => GS2U_AddPraise
packNetMsg(#pk_GS2U_AddPraise{}) ->
	[
		<<?CMD_GS2U_AddPraise:16/little>>

	];

%GENERATED from file:bag.h => GS2U_AddTagResult
packNetMsg(#pk_GS2U_AddTagResult{} = P) ->
	Bin_result = binary_write_bool( P#pk_GS2U_AddTagResult.result ),
	[
		<<?CMD_GS2U_AddTagResult:16/little>>,
		Bin_result
	];

%GENERATED from file:bag.h => GS2U_DeleteGoods
packNetMsg(#pk_GS2U_DeleteGoods{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_DeleteGoods.type ),
	Bin_goodsUIDs = binary_write_array(P#pk_GS2U_DeleteGoods.goodsUIDs, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_GS2U_DeleteGoods:16/little>>,
		Bin_type,
		Bin_goodsUIDs
	];

%GENERATED from file:bag.h => GS2U_EquipEnhancedProp
packNetMsg(#pk_GS2U_EquipEnhancedProp{} = P) ->
	Bin_equipUID = binary_write_uint64( P#pk_GS2U_EquipEnhancedProp.equipUID ),
	Bin_enProps = binary_write_array(P#pk_GS2U_EquipEnhancedProp.enProps, fun(X) -> writeEquipEnhancedProp( X ) end),
	Bin_price = binary_write_uint( P#pk_GS2U_EquipEnhancedProp.price ),
	[
		<<?CMD_GS2U_EquipEnhancedProp:16/little>>,
		Bin_equipUID,
		Bin_enProps,
		Bin_price
	];

%GENERATED from file:bag.h => GS2U_EquipGemInfoUpdate
packNetMsg(#pk_GS2U_EquipGemInfoUpdate{} = P) ->
	Bin_equipGemInfo = writeEquipGemInfo( P#pk_GS2U_EquipGemInfoUpdate.equipGemInfo ),
	[
		<<?CMD_GS2U_EquipGemInfoUpdate:16/little>>,
		Bin_equipGemInfo
	];

%GENERATED from file:bag.h => GS2U_EquipGemInfos
packNetMsg(#pk_GS2U_EquipGemInfos{} = P) ->
	Bin_equipGemInfos = binary_write_array(P#pk_GS2U_EquipGemInfos.equipGemInfos, fun(X) -> writeEquipGemInfo( X ) end),
	[
		<<?CMD_GS2U_EquipGemInfos:16/little>>,
		Bin_equipGemInfos
	];

%GENERATED from file:bag.h => GS2U_EquipRecastInfo
packNetMsg(#pk_GS2U_EquipRecastInfo{} = P) ->
	Bin_recastInfo = writeRecastPosInfo( P#pk_GS2U_EquipRecastInfo.recastInfo ),
	[
		<<?CMD_GS2U_EquipRecastInfo:16/little>>,
		Bin_recastInfo
	];

%GENERATED from file:bag.h => GS2U_EquipRecastInfoInit
packNetMsg(#pk_GS2U_EquipRecastInfoInit{} = P) ->
	Bin_recastInfoList = binary_write_array(P#pk_GS2U_EquipRecastInfoInit.recastInfoList, fun(X) -> writeRecastPosInfo( X ) end),
	[
		<<?CMD_GS2U_EquipRecastInfoInit:16/little>>,
		Bin_recastInfoList
	];

%GENERATED from file:bag.h => GS2U_EquipRecastProp
packNetMsg(#pk_GS2U_EquipRecastProp{} = P) ->
	Bin_equipPos = binary_write_uint16( P#pk_GS2U_EquipRecastProp.equipPos ),
	Bin_recastVal = binary_write_uint( P#pk_GS2U_EquipRecastProp.recastVal ),
	Bin_recastType = binary_write_uint16( P#pk_GS2U_EquipRecastProp.recastType ),
	Bin_resultList = binary_write_array(P#pk_GS2U_EquipRecastProp.resultList, fun(X) -> writeRecastResultInfo( X ) end),
	[
		<<?CMD_GS2U_EquipRecastProp:16/little>>,
		Bin_equipPos,
		Bin_recastVal,
		Bin_recastType,
		Bin_resultList
	];

%GENERATED from file:bag.h => GS2U_EquipRefineLevel
packNetMsg(#pk_GS2U_EquipRefineLevel{} = P) ->
	Bin_equipRefines = binary_write_array(P#pk_GS2U_EquipRefineLevel.equipRefines, fun(X) -> writeEquipRefineLevel( X ) end),
	[
		<<?CMD_GS2U_EquipRefineLevel:16/little>>,
		Bin_equipRefines
	];

%GENERATED from file:bag.h => GS2U_EquipRefineResult
packNetMsg(#pk_GS2U_EquipRefineResult{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_EquipRefineResult.code ),
	Bin_type = binary_write_uint8( P#pk_GS2U_EquipRefineResult.type ),
	Bin_level = binary_write_uint8( P#pk_GS2U_EquipRefineResult.level ),
	[
		<<?CMD_GS2U_EquipRefineResult:16/little>>,
		Bin_code,
		Bin_type,
		Bin_level
	];

%GENERATED from file:bag.h => GS2U_EquipRefineResultOneKey
packNetMsg(#pk_GS2U_EquipRefineResultOneKey{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_EquipRefineResultOneKey.code ),
	Bin_levelOld = binary_write_uint8( P#pk_GS2U_EquipRefineResultOneKey.levelOld ),
	Bin_levelNew = binary_write_uint8( P#pk_GS2U_EquipRefineResultOneKey.levelNew ),
	Bin_typeList = binary_write_array(P#pk_GS2U_EquipRefineResultOneKey.typeList, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_GS2U_EquipRefineResultOneKey:16/little>>,
		Bin_code,
		Bin_levelOld,
		Bin_levelNew,
		Bin_typeList
	];

%GENERATED from file:bag.h => GS2U_EquipUpStarInfoList
packNetMsg(#pk_GS2U_EquipUpStarInfoList{} = P) ->
	Bin_equipUpStars = binary_write_array(P#pk_GS2U_EquipUpStarInfoList.equipUpStars, fun(X) -> writeEquipUpStarInfo( X ) end),
	[
		<<?CMD_GS2U_EquipUpStarInfoList:16/little>>,
		Bin_equipUpStars
	];

%GENERATED from file:bag.h => GS2U_EquipUpStarRes
packNetMsg(#pk_GS2U_EquipUpStarRes{} = P) ->
	Bin_equipUpStarInfo = writeEquipUpStarInfo( P#pk_GS2U_EquipUpStarRes.equipUpStarInfo ),
	Bin_type = binary_write_uint8( P#pk_GS2U_EquipUpStarRes.type ),
	Bin_index = binary_write_uint16( P#pk_GS2U_EquipUpStarRes.index ),
	Bin_costList = binary_write_array(P#pk_GS2U_EquipUpStarRes.costList, fun(X) -> writestarCostItem( X ) end),
	Bin_coin = binary_write_uint( P#pk_GS2U_EquipUpStarRes.coin ),
	Bin_res = binary_write_uint8( P#pk_GS2U_EquipUpStarRes.res ),
	[
		<<?CMD_GS2U_EquipUpStarRes:16/little>>,
		Bin_equipUpStarInfo,
		Bin_type,
		Bin_index,
		Bin_costList,
		Bin_coin,
		Bin_res
	];

%GENERATED from file:bag.h => GS2U_ExchangeResult
packNetMsg(#pk_GS2U_ExchangeResult{} = P) ->
	Bin_id = binary_write_uint( P#pk_GS2U_ExchangeResult.id ),
	Bin_itemCount = binary_write_uint16( P#pk_GS2U_ExchangeResult.itemCount ),
	[
		<<?CMD_GS2U_ExchangeResult:16/little>>,
		Bin_id,
		Bin_itemCount
	];

%GENERATED from file:bag.h => GS2U_Forbidden_Load_Photo
packNetMsg(#pk_GS2U_Forbidden_Load_Photo{} = P) ->
	Bin_forbiddenTime = binary_write_uint64( P#pk_GS2U_Forbidden_Load_Photo.forbiddenTime ),
	[
		<<?CMD_GS2U_Forbidden_Load_Photo:16/little>>,
		Bin_forbiddenTime
	];

%GENERATED from file:bag.h => GS2U_GainPraise
packNetMsg(#pk_GS2U_GainPraise{}) ->
	[
		<<?CMD_GS2U_GainPraise:16/little>>

	];

%GENERATED from file:bag.h => GS2U_GemEmbedAdd
packNetMsg(#pk_GS2U_GemEmbedAdd{} = P) ->
	Bin_gemEmbedInfo = writeGemEmbedInfo( P#pk_GS2U_GemEmbedAdd.gemEmbedInfo ),
	[
		<<?CMD_GS2U_GemEmbedAdd:16/little>>,
		Bin_gemEmbedInfo
	];

%GENERATED from file:bag.h => GS2U_GemEmbedDelete
packNetMsg(#pk_GS2U_GemEmbedDelete{} = P) ->
	Bin_gemUIDs = binary_write_array(P#pk_GS2U_GemEmbedDelete.gemUIDs, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_GS2U_GemEmbedDelete:16/little>>,
		Bin_gemUIDs
	];

%GENERATED from file:bag.h => GS2U_GemEmbedInit
packNetMsg(#pk_GS2U_GemEmbedInit{} = P) ->
	Bin_gemEmbedInfos = binary_write_array(P#pk_GS2U_GemEmbedInit.gemEmbedInfos, fun(X) -> writeGemEmbedInfo( X ) end),
	[
		<<?CMD_GS2U_GemEmbedInit:16/little>>,
		Bin_gemEmbedInfos
	];

%GENERATED from file:bag.h => GS2U_GemEmbedMakeResult
packNetMsg(#pk_GS2U_GemEmbedMakeResult{} = P) ->
	Bin_gemUID = binary_write_uint64( P#pk_GS2U_GemEmbedMakeResult.gemUID ),
	[
		<<?CMD_GS2U_GemEmbedMakeResult:16/little>>,
		Bin_gemUID
	];

%GENERATED from file:bag.h => GS2U_GetEssenceNum
packNetMsg(#pk_GS2U_GetEssenceNum{} = P) ->
	Bin_purpleEssence = binary_write_uint( P#pk_GS2U_GetEssenceNum.purpleEssence ),
	Bin_goldenEssence = binary_write_uint( P#pk_GS2U_GetEssenceNum.goldenEssence ),
	[
		<<?CMD_GS2U_GetEssenceNum:16/little>>,
		Bin_purpleEssence,
		Bin_goldenEssence
	];

%GENERATED from file:bag.h => GS2U_InitEquip
packNetMsg(#pk_GS2U_InitEquip{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_InitEquip.type ),
	Bin_items = binary_write_array(P#pk_GS2U_InitEquip.items, fun(X) -> writeEquipItemInfo( X ) end),
	[
		<<?CMD_GS2U_InitEquip:16/little>>,
		Bin_type,
		Bin_items
	];

%GENERATED from file:bag.h => GS2U_InitItem
packNetMsg(#pk_GS2U_InitItem{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_InitItem.type ),
	Bin_items = binary_write_array(P#pk_GS2U_InitItem.items, fun(X) -> writeNormalItemInfo( X ) end),
	[
		<<?CMD_GS2U_InitItem:16/little>>,
		Bin_type,
		Bin_items
	];

%GENERATED from file:bag.h => GS2U_InitRecycle
packNetMsg(#pk_GS2U_InitRecycle{} = P) ->
	Bin_items = binary_write_array(P#pk_GS2U_InitRecycle.items, fun(X) -> writeRecycleItem( X ) end),
	Bin_equips = binary_write_array(P#pk_GS2U_InitRecycle.equips, fun(X) -> writeRecycleEquip( X ) end),
	[
		<<?CMD_GS2U_InitRecycle:16/little>>,
		Bin_items,
		Bin_equips
	];

%GENERATED from file:bag.h => GS2U_InitSlot
packNetMsg(#pk_GS2U_InitSlot{} = P) ->
	Bin_slots = binary_write_array(P#pk_GS2U_InitSlot.slots, fun(X) -> writeBagSlot( X ) end),
	[
		<<?CMD_GS2U_InitSlot:16/little>>,
		Bin_slots
	];

%GENERATED from file:bag.h => GS2U_LockGoods
packNetMsg(#pk_GS2U_LockGoods{} = P) ->
	Bin_goodsUID = binary_write_uint64( P#pk_GS2U_LockGoods.goodsUID ),
	Bin_bagType = binary_write_uint8( P#pk_GS2U_LockGoods.bagType ),
	Bin_isLocked = binary_write_bool( P#pk_GS2U_LockGoods.isLocked ),
	[
		<<?CMD_GS2U_LockGoods:16/little>>,
		Bin_goodsUID,
		Bin_bagType,
		Bin_isLocked
	];

%GENERATED from file:bag.h => GS2U_LookRPInfo_Fashion
packNetMsg(#pk_GS2U_LookRPInfo_Fashion{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_LookRPInfo_Fashion.roleID ),
	Bin_datas = binary_write_array(P#pk_GS2U_LookRPInfo_Fashion.datas, fun(X) -> writeRPView_FashionInfo( X ) end),
	Bin_activeFashionSuitList = binary_write_array(P#pk_GS2U_LookRPInfo_Fashion.activeFashionSuitList, fun(X) -> binary_write_uint( X ) end),
	[
		<<?CMD_GS2U_LookRPInfo_Fashion:16/little>>,
		Bin_roleID,
		Bin_datas,
		Bin_activeFashionSuitList
	];

%GENERATED from file:bag.h => GS2U_LookRPInfo_Marriage
packNetMsg(#pk_GS2U_LookRPInfo_Marriage{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_LookRPInfo_Marriage.roleID ),
	Bin_id = binary_write_uint64( P#pk_GS2U_LookRPInfo_Marriage.id ),
	Bin_name = binary_write_string( P#pk_GS2U_LookRPInfo_Marriage.name ),
	Bin_sex = binary_write_uint8( P#pk_GS2U_LookRPInfo_Marriage.sex ),
	Bin_weddingDay = binary_write_uint( P#pk_GS2U_LookRPInfo_Marriage.weddingDay ),
	Bin_closeness = binary_write_uint( P#pk_GS2U_LookRPInfo_Marriage.closeness ),
	[
		<<?CMD_GS2U_LookRPInfo_Marriage:16/little>>,
		Bin_roleID,
		Bin_id,
		Bin_name,
		Bin_sex,
		Bin_weddingDay,
		Bin_closeness
	];

%GENERATED from file:bag.h => GS2U_LookRPInfo_Pet
packNetMsg(#pk_GS2U_LookRPInfo_Pet{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_LookRPInfo_Pet.roleID ),
	Bin_petInfoList = binary_write_array(P#pk_GS2U_LookRPInfo_Pet.petInfoList, fun(X) -> writeRPView_PetBaseInfo( X ) end),
	Bin_infoList = binary_write_array(P#pk_GS2U_LookRPInfo_Pet.infoList, fun(X) -> writeRPView_AssistBattleInfo( X ) end),
	[
		<<?CMD_GS2U_LookRPInfo_Pet:16/little>>,
		Bin_roleID,
		Bin_petInfoList,
		Bin_infoList
	];

%GENERATED from file:bag.h => GS2U_LookRPInfo_Result
packNetMsg(#pk_GS2U_LookRPInfo_Result{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_LookRPInfo_Result.roleID ),
	Bin_roleName = binary_write_string( P#pk_GS2U_LookRPInfo_Result.roleName ),
	Bin_career = binary_write_uint( P#pk_GS2U_LookRPInfo_Result.career ),
	Bin_race = binary_write_int8( P#pk_GS2U_LookRPInfo_Result.race ),
	Bin_sex = binary_write_int8( P#pk_GS2U_LookRPInfo_Result.sex ),
	Bin_head = binary_write_uint( P#pk_GS2U_LookRPInfo_Result.head ),
	Bin_level = binary_write_uint8( P#pk_GS2U_LookRPInfo_Result.level ),
	Bin_roleForce = binary_write_uint( P#pk_GS2U_LookRPInfo_Result.roleForce ),
	Bin_equipHonorLevel = binary_write_uint8( P#pk_GS2U_LookRPInfo_Result.equipHonorLevel ),
	Bin_guildName = binary_write_string( P#pk_GS2U_LookRPInfo_Result.guildName ),
	Bin_playerKillValue = binary_write_int( P#pk_GS2U_LookRPInfo_Result.playerKillValue ),
	Bin_wingLevel = binary_write_int( P#pk_GS2U_LookRPInfo_Result.wingLevel ),
	Bin_propValues = binary_write_array(P#pk_GS2U_LookRPInfo_Result.propValues, fun(X) -> binary_write_float( X ) end),
	Bin_equips = binary_write_array(P#pk_GS2U_LookRPInfo_Result.equips, fun(X) -> writeEquipItemInfo( X ) end),
	Bin_fashionList = binary_write_array(P#pk_GS2U_LookRPInfo_Result.fashionList, fun(X) -> binary_write_uint( X ) end),
	Bin_equipRefines = binary_write_array(P#pk_GS2U_LookRPInfo_Result.equipRefines, fun(X) -> writeEquipRefineLevel( X ) end),
	Bin_equipStar = binary_write_array(P#pk_GS2U_LookRPInfo_Result.equipStar, fun(X) -> writeEquipStarLevel( X ) end),
	[
		<<?CMD_GS2U_LookRPInfo_Result:16/little>>,
		Bin_roleID,
		Bin_roleName,
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_head,
		Bin_level,
		Bin_roleForce,
		Bin_equipHonorLevel,
		Bin_guildName,
		Bin_playerKillValue,
		Bin_wingLevel,
		Bin_propValues,
		Bin_equips,
		Bin_fashionList,
		Bin_equipRefines,
		Bin_equipStar
	];

%GENERATED from file:bag.h => GS2U_PlayerExtenInfo
packNetMsg(#pk_GS2U_PlayerExtenInfo{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_PlayerExtenInfo.type ),
	[
		<<?CMD_GS2U_PlayerExtenInfo:16/little>>,
		Bin_type
	];

%GENERATED from file:bag.h => GS2U_QueryEquipResult
packNetMsg(#pk_GS2U_QueryEquipResult{} = P) ->
	Bin_equipInfo = writeEquipItemInfo( P#pk_GS2U_QueryEquipResult.equipInfo ),
	[
		<<?CMD_GS2U_QueryEquipResult:16/little>>,
		Bin_equipInfo
	];

%GENERATED from file:bag.h => GS2U_QueryItemResult
packNetMsg(#pk_GS2U_QueryItemResult{} = P) ->
	Bin_itemInfo = writeNormalItemInfo( P#pk_GS2U_QueryItemResult.itemInfo ),
	[
		<<?CMD_GS2U_QueryItemResult:16/little>>,
		Bin_itemInfo
	];

%GENERATED from file:bag.h => GS2U_Report
packNetMsg(#pk_GS2U_Report{}) ->
	[
		<<?CMD_GS2U_Report:16/little>>

	];

%GENERATED from file:bag.h => GS2U_Report_Max
packNetMsg(#pk_GS2U_Report_Max{}) ->
	[
		<<?CMD_GS2U_Report_Max:16/little>>

	];

%GENERATED from file:bag.h => GS2U_RequesBuyIDAck
packNetMsg(#pk_GS2U_RequesBuyIDAck{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_RequesBuyIDAck.type ),
	Bin_id = binary_write_uint( P#pk_GS2U_RequesBuyIDAck.id ),
	Bin_succ = binary_write_bool( P#pk_GS2U_RequesBuyIDAck.succ ),
	[
		<<?CMD_GS2U_RequesBuyIDAck:16/little>>,
		Bin_type,
		Bin_id,
		Bin_succ
	];

%GENERATED from file:bag.h => GS2U_RequestExchangeResourceForeverLimitIDAck
packNetMsg(#pk_GS2U_RequestExchangeResourceForeverLimitIDAck{} = P) ->
	Bin_iDList = binary_write_array(P#pk_GS2U_RequestExchangeResourceForeverLimitIDAck.iDList, fun(X) -> binary_write_uint16( X ) end),
	[
		<<?CMD_GS2U_RequestExchangeResourceForeverLimitIDAck:16/little>>,
		Bin_iDList
	];

%GENERATED from file:bag.h => GS2U_RequestForeverLimitIDAck
packNetMsg(#pk_GS2U_RequestForeverLimitIDAck{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_RequestForeverLimitIDAck.type ),
	Bin_iDList = binary_write_array(P#pk_GS2U_RequestForeverLimitIDAck.iDList, fun(X) -> binary_write_uint16( X ) end),
	[
		<<?CMD_GS2U_RequestForeverLimitIDAck:16/little>>,
		Bin_type,
		Bin_iDList
	];

%GENERATED from file:bag.h => GS2U_ResourceExchangeList
packNetMsg(#pk_GS2U_ResourceExchangeList{} = P) ->
	Bin_resources = binary_write_array(P#pk_GS2U_ResourceExchangeList.resources, fun(X) -> writeExchangeResource( X ) end),
	[
		<<?CMD_GS2U_ResourceExchangeList:16/little>>,
		Bin_resources
	];

%GENERATED from file:bag.h => GS2U_UpLoadingPhotoResult
packNetMsg(#pk_GS2U_UpLoadingPhotoResult{} = P) ->
	Bin_result = binary_write_bool( P#pk_GS2U_UpLoadingPhotoResult.result ),
	[
		<<?CMD_GS2U_UpLoadingPhotoResult:16/little>>,
		Bin_result
	];

%GENERATED from file:bag.h => GS2U_UpdateEquipItem
packNetMsg(#pk_GS2U_UpdateEquipItem{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_UpdateEquipItem.type ),
	Bin_operate = binary_write_uint8( P#pk_GS2U_UpdateEquipItem.operate ),
	Bin_items = binary_write_array(P#pk_GS2U_UpdateEquipItem.items, fun(X) -> writeEquipItemInfo( X ) end),
	[
		<<?CMD_GS2U_UpdateEquipItem:16/little>>,
		Bin_type,
		Bin_operate,
		Bin_items
	];

%GENERATED from file:bag.h => GS2U_UpdateNormalItem
packNetMsg(#pk_GS2U_UpdateNormalItem{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_UpdateNormalItem.type ),
	Bin_items = binary_write_array(P#pk_GS2U_UpdateNormalItem.items, fun(X) -> writeNormalItemInfo( X ) end),
	[
		<<?CMD_GS2U_UpdateNormalItem:16/little>>,
		Bin_type,
		Bin_items
	];

%GENERATED from file:bag.h => MoveGoods
packNetMsg(#pk_MoveGoods{} = P) ->
	Bin_itemUID = binary_write_uint64( P#pk_MoveGoods.itemUID ),
	Bin_source = binary_write_uint8( P#pk_MoveGoods.source ),
	Bin_target = binary_write_uint8( P#pk_MoveGoods.target ),
	[
		<<?CMD_MoveGoods:16/little>>,
		Bin_itemUID,
		Bin_source,
		Bin_target
	];

%GENERATED from file:bag.h => OpenNewBagSlot
packNetMsg(#pk_OpenNewBagSlot{} = P) ->
	Bin_bagType = binary_write_uint8( P#pk_OpenNewBagSlot.bagType ),
	Bin_openNum = binary_write_uint8( P#pk_OpenNewBagSlot.openNum ),
	[
		<<?CMD_OpenNewBagSlot:16/little>>,
		Bin_bagType,
		Bin_openNum
	];

%GENERATED from file:bag.h => U2GS_AddImpression
packNetMsg(#pk_U2GS_AddImpression{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_AddImpression.roleID ),
	Bin_impression = binary_write_string( P#pk_U2GS_AddImpression.impression ),
	[
		<<?CMD_U2GS_AddImpression:16/little>>,
		Bin_roleID,
		Bin_impression
	];

%GENERATED from file:bag.h => U2GS_AddPraise
packNetMsg(#pk_U2GS_AddPraise{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_AddPraise.roleID ),
	[
		<<?CMD_U2GS_AddPraise:16/little>>,
		Bin_roleID
	];

%GENERATED from file:bag.h => U2GS_AddTag
packNetMsg(#pk_U2GS_AddTag{} = P) ->
	Bin_tag = binary_write_string( P#pk_U2GS_AddTag.tag ),
	[
		<<?CMD_U2GS_AddTag:16/little>>,
		Bin_tag
	];

%GENERATED from file:bag.h => U2GS_EquipEnhanced
packNetMsg(#pk_U2GS_EquipEnhanced{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_EquipEnhanced.type ),
	Bin_equipUID = binary_write_uint64( P#pk_U2GS_EquipEnhanced.equipUID ),
	[
		<<?CMD_U2GS_EquipEnhanced:16/little>>,
		Bin_type,
		Bin_equipUID
	];

%GENERATED from file:bag.h => U2GS_EquipRecast
packNetMsg(#pk_U2GS_EquipRecast{} = P) ->
	Bin_equipPos = binary_write_uint16( P#pk_U2GS_EquipRecast.equipPos ),
	Bin_recastType = binary_write_uint16( P#pk_U2GS_EquipRecast.recastType ),
	Bin_opType = binary_write_uint16( P#pk_U2GS_EquipRecast.opType ),
	Bin_locklist = binary_write_array(P#pk_U2GS_EquipRecast.locklist, fun(X) -> binary_write_uint16( X ) end),
	[
		<<?CMD_U2GS_EquipRecast:16/little>>,
		Bin_equipPos,
		Bin_recastType,
		Bin_opType,
		Bin_locklist
	];

%GENERATED from file:bag.h => U2GS_EquipRefine
packNetMsg(#pk_U2GS_EquipRefine{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_EquipRefine.type ),
	[
		<<?CMD_U2GS_EquipRefine:16/little>>,
		Bin_type
	];

%GENERATED from file:bag.h => U2GS_EquipRefineOneKey
packNetMsg(#pk_U2GS_EquipRefineOneKey{}) ->
	[
		<<?CMD_U2GS_EquipRefineOneKey:16/little>>

	];

%GENERATED from file:bag.h => U2GS_EquipResolve
packNetMsg(#pk_U2GS_EquipResolve{} = P) ->
	Bin_equipUIDs = binary_write_array(P#pk_U2GS_EquipResolve.equipUIDs, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_U2GS_EquipResolve:16/little>>,
		Bin_equipUIDs
	];

%GENERATED from file:bag.h => U2GS_EquipUpStar
packNetMsg(#pk_U2GS_EquipUpStar{} = P) ->
	Bin_pos = binary_write_uint8( P#pk_U2GS_EquipUpStar.pos ),
	Bin_type = binary_write_uint8( P#pk_U2GS_EquipUpStar.type ),
	[
		<<?CMD_U2GS_EquipUpStar:16/little>>,
		Bin_pos,
		Bin_type
	];

%GENERATED from file:bag.h => U2GS_EquipUpStarOneKey
packNetMsg(#pk_U2GS_EquipUpStarOneKey{}) ->
	[
		<<?CMD_U2GS_EquipUpStarOneKey:16/little>>

	];

%GENERATED from file:bag.h => U2GS_GemEmbedMake
packNetMsg(#pk_U2GS_GemEmbedMake{} = P) ->
	Bin_id = binary_write_uint( P#pk_U2GS_GemEmbedMake.id ),
	Bin_count = binary_write_uint( P#pk_U2GS_GemEmbedMake.count ),
	Bin_flag = binary_write_uint8( P#pk_U2GS_GemEmbedMake.flag ),
	[
		<<?CMD_U2GS_GemEmbedMake:16/little>>,
		Bin_id,
		Bin_count,
		Bin_flag
	];

%GENERATED from file:bag.h => U2GS_GemEmbedMakeOnce
packNetMsg(#pk_U2GS_GemEmbedMakeOnce{} = P) ->
	Bin_id = binary_write_uint( P#pk_U2GS_GemEmbedMakeOnce.id ),
	Bin_bindCount = binary_write_uint( P#pk_U2GS_GemEmbedMakeOnce.bindCount ),
	Bin_unBindCount = binary_write_uint( P#pk_U2GS_GemEmbedMakeOnce.unBindCount ),
	[
		<<?CMD_U2GS_GemEmbedMakeOnce:16/little>>,
		Bin_id,
		Bin_bindCount,
		Bin_unBindCount
	];

%GENERATED from file:bag.h => U2GS_GemEmbedOff
packNetMsg(#pk_U2GS_GemEmbedOff{} = P) ->
	Bin_gemUIDs = binary_write_array(P#pk_U2GS_GemEmbedOff.gemUIDs, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_U2GS_GemEmbedOff:16/little>>,
		Bin_gemUIDs
	];

%GENERATED from file:bag.h => U2GS_GemEmbedOn
packNetMsg(#pk_U2GS_GemEmbedOn{} = P) ->
	Bin_gemEmbedInfoList = binary_write_array(P#pk_U2GS_GemEmbedOn.gemEmbedInfoList, fun(X) -> writeGemEmbedInfo( X ) end),
	[
		<<?CMD_U2GS_GemEmbedOn:16/little>>,
		Bin_gemEmbedInfoList
	];

%GENERATED from file:bag.h => U2GS_GemOperate
packNetMsg(#pk_U2GS_GemOperate{} = P) ->
	Bin_opType = binary_write_uint16( P#pk_U2GS_GemOperate.opType ),
	Bin_equipPos = binary_write_uint16( P#pk_U2GS_GemOperate.equipPos ),
	Bin_gemPos = binary_write_uint8( P#pk_U2GS_GemOperate.gemPos ),
	Bin_params = binary_write_uint64( P#pk_U2GS_GemOperate.params ),
	[
		<<?CMD_U2GS_GemOperate:16/little>>,
		Bin_opType,
		Bin_equipPos,
		Bin_gemPos,
		Bin_params
	];

%GENERATED from file:bag.h => U2GS_HonorLevel
packNetMsg(#pk_U2GS_HonorLevel{}) ->
	[
		<<?CMD_U2GS_HonorLevel:16/little>>

	];

%GENERATED from file:bag.h => U2GS_LockGoods
packNetMsg(#pk_U2GS_LockGoods{} = P) ->
	Bin_goodsUID = binary_write_uint64( P#pk_U2GS_LockGoods.goodsUID ),
	Bin_bagType = binary_write_uint8( P#pk_U2GS_LockGoods.bagType ),
	[
		<<?CMD_U2GS_LockGoods:16/little>>,
		Bin_goodsUID,
		Bin_bagType
	];

%GENERATED from file:bag.h => U2GS_LookRPInfo_Request
packNetMsg(#pk_U2GS_LookRPInfo_Request{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_LookRPInfo_Request.roleID ),
	Bin_view_type = binary_write_uint8( P#pk_U2GS_LookRPInfo_Request.view_type ),
	[
		<<?CMD_U2GS_LookRPInfo_Request:16/little>>,
		Bin_roleID,
		Bin_view_type
	];

%GENERATED from file:bag.h => U2GS_PlayerExtenInfo
packNetMsg(#pk_U2GS_PlayerExtenInfo{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_PlayerExtenInfo.type ),
	Bin_info = binary_write_string( P#pk_U2GS_PlayerExtenInfo.info ),
	[
		<<?CMD_U2GS_PlayerExtenInfo:16/little>>,
		Bin_type,
		Bin_info
	];

%GENERATED from file:bag.h => U2GS_QueryEquipByUID
packNetMsg(#pk_U2GS_QueryEquipByUID{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_QueryEquipByUID.roleID ),
	Bin_equipUID = binary_write_uint64( P#pk_U2GS_QueryEquipByUID.equipUID ),
	[
		<<?CMD_U2GS_QueryEquipByUID:16/little>>,
		Bin_roleID,
		Bin_equipUID
	];

%GENERATED from file:bag.h => U2GS_Report
packNetMsg(#pk_U2GS_Report{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_Report.roleID ),
	[
		<<?CMD_U2GS_Report:16/little>>,
		Bin_roleID
	];

%GENERATED from file:bag.h => U2GS_RequesBuyID
packNetMsg(#pk_U2GS_RequesBuyID{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_RequesBuyID.type ),
	Bin_id = binary_write_uint( P#pk_U2GS_RequesBuyID.id ),
	[
		<<?CMD_U2GS_RequesBuyID:16/little>>,
		Bin_type,
		Bin_id
	];

%GENERATED from file:bag.h => U2GS_RequesForeverLimitID
packNetMsg(#pk_U2GS_RequesForeverLimitID{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_RequesForeverLimitID.type ),
	[
		<<?CMD_U2GS_RequesForeverLimitID:16/little>>,
		Bin_type
	];

%GENERATED from file:bag.h => U2GS_RequestExchangeResource
packNetMsg(#pk_U2GS_RequestExchangeResource{}) ->
	[
		<<?CMD_U2GS_RequestExchangeResource:16/little>>

	];

%GENERATED from file:bag.h => U2GS_RequestExchangeResourceForeverLimitID
packNetMsg(#pk_U2GS_RequestExchangeResourceForeverLimitID{}) ->
	[
		<<?CMD_U2GS_RequestExchangeResourceForeverLimitID:16/little>>

	];

%GENERATED from file:bag.h => U2GS_ResourceExchange
packNetMsg(#pk_U2GS_ResourceExchange{} = P) ->
	Bin_id = binary_write_uint( P#pk_U2GS_ResourceExchange.id ),
	Bin_itemCount = binary_write_uint16( P#pk_U2GS_ResourceExchange.itemCount ),
	Bin_opType = binary_write_uint16( P#pk_U2GS_ResourceExchange.opType ),
	[
		<<?CMD_U2GS_ResourceExchange:16/little>>,
		Bin_id,
		Bin_itemCount,
		Bin_opType
	];

%GENERATED from file:bag.h => U2GS_SellAllEquip
packNetMsg(#pk_U2GS_SellAllEquip{}) ->
	[
		<<?CMD_U2GS_SellAllEquip:16/little>>

	];

%GENERATED from file:bag.h => U2GS_SharedEquip
packNetMsg(#pk_U2GS_SharedEquip{} = P) ->
	Bin_equipUIDs = binary_write_array(P#pk_U2GS_SharedEquip.equipUIDs, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_U2GS_SharedEquip:16/little>>,
		Bin_equipUIDs
	];

%GENERATED from file:bag.h => U2GS_SortItem
packNetMsg(#pk_U2GS_SortItem{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_SortItem.type ),
	[
		<<?CMD_U2GS_SortItem:16/little>>,
		Bin_type
	];

%GENERATED from file:bag.h => U2GS_UseItem
packNetMsg(#pk_U2GS_UseItem{} = P) ->
	Bin_itemUID = binary_write_uint64( P#pk_U2GS_UseItem.itemUID ),
	Bin_useNum = binary_write_uint16( P#pk_U2GS_UseItem.useNum ),
	[
		<<?CMD_U2GS_UseItem:16/little>>,
		Bin_itemUID,
		Bin_useNum
	];

%GENERATED from file:bag.h => UpLoadingPhoto
packNetMsg(#pk_UpLoadingPhoto{} = P) ->
	Bin_type = binary_write_uint8( P#pk_UpLoadingPhoto.type ),
	Bin_roleID = binary_write_uint64( P#pk_UpLoadingPhoto.roleID ),
	Bin_sectionNum = binary_write_uint8( P#pk_UpLoadingPhoto.sectionNum ),
	Bin_sectionIndex = binary_write_uint8( P#pk_UpLoadingPhoto.sectionIndex ),
	Bin_data = binary_write_array(P#pk_UpLoadingPhoto.data, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_UpLoadingPhoto:16/little>>,
		Bin_type,
		Bin_roleID,
		Bin_sectionNum,
		Bin_sectionIndex,
		Bin_data
	];

%GENERATED from file:battle.h => C2S_PlayerUseShiftSkill
packNetMsg(#pk_C2S_PlayerUseShiftSkill{} = P) ->
	Bin_code = binary_write_uint64( P#pk_C2S_PlayerUseShiftSkill.code ),
	Bin_skillId = binary_write_uint( P#pk_C2S_PlayerUseShiftSkill.skillId ),
	Bin_serial = binary_write_uint( P#pk_C2S_PlayerUseShiftSkill.serial ),
	Bin_targetCodeList = binary_write_array(P#pk_C2S_PlayerUseShiftSkill.targetCodeList, fun(X) -> binary_write_uint64( X ) end),
	Bin_x = binary_write_float( P#pk_C2S_PlayerUseShiftSkill.x ),
	Bin_y = binary_write_float( P#pk_C2S_PlayerUseShiftSkill.y ),
	[
		<<?CMD_C2S_PlayerUseShiftSkill:16/little>>,
		Bin_code,
		Bin_skillId,
		Bin_serial,
		Bin_targetCodeList,
		Bin_x,
		Bin_y
	];

%GENERATED from file:battle.h => C2S_PlayerUseSkill
packNetMsg(#pk_C2S_PlayerUseSkill{} = P) ->
	Bin_code = binary_write_uint64( P#pk_C2S_PlayerUseSkill.code ),
	Bin_skillId = binary_write_uint64( P#pk_C2S_PlayerUseSkill.skillId ),
	Bin_serial = binary_write_uint( P#pk_C2S_PlayerUseSkill.serial ),
	Bin_targetCodeList = binary_write_array(P#pk_C2S_PlayerUseSkill.targetCodeList, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_C2S_PlayerUseSkill:16/little>>,
		Bin_code,
		Bin_skillId,
		Bin_serial,
		Bin_targetCodeList
	];

%GENERATED from file:battle.h => GS2U_AttackOffsetEffect
packNetMsg(#pk_GS2U_AttackOffsetEffect{} = P) ->
	Bin_userCode = binary_write_uint64( P#pk_GS2U_AttackOffsetEffect.userCode ),
	Bin_targetCode = binary_write_uint64( P#pk_GS2U_AttackOffsetEffect.targetCode ),
	Bin_skillId = binary_write_uint( P#pk_GS2U_AttackOffsetEffect.skillId ),
	Bin_serial = binary_write_uint( P#pk_GS2U_AttackOffsetEffect.serial ),
	Bin_code = binary_write_uint64( P#pk_GS2U_AttackOffsetEffect.code ),
	Bin_x = binary_write_float( P#pk_GS2U_AttackOffsetEffect.x ),
	Bin_y = binary_write_float( P#pk_GS2U_AttackOffsetEffect.y ),
	[
		<<?CMD_GS2U_AttackOffsetEffect:16/little>>,
		Bin_userCode,
		Bin_targetCode,
		Bin_skillId,
		Bin_serial,
		Bin_code,
		Bin_x,
		Bin_y
	];

%GENERATED from file:battle.h => GS2U_AttackResult
packNetMsg(#pk_GS2U_AttackResult{} = P) ->
	Bin_userCode = binary_write_uint64( P#pk_GS2U_AttackResult.userCode ),
	Bin_targetCode = binary_write_uint64( P#pk_GS2U_AttackResult.targetCode ),
	Bin_skillId = binary_write_uint( P#pk_GS2U_AttackResult.skillId ),
	Bin_serial = binary_write_uint( P#pk_GS2U_AttackResult.serial ),
	Bin_result = binary_write_array(P#pk_GS2U_AttackResult.result, fun(X) -> binary_write_uint( X ) end),
	Bin_bhp_per = binary_write_uint8( P#pk_GS2U_AttackResult.bhp_per ),
	Bin_ahp_per = binary_write_uint8( P#pk_GS2U_AttackResult.ahp_per ),
	Bin_diffHp = binary_write_int( P#pk_GS2U_AttackResult.diffHp ),
	Bin_damageHp = binary_write_array(P#pk_GS2U_AttackResult.damageHp, fun(X) -> binary_write_int( X ) end),
	Bin_arList = binary_write_array(P#pk_GS2U_AttackResult.arList, fun(X) -> writeAttackResultList( X ) end),
	[
		<<?CMD_GS2U_AttackResult:16/little>>,
		Bin_userCode,
		Bin_targetCode,
		Bin_skillId,
		Bin_serial,
		Bin_result,
		Bin_bhp_per,
		Bin_ahp_per,
		Bin_diffHp,
		Bin_damageHp,
		Bin_arList
	];

%GENERATED from file:battle.h => GS2U_AttackSpeed
packNetMsg(#pk_GS2U_AttackSpeed{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_AttackSpeed.code ),
	Bin_speed = binary_write_float( P#pk_GS2U_AttackSpeed.speed ),
	[
		<<?CMD_GS2U_AttackSpeed:16/little>>,
		Bin_code,
		Bin_speed
	];

%GENERATED from file:battle.h => GS2U_BattleLearnRequest
packNetMsg(#pk_GS2U_BattleLearnRequest{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_BattleLearnRequest.code ),
	Bin_name = binary_write_string( P#pk_GS2U_BattleLearnRequest.name ),
	[
		<<?CMD_GS2U_BattleLearnRequest:16/little>>,
		Bin_code,
		Bin_name
	];

%GENERATED from file:battle.h => GS2U_BattleLearnResult
packNetMsg(#pk_GS2U_BattleLearnResult{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_BattleLearnResult.code ),
	Bin_targetCode = binary_write_uint64( P#pk_GS2U_BattleLearnResult.targetCode ),
	Bin_name = binary_write_string( P#pk_GS2U_BattleLearnResult.name ),
	Bin_targetName = binary_write_string( P#pk_GS2U_BattleLearnResult.targetName ),
	Bin_result = binary_write_uint8( P#pk_GS2U_BattleLearnResult.result ),
	[
		<<?CMD_GS2U_BattleLearnResult:16/little>>,
		Bin_code,
		Bin_targetCode,
		Bin_name,
		Bin_targetName,
		Bin_result
	];

%GENERATED from file:battle.h => GS2U_BreakSkill
packNetMsg(#pk_GS2U_BreakSkill{} = P) ->
	Bin_userCode = binary_write_uint64( P#pk_GS2U_BreakSkill.userCode ),
	Bin_skillId = binary_write_uint( P#pk_GS2U_BreakSkill.skillId ),
	Bin_serial = binary_write_uint( P#pk_GS2U_BreakSkill.serial ),
	[
		<<?CMD_GS2U_BreakSkill:16/little>>,
		Bin_userCode,
		Bin_skillId,
		Bin_serial
	];

%GENERATED from file:battle.h => GS2U_CallSkill
packNetMsg(#pk_GS2U_CallSkill{} = P) ->
	Bin_userCode = binary_write_uint64( P#pk_GS2U_CallSkill.userCode ),
	Bin_skillId = binary_write_uint( P#pk_GS2U_CallSkill.skillId ),
	[
		<<?CMD_GS2U_CallSkill:16/little>>,
		Bin_userCode,
		Bin_skillId
	];

%GENERATED from file:battle.h => GS2U_CarrierUseSkillToObject
packNetMsg(#pk_GS2U_CarrierUseSkillToObject{} = P) ->
	Bin_userCode = binary_write_uint64( P#pk_GS2U_CarrierUseSkillToObject.userCode ),
	Bin_skillId = binary_write_uint( P#pk_GS2U_CarrierUseSkillToObject.skillId ),
	Bin_serial = binary_write_uint( P#pk_GS2U_CarrierUseSkillToObject.serial ),
	Bin_targetCodeList = binary_write_array(P#pk_GS2U_CarrierUseSkillToObject.targetCodeList, fun(X) -> binary_write_uint64( X ) end),
	Bin_time = binary_write_uint( P#pk_GS2U_CarrierUseSkillToObject.time ),
	[
		<<?CMD_GS2U_CarrierUseSkillToObject:16/little>>,
		Bin_userCode,
		Bin_skillId,
		Bin_serial,
		Bin_targetCodeList,
		Bin_time
	];

%GENERATED from file:battle.h => GS2U_Dead
packNetMsg(#pk_GS2U_Dead{} = P) ->
	Bin_deadActorCode = binary_write_uint64( P#pk_GS2U_Dead.deadActorCode ),
	Bin_killerCode = binary_write_uint64( P#pk_GS2U_Dead.killerCode ),
	Bin_killerName = binary_write_string( P#pk_GS2U_Dead.killerName ),
	Bin_skillID = binary_write_uint( P#pk_GS2U_Dead.skillID ),
	[
		<<?CMD_GS2U_Dead:16/little>>,
		Bin_deadActorCode,
		Bin_killerCode,
		Bin_killerName,
		Bin_skillID
	];

%GENERATED from file:battle.h => GS2U_DeadToTeam
packNetMsg(#pk_GS2U_DeadToTeam{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_DeadToTeam.roleID ),
	Bin_killerCode = binary_write_uint64( P#pk_GS2U_DeadToTeam.killerCode ),
	Bin_killerName = binary_write_string( P#pk_GS2U_DeadToTeam.killerName ),
	[
		<<?CMD_GS2U_DeadToTeam:16/little>>,
		Bin_roleID,
		Bin_killerCode,
		Bin_killerName
	];

%GENERATED from file:battle.h => GS2U_ForceDeadNow
packNetMsg(#pk_GS2U_ForceDeadNow{} = P) ->
	Bin_deadActorCode = binary_write_uint64( P#pk_GS2U_ForceDeadNow.deadActorCode ),
	Bin_killerCode = binary_write_uint64( P#pk_GS2U_ForceDeadNow.killerCode ),
	Bin_killerName = binary_write_string( P#pk_GS2U_ForceDeadNow.killerName ),
	Bin_skillID = binary_write_uint( P#pk_GS2U_ForceDeadNow.skillID ),
	[
		<<?CMD_GS2U_ForceDeadNow:16/little>>,
		Bin_deadActorCode,
		Bin_killerCode,
		Bin_killerName,
		Bin_skillID
	];

%GENERATED from file:battle.h => GS2U_IsTriggerCountDown
packNetMsg(#pk_GS2U_IsTriggerCountDown{} = P) ->
	Bin_flag = binary_write_uint8( P#pk_GS2U_IsTriggerCountDown.flag ),
	Bin_isTrigger = binary_write_uint8( P#pk_GS2U_IsTriggerCountDown.isTrigger ),
	[
		<<?CMD_GS2U_IsTriggerCountDown:16/little>>,
		Bin_flag,
		Bin_isTrigger
	];

%GENERATED from file:battle.h => GS2U_MonsterSpeed
packNetMsg(#pk_GS2U_MonsterSpeed{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_MonsterSpeed.code ),
	Bin_speed = binary_write_float( P#pk_GS2U_MonsterSpeed.speed ),
	Bin_moveStatus = binary_write_uint8( P#pk_GS2U_MonsterSpeed.moveStatus ),
	[
		<<?CMD_GS2U_MonsterSpeed:16/little>>,
		Bin_code,
		Bin_speed,
		Bin_moveStatus
	];

%GENERATED from file:battle.h => GS2U_ResponseBattleAck
packNetMsg(#pk_GS2U_ResponseBattleAck{}) ->
	[
		<<?CMD_GS2U_ResponseBattleAck:16/little>>

	];

%GENERATED from file:battle.h => GS2U_ResponseChangePKMode
packNetMsg(#pk_GS2U_ResponseChangePKMode{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_ResponseChangePKMode.code ),
	Bin_pkMode = binary_write_int( P#pk_GS2U_ResponseChangePKMode.pkMode ),
	[
		<<?CMD_GS2U_ResponseChangePKMode:16/little>>,
		Bin_code,
		Bin_pkMode
	];

%GENERATED from file:battle.h => GS2U_TriggerSkill
packNetMsg(#pk_GS2U_TriggerSkill{} = P) ->
	Bin_userCode = binary_write_uint64( P#pk_GS2U_TriggerSkill.userCode ),
	Bin_skillId = binary_write_uint( P#pk_GS2U_TriggerSkill.skillId ),
	Bin_targetCode = binary_write_uint64( P#pk_GS2U_TriggerSkill.targetCode ),
	[
		<<?CMD_GS2U_TriggerSkill:16/little>>,
		Bin_userCode,
		Bin_skillId,
		Bin_targetCode
	];

%GENERATED from file:battle.h => GS2U_TrunBattleInitList
packNetMsg(#pk_GS2U_TrunBattleInitList{} = P) ->
	Bin_il = binary_write_array(P#pk_GS2U_TrunBattleInitList.il, fun(X) -> writeTurnBattleInit( X ) end),
	[
		<<?CMD_GS2U_TrunBattleInitList:16/little>>,
		Bin_il
	];

%GENERATED from file:battle.h => GS2U_TrunBattleResultList
packNetMsg(#pk_GS2U_TrunBattleResultList{} = P) ->
	Bin_rl = binary_write_array(P#pk_GS2U_TrunBattleResultList.rl, fun(X) -> writeTrunBattleResult( X ) end),
	[
		<<?CMD_GS2U_TrunBattleResultList:16/little>>,
		Bin_rl
	];

%GENERATED from file:battle.h => GS2U_UseSkillToObject
packNetMsg(#pk_GS2U_UseSkillToObject{} = P) ->
	Bin_userCode = binary_write_uint64( P#pk_GS2U_UseSkillToObject.userCode ),
	Bin_skillId = binary_write_uint( P#pk_GS2U_UseSkillToObject.skillId ),
	Bin_serial = binary_write_uint( P#pk_GS2U_UseSkillToObject.serial ),
	Bin_targetCodeList = binary_write_array(P#pk_GS2U_UseSkillToObject.targetCodeList, fun(X) -> binary_write_uint64( X ) end),
	Bin_time = binary_write_uint( P#pk_GS2U_UseSkillToObject.time ),
	[
		<<?CMD_GS2U_UseSkillToObject:16/little>>,
		Bin_userCode,
		Bin_skillId,
		Bin_serial,
		Bin_targetCodeList,
		Bin_time
	];

%GENERATED from file:battle.h => GS2U_UseSkillToPos
packNetMsg(#pk_GS2U_UseSkillToPos{} = P) ->
	Bin_userCode = binary_write_uint64( P#pk_GS2U_UseSkillToPos.userCode ),
	Bin_skillId = binary_write_uint( P#pk_GS2U_UseSkillToPos.skillId ),
	Bin_serial = binary_write_uint( P#pk_GS2U_UseSkillToPos.serial ),
	Bin_targetCodeList = binary_write_array(P#pk_GS2U_UseSkillToPos.targetCodeList, fun(X) -> binary_write_uint64( X ) end),
	Bin_x = binary_write_float( P#pk_GS2U_UseSkillToPos.x ),
	Bin_y = binary_write_float( P#pk_GS2U_UseSkillToPos.y ),
	[
		<<?CMD_GS2U_UseSkillToPos:16/little>>,
		Bin_userCode,
		Bin_skillId,
		Bin_serial,
		Bin_targetCodeList,
		Bin_x,
		Bin_y
	];

%GENERATED from file:battle.h => U2GS_BattleLearn
packNetMsg(#pk_U2GS_BattleLearn{} = P) ->
	Bin_code = binary_write_uint64( P#pk_U2GS_BattleLearn.code ),
	[
		<<?CMD_U2GS_BattleLearn:16/little>>,
		Bin_code
	];

%GENERATED from file:battle.h => U2GS_BattleLearnAck
packNetMsg(#pk_U2GS_BattleLearnAck{} = P) ->
	Bin_code = binary_write_uint64( P#pk_U2GS_BattleLearnAck.code ),
	Bin_result = binary_write_uint8( P#pk_U2GS_BattleLearnAck.result ),
	[
		<<?CMD_U2GS_BattleLearnAck:16/little>>,
		Bin_code,
		Bin_result
	];

%GENERATED from file:battle.h => U2GS_RequestBattleAck
packNetMsg(#pk_U2GS_RequestBattleAck{} = P) ->
	Bin_num = binary_write_uint8( P#pk_U2GS_RequestBattleAck.num ),
	[
		<<?CMD_U2GS_RequestBattleAck:16/little>>,
		Bin_num
	];

%GENERATED from file:battle.h => U2GS_RequestBattleEnd
packNetMsg(#pk_U2GS_RequestBattleEnd{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_RequestBattleEnd.type ),
	[
		<<?CMD_U2GS_RequestBattleEnd:16/little>>,
		Bin_type
	];

%GENERATED from file:battle.h => U2GS_RequestChangePKMode
packNetMsg(#pk_U2GS_RequestChangePKMode{} = P) ->
	Bin_pkMode = binary_write_int( P#pk_U2GS_RequestChangePKMode.pkMode ),
	[
		<<?CMD_U2GS_RequestChangePKMode:16/little>>,
		Bin_pkMode
	];

%GENERATED from file:buff.h => GS2U_BuffHurt
packNetMsg(#pk_GS2U_BuffHurt{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_BuffHurt.code ),
	Bin_buffUID = binary_write_uint64( P#pk_GS2U_BuffHurt.buffUID ),
	Bin_buffID = binary_write_uint( P#pk_GS2U_BuffHurt.buffID ),
	Bin_damageHp = binary_write_int( P#pk_GS2U_BuffHurt.damageHp ),
	Bin_hp_per = binary_write_uint8( P#pk_GS2U_BuffHurt.hp_per ),
	[
		<<?CMD_GS2U_BuffHurt:16/little>>,
		Bin_code,
		Bin_buffUID,
		Bin_buffID,
		Bin_damageHp,
		Bin_hp_per
	];

%GENERATED from file:buff.h => GS2U_BuffInfo
packNetMsg(#pk_GS2U_BuffInfo{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_BuffInfo.code ),
	Bin_buffUID = binary_write_uint64( P#pk_GS2U_BuffInfo.buffUID ),
	Bin_buffID = binary_write_uint( P#pk_GS2U_BuffInfo.buffID ),
	Bin_skillID = binary_write_uint( P#pk_GS2U_BuffInfo.skillID ),
	Bin_level = binary_write_uint( P#pk_GS2U_BuffInfo.level ),
	Bin_flag = binary_write_uint8( P#pk_GS2U_BuffInfo.flag ),
	Bin_serial = binary_write_uint( P#pk_GS2U_BuffInfo.serial ),
	[
		<<?CMD_GS2U_BuffInfo:16/little>>,
		Bin_code,
		Bin_buffUID,
		Bin_buffID,
		Bin_skillID,
		Bin_level,
		Bin_flag,
		Bin_serial
	];

%GENERATED from file:buff.h => U2GS_DelBuff
packNetMsg(#pk_U2GS_DelBuff{} = P) ->
	Bin_code = binary_write_uint64( P#pk_U2GS_DelBuff.code ),
	Bin_buffID = binary_write_uint( P#pk_U2GS_DelBuff.buffID ),
	[
		<<?CMD_U2GS_DelBuff:16/little>>,
		Bin_code,
		Bin_buffID
	];

%GENERATED from file:companion.h => GS2U_InviteFriendToMe
packNetMsg(#pk_GS2U_InviteFriendToMe{} = P) ->
	Bin_inviteRoleID = binary_write_uint64( P#pk_GS2U_InviteFriendToMe.inviteRoleID ),
	Bin_inviteName = binary_write_string( P#pk_GS2U_InviteFriendToMe.inviteName ),
	Bin_mapID = binary_write_uint( P#pk_GS2U_InviteFriendToMe.mapID ),
	Bin_x = binary_write_float( P#pk_GS2U_InviteFriendToMe.x ),
	Bin_y = binary_write_float( P#pk_GS2U_InviteFriendToMe.y ),
	[
		<<?CMD_GS2U_InviteFriendToMe:16/little>>,
		Bin_inviteRoleID,
		Bin_inviteName,
		Bin_mapID,
		Bin_x,
		Bin_y
	];

%GENERATED from file:companion.h => GS2U_RecvInviteFriend
packNetMsg(#pk_GS2U_RecvInviteFriend{} = P) ->
	Bin_name = binary_write_string( P#pk_GS2U_RecvInviteFriend.name ),
	Bin_companionID = binary_write_uint64( P#pk_GS2U_RecvInviteFriend.companionID ),
	[
		<<?CMD_GS2U_RecvInviteFriend:16/little>>,
		Bin_name,
		Bin_companionID
	];

%GENERATED from file:companion.h => GS2U_RequestCompanion
packNetMsg(#pk_GS2U_RequestCompanion{} = P) ->
	Bin_members = binary_write_array(P#pk_GS2U_RequestCompanion.members, fun(X) -> writeCompanionMember( X ) end),
	Bin_max_member = binary_write_uint16( P#pk_GS2U_RequestCompanion.max_member ),
	Bin_profileLevel = binary_write_uint16( P#pk_GS2U_RequestCompanion.profileLevel ),
	[
		<<?CMD_GS2U_RequestCompanion:16/little>>,
		Bin_members,
		Bin_max_member,
		Bin_profileLevel
	];

%GENERATED from file:companion.h => GS2U_ToTargetFriendAck
packNetMsg(#pk_GS2U_ToTargetFriendAck{} = P) ->
	Bin_mapID = binary_write_uint( P#pk_GS2U_ToTargetFriendAck.mapID ),
	Bin_x = binary_write_float( P#pk_GS2U_ToTargetFriendAck.x ),
	Bin_y = binary_write_float( P#pk_GS2U_ToTargetFriendAck.y ),
	[
		<<?CMD_GS2U_ToTargetFriendAck:16/little>>,
		Bin_mapID,
		Bin_x,
		Bin_y
	];

%GENERATED from file:companion.h => U2GS_AgreeInvite
packNetMsg(#pk_U2GS_AgreeInvite{} = P) ->
	Bin_companionID = binary_write_uint64( P#pk_U2GS_AgreeInvite.companionID ),
	Bin_isAgree = binary_write_bool( P#pk_U2GS_AgreeInvite.isAgree ),
	[
		<<?CMD_U2GS_AgreeInvite:16/little>>,
		Bin_companionID,
		Bin_isAgree
	];

%GENERATED from file:companion.h => U2GS_ChangePoseID
packNetMsg(#pk_U2GS_ChangePoseID{} = P) ->
	Bin_poseID = binary_write_uint16( P#pk_U2GS_ChangePoseID.poseID ),
	[
		<<?CMD_U2GS_ChangePoseID:16/little>>,
		Bin_poseID
	];

%GENERATED from file:companion.h => U2GS_CreateCompanion
packNetMsg(#pk_U2GS_CreateCompanion{}) ->
	[
		<<?CMD_U2GS_CreateCompanion:16/little>>

	];

%GENERATED from file:companion.h => U2GS_ExitCompanion
packNetMsg(#pk_U2GS_ExitCompanion{}) ->
	[
		<<?CMD_U2GS_ExitCompanion:16/little>>

	];

%GENERATED from file:companion.h => U2GS_InviteFriend
packNetMsg(#pk_U2GS_InviteFriend{} = P) ->
	Bin_target_roleid = binary_write_uint64( P#pk_U2GS_InviteFriend.target_roleid ),
	[
		<<?CMD_U2GS_InviteFriend:16/little>>,
		Bin_target_roleid
	];

%GENERATED from file:companion.h => U2GS_InviteToMe
packNetMsg(#pk_U2GS_InviteToMe{}) ->
	[
		<<?CMD_U2GS_InviteToMe:16/little>>

	];

%GENERATED from file:companion.h => U2GS_KickCompanion
packNetMsg(#pk_U2GS_KickCompanion{} = P) ->
	Bin_target_roleid = binary_write_uint64( P#pk_U2GS_KickCompanion.target_roleid ),
	[
		<<?CMD_U2GS_KickCompanion:16/little>>,
		Bin_target_roleid
	];

%GENERATED from file:companion.h => U2GS_RequestCompanion
packNetMsg(#pk_U2GS_RequestCompanion{}) ->
	[
		<<?CMD_U2GS_RequestCompanion:16/little>>

	];

%GENERATED from file:companion.h => U2GS_ToTargetFriend
packNetMsg(#pk_U2GS_ToTargetFriend{} = P) ->
	Bin_target_roleid = binary_write_uint64( P#pk_U2GS_ToTargetFriend.target_roleid ),
	[
		<<?CMD_U2GS_ToTargetFriend:16/little>>,
		Bin_target_roleid
	];

%GENERATED from file:companion.h => U2GS_ToTargetFriendResult
packNetMsg(#pk_U2GS_ToTargetFriendResult{} = P) ->
	Bin_inviteRoleID = binary_write_uint64( P#pk_U2GS_ToTargetFriendResult.inviteRoleID ),
	Bin_comming = binary_write_bool( P#pk_U2GS_ToTargetFriendResult.comming ),
	[
		<<?CMD_U2GS_ToTargetFriendResult:16/little>>,
		Bin_inviteRoleID,
		Bin_comming
	];

%GENERATED from file:copy.h => ActiveGuildCopy
packNetMsg(#pk_ActiveGuildCopy{} = P) ->
	Bin_mapID = binary_write_uint( P#pk_ActiveGuildCopy.mapID ),
	[
		<<?CMD_ActiveGuildCopy:16/little>>,
		Bin_mapID
	];

%GENERATED from file:copy.h => GS2U_BossBattleRankResult
packNetMsg(#pk_GS2U_BossBattleRankResult{} = P) ->
	Bin_curRankNum = binary_write_uint( P#pk_GS2U_BossBattleRankResult.curRankNum ),
	Bin_rankList = binary_write_array(P#pk_GS2U_BossBattleRankResult.rankList, fun(X) -> writeBossRankInfo( X ) end),
	[
		<<?CMD_GS2U_BossBattleRankResult:16/little>>,
		Bin_curRankNum,
		Bin_rankList
	];

%GENERATED from file:copy.h => GS2U_BossBattleState
packNetMsg(#pk_GS2U_BossBattleState{} = P) ->
	Bin_flag = binary_write_uint8( P#pk_GS2U_BossBattleState.flag ),
	Bin_mapID = binary_write_uint( P#pk_GS2U_BossBattleState.mapID ),
	[
		<<?CMD_GS2U_BossBattleState:16/little>>,
		Bin_flag,
		Bin_mapID
	];

%GENERATED from file:copy.h => GS2U_ChapterInfo
packNetMsg(#pk_GS2U_ChapterInfo{} = P) ->
	Bin_chapter = writechapterInfo( P#pk_GS2U_ChapterInfo.chapter ),
	[
		<<?CMD_GS2U_ChapterInfo:16/little>>,
		Bin_chapter
	];

%GENERATED from file:copy.h => GS2U_CopyMapLeftTime
packNetMsg(#pk_GS2U_CopyMapLeftTime{} = P) ->
	Bin_mapID = binary_write_uint16( P#pk_GS2U_CopyMapLeftTime.mapID ),
	Bin_leftTimeMs = binary_write_uint( P#pk_GS2U_CopyMapLeftTime.leftTimeMs ),
	[
		<<?CMD_GS2U_CopyMapLeftTime:16/little>>,
		Bin_mapID,
		Bin_leftTimeMs
	];

%GENERATED from file:copy.h => GS2U_CopyMapSchedulePlayAnimation
packNetMsg(#pk_GS2U_CopyMapSchedulePlayAnimation{} = P) ->
	Bin_mapID = binary_write_uint16( P#pk_GS2U_CopyMapSchedulePlayAnimation.mapID ),
	Bin_schedule = binary_write_uint( P#pk_GS2U_CopyMapSchedulePlayAnimation.schedule ),
	Bin_animationID = binary_write_uint( P#pk_GS2U_CopyMapSchedulePlayAnimation.animationID ),
	[
		<<?CMD_GS2U_CopyMapSchedulePlayAnimation:16/little>>,
		Bin_mapID,
		Bin_schedule,
		Bin_animationID
	];

%GENERATED from file:copy.h => GS2U_CopyMapSchedulePlayCharacter
packNetMsg(#pk_GS2U_CopyMapSchedulePlayCharacter{} = P) ->
	Bin_mapID = binary_write_uint16( P#pk_GS2U_CopyMapSchedulePlayCharacter.mapID ),
	Bin_schedule = binary_write_uint( P#pk_GS2U_CopyMapSchedulePlayCharacter.schedule ),
	Bin_characterIDs = binary_write_array(P#pk_GS2U_CopyMapSchedulePlayCharacter.characterIDs, fun(X) -> binary_write_uint( X ) end),
	[
		<<?CMD_GS2U_CopyMapSchedulePlayCharacter:16/little>>,
		Bin_mapID,
		Bin_schedule,
		Bin_characterIDs
	];

%GENERATED from file:copy.h => GS2U_CopySpecialSchedule
packNetMsg(#pk_GS2U_CopySpecialSchedule{} = P) ->
	Bin_mapID = binary_write_uint16( P#pk_GS2U_CopySpecialSchedule.mapID ),
	Bin_schedule = binary_write_uint16( P#pk_GS2U_CopySpecialSchedule.schedule ),
	Bin_code = binary_write_uint64( P#pk_GS2U_CopySpecialSchedule.code ),
	[
		<<?CMD_GS2U_CopySpecialSchedule:16/little>>,
		Bin_mapID,
		Bin_schedule,
		Bin_code
	];

%GENERATED from file:copy.h => GS2U_IsGuildCopyOpen
packNetMsg(#pk_GS2U_IsGuildCopyOpen{} = P) ->
	Bin_flag = binary_write_bool( P#pk_GS2U_IsGuildCopyOpen.flag ),
	Bin_time = binary_write_uint64( P#pk_GS2U_IsGuildCopyOpen.time ),
	[
		<<?CMD_GS2U_IsGuildCopyOpen:16/little>>,
		Bin_flag,
		Bin_time
	];

%GENERATED from file:copy.h => GS2U_MaterialInfo
packNetMsg(#pk_GS2U_MaterialInfo{} = P) ->
	Bin_mapID = binary_write_uint16( P#pk_GS2U_MaterialInfo.mapID ),
	Bin_leftSeconds = binary_write_uint( P#pk_GS2U_MaterialInfo.leftSeconds ),
	Bin_chapter = writechapterInfo( P#pk_GS2U_MaterialInfo.chapter ),
	Bin_towerList = binary_write_array(P#pk_GS2U_MaterialInfo.towerList, fun(X) -> writetowerInfo( X ) end),
	[
		<<?CMD_GS2U_MaterialInfo:16/little>>,
		Bin_mapID,
		Bin_leftSeconds,
		Bin_chapter,
		Bin_towerList
	];

%GENERATED from file:copy.h => GS2U_MoneyDungeonInfo
packNetMsg(#pk_GS2U_MoneyDungeonInfo{} = P) ->
	Bin_leftSeconds = binary_write_uint( P#pk_GS2U_MoneyDungeonInfo.leftSeconds ),
	Bin_maxChapter = binary_write_uint16( P#pk_GS2U_MoneyDungeonInfo.maxChapter ),
	Bin_curChapter = binary_write_uint16( P#pk_GS2U_MoneyDungeonInfo.curChapter ),
	Bin_listMonsterID = binary_write_array(P#pk_GS2U_MoneyDungeonInfo.listMonsterID, fun(X) -> binary_write_uint16( X ) end),
	Bin_listMonsterCountMax = binary_write_array(P#pk_GS2U_MoneyDungeonInfo.listMonsterCountMax, fun(X) -> binary_write_uint8( X ) end),
	Bin_listMonsterCountKill = binary_write_array(P#pk_GS2U_MoneyDungeonInfo.listMonsterCountKill, fun(X) -> binary_write_uint8( X ) end),
	Bin_curLeftCount = binary_write_uint8( P#pk_GS2U_MoneyDungeonInfo.curLeftCount ),
	[
		<<?CMD_GS2U_MoneyDungeonInfo:16/little>>,
		Bin_leftSeconds,
		Bin_maxChapter,
		Bin_curChapter,
		Bin_listMonsterID,
		Bin_listMonsterCountMax,
		Bin_listMonsterCountKill,
		Bin_curLeftCount
	];

%GENERATED from file:copy.h => GS2U_SendGuildCopyOpenTime
packNetMsg(#pk_GS2U_SendGuildCopyOpenTime{} = P) ->
	Bin_time = binary_write_uint64( P#pk_GS2U_SendGuildCopyOpenTime.time ),
	[
		<<?CMD_GS2U_SendGuildCopyOpenTime:16/little>>,
		Bin_time
	];

%GENERATED from file:copy.h => GS2U_SpiritArea_Tick_Sync
packNetMsg(#pk_GS2U_SpiritArea_Tick_Sync{} = P) ->
	Bin_time = binary_write_uint( P#pk_GS2U_SpiritArea_Tick_Sync.time ),
	Bin_timeAll = binary_write_uint( P#pk_GS2U_SpiritArea_Tick_Sync.timeAll ),
	Bin_wave = binary_write_uint8( P#pk_GS2U_SpiritArea_Tick_Sync.wave ),
	Bin_state = binary_write_uint8( P#pk_GS2U_SpiritArea_Tick_Sync.state ),
	Bin_isAssist = binary_write_bool( P#pk_GS2U_SpiritArea_Tick_Sync.isAssist ),
	[
		<<?CMD_GS2U_SpiritArea_Tick_Sync:16/little>>,
		Bin_time,
		Bin_timeAll,
		Bin_wave,
		Bin_state,
		Bin_isAssist
	];

%GENERATED from file:copy.h => GS2U_SpiritArea_Wake_Sync
packNetMsg(#pk_GS2U_SpiritArea_Wake_Sync{} = P) ->
	Bin_skillID = binary_write_uint( P#pk_GS2U_SpiritArea_Wake_Sync.skillID ),
	[
		<<?CMD_GS2U_SpiritArea_Wake_Sync:16/little>>,
		Bin_skillID
	];

%GENERATED from file:copy.h => GS2U_TowerInfo
packNetMsg(#pk_GS2U_TowerInfo{} = P) ->
	Bin_info = writetowerInfo( P#pk_GS2U_TowerInfo.info ),
	[
		<<?CMD_GS2U_TowerInfo:16/little>>,
		Bin_info
	];

%GENERATED from file:copy.h => U2GS2U_CopyMapScheduleShow2
packNetMsg(#pk_U2GS2U_CopyMapScheduleShow2{} = P) ->
	Bin_mapID = binary_write_uint16( P#pk_U2GS2U_CopyMapScheduleShow2.mapID ),
	Bin_show2ID = binary_write_uint16( P#pk_U2GS2U_CopyMapScheduleShow2.show2ID ),
	Bin_groupID = binary_write_uint64( P#pk_U2GS2U_CopyMapScheduleShow2.groupID ),
	Bin_scheduleID = binary_write_uint( P#pk_U2GS2U_CopyMapScheduleShow2.scheduleID ),
	Bin_isInit = binary_write_bool( P#pk_U2GS2U_CopyMapScheduleShow2.isInit ),
	[
		<<?CMD_U2GS2U_CopyMapScheduleShow2:16/little>>,
		Bin_mapID,
		Bin_show2ID,
		Bin_groupID,
		Bin_scheduleID,
		Bin_isInit
	];

%GENERATED from file:copy.h => U2GS_CopyMapSchedulePlayAnimationOver
packNetMsg(#pk_U2GS_CopyMapSchedulePlayAnimationOver{} = P) ->
	Bin_animationID = binary_write_uint( P#pk_U2GS_CopyMapSchedulePlayAnimationOver.animationID ),
	[
		<<?CMD_U2GS_CopyMapSchedulePlayAnimationOver:16/little>>,
		Bin_animationID
	];

%GENERATED from file:copy.h => U2GS_CopyMapSchedulePlayCharacterOver
packNetMsg(#pk_U2GS_CopyMapSchedulePlayCharacterOver{} = P) ->
	Bin_schedule = binary_write_uint( P#pk_U2GS_CopyMapSchedulePlayCharacterOver.schedule ),
	[
		<<?CMD_U2GS_CopyMapSchedulePlayCharacterOver:16/little>>,
		Bin_schedule
	];

%GENERATED from file:copy.h => U2GS_EnterBossBattle
packNetMsg(#pk_U2GS_EnterBossBattle{}) ->
	[
		<<?CMD_U2GS_EnterBossBattle:16/little>>

	];

%GENERATED from file:copy.h => U2GS_EnterGuildCopy
packNetMsg(#pk_U2GS_EnterGuildCopy{} = P) ->
	Bin_mapID = binary_write_uint( P#pk_U2GS_EnterGuildCopy.mapID ),
	[
		<<?CMD_U2GS_EnterGuildCopy:16/little>>,
		Bin_mapID
	];

%GENERATED from file:copy.h => U2GS_GoonCopyMap
packNetMsg(#pk_U2GS_GoonCopyMap{} = P) ->
	Bin_mapID = binary_write_uint16( P#pk_U2GS_GoonCopyMap.mapID ),
	[
		<<?CMD_U2GS_GoonCopyMap:16/little>>,
		Bin_mapID
	];

%GENERATED from file:copy.h => U2GS_MoneyDungeonGiveup
packNetMsg(#pk_U2GS_MoneyDungeonGiveup{}) ->
	[
		<<?CMD_U2GS_MoneyDungeonGiveup:16/little>>

	];

%GENERATED from file:copy.h => U2GS_MoneyDungeonNext
packNetMsg(#pk_U2GS_MoneyDungeonNext{}) ->
	[
		<<?CMD_U2GS_MoneyDungeonNext:16/little>>

	];

%GENERATED from file:copy.h => U2GS_RequestAutoDeal
packNetMsg(#pk_U2GS_RequestAutoDeal{} = P) ->
	Bin_mapID = binary_write_uint16( P#pk_U2GS_RequestAutoDeal.mapID ),
	[
		<<?CMD_U2GS_RequestAutoDeal:16/little>>,
		Bin_mapID
	];

%GENERATED from file:copy.h => U2GS_RequestMaterialInfo
packNetMsg(#pk_U2GS_RequestMaterialInfo{} = P) ->
	Bin_mapID = binary_write_uint16( P#pk_U2GS_RequestMaterialInfo.mapID ),
	[
		<<?CMD_U2GS_RequestMaterialInfo:16/little>>,
		Bin_mapID
	];

%GENERATED from file:copy.h => U2GS_UpTower
packNetMsg(#pk_U2GS_UpTower{} = P) ->
	Bin_dataID = binary_write_uint( P#pk_U2GS_UpTower.dataID ),
	Bin_type = binary_write_uint( P#pk_U2GS_UpTower.type ),
	[
		<<?CMD_U2GS_UpTower:16/little>>,
		Bin_dataID,
		Bin_type
	];

%GENERATED from file:copy.h => U2GS_startNextChapter
packNetMsg(#pk_U2GS_startNextChapter{}) ->
	[
		<<?CMD_U2GS_startNextChapter:16/little>>

	];

%GENERATED from file:copy.h => UpdataHurtToBoss
packNetMsg(#pk_UpdataHurtToBoss{} = P) ->
	Bin_hurt = binary_write_uint( P#pk_UpdataHurtToBoss.hurt ),
	[
		<<?CMD_UpdataHurtToBoss:16/little>>,
		Bin_hurt
	];

%GENERATED from file:fashion.h => GS2U_ActiveFashionSuitList
packNetMsg(#pk_GS2U_ActiveFashionSuitList{} = P) ->
	Bin_activeFashionSuitList = binary_write_array(P#pk_GS2U_ActiveFashionSuitList.activeFashionSuitList, fun(X) -> binary_write_uint( X ) end),
	[
		<<?CMD_GS2U_ActiveFashionSuitList:16/little>>,
		Bin_activeFashionSuitList
	];

%GENERATED from file:fashion.h => GS2U_FashionList
packNetMsg(#pk_GS2U_FashionList{} = P) ->
	Bin_datas = binary_write_array(P#pk_GS2U_FashionList.datas, fun(X) -> writeFashionInfo( X ) end),
	[
		<<?CMD_GS2U_FashionList:16/little>>,
		Bin_datas
	];

%GENERATED from file:fashion.h => GS2U_FashionResult
packNetMsg(#pk_GS2U_FashionResult{} = P) ->
	Bin_fashionID = binary_write_uint( P#pk_GS2U_FashionResult.fashionID ),
	Bin_type = binary_write_uint8( P#pk_GS2U_FashionResult.type ),
	Bin_value = binary_write_uint( P#pk_GS2U_FashionResult.value ),
	[
		<<?CMD_GS2U_FashionResult:16/little>>,
		Bin_fashionID,
		Bin_type,
		Bin_value
	];

%GENERATED from file:fashion.h => GS2U_FashionRoomLevelUp
packNetMsg(#pk_GS2U_FashionRoomLevelUp{} = P) ->
	Bin_roomLevel = binary_write_uint( P#pk_GS2U_FashionRoomLevelUp.roomLevel ),
	[
		<<?CMD_GS2U_FashionRoomLevelUp:16/little>>,
		Bin_roomLevel
	];

%GENERATED from file:fashion.h => U2GS_ActiveFashionSuit
packNetMsg(#pk_U2GS_ActiveFashionSuit{} = P) ->
	Bin_flag = binary_write_bool( P#pk_U2GS_ActiveFashionSuit.flag ),
	Bin_fashionSuitID = binary_write_uint( P#pk_U2GS_ActiveFashionSuit.fashionSuitID ),
	[
		<<?CMD_U2GS_ActiveFashionSuit:16/little>>,
		Bin_flag,
		Bin_fashionSuitID
	];

%GENERATED from file:fashion.h => U2GS_BuyFashion
packNetMsg(#pk_U2GS_BuyFashion{} = P) ->
	Bin_fashionID = binary_write_uint( P#pk_U2GS_BuyFashion.fashionID ),
	Bin_time = binary_write_uint( P#pk_U2GS_BuyFashion.time ),
	Bin_type = binary_write_uint8( P#pk_U2GS_BuyFashion.type ),
	[
		<<?CMD_U2GS_BuyFashion:16/little>>,
		Bin_fashionID,
		Bin_time,
		Bin_type
	];

%GENERATED from file:fashion.h => U2GS_FashionRoomLevelUp
packNetMsg(#pk_U2GS_FashionRoomLevelUp{}) ->
	[
		<<?CMD_U2GS_FashionRoomLevelUp:16/little>>

	];

%GENERATED from file:fashion.h => U2GS_IsDisplayFashion
packNetMsg(#pk_U2GS_IsDisplayFashion{} = P) ->
	Bin_flag = binary_write_int8( P#pk_U2GS_IsDisplayFashion.flag ),
	[
		<<?CMD_U2GS_IsDisplayFashion:16/little>>,
		Bin_flag
	];

%GENERATED from file:fashion.h => U2GS_OperateFashion
packNetMsg(#pk_U2GS_OperateFashion{} = P) ->
	Bin_fashionID = binary_write_uint( P#pk_U2GS_OperateFashion.fashionID ),
	Bin_flag = binary_write_bool( P#pk_U2GS_OperateFashion.flag ),
	[
		<<?CMD_U2GS_OperateFashion:16/little>>,
		Bin_fashionID,
		Bin_flag
	];

%GENERATED from file:friend.h => GS2U_Friend2AddFromBlack_Ask
packNetMsg(#pk_GS2U_Friend2AddFromBlack_Ask{} = P) ->
	Bin_id = binary_write_uint64( P#pk_GS2U_Friend2AddFromBlack_Ask.id ),
	Bin_name = binary_write_string( P#pk_GS2U_Friend2AddFromBlack_Ask.name ),
	[
		<<?CMD_GS2U_Friend2AddFromBlack_Ask:16/little>>,
		Bin_id,
		Bin_name
	];

%GENERATED from file:friend.h => GS2U_Friend2ApplicantReset_Sync
packNetMsg(#pk_GS2U_Friend2ApplicantReset_Sync{} = P) ->
	Bin_count = binary_write_uint16( P#pk_GS2U_Friend2ApplicantReset_Sync.count ),
	Bin_page = binary_write_uint8( P#pk_GS2U_Friend2ApplicantReset_Sync.page ),
	Bin_listInfo = binary_write_array(P#pk_GS2U_Friend2ApplicantReset_Sync.listInfo, fun(X) -> writeFriend2InfoBase( X ) end),
	[
		<<?CMD_GS2U_Friend2ApplicantReset_Sync:16/little>>,
		Bin_count,
		Bin_page,
		Bin_listInfo
	];

%GENERATED from file:friend.h => GS2U_Friend2BanFromFormal_Ask
packNetMsg(#pk_GS2U_Friend2BanFromFormal_Ask{} = P) ->
	Bin_id = binary_write_uint64( P#pk_GS2U_Friend2BanFromFormal_Ask.id ),
	Bin_name = binary_write_string( P#pk_GS2U_Friend2BanFromFormal_Ask.name ),
	[
		<<?CMD_GS2U_Friend2BanFromFormal_Ask:16/little>>,
		Bin_id,
		Bin_name
	];

%GENERATED from file:friend.h => GS2U_Friend2BanWithUnbanAndDel_Ask
packNetMsg(#pk_GS2U_Friend2BanWithUnbanAndDel_Ask{} = P) ->
	Bin_idUnban = binary_write_uint64( P#pk_GS2U_Friend2BanWithUnbanAndDel_Ask.idUnban ),
	Bin_nameUnban = binary_write_string( P#pk_GS2U_Friend2BanWithUnbanAndDel_Ask.nameUnban ),
	Bin_idDel = binary_write_uint64( P#pk_GS2U_Friend2BanWithUnbanAndDel_Ask.idDel ),
	Bin_nameDel = binary_write_string( P#pk_GS2U_Friend2BanWithUnbanAndDel_Ask.nameDel ),
	[
		<<?CMD_GS2U_Friend2BanWithUnbanAndDel_Ask:16/little>>,
		Bin_idUnban,
		Bin_nameUnban,
		Bin_idDel,
		Bin_nameDel
	];

%GENERATED from file:friend.h => GS2U_Friend2BanWithUnban_Ask
packNetMsg(#pk_GS2U_Friend2BanWithUnban_Ask{} = P) ->
	Bin_id = binary_write_uint64( P#pk_GS2U_Friend2BanWithUnban_Ask.id ),
	Bin_name = binary_write_string( P#pk_GS2U_Friend2BanWithUnban_Ask.name ),
	[
		<<?CMD_GS2U_Friend2BanWithUnban_Ask:16/little>>,
		Bin_id,
		Bin_name
	];

%GENERATED from file:friend.h => GS2U_Friend2BlackReset_Sync
packNetMsg(#pk_GS2U_Friend2BlackReset_Sync{} = P) ->
	Bin_count = binary_write_uint16( P#pk_GS2U_Friend2BlackReset_Sync.count ),
	Bin_page = binary_write_uint8( P#pk_GS2U_Friend2BlackReset_Sync.page ),
	Bin_listInfo = binary_write_array(P#pk_GS2U_Friend2BlackReset_Sync.listInfo, fun(X) -> writeFriend2InfoBase( X ) end),
	[
		<<?CMD_GS2U_Friend2BlackReset_Sync:16/little>>,
		Bin_count,
		Bin_page,
		Bin_listInfo
	];

%GENERATED from file:friend.h => GS2U_Friend2ClosenessChange_Sync
packNetMsg(#pk_GS2U_Friend2ClosenessChange_Sync{} = P) ->
	Bin_id = binary_write_uint64( P#pk_GS2U_Friend2ClosenessChange_Sync.id ),
	Bin_closeness = binary_write_uint( P#pk_GS2U_Friend2ClosenessChange_Sync.closeness ),
	[
		<<?CMD_GS2U_Friend2ClosenessChange_Sync:16/little>>,
		Bin_id,
		Bin_closeness
	];

%GENERATED from file:friend.h => GS2U_Friend2CrossAdd2Failed_Ack
packNetMsg(#pk_GS2U_Friend2CrossAdd2Failed_Ack{} = P) ->
	Bin_reason = binary_write_uint( P#pk_GS2U_Friend2CrossAdd2Failed_Ack.reason ),
	Bin_listDel = binary_write_array(P#pk_GS2U_Friend2CrossAdd2Failed_Ack.listDel, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_GS2U_Friend2CrossAdd2Failed_Ack:16/little>>,
		Bin_reason,
		Bin_listDel
	];

%GENERATED from file:friend.h => GS2U_Friend2CrossAdd2_Ack
packNetMsg(#pk_GS2U_Friend2CrossAdd2_Ack{} = P) ->
	Bin_info = writeFriend2InfoCross( P#pk_GS2U_Friend2CrossAdd2_Ack.info ),
	[
		<<?CMD_GS2U_Friend2CrossAdd2_Ack:16/little>>,
		Bin_info
	];

%GENERATED from file:friend.h => GS2U_Friend2CrossAdd_Sync
packNetMsg(#pk_GS2U_Friend2CrossAdd_Sync{} = P) ->
	Bin_info = writeFriend2InfoCross( P#pk_GS2U_Friend2CrossAdd_Sync.info ),
	Bin_listDel = binary_write_array(P#pk_GS2U_Friend2CrossAdd_Sync.listDel, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_GS2U_Friend2CrossAdd_Sync:16/little>>,
		Bin_info,
		Bin_listDel
	];

%GENERATED from file:friend.h => GS2U_Friend2CrossAll_Sync
packNetMsg(#pk_GS2U_Friend2CrossAll_Sync{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_Friend2CrossAll_Sync.type ),
	Bin_listAll = binary_write_array(P#pk_GS2U_Friend2CrossAll_Sync.listAll, fun(X) -> writeFriend2InfoCross( X ) end),
	[
		<<?CMD_GS2U_Friend2CrossAll_Sync:16/little>>,
		Bin_type,
		Bin_listAll
	];

%GENERATED from file:friend.h => GS2U_Friend2CrossDel_Ack
packNetMsg(#pk_GS2U_Friend2CrossDel_Ack{} = P) ->
	Bin_id = binary_write_uint64( P#pk_GS2U_Friend2CrossDel_Ack.id ),
	Bin_isFix = binary_write_bool( P#pk_GS2U_Friend2CrossDel_Ack.isFix ),
	[
		<<?CMD_GS2U_Friend2CrossDel_Ack:16/little>>,
		Bin_id,
		Bin_isFix
	];

%GENERATED from file:friend.h => GS2U_Friend2CrossInit_Sync
packNetMsg(#pk_GS2U_Friend2CrossInit_Sync{} = P) ->
	Bin_listCross = binary_write_array(P#pk_GS2U_Friend2CrossInit_Sync.listCross, fun(X) -> writeFriend2InfoCross( X ) end),
	Bin_listApply = binary_write_array(P#pk_GS2U_Friend2CrossInit_Sync.listApply, fun(X) -> writeFriend2InfoCross( X ) end),
	[
		<<?CMD_GS2U_Friend2CrossInit_Sync:16/little>>,
		Bin_listCross,
		Bin_listApply
	];

%GENERATED from file:friend.h => GS2U_Friend2ForLook_Ack
packNetMsg(#pk_GS2U_Friend2ForLook_Ack{} = P) ->
	Bin_id = binary_write_uint64( P#pk_GS2U_Friend2ForLook_Ack.id ),
	Bin_name = binary_write_string( P#pk_GS2U_Friend2ForLook_Ack.name ),
	Bin_relation = binary_write_uint8( P#pk_GS2U_Friend2ForLook_Ack.relation ),
	Bin_like = binary_write_uint( P#pk_GS2U_Friend2ForLook_Ack.like ),
	Bin_isGiveLike = binary_write_bool( P#pk_GS2U_Friend2ForLook_Ack.isGiveLike ),
	Bin_level = binary_write_uint16( P#pk_GS2U_Friend2ForLook_Ack.level ),
	Bin_charm = binary_write_uint( P#pk_GS2U_Friend2ForLook_Ack.charm ),
	[
		<<?CMD_GS2U_Friend2ForLook_Ack:16/little>>,
		Bin_id,
		Bin_name,
		Bin_relation,
		Bin_like,
		Bin_isGiveLike,
		Bin_level,
		Bin_charm
	];

%GENERATED from file:friend.h => GS2U_Friend2FormalChatVoice_AckR
packNetMsg(#pk_GS2U_Friend2FormalChatVoice_AckR{} = P) ->
	Bin_senderID = binary_write_uint64( P#pk_GS2U_Friend2FormalChatVoice_AckR.senderID ),
	Bin_receiverID = binary_write_uint64( P#pk_GS2U_Friend2FormalChatVoice_AckR.receiverID ),
	Bin_time = binary_write_uint( P#pk_GS2U_Friend2FormalChatVoice_AckR.time ),
	Bin_duration = binary_write_float( P#pk_GS2U_Friend2FormalChatVoice_AckR.duration ),
	Bin_count = binary_write_uint8( P#pk_GS2U_Friend2FormalChatVoice_AckR.count ),
	Bin_index = binary_write_uint8( P#pk_GS2U_Friend2FormalChatVoice_AckR.index ),
	Bin_data = binary_write_array(P#pk_GS2U_Friend2FormalChatVoice_AckR.data, fun(X) -> binary_write_uint8( X ) end),
	Bin_relation = binary_write_uint8( P#pk_GS2U_Friend2FormalChatVoice_AckR.relation ),
	[
		<<?CMD_GS2U_Friend2FormalChatVoice_AckR:16/little>>,
		Bin_senderID,
		Bin_receiverID,
		Bin_time,
		Bin_duration,
		Bin_count,
		Bin_index,
		Bin_data,
		Bin_relation
	];

%GENERATED from file:friend.h => GS2U_Friend2FormalChatVoice_AckS
packNetMsg(#pk_GS2U_Friend2FormalChatVoice_AckS{} = P) ->
	Bin_senderID = binary_write_uint64( P#pk_GS2U_Friend2FormalChatVoice_AckS.senderID ),
	Bin_receiverID = binary_write_uint64( P#pk_GS2U_Friend2FormalChatVoice_AckS.receiverID ),
	Bin_time = binary_write_uint( P#pk_GS2U_Friend2FormalChatVoice_AckS.time ),
	[
		<<?CMD_GS2U_Friend2FormalChatVoice_AckS:16/little>>,
		Bin_senderID,
		Bin_receiverID,
		Bin_time
	];

%GENERATED from file:friend.h => GS2U_Friend2FormalChat_Ack
packNetMsg(#pk_GS2U_Friend2FormalChat_Ack{} = P) ->
	Bin_senderID = binary_write_uint64( P#pk_GS2U_Friend2FormalChat_Ack.senderID ),
	Bin_receiverID = binary_write_uint64( P#pk_GS2U_Friend2FormalChat_Ack.receiverID ),
	Bin_time = binary_write_uint( P#pk_GS2U_Friend2FormalChat_Ack.time ),
	Bin_content = binary_write_string( P#pk_GS2U_Friend2FormalChat_Ack.content ),
	Bin_relation = binary_write_uint8( P#pk_GS2U_Friend2FormalChat_Ack.relation ),
	[
		<<?CMD_GS2U_Friend2FormalChat_Ack:16/little>>,
		Bin_senderID,
		Bin_receiverID,
		Bin_time,
		Bin_content,
		Bin_relation
	];

%GENERATED from file:friend.h => GS2U_Friend2FormalForMarriage_Sync
packNetMsg(#pk_GS2U_Friend2FormalForMarriage_Sync{} = P) ->
	Bin_count = binary_write_uint16( P#pk_GS2U_Friend2FormalForMarriage_Sync.count ),
	Bin_hasAP = binary_write_bool( P#pk_GS2U_Friend2FormalForMarriage_Sync.hasAP ),
	Bin_page = binary_write_uint8( P#pk_GS2U_Friend2FormalForMarriage_Sync.page ),
	Bin_listInfo = binary_write_array(P#pk_GS2U_Friend2FormalForMarriage_Sync.listInfo, fun(X) -> writeFriend2InfoFormal( X ) end),
	[
		<<?CMD_GS2U_Friend2FormalForMarriage_Sync:16/little>>,
		Bin_count,
		Bin_hasAP,
		Bin_page,
		Bin_listInfo
	];

%GENERATED from file:friend.h => GS2U_Friend2FormalReset_Sync
packNetMsg(#pk_GS2U_Friend2FormalReset_Sync{} = P) ->
	Bin_count = binary_write_uint16( P#pk_GS2U_Friend2FormalReset_Sync.count ),
	Bin_hasAP = binary_write_bool( P#pk_GS2U_Friend2FormalReset_Sync.hasAP ),
	Bin_page = binary_write_uint8( P#pk_GS2U_Friend2FormalReset_Sync.page ),
	Bin_listInfo = binary_write_array(P#pk_GS2U_Friend2FormalReset_Sync.listInfo, fun(X) -> writeFriend2InfoFormal( X ) end),
	[
		<<?CMD_GS2U_Friend2FormalReset_Sync:16/little>>,
		Bin_count,
		Bin_hasAP,
		Bin_page,
		Bin_listInfo
	];

%GENERATED from file:friend.h => GS2U_Friend2MakeFormal_Sync
packNetMsg(#pk_GS2U_Friend2MakeFormal_Sync{} = P) ->
	Bin_id = binary_write_uint64( P#pk_GS2U_Friend2MakeFormal_Sync.id ),
	[
		<<?CMD_GS2U_Friend2MakeFormal_Sync:16/little>>,
		Bin_id
	];

%GENERATED from file:friend.h => GS2U_Friend2Recommend_Ack
packNetMsg(#pk_GS2U_Friend2Recommend_Ack{} = P) ->
	Bin_listInfo = binary_write_array(P#pk_GS2U_Friend2Recommend_Ack.listInfo, fun(X) -> writeFriend2InfoBase( X ) end),
	[
		<<?CMD_GS2U_Friend2Recommend_Ack:16/little>>,
		Bin_listInfo
	];

%GENERATED from file:friend.h => GS2U_Friend2Search_Ack
packNetMsg(#pk_GS2U_Friend2Search_Ack{} = P) ->
	Bin_listInfo = binary_write_array(P#pk_GS2U_Friend2Search_Ack.listInfo, fun(X) -> writeFriend2InfoBase( X ) end),
	[
		<<?CMD_GS2U_Friend2Search_Ack:16/little>>,
		Bin_listInfo
	];

%GENERATED from file:friend.h => GS2U_Friend2SimpleList_Ack
packNetMsg(#pk_GS2U_Friend2SimpleList_Ack{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_Friend2SimpleList_Ack.type ),
	Bin_count = binary_write_uint16( P#pk_GS2U_Friend2SimpleList_Ack.count ),
	Bin_index = binary_write_uint16( P#pk_GS2U_Friend2SimpleList_Ack.index ),
	Bin_listInfo = binary_write_array(P#pk_GS2U_Friend2SimpleList_Ack.listInfo, fun(X) -> writeFriend2InfoSimple( X ) end),
	[
		<<?CMD_GS2U_Friend2SimpleList_Ack:16/little>>,
		Bin_type,
		Bin_count,
		Bin_index,
		Bin_listInfo
	];

%GENERATED from file:friend.h => GS2U_Friend2TempReset_Sync
packNetMsg(#pk_GS2U_Friend2TempReset_Sync{} = P) ->
	Bin_count = binary_write_uint16( P#pk_GS2U_Friend2TempReset_Sync.count ),
	Bin_page = binary_write_uint8( P#pk_GS2U_Friend2TempReset_Sync.page ),
	Bin_listInfo = binary_write_array(P#pk_GS2U_Friend2TempReset_Sync.listInfo, fun(X) -> writeFriend2InfoBase( X ) end),
	[
		<<?CMD_GS2U_Friend2TempReset_Sync:16/little>>,
		Bin_count,
		Bin_page,
		Bin_listInfo
	];

%GENERATED from file:friend.h => GS2U_Friend2WantChat_Ack
packNetMsg(#pk_GS2U_Friend2WantChat_Ack{} = P) ->
	Bin_id = binary_write_uint64( P#pk_GS2U_Friend2WantChat_Ack.id ),
	Bin_info = writeFriend2InfoBase( P#pk_GS2U_Friend2WantChat_Ack.info ),
	Bin_relation = binary_write_uint8( P#pk_GS2U_Friend2WantChat_Ack.relation ),
	Bin_count = binary_write_uint16( P#pk_GS2U_Friend2WantChat_Ack.count ),
	Bin_hasAP = binary_write_bool( P#pk_GS2U_Friend2WantChat_Ack.hasAP ),
	Bin_page = binary_write_uint8( P#pk_GS2U_Friend2WantChat_Ack.page ),
	Bin_listInfo = binary_write_array(P#pk_GS2U_Friend2WantChat_Ack.listInfo, fun(X) -> writeFriend2InfoFormal( X ) end),
	[
		<<?CMD_GS2U_Friend2WantChat_Ack:16/little>>,
		Bin_id,
		Bin_info,
		Bin_relation,
		Bin_count,
		Bin_hasAP,
		Bin_page,
		Bin_listInfo
	];

%GENERATED from file:friend.h => GS2u_Friend2Like_Ack
packNetMsg(#pk_GS2u_Friend2Like_Ack{} = P) ->
	Bin_id = binary_write_uint64( P#pk_GS2u_Friend2Like_Ack.id ),
	Bin_name = binary_write_string( P#pk_GS2u_Friend2Like_Ack.name ),
	Bin_like = binary_write_uint( P#pk_GS2u_Friend2Like_Ack.like ),
	[
		<<?CMD_GS2u_Friend2Like_Ack:16/little>>,
		Bin_id,
		Bin_name,
		Bin_like
	];

%GENERATED from file:friend.h => U2GS_Friend2AddFromBlack_Reply
packNetMsg(#pk_U2GS_Friend2AddFromBlack_Reply{} = P) ->
	Bin_id = binary_write_uint64( P#pk_U2GS_Friend2AddFromBlack_Reply.id ),
	Bin_isAgreed = binary_write_bool( P#pk_U2GS_Friend2AddFromBlack_Reply.isAgreed ),
	[
		<<?CMD_U2GS_Friend2AddFromBlack_Reply:16/little>>,
		Bin_id,
		Bin_isAgreed
	];

%GENERATED from file:friend.h => U2GS_Friend2Add_Request
packNetMsg(#pk_U2GS_Friend2Add_Request{} = P) ->
	Bin_id = binary_write_uint64( P#pk_U2GS_Friend2Add_Request.id ),
	[
		<<?CMD_U2GS_Friend2Add_Request:16/little>>,
		Bin_id
	];

%GENERATED from file:friend.h => U2GS_Friend2ApplicantUseOneKey_Request
packNetMsg(#pk_U2GS_Friend2ApplicantUseOneKey_Request{} = P) ->
	Bin_isAgreed = binary_write_bool( P#pk_U2GS_Friend2ApplicantUseOneKey_Request.isAgreed ),
	[
		<<?CMD_U2GS_Friend2ApplicantUseOneKey_Request:16/little>>,
		Bin_isAgreed
	];

%GENERATED from file:friend.h => U2GS_Friend2ApplicantUse_Request
packNetMsg(#pk_U2GS_Friend2ApplicantUse_Request{} = P) ->
	Bin_id = binary_write_uint64( P#pk_U2GS_Friend2ApplicantUse_Request.id ),
	Bin_isAgreed = binary_write_bool( P#pk_U2GS_Friend2ApplicantUse_Request.isAgreed ),
	[
		<<?CMD_U2GS_Friend2ApplicantUse_Request:16/little>>,
		Bin_id,
		Bin_isAgreed
	];

%GENERATED from file:friend.h => U2GS_Friend2Applicant_Request
packNetMsg(#pk_U2GS_Friend2Applicant_Request{} = P) ->
	Bin_page = binary_write_uint8( P#pk_U2GS_Friend2Applicant_Request.page ),
	[
		<<?CMD_U2GS_Friend2Applicant_Request:16/little>>,
		Bin_page
	];

%GENERATED from file:friend.h => U2GS_Friend2BanWithDel_Reply
packNetMsg(#pk_U2GS_Friend2BanWithDel_Reply{} = P) ->
	Bin_id = binary_write_uint64( P#pk_U2GS_Friend2BanWithDel_Reply.id ),
	Bin_isAgreed = binary_write_bool( P#pk_U2GS_Friend2BanWithDel_Reply.isAgreed ),
	[
		<<?CMD_U2GS_Friend2BanWithDel_Reply:16/little>>,
		Bin_id,
		Bin_isAgreed
	];

%GENERATED from file:friend.h => U2GS_Friend2BanWithUnbanAndDel_Reply
packNetMsg(#pk_U2GS_Friend2BanWithUnbanAndDel_Reply{} = P) ->
	Bin_idUnban = binary_write_uint64( P#pk_U2GS_Friend2BanWithUnbanAndDel_Reply.idUnban ),
	Bin_idDel = binary_write_uint64( P#pk_U2GS_Friend2BanWithUnbanAndDel_Reply.idDel ),
	Bin_isAgreed = binary_write_bool( P#pk_U2GS_Friend2BanWithUnbanAndDel_Reply.isAgreed ),
	[
		<<?CMD_U2GS_Friend2BanWithUnbanAndDel_Reply:16/little>>,
		Bin_idUnban,
		Bin_idDel,
		Bin_isAgreed
	];

%GENERATED from file:friend.h => U2GS_Friend2BanWithUnban_Reply
packNetMsg(#pk_U2GS_Friend2BanWithUnban_Reply{} = P) ->
	Bin_idUnban = binary_write_uint64( P#pk_U2GS_Friend2BanWithUnban_Reply.idUnban ),
	Bin_idBan = binary_write_uint64( P#pk_U2GS_Friend2BanWithUnban_Reply.idBan ),
	Bin_isAgreed = binary_write_bool( P#pk_U2GS_Friend2BanWithUnban_Reply.isAgreed ),
	[
		<<?CMD_U2GS_Friend2BanWithUnban_Reply:16/little>>,
		Bin_idUnban,
		Bin_idBan,
		Bin_isAgreed
	];

%GENERATED from file:friend.h => U2GS_Friend2Ban_Request
packNetMsg(#pk_U2GS_Friend2Ban_Request{} = P) ->
	Bin_id = binary_write_uint64( P#pk_U2GS_Friend2Ban_Request.id ),
	[
		<<?CMD_U2GS_Friend2Ban_Request:16/little>>,
		Bin_id
	];

%GENERATED from file:friend.h => U2GS_Friend2Black_Request
packNetMsg(#pk_U2GS_Friend2Black_Request{} = P) ->
	Bin_page = binary_write_uint8( P#pk_U2GS_Friend2Black_Request.page ),
	[
		<<?CMD_U2GS_Friend2Black_Request:16/little>>,
		Bin_page
	];

%GENERATED from file:friend.h => U2GS_Friend2CrossAdd2_Request
packNetMsg(#pk_U2GS_Friend2CrossAdd2_Request{} = P) ->
	Bin_id = binary_write_uint64( P#pk_U2GS_Friend2CrossAdd2_Request.id ),
	Bin_isAgreed = binary_write_bool( P#pk_U2GS_Friend2CrossAdd2_Request.isAgreed ),
	[
		<<?CMD_U2GS_Friend2CrossAdd2_Request:16/little>>,
		Bin_id,
		Bin_isAgreed
	];

%GENERATED from file:friend.h => U2GS_Friend2CrossAdd_Request
packNetMsg(#pk_U2GS_Friend2CrossAdd_Request{} = P) ->
	Bin_id = binary_write_uint64( P#pk_U2GS_Friend2CrossAdd_Request.id ),
	[
		<<?CMD_U2GS_Friend2CrossAdd_Request:16/little>>,
		Bin_id
	];

%GENERATED from file:friend.h => U2GS_Friend2CrossAll_Request
packNetMsg(#pk_U2GS_Friend2CrossAll_Request{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_Friend2CrossAll_Request.type ),
	[
		<<?CMD_U2GS_Friend2CrossAll_Request:16/little>>,
		Bin_type
	];

%GENERATED from file:friend.h => U2GS_Friend2CrossDel_Request
packNetMsg(#pk_U2GS_Friend2CrossDel_Request{} = P) ->
	Bin_id = binary_write_uint64( P#pk_U2GS_Friend2CrossDel_Request.id ),
	[
		<<?CMD_U2GS_Friend2CrossDel_Request:16/little>>,
		Bin_id
	];

%GENERATED from file:friend.h => U2GS_Friend2Del_Request
packNetMsg(#pk_U2GS_Friend2Del_Request{} = P) ->
	Bin_id = binary_write_uint64( P#pk_U2GS_Friend2Del_Request.id ),
	[
		<<?CMD_U2GS_Friend2Del_Request:16/little>>,
		Bin_id
	];

%GENERATED from file:friend.h => U2GS_Friend2ForLook_Request
packNetMsg(#pk_U2GS_Friend2ForLook_Request{} = P) ->
	Bin_id = binary_write_uint64( P#pk_U2GS_Friend2ForLook_Request.id ),
	[
		<<?CMD_U2GS_Friend2ForLook_Request:16/little>>,
		Bin_id
	];

%GENERATED from file:friend.h => U2GS_Friend2FormalChatVoice_Request
packNetMsg(#pk_U2GS_Friend2FormalChatVoice_Request{} = P) ->
	Bin_receiverID = binary_write_uint64( P#pk_U2GS_Friend2FormalChatVoice_Request.receiverID ),
	Bin_time = binary_write_uint( P#pk_U2GS_Friend2FormalChatVoice_Request.time ),
	Bin_duration = binary_write_float( P#pk_U2GS_Friend2FormalChatVoice_Request.duration ),
	Bin_count = binary_write_uint8( P#pk_U2GS_Friend2FormalChatVoice_Request.count ),
	Bin_index = binary_write_uint8( P#pk_U2GS_Friend2FormalChatVoice_Request.index ),
	Bin_data = binary_write_array(P#pk_U2GS_Friend2FormalChatVoice_Request.data, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_U2GS_Friend2FormalChatVoice_Request:16/little>>,
		Bin_receiverID,
		Bin_time,
		Bin_duration,
		Bin_count,
		Bin_index,
		Bin_data
	];

%GENERATED from file:friend.h => U2GS_Friend2FormalChat_Request
packNetMsg(#pk_U2GS_Friend2FormalChat_Request{} = P) ->
	Bin_receiverID = binary_write_uint64( P#pk_U2GS_Friend2FormalChat_Request.receiverID ),
	Bin_content = binary_write_string( P#pk_U2GS_Friend2FormalChat_Request.content ),
	Bin_time = binary_write_uint( P#pk_U2GS_Friend2FormalChat_Request.time ),
	[
		<<?CMD_U2GS_Friend2FormalChat_Request:16/little>>,
		Bin_receiverID,
		Bin_content,
		Bin_time
	];

%GENERATED from file:friend.h => U2GS_Friend2FormalForMarriage_Request
packNetMsg(#pk_U2GS_Friend2FormalForMarriage_Request{} = P) ->
	Bin_page = binary_write_uint8( P#pk_U2GS_Friend2FormalForMarriage_Request.page ),
	[
		<<?CMD_U2GS_Friend2FormalForMarriage_Request:16/little>>,
		Bin_page
	];

%GENERATED from file:friend.h => U2GS_Friend2FormalOP_Request
packNetMsg(#pk_U2GS_Friend2FormalOP_Request{} = P) ->
	Bin_id = binary_write_uint64( P#pk_U2GS_Friend2FormalOP_Request.id ),
	Bin_opType = binary_write_uint8( P#pk_U2GS_Friend2FormalOP_Request.opType ),
	[
		<<?CMD_U2GS_Friend2FormalOP_Request:16/little>>,
		Bin_id,
		Bin_opType
	];

%GENERATED from file:friend.h => U2GS_Friend2Formal_Request
packNetMsg(#pk_U2GS_Friend2Formal_Request{} = P) ->
	Bin_page = binary_write_uint8( P#pk_U2GS_Friend2Formal_Request.page ),
	[
		<<?CMD_U2GS_Friend2Formal_Request:16/little>>,
		Bin_page
	];

%GENERATED from file:friend.h => U2GS_Friend2LBS_Request
packNetMsg(#pk_U2GS_Friend2LBS_Request{} = P) ->
	Bin_longitude = binary_write_float( P#pk_U2GS_Friend2LBS_Request.longitude ),
	Bin_latitude = binary_write_float( P#pk_U2GS_Friend2LBS_Request.latitude ),
	[
		<<?CMD_U2GS_Friend2LBS_Request:16/little>>,
		Bin_longitude,
		Bin_latitude
	];

%GENERATED from file:friend.h => U2GS_Friend2Recommend_Request
packNetMsg(#pk_U2GS_Friend2Recommend_Request{} = P) ->
	Bin_sex = binary_write_uint8( P#pk_U2GS_Friend2Recommend_Request.sex ),
	Bin_isNear = binary_write_bool( P#pk_U2GS_Friend2Recommend_Request.isNear ),
	Bin_isPush = binary_write_bool( P#pk_U2GS_Friend2Recommend_Request.isPush ),
	[
		<<?CMD_U2GS_Friend2Recommend_Request:16/little>>,
		Bin_sex,
		Bin_isNear,
		Bin_isPush
	];

%GENERATED from file:friend.h => U2GS_Friend2Search_Request
packNetMsg(#pk_U2GS_Friend2Search_Request{} = P) ->
	Bin_name = binary_write_string( P#pk_U2GS_Friend2Search_Request.name ),
	[
		<<?CMD_U2GS_Friend2Search_Request:16/little>>,
		Bin_name
	];

%GENERATED from file:friend.h => U2GS_Friend2SimpleList_Requets
packNetMsg(#pk_U2GS_Friend2SimpleList_Requets{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_Friend2SimpleList_Requets.type ),
	[
		<<?CMD_U2GS_Friend2SimpleList_Requets:16/little>>,
		Bin_type
	];

%GENERATED from file:friend.h => U2GS_Friend2Temp_Request
packNetMsg(#pk_U2GS_Friend2Temp_Request{} = P) ->
	Bin_page = binary_write_uint8( P#pk_U2GS_Friend2Temp_Request.page ),
	[
		<<?CMD_U2GS_Friend2Temp_Request:16/little>>,
		Bin_page
	];

%GENERATED from file:friend.h => U2GS_Friend2Unban_Request
packNetMsg(#pk_U2GS_Friend2Unban_Request{} = P) ->
	Bin_id = binary_write_uint64( P#pk_U2GS_Friend2Unban_Request.id ),
	[
		<<?CMD_U2GS_Friend2Unban_Request:16/little>>,
		Bin_id
	];

%GENERATED from file:friend.h => U2GS_Friend2WantChat_Request
packNetMsg(#pk_U2GS_Friend2WantChat_Request{} = P) ->
	Bin_id = binary_write_uint64( P#pk_U2GS_Friend2WantChat_Request.id ),
	[
		<<?CMD_U2GS_Friend2WantChat_Request:16/little>>,
		Bin_id
	];

%GENERATED from file:godweapon.h => GS2U_InitGodWeapon
packNetMsg(#pk_GS2U_InitGodWeapon{} = P) ->
	Bin_infos = binary_write_array(P#pk_GS2U_InitGodWeapon.infos, fun(X) -> writeGodWeaponInfo( X ) end),
	[
		<<?CMD_GS2U_InitGodWeapon:16/little>>,
		Bin_infos
	];

%GENERATED from file:godweapon.h => GS2U_LevelUpGodWeaponResult
packNetMsg(#pk_GS2U_LevelUpGodWeaponResult{} = P) ->
	Bin_weaponID = binary_write_uint8( P#pk_GS2U_LevelUpGodWeaponResult.weaponID ),
	Bin_weaponLevel = binary_write_uint16( P#pk_GS2U_LevelUpGodWeaponResult.weaponLevel ),
	Bin_exp = binary_write_uint( P#pk_GS2U_LevelUpGodWeaponResult.exp ),
	Bin_wakeSkillLv = binary_write_uint16( P#pk_GS2U_LevelUpGodWeaponResult.wakeSkillLv ),
	[
		<<?CMD_GS2U_LevelUpGodWeaponResult:16/little>>,
		Bin_weaponID,
		Bin_weaponLevel,
		Bin_exp,
		Bin_wakeSkillLv
	];

%GENERATED from file:godweapon.h => GS2U_LevelUpGodWeaponSkillResult
packNetMsg(#pk_GS2U_LevelUpGodWeaponSkillResult{} = P) ->
	Bin_weaponID = binary_write_uint8( P#pk_GS2U_LevelUpGodWeaponSkillResult.weaponID ),
	Bin_skillLevel = binary_write_uint16( P#pk_GS2U_LevelUpGodWeaponSkillResult.skillLevel ),
	[
		<<?CMD_GS2U_LevelUpGodWeaponSkillResult:16/little>>,
		Bin_weaponID,
		Bin_skillLevel
	];

%GENERATED from file:godweapon.h => U2GS_LevelUpGodWeapon
packNetMsg(#pk_U2GS_LevelUpGodWeapon{} = P) ->
	Bin_weaponID = binary_write_uint8( P#pk_U2GS_LevelUpGodWeapon.weaponID ),
	[
		<<?CMD_U2GS_LevelUpGodWeapon:16/little>>,
		Bin_weaponID
	];

%GENERATED from file:godweapon.h => U2GS_LevelUpGodWeaponSkill
packNetMsg(#pk_U2GS_LevelUpGodWeaponSkill{} = P) ->
	Bin_weaponID = binary_write_uint8( P#pk_U2GS_LevelUpGodWeaponSkill.weaponID ),
	[
		<<?CMD_U2GS_LevelUpGodWeaponSkill:16/little>>,
		Bin_weaponID
	];

%GENERATED from file:guild.h => GS2U_BiddingGuildMsg
packNetMsg(#pk_GS2U_BiddingGuildMsg{} = P) ->
	Bin_list = binary_write_array(P#pk_GS2U_BiddingGuildMsg.list, fun(X) -> writeBiddingGuild( X ) end),
	Bin_resorce = binary_write_uint( P#pk_GS2U_BiddingGuildMsg.resorce ),
	[
		<<?CMD_GS2U_BiddingGuildMsg:16/little>>,
		Bin_list,
		Bin_resorce
	];

%GENERATED from file:guild.h => GS2U_ChangeDenoter
packNetMsg(#pk_GS2U_ChangeDenoter{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_GS2U_ChangeDenoter.guildID ),
	Bin_denoter = binary_write_uint8( P#pk_GS2U_ChangeDenoter.denoter ),
	[
		<<?CMD_GS2U_ChangeDenoter:16/little>>,
		Bin_guildID,
		Bin_denoter
	];

%GENERATED from file:guild.h => GS2U_ChangeGuildName
packNetMsg(#pk_GS2U_ChangeGuildName{} = P) ->
	Bin_newGuildName = binary_write_string( P#pk_GS2U_ChangeGuildName.newGuildName ),
	[
		<<?CMD_GS2U_ChangeGuildName:16/little>>,
		Bin_newGuildName
	];

%GENERATED from file:guild.h => GS2U_ChangeNotice
packNetMsg(#pk_GS2U_ChangeNotice{} = P) ->
	Bin_guildNotice = binary_write_string( P#pk_GS2U_ChangeNotice.guildNotice ),
	[
		<<?CMD_GS2U_ChangeNotice:16/little>>,
		Bin_guildNotice
	];

%GENERATED from file:guild.h => GS2U_DonateSuccess
packNetMsg(#pk_GS2U_DonateSuccess{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_GS2U_DonateSuccess.guildID ),
	Bin_guildLevel = binary_write_uint8( P#pk_GS2U_DonateSuccess.guildLevel ),
	Bin_nowExp = binary_write_uint( P#pk_GS2U_DonateSuccess.nowExp ),
	Bin_roleID = binary_write_uint64( P#pk_GS2U_DonateSuccess.roleID ),
	Bin_contribute = binary_write_uint( P#pk_GS2U_DonateSuccess.contribute ),
	[
		<<?CMD_GS2U_DonateSuccess:16/little>>,
		Bin_guildID,
		Bin_guildLevel,
		Bin_nowExp,
		Bin_roleID,
		Bin_contribute
	];

%GENERATED from file:guild.h => GS2U_ExpeditionBroadcastPos
packNetMsg(#pk_GS2U_ExpeditionBroadcastPos{} = P) ->
	Bin_type = binary_write_uint16( P#pk_GS2U_ExpeditionBroadcastPos.type ),
	Bin_broadcasterName = binary_write_string( P#pk_GS2U_ExpeditionBroadcastPos.broadcasterName ),
	Bin_x = binary_write_float( P#pk_GS2U_ExpeditionBroadcastPos.x ),
	Bin_y = binary_write_float( P#pk_GS2U_ExpeditionBroadcastPos.y ),
	[
		<<?CMD_GS2U_ExpeditionBroadcastPos:16/little>>,
		Bin_type,
		Bin_broadcasterName,
		Bin_x,
		Bin_y
	];

%GENERATED from file:guild.h => GS2U_ExpeditionFinalInfo
packNetMsg(#pk_GS2U_ExpeditionFinalInfo{} = P) ->
	Bin_selfTotalScore = binary_write_uint64( P#pk_GS2U_ExpeditionFinalInfo.selfTotalScore ),
	Bin_finalInfoList = binary_write_array(P#pk_GS2U_ExpeditionFinalInfo.finalInfoList, fun(X) -> writeExpeditionFinalInfo( X ) end),
	[
		<<?CMD_GS2U_ExpeditionFinalInfo:16/little>>,
		Bin_selfTotalScore,
		Bin_finalInfoList
	];

%GENERATED from file:guild.h => GS2U_ExpeditionGlobalMapInfoList
packNetMsg(#pk_GS2U_ExpeditionGlobalMapInfoList{} = P) ->
	Bin_leftSeconds = binary_write_uint( P#pk_GS2U_ExpeditionGlobalMapInfoList.leftSeconds ),
	Bin_mapInfoList = binary_write_array(P#pk_GS2U_ExpeditionGlobalMapInfoList.mapInfoList, fun(X) -> writeExpeditionGlobalMapInfo( X ) end),
	[
		<<?CMD_GS2U_ExpeditionGlobalMapInfoList:16/little>>,
		Bin_leftSeconds,
		Bin_mapInfoList
	];

%GENERATED from file:guild.h => GS2U_ExpeditionMapBattleInfoList
packNetMsg(#pk_GS2U_ExpeditionMapBattleInfoList{} = P) ->
	Bin_mapid = binary_write_uint( P#pk_GS2U_ExpeditionMapBattleInfoList.mapid ),
	Bin_selfScore = binary_write_uint64( P#pk_GS2U_ExpeditionMapBattleInfoList.selfScore ),
	Bin_selfGuildBattleInfo = writeExpeditionGuildBattleInfo( P#pk_GS2U_ExpeditionMapBattleInfoList.selfGuildBattleInfo ),
	Bin_pointInfoList = binary_write_array(P#pk_GS2U_ExpeditionMapBattleInfoList.pointInfoList, fun(X) -> writeExpeditionPointInfo( X ) end),
	Bin_topGuildInfoList = binary_write_array(P#pk_GS2U_ExpeditionMapBattleInfoList.topGuildInfoList, fun(X) -> writeExpeditionGuildBattleInfo( X ) end),
	[
		<<?CMD_GS2U_ExpeditionMapBattleInfoList:16/little>>,
		Bin_mapid,
		Bin_selfScore,
		Bin_selfGuildBattleInfo,
		Bin_pointInfoList,
		Bin_topGuildInfoList
	];

%GENERATED from file:guild.h => GS2U_ExpeditionMapInfoList
packNetMsg(#pk_GS2U_ExpeditionMapInfoList{} = P) ->
	Bin_mapInfoList = binary_write_array(P#pk_GS2U_ExpeditionMapInfoList.mapInfoList, fun(X) -> writeExpeditionMapInfo( X ) end),
	[
		<<?CMD_GS2U_ExpeditionMapInfoList:16/little>>,
		Bin_mapInfoList
	];

%GENERATED from file:guild.h => GS2U_ExpeditionQuenenState
packNetMsg(#pk_GS2U_ExpeditionQuenenState{} = P) ->
	Bin_mapid = binary_write_uint( P#pk_GS2U_ExpeditionQuenenState.mapid ),
	[
		<<?CMD_GS2U_ExpeditionQuenenState:16/little>>,
		Bin_mapid
	];

%GENERATED from file:guild.h => GS2U_GivePower
packNetMsg(#pk_GS2U_GivePower{} = P) ->
	Bin_targetRoleID = binary_write_uint64( P#pk_GS2U_GivePower.targetRoleID ),
	Bin_guileLevel = binary_write_uint8( P#pk_GS2U_GivePower.guileLevel ),
	[
		<<?CMD_GS2U_GivePower:16/little>>,
		Bin_targetRoleID,
		Bin_guileLevel
	];

%GENERATED from file:guild.h => GS2U_GuildBattleApply
packNetMsg(#pk_GS2U_GuildBattleApply{} = P) ->
	Bin_list = binary_write_array(P#pk_GS2U_GuildBattleApply.list, fun(X) -> writeGuildBattleInfo( X ) end),
	Bin_selfGuildID = binary_write_uint64( P#pk_GS2U_GuildBattleApply.selfGuildID ),
	Bin_targetGuildID = binary_write_uint64( P#pk_GS2U_GuildBattleApply.targetGuildID ),
	[
		<<?CMD_GS2U_GuildBattleApply:16/little>>,
		Bin_list,
		Bin_selfGuildID,
		Bin_targetGuildID
	];

%GENERATED from file:guild.h => GS2U_GuildBattleResult
packNetMsg(#pk_GS2U_GuildBattleResult{} = P) ->
	Bin_isEnd = binary_write_uint8( P#pk_GS2U_GuildBattleResult.isEnd ),
	Bin_win = writeGuildBattleResultInfo( P#pk_GS2U_GuildBattleResult.win ),
	Bin_lose = writeGuildBattleResultInfo( P#pk_GS2U_GuildBattleResult.lose ),
	[
		<<?CMD_GS2U_GuildBattleResult:16/little>>,
		Bin_isEnd,
		Bin_win,
		Bin_lose
	];

%GENERATED from file:guild.h => GS2U_GuildBuff
packNetMsg(#pk_GS2U_GuildBuff{} = P) ->
	Bin_buff = binary_write_array(P#pk_GS2U_GuildBuff.buff, fun(X) -> writeGuildBuff( X ) end),
	[
		<<?CMD_GS2U_GuildBuff:16/little>>,
		Bin_buff
	];

%GENERATED from file:guild.h => GS2U_GuildBuffRole
packNetMsg(#pk_GS2U_GuildBuffRole{} = P) ->
	Bin_bgrs = binary_write_array(P#pk_GS2U_GuildBuffRole.bgrs, fun(X) -> writeGuildBuffRole( X ) end),
	[
		<<?CMD_GS2U_GuildBuffRole:16/little>>,
		Bin_bgrs
	];

%GENERATED from file:guild.h => GS2U_GuildIDList
packNetMsg(#pk_GS2U_GuildIDList{} = P) ->
	Bin_list = binary_write_array(P#pk_GS2U_GuildIDList.list, fun(X) -> writeGuildIDList( X ) end),
	[
		<<?CMD_GS2U_GuildIDList:16/little>>,
		Bin_list
	];

%GENERATED from file:guild.h => GS2U_GuildList
packNetMsg(#pk_GS2U_GuildList{} = P) ->
	Bin_nowPage = binary_write_uint( P#pk_GS2U_GuildList.nowPage ),
	Bin_maxPage = binary_write_uint( P#pk_GS2U_GuildList.maxPage ),
	Bin_guildInfoList = binary_write_array(P#pk_GS2U_GuildList.guildInfoList, fun(X) -> writeGuildInfo( X ) end),
	[
		<<?CMD_GS2U_GuildList:16/little>>,
		Bin_nowPage,
		Bin_maxPage,
		Bin_guildInfoList
	];

%GENERATED from file:guild.h => GS2U_GuildOpResult
packNetMsg(#pk_GS2U_GuildOpResult{} = P) ->
	Bin_roleCode = binary_write_uint64( P#pk_GS2U_GuildOpResult.roleCode ),
	Bin_opType = binary_write_uint8( P#pk_GS2U_GuildOpResult.opType ),
	Bin_opResult = binary_write_bool( P#pk_GS2U_GuildOpResult.opResult ),
	[
		<<?CMD_GS2U_GuildOpResult:16/little>>,
		Bin_roleCode,
		Bin_opType,
		Bin_opResult
	];

%GENERATED from file:guild.h => GS2U_GuildSkill
packNetMsg(#pk_GS2U_GuildSkill{} = P) ->
	Bin_skill = binary_write_array(P#pk_GS2U_GuildSkill.skill, fun(X) -> writeGuildSkill( X ) end),
	Bin_selfskill = binary_write_array(P#pk_GS2U_GuildSkill.selfskill, fun(X) -> writeGuildSkill( X ) end),
	[
		<<?CMD_GS2U_GuildSkill:16/little>>,
		Bin_skill,
		Bin_selfskill
	];

%GENERATED from file:guild.h => GS2U_GuildTask
packNetMsg(#pk_GS2U_GuildTask{} = P) ->
	Bin_tasks = binary_write_array(P#pk_GS2U_GuildTask.tasks, fun(X) -> writeGuildTask( X ) end),
	[
		<<?CMD_GS2U_GuildTask:16/little>>,
		Bin_tasks
	];

%GENERATED from file:guild.h => GS2U_GuildWar
packNetMsg(#pk_GS2U_GuildWar{} = P) ->
	Bin_list = binary_write_array(P#pk_GS2U_GuildWar.list, fun(X) -> writeGuildWar( X ) end),
	[
		<<?CMD_GS2U_GuildWar:16/little>>,
		Bin_list
	];

%GENERATED from file:guild.h => GS2U_GuildWarData
packNetMsg(#pk_GS2U_GuildWarData{} = P) ->
	Bin_ranks = binary_write_array(P#pk_GS2U_GuildWarData.ranks, fun(X) -> writeGuildWarRank( X ) end),
	Bin_pebbles = binary_write_array(P#pk_GS2U_GuildWarData.pebbles, fun(X) -> writePebbleState( X ) end),
	Bin_cannons = binary_write_array(P#pk_GS2U_GuildWarData.cannons, fun(X) -> writeCannonState( X ) end),
	Bin_syTime = binary_write_uint( P#pk_GS2U_GuildWarData.syTime ),
	[
		<<?CMD_GS2U_GuildWarData:16/little>>,
		Bin_ranks,
		Bin_pebbles,
		Bin_cannons,
		Bin_syTime
	];

%GENERATED from file:guild.h => GS2U_GuildWarEnd
packNetMsg(#pk_GS2U_GuildWarEnd{} = P) ->
	Bin_infos = binary_write_array(P#pk_GS2U_GuildWarEnd.infos, fun(X) -> writeGuildWarInfo( X ) end),
	Bin_items = binary_write_array(P#pk_GS2U_GuildWarEnd.items, fun(X) -> writeGuildWarReward_item( X ) end),
	Bin_coins = binary_write_array(P#pk_GS2U_GuildWarEnd.coins, fun(X) -> writeGuildWarReward_coin( X ) end),
	[
		<<?CMD_GS2U_GuildWarEnd:16/little>>,
		Bin_infos,
		Bin_items,
		Bin_coins
	];

%GENERATED from file:guild.h => GS2U_Guild_ExchangeAll_Sync
packNetMsg(#pk_GS2U_Guild_ExchangeAll_Sync{} = P) ->
	Bin_listID = binary_write_array(P#pk_GS2U_Guild_ExchangeAll_Sync.listID, fun(X) -> binary_write_uint( X ) end),
	Bin_listLevel = binary_write_array(P#pk_GS2U_Guild_ExchangeAll_Sync.listLevel, fun(X) -> binary_write_uint( X ) end),
	Bin_listLevelCur = binary_write_array(P#pk_GS2U_Guild_ExchangeAll_Sync.listLevelCur, fun(X) -> binary_write_uint( X ) end),
	[
		<<?CMD_GS2U_Guild_ExchangeAll_Sync:16/little>>,
		Bin_listID,
		Bin_listLevel,
		Bin_listLevelCur
	];

%GENERATED from file:guild.h => GS2U_Guild_Exchange_Ack
packNetMsg(#pk_GS2U_Guild_Exchange_Ack{} = P) ->
	Bin_id = binary_write_uint( P#pk_GS2U_Guild_Exchange_Ack.id ),
	Bin_level = binary_write_uint( P#pk_GS2U_Guild_Exchange_Ack.level ),
	Bin_errorCode = binary_write_uint( P#pk_GS2U_Guild_Exchange_Ack.errorCode ),
	[
		<<?CMD_GS2U_Guild_Exchange_Ack:16/little>>,
		Bin_id,
		Bin_level,
		Bin_errorCode
	];

%GENERATED from file:guild.h => GS2U_Guild_FairgroundEnter_Ack
packNetMsg(#pk_GS2U_Guild_FairgroundEnter_Ack{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_GS2U_Guild_FairgroundEnter_Ack.guildID ),
	Bin_listRide = binary_write_array(P#pk_GS2U_Guild_FairgroundEnter_Ack.listRide, fun(X) -> writeRide( X ) end),
	Bin_listRole = binary_write_array(P#pk_GS2U_Guild_FairgroundEnter_Ack.listRole, fun(X) -> writeRideRole( X ) end),
	[
		<<?CMD_GS2U_Guild_FairgroundEnter_Ack:16/little>>,
		Bin_guildID,
		Bin_listRide,
		Bin_listRole
	];

%GENERATED from file:guild.h => GS2U_Guild_FairgroundRide_Sync
packNetMsg(#pk_GS2U_Guild_FairgroundRide_Sync{} = P) ->
	Bin_ride = writeRide( P#pk_GS2U_Guild_FairgroundRide_Sync.ride ),
	Bin_role = writeRideRole( P#pk_GS2U_Guild_FairgroundRide_Sync.role ),
	Bin_type = binary_write_uint8( P#pk_GS2U_Guild_FairgroundRide_Sync.type ),
	[
		<<?CMD_GS2U_Guild_FairgroundRide_Sync:16/little>>,
		Bin_ride,
		Bin_role,
		Bin_type
	];

%GENERATED from file:guild.h => GS2U_Guild_FastJoin_Ack
packNetMsg(#pk_GS2U_Guild_FastJoin_Ack{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_GS2U_Guild_FastJoin_Ack.guildID ),
	[
		<<?CMD_GS2U_Guild_FastJoin_Ack:16/little>>,
		Bin_guildID
	];

%GENERATED from file:guild.h => GS2U_Guild_FastJoin_Get_Ack
packNetMsg(#pk_GS2U_Guild_FastJoin_Get_Ack{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_GS2U_Guild_FastJoin_Get_Ack.guildID ),
	Bin_force = binary_write_uint64( P#pk_GS2U_Guild_FastJoin_Get_Ack.force ),
	[
		<<?CMD_GS2U_Guild_FastJoin_Get_Ack:16/little>>,
		Bin_guildID,
		Bin_force
	];

%GENERATED from file:guild.h => GS2U_Guild_FastJoin_Set_Ack
packNetMsg(#pk_GS2U_Guild_FastJoin_Set_Ack{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_GS2U_Guild_FastJoin_Set_Ack.guildID ),
	Bin_force = binary_write_uint64( P#pk_GS2U_Guild_FastJoin_Set_Ack.force ),
	[
		<<?CMD_GS2U_Guild_FastJoin_Set_Ack:16/little>>,
		Bin_guildID,
		Bin_force
	];

%GENERATED from file:guild.h => GS2U_Guild_GodBless_Ack
packNetMsg(#pk_GS2U_Guild_GodBless_Ack{} = P) ->
	Bin_time = binary_write_uint( P#pk_GS2U_Guild_GodBless_Ack.time ),
	Bin_count = binary_write_uint8( P#pk_GS2U_Guild_GodBless_Ack.count ),
	[
		<<?CMD_GS2U_Guild_GodBless_Ack:16/little>>,
		Bin_time,
		Bin_count
	];

%GENERATED from file:guild.h => GS2U_Guild_GodBless_Schedule_Reward_Ack
packNetMsg(#pk_GS2U_Guild_GodBless_Schedule_Reward_Ack{} = P) ->
	Bin_id = binary_write_uint( P#pk_GS2U_Guild_GodBless_Schedule_Reward_Ack.id ),
	[
		<<?CMD_GS2U_Guild_GodBless_Schedule_Reward_Ack:16/little>>,
		Bin_id
	];

%GENERATED from file:guild.h => GS2U_Guild_GodBless_Schedule_Sync
packNetMsg(#pk_GS2U_Guild_GodBless_Schedule_Sync{} = P) ->
	Bin_schedule = binary_write_uint( P#pk_GS2U_Guild_GodBless_Schedule_Sync.schedule ),
	Bin_listID = binary_write_array(P#pk_GS2U_Guild_GodBless_Schedule_Sync.listID, fun(X) -> binary_write_uint( X ) end),
	[
		<<?CMD_GS2U_Guild_GodBless_Schedule_Sync:16/little>>,
		Bin_schedule,
		Bin_listID
	];

%GENERATED from file:guild.h => GS2U_Guild_OpenSupplication_Ack
packNetMsg(#pk_GS2U_Guild_OpenSupplication_Ack{} = P) ->
	Bin_listInfo = binary_write_array(P#pk_GS2U_Guild_OpenSupplication_Ack.listInfo, fun(X) -> writeSupplication( X ) end),
	[
		<<?CMD_GS2U_Guild_OpenSupplication_Ack:16/little>>,
		Bin_listInfo
	];

%GENERATED from file:guild.h => GS2U_Guild_ShopBuy_Ack
packNetMsg(#pk_GS2U_Guild_ShopBuy_Ack{} = P) ->
	Bin_id = binary_write_uint( P#pk_GS2U_Guild_ShopBuy_Ack.id ),
	Bin_count = binary_write_uint( P#pk_GS2U_Guild_ShopBuy_Ack.count ),
	Bin_errorCode = binary_write_uint( P#pk_GS2U_Guild_ShopBuy_Ack.errorCode ),
	[
		<<?CMD_GS2U_Guild_ShopBuy_Ack:16/little>>,
		Bin_id,
		Bin_count,
		Bin_errorCode
	];

%GENERATED from file:guild.h => GS2U_Guild_SnowmanAll_Sync
packNetMsg(#pk_GS2U_Guild_SnowmanAll_Sync{} = P) ->
	Bin_count = binary_write_uint( P#pk_GS2U_Guild_SnowmanAll_Sync.count ),
	Bin_countMax = binary_write_uint( P#pk_GS2U_Guild_SnowmanAll_Sync.countMax ),
	Bin_subState = binary_write_uint( P#pk_GS2U_Guild_SnowmanAll_Sync.subState ),
	Bin_listResSnowman = binary_write_array(P#pk_GS2U_Guild_SnowmanAll_Sync.listResSnowman, fun(X) -> binary_write_uint( X ) end),
	Bin_listResPlayer = binary_write_array(P#pk_GS2U_Guild_SnowmanAll_Sync.listResPlayer, fun(X) -> binary_write_uint( X ) end),
	[
		<<?CMD_GS2U_Guild_SnowmanAll_Sync:16/little>>,
		Bin_count,
		Bin_countMax,
		Bin_subState,
		Bin_listResSnowman,
		Bin_listResPlayer
	];

%GENERATED from file:guild.h => GS2U_Guild_SnowmanBegin_Sync
packNetMsg(#pk_GS2U_Guild_SnowmanBegin_Sync{}) ->
	[
		<<?CMD_GS2U_Guild_SnowmanBegin_Sync:16/little>>

	];

%GENERATED from file:guild.h => GS2U_Guild_SnowmanCompleteCount_Sync
packNetMsg(#pk_GS2U_Guild_SnowmanCompleteCount_Sync{} = P) ->
	Bin_count = binary_write_uint( P#pk_GS2U_Guild_SnowmanCompleteCount_Sync.count ),
	Bin_listMark = binary_write_array(P#pk_GS2U_Guild_SnowmanCompleteCount_Sync.listMark, fun(X) -> binary_write_bool( X ) end),
	[
		<<?CMD_GS2U_Guild_SnowmanCompleteCount_Sync:16/little>>,
		Bin_count,
		Bin_listMark
	];

%GENERATED from file:guild.h => GS2U_Guild_SnowmanExtraRes_Sync
packNetMsg(#pk_GS2U_Guild_SnowmanExtraRes_Sync{} = P) ->
	Bin_count = binary_write_uint( P#pk_GS2U_Guild_SnowmanExtraRes_Sync.count ),
	[
		<<?CMD_GS2U_Guild_SnowmanExtraRes_Sync:16/little>>,
		Bin_count
	];

%GENERATED from file:guild.h => GS2U_Guild_SnowmanPlayer_Sync
packNetMsg(#pk_GS2U_Guild_SnowmanPlayer_Sync{} = P) ->
	Bin_listResPlayer = binary_write_array(P#pk_GS2U_Guild_SnowmanPlayer_Sync.listResPlayer, fun(X) -> binary_write_uint( X ) end),
	[
		<<?CMD_GS2U_Guild_SnowmanPlayer_Sync:16/little>>,
		Bin_listResPlayer
	];

%GENERATED from file:guild.h => GS2U_Guild_SnowmanSettle_Sync
packNetMsg(#pk_GS2U_Guild_SnowmanSettle_Sync{} = P) ->
	Bin_count = binary_write_uint( P#pk_GS2U_Guild_SnowmanSettle_Sync.count ),
	Bin_guildName = binary_write_string( P#pk_GS2U_Guild_SnowmanSettle_Sync.guildName ),
	[
		<<?CMD_GS2U_Guild_SnowmanSettle_Sync:16/little>>,
		Bin_count,
		Bin_guildName
	];

%GENERATED from file:guild.h => GS2U_Guild_SnowmanSnowman_Sync
packNetMsg(#pk_GS2U_Guild_SnowmanSnowman_Sync{} = P) ->
	Bin_count = binary_write_uint( P#pk_GS2U_Guild_SnowmanSnowman_Sync.count ),
	Bin_countMax = binary_write_uint( P#pk_GS2U_Guild_SnowmanSnowman_Sync.countMax ),
	Bin_subState = binary_write_uint( P#pk_GS2U_Guild_SnowmanSnowman_Sync.subState ),
	Bin_listResSnowman = binary_write_array(P#pk_GS2U_Guild_SnowmanSnowman_Sync.listResSnowman, fun(X) -> binary_write_uint( X ) end),
	[
		<<?CMD_GS2U_Guild_SnowmanSnowman_Sync:16/little>>,
		Bin_count,
		Bin_countMax,
		Bin_subState,
		Bin_listResSnowman
	];

%GENERATED from file:guild.h => GS2U_Guild_SupplicateGiveF_Ack
packNetMsg(#pk_GS2U_Guild_SupplicateGiveF_Ack{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_Guild_SupplicateGiveF_Ack.type ),
	Bin_tarRoleID = binary_write_uint64( P#pk_GS2U_Guild_SupplicateGiveF_Ack.tarRoleID ),
	[
		<<?CMD_GS2U_Guild_SupplicateGiveF_Ack:16/little>>,
		Bin_type,
		Bin_tarRoleID
	];

%GENERATED from file:guild.h => GS2U_Guild_SupplicateGive_Ack
packNetMsg(#pk_GS2U_Guild_SupplicateGive_Ack{} = P) ->
	Bin_history = writeSuppHistory2( P#pk_GS2U_Guild_SupplicateGive_Ack.history ),
	Bin_nameTables = binary_write_array(P#pk_GS2U_Guild_SupplicateGive_Ack.nameTables, fun(X) -> writeNameTable2( X ) end),
	[
		<<?CMD_GS2U_Guild_SupplicateGive_Ack:16/little>>,
		Bin_history,
		Bin_nameTables
	];

%GENERATED from file:guild.h => GS2U_Guild_SupplicateGive_Sync
packNetMsg(#pk_GS2U_Guild_SupplicateGive_Sync{} = P) ->
	Bin_listHistory = binary_write_array(P#pk_GS2U_Guild_SupplicateGive_Sync.listHistory, fun(X) -> writeSuppHistory2( X ) end),
	Bin_nameTables = binary_write_array(P#pk_GS2U_Guild_SupplicateGive_Sync.nameTables, fun(X) -> writeNameTable2( X ) end),
	[
		<<?CMD_GS2U_Guild_SupplicateGive_Sync:16/little>>,
		Bin_listHistory,
		Bin_nameTables
	];

%GENERATED from file:guild.h => GS2U_Guild_Supplicate_Ack
packNetMsg(#pk_GS2U_Guild_Supplicate_Ack{} = P) ->
	Bin_itemID = binary_write_uint16( P#pk_GS2U_Guild_Supplicate_Ack.itemID ),
	[
		<<?CMD_GS2U_Guild_Supplicate_Ack:16/little>>,
		Bin_itemID
	];

%GENERATED from file:guild.h => GS2U_ImpeachInfo
packNetMsg(#pk_GS2U_ImpeachInfo{} = P) ->
	Bin_canImpeach = binary_write_uint8( P#pk_GS2U_ImpeachInfo.canImpeach ),
	Bin_supportNumber = binary_write_uint8( P#pk_GS2U_ImpeachInfo.supportNumber ),
	Bin_impeacherID = binary_write_uint64( P#pk_GS2U_ImpeachInfo.impeacherID ),
	Bin_impeacherName = binary_write_string( P#pk_GS2U_ImpeachInfo.impeacherName ),
	Bin_impeacheLeftTime = binary_write_uint64( P#pk_GS2U_ImpeachInfo.impeacheLeftTime ),
	[
		<<?CMD_GS2U_ImpeachInfo:16/little>>,
		Bin_canImpeach,
		Bin_supportNumber,
		Bin_impeacherID,
		Bin_impeacherName,
		Bin_impeacheLeftTime
	];

%GENERATED from file:guild.h => GS2U_JoinGuild_Sync
packNetMsg(#pk_GS2U_JoinGuild_Sync{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_GS2U_JoinGuild_Sync.guildID ),
	[
		<<?CMD_GS2U_JoinGuild_Sync:16/little>>,
		Bin_guildID
	];

%GENERATED from file:guild.h => GS2U_OccupyOwnerChange
packNetMsg(#pk_GS2U_OccupyOwnerChange{} = P) ->
	Bin_remainSec = binary_write_uint( P#pk_GS2U_OccupyOwnerChange.remainSec ),
	Bin_owner = writeOccupyGuildInfo( P#pk_GS2U_OccupyOwnerChange.owner ),
	Bin_target = writeOccupyGuildInfo( P#pk_GS2U_OccupyOwnerChange.target ),
	Bin_playerInfos = binary_write_array(P#pk_GS2U_OccupyOwnerChange.playerInfos, fun(X) -> writeGuildBattlePlayerInfo( X ) end),
	[
		<<?CMD_GS2U_OccupyOwnerChange:16/little>>,
		Bin_remainSec,
		Bin_owner,
		Bin_target,
		Bin_playerInfos
	];

%GENERATED from file:guild.h => GS2U_OneKeyRecruit_Ack
packNetMsg(#pk_GS2U_OneKeyRecruit_Ack{} = P) ->
	Bin_cd = binary_write_uint( P#pk_GS2U_OneKeyRecruit_Ack.cd ),
	Bin_ret = binary_write_uint( P#pk_GS2U_OneKeyRecruit_Ack.ret ),
	[
		<<?CMD_GS2U_OneKeyRecruit_Ack:16/little>>,
		Bin_cd,
		Bin_ret
	];

%GENERATED from file:guild.h => GS2U_OpenGuildForm
packNetMsg(#pk_GS2U_OpenGuildForm{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_GS2U_OpenGuildForm.guildID ),
	Bin_guildName = binary_write_string( P#pk_GS2U_OpenGuildForm.guildName ),
	Bin_guildLevel = binary_write_uint8( P#pk_GS2U_OpenGuildForm.guildLevel ),
	Bin_fightForce = binary_write_uint( P#pk_GS2U_OpenGuildForm.fightForce ),
	Bin_memberNumber = binary_write_uint( P#pk_GS2U_OpenGuildForm.memberNumber ),
	Bin_maxMemberNumber = binary_write_uint( P#pk_GS2U_OpenGuildForm.maxMemberNumber ),
	Bin_resource = binary_write_uint( P#pk_GS2U_OpenGuildForm.resource ),
	Bin_liveness = binary_write_uint( P#pk_GS2U_OpenGuildForm.liveness ),
	Bin_notice = binary_write_string( P#pk_GS2U_OpenGuildForm.notice ),
	Bin_denoter = binary_write_uint8( P#pk_GS2U_OpenGuildForm.denoter ),
	Bin_shopLevel = binary_write_uint8( P#pk_GS2U_OpenGuildForm.shopLevel ),
	Bin_requestJoinNum = binary_write_uint( P#pk_GS2U_OpenGuildForm.requestJoinNum ),
	Bin_selfContribute = binary_write_uint( P#pk_GS2U_OpenGuildForm.selfContribute ),
	Bin_selfGuildLevel = binary_write_uint8( P#pk_GS2U_OpenGuildForm.selfGuildLevel ),
	Bin_cd = binary_write_uint( P#pk_GS2U_OpenGuildForm.cd ),
	[
		<<?CMD_GS2U_OpenGuildForm:16/little>>,
		Bin_guildID,
		Bin_guildName,
		Bin_guildLevel,
		Bin_fightForce,
		Bin_memberNumber,
		Bin_maxMemberNumber,
		Bin_resource,
		Bin_liveness,
		Bin_notice,
		Bin_denoter,
		Bin_shopLevel,
		Bin_requestJoinNum,
		Bin_selfContribute,
		Bin_selfGuildLevel,
		Bin_cd
	];

%GENERATED from file:guild.h => GS2U_QueryGuildInfoByRoleID_Ack
packNetMsg(#pk_GS2U_QueryGuildInfoByRoleID_Ack{} = P) ->
	Bin_guildInfo = writeGuildInfo( P#pk_GS2U_QueryGuildInfoByRoleID_Ack.guildInfo ),
	[
		<<?CMD_GS2U_QueryGuildInfoByRoleID_Ack:16/little>>,
		Bin_guildInfo
	];

%GENERATED from file:guild.h => GS2U_QueryImpeachInfo
packNetMsg(#pk_GS2U_QueryImpeachInfo{}) ->
	[
		<<?CMD_GS2U_QueryImpeachInfo:16/little>>

	];

%GENERATED from file:guild.h => GS2U_Recruit
packNetMsg(#pk_GS2U_Recruit{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_Recruit.roleID ),
	Bin_roleName = binary_write_string( P#pk_GS2U_Recruit.roleName ),
	Bin_guildInfo = writeGuildInfo( P#pk_GS2U_Recruit.guildInfo ),
	[
		<<?CMD_GS2U_Recruit:16/little>>,
		Bin_roleID,
		Bin_roleName,
		Bin_guildInfo
	];

%GENERATED from file:guild.h => GS2U_RefreshGuildProp
packNetMsg(#pk_GS2U_RefreshGuildProp{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_GS2U_RefreshGuildProp.guildID ),
	Bin_resource = binary_write_uint( P#pk_GS2U_RefreshGuildProp.resource ),
	Bin_liveness = binary_write_uint( P#pk_GS2U_RefreshGuildProp.liveness ),
	Bin_selfContribute = binary_write_uint( P#pk_GS2U_RefreshGuildProp.selfContribute ),
	[
		<<?CMD_GS2U_RefreshGuildProp:16/little>>,
		Bin_guildID,
		Bin_resource,
		Bin_liveness,
		Bin_selfContribute
	];

%GENERATED from file:guild.h => GS2U_RequestJoinGuildList
packNetMsg(#pk_GS2U_RequestJoinGuildList{} = P) ->
	Bin_requestList = binary_write_array(P#pk_GS2U_RequestJoinGuildList.requestList, fun(X) -> writeGuildApplyMemberInfo( X ) end),
	[
		<<?CMD_GS2U_RequestJoinGuildList:16/little>>,
		Bin_requestList
	];

%GENERATED from file:guild.h => GS2U_RequestJoinGuild_Ack
packNetMsg(#pk_GS2U_RequestJoinGuild_Ack{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_GS2U_RequestJoinGuild_Ack.guildID ),
	Bin_cancelID = binary_write_uint64( P#pk_GS2U_RequestJoinGuild_Ack.cancelID ),
	[
		<<?CMD_GS2U_RequestJoinGuild_Ack:16/little>>,
		Bin_guildID,
		Bin_cancelID
	];

%GENERATED from file:guild.h => GS2U_RequestLookMemberList
packNetMsg(#pk_GS2U_RequestLookMemberList{} = P) ->
	Bin_nowPage = binary_write_uint( P#pk_GS2U_RequestLookMemberList.nowPage ),
	Bin_maxPage = binary_write_uint( P#pk_GS2U_RequestLookMemberList.maxPage ),
	Bin_memberList = binary_write_array(P#pk_GS2U_RequestLookMemberList.memberList, fun(X) -> writeGuildMemberInfo( X ) end),
	[
		<<?CMD_GS2U_RequestLookMemberList:16/little>>,
		Bin_nowPage,
		Bin_maxPage,
		Bin_memberList
	];

%GENERATED from file:guild.h => GS2U_ReturnDonateTimes
packNetMsg(#pk_GS2U_ReturnDonateTimes{} = P) ->
	Bin_moneyType = binary_write_uint8( P#pk_GS2U_ReturnDonateTimes.moneyType ),
	Bin_times = binary_write_uint16( P#pk_GS2U_ReturnDonateTimes.times ),
	[
		<<?CMD_GS2U_ReturnDonateTimes:16/little>>,
		Bin_moneyType,
		Bin_times
	];

%GENERATED from file:guild.h => GS2U_ShopUpgrade
packNetMsg(#pk_GS2U_ShopUpgrade{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_GS2U_ShopUpgrade.guildID ),
	Bin_shopLevel = binary_write_uint8( P#pk_GS2U_ShopUpgrade.shopLevel ),
	[
		<<?CMD_GS2U_ShopUpgrade:16/little>>,
		Bin_guildID,
		Bin_shopLevel
	];

%GENERATED from file:guild.h => GS2U_Upgrade_Ack
packNetMsg(#pk_GS2U_Upgrade_Ack{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_GS2U_Upgrade_Ack.guildID ),
	Bin_level = binary_write_uint( P#pk_GS2U_Upgrade_Ack.level ),
	[
		<<?CMD_GS2U_Upgrade_Ack:16/little>>,
		Bin_guildID,
		Bin_level
	];

%GENERATED from file:guild.h => U2GS_AcceptGuildTask
packNetMsg(#pk_U2GS_AcceptGuildTask{} = P) ->
	Bin_taskType = binary_write_uint8( P#pk_U2GS_AcceptGuildTask.taskType ),
	[
		<<?CMD_U2GS_AcceptGuildTask:16/little>>,
		Bin_taskType
	];

%GENERATED from file:guild.h => U2GS_AgreeRecruit
packNetMsg(#pk_U2GS_AgreeRecruit{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_U2GS_AgreeRecruit.guildID ),
	Bin_roleID = binary_write_uint64( P#pk_U2GS_AgreeRecruit.roleID ),
	Bin_agree = binary_write_uint8( P#pk_U2GS_AgreeRecruit.agree ),
	[
		<<?CMD_U2GS_AgreeRecruit:16/little>>,
		Bin_guildID,
		Bin_roleID,
		Bin_agree
	];

%GENERATED from file:guild.h => U2GS_Bidding
packNetMsg(#pk_U2GS_Bidding{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_U2GS_Bidding.guildID ),
	[
		<<?CMD_U2GS_Bidding:16/little>>,
		Bin_guildID
	];

%GENERATED from file:guild.h => U2GS_BuyGuildBuff
packNetMsg(#pk_U2GS_BuyGuildBuff{} = P) ->
	Bin_confId = binary_write_uint( P#pk_U2GS_BuyGuildBuff.confId ),
	[
		<<?CMD_U2GS_BuyGuildBuff:16/little>>,
		Bin_confId
	];

%GENERATED from file:guild.h => U2GS_ChangeDenoter
packNetMsg(#pk_U2GS_ChangeDenoter{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_U2GS_ChangeDenoter.guildID ),
	Bin_denoter = binary_write_uint8( P#pk_U2GS_ChangeDenoter.denoter ),
	[
		<<?CMD_U2GS_ChangeDenoter:16/little>>,
		Bin_guildID,
		Bin_denoter
	];

%GENERATED from file:guild.h => U2GS_ChangeGuildName
packNetMsg(#pk_U2GS_ChangeGuildName{} = P) ->
	Bin_newGuildName = binary_write_string( P#pk_U2GS_ChangeGuildName.newGuildName ),
	[
		<<?CMD_U2GS_ChangeGuildName:16/little>>,
		Bin_newGuildName
	];

%GENERATED from file:guild.h => U2GS_ChangeLeader
packNetMsg(#pk_U2GS_ChangeLeader{} = P) ->
	Bin_targetRoleID = binary_write_uint64( P#pk_U2GS_ChangeLeader.targetRoleID ),
	[
		<<?CMD_U2GS_ChangeLeader:16/little>>,
		Bin_targetRoleID
	];

%GENERATED from file:guild.h => U2GS_ChangeNotice
packNetMsg(#pk_U2GS_ChangeNotice{} = P) ->
	Bin_guildNotice = binary_write_string( P#pk_U2GS_ChangeNotice.guildNotice ),
	[
		<<?CMD_U2GS_ChangeNotice:16/little>>,
		Bin_guildNotice
	];

%GENERATED from file:guild.h => U2GS_CreateGuild
packNetMsg(#pk_U2GS_CreateGuild{} = P) ->
	Bin_guildName = binary_write_string( P#pk_U2GS_CreateGuild.guildName ),
	Bin_denoter = binary_write_uint8( P#pk_U2GS_CreateGuild.denoter ),
	Bin_guildNotice = binary_write_string( P#pk_U2GS_CreateGuild.guildNotice ),
	[
		<<?CMD_U2GS_CreateGuild:16/little>>,
		Bin_guildName,
		Bin_denoter,
		Bin_guildNotice
	];

%GENERATED from file:guild.h => U2GS_DealRequestJoin
packNetMsg(#pk_U2GS_DealRequestJoin{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_U2GS_DealRequestJoin.guildID ),
	Bin_roleIDs = binary_write_array(P#pk_U2GS_DealRequestJoin.roleIDs, fun(X) -> binary_write_uint64( X ) end),
	Bin_agree = binary_write_uint8( P#pk_U2GS_DealRequestJoin.agree ),
	[
		<<?CMD_U2GS_DealRequestJoin:16/little>>,
		Bin_guildID,
		Bin_roleIDs,
		Bin_agree
	];

%GENERATED from file:guild.h => U2GS_DeleteGuild
packNetMsg(#pk_U2GS_DeleteGuild{}) ->
	[
		<<?CMD_U2GS_DeleteGuild:16/little>>

	];

%GENERATED from file:guild.h => U2GS_DonateMoney
packNetMsg(#pk_U2GS_DonateMoney{} = P) ->
	Bin_moneyType = binary_write_uint8( P#pk_U2GS_DonateMoney.moneyType ),
	Bin_moneyNumber = binary_write_uint( P#pk_U2GS_DonateMoney.moneyNumber ),
	[
		<<?CMD_U2GS_DonateMoney:16/little>>,
		Bin_moneyType,
		Bin_moneyNumber
	];

%GENERATED from file:guild.h => U2GS_EnterGuildBattle
packNetMsg(#pk_U2GS_EnterGuildBattle{}) ->
	[
		<<?CMD_U2GS_EnterGuildBattle:16/little>>

	];

%GENERATED from file:guild.h => U2GS_EnterGuildHome
packNetMsg(#pk_U2GS_EnterGuildHome{} = P) ->
	Bin_targetGuildID = binary_write_uint64( P#pk_U2GS_EnterGuildHome.targetGuildID ),
	[
		<<?CMD_U2GS_EnterGuildHome:16/little>>,
		Bin_targetGuildID
	];

%GENERATED from file:guild.h => U2GS_ExitGuild
packNetMsg(#pk_U2GS_ExitGuild{}) ->
	[
		<<?CMD_U2GS_ExitGuild:16/little>>

	];

%GENERATED from file:guild.h => U2GS_ExpeditionBroadcastPos
packNetMsg(#pk_U2GS_ExpeditionBroadcastPos{} = P) ->
	Bin_type = binary_write_uint16( P#pk_U2GS_ExpeditionBroadcastPos.type ),
	[
		<<?CMD_U2GS_ExpeditionBroadcastPos:16/little>>,
		Bin_type
	];

%GENERATED from file:guild.h => U2GS_GetGuildHomeReward
packNetMsg(#pk_U2GS_GetGuildHomeReward{} = P) ->
	Bin_taskType = binary_write_uint8( P#pk_U2GS_GetGuildHomeReward.taskType ),
	[
		<<?CMD_U2GS_GetGuildHomeReward:16/little>>,
		Bin_taskType
	];

%GENERATED from file:guild.h => U2GS_GetGuildPrize
packNetMsg(#pk_U2GS_GetGuildPrize{}) ->
	[
		<<?CMD_U2GS_GetGuildPrize:16/little>>

	];

%GENERATED from file:guild.h => U2GS_GiveMeExpeditionRewardEverDay
packNetMsg(#pk_U2GS_GiveMeExpeditionRewardEverDay{} = P) ->
	Bin_mapid = binary_write_uint( P#pk_U2GS_GiveMeExpeditionRewardEverDay.mapid ),
	[
		<<?CMD_U2GS_GiveMeExpeditionRewardEverDay:16/little>>,
		Bin_mapid
	];

%GENERATED from file:guild.h => U2GS_GivePower
packNetMsg(#pk_U2GS_GivePower{} = P) ->
	Bin_targetRoleID = binary_write_uint64( P#pk_U2GS_GivePower.targetRoleID ),
	Bin_guileLevel = binary_write_uint8( P#pk_U2GS_GivePower.guileLevel ),
	[
		<<?CMD_U2GS_GivePower:16/little>>,
		Bin_targetRoleID,
		Bin_guileLevel
	];

%GENERATED from file:guild.h => U2GS_GiveUpGuildTask
packNetMsg(#pk_U2GS_GiveUpGuildTask{} = P) ->
	Bin_taskType = binary_write_uint8( P#pk_U2GS_GiveUpGuildTask.taskType ),
	[
		<<?CMD_U2GS_GiveUpGuildTask:16/little>>,
		Bin_taskType
	];

%GENERATED from file:guild.h => U2GS_GuildBattleApply
packNetMsg(#pk_U2GS_GuildBattleApply{}) ->
	[
		<<?CMD_U2GS_GuildBattleApply:16/little>>

	];

%GENERATED from file:guild.h => U2GS_GuildList
packNetMsg(#pk_U2GS_GuildList{} = P) ->
	Bin_requestPageNumber = binary_write_uint( P#pk_U2GS_GuildList.requestPageNumber ),
	[
		<<?CMD_U2GS_GuildList:16/little>>,
		Bin_requestPageNumber
	];

%GENERATED from file:guild.h => U2GS_GuildReward
packNetMsg(#pk_U2GS_GuildReward{}) ->
	[
		<<?CMD_U2GS_GuildReward:16/little>>

	];

%GENERATED from file:guild.h => U2GS_Guild_Exchange_Request
packNetMsg(#pk_U2GS_Guild_Exchange_Request{} = P) ->
	Bin_id = binary_write_uint( P#pk_U2GS_Guild_Exchange_Request.id ),
	Bin_level = binary_write_uint( P#pk_U2GS_Guild_Exchange_Request.level ),
	[
		<<?CMD_U2GS_Guild_Exchange_Request:16/little>>,
		Bin_id,
		Bin_level
	];

%GENERATED from file:guild.h => U2GS_Guild_FairgroundEnter_Request
packNetMsg(#pk_U2GS_Guild_FairgroundEnter_Request{} = P) ->
	Bin_targetGuildID = binary_write_uint64( P#pk_U2GS_Guild_FairgroundEnter_Request.targetGuildID ),
	[
		<<?CMD_U2GS_Guild_FairgroundEnter_Request:16/little>>,
		Bin_targetGuildID
	];

%GENERATED from file:guild.h => U2GS_Guild_FairgroundRide_Request
packNetMsg(#pk_U2GS_Guild_FairgroundRide_Request{} = P) ->
	Bin_id = binary_write_uint( P#pk_U2GS_Guild_FairgroundRide_Request.id ),
	Bin_type = binary_write_uint8( P#pk_U2GS_Guild_FairgroundRide_Request.type ),
	[
		<<?CMD_U2GS_Guild_FairgroundRide_Request:16/little>>,
		Bin_id,
		Bin_type
	];

%GENERATED from file:guild.h => U2GS_Guild_FastJoin_Get_Request
packNetMsg(#pk_U2GS_Guild_FastJoin_Get_Request{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_U2GS_Guild_FastJoin_Get_Request.guildID ),
	[
		<<?CMD_U2GS_Guild_FastJoin_Get_Request:16/little>>,
		Bin_guildID
	];

%GENERATED from file:guild.h => U2GS_Guild_FastJoin_Request
packNetMsg(#pk_U2GS_Guild_FastJoin_Request{}) ->
	[
		<<?CMD_U2GS_Guild_FastJoin_Request:16/little>>

	];

%GENERATED from file:guild.h => U2GS_Guild_FastJoin_Set_Request
packNetMsg(#pk_U2GS_Guild_FastJoin_Set_Request{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_U2GS_Guild_FastJoin_Set_Request.guildID ),
	Bin_force = binary_write_uint64( P#pk_U2GS_Guild_FastJoin_Set_Request.force ),
	[
		<<?CMD_U2GS_Guild_FastJoin_Set_Request:16/little>>,
		Bin_guildID,
		Bin_force
	];

%GENERATED from file:guild.h => U2GS_Guild_GodBless_Request
packNetMsg(#pk_U2GS_Guild_GodBless_Request{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_Guild_GodBless_Request.type ),
	[
		<<?CMD_U2GS_Guild_GodBless_Request:16/little>>,
		Bin_type
	];

%GENERATED from file:guild.h => U2GS_Guild_GodBless_Schedule_Request
packNetMsg(#pk_U2GS_Guild_GodBless_Schedule_Request{}) ->
	[
		<<?CMD_U2GS_Guild_GodBless_Schedule_Request:16/little>>

	];

%GENERATED from file:guild.h => U2GS_Guild_GodBless_Schedule_Reward_Request
packNetMsg(#pk_U2GS_Guild_GodBless_Schedule_Reward_Request{} = P) ->
	Bin_id = binary_write_uint( P#pk_U2GS_Guild_GodBless_Schedule_Reward_Request.id ),
	[
		<<?CMD_U2GS_Guild_GodBless_Schedule_Reward_Request:16/little>>,
		Bin_id
	];

%GENERATED from file:guild.h => U2GS_Guild_OpenSupplication_Request
packNetMsg(#pk_U2GS_Guild_OpenSupplication_Request{}) ->
	[
		<<?CMD_U2GS_Guild_OpenSupplication_Request:16/little>>

	];

%GENERATED from file:guild.h => U2GS_Guild_ShopBuy_Request
packNetMsg(#pk_U2GS_Guild_ShopBuy_Request{} = P) ->
	Bin_id = binary_write_uint( P#pk_U2GS_Guild_ShopBuy_Request.id ),
	Bin_count = binary_write_uint( P#pk_U2GS_Guild_ShopBuy_Request.count ),
	[
		<<?CMD_U2GS_Guild_ShopBuy_Request:16/little>>,
		Bin_id,
		Bin_count
	];

%GENERATED from file:guild.h => U2GS_Guild_SnowmanCheck_Request
packNetMsg(#pk_U2GS_Guild_SnowmanCheck_Request{}) ->
	[
		<<?CMD_U2GS_Guild_SnowmanCheck_Request:16/little>>

	];

%GENERATED from file:guild.h => U2GS_Guild_SnowmanDonate_Request
packNetMsg(#pk_U2GS_Guild_SnowmanDonate_Request{} = P) ->
	Bin_id = binary_write_uint( P#pk_U2GS_Guild_SnowmanDonate_Request.id ),
	Bin_snowmanID = binary_write_uint( P#pk_U2GS_Guild_SnowmanDonate_Request.snowmanID ),
	[
		<<?CMD_U2GS_Guild_SnowmanDonate_Request:16/little>>,
		Bin_id,
		Bin_snowmanID
	];

%GENERATED from file:guild.h => U2GS_Guild_SnowmanReward_Request
packNetMsg(#pk_U2GS_Guild_SnowmanReward_Request{} = P) ->
	Bin_id = binary_write_uint( P#pk_U2GS_Guild_SnowmanReward_Request.id ),
	[
		<<?CMD_U2GS_Guild_SnowmanReward_Request:16/little>>,
		Bin_id
	];

%GENERATED from file:guild.h => U2GS_Guild_SupplicateGive_Request
packNetMsg(#pk_U2GS_Guild_SupplicateGive_Request{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_Guild_SupplicateGive_Request.roleID ),
	Bin_itemID = binary_write_uint16( P#pk_U2GS_Guild_SupplicateGive_Request.itemID ),
	[
		<<?CMD_U2GS_Guild_SupplicateGive_Request:16/little>>,
		Bin_roleID,
		Bin_itemID
	];

%GENERATED from file:guild.h => U2GS_Guild_Supplicate_Request
packNetMsg(#pk_U2GS_Guild_Supplicate_Request{} = P) ->
	Bin_itemID = binary_write_uint16( P#pk_U2GS_Guild_Supplicate_Request.itemID ),
	[
		<<?CMD_U2GS_Guild_Supplicate_Request:16/little>>,
		Bin_itemID
	];

%GENERATED from file:guild.h => U2GS_ImpeachCreater
packNetMsg(#pk_U2GS_ImpeachCreater{}) ->
	[
		<<?CMD_U2GS_ImpeachCreater:16/little>>

	];

%GENERATED from file:guild.h => U2GS_KickGuild
packNetMsg(#pk_U2GS_KickGuild{} = P) ->
	Bin_targetRoleID = binary_write_uint64( P#pk_U2GS_KickGuild.targetRoleID ),
	[
		<<?CMD_U2GS_KickGuild:16/little>>,
		Bin_targetRoleID
	];

%GENERATED from file:guild.h => U2GS_OneKeyRecruit_Request
packNetMsg(#pk_U2GS_OneKeyRecruit_Request{}) ->
	[
		<<?CMD_U2GS_OneKeyRecruit_Request:16/little>>

	];

%GENERATED from file:guild.h => U2GS_OpenGuildForm
packNetMsg(#pk_U2GS_OpenGuildForm{}) ->
	[
		<<?CMD_U2GS_OpenGuildForm:16/little>>

	];

%GENERATED from file:guild.h => U2GS_OpenGuildShop
packNetMsg(#pk_U2GS_OpenGuildShop{}) ->
	[
		<<?CMD_U2GS_OpenGuildShop:16/little>>

	];

%GENERATED from file:guild.h => U2GS_QueryExpeditionFinalInfo
packNetMsg(#pk_U2GS_QueryExpeditionFinalInfo{}) ->
	[
		<<?CMD_U2GS_QueryExpeditionFinalInfo:16/little>>

	];

%GENERATED from file:guild.h => U2GS_QueryExpeditionGlobalMapInfo
packNetMsg(#pk_U2GS_QueryExpeditionGlobalMapInfo{}) ->
	[
		<<?CMD_U2GS_QueryExpeditionGlobalMapInfo:16/little>>

	];

%GENERATED from file:guild.h => U2GS_QueryExpeditionMapBattleInfo
packNetMsg(#pk_U2GS_QueryExpeditionMapBattleInfo{} = P) ->
	Bin_mapid = binary_write_uint( P#pk_U2GS_QueryExpeditionMapBattleInfo.mapid ),
	[
		<<?CMD_U2GS_QueryExpeditionMapBattleInfo:16/little>>,
		Bin_mapid
	];

%GENERATED from file:guild.h => U2GS_QueryExpeditionMapInfo
packNetMsg(#pk_U2GS_QueryExpeditionMapInfo{}) ->
	[
		<<?CMD_U2GS_QueryExpeditionMapInfo:16/little>>

	];

%GENERATED from file:guild.h => U2GS_QueryGuildInfoByRoleID_Request
packNetMsg(#pk_U2GS_QueryGuildInfoByRoleID_Request{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_QueryGuildInfoByRoleID_Request.roleID ),
	[
		<<?CMD_U2GS_QueryGuildInfoByRoleID_Request:16/little>>,
		Bin_roleID
	];

%GENERATED from file:guild.h => U2GS_Recruit
packNetMsg(#pk_U2GS_Recruit{} = P) ->
	Bin_targetCode = binary_write_uint64( P#pk_U2GS_Recruit.targetCode ),
	[
		<<?CMD_U2GS_Recruit:16/little>>,
		Bin_targetCode
	];

%GENERATED from file:guild.h => U2GS_RequestDonateTimes
packNetMsg(#pk_U2GS_RequestDonateTimes{} = P) ->
	Bin_moneyType = binary_write_uint8( P#pk_U2GS_RequestDonateTimes.moneyType ),
	[
		<<?CMD_U2GS_RequestDonateTimes:16/little>>,
		Bin_moneyType
	];

%GENERATED from file:guild.h => U2GS_RequestGuildBattleResult
packNetMsg(#pk_U2GS_RequestGuildBattleResult{}) ->
	[
		<<?CMD_U2GS_RequestGuildBattleResult:16/little>>

	];

%GENERATED from file:guild.h => U2GS_RequestGuildBuff
packNetMsg(#pk_U2GS_RequestGuildBuff{}) ->
	[
		<<?CMD_U2GS_RequestGuildBuff:16/little>>

	];

%GENERATED from file:guild.h => U2GS_RequestGuildInfo_Request
packNetMsg(#pk_U2GS_RequestGuildInfo_Request{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_U2GS_RequestGuildInfo_Request.guildID ),
	[
		<<?CMD_U2GS_RequestGuildInfo_Request:16/little>>,
		Bin_guildID
	];

%GENERATED from file:guild.h => U2GS_RequestGuildSkill
packNetMsg(#pk_U2GS_RequestGuildSkill{}) ->
	[
		<<?CMD_U2GS_RequestGuildSkill:16/little>>

	];

%GENERATED from file:guild.h => U2GS_RequestGuildTask
packNetMsg(#pk_U2GS_RequestGuildTask{}) ->
	[
		<<?CMD_U2GS_RequestGuildTask:16/little>>

	];

%GENERATED from file:guild.h => U2GS_RequestGuildWar
packNetMsg(#pk_U2GS_RequestGuildWar{}) ->
	[
		<<?CMD_U2GS_RequestGuildWar:16/little>>

	];

%GENERATED from file:guild.h => U2GS_RequestJoinGuild
packNetMsg(#pk_U2GS_RequestJoinGuild{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_U2GS_RequestJoinGuild.guildID ),
	[
		<<?CMD_U2GS_RequestJoinGuild:16/little>>,
		Bin_guildID
	];

%GENERATED from file:guild.h => U2GS_RequestJoinGuildList
packNetMsg(#pk_U2GS_RequestJoinGuildList{}) ->
	[
		<<?CMD_U2GS_RequestJoinGuildList:16/little>>

	];

%GENERATED from file:guild.h => U2GS_RequestLookMemberList
packNetMsg(#pk_U2GS_RequestLookMemberList{} = P) ->
	Bin_requestPageNumber = binary_write_uint( P#pk_U2GS_RequestLookMemberList.requestPageNumber ),
	[
		<<?CMD_U2GS_RequestLookMemberList:16/little>>,
		Bin_requestPageNumber
	];

%GENERATED from file:guild.h => U2GS_ResearchGuildSkill
packNetMsg(#pk_U2GS_ResearchGuildSkill{} = P) ->
	Bin_confId = binary_write_uint( P#pk_U2GS_ResearchGuildSkill.confId ),
	[
		<<?CMD_U2GS_ResearchGuildSkill:16/little>>,
		Bin_confId
	];

%GENERATED from file:guild.h => U2GS_ShopUpgrade
packNetMsg(#pk_U2GS_ShopUpgrade{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_U2GS_ShopUpgrade.guildID ),
	[
		<<?CMD_U2GS_ShopUpgrade:16/little>>,
		Bin_guildID
	];

%GENERATED from file:guild.h => U2GS_StudyGuildSkill
packNetMsg(#pk_U2GS_StudyGuildSkill{} = P) ->
	Bin_confId = binary_write_uint( P#pk_U2GS_StudyGuildSkill.confId ),
	[
		<<?CMD_U2GS_StudyGuildSkill:16/little>>,
		Bin_confId
	];

%GENERATED from file:guild.h => U2GS_SummonHX
packNetMsg(#pk_U2GS_SummonHX{}) ->
	[
		<<?CMD_U2GS_SummonHX:16/little>>

	];

%GENERATED from file:guild.h => U2GS_SummonMonster
packNetMsg(#pk_U2GS_SummonMonster{}) ->
	[
		<<?CMD_U2GS_SummonMonster:16/little>>

	];

%GENERATED from file:guild.h => U2GS_SupportImpeachCreater
packNetMsg(#pk_U2GS_SupportImpeachCreater{}) ->
	[
		<<?CMD_U2GS_SupportImpeachCreater:16/little>>

	];

%GENERATED from file:guild.h => U2GS_Upgrade
packNetMsg(#pk_U2GS_Upgrade{} = P) ->
	Bin_guildID = binary_write_uint64( P#pk_U2GS_Upgrade.guildID ),
	[
		<<?CMD_U2GS_Upgrade:16/little>>,
		Bin_guildID
	];

%GENERATED from file:guild.h => U2GS_UseCannon
packNetMsg(#pk_U2GS_UseCannon{} = P) ->
	Bin_targetGuildID = binary_write_uint64( P#pk_U2GS_UseCannon.targetGuildID ),
	Bin_selectCode = binary_write_uint64( P#pk_U2GS_UseCannon.selectCode ),
	[
		<<?CMD_U2GS_UseCannon:16/little>>,
		Bin_targetGuildID,
		Bin_selectCode
	];

%GENERATED from file:guild.h => U2GS_getGuildBuff
packNetMsg(#pk_U2GS_getGuildBuff{} = P) ->
	Bin_confId = binary_write_uint( P#pk_U2GS_getGuildBuff.confId ),
	[
		<<?CMD_U2GS_getGuildBuff:16/little>>,
		Bin_confId
	];

%GENERATED from file:home.h => GS2U_FreshHomeAreaInfo
packNetMsg(#pk_GS2U_FreshHomeAreaInfo{} = P) ->
	Bin_homeID = binary_write_uint64( P#pk_GS2U_FreshHomeAreaInfo.homeID ),
	Bin_areas = binary_write_array(P#pk_GS2U_FreshHomeAreaInfo.areas, fun(X) -> writeHomeArea( X ) end),
	[
		<<?CMD_GS2U_FreshHomeAreaInfo:16/little>>,
		Bin_homeID,
		Bin_areas
	];

%GENERATED from file:home.h => GS2U_FreshHomeInfo
packNetMsg(#pk_GS2U_FreshHomeInfo{} = P) ->
	Bin_homeID = binary_write_uint64( P#pk_GS2U_FreshHomeInfo.homeID ),
	Bin_homeName = binary_write_string( P#pk_GS2U_FreshHomeInfo.homeName ),
	Bin_stylish = binary_write_uint( P#pk_GS2U_FreshHomeInfo.stylish ),
	Bin_comfort = binary_write_uint( P#pk_GS2U_FreshHomeInfo.comfort ),
	Bin_homeLvl = binary_write_uint( P#pk_GS2U_FreshHomeInfo.homeLvl ),
	Bin_popularity = binary_write_uint( P#pk_GS2U_FreshHomeInfo.popularity ),
	[
		<<?CMD_GS2U_FreshHomeInfo:16/little>>,
		Bin_homeID,
		Bin_homeName,
		Bin_stylish,
		Bin_comfort,
		Bin_homeLvl,
		Bin_popularity
	];

%GENERATED from file:home.h => GS2U_GetPetFoodResults_Sync
packNetMsg(#pk_GS2U_GetPetFoodResults_Sync{} = P) ->
	Bin_result = binary_write_uint8( P#pk_GS2U_GetPetFoodResults_Sync.result ),
	Bin_petID = binary_write_uint16( P#pk_GS2U_GetPetFoodResults_Sync.petID ),
	Bin_itemID = binary_write_uint16( P#pk_GS2U_GetPetFoodResults_Sync.itemID ),
	Bin_num = binary_write_uint8( P#pk_GS2U_GetPetFoodResults_Sync.num ),
	[
		<<?CMD_GS2U_GetPetFoodResults_Sync:16/little>>,
		Bin_result,
		Bin_petID,
		Bin_itemID,
		Bin_num
	];

%GENERATED from file:home.h => GS2U_HomeFarming_Sync
packNetMsg(#pk_GS2U_HomeFarming_Sync{} = P) ->
	Bin_petList = binary_write_array(P#pk_GS2U_HomeFarming_Sync.petList, fun(X) -> writeFarmingPet( X ) end),
	[
		<<?CMD_GS2U_HomeFarming_Sync:16/little>>,
		Bin_petList
	];

%GENERATED from file:home.h => GS2U_HomeInfo
packNetMsg(#pk_GS2U_HomeInfo{} = P) ->
	Bin_homeID = binary_write_uint64( P#pk_GS2U_HomeInfo.homeID ),
	Bin_homeName = binary_write_string( P#pk_GS2U_HomeInfo.homeName ),
	Bin_serverName = binary_write_string( P#pk_GS2U_HomeInfo.serverName ),
	Bin_ownerID = binary_write_uint64( P#pk_GS2U_HomeInfo.ownerID ),
	Bin_ownerName = binary_write_string( P#pk_GS2U_HomeInfo.ownerName ),
	Bin_mateID = binary_write_uint64( P#pk_GS2U_HomeInfo.mateID ),
	Bin_mateName = binary_write_string( P#pk_GS2U_HomeInfo.mateName ),
	Bin_stylish = binary_write_uint( P#pk_GS2U_HomeInfo.stylish ),
	Bin_comfort = binary_write_uint( P#pk_GS2U_HomeInfo.comfort ),
	Bin_homeLvl = binary_write_uint( P#pk_GS2U_HomeInfo.homeLvl ),
	Bin_popularity = binary_write_uint( P#pk_GS2U_HomeInfo.popularity ),
	Bin_leftID = binary_write_uint64( P#pk_GS2U_HomeInfo.leftID ),
	Bin_leftName = binary_write_string( P#pk_GS2U_HomeInfo.leftName ),
	Bin_rightID = binary_write_uint64( P#pk_GS2U_HomeInfo.rightID ),
	Bin_rightName = binary_write_string( P#pk_GS2U_HomeInfo.rightName ),
	Bin_areas = binary_write_array(P#pk_GS2U_HomeInfo.areas, fun(X) -> writeHomeArea( X ) end),
	[
		<<?CMD_GS2U_HomeInfo:16/little>>,
		Bin_homeID,
		Bin_homeName,
		Bin_serverName,
		Bin_ownerID,
		Bin_ownerName,
		Bin_mateID,
		Bin_mateName,
		Bin_stylish,
		Bin_comfort,
		Bin_homeLvl,
		Bin_popularity,
		Bin_leftID,
		Bin_leftName,
		Bin_rightID,
		Bin_rightName,
		Bin_areas
	];

%GENERATED from file:home.h => GS2U_HomePlantOperate_Ack
packNetMsg(#pk_GS2U_HomePlantOperate_Ack{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_HomePlantOperate_Ack.roleID ),
	Bin_operateType = binary_write_uint8( P#pk_GS2U_HomePlantOperate_Ack.operateType ),
	Bin_reason = binary_write_uint( P#pk_GS2U_HomePlantOperate_Ack.reason ),
	Bin_plant = writePlant( P#pk_GS2U_HomePlantOperate_Ack.plant ),
	[
		<<?CMD_GS2U_HomePlantOperate_Ack:16/little>>,
		Bin_roleID,
		Bin_operateType,
		Bin_reason,
		Bin_plant
	];

%GENERATED from file:home.h => GS2U_HomePlant_Sync
packNetMsg(#pk_GS2U_HomePlant_Sync{} = P) ->
	Bin_listPlant = binary_write_array(P#pk_GS2U_HomePlant_Sync.listPlant, fun(X) -> writePlant( X ) end),
	[
		<<?CMD_GS2U_HomePlant_Sync:16/little>>,
		Bin_listPlant
	];

%GENERATED from file:home.h => GS2U_HomeVisitList
packNetMsg(#pk_GS2U_HomeVisitList{} = P) ->
	Bin_allnumber = binary_write_uint16( P#pk_GS2U_HomeVisitList.allnumber ),
	Bin_paga = binary_write_uint8( P#pk_GS2U_HomeVisitList.paga ),
	Bin_visits = binary_write_array(P#pk_GS2U_HomeVisitList.visits, fun(X) -> writeHomeVisit( X ) end),
	[
		<<?CMD_GS2U_HomeVisitList:16/little>>,
		Bin_allnumber,
		Bin_paga,
		Bin_visits
	];

%GENERATED from file:home.h => GS2U_PutOutPetFarmingResults_Sync
packNetMsg(#pk_GS2U_PutOutPetFarmingResults_Sync{} = P) ->
	Bin_result = binary_write_uint8( P#pk_GS2U_PutOutPetFarmingResults_Sync.result ),
	Bin_petID = binary_write_uint16( P#pk_GS2U_PutOutPetFarmingResults_Sync.petID ),
	Bin_exp = binary_write_uint16( P#pk_GS2U_PutOutPetFarmingResults_Sync.exp ),
	Bin_minutes = binary_write_uint16( P#pk_GS2U_PutOutPetFarmingResults_Sync.minutes ),
	[
		<<?CMD_GS2U_PutOutPetFarmingResults_Sync:16/little>>,
		Bin_result,
		Bin_petID,
		Bin_exp,
		Bin_minutes
	];

%GENERATED from file:home.h => GS2U_PutPetInFarmingResults_Sync
packNetMsg(#pk_GS2U_PutPetInFarmingResults_Sync{} = P) ->
	Bin_result = binary_write_uint8( P#pk_GS2U_PutPetInFarmingResults_Sync.result ),
	Bin_petFarming = writeFarmingPet( P#pk_GS2U_PutPetInFarmingResults_Sync.petFarming ),
	[
		<<?CMD_GS2U_PutPetInFarmingResults_Sync:16/little>>,
		Bin_result,
		Bin_petFarming
	];

%GENERATED from file:home.h => GS2U_VisitRecord
packNetMsg(#pk_GS2U_VisitRecord{} = P) ->
	Bin_lists = binary_write_array(P#pk_GS2U_VisitRecord.lists, fun(X) -> writeVisitRecord( X ) end),
	[
		<<?CMD_GS2U_VisitRecord:16/little>>,
		Bin_lists
	];

%GENERATED from file:home.h => U2GS_ChangeHomeName
packNetMsg(#pk_U2GS_ChangeHomeName{} = P) ->
	Bin_homeID = binary_write_uint64( P#pk_U2GS_ChangeHomeName.homeID ),
	Bin_homeName = binary_write_string( P#pk_U2GS_ChangeHomeName.homeName ),
	[
		<<?CMD_U2GS_ChangeHomeName:16/little>>,
		Bin_homeID,
		Bin_homeName
	];

%GENERATED from file:home.h => U2GS_CreateHome
packNetMsg(#pk_U2GS_CreateHome{} = P) ->
	Bin_adminAreaID = binary_write_uint( P#pk_U2GS_CreateHome.adminAreaID ),
	[
		<<?CMD_U2GS_CreateHome:16/little>>,
		Bin_adminAreaID
	];

%GENERATED from file:home.h => U2GS_EnterHome
packNetMsg(#pk_U2GS_EnterHome{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_EnterHome.roleID ),
	Bin_flag = binary_write_uint8( P#pk_U2GS_EnterHome.flag ),
	[
		<<?CMD_U2GS_EnterHome:16/little>>,
		Bin_roleID,
		Bin_flag
	];

%GENERATED from file:home.h => U2GS_GetPetFood
packNetMsg(#pk_U2GS_GetPetFood{} = P) ->
	Bin_homeID = binary_write_uint64( P#pk_U2GS_GetPetFood.homeID ),
	Bin_petID = binary_write_uint16( P#pk_U2GS_GetPetFood.petID ),
	Bin_itemID = binary_write_uint16( P#pk_U2GS_GetPetFood.itemID ),
	Bin_areaType = binary_write_uint8( P#pk_U2GS_GetPetFood.areaType ),
	[
		<<?CMD_U2GS_GetPetFood:16/little>>,
		Bin_homeID,
		Bin_petID,
		Bin_itemID,
		Bin_areaType
	];

%GENERATED from file:home.h => U2GS_HomePlantOperate_Request
packNetMsg(#pk_U2GS_HomePlantOperate_Request{} = P) ->
	Bin_homeID = binary_write_uint64( P#pk_U2GS_HomePlantOperate_Request.homeID ),
	Bin_areaType = binary_write_uint8( P#pk_U2GS_HomePlantOperate_Request.areaType ),
	Bin_pos = binary_write_uint8( P#pk_U2GS_HomePlantOperate_Request.pos ),
	Bin_operateType = binary_write_uint8( P#pk_U2GS_HomePlantOperate_Request.operateType ),
	Bin_itemID = binary_write_uint16( P#pk_U2GS_HomePlantOperate_Request.itemID ),
	[
		<<?CMD_U2GS_HomePlantOperate_Request:16/little>>,
		Bin_homeID,
		Bin_areaType,
		Bin_pos,
		Bin_operateType,
		Bin_itemID
	];

%GENERATED from file:home.h => U2GS_HomeVisit
packNetMsg(#pk_U2GS_HomeVisit{} = P) ->
	Bin_paga = binary_write_uint8( P#pk_U2GS_HomeVisit.paga ),
	Bin_number = binary_write_uint8( P#pk_U2GS_HomeVisit.number ),
	[
		<<?CMD_U2GS_HomeVisit:16/little>>,
		Bin_paga,
		Bin_number
	];

%GENERATED from file:home.h => U2GS_PutOutPetFarming
packNetMsg(#pk_U2GS_PutOutPetFarming{} = P) ->
	Bin_homeID = binary_write_uint64( P#pk_U2GS_PutOutPetFarming.homeID ),
	Bin_petID = binary_write_uint16( P#pk_U2GS_PutOutPetFarming.petID ),
	Bin_areaType = binary_write_uint8( P#pk_U2GS_PutOutPetFarming.areaType ),
	[
		<<?CMD_U2GS_PutOutPetFarming:16/little>>,
		Bin_homeID,
		Bin_petID,
		Bin_areaType
	];

%GENERATED from file:home.h => U2GS_PutPetInFarming
packNetMsg(#pk_U2GS_PutPetInFarming{} = P) ->
	Bin_homeID = binary_write_uint64( P#pk_U2GS_PutPetInFarming.homeID ),
	Bin_petID = binary_write_uint16( P#pk_U2GS_PutPetInFarming.petID ),
	Bin_areaType = binary_write_uint8( P#pk_U2GS_PutPetInFarming.areaType ),
	[
		<<?CMD_U2GS_PutPetInFarming:16/little>>,
		Bin_homeID,
		Bin_petID,
		Bin_areaType
	];

%GENERATED from file:home.h => U2GS_RequestHomeInfo
packNetMsg(#pk_U2GS_RequestHomeInfo{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_RequestHomeInfo.roleID ),
	[
		<<?CMD_U2GS_RequestHomeInfo:16/little>>,
		Bin_roleID
	];

%GENERATED from file:home.h => U2GS_RequestVisitRecord
packNetMsg(#pk_U2GS_RequestVisitRecord{}) ->
	[
		<<?CMD_U2GS_RequestVisitRecord:16/little>>

	];

%GENERATED from file:home.h => U2GS_UpgradeHomeArea
packNetMsg(#pk_U2GS_UpgradeHomeArea{} = P) ->
	Bin_homeID = binary_write_uint64( P#pk_U2GS_UpgradeHomeArea.homeID ),
	Bin_areaID = binary_write_uint8( P#pk_U2GS_UpgradeHomeArea.areaID ),
	[
		<<?CMD_U2GS_UpgradeHomeArea:16/little>>,
		Bin_homeID,
		Bin_areaID
	];

%GENERATED from file:identity.h => GS2U_GiftHistory_Sync
packNetMsg(#pk_GS2U_GiftHistory_Sync{} = P) ->
	Bin_listHistory = binary_write_array(P#pk_GS2U_GiftHistory_Sync.listHistory, fun(X) -> writeGiftHistory( X ) end),
	Bin_nameTables = binary_write_array(P#pk_GS2U_GiftHistory_Sync.nameTables, fun(X) -> writeNameTable( X ) end),
	Bin_listItemID = binary_write_array(P#pk_GS2U_GiftHistory_Sync.listItemID, fun(X) -> binary_write_uint16( X ) end),
	Bin_listItemCount = binary_write_array(P#pk_GS2U_GiftHistory_Sync.listItemCount, fun(X) -> binary_write_uint16( X ) end),
	[
		<<?CMD_GS2U_GiftHistory_Sync:16/little>>,
		Bin_listHistory,
		Bin_nameTables,
		Bin_listItemID,
		Bin_listItemCount
	];

%GENERATED from file:identity.h => GS2U_Gift_Ack
packNetMsg(#pk_GS2U_Gift_Ack{} = P) ->
	Bin_history = writeGiftHistory( P#pk_GS2U_Gift_Ack.history ),
	Bin_nameTables = binary_write_array(P#pk_GS2U_Gift_Ack.nameTables, fun(X) -> writeNameTable( X ) end),
	[
		<<?CMD_GS2U_Gift_Ack:16/little>>,
		Bin_history,
		Bin_nameTables
	];

%GENERATED from file:identity.h => GS2U_IdentityCharm_Sync
packNetMsg(#pk_GS2U_IdentityCharm_Sync{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_IdentityCharm_Sync.roleID ),
	Bin_tarRoleID = binary_write_uint64( P#pk_GS2U_IdentityCharm_Sync.tarRoleID ),
	Bin_valueUpdate = binary_write_uint( P#pk_GS2U_IdentityCharm_Sync.valueUpdate ),
	Bin_valueNew = binary_write_uint( P#pk_GS2U_IdentityCharm_Sync.valueNew ),
	[
		<<?CMD_GS2U_IdentityCharm_Sync:16/little>>,
		Bin_roleID,
		Bin_tarRoleID,
		Bin_valueUpdate,
		Bin_valueNew
	];

%GENERATED from file:identity.h => GS2U_IdentityEditPic_Ack
packNetMsg(#pk_GS2U_IdentityEditPic_Ack{} = P) ->
	Bin_idi_listPic = binary_write_array(P#pk_GS2U_IdentityEditPic_Ack.idi_listPic, fun(X) -> writeMD5( X ) end),
	[
		<<?CMD_GS2U_IdentityEditPic_Ack:16/little>>,
		Bin_idi_listPic
	];

%GENERATED from file:identity.h => GS2U_IdentityEditTag_Ack
packNetMsg(#pk_GS2U_IdentityEditTag_Ack{} = P) ->
	Bin_idi_listTag = binary_write_array(P#pk_GS2U_IdentityEditTag_Ack.idi_listTag, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_GS2U_IdentityEditTag_Ack:16/little>>,
		Bin_idi_listTag
	];

%GENERATED from file:identity.h => GS2U_IdentityLike_Sync
packNetMsg(#pk_GS2U_IdentityLike_Sync{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_IdentityLike_Sync.roleID ),
	Bin_tarRoleID = binary_write_uint64( P#pk_GS2U_IdentityLike_Sync.tarRoleID ),
	Bin_valueUpdate = binary_write_uint( P#pk_GS2U_IdentityLike_Sync.valueUpdate ),
	Bin_valueNew = binary_write_uint( P#pk_GS2U_IdentityLike_Sync.valueNew ),
	[
		<<?CMD_GS2U_IdentityLike_Sync:16/little>>,
		Bin_roleID,
		Bin_tarRoleID,
		Bin_valueUpdate,
		Bin_valueNew
	];

%GENERATED from file:identity.h => GS2U_IdentityPicDownloadData_Ack
packNetMsg(#pk_GS2U_IdentityPicDownloadData_Ack{} = P) ->
	Bin_md5 = binary_write_array(P#pk_GS2U_IdentityPicDownloadData_Ack.md5, fun(X) -> binary_write_uint8( X ) end),
	Bin_size = binary_write_uint( P#pk_GS2U_IdentityPicDownloadData_Ack.size ),
	Bin_count = binary_write_uint16( P#pk_GS2U_IdentityPicDownloadData_Ack.count ),
	Bin_index = binary_write_uint16( P#pk_GS2U_IdentityPicDownloadData_Ack.index ),
	Bin_data = binary_write_array(P#pk_GS2U_IdentityPicDownloadData_Ack.data, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_GS2U_IdentityPicDownloadData_Ack:16/little>>,
		Bin_md5,
		Bin_size,
		Bin_count,
		Bin_index,
		Bin_data
	];

%GENERATED from file:identity.h => GS2U_IdentityPicDownloadData_Sync
packNetMsg(#pk_GS2U_IdentityPicDownloadData_Sync{} = P) ->
	Bin_md5 = binary_write_array(P#pk_GS2U_IdentityPicDownloadData_Sync.md5, fun(X) -> binary_write_uint8( X ) end),
	Bin_size = binary_write_uint( P#pk_GS2U_IdentityPicDownloadData_Sync.size ),
	Bin_count = binary_write_uint16( P#pk_GS2U_IdentityPicDownloadData_Sync.count ),
	Bin_index = binary_write_uint16( P#pk_GS2U_IdentityPicDownloadData_Sync.index ),
	Bin_data = binary_write_array(P#pk_GS2U_IdentityPicDownloadData_Sync.data, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_GS2U_IdentityPicDownloadData_Sync:16/little>>,
		Bin_md5,
		Bin_size,
		Bin_count,
		Bin_index,
		Bin_data
	];

%GENERATED from file:identity.h => GS2U_IdentityPicDownloadError_Ack
packNetMsg(#pk_GS2U_IdentityPicDownloadError_Ack{} = P) ->
	Bin_md5 = binary_write_array(P#pk_GS2U_IdentityPicDownloadError_Ack.md5, fun(X) -> binary_write_uint8( X ) end),
	Bin_error = binary_write_uint8( P#pk_GS2U_IdentityPicDownloadError_Ack.error ),
	[
		<<?CMD_GS2U_IdentityPicDownloadError_Ack:16/little>>,
		Bin_md5,
		Bin_error
	];

%GENERATED from file:identity.h => GS2U_IdentityPicUpload_Ack
packNetMsg(#pk_GS2U_IdentityPicUpload_Ack{} = P) ->
	Bin_md5 = binary_write_array(P#pk_GS2U_IdentityPicUpload_Ack.md5, fun(X) -> binary_write_uint8( X ) end),
	Bin_isComplete = binary_write_bool( P#pk_GS2U_IdentityPicUpload_Ack.isComplete ),
	[
		<<?CMD_GS2U_IdentityPicUpload_Ack:16/little>>,
		Bin_md5,
		Bin_isComplete
	];

%GENERATED from file:identity.h => GS2U_Identity_Ack
packNetMsg(#pk_GS2U_Identity_Ack{} = P) ->
	Bin_id = binary_write_uint64( P#pk_GS2U_Identity_Ack.id ),
	Bin_code = binary_write_uint64( P#pk_GS2U_Identity_Ack.code ),
	Bin_name = binary_write_string( P#pk_GS2U_Identity_Ack.name ),
	Bin_level = binary_write_uint16( P#pk_GS2U_Identity_Ack.level ),
	Bin_career = binary_write_uint( P#pk_GS2U_Identity_Ack.career ),
	Bin_race = binary_write_uint8( P#pk_GS2U_Identity_Ack.race ),
	Bin_sex = binary_write_uint8( P#pk_GS2U_Identity_Ack.sex ),
	Bin_vipLv = binary_write_uint8( P#pk_GS2U_Identity_Ack.vipLv ),
	Bin_like = binary_write_uint( P#pk_GS2U_Identity_Ack.like ),
	Bin_charm = binary_write_uint( P#pk_GS2U_Identity_Ack.charm ),
	Bin_isGiveLike = binary_write_bool( P#pk_GS2U_Identity_Ack.isGiveLike ),
	Bin_familyName = binary_write_string( P#pk_GS2U_Identity_Ack.familyName ),
	Bin_idi_age = binary_write_uint8( P#pk_GS2U_Identity_Ack.idi_age ),
	Bin_idi_birthmonth = binary_write_uint8( P#pk_GS2U_Identity_Ack.idi_birthmonth ),
	Bin_idi_birthday = binary_write_uint8( P#pk_GS2U_Identity_Ack.idi_birthday ),
	Bin_idi_zodiac = binary_write_uint8( P#pk_GS2U_Identity_Ack.idi_zodiac ),
	Bin_idi_bloodType = binary_write_uint8( P#pk_GS2U_Identity_Ack.idi_bloodType ),
	Bin_idi_hometown1 = binary_write_uint8( P#pk_GS2U_Identity_Ack.idi_hometown1 ),
	Bin_idi_hometown2 = binary_write_uint8( P#pk_GS2U_Identity_Ack.idi_hometown2 ),
	Bin_idi_location1 = binary_write_uint8( P#pk_GS2U_Identity_Ack.idi_location1 ),
	Bin_idi_location2 = binary_write_uint8( P#pk_GS2U_Identity_Ack.idi_location2 ),
	Bin_idi_sign = binary_write_string( P#pk_GS2U_Identity_Ack.idi_sign ),
	Bin_idi_face = binary_write_array(P#pk_GS2U_Identity_Ack.idi_face, fun(X) -> binary_write_uint8( X ) end),
	Bin_idi_listTag = binary_write_array(P#pk_GS2U_Identity_Ack.idi_listTag, fun(X) -> binary_write_uint8( X ) end),
	Bin_idi_listPic = binary_write_array(P#pk_GS2U_Identity_Ack.idi_listPic, fun(X) -> writeMD5( X ) end),
	[
		<<?CMD_GS2U_Identity_Ack:16/little>>,
		Bin_id,
		Bin_code,
		Bin_name,
		Bin_level,
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_vipLv,
		Bin_like,
		Bin_charm,
		Bin_isGiveLike,
		Bin_familyName,
		Bin_idi_age,
		Bin_idi_birthmonth,
		Bin_idi_birthday,
		Bin_idi_zodiac,
		Bin_idi_bloodType,
		Bin_idi_hometown1,
		Bin_idi_hometown2,
		Bin_idi_location1,
		Bin_idi_location2,
		Bin_idi_sign,
		Bin_idi_face,
		Bin_idi_listTag,
		Bin_idi_listPic
	];

%GENERATED from file:identity.h => U2GS2U_IdentityEditAge
packNetMsg(#pk_U2GS2U_IdentityEditAge{} = P) ->
	Bin_idi_age = binary_write_uint8( P#pk_U2GS2U_IdentityEditAge.idi_age ),
	[
		<<?CMD_U2GS2U_IdentityEditAge:16/little>>,
		Bin_idi_age
	];

%GENERATED from file:identity.h => U2GS2U_IdentityEditBirth
packNetMsg(#pk_U2GS2U_IdentityEditBirth{} = P) ->
	Bin_idi_birthmonth = binary_write_uint8( P#pk_U2GS2U_IdentityEditBirth.idi_birthmonth ),
	Bin_idi_birthday = binary_write_uint8( P#pk_U2GS2U_IdentityEditBirth.idi_birthday ),
	[
		<<?CMD_U2GS2U_IdentityEditBirth:16/little>>,
		Bin_idi_birthmonth,
		Bin_idi_birthday
	];

%GENERATED from file:identity.h => U2GS2U_IdentityEditBloodType
packNetMsg(#pk_U2GS2U_IdentityEditBloodType{} = P) ->
	Bin_idi_bloodType = binary_write_uint8( P#pk_U2GS2U_IdentityEditBloodType.idi_bloodType ),
	[
		<<?CMD_U2GS2U_IdentityEditBloodType:16/little>>,
		Bin_idi_bloodType
	];

%GENERATED from file:identity.h => U2GS2U_IdentityEditFace
packNetMsg(#pk_U2GS2U_IdentityEditFace{} = P) ->
	Bin_idi_face = binary_write_array(P#pk_U2GS2U_IdentityEditFace.idi_face, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_U2GS2U_IdentityEditFace:16/little>>,
		Bin_idi_face
	];

%GENERATED from file:identity.h => U2GS2U_IdentityEditHometown
packNetMsg(#pk_U2GS2U_IdentityEditHometown{} = P) ->
	Bin_idi_hometown1 = binary_write_uint8( P#pk_U2GS2U_IdentityEditHometown.idi_hometown1 ),
	Bin_idi_hometown2 = binary_write_uint8( P#pk_U2GS2U_IdentityEditHometown.idi_hometown2 ),
	[
		<<?CMD_U2GS2U_IdentityEditHometown:16/little>>,
		Bin_idi_hometown1,
		Bin_idi_hometown2
	];

%GENERATED from file:identity.h => U2GS2U_IdentityEditLocation
packNetMsg(#pk_U2GS2U_IdentityEditLocation{} = P) ->
	Bin_idi_location1 = binary_write_uint8( P#pk_U2GS2U_IdentityEditLocation.idi_location1 ),
	Bin_idi_location2 = binary_write_uint8( P#pk_U2GS2U_IdentityEditLocation.idi_location2 ),
	[
		<<?CMD_U2GS2U_IdentityEditLocation:16/little>>,
		Bin_idi_location1,
		Bin_idi_location2
	];

%GENERATED from file:identity.h => U2GS2U_IdentityEditSign
packNetMsg(#pk_U2GS2U_IdentityEditSign{} = P) ->
	Bin_idi_sign = binary_write_string( P#pk_U2GS2U_IdentityEditSign.idi_sign ),
	[
		<<?CMD_U2GS2U_IdentityEditSign:16/little>>,
		Bin_idi_sign
	];

%GENERATED from file:identity.h => U2GS2U_IdentityEditZodiac
packNetMsg(#pk_U2GS2U_IdentityEditZodiac{} = P) ->
	Bin_idi_zodiac = binary_write_uint8( P#pk_U2GS2U_IdentityEditZodiac.idi_zodiac ),
	[
		<<?CMD_U2GS2U_IdentityEditZodiac:16/little>>,
		Bin_idi_zodiac
	];

%GENERATED from file:identity.h => U2GS2U_RequestRoleHeadPic
packNetMsg(#pk_U2GS2U_RequestRoleHeadPic{} = P) ->
	Bin_heads = binary_write_array(P#pk_U2GS2U_RequestRoleHeadPic.heads, fun(X) -> writeRoleHeadPic( X ) end),
	[
		<<?CMD_U2GS2U_RequestRoleHeadPic:16/little>>,
		Bin_heads
	];

%GENERATED from file:identity.h => U2GS_Gift_Request
packNetMsg(#pk_U2GS_Gift_Request{} = P) ->
	Bin_tarRoleID = binary_write_uint64( P#pk_U2GS_Gift_Request.tarRoleID ),
	Bin_itemID = binary_write_uint16( P#pk_U2GS_Gift_Request.itemID ),
	Bin_itemCount = binary_write_uint16( P#pk_U2GS_Gift_Request.itemCount ),
	Bin_content = binary_write_string( P#pk_U2GS_Gift_Request.content ),
	[
		<<?CMD_U2GS_Gift_Request:16/little>>,
		Bin_tarRoleID,
		Bin_itemID,
		Bin_itemCount,
		Bin_content
	];

%GENERATED from file:identity.h => U2GS_IdentityEditTagAdd_Request
packNetMsg(#pk_U2GS_IdentityEditTagAdd_Request{} = P) ->
	Bin_idi_listTag = binary_write_array(P#pk_U2GS_IdentityEditTagAdd_Request.idi_listTag, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_U2GS_IdentityEditTagAdd_Request:16/little>>,
		Bin_idi_listTag
	];

%GENERATED from file:identity.h => U2GS_IdentityEditTagDel_Request
packNetMsg(#pk_U2GS_IdentityEditTagDel_Request{} = P) ->
	Bin_idi_tag = binary_write_uint8( P#pk_U2GS_IdentityEditTagDel_Request.idi_tag ),
	[
		<<?CMD_U2GS_IdentityEditTagDel_Request:16/little>>,
		Bin_idi_tag
	];

%GENERATED from file:identity.h => U2GS_IdentityPicDownloadBegin_Request
packNetMsg(#pk_U2GS_IdentityPicDownloadBegin_Request{} = P) ->
	Bin_md5 = binary_write_array(P#pk_U2GS_IdentityPicDownloadBegin_Request.md5, fun(X) -> binary_write_uint8( X ) end),
	Bin_id = binary_write_uint64( P#pk_U2GS_IdentityPicDownloadBegin_Request.id ),
	[
		<<?CMD_U2GS_IdentityPicDownloadBegin_Request:16/little>>,
		Bin_md5,
		Bin_id
	];

%GENERATED from file:identity.h => U2GS_IdentityPicDownloadContinue_Request
packNetMsg(#pk_U2GS_IdentityPicDownloadContinue_Request{} = P) ->
	Bin_md5 = binary_write_array(P#pk_U2GS_IdentityPicDownloadContinue_Request.md5, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_U2GS_IdentityPicDownloadContinue_Request:16/little>>,
		Bin_md5
	];

%GENERATED from file:identity.h => U2GS_IdentityPicUploadBegin_Request
packNetMsg(#pk_U2GS_IdentityPicUploadBegin_Request{} = P) ->
	Bin_md5 = binary_write_array(P#pk_U2GS_IdentityPicUploadBegin_Request.md5, fun(X) -> binary_write_uint8( X ) end),
	Bin_size = binary_write_uint( P#pk_U2GS_IdentityPicUploadBegin_Request.size ),
	Bin_opType = binary_write_bool( P#pk_U2GS_IdentityPicUploadBegin_Request.opType ),
	Bin_pos = binary_write_uint8( P#pk_U2GS_IdentityPicUploadBegin_Request.pos ),
	[
		<<?CMD_U2GS_IdentityPicUploadBegin_Request:16/little>>,
		Bin_md5,
		Bin_size,
		Bin_opType,
		Bin_pos
	];

%GENERATED from file:identity.h => U2GS_IdentityPicUploadData_Request
packNetMsg(#pk_U2GS_IdentityPicUploadData_Request{} = P) ->
	Bin_md5 = binary_write_array(P#pk_U2GS_IdentityPicUploadData_Request.md5, fun(X) -> binary_write_uint8( X ) end),
	Bin_count = binary_write_uint16( P#pk_U2GS_IdentityPicUploadData_Request.count ),
	Bin_index = binary_write_uint16( P#pk_U2GS_IdentityPicUploadData_Request.index ),
	Bin_data = binary_write_array(P#pk_U2GS_IdentityPicUploadData_Request.data, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_U2GS_IdentityPicUploadData_Request:16/little>>,
		Bin_md5,
		Bin_count,
		Bin_index,
		Bin_data
	];

%GENERATED from file:identity.h => U2GS_Identity_Request
packNetMsg(#pk_U2GS_Identity_Request{} = P) ->
	Bin_id = binary_write_uint64( P#pk_U2GS_Identity_Request.id ),
	[
		<<?CMD_U2GS_Identity_Request:16/little>>,
		Bin_id
	];

%GENERATED from file:item.h => GS2U_BuyItemQuotaNumber
packNetMsg(#pk_GS2U_BuyItemQuotaNumber{} = P) ->
	Bin_itemid = binary_write_uint16( P#pk_GS2U_BuyItemQuotaNumber.itemid ),
	Bin_quotaNumber = binary_write_int( P#pk_GS2U_BuyItemQuotaNumber.quotaNumber ),
	[
		<<?CMD_GS2U_BuyItemQuotaNumber:16/little>>,
		Bin_itemid,
		Bin_quotaNumber
	];

%GENERATED from file:item.h => GS2U_LookInfoItemListAtMall
packNetMsg(#pk_GS2U_LookInfoItemListAtMall{} = P) ->
	Bin_item_list = binary_write_array(P#pk_GS2U_LookInfoItemListAtMall.item_list, fun(X) -> writeLookInfoItemAtMall( X ) end),
	[
		<<?CMD_GS2U_LookInfoItemListAtMall:16/little>>,
		Bin_item_list
	];

%GENERATED from file:item.h => GS2U_LookInfoItemListAtNpcStore
packNetMsg(#pk_GS2U_LookInfoItemListAtNpcStore{} = P) ->
	Bin_storeType = binary_write_uint16( P#pk_GS2U_LookInfoItemListAtNpcStore.storeType ),
	Bin_item_list = binary_write_array(P#pk_GS2U_LookInfoItemListAtNpcStore.item_list, fun(X) -> writeLookInfoItem( X ) end),
	[
		<<?CMD_GS2U_LookInfoItemListAtNpcStore:16/little>>,
		Bin_storeType,
		Bin_item_list
	];

%GENERATED from file:item.h => GS2U_MysteriousShop
packNetMsg(#pk_GS2U_MysteriousShop{} = P) ->
	Bin_lvlPhase = binary_write_uint( P#pk_GS2U_MysteriousShop.lvlPhase ),
	Bin_residueTime = binary_write_uint( P#pk_GS2U_MysteriousShop.residueTime ),
	Bin_items = binary_write_array(P#pk_GS2U_MysteriousShop.items, fun(X) -> writeMysteriousShopItem( X ) end),
	Bin_freshMSShopDaimond = binary_write_int( P#pk_GS2U_MysteriousShop.freshMSShopDaimond ),
	[
		<<?CMD_GS2U_MysteriousShop:16/little>>,
		Bin_lvlPhase,
		Bin_residueTime,
		Bin_items,
		Bin_freshMSShopDaimond
	];

%GENERATED from file:item.h => GS2U_SingleUseItem
packNetMsg(#pk_GS2U_SingleUseItem{} = P) ->
	Bin_itemID = binary_write_uint16( P#pk_GS2U_SingleUseItem.itemID ),
	[
		<<?CMD_GS2U_SingleUseItem:16/little>>,
		Bin_itemID
	];

%GENERATED from file:item.h => GS2U_UseItem
packNetMsg(#pk_GS2U_UseItem{} = P) ->
	Bin_vctUseItem = binary_write_array(P#pk_GS2U_UseItem.vctUseItem, fun(X) -> writeUseItemCD( X ) end),
	[
		<<?CMD_GS2U_UseItem:16/little>>,
		Bin_vctUseItem
	];

%GENERATED from file:item.h => GS2U_UseItemExpInDanResult
packNetMsg(#pk_GS2U_UseItemExpInDanResult{} = P) ->
	Bin_expInDanType = binary_write_uint( P#pk_GS2U_UseItemExpInDanResult.expInDanType ),
	Bin_remainTime = binary_write_uint( P#pk_GS2U_UseItemExpInDanResult.remainTime ),
	[
		<<?CMD_GS2U_UseItemExpInDanResult:16/little>>,
		Bin_expInDanType,
		Bin_remainTime
	];

%GENERATED from file:item.h => GS2U_UseItemGainGoodsTips
packNetMsg(#pk_GS2U_UseItemGainGoodsTips{} = P) ->
	Bin_listTips = binary_write_array(P#pk_GS2U_UseItemGainGoodsTips.listTips, fun(X) -> writeUseItemGainGoodsTips( X ) end),
	[
		<<?CMD_GS2U_UseItemGainGoodsTips:16/little>>,
		Bin_listTips
	];

%GENERATED from file:item.h => GS2U_UseItemResult
packNetMsg(#pk_GS2U_UseItemResult{} = P) ->
	Bin_itemID = binary_write_uint16( P#pk_GS2U_UseItemResult.itemID ),
	Bin_itemNum = binary_write_uint16( P#pk_GS2U_UseItemResult.itemNum ),
	Bin_result = binary_write_int( P#pk_GS2U_UseItemResult.result ),
	[
		<<?CMD_GS2U_UseItemResult:16/little>>,
		Bin_itemID,
		Bin_itemNum,
		Bin_result
	];

%GENERATED from file:item.h => RefindResList
packNetMsg(#pk_RefindResList{} = P) ->
	Bin_resList = binary_write_array(P#pk_RefindResList.resList, fun(X) -> writeRefindResInfo( X ) end),
	[
		<<?CMD_RefindResList:16/little>>,
		Bin_resList
	];

%GENERATED from file:item.h => U2GS_BuyItemAtGuildShopRequest
packNetMsg(#pk_U2GS_BuyItemAtGuildShopRequest{} = P) ->
	Bin_itemid = binary_write_uint16( P#pk_U2GS_BuyItemAtGuildShopRequest.itemid ),
	Bin_number = binary_write_uint16( P#pk_U2GS_BuyItemAtGuildShopRequest.number ),
	[
		<<?CMD_U2GS_BuyItemAtGuildShopRequest:16/little>>,
		Bin_itemid,
		Bin_number
	];

%GENERATED from file:item.h => U2GS_BuyItemAtMallRequest
packNetMsg(#pk_U2GS_BuyItemAtMallRequest{} = P) ->
	Bin_itemid = binary_write_uint16( P#pk_U2GS_BuyItemAtMallRequest.itemid ),
	Bin_number = binary_write_uint16( P#pk_U2GS_BuyItemAtMallRequest.number ),
	[
		<<?CMD_U2GS_BuyItemAtMallRequest:16/little>>,
		Bin_itemid,
		Bin_number
	];

%GENERATED from file:item.h => U2GS_BuyItemAtNpcStoreRequest
packNetMsg(#pk_U2GS_BuyItemAtNpcStoreRequest{} = P) ->
	Bin_npccode = binary_write_uint64( P#pk_U2GS_BuyItemAtNpcStoreRequest.npccode ),
	Bin_itemid = binary_write_uint16( P#pk_U2GS_BuyItemAtNpcStoreRequest.itemid ),
	Bin_number = binary_write_uint16( P#pk_U2GS_BuyItemAtNpcStoreRequest.number ),
	[
		<<?CMD_U2GS_BuyItemAtNpcStoreRequest:16/little>>,
		Bin_npccode,
		Bin_itemid,
		Bin_number
	];

%GENERATED from file:item.h => U2GS_BuyItemAtShopIDRequest
packNetMsg(#pk_U2GS_BuyItemAtShopIDRequest{} = P) ->
	Bin_shopID = binary_write_uint64( P#pk_U2GS_BuyItemAtShopIDRequest.shopID ),
	Bin_itemid = binary_write_uint16( P#pk_U2GS_BuyItemAtShopIDRequest.itemid ),
	Bin_number = binary_write_uint16( P#pk_U2GS_BuyItemAtShopIDRequest.number ),
	[
		<<?CMD_U2GS_BuyItemAtShopIDRequest:16/little>>,
		Bin_shopID,
		Bin_itemid,
		Bin_number
	];

%GENERATED from file:item.h => U2GS_BuyMysteriousShopItem
packNetMsg(#pk_U2GS_BuyMysteriousShopItem{} = P) ->
	Bin_lvlPhase = binary_write_uint( P#pk_U2GS_BuyMysteriousShopItem.lvlPhase ),
	Bin_buynumber = binary_write_uint( P#pk_U2GS_BuyMysteriousShopItem.buynumber ),
	Bin_only_id = binary_write_uint( P#pk_U2GS_BuyMysteriousShopItem.only_id ),
	Bin_itemid = binary_write_uint16( P#pk_U2GS_BuyMysteriousShopItem.itemid ),
	[
		<<?CMD_U2GS_BuyMysteriousShopItem:16/little>>,
		Bin_lvlPhase,
		Bin_buynumber,
		Bin_only_id,
		Bin_itemid
	];

%GENERATED from file:item.h => U2GS_ConvenientBuyItem
packNetMsg(#pk_U2GS_ConvenientBuyItem{} = P) ->
	Bin_itemid = binary_write_uint( P#pk_U2GS_ConvenientBuyItem.itemid ),
	Bin_buynumber = binary_write_uint( P#pk_U2GS_ConvenientBuyItem.buynumber ),
	[
		<<?CMD_U2GS_ConvenientBuyItem:16/little>>,
		Bin_itemid,
		Bin_buynumber
	];

%GENERATED from file:item.h => U2GS_FreshMSShop
packNetMsg(#pk_U2GS_FreshMSShop{}) ->
	[
		<<?CMD_U2GS_FreshMSShop:16/little>>

	];

%GENERATED from file:item.h => U2GS_LookInfoItemListAtMall
packNetMsg(#pk_U2GS_LookInfoItemListAtMall{}) ->
	[
		<<?CMD_U2GS_LookInfoItemListAtMall:16/little>>

	];

%GENERATED from file:item.h => U2GS_LookInfoItemListAtNpcStore
packNetMsg(#pk_U2GS_LookInfoItemListAtNpcStore{} = P) ->
	Bin_npccode = binary_write_uint64( P#pk_U2GS_LookInfoItemListAtNpcStore.npccode ),
	[
		<<?CMD_U2GS_LookInfoItemListAtNpcStore:16/little>>,
		Bin_npccode
	];

%GENERATED from file:item.h => U2GS_LookInfoItemListAtShopID
packNetMsg(#pk_U2GS_LookInfoItemListAtShopID{} = P) ->
	Bin_shopID = binary_write_uint64( P#pk_U2GS_LookInfoItemListAtShopID.shopID ),
	[
		<<?CMD_U2GS_LookInfoItemListAtShopID:16/little>>,
		Bin_shopID
	];

%GENERATED from file:item.h => U2GS_RefindResAll
packNetMsg(#pk_U2GS_RefindResAll{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_RefindResAll.type ),
	[
		<<?CMD_U2GS_RefindResAll:16/little>>,
		Bin_type
	];

%GENERATED from file:item.h => U2GS_RefindResOne
packNetMsg(#pk_U2GS_RefindResOne{} = P) ->
	Bin_id = binary_write_uint( P#pk_U2GS_RefindResOne.id ),
	Bin_type = binary_write_uint8( P#pk_U2GS_RefindResOne.type ),
	[
		<<?CMD_U2GS_RefindResOne:16/little>>,
		Bin_id,
		Bin_type
	];

%GENERATED from file:item.h => U2GS_RequestMysteriousShop
packNetMsg(#pk_U2GS_RequestMysteriousShop{}) ->
	[
		<<?CMD_U2GS_RequestMysteriousShop:16/little>>

	];

%GENERATED from file:item.h => U2GS_UseStarMoonBox
packNetMsg(#pk_U2GS_UseStarMoonBox{} = P) ->
	Bin_itemUID = binary_write_uint64( P#pk_U2GS_UseStarMoonBox.itemUID ),
	Bin_useNum = binary_write_uint16( P#pk_U2GS_UseStarMoonBox.useNum ),
	[
		<<?CMD_U2GS_UseStarMoonBox:16/little>>,
		Bin_itemUID,
		Bin_useNum
	];

%GENERATED from file:luckycoin.h => GS2U_GainLuckyCoin
packNetMsg(#pk_GS2U_GainLuckyCoin{} = P) ->
	Bin_gainLuckyCoinInfo = writeGainLuckyCoinInfo( P#pk_GS2U_GainLuckyCoin.gainLuckyCoinInfo ),
	Bin_count = binary_write_int( P#pk_GS2U_GainLuckyCoin.count ),
	Bin_time = binary_write_uint64( P#pk_GS2U_GainLuckyCoin.time ),
	[
		<<?CMD_GS2U_GainLuckyCoin:16/little>>,
		Bin_gainLuckyCoinInfo,
		Bin_count,
		Bin_time
	];

%GENERATED from file:luckycoin.h => GS2U_GiveLuckyCoinResult
packNetMsg(#pk_GS2U_GiveLuckyCoinResult{} = P) ->
	Bin_friendID = binary_write_uint64( P#pk_GS2U_GiveLuckyCoinResult.friendID ),
	Bin_result = binary_write_uint8( P#pk_GS2U_GiveLuckyCoinResult.result ),
	[
		<<?CMD_GS2U_GiveLuckyCoinResult:16/little>>,
		Bin_friendID,
		Bin_result
	];

%GENERATED from file:luckycoin.h => GS2U_InitGainLuckyCoinInfo
packNetMsg(#pk_GS2U_InitGainLuckyCoinInfo{} = P) ->
	Bin_gainLuckyCoinInfoList = binary_write_array(P#pk_GS2U_InitGainLuckyCoinInfo.gainLuckyCoinInfoList, fun(X) -> writeGainLuckyCoinInfo( X ) end),
	Bin_count = binary_write_int( P#pk_GS2U_InitGainLuckyCoinInfo.count ),
	Bin_time = binary_write_uint64( P#pk_GS2U_InitGainLuckyCoinInfo.time ),
	[
		<<?CMD_GS2U_InitGainLuckyCoinInfo:16/little>>,
		Bin_gainLuckyCoinInfoList,
		Bin_count,
		Bin_time
	];

%GENERATED from file:luckycoin.h => GS2U_LuckyDrawResult
packNetMsg(#pk_GS2U_LuckyDrawResult{} = P) ->
	Bin_itemID = binary_write_int( P#pk_GS2U_LuckyDrawResult.itemID ),
	Bin_count = binary_write_int( P#pk_GS2U_LuckyDrawResult.count ),
	Bin_time = binary_write_uint64( P#pk_GS2U_LuckyDrawResult.time ),
	[
		<<?CMD_GS2U_LuckyDrawResult:16/little>>,
		Bin_itemID,
		Bin_count,
		Bin_time
	];

%GENERATED from file:luckycoin.h => U2GS_GiveLuckyCoin
packNetMsg(#pk_U2GS_GiveLuckyCoin{} = P) ->
	Bin_friendID = binary_write_uint64( P#pk_U2GS_GiveLuckyCoin.friendID ),
	[
		<<?CMD_U2GS_GiveLuckyCoin:16/little>>,
		Bin_friendID
	];

%GENERATED from file:luckycoin.h => U2GS_LuckyDraw
packNetMsg(#pk_U2GS_LuckyDraw{}) ->
	[
		<<?CMD_U2GS_LuckyDraw:16/little>>

	];

%GENERATED from file:luckycoin.h => U2GS_LuckyDrawEnd
packNetMsg(#pk_U2GS_LuckyDrawEnd{}) ->
	[
		<<?CMD_U2GS_LuckyDrawEnd:16/little>>

	];

%GENERATED from file:luckycoin.h => U2GS_OneKeyGiveLucky
packNetMsg(#pk_U2GS_OneKeyGiveLucky{}) ->
	[
		<<?CMD_U2GS_OneKeyGiveLucky:16/little>>

	];

%GENERATED from file:mail.h => GS2U_DelMailCoin
packNetMsg(#pk_GS2U_DelMailCoin{} = P) ->
	Bin_mailID = binary_write_uint64( P#pk_GS2U_DelMailCoin.mailID ),
	[
		<<?CMD_GS2U_DelMailCoin:16/little>>,
		Bin_mailID
	];

%GENERATED from file:mail.h => GS2U_DelMailItem
packNetMsg(#pk_GS2U_DelMailItem{} = P) ->
	Bin_mailID = binary_write_uint64( P#pk_GS2U_DelMailItem.mailID ),
	Bin_itemUID = binary_write_uint64( P#pk_GS2U_DelMailItem.itemUID ),
	[
		<<?CMD_GS2U_DelMailItem:16/little>>,
		Bin_mailID,
		Bin_itemUID
	];

%GENERATED from file:mail.h => GS2U_DeleteMail
packNetMsg(#pk_GS2U_DeleteMail{} = P) ->
	Bin_mailID = binary_write_uint64( P#pk_GS2U_DeleteMail.mailID ),
	[
		<<?CMD_GS2U_DeleteMail:16/little>>,
		Bin_mailID
	];

%GENERATED from file:mail.h => GS2U_GetMailItemAll
packNetMsg(#pk_GS2U_GetMailItemAll{} = P) ->
	Bin_number = binary_write_uint16( P#pk_GS2U_GetMailItemAll.number ),
	Bin_items = binary_write_array(P#pk_GS2U_GetMailItemAll.items, fun(X) -> writeMailItemAll( X ) end),
	Bin_coins = binary_write_array(P#pk_GS2U_GetMailItemAll.coins, fun(X) -> writeMailCoin( X ) end),
	[
		<<?CMD_GS2U_GetMailItemAll:16/little>>,
		Bin_number,
		Bin_items,
		Bin_coins
	];

%GENERATED from file:mail.h => GS2U_LockMail
packNetMsg(#pk_GS2U_LockMail{} = P) ->
	Bin_ret = writeretMailOpt( P#pk_GS2U_LockMail.ret ),
	[
		<<?CMD_GS2U_LockMail:16/little>>,
		Bin_ret
	];

%GENERATED from file:mail.h => GS2U_Mail
packNetMsg(#pk_GS2U_Mail{} = P) ->
	Bin_detail = writeMailDetail( P#pk_GS2U_Mail.detail ),
	[
		<<?CMD_GS2U_Mail:16/little>>,
		Bin_detail
	];

%GENERATED from file:mail.h => GS2U_MailInfo
packNetMsg(#pk_GS2U_MailInfo{} = P) ->
	Bin_mailInfoList = binary_write_array(P#pk_GS2U_MailInfo.mailInfoList, fun(X) -> writeMailInfo( X ) end),
	[
		<<?CMD_GS2U_MailInfo:16/little>>,
		Bin_mailInfoList
	];

%GENERATED from file:mail.h => GS2U_SendMailAck
packNetMsg(#pk_GS2U_SendMailAck{} = P) ->
	Bin_toRoleName = binary_write_string( P#pk_GS2U_SendMailAck.toRoleName ),
	Bin_isOK = binary_write_bool( P#pk_GS2U_SendMailAck.isOK ),
	[
		<<?CMD_GS2U_SendMailAck:16/little>>,
		Bin_toRoleName,
		Bin_isOK
	];

%GENERATED from file:mail.h => GS2U_UnlockMail
packNetMsg(#pk_GS2U_UnlockMail{} = P) ->
	Bin_ret = writeretMailOpt( P#pk_GS2U_UnlockMail.ret ),
	[
		<<?CMD_GS2U_UnlockMail:16/little>>,
		Bin_ret
	];

%GENERATED from file:mail.h => U2GS_DeleteAllReadMail
packNetMsg(#pk_U2GS_DeleteAllReadMail{}) ->
	[
		<<?CMD_U2GS_DeleteAllReadMail:16/little>>

	];

%GENERATED from file:mail.h => U2GS_DeleteMail
packNetMsg(#pk_U2GS_DeleteMail{} = P) ->
	Bin_mailID = binary_write_uint64( P#pk_U2GS_DeleteMail.mailID ),
	[
		<<?CMD_U2GS_DeleteMail:16/little>>,
		Bin_mailID
	];

%GENERATED from file:mail.h => U2GS_GetMailCoin
packNetMsg(#pk_U2GS_GetMailCoin{} = P) ->
	Bin_mailID = binary_write_uint64( P#pk_U2GS_GetMailCoin.mailID ),
	[
		<<?CMD_U2GS_GetMailCoin:16/little>>,
		Bin_mailID
	];

%GENERATED from file:mail.h => U2GS_GetMailItem
packNetMsg(#pk_U2GS_GetMailItem{} = P) ->
	Bin_mailID = binary_write_uint64( P#pk_U2GS_GetMailItem.mailID ),
	Bin_itemUID = binary_write_uint64( P#pk_U2GS_GetMailItem.itemUID ),
	[
		<<?CMD_U2GS_GetMailItem:16/little>>,
		Bin_mailID,
		Bin_itemUID
	];

%GENERATED from file:mail.h => U2GS_GetMailItemAll
packNetMsg(#pk_U2GS_GetMailItemAll{}) ->
	[
		<<?CMD_U2GS_GetMailItemAll:16/little>>

	];

%GENERATED from file:mail.h => U2GS_LockMail
packNetMsg(#pk_U2GS_LockMail{} = P) ->
	Bin_mailID = binary_write_uint64( P#pk_U2GS_LockMail.mailID ),
	[
		<<?CMD_U2GS_LockMail:16/little>>,
		Bin_mailID
	];

%GENERATED from file:mail.h => U2GS_ReadMail
packNetMsg(#pk_U2GS_ReadMail{} = P) ->
	Bin_mailID = binary_write_uint64( P#pk_U2GS_ReadMail.mailID ),
	[
		<<?CMD_U2GS_ReadMail:16/little>>,
		Bin_mailID
	];

%GENERATED from file:mail.h => U2GS_SendMail
packNetMsg(#pk_U2GS_SendMail{} = P) ->
	Bin_toRoleName = binary_write_string( P#pk_U2GS_SendMail.toRoleName ),
	Bin_mailTitle = binary_write_string( P#pk_U2GS_SendMail.mailTitle ),
	Bin_mailContent = binary_write_string( P#pk_U2GS_SendMail.mailContent ),
	[
		<<?CMD_U2GS_SendMail:16/little>>,
		Bin_toRoleName,
		Bin_mailTitle,
		Bin_mailContent
	];

%GENERATED from file:mail.h => U2GS_UnlockMail
packNetMsg(#pk_U2GS_UnlockMail{} = P) ->
	Bin_mailID = binary_write_uint64( P#pk_U2GS_UnlockMail.mailID ),
	[
		<<?CMD_U2GS_UnlockMail:16/little>>,
		Bin_mailID
	];

%GENERATED from file:mall.h => GS2U_MallBuyResult
packNetMsg(#pk_GS2U_MallBuyResult{} = P) ->
	Bin_db_id = binary_write_uint( P#pk_GS2U_MallBuyResult.db_id ),
	Bin_buyCount = binary_write_uint( P#pk_GS2U_MallBuyResult.buyCount ),
	[
		<<?CMD_GS2U_MallBuyResult:16/little>>,
		Bin_db_id,
		Bin_buyCount
	];

%GENERATED from file:mall.h => GS2U_MallBuyResult2
packNetMsg(#pk_GS2U_MallBuyResult2{} = P) ->
	Bin_db_id = binary_write_uint( P#pk_GS2U_MallBuyResult2.db_id ),
	Bin_buyCount = binary_write_uint( P#pk_GS2U_MallBuyResult2.buyCount ),
	[
		<<?CMD_GS2U_MallBuyResult2:16/little>>,
		Bin_db_id,
		Bin_buyCount
	];

%GENERATED from file:mall.h => GS2U_MallInfoList
packNetMsg(#pk_GS2U_MallInfoList{} = P) ->
	Bin_seed = binary_write_int( P#pk_GS2U_MallInfoList.seed ),
	Bin_mallinfolist = binary_write_array(P#pk_GS2U_MallInfoList.mallinfolist, fun(X) -> writeMallInfo( X ) end),
	[
		<<?CMD_GS2U_MallInfoList:16/little>>,
		Bin_seed,
		Bin_mallinfolist
	];

%GENERATED from file:mall.h => GS2U_MallInfoList2
packNetMsg(#pk_GS2U_MallInfoList2{} = P) ->
	Bin_seed = binary_write_int( P#pk_GS2U_MallInfoList2.seed ),
	Bin_mallinfolist = binary_write_array(P#pk_GS2U_MallInfoList2.mallinfolist, fun(X) -> writeMallInfo( X ) end),
	[
		<<?CMD_GS2U_MallInfoList2:16/little>>,
		Bin_seed,
		Bin_mallinfolist
	];

%GENERATED from file:mall.h => GS2U_MallPriceList
packNetMsg(#pk_GS2U_MallPriceList{} = P) ->
	Bin_mallinfolist = binary_write_array(P#pk_GS2U_MallPriceList.mallinfolist, fun(X) -> writeMallInfo( X ) end),
	[
		<<?CMD_GS2U_MallPriceList:16/little>>,
		Bin_mallinfolist
	];

%GENERATED from file:mall.h => GS2U_MallPriceList2
packNetMsg(#pk_GS2U_MallPriceList2{} = P) ->
	Bin_mallinfolist = binary_write_array(P#pk_GS2U_MallPriceList2.mallinfolist, fun(X) -> writeMallInfo( X ) end),
	[
		<<?CMD_GS2U_MallPriceList2:16/little>>,
		Bin_mallinfolist
	];

%GENERATED from file:mall.h => U2GS_ItemBuyRequest
packNetMsg(#pk_U2GS_ItemBuyRequest{} = P) ->
	Bin_db_id = binary_write_uint( P#pk_U2GS_ItemBuyRequest.db_id ),
	Bin_itemid = binary_write_uint( P#pk_U2GS_ItemBuyRequest.itemid ),
	Bin_itemnum = binary_write_int( P#pk_U2GS_ItemBuyRequest.itemnum ),
	Bin_moneytype = binary_write_int8( P#pk_U2GS_ItemBuyRequest.moneytype ),
	Bin_tarRoleID = binary_write_uint64( P#pk_U2GS_ItemBuyRequest.tarRoleID ),
	[
		<<?CMD_U2GS_ItemBuyRequest:16/little>>,
		Bin_db_id,
		Bin_itemid,
		Bin_itemnum,
		Bin_moneytype,
		Bin_tarRoleID
	];

%GENERATED from file:mall.h => U2GS_ItemBuyRequest2
packNetMsg(#pk_U2GS_ItemBuyRequest2{} = P) ->
	Bin_db_id = binary_write_uint( P#pk_U2GS_ItemBuyRequest2.db_id ),
	Bin_itemid = binary_write_uint( P#pk_U2GS_ItemBuyRequest2.itemid ),
	Bin_itemnum = binary_write_int( P#pk_U2GS_ItemBuyRequest2.itemnum ),
	Bin_moneytype = binary_write_int8( P#pk_U2GS_ItemBuyRequest2.moneytype ),
	[
		<<?CMD_U2GS_ItemBuyRequest2:16/little>>,
		Bin_db_id,
		Bin_itemid,
		Bin_itemnum,
		Bin_moneytype
	];

%GENERATED from file:mall.h => U2GS_MallInfo
packNetMsg(#pk_U2GS_MallInfo{} = P) ->
	Bin_seed = binary_write_int( P#pk_U2GS_MallInfo.seed ),
	[
		<<?CMD_U2GS_MallInfo:16/little>>,
		Bin_seed
	];

%GENERATED from file:mall.h => U2GS_MallInfo2
packNetMsg(#pk_U2GS_MallInfo2{} = P) ->
	Bin_seed = binary_write_int( P#pk_U2GS_MallInfo2.seed ),
	[
		<<?CMD_U2GS_MallInfo2:16/little>>,
		Bin_seed
	];

%GENERATED from file:marriage.h => GS2U_MarriageBaseInfo_Sync
packNetMsg(#pk_GS2U_MarriageBaseInfo_Sync{} = P) ->
	Bin_id = binary_write_uint64( P#pk_GS2U_MarriageBaseInfo_Sync.id ),
	Bin_name = binary_write_string( P#pk_GS2U_MarriageBaseInfo_Sync.name ),
	Bin_sex = binary_write_uint8( P#pk_GS2U_MarriageBaseInfo_Sync.sex ),
	Bin_weddingDay = binary_write_uint( P#pk_GS2U_MarriageBaseInfo_Sync.weddingDay ),
	Bin_closeness = binary_write_uint( P#pk_GS2U_MarriageBaseInfo_Sync.closeness ),
	[
		<<?CMD_GS2U_MarriageBaseInfo_Sync:16/little>>,
		Bin_id,
		Bin_name,
		Bin_sex,
		Bin_weddingDay,
		Bin_closeness
	];

%GENERATED from file:marriage.h => GS2U_MarriageBreak_Ack
packNetMsg(#pk_GS2U_MarriageBreak_Ack{} = P) ->
	Bin_id = binary_write_uint64( P#pk_GS2U_MarriageBreak_Ack.id ),
	Bin_name = binary_write_string( P#pk_GS2U_MarriageBreak_Ack.name ),
	[
		<<?CMD_GS2U_MarriageBreak_Ack:16/little>>,
		Bin_id,
		Bin_name
	];

%GENERATED from file:marriage.h => GS2U_MarriageProposeRefresh_Ack
packNetMsg(#pk_GS2U_MarriageProposeRefresh_Ack{}) ->
	[
		<<?CMD_GS2U_MarriageProposeRefresh_Ack:16/little>>

	];

%GENERATED from file:marriage.h => GS2U_MarriagePropose_Ack
packNetMsg(#pk_GS2U_MarriagePropose_Ack{} = P) ->
	Bin_id = binary_write_uint64( P#pk_GS2U_MarriagePropose_Ack.id ),
	Bin_name = binary_write_string( P#pk_GS2U_MarriagePropose_Ack.name ),
	Bin_item = binary_write_uint( P#pk_GS2U_MarriagePropose_Ack.item ),
	Bin_isS = binary_write_bool( P#pk_GS2U_MarriagePropose_Ack.isS ),
	[
		<<?CMD_GS2U_MarriagePropose_Ack:16/little>>,
		Bin_id,
		Bin_name,
		Bin_item,
		Bin_isS
	];

%GENERATED from file:marriage.h => GS2U_MarriagePropose_Ask
packNetMsg(#pk_GS2U_MarriagePropose_Ask{} = P) ->
	Bin_id = binary_write_uint64( P#pk_GS2U_MarriagePropose_Ask.id ),
	Bin_name = binary_write_string( P#pk_GS2U_MarriagePropose_Ask.name ),
	Bin_item = binary_write_uint( P#pk_GS2U_MarriagePropose_Ask.item ),
	Bin_manifesto = binary_write_string( P#pk_GS2U_MarriagePropose_Ask.manifesto ),
	[
		<<?CMD_GS2U_MarriagePropose_Ask:16/little>>,
		Bin_id,
		Bin_name,
		Bin_item,
		Bin_manifesto
	];

%GENERATED from file:marriage.h => GS2U_MarriageRingUpPartner_Sync
packNetMsg(#pk_GS2U_MarriageRingUpPartner_Sync{} = P) ->
	Bin_topOld = binary_write_uint( P#pk_GS2U_MarriageRingUpPartner_Sync.topOld ),
	Bin_expOld = binary_write_uint( P#pk_GS2U_MarriageRingUpPartner_Sync.expOld ),
	Bin_lvOld = binary_write_uint( P#pk_GS2U_MarriageRingUpPartner_Sync.lvOld ),
	Bin_topNew = binary_write_uint( P#pk_GS2U_MarriageRingUpPartner_Sync.topNew ),
	Bin_expNew = binary_write_uint( P#pk_GS2U_MarriageRingUpPartner_Sync.expNew ),
	Bin_lvNew = binary_write_uint( P#pk_GS2U_MarriageRingUpPartner_Sync.lvNew ),
	[
		<<?CMD_GS2U_MarriageRingUpPartner_Sync:16/little>>,
		Bin_topOld,
		Bin_expOld,
		Bin_lvOld,
		Bin_topNew,
		Bin_expNew,
		Bin_lvNew
	];

%GENERATED from file:marriage.h => GS2U_MarriageRingUp_Sync
packNetMsg(#pk_GS2U_MarriageRingUp_Sync{} = P) ->
	Bin_topOld = binary_write_uint( P#pk_GS2U_MarriageRingUp_Sync.topOld ),
	Bin_expOld = binary_write_uint( P#pk_GS2U_MarriageRingUp_Sync.expOld ),
	Bin_lvOld = binary_write_uint( P#pk_GS2U_MarriageRingUp_Sync.lvOld ),
	Bin_topNew = binary_write_uint( P#pk_GS2U_MarriageRingUp_Sync.topNew ),
	Bin_expNew = binary_write_uint( P#pk_GS2U_MarriageRingUp_Sync.expNew ),
	Bin_lvNew = binary_write_uint( P#pk_GS2U_MarriageRingUp_Sync.lvNew ),
	[
		<<?CMD_GS2U_MarriageRingUp_Sync:16/little>>,
		Bin_topOld,
		Bin_expOld,
		Bin_lvOld,
		Bin_topNew,
		Bin_expNew,
		Bin_lvNew
	];

%GENERATED from file:marriage.h => GS2U_MarriageSkillUp_Ack
packNetMsg(#pk_GS2U_MarriageSkillUp_Ack{} = P) ->
	Bin_skill = writeSkillInfoForMarraige( P#pk_GS2U_MarriageSkillUp_Ack.skill ),
	Bin_lvOld = binary_write_uint( P#pk_GS2U_MarriageSkillUp_Ack.lvOld ),
	Bin_lvNew = binary_write_uint( P#pk_GS2U_MarriageSkillUp_Ack.lvNew ),
	Bin_expOld = binary_write_uint( P#pk_GS2U_MarriageSkillUp_Ack.expOld ),
	[
		<<?CMD_GS2U_MarriageSkillUp_Ack:16/little>>,
		Bin_skill,
		Bin_lvOld,
		Bin_lvNew,
		Bin_expOld
	];

%GENERATED from file:marriage.h => GS2U_MarriageSkill_Sync
packNetMsg(#pk_GS2U_MarriageSkill_Sync{} = P) ->
	Bin_listSkill = binary_write_array(P#pk_GS2U_MarriageSkill_Sync.listSkill, fun(X) -> writeSkillInfoForMarraige( X ) end),
	[
		<<?CMD_GS2U_MarriageSkill_Sync:16/little>>,
		Bin_listSkill
	];

%GENERATED from file:marriage.h => U2GS_MarriageAcceptTask_Request
packNetMsg(#pk_U2GS_MarriageAcceptTask_Request{}) ->
	[
		<<?CMD_U2GS_MarriageAcceptTask_Request:16/little>>

	];

%GENERATED from file:marriage.h => U2GS_MarriageBreak_Request
packNetMsg(#pk_U2GS_MarriageBreak_Request{} = P) ->
	Bin_isTeam = binary_write_bool( P#pk_U2GS_MarriageBreak_Request.isTeam ),
	[
		<<?CMD_U2GS_MarriageBreak_Request:16/little>>,
		Bin_isTeam
	];

%GENERATED from file:marriage.h => U2GS_MarriagePropose_Reply
packNetMsg(#pk_U2GS_MarriagePropose_Reply{} = P) ->
	Bin_id = binary_write_uint64( P#pk_U2GS_MarriagePropose_Reply.id ),
	Bin_isAgreed = binary_write_bool( P#pk_U2GS_MarriagePropose_Reply.isAgreed ),
	[
		<<?CMD_U2GS_MarriagePropose_Reply:16/little>>,
		Bin_id,
		Bin_isAgreed
	];

%GENERATED from file:marriage.h => U2GS_MarriagePropose_Request
packNetMsg(#pk_U2GS_MarriagePropose_Request{} = P) ->
	Bin_id = binary_write_uint64( P#pk_U2GS_MarriagePropose_Request.id ),
	Bin_item = binary_write_uint( P#pk_U2GS_MarriagePropose_Request.item ),
	Bin_manifesto = binary_write_string( P#pk_U2GS_MarriagePropose_Request.manifesto ),
	[
		<<?CMD_U2GS_MarriagePropose_Request:16/little>>,
		Bin_id,
		Bin_item,
		Bin_manifesto
	];

%GENERATED from file:marriage.h => U2GS_MarriageRingUp_Request
packNetMsg(#pk_U2GS_MarriageRingUp_Request{} = P) ->
	Bin_cost = binary_write_uint( P#pk_U2GS_MarriageRingUp_Request.cost ),
	[
		<<?CMD_U2GS_MarriageRingUp_Request:16/little>>,
		Bin_cost
	];

%GENERATED from file:marriage.h => U2GS_MarriageSkillUp_Request
packNetMsg(#pk_U2GS_MarriageSkillUp_Request{} = P) ->
	Bin_cost = binary_write_uint( P#pk_U2GS_MarriageSkillUp_Request.cost ),
	Bin_id = binary_write_uint( P#pk_U2GS_MarriageSkillUp_Request.id ),
	[
		<<?CMD_U2GS_MarriageSkillUp_Request:16/little>>,
		Bin_cost,
		Bin_id
	];

%GENERATED from file:marriage.h => U2GS_MarriageSubmitTask_Request
packNetMsg(#pk_U2GS_MarriageSubmitTask_Request{}) ->
	[
		<<?CMD_U2GS_MarriageSubmitTask_Request:16/little>>

	];

%GENERATED from file:mount.h => GS2U_LookMountInfo
packNetMsg(#pk_GS2U_LookMountInfo{} = P) ->
	Bin_mountInfo = writeMountInfo( P#pk_GS2U_LookMountInfo.mountInfo ),
	[
		<<?CMD_GS2U_LookMountInfo:16/little>>,
		Bin_mountInfo
	];

%GENERATED from file:mount.h => GS2U_MountAck
packNetMsg(#pk_GS2U_MountAck{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_MountAck.code ),
	Bin_shape_id = binary_write_uint16( P#pk_GS2U_MountAck.shape_id ),
	Bin_opreate = binary_write_uint( P#pk_GS2U_MountAck.opreate ),
	[
		<<?CMD_GS2U_MountAck:16/little>>,
		Bin_code,
		Bin_shape_id,
		Bin_opreate
	];

%GENERATED from file:mount.h => GS2U_MountShapeList
packNetMsg(#pk_GS2U_MountShapeList{} = P) ->
	Bin_shape_list = binary_write_array(P#pk_GS2U_MountShapeList.shape_list, fun(X) -> binary_write_uint16( X ) end),
	[
		<<?CMD_GS2U_MountShapeList:16/little>>,
		Bin_shape_list
	];

%GENERATED from file:mount.h => GS2U_NewMountShape
packNetMsg(#pk_GS2U_NewMountShape{} = P) ->
	Bin_new_shape_id = binary_write_uint16( P#pk_GS2U_NewMountShape.new_shape_id ),
	[
		<<?CMD_GS2U_NewMountShape:16/little>>,
		Bin_new_shape_id
	];

%GENERATED from file:mount.h => MountShapeShift
packNetMsg(#pk_MountShapeShift{} = P) ->
	Bin_new_shape_id = binary_write_uint16( P#pk_MountShapeShift.new_shape_id ),
	[
		<<?CMD_MountShapeShift:16/little>>,
		Bin_new_shape_id
	];

%GENERATED from file:mount.h => U2GS_FeedMount
packNetMsg(#pk_U2GS_FeedMount{} = P) ->
	Bin_feedNum = binary_write_uint16( P#pk_U2GS_FeedMount.feedNum ),
	[
		<<?CMD_U2GS_FeedMount:16/little>>,
		Bin_feedNum
	];

%GENERATED from file:mount.h => U2GS_OffMount
packNetMsg(#pk_U2GS_OffMount{}) ->
	[
		<<?CMD_U2GS_OffMount:16/little>>

	];

%GENERATED from file:mount.h => U2GS_OnMount
packNetMsg(#pk_U2GS_OnMount{}) ->
	[
		<<?CMD_U2GS_OnMount:16/little>>

	];

%GENERATED from file:npc.h => GS2U_NpcMomentMove
packNetMsg(#pk_GS2U_NpcMomentMove{} = P) ->
	Bin_npcCode = binary_write_uint64( P#pk_GS2U_NpcMomentMove.npcCode ),
	Bin_npcID = binary_write_uint( P#pk_GS2U_NpcMomentMove.npcID ),
	Bin_tX = binary_write_float( P#pk_GS2U_NpcMomentMove.tX ),
	Bin_tY = binary_write_float( P#pk_GS2U_NpcMomentMove.tY ),
	[
		<<?CMD_GS2U_NpcMomentMove:16/little>>,
		Bin_npcCode,
		Bin_npcID,
		Bin_tX,
		Bin_tY
	];

%GENERATED from file:npc.h => GS2U_NpcTitleChange
packNetMsg(#pk_GS2U_NpcTitleChange{} = P) ->
	Bin_npclists = binary_write_array(P#pk_GS2U_NpcTitleChange.npclists, fun(X) -> writeNpcTitle( X ) end),
	[
		<<?CMD_GS2U_NpcTitleChange:16/little>>,
		Bin_npclists
	];

%GENERATED from file:npc.h => GS2U_RequestRiftNpcInfo
packNetMsg(#pk_GS2U_RequestRiftNpcInfo{} = P) ->
	Bin_npcCode = binary_write_uint64( P#pk_GS2U_RequestRiftNpcInfo.npcCode ),
	Bin_npcID = binary_write_uint( P#pk_GS2U_RequestRiftNpcInfo.npcID ),
	Bin_surplusTimes = binary_write_uint( P#pk_GS2U_RequestRiftNpcInfo.surplusTimes ),
	Bin_disappearTime = binary_write_uint( P#pk_GS2U_RequestRiftNpcInfo.disappearTime ),
	Bin_groupID = binary_write_uint64( P#pk_GS2U_RequestRiftNpcInfo.groupID ),
	Bin_bitplaneMapID = binary_write_uint( P#pk_GS2U_RequestRiftNpcInfo.bitplaneMapID ),
	[
		<<?CMD_GS2U_RequestRiftNpcInfo:16/little>>,
		Bin_npcCode,
		Bin_npcID,
		Bin_surplusTimes,
		Bin_disappearTime,
		Bin_groupID,
		Bin_bitplaneMapID
	];

%GENERATED from file:npc.h => U2GS_RequestEnterRift
packNetMsg(#pk_U2GS_RequestEnterRift{} = P) ->
	Bin_groupID = binary_write_uint64( P#pk_U2GS_RequestEnterRift.groupID ),
	Bin_bitplaneMapID = binary_write_uint( P#pk_U2GS_RequestEnterRift.bitplaneMapID ),
	[
		<<?CMD_U2GS_RequestEnterRift:16/little>>,
		Bin_groupID,
		Bin_bitplaneMapID
	];

%GENERATED from file:npc.h => U2GS_RequestRiftNpcInfo
packNetMsg(#pk_U2GS_RequestRiftNpcInfo{} = P) ->
	Bin_npcCode = binary_write_uint64( P#pk_U2GS_RequestRiftNpcInfo.npcCode ),
	[
		<<?CMD_U2GS_RequestRiftNpcInfo:16/little>>,
		Bin_npcCode
	];

%GENERATED from file:pet.h => GS2U_AckRewardLevel
packNetMsg(#pk_GS2U_AckRewardLevel{} = P) ->
	Bin_rewardLevel = binary_write_uint8( P#pk_GS2U_AckRewardLevel.rewardLevel ),
	[
		<<?CMD_GS2U_AckRewardLevel:16/little>>,
		Bin_rewardLevel
	];

%GENERATED from file:pet.h => GS2U_AckStandSort
packNetMsg(#pk_GS2U_AckStandSort{} = P) ->
	Bin_petList = binary_write_array(P#pk_GS2U_AckStandSort.petList, fun(X) -> binary_write_uint16( X ) end),
	[
		<<?CMD_GS2U_AckStandSort:16/little>>,
		Bin_petList
	];

%GENERATED from file:pet.h => GS2U_BuyPowerInfo
packNetMsg(#pk_GS2U_BuyPowerInfo{} = P) ->
	Bin_money = binary_write_int( P#pk_GS2U_BuyPowerInfo.money ),
	Bin_allCount = binary_write_int8( P#pk_GS2U_BuyPowerInfo.allCount ),
	Bin_curCount = binary_write_int8( P#pk_GS2U_BuyPowerInfo.curCount ),
	[
		<<?CMD_GS2U_BuyPowerInfo:16/little>>,
		Bin_money,
		Bin_allCount,
		Bin_curCount
	];

%GENERATED from file:pet.h => GS2U_DeletePet
packNetMsg(#pk_GS2U_DeletePet{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_GS2U_DeletePet.petID ),
	[
		<<?CMD_GS2U_DeletePet:16/little>>,
		Bin_petID
	];

%GENERATED from file:pet.h => GS2U_DoublePetMountInvite
packNetMsg(#pk_GS2U_DoublePetMountInvite{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_GS2U_DoublePetMountInvite.petID ),
	Bin_srcName = binary_write_string( P#pk_GS2U_DoublePetMountInvite.srcName ),
	Bin_srcRoleID = binary_write_uint64( P#pk_GS2U_DoublePetMountInvite.srcRoleID ),
	[
		<<?CMD_GS2U_DoublePetMountInvite:16/little>>,
		Bin_petID,
		Bin_srcName,
		Bin_srcRoleID
	];

%GENERATED from file:pet.h => GS2U_FindTerritoryFailed_Ack
packNetMsg(#pk_GS2U_FindTerritoryFailed_Ack{} = P) ->
	Bin_errorCode = binary_write_uint( P#pk_GS2U_FindTerritoryFailed_Ack.errorCode ),
	[
		<<?CMD_GS2U_FindTerritoryFailed_Ack:16/little>>,
		Bin_errorCode
	];

%GENERATED from file:pet.h => GS2U_FindTerritory_Ack
packNetMsg(#pk_GS2U_FindTerritory_Ack{} = P) ->
	Bin_info = writeTerritoryInfo( P#pk_GS2U_FindTerritory_Ack.info ),
	Bin_listInfo = binary_write_array(P#pk_GS2U_FindTerritory_Ack.listInfo, fun(X) -> writePetTerritoryInfo( X ) end),
	Bin_roleID = binary_write_uint64( P#pk_GS2U_FindTerritory_Ack.roleID ),
	Bin_roleName = binary_write_string( P#pk_GS2U_FindTerritory_Ack.roleName ),
	Bin_count = binary_write_uint( P#pk_GS2U_FindTerritory_Ack.count ),
	[
		<<?CMD_GS2U_FindTerritory_Ack:16/little>>,
		Bin_info,
		Bin_listInfo,
		Bin_roleID,
		Bin_roleName,
		Bin_count
	];

%GENERATED from file:pet.h => GS2U_OffMountPetAck
packNetMsg(#pk_GS2U_OffMountPetAck{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_OffMountPetAck.code ),
	Bin_x = binary_write_float( P#pk_GS2U_OffMountPetAck.x ),
	Bin_y = binary_write_float( P#pk_GS2U_OffMountPetAck.y ),
	[
		<<?CMD_GS2U_OffMountPetAck:16/little>>,
		Bin_code,
		Bin_x,
		Bin_y
	];

%GENERATED from file:pet.h => GS2U_OnMountPetAck
packNetMsg(#pk_GS2U_OnMountPetAck{} = P) ->
	Bin_ownerCode = binary_write_uint64( P#pk_GS2U_OnMountPetAck.ownerCode ),
	Bin_petCode = binary_write_uint64( P#pk_GS2U_OnMountPetAck.petCode ),
	Bin_petId = binary_write_uint16( P#pk_GS2U_OnMountPetAck.petId ),
	Bin_guestCode = binary_write_uint64( P#pk_GS2U_OnMountPetAck.guestCode ),
	[
		<<?CMD_GS2U_OnMountPetAck:16/little>>,
		Bin_ownerCode,
		Bin_petCode,
		Bin_petId,
		Bin_guestCode
	];

%GENERATED from file:pet.h => GS2U_PVEBattleResult
packNetMsg(#pk_GS2U_PVEBattleResult{} = P) ->
	Bin_res = binary_write_int8( P#pk_GS2U_PVEBattleResult.res ),
	Bin_coin = binary_write_int( P#pk_GS2U_PVEBattleResult.coin ),
	Bin_exp = binary_write_int( P#pk_GS2U_PVEBattleResult.exp ),
	Bin_score = binary_write_int8( P#pk_GS2U_PVEBattleResult.score ),
	Bin_itemList = binary_write_array(P#pk_GS2U_PVEBattleResult.itemList, fun(X) -> writePveItem( X ) end),
	[
		<<?CMD_GS2U_PVEBattleResult:16/little>>,
		Bin_res,
		Bin_coin,
		Bin_exp,
		Bin_score,
		Bin_itemList
	];

%GENERATED from file:pet.h => GS2U_PetAddAttaRes
packNetMsg(#pk_GS2U_PetAddAttaRes{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_GS2U_PetAddAttaRes.petID ),
	Bin_propList = binary_write_array(P#pk_GS2U_PetAddAttaRes.propList, fun(X) -> writeAddProp( X ) end),
	[
		<<?CMD_GS2U_PetAddAttaRes:16/little>>,
		Bin_petID,
		Bin_propList
	];

%GENERATED from file:pet.h => GS2U_PetAssistInit
packNetMsg(#pk_GS2U_PetAssistInit{} = P) ->
	Bin_infoList = binary_write_array(P#pk_GS2U_PetAssistInit.infoList, fun(X) -> writeAssistBattleInfo( X ) end),
	[
		<<?CMD_GS2U_PetAssistInit:16/little>>,
		Bin_infoList
	];

%GENERATED from file:pet.h => GS2U_PetAssistUpdateSlot
packNetMsg(#pk_GS2U_PetAssistUpdateSlot{} = P) ->
	Bin_slot = binary_write_uint8( P#pk_GS2U_PetAssistUpdateSlot.slot ),
	Bin_petID = binary_write_uint16( P#pk_GS2U_PetAssistUpdateSlot.petID ),
	[
		<<?CMD_GS2U_PetAssistUpdateSlot:16/little>>,
		Bin_slot,
		Bin_petID
	];

%GENERATED from file:pet.h => GS2U_PetAttaSaveRes
packNetMsg(#pk_GS2U_PetAttaSaveRes{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_GS2U_PetAttaSaveRes.petID ),
	Bin_propList = binary_write_array(P#pk_GS2U_PetAttaSaveRes.propList, fun(X) -> writeAddProp( X ) end),
	[
		<<?CMD_GS2U_PetAttaSaveRes:16/little>>,
		Bin_petID,
		Bin_propList
	];

%GENERATED from file:pet.h => GS2U_PetBaseInfo
packNetMsg(#pk_GS2U_PetBaseInfo{} = P) ->
	Bin_info = writePetBaseInfo( P#pk_GS2U_PetBaseInfo.info ),
	[
		<<?CMD_GS2U_PetBaseInfo:16/little>>,
		Bin_info
	];

%GENERATED from file:pet.h => GS2U_PetEquipInfoList
packNetMsg(#pk_GS2U_PetEquipInfoList{} = P) ->
	Bin_petEquipInfoList = binary_write_array(P#pk_GS2U_PetEquipInfoList.petEquipInfoList, fun(X) -> writePetEquipInfo( X ) end),
	[
		<<?CMD_GS2U_PetEquipInfoList:16/little>>,
		Bin_petEquipInfoList
	];

%GENERATED from file:pet.h => GS2U_PetFairyInfo
packNetMsg(#pk_GS2U_PetFairyInfo{} = P) ->
	Bin_point = binary_write_int( P#pk_GS2U_PetFairyInfo.point ),
	Bin_level = binary_write_int16( P#pk_GS2U_PetFairyInfo.level ),
	[
		<<?CMD_GS2U_PetFairyInfo:16/little>>,
		Bin_point,
		Bin_level
	];

%GENERATED from file:pet.h => GS2U_PetInfoList
packNetMsg(#pk_GS2U_PetInfoList{} = P) ->
	Bin_petInfoList = binary_write_array(P#pk_GS2U_PetInfoList.petInfoList, fun(X) -> writePetBaseInfo( X ) end),
	[
		<<?CMD_GS2U_PetInfoList:16/little>>,
		Bin_petInfoList
	];

%GENERATED from file:pet.h => GS2U_PetLevelUp
packNetMsg(#pk_GS2U_PetLevelUp{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_GS2U_PetLevelUp.petID ),
	Bin_petLevel = binary_write_uint16( P#pk_GS2U_PetLevelUp.petLevel ),
	Bin_petExp = binary_write_uint( P#pk_GS2U_PetLevelUp.petExp ),
	[
		<<?CMD_GS2U_PetLevelUp:16/little>>,
		Bin_petID,
		Bin_petLevel,
		Bin_petExp
	];

%GENERATED from file:pet.h => GS2U_PetPveSweepAck
packNetMsg(#pk_GS2U_PetPveSweepAck{} = P) ->
	Bin_sweepList = binary_write_array(P#pk_GS2U_PetPveSweepAck.sweepList, fun(X) -> writePveSweep( X ) end),
	[
		<<?CMD_GS2U_PetPveSweepAck:16/little>>,
		Bin_sweepList
	];

%GENERATED from file:pet.h => GS2U_PetReName
packNetMsg(#pk_GS2U_PetReName{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_PetReName.code ),
	Bin_name = binary_write_string( P#pk_GS2U_PetReName.name ),
	[
		<<?CMD_GS2U_PetReName:16/little>>,
		Bin_code,
		Bin_name
	];

%GENERATED from file:pet.h => GS2U_PetSkillCastResult
packNetMsg(#pk_GS2U_PetSkillCastResult{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_GS2U_PetSkillCastResult.petID ),
	Bin_skillList = binary_write_array(P#pk_GS2U_PetSkillCastResult.skillList, fun(X) -> writePetSkillCastResult( X ) end),
	[
		<<?CMD_GS2U_PetSkillCastResult:16/little>>,
		Bin_petID,
		Bin_skillList
	];

%GENERATED from file:pet.h => GS2U_PetSleep
packNetMsg(#pk_GS2U_PetSleep{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_PetSleep.code ),
	[
		<<?CMD_GS2U_PetSleep:16/little>>,
		Bin_code
	];

%GENERATED from file:pet.h => GS2U_PetStrAck
packNetMsg(#pk_GS2U_PetStrAck{} = P) ->
	Bin_petEquipInfo = writePetEquipInfo( P#pk_GS2U_PetStrAck.petEquipInfo ),
	[
		<<?CMD_GS2U_PetStrAck:16/little>>,
		Bin_petEquipInfo
	];

%GENERATED from file:pet.h => GS2U_PvpBattleInfoRes
packNetMsg(#pk_GS2U_PvpBattleInfoRes{} = P) ->
	Bin_reel = binary_write_uint8( P#pk_GS2U_PvpBattleInfoRes.reel ),
	Bin_pl = binary_write_array(P#pk_GS2U_PvpBattleInfoRes.pl, fun(X) -> binary_write_uint16( X ) end),
	Bin_point = binary_write_uint16( P#pk_GS2U_PvpBattleInfoRes.point ),
	Bin_cl = binary_write_array(P#pk_GS2U_PvpBattleInfoRes.cl, fun(X) -> writePvPCityInfo( X ) end),
	Bin_bpl = binary_write_array(P#pk_GS2U_PvpBattleInfoRes.bpl, fun(X) -> writePvpBattleReportInfo( X ) end),
	[
		<<?CMD_GS2U_PvpBattleInfoRes:16/little>>,
		Bin_reel,
		Bin_pl,
		Bin_point,
		Bin_cl,
		Bin_bpl
	];

%GENERATED from file:pet.h => GS2U_PvpBattleReportTip
packNetMsg(#pk_GS2U_PvpBattleReportTip{}) ->
	[
		<<?CMD_GS2U_PvpBattleReportTip:16/little>>

	];

%GENERATED from file:pet.h => GS2U_PvpBattleResult
packNetMsg(#pk_GS2U_PvpBattleResult{} = P) ->
	Bin_res = binary_write_int8( P#pk_GS2U_PvpBattleResult.res ),
	Bin_coin = binary_write_int( P#pk_GS2U_PvpBattleResult.coin ),
	Bin_exp = binary_write_int( P#pk_GS2U_PvpBattleResult.exp ),
	Bin_pi = writePvPCityInfo( P#pk_GS2U_PvpBattleResult.pi ),
	[
		<<?CMD_GS2U_PvpBattleResult:16/little>>,
		Bin_res,
		Bin_coin,
		Bin_exp,
		Bin_pi
	];

%GENERATED from file:pet.h => GS2U_PvpBattleUpdateReport
packNetMsg(#pk_GS2U_PvpBattleUpdateReport{} = P) ->
	Bin_br = writePvpBattleReportInfo( P#pk_GS2U_PvpBattleUpdateReport.br ),
	[
		<<?CMD_GS2U_PvpBattleUpdateReport:16/little>>,
		Bin_br
	];

%GENERATED from file:pet.h => GS2U_PvpPosSaveAck
packNetMsg(#pk_GS2U_PvpPosSaveAck{} = P) ->
	Bin_petList = binary_write_array(P#pk_GS2U_PvpPosSaveAck.petList, fun(X) -> binary_write_uint16( X ) end),
	[
		<<?CMD_GS2U_PvpPosSaveAck:16/little>>,
		Bin_petList
	];

%GENERATED from file:pet.h => GS2U_QueryTerritoryHistory_Ack
packNetMsg(#pk_GS2U_QueryTerritoryHistory_Ack{} = P) ->
	Bin_attackOrDefense = binary_write_bool( P#pk_GS2U_QueryTerritoryHistory_Ack.attackOrDefense ),
	Bin_fightCount = binary_write_uint( P#pk_GS2U_QueryTerritoryHistory_Ack.fightCount ),
	Bin_listInfo = binary_write_array(P#pk_GS2U_QueryTerritoryHistory_Ack.listInfo, fun(X) -> writeTerritoryHistoryCell( X ) end),
	[
		<<?CMD_GS2U_QueryTerritoryHistory_Ack:16/little>>,
		Bin_attackOrDefense,
		Bin_fightCount,
		Bin_listInfo
	];

%GENERATED from file:pet.h => GS2U_QueryTerritoryInfo_Ack
packNetMsg(#pk_GS2U_QueryTerritoryInfo_Ack{} = P) ->
	Bin_listTerritory = binary_write_array(P#pk_GS2U_QueryTerritoryInfo_Ack.listTerritory, fun(X) -> writeTerritoryInfo( X ) end),
	Bin_listPet = binary_write_array(P#pk_GS2U_QueryTerritoryInfo_Ack.listPet, fun(X) -> writePetTerritoryInfo( X ) end),
	[
		<<?CMD_GS2U_QueryTerritoryInfo_Ack:16/little>>,
		Bin_listTerritory,
		Bin_listPet
	];

%GENERATED from file:pet.h => GS2U_RawPetResult
packNetMsg(#pk_GS2U_RawPetResult{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_GS2U_RawPetResult.petID ),
	Bin_curRaw = binary_write_uint8( P#pk_GS2U_RawPetResult.curRaw ),
	[
		<<?CMD_GS2U_RawPetResult:16/little>>,
		Bin_petID,
		Bin_curRaw
	];

%GENERATED from file:pet.h => GS2U_ResetPetAck
packNetMsg(#pk_GS2U_ResetPetAck{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_GS2U_ResetPetAck.petID ),
	[
		<<?CMD_GS2U_ResetPetAck:16/little>>,
		Bin_petID
	];

%GENERATED from file:pet.h => GS2U_TerritoryBattle_Tick_Sync
packNetMsg(#pk_GS2U_TerritoryBattle_Tick_Sync{} = P) ->
	Bin_time = binary_write_uint( P#pk_GS2U_TerritoryBattle_Tick_Sync.time ),
	Bin_timeAll = binary_write_uint( P#pk_GS2U_TerritoryBattle_Tick_Sync.timeAll ),
	Bin_state = binary_write_uint8( P#pk_GS2U_TerritoryBattle_Tick_Sync.state ),
	[
		<<?CMD_GS2U_TerritoryBattle_Tick_Sync:16/little>>,
		Bin_time,
		Bin_timeAll,
		Bin_state
	];

%GENERATED from file:pet.h => GS2U_TerritoryExploitEnd_Sync
packNetMsg(#pk_GS2U_TerritoryExploitEnd_Sync{}) ->
	[
		<<?CMD_GS2U_TerritoryExploitEnd_Sync:16/little>>

	];

%GENERATED from file:pet.h => GS2U_TerritoryExploit_Ack
packNetMsg(#pk_GS2U_TerritoryExploit_Ack{} = P) ->
	Bin_info = writeTerritoryInfo( P#pk_GS2U_TerritoryExploit_Ack.info ),
	Bin_listInfo = binary_write_array(P#pk_GS2U_TerritoryExploit_Ack.listInfo, fun(X) -> writePetTerritoryInfo( X ) end),
	[
		<<?CMD_GS2U_TerritoryExploit_Ack:16/little>>,
		Bin_info,
		Bin_listInfo
	];

%GENERATED from file:pet.h => GS2U_TerritoryPlunder_Ack
packNetMsg(#pk_GS2U_TerritoryPlunder_Ack{} = P) ->
	Bin_cfgReward = binary_write_uint( P#pk_GS2U_TerritoryPlunder_Ack.cfgReward ),
	Bin_count1 = binary_write_uint( P#pk_GS2U_TerritoryPlunder_Ack.count1 ),
	Bin_count2 = binary_write_uint( P#pk_GS2U_TerritoryPlunder_Ack.count2 ),
	[
		<<?CMD_GS2U_TerritoryPlunder_Ack:16/little>>,
		Bin_cfgReward,
		Bin_count1,
		Bin_count2
	];

%GENERATED from file:pet.h => GS2U_TerritoryVigor_Ack
packNetMsg(#pk_GS2U_TerritoryVigor_Ack{} = P) ->
	Bin_vigor = binary_write_uint( P#pk_GS2U_TerritoryVigor_Ack.vigor ),
	[
		<<?CMD_GS2U_TerritoryVigor_Ack:16/little>>,
		Bin_vigor
	];

%GENERATED from file:pet.h => GS2U_UpStartPetResult
packNetMsg(#pk_GS2U_UpStartPetResult{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_GS2U_UpStartPetResult.petID ),
	Bin_curStar = binary_write_uint8( P#pk_GS2U_UpStartPetResult.curStar ),
	Bin_petSkillID = binary_write_uint16( P#pk_GS2U_UpStartPetResult.petSkillID ),
	[
		<<?CMD_GS2U_UpStartPetResult:16/little>>,
		Bin_petID,
		Bin_curStar,
		Bin_petSkillID
	];

%GENERATED from file:pet.h => GS2U_UpdateCatalogList
packNetMsg(#pk_GS2U_UpdateCatalogList{} = P) ->
	Bin_catalogList = binary_write_array(P#pk_GS2U_UpdateCatalogList.catalogList, fun(X) -> writeCatalogNode( X ) end),
	[
		<<?CMD_GS2U_UpdateCatalogList:16/little>>,
		Bin_catalogList
	];

%GENERATED from file:pet.h => GS2U_UpdatePetSkill
packNetMsg(#pk_GS2U_UpdatePetSkill{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_GS2U_UpdatePetSkill.petID ),
	Bin_skillInfo = writePetSkillBaseInfo( P#pk_GS2U_UpdatePetSkill.skillInfo ),
	[
		<<?CMD_GS2U_UpdatePetSkill:16/little>>,
		Bin_petID,
		Bin_skillInfo
	];

%GENERATED from file:pet.h => GS2U_UpdatePetStatus
packNetMsg(#pk_GS2U_UpdatePetStatus{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_GS2U_UpdatePetStatus.petID ),
	Bin_status = binary_write_uint8( P#pk_GS2U_UpdatePetStatus.status ),
	[
		<<?CMD_GS2U_UpdatePetStatus:16/little>>,
		Bin_petID,
		Bin_status
	];

%GENERATED from file:pet.h => GS2U_UpdatePower
packNetMsg(#pk_GS2U_UpdatePower{} = P) ->
	Bin_power = binary_write_int( P#pk_GS2U_UpdatePower.power ),
	[
		<<?CMD_GS2U_UpdatePower:16/little>>,
		Bin_power
	];

%GENERATED from file:pet.h => GS2U_UpdateReel
packNetMsg(#pk_GS2U_UpdateReel{} = P) ->
	Bin_reel = binary_write_int8( P#pk_GS2U_UpdateReel.reel ),
	[
		<<?CMD_GS2U_UpdateReel:16/little>>,
		Bin_reel
	];

%GENERATED from file:pet.h => GS2U_UsePetSkillBook
packNetMsg(#pk_GS2U_UsePetSkillBook{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_GS2U_UsePetSkillBook.petID ),
	Bin_oldSkillId = binary_write_uint16( P#pk_GS2U_UsePetSkillBook.oldSkillId ),
	Bin_newSkillId = binary_write_uint16( P#pk_GS2U_UsePetSkillBook.newSkillId ),
	Bin_newSkillLevel = binary_write_uint16( P#pk_GS2U_UsePetSkillBook.newSkillLevel ),
	[
		<<?CMD_GS2U_UsePetSkillBook:16/little>>,
		Bin_petID,
		Bin_oldSkillId,
		Bin_newSkillId,
		Bin_newSkillLevel
	];

%GENERATED from file:pet.h => PetReName
packNetMsg(#pk_PetReName{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_PetReName.petID ),
	Bin_name = binary_write_string( P#pk_PetReName.name ),
	[
		<<?CMD_PetReName:16/little>>,
		Bin_petID,
		Bin_name
	];

%GENERATED from file:pet.h => PetSkillReplace
packNetMsg(#pk_PetSkillReplace{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_PetSkillReplace.petID ),
	[
		<<?CMD_PetSkillReplace:16/little>>,
		Bin_petID
	];

%GENERATED from file:pet.h => PetSwitch
packNetMsg(#pk_PetSwitch{} = P) ->
	Bin_petId = binary_write_uint16( P#pk_PetSwitch.petId ),
	[
		<<?CMD_PetSwitch:16/little>>,
		Bin_petId
	];

%GENERATED from file:pet.h => U2GS_BuyPower
packNetMsg(#pk_U2GS_BuyPower{}) ->
	[
		<<?CMD_U2GS_BuyPower:16/little>>

	];

%GENERATED from file:pet.h => U2GS_BuyReel
packNetMsg(#pk_U2GS_BuyReel{}) ->
	[
		<<?CMD_U2GS_BuyReel:16/little>>

	];

%GENERATED from file:pet.h => U2GS_DoublePetMountInvite
packNetMsg(#pk_U2GS_DoublePetMountInvite{} = P) ->
	Bin_tarRoleID = binary_write_uint64( P#pk_U2GS_DoublePetMountInvite.tarRoleID ),
	[
		<<?CMD_U2GS_DoublePetMountInvite:16/little>>,
		Bin_tarRoleID
	];

%GENERATED from file:pet.h => U2GS_DoublePetMountInviteAck
packNetMsg(#pk_U2GS_DoublePetMountInviteAck{} = P) ->
	Bin_agree = binary_write_int8( P#pk_U2GS_DoublePetMountInviteAck.agree ),
	Bin_srcRoleID = binary_write_uint64( P#pk_U2GS_DoublePetMountInviteAck.srcRoleID ),
	[
		<<?CMD_U2GS_DoublePetMountInviteAck:16/little>>,
		Bin_agree,
		Bin_srcRoleID
	];

%GENERATED from file:pet.h => U2GS_FindTerritory_Request
packNetMsg(#pk_U2GS_FindTerritory_Request{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_FindTerritory_Request.roleID ),
	[
		<<?CMD_U2GS_FindTerritory_Request:16/little>>,
		Bin_roleID
	];

%GENERATED from file:pet.h => U2GS_HideMountPet
packNetMsg(#pk_U2GS_HideMountPet{}) ->
	[
		<<?CMD_U2GS_HideMountPet:16/little>>

	];

%GENERATED from file:pet.h => U2GS_OffMountPet
packNetMsg(#pk_U2GS_OffMountPet{}) ->
	[
		<<?CMD_U2GS_OffMountPet:16/little>>

	];

%GENERATED from file:pet.h => U2GS_OnMountPet
packNetMsg(#pk_U2GS_OnMountPet{}) ->
	[
		<<?CMD_U2GS_OnMountPet:16/little>>

	];

%GENERATED from file:pet.h => U2GS_PetAddAtta
packNetMsg(#pk_U2GS_PetAddAtta{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_U2GS_PetAddAtta.petID ),
	Bin_num = binary_write_uint8( P#pk_U2GS_PetAddAtta.num ),
	[
		<<?CMD_U2GS_PetAddAtta:16/little>>,
		Bin_petID,
		Bin_num
	];

%GENERATED from file:pet.h => U2GS_PetAssistBattle
packNetMsg(#pk_U2GS_PetAssistBattle{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_U2GS_PetAssistBattle.petID ),
	Bin_slot = binary_write_uint8( P#pk_U2GS_PetAssistBattle.slot ),
	Bin_status = binary_write_uint8( P#pk_U2GS_PetAssistBattle.status ),
	[
		<<?CMD_U2GS_PetAssistBattle:16/little>>,
		Bin_petID,
		Bin_slot,
		Bin_status
	];

%GENERATED from file:pet.h => U2GS_PetAttaSave
packNetMsg(#pk_U2GS_PetAttaSave{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_U2GS_PetAttaSave.petID ),
	[
		<<?CMD_U2GS_PetAttaSave:16/little>>,
		Bin_petID
	];

%GENERATED from file:pet.h => U2GS_PetDisapear
packNetMsg(#pk_U2GS_PetDisapear{} = P) ->
	Bin_code = binary_write_uint64( P#pk_U2GS_PetDisapear.code ),
	[
		<<?CMD_U2GS_PetDisapear:16/little>>,
		Bin_code
	];

%GENERATED from file:pet.h => U2GS_PetLevelUp
packNetMsg(#pk_U2GS_PetLevelUp{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_U2GS_PetLevelUp.petID ),
	Bin_itemUID = binary_write_uint64( P#pk_U2GS_PetLevelUp.itemUID ),
	Bin_useNum = binary_write_uint16( P#pk_U2GS_PetLevelUp.useNum ),
	[
		<<?CMD_U2GS_PetLevelUp:16/little>>,
		Bin_petID,
		Bin_itemUID,
		Bin_useNum
	];

%GENERATED from file:pet.h => U2GS_PetPveSweep
packNetMsg(#pk_U2GS_PetPveSweep{} = P) ->
	Bin_id = binary_write_uint16( P#pk_U2GS_PetPveSweep.id ),
	[
		<<?CMD_U2GS_PetPveSweep:16/little>>,
		Bin_id
	];

%GENERATED from file:pet.h => U2GS_PetSkillCast
packNetMsg(#pk_U2GS_PetSkillCast{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_U2GS_PetSkillCast.petID ),
	Bin_skillIDs = binary_write_array(P#pk_U2GS_PetSkillCast.skillIDs, fun(X) -> binary_write_uint16( X ) end),
	[
		<<?CMD_U2GS_PetSkillCast:16/little>>,
		Bin_petID,
		Bin_skillIDs
	];

%GENERATED from file:pet.h => U2GS_PetSkillOperate
packNetMsg(#pk_U2GS_PetSkillOperate{} = P) ->
	Bin_operationType = binary_write_uint16( P#pk_U2GS_PetSkillOperate.operationType ),
	Bin_petID = binary_write_uint16( P#pk_U2GS_PetSkillOperate.petID ),
	Bin_petSkillId = binary_write_uint16( P#pk_U2GS_PetSkillOperate.petSkillId ),
	[
		<<?CMD_U2GS_PetSkillOperate:16/little>>,
		Bin_operationType,
		Bin_petID,
		Bin_petSkillId
	];

%GENERATED from file:pet.h => U2GS_PetStr
packNetMsg(#pk_U2GS_PetStr{} = P) ->
	Bin_equipID = binary_write_uint8( P#pk_U2GS_PetStr.equipID ),
	Bin_type = binary_write_uint8( P#pk_U2GS_PetStr.type ),
	[
		<<?CMD_U2GS_PetStr:16/little>>,
		Bin_equipID,
		Bin_type
	];

%GENERATED from file:pet.h => U2GS_PvpBattleInfo
packNetMsg(#pk_U2GS_PvpBattleInfo{}) ->
	[
		<<?CMD_U2GS_PvpBattleInfo:16/little>>

	];

%GENERATED from file:pet.h => U2GS_PvpPosSave
packNetMsg(#pk_U2GS_PvpPosSave{} = P) ->
	Bin_petList = binary_write_array(P#pk_U2GS_PvpPosSave.petList, fun(X) -> binary_write_uint16( X ) end),
	[
		<<?CMD_U2GS_PvpPosSave:16/little>>,
		Bin_petList
	];

%GENERATED from file:pet.h => U2GS_QueryPetFairyInfo
packNetMsg(#pk_U2GS_QueryPetFairyInfo{}) ->
	[
		<<?CMD_U2GS_QueryPetFairyInfo:16/little>>

	];

%GENERATED from file:pet.h => U2GS_QueryTerritoryHistory_Request
packNetMsg(#pk_U2GS_QueryTerritoryHistory_Request{} = P) ->
	Bin_attackOrDefense = binary_write_bool( P#pk_U2GS_QueryTerritoryHistory_Request.attackOrDefense ),
	[
		<<?CMD_U2GS_QueryTerritoryHistory_Request:16/little>>,
		Bin_attackOrDefense
	];

%GENERATED from file:pet.h => U2GS_QueryTerritoryInfo_Request
packNetMsg(#pk_U2GS_QueryTerritoryInfo_Request{}) ->
	[
		<<?CMD_U2GS_QueryTerritoryInfo_Request:16/little>>

	];

%GENERATED from file:pet.h => U2GS_RawPet
packNetMsg(#pk_U2GS_RawPet{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_U2GS_RawPet.petID ),
	[
		<<?CMD_U2GS_RawPet:16/little>>,
		Bin_petID
	];

%GENERATED from file:pet.h => U2GS_RequestBattle
packNetMsg(#pk_U2GS_RequestBattle{} = P) ->
	Bin_id = binary_write_int( P#pk_U2GS_RequestBattle.id ),
	[
		<<?CMD_U2GS_RequestBattle:16/little>>,
		Bin_id
	];

%GENERATED from file:pet.h => U2GS_RequestPvpBattle
packNetMsg(#pk_U2GS_RequestPvpBattle{} = P) ->
	Bin_cityID = binary_write_uint8( P#pk_U2GS_RequestPvpBattle.cityID ),
	Bin_roleID = binary_write_uint64( P#pk_U2GS_RequestPvpBattle.roleID ),
	[
		<<?CMD_U2GS_RequestPvpBattle:16/little>>,
		Bin_cityID,
		Bin_roleID
	];

%GENERATED from file:pet.h => U2GS_RequstReward
packNetMsg(#pk_U2GS_RequstReward{}) ->
	[
		<<?CMD_U2GS_RequstReward:16/little>>

	];

%GENERATED from file:pet.h => U2GS_ResetPet
packNetMsg(#pk_U2GS_ResetPet{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_U2GS_ResetPet.petID ),
	[
		<<?CMD_U2GS_ResetPet:16/little>>,
		Bin_petID
	];

%GENERATED from file:pet.h => U2GS_ShowMountPet
packNetMsg(#pk_U2GS_ShowMountPet{}) ->
	[
		<<?CMD_U2GS_ShowMountPet:16/little>>

	];

%GENERATED from file:pet.h => U2GS_StandSort
packNetMsg(#pk_U2GS_StandSort{} = P) ->
	Bin_petList = binary_write_array(P#pk_U2GS_StandSort.petList, fun(X) -> binary_write_uint16( X ) end),
	[
		<<?CMD_U2GS_StandSort:16/little>>,
		Bin_petList
	];

%GENERATED from file:pet.h => U2GS_TerritoryExploit_Request
packNetMsg(#pk_U2GS_TerritoryExploit_Request{} = P) ->
	Bin_territoryID = binary_write_uint( P#pk_U2GS_TerritoryExploit_Request.territoryID ),
	Bin_listPetID = binary_write_array(P#pk_U2GS_TerritoryExploit_Request.listPetID, fun(X) -> binary_write_uint( X ) end),
	Bin_cfgTime = binary_write_uint( P#pk_U2GS_TerritoryExploit_Request.cfgTime ),
	Bin_cfgLevel = binary_write_uint( P#pk_U2GS_TerritoryExploit_Request.cfgLevel ),
	[
		<<?CMD_U2GS_TerritoryExploit_Request:16/little>>,
		Bin_territoryID,
		Bin_listPetID,
		Bin_cfgTime,
		Bin_cfgLevel
	];

%GENERATED from file:pet.h => U2GS_TerritoryPlunder_Request
packNetMsg(#pk_U2GS_TerritoryPlunder_Request{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_TerritoryPlunder_Request.roleID ),
	Bin_territoryID = binary_write_uint( P#pk_U2GS_TerritoryPlunder_Request.territoryID ),
	Bin_listPetID = binary_write_array(P#pk_U2GS_TerritoryPlunder_Request.listPetID, fun(X) -> binary_write_uint( X ) end),
	[
		<<?CMD_U2GS_TerritoryPlunder_Request:16/little>>,
		Bin_roleID,
		Bin_territoryID,
		Bin_listPetID
	];

%GENERATED from file:pet.h => U2GS_TerritoryVigor_Request
packNetMsg(#pk_U2GS_TerritoryVigor_Request{}) ->
	[
		<<?CMD_U2GS_TerritoryVigor_Request:16/little>>

	];

%GENERATED from file:pet.h => U2GS_UpStartPet
packNetMsg(#pk_U2GS_UpStartPet{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_U2GS_UpStartPet.petID ),
	[
		<<?CMD_U2GS_UpStartPet:16/little>>,
		Bin_petID
	];

%GENERATED from file:pet.h => U2GS_UsePetSkillBook
packNetMsg(#pk_U2GS_UsePetSkillBook{} = P) ->
	Bin_petID = binary_write_uint16( P#pk_U2GS_UsePetSkillBook.petID ),
	Bin_petSkillId = binary_write_uint16( P#pk_U2GS_UsePetSkillBook.petSkillId ),
	Bin_itemid = binary_write_uint16( P#pk_U2GS_UsePetSkillBook.itemid ),
	[
		<<?CMD_U2GS_UsePetSkillBook:16/little>>,
		Bin_petID,
		Bin_petSkillId,
		Bin_itemid
	];

%GENERATED from file:player.h => Any_ChangeMap
packNetMsg(#pk_Any_ChangeMap{} = P) ->
	Bin_mapId = binary_write_uint( P#pk_Any_ChangeMap.mapId ),
	Bin_x = binary_write_float( P#pk_Any_ChangeMap.x ),
	Bin_y = binary_write_float( P#pk_Any_ChangeMap.y ),
	[
		<<?CMD_Any_ChangeMap:16/little>>,
		Bin_mapId,
		Bin_x,
		Bin_y
	];

%GENERATED from file:player.h => Any_PlayerLogout
packNetMsg(#pk_Any_PlayerLogout{} = P) ->
	Bin_code = binary_write_uint64( P#pk_Any_PlayerLogout.code ),
	Bin_reason = binary_write_uint8( P#pk_Any_PlayerLogout.reason ),
	[
		<<?CMD_Any_PlayerLogout:16/little>>,
		Bin_code,
		Bin_reason
	];

%GENERATED from file:player.h => C2S_ChangeMap
packNetMsg(#pk_C2S_ChangeMap{} = P) ->
	Bin_mapId = binary_write_uint( P#pk_C2S_ChangeMap.mapId ),
	Bin_waypointName = binary_write_string( P#pk_C2S_ChangeMap.waypointName ),
	[
		<<?CMD_C2S_ChangeMap:16/little>>,
		Bin_mapId,
		Bin_waypointName
	];

%GENERATED from file:player.h => GS2U_AcceptHolidayTaskSucc
packNetMsg(#pk_GS2U_AcceptHolidayTaskSucc{} = P) ->
	Bin_result = binary_write_uint8( P#pk_GS2U_AcceptHolidayTaskSucc.result ),
	[
		<<?CMD_GS2U_AcceptHolidayTaskSucc:16/little>>,
		Bin_result
	];

%GENERATED from file:player.h => GS2U_AllBattleProp
packNetMsg(#pk_GS2U_AllBattleProp{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_AllBattleProp.code ),
	Bin_battlePropInfo = binary_write_array(P#pk_GS2U_AllBattleProp.battlePropInfo, fun(X) -> binary_write_float( X ) end),
	[
		<<?CMD_GS2U_AllBattleProp:16/little>>,
		Bin_code,
		Bin_battlePropInfo
	];

%GENERATED from file:player.h => GS2U_BattlePropList
packNetMsg(#pk_GS2U_BattlePropList{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_BattlePropList.code ),
	Bin_id = binary_write_uint16( P#pk_GS2U_BattlePropList.id ),
	Bin_battleProp = binary_write_array(P#pk_GS2U_BattlePropList.battleProp, fun(X) -> writeBattleProp( X ) end),
	[
		<<?CMD_GS2U_BattlePropList:16/little>>,
		Bin_code,
		Bin_id,
		Bin_battleProp
	];

%GENERATED from file:player.h => GS2U_BlockStatusChange
packNetMsg(#pk_GS2U_BlockStatusChange{} = P) ->
	Bin_changes = binary_write_array(P#pk_GS2U_BlockStatusChange.changes, fun(X) -> writeBlockStatusChange( X ) end),
	[
		<<?CMD_GS2U_BlockStatusChange:16/little>>,
		Bin_changes
	];

%GENERATED from file:player.h => GS2U_BroadcastDisapear
packNetMsg(#pk_GS2U_BroadcastDisapear{} = P) ->
	Bin_code = binary_write_array(P#pk_GS2U_BroadcastDisapear.code, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_GS2U_BroadcastDisapear:16/little>>,
		Bin_code
	];

%GENERATED from file:player.h => GS2U_BroadcastDisapearFast
packNetMsg(#pk_GS2U_BroadcastDisapearFast{} = P) ->
	Bin_code = binary_write_array(P#pk_GS2U_BroadcastDisapearFast.code, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_GS2U_BroadcastDisapearFast:16/little>>,
		Bin_code
	];

%GENERATED from file:player.h => GS2U_BroadcastPlayerHpPC
packNetMsg(#pk_GS2U_BroadcastPlayerHpPC{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_BroadcastPlayerHpPC.code ),
	Bin_hpPC = binary_write_uint8( P#pk_GS2U_BroadcastPlayerHpPC.hpPC ),
	[
		<<?CMD_GS2U_BroadcastPlayerHpPC:16/little>>,
		Bin_code,
		Bin_hpPC
	];

%GENERATED from file:player.h => GS2U_BroadcastPlayerRevive
packNetMsg(#pk_GS2U_BroadcastPlayerRevive{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_BroadcastPlayerRevive.code ),
	Bin_mapId = binary_write_uint16( P#pk_GS2U_BroadcastPlayerRevive.mapId ),
	Bin_x = binary_write_float( P#pk_GS2U_BroadcastPlayerRevive.x ),
	Bin_y = binary_write_float( P#pk_GS2U_BroadcastPlayerRevive.y ),
	Bin_hpPC = binary_write_uint8( P#pk_GS2U_BroadcastPlayerRevive.hpPC ),
	[
		<<?CMD_GS2U_BroadcastPlayerRevive:16/little>>,
		Bin_code,
		Bin_mapId,
		Bin_x,
		Bin_y,
		Bin_hpPC
	];

%GENERATED from file:player.h => GS2U_BroadcastTeamRevive
packNetMsg(#pk_GS2U_BroadcastTeamRevive{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_BroadcastTeamRevive.roleID ),
	Bin_mapId = binary_write_uint16( P#pk_GS2U_BroadcastTeamRevive.mapId ),
	Bin_x = binary_write_float( P#pk_GS2U_BroadcastTeamRevive.x ),
	Bin_y = binary_write_float( P#pk_GS2U_BroadcastTeamRevive.y ),
	Bin_hpPC = binary_write_uint8( P#pk_GS2U_BroadcastTeamRevive.hpPC ),
	[
		<<?CMD_GS2U_BroadcastTeamRevive:16/little>>,
		Bin_roleID,
		Bin_mapId,
		Bin_x,
		Bin_y,
		Bin_hpPC
	];

%GENERATED from file:player.h => GS2U_BroadcastVisibleEquipOff
packNetMsg(#pk_GS2U_BroadcastVisibleEquipOff{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_BroadcastVisibleEquipOff.code ),
	Bin_type = binary_write_uint( P#pk_GS2U_BroadcastVisibleEquipOff.type ),
	[
		<<?CMD_GS2U_BroadcastVisibleEquipOff:16/little>>,
		Bin_code,
		Bin_type
	];

%GENERATED from file:player.h => GS2U_BroadcastVisibleEquipOn
packNetMsg(#pk_GS2U_BroadcastVisibleEquipOn{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_BroadcastVisibleEquipOn.code ),
	Bin_equip = writevisibleEquip( P#pk_GS2U_BroadcastVisibleEquipOn.equip ),
	[
		<<?CMD_GS2U_BroadcastVisibleEquipOn:16/little>>,
		Bin_code,
		Bin_equip
	];

%GENERATED from file:player.h => GS2U_BuyLimitedResult
packNetMsg(#pk_GS2U_BuyLimitedResult{} = P) ->
	Bin_result = binary_write_uint8( P#pk_GS2U_BuyLimitedResult.result ),
	[
		<<?CMD_GS2U_BuyLimitedResult:16/little>>,
		Bin_result
	];

%GENERATED from file:player.h => GS2U_ChangeCamp
packNetMsg(#pk_GS2U_ChangeCamp{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_ChangeCamp.code ),
	Bin_camp = binary_write_uint( P#pk_GS2U_ChangeCamp.camp ),
	[
		<<?CMD_GS2U_ChangeCamp:16/little>>,
		Bin_code,
		Bin_camp
	];

%GENERATED from file:player.h => GS2U_ChangeCarrer
packNetMsg(#pk_GS2U_ChangeCarrer{} = P) ->
	Bin_result = binary_write_bool( P#pk_GS2U_ChangeCarrer.result ),
	Bin_newCareer = binary_write_uint( P#pk_GS2U_ChangeCarrer.newCareer ),
	[
		<<?CMD_GS2U_ChangeCarrer:16/little>>,
		Bin_result,
		Bin_newCareer
	];

%GENERATED from file:player.h => GS2U_ChangeNameResult
packNetMsg(#pk_GS2U_ChangeNameResult{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_ChangeNameResult.roleID ),
	Bin_name = binary_write_string( P#pk_GS2U_ChangeNameResult.name ),
	Bin_errorCode = binary_write_uint( P#pk_GS2U_ChangeNameResult.errorCode ),
	[
		<<?CMD_GS2U_ChangeNameResult:16/little>>,
		Bin_roleID,
		Bin_name,
		Bin_errorCode
	];

%GENERATED from file:player.h => GS2U_ChatErrorResult
packNetMsg(#pk_GS2U_ChatErrorResult{} = P) ->
	Bin_reason = binary_write_int( P#pk_GS2U_ChatErrorResult.reason ),
	[
		<<?CMD_GS2U_ChatErrorResult:16/little>>,
		Bin_reason
	];

%GENERATED from file:player.h => GS2U_Chatinfo
packNetMsg(#pk_GS2U_Chatinfo{} = P) ->
	Bin_channel = binary_write_int8( P#pk_GS2U_Chatinfo.channel ),
	Bin_senderID = binary_write_uint64( P#pk_GS2U_Chatinfo.senderID ),
	Bin_senderCode = binary_write_uint64( P#pk_GS2U_Chatinfo.senderCode ),
	Bin_senderName = binary_write_string( P#pk_GS2U_Chatinfo.senderName ),
	Bin_senderRace = binary_write_int8( P#pk_GS2U_Chatinfo.senderRace ),
	Bin_senderCareer = binary_write_uint( P#pk_GS2U_Chatinfo.senderCareer ),
	Bin_senderSex = binary_write_int8( P#pk_GS2U_Chatinfo.senderSex ),
	Bin_senderHead = binary_write_int( P#pk_GS2U_Chatinfo.senderHead ),
	Bin_senderLevel = binary_write_int16( P#pk_GS2U_Chatinfo.senderLevel ),
	Bin_senderVip = binary_write_int8( P#pk_GS2U_Chatinfo.senderVip ),
	Bin_content = binary_write_string( P#pk_GS2U_Chatinfo.content ),
	[
		<<?CMD_GS2U_Chatinfo:16/little>>,
		Bin_channel,
		Bin_senderID,
		Bin_senderCode,
		Bin_senderName,
		Bin_senderRace,
		Bin_senderCareer,
		Bin_senderSex,
		Bin_senderHead,
		Bin_senderLevel,
		Bin_senderVip,
		Bin_content
	];

%GENERATED from file:player.h => GS2U_ClearFightObject
packNetMsg(#pk_GS2U_ClearFightObject{} = P) ->
	Bin_objs = binary_write_array(P#pk_GS2U_ClearFightObject.objs, fun(X) -> binary_write_uint( X ) end),
	[
		<<?CMD_GS2U_ClearFightObject:16/little>>,
		Bin_objs
	];

%GENERATED from file:player.h => GS2U_CopyMapProcess
packNetMsg(#pk_GS2U_CopyMapProcess{} = P) ->
	Bin_curSchedule = binary_write_uint8( P#pk_GS2U_CopyMapProcess.curSchedule ),
	Bin_allSchedule = binary_write_uint8( P#pk_GS2U_CopyMapProcess.allSchedule ),
	Bin_scheduleList = binary_write_array(P#pk_GS2U_CopyMapProcess.scheduleList, fun(X) -> writeCopyObj( X ) end),
	[
		<<?CMD_GS2U_CopyMapProcess:16/little>>,
		Bin_curSchedule,
		Bin_allSchedule,
		Bin_scheduleList
	];

%GENERATED from file:player.h => GS2U_CopyMapProcessCurrentScheduleStatus
packNetMsg(#pk_GS2U_CopyMapProcessCurrentScheduleStatus{} = P) ->
	Bin_curSchedule = binary_write_uint8( P#pk_GS2U_CopyMapProcessCurrentScheduleStatus.curSchedule ),
	Bin_status = binary_write_uint8( P#pk_GS2U_CopyMapProcessCurrentScheduleStatus.status ),
	[
		<<?CMD_GS2U_CopyMapProcessCurrentScheduleStatus:16/little>>,
		Bin_curSchedule,
		Bin_status
	];

%GENERATED from file:player.h => GS2U_CopyMapProcessCurrentScheduleSurplusSecond
packNetMsg(#pk_GS2U_CopyMapProcessCurrentScheduleSurplusSecond{} = P) ->
	Bin_curSchedule = binary_write_uint8( P#pk_GS2U_CopyMapProcessCurrentScheduleSurplusSecond.curSchedule ),
	Bin_type = binary_write_uint8( P#pk_GS2U_CopyMapProcessCurrentScheduleSurplusSecond.type ),
	Bin_surplusSecond = binary_write_uint64( P#pk_GS2U_CopyMapProcessCurrentScheduleSurplusSecond.surplusSecond ),
	[
		<<?CMD_GS2U_CopyMapProcessCurrentScheduleSurplusSecond:16/little>>,
		Bin_curSchedule,
		Bin_type,
		Bin_surplusSecond
	];

%GENERATED from file:player.h => GS2U_CopyMapResult
packNetMsg(#pk_GS2U_CopyMapResult{} = P) ->
	Bin_copyMapID = binary_write_uint16( P#pk_GS2U_CopyMapResult.copyMapID ),
	Bin_second = binary_write_uint16( P#pk_GS2U_CopyMapResult.second ),
	Bin_goldReward = binary_write_uint( P#pk_GS2U_CopyMapResult.goldReward ),
	Bin_expReward = binary_write_uint( P#pk_GS2U_CopyMapResult.expReward ),
	Bin_isAssist = binary_write_bool( P#pk_GS2U_CopyMapResult.isAssist ),
	Bin_dropItems = binary_write_array(P#pk_GS2U_CopyMapResult.dropItems, fun(X) -> writeCopyMapDropItem( X ) end),
	[
		<<?CMD_GS2U_CopyMapResult:16/little>>,
		Bin_copyMapID,
		Bin_second,
		Bin_goldReward,
		Bin_expReward,
		Bin_isAssist,
		Bin_dropItems
	];

%GENERATED from file:player.h => GS2U_CopyMapStatHurtList
packNetMsg(#pk_GS2U_CopyMapStatHurtList{} = P) ->
	Bin_statList = binary_write_array(P#pk_GS2U_CopyMapStatHurtList.statList, fun(X) -> writeCopyMapStatHurt( X ) end),
	[
		<<?CMD_GS2U_CopyMapStatHurtList:16/little>>,
		Bin_statList
	];

%GENERATED from file:player.h => GS2U_CreatePlayerResult
packNetMsg(#pk_GS2U_CreatePlayerResult{} = P) ->
	Bin_errorCode = binary_write_int( P#pk_GS2U_CreatePlayerResult.errorCode ),
	Bin_roleID = binary_write_uint64( P#pk_GS2U_CreatePlayerResult.roleID ),
	[
		<<?CMD_GS2U_CreatePlayerResult:16/little>>,
		Bin_errorCode,
		Bin_roleID
	];

%GENERATED from file:player.h => GS2U_CrossNewPlayerCode
packNetMsg(#pk_GS2U_CrossNewPlayerCode{} = P) ->
	Bin_uint64 = binary_write_uint( P#pk_GS2U_CrossNewPlayerCode.uint64 ),
	[
		<<?CMD_GS2U_CrossNewPlayerCode:16/little>>,
		Bin_uint64
	];

%GENERATED from file:player.h => GS2U_CrossStep
packNetMsg(#pk_GS2U_CrossStep{} = P) ->
	Bin_index = binary_write_uint8( P#pk_GS2U_CrossStep.index ),
	[
		<<?CMD_GS2U_CrossStep:16/little>>,
		Bin_index
	];

%GENERATED from file:player.h => GS2U_DashTo
packNetMsg(#pk_GS2U_DashTo{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_DashTo.code ),
	Bin_posX = binary_write_float( P#pk_GS2U_DashTo.posX ),
	Bin_posY = binary_write_float( P#pk_GS2U_DashTo.posY ),
	[
		<<?CMD_GS2U_DashTo:16/little>>,
		Bin_code,
		Bin_posX,
		Bin_posY
	];

%GENERATED from file:player.h => GS2U_DeletePlayerResult
packNetMsg(#pk_GS2U_DeletePlayerResult{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_DeletePlayerResult.roleID ),
	Bin_errorCode = binary_write_int( P#pk_GS2U_DeletePlayerResult.errorCode ),
	[
		<<?CMD_GS2U_DeletePlayerResult:16/little>>,
		Bin_roleID,
		Bin_errorCode
	];

%GENERATED from file:player.h => GS2U_EqupmentCombinAck
packNetMsg(#pk_GS2U_EqupmentCombinAck{} = P) ->
	Bin_combinID = binary_write_uint( P#pk_GS2U_EqupmentCombinAck.combinID ),
	Bin_success = binary_write_bool( P#pk_GS2U_EqupmentCombinAck.success ),
	[
		<<?CMD_GS2U_EqupmentCombinAck:16/little>>,
		Bin_combinID,
		Bin_success
	];

%GENERATED from file:player.h => GS2U_Error
packNetMsg(#pk_GS2U_Error{} = P) ->
	Bin_errorCode = binary_write_uint( P#pk_GS2U_Error.errorCode ),
	Bin_params = binary_write_array(P#pk_GS2U_Error.params, fun(X) -> binary_write_string( X ) end),
	[
		<<?CMD_GS2U_Error:16/little>>,
		Bin_errorCode,
		Bin_params
	];

%GENERATED from file:player.h => GS2U_GetRewardUpdateResource
packNetMsg(#pk_GS2U_GetRewardUpdateResource{} = P) ->
	Bin_resultList = binary_write_array(P#pk_GS2U_GetRewardUpdateResource.resultList, fun(X) -> writeRewardUpdateResource( X ) end),
	[
		<<?CMD_GS2U_GetRewardUpdateResource:16/little>>,
		Bin_resultList
	];

%GENERATED from file:player.h => GS2U_HateInfo
packNetMsg(#pk_GS2U_HateInfo{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_HateInfo.code ),
	Bin_hateCode = binary_write_uint64( P#pk_GS2U_HateInfo.hateCode ),
	Bin_opreate = binary_write_int8( P#pk_GS2U_HateInfo.opreate ),
	[
		<<?CMD_GS2U_HateInfo:16/little>>,
		Bin_code,
		Bin_hateCode,
		Bin_opreate
	];

%GENERATED from file:player.h => GS2U_HaveIconAndActionList
packNetMsg(#pk_GS2U_HaveIconAndActionList{} = P) ->
	Bin_icons = binary_write_array(P#pk_GS2U_HaveIconAndActionList.icons, fun(X) -> binary_write_uint( X ) end),
	Bin_actions = binary_write_array(P#pk_GS2U_HaveIconAndActionList.actions, fun(X) -> binary_write_uint( X ) end),
	[
		<<?CMD_GS2U_HaveIconAndActionList:16/little>>,
		Bin_icons,
		Bin_actions
	];

%GENERATED from file:player.h => GS2U_HeartBeatAck
packNetMsg(#pk_GS2U_HeartBeatAck{} = P) ->
	Bin_time = binary_write_uint( P#pk_GS2U_HeartBeatAck.time ),
	Bin_version = binary_write_uint( P#pk_GS2U_HeartBeatAck.version ),
	[
		<<?CMD_GS2U_HeartBeatAck:16/little>>,
		Bin_time,
		Bin_version
	];

%GENERATED from file:player.h => GS2U_InvateEnterCopyMap
packNetMsg(#pk_GS2U_InvateEnterCopyMap{} = P) ->
	Bin_copyMapID = binary_write_uint16( P#pk_GS2U_InvateEnterCopyMap.copyMapID ),
	[
		<<?CMD_GS2U_InvateEnterCopyMap:16/little>>,
		Bin_copyMapID
	];

%GENERATED from file:player.h => GS2U_KickOutTip
packNetMsg(#pk_GS2U_KickOutTip{} = P) ->
	Bin_type = binary_write_int8( P#pk_GS2U_KickOutTip.type ),
	[
		<<?CMD_GS2U_KickOutTip:16/little>>,
		Bin_type
	];

%GENERATED from file:player.h => GS2U_KillPlayerResponse
packNetMsg(#pk_GS2U_KillPlayerResponse{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_KillPlayerResponse.code ),
	[
		<<?CMD_GS2U_KillPlayerResponse:16/little>>,
		Bin_code
	];

%GENERATED from file:player.h => GS2U_KillValueResponse
packNetMsg(#pk_GS2U_KillValueResponse{} = P) ->
	Bin_killValue = binary_write_uint16( P#pk_GS2U_KillValueResponse.killValue ),
	[
		<<?CMD_GS2U_KillValueResponse:16/little>>,
		Bin_killValue
	];

%GENERATED from file:player.h => GS2U_LoginResult
packNetMsg(#pk_GS2U_LoginResult{} = P) ->
	Bin_result = binary_write_int( P#pk_GS2U_LoginResult.result ),
	[
		<<?CMD_GS2U_LoginResult:16/little>>,
		Bin_result
	];

%GENERATED from file:player.h => GS2U_LookInfoPlayer
packNetMsg(#pk_GS2U_LookInfoPlayer{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_LookInfoPlayer.code ),
	Bin_roleID = binary_write_uint64( P#pk_GS2U_LookInfoPlayer.roleID ),
	Bin_name = binary_write_string( P#pk_GS2U_LookInfoPlayer.name ),
	Bin_x = binary_write_float( P#pk_GS2U_LookInfoPlayer.x ),
	Bin_y = binary_write_float( P#pk_GS2U_LookInfoPlayer.y ),
	Bin_race = binary_write_int8( P#pk_GS2U_LookInfoPlayer.race ),
	Bin_career = binary_write_uint( P#pk_GS2U_LookInfoPlayer.career ),
	Bin_sex = binary_write_int8( P#pk_GS2U_LookInfoPlayer.sex ),
	Bin_camp = binary_write_int8( P#pk_GS2U_LookInfoPlayer.camp ),
	Bin_head = binary_write_int( P#pk_GS2U_LookInfoPlayer.head ),
	Bin_move_speed = binary_write_float( P#pk_GS2U_LookInfoPlayer.move_speed ),
	Bin_level = binary_write_int16( P#pk_GS2U_LookInfoPlayer.level ),
	Bin_hp_per = binary_write_uint8( P#pk_GS2U_LookInfoPlayer.hp_per ),
	Bin_petID = binary_write_uint16( P#pk_GS2U_LookInfoPlayer.petID ),
	Bin_otherCode = binary_write_uint64( P#pk_GS2U_LookInfoPlayer.otherCode ),
	Bin_servername = binary_write_string( P#pk_GS2U_LookInfoPlayer.servername ),
	Bin_myServerName = binary_write_string( P#pk_GS2U_LookInfoPlayer.myServerName ),
	Bin_isInCross = binary_write_bool( P#pk_GS2U_LookInfoPlayer.isInCross ),
	Bin_pkMode = binary_write_uint8( P#pk_GS2U_LookInfoPlayer.pkMode ),
	Bin_pet_list = binary_write_array(P#pk_GS2U_LookInfoPlayer.pet_list, fun(X) -> binary_write_uint64( X ) end),
	Bin_move_list = binary_write_array(P#pk_GS2U_LookInfoPlayer.move_list, fun(X) -> writePosInfo( X ) end),
	Bin_buffs = binary_write_array(P#pk_GS2U_LookInfoPlayer.buffs, fun(X) -> writeBuffBaseInfo( X ) end),
	Bin_visible_equips = binary_write_array(P#pk_GS2U_LookInfoPlayer.visible_equips, fun(X) -> writevisibleEquip( X ) end),
	Bin_refine_levels = binary_write_array(P#pk_GS2U_LookInfoPlayer.refine_levels, fun(X) -> writerefineLevel( X ) end),
	[
		<<?CMD_GS2U_LookInfoPlayer:16/little>>,
		Bin_code,
		Bin_roleID,
		Bin_name,
		Bin_x,
		Bin_y,
		Bin_race,
		Bin_career,
		Bin_sex,
		Bin_camp,
		Bin_head,
		Bin_move_speed,
		Bin_level,
		Bin_hp_per,
		Bin_petID,
		Bin_otherCode,
		Bin_servername,
		Bin_myServerName,
		Bin_isInCross,
		Bin_pkMode,
		Bin_pet_list,
		Bin_move_list,
		Bin_buffs,
		Bin_visible_equips,
		Bin_refine_levels
	];

%GENERATED from file:player.h => GS2U_LotteryForTowerBeginTimeEndTime
packNetMsg(#pk_GS2U_LotteryForTowerBeginTimeEndTime{} = P) ->
	Bin_beginTime = binary_write_uint( P#pk_GS2U_LotteryForTowerBeginTimeEndTime.beginTime ),
	Bin_endTime = binary_write_uint( P#pk_GS2U_LotteryForTowerBeginTimeEndTime.endTime ),
	[
		<<?CMD_GS2U_LotteryForTowerBeginTimeEndTime:16/little>>,
		Bin_beginTime,
		Bin_endTime
	];

%GENERATED from file:player.h => GS2U_LotteryForTowerInfo
packNetMsg(#pk_GS2U_LotteryForTowerInfo{} = P) ->
	Bin_current_cfg_id = binary_write_int16( P#pk_GS2U_LotteryForTowerInfo.current_cfg_id ),
	Bin_endTime = binary_write_uint( P#pk_GS2U_LotteryForTowerInfo.endTime ),
	Bin_oneTimeCost = binary_write_uint( P#pk_GS2U_LotteryForTowerInfo.oneTimeCost ),
	Bin_tenTimeCost = binary_write_uint( P#pk_GS2U_LotteryForTowerInfo.tenTimeCost ),
	Bin_fiftyTimeCost = binary_write_uint( P#pk_GS2U_LotteryForTowerInfo.fiftyTimeCost ),
	Bin_itemList = binary_write_array(P#pk_GS2U_LotteryForTowerInfo.itemList, fun(X) -> writelotteryForToweItem( X ) end),
	Bin_noticeList = binary_write_array(P#pk_GS2U_LotteryForTowerInfo.noticeList, fun(X) -> writelotteryForTowerNotice( X ) end),
	[
		<<?CMD_GS2U_LotteryForTowerInfo:16/little>>,
		Bin_current_cfg_id,
		Bin_endTime,
		Bin_oneTimeCost,
		Bin_tenTimeCost,
		Bin_fiftyTimeCost,
		Bin_itemList,
		Bin_noticeList
	];

%GENERATED from file:player.h => GS2U_LotteryForTowerRandonAward
packNetMsg(#pk_GS2U_LotteryForTowerRandonAward{} = P) ->
	Bin_current_cfg_id = binary_write_int16( P#pk_GS2U_LotteryForTowerRandonAward.current_cfg_id ),
	Bin_noticeList = binary_write_array(P#pk_GS2U_LotteryForTowerRandonAward.noticeList, fun(X) -> writelotteryForTowerNotice( X ) end),
	Bin_reward_cfg_id_list = binary_write_array(P#pk_GS2U_LotteryForTowerRandonAward.reward_cfg_id_list, fun(X) -> binary_write_int16( X ) end),
	[
		<<?CMD_GS2U_LotteryForTowerRandonAward:16/little>>,
		Bin_current_cfg_id,
		Bin_noticeList,
		Bin_reward_cfg_id_list
	];

%GENERATED from file:player.h => GS2U_MapLevel
packNetMsg(#pk_GS2U_MapLevel{} = P) ->
	Bin_level = binary_write_uint( P#pk_GS2U_MapLevel.level ),
	[
		<<?CMD_GS2U_MapLevel:16/little>>,
		Bin_level
	];

%GENERATED from file:player.h => GS2U_MaterialCopyMapResult
packNetMsg(#pk_GS2U_MaterialCopyMapResult{} = P) ->
	Bin_copyMapID = binary_write_uint16( P#pk_GS2U_MaterialCopyMapResult.copyMapID ),
	Bin_score = binary_write_uint16( P#pk_GS2U_MaterialCopyMapResult.score ),
	Bin_state = binary_write_uint16( P#pk_GS2U_MaterialCopyMapResult.state ),
	Bin_goldReward = binary_write_uint( P#pk_GS2U_MaterialCopyMapResult.goldReward ),
	Bin_expReward = binary_write_uint( P#pk_GS2U_MaterialCopyMapResult.expReward ),
	Bin_maxChapter = binary_write_uint16( P#pk_GS2U_MaterialCopyMapResult.maxChapter ),
	Bin_finishChapter = binary_write_uint16( P#pk_GS2U_MaterialCopyMapResult.finishChapter ),
	Bin_isAssist = binary_write_bool( P#pk_GS2U_MaterialCopyMapResult.isAssist ),
	Bin_dropItems = binary_write_array(P#pk_GS2U_MaterialCopyMapResult.dropItems, fun(X) -> writeCopyMapDropItem( X ) end),
	[
		<<?CMD_GS2U_MaterialCopyMapResult:16/little>>,
		Bin_copyMapID,
		Bin_score,
		Bin_state,
		Bin_goldReward,
		Bin_expReward,
		Bin_maxChapter,
		Bin_finishChapter,
		Bin_isAssist,
		Bin_dropItems
	];

%GENERATED from file:player.h => GS2U_MissionObjectList
packNetMsg(#pk_GS2U_MissionObjectList{} = P) ->
	Bin_missionObj_list = binary_write_array(P#pk_GS2U_MissionObjectList.missionObj_list, fun(X) -> writeMissionObjectInfo( X ) end),
	[
		<<?CMD_GS2U_MissionObjectList:16/little>>,
		Bin_missionObj_list
	];

%GENERATED from file:player.h => GS2U_MoneyChanges
packNetMsg(#pk_GS2U_MoneyChanges{} = P) ->
	Bin_changes = binary_write_array(P#pk_GS2U_MoneyChanges.changes, fun(X) -> writeMoneyChanges( X ) end),
	[
		<<?CMD_GS2U_MoneyChanges:16/little>>,
		Bin_changes
	];

%GENERATED from file:player.h => GS2U_MoneyDungeonCopyMapResult
packNetMsg(#pk_GS2U_MoneyDungeonCopyMapResult{} = P) ->
	Bin_copyMapID = binary_write_uint16( P#pk_GS2U_MoneyDungeonCopyMapResult.copyMapID ),
	Bin_score = binary_write_uint16( P#pk_GS2U_MoneyDungeonCopyMapResult.score ),
	Bin_maxChapter = binary_write_uint16( P#pk_GS2U_MoneyDungeonCopyMapResult.maxChapter ),
	Bin_finishChapter = binary_write_uint16( P#pk_GS2U_MoneyDungeonCopyMapResult.finishChapter ),
	Bin_listMonsterID = binary_write_array(P#pk_GS2U_MoneyDungeonCopyMapResult.listMonsterID, fun(X) -> binary_write_uint16( X ) end),
	Bin_listMonsterCountKill = binary_write_array(P#pk_GS2U_MoneyDungeonCopyMapResult.listMonsterCountKill, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_GS2U_MoneyDungeonCopyMapResult:16/little>>,
		Bin_copyMapID,
		Bin_score,
		Bin_maxChapter,
		Bin_finishChapter,
		Bin_listMonsterID,
		Bin_listMonsterCountKill
	];

%GENERATED from file:player.h => GS2U_MoneyTreeAck
packNetMsg(#pk_GS2U_MoneyTreeAck{} = P) ->
	Bin_totalMoney = binary_write_uint( P#pk_GS2U_MoneyTreeAck.totalMoney ),
	Bin_boxMoney = binary_write_uint( P#pk_GS2U_MoneyTreeAck.boxMoney ),
	Bin_rate = binary_write_uint16( P#pk_GS2U_MoneyTreeAck.rate ),
	[
		<<?CMD_GS2U_MoneyTreeAck:16/little>>,
		Bin_totalMoney,
		Bin_boxMoney,
		Bin_rate
	];

%GENERATED from file:player.h => GS2U_MoneyTreeBox
packNetMsg(#pk_GS2U_MoneyTreeBox{} = P) ->
	Bin_totalMoney = binary_write_uint( P#pk_GS2U_MoneyTreeBox.totalMoney ),
	Bin_rate = binary_write_uint16( P#pk_GS2U_MoneyTreeBox.rate ),
	[
		<<?CMD_GS2U_MoneyTreeBox:16/little>>,
		Bin_totalMoney,
		Bin_rate
	];

%GENERATED from file:player.h => GS2U_MonsterBookNeed_Sync
packNetMsg(#pk_GS2U_MonsterBookNeed_Sync{} = P) ->
	Bin_listUnlockID = binary_write_array(P#pk_GS2U_MonsterBookNeed_Sync.listUnlockID, fun(X) -> binary_write_uint16( X ) end),
	Bin_listRewardID = binary_write_array(P#pk_GS2U_MonsterBookNeed_Sync.listRewardID, fun(X) -> binary_write_uint16( X ) end),
	[
		<<?CMD_GS2U_MonsterBookNeed_Sync:16/little>>,
		Bin_listUnlockID,
		Bin_listRewardID
	];

%GENERATED from file:player.h => GS2U_MonsterBookReward_Ack
packNetMsg(#pk_GS2U_MonsterBookReward_Ack{} = P) ->
	Bin_id = binary_write_uint16( P#pk_GS2U_MonsterBookReward_Ack.id ),
	[
		<<?CMD_GS2U_MonsterBookReward_Ack:16/little>>,
		Bin_id
	];

%GENERATED from file:player.h => GS2U_MonsterBookSnap_Ack
packNetMsg(#pk_GS2U_MonsterBookSnap_Ack{} = P) ->
	Bin_id = binary_write_uint16( P#pk_GS2U_MonsterBookSnap_Ack.id ),
	[
		<<?CMD_GS2U_MonsterBookSnap_Ack:16/little>>,
		Bin_id
	];

%GENERATED from file:player.h => GS2U_MonsterBookUnlock_Ack
packNetMsg(#pk_GS2U_MonsterBookUnlock_Ack{} = P) ->
	Bin_id = binary_write_uint16( P#pk_GS2U_MonsterBookUnlock_Ack.id ),
	[
		<<?CMD_GS2U_MonsterBookUnlock_Ack:16/little>>,
		Bin_id
	];

%GENERATED from file:player.h => GS2U_MonsterBook_Ack
packNetMsg(#pk_GS2U_MonsterBook_Ack{} = P) ->
	Bin_listMapID = binary_write_array(P#pk_GS2U_MonsterBook_Ack.listMapID, fun(X) -> binary_write_uint16( X ) end),
	Bin_listMonster = binary_write_array(P#pk_GS2U_MonsterBook_Ack.listMonster, fun(X) -> writeMonsterBook( X ) end),
	[
		<<?CMD_GS2U_MonsterBook_Ack:16/little>>,
		Bin_listMapID,
		Bin_listMonster
	];

%GENERATED from file:player.h => GS2U_MonsterList
packNetMsg(#pk_GS2U_MonsterList{} = P) ->
	Bin_monster_list = binary_write_array(P#pk_GS2U_MonsterList.monster_list, fun(X) -> writeLookInfoMonster( X ) end),
	[
		<<?CMD_GS2U_MonsterList:16/little>>,
		Bin_monster_list
	];

%GENERATED from file:player.h => GS2U_MonthCardEndTips
packNetMsg(#pk_GS2U_MonthCardEndTips{} = P) ->
	Bin_remainDays = binary_write_uint8( P#pk_GS2U_MonthCardEndTips.remainDays ),
	[
		<<?CMD_GS2U_MonthCardEndTips:16/little>>,
		Bin_remainDays
	];

%GENERATED from file:player.h => GS2U_MoveInfo
packNetMsg(#pk_GS2U_MoveInfo{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_MoveInfo.code ),
	Bin_posX = binary_write_float( P#pk_GS2U_MoveInfo.posX ),
	Bin_posY = binary_write_float( P#pk_GS2U_MoveInfo.posY ),
	Bin_posInfos = binary_write_array(P#pk_GS2U_MoveInfo.posInfos, fun(X) -> writePosInfo( X ) end),
	[
		<<?CMD_GS2U_MoveInfo:16/little>>,
		Bin_code,
		Bin_posX,
		Bin_posY,
		Bin_posInfos
	];

%GENERATED from file:player.h => GS2U_MsgBoxTips
packNetMsg(#pk_GS2U_MsgBoxTips{} = P) ->
	Bin_code = binary_write_int( P#pk_GS2U_MsgBoxTips.code ),
	Bin_msg = binary_write_string( P#pk_GS2U_MsgBoxTips.msg ),
	[
		<<?CMD_GS2U_MsgBoxTips:16/little>>,
		Bin_code,
		Bin_msg
	];

%GENERATED from file:player.h => GS2U_NeedForSpeedCollideRoadBox
packNetMsg(#pk_GS2U_NeedForSpeedCollideRoadBox{} = P) ->
	Bin_collideItemID = binary_write_uint64( P#pk_GS2U_NeedForSpeedCollideRoadBox.collideItemID ),
	[
		<<?CMD_GS2U_NeedForSpeedCollideRoadBox:16/little>>,
		Bin_collideItemID
	];

%GENERATED from file:player.h => GS2U_NeedForSpeedColliderBoxIDList
packNetMsg(#pk_GS2U_NeedForSpeedColliderBoxIDList{} = P) ->
	Bin_boxIdList = binary_write_array(P#pk_GS2U_NeedForSpeedColliderBoxIDList.boxIdList, fun(X) -> binary_write_uint16( X ) end),
	[
		<<?CMD_GS2U_NeedForSpeedColliderBoxIDList:16/little>>,
		Bin_boxIdList
	];

%GENERATED from file:player.h => GS2U_NeedForSpeedCompletionEndInfoList
packNetMsg(#pk_GS2U_NeedForSpeedCompletionEndInfoList{} = P) ->
	Bin_firstRoleNames = binary_write_array(P#pk_GS2U_NeedForSpeedCompletionEndInfoList.firstRoleNames, fun(X) -> binary_write_string( X ) end),
	Bin_secondRoleNames = binary_write_array(P#pk_GS2U_NeedForSpeedCompletionEndInfoList.secondRoleNames, fun(X) -> binary_write_string( X ) end),
	Bin_thirdRoleNames = binary_write_array(P#pk_GS2U_NeedForSpeedCompletionEndInfoList.thirdRoleNames, fun(X) -> binary_write_string( X ) end),
	Bin_selfIndex = binary_write_uint8( P#pk_GS2U_NeedForSpeedCompletionEndInfoList.selfIndex ),
	[
		<<?CMD_GS2U_NeedForSpeedCompletionEndInfoList:16/little>>,
		Bin_firstRoleNames,
		Bin_secondRoleNames,
		Bin_thirdRoleNames,
		Bin_selfIndex
	];

%GENERATED from file:player.h => GS2U_NeedForSpeedCompletionInfoList
packNetMsg(#pk_GS2U_NeedForSpeedCompletionInfoList{} = P) ->
	Bin_lastTime = binary_write_uint16( P#pk_GS2U_NeedForSpeedCompletionInfoList.lastTime ),
	Bin_currentCircle = binary_write_uint8( P#pk_GS2U_NeedForSpeedCompletionInfoList.currentCircle ),
	Bin_selfIndex = binary_write_uint8( P#pk_GS2U_NeedForSpeedCompletionInfoList.selfIndex ),
	Bin_firstRoleName = binary_write_string( P#pk_GS2U_NeedForSpeedCompletionInfoList.firstRoleName ),
	Bin_firstIsWin = binary_write_bool( P#pk_GS2U_NeedForSpeedCompletionInfoList.firstIsWin ),
	Bin_completionState = binary_write_uint8( P#pk_GS2U_NeedForSpeedCompletionInfoList.completionState ),
	[
		<<?CMD_GS2U_NeedForSpeedCompletionInfoList:16/little>>,
		Bin_lastTime,
		Bin_currentCircle,
		Bin_selfIndex,
		Bin_firstRoleName,
		Bin_firstIsWin,
		Bin_completionState
	];

%GENERATED from file:player.h => GS2U_NeedForSpeedMatchInfo
packNetMsg(#pk_GS2U_NeedForSpeedMatchInfo{} = P) ->
	Bin_currentPlayerNumber = binary_write_uint16( P#pk_GS2U_NeedForSpeedMatchInfo.currentPlayerNumber ),
	Bin_countdownSec = binary_write_uint16( P#pk_GS2U_NeedForSpeedMatchInfo.countdownSec ),
	[
		<<?CMD_GS2U_NeedForSpeedMatchInfo:16/little>>,
		Bin_currentPlayerNumber,
		Bin_countdownSec
	];

%GENERATED from file:player.h => GS2U_NeedForSpeedUseItem
packNetMsg(#pk_GS2U_NeedForSpeedUseItem{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_NeedForSpeedUseItem.roleID ),
	Bin_itemID = binary_write_uint64( P#pk_GS2U_NeedForSpeedUseItem.itemID ),
	[
		<<?CMD_GS2U_NeedForSpeedUseItem:16/little>>,
		Bin_roleID,
		Bin_itemID
	];

%GENERATED from file:player.h => GS2U_NoticeAdd
packNetMsg(#pk_GS2U_NoticeAdd{} = P) ->
	Bin_notice = binary_write_array(P#pk_GS2U_NoticeAdd.notice, fun(X) -> writeNoticeInfo( X ) end),
	[
		<<?CMD_GS2U_NoticeAdd:16/little>>,
		Bin_notice
	];

%GENERATED from file:player.h => GS2U_NoticeDel
packNetMsg(#pk_GS2U_NoticeDel{} = P) ->
	Bin_id = binary_write_array(P#pk_GS2U_NoticeDel.id, fun(X) -> binary_write_int64( X ) end),
	[
		<<?CMD_GS2U_NoticeDel:16/little>>,
		Bin_id
	];

%GENERATED from file:player.h => GS2U_NoticeResponse
packNetMsg(#pk_GS2U_NoticeResponse{} = P) ->
	Bin_result = binary_write_int8( P#pk_GS2U_NoticeResponse.result ),
	Bin_noticeList = binary_write_array(P#pk_GS2U_NoticeResponse.noticeList, fun(X) -> writeNoticeInfo( X ) end),
	[
		<<?CMD_GS2U_NoticeResponse:16/little>>,
		Bin_result,
		Bin_noticeList
	];

%GENERATED from file:player.h => GS2U_NpcList
packNetMsg(#pk_GS2U_NpcList{} = P) ->
	Bin_npc_list = binary_write_array(P#pk_GS2U_NpcList.npc_list, fun(X) -> writeLookInfoNpc( X ) end),
	[
		<<?CMD_GS2U_NpcList:16/little>>,
		Bin_npc_list
	];

%GENERATED from file:player.h => GS2U_NpcStatusChange
packNetMsg(#pk_GS2U_NpcStatusChange{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_NpcStatusChange.code ),
	Bin_actionStatus = binary_write_uint( P#pk_GS2U_NpcStatusChange.actionStatus ),
	[
		<<?CMD_GS2U_NpcStatusChange:16/little>>,
		Bin_code,
		Bin_actionStatus
	];

%GENERATED from file:player.h => GS2U_ObjBrief
packNetMsg(#pk_GS2U_ObjBrief{} = P) ->
	Bin_obj_type = binary_write_int8( P#pk_GS2U_ObjBrief.obj_type ),
	Bin_objs = binary_write_array(P#pk_GS2U_ObjBrief.objs, fun(X) -> writeObjBrief( X ) end),
	[
		<<?CMD_GS2U_ObjBrief:16/little>>,
		Bin_obj_type,
		Bin_objs
	];

%GENERATED from file:player.h => GS2U_PetList
packNetMsg(#pk_GS2U_PetList{} = P) ->
	Bin_pet_list = binary_write_array(P#pk_GS2U_PetList.pet_list, fun(X) -> writeLookInfoPet( X ) end),
	[
		<<?CMD_GS2U_PetList:16/little>>,
		Bin_pet_list
	];

%GENERATED from file:player.h => GS2U_PlayerAddExp
packNetMsg(#pk_GS2U_PlayerAddExp{} = P) ->
	Bin_curExp = binary_write_uint( P#pk_GS2U_PlayerAddExp.curExp ),
	Bin_addExp = binary_write_int( P#pk_GS2U_PlayerAddExp.addExp ),
	[
		<<?CMD_GS2U_PlayerAddExp:16/little>>,
		Bin_curExp,
		Bin_addExp
	];

%GENERATED from file:player.h => GS2U_PlayerAwakenInfo
packNetMsg(#pk_GS2U_PlayerAwakenInfo{} = P) ->
	Bin_type = binary_write_int8( P#pk_GS2U_PlayerAwakenInfo.type ),
	Bin_awakenLevel = binary_write_int8( P#pk_GS2U_PlayerAwakenInfo.awakenLevel ),
	Bin_itemNum = binary_write_uint16( P#pk_GS2U_PlayerAwakenInfo.itemNum ),
	[
		<<?CMD_GS2U_PlayerAwakenInfo:16/little>>,
		Bin_type,
		Bin_awakenLevel,
		Bin_itemNum
	];

%GENERATED from file:player.h => GS2U_PlayerBaseInfo
packNetMsg(#pk_GS2U_PlayerBaseInfo{} = P) ->
	Bin_baseInfo = writeRoleBaseInfo( P#pk_GS2U_PlayerBaseInfo.baseInfo ),
	[
		<<?CMD_GS2U_PlayerBaseInfo:16/little>>,
		Bin_baseInfo
	];

%GENERATED from file:player.h => GS2U_PlayerBlood
packNetMsg(#pk_GS2U_PlayerBlood{} = P) ->
	Bin_blood = binary_write_uint( P#pk_GS2U_PlayerBlood.blood ),
	[
		<<?CMD_GS2U_PlayerBlood:16/little>>,
		Bin_blood
	];

%GENERATED from file:player.h => GS2U_PlayerChangedWealth
packNetMsg(#pk_GS2U_PlayerChangedWealth{} = P) ->
	Bin_type = binary_write_uint( P#pk_GS2U_PlayerChangedWealth.type ),
	Bin_wealth = binary_write_uint( P#pk_GS2U_PlayerChangedWealth.wealth ),
	Bin_reason = binary_write_uint16( P#pk_GS2U_PlayerChangedWealth.reason ),
	[
		<<?CMD_GS2U_PlayerChangedWealth:16/little>>,
		Bin_type,
		Bin_wealth,
		Bin_reason
	];

%GENERATED from file:player.h => GS2U_PlayerCour
packNetMsg(#pk_GS2U_PlayerCour{} = P) ->
	Bin_cour = binary_write_uint( P#pk_GS2U_PlayerCour.cour ),
	[
		<<?CMD_GS2U_PlayerCour:16/little>>,
		Bin_cour
	];

%GENERATED from file:player.h => GS2U_PlayerDead
packNetMsg(#pk_GS2U_PlayerDead{} = P) ->
	Bin_deadTime = binary_write_uint64( P#pk_GS2U_PlayerDead.deadTime ),
	Bin_code = binary_write_uint64( P#pk_GS2U_PlayerDead.code ),
	Bin_normalReviveCDTime = binary_write_uint( P#pk_GS2U_PlayerDead.normalReviveCDTime ),
	Bin_reviveCost = writeMoneyInit( P#pk_GS2U_PlayerDead.reviveCost ),
	Bin_attackCode = binary_write_uint64( P#pk_GS2U_PlayerDead.attackCode ),
	Bin_attackName = binary_write_string( P#pk_GS2U_PlayerDead.attackName ),
	Bin_lostMoney = binary_write_array(P#pk_GS2U_PlayerDead.lostMoney, fun(X) -> writeMoneyInit( X ) end),
	Bin_reviveType = binary_write_uint( P#pk_GS2U_PlayerDead.reviveType ),
	[
		<<?CMD_GS2U_PlayerDead:16/little>>,
		Bin_deadTime,
		Bin_code,
		Bin_normalReviveCDTime,
		Bin_reviveCost,
		Bin_attackCode,
		Bin_attackName,
		Bin_lostMoney,
		Bin_reviveType
	];

%GENERATED from file:player.h => GS2U_PlayerHp
packNetMsg(#pk_GS2U_PlayerHp{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_PlayerHp.code ),
	Bin_hp = binary_write_uint( P#pk_GS2U_PlayerHp.hp ),
	[
		<<?CMD_GS2U_PlayerHp:16/little>>,
		Bin_code,
		Bin_hp
	];

%GENERATED from file:player.h => GS2U_PlayerInitEnd
packNetMsg(#pk_GS2U_PlayerInitEnd{}) ->
	[
		<<?CMD_GS2U_PlayerInitEnd:16/little>>

	];

%GENERATED from file:player.h => GS2U_PlayerLevelUp
packNetMsg(#pk_GS2U_PlayerLevelUp{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_PlayerLevelUp.code ),
	Bin_curExp = binary_write_uint( P#pk_GS2U_PlayerLevelUp.curExp ),
	Bin_maxExp = binary_write_uint( P#pk_GS2U_PlayerLevelUp.maxExp ),
	Bin_addExp = binary_write_uint( P#pk_GS2U_PlayerLevelUp.addExp ),
	Bin_level = binary_write_uint8( P#pk_GS2U_PlayerLevelUp.level ),
	[
		<<?CMD_GS2U_PlayerLevelUp:16/little>>,
		Bin_code,
		Bin_curExp,
		Bin_maxExp,
		Bin_addExp,
		Bin_level
	];

%GENERATED from file:player.h => GS2U_PlayerPhys
packNetMsg(#pk_GS2U_PlayerPhys{} = P) ->
	Bin_phys = binary_write_uint( P#pk_GS2U_PlayerPhys.phys ),
	[
		<<?CMD_GS2U_PlayerPhys:16/little>>,
		Bin_phys
	];

%GENERATED from file:player.h => GS2U_PlayerRevive
packNetMsg(#pk_GS2U_PlayerRevive{} = P) ->
	Bin_mapId = binary_write_uint16( P#pk_GS2U_PlayerRevive.mapId ),
	Bin_x = binary_write_float( P#pk_GS2U_PlayerRevive.x ),
	Bin_y = binary_write_float( P#pk_GS2U_PlayerRevive.y ),
	Bin_curHp = binary_write_uint( P#pk_GS2U_PlayerRevive.curHp ),
	Bin_maxHp = binary_write_uint( P#pk_GS2U_PlayerRevive.maxHp ),
	Bin_curPower = binary_write_uint( P#pk_GS2U_PlayerRevive.curPower ),
	Bin_curPhys = binary_write_uint( P#pk_GS2U_PlayerRevive.curPhys ),
	[
		<<?CMD_GS2U_PlayerRevive:16/little>>,
		Bin_mapId,
		Bin_x,
		Bin_y,
		Bin_curHp,
		Bin_maxHp,
		Bin_curPower,
		Bin_curPhys
	];

%GENERATED from file:player.h => GS2U_PlayerSp
packNetMsg(#pk_GS2U_PlayerSp{} = P) ->
	Bin_sp = binary_write_uint( P#pk_GS2U_PlayerSp.sp ),
	[
		<<?CMD_GS2U_PlayerSp:16/little>>,
		Bin_sp
	];

%GENERATED from file:player.h => GS2U_PlotDialogue
packNetMsg(#pk_GS2U_PlotDialogue{} = P) ->
	Bin_id = binary_write_uint( P#pk_GS2U_PlotDialogue.id ),
	[
		<<?CMD_GS2U_PlotDialogue:16/little>>,
		Bin_id
	];

%GENERATED from file:player.h => GS2U_PropSync
packNetMsg(#pk_GS2U_PropSync{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_PropSync.code ),
	Bin_ints = binary_write_array(P#pk_GS2U_PropSync.ints, fun(X) -> writePropInt( X ) end),
	Bin_int64s = binary_write_array(P#pk_GS2U_PropSync.int64s, fun(X) -> writePropInt64( X ) end),
	Bin_floats = binary_write_array(P#pk_GS2U_PropSync.floats, fun(X) -> writePropFloat( X ) end),
	Bin_strs = binary_write_array(P#pk_GS2U_PropSync.strs, fun(X) -> writePropString( X ) end),
	[
		<<?CMD_GS2U_PropSync:16/little>>,
		Bin_code,
		Bin_ints,
		Bin_int64s,
		Bin_floats,
		Bin_strs
	];

%GENERATED from file:player.h => GS2U_PushInfo
packNetMsg(#pk_GS2U_PushInfo{} = P) ->
	Bin_items = binary_write_array(P#pk_GS2U_PushInfo.items, fun(X) -> writepushItem( X ) end),
	Bin_startTime = binary_write_uint( P#pk_GS2U_PushInfo.startTime ),
	Bin_endTime = binary_write_uint( P#pk_GS2U_PushInfo.endTime ),
	[
		<<?CMD_GS2U_PushInfo:16/little>>,
		Bin_items,
		Bin_startTime,
		Bin_endTime
	];

%GENERATED from file:player.h => GS2U_RaceApplyInfo_Sync
packNetMsg(#pk_GS2U_RaceApplyInfo_Sync{} = P) ->
	Bin_info = writeRaceTeamBase( P#pk_GS2U_RaceApplyInfo_Sync.info ),
	[
		<<?CMD_GS2U_RaceApplyInfo_Sync:16/little>>,
		Bin_info
	];

%GENERATED from file:player.h => GS2U_RaceApply_Ack
packNetMsg(#pk_GS2U_RaceApply_Ack{} = P) ->
	Bin_info = writeRaceTeamBase( P#pk_GS2U_RaceApply_Ack.info ),
	[
		<<?CMD_GS2U_RaceApply_Ack:16/little>>,
		Bin_info
	];

%GENERATED from file:player.h => GS2U_RaceCancel_Ack
packNetMsg(#pk_GS2U_RaceCancel_Ack{} = P) ->
	Bin_role = writeCrossRoleBase( P#pk_GS2U_RaceCancel_Ack.role ),
	[
		<<?CMD_GS2U_RaceCancel_Ack:16/little>>,
		Bin_role
	];

%GENERATED from file:player.h => GS2U_RaceMapGiveUp_Sync
packNetMsg(#pk_GS2U_RaceMapGiveUp_Sync{} = P) ->
	Bin_isComplete = binary_write_bool( P#pk_GS2U_RaceMapGiveUp_Sync.isComplete ),
	Bin_reason = binary_write_uint8( P#pk_GS2U_RaceMapGiveUp_Sync.reason ),
	Bin_role = writeCrossRoleBase( P#pk_GS2U_RaceMapGiveUp_Sync.role ),
	[
		<<?CMD_GS2U_RaceMapGiveUp_Sync:16/little>>,
		Bin_isComplete,
		Bin_reason,
		Bin_role
	];

%GENERATED from file:player.h => GS2U_RaceMapItem_Sync
packNetMsg(#pk_GS2U_RaceMapItem_Sync{} = P) ->
	Bin_applyID = binary_write_uint64( P#pk_GS2U_RaceMapItem_Sync.applyID ),
	Bin_roleID = binary_write_uint64( P#pk_GS2U_RaceMapItem_Sync.roleID ),
	Bin_getOrUse = binary_write_bool( P#pk_GS2U_RaceMapItem_Sync.getOrUse ),
	Bin_itemID = binary_write_uint8( P#pk_GS2U_RaceMapItem_Sync.itemID ),
	Bin_item = writeRaceTeamItem( P#pk_GS2U_RaceMapItem_Sync.item ),
	[
		<<?CMD_GS2U_RaceMapItem_Sync:16/little>>,
		Bin_applyID,
		Bin_roleID,
		Bin_getOrUse,
		Bin_itemID,
		Bin_item
	];

%GENERATED from file:player.h => GS2U_RaceMapMilestone_Sync
packNetMsg(#pk_GS2U_RaceMapMilestone_Sync{} = P) ->
	Bin_applyID = binary_write_uint64( P#pk_GS2U_RaceMapMilestone_Sync.applyID ),
	Bin_sort = writeRaceTeamSort( P#pk_GS2U_RaceMapMilestone_Sync.sort ),
	[
		<<?CMD_GS2U_RaceMapMilestone_Sync:16/little>>,
		Bin_applyID,
		Bin_sort
	];

%GENERATED from file:player.h => GS2U_RaceMapState_Sync
packNetMsg(#pk_GS2U_RaceMapState_Sync{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_RaceMapState_Sync.type ),
	Bin_state = binary_write_uint8( P#pk_GS2U_RaceMapState_Sync.state ),
	Bin_sec = binary_write_uint16( P#pk_GS2U_RaceMapState_Sync.sec ),
	Bin_info = binary_write_array(P#pk_GS2U_RaceMapState_Sync.info, fun(X) -> writeRaceTeamEx( X ) end),
	[
		<<?CMD_GS2U_RaceMapState_Sync:16/little>>,
		Bin_type,
		Bin_state,
		Bin_sec,
		Bin_info
	];

%GENERATED from file:player.h => GS2U_RaceType_Sync
packNetMsg(#pk_GS2U_RaceType_Sync{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_RaceType_Sync.type ),
	[
		<<?CMD_GS2U_RaceType_Sync:16/little>>,
		Bin_type
	];

%GENERATED from file:player.h => GS2U_ReceivePlayerLevelRewardResult
packNetMsg(#pk_GS2U_ReceivePlayerLevelRewardResult{} = P) ->
	Bin_level = binary_write_uint8( P#pk_GS2U_ReceivePlayerLevelRewardResult.level ),
	[
		<<?CMD_GS2U_ReceivePlayerLevelRewardResult:16/little>>,
		Bin_level
	];

%GENERATED from file:player.h => GS2U_ReconnectLoginRequestFail
packNetMsg(#pk_GS2U_ReconnectLoginRequestFail{}) ->
	[
		<<?CMD_GS2U_ReconnectLoginRequestFail:16/little>>

	];

%GENERATED from file:player.h => GS2U_RequestAutoDealAck
packNetMsg(#pk_GS2U_RequestAutoDealAck{} = P) ->
	Bin_isSuccess = binary_write_bool( P#pk_GS2U_RequestAutoDealAck.isSuccess ),
	Bin_copyMapID = binary_write_uint16( P#pk_GS2U_RequestAutoDealAck.copyMapID ),
	Bin_coinReward = binary_write_array(P#pk_GS2U_RequestAutoDealAck.coinReward, fun(X) -> writeCoinData( X ) end),
	Bin_expReward = binary_write_uint64( P#pk_GS2U_RequestAutoDealAck.expReward ),
	Bin_dropItems = binary_write_array(P#pk_GS2U_RequestAutoDealAck.dropItems, fun(X) -> writeCopyMapDropItem( X ) end),
	[
		<<?CMD_GS2U_RequestAutoDealAck:16/little>>,
		Bin_isSuccess,
		Bin_copyMapID,
		Bin_coinReward,
		Bin_expReward,
		Bin_dropItems
	];

%GENERATED from file:player.h => GS2U_RequestGoddessCodeAck
packNetMsg(#pk_GS2U_RequestGoddessCodeAck{} = P) ->
	Bin_goddessCode = binary_write_uint64( P#pk_GS2U_RequestGoddessCodeAck.goddessCode ),
	[
		<<?CMD_GS2U_RequestGoddessCodeAck:16/little>>,
		Bin_goddessCode
	];

%GENERATED from file:player.h => GS2U_RequestRechargeAck
packNetMsg(#pk_GS2U_RequestRechargeAck{} = P) ->
	Bin_funcellOrderID = binary_write_string( P#pk_GS2U_RequestRechargeAck.funcellOrderID ),
	Bin_moneyNun = binary_write_float( P#pk_GS2U_RequestRechargeAck.moneyNun ),
	[
		<<?CMD_GS2U_RequestRechargeAck:16/little>>,
		Bin_funcellOrderID,
		Bin_moneyNun
	];

%GENERATED from file:player.h => GS2U_RequestRechargeHasGiftIDListAck
packNetMsg(#pk_GS2U_RequestRechargeHasGiftIDListAck{} = P) ->
	Bin_takenIDList = binary_write_array(P#pk_GS2U_RequestRechargeHasGiftIDListAck.takenIDList, fun(X) -> binary_write_uint( X ) end),
	Bin_confIDList = binary_write_array(P#pk_GS2U_RequestRechargeHasGiftIDListAck.confIDList, fun(X) -> writeRechargeDoubleConf( X ) end),
	[
		<<?CMD_GS2U_RequestRechargeHasGiftIDListAck:16/little>>,
		Bin_takenIDList,
		Bin_confIDList
	];

%GENERATED from file:player.h => GS2U_RequestTargetCopyMapScore
packNetMsg(#pk_GS2U_RequestTargetCopyMapScore{} = P) ->
	Bin_targetCopyMapID = binary_write_uint( P#pk_GS2U_RequestTargetCopyMapScore.targetCopyMapID ),
	Bin_highestScore = binary_write_uint( P#pk_GS2U_RequestTargetCopyMapScore.highestScore ),
	[
		<<?CMD_GS2U_RequestTargetCopyMapScore:16/little>>,
		Bin_targetCopyMapID,
		Bin_highestScore
	];

%GENERATED from file:player.h => GS2U_ResetCopyMap
packNetMsg(#pk_GS2U_ResetCopyMap{} = P) ->
	Bin_copyMapID = binary_write_uint16( P#pk_GS2U_ResetCopyMap.copyMapID ),
	[
		<<?CMD_GS2U_ResetCopyMap:16/little>>,
		Bin_copyMapID
	];

%GENERATED from file:player.h => GS2U_RespChatVoice
packNetMsg(#pk_GS2U_RespChatVoice{} = P) ->
	Bin_count = binary_write_uint8( P#pk_GS2U_RespChatVoice.count ),
	Bin_index = binary_write_uint8( P#pk_GS2U_RespChatVoice.index ),
	Bin_playerCode = binary_write_uint64( P#pk_GS2U_RespChatVoice.playerCode ),
	Bin_key = binary_write_uint( P#pk_GS2U_RespChatVoice.key ),
	Bin_data = binary_write_array(P#pk_GS2U_RespChatVoice.data, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_GS2U_RespChatVoice:16/little>>,
		Bin_count,
		Bin_index,
		Bin_playerCode,
		Bin_key,
		Bin_data
	];

%GENERATED from file:player.h => GS2U_RespChatVoiceError
packNetMsg(#pk_GS2U_RespChatVoiceError{} = P) ->
	Bin_playerCode = binary_write_uint64( P#pk_GS2U_RespChatVoiceError.playerCode ),
	Bin_key = binary_write_uint( P#pk_GS2U_RespChatVoiceError.key ),
	Bin_errorCode = binary_write_uint8( P#pk_GS2U_RespChatVoiceError.errorCode ),
	[
		<<?CMD_GS2U_RespChatVoiceError:16/little>>,
		Bin_playerCode,
		Bin_key,
		Bin_errorCode
	];

%GENERATED from file:player.h => GS2U_SelPlayerResult
packNetMsg(#pk_GS2U_SelPlayerResult{} = P) ->
	Bin_result = binary_write_int( P#pk_GS2U_SelPlayerResult.result ),
	[
		<<?CMD_GS2U_SelPlayerResult:16/little>>,
		Bin_result
	];

%GENERATED from file:player.h => GS2U_SendGiftNotice
packNetMsg(#pk_GS2U_SendGiftNotice{} = P) ->
	Bin_ids = binary_write_array(P#pk_GS2U_SendGiftNotice.ids, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_GS2U_SendGiftNotice:16/little>>,
		Bin_ids
	];

%GENERATED from file:player.h => GS2U_SendPlayerDailyCountList
packNetMsg(#pk_GS2U_SendPlayerDailyCountList{} = P) ->
	Bin_playerDailyCountList = binary_write_array(P#pk_GS2U_SendPlayerDailyCountList.playerDailyCountList, fun(X) -> writePlayerDailyCount( X ) end),
	[
		<<?CMD_GS2U_SendPlayerDailyCountList:16/little>>,
		Bin_playerDailyCountList
	];

%GENERATED from file:player.h => GS2U_SessionKey
packNetMsg(#pk_GS2U_SessionKey{} = P) ->
	Bin_key = binary_write_string( P#pk_GS2U_SessionKey.key ),
	[
		<<?CMD_GS2U_SessionKey:16/little>>,
		Bin_key
	];

%GENERATED from file:player.h => GS2U_SetUpAnchor
packNetMsg(#pk_GS2U_SetUpAnchor{} = P) ->
	Bin_args = binary_write_array(P#pk_GS2U_SetUpAnchor.args, fun(X) -> binary_write_int64( X ) end),
	[
		<<?CMD_GS2U_SetUpAnchor:16/little>>,
		Bin_args
	];

%GENERATED from file:player.h => GS2U_SevenDayAimReward_Ack
packNetMsg(#pk_GS2U_SevenDayAimReward_Ack{} = P) ->
	Bin_id = binary_write_uint16( P#pk_GS2U_SevenDayAimReward_Ack.id ),
	[
		<<?CMD_GS2U_SevenDayAimReward_Ack:16/little>>,
		Bin_id
	];

%GENERATED from file:player.h => GS2U_SevenDayAimState_Sync
packNetMsg(#pk_GS2U_SevenDayAimState_Sync{} = P) ->
	Bin_timeBegin = binary_write_uint( P#pk_GS2U_SevenDayAimState_Sync.timeBegin ),
	Bin_conditions = binary_write_array(P#pk_GS2U_SevenDayAimState_Sync.conditions, fun(X) -> writeSevenDayAimUpdate( X ) end),
	Bin_alreadyReward = binary_write_array(P#pk_GS2U_SevenDayAimState_Sync.alreadyReward, fun(X) -> binary_write_uint16( X ) end),
	[
		<<?CMD_GS2U_SevenDayAimState_Sync:16/little>>,
		Bin_timeBegin,
		Bin_conditions,
		Bin_alreadyReward
	];

%GENERATED from file:player.h => GS2U_SevenDayAimUpdate_Sync
packNetMsg(#pk_GS2U_SevenDayAimUpdate_Sync{} = P) ->
	Bin_type = binary_write_int( P#pk_GS2U_SevenDayAimUpdate_Sync.type ),
	Bin_args = binary_write_array(P#pk_GS2U_SevenDayAimUpdate_Sync.args, fun(X) -> binary_write_int64( X ) end),
	[
		<<?CMD_GS2U_SevenDayAimUpdate_Sync:16/little>>,
		Bin_type,
		Bin_args
	];

%GENERATED from file:player.h => GS2U_ShiftTo
packNetMsg(#pk_GS2U_ShiftTo{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_ShiftTo.code ),
	Bin_posX = binary_write_float( P#pk_GS2U_ShiftTo.posX ),
	Bin_posY = binary_write_float( P#pk_GS2U_ShiftTo.posY ),
	[
		<<?CMD_GS2U_ShiftTo:16/little>>,
		Bin_code,
		Bin_posX,
		Bin_posY
	];

%GENERATED from file:player.h => GS2U_ShowAction
packNetMsg(#pk_GS2U_ShowAction{} = P) ->
	Bin_playerCode = binary_write_uint64( P#pk_GS2U_ShowAction.playerCode ),
	Bin_actionIndex = binary_write_uint( P#pk_GS2U_ShowAction.actionIndex ),
	[
		<<?CMD_GS2U_ShowAction:16/little>>,
		Bin_playerCode,
		Bin_actionIndex
	];

%GENERATED from file:player.h => GS2U_SpecificEvent_Sync
packNetMsg(#pk_GS2U_SpecificEvent_Sync{} = P) ->
	Bin_eventID = binary_write_uint( P#pk_GS2U_SpecificEvent_Sync.eventID ),
	Bin_initOrSettle = binary_write_bool( P#pk_GS2U_SpecificEvent_Sync.initOrSettle ),
	Bin_scheduleID = binary_write_uint( P#pk_GS2U_SpecificEvent_Sync.scheduleID ),
	[
		<<?CMD_GS2U_SpecificEvent_Sync:16/little>>,
		Bin_eventID,
		Bin_initOrSettle,
		Bin_scheduleID
	];

%GENERATED from file:player.h => GS2U_StopMove
packNetMsg(#pk_GS2U_StopMove{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_StopMove.code ),
	Bin_posX = binary_write_float( P#pk_GS2U_StopMove.posX ),
	Bin_posY = binary_write_float( P#pk_GS2U_StopMove.posY ),
	[
		<<?CMD_GS2U_StopMove:16/little>>,
		Bin_code,
		Bin_posX,
		Bin_posY
	];

%GENERATED from file:player.h => GS2U_SyncServerTime
packNetMsg(#pk_GS2U_SyncServerTime{} = P) ->
	Bin_time = binary_write_uint( P#pk_GS2U_SyncServerTime.time ),
	[
		<<?CMD_GS2U_SyncServerTime:16/little>>,
		Bin_time
	];

%GENERATED from file:player.h => GS2U_TaskUseItemList
packNetMsg(#pk_GS2U_TaskUseItemList{} = P) ->
	Bin_useItemlist = binary_write_array(P#pk_GS2U_TaskUseItemList.useItemlist, fun(X) -> writeTaskUseItem( X ) end),
	[
		<<?CMD_GS2U_TaskUseItemList:16/little>>,
		Bin_useItemlist
	];

%GENERATED from file:player.h => GS2U_ThirtyDayLoginGiftState_Sync
packNetMsg(#pk_GS2U_ThirtyDayLoginGiftState_Sync{} = P) ->
	Bin_timeBegin = binary_write_uint( P#pk_GS2U_ThirtyDayLoginGiftState_Sync.timeBegin ),
	Bin_alreadyReward = binary_write_uint16( P#pk_GS2U_ThirtyDayLoginGiftState_Sync.alreadyReward ),
	[
		<<?CMD_GS2U_ThirtyDayLoginGiftState_Sync:16/little>>,
		Bin_timeBegin,
		Bin_alreadyReward
	];

%GENERATED from file:player.h => GS2U_ThirtyDayLoginGift_Ack
packNetMsg(#pk_GS2U_ThirtyDayLoginGift_Ack{} = P) ->
	Bin_id = binary_write_uint16( P#pk_GS2U_ThirtyDayLoginGift_Ack.id ),
	[
		<<?CMD_GS2U_ThirtyDayLoginGift_Ack:16/little>>,
		Bin_id
	];

%GENERATED from file:player.h => GS2U_TipsError
packNetMsg(#pk_GS2U_TipsError{} = P) ->
	Bin_errorCode = binary_write_uint( P#pk_GS2U_TipsError.errorCode ),
	[
		<<?CMD_GS2U_TipsError:16/little>>,
		Bin_errorCode
	];

%GENERATED from file:player.h => GS2U_TipsString
packNetMsg(#pk_GS2U_TipsString{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_TipsString.type ),
	Bin_tips = binary_write_string( P#pk_GS2U_TipsString.tips ),
	Bin_params = binary_write_array(P#pk_GS2U_TipsString.params, fun(X) -> binary_write_string( X ) end),
	[
		<<?CMD_GS2U_TipsString:16/little>>,
		Bin_type,
		Bin_tips,
		Bin_params
	];

%GENERATED from file:player.h => GS2U_TransferNewPos
packNetMsg(#pk_GS2U_TransferNewPos{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_TransferNewPos.code ),
	Bin_pos = writePosInfo( P#pk_GS2U_TransferNewPos.pos ),
	[
		<<?CMD_GS2U_TransferNewPos:16/little>>,
		Bin_code,
		Bin_pos
	];

%GENERATED from file:player.h => GS2U_UserPlayerList
packNetMsg(#pk_GS2U_UserPlayerList{} = P) ->
	Bin_unlockNewRace = binary_write_int( P#pk_GS2U_UserPlayerList.unlockNewRace ),
	Bin_info = binary_write_array(P#pk_GS2U_UserPlayerList.info, fun(X) -> writeUserPlayerData( X ) end),
	[
		<<?CMD_GS2U_UserPlayerList:16/little>>,
		Bin_unlockNewRace,
		Bin_info
	];

%GENERATED from file:player.h => GS2U_WingRise
packNetMsg(#pk_GS2U_WingRise{} = P) ->
	Bin_itemID = binary_write_uint( P#pk_GS2U_WingRise.itemID ),
	Bin_expChange = binary_write_int( P#pk_GS2U_WingRise.expChange ),
	[
		<<?CMD_GS2U_WingRise:16/little>>,
		Bin_itemID,
		Bin_expChange
	];

%GENERATED from file:player.h => GS2U_WorldBossBuyBuff
packNetMsg(#pk_GS2U_WorldBossBuyBuff{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_WorldBossBuyBuff.type ),
	[
		<<?CMD_GS2U_WorldBossBuyBuff:16/little>>,
		Bin_type
	];

%GENERATED from file:player.h => GS2U_XmlNoticeResponse
packNetMsg(#pk_GS2U_XmlNoticeResponse{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_XmlNoticeResponse.type ),
	Bin_ret = binary_write_uint8( P#pk_GS2U_XmlNoticeResponse.ret ),
	Bin_content = binary_write_string( P#pk_GS2U_XmlNoticeResponse.content ),
	Bin_sign = binary_write_string( P#pk_GS2U_XmlNoticeResponse.sign ),
	[
		<<?CMD_GS2U_XmlNoticeResponse:16/little>>,
		Bin_type,
		Bin_ret,
		Bin_content,
		Bin_sign
	];

%GENERATED from file:player.h => GS2U_action_point_info
packNetMsg(#pk_GS2U_action_point_info{} = P) ->
	Bin_value = binary_write_uint( P#pk_GS2U_action_point_info.value ),
	Bin_lastUpdateUtcTime = binary_write_uint( P#pk_GS2U_action_point_info.lastUpdateUtcTime ),
	[
		<<?CMD_GS2U_action_point_info:16/little>>,
		Bin_value,
		Bin_lastUpdateUtcTime
	];

%GENERATED from file:player.h => GS2U_copy_map_destory_time
packNetMsg(#pk_GS2U_copy_map_destory_time{} = P) ->
	Bin_copyMapID = binary_write_uint( P#pk_GS2U_copy_map_destory_time.copyMapID ),
	Bin_destoryTime = binary_write_uint64( P#pk_GS2U_copy_map_destory_time.destoryTime ),
	Bin_waitTime = binary_write_uint64( P#pk_GS2U_copy_map_destory_time.waitTime ),
	[
		<<?CMD_GS2U_copy_map_destory_time:16/little>>,
		Bin_copyMapID,
		Bin_destoryTime,
		Bin_waitTime
	];

%GENERATED from file:player.h => GS2U_lottery_award_items
packNetMsg(#pk_GS2U_lottery_award_items{} = P) ->
	Bin_award_item_list = binary_write_array(P#pk_GS2U_lottery_award_items.award_item_list, fun(X) -> writelottery_award_item_info( X ) end),
	Bin_award_item_list_sp = binary_write_array(P#pk_GS2U_lottery_award_items.award_item_list_sp, fun(X) -> writelottery_award_item_info( X ) end),
	[
		<<?CMD_GS2U_lottery_award_items:16/little>>,
		Bin_award_item_list,
		Bin_award_item_list_sp
	];

%GENERATED from file:player.h => GS2U_lottery_sys_info
packNetMsg(#pk_GS2U_lottery_sys_info{} = P) ->
	Bin_goblin_lottery_last_free_times = binary_write_int16( P#pk_GS2U_lottery_sys_info.goblin_lottery_last_free_times ),
	Bin_goblin_lottery_free_cd = binary_write_uint( P#pk_GS2U_lottery_sys_info.goblin_lottery_free_cd ),
	Bin_treasure_lottery_last_free_times = binary_write_uint( P#pk_GS2U_lottery_sys_info.treasure_lottery_last_free_times ),
	Bin_treasure_lottery_free_cd = binary_write_uint( P#pk_GS2U_lottery_sys_info.treasure_lottery_free_cd ),
	[
		<<?CMD_GS2U_lottery_sys_info:16/little>>,
		Bin_goblin_lottery_last_free_times,
		Bin_goblin_lottery_free_cd,
		Bin_treasure_lottery_last_free_times,
		Bin_treasure_lottery_free_cd
	];

%GENERATED from file:player.h => GS2U_lsbattlefield_award_list
packNetMsg(#pk_GS2U_lsbattlefield_award_list{} = P) ->
	Bin_index = binary_write_uint( P#pk_GS2U_lsbattlefield_award_list.index ),
	Bin_award_list = binary_write_array(P#pk_GS2U_lsbattlefield_award_list.award_list, fun(X) -> writelsbattlefield_award( X ) end),
	Bin_coinType = binary_write_uint( P#pk_GS2U_lsbattlefield_award_list.coinType ),
	Bin_coinValue = binary_write_uint( P#pk_GS2U_lsbattlefield_award_list.coinValue ),
	[
		<<?CMD_GS2U_lsbattlefield_award_list:16/little>>,
		Bin_index,
		Bin_award_list,
		Bin_coinType,
		Bin_coinValue
	];

%GENERATED from file:player.h => GS2U_lsbattlefield_rank_list
packNetMsg(#pk_GS2U_lsbattlefield_rank_list{} = P) ->
	Bin_rank_list = binary_write_array(P#pk_GS2U_lsbattlefield_rank_list.rank_list, fun(X) -> writelsbattlefield_rank( X ) end),
	[
		<<?CMD_GS2U_lsbattlefield_rank_list:16/little>>,
		Bin_rank_list
	];

%GENERATED from file:player.h => GS2U_monsterChange
packNetMsg(#pk_GS2U_monsterChange{} = P) ->
	Bin_number = binary_write_uint( P#pk_GS2U_monsterChange.number ),
	[
		<<?CMD_GS2U_monsterChange:16/little>>,
		Bin_number
	];

%GENERATED from file:player.h => GS2U_returnFriendPos
packNetMsg(#pk_GS2U_returnFriendPos{} = P) ->
	Bin_mapID = binary_write_uint( P#pk_GS2U_returnFriendPos.mapID ),
	Bin_x = binary_write_float( P#pk_GS2U_returnFriendPos.x ),
	Bin_y = binary_write_float( P#pk_GS2U_returnFriendPos.y ),
	[
		<<?CMD_GS2U_returnFriendPos:16/little>>,
		Bin_mapID,
		Bin_x,
		Bin_y
	];

%GENERATED from file:player.h => GS2U_synch_lsbattlefield_state
packNetMsg(#pk_GS2U_synch_lsbattlefield_state{} = P) ->
	Bin_state = binary_write_uint( P#pk_GS2U_synch_lsbattlefield_state.state ),
	[
		<<?CMD_GS2U_synch_lsbattlefield_state:16/little>>,
		Bin_state
	];

%GENERATED from file:player.h => GetPlayerOnlineReward
packNetMsg(#pk_GetPlayerOnlineReward{} = P) ->
	Bin_timeID = binary_write_uint( P#pk_GetPlayerOnlineReward.timeID ),
	[
		<<?CMD_GetPlayerOnlineReward:16/little>>,
		Bin_timeID
	];

%GENERATED from file:player.h => PlayerLevelReward
packNetMsg(#pk_PlayerLevelReward{} = P) ->
	Bin_receiveRewardLevel = binary_write_array(P#pk_PlayerLevelReward.receiveRewardLevel, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_PlayerLevelReward:16/little>>,
		Bin_receiveRewardLevel
	];

%GENERATED from file:player.h => U2GS_AcceptHolidayTask
packNetMsg(#pk_U2GS_AcceptHolidayTask{}) ->
	[
		<<?CMD_U2GS_AcceptHolidayTask:16/little>>

	];

%GENERATED from file:player.h => U2GS_ActiveCodeRequest
packNetMsg(#pk_U2GS_ActiveCodeRequest{} = P) ->
	Bin_code = binary_write_string( P#pk_U2GS_ActiveCodeRequest.code ),
	[
		<<?CMD_U2GS_ActiveCodeRequest:16/little>>,
		Bin_code
	];

%GENERATED from file:player.h => U2GS_Buy4System
packNetMsg(#pk_U2GS_Buy4System{} = P) ->
	Bin_costID = binary_write_uint( P#pk_U2GS_Buy4System.costID ),
	Bin_number = binary_write_uint( P#pk_U2GS_Buy4System.number ),
	[
		<<?CMD_U2GS_Buy4System:16/little>>,
		Bin_costID,
		Bin_number
	];

%GENERATED from file:player.h => U2GS_BuyLimitSales
packNetMsg(#pk_U2GS_BuyLimitSales{} = P) ->
	Bin_sku = binary_write_uint( P#pk_U2GS_BuyLimitSales.sku ),
	[
		<<?CMD_U2GS_BuyLimitSales:16/little>>,
		Bin_sku
	];

%GENERATED from file:player.h => U2GS_ChangeCarrer
packNetMsg(#pk_U2GS_ChangeCarrer{} = P) ->
	Bin_newCareer = binary_write_uint( P#pk_U2GS_ChangeCarrer.newCareer ),
	[
		<<?CMD_U2GS_ChangeCarrer:16/little>>,
		Bin_newCareer
	];

%GENERATED from file:player.h => U2GS_ChangeLineLoginRequest
packNetMsg(#pk_U2GS_ChangeLineLoginRequest{} = P) ->
	Bin_accountID = binary_write_uint64( P#pk_U2GS_ChangeLineLoginRequest.accountID ),
	Bin_roleID = binary_write_uint64( P#pk_U2GS_ChangeLineLoginRequest.roleID ),
	Bin_key = binary_write_string( P#pk_U2GS_ChangeLineLoginRequest.key ),
	Bin_protocolVer = binary_write_int( P#pk_U2GS_ChangeLineLoginRequest.protocolVer ),
	[
		<<?CMD_U2GS_ChangeLineLoginRequest:16/little>>,
		Bin_accountID,
		Bin_roleID,
		Bin_key,
		Bin_protocolVer
	];

%GENERATED from file:player.h => U2GS_ChangeLineRequest
packNetMsg(#pk_U2GS_ChangeLineRequest{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_ChangeLineRequest.type ),
	[
		<<?CMD_U2GS_ChangeLineRequest:16/little>>,
		Bin_type
	];

%GENERATED from file:player.h => U2GS_ChangeLineRequestAck
packNetMsg(#pk_U2GS_ChangeLineRequestAck{} = P) ->
	Bin_yes = binary_write_uint8( P#pk_U2GS_ChangeLineRequestAck.yes ),
	[
		<<?CMD_U2GS_ChangeLineRequestAck:16/little>>,
		Bin_yes
	];

%GENERATED from file:player.h => U2GS_ChangeName
packNetMsg(#pk_U2GS_ChangeName{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_ChangeName.roleID ),
	Bin_name = binary_write_string( P#pk_U2GS_ChangeName.name ),
	[
		<<?CMD_U2GS_ChangeName:16/little>>,
		Bin_roleID,
		Bin_name
	];

%GENERATED from file:player.h => U2GS_ChangeWingLevel
packNetMsg(#pk_U2GS_ChangeWingLevel{} = P) ->
	Bin_level = binary_write_uint( P#pk_U2GS_ChangeWingLevel.level ),
	[
		<<?CMD_U2GS_ChangeWingLevel:16/little>>,
		Bin_level
	];

%GENERATED from file:player.h => U2GS_ChatInfo
packNetMsg(#pk_U2GS_ChatInfo{} = P) ->
	Bin_channel = binary_write_int8( P#pk_U2GS_ChatInfo.channel ),
	Bin_receiverID = binary_write_uint64( P#pk_U2GS_ChatInfo.receiverID ),
	Bin_receiverName = binary_write_string( P#pk_U2GS_ChatInfo.receiverName ),
	Bin_content = binary_write_string( P#pk_U2GS_ChatInfo.content ),
	[
		<<?CMD_U2GS_ChatInfo:16/little>>,
		Bin_channel,
		Bin_receiverID,
		Bin_receiverName,
		Bin_content
	];

%GENERATED from file:player.h => U2GS_ChatVoice
packNetMsg(#pk_U2GS_ChatVoice{} = P) ->
	Bin_count = binary_write_uint8( P#pk_U2GS_ChatVoice.count ),
	Bin_index = binary_write_uint8( P#pk_U2GS_ChatVoice.index ),
	Bin_playerCode = binary_write_uint64( P#pk_U2GS_ChatVoice.playerCode ),
	Bin_key = binary_write_uint( P#pk_U2GS_ChatVoice.key ),
	Bin_data = binary_write_array(P#pk_U2GS_ChatVoice.data, fun(X) -> binary_write_uint8( X ) end),
	[
		<<?CMD_U2GS_ChatVoice:16/little>>,
		Bin_count,
		Bin_index,
		Bin_playerCode,
		Bin_key,
		Bin_data
	];

%GENERATED from file:player.h => U2GS_CommonditiesPush
packNetMsg(#pk_U2GS_CommonditiesPush{}) ->
	[
		<<?CMD_U2GS_CommonditiesPush:16/little>>

	];

%GENERATED from file:player.h => U2GS_CopyChat
packNetMsg(#pk_U2GS_CopyChat{}) ->
	[
		<<?CMD_U2GS_CopyChat:16/little>>

	];

%GENERATED from file:player.h => U2GS_DashTo
packNetMsg(#pk_U2GS_DashTo{} = P) ->
	Bin_posX = binary_write_float( P#pk_U2GS_DashTo.posX ),
	Bin_posY = binary_write_float( P#pk_U2GS_DashTo.posY ),
	[
		<<?CMD_U2GS_DashTo:16/little>>,
		Bin_posX,
		Bin_posY
	];

%GENERATED from file:player.h => U2GS_DigTransferMap
packNetMsg(#pk_U2GS_DigTransferMap{} = P) ->
	Bin_mapId = binary_write_uint( P#pk_U2GS_DigTransferMap.mapId ),
	Bin_waypointName = binary_write_string( P#pk_U2GS_DigTransferMap.waypointName ),
	[
		<<?CMD_U2GS_DigTransferMap:16/little>>,
		Bin_mapId,
		Bin_waypointName
	];

%GENERATED from file:player.h => U2GS_EnterActiveMap
packNetMsg(#pk_U2GS_EnterActiveMap{} = P) ->
	Bin_npcCode = binary_write_uint64( P#pk_U2GS_EnterActiveMap.npcCode ),
	Bin_activeID = binary_write_uint16( P#pk_U2GS_EnterActiveMap.activeID ),
	[
		<<?CMD_U2GS_EnterActiveMap:16/little>>,
		Bin_npcCode,
		Bin_activeID
	];

%GENERATED from file:player.h => U2GS_EnterCopyMap
packNetMsg(#pk_U2GS_EnterCopyMap{} = P) ->
	Bin_copyMapID = binary_write_uint16( P#pk_U2GS_EnterCopyMap.copyMapID ),
	[
		<<?CMD_U2GS_EnterCopyMap:16/little>>,
		Bin_copyMapID
	];

%GENERATED from file:player.h => U2GS_EnteredMap
packNetMsg(#pk_U2GS_EnteredMap{}) ->
	[
		<<?CMD_U2GS_EnteredMap:16/little>>

	];

%GENERATED from file:player.h => U2GS_EqupmentCombin
packNetMsg(#pk_U2GS_EqupmentCombin{} = P) ->
	Bin_combinID = binary_write_uint( P#pk_U2GS_EqupmentCombin.combinID ),
	Bin_equpmentUIDList = binary_write_array(P#pk_U2GS_EqupmentCombin.equpmentUIDList, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_U2GS_EqupmentCombin:16/little>>,
		Bin_combinID,
		Bin_equpmentUIDList
	];

%GENERATED from file:player.h => U2GS_GetLeavedExp
packNetMsg(#pk_U2GS_GetLeavedExp{} = P) ->
	Bin_getType = binary_write_uint8( P#pk_U2GS_GetLeavedExp.getType ),
	[
		<<?CMD_U2GS_GetLeavedExp:16/little>>,
		Bin_getType
	];

%GENERATED from file:player.h => U2GS_GetMapLevel
packNetMsg(#pk_U2GS_GetMapLevel{}) ->
	[
		<<?CMD_U2GS_GetMapLevel:16/little>>

	];

%GENERATED from file:player.h => U2GS_GetUpdateReward
packNetMsg(#pk_U2GS_GetUpdateReward{} = P) ->
	Bin_count = binary_write_uint8( P#pk_U2GS_GetUpdateReward.count ),
	[
		<<?CMD_U2GS_GetUpdateReward:16/little>>,
		Bin_count
	];

%GENERATED from file:player.h => U2GS_GetVipReward
packNetMsg(#pk_U2GS_GetVipReward{} = P) ->
	Bin_vipLevel = binary_write_int16( P#pk_U2GS_GetVipReward.vipLevel ),
	[
		<<?CMD_U2GS_GetVipReward:16/little>>,
		Bin_vipLevel
	];

%GENERATED from file:player.h => U2GS_GoToExpMap
packNetMsg(#pk_U2GS_GoToExpMap{}) ->
	[
		<<?CMD_U2GS_GoToExpMap:16/little>>

	];

%GENERATED from file:player.h => U2GS_HeartBeat
packNetMsg(#pk_U2GS_HeartBeat{} = P) ->
	Bin_time = binary_write_uint( P#pk_U2GS_HeartBeat.time ),
	Bin_version = binary_write_uint( P#pk_U2GS_HeartBeat.version ),
	[
		<<?CMD_U2GS_HeartBeat:16/little>>,
		Bin_time,
		Bin_version
	];

%GENERATED from file:player.h => U2GS_HeartBeatReal
packNetMsg(#pk_U2GS_HeartBeatReal{} = P) ->
	Bin_time = binary_write_uint( P#pk_U2GS_HeartBeatReal.time ),
	[
		<<?CMD_U2GS_HeartBeatReal:16/little>>,
		Bin_time
	];

%GENERATED from file:player.h => U2GS_Join_lsbattlefield
packNetMsg(#pk_U2GS_Join_lsbattlefield{}) ->
	[
		<<?CMD_U2GS_Join_lsbattlefield:16/little>>

	];

%GENERATED from file:player.h => U2GS_KillValueRequest
packNetMsg(#pk_U2GS_KillValueRequest{}) ->
	[
		<<?CMD_U2GS_KillValueRequest:16/little>>

	];

%GENERATED from file:player.h => U2GS_LeaveCopyMap
packNetMsg(#pk_U2GS_LeaveCopyMap{} = P) ->
	Bin_type = binary_write_uint16( P#pk_U2GS_LeaveCopyMap.type ),
	[
		<<?CMD_U2GS_LeaveCopyMap:16/little>>,
		Bin_type
	];

%GENERATED from file:player.h => U2GS_LoadedMap
packNetMsg(#pk_U2GS_LoadedMap{}) ->
	[
		<<?CMD_U2GS_LoadedMap:16/little>>

	];

%GENERATED from file:player.h => U2GS_LotteryForTowerInfo
packNetMsg(#pk_U2GS_LotteryForTowerInfo{}) ->
	[
		<<?CMD_U2GS_LotteryForTowerInfo:16/little>>

	];

%GENERATED from file:player.h => U2GS_LotteryForTowerRandonAward
packNetMsg(#pk_U2GS_LotteryForTowerRandonAward{} = P) ->
	Bin_randomNumber = binary_write_uint( P#pk_U2GS_LotteryForTowerRandonAward.randomNumber ),
	Bin_isShowPanel = binary_write_bool( P#pk_U2GS_LotteryForTowerRandonAward.isShowPanel ),
	[
		<<?CMD_U2GS_LotteryForTowerRandonAward:16/little>>,
		Bin_randomNumber,
		Bin_isShowPanel
	];

%GENERATED from file:player.h => U2GS_MoneyTree
packNetMsg(#pk_U2GS_MoneyTree{}) ->
	[
		<<?CMD_U2GS_MoneyTree:16/little>>

	];

%GENERATED from file:player.h => U2GS_MonsterBookReward_Request
packNetMsg(#pk_U2GS_MonsterBookReward_Request{} = P) ->
	Bin_id = binary_write_uint16( P#pk_U2GS_MonsterBookReward_Request.id ),
	[
		<<?CMD_U2GS_MonsterBookReward_Request:16/little>>,
		Bin_id
	];

%GENERATED from file:player.h => U2GS_MonsterBookSnap_Request
packNetMsg(#pk_U2GS_MonsterBookSnap_Request{} = P) ->
	Bin_id = binary_write_uint16( P#pk_U2GS_MonsterBookSnap_Request.id ),
	[
		<<?CMD_U2GS_MonsterBookSnap_Request:16/little>>,
		Bin_id
	];

%GENERATED from file:player.h => U2GS_MonsterBookUnlock_Request
packNetMsg(#pk_U2GS_MonsterBookUnlock_Request{} = P) ->
	Bin_id = binary_write_uint16( P#pk_U2GS_MonsterBookUnlock_Request.id ),
	[
		<<?CMD_U2GS_MonsterBookUnlock_Request:16/little>>,
		Bin_id
	];

%GENERATED from file:player.h => U2GS_MonsterBook_Request
packNetMsg(#pk_U2GS_MonsterBook_Request{}) ->
	[
		<<?CMD_U2GS_MonsterBook_Request:16/little>>

	];

%GENERATED from file:player.h => U2GS_MonthCardGettingEvent
packNetMsg(#pk_U2GS_MonthCardGettingEvent{} = P) ->
	Bin_type = binary_write_uint( P#pk_U2GS_MonthCardGettingEvent.type ),
	[
		<<?CMD_U2GS_MonthCardGettingEvent:16/little>>,
		Bin_type
	];

%GENERATED from file:player.h => U2GS_MoveTo
packNetMsg(#pk_U2GS_MoveTo{} = P) ->
	Bin_code = binary_write_uint64( P#pk_U2GS_MoveTo.code ),
	Bin_posX = binary_write_float( P#pk_U2GS_MoveTo.posX ),
	Bin_posY = binary_write_float( P#pk_U2GS_MoveTo.posY ),
	Bin_posInfos = binary_write_array(P#pk_U2GS_MoveTo.posInfos, fun(X) -> writePosInfo( X ) end),
	[
		<<?CMD_U2GS_MoveTo:16/little>>,
		Bin_code,
		Bin_posX,
		Bin_posY,
		Bin_posInfos
	];

%GENERATED from file:player.h => U2GS_NeedForSpeedCancel
packNetMsg(#pk_U2GS_NeedForSpeedCancel{}) ->
	[
		<<?CMD_U2GS_NeedForSpeedCancel:16/little>>

	];

%GENERATED from file:player.h => U2GS_NeedForSpeedCollideRoadBox
packNetMsg(#pk_U2GS_NeedForSpeedCollideRoadBox{} = P) ->
	Bin_collideBoxId = binary_write_uint16( P#pk_U2GS_NeedForSpeedCollideRoadBox.collideBoxId ),
	[
		<<?CMD_U2GS_NeedForSpeedCollideRoadBox:16/little>>,
		Bin_collideBoxId
	];

%GENERATED from file:player.h => U2GS_NeedForSpeedCollideRoadScoreLine
packNetMsg(#pk_U2GS_NeedForSpeedCollideRoadScoreLine{} = P) ->
	Bin_collideScoreLineId = binary_write_uint16( P#pk_U2GS_NeedForSpeedCollideRoadScoreLine.collideScoreLineId ),
	[
		<<?CMD_U2GS_NeedForSpeedCollideRoadScoreLine:16/little>>,
		Bin_collideScoreLineId
	];

%GENERATED from file:player.h => U2GS_NeedForSpeedJoin
packNetMsg(#pk_U2GS_NeedForSpeedJoin{}) ->
	[
		<<?CMD_U2GS_NeedForSpeedJoin:16/little>>

	];

%GENERATED from file:player.h => U2GS_NeedForSpeedQuite
packNetMsg(#pk_U2GS_NeedForSpeedQuite{}) ->
	[
		<<?CMD_U2GS_NeedForSpeedQuite:16/little>>

	];

%GENERATED from file:player.h => U2GS_NeedForSpeedUseItem
packNetMsg(#pk_U2GS_NeedForSpeedUseItem{} = P) ->
	Bin_itemID = binary_write_uint64( P#pk_U2GS_NeedForSpeedUseItem.itemID ),
	Bin_targetRoleIDList = binary_write_array(P#pk_U2GS_NeedForSpeedUseItem.targetRoleIDList, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_U2GS_NeedForSpeedUseItem:16/little>>,
		Bin_itemID,
		Bin_targetRoleIDList
	];

%GENERATED from file:player.h => U2GS_NoticeRequest
packNetMsg(#pk_U2GS_NoticeRequest{} = P) ->
	Bin_md5 = binary_write_string( P#pk_U2GS_NoticeRequest.md5 ),
	[
		<<?CMD_U2GS_NoticeRequest:16/little>>,
		Bin_md5
	];

%GENERATED from file:player.h => U2GS_PlayerAwakenUseItem
packNetMsg(#pk_U2GS_PlayerAwakenUseItem{} = P) ->
	Bin_num = binary_write_uint16( P#pk_U2GS_PlayerAwakenUseItem.num ),
	[
		<<?CMD_U2GS_PlayerAwakenUseItem:16/little>>,
		Bin_num
	];

%GENERATED from file:player.h => U2GS_PlayerCoupleBack
packNetMsg(#pk_U2GS_PlayerCoupleBack{} = P) ->
	Bin_cbType = binary_write_uint( P#pk_U2GS_PlayerCoupleBack.cbType ),
	Bin_cbContent = binary_write_string( P#pk_U2GS_PlayerCoupleBack.cbContent ),
	[
		<<?CMD_U2GS_PlayerCoupleBack:16/little>>,
		Bin_cbType,
		Bin_cbContent
	];

%GENERATED from file:player.h => U2GS_PlotDialogueEnd
packNetMsg(#pk_U2GS_PlotDialogueEnd{}) ->
	[
		<<?CMD_U2GS_PlotDialogueEnd:16/little>>

	];

%GENERATED from file:player.h => U2GS_QueryTargetObject
packNetMsg(#pk_U2GS_QueryTargetObject{} = P) ->
	Bin_targetCode = binary_write_uint64( P#pk_U2GS_QueryTargetObject.targetCode ),
	[
		<<?CMD_U2GS_QueryTargetObject:16/little>>,
		Bin_targetCode
	];

%GENERATED from file:player.h => U2GS_RaceApply_Request
packNetMsg(#pk_U2GS_RaceApply_Request{}) ->
	[
		<<?CMD_U2GS_RaceApply_Request:16/little>>

	];

%GENERATED from file:player.h => U2GS_RaceCancel_Request
packNetMsg(#pk_U2GS_RaceCancel_Request{}) ->
	[
		<<?CMD_U2GS_RaceCancel_Request:16/little>>

	];

%GENERATED from file:player.h => U2GS_RaceMapItem_Request
packNetMsg(#pk_U2GS_RaceMapItem_Request{} = P) ->
	Bin_itemID = binary_write_uint8( P#pk_U2GS_RaceMapItem_Request.itemID ),
	[
		<<?CMD_U2GS_RaceMapItem_Request:16/little>>,
		Bin_itemID
	];

%GENERATED from file:player.h => U2GS_RecClientEvent
packNetMsg(#pk_U2GS_RecClientEvent{} = P) ->
	Bin_eventID = binary_write_uint( P#pk_U2GS_RecClientEvent.eventID ),
	Bin_eventTime = binary_write_uint( P#pk_U2GS_RecClientEvent.eventTime ),
	Bin_eventArgs = binary_write_string( P#pk_U2GS_RecClientEvent.eventArgs ),
	[
		<<?CMD_U2GS_RecClientEvent:16/little>>,
		Bin_eventID,
		Bin_eventTime,
		Bin_eventArgs
	];

%GENERATED from file:player.h => U2GS_ReceivePlayerLevelReward
packNetMsg(#pk_U2GS_ReceivePlayerLevelReward{} = P) ->
	Bin_level = binary_write_uint8( P#pk_U2GS_ReceivePlayerLevelReward.level ),
	[
		<<?CMD_U2GS_ReceivePlayerLevelReward:16/little>>,
		Bin_level
	];

%GENERATED from file:player.h => U2GS_RechargeGettingEvent
packNetMsg(#pk_U2GS_RechargeGettingEvent{} = P) ->
	Bin_type = binary_write_uint( P#pk_U2GS_RechargeGettingEvent.type ),
	Bin_grade = binary_write_uint( P#pk_U2GS_RechargeGettingEvent.grade ),
	[
		<<?CMD_U2GS_RechargeGettingEvent:16/little>>,
		Bin_type,
		Bin_grade
	];

%GENERATED from file:player.h => U2GS_ReconnectLoginRequest
packNetMsg(#pk_U2GS_ReconnectLoginRequest{} = P) ->
	Bin_accountID = binary_write_uint64( P#pk_U2GS_ReconnectLoginRequest.accountID ),
	Bin_roleID = binary_write_uint64( P#pk_U2GS_ReconnectLoginRequest.roleID ),
	Bin_key = binary_write_string( P#pk_U2GS_ReconnectLoginRequest.key ),
	Bin_protocolVer = binary_write_int( P#pk_U2GS_ReconnectLoginRequest.protocolVer ),
	[
		<<?CMD_U2GS_ReconnectLoginRequest:16/little>>,
		Bin_accountID,
		Bin_roleID,
		Bin_key,
		Bin_protocolVer
	];

%GENERATED from file:player.h => U2GS_ReqChatVoice
packNetMsg(#pk_U2GS_ReqChatVoice{} = P) ->
	Bin_playerCode = binary_write_uint64( P#pk_U2GS_ReqChatVoice.playerCode ),
	Bin_key = binary_write_uint( P#pk_U2GS_ReqChatVoice.key ),
	[
		<<?CMD_U2GS_ReqChatVoice:16/little>>,
		Bin_playerCode,
		Bin_key
	];

%GENERATED from file:player.h => U2GS_RequestCreatePlayer
packNetMsg(#pk_U2GS_RequestCreatePlayer{} = P) ->
	Bin_name = binary_write_string( P#pk_U2GS_RequestCreatePlayer.name ),
	Bin_camp = binary_write_int8( P#pk_U2GS_RequestCreatePlayer.camp ),
	Bin_career = binary_write_uint( P#pk_U2GS_RequestCreatePlayer.career ),
	Bin_race = binary_write_int8( P#pk_U2GS_RequestCreatePlayer.race ),
	Bin_sex = binary_write_int8( P#pk_U2GS_RequestCreatePlayer.sex ),
	Bin_head = binary_write_int( P#pk_U2GS_RequestCreatePlayer.head ),
	[
		<<?CMD_U2GS_RequestCreatePlayer:16/little>>,
		Bin_name,
		Bin_camp,
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_head
	];

%GENERATED from file:player.h => U2GS_RequestDeletePlayer
packNetMsg(#pk_U2GS_RequestDeletePlayer{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_RequestDeletePlayer.roleID ),
	[
		<<?CMD_U2GS_RequestDeletePlayer:16/little>>,
		Bin_roleID
	];

%GENERATED from file:player.h => U2GS_RequestGoddessCode
packNetMsg(#pk_U2GS_RequestGoddessCode{}) ->
	[
		<<?CMD_U2GS_RequestGoddessCode:16/little>>

	];

%GENERATED from file:player.h => U2GS_RequestLogin
packNetMsg(#pk_U2GS_RequestLogin{} = P) ->
	Bin_accountID = binary_write_uint64( P#pk_U2GS_RequestLogin.accountID ),
	Bin_key = binary_write_string( P#pk_U2GS_RequestLogin.key ),
	Bin_protocolVer = binary_write_int( P#pk_U2GS_RequestLogin.protocolVer ),
	[
		<<?CMD_U2GS_RequestLogin:16/little>>,
		Bin_accountID,
		Bin_key,
		Bin_protocolVer
	];

%GENERATED from file:player.h => U2GS_RequestObjInfo
packNetMsg(#pk_U2GS_RequestObjInfo{} = P) ->
	Bin_obj_type = binary_write_int8( P#pk_U2GS_RequestObjInfo.obj_type ),
	Bin_codes = binary_write_array(P#pk_U2GS_RequestObjInfo.codes, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_U2GS_RequestObjInfo:16/little>>,
		Bin_obj_type,
		Bin_codes
	];

%GENERATED from file:player.h => U2GS_RequestRecharge
packNetMsg(#pk_U2GS_RequestRecharge{} = P) ->
	Bin_funcellAccessToken = binary_write_string( P#pk_U2GS_RequestRecharge.funcellAccessToken ),
	Bin_funcellCilentID = binary_write_string( P#pk_U2GS_RequestRecharge.funcellCilentID ),
	Bin_funcellOrderID = binary_write_string( P#pk_U2GS_RequestRecharge.funcellOrderID ),
	Bin_extArgs = binary_write_string( P#pk_U2GS_RequestRecharge.extArgs ),
	[
		<<?CMD_U2GS_RequestRecharge:16/little>>,
		Bin_funcellAccessToken,
		Bin_funcellCilentID,
		Bin_funcellOrderID,
		Bin_extArgs
	];

%GENERATED from file:player.h => U2GS_RequestRechargeHasGiftIDList
packNetMsg(#pk_U2GS_RequestRechargeHasGiftIDList{}) ->
	[
		<<?CMD_U2GS_RequestRechargeHasGiftIDList:16/little>>

	];

%GENERATED from file:player.h => U2GS_RequestRevive
packNetMsg(#pk_U2GS_RequestRevive{} = P) ->
	Bin_reviveType = binary_write_uint( P#pk_U2GS_RequestRevive.reviveType ),
	[
		<<?CMD_U2GS_RequestRevive:16/little>>,
		Bin_reviveType
	];

%GENERATED from file:player.h => U2GS_RequestTargetCopyMapScore
packNetMsg(#pk_U2GS_RequestTargetCopyMapScore{} = P) ->
	Bin_targetCopyMapID = binary_write_uint( P#pk_U2GS_RequestTargetCopyMapScore.targetCopyMapID ),
	[
		<<?CMD_U2GS_RequestTargetCopyMapScore:16/little>>,
		Bin_targetCopyMapID
	];

%GENERATED from file:player.h => U2GS_ResetCopyMap
packNetMsg(#pk_U2GS_ResetCopyMap{} = P) ->
	Bin_copyMapID = binary_write_uint16( P#pk_U2GS_ResetCopyMap.copyMapID ),
	[
		<<?CMD_U2GS_ResetCopyMap:16/little>>,
		Bin_copyMapID
	];

%GENERATED from file:player.h => U2GS_ResetPosToRevivePt
packNetMsg(#pk_U2GS_ResetPosToRevivePt{}) ->
	[
		<<?CMD_U2GS_ResetPosToRevivePt:16/little>>

	];

%GENERATED from file:player.h => U2GS_SelPlayerEnterGame
packNetMsg(#pk_U2GS_SelPlayerEnterGame{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_SelPlayerEnterGame.roleID ),
	[
		<<?CMD_U2GS_SelPlayerEnterGame:16/little>>,
		Bin_roleID
	];

%GENERATED from file:player.h => U2GS_SelectTarget
packNetMsg(#pk_U2GS_SelectTarget{} = P) ->
	Bin_code = binary_write_uint64( P#pk_U2GS_SelectTarget.code ),
	[
		<<?CMD_U2GS_SelectTarget:16/little>>,
		Bin_code
	];

%GENERATED from file:player.h => U2GS_SessionKeyAck
packNetMsg(#pk_U2GS_SessionKeyAck{} = P) ->
	Bin_oldKey = binary_write_string( P#pk_U2GS_SessionKeyAck.oldKey ),
	Bin_newKey = binary_write_string( P#pk_U2GS_SessionKeyAck.newKey ),
	[
		<<?CMD_U2GS_SessionKeyAck:16/little>>,
		Bin_oldKey,
		Bin_newKey
	];

%GENERATED from file:player.h => U2GS_SevenDayAimReward_Request
packNetMsg(#pk_U2GS_SevenDayAimReward_Request{} = P) ->
	Bin_id = binary_write_uint16( P#pk_U2GS_SevenDayAimReward_Request.id ),
	[
		<<?CMD_U2GS_SevenDayAimReward_Request:16/little>>,
		Bin_id
	];

%GENERATED from file:player.h => U2GS_ShowAction
packNetMsg(#pk_U2GS_ShowAction{} = P) ->
	Bin_actionIndex = binary_write_uint( P#pk_U2GS_ShowAction.actionIndex ),
	[
		<<?CMD_U2GS_ShowAction:16/little>>,
		Bin_actionIndex
	];

%GENERATED from file:player.h => U2GS_ShowHeadEmoticonIcon
packNetMsg(#pk_U2GS_ShowHeadEmoticonIcon{} = P) ->
	Bin_iconIndex = binary_write_uint( P#pk_U2GS_ShowHeadEmoticonIcon.iconIndex ),
	[
		<<?CMD_U2GS_ShowHeadEmoticonIcon:16/little>>,
		Bin_iconIndex
	];

%GENERATED from file:player.h => U2GS_StartMeditation
packNetMsg(#pk_U2GS_StartMeditation{} = P) ->
	Bin_istart = binary_write_bool( P#pk_U2GS_StartMeditation.istart ),
	[
		<<?CMD_U2GS_StartMeditation:16/little>>,
		Bin_istart
	];

%GENERATED from file:player.h => U2GS_StopMove
packNetMsg(#pk_U2GS_StopMove{} = P) ->
	Bin_code = binary_write_uint64( P#pk_U2GS_StopMove.code ),
	Bin_posX = binary_write_float( P#pk_U2GS_StopMove.posX ),
	Bin_posY = binary_write_float( P#pk_U2GS_StopMove.posY ),
	[
		<<?CMD_U2GS_StopMove:16/little>>,
		Bin_code,
		Bin_posX,
		Bin_posY
	];

%GENERATED from file:player.h => U2GS_Telesport
packNetMsg(#pk_U2GS_Telesport{} = P) ->
	Bin_x = binary_write_float( P#pk_U2GS_Telesport.x ),
	Bin_y = binary_write_float( P#pk_U2GS_Telesport.y ),
	[
		<<?CMD_U2GS_Telesport:16/little>>,
		Bin_x,
		Bin_y
	];

%GENERATED from file:player.h => U2GS_ThirtyDayLoginGift_Request
packNetMsg(#pk_U2GS_ThirtyDayLoginGift_Request{} = P) ->
	Bin_id = binary_write_uint16( P#pk_U2GS_ThirtyDayLoginGift_Request.id ),
	[
		<<?CMD_U2GS_ThirtyDayLoginGift_Request:16/little>>,
		Bin_id
	];

%GENERATED from file:player.h => U2GS_Transfer2NewPos
packNetMsg(#pk_U2GS_Transfer2NewPos{} = P) ->
	Bin_mapID = binary_write_uint( P#pk_U2GS_Transfer2NewPos.mapID ),
	Bin_x = binary_write_float( P#pk_U2GS_Transfer2NewPos.x ),
	Bin_y = binary_write_float( P#pk_U2GS_Transfer2NewPos.y ),
	[
		<<?CMD_U2GS_Transfer2NewPos:16/little>>,
		Bin_mapID,
		Bin_x,
		Bin_y
	];

%GENERATED from file:player.h => U2GS_TransferMap
packNetMsg(#pk_U2GS_TransferMap{} = P) ->
	Bin_mapId = binary_write_uint( P#pk_U2GS_TransferMap.mapId ),
	Bin_waypointName = binary_write_string( P#pk_U2GS_TransferMap.waypointName ),
	[
		<<?CMD_U2GS_TransferMap:16/little>>,
		Bin_mapId,
		Bin_waypointName
	];

%GENERATED from file:player.h => U2GS_WingRise
packNetMsg(#pk_U2GS_WingRise{} = P) ->
	Bin_itemID = binary_write_uint( P#pk_U2GS_WingRise.itemID ),
	Bin_itemNum = binary_write_uint( P#pk_U2GS_WingRise.itemNum ),
	Bin_firstBind = binary_write_uint8( P#pk_U2GS_WingRise.firstBind ),
	[
		<<?CMD_U2GS_WingRise:16/little>>,
		Bin_itemID,
		Bin_itemNum,
		Bin_firstBind
	];

%GENERATED from file:player.h => U2GS_WingRiseOneTouch
packNetMsg(#pk_U2GS_WingRiseOneTouch{}) ->
	[
		<<?CMD_U2GS_WingRiseOneTouch:16/little>>

	];

%GENERATED from file:player.h => U2GS_XmlNoticeRequest
packNetMsg(#pk_U2GS_XmlNoticeRequest{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_XmlNoticeRequest.type ),
	Bin_sign = binary_write_string( P#pk_U2GS_XmlNoticeRequest.sign ),
	[
		<<?CMD_U2GS_XmlNoticeRequest:16/little>>,
		Bin_type,
		Bin_sign
	];

%GENERATED from file:player.h => U2GS_buy_action_count
packNetMsg(#pk_U2GS_buy_action_count{} = P) ->
	Bin_copyMapID = binary_write_uint16( P#pk_U2GS_buy_action_count.copyMapID ),
	[
		<<?CMD_U2GS_buy_action_count:16/little>>,
		Bin_copyMapID
	];

%GENERATED from file:player.h => U2GS_buy_action_point
packNetMsg(#pk_U2GS_buy_action_point{}) ->
	[
		<<?CMD_U2GS_buy_action_point:16/little>>

	];

%GENERATED from file:player.h => U2GS_getFriendPos
packNetMsg(#pk_U2GS_getFriendPos{} = P) ->
	Bin_friendID = binary_write_uint64( P#pk_U2GS_getFriendPos.friendID ),
	[
		<<?CMD_U2GS_getFriendPos:16/little>>,
		Bin_friendID
	];

%GENERATED from file:player.h => U2GS_get_action_point_info
packNetMsg(#pk_U2GS_get_action_point_info{}) ->
	[
		<<?CMD_U2GS_get_action_point_info:16/little>>

	];

%GENERATED from file:player.h => U2GS_get_copy_map_destory_time
packNetMsg(#pk_U2GS_get_copy_map_destory_time{}) ->
	[
		<<?CMD_U2GS_get_copy_map_destory_time:16/little>>

	];

%GENERATED from file:player.h => U2GS_get_lottery_sys_info
packNetMsg(#pk_U2GS_get_lottery_sys_info{}) ->
	[
		<<?CMD_U2GS_get_lottery_sys_info:16/little>>

	];

%GENERATED from file:player.h => U2GS_lottery_start
packNetMsg(#pk_U2GS_lottery_start{} = P) ->
	Bin_type = binary_write_uint( P#pk_U2GS_lottery_start.type ),
	[
		<<?CMD_U2GS_lottery_start:16/little>>,
		Bin_type
	];

%GENERATED from file:player.h => U2GS_save_current_guide_id
packNetMsg(#pk_U2GS_save_current_guide_id{} = P) ->
	Bin_guideID = binary_write_uint16( P#pk_U2GS_save_current_guide_id.guideID ),
	[
		<<?CMD_U2GS_save_current_guide_id:16/little>>,
		Bin_guideID
	];

%GENERATED from file:rank.h => GS2U_ActivityMapRankData
packNetMsg(#pk_GS2U_ActivityMapRankData{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_ActivityMapRankData.type ),
	Bin_data = binary_write_array(P#pk_GS2U_ActivityMapRankData.data, fun(X) -> writeActivityMapRankData( X ) end),
	[
		<<?CMD_GS2U_ActivityMapRankData:16/little>>,
		Bin_type,
		Bin_data
	];

%GENERATED from file:rank.h => GS2U_MyKillNumber
packNetMsg(#pk_GS2U_MyKillNumber{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_MyKillNumber.type ),
	Bin_killNumber = binary_write_uint16( P#pk_GS2U_MyKillNumber.killNumber ),
	[
		<<?CMD_GS2U_MyKillNumber:16/little>>,
		Bin_type,
		Bin_killNumber
	];

%GENERATED from file:rank.h => GS2U_MyRankingAndDamage
packNetMsg(#pk_GS2U_MyRankingAndDamage{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_MyRankingAndDamage.type ),
	Bin_ranking = binary_write_uint16( P#pk_GS2U_MyRankingAndDamage.ranking ),
	Bin_damage = binary_write_uint( P#pk_GS2U_MyRankingAndDamage.damage ),
	[
		<<?CMD_GS2U_MyRankingAndDamage:16/little>>,
		Bin_type,
		Bin_ranking,
		Bin_damage
	];

%GENERATED from file:rank.h => GS2U_RefreshRank
packNetMsg(#pk_GS2U_RefreshRank{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_RefreshRank.type ),
	[
		<<?CMD_GS2U_RefreshRank:16/little>>,
		Bin_type
	];

%GENERATED from file:rank.h => GS2U_SendPropList
packNetMsg(#pk_GS2U_SendPropList{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_SendPropList.roleID ),
	Bin_playerCode = binary_write_uint64( P#pk_GS2U_SendPropList.playerCode ),
	Bin_career = binary_write_uint( P#pk_GS2U_SendPropList.career ),
	Bin_race = binary_write_int8( P#pk_GS2U_SendPropList.race ),
	Bin_sex = binary_write_int8( P#pk_GS2U_SendPropList.sex ),
	Bin_head = binary_write_int( P#pk_GS2U_SendPropList.head ),
	Bin_wingLevel = binary_write_int( P#pk_GS2U_SendPropList.wingLevel ),
	Bin_fashionIDs = binary_write_array(P#pk_GS2U_SendPropList.fashionIDs, fun(X) -> binary_write_int( X ) end),
	Bin_equipIDList = binary_write_array(P#pk_GS2U_SendPropList.equipIDList, fun(X) -> writePlayerEquip( X ) end),
	Bin_equipLevelList = binary_write_array(P#pk_GS2U_SendPropList.equipLevelList, fun(X) -> writePlayerEquipLevel( X ) end),
	[
		<<?CMD_GS2U_SendPropList:16/little>>,
		Bin_roleID,
		Bin_playerCode,
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_head,
		Bin_wingLevel,
		Bin_fashionIDs,
		Bin_equipIDList,
		Bin_equipLevelList
	];

%GENERATED from file:rank.h => GS2U_SendRank
packNetMsg(#pk_GS2U_SendRank{} = P) ->
	Bin_type = binary_write_uint8( P#pk_GS2U_SendRank.type ),
	Bin_datas = binary_write_array(P#pk_GS2U_SendRank.datas, fun(X) -> writeRankInfo( X ) end),
	[
		<<?CMD_GS2U_SendRank:16/little>>,
		Bin_type,
		Bin_datas
	];

%GENERATED from file:rank.h => U2GS_RequestActivityMapRank
packNetMsg(#pk_U2GS_RequestActivityMapRank{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_RequestActivityMapRank.type ),
	[
		<<?CMD_U2GS_RequestActivityMapRank:16/little>>,
		Bin_type
	];

%GENERATED from file:rank.h => U2GS_RequestPropList
packNetMsg(#pk_U2GS_RequestPropList{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_RequestPropList.type ),
	Bin_roleID = binary_write_uint64( P#pk_U2GS_RequestPropList.roleID ),
	[
		<<?CMD_U2GS_RequestPropList:16/little>>,
		Bin_type,
		Bin_roleID
	];

%GENERATED from file:rank.h => U2GS_RequestRank
packNetMsg(#pk_U2GS_RequestRank{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_RequestRank.type ),
	[
		<<?CMD_U2GS_RequestRank:16/little>>,
		Bin_type
	];

%GENERATED from file:rank.h => U2GS_RequestRankAward
packNetMsg(#pk_U2GS_RequestRankAward{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_RequestRankAward.type ),
	[
		<<?CMD_U2GS_RequestRankAward:16/little>>,
		Bin_type
	];

%GENERATED from file:redenvelope.h => GS2U_RedEnvelopeHistoryAck
packNetMsg(#pk_GS2U_RedEnvelopeHistoryAck{} = P) ->
	Bin_historyList = binary_write_array(P#pk_GS2U_RedEnvelopeHistoryAck.historyList, fun(X) -> writeredEnvelopeHistory( X ) end),
	[
		<<?CMD_GS2U_RedEnvelopeHistoryAck:16/little>>,
		Bin_historyList
	];

%GENERATED from file:redenvelope.h => GS2U_RedEnvelopeInfoAck
packNetMsg(#pk_GS2U_RedEnvelopeInfoAck{} = P) ->
	Bin_red = writeredEnvelopeInfo( P#pk_GS2U_RedEnvelopeInfoAck.red ),
	[
		<<?CMD_GS2U_RedEnvelopeInfoAck:16/little>>,
		Bin_red
	];

%GENERATED from file:redenvelope.h => GS2U_RedEnvelopeQuery
packNetMsg(#pk_GS2U_RedEnvelopeQuery{} = P) ->
	Bin_redEnvelopeList = binary_write_array(P#pk_GS2U_RedEnvelopeQuery.redEnvelopeList, fun(X) -> writeredEnvelopeBaseInfo( X ) end),
	[
		<<?CMD_GS2U_RedEnvelopeQuery:16/little>>,
		Bin_redEnvelopeList
	];

%GENERATED from file:redenvelope.h => GS2U_RobRedEnvelopeAck
packNetMsg(#pk_GS2U_RobRedEnvelopeAck{} = P) ->
	Bin_robAmount = binary_write_uint( P#pk_GS2U_RobRedEnvelopeAck.robAmount ),
	Bin_red = writeredEnvelopeInfo( P#pk_GS2U_RobRedEnvelopeAck.red ),
	[
		<<?CMD_GS2U_RobRedEnvelopeAck:16/little>>,
		Bin_robAmount,
		Bin_red
	];

%GENERATED from file:redenvelope.h => U2GS_GiveUpRedEnvelope
packNetMsg(#pk_U2GS_GiveUpRedEnvelope{}) ->
	[
		<<?CMD_U2GS_GiveUpRedEnvelope:16/little>>

	];

%GENERATED from file:redenvelope.h => U2GS_RedEnvelopeHistory
packNetMsg(#pk_U2GS_RedEnvelopeHistory{}) ->
	[
		<<?CMD_U2GS_RedEnvelopeHistory:16/little>>

	];

%GENERATED from file:redenvelope.h => U2GS_RedEnvelopeInfo
packNetMsg(#pk_U2GS_RedEnvelopeInfo{} = P) ->
	Bin_redUID = binary_write_uint64( P#pk_U2GS_RedEnvelopeInfo.redUID ),
	[
		<<?CMD_U2GS_RedEnvelopeInfo:16/little>>,
		Bin_redUID
	];

%GENERATED from file:redenvelope.h => U2GS_RedEnvelopeQuery
packNetMsg(#pk_U2GS_RedEnvelopeQuery{} = P) ->
	Bin_targetType = binary_write_uint8( P#pk_U2GS_RedEnvelopeQuery.targetType ),
	[
		<<?CMD_U2GS_RedEnvelopeQuery:16/little>>,
		Bin_targetType
	];

%GENERATED from file:redenvelope.h => U2GS_RobRedEnvelope
packNetMsg(#pk_U2GS_RobRedEnvelope{} = P) ->
	Bin_redUID = binary_write_uint64( P#pk_U2GS_RobRedEnvelope.redUID ),
	[
		<<?CMD_U2GS_RobRedEnvelope:16/little>>,
		Bin_redUID
	];

%GENERATED from file:redenvelope.h => U2GS_SendRedEnvelope
packNetMsg(#pk_U2GS_SendRedEnvelope{} = P) ->
	Bin_type = binary_write_uint8( P#pk_U2GS_SendRedEnvelope.type ),
	Bin_targetType = binary_write_uint8( P#pk_U2GS_SendRedEnvelope.targetType ),
	Bin_targetUID = binary_write_uint64( P#pk_U2GS_SendRedEnvelope.targetUID ),
	Bin_allNumber = binary_write_uint( P#pk_U2GS_SendRedEnvelope.allNumber ),
	Bin_allMoney = binary_write_uint( P#pk_U2GS_SendRedEnvelope.allMoney ),
	Bin_luckContent = binary_write_string( P#pk_U2GS_SendRedEnvelope.luckContent ),
	[
		<<?CMD_U2GS_SendRedEnvelope:16/little>>,
		Bin_type,
		Bin_targetType,
		Bin_targetUID,
		Bin_allNumber,
		Bin_allMoney,
		Bin_luckContent
	];

%GENERATED from file:rune.h => DeleteRunes
packNetMsg(#pk_DeleteRunes{} = P) ->
	Bin_runeUIDS = binary_write_array(P#pk_DeleteRunes.runeUIDS, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_DeleteRunes:16/little>>,
		Bin_runeUIDS
	];

%GENERATED from file:rune.h => GS2U_QueryRuneTipsAck
packNetMsg(#pk_GS2U_QueryRuneTipsAck{} = P) ->
	Bin_info = writeRuneInfo( P#pk_GS2U_QueryRuneTipsAck.info ),
	[
		<<?CMD_GS2U_QueryRuneTipsAck:16/little>>,
		Bin_info
	];

%GENERATED from file:rune.h => GS2U_RPRuneInfoList
packNetMsg(#pk_GS2U_RPRuneInfoList{} = P) ->
	Bin_targetRoleID = binary_write_uint64( P#pk_GS2U_RPRuneInfoList.targetRoleID ),
	Bin_runeList = binary_write_array(P#pk_GS2U_RPRuneInfoList.runeList, fun(X) -> writeRuneInfo( X ) end),
	[
		<<?CMD_GS2U_RPRuneInfoList:16/little>>,
		Bin_targetRoleID,
		Bin_runeList
	];

%GENERATED from file:rune.h => GS2U_RuneCastAck
packNetMsg(#pk_GS2U_RuneCastAck{} = P) ->
	Bin_runeInfo = writeRuneInfo( P#pk_GS2U_RuneCastAck.runeInfo ),
	Bin_runeUIDS = binary_write_array(P#pk_GS2U_RuneCastAck.runeUIDS, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_GS2U_RuneCastAck:16/little>>,
		Bin_runeInfo,
		Bin_runeUIDS
	];

%GENERATED from file:rune.h => GS2U_RuneCastProp
packNetMsg(#pk_GS2U_RuneCastProp{} = P) ->
	Bin_flagID = binary_write_uint64( P#pk_GS2U_RuneCastProp.flagID ),
	Bin_oldprop = writeRuneBaseProp( P#pk_GS2U_RuneCastProp.oldprop ),
	Bin_newprop = writeRuneBaseProp( P#pk_GS2U_RuneCastProp.newprop ),
	[
		<<?CMD_GS2U_RuneCastProp:16/little>>,
		Bin_flagID,
		Bin_oldprop,
		Bin_newprop
	];

%GENERATED from file:rune.h => GS2U_RuneCompoundAck
packNetMsg(#pk_GS2U_RuneCompoundAck{} = P) ->
	Bin_runeInfo = writeRuneInfo( P#pk_GS2U_RuneCompoundAck.runeInfo ),
	[
		<<?CMD_GS2U_RuneCompoundAck:16/little>>,
		Bin_runeInfo
	];

%GENERATED from file:rune.h => GS2U_RuneEmbedOffAck
packNetMsg(#pk_GS2U_RuneEmbedOffAck{} = P) ->
	Bin_runeList = binary_write_array(P#pk_GS2U_RuneEmbedOffAck.runeList, fun(X) -> writeRuneInfo( X ) end),
	[
		<<?CMD_GS2U_RuneEmbedOffAck:16/little>>,
		Bin_runeList
	];

%GENERATED from file:rune.h => GS2U_RuneEmbedOnAck
packNetMsg(#pk_GS2U_RuneEmbedOnAck{} = P) ->
	Bin_targetID = binary_write_uint( P#pk_GS2U_RuneEmbedOnAck.targetID ),
	Bin_runeList = binary_write_array(P#pk_GS2U_RuneEmbedOnAck.runeList, fun(X) -> writeRuneInfo( X ) end),
	[
		<<?CMD_GS2U_RuneEmbedOnAck:16/little>>,
		Bin_targetID,
		Bin_runeList
	];

%GENERATED from file:rune.h => GS2U_RuneGrid
packNetMsg(#pk_GS2U_RuneGrid{} = P) ->
	Bin_ownerID = binary_write_uint8( P#pk_GS2U_RuneGrid.ownerID ),
	Bin_cur = binary_write_uint16( P#pk_GS2U_RuneGrid.cur ),
	Bin_max = binary_write_uint16( P#pk_GS2U_RuneGrid.max ),
	[
		<<?CMD_GS2U_RuneGrid:16/little>>,
		Bin_ownerID,
		Bin_cur,
		Bin_max
	];

%GENERATED from file:rune.h => GS2U_RuneInfoList
packNetMsg(#pk_GS2U_RuneInfoList{} = P) ->
	Bin_runeList = binary_write_array(P#pk_GS2U_RuneInfoList.runeList, fun(X) -> writeRuneInfo( X ) end),
	[
		<<?CMD_GS2U_RuneInfoList:16/little>>,
		Bin_runeList
	];

%GENERATED from file:rune.h => GS2U_RuneMeltAck
packNetMsg(#pk_GS2U_RuneMeltAck{} = P) ->
	Bin_runeInfo = writeRuneInfo( P#pk_GS2U_RuneMeltAck.runeInfo ),
	Bin_runeUIDS = binary_write_array(P#pk_GS2U_RuneMeltAck.runeUIDS, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_GS2U_RuneMeltAck:16/little>>,
		Bin_runeInfo,
		Bin_runeUIDS
	];

%GENERATED from file:rune.h => GS2U_RuneOpenBorad
packNetMsg(#pk_GS2U_RuneOpenBorad{} = P) ->
	Bin_code = binary_write_int( P#pk_GS2U_RuneOpenBorad.code ),
	[
		<<?CMD_GS2U_RuneOpenBorad:16/little>>,
		Bin_code
	];

%GENERATED from file:rune.h => GS2U_RuneSuitPropList
packNetMsg(#pk_GS2U_RuneSuitPropList{} = P) ->
	Bin_suitProps = binary_write_array(P#pk_GS2U_RuneSuitPropList.suitProps, fun(X) -> writeRuneSuitProp( X ) end),
	[
		<<?CMD_GS2U_RuneSuitPropList:16/little>>,
		Bin_suitProps
	];

%GENERATED from file:rune.h => RuneEmbedOn
packNetMsg(#pk_RuneEmbedOn{} = P) ->
	Bin_runeUIDs = binary_write_array(P#pk_RuneEmbedOn.runeUIDs, fun(X) -> binary_write_uint64( X ) end),
	Bin_targetID = binary_write_uint( P#pk_RuneEmbedOn.targetID ),
	[
		<<?CMD_RuneEmbedOn:16/little>>,
		Bin_runeUIDs,
		Bin_targetID
	];

%GENERATED from file:rune.h => U2GS_OpenRuneGrid
packNetMsg(#pk_U2GS_OpenRuneGrid{} = P) ->
	Bin_ownerID = binary_write_uint8( P#pk_U2GS_OpenRuneGrid.ownerID ),
	Bin_openNumber = binary_write_uint16( P#pk_U2GS_OpenRuneGrid.openNumber ),
	[
		<<?CMD_U2GS_OpenRuneGrid:16/little>>,
		Bin_ownerID,
		Bin_openNumber
	];

%GENERATED from file:rune.h => U2GS_QueryRuneTips
packNetMsg(#pk_U2GS_QueryRuneTips{} = P) ->
	Bin_runeUID = binary_write_uint64( P#pk_U2GS_QueryRuneTips.runeUID ),
	[
		<<?CMD_U2GS_QueryRuneTips:16/little>>,
		Bin_runeUID
	];

%GENERATED from file:rune.h => U2GS_RequestSuitProp
packNetMsg(#pk_U2GS_RequestSuitProp{} = P) ->
	Bin_ownerID = binary_write_uint( P#pk_U2GS_RequestSuitProp.ownerID ),
	[
		<<?CMD_U2GS_RequestSuitProp:16/little>>,
		Bin_ownerID
	];

%GENERATED from file:rune.h => U2GS_RuneCast
packNetMsg(#pk_U2GS_RuneCast{} = P) ->
	Bin_targetUID = binary_write_uint64( P#pk_U2GS_RuneCast.targetUID ),
	Bin_indexNumber = binary_write_uint( P#pk_U2GS_RuneCast.indexNumber ),
	Bin_materialUID = binary_write_uint64( P#pk_U2GS_RuneCast.materialUID ),
	[
		<<?CMD_U2GS_RuneCast:16/little>>,
		Bin_targetUID,
		Bin_indexNumber,
		Bin_materialUID
	];

%GENERATED from file:rune.h => U2GS_RuneCastAffirm
packNetMsg(#pk_U2GS_RuneCastAffirm{} = P) ->
	Bin_flagID = binary_write_uint64( P#pk_U2GS_RuneCastAffirm.flagID ),
	Bin_isAffirm = binary_write_bool( P#pk_U2GS_RuneCastAffirm.isAffirm ),
	[
		<<?CMD_U2GS_RuneCastAffirm:16/little>>,
		Bin_flagID,
		Bin_isAffirm
	];

%GENERATED from file:rune.h => U2GS_RuneCompound
packNetMsg(#pk_U2GS_RuneCompound{} = P) ->
	Bin_compoundID = binary_write_uint( P#pk_U2GS_RuneCompound.compoundID ),
	[
		<<?CMD_U2GS_RuneCompound:16/little>>,
		Bin_compoundID
	];

%GENERATED from file:rune.h => U2GS_RuneEmbedOff
packNetMsg(#pk_U2GS_RuneEmbedOff{} = P) ->
	Bin_runeUIDs = binary_write_array(P#pk_U2GS_RuneEmbedOff.runeUIDs, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_U2GS_RuneEmbedOff:16/little>>,
		Bin_runeUIDs
	];

%GENERATED from file:rune.h => U2GS_RuneMelt
packNetMsg(#pk_U2GS_RuneMelt{} = P) ->
	Bin_targetRuneUID = binary_write_uint64( P#pk_U2GS_RuneMelt.targetRuneUID ),
	Bin_materialUIDS = binary_write_array(P#pk_U2GS_RuneMelt.materialUIDS, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_U2GS_RuneMelt:16/little>>,
		Bin_targetRuneUID,
		Bin_materialUIDS
	];

%GENERATED from file:serverTest.h => GS2U_GridPlayerRotw
packNetMsg(#pk_GS2U_GridPlayerRotw{} = P) ->
	Bin_rotw = binary_write_int( P#pk_GS2U_GridPlayerRotw.rotw ),
	Bin_codes = binary_write_array(P#pk_GS2U_GridPlayerRotw.codes, fun(X) -> binary_write_uint64( X ) end),
	[
		<<?CMD_GS2U_GridPlayerRotw:16/little>>,
		Bin_rotw,
		Bin_codes
	];

%GENERATED from file:setting.h => Any_UpdateBitVariant
packNetMsg(#pk_Any_UpdateBitVariant{} = P) ->
	Bin_updateVariantList = binary_write_array(P#pk_Any_UpdateBitVariant.updateVariantList, fun(X) -> writeSwitchVariantInfo( X ) end),
	[
		<<?CMD_Any_UpdateBitVariant:16/little>>,
		Bin_updateVariantList
	];

%GENERATED from file:setting.h => Any_UpdateVariant
packNetMsg(#pk_Any_UpdateVariant{} = P) ->
	Bin_updateVariantList = binary_write_array(P#pk_Any_UpdateVariant.updateVariantList, fun(X) -> writeVariantInfo( X ) end),
	[
		<<?CMD_Any_UpdateVariant:16/little>>,
		Bin_updateVariantList
	];

%GENERATED from file:setting.h => GS2U_VariantInfo
packNetMsg(#pk_GS2U_VariantInfo{} = P) ->
	Bin_variantList = binary_write_array(P#pk_GS2U_VariantInfo.variantList, fun(X) -> writeVariantInfo( X ) end),
	[
		<<?CMD_GS2U_VariantInfo:16/little>>,
		Bin_variantList
	];

%GENERATED from file:setting.h => U2GS_AllTeamInvitationSetting
packNetMsg(#pk_U2GS_AllTeamInvitationSetting{} = P) ->
	Bin_onOrOff = binary_write_uint8( P#pk_U2GS_AllTeamInvitationSetting.onOrOff ),
	[
		<<?CMD_U2GS_AllTeamInvitationSetting:16/little>>,
		Bin_onOrOff
	];

%GENERATED from file:signin.h => BindPhoneAwardGet
packNetMsg(#pk_BindPhoneAwardGet{}) ->
	[
		<<?CMD_BindPhoneAwardGet:16/little>>

	];

%GENERATED from file:signin.h => EveryDaySignIn
packNetMsg(#pk_EveryDaySignIn{}) ->
	[
		<<?CMD_EveryDaySignIn:16/little>>

	];

%GENERATED from file:signin.h => GS2U_BindPhoneResult
packNetMsg(#pk_GS2U_BindPhoneResult{} = P) ->
	Bin_isSuccess = binary_write_bool( P#pk_GS2U_BindPhoneResult.isSuccess ),
	[
		<<?CMD_GS2U_BindPhoneResult:16/little>>,
		Bin_isSuccess
	];

%GENERATED from file:signin.h => GS2U_SignIn
packNetMsg(#pk_GS2U_SignIn{} = P) ->
	Bin_info_list = binary_write_array(P#pk_GS2U_SignIn.info_list, fun(X) -> writeSignInInfo( X ) end),
	Bin_time = binary_write_uint64( P#pk_GS2U_SignIn.time ),
	[
		<<?CMD_GS2U_SignIn:16/little>>,
		Bin_info_list,
		Bin_time
	];

%GENERATED from file:signin.h => SevenDaySignIn
packNetMsg(#pk_SevenDaySignIn{} = P) ->
	Bin_dayCount = binary_write_uint8( P#pk_SevenDaySignIn.dayCount ),
	[
		<<?CMD_SevenDaySignIn:16/little>>,
		Bin_dayCount
	];

%GENERATED from file:signin.h => U2GS_AccuReward
packNetMsg(#pk_U2GS_AccuReward{} = P) ->
	Bin_id = binary_write_uint8( P#pk_U2GS_AccuReward.id ),
	[
		<<?CMD_U2GS_AccuReward:16/little>>,
		Bin_id
	];

%GENERATED from file:signin.h => U2GS_BindPhone
packNetMsg(#pk_U2GS_BindPhone{} = P) ->
	Bin_funcellCilentID = binary_write_string( P#pk_U2GS_BindPhone.funcellCilentID ),
	Bin_accessToken = binary_write_string( P#pk_U2GS_BindPhone.accessToken ),
	Bin_phoneNum = binary_write_uint64( P#pk_U2GS_BindPhone.phoneNum ),
	Bin_verifyid = binary_write_string( P#pk_U2GS_BindPhone.verifyid ),
	Bin_content = binary_write_string( P#pk_U2GS_BindPhone.content ),
	[
		<<?CMD_U2GS_BindPhone:16/little>>,
		Bin_funcellCilentID,
		Bin_accessToken,
		Bin_phoneNum,
		Bin_verifyid,
		Bin_content
	];

%GENERATED from file:signin.h => U2GS_SignIn
packNetMsg(#pk_U2GS_SignIn{}) ->
	[
		<<?CMD_U2GS_SignIn:16/little>>

	];

%GENERATED from file:skill.h => GS2U_ChangeSkillSlotResult
packNetMsg(#pk_GS2U_ChangeSkillSlotResult{} = P) ->
	Bin_changeType = binary_write_uint( P#pk_GS2U_ChangeSkillSlotResult.changeType ),
	Bin_skillType = binary_write_int8( P#pk_GS2U_ChangeSkillSlotResult.skillType ),
	Bin_oldIndex = binary_write_uint( P#pk_GS2U_ChangeSkillSlotResult.oldIndex ),
	Bin_newSkillInfo = writeSkillSlotInfo( P#pk_GS2U_ChangeSkillSlotResult.newSkillInfo ),
	[
		<<?CMD_GS2U_ChangeSkillSlotResult:16/little>>,
		Bin_changeType,
		Bin_skillType,
		Bin_oldIndex,
		Bin_newSkillInfo
	];

%GENERATED from file:skill.h => GS2U_InitiativeSkillSlotInfoList
packNetMsg(#pk_GS2U_InitiativeSkillSlotInfoList{} = P) ->
	Bin_skillSlotList = binary_write_array(P#pk_GS2U_InitiativeSkillSlotInfoList.skillSlotList, fun(X) -> writeSkillSlotInfo( X ) end),
	[
		<<?CMD_GS2U_InitiativeSkillSlotInfoList:16/little>>,
		Bin_skillSlotList
	];

%GENERATED from file:skill.h => GS2U_OpenSkill
packNetMsg(#pk_GS2U_OpenSkill{} = P) ->
	Bin_skillId = binary_write_uint( P#pk_GS2U_OpenSkill.skillId ),
	[
		<<?CMD_GS2U_OpenSkill:16/little>>,
		Bin_skillId
	];

%GENERATED from file:skill.h => GS2U_OpenSlot
packNetMsg(#pk_GS2U_OpenSlot{} = P) ->
	Bin_openSlot = writeOpenSlot( P#pk_GS2U_OpenSlot.openSlot ),
	[
		<<?CMD_GS2U_OpenSlot:16/little>>,
		Bin_openSlot
	];

%GENERATED from file:skill.h => GS2U_OpenSlotList
packNetMsg(#pk_GS2U_OpenSlotList{} = P) ->
	Bin_slotList = binary_write_array(P#pk_GS2U_OpenSlotList.slotList, fun(X) -> writeOpenSlot( X ) end),
	[
		<<?CMD_GS2U_OpenSlotList:16/little>>,
		Bin_slotList
	];

%GENERATED from file:skill.h => GS2U_PassiveSkillSlotInfoList
packNetMsg(#pk_GS2U_PassiveSkillSlotInfoList{} = P) ->
	Bin_skillSlotList = binary_write_array(P#pk_GS2U_PassiveSkillSlotInfoList.skillSlotList, fun(X) -> writeSkillSlotInfo( X ) end),
	[
		<<?CMD_GS2U_PassiveSkillSlotInfoList:16/little>>,
		Bin_skillSlotList
	];

%GENERATED from file:skill.h => GS2U_ReduceCD
packNetMsg(#pk_GS2U_ReduceCD{} = P) ->
	Bin_skillId = binary_write_uint( P#pk_GS2U_ReduceCD.skillId ),
	Bin_cd = binary_write_uint( P#pk_GS2U_ReduceCD.cd ),
	[
		<<?CMD_GS2U_ReduceCD:16/little>>,
		Bin_skillId,
		Bin_cd
	];

%GENERATED from file:skill.h => GS2U_SkillInfo
packNetMsg(#pk_GS2U_SkillInfo{} = P) ->
	Bin_id = binary_write_uint( P#pk_GS2U_SkillInfo.id ),
	Bin_level = binary_write_uint( P#pk_GS2U_SkillInfo.level ),
	[
		<<?CMD_GS2U_SkillInfo:16/little>>,
		Bin_id,
		Bin_level
	];

%GENERATED from file:skill.h => GS2U_SkillInfoList
packNetMsg(#pk_GS2U_SkillInfoList{} = P) ->
	Bin_code = binary_write_uint64( P#pk_GS2U_SkillInfoList.code ),
	Bin_skillInfoList = binary_write_array(P#pk_GS2U_SkillInfoList.skillInfoList, fun(X) -> writeSkillInfo( X ) end),
	[
		<<?CMD_GS2U_SkillInfoList:16/little>>,
		Bin_code,
		Bin_skillInfoList
	];

%GENERATED from file:skill.h => GS2U_TransformSkillSlotInfoList
packNetMsg(#pk_GS2U_TransformSkillSlotInfoList{} = P) ->
	Bin_skillSlotList = binary_write_array(P#pk_GS2U_TransformSkillSlotInfoList.skillSlotList, fun(X) -> writeSkillSlotInfo( X ) end),
	[
		<<?CMD_GS2U_TransformSkillSlotInfoList:16/little>>,
		Bin_skillSlotList
	];

%GENERATED from file:skill.h => GS2U_UpgradeSkill_Result
packNetMsg(#pk_GS2U_UpgradeSkill_Result{} = P) ->
	Bin_resultCode = binary_write_uint( P#pk_GS2U_UpgradeSkill_Result.resultCode ),
	Bin_skillinfo = writeSkillInfo( P#pk_GS2U_UpgradeSkill_Result.skillinfo ),
	[
		<<?CMD_GS2U_UpgradeSkill_Result:16/little>>,
		Bin_resultCode,
		Bin_skillinfo
	];

%GENERATED from file:skill.h => U2GS_ChangeSkillSlotRequest
packNetMsg(#pk_U2GS_ChangeSkillSlotRequest{} = P) ->
	Bin_changeType = binary_write_uint( P#pk_U2GS_ChangeSkillSlotRequest.changeType ),
	Bin_skillType = binary_write_int8( P#pk_U2GS_ChangeSkillSlotRequest.skillType ),
	Bin_changeSkillInfo = writeSkillSlotInfo( P#pk_U2GS_ChangeSkillSlotRequest.changeSkillInfo ),
	[
		<<?CMD_U2GS_ChangeSkillSlotRequest:16/little>>,
		Bin_changeType,
		Bin_skillType,
		Bin_changeSkillInfo
	];

%GENERATED from file:skill.h => U2GS_ResetSkill
packNetMsg(#pk_U2GS_ResetSkill{}) ->
	[
		<<?CMD_U2GS_ResetSkill:16/little>>

	];

%GENERATED from file:skill.h => U2GS_UpSkill
packNetMsg(#pk_U2GS_UpSkill{} = P) ->
	Bin_id = binary_write_uint( P#pk_U2GS_UpSkill.id ),
	Bin_type = binary_write_uint( P#pk_U2GS_UpSkill.type ),
	[
		<<?CMD_U2GS_UpSkill:16/little>>,
		Bin_id,
		Bin_type
	];

%GENERATED from file:skill.h => U2GS_UpgradeSkill_Request
packNetMsg(#pk_U2GS_UpgradeSkill_Request{} = P) ->
	Bin_skillId = binary_write_uint( P#pk_U2GS_UpgradeSkill_Request.skillId ),
	[
		<<?CMD_U2GS_UpgradeSkill_Request:16/little>>,
		Bin_skillId
	];

%GENERATED from file:talent.h => GS2U_TalentInitAck
packNetMsg(#pk_GS2U_TalentInitAck{} = P) ->
	Bin_talentInfos = binary_write_array(P#pk_GS2U_TalentInitAck.talentInfos, fun(X) -> writeTalentInfo( X ) end),
	[
		<<?CMD_GS2U_TalentInitAck:16/little>>,
		Bin_talentInfos
	];

%GENERATED from file:talent.h => GS2U_TalentLevelUpSuccess
packNetMsg(#pk_GS2U_TalentLevelUpSuccess{} = P) ->
	Bin_talentInfo = writeTalentInfo( P#pk_GS2U_TalentLevelUpSuccess.talentInfo ),
	[
		<<?CMD_GS2U_TalentLevelUpSuccess:16/little>>,
		Bin_talentInfo
	];

%GENERATED from file:talent.h => U2GS_TalentInit
packNetMsg(#pk_U2GS_TalentInit{}) ->
	[
		<<?CMD_U2GS_TalentInit:16/little>>

	];

%GENERATED from file:talent.h => U2GS_TalentLevelUp
packNetMsg(#pk_U2GS_TalentLevelUp{} = P) ->
	Bin_id = binary_write_uint8( P#pk_U2GS_TalentLevelUp.id ),
	[
		<<?CMD_U2GS_TalentLevelUp:16/little>>,
		Bin_id
	];

%GENERATED from file:task.h => GS2U_AcceptTask
packNetMsg(#pk_GS2U_AcceptTask{} = P) ->
	Bin_info = writetaskInfo( P#pk_GS2U_AcceptTask.info ),
	[
		<<?CMD_GS2U_AcceptTask:16/little>>,
		Bin_info
	];

%GENERATED from file:task.h => GS2U_AcceptTaskList
packNetMsg(#pk_GS2U_AcceptTaskList{} = P) ->
	Bin_list = binary_write_array(P#pk_GS2U_AcceptTaskList.list, fun(X) -> writeacceptedBaseTask( X ) end),
	[
		<<?CMD_GS2U_AcceptTaskList:16/little>>,
		Bin_list
	];

%GENERATED from file:task.h => GS2U_AddNewAcceptTask
packNetMsg(#pk_GS2U_AddNewAcceptTask{} = P) ->
	Bin_taskID = binary_write_int( P#pk_GS2U_AddNewAcceptTask.taskID ),
	Bin_result = binary_write_int( P#pk_GS2U_AddNewAcceptTask.result ),
	[
		<<?CMD_GS2U_AddNewAcceptTask:16/little>>,
		Bin_taskID,
		Bin_result
	];

%GENERATED from file:task.h => GS2U_AddNewCompleteLoopTasks
packNetMsg(#pk_GS2U_AddNewCompleteLoopTasks{} = P) ->
	Bin_result = binary_write_int( P#pk_GS2U_AddNewCompleteLoopTasks.result ),
	Bin_progress = binary_write_int( P#pk_GS2U_AddNewCompleteLoopTasks.progress ),
	Bin_allProgress = binary_write_int( P#pk_GS2U_AddNewCompleteLoopTasks.allProgress ),
	Bin_listTaskID = binary_write_array(P#pk_GS2U_AddNewCompleteLoopTasks.listTaskID, fun(X) -> binary_write_int( X ) end),
	Bin_listLevel = binary_write_array(P#pk_GS2U_AddNewCompleteLoopTasks.listLevel, fun(X) -> binary_write_int( X ) end),
	[
		<<?CMD_GS2U_AddNewCompleteLoopTasks:16/little>>,
		Bin_result,
		Bin_progress,
		Bin_allProgress,
		Bin_listTaskID,
		Bin_listLevel
	];

%GENERATED from file:task.h => GS2U_AddNewCompleteTask
packNetMsg(#pk_GS2U_AddNewCompleteTask{} = P) ->
	Bin_result = binary_write_int( P#pk_GS2U_AddNewCompleteTask.result ),
	Bin_taskID = binary_write_int( P#pk_GS2U_AddNewCompleteTask.taskID ),
	[
		<<?CMD_GS2U_AddNewCompleteTask:16/little>>,
		Bin_result,
		Bin_taskID
	];

%GENERATED from file:task.h => GS2U_CompleteTaskList
packNetMsg(#pk_GS2U_CompleteTaskList{} = P) ->
	Bin_list = binary_write_array(P#pk_GS2U_CompleteTaskList.list, fun(X) -> writeSubmittedTaskInfo( X ) end),
	[
		<<?CMD_GS2U_CompleteTaskList:16/little>>,
		Bin_list
	];

%GENERATED from file:task.h => GS2U_DeleteAcceptTask
packNetMsg(#pk_GS2U_DeleteAcceptTask{} = P) ->
	Bin_taskID = binary_write_int( P#pk_GS2U_DeleteAcceptTask.taskID ),
	Bin_result = binary_write_int( P#pk_GS2U_DeleteAcceptTask.result ),
	[
		<<?CMD_GS2U_DeleteAcceptTask:16/little>>,
		Bin_taskID,
		Bin_result
	];

%GENERATED from file:task.h => GS2U_TalkToNpcResult
packNetMsg(#pk_GS2U_TalkToNpcResult{} = P) ->
	Bin_result = binary_write_int( P#pk_GS2U_TalkToNpcResult.result ),
	Bin_code = binary_write_uint64( P#pk_GS2U_TalkToNpcResult.code ),
	[
		<<?CMD_GS2U_TalkToNpcResult:16/little>>,
		Bin_result,
		Bin_code
	];

%GENERATED from file:task.h => GS2U_TaskList
packNetMsg(#pk_GS2U_TaskList{} = P) ->
	Bin_list = binary_write_array(P#pk_GS2U_TaskList.list, fun(X) -> writetaskInfo( X ) end),
	[
		<<?CMD_GS2U_TaskList:16/little>>,
		Bin_list
	];

%GENERATED from file:task.h => GS2U_UpdateAcceptTask
packNetMsg(#pk_GS2U_UpdateAcceptTask{} = P) ->
	Bin_result = binary_write_int( P#pk_GS2U_UpdateAcceptTask.result ),
	Bin_acceptTaskInfo = writeacceptedBaseTask( P#pk_GS2U_UpdateAcceptTask.acceptTaskInfo ),
	[
		<<?CMD_GS2U_UpdateAcceptTask:16/little>>,
		Bin_result,
		Bin_acceptTaskInfo
	];

%GENERATED from file:task.h => GS2U_UpdateTask
packNetMsg(#pk_GS2U_UpdateTask{} = P) ->
	Bin_info = writetaskInfo( P#pk_GS2U_UpdateTask.info ),
	[
		<<?CMD_GS2U_UpdateTask:16/little>>,
		Bin_info
	];

%GENERATED from file:task.h => U2GS_AcceptTask
packNetMsg(#pk_U2GS_AcceptTask{} = P) ->
	Bin_taskID = binary_write_int( P#pk_U2GS_AcceptTask.taskID ),
	Bin_npcCode = binary_write_uint64( P#pk_U2GS_AcceptTask.npcCode ),
	[
		<<?CMD_U2GS_AcceptTask:16/little>>,
		Bin_taskID,
		Bin_npcCode
	];

%GENERATED from file:task.h => U2GS_CollectObj
packNetMsg(#pk_U2GS_CollectObj{} = P) ->
	Bin_code = binary_write_uint64( P#pk_U2GS_CollectObj.code ),
	[
		<<?CMD_U2GS_CollectObj:16/little>>,
		Bin_code
	];

%GENERATED from file:task.h => U2GS_DropTask
packNetMsg(#pk_U2GS_DropTask{} = P) ->
	Bin_taskID = binary_write_int( P#pk_U2GS_DropTask.taskID ),
	[
		<<?CMD_U2GS_DropTask:16/little>>,
		Bin_taskID
	];

%GENERATED from file:task.h => U2GS_RequestAcceptLoopTask
packNetMsg(#pk_U2GS_RequestAcceptLoopTask{}) ->
	[
		<<?CMD_U2GS_RequestAcceptLoopTask:16/little>>

	];

%GENERATED from file:task.h => U2GS_RequestAcceptTask
packNetMsg(#pk_U2GS_RequestAcceptTask{} = P) ->
	Bin_taskID = binary_write_int( P#pk_U2GS_RequestAcceptTask.taskID ),
	Bin_code = binary_write_uint64( P#pk_U2GS_RequestAcceptTask.code ),
	[
		<<?CMD_U2GS_RequestAcceptTask:16/little>>,
		Bin_taskID,
		Bin_code
	];

%GENERATED from file:task.h => U2GS_RequestCompleteLoopTaskByOneKey
packNetMsg(#pk_U2GS_RequestCompleteLoopTaskByOneKey{}) ->
	[
		<<?CMD_U2GS_RequestCompleteLoopTaskByOneKey:16/little>>

	];

%GENERATED from file:task.h => U2GS_RequestCompleteOneLoopTaskByOneKey
packNetMsg(#pk_U2GS_RequestCompleteOneLoopTaskByOneKey{}) ->
	[
		<<?CMD_U2GS_RequestCompleteOneLoopTaskByOneKey:16/little>>

	];

%GENERATED from file:task.h => U2GS_ResetTask
packNetMsg(#pk_U2GS_ResetTask{} = P) ->
	Bin_taskID = binary_write_int( P#pk_U2GS_ResetTask.taskID ),
	[
		<<?CMD_U2GS_ResetTask:16/little>>,
		Bin_taskID
	];

%GENERATED from file:task.h => U2GS_SumbitTask
packNetMsg(#pk_U2GS_SumbitTask{} = P) ->
	Bin_taskID = binary_write_int( P#pk_U2GS_SumbitTask.taskID ),
	Bin_code = binary_write_uint64( P#pk_U2GS_SumbitTask.code ),
	[
		<<?CMD_U2GS_SumbitTask:16/little>>,
		Bin_taskID,
		Bin_code
	];

%GENERATED from file:task.h => U2GS_TalkToNpc
packNetMsg(#pk_U2GS_TalkToNpc{} = P) ->
	Bin_code = binary_write_uint64( P#pk_U2GS_TalkToNpc.code ),
	[
		<<?CMD_U2GS_TalkToNpc:16/little>>,
		Bin_code
	];

%GENERATED from file:task.h => U2GS_TriggerTaskBuff
packNetMsg(#pk_U2GS_TriggerTaskBuff{} = P) ->
	Bin_taskID = binary_write_int( P#pk_U2GS_TriggerTaskBuff.taskID ),
	[
		<<?CMD_U2GS_TriggerTaskBuff:16/little>>,
		Bin_taskID
	];

%GENERATED from file:task.h => U2GS_UseItemObj
packNetMsg(#pk_U2GS_UseItemObj{} = P) ->
	Bin_code = binary_write_uint64( P#pk_U2GS_UseItemObj.code ),
	[
		<<?CMD_U2GS_UseItemObj:16/little>>,
		Bin_code
	];

%GENERATED from file:team.h => GS2U_AddTeamMemberInfo
packNetMsg(#pk_GS2U_AddTeamMemberInfo{} = P) ->
	Bin_teamType = binary_write_uint8( P#pk_GS2U_AddTeamMemberInfo.teamType ),
	Bin_memberInfo = writeTeamMemberInfo( P#pk_GS2U_AddTeamMemberInfo.memberInfo ),
	[
		<<?CMD_GS2U_AddTeamMemberInfo:16/little>>,
		Bin_teamType,
		Bin_memberInfo
	];

%GENERATED from file:team.h => GS2U_BeenInviteTeam
packNetMsg(#pk_GS2U_BeenInviteTeam{} = P) ->
	Bin_teamType = binary_write_uint8( P#pk_GS2U_BeenInviteTeam.teamType ),
	Bin_inviteType = binary_write_uint8( P#pk_GS2U_BeenInviteTeam.inviteType ),
	Bin_inviterPlayerID = binary_write_uint64( P#pk_GS2U_BeenInviteTeam.inviterPlayerID ),
	Bin_inviterPlayerName = binary_write_string( P#pk_GS2U_BeenInviteTeam.inviterPlayerName ),
	[
		<<?CMD_GS2U_BeenInviteTeam:16/little>>,
		Bin_teamType,
		Bin_inviteType,
		Bin_inviterPlayerID,
		Bin_inviterPlayerName
	];

%GENERATED from file:team.h => GS2U_DelTeammateInfo
packNetMsg(#pk_GS2U_DelTeammateInfo{} = P) ->
	Bin_teamType = binary_write_uint8( P#pk_GS2U_DelTeammateInfo.teamType ),
	Bin_teammateID = binary_write_uint64( P#pk_GS2U_DelTeammateInfo.teammateID ),
	[
		<<?CMD_GS2U_DelTeammateInfo:16/little>>,
		Bin_teamType,
		Bin_teammateID
	];

%GENERATED from file:team.h => GS2U_FastTeamAck
packNetMsg(#pk_GS2U_FastTeamAck{}) ->
	[
		<<?CMD_GS2U_FastTeamAck:16/little>>

	];

%GENERATED from file:team.h => GS2U_FastTeamSucc
packNetMsg(#pk_GS2U_FastTeamSucc{} = P) ->
	Bin_time = binary_write_uint16( P#pk_GS2U_FastTeamSucc.time ),
	[
		<<?CMD_GS2U_FastTeamSucc:16/little>>,
		Bin_time
	];

%GENERATED from file:team.h => GS2U_InviteUJoinTeam
packNetMsg(#pk_GS2U_InviteUJoinTeam{} = P) ->
	Bin_copyMapID = binary_write_int( P#pk_GS2U_InviteUJoinTeam.copyMapID ),
	Bin_inviterPlayerID = binary_write_uint64( P#pk_GS2U_InviteUJoinTeam.inviterPlayerID ),
	Bin_inviterPlayerName = binary_write_string( P#pk_GS2U_InviteUJoinTeam.inviterPlayerName ),
	Bin_guildID = binary_write_uint64( P#pk_GS2U_InviteUJoinTeam.guildID ),
	Bin_guildName = binary_write_string( P#pk_GS2U_InviteUJoinTeam.guildName ),
	Bin_friendState = binary_write_uint8( P#pk_GS2U_InviteUJoinTeam.friendState ),
	[
		<<?CMD_GS2U_InviteUJoinTeam:16/little>>,
		Bin_copyMapID,
		Bin_inviterPlayerID,
		Bin_inviterPlayerName,
		Bin_guildID,
		Bin_guildName,
		Bin_friendState
	];

%GENERATED from file:team.h => GS2U_KickOutByLeader
packNetMsg(#pk_GS2U_KickOutByLeader{} = P) ->
	Bin_teamType = binary_write_uint8( P#pk_GS2U_KickOutByLeader.teamType ),
	[
		<<?CMD_GS2U_KickOutByLeader:16/little>>,
		Bin_teamType
	];

%GENERATED from file:team.h => GS2U_MyTeamInfo
packNetMsg(#pk_GS2U_MyTeamInfo{} = P) ->
	Bin_base = writeTeamBaseInfo( P#pk_GS2U_MyTeamInfo.base ),
	Bin_infos = binary_write_array(P#pk_GS2U_MyTeamInfo.infos, fun(X) -> writeTeamMemberInfo( X ) end),
	[
		<<?CMD_GS2U_MyTeamInfo:16/little>>,
		Bin_base,
		Bin_infos
	];

%GENERATED from file:team.h => GS2U_NearTeamInfo
packNetMsg(#pk_GS2U_NearTeamInfo{} = P) ->
	Bin_teamType = binary_write_uint8( P#pk_GS2U_NearTeamInfo.teamType ),
	Bin_teamInfoList = binary_write_array(P#pk_GS2U_NearTeamInfo.teamInfoList, fun(X) -> writeNearTeamInfo( X ) end),
	[
		<<?CMD_GS2U_NearTeamInfo:16/little>>,
		Bin_teamType,
		Bin_teamInfoList
	];

%GENERATED from file:team.h => GS2U_NearbyPlayer_Ack
packNetMsg(#pk_GS2U_NearbyPlayer_Ack{} = P) ->
	Bin_list = binary_write_array(P#pk_GS2U_NearbyPlayer_Ack.list, fun(X) -> writeNotTeamMemberInfo( X ) end),
	[
		<<?CMD_GS2U_NearbyPlayer_Ack:16/little>>,
		Bin_list
	];

%GENERATED from file:team.h => GS2U_NewMemberJoin
packNetMsg(#pk_GS2U_NewMemberJoin{} = P) ->
	Bin_info = writeTeamMemberInfo( P#pk_GS2U_NewMemberJoin.info ),
	[
		<<?CMD_GS2U_NewMemberJoin:16/little>>,
		Bin_info
	];

%GENERATED from file:team.h => GS2U_QueryRoleListAck
packNetMsg(#pk_GS2U_QueryRoleListAck{} = P) ->
	Bin_queryType = binary_write_int( P#pk_GS2U_QueryRoleListAck.queryType ),
	Bin_playerList = binary_write_array(P#pk_GS2U_QueryRoleListAck.playerList, fun(X) -> writeOnlineMemberSnapshot( X ) end),
	[
		<<?CMD_GS2U_QueryRoleListAck:16/little>>,
		Bin_queryType,
		Bin_playerList
	];

%GENERATED from file:team.h => GS2U_QueryTeamListAck
packNetMsg(#pk_GS2U_QueryTeamListAck{} = P) ->
	Bin_teamSnapshot = binary_write_array(P#pk_GS2U_QueryTeamListAck.teamSnapshot, fun(X) -> writeTeamSnapshot( X ) end),
	[
		<<?CMD_GS2U_QueryTeamListAck:16/little>>,
		Bin_teamSnapshot
	];

%GENERATED from file:team.h => GS2U_QuickTeamMatchAck
packNetMsg(#pk_GS2U_QuickTeamMatchAck{} = P) ->
	Bin_result = binary_write_int( P#pk_GS2U_QuickTeamMatchAck.result ),
	Bin_startTime = binary_write_uint64( P#pk_GS2U_QuickTeamMatchAck.startTime ),
	[
		<<?CMD_GS2U_QuickTeamMatchAck:16/little>>,
		Bin_result,
		Bin_startTime
	];

%GENERATED from file:team.h => GS2U_RequestFightingCapacity
packNetMsg(#pk_GS2U_RequestFightingCapacity{} = P) ->
	Bin_fightingCapacityInfos = binary_write_array(P#pk_GS2U_RequestFightingCapacity.fightingCapacityInfos, fun(X) -> writeFightingCapacityInfo( X ) end),
	[
		<<?CMD_GS2U_RequestFightingCapacity:16/little>>,
		Bin_fightingCapacityInfos
	];

%GENERATED from file:team.h => GS2U_TeamChangeLeader
packNetMsg(#pk_GS2U_TeamChangeLeader{} = P) ->
	Bin_teamType = binary_write_uint8( P#pk_GS2U_TeamChangeLeader.teamType ),
	Bin_newLeaderID = binary_write_uint64( P#pk_GS2U_TeamChangeLeader.newLeaderID ),
	[
		<<?CMD_GS2U_TeamChangeLeader:16/little>>,
		Bin_teamType,
		Bin_newLeaderID
	];

%GENERATED from file:team.h => GS2U_TeamDisbanded
packNetMsg(#pk_GS2U_TeamDisbanded{} = P) ->
	Bin_teamType = binary_write_uint8( P#pk_GS2U_TeamDisbanded.teamType ),
	[
		<<?CMD_GS2U_TeamDisbanded:16/little>>,
		Bin_teamType
	];

%GENERATED from file:team.h => GS2U_TeamInfo
packNetMsg(#pk_GS2U_TeamInfo{} = P) ->
	Bin_teamType = binary_write_uint8( P#pk_GS2U_TeamInfo.teamType ),
	Bin_teamID = binary_write_int64( P#pk_GS2U_TeamInfo.teamID ),
	Bin_leaderID = binary_write_uint64( P#pk_GS2U_TeamInfo.leaderID ),
	Bin_info_list = binary_write_array(P#pk_GS2U_TeamInfo.info_list, fun(X) -> writeTeamMemberInfo( X ) end),
	Bin_customProp = binary_write_string( P#pk_GS2U_TeamInfo.customProp ),
	[
		<<?CMD_GS2U_TeamInfo:16/little>>,
		Bin_teamType,
		Bin_teamID,
		Bin_leaderID,
		Bin_info_list,
		Bin_customProp
	];

%GENERATED from file:team.h => GS2U_TeamLeaderStartCopymap
packNetMsg(#pk_GS2U_TeamLeaderStartCopymap{} = P) ->
	Bin_copyMapID = binary_write_int( P#pk_GS2U_TeamLeaderStartCopymap.copyMapID ),
	[
		<<?CMD_GS2U_TeamLeaderStartCopymap:16/little>>,
		Bin_copyMapID
	];

%GENERATED from file:team.h => GS2U_TeamMemberExtInfo
packNetMsg(#pk_GS2U_TeamMemberExtInfo{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_GS2U_TeamMemberExtInfo.roleID ),
	Bin_level = binary_write_uint16( P#pk_GS2U_TeamMemberExtInfo.level ),
	Bin_hpPC = binary_write_uint8( P#pk_GS2U_TeamMemberExtInfo.hpPC ),
	Bin_mapID = binary_write_uint16( P#pk_GS2U_TeamMemberExtInfo.mapID ),
	[
		<<?CMD_GS2U_TeamMemberExtInfo:16/little>>,
		Bin_roleID,
		Bin_level,
		Bin_hpPC,
		Bin_mapID
	];

%GENERATED from file:team.h => GS2U_TeamMemberOffline
packNetMsg(#pk_GS2U_TeamMemberOffline{} = P) ->
	Bin_teamType = binary_write_uint8( P#pk_GS2U_TeamMemberOffline.teamType ),
	Bin_playerID = binary_write_uint64( P#pk_GS2U_TeamMemberOffline.playerID ),
	[
		<<?CMD_GS2U_TeamMemberOffline:16/little>>,
		Bin_teamType,
		Bin_playerID
	];

%GENERATED from file:team.h => GS2U_TeamMemberOnline
packNetMsg(#pk_GS2U_TeamMemberOnline{} = P) ->
	Bin_teamType = binary_write_uint8( P#pk_GS2U_TeamMemberOnline.teamType ),
	Bin_playerID = binary_write_uint64( P#pk_GS2U_TeamMemberOnline.playerID ),
	Bin_code = binary_write_uint64( P#pk_GS2U_TeamMemberOnline.code ),
	Bin_level = binary_write_uint16( P#pk_GS2U_TeamMemberOnline.level ),
	[
		<<?CMD_GS2U_TeamMemberOnline:16/little>>,
		Bin_teamType,
		Bin_playerID,
		Bin_code,
		Bin_level
	];

%GENERATED from file:team.h => GS2U_TeamMemberOnlineState
packNetMsg(#pk_GS2U_TeamMemberOnlineState{} = P) ->
	Bin_playerID = binary_write_uint64( P#pk_GS2U_TeamMemberOnlineState.playerID ),
	Bin_state = binary_write_int( P#pk_GS2U_TeamMemberOnlineState.state ),
	[
		<<?CMD_GS2U_TeamMemberOnlineState:16/little>>,
		Bin_playerID,
		Bin_state
	];

%GENERATED from file:team.h => GS2U_TeamReset
packNetMsg(#pk_GS2U_TeamReset{} = P) ->
	Bin_reason = binary_write_int( P#pk_GS2U_TeamReset.reason ),
	[
		<<?CMD_GS2U_TeamReset:16/little>>,
		Bin_reason
	];

%GENERATED from file:team.h => GS2U_TeammateLeave
packNetMsg(#pk_GS2U_TeammateLeave{} = P) ->
	Bin_teammateID = binary_write_uint64( P#pk_GS2U_TeammateLeave.teammateID ),
	[
		<<?CMD_GS2U_TeammateLeave:16/little>>,
		Bin_teammateID
	];

%GENERATED from file:team.h => GS2U_TeammateLeaveAwayTeam
packNetMsg(#pk_GS2U_TeammateLeaveAwayTeam{} = P) ->
	Bin_teamType = binary_write_uint8( P#pk_GS2U_TeammateLeaveAwayTeam.teamType ),
	Bin_teammateID = binary_write_uint64( P#pk_GS2U_TeammateLeaveAwayTeam.teammateID ),
	[
		<<?CMD_GS2U_TeammateLeaveAwayTeam:16/little>>,
		Bin_teamType,
		Bin_teammateID
	];

%GENERATED from file:team.h => GS2U_TeammateLocation
packNetMsg(#pk_GS2U_TeammateLocation{} = P) ->
	Bin_teammateLocations = binary_write_array(P#pk_GS2U_TeammateLocation.teammateLocations, fun(X) -> writeTeamMemberLocation( X ) end),
	[
		<<?CMD_GS2U_TeammateLocation:16/little>>,
		Bin_teammateLocations
	];

%GENERATED from file:team.h => GS2U_TeammateStartCopymapAck
packNetMsg(#pk_GS2U_TeammateStartCopymapAck{} = P) ->
	Bin_playerID = binary_write_uint64( P#pk_GS2U_TeammateStartCopymapAck.playerID ),
	Bin_isAgree = binary_write_uint8( P#pk_GS2U_TeammateStartCopymapAck.isAgree ),
	[
		<<?CMD_GS2U_TeammateStartCopymapAck:16/little>>,
		Bin_playerID,
		Bin_isAgree
	];

%GENERATED from file:team.h => GS2U_UpdateMemberExInfo
packNetMsg(#pk_GS2U_UpdateMemberExInfo{} = P) ->
	Bin_infoEx = writeTeamMemberInfoEx( P#pk_GS2U_UpdateMemberExInfo.infoEx ),
	[
		<<?CMD_GS2U_UpdateMemberExInfo:16/little>>,
		Bin_infoEx
	];

%GENERATED from file:team.h => GS2U_UpdateTeamInfo
packNetMsg(#pk_GS2U_UpdateTeamInfo{} = P) ->
	Bin_base = writeTeamBaseInfo( P#pk_GS2U_UpdateTeamInfo.base ),
	[
		<<?CMD_GS2U_UpdateTeamInfo:16/little>>,
		Bin_base
	];

%GENERATED from file:team.h => U2GS_AckInviteJoinTeam
packNetMsg(#pk_U2GS_AckInviteJoinTeam{} = P) ->
	Bin_isAgree = binary_write_uint8( P#pk_U2GS_AckInviteJoinTeam.isAgree ),
	Bin_inviterPlayerID = binary_write_uint64( P#pk_U2GS_AckInviteJoinTeam.inviterPlayerID ),
	[
		<<?CMD_U2GS_AckInviteJoinTeam:16/little>>,
		Bin_isAgree,
		Bin_inviterPlayerID
	];

%GENERATED from file:team.h => U2GS_AckInviteTeam
packNetMsg(#pk_U2GS_AckInviteTeam{} = P) ->
	Bin_teamType = binary_write_uint8( P#pk_U2GS_AckInviteTeam.teamType ),
	Bin_isAgree = binary_write_uint8( P#pk_U2GS_AckInviteTeam.isAgree ),
	Bin_inviteType = binary_write_uint8( P#pk_U2GS_AckInviteTeam.inviteType ),
	Bin_inviterPlayerID = binary_write_uint64( P#pk_U2GS_AckInviteTeam.inviterPlayerID ),
	[
		<<?CMD_U2GS_AckInviteTeam:16/little>>,
		Bin_teamType,
		Bin_isAgree,
		Bin_inviteType,
		Bin_inviterPlayerID
	];

%GENERATED from file:team.h => U2GS_CancelFastTeam
packNetMsg(#pk_U2GS_CancelFastTeam{}) ->
	[
		<<?CMD_U2GS_CancelFastTeam:16/little>>

	];

%GENERATED from file:team.h => U2GS_IsOpenMapPanel
packNetMsg(#pk_U2GS_IsOpenMapPanel{} = P) ->
	Bin_isOpen = binary_write_bool( P#pk_U2GS_IsOpenMapPanel.isOpen ),
	[
		<<?CMD_U2GS_IsOpenMapPanel:16/little>>,
		Bin_isOpen
	];

%GENERATED from file:team.h => U2GS_LeaveAwayTeam
packNetMsg(#pk_U2GS_LeaveAwayTeam{} = P) ->
	Bin_teamType = binary_write_uint8( P#pk_U2GS_LeaveAwayTeam.teamType ),
	Bin_id = binary_write_uint8( P#pk_U2GS_LeaveAwayTeam.id ),
	[
		<<?CMD_U2GS_LeaveAwayTeam:16/little>>,
		Bin_teamType,
		Bin_id
	];

%GENERATED from file:team.h => U2GS_NearbyPlayer_Request
packNetMsg(#pk_U2GS_NearbyPlayer_Request{}) ->
	[
		<<?CMD_U2GS_NearbyPlayer_Request:16/little>>

	];

%GENERATED from file:team.h => U2GS_OperateTeam
packNetMsg(#pk_U2GS_OperateTeam{} = P) ->
	Bin_teamType = binary_write_uint8( P#pk_U2GS_OperateTeam.teamType ),
	Bin_operateType = binary_write_uint8( P#pk_U2GS_OperateTeam.operateType ),
	Bin_operatedID = binary_write_uint64( P#pk_U2GS_OperateTeam.operatedID ),
	[
		<<?CMD_U2GS_OperateTeam:16/little>>,
		Bin_teamType,
		Bin_operateType,
		Bin_operatedID
	];

%GENERATED from file:team.h => U2GS_QueryRoleList
packNetMsg(#pk_U2GS_QueryRoleList{} = P) ->
	Bin_queryType = binary_write_int( P#pk_U2GS_QueryRoleList.queryType ),
	[
		<<?CMD_U2GS_QueryRoleList:16/little>>,
		Bin_queryType
	];

%GENERATED from file:team.h => U2GS_QueryTeamList
packNetMsg(#pk_U2GS_QueryTeamList{} = P) ->
	Bin_mapIDList = binary_write_array(P#pk_U2GS_QueryTeamList.mapIDList, fun(X) -> binary_write_int( X ) end),
	[
		<<?CMD_U2GS_QueryTeamList:16/little>>,
		Bin_mapIDList
	];

%GENERATED from file:team.h => U2GS_QuickJoinTeam
packNetMsg(#pk_U2GS_QuickJoinTeam{} = P) ->
	Bin_roleID = binary_write_uint64( P#pk_U2GS_QuickJoinTeam.roleID ),
	Bin_mapID = binary_write_uint( P#pk_U2GS_QuickJoinTeam.mapID ),
	[
		<<?CMD_U2GS_QuickJoinTeam:16/little>>,
		Bin_roleID,
		Bin_mapID
	];

%GENERATED from file:team.h => U2GS_QuickTeamMatch
packNetMsg(#pk_U2GS_QuickTeamMatch{} = P) ->
	Bin_mapList = binary_write_array(P#pk_U2GS_QuickTeamMatch.mapList, fun(X) -> binary_write_uint16( X ) end),
	[
		<<?CMD_U2GS_QuickTeamMatch:16/little>>,
		Bin_mapList
	];

%GENERATED from file:team.h => U2GS_QuickTeamStart
packNetMsg(#pk_U2GS_QuickTeamStart{} = P) ->
	Bin_mapID = binary_write_uint( P#pk_U2GS_QuickTeamStart.mapID ),
	[
		<<?CMD_U2GS_QuickTeamStart:16/little>>,
		Bin_mapID
	];

%GENERATED from file:team.h => U2GS_RequestFightingCapacity
packNetMsg(#pk_U2GS_RequestFightingCapacity{}) ->
	[
		<<?CMD_U2GS_RequestFightingCapacity:16/little>>

	];

%GENERATED from file:team.h => U2GS_RequestNearByTeamInfo
packNetMsg(#pk_U2GS_RequestNearByTeamInfo{} = P) ->
	Bin_teamType = binary_write_uint8( P#pk_U2GS_RequestNearByTeamInfo.teamType ),
	[
		<<?CMD_U2GS_RequestNearByTeamInfo:16/little>>,
		Bin_teamType
	];

%GENERATED from file:team.h => U2GS_TeamOp
packNetMsg(#pk_U2GS_TeamOp{} = P) ->
	Bin_operateType = binary_write_uint8( P#pk_U2GS_TeamOp.operateType ),
	Bin_operatedID = binary_write_uint64( P#pk_U2GS_TeamOp.operatedID ),
	Bin_param1 = binary_write_uint64( P#pk_U2GS_TeamOp.param1 ),
	[
		<<?CMD_U2GS_TeamOp:16/little>>,
		Bin_operateType,
		Bin_operatedID,
		Bin_param1
	];

%GENERATED from file:trade.h => GS2U_DealRecord
packNetMsg(#pk_GS2U_DealRecord{} = P) ->
	Bin_opCode = binary_write_uint8( P#pk_GS2U_DealRecord.opCode ),
	Bin_number = binary_write_uint( P#pk_GS2U_DealRecord.number ),
	Bin_dealRecord = binary_write_array(P#pk_GS2U_DealRecord.dealRecord, fun(X) -> writeDealRecord( X ) end),
	[
		<<?CMD_GS2U_DealRecord:16/little>>,
		Bin_opCode,
		Bin_number,
		Bin_dealRecord
	];

%GENERATED from file:trade.h => GS2U_OpTradeResult
packNetMsg(#pk_GS2U_OpTradeResult{} = P) ->
	Bin_tradeClass = binary_write_uint8( P#pk_GS2U_OpTradeResult.tradeClass ),
	Bin_orderID = binary_write_uint64( P#pk_GS2U_OpTradeResult.orderID ),
	Bin_result = binary_write_uint8( P#pk_GS2U_OpTradeResult.result ),
	Bin_opCode = binary_write_uint8( P#pk_GS2U_OpTradeResult.opCode ),
	[
		<<?CMD_GS2U_OpTradeResult:16/little>>,
		Bin_tradeClass,
		Bin_orderID,
		Bin_result,
		Bin_opCode
	];

%GENERATED from file:trade.h => GS2U_QueryTrade
packNetMsg(#pk_GS2U_QueryTrade{} = P) ->
	Bin_opCode = binary_write_uint8( P#pk_GS2U_QueryTrade.opCode ),
	Bin_sortType = binary_write_uint8( P#pk_GS2U_QueryTrade.sortType ),
	Bin_sortIndex = binary_write_uint8( P#pk_GS2U_QueryTrade.sortIndex ),
	Bin_pageNumber = binary_write_uint( P#pk_GS2U_QueryTrade.pageNumber ),
	Bin_nowTime = binary_write_uint64( P#pk_GS2U_QueryTrade.nowTime ),
	Bin_queryTradeList = binary_write_array(P#pk_GS2U_QueryTrade.queryTradeList, fun(X) -> writeQueryTradeList( X ) end),
	[
		<<?CMD_GS2U_QueryTrade:16/little>>,
		Bin_opCode,
		Bin_sortType,
		Bin_sortIndex,
		Bin_pageNumber,
		Bin_nowTime,
		Bin_queryTradeList
	];

%GENERATED from file:trade.h => GS2U_QueryTradeInfo
packNetMsg(#pk_GS2U_QueryTradeInfo{} = P) ->
	Bin_opCode = binary_write_uint8( P#pk_GS2U_QueryTradeInfo.opCode ),
	Bin_tradeClass = binary_write_uint8( P#pk_GS2U_QueryTradeInfo.tradeClass ),
	Bin_itemClass = binary_write_uint8( P#pk_GS2U_QueryTradeInfo.itemClass ),
	Bin_itemTypeList = binary_write_array(P#pk_GS2U_QueryTradeInfo.itemTypeList, fun(X) -> binary_write_int8( X ) end),
	Bin_itemSubType = binary_write_int8( P#pk_GS2U_QueryTradeInfo.itemSubType ),
	Bin_allNumber = binary_write_int( P#pk_GS2U_QueryTradeInfo.allNumber ),
	[
		<<?CMD_GS2U_QueryTradeInfo:16/little>>,
		Bin_opCode,
		Bin_tradeClass,
		Bin_itemClass,
		Bin_itemTypeList,
		Bin_itemSubType,
		Bin_allNumber
	];

%GENERATED from file:trade.h => GS2U_ReferenceItem
packNetMsg(#pk_GS2U_ReferenceItem{} = P) ->
	Bin_tradeClass = binary_write_uint8( P#pk_GS2U_ReferenceItem.tradeClass ),
	Bin_referenceItems = binary_write_array(P#pk_GS2U_ReferenceItem.referenceItems, fun(X) -> writeReferenceItem( X ) end),
	Bin_referenceItem = writeReferenceItem( P#pk_GS2U_ReferenceItem.referenceItem ),
	[
		<<?CMD_GS2U_ReferenceItem:16/little>>,
		Bin_tradeClass,
		Bin_referenceItems,
		Bin_referenceItem
	];

%GENERATED from file:trade.h => U2GS_DownTrade
packNetMsg(#pk_U2GS_DownTrade{} = P) ->
	Bin_tradeClass = binary_write_uint8( P#pk_U2GS_DownTrade.tradeClass ),
	Bin_orderID = binary_write_uint64( P#pk_U2GS_DownTrade.orderID ),
	Bin_opCode = binary_write_uint8( P#pk_U2GS_DownTrade.opCode ),
	[
		<<?CMD_U2GS_DownTrade:16/little>>,
		Bin_tradeClass,
		Bin_orderID,
		Bin_opCode
	];

%GENERATED from file:trade.h => U2GS_NextResult
packNetMsg(#pk_U2GS_NextResult{} = P) ->
	Bin_pageNumber = binary_write_uint( P#pk_U2GS_NextResult.pageNumber ),
	Bin_opCode = binary_write_uint8( P#pk_U2GS_NextResult.opCode ),
	[
		<<?CMD_U2GS_NextResult:16/little>>,
		Bin_pageNumber,
		Bin_opCode
	];

%GENERATED from file:trade.h => U2GS_PutTrade
packNetMsg(#pk_U2GS_PutTrade{} = P) ->
	Bin_tradeClass = binary_write_uint8( P#pk_U2GS_PutTrade.tradeClass ),
	Bin_itemUID = binary_write_uint64( P#pk_U2GS_PutTrade.itemUID ),
	Bin_itemID = binary_write_uint( P#pk_U2GS_PutTrade.itemID ),
	Bin_sellNumber = binary_write_uint16( P#pk_U2GS_PutTrade.sellNumber ),
	Bin_sellTime = binary_write_uint8( P#pk_U2GS_PutTrade.sellTime ),
	Bin_gold = binary_write_uint( P#pk_U2GS_PutTrade.gold ),
	Bin_diamond = binary_write_uint( P#pk_U2GS_PutTrade.diamond ),
	Bin_destRoleName = binary_write_string( P#pk_U2GS_PutTrade.destRoleName ),
	Bin_opCode = binary_write_uint8( P#pk_U2GS_PutTrade.opCode ),
	[
		<<?CMD_U2GS_PutTrade:16/little>>,
		Bin_tradeClass,
		Bin_itemUID,
		Bin_itemID,
		Bin_sellNumber,
		Bin_sellTime,
		Bin_gold,
		Bin_diamond,
		Bin_destRoleName,
		Bin_opCode
	];

%GENERATED from file:trade.h => U2GS_QueryNewestTrade
packNetMsg(#pk_U2GS_QueryNewestTrade{} = P) ->
	Bin_tradeClass = binary_write_uint8( P#pk_U2GS_QueryNewestTrade.tradeClass ),
	Bin_getNumber = binary_write_uint8( P#pk_U2GS_QueryNewestTrade.getNumber ),
	Bin_oneNumber = binary_write_int8( P#pk_U2GS_QueryNewestTrade.oneNumber ),
	Bin_opCode = binary_write_uint8( P#pk_U2GS_QueryNewestTrade.opCode ),
	[
		<<?CMD_U2GS_QueryNewestTrade:16/little>>,
		Bin_tradeClass,
		Bin_getNumber,
		Bin_oneNumber,
		Bin_opCode
	];

%GENERATED from file:trade.h => U2GS_QuerySelfTrade
packNetMsg(#pk_U2GS_QuerySelfTrade{} = P) ->
	Bin_tradeClass = binary_write_uint8( P#pk_U2GS_QuerySelfTrade.tradeClass ),
	Bin_opCode = binary_write_uint8( P#pk_U2GS_QuerySelfTrade.opCode ),
	[
		<<?CMD_U2GS_QuerySelfTrade:16/little>>,
		Bin_tradeClass,
		Bin_opCode
	];

%GENERATED from file:trade.h => U2GS_QueryTrade
packNetMsg(#pk_U2GS_QueryTrade{} = P) ->
	Bin_tradeClass = binary_write_uint8( P#pk_U2GS_QueryTrade.tradeClass ),
	Bin_itemClass = binary_write_uint8( P#pk_U2GS_QueryTrade.itemClass ),
	Bin_itemTypeList = binary_write_array(P#pk_U2GS_QueryTrade.itemTypeList, fun(X) -> binary_write_int8( X ) end),
	Bin_itemSubType = binary_write_int8( P#pk_U2GS_QueryTrade.itemSubType ),
	Bin_itemList = binary_write_array(P#pk_U2GS_QueryTrade.itemList, fun(X) -> binary_write_string( X ) end),
	Bin_career = binary_write_int16( P#pk_U2GS_QueryTrade.career ),
	Bin_itemLvlMin = binary_write_int8( P#pk_U2GS_QueryTrade.itemLvlMin ),
	Bin_itemLvlMax = binary_write_int8( P#pk_U2GS_QueryTrade.itemLvlMax ),
	Bin_itemQuality = binary_write_int8( P#pk_U2GS_QueryTrade.itemQuality ),
	Bin_oneNumber = binary_write_int8( P#pk_U2GS_QueryTrade.oneNumber ),
	Bin_opCode = binary_write_uint8( P#pk_U2GS_QueryTrade.opCode ),
	[
		<<?CMD_U2GS_QueryTrade:16/little>>,
		Bin_tradeClass,
		Bin_itemClass,
		Bin_itemTypeList,
		Bin_itemSubType,
		Bin_itemList,
		Bin_career,
		Bin_itemLvlMin,
		Bin_itemLvlMax,
		Bin_itemQuality,
		Bin_oneNumber,
		Bin_opCode
	];

%GENERATED from file:trade.h => U2GS_ReferenceItem
packNetMsg(#pk_U2GS_ReferenceItem{} = P) ->
	Bin_tradeClass = binary_write_uint8( P#pk_U2GS_ReferenceItem.tradeClass ),
	Bin_itemID = binary_write_uint( P#pk_U2GS_ReferenceItem.itemID ),
	Bin_requestNumber = binary_write_uint16( P#pk_U2GS_ReferenceItem.requestNumber ),
	[
		<<?CMD_U2GS_ReferenceItem:16/little>>,
		Bin_tradeClass,
		Bin_itemID,
		Bin_requestNumber
	];

%GENERATED from file:trade.h => U2GS_RequestDealRecord
packNetMsg(#pk_U2GS_RequestDealRecord{} = P) ->
	Bin_oneNumber = binary_write_int8( P#pk_U2GS_RequestDealRecord.oneNumber ),
	Bin_pageNumber = binary_write_uint8( P#pk_U2GS_RequestDealRecord.pageNumber ),
	Bin_opCode = binary_write_uint8( P#pk_U2GS_RequestDealRecord.opCode ),
	[
		<<?CMD_U2GS_RequestDealRecord:16/little>>,
		Bin_oneNumber,
		Bin_pageNumber,
		Bin_opCode
	];

%GENERATED from file:trade.h => U2GS_ResultSort
packNetMsg(#pk_U2GS_ResultSort{} = P) ->
	Bin_sortIndex = binary_write_uint8( P#pk_U2GS_ResultSort.sortIndex ),
	Bin_pageNumber = binary_write_uint( P#pk_U2GS_ResultSort.pageNumber ),
	Bin_sortType = binary_write_uint8( P#pk_U2GS_ResultSort.sortType ),
	Bin_opCode = binary_write_uint8( P#pk_U2GS_ResultSort.opCode ),
	[
		<<?CMD_U2GS_ResultSort:16/little>>,
		Bin_sortIndex,
		Bin_pageNumber,
		Bin_sortType,
		Bin_opCode
	];

%GENERATED from file:trade.h => U2GS_TradeBuy
packNetMsg(#pk_U2GS_TradeBuy{} = P) ->
	Bin_tradeClass = binary_write_uint8( P#pk_U2GS_TradeBuy.tradeClass ),
	Bin_orderID = binary_write_uint64( P#pk_U2GS_TradeBuy.orderID ),
	Bin_opCode = binary_write_uint8( P#pk_U2GS_TradeBuy.opCode ),
	[
		<<?CMD_U2GS_TradeBuy:16/little>>,
		Bin_tradeClass,
		Bin_orderID,
		Bin_opCode
	];

%GENERATED from file:trade.h => U2GS_TradeRefuse
packNetMsg(#pk_U2GS_TradeRefuse{} = P) ->
	Bin_tradeClass = binary_write_uint8( P#pk_U2GS_TradeRefuse.tradeClass ),
	Bin_orderID = binary_write_uint64( P#pk_U2GS_TradeRefuse.orderID ),
	Bin_opCode = binary_write_uint8( P#pk_U2GS_TradeRefuse.opCode ),
	[
		<<?CMD_U2GS_TradeRefuse:16/little>>,
		Bin_tradeClass,
		Bin_orderID,
		Bin_opCode
	];

%GENERATED from file:wake.h => GS2U_GoddessActiveSkill
packNetMsg(#pk_GS2U_GoddessActiveSkill{} = P) ->
	Bin_skillID = binary_write_uint( P#pk_GS2U_GoddessActiveSkill.skillID ),
	[
		<<?CMD_GS2U_GoddessActiveSkill:16/little>>,
		Bin_skillID
	];

%GENERATED from file:wake.h => GS2U_WakeInfo
packNetMsg(#pk_GS2U_WakeInfo{} = P) ->
	Bin_wakeInfo = writeWakeInfo( P#pk_GS2U_WakeInfo.wakeInfo ),
	[
		<<?CMD_GS2U_WakeInfo:16/little>>,
		Bin_wakeInfo
	];

%GENERATED from file:wake.h => GS2U_WakeInfoList
packNetMsg(#pk_GS2U_WakeInfoList{} = P) ->
	Bin_wakeInfoList = binary_write_array(P#pk_GS2U_WakeInfoList.wakeInfoList, fun(X) -> writeWakeInfo( X ) end),
	[
		<<?CMD_GS2U_WakeInfoList:16/little>>,
		Bin_wakeInfoList
	];

%GENERATED from file:wake.h => U2GS_CallGoddess
packNetMsg(#pk_U2GS_CallGoddess{} = P) ->
	Bin_cardID = binary_write_uint8( P#pk_U2GS_CallGoddess.cardID ),
	[
		<<?CMD_U2GS_CallGoddess:16/little>>,
		Bin_cardID
	];

%GENERATED from file:wake.h => U2GS_ChangeState
packNetMsg(#pk_U2GS_ChangeState{} = P) ->
	Bin_cardID = binary_write_uint8( P#pk_U2GS_ChangeState.cardID ),
	Bin_state = binary_write_uint8( P#pk_U2GS_ChangeState.state ),
	[
		<<?CMD_U2GS_ChangeState:16/little>>,
		Bin_cardID,
		Bin_state
	];

%GENERATED from file:wake.h => U2GS_OnKeyUpWakeInfo
packNetMsg(#pk_U2GS_OnKeyUpWakeInfo{} = P) ->
	Bin_cardID = binary_write_uint8( P#pk_U2GS_OnKeyUpWakeInfo.cardID ),
	[
		<<?CMD_U2GS_OnKeyUpWakeInfo:16/little>>,
		Bin_cardID
	];

%GENERATED from file:wake.h => U2GS_UnlockCard
packNetMsg(#pk_U2GS_UnlockCard{} = P) ->
	Bin_cardID = binary_write_uint8( P#pk_U2GS_UnlockCard.cardID ),
	[
		<<?CMD_U2GS_UnlockCard:16/little>>,
		Bin_cardID
	];

%GENERATED from file:wake.h => U2GS_UnlockState
packNetMsg(#pk_U2GS_UnlockState{} = P) ->
	Bin_cardID = binary_write_uint8( P#pk_U2GS_UnlockState.cardID ),
	Bin_state = binary_write_uint8( P#pk_U2GS_UnlockState.state ),
	[
		<<?CMD_U2GS_UnlockState:16/little>>,
		Bin_cardID,
		Bin_state
	];

%GENERATED from file:wake.h => U2GS_UpGradeWakeInfo
packNetMsg(#pk_U2GS_UpGradeWakeInfo{} = P) ->
	Bin_cardID = binary_write_uint8( P#pk_U2GS_UpGradeWakeInfo.cardID ),
	[
		<<?CMD_U2GS_UpGradeWakeInfo:16/little>>,
		Bin_cardID
	];

%GENERATED from file:wake.h => U2GS_UpWakeInfo
packNetMsg(#pk_U2GS_UpWakeInfo{} = P) ->
	Bin_cardID = binary_write_uint8( P#pk_U2GS_UpWakeInfo.cardID ),
	Bin_num = binary_write_uint16( P#pk_U2GS_UpWakeInfo.num ),
	[
		<<?CMD_U2GS_UpWakeInfo:16/little>>,
		Bin_cardID,
		Bin_num
	];

%GENERATED from file:warriortrial.h => GS2U_InitWarriorTrialAck
packNetMsg(#pk_GS2U_InitWarriorTrialAck{} = P) ->
	Bin_record = binary_write_uint16( P#pk_GS2U_InitWarriorTrialAck.record ),
	Bin_cur = binary_write_uint16( P#pk_GS2U_InitWarriorTrialAck.cur ),
	Bin_max = binary_write_uint16( P#pk_GS2U_InitWarriorTrialAck.max ),
	Bin_coin = binary_write_uint( P#pk_GS2U_InitWarriorTrialAck.coin ),
	[
		<<?CMD_GS2U_InitWarriorTrialAck:16/little>>,
		Bin_record,
		Bin_cur,
		Bin_max,
		Bin_coin
	];

%GENERATED from file:warriortrial.h => GS2U_InitWarriorTrialMissionInfo
packNetMsg(#pk_GS2U_InitWarriorTrialMissionInfo{} = P) ->
	Bin_missionID = binary_write_uint16( P#pk_GS2U_InitWarriorTrialMissionInfo.missionID ),
	Bin_time = binary_write_uint16( P#pk_GS2U_InitWarriorTrialMissionInfo.time ),
	[
		<<?CMD_GS2U_InitWarriorTrialMissionInfo:16/little>>,
		Bin_missionID,
		Bin_time
	];

%GENERATED from file:warriortrial.h => GS2U_SweepWarriorTrialSuccess
packNetMsg(#pk_GS2U_SweepWarriorTrialSuccess{} = P) ->
	Bin_record = binary_write_uint16( P#pk_GS2U_SweepWarriorTrialSuccess.record ),
	Bin_cur = binary_write_uint16( P#pk_GS2U_SweepWarriorTrialSuccess.cur ),
	Bin_coin = binary_write_uint( P#pk_GS2U_SweepWarriorTrialSuccess.coin ),
	[
		<<?CMD_GS2U_SweepWarriorTrialSuccess:16/little>>,
		Bin_record,
		Bin_cur,
		Bin_coin
	];

%GENERATED from file:warriortrial.h => GS2U_WarriorTrialSuccess
packNetMsg(#pk_GS2U_WarriorTrialSuccess{} = P) ->
	Bin_result = binary_write_bool( P#pk_GS2U_WarriorTrialSuccess.result ),
	[
		<<?CMD_GS2U_WarriorTrialSuccess:16/little>>,
		Bin_result
	];

%GENERATED from file:warriortrial.h => U2GS_BeginWarriorTrial
packNetMsg(#pk_U2GS_BeginWarriorTrial{}) ->
	[
		<<?CMD_U2GS_BeginWarriorTrial:16/little>>

	];

%GENERATED from file:warriortrial.h => U2GS_CompleteWarriorTrail
packNetMsg(#pk_U2GS_CompleteWarriorTrail{} = P) ->
	Bin_mapID = binary_write_uint16( P#pk_U2GS_CompleteWarriorTrail.mapID ),
	[
		<<?CMD_U2GS_CompleteWarriorTrail:16/little>>,
		Bin_mapID
	];

%GENERATED from file:warriortrial.h => U2GS_SweepWarriorTrial
packNetMsg(#pk_U2GS_SweepWarriorTrial{} = P) ->
	Bin_mapID = binary_write_uint16( P#pk_U2GS_SweepWarriorTrial.mapID ),
	[
		<<?CMD_U2GS_SweepWarriorTrial:16/little>>,
		Bin_mapID
	];

%GENERATED from file:warriortrial.h => U2GS_WarriorTrialInit
packNetMsg(#pk_U2GS_WarriorTrialInit{}) ->
	[
		<<?CMD_U2GS_WarriorTrialInit:16/little>>

	];

packNetMsg(_) -> 
noMatch.

%GENERATED from file:Date.h => DateMonsterPos
writeDateMonsterPos( #pk_DateMonsterPos{} = P ) ->
	Bin_code = binary_write_uint64( P#pk_DateMonsterPos.code ),
	Bin_x = binary_write_float( P#pk_DateMonsterPos.x ),
	Bin_z = binary_write_float( P#pk_DateMonsterPos.z ),
	[
		Bin_code,
		Bin_x,
		Bin_z	].

%GENERATED from file:LS2User.h => GameServerInfo
writeGameServerInfo( #pk_GameServerInfo{} = P ) ->
	Bin_lineid = binary_write_int16( P#pk_GameServerInfo.lineid ),
	Bin_name = binary_write_string( P#pk_GameServerInfo.name ),
	Bin_ip = binary_write_string( P#pk_GameServerInfo.ip ),
	Bin_port = binary_write_int16( P#pk_GameServerInfo.port ),
	Bin_state = binary_write_int8( P#pk_GameServerInfo.state ),
	[
		Bin_lineid,
		Bin_name,
		Bin_ip,
		Bin_port,
		Bin_state	].

%GENERATED from file:achieve.h => AchieveSchedule
writeAchieveSchedule( #pk_AchieveSchedule{} = P ) ->
	Bin_achieveID = binary_write_uint16( P#pk_AchieveSchedule.achieveID ),
	Bin_scheduleRewardID = binary_write_uint8( P#pk_AchieveSchedule.scheduleRewardID ),
	Bin_scheduleCompleteNum = binary_write_uint( P#pk_AchieveSchedule.scheduleCompleteNum ),
	Bin_scheduleCompleteID = binary_write_uint8( P#pk_AchieveSchedule.scheduleCompleteID ),
	[
		Bin_achieveID,
		Bin_scheduleRewardID,
		Bin_scheduleCompleteNum,
		Bin_scheduleCompleteID	].

%GENERATED from file:achieve.h => BadgeInfo
writeBadgeInfo( #pk_BadgeInfo{} = P ) ->
	Bin_mapID = binary_write_uint16( P#pk_BadgeInfo.mapID ),
	Bin_itemList = binary_write_array(P#pk_BadgeInfo.itemList, fun(X) -> binary_write_uint( X ) end),
	[
		Bin_mapID,
		Bin_itemList	].

%GENERATED from file:achieve.h => DailyActiveInfo
writeDailyActiveInfo( #pk_DailyActiveInfo{} = P ) ->
	Bin_dailyID = binary_write_uint8( P#pk_DailyActiveInfo.dailyID ),
	Bin_curTimes = binary_write_uint8( P#pk_DailyActiveInfo.curTimes ),
	[
		Bin_dailyID,
		Bin_curTimes	].

%GENERATED from file:achieve.h => TitleInfo
writeTitleInfo( #pk_TitleInfo{} = P ) ->
	Bin_titleID = binary_write_uint16( P#pk_TitleInfo.titleID ),
	Bin_endTime = binary_write_uint( P#pk_TitleInfo.endTime ),
	[
		Bin_titleID,
		Bin_endTime	].

%GENERATED from file:activity.h => ActivityAnswerRankData
writeActivityAnswerRankData( #pk_ActivityAnswerRankData{} = P ) ->
	Bin_name = binary_write_string( P#pk_ActivityAnswerRankData.name ),
	Bin_value = binary_write_uint( P#pk_ActivityAnswerRankData.value ),
	[
		Bin_name,
		Bin_value	].

%GENERATED from file:activity.h => AngelInvestmentData
writeAngelInvestmentData( #pk_AngelInvestmentData{} = P ) ->
	Bin_isCanGet = binary_write_bool( P#pk_AngelInvestmentData.isCanGet ),
	Bin_leftNumber = binary_write_uint8( P#pk_AngelInvestmentData.leftNumber ),
	Bin_id = binary_write_uint16( P#pk_AngelInvestmentData.id ),
	[
		Bin_isCanGet,
		Bin_leftNumber,
		Bin_id	].

%GENERATED from file:activity.h => ArenaBattle
writeArenaBattle( #pk_ArenaBattle{} = P ) ->
	Bin_id = binary_write_uint64( P#pk_ArenaBattle.id ),
	Bin_camp = binary_write_uint8( P#pk_ArenaBattle.camp ),
	Bin_name = binary_write_string( P#pk_ArenaBattle.name ),
	Bin_servername = binary_write_string( P#pk_ArenaBattle.servername ),
	Bin_killnum = binary_write_uint8( P#pk_ArenaBattle.killnum ),
	Bin_force = binary_write_uint64( P#pk_ArenaBattle.force ),
	Bin_hurt = binary_write_uint64( P#pk_ArenaBattle.hurt ),
	Bin_arenaVal = binary_write_uint( P#pk_ArenaBattle.arenaVal ),
	[
		Bin_id,
		Bin_camp,
		Bin_name,
		Bin_servername,
		Bin_killnum,
		Bin_force,
		Bin_hurt,
		Bin_arenaVal	].

%GENERATED from file:activity.h => ArenaRole
writeArenaRole( #pk_ArenaRole{} = P ) ->
	Bin_servername = binary_write_string( P#pk_ArenaRole.servername ),
	Bin_name = binary_write_string( P#pk_ArenaRole.name ),
	Bin_id = binary_write_uint64( P#pk_ArenaRole.id ),
	Bin_camp = binary_write_uint8( P#pk_ArenaRole.camp ),
	[
		Bin_servername,
		Bin_name,
		Bin_id,
		Bin_camp	].

%GENERATED from file:activity.h => ArenaTeamMemberInfo
writeArenaTeamMemberInfo( #pk_ArenaTeamMemberInfo{} = P ) ->
	Bin_id = binary_write_uint64( P#pk_ArenaTeamMemberInfo.id ),
	Bin_code = binary_write_uint64( P#pk_ArenaTeamMemberInfo.code ),
	Bin_name = binary_write_string( P#pk_ArenaTeamMemberInfo.name ),
	Bin_isLeader = binary_write_bool( P#pk_ArenaTeamMemberInfo.isLeader ),
	Bin_isPrepare = binary_write_bool( P#pk_ArenaTeamMemberInfo.isPrepare ),
	Bin_level = binary_write_uint8( P#pk_ArenaTeamMemberInfo.level ),
	Bin_career = binary_write_uint( P#pk_ArenaTeamMemberInfo.career ),
	Bin_force = binary_write_uint64( P#pk_ArenaTeamMemberInfo.force ),
	Bin_arenaVal = binary_write_uint( P#pk_ArenaTeamMemberInfo.arenaVal ),
	[
		Bin_id,
		Bin_code,
		Bin_name,
		Bin_isLeader,
		Bin_isPrepare,
		Bin_level,
		Bin_career,
		Bin_force,
		Bin_arenaVal	].

%GENERATED from file:activity.h => ChargeOrUseRuleInfo
writeChargeOrUseRuleInfo( #pk_ChargeOrUseRuleInfo{} = P ) ->
	Bin_ruleID = binary_write_uint8( P#pk_ChargeOrUseRuleInfo.ruleID ),
	Bin_diamon = binary_write_uint( P#pk_ChargeOrUseRuleInfo.diamon ),
	Bin_itemJson = binary_write_string( P#pk_ChargeOrUseRuleInfo.itemJson ),
	Bin_hasTake = binary_write_bool( P#pk_ChargeOrUseRuleInfo.hasTake ),
	[
		Bin_ruleID,
		Bin_diamon,
		Bin_itemJson,
		Bin_hasTake	].

%GENERATED from file:activity.h => CrosArenaBattleHighRank
writeCrosArenaBattleHighRank( #pk_CrosArenaBattleHighRank{} = P ) ->
	Bin_career = binary_write_uint( P#pk_CrosArenaBattleHighRank.career ),
	Bin_roleID = binary_write_uint64( P#pk_CrosArenaBattleHighRank.roleID ),
	Bin_name = binary_write_string( P#pk_CrosArenaBattleHighRank.name ),
	Bin_servername = binary_write_string( P#pk_CrosArenaBattleHighRank.servername ),
	Bin_force = binary_write_uint( P#pk_CrosArenaBattleHighRank.force ),
	Bin_arenaVal = binary_write_uint( P#pk_CrosArenaBattleHighRank.arenaVal ),
	Bin_win = binary_write_uint( P#pk_CrosArenaBattleHighRank.win ),
	Bin_fail = binary_write_uint( P#pk_CrosArenaBattleHighRank.fail ),
	Bin_time = binary_write_uint64( P#pk_CrosArenaBattleHighRank.time ),
	[
		Bin_career,
		Bin_roleID,
		Bin_name,
		Bin_servername,
		Bin_force,
		Bin_arenaVal,
		Bin_win,
		Bin_fail,
		Bin_time	].

%GENERATED from file:activity.h => CrosArenaBattleRank
writeCrosArenaBattleRank( #pk_CrosArenaBattleRank{} = P ) ->
	Bin_rankID = binary_write_uint8( P#pk_CrosArenaBattleRank.rankID ),
	Bin_career = binary_write_uint( P#pk_CrosArenaBattleRank.career ),
	Bin_roleID = binary_write_uint64( P#pk_CrosArenaBattleRank.roleID ),
	Bin_name = binary_write_string( P#pk_CrosArenaBattleRank.name ),
	Bin_servername = binary_write_string( P#pk_CrosArenaBattleRank.servername ),
	Bin_force = binary_write_uint( P#pk_CrosArenaBattleRank.force ),
	Bin_arenaVal = binary_write_uint( P#pk_CrosArenaBattleRank.arenaVal ),
	Bin_win = binary_write_uint( P#pk_CrosArenaBattleRank.win ),
	Bin_fail = binary_write_uint( P#pk_CrosArenaBattleRank.fail ),
	[
		Bin_rankID,
		Bin_career,
		Bin_roleID,
		Bin_name,
		Bin_servername,
		Bin_force,
		Bin_arenaVal,
		Bin_win,
		Bin_fail	].

%GENERATED from file:activity.h => CrosBattleExploit
writeCrosBattleExploit( #pk_CrosBattleExploit{} = P ) ->
	Bin_rankID = binary_write_uint8( P#pk_CrosBattleExploit.rankID ),
	Bin_career = binary_write_uint( P#pk_CrosBattleExploit.career ),
	Bin_roleID = binary_write_uint64( P#pk_CrosBattleExploit.roleID ),
	Bin_name = binary_write_string( P#pk_CrosBattleExploit.name ),
	Bin_servername = binary_write_string( P#pk_CrosBattleExploit.servername ),
	Bin_force = binary_write_uint( P#pk_CrosBattleExploit.force ),
	Bin_exploit = binary_write_uint( P#pk_CrosBattleExploit.exploit ),
	[
		Bin_rankID,
		Bin_career,
		Bin_roleID,
		Bin_name,
		Bin_servername,
		Bin_force,
		Bin_exploit	].

%GENERATED from file:activity.h => DarknessPlayerRank
writeDarknessPlayerRank( #pk_DarknessPlayerRank{} = P ) ->
	Bin_rank = binary_write_uint( P#pk_DarknessPlayerRank.rank ),
	Bin_camp = binary_write_uint8( P#pk_DarknessPlayerRank.camp ),
	Bin_roleID = binary_write_uint64( P#pk_DarknessPlayerRank.roleID ),
	Bin_roleName = binary_write_string( P#pk_DarknessPlayerRank.roleName ),
	Bin_roleLevel = binary_write_uint( P#pk_DarknessPlayerRank.roleLevel ),
	Bin_integral = binary_write_uint( P#pk_DarknessPlayerRank.integral ),
	Bin_mapPos = binary_write_uint8( P#pk_DarknessPlayerRank.mapPos ),
	[
		Bin_rank,
		Bin_camp,
		Bin_roleID,
		Bin_roleName,
		Bin_roleLevel,
		Bin_integral,
		Bin_mapPos	].

%GENERATED from file:activity.h => DarknessState
writeDarknessState( #pk_DarknessState{} = P ) ->
	Bin_remainTime = binary_write_uint( P#pk_DarknessState.remainTime ),
	[
		Bin_remainTime	].

%GENERATED from file:activity.h => EscortPlunderMoney
writeEscortPlunderMoney( #pk_EscortPlunderMoney{} = P ) ->
	Bin_roleName = binary_write_string( P#pk_EscortPlunderMoney.roleName ),
	Bin_plunderMoney = binary_write_int64( P#pk_EscortPlunderMoney.plunderMoney ),
	[
		Bin_roleName,
		Bin_plunderMoney	].

%GENERATED from file:activity.h => EscortResultReward
writeEscortResultReward( #pk_EscortResultReward{} = P ) ->
	Bin_moneyType = binary_write_uint8( P#pk_EscortResultReward.moneyType ),
	Bin_money = binary_write_uint( P#pk_EscortResultReward.money ),
	Bin_perValue = binary_write_uint( P#pk_EscortResultReward.perValue ),
	[
		Bin_moneyType,
		Bin_money,
		Bin_perValue	].

%GENERATED from file:activity.h => EscortTeam
writeEscortTeam( #pk_EscortTeam{} = P ) ->
	Bin_roleID = binary_write_uint64( P#pk_EscortTeam.roleID ),
	Bin_roleName = binary_write_string( P#pk_EscortTeam.roleName ),
	Bin_sequenceNumber = binary_write_uint16( P#pk_EscortTeam.sequenceNumber ),
	Bin_cur_RobNumber = binary_write_uint16( P#pk_EscortTeam.cur_RobNumber ),
	Bin_max_RobNumber = binary_write_uint16( P#pk_EscortTeam.max_RobNumber ),
	[
		Bin_roleID,
		Bin_roleName,
		Bin_sequenceNumber,
		Bin_cur_RobNumber,
		Bin_max_RobNumber	].

%GENERATED from file:activity.h => HDBattleExploit
writeHDBattleExploit( #pk_HDBattleExploit{} = P ) ->
	Bin_rankID = binary_write_uint8( P#pk_HDBattleExploit.rankID ),
	Bin_camp = binary_write_uint8( P#pk_HDBattleExploit.camp ),
	Bin_roleID = binary_write_uint64( P#pk_HDBattleExploit.roleID ),
	Bin_name = binary_write_string( P#pk_HDBattleExploit.name ),
	Bin_servername = binary_write_string( P#pk_HDBattleExploit.servername ),
	Bin_killNum = binary_write_uint16( P#pk_HDBattleExploit.killNum ),
	Bin_asKillNum = binary_write_uint16( P#pk_HDBattleExploit.asKillNum ),
	Bin_exploit = binary_write_uint( P#pk_HDBattleExploit.exploit ),
	[
		Bin_rankID,
		Bin_camp,
		Bin_roleID,
		Bin_name,
		Bin_servername,
		Bin_killNum,
		Bin_asKillNum,
		Bin_exploit	].

%GENERATED from file:activity.h => KillRank
writeKillRank( #pk_KillRank{} = P ) ->
	Bin_sortNumber = binary_write_uint( P#pk_KillRank.sortNumber ),
	Bin_killNumber = binary_write_uint( P#pk_KillRank.killNumber ),
	Bin_playerName = binary_write_string( P#pk_KillRank.playerName ),
	[
		Bin_sortNumber,
		Bin_killNumber,
		Bin_playerName	].

%GENERATED from file:activity.h => LotteryItem
writeLotteryItem( #pk_LotteryItem{} = P ) ->
	Bin_roleID = binary_write_uint64( P#pk_LotteryItem.roleID ),
	Bin_roleName = binary_write_string( P#pk_LotteryItem.roleName ),
	Bin_pondID = binary_write_uint( P#pk_LotteryItem.pondID ),
	Bin_onlyID = binary_write_uint( P#pk_LotteryItem.onlyID ),
	Bin_itemId = binary_write_uint( P#pk_LotteryItem.itemId ),
	Bin_itemNumber = binary_write_uint( P#pk_LotteryItem.itemNumber ),
	Bin_isBind = binary_write_uint8( P#pk_LotteryItem.isBind ),
	[
		Bin_roleID,
		Bin_roleName,
		Bin_pondID,
		Bin_onlyID,
		Bin_itemId,
		Bin_itemNumber,
		Bin_isBind	].

%GENERATED from file:activity.h => LotteryNote
writeLotteryNote( #pk_LotteryNote{} = P ) ->
	Bin_roleID = binary_write_uint64( P#pk_LotteryNote.roleID ),
	Bin_roleName = binary_write_string( P#pk_LotteryNote.roleName ),
	Bin_itemID = binary_write_uint( P#pk_LotteryNote.itemID ),
	Bin_itemNumber = binary_write_uint( P#pk_LotteryNote.itemNumber ),
	Bin_isBind = binary_write_uint8( P#pk_LotteryNote.isBind ),
	Bin_isServerNote = binary_write_uint8( P#pk_LotteryNote.isServerNote ),
	Bin_zbTime = binary_write_uint64( P#pk_LotteryNote.zbTime ),
	[
		Bin_roleID,
		Bin_roleName,
		Bin_itemID,
		Bin_itemNumber,
		Bin_isBind,
		Bin_isServerNote,
		Bin_zbTime	].

%GENERATED from file:activity.h => OperateActExchangeRequire
writeOperateActExchangeRequire( #pk_OperateActExchangeRequire{} = P ) ->
	Bin_itemID = binary_write_uint16( P#pk_OperateActExchangeRequire.itemID ),
	Bin_itemNum = binary_write_uint16( P#pk_OperateActExchangeRequire.itemNum ),
	[
		Bin_itemID,
		Bin_itemNum	].

%GENERATED from file:activity.h => PlayerKingBattleEquip
writePlayerKingBattleEquip( #pk_PlayerKingBattleEquip{} = P ) ->
	Bin_equipID = binary_write_uint( P#pk_PlayerKingBattleEquip.equipID ),
	Bin_quality = binary_write_uint8( P#pk_PlayerKingBattleEquip.quality ),
	[
		Bin_equipID,
		Bin_quality	].

%GENERATED from file:activity.h => PlayerKingBattleEquipLevel
writePlayerKingBattleEquipLevel( #pk_PlayerKingBattleEquipLevel{} = P ) ->
	Bin_type = binary_write_uint8( P#pk_PlayerKingBattleEquipLevel.type ),
	Bin_level = binary_write_uint8( P#pk_PlayerKingBattleEquipLevel.level ),
	[
		Bin_type,
		Bin_level	].

%GENERATED from file:activity.h => Question
writeQuestion( #pk_Question{} = P ) ->
	Bin_questionID = binary_write_uint( P#pk_Question.questionID ),
	Bin_answers = binary_write_array(P#pk_Question.answers, fun(X) -> binary_write_uint8( X ) end),
	[
		Bin_questionID,
		Bin_answers	].

%GENERATED from file:activity.h => RobitAnswer
writeRobitAnswer( #pk_RobitAnswer{} = P ) ->
	Bin_startTime = binary_write_uint64( P#pk_RobitAnswer.startTime ),
	Bin_intervalTime = binary_write_uint( P#pk_RobitAnswer.intervalTime ),
	[
		Bin_startTime,
		Bin_intervalTime	].

%GENERATED from file:activity.h => SevenDayMissionData
writeSevenDayMissionData( #pk_SevenDayMissionData{} = P ) ->
	Bin_isFinish = binary_write_bool( P#pk_SevenDayMissionData.isFinish ),
	Bin_number = binary_write_uint16( P#pk_SevenDayMissionData.number ),
	Bin_max = binary_write_uint16( P#pk_SevenDayMissionData.max ),
	Bin_missionid = binary_write_uint16( P#pk_SevenDayMissionData.missionid ),
	[
		Bin_isFinish,
		Bin_number,
		Bin_max,
		Bin_missionid	].

%GENERATED from file:activity.h => WildBossInfo
writeWildBossInfo( #pk_WildBossInfo{} = P ) ->
	Bin_mapID = binary_write_uint( P#pk_WildBossInfo.mapID ),
	Bin_bossID = binary_write_uint( P#pk_WildBossInfo.bossID ),
	Bin_refreshTime = binary_write_uint64( P#pk_WildBossInfo.refreshTime ),
	[
		Bin_mapID,
		Bin_bossID,
		Bin_refreshTime	].

%GENERATED from file:arena.h => KingRole
writeKingRole( #pk_KingRole{} = P ) ->
	Bin_roleID = binary_write_uint64( P#pk_KingRole.roleID ),
	Bin_ranksort = binary_write_uint( P#pk_KingRole.ranksort ),
	Bin_career = binary_write_uint( P#pk_KingRole.career ),
	Bin_roleName = binary_write_string( P#pk_KingRole.roleName ),
	Bin_worshipTimes = binary_write_uint( P#pk_KingRole.worshipTimes ),
	[
		Bin_roleID,
		Bin_ranksort,
		Bin_career,
		Bin_roleName,
		Bin_worshipTimes	].

%GENERATED from file:arena.h => LadderLS
writeLadderLS( #pk_LadderLS{} = P ) ->
	Bin_roleID = binary_write_uint64( P#pk_LadderLS.roleID ),
	Bin_roleName = binary_write_string( P#pk_LadderLS.roleName ),
	Bin_isTerminator = binary_write_bool( P#pk_LadderLS.isTerminator ),
	Bin_ls_times = binary_write_uint16( P#pk_LadderLS.ls_times ),
	Bin_targetID = binary_write_uint64( P#pk_LadderLS.targetID ),
	Bin_targetName = binary_write_string( P#pk_LadderLS.targetName ),
	[
		Bin_roleID,
		Bin_roleName,
		Bin_isTerminator,
		Bin_ls_times,
		Bin_targetID,
		Bin_targetName	].

%GENERATED from file:arena.h => LadderMatchInfo
writeLadderMatchInfo( #pk_LadderMatchInfo{} = P ) ->
	Bin_roleID = binary_write_uint64( P#pk_LadderMatchInfo.roleID ),
	Bin_roleName = binary_write_string( P#pk_LadderMatchInfo.roleName ),
	Bin_isChallenge = binary_write_bool( P#pk_LadderMatchInfo.isChallenge ),
	Bin_isWin = binary_write_bool( P#pk_LadderMatchInfo.isWin ),
	Bin_targetID = binary_write_uint64( P#pk_LadderMatchInfo.targetID ),
	Bin_targetName = binary_write_string( P#pk_LadderMatchInfo.targetName ),
	Bin_rank1 = binary_write_uint( P#pk_LadderMatchInfo.rank1 ),
	Bin_rank2 = binary_write_uint( P#pk_LadderMatchInfo.rank2 ),
	[
		Bin_roleID,
		Bin_roleName,
		Bin_isChallenge,
		Bin_isWin,
		Bin_targetID,
		Bin_targetName,
		Bin_rank1,
		Bin_rank2	].

%GENERATED from file:arena.h => LadderTargetInfo
writeLadderTargetInfo( #pk_LadderTargetInfo{} = P ) ->
	Bin_roleID = binary_write_uint64( P#pk_LadderTargetInfo.roleID ),
	Bin_name = binary_write_string( P#pk_LadderTargetInfo.name ),
	Bin_level = binary_write_uint16( P#pk_LadderTargetInfo.level ),
	Bin_career = binary_write_uint( P#pk_LadderTargetInfo.career ),
	Bin_ranksort = binary_write_uint( P#pk_LadderTargetInfo.ranksort ),
	Bin_fightingCapacity = binary_write_uint( P#pk_LadderTargetInfo.fightingCapacity ),
	Bin_sex = binary_write_int8( P#pk_LadderTargetInfo.sex ),
	Bin_race = binary_write_int8( P#pk_LadderTargetInfo.race ),
	[
		Bin_roleID,
		Bin_name,
		Bin_level,
		Bin_career,
		Bin_ranksort,
		Bin_fightingCapacity,
		Bin_sex,
		Bin_race	].

%GENERATED from file:arena.h => SelfBattleInfo
writeSelfBattleInfo( #pk_SelfBattleInfo{} = P ) ->
	Bin_ranksort = binary_write_uint( P#pk_SelfBattleInfo.ranksort ),
	Bin_fightingCapacity = binary_write_uint( P#pk_SelfBattleInfo.fightingCapacity ),
	Bin_exploit = binary_write_uint( P#pk_SelfBattleInfo.exploit ),
	Bin_cur_ChallengeTimes = binary_write_uint16( P#pk_SelfBattleInfo.cur_ChallengeTimes ),
	Bin_max_ChallengeTimes = binary_write_uint16( P#pk_SelfBattleInfo.max_ChallengeTimes ),
	Bin_moneyType = binary_write_uint8( P#pk_SelfBattleInfo.moneyType ),
	Bin_money = binary_write_uint( P#pk_SelfBattleInfo.money ),
	Bin_cur_win = binary_write_uint16( P#pk_SelfBattleInfo.cur_win ),
	Bin_max_win = binary_write_uint16( P#pk_SelfBattleInfo.max_win ),
	Bin_win_times = binary_write_uint( P#pk_SelfBattleInfo.win_times ),
	Bin_surplusSec = binary_write_uint( P#pk_SelfBattleInfo.surplusSec ),
	Bin_exploitValue = binary_write_uint( P#pk_SelfBattleInfo.exploitValue ),
	[
		Bin_ranksort,
		Bin_fightingCapacity,
		Bin_exploit,
		Bin_cur_ChallengeTimes,
		Bin_max_ChallengeTimes,
		Bin_moneyType,
		Bin_money,
		Bin_cur_win,
		Bin_max_win,
		Bin_win_times,
		Bin_surplusSec,
		Bin_exploitValue	].

%GENERATED from file:bag.h => BagSlot
writeBagSlot( #pk_BagSlot{} = P ) ->
	Bin_max = binary_write_uint8( P#pk_BagSlot.max ),
	Bin_used = binary_write_uint8( P#pk_BagSlot.used ),
	[
		Bin_max,
		Bin_used	].

%GENERATED from file:bag.h => EquipEnhancedProp
writeEquipEnhancedProp( #pk_EquipEnhancedProp{} = P ) ->
	Bin_propKey = binary_write_uint8( P#pk_EquipEnhancedProp.propKey ),
	Bin_propValue = binary_write_float( P#pk_EquipEnhancedProp.propValue ),
	[
		Bin_propKey,
		Bin_propValue	].

%GENERATED from file:bag.h => EquipGemInfo
writeEquipGemInfo( #pk_EquipGemInfo{} = P ) ->
	Bin_equipPos = binary_write_uint16( P#pk_EquipGemInfo.equipPos ),
	Bin_gemList = binary_write_array(P#pk_EquipGemInfo.gemList, fun(X) -> writeGemEmbedInfo( X ) end),
	[
		Bin_equipPos,
		Bin_gemList	].

%GENERATED from file:bag.h => EquipItemInfo
writeEquipItemInfo( #pk_EquipItemInfo{} = P ) ->
	Bin_itemID = binary_write_uint( P#pk_EquipItemInfo.itemID ),
	Bin_itemUID = binary_write_uint64( P#pk_EquipItemInfo.itemUID ),
	Bin_recastNum = binary_write_uint16( P#pk_EquipItemInfo.recastNum ),
	Bin_quality = binary_write_uint8( P#pk_EquipItemInfo.quality ),
	Bin_isBind = binary_write_bool( P#pk_EquipItemInfo.isBind ),
	Bin_isLocked = binary_write_bool( P#pk_EquipItemInfo.isLocked ),
	Bin_expiredTime = binary_write_uint( P#pk_EquipItemInfo.expiredTime ),
	Bin_equipProps = binary_write_array(P#pk_EquipItemInfo.equipProps, fun(X) -> writeEquipPropInfo( X ) end),
	[
		Bin_itemID,
		Bin_itemUID,
		Bin_recastNum,
		Bin_quality,
		Bin_isBind,
		Bin_isLocked,
		Bin_expiredTime,
		Bin_equipProps	].

%GENERATED from file:bag.h => EquipPropInfo
writeEquipPropInfo( #pk_EquipPropInfo{} = P ) ->
	Bin_propType = binary_write_uint8( P#pk_EquipPropInfo.propType ),
	Bin_propKey = binary_write_uint8( P#pk_EquipPropInfo.propKey ),
	Bin_propAffix = binary_write_uint16( P#pk_EquipPropInfo.propAffix ),
	Bin_calcType = binary_write_bool( P#pk_EquipPropInfo.calcType ),
	Bin_propValue = binary_write_float( P#pk_EquipPropInfo.propValue ),
	[
		Bin_propType,
		Bin_propKey,
		Bin_propAffix,
		Bin_calcType,
		Bin_propValue	].

%GENERATED from file:bag.h => EquipRefineLevel
writeEquipRefineLevel( #pk_EquipRefineLevel{} = P ) ->
	Bin_type = binary_write_uint8( P#pk_EquipRefineLevel.type ),
	Bin_level = binary_write_uint8( P#pk_EquipRefineLevel.level ),
	[
		Bin_type,
		Bin_level	].

%GENERATED from file:bag.h => EquipStarLevel
writeEquipStarLevel( #pk_EquipStarLevel{} = P ) ->
	Bin_type = binary_write_uint8( P#pk_EquipStarLevel.type ),
	Bin_level = binary_write_uint8( P#pk_EquipStarLevel.level ),
	[
		Bin_type,
		Bin_level	].

%GENERATED from file:bag.h => EquipUpStarInfo
writeEquipUpStarInfo( #pk_EquipUpStarInfo{} = P ) ->
	Bin_pos = binary_write_uint8( P#pk_EquipUpStarInfo.pos ),
	Bin_level = binary_write_uint8( P#pk_EquipUpStarInfo.level ),
	Bin_prog = binary_write_uint8( P#pk_EquipUpStarInfo.prog ),
	Bin_bless = binary_write_uint16( P#pk_EquipUpStarInfo.bless ),
	[
		Bin_pos,
		Bin_level,
		Bin_prog,
		Bin_bless	].

%GENERATED from file:bag.h => ExchangeResource
writeExchangeResource( #pk_ExchangeResource{} = P ) ->
	Bin_id = binary_write_uint( P#pk_ExchangeResource.id ),
	Bin_groupID = binary_write_uint8( P#pk_ExchangeResource.groupID ),
	Bin_itemID = binary_write_uint( P#pk_ExchangeResource.itemID ),
	Bin_payItem = binary_write_array(P#pk_ExchangeResource.payItem, fun(X) -> writePayItemOfExchange( X ) end),
	Bin_playerLevel = binary_write_uint8( P#pk_ExchangeResource.playerLevel ),
	Bin_limit = binary_write_uint16( P#pk_ExchangeResource.limit ),
	[
		Bin_id,
		Bin_groupID,
		Bin_itemID,
		Bin_payItem,
		Bin_playerLevel,
		Bin_limit	].

%GENERATED from file:bag.h => GemEmbedInfo
writeGemEmbedInfo( #pk_GemEmbedInfo{} = P ) ->
	Bin_gemID = binary_write_uint64( P#pk_GemEmbedInfo.gemID ),
	Bin_slot = binary_write_uint8( P#pk_GemEmbedInfo.slot ),
	[
		Bin_gemID,
		Bin_slot	].

%GENERATED from file:bag.h => LookGemInfo
writeLookGemInfo( #pk_LookGemInfo{} = P ) ->
	Bin_gemID = binary_write_uint16( P#pk_LookGemInfo.gemID ),
	Bin_slot = binary_write_uint8( P#pk_LookGemInfo.slot ),
	[
		Bin_gemID,
		Bin_slot	].

%GENERATED from file:bag.h => LookGodWeaponInfo
writeLookGodWeaponInfo( #pk_LookGodWeaponInfo{} = P ) ->
	Bin_weaponID = binary_write_uint8( P#pk_LookGodWeaponInfo.weaponID ),
	Bin_weaponLevel = binary_write_uint16( P#pk_LookGodWeaponInfo.weaponLevel ),
	Bin_skillLevel = binary_write_uint16( P#pk_LookGodWeaponInfo.skillLevel ),
	[
		Bin_weaponID,
		Bin_weaponLevel,
		Bin_skillLevel	].

%GENERATED from file:bag.h => LookPetEquipInfo
writeLookPetEquipInfo( #pk_LookPetEquipInfo{} = P ) ->
	Bin_equipID = binary_write_uint8( P#pk_LookPetEquipInfo.equipID ),
	Bin_equipLv = binary_write_uint8( P#pk_LookPetEquipInfo.equipLv ),
	[
		Bin_equipID,
		Bin_equipLv	].

%GENERATED from file:bag.h => LookPetInfo
writeLookPetInfo( #pk_LookPetInfo{} = P ) ->
	Bin_petID = binary_write_uint16( P#pk_LookPetInfo.petID ),
	Bin_petStar = binary_write_uint8( P#pk_LookPetInfo.petStar ),
	Bin_petname = binary_write_string( P#pk_LookPetInfo.petname ),
	Bin_petForce = binary_write_uint( P#pk_LookPetInfo.petForce ),
	Bin_petColNum = binary_write_uint16( P#pk_LookPetInfo.petColNum ),
	Bin_petRaw = binary_write_uint8( P#pk_LookPetInfo.petRaw ),
	Bin_petSkill = binary_write_array(P#pk_LookPetInfo.petSkill, fun(X) -> writeLookPetSkill( X ) end),
	Bin_equalInfo = binary_write_array(P#pk_LookPetInfo.equalInfo, fun(X) -> writeLookPetEquipInfo( X ) end),
	Bin_petPropValues = binary_write_array(P#pk_LookPetInfo.petPropValues, fun(X) -> binary_write_float( X ) end),
	[
		Bin_petID,
		Bin_petStar,
		Bin_petname,
		Bin_petForce,
		Bin_petColNum,
		Bin_petRaw,
		Bin_petSkill,
		Bin_equalInfo,
		Bin_petPropValues	].

%GENERATED from file:bag.h => LookPetSkill
writeLookPetSkill( #pk_LookPetSkill{} = P ) ->
	Bin_petSkillId = binary_write_uint16( P#pk_LookPetSkill.petSkillId ),
	Bin_petSkillLv = binary_write_uint8( P#pk_LookPetSkill.petSkillLv ),
	Bin_petSkillType = binary_write_uint8( P#pk_LookPetSkill.petSkillType ),
	[
		Bin_petSkillId,
		Bin_petSkillLv,
		Bin_petSkillType	].

%GENERATED from file:bag.h => LookWakeInfo
writeLookWakeInfo( #pk_LookWakeInfo{} = P ) ->
	Bin_cardID = binary_write_uint8( P#pk_LookWakeInfo.cardID ),
	Bin_level = binary_write_uint8( P#pk_LookWakeInfo.level ),
	[
		Bin_cardID,
		Bin_level	].

%GENERATED from file:bag.h => NormalItemInfo
writeNormalItemInfo( #pk_NormalItemInfo{} = P ) ->
	Bin_itemID = binary_write_uint( P#pk_NormalItemInfo.itemID ),
	Bin_itemUID = binary_write_uint64( P#pk_NormalItemInfo.itemUID ),
	Bin_itemSum = binary_write_uint16( P#pk_NormalItemInfo.itemSum ),
	Bin_isBind = binary_write_bool( P#pk_NormalItemInfo.isBind ),
	Bin_isLocked = binary_write_bool( P#pk_NormalItemInfo.isLocked ),
	Bin_expiredTime = binary_write_uint( P#pk_NormalItemInfo.expiredTime ),
	[
		Bin_itemID,
		Bin_itemUID,
		Bin_itemSum,
		Bin_isBind,
		Bin_isLocked,
		Bin_expiredTime	].

%GENERATED from file:bag.h => PayItemOfExchange
writePayItemOfExchange( #pk_PayItemOfExchange{} = P ) ->
	Bin_item = binary_write_int( P#pk_PayItemOfExchange.item ),
	Bin_number = binary_write_uint16( P#pk_PayItemOfExchange.number ),
	[
		Bin_item,
		Bin_number	].

%GENERATED from file:bag.h => RPView_AddProp
writeRPView_AddProp( #pk_RPView_AddProp{} = P ) ->
	Bin_prop = binary_write_uint8( P#pk_RPView_AddProp.prop ),
	Bin_value = binary_write_float( P#pk_RPView_AddProp.value ),
	[
		Bin_prop,
		Bin_value	].

%GENERATED from file:bag.h => RPView_AssistBattleInfo
writeRPView_AssistBattleInfo( #pk_RPView_AssistBattleInfo{} = P ) ->
	Bin_petID = binary_write_uint16( P#pk_RPView_AssistBattleInfo.petID ),
	Bin_slot = binary_write_uint8( P#pk_RPView_AssistBattleInfo.slot ),
	[
		Bin_petID,
		Bin_slot	].

%GENERATED from file:bag.h => RPView_FashionInfo
writeRPView_FashionInfo( #pk_RPView_FashionInfo{} = P ) ->
	Bin_fashionID = binary_write_uint( P#pk_RPView_FashionInfo.fashionID ),
	Bin_time = binary_write_uint( P#pk_RPView_FashionInfo.time ),
	[
		Bin_fashionID,
		Bin_time	].

%GENERATED from file:bag.h => RPView_PetBaseInfo
writeRPView_PetBaseInfo( #pk_RPView_PetBaseInfo{} = P ) ->
	Bin_petID = binary_write_uint16( P#pk_RPView_PetBaseInfo.petID ),
	Bin_petStar = binary_write_uint8( P#pk_RPView_PetBaseInfo.petStar ),
	Bin_status = binary_write_uint8( P#pk_RPView_PetBaseInfo.status ),
	Bin_petName = binary_write_string( P#pk_RPView_PetBaseInfo.petName ),
	Bin_petRaw = binary_write_uint8( P#pk_RPView_PetBaseInfo.petRaw ),
	Bin_petProps = binary_write_array(P#pk_RPView_PetBaseInfo.petProps, fun(X) -> writeRPView_AddProp( X ) end),
	Bin_petForce = binary_write_uint64( P#pk_RPView_PetBaseInfo.petForce ),
	Bin_upCount = binary_write_uint( P#pk_RPView_PetBaseInfo.upCount ),
	[
		Bin_petID,
		Bin_petStar,
		Bin_status,
		Bin_petName,
		Bin_petRaw,
		Bin_petProps,
		Bin_petForce,
		Bin_upCount	].

%GENERATED from file:bag.h => RecastPosInfo
writeRecastPosInfo( #pk_RecastPosInfo{} = P ) ->
	Bin_equipPos = binary_write_uint16( P#pk_RecastPosInfo.equipPos ),
	Bin_recastVal = binary_write_uint( P#pk_RecastPosInfo.recastVal ),
	Bin_recastInfo = binary_write_array(P#pk_RecastPosInfo.recastInfo, fun(X) -> writeRecastPropInfo( X ) end),
	Bin_recastInfo_ext = binary_write_array(P#pk_RecastPosInfo.recastInfo_ext, fun(X) -> writeRecastPropInfo( X ) end),
	[
		Bin_equipPos,
		Bin_recastVal,
		Bin_recastInfo,
		Bin_recastInfo_ext	].

%GENERATED from file:bag.h => RecastPropInfo
writeRecastPropInfo( #pk_RecastPropInfo{} = P ) ->
	Bin_pos = binary_write_uint16( P#pk_RecastPropInfo.pos ),
	Bin_propIndex = binary_write_uint( P#pk_RecastPropInfo.propIndex ),
	Bin_propValue = binary_write_uint( P#pk_RecastPropInfo.propValue ),
	Bin_propValMax = binary_write_uint( P#pk_RecastPropInfo.propValMax ),
	[
		Bin_pos,
		Bin_propIndex,
		Bin_propValue,
		Bin_propValMax	].

%GENERATED from file:bag.h => RecastResultInfo
writeRecastResultInfo( #pk_RecastResultInfo{} = P ) ->
	Bin_pos = binary_write_uint16( P#pk_RecastResultInfo.pos ),
	Bin_propIndex = binary_write_uint( P#pk_RecastResultInfo.propIndex ),
	Bin_value = binary_write_int( P#pk_RecastResultInfo.value ),
	[
		Bin_pos,
		Bin_propIndex,
		Bin_value	].

%GENERATED from file:bag.h => RecycleEquip
writeRecycleEquip( #pk_RecycleEquip{} = P ) ->
	Bin_slot = binary_write_uint8( P#pk_RecycleEquip.slot ),
	Bin_equip = writeEquipItemInfo( P#pk_RecycleEquip.equip ),
	[
		Bin_slot,
		Bin_equip	].

%GENERATED from file:bag.h => RecycleItem
writeRecycleItem( #pk_RecycleItem{} = P ) ->
	Bin_slot = binary_write_uint8( P#pk_RecycleItem.slot ),
	Bin_item = writeNormalItemInfo( P#pk_RecycleItem.item ),
	[
		Bin_slot,
		Bin_item	].

%GENERATED from file:bag.h => starCostItem
writestarCostItem( #pk_starCostItem{} = P ) ->
	Bin_itemID = binary_write_uint16( P#pk_starCostItem.itemID ),
	Bin_itemNum = binary_write_uint16( P#pk_starCostItem.itemNum ),
	[
		Bin_itemID,
		Bin_itemNum	].

%GENERATED from file:battle.h => AttackResultList
writeAttackResultList( #pk_AttackResultList{} = P ) ->
	Bin_type = binary_write_uint8( P#pk_AttackResultList.type ),
	Bin_value = binary_write_uint( P#pk_AttackResultList.value ),
	[
		Bin_type,
		Bin_value	].

%GENERATED from file:battle.h => BeAttack
writeBeAttack( #pk_BeAttack{} = P ) ->
	Bin_camp = binary_write_uint8( P#pk_BeAttack.camp ),
	Bin_pos = binary_write_uint8( P#pk_BeAttack.pos ),
	Bin_hp = binary_write_int( P#pk_BeAttack.hp ),
	[
		Bin_camp,
		Bin_pos,
		Bin_hp	].

%GENERATED from file:battle.h => TrunBattleResult
writeTrunBattleResult( #pk_TrunBattleResult{} = P ) ->
	Bin_camp = binary_write_uint8( P#pk_TrunBattleResult.camp ),
	Bin_pos = binary_write_uint8( P#pk_TrunBattleResult.pos ),
	Bin_id = binary_write_uint16( P#pk_TrunBattleResult.id ),
	Bin_turn = binary_write_uint8( P#pk_TrunBattleResult.turn ),
	Bin_bl = binary_write_array(P#pk_TrunBattleResult.bl, fun(X) -> writeBeAttack( X ) end),
	[
		Bin_camp,
		Bin_pos,
		Bin_id,
		Bin_turn,
		Bin_bl	].

%GENERATED from file:battle.h => TurnBattleInit
writeTurnBattleInit( #pk_TurnBattleInit{} = P ) ->
	Bin_id = binary_write_uint64( P#pk_TurnBattleInit.id ),
	Bin_type = binary_write_uint8( P#pk_TurnBattleInit.type ),
	Bin_camp = binary_write_uint8( P#pk_TurnBattleInit.camp ),
	Bin_pos = binary_write_uint8( P#pk_TurnBattleInit.pos ),
	Bin_hp = binary_write_uint( P#pk_TurnBattleInit.hp ),
	[
		Bin_id,
		Bin_type,
		Bin_camp,
		Bin_pos,
		Bin_hp	].

%GENERATED from file:companion.h => CompanionMember
writeCompanionMember( #pk_CompanionMember{} = P ) ->
	Bin_roleid = binary_write_uint64( P#pk_CompanionMember.roleid ),
	Bin_name = binary_write_string( P#pk_CompanionMember.name ),
	Bin_lvl = binary_write_uint16( P#pk_CompanionMember.lvl ),
	Bin_relation = binary_write_uint8( P#pk_CompanionMember.relation ),
	Bin_cur_lively = binary_write_uint( P#pk_CompanionMember.cur_lively ),
	Bin_max_lively = binary_write_uint( P#pk_CompanionMember.max_lively ),
	Bin_all_lively = binary_write_uint( P#pk_CompanionMember.all_lively ),
	Bin_offlinetime = binary_write_uint64( P#pk_CompanionMember.offlinetime ),
	Bin_onlineTimeEnough = binary_write_bool( P#pk_CompanionMember.onlineTimeEnough ),
	Bin_styleID = binary_write_uint8( P#pk_CompanionMember.styleID ),
	Bin_mapID = binary_write_uint16( P#pk_CompanionMember.mapID ),
	Bin_career = binary_write_uint( P#pk_CompanionMember.career ),
	Bin_race = binary_write_uint8( P#pk_CompanionMember.race ),
	Bin_sex = binary_write_uint8( P#pk_CompanionMember.sex ),
	Bin_head = binary_write_uint( P#pk_CompanionMember.head ),
	[
		Bin_roleid,
		Bin_name,
		Bin_lvl,
		Bin_relation,
		Bin_cur_lively,
		Bin_max_lively,
		Bin_all_lively,
		Bin_offlinetime,
		Bin_onlineTimeEnough,
		Bin_styleID,
		Bin_mapID,
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_head	].

%GENERATED from file:copy.h => BossRankInfo
writeBossRankInfo( #pk_BossRankInfo{} = P ) ->
	Bin_name = binary_write_string( P#pk_BossRankInfo.name ),
	Bin_hurt = binary_write_uint( P#pk_BossRankInfo.hurt ),
	[
		Bin_name,
		Bin_hurt	].

%GENERATED from file:copy.h => chapterInfo
writechapterInfo( #pk_chapterInfo{} = P ) ->
	Bin_nextChapterSeconds = binary_write_uint( P#pk_chapterInfo.nextChapterSeconds ),
	Bin_headCount = binary_write_uint16( P#pk_chapterInfo.headCount ),
	Bin_maxChapter = binary_write_uint16( P#pk_chapterInfo.maxChapter ),
	Bin_curChapter = binary_write_uint16( P#pk_chapterInfo.curChapter ),
	Bin_curChapterMonsterMax = binary_write_uint16( P#pk_chapterInfo.curChapterMonsterMax ),
	Bin_curChapterMonsterKilled = binary_write_uint16( P#pk_chapterInfo.curChapterMonsterKilled ),
	Bin_mapMonterMax = binary_write_uint16( P#pk_chapterInfo.mapMonterMax ),
	Bin_materialVal = binary_write_uint( P#pk_chapterInfo.materialVal ),
	[
		Bin_nextChapterSeconds,
		Bin_headCount,
		Bin_maxChapter,
		Bin_curChapter,
		Bin_curChapterMonsterMax,
		Bin_curChapterMonsterKilled,
		Bin_mapMonterMax,
		Bin_materialVal	].

%GENERATED from file:copy.h => towerInfo
writetowerInfo( #pk_towerInfo{} = P ) ->
	Bin_dataID = binary_write_uint( P#pk_towerInfo.dataID ),
	Bin_type = binary_write_uint( P#pk_towerInfo.type ),
	Bin_level = binary_write_uint( P#pk_towerInfo.level ),
	[
		Bin_dataID,
		Bin_type,
		Bin_level	].

%GENERATED from file:fashion.h => FashionInfo
writeFashionInfo( #pk_FashionInfo{} = P ) ->
	Bin_fashionID = binary_write_uint( P#pk_FashionInfo.fashionID ),
	Bin_time = binary_write_uint( P#pk_FashionInfo.time ),
	[
		Bin_fashionID,
		Bin_time	].

%GENERATED from file:friend.h => Friend2InfoBase
writeFriend2InfoBase( #pk_Friend2InfoBase{} = P ) ->
	Bin_simple = writeFriend2InfoSimple( P#pk_Friend2InfoBase.simple ),
	Bin_code = binary_write_uint64( P#pk_Friend2InfoBase.code ),
	Bin_face = binary_write_array(P#pk_Friend2InfoBase.face, fun(X) -> binary_write_uint8( X ) end),
	Bin_vipLv = binary_write_uint8( P#pk_Friend2InfoBase.vipLv ),
	Bin_familyName = binary_write_string( P#pk_Friend2InfoBase.familyName ),
	Bin_force = binary_write_uint64( P#pk_Friend2InfoBase.force ),
	Bin_timeRelation = binary_write_uint( P#pk_Friend2InfoBase.timeRelation ),
	Bin_timeLastOnline = binary_write_uint( P#pk_Friend2InfoBase.timeLastOnline ),
	Bin_timeLastInteractive = binary_write_uint( P#pk_Friend2InfoBase.timeLastInteractive ),
	Bin_like = binary_write_uint( P#pk_Friend2InfoBase.like ),
	Bin_charm = binary_write_uint( P#pk_Friend2InfoBase.charm ),
	Bin_isGiveLike = binary_write_bool( P#pk_Friend2InfoBase.isGiveLike ),
	Bin_isBeGiveLike = binary_write_bool( P#pk_Friend2InfoBase.isBeGiveLike ),
	Bin_isMarried = binary_write_bool( P#pk_Friend2InfoBase.isMarried ),
	Bin_distance = binary_write_float( P#pk_Friend2InfoBase.distance ),
	[
		Bin_simple,
		Bin_code,
		Bin_face,
		Bin_vipLv,
		Bin_familyName,
		Bin_force,
		Bin_timeRelation,
		Bin_timeLastOnline,
		Bin_timeLastInteractive,
		Bin_like,
		Bin_charm,
		Bin_isGiveLike,
		Bin_isBeGiveLike,
		Bin_isMarried,
		Bin_distance	].

%GENERATED from file:friend.h => Friend2InfoCross
writeFriend2InfoCross( #pk_Friend2InfoCross{} = P ) ->
	Bin_id = binary_write_uint64( P#pk_Friend2InfoCross.id ),
	Bin_name = binary_write_string( P#pk_Friend2InfoCross.name ),
	Bin_server = binary_write_string( P#pk_Friend2InfoCross.server ),
	Bin_level = binary_write_uint16( P#pk_Friend2InfoCross.level ),
	Bin_career = binary_write_uint( P#pk_Friend2InfoCross.career ),
	Bin_race = binary_write_uint8( P#pk_Friend2InfoCross.race ),
	Bin_sex = binary_write_uint8( P#pk_Friend2InfoCross.sex ),
	Bin_head = binary_write_int( P#pk_Friend2InfoCross.head ),
	Bin_face = binary_write_array(P#pk_Friend2InfoCross.face, fun(X) -> binary_write_uint8( X ) end),
	Bin_timeRelation = binary_write_uint( P#pk_Friend2InfoCross.timeRelation ),
	Bin_timeLastOnline = binary_write_uint( P#pk_Friend2InfoCross.timeLastOnline ),
	Bin_timeLastInteractive = binary_write_uint( P#pk_Friend2InfoCross.timeLastInteractive ),
	Bin_whereis = binary_write_uint8( P#pk_Friend2InfoCross.whereis ),
	[
		Bin_id,
		Bin_name,
		Bin_server,
		Bin_level,
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_head,
		Bin_face,
		Bin_timeRelation,
		Bin_timeLastOnline,
		Bin_timeLastInteractive,
		Bin_whereis	].

%GENERATED from file:friend.h => Friend2InfoFormal
writeFriend2InfoFormal( #pk_Friend2InfoFormal{} = P ) ->
	Bin_base = writeFriend2InfoBase( P#pk_Friend2InfoFormal.base ),
	Bin_closeness = binary_write_uint( P#pk_Friend2InfoFormal.closeness ),
	Bin_isGiveAP = binary_write_bool( P#pk_Friend2InfoFormal.isGiveAP ),
	Bin_isGainAP = binary_write_bool( P#pk_Friend2InfoFormal.isGainAP ),
	Bin_isBeGiveAP = binary_write_bool( P#pk_Friend2InfoFormal.isBeGiveAP ),
	Bin_isBeGainAP = binary_write_bool( P#pk_Friend2InfoFormal.isBeGainAP ),
	[
		Bin_base,
		Bin_closeness,
		Bin_isGiveAP,
		Bin_isGainAP,
		Bin_isBeGiveAP,
		Bin_isBeGainAP	].

%GENERATED from file:friend.h => Friend2InfoSimple
writeFriend2InfoSimple( #pk_Friend2InfoSimple{} = P ) ->
	Bin_id = binary_write_uint64( P#pk_Friend2InfoSimple.id ),
	Bin_name = binary_write_string( P#pk_Friend2InfoSimple.name ),
	Bin_level = binary_write_uint16( P#pk_Friend2InfoSimple.level ),
	Bin_career = binary_write_uint( P#pk_Friend2InfoSimple.career ),
	Bin_race = binary_write_uint8( P#pk_Friend2InfoSimple.race ),
	Bin_sex = binary_write_uint8( P#pk_Friend2InfoSimple.sex ),
	Bin_head = binary_write_int( P#pk_Friend2InfoSimple.head ),
	[
		Bin_id,
		Bin_name,
		Bin_level,
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_head	].

%GENERATED from file:godweapon.h => GodWeaponInfo
writeGodWeaponInfo( #pk_GodWeaponInfo{} = P ) ->
	Bin_weaponID = binary_write_uint8( P#pk_GodWeaponInfo.weaponID ),
	Bin_weaponLevel = binary_write_uint16( P#pk_GodWeaponInfo.weaponLevel ),
	Bin_skillLevel = binary_write_uint16( P#pk_GodWeaponInfo.skillLevel ),
	[
		Bin_weaponID,
		Bin_weaponLevel,
		Bin_skillLevel	].

%GENERATED from file:guild.h => BiddingGuild
writeBiddingGuild( #pk_BiddingGuild{} = P ) ->
	Bin_guildID = binary_write_uint64( P#pk_BiddingGuild.guildID ),
	Bin_guildName = binary_write_string( P#pk_BiddingGuild.guildName ),
	Bin_biddingMoney = binary_write_uint( P#pk_BiddingGuild.biddingMoney ),
	[
		Bin_guildID,
		Bin_guildName,
		Bin_biddingMoney	].

%GENERATED from file:guild.h => CannonState
writeCannonState( #pk_CannonState{} = P ) ->
	Bin_collectID = binary_write_uint( P#pk_CannonState.collectID ),
	Bin_resetTime = binary_write_uint( P#pk_CannonState.resetTime ),
	[
		Bin_collectID,
		Bin_resetTime	].

%GENERATED from file:guild.h => ExpeditionFinalInfo
writeExpeditionFinalInfo( #pk_ExpeditionFinalInfo{} = P ) ->
	Bin_mapid = binary_write_uint( P#pk_ExpeditionFinalInfo.mapid ),
	Bin_topGuildInfoList = binary_write_array(P#pk_ExpeditionFinalInfo.topGuildInfoList, fun(X) -> writeExpeditionGuildBattleInfo( X ) end),
	[
		Bin_mapid,
		Bin_topGuildInfoList	].

%GENERATED from file:guild.h => ExpeditionGlobalMapInfo
writeExpeditionGlobalMapInfo( #pk_ExpeditionGlobalMapInfo{} = P ) ->
	Bin_mapid = binary_write_uint( P#pk_ExpeditionGlobalMapInfo.mapid ),
	Bin_onlineNumber = binary_write_uint16( P#pk_ExpeditionGlobalMapInfo.onlineNumber ),
	Bin_queueNumber = binary_write_uint16( P#pk_ExpeditionGlobalMapInfo.queueNumber ),
	[
		Bin_mapid,
		Bin_onlineNumber,
		Bin_queueNumber	].

%GENERATED from file:guild.h => ExpeditionGuildBattleInfo
writeExpeditionGuildBattleInfo( #pk_ExpeditionGuildBattleInfo{} = P ) ->
	Bin_guildID = binary_write_uint64( P#pk_ExpeditionGuildBattleInfo.guildID ),
	Bin_guildName = binary_write_string( P#pk_ExpeditionGuildBattleInfo.guildName ),
	Bin_guildScore = binary_write_uint64( P#pk_ExpeditionGuildBattleInfo.guildScore ),
	[
		Bin_guildID,
		Bin_guildName,
		Bin_guildScore	].

%GENERATED from file:guild.h => ExpeditionMapInfo
writeExpeditionMapInfo( #pk_ExpeditionMapInfo{} = P ) ->
	Bin_mapid = binary_write_uint( P#pk_ExpeditionMapInfo.mapid ),
	Bin_guildID = binary_write_uint64( P#pk_ExpeditionMapInfo.guildID ),
	Bin_guildName = binary_write_string( P#pk_ExpeditionMapInfo.guildName ),
	Bin_onlineNumber = binary_write_uint16( P#pk_ExpeditionMapInfo.onlineNumber ),
	Bin_queueNumber = binary_write_uint16( P#pk_ExpeditionMapInfo.queueNumber ),
	Bin_isGetReward = binary_write_uint8( P#pk_ExpeditionMapInfo.isGetReward ),
	[
		Bin_mapid,
		Bin_guildID,
		Bin_guildName,
		Bin_onlineNumber,
		Bin_queueNumber,
		Bin_isGetReward	].

%GENERATED from file:guild.h => ExpeditionPointInfo
writeExpeditionPointInfo( #pk_ExpeditionPointInfo{} = P ) ->
	Bin_pointIndex = binary_write_uint16( P#pk_ExpeditionPointInfo.pointIndex ),
	Bin_guildID = binary_write_uint64( P#pk_ExpeditionPointInfo.guildID ),
	Bin_guildName = binary_write_string( P#pk_ExpeditionPointInfo.guildName ),
	[
		Bin_pointIndex,
		Bin_guildID,
		Bin_guildName	].

%GENERATED from file:guild.h => GuildApplyMemberInfo
writeGuildApplyMemberInfo( #pk_GuildApplyMemberInfo{} = P ) ->
	Bin_roleID = binary_write_uint64( P#pk_GuildApplyMemberInfo.roleID ),
	Bin_roleCode = binary_write_uint64( P#pk_GuildApplyMemberInfo.roleCode ),
	Bin_roleName = binary_write_string( P#pk_GuildApplyMemberInfo.roleName ),
	Bin_combatNum = binary_write_uint( P#pk_GuildApplyMemberInfo.combatNum ),
	Bin_vipLevel = binary_write_uint8( P#pk_GuildApplyMemberInfo.vipLevel ),
	Bin_playerLevel = binary_write_uint16( P#pk_GuildApplyMemberInfo.playerLevel ),
	Bin_applyTime = binary_write_uint64( P#pk_GuildApplyMemberInfo.applyTime ),
	[
		Bin_roleID,
		Bin_roleCode,
		Bin_roleName,
		Bin_combatNum,
		Bin_vipLevel,
		Bin_playerLevel,
		Bin_applyTime	].

%GENERATED from file:guild.h => GuildBattleInfo
writeGuildBattleInfo( #pk_GuildBattleInfo{} = P ) ->
	Bin_guildID = binary_write_uint64( P#pk_GuildBattleInfo.guildID ),
	Bin_guildName = binary_write_string( P#pk_GuildBattleInfo.guildName ),
	Bin_guildLevel = binary_write_uint8( P#pk_GuildBattleInfo.guildLevel ),
	Bin_fightForce = binary_write_uint( P#pk_GuildBattleInfo.fightForce ),
	Bin_leaderName = binary_write_string( P#pk_GuildBattleInfo.leaderName ),
	Bin_leaderRoleID = binary_write_uint64( P#pk_GuildBattleInfo.leaderRoleID ),
	Bin_denoter = binary_write_uint8( P#pk_GuildBattleInfo.denoter ),
	[
		Bin_guildID,
		Bin_guildName,
		Bin_guildLevel,
		Bin_fightForce,
		Bin_leaderName,
		Bin_leaderRoleID,
		Bin_denoter	].

%GENERATED from file:guild.h => GuildBattlePlayerInfo
writeGuildBattlePlayerInfo( #pk_GuildBattlePlayerInfo{} = P ) ->
	Bin_guildID = binary_write_uint64( P#pk_GuildBattlePlayerInfo.guildID ),
	Bin_rank = binary_write_uint8( P#pk_GuildBattlePlayerInfo.rank ),
	Bin_roleID = binary_write_uint64( P#pk_GuildBattlePlayerInfo.roleID ),
	Bin_roleName = binary_write_string( P#pk_GuildBattlePlayerInfo.roleName ),
	Bin_point = binary_write_uint( P#pk_GuildBattlePlayerInfo.point ),
	[
		Bin_guildID,
		Bin_rank,
		Bin_roleID,
		Bin_roleName,
		Bin_point	].

%GENERATED from file:guild.h => GuildBattleResultInfo
writeGuildBattleResultInfo( #pk_GuildBattleResultInfo{} = P ) ->
	Bin_guildID = binary_write_uint64( P#pk_GuildBattleResultInfo.guildID ),
	Bin_guildName = binary_write_string( P#pk_GuildBattleResultInfo.guildName ),
	Bin_point = binary_write_uint( P#pk_GuildBattleResultInfo.point ),
	Bin_playerInfos = binary_write_array(P#pk_GuildBattleResultInfo.playerInfos, fun(X) -> writeGuildBattlePlayerInfo( X ) end),
	[
		Bin_guildID,
		Bin_guildName,
		Bin_point,
		Bin_playerInfos	].

%GENERATED from file:guild.h => GuildBuff
writeGuildBuff( #pk_GuildBuff{} = P ) ->
	Bin_confId = binary_write_uint( P#pk_GuildBuff.confId ),
	Bin_buffID = binary_write_uint( P#pk_GuildBuff.buffID ),
	Bin_getFlag = binary_write_uint8( P#pk_GuildBuff.getFlag ),
	[
		Bin_confId,
		Bin_buffID,
		Bin_getFlag	].

%GENERATED from file:guild.h => GuildBuffRole
writeGuildBuffRole( #pk_GuildBuffRole{} = P ) ->
	Bin_roleID = binary_write_uint64( P#pk_GuildBuffRole.roleID ),
	Bin_roleName = binary_write_string( P#pk_GuildBuffRole.roleName ),
	Bin_buyTime = binary_write_uint64( P#pk_GuildBuffRole.buyTime ),
	Bin_confId = binary_write_uint( P#pk_GuildBuffRole.confId ),
	Bin_buffID = binary_write_uint( P#pk_GuildBuffRole.buffID ),
	[
		Bin_roleID,
		Bin_roleName,
		Bin_buyTime,
		Bin_confId,
		Bin_buffID	].

%GENERATED from file:guild.h => GuildIDList
writeGuildIDList( #pk_GuildIDList{} = P ) ->
	Bin_guildID = binary_write_uint64( P#pk_GuildIDList.guildID ),
	Bin_guildName = binary_write_string( P#pk_GuildIDList.guildName ),
	[
		Bin_guildID,
		Bin_guildName	].

%GENERATED from file:guild.h => GuildInfo
writeGuildInfo( #pk_GuildInfo{} = P ) ->
	Bin_guildID = binary_write_uint64( P#pk_GuildInfo.guildID ),
	Bin_guildName = binary_write_string( P#pk_GuildInfo.guildName ),
	Bin_guildLevel = binary_write_uint8( P#pk_GuildInfo.guildLevel ),
	Bin_denoter = binary_write_uint8( P#pk_GuildInfo.denoter ),
	Bin_fightForce = binary_write_uint( P#pk_GuildInfo.fightForce ),
	Bin_memberNumber = binary_write_uint( P#pk_GuildInfo.memberNumber ),
	Bin_maxMemberNumber = binary_write_uint( P#pk_GuildInfo.maxMemberNumber ),
	Bin_leaderName = binary_write_string( P#pk_GuildInfo.leaderName ),
	Bin_leaderRoleID = binary_write_uint64( P#pk_GuildInfo.leaderRoleID ),
	Bin_isRequest = binary_write_uint8( P#pk_GuildInfo.isRequest ),
	[
		Bin_guildID,
		Bin_guildName,
		Bin_guildLevel,
		Bin_denoter,
		Bin_fightForce,
		Bin_memberNumber,
		Bin_maxMemberNumber,
		Bin_leaderName,
		Bin_leaderRoleID,
		Bin_isRequest	].

%GENERATED from file:guild.h => GuildMemberInfo
writeGuildMemberInfo( #pk_GuildMemberInfo{} = P ) ->
	Bin_roleID = binary_write_uint64( P#pk_GuildMemberInfo.roleID ),
	Bin_roleCode = binary_write_uint64( P#pk_GuildMemberInfo.roleCode ),
	Bin_roleName = binary_write_string( P#pk_GuildMemberInfo.roleName ),
	Bin_roleGuildLevel = binary_write_uint8( P#pk_GuildMemberInfo.roleGuildLevel ),
	Bin_liveness = binary_write_uint( P#pk_GuildMemberInfo.liveness ),
	Bin_combatNum = binary_write_uint( P#pk_GuildMemberInfo.combatNum ),
	Bin_offlineTime = binary_write_uint64( P#pk_GuildMemberInfo.offlineTime ),
	Bin_vipLevel = binary_write_uint8( P#pk_GuildMemberInfo.vipLevel ),
	Bin_playerLevel = binary_write_uint16( P#pk_GuildMemberInfo.playerLevel ),
	Bin_career = binary_write_uint( P#pk_GuildMemberInfo.career ),
	Bin_race = binary_write_uint8( P#pk_GuildMemberInfo.race ),
	Bin_sex = binary_write_uint8( P#pk_GuildMemberInfo.sex ),
	Bin_head = binary_write_int( P#pk_GuildMemberInfo.head ),
	[
		Bin_roleID,
		Bin_roleCode,
		Bin_roleName,
		Bin_roleGuildLevel,
		Bin_liveness,
		Bin_combatNum,
		Bin_offlineTime,
		Bin_vipLevel,
		Bin_playerLevel,
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_head	].

%GENERATED from file:guild.h => GuildSkill
writeGuildSkill( #pk_GuildSkill{} = P ) ->
	Bin_confId = binary_write_uint( P#pk_GuildSkill.confId ),
	Bin_skillID = binary_write_uint( P#pk_GuildSkill.skillID ),
	Bin_skillLvl = binary_write_uint16( P#pk_GuildSkill.skillLvl ),
	Bin_next_confID = binary_write_uint( P#pk_GuildSkill.next_confID ),
	[
		Bin_confId,
		Bin_skillID,
		Bin_skillLvl,
		Bin_next_confID	].

%GENERATED from file:guild.h => GuildTask
writeGuildTask( #pk_GuildTask{} = P ) ->
	Bin_taskType = binary_write_uint8( P#pk_GuildTask.taskType ),
	Bin_taskState = binary_write_uint8( P#pk_GuildTask.taskState ),
	Bin_curTimes = binary_write_uint16( P#pk_GuildTask.curTimes ),
	Bin_maxTimes = binary_write_uint16( P#pk_GuildTask.maxTimes ),
	Bin_accCDTime = binary_write_uint( P#pk_GuildTask.accCDTime ),
	Bin_taskID = binary_write_uint16( P#pk_GuildTask.taskID ),
	Bin_targetGuildID = binary_write_uint64( P#pk_GuildTask.targetGuildID ),
	Bin_targetGuildName = binary_write_string( P#pk_GuildTask.targetGuildName ),
	Bin_targetPlayerRoleID = binary_write_uint64( P#pk_GuildTask.targetPlayerRoleID ),
	Bin_targetPLayerName = binary_write_string( P#pk_GuildTask.targetPLayerName ),
	Bin_number1 = binary_write_uint( P#pk_GuildTask.number1 ),
	Bin_number2 = binary_write_uint( P#pk_GuildTask.number2 ),
	Bin_number3 = binary_write_uint( P#pk_GuildTask.number3 ),
	[
		Bin_taskType,
		Bin_taskState,
		Bin_curTimes,
		Bin_maxTimes,
		Bin_accCDTime,
		Bin_taskID,
		Bin_targetGuildID,
		Bin_targetGuildName,
		Bin_targetPlayerRoleID,
		Bin_targetPLayerName,
		Bin_number1,
		Bin_number2,
		Bin_number3	].

%GENERATED from file:guild.h => GuildWar
writeGuildWar( #pk_GuildWar{} = P ) ->
	Bin_stage = binary_write_uint8( P#pk_GuildWar.stage ),
	Bin_group = binary_write_uint8( P#pk_GuildWar.group ),
	Bin_guildID1 = binary_write_uint64( P#pk_GuildWar.guildID1 ),
	Bin_guildName1 = binary_write_string( P#pk_GuildWar.guildName1 ),
	Bin_guildID2 = binary_write_uint64( P#pk_GuildWar.guildID2 ),
	Bin_guildName2 = binary_write_string( P#pk_GuildWar.guildName2 ),
	Bin_guildID3 = binary_write_uint64( P#pk_GuildWar.guildID3 ),
	Bin_guildName3 = binary_write_string( P#pk_GuildWar.guildName3 ),
	Bin_winguildID = binary_write_uint64( P#pk_GuildWar.winguildID ),
	Bin_winguildName = binary_write_string( P#pk_GuildWar.winguildName ),
	[
		Bin_stage,
		Bin_group,
		Bin_guildID1,
		Bin_guildName1,
		Bin_guildID2,
		Bin_guildName2,
		Bin_guildID3,
		Bin_guildName3,
		Bin_winguildID,
		Bin_winguildName	].

%GENERATED from file:guild.h => GuildWarInfo
writeGuildWarInfo( #pk_GuildWarInfo{} = P ) ->
	Bin_guildID = binary_write_uint64( P#pk_GuildWarInfo.guildID ),
	Bin_guildName = binary_write_string( P#pk_GuildWarInfo.guildName ),
	Bin_all_integral = binary_write_uint( P#pk_GuildWarInfo.all_integral ),
	Bin_integrals = binary_write_array(P#pk_GuildWarInfo.integrals, fun(X) -> writeGuildWarInfoIntegral( X ) end),
	[
		Bin_guildID,
		Bin_guildName,
		Bin_all_integral,
		Bin_integrals	].

%GENERATED from file:guild.h => GuildWarInfoIntegral
writeGuildWarInfoIntegral( #pk_GuildWarInfoIntegral{} = P ) ->
	Bin_type = binary_write_uint8( P#pk_GuildWarInfoIntegral.type ),
	Bin_number = binary_write_uint16( P#pk_GuildWarInfoIntegral.number ),
	Bin_integral = binary_write_uint( P#pk_GuildWarInfoIntegral.integral ),
	[
		Bin_type,
		Bin_number,
		Bin_integral	].

%GENERATED from file:guild.h => GuildWarRank
writeGuildWarRank( #pk_GuildWarRank{} = P ) ->
	Bin_rank = binary_write_uint16( P#pk_GuildWarRank.rank ),
	Bin_roleID = binary_write_uint64( P#pk_GuildWarRank.roleID ),
	Bin_roleName = binary_write_string( P#pk_GuildWarRank.roleName ),
	Bin_killPlayer = binary_write_uint( P#pk_GuildWarRank.killPlayer ),
	Bin_secondAttack = binary_write_uint( P#pk_GuildWarRank.secondAttack ),
	[
		Bin_rank,
		Bin_roleID,
		Bin_roleName,
		Bin_killPlayer,
		Bin_secondAttack	].

%GENERATED from file:guild.h => GuildWarReward_coin
writeGuildWarReward_coin( #pk_GuildWarReward_coin{} = P ) ->
	Bin_cointype = binary_write_uint8( P#pk_GuildWarReward_coin.cointype ),
	Bin_number = binary_write_uint( P#pk_GuildWarReward_coin.number ),
	[
		Bin_cointype,
		Bin_number	].

%GENERATED from file:guild.h => GuildWarReward_item
writeGuildWarReward_item( #pk_GuildWarReward_item{} = P ) ->
	Bin_isBind = binary_write_uint8( P#pk_GuildWarReward_item.isBind ),
	Bin_itemID = binary_write_uint( P#pk_GuildWarReward_item.itemID ),
	Bin_itemNumber = binary_write_uint( P#pk_GuildWarReward_item.itemNumber ),
	[
		Bin_isBind,
		Bin_itemID,
		Bin_itemNumber	].

%GENERATED from file:guild.h => NameTable2
writeNameTable2( #pk_NameTable2{} = P ) ->
	Bin_id = binary_write_uint64( P#pk_NameTable2.id ),
	Bin_name = binary_write_string( P#pk_NameTable2.name ),
	[
		Bin_id,
		Bin_name	].

%GENERATED from file:guild.h => OccupyGuildInfo
writeOccupyGuildInfo( #pk_OccupyGuildInfo{} = P ) ->
	Bin_guildID = binary_write_uint64( P#pk_OccupyGuildInfo.guildID ),
	Bin_guildName = binary_write_string( P#pk_OccupyGuildInfo.guildName ),
	Bin_occupyIDs = binary_write_array(P#pk_OccupyGuildInfo.occupyIDs, fun(X) -> binary_write_uint( X ) end),
	Bin_allPoint = binary_write_uint( P#pk_OccupyGuildInfo.allPoint ),
	Bin_denoter = binary_write_uint8( P#pk_OccupyGuildInfo.denoter ),
	[
		Bin_guildID,
		Bin_guildName,
		Bin_occupyIDs,
		Bin_allPoint,
		Bin_denoter	].

%GENERATED from file:guild.h => PebbleState
writePebbleState( #pk_PebbleState{} = P ) ->
	Bin_monsterID = binary_write_uint( P#pk_PebbleState.monsterID ),
	Bin_curHP = binary_write_uint( P#pk_PebbleState.curHP ),
	Bin_maxHP = binary_write_uint( P#pk_PebbleState.maxHP ),
	Bin_resetTime = binary_write_uint( P#pk_PebbleState.resetTime ),
	[
		Bin_monsterID,
		Bin_curHP,
		Bin_maxHP,
		Bin_resetTime	].

%GENERATED from file:guild.h => Ride
writeRide( #pk_Ride{} = P ) ->
	Bin_id = binary_write_uint( P#pk_Ride.id ),
	Bin_level = binary_write_uint( P#pk_Ride.level ),
	Bin_state = binary_write_uint8( P#pk_Ride.state ),
	[
		Bin_id,
		Bin_level,
		Bin_state	].

%GENERATED from file:guild.h => RideRole
writeRideRole( #pk_RideRole{} = P ) ->
	Bin_roleID = binary_write_uint64( P#pk_RideRole.roleID ),
	Bin_guildID = binary_write_uint64( P#pk_RideRole.guildID ),
	Bin_rideID = binary_write_uint( P#pk_RideRole.rideID ),
	Bin_seatID = binary_write_uint( P#pk_RideRole.seatID ),
	Bin_time = binary_write_uint( P#pk_RideRole.time ),
	[
		Bin_roleID,
		Bin_guildID,
		Bin_rideID,
		Bin_seatID,
		Bin_time	].

%GENERATED from file:guild.h => SuppHistory
writeSuppHistory( #pk_SuppHistory{} = P ) ->
	Bin_time = binary_write_uint( P#pk_SuppHistory.time ),
	Bin_roleID = binary_write_uint64( P#pk_SuppHistory.roleID ),
	Bin_tarRoleID = binary_write_uint64( P#pk_SuppHistory.tarRoleID ),
	Bin_itemID = binary_write_uint16( P#pk_SuppHistory.itemID ),
	Bin_itemM = binary_write_uint16( P#pk_SuppHistory.itemM ),
	[
		Bin_time,
		Bin_roleID,
		Bin_tarRoleID,
		Bin_itemID,
		Bin_itemM	].

%GENERATED from file:guild.h => SuppHistory2
writeSuppHistory2( #pk_SuppHistory2{} = P ) ->
	Bin_career = binary_write_uint( P#pk_SuppHistory2.career ),
	Bin_race = binary_write_int8( P#pk_SuppHistory2.race ),
	Bin_sex = binary_write_int8( P#pk_SuppHistory2.sex ),
	Bin_head = binary_write_int( P#pk_SuppHistory2.head ),
	Bin_level = binary_write_int( P#pk_SuppHistory2.level ),
	Bin_history = writeSuppHistory( P#pk_SuppHistory2.history ),
	[
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_head,
		Bin_level,
		Bin_history	].

%GENERATED from file:guild.h => Supplication
writeSupplication( #pk_Supplication{} = P ) ->
	Bin_roleID = binary_write_uint64( P#pk_Supplication.roleID ),
	Bin_roleCode = binary_write_uint64( P#pk_Supplication.roleCode ),
	Bin_roleName = binary_write_string( P#pk_Supplication.roleName ),
	Bin_roleGuildLevel = binary_write_uint8( P#pk_Supplication.roleGuildLevel ),
	Bin_career = binary_write_uint( P#pk_Supplication.career ),
	Bin_race = binary_write_int8( P#pk_Supplication.race ),
	Bin_sex = binary_write_int8( P#pk_Supplication.sex ),
	Bin_head = binary_write_int( P#pk_Supplication.head ),
	Bin_level = binary_write_int( P#pk_Supplication.level ),
	Bin_itemID = binary_write_uint16( P#pk_Supplication.itemID ),
	Bin_itemM = binary_write_uint16( P#pk_Supplication.itemM ),
	Bin_isGive = binary_write_bool( P#pk_Supplication.isGive ),
	[
		Bin_roleID,
		Bin_roleCode,
		Bin_roleName,
		Bin_roleGuildLevel,
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_head,
		Bin_level,
		Bin_itemID,
		Bin_itemM,
		Bin_isGive	].

%GENERATED from file:home.h => FarmingPet
writeFarmingPet( #pk_FarmingPet{} = P ) ->
	Bin_petID = binary_write_uint16( P#pk_FarmingPet.petID ),
	Bin_deltaTime = binary_write_uint16( P#pk_FarmingPet.deltaTime ),
	Bin_time = binary_write_uint64( P#pk_FarmingPet.time ),
	Bin_lastdeltaTime = binary_write_uint16( P#pk_FarmingPet.lastdeltaTime ),
	[
		Bin_petID,
		Bin_deltaTime,
		Bin_time,
		Bin_lastdeltaTime	].

%GENERATED from file:home.h => HomeArea
writeHomeArea( #pk_HomeArea{} = P ) ->
	Bin_homeID = binary_write_uint64( P#pk_HomeArea.homeID ),
	Bin_areaID = binary_write_uint( P#pk_HomeArea.areaID ),
	Bin_areaLvl = binary_write_uint( P#pk_HomeArea.areaLvl ),
	[
		Bin_homeID,
		Bin_areaID,
		Bin_areaLvl	].

%GENERATED from file:home.h => HomeVisit
writeHomeVisit( #pk_HomeVisit{} = P ) ->
	Bin_roleID = binary_write_uint64( P#pk_HomeVisit.roleID ),
	Bin_roleName = binary_write_string( P#pk_HomeVisit.roleName ),
	Bin_level = binary_write_uint( P#pk_HomeVisit.level ),
	Bin_homeID = binary_write_uint64( P#pk_HomeVisit.homeID ),
	Bin_closeness = binary_write_int( P#pk_HomeVisit.closeness ),
	Bin_face = binary_write_array(P#pk_HomeVisit.face, fun(X) -> binary_write_uint8( X ) end),
	[
		Bin_roleID,
		Bin_roleName,
		Bin_level,
		Bin_homeID,
		Bin_closeness,
		Bin_face	].

%GENERATED from file:home.h => Plant
writePlant( #pk_Plant{} = P ) ->
	Bin_homeID = binary_write_uint64( P#pk_Plant.homeID ),
	Bin_areaType = binary_write_uint8( P#pk_Plant.areaType ),
	Bin_pos = binary_write_uint8( P#pk_Plant.pos ),
	Bin_id = binary_write_uint16( P#pk_Plant.id ),
	Bin_time = binary_write_uint( P#pk_Plant.time ),
	Bin_health = binary_write_uint8( P#pk_Plant.health ),
	Bin_wateringCount = binary_write_uint8( P#pk_Plant.wateringCount ),
	Bin_wateringTime = binary_write_uint( P#pk_Plant.wateringTime ),
	Bin_compostCount = binary_write_uint8( P#pk_Plant.compostCount ),
	Bin_compostTime = binary_write_uint8( P#pk_Plant.compostTime ),
	Bin_isPestis = binary_write_bool( P#pk_Plant.isPestis ),
	[
		Bin_homeID,
		Bin_areaType,
		Bin_pos,
		Bin_id,
		Bin_time,
		Bin_health,
		Bin_wateringCount,
		Bin_wateringTime,
		Bin_compostCount,
		Bin_compostTime,
		Bin_isPestis	].

%GENERATED from file:home.h => VisitRecord
writeVisitRecord( #pk_VisitRecord{} = P ) ->
	Bin_roleID = binary_write_uint64( P#pk_VisitRecord.roleID ),
	Bin_roleName = binary_write_string( P#pk_VisitRecord.roleName ),
	Bin_relationType = binary_write_uint8( P#pk_VisitRecord.relationType ),
	Bin_opType = binary_write_uint8( P#pk_VisitRecord.opType ),
	Bin_opParam1 = binary_write_uint( P#pk_VisitRecord.opParam1 ),
	Bin_opParam2 = binary_write_uint( P#pk_VisitRecord.opParam2 ),
	Bin_opParam3 = binary_write_uint( P#pk_VisitRecord.opParam3 ),
	Bin_timestamp = binary_write_uint64( P#pk_VisitRecord.timestamp ),
	[
		Bin_roleID,
		Bin_roleName,
		Bin_relationType,
		Bin_opType,
		Bin_opParam1,
		Bin_opParam2,
		Bin_opParam3,
		Bin_timestamp	].

%GENERATED from file:identity.h => GiftHistory
writeGiftHistory( #pk_GiftHistory{} = P ) ->
	Bin_index = binary_write_uint64( P#pk_GiftHistory.index ),
	Bin_time = binary_write_uint( P#pk_GiftHistory.time ),
	Bin_roleID = binary_write_uint64( P#pk_GiftHistory.roleID ),
	Bin_tarRoleID = binary_write_uint64( P#pk_GiftHistory.tarRoleID ),
	Bin_itemID = binary_write_uint16( P#pk_GiftHistory.itemID ),
	Bin_itemCount = binary_write_uint16( P#pk_GiftHistory.itemCount ),
	Bin_charmUpdate = binary_write_uint( P#pk_GiftHistory.charmUpdate ),
	[
		Bin_index,
		Bin_time,
		Bin_roleID,
		Bin_tarRoleID,
		Bin_itemID,
		Bin_itemCount,
		Bin_charmUpdate	].

%GENERATED from file:identity.h => MD5
writeMD5( #pk_MD5{} = P ) ->
	Bin_md5 = binary_write_array(P#pk_MD5.md5, fun(X) -> binary_write_uint8( X ) end),
	[
		Bin_md5	].

%GENERATED from file:identity.h => NameTable
writeNameTable( #pk_NameTable{} = P ) ->
	Bin_id = binary_write_uint64( P#pk_NameTable.id ),
	Bin_name = binary_write_string( P#pk_NameTable.name ),
	[
		Bin_id,
		Bin_name	].

%GENERATED from file:identity.h => RoleHeadPic
writeRoleHeadPic( #pk_RoleHeadPic{} = P ) ->
	Bin_roleID = binary_write_uint64( P#pk_RoleHeadPic.roleID ),
	Bin_md5 = binary_write_array(P#pk_RoleHeadPic.md5, fun(X) -> binary_write_uint8( X ) end),
	[
		Bin_roleID,
		Bin_md5	].

%GENERATED from file:item.h => GiftItemInfo
writeGiftItemInfo( #pk_GiftItemInfo{} = P ) ->
	Bin_itemid = binary_write_uint16( P#pk_GiftItemInfo.itemid ),
	Bin_number = binary_write_uint16( P#pk_GiftItemInfo.number ),
	[
		Bin_itemid,
		Bin_number	].

%GENERATED from file:item.h => LookInfoItem
writeLookInfoItem( #pk_LookInfoItem{} = P ) ->
	Bin_itemid = binary_write_uint16( P#pk_LookInfoItem.itemid ),
	Bin_sortid = binary_write_uint( P#pk_LookInfoItem.sortid ),
	Bin_type = binary_write_uint8( P#pk_LookInfoItem.type ),
	Bin_value = binary_write_uint( P#pk_LookInfoItem.value ),
	Bin_quality = binary_write_uint8( P#pk_LookInfoItem.quality ),
	Bin_useLevel = binary_write_uint16( P#pk_LookInfoItem.useLevel ),
	Bin_quotaNumber = binary_write_int( P#pk_LookInfoItem.quotaNumber ),
	[
		Bin_itemid,
		Bin_sortid,
		Bin_type,
		Bin_value,
		Bin_quality,
		Bin_useLevel,
		Bin_quotaNumber	].

%GENERATED from file:item.h => LookInfoItemAtMall
writeLookInfoItemAtMall( #pk_LookInfoItemAtMall{} = P ) ->
	Bin_itemid = binary_write_uint16( P#pk_LookInfoItemAtMall.itemid ),
	Bin_sortid = binary_write_uint8( P#pk_LookInfoItemAtMall.sortid ),
	Bin_type = binary_write_uint8( P#pk_LookInfoItemAtMall.type ),
	Bin_value = binary_write_uint( P#pk_LookInfoItemAtMall.value ),
	Bin_stockCount = binary_write_uint16( P#pk_LookInfoItemAtMall.stockCount ),
	Bin_stockGiftCount = binary_write_uint16( P#pk_LookInfoItemAtMall.stockGiftCount ),
	Bin_gifts = binary_write_array(P#pk_LookInfoItemAtMall.gifts, fun(X) -> writeGiftItemInfo( X ) end),
	Bin_saleStartTime = binary_write_uint( P#pk_LookInfoItemAtMall.saleStartTime ),
	Bin_saleEndTime = binary_write_uint( P#pk_LookInfoItemAtMall.saleEndTime ),
	Bin_quotaNum = binary_write_uint8( P#pk_LookInfoItemAtMall.quotaNum ),
	[
		Bin_itemid,
		Bin_sortid,
		Bin_type,
		Bin_value,
		Bin_stockCount,
		Bin_stockGiftCount,
		Bin_gifts,
		Bin_saleStartTime,
		Bin_saleEndTime,
		Bin_quotaNum	].

%GENERATED from file:item.h => MysteriousShopItem
writeMysteriousShopItem( #pk_MysteriousShopItem{} = P ) ->
	Bin_only_id = binary_write_uint( P#pk_MysteriousShopItem.only_id ),
	Bin_itemid = binary_write_uint16( P#pk_MysteriousShopItem.itemid ),
	Bin_money_type = binary_write_uint8( P#pk_MysteriousShopItem.money_type ),
	Bin_money = binary_write_uint( P#pk_MysteriousShopItem.money ),
	Bin_number = binary_write_int( P#pk_MysteriousShopItem.number ),
	[
		Bin_only_id,
		Bin_itemid,
		Bin_money_type,
		Bin_money,
		Bin_number	].

%GENERATED from file:item.h => RefindResInfo
writeRefindResInfo( #pk_RefindResInfo{} = P ) ->
	Bin_id = binary_write_uint( P#pk_RefindResInfo.id ),
	Bin_number = binary_write_int( P#pk_RefindResInfo.number ),
	[
		Bin_id,
		Bin_number	].

%GENERATED from file:item.h => UseItemCD
writeUseItemCD( #pk_UseItemCD{} = P ) ->
	Bin_itemGroupID = binary_write_uint16( P#pk_UseItemCD.itemGroupID ),
	Bin_remainCDTime = binary_write_uint( P#pk_UseItemCD.remainCDTime ),
	[
		Bin_itemGroupID,
		Bin_remainCDTime	].

%GENERATED from file:item.h => UseItemGainGoodsTips
writeUseItemGainGoodsTips( #pk_UseItemGainGoodsTips{} = P ) ->
	Bin_itemID = binary_write_uint( P#pk_UseItemGainGoodsTips.itemID ),
	Bin_itemNum = binary_write_uint16( P#pk_UseItemGainGoodsTips.itemNum ),
	Bin_quality = binary_write_uint8( P#pk_UseItemGainGoodsTips.quality ),
	Bin_isBind = binary_write_uint8( P#pk_UseItemGainGoodsTips.isBind ),
	[
		Bin_itemID,
		Bin_itemNum,
		Bin_quality,
		Bin_isBind	].

%GENERATED from file:luckycoin.h => GainLuckyCoinInfo
writeGainLuckyCoinInfo( #pk_GainLuckyCoinInfo{} = P ) ->
	Bin_time = binary_write_uint( P#pk_GainLuckyCoinInfo.time ),
	Bin_friendID = binary_write_uint64( P#pk_GainLuckyCoinInfo.friendID ),
	[
		Bin_time,
		Bin_friendID	].

%GENERATED from file:mail.h => MailCoin
writeMailCoin( #pk_MailCoin{} = P ) ->
	Bin_coinType = binary_write_uint8( P#pk_MailCoin.coinType ),
	Bin_coinNum = binary_write_uint( P#pk_MailCoin.coinNum ),
	[
		Bin_coinType,
		Bin_coinNum	].

%GENERATED from file:mail.h => MailDetail
writeMailDetail( #pk_MailDetail{} = P ) ->
	Bin_mailID = binary_write_uint64( P#pk_MailDetail.mailID ),
	Bin_sendRoleID = binary_write_uint64( P#pk_MailDetail.sendRoleID ),
	Bin_isLocked = binary_write_bool( P#pk_MailDetail.isLocked ),
	Bin_remainDay = binary_write_uint8( P#pk_MailDetail.remainDay ),
	Bin_sendPlayerName = binary_write_string( P#pk_MailDetail.sendPlayerName ),
	Bin_mailTitle = binary_write_string( P#pk_MailDetail.mailTitle ),
	Bin_mailContent = binary_write_string( P#pk_MailDetail.mailContent ),
	Bin_itemList = binary_write_array(P#pk_MailDetail.itemList, fun(X) -> writeMailItem( X ) end),
	Bin_coinList = binary_write_array(P#pk_MailDetail.coinList, fun(X) -> writeMailCoin( X ) end),
	[
		Bin_mailID,
		Bin_sendRoleID,
		Bin_isLocked,
		Bin_remainDay,
		Bin_sendPlayerName,
		Bin_mailTitle,
		Bin_mailContent,
		Bin_itemList,
		Bin_coinList	].

%GENERATED from file:mail.h => MailInfo
writeMailInfo( #pk_MailInfo{} = P ) ->
	Bin_mailID = binary_write_uint64( P#pk_MailInfo.mailID ),
	Bin_mailTitle = binary_write_string( P#pk_MailInfo.mailTitle ),
	Bin_mailReadTime = binary_write_uint64( P#pk_MailInfo.mailReadTime ),
	Bin_mailSendTime = binary_write_uint64( P#pk_MailInfo.mailSendTime ),
	Bin_ishaveAttach = binary_write_bool( P#pk_MailInfo.ishaveAttach ),
	Bin_senderName = binary_write_string( P#pk_MailInfo.senderName ),
	[
		Bin_mailID,
		Bin_mailTitle,
		Bin_mailReadTime,
		Bin_mailSendTime,
		Bin_ishaveAttach,
		Bin_senderName	].

%GENERATED from file:mail.h => MailItem
writeMailItem( #pk_MailItem{} = P ) ->
	Bin_itemUID = binary_write_uint64( P#pk_MailItem.itemUID ),
	Bin_itemID = binary_write_uint( P#pk_MailItem.itemID ),
	Bin_itemNumber = binary_write_uint( P#pk_MailItem.itemNumber ),
	Bin_quality = binary_write_uint8( P#pk_MailItem.quality ),
	Bin_isBind = binary_write_bool( P#pk_MailItem.isBind ),
	[
		Bin_itemUID,
		Bin_itemID,
		Bin_itemNumber,
		Bin_quality,
		Bin_isBind	].

%GENERATED from file:mail.h => MailItemAll
writeMailItemAll( #pk_MailItemAll{} = P ) ->
	Bin_itemID = binary_write_uint( P#pk_MailItemAll.itemID ),
	Bin_itemNumber = binary_write_uint( P#pk_MailItemAll.itemNumber ),
	[
		Bin_itemID,
		Bin_itemNumber	].

%GENERATED from file:mail.h => retMailOpt
writeretMailOpt( #pk_retMailOpt{} = P ) ->
	Bin_mailID = binary_write_uint64( P#pk_retMailOpt.mailID ),
	Bin_result = binary_write_bool( P#pk_retMailOpt.result ),
	[
		Bin_mailID,
		Bin_result	].

%GENERATED from file:mall.h => MallInfo
writeMallInfo( #pk_MallInfo{} = P ) ->
	Bin_db_id = binary_write_uint( P#pk_MallInfo.db_id ),
	Bin_itemid = binary_write_uint( P#pk_MallInfo.itemid ),
	Bin_buyNumDefalut = binary_write_uint16( P#pk_MallInfo.buyNumDefalut ),
	Bin_mainmenu = binary_write_int8( P#pk_MallInfo.mainmenu ),
	Bin_submenu = binary_write_int8( P#pk_MallInfo.submenu ),
	Bin_gold = binary_write_int( P#pk_MallInfo.gold ),
	Bin_bind_gold = binary_write_int( P#pk_MallInfo.bind_gold ),
	Bin_use_integral = binary_write_int( P#pk_MallInfo.use_integral ),
	Bin_get_integral = binary_write_int( P#pk_MallInfo.get_integral ),
	Bin_lefttime = binary_write_int( P#pk_MallInfo.lefttime ),
	Bin_leftcount = binary_write_int( P#pk_MallInfo.leftcount ),
	Bin_leftcountMax = binary_write_int( P#pk_MallInfo.leftcountMax ),
	Bin_sortNumber = binary_write_int( P#pk_MallInfo.sortNumber ),
	Bin_rebate = binary_write_int8( P#pk_MallInfo.rebate ),
	Bin_showtype = binary_write_int8( P#pk_MallInfo.showtype ),
	Bin_limitType = binary_write_int8( P#pk_MallInfo.limitType ),
	[
		Bin_db_id,
		Bin_itemid,
		Bin_buyNumDefalut,
		Bin_mainmenu,
		Bin_submenu,
		Bin_gold,
		Bin_bind_gold,
		Bin_use_integral,
		Bin_get_integral,
		Bin_lefttime,
		Bin_leftcount,
		Bin_leftcountMax,
		Bin_sortNumber,
		Bin_rebate,
		Bin_showtype,
		Bin_limitType	].

%GENERATED from file:marriage.h => SkillInfoForMarraige
writeSkillInfoForMarraige( #pk_SkillInfoForMarraige{} = P ) ->
	Bin_id = binary_write_uint( P#pk_SkillInfoForMarraige.id ),
	Bin_exp = binary_write_uint( P#pk_SkillInfoForMarraige.exp ),
	[
		Bin_id,
		Bin_exp	].

%GENERATED from file:mount.h => MountInfo
writeMountInfo( #pk_MountInfo{} = P ) ->
	Bin_level = binary_write_uint8( P#pk_MountInfo.level ),
	Bin_state = binary_write_uint8( P#pk_MountInfo.state ),
	Bin_curProcess = binary_write_uint( P#pk_MountInfo.curProcess ),
	Bin_shape_id = binary_write_uint16( P#pk_MountInfo.shape_id ),
	[
		Bin_level,
		Bin_state,
		Bin_curProcess,
		Bin_shape_id	].

%GENERATED from file:npc.h => NpcTitle
writeNpcTitle( #pk_NpcTitle{} = P ) ->
	Bin_npccode = binary_write_uint64( P#pk_NpcTitle.npccode ),
	Bin_new_title = binary_write_string( P#pk_NpcTitle.new_title ),
	[
		Bin_npccode,
		Bin_new_title	].

%GENERATED from file:pet.h => AddProp
writeAddProp( #pk_AddProp{} = P ) ->
	Bin_prop = binary_write_uint8( P#pk_AddProp.prop ),
	Bin_value = binary_write_float( P#pk_AddProp.value ),
	[
		Bin_prop,
		Bin_value	].

%GENERATED from file:pet.h => AssistBattleInfo
writeAssistBattleInfo( #pk_AssistBattleInfo{} = P ) ->
	Bin_petID = binary_write_uint16( P#pk_AssistBattleInfo.petID ),
	Bin_slot = binary_write_uint8( P#pk_AssistBattleInfo.slot ),
	[
		Bin_petID,
		Bin_slot	].

%GENERATED from file:pet.h => CatalogNode
writeCatalogNode( #pk_CatalogNode{} = P ) ->
	Bin_id = binary_write_uint16( P#pk_CatalogNode.id ),
	Bin_starLevel = binary_write_uint8( P#pk_CatalogNode.starLevel ),
	[
		Bin_id,
		Bin_starLevel	].

%GENERATED from file:pet.h => PetBaseInfo
writePetBaseInfo( #pk_PetBaseInfo{} = P ) ->
	Bin_petID = binary_write_uint16( P#pk_PetBaseInfo.petID ),
	Bin_petStar = binary_write_uint8( P#pk_PetBaseInfo.petStar ),
	Bin_status = binary_write_uint8( P#pk_PetBaseInfo.status ),
	Bin_skillList = binary_write_array(P#pk_PetBaseInfo.skillList, fun(X) -> writePetSkillBaseInfo( X ) end),
	Bin_petName = binary_write_string( P#pk_PetBaseInfo.petName ),
	Bin_petRaw = binary_write_uint8( P#pk_PetBaseInfo.petRaw ),
	Bin_petTime = binary_write_uint64( P#pk_PetBaseInfo.petTime ),
	Bin_petProps = binary_write_array(P#pk_PetBaseInfo.petProps, fun(X) -> writeAddProp( X ) end),
	Bin_petForce = binary_write_uint64( P#pk_PetBaseInfo.petForce ),
	Bin_upCount = binary_write_uint( P#pk_PetBaseInfo.upCount ),
	Bin_petLevel = binary_write_uint( P#pk_PetBaseInfo.petLevel ),
	Bin_petExp = binary_write_uint( P#pk_PetBaseInfo.petExp ),
	[
		Bin_petID,
		Bin_petStar,
		Bin_status,
		Bin_skillList,
		Bin_petName,
		Bin_petRaw,
		Bin_petTime,
		Bin_petProps,
		Bin_petForce,
		Bin_upCount,
		Bin_petLevel,
		Bin_petExp	].

%GENERATED from file:pet.h => PetEquipInfo
writePetEquipInfo( #pk_PetEquipInfo{} = P ) ->
	Bin_equipID = binary_write_uint8( P#pk_PetEquipInfo.equipID ),
	Bin_equipLv = binary_write_uint8( P#pk_PetEquipInfo.equipLv ),
	[
		Bin_equipID,
		Bin_equipLv	].

%GENERATED from file:pet.h => PetSkillBaseInfo
writePetSkillBaseInfo( #pk_PetSkillBaseInfo{} = P ) ->
	Bin_petSkillIndex = binary_write_uint8( P#pk_PetSkillBaseInfo.petSkillIndex ),
	Bin_petSkillId = binary_write_uint16( P#pk_PetSkillBaseInfo.petSkillId ),
	Bin_petSkillCd = binary_write_uint16( P#pk_PetSkillBaseInfo.petSkillCd ),
	Bin_petSkillType = binary_write_uint8( P#pk_PetSkillBaseInfo.petSkillType ),
	Bin_petSkillLv = binary_write_uint8( P#pk_PetSkillBaseInfo.petSkillLv ),
	Bin_petSkillIsUnlock = binary_write_uint8( P#pk_PetSkillBaseInfo.petSkillIsUnlock ),
	[
		Bin_petSkillIndex,
		Bin_petSkillId,
		Bin_petSkillCd,
		Bin_petSkillType,
		Bin_petSkillLv,
		Bin_petSkillIsUnlock	].

%GENERATED from file:pet.h => PetSkillCastResult
writePetSkillCastResult( #pk_PetSkillCastResult{} = P ) ->
	Bin_oldSkillID = binary_write_uint16( P#pk_PetSkillCastResult.oldSkillID ),
	Bin_newSkillID = binary_write_uint16( P#pk_PetSkillCastResult.newSkillID ),
	Bin_newSkillLevel = binary_write_uint16( P#pk_PetSkillCastResult.newSkillLevel ),
	[
		Bin_oldSkillID,
		Bin_newSkillID,
		Bin_newSkillLevel	].

%GENERATED from file:pet.h => PetTerritoryInfo
writePetTerritoryInfo( #pk_PetTerritoryInfo{} = P ) ->
	Bin_petID = binary_write_uint16( P#pk_PetTerritoryInfo.petID ),
	Bin_petForce = binary_write_uint64( P#pk_PetTerritoryInfo.petForce ),
	Bin_territoryID = binary_write_uint( P#pk_PetTerritoryInfo.territoryID ),
	Bin_star = binary_write_uint8( P#pk_PetTerritoryInfo.star ),
	Bin_raw = binary_write_uint8( P#pk_PetTerritoryInfo.raw ),
	[
		Bin_petID,
		Bin_petForce,
		Bin_territoryID,
		Bin_star,
		Bin_raw	].

%GENERATED from file:pet.h => PvPCityInfo
writePvPCityInfo( #pk_PvPCityInfo{} = P ) ->
	Bin_cityID = binary_write_uint8( P#pk_PvPCityInfo.cityID ),
	Bin_cityTime = binary_write_uint64( P#pk_PvPCityInfo.cityTime ),
	Bin_roleID = binary_write_uint64( P#pk_PvPCityInfo.roleID ),
	Bin_cityHp = binary_write_uint( P#pk_PvPCityInfo.cityHp ),
	Bin_cityMax = binary_write_uint( P#pk_PvPCityInfo.cityMax ),
	Bin_force = binary_write_uint( P#pk_PvPCityInfo.force ),
	Bin_roleName = binary_write_string( P#pk_PvPCityInfo.roleName ),
	Bin_petList = binary_write_array(P#pk_PvPCityInfo.petList, fun(X) -> binary_write_uint16( X ) end),
	[
		Bin_cityID,
		Bin_cityTime,
		Bin_roleID,
		Bin_cityHp,
		Bin_cityMax,
		Bin_force,
		Bin_roleName,
		Bin_petList	].

%GENERATED from file:pet.h => PveItem
writePveItem( #pk_PveItem{} = P ) ->
	Bin_id = binary_write_int16( P#pk_PveItem.id ),
	Bin_num = binary_write_int16( P#pk_PveItem.num ),
	[
		Bin_id,
		Bin_num	].

%GENERATED from file:pet.h => PveSweep
writePveSweep( #pk_PveSweep{} = P ) ->
	Bin_num = binary_write_uint8( P#pk_PveSweep.num ),
	Bin_coin = binary_write_int( P#pk_PveSweep.coin ),
	Bin_exp = binary_write_int( P#pk_PveSweep.exp ),
	Bin_itemList = binary_write_array(P#pk_PveSweep.itemList, fun(X) -> writePveItem( X ) end),
	[
		Bin_num,
		Bin_coin,
		Bin_exp,
		Bin_itemList	].

%GENERATED from file:pet.h => PvpBattleReportInfo
writePvpBattleReportInfo( #pk_PvpBattleReportInfo{} = P ) ->
	Bin_time = binary_write_uint64( P#pk_PvpBattleReportInfo.time ),
	Bin_type = binary_write_uint8( P#pk_PvpBattleReportInfo.type ),
	Bin_cityID = binary_write_uint8( P#pk_PvpBattleReportInfo.cityID ),
	Bin_roleID = binary_write_uint64( P#pk_PvpBattleReportInfo.roleID ),
	Bin_roleName = binary_write_string( P#pk_PvpBattleReportInfo.roleName ),
	[
		Bin_time,
		Bin_type,
		Bin_cityID,
		Bin_roleID,
		Bin_roleName	].

%GENERATED from file:pet.h => TerritoryHistoryCell
writeTerritoryHistoryCell( #pk_TerritoryHistoryCell{} = P ) ->
	Bin_time = binary_write_uint( P#pk_TerritoryHistoryCell.time ),
	Bin_roleName = binary_write_string( P#pk_TerritoryHistoryCell.roleName ),
	Bin_roleID = binary_write_uint64( P#pk_TerritoryHistoryCell.roleID ),
	Bin_territoryID = binary_write_uint( P#pk_TerritoryHistoryCell.territoryID ),
	Bin_cfgReward = binary_write_uint( P#pk_TerritoryHistoryCell.cfgReward ),
	Bin_count1 = binary_write_uint( P#pk_TerritoryHistoryCell.count1 ),
	Bin_count2 = binary_write_uint( P#pk_TerritoryHistoryCell.count2 ),
	[
		Bin_time,
		Bin_roleName,
		Bin_roleID,
		Bin_territoryID,
		Bin_cfgReward,
		Bin_count1,
		Bin_count2	].

%GENERATED from file:pet.h => TerritoryInfo
writeTerritoryInfo( #pk_TerritoryInfo{} = P ) ->
	Bin_territoryID = binary_write_uint( P#pk_TerritoryInfo.territoryID ),
	Bin_cfgReward = binary_write_uint( P#pk_TerritoryInfo.cfgReward ),
	Bin_cfgTime = binary_write_uint( P#pk_TerritoryInfo.cfgTime ),
	Bin_cfgLevel = binary_write_uint( P#pk_TerritoryInfo.cfgLevel ),
	Bin_cfgForce = binary_write_uint( P#pk_TerritoryInfo.cfgForce ),
	Bin_timeFresh = binary_write_uint( P#pk_TerritoryInfo.timeFresh ),
	Bin_timeEnd = binary_write_uint( P#pk_TerritoryInfo.timeEnd ),
	Bin_rewardCount1 = binary_write_uint( P#pk_TerritoryInfo.rewardCount1 ),
	Bin_rewardCount2 = binary_write_uint( P#pk_TerritoryInfo.rewardCount2 ),
	Bin_timeSafe = binary_write_uint( P#pk_TerritoryInfo.timeSafe ),
	Bin_timeSearch = binary_write_uint( P#pk_TerritoryInfo.timeSearch ),
	[
		Bin_territoryID,
		Bin_cfgReward,
		Bin_cfgTime,
		Bin_cfgLevel,
		Bin_cfgForce,
		Bin_timeFresh,
		Bin_timeEnd,
		Bin_rewardCount1,
		Bin_rewardCount2,
		Bin_timeSafe,
		Bin_timeSearch	].

%GENERATED from file:player.h => BattleProp
writeBattleProp( #pk_BattleProp{} = P ) ->
	Bin_index = binary_write_uint8( P#pk_BattleProp.index ),
	Bin_value = binary_write_float( P#pk_BattleProp.value ),
	[
		Bin_index,
		Bin_value	].

%GENERATED from file:player.h => BlockStatusChange
writeBlockStatusChange( #pk_BlockStatusChange{} = P ) ->
	Bin_blockName = binary_write_string( P#pk_BlockStatusChange.blockName ),
	Bin_blockStatus = binary_write_uint( P#pk_BlockStatusChange.blockStatus ),
	[
		Bin_blockName,
		Bin_blockStatus	].

%GENERATED from file:player.h => BuffBaseInfo
writeBuffBaseInfo( #pk_BuffBaseInfo{} = P ) ->
	Bin_buffUID = binary_write_uint64( P#pk_BuffBaseInfo.buffUID ),
	Bin_buffID = binary_write_uint( P#pk_BuffBaseInfo.buffID ),
	Bin_time = binary_write_uint( P#pk_BuffBaseInfo.time ),
	[
		Bin_buffUID,
		Bin_buffID,
		Bin_time	].

%GENERATED from file:player.h => CoinData
writeCoinData( #pk_CoinData{} = P ) ->
	Bin_coinType = binary_write_uint8( P#pk_CoinData.coinType ),
	Bin_value = binary_write_uint( P#pk_CoinData.value ),
	[
		Bin_coinType,
		Bin_value	].

%GENERATED from file:player.h => CopyMapDropItem
writeCopyMapDropItem( #pk_CopyMapDropItem{} = P ) ->
	Bin_itemUID = binary_write_uint64( P#pk_CopyMapDropItem.itemUID ),
	Bin_itemID = binary_write_uint16( P#pk_CopyMapDropItem.itemID ),
	Bin_number = binary_write_uint16( P#pk_CopyMapDropItem.number ),
	Bin_quality = binary_write_uint8( P#pk_CopyMapDropItem.quality ),
	Bin_isBind = binary_write_bool( P#pk_CopyMapDropItem.isBind ),
	[
		Bin_itemUID,
		Bin_itemID,
		Bin_number,
		Bin_quality,
		Bin_isBind	].

%GENERATED from file:player.h => CopyMapStatHurt
writeCopyMapStatHurt( #pk_CopyMapStatHurt{} = P ) ->
	Bin_roleID = binary_write_uint64( P#pk_CopyMapStatHurt.roleID ),
	Bin_beHurt = binary_write_uint( P#pk_CopyMapStatHurt.beHurt ),
	Bin_playerHurt = binary_write_uint( P#pk_CopyMapStatHurt.playerHurt ),
	Bin_petHurt = binary_write_uint( P#pk_CopyMapStatHurt.petHurt ),
	[
		Bin_roleID,
		Bin_beHurt,
		Bin_playerHurt,
		Bin_petHurt	].

%GENERATED from file:player.h => CopyObj
writeCopyObj( #pk_CopyObj{} = P ) ->
	Bin_targetID = binary_write_uint16( P#pk_CopyObj.targetID ),
	Bin_targetType = binary_write_uint8( P#pk_CopyObj.targetType ),
	Bin_curNumber = binary_write_uint16( P#pk_CopyObj.curNumber ),
	Bin_allNumber = binary_write_uint16( P#pk_CopyObj.allNumber ),
	[
		Bin_targetID,
		Bin_targetType,
		Bin_curNumber,
		Bin_allNumber	].

%GENERATED from file:player.h => CrossRoleBase
writeCrossRoleBase( #pk_CrossRoleBase{} = P ) ->
	Bin_id = binary_write_uint64( P#pk_CrossRoleBase.id ),
	Bin_name = binary_write_string( P#pk_CrossRoleBase.name ),
	Bin_server = binary_write_string( P#pk_CrossRoleBase.server ),
	Bin_level = binary_write_uint16( P#pk_CrossRoleBase.level ),
	Bin_career = binary_write_uint( P#pk_CrossRoleBase.career ),
	Bin_race = binary_write_uint8( P#pk_CrossRoleBase.race ),
	Bin_sex = binary_write_uint8( P#pk_CrossRoleBase.sex ),
	Bin_head = binary_write_int( P#pk_CrossRoleBase.head ),
	Bin_face = binary_write_array(P#pk_CrossRoleBase.face, fun(X) -> binary_write_uint8( X ) end),
	[
		Bin_id,
		Bin_name,
		Bin_server,
		Bin_level,
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_head,
		Bin_face	].

%GENERATED from file:player.h => LookInfoMonster
writeLookInfoMonster( #pk_LookInfoMonster{} = P ) ->
	Bin_code = binary_write_uint64( P#pk_LookInfoMonster.code ),
	Bin_id = binary_write_uint( P#pk_LookInfoMonster.id ),
	Bin_x = binary_write_float( P#pk_LookInfoMonster.x ),
	Bin_y = binary_write_float( P#pk_LookInfoMonster.y ),
	Bin_rotW = binary_write_float( P#pk_LookInfoMonster.rotW ),
	Bin_targetX = binary_write_float( P#pk_LookInfoMonster.targetX ),
	Bin_targetY = binary_write_float( P#pk_LookInfoMonster.targetY ),
	Bin_move_speed = binary_write_float( P#pk_LookInfoMonster.move_speed ),
	Bin_attack_speed = binary_write_float( P#pk_LookInfoMonster.attack_speed ),
	Bin_moveStatus = binary_write_uint8( P#pk_LookInfoMonster.moveStatus ),
	Bin_type = binary_write_uint8( P#pk_LookInfoMonster.type ),
	Bin_hp_per = binary_write_uint8( P#pk_LookInfoMonster.hp_per ),
	Bin_camp = binary_write_int8( P#pk_LookInfoMonster.camp ),
	Bin_usercode = binary_write_uint64( P#pk_LookInfoMonster.usercode ),
	Bin_groupID = binary_write_uint64( P#pk_LookInfoMonster.groupID ),
	Bin_guildID = binary_write_uint64( P#pk_LookInfoMonster.guildID ),
	Bin_buffs = binary_write_array(P#pk_LookInfoMonster.buffs, fun(X) -> writeBuffBaseInfo( X ) end),
	Bin_name = binary_write_string( P#pk_LookInfoMonster.name ),
	Bin_level = binary_write_uint16( P#pk_LookInfoMonster.level ),
	[
		Bin_code,
		Bin_id,
		Bin_x,
		Bin_y,
		Bin_rotW,
		Bin_targetX,
		Bin_targetY,
		Bin_move_speed,
		Bin_attack_speed,
		Bin_moveStatus,
		Bin_type,
		Bin_hp_per,
		Bin_camp,
		Bin_usercode,
		Bin_groupID,
		Bin_guildID,
		Bin_buffs,
		Bin_name,
		Bin_level	].

%GENERATED from file:player.h => LookInfoNpc
writeLookInfoNpc( #pk_LookInfoNpc{} = P ) ->
	Bin_code = binary_write_uint64( P#pk_LookInfoNpc.code ),
	Bin_id = binary_write_uint( P#pk_LookInfoNpc.id ),
	Bin_x = binary_write_float( P#pk_LookInfoNpc.x ),
	Bin_y = binary_write_float( P#pk_LookInfoNpc.y ),
	Bin_rotW = binary_write_float( P#pk_LookInfoNpc.rotW ),
	Bin_name = binary_write_string( P#pk_LookInfoNpc.name ),
	Bin_actionStatus = binary_write_uint( P#pk_LookInfoNpc.actionStatus ),
	Bin_title = binary_write_string( P#pk_LookInfoNpc.title ),
	[
		Bin_code,
		Bin_id,
		Bin_x,
		Bin_y,
		Bin_rotW,
		Bin_name,
		Bin_actionStatus,
		Bin_title	].

%GENERATED from file:player.h => LookInfoPet
writeLookInfoPet( #pk_LookInfoPet{} = P ) ->
	Bin_code = binary_write_uint64( P#pk_LookInfoPet.code ),
	Bin_id = binary_write_uint( P#pk_LookInfoPet.id ),
	Bin_name = binary_write_string( P#pk_LookInfoPet.name ),
	Bin_playerCode = binary_write_uint64( P#pk_LookInfoPet.playerCode ),
	Bin_x = binary_write_float( P#pk_LookInfoPet.x ),
	Bin_y = binary_write_float( P#pk_LookInfoPet.y ),
	Bin_targetX = binary_write_float( P#pk_LookInfoPet.targetX ),
	Bin_targetY = binary_write_float( P#pk_LookInfoPet.targetY ),
	Bin_move_speed = binary_write_float( P#pk_LookInfoPet.move_speed ),
	Bin_hp_per = binary_write_uint8( P#pk_LookInfoPet.hp_per ),
	Bin_status = binary_write_int8( P#pk_LookInfoPet.status ),
	Bin_camp = binary_write_int8( P#pk_LookInfoPet.camp ),
	Bin_pkMode = binary_write_uint8( P#pk_LookInfoPet.pkMode ),
	Bin_buffs = binary_write_array(P#pk_LookInfoPet.buffs, fun(X) -> writeBuffBaseInfo( X ) end),
	[
		Bin_code,
		Bin_id,
		Bin_name,
		Bin_playerCode,
		Bin_x,
		Bin_y,
		Bin_targetX,
		Bin_targetY,
		Bin_move_speed,
		Bin_hp_per,
		Bin_status,
		Bin_camp,
		Bin_pkMode,
		Bin_buffs	].

%GENERATED from file:player.h => MissionObjectInfo
writeMissionObjectInfo( #pk_MissionObjectInfo{} = P ) ->
	Bin_code = binary_write_uint64( P#pk_MissionObjectInfo.code ),
	Bin_id = binary_write_uint( P#pk_MissionObjectInfo.id ),
	Bin_x = binary_write_float( P#pk_MissionObjectInfo.x ),
	Bin_y = binary_write_float( P#pk_MissionObjectInfo.y ),
	Bin_rotW = binary_write_float( P#pk_MissionObjectInfo.rotW ),
	[
		Bin_code,
		Bin_id,
		Bin_x,
		Bin_y,
		Bin_rotW	].

%GENERATED from file:player.h => MoneyChanges
writeMoneyChanges( #pk_MoneyChanges{} = P ) ->
	Bin_code = binary_write_uint64( P#pk_MoneyChanges.code ),
	Bin_moneys = binary_write_array(P#pk_MoneyChanges.moneys, fun(X) -> writeMoneyInit( X ) end),
	[
		Bin_code,
		Bin_moneys	].

%GENERATED from file:player.h => MoneyInit
writeMoneyInit( #pk_MoneyInit{} = P ) ->
	Bin_moneyType = binary_write_uint8( P#pk_MoneyInit.moneyType ),
	Bin_value = binary_write_uint( P#pk_MoneyInit.value ),
	[
		Bin_moneyType,
		Bin_value	].

%GENERATED from file:player.h => MonsterBook
writeMonsterBook( #pk_MonsterBook{} = P ) ->
	Bin_id = binary_write_uint16( P#pk_MonsterBook.id ),
	Bin_kill = binary_write_uint( P#pk_MonsterBook.kill ),
	Bin_isSnap = binary_write_bool( P#pk_MonsterBook.isSnap ),
	Bin_isUnlock = binary_write_bool( P#pk_MonsterBook.isUnlock ),
	Bin_isReward = binary_write_bool( P#pk_MonsterBook.isReward ),
	[
		Bin_id,
		Bin_kill,
		Bin_isSnap,
		Bin_isUnlock,
		Bin_isReward	].

%GENERATED from file:player.h => NoticeInfo
writeNoticeInfo( #pk_NoticeInfo{} = P ) ->
	Bin_id = binary_write_int64( P#pk_NoticeInfo.id ),
	Bin_type = binary_write_int8( P#pk_NoticeInfo.type ),
	Bin_pos = binary_write_int8( P#pk_NoticeInfo.pos ),
	Bin_content = binary_write_string( P#pk_NoticeInfo.content ),
	Bin_color = binary_write_int( P#pk_NoticeInfo.color ),
	Bin_afterSecondStart = binary_write_int64( P#pk_NoticeInfo.afterSecondStart ),
	Bin_duration = binary_write_int64( P#pk_NoticeInfo.duration ),
	Bin_interval = binary_write_int( P#pk_NoticeInfo.interval ),
	[
		Bin_id,
		Bin_type,
		Bin_pos,
		Bin_content,
		Bin_color,
		Bin_afterSecondStart,
		Bin_duration,
		Bin_interval	].

%GENERATED from file:player.h => ObjBrief
writeObjBrief( #pk_ObjBrief{} = P ) ->
	Bin_code = binary_write_uint64( P#pk_ObjBrief.code ),
	Bin_name = binary_write_string( P#pk_ObjBrief.name ),
	Bin_x = binary_write_float( P#pk_ObjBrief.x ),
	Bin_y = binary_write_float( P#pk_ObjBrief.y ),
	[
		Bin_code,
		Bin_name,
		Bin_x,
		Bin_y	].

%GENERATED from file:player.h => PlayerDailyCount
writePlayerDailyCount( #pk_PlayerDailyCount{} = P ) ->
	Bin_dailyType = binary_write_uint( P#pk_PlayerDailyCount.dailyType ),
	Bin_dailyID = binary_write_uint( P#pk_PlayerDailyCount.dailyID ),
	Bin_dailyValue = binary_write_uint( P#pk_PlayerDailyCount.dailyValue ),
	[
		Bin_dailyType,
		Bin_dailyID,
		Bin_dailyValue	].

%GENERATED from file:player.h => PosInfo
writePosInfo( #pk_PosInfo{} = P ) ->
	Bin_x = binary_write_float( P#pk_PosInfo.x ),
	Bin_y = binary_write_float( P#pk_PosInfo.y ),
	[
		Bin_x,
		Bin_y	].

%GENERATED from file:player.h => PropFloat
writePropFloat( #pk_PropFloat{} = P ) ->
	Bin_index = binary_write_uint16( P#pk_PropFloat.index ),
	Bin_value = binary_write_float( P#pk_PropFloat.value ),
	[
		Bin_index,
		Bin_value	].

%GENERATED from file:player.h => PropInt
writePropInt( #pk_PropInt{} = P ) ->
	Bin_index = binary_write_uint16( P#pk_PropInt.index ),
	Bin_value = binary_write_int( P#pk_PropInt.value ),
	[
		Bin_index,
		Bin_value	].

%GENERATED from file:player.h => PropInt64
writePropInt64( #pk_PropInt64{} = P ) ->
	Bin_index = binary_write_uint16( P#pk_PropInt64.index ),
	Bin_value = binary_write_uint64( P#pk_PropInt64.value ),
	[
		Bin_index,
		Bin_value	].

%GENERATED from file:player.h => PropString
writePropString( #pk_PropString{} = P ) ->
	Bin_index = binary_write_uint16( P#pk_PropString.index ),
	Bin_value = binary_write_string( P#pk_PropString.value ),
	[
		Bin_index,
		Bin_value	].

%GENERATED from file:player.h => RaceTeamBase
writeRaceTeamBase( #pk_RaceTeamBase{} = P ) ->
	Bin_applyID = binary_write_uint64( P#pk_RaceTeamBase.applyID ),
	Bin_leaderID = binary_write_uint64( P#pk_RaceTeamBase.leaderID ),
	Bin_members = binary_write_array(P#pk_RaceTeamBase.members, fun(X) -> writeCrossRoleBase( X ) end),
	Bin_petID = binary_write_uint16( P#pk_RaceTeamBase.petID ),
	[
		Bin_applyID,
		Bin_leaderID,
		Bin_members,
		Bin_petID	].

%GENERATED from file:player.h => RaceTeamEx
writeRaceTeamEx( #pk_RaceTeamEx{} = P ) ->
	Bin_applyID = binary_write_uint64( P#pk_RaceTeamEx.applyID ),
	Bin_base = writeRaceTeamBase( P#pk_RaceTeamEx.base ),
	Bin_item = writeRaceTeamItem( P#pk_RaceTeamEx.item ),
	Bin_sort = writeRaceTeamSort( P#pk_RaceTeamEx.sort ),
	Bin_giveUpID = binary_write_uint64( P#pk_RaceTeamEx.giveUpID ),
	[
		Bin_applyID,
		Bin_base,
		Bin_item,
		Bin_sort,
		Bin_giveUpID	].

%GENERATED from file:player.h => RaceTeamItem
writeRaceTeamItem( #pk_RaceTeamItem{} = P ) ->
	Bin_listItemIDA = binary_write_array(P#pk_RaceTeamItem.listItemIDA, fun(X) -> binary_write_uint8( X ) end),
	Bin_listItemIDB = binary_write_array(P#pk_RaceTeamItem.listItemIDB, fun(X) -> binary_write_uint8( X ) end),
	[
		Bin_listItemIDA,
		Bin_listItemIDB	].

%GENERATED from file:player.h => RaceTeamSort
writeRaceTeamSort( #pk_RaceTeamSort{} = P ) ->
	Bin_laps = binary_write_uint8( P#pk_RaceTeamSort.laps ),
	Bin_milestone = binary_write_uint8( P#pk_RaceTeamSort.milestone ),
	Bin_time = binary_write_uint64( P#pk_RaceTeamSort.time ),
	[
		Bin_laps,
		Bin_milestone,
		Bin_time	].

%GENERATED from file:player.h => RechargeDoubleConf
writeRechargeDoubleConf( #pk_RechargeDoubleConf{} = P ) ->
	Bin_id = binary_write_uint( P#pk_RechargeDoubleConf.id ),
	Bin_payMoney = binary_write_float( P#pk_RechargeDoubleConf.payMoney ),
	[
		Bin_id,
		Bin_payMoney	].

%GENERATED from file:player.h => RewardUpdateResource
writeRewardUpdateResource( #pk_RewardUpdateResource{} = P ) ->
	Bin_count = binary_write_uint8( P#pk_RewardUpdateResource.count ),
	Bin_flag = binary_write_bool( P#pk_RewardUpdateResource.flag ),
	Bin_rewardList = binary_write_array(P#pk_RewardUpdateResource.rewardList, fun(X) -> writeUpdateReward( X ) end),
	[
		Bin_count,
		Bin_flag,
		Bin_rewardList	].

%GENERATED from file:player.h => RoleBaseInfo
writeRoleBaseInfo( #pk_RoleBaseInfo{} = P ) ->
	Bin_code = binary_write_uint64( P#pk_RoleBaseInfo.code ),
	Bin_roleID = binary_write_uint64( P#pk_RoleBaseInfo.roleID ),
	Bin_name = binary_write_string( P#pk_RoleBaseInfo.name ),
	Bin_servername = binary_write_string( P#pk_RoleBaseInfo.servername ),
	Bin_myServerName = binary_write_string( P#pk_RoleBaseInfo.myServerName ),
	Bin_isInCross = binary_write_bool( P#pk_RoleBaseInfo.isInCross ),
	Bin_x = binary_write_float( P#pk_RoleBaseInfo.x ),
	Bin_y = binary_write_float( P#pk_RoleBaseInfo.y ),
	Bin_head = binary_write_uint( P#pk_RoleBaseInfo.head ),
	Bin_level = binary_write_int16( P#pk_RoleBaseInfo.level ),
	Bin_camp = binary_write_int8( P#pk_RoleBaseInfo.camp ),
	Bin_career = binary_write_uint( P#pk_RoleBaseInfo.career ),
	Bin_race = binary_write_int8( P#pk_RoleBaseInfo.race ),
	Bin_sex = binary_write_int8( P#pk_RoleBaseInfo.sex ),
	Bin_vip = binary_write_int8( P#pk_RoleBaseInfo.vip ),
	Bin_hp_per = binary_write_uint8( P#pk_RoleBaseInfo.hp_per ),
	Bin_exp = binary_write_uint( P#pk_RoleBaseInfo.exp ),
	Bin_maxExp = binary_write_uint( P#pk_RoleBaseInfo.maxExp ),
	Bin_cur_hp = binary_write_uint( P#pk_RoleBaseInfo.cur_hp ),
	Bin_max_hp = binary_write_uint( P#pk_RoleBaseInfo.max_hp ),
	Bin_mp = binary_write_uint( P#pk_RoleBaseInfo.mp ),
	Bin_mountID = binary_write_uint16( P#pk_RoleBaseInfo.mountID ),
	Bin_otherCode = binary_write_uint64( P#pk_RoleBaseInfo.otherCode ),
	Bin_pkMode = binary_write_uint8( P#pk_RoleBaseInfo.pkMode ),
	Bin_maxCourage = binary_write_uint16( P#pk_RoleBaseInfo.maxCourage ),
	Bin_moneys = binary_write_array(P#pk_RoleBaseInfo.moneys, fun(X) -> writeMoneyInit( X ) end),
	Bin_visible_equips = binary_write_array(P#pk_RoleBaseInfo.visible_equips, fun(X) -> writevisibleEquip( X ) end),
	Bin_refine_levels = binary_write_array(P#pk_RoleBaseInfo.refine_levels, fun(X) -> writerefineLevel( X ) end),
	[
		Bin_code,
		Bin_roleID,
		Bin_name,
		Bin_servername,
		Bin_myServerName,
		Bin_isInCross,
		Bin_x,
		Bin_y,
		Bin_head,
		Bin_level,
		Bin_camp,
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_vip,
		Bin_hp_per,
		Bin_exp,
		Bin_maxExp,
		Bin_cur_hp,
		Bin_max_hp,
		Bin_mp,
		Bin_mountID,
		Bin_otherCode,
		Bin_pkMode,
		Bin_maxCourage,
		Bin_moneys,
		Bin_visible_equips,
		Bin_refine_levels	].

%GENERATED from file:player.h => SevenDayAimUpdate
writeSevenDayAimUpdate( #pk_SevenDayAimUpdate{} = P ) ->
	Bin_type = binary_write_int( P#pk_SevenDayAimUpdate.type ),
	Bin_args = binary_write_array(P#pk_SevenDayAimUpdate.args, fun(X) -> binary_write_int64( X ) end),
	[
		Bin_type,
		Bin_args	].

%GENERATED from file:player.h => TaskUseItem
writeTaskUseItem( #pk_TaskUseItem{} = P ) ->
	Bin_code = binary_write_uint64( P#pk_TaskUseItem.code ),
	Bin_id = binary_write_uint( P#pk_TaskUseItem.id ),
	Bin_x = binary_write_float( P#pk_TaskUseItem.x ),
	Bin_y = binary_write_float( P#pk_TaskUseItem.y ),
	Bin_rotW = binary_write_float( P#pk_TaskUseItem.rotW ),
	[
		Bin_code,
		Bin_id,
		Bin_x,
		Bin_y,
		Bin_rotW	].

%GENERATED from file:player.h => UpdateReward
writeUpdateReward( #pk_UpdateReward{} = P ) ->
	Bin_itemid = binary_write_uint16( P#pk_UpdateReward.itemid ),
	Bin_number = binary_write_uint16( P#pk_UpdateReward.number ),
	[
		Bin_itemid,
		Bin_number	].

%GENERATED from file:player.h => UserPlayerData
writeUserPlayerData( #pk_UserPlayerData{} = P ) ->
	Bin_roleID = binary_write_uint64( P#pk_UserPlayerData.roleID ),
	Bin_name = binary_write_string( P#pk_UserPlayerData.name ),
	Bin_level = binary_write_int( P#pk_UserPlayerData.level ),
	Bin_wingLevel = binary_write_int( P#pk_UserPlayerData.wingLevel ),
	Bin_camp = binary_write_int8( P#pk_UserPlayerData.camp ),
	Bin_race = binary_write_int8( P#pk_UserPlayerData.race ),
	Bin_career = binary_write_uint( P#pk_UserPlayerData.career ),
	Bin_sex = binary_write_int8( P#pk_UserPlayerData.sex ),
	Bin_head = binary_write_int( P#pk_UserPlayerData.head ),
	Bin_mapID = binary_write_uint16( P#pk_UserPlayerData.mapID ),
	Bin_oldMapID = binary_write_uint16( P#pk_UserPlayerData.oldMapID ),
	Bin_canRename = binary_write_bool( P#pk_UserPlayerData.canRename ),
	Bin_visible_equips = binary_write_array(P#pk_UserPlayerData.visible_equips, fun(X) -> writevisibleEquip( X ) end),
	Bin_fashionList = binary_write_array(P#pk_UserPlayerData.fashionList, fun(X) -> binary_write_uint16( X ) end),
	Bin_refine_levels = binary_write_array(P#pk_UserPlayerData.refine_levels, fun(X) -> writerefineLevel( X ) end),
	[
		Bin_roleID,
		Bin_name,
		Bin_level,
		Bin_wingLevel,
		Bin_camp,
		Bin_race,
		Bin_career,
		Bin_sex,
		Bin_head,
		Bin_mapID,
		Bin_oldMapID,
		Bin_canRename,
		Bin_visible_equips,
		Bin_fashionList,
		Bin_refine_levels	].

%GENERATED from file:player.h => lotteryForToweItem
writelotteryForToweItem( #pk_lotteryForToweItem{} = P ) ->
	Bin_pool_id = binary_write_uint( P#pk_lotteryForToweItem.pool_id ),
	Bin_cfg_id = binary_write_uint( P#pk_lotteryForToweItem.cfg_id ),
	Bin_itemID = binary_write_uint( P#pk_lotteryForToweItem.itemID ),
	Bin_itemNumber = binary_write_uint( P#pk_lotteryForToweItem.itemNumber ),
	Bin_isBind = binary_write_uint( P#pk_lotteryForToweItem.isBind ),
	Bin_isWin = binary_write_int16( P#pk_lotteryForToweItem.isWin ),
	[
		Bin_pool_id,
		Bin_cfg_id,
		Bin_itemID,
		Bin_itemNumber,
		Bin_isBind,
		Bin_isWin	].

%GENERATED from file:player.h => lotteryForTowerNotice
writelotteryForTowerNotice( #pk_lotteryForTowerNotice{} = P ) ->
	Bin_roleName = binary_write_string( P#pk_lotteryForTowerNotice.roleName ),
	Bin_itemID = binary_write_uint( P#pk_lotteryForTowerNotice.itemID ),
	Bin_itemNumber = binary_write_uint( P#pk_lotteryForTowerNotice.itemNumber ),
	[
		Bin_roleName,
		Bin_itemID,
		Bin_itemNumber	].

%GENERATED from file:player.h => lottery_award_item_info
writelottery_award_item_info( #pk_lottery_award_item_info{} = P ) ->
	Bin_itemID = binary_write_uint( P#pk_lottery_award_item_info.itemID ),
	Bin_itemNumber = binary_write_uint( P#pk_lottery_award_item_info.itemNumber ),
	[
		Bin_itemID,
		Bin_itemNumber	].

%GENERATED from file:player.h => lsbattlefield_award
writelsbattlefield_award( #pk_lsbattlefield_award{} = P ) ->
	Bin_itemid = binary_write_uint16( P#pk_lsbattlefield_award.itemid ),
	Bin_number = binary_write_uint16( P#pk_lsbattlefield_award.number ),
	Bin_isBind = binary_write_uint( P#pk_lsbattlefield_award.isBind ),
	[
		Bin_itemid,
		Bin_number,
		Bin_isBind	].

%GENERATED from file:player.h => lsbattlefield_rank
writelsbattlefield_rank( #pk_lsbattlefield_rank{} = P ) ->
	Bin_index = binary_write_uint16( P#pk_lsbattlefield_rank.index ),
	Bin_score = binary_write_uint16( P#pk_lsbattlefield_rank.score ),
	Bin_roleName = binary_write_string( P#pk_lsbattlefield_rank.roleName ),
	[
		Bin_index,
		Bin_score,
		Bin_roleName	].

%GENERATED from file:player.h => pushItem
writepushItem( #pk_pushItem{} = P ) ->
	Bin_sku = binary_write_uint( P#pk_pushItem.sku ),
	Bin_itemID = binary_write_uint( P#pk_pushItem.itemID ),
	Bin_num = binary_write_uint16( P#pk_pushItem.num ),
	Bin_isBinded = binary_write_uint8( P#pk_pushItem.isBinded ),
	Bin_price = binary_write_uint( P#pk_pushItem.price ),
	Bin_rebate = binary_write_uint8( P#pk_pushItem.rebate ),
	Bin_coinType = binary_write_uint8( P#pk_pushItem.coinType ),
	Bin_limited = binary_write_uint8( P#pk_pushItem.limited ),
	[
		Bin_sku,
		Bin_itemID,
		Bin_num,
		Bin_isBinded,
		Bin_price,
		Bin_rebate,
		Bin_coinType,
		Bin_limited	].

%GENERATED from file:player.h => refineLevel
writerefineLevel( #pk_refineLevel{} = P ) ->
	Bin_type = binary_write_uint8( P#pk_refineLevel.type ),
	Bin_level = binary_write_uint8( P#pk_refineLevel.level ),
	[
		Bin_type,
		Bin_level	].

%GENERATED from file:player.h => visibleEquip
writevisibleEquip( #pk_visibleEquip{} = P ) ->
	Bin_equipID = binary_write_uint( P#pk_visibleEquip.equipID ),
	Bin_quality = binary_write_uint8( P#pk_visibleEquip.quality ),
	[
		Bin_equipID,
		Bin_quality	].

%GENERATED from file:rank.h => ActivityMapRankData
writeActivityMapRankData( #pk_ActivityMapRankData{} = P ) ->
	Bin_name = binary_write_string( P#pk_ActivityMapRankData.name ),
	Bin_value = binary_write_uint( P#pk_ActivityMapRankData.value ),
	[
		Bin_name,
		Bin_value	].

%GENERATED from file:rank.h => PlayerEquip
writePlayerEquip( #pk_PlayerEquip{} = P ) ->
	Bin_equipID = binary_write_uint( P#pk_PlayerEquip.equipID ),
	Bin_quality = binary_write_uint8( P#pk_PlayerEquip.quality ),
	[
		Bin_equipID,
		Bin_quality	].

%GENERATED from file:rank.h => PlayerEquipLevel
writePlayerEquipLevel( #pk_PlayerEquipLevel{} = P ) ->
	Bin_type = binary_write_uint8( P#pk_PlayerEquipLevel.type ),
	Bin_level = binary_write_uint8( P#pk_PlayerEquipLevel.level ),
	[
		Bin_type,
		Bin_level	].

%GENERATED from file:rank.h => RankInfo
writeRankInfo( #pk_RankInfo{} = P ) ->
	Bin_rankSort = binary_write_uint8( P#pk_RankInfo.rankSort ),
	Bin_rankSortC = binary_write_int8( P#pk_RankInfo.rankSortC ),
	Bin_roleID = binary_write_uint64( P#pk_RankInfo.roleID ),
	Bin_name = binary_write_string( P#pk_RankInfo.name ),
	Bin_wingLevel = binary_write_int( P#pk_RankInfo.wingLevel ),
	Bin_rankValue1 = binary_write_int64( P#pk_RankInfo.rankValue1 ),
	Bin_rankValue2 = binary_write_int64( P#pk_RankInfo.rankValue2 ),
	Bin_rankValue3 = binary_write_int64( P#pk_RankInfo.rankValue3 ),
	Bin_title = writeTitleData( P#pk_RankInfo.title ),
	Bin_career = binary_write_uint( P#pk_RankInfo.career ),
	Bin_race = binary_write_int8( P#pk_RankInfo.race ),
	Bin_sex = binary_write_int8( P#pk_RankInfo.sex ),
	Bin_head = binary_write_int( P#pk_RankInfo.head ),
	Bin_level = binary_write_int( P#pk_RankInfo.level ),
	[
		Bin_rankSort,
		Bin_rankSortC,
		Bin_roleID,
		Bin_name,
		Bin_wingLevel,
		Bin_rankValue1,
		Bin_rankValue2,
		Bin_rankValue3,
		Bin_title,
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_head,
		Bin_level	].

%GENERATED from file:rank.h => TitleData
writeTitleData( #pk_TitleData{} = P ) ->
	Bin_title1 = binary_write_uint( P#pk_TitleData.title1 ),
	Bin_title2 = binary_write_uint( P#pk_TitleData.title2 ),
	Bin_title3 = binary_write_uint( P#pk_TitleData.title3 ),
	Bin_color = binary_write_uint( P#pk_TitleData.color ),
	Bin_background = binary_write_uint( P#pk_TitleData.background ),
	[
		Bin_title1,
		Bin_title2,
		Bin_title3,
		Bin_color,
		Bin_background	].

%GENERATED from file:redenvelope.h => redEnvelopeBaseInfo
writeredEnvelopeBaseInfo( #pk_redEnvelopeBaseInfo{} = P ) ->
	Bin_redUID = binary_write_uint64( P#pk_redEnvelopeBaseInfo.redUID ),
	Bin_creatorRoleID = binary_write_uint64( P#pk_redEnvelopeBaseInfo.creatorRoleID ),
	Bin_targetUID = binary_write_uint64( P#pk_redEnvelopeBaseInfo.targetUID ),
	Bin_luckContent = binary_write_string( P#pk_redEnvelopeBaseInfo.luckContent ),
	Bin_creatorName = binary_write_string( P#pk_redEnvelopeBaseInfo.creatorName ),
	Bin_creatorLevel = binary_write_uint( P#pk_redEnvelopeBaseInfo.creatorLevel ),
	Bin_type = binary_write_uint8( P#pk_redEnvelopeBaseInfo.type ),
	Bin_targetType = binary_write_uint8( P#pk_redEnvelopeBaseInfo.targetType ),
	Bin_creatorCareer = binary_write_uint( P#pk_redEnvelopeBaseInfo.creatorCareer ),
	Bin_creatorRace = binary_write_uint8( P#pk_redEnvelopeBaseInfo.creatorRace ),
	Bin_creatorSex = binary_write_uint8( P#pk_redEnvelopeBaseInfo.creatorSex ),
	Bin_creatorHead = binary_write_int( P#pk_redEnvelopeBaseInfo.creatorHead ),
	Bin_allMoney = binary_write_uint( P#pk_redEnvelopeBaseInfo.allMoney ),
	Bin_allNumber = binary_write_uint( P#pk_redEnvelopeBaseInfo.allNumber ),
	Bin_takenMoney = binary_write_uint( P#pk_redEnvelopeBaseInfo.takenMoney ),
	Bin_takenNumber = binary_write_uint( P#pk_redEnvelopeBaseInfo.takenNumber ),
	[
		Bin_redUID,
		Bin_creatorRoleID,
		Bin_targetUID,
		Bin_luckContent,
		Bin_creatorName,
		Bin_creatorLevel,
		Bin_type,
		Bin_targetType,
		Bin_creatorCareer,
		Bin_creatorRace,
		Bin_creatorSex,
		Bin_creatorHead,
		Bin_allMoney,
		Bin_allNumber,
		Bin_takenMoney,
		Bin_takenNumber	].

%GENERATED from file:redenvelope.h => redEnvelopeHistory
writeredEnvelopeHistory( #pk_redEnvelopeHistory{} = P ) ->
	Bin_redUID = binary_write_uint64( P#pk_redEnvelopeHistory.redUID ),
	Bin_creatorRoleID = binary_write_uint64( P#pk_redEnvelopeHistory.creatorRoleID ),
	Bin_creatorName = binary_write_string( P#pk_redEnvelopeHistory.creatorName ),
	Bin_createTime = binary_write_uint( P#pk_redEnvelopeHistory.createTime ),
	Bin_targetType = binary_write_uint8( P#pk_redEnvelopeHistory.targetType ),
	Bin_moneyNumber = binary_write_int( P#pk_redEnvelopeHistory.moneyNumber ),
	[
		Bin_redUID,
		Bin_creatorRoleID,
		Bin_creatorName,
		Bin_createTime,
		Bin_targetType,
		Bin_moneyNumber	].

%GENERATED from file:redenvelope.h => redEnvelopeInfo
writeredEnvelopeInfo( #pk_redEnvelopeInfo{} = P ) ->
	Bin_baseInfo = writeredEnvelopeBaseInfo( P#pk_redEnvelopeInfo.baseInfo ),
	Bin_takenList = binary_write_array(P#pk_redEnvelopeInfo.takenList, fun(X) -> writetakeHistory( X ) end),
	[
		Bin_baseInfo,
		Bin_takenList	].

%GENERATED from file:redenvelope.h => takeHistory
writetakeHistory( #pk_takeHistory{} = P ) ->
	Bin_takeRoleID = binary_write_uint64( P#pk_takeHistory.takeRoleID ),
	Bin_takeName = binary_write_string( P#pk_takeHistory.takeName ),
	Bin_takeTime = binary_write_uint( P#pk_takeHistory.takeTime ),
	Bin_takeMoney = binary_write_uint( P#pk_takeHistory.takeMoney ),
	[
		Bin_takeRoleID,
		Bin_takeName,
		Bin_takeTime,
		Bin_takeMoney	].

%GENERATED from file:rune.h => RuneBaseProp
writeRuneBaseProp( #pk_RuneBaseProp{} = P ) ->
	Bin_prop = binary_write_uint8( P#pk_RuneBaseProp.prop ),
	Bin_calcType = binary_write_uint8( P#pk_RuneBaseProp.calcType ),
	Bin_value = binary_write_float( P#pk_RuneBaseProp.value ),
	[
		Bin_prop,
		Bin_calcType,
		Bin_value	].

%GENERATED from file:rune.h => RuneInfo
writeRuneInfo( #pk_RuneInfo{} = P ) ->
	Bin_runeUID = binary_write_uint64( P#pk_RuneInfo.runeUID ),
	Bin_pos = binary_write_uint( P#pk_RuneInfo.pos ),
	Bin_runeID = binary_write_uint( P#pk_RuneInfo.runeID ),
	Bin_level = binary_write_uint8( P#pk_RuneInfo.level ),
	Bin_exp = binary_write_uint( P#pk_RuneInfo.exp ),
	Bin_isBind = binary_write_bool( P#pk_RuneInfo.isBind ),
	Bin_validSecond = binary_write_uint( P#pk_RuneInfo.validSecond ),
	Bin_baseProps = binary_write_array(P#pk_RuneInfo.baseProps, fun(X) -> writeRuneBaseProp( X ) end),
	Bin_randProps = binary_write_array(P#pk_RuneInfo.randProps, fun(X) -> writeRuneRandProp( X ) end),
	[
		Bin_runeUID,
		Bin_pos,
		Bin_runeID,
		Bin_level,
		Bin_exp,
		Bin_isBind,
		Bin_validSecond,
		Bin_baseProps,
		Bin_randProps	].

%GENERATED from file:rune.h => RuneRandProp
writeRuneRandProp( #pk_RuneRandProp{} = P ) ->
	Bin_prop = writeRuneBaseProp( P#pk_RuneRandProp.prop ),
	Bin_indexNumber = binary_write_uint( P#pk_RuneRandProp.indexNumber ),
	[
		Bin_prop,
		Bin_indexNumber	].

%GENERATED from file:rune.h => RuneSuitProp
writeRuneSuitProp( #pk_RuneSuitProp{} = P ) ->
	Bin_props = binary_write_array(P#pk_RuneSuitProp.props, fun(X) -> writeRuneBaseProp( X ) end),
	Bin_suitID = binary_write_uint( P#pk_RuneSuitProp.suitID ),
	Bin_suitNum = binary_write_uint8( P#pk_RuneSuitProp.suitNum ),
	Bin_ownerID = binary_write_uint( P#pk_RuneSuitProp.ownerID ),
	[
		Bin_props,
		Bin_suitID,
		Bin_suitNum,
		Bin_ownerID	].

%GENERATED from file:setting.h => SwitchVariantInfo
writeSwitchVariantInfo( #pk_SwitchVariantInfo{} = P ) ->
	Bin_bitIndex = binary_write_uint( P#pk_SwitchVariantInfo.bitIndex ),
	Bin_bitValue = binary_write_bool( P#pk_SwitchVariantInfo.bitValue ),
	[
		Bin_bitIndex,
		Bin_bitValue	].

%GENERATED from file:setting.h => VariantInfo
writeVariantInfo( #pk_VariantInfo{} = P ) ->
	Bin_index = binary_write_uint16( P#pk_VariantInfo.index ),
	Bin_value = binary_write_uint( P#pk_VariantInfo.value ),
	[
		Bin_index,
		Bin_value	].

%GENERATED from file:signin.h => SignInInfo
writeSignInInfo( #pk_SignInInfo{} = P ) ->
	Bin_signType = binary_write_uint8( P#pk_SignInInfo.signType ),
	Bin_itemList = binary_write_array(P#pk_SignInInfo.itemList, fun(X) -> writeSignItem( X ) end),
	Bin_signState = binary_write_uint8( P#pk_SignInInfo.signState ),
	[
		Bin_signType,
		Bin_itemList,
		Bin_signState	].

%GENERATED from file:signin.h => SignItem
writeSignItem( #pk_SignItem{} = P ) ->
	Bin_itemID = binary_write_uint16( P#pk_SignItem.itemID ),
	Bin_itemNumber = binary_write_uint16( P#pk_SignItem.itemNumber ),
	[
		Bin_itemID,
		Bin_itemNumber	].

%GENERATED from file:skill.h => OpenSlot
writeOpenSlot( #pk_OpenSlot{} = P ) ->
	Bin_slot = binary_write_uint8( P#pk_OpenSlot.slot ),
	Bin_type = binary_write_uint8( P#pk_OpenSlot.type ),
	[
		Bin_slot,
		Bin_type	].

%GENERATED from file:skill.h => SkillInfo
writeSkillInfo( #pk_SkillInfo{} = P ) ->
	Bin_id = binary_write_uint( P#pk_SkillInfo.id ),
	Bin_level = binary_write_uint( P#pk_SkillInfo.level ),
	Bin_remainCD = binary_write_uint( P#pk_SkillInfo.remainCD ),
	[
		Bin_id,
		Bin_level,
		Bin_remainCD	].

%GENERATED from file:skill.h => SkillSlotInfo
writeSkillSlotInfo( #pk_SkillSlotInfo{} = P ) ->
	Bin_index = binary_write_uint( P#pk_SkillSlotInfo.index ),
	Bin_skillID = binary_write_uint( P#pk_SkillSlotInfo.skillID ),
	[
		Bin_index,
		Bin_skillID	].

%GENERATED from file:talent.h => TalentInfo
writeTalentInfo( #pk_TalentInfo{} = P ) ->
	Bin_id = binary_write_uint8( P#pk_TalentInfo.id ),
	Bin_level = binary_write_uint8( P#pk_TalentInfo.level ),
	Bin_nextlevelexp = binary_write_uint64( P#pk_TalentInfo.nextlevelexp ),
	[
		Bin_id,
		Bin_level,
		Bin_nextlevelexp	].

%GENERATED from file:task.h => SubmittedTaskInfo
writeSubmittedTaskInfo( #pk_SubmittedTaskInfo{} = P ) ->
	Bin_slot = binary_write_uint16( P#pk_SubmittedTaskInfo.slot ),
	Bin_value = binary_write_uint64( P#pk_SubmittedTaskInfo.value ),
	[
		Bin_slot,
		Bin_value	].

%GENERATED from file:task.h => acceptedAimTask
writeacceptedAimTask( #pk_acceptedAimTask{} = P ) ->
	Bin_aimType = binary_write_int( P#pk_acceptedAimTask.aimType ),
	Bin_aimIndex = binary_write_int( P#pk_acceptedAimTask.aimIndex ),
	Bin_aimCurCount = binary_write_int( P#pk_acceptedAimTask.aimCurCount ),
	[
		Bin_aimType,
		Bin_aimIndex,
		Bin_aimCurCount	].

%GENERATED from file:task.h => acceptedBaseTask
writeacceptedBaseTask( #pk_acceptedBaseTask{} = P ) ->
	Bin_taskID = binary_write_int( P#pk_acceptedBaseTask.taskID ),
	Bin_taskProcess = binary_write_array(P#pk_acceptedBaseTask.taskProcess, fun(X) -> writeacceptedAimTask( X ) end),
	[
		Bin_taskID,
		Bin_taskProcess	].

%GENERATED from file:task.h => taskInfo
writetaskInfo( #pk_taskInfo{} = P ) ->
	Bin_taskID = binary_write_int( P#pk_taskInfo.taskID ),
	Bin_target = binary_write_int( P#pk_taskInfo.target ),
	Bin_curNumber = binary_write_int( P#pk_taskInfo.curNumber ),
	Bin_maxNumber = binary_write_int( P#pk_taskInfo.maxNumber ),
	[
		Bin_taskID,
		Bin_target,
		Bin_curNumber,
		Bin_maxNumber	].

%GENERATED from file:team.h => FightingCapacityInfo
writeFightingCapacityInfo( #pk_FightingCapacityInfo{} = P ) ->
	Bin_roleID = binary_write_uint64( P#pk_FightingCapacityInfo.roleID ),
	Bin_fightingCapacity = binary_write_uint64( P#pk_FightingCapacityInfo.fightingCapacity ),
	[
		Bin_roleID,
		Bin_fightingCapacity	].

%GENERATED from file:team.h => NearTeamInfo
writeNearTeamInfo( #pk_NearTeamInfo{} = P ) ->
	Bin_teamID = binary_write_int64( P#pk_NearTeamInfo.teamID ),
	Bin_leaderID = binary_write_uint64( P#pk_NearTeamInfo.leaderID ),
	Bin_leaderName = binary_write_string( P#pk_NearTeamInfo.leaderName ),
	Bin_leaderLevel = binary_write_int16( P#pk_NearTeamInfo.leaderLevel ),
	Bin_numberOfTeam = binary_write_uint8( P#pk_NearTeamInfo.numberOfTeam ),
	Bin_career = binary_write_uint( P#pk_NearTeamInfo.career ),
	Bin_race = binary_write_uint8( P#pk_NearTeamInfo.race ),
	Bin_sex = binary_write_uint8( P#pk_NearTeamInfo.sex ),
	Bin_head = binary_write_int( P#pk_NearTeamInfo.head ),
	[
		Bin_teamID,
		Bin_leaderID,
		Bin_leaderName,
		Bin_leaderLevel,
		Bin_numberOfTeam,
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_head	].

%GENERATED from file:team.h => NotTeamMemberInfo
writeNotTeamMemberInfo( #pk_NotTeamMemberInfo{} = P ) ->
	Bin_id = binary_write_uint64( P#pk_NotTeamMemberInfo.id ),
	Bin_name = binary_write_string( P#pk_NotTeamMemberInfo.name ),
	Bin_level = binary_write_uint16( P#pk_NotTeamMemberInfo.level ),
	Bin_career = binary_write_uint( P#pk_NotTeamMemberInfo.career ),
	Bin_race = binary_write_uint8( P#pk_NotTeamMemberInfo.race ),
	Bin_sex = binary_write_uint8( P#pk_NotTeamMemberInfo.sex ),
	Bin_head = binary_write_int( P#pk_NotTeamMemberInfo.head ),
	[
		Bin_id,
		Bin_name,
		Bin_level,
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_head	].

%GENERATED from file:team.h => OnlineMemberSnapshot
writeOnlineMemberSnapshot( #pk_OnlineMemberSnapshot{} = P ) ->
	Bin_playerID = binary_write_uint64( P#pk_OnlineMemberSnapshot.playerID ),
	Bin_code = binary_write_uint64( P#pk_OnlineMemberSnapshot.code ),
	Bin_guildID = binary_write_uint64( P#pk_OnlineMemberSnapshot.guildID ),
	Bin_playerName = binary_write_string( P#pk_OnlineMemberSnapshot.playerName ),
	Bin_guildName = binary_write_string( P#pk_OnlineMemberSnapshot.guildName ),
	Bin_career = binary_write_uint( P#pk_OnlineMemberSnapshot.career ),
	Bin_level = binary_write_uint16( P#pk_OnlineMemberSnapshot.level ),
	Bin_friendState = binary_write_uint8( P#pk_OnlineMemberSnapshot.friendState ),
	Bin_race = binary_write_uint8( P#pk_OnlineMemberSnapshot.race ),
	Bin_sex = binary_write_uint8( P#pk_OnlineMemberSnapshot.sex ),
	Bin_head = binary_write_int( P#pk_OnlineMemberSnapshot.head ),
	Bin_force = binary_write_uint( P#pk_OnlineMemberSnapshot.force ),
	[
		Bin_playerID,
		Bin_code,
		Bin_guildID,
		Bin_playerName,
		Bin_guildName,
		Bin_career,
		Bin_level,
		Bin_friendState,
		Bin_race,
		Bin_sex,
		Bin_head,
		Bin_force	].

%GENERATED from file:team.h => TeamBaseInfo
writeTeamBaseInfo( #pk_TeamBaseInfo{} = P ) ->
	Bin_teamID = binary_write_uint64( P#pk_TeamBaseInfo.teamID ),
	Bin_leaderID = binary_write_uint64( P#pk_TeamBaseInfo.leaderID ),
	Bin_copyMapID = binary_write_int( P#pk_TeamBaseInfo.copyMapID ),
	Bin_canBeSearched = binary_write_int( P#pk_TeamBaseInfo.canBeSearched ),
	Bin_searchStartTime = binary_write_uint64( P#pk_TeamBaseInfo.searchStartTime ),
	[
		Bin_teamID,
		Bin_leaderID,
		Bin_copyMapID,
		Bin_canBeSearched,
		Bin_searchStartTime	].

%GENERATED from file:team.h => TeamMemberInfo
writeTeamMemberInfo( #pk_TeamMemberInfo{} = P ) ->
	Bin_playerID = binary_write_uint64( P#pk_TeamMemberInfo.playerID ),
	Bin_code = binary_write_uint64( P#pk_TeamMemberInfo.code ),
	Bin_playerName = binary_write_string( P#pk_TeamMemberInfo.playerName ),
	Bin_guildID = binary_write_uint64( P#pk_TeamMemberInfo.guildID ),
	Bin_guildName = binary_write_string( P#pk_TeamMemberInfo.guildName ),
	Bin_force = binary_write_uint64( P#pk_TeamMemberInfo.force ),
	Bin_level = binary_write_uint16( P#pk_TeamMemberInfo.level ),
	Bin_career = binary_write_uint( P#pk_TeamMemberInfo.career ),
	Bin_race = binary_write_uint8( P#pk_TeamMemberInfo.race ),
	Bin_sex = binary_write_uint8( P#pk_TeamMemberInfo.sex ),
	Bin_head = binary_write_int( P#pk_TeamMemberInfo.head ),
	Bin_hpPercent = binary_write_uint8( P#pk_TeamMemberInfo.hpPercent ),
	Bin_mapID = binary_write_uint16( P#pk_TeamMemberInfo.mapID ),
	Bin_groupID = binary_write_uint( P#pk_TeamMemberInfo.groupID ),
	Bin_mapInstanceID = binary_write_uint64( P#pk_TeamMemberInfo.mapInstanceID ),
	Bin_assistMapID = binary_write_uint16( P#pk_TeamMemberInfo.assistMapID ),
	Bin_x = binary_write_float( P#pk_TeamMemberInfo.x ),
	Bin_y = binary_write_float( P#pk_TeamMemberInfo.y ),
	Bin_customInfo = binary_write_string( P#pk_TeamMemberInfo.customInfo ),
	Bin_copyMapLeftCount = binary_write_uint16( P#pk_TeamMemberInfo.copyMapLeftCount ),
	Bin_actionPoint = binary_write_uint( P#pk_TeamMemberInfo.actionPoint ),
	[
		Bin_playerID,
		Bin_code,
		Bin_playerName,
		Bin_guildID,
		Bin_guildName,
		Bin_force,
		Bin_level,
		Bin_career,
		Bin_race,
		Bin_sex,
		Bin_head,
		Bin_hpPercent,
		Bin_mapID,
		Bin_groupID,
		Bin_mapInstanceID,
		Bin_assistMapID,
		Bin_x,
		Bin_y,
		Bin_customInfo,
		Bin_copyMapLeftCount,
		Bin_actionPoint	].

%GENERATED from file:team.h => TeamMemberInfoEx
writeTeamMemberInfoEx( #pk_TeamMemberInfoEx{} = P ) ->
	Bin_playerID = binary_write_uint64( P#pk_TeamMemberInfoEx.playerID ),
	Bin_code = binary_write_uint64( P#pk_TeamMemberInfoEx.code ),
	Bin_level = binary_write_uint16( P#pk_TeamMemberInfoEx.level ),
	Bin_hpPercent = binary_write_uint16( P#pk_TeamMemberInfoEx.hpPercent ),
	Bin_mapID = binary_write_uint16( P#pk_TeamMemberInfoEx.mapID ),
	Bin_groupID = binary_write_uint( P#pk_TeamMemberInfoEx.groupID ),
	Bin_mapInstanceID = binary_write_uint64( P#pk_TeamMemberInfoEx.mapInstanceID ),
	Bin_copyMapLeftCount = binary_write_uint16( P#pk_TeamMemberInfoEx.copyMapLeftCount ),
	Bin_actionPoint = binary_write_uint( P#pk_TeamMemberInfoEx.actionPoint ),
	Bin_force = binary_write_uint64( P#pk_TeamMemberInfoEx.force ),
	Bin_assistMapID = binary_write_uint16( P#pk_TeamMemberInfoEx.assistMapID ),
	Bin_x = binary_write_float( P#pk_TeamMemberInfoEx.x ),
	Bin_y = binary_write_float( P#pk_TeamMemberInfoEx.y ),
	[
		Bin_playerID,
		Bin_code,
		Bin_level,
		Bin_hpPercent,
		Bin_mapID,
		Bin_groupID,
		Bin_mapInstanceID,
		Bin_copyMapLeftCount,
		Bin_actionPoint,
		Bin_force,
		Bin_assistMapID,
		Bin_x,
		Bin_y	].

%GENERATED from file:team.h => TeamMemberLocation
writeTeamMemberLocation( #pk_TeamMemberLocation{} = P ) ->
	Bin_playerID = binary_write_uint64( P#pk_TeamMemberLocation.playerID ),
	Bin_x = binary_write_float( P#pk_TeamMemberLocation.x ),
	Bin_y = binary_write_float( P#pk_TeamMemberLocation.y ),
	[
		Bin_playerID,
		Bin_x,
		Bin_y	].

%GENERATED from file:team.h => TeamMemberSnapshot
writeTeamMemberSnapshot( #pk_TeamMemberSnapshot{} = P ) ->
	Bin_playerID = binary_write_uint64( P#pk_TeamMemberSnapshot.playerID ),
	Bin_code = binary_write_uint64( P#pk_TeamMemberSnapshot.code ),
	Bin_playerName = binary_write_string( P#pk_TeamMemberSnapshot.playerName ),
	Bin_career = binary_write_uint( P#pk_TeamMemberSnapshot.career ),
	Bin_level = binary_write_uint16( P#pk_TeamMemberSnapshot.level ),
	Bin_race = binary_write_uint8( P#pk_TeamMemberSnapshot.race ),
	Bin_sex = binary_write_uint8( P#pk_TeamMemberSnapshot.sex ),
	Bin_head = binary_write_int( P#pk_TeamMemberSnapshot.head ),
	Bin_force = binary_write_uint64( P#pk_TeamMemberSnapshot.force ),
	Bin_guildID = binary_write_uint64( P#pk_TeamMemberSnapshot.guildID ),
	[
		Bin_playerID,
		Bin_code,
		Bin_playerName,
		Bin_career,
		Bin_level,
		Bin_race,
		Bin_sex,
		Bin_head,
		Bin_force,
		Bin_guildID	].

%GENERATED from file:team.h => TeamSnapshot
writeTeamSnapshot( #pk_TeamSnapshot{} = P ) ->
	Bin_base = writeTeamBaseInfo( P#pk_TeamSnapshot.base ),
	Bin_members = binary_write_array(P#pk_TeamSnapshot.members, fun(X) -> writeTeamMemberSnapshot( X ) end),
	[
		Bin_base,
		Bin_members	].

%GENERATED from file:trade.h => DealRecord
writeDealRecord( #pk_DealRecord{} = P ) ->
	Bin_itemID = binary_write_uint( P#pk_DealRecord.itemID ),
	Bin_sellType = binary_write_uint8( P#pk_DealRecord.sellType ),
	Bin_buyorsell = binary_write_uint8( P#pk_DealRecord.buyorsell ),
	Bin_dealTime = binary_write_uint64( P#pk_DealRecord.dealTime ),
	Bin_gold = binary_write_uint( P#pk_DealRecord.gold ),
	Bin_diamond = binary_write_uint( P#pk_DealRecord.diamond ),
	Bin_tax = binary_write_uint( P#pk_DealRecord.tax ),
	[
		Bin_itemID,
		Bin_sellType,
		Bin_buyorsell,
		Bin_dealTime,
		Bin_gold,
		Bin_diamond,
		Bin_tax	].

%GENERATED from file:trade.h => QueryTradeList
writeQueryTradeList( #pk_QueryTradeList{} = P ) ->
	Bin_orderID = binary_write_uint64( P#pk_QueryTradeList.orderID ),
	Bin_itemUID = binary_write_uint64( P#pk_QueryTradeList.itemUID ),
	Bin_itemID = binary_write_uint( P#pk_QueryTradeList.itemID ),
	Bin_roleName = binary_write_string( P#pk_QueryTradeList.roleName ),
	Bin_sellType = binary_write_uint8( P#pk_QueryTradeList.sellType ),
	Bin_putTime = binary_write_uint64( P#pk_QueryTradeList.putTime ),
	Bin_downTime = binary_write_uint64( P#pk_QueryTradeList.downTime ),
	Bin_gold = binary_write_uint( P#pk_QueryTradeList.gold ),
	Bin_diamond = binary_write_uint( P#pk_QueryTradeList.diamond ),
	Bin_destRoleName = binary_write_string( P#pk_QueryTradeList.destRoleName ),
	Bin_quality = binary_write_uint8( P#pk_QueryTradeList.quality ),
	Bin_itemLevel = binary_write_uint8( P#pk_QueryTradeList.itemLevel ),
	Bin_pileCount = binary_write_uint( P#pk_QueryTradeList.pileCount ),
	[
		Bin_orderID,
		Bin_itemUID,
		Bin_itemID,
		Bin_roleName,
		Bin_sellType,
		Bin_putTime,
		Bin_downTime,
		Bin_gold,
		Bin_diamond,
		Bin_destRoleName,
		Bin_quality,
		Bin_itemLevel,
		Bin_pileCount	].

%GENERATED from file:trade.h => ReferenceItem
writeReferenceItem( #pk_ReferenceItem{} = P ) ->
	Bin_itemID = binary_write_uint( P#pk_ReferenceItem.itemID ),
	Bin_sellNumber = binary_write_uint16( P#pk_ReferenceItem.sellNumber ),
	Bin_gold = binary_write_uint( P#pk_ReferenceItem.gold ),
	Bin_diamond = binary_write_uint( P#pk_ReferenceItem.diamond ),
	[
		Bin_itemID,
		Bin_sellNumber,
		Bin_gold,
		Bin_diamond	].

%GENERATED from file:wake.h => WakeInfo
writeWakeInfo( #pk_WakeInfo{} = P ) ->
	Bin_cardID = binary_write_uint8( P#pk_WakeInfo.cardID ),
	Bin_level = binary_write_uint8( P#pk_WakeInfo.level ),
	Bin_curNum = binary_write_uint16( P#pk_WakeInfo.curNum ),
	Bin_activeProgress = binary_write_uint16( P#pk_WakeInfo.activeProgress ),
	Bin_unlockStateMax = binary_write_uint8( P#pk_WakeInfo.unlockStateMax ),
	Bin_curState = binary_write_uint8( P#pk_WakeInfo.curState ),
	[
		Bin_cardID,
		Bin_level,
		Bin_curNum,
		Bin_activeProgress,
		Bin_unlockStateMax,
		Bin_curState	].

