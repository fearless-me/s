%% @author zhengzhichun
%% @doc @todo Add description to loginQueue.


-module(loginQueue).
-include("setup.hrl").
-include("lsInc.hrl").
-include("loginQueue.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	dealInfo/2
]).

%%玩家进入，看需要排队不
dealInfo({inQueue, PlayerPid, AccountID}, #state{loginQueue = Que, curNum = CurNum, maxNum = MaxNum} = State) ->
	{NewQue, NewCurNum} =
		case ets:lookup(?ETSOnlineAccount, AccountID) of
			[#recLoginAccount{gsLineID = ServerID}|_] when ServerID > 0 ->
				%% 直接进入登录流程
				?LOG_OUT("inQueue online AccountID:~p", [AccountID]),
				noticePlayerPidToLogin(PlayerPid, AccountID),
				{Que, CurNum};
			_ ->
				case queue:is_empty(Que) andalso CurNum < MaxNum of
					true ->
						%% 直接进入登录流程
						?DEBUG_OUT("AccountID:~p queue empty,CurNum:~p",[AccountID, CurNum + 1]),
						noticePlayerPidToLogin(PlayerPid,AccountID),
						{Que, CurNum + 1};
					_ ->
						%% 加入队列
						?DEBUG_OUT("AccountID:~p login in queue,CurNum:~p",[AccountID, CurNum]),
						Que1 = queue:in({PlayerPid,AccountID}, Que),
						CurNumFix = freshQueueNumber(CurNum),
						{Que1, CurNumFix}
				end
		end,
	?LOG_OUT("account inQueue[~w][~w],NewCurNum[~p]", [PlayerPid,AccountID,NewCurNum]),
	{noreply, State#state{loginQueue = NewQue, curNum = NewCurNum}};

%%有人下线，在线人数减1
dealInfo({logout,_pid,AccountID}, #state{curNum = CurNum} = State) ->
	?LOG_OUT("logout[~p] event,current curNum[~w-1]",[AccountID, CurNum]),
	{noreply, State#state{curNum = erlang:max(CurNum - 1, 0)}};

%%GS注册成功，初始化该GS的可登录名额
dealInfo({canLoginNumInit, _pid, Number}, #state{curNum = CurNum, maxNum = MaxNum} = State) ->
	?WARN_OUT("canLoginNumInit[~p --> ~p, add=~p] curnum[~p]",[MaxNum, Number, Number - MaxNum, CurNum]),
	ServerID = core:getServerID(),
	Ret =
		case ets:lookup(?ETSGameServerInfo, ServerID) of
			[#recGameServer{}|_] ->
				ets:update_element(?ETSGameServerInfo, ServerID, [{#recGameServer.maxPlayer, Number}]),
				lsSendMsg:sendMsg2DBServer(updateDBInfo, {Number}),
				{noreply, State#state{maxNum = Number}};
			_ ->
				?ERROR_OUT("canLoginNumInit failed!"),
				{noreply, State}
		end,

	case getTickTimeRef() of
		undefined ->
			%% 第一次设置登陆人数，开始心跳
			setTickTimeRef(erlang:send_after(?QueTickFrequenceMillSec, self(), tick));
		_ ->
			skip
	end,
	Ret;

%%有人成功上线
dealInfo({logon, _pid, AccountID}, State) ->
	?LOG_OUT("===logon success=~w", [AccountID]),
	ets:delete(?QueCanLoginUserEts, AccountID),
	{noreply, State};

%%tick 公告排队中的玩家序号
dealInfo(tick, #state{loginQueue = Que, curNum = CurNum, maxNum = MaxNum} = State) ->
	erlang:send_after(?QueTickFrequenceMillSec, self(), tick),
	NewState =
		case lsMainOtp:getCanReachGSList(true) of
			false ->
				%% 没有GS，告诉队列中的所有玩家
				?ERROR_OUT("tick no gs list"),
				L = queue:to_list(Que),
				[psMgr:sendMsg2PS(PlayerPid, noGSList) || {PlayerPid, _AccountID} <- L],
				State#state{loginQueue = queue:new()};
			_ ->
				Now = time:getUTCNowMS(),
				%% 移除登录超时的人
				CurNum2 = erlang:max(CurNum - tickDelTimeLoginIng(Now), 0),
				%% 队列中的人开始进入登录
				{NewQue, NewCurNum} = tickQueOut(Que, CurNum2, MaxNum),
				%% 广播队列中的人序号，并且去掉已经断线的玩家
				NewQue2 = tickBroadcastQueNum(Now, NewQue),
				%% 等待下一次进入
				State#state{loginQueue = NewQue2, curNum = NewCurNum}
		end,
	{noreply, NewState};

dealInfo(Info, State) ->
	?ERROR_OUT("~p ~p @~w handle_info ~p", [?MODULE, self(), node(), Info] ),
	{noreply, State}.

%%公告玩家排队的序号(清除网络进程不在的队列)
-spec tickBroadcastQueNum(Now::integer(),Que::tuple()) ->ok|skip.
tickBroadcastQueNum(Now, Que) ->
	case loginQueueState:get(?DictBroadcastSecond) of
		Val when (erlang:is_integer(Val) andalso Val > Now) orelse Val =:= undefined ->
			loginQueueState:set(?DictBroadcastSecond, Now + ?BroadcastMillSecond),
			List = queue:to_list(Que),
			NewListReverse = broadcastQueNum(List, 1, []),
			queue:from_list(lists:reverse(NewListReverse));
		_ ->
			Que
	end.

%%tick是否有可登录名额与排队中是否有玩家，条件满足让人登录
-spec tickQueOut(Que::tuple(),CurNum::integer(),MaxNum::integer()) ->{NewQue::tuple(),NewCurNum::integer()}.
tickQueOut(Que, CurNum, MaxNum) when CurNum < MaxNum ->
	case queue:out(Que) of
		{empty, Q1} ->
			{Q1, CurNum};
		{{value, {PlayerPid,AccountID}}, Q2} ->
			case erlang:is_process_alive(PlayerPid) of
				true ->
					noticePlayerPidToLogin(PlayerPid, AccountID),
					tickQueOut(Q2, CurNum + 1, MaxNum);
				_ ->
					tickQueOut(Q2, CurNum, MaxNum)
			end
	end;
tickQueOut(Que, _CurNum, MaxNum) ->
	{Que, MaxNum}.

%%遍历队列的玩家，并告知序号
-spec broadcastQueNum(QueList::list(),Num::integer(),NewList::list()) ->list().
broadcastQueNum([],_Num,NewList) ->
	NewList;
broadcastQueNum([{PlayerPid,_Account} | QueList],Num,NewList) ->
	RealNewList =
		case erlang:is_process_alive(PlayerPid) of
			true ->
				psMgr:sendMsg2PS(PlayerPid, playerSequenceNumber, {Num}),
				[{PlayerPid,_Account} | NewList];
			false ->
				NewList
		end,
	broadcastQueNum(QueList, Num + 1, RealNewList).

%%通知玩家可以登录，并记录他的起始时间，(方便超时后归还队列数)
-spec noticePlayerPidToLogin(PlayerPid::pid(),AccountID::integer()) ->boolean().
noticePlayerPidToLogin(PlayerPid,AccountID) ->
	psMgr:sendMsg2PS(PlayerPid, canLogin),
	WaitSafe = 2, %%为了并发问题，排队超时大于key的有效时长
	EndTime = time:getUTCNowSec() + ?LSKeyExpiresSeco + WaitSafe,
	ets:insert_new(?QueCanLoginUserEts, #recQueCanLoginUserEts{endTime=EndTime,accountID=AccountID}).

%%清除过期的登录者，归还可用名额给排队系统
-spec tickDelTimeLoginIng(NowArg::integer()) -> DelNum::integer().
tickDelTimeLoginIng(NowArg) ->
	Now = NowArg div 1000,%%把毫秒转到秒
	MatchSpec = ets:fun2ms(
		fun(Row) when Row#recQueCanLoginUserEts.endTime < Now ->
			Row#recQueCanLoginUserEts.accountID
		end),
	case ets:select(?QueCanLoginUserEts, MatchSpec) of
		[] ->
			0;
		ExpiresList ->
			?DEBUG_OUT("delTimeLogining====~w",[ExpiresList]),
			lists:foreach(
				fun(Item) ->
					ets:delete(?QueCanLoginUserEts, Item)
				end, ExpiresList),
			erlang:length(ExpiresList)
	end.

%%修正并打印日志
-spec freshQueueNumber(CurNum::uint32()) ->uint().
freshQueueNumber(CurNum) ->
	{AllOnlineNum, AllConfNum} =
		case ets:lookup(?ETSGameServerInfo, core:getServerID()) of
			[#recGameServer{gameServerState = ?GameServer_State_Running} = GSRow|_] ->
				{GSRow#recGameServer.gameServerPlayerCount, GSRow#recGameServer.maxPlayer};
			_ ->
				{0, 0}
		end,

	WaitLoginNum = ets:info(?QueCanLoginUserEts,size),

	RemainNum = AllOnlineNum + WaitLoginNum,

	?LOG_OUT("fixAndLogQueue AllConfNum[~p] AllOnlineNum[~p] WaitLoginEtsNum[~p] CurNum[~p] RemainNum[~p]",
		[AllConfNum, AllOnlineNum, WaitLoginNum, CurNum, RemainNum]),
	case RemainNum /= CurNum of
		true ->
			?ERROR_OUT("RemainNum[~p] /= CurNum[~p]", [RemainNum, CurNum]),
			RemainNum;
		false ->
			CurNum
	end.

setTickTimeRef(TimeRef) ->
	put('TickTimeRef', TimeRef).
getTickTimeRef() ->
	get('TickTimeRef').