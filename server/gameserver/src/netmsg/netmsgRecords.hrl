%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% If you have any questions, please contact to ZHONGYUANWEI.

-ifndef(NetmsgRecords).
-define(NetmsgRecords,1).

-define(ProtoVersion,699).

%% 
%% // 积累连击产生的正面效果 之 立即增加分值
-define(CMD_GS2U_DateLink_BuffAddScore_Sync,2235).
-record(pk_GS2U_DateLink_BuffAddScore_Sync,{
	%% UInt16 立即获得的分值
	score,
	%% UInt16 获得分值后积分总值
	scoreAll
}).

%% 
%% // 积累连击产生的正面效果 之 增加游戏时间
-define(CMD_GS2U_DateLink_BuffAddTime_Sync,43534).
-record(pk_GS2U_DateLink_BuffAddTime_Sync,{
	%% UInt16 增加的时间（秒）
	timeAdd,
	%% UInt16 剩余的游戏时间（秒）
	timeRemainder
}).

%% 
%% // 积累连击产生的正面效果 之 增加移动速度等直接附加到角色身上的BUFF
-define(CMD_GS2U_DateLink_BuffBuff_Sync,43889).
-record(pk_GS2U_DateLink_BuffBuff_Sync,{
	%% UInt16 这是直接附加到角色身上的buffid
	buffID
}).

%% 
%% // 积累连击产生的正面效果 之 持续时间内连接获得分值多倍
-define(CMD_GS2U_DateLink_BuffPower_Sync,8307).
-record(pk_GS2U_DateLink_BuffPower_Sync,{
	%% Byte 持续时间（秒）
	time,
	%% Byte 倍率
	power
}).

%% 
%% // 错误连接产生的负面效果 之 减少移动就那个速度等直接附加到角色身上的BUFF
-define(CMD_GS2U_DateLink_DeduffBuff_Sync,54474).
-record(pk_GS2U_DateLink_DeduffBuff_Sync,{
	%% UInt16 这是直接附加到角色身上的buffid
	buffID
}).

%% 
%% // 游戏结束后同步的结算消息
-define(CMD_GS2U_DateLink_GameEnd_Sync,26792).
-record(pk_GS2U_DateLink_GameEnd_Sync,{
	%% Byte 0分值达到上限；1时间结束；2玩家主动放弃
	reason,
	%% Byte 该时间（秒）后销毁地图
	time,
	%% UInt16 最终得分
	score,
	%% Byte 玩法ID
	id
}).

%% 
%% // 发生连接的同步消息
-define(CMD_GS2U_DateLink_Link_Sync,13021).
-record(pk_GS2U_DateLink_Link_Sync,{
	%% Byte 目标宝石A的序号
	indexA,
	%% Single 目标宝石A的坐标X
	xA,
	%% Single 目标宝石A的坐标Y
	yA,
	%% Byte 目标宝石B的序号
	indexB,
	%% Single 目标宝石B的坐标X
	xB,
	%% Single 目标宝石B的坐标Y
	yB,
	%% Byte 当前连击计数（如果为0表示当前连接错误，大于0则为正确）
	combo,
	%% Byte 最大连击计数
	comboMax,
	%% UInt16 本次连接产生的分值
	score,
	%% UInt16 本次连接后积分总值
	scoreAll,
	%% Byte 宝石阵（固定36长度，0表示没有，1表示有
	listGemMatrix
}).

%% 
%% // 同步主游戏阶段剩余时间，以修正因各种原因导致的界面倒计时与实际不符的情况
-define(CMD_GS2U_DateLink_MainTime_Sync,39789).
-record(pk_GS2U_DateLink_MainTime_Sync,{
	%% UInt16 剩余的游戏时间（秒）
	timeRemainder
}).

%% 
%% // 重置宝石阵的同步消息（会重置玩家坐标到初始点）
%% //     该消息可能在游戏正式开始时创建宝石阵时收到
%% //         也可能在所有宝石被消除后创建新的宝石阵时收到
%% //         也可能在手动重置宝石阵成功时收到
-define(CMD_GS2U_DateLink_ResetGem_Sync,38607).
-record(pk_GS2U_DateLink_ResetGem_Sync,{
	%% UInt16 宝石的NpcID列表
	listGem,
	%% Byte 手动重置宝石阵剩余次数
	resetCount,
	%% Byte 手动重置宝石阵的剩余时间
	resetCD,
	%% Byte 宝石阵（固定36长度，0表示没有，1表示有
	listGemMatrix
}).

%% 
%% // 宝石的选中与取消反馈
-define(CMD_GS2U_DateLink_Select_Ack,25929).
-record(pk_GS2U_DateLink_Select_Ack,{
	%% UInt64 操作者角色ID
	roleID,
	%% Byte 目标宝石序号，从1开始到36
	index,
	%% Single 目标宝石中心坐标X
	x,
	%% Single 目标宝石中心坐标Y
	y,
	%% Boolean 选中还是取消
	isSelect,
	%% Byte 宝石阵（固定36长度，0表示没有，1表示有
	listGemMatrix
}).

%% 
%% // 1.夺秒消除玩法特有协议
%% ////////////////////////////////////////////////////////////////////
%% // 角色在任意时间进入地图时收到的初始化消息
-define(CMD_GS2U_DateLink_Welcome_Sync,4915).
-record(pk_GS2U_DateLink_Welcome_Sync,{
	%% UInt16 游戏前等待时间
	timeForBegin,
	%% UInt16 游戏中进行时间
	timeForEnd,
	%% Byte 多倍BUFF的持续时间（秒）
	timePower,
	%% UInt16 宝石的NpcID列表
	listGem,
	%% UInt16 当前游戏积分
	score,
	%% Byte 当前玩家A选中的宝石序号
	indexA,
	%% Byte 当前玩家B选中的宝石序号
	indexB,
	%% Byte 当前获得积分的倍率
	power,
	%% Byte 手动重置宝石阵剩余次数
	resetCount,
	%% Byte 宝石阵（固定36长度，0表示没有，1表示有
	listGemMatrix,
	%% Byte 手动重置宝石阵的剩余时间
	resetCD
}).

%% 
%% // 角色在任意时间进入地图时收到的初始化消息
-define(CMD_GS2U_DatePushBox_GreateNPC_Sync,45541).
-record(pk_GS2U_DatePushBox_GreateNPC_Sync,{
	%% UInt64 箱子 CODE
	code,
	%% Single 箱子移动X
	x,
	%% Single 箱子移动Z
	z
}).

%% 
%% // 移动箱子是否成功的返回消息
-define(CMD_GS2U_DatePushBox_Succeed_Sync,3160).
-record(pk_GS2U_DatePushBox_Succeed_Sync,{
	%% Boolean 是否移动成功
	isSucceed,
	%% Boolean箱子是否移动到指定目标 后被删除
	isDelete,
	%% UInt64 箱子 CODE
	code,
	%% Single 箱子移动X
	x,
	%% Single 箱子移动Z
	z,
	%% UInt16 立即获得的分值
	score
}).

%% 
%% // 角色在任意时间进入地图时收到的初始化消息
-define(CMD_GS2U_DatePushBox_Welcome_Sync,17240).
-record(pk_GS2U_DatePushBox_Welcome_Sync,{
	%% UInt16 游戏前等待时间
	timeForBegin,
	%% UInt16 游戏中进行时间
	timeForEnd,
	%% UInt16 当前游戏积分
	score,
	%% Byte 宝石阵（固定36长度，0表示没有，1表示有
	listGemMatrix
}).

%% 
%% // 重置箱子阵的同步消息（会重置玩家坐标到初始点）
%% //     该消息可能在游戏正式开始时创建宝石阵时收到
%% //         也可能在所有宝石被消除后创建新的宝石阵时收到
%% //         也可能在手动重置宝石阵成功时收到
-define(CMD_GS2U_Date_ResetBox_Sync,20161).
-record(pk_GS2U_Date_ResetBox_Sync,{
	%% UInt32重置箱子的次数
	refreshNum
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% // 不推荐使用 <->
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // _Request 表示客户端向服务端进行请求
%% // _Ack			表示服务端对客户端请求的反馈
%% // _Ask			表示服务端向客户端询问
%% // _Reply		表示客户端对服务端询问的反馈
%% // _Sync		表示即便客户端没有向服务端进行请求，服务端也可能主动发送该消息以同步信息
%% // 0.多玩法公共协议
%% ////////////////////////////////////////////////////////////////////
%% // 进入约会地下城
-define(CMD_U2GS_DateEnter_Request,59172).
-record(pk_U2GS_DateEnter_Request,{
	%% Byte 玩法ID：1夺秒消除
	id
}).

%% 
%% // 玩家主动放弃游戏
%% //     放弃成功时直接进入结算阶段
-define(CMD_U2GS_DateLink_Giveup_Requset,21873).
-record(pk_U2GS_DateLink_Giveup_Requset,{
}).

%% 
%% // 手动重置宝石阵请求
%% // 使用消息GS2U_DateLink_ResetGem_Sync进行反馈
-define(CMD_U2GS_DateLink_ResetGem_Request,12817).
-record(pk_U2GS_DateLink_ResetGem_Request,{
}).

%% 
%% // 宝石的选中与取消请求
-define(CMD_U2GS_DateLink_Select_Request,941).
-record(pk_U2GS_DateLink_Select_Request,{
	%% Single 客户端获取的角色坐标X
	x,
	%% Single 客户端获取的角色坐标Y
	y,
	%% Byte 目标宝石序号，从1开始到36
	index,
	%% Boolean 选中还是取消
	isSelect
}).

%% 
%% //------------推箱子协议-----------------------
%% // 与箱子发生碰撞协议
-define(CMD_U2GS_DatePushBox_Request,46621).
-record(pk_U2GS_DatePushBox_Request,{
	%% UInt64 箱子 CODE
	code,
	%% Single 箱子移动X
	x,
	%% Single 箱子移动Z
	z,
	%% Boolean箱子是否移动到指定目标 后被删除
	isDelete
}).

%% 
%% //gs在用GameServerInfo
-define(CMD_GS2U_ChangeLineResponse,15641).
-record(pk_GS2U_ChangeLineResponse,{
	%% GameServerInfo线路列表
	gameServers,
	%% String验证码
	identity
}).

-record(pk_GameServerInfo,{
	%% Int16
	lineid,
	%% String
	name,
	%% String
	ip,
	%% Int16
	port,
	%% SByte
	state
}).

%% 
%% //#define GameServer_State_UnCheckPass			0		//正常
%% //#define GameServer_State_CheckPass				1		//火爆
%% //#define GameServer_State_Running					2		//爆满
%% //#define GameServer_State_ForbidLogin			3		//维护
%% //#define GameServer_State_Closed					4		//维护
%% //#define GameServer_State_SpecCanVisable			5	//测试人员可见
-define(CMD_LS2U_GameLineServerList,17992).
-record(pk_LS2U_GameLineServerList,{
	%% GameServerInfo
	gameServers
}).

%% 
-define(CMD_LS2U_LoginQue,25241).
-record(pk_LS2U_LoginQue,{
	%% UInt64自己在队列中的序号
	currentNumber
}).

%% 
%% //////////////////////////////////////////////////////////////////////////
%% //<-发出去     ;      ->收消息
%% /////////////////////////////////////////////////////////////////////////
%% // LoginServer 2 User
-define(CMD_LS2U_LoginResult,4461).
-record(pk_LS2U_LoginResult,{
	%% SByte 0为登录成功，非0为登录失败原因
	result,
	%% UInt64
	accountID,
	%% String
	identity,
	%% String不为空，手机必须展示
	msg
}).

%% 
%% // funcell 回复web消息
-define(CMD_LS2Web_CryptoAck,1690).
-record(pk_LS2Web_CryptoAck,{
	%% String 加密消息体
	bodyJsonStr
}).

%% 
%% // funcell 回复web消息
-define(CMD_LS2Web_NormalAck,1056).
-record(pk_LS2Web_NormalAck,{
	%% String 未加密消息体
	bodyJsonStr
}).

%% 
%% //////////////////////////////////////////////////////////////////////////
%% // User 2 LoginServer
-define(CMD_U2LS_Login_Normal,41532).
-record(pk_U2LS_Login_Normal,{
	%% String 平台帐号（游戏内帐号用平台id来绑定创建）
	platformAccount,
	%% String 平台名
	platformName,
	%% String 平台昵称，没有就填空串
	platformNickName,
	%% Int64
	time,
	%% String
	sign,
	%% String 程序生成，每个设备不能重复
	deviceId,
	%% String 手机串号
	imei,
	%% String 苹果推号
	idfa,
	%% String 网卡号
	mac,
	%% String 扩展参数串
	extParam,
	%% Int32 资源版本
	versionRes,
	%% Int32 执行程序版本
	versionExe,
	%% Int32 游戏版本？？
	versionGame,
	%% Int32 协议版本
	versionPro
}).

%% 
%% //请求线路列表
-define(CMD_U2LS_RequestGSLine,39508).
-record(pk_U2LS_RequestGSLine,{
}).

%% 
%% // funcell web消息
-define(CMD_Web2LS_Crypto,1767).
-record(pk_Web2LS_Crypto,{
	%% String 加密消息体
	bodyJsonStr
}).

%% 
%% // funcell web消息
-define(CMD_Web2LS_Normal,889).
-record(pk_Web2LS_Normal,{
	%% String 未加密消息体
	bodyJsonStr
}).

-record(pk_AchieveSchedule,{
	%% UInt16成就ID
	achieveID,
	%% Byte成就当前领取的进度阶段编号
	scheduleRewardID,
	%% UInt32成就当前进度数量
	scheduleCompleteNum,
	%% Byte成就当前完成的进度阶段编号
	scheduleCompleteID
}).

-record(pk_BadgeInfo,{
	%% UInt16MapID
	mapID,
	%% UInt32收集物品列表
	itemList
}).

-record(pk_DailyActiveInfo,{
	%% Byte日常活动ID
	dailyID,
	%% Byte完成的当前次数
	curTimes
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // 成就进度
-define(CMD_GS2U_AchieveSchedule,33796).
-record(pk_GS2U_AchieveSchedule,{
	%% UInt16成就ID
	achieveID,
	%% Byte成就当前领取的进度阶段编号
	scheduleRewardID,
	%% UInt32成就当前进度数量
	scheduleCompleteNum,
	%% Byte成就当前完成的进度阶段编号
	scheduleCompleteID
}).

%% 
%% // 成就进度列表
-define(CMD_GS2U_AchieveScheduleList,4174).
-record(pk_GS2U_AchieveScheduleList,{
	%% AchieveSchedule
	scheduleList
}).

%% 
%% // 新增已获得的称号
-define(CMD_GS2U_AddTitle,22187).
-record(pk_GS2U_AddTitle,{
	%% UInt16称号ID
	titleID,
	%% UInt32结束时间（0表示永久， 时间为服务器绝对时间）
	endTime
}).

%% 
-define(CMD_GS2U_BadgeInfo,55665).
-record(pk_GS2U_BadgeInfo,{
	%% UInt16MapID
	mapID,
	%% UInt32收集物品列表
	itemID
}).

%% 
%% // 徽章信息列表
-define(CMD_GS2U_BadgeInfoList,42763).
-record(pk_GS2U_BadgeInfoList,{
	%% BadgeInfo
	badgeInfoList
}).

%% 
%% // 删除已获得的称号
-define(CMD_GS2U_DelTitle,64357).
-record(pk_GS2U_DelTitle,{
	%% UInt16称号ID
	titleID
}).

%% 
%% // 初始化日常活动
-define(CMD_GS2U_InitDailyActiveInfo,60581).
-record(pk_GS2U_InitDailyActiveInfo,{
	%% DailyActiveInfo初始化日常活动列表
	dailyActiveInfoList,
	%% UInt16初始化领取奖励列表
	receivedAwardList
}).

%% 
%% // 已拥有称号信息列表
-define(CMD_GS2U_OwnTitleList,27692).
-record(pk_GS2U_OwnTitleList,{
	%% TitleInfo
	titleInfoList
}).

%% 
%% // 领取奖励结果
-define(CMD_GS2U_ReceiveDailyActiveAwardResult,46506).
-record(pk_GS2U_ReceiveDailyActiveAwardResult,{
	%% UInt16领取奖励的活跃度
	dailyActivityValue
}).

%% 
%% // 更新日常活动
-define(CMD_GS2U_UpdateDailyActiveInfo,6880).
-record(pk_GS2U_UpdateDailyActiveInfo,{
	%% DailyActiveInfo更新日常活动
	dailyActiveInfo
}).

-record(pk_TitleInfo,{
	%% UInt16称号ID
	titleID,
	%% UInt32结束时间（0表示永久， 时间为服务器绝对时间）
	endTime
}).

%% 
%% // 改变称号装配状态的消息
-define(CMD_U2GS_ChangeLimiteTitleState,64069).
-record(pk_U2GS_ChangeLimiteTitleState,{
	%% UInt16称号ID
	titleID
}).

%% 
%% // 改变称号装配状态的消息（存放对应槽位装的配称号ID，没有装配存为0）
-define(CMD_U2GS_ChangeTitleState,61023).
-record(pk_U2GS_ChangeTitleState,{
	%% UInt16称号槽位1
	titleSlot1,
	%% UInt16称号槽位2
	titleSlot2,
	%% UInt16称号槽位3
	titleSlot3,
	%% UInt16颜色效果槽位
	colorSlot,
	%% UInt16底图效果槽位
	floorSlot
}).

%% 
%% // 领取成就点数
-define(CMD_U2GS_ReceiveAchieveValue,53673).
-record(pk_U2GS_ReceiveAchieveValue,{
	%% UInt16成就ID
	achieveID
}).

%% 
%% // 领取奖励
-define(CMD_U2GS_ReceiveDailyActiveAward,60891).
-record(pk_U2GS_ReceiveDailyActiveAward,{
	%% UInt16领取奖励的活跃度
	dailyActivityValue
}).

-record(pk_AngelInvestmentData,{
	%% Boolean 今天能否领取
	isCanGet,
	%% Byte 可能领次数
	leftNumber,
	%% UInt16 商品ID
	id
}).

-record(pk_ArenaBattle,{
	%% UInt64玩家ID
	id,
	%% Byte玩家阵营
	camp,
	%% String玩家名称
	name,
	%% String服务器名称
	servername,
	%% Byte击杀数量
	killnum,
	%% UInt64战斗力
	force,
	%% UInt64伤害
	hurt,
	%% UInt32 竞技场战力
	arenaVal
}).

-record(pk_ArenaRole,{
	%% String服务器名字
	servername,
	%% String角色名字
	name,
	%% UInt64角色ID
	id,
	%% Byte阵营
	camp
}).

-record(pk_ArenaTeamMemberInfo,{
	%% UInt64 玩家id
	id,
	%% UInt64 玩家Code
	code,
	%% String 玩家名字
	name,
	%% Boolean 队长标志
	isLeader,
	%% Boolean 是否准备
	isPrepare,
	%% Byte 玩家等级
	level,
	%% UInt32 玩家职业
	career,
	%% UInt64 玩家战力
	force,
	%% UInt32 竞技场战力
	arenaVal
}).

%% 
%% //准备状态
-define(CMD_ArenaTeamMemberPrepare,9837).
-record(pk_ArenaTeamMemberPrepare,{
	%% UInt64
	id,
	%% Boolean
	isPrepare
}).

-record(pk_ChargeOrUseRuleInfo,{
	%% Byte活动中的档位id
	ruleID,
	%% UInt32非绑定钻石条件
	diamon,
	%% String奖励物品json
	itemJson,
	%% Boolean是否已经领取
	hasTake
}).

-record(pk_CrosArenaBattleHighRank,{
	%% UInt32玩家职业
	career,
	%% UInt64玩家roleID
	roleID,
	%% String玩家名称
	name,
	%% String玩家线路名称
	servername,
	%% UInt32玩家战斗力
	force,
	%% UInt32竞技场积分
	arenaVal,
	%% UInt32胜利次数
	win,
	%% UInt32失败次数
	fail,
	%% UInt64
	time
}).

-record(pk_CrosArenaBattleRank,{
	%% Byte排行榜名次
	rankID,
	%% UInt32玩家职业
	career,
	%% UInt64玩家roleID
	roleID,
	%% String玩家名称
	name,
	%% String玩家线路名称
	servername,
	%% UInt32玩家战斗力
	force,
	%% UInt32竞技场积分
	arenaVal,
	%% UInt32胜利次数
	win,
	%% UInt32失败次数
	fail
}).

%% 
-define(CMD_CrosArenaMatch,47633).
-record(pk_CrosArenaMatch,{
	%% Boolean
	isMatch
}).

-record(pk_CrosBattleExploit,{
	%% Byte排行榜名次
	rankID,
	%% UInt32玩家职业
	career,
	%% UInt64玩家roleID
	roleID,
	%% String玩家名称
	name,
	%% String玩家线路名称
	servername,
	%% UInt32玩家战斗力
	force,
	%% UInt32玩家功勋
	exploit
}).

-record(pk_DarknessPlayerRank,{
	%% UInt32 排名
	rank,
	%% Byte 阵营:1正义联盟，2邪恶部落
	camp,
	%% UInt64
	roleID,
	%% String
	roleName,
	%% UInt32
	roleLevel,
	%% UInt32 黑暗之地积分
	integral,
	%% Byte 黑暗之地当前位置，0为准备间，1~5对应多少层
	mapPos
}).

-record(pk_DarknessState,{
	%% UInt32 剩余时间，单位秒
	remainTime
}).

%% 
%% //删除
-define(CMD_DeleteArenaTeamMember,61899).
-record(pk_DeleteArenaTeamMember,{
	%% Boolean
	isMyself,
	%% UInt64
	id
}).

-record(pk_EscortPlunderMoney,{
	%% String 角色名字，怪物名字
	roleName,
	%% Int64 多人劫掠收益，单人怪物伤害收益
	plunderMoney
}).

-record(pk_EscortResultReward,{
	%% Byte 金钱类型
	moneyType,
	%% UInt32 值
	money,
	%% UInt32 彩蛋收益
	perValue
}).

-record(pk_EscortTeam,{
	%% UInt64
	roleID,
	%% String
	roleName,
	%% UInt16 开启序列
	sequenceNumber,
	%% UInt16
	cur_RobNumber,
	%% UInt16
	max_RobNumber
}).

%% 
%% // 下一波怪将在多少秒后到来
-define(CMD_GS2U_ACCityMonsterSurplusTime,49114).
-record(pk_GS2U_ACCityMonsterSurplusTime,{
	%% Int32 剩余多少秒
	surplusTime
}).

%% 
%% // 告诉客户端当前随机舞蹈列表
-define(CMD_GS2U_ActionList,55352).
-record(pk_GS2U_ActionList,{
	%% UInt32 正确ID
	correctID,
	%% UInt32 动作列表
	danceIDs
}).

%% 
%% //活动结束
-define(CMD_GS2U_ActivityEnd,53764).
-record(pk_GS2U_ActivityEnd,{
}).

%% 
%% //活动表中的活动状态
-define(CMD_GS2U_ActivityState,62178).
-record(pk_GS2U_ActivityState,{
	%% UInt16活动配置表的id
	activityID,
	%% UInt32活动地图id
	mapID,
	%% Int16所处阶段
	phase
}).

%% 
%% //通知客服端XX的邀请
-define(CMD_GS2U_AddArenaTeamMemberRequest,38390).
-record(pk_GS2U_AddArenaTeamMemberRequest,{
	%% UInt64邀请者ID
	roleID,
	%% String邀请者名字
	name
}).

%% 
%% // 天使投资购买
-define(CMD_GS2U_AngelInvestmentList,8750).
-record(pk_GS2U_AngelInvestmentList,{
	%% AngelInvestmentData
	lists
}).

%% 
%% //第一全对和幸运玩家
-define(CMD_GS2U_AnswerFirstAndLuckyPlayer,11460).
-record(pk_GS2U_AnswerFirstAndLuckyPlayer,{
	%% String玩家名字
	playerName
}).

%% 
%% //答题活动开始
-define(CMD_GS2U_AnswerQuestion,24716).
-record(pk_GS2U_AnswerQuestion,{
	%% UInt64开始时间
	startTime,
	%% Byte答题次数
	answerNum,
	%% Question题目列表
	questionList
}).

%% 
%% //战斗结算
-define(CMD_GS2U_ArenaBattleList,39837).
-record(pk_GS2U_ArenaBattleList,{
	%% Byte
	res,
	%% ArenaBattle
	bList
}).

%% 
%% //角色死亡消息
-define(CMD_GS2U_ArenaRoleDead,41305).
-record(pk_GS2U_ArenaRoleDead,{
	%% UInt64
	id
}).

%% 
%% //角色列表
-define(CMD_GS2U_ArenaRoleList,2003).
-record(pk_GS2U_ArenaRoleList,{
	%% UInt16竞技时间
	time,
	%% ArenaRole角色列表
	roleList
}).

%% 
-define(CMD_GS2U_AttackerDefenderQuotaNumberAck,17236).
-record(pk_GS2U_AttackerDefenderQuotaNumberAck,{
	%% UInt16活动配置表的id
	activityID,
	%% UInt32活动地图id
	mapID,
	%% UInt16进攻方可用人数
	acctackerQuotaNum
}).

%% 
%% // 目标打断舞蹈
-define(CMD_GS2U_BreakDance,32524).
-record(pk_GS2U_BreakDance,{
	%% UInt64
	roleID
}).

%% 
%% //王者守护宣言修改成功
-define(CMD_GS2U_ChangeGuardianDeclaration,17201).
-record(pk_GS2U_ChangeGuardianDeclaration,{
	%% Boolean守护宣言修改结果
	isChange
}).

%% 
-define(CMD_GS2U_CrosArenaBattleHighRanks,51053).
-record(pk_GS2U_CrosArenaBattleHighRanks,{
	%% CrosArenaBattleHighRank
	ranks
}).

%% 
-define(CMD_GS2U_CrosArenaBattleRanks,39892).
-record(pk_GS2U_CrosArenaBattleRanks,{
	%% CrosArenaBattleRank角色列表
	ranks
}).

%% 
-define(CMD_GS2U_CrosBattleExploits,11911).
-record(pk_GS2U_CrosBattleExploits,{
	%% CrosBattleExploit
	ranks
}).

%% 
%% // 当前护送类型
-define(CMD_GS2U_CurEscortType,38930).
-record(pk_GS2U_CurEscortType,{
	%% UInt16 1单人护送，2多人护送，3劫掠
	escortType
}).

%% 
%% // 告诉客户端自己的阵营
-define(CMD_GS2U_DarknessCamp,59018).
-record(pk_GS2U_DarknessCamp,{
	%% Byte 阵营:1正义联盟，2邪恶部落
	camp,
	%% UInt32 黑暗之地积分
	integral
}).

%% 
%% // 返回黑暗之地初始信息
-define(CMD_GS2U_DarknessInfo,42279).
-record(pk_GS2U_DarknessInfo,{
	%% DarknessState
	state,
	%% Byte 购买时间，需要的金钱类型
	buyMoneyType,
	%% Int32 购买时间，需要的金钱数量，-1表示不能再购买，如果为0则表示无消耗
	buyMoney
}).

%% 
%% // 被击杀或者击杀水晶变化情况
-define(CMD_GS2U_DarknessKillOrBeKill,51195).
-record(pk_GS2U_DarknessKillOrBeKill,{
	%% String
	targetName,
	%% Boolean 自己胜利为true,自己失败为false
	isSuccess,
	%% Int32 变化的水晶数量
	changePebble
}).

%% 
%% // 黑暗之地的排队情况
-define(CMD_GS2U_DarknessQuenenState,57194).
-record(pk_GS2U_DarknessQuenenState,{
	%% Byte 入口编号(这个值不用管)
	entrance,
	%% Byte 第几层(0为没排队)
	floor
}).

%% 
%% // 返回黑暗之地排行榜(排行榜末尾包含自己)
-define(CMD_GS2U_DarknessRank,26625).
-record(pk_GS2U_DarknessRank,{
	%% DarknessPlayerRank 阵营1：正义联盟
	camp1,
	%% DarknessPlayerRank 阵营2：邪恶部落
	camp2
}).

%% 
%% // 时间
-define(CMD_GS2U_DarknessState,59020).
-record(pk_GS2U_DarknessState,{
	%% DarknessState
	state
}).

%% 
%% // 命运主星列表
-define(CMD_GS2U_DestinyStar,56056).
-record(pk_GS2U_DestinyStar,{
	%% LotteryItem
	stars
}).

%% 
%% // 返回入口列表
-define(CMD_GS2U_EnterDarkness,63153).
-record(pk_GS2U_EnterDarkness,{
	%% Byte 入口列表
	entrances
}).

%% 
%% // 护送劫掠结果
-define(CMD_GS2U_EscortResult,56809).
-record(pk_GS2U_EscortResult,{
	%% UInt16 1单人护送，2多人护送，3劫掠
	escortType,
	%% Byte 结束原因，1马车到达终点，2马车死亡，3时间到
	endReason,
	%% Boolean true成功
	isSuccess,
	%% EscortResultReward
	rewards,
	%% EscortPlunderMoney
	plunder
}).

%% 
-define(CMD_GS2U_GetChargeOrUseGiftAck,5311).
-record(pk_GS2U_GetChargeOrUseGiftAck,{
	%% Byte活动类型
	type,
	%% Byte活动中的档位id
	ruleID,
	%% Boolean是否领成功
	success
}).

%% 
%% // 哥布林玩法开启状态
-define(CMD_GS2U_Goblin_Open_State,3340).
-record(pk_GS2U_Goblin_Open_State,{
	%% Boolean 是否开启
	isOpen,
	%% UInt32 开启的地图ID
	mapID
}).

%% 
%% //跨服混沌战场倒计时
-define(CMD_GS2U_HDBattleCD,48653).
-record(pk_GS2U_HDBattleCD,{
	%% UInt16
	time
}).

%% 
-define(CMD_GS2U_HDBattleExploits,56852).
-record(pk_GS2U_HDBattleExploits,{
	%% Byte1:战功 2:结算
	type,
	%% HDBattleExploit
	exploits
}).

%% 
%% // 多少秒后，门将打开
-define(CMD_GS2U_HDBattleOpenSurplusTime,35345).
-record(pk_GS2U_HDBattleOpenSurplusTime,{
	%% Int16 剩余多少秒
	surplusTime
}).

%% 
%% //跨服混沌战场
%% //跨服混沌战场阶段
-define(CMD_GS2U_HDBattlePhase,18287).
-record(pk_GS2U_HDBattlePhase,{
	%% Byte活动阶段
	phase,
	%% UInt16活动参数
	param1,
	%% UInt16活动参数
	param2
}).

%% 
%% // 采集成功一件东西
-define(CMD_GS2U_HDGatherSuccess,28188).
-record(pk_GS2U_HDGatherSuccess,{
	%% UInt32
	gatherID
}).

%% 
%% //点亮主面板的icon
-define(CMD_GS2U_IconLight,37401).
-record(pk_GS2U_IconLight,{
	%% Byteicon编号(1为充值
	id,
	%% Boolean是否领成功
	light
}).

%% 
%% //初始化野外boss信息
-define(CMD_GS2U_InitWildBossInfo,29701).
-record(pk_GS2U_InitWildBossInfo,{
	%% WildBossInfo
	infos
}).

%% 
%% // 已经报名成功，且分配战场成功，通知玩家可以进入战场
-define(CMD_GS2U_JoinHDBattle,55946).
-record(pk_GS2U_JoinHDBattle,{
}).

%% 
%% // 自己的击杀数量
-define(CMD_GS2U_KillPlayerNumber,22196).
-record(pk_GS2U_KillPlayerNumber,{
	%% UInt32 排名
	sortNumber,
	%% UInt32 击杀数
	killNumber,
	%% UInt32 当前连杀数
	lxKillNumber,
	%% UInt32 需要击杀数
	needKill,
	%% UInt32 本次活动剩余秒数
	remainSecond,
	%% UInt32 当前采集次数
	gatherNumber,
	%% UInt32 需要采集次数
	needGatherNumber
}).

%% 
%% // 返回击杀排行榜
-define(CMD_GS2U_KillRank,9310).
-record(pk_GS2U_KillRank,{
	%% KillRank
	rank
}).

%% 
%% //王者守护  服务器下发下来的守护方信息
-define(CMD_GS2U_KingBattleBuffInfo,64360).
-record(pk_GS2U_KingBattleBuffInfo,{
	%% UInt64
	mirrorBuffcfgID,
	%% UInt64
	defenderBuffcfgID,
	%% UInt64
	attackerBuffcfgID
}).

%% 
%% //王者守护  服务器下发下来的守护方信息
-define(CMD_GS2U_KingBattleRepairMirror,36559).
-record(pk_GS2U_KingBattleRepairMirror,{
	%% UInt64
	mirrorMaxHp,
	%% UInt64
	mirrorCurrentHp
}).

%% 
%% //王者守护  守护者结算面板
-define(CMD_GS2U_KingBattleResult,39124).
-record(pk_GS2U_KingBattleResult,{
	%% Boolean是否新守护者
	isNewKing,
	%% UInt64守护成功则为击杀人数，新守护者则是伤害
	killNumOrHurt,
	%% Byte守护好多天
	days,
	%% String守护宣言
	declaration,
	%% String名字
	name,
	%% UInt64 角色ID
	roleID,
	%% UInt32 职业
	career,
	%% SByte 种族
	race,
	%% SByte 性别
	sex,
	%% Int32
	head,
	%% Int32翅膀等级
	wingLevel,
	%% Int32 时装ID列表
	fashionIDs,
	%% PlayerKingBattleEquip 装备ID列表
	equipIDList,
	%% PlayerKingBattleEquipLevel装备等级列表
	equipLevelList
}).

%% 
%% // 奖池金额与抽奖消耗
-define(CMD_GS2U_LotteryMoney,34899).
-record(pk_GS2U_LotteryMoney,{
	%% UInt64 金币奖池
	pondGold,
	%% UInt64 钻石奖池
	pondDiamond
}).

%% 
-define(CMD_GS2U_LotteryNote,56467).
-record(pk_GS2U_LotteryNote,{
	%% LotteryNote
	notes
}).

%% 
%% // 重置时间
-define(CMD_GS2U_LotteryResetTime,9419).
-record(pk_GS2U_LotteryResetTime,{
	%% UInt64 免费金币抽取CD剩余秒数
	goldFreeRstTime,
	%% UInt64 免费钻石抽取CD剩余秒数
	diamondFreeRstTime
}).

%% 
%% // 抽中结果
-define(CMD_GS2U_LotteryResult,50206).
-record(pk_GS2U_LotteryResult,{
	%% LotteryItem
	item
}).

%% 
%% //王者雕像数据
-define(CMD_GS2U_MarrorInfoAck,10464).
-record(pk_GS2U_MarrorInfoAck,{
	%% String昵称
	nickName,
	%% UInt16等级
	playerLevel,
	%% UInt32战斗力
	playerForce,
	%% UInt64 角色ID
	roleID,
	%% UInt64 玩家流水号
	playerCode,
	%% UInt32 职业
	career,
	%% SByte 种族
	race,
	%% SByte 性别
	sex,
	%% Int32
	head,
	%% Int32翅膀等级
	wingLevel,
	%% String军团名
	clique,
	%% UInt32成功防守天数
	defendDays,
	%% UInt64防守镜像最大生命值
	mirrorMaxHp,
	%% UInt64防守镜像剩余生命值
	mirrorLastHp,
	%% Int32 时装ID列表
	fashionIDs,
	%% PlayerKingBattleEquip 装备ID列表
	equipIDList,
	%% PlayerKingBattleEquipLevel装备等级列表
	equipLevelList,
	%% String守护宣言
	declaration
}).

%% 
%% //通知客户端boss死亡
-define(CMD_GS2U_NoticeWildBossDead,44223).
-record(pk_GS2U_NoticeWildBossDead,{
	%% WildBossInfo
	info
}).

%% 
%% //通知客户端boss仇恨目标，和显示界面与否
-define(CMD_GS2U_NoticeWildBossTarget,49672).
-record(pk_GS2U_NoticeWildBossTarget,{
	%% UInt64 目标Code
	targetCode,
	%% String 目标名字
	name,
	%% Boolean 是否显示
	isShow
}).

%% 
%% //运营活动的兑换
-define(CMD_GS2U_OperateAct_Exchange,23160).
-record(pk_GS2U_OperateAct_Exchange,{
	%% UInt32兑换ID
	exchangeID,
	%% Byte兑换的类型，1为道具，2为货币，3为自定义
	exchangeType,
	%% Byte本角色已经兑换的次数
	roleExchangedNum,
	%% Byte本角色最大可以兑换的次数
	roleMaxExchangeNum,
	%% UInt16兑换的参数，如果兑换的是道具，则为道具ID；如果是货币则为货币类型
	exchangeArg,
	%% UInt16兑换的数量
	exchangeNum,
	%% UInt32兑换开始时间
	startTime,
	%% UInt32兑换结束时间
	endTime,
	%% String兑换活动名字
	name,
	%% String兑换标题
	title,
	%% String内容描述
	content,
	%% OperateActExchangeRequire兑换所需要的道具列表
	requireList
}).

%% 
-define(CMD_GS2U_OperateExchangeAck,15234).
-record(pk_GS2U_OperateExchangeAck,{
	%% UInt32兑换ID
	exchangeID
}).

%% 
%% //答题信息
-define(CMD_GS2U_PlayerAnswerInfo,44793).
-record(pk_GS2U_PlayerAnswerInfo,{
	%% UInt32答题正确个数
	trueNum,
	%% UInt32累计经验
	totalExp,
	%% UInt32累计金币
	totalCoin
}).

%% 
%% //答题结果
-define(CMD_GS2U_PlayerAnswerResult,19380).
-record(pk_GS2U_PlayerAnswerResult,{
	%% Int32答题结果0答错1答对
	result,
	%% Byte正确答案
	trueAnswer
}).

%% 
%% // 客户端收到当前排队人数
-define(CMD_GS2U_QueueNumber,64834).
-record(pk_GS2U_QueueNumber,{
	%% UInt32 当前队列中的人数
	queueNumber,
	%% Boolean 活动是否开始，true 是
	isStart,
	%% Boolean 我是否在排队中，true 是
	isIMApply
}).

%% 
-define(CMD_GS2U_RequestChargeOrUseListAck,46710).
-record(pk_GS2U_RequestChargeOrUseListAck,{
	%% Byte活动类型
	type,
	%% String活动名字
	activityName,
	%% String活动文字描述
	activityDesc,
	%% UInt32
	beginTime,
	%% UInt32
	endTime,
	%% UInt32活动期间累充消费、充值的非绑定钻石数
	amountInTime,
	%% ChargeOrUseRuleInfo
	ruleInfoList
}).

%% 
%% // 返回多人护送列表
-define(CMD_GS2U_ReturnEscortList,22622).
-record(pk_GS2U_ReturnEscortList,{
	%% EscortTeam 多人护送列表
	etlist
}).

%% 
-define(CMD_GS2U_RobitAutoAnswer,44169).
-record(pk_GS2U_RobitAutoAnswer,{
	%% RobitAnswer
	answerList
}).

%% 
%% // 返回势力选择
-define(CMD_GS2U_SelectCamp,29521).
-record(pk_GS2U_SelectCamp,{
	%% DarknessPlayerRank 阵营1：正义联盟
	camp1,
	%% UInt32
	cam1Num,
	%% DarknessPlayerRank 阵营2：邪恶部落
	camp2,
	%% UInt32
	cam2Num
}).

%% 
%% // 选择的舞蹈结果
-define(CMD_GS2U_SelectDanceID,18854).
-record(pk_GS2U_SelectDanceID,{
	%% UInt32
	danceID,
	%% Boolean 选择结果
	correct
}).

%% 
%% // 返回自己的信息
-define(CMD_GS2U_SelfDarkness,61253).
-record(pk_GS2U_SelfDarkness,{
	%% DarknessPlayerRank
	self,
	%% Boolean 是否需要选择阵营,true需要，false不需要
	isNeedSelectCamp,
	%% UInt32
	bossID,
	%% UInt32 剩余时间
	syFreshTime
}).

%% 
%% // 七日任务列表
-define(CMD_GS2U_SevenMissionDataList,56079).
-record(pk_GS2U_SevenMissionDataList,{
	%% Byte第几天
	days,
	%% UInt32剩余时间 
	timeoutSeconds,
	%% SevenDayMissionData
	lists
}).

%% 
%% // 七日任务列表
-define(CMD_GS2U_SevenMissionDataUpdate,31054).
-record(pk_GS2U_SevenMissionDataUpdate,{
	%% Boolean条件满足时，是否领取过奖励
	isFinish,
	%% UInt16 已经完成次数
	number,
	%% UInt16 最大次数
	max,
	%% UInt16 id
	missionid
}).

%% 
%% // 准备切换舞蹈
-define(CMD_GS2U_SwitchDance,26463).
-record(pk_GS2U_SwitchDance,{
	%% Byte 多少秒后切换舞蹈
	second
}).

%% 
%% // 触发了一个事件(服务器通知客户端触发一个事件，客户端响应则回复同样的协议)
-define(CMD_GS2U_TriggerEvent,17922).
-record(pk_GS2U_TriggerEvent,{
}).

%% 
%% // 事件结果
-define(CMD_GS2U_TriggerEventResult,63567).
-record(pk_GS2U_TriggerEventResult,{
	%% UInt16
	eventID
}).

%% 
%% //更新跨服竞技场队伍信息（添加和改变）
-define(CMD_GS2U_UpdateArenaTeamMember,28161).
-record(pk_GS2U_UpdateArenaTeamMember,{
	%% ArenaTeamMemberInfo
	teamMemberInfos
}).

%% 
-define(CMD_GS2U_WorldLevel,11926).
-record(pk_GS2U_WorldLevel,{
	%% Byte
	worldLevel
}).

-record(pk_HDBattleExploit,{
	%% Byte排行榜名次
	rankID,
	%% Byte
	camp,
	%% UInt64玩家roleID
	roleID,
	%% String玩家名称
	name,
	%% String玩家线路名称
	servername,
	%% UInt16玩家击杀数量
	killNum,
	%% UInt16玩家助攻击杀数量
	asKillNum,
	%% UInt32玩家功勋
	exploit
}).

-record(pk_KillRank,{
	%% UInt32 排名
	sortNumber,
	%% UInt32 击杀数
	killNumber,
	%% String 玩家名
	playerName
}).

-record(pk_LotteryItem,{
	%% UInt64
	roleID,
	%% String
	roleName,
	%% UInt32 奖池ID
	pondID,
	%% UInt32 ID
	onlyID,
	%% UInt32
	itemId,
	%% UInt32
	itemNumber,
	%% Byte 0非绑定，1绑定
	isBind
}).

-record(pk_LotteryNote,{
	%% UInt64
	roleID,
	%% String
	roleName,
	%% UInt32
	itemID,
	%% UInt32
	itemNumber,
	%% Byte 0非绑定，1绑定
	isBind,
	%% Byte 是否添加到全服占卜，0不添加，1添加
	isServerNote,
	%% UInt64 占卜时间
	zbTime
}).

-record(pk_OperateActExchangeRequire,{
	%% UInt16 兑换需要的道具ID
	itemID,
	%% UInt16 兑换需要的道具数量
	itemNum
}).

-record(pk_PlayerKingBattleEquip,{
	%% UInt32 装备ID
	equipID,
	%% Byte 品质
	quality
}).

-record(pk_PlayerKingBattleEquipLevel,{
	%% Byte
	type,
	%% Byte
	level
}).

-record(pk_Question,{
	%% UInt32题目ID
	questionID,
	%% Byte题目答案
	answers
}).

-record(pk_RobitAnswer,{
	%% UInt64开始时间
	startTime,
	%% UInt32间隔时间
	intervalTime
}).

-record(pk_SevenDayMissionData,{
	%% Boolean条件满足时，是否领取过奖励
	isFinish,
	%% UInt16 已经完成次数
	number,
	%% UInt16 最大次数
	max,
	%% UInt16 id
	missionid
}).

%% 
%% //邀请
-define(CMD_U2GS_AddArenaTeamMember,6431).
-record(pk_U2GS_AddArenaTeamMember,{
	%% UInt64
	id
}).

%% 
%% //反馈邀请
-define(CMD_U2GS_AddArenaTeamMemberAck,254).
-record(pk_U2GS_AddArenaTeamMemberAck,{
	%% UInt64邀请者ID
	roleID,
	%% Byte0:拒绝 1:接受
	result
}).

%% 
%% // 天使投资购买
-define(CMD_U2GS_AngelInvestment,39626).
-record(pk_U2GS_AngelInvestment,{
	%% UInt16商品ID、0表示所有
	id
}).

%% 
%% // 天使投资领取
-define(CMD_U2GS_AngelInvestmentGet,13560).
-record(pk_U2GS_AngelInvestmentGet,{
	%% UInt16
	id
}).

%% 
%% // 报名广场舞
-define(CMD_U2GS_ApplyDance,8651).
-record(pk_U2GS_ApplyDance,{
	%% Byte 1当前在区域中，2不在区域
	type
}).

%% 
%% //王者战天下 请求当前进攻方、防守方可用人数
-define(CMD_U2GS_AttackDefenderQuotaNumber,32440).
-record(pk_U2GS_AttackDefenderQuotaNumber,{
	%% UInt16活动配置表的id
	activityID,
	%% UInt32活动地图id
	mapID
}).

%% 
%% // 打断舞蹈
-define(CMD_U2GS_BreakDance,65134).
-record(pk_U2GS_BreakDance,{
}).

%% 
%% // 请求离开报名混沌战场
-define(CMD_U2GS_CancelApply,474).
-record(pk_U2GS_CancelApply,{
}).

%% 
%% // 广场舞区域
-define(CMD_U2GS_DanceArea,26150).
-record(pk_U2GS_DanceArea,{
	%% Byte 1进入，2离开
	type
}).

%% 
%% // 请求黑暗之地排行榜
-define(CMD_U2GS_DarknessRank,48307).
-record(pk_U2GS_DarknessRank,{
}).

%% 
%% //领取充值、消费奖励(只能在活动期间领取）
-define(CMD_U2GS_GetChargeOrUseGift,40452).
-record(pk_U2GS_GetChargeOrUseGift,{
	%% Byte活动类型
	type,
	%% Byte活动中的档位id
	ruleID
}).

%% 
%% //王者雕像点赞
-define(CMD_U2GS_GiveMarrorFlower,24589).
-record(pk_U2GS_GiveMarrorFlower,{
}).

%% 
%% //王者守护宣言
-define(CMD_U2GS_GuardianDeclaration,45851).
-record(pk_U2GS_GuardianDeclaration,{
	%% String守护宣言
	declaration
}).

%% 
%% // 请求击杀排行榜
-define(CMD_U2GS_KillRank,16112).
-record(pk_U2GS_KillRank,{
}).

%% 
%% //王者守护 购买进攻方buff
-define(CMD_U2GS_KingBattleBuyAttackerBuff,15321).
-record(pk_U2GS_KingBattleBuyAttackerBuff,{
}).

%% 
%% //王者守护 一键购买进攻方buff
-define(CMD_U2GS_KingBattleBuyAttackerBuffOneKey,10874).
-record(pk_U2GS_KingBattleBuyAttackerBuffOneKey,{
}).

%% 
%% //王者守护 购买守护者buff
-define(CMD_U2GS_KingBattleBuyDeffenderBuff,22897).
-record(pk_U2GS_KingBattleBuyDeffenderBuff,{
}).

%% 
%% //王者守护 一键购买守护者buff
-define(CMD_U2GS_KingBattleBuyDeffenderBuffOneKey,29010).
-record(pk_U2GS_KingBattleBuyDeffenderBuffOneKey,{
}).

%% 
%% //王者守护 购买镜像buff
-define(CMD_U2GS_KingBattleBuyMirrorBuff,27423).
-record(pk_U2GS_KingBattleBuyMirrorBuff,{
}).

%% 
%% //王者守护 一键购买镜像buff
-define(CMD_U2GS_KingBattleBuyMirrorBuffOneKey,7440).
-record(pk_U2GS_KingBattleBuyMirrorBuffOneKey,{
}).

%% 
%% //王者守护 客户端获取防守方信息
-define(CMD_U2GS_KingBattleGetBuffInfo,13534).
-record(pk_U2GS_KingBattleGetBuffInfo,{
}).

%% 
%% //王者守护 修复镜像
-define(CMD_U2GS_KingBattleRepairMirror,49553).
-record(pk_U2GS_KingBattleRepairMirror,{
	%% Boolean 是否一键修复
	isRepairAll
}).

%% 
%% // 打开占卜界面
-define(CMD_U2GS_OpenLotteryForm,36633).
-record(pk_U2GS_OpenLotteryForm,{
}).

%% 
%% // 请求打开势力选择界面
-define(CMD_U2GS_OpenSelectCamp,48829).
-record(pk_U2GS_OpenSelectCamp,{
}).

%% 
%% //兑换运营搞的兑换活动
-define(CMD_U2GS_OperateExchange,9105).
-record(pk_U2GS_OperateExchange,{
	%% UInt32兑换ID
	exchangeID
}).

%% 
%% //刷新运营兑换活动面板
-define(CMD_U2GS_OperateExchangeRefresh,27754).
-record(pk_U2GS_OperateExchangeRefresh,{
}).

%% 
%% //玩家答题
-define(CMD_U2GS_PlayerAnswerQuestion,3611).
-record(pk_U2GS_PlayerAnswerQuestion,{
	%% UInt32题目ID
	questionID,
	%% Byte答案
	answers
}).

%% 
%% // 请求天使投资数据
-define(CMD_U2GS_QueryAngelInvestment,60162).
-record(pk_U2GS_QueryAngelInvestment,{
}).

%% 
%% // 请求七日任务列表
-define(CMD_U2GS_QuerySevenMissionData,40751).
-record(pk_U2GS_QuerySevenMissionData,{
}).

%% 
%% //准备匹配
-define(CMD_U2GS_ReadyArena,2366).
-record(pk_U2GS_ReadyArena,{
}).

%% 
%% //请求跨服排行榜
-define(CMD_U2GS_RequestCrosArenaRanks,35544).
-record(pk_U2GS_RequestCrosArenaRanks,{
	%% Byte 0:临时排行榜 1:永久排行榜
	type
}).

%% 
%% //请求跨服排行榜
-define(CMD_U2GS_RequestCrosRanks,40839).
-record(pk_U2GS_RequestCrosRanks,{
}).

%% 
%% // 请求黑暗之地初始信息(打开界面)
-define(CMD_U2GS_RequestDarknessInfo,13748).
-record(pk_U2GS_RequestDarknessInfo,{
}).

%% 
%% // 进入黑暗之地(进入失败，自动加入排队)
-define(CMD_U2GS_RequestEnterDarkness,46152).
-record(pk_U2GS_RequestEnterDarkness,{
	%% Byte 入口编号
	entrance
}).

%% 
%% // 请求入口列表
-define(CMD_U2GS_RequestEntrance,36679).
-record(pk_U2GS_RequestEntrance,{
}).

%% 
%% // 请求多人护送列表
-define(CMD_U2GS_RequestEscortList,22011).
-record(pk_U2GS_RequestEscortList,{
}).

%% 
%% // 申请劫掠
-define(CMD_U2GS_RequestEscortRob,49816).
-record(pk_U2GS_RequestEscortRob,{
	%% UInt16 开启序列
	sequenceNumber
}).

%% 
%% // 申请单人护送
-define(CMD_U2GS_RequestEscortSolo,35456).
-record(pk_U2GS_RequestEscortSolo,{
}).

%% 
%% // 申请多人护送
-define(CMD_U2GS_RequestEscortTeam,57606).
-record(pk_U2GS_RequestEscortTeam,{
}).

%% 
%% //请求进入跨服混沌战场
-define(CMD_U2GS_RequestHDBattle,22289).
-record(pk_U2GS_RequestHDBattle,{
}).

%% 
%% //请求混沌战场倒计时（目的为了同步一下时间）
-define(CMD_U2GS_RequestHDBattleCD,64722).
-record(pk_U2GS_RequestHDBattleCD,{
}).

%% 
%% //请求跨服混沌战场战功列表
-define(CMD_U2GS_RequestHDBattleExploits,29169).
-record(pk_U2GS_RequestHDBattleExploits,{
}).

%% 
%% //王者战天下 请求进入活动
-define(CMD_U2GS_RequestInActivity,10617).
-record(pk_U2GS_RequestInActivity,{
	%% UInt16活动配置表的id
	activityID,
	%% UInt32活动地图id
	mapID
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // 请求加入混沌战场
-define(CMD_U2GS_RequestJoinHDBattle,27415).
-record(pk_U2GS_RequestJoinHDBattle,{
}).

%% 
%% // 抽奖
-define(CMD_U2GS_RequestLottery,33432).
-record(pk_U2GS_RequestLottery,{
	%% Boolean 是否是金币抽奖
	isGold,
	%% Boolean 是否是免费
	isFree,
	%% Byte 抽多少次，1 或者 10
	number
}).

%% 
%% // 请求重置时间
-define(CMD_U2GS_RequestLotteryResetTime,47272).
-record(pk_U2GS_RequestLotteryResetTime,{
}).

%% 
%% //请求王者雕像数据
-define(CMD_U2GS_RequestMarrorInfo,25482).
-record(pk_U2GS_RequestMarrorInfo,{
}).

%% 
%% //请求活动配置表
-define(CMD_U2GS_RequestOPActivityConfList,39583).
-record(pk_U2GS_RequestOPActivityConfList,{
	%% Byte活动类型
	type
}).

%% 
%% // 客户端请求当前活动状态
-define(CMD_U2GS_RequestQueueNumber,37889).
-record(pk_U2GS_RequestQueueNumber,{
}).

%% 
%% // 选择势力
-define(CMD_U2GS_SelectCamp,62131).
-record(pk_U2GS_SelectCamp,{
	%% Byte 阵营:1正义联盟，2邪恶部落
	camp
}).

%% 
%% // 选择一种舞蹈
-define(CMD_U2GS_SelectDanceID,32796).
-record(pk_U2GS_SelectDanceID,{
	%% UInt32
	danceID
}).

%% 
%% // 请求自己的信息
-define(CMD_U2GS_SelfDarkness,17399).
-record(pk_U2GS_SelfDarkness,{
}).

%% 
%% // 七日任务完成
-define(CMD_U2GS_SevenMissionCompletion,32637).
-record(pk_U2GS_SevenMissionCompletion,{
	%% UInt16完成任务ID
	missionid
}).

%% 
%% //开始匹配
-define(CMD_U2GS_StartArena,40411).
-record(pk_U2GS_StartArena,{
}).

-record(pk_WildBossInfo,{
	%% UInt32刷boss的地图ID
	mapID,
	%% UInt32刷bossID
	bossID,
	%% UInt64下次刷新时间，0为已经刷新
	refreshTime
}).

%% 
%% // 返回对战记录
-define(CMD_GS2U_BattleNotes,26077).
-record(pk_GS2U_BattleNotes,{
	%% LadderLS
	lsInfo,
	%% LadderMatchInfo
	selfInfo
}).

%% 
%% // 比赛开始，倒计时秒
-define(CMD_GS2U_BattleStartSec,20351).
-record(pk_GS2U_BattleStartSec,{
	%% UInt32 战斗剩余秒数
	second
}).

%% 
%% // 战斗结果
-define(CMD_GS2U_Ladder1v1BattleEnd,34585).
-record(pk_GS2U_Ladder1v1BattleEnd,{
	%% Byte 0失败，1胜利
	result,
	%% UInt32 累积功勋
	exploit,
	%% UInt32 最新排名
	rank
}).

%% 
%% // 返回筛选的对手
-define(CMD_GS2U_LadderTargetList,45601).
-record(pk_GS2U_LadderTargetList,{
	%% LadderTargetInfo 对手列表，注意：size =< 6
	targets,
	%% SelfBattleInfo 自己的信息
	selfInfo
}).

%% 
%% // 准备开始，倒计时秒
-define(CMD_GS2U_PrepareSec,50114).
-record(pk_GS2U_PrepareSec,{
	%% Byte 剩余秒数，客户端自行倒计时
	second
}).

%% 
%% // 返回王者列表
-define(CMD_GS2U_ReturnKingList,9433).
-record(pk_GS2U_ReturnKingList,{
	%% KingRole 王者列表
	kings
}).

-record(pk_KingRole,{
	%% UInt64 roleID
	roleID,
	%% UInt32 当前排名
	ranksort,
	%% UInt32 职业
	career,
	%% String
	roleName,
	%% UInt32 被膜拜次数
	worshipTimes
}).

-record(pk_LadderLS,{
	%% UInt64 胜利者
	roleID,
	%% String
	roleName,
	%% Boolean 是否是终结者，true表示终结对象
	isTerminator,
	%% UInt16 连胜次数
	ls_times,
	%% UInt64 失败者，目标
	targetID,
	%% String
	targetName
}).

-record(pk_LadderMatchInfo,{
	%% UInt64 自己
	roleID,
	%% String
	roleName,
	%% Boolean true挑战者,false被挑战者
	isChallenge,
	%% Boolean true胜利,false失败
	isWin,
	%% UInt64 目标
	targetID,
	%% String
	targetName,
	%% UInt32 挑战前排名
	rank1,
	%% UInt32 挑战后排名
	rank2
}).

-record(pk_LadderTargetInfo,{
	%% UInt64
	roleID,
	%% String
	name,
	%% UInt16 等级
	level,
	%% UInt32 职业
	career,
	%% UInt32 当前排名
	ranksort,
	%% UInt32 战斗力
	fightingCapacity,
	%% SByte 性别
	sex,
	%% SByte 种族
	race
}).

-record(pk_SelfBattleInfo,{
	%% UInt32 当前排名
	ranksort,
	%% UInt32 战斗力
	fightingCapacity,
	%% UInt32 累积功勋
	exploit,
	%% UInt16 当前完成的挑战次数
	cur_ChallengeTimes,
	%% UInt16 今日最大的挑战次数
	max_ChallengeTimes,
	%% Byte 本次挑战需要消耗的金钱类型
	moneyType,
	%% UInt32 本次挑战需要消耗的金钱(每日超过5次挑战要收费)
	money,
	%% UInt16 当前连胜次数
	cur_win,
	%% UInt16 最高连胜次数
	max_win,
	%% UInt32 累积胜利次数
	win_times,
	%% UInt32 发奖剩余秒数
	surplusSec,
	%% UInt32 本次预计可领功勋
	exploitValue
}).

%% 
%% // 按排名挑战对手
-define(CMD_U2GS_ChallengeTargetByRank,42789).
-record(pk_U2GS_ChallengeTargetByRank,{
	%% UInt32 当前排名
	ranksort,
	%% String目标名字
	name
}).

%% 
%% // 按对象挑战对手
-define(CMD_U2GS_ChallengeTargetByRoleID,47690).
-record(pk_U2GS_ChallengeTargetByRoleID,{
	%% UInt64 对手roleID
	roleID
}).

%% 
%% // 刷新对手(返回 GS2U_LadderTargetList)
-define(CMD_U2GS_FreshLadderTargetList,45193).
-record(pk_U2GS_FreshLadderTargetList,{
}).

%% 
%% // 放弃挑战
-define(CMD_U2GS_GiveUpChallenge,39273).
-record(pk_U2GS_GiveUpChallenge,{
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // 打开天梯1v1界面
-define(CMD_U2GS_OpenLadder1v1,51570).
-record(pk_U2GS_OpenLadder1v1,{
}).

%% 
%% // 请求对战记录
-define(CMD_U2GS_RequestBattleNotes,64668).
-record(pk_U2GS_RequestBattleNotes,{
}).

%% 
%% // 请求王者列表
-define(CMD_U2GS_RequestKingList,23086).
-record(pk_U2GS_RequestKingList,{
}).

%% 
%% // 获取对象的模型相关信息(返回rank.h GS2U_SendPropList 这个协议)
-define(CMD_U2GS_RequestPlayerInfo,28940).
-record(pk_U2GS_RequestPlayerInfo,{
	%% UInt64 roleID
	roleID
}).

%% 
%% // 膜拜王者
-define(CMD_U2GS_WorshipTarget,15929).
-record(pk_U2GS_WorshipTarget,{
	%% UInt64 roleID
	roleID,
	%% String
	roleName
}).

-record(pk_BagSlot,{
	%% Byte最大格子数
	max,
	%% Byte已开启格子数
	used
}).

%% 
%% // 自己删除别人印象
-define(CMD_DelImpression,51952).
-record(pk_DelImpression,{
	%% UInt16
	uid
}).

%% 
%% // 删除标签
-define(CMD_DelTag,42903).
-record(pk_DelTag,{
	%% Byte
	index
}).

-record(pk_EquipEnhancedProp,{
	%% Byte属性标识主键  对应propType 如propType = 1时，propKey为属性ID
	propKey,
	%% Single属性值  对应propKey 有符号整数 可以为正负数
	propValue
}).

-record(pk_EquipItemInfo,{
	%% UInt32物品ID
	itemID,
	%% UInt64物品UID
	itemUID,
	%% UInt16重铸次数
	recastNum,
	%% Byte品质  0 白色装备 1绿色装备 2蓝色装备 3紫色装备 4橙色装备 5红色装备
	quality,
	%% Boolean是否绑定
	isBind,
	%% Boolean是否锁定
	isLocked,
	%% UInt32过期时间
	expiredTime,
	%% EquipPropInfo装备属性列表
	equipProps
}).

-record(pk_EquipPropInfo,{
	%% Byte装备属性类型  1:基础属性, 2:附加属性(未重铸)  3:附加属性(不可重铸) 4.附加属性(已重铸) 
	propType,
	%% Byte属性标识主键  对应propType 如propType = 1时，propKey为属性ID
	propKey,
	%% UInt16属性词缀
	propAffix,
	%% Boolean属性计算类型  false加法  true乘法
	calcType,
	%% Single属性值
	propValue
}).

-record(pk_EquipRefineLevel,{
	%% Byte装备部位
	type,
	%% Byte精炼等级
	level
}).

-record(pk_EquipStarLevel,{
	%% Byte装备部位
	type,
	%% Byte升星等级
	level
}).

-record(pk_EquipUpStarInfo,{
	%% Byte装备部位
	pos,
	%% Byte星星等级
	level,
	%% Byte部位冲星进度
	prog,
	%% UInt16部位冲星祝福值
	bless
}).

-record(pk_ExchangeResource,{
	%% UInt32兑换列表ID
	id,
	%% Byte组ID
	groupID,
	%% UInt32道具ID
	itemID,
	%% PayItemOfExchange支付物品
	payItem,
	%% Byte需要玩家级别
	playerLevel,
	%% UInt16兑换上限
	limit
}).

%% 
%% //增加装备
-define(CMD_GS2U_AddEquipItemToBag,22995).
-record(pk_GS2U_AddEquipItemToBag,{
	%% Byte背包类型
	type,
	%% UInt64怪物Code
	code,
	%% EquipItemInfo增加装备的具体信息
	items
}).

%% 
%% // 给其他玩家添加印象结果
-define(CMD_GS2U_AddImpressionResult,21079).
-record(pk_GS2U_AddImpressionResult,{
	%% Boolean
	result
}).

%% 
%% //增加道具
-define(CMD_GS2U_AddNormalItemToBag,26330).
-record(pk_GS2U_AddNormalItemToBag,{
	%% Byte背包类型
	type,
	%% UInt64怪物Code
	code,
	%% UInt32实际增加数量
	addNum,
	%% NormalItemInfo增加道具的具体信息
	items
}).

%% 
%% // 点赞其他玩家成功
-define(CMD_GS2U_AddPraise,3297).
-record(pk_GS2U_AddPraise,{
}).

%% 
%% // 加标签结果
-define(CMD_GS2U_AddTagResult,1210).
-record(pk_GS2U_AddTagResult,{
	%% Boolean
	result
}).

%% 
%% // 删除物品
-define(CMD_GS2U_DeleteGoods,3911).
-record(pk_GS2U_DeleteGoods,{
	%% Byte背包类型
	type,
	%% UInt64物品UID列表
	goodsUIDs
}).

%% 
%% //强化计算
-define(CMD_GS2U_EquipEnhancedProp,29649).
-record(pk_GS2U_EquipEnhancedProp,{
	%% UInt64装备UID
	equipUID,
	%% EquipEnhancedProp强化后基础属性
	enProps,
	%% UInt32强化费用
	price
}).

%% 
%% // 更新一个装备位的重铸属性
-define(CMD_GS2U_EquipRecastInfo,6004).
-record(pk_GS2U_EquipRecastInfo,{
	%% RecastPosInfo
	recastInfo
}).

%% 
%% // 重铸初始化,上线时初始化
-define(CMD_GS2U_EquipRecastInfoInit,60660).
-record(pk_GS2U_EquipRecastInfoInit,{
	%% RecastPosInfo
	recastInfoList
}).

%% 
%% //装备重铸结果
-define(CMD_GS2U_EquipRecastProp,27661).
-record(pk_GS2U_EquipRecastProp,{
	%% UInt16 重铸部位
	equipPos,
	%% UInt32	精炼值
	recastVal,
	%% UInt16 1.属性重铸 2.符石重铸
	recastType,
	%% RecastResultInfo 重铸结果
	resultList
}).

%% 
%% //装备部位精炼等级
-define(CMD_GS2U_EquipRefineLevel,3311).
-record(pk_GS2U_EquipRefineLevel,{
	%% EquipRefineLevel
	equipRefines
}).

%% 
%% //装备精炼
-define(CMD_GS2U_EquipRefineResult,15630).
-record(pk_GS2U_EquipRefineResult,{
	%% UInt64
	code,
	%% Byte装备部位
	type,
	%% Byte精炼等级
	level
}).

%% 
-define(CMD_GS2U_EquipRefineResultOneKey,59719).
-record(pk_GS2U_EquipRefineResultOneKey,{
	%% UInt64
	code,
	%% Byte
	levelOld,
	%% Byte
	levelNew,
	%% Byte
	typeList
}).

%% 
%% //初始化装备星级列表
-define(CMD_GS2U_EquipUpStarInfoList,39417).
-record(pk_GS2U_EquipUpStarInfoList,{
	%% EquipUpStarInfo
	equipUpStars
}).

%% 
%% //装备冲星结果
-define(CMD_GS2U_EquipUpStarRes,57099).
-record(pk_GS2U_EquipUpStarRes,{
	%% EquipUpStarInfo
	equipUpStarInfo,
	%% Byte冲星类型0:单次冲星 1:一键冲星
	type,
	%% UInt16冲星次数
	index,
	%% starCostItem
	costList,
	%% UInt32冲星消耗金币
	coin,
	%% Byte冲星结果(0:材料不够,失败1:金币不够,失败2:冲星当前进度成功3:冲星等级成功4:冲星失败)
	res
}).

%% 
%% //兑换成功时发送，失败时发错误码
-define(CMD_GS2U_ExchangeResult,26628).
-record(pk_GS2U_ExchangeResult,{
	%% UInt32ID(兑换列表中的Id编号）
	id,
	%% UInt16兑换物品剩下数量
	itemCount
}).

%% 
%% // 玩家被禁止传照片
-define(CMD_GS2U_Forbidden_Load_Photo,26639).
-record(pk_GS2U_Forbidden_Load_Photo,{
	%% UInt64
	forbiddenTime
}).

%% 
%% // 玩家获得印象
-define(CMD_GS2U_GainImpression,43944).
-record(pk_GS2U_GainImpression,{
	%% ImpressionInfo
	impression
}).

%% 
%% // 玩家获得点赞
-define(CMD_GS2U_GainPraise,26975).
-record(pk_GS2U_GainPraise,{
}).

%% 
%% //宝石增加
-define(CMD_GS2U_GemEmbedAdd,1331).
-record(pk_GS2U_GemEmbedAdd,{
	%% GemEmbedInfo宝石信息
	gemEmbedInfo
}).

%% 
%% //宝石卸载结果
-define(CMD_GS2U_GemEmbedDelete,29137).
-record(pk_GS2U_GemEmbedDelete,{
	%% UInt64宝石UID
	gemUIDs
}).

%% 
%% //宝石镶嵌背包初始
-define(CMD_GS2U_GemEmbedInit,43498).
-record(pk_GS2U_GemEmbedInit,{
	%% GemEmbedInfo宝石镶嵌数据全量初始化
	gemEmbedInfos
}).

%% 
%% //宝石合成结果
-define(CMD_GS2U_GemEmbedMakeResult,6557).
-record(pk_GS2U_GemEmbedMakeResult,{
	%% UInt64宝石UID
	gemUID
}).

%% 
%% //分解装备返回得到的精华总数
-define(CMD_GS2U_GetEssenceNum,34792).
-record(pk_GS2U_GetEssenceNum,{
	%% UInt32
	purpleEssence,
	%% UInt32
	goldenEssence
}).

%% 
%% //初始化装备
-define(CMD_GS2U_InitEquip,56720).
-record(pk_GS2U_InitEquip,{
	%% Byte背包类型
	type,
	%% EquipItemInfo整理后的装备信息
	items
}).

%% 
%% //初始化普通道具
-define(CMD_GS2U_InitItem,33727).
-record(pk_GS2U_InitItem,{
	%% Byte背包类型
	type,
	%% NormalItemInfo整理后的道具信息
	items
}).

%% 
-define(CMD_GS2U_InitRecycle,20967).
-record(pk_GS2U_InitRecycle,{
	%% RecycleItem
	items,
	%% RecycleEquip
	equips
}).

%% 
%% //初始化背包和仓库的格子
-define(CMD_GS2U_InitSlot,21902).
-record(pk_GS2U_InitSlot,{
	%% BagSlot列表的顺序:普通背包、普通仓库 、装备背包、装备仓库、回收站、玩家身上的装备背包、宝石背包、宝石仓库、镶嵌宝石背包
	slots
}).

%% 
%% // 锁定物品的返回消息
-define(CMD_GS2U_LockGoods,39307).
-record(pk_GS2U_LockGoods,{
	%% UInt64
	goodsUID,
	%% Byte 背包类型
	bagType,
	%% Boolean true为锁定，false为非锁定
	isLocked
}).

%% 
%% //远程玩家信息查看结果
-define(CMD_GS2U_LookRPInfo_Result,3869).
-record(pk_GS2U_LookRPInfo_Result,{
	%% UInt64角色ID
	roleID,
	%% UInt32角色职业
	career,
	%% SByte 种族
	race,
	%% SByte 性别
	sex,
	%% UInt32
	head,
	%% Byte玩家等级
	level,
	%% UInt32玩家战斗力
	roleForce,
	%% Byte荣誉装备等级
	equipHonorLevel,
	%% Byte1:觉醒  2:宝石  3:坐骑
	activePart,
	%% String公会名
	guildName,
	%% Byte玩家公会职位
	guileLevel,
	%% Int16爵位等级
	vipLevel,
	%% Int32玩家杀戮值	
	playerKillValue,
	%% Int32翅膀等级
	wingLevel,
	%% Int32跨服竞技场积分
	arenaVal,
	%% UInt32玩家称号列表
	titleList,
	%% Single战斗属性列表
	propValues,
	%% EquipItemInfo装备信息
	equips,
	%% LookGemInfo宝石信息
	gemInfo,
	%% UInt32穿在身上的时装
	fashionList,
	%% LookWakeInfo觉醒信息
	wakeInfo,
	%% LookGodWeaponInfo神器信息
	weaponInfo,
	%% LookPetInfo查看宠物信息
	petInfo,
	%% EquipRefineLevel玩家部位强化等级
	equipRefines,
	%% EquipStarLevel玩家装备升星等级
	equipStar,
	%% PlayerPersonalityInfo玩家个性信息
	personalityInfo
}).

%% 
%% // 保存玩家扩展信息成功
-define(CMD_GS2U_PlayerExtenInfo,807).
-record(pk_GS2U_PlayerExtenInfo,{
	%% Byte信息类型1:生日;2:地址;3:星座;4:签名
	type
}).

%% 
%% //查看装备的结果
-define(CMD_GS2U_QueryEquipResult,38681).
-record(pk_GS2U_QueryEquipResult,{
	%% EquipItemInfo装备详细信息
	equipInfo
}).

%% 
%% //查看普通道具的结果
-define(CMD_GS2U_QueryItemResult,63112).
-record(pk_GS2U_QueryItemResult,{
	%% NormalItemInfo道具详细信息
	itemInfo
}).

%% 
%% // 举报其他玩家成功
-define(CMD_GS2U_Report,7316).
-record(pk_GS2U_Report,{
}).

%% 
%% // 举报次数到上限
-define(CMD_GS2U_Report_Max,41093).
-record(pk_GS2U_Report_Max,{
}).

%% 
-define(CMD_GS2U_RequesBuyIDAck,60777).
-record(pk_GS2U_RequesBuyIDAck,{
	%% Byte
	type,
	%% UInt32
	id,
	%% Boolean是否成功
	succ
}).

%% 
-define(CMD_GS2U_RequestExchangeResourceForeverLimitIDAck,27150).
-record(pk_GS2U_RequestExchangeResourceForeverLimitIDAck,{
	%% UInt16资源配置id列表
	iDList
}).

%% 
-define(CMD_GS2U_RequestForeverLimitIDAck,2011).
-record(pk_GS2U_RequestForeverLimitIDAck,{
	%% Byte
	type,
	%% UInt16资源配置id列表
	iDList
}).

%% 
%% //初始化资源兑换列表
-define(CMD_GS2U_ResourceExchangeList,42259).
-record(pk_GS2U_ResourceExchangeList,{
	%% ExchangeResource资源列表
	resources
}).

%% 
-define(CMD_GS2U_SendPlayerPersonalityInfo,7267).
-record(pk_GS2U_SendPlayerPersonalityInfo,{
	%% Byte类型
	type,
	%% UInt32赞数量
	praiseNum,
	%% String生日
	birthday,
	%% String地址
	location,
	%% String星座
	starSign,
	%% String签名
	sign,
	%% String标签
	tags,
	%% ImpressionInfo印象信息
	impressions,
	%% UInt64被禁止传照片的时间，没被禁传0
	forbiddenTime
}).

%% 
%% // 上传照片结果
-define(CMD_GS2U_UpLoadingPhotoResult,3498).
-record(pk_GS2U_UpLoadingPhotoResult,{
	%% Boolean
	result
}).

%% 
%% //更新装备
-define(CMD_GS2U_UpdateEquipItem,24074).
-record(pk_GS2U_UpdateEquipItem,{
	%% Byte背包类型
	type,
	%% Byte1:强化2:重铸3:附魔
	operate,
	%% EquipItemInfo整理后的物品信息
	items
}).

%% 
%% //更新普通道具
-define(CMD_GS2U_UpdateNormalItem,11295).
-record(pk_GS2U_UpdateNormalItem,{
	%% Byte背包类型
	type,
	%% NormalItemInfo整理后的物品信息
	items
}).

-record(pk_GemEmbedInfo,{
	%% UInt64宝石UID
	gemUID,
	%% Byte宝石镶嵌部位编号
	slot
}).

-record(pk_ImpressionInfo,{
	%% UInt16编号
	uid,
	%% UInt64评价的朋友ID
	friendID,
	%% UInt32以分钟为单位
	time,
	%% String印象
	impression
}).

-record(pk_LookGemInfo,{
	%% UInt16宝石ID
	gemID,
	%% Byte宝石孔位
	slot
}).

-record(pk_LookGodWeaponInfo,{
	%% Byte神器ID
	weaponID,
	%% UInt16神器等级
	weaponLevel,
	%% UInt16神器技能等级
	skillLevel
}).

-record(pk_LookPetEquipInfo,{
	%% Byte宠物装备ID
	equipID,
	%% Byte宠物装备等级
	equipLv
}).

-record(pk_LookPetInfo,{
	%% UInt16宠物ID
	petID,
	%% Byte宠物星阶
	petStar,
	%% String宠物名字
	petname,
	%% UInt32宠物战斗力
	petForce,
	%% UInt16宠物收集数
	petColNum,
	%% Byte宠物转生
	petRaw,
	%% LookPetSkill宠物技能
	petSkill,
	%% LookPetEquipInfo宠物装备
	equalInfo,
	%% Single宠物战斗属性
	petPropValues
}).

-record(pk_LookPetSkill,{
	%% UInt16宠物技能ID
	petSkillId,
	%% Byte宠物技能等级
	petSkillLv,
	%% Byte宠物技能Type 0:天赋技能 1:通用技能 2:基础技能
	petSkillType
}).

-record(pk_LookWakeInfo,{
	%% Byte女神卡片ID
	cardID,
	%% Byte觉醒等级
	level
}).

%% 
%% //移动物品
-define(CMD_MoveGoods,645).
-record(pk_MoveGoods,{
	%% UInt64
	itemUID,
	%% Byte
	source,
	%% Bytesource target 取值 0:普通背包 1:普通仓库  2： 装备背包  3：装备仓库  4：回收站 5:玩家身上的装备背包 6:宝石背包 7：宝石仓库 8：镶嵌宝石背包
	target
}).

-record(pk_NormalItemInfo,{
	%% UInt32物品ID
	itemID,
	%% UInt64物品UID
	itemUID,
	%% UInt16物品数量
	itemSum,
	%% Boolean是否绑定
	isBind,
	%% Boolean是否锁定
	isLocked,
	%% UInt32过期时间
	expiredTime
}).

%% 
%% //开启空格子
-define(CMD_OpenNewBagSlot,22696).
-record(pk_OpenNewBagSlot,{
	%% Byte 背包类型
	bagType,
	%% Byte 开启数量
	openNum
}).

-record(pk_PayItemOfExchange,{
	%% Int32-1:使用紫色精华;-2:使用金色精华,正数为item表中的物品id
	item,
	%% UInt16数量
	number
}).

-record(pk_PlayerPersonalityInfo,{
	%% UInt32赞数量
	praiseNum,
	%% String生日
	birthday,
	%% String地址
	location,
	%% String星座
	starSign,
	%% String签名
	sign,
	%% String标签
	tags,
	%% ImpressionInfo印象信息
	impressions
}).

-record(pk_RecastPosInfo,{
	%% UInt16 重铸部位
	equipPos,
	%% UInt32	精炼值
	recastVal,
	%% RecastPropInfo 属性重铸
	recastInfo,
	%% RecastPropInfo 符石重铸
	recastInfo_ext
}).

-record(pk_RecastPropInfo,{
	%% UInt16第几条属性
	pos,
	%% UInt32属性id
	propIndex,
	%% UInt32属性值
	propValue,
	%% UInt32最大值（可以忽略）
	propValMax
}).

-record(pk_RecastResultInfo,{
	%% UInt16第几条属性
	pos,
	%% UInt32实行索引
	propIndex,
	%% Int32值
	value
}).

-record(pk_RecycleEquip,{
	%% Byte
	slot,
	%% EquipItemInfo
	equip
}).

-record(pk_RecycleItem,{
	%% Byte
	slot,
	%% NormalItemInfo
	item
}).

%% 
%% // 给其他玩家添加印象
-define(CMD_U2GS_AddImpression,34496).
-record(pk_U2GS_AddImpression,{
	%% UInt64角色ID
	roleID,
	%% String添加印象
	impression
}).

%% 
%% // 点赞其他玩家
-define(CMD_U2GS_AddPraise,48887).
-record(pk_U2GS_AddPraise,{
	%% UInt64角色ID
	roleID
}).

%% 
%% // 加标签
-define(CMD_U2GS_AddTag,48135).
-record(pk_U2GS_AddTag,{
	%% String标签
	tag
}).

%% 
%% //装备强化
-define(CMD_U2GS_EquipEnhanced,9940).
-record(pk_U2GS_EquipEnhanced,{
	%% Byte1：强化计算(属性值,以及费用) 2：确认强化
	type,
	%% UInt64装备UID
	equipUID
}).

%% 
%% //装备重铸
-define(CMD_U2GS_EquipRecast,29280).
-record(pk_U2GS_EquipRecast,{
	%% UInt16 重铸部位
	equipPos,
	%% UInt16 1.属性重铸 2.符石重铸
	recastType,
	%% UInt16 1.重铸， 2.保存
	opType,
	%% UInt16 属性重铸:空，符石重铸:重铸时锁定条目；保存时为空
	locklist
}).

%% 
%% //装备精炼
-define(CMD_U2GS_EquipRefine,5183).
-record(pk_U2GS_EquipRefine,{
	%% Byte装备部位类型
	type
}).

%% 
%% //装备一键精炼
-define(CMD_U2GS_EquipRefineOneKey,1328).
-record(pk_U2GS_EquipRefineOneKey,{
}).

%% 
%% //装备分解
-define(CMD_U2GS_EquipResolve,50942).
-record(pk_U2GS_EquipResolve,{
	%% UInt64要分解装备的UID
	equipUIDs
}).

%% 
%% //装备冲星
-define(CMD_U2GS_EquipUpStar,32827).
-record(pk_U2GS_EquipUpStar,{
	%% Byte装备部位
	pos,
	%% Byte0:单次冲星 1:一键冲星
	type
}).

%% 
%% //宝石合成
-define(CMD_U2GS_GemEmbedMake,36466).
-record(pk_U2GS_GemEmbedMake,{
	%% UInt32 宝石ID
	id,
	%% UInt32 合成个数
	count,
	%% Byte 是否只消耗非绑定钻石来合成非绑定宝石
	flag
}).

%% 
%% //宝石合成
-define(CMD_U2GS_GemEmbedMakeOnce,9407).
-record(pk_U2GS_GemEmbedMakeOnce,{
	%% UInt32 宝石ID
	id,
	%% UInt32 绑定宝石个数
	bindCount,
	%% UInt32 非绑定宝石个数
	unBindCount
}).

%% 
%% //宝石拆卸
-define(CMD_U2GS_GemEmbedOff,8935).
-record(pk_U2GS_GemEmbedOff,{
	%% UInt64宝石UID
	gemUIDs
}).

%% 
%% //宝石镶嵌
-define(CMD_U2GS_GemEmbedOn,18955).
-record(pk_U2GS_GemEmbedOn,{
	%% GemEmbedInfo要镶嵌的宝石数据
	gemEmbedInfoList
}).

%% 
%% //成长装备(荣誉等级)
-define(CMD_U2GS_HonorLevel,45460).
-record(pk_U2GS_HonorLevel,{
}).

%% 
%% //锁定物品
-define(CMD_U2GS_LockGoods,19361).
-record(pk_U2GS_LockGoods,{
	%% UInt64
	goodsUID,
	%% Byte 背包类型
	bagType
}).

%% 
%% //远程玩家信息查看请求
-define(CMD_U2GS_LookRPInfo_Request,11113).
-record(pk_U2GS_LookRPInfo_Request,{
	%% UInt64角色ID
	roleID
}).

%% 
%% //玩家扩展信息
-define(CMD_U2GS_PlayerExtenInfo,46605).
-record(pk_U2GS_PlayerExtenInfo,{
	%% Byte信息类型1:生日;2:地址;3:星座;4:签名
	type,
	%% String信息
	info
}).

%% 
%% //查看装备信息
-define(CMD_U2GS_QueryEquipByUID,49287).
-record(pk_U2GS_QueryEquipByUID,{
	%% UInt64 来源UID
	roleID,
	%% UInt64 装备UID
	equipUID
}).

%% 
%% // 举报其他玩家
-define(CMD_U2GS_Report,20182).
-record(pk_U2GS_Report,{
	%% UInt64角色ID
	roleID
}).

%% 
%% //购买某个配置id中的物品
-define(CMD_U2GS_RequesBuyID,35814).
-record(pk_U2GS_RequesBuyID,{
	%% Byte
	type,
	%% UInt32
	id
}).

%% 
%% //请求限制标志的配置id
-define(CMD_U2GS_RequesForeverLimitID,36018).
-record(pk_U2GS_RequesForeverLimitID,{
	%% Byte
	type
}).

%% 
%% //玩家第一次请求可以兑换的资源，只请求一次，客户端缓存
-define(CMD_U2GS_RequestExchangeResource,65142).
-record(pk_U2GS_RequestExchangeResource,{
}).

%% 
%% //请求资源交换中，玩家已经兑换过的终身限兑的配置id
-define(CMD_U2GS_RequestExchangeResourceForeverLimitID,37637).
-record(pk_U2GS_RequestExchangeResourceForeverLimitID,{
}).

%% 
%% //资源兑换，只限于装备分解得到的精华值来兑换物品
-define(CMD_U2GS_ResourceExchange,39883).
-record(pk_U2GS_ResourceExchange,{
	%% UInt32ID(兑换列表中的Id编号）
	id,
	%% UInt16兑换物品数量
	itemCount,
	%% UInt160为原来的，找回1
	opType
}).

%% 
%% //一键出售装备
-define(CMD_U2GS_SellAllEquip,727).
-record(pk_U2GS_SellAllEquip,{
}).

%% 
%% //插入共享装备,支持批量
-define(CMD_U2GS_SharedEquip,63085).
-record(pk_U2GS_SharedEquip,{
	%% UInt64装备UID
	equipUIDs
}).

%% 
%% //移动物品只能在相应的背包和仓库之间移动，0<=>1, 2<=>3, 0<=>4, 2<=>4, 2<=5
%% //整理物品
-define(CMD_U2GS_SortItem,52715).
-record(pk_U2GS_SortItem,{
	%% Byte背包类型
	type
}).

%% 
%% //使用物品
-define(CMD_U2GS_UseItem,48980).
-record(pk_U2GS_UseItem,{
	%% UInt64物品UID
	itemUID,
	%% UInt16本次使用个数
	useNum
}).

%% 
%% // U2GS上传玩家照片,GS2U初始化玩家照片（约定最大是1w个byte，每个消息里m_data最大是3500个byte)
-define(CMD_UpLoadingPhoto,34013).
-record(pk_UpLoadingPhoto,{
	%% Byte类型
	type,
	%% UInt64发给的玩家ID
	roleID,
	%% Byte总段数
	sectionNum,
	%% Byte段的编号
	sectionIndex,
	%% Byte照片数据
	data
}).

-record(pk_starCostItem,{
	%% UInt16冲星消耗材料ID
	itemID,
	%% UInt16冲星消耗材料数量	
	itemNum
}).

-record(pk_AttackResultList,{
	%% Byte1:击中回血 2:反弹伤害
	type,
	%% UInt32
	value
}).

-record(pk_BeAttack,{
	%% Byte
	camp,
	%% Byte
	pos,
	%% Int32
	hp
}).

%% 
-define(CMD_C2S_PlayerUseShiftSkill,36467).
-record(pk_C2S_PlayerUseShiftSkill,{
	%% UInt64
	code,
	%% UInt32
	skillId,
	%% UInt32
	serial,
	%% UInt64
	targetCodeList,
	%% Single
	x,
	%% Single
	y
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
-define(CMD_C2S_PlayerUseSkill,38338).
-record(pk_C2S_PlayerUseSkill,{
	%% UInt64
	code,
	%% UInt64
	skillId,
	%% UInt32
	serial,
	%% UInt64
	targetCodeList
}).

%% 
%% //攻击结果技能效果(位移相关效果)
-define(CMD_GS2U_AttackOffsetEffect,10740).
-record(pk_GS2U_AttackOffsetEffect,{
	%% UInt64
	userCode,
	%% UInt64
	targetCode,
	%% UInt32
	skillId,
	%% UInt32
	serial,
	%% UInt64
	code,
	%% Single
	x,
	%% Single
	y
}).

%% 
%% //攻击结果消息
-define(CMD_GS2U_AttackResult,17141).
-record(pk_GS2U_AttackResult,{
	%% UInt64
	userCode,
	%% UInt64
	targetCode,
	%% UInt32
	skillId,
	%% UInt32
	serial,
	%% UInt32
	result,
	%% Byte
	bhp_per,
	%% Byte
	ahp_per,
	%% Int32
	diffHp,
	%% Int32
	damageHp,
	%% AttackResultList
	arList
}).

%% 
%% // 通知某怪物的攻击速度
-define(CMD_GS2U_AttackSpeed,18191).
-record(pk_GS2U_AttackSpeed,{
	%% UInt64怪物的流水号
	code,
	%% Single怪物的攻击速度
	speed
}).

%% 
%% // 通知客服端XX请求切磋
-define(CMD_GS2U_BattleLearnRequest,17503).
-record(pk_GS2U_BattleLearnRequest,{
	%% UInt64请求切磋玩家Code
	code,
	%% String请求切磋玩家名称
	name
}).

%% 
%% // 通知客服端切磋结果
-define(CMD_GS2U_BattleLearnResult,26661).
-record(pk_GS2U_BattleLearnResult,{
	%% UInt64请求切磋玩家Code
	code,
	%% UInt64接受请求切磋玩家Code
	targetCode,
	%% String请求切磋玩家名称
	name,
	%% String接受请求切磋玩家名称
	targetName,
	%% Byte0:失败 1:胜利 2:平局
	result
}).

%% 
%% // 中断使用技能
-define(CMD_GS2U_BreakSkill,51286).
-record(pk_GS2U_BreakSkill,{
	%% UInt64
	userCode,
	%% UInt32
	skillId,
	%% UInt32
	serial
}).

%% 
%% // buff调用技能
-define(CMD_GS2U_CallSkill,20695).
-record(pk_GS2U_CallSkill,{
	%% UInt64
	userCode,
	%% UInt32
	skillId
}).

%% 
%% // 载体使用技能
-define(CMD_GS2U_CarrierUseSkillToObject,8568).
-record(pk_GS2U_CarrierUseSkillToObject,{
	%% UInt64
	userCode,
	%% UInt32
	skillId,
	%% UInt32
	serial,
	%% UInt64
	targetCodeList,
	%% UInt32
	time
}).

%% 
%% //	对象死亡消息
-define(CMD_GS2U_Dead,24104).
-record(pk_GS2U_Dead,{
	%% UInt64
	deadActorCode,
	%% UInt64
	killerCode,
	%% String
	killerName,
	%% UInt32
	skillID
}).

%% 
-define(CMD_GS2U_DeadToTeam,14332).
-record(pk_GS2U_DeadToTeam,{
	%% UInt64
	roleID,
	%% UInt64
	killerCode,
	%% String
	killerName
}).

%% 
%% //	强制对象立即死亡消息
-define(CMD_GS2U_ForceDeadNow,52551).
-record(pk_GS2U_ForceDeadNow,{
	%% UInt64
	deadActorCode,
	%% UInt64
	killerCode,
	%% String
	killerName,
	%% UInt32
	skillID
}).

%% 
%% // 通知客服端是否触发倒计时
-define(CMD_GS2U_IsTriggerCountDown,36963).
-record(pk_GS2U_IsTriggerCountDown,{
	%% Byte0:begin 1:end
	flag,
	%% Byte0:结束倒计时 1:触发倒计时
	isTrigger
}).

%% 
%% // 通知某怪物的速度状态
-define(CMD_GS2U_MonsterSpeed,37689).
-record(pk_GS2U_MonsterSpeed,{
	%% UInt64怪物的流水号
	code,
	%% Single怪物的移动速度
	speed,
	%% Byte怪物的状态：走为0，跑为1
	moveStatus
}).

%% 
%% //战斗结束包
-define(CMD_GS2U_ResponseBattleAck,47484).
-record(pk_GS2U_ResponseBattleAck,{
}).

%% 
%% // 服务器响应玩家请求转换PK状态
-define(CMD_GS2U_ResponseChangePKMode,31391).
-record(pk_GS2U_ResponseChangePKMode,{
	%% UInt64 收到服务器响应转换PK模式的玩家
	code,
	%% Int32 收到服务器响应的PK模式 -1为错误信息
	pkMode
}).

%% 
%% // 触发技能
-define(CMD_GS2U_TriggerSkill,34737).
-record(pk_GS2U_TriggerSkill,{
	%% UInt64
	userCode,
	%% UInt32
	skillId,
	%% UInt64
	targetCode
}).

%% 
-define(CMD_GS2U_TrunBattleInitList,20153).
-record(pk_GS2U_TrunBattleInitList,{
	%% TurnBattleInit
	il
}).

%% 
-define(CMD_GS2U_TrunBattleResultList,28414).
-record(pk_GS2U_TrunBattleResultList,{
	%% TrunBattleResult
	rl
}).

%% 
%% // 向对象使用技能
-define(CMD_GS2U_UseSkillToObject,48800).
-record(pk_GS2U_UseSkillToObject,{
	%% UInt64
	userCode,
	%% UInt32
	skillId,
	%% UInt32
	serial,
	%% UInt64
	targetCodeList,
	%% UInt32
	time
}).

%% 
%% // 向对象使用技能
-define(CMD_GS2U_UseSkillToPos,29375).
-record(pk_GS2U_UseSkillToPos,{
	%% UInt64
	userCode,
	%% UInt32
	skillId,
	%% UInt32
	serial,
	%% UInt64
	targetCodeList,
	%% Single
	x,
	%% Single
	y
}).

-record(pk_TrunBattleResult,{
	%% Byte
	camp,
	%% Byte攻击者位置
	pos,
	%% UInt16攻击者技能ID
	id,
	%% Byte攻击回合数
	turn,
	%% BeAttack被攻击者列表	 
	bl
}).

-record(pk_TurnBattleInit,{
	%% UInt64战斗角色ID
	id,
	%% Byte战斗角色类型(0:人物,1:宠物,2:怪物)
	type,
	%% Byte战斗阵营(1:友方,左边, 0:敌方,右边)
	camp,
	%% Byte战斗位置(1-6)
	pos,
	%% UInt32战斗血量最大值
	hp
}).

%% 
%% //玩家切磋相关协议
%% // 发送切磋请求
-define(CMD_U2GS_BattleLearn,48142).
-record(pk_U2GS_BattleLearn,{
	%% UInt64切磋对象
	code
}).

%% 
%% // 反馈切磋请求结果
-define(CMD_U2GS_BattleLearnAck,18083).
-record(pk_U2GS_BattleLearnAck,{
	%% UInt64发送切磋请求对象
	code,
	%% Byte0:拒绝 1：接受
	result
}).

%% 
%% //战斗请求发包
-define(CMD_U2GS_RequestBattleAck,64584).
-record(pk_U2GS_RequestBattleAck,{
	%% Byte包数量
	num
}).

%% 
%% //客服端请求结束战斗(发送结算)
-define(CMD_U2GS_RequestBattleEnd,30974).
-record(pk_U2GS_RequestBattleEnd,{
	%% Byte0:pve 1:pvp
	type
}).

%% 
%% // 玩家请求转换PK状态
-define(CMD_U2GS_RequestChangePKMode,55523).
-record(pk_U2GS_RequestChangePKMode,{
	%% Int32 请求要转换的PK模式
	pkMode
}).

%% 
-define(CMD_GS2U_BuffHurt,62410).
-record(pk_GS2U_BuffHurt,{
	%% UInt64目标Code
	code,
	%% UInt64Buff唯一标识符
	buffUID,
	%% UInt32BuffID
	buffID,
	%% Int32Buff伤害血量
	damageHp,
	%% Byte当前血量百分比
	hp_per
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
-define(CMD_GS2U_BuffInfo,43249).
-record(pk_GS2U_BuffInfo,{
	%% UInt64目标Code
	code,
	%% UInt64Buff唯一标识符
	buffUID,
	%% UInt32BuffID
	buffID,
	%% UInt32技能ID
	skillID,
	%% UInt32等级
	level,
	%% Byte标记字段 flag = 0 增加 flag = 1 删除 flgo = 2 替换
	flag,
	%% UInt32序列号
	serial
}).

%% 
-define(CMD_U2GS_DelBuff,58064).
-record(pk_U2GS_DelBuff,{
	%% UInt64目标Code
	code,
	%% UInt32BuffID
	buffID
}).

-record(pk_CompanionMember,{
	%% UInt64 角色唯一ID
	roleid,
	%% String 姓名
	name,
	%% UInt16 等级
	lvl,
	%% Byte 关系，0目标，1自己，9队长
	relation,
	%% UInt32 今日当前活跃
	cur_lively,
	%% UInt32 今日最大活跃
	max_lively,
	%% UInt32 本周累计活跃
	all_lively,
	%% UInt64 离线时间（秒），为0表示在线
	offlinetime,
	%% Boolean是否达到在线时长
	onlineTimeEnough,
	%% Byte姿势
	styleID,
	%% UInt16所在地图id
	mapID,
	%% UInt32职业
	career,
	%% Byte种族
	race,
	%% Byte性别
	sex,
	%% UInt32
	head
}).

%% 
%% // 邀请灵魂到这身边（我广播给我的伙伴）
-define(CMD_GS2U_InviteFriendToMe,31926).
-record(pk_GS2U_InviteFriendToMe,{
	%% UInt64 传送到目标的roleid
	inviteRoleID,
	%% String邀请者name
	inviteName,
	%% UInt32
	mapID,
	%% Single
	x,
	%% Single
	y
}).

%% 
%% // 接收到某灵魂队长的邀请
-define(CMD_GS2U_RecvInviteFriend,21357).
-record(pk_GS2U_RecvInviteFriend,{
	%% String 邀请者的姓名
	name,
	%% UInt64 邀请者的灵魂团队唯一ID
	companionID
}).

%% 
%% // 返回灵魂成员信息
-define(CMD_GS2U_RequestCompanion,17921).
-record(pk_GS2U_RequestCompanion,{
	%% CompanionMember 成员列表（为空则表示该玩家还没有灵魂伙伴团队）
	members,
	%% UInt16 最大成员数量
	max_member,
	%% UInt16增益效果等级
	profileLevel
}).

%% 
%% // 请求传到角色身边
-define(CMD_GS2U_ToTargetFriendAck,28279).
-record(pk_GS2U_ToTargetFriendAck,{
	%% UInt32
	mapID,
	%% Single
	x,
	%% Single
	y
}).

%% 
%% // 处理被邀请的消息
-define(CMD_U2GS_AgreeInvite,27243).
-record(pk_U2GS_AgreeInvite,{
	%% UInt64 邀请者的灵魂团队唯一ID
	companionID,
	%% Boolean 是否同意，true同意，false拒绝
	isAgree
}).

%% 
%% // 切换姿势
-define(CMD_U2GS_ChangePoseID,43114).
-record(pk_U2GS_ChangePoseID,{
	%% UInt16姿势id
	poseID
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // 请求创建灵魂队伍
-define(CMD_U2GS_CreateCompanion,3702).
-record(pk_U2GS_CreateCompanion,{
}).

%% 
%% // 退出或解散灵魂伙伴（成员为退出，队长为解散）
-define(CMD_U2GS_ExitCompanion,65476).
-record(pk_U2GS_ExitCompanion,{
}).

%% 
%% // 邀请在线好友进入我的灵魂团队（邀请成功，会重新发一遍所有灵魂成员信息给你）
-define(CMD_U2GS_InviteFriend,8261).
-record(pk_U2GS_InviteFriend,{
	%% UInt64 邀请目标的roleid
	target_roleid
}).

%% 
%% //邀请灵魂到我身边
-define(CMD_U2GS_InviteToMe,9254).
-record(pk_U2GS_InviteToMe,{
}).

%% 
%% // 驱逐伙伴（驱逐成功，会重新发一遍所有灵魂成员信息给你）
-define(CMD_U2GS_KickCompanion,1636).
-record(pk_U2GS_KickCompanion,{
	%% UInt64 角色唯一ID
	target_roleid
}).

%% 
%% // 请求灵魂团队信息
-define(CMD_U2GS_RequestCompanion,1747).
-record(pk_U2GS_RequestCompanion,{
}).

%% 
%% // 请求传到角色身边
-define(CMD_U2GS_ToTargetFriend,43532).
-record(pk_U2GS_ToTargetFriend,{
	%% UInt64 传送到目标的roleid
	target_roleid
}).

%% 
%% // 伙伴对我的邀请结果
-define(CMD_U2GS_ToTargetFriendResult,29321).
-record(pk_U2GS_ToTargetFriendResult,{
	%% UInt64 传送到目标的roleid
	inviteRoleID,
	%% Boolean是否赶来
	comming
}).

%% 
%% // 激活军团副本
-define(CMD_ActiveGuildCopy,35198).
-record(pk_ActiveGuildCopy,{
	%% UInt32 激活哪个副本
	mapID
}).

-record(pk_BossRankInfo,{
	%% String 名称
	name,
	%% UInt32 伤害值
	hurt
}).

%% 
%% // BOSS战排行结果
-define(CMD_GS2U_BossBattleRankResult,11166).
-record(pk_GS2U_BossBattleRankResult,{
	%% UInt32 当前排名
	curRankNum,
	%% BossRankInfo
	rankList
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // BOSS战开启或关闭
-define(CMD_GS2U_BossBattleState,34660).
-record(pk_GS2U_BossBattleState,{
	%% Byte 0: 开启 1: 关闭
	flag,
	%% UInt32 地图id
	mapID
}).

%% 
-define(CMD_GS2U_ChapterInfo,14311).
-record(pk_GS2U_ChapterInfo,{
	%% chapterInfo 关卡
	chapter
}).

%% 
%% // 副本剩余时间
-define(CMD_GS2U_CopyMapLeftTime,19024).
-record(pk_GS2U_CopyMapLeftTime,{
	%% UInt16地图ID
	mapID,
	%% UInt32剩余时间(毫秒)
	leftTimeMs
}).

%% 
%% //  播放动画
-define(CMD_GS2U_CopyMapSchedulePlayAnimation,29214).
-record(pk_GS2U_CopyMapSchedulePlayAnimation,{
	%% UInt16地图ID
	mapID,
	%% UInt32进度
	schedule,
	%% UInt32动画ID 
	animationID
}).

%% 
%% //  播放字幕
-define(CMD_GS2U_CopyMapSchedulePlayCharacter,21999).
-record(pk_GS2U_CopyMapSchedulePlayCharacter,{
	%% UInt16地图ID
	mapID,
	%% UInt32进度
	schedule,
	%% UInt32字幕ID列表
	characterIDs
}).

%% 
%% // 特殊关卡
-define(CMD_GS2U_CopySpecialSchedule,62371).
-record(pk_GS2U_CopySpecialSchedule,{
	%% UInt16
	mapID,
	%% UInt16
	schedule,
	%% UInt64
	code
}).

%% 
%% // 军团副本是开启还是关闭的
-define(CMD_GS2U_IsGuildCopyOpen,2956).
-record(pk_GS2U_IsGuildCopyOpen,{
	%% Boolean true: 开启，false: 关闭
	flag,
	%% UInt64 军团副本最晚结束时间
	time
}).

%% 
-define(CMD_GS2U_MaterialInfo,30421).
-record(pk_GS2U_MaterialInfo,{
	%% UInt16哪个副本
	mapID,
	%% UInt32结束时间
	leftSeconds,
	%% chapterInfo 关卡
	chapter,
	%% towerInfo 塔的数据	
	towerList
}).

%% 
%% // 金币副本同步信息
-define(CMD_GS2U_MoneyDungeonInfo,44024).
-record(pk_GS2U_MoneyDungeonInfo,{
	%% UInt32 结束时间(秒)
	leftSeconds,
	%% UInt16 最大关卡
	maxChapter,
	%% UInt16 当前关卡（从1开始）
	curChapter,
	%% UInt16 当前关卡的怪物种类
	listMonsterID,
	%% Byte 对应listMonsterID的最大数量
	listMonsterCountMax,
	%% Byte 对应listMonsterID的已杀掉的数量
	listMonsterCountKill,
	%% Byte 当前关卡还有多少怪没刷出来
	curLeftCount
}).

%% 
%% // 同步上一次军团副本结束时间
-define(CMD_GS2U_SendGuildCopyOpenTime,1091).
-record(pk_GS2U_SendGuildCopyOpenTime,{
	%% UInt64 绝对时间
	time
}).

%% 
%% // 灵界活动心跳
-define(CMD_GS2U_SpiritArea_Tick_Sync,4640).
-record(pk_GS2U_SpiritArea_Tick_Sync,{
	%% UInt32 当前状态剩余时间
	time,
	%% UInt32 活动剩余总时间
	timeAll,
	%% Byte 当前波次，为0时表示开始前等待
	wave,
	%% Byte 0波次间隔等待；1波次进行中
	state
}).

%% 
%% // 灵界活动（器灵材料副本、原初灵界）通知客户端调用觉醒技能
%% // 不能服务端直接调用，因为需要客户端额外表现
-define(CMD_GS2U_SpiritArea_Wake_Sync,46157).
-record(pk_GS2U_SpiritArea_Wake_Sync,{
	%% UInt32
	skillID
}).

%% 
-define(CMD_GS2U_TowerInfo,5047).
-record(pk_GS2U_TowerInfo,{
	%% towerInfo
	info
}).

%% 
%% // 副本进度之对话进度（show2）
%% // 客户端在对话完成后主动请求完成进度
%% // 服务端在收到客户端请求验证通过后，或者已存在的show2事件超时后，对地图内所有玩家推送该消息
-define(CMD_U2GS2U_CopyMapScheduleShow2,12790).
-record(pk_U2GS2U_CopyMapScheduleShow2,{
	%% UInt16 所在地图ID
	mapID,
	%% UInt16 对应show2ID
	show2ID,
	%% UInt64 所在分组ID
	groupID,
	%% UInt32 所处进度ID（对应配置copymapScheduleInit.id）
	scheduleID
}).

%% 
%% // 动画播放结束
-define(CMD_U2GS_CopyMapSchedulePlayAnimationOver,13404).
-record(pk_U2GS_CopyMapSchedulePlayAnimationOver,{
	%% UInt32动画ID 
	animationID
}).

%% 
%% // 字幕播放结束
-define(CMD_U2GS_CopyMapSchedulePlayCharacterOver,445).
-record(pk_U2GS_CopyMapSchedulePlayCharacterOver,{
	%% UInt32进度
	schedule
}).

%% 
%% // 请求进入BOSS战位面
-define(CMD_U2GS_EnterBossBattle,17919).
-record(pk_U2GS_EnterBossBattle,{
}).

%% 
%% // 进入军团副本
-define(CMD_U2GS_EnterGuildCopy,29950).
-record(pk_U2GS_EnterGuildCopy,{
	%% UInt32 进入哪个副本
	mapID
}).

%% 
%% // 继续循环刷本，队长才有效
-define(CMD_U2GS_GoonCopyMap,38214).
-record(pk_U2GS_GoonCopyMap,{
	%% UInt16
	mapID
}).

%% 
%% // 金币副本放弃游戏请求
-define(CMD_U2GS_MoneyDungeonGiveup,30988).
-record(pk_U2GS_MoneyDungeonGiveup,{
}).

%% 
%% // 金币副本手动刷下一波的请求
-define(CMD_U2GS_MoneyDungeonNext,41847).
-record(pk_U2GS_MoneyDungeonNext,{
}).

%% 
%% // 低级副本扫荡（请求扫荡）
-define(CMD_U2GS_RequestAutoDeal,37044).
-record(pk_U2GS_RequestAutoDeal,{
	%% UInt16 扫哪个副本
	mapID
}).

%% 
%% // 基础信息
-define(CMD_U2GS_RequestMaterialInfo,1890).
-record(pk_U2GS_RequestMaterialInfo,{
	%% UInt16哪个副本
	mapID
}).

%% 
-define(CMD_U2GS_UpTower,33676).
-record(pk_U2GS_UpTower,{
	%% UInt32 ID
	dataID,
	%% UInt32 类型
	type
}).

%% 
-define(CMD_U2GS_startNextChapter,5738).
-record(pk_U2GS_startNextChapter,{
}).

%% 
%% // 同步自己对boss的伤害
-define(CMD_UpdataHurtToBoss,51188).
-record(pk_UpdataHurtToBoss,{
	%% UInt32 伤害值
	hurt
}).

-record(pk_chapterInfo,{
	%% UInt32下一局自动开始时间
	nextChapterSeconds,
	%% UInt16hc
	headCount,
	%% UInt16最大关卡
	maxChapter,
	%% UInt16当前关卡
	curChapter,
	%% UInt16怪物总数
	curChapterMonsterMax,
	%% UInt16怪物击杀数+到达终点的数量
	curChapterMonsterKilled,
	%% UInt16地图怪物总数
	mapMonterMax,
	%% UInt32魔力值
	materialVal
}).

-record(pk_towerInfo,{
	%% UInt32 id
	dataID,
	%% UInt32 类型
	type,
	%% UInt32 等级
	level
}).

-record(pk_FashionInfo,{
	%% UInt32 时装ID
	fashionID,
	%% UInt32 剩余时间 小于等于0：过期 大于0：对应的秒数
	time
}).

%% 
%% // 激活套装列表
-define(CMD_GS2U_ActiveFashionSuitList,27729).
-record(pk_GS2U_ActiveFashionSuitList,{
	%% UInt32 已经激活的套装列表
	activeFashionSuitList
}).

%% 
%% // 返回时装列表
-define(CMD_GS2U_FashionList,27234).
-record(pk_GS2U_FashionList,{
	%% FashionInfo
	datas
}).

%% 
%% // 时装操作结果
-define(CMD_GS2U_FashionResult,58357).
-record(pk_GS2U_FashionResult,{
	%% UInt32 时装ID
	fashionID,
	%% Byte 0: 购买 1：穿戴 2：卸载
	type,
	%% UInt32 0: 失败 非0: 成功 购买成功则为对应的购买时间
	value
}).

%% 
%% // 激活套装
-define(CMD_U2GS_ActiveFashionSuit,1581).
-record(pk_U2GS_ActiveFashionSuit,{
	%% Boolean 0:卸载   非0：穿戴
	flag,
	%% UInt32 激活套装ID
	fashionSuitID
}).

%% 
%% // 购买时装
-define(CMD_U2GS_BuyFashion,46000).
-record(pk_U2GS_BuyFashion,{
	%% UInt32 时装ID
	fashionID,
	%% UInt32 购买时间, 单位：秒
	time,
	%% Byte 是否购买永久标示 0: 非永久 1：永久
	type
}).

%% 
%% // 时装可是标示， 用二进制标示 第一位：衣服 第二位：副手 最后一位：衣服
-define(CMD_U2GS_IsDisplayFashion,13094).
-record(pk_U2GS_IsDisplayFashion,{
	%% SByte 0: 不显示  1：显示
	flag
}).

%% 
%% // 穿卸时装
-define(CMD_U2GS_OperateFashion,26846).
-record(pk_U2GS_OperateFashion,{
	%% UInt32 时装ID
	fashionID,
	%% Boolean 0:卸载   非0：穿戴
	flag
}).

-record(pk_Friend2InfoBase,{
	%% Friend2InfoSimple
	simple,
	%% UInt64 对象唯一码，不在线时为0
	code,
	%% Byte 自定义头像MD5(16byte)
	face,
	%% Byte VIP等级
	vipLv,
	%% String 家族名
	familyName,
	%% UInt64 战力值
	force,
	%% UInt32 达成指定关系的时间
	timeRelation,
	%% UInt32 最后一次在线的时间
	timeLastOnline,
	%% UInt32 最后一次交互的时间
	timeLastInteractive,
	%% UInt32 赞
	like,
	%% Boolean 当日是否向该好友点赞
	isGiveLike,
	%% Boolean 当日该好友是否给我点赞
	isBeGiveLike,
	%% Boolean 是否已婚
	isMarried,
	%% Single 距离
	distance
}).

-record(pk_Friend2InfoFormal,{
	%% Friend2InfoBase 基础信息
	base,
	%% UInt32 亲密度（友好度）
	closeness,
	%% Boolean 当日是否向该好友赠送了行动点（体力值）
	isGiveAP,
	%% Boolean 当日是否从该好友接受了行动点（体力值）
	isGainAP,
	%% Boolean 当日该好友是否赠送给我了行动点（体力值）
	isBeGiveAP,
	%% Boolean 当日该好友是否接受了我的行动点（体力值）
	isBeGainAP
}).

-record(pk_Friend2InfoSimple,{
	%% UInt64 角色ID
	id,
	%% String 姓名
	name,
	%% UInt16 等级
	level,
	%% UInt32 职业
	career,
	%% Byte 种族
	race,
	%% Byte 性别
	sex,
	%% Int32 头
	head
}).

%% 
%% // 需要添加的好友在黑名单中
%% // 服务端询问客户端是否要将该角色从黑名单移除
-define(CMD_GS2U_Friend2AddFromBlack_Ask,4034).
-record(pk_GS2U_Friend2AddFromBlack_Ask,{
	%% UInt64 角色ID
	id,
	%% String 姓名
	name
}).

%% 
%% // 同步好友申请列表_重置
-define(CMD_GS2U_Friend2ApplicantReset_Sync,5669).
-record(pk_GS2U_Friend2ApplicantReset_Sync,{
	%% UInt16 申请者总量
	count,
	%% Byte 当前信息页码
	page,
	%% Friend2InfoBase 当前页信息列表
	listInfo
}).

%% 
%% // 将要加入黑名单的人是好友
%% // 服务端询问客户端是否要将与该好友解除关系
-define(CMD_GS2U_Friend2BanFromFormal_Ask,3598).
-record(pk_GS2U_Friend2BanFromFormal_Ask,{
	%% UInt64 角色ID
	id,
	%% String 姓名
	name
}).

%% 
%% // 服务端询问客户端是否将最早的黑名单移除，并与指定角色解除好友关系再将其拉黑
%% // 黑名单满的情况下拉黑好友
-define(CMD_GS2U_Friend2BanWithUnbanAndDel_Ask,9003).
-record(pk_GS2U_Friend2BanWithUnbanAndDel_Ask,{
	%% UInt64 角色ID 需要移除黑名单
	idUnban,
	%% String 姓名   需要移除黑名单
	nameUnban,
	%% UInt64 角色ID 需要删除并拉黑的好友
	idDel,
	%% String 姓名   需要删除并拉黑的好友
	nameDel
}).

%% 
%% // 黑名单已达上限
%% // 服务端询问客户端是否要将最早的黑名单移除
-define(CMD_GS2U_Friend2BanWithUnban_Ask,34263).
-record(pk_GS2U_Friend2BanWithUnban_Ask,{
	%% UInt64 角色ID
	id,
	%% String 姓名
	name
}).

%% 
%% // 同步黑名单列表_重置
-define(CMD_GS2U_Friend2BlackReset_Sync,23862).
-record(pk_GS2U_Friend2BlackReset_Sync,{
	%% UInt16 黑名单总量
	count,
	%% Byte 当前信息页码
	page,
	%% Friend2InfoBase 当前页信息列表
	listInfo
}).

%% 
%% // 友好度变动提示
-define(CMD_GS2U_Friend2ClosenessChange_Sync,26867).
-record(pk_GS2U_Friend2ClosenessChange_Sync,{
	%% UInt64 角色ID
	id,
	%% UInt32 当前友好度
	closeness
}).

%% 
%% // 查看信息面板辅助信息反馈
-define(CMD_GS2U_Friend2ForLook_Ack,40418).
-record(pk_GS2U_Friend2ForLook_Ack,{
	%% UInt64 角色ID
	id,
	%% String 角色名
	name,
	%% Byte 0正式好友1临时好友2黑名单3申请列表4陌生人
	relation,
	%% UInt32 收到的赞
	like,
	%% Boolean 是否已点赞
	isGiveLike,
	%% UInt16 等级
	level
}).

%% 
%% // 好友语音反馈给接收方（S2C）
-define(CMD_GS2U_Friend2FormalChatVoice_AckR,3301).
-record(pk_GS2U_Friend2FormalChatVoice_AckR,{
	%% UInt64 发送者角色ID
	senderID,
	%% UInt64 接受者角色ID
	receiverID,
	%% UInt32 时间戳
	time,
	%% Single 音频总时长
	duration,
	%% Byte 消息段数
	count,
	%% Byte 分段索引
	index,
	%% Byte 音频数据
	data,
	%% Byte 双方关系
	relation
}).

%% 
%% // 好友语音反馈给发送方（S2C）
-define(CMD_GS2U_Friend2FormalChatVoice_AckS,5138).
-record(pk_GS2U_Friend2FormalChatVoice_AckS,{
	%% UInt64 发送者角色ID
	senderID,
	%% UInt64 接受者角色ID
	receiverID,
	%% UInt32 时间戳
	time
}).

%% 
%% // 好友消息反馈（S2C） <-
-define(CMD_GS2U_Friend2FormalChat_Ack,20057).
-record(pk_GS2U_Friend2FormalChat_Ack,{
	%% UInt64 发送者角色ID
	senderID,
	%% UInt64 接受者角色ID
	receiverID,
	%% UInt32 时间戳
	time,
	%% String 内容
	content,
	%% Byte 双方关系
	relation
}).

%% 
%% // 同步好友列表（按求婚界面要求排序）
-define(CMD_GS2U_Friend2FormalForMarriage_Sync,16418).
-record(pk_GS2U_Friend2FormalForMarriage_Sync,{
	%% UInt16 好友总量
	count,
	%% Boolean 是否有未领取的行动点（体力值）
	hasAP,
	%% Byte 当前信息页码
	page,
	%% Friend2InfoFormal 当前页信息列表
	listInfo
}).

%% 
%% // 同步好友列表_重置
-define(CMD_GS2U_Friend2FormalReset_Sync,35374).
-record(pk_GS2U_Friend2FormalReset_Sync,{
	%% UInt16 好友总量
	count,
	%% Boolean 是否有未领取的行动点（体力值）
	hasAP,
	%% Byte 当前信息页码
	page,
	%% Friend2InfoFormal 当前页信息列表
	listInfo
}).

%% 
%% // 双方结为好友的专用协议
-define(CMD_GS2U_Friend2MakeFormal_Sync,34421).
-record(pk_GS2U_Friend2MakeFormal_Sync,{
	%% UInt64 角色ID
	id
}).

%% 
%% // 反馈推荐好友
-define(CMD_GS2U_Friend2Recommend_Ack,59890).
-record(pk_GS2U_Friend2Recommend_Ack,{
	%% Friend2InfoBase 推荐名单
	listInfo
}).

%% 
%% // 反馈搜索好友
-define(CMD_GS2U_Friend2Search_Ack,487).
-record(pk_GS2U_Friend2Search_Ack,{
	%% Friend2InfoBase 搜索结果
	listInfo
}).

%% 
%% // 反馈精简的角色信息列表
-define(CMD_GS2U_Friend2SimpleList_Ack,758).
-record(pk_GS2U_Friend2SimpleList_Ack,{
	%% Byte 0正式好友1临时好友2黑名单3申请列表
	type,
	%% UInt16 信息总量
	count,
	%% UInt16 当前消息包索引号
	index,
	%% Friend2InfoSimple 信息
	listInfo
}).

%% 
%% // 同步临时好友列表_重置
-define(CMD_GS2U_Friend2TempReset_Sync,15095).
-record(pk_GS2U_Friend2TempReset_Sync,{
	%% UInt16 临时好友总量
	count,
	%% Byte 当前信息页码
	page,
	%% Friend2InfoBase 当前页信息列表
	listInfo
}).

%% 
%% // 反馈希望聊天
-define(CMD_GS2U_Friend2WantChat_Ack,20478).
-record(pk_GS2U_Friend2WantChat_Ack,{
	%% UInt64 角色ID
	id,
	%% Friend2InfoBase 仅当目标角色为陌生人时有效
	info,
	%% Byte 0正式好友1临时好友2黑名单4陌生人
	relation,
	%% UInt16 总量，相关列表总长度
	count,
	%% Boolean 是否有未领取的行动点（体力值），仅对正式好友列表有效，默认false
	hasAP,
	%% Byte 当前信息页码
	page,
	%% Friend2InfoFormal 当前页信息列表
	listInfo
}).

%% 
%% // 点赞成功回执
-define(CMD_GS2u_Friend2Like_Ack,48537).
-record(pk_GS2u_Friend2Like_Ack,{
	%% UInt64 角色ID
	id,
	%% String 角色名
	name,
	%% UInt32 当前赞值
	like
}).

%% 
%% // 反馈是否将黑名单中的角色移除并添加好友
-define(CMD_U2GS_Friend2AddFromBlack_Reply,40357).
-record(pk_U2GS_Friend2AddFromBlack_Reply,{
	%% UInt64 角色ID
	id,
	%% Boolean 是否同意
	isAgreed
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 添加好友请求
-define(CMD_U2GS_Friend2Add_Request,60911).
-record(pk_U2GS_Friend2Add_Request,{
	%% UInt64 角色ID
	id
}).

%% 
%% // 一键处理好友申请请求
-define(CMD_U2GS_Friend2ApplicantUseOneKey_Request,2984).
-record(pk_U2GS_Friend2ApplicantUseOneKey_Request,{
	%% Boolean 是否同意
	isAgreed
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 处理好友申请请求
-define(CMD_U2GS_Friend2ApplicantUse_Request,42263).
-record(pk_U2GS_Friend2ApplicantUse_Request,{
	%% UInt64 角色ID
	id,
	%% Boolean 是否同意
	isAgreed
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 查询好友申请列表请求
-define(CMD_U2GS_Friend2Applicant_Request,28136).
-record(pk_U2GS_Friend2Applicant_Request,{
	%% Byte 页码
	page
}).

%% 
%% // 反馈是否将指定角色从好友移除并加入到黑名单
-define(CMD_U2GS_Friend2BanWithDel_Reply,29035).
-record(pk_U2GS_Friend2BanWithDel_Reply,{
	%% UInt64 角色ID
	id,
	%% Boolean 是否同意
	isAgreed
}).

%% 
%% // 反馈是否将最早的黑名单移除，并与指定角色解除好友关系再将其拉黑
%% // 黑名单满的情况下拉黑好友
-define(CMD_U2GS_Friend2BanWithUnbanAndDel_Reply,60742).
-record(pk_U2GS_Friend2BanWithUnbanAndDel_Reply,{
	%% UInt64 角色ID 需要移除黑名单
	idUnban,
	%% UInt64 角色ID 需要删除并拉黑的好友
	idDel,
	%% Boolean 是否同意
	isAgreed
}).

%% 
%% // 反馈是否将最早的黑名单移除并继续拉黑指定角色
-define(CMD_U2GS_Friend2BanWithUnban_Reply,14850).
-record(pk_U2GS_Friend2BanWithUnban_Reply,{
	%% UInt64 需要移除黑名单的角色ID
	idUnban,
	%% UInt64 需要加入黑名单的角色ID
	idBan,
	%% Boolean 是否同意
	isAgreed
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 加入黑名单请求
-define(CMD_U2GS_Friend2Ban_Request,11969).
-record(pk_U2GS_Friend2Ban_Request,{
	%% UInt64 角色ID
	id
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 查询黑名单列表请求
-define(CMD_U2GS_Friend2Black_Request,25457).
-record(pk_U2GS_Friend2Black_Request,{
	%% Byte 页码
	page
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 删除好友请求
-define(CMD_U2GS_Friend2Del_Request,38445).
-record(pk_U2GS_Friend2Del_Request,{
	%% UInt64 角色ID
	id
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 查看信息面板辅助信息请求
-define(CMD_U2GS_Friend2ForLook_Request,15730).
-record(pk_U2GS_Friend2ForLook_Request,{
	%% UInt64 角色ID
	id
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 好友语音（C2S）
-define(CMD_U2GS_Friend2FormalChatVoice_Request,38617).
-record(pk_U2GS_Friend2FormalChatVoice_Request,{
	%% UInt64 接受者角色ID
	receiverID,
	%% UInt32 时间戳
	time,
	%% Single 音频总时长
	duration,
	%% Byte 消息段数
	count,
	%% Byte 分段索引
	index,
	%% Byte 音频数据
	data
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 好友消息（C2S）
-define(CMD_U2GS_Friend2FormalChat_Request,25005).
-record(pk_U2GS_Friend2FormalChat_Request,{
	%% UInt64 接受者角色ID
	receiverID,
	%% String 内容
	content,
	%% UInt32 时间戳
	time
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 查询好友列表请求（求婚界面）
-define(CMD_U2GS_Friend2FormalForMarriage_Request,55870).
-record(pk_U2GS_Friend2FormalForMarriage_Request,{
	%% Byte 页码
	page
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 好友周边功能
%% // 点赞0;赠送AP1;接受AP2;传送3
-define(CMD_U2GS_Friend2FormalOP_Request,45726).
-record(pk_U2GS_Friend2FormalOP_Request,{
	%% UInt64 角色ID
	id,
	%% Byte 操作类型
	opType
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 查询好友列表请求
-define(CMD_U2GS_Friend2Formal_Request,41453).
-record(pk_U2GS_Friend2Formal_Request,{
	%% Byte 页码
	page
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 更新自己的经纬度
%% // 弧度值
-define(CMD_U2GS_Friend2LBS_Request,15083).
-record(pk_U2GS_Friend2LBS_Request,{
	%% Single 经度
	longitude,
	%% Single 纬度
	latitude
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 推荐好友请求
-define(CMD_U2GS_Friend2Recommend_Request,3794).
-record(pk_U2GS_Friend2Recommend_Request,{
	%% Byte 指定具体性别
	sex,
	%% Boolean 是否按照就近距离进行排序
	isNear
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 搜索好友请求
-define(CMD_U2GS_Friend2Search_Request,16938).
-record(pk_U2GS_Friend2Search_Request,{
	%% String 姓名
	name
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 请求精简的角色信息列表
-define(CMD_U2GS_Friend2SimpleList_Requets,43748).
-record(pk_U2GS_Friend2SimpleList_Requets,{
	%% Byte 0正式好友1临时好友2黑名单3申请列表
	type
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 查询临时好友列表请求
-define(CMD_U2GS_Friend2Temp_Request,7582).
-record(pk_U2GS_Friend2Temp_Request,{
	%% Byte 页码
	page
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 移除黑名单请求
-define(CMD_U2GS_Friend2Unban_Request,64260).
-record(pk_U2GS_Friend2Unban_Request,{
	%% UInt64 角色ID
	id
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 希望向某人发起好友聊天
-define(CMD_U2GS_Friend2WantChat_Request,18482).
-record(pk_U2GS_Friend2WantChat_Request,{
	%% UInt64 角色ID
	id
}).

%% 
%% //初始化
-define(CMD_GS2U_InitGodWeapon,59144).
-record(pk_GS2U_InitGodWeapon,{
	%% GodWeaponInfo
	infos
}).

%% 
%% //神器升级结果
-define(CMD_GS2U_LevelUpGodWeaponResult,21218).
-record(pk_GS2U_LevelUpGodWeaponResult,{
	%% Byte
	weaponID,
	%% UInt16
	weaponLevel,
	%% UInt32
	exp,
	%% UInt16
	wakeSkillLv
}).

%% 
%% //技能升级结果
-define(CMD_GS2U_LevelUpGodWeaponSkillResult,14589).
-record(pk_GS2U_LevelUpGodWeaponSkillResult,{
	%% Byte
	weaponID,
	%% UInt16
	skillLevel
}).

-record(pk_GodWeaponInfo,{
	%% Byte
	weaponID,
	%% UInt16
	weaponLevel,
	%% UInt16
	skillLevel
}).

%% 
%% //神器升级
-define(CMD_U2GS_LevelUpGodWeapon,27135).
-record(pk_U2GS_LevelUpGodWeapon,{
	%% Byte
	weaponID
}).

%% 
%% //技能升级
-define(CMD_U2GS_LevelUpGodWeaponSkill,21847).
-record(pk_U2GS_LevelUpGodWeaponSkill,{
	%% Byte
	weaponID
}).

-record(pk_BiddingGuild,{
	%% UInt64
	guildID,
	%% String
	guildName,
	%% UInt32 当前竞价出资
	biddingMoney
}).

-record(pk_CannonState,{
	%% UInt32
	collectID,
	%% UInt32 重置剩余时间
	resetTime
}).

-record(pk_ExpeditionFinalInfo,{
	%% UInt32 地图iD
	mapid,
	%% ExpeditionGuildBattleInfo
	topGuildInfoList
}).

-record(pk_ExpeditionGlobalMapInfo,{
	%% UInt32 地图iD
	mapid,
	%% UInt16 进入人数
	onlineNumber,
	%% UInt16 排队人数
	queueNumber
}).

-record(pk_ExpeditionGuildBattleInfo,{
	%% UInt64 公会唯一ID
	guildID,
	%% String 公会名
	guildName,
	%% UInt64 工会分数
	guildScore
}).

-record(pk_ExpeditionMapInfo,{
	%% UInt32 公会唯一ID
	mapid,
	%% UInt64 公会唯一ID
	guildID,
	%% String 公会名
	guildName,
	%% UInt16 进入人数
	onlineNumber,
	%% UInt16 排队人数
	queueNumber,
	%% Byte 是否可以领奖， 非0可以， 0不可以
	isGetReward
}).

-record(pk_ExpeditionPointInfo,{
	%% UInt16  1-3，代表据点A-C
	pointIndex,
	%% UInt64 公会唯一ID
	guildID,
	%% String 公会名
	guildName
}).

%% 
-define(CMD_GS2U_BiddingGuildMsg,53493).
-record(pk_GS2U_BiddingGuildMsg,{
	%% BiddingGuild
	list,
	%% UInt32 自己军团当前物资
	resorce
}).

%% 
%% // 返回修改结果，失败只提示ErrorCode
-define(CMD_GS2U_ChangeDenoter,22996).
-record(pk_GS2U_ChangeDenoter,{
	%% UInt64
	guildID,
	%% Byte
	denoter
}).

%% 
%% // 修改公会名成功(失败只提示ErrorCode)
-define(CMD_GS2U_ChangeGuildName,61842).
-record(pk_GS2U_ChangeGuildName,{
	%% String
	newGuildName
}).

%% 
%% // 修改公告结果(成功返回这个结果，失败不会返回)
-define(CMD_GS2U_ChangeNotice,46512).
-record(pk_GS2U_ChangeNotice,{
	%% String 公告
	guildNotice
}).

%% 
%% // 捐献成功军团改变，只发给捐献者
-define(CMD_GS2U_DonateSuccess,18308).
-record(pk_GS2U_DonateSuccess,{
	%% UInt64 公会唯一ID
	guildID,
	%% Byte 公会等级
	guildLevel,
	%% UInt32 当前经验值
	nowExp,
	%% UInt64 捐献者角色ID
	roleID,
	%% UInt32 捐献者最新贡献点
	contribute
}).

%% 
%% // 通知本地图帮会成员位置信息
-define(CMD_GS2U_ExpeditionBroadcastPos,4888).
-record(pk_GS2U_ExpeditionBroadcastPos,{
	%% UInt160, 团长自己(x,y有效)， 1-3，代表据点A-C(x,y无效)
	type,
	%% String 广播者名称
	broadcasterName,
	%% Single目标X坐标	
	x,
	%% Single目标Y坐标
	y
}).

%% 
%% // 通知本地图帮会成员位置信息
-define(CMD_GS2U_ExpeditionFinalInfo,29191).
-record(pk_GS2U_ExpeditionFinalInfo,{
	%% UInt64 本次活动所得总分
	selfTotalScore,
	%% ExpeditionFinalInfo
	finalInfoList
}).

%% 
%% // 返回全局信息
-define(CMD_GS2U_ExpeditionGlobalMapInfoList,788).
-record(pk_GS2U_ExpeditionGlobalMapInfoList,{
	%% UInt32活动剩余时间(活动未开启时：0)
	leftSeconds,
	%% ExpeditionGlobalMapInfo
	mapInfoList
}).

%% 
%% // 返回远征地图战斗信息
-define(CMD_GS2U_ExpeditionMapBattleInfoList,10027).
-record(pk_GS2U_ExpeditionMapBattleInfoList,{
	%% UInt32 地图iD
	mapid,
	%% UInt64 当前地图得分
	selfScore,
	%% ExpeditionGuildBattleInfo
	selfGuildBattleInfo,
	%% ExpeditionPointInfo
	pointInfoList,
	%% ExpeditionGuildBattleInfo
	topGuildInfoList
}).

%% 
%% // 返回远征地图信息
-define(CMD_GS2U_ExpeditionMapInfoList,59443).
-record(pk_GS2U_ExpeditionMapInfoList,{
	%% ExpeditionMapInfo
	mapInfoList
}).

%% 
%% // 排队状态
-define(CMD_GS2U_ExpeditionQuenenState,57282).
-record(pk_GS2U_ExpeditionQuenenState,{
	%% UInt32 地图iD
	mapid
}).

%% 
%% // 赋予权力Ack，成功才返回给客户端
-define(CMD_GS2U_GivePower,32732).
-record(pk_GS2U_GivePower,{
	%% UInt64 目标角色ID
	targetRoleID,
	%% Byte 权限:0请求加入，1普通成员，2管理员，3副军团长，9军团长
	guileLevel
}).

%% 
%% // 报名信息
-define(CMD_GS2U_GuildBattleApply,11671).
-record(pk_GS2U_GuildBattleApply,{
	%% GuildBattleInfo
	list,
	%% UInt64
	selfGuildID,
	%% UInt64
	targetGuildID
}).

%% 
%% // 比赛结果(有对手且参与比赛了，才有结果)
-define(CMD_GS2U_GuildBattleResult,55408).
-record(pk_GS2U_GuildBattleResult,{
	%% Byte 1未开始，2比赛中，3结束
	isEnd,
	%% GuildBattleResultInfo
	win,
	%% GuildBattleResultInfo
	lose
}).

%% 
%% // 今日已经购买的BUFF列表
-define(CMD_GS2U_GuildBuff,46706).
-record(pk_GS2U_GuildBuff,{
	%% GuildBuff 今日购买的BUFF列表
	buff
}).

%% 
-define(CMD_GS2U_GuildBuffRole,10832).
-record(pk_GS2U_GuildBuffRole,{
	%% GuildBuffRole
	bgrs
}).

%% 
%% // 当前场景参战的军团列表
-define(CMD_GS2U_GuildIDList,17944).
-record(pk_GS2U_GuildIDList,{
	%% GuildIDList
	list
}).

%% 
%% // 返回公会招募榜
-define(CMD_GS2U_GuildList,58381).
-record(pk_GS2U_GuildList,{
	%% UInt32 当前页数
	nowPage,
	%% UInt32 总页数
	maxPage,
	%% GuildInfo 当前页列表
	guildInfoList
}).

%% 
%% // 公会操作结果
-define(CMD_GS2U_GuildOpResult,45041).
-record(pk_GS2U_GuildOpResult,{
	%% UInt64
	roleCode,
	%% Byte 1创建军团
	opType,
	%% Boolean
	opResult
}).

%% 
%% // 返回军团技能结果
-define(CMD_GS2U_GuildSkill,13522).
-record(pk_GS2U_GuildSkill,{
	%% GuildSkill 当前已经研究出来的军团列表
	skill,
	%% GuildSkill 自己已经学习的军团技能列表
	selfskill
}).

%% 
%% // 军团任务列表
-define(CMD_GS2U_GuildTask,29256).
-record(pk_GS2U_GuildTask,{
	%% GuildTask 包含刺探与巡逻任务
	tasks
}).

%% 
%% // 返回比赛对战列表
-define(CMD_GS2U_GuildWar,62357).
-record(pk_GS2U_GuildWar,{
	%% GuildWar
	list
}).

%% 
%% // 战斗过程中刷新数据
-define(CMD_GS2U_GuildWarData,43631).
-record(pk_GS2U_GuildWarData,{
	%% GuildWarRank
	ranks,
	%% PebbleState
	pebbles,
	%% CannonState
	cannons,
	%% UInt32 剩余时间
	syTime
}).

%% 
%% // 终场结算
-define(CMD_GS2U_GuildWarEnd,51846).
-record(pk_GS2U_GuildWarEnd,{
	%% GuildWarInfo
	infos,
	%% GuildWarReward_item
	items,
	%% GuildWarReward_coin
	coins
}).

%% 
%% // 同步已兑换的属性
%% // 玩家上线时推送，成功兑换时推送
-define(CMD_GS2U_Guild_ExchangeAll_Sync,2440).
-record(pk_GS2U_Guild_ExchangeAll_Sync,{
	%% UInt32 配置ID组
	listID,
	%% UInt32 配置等级组，与ID组一一匹配 （已学得最大等级）
	listLevel,
	%% UInt32 配置等级组，与ID组一一匹配 （受guildexchange.guildlevel限制后生效的等级）
	listLevelCur
}).

%% 
%% // 兑换反馈，用于客户端得到一个明确的消息以刷新界面
-define(CMD_GS2U_Guild_Exchange_Ack,7693).
-record(pk_GS2U_Guild_Exchange_Ack,{
	%% UInt32 配置ID
	id,
	%% UInt32 配置等级
	level,
	%% UInt32 为0时表示成功，否则需要客户端显示ErrorCode
	errorCode
}).

%% 
-define(CMD_GS2U_Guild_FairgroundEnter_Ack,39163).
-record(pk_GS2U_Guild_FairgroundEnter_Ack,{
	%% UInt64 家族ID（注意！这里是角色所处游乐场对应的家族ID，不一定是角色所在的家族ID）
	guildID,
	%% Ride 设备列表
	listRide,
	%% RideRole 正在使用设备的玩家列表
	listRole
}).

%% 
%% // 反馈/同步设备使用情况
%% // 操作类型1和2仅反馈给地图上的角色
%% // 操作类型3仅反馈操作者和被操作家族游乐场地图上的角色
-define(CMD_GS2U_Guild_FairgroundRide_Sync,42475).
-record(pk_GS2U_Guild_FairgroundRide_Sync,{
	%% Ride 刷新设备情况（操作对象设施）
	ride,
	%% RideRole 刷新角色情况（操作对象角色）
	role,
	%% Byte 操作类型 1乘坐;2取消乘坐;3升级（需要对应权限）
	type
}).

%% 
%% // 反馈成功的快速加入请求
-define(CMD_GS2U_Guild_FastJoin_Ack,14772).
-record(pk_GS2U_Guild_FastJoin_Ack,{
	%% UInt64
	guildID
}).

%% 
%% // 反馈查询允许快速加入的战力条件
-define(CMD_GS2U_Guild_FastJoin_Get_Ack,2591).
-record(pk_GS2U_Guild_FastJoin_Get_Ack,{
	%% UInt64
	guildID,
	%% UInt64
	force
}).

%% 
%% // 反馈设置允许快速加入的战力条件
%% // 虽然和GS2U_Guild_FastJoin_Get_Ack很像，但这个用来表达设置成功
-define(CMD_GS2U_Guild_FastJoin_Set_Ack,11867).
-record(pk_GS2U_Guild_FastJoin_Set_Ack,{
	%% UInt64
	guildID,
	%% UInt64
	force
}).

%% 
%% // 祈福请求成功反馈
%% //    仅祈福成功时使用该消息刷新界面
%% //    其它情况使用每日计数7获取当日已祈福次数，使用同步属性10006获取上次成功祈福的时间
-define(CMD_GS2U_Guild_GodBless_Ack,51273).
-record(pk_GS2U_Guild_GodBless_Ack,{
	%% UInt32 本次成功祈福的时间 参考GS2U_SyncServerTime
	time,
	%% Byte 当日已祈福次数
	count
}).

%% 
%% // 成功领取祈福进度奖励，失败时发送ErrorCode
-define(CMD_GS2U_Guild_GodBless_Schedule_Reward_Ack,54441).
-record(pk_GS2U_Guild_GodBless_Schedule_Reward_Ack,{
	%% UInt32 参考guildbless_schedule.id
	id
}).

%% 
%% // 同步/反馈祈福进度
-define(CMD_GS2U_Guild_GodBless_Schedule_Sync,10595).
-record(pk_GS2U_Guild_GodBless_Schedule_Sync,{
	%% UInt32
	schedule,
	%% UInt32 已领取的进度奖励，参考guildbless_schedule.id
	listID
}).

%% 
%% // 购买反馈，用于客户端得到一个明确的消息以刷新界面
-define(CMD_GS2U_Guild_ShopBuy_Ack,58426).
-record(pk_GS2U_Guild_ShopBuy_Ack,{
	%% UInt32 配置ID
	id,
	%% UInt32 数量
	count,
	%% UInt32 为0时表示成功，否则需要客户端显示ErrorCode
	errorCode
}).

%% 
%% // 活动地图合并同步数据
%% //    进入场景初始化
%% //    反馈请求U2GS_Guild_SnowmanDonate_Request
-define(CMD_GS2U_Guild_SnowmanAll_Sync,46692).
-record(pk_GS2U_Guild_SnowmanAll_Sync,{
	%% UInt32 已完成的数量
	count,
	%% UInt32 最大数量
	countMax,
	%% UInt32 子状态，对应guildsnowman.id
	subState,
	%% UInt32 正在制作的雪人已有的材料数量，下标参考配置表guildsnowman.id-1
	listResSnowman,
	%% UInt32 当前玩家已有的材料数量，下标参考配置表guildsnowman.id-1
	listResPlayer
}).

%% 
%% // 活动开始提示
%% // 只提示在线的、已加入家族的角色
-define(CMD_GS2U_Guild_SnowmanBegin_Sync,52004).
-record(pk_GS2U_Guild_SnowmanBegin_Sync,{
}).

%% 
%% /// 家族驻地
%% // 初始化已完成的雪人数量以及已领取的礼盒标记
%% //    角色上线或进入家族驻地时
%% //    反馈请求U2GS_Guild_SnowmanReward_Request
-define(CMD_GS2U_Guild_SnowmanCompleteCount_Sync,14295).
-record(pk_GS2U_Guild_SnowmanCompleteCount_Sync,{
	%% UInt32 数量
	count,
	%% Boolean true已领取；false未领取
	listMark
}).

%% 
%% // 每完成一个雪人的一种材料收集，通知客户端剩余材料数量，以展示剩余材料可以兑换的奖励
-define(CMD_GS2U_Guild_SnowmanExtraRes_Sync,16743).
-record(pk_GS2U_Guild_SnowmanExtraRes_Sync,{
	%% UInt32 数量
	count
}).

%% 
%% // 活动地图同步玩家数据
%% //    打怪、采集时发生变化则同步
-define(CMD_GS2U_Guild_SnowmanPlayer_Sync,62266).
-record(pk_GS2U_Guild_SnowmanPlayer_Sync,{
	%% UInt32 当前玩家已有的材料数量，下标参考配置表guildsnowman.id-1
	listResPlayer
}).

%% 
%% // 结算消息
%% //    活动结束时推送
-define(CMD_GS2U_Guild_SnowmanSettle_Sync,26620).
-record(pk_GS2U_Guild_SnowmanSettle_Sync,{
	%% UInt32 完成雪人数量 参考配置表guildsnowman_settle.id
	count,
	%% String 家族名
	guildName
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 堆雪人（名为堆雪人，但实际上可能是堆其它东西，反正就是用材料堆个NPC领奖的活动）
%% /// 活动场景
%% // 活动地图同步雪人数据
%% //    反馈请求U2GS_Guild_SnowmanCheck_Request
-define(CMD_GS2U_Guild_SnowmanSnowman_Sync,33606).
-record(pk_GS2U_Guild_SnowmanSnowman_Sync,{
	%% UInt32 已完成的数量
	count,
	%% UInt32 最大数量
	countMax,
	%% UInt32 子状态，对应guildsnowman.id
	subState,
	%% UInt32 正在制作的雪人已有的材料数量，下标参考配置表guildsnowman.id-1
	listResSnowman
}).

%% 
%% // 弹劾信息
-define(CMD_GS2U_ImpeachInfo,63767).
-record(pk_GS2U_ImpeachInfo,{
	%% Byte 能否发起弹劾	
	canImpeach,
	%% Byte支持者数量
	supportNumber,
	%% UInt64发起弹劾者ID
	impeacherID,
	%% String 发起弹劾这名字
	impeacherName,
	%% UInt64弹劾过期时间(秒)
	impeacheLeftTime
}).

%% 
%% // 加入公会成功
%% // 申请被同意/同意招募 导致的加入公会成功
%% // 客户端需要一个明确的消息（非ERRORCODE）来刷新界面
-define(CMD_GS2U_JoinGuild_Sync,3861).
-record(pk_GS2U_JoinGuild_Sync,{
	%% UInt64
	guildID
}).

%% 
%% // 旗帜拥有者发生改变
-define(CMD_GS2U_OccupyOwnerChange,27260).
-record(pk_GS2U_OccupyOwnerChange,{
	%% UInt64 拥有者军团ID
	ownerID,
	%% UInt64 对手军团ID
	targetID,
	%% OccupyOwner
	infos
}).

%% 
%% // 发布招募反馈
-define(CMD_GS2U_OneKeyRecruit_Ack,41203).
-record(pk_GS2U_OneKeyRecruit_Ack,{
	%% UInt32 需要冷去的时间（秒）
	cd,
	%% UInt32 0成功，非0为errorcode，需要带入cd作为参数
	ret
}).

%% 
%% // 打开公会界面返回的消息
-define(CMD_GS2U_OpenGuildForm,57773).
-record(pk_GS2U_OpenGuildForm,{
	%% UInt64 公会唯一ID
	guildID,
	%% String 公会名
	guildName,
	%% Byte 公会等级
	guildLevel,
	%% UInt32 军团总战力
	fightForce,
	%% UInt32 公会成员个数
	memberNumber,
	%% UInt32 公会成员最大个数
	maxMemberNumber,
	%% UInt32 公会物资
	resource,
	%% UInt32 公会活跃
	liveness,
	%% String 公告
	notice,
	%% Byte 军团标志
	denoter,
	%% Byte 军团商店等级
	shopLevel,
	%% UInt32 申请列表(官员以上才能查看)
	requestJoinNum,
	%% UInt32 个人贡献点
	selfContribute,
	%% Byte 个人在公会中的职位
	selfGuildLevel,
	%% UInt32 发布招募需要冷去的时间（秒）
	cd
}).

%% 
-define(CMD_GS2U_QueryGuildInfoByRoleID_Ack,4287).
-record(pk_GS2U_QueryGuildInfoByRoleID_Ack,{
	%% GuildInfo
	guildInfo
}).

%% 
%% // 查询弹劾信息
-define(CMD_GS2U_QueryImpeachInfo,41091).
-record(pk_GS2U_QueryImpeachInfo,{
}).

%% 
%% // 被招募的人接收到的招募消息
-define(CMD_GS2U_Recruit,14390).
-record(pk_GS2U_Recruit,{
	%% UInt64 招募者的角色ID
	roleID,
	%% String 招募者的角色名
	roleName,
	%% GuildInfo 公会Info
	guildInfo
}).

%% 
%% // 刷新军团属性
-define(CMD_GS2U_RefreshGuildProp,40691).
-record(pk_GS2U_RefreshGuildProp,{
	%% UInt64 公会唯一ID
	guildID,
	%% UInt32 公会物资
	resource,
	%% UInt32 公会活跃
	liveness,
	%% UInt32 个人贡献点
	selfContribute
}).

%% 
%% // 打开申请成员界面
-define(CMD_GS2U_RequestJoinGuildList,33524).
-record(pk_GS2U_RequestJoinGuildList,{
	%% GuildApplyMemberInfo 申请列表
	requestList
}).

%% 
%% // 申请加入公会成功
-define(CMD_GS2U_RequestJoinGuild_Ack,7364).
-record(pk_GS2U_RequestJoinGuild_Ack,{
	%% UInt64
	guildID,
	%% UInt64
	cancelID
}).

%% 
%% // 请求查看成员列表
-define(CMD_GS2U_RequestLookMemberList,32102).
-record(pk_GS2U_RequestLookMemberList,{
	%% UInt32 当前页数
	nowPage,
	%% UInt32 总页数
	maxPage,
	%% GuildMemberInfo 当前查看页的成员列表
	memberList
}).

%% 
%% // 返回捐献剩余次数
-define(CMD_GS2U_ReturnDonateTimes,42575).
-record(pk_GS2U_ReturnDonateTimes,{
	%% Byte 金钱类型,1(非绑金币),3(非绑钻石)
	moneyType,
	%% UInt16 今日剩余次数
	times
}).

%% 
%% // 军团商店升级
-define(CMD_GS2U_ShopUpgrade,8934).
-record(pk_GS2U_ShopUpgrade,{
	%% UInt64
	guildID,
	%% Byte 军团商店升级
	shopLevel
}).

%% 
%% // 军团升级反馈
-define(CMD_GS2U_Upgrade_Ack,41766).
-record(pk_GS2U_Upgrade_Ack,{
	%% UInt64
	guildID,
	%% UInt32
	level
}).

-record(pk_GuildApplyMemberInfo,{
	%% UInt64 角色唯一ID
	roleID,
	%% UInt64 角色Code，如果不在线，code为0
	roleCode,
	%% String 角色名
	roleName,
	%% UInt32 战力
	combatNum,
	%% Byte Vip等级
	vipLevel,
	%% UInt16 玩家等级
	playerLevel,
	%% UInt64 申请时间
	applyTime
}).

-record(pk_GuildBattleInfo,{
	%% UInt64 公会唯一ID
	guildID,
	%% String 公会名
	guildName,
	%% Byte 公会等级
	guildLevel,
	%% UInt32 军团总战力
	fightForce,
	%% String 会长姓名
	leaderName,
	%% UInt64 会长id
	leaderRoleID,
	%% Byte 军团标志
	denoter
}).

-record(pk_GuildBattlePlayerInfo,{
	%% UInt64
	roleID,
	%% String
	roleName,
	%% UInt32 玩家总分
	point
}).

-record(pk_GuildBattleResultInfo,{
	%% UInt64
	guildID,
	%% String
	guildName,
	%% UInt32 总积分
	point,
	%% GuildBattlePlayerInfo 只发一部分和玩家自己
	playerInfos
}).

-record(pk_GuildBuff,{
	%% UInt32 配置ID
	confId,
	%% UInt32 BuffID
	buffID,
	%% Byte 今日自己是否已经领取这个BUFF，0未领取，1已领取
	getFlag
}).

-record(pk_GuildBuffRole,{
	%% UInt64
	roleID,
	%% String
	roleName,
	%% UInt64 购买时间，绝对时间，不是UTC时间
	buyTime,
	%% UInt32 配置ID
	confId,
	%% UInt32 BuffID
	buffID
}).

-record(pk_GuildIDList,{
	%% UInt64
	guildID,
	%% String
	guildName
}).

-record(pk_GuildInfo,{
	%% UInt64 公会唯一ID
	guildID,
	%% String 公会名
	guildName,
	%% Byte 公会等级
	guildLevel,
	%% Byte 军团标志
	denoter,
	%% UInt32 军团总战力
	fightForce,
	%% UInt32 公会成员个数
	memberNumber,
	%% UInt32 公会成员最大个数
	maxMemberNumber,
	%% String 会长姓名
	leaderName,
	%% UInt64 会长id
	leaderRoleID,
	%% Byte 是否申请加入，1是，0否
	isRequest
}).

-record(pk_GuildMemberInfo,{
	%% UInt64 角色唯一ID
	roleID,
	%% UInt64 角色Code，如果不在线，code为0
	roleCode,
	%% String 角色名
	roleName,
	%% Byte 角色在公会中的职位
	roleGuildLevel,
	%% UInt32 活跃度
	liveness,
	%% UInt32 战力
	combatNum,
	%% UInt64 下线时长
	offlineTime,
	%% Byte Vip等级
	vipLevel,
	%% UInt16 玩家等级
	playerLevel
}).

-record(pk_GuildSkill,{
	%% UInt32 配置ID
	confId,
	%% UInt32 技能ID
	skillID,
	%% UInt16 技能等级
	skillLvl,
	%% UInt32 本技能下一等级的配置ID，如果已经学完，本值为0
	next_confID
}).

-record(pk_GuildTask,{
	%% Byte 1刺探，2巡逻
	taskType,
	%% Byte 任务状态，1未接取，2进行中，3已完成
	taskState,
	%% UInt16 完成次数
	curTimes,
	%% UInt16 最大次数
	maxTimes,
	%% UInt32 接取任务的CD时间（还剩这么多秒才能接取任务）
	accCDTime,
	%% UInt16 这个ID为零表示没接任务
	taskID,
	%% UInt64
	targetGuildID,
	%% String
	targetGuildName,
	%% UInt64
	targetPlayerRoleID,
	%% String
	targetPLayerName,
	%% UInt32 完成参数1
	number1,
	%% UInt32 完成参数2
	number2,
	%% UInt32 完成参数3
	number3
}).

-record(pk_GuildWar,{
	%% Byte 第几场（1初赛，2决赛）
	stage,
	%% Byte 第几组（1，2）
	group,
	%% UInt64
	guildID1,
	%% String
	guildName1,
	%% UInt64
	guildID2,
	%% String
	guildName2,
	%% UInt64
	guildID3,
	%% String
	guildName3,
	%% UInt64
	winguildID,
	%% String
	winguildName
}).

-record(pk_GuildWarInfo,{
	%% UInt64
	guildID,
	%% String
	guildName,
	%% UInt32 总积分
	all_integral,
	%% GuildWarInfoIntegral 积分列表
	integrals
}).

-record(pk_GuildWarInfoIntegral,{
	%% Byte 积分类型:1占领水晶,2争夺炮台,3参战人员,4累积击杀,5累积助攻
	type,
	%% UInt16 数量
	number,
	%% UInt32 积分
	integral
}).

-record(pk_GuildWarRank,{
	%% UInt16
	rank,
	%% UInt64
	roleID,
	%% String
	roleName,
	%% UInt32
	killPlayer,
	%% UInt32
	secondAttack
}).

-record(pk_GuildWarReward_coin,{
	%% Byte 货币类型
	cointype,
	%% UInt32
	number
}).

-record(pk_GuildWarReward_item,{
	%% Byte 1绑定，0非绑定
	isBind,
	%% UInt32
	itemID,
	%% UInt32
	itemNumber
}).

-record(pk_OccupyOwner,{
	%% UInt32 旗帜ID，采集物ID
	occupyID,
	%% UInt64 拥有者军团ID
	ownerID
}).

-record(pk_PebbleState,{
	%% UInt32
	monsterID,
	%% UInt32
	curHP,
	%% UInt32
	maxHP,
	%% UInt32 重置剩余时间
	resetTime
}).

-record(pk_Ride,{
	%% UInt32 设备ID
	id,
	%% UInt32 设备等级
	level,
	%% Byte 设备状态 0维护中;1未到开放时间;2正常开放
	state
}).

-record(pk_RideRole,{
	%% UInt64 角色ID
	roleID,
	%% UInt64 家族ID（注意！这里是角色所处游乐场对应的家族ID，不一定是角色所在的家族ID）
	guildID,
	%% UInt32 设备ID
	rideID,
	%% UInt32 座位ID
	seatID,
	%% UInt32 开始使用的时间 （本地时间戳，从1970年1月1日起，秒）
	time
}).

%% 
%% // 接取军团驻地任务
%% // 待废弃
-define(CMD_U2GS_AcceptGuildTask,39014).
-record(pk_U2GS_AcceptGuildTask,{
	%% Byte 1刺探，2巡逻
	taskType
}).

%% 
%% // 同意招募
-define(CMD_U2GS_AgreeRecruit,27924).
-record(pk_U2GS_AgreeRecruit,{
	%% UInt64
	guildID,
	%% UInt64 招募者的角色唯一ID
	roleID,
	%% Byte 1同意，0拒绝
	agree
}).

%% 
%% // 出价，出价错误返回errorcode，成功返回GS2U_BiddingGuildMsg
-define(CMD_U2GS_Bidding,16097).
-record(pk_U2GS_Bidding,{
	%% UInt64 目标军团ID，如果位置没有被占领，则为自己军团
	guildID
}).

%% 
%% // 购买BUFF
-define(CMD_U2GS_BuyGuildBuff,56586).
-record(pk_U2GS_BuyGuildBuff,{
	%% UInt32 配置ID
	confId
}).

%% 
%% // 修改标志
-define(CMD_U2GS_ChangeDenoter,36937).
-record(pk_U2GS_ChangeDenoter,{
	%% UInt64
	guildID,
	%% Byte
	denoter
}).

%% 
%% // 修改公会名
-define(CMD_U2GS_ChangeGuildName,42104).
-record(pk_U2GS_ChangeGuildName,{
	%% String
	newGuildName
}).

%% 
%% // 团长移交
-define(CMD_U2GS_ChangeLeader,5315).
-record(pk_U2GS_ChangeLeader,{
	%% UInt64 目标角色ID
	targetRoleID
}).

%% 
%% // 修改公告
-define(CMD_U2GS_ChangeNotice,2658).
-record(pk_U2GS_ChangeNotice,{
	%% String 公告
	guildNotice
}).

%% 
%% // 创建公会
-define(CMD_U2GS_CreateGuild,8957).
-record(pk_U2GS_CreateGuild,{
	%% String 公会名(guild_name_max_length)
	guildName,
	%% Byte 军团标志
	denoter,
	%% String 军团公告
	guildNotice
}).

%% 
%% // 同意或者拒绝申请人加入
-define(CMD_U2GS_DealRequestJoin,55171).
-record(pk_U2GS_DealRequestJoin,{
	%% UInt64
	guildID,
	%% UInt64 申请者的roleid列表
	roleIDs,
	%% Byte 1同意，0拒绝
	agree
}).

%% 
%% // 解散公会(只有会长才有权力)
-define(CMD_U2GS_DeleteGuild,39422).
-record(pk_U2GS_DeleteGuild,{
}).

%% 
%% // 军团捐献(金钱)
-define(CMD_U2GS_DonateMoney,52751).
-record(pk_U2GS_DonateMoney,{
	%% Byte 金钱类型,1(非绑金币),3(非绑钻石)
	moneyType,
	%% UInt32 金钱数量
	moneyNumber
}).

%% 
%% // 进入军团战
-define(CMD_U2GS_EnterGuildBattle,53913).
-record(pk_U2GS_EnterGuildBattle,{
}).

%% 
%% // 进入军团驻地
%% // 待废弃
-define(CMD_U2GS_EnterGuildHome,15968).
-record(pk_U2GS_EnterGuildHome,{
	%% UInt64
	targetGuildID
}).

%% 
%% // 退出工会
-define(CMD_U2GS_ExitGuild,61035).
-record(pk_U2GS_ExitGuild,{
}).

%% 
%% // 通知本地图帮会成员位置信息
-define(CMD_U2GS_ExpeditionBroadcastPos,17882).
-record(pk_U2GS_ExpeditionBroadcastPos,{
	%% UInt160, 团长自己， 1-3，代表据点A-C
	type
}).

%% 
%% // 领取奖励
%% // 待废弃
-define(CMD_U2GS_GetGuildHomeReward,14913).
-record(pk_U2GS_GetGuildHomeReward,{
	%% Byte 1刺探，2巡逻
	taskType
}).

%% 
%% // 领取军团津贴
-define(CMD_U2GS_GetGuildPrize,44491).
-record(pk_U2GS_GetGuildPrize,{
}).

%% 
%% // 请求领取每日奖励
-define(CMD_U2GS_GiveMeExpeditionRewardEverDay,64755).
-record(pk_U2GS_GiveMeExpeditionRewardEverDay,{
	%% UInt32 地图iD
	mapid
}).

%% 
%% // 赋予权力
-define(CMD_U2GS_GivePower,12786).
-record(pk_U2GS_GivePower,{
	%% UInt64 目标角色ID
	targetRoleID,
	%% Byte 权限:0请求加入，1普通成员，2管理员，3副军团长，9军团长
	guileLevel
}).

%% 
%% // 放弃任务
%% // 待废弃
-define(CMD_U2GS_GiveUpGuildTask,56130).
-record(pk_U2GS_GiveUpGuildTask,{
	%% Byte 1刺探，2巡逻
	taskType
}).

%% 
%% // 打军团战报名界面
-define(CMD_U2GS_GuildBattleApply,61033).
-record(pk_U2GS_GuildBattleApply,{
}).

%% 
%% // 公会招募榜
-define(CMD_U2GS_GuildList,38435).
-record(pk_U2GS_GuildList,{
	%% UInt32 请求第几页(打开界面请设置为1，表示请求查看第一页)
	requestPageNumber
}).

%% 
%% // 领取军团工资
%% // 待废弃
-define(CMD_U2GS_GuildReward,2800).
-record(pk_U2GS_GuildReward,{
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 兑换功能
%% // 兑换请求
-define(CMD_U2GS_Guild_Exchange_Request,461).
-record(pk_U2GS_Guild_Exchange_Request,{
	%% UInt32 配置ID
	id,
	%% UInt32 配置等级
	level
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 游乐场（取代旧有的军团驻地）
%% // 进入游乐场请求
-define(CMD_U2GS_Guild_FairgroundEnter_Request,52175).
-record(pk_U2GS_Guild_FairgroundEnter_Request,{
	%% UInt64
	targetGuildID
}).

%% 
%% // 使用设备请求
%% // 操作类型0和1仅能在游乐场中使用
%% // 操作类型2可以不在游乐场中使用，但需要对应权限
-define(CMD_U2GS_Guild_FairgroundRide_Request,29537).
-record(pk_U2GS_Guild_FairgroundRide_Request,{
	%% UInt32 设备ID
	id,
	%% Byte 操作类型 1乘坐;2取消乘坐;3升级
	type
}).

%% 
%% // 公会协议
%% // tiancheng
%% //////////////////////////////////////////////////////////////////////
%% // 快速加入相关协议支持 begin
%% // 查询允许快速加入的战力条件
-define(CMD_U2GS_Guild_FastJoin_Get_Request,38175).
-record(pk_U2GS_Guild_FastJoin_Get_Request,{
	%% UInt64
	guildID
}).

%% 
%% // 快速加入请求
%% // 加入成功则走普通加入
-define(CMD_U2GS_Guild_FastJoin_Request,51044).
-record(pk_U2GS_Guild_FastJoin_Request,{
}).

%% 
%% // 设置允许快速加入的战力条件
-define(CMD_U2GS_Guild_FastJoin_Set_Request,2843).
-record(pk_U2GS_Guild_FastJoin_Set_Request,{
	%% UInt64
	guildID,
	%% UInt64
	force
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 女神祈福
%% // 祈福请求
-define(CMD_U2GS_Guild_GodBless_Request,24009).
-record(pk_U2GS_Guild_GodBless_Request,{
	%% Byte 参考guildbless.typ
	type
}).

%% 
%% // 请求查询祈福进度
-define(CMD_U2GS_Guild_GodBless_Schedule_Request,4029).
-record(pk_U2GS_Guild_GodBless_Schedule_Request,{
}).

%% 
%% // 请求领取祈福进度奖励
-define(CMD_U2GS_Guild_GodBless_Schedule_Reward_Request,169).
-record(pk_U2GS_Guild_GodBless_Schedule_Reward_Request,{
	%% UInt32 参考guildbless_schedule.id
	id
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 家族商店
%% // 购买请求
-define(CMD_U2GS_Guild_ShopBuy_Request,50110).
-record(pk_U2GS_Guild_ShopBuy_Request,{
	%% UInt32 配置ID
	id,
	%% UInt32 数量
	count
}).

%% 
%% // 查看当前雪人进度请求
%% //    反馈消息GS2U_Guild_SnowmanSnowman_Sync
-define(CMD_U2GS_Guild_SnowmanCheck_Request,31731).
-record(pk_U2GS_Guild_SnowmanCheck_Request,{
}).

%% 
%% // 捐献材料请求
%% //    反馈消息GS2U_Guild_SnowmanAll_Sync
-define(CMD_U2GS_Guild_SnowmanDonate_Request,42200).
-record(pk_U2GS_Guild_SnowmanDonate_Request,{
	%% UInt32 材料类型，参考配置表guildsnowman.id，全部捐献则填0
	id,
	%% UInt32 想要捐献给第几个雪人？从1开始
	snowmanID
}).

%% 
%% // 废弃，领取奖励已改为活动结算时邮件发放
%% // 领取雪人礼盒请求
%% //    反馈消息GS2U_Guild_SnowmanCompleteCount_Sync
-define(CMD_U2GS_Guild_SnowmanReward_Request,11396).
-record(pk_U2GS_Guild_SnowmanReward_Request,{
	%% UInt32 领取第几个雪人的奖励？从1开始
	id
}).

%% 
%% // 弹劾团长
-define(CMD_U2GS_ImpeachCreater,33039).
-record(pk_U2GS_ImpeachCreater,{
}).

%% 
%% // 踢出工会
-define(CMD_U2GS_KickGuild,23307).
-record(pk_U2GS_KickGuild,{
	%% UInt64 目标角色ID
	targetRoleID
}).

%% 
%% // 快速加入相关协议支持 end
%% //////////////////////////////////////////////////////////////////////
%% // 发布招募
-define(CMD_U2GS_OneKeyRecruit_Request,3207).
-record(pk_U2GS_OneKeyRecruit_Request,{
}).

%% 
%% // 打开公会界面(服务器会下发公会基本信息和第一页成员两条消息)
-define(CMD_U2GS_OpenGuildForm,6179).
-record(pk_U2GS_OpenGuildForm,{
}).

%% 
%% // 打开军团商店
-define(CMD_U2GS_OpenGuildShop,54933).
-record(pk_U2GS_OpenGuildShop,{
}).

%% 
%% // 查询战报()
-define(CMD_U2GS_QueryExpeditionFinalInfo,44549).
-record(pk_U2GS_QueryExpeditionFinalInfo,{
}).

%% 
%% // 查询全局信息
-define(CMD_U2GS_QueryExpeditionGlobalMapInfo,2120).
-record(pk_U2GS_QueryExpeditionGlobalMapInfo,{
}).

%% 
%% // 查询远征地图战斗信息
-define(CMD_U2GS_QueryExpeditionMapBattleInfo,55919).
-record(pk_U2GS_QueryExpeditionMapBattleInfo,{
	%% UInt32 地图iD
	mapid
}).

%% 
%% // 查询远征地图信息
-define(CMD_U2GS_QueryExpeditionMapInfo,3559).
-record(pk_U2GS_QueryExpeditionMapInfo,{
}).

%% 
%% // 查询指定角色的家族信息
-define(CMD_U2GS_QueryGuildInfoByRoleID_Request,52447).
-record(pk_U2GS_QueryGuildInfoByRoleID_Request,{
	%% UInt64
	roleID
}).

%% 
%% // 招募成员
-define(CMD_U2GS_Recruit,19036).
-record(pk_U2GS_Recruit,{
	%% UInt64 招募目标Code
	targetCode
}).

%% 
%% // 请求捐献剩余次数
-define(CMD_U2GS_RequestDonateTimes,5654).
-record(pk_U2GS_RequestDonateTimes,{
	%% Byte 金钱类型,1(非绑金币),3(非绑钻石)
	moneyType
}).

%% 
%% // 中途请求军团战比赛信息
-define(CMD_U2GS_RequestGuildBattleResult,5879).
-record(pk_U2GS_RequestGuildBattleResult,{
}).

%% 
%% // 打开军团福利BUFF界面
-define(CMD_U2GS_RequestGuildBuff,18969).
-record(pk_U2GS_RequestGuildBuff,{
}).

%% 
%% // 请求指定公会信息
%% // 反馈GS2U_OpenGuildForm
-define(CMD_U2GS_RequestGuildInfo_Request,55372).
-record(pk_U2GS_RequestGuildInfo_Request,{
	%% UInt64
	guildID
}).

%% 
%% // 打开军团技能界面
-define(CMD_U2GS_RequestGuildSkill,29591).
-record(pk_U2GS_RequestGuildSkill,{
}).

%% 
%% // 打开军团任务界面，请求军团任务列表，返回GS2U_GuildTask
%% // 待废弃
-define(CMD_U2GS_RequestGuildTask,1519).
-record(pk_U2GS_RequestGuildTask,{
}).

%% 
%% // ----------------------------------------------军团争霸－城战----------------------------------------------
%% // 请求竞价军团列表与自己军团信息和分组信息
-define(CMD_U2GS_RequestGuildWar,19922).
-record(pk_U2GS_RequestGuildWar,{
}).

%% 
%% // 申请加入工会
-define(CMD_U2GS_RequestJoinGuild,51228).
-record(pk_U2GS_RequestJoinGuild,{
	%% UInt64 公会唯一ID
	guildID
}).

%% 
%% // 打开申请成员界面
-define(CMD_U2GS_RequestJoinGuildList,486).
-record(pk_U2GS_RequestJoinGuildList,{
}).

%% 
%% // 请求查看成员列表
-define(CMD_U2GS_RequestLookMemberList,65180).
-record(pk_U2GS_RequestLookMemberList,{
	%% UInt32 查看第几页成员
	requestPageNumber
}).

%% 
%% // 研究技能
-define(CMD_U2GS_ResearchGuildSkill,8607).
-record(pk_U2GS_ResearchGuildSkill,{
	%% UInt32 配置ID
	confId
}).

%% 
%% // 军团商店升级
-define(CMD_U2GS_ShopUpgrade,620).
-record(pk_U2GS_ShopUpgrade,{
	%% UInt64
	guildID
}).

%% 
%% // 学习技能
-define(CMD_U2GS_StudyGuildSkill,36701).
-record(pk_U2GS_StudyGuildSkill,{
	%% UInt32 配置ID
	confId
}).

%% 
%% // 召唤幻象(刺探专有)
%% // 待废弃
-define(CMD_U2GS_SummonHX,3691).
-record(pk_U2GS_SummonHX,{
}).

%% 
%% // 召唤神兽
%% // 待废弃
-define(CMD_U2GS_SummonMonster,13103).
-record(pk_U2GS_SummonMonster,{
}).

%% 
%% // 支持弹劾团长
-define(CMD_U2GS_SupportImpeachCreater,28458).
-record(pk_U2GS_SupportImpeachCreater,{
}).

%% 
%% // 军团升级
-define(CMD_U2GS_Upgrade,25266).
-record(pk_U2GS_Upgrade,{
	%% UInt64
	guildID
}).

%% 
%% // 使用大炮
-define(CMD_U2GS_UseCannon,58222).
-record(pk_U2GS_UseCannon,{
	%% UInt64
	targetGuildID,
	%% UInt64
	selectCode
}).

%% 
%% // 领取BUFF
-define(CMD_U2GS_getGuildBuff,18066).
-record(pk_U2GS_getGuildBuff,{
	%% UInt32 配置ID
	confId
}).

%% 
%% // 反馈编辑相册信息
-define(CMD_GS2U_IdentityEditPic_Ack,50360).
-record(pk_GS2U_IdentityEditPic_Ack,{
	%% MD5 相册信息集，其元素为多个MD5(16byte)
	idi_listPic
}).

%% 
%% // 反馈编辑标签结果
-define(CMD_GS2U_IdentityEditTag_Ack,61320).
-record(pk_GS2U_IdentityEditTag_Ack,{
	%% Byte 标签信息集，其元素值参考identity_tag.id
	idi_listTag
}).

%% 
%% // 反馈下载图片请求_数据
-define(CMD_GS2U_IdentityPicDownloadData_Ack,15156).
-record(pk_GS2U_IdentityPicDownloadData_Ack,{
	%% Byte 图片MD5(16byte)
	md5,
	%% UInt32 数据尺寸（单位字节）
	size,
	%% UInt16 数据划分段数
	count,
	%% UInt16 数据段索引
	index,
	%% Byte 数据
	data
}).

%% 
%% // 反馈下载图片请求
-define(CMD_GS2U_IdentityPicDownloadError_Ack,38726).
-record(pk_GS2U_IdentityPicDownloadError_Ack,{
	%% Byte 图片MD5(16byte)
	md5,
	%% Byte 无法下载的错误类型（0照片不存在1等待过审）
	error
}).

%% 
%% // 反馈上传图片请求
-define(CMD_GS2U_IdentityPicUpload_Ack,3071).
-record(pk_GS2U_IdentityPicUpload_Ack,{
	%% Byte 图片MD5(16byte)
	md5,
	%% Boolean true上传完毕或已经存在；false需要继续上传
	isComplete
}).

%% 
%% // 反馈身份证信息
-define(CMD_GS2U_Identity_Ack,14736).
-record(pk_GS2U_Identity_Ack,{
	%% UInt64 角色ID
	id,
	%% UInt64 对象唯一码，不在线时为0
	code,
	%% String 姓名
	name,
	%% UInt16 等级
	level,
	%% UInt32 职业
	career,
	%% Byte 种族
	race,
	%% Byte 性别
	sex,
	%% Byte VIP等级
	vipLv,
	%% UInt32 赞
	like,
	%% Boolean 当日是否向该角色点赞
	isGiveLike,
	%% String 家族名
	familyName,
	%% Byte 年龄，默认值255表示未设置。取值参考globalsetup.identity_age_limit
	idi_age,
	%% Byte 出生月，默认值0表示未设置
	idi_birthmonth,
	%% Byte 出生日，默认值0表示未设置
	idi_birthday,
	%% Byte 星座，默认值0表示未设置。
	idi_zodiac,
	%% Byte 血型，默认值0表示未设置。
	idi_bloodType,
	%% Byte 故乡信息1，默认值0表示未设置。取值参考identity_area.id1
	idi_hometown1,
	%% Byte 故乡信息2，默认值0表示未设置。取值参考identity_area.id2
	idi_hometown2,
	%% Byte 所在地信息1，默认值0表示未设置。取值参考identity_area.id1
	idi_location1,
	%% Byte 所在地信息2，默认值0表示未设置。取值参考identity_area.id2
	idi_location2,
	%% String 自定义签名，长度参考globalsetup.identity_sign_count
	idi_sign,
	%% Byte 自定义头像MD5(16byte)
	idi_face,
	%% Byte 标签信息集，其元素值参考identity_tag.id
	idi_listTag,
	%% MD5 相册信息集，其元素为多个MD5(16byte)
	idi_listPic
}).

-record(pk_MD5,{
	%% Byte
	md5
}).

-record(pk_RoleHeadPic,{
	%% UInt64
	roleID,
	%% Byte 图片MD5(16byte)
	md5
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 编辑身份证信息_年龄
-define(CMD_U2GS2U_IdentityEditAge,44844).
-record(pk_U2GS2U_IdentityEditAge,{
	%% Byte 年龄，默认值255表示未设置。取值参考globalsetup.identity_age_limit
	idi_age
}).

%% 
%% // 编辑身份证信息_生日
-define(CMD_U2GS2U_IdentityEditBirth,47244).
-record(pk_U2GS2U_IdentityEditBirth,{
	%% Byte 出生月，默认值0表示未设置
	idi_birthmonth,
	%% Byte 出生日，默认值0表示未设置
	idi_birthday
}).

%% 
%% // 从1到12依次为：白羊金牛双子巨蟹狮子处女天秤天蝎射手摩羯水瓶双鱼
%% // 编辑身份证信息_血型
-define(CMD_U2GS2U_IdentityEditBloodType,16013).
-record(pk_U2GS2U_IdentityEditBloodType,{
	%% Byte 血型，默认值0表示未设置。
	idi_bloodType
}).

%% 
%% // 编辑头像信息
-define(CMD_U2GS2U_IdentityEditFace,42405).
-record(pk_U2GS2U_IdentityEditFace,{
	%% Byte 自定义头像MD5(16byte)
	idi_face
}).

%% 
%% // 从1到4依次为：A、B、AB、O
%% // 编辑身份证信息_故乡
-define(CMD_U2GS2U_IdentityEditHometown,27036).
-record(pk_U2GS2U_IdentityEditHometown,{
	%% Byte 故乡信息1，默认值0表示未设置。取值参考identity_area.id1
	idi_hometown1,
	%% Byte 故乡信息2，默认值0表示未设置。取值参考identity_area.id2
	idi_hometown2
}).

%% 
%% // 编辑身份证信息_所在地
-define(CMD_U2GS2U_IdentityEditLocation,58024).
-record(pk_U2GS2U_IdentityEditLocation,{
	%% Byte 所在地信息1，默认值0表示未设置。取值参考identity_area.id1
	idi_location1,
	%% Byte 所在地信息2，默认值0表示未设置。取值参考identity_area.id2
	idi_location2
}).

%% 
%% // 编辑签名信息
-define(CMD_U2GS2U_IdentityEditSign,36224).
-record(pk_U2GS2U_IdentityEditSign,{
	%% String 自定义签名，长度参考globalsetup.identity_sign_count
	idi_sign
}).

%% 
%% // 编辑身份证信息_星座
-define(CMD_U2GS2U_IdentityEditZodiac,25735).
-record(pk_U2GS2U_IdentityEditZodiac,{
	%% Byte 星座，默认值0表示未设置。
	idi_zodiac
}).

%% 
%% // 请求角色的头像数据
-define(CMD_U2GS2U_RequestRoleHeadPic,30552).
-record(pk_U2GS2U_RequestRoleHeadPic,{
	%% RoleHeadPic
	heads
}).

%% 
%% // 添加标签
-define(CMD_U2GS_IdentityEditTagAdd_Request,45833).
-record(pk_U2GS_IdentityEditTagAdd_Request,{
	%% Byte 新增的标签信息集，其元素值参考identity_tag.id
	idi_listTag
}).

%% 
%% // 删除标签
-define(CMD_U2GS_IdentityEditTagDel_Request,23367).
-record(pk_U2GS_IdentityEditTagDel_Request,{
	%% Byte 标签信息，取值参考identity_tag.id
	idi_tag
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 下载图片请求_开始
-define(CMD_U2GS_IdentityPicDownloadBegin_Request,59335).
-record(pk_U2GS_IdentityPicDownloadBegin_Request,{
	%% Byte 图片MD5(16byte)
	md5
}).

%% 
%% // 下载图片请求_继续
-define(CMD_U2GS_IdentityPicDownloadContinue_Request,38621).
-record(pk_U2GS_IdentityPicDownloadContinue_Request,{
	%% Byte 图片MD5(16byte)
	md5
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 上传图片请求_开始
-define(CMD_U2GS_IdentityPicUploadBegin_Request,38438).
-record(pk_U2GS_IdentityPicUploadBegin_Request,{
	%% Byte 图片MD5(16byte)
	md5,
	%% UInt32 数据尺寸（单位字节）
	size,
	%% Boolean 0删除；1新增
	opType,
	%% Byte 在相册中的位置，从0开始，目前最大为2
	pos
}).

%% 
%% // 上传图片请求_数据
-define(CMD_U2GS_IdentityPicUploadData_Request,9005).
-record(pk_U2GS_IdentityPicUploadData_Request,{
	%% Byte 图片MD5(16byte)
	md5,
	%% UInt16 数据划分段数
	count,
	%% UInt16 数据段索引
	index,
	%% Byte 数据
	data
}).

%% 
%% // 查询身份证信息
-define(CMD_U2GS_Identity_Request,45328).
-record(pk_U2GS_Identity_Request,{
	%% UInt64 角色ID
	id
}).

%% 
%% // 购买商品成功后返回当日剩余可购次数
-define(CMD_GS2U_BuyItemQuotaNumber,56276).
-record(pk_GS2U_BuyItemQuotaNumber,{
	%% UInt16 商品ID
	itemid,
	%% Int32 本商品当日剩余可购次数
	quotaNumber
}).

%% 
-define(CMD_GS2U_LookInfoItemListAtMall,18589).
-record(pk_GS2U_LookInfoItemListAtMall,{
	%% LookInfoItemAtMall
	item_list
}).

%% 
-define(CMD_GS2U_LookInfoItemListAtNpcStore,4201).
-record(pk_GS2U_LookInfoItemListAtNpcStore,{
	%% UInt16商店类型
	storeType,
	%% LookInfoItem
	item_list
}).

%% 
%% // 返回神秘商店物品列表
-define(CMD_GS2U_MysteriousShop,60944).
-record(pk_GS2U_MysteriousShop,{
	%% UInt32 等级阶段
	lvlPhase,
	%% UInt32 下次刷新剩余秒数
	residueTime,
	%% MysteriousShopItem 物品列表
	items,
	%% Int32 刷新神秘商店需要消耗的非绑定钻石，0不消耗，-1不能刷新，>0需要消耗多少非绑定钻石
	freshMSShopDaimond
}).

%% 
-define(CMD_GS2U_SingleUseItem,63098).
-record(pk_GS2U_SingleUseItem,{
	%% UInt16 道具ID
	itemID
}).

%% 
-define(CMD_GS2U_UseItem,44334).
-record(pk_GS2U_UseItem,{
	%% UseItemCD 道具的CD信息
	vctUseItem
}).

%% 
-define(CMD_GS2U_UseItemExpInDanResult,32766).
-record(pk_GS2U_UseItemExpInDanResult,{
	%% UInt32 经验丹类型
	expInDanType,
	%% UInt32 经验丹剩余时间
	remainTime
}).

%% 
-define(CMD_GS2U_UseItemGainGoodsTips,28109).
-record(pk_GS2U_UseItemGainGoodsTips,{
	%% UseItemGainGoodsTips
	listTips
}).

%% 
-define(CMD_GS2U_UseItemResult,2331).
-record(pk_GS2U_UseItemResult,{
	%% UInt16 道具ID
	itemID,
	%% UInt16 道具数量
	itemNum,
	%% Int32
	result
}).

-record(pk_GiftItemInfo,{
	%% UInt16
	itemid,
	%% UInt16
	number
}).

-record(pk_LookInfoItem,{
	%% UInt16商品ID
	itemid,
	%% UInt32排序编号
	sortid,
	%% Byte货币类型
	type,
	%% UInt32价格
	value,
	%% Byte品质
	quality,
	%% UInt16使用等级
	useLevel,
	%% Int32 本商品当日剩余可购次数
	quotaNumber
}).

-record(pk_LookInfoItemAtMall,{
	%% UInt16商品ID
	itemid,
	%% Byte排序编号
	sortid,
	%% Byte货币类型
	type,
	%% UInt32价格
	value,
	%% UInt16余量
	stockCount,
	%% UInt16前多少销量送礼
	stockGiftCount,
	%% GiftItemInfo礼品列表
	gifts,
	%% UInt32开始时间
	saleStartTime,
	%% UInt32结束时间
	saleEndTime,
	%% Byte限购个数
	quotaNum
}).

-record(pk_MysteriousShopItem,{
	%% UInt32商品唯一ID标示
	only_id,
	%% UInt16商品ID
	itemid,
	%% Byte货币类型
	money_type,
	%% UInt32单价
	money,
	%% Int32允许购买个数，0不允许购买，-1无限购买，>0可购买指定个数
	number
}).

-record(pk_RefindResInfo,{
	%% UInt32 
	id,
	%% Int32 未完成次数
	number
}).

%% 
%% // 请求和返回资源找回列表， 请求时参数传NULL
-define(CMD_RefindResList,56898).
-record(pk_RefindResList,{
	%% RefindResInfo
	resList
}).

%% 
%% // 购买军团商品
-define(CMD_U2GS_BuyItemAtGuildShopRequest,61972).
-record(pk_U2GS_BuyItemAtGuildShopRequest,{
	%% UInt16商品ID
	itemid,
	%% UInt16购买数量
	number
}).

%% 
-define(CMD_U2GS_BuyItemAtMallRequest,18590).
-record(pk_U2GS_BuyItemAtMallRequest,{
	%% UInt16商品ID
	itemid,
	%% UInt16购买数量
	number
}).

%% 
-define(CMD_U2GS_BuyItemAtNpcStoreRequest,26641).
-record(pk_U2GS_BuyItemAtNpcStoreRequest,{
	%% UInt64Npc流水号
	npccode,
	%% UInt16商品ID
	itemid,
	%% UInt16购买数量
	number
}).

%% 
%% // 某商店并入玩家背包，故基于协议U2GS_BuyItemAtNpcStoreRequest
-define(CMD_U2GS_BuyItemAtShopIDRequest,18512).
-record(pk_U2GS_BuyItemAtShopIDRequest,{
	%% UInt64 商店ID
	shopID,
	%% UInt16商品ID
	itemid,
	%% UInt16购买数量
	number
}).

%% 
%% // 请求购买神秘商店商品
-define(CMD_U2GS_BuyMysteriousShopItem,65471).
-record(pk_U2GS_BuyMysteriousShopItem,{
	%% UInt32 等级阶段
	lvlPhase,
	%% UInt32 购买个数
	buynumber,
	%% UInt32 商品唯一ID标示
	only_id,
	%% UInt16 商品ID
	itemid
}).

%% 
-define(CMD_U2GS_ConvenientBuyItem,14404).
-record(pk_U2GS_ConvenientBuyItem,{
	%% UInt32 物品ID
	itemid,
	%% UInt32 购买个数
	buynumber
}).

%% 
%% // 请求手动立即刷新神秘商店
-define(CMD_U2GS_FreshMSShop,15024).
-record(pk_U2GS_FreshMSShop,{
}).

%% 
-define(CMD_U2GS_LookInfoItemListAtMall,31583).
-record(pk_U2GS_LookInfoItemListAtMall,{
}).

%% 
-define(CMD_U2GS_LookInfoItemListAtNpcStore,55371).
-record(pk_U2GS_LookInfoItemListAtNpcStore,{
	%% UInt64Npc流水号
	npccode
}).

%% 
%% // 某商店并入玩家背包，故基于协议U2GS_LookInfoItemListAtNpcStore修改
-define(CMD_U2GS_LookInfoItemListAtShopID,63472).
-record(pk_U2GS_LookInfoItemListAtShopID,{
	%% UInt64 商店ID
	shopID
}).

%% 
%% // 一键找回资源
-define(CMD_U2GS_RefindResAll,11479).
-record(pk_U2GS_RefindResAll,{
	%% Byte 0: 免费找回 1：钻石找回
	type
}).

%% 
%% // 找回单个资源
-define(CMD_U2GS_RefindResOne,10864).
-record(pk_U2GS_RefindResOne,{
	%% UInt32
	id,
	%% Byte 0: 免费找回 1：钻石找回
	type
}).

%% 
%% // 请求神秘商店商品列表
-define(CMD_U2GS_RequestMysteriousShop,4005).
-record(pk_U2GS_RequestMysteriousShop,{
}).

-record(pk_UseItemCD,{
	%% UInt16 道具组ID
	itemGroupID,
	%% UInt32 道具组剩余CD时间，单位：毫秒
	remainCDTime
}).

-record(pk_UseItemGainGoodsTips,{
	%% UInt32道具或者装备的ID
	itemID,
	%% UInt16道具或者装备的数量
	itemNum,
	%% Byte道具或者装备的品质
	quality,
	%% Byte是否绑定
	isBind
}).

%% 
%% //受赠获得幸运币
-define(CMD_GS2U_GainLuckyCoin,48806).
-record(pk_GS2U_GainLuckyCoin,{
	%% GainLuckyCoinInfo获得幸运币的信息
	gainLuckyCoinInfo,
	%% Int32目前幸运币数量
	count,
	%% UInt64
	time
}).

%% 
%% //赠送幸运币结果
-define(CMD_GS2U_GiveLuckyCoinResult,23997).
-record(pk_GS2U_GiveLuckyCoinResult,{
	%% UInt64赠予的朋友的id
	friendID,
	%% Byte0：赠送失败1：赠送成功2：对方今日幸运币满了
	result
}).

%% 
%% //进游戏时初始化受赠信息
-define(CMD_GS2U_InitGainLuckyCoinInfo,36672).
-record(pk_GS2U_InitGainLuckyCoinInfo,{
	%% GainLuckyCoinInfo
	gainLuckyCoinInfoList,
	%% Int32目前幸运币数量
	count,
	%% UInt64
	time
}).

%% 
%% //抽奖结果
-define(CMD_GS2U_LuckyDrawResult,38517).
-record(pk_GS2U_LuckyDrawResult,{
	%% Int32物品ID（道具ID是0默认失败，非0则是成功的）
	itemID,
	%% Int32目前幸运币数量
	count,
	%% UInt64
	time
}).

-record(pk_GainLuckyCoinInfo,{
	%% UInt32赠送的时间多少分钟
	time,
	%% UInt64赠送者
	friendID
}).

%% 
%% //赠送幸运币
-define(CMD_U2GS_GiveLuckyCoin,21846).
-record(pk_U2GS_GiveLuckyCoin,{
	%% UInt64赠予的朋友的id
	friendID
}).

%% 
%% //抽奖
-define(CMD_U2GS_LuckyDraw,61294).
-record(pk_U2GS_LuckyDraw,{
}).

%% 
%% //抽奖动画完
-define(CMD_U2GS_LuckyDrawEnd,5241).
-record(pk_U2GS_LuckyDrawEnd,{
}).

%% 
%% //一键赠送所有在线好友幸运币
-define(CMD_U2GS_OneKeyGiveLucky,25556).
-record(pk_U2GS_OneKeyGiveLucky,{
}).

%% 
%% // 服务器反馈获取邮件货币
-define(CMD_GS2U_DelMailCoin,50315).
-record(pk_GS2U_DelMailCoin,{
	%% UInt64 邮件ID
	mailID
}).

%% 
%% // 服务器反馈获取邮件附件
-define(CMD_GS2U_DelMailItem,42981).
-record(pk_GS2U_DelMailItem,{
	%% UInt64 邮件ID
	mailID,
	%% UInt64 附件中的道具UID
	itemUID
}).

%% 
%% // 服务回复删除邮件的ID
-define(CMD_GS2U_DeleteMail,14274).
-record(pk_GS2U_DeleteMail,{
	%% UInt64
	mailID
}).

%% 
%% // 服务器回复锁定邮件
-define(CMD_GS2U_LockMail,8814).
-record(pk_GS2U_LockMail,{
	%% retMailOpt
	ret
}).

%% 
%% //邮件详细信息
-define(CMD_GS2U_Mail,507).
-record(pk_GS2U_Mail,{
	%% MailDetail
	detail
}).

%% 
%% // 服务器发送给客户端的邮件信息列表
-define(CMD_GS2U_MailInfo,3365).
-record(pk_GS2U_MailInfo,{
	%% MailInfo
	mailInfoList
}).

%% 
%% // 客户端发送或者回复邮件，服务器的反馈信息
-define(CMD_GS2U_SendMailAck,10374).
-record(pk_GS2U_SendMailAck,{
	%% String发送时的目标名字
	toRoleName,
	%% Boolean成功为1，失败为0
	isOK
}).

%% 
%% // 服务器回复解除锁定邮件
-define(CMD_GS2U_UnlockMail,47879).
-record(pk_GS2U_UnlockMail,{
	%% retMailOpt
	ret
}).

-record(pk_MailCoin,{
	%% Byte 货币类型：1.金币，2.绑定金币，3.钻石，4.声望，5.荣誉，6.点券，7.紫色精华，8.金色精华
	coinType,
	%% UInt32 货币数量
	coinNum
}).

-record(pk_MailDetail,{
	%% UInt64 邮件ID
	mailID,
	%% UInt64 发送人的ID，系统邮件为0
	sendRoleID,
	%% Boolean 是否锁定
	isLocked,
	%% Byte 邮件还可以保留的天数
	remainDay,
	%% String 发送人的名字，系统邮件为空
	sendPlayerName,
	%% String 邮件标题
	mailTitle,
	%% String 邮件内容
	mailContent,
	%% MailItem 邮件的道具附件
	itemList,
	%% MailCoin 邮件的货币附件
	coinList
}).

-record(pk_MailInfo,{
	%% UInt64 邮件ID
	mailID,
	%% String 邮件标题
	mailTitle,
	%% UInt64 阅读时间
	mailReadTime,
	%% UInt64 发送时间
	mailSendTime,
	%% Boolean true 有附件，false无附件
	ishaveAttach,
	%% String 发送者名字，如果是系统邮件则为空
	senderName
}).

-record(pk_MailItem,{
	%% UInt64物品uid
	itemUID,
	%% UInt32道具编号ID
	itemID,
	%% UInt32堆叠个数
	itemNumber,
	%% Byte品质
	quality,
	%% Boolean 是否绑定
	isBind
}).

%% 
%% // 客户端删除所有已读且无附件的邮件
-define(CMD_U2GS_DeleteAllReadMail,23877).
-record(pk_U2GS_DeleteAllReadMail,{
}).

%% 
%% // 客户端删除邮件
-define(CMD_U2GS_DeleteMail,46884).
-record(pk_U2GS_DeleteMail,{
	%% UInt64 邮件ID
	mailID
}).

%% 
%% // 客户端获取邮件货币
-define(CMD_U2GS_GetMailCoin,63480).
-record(pk_U2GS_GetMailCoin,{
	%% UInt64 邮件ID
	mailID
}).

%% 
%% // 客户端获取邮件附件
-define(CMD_U2GS_GetMailItem,56146).
-record(pk_U2GS_GetMailItem,{
	%% UInt64 邮件ID
	mailID,
	%% UInt64 附件中的道具UID
	itemUID
}).

%% 
%% // 客户端锁定邮件
-define(CMD_U2GS_LockMail,15616).
-record(pk_U2GS_LockMail,{
	%% UInt64 邮件ID
	mailID
}).

%% 
%% // 客户端阅读邮件
-define(CMD_U2GS_ReadMail,24463).
-record(pk_U2GS_ReadMail,{
	%% UInt64 邮件ID
	mailID
}).

%% 
%% // 客户端发送新邮件
-define(CMD_U2GS_SendMail,64073).
-record(pk_U2GS_SendMail,{
	%% String 收信人名字
	toRoleName,
	%% String 邮件标题
	mailTitle,
	%% String 邮件内容
	mailContent
}).

%% 
%% // 客户端解除锁定邮件
-define(CMD_U2GS_UnlockMail,14953).
-record(pk_U2GS_UnlockMail,{
	%% UInt64 邮件ID
	mailID
}).

-record(pk_retMailOpt,{
	%% UInt64 邮件ID
	mailID,
	%% Boolean 是否成功
	result
}).

%% 
%% //商城购买返回结果
-define(CMD_GS2U_MallBuyResult,2111).
-record(pk_GS2U_MallBuyResult,{
	%% UInt32
	db_id,
	%% UInt320购买失败
	buyCount
}).

%% 
%% //商城购买返回结果
-define(CMD_GS2U_MallBuyResult2,54231).
-record(pk_GS2U_MallBuyResult2,{
	%% UInt32
	db_id,
	%% UInt320购买失败
	buyCount
}).

%% 
%% //商城列表
-define(CMD_GS2U_MallInfoList,48388).
-record(pk_GS2U_MallInfoList,{
	%% Int32
	seed,
	%% MallInfo
	mallinfolist
}).

%% 
%% //商城列表
-define(CMD_GS2U_MallInfoList2,60566).
-record(pk_GS2U_MallInfoList2,{
	%% Int32
	seed,
	%% MallInfo
	mallinfolist
}).

%% 
%% //商城优惠列表
-define(CMD_GS2U_MallPriceList,23547).
-record(pk_GS2U_MallPriceList,{
	%% MallInfo
	mallinfolist
}).

%% 
%% //杨传龙不同意修改消息，此处作冗余处理
%% //商城优惠列表
-define(CMD_GS2U_MallPriceList2,17483).
-record(pk_GS2U_MallPriceList2,{
	%% MallInfo
	mallinfolist
}).

-record(pk_MallInfo,{
	%% UInt32商品唯一标识码 itemid+type+submenu
	db_id,
	%% UInt32
	itemid,
	%% UInt16默认购买数量
	buyNumDefalut,
	%% SByte主菜单 物品类型	优惠:1|成长:2|时装:3|积分:4
	mainmenu,
	%% SByte子菜单，每个type下面的分类选项
	submenu,
	%% Int32非绑定钻石售价  非绑定钻石:3
	gold,
	%% Int32绑定钻石	 	绑定钻石:6
	bind_gold,
	%% Int32积分购买
	use_integral,
	%% Int32可以获得的积分
	get_integral,
	%% Int32购买结束倒计时	单位:s
	lefttime,
	%% Int32限购剩余数
	leftcount,
	%% Int32排序号
	sortNumber,
	%% SByte打折				default:100
	rebate,
	%% SByte显示状态
	showtype,
	%% SByte限制类型 0为不限购 1为玩家角色限购 2全服务器限购 3为玩家角色每日限购
	limitType
}).

%% 
%% //购买请求   同一页面不能有同一种ID的道具
-define(CMD_U2GS_ItemBuyRequest,57190).
-record(pk_U2GS_ItemBuyRequest,{
	%% UInt32
	db_id,
	%% UInt32
	itemid,
	%% Int32
	itemnum,
	%% SByte金钱类型，
	moneytype,
	%% UInt640,给自己， 否则给其他人买
	tarRoleID
}).

%% 
%% //购买请求   同一页面不能有同一种ID的道具
-define(CMD_U2GS_ItemBuyRequest2,50460).
-record(pk_U2GS_ItemBuyRequest2,{
	%% UInt32
	db_id,
	%% UInt32
	itemid,
	%% Int32
	itemnum,
	%% SByte金钱类型，
	moneytype
}).

%% 
%% //打开请求
-define(CMD_U2GS_MallInfo,33516).
-record(pk_U2GS_MallInfo,{
	%% Int32第一次请求上传0
	seed
}).

%% 
%% //打开请求
-define(CMD_U2GS_MallInfo2,9678).
-record(pk_U2GS_MallInfo2,{
	%% Int32第一次请求上传0
	seed
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% // 不推荐使用 <->
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // _Request 表示客户端向服务端进行请求
%% // _Ack			表示服务端对客户端请求的反馈
%% // _Ask			表示服务端向客户端询问
%% // _Reply		表示客户端对服务端询问的反馈
%% // _Sync		表示即便客户端没有向服务端进行请求，服务端也可能主动发送该消息以同步信息
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 同步姻缘基本信息（上线后会同步，后面会在变化时同步）
-define(CMD_GS2U_MarriageBaseInfo_Sync,14801).
-record(pk_GS2U_MarriageBaseInfo_Sync,{
	%% UInt64 配偶角色ID（无配偶时为0）
	id,
	%% String 配偶角色姓名
	name,
	%% Byte 配偶性别
	sex,
	%% UInt32 结婚时间（服务器同步时间，自1970-01-01至今的秒数）
	weddingDay,
	%% UInt32 亲密度
	closeness
}).

%% 
%% // 申请（或确认）离婚反馈
-define(CMD_GS2U_MarriageBreak_Ack,40356).
-record(pk_GS2U_MarriageBreak_Ack,{
	%% UInt64 对方角色ID
	id,
	%% String 对方角色姓名
	name
}).

%% 
%% // 成功发送求婚请求的反馈，用于客户端刷新界面
-define(CMD_GS2U_MarriageProposeRefresh_Ack,44645).
-record(pk_GS2U_MarriageProposeRefresh_Ack,{
}).

%% 
%% // 反馈求婚结果（成功时反馈双方，失败时仅反馈求婚者）
-define(CMD_GS2U_MarriagePropose_Ack,25550).
-record(pk_GS2U_MarriagePropose_Ack,{
	%% UInt64 求婚者（或被求婚者）角色ID
	id,
	%% String 求婚者（或被求婚者）角色姓名
	name,
	%% UInt32 求婚者使用道具ID
	item,
	%% Boolean 是否成功
	isS
}).

%% 
%% // 询问目标是否接受求婚请求
-define(CMD_GS2U_MarriagePropose_Ask,23358).
-record(pk_GS2U_MarriagePropose_Ask,{
	%% UInt64 求婚者角色ID
	id,
	%% String 求婚者角色姓名
	name,
	%% UInt32 求婚者使用道具ID
	item,
	%% String 求婚宣言
	manifesto
}).

%% 
%% // 伴侣的婚戒升级及突破同步（上线后会同步，后面会在变化时同步）
%% // 为避免显示混乱，不在客户端显示伴侣婚戒加成的具体属性
%% // 该协议已废弃
-define(CMD_GS2U_MarriageRingUpPartner_Sync,42904).
-record(pk_GS2U_MarriageRingUpPartner_Sync,{
	%% UInt32 旧有突破次数
	topOld,
	%% UInt32 旧有婚戒经验
	expOld,
	%% UInt32 旧有婚戒等级
	lvOld,
	%% UInt32 新的突破次数
	topNew,
	%% UInt32 新的婚戒经验
	expNew,
	%% UInt32 新的婚戒等级
	lvNew
}).

%% 
%% // 婚戒升级及突破同步（上线后会同步，后面会在变化时同步）
-define(CMD_GS2U_MarriageRingUp_Sync,24857).
-record(pk_GS2U_MarriageRingUp_Sync,{
	%% UInt32 旧有突破次数
	topOld,
	%% UInt32 旧有婚戒经验
	expOld,
	%% UInt32 旧有婚戒等级
	lvOld,
	%% UInt32 新的突破次数
	topNew,
	%% UInt32 新的婚戒经验
	expNew,
	%% UInt32 新的婚戒等级
	lvNew
}).

%% 
-define(CMD_GS2U_MarriageSkillUp_Ack,37984).
-record(pk_GS2U_MarriageSkillUp_Ack,{
	%% SkillInfoForMarraige
	skill,
	%% UInt32 旧有等级
	lvOld,
	%% UInt32 新的等级
	lvNew,
	%% UInt32 旧有经验
	expOld
}).

%% 
%% // 同步夫妻技能信息
-define(CMD_GS2U_MarriageSkill_Sync,46119).
-record(pk_GS2U_MarriageSkill_Sync,{
	%% SkillInfoForMarraige
	listSkill
}).

-record(pk_SkillInfoForMarraige,{
	%% UInt32 技能槽位ID
	id,
	%% UInt32 技能槽位经验
	exp
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 接受情缘任务（任务ID由系统自动分配）
-define(CMD_U2GS_MarriageAcceptTask_Request,29341).
-record(pk_U2GS_MarriageAcceptTask_Request,{
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 申请（或确认）离婚请求
-define(CMD_U2GS_MarriageBreak_Request,60471).
-record(pk_U2GS_MarriageBreak_Request,{
	%% Boolean 是否为协议离婚
	isTeam
}).

%% 
%% // 目标反馈是否接受求婚请求
-define(CMD_U2GS_MarriagePropose_Reply,4641).
-record(pk_U2GS_MarriagePropose_Reply,{
	%% UInt64 求婚者角色ID
	id,
	%% Boolean 是否同意
	isAgreed
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 求婚请求
-define(CMD_U2GS_MarriagePropose_Request,49410).
-record(pk_U2GS_MarriagePropose_Request,{
	%% UInt64 对方角色ID
	id,
	%% UInt32 求婚者使用道具ID
	item,
	%% String 求婚宣言
	manifesto
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 婚戒升级及突破请求
-define(CMD_U2GS_MarriageRingUp_Request,7339).
-record(pk_U2GS_MarriageRingUp_Request,{
	%% UInt32 消耗亲密度（为0时突破）
	cost
}).

%% 
%% /////////////////////////////////////////////////////////////////////////////////////
%% // 夫妻技能升级请求
-define(CMD_U2GS_MarriageSkillUp_Request,35764).
-record(pk_U2GS_MarriageSkillUp_Request,{
	%% UInt32 消耗亲密度
	cost,
	%% UInt32 升级的目标技能槽位
	id
}).

%% 
%% // 提交情缘任务（任务ID由系统自己找）
-define(CMD_U2GS_MarriageSubmitTask_Request,19197).
-record(pk_U2GS_MarriageSubmitTask_Request,{
}).

%% 
%% //坐骑
-define(CMD_GS2U_LookMountInfo,39712).
-record(pk_GS2U_LookMountInfo,{
	%% MountInfo坐骑信息列表
	mountInfo
}).

%% 
%% //服务器返回坐骑系列操作结果（广播给其它玩家）
-define(CMD_GS2U_MountAck,46932).
-record(pk_GS2U_MountAck,{
	%% UInt64主人CODE
	code,
	%% UInt16坐骑ID
	shape_id,
	%% UInt321:上坐骑2:下坐骑
	opreate
}).

%% 
%% //坐骑的外观列表(玩家获取的外观，包括购买的和升级获得的)
-define(CMD_GS2U_MountShapeList,57298).
-record(pk_GS2U_MountShapeList,{
	%% UInt16
	shape_list
}).

%% 
%% // 玩家获得新的坐骑外观
-define(CMD_GS2U_NewMountShape,476).
-record(pk_GS2U_NewMountShape,{
	%% UInt16
	new_shape_id
}).

-record(pk_MountInfo,{
	%% Byte 坐骑等级
	level,
	%% Byte 坐骑状态0:休息1:召唤
	state,
	%% UInt32 坐骑当前进度
	curProcess,
	%% UInt16 坐骑外观（升级之后可能改变）
	shape_id
}).

%% 
%% // 坐骑易容
-define(CMD_MountShapeShift,10618).
-record(pk_MountShapeShift,{
	%% UInt16新的外观ID
	new_shape_id
}).

%% 
%% // 坐骑喂养
-define(CMD_U2GS_FeedMount,44309).
-record(pk_U2GS_FeedMount,{
	%% UInt16喂养数量
	feedNum
}).

%% 
%% //下坐骑
-define(CMD_U2GS_OffMount,23484).
-record(pk_U2GS_OffMount,{
}).

%% 
%% //上坐骑
-define(CMD_U2GS_OnMount,60500).
-record(pk_U2GS_OnMount,{
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // npc瞬间移动消息
-define(CMD_GS2U_NpcMomentMove,46886).
-record(pk_GS2U_NpcMomentMove,{
	%% UInt64 npcCode
	npcCode,
	%% UInt32 npcid
	npcID,
	%% Single 目标X
	tX,
	%% Single 目标Y
	tY
}).

%% 
%% // npc同步称号改变
-define(CMD_GS2U_NpcTitleChange,25583).
-record(pk_GS2U_NpcTitleChange,{
	%% NpcTitle
	npclists
}).

%% 
%% // 返回时空裂痕npc的信息
-define(CMD_GS2U_RequestRiftNpcInfo,26415).
-record(pk_GS2U_RequestRiftNpcInfo,{
	%% UInt64
	npcCode,
	%% UInt32
	npcID,
	%% UInt32 时空裂痕今日剩余可领奖次数
	surplusTimes,
	%% UInt32 时空裂痕npc消失剩余时间(秒s)
	disappearTime,
	%% UInt64 时空分组ID
	groupID,
	%% UInt32 时空的位面ID
	bitplaneMapID
}).

-record(pk_NpcTitle,{
	%% UInt64 npccode
	npccode,
	%% String npc新称号
	new_title
}).

%% 
%% // 请求进入时空裂痕
-define(CMD_U2GS_RequestEnterRift,61996).
-record(pk_U2GS_RequestEnterRift,{
	%% UInt64 时空分组ID
	groupID,
	%% UInt32 时空的位面ID
	bitplaneMapID
}).

%% 
%% // 请求时空裂痕npc的信息
-define(CMD_U2GS_RequestRiftNpcInfo,18129).
-record(pk_U2GS_RequestRiftNpcInfo,{
	%% UInt64 npcCode
	npcCode
}).

-record(pk_AddProp,{
	%% Byte
	prop,
	%% Single
	value
}).

-record(pk_AssistBattleInfo,{
	%% UInt16宠物ID
	petID,
	%% Byte位置
	slot
}).

-record(pk_CatalogNode,{
	%% UInt16 章节ID 参考petWar表
	id,
	%% Byte 星级	
	starLevel
}).

%% 
%% // 同步当前奖励的级别	触发时机：1 登陆 2 领取奖励成功
-define(CMD_GS2U_AckRewardLevel,34380).
-record(pk_GS2U_AckRewardLevel,{
	%% Byte 奖励级别
	rewardLevel
}).

%% 
%% // 响应排位
-define(CMD_GS2U_AckStandSort,24891).
-record(pk_GS2U_AckStandSort,{
	%% UInt16
	petList
}).

%% 
%% // 购买体力信息			触发时机: 每次请求购买时
-define(CMD_GS2U_BuyPowerInfo,60009).
-record(pk_GS2U_BuyPowerInfo,{
	%% Int32 本次购买的费用
	money,
	%% SByte 可购买总数
	allCount,
	%% SByte 当前可购买数
	curCount
}).

%% 
%% // 双人坐骑邀请
-define(CMD_GS2U_DoublePetMountInvite,59136).
-record(pk_GS2U_DoublePetMountInvite,{
	%% UInt16
	petID,
	%% String
	srcName,
	%% UInt64
	srcRoleID
}).

%% 
-define(CMD_GS2U_FindTerritoryFailed_Ack,10728).
-record(pk_GS2U_FindTerritoryFailed_Ack,{
	%% UInt32 错误码
	errorCode
}).

%% 
-define(CMD_GS2U_FindTerritory_Ack,35119).
-record(pk_GS2U_FindTerritory_Ack,{
	%% TerritoryInfo 领地信息
	info,
	%% PetTerritoryInfo 驻守骑宠信息
	listInfo,
	%% UInt64 角色ID
	roleID,
	%% String 角色姓名
	roleName,
	%% UInt32 当日已搜索次数
	count
}).

%% 
%% //服务器返回坐骑系列操作结果（广播给其它玩家）
%% //需要广播给主人周围的玩家
-define(CMD_GS2U_OffMountPetAck,34800).
-record(pk_GS2U_OffMountPetAck,{
	%% UInt64主人CODE
	code,
	%% Single
	x,
	%% Single
	y
}).

%% 
%% //服务器返回坐骑系列操作结果（广播给其它玩家）
%% //既要广播要主人周围的玩家也需要广播给宠物周围的玩家
-define(CMD_GS2U_OnMountPetAck,57812).
-record(pk_GS2U_OnMountPetAck,{
	%% UInt64主人CODE
	ownerCode,
	%% UInt64宠物Code
	petCode,
	%% UInt16宠物ID
	petId,
	%% UInt64客人code
	guestCode
}).

%% 
-define(CMD_GS2U_PVEBattleResult,35792).
-record(pk_GS2U_PVEBattleResult,{
	%% SByte 战斗结果 0：胜利 1:失败
	res,
	%% Int32 奖励金钱
	coin,
	%% Int32 奖励经验
	exp,
	%% SByte 通关评分
	score,
	%% PveItem 物品列表
	itemList
}).

%% 
%% //宠物属性提升结果
-define(CMD_GS2U_PetAddAttaRes,47446).
-record(pk_GS2U_PetAddAttaRes,{
	%% UInt16
	petID,
	%% AddProp
	propList
}).

%% 
%% // 助战信息
-define(CMD_GS2U_PetAssistInit,34712).
-record(pk_GS2U_PetAssistInit,{
	%% AssistBattleInfo
	infoList
}).

%% 
%% //更新孔位
-define(CMD_GS2U_PetAssistUpdateSlot,21727).
-record(pk_GS2U_PetAssistUpdateSlot,{
	%% Byte位置
	slot,
	%% UInt16宠物ID
	petID
}).

%% 
%% //宠物属性保存结果
-define(CMD_GS2U_PetAttaSaveRes,47132).
-record(pk_GS2U_PetAttaSaveRes,{
	%% UInt16
	petID,
	%% AddProp
	propList
}).

%% 
%% // 更新单个宠物
-define(CMD_GS2U_PetBaseInfo,53506).
-record(pk_GS2U_PetBaseInfo,{
	%% PetBaseInfo
	info
}).

%% 
%% // 宠物装备信息列表
-define(CMD_GS2U_PetEquipInfoList,28857).
-record(pk_GS2U_PetEquipInfoList,{
	%% PetEquipInfo
	petEquipInfoList
}).

%% 
%% // 宠物精灵信息
-define(CMD_GS2U_PetFairyInfo,17380).
-record(pk_GS2U_PetFairyInfo,{
	%% Int32
	point,
	%% Int16
	level
}).

%% 
%% // 更新所有宠物
-define(CMD_GS2U_PetInfoList,48755).
-record(pk_GS2U_PetInfoList,{
	%% PetBaseInfo
	petInfoList
}).

%% 
%% //扫荡结果
-define(CMD_GS2U_PetPveSweepAck,17437).
-record(pk_GS2U_PetPveSweepAck,{
	%% PveSweep
	sweepList
}).

%% 
%% //广播玩家宠物改名
-define(CMD_GS2U_PetReName,21657).
-record(pk_GS2U_PetReName,{
	%% UInt64
	code,
	%% String
	name
}).

%% 
%% // 洗练宠物技能结果
-define(CMD_GS2U_PetSkillCastResult,30326).
-record(pk_GS2U_PetSkillCastResult,{
	%% UInt16
	petID,
	%% PetSkillCastResult
	skillList
}).

%% 
%% //宠物睡眠，需要广播给宠物周围的玩家以及主人本人
-define(CMD_GS2U_PetSleep,1492).
-record(pk_GS2U_PetSleep,{
	%% UInt64宠物
	code
}).

%% 
%% //宠物强化结果
-define(CMD_GS2U_PetStrAck,44599).
-record(pk_GS2U_PetStrAck,{
	%% PetEquipInfo
	petEquipInfo
}).

%% 
%% //获取骑宠Pvp信息结果
-define(CMD_GS2U_PvpBattleInfoRes,51608).
-record(pk_GS2U_PvpBattleInfoRes,{
	%% Byte抢夺令
	reel,
	%% UInt16宠物列表
	pl,
	%% UInt16积分
	point,
	%% PvPCityInfo城池列表
	cl,
	%% PvpBattleReportInfo战报列表
	bpl
}).

%% 
%% // 战报提示
-define(CMD_GS2U_PvpBattleReportTip,13533).
-record(pk_GS2U_PvpBattleReportTip,{
}).

%% 
%% //  战斗结果
-define(CMD_GS2U_PvpBattleResult,31631).
-record(pk_GS2U_PvpBattleResult,{
	%% SByte 战斗结果 0：胜利 1:失败
	res,
	%% Int32 奖励金钱
	coin,
	%% Int32 奖励经验
	exp,
	%% PvPCityInfo 战斗结果城池信息
	pi
}).

%% 
%% // 更新战报
-define(CMD_GS2U_PvpBattleUpdateReport,64919).
-record(pk_GS2U_PvpBattleUpdateReport,{
	%% PvpBattleReportInfo
	br
}).

%% 
%% // 宠物位置保存结果
-define(CMD_GS2U_PvpPosSaveAck,36170).
-record(pk_GS2U_PvpPosSaveAck,{
	%% UInt16
	petList
}).

%% 
-define(CMD_GS2U_QueryTerritoryHistory_Ack,48208).
-record(pk_GS2U_QueryTerritoryHistory_Ack,{
	%% Boolean true掠夺记录；false防守记录
	attackOrDefense,
	%% UInt32 攻防次数
	fightCount,
	%% TerritoryHistoryCell 战胜（战败）记录
	listInfo
}).

%% 
-define(CMD_GS2U_QueryTerritoryInfo_Ack,37326).
-record(pk_GS2U_QueryTerritoryInfo_Ack,{
	%% TerritoryInfo 领地列表
	listTerritory,
	%% PetTerritoryInfo 骑宠列表
	listPet
}).

%% 
%% // 宠物转生成功
-define(CMD_GS2U_RawPetResult,17816).
-record(pk_GS2U_RawPetResult,{
	%% UInt16
	petID,
	%% Byte当前转生等级
	curRaw
}).

%% 
%% // 20170324需求补充及变更
%% // 领地战斗心跳
-define(CMD_GS2U_TerritoryBattle_Tick_Sync,48052).
-record(pk_GS2U_TerritoryBattle_Tick_Sync,{
	%% UInt32 当前状态剩余时间
	time,
	%% UInt32 活动剩余总时间
	timeAll,
	%% Byte 2战斗前等待；3战斗；4结算
	state
}).

%% 
%% // 20170323需求变更
%% // 服务端需要通知客户端是否存在开采结束的领地
-define(CMD_GS2U_TerritoryExploitEnd_Sync,21088).
-record(pk_GS2U_TerritoryExploitEnd_Sync,{
}).

%% 
-define(CMD_GS2U_TerritoryExploit_Ack,62071).
-record(pk_GS2U_TerritoryExploit_Ack,{
	%% TerritoryInfo 刷新该领地数据
	info,
	%% PetTerritoryInfo 刷新部分骑宠数据
	listInfo
}).

%% 
-define(CMD_GS2U_TerritoryPlunder_Ack,24508).
-record(pk_GS2U_TerritoryPlunder_Ack,{
	%% UInt32 等级段配置，对应pet_territory_reward.id
	cfgReward,
	%% UInt32 掠夺数量1 注：如count1和count2都为0，则掠夺失败
	count1,
	%% UInt32 掠夺数量2
	count2
}).

%% 
-define(CMD_GS2U_TerritoryVigor_Ack,28079).
-record(pk_GS2U_TerritoryVigor_Ack,{
	%% UInt32
	vigor
}).

%% 
%% // 宠物升星成功
-define(CMD_GS2U_UpStartPetResult,37149).
-record(pk_GS2U_UpStartPetResult,{
	%% UInt16
	petID,
	%% Byte当前星级
	curStar,
	%% UInt16宠物技能ID
	petSkillID
}).

%% 
%% // 同步章节目录			触发时机：1 登陆
-define(CMD_GS2U_UpdateCatalogList,34854).
-record(pk_GS2U_UpdateCatalogList,{
	%% CatalogNode 章节列表
	catalogList
}).

%% 
%% //更新宠物状态
-define(CMD_GS2U_UpdatePetStatus,62688).
-record(pk_GS2U_UpdatePetStatus,{
	%% UInt16宠物ID
	petID,
	%% Byte宠物状态
	status
}).

%% 
%% // 同步体力				触发时机: 1 周期性同步，时间周期待定 2 购买体力时同步
-define(CMD_GS2U_UpdatePower,23580).
-record(pk_GS2U_UpdatePower,{
	%% Int32 体力
	power
}).

%% 
%% // 同步抢夺令(自动回复和购买)				
-define(CMD_GS2U_UpdateReel,19087).
-record(pk_GS2U_UpdateReel,{
	%% SByte 抢夺令
	reel
}).

%% 
%% // 使用宠物技能书
-define(CMD_GS2U_UsePetSkillBook,46038).
-record(pk_GS2U_UsePetSkillBook,{
	%% UInt16宠物ID
	petID,
	%% UInt16宠物技能ID
	oldSkillId,
	%% UInt16宠物技能ID
	newSkillId,
	%% UInt16宠物技能等级
	newSkillLevel
}).

-record(pk_PetBaseInfo,{
	%% UInt16宠物ID
	petID,
	%% Byte宠物星阶
	petStar,
	%% Byte宠物是否出战 0:休息(非助战) 1:休息(助战)2:出战（非召唤）3:出战（召唤）
	status,
	%% PetSkillBaseInfo
	skillList,
	%% String宠物名字
	petName,
	%% Byte宠物转生
	petRaw,
	%% UInt64宠物到期时间
	petTime,
	%% AddProp宠物属性
	petProps,
	%% UInt64宠物战斗力
	petForce
}).

-record(pk_PetEquipInfo,{
	%% Byte宠物装备ID
	equipID,
	%% Byte宠物装备等级
	equipLv
}).

%% 
%% //宠物改名
-define(CMD_PetReName,31697).
-record(pk_PetReName,{
	%% UInt16宠物ID
	petID,
	%% String宠物名字
	name
}).

-record(pk_PetSkillBaseInfo,{
	%% Byte宠物技能序号
	petSkillIndex,
	%% UInt16宠物技能ID
	petSkillId,
	%% UInt16宠物技能Cd
	petSkillCd,
	%% Byte宠物技能Type 0:天赋技能 1:通用技能 2:基础技能
	petSkillType,
	%% Byte宠物技能等级
	petSkillLv,
	%% Byte宠物技能是否解锁
	petSkillIsUnlock
}).

-record(pk_PetSkillCastResult,{
	%% UInt16
	oldSkillID,
	%% UInt16
	newSkillID,
	%% UInt16
	newSkillLevel
}).

%% 
%% // 替换宠物技能
-define(CMD_PetSkillReplace,62742).
-record(pk_PetSkillReplace,{
	%% UInt16
	petID
}).

%% 
%% // 切换宠物
-define(CMD_PetSwitch,22375).
-record(pk_PetSwitch,{
	%% UInt16宠物ID
	petId
}).

-record(pk_PetTerritoryInfo,{
	%% UInt16 骑宠ID
	petID,
	%% UInt64 骑宠战力
	petForce,
	%% UInt32 驻派领地ID（为0时表示未驻派）
	territoryID,
	%% Byte 星级
	star,
	%% Byte 转生
	raw
}).

-record(pk_PvPCityInfo,{
	%% Byte城池ID
	cityID,
	%% UInt64城池占领时间
	cityTime,
	%% UInt64占领者ID
	roleID,
	%% UInt32城池护盾值
	cityHp,
	%% UInt32城池最大值
	cityMax,
	%% UInt32战斗力
	force,
	%% String占领者名字
	roleName,
	%% UInt16占领者宠物ID
	petList
}).

-record(pk_PveItem,{
	%% Int16
	id,
	%% Int16
	num
}).

-record(pk_PveSweep,{
	%% Byte扫荡次数
	num,
	%% Int32 奖励金钱
	coin,
	%% Int32 奖励经验
	exp,
	%% PveItem 物品列表
	itemList
}).

-record(pk_PvpBattleReportInfo,{
	%% UInt64战报时间
	time,
	%% Byte1:占领空城 2:收益 3:防守失败 4:攻城失败 5:防守胜利 6:攻城胜利
	type,
	%% Byte城池ID
	cityID,
	%% UInt64占领者ID
	roleID,
	%% String占领者名字
	roleName
}).

-record(pk_TerritoryHistoryCell,{
	%% UInt32 攻防时间
	time,
	%% String 角色姓名
	roleName,
	%% UInt64 角色ID
	roleID,
	%% UInt32 领地ID
	territoryID,
	%% UInt32 等级段配置，对应pet_territory_reward.id
	cfgReward,
	%% UInt32 掠夺数量1，对应pet_territory_reward.reward
	count1,
	%% UInt32 掠夺数量2，对应pet_territory_reward.reward
	count2
}).

-record(pk_TerritoryInfo,{
	%% UInt32 领地ID
	territoryID,
	%% UInt32 等级段配置，对应pet_territory_reward.id
	cfgReward,
	%% UInt32 开采时间配置，对应pet_territory_time.id
	cfgTime,
	%% UInt32 领地等级配置，对应pet_territory_level.id
	cfgLevel,
	%% UInt32 战力等级段配置，对应pet_territory_force.id
	cfgForce,
	%% UInt32 领地最近的刷新时间，用以计算奖励
	timeFresh,
	%% UInt32 开采结束时间
	timeEnd,
	%% UInt32 奖励数量1，对应pet_territory_reward.reward
	rewardCount1,
	%% UInt32 奖励数量2，对应pet_territory_reward.reward
	rewardCount2,
	%% UInt32 安全保护时间
	timeSafe,
	%% UInt32 搜索保护时间
	timeSearch
}).

%% 
%% // 购买体力
-define(CMD_U2GS_BuyPower,46993).
-record(pk_U2GS_BuyPower,{
}).

%% 
%% // 购买抢夺令
-define(CMD_U2GS_BuyReel,63174).
-record(pk_U2GS_BuyReel,{
}).

%% 
%% // 双人坐骑邀请
-define(CMD_U2GS_DoublePetMountInvite,26098).
-record(pk_U2GS_DoublePetMountInvite,{
	%% UInt64
	tarRoleID
}).

%% 
%% // 回应双人坐骑
-define(CMD_U2GS_DoublePetMountInviteAck,495).
-record(pk_U2GS_DoublePetMountInviteAck,{
	%% SByte
	agree,
	%% UInt64
	srcRoleID
}).

%% 
%% // 搜索别人的领地
-define(CMD_U2GS_FindTerritory_Request,34435).
-record(pk_U2GS_FindTerritory_Request,{
	%% UInt64 角色ID，为0时执行普通搜索，消费参考pet_territory_search，当日已搜索次数参考每日计数8；不为0时针对性反掠夺搜索
	roleID
}).

%% 
%% //隐藏宠物
-define(CMD_U2GS_HideMountPet,49046).
-record(pk_U2GS_HideMountPet,{
}).

%% 
%% //下骑宠
-define(CMD_U2GS_OffMountPet,49531).
-record(pk_U2GS_OffMountPet,{
}).

%% 
%% //上骑宠
-define(CMD_U2GS_OnMountPet,55043).
-record(pk_U2GS_OnMountPet,{
}).

%% 
%% //宠物属性提升
-define(CMD_U2GS_PetAddAtta,15608).
-record(pk_U2GS_PetAddAtta,{
	%% UInt16宠物ID
	petID,
	%% Byte宠物属性提升次数
	num
}).

%% 
%% //宠物助战
-define(CMD_U2GS_PetAssistBattle,51118).
-record(pk_U2GS_PetAssistBattle,{
	%% UInt16宠物ID
	petID,
	%% Byte位置
	slot,
	%% Byte0取消助战 1助战
	status
}).

%% 
%% //宠物属性保存
-define(CMD_U2GS_PetAttaSave,38254).
-record(pk_U2GS_PetAttaSave,{
	%% UInt16
	petID
}).

%% 
%% //防止野生宠物 强制消失野生宠物
-define(CMD_U2GS_PetDisapear,12890).
-record(pk_U2GS_PetDisapear,{
	%% UInt64
	code
}).

%% 
%% // 扫荡
-define(CMD_U2GS_PetPveSweep,6146).
-record(pk_U2GS_PetPveSweep,{
	%% UInt16副本ID
	id
}).

%% 
%% // 洗炼宠物技能
-define(CMD_U2GS_PetSkillCast,60947).
-record(pk_U2GS_PetSkillCast,{
	%% UInt16
	petID,
	%% UInt16技能ID列表
	skillIDs
}).

%% 
%% //宠物强化
-define(CMD_U2GS_PetStr,27916).
-record(pk_U2GS_PetStr,{
	%% Byte装备ID
	equipID,
	%% Byte0:普通强化 1:一键强化
	type
}).

%% 
%% //获取骑宠Pvp信息
-define(CMD_U2GS_PvpBattleInfo,30930).
-record(pk_U2GS_PvpBattleInfo,{
}).

%% 
%% // 宠物位置保存
-define(CMD_U2GS_PvpPosSave,46437).
-record(pk_U2GS_PvpPosSave,{
	%% UInt16
	petList
}).

%% 
%% // 查询宠物精灵信息
-define(CMD_U2GS_QueryPetFairyInfo,47422).
-record(pk_U2GS_QueryPetFairyInfo,{
}).

%% 
-define(CMD_U2GS_QueryTerritoryHistory_Request,41716).
-record(pk_U2GS_QueryTerritoryHistory_Request,{
	%% Boolean true掠夺记录；false防守记录
	attackOrDefense
}).

%% 
-define(CMD_U2GS_QueryTerritoryInfo_Request,43838).
-record(pk_U2GS_QueryTerritoryInfo_Request,{
}).

%% 
%% // 宠物转生
-define(CMD_U2GS_RawPet,35797).
-record(pk_U2GS_RawPet,{
	%% UInt16
	petID
}).

%% 
%% // 请求战斗
-define(CMD_U2GS_RequestBattle,44797).
-record(pk_U2GS_RequestBattle,{
	%% Int32
	id
}).

%% 
%% // 请求Pvp战斗
-define(CMD_U2GS_RequestPvpBattle,30441).
-record(pk_U2GS_RequestPvpBattle,{
	%% Byte
	cityID,
	%% UInt64
	roleID
}).

%% 
%% // 领取奖励 
-define(CMD_U2GS_RequstReward,62009).
-record(pk_U2GS_RequstReward,{
}).

%% 
%% //显示宠物
-define(CMD_U2GS_ShowMountPet,57389).
-record(pk_U2GS_ShowMountPet,{
}).

%% 
%% // 排位
-define(CMD_U2GS_StandSort,21014).
-record(pk_U2GS_StandSort,{
	%% UInt16 位置上的骑宠ID列表。数组下标表示位置，从0开始编号 
	petList
}).

%% 
%% // 开采请求
-define(CMD_U2GS_TerritoryExploit_Request,30247).
-record(pk_U2GS_TerritoryExploit_Request,{
	%% UInt32 领地ID
	territoryID,
	%% UInt32 派遣骑宠
	listPetID,
	%% UInt32 开采时间配置，对应pet_territory_time.id
	cfgTime,
	%% UInt32 领地等级配置，对应pet_territory_level.id
	cfgLevel
}).

%% 
%% // 掠夺请求
-define(CMD_U2GS_TerritoryPlunder_Request,60988).
-record(pk_U2GS_TerritoryPlunder_Request,{
	%% UInt64 角色ID
	roleID,
	%% UInt32 领地ID
	territoryID,
	%% UInt32 派遣骑宠
	listPetID
}).

%% 
%% // 精力查询请求
-define(CMD_U2GS_TerritoryVigor_Request,42127).
-record(pk_U2GS_TerritoryVigor_Request,{
}).

%% 
%% // 升星宠物
-define(CMD_U2GS_UpStartPet,60578).
-record(pk_U2GS_UpStartPet,{
	%% UInt16
	petID
}).

%% 
%% // 使用宠物技能书
-define(CMD_U2GS_UsePetSkillBook,26300).
-record(pk_U2GS_UsePetSkillBook,{
	%% UInt16宠物ID
	petID,
	%% UInt16宠物技能ID
	petSkillId,
	%% UInt16商品ID
	itemid
}).

%% 
-define(CMD_Any_ChangeMap,51801).
-record(pk_Any_ChangeMap,{
	%% UInt32
	mapId,
	%% Single
	x,
	%% Single
	y
}).

%% 
-define(CMD_Any_PlayerLogout,1702).
-record(pk_Any_PlayerLogout,{
	%% UInt64
	code,
	%% Byte 退出的原因码
	reason
}).

-record(pk_BattleProp,{
	%% Byte 战斗属性号
	index,
	%% Single 战斗属性值
	value
}).

-record(pk_BlockStatusChange,{
	%% String 阻挡Name
	blockName,
	%% UInt32 阻挡的动作状态
	blockStatus
}).

-record(pk_BuffBaseInfo,{
	%% UInt64Buff唯一标识符
	buffUID,
	%% UInt32BuffID
	buffID,
	%% UInt32Buff持续时长
	time
}).

%% 
-define(CMD_C2S_ChangeMap,45297).
-record(pk_C2S_ChangeMap,{
	%% UInt32
	mapId,
	%% String
	waypointName
}).

-record(pk_CoinData,{
	%% Byte 货币类型
	coinType,
	%% UInt32 货币值
	value
}).

-record(pk_CopyMapDropItem,{
	%% UInt64 物品UID
	itemUID,
	%% UInt16 物品ID
	itemID,
	%% UInt16 堆叠数量
	number,
	%% Byte 品质
	quality,
	%% Boolean 是否绑定
	isBind
}).

-record(pk_CopyMapStatHurt,{
	%% UInt64玩家ID
	roleID,
	%% UInt32玩家受到的伤害
	beHurt,
	%% UInt32玩家攻击的伤害
	playerHurt,
	%% UInt32宠物攻击的伤害
	petHurt
}).

-record(pk_CopyObj,{
	%% UInt16 目标ID
	targetID,
	%% Byte 目标类型，1怪 or 2采集物
	targetType,
	%% UInt16 当前完成的个数
	curNumber,
	%% UInt16 总的需要完成的个数
	allNumber
}).

%% 
-define(CMD_GS2U_AcceptHolidayTaskSucc,35611).
-record(pk_GS2U_AcceptHolidayTaskSucc,{
	%% Byte
	result
}).

%% 
%% // 更新所有战斗属性
-define(CMD_GS2U_AllBattleProp,46744).
-record(pk_GS2U_AllBattleProp,{
	%% UInt64
	code,
	%% Single 战斗属性值，下标依次为有效属性索引
	battlePropInfo
}).

%% 
%% // 更新某项战斗属性
-define(CMD_GS2U_BattlePropList,28245).
-record(pk_GS2U_BattlePropList,{
	%% UInt64
	code,
	%% UInt16
	id,
	%% BattleProp
	battleProp
}).

%% 
%% // 阻档状态改变
-define(CMD_GS2U_BlockStatusChange,4623).
-record(pk_GS2U_BlockStatusChange,{
	%% BlockStatusChange
	changes
}).

%% 
%% // 广播物件消失
-define(CMD_GS2U_BroadcastDisapear,45334).
-record(pk_GS2U_BroadcastDisapear,{
	%% UInt64
	code
}).

%% 
%% // 广播物件消失(客户端将处理为立即消失，而不是在队列里等待tick处理)
-define(CMD_GS2U_BroadcastDisapearFast,13182).
-record(pk_GS2U_BroadcastDisapearFast,{
	%% UInt64
	code
}).

%% 
%% // 同步玩家的当前血量百分比（非战斗状态发送给周围玩家，不包括自己）
-define(CMD_GS2U_BroadcastPlayerHpPC,54157).
-record(pk_GS2U_BroadcastPlayerHpPC,{
	%% UInt64 玩家流水号
	code,
	%% Byte 玩家的血量百分比
	hpPC
}).

%% 
%% // 广播给复活玩家的周围（不包括复活玩家自己）的复活消息
-define(CMD_GS2U_BroadcastPlayerRevive,17135).
-record(pk_GS2U_BroadcastPlayerRevive,{
	%% UInt64角色Code
	code,
	%% UInt16地图ID
	mapId,
	%% Single坐标X
	x,
	%% Single坐标Y
	y,
	%% Byte血量百分比
	hpPC
}).

%% 
%% // 广播给复活玩家的队友复活消息
-define(CMD_GS2U_BroadcastTeamRevive,8439).
-record(pk_GS2U_BroadcastTeamRevive,{
	%% UInt64角色ID
	roleID,
	%% UInt16地图ID
	mapId,
	%% Single坐标X
	x,
	%% Single坐标Y
	y,
	%% Byte血量百分比
	hpPC
}).

%% 
%% //卸装备时广播给周围玩家
-define(CMD_GS2U_BroadcastVisibleEquipOff,46672).
-record(pk_GS2U_BroadcastVisibleEquipOff,{
	%% UInt64流水号
	code,
	%% UInt32卸下装备type, 部位
	type
}).

%% 
%% //穿装备时广播给周围玩家
-define(CMD_GS2U_BroadcastVisibleEquipOn,42110).
-record(pk_GS2U_BroadcastVisibleEquipOn,{
	%% UInt64流水号
	code,
	%% visibleEquip穿上的可见装备
	equip
}).

%% 
-define(CMD_GS2U_BuyLimitedResult,44641).
-record(pk_GS2U_BuyLimitedResult,{
	%% Byte0 购买成功；1 货币不足，3 最大购买限制次数
	result
}).

%% 
%% //玩家阵营改变通知客服端
-define(CMD_GS2U_ChangeCamp,20809).
-record(pk_GS2U_ChangeCamp,{
	%% UInt64玩家code
	code,
	%% UInt32阵营ID
	camp
}).

%% 
%% // 转职
-define(CMD_GS2U_ChangeCarrer,31075).
-record(pk_GS2U_ChangeCarrer,{
	%% Boolean是否转职成功
	result,
	%% UInt32新职业
	newCareer
}).

%% 
%% //改名结果
-define(CMD_GS2U_ChangeNameResult,47012).
-record(pk_GS2U_ChangeNameResult,{
	%% UInt64
	roleID,
	%% String
	name,
	%% UInt320为成功，其他为失败
	errorCode
}).

%% 
%% //返回聊天错误原因
-define(CMD_GS2U_ChatErrorResult,21361).
-record(pk_GS2U_ChatErrorResult,{
	%% Int32
	reason
}).

%% 
%% // 聊天消息(服务端发送)
-define(CMD_GS2U_Chatinfo,39394).
-record(pk_GS2U_Chatinfo,{
	%% SByte频道
	channel,
	%% UInt64发送者ID
	senderID,
	%% UInt64发送者Code
	senderCode,
	%% String发送者Name
	senderName,
	%% SByte种族
	senderRace,
	%% UInt32职业
	senderCareer,
	%% SByte性别
	senderSex,
	%% Int32头
	senderHead,
	%% Int16当前等级
	senderLevel,
	%% SByte发送者vip等级
	senderVip,
	%% String内容
	content
}).

%% 
%% //清除反击对象
-define(CMD_GS2U_ClearFightObject,46702).
-record(pk_GS2U_ClearFightObject,{
	%% UInt32 反击对象列表
	objs
}).

%% 
%% // 当前副本进行进度
-define(CMD_GS2U_CopyMapProcess,39720).
-record(pk_GS2U_CopyMapProcess,{
	%% Byte 进度
	curSchedule,
	%% Byte 总进度
	allSchedule,
	%% CopyObj 进度列表
	scheduleList
}).

%% 
%% // 副本扩展（地宫当前进度状态）
-define(CMD_GS2U_CopyMapProcessCurrentScheduleStatus,16294).
-record(pk_GS2U_CopyMapProcessCurrentScheduleStatus,{
	%% Byte 进度
	curSchedule,
	%% Byte 进度状态（0成功/1失败）
	status
}).

%% 
%% // 副本扩展（地宫当前进度剩余时间，仅作显示用）
-define(CMD_GS2U_CopyMapProcessCurrentScheduleSurplusSecond,35062).
-record(pk_GS2U_CopyMapProcessCurrentScheduleSurplusSecond,{
	%% Byte 进度
	curSchedule,
	%% Byte 1为准备；2为战斗
	type,
	%% UInt64 进度剩余时间
	surplusSecond
}).

%% 
%% // 副本通关结果和物品奖励
-define(CMD_GS2U_CopyMapResult,17828).
-record(pk_GS2U_CopyMapResult,{
	%% UInt16 副本地图ID
	copyMapID,
	%% UInt16 通关时间
	second,
	%% UInt32 金币奖励
	goldReward,
	%% UInt32 经验奖励
	expReward,
	%% CopyMapDropItem 掉落列表
	dropItems
}).

%% 
-define(CMD_GS2U_CopyMapStatHurtList,5304).
-record(pk_GS2U_CopyMapStatHurtList,{
	%% CopyMapStatHurt
	statList
}).

%% 
-define(CMD_GS2U_CreatePlayerResult,45054).
-record(pk_GS2U_CreatePlayerResult,{
	%% Int32
	errorCode,
	%% UInt64
	roleID
}).

%% 
%% //跨服后，玩家变了code
-define(CMD_GS2U_CrossNewPlayerCode,20154).
-record(pk_GS2U_CrossNewPlayerCode,{
	%% UInt32
	uint64
}).

%% 
%% //跨服状态
-define(CMD_GS2U_CrossStep,64024).
-record(pk_GS2U_CrossStep,{
	%% Byte为2表示从跨服回到GS
	index
}).

%% 
-define(CMD_GS2U_DashTo,13797).
-record(pk_GS2U_DashTo,{
	%% UInt64 接收远程玩家信息      
	code,
	%% Single 冲刺所到的目标点
	posX,
	%% Single 冲刺所到的目标点
	posY
}).

%% 
-define(CMD_GS2U_DeletePlayerResult,39385).
-record(pk_GS2U_DeletePlayerResult,{
	%% UInt64
	roleID,
	%% Int32
	errorCode
}).

%% 
%% //装备合成ACK
-define(CMD_GS2U_EqupmentCombinAck,48238).
-record(pk_GS2U_EqupmentCombinAck,{
	%% UInt32
	combinID,
	%% Boolean
	success
}).

%% 
-define(CMD_GS2U_Error,33508).
-record(pk_GS2U_Error,{
	%% UInt32错误号
	errorCode,
	%% StringErrorCode附加的参数，可能为空
	params
}).

%% 
%% //是否领取更新资源奖励
-define(CMD_GS2U_GetRewardUpdateResource,196).
-record(pk_GS2U_GetRewardUpdateResource,{
	%% RewardUpdateResource
	resultList
}).

%% 
%% //玩家仇恨
-define(CMD_GS2U_HateInfo,11948).
-record(pk_GS2U_HateInfo,{
	%% UInt64
	code,
	%% UInt64仇恨目标code
	hateCode,
	%% SByte1：新增  2:删除
	opreate
}).

%% 
%% // 已经获得的收费表情与动作列表(上线发给客户端，或者新增某一个时单独发给客户端)
-define(CMD_GS2U_HaveIconAndActionList,15362).
-record(pk_GS2U_HaveIconAndActionList,{
	%% UInt32 表情列表
	icons,
	%% UInt32 动作列表
	actions
}).

%% 
%% //心跳包返回，用于网络延迟(这个只用于检测外挂)
-define(CMD_GS2U_HeartBeatAck,30981).
-record(pk_GS2U_HeartBeatAck,{
	%% UInt32 同步给客户端的CD
	time,
	%% UInt32 服务器告诉客户端当前版本号
	version
}).

%% 
%% //邀请队员进入副本
-define(CMD_GS2U_InvateEnterCopyMap,6284).
-record(pk_GS2U_InvateEnterCopyMap,{
	%% UInt16副本地图ID
	copyMapID
}).

%% 
%% // gs踢人通知手机的消息
-define(CMD_GS2U_KickOutTip,38711).
-record(pk_GS2U_KickOutTip,{
	%% SByte 踢人类型（1为抢登录情况；2为GM类型）
	type
}).

%% 
%% //可杀戮Code
-define(CMD_GS2U_KillPlayerResponse,41656).
-record(pk_GS2U_KillPlayerResponse,{
	%% UInt64
	code
}).

%% 
%% //返回杀戮值
-define(CMD_GS2U_KillValueResponse,8228).
-record(pk_GS2U_KillValueResponse,{
	%% UInt16
	killValue
}).

%% 
-define(CMD_GS2U_LoginResult,22162).
-record(pk_GS2U_LoginResult,{
	%% Int32
	result
}).

%% 
%% // 玩家外观信息
-define(CMD_GS2U_LookInfoPlayer,18166).
-record(pk_GS2U_LookInfoPlayer,{
	%% UInt64流水号
	code,
	%% UInt64角色ID
	roleID,
	%% String名字
	name,
	%% Single坐标X
	x,
	%% Single坐标Y
	y,
	%% SByte 种族
	race,
	%% UInt32职业
	career,
	%% SByte 性别
	sex,
	%% SByte阵营
	camp,
	%% Int32头
	head,
	%% Single移动速度
	move_speed,
	%% Int16当前等级	
	level,
	%% Byte当前血量百分比
	hp_per,
	%% UInt16坐骑外观ID （0 表示没有坐骑或者下马状态）
	petID,
	%% UInt64双人坐骑对方的Code （0 表示没有）	
	otherCode,
	%% String服务器名称
	servername,
	%% Byte玩家Pk状态
	pkMode,
	%% UInt64玩家召唤的宠物code列表
	pet_list,
	%% PosInfo移动目标点列表
	move_list,
	%% BuffBaseInfo当前buff列表
	buffs,
	%% visibleEquip别的玩家可见的装备
	visible_equips,
	%% refineLevel精炼等级（装备部位强化等级）
	refine_levels
}).

%% 
%% //金宝塔结束和开始时间
-define(CMD_GS2U_LotteryForTowerBeginTimeEndTime,38347).
-record(pk_GS2U_LotteryForTowerBeginTimeEndTime,{
	%% UInt32
	beginTime,
	%% UInt32
	endTime
}).

%% 
-define(CMD_GS2U_LotteryForTowerInfo,20699).
-record(pk_GS2U_LotteryForTowerInfo,{
	%% Int16
	current_cfg_id,
	%% UInt32
	endTime,
	%% UInt32
	oneTimeCost,
	%% UInt32
	tenTimeCost,
	%% UInt32
	fiftyTimeCost,
	%% lotteryForToweItem
	itemList,
	%% lotteryForTowerNotice
	noticeList
}).

%% 
%% //抽奖结果发给客户端
-define(CMD_GS2U_LotteryForTowerRandonAward,47144).
-record(pk_GS2U_LotteryForTowerRandonAward,{
	%% Int16
	current_cfg_id,
	%% lotteryForTowerNotice
	noticeList,
	%% Int16
	reward_cfg_id_list
}).

%% 
-define(CMD_GS2U_MapLevel,11428).
-record(pk_GS2U_MapLevel,{
	%% UInt32等级值
	level
}).

%% 
%% // 副本通关结果和物品奖励
-define(CMD_GS2U_MaterialCopyMapResult,40093).
-record(pk_GS2U_MaterialCopyMapResult,{
	%% UInt16 副本地图ID
	copyMapID,
	%% UInt16 通关分数 0 表示失败
	score,
	%% UInt16 0 通关， 1 超时， 2 失败
	state,
	%% UInt32 金币奖励
	goldReward,
	%% UInt32 经验奖励
	expReward,
	%% UInt16 最大关卡
	maxChapter,
	%% UInt16 完成关卡
	finishChapter,
	%% CopyMapDropItem 掉落列表
	dropItems
}).

%% 
-define(CMD_GS2U_MissionObjectList,59133).
-record(pk_GS2U_MissionObjectList,{
	%% MissionObjectInfo 视野范围内 采集对象 列表
	missionObj_list
}).

%% 
-define(CMD_GS2U_MoneyChanges,53651).
-record(pk_GS2U_MoneyChanges,{
	%% MoneyChanges
	changes
}).

%% 
%% // 金币副本通关结算
-define(CMD_GS2U_MoneyDungeonCopyMapResult,33334).
-record(pk_GS2U_MoneyDungeonCopyMapResult,{
	%% UInt16 副本地图ID
	copyMapID,
	%% UInt16 通关分数 0 表示失败
	score,
	%% UInt16 最大关卡
	maxChapter,
	%% UInt16 完成关卡
	finishChapter,
	%% UInt16 当前关卡的怪物种类
	listMonsterID,
	%% Byte 对应listMonsterID的已杀掉的数量
	listMonsterCountKill
}).

%% 
%% // 点金手
-define(CMD_GS2U_MoneyTreeAck,19751).
-record(pk_GS2U_MoneyTreeAck,{
	%% UInt32金币总数
	totalMoney,
	%% UInt16倍数
	rate
}).

%% 
%% // 点金手宝箱
-define(CMD_GS2U_MoneyTreeBox,58681).
-record(pk_GS2U_MoneyTreeBox,{
	%% UInt32金币总数
	totalMoney,
	%% UInt16倍数
	rate
}).

%% 
-define(CMD_GS2U_MonsterList,32656).
-record(pk_GS2U_MonsterList,{
	%% LookInfoMonster 视野范围内怪物列表
	monster_list
}).

%% 
%% //月卡到期提醒
-define(CMD_GS2U_MonthCardEndTips,61679).
-record(pk_GS2U_MonthCardEndTips,{
	%% Byte剩余天数
	remainDays
}).

%% 
-define(CMD_GS2U_MoveInfo,58171).
-record(pk_GS2U_MoveInfo,{
	%% UInt64
	code,
	%% Single移动的目标点X
	posX,
	%% Single移动的目标点Y
	posY,
	%% PosInfo包括起点和终点在内的所有路径点
	posInfos
}).

%% 
%% // 在GS中换线或登录时，如果有失败性错误，就给手机发该消息
-define(CMD_GS2U_MsgBoxTips,18862).
-record(pk_GS2U_MsgBoxTips,{
	%% Int32
	code,
	%% String
	msg
}).

%% 
%% // 港口竞速活动:服务器返回路面盒子撞击结果
-define(CMD_GS2U_NeedForSpeedCollideRoadBox,17681).
-record(pk_GS2U_NeedForSpeedCollideRoadBox,{
	%% UInt64撞击出来的道具id
	collideItemID
}).

%% 
%% // 港口竞速活动:已被撞击的道具盒子编号
-define(CMD_GS2U_NeedForSpeedColliderBoxIDList,10076).
-record(pk_GS2U_NeedForSpeedColliderBoxIDList,{
	%% UInt16
	boxIdList
}).

%% 
%% // 港口竞速活动:比赛结束列表
-define(CMD_GS2U_NeedForSpeedCompletionEndInfoList,16935).
-record(pk_GS2U_NeedForSpeedCompletionEndInfoList,{
	%% String第一名的名字列表
	firstRoleNames,
	%% String第二名的名字列表
	secondRoleNames,
	%% String第三名的名字列表
	thirdRoleNames,
	%% Byte自己的名次
	selfIndex
}).

%% 
%% // 港口竞速活动:比赛中途信息列表
-define(CMD_GS2U_NeedForSpeedCompletionInfoList,43408).
-record(pk_GS2U_NeedForSpeedCompletionInfoList,{
	%% UInt16剩余时间
	lastTime,
	%% Byte当前圈数
	currentCircle,
	%% Byte自己的名次
	selfIndex,
	%% String第一名的玩家名字
	firstRoleName,
	%% Boolean第一名是否获胜
	firstIsWin,
	%% Byte赛场状态
	completionState
}).

%% 
%% // 港口竞速活动:匹配信息
-define(CMD_GS2U_NeedForSpeedMatchInfo,54863).
-record(pk_GS2U_NeedForSpeedMatchInfo,{
	%% UInt16当前玩家数量
	currentPlayerNumber,
	%% UInt16倒计时秒数
	countdownSec
}).

%% 
%% // 港口竞速活动:使用道具
-define(CMD_GS2U_NeedForSpeedUseItem,62578).
-record(pk_GS2U_NeedForSpeedUseItem,{
	%% UInt64使用道具的角色id
	roleID,
	%% UInt64该角色使用的道具id
	itemID
}).

%% 
%% //增加公告，gs发给client(为了用上面的公告消息列表）
-define(CMD_GS2U_NoticeAdd,22937).
-record(pk_GS2U_NoticeAdd,{
	%% NoticeInfo
	notice
}).

%% 
%% //删除公告，gs发给client(为了用上面的公告消息列表）
-define(CMD_GS2U_NoticeDel,9751).
-record(pk_GS2U_NoticeDel,{
	%% Int64要删除的公告id
	id
}).

%% 
%% //公告消息列表（登录时）
-define(CMD_GS2U_NoticeResponse,61141).
-record(pk_GS2U_NoticeResponse,{
	%% SByte0客户端与服务器一致，不用修改/1客户端与服务器不一致，需要用下面的noticeList覆盖
	result,
	%% NoticeInfo登录时，LS给玩家发的有效公告
	noticeList
}).

%% 
-define(CMD_GS2U_NpcList,639).
-record(pk_GS2U_NpcList,{
	%% LookInfoNpc 视野范围内 Npc 列表
	npc_list
}).

%% 
%% // npc的动作状态改变
-define(CMD_GS2U_NpcStatusChange,38415).
-record(pk_GS2U_NpcStatusChange,{
	%% UInt64
	code,
	%% UInt32 npc的动作状态
	actionStatus
}).

%% 
-define(CMD_GS2U_ObjBrief,4191).
-record(pk_GS2U_ObjBrief,{
	%% SByte 对象类型
	obj_type,
	%% ObjBrief 对象列表
	objs
}).

%% 
%% // 购买，上架，下架，拒绝购买等的操作结果
-define(CMD_GS2U_OpTradeResult,58764).
-record(pk_GS2U_OpTradeResult,{
	%% Byte 类型，1铜币交易,2元宝交易,3指定交易
	tradeClass,
	%% UInt64 订单ID
	orderID,
	%% Byte 结果
	result,
	%% Byte 操作码
	opCode
}).

%% 
-define(CMD_GS2U_PetList,18025).
-record(pk_GS2U_PetList,{
	%% LookInfoPet 视野范围内宠物列表
	pet_list
}).

%% 
-define(CMD_GS2U_PlayerAddExp,47341).
-record(pk_GS2U_PlayerAddExp,{
	%% UInt32当前经验，客户端自己使用发送的当前经验与之前的经验差作为增加经验
	curExp,
	%% Int32增加经验
	addExp
}).

%% 
%% //使用道具后返回信息
-define(CMD_GS2U_PlayerAwakenInfo,38672).
-record(pk_GS2U_PlayerAwakenInfo,{
	%% SByte0表示进入游戏  1表示后续升级
	type,
	%% SByte觉醒等级
	awakenLevel,
	%% UInt16吃了多少个
	itemNum
}).

%% 
-define(CMD_GS2U_PlayerBaseInfo,25296).
-record(pk_GS2U_PlayerBaseInfo,{
	%% RoleBaseInfo
	baseInfo
}).

%% 
-define(CMD_GS2U_PlayerBlood,52109).
-record(pk_GS2U_PlayerBlood,{
	%% UInt32
	blood
}).

%% 
-define(CMD_GS2U_PlayerChangedWealth,15512).
-record(pk_GS2U_PlayerChangedWealth,{
	%% UInt32财富类型
	type,
	%% UInt32财富值
	wealth,
	%% UInt16原因码
	reason
}).

%% 
%% //同步玩家怒气值
-define(CMD_GS2U_PlayerCour,3746).
-record(pk_GS2U_PlayerCour,{
	%% UInt32玩家怒气值
	cour
}).

%% 
%% // 角色死亡(自己死亡，不广播)
-define(CMD_GS2U_PlayerDead,33757).
-record(pk_GS2U_PlayerDead,{
	%% UInt64 角色死亡时服务器时间，单位秒
	deadTime,
	%% UInt64 角色Code
	code,
	%% UInt32 营地普通复活CD时间，单位秒
	normalReviveCDTime,
	%% MoneyInit 立即原地复活消耗
	reviveCost,
	%% UInt64 攻击者Code
	attackCode,
	%% String 攻击者名字
	attackName,
	%% MoneyInit 丢失金钱列表
	lostMoney,
	%% UInt32 复活类型,0：死亡后不弹复活界面，实际为营地复活;1：营地复活;2：自动复活倒计时;4：原地复活;多项复活类型，则相加。
	reviveType
}).

%% 
%% // 同步玩家的当前血量（非战斗状态只发送给自己）
-define(CMD_GS2U_PlayerHp,38317).
-record(pk_GS2U_PlayerHp,{
	%% UInt64 玩家Code
	code,
	%% UInt32 玩家的血量
	hp
}).

%% 
%% //玩家登陆初始化结束消息
-define(CMD_GS2U_PlayerInitEnd,8238).
-record(pk_GS2U_PlayerInitEnd,{
}).

%% 
-define(CMD_GS2U_PlayerLevelUp,65190).
-record(pk_GS2U_PlayerLevelUp,{
	%% UInt64玩家流水号
	code,
	%% UInt32当前经验
	curExp,
	%% UInt32最大经验
	maxExp,
	%% UInt32增加经验
	addExp,
	%% Byte等级
	level
}).

%% 
%% // 同步玩家体力值
-define(CMD_GS2U_PlayerPhys,11003).
-record(pk_GS2U_PlayerPhys,{
	%% UInt32玩家体力值
	phys
}).

%% 
%% // 发送给复活玩家自己的消息
-define(CMD_GS2U_PlayerRevive,42726).
-record(pk_GS2U_PlayerRevive,{
	%% UInt16地图ID
	mapId,
	%% Single坐标X
	x,
	%% Single坐标Y
	y,
	%% UInt32当前血量
	curHp,
	%% UInt32最大血量
	maxHp,
	%% UInt32当前能量
	curPower,
	%% UInt32当前体力
	curPhys
}).

%% 
%% // 同步玩家的职业相关的特殊属性（能量）（非战斗状态只发送给自己，具体值）
-define(CMD_GS2U_PlayerSp,16330).
-record(pk_GS2U_PlayerSp,{
	%% UInt32 玩家的能量值
	sp
}).

%% 
%% //通知玩家剧情对话
-define(CMD_GS2U_PlotDialogue,18245).
-record(pk_GS2U_PlotDialogue,{
	%% UInt32剧情对话配置表ID
	id
}).

%% 
%% // 属性同步
-define(CMD_GS2U_PropSync,30926).
-record(pk_GS2U_PropSync,{
	%% UInt64 属性改变的角色流水号
	code,
	%% PropInt 整形属性集合
	ints,
	%% PropInt64 64位整形属性集合
	int64s,
	%% PropFloat 浮点属性集合
	floats,
	%% PropString 字符串属性集合
	strs
}).

%% 
-define(CMD_GS2U_PushInfo,38424).
-record(pk_GS2U_PushInfo,{
	%% pushItem
	items,
	%% UInt32
	startTime,
	%% UInt32
	endTime
}).

%% 
%% // 查询交易行的订单列表
-define(CMD_GS2U_QueryTrade,7448).
-record(pk_GS2U_QueryTrade,{
	%% Byte 操作码
	opCode,
	%% Byte 排序方式,0无序,1升序,2降序
	sortType,
	%% Byte 对什么排序，1品质，2等级，3剩余时间，4出售人，5售价
	sortIndex,
	%% UInt32 第几页
	pageNumber,
	%% UInt64 当前时间
	nowTime,
	%% QueryTradeList 结果列表
	queryTradeList
}).

%% 
%% // 本次查询的订单记录信息
-define(CMD_GS2U_QueryTradeInfo,23698).
-record(pk_GS2U_QueryTradeInfo,{
	%% Byte 操作码
	opCode,
	%% Byte 查询类型，1铜币交易,2元宝交易,3指定交易
	tradeClass,
	%% Byte 道具类型, 1为装备道具equip，2为普通道具item
	itemClass,
	%% SByte 道具主类型,为空不过滤
	itemTypeList,
	%% SByte 道具子类型,不过滤为-1
	itemSubType,
	%% Int32 总共有多少条记录
	allNumber
}).

%% 
-define(CMD_GS2U_ReceivePlayerLevelRewardResult,34012).
-record(pk_GS2U_ReceivePlayerLevelRewardResult,{
	%% Byte当领取成了就发送 此消息，其余的均发送error_code【1等级不够、2已经领取 走error code】
	level
}).

%% 
%% // 断线重连  申请进入目标gs失败，客户端重新登录
-define(CMD_GS2U_ReconnectLoginRequestFail,51511).
-record(pk_GS2U_ReconnectLoginRequestFail,{
}).

%% 
%% // 低级副本扫荡（请求扫荡反馈，为了共用结构）
-define(CMD_GS2U_RequestAutoDealAck,53731).
-record(pk_GS2U_RequestAutoDealAck,{
	%% Boolean	是否成功
	isSuccess,
	%% UInt16 副本地图ID
	copyMapID,
	%% CoinData 货币奖励
	coinReward,
	%% UInt64 经验奖励
	expReward,
	%% CopyMapDropItem 掉落列表
	dropItems
}).

%% 
%% //返回女神的code
-define(CMD_GS2U_RequestGoddessCodeAck,30210).
-record(pk_GS2U_RequestGoddessCodeAck,{
	%% UInt64	女神code
	goddessCode
}).

%% 
%% //玩家充值请求ACK,订单处理成功了才发给client
-define(CMD_GS2U_RequestRechargeAck,39891).
-record(pk_GS2U_RequestRechargeAck,{
	%% Stringfuncell的订单号，服务器以些为准，会去重
	funcellOrderID,
	%% Single金额
	moneyNun
}).

%% 
-define(CMD_GS2U_RequestRechargeHasGiftIDListAck,2244).
-record(pk_GS2U_RequestRechargeHasGiftIDListAck,{
	%% UInt32本玩家已经领过的id
	takenIDList,
	%% RechargeDoubleConf双倍的配置列表
	confIDList
}).

%% 
%% // 返回目标副本的最高分数
-define(CMD_GS2U_RequestTargetCopyMapScore,41707).
-record(pk_GS2U_RequestTargetCopyMapScore,{
	%% UInt32 目标副本ID
	targetCopyMapID,
	%% UInt32 最高分数
	highestScore
}).

%% 
%% //重置副本成功的消息，失败则统一使用系统错误号
-define(CMD_GS2U_ResetCopyMap,9512).
-record(pk_GS2U_ResetCopyMap,{
	%% UInt16副本地图ID
	copyMapID
}).

%% 
%% // 下载语音数据
-define(CMD_GS2U_RespChatVoice,2670).
-record(pk_GS2U_RespChatVoice,{
	%% Byte一条消息总段数
	count,
	%% Byte分段索引
	index,
	%% UInt64 playercode + timesec
	playerCode,
	%% UInt32
	key,
	%% Byte 音频数据
	data
}).

%% 
%% // 下载语音数据
-define(CMD_GS2U_RespChatVoiceError,2854).
-record(pk_GS2U_RespChatVoiceError,{
	%% UInt64 playercode + timesec
	playerCode,
	%% UInt32
	key,
	%% Byte 错误码
	errorCode
}).

%% 
-define(CMD_GS2U_SelPlayerResult,42464).
-record(pk_GS2U_SelPlayerResult,{
	%% Int32
	result
}).

%% 
%% //通知玩家发了奖励物品
-define(CMD_GS2U_SendGiftNotice,55980).
-record(pk_GS2U_SendGiftNotice,{
	%% UInt64 1为宝箱
	ids
}).

%% 
-define(CMD_GS2U_SendPlayerDailyCountList,27517).
-record(pk_GS2U_SendPlayerDailyCountList,{
	%% PlayerDailyCount
	playerDailyCountList
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
-define(CMD_GS2U_SessionKey,40925).
-record(pk_GS2U_SessionKey,{
	%% String
	key
}).

%% 
%% // 领取奖励成功的反馈消息，用于刷新界面
-define(CMD_GS2U_SevenDayAimReward_Ack,8783).
-record(pk_GS2U_SevenDayAimReward_Ack,{
	%% UInt16 如同配置表seven_day_aim.id
	id
}).

%% 
%% // 上线推送七日目标状态
-define(CMD_GS2U_SevenDayAimState_Sync,5899).
-record(pk_GS2U_SevenDayAimState_Sync,{
	%% UInt32 活动开始时间（从1970年1月1日至今的秒数，活动持续7*24小时）
	timeBegin,
	%% SevenDayAimUpdate 条件集（活动不在有效期内时为空）
	conditions,
	%% UInt16 已经领取的奖励对应配置ID集，参考seven_day_aim.id
	alreadyReward
}).

%% 
-define(CMD_GS2U_SevenDayAimUpdate_Sync,34075).
-record(pk_GS2U_SevenDayAimUpdate_Sync,{
	%% Int32 条件类型
	type,
	%% Int64 条件参数
	args
}).

%% 
-define(CMD_GS2U_ShiftTo,33489).
-record(pk_GS2U_ShiftTo,{
	%% UInt64瞬移目标Code
	code,
	%% Single瞬移的目标点X
	posX,
	%% Single瞬移的目标点Y
	posY
}).

%% 
%% // 显示动作
-define(CMD_GS2U_ShowAction,18095).
-record(pk_GS2U_ShowAction,{
	%% UInt64
	playerCode,
	%% UInt32 符号索引
	actionIndex
}).

%% 
%% // 副本触发特殊事件
-define(CMD_GS2U_SpecificEvent_Sync,30574).
-record(pk_GS2U_SpecificEvent_Sync,{
	%% UInt32 事件ID
	eventID,
	%% Boolean 表示对应表copymapScheduleInit或表copymapScheduleSettle
	initOrSettle,
	%% UInt32 表示表copymapScheduleInit或表copymapScheduleSettle对应的ID
	scheduleID
}).

%% 
-define(CMD_GS2U_StopMove,35067).
-record(pk_GS2U_StopMove,{
	%% UInt64 停止      
	code,
	%% Single 停止到的位置X
	posX,
	%% Single 停止到的位置Y
	posY
}).

%% 
%% //同步服务器时间
-define(CMD_GS2U_SyncServerTime,1399).
-record(pk_GS2U_SyncServerTime,{
	%% UInt32UTC时间（相对于1970年第0秒），单位秒
	time
}).

%% 
-define(CMD_GS2U_TaskUseItemList,7311).
-record(pk_GS2U_TaskUseItemList,{
	%% TaskUseItem 视野范围内 使用物品 列表
	useItemlist
}).

%% 
%% // 七日目标 end
%% ////////////////////////////////////////////////////////////
%% ////////////////////////////////////////////////////////////
%% // 30日登录大奖 begin
%% // 上线推送状态
-define(CMD_GS2U_ThirtyDayLoginGiftState_Sync,38996).
-record(pk_GS2U_ThirtyDayLoginGiftState_Sync,{
	%% UInt32 活动开始时间（从1970年1月1日至今的秒数，活动持续30*24小时）
	timeBegin,
	%% UInt16 领取到的奖励ID，对应配置表thirty_day_login_gift.id，奖励只能按升序领取
	alreadyReward
}).

%% 
%% // 领取奖励成功的反馈消息，用于刷新界面
-define(CMD_GS2U_ThirtyDayLoginGift_Ack,50225).
-record(pk_GS2U_ThirtyDayLoginGift_Ack,{
	%% UInt16 如同配置表thirty_day_login_gift.id
	id
}).

%% 
-define(CMD_GS2U_TipsError,48180).
-record(pk_GS2U_TipsError,{
	%% UInt32
	errorCode
}).

%% 
%% //提示消息
-define(CMD_GS2U_TipsString,5369).
-record(pk_GS2U_TipsString,{
	%% Byte提示显示类型：0=tips，1=聊天-系统，2=跑马灯，3=喇叭消息，4=messagebox
	type,
	%% String提示的字符串
	tips,
	%% String附带的参数
	params
}).

%% 
-define(CMD_GS2U_TransferNewPos,22727).
-record(pk_GS2U_TransferNewPos,{
	%% UInt64
	code,
	%% PosInfo
	pos
}).

%% 
-define(CMD_GS2U_UserPlayerList,18582).
-record(pk_GS2U_UserPlayerList,{
	%% Int32是否解锁新种族
	unlockNewRace,
	%% UserPlayerData
	info
}).

%% 
%% //翅膀升级消息
-define(CMD_GS2U_WingRise,61596).
-record(pk_GS2U_WingRise,{
	%% UInt32
	itemID,
	%% Int32
	expChange
}).

%% 
%% //首领入侵 鼓舞伤害加成
-define(CMD_GS2U_WorldBossBuyBuff,49866).
-record(pk_GS2U_WorldBossBuyBuff,{
	%% Byte货币使用类型
	type
}).

%% 
%% // 返回结果
-define(CMD_GS2U_XmlNoticeResponse,64460).
-record(pk_GS2U_XmlNoticeResponse,{
	%% Byte1更新公告;2活动公告
	type,
	%% Byte0用content修改；1不用修改；2没有内容
	ret,
	%% String公告内容,json串
	content,
	%% String小写md5(content)
	sign
}).

%% 
%% //服务器下发给客户端的体力值信息
-define(CMD_GS2U_action_point_info,27166).
-record(pk_GS2U_action_point_info,{
	%% UInt32
	value
}).

%% 
%% //将服务器副本销毁时间同步给客户端
-define(CMD_GS2U_copy_map_destory_time,11581).
-record(pk_GS2U_copy_map_destory_time,{
	%% UInt32副本id
	copyMapID,
	%% UInt64活动销毁时间
	destoryTime,
	%% UInt64
	waitTime
}).

%% 
%% //服务器将玩家抽到的奖励发给客户端
-define(CMD_GS2U_lottery_award_items,21812).
-record(pk_GS2U_lottery_award_items,{
	%% lottery_award_item_info
	award_item_list,
	%% lottery_award_item_info
	award_item_list_sp
}).

%% 
%% //服务器返回宝藏系统信息给客户端
-define(CMD_GS2U_lottery_sys_info,37194).
-record(pk_GS2U_lottery_sys_info,{
	%% Int16
	goblin_lottery_last_free_times,
	%% UInt32
	goblin_lottery_free_cd,
	%% UInt32
	treasure_lottery_last_free_times,
	%% UInt32
	treasure_lottery_free_cd
}).

%% 
-define(CMD_GS2U_lsbattlefield_award_list,9612).
-record(pk_GS2U_lsbattlefield_award_list,{
	%% UInt32名次
	index,
	%% lsbattlefield_award奖励的道具列表
	award_list,
	%% UInt32货币类型
	coinType,
	%% UInt32货币个数
	coinValue
}).

%% 
%% //服务器下发给客户端的战斗排行列表
-define(CMD_GS2U_lsbattlefield_rank_list,17121).
-record(pk_GS2U_lsbattlefield_rank_list,{
	%% lsbattlefield_rank
	rank_list
}).

%% 
%% //怪物数变化
-define(CMD_GS2U_monsterChange,60138).
-record(pk_GS2U_monsterChange,{
	%% UInt32 本地图当前怪物数
	number
}).

%% 
%% //返回好友坐标
-define(CMD_GS2U_returnFriendPos,20446).
-record(pk_GS2U_returnFriendPos,{
	%% UInt32地图ID
	mapID,
	%% Single新的坐标
	x,
	%% Single
	y
}).

%% 
%% //同步服务器乱世为王活动状态给客户端
-define(CMD_GS2U_synch_lsbattlefield_state,52959).
-record(pk_GS2U_synch_lsbattlefield_state,{
	%% UInt32活动状态
	state
}).

%% 
%% // 获取获取在线奖励
-define(CMD_GetPlayerOnlineReward,12473).
-record(pk_GetPlayerOnlineReward,{
	%% UInt32当领取成了就发送此消息，其余的走error code
	timeID
}).

-record(pk_LookInfoMonster,{
	%% UInt64
	code,
	%% UInt32 怪物 ID	
	id,
	%% Single 怪物坐标
	x,
	%% Single
	y,
	%% Single旋转坐标W
	rotW,
	%% Single 怪物移动的目标点X
	targetX,
	%% Single 怪物移动的目标点Y
	targetY,
	%% Single 怪物移动速度
	move_speed,
	%% Single 怪物攻击速度
	attack_speed,
	%% Byte 怪物现在是在走还是在跑（客户端用于播放动画）
	moveStatus,
	%% Byte 类型 0:普通怪 1:载体怪
	type,
	%% Byte 当前血量百分比
	hp_per,
	%% SByte 阵营
	camp,
	%% UInt64 归宿code
	usercode,
	%% UInt64 怪物所属分组ID
	groupID,
	%% UInt64 怪物所属军团ID
	guildID,
	%% BuffBaseInfo当前buff列表
	buffs,
	%% String 名字
	name,
	%% UInt16怪物等级
	level
}).

-record(pk_LookInfoNpc,{
	%% UInt64
	code,
	%% UInt32 Npc ID
	id,
	%% Single Npc 坐标
	x,
	%% Single
	y,
	%% Single旋转坐标W
	rotW,
	%% String 名称
	name,
	%% UInt32 npc的动作状态
	actionStatus,
	%% String npc称号(如果为空，则客户端自己取配置中的称号)
	title
}).

-record(pk_LookInfoPet,{
	%% UInt64 宠物 Code
	code,
	%% UInt32 宠物 ID
	id,
	%% String 名字
	name,
	%% UInt64 主人 Code
	playerCode,
	%% Single 宠物坐标
	x,
	%% Single
	y,
	%% Single 宠物移动的目标点X
	targetX,
	%% Single 宠物移动的目标点Y
	targetY,
	%% Single 宠物移动速度
	move_speed,
	%% Byte 当前血量百分比
	hp_per,
	%% SByte 宠物状态 7:隐身状态
	status,
	%% SByte 阵营
	camp,
	%% Byte 玩家Pk状态   
	pkMode,
	%% BuffBaseInfo 当前buff列表
	buffs
}).

-record(pk_MissionObjectInfo,{
	%% UInt64
	code,
	%% UInt32 采集对象 ID
	id,
	%% Single 采集对象 坐标
	x,
	%% Single
	y,
	%% Single旋转坐标W
	rotW
}).

-record(pk_MoneyChanges,{
	%% UInt64
	code,
	%% MoneyInit货币变化列表
	moneys
}).

-record(pk_MoneyInit,{
	%% Byte
	moneyType,
	%% UInt32
	value
}).

-record(pk_NoticeInfo,{
	%% Int64公告id
	id,
	%% SByte0即时，1定时，2轮播
	type,
	%% SByte0跑马灯/1登陆界面的公告板/2游戏内的公告板
	pos,
	%% String内容
	content,
	%% Int320xffffff rgb值
	color,
	%% Int64多少秒后开始
	afterSecondStart,
	%% Int64从开始时间持续多少秒	
	duration,
	%% Int32间隔时间秒
	interval
}).

-record(pk_ObjBrief,{
	%% UInt64
	code,
	%% String名字
	name,
	%% Single坐标X
	x,
	%% Single坐标Y
	y
}).

-record(pk_PlayerDailyCount,{
	%% UInt32
	dailyType,
	%% UInt32
	dailyID,
	%% UInt32
	dailyValue
}).

%% 
%% //获取等级礼包协议
-define(CMD_PlayerLevelReward,32586).
-record(pk_PlayerLevelReward,{
	%% Byte已领取奖励的等级
	receiveRewardLevel
}).

-record(pk_PosInfo,{
	%% Single
	x,
	%% Single
	y
}).

-record(pk_PropFloat,{
	%% UInt16 属性索引
	index,
	%% Single 属性值
	value
}).

-record(pk_PropInt,{
	%% UInt16 属性索引
	index,
	%% Int32 属性值
	value
}).

-record(pk_PropInt64,{
	%% UInt16 属性索引
	index,
	%% UInt64 属性值
	value
}).

-record(pk_PropString,{
	%% UInt16 属性索引
	index,
	%% String 属性值
	value
}).

-record(pk_QueryTradeList,{
	%% UInt64 订单ID
	orderID,
	%% UInt64 出售者原装备唯一ID
	itemUID,
	%% UInt32 道具编号ID
	itemID,
	%% String 出售者角色姓名
	roleName,
	%% Byte 出售类型,1铜币交易,2元宝交易,3指定交易
	sellType,
	%% UInt64 上架时间s
	putTime,
	%% UInt64 下架时间s
	downTime,
	%% UInt32 银币(铜币)
	silver,
	%% UInt32 金币(元宝)
	gold,
	%% String 指定卖给谁
	destRoleName,
	%% Byte 品质
	quality,
	%% Byte 道具等级
	itemLevel,
	%% UInt32 堆叠数量
	pileCount
}).

-record(pk_RechargeDoubleConf,{
	%% UInt32
	id,
	%% Single
	payMoney
}).

-record(pk_RewardUpdateResource,{
	%% Byte第几次
	count,
	%% Boolean是否领取
	flag,
	%% UpdateReward奖励列表
	rewardList
}).

-record(pk_RoleBaseInfo,{
	%% UInt64
	code,
	%% UInt64
	roleID,
	%% String
	name,
	%% Single
	x,
	%% Single
	y,
	%% UInt32头
	head,
	%% Int16等级
	level,
	%% SByte阵营
	camp,
	%% UInt32职业
	career,
	%% SByte 种族
	race,
	%% SByte 性别
	sex,
	%% SByteVIP
	vip,
	%% Byte当前血量百分比
	hp_per,
	%% UInt32当前经验
	exp,
	%% UInt32当前等级最大经验
	maxExp,
	%% UInt32当前血量
	cur_hp,
	%% UInt32血量最大值
	max_hp,
	%% UInt32当前魔法值
	mp,
	%% UInt16坐骑外观ID （0 表示没有坐骑或者下马状态）
	mountID,
	%% UInt64双人坐骑对方的Code （0 表示没有）	
	otherCode,
	%% Byte玩家Pk状态
	pkMode,
	%% UInt16最大怒气
	maxCourage,
	%% MoneyInit货币初始化
	moneys,
	%% visibleEquip玩家可见的装备
	visible_equips,
	%% refineLevel装备精炼等级（装备部位强化等级)
	refine_levels
}).

-record(pk_SevenDayAimUpdate,{
	%% Int32 条件类型
	type,
	%% Int64 条件参数
	args
}).

-record(pk_TaskUseItem,{
	%% UInt64
	code,
	%% UInt32 使用物品 ID
	id,
	%% Single 使用物品 坐标
	x,
	%% Single
	y,
	%% Single旋转坐标W
	rotW
}).

%% 
%% //初始化今日活动任务
-define(CMD_U2GS_AcceptHolidayTask,58975).
-record(pk_U2GS_AcceptHolidayTask,{
}).

%% 
%% // 激活码领取请求
-define(CMD_U2GS_ActiveCodeRequest,24642).
-record(pk_U2GS_ActiveCodeRequest,{
	%% String 激活码
	code
}).

%% 
%% //系统内部购买
-define(CMD_U2GS_Buy4System,33723).
-record(pk_U2GS_Buy4System,{
	%% UInt32cost配置表示的id，用以确定购买的item及配置
	costID,
	%% UInt32购买数量
	number
}).

%% 
-define(CMD_U2GS_BuyLimitSales,25489).
-record(pk_U2GS_BuyLimitSales,{
	%% UInt32
	sku
}).

%% 
%% // 转职
-define(CMD_U2GS_ChangeCarrer,52757).
-record(pk_U2GS_ChangeCarrer,{
	%% UInt32新职业
	newCareer
}).

%% 
%% // 换线  申请进入目标gs
-define(CMD_U2GS_ChangeLineLoginRequest,2496).
-record(pk_U2GS_ChangeLineLoginRequest,{
	%% UInt64账号ID
	accountID,
	%% UInt64角色ID
	roleID,
	%% String随机Key
	key,
	%% Int32协议版本号
	protocolVer
}).

%% 
-define(CMD_U2GS_ChangeLineRequest,16861).
-record(pk_U2GS_ChangeLineRequest,{
	%% Byte 类型，1为换线
	type
}).

%% 
%% // 确认换线(老服)
-define(CMD_U2GS_ChangeLineRequestAck,6120).
-record(pk_U2GS_ChangeLineRequestAck,{
	%% Byte 0为确定换线；1为取消
	yes
}).

%% 
%% //客户端请求修改名字
-define(CMD_U2GS_ChangeName,43873).
-record(pk_U2GS_ChangeName,{
	%% UInt64
	roleID,
	%% String
	name
}).

%% 
%% //客户端设置翅膀等级
-define(CMD_U2GS_ChangeWingLevel,8423).
-record(pk_U2GS_ChangeWingLevel,{
	%% UInt32
	level
}).

%% 
%% // 聊天消息(客户端发送)
-define(CMD_U2GS_ChatInfo,21140).
-record(pk_U2GS_ChatInfo,{
	%% SByte频道
	channel,
	%% UInt64接收者ID
	receiverID,
	%% String接收者Name
	receiverName,
	%% String内容
	content
}).

%% 
%% // 上传语音数据
-define(CMD_U2GS_ChatVoice,15792).
-record(pk_U2GS_ChatVoice,{
	%% Byte一条消息总段数
	count,
	%% Byte分段索引
	index,
	%% UInt64
	playerCode,
	%% UInt32 playercode + timesec
	key,
	%% Byte 音频数据
	data
}).

%% 
-define(CMD_U2GS_CommonditiesPush,2855).
-record(pk_U2GS_CommonditiesPush,{
}).

%% 
-define(CMD_U2GS_CopyChat,13095).
-record(pk_U2GS_CopyChat,{
}).

%% 
-define(CMD_U2GS_DashTo,26663).
-record(pk_U2GS_DashTo,{
	%% Single 冲刺所到的目标点
	posX,
	%% Single 冲刺所到的目标点
	posY
}).

%% 
-define(CMD_U2GS_DigTransferMap,61093).
-record(pk_U2GS_DigTransferMap,{
	%% UInt32
	mapId,
	%% String
	waypointName
}).

%% 
%% // 下架
-define(CMD_U2GS_DownTrade,17148).
-record(pk_U2GS_DownTrade,{
	%% Byte 类型，1铜币交易,2元宝交易,3指定交易
	tradeClass,
	%% UInt64 订单ID
	orderID,
	%% Byte 操作码
	opCode
}).

%% 
%% // 进入活动或者玩法
-define(CMD_U2GS_EnterActiveMap,17012).
-record(pk_U2GS_EnterActiveMap,{
	%% UInt64Npc Code
	npcCode,
	%% UInt16活动ID
	activeID
}).

%% 
%% //进入副本
-define(CMD_U2GS_EnterCopyMap,24973).
-record(pk_U2GS_EnterCopyMap,{
	%% UInt16副本地图ID
	copyMapID
}).

%% 
%% // 客户端加载资源完成，可以接收服务器玩家数据
-define(CMD_U2GS_EnteredMap,30475).
-record(pk_U2GS_EnteredMap,{
}).

%% 
%% //装备合成
-define(CMD_U2GS_EqupmentCombin,23025).
-record(pk_U2GS_EqupmentCombin,{
	%% UInt32
	combinID,
	%% UInt64
	equpmentUIDList
}).

%% 
%% // 获取经验
-define(CMD_U2GS_GetLeavedExp,17228).
-record(pk_U2GS_GetLeavedExp,{
	%% Byte获取经验（0：免费获取； 1：金币获取  2：钻石获取）	
	getType
}).

%% 
%% //请求等级值
-define(CMD_U2GS_GetMapLevel,4452).
-record(pk_U2GS_GetMapLevel,{
}).

%% 
%% //领取更新资源奖励
-define(CMD_U2GS_GetUpdateReward,54528).
-record(pk_U2GS_GetUpdateReward,{
	%% Byte领取更新资源奖励第几次
	count
}).

%% 
%% // 领取爵位等级奖励
-define(CMD_U2GS_GetVipReward,52508).
-record(pk_U2GS_GetVipReward,{
	%% Int16爵位等级
	vipLevel
}).

%% 
%% //进入经验地图
-define(CMD_U2GS_GoToExpMap,36536).
-record(pk_U2GS_GoToExpMap,{
}).

%% 
%% //心跳包(这个只用于检测外挂)
-define(CMD_U2GS_HeartBeat,39242).
-record(pk_U2GS_HeartBeat,{
	%% UInt32 客户端自行维护的当前时间
	time,
	%% UInt32 版本号，客户端上传的版本号必须是服务器下发的，否则抛弃
	version
}).

%% 
%% //客户端真正的心跳包，只是客户端定时发给客户端
-define(CMD_U2GS_HeartBeatReal,33460).
-record(pk_U2GS_HeartBeatReal,{
	%% UInt32 客户端自行维护的当前时间
	time
}).

%% 
-define(CMD_U2GS_Join_lsbattlefield,17864).
-record(pk_U2GS_Join_lsbattlefield,{
}).

%% 
%% //请求杀戮值
-define(CMD_U2GS_KillValueRequest,11554).
-record(pk_U2GS_KillValueRequest,{
}).

%% 
%% //离开副本
-define(CMD_U2GS_LeaveCopyMap,15694).
-record(pk_U2GS_LeaveCopyMap,{
	%% UInt16 1 主动点击退出按钮
	type
}).

%% 
%% // 数据加载完成，玩家进入到地图，可以接收其它玩家消息
-define(CMD_U2GS_LoadedMap,57553).
-record(pk_U2GS_LoadedMap,{
}).

%% 
-define(CMD_U2GS_LotteryForTowerInfo,15649).
-record(pk_U2GS_LotteryForTowerInfo,{
}).

%% 
-define(CMD_U2GS_LotteryForTowerRandonAward,32778).
-record(pk_U2GS_LotteryForTowerRandonAward,{
	%% UInt32
	randomNumber,
	%% Boolean是否显示道具奖励面板
	isShowPanel
}).

%% 
%% // 点金手
-define(CMD_U2GS_MoneyTree,10672).
-record(pk_U2GS_MoneyTree,{
}).

%% 
%% //月卡 领取礼品事件
-define(CMD_U2GS_MonthCardGettingEvent,23872).
-record(pk_U2GS_MonthCardGettingEvent,{
	%% UInt323为月卡礼品领取
	type
}).

%% 
-define(CMD_U2GS_MoveTo,1578).
-record(pk_U2GS_MoveTo,{
	%% UInt64移动的目标Code
	code,
	%% Single移动的目标点X
	posX,
	%% Single移动的目标点Y
	posY,
	%% PosInfo包括起点和目标点在内所有路径点
	posInfos
}).

%% 
%% // 港口竞速活动:取消参加
-define(CMD_U2GS_NeedForSpeedCancel,38104).
-record(pk_U2GS_NeedForSpeedCancel,{
}).

%% 
%% // 港口竞速活动:客户端申请撞击路面上的盒子
-define(CMD_U2GS_NeedForSpeedCollideRoadBox,3315).
-record(pk_U2GS_NeedForSpeedCollideRoadBox,{
	%% UInt16撞击到的盒子编号
	collideBoxId
}).

%% 
%% // 港口竞速活动:客户端申请撞击路面上的分数线
-define(CMD_U2GS_NeedForSpeedCollideRoadScoreLine,7898).
-record(pk_U2GS_NeedForSpeedCollideRoadScoreLine,{
	%% UInt16撞击到的分数线id
	collideScoreLineId
}).

%% 
%% // 港口竞速活动:参加比赛
-define(CMD_U2GS_NeedForSpeedJoin,36524).
-record(pk_U2GS_NeedForSpeedJoin,{
}).

%% 
%% // 港口竞速活动:中场退出
-define(CMD_U2GS_NeedForSpeedQuite,59796).
-record(pk_U2GS_NeedForSpeedQuite,{
}).

%% 
%% // 港口竞速活动:使用道具
-define(CMD_U2GS_NeedForSpeedUseItem,57528).
-record(pk_U2GS_NeedForSpeedUseItem,{
	%% UInt64该角色使用的道具id
	itemID,
	%% UInt64该道具攻击到的玩家id列表
	targetRoleIDList
}).

%% 
%% // 跟据上一次查询结果，查询下一页
-define(CMD_U2GS_NextResult,58438).
-record(pk_U2GS_NextResult,{
	%% UInt32 查询第几页
	pageNumber,
	%% Byte 操作码
	opCode
}).

%% 
%% //请求公告列表，
-define(CMD_U2GS_NoticeRequest,45265).
-record(pk_U2GS_NoticeRequest,{
	%% Stringclient端已有公告id号升序后字符串md5。如md5("1,2,3")不要逗号
	md5
}).

%% 
%% //觉醒用道具
-define(CMD_U2GS_PlayerAwakenUseItem,64414).
-record(pk_U2GS_PlayerAwakenUseItem,{
	%% UInt16 本次请求使用个数
	num
}).

%% 
%% // 玩家对游戏的反馈
-define(CMD_U2GS_PlayerCoupleBack,41830).
-record(pk_U2GS_PlayerCoupleBack,{
	%% UInt32 反馈类型
	cbType,
	%% String 反馈内容
	cbContent
}).

%% 
%% // 玩家剧情对话结束
-define(CMD_U2GS_PlotDialogueEnd,25596).
-record(pk_U2GS_PlotDialogueEnd,{
}).

%% 
%% // 上架
-define(CMD_U2GS_PutTrade,54355).
-record(pk_U2GS_PutTrade,{
	%% Byte 类型，1铜币交易,2元宝交易,3指定交易
	tradeClass,
	%% UInt64 出售者原装备唯一ID
	itemUID,
	%% UInt32 道具编号ID
	itemID,
	%% UInt16 出售道具个数
	sellNumber,
	%% Byte 出售时长(单位小时)
	sellTime,
	%% UInt32 银币(铜币)
	silver,
	%% UInt32 金币(元宝)
	gold,
	%% String 指定卖给谁
	destRoleName,
	%% Byte 操作码
	opCode
}).

%% 
%% // 首次打开界面，获取最新上架记录
-define(CMD_U2GS_QueryNewestTrade,42964).
-record(pk_U2GS_QueryNewestTrade,{
	%% Byte 查询类型，1铜币交易,2元宝交易,3指定交易
	tradeClass,
	%% Byte 需要查询最新记录的条数
	getNumber,
	%% Byte 每一页显示的条数，-1表示一次性取所有的记录
	oneNumber,
	%% Byte 操作码
	opCode
}).

%% 
%% // 查询自己的交易订单
-define(CMD_U2GS_QuerySelfTrade,45970).
-record(pk_U2GS_QuerySelfTrade,{
	%% Byte 查询类型，1铜币交易,2元宝交易,3指定交易，0查询所有自己的订单
	tradeClass,
	%% Byte 操作码
	opCode
}).

%% 
%% // 查询对象
-define(CMD_U2GS_QueryTargetObject,34006).
-record(pk_U2GS_QueryTargetObject,{
	%% UInt64 目标code
	targetCode
}).

%% 
%% // 查询交易行的订单列表
-define(CMD_U2GS_QueryTrade,40058).
-record(pk_U2GS_QueryTrade,{
	%% Byte 查询类型，1铜币交易,2元宝交易,3指定交易
	tradeClass,
	%% Byte 道具类型, 1为装备道具equip，2为普通道具item
	itemClass,
	%% SByte 道具主类型列表,不过滤为空
	itemTypeList,
	%% SByte 道具子类型,不过滤为-1
	itemSubType,
	%% String 指定的道具ID的名称列表（每项均是全匹配）
	itemList,
	%% SByte min lvl,不过滤为-1
	itemLvlMin,
	%% SByte max lvl,不过滤为-1
	itemLvlMax,
	%% SByte 道具职业,不过滤为-1，0表示所有职业可用的装备
	itemProfession,
	%% Byte 每一页显示的条数，-1表示一次性取所有的记录
	oneNumber,
	%% Byte 操作码
	opCode
}).

%% 
%% //保存客户端需要server保存的自定义事件
-define(CMD_U2GS_RecClientEvent,40949).
-record(pk_U2GS_RecClientEvent,{
	%% UInt32事件id(由server来分配维护)
	eventID,
	%% UInt32事件发生时间
	eventTime,
	%% String事件需要记录的扩展信息，建议k,v式的json
	eventArgs
}).

%% 
-define(CMD_U2GS_ReceivePlayerLevelReward,12809).
-record(pk_U2GS_ReceivePlayerLevelReward,{
	%% Byte
	level
}).

%% 
%% // 7日首充，累充 领取礼品事件
-define(CMD_U2GS_RechargeGettingEvent,57955).
-record(pk_U2GS_RechargeGettingEvent,{
	%% UInt321为7日累充，2为普通累充
	type,
	%% UInt32要领取的档次
	grade
}).

%% 
%% // 断线重连  申请进入目标gs
-define(CMD_U2GS_ReconnectLoginRequest,1827).
-record(pk_U2GS_ReconnectLoginRequest,{
	%% UInt64账号ID
	accountID,
	%% UInt64角色ID
	roleID,
	%% String随机Key
	key,
	%% Int32协议版本号
	protocolVer
}).

%% 
%% // 请求语音数据
-define(CMD_U2GS_ReqChatVoice,41242).
-record(pk_U2GS_ReqChatVoice,{
	%% UInt64 playercode + timesec
	playerCode,
	%% UInt32
	key
}).

%% 
-define(CMD_U2GS_RequestCreatePlayer,4022).
-record(pk_U2GS_RequestCreatePlayer,{
	%% String 名字
	name,
	%% SByte 阵营
	camp,
	%% UInt32 职业
	career,
	%% SByte 种族
	race,
	%% SByte 性别
	sex,
	%% Int32 头
	head
}).

%% 
-define(CMD_U2GS_RequestDeletePlayer,23657).
-record(pk_U2GS_RequestDeletePlayer,{
	%% UInt64
	roleID
}).

%% 
%% //请求查询女神的code
-define(CMD_U2GS_RequestGoddessCode,65485).
-record(pk_U2GS_RequestGoddessCode,{
}).

%% 
-define(CMD_U2GS_RequestLogin,56084).
-record(pk_U2GS_RequestLogin,{
	%% UInt64账号ID
	accountID,
	%% String随机Key
	key,
	%% Int32协议版本号
	protocolVer
}).

%% 
%% // 获取对象的详细信息，返回按其它常规协议
-define(CMD_U2GS_RequestObjInfo,53644).
-record(pk_U2GS_RequestObjInfo,{
	%% SByte 对象类型
	obj_type,
	%% UInt64 对象列表
	codes
}).

%% 
%% //玩家充值请求
-define(CMD_U2GS_RequestRecharge,20100).
-record(pk_U2GS_RequestRecharge,{
	%% String账号accessToken很长一串
	funcellAccessToken,
	%% String如173:18072:1.1.2:xiaomi
	funcellCilentID,
	%% Stringfuncell的订单号，服务器以些为准，会去重
	funcellOrderID,
	%% String扩展参数，如果有，就组装成json
	extArgs
}).

%% 
%% //打开充值面板时，取出玩家已经参加了的充值项id
-define(CMD_U2GS_RequestRechargeHasGiftIDList,40355).
-record(pk_U2GS_RequestRechargeHasGiftIDList,{
}).

%% 
%% // 客户端请求复活
-define(CMD_U2GS_RequestRevive,60126).
-record(pk_U2GS_RequestRevive,{
	%% UInt32 1：普通复活；2：收费复活；3：自动复活
	reviveType
}).

%% 
%% // 请求目标副本的最高分数
-define(CMD_U2GS_RequestTargetCopyMapScore,43649).
-record(pk_U2GS_RequestTargetCopyMapScore,{
	%% UInt32 目标副本ID
	targetCopyMapID
}).

%% 
%% //重置副本进度
-define(CMD_U2GS_ResetCopyMap,31194).
-record(pk_U2GS_ResetCopyMap,{
	%% UInt16副本地图ID
	copyMapID
}).

%% 
%% // 重置玩家坐标到本地图的复活点
-define(CMD_U2GS_ResetPosToRevivePt,8871).
-record(pk_U2GS_ResetPosToRevivePt,{
}).

%% 
%% // 排序
-define(CMD_U2GS_ResultSort,30881).
-record(pk_U2GS_ResultSort,{
	%% Byte 对什么排序，1品质，2等级，3剩余时间，4出售人，5售价
	sortIndex,
	%% UInt32 排序后获取第几页
	pageNumber,
	%% Byte 排序方式,0无序,1升序,2降序
	sortType,
	%% Byte 操作码
	opCode
}).

%% 
-define(CMD_U2GS_SelPlayerEnterGame,56497).
-record(pk_U2GS_SelPlayerEnterGame,{
	%% UInt64
	roleID
}).

%% 
%% // 选中目标
-define(CMD_U2GS_SelectTarget,65351).
-record(pk_U2GS_SelectTarget,{
	%% UInt64
	code
}).

%% 
-define(CMD_U2GS_SessionKeyAck,6238).
-record(pk_U2GS_SessionKeyAck,{
	%% String
	oldKey,
	%% String
	newKey
}).

%% 
%% // 领取奖励
-define(CMD_U2GS_SevenDayAimReward_Request,18435).
-record(pk_U2GS_SevenDayAimReward_Request,{
	%% UInt16 如同配置表seven_day_aim.id
	id
}).

%% 
%% // 显示动作
-define(CMD_U2GS_ShowAction,50705).
-record(pk_U2GS_ShowAction,{
	%% UInt32 符号索引
	actionIndex
}).

%% 
%% // 显示头顶表情符号
-define(CMD_U2GS_ShowHeadEmoticonIcon,42898).
-record(pk_U2GS_ShowHeadEmoticonIcon,{
	%% UInt32 符号索引
	iconIndex
}).

%% 
%% // 开始灵力冥想
-define(CMD_U2GS_StartMeditation,55614).
-record(pk_U2GS_StartMeditation,{
	%% Boolean true start and false end
	istart
}).

%% 
-define(CMD_U2GS_StopMove,41869).
-record(pk_U2GS_StopMove,{
	%% UInt64移动的目标Code
	code,
	%% Single停止时的坐标点X
	posX,
	%% Single停止时的坐标点Y
	posY
}).

%% 
%% // 领取奖励
-define(CMD_U2GS_ThirtyDayLoginGift_Request,16721).
-record(pk_U2GS_ThirtyDayLoginGift_Request,{
	%% UInt16 如同配置表thirty_day_login_gift.id
	id
}).

%% 
%% // 购买
-define(CMD_U2GS_TradeBuy,8360).
-record(pk_U2GS_TradeBuy,{
	%% Byte 类型，1铜币交易,2元宝交易,3指定交易
	tradeClass,
	%% UInt64 订单ID
	orderID,
	%% Byte 操作码
	opCode
}).

%% 
%% // 拒绝购买
-define(CMD_U2GS_TradeRefuse,49450).
-record(pk_U2GS_TradeRefuse,{
	%% Byte 类型，1铜币交易,2元宝交易,3指定交易
	tradeClass,
	%% UInt64 订单ID
	orderID,
	%% Byte 操作码
	opCode
}).

%% 
-define(CMD_U2GS_Transfer2NewPos,15277).
-record(pk_U2GS_Transfer2NewPos,{
	%% UInt32地图ID
	mapID,
	%% Single新的坐标
	x,
	%% Single
	y
}).

%% 
-define(CMD_U2GS_TransferMap,13167).
-record(pk_U2GS_TransferMap,{
	%% UInt32
	mapId,
	%% String
	waypointName
}).

%% 
%% //翅膀升级消息
-define(CMD_U2GS_WingRise,2862).
-record(pk_U2GS_WingRise,{
	%% UInt32
	itemID,
	%% UInt32物品个数，0为所有
	itemNum,
	%% Byte0: 绑定和非绑并用； 1：只使用绑定
	firstBind
}).

%% 
%% //翅膀一键升级
-define(CMD_U2GS_WingRiseOneTouch,55027).
-record(pk_U2GS_WingRiseOneTouch,{
}).

%% 
%% // xml公告请求
-define(CMD_U2GS_XmlNoticeRequest,36570).
-record(pk_U2GS_XmlNoticeRequest,{
	%% Byte1更新公告;2活动公告
	type,
	%% String小写md5(已有content/否则空串)
	sign
}).

%% 
%% //客户端请购买进入副本次数
-define(CMD_U2GS_buy_action_count,45177).
-record(pk_U2GS_buy_action_count,{
	%% UInt16副本地图ID
	copyMapID
}).

%% 
%% //客户端请购买力值
-define(CMD_U2GS_buy_action_point,7254).
-record(pk_U2GS_buy_action_point,{
}).

%% 
%% //获取好友坐标
-define(CMD_U2GS_getFriendPos,34086).
-record(pk_U2GS_getFriendPos,{
	%% UInt64好友ID
	friendID
}).

%% 
%% //客户端请求获取体力值
-define(CMD_U2GS_get_action_point_info,20727).
-record(pk_U2GS_get_action_point_info,{
}).

%% 
%% //客户端请求获取副本销毁时间
-define(CMD_U2GS_get_copy_map_destory_time,53798).
-record(pk_U2GS_get_copy_map_destory_time,{
}).

%% 
%% //向服务器请求宝藏系统信息
-define(CMD_U2GS_get_lottery_sys_info,37517).
-record(pk_U2GS_get_lottery_sys_info,{
}).

%% 
%% //客户端请求抽奖操作
-define(CMD_U2GS_lottery_start,26618).
-record(pk_U2GS_lottery_start,{
	%% UInt32
	type
}).

%% 
%% // 保存新手引导进度
-define(CMD_U2GS_save_current_guide_id,39509).
-record(pk_U2GS_save_current_guide_id,{
	%% UInt16当前的引导ID
	guideID
}).

-record(pk_UpdateReward,{
	%% UInt16道具ID
	itemid,
	%% UInt16奖励个数
	number
}).

-record(pk_UserPlayerData,{
	%% UInt64 角色ID
	roleID,
	%% String 角色名
	name,
	%% Int32 等级
	level,
	%% Int32 翅膀等级
	wingLevel,
	%% SByte 阵营
	camp,
	%% SByte 种族
	race,
	%% UInt32 职业
	career,
	%% SByte 性别
	sex,
	%% Int32 头
	head,
	%% UInt16 角色所在当前地图ID
	mapID,
	%% UInt16 角色之前所在地图ID
	oldMapID,
	%% Boolean 是否可以修改名字
	canRename,
	%% visibleEquip可见的装备
	visible_equips,
	%% UInt16身上时装列表
	fashionList,
	%% refineLevel装备精炼等级
	refine_levels
}).

-record(pk_lotteryForToweItem,{
	%% UInt32
	pool_id,
	%% UInt32
	cfg_id,
	%% UInt32
	itemID,
	%% UInt32
	itemNumber,
	%% UInt32
	isBind,
	%% Int16
	isWin
}).

-record(pk_lotteryForTowerNotice,{
	%% String
	roleName,
	%% UInt32
	itemID,
	%% UInt32
	itemNumber
}).

-record(pk_lottery_award_item_info,{
	%% UInt32
	itemID,
	%% UInt32
	itemNumber
}).

-record(pk_lsbattlefield_award,{
	%% UInt16道具ID
	itemid,
	%% UInt16奖励个数
	number,
	%% UInt32是否绑定
	isBind
}).

-record(pk_lsbattlefield_rank,{
	%% UInt16名次
	index,
	%% UInt16
	score,
	%% String
	roleName
}).

-record(pk_pushItem,{
	%% UInt32
	sku,
	%% UInt32
	itemID,
	%% UInt16
	num,
	%% Byte0 非绑，1 绑定				
	isBinded,
	%% UInt32
	price,
	%% Byte
	rebate,
	%% Byte1 砖石，2 非绑砖石
	coinType,
	%% Byte购买限制次数
	limited
}).

-record(pk_refineLevel,{
	%% Byte
	type,
	%% Byte
	level
}).

-record(pk_visibleEquip,{
	%% UInt32装备ID
	equipID,
	%% Byte当前品质值
	quality
}).

-record(pk_ActivityMapRankData,{
	%% String 角色名
	name,
	%% UInt32值
	value
}).

%% 
%% // 到点刷新，通知所有在线玩家
-define(CMD_GS2U_ActivityMapRankData,40315).
-record(pk_GS2U_ActivityMapRankData,{
	%% Byte 排行榜类型
	type,
	%% ActivityMapRankData数据列表
	data
}).

%% 
-define(CMD_GS2U_MyKillNumber,62615).
-record(pk_GS2U_MyKillNumber,{
	%% Byte 排行榜类型
	type,
	%% UInt16我杀的人数（防守方）
	killNumber
}).

%% 
%% //扩展数据
-define(CMD_GS2U_MyRankingAndDamage,36976).
-record(pk_GS2U_MyRankingAndDamage,{
	%% Byte 排行榜类型
	type,
	%% UInt16我的名次（进攻方）
	ranking,
	%% UInt32伤害值
	damage
}).

%% 
%% // 到点刷新，通知所有在线玩家
-define(CMD_GS2U_RefreshRank,31147).
-record(pk_GS2U_RefreshRank,{
	%% Byte 排行榜类型
	type
}).

%% 
%% // 返回该类型排行榜上这个玩家的roleinfo
-define(CMD_GS2U_SendPropList,63201).
-record(pk_GS2U_SendPropList,{
	%% UInt64 角色ID
	roleID,
	%% UInt64 玩家流水号
	playerCode,
	%% UInt32 职业
	career,
	%% SByte 种族
	race,
	%% SByte 性别
	sex,
	%% Int32
	head,
	%% Int32 翅膀等级
	wingLevel,
	%% Int32 时装ID列表
	fashionIDs,
	%% PlayerEquip 装备ID列表
	equipIDList,
	%% PlayerEquipLevel装备等级列表
	equipLevelList
}).

%% 
%% // 返回该类型的排行榜数据
-define(CMD_GS2U_SendRank,44328).
-record(pk_GS2U_SendRank,{
	%% Byte 排行榜类型
	type,
	%% RankInfo
	datas
}).

-record(pk_PlayerEquip,{
	%% UInt32 装备ID
	equipID,
	%% Byte 品质
	quality
}).

-record(pk_PlayerEquipLevel,{
	%% Byte
	type,
	%% Byte
	level
}).

-record(pk_RankInfo,{
	%% Byte 排行榜名次
	rankSort,
	%% SByte 排行榜名次变化，正数为上升，负数为下降
	rankSortC,
	%% UInt64 角色ID
	roleID,
	%% String 角色名
	name,
	%% Int32 翅膀等级
	wingLevel,
	%% Int64 排行榜数值1
	rankValue1,
	%% Int64 排行榜数值2(如果排行榜类型为5(宠物榜)，则此项保存的是上榜的宠物ID，右侧显示对应的宠物)
	rankValue2,
	%% Int64 排行榜数值3
	rankValue3,
	%% TitleData 排行榜中玩家的称号
	title
}).

-record(pk_TitleData,{
	%% UInt32
	title1,
	%% UInt32
	title2,
	%% UInt32
	title3,
	%% UInt32
	color,
	%% UInt32
	background
}).

%% 
%% //请求活动地图中的榜单
-define(CMD_U2GS_RequestActivityMapRank,59920).
-record(pk_U2GS_RequestActivityMapRank,{
	%% Byte 排行榜类型
	type
}).

%% 
%% // 请求该类型排行榜上这个玩家的roleinfo
-define(CMD_U2GS_RequestPropList,51618).
-record(pk_U2GS_RequestPropList,{
	%% Byte 排行榜类型
	type,
	%% UInt64 角色ID
	roleID
}).

%% 
%% // 请求该类型的排行榜数据
-define(CMD_U2GS_RequestRank,28761).
-record(pk_U2GS_RequestRank,{
	%% Byte 排行榜类型
	type
}).

%% 
%% // 按排行榜名次领奖(每次重新发榜均可再次领奖)
-define(CMD_U2GS_RequestRankAward,1992).
-record(pk_U2GS_RequestRankAward,{
	%% Byte 排行榜类型
	type
}).

%% 
%% //红包日志数据
-define(CMD_GS2U_RedEnvelopeHistoryAck,43886).
-record(pk_GS2U_RedEnvelopeHistoryAck,{
	%% redEnvelopeHistory
	historyList
}).

%% 
%% //根据红包id取红包信息Ack  查看详情
-define(CMD_GS2U_RedEnvelopeInfoAck,3550).
-record(pk_GS2U_RedEnvelopeInfoAck,{
	%% redEnvelopeInfo红包信息
	red
}).

%% 
%% //请求可抢红包
-define(CMD_GS2U_RedEnvelopeQuery,61011).
-record(pk_GS2U_RedEnvelopeQuery,{
	%% redEnvelopeBaseInfo
	redEnvelopeList
}).

%% 
%% //抢红包Ack
-define(CMD_GS2U_RobRedEnvelopeAck,33445).
-record(pk_GS2U_RobRedEnvelopeAck,{
	%% UInt32抢到的数额
	robAmount,
	%% redEnvelopeInfo
	red
}).

%% 
%% //玩家放弃抢本轮红包
-define(CMD_U2GS_GiveUpRedEnvelope,5631).
-record(pk_U2GS_GiveUpRedEnvelope,{
}).

%% 
%% //红包日志
-define(CMD_U2GS_RedEnvelopeHistory,22545).
-record(pk_U2GS_RedEnvelopeHistory,{
}).

%% 
%% //根据红包id取红包信息
-define(CMD_U2GS_RedEnvelopeInfo,45733).
-record(pk_U2GS_RedEnvelopeInfo,{
	%% UInt64红包id
	redUID
}).

%% 
%% //请求可抢红包
-define(CMD_U2GS_RedEnvelopeQuery,44837).
-record(pk_U2GS_RedEnvelopeQuery,{
	%% Byte1世界，2军团，3结婚，4地图,5为指定玩家红包
	targetType
}).

%% 
%% //抢红包
-define(CMD_U2GS_RobRedEnvelope,62102).
-record(pk_U2GS_RobRedEnvelope,{
	%% UInt64红包id,
	redUID
}).

%% 
%% //发红包
-define(CMD_U2GS_SendRedEnvelope,8879).
-record(pk_U2GS_SendRedEnvelope,{
	%% Byte	红包类型:1定额，2随机
	type,
	%% Byte1世界，2军团，3结婚，4地图,5为指定玩家红包
	targetType,
	%% UInt64指定对象UID，玩家ID/0表示不指定玩家，军团ID，地图ID
	targetUID,
	%% UInt32目标人数：0不限制
	allNumber,
	%% UInt32
	allMoney,
	%% String祝福语
	luckContent
}).

-record(pk_redEnvelopeBaseInfo,{
	%% UInt64红包id,
	redUID,
	%% UInt64
	creatorRoleID,
	%% UInt64指定对象UID，玩家ID/0表示不指定玩家，军团ID，地图ID
	targetUID,
	%% String祝福语
	luckContent,
	%% String发红包的玩家名
	creatorName,
	%% UInt32
	creatorLevel,
	%% Byte	红包类型:1定额，2随机
	type,
	%% Byte	红包类型:1世界，2军团，3结婚，4地图
	targetType,
	%% UInt32发红包玩家的职业id
	creatorCareer,
	%% Byte发红包玩家的种族
	creatorRace,
	%% Byte发红包玩家的性别
	creatorSex,
	%% Int32发红包玩家的头
	creatorHead,
	%% UInt32
	allMoney,
	%% UInt32红包发的总个数
	allNumber,
	%% UInt32红包已经领取钱
	takenMoney,
	%% UInt32红包已经领取个数
	takenNumber
}).

-record(pk_redEnvelopeHistory,{
	%% UInt64红包id,
	redUID,
	%% UInt64
	creatorRoleID,
	%% String发红包的玩家名
	creatorName,
	%% UInt32发红包的时间
	createTime,
	%% Byte1世界，2军团，3结婚，4地图
	targetType,
	%% Int32抢到的钱或发的红包总额
	moneyNumber
}).

-record(pk_redEnvelopeInfo,{
	%% redEnvelopeBaseInfo
	baseInfo,
	%% takeHistory已经领取的记录
	takenList
}).

-record(pk_takeHistory,{
	%% UInt64
	takeRoleID,
	%% String
	takeName,
	%% UInt32
	takeTime,
	%% UInt32
	takeMoney
}).

%% 
%% //删除符文
-define(CMD_DeleteRunes,314).
-record(pk_DeleteRunes,{
	%% UInt64
	runeUIDS
}).

%% 
-define(CMD_GS2U_QueryRuneTipsAck,32828).
-record(pk_GS2U_QueryRuneTipsAck,{
	%% RuneInfo
	info
}).

%% 
%% //远程玩家的符文列表，供查看远程玩家使用
-define(CMD_GS2U_RPRuneInfoList,39668).
-record(pk_GS2U_RPRuneInfoList,{
	%% UInt64
	targetRoleID,
	%% RuneInfo
	runeList
}).

%% 
%% //符文成功洗练结果，失败提示errorcode
-define(CMD_GS2U_RuneCastAck,6856).
-record(pk_GS2U_RuneCastAck,{
	%% RuneInfo
	runeInfo,
	%% UInt64删除的符文UID列表
	runeUIDS
}).

%% 
%% //符文洗练出的属性
-define(CMD_GS2U_RuneCastProp,15200).
-record(pk_GS2U_RuneCastProp,{
	%% UInt64 标识
	flagID,
	%% RuneBaseProp 老的属性
	oldprop,
	%% RuneBaseProp 洗练出的属性
	newprop
}).

%% 
%% //符文合成结果
-define(CMD_GS2U_RuneCompoundAck,2048).
-record(pk_GS2U_RuneCompoundAck,{
	%% RuneInfo
	runeInfo
}).

%% 
-define(CMD_GS2U_RuneEmbedOffAck,33645).
-record(pk_GS2U_RuneEmbedOffAck,{
	%% RuneInfo
	runeList
}).

%% 
-define(CMD_GS2U_RuneEmbedOnAck,12783).
-record(pk_GS2U_RuneEmbedOnAck,{
	%% UInt32镶嵌到玩家身上为1，镶嵌到宠物身上为宠物ID
	targetID,
	%% RuneInfo
	runeList
}).

%% 
%% //符文格子数量
-define(CMD_GS2U_RuneGrid,64968).
-record(pk_GS2U_RuneGrid,{
	%% Byte 1表示玩家，2表示宠物的符文
	ownerID,
	%% UInt16
	cur,
	%% UInt16
	max
}).

%% 
%% //符文列表
-define(CMD_GS2U_RuneInfoList,49510).
-record(pk_GS2U_RuneInfoList,{
	%% RuneInfo
	runeList
}).

%% 
%% //熔炼成功结果，失败不返回结果，只提示
-define(CMD_GS2U_RuneMeltAck,54059).
-record(pk_GS2U_RuneMeltAck,{
	%% RuneInfo
	runeInfo,
	%% UInt64删除的符文UID列表
	runeUIDS
}).

%% 
%% // 通过GM指令打开符文面板
-define(CMD_GS2U_RuneOpenBorad,30388).
-record(pk_GS2U_RuneOpenBorad,{
	%% Int32
	code
}).

%% 
%% //符文卸载和镶嵌的时候，下发操作的单个套装属性
-define(CMD_GS2U_RuneSuitPropList,920).
-record(pk_GS2U_RuneSuitPropList,{
	%% RuneSuitProp
	suitProps
}).

-record(pk_RuneBaseProp,{
	%% Byte
	prop,
	%% Byte 属性计算方式：0加法，1乘法
	calcType,
	%% Single
	value
}).

%% 
%% //符文镶嵌
-define(CMD_RuneEmbedOn,50666).
-record(pk_RuneEmbedOn,{
	%% UInt64符文UID
	runeUIDs,
	%% UInt32镶嵌到玩家身上为1，镶嵌到宠物身上为宠物ID
	targetID
}).

-record(pk_RuneInfo,{
	%% UInt64
	runeUID,
	%% UInt32 0为背包，1为玩家穿戴中，其它为某个宠物ID穿戴中
	pos,
	%% UInt32
	runeID,
	%% Byte 品阶
	level,
	%% UInt32
	exp,
	%% Boolean
	isBind,
	%% UInt32 剩余有效时间，单位秒，为0表示永久有效
	validSecond,
	%% RuneBaseProp基础属性
	baseProps,
	%% RuneRandProp随机属性
	randProps
}).

-record(pk_RuneRandProp,{
	%% RuneBaseProp
	prop,
	%% UInt32 序号
	indexNumber
}).

-record(pk_RuneSuitProp,{
	%% RuneBaseProp
	props,
	%% UInt32 套装ID
	suitID,
	%% Byte 套装件数
	suitNum,
	%% UInt32 1表示玩家自身，其它ID表示对应宠物
	ownerID
}).

%% 
%% //开启格子
-define(CMD_U2GS_OpenRuneGrid,63316).
-record(pk_U2GS_OpenRuneGrid,{
	%% Byte 1表示玩家，2表示宠物的符文
	ownerID,
	%% UInt16
	openNumber
}).

%% 
%% // 设置相关协议
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% //查看符文tips
-define(CMD_U2GS_QueryRuneTips,36684).
-record(pk_U2GS_QueryRuneTips,{
	%% UInt64
	runeUID
}).

%% 
%% //请求符文的套装属性
-define(CMD_U2GS_RequestSuitProp,31041).
-record(pk_U2GS_RequestSuitProp,{
	%% UInt32 1表示玩家自身，其它ID表示对应宠物
	ownerID
}).

%% 
%% //符文洗练
-define(CMD_U2GS_RuneCast,9487).
-record(pk_U2GS_RuneCast,{
	%% UInt64目标
	targetUID,
	%% UInt32目标随机属性序号
	indexNumber,
	%% UInt64材料
	materialUID
}).

%% 
%% //确认或者放弃
-define(CMD_U2GS_RuneCastAffirm,18474).
-record(pk_U2GS_RuneCastAffirm,{
	%% UInt64 标识
	flagID,
	%% Boolean true确认，false放弃
	isAffirm
}).

%% 
%% //符文合成
-define(CMD_U2GS_RuneCompound,22231).
-record(pk_U2GS_RuneCompound,{
	%% UInt32
	compoundID
}).

%% 
%% //符文拆卸
-define(CMD_U2GS_RuneEmbedOff,27422).
-record(pk_U2GS_RuneEmbedOff,{
	%% UInt64符文UID
	runeUIDs
}).

%% 
%% //符文熔炼
-define(CMD_U2GS_RuneMelt,52280).
-record(pk_U2GS_RuneMelt,{
	%% UInt64 目标符文UID
	targetRuneUID,
	%% UInt64熔炼符文UIDs
	materialUIDS
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% // 测试相关的协议
%% // 
-define(CMD_GS2U_GridPlayerRotw,323).
-record(pk_GS2U_GridPlayerRotw,{
	%% Int32 角度
	rotw,
	%% UInt64 目标玩家列表
	codes
}).

%% 
-define(CMD_Any_UpdateBitVariant,61248).
-record(pk_Any_UpdateBitVariant,{
	%% SwitchVariantInfo 更新开关变量
	updateVariantList
}).

%% 
-define(CMD_Any_UpdateVariant,58193).
-record(pk_Any_UpdateVariant,{
	%% VariantInfo
	updateVariantList
}).

%% 
-define(CMD_GS2U_VariantInfo,33971).
-record(pk_GS2U_VariantInfo,{
	%% VariantInfo
	variantList
}).

-record(pk_SwitchVariantInfo,{
	%% UInt32 位索引
	bitIndex,
	%% Boolean 位值
	bitValue
}).

%% 
%% // 设置相关协议
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
-define(CMD_U2GS_AllTeamInvitationSetting,835).
-record(pk_U2GS_AllTeamInvitationSetting,{
	%% Byte 1.开；2.关
	onOrOff
}).

-record(pk_VariantInfo,{
	%% UInt16需要修改设置项的下标
	index,
	%% UInt32设置的值（考虑到以后的数值类设置）
	value
}).

%% 
%% //领取绑定手机奖励
-define(CMD_BindPhoneAwardGet,44962).
-record(pk_BindPhoneAwardGet,{
}).

%% 
%% //每日签到
-define(CMD_EveryDaySignIn,17267).
-record(pk_EveryDaySignIn,{
}).

%% 
-define(CMD_GS2U_BindPhoneResult,7478).
-record(pk_GS2U_BindPhoneResult,{
	%% Boolean
	isSuccess
}).

%% 
%% //签到初始信息
-define(CMD_GS2U_SignIn,13078).
-record(pk_GS2U_SignIn,{
	%% SignInInfo
	info_list,
	%% UInt64UTC时间（相对于1970年第0秒），单位秒
	time
}).

%% 
%% //七日签到
-define(CMD_SevenDaySignIn,65465).
-record(pk_SevenDaySignIn,{
	%% Byte签到的天数
	dayCount
}).

-record(pk_SignInInfo,{
	%% Byte签到类型，0：每日签到，1:七日签到
	signType,
	%% SignItem签到奖励道具列表
	itemList,
	%% Byte签到状态，0：未签，1：已签，2:不能签
	signState
}).

-record(pk_SignItem,{
	%% UInt16道具编号ID
	itemID,
	%% UInt16堆叠个数
	itemNumber
}).

%% 
%% //累计奖励
-define(CMD_U2GS_AccuReward,39405).
-record(pk_U2GS_AccuReward,{
	%% Byte
	id
}).

%% 
-define(CMD_U2GS_BindPhone,10295).
-record(pk_U2GS_BindPhone,{
	%% String
	funcellCilentID,
	%% String
	accessToken,
	%% UInt64手机号码
	phoneNum,
	%% String验证流水号
	verifyid,
	%% String玩家填的验证码
	content
}).

%% 
%% //新版本  
%% //每日签到
-define(CMD_U2GS_SignIn,25944).
-record(pk_U2GS_SignIn,{
}).

%% 
%% //技能改变处理结果
-define(CMD_GS2U_ChangeSkillSlotResult,13768).
-record(pk_GS2U_ChangeSkillSlotResult,{
	%% UInt32改变类型（添加 or 移除 0是添加，1是移除，出错为2）
	changeType,
	%% SByte技能类型（主动技能或被动技能）
	skillType,
	%% UInt32技能 以前的下标（默认为 0，表示以前没有添加此技能）
	oldIndex,
	%% SkillSlotInfo改变后的技能槽信息
	newSkillInfo
}).

%% 
%% //主动技能信息列表（玩家上线发送）
-define(CMD_GS2U_InitiativeSkillSlotInfoList,57483).
-record(pk_GS2U_InitiativeSkillSlotInfoList,{
	%% SkillSlotInfo技能槽技能信息列表
	skillSlotList
}).

%% 
%% //技能开放
-define(CMD_GS2U_OpenSkill,53903).
-record(pk_GS2U_OpenSkill,{
	%% UInt32技能ID
	skillId
}).

%% 
%% //技能槽开放
-define(CMD_GS2U_OpenSlot,41992).
-record(pk_GS2U_OpenSlot,{
	%% OpenSlot技能槽类型 1:主动技能槽 2:被动技能槽 3:变身技能
	openSlot
}).

%% 
%% //开放的技能槽列表
-define(CMD_GS2U_OpenSlotList,17042).
-record(pk_GS2U_OpenSlotList,{
	%% OpenSlot技能槽列表 
	slotList
}).

%% 
%% //被动技能信息列表（玩家上线发送）
-define(CMD_GS2U_PassiveSkillSlotInfoList,64100).
-record(pk_GS2U_PassiveSkillSlotInfoList,{
	%% SkillSlotInfo技能槽技能信息列表
	skillSlotList
}).

%% 
%% //技能减少CD时间
-define(CMD_GS2U_ReduceCD,6635).
-record(pk_GS2U_ReduceCD,{
	%% UInt32技能ID
	skillId,
	%% UInt32技能减少后CD
	cd
}).

%% 
%% //升级结果
-define(CMD_GS2U_SkillInfo,42635).
-record(pk_GS2U_SkillInfo,{
	%% UInt32技能ID
	id,
	%% UInt32技能等级
	level
}).

%% 
%% //技能信息列表
-define(CMD_GS2U_SkillInfoList,15045).
-record(pk_GS2U_SkillInfoList,{
	%% UInt64
	code,
	%% SkillInfo
	skillInfoList
}).

%% 
%% //变身技能信息列表（玩家上线发送）
-define(CMD_GS2U_TransformSkillSlotInfoList,19023).
-record(pk_GS2U_TransformSkillSlotInfoList,{
	%% SkillSlotInfo技能槽技能信息列表
	skillSlotList
}).

%% 
%% //技能升级（学习）结果
-define(CMD_GS2U_UpgradeSkill_Result,31943).
-record(pk_GS2U_UpgradeSkill_Result,{
	%% UInt32 技能升级结果(等级不足,钱币不足,最大等级,声望不足,能量不足,装备要求)
	resultCode,
	%% SkillInfo
	skillinfo
}).

-record(pk_OpenSlot,{
	%% Byte技能槽编号
	slot,
	%% Byte技能槽类型 1:主动技能槽 2:被动技能槽 3:变身技能
	type
}).

-record(pk_SkillInfo,{
	%% UInt32技能ID
	id,
	%% UInt32技能等级
	level,
	%% UInt32技能剩余CD时间，单位（毫秒）
	remainCD
}).

-record(pk_SkillSlotInfo,{
	%% UInt32技能在卡槽的位置
	index,
	%% UInt32技能ID
	skillID
}).

%% 
%% //技能改变
-define(CMD_U2GS_ChangeSkillSlotRequest,58650).
-record(pk_U2GS_ChangeSkillSlotRequest,{
	%% UInt32改变类型（添加 or 移除 0是添加，1是移除）
	changeType,
	%% SByte技能类型（主动技能或被动技能）
	skillType,
	%% SkillSlotInfo将要改变的技能槽信息
	changeSkillInfo
}).

%% 
%% //重置技能
-define(CMD_U2GS_ResetSkill,21348).
-record(pk_U2GS_ResetSkill,{
}).

%% 
%% //升级技能
-define(CMD_U2GS_UpSkill,800).
-record(pk_U2GS_UpSkill,{
	%% UInt32
	id,
	%% UInt3211：一键升级; 其他值 升一级
	type
}).

%% 
%% //技能升级（学习）请求
-define(CMD_U2GS_UpgradeSkill_Request,48791).
-record(pk_U2GS_UpgradeSkill_Request,{
	%% UInt32	技能 ID
	skillId
}).

%% 
%% //初始化所有属性的等级
-define(CMD_GS2U_TalentInitAck,17717).
-record(pk_GS2U_TalentInitAck,{
	%% TalentInfo
	talentInfos
}).

%% 
-define(CMD_GS2U_TalentLevelUpSuccess,33052).
-record(pk_GS2U_TalentLevelUpSuccess,{
	%% TalentInfo
	talentInfo
}).

-record(pk_TalentInfo,{
	%% Byte天赋id
	id,
	%% Byte天赋等级
	level,
	%% UInt64下一级需要的天赋经验
	nextlevelexp
}).

%% 
-define(CMD_U2GS_TalentInit,43814).
-record(pk_U2GS_TalentInit,{
}).

%% 
-define(CMD_U2GS_TalentLevelUp,55001).
-record(pk_U2GS_TalentLevelUp,{
	%% Byte
	id
}).

%% 
%% //增加任务
-define(CMD_GS2U_AcceptTask,3141).
-record(pk_GS2U_AcceptTask,{
	%% taskInfo
	info
}).

%% 
%% //接受任务列表(废弃)
-define(CMD_GS2U_AcceptTaskList,49439).
-record(pk_GS2U_AcceptTaskList,{
	%% acceptedBaseTask
	list
}).

%% 
%% //增加新接受任务(废弃)
-define(CMD_GS2U_AddNewAcceptTask,39928).
-record(pk_GS2U_AddNewAcceptTask,{
	%% Int32
	taskID,
	%% Int32
	result
}).

%% 
%% //通知客户端环任务的完成情况
-define(CMD_GS2U_AddNewCompleteLoopTasks,52718).
-record(pk_GS2U_AddNewCompleteLoopTasks,{
	%% Int32 0普通完成 1花钱完成
	result,
	%% Int32 完成进度
	progress,
	%% Int32 总进度
	allProgress,
	%% Int32 完成的任务
	listTaskID,
	%% Int32 获得的十环奖励对应级别
	listLevel
}).

%% 
%% //通知客户端校增加新完成任务(废弃)
-define(CMD_GS2U_AddNewCompleteTask,20405).
-record(pk_GS2U_AddNewCompleteTask,{
	%% Int32
	result,
	%% Int32
	taskID
}).

%% 
%% //提交的任务占位列表，每一个uint64表示64个任务ID（按位表示），
%% //具体是多少依据占列表中的索引号来计算
-define(CMD_GS2U_CompleteTaskList,57012).
-record(pk_GS2U_CompleteTaskList,{
	%% SubmittedTaskInfo
	list
}).

%% 
%% //删除任务
-define(CMD_GS2U_DeleteAcceptTask,17300).
-record(pk_GS2U_DeleteAcceptTask,{
	%% Int32
	taskID,
	%% Int32
	result
}).

%% 
%% //NPC对话任务结果
-define(CMD_GS2U_TalkToNpcResult,30499).
-record(pk_GS2U_TalkToNpcResult,{
	%% Int32
	result,
	%% UInt64
	code
}).

%% 
%% // 任务列表
-define(CMD_GS2U_TaskList,7479).
-record(pk_GS2U_TaskList,{
	%% taskInfo
	list
}).

%% 
%% //更新已接受任务信息(废弃)
-define(CMD_GS2U_UpdateAcceptTask,14926).
-record(pk_GS2U_UpdateAcceptTask,{
	%% Int32
	result,
	%% acceptedBaseTask
	acceptTaskInfo
}).

%% 
%% //更新任务信息
-define(CMD_GS2U_UpdateTask,19758).
-record(pk_GS2U_UpdateTask,{
	%% taskInfo
	info
}).

-record(pk_SubmittedTaskInfo,{
	%% UInt16
	slot,
	%% UInt64
	value
}).

%% 
%% //接取任务
-define(CMD_U2GS_AcceptTask,35751).
-record(pk_U2GS_AcceptTask,{
	%% Int32任务ID
	taskID,
	%% UInt64NPC编码
	npcCode
}).

%% 
%% //采集对象请求
-define(CMD_U2GS_CollectObj,43491).
-record(pk_U2GS_CollectObj,{
	%% UInt64采集对象code
	code
}).

%% 
%% //放弃任务
-define(CMD_U2GS_DropTask,24126).
-record(pk_U2GS_DropTask,{
	%% Int32
	taskID
}).

%% 
%% //请求接取环任务
-define(CMD_U2GS_RequestAcceptLoopTask,64530).
-record(pk_U2GS_RequestAcceptLoopTask,{
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% //请求接取任务(废弃)
-define(CMD_U2GS_RequestAcceptTask,19210).
-record(pk_U2GS_RequestAcceptTask,{
	%% Int32任务ID
	taskID,
	%% UInt64NPC编码
	code
}).

%% 
%% //请求一键完成环任务
-define(CMD_U2GS_RequestCompleteLoopTaskByOneKey,20755).
-record(pk_U2GS_RequestCompleteLoopTaskByOneKey,{
}).

%% 
%% //请求单次完成环任务
-define(CMD_U2GS_RequestCompleteOneLoopTaskByOneKey,9733).
-record(pk_U2GS_RequestCompleteOneLoopTaskByOneKey,{
}).

%% 
%% //任务重置
-define(CMD_U2GS_ResetTask,28782).
-record(pk_U2GS_ResetTask,{
	%% Int32
	taskID
}).

%% 
%% //归还任务
-define(CMD_U2GS_SumbitTask,8517).
-record(pk_U2GS_SumbitTask,{
	%% Int32
	taskID,
	%% UInt64
	code
}).

%% 
%% //NPC对话任务请求
-define(CMD_U2GS_TalkToNpc,7564).
-record(pk_U2GS_TalkToNpc,{
	%% UInt64
	code
}).

%% 
%% //使用物品请求
-define(CMD_U2GS_UseItemObj,53415).
-record(pk_U2GS_UseItemObj,{
	%% UInt64使用物品code
	code
}).

-record(pk_acceptedAimTask,{
	%% Int32子任务类型，如杀怪，采集等等
	aimType,
	%% Int32具体子任务类型下的数据，如：杀怪子任务为怪物ID，采集子任务为采集物ID
	aimIndex,
	%% Int32数量，如：杀怪子任务为杀怪数量，采集子任务为采集数量
	aimCurCount
}).

-record(pk_acceptedBaseTask,{
	%% Int32
	taskID,
	%% acceptedAimTask
	taskProcess
}).

-record(pk_taskInfo,{
	%% Int32
	taskID,
	%% Int32
	target,
	%% Int32
	curNumber,
	%% Int32
	maxNumber
}).

-record(pk_FightingCapacityInfo,{
	%% UInt64
	roleID,
	%% UInt64 战斗力
	fightingCapacity
}).

%% 
%% //添加队友信息
-define(CMD_GS2U_AddTeamMemberInfo,40018).
-record(pk_GS2U_AddTeamMemberInfo,{
	%% Byte队伍类型
	teamType,
	%% TeamMemberInfo
	memberInfo
}).

%% 
%% //询问，有人邀请你
-define(CMD_GS2U_BeenInviteTeam,28790).
-record(pk_GS2U_BeenInviteTeam,{
	%% Byte队伍类型
	teamType,
	%% Byte邀请类型(1.邀请加入;2.申请入队)
	inviteType,
	%% UInt64邀请玩家ID
	inviterPlayerID,
	%% String邀请玩家姓名
	inviterPlayerName
}).

%% 
%% //移除队友信息
-define(CMD_GS2U_DelTeammateInfo,24383).
-record(pk_GS2U_DelTeammateInfo,{
	%% Byte队伍类型
	teamType,
	%% UInt64
	teammateID
}).

%% 
-define(CMD_GS2U_FastTeamAck,53040).
-record(pk_GS2U_FastTeamAck,{
}).

%% 
-define(CMD_GS2U_FastTeamSucc,30215).
-record(pk_GS2U_FastTeamSucc,{
	%% UInt16进入副本倒计时 单位 秒
	time
}).

%% 
%% //询问，有人邀请你
-define(CMD_GS2U_InviteUJoinTeam,44111).
-record(pk_GS2U_InviteUJoinTeam,{
	%% Int32
	copyMapID,
	%% UInt64邀请玩家ID
	inviterPlayerID,
	%% String邀请玩家姓名
	inviterPlayerName,
	%% UInt64 帮会ID
	guildID,
	%% String 角色名字
	guildName,
	%% Byte 是否是好友(1是)
	friendState
}).

%% 
%% // 被T
-define(CMD_GS2U_KickOutByLeader,57308).
-record(pk_GS2U_KickOutByLeader,{
	%% Byte队伍类型
	teamType
}).

%% 
%% //队伍信息
-define(CMD_GS2U_MyTeamInfo,36807).
-record(pk_GS2U_MyTeamInfo,{
	%% TeamBaseInfo
	base,
	%% TeamMemberInfo
	infos
}).

%% 
-define(CMD_GS2U_NearTeamInfo,13971).
-record(pk_GS2U_NearTeamInfo,{
	%% Byte队伍类型
	teamType,
	%% NearTeamInfo
	teamInfoList
}).

%% 
-define(CMD_GS2U_NearbyPlayer_Ack,57966).
-record(pk_GS2U_NearbyPlayer_Ack,{
	%% NotTeamMemberInfo
	list
}).

%% 
%% //新增队员信息
-define(CMD_GS2U_NewMemberJoin,10808).
-record(pk_GS2U_NewMemberJoin,{
	%% TeamMemberInfo
	info
}).

%% 
%% //查询玩家列表
-define(CMD_GS2U_QueryRoleListAck,55541).
-record(pk_GS2U_QueryRoleListAck,{
	%% Int32
	queryType,
	%% OnlineMemberSnapshot
	playerList
}).

%% 
%% //查询队伍列表
-define(CMD_GS2U_QueryTeamListAck,60002).
-record(pk_GS2U_QueryTeamListAck,{
	%% TeamSnapshot
	teamSnapshot
}).

%% 
%% //操作结果
-define(CMD_GS2U_QuickTeamMatchAck,546).
-record(pk_GS2U_QuickTeamMatchAck,{
	%% Int32
	result,
	%% UInt64
	startTime
}).

%% 
%% //发送队伍队员战斗力到客户端
-define(CMD_GS2U_RequestFightingCapacity,28959).
-record(pk_GS2U_RequestFightingCapacity,{
	%% FightingCapacityInfo
	fightingCapacityInfos
}).

%% 
%% //队长切换
-define(CMD_GS2U_TeamChangeLeader,55574).
-record(pk_GS2U_TeamChangeLeader,{
	%% Byte队伍类型
	teamType,
	%% UInt64新的队长ID
	newLeaderID
}).

%% 
%% // 队伍解散
-define(CMD_GS2U_TeamDisbanded,12825).
-record(pk_GS2U_TeamDisbanded,{
	%% Byte队伍类型
	teamType
}).

%% 
%% //队伍信息
-define(CMD_GS2U_TeamInfo,55031).
-record(pk_GS2U_TeamInfo,{
	%% Byte
	teamType,
	%% Int64
	teamID,
	%% UInt64
	leaderID,
	%% TeamMemberInfo
	info_list,
	%% String 扩展属性
	customProp
}).

%% 
%% //队长点击开始副本
-define(CMD_GS2U_TeamLeaderStartCopymap,47759).
-record(pk_GS2U_TeamLeaderStartCopymap,{
	%% Int32
	copyMapID
}).

%% 
%% //----------------------------------------------------------------
%% //----------------------------------------------------------------
%% //----------------------------------------------------------------
%% //----------------------------------------------------------------
%% //----------------------------------------------------------------
%% //队员额外信息（实时性比较强的信息）
-define(CMD_GS2U_TeamMemberExtInfo,23416).
-record(pk_GS2U_TeamMemberExtInfo,{
	%% UInt64 角色ID
	roleID,
	%% UInt16 等级
	level,
	%% Byte 血量百分比
	hpPC,
	%% UInt16 所在的地图
	mapID
}).

%% 
-define(CMD_GS2U_TeamMemberOffline,63632).
-record(pk_GS2U_TeamMemberOffline,{
	%% Byte 队伍类型
	teamType,
	%% UInt64
	playerID
}).

%% 
-define(CMD_GS2U_TeamMemberOnline,17622).
-record(pk_GS2U_TeamMemberOnline,{
	%% Byte 队伍类型
	teamType,
	%% UInt64
	playerID,
	%% UInt64 角色流水号	
	code,
	%% UInt16
	level
}).

%% 
%% //队员上下线
-define(CMD_GS2U_TeamMemberOnlineState,45527).
-record(pk_GS2U_TeamMemberOnlineState,{
	%% UInt64
	playerID,
	%% Int32 1 上线； 0 离线
	state
}).

%% 
%% // 队伍重置，包括，被踢，离开队伍，解散队伍
%% // 相关的提示将会通过errorcode来提示
-define(CMD_GS2U_TeamReset,10754).
-record(pk_GS2U_TeamReset,{
}).

%% 
%% // 队友离队
-define(CMD_GS2U_TeammateLeave,39901).
-record(pk_GS2U_TeammateLeave,{
	%% UInt64
	teammateID
}).

%% 
%% // 队友离队
-define(CMD_GS2U_TeammateLeaveAwayTeam,51520).
-record(pk_GS2U_TeammateLeaveAwayTeam,{
	%% Byte队伍类型
	teamType,
	%% UInt64
	teammateID
}).

%% 
%% //给玩家同步队友位置信息
-define(CMD_GS2U_TeammateLocation,34795).
-record(pk_GS2U_TeammateLocation,{
	%% TeamMemberLocation
	teammateLocations
}).

%% 
%% //队员回复进副本
-define(CMD_GS2U_TeammateStartCopymapAck,6678).
-record(pk_GS2U_TeammateStartCopymapAck,{
	%% UInt64 角色ID
	playerID,
	%% Byte 0.拒绝;1.同意;
	isAgree
}).

%% 
%% //队员额外信息（实时性比较强的信息）
-define(CMD_GS2U_UpdateMemberExInfo,34340).
-record(pk_GS2U_UpdateMemberExInfo,{
	%% TeamMemberInfoEx
	infoEx
}).

%% 
%% //队伍信息变化，主要是切换副本，或者换队长
-define(CMD_GS2U_UpdateTeamInfo,25304).
-record(pk_GS2U_UpdateTeamInfo,{
	%% TeamBaseInfo
	base
}).

-record(pk_NearTeamInfo,{
	%% Int64
	teamID,
	%% UInt64
	leaderID,
	%% String队长名字
	leaderName,
	%% Int16队长等级
	leaderLevel,
	%% Byte队伍人数
	numberOfTeam,
	%% UInt32 职业
	career,
	%% Byte 种族
	race,
	%% Byte 性别
	sex,
	%% Int32 头
	head
}).

-record(pk_NotTeamMemberInfo,{
	%% UInt64 角色ID
	id,
	%% String 姓名
	name,
	%% UInt16 等级
	level,
	%% UInt32 职业
	career,
	%% Byte 种族
	race,
	%% Byte 性别
	sex,
	%% Int32 头
	head
}).

-record(pk_OnlineMemberSnapshot,{
	%% UInt64 角色ID
	playerID,
	%% UInt64 角色流水号
	code,
	%% UInt64 帮会ID
	guildID,
	%% String 角色名字
	playerName,
	%% String 帮会名字
	guildName,
	%% UInt32 职业
	career,
	%% UInt16 等级
	level,
	%% Byte 是否是好友(1是)
	friendState,
	%% Byte 种族
	race,
	%% Byte 性别
	sex,
	%% Int32 头
	head,
	%% UInt32
	force
}).

-record(pk_TeamBaseInfo,{
	%% UInt64
	teamID,
	%% UInt64
	leaderID,
	%% Int32
	copyMapID,
	%% Int32
	canBeSearched,
	%% UInt64
	searchStartTime
}).

-record(pk_TeamMemberInfo,{
	%% UInt64 角色ID
	playerID,
	%% UInt64 角色流水号
	code,
	%% String 角色名字
	playerName,
	%% UInt64 帮会ID
	guildID,
	%% String 帮会名字
	guildName,
	%% UInt64 战力
	force,
	%% UInt16 等级
	level,
	%% UInt32 职业
	career,
	%% Byte 种族
	race,
	%% Byte 性别
	sex,
	%% Int32 头
	head,
	%% Byte 血量百分比[0,100]
	hpPercent,
	%% UInt16 所在的地图
	mapID,
	%% UInt32 组ID
	groupID,
	%% UInt64 线ID
	mapInstanceID,
	%% Single x坐标
	x,
	%% Single y坐标
	y,
	%% String 扩展信息
	customInfo,
	%% UInt16 副本剩余次数
	copyMapLeftCount,
	%% UInt32 体力值
	actionPoint
}).

-record(pk_TeamMemberInfoEx,{
	%% UInt64 角色ID
	playerID,
	%% UInt64 角色流水号
	code,
	%% UInt16 等级
	level,
	%% UInt16 血量百分比
	hpPercent,
	%% UInt16 所在的地图
	mapID,
	%% UInt32 组ID
	groupID,
	%% UInt64 线ID
	mapInstanceID,
	%% UInt16 副本剩余次数
	copyMapLeftCount,
	%% UInt32 体力值
	actionPoint,
	%% UInt64
	force,
	%% Single x坐标
	x,
	%% Single y坐标
	y
}).

-record(pk_TeamMemberLocation,{
	%% UInt64队友ID
	playerID,
	%% Single队友所在x坐标
	x,
	%% Single队友所在y坐标
	y
}).

-record(pk_TeamMemberSnapshot,{
	%% UInt64 角色ID
	playerID,
	%% UInt64 角色流水号
	code,
	%% String 角色名字
	playerName,
	%% UInt32 职业
	career,
	%% UInt16 等级
	level,
	%% Byte 种族
	race,
	%% Byte 性别
	sex,
	%% Int32 头
	head,
	%% UInt64
	force
}).

-record(pk_TeamSnapshot,{
	%% TeamBaseInfo
	base,
	%% TeamMemberSnapshot
	members
}).

%% 
%% //回复，队伍邀请结果
-define(CMD_U2GS_AckInviteJoinTeam,7027).
-record(pk_U2GS_AckInviteJoinTeam,{
	%% Byte 0.拒绝;1.同意;
	isAgree,
	%% UInt64 邀请玩家ID
	inviterPlayerID
}).

%% 
%% //回复，队伍邀请结果
-define(CMD_U2GS_AckInviteTeam,42781).
-record(pk_U2GS_AckInviteTeam,{
	%% Byte 队伍类型
	teamType,
	%% Byte 0.拒绝;1.同意;
	isAgree,
	%% Byte 邀请类型(1.邀请加入;2.申请入队)
	inviteType,
	%% UInt64 邀请玩家ID
	inviterPlayerID
}).

%% 
-define(CMD_U2GS_CancelFastTeam,63209).
-record(pk_U2GS_CancelFastTeam,{
}).

%% 
%% //玩家打开关闭地图面板
-define(CMD_U2GS_IsOpenMapPanel,57366).
-record(pk_U2GS_IsOpenMapPanel,{
	%% Boolean
	isOpen
}).

%% 
%% // 离队
-define(CMD_U2GS_LeaveAwayTeam,63768).
-record(pk_U2GS_LeaveAwayTeam,{
	%% Byte队伍类型
	teamType,
	%% Byte没用的数据，随便填一个，以后会删掉
	id
}).

%% 
-define(CMD_U2GS_NearbyPlayer_Request,36078).
-record(pk_U2GS_NearbyPlayer_Request,{
}).

%% 
%% //队伍操作
-define(CMD_U2GS_OperateTeam,8639).
-record(pk_U2GS_OperateTeam,{
	%% Byte队伍类型
	teamType,
	%% Byte操作类型(1.邀请加入;2.申请入队;3.T人;4.给予队长)
	operateType,
	%% UInt64操作对象玩家ID	
	operatedID
}).

%% 
%% //查询无队伍玩家
-define(CMD_U2GS_QueryRoleList,40314).
-record(pk_U2GS_QueryRoleList,{
	%% Int32
	queryType
}).

%% 
%% //----------------------------------------------------------------
%% //----------------------------------------------------------------
%% //组队大厅
%% //查询队伍列表
-define(CMD_U2GS_QueryTeamList,29633).
-record(pk_U2GS_QueryTeamList,{
	%% Int32
	mapIDList
}).

%% 
%% //玩家快捷加入队伍
-define(CMD_U2GS_QuickJoinTeam,32962).
-record(pk_U2GS_QuickJoinTeam,{
	%% UInt64
	roleID,
	%% UInt32
	mapID
}).

%% 
%% //快速匹配
-define(CMD_U2GS_QuickTeamMatch,45837).
-record(pk_U2GS_QuickTeamMatch,{
	%% UInt16
	mapList
}).

%% 
%% //玩家发起副本快捷组队
-define(CMD_U2GS_QuickTeamStart,63294).
-record(pk_U2GS_QuickTeamStart,{
	%% UInt32
	mapID
}).

%% 
%% //客户端请求获取队伍队员战斗力
-define(CMD_U2GS_RequestFightingCapacity,23749).
-record(pk_U2GS_RequestFightingCapacity,{
}).

%% 
-define(CMD_U2GS_RequestNearByTeamInfo,9627).
-record(pk_U2GS_RequestNearByTeamInfo,{
	%% Byte队伍类型
	teamType
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //0:普通队伍（五分钟没有人就会删除，可以任意换队长）
%% //1:系统队伍（服务器逻辑去删除和创建, 只在服务器内部使用，不可换队长）
%% //2:灵魂伙伴（玩家去删除和创建，不可换队长）
%% //----------------------------------------------------------------
%% //队伍操作
-define(CMD_U2GS_TeamOp,47456).
-record(pk_U2GS_TeamOp,{
	%% Byte
	operateType,
	%% UInt64
	operatedID,
	%% UInt64
	param1
}).

%% 
%% //解锁状态
-define(CMD_GS2U_GoddessActiveSkill,31922).
-record(pk_GS2U_GoddessActiveSkill,{
	%% UInt32技能ID
	skillID
}).

%% 
%% //成长后女神觉醒
-define(CMD_GS2U_WakeInfo,1406).
-record(pk_GS2U_WakeInfo,{
	%% WakeInfo
	wakeInfo
}).

%% 
%% //女神觉醒信息列表
-define(CMD_GS2U_WakeInfoList,20072).
-record(pk_GS2U_WakeInfoList,{
	%% WakeInfo
	wakeInfoList
}).

%% 
%% //召唤女神
-define(CMD_U2GS_CallGoddess,56485).
-record(pk_U2GS_CallGoddess,{
	%% Byte
	cardID
}).

%% 
%% //解锁状态
-define(CMD_U2GS_ChangeState,37535).
-record(pk_U2GS_ChangeState,{
	%% Byte
	cardID,
	%% Byte
	state
}).

%% 
%% //女神觉醒一键升级
-define(CMD_U2GS_OnKeyUpWakeInfo,59979).
-record(pk_U2GS_OnKeyUpWakeInfo,{
	%% Byte女神卡片ID
	cardID
}).

%% 
%% //解锁女神
-define(CMD_U2GS_UnlockCard,32154).
-record(pk_U2GS_UnlockCard,{
	%% Byte
	cardID
}).

%% 
%% //解锁状态
-define(CMD_U2GS_UnlockState,10823).
-record(pk_U2GS_UnlockState,{
	%% Byte
	cardID,
	%% Byte
	state
}).

%% 
%% //女神觉醒升级
-define(CMD_U2GS_UpGradeWakeInfo,44728).
-record(pk_U2GS_UpGradeWakeInfo,{
	%% Byte女神卡片ID
	cardID
}).

%% 
%% //激活或者成长女神觉醒
-define(CMD_U2GS_UpWakeInfo,43827).
-record(pk_U2GS_UpWakeInfo,{
	%% Byte女神卡片ID
	cardID,
	%% UInt16物品数量
	num
}).

-record(pk_WakeInfo,{
	%% Byte女神卡片ID
	cardID,
	%% Byte觉醒等级 0:表示已经激活
	level,
	%% UInt16当前升级数量	
	curNum,
	%% UInt16以100为基数 99就是 99%， =100可以解锁，10000已经解锁
	activeProgress,
	%% Byte解锁的最大状态
	unlockStateMax,
	%% Byte使用状态
	curState
}).

%% 
%% //初始化
-define(CMD_GS2U_InitWarriorTrialAck,47257).
-record(pk_GS2U_InitWarriorTrialAck,{
	%% UInt16历史最高完成关卡
	record,
	%% UInt16当前关卡
	cur,
	%% UInt16最高关卡
	max,
	%% UInt32铁血硬币数量
	coin
}).

%% 
%% //进副本时候，给客户端初始信息
-define(CMD_GS2U_InitWarriorTrialMissionInfo,19866).
-record(pk_GS2U_InitWarriorTrialMissionInfo,{
	%% UInt16关卡ID
	missionID,
	%% UInt16最迟完成时间
	time
}).

%% 
%% //扫荡成功
-define(CMD_GS2U_SweepWarriorTrialSuccess,59279).
-record(pk_GS2U_SweepWarriorTrialSuccess,{
	%% UInt16历史最高完成关卡
	record,
	%% UInt16当前扫荡关卡
	cur,
	%% UInt32铁血硬币数量
	coin
}).

%% 
%% //挑战结果
-define(CMD_GS2U_WarriorTrialSuccess,6523).
-record(pk_GS2U_WarriorTrialSuccess,{
	%% Boolean
	result
}).

%% 
%% //挑战关卡
-define(CMD_U2GS_BeginWarriorTrial,59331).
-record(pk_U2GS_BeginWarriorTrial,{
}).

%% 
%% //完成所有关卡
-define(CMD_U2GS_CompleteWarriorTrail,9471).
-record(pk_U2GS_CompleteWarriorTrail,{
	%% UInt16地图ID
	mapID
}).

%% 
%% //扫当关卡
-define(CMD_U2GS_SweepWarriorTrial,38274).
-record(pk_U2GS_SweepWarriorTrial,{
	%% UInt16关卡ID
	mapID
}).

%% 
%% // -> client to server
%% // <- server to client
%% // <-> client & server
%% //目前支持以下几种数据类型：
%% // bool,vector,string,float double
%% // int8,int16,int32,int,int64,
%% // uint8,uint16,uint32,uint,uint64
%% //请求初始化
-define(CMD_U2GS_WarriorTrialInit,6210).
-record(pk_U2GS_WarriorTrialInit,{
}).

-endif. %%NetmsgRecords
