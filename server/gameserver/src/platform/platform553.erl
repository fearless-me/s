%% Author: zzc
%% Created: 2012-6-29
%% Description: TODO: 
-module(platform553).

%%
%% Include files
%%
-include_lib("stdlib/include/ms_transform.hrl").
-include("lsInc.hrl").

%%
%% Exported Functions
%%
-compile(export_all).

verify(#pk_U2LS_Login_Normal{
	platformAccount=PlatformAccount,
	platformName=PlatformName,
	platformNickName = PlatformNickName,
	extParam = ExtParam,
	deviceId = DeviceId,
	idfa     = Idfa,
	imei	 = Imei,
	mac		 = Mac,
	versionRes = VersionRes,
	versionExe = VersionExe
}=_Msg, Socket)->
	{IP, _port} = misc:getRemoteIP_Port(Socket),
	?LOG_OUT("recive #pk_U2LS_Login_Normal msg,deviceId[~ts] IP[~ts] ~w",[DeviceId, IP, self()]),
	IsDeviceId =
		clientLogic:isDenyDevice(erlang:list_to_binary(DeviceId))
			orelse clientLogic:isDenyDevice(erlang:list_to_binary(Idfa))
			orelse clientLogic:isDenyDevice(erlang:list_to_binary(Imei))
			orelse clientLogic:isDenyDevice(erlang:list_to_binary(Mac))
			orelse clientLogic:isDenyDevice(erlang:list_to_binary(IP)),

	case IsDeviceId of
		false ->
			{AccessToken,FuncellCilentID} = deParseExt(ExtParam),
			case funcell:getLogin(AccessToken,FuncellCilentID) of
				{AccountID,Platform,ClientID,Fgi} ->
					AccountIDStr = binary_to_list(AccountID),
					FuncellLoginLog = #funcellLoginLog{
						client = ClientID,
						fgi = Fgi,
						platform = Platform,
						fedID = AccountID,
						platformAccount = PlatformAccount,
						gender = "",		%% 男|女
						age = "0",
						versionRes = erlang:integer_to_list(VersionRes),
						versionExe = erlang:integer_to_list(VersionExe),
						device = DeviceId
					},
					clientLogic:setfuncellLoginLog(FuncellLoginLog),

					#recPlatformReturn{state=success,platformAccountID=AccountIDStr,platformAccount = PlatformAccount, platformName=PlatformName,
						deviceId = DeviceId,imei = Imei,idfa = Idfa, mac = Mac,fgi = Fgi,
						lsNickName = PlatformNickName};
				_ ->
					#recPlatformReturn{}
			end;
		_ ->
			#recPlatformReturn{state=deviceDeny}
	end;

verify(_Msg,_Socket)->
	#recPlatformReturn{}.

%%=====
%%内部
%%=====
deParseExt(ExtParam) ->
	case rfc4627:decode(ExtParam) of
		{ok,Ext,[]} ->
			{ok,AccessToken} = rfc4627:get_field(Ext, "AccessToken"),
			{ok,FuncellCilentID} = rfc4627:get_field(Ext, "FuncellCilentID"),
			{erlang:binary_to_list(AccessToken),erlang:binary_to_list(FuncellCilentID)};
		_ ->
			err
	end.