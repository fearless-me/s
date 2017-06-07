-ifndef(CSMail_HRL).
-define(CSMail_HRL,1).

-include("gsInc.hrl").

-define(SimpleMail, 0). % 普通邮件
-define(SystemMail, 1). % 系统邮件

%% 延迟获取邮件列表
-define(Dealy_Get_Mail_List, 1000).

%% 判断邮件过期心跳时间
-define(Judge_TimeOut_Tick, 5 * 60 * 1000).

%% 每次查询多少个
-define(QueryNumberEveryTimes, 10000).

%% 1天的秒数
-define(SECONDS_PER_DAY, 86400).

%% 玩家收到邮件后，延时多久通知
-define(DELAY_NOTICE_RECEIVEMAIL, 5000).

-endif.
