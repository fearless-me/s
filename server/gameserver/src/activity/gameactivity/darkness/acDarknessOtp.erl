%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, 好玩一二三
%%% @doc
%%% 黑暗之地模块
%%% @end
%%% Created : 06. 二月 2015 14:31
%%%-------------------------------------------------------------------
-module(acDarknessOtp).
-author("tiancheng").

-include("../../activityPrivate.hrl").
-include("acDarknessPrivate.hrl").

-behaviour(myGenServer).

%% API
-export([start_link/1]).

%% gen_server callbacks
-export([
	init/1,
	handle_call/3,
	handle_cast/2,
	handle_info/2,
	terminate/2,
	code_change/3,
	handle_exception/3
]).

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
start_link(Name) ->
	myGenServer:start_link({local,Name}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Initializes the server
%%
%% @spec init(Args) -> {ok, State} |
%%                     {ok, State, Timeout} |
%%                     ignore |
%%                     {stop, Reason}
%% @end
%%--------------------------------------------------------------------
-spec(init(Args :: term()) ->
	{ok, State :: #state{}} | {ok, State :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term()} | ignore).
init([]) ->
	?LOG_OUT("~p ~p init OK",[?MODULE, self()]),
	{ok, #state{}}.

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
handle_call({useDarknessItemTransfer, Data}, _From, State) ->
	Ret = acDarknessLogic:useDarknessItemTransfer(Data),
	{reply, Ret, State};

handle_call(_Request, _From, State) ->
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

%% 主活动模块给出的回调
handle_info({activityChangeCallBack, _Pid, {?ActivityType_Darkness, Phase}}, State) ->
	%% 先判断是否初始化
	case acDarknessState:getDarknessInit() of
		true ->
			skip;
		_ ->
			%% 黑暗之地初始化
			acDarknessLogic:startDarkness(),

			%% 设置初始化完毕
			acDarknessState:setDarknessInit(true),
			ok
	end,

	%% 再执行其它操作
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Darkness) of
		true ->
			acDarknessLogic:activityChangeCallBack(Phase);
		_ ->
			skip
	end,
	{noreply,State};

%% 活动地图的消息接口
handle_info({activityMapMsg, _Pid, {MsgType, Data}}, State) ->
	acDarknessLogic:activityMapMsg(MsgType, Data),
	{noreply,State};

%% 请求入口列表
handle_info({requestEntrance, _Pid, {_RoleID, NetPID}}, State) ->
	L = lists:seq(1, ?DarknessEntranceNumber),
	R = #pk_GS2U_EnterDarkness{entrances = L},
	gsSendMsg:sendNetMsg(NetPID, R),
	{noreply,State};

%% 进入黑暗之地(进入失败，自动加入排队)
handle_info({requestEnterDarkness, Pid, Param}, State) ->
	acDarknessLogic:requestEnterDarkness(Pid, Param),
	{noreply,State};
%% 进入黑暗之地(进入失败，自动加入排队)
handle_info({requestEnterDarkness2, Pid, Param}, State) ->
	acDarknessLogic:requestEnterDarkness(Pid, Param),
	{noreply,State};
handle_info({requestEnterDarkness_prepare, Pid, Param}, State) ->
	acDarknessLogic:requestEnterDarkness_prepare(Pid, Param),
	{noreply,State};

%% 玩家进入黑暗之地
handle_info({playerEnterDarkness, Pid, Param}, State) ->
	acDarknessLogic:updatePlayerDarkness(Pid, Param),
	{noreply,State};

%% 玩家真正进入黑暗之地
handle_info({playerEnterDarknessReal, Pid, {_PlayerCode, RoleID, _NetPID, _MapPID, _PlayerEts} = Param}, State) ->
	acDarknessLogic:syncRoundToMe(Param),

	%% 返回Ack，设置杀戮模式
	Ret =
		case acDarknessActivity:isInActivity() of
			true ->
				case edb:dirtyReadRecord(rec_darkness_ac_rank, RoleID) of
					[#rec_darkness_ac_rank{camp = C}] -> {2, C};
					_ ->
						{1, ?PlayerMutiKillStatus}
				end;
			_ ->
				{1, ?PlayerMutiKillStatus}
		end,
	psMgr:sendMsg2PS(Pid, playerEnterDarknessRealAck, Ret),
	{noreply,State};

%% 玩家离开黑暗之地
handle_info({playerleaveDarkness, Pid, Param}, State) ->
	acDarknessLogic:updatePlayerDarkness(Pid, Param),
	{noreply,State};

%% 角色删除
handle_info({playerdeleteRole, Pid, Param}, State) ->
	acDarknessLogic:updatePlayerDarkness(Pid, {0, Param}),
	{noreply,State};

handle_info({darkness_selfDarkness, _Pid, {RoleID, NetPID}}, State) ->
	%% 自己的势力情况
	selfDarkness(RoleID, NetPID),
	{noreply,State};
handle_info({darkness_openSelectCamp, _Pid,  {RoleID, NetPID}}, State) ->
	%% 打开势力界面
	openCampForm(RoleID, NetPID),
	{noreply,State};
handle_info({darkness_selectCamp, _Pid,  {RoleID, NetPID, Camp}}, State) ->
	case Camp =:= ?DarknessCamp_TS orelse Camp =:= ?DarknessCamp_XE of
		true ->
			Msg =
				case acDarknessActivity:isInActivity() of
					true ->
						%% 选择势力
						case edb:readRecord(rec_darkness_ac_rank, RoleID) of
							[#rec_darkness_ac_rank{}] ->
								playerMsg:getErrorCodeMsg(?ErrorCode_Darkness_SelectCampED, []);
							_ ->
								%% 取一个最大名次
								Sql = qlc:q([Rank || #rec_darkness_ac_rank{rank = Rank, camp = CA} <- mnesia:table(rec_darkness_ac_rank), CA =:= Camp]),
								RankIndex =
									case edb:selectRecord(Sql) of
										[] -> 1;
										RL -> lists:max(RL) + 1
									end,
								R = #rec_darkness_ac_rank{roleID = RoleID, camp = Camp, point = 0, rank = RankIndex},

								%% 保存
								edb:checkAndSave(rec_darkness_ac_rank, RoleID, R, new_rec_darkness_ac_rank, update_rec_darkness_ac_rank),

								%% 重新刷一遍势力界面
								openCampForm(RoleID, NetPID),

								%% 刷新一遍自己的势力
								selfDarkness(RoleID, NetPID),

								%% 加入势力成功
								CampName = acDarknessActivity:getCampName(Camp),
								playerMsg:getErrorCodeMsg(?ErrorCode_Darkness_JoinCamp, [CampName])
						end;
					_ ->
						playerMsg:getErrorCodeMsg(?ErrorCode_Darkness_ActivityNoStart, [])
				end,
			gsSendMsg:sendNetMsg(NetPID, Msg),
			ok;
		_ ->
			skip
	end,
	{noreply,State};
handle_info({darkness_darknessRank, _Pid,  {RoleID, NetPID}}, State) ->
	%% 黑暗之地势力排行榜
	L1 = acDarknessActivity:getRankList(RoleID, ?DarknessCamp_TS),
	L2 = acDarknessActivity:getRankList(RoleID, ?DarknessCamp_XE),
	Msg = #pk_GS2U_DarknessRank{camp1 = L1, camp2 = L2},
%%	?DEBUG_OUT("darkness_openSelectCamp:~p,~p", [RoleID, Msg]),
	gsSendMsg:sendNetMsg(NetPID, Msg),
	{noreply,State};

%% 玩家上线
handle_info({tryToOnlineEnterMap_darkness, Pid, {RoleID, MapID, Data1, Data2}}, State) ->
	Ret =
		case acDarknessLogic:canEnterMap(RoleID) of
			true ->
				acDarknessLogic:tryToOnlineEnterMap_darkness({RoleID, MapID});
			_ ->
				false
		end,
	psMgr:sendMsg2PS(Pid, tryToOnlineEnterMap_darknessAck, {Ret, Data1, Data2}),
	{noreply,State};

%% 玩家在黑暗之地准备间上线
handle_info({tryToOnlineEnterMap_darkness_prepare, Pid, {RoleID, _MapID, Data1, Data2}}, State) ->
	Ret = acDarknessLogic:canEnterMap(RoleID),
	psMgr:sendMsg2PS(Pid, tryToOnlineEnterMap_darknessAck, {Ret, Data1, Data2}),
	{noreply,State};

%% 玩家下线
handle_info({playerOffline, Pid, Param}, State) ->
	acDarknessLogic:updatePlayerDarkness(Pid, Param),
	{noreply,State};

%% 更新魔能水晶
handle_info({updatePlayerPebble, _Pid, Param}, State) ->
	acDarknessLogic:updatePlayerPebble(Param),
	{noreply,State};

%% 同步对方的水晶信息给我
handle_info({syncClientToMe, _Pid, Param}, State) ->
	acDarknessLogic:syncClientToMe(Param),
	{noreply,State};

%% 杀人了
handle_info({playerDeadInDarkness, _Pid, Param}, State) ->
	acDarknessLogic:objectDeadInDarkness(Param),
	{noreply,State};

%% 队友增加黑暗战阶
handle_info({addDarknessPointToTeamAck, _Pid, Param}, State) ->
	acDarknessLogic:objectDeadInDarkness(Param),
	{noreply,State};

handle_info(darknessTickTime, State) ->
	acDarknessLogic:darknessTickTime(),
	{noreply,State};

%% 地图工作者进程创建黑暗之地成功
handle_info({createActivityMapAck, _Pid, Msg}, State) ->
	acDarknessLogic:createActivityMapAck(Msg),
	{noreply,State};

handle_info({gm_freshdarkness, _Pid, _Msg}, State) ->
	NewVersion = acDarknessLogic:getNowTime(),
	?WARN_OUT("gm_freshdarkness:~p", [NewVersion]),
	acDarknessActivity:clearPoint(NewVersion),
	{noreply,State};

handle_info(tryEnterDarknessMapTick, State) ->
	acDarknessLogic:tryEnterDarknessMap(),
	{noreply,State};
handle_info({activityDataLoadAckCallBack, _Pid, _Data}, State) ->
	{noreply, State};
handle_info(Info, State) ->
	?ERROR_OUT("~p ~p recv undefined msg:~p", [?MODULE, self(), Info]),
	{noreply, State}.

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
				State :: #state{}) ->
				   term()).
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

handle_exception(Type, Why, State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%%%===================================================================
%%% Internal functions
%%%===================================================================
%% 自己的势力
selfDarkness(RoleID, NetPID) ->
	{Ret, IsNeedSelectCamp} =
		case acDarknessActivity:isInActivity() of
			true ->
				case edb:dirtyReadRecord(rec_darkness_ac_rank, RoleID) of
					[#rec_darkness_ac_rank{} = Rank] ->
						{acDarknessActivity:getDarknessPlayerRank(Rank), false};
					_ ->
						{acDarknessActivity:getDarknessPlayerRank(RoleID), true}
				end;
			_ ->
				{acDarknessActivity:getDarknessPlayerRank(RoleID), false}
		end,

	{BossID, Time} =
		case acDarknessLogic:judgeSpecialBossFreshTimeIsIn() of
			true ->
				NowTime = acDarknessLogic:getNowTime(),
				case acDarknessState:getSpecialBossInfo() of
					#darknessSpecialBoss{bossID = ID, freshTime = FTime} when ID > 0 andalso NowTime =< FTime ->
						{ID, FTime - NowTime};
					_ ->
						{0, 0}
				end;
			_ ->
				{0, 0}
		end,

	%% 判断剩余时间是否超出活动结束时间
	Msg = #pk_GS2U_SelfDarkness{
		self = Ret,
		isNeedSelectCamp = IsNeedSelectCamp,
		bossID = BossID,
		syFreshTime = Time
	},
	gsSendMsg:sendNetMsg(NetPID, Msg),
	ok.

%% 打开势力选择界面
openCampForm(_RoleID, NetPID) ->
	EDBList = edb:readAllRecord(rec_darkness_ac_rank),
	EDBList_1 = [Rec1 || Rec1 = #rec_darkness_ac_rank{camp = Camp1} <- EDBList, Camp1 =:= ?DarknessCamp_TS],
	EDBList_2 = [Rec2 || Rec2 = #rec_darkness_ac_rank{camp = Camp2} <- EDBList, Camp2 =:= ?DarknessCamp_XE],

	EDBList_11 = acDarknessActivity:getCampList(EDBList_1),
	EDBList_22 = acDarknessActivity:getCampList(EDBList_2),

	Msg = #pk_GS2U_SelectCamp{
		camp1 = EDBList_11,
		cam1Num = erlang:length(EDBList_1),
		camp2 = EDBList_22,
		cam2Num = erlang:length(EDBList_2)
	},
	gsSendMsg:sendNetMsg(NetPID, Msg),
	ok.