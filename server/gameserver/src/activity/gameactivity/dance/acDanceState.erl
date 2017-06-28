%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 08. 六月 2017 19:42
%%%-------------------------------------------------------------------
-module(acDanceState).
-author(tiancheng).

-include("acDancePrivate.hrl").

%% API
%% -export([]).
-compile(export_all).

%% 跳舞tick
setTimerRef(TimerRef) ->
	put('TimerRef', TimerRef).
getTimerRef() ->
	get('TimerRef').
delTimerRef() ->
	erlang:erase('TimerRef').

%% 能否报名
setCanApply(Apply) ->
	put('CanApply', Apply).
getCanApply() ->
	get('CanApply').

%% 跳舞阶段
setDancePhase(Phase) ->
	put('DancePhase', Phase).
getDancePhase() ->
	get('DancePhase').

%% 下一次切换阶段时间
setChangePhaseTime(Time) ->
	put('ChangePhaseTime', Time).
getChangePhaseTime() ->
	get('ChangePhaseTime').

%% 当前随机舞蹈与正确ID
setRandListAndTargetID(List, ID) ->
	put('RandListAndTargetID', {List, ID}).
getRandListAndTargetID() ->
	get('RandListAndTargetID').

%% 报名字典
getDanceApply() ->
	case get('DanceApply') of
		undefined -> dict:new();
		Dict -> Dict
	end.
setDanceApply(Dict) ->
	put('DanceApply', Dict).
delDanceApply(RoleID) ->
	D = getDanceApply(),
	NewD = dict:erase(RoleID, D),
	setDanceApply(NewD).
delDanceApply() ->
	Dict = getDanceApply(),
	lists:foreach(fun(RID) -> delDanceApply(RID) end, dict:fetch_keys(Dict)),
	%% 最后删掉DICT
	erlang:erase('DanceApply').
getDanceApplyObject(RoleID) ->
	Dict = getDanceApply(),
	case dict:find(RoleID, Dict) of
		{ok, #dance_apply{} = Apply} -> Apply;
		_ -> false
	end.
putDanceApplyObject(#dance_apply{roleID = RoleID} = Apply) ->
	Dict = getDanceApply(),
	setDanceApply(dict:store(RoleID, Apply, Dict)).

%% 跳舞字典
getDanceIng() ->
	case get('DanceIng') of
		undefined -> dict:new();
		Dict -> Dict
	end.
setDanceIng(Dict) ->
	put('DanceIng', Dict).
delDanceIng(RoleID) ->
	D = getDanceIng(),
	NewD = dict:erase(RoleID, D),
	setDanceIng(NewD).
delDanceIng() ->
	Dict = getDanceIng(),
	lists:foreach(fun(RID) -> delDanceIng(RID) end, dict:fetch_keys(Dict)),
	%% 最后删掉DICT
	erlang:erase('DanceIng').
getDanceIngObject(RoleID) ->
	Dict = getDanceIng(),
	case dict:find(RoleID, Dict) of
		{ok, #dance_ing{} = Ing} -> Ing;
		_ -> false
	end.
putDanceIngObject(#dance_ing{roleID = RoleID} = Ing) ->
	Dict = getDanceIng(),
	setDanceIng(dict:store(RoleID, Ing, Dict)).