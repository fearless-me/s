%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% todo 对于公共数据不做删除处理，只处理玩家私有数据，而且base_role,ext_role,player_data不处理
%%% todo 角色数据分成两类 1、直接删除 2、必须转入备份表然后删除
%%% fixme 目前审计需要的表 base_role/db_info/mail/mail_attachment/player_coin/recharge
%%% @end
%%% Created : 10. 十月 2016 14:52
%%%-------------------------------------------------------------------
-module(dbGSRubbishCleaner).
-author("Administrator").
-include("dbPrivate.hrl").
-include("dbsInc.hrl").

%% API
-export([
	loadRubbishRoleList/2,
	createBakTableOnSvrStart/0,
	cleanOneRole/2
]).

%%一天的秒数
-define(One_Day_Second, 86400).

loadRubbishRoleList(PidFromCS, #recRubbishCleanerSetting{
	oneCount = Count, delDelayDays = DelDelayDays, offlineDays = OffLineDays, offlineRoleLevel = OfflineLevel
}) ->
	startTimeStatics(),
	?LOG_OUT("<<==>> loadRubbishRoleList start <<==>>"),

	NowTimeSeconds = time:getSyncTime1970FromDBS(),
	DeleteDeadlineStr = time:int64ToTimeString(NowTimeSeconds - OffLineDays * ?One_Day_Second),
	CleanDataDeadlineStr = time:int64ToTimeString(NowTimeSeconds - DelDelayDays * ?One_Day_Second),

	SQLClean = io_lib:format(
		"SELECT roleID,accountID,deleteTime,lastLoginTime,lastLogoutTime, 1 as flag "
		"FROM base_role WHERE deleteTime <> '1970-01-01 00:00:00' and deleteTime <= '~ts' LIMIT ~p;", [CleanDataDeadlineStr, Count]),
	RubblishRoleList = doLoadRoleList(SQLClean),

	SQLDel = io_lib:format(
		"SELECT roleID,accountID,deleteTime,lastLoginTime,lastLogoutTime, 0 as flag "
		"FROM base_role WHERE deleteTime ='1970-01-01 00:00:00' and lastLoginTime < '~ts' AND LEVEL < ~p LIMIT ~p",
		[DeleteDeadlineStr, OfflineLevel, Count]),
	DelRoleList = doLoadRoleList(SQLDel),

	psMgr:sendMsg2PS(PidFromCS, loadRubbishRoleListAck, lists:append(DelRoleList, RubblishRoleList)),
	?LOG_OUT("<<==>> loadRubbishRoleList finish, diff=~p ms <<==>>", [stopTimeStatics()]),
	ok.

doLoadRoleList(SQL) ->
	try
		Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),

%%		libDB:logResult('loadRubbishRoleList',Ret,SQL,0),
		%%
		{TableRecord, RecInfo} = ?MakeArg(recRubbishRoleInfo),
		{DelRoles, _LeftResult1} = mysql:nextResult(Ret),
		emysql_util:as_record(DelRoles, TableRecord, RecInfo)
	catch
		_ : _Error ->
			[]
	end.

createBakTableOnSvrStart() ->
	doCreateBakTable(base_role),
	doCreateBakTable(item),
	doCreateBakTable(recharge),
	doCreateBakTable(player_coin),
	ok.

doCreateBakTable(TablName) ->
	startTimeStatics(),
	?WARN_OUT("doCreateBakTable(~p)...", [TablName]),
	SQL = io_lib:format("CREATE TABLE  IF NOT EXISTS  ~p_bak AS SELECT * FROM ~p LIMIT 0", [TablName, TablName]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	?WARN_OUT("doCreateBakTable(~p),~p ms,~ts", [TablName, stopTimeStatics(), logRet(Ret)]),
	ok.

%%cleanOneRole(PidFromCS, #recRubbishRoleInfo{roleID = RoleID, flag = Flag} = R)->
%%	Stamp = os:timestamp(),
%%	?WARN_OUT("clean role(~p)...",[RoleID]),
%%	%%%==========================================
%%	Ret = doClean(RoleID, Flag),
%%	%%%==========================================
%%	?WARN_OUT("clean role(~p) ok, diff(~p ms)",
%%		[RoleID,timer:now_diff(os:timestamp(), Stamp) / 1000]),
%%
%%	psMgr:sendMsg2PS(PidFromCS, cleanRubbishRoleDataAck, {Ret, R}),
%%	ok;

cleanOneRole(PidFromCS, #recRubbishRoleInfo{roleID = RoleID} = R) ->
	Stamp = os:timestamp(),
	?WARN_OUT("clean role(~p)...", [RoleID]),
	%%%==========================================
	Ret = doCleanOneRole(PidFromCS, R),
	psMgr:sendMsg2PS(PidFromCS, cleanRubbishRoleDataAck, {Ret, R}),
	%%%==========================================
	?WARN_OUT("clean role(~p) ok, diff(~p ms)",
		[RoleID, timer:now_diff(os:timestamp(), Stamp) / 1000]),
	ok.

doCleanOneRole(_PidFromCS, #recRubbishRoleInfo{roleID = RoleID, flag = 0}) ->
	dbGSSave:deleteRole(RoleID);
doCleanOneRole(_PidFromCS, #recRubbishRoleInfo{roleID = RoleID}) ->
	doWork(base_role, record_info(fields, rec_base_role), roleID, RoleID, bak),
	doWork(item, record_info(fields, rec_item), roleID, RoleID, bak),
	doWork(recharge, record_info(fields, rec_recharge), roleID, RoleID, bak),
	doWork(player_coin, record_info(fields, rec_player_coin), roleID, RoleID, bak),
%%%==========================================
	doWork(skill, record_info(fields, rec_skill), roleID, RoleID, skip),
	doWork(player_prop, record_info(fields, rec_player_prop), roleID, RoleID, skip),
	doWork(achieve, record_info(fields, rec_achieve), roleID, RoleID, skip),
	doWork(task_submitted, record_info(fields, rec_task_submitted), roleID, RoleID, skip),
	doWork(badge, record_info(fields, rec_badge), roleID, RoleID, skip),
	doWork(skill_slot, record_info(fields, rec_skill_slot), roleID, RoleID, skip),
	doWork(copymapscore, record_info(fields, rec_copymapscore), roleID, RoleID, skip),
	doWork(equip_refine_info, record_info(fields, rec_equip_refine_info), roleID, RoleID, skip),
	doWork(awaken_info, record_info(fields, rec_awaken_info), roleID, RoleID, skip),
	doWork(title, record_info(fields, rec_title),roleID,  RoleID, skip),
	doWork(task, record_info(fields, rec_task), roleID,  RoleID, skip),
	doWork(warrior_trial, record_info(fields, rec_warrior_trial), roleID, RoleID, skip),
	doWork(god_weapon, record_info(fields, rec_god_weapon), roleID, RoleID, skip),
	doWork(player_ms_shop, record_info(fields, rec_player_ms_shop), roleID, RoleID, skip),
	doWork(player_liveness, record_info(fields, rec_player_liveness), playerID, RoleID, skip),
	doWork(lottery_result, record_info(fields, rec_lottery_result), roleID, RoleID, skip),
	doWork(holiday_task, record_info(fields, rec_holiday_task), playerID, RoleID, skip),
	doWork(package_info, record_info(fields, rec_package_info), roleID, RoleID, skip),
	doWork(role_fashions, record_info(fields, rec_role_fashions), roleID, RoleID, skip),
	doWork(item_used_cd, record_info(fields, rec_item_used_cd), roleID, RoleID, skip),
	doWork(player_clock, record_info(fields, rec_player_clock), roleID, RoleID, skip),
	doWork(fashion_slot, record_info(fields, rec_fashion_slot), roleID, RoleID, skip),
	doWork(sourceshop_forever_limit, record_info(fields, rec_sourceshop_forever_limit), roleID, RoleID, skip),
	doWork(pet_info, record_info(fields, rec_pet_info), roleID, RoleID, skip),
	doWork(pet_skill, record_info(fields, rec_pet_skill), roleID, RoleID, skip),
	doWork(pet_equip, record_info(fields, rec_pet_equip), roleID, RoleID, skip),
	doWork(pet_dungeon_score, record_info(fields, rec_pet_dungeon_score), roleID, RoleID, skip),
	doWork(pet_dungeon_info, record_info(fields, rec_pet_dungeon_info), roleID, RoleID, skip),
	doWork(pet_manor_battle, record_info(fields, rec_pet_manor_battle), roleID, RoleID, skip),
	doWork(rune_base, record_info(fields, rec_rune_base), roleID, RoleID, skip),
	doWork(trade, record_info(fields, rec_trade), roleID, RoleID, skip),
	doWork(variant, record_info(fields, rec_variant0), roleID, RoleID, skip),
	doWork(daily_counter, record_info(fields, rec_daily_counter0), roleID, RoleID, skip),
	ok.

%doClean(RoleID, 0)->
%	emysql:execute(?GAMEDB_CONNECT_POOL, stClean1RubbishRoleAllData, [RoleID]),
%	dbGSSave:deleteRole(RoleID);
%doClean(RoleID, _)->
%	emysql:execute(?GAMEDB_CONNECT_POOL, stClean1RubbishRoleAllData, [RoleID]),
%	ok.

doWork(TableName, Fields, Key, KeyVal, Type) ->
	startTimeStatics(),
	?WARN_OUT("doWorak(~p,~p,~p)...", [TableName, Key, KeyVal]),
	SQL = formatSql(TableName, Fields, Key, KeyVal, Type),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	?WARN_OUT("doWorak(~p,~p,~p), diff(~p ms),~ts", [TableName, Key, KeyVal, stopTimeStatics(), logRet(Ret)]),
	ok.

logRet(#ok_packet{affected_rows = AffectRows, msg = Msg}) ->
	io_lib:format("ok|affected_rows ~p|~ts", [AffectRows, Msg]);
logRet(#error_packet{msg = Msg}) ->
	io_lib:format("error|~ts", [Msg]);
logRet(Other) ->
	io_lib:format("other|~p", [Other]).


formatSql(variant, _Fields, Key, KeyVal, _) ->
	io_lib:format("delete from variant~p where ~p=~p", [KeyVal rem 10, Key, KeyVal]);
formatSql(daily_counter, _Fields, Key, KeyVal, _) ->
	io_lib:format("delete from daily_counter~p where ~p=~p", [KeyVal rem 10, Key, KeyVal]);
formatSql(rune_base, _Fields, Key, KeyVal, _) ->
	DelRuneProp = io_lib:format("delete from rune_prop where runeUID in (select runeUID from rune_base where ~p=~p);", [Key, KeyVal]),
	DelRune = io_lib:format("delete from rune_base where ~p=~p", [Key, KeyVal]),
	io_lib:format("~ts~ts", [DelRuneProp, DelRune]);
%%formatSql(mail, _Fields, Key, KeyVal, _)->
%%	BakAttach = io_lib:format(
%%		"insert into  mail_attachment_bak(mailID,mtype,mvalue,mvalue2) SELECT mailID,mtype,mvalue,mvalue2 FROM mail_attachment WHERE mailID IN"
%%		"(SELECT mailID FROM mail WHERE ~p = ~p);", [Key, KeyVal]),
%%	BakMail = io_lib:format(
%%		"insert into mail_bak(mailID,mailReadTime,mailSendTime,isLocked,senderRoleID,toRoleID,mailTitle,mailContent,mailSubjoinMsg,deleteTime) "
%%		"select mailID,mailReadTime,mailSendTime,isLocked,senderRoleID,toRoleID,mailTitle,mailContent,mailSubjoinMsg,deleteTime from mail where ~p=~p;",[Key, KeyVal]),
%%
%%	DelAttach = io_lib:format("delete FROM mail_attachment WHERE mailID IN (SELECT mailID FROM mail WHERE ~p = ~p);", [Key, KeyVal]),
%%	DelMail = io_lib:format("delete from mail where ~p=~p;",[Key, KeyVal]),
%%	io_lib:format("~ts ~ts ~ts ~ts",[BakAttach, BakMail, DelAttach, DelMail]);
formatSql(TabName, Fields, Key, KeyVal, bak) ->
	FieldStr = formatFields("", Fields, length(Fields)),
	io_lib:format("insert into ~p_bak(~ts) select ~ts from ~p where ~p=~p;delete from ~p where ~p=~p",
		[TabName, FieldStr, FieldStr, TabName, Key, KeyVal, TabName, Key, KeyVal]);
formatSql(TabName, _Fields, Key, KeyVal, _) ->
	io_lib:format("delete from ~p where ~p=~p", [TabName, Key, KeyVal]).

formatFields(InitStr, _Fields, 0) ->
	InitStr;
formatFields(InitStr, [Field | _], 1) ->
	io_lib:format("~ts ~p", [InitStr, Field]);
formatFields(InitStr, [Field | Fields], N) ->
	formatFields(io_lib:format("~ts ~p,", [InitStr, Field]), Fields, N - 1).


startTimeStatics() ->
	put('NowTimeStamp', os:timestamp()).


stopTimeStatics() ->
	case get('NowTimeStamp') of
		undefined ->
			-9999999;
		Before ->
			timer:now_diff(os:timestamp(), Before) / 1000
	end.


%%	item	19037467 
%%	skill	9709891 
%%	player_prop	7825722 
%%	player_coin	6207299 
%%	achieve	6041204 
%%	pet_skill	5020543
%%	task_submitted	3625024
%%	pet_dungeon_score	3222355
%%	badge	2958576
%%	pet_equip	2740315
%%	skill_slot	2585930
%%	mail_attachment	2052818
%%	friend_info	1945412
%%	copymapscore	1903506
%%	variant3	1837178
%%	variant2	1833909
%%	variant0	1833442
%%	variant4	1832508
%%	variant1	1832508
%%	variant5	1832041
%%	variant9	1829239
%%	variant7	1827838
%%	variant8	1826437
%%	variant6	1822234
%%	mail	1742881
%%	equip_refine_info	1518217
%%	awaken_info	1207195
%%	title	1178253
%%	trade	1143558
%%	pet_info	1003321
%%	daily_counter3	986700
%%	daily_counter2	984000
%%	daily_counter5	978600
%%	daily_counter0	974700
%%	daily_counter1	973500
%%	daily_counter4	971400
%%	daily_counter9	967800
%%	item_used_cd	737984
%%	pet_dungeon_info	679600
%%	warrior_trial	678551
%%	base_role	676814  X
%%	ext_role	668133	X
%%	god_weapon	646840
%%	account	610763		X
%%	personality_info	563885
%%	player_ms_shop	519200
%%	player_liveness	306226
%%	lottery_result	271469
%%	holiday_task	212058
%%	rune_prop	209033
%%	recharge	207655
%%	pet_manor_battle	166068
%%	package_info	135960
%%	role_fashions	80561
%%	sourceshop_forever_limit	76180
%%	guild_member_skill	62832 X
%%	ladder_1v1	60377 X
%%	rune_base	51935 
%%	player_data	47838 X
%%	player_clock	41978
%%	fashion_slot	38350
%%	companion	34500


