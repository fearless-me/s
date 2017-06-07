%%%此文件包含DBServer需要包含的头文件
-author(zhongyuanwei).

-ifndef(DBSInc_hrl).
-define(DBSInc_hrl,1).

-include("common/setup.hrl").
-include("common/type.hrl").
-include("common/logger.hrl").
-include("common/commonDef.hrl").
-include("netmsgRecords.hrl").
-include("dbsDefine.hrl").
-include("userDefine.hrl").
-include("common/mysql.hrl").
-include("common/db.hrl").
-include("common/logger.hrl").
-include("dbsDefine.hrl").
-include("common/logRecord.hrl").
-include("common/variant.hrl").
-include("common/mall.hrl").
-include("common/gamedata.hrl").
-include("dataDefine.hrl").
-include("globalSetup.hrl").

-define(MakeArg(Rec),{Rec,record_info(fields,Rec)}).

%%存储过程调用统计ETS表
-define(DBSaveStatEts,dbSaveStatEts).

-record(accepted_task_record, {
							   taskID = 0 :: non_neg_integer(),
							   roleID = 0 :: non_neg_integer(),
							   aimType1 = 0 :: non_neg_integer(),
							   aimIndex1 = 0 :: non_neg_integer(),
							   aimCurCount1 = 0 :: non_neg_integer(),
							   aimType2 = 0 :: non_neg_integer(),
							   aimIndex2 = 0 :: non_neg_integer(),
							   aimCurCount2 = 0 :: non_neg_integer(),
							   aimType3 = 0 :: non_neg_integer(),
							   aimIndex3 = 0 :: non_neg_integer(),
							   aimCurCount3 = 0 :: non_neg_integer()
							  }).

-record(mailRecord, {
					 mailID = 0,                    %%邮件id
					 mailType = 0,                  %%邮件类型
					 mailReadState = 0,             %%邮件阅读状态
					 mailSendTime = 0,              %%邮件发送时间
					 mailPay = 0,                   %%领取邮件时所需手续费
					 recvPlayerID = 0,              %%接受者id
					 sendPlayerID = 0,              %%发送者id
					 sendPlayerName = "",           %%发送者名字
					 mailTitle = "",                %%邮件标题
					 mailContent = "",              %%邮件内容
					 attachItemID1 = 0,             %%附件
					 attachItemID2 = 0,             %%附件
		             sendMoney = 0,                 %%发送的金钱
					 sendGold = 0                   %%发送的元宝
					}).

%% 每个子进程加载多少个Info
-define(One_LoadRankPlayerInfo, 5000).
%% 每个子进程加载多少Role
-define(One_LoadRoleData, 1000).
%% 每个子进程加载多少RoleKeyInfo
-define(One_LoadRoleKeyInfo, 100000).
%% 每个子进程处理多少条RoleKeyInfo的其它数据
-define(One_RoleKeyInfoOtherData, 10000).

%%%%%%=======================================
%% 预加载列表
-define(Prestrain_loadRankPlayerInfo, loadRankPlayerInfo).
-define(Prestrain_loadPlayerObject, loadPlayerObject).
-define(Prestrain_loadRoleData, loadRoleData).
-define(Prestrain_roleKeyRecInfoInit, roleKeyRecInfoInit).
-define(Prestrain_ladder1V1Init3, ladder1V1Init3).
%% 加载数据子进程列表
-record(recProcess,
{
	pid = undefined,
	name   %% 服务名,原子
}).

-endif.