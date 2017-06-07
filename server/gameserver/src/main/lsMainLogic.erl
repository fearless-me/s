%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 27. 二月 2017 11:20
%%%-------------------------------------------------------------------
-module(lsMainLogic).
-author(tiancheng).

-include("setup.hrl").
-include("lsInc.hrl").

%% API
-export([
	recordPlayPid/1,
	checkAccountCanLoginGS/1,
	deleteAccount/1,
	updateAccountGSID/1,
	deleteAccountOnGS/1
]).

%%删除一个GS上的所有帐号
deleteAccountOnGS({GSID}) ->
	Condition = ets:fun2ms(
		fun(Obj) when GSID =:=Obj#recLoginAccount.gsLineID ->
			Obj#recLoginAccount.accountID
		end
	),
	AccountIDListOfGS = ets:select(?ETSOnlineAccount, Condition),

	?LOG_OUT("cleanAccountInfoByGSID ~w,gsid ~p",[AccountIDListOfGS,GSID]),

	[ clientLogic:deleleteAccount(AccountID) || AccountID <- AccountIDListOfGS ],

	%%发个消息通知dbs，所有在这个gsid上的帐号清0
	lsSendMsg:sendMsg2DBServer(clearAccountOnGS, {GSID}),
	ok.

%%更新一个帐号的GSID
updateAccountGSID({AccountID, GSID}) ->
	ExistAccountInfo = clientLogic:getAccountByAccountIDEts(AccountID),
	case ExistAccountInfo of
		{}->skip;
		_->
			ets:update_element(?ETSOnlineAccount, AccountID, {#recLoginAccount.gsLineID, GSID}),

			%%貌似只有换线，BehaviorOfAccountChangeGsLine，设计不是很舒服
			lsSendMsg:sendMsg2DBServer(setAccountLoginStatus, {?BehaviorOfAccountChangeGsLine,AccountID, GSID})
	end,
	ok.

%%删除一个帐号
deleteAccount({AccountID}) ->
	ExistAccountInfo = clientLogic:getAccountByAccountIDEts(AccountID),
	case ExistAccountInfo of
		{} -> skip;
		_ ->
			case ExistAccountInfo#recLoginAccount.gsLineID > 0 of
				true ->
					lsSendMsg:sendMsg2DBServer(setAccountLoginStatus, {?BehaviorOfAccountLogout,AccountID,0});
				_ ->skip
			end
	end,
	ets:delete(?ETSOnlineAccount, AccountID),
	ok.

%% 登录成功后，把gs中的玩家进程记录到在线ets中，每次到ls验证key后，就会走登录成功，发该通知给LS
recordPlayPid({AccountID,PlayerPid} = _Msg) ->
	case clientLogic:getAccountByAccountIDEts(AccountID) of
		{} ->
			?ERROR_OUT("recordPlayPid not have:~p",[_Msg]),
			skip;
		#recLoginAccount{accountID = AccountID} ->
			clientLogic:setAccountEts(AccountID,
				[
					{#recLoginAccount.playerPIDInGS,PlayerPid},
					{#recLoginAccount.gsLineID, core:getServerID()}
				]);
		_ ->
			?ERROR_OUT("recordPlayPid not match:~p",[_Msg]),
			skip
	end,
	ok.

%%GS过来验证帐号能否登录
checkAccountCanLoginGS({PlayerPid, AccountID, Key}) ->
	GSId = core:getServerID(),
	case clientLogic:getAccountByAccountIDEts(AccountID) of
		{}->%%验证失败
			?LOG_OUT("checkAccountCanLoginGS fun ETSOnlineAccount:empty ~p ~p",[{PlayerPid, AccountID, Key}, GSId]),
			psMgr:sendMsg2PS(PlayerPid, checkAccountKeyAck,
				{
					?GS_2_LS_CHECKACCOUNT_RESULT_NOTFOUND,
					AccountID,
					"",
					{"","",""},
					"",
					""
				}),
			ok;
		AccountInfo->%%验证通过
			ResultCode = case AccountInfo#recLoginAccount.randIdentity =:= Key of
							 true->
								 case AccountInfo#recLoginAccount.gsLineID > 0 of
									 true->
										 ?GS_2_LS_CHECKACCOUNT_RESULT_ONLINEGS;
									 _->
										 ExpiresSeco = time:getUTCNowSec() - AccountInfo#recLoginAccount.keyCreateTime,
										 case ExpiresSeco < ?LSKeyExpiresSeco of
											 true->
												 %%填充登录lineID
												 clientLogic:setAccountEts(AccountID, {#recLoginAccount.gsLineID,GSId}),
												 %%更新数据库帐号状态
												 lsSendMsg:sendMsg2DBServer(setAccountLoginStatus, {?BehaviorOfAccountLogin, AccountID,GSId}),
												 ?GS_2_LS_CHECKACCOUNT_RESULT_SUCC;
											 _->
												 ?GS_2_LS_CHECKACCOUNT_RESULT_TIMEOUT
										 end
								 end;
							 _->
								 ?GS_2_LS_CHECKACCOUNT_RESULT_KEY_INVALID
						 end,

			FedIdFgi = {AccountInfo#recLoginAccount.fgi,AccountInfo#recLoginAccount.platformAccountID,AccountInfo#recLoginAccount.platformName},
			psMgr:sendMsg2PS(PlayerPid, checkAccountKeyAck,
				{
					ResultCode,
					AccountID,
					AccountInfo#recLoginAccount.account,
					FedIdFgi,
					AccountInfo#recLoginAccount.platformAccountID,
					AccountInfo#recLoginAccount.platformID
				}),
			?LOG_OUT("checkAccountKey ResultCode[~p] ~p ~p",[ResultCode, {PlayerPid, AccountID, Key}, GSId]),
			ok
	end,
	ok.