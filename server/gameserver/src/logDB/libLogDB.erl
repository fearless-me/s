%%日志数据库存取模块

-module(libLogDB).

-include("dbsInc.hrl").
-include("emysql.hrl").
-include("logDBPrivate.hrl").
-include("gamedataLog.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initLogSavePrepare/0,
	saveLog_main/2,
	saveLog_Real/2,
	canSaveLog/0
]).

-spec initLogSavePrepare() -> ok.
initLogSavePrepare() ->
	emysql:prepare(stSaveLogAccountLogin,"call saveLogAccountLogin(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"),
	emysql:prepare(stSaveLogChatInfo, "INSERT DELAYED INTO log_chat_info (SendPlayerID, Receiveplayerid, ChatString, ChatChannel, time)
											VALUES (?,?,?,?,?)"),
	emysql:prepare(stSaveLogCoin, "call saveLogCoin(?,?,?,?,?,?,?,?,?,?,?,?,?,?)"),
	emysql:prepare(stSaveLogCreateGoods, "call saveLogCreateGoods(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"),
	emysql:prepare(stSaveLogCreateTitle, "call saveLogCreateTitle(?, ?, ?, ?)"),
	emysql:prepare(stSaveLogCreateMail, "INSERT DELAYED INTO log_create_mail(MailUID, SenderRoleID, SenderRoleName, ToRoleID, ToRoleName, MailTitle, MailContent,
                  						MailSubjoinMsg, AttachItemUID_1, AttachItemDataID_1, AttachItemUID_2,
                  						AttachItemDataID_2, AttachCoinType, AttachCoin, time)
                  						VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"),
	emysql:prepare(stSaveLogCreatePet, "call saveLogCreatePet(?, ?, ?)"),
	emysql:prepare(stSaveLogCreatePlayer, "call saveLogCreatePlayer(?, ?, ?, ?, ?, ?, ?, ?)"),
	emysql:prepare(stSaveLogCreateTrade, "call saveLogCreateTrade(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"),
	emysql:prepare(stSaveLogExpChange, "call saveLogExpChange(?, ?, ?, ?, ?, ?, ?)"),
	emysql:prepare(stSaveLogGold, "call saveLogGold(?,?,?,?,?,?,?,?,?,?,?,?,?,?)"),
	emysql:prepare(stSaveLogGoodsChange, "call saveLogGoodsChange(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"),
	emysql:prepare(stSaveLogMailChange, "call saveLogMailChange(?, ?, ?, ?)"),
	emysql:prepare(stSaveLogMallBuy, "call saveLogMallBuy(?, ?, ?, ?, ?, ?)"),
	emysql:prepare(stSaveLogOnlinePlayers, "call saveLogOnlinePlayers(?, ?)"),
	emysql:prepare(stSaveLogPlayerDelete, "call saveLogPlayerDelete(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"),
	emysql:prepare(stSaveLogPlayerOffline, "call saveLogPlayerOffline(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"),
	emysql:prepare(stSaveLogPresentRecharge, "call saveLogPresentRecharge(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"),
	emysql:prepare(stSaveLogRecharge, "call saveLogRecharge(?,?,?,?,?,?,?,?,?,?,?)"),
	emysql:prepare(stSaveLogRechargeClient, "call saveLogRechargeClient(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"),
	emysql:prepare(stSaveLogSkill, "call saveLogSkill(?, ?, ?, ?)"),
	emysql:prepare(stSaveLogTask, "call saveLogTask(?, ?, ?, ?, ?)"),
	emysql:prepare(stSaveLogTrade, "call saveLogTrade(?, ?, ?, ?, ?, ?,?,?)"),
	emysql:prepare(stSaveLogWeb2lsCommand, "call saveLogWeb2lsCommand(?, ?,?, ?, ?, ?, ?,?,?,?,?)"),
	emysql:prepare(stSaveLogGmCmd, "call saveLogGMCmd(?, ?,?)"),
	emysql:prepare(stSaveLogPlayerLevel, "call saveLogPlayerLevel(?, ?,?,?)"),
	emysql:prepare(stSaveLogPlayerCoupleBack, "call saveLogPlayerCoupleBack(?,?,?,?,?,?,?,?)"),
	emysql:prepare(stSaveLogRankData, "call saveLogRankData(?,?,?,?,?,?,?,?)"),
	emysql:prepare(stSaveLogActivityHDHurt, "call saveLogActivityHDHurt(?,?,?,?,?,?)"),
	emysql:prepare(stSaveLogActivityHDKill, "call saveLogActivityHDKill(?,?,?,?,?,?)"),
	emysql:prepare(stSaveLogEvent, "call saveLogEvent(?,?,?,?,?,?)"),
	emysql:prepare(stSaveLogForbidden, "call saveLogForbiddenInfo(?,?,?,?,?)"),
	emysql:prepare(stSaveLogMallChange, "call saveLogMallChange(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"),
	emysql:prepare(stSaveLogAchieveNum, "call saveLogAchieveNum(?,?,?,?,?,?)"),
	emysql:prepare(stSaveLogRoleExt, "call SaveLogRoleExt(?,?,?,?,?)"),
	emysql:prepare(stSaveLogGuildBattleInfo, "INSERT INTO log_guild_battle_info
				  (guildName,guildLevel,currentOnlineNum,recTime) VALUES (
				  ? -- guildName - CHAR(20) NOT NULL
				  ,? -- guildLevel - SMALLINT(5) NOT NULL
				  ,? -- currentOnlineNum - SMALLINT(5) NOT NULL
				  ,? -- recTime - INT(10) NOT NULL
				  )"),
	emysql:prepare(stSaveLogCopy,  "INSERT DELAYED INTO log_copy (AccountID, RoleID, CopyMapType, CopyMapID,StartTime,
					DecrActionPoint,IsPass,EndTime ,GoldReward , ExpReward,DropItems)
											VALUES (?,?,?,?,?,?,?,?,?,?,?)"),
	createParticipatorInfoSt(),
	ok.

createParticipatorInfoSt() ->
	Fun =
		fun(EventID) ->
			PrepareAtom = erlang:list_to_atom("stSaveLogParticipatorInfo" ++ erlang:integer_to_list(EventID)),
			Sql = io_lib:format( "INSERT INTO log_participator_info_~p
									 (roleName,roleID,roleLevel,currentRecharge,forcePower,type,time)VALUES (
									 ? -- roleName - VARCHAR(50) NOT NULL
									 ,? -- roleID - BIGINT(20) NOT NULL
									 ,? -- roleLevel - SMALLINT(5) NOT NULL
									 ,? -- currentRecharge - INT(10) NOT NULL
									 ,? -- forcePower - BIGINT(20) NOT NULL
									 ,? -- type - INT(10) NOT NULL
									 ,? -- time - INT(10) NOT NULL
									   )",[EventID]),
			emysql:prepare(PrepareAtom, Sql)
		end,
	lists:foreach(Fun, ?LogParticipator_PrepareList).

%% 能否保存日志
-spec canSaveLog() -> boolean().
canSaveLog() ->
	case ets:lookup(?LogWriteControlEts, 1) of
		[] ->
			true;
		[{1, ?LogWriteOpen}] ->
			true;
		[{1, ?LogWriteClose}] ->
			false;
		_ ->
			true
	end.

saveLog_main(MsgID, Msg) ->
	case canSaveLog() of
		true ->
			logDBCache:saveLog_cache(MsgID, Msg),
			ok;
		_ ->
			skip
	end,
	ok.

%%saveLog_Real(MsgID = ?LogType_Coin, Msg) ->
%%	saveLog(MsgID, Msg);
%%saveLog_Real(MsgID = ?LogType_Gold, Msg) ->
%%	saveLog(MsgID, Msg);
saveLog_Real(MsgID, Msg) ->
	saveLog(MsgID, Msg).

%%保存日志数据
saveLog(?LogType_GoodsChange, [#recLogGoodsChange{}|_] = List) ->
	%% log_item_change 表，要做特殊处理，分表，格式log_item_change201503-201612等

	{{Year,Month,_Day},{_Hour,_Minute,_Second}} = time:getLocalNowDateTime1970(),
	TableName = io_lib:format("log_item_change~p~2..0B", [Year, Month]),

	Fun =
		fun(#recLogGoodsChange{} = Rec, AccIn) ->
			[_|ParamList] = erlang:tuple_to_list(Rec),
			io_lib:format(",(~p,~p,'~ts',~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p)", ParamList) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO ~ts
	(playerID,accountID,platformName,itemUID,itemID,old,new,`change`,target,source,gold,goldtype,changReason,reasonParam,dbID,time)
	VALUES ~ts", [TableName, T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_GoodsChange,Ret,SQL,0),
	ok;

saveLog(?LogType_Forbidden, #recForbiddenLog{
	playerID = PlayerID,
	accountID = AccountID,
	reason = Reason,
	forbiddenTime = ForbiddenTime,
	time = Time
}) ->
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,
		stSaveLogForbidden,
		[PlayerID, AccountID, Reason, ForbiddenTime, Time]
	),
	logResult(stSaveLogForbidden,Ret,"AccountID",AccountID),
	ok;

saveLog(?LogType_AccountLogin, [#recLogAccountLogin{}|_] = List) ->
	saveAccountLoginLog("log_account_login", List),
	ok;
saveLog(?LogType_AccountLogin2, [#recLogAccountLogin{}|_] = List) ->
	saveAccountLoginLog("log_account_login2", List),
	ok;

saveLog(?LogType_ChatInfo, #recLogChatInfo{
	sendPlayerID = SendPlayerID,
	receiveplayerid = Receiveplayerid,
	chatString = ChatString,
	chatChannel = ChatChannel,
	time = Time
}) ->
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,stSaveLogChatInfo,[SendPlayerID, Receiveplayerid, ChatString, ChatChannel, Time]),
	logResult(stSaveLogChatInfo,Ret,"stSaveLogChatInfo",SendPlayerID),
	ok;

saveLog(?LogType_Coin, [#recLogCoin{}|_] = List) ->
	Fun =
		fun(#recLogCoin{} = Rec, AccIn) ->
			io_lib:format(",(~p,~p,'~ts',~p,~p,~p,~p,~p,~p,~p,'~ts',~p,~p,~p)",
				[
					Rec#recLogCoin.playerID,
					Rec#recLogCoin.accountID,
					Rec#recLogCoin.platformName,
					Rec#recLogCoin.oldcoin,
					Rec#recLogCoin.newcoin,
					Rec#recLogCoin.addOrDec,
					Rec#recLogCoin.changecoin,
					Rec#recLogCoin.reason,
					Rec#recLogCoin.target,
					Rec#recLogCoin.source,
					misc:term_to_string(Rec#recLogCoin.param),
					Rec#recLogCoin.dbID,
					Rec#recLogCoin.time,
					Rec#recLogCoin.moneyType
				]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO
	log_coin(playerID,accountID,platformName,oldcoin,newcoin,addOrDec,changecoin,reason,target,source,param,dbID,time,moneyType) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_Coin,Ret,SQL,0),
	ok;

saveLog(?LogType_Gold, [#recLogGold{}|_] = List) ->
	Fun =
		fun(#recLogGold{} = Rec, AccIn) ->
			io_lib:format(",(~p,~p,'~ts',~p,~p,~p,~p,~p,~p,~p,'~ts',~p,~p,~p)",
				[
					Rec#recLogGold.playerID,
					Rec#recLogGold.accountID,
					Rec#recLogGold.platformName,
					Rec#recLogGold.olddiamond,
					Rec#recLogGold.newdiamond,
					Rec#recLogGold.addOrDec,
					Rec#recLogGold.changediamond,
					Rec#recLogGold.reason,
					Rec#recLogGold.target,
					Rec#recLogGold.source,
					misc:term_to_string(Rec#recLogGold.param),
					Rec#recLogGold.dbID,
					Rec#recLogGold.time,
					Rec#recLogGold.moneyType
				]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO
	log_gold(playerID,accountID,platformName,olddiamond,newdiamond,addOrDec,changediamond,reason,target,source,param,dbID,time,moneyType) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_Gold,Ret,SQL,0),
	ok;

saveLog(?LogType_CreateGoods, [#recLogCreateGoods{}|_] = List) ->
	Fun =
		fun(#recLogCreateGoods{
			ownerID = OwnerID,
			goodsUID = GoodsUID,
			goodsID = GoodsID,
			pileNum = PileNum,
			isBinded = IsBinded,
			bagType = BagType,
			curEnhLevel = CurEnhLevel,
			quality = Quality,
			createReson = CreateReson,
			createFromParam = CreateFromParam,
			time = Time
		}, AccIn) ->
			io_lib:format(",(~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p)",
				[
					OwnerID, GoodsUID, GoodsID, PileNum,
					misc:convertBool2Int(IsBinded),
					BagType, CurEnhLevel,
					Quality, CreateReson, CreateFromParam, Time
				]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_create_goods(OwnerID, GoodsUID, GoodsID, PileNum, IsBinded, BagType, CurEnhLevel,
						                   Quality, CreateReson, CreateFromParam, time) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_CreateGoods,Ret,SQL,0),
	ok;

saveLog(?LogType_Title, [#recLogCreateTitle{}|_] = List) ->
	Fun =
		fun(#recLogCreateTitle{
			playerID = PlayerID,
			titleID = TitleID,
			source = Source,
			time = Time
		}, AccIn) ->
			io_lib:format(",(~p, ~p, ~p, ~p)",
				[PlayerID, TitleID, Source, Time]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_player_title(roleID, titleID, source, time) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_Title,Ret,SQL,0),
	ok;

saveLog(?LogType_RoleExt, [#recLogRoleExt{}|_] = List) ->
	Fun =
		fun(#recLogRoleExt{
			roleID = RoleID,
			totalOfflineTime = TotalTime,
			rewardNum = RewardNum,
			rewardType = RewaredType,
			time = Time
		}, AccIn) ->
			io_lib:format(",(~p, ~p, ~p, ~p, ~p)",
				[RoleID, TotalTime, RewardNum, RewaredType, Time]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_ext_role(roleID, totalOfflineTime, rewardNum, rewardType, TIME) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_RoleExt,Ret,SQL,0),
	ok;

saveLog(?LogType_WeaponInfo, [#rec_log_god_weapon{}|_] = List) ->
	Fun =
		fun(#rec_log_god_weapon{
			accountID = AccountID,
			roleID = RoleID,
			weaponID = WeaponID,
			oldLevel = OldLevel,
			newLevel = NewLevel,
			costItem = CostItem,
			costCoin = CostCoin,
			time = Time
		}, AccIn) ->
			CostItemString = misc:term_to_string(CostItem),
			CostCoinString = misc:term_to_string(CostCoin),
			io_lib:format(
				",(~w,~w,~w,~w,~w,'~ts','~ts',~w)",
				[AccountID,RoleID,WeaponID,OldLevel,NewLevel,CostItemString,CostCoinString,Time]
			) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_god_weapon VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_WeaponInfo,Ret,SQL,0),
	ok;

saveLog(?LogType_Rune, [#rec_log_rune{}|_] = List) ->
	Fun =
		fun(#rec_log_rune{
			roleID = RoleID,				%% bigint(20) unsigned
			accountID = AcID,				%% bigint(20) unsigned
			runeUID = UID,				%% bigint(20) unsigned
			runeID = RuneID,				%% int(10) unsigned
			operate = Op,				%%0新增，1全更新，2基础值，3属性更新，4删除 tinyint(3) unsigned
			level = Lvl,				%% smallint(5) unsigned
			exp = Exp,				%% int(10) unsigned
			isBind = IsBind,				%% tinyint(3) unsigned
			createTime = CTime,				%% bigint(20) unsigned
			deleteTime = DTime,				%% bigint(20) unsigned
			expiredTime = ETime,				%% bigint(20) unsigned
			time = Time,				%%日志记录时间 bigint(20) unsigned
			props = Props				%%属性列表 varchar(255)
		}, AccIn) ->
			io_lib:format(",(~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, '~ts')",
				[RoleID,AcID,UID,RuneID,Op,Lvl,Exp,IsBind,CTime,DTime,ETime,Time,Props]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_rune
		(roleID, accountID, runeUID, runeID, operate, level, exp, isBind, createTime, deleteTime, expiredTime, time, props) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_Rune,Ret,SQL,0),
	ok;

saveLog(?LogType_CreateMail, #recLogCreateMail{
	mailUID = MailUID,
	senderRoleID = SenderRoleID,
	senderRoleName = SenderRoleName,
	toRoleID = ToRoleID,
	toRoleName = ToRoleName,
	mailTitle = MailTitle,
	mailContent = MailContent,
	mailSubjoinMsg = MailSubjoinMsg,
	attachItemUID_1 = AttachItemUID_1,
	attachItemDataID_1 = AttachItemDataID_1,
	attachItemUID_2 = AttachItemUID_2,
	attachItemDataID_2 = AttachItemDataID_2,
	attachCoinType = AttachCoinType,
	attachCoin = AttachCoin,
	time = Time
}) ->
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,stSaveLogCreateMail,
		[MailUID, SenderRoleID, SenderRoleName, ToRoleID, ToRoleName, MailTitle, MailContent,
			MailSubjoinMsg, AttachItemUID_1, AttachItemDataID_1, AttachItemUID_2,
			AttachItemDataID_2, AttachCoinType, AttachCoin, Time]),
	logResult(stSaveLogCreateMail,Ret,"stSaveLogCreateMail",MailUID),
	ok;

saveLog(?LogType_CreatePet, [#recLogCreatePet{}|_] = List) ->
	Fun =
		fun(#recLogCreatePet{
			playerID = PlayerID,
			petID = PetID,
			time = Time
		}, AccIn) ->
			io_lib:format(",(~p, ~p, ~p)",
				[PlayerID, PetID, Time]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED log_create_pet (playerID, petID, TIME) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_CreatePet,Ret,SQL,0),
	ok;

saveLog(?LogType_CreatePlayer, [#recLogCreatePlayer{}|_] = List) ->
	F =
		fun(#recLogCreatePlayer{
			playerID = PlayerID,
			name = Name,
			accountID = AccountID,
			sex = Sex,
			camp = Camp,
			race = Race,
			career = Career,
			time = Time
		}) ->
			Ret = emysql:execute(?LOGDB_CONNECT_POOL,
				stSaveLogCreatePlayer,
				[PlayerID, Name, AccountID, Sex, Camp, Race, Career, Time]
			),
			logResult(stSaveLogCreatePlayer,Ret,"PlayerID",PlayerID),
			ok
		end,
	lists:foreach(F, List),
	ok;

saveLog(?LogType_ExpChange, [#recLogExpChange{}|_] = List) ->
	Fun =
		fun(#recLogExpChange{
			playerID = PlayerID,
			oldLevel = OldLevel,
			newLevel = NewLevel,
			changType = ChangType,
			changValue = ChangValue,
			changePrama = ChangePrama,
			time = Time
		}, AccIn) ->
			ChangePramaStr =
				case erlang:is_integer(ChangePrama) of
					true -> erlang:integer_to_list(ChangePrama);
					_ -> ChangePrama
				end,

			io_lib:format(",(~p, ~p, ~p, ~p, ~p, '~ts', ~p)",
				[PlayerID, OldLevel, NewLevel, ChangType, ChangValue, ChangePramaStr, Time]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_exp_change(PlayerID, OldLevel, NewLevel, ChangType, ChangValue, ChangePrama, time)
							VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_ExpChange,Ret,SQL,0),
	ok;

saveLog(?LogType_Friend, [#rec_log_player_friend{}|_] = List) ->
	Fun =
		fun(#rec_log_player_friend{
			roleID = RoleID,
			targetRoleID = TargetRoleID,
			oldCloseness = Old,
			newCloseness = New,
			reason = Reason,
			isActive = IsActive,
			time = Time
		}, AccIn) ->
			io_lib:format(
				",(~w,~w,~w,~w,~w,~w,~w)",
				[RoleID, TargetRoleID, Old, New, Reason, IsActive, Time]
			) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_player_friend VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL, SQL),
	logResult(logType_Friend, Ret, SQL, 0),
	ok;

saveLog(?LogType_Marriage, [#rec_log_player_marriage{}|_] = List) ->
	Fun =
		fun(#rec_log_player_marriage{
			roleID = RoleID,
			targetRoleID = TargetRoleID,
			oldCloseness = Old,
			newCloseness = New,
			reason = Reason,
			isActive = IsActive,
			time = Time
		}, AccIn) ->
			io_lib:format(
				",(~w,~w,~w,~w,~w,~w,~w)",
				[RoleID, TargetRoleID, Old, New, Reason, IsActive, Time]
			) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_player_marriage VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL, SQL),
	logResult(logType_Marriage, Ret, SQL, 0),
	ok;

saveLog(?LogType_MailChange, [#recLogMailChange{}|_] = List) ->
	Fun =
		fun(#recLogMailChange{
			playerID = PlayerID,
			mailUID = MailUID,
			changeType = ChangeType,
			time = Time
		}, AccIn) ->
			io_lib:format(",(~p, ~p, ~p, ~p)",
				[PlayerID, MailUID, ChangeType, Time]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_mail_change(PlayerID, MailUID, ChangeType, time) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_MailChange,Ret,SQL,0),
	ok;

saveLog(?LogType_MallBuy, [#recLogMallBuy{}|_] = List) ->
	Fun =
		fun(#recLogMallBuy{
			playerID = PlayerID,
			itemDataID = ItemDataID,
			buyCount = BuyCount,
			payMoneyType = PayMoneyType,
			payMoney = PayMoney,
			time = Time
		}, AccIn) ->
			io_lib:format(",(~p, ~p, ~p, ~p, ~p, ~p)",
				[PlayerID, ItemDataID, BuyCount, PayMoneyType, PayMoney, Time]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_mall_buy(PlayerID, ItemDataID, BuyCount, PayMoneyType, PayMoney, time) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_MallBuy,Ret,SQL,0),
	ok;

saveLog(?LogType_OnlinePlayers, #recLogOnlinePlayers{
	count = Count,
	time = Time
}) ->
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,
		stSaveLogOnlinePlayers,
		[Count, Time]
	),
	logResult(stSaveLogOnlinePlayers,Ret,"Count",Count),
	ok;

saveLog(?LogType_PlayerDelete, [#recLogPlayerDelete{}|_] = List) ->
	Fun =
		fun(#recLogPlayerDelete{
			playerID = PlayerID,
			level = Level,
			gold = Gold,
			bindGold = BindGold,
			diamond = Diamond,
			ticket = Ticket,
			prestige = Prestige,
			honor = Honor,
			purpleEssence = PurpleEssence,
			goldenEssence = GoldenEssence,
			time = Time
		}, AccIn) ->
			io_lib:format(",(~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p)",
				[PlayerID, Level, Gold, BindGold, Diamond, Ticket, Prestige, Honor, PurpleEssence, GoldenEssence, Time]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_player_delete(PlayerID, Level, Gold, BindGold, Diamond, Ticket, Prestige, Honor, PurpleEssence, GoldenEssence, time)
	                        VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_PlayerDelete,Ret,SQL,0),
	ok;

saveLog(?LogType_PlayerOffline, [#recLogPlayerOffline{}|_] = List) ->
	Fun =
		fun(#recLogPlayerOffline{
			playerID = PlayerID,
			level = Level,
			exp = Exp,
			gold = Gold,
			bindgold = BindGold,
			diamond = Diamond,
			prestige = Prestige,
			honor = Honor,
			ticket = Ticket,
			purpleEssence = PurpleEssence,
			goldenEssence = GoldenEssence,
			onlineOrOffline = OnlineOrOffline,
			time = Time
		}, AccIn) ->
			io_lib:format(",(~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p)",
				[PlayerID, Level, Exp, Gold, BindGold, Diamond, Prestige, Honor, Ticket, PurpleEssence, GoldenEssence, OnlineOrOffline, Time]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_player_online_offline(PlayerID, Level, Exp, Gold, BindGold, Diamond, Prestige,
                            Honor, Ticket, PurpleEssence, GoldenEssence, OnlineOrOffline, time) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_PlayerOffline,Ret,SQL,0),
	ok;

saveLog(?LogType_PresentRecharge, #recLogPresentRecharge{
	orderid = Orderid,
	platformAccount = PlatformAccount,
	platformID = PlatformID,
	accountID = AccountID,
	playerID = PlayerID,
	rechargeAmmount = RechargeAmmount,
	getedGold = GetedGold,
	presentGold = PresentGold,
	reason = Reason,
	time = Time
}) ->
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,
		stSaveLogPresentRecharge,
		[Orderid, PlatformAccount, PlatformID, AccountID, PlayerID, RechargeAmmount, GetedGold, PresentGold, Reason, Time]
	),
	logResult(stSaveLogPresentRecharge,Ret,"Orderid",Orderid),
	ok;

saveLog(?LogType_Recharge, #recLogRecharge{orderid = Orderid} = Rec) ->
	[_TableName|ParamList] = erlang:tuple_to_list(Rec),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL, stSaveLogRecharge, ParamList),
	logResult(stSaveLogRecharge,Ret,"Orderid",Orderid),
	ok;

%%saveLog(?LogType_RechargeClient, #recLogRechargeClient{
%%	playerID = PlayerID,
%%	platformAccount = PlatformAccount,
%%	platformID = PlatformID,
%%	lsID = LsID,
%%	sign = Sign,
%%	billno = Billno,
%%	gold = Gold,
%%	identifer = Identifer,
%%	type = Type,
%%	result = Result,
%%	time = Time
%%}) ->
%%	Ret = emysql:execute(?LOGDB_CONNECT_POOL,
%%		stSaveLogRechargeClient,
%%		[PlayerID, PlatformAccount, PlatformID, LsID, Sign, Billno, Gold, Identifer, Type, Result, Time]
%%	),
%%	logResult(stSaveLogRechargeClient,Ret,"PlayerID",PlayerID),
%%	ok;

saveLog(?LogType_Skill, [#recLogSkill{}|_] = List) ->
	Fun =
		fun(#recLogSkill{
			playerID = PlayerID,
			skillID = SkillID,
			level = Level,
			time = Time
		}, AccIn) ->
			io_lib:format(",(~p, ~p, ~p, ~p)", [PlayerID, SkillID, Level, Time]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_player_skill(PlayerID, SkillID, Level, time) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_Skill,Ret,SQL,0),
	ok;

saveLog(?LogType_Task, [#recLogTask{}|_] = List) ->
	Fun =
		fun(#recLogTask{
			playerID = PlayerID,
			taskDataID = TaskDataID,
			level = Level,
			type = Type,
			time = Time
		}, AccIn) ->
			io_lib:format(",(~p, ~p, ~p, ~p, ~p)", [PlayerID, TaskDataID, Level, Type, Time]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_player_task(PlayerID, TaskDataID, Level, Type, time) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_Task,Ret,SQL,0),
	ok;

saveLog(?LogType_Trade, [#rec_log_trade{}|_] = List) ->
	Fun =
		fun(#rec_log_trade{} = Trade, AccIn) ->
			io_lib:format(",(~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p, ~p)", [
				Trade#rec_log_trade.roleID,
				Trade#rec_log_trade.orderID,
				Trade#rec_log_trade.itemUID,
				Trade#rec_log_trade.sellType,
				Trade#rec_log_trade.putTime,
				Trade#rec_log_trade.downTime,
				Trade#rec_log_trade.silver,
				Trade#rec_log_trade.gold,
				Trade#rec_log_trade.destRoleID,
				Trade#rec_log_trade.itemID,
				Trade#rec_log_trade.quality,
				Trade#rec_log_trade.time
			]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_trade (roleID, orderID, itemUID, sellType, putTime, downTime, silver, gold, destRoleID, itemID, quality, time) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_Trade,Ret,SQL,0),
	ok;

saveLog(?LogType_Trade_OP, [#rec_log_trade_op{}|_] = List) ->
	Fun =
		fun(#rec_log_trade_op{} = Trade, AccIn) ->
			io_lib:format(",(~p, ~p, ~p, ~p, ~p)", [
				Trade#rec_log_trade_op.tradeID,
				Trade#rec_log_trade_op.downReson,
				Trade#rec_log_trade_op.roleID,
				Trade#rec_log_trade_op.param,
				Trade#rec_log_trade_op.time
			]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_trade_op (tradeID, downReson, roleID, param, time) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_Trade_op,Ret,SQL,0),
	ok;

saveLog(?LogType_Web2lsCommand, #recWeb2LsCommandLog{
	opCode = OpCode,
	opUser = OpUser,
	opSerial = OpSerial,
	opResult = OpResult,
	arg1 = Arg1,
	arg2 = Arg2,
	arg3 = Arg3,
	arg4 = Arg4,
	arg5=Arg5,
	arg6=Arg6,
	arg7=Arg7
}) ->
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,
		stSaveLogWeb2lsCommand,
		[OpCode, OpUser,OpSerial,OpResult, Arg1, Arg2, Arg3, Arg4,Arg5,Arg6,Arg7]
	),
	logResult(stSaveLogWeb2lsCommand,Ret,"opSerial",opSerial),
	ok;

%%GM指令log
saveLog(?LogType_GMCmd, #recLogGMCmd{
	sendPlayerID = SendRoleID,
	chatString = ChatString,
	time = Time
}) ->
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,
		stSaveLogGmCmd,
		[SendRoleID, ChatString, Time]
	),
	logResult(stSaveLogGmCmd,Ret,"SendRoleID",SendRoleID),
	ok;

%%玩家等级变化log
saveLog(?LogType_PlayerLevel, List) ->
	Fun =
		fun({
			PlayerID,			%%角色ID
			OldLevel,			%%变化前的等级
			CurLevel,			%%变化后的等级
			Time		        %%时间
		}, AccIn) ->
			io_lib:format(",(~p, ~p, ~p, ~p)", [PlayerID, OldLevel, CurLevel, Time]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_player_level (playerID, oldLevel, curLevel, TIME) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_PlayerLevel,Ret,SQL,0),
	ok;

%%玩家反馈CoupleBack
saveLog(?LogType_PlayerCB, #recLogPlayerCB{roleID = PlayerID} = CB) ->
	Ret = emysql:execute(?LOGDB_CONNECT_POOL, stSaveLogPlayerCoupleBack, misc:record_to_list(CB)),
	logResult(stSaveLogPlayerCoupleBack,Ret,"recLogPlayerCB",PlayerID),
	ok;

%% 玩家排行日志
saveLog(?LogType_Rank, [#recSaveRank{}|_] = List) ->
	Fun =
		fun(#recSaveRank{} = Rank, AccIn) ->
			io_lib:format(",(~p, ~p, ~p, ~p, ~p, ~p, ~p, '~ts')",
				[
					Rank#recSaveRank.roleID,
					Rank#recSaveRank.rankType,
					Rank#recSaveRank.rankSort,
					Rank#recSaveRank.rankSortC,
					Rank#recSaveRank.value1,
					Rank#recSaveRank.value2,
					Rank#recSaveRank.value3,
					Rank#recSaveRank.createTime
				]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_rank (roleID,rankType,rankSort,rankSortC,value1,value2,value3,createTime)  VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_Rank,Ret,SQL,0),
	ok;

%% 混沌战场击杀boss伤害日志
saveLog(?LogType_HDBattleHurt, #recLogActivityHDHurt{} = Hurt) ->
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,
		stSaveLogActivityHDHurt,
		[
			Hurt#recLogActivityHDHurt.produceTime,
			Hurt#recLogActivityHDHurt.gsID,
			Hurt#recLogActivityHDHurt.rankID,
			Hurt#recLogActivityHDHurt.roleID,
			Hurt#recLogActivityHDHurt.rankSort,
			Hurt#recLogActivityHDHurt.rankValue
		]
	),
	logResult(stSaveLogActivityHDHurt, Ret, "LogActivityHurt", Hurt#recLogActivityHDHurt.roleID),
	ok;
%% 混沌战场击杀玩家数量日志
saveLog(?LogType_HDBattleKill, #recLogActivityHDKill{} = Kill) ->
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,
		stSaveLogActivityHDKill,
		[
			Kill#recLogActivityHDKill.produceTime,
			Kill#recLogActivityHDKill.gsID,
			Kill#recLogActivityHDKill.rankID,
			Kill#recLogActivityHDKill.roleID,
			Kill#recLogActivityHDKill.rankSort,
			Kill#recLogActivityHDKill.rankValue
		]
	),
	logResult(stSaveLogActivityHDKill, Ret, "LogActivityKill", Kill#recLogActivityHDKill.roleID),
	ok;

%%代client存日志（主要是充值相关）
saveLog(?LogType_EventLog, #recLogTypeEventLog{
	roleID = RoleID,
	accountID = AccountID,
	recTime = RecTime,
	eventID = EventID,
	eventTime = EventTime,
	eventArgs = EventArgs
}) ->
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,
		stSaveLogEvent,
		[
			RoleID,
			AccountID,
			RecTime,
			EventID,
			EventTime,
			EventArgs
		]
	),
	logResult(stSaveLogEvent, Ret, "LogType_EventLog", RoleID),
	ok;

saveLog(?LogType_AchieveNum, [#recLogAchieveNum{}|_] = List) ->
	Fun =
		fun(#recLogAchieveNum{
			playerID = PlayerID,
			achieveID = AchieveID,
			oldAchieveNum = OldAchieveNum,
			modAchieveNum = ModAchieveNum,
			newAchieveNum = NewAchieveNum,
			time = Time
		}, AccIn) ->
			io_lib:format(",(~p, ~p, ~p, ~p, ~p, ~p)",
				[
					PlayerID,
					AchieveID,
					OldAchieveNum,
					ModAchieveNum,
					NewAchieveNum,
					Time
				]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_achievenum(PlayerID, AchieveID, OldAchieveNum, ModAchieveNum, NewAchieveNum,`time`) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_AchieveNum,Ret,SQL,0),
	ok;

saveLog(?LogType_MallChange, #recSaveMallChangeLog{}=Mall) ->
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,
		stSaveLogMallChange,
		[
			Mall#recSaveMallChangeLog.dbID,
			Mall#recSaveMallChangeLog.itemID,
			Mall#recSaveMallChangeLog.sort,
			Mall#recSaveMallChangeLog.type,
			Mall#recSaveMallChangeLog.type1,
			Mall#recSaveMallChangeLog.diamond,
			Mall#recSaveMallChangeLog.bindDiamond,
			Mall#recSaveMallChangeLog.useIntegral,
			Mall#recSaveMallChangeLog.getIntegral,
			Mall#recSaveMallChangeLog.limitBuy,
			Mall#recSaveMallChangeLog.limitType,
			Mall#recSaveMallChangeLog.limitBeginTime,
			Mall#recSaveMallChangeLog.limitEndTime,
			Mall#recSaveMallChangeLog.buyReset,
			Mall#recSaveMallChangeLog.level,
			Mall#recSaveMallChangeLog.recharge,
			Mall#recSaveMallChangeLog.isHide,
			Mall#recSaveMallChangeLog.beginTime,
			Mall#recSaveMallChangeLog.endTime,
			Mall#recSaveMallChangeLog.rebate,
			Mall#recSaveMallChangeLog.rebateBeginTime,
			Mall#recSaveMallChangeLog.rebateEndTime,
			Mall#recSaveMallChangeLog.showType,
			Mall#recSaveMallChangeLog.buySendItem,
			Mall#recSaveMallChangeLog.buySendNum,
			Mall#recSaveMallChangeLog.buySendLimit,
			Mall#recSaveMallChangeLog.buySendBeginTime,
			Mall#recSaveMallChangeLog.buySendEndTime,
			Mall#recSaveMallChangeLog.state,
			Mall#recSaveMallChangeLog.changeTime
		]
	),
	logResult(stSaveLogMallChange, Ret, "LogType_MallChangeLog",Mall#recSaveMallChangeLog.dbID),
	ok;


saveLog(?LogType_PetUpStar, [#recLogPetUpStar{}|_] = List) ->
	Fun =
		fun(#recLogPetUpStar{} = Rec, AccIn) ->
			[_TableName|ParamList] = erlang:tuple_to_list(Rec),
			io_lib:format(",(~p, ~p, ~p, ~p, ~p)", ParamList) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_pet_upstar (playerID, petId, oldStar, curStar, TIME) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_PetUpStar,Ret,SQL,0),
	ok;

saveLog(?LogType_PetSkillCast, [#recLogPetCast{}|_] = List) ->
	Fun =
		fun(#recLogPetCast{} = Rec, AccIn) ->
			[_TableName|ParamList] = erlang:tuple_to_list(Rec),
			io_lib:format(",(~p,~p,~p,~p,~p,~p,~p)", ParamList) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_pet_cast (playerID, petId, oldSkillID, oldSkillLevel, newSkillID, newSkillLevel, TIME) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_PetSkillCast,Ret,SQL,0),
	ok;

saveLog(?LogType_PetRaw, [#recLogPetRaw{}|_] = List) ->
	Fun =
		fun(#recLogPetRaw{} = Rec, AccIn) ->
			[_TableName|ParamList] = erlang:tuple_to_list(Rec),
			io_lib:format(",(~p,~p,~p,~p,~p)", ParamList) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_pet_raw (playerID, petId, oldRaw, curRaw, TIME) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_PetRaw,Ret,SQL,0),
	ok;

saveLog(?LogType_PetEquipStr, [#recLogPetEquipStr{}|_] = List) ->
	Fun =
		fun(#recLogPetEquipStr{} = Rec, AccIn) ->
			[_TableName|ParamList] = erlang:tuple_to_list(Rec),
			io_lib:format(",(~p,~p,~p,~p,~p,~p)", ParamList) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_pet_equip_str (playerID, oldEquipID, oldLevel, newEquipID, newLevel, TIME) VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_PetEquipStr,Ret,SQL,0),
	ok;

saveLog(?LogType_RedEnvelope, [#rec_log_redenvelope{}] = List) ->
	Fun =
		fun(#rec_log_redenvelope{
			redID = UID,
			sendRoleID = SendRole,
			playerID = RobPlayerID,
			opType = OpType,
			moneyType = MoneyType,
			redValue = RedValue,
			time = NowTime
		}, AccIn) ->
			io_lib:format(",(~p,~p,~p,~p,~p,~p,~p)", [UID,SendRole,RobPlayerID,OpType,RedValue,MoneyType,NowTime]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_redenvelope(  redID ,sendRoleID ,playerID ,opType ,redValue ,moneyType ,time)
VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(?LogType_RedEnvelope,Ret,SQL,0),
	ok;

saveLog(?LogType_ChangeRoleOwner, #rec_log_change_role_owner{
	descAccountID = DAID,
	sourceAccountID = SAID,
	sourceRoleID = SRID,
	time = Time
}) ->

	SQL = io_lib:format("INSERT DELAYED INTO log_change_role_owner (descAccountID,sourceAccountID,sourceRoleID,time) VALUES (~p,~p,~p,~p)",
		[DAID,SAID,SRID,Time]),

	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(?LogType_ChangeRoleOwner,Ret,SQL,0),
	ok;

%%参与军团联赛的军团信息
saveLog(?LogType_GuildBattleInfo, #recLogGuildBattleInfo{}=Rec) ->
	[_TableName|ParamList] = erlang:tuple_to_list(Rec),

	Ret = emysql:execute(?LOGDB_CONNECT_POOL, stSaveLogGuildBattleInfo, ParamList),

	logResult(stSaveLogGuildBattleInfo, Ret,"args",ParamList),
	ok;

%%各种玩法参与者信息统计
saveLog(?LogType_ParticipatorInfo, [#recLogParticipatorInfo{}|_] = List) ->
	F =
		fun(#recLogParticipatorInfo{type = Type} = Rec) ->
			[_TableName|ParamList] = erlang:tuple_to_list(Rec),
			PrepareAtom = erlang:list_to_existing_atom("stSaveLogParticipatorInfo" ++ erlang:integer_to_list(Type)),
			Ret = emysql:execute(?LOGDB_CONNECT_POOL, PrepareAtom, ParamList),
			logResult(stSaveLogParticipatorInfo, Ret, "args", ParamList),
			ok
		end,
	lists:foreach(F, List),
	ok;

%%副本信息统计
saveLog(?LogType_CopyInfo, [#rec_log_copy{}|_] = List) ->
	Fun =
		fun(#rec_log_copy{
			accountID = AccountID,
			roleID = RoleID,
			copyMapType = CopyMapType,
			copyMapID = CopyMapID,
			startTime = StartTime,
			decrActionPoint = DecrActionPoint,
			isPass = IsPass,
			endTime = EndTime,
			goldReward = GoldReward,
			expReward = ExpReward,
			dropItems = DropItems
		}, AccIn) ->
			io_lib:format(
				",(~w,~w,~w,~w,~w,~w,~w,~w,'~ts',~w,'~ts')",
				[AccountID, RoleID, CopyMapType, CopyMapID,StartTime,
					DecrActionPoint,IsPass,EndTime ,misc:term_to_string(GoldReward) , ExpReward,misc:term_to_string(DropItems)]
			) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO log_copy VALUES ~ts", [T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_CopyInfo,Ret,SQL,0),
	ok;

saveLog(_, _) ->
	ok.

saveAccountLoginLog(TableName, List) ->
	Fun =
		fun(#recLogAccountLogin{
			accountID = AccountID,
			platformAccountID = PlatformAccountID,
			platformID = PlatformID,
			versionClientExe = VersionClientExe,
			versionClientRes = VersionClientRes,
			ip = Ip,
			mac = Mac,
			imei = Imei,
			idfa = Idfa,
			globalClientSetupKey = GlobalClientSetupKey,
			time = Time
		}, AccIn) ->
			VersionClientExeStr =
				case erlang:is_integer(VersionClientExe) of
					true -> erlang:integer_to_list(VersionClientExe);
					_ -> VersionClientExe
				end,
			VersionClientResStr =
				case erlang:is_integer(VersionClientRes) of
					true -> erlang:integer_to_list(VersionClientRes);
					_ -> VersionClientRes
				end,
			PlatformAccountID2 =
				case erlang:is_binary(PlatformAccountID) of
					true -> erlang:binary_to_list(PlatformAccountID);
					_ -> PlatformAccountID
				end,
			io_lib:format(",(~p,'~ts','~ts','~ts','~ts','~ts','~ts','~ts','~ts','~ts',~p)",
				[AccountID, PlatformAccountID2, PlatformID, VersionClientExeStr, VersionClientResStr,
					Ip, Mac, Imei, Idfa, GlobalClientSetupKey, Time]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("INSERT DELAYED INTO ~ts (accountID, platformAccountID, platformID, versionClientExe, versionClientRes,
                            ip, MAC, IMEI, IDFA, globalClientSetupKey, time) VALUES ~ts", [TableName, T]),
	Ret = emysql:execute(?LOGDB_CONNECT_POOL,SQL),
	logResult(logType_AccountLogin,Ret,SQL,0),
	ok.

-spec logResult(StatementAtom,Ret,ArgDesc,Arg) -> boolean() when
	StatementAtom::atom(),ArgDesc::string(),Arg::term(),Ret::term().
logResult(_StatementAtom,#ok_packet{affected_rows = _AffectedRowNum},_ArgDesc,_Arg) ->
%%	?LOG_OUT("exec[~p] ok[~p],~ts[~p]",[StatementAtom,AffectedRowNum,ArgDesc,Arg]),
	true;
logResult(StatementAtom,[_H|T],ArgDesc,Arg) ->
	logResult(StatementAtom,T,ArgDesc,Arg);
logResult(StatementAtom,Ret,ArgDesc,Arg) ->
	?ERROR_OUT("exec[~p] failed, Result[~p],~ts[~p]",[StatementAtom,Ret,ArgDesc,Arg]),
	false.