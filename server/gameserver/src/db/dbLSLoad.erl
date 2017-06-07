%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三科技
%%% @doc
%%%
%%% @end
%%% Created : 03. 七月 2014 17:51
%%%-------------------------------------------------------------------
-module(dbLSLoad).
-author("ZhongYuanWei").

-include("dbPrivate.hrl").

%% API
-export([initLSLoadPrepare/0]).

-export([
	getGameWhiteAccount/1,
	getGameDenyAccount/1,
	xmlNoticSel/0,
	getDeviceSet/0,
	getRandIpList/0,
	getAccount/2
]).

initLSLoadPrepare() ->
	emysql:prepare(stGetLineServerList, "call getServerList()"),
	emysql:prepare(stGlobalAccount, "call getAccountAndInsert(?,?,?,?,?,?,?,?,?,?)"),
	emysql:prepare(stCreateGlobalAccount, "call createNewAccount(?,?,?,?,?,?,?,?,?,?)"),
	emysql:prepare(stGameDataAccount, "call getAccountInfoByPlatformAccountAndPlatformName(?,?)"),
	emysql:prepare(stGetDBID, "call getDbID()"),
	emysql:prepare(stGetAccountDenyList, "call getAccountDenyList(?)"),
	emysql:prepare(stGetAccountWhiteList, "call getAccountWhiteList(?)"),

	emysql:prepare(stGameCreateAccount, "call insertAccount(?,?,?,?,?)"),
	emysql:prepare(stGetXmlNoticSel, "call xmlNoticSel()"),
	emysql:prepare(stSelDenyDevice, "CALL selDenyDevice();"),
	ok.

%%取出白名单表
getGameWhiteAccount(PidFrom) ->
	try
		DenyList = getAccountWhiteListInGlobal(),
		psMgr:sendMsg2PS(PidFrom, getWhiteAccountListAck, {DenyList})
	catch
		_:All ->
			?ERROR_OUT("getGameWhiteAccount db Err:~p", [All])
	end.

%%取出黑名单表
getGameDenyAccount(PidFrom) ->
	try
		DenyList = getAccountDenyListInGlobal(),
		psMgr:sendMsg2PS(PidFrom, getBlackAccountListAck, {DenyList})
	catch
		_:All ->
			?ERROR_OUT("getGameDenyAccount db Err:~p", [All])
	end.

%%登录
getAccount(PidFrom, Msg) ->
	%% GSAccount访问、更新、检测#在收到gs发送的验证后操作
	{_DBID, PlatformAccount, PlatformAccountID, PlatformName, Fgi, LsNickName, DdeviceId, _Imei, _Idfa, _Mac} = Msg,
	try
		PlatformName2 = erlang:list_to_binary(PlatformName),
		RetAccountRecord =
			case getAccountInfoByAccountAndPlatforIDInGs(PlatformAccountID, PlatformName) of
				[] ->
					case getAccountInfoInGlobal(PlatformAccountID, PlatformName) of
						undefined ->
							newCreate;
						GlobalAccountID ->
							?LOG_OUT("accountGetOrInsert getAccountInfoInGlobal GlobalAccountID ~p PlatformAccount ~p,PlatformID ~p", [GlobalAccountID, PlatformAccount, PlatformName]),
							[AccountRecord|_] = createAccountInGs(GlobalAccountID, PlatformAccountID, PlatformName, Fgi, LsNickName),
							AccountRecord
					end;
				[AccountRecord|_] -> AccountRecord
			end,

		case RetAccountRecord of
			#account{accountID = AccID} when AccID > 0 ->
				psMgr:sendMsg2PS(PidFrom, getAccountAck, {?Login_LS_Result_Succ, RetAccountRecord#account{platformName = PlatformName2}, Msg}),
				dbLSSave:setGSAccountDeviceID(RetAccountRecord#account.accountID, DdeviceId);
			newCreate ->
				createGlobalAccount(PidFrom, Msg);
			_ ->
				throw("accountID err:<1")
		end,

		?LOG_OUT("getAccountBase is Succ, ~p", [RetAccountRecord]),
		ok
	catch
		_:All ->
			%%数据库报错，给ls节点进程回馈  失败标志
			psMgr:sendMsg2PS(PidFrom, getAccountAck, {doErr}),
			?ERROR_OUT("accountGetOrInsert ptUID:~p ptName:~ts db Err:[~p][~p]", [PlatformAccountID, PlatformName, All, erlang:get_stacktrace()]),
			ok
	end.

createGlobalAccount(PidFromLs, Msg) ->
	NewAccountID = uidMgr:makeAccountUID(),
	{_, PlatformAccount, PlatformAccountID, PlatformName, Fgi, NickName, DdeviceId, Imei, Idfa, Mac} = Msg,
	try
		PlatformName2 = erlang:list_to_binary(PlatformName),
		_Ret = emysql:execute(?LOGINDB_CONNECT_POOL, stCreateGlobalAccount,
			[
				NewAccountID,
				PlatformAccount,
				PlatformAccountID,
				PlatformName,
				Fgi,
				DdeviceId,
				Imei,
				Idfa,
				Mac,
				NickName
			]),
		[AccountRecord | _] = createAccountInGs(NewAccountID, PlatformAccountID, PlatformName, Fgi, NickName),
		psMgr:sendMsg2PS(PidFromLs, getAccountAck, {?Login_LS_Result_Succ, AccountRecord#account{platformName = PlatformName2}, Msg}),
		dbLSSave:setGSAccountDeviceID(AccountRecord#account.accountID, DdeviceId)
	catch
		_:All ->
			%%数据库报错，给ls节点进程回馈  失败标志
			psMgr:sendMsg2PS(PidFromLs, getAccountAck, {doErr}),
			?ERROR_OUT("accountGetOrInsert ptUID:~p ptName:~ts db Err:[~p][~p]", [PlatformAccountID, PlatformName, All, erlang:get_stacktrace()]),
			ok
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================
getAccountInfoInGlobal(PlatformAccountID, PlatformName) ->
	SQL = io_lib:format("select accountID from account where platformAID = '~ts' and platformName = '~ts';", [PlatformAccountID, PlatformName]),
	Result = emysql:execute(?LOGINDB_CONNECT_POOL, SQL),
	mysql:queryScalar(Result).

%%取出gs帐号信息
getAccountInfoByAccountAndPlatforIDInGs(PlatformAccountID, PlatformName) ->
	?DEBUG_OUT("getAccountInfoByAccountAndPlatforIDInGs(~p,~p)", [PlatformAccountID, PlatformName]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
		stGameDataAccount,
		[PlatformAccountID, PlatformName]),
	{Result, _LeftResult} = mysql:nextResult(Ret),
	emysql_util:as_record(Result, account, record_info(fields, account)).

%%在gs新建帐号
createAccountInGs(GlobalAccountID, PlatformAccountID, PlatformName, Fgi, NickName) when GlobalAccountID > 0 ->
	?DEBUG_OUT("createAccountInGs(~p)]",
		[[GlobalAccountID, PlatformAccountID, PlatformName, NickName]]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
		stGameCreateAccount,
		[GlobalAccountID,
			PlatformAccountID,
			PlatformName,
			Fgi,
			NickName]),
	{Result, _LeftResult} = mysql:nextResult(Ret),
	emysql_util:as_record(Result, account, record_info(fields, account)).

%%在全局帐号库中取出 帐号黑名单
getAccountDenyListInGlobal() ->
	GameLineID = globalSetup:getDBID(),
%%	?DEBUG_OUT("GSID[~p] getAccountDenyList", [GameLineID]),
	Ret = emysql:execute(?LOGINDB_CONNECT_POOL, stGetAccountDenyList, [GameLineID]),
	{Result, _LeftResult} = mysql:nextResult(Ret),
	emysql_util:as_record(Result, blackAccount, record_info(fields, blackAccount)).

%%在全局帐号库中取出 帐号白名单
getAccountWhiteListInGlobal() ->
	GameLineID = globalSetup:getDBID(),
%% 	?DEBUG_OUT("GSID[~p] getAccountWhiteList",[GameLineID]),
	Ret = emysql:execute(?LOGINDB_CONNECT_POOL, stGetAccountWhiteList, [GameLineID]),
	{Result, _LeftResult} = mysql:nextResult(Ret),
	emysql_util:as_record(Result, whiteAccount, record_info(fields, whiteAccount)).

%%获取xml公告到ets
xmlNoticSel() ->
	?DEBUG_OUT("getAccountWhiteList", []),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stGetXmlNoticSel, []),
	{Result, _LeftResult} = mysql:nextResult(Ret),
	emysql_util:as_record(Result, xmlNoticeRow, record_info(fields, xmlNoticeRow)).

-spec getDeviceSet() -> list().
getDeviceSet() ->
	try
		Ret = emysql:execute(?LOGINDB_CONNECT_POOL, stSelDenyDevice, []),
		{Result, _LeftResult} = mysql:nextResult(Ret),
		emysql_util:as_record(Result, recDenyDevice, record_info(fields, recDenyDevice))
	catch
		_:_ -> []
	end.

-spec getRandIpList() -> ok.
getRandIpList() ->
	SQL1 = "SELECT * FROM eventlist1;",
	SQL2 = "SELECT * FROM eventlist2;",
	try
		Ret1 = emysql:execute(?LOGINDB_CONNECT_POOL, SQL1),
		{Result1, _LeftResult1} = mysql:nextResult(Ret1),
		List1 = emysql_util:as_record(Result1, id, record_info(fields, id)),

		Ret2 = emysql:execute(?LOGINDB_CONNECT_POOL, SQL2),
		{Result2, _LeftResult2} = mysql:nextResult(Ret2),
		List2 = emysql_util:as_record(Result2, id, record_info(fields, id)),
		{List1, List2}
	catch
		P:Why ->
			?ERROR_OUT("getRandIpList not found eventlist1,eventlist2 record:~p,~p", [P, Why]),
			{[], []}
	end.