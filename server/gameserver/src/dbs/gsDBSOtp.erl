%%%dbsOtpWorker的监督进程

-module(gsDBSOtp).

-behaviour(myGenServer).

-include("dbsPrivate.hrl").

%%与DBS的心跳时间
-define(HeartBeatTime,60000).
-define(ConnectTime,1000).

-define(ReConnectDBSRetry, 10).
-define(ConnectDBSRetry, 100).
-define(CallTimeout, 5000).

-define(ReturnItemOK, 	   0).			%% 还原成功
-define(ReturnItemError1,  -1).			%% 邮件发送失败,还原失败
-define(ReturnItemError2,  -102).			%% 物品可以叠加,还原失败
-define(ReturnItemError3,  -103).			%% 物品UID不存在,还原失败
-define(ReturnItemError4,  -104).			%% 物品没有被删除,还原失败


%% ====================================================================
%% API functions
%% ====================================================================

-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3,handle_exception/3]).

start_link() ->
	gen_server:start_link({local,?PsNameDBS},?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

init([]) ->
	?LOG_OUT("~p init", [?MODULE]),
	erlang:send_after(?HeartBeatTime, self(), tick),
	?LOG_OUT("~p init ok", [?MODULE]),
	{ok, #recdbsState{}}.

%% ====================================================================
%% Internal functions
%% ====================================================================
handle_call(_Request, _From, State) ->
    {noreply, ok, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
	?WARN_OUT("!!!!!!warning!!!!!!process terminate with why[~p],state[~p]",[_Reason, _State]),
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%%%%发送消息到dbserver
%%handle_info({gsMsgToDBserver,Pid,Msg}, #recdbsState{dbsPid = DBSPid} = State)->
%%	sendToDBServer(DBSPid,Pid,Msg),
%%	{noreply, State};

handle_info(tick, State) ->
	V = getSyncDBDataState(),
	case V < 4 of
		true ->
			erlang:send_after(?HeartBeatTime, self(), tick),
			?LOG_OUT("waiting for dbs syncDBData[~p]...", [V]);
		_ ->
			skip
	end,
	{noreply,State};

handle_info({stop_server_gs_Prepare_Tick, PidFromMain}, State) ->
	?WARN_OUT("stop_server_gs_ok:~p,~p", [self(), PidFromMain]),

	%% 可以关闭
	psMgr:sendMsg2PS(PidFromMain, stop_server_gs_ok, self()),

	%% 5秒钟后结束自己
%%	timer:sleep(5000),

	%% 关闭
%%	gameServer:stop_real(),
	{noreply, State};

handle_info({stop_server_gs_Tick, PidFromMain, Number}, State) ->
	?WARN_OUT("stop_server_gs_Tick:~p,~p,~p", [Number, self(), PidFromMain]),

	PlayerNum = ets:info(ets_rec_OnlinePlayer, size),
	case PlayerNum > 0 andalso Number < 20 of
		true ->
			?WARN_OUT("stop_server_gs_Tick repeat:~p,~p,~p,~p", [Number, PlayerNum, self(), PidFromMain]),

			%% 还有玩家，或者时间还没到，继续心跳
			erlang:send_after(10000, self(), {stop_server_gs_Tick, PidFromMain, Number + 1}),
			ok;
		_ ->
			%% 准备结束进程
			erlang:send_after(10000, self(), {stop_server_gs_Prepare_Tick, PidFromMain}),
			ok
	end,
	{noreply, State};

handle_info({stop_server_gs, PidFromMain, _}, State) ->
	?WARN_OUT("recv stop_server_gs:~p,~p", [self(), PidFromMain]),

	case core:isCross() of
		false ->
			%% 自己心跳，等待踢人结束
			erlang:send_after(10000, self(), {stop_server_gs_Tick, PidFromMain, 1}),

			%% 踢人倒计时
			erlang:send(?PsNameLS, stopWill);
		_ ->
			%% 是跨服，直接关闭
			psMgr:sendMsg2PS(PidFromMain, stop_server_gs_ok, self())
	end,
	{noreply, State};

%%道具恢复处理
handle_info({returnItem, _Pid, {PidFromLS,GMCmdSerial,RoleID, ItemUID}}, State) ->
	?LOG_OUT("del roleID [~p] return item[~p]",[RoleID, ItemUID]),
	Ret =
		case edb:readRecord(rec_item, ItemUID) of
			[#rec_item{itemID = ItemID} = Item | _] when ItemID < ?Item_Differentiate ->
				case getCfg:getCfgPStack(cfg_item, ItemID) of
					#itemCfg{maxAmount = Max} when Max =:= 1 ->
						returnItem(RoleID, Item, ?Item_Location_Bag);
					_ ->
						?ReturnItemError2
				end;
			[#rec_item{} = Item | _] ->
				returnItem(RoleID, Item, ?Item_Location_Equip_Bag);
			_ ->
				?ReturnItemError3
		end,
	psMgr:sendMsg2PS(PidFromLS, handleDBSAck, {GMCmdSerial,Ret}),
	{noreply, State};

handle_info({playerDataLoadSuccess, _Pid, _},State) ->
    ?LOG_OUT("Recv PlayerData playerDataLoadSuccess..."),
    setSyncDBDataState(),
    {noreply, State};

handle_info({publicDataLoadSuccess, _Pid, _},State) ->
    ?LOG_OUT("Recv PlayerData publicDataLoadSuccess..."),
    setSyncDBDataState(),
    {noreply, State};

handle_info({syncDBData, _Pid, Param}, State) ->
	loadDataBack(Param),
	{noreply,State};

handle_info({loadOtherDataAck, _Pid, _}, State) ->
	setSyncDBDataState(),
	?WARN_OUT("==============Game Server Start OK!!!=============="),
	psMgr:sendMsg2PS(?PsNameMain, serverStatrOk),

	misc:clear_os_cache(),

	psMgr:sendMsg2PS(treeLSOtp, gsDataLoadSuccess, 0),
    {noreply, State};

handle_info(Info,State) ->
	?ERROR_OUT("unhandle info:[~p] in [~p] [~p,~p]",[Info,node(),?MODULE,self()]),
	{noreply,State}.
%% ====================================================================
%% Internal functions
%% ====================================================================

loadDataBack(State) ->
	?LOG_OUT("Recv DBS syncDBData[~p]...", [State]),
	case State of
		?DBSLoadData_AllEnd ->
			%% DBS所有数据真正加载完
			setSyncDBDataState();
		?DBSLoadData_First ->
			%% 告诉GS加载数据
			psMgr:sendMsg2PS(?PlayerDataMgr, alreadyConnectDBServer, {}),
			psMgr:sendMsg2PS(?PublicDataMgr, alreadyConnectDBServer, {}),
			skip
	end,
	ok.

returnItem(_RoleID, #rec_item{deleteTime = 0}, _Pos) ->
	?ReturnItemError4;
returnItem(_RoleID, #rec_item{deleteTime = {datetime,{{1970,1,1},{0,0,0}}}}, _Pos) ->
	?ReturnItemError4;
returnItem(RoleID, #rec_item{itemUID = ItemUID, itemID = ItemID} = Item, Pos) ->
	AttachMent = #recMailItem{itemUID = ItemUID, itemID = ItemID},
	MailID = mail:sendSystemMail(RoleID, stringCfg:getString(returnItem_MailTitle, []),
		stringCfg:getString(returnItem_MailContent, []), [AttachMent], []),
	case MailID of
		0 ->
			?ReturnItemError1;
		_ ->
			NewItem = Item#rec_item{pos = Pos, deleteTime = 0, roleID = ?Mail_Role_ID},
			edb:writeRecord(rec_item, NewItem),
			%% 更新道具
			gsSendMsg:sendMsg2DBServer(save_item_data, 0, {update, NewItem}),
			?ReturnItemOK
	end.

setSyncDBDataState()->
	%B = core:isCross(),
    V = getSyncDBDataState() + 1,
	put('setSyncDBDataState', V),
    ?LOG_OUT("setSyncDBDataState:~p", [V]),
    case V of
        3 ->
            startGS();
        _ ->
            skip
    end,
    ok.

startGS()->
	gsSubSup:start_link(),
	psMgr:sendMsg2PS(?PsNameMain, initData, 0),
	%% 再加载其它数据
	psMgr:sendMsg2PS(?PublicDataMgr, loadOtherData, {}).


getSyncDBDataState()->
	case get('setSyncDBDataState') of
		undefined ->
			0;
		V ->
			V
	end.

