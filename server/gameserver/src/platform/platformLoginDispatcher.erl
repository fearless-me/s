%% @zzc Administrator
%% @doc @todo 根据平台ID分发到相应验证处理模板（验证模板都要注册到这里）.


-module(platformLoginDispatcher).

-include("lsInc.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([loginVerify/2]).

%% 测试平台
loginVerify(#pk_U2LS_Login_Normal{platformName="100"} = Msg,Socket) ->
	platformTest:verify(Msg,Socket);
%% 测试平台
loginVerify(#pk_U2LS_Login_Normal{platformName="101"} = Msg,Socket) ->
	platformTest:verify(Msg,Socket);

%% 553IOS平台
loginVerify(#pk_U2LS_Login_Normal{platformName="funcellios"} = Msg,Socket) ->
	platform553:verify(Msg,Socket);

%% IOS平台APPSOTRE
loginVerify(#pk_U2LS_Login_Normal{platformName="app"} = Msg,Socket) ->
	platform553:verify(Msg,Socket);

%% IOS平台itools
loginVerify(#pk_U2LS_Login_Normal{platformName="itools"} = Msg,Socket) ->
	platform553:verify(Msg,Socket);

%% 553平台安卓
loginVerify(#pk_U2LS_Login_Normal{platformName="funcell"} = Msg,Socket) ->
	platform553:verify(Msg,Socket);

%% PP_IOS
loginVerify(#pk_U2LS_Login_Normal{platformName="pp"} = Msg,Socket) ->
	platform553:verify(Msg,Socket);

%% uc安卓
loginVerify(#pk_U2LS_Login_Normal{platformName="uc"} = Msg,Socket) ->
	platform553:verify(Msg,Socket);

%%360平台
loginVerify(#pk_U2LS_Login_Normal{platformName="360"} = Msg,Socket) ->
	platform553:verify(Msg,Socket);

%%XY平台
loginVerify(#pk_U2LS_Login_Normal{platformName="xyzhushou"} = Msg,Socket) ->
	platform553:verify(Msg,Socket);

%%爱思平台
loginVerify(#pk_U2LS_Login_Normal{platformName="aisi"} = Msg,Socket) ->
	platform553:verify(Msg,Socket);

loginVerify(#pk_U2LS_Login_Normal{platformName="tb"} = Msg,Socket) ->
	platform553:verify(Msg,Socket);

%%快用
loginVerify(#pk_U2LS_Login_Normal{platformName="kuaiyong"} = Msg,Socket) ->
	platform553:verify(Msg,Socket);

%%小米平台
loginVerify(#pk_U2LS_Login_Normal{platformName="xiaomi"} = Msg,Socket) ->
	platform553:verify(Msg,Socket);

loginVerify(#pk_U2LS_Login_Normal{}=Msg,Socket) ->
	platform553:verify(Msg,Socket);

loginVerify(Msg,Socket) ->
	?ERROR_OUT("Pid[~p] PlatformID not has ~p ~p",[self(),Socket,Msg]),
	#recPlatformReturn{}.
%% ====================================================================
%% Internal functions
%% ====================================================================


