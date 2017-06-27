%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 六月 2017 14:39
%%%-------------------------------------------------------------------
-module(logger).
-author("Administrator").

-behaviour(myGenServer).

-include_lib("kernel/include/file.hrl").
-include("setup.hrl").
-include("window.hrl").
-include("logger.hrl").
-include("type.hrl").

%% API
-export([
	start_link/1
]).

%% gen_server callbacks
-export([
	init/1,
	handle_call/3,
	handle_cast/2,
	handle_info/2,
	terminate/2,
	code_change/3,
	handle_exception/3
]).

-export([
	debug/5,
	debug/6,
	setIsWriteLog/1
]).

-define(SERVER, ?MODULE).


-define(LogFileOptions,[
	exclusive,append,raw,binary
	%%,{delayed_write, 10 * 1024 * 1024, 300000}
]).

-define(ErrorLogFileOptions,[
	exclusive,append,raw,binary
]).

-define(LOGGER,    ?MODULE).
-define(MSG,       hdlt_logger_msg).
-define(LEVEL,     hdlt_logger_level).
-define(NAME,      hdlt_logger_name).

-define(MAX_LOG_CNT_ONE_FILE,100000).

-record(state, {logCnt = 0, name = default}).

getLogLevelString(?LogLevelError) ->
	"ERR";
getLogLevelString(?LogLevelWarn) ->
	"WRN";
getLogLevelString(?LogLevelDebug) ->
	"DBG";
getLogLevelString(_) ->
	"LOG".


debug(?LogLevelDebug, Sink, Fmt, Arg, Mod, Line) ->
	doLog(
		Sink,
		?LogLevelDebug,
		lists:append("[~w:~w] ", Fmt),
		lists:append([Mod, Line],Arg)
	);
debug(_LogLevel, _Sink, _Fmt, _Arg,_Mod, _Line) ->
	ok.

debug(?LogLevelDebug, Fmt, Arg, Mod, Line) ->
	doLog(
		?LogLevelDebug,
		lists:append("[~w:~w] ", Fmt),
		lists:append([Mod, Line],Arg)
	);

debug(_LogLevel, _Fmt, _Arg,_Mod, _Line) ->
	ok.

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the server
%%
%% @end
%%--------------------------------------------------------------------
start_link(NameAtom) ->
	myGenServer:start_link({local,?LOGGER},?MODULE, [NameAtom], [ {timeout,?Start_Link_TimeOut_ms}]).

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
init([NameAtom]) ->
	erlang:process_flag(trap_exit, true),
	erlang:process_flag(priority, high),
	createWindow(io_lib:format("~w",[NameAtom])),
	put('IsWriteLog', true),
	{ok, #state{name = NameAtom}}.

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
handle_call(_Request, _From, State) ->
	{reply, ok, State}.

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

handle_info({setIsWriteLog, Is}, StateData) ->
	put('IsWriteLog', Is),
	{noreply, StateData};

handle_info(Info, #state{name = NameD} = StateData) ->
	case get('IsWriteLog') of
		true ->
			case Info of
				{?MSG, Level, String, Day} ->
					handleLog(NameD, NameD, Level, String, Day),
					{noreply, StateData};
				{?MSG, Name, Level, String, Day} ->
					handleLog(NameD, Name, Level, String, Day),
					{noreply, StateData};
				{'DOWN', _Ref, process, _Object, _Info} ->
					%% start the stop timer
					erlang:send_after(5000, self(), stop),
					{noreply, StateData};
				stop ->
					{stop, normal, StateData};
				_ ->
					io:format( "hdlt_logger recv unkown msg:~p ~n", [Info] ),
					{noreply, StateData}
			end;
		_ ->
			{noreply, StateData}
	end.

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
handle_exception(Type, Why, State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

createNewLogFile( NameAtom, CreateErrLog )->
	Log_Dir = ensureLogDir(),
	{{YYYY,MM,DD}, {Hour,Min,Sec}}   = erlang:localtime(),
	Time_Format = io_lib:format(
		"~.4w-~.2.0w-~.2.0w_~.2.0w_~.2.0w_~.2.0w.log",
		[YYYY,MM,DD,Hour,Min,Sec]
	),
	closeFileHandle(getLogInfo(NameAtom)),
	doCreate(NameAtom, Log_Dir, Time_Format, CreateErrLog),
	ok.

doCreate(NameAtom, Log_Dir, Timestamp, true)->
	LogFile = makeFile(Log_Dir, Timestamp, io_lib:format("~p",[NameAtom])),
	ErrFile = makeFile(Log_Dir, Timestamp, io_lib:format("err-~p",[NameAtom])),
	putLogInfo(NameAtom,{0, LogFile, ErrFile, 0}),
	ok;
doCreate(NameAtom, Log_Dir, Timestamp, _)->
	LogFile = makeFile(Log_Dir, Timestamp, io_lib:format("~p",[NameAtom])),
	putLogInfo(NameAtom,{0, LogFile, 0, 0}),
	ok.


makeFile(LogDir, TimeStr, FileName)->
	BaseName = FileName ++ "-" ++ lists:flatten(TimeStr),
	Log_Full_FileName = LogDir ++ "/" ++ BaseName,
	{ Result, File_Handle } = file:open( Log_Full_FileName, ?LogFileOptions ),
	case Result of
		ok->
			%%写UTF8文件格式的BOM
			file:write(File_Handle, <<16#EF,16#BB,16#BF>>),
			io:format( "create log_file[~s] succ.~n", [Log_Full_FileName] );
		error->
			io:format( "create log_file[~s] fail[~w].~n", [Log_Full_FileName, File_Handle] )
	end,
	File_Handle.

ensureLogDir()->
	{ ok, Cur_Dir } = file:get_cwd(),
	Log_Dir = Cur_Dir ++ "/Log",
	case file:read_file_info(Log_Dir)of
		{ ok, FileInfo } when FileInfo#file_info.type == directory ->
			skip;
		{ error, _Reason } ->
			case file:make_dir( Log_Dir )of
				ok ->
					io:format( "create log_dir[~s] succ.~n", [Log_Dir] );
				{ error, Reason } ->
					io:format( "create log_dir[~s] failed[~w].~n", [Log_Dir, Reason] )
			end
	end,
	Log_Dir.



closeFileHandle({_Cnt, Log, ErrLog,_Day})->
	doClose(Log),
	doClose(ErrLog),
	ok.

doClose(Handle)->
	case Handle of
		0->
			ok;
		undefined->
			ok;
		_ ->
			file:close(Handle)
	end.

-spec isShowInStdio() -> boolean().
isShowInStdio() ->
	case get(isShowInStdio) of
		undefined ->
			Ret = case application:get_env(isShowInStdio) of
				      {ok,true} ->
					      true;
				      _ ->
					      false
			      end,
			setShowInStudio(Ret),
			Ret;
		Ret ->
			Ret
	end.

-spec setShowInStudio(IsShow) -> ok when IsShow::boolean().
setShowInStudio(IsShow) when erlang:is_boolean(IsShow)->
	put(isShowInStdio,IsShow),
	ok.


-spec timestamp_str(Level,F,A) -> {string(),uint()} when Level::string(),F::string(),A::list().
timestamp_str(Level,F,A) ->
	{Date, Time}   = erlang:localtime(),
	{YYYY,MM,DD}   = Date,
	{Hour,Min,Sec} = Time,
	String = io_lib:format(F,A),
	{io_lib:format("[~.4w-~.2.0w-~.2.0w ~.2.0w:~.2.0w:~.2.0w] [~ts] ~ts ~n",
		[YYYY,MM,DD,Hour,Min,Sec,Level,String]),DD}.

-spec doLog(Level, F, A) -> ok when
	Level::uint(),F::string(),A::list().
doLog(Level, F, A) ->
	{String,Day} = timestamp_str(getLogLevelString(Level),F,A),
	?LOGGER ! {?MSG, Level,String,Day},
	ok.

doLog(Sink, Level, F, A) ->
	{String,Day} = timestamp_str(getLogLevelString(Level),F,A),
	?LOGGER ! {?MSG, Sink, Level,String,Day},
	ok.


-spec setIsWriteLog(IsWriteLog::true|false) -> ok.
setIsWriteLog(IsWriteLog) ->
	?LOGGER ! {setIsWriteLog,IsWriteLog},
	ok.

handleLog(NameD, Name, Level, String, Day) ->
	NeedCreateNewFile = needCreateNewFile(getLogInfo(Name), Day),
	case NeedCreateNewFile of
		true ->
			createNewLogFile( Name, NameD =:= Name );
		_ ->
			skip
	end,
	
	{Cnt, LogFile, ErrFile, _LastDay} = getLogInfo(Name),
	case Level of
		?LogLevelError ->
			logToFile(ErrFile,String);
		_ ->
			skip
	end,
	logToFile(LogFile, String),
	addToLogWindow(Level,String),
	put(Name,{Cnt + 1, LogFile, ErrFile, Day}),
	ok.

-spec logToFile(FileHandle,String) -> ok when
	FileHandle::file:io_device(),String::string().
logToFile(0,_String) ->
	skip;
logToFile(FileHandle,String) ->
	file:write(FileHandle,String),
	ok.

needCreateNewFile(undefine, _Day)->
	true;
needCreateNewFile({Line, LogFile, _ErrFile, LastDay}, Day)->
	LogFile =:= undefined orelse
		LogFile =:= 0 orelse
		(LastDay =/= 0 andalso LastDay =/= Day ) orelse
		Line >= ?MAX_LOG_CNT_ONE_FILE.


putLogInfo(K, V)->
	put(K, V).

getLogInfo(Atom)->
	case get(Atom) of
		undefined ->
			{0,0,0,0};
		V->
			V
	end.


-spec createWindow(Log_File_Name) -> ok when Log_File_Name::string().
-ifdef(RELEASE).
createWindow(_Log_File_Name) ->
	?LOG_OUT("Cur Is Release Version"),
	ok.
-else.
createWindow(Log_File_Name) ->
	?LOG_OUT("Cur Is Debug Version"),
	WinPid = window:create_window(Log_File_Name, "", 800, 600),
	put("WinPid", WinPid),
	ok.
-endif.


-ifdef(RELEASE).

-spec addToLogWindow(MsgLevel,String) -> ok when
	MsgLevel::uint(),String::string().
addToLogWindow(_MsgLevel,_String) ->
	ok.

-else.
-spec addToLogWindow(MsgLevel,String) -> ok when
	MsgLevel::uint(),String::string().
addToLogWindow(MsgLevel,String) ->


	try
		case get("WinPid") of
			undefined ->
				skip;
			WinPid ->
				erlang:spawn(
					fun()->
						window:insert_record(WinPid, String, MsgLevel),
						io:format("~ts", [str:utf8_to_utf16(String)])
					end)

		end
	catch
		_:_ ->
			%%注意，此处不能再throw出去，因为本模块是从myGenServer派生，，
			%%throw出的异常在myGenServer中处理异常还会调用本模块打印日志,这样会出现死循环
			skip
	end,
	ok.
-endif.