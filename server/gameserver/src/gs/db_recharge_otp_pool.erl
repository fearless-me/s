%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc 支付otp缓冲池
%%%
%%% @end
%%% Created : 10. 十一月 2016 16:00
%%%-------------------------------------------------------------------
-module(db_recharge_otp_pool).
-author("wenshaofei").
-include("dbsInc.hrl").
%% API
-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3, handle_exception/3]).


%%缓冲池大小
%%-define(POOL_SIZE, 100).
-define(POOL_SIZE, 10).
-record(state, {currentIndex = 1}).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the server
%%
%% @end
%%--------------------------------------------------------------------
-spec(start_link() ->
  {ok, Pid :: pid()} | ignore | {error, Reason :: term()}).
start_link() ->
  myGenServer:start_link({local, ?MODULE}, ?MODULE, [], [{timeout, ?Start_Link_TimeOut_ms}]).

init([]) ->
  ok = start_child(?POOL_SIZE),
  {ok, #state{}}.
handle_call(<<"get_pool_element_pid">>, _From, State) ->
  {NewState,Pid}=getPoolElementPid(State),
  {reply, Pid, NewState};
handle_call(_Request, _From, State) ->
  ?ERROR_OUT("receive unknow msg,_Request:~p,_From=~p", [_Request, _From]),
  {reply, ok, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling cast messages
%%
%% @end
%%--------------------------------------------------------------------
-spec(handle_cast(Request :: term(), State :: #state{}) ->
  {noreply, NewState :: #state{}} |
  {noreply, NewState :: #state{}, timeout() | hibernate} |
  {stop, Reason :: term(), NewState :: #state{}}).
handle_cast(_Request, State) ->
  ?ERROR_OUT("receive unknow msg,_Request:~p", [_Request]),
  {noreply, State}.

handle_info(Info, State) ->
  ?ERROR_OUT("receive unknow msg,Info:~p", [Info]),
  {noreply, State}.

-spec(terminate(Reason :: (normal | shutdown | {shutdown, term()} | term()),
    State :: #state{}) -> term()).
terminate(_Reason, _State) ->
  ok.

-spec(code_change(OldVsn :: term() | {down, term()}, State :: #state{},
    Extra :: term()) ->
  {ok, NewState :: #state{}} | {error, Reason :: term()}).
code_change(_OldVsn, State, _Extra) ->
  {ok, State}.

handle_exception(Type, Why, State) ->
  myGenServer:default_handle_excetion(Type, Why, State).

%%启动线程池内的子节点
start_child(0) -> ok;
start_child(Index) when Index > 0 ->
  start_one_child(Index),
  start_child(Index - 1).

start_one_child(Index) ->
  {ok, Pid} = dbRechargeOtp:start_link(list_to_atom("child_element_" ++ integer_to_list(Index))),
  addPid2Dic(Index, Pid).

%%将进程id添加到进程字典内
addPid2Dic(Index, Pid) ->
  put({<<"poolElementPid">>, Index}, Pid).
%%将进程id添加到进程字典内
getPidInDic(Index) ->
  case get({<<"poolElementPid">>, Index}) of
    undefined ->
      {error, none};
    Pid ->
      {ok, Pid}
  end.
%%获取线程池内进程的pid
getPoolElementPid(#state{currentIndex = CurrentIndex} = State) when CurrentIndex =:= ?POOL_SIZE ->
  Pid = getPoolElementPid1(CurrentIndex),
  {State#state{currentIndex = 1}, Pid};
getPoolElementPid(#state{currentIndex = CurrentIndex} = State) ->
  Pid = getPoolElementPid1(CurrentIndex),
  {State#state{currentIndex = CurrentIndex + 1}, Pid}.

getPoolElementPid1(CurrentIndex) ->
  case getPidInDic(CurrentIndex) of
    {ok, Pid} ->
      Pid;
    {error, none} ->
      start_one_child(CurrentIndex),
      {ok, Pid} = getPidInDic(CurrentIndex)
  end,
  Pid.

