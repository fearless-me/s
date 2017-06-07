%% @author zhengzhichun
%% @doc @todo Add description to rechargeLogic.


-module(preRechargeLogic).
-include("preRecharge.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 dealInfo/2
		]).

%%dbs连接成功
dealInfo({alreadyConnectDBServer,_Pid,_}, State)->
	?LOG_OUT("alreadyConnectDBServer "),
	
	gsSendMsg:sendMsg2DBServer(getPreChargeAccount, 0, undefined),
	{noreply, State};

dealInfo({getPreChargeAccountAck,_Pid,PreChargeAccount}, State)->
	?DEBUG_OUT("getPreChargeAccountAck[~w]",[PreChargeAccount]),
	ets:insert(?EtsPreRecharge, PreChargeAccount),

	%% 返回加载成功
	gsSendMsg:sendMsg2PublicDataMgr(loadModuleDataAck, 0),

	{noreply, State};

%%检查cs上是否玩家有预充值
dealInfo({checkCSHas,FromPlayerPidGS,{AccountID}}, State)->
	?LOG_OUT("checkCSHas preRechargeBack[~w]",[AccountID]),
	case ets:lookup(?EtsPreRecharge, AccountID) of

		[#recPreChargeAccount{amount=MoneyAmount} |_] ->
			psMgr:sendMsg2PS(FromPlayerPidGS, checkCSHasAck, MoneyAmount),
			skip;
		[] ->
			%%不用异步通知玩家进程
			skip
	end,
	{noreply, State};

%%领取我的预充值
dealInfo({ getMyPreRecharge, FromPlayerPidGS, { AccountID }}, State)->
	?LOG_OUT("getMyPreRecharge[~w]",[AccountID]),
		case ets:lookup(?EtsPreRecharge, AccountID) of
		[#recPreChargeAccount{amount=MoneyAmount} |_] ->
			gsSendMsg:sendMsg2DBServer(delPreRecharge, 0, {AccountID} ),
			ets:delete(?EtsPreRecharge, AccountID),
			psMgr:sendMsg2PS(FromPlayerPidGS, getMyPreRechargeAck, MoneyAmount),
			skip;
		[] ->
			%%帐号id下当前没有预充值，给到返回0的金额数
			psMgr:sendMsg2PS(FromPlayerPidGS, getMyPreRechargeAck, 0)
	end,
	{noreply, State};

%%gm测试（加预充值币）
dealInfo({ gmUpdate, _FromPlayerPidGS, {AccountID,Amount }}, State)->
	?LOG_OUT("gmUpdate aid[~w] amount[~w]",[AccountID,Amount]),
	ets:insert(?EtsPreRecharge, #recPreChargeAccount{accountID=AccountID,amount=Amount} ),
	{noreply, State};

dealInfo(Info, State) ->
	?ERROR_OUT( "~p ~p @~w handle_info ~p", [?MODULE, self(), node(), Info] ),
	{noreply, State}.