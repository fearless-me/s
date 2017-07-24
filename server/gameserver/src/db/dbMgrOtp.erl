%% @author zhongyunawei
%% @doc @todo 数据库进程管理器.


-module(dbMgrOtp).
-author(zhongyuanwei).

-behaviour(myGenServer).

-include("dbPrivate.hrl").
-include("gsDef.hrl").

-define(DBPSTypeGS,1).
-define(DBPSTypeLS,2).
%%-define(DBPSTypeCS,3).

-type dbPSType() :: 1 .. 4.

%% ====================================================================
%% API functions
%% ====================================================================
-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3,handle_exception/3]).

start_link() ->
	myGenServer:start_link({local,?PsNameDB},?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

init([]) ->
	?LOG_OUT("~p init",[?MODULE]),
	process_flag(trap_exit, true),
	mysql:init(),

	%%开启为GS服务的工作进程
	L = startDBOtp(gs, ?DBOTP_GS_NUM),
	setDBOtpList(?DBPSTypeGS,L),
	setIdleOtpList(?DBPSTypeGS,L),

	%%开启为LS服务的工作进程
	LSList = startDBOtp(ls, ?DBOTP_LS_NUM),
	setDBOtpList(?DBPSTypeLS,LSList),
	setIdleOtpList(?DBPSTypeLS,LSList),

	%%通知主进程，可以初始化缓存了
	psMgr:sendMsg2PS(?PsNameDBMain,initCache,{}),

	?LOG_OUT("~p init ok",[?MODULE]),
	{ok, {}}.

handle_call(Request, _From, State) ->
	?ERROR_OUT("the function nerver be called!"),	%% 怀疑此处从未被调用
	handle_call(Request, State).

handle_cast(_Msg, State) ->
	{noreply, State}.

handle_info(Info, State)->
	handle_msg(Info,State).

terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%% ====================================================================
%% Internal functions
%% ====================================================================

handle_call({toDBOtp,_Pid,{MsgID,{PidFromGS,AccountID,Msg}}}, State)->
	R=callGSDBOtp(AccountID,MsgID,PidFromGS,Msg),
	{replay,R,State}.

handle_msg({toDBOtp,_Pid,{MsgID,{PidFromLS,ls,Msg}}}, State)->
	sendToLSDBOtp(MsgID,PidFromLS,Msg),
	{noreply, State};

handle_msg({toDBOtp,_Pid,{MsgID,{PidFromGS,AccountID,Msg}}}, State)->
	sendToGSDBOtp(AccountID,MsgID,PidFromGS,Msg),
	{noreply, State};

handle_msg(Msg, State)->
	?ERROR_OUT("unhandle Msg:[~p] in [~p] [~p,~p]",[Msg,node(),?MODULE,self()]),
	{noreply, State}.

%%开起N个DB工作进程，返回开起的DB进程列表
-spec startDBOtp(PoolType::atom(), N::uint()) -> list().
startDBOtp(PoolType, N) ->
	List = lists:seq(1, N),
	Fun =
		fun(_, AccIn) ->
			Ret = dbOtp:start_link(PoolType, addDBOtpIndex()),
			case Ret of
				{ok,Pid} ->
					%%设置该DB进程管理的角色列表为空
					setDBPidAccountList(Pid,[]),
					[{Pid} | AccIn];
				_ ->
					AccIn
			end
		end,
	lists:foldl(Fun, [], List).

%%分配消息到负责LS的某个数据库进程
sendToLSDBOtp(MsgID,PidFrom,Msg) ->
	case getIdleOtpList(?DBPSTypeLS) of
		[{Pid}|T] ->
			setIdleOtpList(?DBPSTypeLS,T),
			case erlang:is_pid(Pid) andalso erlang:is_process_alive(Pid) of
				true ->
					psMgr:sendMsg2PS(Pid,MsgID,{PidFrom,Msg});
				_ ->
					?ERROR_OUT("sendToLSDBOtp dead pid:~p", [Pid]),
					%%死亡了一个进程，需要新开一个进程
					[NewList] = startDBOtp(deadls, 1),
					%%将死亡进程从列表中删除，并加上新的进程
					DBOtpList = getDBOtpList(?DBPSTypeLS),
					L = lists:keydelete(Pid,1,DBOtpList),
					setDBOtpList(?DBPSTypeLS,[NewList | L]),

					%%重新发送
					sendToLSDBOtp(MsgID,PidFrom,Msg)
			end;
		_ ->
			%%没有空闲进程,重置并重新发送
			setIdleOtpList(?DBPSTypeLS,getDBOtpList(?DBPSTypeLS)),
			sendToLSDBOtp(MsgID,PidFrom,Msg)
	end.

-spec sendToGSDBOtp(AccountID,MsgID,PidFrom,Msg) -> ok when
	AccountID::uint(),MsgID::atom(),PidFrom::pid(),Msg::term().
sendToGSDBOtp(AccountID,MsgID,PidFrom,Msg) ->
	DBPid = case getAccountDBPid(AccountID) of
				Pid when erlang:is_pid(Pid) ->
					case erlang:is_process_alive(Pid) of
						true ->
							Pid;
						_ ->
							%%如果某个DB工作进程死掉，则需要重新分配一个进程，并处理该进程之前绑定的角色
							dealDeadDBPid(Pid),
							allocAccountIDToDBOtp(AccountID)
					end;
				undefined ->
					allocAccountIDToDBOtp(AccountID)
			end,
	%%?DEBUG_OUT("send msg[~p] to Pid[~p]",[MsgID,DBPid]),
	psMgr:sendMsg2PS(DBPid,MsgID,{PidFrom,Msg}),
	ok.


-spec callGSDBOtp(AccountID,MsgID,PidFrom,Msg) -> ok when
	AccountID::uint(),MsgID::atom(),PidFrom::pid(),Msg::term().
callGSDBOtp(AccountID,MsgID,PidFrom,Msg) ->
	DBPid =
		case getAccountDBPid(AccountID) of
			Pid when erlang:is_pid(Pid) ->
				case erlang:is_process_alive(Pid) of
					true ->
						Pid;
					_ ->
						%%如果某个DB工作进程死掉，则需要重新分配一个进程，并处理该进程之前绑定的角色
						dealDeadDBPid(Pid),
						allocAccountIDToDBOtp(AccountID)
				end;
			undefined ->
				allocAccountIDToDBOtp(AccountID)
		end,
	%%?DEBUG_OUT("send msg[~p] to Pid[~p]",[MsgID,DBPid]),
	psMgr:call(DBPid,MsgID,{PidFrom,Msg}).

%%分配一个角色到某个DB进程，并作相应的绑定处理
allocAccountIDToDBOtp(RoleID) ->
	case getIdleOtpList(?DBPSTypeGS) of
		[] ->
			setIdleOtpList(?DBPSTypeGS,getDBOtpList(?DBPSTypeGS)),
			allocAccountIDToDBOtp(RoleID);
		[{Pid}|T] ->
			setIdleOtpList(?DBPSTypeGS,T),
			%%设置角色的DB工作进程
			setAccountDBPid(RoleID,Pid),
			%%更新DB工作进程的角色列表
			L = getDBPidAccountList(Pid),
			setDBPidAccountList(Pid,lists:keystore(RoleID,1,L,{RoleID})),
			Pid
	end.

%%处理死亡了的DB进程
-spec dealDeadDBPid(Pid) -> ok when
	Pid::pid().
dealDeadDBPid(Pid) ->
	?ERROR_OUT("dealDeadDBPid:~p", [Pid]),
	%%死亡了一个进程，需要新开一个进程
	[NewList] = startDBOtp(deadgs, 1),
	%%将死亡进程从列表中删除，并加上新的进程
	DBOtpList = getDBOtpList(?DBPSTypeGS),
	L = lists:keydelete(Pid,1,DBOtpList),
	setDBOtpList(?DBPSTypeGS,[NewList | L]),
	%%获取死亡进程所管理的角色列表，并清除相应绑定信息
	AccountIDList = getDBPidAccountList(Pid),
	[setAccountDBPid(AccountID,undefined) || AccountID <- AccountIDList],
	erase(Pid),
	ok.

%%===============================================

%%设置DB工作进程列表
-spec setDBOtpList(Type,List) -> ok when
	Type::dbPSType(),List::list().
setDBOtpList(Type,List) ->
	put({Type,dbOtpList},List),
	ok.

%%获取DB工作进程列表
-spec getDBOtpList(Type) -> list() | undefined when Type::dbPSType().
getDBOtpList(Type) ->
	get({Type,dbOtpList}).

%%设置空闲DB工作进程列表
-spec setIdleOtpList(Type,List) -> undefined | List when
	Type::dbPSType(),List::list().
setIdleOtpList(Type,List) ->
	put({Type,idleOtpList},List).

%%获取空闲DB工作进程列表
-spec getIdleOtpList(Type) -> undefined | list() when Type::dbPSType().
getIdleOtpList(Type) ->
	get({Type,idleOtpList}).


%%===============================================

%%获取角色的DB工作进程PID
-spec getAccountDBPid(AccountID) -> pid() | undefined when
	AccountID::uint().
getAccountDBPid(AccountID) ->
	get({accountDBPid,AccountID}).

%%设置角色的DB工作进程PID
-spec setAccountDBPid(AccountID,DBPid) -> ok when
	AccountID::uint(),DBPid::pid() | undefined.
setAccountDBPid(AccountID,DBPid) ->
	put({accountDBPid,AccountID},DBPid),
	ok.

%%获取某个DB工作进程所管理的角色列表
-spec getDBPidAccountList(DBPid) -> list() when
	DBPid::pid().
getDBPidAccountList(DBPid) ->
	get(DBPid).

%%设置某个DB工作进程所管理的角色列表
-spec setDBPidAccountList(DBPid,List) -> ok when
	DBPid::pid(),List::list().
setDBPidAccountList(DBPid,List) ->
	put(DBPid,List),
	ok.

addDBOtpIndex() ->
	Index =
		case get('DBOtpIndex') of
			undefined ->
				1;
			V ->
				V + 1
		end,
	put('DBOtpIndex', Index),
	Index.
