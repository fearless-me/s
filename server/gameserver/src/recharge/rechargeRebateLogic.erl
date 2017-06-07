%% @author zhengzhichun
%% @doc @todo Add description to rechargeLogic.


-module(rechargeRebateLogic).
-include("recharge.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	dealInfo/2
]).

dealInfo({getRechargeRebateAck, _Pid, RechargeRebateAck}, State) ->
	Fun = fun
			  (Row) when Row#recSaveRechargeRebate.type == ?RechargeRebateFirstDouble ->
				  edb:writeRecord(?EtsRechargeRebate, Row),
				  gsSendMsg:sendMsg2DBServer(saveRechargeRebateFirstDoubleConf, 0,
					  {
						  Row#recSaveRechargeRebate.id,
						  Row#recSaveRechargeRebate.arg2
					  }),
				  ok;
			  (Row) ->
				  edb:writeRecord(?EtsRechargeRebate, Row),
				  skip
		  end,
	lists:foreach(Fun, RechargeRebateAck),
	{noreply, State};

dealInfo({getRechargeRebateTakenAck, _Pid, []}, State) ->
	{noreply, State};
dealInfo({getRechargeRebateTakenAck, _Pid, [RechargeRebateTakenAck | Tail]}, State) ->
	dealInfo({getRechargeRebateTakenAck, _Pid, RechargeRebateTakenAck}, State),
	dealInfo({getRechargeRebateTakenAck, _Pid, Tail}, State);
dealInfo({getRechargeRebateTakenAck, _Pid, RechargeRebateTakenAck}, State) ->
	edb:writeRecord(?EtsRechargeRebateTaken, RechargeRebateTakenAck),
	{noreply, State};

%%LS发消息，清除玩家已经领取的id
dealInfo({web2lsRechargeRebateFlagClean, _Pid, Recharge_rebateID}, State) ->
	L = edb:selectRecord(qlc:q([X || X <- mnesia:table(?EtsRechargeRebateTaken), X#recSaveRechargeRebateTaken.rebateIdAndType =:= Recharge_rebateID])),
	gsSendMsg:sendMsg2DBServer(cleanRechargeRebateTaken, 0, {Recharge_rebateID}),
	Fun =
		fun() ->
			[mnesia:delete_object(?EtsRechargeRebateTaken, MRow, write) || MRow <- L]
		end,

	mnesia:transaction(Fun),
	{noreply, State};

%%把LS发的数据存到mysql
dealInfo({web2lsRechargeRebate, _Pid, #recSaveRechargeRebate{type = Type, rebateId = RebateIdOld} = RechargeRebateRow}, State) ->
	NewRechargeRebateRow =
		case RebateIdOld < 1 of
			true ->
				%%小于1的id，就需要自增1
				Sql = qlc:q(
					[X#recSaveRechargeRebate.rebateId || X <- mnesia:table(?EtsRechargeRebate), X#recSaveRechargeRebate.type =:= Type]),
				MaxRebateId =
					case edb:selectRecord(Sql) of
						[] ->
							1;
						RebateIdList ->
							lists:max(RebateIdList) + 1
					end,

				<<ID:32>> = <<MaxRebateId:24, Type:8>>,
				RechargeRebateRow#recSaveRechargeRebate{id = ID, rebateId = MaxRebateId};
			_ ->
				RechargeRebateRow
		end,
	Key = NewRechargeRebateRow#recSaveRechargeRebate.id,
	edb:checkAndSave(?EtsRechargeRebate, Key, NewRechargeRebateRow, ?EtsRechargeRebate, ?EtsRechargeRebate),
	gsSendMsg:sendMsg2DBServer(saveRechargeRebate, 0, NewRechargeRebateRow),
	psMgr:sendMsg2PS(self(), web2lsRechargeRebateFlagClean, {self(), Key}),
	{noreply, State};


dealInfo(Info, State) ->
	?ERROR_OUT("~p ~p @~w handle_info ~p", [?MODULE, self(), node(), Info]),
	{noreply, State}.

%%%充值操作发生时的返利相关
%-spec rebate(RoleID :: uint64(), CurrAmount :: float()) -> ok|skip.
%rebate(RoleID, CurrAmount) ->
%	L = edb:selectRecord(qlc:q([X || X <- mnesia:table(?EtsRechargeRebateTaken), X#recSaveRechargeRebateTaken.roleID =:= RoleID])),
%	TakenList = [RebateIdAndType || #recSaveRechargeRebateTaken{rebateIdAndType = RebateIdAndType}
%		<- L],
%	FunRebate =
%		fun(Row) ->
%			case lists:member(Row#recSaveRechargeRebate.id, TakenList) of
%				true ->
%					%%玩家已经领取过的返利配置，直接跳过
%					skip;
%				_ ->
%					rebateCheck(RoleID, CurrAmount, Row)
%			end
%		end,
%	Sql = qlc:q([X || X <- mnesia:table(?EtsRechargeRebate)]),
%	lists:foreach(FunRebate, edb:selectRecord(Sql)).

%%%检查没领过的返利，条件满足执行发送(累充返物品)
%-spec rebateCheck(RoleID :: uint64(), CurrAmount :: float(), ConfRow :: #recSaveRechargeRebate{}) -> boolean().
%rebateCheck(RoleID, _CurrAmount, #recSaveRechargeRebate{
%	id = RebateID,
%	type = ?RechargeRebateItem,
%	beginTime = BTime,
%	endTime = Etime,
%	arg1 = ItemListStr,
%	arg2 = MailTitle,
%	arg3 = MailContent,
%	arg4 = AreaMinAmountBin,
%	arg5 = AreaMaxAmountBin
%} = Row) ->
%
%	Amount = rechargeLogic:getRoleRechargeAmount(RoleID, BTime, Etime),
%	AreaMinAmount = misc:toInteger(AreaMinAmountBin),
%	AreaMaxAmount = misc:toInteger(AreaMaxAmountBin),
%	case Amount =< AreaMaxAmount andalso Amount >= AreaMinAmount of
%		true ->
%			{ok, AttachmentList, []} = rfc4627:decode(ItemListStr),
%			sendSystemMail(AttachmentList, RoleID, ?ItemSourceRechargeRebate, MailTitle, MailContent, ""),
%			flagingRebate4RoleID(RoleID, RebateID),
%			?LOG_OUT("RechargeRebateItem ok r:~p  Amount:~p", [RoleID, Amount]),
%			ok;
%		false ->
%			?LOG_OUT("RechargeRebateItem skip r:~p  Amount:~p", [RoleID, Amount]),
%			skip
%	end,
%
%	?DEBUG_OUT("1rebateCheck----RoleID[~w],CurrAmount[~w],Row[~p] AmountList[~w]", [RoleID, _CurrAmount, Row, Amount]),
%	ok;
%rebateCheck(RoleID, CurrAmount, #recSaveRechargeRebate{id = RebateID, type = ?RechargeRebateBindDiamondFirst, beginTime = BTime, endTime = Etime, arg1 = RateBin} = Row) ->
%	Now = time:getUTCNowSec(),
%	case Now =< Etime andalso Now >= BTime of
%		true ->
%			Rate = misc:toFloat(RateBin),
%			CoinNum = erlang:trunc(CurrAmount * Rate * ?PayRate),
%			mailBindCoin([#recMailCoin{coinType = ?CoinTypeBindDiamond, coinNum = CoinNum}], RoleID, ?CoinSourceRechargeRebate, stringCfg:getString(rechargeRebateMailTitle), stringCfg:getString(rechargeRebateMailTitle), ""),
%			flagingRebate4RoleID(RoleID, RebateID),
%			?DEBUG_OUT("2rebateCheck----RoleID[~w],CurrAmount[~w],Row[~p]", [RoleID, CurrAmount, Row]),
%			?LOG_OUT("RechargeRebateBindDiamondFirst ok r:~p  Amount:~p", [RoleID, CoinNum]),
%			ok;
%		_ ->
%			?LOG_OUT("RechargeRebateBindDiamondFirst skip r:~p  Amount:~p", [RoleID, CurrAmount]),
%			skip
%	end,
%
%	ok;
%rebateCheck(RoleID, CurrAmount, #recSaveRechargeRebate{id = RebateID, type = ?RechargeRebateFirstDouble, arg1 = RateBin, arg2 = PayMoneyBin} = Row) ->
%	PayMoney = misc:toFloat(PayMoneyBin),
%	case CurrAmount == PayMoney andalso PayMoney =/= 0 of
%		true ->
%			Rate = misc:toFloat(RateBin),
%			CoinNum = erlang:trunc(CurrAmount * Rate * ?PayRate),
%			Content = stringCfg:getString(rechargeRebateDoubleMailContent, [PayMoney]),
%			mailBindCoin([#recMailCoin{coinType = ?CoinTypeBindDiamond, coinNum = CoinNum}], RoleID, ?CoinSourceRechargeRebate, stringCfg:getString(rechargeRebateDoubleMailTitle), Content, ""),
%			flagingRebate4RoleID(RoleID, RebateID),
%			?DEBUG_OUT("5rebateCheck----RoleID[~w],CurrAmount[~w],Row[~p]", [RoleID, CurrAmount, Row]),
%			?LOG_OUT("RechargeRebateFirstDouble ok r:~p  Amount:~p", [RoleID, CurrAmount]),
%			ok;
%		_ ->
%			?LOG_OUT("RechargeRebateFirstDouble skip r:~p  Amount:~p", [RoleID, CurrAmount]),
%			skip
%	end,
%
%	ok;
%rebateCheck(RoleID, CurrAmount, #recSaveRechargeRebate{type = ?RechargeRebateBindDiamondPer, beginTime = BTime, endTime = Etime, arg1 = RateBin} = Row) ->
%	%%时间区间内，每笔充值都返利
%	Now = time:getUTCNowSec(),
%	case Now =< Etime andalso Now >= BTime of
%		true ->
%			Rate = misc:toFloat(RateBin),
%			CoinNum = erlang:trunc(CurrAmount * Rate * ?PayRate),
%			mailBindCoin([#recMailCoin{coinType = ?CoinTypeBindDiamond, coinNum = CoinNum}], RoleID, ?CoinSourceRechargeRebate, stringCfg:getString(rechargeRebateMailTitle), stringCfg:getString(rechargeRebateMailTitle), ""),
%			?DEBUG_OUT("3rebateCheck----RoleID[~w],CurrAmount[~w],Row[~p]", [RoleID, CurrAmount, Row]),
%			?LOG_OUT("RechargeRebateBindDiamondPer ok r:~p  Amount:~p", [RoleID, CurrAmount]),
%			ok;
%		_ ->
%			?LOG_OUT("RechargeRebateBindDiamondPer skip r:~p  Amount:~p", [RoleID, CurrAmount]),
%			skip
%	end,
%
%	ok.
%
%%%记录返利活动相应玩家的领取标记
%-spec flagingRebate4RoleID(RoleID :: uint64(), RebateID :: uint32()) -> ok.
%flagingRebate4RoleID(RoleID, RebateID) ->
%	try
%		gsSendMsg:sendMsg2DBServer(saveRechargeRebateTaken, 0, {RoleID, RebateID}),
%		ok = edb:writeRecord(?EtsRechargeRebateTaken, #recSaveRechargeRebateTaken{roleID = RoleID, rebateIdAndType = RebateID})
%	catch
%		_:Err ->
%			?ERROR_OUT("flagingRebate4RoleID err[~p] roleID[~w] rebateID[~w]", [Err, RoleID, RebateID])
%	end,
%
%	ok.
%
%
%
%%%通过json的itemList给玩家发邮件
%%%Attachment={obj,[{"item_id",13},{"item_num",5},{"item_bind",false}]}
%-spec sendSystemMail(AttachmentList, ToRoleID, ReasonCode, MailTitle, MailContent, MailSubjoinMsg) -> FailList when
%	AttachmentList :: [Attachment :: tuple()], ToRoleID :: uint64(), ReasonCode :: integer(), MailTitle :: string(), MailContent :: string(),
%	MailSubjoinMsg :: string(), FailList :: [].
%sendSystemMail(AttachmentList, ToRoleID, ReasonCode, MailTitle, MailContent, MailSubjoinMsg) ->
%	?DEBUG_OUT("sendSystemMail ~p ~p", [MailTitle, AttachmentList]),
%	DePackAttachmentList =
%		fun(ItemOne) ->
%			{ok, ItemID} = rfc4627:get_field(ItemOne, "item_id"),
%			{ok, ItemNum} = rfc4627:get_field(ItemOne, "item_num"),
%			{ok, ItemBind} = rfc4627:get_field(ItemOne, "item_bind"),
%			sendMailItem(ToRoleID, MailTitle, MailContent, ItemID, ItemNum, ItemBind, ReasonCode)
%		end,
%	lists:foreach(DePackAttachmentList, AttachmentList),
%	ok.
%%%邮件发金币
%-spec mailBindCoin(AttachmentList, ToRoleID, ReasonCode, MailTitle, MailContent, MailSubjoinMsg) -> FailList when
%	AttachmentList :: [#recMailCoin{}], ToRoleID :: uint64(), ReasonCode :: integer(), MailTitle :: string(), MailContent :: string(),
%	MailSubjoinMsg :: string(), FailList :: [].
%mailBindCoin(AttachmentList, ToRoleID, ReasonCode, MailTitle, MailContent, MailSubjoinMsg) ->
%	?DEBUG_OUT("mailBindCoin ~p ~p", [MailTitle, AttachmentList]),
%	R = mail:sendSystemMail(ToRoleID, MailTitle, MailContent, AttachmentList, MailSubjoinMsg),
%	ok.
%
%
%sendMailItem(ToRoleID, Title, Content, ItemID, ItemNumber, IsBind, Reason) ->
%	case playerMail:createMailGoods(ItemID, ItemNumber, IsBind, 0, ToRoleID, Reason) of
%		[#recMailItem{} | _] = MailItemList ->
%			mail:sendSystemMail(ToRoleID, Title, Content, MailItemList, []);
%		_ ->
%			?ERROR_OUT("~p, role=~p, item=~p,num=~p, reason=~p",
%				[?MODULE, ToRoleID, ItemID, ItemNumber, Reason]),
%			skip
%	end,
%	ok.



%%
%%%%cs上是否已经有该订单，分支流程(client上来的msg)
%%dealInfo({checkCSHas, FromPlayerPidGS, {_Pid, #pk_U2GS_RequestRecharge{funcellOrderID = FeOrderID}
%%  = Msg}}, State) ->
%%  ?LOG_OUT("checkCSHas[~ts]", [FeOrderID]),
%%  FeOrderIDBinStr = erlang:list_to_binary(FeOrderID),
%%  StatusSucces = 2,%%发货成功
%%  case ets:lookup(?EtsRecharge, FeOrderIDBinStr) of
%%    [#recRecharge{status = Status} = MsgEts | _] when Status == 0 orelse Status == 1 ->
%%      %%默认为0，1为取出，2为发货成功
%%      %%通知玩家加币并把当前订单状态改为已经处理
%%      psMgr:sendMsg2PS(FromPlayerPidGS, rechargeDoIt, MsgEts),
%%      case Status == 1 of
%%        true -> ?ERROR_OUT("checkCSHas status=1(sending):~p", [MsgEts]);
%%        _ ->
%%          ets:update_element(?EtsRecharge, FeOrderID, {#recRecharge.status, 1})
%%      end;
%%    [#recRecharge{status = Status2} = MsgEts2 | _] when Status2 =:= StatusSucces ->
%%      %%成功状态，不再加币
%%      psMgr:sendMsg2PS(FromPlayerPidGS, rechargeHasDone, MsgEts2),
%%      skip;
%%    _ ->
%%      %%让玩家进程发给LS去验证
%%      psMgr:sendMsg2PS(FromPlayerPidGS, rechargeSend2LS, Msg)
%%  end,
%%  {noreply, State};

%%玩家通过LS验证后，成功了，加到mysql与cs缓存中
%%dealInfo({addNewFeOrder, FromPlayerPidGS, {RoleID, FeOrderID, CurrencyTypeBinStr, Amount, CurrencyMoney, ProviderOrderid, GiftBinStr}}, State) ->
%%  ?LOG_OUT("addNewFeOrder roleID[~w] FeOrderID[~ts],Amount[~w]", [RoleID, FeOrderID, Amount]),
%%  gsSendMsg:sendMsg2DBServer(addNewFeOrder, 0, {RoleID, FeOrderID, CurrencyTypeBinStr, Amount, CurrencyMoney, ProviderOrderid, 1, GiftBinStr, FromPlayerPidGS}),
%%  {noreply, State};

%%dealInfo({addNewFeOrderAck, _Pid, {RoleID, FeOrderID, CurrencyTypeBinStr, Amount, CurrencyMoney, DBResult, GiftBinStr, DBBackFromPlayerPidGS}}, State) ->
%%  case DBResult of
%%    true ->
%%      ?LOG_OUT("addNewFeOrderAck[~ts] to mysql ok", [FeOrderID]),
%%      MsgEts = #recRecharge{
%%        roleID = RoleID,
%%        moneyType = CurrencyTypeBinStr,
%%        gameMoneyAmount = Amount,
%%        currencyMoneyAmount = CurrencyMoney,
%%        feOrderID = FeOrderID,
%%        addTime = time:getUTCNowSec(),
%%        giftStr = GiftBinStr,
%%        status = ?RECHARGE_STATE_NOT_GIVE
%%      },
%%      ets:insert_new(?EtsRecharge, MsgEts),
%%
%%      psMgr:sendMsg2PS(DBBackFromPlayerPidGS, rechargeDoIt, MsgEts),
%%      rebate(RoleID, Amount),
%%      ok;
%%    _ ->
%%      ?LOG_OUT("addNewFeOrderAck[~ts] to mysql fail", [FeOrderID])
%%  end,
%%  {noreply, State};

%%%%玩家加了进程字典，通知CS改订单状态
%%dealInfo({changeFeOrderStatue, _FromPlayerPidGS, {FeOrderID}}, State) ->
%%  ?LOG_OUT("recharge system changeFeOrderStatue FeOrderID[~ts]", [FeOrderID]),
%%  Status = 2,%%默认为0，1为取出，2为发货成功
%%  gsSendMsg:sendMsg2DBServer(changeFeOrderStatue, 0, {FeOrderID, Status}),
%%
%%
%%  FeOrderIDBinStr = erlang:list_to_binary(FeOrderID),
%%  ets:update_element(?EtsRecharge, FeOrderIDBinStr, {#recRecharge.status, Status}),
%%  {noreply, State};