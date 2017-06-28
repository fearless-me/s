%% 主逻辑进程
-module(lsMainOtp).

-behaviour(gen_server).

%%
%% Exported Functions
%%
-export([start_link/0]).

-export([
	init/1,
	handle_call/3,
	handle_cast/2,
	handle_info/2,
	terminate/2,
	code_change/3
]).

-export([
	getCanReachGSList/1
]).

%%
%% Include files
%%
-include("setup.hrl").
-include("lsInc.hrl").
-include("gsInc.hrl").

-record(state, {}).

%%
%% API Functions
%%
start_link() ->
	myGenServer:start_link({local, ?PsNameLS}, ?MODULE, [], [{timeout, ?Start_Link_TimeOut_ms}]).

init([]) ->
	?LOG_OUT("~p begin init", [?MODULE]),

	ets:new(?ETSOnlineAccount, [named_table, public, {keypos, #recLoginAccount.accountID}]),
	ets:new(?ETSGameServerInfo, [named_table, public, {keypos, #recGameServer.gameServerID}]),
	ets:new(?ETSDenyAccount, [named_table, public,bag, {keypos, #blackAccount.accountID}]),
	ets:new(?ETSWhiteAccount, [named_table, public, {keypos, #whiteAccount.accountID}]),
	ets:new(?XmlNoticeEts, [named_table, public, {keypos, #xmlNoticeRow.type}]),
	ets:new(?GameNoticeEts, [named_table,public, {keypos,#gameNotice.id}]),
	ets:new(?DenyDeviceEts, [named_table,public, {keypos,#recDenyDevice.deviceId}]),%%禁止登录设备的配置

	ets:new(?RandIPEts, [public, named_table, {read_concurrency, true}, {keypos,1}]),
	ets:new(?MonitorIPEts, [public, named_table, {read_concurrency, true}, {write_concurrency, true}, {keypos,1}]),
	ets:new(?changeIpEts, [public, named_table, {read_concurrency, true}, {write_concurrency, true}, {keypos,#recChangeIp.accountIDStr}]),

	erlang:send_after(1000, self(), lsLoadDataMsg),

	?LOG_OUT("~p begin init ok", [?MODULE]),

	{ok, #state{}}.

%%检测某帐号是否已经在ETSOnlineAccount，
%%如果在，如果IsReplace=false，则返回existAccount, ExistAccountInfo，
%%如果IsReplace=true，则覆盖原有account，并返回{replaced, OldAccountInfo}
%%如果不在，需要插入该帐号
%% FIXME 这个CALL逻辑并不复杂，暂时不移除
handle_call({checkAndInsertAccount, {NewAccount, IsReplace}}, _From, State) ->
	#recLoginAccount{accountID = AccountID} = NewAccount,
	ExistAccountInfo = clientLogic:getAccountByAccountIDEts(AccountID),
	Return =
		case ExistAccountInfo of
			{} ->
				ets:insert(?ETSOnlineAccount, NewAccount),
				{created, {}};
			_ ->
				if
					IsReplace =:= true->
						ets:insert(?ETSOnlineAccount, NewAccount),
						{replaced, ExistAccountInfo};
					true->
						{existAccount, ExistAccountInfo}
				end
		end,
	{reply,Return,State};

handle_call(_Request, _From, State) ->
	{noreply, ok, State}.

handle_cast(_Msg, State) ->
	{noreply, State}.

terminate(Reason, _State) ->
	?LOG_OUT("~p terminate ~p",[?MODULE, Reason]),
	ok.

code_change(OldVsn, State, Extra) ->
	?LOG_OUT("~p terminate ~p ~p",[?MODULE, OldVsn, Extra]),
	{ok, State}.

handle_info(lsLoadDataMsg, State) ->
	%% 获取游戏服务器配置
	serverInfoInit(),

	%% 初始化本区黑、名名单
	lsLoadData(getBlackAndWhiteAccountList, {}, getWhiteAccountListAck),

	%% 加载xml公告
	lsLoadData(getXmlNotice, {}, getXmlNoticeAck),

	%% 加载游戏中公告（走马灯）
	lsLoadData(getGameNotice, {}, getGameNoticeAck),

	%% 加载游戏禁止登录的设备配置表
	lsLoadData(getDenyDevice,{}, getDenyDeviceCnfAck),

	%% tiancheng
	lsLoadData(getRandIpList, {}, getRandIpListAck),

	?LOG_OUT("~p lsLoadDataMsg",[?MODULE]),
	{noreply, State};

%%接收处理DBS回馈的黑名单
handle_info({getBlackAccountListAck, _Pid, {BlackList}}, State) ->
	%%装载黑名单到ets 自刷新
	case BlackList of
		[] ->
			ets:delete_all_objects(?ETSDenyAccount);
		[#blackAccount{}|_] ->
			ets:delete_all_objects(?ETSDenyAccount),
			ets:insert(?ETSDenyAccount, BlackList);
		_ ->
			throw("Error getBlackAccountListAck")
	end,

	{noreply, State};

handle_info({getWhiteAccountListAck, _Pid, {WhiteList}}, State) ->
	lsLoadDataAck(getWhiteAccountListAck),
	%%装载白名单到ets 自刷新
	case WhiteList of
		[] ->
			ets:delete_all_objects(?ETSWhiteAccount);
		[#whiteAccount{}|_] ->
			ets:delete_all_objects(?ETSWhiteAccount),
			ets:insert(?ETSWhiteAccount, WhiteList);
		Error ->
			?ERROR_OUT("getWhiteAccountListAck:~p", [Error]),
			throw("Error getWhiteAccountListAck")
	end,
	{noreply, State};

handle_info({getDenyDeviceCnfAck, _Pid, {DenyDeviceCnfList}}, State) ->
	lsLoadDataAck(getDenyDeviceCnfAck),
	%%装载禁止登录的设备配置到ets
	case DenyDeviceCnfList of
		[] ->
			ets:delete_all_objects(?DenyDeviceEts);
		[#recDenyDevice{}|_] ->
			ets:delete_all_objects(?DenyDeviceEts),
			ets:insert(?DenyDeviceEts, DenyDeviceCnfList);
		Error ->
			?ERROR_OUT("getDenyDeviceCnfAck:~p", [Error]),
			throw("Error getDenyDeviceCnfAck")
	end,
	{noreply, State};

handle_info({getXmlNoticeAck, _Pid, {XmlNoticeList}}, State) ->
	lsLoadDataAck(getXmlNoticeAck),

	%%装载公告到ets
	case XmlNoticeList of
		[] ->
			ets:delete_all_objects(?XmlNoticeEts);
		[#xmlNoticeRow{}|_] ->
			ets:insert(?XmlNoticeEts, XmlNoticeList);
		Error ->
			?ERROR_OUT("getXmlNoticeAck:~p", [Error]),
			throw("Error getXmlNoticeAck")
	end,
	{noreply, State};

%%接收数据库返回的公告数据
handle_info({getGameNoticeAck,_pid,{NoticeList}},State)->
	lsLoadDataAck(getGameNoticeAck),
	case NoticeList of
		[] ->
			gameNotice:clearGameNotice();
		[#gameNotice{}|_] ->
			gameNotice:mysqlRow2Ets(NoticeList);
		Error ->
			?ERROR_OUT("getGameNoticeAck:~p", [Error]),
			throw("Error getGameNoticeAck")
	end,
	{noreply, State};

handle_info({getRandIpListAck, _, {List1, List2}}, StateData) ->
	lsLoadDataAck(getRandIpListAck),
	F =
		fun(#id{id = Ip}, Index) ->
			ets:insert(?RandIPEts, {Index, erlang:binary_to_list(Ip)}),
			Index + 1
		end,
	lists:foldl(F, 1, List1),
	[ets:insert(?MonitorIPEts, {erlang:binary_to_list(Ip2), 1}) || #id{id = Ip2} <- List2],
%%	?DEBUG_OUT("rand:~p", [List1]),
%%	?DEBUG_OUT("monitor:~p", [List2]),
	{noreply, StateData};

%% 定时更新本线在线人数
handle_info(gsRefreshOnlineCount, State) ->
	erlang:send_after(5000, self(), gsRefreshOnlineCount),
	Num = playerMgrOtp:getAllPlayerNumAndModifyData(),
	updateGSOnlineCount(Num),
	{noreply, State};

handle_info({monitorsj_addmonitorsjip, _Pid, {Type, IP}}, State) ->
	case Type of
		?MonitorTC_Type_AddRandIP ->
			Size = ets:info(?RandIPEts, size) + 1,
			ets:insert(?RandIPEts, {Size, IP}),
			ok;
		?MonitorTC_Type_AddMonitorIP ->
			ets:insert(?MonitorIPEts, {IP, 1}),
			ok;
		?MonitorTC_Type_DelRandIP ->
			ok;
		?MonitorTC_Type_DelMonitorIP ->
			ets:delete(?MonitorIPEts, IP),
			ok
	end,
	{noreply, State};

%% gs 发过来的封号命令
handle_info({gsForbiddenAccount, _PidFromGS, {AccountID, Time}}, State) ->
	setBlackAccount(AccountID,Time),
	{noreply, State};

handle_info({playerLoginSucc, PlayerPid, {AccountID}},  State) ->
	?LOG_OUT("AccountID[~p] login succ,playerPid in gs[~p]", [AccountID,PlayerPid]),
	%%增加登录数
	updateCounterOfGS(1),

	%%更新玩家的GS信息,并记录playerPid,
	lsMainLogic:recordPlayPid({AccountID,PlayerPid}),

	loginQueueOtp:send2me(logon, AccountID),%%上线成功，去掉本玩家 排队系统超时
	{noreply, State};

handle_info({checkAccountKey, GSPid, {AccountID, Key}}, State) ->
	lsMainLogic:checkAccountCanLoginGS({GSPid, AccountID, Key}),
	{noreply, State};

%% gs发到ls的退出消息
%%Type::(robKickOut|gmKickOut|normal|changeLine)
handle_info({playerOffline, _Pid, {AccountID,Type}}, State) ->
	?LOG_OUT("Player AccountID[~p] logout Type[~p]", [AccountID,Type]),
	[#recGameServer{gameServerState=GameServerState}|_]=ets:lookup(?ETSGameServerInfo, core:getServerID()),
	GMLevel=
		case ets:lookup(?ETSOnlineAccount, AccountID) of
			[#recLoginAccount{gmLevel=GMLevel1}|_] ->
				GMLevel1;
			_ ->
				0
		end,

	case Type of
		normal when erlang:is_integer(AccountID) ->
			%%更新数据库帐号状态{行为,帐号ID,lineID=0}
			updateCounterOfGS(-1),
			lsMainLogic:deleteAccount({AccountID});
		robKickOut when erlang:is_integer(AccountID) ->
			updateCounterOfGS(-1),
			lsMainLogic:deleteAccount({AccountID});
		changeLine when erlang:is_integer(AccountID) ->
			?DEBUG_OUT("changeLine accountInfo ~p",[AccountID]),
			%% 换线时，新gs发key给ls验证时，gslineid需为0
			lsMainLogic:updateAccountGSID({AccountID, -1});
		gmKickOut when erlang:is_integer(AccountID) ->
			%%更新数据库帐号状态{行为,帐号ID,lineID=0}
			updateCounterOfGS(-1),
			lsMainLogic:deleteAccount({AccountID});
		_ ->
			skip
	end,

	case (Type =:= normal orelse Type =:= gmKickOut)
		andalso GameServerState=:=?GameServer_State_Running of
		true when GMLevel =:= 0 , erlang:is_integer(AccountID)->
			%%普通帐号 下线成功，归还 排队系统超可登录名额
			loginQueueOtp:send2me(logout,AccountID),
			ok;
		_ ->
			skip
	end,
	{noreply, State};

%% 玩家在gs请求XML公告
handle_info({getXmlNotice, FromPid, {Type,Md5}}, State) ->
	Ret = getFromEtsByType(Type,Md5),
	psMgr:sendMsg2PS(FromPid, getXmlNoticeAck, {Ret}),
	{noreply, State};

%% 玩家在gs请求游戏公告（走马灯）
handle_info({getGameNotice, FromPid, {Md5}}, State) ->
	Ret = gameNotice:getValidGameNotice(),
%% 	?DEBUG_OUT("getGameNotice:~p",[Ret]),
	psMgr:sendMsg2PS(FromPid, getGameNoticeAck, {Md5, Ret}),
	{noreply, State};

%% 从GS广播发临时走马灯
handle_info({getGameNotice, _FromPid, {Rgb,Txt}}, State) ->
	core:sendBroadcastNotice({Rgb, Txt}),
	{noreply, State};

%% 绑定手机
handle_info({verifyBindPhone, FormPid, {FuncellCilentID,AccToken, PhoneNum, Verifyid, Content}}, State) ->
%%	Ret = funcell:getBindPhone(FuncellCilentID,AccToken, PhoneNum, Verifyid, Content),
%%	psMgr:sendMsg2PS(FormPid, bindPhoneAck, {Ret, PhoneNum}),
	?ERROR_OUT("verifyBindPhone:~p,~p", [FormPid, PhoneNum]),
	psMgr:sendMsg2PS(FormPid, bindPhoneAck, skip),
	{noreply, State};

handle_info({syncDBDataOK,_PidFromGS,GSID},State) ->
	?LOG_OUT("GSID:~p syncDBDataOK",[GSID]),
	globalSetup:insert(?GSKey_hasGs, GSID),
	?LOG_OUT("==============Login Server Start OK!!!=============="),
	[?WARN_OUT("##############Server Start OK!!!##############") || _ <- lists:seq(1, 5)],

	autoCompileUpdate:openAutoCompileUpdate(),
	{noreply,State};

%%ls GM踢人消息
handle_info({gmKickout, _FromUserPid, {CmdSerial,AccountID,CallBackPid}}, State) ->
	case playerMgrOtp:getOnlinePlayerInfoByAccountID(AccountID) of
		#rec_OnlinePlayer{pid = PlayerPid} ->
			?LOG_OUT("kickOutPlayer online playerid[~p]",[PlayerPid]),
			psMgr:sendMsg2PS(PlayerPid, kickOutAccount, CallBackPid,{ gmKickOut,AccountID,CmdSerial});
		_ ->
			?LOG_OUT("kickOutPlayer offline ;[~p]not logined in me",[AccountID]),
			psMgr:sendMsg2PS(CallBackPid, handleMsgAck, {CmdSerial,1})
	end,
	{noreply, State};

%% 平台gm ls2gs 通知gs停服
handle_info({web2lsStopGs,_Pid,{CmdSerial,CallbackPid,DoAfterSecond}}, State) ->
	?LOG_OUT( "stopGs ~p  afterSecond:~p", [CmdSerial,DoAfterSecond] ),
	io:format( "stopGs ~p  afterSecond:~p", [CmdSerial,DoAfterSecond] ),
	erlang:send_after(1000*DoAfterSecond, self(), stopWill),

	psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial, 0}),%0为成功
	{noreply, State};

%% GS停服2分钟计数已到
handle_info(stopWill,State) ->
	Seconds = 60*2,
	?LOG_OUT("GS will stop after ~p Seconds", [Seconds]),
	psMgr:sendMsg2PS(?PsNamePlayerMgr, gs2MinuteStop, {Seconds}),

	%%只作踢人
%% 	erlang:put(gsClosing,true),%我不再向LS发TICK心跳
	?LOG_OUT("GS stopwill 2 minute"),
	{noreply,State};

handle_info(check_compile_update_tick, State) ->
	autoCompileUpdate:check_compile_update_tick(),
	{noreply, State};

handle_info({modify_debug_auto_param, _, Data}, State) ->
	autoCompileUpdate:modify_debug_auto_param(Data),
	{noreply, State};

handle_info(Info, State)->
	?ERROR_OUT("~p ~p handle_info ~p", [?MODULE, self(), Info]),
	{noreply, State}.

%% 取出有效的GS列表
-spec getCanReachGSList(IsContainAccountAndWhite::boolean()) -> #recGameServer{} | false.
getCanReachGSList(IsContainAccountAndWhite) ->
	case ets:lookup(?ETSGameServerInfo, core:getServerID()) of
		[#recGameServer{gameServerState = State} = Server] ->
			CanSend =
				case State of
					?GameServer_State_Running ->
						true;
					_ ->
						case IsContainAccountAndWhite of
							true ->
								State =:= ?GameServer_State_Closed orelse
									State =:= ?GameServer_State_SpecCanVisable;
							_ ->
								false
						end
				end,
			case CanSend of
				true -> Server;
				_ ->
					?ERROR_OUT("now server state:~p", [State]),
					false
			end;
		_ -> false
	end.

%% 更新某GS的状态
-spec updateGSState(StateSet) -> ok when StateSet::integer().
updateGSState(StateSet) ->
	?LOG_OUT("updateGSState:~p", [StateSet]),
	ets:update_element(?ETSGameServerInfo, core:getServerID(), {#recGameServer.gameServerState, StateSet}),
	ok.

%% 更新某GS的 在线人数
updateGSOnlineCount(Num)->
	ets:update_element(?ETSGameServerInfo,
		core:getServerID(),
		{#recGameServer.gameServerPlayerCount, Num}),
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================

updateCounterOfGS(Num) ->
	GSId = core:getServerID(),
	case ets:lookup(?ETSGameServerInfo, GSId) of
		[GSInfo|_] ->%%gs更新人数
			ets:update_element(?ETSGameServerInfo, GSId, {#recGameServer.gameServerPlayerCount,
				GSInfo#recGameServer.gameServerPlayerCount + Num}),
			?LOG_OUT("===GS[~p] Logined count update[~p],current_value[~p]", [GSId, Num, GSInfo#recGameServer.gameServerPlayerCount]),
			ok;
		[]->
			ok
	end,
	ok.

-spec getFromEtsByType(Type,Md5) -> #pk_GS2U_XmlNoticeResponse{} when
	Type::string(),Md5::string().
getFromEtsByType(Type,Md5) ->
	case ets:lookup(?XmlNoticeEts, Type) of
		[] ->
			#pk_GS2U_XmlNoticeResponse{type=Type,ret=2,content="",sign=""};
		[#xmlNoticeRow{type=Type,content =BinXmlContent,md5=BinEtsMd5} |_] ->
			EtsMd5 = erlang:binary_to_list(BinEtsMd5),
			XmlContent = erlang:binary_to_list(BinXmlContent),
			if
				Md5 =/= BinEtsMd5 ->
					#pk_GS2U_XmlNoticeResponse{
						type = Type,
						ret = 0,
						content = XmlContent,
						sign = EtsMd5
					};
				true ->
					#pk_GS2U_XmlNoticeResponse{type=Type,ret=1,content="",sign=""}
			end
	end.
%%通过节点发送消息给gsserver服务器,有三种方式rpc:cal、rpc:cast和{Pid,Node} ! Msg
%%Msg = {MsgID,{Value}}
%%通过节点发送消息给GSserver
%% sendToGSServerByNode(Node,{MsgID,MsgValue})->
%% 	{loginServerPID,Node} ! {MsgID,self(),MsgValue}.
setBlackAccount(AccountID, Time) ->
	CurTime = time:getUTCNowSec(),
	%%内存更新
	{BeginTime,EndTime} =
		case Time > 0 of
			true ->
				DenyAcccount =
					#blackAccount{accountID = AccountID, beginTime = CurTime, endTime = CurTime + Time},
				ets:insert(?ETSDenyAccount, DenyAcccount),
				{CurTime, CurTime + Time};
			false -> %%小于0的表示永久封号
				DenyAcccount =
					#blackAccount{accountID = AccountID,  isForever = 1},
				ets:insert(?ETSDenyAccount, DenyAcccount),
				{-1,-1}
		end,

	%%数据库更新
	CmdSerial = notWebCmd,
	Oprate = 1,  % 1 添加
	LineID = 0,  % 所有gs线
	lsSendMsg:sendMsg2DBServer(setDenyAccountID, {CmdSerial,Oprate,AccountID,LineID, BeginTime, EndTime}).

serverInfoInit() ->
	ServerID = globalSetup:getServerID(),
	MaxPlayer = globalSetup:getMaxPlayer(),
	IP = getConfigIP(),

	Port = config:getInt("ListenToUserPort", 6789),

	GameServerInfo =
		#recGameServer{
			gameServerID 		= ServerID,
			gameServerName 		= globalSetup:getServerName(),
			gameServerIp    	= IP,
			gameServerPort  	= Port,
			maxPlayer 			= MaxPlayer,
			gameServerState		= ?GameServer_State_Closed
		},

	?LOG_OUT("getLineServer is ok, LineServer,ID[~p], IP[~ts], Name[~ts], MaxPlayer[~p]",
		[
			GameServerInfo#recGameServer.gameServerID,
			GameServerInfo#recGameServer.gameServerIp,
			GameServerInfo#recGameServer.gameServerName,
			GameServerInfo#recGameServer.maxPlayer
		]),

	ets:insert(?ETSGameServerInfo, GameServerInfo),

	%%发个消息通知dbs，所有在这个gsid上的帐号清0
	lsSendMsg:sendMsg2DBServer(clearAccountOnGS, {ServerID}),

	?WARN_OUT("LSServer Succ,canLoginNumInit[~w]", [MaxPlayer]),

	%%GS注册成功，增加可登录名额
	loginQueueOtp:send2me(canLoginNumInit, {ServerID, MaxPlayer, MaxPlayer}),
	ok.

lsLoadData(Msg, MsgData, AckMsg) ->
	L = getLoadDataWaitList(),
	case lists:member(AckMsg, L) of
		true ->
			skip;
		_ ->
			setLoadDataWaitList([AckMsg | L])
	end,

	lsSendMsg:sendMsg2DBServer(Msg, MsgData),
	ok.

lsLoadDataAck(AckMsg) ->
	case getLoadDataWaitList() of
		[] -> skip;
		L ->
			NL = lists:delete(AckMsg, L),
			setLoadDataWaitList(NL),
			case NL of
				[] ->
					updateGSState(?GameServer_State_Running),

					psMgr:sendMsg2PS(self(), syncDBDataOK, gsMainLogic:getServerID()),

					erlang:send_after(5000, self(), gsRefreshOnlineCount),
					ok;
				_ ->
					skip
			end
	end,
	ok.

getLoadDataWaitList() ->
	case get('LoadDataWaitList') of
		undefined -> [];
		L -> L
	end.
setLoadDataWaitList(List) ->
	put('LoadDataWaitList', List).

-ifdef(RELEASE).
getConfigIP() ->
	config:getString("ListenToUserIP", "127.0.0.1").
-else.
getConfigIP() ->
	IP = config:getString("ListenToUserIP", "127.0.0.1"),
	case misc:getLocalIP() of
		IP ->
			IP;
		LocalIP ->
			?ERROR_OUT("IP Config[~p] =/= LocalIP[~p], auto use localIP!!!", [IP, LocalIP]),
			LocalIP
	end.
-endif.