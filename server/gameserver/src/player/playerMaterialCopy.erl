%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 十二月 2016 20:00
%%%-------------------------------------------------------------------
-module(playerMaterialCopy).
-author("Administrator").
-include("playerPrivate.hrl").
%% API
-export([
	finalData/1,
	giveDropData/1,
	enterCopyMap/1,
	onEnterMap/1,
	copyMapDropList/3,
	playerEnterMapReal/1,
	updateTower/2,
	killedMonster/2,
	leaveCopyMap/1,
	onChapterStart/1
]).

%%%-------------------------------------------------------------------
%% 会被跨进程访问
-export([
	getMonterList/2,
	getMonsterPos/1
]).

-export([
	gmfinish/0
]).

onChapterStart(Chapter)->
	playerMsg:sendErrorCodeMsg(?ErrorCode_MaterialCopyChapterStart, [Chapter]),
	setChapter(Chapter).

killedMonster(_MapID, _MonsterID) -> ok.

leaveCopyMap(MapID) ->
	case playerScene:getMapSubType(MapID) of
		?MapSubTypeMaterial ->
			resetChapter(),
			playerPropSync:setInt64(?PriProp_MaterialValue, 0);
		_ -> skip
	end.

%%%-------------------------------------------------------------------
updateTower(DataID, Type)->
	?DEBUG_OUT("updateTower(~w)",[DataID]),
	MapID = playerState:getMapID(),
	case canUpTower() of
		{false, ErrorCode}->
			playerMsg:sendErrorCodeMsg(ErrorCode);
		{true, _}->
			case playerScene:getMapSubType(MapID) of
				?MapSubTypeMaterial ->
					doUpdateTower(MapID, DataID, Type);
				_ ->
					ok
			end
	end,
	ok.

doUpdateTower(MapID, DataID, Type) ->
	MapID = playerState:getMapID(),
	MapPID = playerState:getMapPid(),
	RoleID = playerState:getRoleID(),
	NetPid = playerState:getNetPid(),
	case nextLeveMonst(MapID, DataID, Type) of
		{NextMonsterID, NextMonsterCost, NextLevel} ->
			case checkExist(DataID) of
				true ->
					case getMonsterPos(Type) of
						{X, Y} ->
							core:sendMsgToActivity(
								?ActivityType_Material,
								upTower, {NetPid, RoleID, MapPID, DataID,NextMonsterCost, NextMonsterID, Type, NextLevel, X, Y});
						_ ->
							error
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_MaterialCopyMaxLevel)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_MaterialCopyMaxLevel)
	end.

nextLeveMonst(MapID, DataID, Type)->
	L = getMonterList(MapID, Type),
	{DL, CL} = lists:unzip(L),
	N = misc:getListPos(DataID, DL),
	case N < length(L) andalso N > 0 of
		true ->
			NextMonsterID = lists:nth(N + 1, DL),
			NextMonsterCost = lists:nth(N, CL),
			{NextMonsterID, NextMonsterCost, N + 1};
		_ ->
			ok
	end.


checkExist(DataID)->
	MonsterEts = playerState:getMapMonsterEts(),
	try
%%		?DEBUG_OUT("~p",[myEts:getAllRecord(MonsterEts)]),
		MatchSpec = ets:fun2ms(fun(Object) when Object#recMapObject.id =:= DataID ->  Object#recMapObject.code end),
		MapMonsterList = myEts:selectEts(MonsterEts, MatchSpec),
		length(MapMonsterList) =:= 1
	catch
	    _:_Why  ->
		    ?ERROR_OUT("~p,~p",[MonsterEts, myEts:getAllRecord(MonsterEts)]),
		    true
	end.


%cost(Cost)->
%	V = playerPropSync:getProp(?PriProp_MaterialValue),
%	case V >= Cost of
%		true ->
%			playerPropSync:setInt64(?PriProp_MaterialValue, V - Cost);
%		_ ->
%			false
%	end.
%
%addMaterialVal(Plus) ->
%	V = playerPropSync:getProp(?PriProp_MaterialValue),
%	playerPropSync:setInt64(?PriProp_MaterialValue, V + Plus ).

%%%-------------------------------------------------------------------
onEnterMap(CopyMapID)->
	core:sendMsgToActivity(
		?ActivityType_Material,
		onEnterMaterialMap, {playerState:getRoleID(), CopyMapID, playerState:getTeamID()}).

%%%-------------------------------------------------------------------
enterCopyMap(CopyMapID)->
	playerScene:onRequestEnterMap(CopyMapID).

%%%-------------------------------------------------------------------
giveDropData(_MapID)-> ok.

%%%-------------------------------------------------------------------
finalData(_Data)-> ok.

%%%-------------------------------------------------------------------
copyMapDropList(_MapPID, _MapID, _L) -> ok.
%%	core:sendMsgToActivity(
%%		?ActivityType_Material,
%%		setCopyMapDropList, {playerState:getRoleID(), MapPID, MapID, L}).

%%%-------------------------------------------------------------------
playerEnterMapReal(MapID)->
	case playerScene:getMapSubType(MapID) of
		?MapSubTypeMaterial ->
			?DEBUG_OUT("############################# playerEnterMapReal ###########################"),
			core:sendMsgToActivity(
				?ActivityType_Material,
				playerEnterMapReal, {playerState:getNetPid(), playerState:getRoleID(), MapID, playerState:getMapPid()});
		_ ->
			skip
	end.

%%%-------------------------------------------------------------------
canUpTower()->
	case playerState:getTeamID() of
		0 ->
			{true, 0};
		TeamID ->
			case teamInterface:getLeaderIDWithTeamID(TeamID) of
				0 ->
					{false, ?ErrorCode_MaterialCopyLeaderOnly};
				V ->
					case V =:= playerState:getRoleID() of
						true ->
							case getLevelUp() of
								true ->
									{false, ?ErrorCode_TradeCDTime};
								_ ->
									{true, 0}
							end;
						_ ->
							{false, ?ErrorCode_MaterialCopyLeaderOnly}
					end
			end
	end.

%%%-------------------------------------------------------------------
%setLevelUp(V)-> put('IsLevelingUp', V).
getLevelUp()->
	case get('IsLevelingUp') of
		undefined ->
			false;
		V ->
			V
	end.




%%%-------------------------------------------------------------------
%%% 会被多进程访问
getMonsterPos(N)->
	L =
		case getCfg:getCfgByArgs(cfg_globalsetup, specialinstancewaypoint) of
			#globalsetupCfg {setpara = V} ->
				V;
			_ ->
				[]
		end,
	case N > 0 andalso N =< length(L) of
		true ->
			lists:nth(N, L);
		false ->
			?ERROR_OUT("monsterPos(~w,~w)",[N, length(L)]),
			false
	end.

%%%-------------------------------------------------------------------
getMonterList(MapID, 1)->
	case getCfg:getCfgByArgs(cfg_specialinstance, MapID, 1) of
		#specialinstanceCfg{levelup_1 = List} ->
			List;
		_ ->
			[]
	end;
getMonterList(MapID, 2)->
	case getCfg:getCfgByArgs(cfg_specialinstance, MapID, 1) of
		#specialinstanceCfg{levelup_2 = List} ->
			List;
		_ ->
			[]
	end;
getMonterList(MapID, 3)->
	case getCfg:getCfgByArgs(cfg_specialinstance, MapID, 1) of
		#specialinstanceCfg{levelup_3 = List} ->
			List;
		_ ->
			[]
	end;
getMonterList(_,_)-> [].

%%%-------------------------------------------------------------------
setChapter(V)-> put(materialChapter,V).
%getChapter()->
%	case get(materialChapter) of
%		undefined -> 1;
%		V -> V
%	end.
resetChapter()-> erase(materialChapter).


%%%-------------------------------------------------------------------
gmfinish() ->
	MapID = playerState:getMapID(),
	MapPID = playerState:getMapPid(),
	RoleID = playerState:getRoleID(),
	core:sendMsgToActivity(
		?ActivityType_Material, gmfinish, {RoleID, MapID, MapPID}).