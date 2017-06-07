%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc 时间条件
%%%
%%% @end
%%% Created : 06. 九月 2016 10:41
%%%-------------------------------------------------------------------
-module(timeCondition).
-author("wenshaofei").
-include("../private_logic.hrl").
%% API
-compile(export_all).
%%检查时间小于等于
currentTimeLe(_Args,#conditionCfg{argu = [HourCfg,MinCfg,SecCfg]}=Cfg)->
    CfgSec =calendar:time_to_seconds({HourCfg,MinCfg,SecCfg}),
    {_,{Hour,Min,Sec}} = calendar:local_time(),
    NowSec = calendar:time_to_seconds({Hour,Min,Sec}),
     if
         NowSec =< CfgSec ->
             conditionLib:getSuccessReturn(Cfg);
         true ->
             conditionLib:getFailReturn(Cfg)
%%             conditionLib:getSuccessReturn(Cfg)
     end.
%%检查时间大于等于
currentTimeGe(_Args,#conditionCfg{argu = [HourCfg,MinCfg,SecCfg]}=Cfg)->
    CfgSec =calendar:time_to_seconds({HourCfg,MinCfg,SecCfg}),
    {_,{Hour,Min,Sec}} = calendar:local_time(),
    NowSec = calendar:time_to_seconds({Hour,Min,Sec}),
    if
        NowSec  >= CfgSec ->
            conditionLib:getSuccessReturn(Cfg);
        true ->
            conditionLib:getFailReturn(Cfg)
%%            conditionLib:getSuccessReturn(Cfg)
    end.


currentTimeL(_Args,#conditionCfg{argu = [HourCfg,MinCfg,SecCfg]}=Cfg)->
    CfgSec =calendar:time_to_seconds({HourCfg,MinCfg,SecCfg}),
    {_,{Hour,Min,Sec}} = calendar:local_time(),
    NowSec = calendar:time_to_seconds({Hour,Min,Sec}),
    if
        NowSec <   CfgSec ->
            conditionLib:getSuccessReturn(Cfg);
        true ->
            conditionLib:getFailReturn(Cfg)
%%            conditionLib:getSuccessReturn(Cfg)
    end.
%%检查时间大于等于
currentTimeG(_Args,#conditionCfg{argu = [HourCfg,MinCfg,SecCfg]}=Cfg)->
    CfgSec =calendar:time_to_seconds({HourCfg,MinCfg,SecCfg}),
    {_,{Hour,Min,Sec}} = calendar:local_time(),
    NowSec = calendar:time_to_seconds({Hour,Min,Sec}),
    if
         NowSec > CfgSec ->
            conditionLib:getSuccessReturn(Cfg);
        true ->
            conditionLib:getFailReturn(Cfg)
%%            conditionLib:getSuccessReturn(Cfg)
    end.