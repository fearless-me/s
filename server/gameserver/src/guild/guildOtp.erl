%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%% 公会otp
%%% @end
%%% Created : 26. 八月 2014 16:59
%%%-------------------------------------------------------------------
-module(guildOtp).
-author("tiancheng").

-include("guildPrivate.hrl").

-behaviour(myGenServer).

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
	myGenServer:start_link({local, ?PsNameGuild}, ?MODULE, [], []).

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
	?LOG_OUT("~p init", [?MODULE]),

    %% 军团主表
    ets:new(rec_guild, [public, named_table, set, {keypos, #rec_guild.guildID}, {write_concurrency, true}, {read_concurrency, true}]),

    %% 军团成员表
    ets:new(rec_guild_member, [public, named_table, set, {keypos, #rec_guild_member.roleID}, {write_concurrency, true}, {read_concurrency, true}]),

    %% 军团申请表
    ets:new(rec_guild_apply, [public, named_table, bag, {keypos, #rec_guild_apply.roleID}, {write_concurrency, true}, {read_concurrency, true}]),

    %% 军团战报名表
    ets:new(rec_guild_battle_paid, [public, named_table, set, {keypos, #rec_guild_battle_paid.guildID}, {write_concurrency, true}, {read_concurrency, true}]),

	%% 游乐场
	ets:new(?EtsGuildRide, [public, named_table, set, {keypos, #recGuildRide.guildID}, {write_concurrency, false}, {read_concurrency, true}]),
	ets:new(?EtsGuildRideUser, [public, named_table, set, {keypos, #recGuildRideUser.roleID}, {write_concurrency, false}, {read_concurrency, true}]),

    %% 默认5分钟检查一次
    guildState:setNextCheckGuildDataTime({time:getUTCNowSec(), 5}),
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

handle_call({createGuild, Data}, _From, State) ->
	Ret = guildBase:onCreateGuild(Data),
	{reply, Ret, State};

handle_call({changeGuildName, {GuildID, NewGuildName, RoleID}}, _From, State) ->
	Ret = guildBase:onChangeGuildName(GuildID, NewGuildName, RoleID),
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
%% cs 与 db 连通了
handle_info({alreadyConnectDBServer, _Pid, _Msg}, State)->
	?DEBUG_OUT("~p ~p alreadyConnectDBServer", [?MODULE, self()]),

    %% 加载军团数据
    gsSendMsg:sendMsg2DBServer(loadGuildData, 0, 0),

	%% 处理军团竞价出资逻辑
	guildWarPaid:loadGuildWarPaidSuccess(),

	%% 开启心跳
	erlang:send_after(?GuildHeartBeat, self(), tickGuildHeartBeat),
	{noreply, State};

handle_info(tickGuildHeartBeat, State)->
	%% 先心跳
	erlang:send_after(?GuildHeartBeat, self(), tickGuildHeartBeat),

	%% 去掉已经过期的申请者
	guildLogic:deleteTimeOutRequestRole(),

	%% 分配军团争霸赛
	guildWarPaid:allocGuildWar(),

    %% 检查军团是否需要解散
    guildLogic:checkGuildIsDelete(),

    guildLogic:checkrepairGuildData(),

	%% 刷新游乐场
	guildLogic:tickForFairground(),

	{noreply, State};

handle_info({loadGuildDataAck, _PID, {GuildList, GuildMemberList, GuildBattleList, GuildRideList}}, State)->
    F =
        fun(#rec_guild{guildName = GuildName, notice = Notice} = Guild) ->
            Guild#rec_guild{guildName = erlang:binary_to_list(GuildName), notice = erlang:binary_to_list(Notice)}
        end,
    GuildList2 = lists:map(F, GuildList),
    ets:insert(rec_guild, GuildList2),

	%% 加载公会数据
	ets:insert(rec_guild_member, GuildMemberList),
    ets:insert(rec_guild_battle_paid, GuildBattleList),
	lists:foreach(fun(R) -> guildState:replaceRide(R) end, GuildRideList),

	%% 返回加载成功
	gsSendMsg:sendMsg2PublicDataMgr(loadModuleDataAck, 0),

    guildLogic:repairGuildData(),

    ?LOG_OUT("load guild ~p, load guildmember ~p", [erlang:length(GuildList2), erlang:length(GuildMemberList)]),
	{noreply, State};

handle_info({deleteRole, _Pid, {RoleID}}, State) ->
	%% 删除角色，如果有工会，删除角色
	guildBase:onDeleteRole(RoleID),

	%% 清掉申请的数据
    ets:delete(rec_guild_apply, RoleID),
	{noreply, State};

%% 解散公会
handle_info({deleteGuild, PidFromGS, {GuildID, RoleID}}, State) ->
	guildBase:onDeleteGuild(GuildID, RoleID, ?DeleteGuildReason_ZD),
	{noreply, State};

handle_info({addguildresource, PidFromGS, {GuildID, Value}}, State) ->
	Ret = guildBase:addguildresource(GuildID, Value),
	psMgr:sendMsg2PS(PidFromGS, addguildresourceAck, Ret),
	{noreply, State};

handle_info({addguildliveness, PidFromGS, {GuildID, Value}}, State) ->
	Ret = guildBase:addguildliveness(GuildID, Value),
	psMgr:sendMsg2PS(PidFromGS, addguildresourceAck, Ret),
	{noreply, State};

handle_info({player_guildReward, PidFromGS, {GuildID, RoleID, Index, #guild_rewardCfg{} = Conf}}, State) ->
	Ret =
		case ets:lookup(rec_guild_member, RoleID) of
			[#rec_guild_member{guildID = GuildID, power = Lvl}] ->
				{Gifts, RealLvl} =
					if
						Lvl =:= ?GuildMemLevel_Normal -> {Conf#guild_rewardCfg.gift3, Lvl};
						Lvl =:= ?GuildMemLevel_Admin ->
							CurNumber = guildState:getGuildRewardNumber(GuildID, Lvl),
							MaxNumber = guildLogic:getGuildLevelMaxNumber(GuildID, Lvl),
							case CurNumber < MaxNumber of
								true -> {Conf#guild_rewardCfg.gift2, Lvl};
								false -> {Conf#guild_rewardCfg.gift3, Lvl}
							end;
						Lvl =:= ?GuildMemLevel_Leader orelse Lvl =:= ?GuildMemLevel_ViceLeader ->
							CurNumber = guildState:getGuildRewardNumber(GuildID, ?GuildMemLevel_ViceLeader),
							MaxNumber =
								guildLogic:getGuildLevelMaxNumber(GuildID, ?GuildMemLevel_ViceLeader) +
									guildLogic:getGuildLevelMaxNumber(GuildID, ?GuildMemLevel_Leader),
							case CurNumber < MaxNumber of
								true -> {Conf#guild_rewardCfg.gift1, ?GuildMemLevel_ViceLeader};
								false -> {Conf#guild_rewardCfg.gift3, ?GuildMemLevel_ViceLeader}
							end;
						true ->
							{false, Lvl}
					end,
				case Gifts of
					false ->
						false;
					_ ->
						case Index =< erlang:length(Gifts) of
							true ->
								%% 计数
								guildState:incGuildRewardNumber(GuildID, RealLvl),

								%% 加这么多钱
								lists:nth(Index, Gifts);
							_ -> false
						end
				end;
			_ ->
				false
		end,
	psMgr:sendMsg2PS(PidFromGS, player_guildRewardAck, Ret),
	{noreply, State};

handle_info({agreeRecruit, PidFromGS, {GuildID, ZMRoleID, RoleID, RoleName, Career, Level}}, State) ->
	Ret = guildBase:onJoinGuild(GuildID, ZMRoleID, RoleID, RoleName, Career, Level),
	psMgr:sendMsg2PS(PidFromGS, agreeRecruitAck, {ZMRoleID, Ret, guildLogic:getGuildName(GuildID)}),
	{noreply, State};

handle_info({dealRequestJoin, PidFromGS, Msg}, State) ->
	guildBase:dealRequestJoin(PidFromGS, Msg),
	{noreply, State};

handle_info({exitGuild, PidFromGS, Msg}, State) ->
	guildBase:exitGuild(PidFromGS, Msg),
	{noreply, State};

handle_info({kickGuild, PidFromGS, Msg}, State) ->
	guildBase:kickGuild(PidFromGS, Msg),
	{noreply, State};

handle_info({giveGuildPower, PidFromGS, Msg}, State) ->
	guildBase:giveGuildPower(PidFromGS, Msg),
	{noreply, State};

handle_info({changeGuildNotice, PidFromGS, Msg}, State) ->
	guildBase:changeGuildNotice(PidFromGS, Msg),
	{noreply, State};

handle_info({changeDenoter, PidFromGS, Msg}, State) ->
	Ret = guildBase:changeDenoter(Msg),
    psMgr:sendMsg2PS(PidFromGS, changeDenoterAck, Ret),
	{noreply, State};

handle_info({changeLeader, PidFromGS, Msg}, State) ->
	guildBase:changeLeader(PidFromGS, Msg),
	{noreply, State};

handle_info({joinGuildWarBidding, PidFromGS, Msg}, State) ->
	Ret = guildWarPaid:joinGuildWarBidding(Msg),
	psMgr:sendMsg2PS(PidFromGS, joinGuildWarBiddingAck, Ret),
	{noreply, State};

handle_info({researchGuildSkill, PidFromGS, Msg}, State) ->
	Ret = guildSkill:researchGuildSkill(Msg),
	psMgr:sendMsg2PS(PidFromGS, researchGuildSkillAck, Ret),
	{noreply, State};

handle_info({oneKeyRecruit, _PidFromGS, Msg}, State) ->
	guildBase:oneKeyRecruit(Msg),
	{noreply, State};

handle_info({guildWarBattleResult, _PidFromGS, Msg}, State) ->
	?LOG_OUT("guildWarBattleResult:~p", [Msg]),
	case Msg of
		#rec_guild_war{} -> guildLogic:saveToMySql(Msg);
		#rec_guild_member{} -> guildLogic:saveToMySql(Msg)
	end,
	{noreply, State};

handle_info({gm_addguildbattlelist, _PidFromGS, ID}, State) ->
	gm_addguildbattlelist(ID),
	?LOG_OUT("gm_addguildbattlelist:~p", [ID]),
	{noreply, State};

%% 军团升级
handle_info({upgrade, FromPidGS, Data}, State) ->
    Ret = guildBase:upgrade(Data),
    psMgr:sendMsg2PS(FromPidGS, guildLevelUp, Ret),
    {noreply, State};

%% 军团商店升级
handle_info({shopUpgrade, FromPidGS, Data}, State) ->
    Ret = guildBase:shopUpgrade(Data),
    psMgr:sendMsg2PS(FromPidGS, shopUpgradeAck, Ret),
    {noreply, State};

%% 增加个人活跃度
handle_info({addPlayerLiveness, FromPidGS, Msg}, State) ->
	guildBase:addPlayerLiveness(FromPidGS, Msg),
	{noreply, State};

handle_info({applyGuildBattle, FromPidGS, Data}, State) ->
    Ret = guildBattle:applyGuildBattle(Data),
    psMgr:sendMsg2PS(FromPidGS, applyGuildBattleAck, Ret),
    {noreply,State};

%% 保存军团副本上次结束的时间
handle_info({updateLastGuildCopyOverTime, _FromPidGS, {GuildID, LastOverTime, MaxOverTime}}, State) ->
	guildBase:updateLastGuildCopyOverTime(GuildID, LastOverTime, MaxOverTime),
	{noreply, State};

%%获取要发奖的成员列表
handle_info({queryCopyMapAwardMemberList, FromPidGS, {GuildID, Plan, BossName}}, State) ->
	{AwardIDList, OtherIDList} = guildState:getGuildCopyAwardIDList(GuildID),
	psMgr:sendMsg2PS(FromPidGS, queryCopyMapAwardMemberListAck, {AwardIDList, OtherIDList, Plan, BossName}),
	{noreply, State};

handle_info({guildRankFreshSuccess, _FromPidGs, Data}, State) ->
    guildLogic:guildRankFreshSuccess(Data),
	guildState:delGuildRewardList(),
    {noreply, State};

%% 女神祈福（很多处理已经由playerGuild做好了，这里是为了新增祈福进度）
handle_info({guild_godbless, _FromPidGs, {GuildID, AddSchedule}}, State) ->
	guildBase:godBless(GuildID, AddSchedule),
    {noreply, State};

%% 每日重置
handle_info({dailyreset, _FromPidGs, _Data}, State) ->
	guildBase:resetGodBless(),
	guildLogic:maintainRide(),
	{noreply, State};

%% 设置雪人数量
handle_info({setSnowman, _FromPidGs, Data}, State) ->
	guildBase:setSnowman(Data),
    {noreply, State};

%% 重置雪人数量（所有家族
handle_info({resetSnowman, _FromPidGs, _Data}, State) ->
	guildBase:resetSnowman(),
    {noreply, State};

%% 设置快速加入的条件
handle_info({guild_fastJoin_Set, _FromPidGs, Data}, State) ->
	guildBase:fastJoin_Set(Data),
    {noreply, State};

%% 快速加入
handle_info({guild_fastJoin, _FromPidGs, Data}, State) ->
	guildBase:fastJoin(Data),
    {noreply, State};

%% 游乐场_使用设施
handle_info({guildFairground_ride, FromPidGs, Data}, State) ->
	guildLogic:useRide(FromPidGs, Data),
    {noreply, State};

%% 游乐场_设施计时消息
handle_info({guildFairground_rideTime, _FromPidGs, Data}, State) ->
	guildLogic:useRide_time(Data),
	{noreply, State};

handle_info(Info, State) ->
	?ERROR_OUT("~p ~p unhandle_info:~p", [?MODULE, self(), Info]),
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

-spec gm_addguildbattlelist(GuildID::integer()) -> ok.
gm_addguildbattlelist(89) ->
    %% 清理军团工资领取情况
    guildState:delGuildRewardList(),
    ok;
gm_addguildbattlelist(90) ->
    %% 修复军团数据
    guildLogic:repairGuildData(),
    guildState:setNextCheckGuildDataTime({time:getUTCNowSec(), 5}),
    ok;
gm_addguildbattlelist(99) ->
    %% 重启军团模块心跳
    erlang:send_after(?GuildHeartBeat, self(), tickGuildHeartBeat),
    ok;
gm_addguildbattlelist(87) ->
    %% 军团争霸-清档
    List = edb:readAllRecord(rec_guild_war_paid),
    F1 =
        fun(#rec_guild_war_paid{guildID = GuildID}) ->
            edb:deleteRecord(rec_guild_war_paid, GuildID),
            guildLogic:saveToMySql({deleteGuildWarPaid, GuildID})
        end,
    lists:foreach(F1, List),

    List2 = edb:readAllRecord(rec_guild_war),
    F2 =
        fun(#rec_guild_war{stage = Stage}) ->
            edb:deleteRecord(rec_guild_war, Stage),
            guildLogic:saveToMySql({deleteGuildWar, Stage})
        end,
    lists:foreach(F2, List2),
    ok;
gm_addguildbattlelist(88) ->
    guildWarPaid:afreshallocWarList(),
    ok.