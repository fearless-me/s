%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc 实现玩家数据条件校验的业务逻辑
%%%
%%% @end
%%% Created : 06. 九月 2016 10:41
%%%-------------------------------------------------------------------
-module(activeCondition).
-author("wenshaofei").
-include("../private_logic.hrl").
%% API
-compile(export_all).
%%判断活动状态是否在配置的状态列表内
activeStateInCfgArgu(_Args,#conditionCfg{argu = [ActiveID,StateList]}=Cfg)->
   case activityLogic:getActivePhase(ActiveID) of 
	    {ok,State} ->
		    case lists:member(State,StateList) of
		        true ->
		             conditionLib:getSuccessReturn(Cfg);
		         _->
		             conditionLib:getFailReturn(Cfg)
		     end;
	   _->
		    conditionLib:getFailReturn(Cfg)
   end.