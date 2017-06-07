%% @author Administrator
%% @doc @todo Add description to platformTest.


-module(platformTest).

-include("lsInc.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([verify/2]).

verify(#pk_U2LS_Login_Normal{platformAccount=PlatformAccount,platformName=PlatformName}, _Socket)->
	#recPlatformReturn{state=success,platformAccountID=PlatformAccount,platformAccount=PlatformAccount,platformName=PlatformName};

verify(_Msg,_Socket)->
	#recPlatformReturn{}.
%% ====================================================================
%% Internal functions
%% ====================================================================


