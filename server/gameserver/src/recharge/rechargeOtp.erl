%% @author zhengzhichun
%% @doc @todo Add description to rechargeOtp.


-module(rechargeOtp).

-behaviour(myGenServer).
-include("recharge.hrl").
-export([
  init/1,
  handle_call/3,
  handle_cast/2,
  handle_info/2,
  terminate/2,
  code_change/3,
  handle_exception/3

]).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
  start_link/0
]).

start_link() ->
  myGenServer:start_link({local, ?PsNameRecharge}, ?MODULE, [], []).

init([]) ->
  ?LOG_OUT("init..."),
  ets:new(?EtsRecharge, [named_table, public, {keypos, #recRecharge.feOrderID}]),
  ?LOG_OUT("init ok"),
  {ok, #state{}}.

handle_call(Request, From, State) ->
  ?ERROR_OUT("handle_call:[~p] in [~p],form:~p", [Request, ?MODULE, From]),
  {noreply, State}.
handle_cast(_Msg, State) ->
  {noreply, State}.
handle_exception(Type, Why, State) ->
  myGenServer:default_handle_excetion(Type, Why, State).
handle_info({<<"new_recharge_msg_coming">>, HttpMsgRechargeInfo, HttpServerPid}, State) ->
  ?LOG_OUT("recharge system new_recharge_msg_coming------~p~n", [HttpMsgRechargeInfo]),
  deal_recharge_msg(HttpMsgRechargeInfo, HttpServerPid),
  {noreply, State};

handle_info({<<"recharge_end">>, #rec_http_msg_recharge_info{character_id = RoleID, orderid = OrderID}}, State) ->
  removeRechargeDicInfo(RoleID, OrderID),
  {noreply, State};
handle_info({<<"change_dic_recharge_state">>, RoleID, OrderID, RechargeState}, State) ->
  ?DEBUG_OUT("---------------------!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-------------------------~p~n", [{RoleID, OrderID}]),
  updateRechargeStateDicInfo(RoleID, OrderID, RechargeState),
  {noreply, State};
%%监测丢失的订单
handle_info({<<"check_lost_recharge_bill">>, RoleID, _FromPid}, State) ->
  {ok, FailRechargeList} = getFailRechargeDicInfo(RoleID),
  ?DEBUG_OUT("------------------FailRechargeList-----------------~p~n", [FailRechargeList]),
  rechargeLogic:check_lost_recharge_bill(FailRechargeList),
  {noreply, State};
%%dbs连接成功
handle_info({alreadyConnectDBServer, _Pid, _}, State) ->
	?LOG_OUT("alreadyConnectDBServer[~w]", [?MODULE]),
	gsSendMsg:sendMsg2DBServer(getRechargeRebateAndTaken, 0, undefined),
	gsSendMsg:sendMsg2DBServer(getNewAndLast7DaysOrder, 0, undefined),
	{noreply, State};
handle_info({getNewAndLast7DaysOrderAck, _Pid, InitRechargeList}, State) ->
	lists:foreach(
		fun(RecRecharge) ->
			case RecRecharge of
				#recRecharge{status = ?RECHARGE_STATE_GIVE} ->
					skip;
				_ ->
					?DEBUG_OUT("addDicInfoByRecRecharge==11111111111==~p~n", [RecRecharge]),
					%%将所有的异常订单全部加入到进程字典内部
					addRechargeDicInfoByAfterServerRestar(RecRecharge)
			end
		end, InitRechargeList),
	ets:insert(?EtsRecharge, InitRechargeList),

	%% 返回加载成功
	gsSendMsg:sendMsg2PublicDataMgr(loadModuleDataAck, 0),
	{noreply, State};
%%GM修改订单状态
%%将订单状态改成未发货----该业务逻辑的目的是执行强制状态修改。不关订单当前的状态，也不会关心起负作用
handle_info({change_recharge_state,_Pid,{<<"changeState2notPay">>, OrderID,CmdSerial,CallbackPid}}, State) ->
  ?DEBUG_OUT("_______change bill changeState2Pay=~p~n",[{OrderID,CmdSerial,CallbackPid}]),
  case rechargeLogic:getRechargeEtsInfo(OrderID) of
    {ok,#recRecharge{roleID = RoleID,purchaseToken =PurchaseToken }}  ->
      %%强制修复ets和mysql中的订单状态
      case rechargeLogic:updateRechargeState(OrderID,?RECHARGE_STATE_INIT) of
        {ok, <<"success">>} ->
          %%强制修复进程字段内的订单状态
          case getRechargeDicInfo(RoleID, OrderID) of
            {ok,#role_recharge_dic_info{}}->
              updateRechargeStateDicInfo(RoleID, OrderID,?RECHARGE_STATE_INIT);
            {error,none}->
              addRechargeDicInfo(#rec_http_msg_recharge_info{character_id = RoleID, orderid = OrderID, purchasetoken = PurchaseToken}, ?IGNORE_PID_GM_CHANGE_RECHARGE_STATE, ?RECHARGE_STATE_INIT)
          end,
          psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial,?GM_CHANGE_RECHARGE_STATE_SUCCESS});
        MysqlDBError ->
          ?ERROR_OUT("recharge system change recharge state2pay fail MysqlDBError=~p",[MysqlDBError]),
          psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial,?GM_CHANGE_RECHARGE_STATE_FAIL_DB_ERROR})
      end;
    EtsError ->
      ?ERROR_OUT("recharge system change recharge state2pay fail EtsError=~p",[EtsError]),
      psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial,?GM_CHANGE_RECHARGE_STATE_ERROR_TO_OLD})
  end,
  {noreply, State};
%%将订单状态改成已发货----该业务逻辑的目的是执行强制状态修复。不关心之前订单是处于何种状态
handle_info({change_recharge_state,_Pid,{<<"changeState2Pay">>,OrderIDBin,CmdSerial,CallbackPid}}, State) ->
  ?DEBUG_OUT("_______change bill changeState2Pay=~p~n",[{OrderIDBin,CmdSerial,CallbackPid}]),
  case rechargeLogic:getRechargeEtsInfo(OrderIDBin) of
    {ok,#recRecharge{roleID = RoleID}} ->
      case rechargeLogic:updateRechargeState(OrderIDBin,?RECHARGE_STATE_GIVE) of
        {ok, <<"success">>} ->
          removeRechargeDicInfo(RoleID,OrderIDBin),
          psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial,?GM_CHANGE_RECHARGE_STATE_SUCCESS});
        R ->
          ?ERROR_OUT("recharge system change recharge state2pay fail errorReason=~p",[R]),
          psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial,?GM_CHANGE_RECHARGE_STATE_FAIL_DB_ERROR})
      end;
    EtsError ->
      ?ERROR_OUT("recharge system change recharge state2pay fail EtsError=~p",[EtsError]),
      psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial,?GM_CHANGE_RECHARGE_STATE_ERROR_TO_OLD})
  end,
  {noreply, State};
handle_info(Info, State) ->
%%  ?DEBUG_OUT("--------------Info----------~p~n", [Info]),
  rechargeRebateLogic:dealInfo(Info, State).


terminate(_Reason, _State) ->
  ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.

deal_recharge_msg(#rec_http_msg_recharge_info{character_id = RoleID, orderid = OrderID} = HttpMsgRechargeInfo, HttpServerPid) ->
  RechargeSysPid = self(),
%%支付函数
  Recharge =
    fun() ->
      Pid = erlang:spawn(
        fun() ->
          deal_recharge1(HttpMsgRechargeInfo, RechargeSysPid, HttpServerPid)
        end),
      addRechargeDicInfo(HttpMsgRechargeInfo, Pid, ?RECHARGE_STATE_INIT)
    end,
  case getRechargeDicInfo(RoleID, OrderID) of
    {error, none} ->
      Recharge();
    %%在发货给玩家时出现异常订单不给于发货，必须要在GM后台手动清楚异常
    {ok, #role_recharge_dic_info{order_state = ?RECHARGE_STATE_EXCEPTION}} ->
       HttpServerPid ! {error, ?RECHAEGE_ERROR_CODE_BIG_EXCEPTION};
    %%服务器重启过了未完成的订单需要继续继续补单逻辑
    {ok, #role_recharge_dic_info{order_state = ?RECHARGE_STATE_INIT, rechargeing_pid = ?IGNORE_PID_SERVER_RESTART}} ->
      Recharge();
    %%GM后台强制修改了订单状态后进行补单业务逻辑。
    {ok, #role_recharge_dic_info{order_state = ?RECHARGE_STATE_INIT, rechargeing_pid = ?IGNORE_PID_GM_CHANGE_RECHARGE_STATE}} ->
      Recharge();
    %%  此处之所以加上RECHARGE_STATE_INIT 是便于代码阅读。在进程字典内根本不存在已完成的订单
    {ok, #role_recharge_dic_info{order_state = ?RECHARGE_STATE_INIT, rechargeing_pid = RechargePid}} ->
      case erlang:is_process_alive(RechargePid) of
        true ->
          ?DEBUG_OUT("============RECHAEGE_ERROR_CODE_IS_RUNNING========~p~n", [HttpServerPid]),
          HttpServerPid ! {error, ?RECHAEGE_ERROR_CODE_IS_RUNNING};
        false ->
          Recharge()
      end
  end.

deal_recharge1(HttpMsgRechargeInfo,RechargeSysPid,HttpServerPid)->
  %#rec_http_msg_recharge_info{character_id = _RoleID, orderid = _OrderID}=HttpMsgRechargeInfo,
  try
    %%支付逻辑内调用的代码为同步代码，不会有异步代码存在
    PayReturn = rechargeLogic:pay(HttpMsgRechargeInfo),
    %%解析支付返回值
    deal_pay_return(HttpMsgRechargeInfo,RechargeSysPid,PayReturn),
    %%向http服务器发送支付返回消息
    HttpServerPid ! PayReturn
  catch
    ErrorType:ErrorInfo ->
      ?ERROR_OUT("run recharge system error,ErrorType:~p,ErrorInfo:~p,stack:~p~n", [ErrorType, ErrorInfo, erlang:get_stacktrace()]),
      deal_rechargeOtpException(HttpMsgRechargeInfo,RechargeSysPid,HttpServerPid)
  end.
%%支付成功了
deal_pay_return(#rec_http_msg_recharge_info{character_id = RoleID, orderid = OrderID} = HttpMsgRechargeInfo, RechargeSysPid, {ok, <<"success">>}) ->
%%此处不再进行数据库日志记录了。在玩家进程内部交易完成之后会有数据库日志记录的。此处的记录有些多余
%%  {ok, RechargeInfo} = rechargeLogic:getRechargeEtsInfo(OrderID),
%%  dbLog:sendSaveLogRecharge(RechargeInfo, RechargeInfo#recRecharge.status, 0, HttpMsgRechargeInfo);
  ?LOG_OUT("recharge system recherge success end roleID=~p,OrderID=~p",[RoleID,OrderID]),
  RechargeSysPid ! {<<"recharge_end">>, HttpMsgRechargeInfo};
%%支付系统遇到了大异常，支付的核心代码出现了异常。必须要即可处理
deal_pay_return(#rec_http_msg_recharge_info{character_id = RoleID, orderid = OrderID}=HttpMsgRechargeInfo,RechargeSysPid,{error, ?RECHAEGE_ERROR_CODE_BIG_EXCEPTION}=PayReturn)->
  ?ERROR_OUT("recharge system recherge end with an big error roleID=~p,OrderID=~p,PayReturn=~p~n",[RoleID,OrderID,PayReturn]),
  RechargeSysPid ! {<<"change_dic_recharge_state">>, RoleID, OrderID, ?RECHARGE_STATE_EXCEPTION},
  case rechargeLogic:getRechargeEtsInfo(OrderID) of
    {ok, RechargeInfo} ->
      dbLog:sendSaveLogRecharge(RechargeInfo,  RechargeInfo#recRecharge.status, ?RECHAEGE_ERROR_CODE_BIG_EXCEPTION, HttpMsgRechargeInfo);
    _R ->
      %%代码不应该执行到这里，当代码能够处理到支付返回的错误码时，数据必然是写入到数据库和ets内的
      ?ERROR_OUT("recharge system forbid run this,rechargeEtsInfo=~p,HttpMsgRechargeInfo=~p,PayReturn=~p",[_R,HttpMsgRechargeInfo,PayReturn]),
      RechargeInfo =  #recRecharge{roleID =RoleID,feOrderID =OrderID },
      dbLog:sendSaveLogRecharge(RechargeInfo, RechargeInfo#recRecharge.status, ?RECHAEGE_ERROR_CODE_UNKNOW_EXCEPTION_CAN_NOT_FIND_DB_DATA, HttpMsgRechargeInfo)
  end;
deal_pay_return(#rec_http_msg_recharge_info{character_id = RoleID, orderid = OrderID}, _RechargeSysPid, {error, ?RECHAEGE_ERROR_CODE_USER_NOT_EXIST} = PayReturn) ->
  %%代码不应该执行到这里，服务器不存在该玩家，有人在恶意发送订单给我们，或者是ums系统出错了
  ?ERROR_OUT("recharge system forbid run this,Our server had attack by other OR UMS system ERROR  roleID=~p,OrderID=~p,PayReturn=~p~n", [RoleID, OrderID, PayReturn]),
  ok;
%%除大异常(即支付核心代码执行时报错了)。其它异常的处理
deal_pay_return(#rec_http_msg_recharge_info{character_id = RoleID, orderid = OrderID}=HttpMsgRechargeInfo,_RechargeSysPid,{error, ErrorCode}=PayReturn)->
  ?LOG_OUT("recharge system recherge end with an error code roleID=~p,OrderID=~p,PayReturn=~p~n",[RoleID,OrderID,PayReturn]),
  case rechargeLogic:getRechargeEtsInfo(OrderID) of
    {ok, RechargeInfo} ->
          dbLog:sendSaveLogRecharge(RechargeInfo, RechargeInfo#recRecharge.status,ErrorCode, HttpMsgRechargeInfo);
    _R ->
      %%代码不应该执行到这里，当代码能够处理到支付返回的错误码时，数据必然是写入到数据库和ets内的
      ?ERROR_OUT("recharge system forbid run this,rechargeEtsInfo=~p,HttpMsgRechargeInfo=~p,PayReturn=~p",[_R,HttpMsgRechargeInfo,PayReturn]),
      RechargeInfo =  #recRecharge{roleID =RoleID,feOrderID =OrderID },
      dbLog:sendSaveLogRecharge(RechargeInfo, RechargeInfo#recRecharge.status, ?RECHAEGE_ERROR_CODE_UNKNOW_EXCEPTION_CAN_NOT_FIND_DB_DATA, HttpMsgRechargeInfo)
   end.

%%处理otp里面捕获到的异常，此处处理的异常不会导致多次给玩家分配奖励，因此允许多次触发该异常。
%% 但是程序必须要即时处理该异常，因为该异常很有可能是数据库不稳定。或者业务代码错误导致的。
%%虽然此处的异常不会有副作用，但是玩家仍然获取不到订单内的钱。只能期待在后续的回调或者玩家上线时获取订单内的钱
deal_rechargeOtpException(#rec_http_msg_recharge_info{character_id = RoleID, orderid = OrderID}=HttpMsgRechargeInfo,_RechargeSysPid,HttpServerPid)->
  case rechargeLogic:getRechargeEtsInfo(OrderID) of
    {ok, RechargeInfo} ->
      HttpServerPid ! {error, ?RECHAEGE_ERROR_CODE_LITTLE_EXCEPTION},
      dbLog:sendSaveLogRecharge(RechargeInfo, RechargeInfo#recRecharge.status, ?RECHAEGE_ERROR_CODE_LITTLE_EXCEPTION, HttpMsgRechargeInfo);
    {error, none} ->
      HttpServerPid ! {error, ?RECHAEGE_ERROR_CODE_SYSTEM_ERROR_BEFORE_WRITE_DB},
      RechargeInfo =  #recRecharge{roleID =RoleID,feOrderID =OrderID },
      dbLog:sendSaveLogRecharge(RechargeInfo, RechargeInfo#recRecharge.status, ?RECHAEGE_ERROR_CODE_SYSTEM_ERROR_BEFORE_WRITE_DB, HttpMsgRechargeInfo)
  end.

updateRechargeStateDicInfo(RoleID, OrderID, OrderState) ->
  {ok, Info} = getRechargeDicInfo(RoleID, OrderID),
  {ok, InfoList} = getRechargeDicInfo(RoleID),
  NewInfoList = lists:keystore(OrderID, #role_recharge_dic_info.order_id, InfoList, Info#role_recharge_dic_info{order_state = OrderState}),
  put(RoleID, NewInfoList).

addRechargeDicInfo(HttpMsgRechargeInfo = #rec_http_msg_recharge_info{character_id = RoleID, orderid = OrderID}, RechargeingPid, OrderState) ->
  Info = #role_recharge_dic_info{role_id = RoleID, order_id = OrderID, order_state = OrderState, rechargeing_pid = RechargeingPid, http_msg_recharge_info = HttpMsgRechargeInfo},
  case getRechargeDicInfo(RoleID, OrderID) of
    {error, none} ->
      case getRechargeDicInfo(RoleID) of
        {error, none} ->
          ?DEBUG_OUT("----------Info------~p~n", [{self(),Info}]),
          put(RoleID, [Info]);
        {ok, InfoList} ->
          ?DEBUG_OUT("----------InfoList------~p~n", [{self(),InfoList}]),
          put(RoleID, [Info | InfoList])
      end;
    {ok, _Info} ->
      {ok, InfoList} = getRechargeDicInfo(RoleID),
      NewInfoList = lists:keystore(OrderID, #role_recharge_dic_info.order_id, InfoList, #role_recharge_dic_info{role_id = RoleID, order_id = OrderID, order_state = OrderState, rechargeing_pid = RechargeingPid}),
      ?DEBUG_OUT("----------NewInfoList------~p~n", [{self(),NewInfoList}]),
      put(RoleID, NewInfoList)
  end.
%%当服务器重启之后，通过交易记录来添加进程字典信息
addRechargeDicInfoByAfterServerRestar(#recRecharge{feOrderID = OrderID, roleID = RoleID, status = State, purchaseToken = PurchaseToken}) ->
  addRechargeDicInfo(#rec_http_msg_recharge_info{character_id = RoleID, orderid = OrderID, purchasetoken = PurchaseToken}, ?IGNORE_PID_SERVER_RESTART, State).
getRechargeDicInfo(RoleID) ->
  case get(RoleID) of
    undefined -> {error, none};
    InfoList ->
      {ok, InfoList}
  end.

getRechargeDicInfo(RoleID, OrderID) ->
  case get(RoleID) of
    undefined ->
      {error, none};
    Info ->
      case lists:keyfind(OrderID, #role_recharge_dic_info.order_id, Info) of
        false -> {error, none};
        #role_recharge_dic_info{} = MatchInfo ->
          {ok, MatchInfo}
      end
  end.

%%在进程字点内获取错误的订单信息
getFailRechargeDicInfo(RoleID) ->
  case get(RoleID) of
    undefined ->
      ?DEBUG_OUT("RechargeList======undefined=========~p~n",[self()]),
      {ok, []};
    RechargeList ->
      ?DEBUG_OUT("RechargeList======11111111111=========~p~n",[RechargeList]),
      ErrorRechargeList =
        lists:filter(
          fun(#role_recharge_dic_info{order_state = OrderState}) ->
            ?DEBUG_OUT("OrderState======11111111111=========~p~n",[OrderState]),
            OrderState =/= ?RECHARGE_STATE_GIVE
          end, RechargeList),
      {ok, ErrorRechargeList}
  end.

removeRechargeDicInfo(RoleID, OrderID) ->
  case getRechargeDicInfo(RoleID) of
    {error, none} ->
      ok;
    {ok, InfoList} ->
      case lists:keydelete(OrderID, #role_recharge_dic_info.order_id, InfoList) of
        [] ->
          erlang:erase(RoleID);
        NewInfoList ->
          put(RoleID, NewInfoList)
      end
  end.
