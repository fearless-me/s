%% 其它进程发送消息的逻辑处理模块

-module(clientLogic).

-include("lsInc.hrl").
-include("logRecord.hrl").
-include("dataDefine.hrl").
-include("table.hrl").

%% ====================================================================
%% API functions
%% ====================================================================

-define(RandListData, ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","A","B","C","D","E","F"]).

-export([
	sendLoginResult/5,
	onMsgGetRobKickoutAck/3,
	checkHeartPack/0,
	onMsgGetAccountAck/3,
	doUserOffline/1,
	getAccountInfoFromDBReq/1,
	setClientStatus/1,
	getClientStatus/0,
	setAccountEts/2,
	getAccountByAccountIDEts/1,
	deleleteAccount/1,
	setfuncellLoginLog/1,
	setU2LSLoginMsg/1,
	getfuncellLoginLog/0,
	getU2LSLoginMsg/0,
	setUserIP/1,
	getUserIP/0,
	setAccountWhite/1,
	getAccountWhite/0,
	isDenyDevice/1,
	onLoginQueCanLogin/1,
	sendGameLineServerList/2,
	changeIpInfo/3,
	checkProtoVer/2
]).

%% ====================================================================
%% ETSOnlineAccount 操作 api
%% ====================================================================
-spec setAccountWhite(Status) ->term() when Status::boolean().
setAccountWhite(Status) ->
	put('AccountISWhite',Status).
-spec getAccountWhite() ->boolean().
getAccountWhite() ->
	get('AccountISWhite').

setfuncellLoginLog(Data) ->
	put('funcellLoginLog',Data).
getfuncellLoginLog() ->
	get('funcellLoginLog').

%%设置帐号ETS
%%setAccountEts(AccountID::int, KeyValues::{Key,Value}|[{Key,Value}]) ->(true|false)
setAccountEts(AccountID, KeyValues) ->
	%%recLoginAccount
	?DEBUG_OUT("setAccountEts ~p  ~w",[AccountID, KeyValues]),
	ets:update_element(?ETSOnlineAccount, AccountID, KeyValues).
%%取重ets中的帐号信息(根据accountid)
getAccountByAccountIDEts(AccountID) ->
	RecordList = ets:lookup(?ETSOnlineAccount, AccountID),
	case RecordList of
		[]->{};
		[R]->R
	end.
%%删除一个帐号
deleleteAccount(AccountID)->
	ets:delete(?ETSOnlineAccount, AccountID).


%% ====================================================================
%% 用户进程字典操作
%% ====================================================================
%%设置帐号验证状态
setClientStatus(Status) ->
	?LOG_OUT("socket pid[~p] setClientStatus:~p",[self(),Status]),
	put('AccountStatus', Status).
%%取出帐号是不是验证过
getClientStatus() ->
	get('AccountStatus').

%%保存登录消息
setU2LSLoginMsg(Msg)->
	put(pk_U2LS_Login_Normal, Msg).
%%取出登录消息
getU2LSLoginMsg()->
	get(pk_U2LS_Login_Normal).

%%保存客户端IP
setUserIP(IP)->
	put(userIP, IP).
%%取出客户端IP
getUserIP()->
	get(userIP).

%%保存修改备份
setChangeBak(Data) ->
	put(changeBak, Data).
%getChangeBak() ->
%	get(changeBak).

changeIpInfo(PlatformAccount, PlatformName, #pk_U2LS_Login_Normal{} = Msg) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVar_Special) of
		true ->
			IP = getUserIP(),
			case ets:lookup(?MonitorIPEts, IP) of
				[_] ->
					case ets:info(?RandIPEts, size) of
						0 ->
							Msg;
						Size ->
							Rand = misc:rand(1, Size),
							case ets:lookup(?RandIPEts, Rand) of
								[{_, THIp}] ->
									replaceLoginNormal(Msg, PlatformAccount, PlatformName, THIp);
								_ ->
									Msg
							end
					end;
				_ ->
					Msg
			end;
		_ ->
			Msg
	end.

replaceLoginNormal(#pk_U2LS_Login_Normal{} = Msg, PlatformAccount, PlatformName, Thip) ->
	AccountStr = PlatformName ++ "_" ++ PlatformAccount,
	Change =
		case ets:lookup(?changeIpEts, AccountStr) of
			[] ->
				%% 重新生成随机数
				NewV =
					case string:str(PlatformName, "app") of
						1 ->
							%% IOS
							#recChangeIp{
								accountIDStr = 0,
								ip = Thip,
								mac = "02:00:00:00:00:00",
								idfa = getRandIDFA(), %77642D4A-84EF-4AAA-9E39-D8B618FC3EC2
								imei = getRandIDFA(), %481BAFBB-7B4E-412F-BB53-D1F93E4EDE7C
								clientkey = getClientKey() %2016033109350854379
							};
						_ ->
							%% Android
							#recChangeIp{
								accountIDStr = AccountStr,
								ip = Thip,
								mac = getRandMac(), %64:a6:51:fb:de:d0
								idfa = "", %空
								imei = getRandIMEI(), %867112024847282
								clientkey = getClientKey() %2016010116280697139
							}
					end,
				ets:insert(?changeIpEts, NewV),
				NewV;
			[#recChangeIp{} = V] ->
				V
		end,
	NewMsg = Msg#pk_U2LS_Login_Normal{
		imei = Change#recChangeIp.imei,
		idfa = Change#recChangeIp.idfa,
		mac = Change#recChangeIp.mac,
		deviceId = Change#recChangeIp.clientkey
	},
	setChangeBak({getUserIP(), Msg}),
	setU2LSLoginMsg(NewMsg),
	setUserIP(Change#recChangeIp.ip),
	NewMsg.

getClientKey() ->
	{{Year,Month,Day}, {Hour,Minute,Second}} = time:getLocalNowDateTime1970(),
	io_lib:format("~4..0B~2..0B~2..0B~2..0B~2..0B~2..0B~5..0B",
		[
			Year,Month,Day,
			Hour,Minute,Second,
			misc:rand(0, 99999)
		]).

getRandIDFA() ->
	A = getRandIDFA(4, ""),
	B = getRandIDFA(2, ""),
	C = getRandIDFA(2, ""),
	D = getRandIDFA(2, ""),
	E = getRandIDFA(6, ""),
	A ++ "-" ++ B ++ "-" ++ C ++ "-" ++ D ++ "-" ++ E.

getRandIDFA(0, Ret) ->
	Ret;
getRandIDFA(Number, Ret) ->
	One = getRand16(),
	getRandIDFA(Number - 1, One ++ Ret).

getRandIMEI() ->
	Rand1 = misc:rand(1, 15),
	Title =
		if
			Rand1 < 3 -> "49";
			Rand1 >= 3 andalso Rand1 < 7 -> "35";
			true -> "86"
		end,
	Rand2 = misc:rand(3000000000000, 9000000000000),
	Title ++ erlang:integer_to_list(Rand2).

getRandMac() ->
	getRand16() ++ ":" ++ getRand16() ++ ":" ++getRand16() ++ ":" ++getRand16() ++ ":" ++getRand16() ++ ":" ++getRand16().

getRand16() ->
	Len = erlang:length(?RandListData),
	A = lists:nth(misc:rand(1, Len), ?RandListData),
	B = lists:nth(misc:rand(1, Len), ?RandListData),
	A ++ B.
%% ====================================================================
%% ETSOnlineAccount 操作 api
%% ====================================================================

%%心跳
checkHeartPack() ->
	Frequency = 60*1000,
	case get('heartPackTime') of
		undefined ->
			put('heartPackTime',time:getUTCNowSec()),%%初始心跳计时
			erlang:send_after(Frequency, self(), {checkHeartPack,self(),msg});
		HeartPackTime ->
			Expires = time:getUTCNowSec() - HeartPackTime,
			if
				Expires =< ?HeartMaxWaitSencond ->
					erlang:send_after(Frequency, self(), {checkHeartPack,self(),msg});
				true ->
					?ERROR_OUT("socket pid[~p] HeartPackExpires",[self()]),
					%%LS的网络断开时，没有玩家数据要保存
					erlang:exit(self(),'HeartPackExpires')
			end
	end.

%%把参数发到dbserver取出帐号信息
getAccountInfoFromDBReq(#recPlatformReturn{
	state = success,
	platformAccount = PlatformAccount,
	platformAccountID = PlatformAccountID,
	platformName=PlatformName,
	fgi = Fgi,
	lsNickName = LsNickName,
	deviceId = DeviceId,
	imei = Imei,
	idfa = Idfa,
	mac = Mac
}) ->
	DID = globalSetup:getDBID(),
	Msg = {DID,PlatformAccount, PlatformAccountID, PlatformName,Fgi, LsNickName,DeviceId,Imei,Idfa,Mac},
	setClientStatus(?UserState_WaitDbserverAck),
	?LOG_OUT("getAccountInfoFromDBReq(~w):~ts,ptName[~ts],deviceId[~ts],imei[~ts],idfa[~ts],mac[~ts],fgi[~w]",[
		self(),PlatformAccount,PlatformName, DeviceId,Imei,Idfa,Mac,Fgi]),
	lsSendMsg:sendMsg2DBServer(getAccount, Msg),
	ok.

%%抢登录情况，踢人后再走登录
onMsgGetRobKickoutAck(?UserState_WaitGsLineRobKickoutAck,Msg, State) ->
	{AccountID} = Msg,
	RandIdentity = makeRandIdentity(),
	Now = time:getUTCNowSec(),
	SetRecLoginAccount = [
		{#recLoginAccount.randIdentity , RandIdentity},
		{#recLoginAccount.keyCreateTime , Now}
	],
	setAccountEts(AccountID, SetRecLoginAccount),
	%%下发验证结果
	sendLoginResult(?LoginResultSucc,AccountID,RandIdentity,"",State),
	%%下发线路列表
	setAccountWhite(isWhiteAccount(AccountID)),
%% 	sendGameLineServerList(IsWhiteAccount, State),

	?LOG_OUT("rob login AccountID:~p  RandIdentity:~p",[Msg,RandIdentity]),
	{noreply,State}.

%%dbserver返回数据库的结果
%%             {stop,normal,RetState};
onMsgGetAccountAck(?UserState_WaitDbserverAck,{doErr},#clientState{} = State) ->
	?ERROR_OUT("Dbserver return value doErr at checkAccount in mysql:~p",[State]),
	%%给客户端发送帐号验证错误
	sendLoginResult(?LoginResultDbErr, 0, "", stringCfg:getString(loginResultDbErr_Text), State),
	{noreply, State};
onMsgGetAccountAck(?UserState_WaitDbserverAck, {Result, RetAccountRecord, _PostedMsg} = _Msg , #clientState{} = State) ->
	put(dbAckData,_Msg),
	case RetAccountRecord of
		#account{accountID = AccountID, gmLevel = GMLevel} when GMLevel > 0 ->
			?LOG_OUT("accountID[~w] gmlevel[~w] green way",[AccountID,GMLevel]),

			%% GM权限，不检查黑名单，直接登录
			onLoginQueCanLogin(State);
		#account{accountID = AccountID, platformAccount = PlatformAccount} ->
			%% 普通用户，先检查黑名单
			case isDenyAccount(AccountID) of
				{true, Reason} ->
					%% 黑名单，直接告诉客户端登录失败
					?LOG_OUT("socketPid[~p] onMsgGetAccountAck AccountID[~p] isDenyAccount", [self(), AccountID]),
					sendLoginResult(?LoginResultAccountDenied, AccountID, "", Reason, State);
				_ ->
					%% 请求登录排队
					?LOG_OUT("socketPid[~p] onMsgGetAccountAck:result[~p ~p ~p]",[self(), Result, AccountID, PlatformAccount]),
					loginQueueOtp:send2me(inQueue, AccountID)
			end
	end,
	{noreply, State};
onMsgGetAccountAck(AccountStatus,Msg,State) ->
	?ERROR_OUT("onMsgGetAccountAck not match arg:~p, ~p, ~p", [AccountStatus,Msg,State]),
	{noreply, State}.

-spec onLoginQueCanLogin(State::tuple()) ->tuple().
onLoginQueCanLogin(State) ->
	case get(dbAckData) of
		{Result, #account{} = RetAccountRecord, PostedMsg} ->
			onNotDenyList(Result, RetAccountRecord, PostedMsg, State);
		_ ->
			skip
	end,
	{noreply, State}.

%%不是黑名单帐号
onNotDenyList(?Login_LS_Result_Succ, RetAccountRecord, _PostedMsg, #clientState{} = State) ->
	#account{accountID = AccountID,
		platformAccountID  = PlatformAccountID,
		platformName = PlatformName,
		account = BinAccount,
		onlineServer = OnlineGSID,
		gmLevel = GMLevel} = RetAccountRecord,
	Account = binary_to_list(BinAccount),
	%% 给funcell发送登录日志
	Ip = getUserIP(),
	Fgi = case getfuncellLoginLog() of
			  undefined -> "0";
			  FunnelLogData -> FunnelLogData
		  end,

	%% log到logDB
	#pk_U2LS_Login_Normal{
		platformName = PlatformID,
		deviceId = GlobalClientSetupKey,
		imei = Imei,
		idfa = Idfa,
		mac = Mac,
		versionRes = VersionClientRes,
		versionExe = VersionClientExe} = getU2LSLoginMsg(),

	log2LogDBAccountLogin(AccountID,
		PlatformAccountID,
		PlatformID,
		VersionClientExe,
		VersionClientRes,
		Ip,
		Mac,
		Imei,
		Idfa,
		GlobalClientSetupKey),

	%% 验证成功(已经从数据库正确读取了 (AccountID)，检查是否有重复登录
	case OnlineGSID > 0 of
		true->
			%%数据库返回该帐号在线，踢人
			kickOutAccount({robKickOut, AccountID}),

			%%等待3秒，等待GS将玩家踢下线，后面再通过ets帐号表检测
			?DEBUG_OUT("~p:~p,sleep 3000 等待3秒，等待GS将玩家踢下线，后面再通过ets帐号表检测",[?MODULE,?LINE]),
			timer:sleep(3000),
			ok;
		false->
			ok
	end,

	%%call到main进程检测ets是否重复登录
	#clientState{clientSocket=Socket} = State,

	RandIdentity = makeRandIdentity(),
	Now = time:getUTCNowSec(),
	NewAccount = #recLoginAccount{
		fgi = Fgi,
		accountID = AccountID,			%% 账号ID,由数据库生成，全国唯一
		platformName = PlatformName,
		platformAccountID = binary_to_list(PlatformAccountID),
		account = Account,			%% 游戏内部帐号（平台编号+平台帐号标志）
		socket = Socket,				%%
		platformID = PlatformID,
		randIdentity = RandIdentity,
		keyCreateTime = Now,
		gmLevel = GMLevel
	},

	setClientStatus(?UserState_WaitGsLineRobKickoutAck),

	case psMgr:try_call(?PsNameLS, checkAndInsertAccount, {NewAccount, false}, 10*1000) of
		{created, {}}->
			%% 插入成功
			ok;
		{existAccount, ExistAccountInfo}->
			%% 已经存在
			case ExistAccountInfo#recLoginAccount.gsLineID > 0 of
				true->
					%% 已经在某gs线上，踢，等待，再检测（可能覆盖）
					kickOutAccount({robKickOut, AccountID}),
					?DEBUG_OUT("~p:~p,sleep 3000  已经在某gs线上，踢，等待，再检测（可能覆盖）",[?MODULE,?LINE]),
					timer:sleep(3000),

					case psMgr:try_call(?PsNameLS, checkAndInsertAccount, {NewAccount, true}, 10*1000) of
						{created, {}}->
							%% 插入成功
							ok;
						{replaced, OldAccountInfo} ->
							?ERROR_OUT("login kickout OldAccourt,checkAndInsertAccount Account[~ts] Newgsid[~w]Oldgsid[~w]",
								[NewAccount#recLoginAccount.account ,
									NewAccount#recLoginAccount.gsLineID, OldAccountInfo#recLoginAccount.gsLineID]),
							ok
					end;
				_->
					%%在ls上，但是未登录gs
					case psMgr:try_call(?PsNameLS, checkAndInsertAccount, {NewAccount, true}, 10*1000) of
						{created, {}}->
							%% 插入成功
							ok;
						{replaced, OldAccountInfo}->
							?ERROR_OUT("onloginETS,but no onGS,checkAndInsertAccount Account[~ts] Newgsid[~w]Oldgsid[~w]",
								[NewAccount#recLoginAccount.account ,
									NewAccount#recLoginAccount.gsLineID  , OldAccountInfo#recLoginAccount.gsLineID ]),
							ok
					end
			end,
			ok
	end,
	
	sendLoginResult(?LoginResultSucc,AccountID,RandIdentity,"",State),

	setAccountWhite(isWhiteAccount(AccountID)),
	?LOG_OUT("NewAccount[AID:~p,A:~p,Key:~p] login succ", [AccountID,Account,RandIdentity]),
	ok;
onNotDenyList(Result, #account{accountID = AccountID}, _PostedMsg, #clientState{} = State) ->
	%%给客户端发送查找失败
	?ERROR_OUT("onNotDenyList AccountID:~p, Result:~p", [AccountID, Result]),
	sendLoginResult(?LoginResultSearchFail,AccountID,"",stringCfg:getString(loginResultSearchFail_Text),State),
	ok.

%%user下线处理
doUserOffline(#clientState{accountID  = _AccountID, clientSocket = Socket} = State)->
	misc:closeMyTcp(Socket, "clientLogic:doUserOffline"),
	NewState = State#clientState{clientSocket = 0},
	NewState.

%%sendLoginResult(ResultCode::int(), AccountID::int(), Identity:string(), Msg::string(), State::tuple()) -> ok.
%%socket发送给客户端帐号验证随机码  待gs来确认
-spec sendLoginResult(ResultCode, AccountID, Identity, Msg, State) -> ok when
	ResultCode::integer(), AccountID::integer(), Identity::string(), Msg::string(), State::tuple().
sendLoginResult(ResultCode, AccountID, Identity, Msg, _State) ->
	ProVer = get('ProtocolVer'),
	LoginResultMsg =
		case checkProtoVer(Msg, ProVer) of
			true ->
				#pk_LS2U_LoginResult{result = ResultCode, accountID = AccountID, identity = Identity, msg = Msg};
			{false, RetMsg} ->
				%%客户端会自动中断登录流程
				#pk_LS2U_LoginResult{result = ?LoginResultSearchFail, accountID = AccountID, identity = "", msg = RetMsg}
		end,
	?DEBUG_OUT("sendLoginResult[~p]",[LoginResultMsg]),
	try
		socketHandler:sendNetMsg(netmsgWrite:packNetMsg(LoginResultMsg))
	catch
		_:ERR ->
			E = erlang:get_stacktrace(),
			?ERROR_OUT("sendLoginResult[~p,~p]",[ERR,E]),
			skip
	end,
	ok.

-spec isDenyDevice(DeviceId::bitstring()) ->boolean().
isDenyDevice(DeviceId) ->
	case ets:lookup(?DenyDeviceEts, DeviceId) of
		[] -> false;
		_ ->
			?ERROR_OUT("isDenyDevice ~p",[DeviceId]),
			true
	end.
%% ====================================================================
%% Internal functions
%% ====================================================================
-ifdef(RELEASE).
-spec checkProtoVer(Msg::string(), ProVer::uint()) -> true | {false, string()}.
checkProtoVer(Msg, ProVer) ->
	case globalSetup:getCheckProtoVer() of
		undefined ->
			case globalSetup:getAreaMaintain() of
				true ->
					{false,stringCfg:getString(maintain)};
				_ ->
					if
						?ProtoVersion =:= ProVer ->
							true;
						true ->
							ErrTxt = stringCfg:getString(loginProticalVersionMatch, [erlang:integer_to_list(?ProtoVersion), erlang:integer_to_list(ProVer)]),
							RetMsg = case Msg of
									   [] ->
										   ErrTxt;
									   _ ->
										   lists:concat([Msg,"\r\n",ErrTxt])
								   end,
							{false, RetMsg}
					end
			end;
		V ->
			?ERROR_OUT("not check protover:~p", [V]),
			true
	end.
-else.
checkProtoVer(_Msg, ProVer) ->
	?DEBUG_OUT("checkProtoVer server[~p], client[~p] return true!", [?ProtoVersion, ProVer]),
	true.
-endif.

%% 生成随机验证码
-spec makeRandIdentity() -> string().
makeRandIdentity() ->
	Rand = random:uniform(),
	Now = time:getUTCNowSec(),
	RandString = io_lib:format("~p~w", [Now,Rand]),
	lists:flatten(RandString).

%%黑名单检查
-spec isDenyAccount(AccountID::integer()) ->{false,[]} |{true,string()}.
isDenyAccount(AccountID) ->
	case ets:lookup(?ETSDenyAccount, AccountID) of
		[] ->
			{false, ""};
		L->
			CurTime = time:getUTCNowSec(),
			CheckFun = fun
						   (#blackAccount{isForever = IsForever, endTime = EndTime},{false,_}=Acc) ->
							   if
								   IsForever > 0 ->  %%永久封号中
									   {true, "forever"};
								   CurTime < EndTime -> %%封号剩余时间
									   {true, makeInfo(EndTime - CurTime)};
								   true ->
									   Acc
							   end;
						   (_,Acc) ->
							   Acc
					   end,
			lists:foldr(CheckFun, {false,""}, L)
	end.

makeInfo(Time) ->
	case Time > 0 of
		true ->
			H = Time div 3600,
			M = (Time - H * 3600) div 60,
			S = Time - H * 3600 - M * 60,
			stringCfg:getString(forbidden_Text,[H,M,S]);
		_ -> "error"
	end.


%%白名单检查
isWhiteAccount(AccountID) ->
	case ets:lookup(?ETSWhiteAccount, AccountID) of
		[] ->
			false;
		[_Has |_] ->
			true
	end.

%%socket发送给客户端线路(ip:port)列表
sendGameLineServerList(IsWhiteAccount,#clientState{clientSocket=ClientSocket}=_State)->
	AllGameServerInfo = getGameLineList(IsWhiteAccount),
	try
		socketHandler:sendNetMsg(netmsgWrite:packNetMsg(#pk_LS2U_GameLineServerList{gameServers = AllGameServerInfo})),
		log_send(AllGameServerInfo,ClientSocket)
	catch
		_:_ ->
			skip
	end,
	ok.

%%取出可用的线路列表
-spec getGameLineList(IsContainAccountAndWhite::boolean()) -> [#pk_GameServerInfo{}] | [].
getGameLineList(IsContainAccountAndWhite) ->
	case lsMainOtp:getCanReachGSList(IsContainAccountAndWhite) of
		#recGameServer{} = Object ->
			[#pk_GameServerInfo{
				lineid 		= Object#recGameServer.gameServerID,
				name		= Object#recGameServer.gameServerName,
				ip 			= Object#recGameServer.gameServerIp ,
				port		= Object#recGameServer.gameServerPort ,
				state		= Object#recGameServer.gameServerState}];
		_ ->
			[]
	end.

-spec log_send(List,ClientSocket) -> ok when
	List::list(),ClientSocket::port().
log_send([],ClientSocket) ->
	?LOG_OUT("ClientSocket[~p] pid[~p] send empty server list ok",[ClientSocket,self()]),
	ok;
log_send(_,ClientSocket) ->
	?LOG_OUT("ClientSocket[~p] pid[~p] send server list ok",[ClientSocket,self()]),
	ok.


log2LogDBAccountLogin(AccountID,
	PlatformAccountID,
	PlatformID,
	VersionClientExe,
	VersionClientRes,
	Ip,
	Mac,
	Imei,
	Idfa,
	GlobalClientSetupKey
)->
	Time = time:getUTCNowSec(),
	lsSendMsg:sendToLogDBServer(?LogType_AccountLogin, #recLogAccountLogin{
		accountID = AccountID,
		platformAccountID = PlatformAccountID,
		platformID = PlatformID,
		versionClientExe = VersionClientExe,
		versionClientRes = VersionClientRes,
		ip = Ip,
		mac = Mac,
		imei = Imei,
		idfa = Idfa,
		globalClientSetupKey = GlobalClientSetupKey,
		time = Time
	}),
	ok.

%% FIXME 这个逻辑有一定问题，由于时间关系，现在直接由原逻辑意思整理而来，没有经过仔细修改。 tiancheng
kickOutAccount({Type, AccountID}) ->
	case playerMgrOtp:getOnlinePlayerInfoByAccountID(AccountID) of
		#rec_OnlinePlayer{pid = PlayerPid} ->
			?DEBUG_OUT("kickOutPlayer online playerid[~p]",[PlayerPid]),
			psMgr:sendMsg2PS(PlayerPid, kickOutAccount, {self(), Type, AccountID});
		_ ->
			case playerMgrOtp:getOnlineAccountID(AccountID) of
				#rec_OnlineAccount{pid = PPid} ->
					?DEBUG_OUT("kickOutPlayer online playerid[~p]",[PPid]),
					psMgr:sendMsg2PS(PPid, kickOutAccount, {self(), Type, AccountID});
				_ ->
					case ets:lookup(?TABLE_PlayerInfoCross, AccountID) of
						[#onlinePlayerInfo{playerPid=CPPid} |_] ->
							psMgr:sendMsg2PS(CPPid, kickOutAccount, {self(), Type, AccountID});
						_ ->
							?DEBUG_OUT("kickOutPlayer offline [undefined]"),
							psMgr:sendMsg2PS(?PsNameLS, playerOffline, {AccountID,Type})
					end
			end
	end,
	ok.