-ifndef(UserDefine_hrl).
-define(UserDefine_hrl,1).

%%每一个用户数据
-record(userSocketRecord, {
	socket = 0,
	userName = "",
	userID = 0,
	randIdentity = "",
	ip = "",
	platId = 0
}).

%% 登录验证返回数据
%-record(userDBLoginResult, {resultCode, msg, userID, userName }).
-record(userDBLogin, {
	account,
	platformID,
	versionRes,
	versionExe,
	versionGame,
	versionPro,
	uid,
	dataDescription,
	theAccount
}).

-record(userDBLoginResult, {
	resultCode,			%% 数据库返回结果
	accountID = 0,			%% 账户ID
	account = "",			%% 根据平台和平台ID生成的账号
	platId					%% 平台ID
}).

-record(clientState, {
	accountID = 0,				%% 账号ID
	clientSocket = 0, 			%% 连接客户端的Socket
	gameServerIP = "",			%% 选择的游戏服务器IP
	gameServerPort = 0,			%% 选择的游戏服务器端口
	clientSocketIsCheck = 0,		%% 客户端Socket是否检查
	userSystemInfo = "", 			%% 用户系统信息
	userMac = "", 				%% 用户Mac地址?
	userMachineInfo = "",			%% 用户机器信息?
	platAccount = "",				%% 平台账号
	platName = ""					%% 平台名（不再有ID)
}).

-record(recPlatformReturn,{
	state             = failed,			%% success|failed
	platformAccountID = "",
	platformAccount   = "",
	platformName        = "",
	fgi = 0,								%%funcell返回
	lsNickName        = "",				%% 平台帐号的昵称
	deviceId          = "",				%% 手机生成的设备标识
	imei              = "",
	idfa              = "",				%% 苹果机的推广编号
	mac               = ""
}).

%% funcell登录日志
-record(funcellLoginLog,{
	client = "",
	fgi = "",
	platform = "",
	fedID = "",			%% funcell返回的account
	gameAccountID = "",
	platformAccount = "",
	gender = "",			%% 男|女
	age = "",
	versionRes = "",
	versionExe = "",
	device = "",
	ip = ""
}).

%% web2ls
-record(cmdAckInfo,{
	m::atom(),% 回调模块，处理结果
	gsNum::integer(),
	beginTime = 0,% 开始时间，计算超时用
	tmpArgs::term(),%存放临时参数
	gsResult = []
}).


%% 登录验证返回码
-define(Login_LS_Result_Succ, 	0).						%%验证成功，可以登录游戏服务器
-define(Login_LS_Result_Fail_UserNameOrPassword, -1).		%%验证失败，用户名密码错误
-define(Login_LS_Result_Fail_OtherLogin,-2).				%%验证失败，重复登录
-define(Login_LS_Result_Fail_Kickout, 	-3).				%%被踢下线
-define(Login_LS_Result_Fail_Freeze,	-4).				%%该账户已经被冻结，禁止登录
-define(Login_LS_Result_Fail_Connect, 	-5).				%%尚未连接登录服务器
-define(Login_LS_Result_Fail_Empty, 	-6).				%%用户名密码不能为空
-define(Login_LS_Result_Fail_DbError, 	-7).				%%验证失败，写数据库失败
-define(Login_LS_Result_Fail_Unknown, 	-8).				%%验证失败，未知错误
-define(Login_LS_Result_Fail_Exception,-9).				%%验证失败，异常错误
-define(Login_LS_Result_Fail_Unsupport,-10).				%%验证失败，登录服务器不支持该平台验证
-define(Login_LS_Result_Fail_Timeout,-11).				%%验证失败，验证超时
-define(Login_LS_Result_Fail_Disconnect,-12).				%%验证失败，网络断开
-define(Login_LS_Result_Fail_Forbidden,-13).				%%验证失败，帐号被封
-define(Login_LS_Result_Fail_Version,-14).                %%版本过低
-define(Login_LS_Result_Fail_Version_LevelUper,-15).      %%版本过高


-define(UserState_UnCheckPass, 0).
-define(UserState_WaitCheckPass, 1).
-define(UserState_WaitKickOutOther, 2).
-define(UserState_WaitDbserverAck, 3).
-define(UserState_WaitGsLineRobKickoutAck, 4).		%%抢登录，待gs踢人确认

%%loginResult消息
-define(LoginResultSucc, 0).
-define(LoginResultSearchFail, 1).
-define(LoginResultAccountDenied, 2).%%黑名单
-define(LoginResultDeviceDenied, 3).%%设备禁止登录
-define(LoginResultServerMaintain, 4).%%服务器正在维修，启动中
-define(LoginResultDbErr, 9).


%%断线重连返回
-define(Disconnection_Login_Result_Retry,		0).		%%要求客户端重试
-define(Disconnection_Login_Result_Failed,		-1	).		%%验证失败


%% gm（web2ls)超时
-define(Web2lsMGAckTimeout,180).% 秒数

-endif. 