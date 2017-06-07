%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc乱世为王战场触发器模块
%%%
%%% @end
%%% Created : 21. 九月 2016 11:00
%%%-------------------------------------------------------------------
-module(acLSBattlefieldCondition).
-author("wenshaofei").

-include("../../activityPrivate.hrl").
-include("../activityPhaseDefine.hrl").
-include("acLSBattlefieldPrivate.hrl").
-compile(export_all).

%%校验排名是否大于等于指定的值
rankLe(ProgramArgs, #conditionCfg{argu = [ScoreValueCfg]} = Cfg) ->
	{ok, #rec_base_role{roleID = ID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgramArgs),
	{ok,CurrentRank} = acLSBattlefieldLogic:getRankByRoleID(ID),
	if
		CurrentRank =< ScoreValueCfg ->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)
	end.

rankGe(ProgramArgs,#conditionCfg{argu = [ScoreValueCfg]}=Cfg)->
	{ok,#rec_base_role{roleID = ID}}=logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE,ProgramArgs),
	{ok,CurrentRank} = acLSBattlefieldLogic:getRankByRoleID(ID),
	if
		CurrentRank >=  ScoreValueCfg->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)
	end.


%%校验分数是否大于等于指定的值
scoreLe(ProgramArgs,#conditionCfg{argu = [ScoreValueCfg]}=Cfg)->
	{ok,#rec_base_role{roleID = ID}}=logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE,ProgramArgs),
	CurrentScore = acLSBattlefieldLogic:getScoreByRoleID(ID),
	if
		CurrentScore =<  ScoreValueCfg->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)
	end.

scoreGe(ProgramArgs,#conditionCfg{argu = [ScoreValueCfg]}=Cfg)->
	{ok,#rec_base_role{roleID = ID}}=logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE,ProgramArgs),
	CurrentScore = acLSBattlefieldLogic:getScoreByRoleID(ID),
	if
		CurrentScore >=  ScoreValueCfg->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)
	end.
%%累计杀人次数校验
killPlayerNumberGe(ProgramArgs,#conditionCfg{argu = [ValueCfg]}=Cfg)->
	{ok,#rec_base_role{roleID = ID}}=logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE,ProgramArgs),
	CurrentValue = acLSBattlefieldLogic:getKillPlayerNumber(ID),
	if
		CurrentValue >=  ValueCfg->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)
	end.

killPlayerNumberLe(ProgramArgs,#conditionCfg{argu = [ValueCfg]}=Cfg)->
	{ok,#rec_base_role{roleID = ID}}=logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE,ProgramArgs),
	CurrentValue = acLSBattlefieldLogic:getKillPlayerNumber(ID),
	if
		CurrentValue =<  ValueCfg->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)
	end.
%%连杀次数
disposableKillPlayerNumberGe(ProgramArgs,#conditionCfg{argu = [ValueCfg]}=Cfg)->
	{ok,#rec_base_role{roleID = ID}}=logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE,ProgramArgs),
	CurrentValue = acLSBattlefieldLogic:getDisposableKillNumber(ID),
	if
		CurrentValue =<  ValueCfg->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)
	end.

disposableKillPlayerNumberLe(ProgramArgs,#conditionCfg{argu = [ValueCfg]}=Cfg)->
	{ok,#rec_base_role{roleID = ID}}=logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE,ProgramArgs),
	CurrentValue = acLSBattlefieldLogic:getDisposableKillNumber(ID),
	if
		CurrentValue >= ValueCfg->
			conditionLib:getSuccessReturn(Cfg);
		true ->
			conditionLib:getFailReturn(Cfg)
	end.
%%在复仇列表内
inRevengeList(ProgramArgs,#conditionCfg{}=Cfg)->
	{ok,[_,KillTargetID]}=logicLib:getLogicArguValue(?LK_KILL_TARGET_TYPE_ID,ProgramArgs),
	{ok,#rec_base_role{roleID = ID}}=logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE,ProgramArgs),

	case  acLSBattlefieldLogic:getLSRoleData(ID) of
		{ok, #recLSMemberInfo{ revenge_list= [KillTargetID]}} ->
			conditionLib:getSuccessReturn(Cfg);
		_R ->
	
			conditionLib:getFailReturn(Cfg)
	end.
