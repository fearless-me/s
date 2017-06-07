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
