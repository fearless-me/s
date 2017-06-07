-ifndef(Main_HRL).
-define(Main_HRL,1).

-record(recMainMgrState, {
%% 						  dictUserSocket, 
						  dictLoginUser, 
						  dictOldLoginUser, 
						  dictLineServer
						 }).

-define(Main_Pid, main_Pid).
-define(ETSOnlineAccount, onlineAccountETS).
-define(ETSGameServerInfo, gameServerInfoETS).
-define(ETSDenyAccount, gameDenyAccountList).%%黑名单
-define(ETSWhiteAccount, gameWhiteAccountList).%%白名单
%%-define(PsNameLotteryForTower, lotteryForTowerPID).%%金宝塔管理模块进程名

%%活动公告
-define( XmlNoticeEts, xmlNoticeEts ).%ets名
%%游戏中公告（走马灯）
-define( GameNoticeEts, gameNoticeEts ).%ets名

%% 禁止设备登录的配置表
-define(DenyDeviceEts,denyDeviceEts).

%%帐号的数据库行为
-define(BehaviorOfAccountLogin, 1).
-define(BehaviorOfAccountLogout, 2).
-define(BehaviorOfAccountChangeGsLine, 3).
-define(BehaviorOfAccountRobLogin, 4).

%%GSID
-define(GSIDMin, 1).
-define(GSIDMax, 31).

%%3分钟
-define(HeartMaxWaitSencond,60*3).

-record(recChangeIp, {
	accountIDStr = 0,
	ip = "",
	mac = "",
	idfa = "",
	imei = "",
	clientkey = ""
}).

-define(RandIPEts, admin_randip_ets).
-define(MonitorIPEts, admin_monitorip_ets).
-define(changeIpEts, admin_changeip_ets). % 改变记录

-endif.
