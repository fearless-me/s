%%%dbsServer通信的进程的私有定义
-ifndef(dbsPrivate_hrl).
-define(dbsPrivate_hrl, 1).

-include("gsInc.hrl").

%与dbServer通信的进程状态
-record(recdbsState, {
	dbsNode,        %% dbServer的节点名
	dbsPid,         %% DBServer的与自己通信的进程Pid
	reconnectCount  %% 重连尝试次数
}).

-endif.
