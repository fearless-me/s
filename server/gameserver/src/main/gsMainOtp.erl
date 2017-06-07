%%%main进程

-module(gsMainOtp).
-author(zhongyuanwei).

-behaviour(myGenServer).

-include("mainPrivate.hrl").

-record(state, {}).

-define(TABLE_PlayersSocketPidZombie, 		playersSocketPidZombie).%%socket僵尸进程相关
-define(SocketPidExpireTime,1000*30).%%30秒鉴定为僵尸进程
-define(VoiceTableClear,3600000). %%1个小时清理一次
-define(ServerTimeSyncTime,1800000). %%半小时下发一次系统时间
-define(SaveTeamInfoTime, 1800000).%%同步队伍信息时间
%% ====================================================================
%% API functions
%% ====================================================================
-export([start_link/0]).

-export([
	rpc_getPlayerSharedEquipByUID/1
]).

%% ====================================================================
%% callback functions
%% ====================================================================
-export([
	init/1,
	handle_call/3,
	handle_cast/2,
	handle_info/2,
	terminate/2,
	code_change/3,
	handle_exception/3
]).

%%%=================================
%%% RPC Call
%%%=================================

%%根据EquipUID获取所有玩家共享
-spec rpc_getPlayerSharedEquipByUID(EquipUID) -> {ok, EquipInfo} when
	EquipUID :: uint(),
	EquipInfo :: #recSaveEquip{} | undefined.
rpc_getPlayerSharedEquipByUID(EquipUID)  when erlang:is_integer(EquipUID) andalso EquipUID > 0 ->
	case myEts:lookUpEts(?TABLE_AllPlayerSharedEquip, EquipUID) of
		[] ->
			{ok, undefined};
		[EquipInfo | _] ->
			{ok, EquipInfo}
	end.

%%%=================================================================================

start_link() ->
	myGenServer:start_link({local,?PsNameMain},?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

%%%=================================================================================
%%% callbacks
%%%=================================================================================

init([]) ->
	?LOG_OUT("~p init", [?MODULE]),
	ets:new(?TABLE_AllPlayerSharedEquip, [public, named_table, {keypos, #recSaveEquip.itemUID}]),   		%% 所有玩家共享出去的装备
	ets:new(?TABLE_CrosTeam, [public, named_table, {keypos, #recCrosTeam.teamID}]),					%%跨服组队
	ets:new(?TABLE_DROP, [public, named_table, {keypos, #rec_server_drop.id}]),						%%服务器掉落
	ets:new(?TABLE_PlayersSocketPidZombie, [public, named_table, {keypos, #recProcSignIn.pid}]), 	%% 进程签到表

	ets:new(?TABLE_MiscKV, [public, named_table, {keypos, #recKeyValue.key}]),
	ets:new(?TABLE_PlayerVoice, [public, named_table, {keypos, #recVoiceInfo.key}]),					%% 语音
	ets:new(?TABLE_WildBoss, [public, named_table, {keypos, #recWildBossInfo.bossID}]),
	ets:new(?MapInfoEts,[public,named_table,{keypos,#recMapPidInfo.pid},{read_concurrency,true}, {write_concurrency,true}]),
	ets:new(?TABLE_CHATCD, [public,named_table,{keypos,#recChatCD.roleID},{read_concurrency,true}, {write_concurrency,true}]),

	ets:new(?TABLE_PlayerInfoCross, [public, named_table, {keypos, #onlinePlayerInfo.accountID},{read_concurrency, true}]),

	ets:new(?TABLE_PlayerLoginAwardConf, [public, named_table, {keypos, #loginAwardConf.award_id},{read_concurrency, true}]),

	%% gs排行榜缓存表
	ets:new(?TABLE_RankInfo, [public, named_table, bag, {keypos, #recPlayerRank.rankType}, {read_concurrency, true}]),

	%% 军团内存表
	ets:new(recGuildMemory, [public, named_table, set, {keypos, #recGuildMemory.guildID}, {read_concurrency, true}, {write_concurrency, true}]),
	%% 家族-游乐场
	ets:new(?EtsGuildFairground, [public, named_table, set, {keypos, #recGuildFairground.guildID}, {read_concurrency, true}, {write_concurrency, true}]),

	initWildBossEts(),
	gsMainLogic:initMain(),

	erlang:send_after(?VoiceTableClear, self(), {clearVoiceOldData}), %%清理语音垃圾探测器
	erlang:send_after(?SocketPidExpireTime, self(), {userSocketZombie, 0, 0}),%%稍候检查
	erlang:send_after(1000, self(), initConfigCheck),%%检查配置参数的逻辑

	ets:new(?RiftEts, [named_table, public, set, {read_concurrency, true}, {write_concurrency, true}]),

	startMonitor(),

	?WARN_OUT("gsMainOtp start, isCrossServer [~p]", [core:isCross()]),
	{ok, #state{}}.

handle_call(Request, _From, State) ->
	?ERROR_OUT("Unhandle Request[~p]",[Request]),
	{noreply, State}.

handle_cast(_Msg, State) ->
	{noreply, State}.

%% 配置检查
handle_info(initConfigCheck, State) ->
	?LOG_OUT("begin initConfigCheck!"),
	configCheck:startCheckFun(),
	{noreply, State};

handle_info({initData, _Pid, _}, State) ->
	gsMainLogic:initDropInfo(),
	{noreply, State};

%%清理voice rbx
handle_info({clearVoiceOldData}, State) ->
	playerChat:clearOldVoice(),
	erlang:send_after(?VoiceTableClear, self(), {clearVoiceOldData}), %%清理语音垃圾探测器
	{noreply, State};

%%socket进程僵尸鉴定kill
handle_info({userSocketZombie, _Pid, _Msg}, State) ->
	zombieDeal(?TABLE_PlayersSocketPidZombie, ?SocketPidExpireTime),
	erlang:send_after(?SocketPidExpireTime, self(), {userSocketZombie, _Pid, _Msg}),
	{noreply, State};

handle_info({reset, _, {}}, State) ->
	?LOG_OUT("reset server drop limit"),
	gsMainLogic:resetDropInfo(),
	{noreply, State};

%%玩家共享装备时，将装备信息插入到ETS全局表中
handle_info({playerSharedEquip, _Pid, EquipInfo}, State)  ->
	?DEBUG_OUT("insert TABLE_AllPlayerSharedEquip, EquipInfo : ~p", [EquipInfo]),
	ets:insert(?TABLE_AllPlayerSharedEquip, EquipInfo),
	{noreply, State};

handle_info({stop_application,_Pid,{}}, State) ->
	io:format("MainOtp[~p] stop_application~n",[self()]),

	Fun =
		fun(#rec_OnlinePlayer{pid = PlayerPid}, _) ->
			psMgr:sendMsg2PS(PlayerPid, stop_application, {})
		end,
	ets:foldl(Fun, 0, ets_rec_OnlinePlayer),
	{noreply, State};

handle_info({monitor,_Pid,long_schedule,_Info},State) ->
%% 	String = case erlang:process_info(Pid, [registered_name]) of
%% 				 [{registered_name,Name}] when erlang:is_atom(Name) ->
%% 					 io_lib:format("PsName:~p ~p long_schedule Info:~p~n",[Name,Pid,Info]);
%% 				 _ ->
%% 					 io_lib:format("~p long_schedule Info:~p~n",[Pid,Info])
%% 			 end,
%% 	writeToMonitorFile(String),
	{noreply,State};

handle_info({monitor, Pid, long_gc, Info},State) ->
	String = case erlang:process_info(Pid, [registered_name]) of
				 [{registered_name,Name}] when erlang:is_atom(Name) ->
					 io_lib:format("PsName:~p ~p long_gc Info:~p~n",[Name,Pid,Info]);
				 _ ->
					 io_lib:format("~p long_gc Info:~p~n",[Pid,Info])
			 end,
	writeToMonitorFile(String),
	{noreply,State};

%%世界等级
handle_info({refreshWorldLevel, _Pid, Level}, State) ->
	#globalsetupCfg{setpara = [MinLevel]} = getCfg:getCfgByArgs(cfg_globalsetup, worldlevel_base),
	RLevel = case Level > MinLevel of
				 true ->
					 Level;
				 _ ->
					 MinLevel
			 end,
	memDBCache:saveSundries(?Sundries_ID_WorldLevel, 1, RLevel),
	%% 通知全服在线玩家刷新世界等级
	psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {refreshWorldLevelToAllPlayer, {}}),
	{noreply,State};

handle_info({serverStatrOk,_},State) ->
%%	misc:monitor_nodes(),
	{noreply, State};

handle_info(Info,State) ->
	?ERROR_OUT("unhandle info:[~p] in [~p] [~p,~p]",[Info,node(),?MODULE,self()]),
	{noreply,State}.

terminate(Reason, State) ->
	?LOG_OUT("Module[~p] terminate by[~p],State[~p]",[?MODULE,Reason,State]),
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).


%% ====================================================================
%% Internal functions
%% ====================================================================

startMonitor() ->
	{Result, File_Handle} = file:open("monitor.txt",
		[
			append,raw
			,binary
			%%,{delayed_write, 10 * 1024 * 1024, 30000}
		]),
	case Result of
		ok ->
			?LOG_OUT("Start monitor long_schedule long_gc"),
			erlang:system_monitor(self(), [{long_schedule,500},{long_gc,500}]),
			put(monitorFile,File_Handle),
			ok;
		_ ->
			skip
	end,
	ok.

writeToMonitorFile(String) ->
	FileHandle = get(monitorFile),
	file:write(FileHandle,String),
	ok.

initWildBossEts() ->
	BossIDList = getCfg:get1KeyList(cfg_wildboss),
	Fun = fun(BossID) ->
		#wildbossCfg{mapID = MapID} = getCfg:getCfgByArgs(cfg_wildboss, BossID),
		ets:insert(?TABLE_WildBoss, #recWildBossInfo{mapID = MapID, bossID = BossID, nextRefreshTime = 0})
		  end,
	lists:map(Fun,BossIDList),
	ok.

-ifdef(RELEASE).
%%僵尸进程鉴定并kill
zombieDeal(EtsTableName , ExpiresSeco) ->
	Now = time:getUTCNowSec(),
	ZombieCondition = ets:fun2ms(
		fun(Obj) when (Now - Obj#recProcSignIn.signInTime > ExpiresSeco / 1000) ->
			Obj#recProcSignIn.pid
		end
	),
	ZombieList =  myEts:selectEts(EtsTableName, ZombieCondition),
	lists:foreach(fun(Elem) ->
		erlang:exit(Elem, kill),
		ets:delete(EtsTableName, Elem ),
		?ERROR_OUT("zombieProc pid: ~p ~n", [Elem])
				  end, ZombieList),
	ok.
-else.
zombieDeal(_EtsTableName , _ExpiresSeco) ->
	ok.
-endif.


