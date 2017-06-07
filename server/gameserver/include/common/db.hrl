-ifndef(DB_hrl).
-define(DB_hrl,1).

-include("type.hrl").
-include("gamedata.hrl").
-include("gamedataLog.hrl").

-define(EtsRechargeRebateTaken,recSaveRechargeRebateTaken).%%充值返利已领记录缓存

-define(PlayerBaseID,1000).
-define(GlobalMainID, 1).
-define(DBVersion, 002).
-define(EquipStartID, 30000).

%%数据库中UID的类型，取值范围为[1,15]
-define(UID_TYPE_Start, 1).     %% 开始值
-define(UID_TYPE_Account, 1).   %% 账号
-define(UID_TYPE_Role, 2).      %% 角色
-define(UID_TYPE_Item, 3).      %% 道具
-define(UID_TYPE_Trade, 4).     %% 交易行
-define(UID_TYPE_Mail, 5).      %% 邮件
-define(UID_TYPE_Guild, 6).     %% 公会
-define(UID_TYPE_Rune, 7).		%% 符文
-define(UID_TYPE_Team, 8).      %% 组队
-define(UID_TYPE_Companion, 9).	%% ========原灵魂伙伴团队UID，可占用==========
-define(UID_TYPE_Red, 10).      %% 红包
-define(UID_TYPE_End, 10).      %% 结束值
-type uid_type() :: ?UID_TYPE_Start .. ?UID_TYPE_End.

%%运营活动兑换道具类型
-define(OperateActExchangeType_Start,0).

-define(OperateActExchangeType_Item,1).
%%运营活动兑换货币类型
-define(OperateActExchangeType_Coin,2).
%%运营活动兑换自定义标识
-define(OperateActExchangeType_Custom,3).

-define(OperateActExchangeType_End,4).


%%杂项数据功能ID定义区
-define(Sundries_ID_Start,1).
-define(Sundries_ID_AnswerRewardName,2).
-define(Sundries_ID_Lottery, 3). % 占卜，抽奖功能数据定义
-define(Sundries_ID_WorldLevel, 4). % 世界等级
-define(Sundries_ID_GuildWarStartTime, 5). % 军团争霸赛开始时间
-define(Sundries_ID_DarknessVer, 6). % 黑暗之地特殊玩法版本号（刷新时间）
-define(Sundries_ID_GuildExpedition, 7). % 沙盘
-define(Sundries_ID_LotteryForTower, 8). % 金宝塔
-define(Sundries_ID_Marriage, 9). % 姻缘系统
-define(Sundries_ID_End,9).

-type sundries_id() :: ?Sundries_ID_Start .. ?Sundries_ID_End.
%%杂项数据功能ID定义区结束

-record(dbInfo, {
	name,
	value
}).

-record(recGameServer, {
	gameServerID = 0 :: uint(), 					%% 游戏服务器ID
	gameServerState = 4 :: uint(),					%% 游戏服务器状态(默认关闭)
	gameServerName = "" :: string(),				%% 游戏服务器名
	gameServerIp = "" :: string(),					%% 游戏服务器IP
	gameServerPort = 0 :: uint(),					%% 游戏服务器监听端口
	gameServerPlayerCount = 0 :: uint(),			%% 游戏服务器在线人数
	maxPlayer = 0 :: uint()							%% 线路最大人数
}).

%%全局登录用户
-record(recLoginAccount, {
	accountID = 0,			%% 账号ID,由数据库生成，全国唯一
	platformAccountID = "",	%% 平台帐号ID
	account = "",				%% 游戏内部帐号（平台编号+平台帐号标志）
	fgi = "",				%%如：801001
	platformName="",			%%平台名，如:uc
	gsLineID = -1, 			%% 选择的进入的游戏服务器的Pid
	socket = 0,				%%
	playerPIDInGS, 			% 玩家在gs中的pid
	randIdentity = 0, 		%% 用户的密码验证
	keyCreateTime = 0,		%% 随机key生成时间（算过期用）
	verifying = false :: boolean(),		%% gs验证key中
	platformID = 0,
	gmLevel = 0
}).

-record(account, {
	accountID = 0,
	account = "",
	platformAccountID = "",
	platformAccount = "",
	platformName = "",
	priv = 0,
	ipLimit=0,
	macLimit=0,
	nickName = "",
	createTime = 0,
	onlineServer = 0,
	gmLevel = 0
}).

-record(blackAccount,{
	accountID = "",   %%封号唯一标识
	isForever = 0,    %%是否永久封号 true:1
	beginTime = 0,    %%开始时间
	endTime = 0       %%结束时间
}).

-record(whiteAccount,{
	accountID = 0
}).


-record(recDeleteRoleAck,{
	isOK = true,			%%是否成功
	roleID = 0,			%%角色ID
	level = 0,			%%等级
	gold = 0,				%%金币
	bindGold = 0,			%%绑定金币
	diamond = 0,			%%钻石币
	bindDiamond = 0,			%%
	prestige = 0,
	honor = 0,
	purpleEssence = 0,
	goldenEssence = 0
}).

%%角色可见装备
-record(recVisibleEquip,{
	roleID = 0,				%%角色ID
	equipID = 0,			%%装备ID
	quality = 0				%%装备品质
}).

%%翅膀
-record(recWingLevel,{
					  roleID,
					  wingLevel
					  }).
%%加载角色列表时的时装
-record(recFashionOnLoad,{
	roleID,
	index,
	value,
	endTime
}).

-record(accountAndPlatformID, {
	account,
	platformID
}).


%%装备基础属性表
-record(rec_equip_base_info,{
	equipUID = 0,				%%装备UID bigint(20) unsigned
	propKey1 = 0,				%%属性标识主键1 tinyint(4) unsigned
	propValue1 = 0,				%%装备附加属性值1 double
	propKey2 = 0,				%% tinyint(4) unsigned
	propValue2 = 0,				%% double
	propKey3 = 0,				%% tinyint(4) unsigned
	propValue3 = 0,				%% double
	propKey4 = 0,				%% tinyint(4) unsigned
	propValue4 = 0,				%% double
	propKey5 = 0,				%% tinyint(4) unsigned
	propValue5 = 0,				%% double
	skillLevel1 = 0,				%%技能1等级 tinyint(4) unsigned
	skillLevel2 = 0				%%技能2等级 tinyint(4) unsigned

}).

%%装备强化基础属性基础值表
-record(rec_equip_enhance_info,{
	equipUID = 0,				%%装备UID bigint(20) unsigned
	propKey1 = 0,				%%属性标识主键1 tinyint(4) unsigned
	propValue1 = 0,				%%装备附加属性值1 double
	propKey2 = 0,				%% tinyint(4) unsigned
	propValue2 = 0,				%% double
	propKey3 = 0,				%% tinyint(4) unsigned
	propValue3 = 0,				%% double
	propKey4 = 0,				%% tinyint(4) unsigned
	propValue4 = 0,				%% double
	propKey5 = 0,				%% tinyint(4) unsigned
	propValue5 = 0				%% double

}).

%%装备附加属性表
-record(rec_equip_ext_info,{
	equipUID = 0,				%%装备UID bigint(20) unsigned
	propKey1 = 0,				%%属性标识主键1 tinyint(4) unsigned
	propValue1 = 0,				%%装备附加属性值1 double
	propRecast1 = 0,				%% tinyint(4) unsigned
	propAffixe1 = 0,				%% smallint(5) unsigned
	calcType1 = 0,				%%属性计算方式 0：加法 1：乘法 tinyint(4) unsigned
	propKey2 = 0,				%% tinyint(4) unsigned
	propValue2 = 0,				%% double
	propRecast2 = 0,				%% tinyint(4) unsigned
	propAffixe2 = 0,				%% smallint(5) unsigned
	calcType2 = 0,				%% tinyint(4) unsigned
	propKey3 = 0,				%% tinyint(4) unsigned
	propValue3 = 0,				%% double
	propRecast3 = 0,				%% tinyint(4) unsigned
	propAffixe3 = 0,				%% smallint(5) unsigned
	calcType3 = 0,				%% tinyint(4) unsigned
	propKey4 = 0,				%% tinyint(4) unsigned
	propValue4 = 0,				%% double
	propRecast4 = 0,				%% tinyint(4) unsigned
	propAffixe4 = 0,				%% smallint(5) unsigned
	calcType4 = 0,				%% tinyint(4) unsigned
	propKey5 = 0,				%% tinyint(4) unsigned
	propValue5 = 0,				%% double
	propRecast5 = 0,				%% tinyint(4) unsigned
	propAffixe5 = 0,				%% smallint(5) unsigned
	calcType5 = 0,				%% tinyint(4) unsigned
	propKey6 = 0,				%% tinyint(4) unsigned
	propValue6 = 0,				%% double
	propRecast6 = 0,				%% tinyint(4) unsigned
	propAffixe6 = 0,				%% smallint(5) unsigned
	calcType6 = 0				%% tinyint(4) unsigned

}).


-record(recSaveEquip,{
	itemUID = 0,					%%道具UID
	roleID = 0,					    %%角色ID
	itemID = 0,					    %%道具ID
	pos = 0,						%%背包类型
	recastCount = 0,				%%重叠次数
	isBind = false,				    %%是否绑定
	isLocked = false,				%%是否锁定
	quality = 0,         			%%品质
	createTime = 0,                 %%创建时间
	deleteTime = 0,                 %%删除时间
	expiredTime = 0,                %%过期时间
	baseProp = #rec_equip_base_info{},
	extProp = #rec_equip_ext_info{},
	enhanceProp = #rec_equip_enhance_info{}
}).

-type goods() :: #rec_item{} | #recSaveEquip{}.

%角色列表基础信息
-record(recRoleListInfo,{
    roleID = 0,						%角色ID
    roleName = "",					%角色名称
    sex = 0,						%性别
	head = 1,                       %头像
    camp = 0,						%阵营
    race = 0,						%种族
    career = 0,						%职业
    level = 1,						%等级
    mapID = 0,						%%玩家的当前地图ID
    oldMapID = 0,					%%玩家之前的地图ID
    lastLogoutTime = 0,				%上次下线时间
    wingLevel = 0,					%%玩家翅膀等级
    canRename = false,				%是否可以改名
    visibleEquips = [] :: [#recVisibleEquip{},...] | [], 	%%可见装备列表
    fashionOnbody = [] :: [FashionID::uint(),...] | [],		%%身上的时装
    refine_levels = [] %%装备部位精炼等级[#pk_refineLevel{},...] | []
}).

%% 账号登录预览信息
-record(recRoleList, {
	accountID,
    gmLevel = 0,
    unlockNewRace = 0,
	roleListInfo = [] :: [#recRoleListInfo{},...]
}).

%%运营平台充值活动返利表
-record(recSaveRechargeRebate,{
							   id,
							   type,
							   rebateId,
							   beginTime,
							   endTime,
							   arg1 = "",
							   arg2 = "",
							   arg3 = "",
							   arg4 = "",
							   arg5 = "",
							   arg6 = "",
							   arg7 = ""
							  }).

%%玩家的返利领取记录
-record(recSaveRechargeRebateTaken,{
									roleID,
									rebateIdAndType
								   }).

-record(recSaveFashionSlot,{
	roleID,					%%角色ID
	slot,					%%时装部位
	fashionID				%%时装ID
}).

%%双倍充值配置
-record(rec_recharge_double_conf,
{
	rebateID = 0,			%%返利id
	funcellPayItemID = ""	%% funcell充值的item_id
}).

%%玩家缓存要重置
-record(rec_clean_role_cache,
{
	roleID = 0,
	t=0
}).

-record(recEquipEnhance,{
	id = 0,               %%物品id
	type = 0,             %%物品类型
	subType = 0,			%%子类型
	enhanceProp = #rec_equip_enhance_info{},
	extProp = #rec_equip_ext_info{}
}).

%% 邮件附件
-record(recMailAttachMent,{
	mailID          = 0, % 邮件ID
	mtype           = 0, % 附件类型，0为道具，其它为货币类型
	mvalue          = 0, % 附件的值，附件的具体值，如果为道具则为道具的UID，如果为货币则为货币的数量
	mvalue2         = 0  % 附件的值2 可以保存道具ID
}).

%% 邮件表
-record(recSaveMail,{
	mailID          = 0, % 邮件ID
	mailReadTime    = 0, % 邮件阅读时间
	mailSendTime    = 0, % 邮件发送时间
	isLocked        = 0, % 是否锁定，0未锁定，1锁定
	senderRoleID    = 0, % 发送者角色ID
	toRoleID        = 0, % 接收者角色ID
	mailTitle       = [],% 邮件标题
	mailContent     = [],% 邮件内容
	mailSubjoinMsg  = [],% 邮件附加信息
	deleteTime      = 0  % 邮件删除时间
}).

%%王者战天下用的字段
-record(recRoleData4King,{
						  roleID,
						  roleName,
						  career,
						  level,
						  exp,
						  hp,
						  mp,
						  power,
						  propIndex,
						  propValue
						 }).

%% 更新邮件
-record(recUpdateMail,{
	mailID          = 0, %%邮件id
	mailReadTime    = 0, %%邮件阅读时间
	deleteTime      = 0, %%邮件删除时间
	isLocked        = 0	 %%是否锁定
}).

%%角色升级保存的内容
-record(recSaveLevelUp,{
	roleID = 0,						%%角色ID
	level = 0,						%%角色当前等级
	exp = 0							%%角色当前经验
}).

%% 交易行状态数据表
-record(trade,
{
	orderID         = 0, % 订单ID
	itemUID         = 0, % 出售者原装备唯一ID
	roleID          = 0, % 出售者角色ID
	sellType        = 0, % 出售类型,1铜币交易,2元宝交易,3指定交易
	putTime         = 0, % 上架时间
	downTime        = 0, % 下架时间
	silver          = 0, % 银币(铜币)
	gold            = 0, % 金币(元宝)
	destRoleID      = 0, % 指定卖给谁
	sellState       = 0, % 出售状态,0待售,1已锁定,2已出售,3已完成交易
	relateRoleID    = 0, % 改变当前交易状态的人
	itemID          = 0, % 道具编号ID
	quality         = 0, % 道具品质
	pileNumber      = 0  % 叠加数量
}).

%% 角色被点赞次数
-record(recRolePraise,
{
	roleID          = 0, % 角色ID
	praiseNum       = 0  % 被点赞次数
}).

-record(recGetDeleteRoleInfo,{
	level = 0,
	gold = 0,
	bindGold = 0,
	diamond = 0,
	bindDiamond = 0,
	prestige = 0,
	honor = 0,
	purpleEssence = 0,
	goldenEssence = 0
}).

%% 公告表
-record(gameNotice,{
	id = 0,
	position::integer(),
	type::integer(),
	content::string(),
	rgb::integer(),
	beginTime::integer(),
	duration::integer(),
	interval::integer()
}).

%% 登录有礼活动
-record(loginAwardConf,{
	award_id ::integer(),
	award_name::string(),
	time_begin::integer(),
	time_end::integer(),
	level_min::integer(),
	level_max::integer(),
	mail_title::string(),
	mail_content::string(),
	items::string()
}).

%% 已经领取的活动id
-record(awardTakenRow,{
	role_id =0,
	award_id=0
}).
%% 激活码信息
-record(recActiveCodeInfo, {
	id,
	channel_name,
	batch,
	item_id,
	item_count,
	param,
	valide_time_begin,
	valide_time_end,
	valide_server_id_list,
	get_player_id,
	get_count
}).

%% xml公告记录
-record(xmlNoticeRow,{
	type = 0,
	content = "",
	md5 = ""
}).

%% 玩家已经领取万能礼包码ID
-record(activeCode4Many,{
	roleID = 0,
	activeCodeIDList=[]
}).

%% 玩家副本最高分数记录
-record(recCopyMapScore,
{
	roleID = 0,
	copyMapID = 0,
	maxScore = 0
}).

%% 取id字段
-record(id,{
	id
}).

%%数据采集
-record(roleWarnData,{
	roleID      = 0,
	dataList    = []
}).

%%排行榜
-record(recSaveRank,
{
	roleID		= 0,
	rankType	= 0,
	rankSort	= 0,
	rankSortC	= 0,
	value1		= 0,
	value2		= 0,
	value3		= 0,
	createTime
}).

%% 禁止登录的设备
-record(recDenyDevice,{
	deviceId::string()
}).

%% 时装字段
-record(recFashion,{
	roleID::integer(),
	fashionID::integer(),
	endTime::integer()
}).
%% 绑定手机号
-record(recBindPhoneNum,{
	bindPhoneNum::integer()
}).

%% 护送
-record(recConvoyInfo, {
	roleID = 0,
	roleCode = 0,
	playerPid = undefined,
	playerNetPid = undefined,

	monsterID = 0,
	monsterCode = 0,

	extData,	% 额外参数

	timeOut = 0, % 超时时间

	errorTimes = 0	% 检测超出距离次数
}).

%%1为初始化的值
-define(RECHARGE_STATE_INIT,1).
%%订单状态，2已经将获取发给玩家
-define(RECHARGE_STATE_GIVE,2).
%%订单状态为异常订单，该状态订单只能人工介入处理
-define(RECHARGE_STATE_EXCEPTION,-1).



%%支付系统错误码：ums系统发送过来的数据状态错误
-define(RECHAEGE_ERROR_CODE_UMS_HTTP_MSG_ERROR_STATUS,1).
%%支付系统错误码：订单弄错了游戏服内没有此玩家
-define(RECHAEGE_ERROR_CODE_USER_NOT_EXIST,2).
%%支付系统错误码：订单订单正在支付给玩家
-define(RECHAEGE_ERROR_CODE_IS_RUNNING,3).
%%支付系统错误码：代码运行是小的异常、该异常出现在给用户发道具以外的代码。因此不会导致给多次给用户发放道具。多次产生该异常不会有任何影响，程序必须要关注该异常。查找该异常的具体原因。很可能是数据库问题导致的
-define(RECHAEGE_ERROR_CODE_LITTLE_EXCEPTION,4).
%%支付系统错误码：订单内容已经支付给了用户
-define(RECHAEGE_ERROR_CODE_HAD_PAY,5).
%%支付系统错误码：充值账单里面的用户id和用户进程里面id不一致。加钱时没有通过用户id校验
-define(RECHAEGE_ERROR_CODE_RECHARGE_ORDER_USER_ID_ERROR,6).
%%支付系统错误码：解析礼包码出错
-define(RECHAEGE_ERROR_CODE_DECODE_GIFT_ERROR,7).
%%支付系统错误码：订单里面的钱不能为0
-define(RECHAEGE_ERROR_CODE_AMOUNT_CAN_NOT_ZERO,8).
%%支付系统错误码：订单里面的商品id不能为空
-define(RECHAEGE_ERROR_CODE_ITEM_CAN_NOT_NONE,9).
%%支付系统错误码：配置文件内没有配置该订单的商品id映射
-define(RECHAEGE_ERROR_CODE_CAN_NOT_IDTEM_ID_IN_CFG,10).
%%支付系统错误码：在将订单内的物品或货币支付给用户时系统出现异常、此时会产生异常订单.定义为大异常
-define(RECHAEGE_ERROR_CODE_BIG_EXCEPTION,11).
%%支付系统错误码：用户在支付完订单之后掉线了
-define(RECHAEGE_ERROR_CODE_USER_NOT_ONLINE,12).
%%支付系统错误码：支付调用超时了
-define(RECHAEGE_ERROR_CODE_CALL_RECHARGE_TIME_OUT,13).
%%支付系统错误码：解析http消息出错
-define(RECHAEGE_ERROR_CODE_DECODE_HTTP_MSG_ERROR,14).
%%支付系统错误码：代码在写入数据库之前或者第一次写入数据库的时候出错了
-define(RECHAEGE_ERROR_CODE_SYSTEM_ERROR_BEFORE_WRITE_DB,15).
%%支付系统错误码：代码运行出现了未知错误。数据库内的数据莫名不见了。无论什么时候都不应该看到该异常
-define(RECHAEGE_ERROR_CODE_UNKNOW_EXCEPTION_CAN_NOT_FIND_DB_DATA,16).
%%支付系统错误码：通过httppost请求订单信息时出错了，网络异常
-define(RECHAEGE_ERROR_CODE_HTTP_POST_EROOR_GET_ORDER_INFOR_FAIL,17).
%%充值订单类型:元宝
-define(RECHARGE_SYS_CATEGORY_TYPE_CASH,<<"cash">>).
%%充值订单类型:道具
-define(RECHARGE_SYS_CATEGORY_TYPE_PROPS,<<"props">>).
%%充值订单类型:礼包
-define(RECHARGE_SYS_CATEGORY_TYPE_PACKS,<<"packs">>).


%%ums发送过来的支付消息
-record(rec_http_msg_recharge_info,{
	game,%%游戏ID
	price,%%商品原价
	discount_price,%%商品折后价
	currency_amount,%%实际付款总金额
	currency,%%实付币种 RMB,KER,USD,TWD,VND,…
	amount,%%商品应发游戏币数量
	%% %%gift 意义
	%%赠送表达式，空字符串或字符串0时无赠送，
	%%赠送表达式，空字符串或字符串0时无赠送，
	%%数字字符串代表直接赠送游戏币的数量
	%%需赠送复杂内容时请咨询平台
	gift,
	item_amount,%%购买商品的数量，通常为1
	category,%%商品类型：cash元宝/props道具/packs礼包/…
	server_id,%%区服编号
	character_id,%%角色编号
	status,%%订单状态： 1已支付/4已发货
	orderid,%%平台订单号(相同订单号不可重复发货)
	item_id,%%	游戏CP约定商品ID
	item_code,%%商品自定义参数表达式
	comments,%%透传参数，SDK发起订单时填写
	fgi,%%渠道ID（同一个渠道出多个包时会不同）
	provider_orderid,%%第三方渠道订单号
	excess_money,%%实际付款总金额当中的超出商品折后价的溢缴金额
	excess_amount,%%溢缴款按默认兑换比例换算成的游戏币
	sandbox,%%是否沙箱测试订单：0非沙箱/1沙箱
	createtime,%%订单创建时间,
	purchasetoken%%向ums获取订单时使用的token
}).

%%充值表
-record(recRecharge,{
	roleID::uint64(),
	feOrderID::string(),%%funcell生成的订单号
	moneyType::binary(),%%实付币种,
	gameMoneyAmount::float(),%%游戏币数量
	currencyMoneyAmount=0::float(),%%玩家花费的真实货币数量
	status::integer(),
	giftStr::string(),%%赠送表达式，0或者大于0的数字或者为表达式。目前仅仅处理0和大于0的情况。其它情况不予处理。大于0的数值仅仅是绑定货币
	item_amount::integer(),%%购买道具数量，
	item_id::integer(),%%购买道具的id,次ID为渠道-平台-游戏三方约定的一个发货代码，因此对应到的具体物品id需要一个映射关系、订单系统暂时不对该功能进行支持。扩展的时候只需要增加一个配置文件将对应关系配置起来即可。
	addTime::integer(),%%购买记录生成的时间,
	category::binary(), %%订单类型
	purchaseToken::string() %%向ums查询订单时使用的编号
}).



%%预充值待返回  表
-record(recPreChargeAccount,{
	accountID::uint64(),
	amount::uint32()
}).

%%
-record(rec_team,{
	teamID = 0,				%%队伍ID bigint(20) unsigned
	type = 0,				%%团队类型 tinyint(2) unsigned
	leaderID = 0,				%%队长ID bigint(20)
	members = "",				%%队员的信息 text
	customProp = "",				%%自定义属性 text
	mapID = 0				%%快速组队副本ID int(10) unsigned

}).

%%
-record(rec_player_team,{
	roleID = 0,				%%玩家角色ID bigint(20) unsigned
	type = 0,				%%队伍类型 tinyint(3) unsigned
	teamID = 0				%%队伍ID bigint(20) unsigned

}).

%% 队伍信息
-record(recSaveTeam,
{
	teamID = 0,
	type = 0,
	leaderID = 0,
	members = [],
	customProp = ""
}).
%% 队伍成员信息
-record(recSaveTeamMember,
{
	roleID = 0,
	name = "",
	career = 0,
	level = 0,
	customInfo = ""
}).
%% 队伍ID
-record(recSaveTeamID,
{
	teamID = 0
}).
-record(recSaveCanRename,
{
	roleID,
	canRename
}).

%% 符文属性，来源gamedata.hrl rec_rune_prop表
-record(recRuneProp,
{
	runeUID = 0,				%%符文UID bigint(20) unsigned
	index = 0,  %%编号
	propType = 0,				%%符文属性类型，1基础属性，2随机属性 tinyint(3) unsigned
	propKey = 0,				%%属性Key smallint(5) unsigned
	propValue = 0,				%%属性值 double
	calcType = 0				%%属性计算方式 0：加法 1：乘法 tinyint(3) unsigned
}).

%% 符文内存表，来源gamedata.hrl rec_rune_base表
-record(recRune,
{
	runeUID = 0,				%%符文UID bigint(20) unsigned
	runeID = 0,				%%符文ID int(10) unsigned
	roleID = 0,				%%拥有者ID(玩家RoleID) bigint(20) unsigned
	subOwnerID = 0,				%%子拥有者，意思为当前拥有者自身或者某个宠物对象 int(10) unsigned
	level = 1,				%%符文等级 smallint(5) unsigned
	exp = 0,				%%符文当前等级累积的经验 int(10) unsigned
	isBind = 0,				%%是否绑定，0非绑定，1绑定 tinyint(3) unsigned
	createTime = 0,				%%创建时间 datetime
	deleteTime = 0,				%%删除时间 datetime
	expiredTime = 0,				%%过期时间，有设置才有过期时间 datetime
	baseProps = []::[#recRuneProp{},...],     %% 基础属性列表
	randProps = []::[#recRuneProp{},...]      %% 随机属性列表
}).

%% 身份证系统
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 需要与DB同步的信息
-define(EtsIdentityData, ets_rec_player_identity).  %% 角色身份证信息
-define(EtsPicDataMain, ets_rec_pic_data_main).     %% 相册数据主表（需要全部加在到内存）
-define(EtsPicDataSub, ets_rec_pic_data_sub).       %% 相册数据副表（仅需要加载部分字段到内存中）

%% 默认值校正
-define(DefaultValueOfAge, 255).      %% 年龄的默认值为255，表示未设置
-define(DefaultValueOfIdentity(ID),   %% 身份证信息的默认值
	#rec_player_identity{
		roleID = ID,
		face = [],
		age = ?DefaultValueOfAge,
		birthmonth = 0,
		birthday = 0,
		zodiac = 0,
		bloodType = 0,
		hometown1 = 0,
		hometown2 = 0,
		location1 = 0,
		location2 = 0,
		tags = [],
		pic1 = [],
		pic2 = [],
		pic3 = [],
		sign = []
	}
).

%% 身份证信息类别
-define(IDIT_BEGIN,     0).
-define(IDIT_AGE,       0).
-define(IDIT_BIRTH,     1).
-define(IDIT_ZODIAC,    2).
-define(IDIT_BLOOD,     3).
-define(IDIT_HOMETOWN,  4).
-define(IDIT_LOCATION,  5).
-define(IDIT_TAGS,      6).
-define(IDIT_PIC1,      7).
-define(IDIT_PIC2,      8).
-define(IDIT_PIC3,      9).
-define(IDIT_FACE,      10).
-define(IDIT_SIGN,      11).
-define(IDIT_END,       11).
-type type_idit() :: ?IDIT_BEGIN .. ?IDIT_END.

%% 身份证信息上传照片操作类型
-define(IDUPT_DEL,      false).     % 删除照片
-define(IDUPT_ADD,      true).      % 新增照片
-type type_idupt() :: boolean().

%% 照片无法下载，但需要通过协议通知客户端以完善流程，相关错误码如下
-define(IDDER_NotExists,    0). % 照片不存在（数据库中的0表示审核通过，作为异常协议码，表示不存在）
-define(IDDER_IsPending,    1). % 审核中
-define(IDDER_WithoutTrial, 3). % 未过审
-type type_idder() :: ?IDDER_NotExists | ?IDDER_IsPending | ?IDDER_WithoutTrial.

%% 新版好友系统
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 好友信息作为双键值的数据还真只能这么存
-record(recFriend2Chat, {
	targetRoleID = 0,
	chatMsgs = [] :: [term(), ...]
}).
-record(recFriend2Data, {
	roleID = 0,
	relations = [] :: [#rec_friend2_relation{}, ...],
	interactions = [] :: [#rec_friend2_interaction{}, ...],
	chatMsgs = [] :: [#recFriend2Chat{}, ...]  %% 临时存放离线时收到的好友消息，并不保存于数据库
}).
-define(EtsFriend2Data, ets_recFriend2Data).

%% friend2State2.erl 反馈的数据库操作方式
%% 其它模块也可以参照使用
-define(DBOPT_ERROR,  0).
-define(DBOPT_INSERT, 1).
-define(DBOPT_UPDATE, 2).
-define(DBOPT_DELETE, 3).
-type type_dbopt() :: ?DBOPT_ERROR | ?DBOPT_INSERT | ?DBOPT_UPDATE | ?DBOPT_DELETE.

%% 关系定义
-define(RELATION_BEGIN,     0).
-define(RELATION_NONE,      0).   %% 陌生人，对应操作为删除关系
-define(RELATION_TEMP,      1).   %% 临时好友，对应操作为添加临时好友
-define(RELATION_FORMAL,    2).   %% 正式好友，对应操作为添加正式好友
-define(RELATION_BLACK,     3).   %% 黑名单，对应操作为拉黑
-define(RELATION_END,       3).
-type type_relation() :: ?RELATION_BEGIN .. ?RELATION_END.

%% 增加亲密度原因（与姻缘系统的亲密度不同，这里应是友好度）
-define(ClosenessAddType_BEGIN,         1).
-define(ClosenessAddType_Chat,          1).   %% 好友聊天提升亲密度
-define(ClosenessAddType_TeamCopyMap,   2).   %% 组队通关副本
-define(ClosenessAddType_Like,          3).   %% 点赞
-define(ClosenessAddType_GiveAP,        4).   %% 赠送行动点（体力值）
-define(ClosenessAddType_DateLink,      5).   %% 约会地下城消除玩法
-define(ClosenessAddType_GM,            6).   %% GM命令
-define(ClosenessAddType_RedEnvelope,   7).   %% 红包
-define(ClosenessAddType_END,           7).
-type type_cat() :: ?ClosenessAddType_BEGIN .. ?ClosenessAddType_END.
%% 减少亲密度原因（与姻缘系统的亲密度不同，这里应是友好度）
-define(ClosenessDelType_BEGIN,         255).
-define(ClosenessDelType_BreakF,        255). %% 解除好友关系
-define(ClosenessDelType_BreakM,        254). %% 解除伴侣关系
-define(ClosenessDelType_END,           254).
-type type_cdt() :: ?ClosenessDelType_END .. ?ClosenessDelType_BEGIN.

%% 现实LBS大致距离
-record(recFriend2LBS, {
	mixRoleID     = {0, 0}  :: {uint64(), uint64()},	%% 混合角色ID，较小者靠前，用以简单规避双键值问题
	distance      = 0       :: float(),     			%% 距离，单位千米，小于1时表示无效
	time          = 0       :: uint32()     			%% 时间戳 time2:getTimestampSec/0
}).
-define(EtsFriend2LBS, ets_recFriend2LBS).

%% 双角色相关的每日计数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-record(recDaily2Data, {
	key = 0 :: uint64(),
	value = [] :: [#rec_player_daily2{}, ...]
}).
-define(EtsDaily2Data, ets_recDaily2Data).

%% 姻缘系统
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-record(recMarriageSkill, {
	roleID = 0  :: uint64(),
	slots = [] :: [{uint32(), uint32()}, ...]  %% [{技能槽位ID, 技能经验}, ...]
}).
-define(EtsMarriageData, ets_rec_marriage).
-define(EtsMarriageSkill, ets_recMarriageSkillData).
-define(DefaultValueOfMarriage(RoleID),   %% 姻缘信息的默认值
	#rec_marriage{
		roleID = RoleID,
		targetRoleID = 0,
		closeness = 0,
		timeRelation = 0,
		ringTop = 1,
		ringExp = 0
	}
).
%% 求婚记录
%% 用于计算求婚行为冷却与返还暂扣道具
-record(recWantBuild, {
	id = 0,
	time = 0,
	item = 0
}).
%% 亲密度来源
-define(ClosenessSource_Begin,			0).
-define(ClosenessSource_Date,			0).	%% 约会地下城
-define(ClosenessSource_KillMonster,	1).	%% 夫妻组队杀怪
-define(ClosenessSource_MarriageTask,	2).	%% 情缘任务
-define(ClosenessSource_Marriage,		3).	%% 结婚
-define(ClosenessSource_End,			3).
-type type_mcs() :: ?ClosenessSource_Begin .. ?ClosenessSource_End.
%% 亲密度消耗
-define(ClosenessUse_Begin,		255).
-define(ClosenessUse_Break,		255).	%% 离婚
-define(ClosenessUse_SkillUp,	254). 	%% 升级夫妻技能
-define(ClosenessUse_RingUp,	253).	%% 升级婚戒
-define(ClosenessUse_End,		253).
-type type_mcu() :: ?ClosenessUse_End .. ?ClosenessUse_Begin.

%% 新版骑宠领地
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-record(recTerritoryData, {			%% 领地相关的数据
	roleID	= 0		:: uint64(),	%% 角色ID
	value	= []	:: list()		%% 从属该角色的数据
}).
-define(EtsTerritoryPlayerData,		ets_TerritoryPlayerData).	%% 领地数据
-define(EtsTerritoryPetData,		ets_TerritoryPetData).		%% 骑宠数据
-define(EtsTerritoryHistoryAData,	ets_TerritoryHistoryAData).	%% 掠夺记录
-define(EtsTerritoryHistoryDData,	ets_TerritoryHistoryDData).	%% 防守记录

-endif.
