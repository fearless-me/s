%%
%% %CopyrightBegin%
%%
%% Copyright Ericsson AB 2010. All Rights Reserved.
%%
%% The contents of this file are subject to the Erlang Public License,
%% Version 1.1, (the "License"); you may not use this file except in
%% compliance with the License. You should have received a copy of the
%% Erlang Public License along with this software. If not, it can be
%% retrieved online at http://www.erlang.org/.
%%
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and limitations
%% under the License.
%%
%% %CopyrightEnd%
%%
%%----------------------------------------------------------------------
%% Purpose: This is a simple logger utility for the HDLT toolkit.
%%          It assumesd that the debug level and the "name" of the 
%%          logging entity has been put in process environment
%%          (using the set_level and set_name functions respectively).
%%----------------------------------------------------------------------

%%

-module(hdlt_logger).

-include_lib("kernel/include/file.hrl").
-include("setup.hrl").
-include("window.hrl").
-include("logger.hrl").
-include("type.hrl").

-behaviour(myGenServer).

-export([start_link/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3,handle_exception/3]).
-record(state, {monitorRef,logCnt}).

-export([
	error_out/3,
	warn_out/3,
	log/3,
	debug/3,
	setIsWriteLog/1
]).

-export([initEnv/1]).

-define(LOGGER,    ?MODULE).
-define(MSG,       hdlt_logger_msg).
-define(LEVEL,     hdlt_logger_level).
-define(NAME,      hdlt_logger_name).

-define(MAX_LOG_CNT_ONE_FILE,100000).

getLogLevelString(?LogLevelError) ->
	"ERR";
getLogLevelString(?LogLevelWarn) ->
	"WRN";
getLogLevelString(?LogLevelDebug) ->
	"DBG";
getLogLevelString(_) ->
	"LOG".

%%设置日志文件和错误文件的相关选项
-ifdef(RELEASE).
-define(LogFileOptions,[
	exclusive,append,raw,binary
	%%,{delayed_write, 10 * 1024 * 1024, 300000}
]).

-define(ErrorLogFileOptions,[
	exclusive,append,raw,binary
]).
-else.
-define(LogFileOptions,[
	exclusive,append,raw,binary
]).
-define(ErrorLogFileOptions,[
	exclusive,append,raw,binary
]).
-endif.

start_link(Log_File_Name) ->
	ParentPid = self(),
	myGenServer:start_link({local,?LOGGER},?MODULE, [Log_File_Name,ParentPid], [ {timeout,?Start_Link_TimeOut_ms}]).

init([Log_File_Name,ParentPid]) ->
	erlang:process_flag(trap_exit, true),
	erlang:process_flag(priority, high),
	{encoding,Encoding} = lists:keyfind(encoding, 1, io:getopts()),
	case Encoding of
		unicode ->
			skip;
		_ ->
			ok = io:setopts([{encoding,unicode}]),
			?LOG_OUT("设置控制台编码为Unicode,old:~p", [Encoding])
	end,
	CurLogLevel = ?LOG_LEVEL,
	?LOG_OUT("当前logLevel Is:~ts",[getLogLevelString(CurLogLevel)]),
	?LOG_OUT("当前控制台选项: ~p",[io:getopts()]),
	?LOG_OUT("当前Erlang版本：~p",[erlang:system_info(version)]),
	?LOG_OUT("~p begin init", [?MODULE]),
	Ref = initLogger( Log_File_Name,ParentPid ),
    {ok, #state{monitorRef = Ref,logCnt = 0}}.

handle_call(_Request, _From, State) ->
    {noreply, ok, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.


terminate(Reason, State) ->
	?LOG_OUT("Module[~p] terminate by[~p],State[~p]",[?MODULE,Reason,State]),
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%%错误消息不管在什么等级都需要记录下来
-spec error_out(LogLevel,Fmt, Arg) -> ok when
	LogLevel::uint(),Fmt::string(),Arg::list().
error_out(?LogLevelSlient,Fmt, Arg) ->
	do_log(?LogLevelError,Fmt, Arg);
error_out(?LogLevelError,Fmt, Arg) ->
	do_log(?LogLevelError,Fmt, Arg);
error_out(?LogLevelWarn,Fmt, Arg) ->
	do_log(?LogLevelError,Fmt, Arg);
error_out(?LogLevelLog,Fmt, Arg) ->
	do_log(?LogLevelError,Fmt, Arg);
error_out(?LogLevelDebug,Fmt, Arg) ->
	do_log(?LogLevelError,Fmt, Arg).

%%警告等级，只有当前等级达到此等级才记录下来
warn_out(?LogLevelSlient,_Fmt, _Arg) ->
	ok;
warn_out(?LogLevelError,_Fmt, _Arg) ->
	ok;
warn_out(?LogLevelWarn,Fmt, Arg) ->
	do_log(?LogLevelWarn,Fmt, Arg);
warn_out(?LogLevelLog,Fmt, Arg) ->
	do_log(?LogLevelWarn,Fmt, Arg);
warn_out(?LogLevelDebug,Fmt, Arg) ->
	do_log(?LogLevelWarn,Fmt, Arg).

%%普通记录等级，只有当前等级达到此等级才记录下来
-spec log(LogLevel,Fmt, Arg) -> ok when
	LogLevel::uint(),Fmt::string(),Arg::list().
log(?LogLevelSlient,_Fmt, _Arg) ->
	ok;
log(?LogLevelError,_Fmt, _Arg) ->
	ok;
log(?LogLevelWarn,_Fmt, _Arg) ->
	ok;
log(?LogLevelLog,Fmt, Arg) ->
	do_log(?LogLevelLog,Fmt, Arg);
log(?LogLevelDebug,Fmt, Arg) ->
	do_log(?LogLevelLog,Fmt, Arg).

%%调试记录等级，只有当前等级达到此等级才记录下来
-spec debug(LogLevel,Fmt, Arg) -> ok when
	LogLevel::uint(),Fmt::string(),Arg::list().
debug(?LogLevelSlient,_Fmt, _Arg) ->
	ok;
debug(?LogLevelError,_Fmt, _Arg) ->
	ok;
debug(?LogLevelWarn,_Fmt, _Arg) ->
	ok;
debug(?LogLevelLog,_Fmt, _Arg) ->
	ok;
debug(?LogLevelDebug,Fmt, Arg) ->
	do_log(?LogLevelDebug,Fmt, Arg).

-spec formated_timestamp(Level,F,A) -> {string(),uint()} when Level::string(),F::string(),A::list().
formated_timestamp(Level,F,A) ->
	{Date, Time}   = erlang:localtime(),
	{YYYY,MM,DD}   = Date,
	{Hour,Min,Sec} = Time,
	String = io_lib:format(F,A),
	{io_lib:format("[~.4w-~.2.0w-~.2.0w ~.2.0w:~.2.0w:~.2.0w] [~ts] ~ts ~n",
		[YYYY,MM,DD,Hour,Min,Sec,Level,String]),DD}.

-spec do_log(Level, F, A) -> ok when
	Level::uint(),F::string(),A::list().
do_log(Level, F, A) ->
	{String,Day} = formated_timestamp(getLogLevelString(Level),F,A),
	?LOGGER ! {?MSG,Level,String,Day},
	ok.

-spec setIsWriteLog(IsWriteLog::true|false) -> ok.
setIsWriteLog(IsWriteLog) ->
	?LOGGER ! {setIsWriteLog,IsWriteLog},
	ok.

-spec initLogger(Log_File_Name,Parent) -> reference() when
	Log_File_Name::string(),Parent::pid().
initLogger(Log_File_Name,Parent) ->
	put(?NAME, Log_File_Name),
    Ref = erlang:monitor(process, Parent),
	createWindow(Log_File_Name),
	make_log_file( Log_File_Name ),
	put('IsWriteLog', true),
	Ref.

%%初始化环境变量
-spec initEnv(ApplictionTitle) -> ok when
	ApplictionTitle::string().
initEnv(ApplictionTitle) ->
	application:set_env(localLog,serverType,ApplictionTitle),
	
	case application:get_env(isShowInStdio) of
		{ok,IsShowInStdio} ->
			application:set_env(localLog,isShowInStdio,IsShowInStdio);
		_ ->
			application:set_env(localLog,isShowInStdio,true)
	end,
	ok.

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

handle_info({setIsWriteLog, Is}, StateData) ->
	put('IsWriteLog', Is),
	{noreply, StateData};

handle_info(Info, #state{monitorRef=Ref,logCnt=Cnt}=StateData) ->
	case get('IsWriteLog') of
		true ->
			case Info of
				{?MSG, Level, String, Day} ->
					LineCount = handle_log(Level, String, Day, Cnt),
					{noreply, #state{monitorRef = Ref,logCnt = LineCount}};
				newfile -> %%写入一个新的文件
					make_log_file( get(?NAME) ),
					{noreply, #state{monitorRef = Ref,logCnt = 0}};
				{'DOWN', Ref, process, _Object, _Info} ->
					%% start the stop timer
					erlang:send_after(5000, self(), stop),
					{noreply, StateData};
				stop ->
					{stop, normal, StateData};
				Unkown ->
					io:format( "hdlt_logger recv unkown msg:~p ~n", [Unkown] ),
					{noreply, StateData}
			end;
		_ ->
			{noreply, StateData}
	end.


handle_log(Level, String, Day, Cnt) ->
	Cnt0 = try
		       Count = case get(lastLogDay) of
			               undefined ->
				               Cnt;
			               Day ->
				               Cnt;
			               _ ->
				               %%如果是新的一天，则重新建立一个日志文件
				               make_log_file( get(?NAME) ),
				               0
		               end,
		       put(lastLogDay,Day),
		       case Level of
			       ?LogLevelError ->
				       logToFile(getErrorLogFileHandle(),String),
				       %%错误日志不仅要记录到错误日志文件，还需要记录到普通日志文件，以方便查阅
				       logToFile(getLogFileHandle(),String);
			       _ ->
				       logToFile(getLogFileHandle(),String)
		       end,
		       Count
	       catch
		       _:_Throw ->
			       %%写文件一旦出现问题，则不能再使用原来的文件句柄进行写入了，否则还是会出现异常
			       make_log_file( get(?NAME) ),
			       0
	       end,
	addToLogWindow(Level,String),
	Cnt1 = Cnt0 + 1,
	case Cnt1 > ?MAX_LOG_CNT_ONE_FILE of
		true ->
			make_log_file( get(?NAME) ),
			0;
		_ ->
			Cnt1
	end.

-spec logToFile(FileHandle,String) -> ok when
	FileHandle::file:io_device(),String::string().
logToFile(FileHandle,String) ->
	file:write(FileHandle,String),
	ok.

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
			_ ->
				window:insert_record(get("WinPid"), String, MsgLevel)
		end,
		case isShowInStdio() of
			true ->
				Str = str:utf8_to_utf16(String),
				io:format("~ts", [Str]);
			_ ->
				skip
		end
	catch
		_:_ ->
			%%注意，此处不能再throw出去，因为本模块是从myGenServer派生，，
			%%throw出的异常在myGenServer中处理异常还会调用本模块打印日志,这样会出现死循环
			skip
	end,
	ok.
-endif.

-spec make_log_file( Log_File_Name )-> boolean() when
	Log_File_Name::string().
make_log_file( Log_File_Name )->
	case getLogFileHandle() of
		0->
			ok;
		undefined->
			ok;
		Handle1->
			file:close(Handle1)
	end,
	case getErrorLogFileHandle() of
		0->
			ok;
		undefined->
			ok;
		Handle2->
			file:close(Handle2)
	end,
	{ ok, Cur_Dir } = file:get_cwd(),
	Log_Dir = Cur_Dir ++ "/../data/Log",
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
	{Date, Time}   = erlang:localtime(),
    {YYYY,MM,DD}   = Date,
    {Hour,Min,Sec} = Time,
	Time_Format = io_lib:format("~.4w-~.2.0w-~.2.0w_~.2.0w_~.2.0w_~.2.0w.log",
                      [YYYY,MM,DD,Hour,Min,Sec]),
	BaseName = Log_File_Name ++ "-" ++ lists:flatten(Time_Format),
	Log_Full_FileName = Log_Dir ++ "/" ++ BaseName,
	Log_Full_FileName_For_Err = Log_Dir ++ "/err-" ++ BaseName,
	{ Result, File_Handle } = file:open( Log_Full_FileName, ?LogFileOptions ),
	case Result of
		ok->
			setLogFileHandle( File_Handle ),
			%%写UTF8文件格式的BOM
			file:write(File_Handle, <<16#EF,16#BB,16#BF>>),
			io:format( "create log_file[~s] succ.~n", [Log_Full_FileName] );
		error->
			io:format( "create log_file[~s] fail[~w].~n", [Log_Full_FileName, File_Handle] )
	end,
	{ Result1, File_Handle_ForError } = file:open( Log_Full_FileName_For_Err, ?ErrorLogFileOptions ),
	case Result1 of
		ok->
			setErrorLogFileHandle( File_Handle_ForError ),
			%%写UTF8文件格式的BOM
			file:write(File_Handle_ForError, <<16#EF,16#BB,16#BF>>),
			io:format( "create err_log_file[~s] succ.~n", [Log_Full_FileName_For_Err] ),
			true;
		error->
			io:format( "create err_log_file[~s] fail[~w].~n", [Log_Full_FileName_For_Err, File_Handle_ForError] ),
			false
	end.

getLogFileHandle() ->
	get( log_File_Handle ).

setLogFileHandle(Handle) ->
	put( log_File_Handle, Handle ),
	ok.

getErrorLogFileHandle() ->
	get( error_Log_File_Handle ).

-spec setErrorLogFileHandle(Handle) -> ok when Handle::pid().
setErrorLogFileHandle(Handle) ->
	put( error_Log_File_Handle, Handle ),
	ok.

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
