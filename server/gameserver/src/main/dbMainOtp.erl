%%%主逻辑进程，协调与管理其它逻辑进程

-module(dbMainOtp).
-author(zhongyuanwei).

-behaviour(myGenServer).

-include("mainPrivate.hrl").
-include("dbsInc.hrl").

%%同步到数据库的时间间隔，5分钟
%% 加载数据心跳
-ifdef(RELEASE).
-define(SyncToDBInterval,300000).
-define(LoadDataInterval, 60000).
-else.
-define(SyncToDBInterval,10000).
-define(LoadDataInterval, 10000).
-endif.

%% 关服流程定义
-define(Stop_None, 0).
-define(Stop_GS, 1).
-define(Stop_DBS, 2).
-define(Stop_OK, 3).

%% 停服超时时间
-define(Stop_TimeOut, 10000).

-define(SECONDS_PER_DAY, 86400).
-define(DAYS_FROM_0_TO_1970, 719528).

-record(state, {}).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3,handle_exception/3]).

start_link() ->
	myGenServer:start_link({local,?PsNameDBMain},?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

init([]) ->
	?LOG_OUT("~p init", [?MODULE]),
	setCacheDataLoaded(false),

	%% 公共定义ETS
	globalSetup:new(),

	ets:new(recProcess, [public, named_table, {keypos, #recProcess.pid}]),
	case core:isCross() of
		false ->
			spawnLoadData:putLoadDataPid(#recProcess{pid = ?Prestrain_loadRankPlayerInfo, name = ?Prestrain_loadRankPlayerInfo}),
			spawnLoadData:putLoadDataPid(#recProcess{pid = ?Prestrain_loadRoleData, name = ?Prestrain_loadRoleData}),
			spawnLoadData:putLoadDataPid(#recProcess{pid = ?Prestrain_roleKeyRecInfoInit, name = ?Prestrain_roleKeyRecInfoInit}),
			spawnLoadData:putLoadDataPid(#recProcess{pid = ?Prestrain_ladder1V1Init3, name = ?Prestrain_ladder1V1Init3});
		_ ->
			skip
	end,

	%% {RoleID,Value}，已经加载过的模形RoleID表
	ets:new(recPlayerObjectID, [public, set, named_table, {keypos, #recKeyValue.key}]),

	initStopServerStep(),

	?LOG_OUT("~p init OK",[?MODULE]),
	{ok, #state{}}.

handle_call(stop_DBServer_getStep, _From, State) ->
	Step = getStopServerStep(),
	?LOG_OUT("handle_call stop_DBServer_getStep:~p", [Step]),
	{reply, Step, State};

handle_call(_Request, _From, State) ->
    {noreply, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info({stop_DBServer_getStep, From, Data}, State) ->
	Step = getStopServerStep(),
	?LOG_OUT("handle_info stop_DBServer_getStep:~p", [Step]),

	%% 返回给停服进程
	From ! {stop_DBServer_getStep_Ack, Step, Data},
	{noreply, State};

%% 收到停服消息
handle_info({stop_server_Msg_Import, _Pid, 0}, State) ->
	case getStopServerStep() of
		?Stop_None ->
			?WARN_OUT("stop_server_Msg_Import ..."),

			%% 关服初始化
			initStopServerStep(),

			%% 关服步骤，1ls,2gs,3cs,4dbs,5ok
			%% 开始关闭ls
			addStopServerStep(),
			ok;
		Step ->
			?ERROR_OUT("stop_server_Msg_Import ing:~p", [Step])
	end,
	{noreply, State};

handle_info({stop_server_gs_ok, _Pid, _PIDGS}, State) ->
	?WARN_OUT("stop_server_gs_ok"),
	addStopServerStep(),
	{noreply, State};

handle_info({checkSyncToDBIsAlive, _Pid, _}, State) ->
	case getCacheDataLoaded() of
		true ->
			NowTime = time:getUTCNowSec1970(),
			LastTime = getSaveToDBLastTime(),
			case LastTime > 0 andalso ((NowTime - LastTime) >= ((?SyncToDBInterval div 1000) * 2)) of
				true ->
					?LOG_OUT("checkSyncToDBIsAlive:~p,~p", [NowTime, LastTime]),

					%% 当前时间
					setSaveToDBLastTime(),

					%% 重启心跳
					timer:send_after(?SyncToDBInterval,self(),syncToDB);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	{noreply, State};

handle_info(syncToDB,State) ->
	%% 当前时间
	setSaveToDBLastTime(),

	%% 保存数据
	?LOG_OUT("syncToDB start..."),
	case getCacheDataLoaded() of
		true ->
			dbMemCache:syncToDB(),
			?LOG_OUT("syncToDB success!!!");
		_ ->
			?WARN_OUT("waitint cached data initial")
	end,

	%% 心跳
	timer:send_after(?SyncToDBInterval,self(),syncToDB),
	{noreply,State};

handle_info({initCache,_Pid,{}},State) ->
	%% 检验并设置最近开服时间
	case checkAndSetRecentlytime() of
		false ->
			gameServer:stop_real();
		_ ->
			skip
	end,

	initCache(),

	%% 等待加载数据
	erlang:send_after(?LoadDataInterval, self(), tickLoadDataInterval),

	%% 告诉GS，DBS准备好了，你可以来要数据了
	syncDBData(?DBSLoadData_First),
	{noreply,State};

handle_info(tickLoadDataInterval, State) ->
	%% 检查数据是否加载完毕
	List = ets:tab2list(recProcess),
	case List of
		[] ->
			setCacheDataLoaded(true),
			?LOG_OUT("DBS Send syncDBData"),

			%% DBS所有数据处理完毕
			syncDBData(?DBSLoadData_AllEnd),

			timer:send_after(?SyncToDBInterval,self(),syncToDB),
			ok;
		_ ->
			?DEBUG_OUT("tickLoadDataInterval:~w", [List]),

			%% 继续等待
			erlang:send_after(?LoadDataInterval, self(), tickLoadDataInterval)
	end,
	{noreply,State};

handle_info(Info,State) ->
	?ERROR_OUT("unhandle info:[~p] in [~p] [~p,~p]",[Info,node(),?MODULE,self()]),
	{noreply,State}.

terminate(_Reason, _State) ->
	dbMemCache:syncToDB(),
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%% ====================================================================
%% Internal functions
%% ====================================================================
syncDBData(Param) ->
	?LOG_OUT("SyncDBData To GS:[~p]", [Param]),
	case Param of
		?DBSLoadData_First ->
			%% 告诉GS进程树，DBData加载完了
			psMgr:sendMsg2PS(treeGSOtp, dbDataLoadSuccess, Param);
		_ ->
			%% 后续加载流程
			psMgr:sendMsg2PS(?PsNameDBS, syncDBData, Param)
	end,
	ok.

-spec initCache() -> ok.
initCache() ->
	?LOG_OUT("initCache start"),
	edb:start(),

	%% 基础模块初始化
	ok = uidMgr:initMgr(),
	true = codeMgr:init(),
	ok = variant:initVariant(),

	dbMemCache:initDBTable(),
	?LOG_OUT("initCache end"),
	ok.

setSaveToDBLastTime() ->
	put('SaveToDBLastTime', time:getUTCNowSec1970()).

getSaveToDBLastTime() ->
	case get('SaveToDBLastTime') of
		undefined ->
			setSaveToDBLastTime(),
			0;
		T -> T
	end.

%% 关服步骤
addStopServerStep() ->
	V = getStopServerStep() + 1,
	put('StopServerStep', V),

	?WARN_OUT("addStopServerStep:~p", [V]),
	%% 通知节点
	case V of
		?Stop_GS ->
			psMgr:sendMsg2PS(?PsNameDBS, stop_server_gs, self()),
			ok;
		?Stop_DBS ->
			%% 马上存一次数据
			?WARN_OUT("stop server force save all data"),
			dbMemCache:syncToDB(),

			recordEndServerTime(),
			?WARN_OUT("stop server force save all data ok"),
			?WARN_OUT("^^^^^ stop server ok, now can 'kill'  when server is not auto shutdown ^^^^"),
			%% 进入最后一个流程
			addStopServerStep();
		_ ->
			ok
	end.

initStopServerStep() ->
	put('StopServerStep', 0).

getStopServerStep() ->
	case get('StopServerStep') of
		undefined -> 0;
		V -> V
	end.


setCacheDataLoaded(B)->
	put('CachedataLoaded', B).

getCacheDataLoaded()->
	case get('CachedataLoaded') of
		undefined->
			true;
		B ->
			B
	end.

%% 检验并设置最近启服时间
-spec checkAndSetRecentlytime() -> boolean().
checkAndSetRecentlytime() ->
	#rec_serverinfo{starttime = LastStartTime, endtime = LastEndTime} = getServerInfo(),
	case LastEndTime =:= 0 of
		true -> ?ERROR_OUT("Last abnormal end server!");
		_ -> skip
	end,

	NowTime = time2:getTimestampSec(),

	getDBInfo(),

	globalSetup:insert(?GSKey_RecentServerStartTime, NowTime),
	globalSetup:insert(?GSKey_LastServerEndTime, LastEndTime),

	case NowTime >= LastStartTime andalso NowTime >= LastEndTime of
		true ->
			%% 插入新记录
			?WARN_OUT("NowTime:~p,LastStartTime:~p,LastEndTime:~p,isok:~p", [NowTime, LastStartTime, LastEndTime, true]),
			SQL = io_lib:format("call insertAndGetServerInfo(~p);", [NowTime]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
			dbMemCache:logResult("INSERT and SELECT serverinfo", Ret, SQL),
			{Result,_LeftResult} = mysql:nextResult(Ret),
			[#rec_serverinfo{id = ID}] = emysql_util:as_record(Result, rec_serverinfo, record_info(fields, rec_serverinfo)),

			globalSetup:insert(?GSKey_ServerStartIndex, ID),
			?WARN_OUT("recent start server time=~p, id=~p", [NowTime, ID]),

			%% 校验最大的UID类型(考虑到合服的情况很不好判断，不校验了)
			true;
		_ ->
			?ERROR_OUT("the server time is not correct,now[~p/~ts], laststartime[~p/~ts],lastenttime(~p/~ts)",
				[NowTime,time2:secToMysqlTimeStr(NowTime  + ?One_Day_Second * ?DAYS_FROM_0_TO_1970),
					LastStartTime, time2:convertSecToTimeStr(LastStartTime + ?One_Day_Second * ?DAYS_FROM_0_TO_1970),
					LastEndTime,time2:convertSecToTimeStr(LastEndTime + ?One_Day_Second * ?DAYS_FROM_0_TO_1970)]),
			timer:sleep(5000),
			false
	end.

%% 获取DBINFO
-spec getServerInfo() -> #rec_serverinfo{}.
getServerInfo() ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, "SELECT * FROM serverinfo s ORDER BY s.id DESC LIMIT 1"),
	{Result,_LeftResult} = mysql:nextResult(Ret),
	Info =
		case emysql_util:as_record(Result, rec_serverinfo, record_info(fields, rec_serverinfo)) of
			[#rec_serverinfo{} = ServerInfo] -> ServerInfo;
			[] ->
				?WARN_OUT("this is first open server!!!"),
				#rec_serverinfo{
					id = 1,
					starttime = time2:getTimestampSec()
				}
		end,
	Info.

%% 记录关服时间
-spec recordEndServerTime() -> ok.
recordEndServerTime() ->
	IdIndex = globalSetup:getServerIDIndex(),
	NowTime = time2:getTimestampSec(),
	SQL = io_lib:format("UPDATE serverinfo s SET s.endtime = ~p WHERE s.id = ~p;", [NowTime, IdIndex]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("UPDATE serverinfo.endtime", Ret, SQL),
	?LOG_OUT("recordEndServerTime:id=~p,time=~p", [IdIndex, NowTime]),
	ok.

%% 获取数据库配置
-spec getDBInfo() -> ok.
getDBInfo() ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, "SELECT * FROM db_info"),
	{Result, _LeftResult} = mysql:nextResult(Ret),
	[#rec_db_info{
		serverName = Name,
		adbID = ADBID,
		dbID = DBID,
		maxPlayer = MaxPlayer
	}] = emysql_util:as_record(Result, rec_db_info, record_info(fields, rec_db_info)),
	ServerName = erlang:binary_to_list(Name),

	globalSetup:insert(?GSKey_adbID, ADBID),
	globalSetup:insert(?GSKey_dbID, DBID),
	globalSetup:insert(?GSKey_serverName, ServerName),
	globalSetup:insert(?GSKey_maxPlayer, MaxPlayer),

	?WARN_OUT("DBinfo ADBID=~p, DBID=~p, ServerName=~ts, MaxPlayer=~p", [ADBID, DBID, ServerName, MaxPlayer]),
	ok.