%%%dbsServer通信的进程的私有定义
-ifndef(dbsPrivate_hrl).
-define(dbsPrivate_hrl, 1).

-include("lsInc.hrl").

%与dbServer通信的进程状态
-record(recdbsState, {
	dbsNode,        % dbServer的节点名
	dbsPid          %%DBServer的通信进程ID
}).

-endif.
