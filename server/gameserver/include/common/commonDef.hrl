%%%此文件定义一些公共的宏
-author(zhongyuanwei).

-ifndef(CommonDef_hrl).
-define(CommonDef_hrl,1).

%%DBS向其它服务器同步时间的间隔为半小时(30 * 60 * 1000)
-ifdef(RELEASE).
-define(SyncTimeInterval,1800000).
-else.
-define(SyncTimeInterval,10000).
-endif.

%% 玩家货币最大上限20亿
-define(PlayerCoinMax, 2000000000).

%%1970年1月1日的绝对秒数
-define(SECS_FROM_0_TO_1970,62167219200).

%% 普通道具与装备道具id区分界点
-define(Item_Differentiate, 30000).
%% 符文道具ID开始值
-define(Item_RuneIDStart, 100000).

%%这几个宏为SOCKET相关参数定义
-define(CONNECT_TCP_OPTIONS, [binary, {packet, 0}, {active, false}]).

%% 交易行的角色ID
-define(Trade_Role_ID, 100000000).

%% 邮局的角色ID
-define(Mail_Role_ID, 100000001).

%%服务器的角色活动数据ID
-define(Server_Role_ID,	100000002).

%% 凌晨四点为一天的开始时间
-define(ResetTimeHour, 4).

-define(ResetZeroHour, 1).

%% 主城mapid
-define(MainCity_MapID, 20).

%%兑换率【充值】（不算比例）
-define(PayRate,1).

%% 这个是时间的永久时限，设计者留下坑已离职，耻辱=。=
-define(ForeverFashionSecond, 3600*24*360*10).

%% 货币类型
-define(CoinTypeMin, 			1).		%%
-define(CoinTypeGold, 			1).		%% 金币
-define(CoinTypeBindGold_useless_____, 2).		%% 绑定金币 (废弃)
-define(CoinTypeDiamond, 		3).		%% 钻石
-define(CoinTypePrestige, 		4).		%% 声望
-define(CoinTypeHonor, 			5).		%% 荣誉值
-define(CoinTypeBindDiamond,    6).		%% 绑定钻石
-define(CoinTypePurpleEssence, 	7).		%% 紫色精华,熔炼一般装备获得,用于在资源兑换界面兑换稀有道具
-define(CoinTypeGoldenEssence, 	8).  	%% 金色精华,熔炼高级装备获得,用于在资源兑换界面兑换稀有道具
-define(CoinTypeExploit,		9).		%% 功勋
-define(CoinTypeScore,			10).	%% 积分（只用于商城）
-define(CoinTypePebble,		    11).	%% 魔能水晶-黑暗之地
-define(CoinTypeGuildContribute,12).    %% 军团贡献度
-define(CoinTypeMax,			12). 	%% 最大货币类型
-type coinType() :: ?CoinTypeMin .. ?CoinTypeMax.

%%货币使用规则类型
-define(CoinUseTypeMin,			100).	%%最小使用货币类型
-define(CoinUseTypeGold,		100).	%%使用金币
-define(CoinUseTypePrestige,	101).	%%使用声望
-define(CoinUseTypeHonor,		102).	%%使用荣誉
-define(CoinUseTypeDiamond,		103).	%%使用钻石币,先扣绑定再扣非绑定
-define(CoinUseTypeScore,		104).	%%使用积分货币
-define(CoinUseTypeDiamondJustNotBind,		105).	%%仅使用非绑钻石币
-define(CoinUseTypeGuildContribute,		106).	%%使用军团贡献
-define(CoinUseTypeMax,			106).	%%最大使用货币类型
-type coinUseType() :: ?CoinUseTypeMin .. ?CoinUseTypeMax.

%% 服务器监控类型定义
-define(Monitor_Min, 1).
-define(Monitor_SyncToDB, 1).           %%DB同步数据结构到数据库的功能
-define(Monitor_Max, 1).

-define(MonitorTC_Type_AddRandIP, 1).
-define(MonitorTC_Type_AddMonitorIP, 2).
-define(MonitorTC_Type_DelRandIP, 10).
-define(MonitorTC_Type_DelMonitorIP, 20).

-record(listenTcpOptions, {
	cmdLen = 2,						%%消息号所占长度
	packetLen = 4,					%%包头Size所占长度
	maxPacketSize = 50 * 1024,		%%一个逻辑包最大50K
	port = 0,						%%监听的端口
	listenDelay = 0,				%%是否立即监听，大于0的数为指定秒数后开始监听,否则为立即监听
	isSendSessionKey = true			%%是否发送会话密钥
}).

%% zombie僵尸进程处理
-record(recProcSignIn,{
	pid,
	signInTime %进程签到时间
}).

%% 登录key7分钟超时
-define(LSKeyExpiresSeco,60*7).
%%gs登录用户向ls验证登录的返回结果码
%%验证成功
-define(GS_2_LS_CHECKACCOUNT_RESULT_SUCC, 0).
%%未找到用户
-define(GS_2_LS_CHECKACCOUNT_RESULT_NOTFOUND, -1).
%%验证码无效
-define(GS_2_LS_CHECKACCOUNT_RESULT_KEY_INVALID, -2).
%%验证码超时
-define(GS_2_LS_CHECKACCOUNT_RESULT_TIMEOUT, -3).
%%已经在线
-define(GS_2_LS_CHECKACCOUNT_RESULT_ONLINEGS, -4).

%%充值返利类型
-define(RechargeRebateItem,2).
-define(RechargeRebateBindDiamondFirst,1).
-define(RechargeRebateBindDiamondPer,3).
-define(RechargeRebateFirstDouble,5).%%首充双倍
-define(RoleKeyRec, roleKeyInfo).

%% DBS加载数据
-define(DBSLoadData_None, 0).
-define(DBSLoadData_First, 1).
-define(DBSLoadData_AllEnd, 9).

%% 角色关键数据
-record(recRoleKeyInfo,
{
	roleID          = 0, % 角色ID
	roleName        = "",% 角色名字
	accountID       = 0, % 帐号ID
	race			= 0, % 玩家种族
	career          = 0, % 职业
	sex				= 0, % 性别
	head            = 1, % 头
	level           = 0, % 等级
	exp          	= 0, % 经验
	reputation		= 0, % 爵位声望
	achieve         = 0  % 成就值
}).

%% 角色信息内存表，包含全服有效玩家, recRoleKeyInfo表是本表的子表
-record(?RoleKeyRec,
{
	roleID              = 0, % 角色ID
	roleName            = "",% 角色名字
	accountID           = 0, % 帐号ID
	gsID                = 0, % 玩家所在线ID
	race				= 0, % 玩家种族
	career              = 0, % 玩家职业
	sex					= 0, % 性别
	head                = 1, % 头像
	level               = 0, % 玩家等级
	exp                 = 0, % 经验
	gold                = 0, % 金钱
	reputation 			= 0, % 爵位声望
	playerForce         = 0, % 玩家战力
	petForce            = 0, % 宠物战力
	petID               = 0, % 出战宠物ID
	achieve             = 0, % 玩家成就值
	praise              = 0, % 玩家被点赞值
	wtPhase             = 0, % 勇者试炼当前的关卡
	wtPhaseTime         = 0, % 勇者试炼当前的关卡所耗时间
	lastUpdateTime      = 0, % 最后一次更新时间
	pvpIntegral         = {0,0}, % 宠物远征pvp积分
	kpNum				= 0, % 玩家杀人数
%%	onlinePlayerInfo    = {}, % 在线信息，不在线为{}，在线则为onlinePlayerInfo表信息
	vipLv				= 0, % 等级
	maxForce			= 0, % 历史最高战斗力
	offlineTime			= 0  % 离线时间
}).


%%晚觉管理进程调度用
-record(onlinePlayerInfo,
{
	accountID,				%% 账号ID 检查重复登录用
	account,				%% 账号
	playerCode = 0, 		%% 角色流水号
	playerName = "", 		%% 角色名
	playerId = 0, 			%% 角色id，数据库存的id
	playerPid = 0,			%% 玩家进程,playerOtp
	playerNetPid = 0,		%% 角色网络进程号,向客户端发送消息用
	playerSaveTime = 0		%% 角色保存时间
}).

-record(recKeyValue, {
	key,
	value
}).

%%已经领取的活动ID
-record(awardTakenEts,{
	roleID=0,
	takenList = [] %玩家已领活动id
}).

%% 玩家排行榜类型
-define(PlayerRankType_Start, 1).
-define(PlayerRankType_LevelExp, 1).			%%玩家经验等级排行榜
-define(PlayerRankType_Glod, 2).				%%玩家财富排行榜
-define(PlayerRankType_VipReputation, 3).		%%玩家爵位声望排行榜
-define(PlayerRankType_FightingCapacity, 4).	%%玩家战斗力排行榜
-define(PlayerRankType_FightingCapacityPet, 5).	%%玩家宠物战斗力排行榜
-define(PlayerRankType_Achieve, 6).		        %%玩家成就值排行榜
-define(PlayerRankType_Praise, 7).		        %%玩家被点赞值排行榜
-define(PlayerRankType_Guild, 8).		        %%(特殊排行榜－军团排行榜)
-define(PlayerRankType_GuardMirror, 9).		    %%玩家王者战天下排行榜
-define(PlayerRankType_WarriorTrial, 10).       %%勇者试炼排行榜
-define(PlayerRankType_PetPvp,11).              %%宠物远征pvp（领地积分榜）
-define(PlayerRankType_KvNum,12).				%%恶人排行榜
-define(PlayerRankType_GuildWar,13).			%%军团争霸杀人榜(巅峰对决榜)
-define(PlayerRankType_End, 13).
-type playerRankType() :: ?PlayerRankType_Start .. ?PlayerRankType_End.

%% 玩家排行榜内存数据
-record(recPlayerRank,
{
	roleID = 0,                   	%%角色ID
	rankType::playerRankType(),		%%排行榜类型
	rankSort = 0,					%%排行榜排名
	rankSortC = 0,					%%排行榜排名变化
	value1,		                    %%排行数据1
	value2,		                    %%排行数据2
	value3		                    %%排行数据3
}).

%% 排行榜上的玩家详细数据
-record(recPlayerRankInfo,
{
	roleID = 0,                   	%%角色ID
	career = 0,                   	%%职业
	race = 0,                       %%玩家种族
	sex = 0,                        %%性别
	head = 0,						%%头
	code = 0,						%%code
	name = "",                    	%%姓名
	wingLevel = 0,					%%玩家翅膀等级
	title = {},                     %%称号列表
	fashionIDs = [],				%%穿在身上的时装ID列表
	visibleEquipLevels = [],		%%装备精炼等级列表
	visibleEquips = []			  	%%装备列表#recVisibleEquip{}
}).

%% 军团内存表
-record(recGuildMemory,
{
	guildID = 0,                    %% 军团ID
	isOpen = false,                 %% 军团副本是否开启
	guildCopyMaxOverTime = 0,        %% 军团多人副本最晚结束时间
	ownerID = 0
}).

%% 野外boss刷新信息
-record(recWildBossInfo,
{
	mapID = 0,						%%地图ID
	bossID = 0,						%%怪物ID,
	bossPid = 0,					%%怪物的pid
	bossCode = 0,
	targetCode = 0,					%%目标Code
	isNotice = false,				%%是否已经通告了
	isFresh = false,                %%是否已经刷新出来了
	nextRefreshTime = 0				%%下次刷新时间，只在一条地图线刷
}).

%%运营活动类型
-define(OperateActType_Min,             1). %%运营活动类型最小值
-define(OperateActType_KilledMonster,	1). %%杀怪类型
-define(OperateActType_CollectItem,     2). %%采集
-define(OperateActType_DiamonCharge,	3).	%%gm平台活动(钻石充值)
-define(OperateActType_DiamonUse,		4).	%%gm平台活动(钻石消费)
-define(OperateActType_FeastBoss,		5).	%%节日boss
-define(OperateActType_Max,             5). %%运营活动类型最大值

-type operateActType() :: ?OperateActType_Min .. ?OperateActType_Max.

%%平台活动(钻石充值或消费)配置参数
-record(recAcChargeOrUse,
{
	ruleID = 0,						%%档位id
	diamon = 0,						%%非绑定钻石条件
	item = 0						%%奖励物品组
}).

%%平台活动(钻石充值或消费)个人数据
-record(recAcChargeOrUseData,
{
	diamonAmount = 0,						%%累计非绑定钻石
	hasTakeRuleIDList = []					%%已经领取过的档位id
}).

%% 运营活动--杀怪配置
-record(recAcKilledMonster,
{
	ruleID = 0,						    %%杀怪掉落ID
	type = 0,							%%杀怪规则类型
	itemID = 0,						    %%掉落物品ID
	monsterID = 0,						%%掉落怪物ID
	mapIDs = [],						%%掉落地图列表
	diffLv = 0,						    %%掉落怪物和人物等级差
	odds = 0,							%%掉落几率
	playerLimit = 0,					%%玩家掉落上限
	serverLimit = 0,					%%服务器掉落上限
	isDelete = 0						%%0:未删除 1,删除
}).

%% 运营活动采集配置
-record(recAcCollectItemCfg,
{
	mapID = 0,									%%地图ID
	freshNum = 0,								%%单次刷新数量
	totalFreshNum = 0,							%%总刷新数量
	turnFreshInterval = 0,                      %%轮次刷新间隔
	collectID = 0,								%%采集ID
	alreadyFreshNum = 0                         %%已经刷新的数量
}).

%% 运营活动节日boss配置
-record(recAcFeastBossCfg,
{
	mapID = 0,									%%地图ID
	bossID = 0,									%%bossID
	bossNum = 0,								%%boss数量
	freshLine = 0,								%%刷新线路
	freshInterval = 0							%%刷新间隔
}).

%% 运营活动数据--杀怪数据
-record(recAcDataKilledMonster,
{
	ruleID = 0,						%%杀怪掉落ID
	num = 0							%%杀怪掉落数量
}).

%% 运营活动杀怪参数
-record(recAcKilledMonsterArg,
{
	mapID = 0,						%%怪物死亡地图
	monsterID = 0,					%%怪物ID
	monsterLv = 0					%%怪物等级
}).

%% 运营活动节日boss参数
-record(recAcReastBossArg, {
	mapID = 0,						%%怪物死亡地图
	monsterID = 0,					%%怪物ID
	killedName = "",				%%击杀者
	hateList = []					%%仇恨列表
}).

-record(recKillBossPlayer,{
	pid = 0,
	name = ""
}).

%% 运营活动采集参数
-record(recAcCollectItemArg,
{
	mapID = 0,									%%地图ID
	mapPid = 0,                                 %%地图PID
	collectID = 0,								%%采集ID
	x = 0.0,
	y = 0.0,
	code = 0
}).


%% 运营活动数据参数
-record(recOperateActivityArg,
{
	roleID = 0,						%%角色ID
	lv = 0,							%%角色等级
	type = 0,						%%活动类型	0:杀怪活动
	pid = 0,						%%玩家Pid
	%%活动参数允许以下的参数类型： #recAcKilledMonsterArg{},#recAcCollectItemArg{},#recAcReastBossArg{}
	arg = []
}).

%% 家族-游乐场
-record(recGuildFairground,{
	guildID = 0,
	mapPid = undefined,
	playerEts = undefined
}).
-define(EtsGuildFairground, ets_recGuildFairground).


-record(recCrosTeamInfo, {
	code = 0,
	roleID = 0,
	roleName = "",
	pid = 0,
	netPid = 0,
	level = 0,
	force = 0,
	career = 0,
	arenaVal = 0,
	isHeader = false,
	isReady = false
}).

%%跨服组队房间
-record(recCrosTeam,{
	teamID = 0,
	isStart = 0,
	member = []
}).

%% 客户端到服务器协议
-record(rec_msg_c_2_s, {
	msgID = 0,		%% 协议ID
	number = 0,		%% 次数
	len = 0			%% 总长度
}).

%% 服务器到客户端协议
-record(rec_msg_s_2_c, {
	msgID = 0,		%% 协议ID
	number = 0,		%% 次数
	len = 0			%% 总长度
}).

%% 灵魂伙伴最大成员个数
-define(CompanionMemberMaxNumber, 3).
%% 退出
-define(ExitCompanion_Exit, 1).
%% 解散
-define(ExitCompanion_JS, 2).
%% 通知解散
-define(NoticeExitCompanion_JS, 1).
%% 通知被踢
-define(NoticeExitCompanion_BeKick, 2).
%% 不是成员
-define(EnterCompanionCopyMapAck_NotMember, 1).
%% 成员数量不足
-define(EnterCompanionCopyMapAck_NotMemberNumber, 2).
%% 不全是成员
-define(EnterCompanionCopyMapAck_NotMemberOne, 3).
%% 队长不是团长
-define(EnterCompanionCopyMapAck_NotLeader, 4).
%% 成功
-define(EnterCompanionCopyMapAck_Success, 9).

%% 军团领地争夺战报名开启
-define(GuildBattleNotice_ApplyStart, 1).
%% 军团领地争夺战报名关闭
-define(GuildBattleNotice_ApplyEnd, 2).
%%军团副本CD
-define(GuildCopyCD, 259200).


%%定义离线数据模块
-define(AllSys,		0).

%%
-record(recRubbishCleanerSetting,{
	oneCount = 10,
	delDelayDays = 30,
	offlineDays = 60,
	offlineRoleLevel = 20
}).

-record(recRubbishRoleInfo,{
	roleID,
	accountID,
	deleteTime,
	lastLoginTime,
	lastLogoutTime,
	flag
}).

-endif.
