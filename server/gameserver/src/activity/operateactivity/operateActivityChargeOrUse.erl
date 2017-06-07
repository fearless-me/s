%% @author zhengzhichun
%% @doc @todo Add description to operateActivityChargeOrUse.


-module(operateActivityChargeOrUse).
-include("operateActivityPrivate.hrl").


%% API
-export([
	init/0,
	startAct/1,
	closeAct/1,
	addAct/1,
	updateAct/2,
	executeAc/2,
	tick/1

]).

-spec init() -> ok.
init() ->
	operateActivityLogic:addActHandler(?OperateActType_DiamonCharge,?MODULE),
	operateActivityLogic:addActHandler(?OperateActType_DiamonUse,?MODULE).

-spec startAct(#rec_operate_activity{}) -> #rec_operate_activity{}.
startAct(#rec_operate_activity{} = RecAC) ->
	RecAC.

-spec closeAct(#rec_operate_activity{}) -> #rec_operate_activity{}.
closeAct(#rec_operate_activity{} = RecAC) ->
	RecAC.

-spec addAct(#rec_operate_activity{}) -> #rec_operate_activity{}.
addAct(#rec_operate_activity{} = Ac) ->
		%%全服在线玩家广播netMsg
	Msg = #pk_GS2U_IconLight{
		id = 1,%%充值活动
		light = true
	},
	core:boardcastAllGSNetMsg(Msg),
	Ac.
	
-spec updateAct(#rec_operate_activity{}, #rec_operate_activity{}) -> #rec_operate_activity{}.
updateAct(#rec_operate_activity{} = Ac, #rec_operate_activity{} = OldAc) ->
	NewAc = OldAc#rec_operate_activity{
		name = Ac#rec_operate_activity.name,
		endtime = Ac#rec_operate_activity.endtime,
		minlevel = Ac#rec_operate_activity.minlevel,
		maxlevel = Ac#rec_operate_activity.maxlevel
	},
	NewAc.

executeAc(#rec_operate_activity{id = _AcID, arg1 = _L}, #recOperateActivityArg{arg=NewData} = _AcArg) ->
	operateActivityLogic:saveAcData(NewData).

-spec tick(#rec_operate_activity{}) -> #rec_operate_activity{}.
tick(#rec_operate_activity{} = RecAC) ->
	RecAC.
