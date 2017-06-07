%%%-------------------------------------------------------------------
%%% @author luowei
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 运营活动-节日boss
%%% @end
%%% Created : 9. 九月 2015 9:26
%%%-------------------------------------------------------------------
-module(operateActivityFeastBossLogic).
-author("luowei").

-include("operateActivityPrivate.hrl").


%% API
-export([
	init/0,
	addAct/1,
	updateAct/2,
	startAct/1,
	closeAct/1,
	executeAc/2,
	tick/1,
	
	createMap/2,
	destoryMap/2
]).

-spec init() -> ok.
init() ->
	operateActivityLogic:addActHandler(?OperateActType_FeastBoss,?MODULE).

-spec startAct(#rec_operate_activity{}) -> #rec_operate_activity{}.
startAct(#rec_operate_activity{} = RecAC) ->
	RecAC.

-spec closeAct(#rec_operate_activity{}) -> #rec_operate_activity{}.
closeAct(#rec_operate_activity{id = ActID, arg1 = L} = RecAC ) ->
	Fun = fun(#recAcFeastBossCfg{mapID = MapID, bossID = BossID}) ->
		case getRefreshAcMap(ActID, MapID) of
			L1 when is_list(L1) ->
				Fun1 = fun({MapPid, _}) ->
					case misc:is_process_alive(MapPid) of
						true -> 
							psMgr:sendMsg2PS(MapPid, destoryFeastBoss, {MapID, BossID});
						_ ->
							skip
					end
				end,
				lists:foreach(Fun1, L1);
			 _ ->
				skip
		end,
		eraseRefreshAcTime(ActID, MapID),
		eraseRefreshAcMap(ActID, MapID)
	end,
	lists:foreach(Fun, L),
	RecAC.

-spec addAct(#rec_operate_activity{}) -> #rec_operate_activity{}.
addAct(#rec_operate_activity{} = Ac) ->
	Ac.

-spec updateAct(#rec_operate_activity{}, #rec_operate_activity{}) -> #rec_operate_activity{}.  %%fix me  还需要修改参数
updateAct(#rec_operate_activity{arg1 = _NewAcArgs} = Ac, #rec_operate_activity{arg1 = AcArgs} = OldAc) ->
	NewAc = OldAc#rec_operate_activity{
		name = Ac#rec_operate_activity.name,
		endtime = Ac#rec_operate_activity.endtime,
		minlevel = Ac#rec_operate_activity.minlevel,
		maxlevel = Ac#rec_operate_activity.maxlevel,
		arg1 = AcArgs
	},
	NewAc.

-spec executeAc(Ac::#rec_operate_activity{}, AcArg::#recOperateActivityArg{}) -> ok.
executeAc(#rec_operate_activity{id = AcID, arg1 = L}, #recOperateActivityArg{} = AcArg) ->
	excuteAc(L, AcID, AcArg).

excuteAc([], _, _) ->
	ok;
excuteAc([#recAcFeastBossCfg{mapID = MapID, bossID = BossID} | L], AcID, #recOperateActivityArg{arg = #recAcReastBossArg{killedName  = KillName, hateList = Hl} = Arg} = AcArg) ->
	case checkAcDropRule(MapID, BossID, Arg) of
		true ->
			[RandNum, _, _] = globalCfg:getAcArg(),
			case length(Hl) =< RandNum of
				true ->
					Nhl = Hl;
				_ ->
					Nhl = getRandomHateList(RandNum, Hl)
			end,
			excuteAcDrop(AcID, MapID, BossID, Nhl),
			NameList = getHateNameList(RandNum, Nhl),
			#monsterCfg{showName = ShowName} = getCfg:getCfgPStack(cfg_monster, BossID),
			N = stringCfg:getString(feastbossrereward,[KillName, ShowName, lists:nth(1, NameList), lists:nth(2, NameList),lists:nth(3, NameList)]),
 			core:sendBroadcastNotice(N);	
		_ ->
			skip
	end,
	excuteAc(L, AcID, AcArg);
excuteAc([_| L], AcID, #recOperateActivityArg{} = AcArg) ->
	excuteAc(L, AcID, AcArg).

-spec excuteAcDrop(AcID::uint(), MapID::uint(), BossID::uint(), Hl::list()) -> ok.
excuteAcDrop(_AcID, _MapID, _BossID, []) ->
	ok;
excuteAcDrop(AcID, MapID, BossID, [#recKillBossPlayer{pid = Pid} | L]) ->
	case misc:is_process_alive(Pid) of
		true ->
			?LOG_OUT("excute ac [~p] reast boss drop, mapID:[~p], bossID:[~p], player pid:[~p]", [AcID, MapID, BossID, Pid]),
			psMgr:sendMsg2PS(Pid, activityFeastBossDrop, {});
		_ ->
			?LOG_OUT("player offline, excute ac [~p] reast boss drop, mapID:[~p], bossID:[~p], player pid:[~p]", [AcID, MapID, BossID, Pid]),
			skip
	end,
	excuteAcDrop(AcID, MapID, BossID, L).

-spec tick(#rec_operate_activity{}) -> #rec_operate_activity{}.
tick(#rec_operate_activity{id = AcID,arg1 = CfgArg,type = ?OperateActType_FeastBoss} = Ac) ->
	tick(AcID, CfgArg),
	Ac.

tick(_AcID, []) ->
	ok;
tick(AcID, [#recAcFeastBossCfg{mapID = MapID, bossID = BoosID, freshLine = Line, freshInterval = Interval} | L]) ->
	Now = time:getUTCNowSec(),
	LastRefreshTime = getRefreshAcTime(AcID, MapID),
	case Now - LastRefreshTime >= Interval * 60 of
		true -> %%重新刷新
			case getCfg:getCfgPStack(cfg_fightbossActivity, MapID) of
				#fightbossActivityCfg{coordinate = [X1, Y1]} ->
					X = trunc(X1),
					Y = trunc(Y1);
				_ ->
					X = 0,
					Y = 0
			end,
			#monsterCfg{showName = ShowName} = getCfg:getCfgPStack(cfg_monster, BoosID),
			N = stringCfg:getString(feastbossrefresh,[ShowName, MapID, X, Y]),
 			core:sendBroadcastNotice(N),
			case getMapNoRepeatLine(MapID, []) of
				{} ->
					skip;
				{MapPid, MapID} = E ->
					psMgr:sendMsg2PS(MapPid,spawnAcMonster,{MapID,BoosID}),
					setRefreshAcMap(AcID, MapID, [E]),
					setRefreshAcTime(AcID, MapID, Now)
			end;
		_ ->
			%%检查是否线路已经刷满
			L1 = getRefreshAcMap(AcID, MapID),
			case length(L1) >= Line of
				false ->
					case getMapNoRepeatLine(MapID, L1) of
						{} -> %%没有线路,继续等待
							skip;
						{MapPid, MapID} = E ->
							psMgr:sendMsg2PS(MapPid,spawnAcMonster,{MapID,BoosID}),
							setRefreshAcMap(AcID, MapID, [E | L1])
					end;
				_ ->
					skip
			end
	end,
 	tick(AcID, L);
tick(AcID, [_ | L]) ->
	tick(AcID, L).

-spec createMap(MapID::uint(), MapPid::pid()) -> ok. %%需要优化下
createMap(MapID, MapPid) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeNormal} ->
			L = getMapLineList(),
			case lists:keyfind(MapPid, 1, L) of
				false ->
					setMapLineList([{MapPid, MapID} | L]);
				{MapPid, _} ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

-spec destoryMap(MapID::uint(), MapPid::pid()) -> ok.
destoryMap(MapID, MapPid) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeNormal} ->
			L = getMapLineList(),
			case lists:keyfind(MapPid, 1, L) of
				{MapPid, _} ->
					setMapLineList(lists:keydelete(MapPid, 1, L));
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.
%% ====================================================================
%% state functions
%% ====================================================================
-spec getRandomHateList(Num::uint(), HateList::list()) -> list().
getRandomHateList(0, _) ->
	[];
getRandomHateList(Num, HateList) ->
	getRandomHateList(Num, HateList, []).
getRandomHateList(0, _, L) ->
	L;
getRandomHateList(Num, HateList, L) ->
	N = random:uniform(length(HateList)),
	E = lists:nth(N, HateList),
	HL = lists:delete(E, HateList),
	getRandomHateList(Num - 1, HL, [E | L]).

getHateNameList(0, HateList) ->
	HateList;
getHateNameList(Num, HateList) ->
	getHateNameList(Num, HateList, []).
getHateNameList(0, _, L) ->
	L;
getHateNameList(Num, HateList, L) ->
	case Num > length(HateList) of
		true ->
			getHateNameList(Num - 1, HateList, ["" | L]);
		_ ->
			#recKillBossPlayer{name = Name} = lists:nth(Num, HateList),
			getHateNameList(Num - 1, HateList, [Name | L])
	end.

%% 检查不同掉落规则条件
-spec checkAcDropRule(MapID::uint(), BossID::uint(), #recAcReastBossArg{}) -> boolean().
checkAcDropRule(MapID, BossID, #recAcReastBossArg{mapID = MID, monsterID = MoID}) when MapID =:= MID andalso MoID =:= BossID ->
	true;
checkAcDropRule(_, _, _) ->
	false.

getMapNoRepeatLine(MapID, L) ->
	L1 = getMapLineList(),
	F = fun({Pid, ID} = E, Acc) ->
		case MapID =:= ID of
			true ->
				case lists:keyfind(Pid, 1, L) of
					false ->
						[E | Acc];
					_ ->
						Acc
				end;
			_ ->
				Acc
		end
	end,
	case lists:foldl(F, [], L1) of
		[] ->
			{};
		L2 when is_list(L2) ->
			N = random:uniform(length(L2)),
			lists:nth(N, L2)
	end.

-spec getMapLineList() -> list().
getMapLineList() ->
	case get('FeastBossMapLine') of
		undefined ->
			[];
		List ->
			List
	end.

-spec setMapLineList(L::list()) -> ok.
setMapLineList(L) ->
	put('FeastBossMapLine', L).

-spec getRefreshAcTime(AcID::uint(), MapID::uint()) -> uint().
getRefreshAcTime(AcID, MapID) ->
	case get({refreshAcTime, AcID, MapID}) of
		undefined ->
			0;
		Time ->
			Time
	end.

-spec setRefreshAcTime(AcID::uint(), MapID::uint(), Time::uint()) -> ok.
setRefreshAcTime(AcID, MapID, Time) ->
	put({refreshAcTime, AcID, MapID}, Time),
	ok.

-spec eraseRefreshAcTime(AcID::uint(), MapID::uint()) -> ok.
eraseRefreshAcTime(AcID, MapID) ->
	erase({refreshAcTime,AcID,MapID}),
	ok.

-spec getRefreshAcMap(AcID::uint(), MapID::uint()) -> list().
getRefreshAcMap(AcID, MapID) ->
	case get({refreshAcMap, AcID, MapID}) of
		undefined ->
			[];
		L ->
			L
	end.

-spec setRefreshAcMap(AcID::uint(), MapID::uint(), L::list()) -> ok.
setRefreshAcMap(AcID, MapID, L) ->
	put({refreshAcMap, AcID, MapID}, L),
	ok.

-spec eraseRefreshAcMap(AcID::uint(), MapID::uint()) -> ok.
eraseRefreshAcMap(AcID, MapID) ->
	erase({refreshAcMap, AcID, MapID}),
	ok.

