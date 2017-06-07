%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc条件触发器,指定条件完成之后会执行条件触发器
%%%
%%% @end
%%% Created : 05. 九月 2016 20:00
%%%-------------------------------------------------------------------
-module(triggerLib).
-author("wenshaofei").
-include("private_logic.hrl").
%% API
-export([runTrigger/3,getSuccessReturn/3,getFailReturn/2]).
%%{ok,NewCondationSuccessReturn,TriggersSuccessReturn,TriggersFailReturn}|{fail,NewCondationSuccessReturn,TriggersSuccessReturn,TriggersFailReturn}
%%此代码为触发器组逻辑，需要保留。目前看来没有价值，后期可能会有用
%%runTrigger(TriggerGroupID,Argus,ConDationToTriggerArgu)->
%%    #cfg_trigger_group{ triggerIdList =IDList } = getCfg:getCfgByArgs(cfg_trigger_group,TriggerGroupID),
%%    runTrigers(IDList,Argus,ConDationToTriggerArgu,[],[]).

runTrigger(TriggerIDList,Argus,ConDationToTriggerArgu)->
    runTrigers(TriggerIDList,Argus,ConDationToTriggerArgu,[],[]).
%%执行触发器
runTrigers([],_,_,TriggersSuccessReturn,TriggersFailReturn)->
    {ok,lists:reverse(TriggersSuccessReturn),lists:reverse(TriggersFailReturn)};
runTrigers([CfgTrigersID|IDList],Args,ConDationToTriggerArgu,TriggersSuccessReturn,TriggersFailReturn)->
    CfgTrigger=#triggerCfg{ module = Module,method = Method  } = getCfg:getCfgByArgs(cfg_trigger,CfgTrigersID),
    AtomModule = list_to_atom(Module),
    AtomMethod = list_to_atom(Method),
    case AtomModule:AtomMethod(CfgTrigger,Args,ConDationToTriggerArgu) of
        {ok, SuccessTriggerReturn=#trigger_success_return{argus=NewArgu}} ->
            NewTriggersSuccessReturn=[SuccessTriggerReturn|TriggersSuccessReturn],
            runTrigers(IDList,NewArgu,ConDationToTriggerArgu,NewTriggersSuccessReturn,TriggersFailReturn);
        {fail,FailReturn} ->
             NewFailReturn=[FailReturn|TriggersFailReturn],
            {fail,TriggersSuccessReturn,NewFailReturn};
		Error ->
			?ERROR_OUT("runTrigers Module=~p,Method=~p,CfgTrigersID=~p,Args=~p,ConDationToTriggerArgu=~p,Error=~p",
				[AtomModule, AtomMethod, CfgTrigersID, Args, ConDationToTriggerArgu, Error]),
			{fail, TriggersSuccessReturn, TriggersFailReturn}
    end.
%%runTrigers([CfgTrigersID|IDList],Args,ConDationToTriggerArgu,TriggersSuccessReturn,TriggersFailReturn)->
%%    CfgTrigger=#triggerCfg{ module = Module,method = Method  } = getCfg:getCfgByArgs(cfg_trigger,CfgTrigersID),
%%    AtomModule = list_to_atom(Module),
%%    AtomMethod = list_to_atom(Method),
%%    case runTriger(CfgTrigersID,Args,ConDationToTriggerArgu,TriggersSuccessReturn,TriggersFailReturn) of
%%         {ok,NewArgu,ConDationToTriggerArgu,NewTriggersSuccessReturn,TriggersFailReturn} ->
%%            runTrigers(IDList,NewArgu,ConDationToTriggerArgu,NewTriggersSuccessReturn,TriggersFailReturn);
%%        {fail,TriggersSuccessReturn,NewFailReturn} ->
%%            {fail,TriggersSuccessReturn,NewFailReturn}
%%    end.
%
%runTriger(CfgTrigersID,Args,ConDationToTriggerArgu,TriggersSuccessReturn,TriggersFailReturn)->
%    CfgTrigger=#triggerCfg{ module = Module,method = Method  } = getCfg:getCfgByArgs(cfg_trigger,CfgTrigersID),
%    AtomModule = list_to_atom(Module),
%    AtomMethod = list_to_atom(Method),
%    case AtomModule:AtomMethod(CfgTrigger,Args,ConDationToTriggerArgu) of
%        {ok, SuccessTriggerReturn=#trigger_success_return{argus=NewArgu}} ->
%            NewTriggersSuccessReturn=[SuccessTriggerReturn|TriggersSuccessReturn],
%            {ok,NewArgu,ConDationToTriggerArgu,NewTriggersSuccessReturn,TriggersFailReturn};
%        {fail,FailReturn} ->
%            NewFailReturn=[FailReturn|TriggersFailReturn],
%            {fail,TriggersSuccessReturn,NewFailReturn}
%    end.


getSuccessReturn(#triggerCfg{}=CfgTrigger,Argus,FromCondationArgus)->
    {ok,#trigger_success_return{triggerId = CfgTrigger#triggerCfg.id,argus = Argus,fromCondationArgus = FromCondationArgus }}.

getFailReturn(#triggerCfg{id=CfgID},ErrorInfo)->
    {fail,#trigger_fail_return{triggerId =CfgID, info=ErrorInfo}}.