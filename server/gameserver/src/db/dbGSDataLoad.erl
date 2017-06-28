%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%% GS数据统一加载模块
%%% @end
%%% Created : 22. 九月 2016 15:41
%%%-------------------------------------------------------------------
-module(dbGSDataLoad).
-author("tiancheng").

-include("dbsInc.hrl").

%% API
-export([
    initGSLoadPrepare/0
]).

-export([
    loadUserAccount/1,
    loadRoleName/0,
    loadRoleData/1,
    loadIdentity/0,
    loadFriend2/0,
    loadDaily2/0,
    loadMarriage/0,
	loadPetTerritory/0
]).

-export([
    loadRoleKeyInfo/2,
    loadLadder1v1Info/1
]).

-export([
	getRoleIDList/2
]).

initGSLoadPrepare() ->
    ok.

loadLadder1v1Info(PidFromGS) ->
    databankInit:ladder1V1Init(PidFromGS).

loadRoleKeyInfo(PidFromGS, 0) ->
    SQL = "CALL getRoleKeyInfoCount()",
    OneCount = ?One_LoadRoleKeyInfo,

    %% 查询角色个数
    RetCount = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
    {RoleKeyCount, _LeftResult} = mysql:nextResult(RetCount),
    Count = mysql:getFieldValue(1, mysql:firstRow(RoleKeyCount)),
    %% 查询总次数
    Times = case Count =< OneCount of
                true -> 0;
                false -> Count div OneCount
            end,
    Times2 = Times + 1,
	Name = ?Prestrain_roleKeyRecInfoInit,
    case Count > 0 of
        true ->
            %% 多查询一次
            TimesList = lists:seq(0, Times2),
            ?LOG_OUT("getRoleKeyInfo TotalCount:~p",[Count]),
			[dbMemLoadData:loadRoleKeyInfo(OneCount, Number, Count, {PidFromGS, loadRoleKeyInfoAck}, Name) || Number <- TimesList];
        _ ->
            ?WARN_OUT("getRoleKeyInfo TotalCount:~p",[Count]),
            psMgr:sendMsg2PS(PidFromGS, loadRoleKeyInfoAck, {true, []}),
            skip
    end,
	spawnLoadData:delLoadDataPid(Name),
    ok;
loadRoleKeyInfo(PidFromGS, RoleID) ->
    %% 加载指定角色
    %% 直接恢复到角色关键信息内存表中
    dbMemLoadData:getRoleKeyInfo_Role(RoleID, {PidFromGS, loadRoleKeyInfoAck}),
    ok.

%%加载最近几天的账号和角色list
loadUserAccount(PidFromGS) ->
    DayNum = config:getInt("preLoadDayNumber", 3),
	PreNum = config:getInt("preLoadRoleNumber", 2000),

    SQL = io_lib:format("SELECT accountID FROM account WHERE lastloginTime > DATE_SUB(NOW(),INTERVAL ~p DAY)
    ORDER BY lastLogoutTime DESC LIMIT ~p", [DayNum, PreNum]),

    Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
    {R, _} = mysql:nextResult(Ret),
    List = emysql:as_proplist(R),
    Len = erlang:length(List),
    ?LOG_OUT("load lately ~p days account:~p...", [DayNum, Len]),
    LR = fastLoadAccountRoleList(List),
	?LOG_OUT("load account:~p end,real:~p", [Len, erlang:length(LR)]),
	RoleIDList = getRoleIDList(LR, []),
	?LOG_OUT("need load player number:~p", [erlang:length(RoleIDList)]),
	case erlang:is_pid(PidFromGS) of
		true ->
			erlang:spawn(fun() -> loadPlayerDataFirstProcess(PidFromGS, RoleIDList) end);
		_ ->
			?ERROR_OUT("this is a test!:~p", [PidFromGS])
	end,
	?LOG_OUT("load lately ~p days account:~p done", [DayNum, Len]),
	LR.

loadPlayerDataFirstProcess(PidFromGS, RoleIDList) ->
	?LOG_OUT("loadPlayerDataFirstProcess:~p", [erlang:length(RoleIDList)]),
	%% 加载玩家数据
	Once1 = ?One_LoadRoleData,
	LenAid = length(RoleIDList),
	Once = case (LenAid / Once1) > 50 of
			   true ->
				   trunc(LenAid / 50);
			   _ ->
				   Once1
		   end,
	L1 = misc:ssplit_all(Once, RoleIDList),
	F =
		fun(RoleID, Acc) ->
			SQL = io_lib:format("SELECT * FROM base_role br WHERE br.roleID = ~p;", [RoleID]),
			case getQueryResultList(SQL, ?MakeArg(rec_base_role)) of
				[#rec_base_role{} = RoleInfo] ->
					[RoleInfo | Acc];
				Error ->
					?ERROR_OUT("not found player:~p,~p", [RoleID,Error]),
					Acc
			end
		end,
	{BaseRoleList, LR2} = task_pool:on_sync_wait(initSvrLoadAccPlayerDataList, L1, F, infinity),
	case LR2 of
		[] ->
			skip;
		_ ->
			?ERROR_OUT("~p",[LR2])
	end,

	%%预加载必须的离线数据
	SQL2 = "SELECT br.* FROM base_role br,offline_data od WHERE br.roleID = od.roleID AND od.isLoad = 1;",
	BaseRoleList2 = getQueryResultList(SQL2, ?MakeArg(rec_base_role)),
	?LOG_OUT("load player:~p, offline_data:~p", [erlang:length(BaseRoleList), erlang:length(BaseRoleList2)]),

	RoleIDList2 = lists:foldl(
		fun(#rec_base_role{roleID = RID}, Acc) ->
			case lists:member(RID, Acc) of
				false -> [RID | Acc];
				_ -> Acc
			end
		end, RoleIDList, BaseRoleList2),

	%% 分配去加载模型
	erlang:spawn(fun() -> databankInit:getRoleDataInfo(RoleIDList2) end),

	doloadPlayerData(PidFromGS, BaseRoleList, BaseRoleList2, RoleIDList2),
	ok.

doloadPlayerData(PidFromGS,L1,L2, RoleIDList)->
	N1 = length(L1),
	N2 = length(L2),
	L4 =
		case N1 > N2 of
			true ->
				L30 = lists:subtract(L1, L2),
				lists:append(L30, L2);
			_->
				L31 = lists:subtract(L2, L1),
				lists:append(L31, L1)
		end,

	%% 返回base_role给GS
	?LOG_OUT("try to preload RoleData Num[~p]",[erlang:length(L4)]),
	psMgr:sendMsg2PS(PidFromGS, loadBaseRoleAck, L4),

	%% 加载角色详细数据
	?LOG_OUT("load role detail data..."),
	fastLoadCommonData(PidFromGS, RoleIDList),

	%% 加载角色的内存数据库数据
	?LOG_OUT("load role mnesia data..."),
	dbMemLoadData:loadRoleData(RoleIDList),

	%% 加载玩家变量
	?LOG_OUT("load role Variant data..."),
	dbRoleDataCache:loadVariant0(),
	ok.

getRoleIDList([], RetList) -> RetList;
getRoleIDList(#recRoleList{roleListInfo = Infos}, RetList) ->
	IDList = [RoleID || #recRoleListInfo{roleID = RoleID} <- Infos],
	IDList ++ RetList;
getRoleIDList([#recRoleList{} = Info | List], RetList) ->
	RetList2 = getRoleIDList(Info, RetList),
	getRoleIDList(List, RetList2).

fastLoadAccountRoleList(AidList) ->
    Once1 = ?One_LoadRoleData,
    LenAid = length(AidList),
    Once = case LenAid / Once1 > 50 of
               true ->
                   trunc(LenAid / 50);
               _ ->
                   Once1
           end,
    L1 = misc:ssplit_all(Once, AidList),
	F =
		fun([{_, AID}], Acc) ->
			[dbGSLoad:getRoleList(AID) | Acc]
		end,
	{LR1, LR2} = task_pool:on_sync_wait(initSvrLoadAccRoleList, L1, F, infinity),
    case LR2 of
        [] ->
            skip;
        _ ->
            ?ERROR_OUT("~p",[LR2])
    end,
	LR1.

fastLoadCommonData(PidFromGS, RoleIDList) ->
    %% 加载角色详细数据
%%    Once = ?One_LoadRoleData ,
    Len = erlang:length(RoleIDList),
    ?LOG_OUT("fastLoadCommonData(~p)...", [Len]),

    Once1 = ?One_LoadRoleData,
    Once = case Len / Once1 > 50 of
               true ->
                   trunc(Len / 50);
               _ ->
                   Once1
           end,

    L1 = misc:ssplit_all(Once, RoleIDList),

	F =
		fun(RoleID, Acc) ->
			[loadRoleData(RoleID) | Acc]
		end,
	{LL,RL2} = task_pool:on_sync_wait(initRLSvrComData, L1, F, infinity),
	case RL2 of
		[] -> skip;
		_ -> ?ERROR_OUT("~p", [RL2])
	end,

	?LOG_OUT("fastLoadCommonData(~p) done", [Len]),
    psMgr:sendMsg2PS(PidFromGS, loadPlayerDataAck, LL),
    ok.

%% 加载所有roleID对应的角色名
loadRoleName() ->
    L0 = doLoadRoleName0(),
    L1 = doLoadRoleName1(),
    lists:append(L1, L0).

doLoadRoleName0()->
    SQL = "SELECT br.roleID,br.roleName FROM base_role br",
    modifyData(getQueryResultList(SQL, ?MakeArg(rec_RoleName))).

doLoadRoleName1()->
    SQL = "SELECT br.roleID,br.roleName FROM base_role_bak br",
    modifyData(getQueryResultList(SQL, ?MakeArg(rec_RoleName))).

loadRoleData(RoleID) ->
    DataRec0 = #rec_playerdata{roleID = RoleID},
    %% 加载公共属性
    DataRec1 = DataRec0#rec_playerdata{rec_player_prop = getPlayerProp(RoleID)},
    %% 加载接受任务列表
    DataRec2 = DataRec1#rec_playerdata{rec_task_accepted = getTaskAccept(RoleID)},
    %% 加载完成任务列表
    DataRec3 = DataRec2#rec_playerdata{rec_task_submitted = getTaskSubmit(RoleID)},
	%% 已经领取的万用key
	DataRec4 = DataRec3#rec_playerdata{activeCode4Many = dbGSLoad:getActiveCodeByRoleID(RoleID)},
	DataRec4.

getPlayerProp(RoleID) ->
    SQL = io_lib:format("select * from player_prop where roleID = ~p",[RoleID]),
    modifyData(getQueryResultList(SQL, ?MakeArg(rec_player_prop))).

getTaskAccept(RoleID) ->
    SQL = io_lib:format("select * from task where roleID=~p",[RoleID]),
    getQueryResultList(SQL, ?MakeArg(rec_task)).

getTaskSubmit(RoleID) ->
    SQL = io_lib:format("select * from task_submitted where roleID=~p",[RoleID]),
    getQueryResultList(SQL, ?MakeArg(rec_task_submitted)).

getQueryResultList(SQL, {TableRecord,RecInfo}) ->
    Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
%%    ?DEBUG_OUT("getQueryResultList:~p,~ts,~p", [TableRecord,SQL,Ret]),
    emysql_util:as_record(Ret, TableRecord, RecInfo).

%% 修正数据
modifyData(Data) ->
    case erlang:is_list(Data) of
        true ->
            modifyDataHandle(Data, []);
        _ ->
            [Data2] = modifyDataHandle(Data, []),
            Data2
    end.

modifyDataHandle(Rec = #rec_RoleName{roleName = Name}, RetL) ->
    [Rec#rec_RoleName{roleName = erlang:binary_to_list(Name)} | RetL];
modifyDataHandle(Rec = #rec_player_prop{propValue = V}, RetL) ->
    [Rec#rec_player_prop{propValue = erlang:binary_to_list(V)} | RetL];
modifyDataHandle([], RetL) ->
    RetL;
modifyDataHandle([Record|L], RetL) ->
    RetL2 = modifyDataHandle(Record, RetL),
    modifyDataHandle(L, RetL2);
modifyDataHandle(Record, RetL) ->
    [Record | RetL].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 身份证系统 begin

%% 加载身份证系统相关信息
%% 1.身份证信息表需要全部加载
%% 2.相册数据主表需要全部加载
%% 3.相册数据副表仅需要加载键值（md5）
-spec loadIdentity() ->
    {
        [#rec_player_identity{}, ...],
        [#rec_pic_data_main{}, ...],
        [#rec_pic_data_sub{}, ...]
    }.
loadIdentity() ->
    List_rec_player_identity = loadIdentity_identity(0),
    List_rec_pic_data_main = loadIdentity_picMain(0),
    List_rec_pic_data_sub = loadIdentity_picSub(0),
    {List_rec_player_identity, List_rec_pic_data_main, List_rec_pic_data_sub}.
-spec loadIdentity_identity(Index::uint()) -> list().
loadIdentity_identity(Index) ->
    SQL = io_lib:format("SELECT * FROM player_identity order by roleID LIMIT ~p, ~p", [Index * 100000, 100000]),
    DataList = getQueryResultList(SQL, ?MakeArg(rec_player_identity)),
    case DataList of
        [] ->
            [];
        _ ->
            DataList_ = loadIdentity_identity(Index + 1),
            DataList ++ DataList_
    end.
-spec loadIdentity_picMain(Index::uint()) -> list().
loadIdentity_picMain(Index) ->
    SQL = io_lib:format("SELECT * FROM pic_data_main order by md5 LIMIT ~p, ~p", [Index * 1000, 1000]),
    DataList = getQueryResultList(SQL, ?MakeArg(rec_pic_data_main)),
    case DataList of
        [] ->
            [];
        _ ->
            DataList_ = loadIdentity_picMain(Index + 1),
            DataList ++ DataList_
    end.
-spec loadIdentity_picSub(Index::uint()) -> list().
loadIdentity_picSub(Index) ->
    %% 加载副表时只加载MD5、是否过审的状态、引用计数，其它字段注意在写入ETS的时候初始化
    SQL = io_lib:format("SELECT `md5`, `state`, `count` FROM pic_data_sub LIMIT ~p, ~p", [Index * 100000, 100000]),
    DataList = getQueryResultList(SQL, ?MakeArg(rec_pic_data_sub)),
    case DataList of
        [] ->
            [];
        _ ->
            DataList_ = loadIdentity_picSub(Index + 1),
            DataList ++ DataList_
    end.

%% 身份证系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 新版好友系统 begin

%% 加载全服好友信息
-spec loadFriend2() ->
    {
        [#rec_friend2_relation{}, ...],
        [#rec_friend2_interaction{}, ...]
    }.
loadFriend2() ->
    List_rec_friend2_relation = loadFriend2_relation(0),
    List_rec_friend2_interaction = loadFriend2_interaction(0),
    {List_rec_friend2_relation, List_rec_friend2_interaction}.
-spec loadFriend2_relation(Index::uint()) -> list().
loadFriend2_relation(Index) ->
    SQL = io_lib:format("SELECT * FROM friend2_relation order by roleID, targetRoleID LIMIT ~p, ~p", [Index * 100000, 100000]),
    DataList = getQueryResultList(SQL, ?MakeArg(rec_friend2_relation)),
    case DataList of
        [] ->
            [];
        _ ->
            DataList_ = loadFriend2_relation(Index + 1),
            DataList ++ DataList_
    end.
-spec loadFriend2_interaction(Index::uint()) -> list().
loadFriend2_interaction(Index) ->
    SQL = io_lib:format("SELECT * FROM friend2_interaction order by roleID, targetRoleID LIMIT ~p, ~p", [Index * 100000, 100000]),
    DataList = getQueryResultList(SQL, ?MakeArg(rec_friend2_interaction)),
    case DataList of
        [] ->
            [];
        _ ->
            DataList_ = loadFriend2_interaction(Index + 1),
            DataList ++ DataList_
    end.

%% 新版好友系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 双角色相关的每日计数 begin

-spec loadDaily2() -> [#rec_player_daily2{}, ...].
loadDaily2() ->
    loadDaily2(0).
-spec loadDaily2(Index::uint()) -> [#rec_player_daily2{}, ...].
loadDaily2(Index) ->
    SQL = io_lib:format("SELECT * FROM player_daily2  order by roleID_A, roleID_B, daily2Type LIMIT ~p, ~p", [Index * 100000, 100000]),
    DataList = getQueryResultList(SQL, ?MakeArg(rec_player_daily2)),
    case DataList of
        [] ->
            [];
        _ ->
            DataList_ = loadDaily2(Index + 1),
            DataList ++ DataList_
    end.

%% 双角色相关的每日计数 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 姻缘系统 begin

-spec loadMarriage() -> {[#rec_marriage{}, ...], [#rec_marriage_skill{}, ...]}.
loadMarriage() ->
    {loadMarriageR(0), loadMarriageS(0)}.
-spec loadMarriageR(Index::uint()) -> [#rec_marriage{}, ...].
loadMarriageR(Index) ->
    SQL = io_lib:format("SELECT * FROM marriage order by roleID LIMIT ~p, ~p", [Index * 100000, 100000]),
    DataList = getQueryResultList(SQL, ?MakeArg(rec_marriage)),
    case DataList of
        [] ->
            [];
        _ ->
            DataList_ = loadMarriageR(Index + 1),
            DataList ++ DataList_
    end.
-spec loadMarriageS(Index::uint()) -> [#rec_marriage_skill{}, ...].
loadMarriageS(Index) ->
    SQL = io_lib:format("SELECT * FROM marriage_skill order by roleID, slotID LIMIT ~p, ~p", [Index * 100000, 100000]),
    DataList = getQueryResultList(SQL, ?MakeArg(rec_marriage_skill)),
    case DataList of
        [] ->
            [];
        _ ->
            DataList_ = loadMarriageS(Index + 1),
            DataList ++ DataList_
    end.

%% 姻缘系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 新版骑宠领地 begin

-spec loadPetTerritory() ->
	{
		[#rec_player_territory{}, ...],
		[#rec_player_territory_pet{}, ...],
		[#rec_player_territory_history_a{}, ...],
		[#rec_player_territory_history_d{}, ...]
	}.
loadPetTerritory() ->
    {
		loadPetTerritoryPlayer(0),
		loadPetTerritoryPet(0),
		loadPetTerritoryHistoryA(0),
		loadPetTerritoryHistoryD(0)
	}.

-spec loadPetTerritoryPlayer(Index::uint()) -> [#rec_player_territory{}, ...].
loadPetTerritoryPlayer(Index) ->
    SQL = io_lib:format("SELECT * FROM player_territory order by roleID, territoryID LIMIT ~p, ~p", [Index * 100000, 100000]),
    DataList = getQueryResultList(SQL, ?MakeArg(rec_player_territory)),
    case DataList of
        [] ->
            [];
        _ ->
            DataList_ = loadPetTerritoryPlayer(Index + 1),
            DataList ++ DataList_
    end.

-spec loadPetTerritoryPet(Index::uint()) -> [#rec_player_territory_pet{}, ...].
loadPetTerritoryPet(Index) ->
    SQL = io_lib:format("SELECT * FROM player_territory_pet order by roleID, petID LIMIT ~p, ~p", [Index * 100000, 100000]),
    DataList = getQueryResultList(SQL, ?MakeArg(rec_player_territory_pet)),
    case DataList of
        [] ->
            [];
        _ ->
            DataList_ = loadPetTerritoryPet(Index + 1),
            DataList ++ DataList_
    end.

-spec loadPetTerritoryHistoryA(Index::uint()) -> [#rec_player_territory_history_a{}, ...].
loadPetTerritoryHistoryA(Index) ->
    SQL = io_lib:format("SELECT * FROM player_territory_history_a order by roleID, timeEvent, territoryID LIMIT ~p, ~p", [Index * 100000, 100000]),
    DataList = getQueryResultList(SQL, ?MakeArg(rec_player_territory_history_a)),
    case DataList of
        [] ->
            [];
        _ ->
            DataList_ = loadPetTerritoryHistoryA(Index + 1),
            DataList ++ DataList_
    end.

-spec loadPetTerritoryHistoryD(Index::uint()) -> [#rec_player_territory_history_d{}, ...].
loadPetTerritoryHistoryD(Index) ->
    SQL = io_lib:format("SELECT * FROM player_territory_history_d order by roleID, timeEvent, territoryID LIMIT ~p, ~p", [Index * 100000, 100000]),
    DataList = getQueryResultList(SQL, ?MakeArg(rec_player_territory_history_d)),
    case DataList of
        [] ->
            [];
        _ ->
            DataList_ = loadPetTerritoryHistoryD(Index + 1),
            DataList ++ DataList_
    end.

%% 新版骑宠领地 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
