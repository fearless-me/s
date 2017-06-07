%%%-------------------------------------------------------------------
%%% @author luowei
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 运营活动-杀怪掉落
%%% @end
%%% Created : 28. 五月 2015 14:26
%%%-------------------------------------------------------------------
-module(operateActivityKilledMonsterLogic).
-author("luowei").

-define(DropRuleOne,		1). %%世界范围内击杀任意怪物
-define(DropRuleTwo,		2). %%特定地图上击杀任意怪物
-define(DropRuleThree,		3). %%击杀特定怪物
-define(DropRuleFour,		4). %%击杀与角色等级相差不超过X的任意怪物
-define(BaseNum,		100000).%%随机基础值
-include("operateActivityPrivate.hrl").
-include("playerLog.hrl").


%% API
-export([
	init/0,
	addAct/1,
	updateAct/2,
	startAct/1,
	closeAct/1,
	executeAc/2,
	tick/1
]).

-spec init() -> ok.
init() ->
	operateActivityLogic:addActHandler(?OperateActType_KilledMonster,?MODULE).

-spec startAct(#rec_operate_activity{}) -> #rec_operate_activity{}.
startAct(#rec_operate_activity{} = RecAC) ->
	RecAC.

-spec closeAct(#rec_operate_activity{}) -> #rec_operate_activity{}.
closeAct(#rec_operate_activity{} = RecAC ) ->
	RecAC.

-spec addAct(#rec_operate_activity{}) -> #rec_operate_activity{}.
addAct(#rec_operate_activity{arg1 = AcArgs} = Ac) ->
	Ac#rec_operate_activity{arg1 = updateActArg1(AcArgs, [])}.

-spec updateAct(#rec_operate_activity{}, #rec_operate_activity{}) -> #rec_operate_activity{}.
updateAct(#rec_operate_activity{arg1 = NewAcArgs} = Ac, #rec_operate_activity{arg1 = AcArgs} = OldAc) ->
	NewAc = OldAc#rec_operate_activity{
		name = Ac#rec_operate_activity.name,
		endtime = Ac#rec_operate_activity.endtime,
		minlevel = Ac#rec_operate_activity.minlevel,
		maxlevel = Ac#rec_operate_activity.maxlevel,
		arg1 = updateActArg(NewAcArgs, AcArgs)
	},
	NewAc.
	
updateActArg(NewAcArgs, OldAcArgs) ->
	updateActArg(NewAcArgs, OldAcArgs, []).

updateActArg(NewAcArgs, [], OldArgs) ->
	updateActArg1(NewAcArgs, OldArgs);	%%新增加的活动规则
updateActArg(NewAcArgs, [#recAcKilledMonster{isDelete = 1} = AcArg | L], OldArgs) ->	 %%删除的活动规则
	updateActArg(NewAcArgs, L, [AcArg | OldArgs]);
updateActArg(NewAcArgs, [#recAcKilledMonster{ruleID = RuleID} = OldAcArg | L], OldArgs) -> %%未删除的活动规则
	case lists:keyfind(RuleID, #recAcKilledMonster.ruleID, NewAcArgs) of
		#recAcKilledMonster{} = AcArg -> %%可能修改,替换
			NewAcArg = OldAcArg#recAcKilledMonster{
				mapIDs = AcArg#recAcKilledMonster.mapIDs,
				monsterID = AcArg#recAcKilledMonster.monsterID,
				diffLv = AcArg#recAcKilledMonster.diffLv,
				odds = AcArg#recAcKilledMonster.odds
			};
		_ -> %%已经删除
			NewAcArg = OldAcArg#recAcKilledMonster{
				isDelete = 1
			}
	end,
	updateActArg(NewAcArgs, L, [NewAcArg | OldArgs]);
updateActArg(NewAcArgs, _, OldArgs) ->
	updateActArg1(NewAcArgs, OldArgs).


updateActArg1([], AcArgs) ->
	AcArgs;
updateActArg1([#recAcKilledMonster{ruleID = 0} = AcArg | L], AcArgs) ->
	NewAcArg = AcArg#recAcKilledMonster{ruleID = erlang:length(AcArgs) + 1},
	updateActArg1(L, [NewAcArg | AcArgs]);
updateActArg1([_ | L], AcArgs) ->
	updateActArg1(L, AcArgs).

-spec executeAc(Ac::#rec_operate_activity{}, AcArg::#recOperateActivityArg{}) -> ok.
executeAc(#rec_operate_activity{id = AcID, arg1 = L}, #recOperateActivityArg{} = AcArg) ->
	excuteAc(L, AcID, AcArg).

excuteAc([], _, _) ->
	ok;
excuteAc([#recAcKilledMonster{ruleID = RuleID, itemID = ItemID, odds = Odds, isDelete = 0} = AcKilledMonster | L], AcID, #recOperateActivityArg{roleID = RoleID, pid = PID} = AcArg) ->
	case checkAcDropRule(AcKilledMonster, AcArg) of
		true ->
			case checkAcDropLimit(AcKilledMonster, RoleID, AcID) of
				false ->
					skip;
				{true, PlayerData, ServerData, ServerLimit} ->
					excuteAcDrop(ItemID, Odds, RoleID, RuleID, AcID, PID, ServerData, PlayerData, ServerLimit)
			end;
		_ ->
			skip
	end,
	excuteAc(L, AcID, AcArg);
excuteAc([#recAcKilledMonster{isDelete = 1}| L], AcID, #recOperateActivityArg{} = AcArg) ->
	excuteAc(L, AcID, AcArg).

excuteAcDrop(ItemID, Odds, RoleID, RuleID, AcID, PID, ServerData, PlayerData, ServerLimit) ->
	IsDrop = random:uniform(?BaseNum) =< Odds,
	excuteAcDrop(IsDrop, Odds, ItemID, RoleID, RuleID, AcID, PID, ServerData, PlayerData, ServerLimit).
excuteAcDrop(true, _, ItemID, RoleID, RuleID, AcID, _PID, _ServerData, PlayerData, ServerLimit) ->
	%%updateAcData(?Server_Role_ID, AcID, RuleID, ServerData),
	Key = {?Server_Role_ID, AcID},
	F = fun() ->
		case mnesia:read(rec_operate_data,Key,write) of
			[#rec_operate_data{arg1 = L} = Ac]->
				case ServerLimit < 0 of
					true ->	
						case lists:keyfind(RuleID, #recAcDataKilledMonster.ruleID, L) of
							#recAcDataKilledMonster{num = Num} = Tuple -> 
								NewArg = lists:keyreplace(RuleID, #recAcDataKilledMonster.ruleID, L, Tuple#recAcDataKilledMonster{num = Num + 1}),
								NewAcData = Ac#rec_operate_data{arg1 = NewArg};
							_ ->
								NewArg = lists:keystore(RuleID, #recAcDataKilledMonster.ruleID, L, #recAcDataKilledMonster{ruleID = RuleID, num = 1}),
								NewAcData = Ac#rec_operate_data{arg1 = NewArg}
						end,
						updateServerData(new_rec_operate_data, update_rec_operate_data, Key, NewAcData),
						true;
					_ ->
						case lists:keyfind(RuleID, #recAcDataKilledMonster.ruleID, L) of
							#recAcDataKilledMonster{num = Num} when Num >= ServerLimit ->
								false;
							#recAcDataKilledMonster{num = Num} = Tuple ->	
								NewArg = lists:keyreplace(RuleID, #recAcDataKilledMonster.ruleID, L, Tuple#recAcDataKilledMonster{num = Num + 1}),
								NewAcData = Ac#rec_operate_data{arg1 = NewArg},
								updateServerData(new_rec_operate_data, update_rec_operate_data, Key, NewAcData),
								true;
							_ ->
								NewArg = lists:keystore(RuleID, #recAcDataKilledMonster.ruleID, L, #recAcDataKilledMonster{ruleID = RuleID, num = 1}),
								NewAcData = Ac#rec_operate_data{arg1 = NewArg},
								updateServerData(new_rec_operate_data, update_rec_operate_data, Key, NewAcData),
								true
						end
				end;
			[] ->
				case ServerLimit =:= 0 of
					true ->
						false;
					_ ->
						Arg = #recAcDataKilledMonster{
							ruleID = RuleID,
							num = 1
						},
						AcData = #rec_operate_data{
							roleID = Key, 
							arg1 = [Arg],
							id = AcID
						},
						%%需要新插入
						mnesia:write(new_rec_operate_data,AcData,write),
						%%最后写入缓存数据库
						mnesia:write(AcData),
						true
				end
		end
	end,
	case mnesia:transaction(F) of
		{atomic, Val} ->
			case Val of
				true ->
					?LOG_OUT("player [~p] execute activity [~p] drop rule [~p] itemID [~p]", [RoleID, AcID, RuleID, ItemID]),
					updateAcData(RoleID, AcID, RuleID, PlayerData),
					Plog = #recPLogTSItem{
						old = 0,
						new = 1,
						change = 1,
						target = ?PLogTS_PlayerSelf,
						source = ?PLogTS_OperateAc,
						gold = 0,
						goldtype = 0,
						changReason = ?ItemSourceOperateAcItem,
						reasonParam = ItemID
					},
					playerPackage:addGoodsAndMail(ItemID, 1, true, 0, Plog);
				_ ->
					skip
			end;
		Error ->
			?WARN_OUT("excute ac drop  error:~p",[Error]),
			error
	end;
excuteAcDrop(false, _, _, _, _, _, _, _, _, _) ->
	skip.

-spec tick(#rec_operate_activity{}) -> #rec_operate_activity{}.
tick(#rec_operate_activity{} = RecAC) ->
	RecAC.

%% ====================================================================
%% state functions
%% ====================================================================

%%更新服务器掉落数据
updateServerData(NewTable, UpdateTable, Key, Ac) ->
	case mnesia:read(NewTable,Key,write) of
		[_H|_T] ->
			mnesia:write(NewTable,Ac,write);
		[] ->
			mnesia:write(UpdateTable,Ac,write)
	end,
	mnesia:write(Ac).

%%更新掉落数据
-spec updateAcData(RoleID::uint(), AcID::uint(), RuleID::uint(), Data::[] | #rec_operate_data{}) -> ok.
updateAcData(RoleID, AcID, RuleID, []) ->
	Arg = #recAcDataKilledMonster{
		ruleID = RuleID,
		num = 1
	},
	AcData = #rec_operate_data{
		roleID = {RoleID, AcID}, 
		arg1 = [Arg],
		id = AcID
	},
	operateActivityLogic:saveAcData(AcData);
updateAcData(_RoleID, _AcID, RuleID, #rec_operate_data{arg1 = Arg} = AcData) ->
	case lists:keyfind(RuleID, #recAcDataKilledMonster.ruleID, Arg) of
		#recAcDataKilledMonster{num = Num} = Tuple ->
			NewArg = lists:keyreplace(RuleID, #recAcDataKilledMonster.ruleID, Arg, Tuple#recAcDataKilledMonster{num = Num + 1}),
			NewAcData = AcData#rec_operate_data{arg1 = NewArg};
		_Error ->
			NewArg = lists:keystore(RuleID, #recAcDataKilledMonster.ruleID, Arg, #recAcDataKilledMonster{ruleID = RuleID, num = 1}),
			NewAcData = AcData#rec_operate_data{arg1 = NewArg}
	end,
	operateActivityLogic:saveAcData(NewAcData).
	
%% 检查不同掉落规则条件
-spec checkAcDropRule(#recAcKilledMonster{}, #recOperateActivityArg{}) -> boolean().
checkAcDropRule(#recAcKilledMonster{type = ?DropRuleOne}, #recOperateActivityArg{arg = #recAcKilledMonsterArg{}}) ->
	true;
checkAcDropRule(#recAcKilledMonster{type = ?DropRuleTwo, mapIDs = MapIDs}, #recOperateActivityArg{arg = #recAcKilledMonsterArg{mapID = ID}}) ->
	lists:member(ID, MapIDs);
checkAcDropRule(#recAcKilledMonster{type = ?DropRuleThree, monsterID = MonsterID}, #recOperateActivityArg{arg = #recAcKilledMonsterArg{monsterID = ID}}) ->
	MonsterID =:= ID;
checkAcDropRule(#recAcKilledMonster{type = ?DropRuleFour, diffLv = DiffLv}, #recOperateActivityArg{lv = PlayerLv, arg = #recAcKilledMonsterArg{monsterLv = MonsterLv}}) ->
	abs(PlayerLv - MonsterLv) =< DiffLv.

%%检查活动掉落上限
-spec checkAcDropLimit(#recAcKilledMonster{}, RoleID::uint(), AcID::uint()) -> boolean().
checkAcDropLimit(#recAcKilledMonster{
	 	serverLimit = ServerLimit, 
	 	ruleID = RuleID, 
	 	playerLimit = PlayerLimit
	}, RoleID, AcID) when ServerLimit >= 0 andalso PlayerLimit>= 0 ->
	case operateActivityLogic:getAcData(RoleID, AcID) of
		#rec_operate_data{arg1 = Arg1} = Data1 ->
			PlayerData = Data1,
			PlayerDataArg = Arg1;
		_ ->
			PlayerData = [],
			PlayerDataArg = []
	end,
	case lists:keyfind(RuleID, #recAcDataKilledMonster.ruleID, PlayerDataArg) of
		#recAcDataKilledMonster{num = PlayerNum} when PlayerNum >= PlayerLimit ->
			false;
		_ ->
			case operateActivityLogic:getAcData(?Server_Role_ID, AcID) of
				#rec_operate_data{arg1 = Arg} = Data ->
					ServerData = Data,
					ServerDataArg = Arg;
				_ ->
					ServerData = [],
					ServerDataArg = []
			end,
			case lists:keyfind(RuleID, #recAcDataKilledMonster.ruleID, ServerDataArg) of
				#recAcDataKilledMonster{num = ServerNum} when ServerNum >= ServerLimit ->
					false;
				_ ->
					{true, PlayerData, ServerData, ServerLimit}
			end
	end;
checkAcDropLimit(#recAcKilledMonster{
	serverLimit = ServerLimit,
	ruleID = RuleID,
	playerLimit = PlayerLimit
	}, RoleID, AcID) when ServerLimit < 0 andalso PlayerLimit >= 0 ->
	case operateActivityLogic:getAcData(RoleID, AcID) of
		#rec_operate_data{arg1 = Arg1} = Data1 ->
			PlayerData = Data1,
			PlayerDataArg = Arg1;
		_ ->
			PlayerData = [],
			PlayerDataArg = []
	end,
	case operateActivityLogic:getAcData(?Server_Role_ID, AcID) of
				#rec_operate_data{} = Data ->
					ServerData = Data;
				_ ->
					ServerData = []
	end,
	case lists:keyfind(RuleID, #recAcDataKilledMonster.ruleID, PlayerDataArg) of
		#recAcDataKilledMonster{num = PlayerNum} when PlayerNum >= PlayerLimit ->
			false;
		_ ->
			{true, PlayerData, ServerData, ServerLimit}
	end;
checkAcDropLimit(#recAcKilledMonster{
	serverLimit = ServerLimit,
	ruleID = RuleID,
	playerLimit = PlayerLimit
	}, RoleID, AcID) when ServerLimit >= 0 andalso PlayerLimit < 0 ->
	case operateActivityLogic:getAcData(RoleID, AcID) of
		#rec_operate_data{} = Data1 ->
			PlayerData = Data1;
		_ ->
			PlayerData = []
	end,
	case operateActivityLogic:getAcData(?Server_Role_ID, AcID) of
		#rec_operate_data{arg1 = Arg} = Data ->
			ServerData = Data,
			ServerDataArg = Arg;
		_ ->
			ServerData = [],
			ServerDataArg = []
	end,
	case lists:keyfind(RuleID, #recAcDataKilledMonster.ruleID, ServerDataArg) of
		#recAcDataKilledMonster{num = ServerNum} when ServerNum >= ServerLimit ->
			false;
		_ ->
			{true, PlayerData, ServerData, ServerLimit}
	end;
checkAcDropLimit(#recAcKilledMonster{
	serverLimit = ServerLimit
	}, RoleID, AcID) ->
	case operateActivityLogic:getAcData(RoleID, AcID) of
		#rec_operate_data{} = Data1 ->
			PlayerData = Data1;
		_ ->
			PlayerData = []
	end,
	case operateActivityLogic:getAcData(?Server_Role_ID, AcID) of
		#rec_operate_data{} = Data ->
			ServerData = Data;
		_ ->
			ServerData = []
	end,
	{true, PlayerData, ServerData, ServerLimit}.
			

