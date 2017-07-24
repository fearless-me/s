%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三科技
%%% @doc
%%%
%%% @end
%%% Created : 03. 七月 2014 17:53
%%%-------------------------------------------------------------------
-module(dbCSSave).
-author("ZhongYuanWei").

-include("dbPrivate.hrl").

%% API
-export([initCSSavePrepare/0]).

-export([
	saveTradeData/1,
	newMail/2,
	updateMail/1,
	deleteMail/1,
	deleteAttachMent/1,
	saveGuildData/2,
	saveGuildWarPaidData/2,
	saveGuildWarData/2,
	saveAwardTakens/2,
	saveMallData/2,
	saveLimitMallData/2,
	deleteMallItem/2,
	saveRankData/3,
	addOrder/12,
	delPreRecharge/1,
	changeOrderStatue/2,
	saveActivityData/1,
	saveRechargeRebate/1,
	cleanRechargeRebateTaken/1,
	saveRechargeRebateTaken/2,
	saveGuildBattleData/2,
	saveHomeData/1
]).

initCSSavePrepare() ->
	emysql:prepare(stSaveTrade,"call saveTrade(?,?,?,?,?,?,?,?,?,?,?,?,?)"),
	emysql:prepare(stNewMail,"call newMail(?,?,?,?,?,?,?,?,@OutRet)"),
	emysql:prepare(stNewMailAttachment,"call newMailAttachment(?,?,?,?)"),
	emysql:prepare(stUpdateMail,"call updateMail(?,?,?,?)"),
	emysql:prepare(stDeleteMail,"call deleteMail(?)"),
	emysql:prepare(stDelMailAttachMent,"call delMailAttachMent(?,?,?,?)"),
	emysql:prepare(stSaveGuildInfo,"call saveGuildInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"),
	emysql:prepare(stSaveGuildMember,"call saveGuildMember(?,?,?,?,?,?,?,?)"),
	emysql:prepare(stDeleteGuildData,"call deleteGuildData(?,?)"),
	emysql:prepare(stDelGuildBattle,"call delGuildBattle(?)"),
	emysql:prepare(stsaveAwardTakens,"insert into role_award_takens(role_id,award_id,taken_time) values(?,?,UNIX_TIMESTAMP())"),
	emysql:prepare(stCleanRechargeRebateTaken,"delete from recharge_rebate_taken where rebateIdAndType=?"),
	emysql:prepare(stSaveMallInfo,"call SaveMallInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"),
	emysql:prepare(stSaveLimitMallInfo,"call SaveMallLimitBuyInfo(?,?,?,?,?)"),
	emysql:prepare(stDeleteMallItem,"DELETE FROM mall WHERE dbID = ?"),
	emysql:prepare(stSaveRankData,"call saveRankData(?,?,?,?,?,?,?,?)"),
	emysql:prepare(stDelSurplusRankPlayer,"call delSurplusRankPlayer(?,?)"),
	emysql:prepare(stAddOrder,"CALL addRechargeOrder(?,?,?,?,?,?,?,?,?,?,?,?)"),
	emysql:prepare(stDelPreChargeAccount,"CALL delPreChargeAccount(?)"),
	emysql:prepare(stChangeOrderStatus,"CALL changeRechargeOrderStatus(?,?)"),
	emysql:prepare(stSaveActivityData,"call saveActivityData(?,?,?,?)"),
	emysql:prepare(stSetRechargeRebateConf,"CALL setRechargeRebateConf(?,?,?,?,?,?,?,?,?,?,?,?)"),
	emysql:prepare(stSetRechargeRebateTaken,"CALL setRechargeRebateTaken(?,?)"),
	emysql:prepare(stUpdateHome,"UPDATE home h SET h.homeName = ?, h.homeLvl = ?, h.roleID = ?, h.stylish = ?, h.comfort = ?, h.popularity = ? WHERE h.homeID = ?"),
	ok.

saveHomeData(#rec_home{} = Home) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stUpdateHome, [
		Home#rec_home.homeName,
		Home#rec_home.homeLvl,
		Home#rec_home.roleID,
		Home#rec_home.stylish,
		Home#rec_home.comfort,
		Home#rec_home.popularity,
		Home#rec_home.homeID
	]),
	libDB:logResult(stUpdateHome,Ret,"stUpdateHome",Home#rec_home.homeID),
	ok;
saveHomeData(#rec_home_area{homeID = {HomeID, AreaID}, areaID = AreaID, areaLvl = Lvl, areaData = Data}) ->
	SQL = io_lib:format("UPDATE home_area ha SET ha.areaLvl = ~p, ha.areaData = '~ts' WHERE ha.homeID = ~p AND ha.areaID = ~p;",
		[Lvl, Data, HomeID, AreaID]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	libDB:logResult("update home area",Ret,SQL,HomeID),
	ok;
saveHomeData({insert, #rec_home{} = Home}) ->
	SQL = io_lib:format("INSERT INTO home(homeID, homeName, homeLvl, roleID, stylish, comfort, popularity, serverName, createtime)
  VALUES (~p, '~ts', ~p, ~p, ~p, ~p, ~p, '~ts', ~p);", [
		Home#rec_home.homeID,
		Home#rec_home.homeName,
		Home#rec_home.homeLvl,
		Home#rec_home.roleID,
		Home#rec_home.stylish,
		Home#rec_home.comfort,
		Home#rec_home.popularity,
		Home#rec_home.serverName,
		Home#rec_home.createtime
	]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	libDB:logResult("insert home",Ret,SQL,Home#rec_home.homeID),
	ok;
saveHomeData({insert, [#rec_home_area{homeID = HID}|_] = List}) ->
	Fun =
		fun(#rec_home_area{
			homeID = {HomeID, AreaID},
			areaID = AreaID,
			areaLvl = Lvl,
			areaData = Data
		},AccIn) ->
			io_lib:format(",(~p,~p,~p,'~ts')", [HomeID, AreaID, Lvl, Data]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun,[],List),
	SQL = io_lib:format("INSERT INTO home_area(homeID, areaID, areaLvl, areaData) VALUES ~s",[T]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
	libDB:logResult("insert home area",Ret,SQL,HID),
	ok;
saveHomeData({insert, []}) -> ok;
saveHomeData(Data) ->
	?ERROR_OUT("no deal home data:~p", [Data]),
	ok.

%% 保存交易行数据
saveTradeData({SaveTradeList, DeleteIDList}) ->
	SaveFun =
		fun(#trade{orderID = OrderID,
			itemUID = ItemUID,
			roleID = RoleID,
			sellType = SellType,
			putTime = PutTime,
			downTime = DownTime,
			silver = Silver,
			gold = Gold,
			destRoleID = DestRoleID,
			sellState = SellState,
			relateRoleID = RelateRoleID,
			itemID = ItemID,
			quality = Quality}) ->
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
				stSaveTrade,
				[
					OrderID,
					ItemUID,
					RoleID,
					SellType,
					PutTime,
					DownTime,
					Silver,
					Gold,
					DestRoleID,
					SellState,
					RelateRoleID,
					ItemID,
					Quality
				]),
			libDB:logResult(stSaveTrade,Ret,"stSaveTrade",RoleID)
		end,
	lists:foreach(SaveFun, SaveTradeList),

	%% 删除订单
	FDelete =
		fun(OrderID) ->
			SQL = io_lib:format("DELETE FROM trade WHERE orderID = ~p", [OrderID]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			libDB:logResult(deletetrade,Ret,SQL,OrderID)
		end,
	lists:foreach(FDelete, DeleteIDList),
	ok.

%%新邮件
newMail(#recSaveMail{mailSendTime = MailSendTime, deleteTime = DeleteTime} = Mail, Attachmentlist) ->
	%% 先保存邮件
	StrSendTime = time:convertSec2DateTimeStr(MailSendTime),
	DeleteTimeStr = time:convertSec2DateTimeStr(DeleteTime),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
		stNewMail,
		[
			Mail#recSaveMail.mailID,					    %%邮件ID
			StrSendTime,             					    %%邮件发送时间
			Mail#recSaveMail.senderRoleID,             	%%发送者id
			Mail#recSaveMail.toRoleID,				        %%接收者ID
			Mail#recSaveMail.mailTitle,                	%%邮件标题
			Mail#recSaveMail.mailContent,              	%%邮件内容
			Mail#recSaveMail.mailSubjoinMsg,
			DeleteTimeStr
		]),
	{Result1,_LeftResult} = mysql:nextResult(Ret),
	Row = mysql:firstRow(Result1),
	OutRet = mysql:getFieldValue(1, Row),
	case OutRet of
		1 ->
			%% 保存成功
			case Attachmentlist of
				[] ->
					ok;
				_ ->
					%% 保存成功，继续保存附件
					Fun = fun(#recMailAttachMent{} = Attach) ->
						L = misc:record_to_list(Attach),
						RetAttach = emysql:execute(?GAMEDB_CONNECT_POOL,
							stNewMailAttachment,
							L),
						case RetAttach of
							#ok_packet{} ->
								ok;
							_ ->
								?ERROR_OUT("Save newMailAttachment Mail Result[~p][~p]",[RetAttach, L])
						end
						  end,

					lists:foreach(Fun, Attachmentlist)
			end,

			true;
		_ ->
			?ERROR_OUT("Save newMail Mail Result[~p][~p]",[Ret, Mail]),
			false
	end.


updateMail(#recUpdateMail{mailID = MailID, mailReadTime = ReadTime, deleteTime = DelTime, isLocked = IsLocked}) ->
	StrReadTime = case ReadTime of
					  0 -> "1970/1/1 0:00:00";
					  _ -> time:convertSec2DateTimeStr(ReadTime)
				  end,
	StrDelTime = time:convertSec2DateTimeStr(DelTime),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
		stUpdateMail,
		[MailID,IsLocked,StrReadTime,StrDelTime]),
	libDB:logResult(stUpdateMail,Ret,"MailID:",MailID),
	ok.

deleteMail(MailID) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stDeleteMail, [MailID]),
	libDB:logResult(stDeleteMail,Ret,"MailID:",MailID),
	ok.

deleteAttachMent(#recMailAttachMent{mailID = MailID} = Attach) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
		stDelMailAttachMent,
		misc:record_to_list(Attach)),
	libDB:logResult(stDelMailAttachMent,Ret,"MailID:",MailID),
	ok.

%% 保存工会数据
-spec saveGuildData(PidFromCS::pid(), #rec_guild_member{} | #rec_guild{} | uint()) -> ok.
saveGuildData(_PidFromCS, #rec_guild_member{guildID = GuildID, roleID = RoleID} = Member) ->
	%% 保存成员数据
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stSaveGuildMember,
		[
			RoleID,
			GuildID,
			Member#rec_guild_member.joinTime,
			Member#rec_guild_member.power,
			Member#rec_guild_member.liveness,
			Member#rec_guild_member.itemID,
			Member#rec_guild_member.itemM,
			Member#rec_guild_member.itemTime
		]),
	libDB:logResult(stSaveGuildMember,Ret,"stSaveGuildMember",RoleID),
	ok;
saveGuildData(_PidFromCS, #rec_guild{} = Guild) ->
	%% 保存工会数据
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stSaveGuildInfo,
		[
			Guild#rec_guild.guildID,
			Guild#rec_guild.guildName,
			Guild#rec_guild.guildLevel,
			Guild#rec_guild.member,
			Guild#rec_guild.resource,
			Guild#rec_guild.liveness,
			Guild#rec_guild.notice,
			Guild#rec_guild.denoter,
			Guild#rec_guild.shopLevel,
			Guild#rec_guild.fightForce,
			Guild#rec_guild.createTime,
			Guild#rec_guild.lastGuildCopyOverTime,
			Guild#rec_guild.guildTaskTargetGuild,
			Guild#rec_guild.guildTaskTime,
			Guild#rec_guild.snowman,
			Guild#rec_guild.godBless,
			Guild#rec_guild.fastJoin,
			Guild#rec_guild.recruit,
			Guild#rec_guild.guildBossLevel
		]),
	libDB:logResult(stSaveGuildInfo,Ret,"stSaveGuildInfo",Guild#rec_guild.guildID),
	ok;
saveGuildData(_PidFromCS, #rec_guild_ride{
	guildID = GuildID,
	rideID = RideID,
	rideLevel = RideLevel,
	rideState = RideState
}) ->
	%% 保存设施关键数据
	SQL_Delete = io_lib:format("delete from guild_ride where guildID=~w and rideID=~w", [GuildID, RideID]),
	Ret_Delete = emysql:execute(?GAMEDB_CONNECT_POOL, SQL_Delete),
	dbMemCache:logResult("delete guild_ride", Ret_Delete, SQL_Delete),
	SQL_Insert = io_lib:format("insert into guild_ride(guildID,rideID,rideLevel,rideState) values (~w,~w,~w,~w)", [GuildID, RideID, RideLevel, RideState]),
	Ret_Insert = emysql:execute(?GAMEDB_CONNECT_POOL, SQL_Insert),
	dbMemCache:logResult("insert guild_ride", Ret_Insert, SQL_Insert),
	ok;
saveGuildData(_PidFromCS, {1, RoleID}) ->
	%% 删除工会成员
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stDeleteGuildData, [1, RoleID]),
	libDB:logResult(stDeleteGuildData,Ret,"stDeleteGuildData",RoleID),
	ok;
saveGuildData(_PidFromCS, {2, GuildID}) ->
	%% 删除工会
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stDeleteGuildData, [2, GuildID]),
	libDB:logResult(stDeleteGuildData,Ret,"stDeleteGuildData",GuildID),
	ok.

saveGuildWarPaidData(_PidFromCS, #rec_guild_war_paid{guildID = GuildID, paidmoney = Paid}) ->
	SQL = io_lib:format("REPLACE INTO guild_war_paid (guildID, paidmoney) VALUES (~p,~p)", [GuildID, Paid]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("saveGuildWarPaidData", Ret, SQL),
	ok;
saveGuildWarPaidData(_PidFromCS, GuildID) when erlang:is_integer(GuildID) andalso GuildID > 0 ->
	SQL = io_lib:format("DELETE FROM guild_war_paid WHERE guildID = ~p", [GuildID]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("saveGuildWarPaidData delete", Ret, SQL),
	ok.

saveGuildWarData(_PidFromCS, #rec_guild_war{stage = {S, G}, group = G} = Guild) ->
	SQL = io_lib:format("REPLACE INTO guild_war (stage, `group`, guildID1, guildID2, guildID3, winguildID, wartime) VALUES (~p,~p,~p,~p,~p,~p,~p)",
		[S, G, Guild#rec_guild_war.guildID1, Guild#rec_guild_war.guildID2, Guild#rec_guild_war.guildID3, Guild#rec_guild_war.winguildID, Guild#rec_guild_war.wartime]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("saveGuildWarData", Ret, SQL),
	ok;
saveGuildWarData(_PidFromCS, {Stage, Group}) ->
	SQL = io_lib:format("DELETE FROM guild_war WHERE stage = ~p AND `group` = ~p", [Stage, Group]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("saveGuildWarData delete", Ret, SQL),
	ok.

saveGuildBattleData(_PidFromCS, #rec_guild_battle_paid{guildID = GuildID, applytime = Time}) ->
	SQL = io_lib:format("INSERT INTO guild_battle_paid (guildID, applytime) VALUES (~p,~p)", [GuildID, Time]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("saveGuildBattleData", Ret, SQL),
	ok;
saveGuildBattleData(_PidFromCS, GuildID) ->
	SQL = io_lib:format("DELETE FROM guild_battle_paid WHERE guildID = ~p", [GuildID]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("saveGuildBattleData delete", Ret, SQL),
	ok.

%% 保存玩家领取了的活动ID,将做缓存后组合mysql语句
saveAwardTakens(RoleID,AwardID) ->
	#ok_packet{} = emysql:execute(?GAMEDB_CONNECT_POOL, stsaveAwardTakens,
		[RoleID,AwardID]),
	ok.

%%保存商城数据信息
saveMallData(_PidFromCS, #recSaveMall{} = Mall) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stSaveMallInfo,
		[
			Mall#recSaveMall.dbID,
			Mall#recSaveMall.itemID,
			Mall#recSaveMall.sort,
			Mall#recSaveMall.type,
			Mall#recSaveMall.type1,
			Mall#recSaveMall.diamond,
			Mall#recSaveMall.bindDiamond,
			Mall#recSaveMall.useIntegral,
			Mall#recSaveMall.getIntegral,
			Mall#recSaveMall.limitBuy,
			Mall#recSaveMall.limit_day,
			Mall#recSaveMall.limitType,
			Mall#recSaveMall.limitBeginTime,
			Mall#recSaveMall.limitEndTime,
			Mall#recSaveMall.buyReset,
			Mall#recSaveMall.level,
			Mall#recSaveMall.recharge,
			Mall#recSaveMall.isHide,
			Mall#recSaveMall.beginTime,
			Mall#recSaveMall.endTime,
			Mall#recSaveMall.rebate,
			Mall#recSaveMall.rebateBeginTime,
			Mall#recSaveMall.rebateEndTime,
			Mall#recSaveMall.showType,
			Mall#recSaveMall.buySendItem,
			Mall#recSaveMall.buySendNum,
			Mall#recSaveMall.buySendLimit,
			Mall#recSaveMall.buySendBeginTime,
			Mall#recSaveMall.buySendEndTime,
			Mall#recSaveMall.buyDefaultNum
		]),
	libDB:logResult(stSaveMallInfo,Ret,"saveMallData",Mall#recSaveMall.dbID),
	ok.

%%删除商城道具
deleteMallItem( _PidFromCS, Db_id ) ->
	_Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
		stDeleteMallItem,
		[Db_id]),
	ok.

%%保存商城限购数据信息
saveLimitMallData(_PidFromCS, #recSaveLimitMall{} = LimitMall) ->
	try
		#ok_packet{} =
			emysql:execute(?GAMEDB_CONNECT_POOL, stSaveLimitMallInfo,
				[
					LimitMall#recSaveLimitMall.dbID,
					LimitMall#recSaveLimitMall.itemID,
					LimitMall#recSaveLimitMall.roleID,
					LimitMall#recSaveLimitMall.haveBuy,
					LimitMall#recSaveLimitMall.time
				]),
		ok
	catch
		_:Con ->
			?ERROR_OUT("saveLimitMallData err:~p",[Con])
	end.

%%新增订单
%% -spec addOrder(RoleID::integer(),FeOrderID::string(),CurrencyTypeBinStr::string(),Amount::float(),CurrencyMoney::float(),ProviderOrderid::string(),Status::integer(),GiftBinStr::string(),PurchaseToken::string()) ->boolean().
addOrder(RoleID, FeOrderID, CurrencyTypeBinStr, Amount, CurrencyMoney, ProviderOrderid, Status, GiftBinStr,PurchaseToken,ItemNumber,ItemID,Category) ->
	case emysql:execute(?RECHARGE_CONNECT_POOL, stAddOrder, [RoleID, FeOrderID, CurrencyTypeBinStr, Amount, CurrencyMoney, ProviderOrderid, Status, GiftBinStr,PurchaseToken,ItemNumber,ItemID,Category]) of
		#ok_packet{affected_rows = 1} ->
			{ok,true};
		Error ->
			?ERROR_OUT("recharge system  addOrder to mysql errror orderInfo=~p ,errorReason=~p", [{RoleID, FeOrderID, CurrencyTypeBinStr, Amount, CurrencyMoney, ProviderOrderid, Status, GiftBinStr,PurchaseToken,ItemNumber,ItemID,Category}, Error]),
			{error,Error}
	end.

%%cs保存充值的返利活动配置
-spec saveRechargeRebate(Row::#recSaveRechargeRebate{}) ->boolean().
saveRechargeRebate(#recSaveRechargeRebate{
	id = ID,
	type = Type,
	rebateId = RebateId,
	beginTime = BeginTime,
	endTime = EndTime,
	arg1 = Arg1,
	arg2 = Arg2,
	arg3 = Arg3,
	arg4 = Arg4,
	arg5 = Arg5,
	arg6 = Arg6,
	arg7 = Arg7
}) ->
	try
		#ok_packet{affected_rows = Num} =
			emysql:execute(?GAMEDB_CONNECT_POOL, stSetRechargeRebateConf,
				[
					ID,Type,RebateId,BeginTime,EndTime,
					Arg1,Arg2,Arg3,Arg4,Arg5,Arg6,Arg7
				]),
		case Num >= 1 of
			true when Type=:= ?RechargeRebateFirstDouble->
				dbMemCacheCommon:setPayDoubleConf(#rec_recharge_double_conf{
					rebateID  = ID,
					funcellPayItemID = Arg2
				}),
				true;
			true ->
				true;
			false ->
				false
		end
	catch
		_:Content ->
			?ERROR_OUT("saveRechargeRebate err[~p]",[Content]),
			false
	end.

%%记录已经领取过的玩家与返利id
-spec saveRechargeRebateTaken(RoleID::uint64(),RebateID::uint32()) ->boolean().
saveRechargeRebateTaken(RoleID,RebateID) ->
	try
		#ok_packet{affected_rows = Num} = emysql:execute(?GAMEDB_CONNECT_POOL, stSetRechargeRebateTaken,
			[RoleID,RebateID]),
		Num >= 1
	catch
		_:Content ->
			?ERROR_OUT("saveRechargeRebateTaken err[~p] args[~p]",[Content,{RoleID,RebateID}]),
			false
	end.

%%清除已经领取过的双倍充值
-spec cleanRechargeRebateTaken(RebateID::uint32()) ->boolean().
cleanRechargeRebateTaken(RebateID) ->
	try
		#ok_packet{affected_rows = Num} = emysql:execute(?GAMEDB_CONNECT_POOL, stCleanRechargeRebateTaken,
			[RebateID]),

		Num >= 1
	catch
		_:Content ->
			?ERROR_OUT("cleanRechargeRebateTaken err[~p] args[~p]",[Content,{RebateID}]),
			false
	end.

%%cs删除已经领了预充值的数据
-spec delPreRecharge(AccountID::integer()) ->boolean().
delPreRecharge(AccountID) ->
	try
		#ok_packet{affected_rows = Num} = emysql:execute(?GAMEDB_CONNECT_POOL, stDelPreChargeAccount, [AccountID]),
		Num >= 1
	catch
		_:_ ->
			false
	end.

%%修改订单状态
-spec changeOrderStatue(FeOrderID::string(),Status::integer()) ->boolean().
changeOrderStatue(FeOrderID, Status) ->
	case emysql:execute(?RECHARGE_CONNECT_POOL, stChangeOrderStatus, [FeOrderID, Status]) of
		#ok_packet{} -> true;
		_ -> false
	end.

%% 保存排行榜数据
saveRankData(RankType, Len, []) ->
	%% 删除多余的排行榜角色数据
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stDelSurplusRankPlayer, [RankType, Len]),
	libDB:logResult(stDelSurplusRankPlayer,Ret,"stDelSurplusRankPlayer",{RankType, Len}),
	ok;
saveRankData(RankType, Len, [#recSaveRank{roleID = RoleID, rankType = RankType, rankSort = RSort} = Rank|List]) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stSaveRankData,
		[
			RoleID,
			RankType,
			RSort,
			Rank#recSaveRank.rankSortC,
			Rank#recSaveRank.value1,
			Rank#recSaveRank.value2,
			Rank#recSaveRank.value3,
			Rank#recSaveRank.createTime
		]),
	libDB:logResult(stSaveRankData,Ret,"stSaveRankData",{RoleID,RankType,RSort}),
	saveRankData(RankType, Len, List).

saveActivityData(#rec_activity{} = Activity) ->
	_Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stSaveActivityData,
		[
			Activity#rec_activity.id,
			Activity#rec_activity.starttime,
			Activity#rec_activity.phasetime,
			Activity#rec_activity.phase
		]),
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================
