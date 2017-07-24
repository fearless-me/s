%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%%
%%% @end
%%% Created : 12. 九月 2014 11:09
%%%-------------------------------------------------------------------
-module(gameMapMgrOtp).
-author("ZhongYuanWei").

-behaviour(myGenServer).

-include("mapPrivate.hrl").

%% API
-export([start_link/1]).

%% gen_server callbacks
-export([init/1,
	handle_call/3,
	handle_cast/2,
	handle_info/2,
	handle_exception/3,
	terminate/2,
	code_change/3]).

%%开启最大工作者进程数量
-define(MaxWorkOtpNum,1).
-record(state, {}).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the server
%%
%% @end
%%--------------------------------------------------------------------
-spec(start_link(Name::mapMgrType()) ->
	{ok, Pid :: pid()} | ignore | {error, Reason :: term()}).
start_link(Name) ->
	myGenServer:start_link({local,Name},?MODULE, [Name], [{timeout,?Start_Link_TimeOut_ms}]).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Initializes the server
%%
%% @spec init(Args) -> {ok, State} |
%%                     {ok, State, Timeout} |
%%                     ignore |
%%                     {stop, Reason}
%% @end
%%--------------------------------------------------------------------
-spec(init(Args :: term()) ->
	{ok, State :: #state{}} | {ok, State :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term()} | ignore).
init([Name]) ->
	erlang:process_flag(trap_exit, true),
	erlang:process_flag(priority, high),
	?LOG_OUT("~p init",[?MODULE]),
	initInternal(Name),
	?LOG_OUT("~p init OK",[?MODULE]),
	{ok, #state{}}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling call messages
%%
%% @end
%%--------------------------------------------------------------------
-spec(handle_call(Request :: term(), From :: {pid(), Tag :: term()},
	State :: #state{}) ->
	{reply, Reply :: term(), NewState :: #state{}} |
	{reply, Reply :: term(), NewState :: #state{}, timeout() | hibernate} |
	{noreply, NewState :: #state{}} |
	{noreply, NewState :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term(), Reply :: term(), NewState :: #state{}} |
	{stop, Reason :: term(), NewState :: #state{}}).
handle_call(Request, _From, State) ->
	Reply = callMsgToWorkOtp(Request),
	{reply, Reply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling cast messages
%%
%% @end
%%--------------------------------------------------------------------
-spec(handle_cast(Request :: term(), State :: #state{}) ->
	{noreply, NewState :: #state{}} |
	{noreply, NewState :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term(), NewState :: #state{}}).
handle_cast(_Request, State) ->
	{noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling all non call/cast messages
%%
%% @spec handle_info(Info, State) -> {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
-spec(handle_info(Info :: timeout() | term(), State :: #state{}) ->
	{noreply, NewState :: #state{}} |
	{noreply, NewState :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term(), NewState :: #state{}}).

%% 连上db了
handle_info({alreadyConnectDBServer, _Pid, _Msg}, State) ->
	?LOG_OUT("gameMapMgrOtp:~p connectdbserver", [self()]),
	{noreply, State};

handle_info({gm_setmlpm, _Pid, Data}, State) ->
	L = getWorkOtpList(),
	Fun =
		fun({Pid}) ->
			psMgr:sendMsg2PS(Pid, gm_setmlpm, Data)
		end,
	lists:foreach(Fun, L),
	{noreply, State};

handle_info({gm_setmapday, _Pid, Data}, State) ->
	L = getWorkOtpList(),
	Fun =
		fun({Pid}) ->
			psMgr:sendMsg2PS(Pid, gm_setmapday, Data)
		end,
	lists:foreach(Fun, L),
	{noreply, State};

%% 优化：发送消息给可能存在的地图进程进行刷怪，避免心跳误差产生的大概率刷新延迟现象
%% 2.向工作者管理者转发刷新消息
handle_info({wildbossFresh, _Pid, Msg}, State) ->
	L = getWorkOtpList(),
	Fun =
		fun({Pid}) ->
			psMgr:sendMsg2PS(Pid, wildbossFresh, Msg)
		end,
	lists:foreach(Fun, L),
	{noreply, State};

handle_info(Info, State) ->
	sendMsgToWorkOtp(Info),
	{noreply, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%%--------------------------------------------------------------------
%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
%%
%% @spec terminate(Reason, State) -> void()
%% @end
%%--------------------------------------------------------------------
-spec(terminate(Reason :: (normal | shutdown | {shutdown, term()} | term()),
	State :: #state{}) -> term()).
terminate(_Reason, _State) ->
	ok.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Convert process state when code is changed
%%
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%% @end
%%--------------------------------------------------------------------
-spec(code_change(OldVsn :: term() | {down, term()}, State :: #state{},
	Extra :: term()) ->
	{ok, NewState :: #state{}} | {error, Reason :: term()}).
code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
-spec initInternal(Name) -> ok when
  Name::mapMgrType().
initInternal(Name) ->
	case Name of
		?PSNameNormalMapMgr ->
			%%只有普通地图才创建ETS，并且读取地图配置信息，需要在服务器启动时，优先启动普通地图管理进程
			ets:new(?MapWorkInfoEts,[public,named_table,{keypos,#recKeyValue.key},{read_concurrency, true},{write_concurrency, true}]),
			%%初始化地图管理器，读取地图配置相关信息
			initGameMapMgr();
		?PSNameCopyMapMgr ->
			ok;
		_ ->
			skip
	end,
	%%开启工作者进程
	L = startMgrWorkOtp(Name,?MaxWorkOtpNum),
	setWorkOtpList(L),
	ok.

-spec sendMsgToWorkOtp(Msg) -> ok when
	Msg::term().
sendMsgToWorkOtp(Msg) ->
	Pid = getOneWorkOtp(),
	%%这里为了达到与之前的消息意义的兼容，不能使用psMgr:sendMsg2PS函数
	Pid ! Msg,
	ok.

-spec callMsgToWorkOtp(Msg::term()) -> Reply when
	Reply::term().
callMsgToWorkOtp(Msg) ->
	Pid = getOneWorkOtp(),
	gen_server:call(Pid, Msg).

-spec initGameMapMgr() -> ok.
initGameMapMgr() ->
	%%检查人物出生点是否正确
	MapID = globalCfg:getStartMap(),
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{} ->
			skip;
		_ ->
			?ERROR_OUT("Can not find StartMapID[~p] in mapsetting cfg",[MapID]),
			throw("Can not find StartMapID in mapsetting cfg")
	end,
	ok.

-spec startMgrWorkOtp(Name,N) -> list() when Name::mapMgrType(),N::uint().
startMgrWorkOtp(Name,N) ->
	List = lists:seq(1,N),
	Fun = fun(I,AccIn) ->
		case gameMapMgrWorkerOtp:start_link(Name,I) of
			{'ok', Pid} ->
				?DEBUG_OUT("start MapMgr work otp:~p",[Pid]),
				[{Pid} | AccIn];
			Reason ->
				?DEBUG_OUT("start MapMgr work otp failed[~p]",[Reason]),
				AccIn
		end
	end,
	lists:foldl(Fun,[],List).

-spec setWorkOtpList(L) -> ok when
	L::list().
setWorkOtpList(L) ->
	put(workOtpList,L),
	ok.

-spec getWorkOtpList() -> list().
getWorkOtpList() ->
	case get(workOtpList) of
		undefined ->
			?ERROR_OUT("Please set Work Otp List first"),
			[];
		List ->
			List
	end.

-spec getIdleWorkOtpList() -> list().
getIdleWorkOtpList() ->
	case get(idleWorkOtpList) of
		undefined ->
			[];
		List ->
			List
	end.

-spec setIdleWorkOtpList(L) -> ok when L::list().
setIdleWorkOtpList(L) when erlang:is_list(L)->
	put(idleWorkOtpList,L),
	ok.

-spec getOneWorkOtp() -> pid().
getOneWorkOtp() ->
	case getIdleWorkOtpList() of
		[{Pid} | T] ->
			setIdleWorkOtpList(T),
			Pid;
		_ ->
			setIdleWorkOtpList(getWorkOtpList()),
			getOneWorkOtp()
	end.