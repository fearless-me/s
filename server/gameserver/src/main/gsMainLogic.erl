%%%main进程的逻辑处理

-module(gsMainLogic).

-include("logger.hrl").
-include("db.hrl").
-include("mysql.hrl").
-include("mainPrivate.hrl").
-include("netmsgRecords.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initMain/0,
	getServerID/0,
	releaseMain/0,
	getADBID4GS/0,
	getDBID4GS/0,
	getAreaName/0,
	resetDropInfo/0,
	initDropInfo/0,
	saveDropInfo/0
]).

-export([
	setEnterRiftTime/2,
	getEnterRiftTime/1
]).

-spec initMain() -> ok.
initMain() ->
	ok.

-spec releaseMain() -> ok.
releaseMain() ->
	codeMgr:release(),
	edb:release(),
	ok.

%返回服务器ID，只能为1
-spec getServerID() -> uint().
getServerID() -> core:getServerID().

%% 获取大区ID
-spec getADBID4GS() -> undefined | integer().
getADBID4GS() ->
	globalSetup:getADBID().

%% 获取gs所在 大区下单服ID
-spec getDBID4GS() -> undefined | integer().
getDBID4GS() ->
	globalSetup:getDBID().

%%获取大区的名字
getAreaName() ->
	globalSetup:getServerName().

%% ====================================================================
%% Internal functions
%% ====================================================================
%% 设置本次进入时空裂痕时间
-spec setEnterRiftTime(RoleID, Time) -> ok when
	RoleID::uint(), Time::uint() | undefined.
setEnterRiftTime(RoleID, Time) ->
	case ets:member(?RiftEts, RoleID) of
		true ->
			myEts:updateEts(?RiftEts, RoleID, {2, Time});
		_ ->
			ets:insert(?RiftEts, {RoleID, Time})
	end.

%% 获取上次进入时空裂痕时间
-spec getEnterRiftTime(RoleID::uint()) -> uint().
getEnterRiftTime(RoleID) ->
	case myEts:lookUpEts(?RiftEts, RoleID) of
		[{_, Time}] ->
			Time;
		_ ->
			0
	end.

%% %%初始化掉落信息
-spec initDropInfo() -> ok.
initDropInfo() ->
	L = edb:readAllRecord(rec_server_drop),
	initDropInfo(L).
initDropInfo([]) ->
	ok;
initDropInfo([#rec_server_drop{id = ID, time = Time} = Info | L]) ->
	NowTime = time:getSyncTime1970FromDBS(),
	#drop_controlCfg{
		 trigger_cycle = Cycle
	} = getCfg:getCfgPStack(cfg_drop_control, ID),
	NewInfo = 
		case Cycle of
			1 -> %%每日
				case core:timeIsOnDay(Time) of
					false ->
						Info#rec_server_drop{num = 0, time = NowTime};
					_ ->
						Info
				end;
			2 -> %%每周
				case core:timeIsOnWeek(Time) of
					false ->
						Info#rec_server_drop{num = 0, time = NowTime};
					_ ->
						Info
				end;
			3 -> %%每月
				case core:timeIsOnMonth(Time) of
					false ->
						Info#rec_server_drop{num = 0, time = NowTime};
					_ ->
						Info
				end;
			4 -> %% 每小时
				case core:timeIsOnHour(Time) of
					false ->
						Info#rec_server_drop{num = 0, time = NowTime};
					_ ->
						Info
				end
		end,
	edb:checkAndSave(rec_server_drop, ID, NewInfo, new_rec_server_drop, update_rec_server_drop),
	ets:insert(?TABLE_DROP, NewInfo),
	initDropInfo(L).

%%重置掉落
-spec resetDropInfo() -> ok.
resetDropInfo() ->
	resetDropInfo(ets:tab2list(?TABLE_DROP)).

resetDropInfo([]) ->
	ok;
resetDropInfo([#rec_server_drop{id = ID} = Info | L]) ->
	NowTime = time:getSyncTime1970FromDBS(),
	{{Year, Month, Day},{_, _, _}} = time:convertSec2DateTime(NowTime),
	#drop_controlCfg{
			 trigger_cycle = Cycle
			} = getCfg:getCfgPStack(cfg_drop_control, ID),
	NewInfo = 
		case Cycle of
			1 -> %%每日
				Info#rec_server_drop{num = 0, time = NowTime};
			2 -> %%每周
				case calendar:day_of_the_week({Year, Month, Day}) of
					1 ->
						Info#rec_server_drop{num = 0, time = NowTime};
					_ ->
						Info
				end;
			3 -> %%每月
				case Day of
					1 ->
						Info#rec_server_drop{num = 0, time = NowTime};
					_ ->
						Info
				end;
			4 -> %%每小时
				Info#rec_server_drop{num = 0, time = NowTime}
		end,
	edb:checkAndSave(rec_server_drop, ID, NewInfo, new_rec_server_drop, update_rec_server_drop),
	ets:insert(?TABLE_DROP, NewInfo),
	resetDropInfo(L).


%%保存掉落信息
-spec saveDropInfo() -> ok.
saveDropInfo() ->
	saveDropInfo(ets:tab2list(?TABLE_DROP)).
saveDropInfo([]) ->
	ok;
saveDropInfo([#rec_server_drop{id = ID} = Info | L]) ->
	edb:checkAndSave(rec_server_drop, ID, Info, new_rec_server_drop, update_rec_server_drop),
	saveDropInfo(L).
