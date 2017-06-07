%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 九月 2016 10:30
%%%-------------------------------------------------------------------
-module(fightTrigger).
-author("wenshaofei").
-include("../private_logic.hrl").
%% API
-compile(export_all).
%%修改玩家pk状态
changePKState(#triggerCfg{argu = [PkState]} = Cfg, FromProgramArgs, FromCondationArgu) ->
  playerPk:fotceTranState(PkState),
  triggerLib:getSuccessReturn(Cfg, FromProgramArgs, FromCondationArgu).
