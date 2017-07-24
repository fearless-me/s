%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 五月 2017 14:42
%%%-------------------------------------------------------------------
-module(teamOtp).
-author("Administrator").


-include("setup.hrl").
-include("gsInc.hrl").


%% ====================================================================
%% API functions
%% ====================================================================
-export([
	start_link/0
]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3,handle_exception/3]).

start_link() ->
	myGenServer:start_link({local, ?MODULE}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

init(_Param) ->
	ets:new(?Ets_TeamList, [protected, named_table, {keypos, #recTeamInfo.teamID},{read_concurrency, true}]),	%% 队伍信息
	ets:new(?Ets_RoleIDRefTeamID, [protected, named_table, {keypos, #recRoleRefTeamID.roleID},{read_concurrency, true}]),	%% 队伍信息
	ets:new(?Ets_RoleMatchTeam, [protected, named_table, {keypos, #recRoleMatchTeam.roleID},{read_concurrency, true}]),	%% 队伍信息
	teamLogic:tickMsg(),
	?LOG_OUT("[~p] init ok",[self()]),
	{ok,{}}.

handle_info({createTeam, _FromPid, Msg},State) ->
	teamLogic:createNewTeam(Msg),
	{noreply,State};
handle_info({dimissTeam, _FromPid, Msg},State) ->
	teamLogic:dismissTeam(Msg),
	{noreply,State};
handle_info({joinTeam, _FromPid, Msg},State) ->
	teamLogic:joinTeam(Msg),
	{noreply,State};
handle_info({matchTeam, _FromPid, Msg},State) ->
	teamLogic:matchTeam(Msg),
	{noreply,State};
handle_info({cancelMatchTeam, _FromPid, Msg},State) ->
	teamLogic:cancelMatchTeam( Msg ),
	{noreply,State};
handle_info({leaveTeam, _FromPid, Msg},State) ->
	teamLogic:leaveTeam(Msg),
	{noreply,State};
handle_info({leaveTeamAndEnter, _FromPid, Msg},State) ->
	teamLogic:leaveTeamAndEnter(Msg),
	{noreply,State};

handle_info({kickMember, _FromPid, Msg},State) ->
	teamLogic:kickMember(Msg),
	{noreply,State};
handle_info({changeLeader, _FromPid, Msg},State) ->
	teamLogic:changeLeader(Msg),
	{noreply,State};
handle_info({leaderOffline, _FromPid, Msg},State) ->
	teamLogic:leaderOffline(Msg),
	{noreply,State};
handle_info({changeTargetMapID, _FromPid, Msg},State) ->
	teamLogic:changeTargetMap(Msg),
	{noreply,State};
handle_info({leaderStartCopymap, _FromPid, Msg},State) ->
	teamLogic:leaderStartCopyMap(Msg),
	{noreply,State};
handle_info({memberStartCopymapAck, _FromPid, Msg},State) ->
	teamLogic:memberStartCopyMapAck(Msg),
	{noreply,State};
handle_info({setSearchFlag, _FromPid, Msg},State) ->
	teamLogic:setSearchFlag(Msg),
	{noreply,State};
handle_info({updateMemberInfo, _FromPid, Msg},State) ->
	teamLogic:updateMemberInfo(Msg),
	{noreply,State};
handle_info({assistCopyMapStart, _FromPid, Msg},State) ->
	teamLogic:assistCopyMapStart(Msg),
	{noreply,State};
handle_info({assistCopyMapCancel, _FromPid, Msg},State) ->
	teamLogic:assistCopyMapCancel(Msg),
	{noreply,State};
handle_info(tick,State) ->
	teamLogic:tick(),
	{noreply,State};
handle_info(Info,State) ->
	?ERROR_OUT("unhandle msg:~w",[Info]),
	{noreply,State}.

handle_call(_Request, _From, State) ->
	{noreply, State}.

handle_cast(_Msg, State) ->
	{noreply, State}.

terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).