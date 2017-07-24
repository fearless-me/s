%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三科技
%%% @doc
%%%
%%% @end
%%% Created : 03. 七月 2014 17:49
%%%-------------------------------------------------------------------
-module(dbGSLoad).
-author("ZhongYuanWei").

-include("dbPrivate.hrl").
-include("gsDef.hrl").

%% API
-export([initGSLoadPrepare/0]).

-export([
	getRoleList/1,
	getRoleListReload/1
]).

-export([
%%	getUIDList/2,
	getRoleData/3,
	getActiveCodeRequestInGlobal/1,
	getCopyMapHighestScore/1,
	getAccountWelfare/2,
	getBindPhoneNum/1,
	getRoleData4King/1,
	canUseNewName/2,
	getRedEnvelopeData/0
]).

-export([
	getRoleVisualEquip/1,
	getRoleEquipRefine/1,
	getRoleFashion/1
]).

-export([
	getActiveCodeByRoleID/1
]).

initGSLoadPrepare() ->
	emysql:prepare(stGetRoleList,"call GetRoleList(?)"),
	emysql:prepare(stGetMaxUID,"call getMaxUID(?,?,@MaxUID)"),
	emysql:prepare(stGetAchieve, "call getAchieve(?)"),
	emysql:prepare(stGetActiveCode, "call getActiveCode(?,?)"),
	emysql:prepare(stGetUsedActiveCode4Role,"call getUsedActiveCode4Role(?)"),
	emysql:prepare(stGetCopyMapMaxScore,"call getCopyMapMaxScore(?)"),
	emysql:prepare(stGetWelfare,"call getWelfare(?,?)"),
	emysql:prepare(stGetBindPhoneNum,"call getBindPhoneNum(?)"),
	emysql:prepare(stgetRoleData4King,"call getRoleData4King(?)"),
	emysql:prepare(stGetTeamID,"call getTeamID(?)"),
	ok.

%%根据角色id取出王者战天下用的数据
-spec getRoleData4King(RoleID::uint64())->[#recRoleData4King{}].
getRoleData4King(RoleID) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stgetRoleData4King, [RoleID]),
	{Result, _LeftResult} = mysql:nextResult(Ret),
	emysql_util:as_record(Result, recRoleData4King, record_info(fields, recRoleData4King)).

-spec getCopyMapHighestScore(RoleID::uint()) -> list().
getCopyMapHighestScore(RoleID) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stGetCopyMapMaxScore, [RoleID]),
	{Result, _LeftResult} = mysql:nextResult(Ret),
	emysql_util:as_record(Result, recCopyMapScore, record_info(fields, recCopyMapScore)).

%% 取未发完的红包数据
-spec getRedEnvelopeData() -> [#rec_redenvelope{}, ...] | [].
getRedEnvelopeData() ->
	SQL = "SELECT * FROM redenvelope",
	?LOG_OUT("load redenvelope data"),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	{Result,_LeftResult} = mysql:nextResult(Ret),
	emysql_util:as_record(Result, rec_redenvelope, record_info(fields, rec_redenvelope)).

%% 获取角色列表
-spec getRoleList(AccountID::uint64() | #recRoleList{}) -> #recRoleList{}.
getRoleList(#recRoleList{} = Data) ->
	getRoleListReload(Data);
getRoleList(AccountID) when erlang:is_integer(AccountID) andalso AccountID > 0 ->
	getPreviewRoleList(AccountID).

%% 获取角色列表更新信息，主要是获取GM等级和是否可以改名
-spec getRoleListReload(#recRoleList{}) -> #recRoleList{}.
getRoleListReload(#recRoleList{accountID = AccountID} = Rec) ->
	GMLevel = getAccountGMLevel(AccountID),
%%    Fun =
%%        fun(#recRoleListInfo{roleID = RoleID} = RLI) ->
%%            CanRename = getRoleCanRename(RoleID),
%%            RLI#recRoleListInfo{canRename = CanRename}
%%        end,
%%    RoleList2 = lists:map(Fun, RoleList),
	Rec#recRoleList{gmLevel = GMLevel}.

%%获取角色数据，角色数据可能会有几个记录集，几个记录集放在一个元组中
-spec getRoleData(RoleID, PidFrom,PlayerDataOtp::pid()) -> ok when
	RoleID :: non_neg_integer(), PidFrom ::pid().
getRoleData(RoleID,PidFrom,PlayerDataOtp) when erlang:is_integer(RoleID) ->
	?DEBUG_OUT("getRoleData:~p", [RoleID]),
	case dbRoleDataCache:getRoleDataFromDB(RoleID, PlayerDataOtp) of
		false ->
			skip;
		Data ->
			%% 返回给GS,发给gs:playerDataMgrOtp进程
			psMgr:sendMsg2PS(?PlayerDataMgr, loadRoleDataFromDBAck, {RoleID, PidFrom, Data})
	end,
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================

%% 读取角色预览信息
-spec getPreviewRoleList(AccountID::uint64()) -> #recRoleList{}.
getPreviewRoleList(AccountID) ->
	%% 读取GM等级
	GMLevel = getAccountGMLevel(AccountID),
	%% 读取是否解锁种族
	UnlockNewRace = getAccountUnlockNew(AccountID),

	%% 读取外观信息
	SQL1 = io_lib:format("SELECT
    accountID,
    roleID,
    roleName,
    sex,
    head,
    camp,
    race,
    career,
    level,
    mapID,
    oldMapID,
    lastLogoutTime
    FROM base_role
    WHERE accountID = ~p AND deleteTime = '1970-01-01 00:00:00'",[AccountID]),

	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL1),
	{Result1,_LeftResult1} = mysql:nextResult(Ret),

	List = emysql_util:as_record(Result1, recRoleListInfo, record_info(fields,recRoleListInfo)),

	Fun =
		fun(#recRoleListInfo{roleID = RoleID,lastLogoutTime = {_,{Date, Time}}} = RoleInfo,AccIn) ->
			CanRename = getRoleCanRename(RoleID),
			LastLogoutTime = time:convertDateTime1970ToSec({Date, Time}),
			[
				RoleInfo#recRoleListInfo{
					canRename = CanRename,
					lastLogoutTime = LastLogoutTime
				} | AccIn
			]
		end,
	RoleList = lists:foldr(Fun,[],List),
	#recRoleList{accountID = AccountID, gmLevel = GMLevel, unlockNewRace = UnlockNewRace, roleListInfo = RoleList}.

%% 本语句受玩家道具数据量的影响，查询耗时1~20S不等
getRoleVisualEquip(RoleID) ->
	SQL = io_lib:format("SELECT
    i.roleID,
    i.itemID AS equipID,
    i.quality
  FROM item i
  WHERE i.roleID = ~p AND i.pos = 6 AND i.itemID > 30000",[RoleID]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	{Result1,_LeftResult1} = mysql:nextResult(Ret),
	emysql_util:as_record(Result1, recVisibleEquip, record_info(fields,recVisibleEquip)).

getAccountGMLevel(AccountID) ->
	SQL = io_lib:format("SELECT a.gmLevel,d.gmLevel FROM account a,db_info d WHERE a.accountID = ~p",[AccountID]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	{Result1,_LeftResult1} = mysql:nextResult(Ret),
	Result2 = emysql_util:as_proplist(Result1),
	case Result2 of
		[[{_, PlayerGMLevel}, {_, DBGMLevel}]] ->
			case DBGMLevel > 0 of
				true ->
					DBGMLevel;
				_ ->
					PlayerGMLevel
			end;
		_ ->
			0
	end.

getAccountUnlockNew(AccountID) ->
	SQL = io_lib:format("SELECT a.unlockNewRace FROM account a WHERE a.accountID = ~p",[AccountID]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	{Result1,_LeftResult1} = mysql:nextResult(Ret),
	Result2 = emysql_util:as_proplist(Result1),
	case Result2 of
		[[{_, UnlockVaL}]] ->
			UnlockVaL;
		_ ->
			0
	end.

getRoleFashion(RoleID) ->
	SQL = io_lib:format("SELECT fs.roleID, fs.slot AS `index`,fs.fashionID AS `value`, rf.endtime AS endTime
        from fashion_slot fs left join role_fashions rf
        on   rf.roleID = fs.roleID and rf.fashionID = fs.fashionID
        where fs.roleID =~p",[RoleID]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	{Result1,_LeftResult1} = mysql:nextResult(Ret),
	emysql_util:as_record(Result1, recFashionOnLoad, record_info(fields,recFashionOnLoad)).

getRoleEquipRefine(RoleID) ->
	SQL = io_lib:format("SELECT
    roleID,
    type,
    level
  FROM equip_refine_info
  WHERE roleID=~p",[RoleID]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	{Result1,_LeftResult1} = mysql:nextResult(Ret),
	emysql_util:as_record(Result1, rec_equip_refine_info, record_info(fields,rec_equip_refine_info)).

getRoleCanRename(RoleID) ->
	SQL = io_lib:format("SELECT er.canRename FROM ext_role er WHERE er.roleID=~p",[RoleID]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	case Ret of
		#result_packet{rows = [[CanRename]]} ->
			CanRename =:= 1;
		_ ->
			false
	end.

%%取出激活码信息
getActiveCodeRequestInGlobal({ActiveCode, RoleID})->
	Ret = emysql:execute(?ACTIVECODEDB_CONNECT_POOL, stGetActiveCode, [ActiveCode, RoleID]),
	{Result, _LeftResult} = mysql:nextResult(Ret),
	Row = mysql:firstRow(Result),
	#recActiveCodeInfo{
		channel_name = mysql:getFieldValue(1, Row),
		batch = mysql:getFieldValue(2, Row),
		item_id = mysql:getFieldValue(3, Row),
		item_count = mysql:getFieldValue(4, Row),
		param = mysql:getFieldValue(5, Row),
		valide_time_begin = mysql:getFieldValue(6, Row),
		valide_time_end = mysql:getFieldValue(7, Row),
		valide_server_id_list = mysql:getFieldValue(8, Row),
		get_player_id = mysql:getFieldValue(9, Row),
		get_count = mysql:getFieldValue(10, Row),
		id = mysql:getFieldValue(11, Row)
	}.

%%取出帐号福利
-spec getAccountWelfare(AccountID::uint32(),WelfareTypeID::uint32())-> ItemListStr::string().
getAccountWelfare(AccountID,WelfareTypeID)->
	?LOG_OUT("getAccountWelfare accoutID[~p],typeid[~w]", [AccountID,WelfareTypeID]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
		stGetWelfare,
		[AccountID,WelfareTypeID]),
	{Result, _LeftResult} = mysql:nextResult(Ret),
	Row = mysql:firstRow(Result),
	mysql:getFieldValue(1, Row).

%% 取出玩家已经领用过的万用礼包码id
getActiveCodeByRoleID(RoleID) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stGetUsedActiveCode4Role, [RoleID]),
	{Result,_LeftResult} = mysql:nextResult(Ret),
	ACIDRows = emysql_util:as_record(Result, id, record_info(fields,id)),
	Fun = fun(One,Acc) -> [One#id.id | Acc] end,
	lists:foldl(Fun, [], ACIDRows).

-spec getBindPhoneNum(AccountID::uint()) -> PhoneNum::int64().
getBindPhoneNum(AccountID) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
		stGetBindPhoneNum,
		[AccountID]),
	{Result, _LeftResult} = mysql:nextResult(Ret),
	case emysql_util:as_record(Result, recBindPhoneNum, record_info(fields, recBindPhoneNum)) of
		[#recBindPhoneNum{bindPhoneNum = PhoneNum}] -> PhoneNum;
		Res ->
			?ERROR_OUT("getBindPhoneNum:~p, Res=~p", [AccountID, Res]),
			0
	end.

%%询问数据库是否可以取该名字
-spec canUseNewName(RoleID::uint64(),NewName::string()) -> boolean().
canUseNewName(_RoleID,NewName) ->
%%	case edb:dirtyReadRecord(rec_base_role,RoleID) of
%%		[] ->
%%			?ERROR_OUT("canUseNewName:~p,~ts", [RoleID, NewName]),
%%			%% 角色都不存在，不允许改名，同时打印日志
%%			cannot;
%%		_ ->
	%% 不在数据库中验证是否可以改名了，这里用prepare是防止SQL注入
	SQL1 = "SELECT COUNT(*) FROM base_role WHERE roleName = ?",
	emysql:prepare(stCanUseNewName, SQL1),
	Ret1 = emysql:execute(?GAMEDB_CONNECT_POOL, stCanUseNewName, [NewName]),
	case Ret1 of
		#result_packet{rows = [[Count]]} ->
			Count =:= 0;
		_ ->
			false
	end.
%%	end.


