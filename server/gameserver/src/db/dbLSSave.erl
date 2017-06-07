%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三科技
%%% @doc
%%%
%%% @end
%%% Created : 03. 七月 2014 17:51
%%%-------------------------------------------------------------------
-module(dbLSSave).
-author("ZhongYuanWei").

-include("dbPrivate.hrl").
-include("gamedataLog.hrl").
-include("gsDef.hrl").
%% API
-export([initLSSavePrepare/0]).

-export([setAccountLoginStatus/1,
	clearAccountOnGS/1,
	updateDBInfo/1,
	addGameNotice/1,
	delGameNotice/1,
	selGameNotice/0,
	addLoginAwardConf/1,
	selLoginAwardConf/0,
	delGameLoginAward/1,
	xmlNoticeAdd/3,
	setGMAccountLevel/2,
	setDenyAccountID/5,
	setWhiteAccountID/2,
	setRoleDelFlag/2,
	denyDeviceSet/2,
	saveMallData/2,
	deleteMallItem/2,
	setGSAccountDeviceID/2,
	returnRole/1,
	returnItem/1,
	saveLimitSalesItem/1,
	delLimitSales/0
]).

initLSSavePrepare() ->
	emysql:prepare(stSetAccountLoginInfo, "call setAccountLoginInfo(?,?,?)"),
	emysql:prepare(stClearAccountOnGS, "call clearAccountOnGS(?)"),
	emysql:prepare(stInsertGameNotice, "call noticeAdd(?,?,?,?,?,?,?)"),
	emysql:prepare(stDelGameNotice, "call noticeDel(?)"),
	emysql:prepare(stSelGameNotice, "call noticeSelect()"),
	emysql:prepare(stLoginAwardConfAdd, "call loginAwardConfAdd(?,?,?,?,?,?,?,?)"),
	emysql:prepare(stLoginAwardConfSelect, "call loginAwardConfSelect()"),
	emysql:prepare(stLoginAwardConfDel, "call loginAwardConfDel(?)"),
	emysql:prepare(stXmlContentAdd, "call xmlNoticeAdd(?,?,?)"),
	emysql:prepare(stSetGMAccount, "call setGMAccount(?,?)"),
	emysql:prepare(stSetDenyAccountID, "call setDenyAccountID(?,?,?,?,?)"),
	emysql:prepare(stSetWhiteAccountID, "call setWhiteAccountID(?,?)"),
	emysql:prepare(stSetRoleDelFlag, "call setRoleDelFlag(?,?)"),
	emysql:prepare(stAddDenyDevice, "CALL addDenyDevice(?);"),
	emysql:prepare(stDelDenyDevice, "CALL delDenyDevice(?);"),
	emysql:prepare(stSaveMallInfo,"call SaveMallInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"),
	emysql:prepare(stDeleteMallItem,"DELETE FROM mall WHERE dbID = ?"),
	emysql:prepare(stSetAccountLastDeviceID, "CALL setAccountLastDeviceID(?,?);"),
	emysql:prepare(stReturnRole, "call returnRole(?)"),
	ok.

%%设置帐号的登录状态
%%Behavior=1登入|2登出|3换线|4抢登入
setAccountLoginStatus({Behavior, AccountID, GameLineID}) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
		stSetAccountLoginInfo,
		[Behavior,
			AccountID,
			GameLineID]),
	libDB:logResult(stSetAccountLoginInfo,Ret,"{AccountID,Behavior}:",{AccountID,Behavior}),
	ok.

%% 修改DBINFO
-spec updateDBInfo(term()) -> ok.
updateDBInfo({MaxPlayer}) ->
	globalSetup:insert(?GSKey_maxPlayer, MaxPlayer),

	SQL = io_lib:format("UPDATE db_info di set di.maxPlayer = ~p", [MaxPlayer]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
	libDB:logResult(updateDBInfo,Ret,"maxPlayer:",MaxPlayer).

%%设置某GS上的所有帐号在线gsid=0
clearAccountOnGS({GSID}) ->
	emysql:execute(?GAMEDB_CONNECT_POOL, stClearAccountOnGS, [GSID]),
	ok.

%%增加公告到数据库，
addGameNotice(#gameNotice{
	position = Position,
	type=Type,
	content=Content,
	rgb=Rgb,
	beginTime=BeginTime,
	duration=Duration,
	interval=Interval
}) ->
	?DEBUG_OUT("addGameNotice",[]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
		stInsertGameNotice,
		[Position,Type,Content,Rgb,BeginTime,Duration,Interval]),
	{Result, _LeftResult} = mysql:nextResult(Ret),
	Row = mysql:firstRow(Result),
	mysql:getFieldValue(1, Row).

%%删除公告（根据id）
delGameNotice(NoticeID) ->
	#ok_packet{} = emysql:execute(?GAMEDB_CONNECT_POOL,
		stDelGameNotice,
		[NoticeID]),
	ok.

%%获取公告（所有有效的定时，轮播公告）
selGameNotice() ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
		stSelGameNotice,
		[]),
	{Result, _LeftResult} = mysql:nextResult(Ret),
	emysql_util:as_record(Result, gameNotice, record_info(fields, gameNotice)).

%%增加登录有礼活动配置
addLoginAwardConf(#loginAwardConf{
	award_id = _AwardID,
	award_name = AwardName,
	time_begin = TimeBegin,
	time_end = TimeEnd,
	level_min = LevelMin,
	level_max = LeveMax,
	mail_title = MailTitle,
	mail_content = MailContent,
	items = Items
}) ->
	ItemsJsonStr = rfc4627:encode({obj,[{"Items",Items}]}),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
		stLoginAwardConfAdd,
		[AwardName,TimeBegin,TimeEnd,LevelMin,LeveMax,MailTitle,MailContent,ItemsJsonStr]),
	libDB:logResult(stLoginAwardConfAdd,Ret,"",_AwardID),
	ok.

%%取出有效的登录活动配置
selLoginAwardConf() ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
		stLoginAwardConfSelect,
		[]),
	{Result, _LeftResult} = mysql:nextResult(Ret),
	emysql_util:as_record(Result, loginAwardConf, record_info(fields, loginAwardConf)).

%%删除登录活动配置（根据id）
delGameLoginAward(AwardID) ->
	#ok_packet{} = emysql:execute(?GAMEDB_CONNECT_POOL,
		stLoginAwardConfDel,
		[AwardID]),
	ok.

%%增加xml公告
xmlNoticeAdd(Type,XmlContent,Md5) ->
	try
		emysql:execute(?GAMEDB_CONNECT_POOL,
			stXmlContentAdd,
			[Type,XmlContent,Md5])
	catch
		ErrType:Errcon ->
			?ERROR_OUT("xmlNoticeAdd ~p ~p",[ErrType,Errcon])
	end,
	ok.

%%设置帐号gm级别
%%AccountIDListStr::"127,130,131"  设置aid in(127,130,131)的 gmLevel
-spec setGMAccountLevel(AccountIDListStr,Level) -> ok when
	AccountIDListStr::string(),Level::integer().
setGMAccountLevel(AccountIDListStr,Level) ->
	try
		emysql:execute(?GAMEDB_CONNECT_POOL,
			stSetGMAccount,
			[AccountIDListStr,Level])
	catch
		ErrType:Errcon ->
			?ERROR_OUT("setGMAccountLevel ~p ~p",[ErrType,Errcon])
	end,
	ok.

-spec denyDeviceSet(DeviceID::string(),OpType::atom()) -> boolean().
denyDeviceSet(DeviceID,OpType) ->
	try
		#ok_packet{} = setDenyDevice(OpType,DeviceID),
		true
	catch
		_:_ ->
			false
	end.


%%保存商城数据信息
saveMallData(_PidFromCS, #recSaveMall{} = Mall) ->
	try
		#ok_packet{} = emysql:execute(?GAMEDB_CONNECT_POOL, stSaveMallInfo,
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
		{set,ok}
	catch
		ErrType:Errcon ->
			?ERROR_OUT("saveMallData by plat error ~p ~p",[ErrType,Errcon]),
			{set,err}
	end.


%%删除商城道具
deleteMallItem(_PidFromCS, Db_id) ->
	try
		emysql:execute(?GAMEDB_CONNECT_POOL,
			stDeleteMallItem,
			[Db_id])
	catch
		ErrType:Errcon ->
			?ERROR_OUT("deleteMallItem by plat error ~p ~p",[ErrType,Errcon])
	end,
	{del,ok}.

%%设置帐号是否为黑名单
%%Operate:: 1为增加；0为删除
-spec setDenyAccountID(Operate,AccountID,AreaID,BeginTime, EndTime) -> ok when
	Operate::integer(),AccountID::integer(),AreaID::integer(),BeginTime::integer(),EndTime::integer().
setDenyAccountID(Operate,AccountID,AreaID ,BeginTime, EndTime) ->
	try
		emysql:execute(?LOGINDB_CONNECT_POOL,
			stSetDenyAccountID,
			[Operate,AccountID,AreaID,BeginTime, EndTime])
	catch
		ErrType:Errcon ->
			?ERROR_OUT("setGMAccountLevel ~p ~p",[ErrType,Errcon])
	end,
	ok.

%%设置帐号是否为 白名单
%%Operate:: 1为增加；0为删除
-spec setWhiteAccountID(Operate,AccountID) -> ok when
	Operate::integer(),AccountID::integer().
setWhiteAccountID(Operate,AccountID) ->
	try
		emysql:execute(?LOGINDB_CONNECT_POOL,
			stSetWhiteAccountID,
			[Operate,AccountID])
	catch
		ErrType:Errcon ->
			?ERROR_OUT("setGMAccountLevel ~p ~p",[ErrType,Errcon])
	end,
	ok.

%%设置角色是否为 删除
%%Operate:: 1为增加；0为删除
%%RoleIDListStr::"1,2,3"点分法
-spec setRoleDelFlag(Operate,RoleIDListStr) -> ok when
	Operate::integer(),RoleIDListStr::string().
setRoleDelFlag(Operate,RoleIDListStr) ->
	try
		emysql:execute(?GAMEDB_CONNECT_POOL,
			stSetRoleDelFlag,
			[Operate,RoleIDListStr])
	catch
		ErrType:Errcon ->
			?ERROR_OUT("setGMAccountLevel ~p ~p",[ErrType,Errcon])
	end,
	ok.

%% 设置帐号最近登录的deviceID
-spec setGSAccountDeviceID(AccountID::integer(),DeviceID::string()) ->boolean().
setGSAccountDeviceID(AccountID,DeviceID) ->
	#ok_packet{affected_rows=RowNum} = emysql:execute(?GAMEDB_CONNECT_POOL,
		stSetAccountLastDeviceID,
		[AccountID,DeviceID]),
	RowNum >= 1.

%% 还原角色账号
-spec returnRole(RoleID::uint()) -> boolean().
returnRole(RoleID) ->
	{Ret,MysqlRet} =
		case emysql:execute(?GAMEDB_CONNECT_POOL,
			stReturnRole,[RoleID]) of
			#ok_packet{affected_rows = RowNum} = All when RowNum =:= 1 ->
				{true,All};
			All ->
				{false,All}
		end,
	libDB:logExecResult(stReturnRole,RoleID,MysqlRet),

	SQL = io_lib:format("select accountID from base_role where roleID=~p",[RoleID]),
	Ret1 = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
	{Result, _LeftResult} = mysql:nextResult(Ret1),
	Row = mysql:firstRow(Result),
	AccountID = mysql:getFieldValue(1, Row),

	%% 删除角色列表
	ets:delete(ets_recRoleList, AccountID),

	%% 重新加载相关数据
	psMgr:sendMsg2PS(?PublicDataMgr, returnRole, {RoleID, AccountID}),

	Ret.

%%还原角色装备
-spec returnItem(ItemUID::uint()) -> boolean().
returnItem(ItemUID) ->
	dbMemCacheCommon:getItemByItemUID(ItemUID).

saveLimitSalesItem(ItemList)->
	?ERROR_OUT("saveLimitSalesItem 1 ItemList [~p]",[ItemList]),
	Fun = fun(#rec_limit_sales{
		sku = Sku,
		itemID = ItemID,
		num = Num,
		isBinded = Binded,
		price = Price,
		rebate = Rebate,
		startTime = StartTime,
		endTime = EndTime,
		coinType = CoinType,
		limitSales = Limit
	},AccIn) ->
		io_lib:format(",(~p,~p,'~p','~p',~p,~p,'~p','~p',~p,~p)",[Sku,ItemID,Num,Binded,Price,Rebate,StartTime,EndTime,CoinType,Limit]) ++ AccIn
		  end,
	[_|T] = lists:foldl(Fun,[],ItemList),
	SQL = io_lib:format("insert limit_sales(sku,itemID,num,isBinded,price,rebate,startTime,endTime,coinType,limitSales) values ~s",[T]),
	case emysql:execute(?GAMEDB_CONNECT_POOL,SQL) of
		#ok_packet{} ->
			?ERROR_OUT("saveLimitSalesItem 2 ItemList [~p]",[ItemList]),
			edb:clearTable(rec_limit_sales),
			lists:foreach(fun(Record)-> edb:writeRecord(Record) end,ItemList),
			ok;
		_ ->
			?ERROR_OUT("saveLimitSalesItem 3 ItemList [~p]",[ItemList])
	end,
	ok.

delLimitSales()->
	SQL = ("TRUNCATE TABLE limit_sales"),
	case emysql:execute(?GAMEDB_CONNECT_POOL,SQL) of
		#ok_packet{} ->
			edb:clearTable(rec_limit_sales),
			ok;
		_ ->
			?ERROR_OUT("delLimitSales failed.")
	end,
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================

-spec setDenyDevice(OpType::atom(),DeviceID::string()) ->term().
setDenyDevice(OpType,DeviceID) when OpType =:= stAddDenyDevice orelse OpType =:= stDelDenyDevice ->
	emysql:execute(?LOGINDB_CONNECT_POOL, OpType,[DeviceID]).