%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc 玩家体力值触发器
%%%
%%% @end
%%% Created : 06. 九月 2016 11:55
%%%-------------------------------------------------------------------
-module(playerActionPointTrigger).
-author("wenshaofei").
-include("../private_logic.hrl").
%% API
-compile(export_all).
%%扣除体力值
deductActionPoint(#triggerCfg{argu = [DeductValue]} = Cfg, FromProgramArgs, FromCondationArgu) ->
  playerActionPoint:deductActionPoint(DeductValue),
  triggerLib:getSuccessReturn(Cfg, FromProgramArgs, FromCondationArgu).
%%增加体力值
addActionPoint(#triggerCfg{argu = [AddValue]} = Cfg, FromProgramArgs, FromCondationArgu) ->
  playerActionPoint:addActionPoint(AddValue),
  triggerLib:getSuccessReturn(Cfg, FromProgramArgs, FromCondationArgu).