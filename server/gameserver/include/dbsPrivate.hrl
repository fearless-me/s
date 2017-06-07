%%%dbsServer通信的进程的私有定义
-ifndef(dbsPrivate_hrl).
-define(dbsPrivate_hrl,1).

%与dbServer通信的进程状态
-record(recdbsState,{
					dbsNode,		% dbServer的节点名
					dbsPid			%%DBServer的进程Pid
					}).

-define( PsNameLog_LS, lsLogDBPid ).
-record(recLogDBNode_LS, { key, logDBNode  }).

-endif.
