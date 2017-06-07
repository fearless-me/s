%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%% 双角色相关的每日计数
%%% 逻辑模块
%%% @end
%%% Created : 20161205
%%%-------------------------------------------------------------------
-module(daily2Logic).
-author("meitianyang").

-include("daily2Private.hrl").

-export([
	resetDaily2/0,
	saveDaily2/1
]).

%%% ====================================================================
%%% API functions
%%% ====================================================================

%% 重置每日计数
-spec resetDaily2() -> ok.
resetDaily2() ->
	%?DEBUG_OUT("[DebugForDaily2] resetDaily2"),
	daily2State:resetDaily2(),
	gsSendMsg:sendMsg2DBServer(daily2_dbreset, 0, 0),
	ok.

%% 修改每日计数
-spec saveDaily2({RoleID::uint64(), TargetRoleID::uint64(), Daily2Type::daily2TypeS()|daily2TypeC(), Count::uint64()}) -> ok.
saveDaily2({RoleID, TargetRoleID, Daily2Type, Count}) ->
	%?DEBUG_OUT("[DebugForDaily2] saveDaily2 RoleID(~p) TargetRoleID(~p) Daily2Type(~p) Count(~p)", [RoleID, TargetRoleID, Daily2Type, Count]),
	Ret = daily2State:saveDaily2(RoleID, TargetRoleID, Daily2Type, Count),
	case Ret of
		{?DBOPT_ERROR, _} ->
			skip;
		_ ->
			gsSendMsg:sendMsg2DBServer(daily2_dbsave, 0, Ret)
	end,
	ok.
