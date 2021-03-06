-ifndef(DB_GAMEACCOUNT_hrl).
-define(DB_GAMEACCOUNT,1).

%%全国唯一账号表
-record(rec_account,{
	accountID = 0,				%%账号唯一ID bigint(20) unsigned
	account = "",				%%平台AID_+平台Name生成的内部账号 varchar(255)
	platformAID = "",				%%平台生成的账号ID varchar(255)
	platformAccount = "",				%%平台生成的账号 varchar(255)
	platformName = "",				%%平台名 char(50)
	fgi = 0,				%%平台发的平台id int(1) unsigned
	nickName = "",				%%玩家输入的账号 varchar(50)
	deviceId = "",				%%游戏程序存在手机上的唯一标识 char(32)
	imei = "",				%%安卓设备号 varchar(50)
	idfa = "",				%%ios的号统计 varchar(50)
	mac = "",				%%手机mac varchar(50)
	createTime = 0				%%创建时间 datetime

}).

%%被封帐号表：分为封所有区或单区
-record(rec_account_deny_list,{
	id = 0,				%% int(1) unsigned
	accountId = 0,				%%帐号id bigint(1) unsigned
	areaId = 0,				%%大区ID；同db_info int(1) unsigned
	isForever = 0,				%%是否永久封号 int(1)
	beginTime = 0,				%%封号起始 datetime
	endTime = 0				%%封号结束 datetime

}).

%%账号ID
-record(rec_accountid,{
	accountDBID = 1,				%% int(11) unsigned
	gsDBID = 1,				%% int(11) unsigned
	curMaxUID = 0,				%% bigint(20) unsigned
	curMaxCounter = 0				%% int(11) unsigned

}).

%%
-record(rec_configdb,{
	id = 0,				%% int(11)
	gameID = 165,				%%平台分配的游戏ID int(11)
	regionid = 0,				%% int(11)
	serverid = 0,				%%大区下服务器ID,serverid,范围1~1023 smallint(5) unsigned
	ptid = 0,				%% int(50)
	serverType = 0,				%% 0是测试服,1是正式服,3是正式跨服,4是正式战斗服,5测试跨服 int(11)
	servername = "",				%% varchar(255)
	externalip = "",				%%服务器所在公网ip char(32)
	internalip = "",				%%服务器所在内网ip char(32)
	slave_id = 0,				%% int(11)
	gameport1 = 0,				%% int(11)
	gameport2 = 0,				%% int(11)
	gameport_gm = 0,				%% int(11)
	gameport_recharge = 0,				%% int(11)
	data_ip = "",				%%逻辑数据库ip char(32)
	data_username = "",				%% varchar(64)
	data_password = "",				%% varchar(64)
	data_port = 0,				%% smallint(6) unsigned
	data_dbname = "",				%% varchar(64)
	log_ip = "",				%%日志数据库ip char(32)
	log_username = "",				%% varchar(64)
	log_password = "",				%% varchar(64)
	log_port = 0,				%% smallint(6) unsigned
	log_dbname = "",				%% varchar(64)
	global_account_ip = "",				%%全局账号库ip char(32)
	global_account_username = "",				%% varchar(64)
	global_account_password = "",				%% varchar(64)
	global_account_port = 0,				%% smallint(6) unsigned
	global_account_dbname = "",				%% varchar(64)
	global_activecode_ip = "",				%%全局激活码库ip char(32)
	global_activecode_username = "",				%% varchar(64)
	global_activecode_password = "",				%% varchar(64)
	global_activecode_port = 0,				%% smallint(6) unsigned
	global_activecode_dbname = "",				%% varchar(64)
	cross_node = "",				%%跨服节点 varchar(64)
	eveUrl = "",				%% varchar(255)
	paymentVerifyUrl = "",				%% varchar(255)
	biInterface="http://gather-client-data.funcell123.com",				%% varchar(255)
	preLoadDayNumber = 3,				%%预加载最近登陆的天数的账号 int(11)
	preLoadRoleNumber = 2000,				%%预加载最近登陆的天数账号下的所有角色 int(11)
	gamekey = "",				%%游戏服启动读取的key varchar(1024)
	gm_select_username = "",				%%GM查询从库的用户 varchar(64)
	gm_select_password = "",				%%GM查询从库的密码 varchar(64)
	gm_select_dbport = 0,				%%GM查询从库的端口 int(11)
	serverIdList = "",				%%主要用于区分合服 varchar(255)
	ismerged = 0,				%% int(11)
	mergeindate = 0,				%% datetime
	createdate = 0				%% timestamp

}).

%%
-record(rec_deny_list4device,{
	deviceId = ""				%%设备标识 varchar(255)

}).

%%
-record(rec_eventlist1,{
	id = ""				%% varchar(32)

}).

%%
-record(rec_eventlist2,{
	id = ""				%% varchar(32)

}).

%%平台名映射表，方便多个平台使用同一平台名
-record(rec_platform,{
	platformName = "",				%%要查询的平台名 varchar(50)
	targetPlatformName = ""				%%映射到的目标平台名 varchar(50)

}).

%%
-record(rec_user4test,{
	accountID = 0				%%账号ID bigint(20) unsigned

}).

%%版本号控制表
-record(rec_version,{
	id = 0				%%本数据库的ID，注意此ID会影响AccountID的生成，各地区的ID是不同配置，以保证全球唯一，ID范围1~31 tinyint(3) unsigned

}).

-endif.
