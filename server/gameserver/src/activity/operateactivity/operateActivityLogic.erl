%%%-------------------------------------------------------------------
%%% @author luowei
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 运营活动
%%% @end
%%% Created : 28. 五月 2015 14:26
%%%-------------------------------------------------------------------
-module(operateActivityLogic).
-author("luowei").

-define(UpdateAcOK, 	   0).			%% 更新成功
-define(UpdateAcError1,   -100).		%% 活动关闭,更新失败
-include("operateActivityPrivate.hrl").

%% API
-export([
	init/0,
	tick/0,
	update/3,
	execute/2,

	getAc/1,
	saveAc/1,
	getAcData/2,
	saveAcData/1
]).

-export([
	addActHandler/2,
	getActHandler/1
]).

%% 初始化
-spec init() -> ok.
init() ->
	registerAct(),
	erlang:send_after(?OperateActivityModuleTick, self(), ?OperateActivityModuleTickMsg),
	ok.


tick() ->
	AcList = edb:readAllRecord(rec_operate_activity),
	tick(AcList).

registerAct() ->
	operateActivityChargeOrUse:init(),
	operateActivityCollectItemLogic:init(),
	operateActivityKilledMonsterLogic:init(),
	operateActivityFeastBossLogic:init(),
	ok.

%%添加活动处理模块
addActHandler(Type,Module) ->
	put({handler,Type},Module),
	ok.

%%获取活动处理模块
getActHandler(Type) ->
	get({handler,Type}).

tick([]) ->
	ok;
tick([#rec_operate_activity{type = Type,starttime = StartTime, endtime = EndTime, phase = Phase} = Ac | AcList]) ->
	case Phase of
		?OperateAct_StateReady ->
			startAc(StartTime, Ac);
		?OperateAct_StateRun ->
			Module = getActHandler(Type),
			NewAc = Module:tick(Ac),
			closeAc(EndTime, NewAc);
		?OperateAct_StateClose ->
			skip
	end,
	tick(AcList).

%%更新活动
update(PidFromLS, CmdSerial, #rec_operate_activity{id = AcID} = Ac) ->
	Ret = 
	case getAc1(AcID) of
		#rec_operate_activity{phase = ?OperateAct_StateClose} ->
			?UpdateAcError1;
		#rec_operate_activity{} = OldAc ->
			updateAc(Ac, OldAc),
			?UpdateAcOK;
		[] ->
			addAc(Ac),
			?UpdateAcOK
	end,
	Node = node(),
	?LOG_OUT("operate ac id ~p, ret [~p]",[AcID, Ret]),
	case erlang:node(PidFromLS) of
		Node ->
			%%这里避免使用GM更新活动时回发消息
			skip;
		_ ->
			psMgr:sendMsg2PS(PidFromLS, handleMsgAck, {CmdSerial, Ret})
	end.



%%执行活动
execute([], _) ->
	ok;
execute([Ac | AcList], AcArg) ->
	case canExeAc(Ac, AcArg) of
		true ->
			executeAc(Ac, AcArg);
		_ ->
			skip
	end,
	execute(AcList, AcArg).

%% ====================================================================
%% state functions
%% ====================================================================

%%开启活动
-spec startAc(StartTime::uint(), Ac::#rec_operate_activity{}) -> ok.
startAc(StartTime, Ac) ->
	NowTime = time:getUTCNowSec(),
	startAc(StartTime, NowTime, Ac).
startAc(StartTime, NowTime, #rec_operate_activity{type = Type} = Ac) when NowTime >= StartTime ->
	?LOG_OUT("operate activity [~p] will be start", [Ac#rec_operate_activity.id]),
	Module = getActHandler(Type),
	NewAc = case Module of
				undefined ->
					Ac;
				_ ->
					Module:startAct(Ac)
			end,
	saveAc(NewAc#rec_operate_activity{phase = ?OperateAct_StateRun});
startAc(_, _, _) ->
	ok.

%%关闭活动
-spec closeAc(EndTime::uint(), Ac::#rec_operate_activity{}) -> ok.
closeAc(EndTime, Ac) ->
	NowTime = time:getUTCNowSec(),
	closeAc(EndTime, NowTime, Ac).
closeAc(EndTime, NowTime, #rec_operate_activity{type = Type} = Ac) when NowTime >= EndTime ->
	?LOG_OUT("operate activity ID:~p Type:~p will be close", [Ac#rec_operate_activity.id,Type]),
	Module = getActHandler(Type),
	NewAc = case Module of
		        undefined ->
			        Ac;
		        _ ->
			        Module:closeAct(Ac)
	        end,
	saveAc(NewAc#rec_operate_activity{phase = ?OperateAct_StateClose});
closeAc(_, _, _) ->
	ok.

addAc(#rec_operate_activity{id = 0, type = Type} = Ac) ->
	Module = getActHandler(Type),
	NewAc = Module:addAct(Ac),
	N = edb:getTableSize(rec_operate_activity),
	ID = N + 1,
	?LOG_OUT("add operate ac [~p]",[NewAc#rec_operate_activity{id = ID, phase = ?OperateAct_StateReady}]),
	saveAc(NewAc#rec_operate_activity{id = ID, phase = ?OperateAct_StateReady}).

%%更新活动
-spec updateAc(Ac::#rec_operate_activity{}, OldAc::#rec_operate_activity{}) -> ok.
updateAc(#rec_operate_activity{type = Type} = Ac, #rec_operate_activity{} = OldAc) when Type >= ?OperateActType_Min orelse Type =< ?OperateActType_Max ->
	Module = getActHandler(Type),
	NewAc = Module:updateAct(Ac, OldAc),
	?LOG_OUT("update ac ~p",[NewAc]),
	saveAc(NewAc);
updateAc(_, _) ->
	ok.

%%检查活动条件(所有活动都需要检查的条件)
-spec canExeAc(Ac::#rec_operate_activity{}, AcArg::#recOperateActivityArg{}) -> boolean().
canExeAc(Ac, AcArg) ->
	case checkAcLimit(
		   AcArg#recOperateActivityArg.type, 
		   AcArg#recOperateActivityArg.lv,
		   Ac#rec_operate_activity.minlevel,
		   Ac#rec_operate_activity.maxlevel) of
		true ->
			case checkAcArg(
				AcArg#recOperateActivityArg.type,
				AcArg#recOperateActivityArg.arg) of
				true ->
					true;
				_ ->
					false
			end;
		_ ->
			false
	end.

%%检查活动等级限制
-spec checkAcLimit(Type::uint(), Lv::uint(), MinLv::uint(), MaxLv::uint()) -> boolean().
checkAcLimit(?OperateActType_FeastBoss, _, _, _) ->
	true;
checkAcLimit(Type, Lv, MinLv, MaxLv) when Type >= ?OperateActType_Min andalso Type =< ?OperateActType_Max andalso Lv >= MinLv andalso Lv =< MaxLv ->
	true;
checkAcLimit(_, _, _, _) ->
	false.

%%检查活动参数是否正确
-spec checkAcArg(Type::uint(), #recAcKilledMonsterArg{}) -> boolean().
checkAcArg(?OperateActType_KilledMonster, #recAcKilledMonsterArg{}) ->
	true;
checkAcArg(?OperateActType_CollectItem, #recAcCollectItemArg{}) ->
	true;
checkAcArg(?OperateActType_FeastBoss, #recAcReastBossArg{}) ->
	true;
checkAcArg(Type, _) when Type ==?OperateActType_DiamonUse orelse Type== ?OperateActType_DiamonCharge ->
	true;
checkAcArg(_, _) ->
	false.

%%执行活动
-spec executeAc(Ac::#rec_operate_activity{}, AcArg::#recOperateActivityArg{}) -> ok.
executeAc(Ac, AcArg) ->
	executeAc(AcArg#recOperateActivityArg.type, Ac, AcArg).

executeAc(?OperateActType_KilledMonster, Ac, Arg) ->
	operateActivityKilledMonsterLogic:executeAc(Ac, Arg);
executeAc(?OperateActType_CollectItem, Ac, Arg) ->
	operateActivityCollectItemLogic:executeAct(Ac, Arg);
executeAc(?OperateActType_FeastBoss, Ac, Arg) ->
	operateActivityFeastBossLogic:executeAc(Ac, Arg);
executeAc(Type, Ac, Arg) when
  Type == ?OperateActType_DiamonCharge orelse Type == ?OperateActType_DiamonUse ->
	operateActivityChargeOrUse:executeAc(Ac, Arg);
executeAc(_, _, _) ->
	%%后续运营活动添加接口
	skip.
 
%%获取正执行活动
-spec getAc(Type::uint()) -> [#rec_operate_activity{}, ...] | [].
getAc(Type) ->
	try
		Pattern = #rec_operate_activity{type = Type, phase = ?OperateAct_StateRun, _ = '_'},
		mnesia:dirty_match_object(rec_operate_activity, Pattern)
	catch 
		_:_ -> []
	end.

%%获取活动根据ID
-spec getAc1(AcID::uint()) -> #rec_operate_activity{} | [].
getAc1(AcID) ->
	case mnesia:dirty_read(rec_operate_activity, AcID) of
		[#rec_operate_activity{} = Ac| _] ->
			Ac;
		_ ->
			[]
	end.
	
%%获取正执行活动数据
-spec getAcData(RoleID::uint(), AcID::uint()) -> #rec_operate_data{} | [].
getAcData(RoleID, AcID) ->
	case mnesia:dirty_read(rec_operate_data, {RoleID, AcID}) of
		[#rec_operate_data{} = Data| _] ->
			Data;
		_ ->
			[]
	end.

%%保存运营活动
-spec saveAc(#rec_operate_activity{}) -> ok.
saveAc(#rec_operate_activity{id = ID} = Ac) ->
	edb:checkAndSave(rec_operate_activity, ID, Ac, new_rec_operate_activity, update_rec_operate_activity).

%%保存运营活动玩家数据
-spec saveAcData(#rec_operate_data{}) -> ok.
saveAcData(#rec_operate_data{roleID = RoleID} = AcData) ->
	edb:checkAndSave(rec_operate_data, RoleID, AcData, new_rec_operate_data, update_rec_operate_data).

