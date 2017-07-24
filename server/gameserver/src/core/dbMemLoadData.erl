%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 多进程加载数据模块
%%% @end
%%% Created : 08. 十二月 2015 14:25
%%%-------------------------------------------------------------------
-module(dbMemLoadData).
-author("tiancheng").

-include("databankPrivate.hrl").

%% API
-export([
	loadLadderRankPlayerInfo/2,
	loadRoleData/1,
	loadRoleKeyInfo/5,
    getRoleKeyInfo_Role/2
]).

loadLadderRankPlayerInfo([], _Name) ->
    ok;
loadLadderRankPlayerInfo(LadderList, Name) ->
	erlang:spawn(fun() -> playerInfoInit2(LadderList, Name) end),
	ok.

loadRoleData(RoleIDList) ->
	Name = ?Prestrain_loadRoleData,
	Len = erlang:length(RoleIDList),
	Once = ?One_LoadRoleData,
	N = misc:ceil(Len / Once),
	?LOG_OUT("loadRoleData:Len=~p, Once=~p, Number=~p", [Len, Once, N]),
	F =
		fun(_, AccList) ->
			AccLen = erlang:length(AccList),
			if
				AccLen =:= 0 ->
					[];
				AccLen =< Once ->
					loadRoleData2(AccList, Name),
					[];
				true ->
					{SubList, AccList2} = lists:split(Once, AccList),
					loadRoleData2(SubList, Name),
					AccList2
			end
		end,
	misc:for(0, N, 1, RoleIDList, F),
	spawnLoadData:delLoadDataPid(Name),
	ok.
loadRoleData2(RoleIDList, Name) ->
	erlang:spawn(fun() -> loadRoleData3(RoleIDList, Name) end),
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================
playerInfoInit2(List, Name) ->
	spawnLoadData:putLoadDataPid(#recProcess{pid = self(), name = Name}),
	Len = erlang:length(List),
	PC = Len div 100,
	?LOG_OUT("[pid=~p] loadRankPlayerInfo will load role num:~p,~p",[self(),PC,Len]),
	Fun =
		fun(#rec_ladder_1v1{roleID = RoleID},N) ->
			case uidMgr:checkUID(?UID_TYPE_Role, RoleID) of
				true ->
					case PC > 0 andalso (N rem PC) =:= 0 of
						0 ->
							?LOG_OUT("[pid=~p] playerInfoInit ~p/~p =~p%",[self(), N, Len, N * 100 div Len]);
						_ ->
							skip
					end,
					%% 只要不是机器人或者怪物，就加载到内存当中来
					databankInit:getRoleDataInfo([RoleID]);
				_ ->
					skip
			end,
			N + 1
		end,
	lists:foldl(Fun, 0, List),
	?LOG_OUT("[pid=~p] loadRankPlayerInfo load role end!", [self()]),
	spawnLoadData:delLoadDataPid(self()).

loadRoleData3(RoleIDList, Name) ->
	spawnLoadData:putLoadDataPid(#recProcess{pid = self(), name = Name}),
	TotalNum = erlang:length(RoleIDList),
	Now = os:timestamp(),
	?LOG_OUT("preLoadRoleData~p,total:[~p]...",[self(),TotalNum]),
	Fun =
		fun(RoleID, {RemainNum,MaxTime,MinTime}) ->
			DiffTime = dbRoleDataCache:getRoleAllDataFromDB(RoleID),
			{RemainNum - 1, erlang:max(DiffTime,MaxTime), erlang:min(DiffTime, MinTime)}
		end,
	{_, MaxTimeRes, MinTimeRes} = lists:foldl(Fun, {TotalNum,0,9999999}, RoleIDList),
	TotalTime = timer:now_diff(os:timestamp(), Now),
	?LOG_OUT("preLoadRoleFData#~p,total:[~p], single time min/max[~p/~p]ms,total time[~p]ms done",
		[self(),TotalNum,MinTimeRes/1000,MaxTimeRes/1000, TotalTime/1000]),
	spawnLoadData:delLoadDataPid(self()).

%% 获取指定角色的关键数据
-spec getRoleKeyInfo_Role(RoleID::uint64(), {Pid::pid(), MsgID::atom()}) -> ok.
getRoleKeyInfo_Role(RoleID, {Pid, MsgID}) ->
    ?LOG_OUT("getRoleKeyInfo_Role:roleID=~p", [RoleID]),

    SQL = io_lib:format("CALL getRoleKeyInfo_Role(~p)", [RoleID]),

    %% 一大波数据
    Data = getRoleKeyInfoRet(SQL),
    psMgr:sendMsg2PS(Pid, MsgID, Data),
    ok.

loadRoleKeyInfo(OneCount, Number, TotalCount, Msg, Name) ->
    %% 分配单独的进程处理
    erlang:spawn(fun() -> roleKeyRecInfoInit(OneCount, Number, TotalCount, Msg, Name) end),
    ok.

roleKeyRecInfoInit(OneCount, Number, TotalCount, {Pid, MsgID}, Name) ->
    spawnLoadData:putLoadDataPid(#recProcess{pid = self(), name = Name}),

    %% 睡几秒，等加载进程分配完成
    timer:sleep(misc:rand(1000,5000)),

    ?LOG_OUT("[pid=~p] getRoleKeyInfo:OneCount=~p, Number=~p, TotalCount=~p", [self(), OneCount, Number, TotalCount]),

    N = Number * OneCount,
    SQL = io_lib:format("CALL getRoleKeyInfo(~p, ~p)", [N, OneCount]),

    %% 一大波数据
    Data = getRoleKeyInfoRet(SQL),

    %% 返回给GS处理数据
    ?LOG_OUT("[pid=~p] getRoleKeyInfo GetCount:~p ~p% ok",[self(), N, trunc(misc:clamp(N, 0, TotalCount) / TotalCount * 100)]),

    %% 移除自己
    spawnLoadData:delLoadDataPid(self()),

    case spawnLoadData:getLoadDataList(Name) of
        [] ->
            %% 加载完毕
            psMgr:sendMsg2PS(Pid, MsgID, {true, Data}),
            ok;
        _ ->
            %% 继续等待
            psMgr:sendMsg2PS(Pid, MsgID, {false, Data}),
            skip
    end,
    ok.

getRoleKeyInfoRet(SQL) ->
    Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),

    %% #查询基础表
    {RoleInfo, LeftResult1} = mysql:nextResult(Ret),
    RoleInfoList = emysql_util:as_record(RoleInfo, recRoleKeyInfo, record_info(fields, recRoleKeyInfo)),

    %% #查询金钱
    {RoleCoinInfo, LeftResult2} = mysql:nextResult(LeftResult1),
    RoleCoinInfoList = emysql_util:as_record(RoleCoinInfo, rec_player_coin, record_info(fields, rec_player_coin)),

    %% #查询公共属性
    {PropInfo, LeftResult3} = mysql:nextResult(LeftResult2),
    PropInfoList = emysql_util:as_record(PropInfo, rec_player_prop, record_info(fields, rec_player_prop)),

    %% #查询宠物
    {PetInfo, LeftResult4} = mysql:nextResult(LeftResult3),
    PetInfoList = emysql_util:as_record(PetInfo, rec_pet_info, record_info(fields, rec_pet_info)),

    %% #查询远征宠物PVP积分
    {PetManorInfo, LeftResult5} = mysql:nextResult(LeftResult4),
    PetManorInfoList = emysql_util:as_record(PetManorInfo, rec_pet_manor_battle, record_info(fields, rec_pet_manor_battle)),

    %% #查询勇者试炼数据
    {Warrior, LeftResult6} = mysql:nextResult(LeftResult5),
    WarriorList = emysql_util:as_record(Warrior, rec_warrior_trial, record_info(fields, rec_warrior_trial)),

    %% #查询个人信息扩展
    {Identity, _LeftResult7} = mysql:nextResult(LeftResult6),
	IdentityList = emysql_util:as_record(Identity, recRoleKeyInfoIdentity, record_info(fields, recRoleKeyInfoIdentity)),

    {RoleInfoList, RoleCoinInfoList, PropInfoList, PetInfoList, PetManorInfoList, WarriorList, IdentityList}.