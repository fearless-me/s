%%%logdbServer通信的进程的私有定义
-ifndef(logDBPrivate_hrl).
-define(LogDBPrivate_hrl,1).

-include("gsInc.hrl").

%与dbServer通信的进程状态
-record(recLogDBState, {
	logDbNode		% logDbServer的节点名
}).

%% log日志记录控制器
-define(LogWriteControlEts, logDBOtp_Ets).
-define(LogWriteOpen, 0).
-define(LogWriteClose, 1).


%% log日志缓存表
-define(LogWriteCache, logDBWorkerOtp_CacheEts).
-define(LogWriteNumber, 1000).

-endif.
