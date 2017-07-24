-ifndef(Logger_hrl).
-define(Logger_hrl, 1).

-include("setup.hrl").

%%静默日志等级，不输出任何日志
-define(LogLevelSlient,0).
%%错误日志等级，只输出错误
-define(LogLevelError,1).
%%警告日志等级，输出错误和警告
-define(LogLevelWarn,2).
%%普通日志等级，输出错误、警告和普通日志
-define(LogLevelLog,3).
%%调试日志等级，输出错误、警告、普通日志和调试信息
-define(LogLevelDebug,4).

-ifdef(RELEASE).
-define(LOG_LEVEL,?LogLevelLog).
-else.
-define(LOG_LEVEL,?LogLevelDebug).
-endif.

-define(ERROR_OUT(F, A),    hdlt_logger:error_out(?LOG_LEVEL,lists:append("[~w:~w] ", F),lists:append([?MODULE, ?LINE],A))).
-define(ERROR_OUT(F),       hdlt_logger:error_out(?LOG_LEVEL,lists:append("[~w:~w] ", F),[?MODULE, ?LINE])).
-define(WARN_OUT(F,A),      hdlt_logger:warn_out(?LOG_LEVEL,lists:append("[~w:~w] ", F),lists:append([?MODULE, ?LINE],A))).
-define(WARN_OUT(F),        hdlt_logger:warn_out(?LOG_LEVEL,lists:append("[~w:~w] ", F),[?MODULE, ?LINE])).
-define(LOG_OUT(F, A),      hdlt_logger:log(?LOG_LEVEL,lists:append("[~w:~w] ", F),lists:append([?MODULE, ?LINE],A))).
-define(LOG_OUT(F),         hdlt_logger:log(?LOG_LEVEL,lists:append("[~w:~w] ", F),[?MODULE, ?LINE])).

-ifdef(RELEASE).
%% RELEASE不显示DEBUG日志
-define(DEBUG_OUT(F, A),    ok).
-define(DEBUG_OUT(F),       ok).
-else.
-define(DEBUG_OUT(F, A),    hdlt_logger:debug(?LOG_LEVEL, F, A, ?MODULE, ?LINE)).
-define(DEBUG_OUT(F),       hdlt_logger:debug(?LOG_LEVEL, F, [], ?MODULE, ?LINE)).
-endif.

-define(DefaultMsgLevel, 0).
-define(DebugMsgLevel, 1).
-define(ErrorMsgLevel, 2).
-define(WarnMsgLevel,3).

%% 为了调试时便于追踪多个ErrorCode的来源
-ifndef(RELEASE).
-define(ERROR_CODE(C),			_={?DEBUG_OUT("[DebugForErrorCode] ~p []", [C]), playerMsg:sendErrorCodeMsg(C)}).
-define(ERROR_CODE(C, P),		_={?DEBUG_OUT("[DebugForErrorCode] ~p ~p", [C, P]), playerMsg:sendErrorCodeMsg(C, P)}).
-define(ERROR_CODE(N, C, P),	_={?DEBUG_OUT("[DebugForErrorCode] ~p ~p", [C, P]), playerMsg:sendErrorCodeMsg(N, C, P)}).
-else.
-define(ERROR_CODE(C),			playerMsg:sendErrorCodeMsg(C)).
-define(ERROR_CODE(C, P),		playerMsg:sendErrorCodeMsg(C, P)).
-define(ERROR_CODE(N, C, P),	playerMsg:sendErrorCodeMsg(N, C, P)).
-endif.	%% RELEASE

-define(ERROR_CODE_Ex(R, C),	case core:queryNetPidByRoleID(RoleID) of offline -> skip; NetPid -> ?ERROR_CODE(NetPid, C, []) end).
-define(ERROR_CODE_Ex(R, C, P),	case core:queryNetPidByRoleID(RoleID) of offline -> skip; NetPid -> ?ERROR_CODE(NetPid, C, P) end).

-endif. % -ifdef(hdlt_logger_hrl).


