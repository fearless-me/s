%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc 目标筛选库
%%%
%%% @end
%%% Created : 05. 九月 2016 11:44
%%%-------------------------------------------------------------------
-module(targetLib).
-author("wenshaofei").
-include("gsInc.hrl").
%% API
-export([select_target/2,getSuccessReturn/2,getFailReturn/2]).

%%筛选目标
select_target([CfgID|CfgIDList], ProgromArgu)->
    CfgTarget=#targetCfg{module = Module,method = Method } = getCfg:getCfgByArgs(cfg_target,CfgID),
    ModuleAtom = list_to_atom(Module),
    MethodAtom = list_to_atom(Method),
    case ModuleAtom:MethodAtom(CfgTarget, ProgromArgu) of
       {ok,#target_success_return{fromProgromArgus = NewProgromArgu }} ->
            select_target(CfgIDList,NewProgromArgu);
        _ ->
            select_target(CfgIDList, ProgromArgu)
    end;
select_target([],NewProgromArgu)->
    NewProgromArgu.

%%获取成功返回
getSuccessReturn(#targetCfg{}=CfgTrigger,ProgromArgu)->
    {ok,#target_success_return{targetId =  CfgTrigger#targetCfg.id,fromProgromArgus = ProgromArgu }}.
%%获取失败返回
getFailReturn(#targetCfg{id=CfgID},ErrorInfo)->
    {fail,#target_fail_return{targetId =CfgID, info=ErrorInfo}}.