%% @author zzc
%% @doc @todo Add description to tcpMsg.


-module(clientNetworkMsg).

-include("logger.hrl").
-include("netmsgRecords.hrl").
-include("userDefine.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doTcpMsg/4]).

-spec doTcpMsg(AccountCheckPass::(true|false), Cmd::integer(), Bin::binary(), State::term()) -> State :: term().

doTcpMsg(_AllStatus, ?CMD_U2GS_HeartBeat, #pk_U2GS_HeartBeat{},State) ->
	State;

doTcpMsg(_AllStatus, ?CMD_U2GS_HeartBeatReal, #pk_U2GS_HeartBeatReal{},State) ->
	put('heartPackTime',time:getUTCNowSec()),%%重置心跳计时
	State;

%% 平台登录分发
doTcpMsg(?UserState_UnCheckPass, ?CMD_U2LS_Login_Normal,
	#pk_U2LS_Login_Normal{versionPro = VPro, platformAccount = PlatformAccount} = Msg,
	#clientState{clientSocket = Socket} = State) ->
	?DEBUG_OUT("socket Pid[~p] loginMsg,[~p]",[self(),Msg]),
	clientLogic:setU2LSLoginMsg(Msg),
	put('ProtocolVer',Msg#pk_U2LS_Login_Normal.versionPro),

	%% 首先验证服务器是否成功启动
	case globalSetup:getHasGs() of
		Val when erlang:is_number(Val) ->
			%% 验证版本号
			case clientLogic:checkProtoVer([], VPro) of
				true ->
					%% 判断账号是否为空
					case erlang:length(Msg#pk_U2LS_Login_Normal.platformAccount) >= 1 of
						true ->
							%% 平台验证(包含验证是否封禁设备)
							case platformLoginDispatcher:loginVerify(Msg,Socket) of
								#recPlatformReturn{state = success,
									platformAccountID = PlatformAccount, platformName = PlatformName
								} = Data ->
									NewMsg = clientLogic:changeIpInfo(PlatformAccount, PlatformName, Msg),
									Data2 =
										case Msg =:= NewMsg of
											true ->
												Data;
											_ ->
												Data#recPlatformReturn{
													deviceId          = NewMsg#pk_U2LS_Login_Normal.deviceId,
													imei              = NewMsg#pk_U2LS_Login_Normal.imei,
													idfa              = NewMsg#pk_U2LS_Login_Normal.idfa,
													mac               = NewMsg#pk_U2LS_Login_Normal.mac}
										end,

									%%根据平台返回的帐号去关联游戏DB
									clientLogic:getAccountInfoFromDBReq(Data2),
									State#clientState{platAccount = PlatformAccount,platName = PlatformName};
								#recPlatformReturn{state = success, platformAccountID = PlatformAccount2} ->
									?ERROR_OUT("login error:~ts <-> ~ts", [PlatformAccount, PlatformAccount2]),
									clientLogic:sendLoginResult(?LoginResultDeviceDenied, 0, "", stringCfg:getString(loginResultDeviceDenied_Text), State),
									State;
								#recPlatformReturn{state = failed} ->
									%?DEBUG_OUT("[DebugForLogin] normal2"),
									?ERROR_OUT("login failed:~ts", [PlatformAccount]),
									clientLogic:sendLoginResult(?LoginResultSearchFail, 0, "", stringCfg:getString(loginResultSearchFailInFuncell_Text), State),
									State;
								#recPlatformReturn{state = deviceDeny} ->
									%?DEBUG_OUT("[DebugForLogin] normal3"),
									?ERROR_OUT("login deviceDeny:~ts", [PlatformAccount]),
									clientLogic:sendLoginResult(?LoginResultDeviceDenied, 0, "", stringCfg:getString(loginResultDeviceDenied_Text), State),
									State
							end;
						_ ->
							?ERROR_OUT("account name error:~ts,~ts",
								[PlatformAccount, Msg#pk_U2LS_Login_Normal.platformName]),
							clientLogic:sendLoginResult(?LoginResultSearchFail, 0, "", stringCfg:getString(loginResultDeviceDenied_Text), State),
							State
					end;
				_ ->
					?ERROR_OUT("No match ProtoVer:~ts,~ts", [PlatformAccount, Msg#pk_U2LS_Login_Normal.platformName]),
					clientLogic:sendLoginResult(?LoginResultSearchFail, 0, "", stringCfg:getString(loginResultDeviceDenied_Text), State),
					State
			end;
		undefined ->
			?ERROR_OUT("login globalSetup no getHasGs:~ts", [PlatformAccount]),
			clientLogic:sendLoginResult(?LoginResultServerMaintain,0,"",stringCfg:getString(loginResultServerMaintain_Text),State),
			State
	end;

%% client请求线路
doTcpMsg(_Status, ?CMD_U2LS_RequestGSLine , _Pk, State) ->
	IsWhiteAccount = clientLogic:getAccountWhite(),
	clientLogic:sendGameLineServerList(IsWhiteAccount, State),
	State;

doTcpMsg(_AccountCheckPass, _Cmd, _Bin,State) ->
	?ERROR_OUT("socketPid[~p] clientNetworkMsg can't match this args:~p",[self(),[ _AccountCheckPass, _Cmd, _Bin]]),
	State.

%% ====================================================================
%% Internal functions
%% ====================================================================

