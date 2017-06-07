%% @author zhengzhichun
%% @doc @todo Add description to rechargeLogic.


-module(rechargeLogic).
-include("recharge.hrl").

%% ====================================================================
%% API functions
%% ====================================================================

-export([
	getRoleRechargeAmount/3,
	pay/1,
	check_lost_recharge_bill/1,
	getRechargeEtsInfo/1,
	send_recharge_exception_mail/1,
	updateRechargeState/2
]).

%%取出玩家充值总元宝
-spec getRoleRechargeAmount(RoleID :: uint64(), BTime :: uint32(), Etime :: uint32()) -> integer().
getRoleRechargeAmount(RoleID, BTime, Etime) ->
	MatchSpec = ets:fun2ms(
		fun(Item) when
			Item#recRecharge.roleID =:= RoleID andalso
				Item#recRecharge.addTime =< Etime andalso Item#recRecharge.addTime >= BTime ->
			Item#recRecharge.gameMoneyAmount
		end
	),
	AmountList = lists:sum(
		ets:select(?EtsRecharge, MatchSpec)
	) * ?PayRate,
	?DEBUG_OUT("getRoleRechargeAmount:~p,~p", [RoleID, AmountList]),
	AmountList.

check_lost_recharge_bill([]) ->
	{ok, <<"success">>};
%%玩家的订单异常了，需要提示玩家找客服
check_lost_recharge_bill([#role_recharge_dic_info{role_id = RoleID, order_id = FeOrderID, order_state = ?RECHARGE_STATE_EXCEPTION} | T]) ->
	case rechargeLogic:getRechargeEtsInfo(FeOrderID) of
		{ok, #recRecharge{} = RechargeInfo} ->
			%%异常订单给玩家发送异常订单邮件
			rechargeLogic:send_recharge_exception_mail(RechargeInfo);
		ExceptionRechargeError ->
			?ERROR_OUT("recharge system exception recharge data error,FeOrderID=~p,RoleID=~p,ExceptionRechargeError=~p~", [FeOrderID, RoleID, ExceptionRechargeError])
	end,
	check_lost_recharge_bill(T);
%%为支付给玩家的订单，此处执行再次支付
check_lost_recharge_bill([#role_recharge_dic_info{role_id = RoleID, order_state = ?RECHARGE_STATE_INIT, order_id = FeOrderID, http_msg_recharge_info = HttpMsgRechargeInfo} | T]) ->
	{OrderID, PurchaseToken} =
		case rechargeLogic:getRechargeEtsInfo(FeOrderID) of
			{ok, #recRecharge{feOrderID = OrderID_, purchaseToken = PurchaseToken_}} ->
				%%在此处补单说明用户在支付之后掉线了。是正常现象
				{OrderID_, PurchaseToken_};
			_ExceptionRechargeError ->
				%%在此处补单说明程序运行时失败了。原因有一下两种
				%% 1、第一次插入数据库失败了。务必注意监测数据库的稳定性
				%%2、在执行第一次数据库插入之前业务代码报错了，务必解决掉报错bug。否则会继续导致补单失败
				#rec_http_msg_recharge_info{orderid = OrderID_, purchasetoken = PurchaseToken_} = HttpMsgRechargeInfo,
				?ERROR_OUT("recharge system has a big error ,please fix it!!!!!!!!!!!!!!!!!!!,HttpMsgRechargeInfo=~p", [HttpMsgRechargeInfo]),
				{OrderID_, PurchaseToken_}
		end,
	?LOG_OUT("recharge system will  find lost recharge OrderID=~p,RoleID=~p", [OrderID, RoleID]),
	http_pay_call_back_logic:give_lost_recharge_to_user(OrderID, PurchaseToken, RoleID),
	check_lost_recharge_bill(T);
check_lost_recharge_bill([ErrorRechargeInfo | T]) ->
	%% 不允许已完成类型的订单出现在此处。已完成的订单必须要回收掉。如果出现了该打印则表示已完成订单没有从进程字典里面移除掉
	?ERROR_OUT("recharge system error RechargeInfo,RechargeInfo=~p~", [ErrorRechargeInfo]),
	check_lost_recharge_bill(T).


pay(HttpMsgRechargeInfo) ->
	case verifyRechargeInfo(HttpMsgRechargeInfo) of
		{ok, <<"success">>} ->
			pay2(HttpMsgRechargeInfo);
		ErrorReason ->
			ErrorReason
	end.

pay2(HttpMsgRechargeInfo) ->
	case addNewRecharge2DB(HttpMsgRechargeInfo) of
		{ok, <<"success">>} ->
			pay3(HttpMsgRechargeInfo);
		ErrorReason ->
			ErrorReason
	end.
pay3(HttpMsgRechargeInfo) ->
	OrderID = HttpMsgRechargeInfo#rec_http_msg_recharge_info.orderid,
	{ok, #recRecharge{roleID = RoleID} = RechargeInfo} = getRechargeEtsInfo(OrderID),
	case ets:lookup(ets_rec_OnlinePlayer, RoleID) of
		[#rec_OnlinePlayer{pid = PlayerPid}] ->
			try
				?LOG_OUT("recharge system pay to user will begin,roleID=~p,RechargeInfo=~p~n", [RoleID, RechargeInfo]),
				{ok, <<"success">>} = gen_server:call(PlayerPid, {payToUser, RechargeInfo}, 3000),
				?LOG_OUT("recharge system pay to user end,roleID=~p,OrderID=~p~n", [RoleID, OrderID]),
				updateRechargeState(OrderID, ?RECHARGE_STATE_GIVE)
			catch
				ErrorType :Exception ->
					%%异常订单给玩家发送异常订单邮件
					rechargeLogic:send_recharge_exception_mail(RechargeInfo),
					%%如果此处修改状态失败、则说明数据库已经处理不过来了，必须要引起注意。就算此处状态写入失败也不会导致任何问题。在otp里面有进程字段同样保存了订单的异常状态。
					updateRechargeState(OrderID, ?RECHARGE_STATE_EXCEPTION),
					?ERROR_OUT("recharge system give user payment exception,ErrorType:~p,ErrorInfo:~p,stack:~p~n", [ErrorType, Exception, erlang:get_stacktrace()]),
					{error, ?RECHAEGE_ERROR_CODE_BIG_EXCEPTION}
			end;
		[] ->
			{error, ?RECHAEGE_ERROR_CODE_USER_NOT_ONLINE}
	end.

%%获取ets里面的订单信息
getRechargeEtsInfo(FeOrderID) ->
	case ets:lookup(?EtsRecharge, FeOrderID) of
		[#recRecharge{} = Info] -> {ok, Info};
		[] -> {error, none}
	end.
%%网数据库里面添加新的订单
addNewRecharge2DB(
	#rec_http_msg_recharge_info{
		orderid = FeOrderID,
		amount = GameMoneyAmont,
		currency_amount = MoneyAmount,
		character_id = RoleID,
		item_id = ItemID,
		item_amount = ItemNumber,
		currency = CurrencyTypeBinStr,
		excess_amount = ExecessGameMoneyAmount,
		excess_money = ExcessMoney,
		provider_orderid = ProviderOrderid,
		gift = Gift,
		comments = Comments,
		purchasetoken = PurchaseToken,
		category = Category}) ->
	case getRechargeEtsInfo(FeOrderID) of
		{error, none} ->
			CurrencyMoney = MoneyAmount + ExcessMoney,
			GameMoney = GameMoneyAmont + ExecessGameMoneyAmount,
			RechargeInfo = #recRecharge{
				roleID = RoleID,
				moneyType = CurrencyTypeBinStr,
				gameMoneyAmount = GameMoney,
				item_amount = ItemNumber,
				item_id = ItemID,
				currencyMoneyAmount = CurrencyMoney,
				feOrderID = FeOrderID,
				addTime = time:getSyncUTCTime1970FromDBS(),
				giftStr = Gift,
				status = ?RECHARGE_STATE_INIT,
				purchaseToken = PurchaseToken,
				category = Category
			},

			[#rec_base_role{accountID = AccountID, level = Level}] = ets:lookup(ets_rec_base_role, RoleID),
			AccountIDStr = erlang:integer_to_list(AccountID),
			talkdataOtp:send2me(toTalkData, {FeOrderID, AccountIDStr, CurrencyMoney, Comments, CurrencyTypeBinStr, Level}),
			NewFeOrderInfo = {RoleID, FeOrderID, CurrencyTypeBinStr, GameMoney, CurrencyMoney, ProviderOrderid, ?RECHARGE_STATE_INIT, Gift, PurchaseToken, ItemNumber, ItemID, Category},
			case gsSendMsg:callDBRechargeServer(addNewFeOrder, NewFeOrderInfo, 3000) of
				{ok, <<"success">>} ->
					%%向数据库内添加新订单
					?LOG_OUT("recharge system add mysql data success,will insert to ets NewFeOrderInfo:~p,RechargeInfo=~p", [NewFeOrderInfo, RechargeInfo]),
					ets:insert(?EtsRecharge, RechargeInfo),
					{ok, <<"success">>};
				Error ->
					?ERROR_OUT("recharge system add mysql data fill NewFeOrderInfo:~p,error info:~p~n", [NewFeOrderInfo, Error]),
					Error
			end;
		{ok, #recRecharge{} = DBOrderInfo} ->
			?LOG_OUT("recharge system  recharge data has in ets dont need inser to mysql DB,OrderInfo:~p", [DBOrderInfo]),
			{ok, <<"success">>}
	end.
%%修改订单状态
updateRechargeState(FeOrderID, NewState) ->
	R = gsSendMsg:callDBRechargeServer(changeFeOrderStatue, {FeOrderID, NewState}, 3000),
	case R of
		{ok, <<"success">>} ->
			ets:update_element(?EtsRecharge, FeOrderID, [{#recRecharge.status, NewState}]);
		_ ->
			skip
	end,
	R.

%%发送异常充值邮件
send_recharge_exception_mail(#recRecharge{roleID = RoleID, feOrderID = FeOrderID, gameMoneyAmount = CoinNum}) ->
	MailContent = stringCfg:getString(rechargeFailMailContent, [erlang:binary_to_list(FeOrderID), CoinNum]),
	mail:sendSystemMail(RoleID, stringCfg:getString(rechargeFailMailTitle), MailContent, [], "").

%%
%%%%校验订单是否合格
verifyRechargeInfo(#rec_http_msg_recharge_info{character_id = RoleID} = HttpMsgRechargeInfo) ->
	?DEBUG_OUT("==verifyRechargeInfo==RoleID===~p~n", [RoleID]),
	case ets:lookup(ets_rec_base_role, RoleID) of
		[#rec_base_role{} = RoleInfo] ->
			verifyRechargeInfo2(HttpMsgRechargeInfo, RoleInfo);
		_ ->
			{error, ?RECHAEGE_ERROR_CODE_USER_NOT_EXIST}
	end.
verifyRechargeInfo2(#rec_http_msg_recharge_info{orderid = OrderID}, _RoleInfo) ->
	?DEBUG_OUT("========verifyRechargeInfo2===========================~p~n",[ getRechargeEtsInfo(OrderID)]),
	case getRechargeEtsInfo(OrderID) of
		{ok, #recRecharge{status = ?RECHARGE_STATE_GIVE}} ->
			{error, ?RECHAEGE_ERROR_CODE_HAD_PAY};
		{ok, #recRecharge{status = ?RECHARGE_STATE_EXCEPTION}} ->
			{error, ?RECHAEGE_ERROR_CODE_BIG_EXCEPTION};
		_ ->
			{ok, <<"success">>}
	end.