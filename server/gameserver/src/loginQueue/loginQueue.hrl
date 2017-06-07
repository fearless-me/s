-ifndef(LOGINQUEUE_HRL).
-define(LOGINQUEUE_HRL,1).

-define(QueTickFrequenceMillSec,600).

-define(DictBroadcastSecond,broadcastSecond).
-define(BroadcastMillSecond,3000).%%毫秒

-define(QueCanLoginUserEts,queCanLoginUserEts).%%允许登录玩家的超时回收表名
-record(recQueCanLoginUserEts, {
	accountID::integer(),
	endTime::integer()%%UTC秒
}).

-record(state, {
	loginQueue,
	canLoginNum = 0
}).

-endif.