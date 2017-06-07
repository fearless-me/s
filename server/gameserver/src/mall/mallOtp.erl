%%@author xujian
-module(mallOtp).
-author("xujian").

-behaviour(myGenServer).

-include("gsInc.hrl").
%% API
-export([start_link/0]).

%% gen_server callbacks
-export([init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3,
    handle_exception/3]).

-define(SERVER, ?MODULE).

-record(state, {}).

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
    myGenServer:start_link({local, ?PsNameMall}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

-spec(init(Args :: list()) ->
    {ok, State :: #state{}} | {ok, State :: #state{}, timeout() | hibernate} | {ok,{}} |
    {stop, Reason :: term()} | ignore).
init([]) ->
	?LOG_OUT("init..."),
	ets:new(?MallItemTableEts, [public, named_table,{ keypos, #recSaveMall.dbID },{read_concurrency,true}]),
	?LOG_OUT("init ok"),
	{ok, {}}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling call messages
%%
%% @end
%%--------------------------------------------------------------------
-spec(handle_call(Request :: term(), From :: {pid(), Tag :: term()},
    State :: #state{}) ->
    {reply, Reply :: term(), NewState :: #state{}} |
    {reply, Reply :: term(), NewState :: #state{}, timeout() | hibernate} |
    {noreply, NewState :: #state{}} |
    {noreply, NewState :: #state{}, timeout() | hibernate} |
    {stop, Reason :: term(), Reply :: term(), NewState :: #state{}} |
    {stop, Reason :: term(), NewState :: #state{}}).

%% GS请求购买处理
handle_call({onMallBuyRequest, #recCallBuyArgs{
											   roleID=RoleID, 
											   db_id=Db_id, 
											   itemNum=Buy_Num,
											   coinTypeDiamondNum=CoinTypeDiamondNum,
											   coinTypeBindDiamondNum=CoinTypeBindDiamondNum,
											   coinTypeScoreNum=CoinTypeScoreNum,
											   useCoinType=MoneyType,
											   db_idDayCouter=MallDaily
											  }}, _From, State) ->
	{ErrorCode,CanBuyCount,ReturnItem,ReturnRebate,LimitType} = mallBase:onMallBuyRequest(RoleID, Db_id, Buy_Num,CoinTypeDiamondNum,CoinTypeBindDiamondNum,CoinTypeScoreNum,MoneyType,MallDaily),
	{reply, {ErrorCode,CanBuyCount,ReturnItem,ReturnRebate,LimitType}, State};

%% 平台添加新道具
handle_call({malladdnewitem, {NewMallItem}}, _From, State) ->
	?LOG_OUT("add mallGoods by platform NewMallItem:~p",[NewMallItem]),
	Ret = mallBase:malladdnewitem(NewMallItem),
	{reply, Ret, State};

%% 平台删除道具
handle_call({malldelitem, {Db_id}}, _From, State) ->
	?LOG_OUT("delete mallGoods by platform Db_id:~p",[Db_id]),
	Ret = mallBase:malldelitem(Db_id),
	{reply, Ret, State};

%% GM 设置限购
handle_call({mallsetlimitbuy, {Db_id, LimitBuy, LimitType, BeginTime, EndTime}}, _From, State) ->
	?LOG_OUT("set mallGoods limitbuy by platform Db_id:~p, LimitBuy:~p, limittype:~p,beginttime:~p,endtime:~p",[Db_id, LimitBuy, LimitType, BeginTime, EndTime]),
	Ret = mallBase:mallsetlimitbuy(Db_id, LimitBuy, LimitType, BeginTime, EndTime),
	{reply, Ret, State};

%% GM 设置赠送
handle_call({mallsetbuysend, {SendBuy}}, _From, State) ->
	?LOG_OUT("set mallGoods sendbuy by platform SendBuyInfo:~p",[SendBuy]),
	Ret = mallBase:mallsetbuysend(SendBuy),
	{reply, Ret, State};

%% GM 设置上下架时间
handle_call({mallsetbuytime, {NewMallItem}}, _From, State) ->
	?LOG_OUT("set mallGoods Shelves Item:~p",[NewMallItem]),
	Ret = mallBase:mallsetbuytime(NewMallItem),
	{reply, Ret, State};

%% GM 设置折扣
handle_call({mallsetrebate, {Db_ID, Rebate, BeginTime, EndTime}}, _From, State) ->
	?LOG_OUT("set mallGoods Rebate by platform Db_ID:~p, Rebate:~p, BeginTime:~p, EndTime:~p",[Db_ID, Rebate, BeginTime, EndTime]),
	Ret = mallBase:mallsetrebate(Db_ID, Rebate, BeginTime, EndTime),
	{reply, Ret, State};

handle_call(_Request, _From, State) ->
    {noreply, State}.

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
handle_cast(_Msg, State) ->
    {noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling all non call/cast messages
%%
%% @spec handle_info(Info, State) -> {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
-spec(handle_info(Info :: timeout() | term(), State :: #state{}) ->
    {noreply, NewState :: #state{}} |
    {noreply, NewState :: #state{}, timeout() | hibernate} |
    {stop, Reason :: term(), NewState :: #state{}}).
%% cs 与 db 连通了
handle_info(Info, StateData) ->
	try
		case Info of
		%% 获取商城数据
			{alreadyConnectDBServer, _Pid, _Msg}->
				?DEBUG_OUT("~p ~p alreadyConnectDBServer", [?MODULE, self()]),
				gsSendMsg:sendMsg2DBServer(loadMallData, 0, {});
		%%DB读取数据库数据传过来
			{loadMallDataAck, _Pid, {MallList}}->
				{ok, _NewState} = mallBase:onMallInit(MallList);
		%%DB读取限购数据
			{loadLimitMallDataAck, _Pid, {MallList}}->
				mallBase:onLimitMallInit(MallList),

				%% 返回加载成功
				gsSendMsg:sendMsg2PublicDataMgr(loadModuleDataAck, 0);
		%%写ets到mysql
			{doSaveDataToMysql}->
				L = ets:tab2list(?MallItemTableEts),
				[
				 gsSendMsg:sendMsg2DBServer(saveMallData, 0, X)
				 || X <- L];
		%% GS请求刷新数据
			{queryMallList, PidFromGS, {RoleID, Level, Recharge, Seed,SendType}}->
				Ret = mallBase:queryMallList(RoleID, Level, Recharge, Seed),
				Ret2 = [ SendType | Ret ],
				psMgr:sendMsg2PS(PidFromGS, queryMallInfoAck, Ret2);
		%% GS请求重置商城种子
			{requestRestSeed, _PidFromGS, {}}->
				?WARN_OUT("requestRestSeed"),
				mallBase:incMallSeed();
		%% GS购买成功处理
			{onMallBuySuccess, PidFromGS, {RoleID, Db_id, MoneyType, Item_ID, Buy_Num}}->
				Ret = mallBase:onMallBuySuccess(RoleID, Db_id, MoneyType, Item_ID, Buy_Num),
				case Ret of
					{true,_,_,_,_}->
						psMgr:sendMsg2PS(PidFromGS, onMallBuySuccessAck, Ret);
					_->
						ok
				end;
		%%新增折扣道具
			{addRebate}->
				mallBase:incMallSeed();
		%%结束道具折扣
			{endRebate, DbID}->
				mallBase:endRebate(DbID),
				mallBase:incMallSeed();
		%%GM上架
			{addMallGoodsByGM, Db_ID}->
				ets:update_element(?MallItemTableEts, Db_ID, {#recSaveMall.isHide, ?Mall_Show}),
				[NewRecord] = ets:lookup(?MallItemTableEts, Db_ID),
				gsSendMsg:sendMsg2DBServer(saveMallData, 0, NewRecord),
				mallBase:incMallSeed();
		%%GM下架
			{removeMallGoodsByGM, Db_ID}->
				ets:update_element(?MallItemTableEts, Db_ID, {#recSaveMall.isHide, ?Mall_Hidle}),
				[NewRecord] = ets:lookup(?MallItemTableEts, Db_ID),
				gsSendMsg:sendMsg2DBServer(saveMallData, 0, NewRecord),
				mallBase:incMallSeed();
		%%平台设置上架
			{addMallGoodsByPlat}->
				mallBase:incMallSeed();
		%%平台设置下架
			{removeMallGoodsByPlat, Db_ID}->
				%%删除商品
				gsSendMsg:sendMsg2DBServer(delMallData, 0, Db_ID),
				ets:delete(?MallItemTableEts, Db_ID),
				mallBase:incMallSeed();
			{gmSaveMallGoods, _Pid, Msg}->
				%% 平台GM设置CS商城数据
				mallBase:gmSetMallInfo(Msg);
			{gmDelMallGoods, _Pid, Msg}->
				%% 平台GM设置CS商城数据
				mallBase:gmSetMallInfo(Msg);
			{deleteRole, _Pid, {RoleID} } ->
				mallBase:deleteRoleMemData(RoleID);
			_All->
				?WARN_OUT("========[~p]",[_All]),
				ok
		end,
		{noreply, StateData}

	catch
		_:_Why->
			?ERROR_OUT( "ExceptionFunc_Module:[~p] ExceptionFunc[hande_info] Why[~p] stack[~p]",
				[?MODULE,_Why, erlang:get_stacktrace()] ),

			{noreply, StateData}
	end.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
%%
%% @spec terminate(Reason, State) -> void()
%% @end
%%--------------------------------------------------------------------
-spec(terminate(Reason :: (normal | shutdown | {shutdown, term()} | term()),
    State :: #state{}) -> term()).
terminate(_Reason, _State) ->
    ok.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Convert process state when code is changed
%%
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%% @end
%%--------------------------------------------------------------------
-spec(code_change(OldVsn :: term() | {down, term()}, State :: #state{},
	Extra :: term()) ->
	{ok, NewState :: #state{}} | {error, Reason :: term()}).
code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%%%===================================================================
%%% Internal functions
%%%===================================================================

