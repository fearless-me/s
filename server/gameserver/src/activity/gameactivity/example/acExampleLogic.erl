%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, 好玩一二三
%%% @doc
%%% 活动逻辑模块
%%% @end
%%% Created : 06. 二月 2015 14:32
%%%-------------------------------------------------------------------
-module(acExampleLogic).
-author("tiancheng").

-include("../../activityPrivate.hrl").
-include("../activityPhaseDefine.hrl").
-include("acExamplePrivate.hrl").

%% API
-export([
	activityChangeCallBack/1,
	activityMapMsg/2
]).

%% 主活动模块进程回调
-spec activityChangeCallBack(Phase::uint()) -> ok.
activityChangeCallBack(?ActivityPhase_Close) ->
	%% 结束
	ok;
activityChangeCallBack(?ActivityPhase_Example_1) ->
	%% 结束
	ok;
activityChangeCallBack(Phase) ->
	?ERROR_OUT("~p ~p activityChangeCallBack:~p", [?MODULE, self(), Phase]),
	ok.

%% 活动地图的消息
-spec activityMapMsg(MsgType::uint(), Data::term()) -> ok.
activityMapMsg(_MsgType, _Data) ->
	ok.