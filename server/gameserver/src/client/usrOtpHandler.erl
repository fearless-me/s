%%%客户端的Otp消息处理
%%%一个玩家一个进程
%%%玩家进程主要负责玩家除战斗外的功能
-module(usrOtpHandler).

-behaviour(socketHandler).

-include("usrPrivate.hrl").

-record(recClientState,{}).

%% 每隔多久同步一次时间给客户端ms
-define(SyncServerTimeTick, 10000).
%% 客户端倒计时随机值取值范围s
-define(ClientRandMin, 6).
-define(ClientRandMax, 15).
%% 客户端延迟回复，最大保护时间s
-define(ClientDelayReturn, 10).
%% 客户端提前回复，最小保护时间s
-define(ClientAheadReturn, 1).
%% 这么长时间内，没有收到客户端的心跳协议s
-define(NotRecvClientHeartBeat_Time, 10 * 60).
%% 上面这么长时间内，没有收到客户端的这么多次心跳协议，则认为客户端网络非常差，直接断开连接
-define(NotRecvClientHeartBeat_Number, 10).
%% 超过这么长时间没有收到客户端的真正心跳时间，则直接断开连接s
-define(NoRecvClientHeartBeatRealTime, 60).

-define(TABLE_PlayersSocketPidZombie, 		playersSocketPidZombie).%%socket僵尸进程相关
-define(SignInFrequency,1000*2).
%% ====================================================================
%% API functions
%% ====================================================================
-export([start_link/1]).
-export([init/1,
		 handle_call/3,
		 handle_cast/2,
		 handle_info/2,
		 terminate/2,
		 code_change/3,
		 handle_exception/3]).

-export([handle_socket_close/1,
		 handle_net_msg/3]).

start_link(Arg) ->
	socketHandler:start_link(?MODULE, Arg).

init([Socket]) ->
	?LOG_OUT("usrOtpHandler[~p ~p] init",[self(), Socket]),
	userState:setUserSocket(Socket),

	%% 初始化
	NowTime = time:getSyncTimeFromDBS(),
	Rec = #rec_HeartBeat{lastRecvHeartBeatTime = NowTime},
	userState:setHeartBeatRec(Rec),

	%%僵尸进程检查
	userState:procSignInInit( ?TABLE_PlayersSocketPidZombie, ?SignInFrequency),

	%%同步时间给客户端
	syncServerTimeToClient(),
	erlang:send_after(?SyncServerTimeTick, self(), syncServerTimeTick),

	%%发送一个随机值给客户端，客户端开始倒计时
	sendHearBeatCDToClient(),
	{ok,#recClientState{}}.

handle_call(_Request, _From, State) ->
    {noreply, ok, State}.

%% Type=robKickOut|gmKickOut|timeoutKickOut|serverDownKickOut
handle_cast({kickOut, _Pid, Type }, State) ->
	?LOG_OUT("socket pid:~p Been kick out type:~p",[self(),Type]),
	
	SendType = case Type of
				   robKickOut ->
					   1; %% 抢登录
				   timeoutKickOut ->
					   3;%% 超时
				   serverDownKickOut ->
					   4;%% 关服
				   loadDataFailed ->
					   5;%%角色加载数据超时
				   _ ->
					   2 %% 普通踢人
			   end,	
	KickTips = #pk_GS2U_KickOutTip{
								   type = SendType
								   },
	socketHandler:sendNetMsg(core:packNetMsg(KickTips)),
	doUserOffline("kickOut"),
	{stop, normal, State};

handle_cast(Request, State) ->
	?LOG_OUT(" UnHandle Cast Info ~p", [Request]),
	{noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

handle_exception(Type,Why,State) ->
	%%先做清理
	try
		Reason = misc:term_to_string({exception,Why}),
		doUserOffline(Reason)
	catch
		_:_ ->
			doUserOffline("exception")
	end,
	
	%%调用基类处理
	myGenServer:default_handle_excetion(Type, Why, State),
	
	%%这里要接管，返回stop，以结束socket进程
	{stop, normal, State}.

%% 同步服务器时间给客户端
handle_info(syncServerTimeTick, State) ->
	erlang:send_after(?SyncServerTimeTick, self(), syncServerTimeTick),
	syncServerTimeToClient(),

	%% 检查是否处理玩家
	checkAndDealPlayer(State);

%% 超过最大保护时间了，增加没收到的次数
handle_info(waitRecvClientHearBeatTick, State) ->
	%% 没收到客户端返回的心跳
	?LOG_OUT("waitRecvClientHearBeatTick Socket:~p PlayerPid:~p AccountID:~p",
		[userState:getUserSocket(), userState:getPlayerPid(), userState:getAccountID()]),

	notRecvClientHeartBeat(userState:getHeartBeatRec()),

	%% 重新发一个随机值给客户端
	sendHearBeatCDToClient(),
	{noreply, State};

handle_info({bindPid,_Pid,PlayerPid},State) ->
	?LOG_OUT( "NetPid[~p] bind playerPid[~p]", [self(),PlayerPid] ),
	userState:setPlayerPid(PlayerPid),
	{noreply,State};

%%僵尸进程检查表签到
handle_info({procSignIn,_Pid,_},State) ->
	userState:procSignIn(?TABLE_PlayersSocketPidZombie, ?SignInFrequency),
	{noreply,State};

%%踢出外挂玩家
handle_info({exit_player},State) ->
    ?LOG_OUT("socket:~p pid:~p Been kick out",[userState:getUserSocket(),self()]),
    KickTips = #pk_GS2U_KickOutTip{
        type = 2
    },
    socketHandler:sendNetMsg(core:packNetMsg(KickTips)),
    doUserOffline("{exit_player,kickOut}"),
    {stop, normal, State};

handle_info(Info,State) ->
	?ERROR_OUT("unhandle info:[~p] in [~p] [~p,~p]",[Info,node(),?MODULE,self()]),
	{noreply,State}.

%%上层会退出本进程
handle_socket_close(Reason) ->
	?WARN_OUT("handle_socket_close[~p ~p]",[self(),Reason]),
	doUserOffline(Reason).

handle_net_msg(?CMD_U2GS_HeartBeat,#pk_U2GS_HeartBeat{time = ClientTime, version = Version},State) ->
	Rec = #rec_HeartBeat{version = Ver, timeRef = TimeRef} = userState:getHeartBeatRec(),
	case Version =:= Ver of
		true ->
			%% 去掉超时心跳
			case TimeRef of
				undefined -> skip;
				_ ->
					%% 去掉超时心跳
					erlang:cancel_timer(TimeRef)
			end,

			%% 检查心跳是否超时
			checkHeartBeat(ClientTime),

			%% 继续发送心跳CD给客户端
			sendHearBeatCDToClient(),
			ok;
		_ ->
			?LOG_OUT("[accountID=~p,playerPid=~p] recv client heartbeat msg:[~p,~p], now:~p",
				[userState:getAccountID(), userState:getPlayerPid(), Version, ClientTime, Rec])
	end,
	State;
handle_net_msg(?CMD_U2GS_HeartBeatReal,#pk_U2GS_HeartBeatReal{time = Time},State) ->
	Rec = #rec_HeartBeat{} = userState:getHeartBeatRec(),
	NowTime = time:getSyncTimeFromDBS(),

	%% 这里仅仅是打印个日志，不要紧张
	if
		Time - 1 > NowTime ->
			?ERROR_OUT("client is to fast [accountID=~p,playerPid=~p] recv client heartbeat msg:[server:~p,client=~p]",
				[userState:getAccountID(), userState:getPlayerPid(), NowTime, Time]);
		NowTime - Time >= 10 ->
			?LOG_OUT("client is to slow [accountID=~p,playerPid=~p] recv client heartbeat msg:[server:~p,client=~p]",
				[userState:getAccountID(), userState:getPlayerPid(), NowTime, Time]);
		true ->
			skip
	end,

	%% 更新最后一次收到客户端心跳时间
	userState:setHeartBeatRec(Rec#rec_HeartBeat{lastRecvHeartBeatTime = NowTime}),
	State;
handle_net_msg(Cmd,Pk,State) ->
	Pid = userState:getPlayerPid(),
 	sendMsgToPlayerPid(Pid,Cmd,Pk),
	State.

%% ====================================================================
%% Internal functions
%% ====================================================================
%%服务器现在的时间比客户端早，且小于等于10秒（暂定，客户端可能网络卡了）则视为正常情况
%%或者客户端时间计算出来比服务器的早，但小于1秒（暂定），也视为正常情况
%%其它情况则视为非正常情况，需要根据情况处理：
%%1.客户端时间比服务器晚，超过设定秒则视为网络很卡，让其下线
%%2.客户端时间比服务器早，超过设定秒则视为作弊，记录其作弊次数，当作弊次数达到一定数量则封号
checkHeartBeat(ClientTime) ->
	Rec = #rec_HeartBeat{rand = RandCD, cheatCount = CCount, sendTime = SendTime} = userState:getHeartBeatRec(),
	NowTime = time:getSyncTimeFromDBS(),

	NewRec =
		case NowTime - SendTime >= (RandCD - 1) of
			true ->
				DiffTime = NowTime - ClientTime,
				if
					DiffTime < -?ClientAheadReturn ->
						%%作弊了
						?LOG_OUT("Socket:~p PlayerPid:~p AccountID:~p client cheat:~p,~p",
							[userState:getUserSocket(), userState:getPlayerPid(), userState:getAccountID(), NowTime, ClientTime]),
						Rec#rec_HeartBeat{cheatCount = CCount + 1};
					DiffTime >= -?ClientAheadReturn andalso DiffTime =< ?ClientDelayReturn ->
						%%这是最好的情况
						Rec;
					true ->
						%%这逼太卡了，理论上来说，这里不会被执行到，主要是处理临界值
						?LOG_OUT("checkHeartBeat Socket:~p PlayerPid:~p AccountID:~p send early!:NowTime=~p,ClientTime=~p",
							[userState:getUserSocket(), userState:getPlayerPid(), userState:getAccountID(), NowTime, ClientTime]),
						notRecvClientHeartBeat(Rec)
				end;
			_ ->
				%% 客户端提前回协议给我了，加速了！
				?LOG_OUT("Socket:~p PlayerPid:~p AccountID:~p send early!:~p",
					[userState:getUserSocket(), userState:getPlayerPid(), userState:getAccountID(), NowTime - SendTime]),
				Rec#rec_HeartBeat{cheatCount = CCount + 1}
		end,
	userState:setHeartBeatRec(NewRec),
	ok.

notRecvClientHeartBeat(Rec) ->
	%% fixme 这里不判断没收到客户端没回检测外挂的协议，只记录日志
	?LOG_OUT("[notRecvClientHeartBeat socket:~p,accountID=~p,playerPid=~p] not recv client heartbeat msg:~p",
		[userState:getUserSocket(), userState:getAccountID(), userState:getPlayerPid(), Rec]),
	Rec.
%notRecvClientHeartBeat(#rec_HeartBeat{noRecvNumber = Times, noRecvTime = Time} = Rec) ->
%	NowTime = time:getSyncTimeFromDBS(),
%	NewRec =
%		case NowTime - Time >= ?NotRecvClientHeartBeat_Time of
%			true ->
%				%% 清零，重新累计十分钟
%				Rec#rec_HeartBeat{noRecvTime = NowTime, noRecvNumber = 1};
%			_ ->
%				%% 增加未收到次数
%				Rec#rec_HeartBeat{noRecvNumber = Times + 1}
%		end,
%	userState:setHeartBeatRec(NewRec),
%	NewRec.

sendHearBeatCDToClient() ->
	NowTime = time:getSyncTimeFromDBS(),

	%% 取个随机值
	RandCD = misc:rand(?ClientRandMin, ?ClientRandMax),

	Rec = #rec_HeartBeat{version = Vserion} = userState:getHeartBeatRec(),
	NewVersion =
		case Vserion > 2147483648 of
			true -> 1;
			_ -> Vserion + 1
		end,

	%% 通知客户端
	socketHandler:sendNetMsg(core:packNetMsg(#pk_GS2U_HeartBeatAck{time = RandCD, version = NewVersion})),

	%% 保护时间，等待接收客户端心跳最大时间
	TimerRef = erlang:send_after((RandCD + ?ClientDelayReturn) * 1000, self(), waitRecvClientHearBeatTick),

	%% 记录
	userState:setHeartBeatRec(Rec#rec_HeartBeat{rand = RandCD, timeRef = TimerRef, version = NewVersion, sendTime = NowTime}),
	ok.

checkAndDealPlayer(State) ->
	Rec = #rec_HeartBeat{cheatCount = CheatCount, noRecvNumber = Number, lastRecvHeartBeatTime = LastTime} = userState:getHeartBeatRec(),

	%% 优先处理外挂使用情况
	case CheatCount > 0 of
		true ->
			PlayerPid = userState:getPlayerPid(),
			?WARN_OUT("Socket:~p PlayerPid:~p AccountID:~p heart beat error count:~p",
				[userState:getUserSocket(), PlayerPid, userState:getAccountID(), CheatCount]),
			psMgr:sendMsg2PS(PlayerPid,checkedExtPlugin,{}),
			%% 这里遵循原来的逻辑，清掉次数
			userState:setHeartBeatRec(Rec#rec_HeartBeat{cheatCount = 0}),
			ok;
		_ ->
			ok
	end,

	NowTime = time:getSyncTimeFromDBS(),
	case NowTime - LastTime >= ?NoRecvClientHeartBeatRealTime of
		true ->
			checkAndDealPlayer_DealPlayerOffline("NoHeartBeatLongTime_HBReal", State);
		_ ->
			%% 再处理网络延迟很差的情况
			case Number >= ?NotRecvClientHeartBeat_Number of
				true ->
					checkAndDealPlayer_DealPlayerOffline("NoHeartBeatLongTime", State);
				_ ->
					{noreply, State}
			end
	end.

-ifdef(RELEASE).
checkAndDealPlayer_DealPlayerOffline(Reason, State) ->
	doUserOffline(Reason),
    {stop, normal, State}.
-else.
%% debug不掉线
checkAndDealPlayer_DealPlayerOffline(Reason, State) ->
	?WARN_OUT("Socket:~p PlayerPid:~p AccountID:~p Reason:~ts",
		[userState:getUserSocket(), userState:getPlayerPid(), userState:getAccountID(), Reason]),
    {noreply, State}.
-endif.

-spec doUserOffline(Reason) -> ok when Reason::term().
doUserOffline(Reason) ->
	case get(doUserOffline) of
		undefined->
			try
				case erlang:is_list(Reason) of
					true ->
						?LOG_OUT("player netpid[~p] offline by [~ts]",[self(),Reason]);
					_ ->
						?LOG_OUT("player netpid[~p] offline by [~p]",[self(),Reason])
				end
			catch
				_:_ ->
					?LOG_OUT("player netpid[~p] offline by [~p]",[self(),Reason])
			end,

			ets:delete( ?TABLE_PlayersSocketPidZombie,self() ), 
			%%避免重入
			put( doUserOffline, true ),
			
			Pid = userState:getPlayerPid(),
			case erlang:is_pid(Pid) of
				true ->
					psMgr:sendMsg2PS(Pid, netQuit, Reason),
					ok;
				_ ->
					skip
			end,
			
			%%保证关闭关闭socket
			Socket = userState:getUserSocket(),
			case erlang:is_port(Socket) of
				true->
					gen_tcp:close(Socket),
					userState:setUserSocket(undefined),
					ok;
				_->ok
			end,
			ok;
		_->
			skip
	end,
	ok.

%%发送消息到玩家进程，如果玩家进程与网络进程还没有关联，则发送给玩家进程管理器
sendMsgToPlayerPid(PlayerPid,Cmd,Pk) when erlang:is_pid(PlayerPid) ->
	case Pk of
		28418 ->
			?ERROR_OUT("[DebugFor28418] ~p", [misc:getStackTrace()]);
		_ ->
			skip
	end,
	psMgr:sendMsg2PS(PlayerPid, netmsg,{Cmd,Pk}),
	ok;
%%CMD_U2GS_RequestLogin   客户端登录消息
sendMsgToPlayerPid(_,?CMD_U2GS_RequestLogin,#pk_U2GS_RequestLogin{accountID = AccountID} = Login) ->
    userState:setAccountID(AccountID),
	%%?DEBUG_OUT("NetPid[~p],send login",[self()]),
	psMgr:sendMsg2PS(?PsNamePlayerMgr, login, {?CMD_U2GS_RequestLogin,Login}),
	ok;

%%CMD_U2GS_ReconnectLoginRequest   客户端断线重连消息
sendMsgToPlayerPid(_,?CMD_U2GS_ReconnectLoginRequest,#pk_U2GS_ReconnectLoginRequest{accountID = AccountID} = Login) ->
    userState:setAccountID(AccountID),
	%%?DEBUG_OUT("NetPid[~p],send login",[self()]),
	psMgr:sendMsg2PS(?PsNamePlayerMgr, reconnect, {?CMD_U2GS_ReconnectLoginRequest,Login}),
	ok;

%%CMD_U2GS_ChangeLineLoginRequest 客户端换线消息
sendMsgToPlayerPid(_,?CMD_U2GS_ChangeLineLoginRequest,#pk_U2GS_ChangeLineLoginRequest{accountID = AccountID } = CLLogin) ->
	%%?DEBUG_OUT("NetPid[~p],send login ChangeLineLoginRequest args[~w]",[self(),CLLogin]),
    userState:setAccountID(AccountID),
	psMgr:sendMsg2PS(?PsNamePlayerMgr, changeLinelogin, {?CMD_U2GS_ChangeLineLoginRequest,CLLogin}),
	ok;
sendMsgToPlayerPid(Pid,Cmd,Pk) ->
	?ERROR_OUT("client send error Pid[~p] msg[~p] cmd[~p]",[Pid,Cmd,Pk]),
	ok.

%% 同步服务器时间给客户端
-spec syncServerTimeToClient() -> ok.
syncServerTimeToClient() ->
	Time = time:getSyncTimeFromDBS(),
	socketHandler:sendNetMsg(core:packNetMsg(#pk_GS2U_SyncServerTime{time = Time})),
	ok.