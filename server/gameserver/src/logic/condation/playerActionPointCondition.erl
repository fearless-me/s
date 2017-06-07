%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc用户体力值条件系统
%%%
%%% @end
%%% Created : 13. 十月 2016 10:57
%%%-------------------------------------------------------------------
-module(playerActionPointCondition).
-author("wenshaofei").

-include("../private_logic.hrl").
%% API
-compile(export_all).
%%体力点数小于等于
playerActionPointLe(_Args,  #conditionCfg{argu = [CfgActionPoint]}=Cfg)->
  ActionPoint=playerActionPoint:getActionPoint(),
  if
    (ActionPoint =< CfgActionPoint)  ->
      conditionLib:getSuccessReturn(Cfg);
    true ->
      conditionLib:getFailReturn(Cfg)
  end.
%%体力点数小于
playerActionPointL(_Args,  #conditionCfg{argu = [CfgActionPoint]}=Cfg)->
  ActionPoint=playerActionPoint:getActionPoint(),
  if
    (ActionPoint < CfgActionPoint)  ->
      conditionLib:getSuccessReturn(Cfg);
    true ->
      conditionLib:getFailReturn(Cfg)
  end.

%%体力点数小于等于
playerActionPointGe(_Args,  #conditionCfg{argu = [CfgActionPoint]}=Cfg)->
  ActionPoint=playerActionPoint:getActionPoint(),
  if
    (ActionPoint >= CfgActionPoint)  ->
      conditionLib:getSuccessReturn(Cfg);
    true ->
      conditionLib:getFailReturn(Cfg)
  end.
%%体力点数小于
playerActionPointG(_Args,  #conditionCfg{argu = [CfgActionPoint]}=Cfg)->
  ActionPoint=playerActionPoint:getActionPoint(),
  if
    (ActionPoint > CfgActionPoint)  ->
      conditionLib:getSuccessReturn(Cfg);
    true ->
      conditionLib:getFailReturn(Cfg)
  end.