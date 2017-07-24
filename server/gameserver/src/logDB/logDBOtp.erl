%% @author zhongyuanwei
%% @doc @todo 数据库log操作进程.

-module(logDBOtp).
-author(zhongyuanwei).

-behaviour(myGenServer).

-include("mysql.hrl").
-include("setup.hrl").
-include("logger.hrl").
-include("logDBPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3,handle_exception/3]).

start_link() ->
	myGenServer:start_link({local,?LogDBPID},?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

init([]) ->
	?LOG_OUT("~p init",[?MODULE]),

	%% 开启几个工作者进程
	PidList = startLogWorkerOtp(?LogDBWorkerOtp_NUM),
	%% 保存
	setLogWorkerPidList(PidList),

	ets:new(?LogWriteControlEts, [protected, named_table, {read_concurrency, true}, {keypos,1}]),

	?LOG_OUT("~p init ok",[?MODULE]),
	{ok, {}}.

handle_call(_Request, _From, State) ->
	{noreply, State}.

handle_cast(_Msg, State) ->
	{noreply, State}.

handle_info({99999, Data}, State)->
	?WARN_OUT("change_Save_Log_ToDB:~p", [Data]),
	ets:update_element(?LogWriteControlEts, 1, {2, Data}),
	{noreply, State};

handle_info({tick_saveCacheLog = MsgID, Pid, Msg}, State)->
	PidList = getLogWorkerPidList(),
	[psMgr:sendMsg2PS(Pid, MsgID, Msg) || Pid <- PidList],
	{noreply, State};

handle_info({MsgID, _Pid, Msg}, State)->
	sendToLogDBOtp(MsgID, Msg),
	{noreply, State};

handle_info(Info,State) ->
	?ERROR_OUT("unhandle info:[~p] in [~p] [~p,~p]",[Info,node(),?MODULE,self()]),
	{noreply,State}.

terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%% ====================================================================
%% Internal functions
%% ====================================================================
%% 交给工作者进程写log
-spec sendToLogDBOtp(MsgID::term(), Msg::term()) -> ok.
sendToLogDBOtp(MsgID, Msg) ->
	LogPid = allocLogWorkerPid(),
	case erlang:is_pid(LogPid) andalso erlang:is_process_alive(LogPid) of
		true ->
			psMgr:sendMsg2PS(LogPid, MsgID, Msg);
		_ ->
			?ERROR_OUT("sendToLogDBOtp:~p", [LogPid]),

			%% 进程死掉
			L = getLogWorkerPidList(),
			NL = lists:delete(LogPid, L),
			[NewPid] = startLogWorkerOtp(1),
			setLogWorkerPidList([NewPid | NL]),

			%% 重新发送
			psMgr:sendMsg2PS(NewPid, MsgID, Msg)
	end,
	ok.

%%开起N个DB工作进程，返回开起的DB进程列表
-spec startLogWorkerOtp(N::integer()) -> [pid(), ...].
startLogWorkerOtp(N) ->
	List = lists:seq(1, N),
	Fun =
		fun(_, AccIn) ->
			Ret = logDBWorkerOtp:start_link(addLogDBOtpIndex()),
			case Ret of
				{ok, Pid} ->
					[Pid | AccIn];
				_ ->
					AccIn
			end
		end,
	PidList = lists:foldl(Fun, [], List),
	?LOG_OUT("startLogWorkerOtp:~p", [PidList]),
	PidList.

addLogDBOtpIndex() ->
	Index =
		case get('LogDBOtpIndex') of
			undefined ->
				1;
			V ->
				V + 1
		end,
	put('LogDBOtpIndex', Index),
	Index.

%% 日志工作者进程列表
setLogWorkerPidList(List) ->
	put('LogWorkerPidList', List).
getLogWorkerPidList() ->
	case get('LogWorkerPidList') of
		undefined -> [];
		List -> List
	end.

setTempLogWorkerPidList(List) ->
	put('TempLogWorkerPidList', List).
getTempLogWorkerPidList() ->
	case get('TempLogWorkerPidList') of
		undefined -> getLogWorkerPidList();
		[] -> getLogWorkerPidList();
		List -> List
	end.

%% 分配一个日志进程
allocLogWorkerPid() ->
	[Pid | L] = getTempLogWorkerPidList(),
	setTempLogWorkerPidList(L),
	Pid.