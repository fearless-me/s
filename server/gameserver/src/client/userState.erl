%% @author zhongyunawei
%% @doc @todo Add description to userState.


-module(userState).
-author(zhongyuanwei).
-include("logger.hrl").
-include("commonDef.hrl").
-include_lib("stdlib/include/ms_transform.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-compile(export_all).

%% ====================================================================
%% 进程字典接口
%% ====================================================================

getUserSocket() ->
	get('UserSocket').

setUserSocket(Sock) ->
	put('UserSocket',Sock).

getPlayerPid() ->
	get('PlayerPid').

setPlayerPid(Pid) when erlang:is_pid(Pid)->
	put('PlayerPid',Pid).

setAccountID(Var) ->
    put(accountID,Var).

getAccountID() ->
    get(accountID).

%%进程签到更新
procSignInInit( EtsTableName, Frequency ) ->
	ProcSignRow = #recProcSignIn{
								 pid = self(),
								 signInTime = time:getUTCNowSec()
								},
	ets:insert(EtsTableName, ProcSignRow),
	erlang:send_after(Frequency, self(), {procSignIn,0,0}).
%%进程签到更新
procSignIn( EtsTableName, Frequency ) ->
	myEts:updateEts(EtsTableName, self(), {#recProcSignIn.signInTime,time:getUTCNowSec()}),
	erlang:send_after(Frequency, self(), {procSignIn,0,0}).


setHeartBeatRec(Value) ->
	put(heartBeatRec, Value).

getHeartBeatRec() ->
	get(heartBeatRec).

%% ====================================================================
%% Internal functions
%% ====================================================================


