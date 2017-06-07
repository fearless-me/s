%%%支付服务器处理
-module(dbRechargeOtp).
-author(wenshaofei).

-include("dbsInc.hrl").

-behaviour(myGenServer).

-record(state, {
}).


%% ====================================================================
%% API functions
%% ====================================================================
-export([start_link/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3, handle_exception/3]).


start_link(Name) ->
  myGenServer:start_link({local, Name}, ?MODULE, [], [{timeout, ?Start_Link_TimeOut_ms}]).

init([]) ->
  {ok, #state{}}.

%%gs新增充值订单
handle_call({addNewFeOrder, {RoleID, FeOrderID, CurrencyTypeBinStr, Amount, CurrencyMoney, ProviderOrderid, Status, GiftBinStr,PurchaseToken,ItemNumber,ItemID,Category}}, _PidFromGS, State) ->
  ?LOG_OUT("addNewFeOrder roleID[~w] feOrderID[~ts]", [RoleID, FeOrderID]),
  case dbCSSave:addOrder(RoleID, FeOrderID, CurrencyTypeBinStr, Amount, CurrencyMoney, ProviderOrderid, Status, GiftBinStr,PurchaseToken,ItemNumber,ItemID,Category) of
    {ok,true} ->
      ?LOG_OUT("recharge system addNewFeOrder roleID[~w] feOrderID[~ts] success", [RoleID, FeOrderID]),
      {reply, {ok, <<"success">>}, State};
    ErrorReason ->
      ?ERROR_OUT("recharge system  addNewFeOrder fail roleID[~w] feOrderID[~ts] fail ErrorReason:~p", [RoleID, FeOrderID, ErrorReason]),
      {reply, {error,ErrorReason}, State}
  end;
%%gs修改订单状态
handle_call({changeFeOrderStatue, {FeOrderID, Status}}, _PidFromGS, State) ->
  ?LOG_OUT("changeFeOrderStatue feOrderID[~ts] statues[~w]", [FeOrderID, Status]),
  case dbCSSave:changeOrderStatue(FeOrderID, Status) of
    true -> {reply, {ok, <<"success">>}, State};
    _ ->
      {reply, {error, <<"update order state fail ,can not find recharge order by id">>}, State}
  end;
handle_call(_Request, _From, State) ->
  ?ERROR_OUT("receive unknow msg,_Request:~p,_From=~p", [_Request, _From]),
  {noreply, ok, State}.

handle_cast(_Msg, State) ->
  {noreply, State}.

terminate(_Reason, _State) ->
  ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.

handle_exception(_Type, _Why, _State) ->
  throw("need stop genserver").

handle_info(Info, State) ->
  ?ERROR_OUT("unhandle info:[~p] in [~p] [~p,~p]", [Info, node(), ?MODULE, self()]),
  {noreply, State}.

