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
dealInfo({inQueue,PlayerPid,AccountID}, #state{loginQueue =Que,canLoginNum =CanLoginNum} = State) ->
	{NewQue, NewCanLoginNum} =
		case ets:lookup(?ETSOnlineAccount, AccountID) of
			[#recLoginAccount{gsLineID = GSID}|_] when GSID > 0 ->
				?LOG_OUT("inQueue online AccountID:~p", [AccountID]),
				noticePlayerPidToLogin(PlayerPid, AccountID),
				{Que, CanLoginNum};
			_ ->
				case queue:is_empty(Que) andalso CanLoginNum > 0 of
					true ->
						?DEBUG_OUT("AccountID:~p queue empty,CanLoginNum:~p",[AccountID,CanLoginNum - 1]),
						noticePlayerPidToLogin(PlayerPid,AccountID),
						{Que,CanLoginNum-1};
					_ ->
						?DEBUG_OUT("AccountID:~p login in queue,CanLoginNum:~p",[AccountID,CanLoginNum]),
						Que1 = queue:in({PlayerPid,AccountID}, Que),
						CanLoginNumFix = freshQueueNumber(CanLoginNum),
						{Que1, CanLoginNumFix}
				end
		end,
	?LOG_OUT("account inQueue[~w][~w],NewCanLoginNum[~p]", [PlayerPid,AccountID,NewCanLoginNum]),
	{noreply, State#state{loginQueue = NewQue,canLoginNum = NewCanLoginNum}};

%%有人下线，增加可登录名额
dealInfo({logout,_pid,AccountID}, #state{canLoginNum =CanLoginNum} = State) ->
	?LOG_OUT("logout[~p] event,current canLoginNum[~w+1]",[AccountID,CanLoginNum]),
	case ets:lookup(?ETSGameServerInfo, core:getServerID()) of
		[#recGameServer{gameServerPlayerCount =GameServerPlayerCount,maxPlayer= MaxNum}|_] when GameServerPlayerCount < MaxNum ->
			{noreply, State#state{canLoginNum =CanLoginNum+1}};
		_ ->
			{noreply, State}
	end;

%%GS注册成功，初始化该GS的可登录名额
dealInfo({canLoginNumInit, _pid, {GSID,Num,MaxNum}}, #state{canLoginNum =_CanLoginNum}=State) ->
	?LOG_OUT("canLoginNumInit[~w+~w] gsid[~w]",[Num,MaxNum,GSID]),
	case ets:lookup(?ETSGameServerInfo, GSID) of
		[#recGameServer{gameServerPlayerCount =GameServerPlayerCount }|_] when GameServerPlayerCount < MaxNum ->
			{noreply, State#state{canLoginNum =Num}};
		_ ->
			{noreply, State}
	end;

%%有人成功上线
dealInfo({logon,_pid,AccountID}, State) ->
	?LOG_OUT("===logon success=~w",[AccountID]),
	ets:delete(?QueCanLoginUserEts, AccountID),
	{noreply, State};

%%tick 公告排队中的玩家序号
dealInfo(tick, #state{loginQueue =Que,canLoginNum =CanLoginNum} = State) ->
	Now = time:getUTCNowMS(),
	CurrCanLoginNum = tickDelTimeLogining(Now)+CanLoginNum,
	{NewQue, NewNum} =
		case lsMainOtp:getCanReachGSList(true) of
			false ->
				L = queue:to_list(Que),
				[psMgr:sendMsg2PS(PlayerPid, noGSList) || {PlayerPid,_AccountID} <- L],
				{queue:new(),0};
			_ ->
				tickQueOut(Que,CurrCanLoginNum)
		end,
	NewQue2 = tickBoardcastQueNum(Now, NewQue),

	erlang:send_after(?QueTickFrequenceMillSec, self(), tick),
%% 	?DEBUG_OUT("tick ~w",[CanLoginNum]),
	{noreply, State#state{loginQueue =NewQue2,canLoginNum =NewNum}};

dealInfo(Info, State) ->
	?ERROR_OUT("~p ~p @~w handle_info ~p", [?MODULE, self(), node(), Info] ),
	{noreply, State}.

%%公告玩家排队的序号(清除网络进程不在的队列)
-spec tickBoardcastQueNum(Now::integer(),Que::tuple()) ->ok|skip.
tickBoardcastQueNum(Now, Que) ->
	case loginQueueState:get(?DictBroadcastSecond) of
		Val when (erlang:is_integer(Val) andalso Val > Now) orelse Val =:= undefined ->
			loginQueueState:set(?DictBroadcastSecond, Now+?BroadcastMillSecond),
			List = queue:to_list(Que),
			NewListReverse = boardcastQueNum(List, 1, []),
			NewList = lists:reverse(NewListReverse),
			queue:from_list(NewList);
		_ ->
			Que
	end.

%%tick是否有可登录名额与排队中是否有玩家，条件满足让人登录
-spec tickQueOut(Que::tuple(),Num::integer()) ->{NewQue::tuple(),NewNum::integer()}.
tickQueOut(Que, 0) ->
	{Que, 0};
tickQueOut(Que, Num) ->
	case queue:out(Que) of
		{empty, Q1} ->
			{Q1,Num};
		{{value, {PlayerPid,AccountID}}, Q2} ->
			case erlang:is_process_alive(PlayerPid) of
				true ->
					noticePlayerPidToLogin(PlayerPid, AccountID),
					tickQueOut(Q2, Num-1);
				_ ->
					%% 	TODO zzc offline can continue in que? 2
					tickQueOut(Q2, Num)
			end
	end.

%%遍历队列的玩家，并告知序号
-spec boardcastQueNum(QueList::list(),Num::integer(),NewList::list()) ->list().
boardcastQueNum([],_Num,NewList) ->
	NewList;
boardcastQueNum([{PlayerPid,_Account} | QueList],Num,NewList) ->
	RealNewList =
		case erlang:is_process_alive(PlayerPid) of
			true ->
				psMgr:sendMsg2PS(PlayerPid, playerSequenceNumber, {Num}),
				[{PlayerPid,_Account} | NewList];
			false ->
				NewList
		end,
	boardcastQueNum(QueList,Num+1,RealNewList).

%%通知玩家可以登录，并记录他的起始时间，(方便超时后归还队列数)
-spec noticePlayerPidToLogin(PlayerPid::pid(),AccountID::integer()) ->boolean().
noticePlayerPidToLogin(PlayerPid,AccountID) ->
	psMgr:sendMsg2PS(PlayerPid, canLogin),
	WaitExpriesSafe = 2,%%为了并发问题，排队超时大于key的有效时长
	EndTime = time:getUTCNowSec()+?LSKeyExpiresSeco+WaitExpriesSafe,
	ets:insert_new(?QueCanLoginUserEts, #recQueCanLoginUserEts{endTime=EndTime,accountID=AccountID}).

%%清除过期的登录者，归还可用名额给排队系统
-spec tickDelTimeLogining(NowArg::integer()) ->DelNum::integer().
tickDelTimeLogining(NowArg) ->
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
-spec freshQueueNumber(CanLoginNum::uint32()) ->uint().
freshQueueNumber(CanLoginNum) ->
	{AllOnlineNum, AllConfNum} =
		case ets:lookup(?ETSGameServerInfo, core:getServerID()) of
			[#recGameServer{gameServerState = ?GameServer_State_Running}] = GSRow ->
				{GSRow#recGameServer.gameServerPlayerCount, GSRow#recGameServer.maxPlayer};
			_ ->
				{0, 0}
		end,

	WaitLoginNum = ets:info(?QueCanLoginUserEts,size),

	RemainNum = AllConfNum - AllOnlineNum - WaitLoginNum,

	?LOG_OUT("fixAndLogQueue AllConfNum[~p] AllOnlineNum[~p] WaitLoginEtsNum[~p] CanLoginNum[~p] RemainNum[~p]",
		[AllConfNum, AllOnlineNum, WaitLoginNum, CanLoginNum, RemainNum]),
	case RemainNum > CanLoginNum of
		true ->
			?ERROR_OUT("RemainNum[~p] > CanLoginNum[~p]", [RemainNum, CanLoginNum]),
			RemainNum;
		false ->
			CanLoginNum
	end.
 