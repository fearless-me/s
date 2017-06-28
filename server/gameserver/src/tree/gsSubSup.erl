%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 25. 八月 2015 17:32
%%%-------------------------------------------------------------------

-module(gsSubSup).
-author("ZhongYuanWei").

-behaviour(supervisor).

-include("gsInc.hrl").

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%%===================================================================
%%% API functions
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the supervisor
%%
%% @end
%%--------------------------------------------------------------------
-spec(start_link() ->
	{ok, Pid :: pid()} | ignore | {error, Reason :: term()}).
start_link() ->
	supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Whenever a supervisor is started using supervisor:start_link/[2,3],
%% this function is called by the new process to find out about
%% restart strategy, maximum restart frequency and child
%% specifications.
%%
%% @end
%%--------------------------------------------------------------------
-spec(init(Args :: term()) ->
	{ok, {SupFlags :: {RestartStrategy :: supervisor:strategy(),
		MaxR :: non_neg_integer(), MaxT :: non_neg_integer()},
		[ChildSpec :: supervisor:child_spec()]
	}} |
	ignore |
	{error, Reason :: term()}).
init([]) ->
	case core:isCross() of
		true ->
			intCrossServer();
		_ ->
			initNormalServer()
	end.
	

%%%===================================================================
%%% Internal functions
%%%===================================================================

initNormalServer()->
	try
		%%玩家管理进程
		PlayerMgr = {
			playerMgrOtp,
			{playerMgrOtp, start_link, []},
			permanent,
			2000,
			supervisor,
			[playerMgrOtp]
		},

		%%分组管理进程
		GroupMgr = {
			groupOtp,
			{groupOtp, start_link, []},
			permanent,
			2000,
			worker,
			[groupOtp]
		},



		%%队伍进程
		Team = {
			teamOtp,
			{teamOtp, start_link, []},
			permanent,
			2000,
			worker,
			[teamOtp]
		},

		%%天梯1v1竞技场
		Ladder1v1Otp = {
			ladder1v1Otp,
			{ladder1v1Otp, start_link, []},
			permanent,
			2000,
			worker,
			[ladder1v1Otp]
		},

		%% 活动进程
		ActivityMgr = {
			?PsNameActivityMgr,
			{activityMgrOtp, start_link, []},
			permanent,
			2000,
			worker,
			[?PsNameActivityMgr]
		},

		%% 运营活动进程
		OperateActivity = {
			operateActivityOtp,
			{operateActivityOtp, start_link, []},
			permanent,
			2000,
			worker,
			[operateActivityOtp]
		},

		%% 运营活动进程
		OperateExchange = {
			operateExchangeOtp,
			{operateExchangeOtp, start_link, []},
			permanent,
			2000,
			worker,
			[operateExchangeOtp]
		},

		%地图监督进程
		GameMapSup = {
			gameMapSup,                         			    	% Id       = internal id
			{gameMapSup, start_link, []},							% StartFun = {M, F, A}
			permanent,                               				% Restart  = permanent | transient | temporary
			2000,                                    				% Shutdown = brutal_kill | int() >= 0 | infinity
			supervisor,                                  			% Type     = worker | supervisor
			[gameMapSup]                           				% Modules  = [Module] | dynamic
		},

		%普通地图管理器
		NormalMapMgr = {
			?PSNameNormalMapMgr,                         			% Id       = internal id
			{gameMapMgrOtp, start_link, [?PSNameNormalMapMgr]},	    % StartFun = {M, F, A}
			permanent,                               				% Restart  = permanent | transient | temporary
			2000,                                    				% Shutdown = brutal_kill | int() >= 0 | infinity
			worker,                                  				% Type     = worker | supervisor
			[gameMapMgrOtp]                           			    % Modules  = [Module] | dynamic
		},

		%%副本地图管理器
		CopyMapMgr = {
			?PSNameCopyMapMgr,                         				% Id       = internal id
			{gameMapMgrOtp, start_link, [?PSNameCopyMapMgr]},	    % StartFun = {M, F, A}
			permanent,                               				% Restart  = permanent | transient | temporary
			2000,                                    				% Shutdown = brutal_kill | int() >= 0 | infinity
			worker,                                  				% Type     = worker | supervisor
			[gameMapMgrOtp]                           			    % Modules  = [Module] | dynamic
		},

		%%talkdata专用请求otp
		TalkdataOtp = {
			talkdataOtp,
			{talkdataOtp, start_link, []},
			permanent,
			infinity,
			worker,
			[talkdataOtp]
		},

		%%红包进程
		RedEnvelopeOtp = {
			redEnvelopeOtp,
			{redEnvelopeOtp, start_link, []},
			permanent,
			2000,
			worker,
			[redEnvelopeOtp]
		},

		%% 双角色相关的每日计数
		Daily2 = {
			?PsNameDaily2,
			{?PsNameDaily2, start_link, []},
			permanent,
			2000,
			worker,
			[?PsNameDaily2]
		},

		%% 姻缘系统进程
		Marriage = {
			?PsNameMarriage,
			{?PsNameMarriage, start_link, []},
			permanent,
			2000,
			worker,
			[?PsNameMarriage]
		},

		%% 好友系统进程
		Friend2 = {
			?PsNameFriend2,
			{?PsNameFriend2, start_link, []},
			permanent,
			2000,
			worker,
			[?PsNameFriend2]
		},
		Friend2LBS = {
			?PsNameFriend2LBS,
			{?PsNameFriend2LBS, start_link, []},
			permanent,
			2000,
			worker,
			[?PsNameFriend2LBS]
		},

		%% 身份证系统进程
		Identity = {
			?PsNameIdentity,
			{?PsNameIdentity, start_link, []},
			permanent,
			2000,
			worker,
			[?PsNameIdentity]
		},

		%% 活动进程
		Activity = {
			?PsNameActivity,
			{?PsNameActivity, start_link, []},
			permanent,
			2000,
			worker,
			[?PsNameActivity]
		},

		%% 奖励领取判定
		Award = {awardTakenOtp,                         		% Id       = internal id
			{awardTakenOtp, start_link, []},			        % StartFun = {M, F, A}
			permanent,                               			% Restart  = permanent | transient | temporary
			2000,                                    			% Shutdown = brutal_kill | int() >= 0 | infinity
			worker,                                  			% Type     = worker | supervisor
			[awardTakenOtp]                           			% Modules  = [Module] | dynamic
		},

		%% 本大区玩家预充值返回处理（其他服可关掉)
		PreRecharge = {
			preRechargeOtp,
			{preRechargeOtp, start_link, []},
			permanent,
			2000,
			worker,
			[preRechargeOtp]
		},

		%% 本大区玩家充值
		Recharge = {
			rechargeOtp,
			{rechargeOtp, start_link, []},
			permanent,
			2000,
			worker,
			[rechargeOtp]
		},

		%% 排行榜进程
		Rank = {
			rankOtp,
			{rankOtp, start_link, []},
			permanent,
			2000,
			worker,
			[rankOtp]
		},

		%%商城进程
		Mall = {
			mallOtp,
			{mallOtp, start_link, []},
			permanent,
			2000,
			worker,
			[mallOtp]
		},

		%交易行处理进程
		Trade = {tradeDataOpOtp,                         			% Id       = internal id
			{tradeDataOpOtp, start_link, []},			            % StartFun = {M, F, A}
			permanent,                               				% Restart  = permanent | transient | temporary
			2000,                                    				% Shutdown = brutal_kill | int() >= 0 | infinity
			worker,                                  				% Type     = worker | supervisor
			[tradeDataOpOtp]                           				% Modules  = [Module] | dynamic
		},

		%%邮件进程
		Mail = {
			mailOtp,
			{mailOtp, start_link, []},
			permanent,
			2000,
			worker,
			[mailOtp]
		},


		%% 公会进程
		Guild = {
			guildOtp,
			{guildOtp, start_link, []},
			permanent,
			2000,
			worker,
			[guildOtp]
		},

		%%
		RubbishCleaner  = {
			rubbishCleanerOtp,
			{rubbishCleanerOtp, start_link, []},
			permanent,
			2000,
			worker,
			[rubbishCleanerOtp]
		},

		timer:sleep(1000),
		Port = config:getInt("ListenToUserPort", 6789),
		ClientOtpOption = #listenTcpOptions{port = Port,packetLen = 4, listenDelay = 0,isSendSessionKey = false},
		%%最后打开针对客户端网络的服务
		NetServerSup = {
			socketSup,
			{socketSup, start_link, [usrOtpHandler,ClientOtpOption]},
			permanent,
			infinity,
			supervisor,
			[socketSup]
		},
		RestartStrategy = one_for_one,
		MaxRestarts = 1000,
		MaxSecondsBetweenRestarts = 3600,

		SupFlags = {RestartStrategy, MaxRestarts, MaxSecondsBetweenRestarts},

		{ok,
			{SupFlags,
				[
					PlayerMgr,
					GroupMgr,

					Team,
					Ladder1v1Otp,
					OperateExchange,
					GameMapSup,
					NormalMapMgr,
					CopyMapMgr,
					TalkdataOtp,
					RedEnvelopeOtp,

					Guild,
					Mail,
					Daily2,
					Marriage,
					Friend2,
					Friend2LBS,
					Identity,
					Activity,
					ActivityMgr,
					OperateActivity,
					Award,
					PreRecharge,
					Recharge,
					Rank,
					Mall,
					Trade,
					RubbishCleaner,

					NetServerSup
				]
			}
		}
	catch
		_:Why ->
			?ERROR_OUT( "Exception Module:[~p] Why[~p] stack[~p]",
				[?MODULE,Why, erlang:get_stacktrace()] ),
			{stop,[Why,erlang:get_stacktrace()]}
	end.

intCrossServer() ->
	try
		
		%%天梯1v1竞技场
		Ladder1v1Otp = {
			ladder1v1Otp,
			{ladder1v1Otp, start_link, []},
			permanent,
			2000,
			worker,
			[ladder1v1Otp]
		},

		%地图监督进程
		GameMapSup = {
			gameMapSup,                         			    	% Id       = internal id
			{gameMapSup, start_link, []},							% StartFun = {M, F, A}
			permanent,                               				% Restart  = permanent | transient | temporary
			2000,                                    				% Shutdown = brutal_kill | int() >= 0 | infinity
			supervisor,                                  			% Type     = worker | supervisor
			[gameMapSup]                           				% Modules  = [Module] | dynamic
		},

		%普通地图管理器
		NormalMapMgr = {
			?PSNameNormalMapMgr,                         			% Id       = internal id
			{gameMapMgrOtp, start_link, [?PSNameNormalMapMgr]},	    % StartFun = {M, F, A}
			permanent,                               				% Restart  = permanent | transient | temporary
			2000,                                    				% Shutdown = brutal_kill | int() >= 0 | infinity
			worker,                                  				% Type     = worker | supervisor
			[gameMapMgrOtp]                           			    % Modules  = [Module] | dynamic
		},

		%%副本地图管理器
		CopyMapMgr = {
			?PSNameCopyMapMgr,                         				% Id       = internal id
			{gameMapMgrOtp, start_link, [?PSNameCopyMapMgr]},	    % StartFun = {M, F, A}
			permanent,                               				% Restart  = permanent | transient | temporary
			2000,                                    				% Shutdown = brutal_kill | int() >= 0 | infinity
			worker,                                  				% Type     = worker | supervisor
			[gameMapMgrOtp]                           			    % Modules  = [Module] | dynamic
		},

		%%% mainPID进程
		%Main = {
		%	gsMainOtp,                         					% Id       = internal id
		%	{gsMainOtp, start_link, []},						% StartFun = {M, F, A}
		%	permanent,                               			% Restart  = permanent | transient | temporary
		%	2000,                                    			% Shutdown = brutal_kill | int() >= 0 | infinity
		%	worker,                                  			% Type     = worker | supervisor
		%	[gsMainOtp]                           				% Modules  = [Module] | dynamic
		%},

		%% 混沌战场
		HdBattle = {
			hdBattleOtp,
			{hdBattleOtp, start_link, []},
			permanent,
			2000,
			worker,
			[hdBattleOtp]
		},

		%% 跨服竞技场
		CrosArenaBattle = {
			arenaBattleOtp,
			{arenaBattleOtp, start_link, []},
			permanent,
			2000,
			worker,
			[arenaBattleOtp]
		},

		%%玩家管理进程
		PlayerMgr = {
			playerMgrOtp,
			{playerMgrOtp, start_link, []},
			permanent,
			2000,
			supervisor,
			[playerMgrOtp]
		},

		%%分组管理进程
		GroupMgr = {
			groupOtp,
			{groupOtp, start_link, []},
			permanent,
			2000,
			worker,
			[groupOtp]
		},

		%%队伍进程
		Team = {
			teamOtp,
			{teamOtp, start_link, []},
			permanent,
			2000,
			worker,
			[teamOtp]
		},

		%%talkdata专用请求otp
		TalkdataOtp = {
			talkdataOtp,
			{talkdataOtp, start_link, []},
			permanent,
			infinity,
			worker,
			[talkdataOtp]
		},


		%%%红包进程
		%RedEnvelopeOtp = {
		%	redEnvelopeOtp,
		%	{redEnvelopeOtp, start_link, []},
		%	permanent,
		%	2000,
		%	worker,
		%	[redEnvelopeOtp]
		%},

		%% 双角色相关的每日计数
		Daily2 = {
			?PsNameDaily2,
			{?PsNameDaily2, start_link, []},
			permanent,
			2000,
			worker,
			[?PsNameDaily2]
		},

		%% 姻缘系统进程
		Marriage = {
			?PsNameMarriage,
			{?PsNameMarriage, start_link, []},
			permanent,
			2000,
			worker,
			[?PsNameMarriage]
		},

		%% 好友系统进程
		Friend2 = {
			?PsNameFriend2,
			{?PsNameFriend2, start_link, []},
			permanent,
			2000,
			worker,
			[?PsNameFriend2]
		},
		Friend2LBS = {
			?PsNameFriend2LBS,
			{?PsNameFriend2LBS, start_link, []},
			permanent,
			2000,
			worker,
			[?PsNameFriend2LBS]
		},

		%% 身份证系统进程
		Identity = {
			?PsNameIdentity,
			{?PsNameIdentity, start_link, []},
			permanent,
			2000,
			worker,
			[?PsNameIdentity]
		},

		%% 活动进程
		Activity = {
			?PsNameActivity,
			{?PsNameActivity, start_link, []},
			permanent,
			2000,
			worker,
			[?PsNameActivity]
		},

		%% 活动进程
		ActivityMgr = {
			?PsNameActivityMgr,
			{activityMgrOtp, start_link, []},
			permanent,
			2000,
			worker,
			[?PsNameActivityMgr]
		},

		%% 运营活动进程
		OperateActivity = {
			operateActivityOtp,
			{operateActivityOtp, start_link, []},
			permanent,
			2000,
			worker,
			[operateActivityOtp]
		},

		%% 奖励领取判定
		Award = {awardTakenOtp,                         		% Id       = internal id
			{awardTakenOtp, start_link, []},			        % StartFun = {M, F, A}
			permanent,                               			% Restart  = permanent | transient | temporary
			2000,                                    			% Shutdown = brutal_kill | int() >= 0 | infinity
			worker,                                  			% Type     = worker | supervisor
			[awardTakenOtp]                           			% Modules  = [Module] | dynamic
		},

		%% 本大区玩家预充值返回处理（其他服可关掉)
		PreRecharge = {
			preRechargeOtp,
			{preRechargeOtp, start_link, []},
			permanent,
			2000,
			worker,
			[preRechargeOtp]
		},

		%% 本大区玩家充值
		Recharge = {
			rechargeOtp,
			{rechargeOtp, start_link, []},
			permanent,
			2000,
			worker,
			[rechargeOtp]
		},

		%% 排行榜进程
		Rank = {
			rankOtp,
			{rankOtp, start_link, []},
			permanent,
			2000,
			worker,
			[rankOtp]
		},

		%%商城进程
		Mall = {
			mallOtp,
			{mallOtp, start_link, []},
			permanent,
			2000,
			worker,
			[mallOtp]
		},

		%交易行处理进程
		Trade = {tradeDataOpOtp,                         			% Id       = internal id
			{tradeDataOpOtp, start_link, []},			            % StartFun = {M, F, A}
			permanent,                               				% Restart  = permanent | transient | temporary
			2000,                                    				% Shutdown = brutal_kill | int() >= 0 | infinity
			worker,                                  				% Type     = worker | supervisor
			[tradeDataOpOtp]                           				% Modules  = [Module] | dynamic
		},

		%%邮件进程
		Mail = {
			mailOtp,
			{mailOtp, start_link, []},
			permanent,
			2000,
			worker,
			[mailOtp]
		},


		%% 公会进程
		Guild = {
			guildOtp,
			{guildOtp, start_link, []},
			permanent,
			2000,
			worker,
			[guildOtp]
		},
	
		RestartStrategy = one_for_one,
		MaxRestarts = 1000,
		MaxSecondsBetweenRestarts = 3600,

		SupFlags = {RestartStrategy, MaxRestarts, MaxSecondsBetweenRestarts},
	
		{ok,
			{
				SupFlags,
				[
					GroupMgr,
					Ladder1v1Otp,
					ActivityMgr,
					PlayerMgr,
					GameMapSup,
					NormalMapMgr,
					CopyMapMgr,
					HdBattle,
					CrosArenaBattle,
					Team,
					TalkdataOtp,

					Guild,
					Mail,
					Daily2,
					Marriage,
					Friend2,
					Friend2LBS,
					Identity,
					Activity,
					OperateActivity,
					Award,
					PreRecharge,
					Recharge,
					Rank,
					Mall,
					Trade
				]
			}
		}
	catch
		_:Why ->
			?ERROR_OUT( "Exception Module:[~p] Why[~p] stack[~p]",
				[?MODULE,Why, erlang:get_stacktrace()] ),
			{stop,[Why,erlang:get_stacktrace()]}
	end.
