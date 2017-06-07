%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 九月 2016 10:30
%%%-------------------------------------------------------------------
-module(activeTrigger).
-author("wenshaofei").
-include("../private_logic.hrl").
%% API
-compile(export_all).
%%%%通过配置文件修改活动状态、该函数会触发整个活动流程包含给客户端所有用进行消息广播、
%%%% 如果活动的所有状态改变，只有一部分用户关系的话。请不要使用该函数
%%changeActiveStateByCfgArgu(#triggerCfg{argu = [ActivityType,State]}=Cfg, FromProgramArgs,FromCondationArgu)->
%%    psMgr:sendMsg2PS(?PsNameActivity, setActivePhase, {ActivityType,State}),
%%    triggerLib:getSuccessReturn(Cfg, FromProgramArgs,FromCondationArgu).