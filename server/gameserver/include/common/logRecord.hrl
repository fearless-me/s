%%日志记录结构定义
-ifndef(LOGRECORD_HRL).
-define(LOGRECORD_HRL,1).

%%日志类型
-define(LogType_AccountLogin,    1).    %%帐号登录
-define(LogType_ChatInfo,	     2).	%%聊天记录	
-define(LogType_Coin,	         3).	%%货币使用
-define(LogType_CreateGoods,     4).	%%物品创建
-define(LogType_CreateMail,      5).	%%创建邮件
-define(LogType_CreatePet,       6).	%%创建宠物
-define(LogType_CreatePlayer,    7).	%%创建角色
-define(LogType_Trade,     		 8).	%%创建交易行
-define(LogType_ExpChange,       9).	%%经验值变更
-define(LogType_Gold,           10).	%%金币
-define(LogType_GoodsChange,    11).	%%物品变化
-define(LogType_MailChange,     12).	%%邮件修改
-define(LogType_MallBuy,        13).	%%商城购卖
-define(LogType_OnlinePlayers,  14).	%%在线玩家
-define(LogType_Pet,            15).	%%宠物
-define(LogType_PlayerDelete,   16).	%%角色删除
-define(LogType_Friend,         17).	%%好友
-define(LogType_PlayerOffline,  18).	%%玩家离线
-define(LogType_Skill,          19).	%%技能
-define(LogType_Task,           20).	%%任务
-define(LogType_PresentRecharge,21).	%%目前充值
-define(LogType_Recharge,       22).	%%充值
-define(LogType_RechargeClient, 23).	%%客户端充值
-define(LogType_Trade_OP,       24).	%%交易行操作日志
-define(LogType_Web2lsCommand,  25).	%%平台所发操作指令
-define(LogType_GMCmd,          26).	%%GM指令
-define(LogType_PlayerLevel,    27).	%%玩家等级变化
-define(LogType_PlayerCB,       28).    %%玩家反馈CoupleBack
-define(LogType_Rank,			29).	%%排行榜
-define(LogType_Forbidden,	    30).	%%封号
-define(LogType_HDBattleHurt,	31).	%%混沌战场给boss造成的伤害排行榜
-define(LogType_HDBattleKill,	32).	%%混沌战场击杀玩家排行榜
-define(LogType_EventLog,		33).	%%事件记录
-define(LogType_CompanionLog,	34).	%%=================原灵魂伙伴成员变动日志，可占用===================
-define(LogType_Title,			35).	%%称号
-define(LogType_AchieveNum, 	36).    %%成就点数
-define(LogType_MallChange,		37).	%%商城道具变化日志
-define(LogType_PetUpStar,		38).	%%宠物升星日志
-define(LogType_PetSkillCast,	39).	%%宠物技能洗练日志
-define(LogType_PetEquipStr,	40).	%%宠物装备强化日志
-define(LogType_RoleExt,     	41).    %%离线经验日志
-define(LogType_PetRaw,     	42).    %%宠物转生
-define(LogType_GuildBattleInfo,43).    %%军团联赛日志
-define(LogType_ParticipatorInfo,44).   %%各种玩法统计的玩家信息
-define(LogType_WeaponInfo,		45).	%%神器日志
-define(LogType_Rune,		    46).	%%符文日志
-define(LogType_AccountLogin2,  47).	%%帐号登录2
-define(LogType_RedEnvelope,  	48).	%%红包日志
-define(LogType_ChangeRoleOwner,49).	%%角色转移
-define(LogType_CopyInfo,50).	%%副本记录
-define(LogType_Marriage,         51).	%%婚姻
-define(LogType_Max,			52).


%%玩法参与统计子类型(要加相应结构的表)
-define(LogParticipator_Min,			1).
-define(LogParticipator_GuildBattle,				1).%%军团联赛
-define(LogParticipator_FightAll,				2).%%战天下
-define(LogParticipator_GuildBattlePlayerIn,	3).%%军团成员进入联赛中
-define(LogParticipator_HDBattlePlayerIn,		4).%%玩家进入混沌战场
-define(LogParticipator_WarriorTrialPlayerIn,	5).%%玩家进入勇者试炼
-define(LogParticipator_PlayerBuyMSshop,		6).%%玩家在神秘商店买了东西
-define(LogParticipator_PlayerFreshMSshop,		7).%%玩家刷新神秘商店
-define(LogParticipator_PlayerUseLotteryEveDay,	8).%%玩家使用占卜
-define(LogParticipator_PlayerLoopTaskID,		9).%%玩家接的循环任务
-define(LogParticipator_PlayerUseAnswer,		10).%%玩家参与答题
-define(LogParticipator_CrosHDBattle,			11).%%跨服混沌战场
-define(LogParticipator_CrosArenaBattle,		12).%%跨服竞技战场
-define(LogParticipator_Max,			12).

%%玩法统计类型mysql预编译
-define(LogParticipator_PrepareList,			[?LogParticipator_FightAll,?LogParticipator_GuildBattlePlayerIn,?LogParticipator_HDBattlePlayerIn,
	?LogParticipator_WarriorTrialPlayerIn,?LogParticipator_PlayerBuyMSshop,?LogParticipator_PlayerFreshMSshop,
	?LogParticipator_PlayerUseLotteryEveDay,?LogParticipator_PlayerLoopTaskID,?LogParticipator_PlayerUseAnswer,
	?LogParticipator_CrosHDBattle,?LogParticipator_CrosArenaBattle]).

%% 打包存储的LogTypeList
%% 注意，有SQL注入危险的，要特殊处理prepare流程
%% 在线玩家这种需要即时性的数据不需要打包存储
-define(CacheLogTypeList, [
	?LogType_GMCmd,		%% FIXME 机器人压力测试时，机器人全部执行GM指令，压力太大
	?LogType_AccountLogin,
	?LogType_AccountLogin2,
%%	?LogType_ChatInfo,
	?LogType_Coin,
	?LogType_CreateGoods,
%%	?LogType_CreateMail,
	?LogType_CreatePet,
	?LogType_CreatePlayer,
	?LogType_ExpChange,
	?LogType_Gold,
	?LogType_GoodsChange,
	?LogType_MailChange,
	?LogType_MallBuy,
	?LogType_PlayerDelete,
	?LogType_Friend,
	?LogType_Marriage,
	?LogType_PlayerOffline,
	?LogType_Skill,
	?LogType_Task,
	?LogType_Trade,
	?LogType_PlayerLevel,
	?LogType_Rank,
	?LogType_CompanionLog,
	?LogType_Title,
	?LogType_AchieveNum,
	?LogType_PetUpStar,
	?LogType_PetSkillCast,
	?LogType_PetEquipStr,
	?LogType_RoleExt,
	?LogType_PetRaw,
	?LogType_ParticipatorInfo,
	?LogType_WeaponInfo,
	?LogType_Rune,
	?LogType_RedEnvelope,
	?LogType_Trade_OP,
	?LogType_CopyInfo
]).

%%帐号登录
-record(recLogAccountLogin,{
	accountID = 0,				%%帐号ID
	platformAccountID = 0,		%%平台帐号
	platformID = 0,				%%平台ID
	versionClientExe = 0,		%%客户端执行段版本号
	versionClientRes = 0,		%%客户端资源版本号
	ip = 0,						%%用户登录IP
	mac = 0,					%%用户MAC地址
	imei = 0,					%%用户IMEI串号（Android才有）
	idfa = 0,					%%用户广告标识（IOS7才有）
	globalClientSetupKey = 0,	%%客户端安装唯一标识
	time = 0					%%登录时间，UNIX_TIME
}).

%%聊天记录
-record(recLogChatInfo,{
	sendPlayerID = 0,               %%发送者玩家ID，=0表示系统发送
	receiveplayerid = 0,			%%接收者玩家ID
	chatString = 0,					%%聊天内容
	chatChannel = 0,				%%聊天频道（1.世界，2.私聊，3.队伍，4.帮会，5.系统）
	time = 0						%%发送时间
}).

%%货币使用
-record(recLogCoin,{
	playerID,accountID,platformName,oldcoin,newcoin,addOrDec,changecoin,reason,target,source,param,dbID,time,moneyType
}).

%%物品创建
-record(recLogCreateGoods,{
	ownerID = 0,					%%拥有者ID
	goodsUID = 0,					%%物品唯一ID
	goodsID = 0,					%%物品ID
	pileNum = 0,					%%物品所在背包
	isBinded = 0,					%%物品数量
	bagType = 0,					%%是否绑定，（0=未绑定，1=绑定）
	curEnhLevel = 0,				%%装备强化等级
	quality = 0,					%%装备品质
	createReson = 0,				%%创建物品原因码
	createFromParam = 0,			%%创建来源参数
	time = 0						%%时间
}).

%%称号创建
-record(recLogCreateTitle,{
	playerID = 0,					%%角色ID
	titleID = 0,					%%称号ID
	source = 0,			    		%%来源
	time = 0						%%时间
}).

%%离线经验领取
-record(recLogRoleExt, {
	roleID = 0,
	totalOfflineTime = 0,
	rewardNum = 0,
	rewardType = 0,
	time = 0
}).

%%邮件
-record(recLogCreateMail,{
	mailUID = 0,					%%邮件唯一ID
	senderRoleID = 0,				%%邮件发送者ID
	senderRoleName = 0,				%%邮件发送者名字
	toRoleID = 0,					%%邮件接收者ID
	toRoleName = 0,					%%邮件接收者名字
	mailTitle = 0,					%%邮件标题
	mailContent = 0,				%%邮件内容
	mailSubjoinMsg = 0,				%%预留
	attachItemUID_1 = 0,			%%附件物品UID
	attachItemDataID_1 = 0,			%%附件物品DataID
	attachItemUID_2 = 0,			%%附件物品UID
	attachItemDataID_2 = 0,			%%附件物品DataID
	attachCoinType = 0,				%%附件货币类型
	attachCoin = 0,					%%附件货币值
	time = 0						%%时间
}).

%%创建宠物
-record(recLogCreatePet,{
	playerID = 0,				%% 角色ID
	petID,						%% 宠物ID
	time = 0					%% 时间
}).


%%宠物升星
-record(recLogPetUpStar,{
	playerID = 0,				%% 角色ID
	petID = 0,					%% 宠物ID
	oldStar = 0,
	newStar = 0,
	time = 0					%% 时间
}).

%%宠物转生
-record(recLogPetRaw,{
	playerID = 0,				%% 角色ID
	petID = 0,					%% 宠物ID
	oldRaw = 0,
	newRaw = 0,
	time = 0					%% 时间
}).

%%宠物洗练
-record(recLogPetCast,{
	playerID = 0,				%% 角色ID
	petID = 0,					%% 宠物ID
	oldSkillID = 0,
	oldSkillLevel = 0,
	newSkillID = 0,
	newSkillLevel = 0,
	time = 0					%% 时间
}).

%%宠物装备强化
-record(recLogPetEquipStr,{
	playerID = 0,				%% 角色ID
	oldEquipID = 0,
	oldLevel = 0,
	newEquipID = 0,
	newLevel = 0,
	time = 0					%% 时间
}).

%%创建角色
-record(recLogCreatePlayer,{
	playerID = 0,				%%角色ID
	name = 0,					%%角色名字
	accountID = 0,				%%角色帐号ID
	sex = 0,					%%性别,0为女，1为男
	camp = 0,					%%阵营
	race = 0,					%%种族
	career = 0,					%%职业
	time = 0					%%时间
}).

%%经验修改
-record(recLogExpChange,{
	playerID = 0,					%%角色ID
	oldLevel = 0,					%%加经验之前的等级
	newLevel = 0,					%%加经验之后的等级
	changType = 0,					%%经验改变类型
	changValue = 0,					%%经验改变值
	changePrama = 0,				%%经验改变来源参数
	time = 0,						%%时间
	curExp                          %%当前经验
}).

%%金币消费（实际为钻石消耗）
-record(recLogGold,{
	playerID,accountID,platformName,olddiamond,newdiamond,addOrDec,changediamond,reason,target,source,param,dbID,time,moneyType
}).

%%物品修改
-record(recLogGoodsChange,{
	playerID,accountID,platformName,itemUID,itemID,old,new,change,target,source,gold,goldtype,changReason,reasonParam,dbID,time
}).

%%邮件修改
-record(recLogMailChange,{
	playerID = 0,					%%角色ID
	mailUID = 0,					%%邮件UID
	changeType = 0,					%%变化原因
	time = 0						%%时间
}).

%%商城
-record(recLogMallBuy,{
	playerID = 0,					%%角色ID
	itemDataID = 0,					%%购买物品DataID
	buyCount = 0,					%%购买物品数量
	payMoneyType = 0,				%%购买金币类型
	payMoney = 0,					%%购买金币数量
	time = 0						%%时间
}).

%%在线玩家
-record(recLogOnlinePlayers, {
	count = 0,					%%在线人数
	time = 0					%%时间
}).

%%宠物
-record(recLogPet,{
	playerID = 0,						%%角色ID
	petID = 0,							%%宠物ID
	changeField = 0,					%%宠物属性变化字段索引
	changeValue = 0,					%%宠物属性变化值
	newValue = 0,						%%变化后的新值
	time = 0							%%时间
}).

%%删除玩家
-record(recLogPlayerDelete,{
	playerID = 0,				%%角色ID
	level = 0,					%%等级
	gold = 0,					%%金币
	bindGold = 0,				%%绑定金币
	diamond = 0,				%%钻石
	ticket = 0,					%%点券
	prestige = 0,				%%声望
	honor = 0,					%%荣誉
	purpleEssence = 0,			%%紫色精华
	goldenEssence = 0,			%%金色精华
	time = 0					%%时间
}).

%%玩家离线
-record(recLogPlayerOffline,{
	playerID = 0,				%%角色ID
	level = 0,					%%等级
	exp = 0,					%%经验值
	gold = 0,					%%金币
	bindgold = 0,				%%绑定金币
	diamond = 0,				%%钻石
	prestige = 0, 				%%声望
	honor = 0,					%%荣誉值
	ticket = 0,					%%点券
	purpleEssence = 0,			%%紫色精华
	goldenEssence = 0,			%%金色精华
	onlineOrOffline = 0,		%%上线还是下线，（=0表示上线，=1表示下线）
	time = 0,					%%时间
	time2 = 0
}).

%%技能
-record(recLogSkill,{
	playerID = 0,						%%角色ID
	skillID = 0,						%%技能ID
	level = 0,							%%角色等级
	time = 0							%%时间
}).

%%任务
-record(recLogTask,{
	playerID = 0,						%%角色ID
	taskDataID = 0,						%%任务DataID
	level = 0,							%%角色等级
	type = 0,							%%任务事件，（1.接取，2.归还）
	time = 0							%%时间
}).

%%目前充值
-record(recLogPresentRecharge,{
	orderid = 0,				%%订单号
	platformAccount = 0,		%%平台帐号
	platformID = 0,				%%平台ID
	accountID = 0,				%%帐号ID
	playerID = 0,				%%角色ID
	rechargeAmmount = 0,		%%充值现实货币
	getedGold = 0,				%%充值获得元宝值
	presentGold = 0,			%%赠送元宝值
	reason = 0,					%%赠送原因
	time = 0					%%时间
}).

%% %%支付支付状态：收到ums消息
%% -define(LOG_RECHARGE_STATE_RECEIVE_UMS_MSG,1).
%% %%支付支付状态：准备发货给用户
%% -define(LOG_RECHARGE_STATE_READY_GIVE_ITEM_TO_USER,2).
%% %%支付支付状态：准备发货给用户流程成功执行
%% -define(LOG_RECHARGE_STATE_READY_GIVE_ITEM_TO_USER_SUCCESS,3).
%% %%支付支付状态：准备发货给用户流程执行失败
%% -define(LOG_RECHARGE_STATE_READY_GIVE_ITEM_TO_USER_FAIL,-3).
%% %%支付支付状态：成功将货物发给用户
%% -define(LOG_RECHARGE_STATE_GIVE_ITEM_TO_USER_SUCCESS,4).
%% %%支付支付状态：将货物发给用户是失败了
%% -define(LOG_RECHARGE_STATE_GIVE_ITEM_TO_USER_FAIL,-4).
%%%%充值
%%-record(recLogRecharge,{
%%	playerID,accountID,platformAccount,orderid,rechargeAmmount,platformID,platformName,moneytype,getedGold,time,dbID
%%}).
%%充值日志
%%-record(recLogRecharge, {
%%	playerID,
%%	accountID,
%%	platformAccount,
%%	orderid,
%%	rechargeAmmount,
%%	platformID,
%%	platformName,
%%	moneytype,
%%	coinNum
%%}).
%%该日志会三个地方进行记录
%% 1、支付进程收到http消息，并且对该消息校验通过之后进行记录，（此处记录为完整的记录包含所有字段）
%% 2、在玩家进程处理完订单内的奖励之后进行记录（此处记录仅仅包含部分字段）
%% 3、支付进程支付完成之后进行记录（此处记录为完整的记录包含所有字段）
-record(recLogRecharge, {
	accountID=0,%%账号id
	playerID =0,%%角色id
	orderid,%%平台订单号(相同订单号不可重复发货)
	payMoney =0,%%玩家购买游戏币花费的钱
	gameCoin =0,%%玩家或得的游戏币
	recharge_item_relation_id =0,%%支付订单内关联道具id，该id会被配置到一个配置文件内来映射多个物品
	recharge_item_relation_number =0,%%支付订单内关联道具的个数
	game_recharge_state =0,%%游戏内当前充值执行的状态
	error_code=0,%%错误码
	time,%%该跳记录被插入数据库时的时间
	ums_http_json_info = <<"ignore">> %%ums发送过来的json字符串信息
}).

%%平台后台所发操作日志
-record(recWeb2LsCommandLog,{
	opCode = 0,						%%gm指令编号
	opUser = "",					%%操作者
	opSerial = 0,					%%gm操作序号
	opResult = 0,					%%操作结果
	arg1 = "",						%%参数
	arg2 = "",						%%参数
	arg3 = "",						%%参数
	arg4 = "",						%%参数
	arg5 = "",						%%参数
	arg6 = "",						%%参数
	arg7 = ""						%%参数
}).

%%玩家封号log
-record(recForbiddenLog,{
	playerID=0,
	accountID=0,
	reason=0,  						%%封号原因
	forbiddenTime=0,
	time=0
}).

%%GM指令
-record(recLogGMCmd,{
	sendPlayerID = 0,               %%发送者玩家ID，=0表示系统发送
	chatString = 0,					%%聊天内容
	time = 0						%%发送时间
}).

%% 混沌战场活动给boss造成的伤害排行榜
-record(recLogActivityHDHurt,{
	produceTime = [],
	gsID = 0,
	rankID = 0,
	roleID = 0,
	rankSort = 0,
	rankValue = 0
}).

%% 混沌战场活动击杀玩家的排行榜
-record(recLogActivityHDKill,{
	produceTime = [],
	gsID = 0,
	rankID = 0,
	roleID = 0,
	rankSort = 0,
	rankValue = 0
}).

%% 事件记录（主要是充值各环节定义的事件
-record(recLogTypeEventLog,{
	roleID,
	accountID = 0,
	recTime = 0,
	eventID = 0,
	eventTime = 0,
	eventArgs = 0
}).

%%玩家反馈日志
-record(recLogPlayerCB,
{
	accountID = 0,
	roleID = 0,
	platformAccountID = [],
	mapid = 0,
	playerlevel = 0,
	playercareer = 0,
	cbtype = 0,
	cbcontent = []
}).

%%成就点数日志
-record(recLogAchieveNum,
{
	playerID = 0,						%%角色ID
	achieveID = 0,						%%成就ID
	oldAchieveNum = 0,					%%成就点变化前的值
	modAchieveNum = 0,					%%成就点变化值
	newAchieveNum = 0,					%%成就点变化后的值
	time = 0							%%时间
}).

%%参与军团联赛的军团信息
-record(recLogGuildBattleInfo,
{
	guildName=""::string(),
	guildLevel=0::uint(),
	currentOnlineNum=0::uint(),
	time=0::uint()								%%事件时间
}).

%%玩法参与玩家的统计信息
-record(recLogParticipatorInfo,
{
	roleName=""::string(),
	roleID=0::uint64(),
	roleLevel=0::uint(),
	currentRecharge=0::uint(),
	forcePower=0::uint64(),
	type=0::uint(),
	time=0::uint()
}).

-record(recLogWeaponInfo,
{
	roleID = 0,			%%角色ID
	weaponID = 0,			%%神器ID
	weaponLevel = 0,		%%神器等级
	skillLevel = 0,		%%神器技能等级
	time = 0				%%时间
}).

-endif.


