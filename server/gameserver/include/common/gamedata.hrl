-ifndef(DB_GAMEDATA_hrl).
-define(DB_GAMEDATA_hrl,1).

%%账号表
-record(rec_account,{
	accountID = 0,				%%账号ID bigint(20) unsigned
	account = "",				%%平台生成的账号+平台ID形成唯一账号 varchar(255)
	platformAccountID = "",				%%平台生成的唯一标识 varchar(255)
	platformName = "",				%%平台名 char(50)
	fgi = 0,				%%平台为的平台id int(1)
	priv = 0,				%%权限 int(10) unsigned
	ipLimit = 0,				%%允许的ip int(11)
	macLimit = 0,				%%允许的mac bigint(20)
	lastLogoutTime = 0,				%%上次登出时间 datetime
	lastLoginTime = 0,				%%上次登入时间 datetime
	gmLevel = 0,				%%gm权限等级 tinyint(4) unsigned
	onlineServer = 0,				%%所在线路 smallint(6)
	createTime = 0,				%%账号创建时间 datetime
	nickName = "",				%%玩家输入的账号名 varchar(32)
	deviceId = "",				%%玩家最近一次登录的设备标识 varchar(255)
	bindPhoneNum = 0,				%%绑定手机号 bigint(64) unsigned
	unlockNewRace = 0				%%是否解锁新种族 int(32) unsigned

}).

%%上次测试登录过后账号信息表
-record(rec_account_welfare,{
	accountID = 0,				%%帐号id bigint(1) unsigned
	level = 0,				%%玩家账号的最大等级 tinyint(3) unsigned
	welfareTypeId = 0,				%%福利类型id，可以当作奖励批次 smallint(1) unsigned
	itemList = ""				%%'[{\"item_id\":13,\"item_num\":5,\"item_bind\":false}]' text

}).

%%角色成就系统
-record(rec_achieve,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	achieveID = 0,				%%成就ID smallint(6) unsigned
	achieveSID = 0,				%%成就进度ID tinyint(4) unsigned
	achieveLevel = 0,				%%成就领取等级 tinyint(4) unsigned
	achieveSnum = 0				%%成就进度数量 int(11) unsigned

}).

%%活动进度存储表
-record(rec_activity,{
	id = 0,				%%活动id int(10) unsigned
	starttime = 0,				%%活动开启时间 datetime
	phasetime = 0,				%%当前阶段开启时间 datetime
	phase = 0				%%当前阶段，0关闭 tinyint(3) unsigned

}).

%%觉醒信息表
-record(rec_awaken_info,{
	roleID = 0,				%%玩家角色唯一ID bigint(20) unsigned
	level = 0,				%%觉醒等级 smallint(6)
	itemNum = 0,				%%当前等级吃了多少个道具(最大不会超过65535) smallint(6)
	cardID = 0,				%% smallint(6)
	progress = 0,				%% int(10) unsigned
	stateMax = 0,				%% int(10) unsigned
	curState = 0				%% int(10) unsigned

}).

%%角色徽章系统
-record(rec_badge,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	mapID = 0,				%%地图ID smallint(6) unsigned
	items = []				%%成就进度数量 varchar(128)

}).

%%角色基本信息
-record(rec_base_role,{
	roleID = 0,				%%玩家角色唯一ID bigint(20) unsigned
	roleName = "",				%%玩家的角色名 varchar(32)
	accountID = 0,				%%玩家账号唯一ID bigint(20) unsigned
	platformName = "",				%%平台名 char(50)
	sex = 0,				%%性别,0为女，1为男 tinyint(1) unsigned
	camp = 0,				%%阵营 tinyint(4) unsigned
	race = 0,				%%种族 tinyint(4) unsigned
	career = 0,				%%职业 int(10) unsigned
	head = 1,				%%头部id int(10)
	mapID = 0,				%%玩家当前所在的地图ID smallint(6) unsigned
	x = 0,				%%玩家所在地图的X坐标 float
	y = 0,				%%玩家所在地图的Y坐标 float
	oldMapID = 0,				%%玩家进入副本前所在地图ID smallint(6) unsigned
	oldX = 0,				%%进入副本前所在的X float
	oldY = 0,				%%进入副本前所在的Y float
	pkMode = 0,				%%玩家Pk状态 tinyint(4) unsigned
	level = 0,				%%玩家的当前等级 tinyint(4) unsigned
	exp = 0,				%%玩家经验 int(10) unsigned
	hp = 0,				%%玩家当前生命值 int(10) unsigned
	mp = 0,				%%当前魔法 int(10) unsigned
	reputation = 0,				%%爵位声望(只增不减) int(10) unsigned
	power = 0,				%%每个职业的能量值 int(11) unsigned
	achieve = 0,				%%成就 int(11) unsigned
	createTime = 0,				%%角色创建时间 datetime
	lastLoginTime = 0,				%%上次登录时间 datetime
	lastLogoutTime = 0,				%%上次下线时间 datetime
	denyChatTime = 0,				%%禁言时间(unix_time,转换成秒是为了方便比较) bigint(20) unsigned
	deleteTime = 0,				%%删除时间 datetime
	isOnline = 0,				%%是否在线 tinyint(1) unsigned
	totalOnlineTime = 0,				%%累计在线时长，单位：秒 bigint(20) unsigned
	lastTransferMapTime = 0				%%上次使用小地图传送的Unix UTC时间，单位秒 int(10) unsigned

}).

%%
-record(rec_base_role_bak,{
	roleID = 0,				%%玩家角色唯一ID bigint(20) unsigned
	roleName = "",				%%玩家的角色名 varchar(32)
	accountID = 0,				%%玩家账号唯一ID bigint(20) unsigned
	platformName = "",				%%平台名 char(50)
	sex = 0,				%%性别,0为女，1为男 tinyint(1) unsigned
	camp = 0,				%%阵营 tinyint(4) unsigned
	race = 0,				%%种族 tinyint(4) unsigned
	career = 0,				%%职业 int(10) unsigned
	head = 1,				%%头部id int(10)
	mapID = 0,				%%玩家当前所在的地图ID smallint(6) unsigned
	x = 0,				%%玩家所在地图的X坐标 float
	y = 0,				%%玩家所在地图的Y坐标 float
	oldMapID = 0,				%%玩家进入副本前所在地图ID smallint(6) unsigned
	oldX = 0,				%%进入副本前所在的X float
	oldY = 0,				%%进入副本前所在的Y float
	pkMode = 0,				%%玩家Pk状态 tinyint(4) unsigned
	level = 0,				%%玩家的当前等级 tinyint(4) unsigned
	exp = 0,				%%玩家经验 int(10) unsigned
	hp = 0,				%%玩家当前生命值 int(10) unsigned
	mp = 0,				%%当前魔法 int(10) unsigned
	reputation = 0,				%%爵位声望(只增不减) int(10) unsigned
	power = 0,				%%每个职业的能量值 int(11) unsigned
	achieve = 0,				%%成就 int(11) unsigned
	createTime = 0,				%%角色创建时间 datetime
	lastLoginTime = 0,				%%上次登录时间 datetime
	lastLogoutTime = 0,				%%上次下线时间 datetime
	denyChatTime = 0,				%%禁言时间(unix_time,转换成秒是为了方便比较) bigint(20) unsigned
	deleteTime = 0,				%%删除时间 datetime
	isOnline = 0,				%%是否在线 tinyint(1) unsigned
	totalOnlineTime = 0,				%%累计在线时长，单位：秒 bigint(20) unsigned
	lastTransferMapTime = 0				%%上次使用小地图传送的Unix UTC时间，单位秒 int(10) unsigned

}).

%%
-record(rec_buff,{
	roleID = 0,				%%玩家角色ID bigint(20) unsigned
	buffID = 0,				%%buff ID smallint(6)
	endtime = 0				%%buff结束或者剩余时间(如果当前时间大于94608000000 = 3 * 365 * 24 * 3600 * 1000为结束时间,否则为剩余时间) bigint(20) unsigned

}).

%%角色已经领取了的万用礼包key1对多玩家
-record(rec_common_active_code,{
	role_id = 0,				%%角色id bigint(20) unsigned
	awardcode = 0,				%%已经领取了的活动ID int(10) unsigned
	taken_time = 0				%%领取时间 int(11) unsigned

}).

%%副本分数记录表
-record(rec_copymapscore,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	copyMapID = 0,				%%副本id smallint(5) unsigned
	maxScore = 0				%%最高分数(最短时间) int(10) unsigned

}).

%%
-record(rec_daily_counter0,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	dailyType = 0,				%%每日计数器类型 bigint(20) unsigned
	lastUpdateTime = 0,				%%最后一次更新时间 bigint(20) unsigned
	counter = 0				%%每日已经完成的计数器值 bigint(20)

}).

%%
-record(rec_daily_counter1,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	dailyType = 0,				%%每日计数器类型 bigint(20) unsigned
	lastUpdateTime = 0,				%%最后一次更新时间 bigint(20) unsigned
	counter = 0				%%每日已经完成的计数器值 bigint(20)

}).

%%
-record(rec_daily_counter2,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	dailyType = 0,				%%每日计数器类型 bigint(20) unsigned
	lastUpdateTime = 0,				%%最后一次更新时间 bigint(20) unsigned
	counter = 0				%%每日已经完成的计数器值 bigint(20)

}).

%%
-record(rec_daily_counter3,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	dailyType = 0,				%%每日计数器类型 bigint(20) unsigned
	lastUpdateTime = 0,				%%最后一次更新时间 bigint(20) unsigned
	counter = 0				%%每日已经完成的计数器值 bigint(20)

}).

%%
-record(rec_daily_counter4,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	dailyType = 0,				%%每日计数器类型 bigint(20) unsigned
	lastUpdateTime = 0,				%%最后一次更新时间 bigint(20) unsigned
	counter = 0				%%每日已经完成的计数器值 bigint(20)

}).

%%
-record(rec_daily_counter5,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	dailyType = 0,				%%每日计数器类型 bigint(20) unsigned
	lastUpdateTime = 0,				%%最后一次更新时间 bigint(20) unsigned
	counter = 0				%%每日已经完成的计数器值 bigint(20)

}).

%%
-record(rec_daily_counter6,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	dailyType = 0,				%%每日计数器类型 bigint(20) unsigned
	lastUpdateTime = 0,				%%最后一次更新时间 bigint(20) unsigned
	counter = 0				%%每日已经完成的计数器值 bigint(20)

}).

%%
-record(rec_daily_counter7,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	dailyType = 0,				%%每日计数器类型 bigint(20) unsigned
	lastUpdateTime = 0,				%%最后一次更新时间 bigint(20) unsigned
	counter = 0				%%每日已经完成的计数器值 bigint(20)

}).

%%
-record(rec_daily_counter8,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	dailyType = 0,				%%每日计数器类型 bigint(20) unsigned
	lastUpdateTime = 0,				%%最后一次更新时间 bigint(20) unsigned
	counter = 0				%%每日已经完成的计数器值 bigint(20)

}).

%%
-record(rec_daily_counter9,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	dailyType = 0,				%%每日计数器类型 bigint(20) unsigned
	lastUpdateTime = 0,				%%最后一次更新时间 bigint(20) unsigned
	counter = 0				%%每日已经完成的计数器值 bigint(20)

}).

%%黑暗之地特殊积分活动排行榜
-record(rec_darkness_ac_rank,{
	roleID = 0,				%% bigint(20) unsigned
	camp = 0,				%%阵营：1正义联盟，2邪恶部落 tinyint(3) unsigned
	rank = 0,				%%排名 smallint(5) unsigned
	point = 0				%%积分 int(10) unsigned

}).

%%数据库信息
-record(rec_db_info,{
	adbID = 0,				%%账号数据库的ID，有效范围[1,31]，需要与账号库的ID一致 smallint(5) unsigned
	dbID = 1,				%%游戏数据库ID，有效范围[1,1023] smallint(6) unsigned
	gmLevel = 0,				%%gm权限，如果设置大于0，表示全服的帐号都拥有gm权限 tinyint(3) unsigned
	serverName = "",				%%服务器名字 varchar(255)
	maxPlayer = 0				%%最大在线人数 int(10) unsigned

}).

%%装备部位精炼信息表
-record(rec_equip_refine_info,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	type = 0,				%%精炼部位 tinyint(4) unsigned
	level = 0,				%%精炼等级 tinyint(4) unsigned
	prog = 0,				%%装备部位冲星进度等级 tinyint(4)
	bless = 0,				%%装备部位冲星祝福值 smallint(6)
	star = 0				%%装备部位冲星等级 tinyint(4)

}).

%%
-record(rec_ext_role,{
	roleID = 0,				%%玩家角色唯一ID bigint(20) unsigned
	totalOfflineTime = 0,				%%距离上次离线累计时长 单位：秒 int(10) unsigned
	canRename = 0,				%%是否允许改名，0为不允许，1为允许 tinyint(1) unsigned
	updateReward = ""				%%玩家资源更新领取奖励情况 text

}).

%%
-record(rec_fashion_slot,{
	roleID = 0,				%% bigint(10) unsigned
	slot = 0,				%% tinyint(3) unsigned
	fashionID = 0				%% smallint(5) unsigned

}).

%%好友互动表 协助好友关系表对正式好友的互动行为作限制
-record(rec_friend2_interaction,{
	roleID = 0,				%%角色id bigint(20) unsigned
	targetRoleID = 0,				%%目标角色ID bigint(20) unsigned
	timeBeApply = 0				%%收到申请的时间 int(11) unsigned

}).

%%好友关系表
-record(rec_friend2_relation,{
	roleID = 0,				%%角色id bigint(20) unsigned
	targetRoleID = 0,				%%目标角色ID bigint(20) unsigned
	relation = 0,				%%主要关系0陌生人1临时好友2正式好友3黑名单，互斥 tinyint(3) unsigned
	closeness = 0,				%%亲密度（友好度） int(11) unsigned
	timeRelation = 0,				%%建立关系的时间 int(11) unsigned
	timeLastInteractive = 0				%%最近交互的时间 int(11) unsigned

}).

%%
-record(rec_game_notice,{
	id = 0,				%% int(1) unsigned
	position = 0,				%%0跑马灯/1登陆界面的公告板/2游戏内的公告板 int(1)
	type = 0,				%%0即时，1定时，2轮播 smallint(1)
	content = "",				%%公告内容 text
	rgb = 0,				%%字体前景色 int(1) unsigned
	beginTime = 0,				%%开始时间 int(1)
	duration = 0,				%%从开始时间持续多少秒	 bigint(1)
	interval = 0				%%间隔时间（轮播特有） int(1) unsigned

}).

%%
-record(rec_god_weapon,{
	roleID = 0,				%%角色id bigint(20) unsigned
	weaponID = 0,				%%神器id tinyint(3) unsigned
	weaponLevel = 0,				%%神器等级 tinyint(3) unsigned
	skillLevel = 0				%%神器技能等级 tinyint(3) unsigned

}).

%%王者战天下
-record(rec_guard_mirror,{
	roleID = 0,				%%王者角色id bigint(20) unsigned
	roleName = "",				%%王者角色名 varchar(50)
	roleLevel = 0,				%%王者角色等级 smallint(5) unsigned
	roleCareer = 1,				%%王者角色职业id int(10)
	hpNumber = 0,				%%王者血量 float unsigned
	guardTimes = 0,				%%守卫次数 tinyint(1)
	fightForce = 0,				%%守护者的战斗力 bigint(20)
	mirrorBuffCfgID = 0,				%%给镜像购买的buffID bigint(20)
	roleBuffCffgID = 0,				%%玩家给自己购买的buffID bigint(20)
	declaration = ""				%%守护宣言 varchar(255)

}).

%%王者守卫排行榜
-record(rec_guard_mirror_rank,{
	roleID = 0,				%%角色id bigint(20) unsigned
	days = 0				%%守卫天数 smallint(5) unsigned

}).

%%公会-帮派-军团公共表
-record(rec_guild,{
	guildID = 0,				%%军团唯一ID bigint(20) unsigned
	guildName = "",				%%军团名字(七个字) char(32)
	guildLevel = 0,				%%军团等级 tinyint(3) unsigned
	member = 0,				%%军团成员个数，最大不超过65535个成员 smallint(6) unsigned
	resource = 0,				%%军团资金 int(10) unsigned
	liveness = 0,				%%军团活跃度 int(10) unsigned
	notice = "",				%%公告 varchar(256)
	denoter = 0,				%%军团标志ID tinyint(3) unsigned
	shopLevel = 0,				%%军团商店等级 tinyint(3) unsigned
	fightForce = 0,				%%军团总战斗力 int(10) unsigned
	createTime = 0,				%%军团创建时间 bigint(20) unsigned
	lastGuildCopyOverTime = 0,				%%上次军团副本结束时间 bigint(20) unsigned
	guildTaskTargetGuild = 0,				%%军团任务目标军团 bigint(20) unsigned
	guildTaskTime = 0,				%%军团任务目标军团生成时间 bigint(20) unsigned
	snowman = 0,				%%完整的雪人数量，用于领取雪人礼盒 tinyint(3) unsigned
	godBless = 0,				%%当日祈福进度 int(10) unsigned
	fastJoin = 0,				%%快速加入所需战力 bigint(20) unsigned
	recruit = 0				%%发布招募最后使用时间，用于控制CD int(10) unsigned

}).

%%军团战报名表,因为报名要花钱，所以哥给你们记一下
-record(rec_guild_battle_paid,{
	guildID = 0,				%%军团ID bigint(20) unsigned
	applytime = 0				%%报名时间 int(10) unsigned

}).

%%军团福利BUFF
-record(rec_guild_buff,{
	guildID = 0,				%%军团ID bigint(20) unsigned
	buffID = 0,				%%BUFFID int(10) unsigned
	buyTime = 0,				%%购买时间 bigint(20) unsigned
	buyRoleID = 0				%%购买者 bigint(20) unsigned

}).

%%公会-帮派-军团成员表
-record(rec_guild_member,{
	roleID = 0,				%%玩家角色唯一ID bigint(20) unsigned
	guildID = 0,				%%军团唯一ID bigint(20) unsigned
	joinTime = 0,				%%加入时间 bigint(20) unsigned
	power = 0,				%%军团职位 tinyint(3) unsigned
	liveness = 0				%%个人军团活跃度,退团清空 int(10) unsigned

}).

%%军团成员学习的技能列表
-record(rec_guild_member_skill,{
	guildID = 0,				%%军团ID bigint(20) unsigned
	roleID = 0,				%%角色ID bigint(20) unsigned
	skillID = 0,				%%技能ID int(10) unsigned
	skillLvl = 0				%%技能等级 int(10) unsigned

}).

%%军团-公会-帮派-家族……反正是组织的，游乐场设施关键状态记录
-record(rec_guild_ride,{
	guildID = 0,				%%军团唯一ID bigint(20) unsigned
	rideID = 0,				%%设施ID int(11) unsigned
	rideLevel = 0,				%%设施等级 int(11) unsigned
	rideState = 0				%%设施状态 0维护中 1未到开放时间 2正常开放 tinyint(3) unsigned

}).

%%军团技能
-record(rec_guild_skill,{
	guildID = 0,				%% bigint(20) unsigned
	skillID = 0,				%% int(10) unsigned
	skillLvl = 0				%% int(10) unsigned

}).

%%军团任务
-record(rec_guild_task,{
	roleID = 0,				%% bigint(20) unsigned
	taskType = 0,				%%任务类型1刺探，2巡逻 int(10) unsigned
	taskID = 0,				%%任务ID int(10) unsigned
	targetGuildID = 0,				%% bigint(20) unsigned
	targetRoleID = 0,				%% bigint(20) unsigned
	curTimes = 0,				%%当前完成次数 int(10) unsigned
	maxTimes = 0,				%%最大完成次数 int(10) unsigned
	freshTime = 0,				%%接取时间，完成时间，放弃任务的时间 bigint(20) unsigned
	number1 = 0,				%%完成参数1 int(10) unsigned
	number2 = 0,				%%完成参数2 int(10) unsigned
	number3 = 0				%%完成参数3 int(10) unsigned

}).

%%军团城战分组以及胜负情况
-record(rec_guild_war,{
	stage = 0,				%%第一场 tinyint(3) unsigned
	group = 0,				%%第几组 tinyint(3) unsigned
	guildID1 = 0,				%%参赛军团ID1 bigint(20) unsigned
	guildID2 = 0,				%%参赛军团ID2 bigint(20) unsigned
	guildID3 = 0,				%%参赛军团ID3 bigint(20) unsigned
	winguildID = 0,				%%获胜军团ID bigint(20) unsigned
	wartime = 0				%%时间 bigint(20) unsigned

}).

%%军团城战竞价出资情况表
-record(rec_guild_war_paid,{
	guildID = 0,				%% bigint(20) unsigned
	paidmoney = 0				%%竞价资金(军团物资) int(10) unsigned

}).

%%玩家节日任务
-record(rec_holiday_task,{
	playerID = 0,				%%玩家角色唯一ID bigint(8) unsigned
	acceptedTaskId = 0,				%%玩家当前接受活动任务 int(8) unsigned
	acceptedTime = 0,				%%当前任务接受时间戳 bigint(8) unsigned
	completedTask				%%玩家完成任务列表 varbinary(256)

}).

%%玩家道具
-record(rec_item,{
	itemUID = 0,				%%道具UID bigint(20) unsigned
	roleID = 0,				%%角色ID bigint(20) unsigned
	itemID = 0,				%%道具ID int(10) unsigned
	pos = 0,				%%背包类型 smallint(6) unsigned
	pileNum = 1,				%%堆叠数量 smallint(6) unsigned
	recastCount = 0,				%%重铸次数 smallint(6) unsigned
	isBind = 0,				%%是否绑定 tinyint(1) unsigned
	isLocked = 0,				%%玩家是否自己锁定 tinyint(1) unsigned
	quality = 0,				%%品质 tinyint(4) unsigned
	deleteTime = 0,				%%删除时间 datetime
	createTime = 0,				%%创建时间 int(10) unsigned
	expiredTime = 0,				%%过期时间，0为无过期时间 int(10) unsigned
	equipBase,				%%装备基础信息 blob
	equipEnhance,				%%强化信息 blob
	equipExt				%%装备扩展信息 blob

}).

%%
-record(rec_item_bak,{
	itemUID = 0,				%%道具UID bigint(20) unsigned
	roleID = 0,				%%角色ID bigint(20) unsigned
	itemID = 0,				%%道具ID int(10) unsigned
	pos = 0,				%%背包类型 smallint(6) unsigned
	pileNum = 1,				%%堆叠数量 smallint(6) unsigned
	recastCount = 0,				%%重铸次数 smallint(6) unsigned
	isBind = 0,				%%是否绑定 tinyint(1) unsigned
	isLocked = 0,				%%玩家是否自己锁定 tinyint(1) unsigned
	quality = 0,				%%品质 tinyint(4) unsigned
	deleteTime = 0,				%%删除时间 datetime
	createTime = 0,				%%创建时间 int(10) unsigned
	expiredTime = 0,				%%过期时间，0为无过期时间 int(10) unsigned
	equipBase,				%%装备基础信息 blob
	equipEnhance,				%%强化信息 blob
	equipExt				%%装备扩展信息 blob

}).

%%道具使用CD信息
-record(rec_item_used_cd,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	itemGroupID = 0,				%%道具组ID smallint(6)
	lastUsedTime = 0				%%上次使用时间，以2010年1月1日为准的时间，单位：毫秒 bigint(20) unsigned

}).

%%天梯1v1
-record(rec_ladder_1v1,{
	rankSort = 0,				%% int(10)
	roleID = 0,				%%角色ID bigint(20) unsigned
	exploit = 0,				%%总功勋 int(10) unsigned
	cur_win = 0,				%%当前连胜 smallint(5) unsigned
	max_win = 0,				%%最大连胜 smallint(5) unsigned
	win_times = 0,				%%累计胜利 smallint(5) unsigned
	worship_times = 0				%%被膜拜总次数 smallint(5) unsigned

}).

%%每日优惠限购
-record(rec_limit_sales,{
	sku = 0,				%%包装商品sku ID int(8) unsigned
	itemID = 0,				%%道具ID int(8) unsigned
	num = 1,				%%道具个数 int(8) unsigned
	isBinded = 0,				%%道具是否绑定，0绑定，1非绑 smallint(5) unsigned
	price = 0,				%%价格 int(8) unsigned
	rebate = 100,				%%折扣 smallint(4) unsigned
	startTime = 0,				%%限购活动开始时间 int(8) unsigned
	endTime = 0,				%%结束时间 int(8) unsigned
	coinType = 0,				%%支付的货币类型 smallint(4) unsigned
	limitSales = 1				%%最大限购次数 smallint(4) unsigned

}).

%%登录有礼活动配置
-record(rec_login_award_conf,{
	award_id = 0,				%%活动ID int(1) unsigned
	award_name = "",				%%活动名称 char(50)
	time_begin = 0,				%%开始时间 int(1) unsigned
	time_end = 0,				%%结束时间 int(1) unsigned
	level_min = 0,				%%最小等级 tinyint(4)
	level_max = 0,				%%最高等级 tinyint(4)
	mail_title = "",				%%邮件标题 varchar(255)
	mail_content = "",				%%邮件内容 text
	items = "",				%%例如：[{"item_id":1001,"item_num":5,"item_bind":true}] text
	is_valid = 0				%%0为有效；1为无效 tinyint(1) unsigned

}).

%%占卜彩票结果，保留的日志信息
-record(rec_lottery_result,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	itemID = 0,				%%占卜获得的道具ID smallint(5) unsigned
	itemNumber = 0,				%%占卜获得的道具个数 smallint(5) unsigned
	isBind = 1,				%%是否绑定，1绑定，0非绑定 tinyint(3) unsigned
	isServerNote = 0,				%%是否可做为全服note，1可做为 tinyint(3) unsigned
	zbTime = 0,				%%占卜时间 bigint(20) unsigned
	aid = 0				%%aid bigint(20)

}).

%%
-record(rec_mail,{
	mailID = 0,				%%邮件id bigint(20) unsigned
	mailReadTime = 0,				%%邮件阅读时间 datetime
	mailSendTime = 0,				%%邮件发送时间 datetime
	isLocked = 0,				%%是否锁定0未锁定，1锁定 tinyint(1) unsigned
	senderRoleID = 0,				%%发送者id，系统发送的邮件则为0 bigint(20) unsigned
	toRoleID = 0,				%%接收者id bigint(20) unsigned
	mailTitle = "",				%%邮件标题128 varchar(128)
	mailContent = "",				%%邮件内容1024 text
	mailSubjoinMsg = "",				%%邮件附加内容 varchar(128)
	deleteTime = 0				%%删除时间 datetime

}).

%%邮件的附件
-record(rec_mail_attachment,{
	mailID = 0,				%%邮件的ID bigint(20) unsigned
	mtype = 0,				%%附件的类型：0为道具，其它为货币类型，货币类型参见游戏中的货币类型定义 tinyint(3) unsigned
	mvalue = 0,				%%附件的具体值，如果为道具则为道具的UID，如果为货币则为货币的数量 bigint(20) unsigned
	mvalue2 = 0				%%附件的具体值2，为道具的时候存储道具ID bigint(20) unsigned

}).

%%商城道具表
-record(rec_mall,{
	dbID = 0,				%%道具索引itemid+type+type1 int(10) unsigned
	itemID = 0,				%%道具ID smallint(5) unsigned
	sort = 0,				%%排序 int(4) unsigned
	type = 0,				%%1级菜单 tinyint(4) unsigned
	type1 = 0,				%%2级菜单 tinyint(4) unsigned
	diamond = 0,				%%出售非绑元宝值 int(4) unsigned
	bindDiamond = 0,				%%出售绑定元宝值 int(4) unsigned
	useIntegral = 0,				%%出售积分值 int(4) unsigned
	getIntegral = 0,				%%获得积分值 int(4)
	limitBuy = 0,				%%限购个数 int(4) unsigned
	limitDay = 0,				%%玩家每日限购 int(11) unsigned
	limitType = 0,				%%限购类型 tinyint(4)
	limitBeginTime = 0,				%%限购开始时间 int(4) unsigned
	limitEndTime = 0,				%%限购结束时间 int(4) unsigned
	buyReset = 0,				%%限购重置时间 int(4) unsigned
	level = 0,				%%可见等级限制 tinyint(4) unsigned
	recharge = 0,				%%可见充值限制 int(4) unsigned
	isHide = 0,				%%是否隐藏 0显示 1隐藏 tinyint(1) unsigned
	beginTime = 0,				%%优惠打折开始时间 int(4) unsigned
	endTime = 0,				%%优惠打折结束时间 int(4) unsigned
	rebate = 100,				%%折扣数 tinyint(4) unsigned
	rebateBeginTime = 0,				%%折扣开始时间 int(4) unsigned
	rebateEndTime = 0,				%%折扣结束时间 int(4) unsigned
	showType = 0,				%%优惠类型 0普通 1限购 2打折 tinyint(4) unsigned
	buySendItem = 0,				%%购买所送道具ID int(4) unsigned
	buySendNum = 0,				%%买一送的数量 int(4) unsigned
	buySendLimit = 0,				%%赠送个数限制 int(4) unsigned
	buySendBeginTime = 0,				%%赠送开始时间 int(4) unsigned
	buySendEndTime = 0,				%%赠送结束时间 int(4) unsigned
	buyNumDefalut = 1				%%默认购买数量 smallint(6)

}).

%%商城限购 购买记录表
-record(rec_malllimitbuy,{
	dbID = 0,				%%道具索引itemid+type+type1 int(10) unsigned
	roleId = 0,				%%玩家角色ID bigint(20) unsigned
	itemId = 0,				%%道具ID smallint(6) unsigned
	haveBuy = 0,				%%购买数量 int(10) unsigned
	time = 0				%%购买时间 int(4) unsigned

}).

%%宠物领地信息
-record(rec_manor_battle,{
	manorID = 0,				%%城池ID smallint(5) unsigned
	manorHp = 0,				%%城池当前护盾值 int(10) unsigned
	manorMaxHp = 0,				%%城池最大护盾值 int(10) unsigned
	manorPos = [],				%%城池占领宠物列表 varchar(128)
	manorForce = 0,				%%城池当前战斗力 int(10) unsigned
	manorTime = 0,				%%城池占领时间 bigint(20)
	roleID = 0				%%城池占领角色ID bigint(20) unsigned

}).

%%姻缘_关系描述
-record(rec_marriage,{
	roleID = 0,				%%角色id bigint(20) unsigned
	targetRoleID = 0,				%%目标角色id bigint(20) unsigned
	closeness = 0,				%%亲密度 int(11) unsigned
	timeRelation = 0,				%%达成关系的时间（结婚，time:getSyncTimeFromDBS/0） int(11) unsigned
	ringTop = 0,				%%婚戒突破次数 int(11) unsigned
	ringExp = 0				%%婚戒经验值 int(11) unsigned

}).

%%姻缘_夫妻技能
-record(rec_marriage_skill,{
	roleID = 0,				%%角色id bigint(20) unsigned
	slotID = 0,				%%技能槽位id，通过该ID取配置，配置中有真正的技能ID int(11) unsigned
	slotExp = 0				%%技能槽位经验 int(11) unsigned

}).

%%合服日志表，仅由合服工具操作
-record(rec_merge_log,{
	targetDBID = 0,				%%目标数据库ID smallint(5) unsigned
	sourceDBID = 0,				%%来源数据库ID smallint(5) unsigned
	timeBegin = 0,				%%开始合服时间 int(10) unsigned
	timeEnd = 0,				%%完成合服时间 int(10) unsigned
	v1 = 0,				%%主版本号 tinyint(3) unsigned
	v2 = 0,				%%次版本号 tinyint(3) unsigned
	v3 = 0				%%修订版本号 tinyint(3) unsigned

}).

%%服务器监控表
-record(rec_monitor,{
	m_type = 0,				%%监控类型 int(10) unsigned
	m_value = 0,				%%监控值 bigint(20) unsigned
	m_time = 0				%%最后一次时间刷新时间 bigint(20) unsigned

}).

%%离线玩家列表
-record(rec_offline_data,{
	roleID = 0,				%%玩家角色ID bigint(20) unsigned
	sysID = 0,				%%系统ID int(4) unsigned
	isLoad = 0				%%0:不加载 1:加载 tinyint(3) unsigned

}).

%%运营活动存储表
-record(rec_operate_activity,{
	id = 0,				%%活动ID int(10) unsigned
	type = 0,				%%活动类型 tinyint(4) unsigned
	name = "",				%%活动名称 varchar(256)
	desc = "",				%%活动描述 text
	phase = 0,				%%活动是否关闭，0未开启，1运行状态，2关闭状态 tinyint(4)
	starttime = 0,				%%活动开启时间 bigint(20)
	endtime = 0,				%%活动结束时间 bigint(20)
	minlevel = 0,				%%活动参与最小等级 tinyint(4) unsigned
	maxlevel = 0,				%%活动参与最大等级 tinyint(4) unsigned
	arg1 = "",				%%活动参数 text
	arg2 = "",				%%活动参数 text
	arg3 = "",				%%活动参数 text
	arg4 = "",				%%活动参数 text
	arg5 = ""				%%活动参数 text

}).

%%运营活动数据表
-record(rec_operate_data,{
	roleID = 0,				%%玩家角色ID bigint(20) unsigned
	id = 0,				%%活动ID int(10) unsigned
	arg1 = ""				%%活动数据 text

}).

%%运营活动产生的道具兑换
-record(rec_operate_exchange,{
	id = 0,				%%兑换ID int(10) unsigned
	exchangeType = 0,				%%兑换的类型，1.道具，2.货币，3.自定义 tinyint(3) unsigned
	exchangeTarget = 0,				%%兑换的目标，如果兑换的是道具，则为道具ID；如果是货币则为货币类型 int(10) unsigned
	exchangeNum = 0,				%%兑换的数量 smallint(5) unsigned
	require = "",				%%需要的道具信息，格式[{道具ID，道具数量},...]，实际最大支持8组数据 text
	limitCount = 0,				%%每个人可以兑换的最大次数 smallint(6)
	startTime = 0,				%%兑换的开始时间 int(11) unsigned
	endTime = 0,				%%兑换的结束时间 int(11) unsigned
	name = "",				%%名字，实际使用6个汉字字符 varchar(255)
	title = "",				%%标题，实际使用20个汉字字符 varchar(255)
	content = ""				%%内容，实际使用100个汉字字符 text

}).

%%角色在运营活动中兑换的数据信息
-record(rec_operate_exchange_data,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	exchangeID = 0,				%%活动ID int(10) unsigned
	exchangeCount = 0				%%兑换次数 smallint(6)

}).

%%
-record(rec_package_info,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	bagType = 0,				%%背包类型 tinyint(3) unsigned
	maxSlot = 0				%%背包已经开启的格子数 smallint(5) unsigned

}).

%%
-record(rec_personality_info,{
	roleID = 0,				%%玩家角色唯一ID bigint(20)
	photoData,				%%玩家照片数据 mediumblob
	praiseNum = 0,				%%玩家的赞数量 int(10) unsigned
	birthday = "",				%%玩家生日 varchar(30)
	starSign = "",				%%玩家星座 varchar(24)
	location = "",				%%玩家地址 varchar(57)
	sign = "",				%%玩家签名 varchar(144)
	tags = "",				%%玩家标签 text
	impressions = "",				%%玩家获得印象 text
	forbiddenTime = 0				%%玩家被禁止传照片的时间 bigint(20) unsigned

}).

%%宠物领地争夺战战报信息
-record(rec_pet_battle_report,{
	roleID = 0,				%%玩家角色ID bigint(20) unsigned
	br_list = ""				%%战报数据 text

}).

%%宠物远征副本信息
-record(rec_pet_dungeon_info,{
	roleID = 0,				%%玩家角色ID bigint(20) unsigned
	dungeon_ID = 0,				%%当前副本id smallint(5) unsigned
	pet_phys = 0,				%%宠物远征体力 smallint(5) unsigned
	pet_pos = [],				%%宠物位置列表 varchar(128)
	pet_reward = 0,				%%宠物远征当前收集星星领奖数量 smallint(5) unsigned
	time = 0				%%下线时间 bigint(20)

}).

%%宠物远征副本评分
-record(rec_pet_dungeon_score,{
	roleID = 0,				%%玩家角色ID bigint(20) unsigned
	dungeon_ID = 0,				%%副本id smallint(5) unsigned
	dungeon_score = 0				%%副本评分 tinyint(4) unsigned

}).

%%
-record(rec_pet_equip,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	equipPos = 0,				%%装备位置 tinyint(4) unsigned
	equipID = 0,				%%装备ID tinyint(4) unsigned
	equipLv = 0				%%装备等级 tinyint(4) unsigned

}).

%%
-record(rec_pet_info,{
	roleID = 0,				%%玩家角色ID bigint(20) unsigned
	petID = 0,				%%宠物id smallint(5) unsigned
	star = 0,				%%宠物星级 tinyint(4) unsigned
	status = 0,				%%0:休息 1:助战 2:出战 tinyint(4) unsigned
	name = "",				%%宠物名字 varchar(20)
	force = 0,				%%宠物战力 bigint(20)
	raw = 0,				%%转生 tinyint(4)
	attas = [],				%%宠物提升属性 varchar(120)
	time = 0				%%宠物到期时间 bigint(20)

}).

%%宠物领地争夺战玩家信息
-record(rec_pet_manor_battle,{
	roleID = 0,				%%玩家角色ID bigint(20) unsigned
	pet_reel = 0,				%%宠物争夺卷轴 smallint(5) unsigned
	pet_pos = [],				%%宠物位置列表 varchar(128)
	save_time = 0,				%%积分保存时间 bigint(20)
	off_time = 0,				%%下线时间 bigint(20)
	pet_integral = 0				%%积分 smallint(5)

}).

%%
-record(rec_pet_skill,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	petID = 0,				%%宠物ID smallint(5) unsigned
	skillID = 0,				%%技能ID int(10) unsigned
	index = 0,				%%技能索引 tinyint(4) unsigned
	level = 0,				%%等级 tinyint(4) unsigned
	unlock = 0,				%%0:未解锁 1:解锁 tinyint(4) unsigned
	type = 0,				%%技能type 0:天赋 1:通用 2:基础 tinyint(4) unsigned
	cd = 0				%%宠物技能CD bigint(20)

}).

%%图片管理主表 存储活跃的图片数据，需要加载到内存中
-record(rec_pic_data_main,{
	md5 = "",				%%md5码作为键值 char(32)
	data,				%%数据 mediumblob
	timeLastDown = 0,				%%最后一次请求下载的时间 int(11) unsigned
	timeLastUp = 0,				%%最后一次请求上传的时间 int(11) unsigned
	state = 1,				%%0审核通过1待审核2未过审 tinyint(3) unsigned
	count = 0				%%引用计数 int(11) unsigned

}).

%%图片管理副表 存储非活跃的图片数据，仅键值需要加载到内存中
-record(rec_pic_data_sub,{
	md5 = "",				%%md5码作为键值 char(32)
	data,				%%数据 mediumblob
	timeLastDown = 0,				%%最后一次请求下载的时间 int(11) unsigned
	timeLastUp = 0,				%%最后一次请求上传的时间 int(11) unsigned
	state = 1,				%%0审核通过1待审核2未过审 tinyint(3) unsigned
	count = 0				%%引用计数 int(11) unsigned

}).

%%平台名映射表，方便多个平台使用同一平台名
-record(rec_platform,{
	platformName = "",				%% varchar(50)
	targetPlatformName = ""				%% varchar(50)

}).

%%玩家计时器
-record(rec_player_clock,{
	roleID = 0,				%%玩家roleid bigint(20) unsigned
	clockType = 0,				%%计时器类型 bigint(20)
	offTime = 0,				%%下线是否计时(1计时,2不计时) tinyint(3) unsigned
	startTime = 0,				%%开始时间 datetime
	lastTime = 0,				%%最后一次记录时间 datetime
	lengthTime = 0,				%%持续时间，秒 int(11)
	passTime = 0				%%已经花去的时间，秒 int(11)

}).

%%玩家货币
-record(rec_player_coin,{
	roleID = 0,				%%角色唯一ID bigint(20) unsigned
	coinType = 0,				%%货币类型(1金币,2绑定金币,3钻石,4声望,5荣誉值,6绑定钻石,7紫色精华,8金色精华,9功勋,10积分,11魔能水晶,12军团贡献度) tinyint(3) unsigned
	coinNumber = 0				%%货币值 bigint(20) unsigned

}).

%%
-record(rec_player_coin_bak,{
	roleID = 0,				%%角色唯一ID bigint(20) unsigned
	coinType = 0,				%%货币类型(1金币,2绑定金币,3钻石,4声望,5荣誉值,6绑定钻石,7紫色精华,8金色精华,9功勋,10积分,11魔能水晶,12军团贡献度) tinyint(3) unsigned
	coinNumber = 0				%%货币值 bigint(20) unsigned

}).

%%
-record(rec_player_daily2,{
	roleID_A = 0,				%%角色ID_A，第一键值 bigint(20) unsigned
	roleID_B = 0,				%%角色ID_B，第二键值 bigint(20) unsigned
	daily2Type = 0,				%%每日计数器类型，第三键值，是公共计数类型是，第一键值一定比第二键值小 int(11) unsigned
	lastUpdateTime = 0,				%%最后一次更新时间 int(11) unsigned
	counter = 0				%%每日已经完成的计数器值 bigint(20)

}).

%%玩家保存数据
-record(rec_player_data,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	exitGuildTime = 0,				%%最后一次退出军团时间 bigint(20) unsigned
	guildAwardTime = 0				%%上一次获得军团多人副本奖励时间 bigint(20) unsigned

}).

%%玩家掉落规则
-record(rec_player_drop,{
	roleID = 0,				%%玩家角色ID bigint(20) unsigned
	id = 0,				%%掉落ID int(10) unsigned
	num = 0,				%%掉落数量 int(10) unsigned
	time = 0				%%更新时间 bigint(20) unsigned

}).

%%玩家资源找回表
-record(rec_player_find_res,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	activityID = 0,				%%活动ID smallint(5) unsigned
	param1 = 0,				%%参数1 int(10) unsigned
	param2 = 0,				%%参数2 int(10) unsigned
	freshtime = 0				%%最后一次刷新时间 bigint(20) unsigned

}).

%%玩家身份证信息表
-record(rec_player_identity,{
	roleID = 0,				%%角色唯一id bigint(20) unsigned
	face = "",				%%自定义头像 varchar(32)
	age = 255,				%%年龄，255表示未设置 tinyint(3) unsigned
	birthmonth = 0,				%%出生月，0表示未设置 tinyint(3) unsigned
	birthday = 0,				%%出生日，0表示未设置 tinyint(3) unsigned
	zodiac = 0,				%%星座，0表示未设置 tinyint(3) unsigned
	bloodType = 0,				%%血型，0表示未设置 tinyint(3) unsigned
	hometown1 = 0,				%%故乡信息1，0表示未设置 tinyint(3) unsigned
	hometown2 = 0,				%%故乡信息2，0表示未设置 tinyint(3) unsigned
	location1 = 0,				%%所在地信息1，0表示未设置 tinyint(3) unsigned
	location2 = 0,				%%所在地信息2，0表示未设置 tinyint(3) unsigned
	tags = "",				%%标签信息集 varchar(10)
	pic1 = "",				%%相片1 varchar(32)
	pic2 = "",				%%相片2 varchar(32)
	pic3 = "",				%%相片3 varchar(32)
	sign = ""				%%签名 varchar(255)

}).

%%玩家活跃度
-record(rec_player_liveness,{
	playerID = 0,				%%玩家角色唯一ID bigint(8) unsigned
	livenessValue = 0,				%%玩家活跃度值 int(4) unsigned
	livenessList,				%%玩家活跃度完成列表 varbinary(1024)
	livenessGiftDrew,				%%领奖列表 varbinary(64)
	lastUpdateTime = 0				%%上次活跃重置时间 bigint(20) unsigned

}).

%%神秘商店最近一轮购买记录
-record(rec_player_ms_shop,{
	roleID = 0,				%%玩家唯一ID bigint(20) unsigned
	only_id = 0,				%%配置唯一ID(策划控制) int(10) unsigned
	itemID = 0,				%%购买的道具ID smallint(5) unsigned
	count = 0				%%已经购买的个数 smallint(5) unsigned

}).

%%玩家属性通用表
-record(rec_player_prop,{
	roleID = 0,				%%角色唯一id bigint(20) unsigned
	propIndex = 0,				%%属性索引 smallint(6) unsigned
	propValue = ""				%%属性值 text

}).

%%玩家排行榜
-record(rec_player_rank,{
	roleID = 0,				%%玩家角色id bigint(20) unsigned
	rankType = 0,				%%排行榜类型 tinyint(3) unsigned
	rankSort = 0,				%%排行榜排名 smallint(5) unsigned
	rankSortC = 0,				%%排行榜排名变化，正数为上升，负数为下降 smallint(6)
	value1 = 0,				%%排名数据1 bigint(20)
	value2 = 0,				%%排名数据2 bigint(20)
	value3 = 0,				%%排名数据3 bigint(20)
	createTime = 0				%%本次榜单生成时间 datetime

}).

%%新版骑宠领地-角色领地表
-record(rec_player_territory,{
	roleID = 0,				%%玩家角色ID bigint(20) unsigned
	territoryID = 0,				%%领地ID int(11) unsigned
	cfgReward = 0,				%%等级段配置，对应pet_territory_reward.id int(11) unsigned
	cfgTime = 0,				%%开采时间(小时) int(11) unsigned
	cfgLevel = 0,				%%领地等级配置(1普通，2黄金) int(11) unsigned
	cfgForce = 0,				%%战力等级配置，对应pet_territory_force.id int(11) unsigned
	timeFresh = 0,				%%最近结算时间 int(11) unsigned
	timeEnd = 0,				%%最终结算时间 int(11) unsigned
	rewardCount1 = 0,				%%奖励数量1 int(11) unsigned
	rewardCount2 = 0,				%%奖励数量2 int(11) unsigned
	timeSafe = 0,				%%被掠夺后的，安全保护时间 int(11) unsigned
	timeSearch = 0				%%搜索后的保护时间，该字段不因单独改变而写入数据库 int(11) unsigned

}).

%%新版骑宠领地-掠夺记录
-record(rec_player_territory_history_a,{
	roleID = 0,				%%玩家角色ID bigint(20) unsigned
	timeEvent = 0,				%%战斗发生时间 int(11) unsigned
	targetRoleID = 0,				%%目标玩家角色ID bigint(20) unsigned
	territoryID = 0,				%%领地ID int(11) unsigned
	cfgReward = 0,				%%等级段配置，对应pet_territory_reward.id int(11) unsigned
	count1 = 0,				%%战利品1数量 int(11) unsigned
	count2 = 0				%%战利品2数量 int(11) unsigned

}).

%%新版骑宠领地-防守记录
-record(rec_player_territory_history_d,{
	roleID = 0,				%%玩家角色ID bigint(20) unsigned
	timeEvent = 0,				%%战斗发生时间 int(11) unsigned
	targetRoleID = 0,				%%目标玩家角色ID bigint(20) unsigned
	territoryID = 0,				%%领地ID int(11) unsigned
	cfgReward = 0,				%%等级段配置，对应pet_territory_reward.id int(11) unsigned
	count1 = 0,				%%战利品1数量 int(11) unsigned
	count2 = 0				%%战利品2数量 int(11) unsigned

}).

%%新版骑宠领地-骑宠领地表
-record(rec_player_territory_pet,{
	roleID = 0,				%%玩家角色ID bigint(20) unsigned
	petID = 0,				%%骑宠ID int(11) unsigned
	petLevel = 0,				%%骑宠等级 int(11) unsigned
	territoryID = 0,				%%领地ID int(11) unsigned
	petForce = 0,				%%骑宠战力 bigint(20) unsigned
	prop,				%%附加属性 [{propId, propValue}, ...] blob
	skill,				%%附加技能 [{skillId, skillLv}, ...] blob
	star = 0,				%%宠物星级 tinyint(3) unsigned
	raw = 0				%%转生 tinyint(3) unsigned

}).

%%预充值账号及金额信息表
-record(rec_pre_charge_account,{
	accountID = 0,				%%玩家账号唯一ID bigint(20) unsigned
	amount				%% double

}).

%%
-record(rec_recharge,{
	roleID = 0,				%%角色id bigint(20) unsigned
	feOrderID = "",				%%funcell平台生成的订单号 char(50)
	otherOrderID = "",				%%外部渠道订单号 varchar(100)
	gameMoneyAmount = 0,				%%游戏币数 int(11)
	moneyType = "",				%%货币类型 char(16)
	currencyAmount = 0,				%%实际支付金额 float
	giftStr = "",				%%json的订单返利规则 text
	status = 0,				%%默认为0，1为取出，2为发货成功 tinyint(1)
	addTime = 0,				%%充值时间 int(1) unsigned
	purchaseToken = "",				%%向ums索取订单时使用的token varchar(255)
	item_amount = 0,				%%购买道具数量 int(11)
	item_id,				%%购买道具的id,次ID为渠道-平台-游戏三方约定的一个发货代码，因此对应到的具体物品id需要一个映射关系、订单系统暂时不对该功能进行支持。扩展的时候只需要增加一个配置文件将对应关系配置起来即可。 varbinary(255)
	category				%%订单类型 varbinary(255)

}).

%%
-record(rec_recharge_bak,{
	roleID = 0,				%%角色id bigint(20) unsigned
	feOrderID = "",				%%funcell平台生成的订单号 char(50)
	otherOrderID = "",				%%外部渠道订单号 varchar(100)
	gameMoneyAmount = 0,				%%游戏币数 int(11)
	moneyType = "",				%%货币类型 char(16)
	currencyAmount = 0,				%%实际支付金额 float
	giftStr = "",				%%json的订单返利规则 text
	status = 0,				%%默认为0，1为取出，2为发货成功 tinyint(1)
	addTime = 0,				%%充值时间 int(1) unsigned
	purchaseToken = "",				%%向ums索取订单时使用的token varchar(255)
	item_amount = 0,				%%购买道具数量 int(11)
	item_id,				%%购买道具的id,次ID为渠道-平台-游戏三方约定的一个发货代码，因此对应到的具体物品id需要一个映射关系、订单系统暂时不对该功能进行支持。扩展的时候只需要增加一个配置文件将对应关系配置起来即可。 varbinary(255)
	category				%%订单类型 varbinary(255)

}).

%%充值返利的配置项
-record(rec_recharge_rebate,{
	id = 0,				%%充值返利id与类型（低8位为类型，其余为id） int(10) unsigned
	type = 0,				%%1表示期首充，3表示期间每笔，5表示充值金额首充双倍,2表示累充送物品 tinyint(1) unsigned
	rebateId = 0,				%%充值返利id(3byte内) int(1) unsigned
	beginTime = 0,				%%活动开始时间 int(1) unsigned
	endTime = 0,				%%活动结束时间 int(1) unsigned
	arg1 = "",				%%模板参数 text
	arg2 = "",				%%模板参数 text
	arg3 = "",				%%模板参数 text
	arg4 = "",				%%模板参数 text
	arg5 = "",				%% text
	arg6 = "",				%% text
	arg7 = ""				%% text

}).

%%充值活动参与标记记录
-record(rec_recharge_rebate_taken,{
	roleID = 0,				%%角色id bigint(1) unsigned
	rebateIdAndType = 0				%%活动配置id(recharge_rebate表的id,备注为准 int(1) unsigned

}).

%%红包发送记录表
-record(rec_redenvelope,{
	redUID = 0,				%%红包唯一ID bigint(20) unsigned
	creator = 0,				%%发送者ID bigint(20) unsigned
	targetUID = 0,				%%指定对象UID，玩家ID，军团ID，地图ID bigint(20) unsigned
	targetType = 0,				%%目标类型，世界，军团，结婚，地图等，具体见定义 tinyint(3) unsigned
	redType = 0,				%%红包类型：1定额，2随机 tinyint(3) unsigned
	allNumber = 0,				%%目标人数,0不限制 int(10) unsigned
	takeNumber = 0,				%%领取人数 int(10) unsigned
	moneyType = 0,				%%金钱类型 tinyint(3) unsigned
	allMoney = 0,				%%红包总额 int(10) unsigned
	takeMoney = 0,				%%领取金额 int(10) unsigned
	createTime = 0,				%%发送时间 int(10) unsigned
	deadlineTime = 0,				%%到期时间 int(10) unsigned
	luckContent = ""				%%祝福语 varchar(255)

}).

%%角色已经领取了的活动key
-record(rec_role_award_takens,{
	role_id = 0,				%%角色id bigint(20) unsigned
	award_id = 0,				%%已经领取了的活动ID int(10) unsigned
	taken_time = 0				%%领取时间 int(11)

}).

%%
-record(rec_role_fashions,{
	roleID = 0,				%%玩家id bigint(1) unsigned
	fashionID = 0,				%%时装Id int(1) unsigned
	endTime = 0				%%结束时间 int(10) unsigned

}).

%%符文基础表
-record(rec_rune_base,{
	runeUID = 0,				%%符文UID bigint(20) unsigned
	runeID = 0,				%%符文ID int(10) unsigned
	roleID = 0,				%%拥有者ID(玩家RoleID) bigint(20) unsigned
	subOwnerID = 0,				%%子拥有者，意思为当前拥有者自身或者某个宠物对象 int(10) unsigned
	level = 1,				%%符文等级 smallint(5) unsigned
	exp = 0,				%%符文当前等级累积的经验 int(10) unsigned
	isBind = 0,				%%是否绑定，0非绑定，1绑定 tinyint(3) unsigned
	createTime = 0,				%%创建时间 datetime
	deleteTime = 0,				%%删除时间 datetime
	expiredTime = 0				%%过期时间，有设置才有过期时间 datetime

}).

%%符文属性表
-record(rec_rune_prop,{
	runeUID = 0,				%%符文UID bigint(20) unsigned
	propType = 0,				%%符文属性类型，1基础属性，2随机属性 tinyint(3) unsigned
	propKey = 0,				%%属性Key smallint(5) unsigned
	propValue = 0,				%%属性值 double
	calcType = 0				%%属性计算方式 0：加法 1：乘法 tinyint(3) unsigned

}).

%%服务器掉落
-record(rec_server_drop,{
	id = 0,				%%掉落ID int(10) unsigned
	num = 0,				%%掉落数量 int(10) unsigned
	time = 0				%%更新时间 bigint(20) unsigned

}).

%%服务器启停状态(本表很重要，禁止清空与随意修改)
-record(rec_serverinfo,{
	id = 0,				%%ID编号 smallint(5) unsigned
	starttime = 0,				%%启服时间 int(10) unsigned
	endtime = 0				%%关服时间 int(10) unsigned

}).

%%角色技能信息
-record(rec_skill,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	skillID = 0,				%%技能ID int(10) unsigned
	level = 0,				%%技能等级 tinyint(3) unsigned
	lastUseTime = 0				%%上次使用的时间 bigint(20) unsigned

}).

%%角色技能插槽中所放的技能
-record(rec_skill_slot,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	slot = 0,				%%技能所在技能槽，主动技能从1开始，被动技能从100开始 tinyint(4) unsigned
	skillID = 0				%%技能ID int(10) unsigned

}).

%%记录装备兑换功能有兑换上限的兑换操作
-record(rec_sourceshop_forever_limit,{
	roleID = 0,				%%角色id(不同type,roleid可重复 bigint(20) unsigned
	sourceshopIDList = "",				%%erlangg列表格式的字符串 text
	type = 0				%%记录标志的类型（0为装备兑换，1为爵位购买 smallint(5) unsigned

}).

%%数据库的杂项
-record(rec_sundries,{
	id = 0,				%%功能ID smallint(6)
	key = "",				%%功能下使用的Key，可以是一个Erlang Term varchar(255)
	value = ""				%%功能下使用的值，是一个erlang term text

}).

%%
-record(rec_talent,{
	roleID = 0,				%%玩家ID bigint(20) unsigned
	propIntensify = 0,				%%属性强化等级 tinyint(7) unsigned
	phyDefIntensify = 0,				%%物防强化等级 tinyint(7) unsigned
	magDefIntensify = 0,				%%魔防强化等级 tinyint(7) unsigned
	petDamIntensify = 0,				%%宠物伤害强化等级 tinyint(7) unsigned
	petDefIntensify = 0				%%宠物防御强化等级 tinyint(7) unsigned

}).

%%任务表
-record(rec_task,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	taskID = 0,				%%任务ID int(11)
	taskType = 0,				%%任务类型 int(11)
	taskSubType = 0,				%%任务子类型 int(11)
	taskKey = 0,				%%任务key int(11)
	taskTarget = 0,				%%任务目标 int(11)
	taskTargetCur = 0,				%%当前数量 int(11)
	taskTargetMax = 0				%%最大数量 int(11)

}).

%%
-record(rec_task_accepted,{
	roleID = 0,				%%角色id bigint(20) unsigned
	taskID = 0,				%%任务id smallint(6) unsigned
	subType1 = 0,				%%子任务类型(打怪，采集) tinyint(4) unsigned
	count1 = 0,				%%当前完成数量(如怪物数量，采集物数量) tinyint(4) unsigned
	subType2 = 0,				%%子任务类型(打怪，采集) tinyint(4) unsigned
	count2 = 0,				%%当前完成数量(如怪物数量，采集物数量) tinyint(4) unsigned
	subType3 = 0,				%%子任务类型(打怪，采集) tinyint(4) unsigned
	count3 = 0				%%当前完成数量(如怪物数量，采集物数量) tinyint(4) unsigned

}).

%%
-record(rec_task_submitted,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	taskSlot = 0,				%%任务旗标索引，支持65536个任务ID，需要65536/64＝1024个索引 smallint(5) unsigned
	taskFlag = 0				%%任务旗标，每个任务占一个位 bigint(20) unsigned

}).

%%称号系统
-record(rec_title,{
	roleID = 0,				%%角色ID bigint(20) unsigned
	titleID = 0,				%%称号ID smallint(6) unsigned
	endTime = 0				%%称号结束时间,0 表示永久有效 int(16)

}).

%%
-record(rec_trade,{
	orderID = 0,				%%订单ID bigint(20) unsigned
	roleID = 0,				%%出售者角色ID bigint(20) unsigned
	itemUID = 0,				%%出售者原装备唯一ID bigint(20) unsigned
	sellType = 0,				%%出售类型,1铜币交易,2元宝交易,3指定交易 tinyint(4) unsigned
	putTime = 0,				%%上架时间 datetime
	downTime = 0,				%%下架时间 datetime
	silver = 0,				%%银币 int(10) unsigned
	gold = 0,				%%金币 int(10) unsigned
	destRoleID = 0,				%%指定卖给谁 bigint(20) unsigned
	sellState = 0,				%%出售状态,0待售,1已锁定,2已出售,3已完成交易 tinyint(4) unsigned
	relateRoleID = 0,				%%改变当前交易状态的人 bigint(20) unsigned
	itemID = 0,				%%道具编号ID int(11)
	quality = 0				%%道具品质 tinyint(4) unsigned

}).

%%变量存储表
-record(rec_variant0,{
	roleID = 0,				%%玩家ID bigint(20) unsigned
	index = 0,				%%设置键 smallint(5) unsigned
	value = 0				%%设置值 int(11) unsigned

}).

%%变量存储表
-record(rec_variant1,{
	roleID = 0,				%%玩家ID bigint(20) unsigned
	index = 0,				%%设置键 smallint(5) unsigned
	value = 0				%%设置值 int(11) unsigned

}).

%%变量存储表
-record(rec_variant2,{
	roleID = 0,				%%玩家ID bigint(20) unsigned
	index = 0,				%%设置键 smallint(5) unsigned
	value = 0				%%设置值 int(11) unsigned

}).

%%变量存储表
-record(rec_variant3,{
	roleID = 0,				%%玩家ID bigint(20) unsigned
	index = 0,				%%设置键 smallint(5) unsigned
	value = 0				%%设置值 int(11) unsigned

}).

%%变量存储表
-record(rec_variant4,{
	roleID = 0,				%%玩家ID bigint(20) unsigned
	index = 0,				%%设置键 smallint(5) unsigned
	value = 0				%%设置值 int(11) unsigned

}).

%%变量存储表
-record(rec_variant5,{
	roleID = 0,				%%玩家ID bigint(20) unsigned
	index = 0,				%%设置键 smallint(5) unsigned
	value = 0				%%设置值 int(11) unsigned

}).

%%变量存储表
-record(rec_variant6,{
	roleID = 0,				%%玩家ID bigint(20) unsigned
	index = 0,				%%设置键 smallint(5) unsigned
	value = 0				%%设置值 int(11) unsigned

}).

%%变量存储表
-record(rec_variant7,{
	roleID = 0,				%%玩家ID bigint(20) unsigned
	index = 0,				%%设置键 smallint(5) unsigned
	value = 0				%%设置值 int(11) unsigned

}).

%%变量存储表
-record(rec_variant8,{
	roleID = 0,				%%玩家ID bigint(20) unsigned
	index = 0,				%%设置键 smallint(5) unsigned
	value = 0				%%设置值 int(11) unsigned

}).

%%变量存储表
-record(rec_variant9,{
	roleID = 0,				%%玩家ID bigint(20) unsigned
	index = 0,				%%设置键 smallint(5) unsigned
	value = 0				%%设置值 int(11) unsigned

}).

%%
-record(rec_warrior_trial,{
	roleID = 0,				%%玩家ID bigint(20) unsigned
	trialSchedule = 0,				%%勇士试炼的最高记录 tinyint(3) unsigned
	tswkTrialSchedule = 0,				%%勇士试炼的周最高记录 tinyint(3) unsigned
	tswkTrialTime = 0				%%勇士试炼当前关卡的时间 int(10) unsigned

}).

%%更新、活动公告，用xml来存储内容
-record(rec_xml_notice,{
	type = 0,				%%1更新公告;2活动公告 tinyint(3) unsigned
	content = "",				%% text
	md5 = ""				%% char(32)

}).

-endif.
