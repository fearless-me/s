%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc 实现玩家数据条件校验的业务逻辑
%%%
%%% @end
%%% Created : 06. 九月 2016 10:41
%%%-------------------------------------------------------------------
-module(fightCondation).
-author("wenshaofei").
-include("../private_logic.hrl").
%% API
-compile(export_all).
%%被击杀者类型检查
verifyKillTargetedType(ProgramArgs,#conditionCfg{argu = TargetTypes}=Cfg)->
    {ok,[Type,_ID]}=logicLib:getLogicArguValue(?LK_KILL_TARGET_TYPE_ID,ProgramArgs),
    case lists:member(Type,TargetTypes) of
        true -> conditionLib:getSuccessReturn(Cfg);
        _ ->
            conditionLib:getFailReturn(Cfg)
    end.

%%被击杀者ID检查
verifyKillTargetedID(ProgramArgs,#conditionCfg{argu = TargetIDs}=Cfg)->
    {ok,[_Type,ID]}=logicLib:getLogicArguValue(?LK_KILL_TARGET_TYPE_ID,ProgramArgs),
    case lists:member(ID,TargetIDs) of
        true -> conditionLib:getSuccessReturn(Cfg);
        _ ->
            conditionLib:getFailReturn(Cfg)
    end.