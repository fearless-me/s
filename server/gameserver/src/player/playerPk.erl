%%
%%%-------------------------------------------------------------------
%%% @author 罗维
%%% @copyright (C) 2014, <haowan123>
%%% @doc
%%% 玩家PK状态转换
%%% @end
%%% Created : 14. 六月 2014 14:12
%%%-------------------------------------------------------------------
-module(playerPk).
-author(luowei).
-include("playerPrivate.hrl").


-define(ReduceKillValue,     2).    %%每分钟减少的杀戮值
-define(FiftyKillValue,      50).   %%杀戮值为50取消杀戮buff
-define(OneHundredKillValue, 100).  %%杀戮值为100增加杀戮buff
-define(AddFirstKillValue,   5).    %%首次增加杀戮值
-define(AddKillValue,        10).   %%每次增加杀戮值
-define(DelKillPlayerTime,   15 * 60 * 1000).  %%消除可杀戮玩家时间

-export([
	tranState/1,
	fotceTranState/1,
	forcePeace/1,
	tickTranState/0,
	isPeaceState/0,
	noticeCamp/1,
	noticePetsCamp/1
]).

%%杀戮值规则
-export([
		 addKillValue/2,
		 addKillPlayer/1,
		 tickHateList/0,
		 tickKillValue/0,
		 tickKillPlayer/0,
		 noticeKillValue/0	 
		]).

%%tick仇恨列表
-spec tickHateList() -> ok.
tickHateList() ->
	HateList = playerState:getHateList(),
	PlayerCode = playerState:getPlayerCode(),
	PetEts = playerState:getMapPetEts(),
	PlayerEts = playerState:getMapPlayerEts(),
	Fun = fun(#recHate{hateCode = HateCode, hatePid = Pid} = Hate) ->
				  case codeMgr:getObjectTypeByCode(HateCode) of
					  ?ObjTypePlayer ->
						  case mapView:getObjectDist([PlayerEts], PlayerCode, HateCode) of
							  {ok, Dist, #recMapObject{
													   groupID = GroupID,
													   mapId = MapID
													  },
							   #recMapObject{
											 hp = Hp1,
											 groupID = GroupID1,
											 mapId = MapID1
											}} ->
								  if
									  Dist >= 30 orelse GroupID =/= GroupID1 
										  orelse MapID =/= MapID1 orelse Hp1 =:= 0 ->
										  playerBattle:delHate(Hate),
										  Hate1 = #recHate{
														   hateCode = PlayerCode,
														   hatePid = self(),
														   hateValue = 0
														  },
										  psMgr:sendMsg2PS(Pid, delHate, {HateCode, Hate1});
									  true ->
										  skip
								  end;
							  _ ->
								  playerBattle:delHate(Hate)
						  end;
					  ?ObjTypePet ->
						  case mapView:getObjectDist([PetEts, PlayerEts], PlayerCode, HateCode) of
							  {ok, Dist, #recMapObject{
													   groupID = GroupID,
													   mapId = MapID
													  },
							   #recMapObject{
											 hp = Hp1,
											 groupID = GroupID1,
											 mapId = MapID1
											}} ->
								  if
									  Dist >= 30 orelse GroupID =/= GroupID1 
										  orelse MapID =/= MapID1 orelse Hp1 =:= 0 ->
										  playerBattle:delHate(Hate),
										  Hate1 = #recHate{
														   hateCode = PlayerCode,
														   hatePid = self(),
														   hateValue = 0
														  },
										  psMgr:sendMsg2PS(Pid, delHate, {HateCode, Hate1});
									  true ->
										  skip
								  end;
							  _ ->
								  playerBattle:delHate(Hate)
						  end;
					  ?ObjTypeMonster ->
						  case playerSkill:getObject(HateCode) of
							  #recMapObject{
											hp = Hp,
											groupID = GroupID1,
											mapId = MapID1
										   } ->
								  MapID = playerState:getMapID(),
								  GroupID = playerState:getGroupID(),
								  if
									  Hp =:= 0 orelse GroupID =/= GroupID1 
										  orelse MapID1 =/= MapID ->
										  playerBattle:delHate(Hate);
									  true ->
										  skip
								  end;
							  _ ->
								  playerBattle:delHate(Hate)
						  end;
					  _ ->
						  playerBattle:delHate(Hate)  
				  end
		  end,
	lists:foreach(Fun, HateList).

%%tick杀戮值
-spec tickKillValue() -> ok.
tickKillValue() ->
	KV = playerPropSync:getProp(?PubProp_PlayerKillValue),
	CKV = KV - ?ReduceKillValue,
	if
		KV > ?FiftyKillValue andalso CKV =< ?FiftyKillValue ->
			playerPropSync:setInt(?PubProp_PlayerKillValue, CKV),
			playerBuff:delSpecBuff(?KillBuff);
		CKV > 0 ->
			playerPropSync:setInt(?PubProp_PlayerKillValue, CKV);
		true ->
			playerPropSync:setInt(?PubProp_PlayerKillValue, 0)
	end.

%%tick杀戮玩家
-spec tickKillPlayer() -> ok.
tickKillPlayer() ->
	Now = time:getUTCNowMSDiff2010(),
	PL = playerState:getKillPlayerList(),
	Fun = fun({Code, Times}) ->
				  case Now - Times >= ?DelKillPlayerTime of
					  true ->
						  NewPL = lists:keydelete(Code, 1, PL),
						  playerState:setKillPlayerList(NewPL);
					  _ ->
						  skip
				  end
		  end,
	lists:foreach(Fun, PL).

%%增加可杀戮玩家
-spec addKillPlayer(TCode) -> ok when
		TCode :: uint().
addKillPlayer(TCode) ->
	IsInBattle = isInBattleLearn(),
	IsInActivityMap = playerState:getIsInActivityMap(),
	IsInWildBoss = playerWildBoss:isInWildBoss(),
	case IsInBattle orelse IsInActivityMap orelse IsInWildBoss of
		true ->
			skip;
		_ ->
			case playerSkill:getObject(TCode) of
				#recMapObject{type = ?ObjTypePlayer, killList = List} ->
					addKillPlayer(List, TCode);
				#recMapObject{other = [CasterCode]} ->
					case playerSkill:getObject(CasterCode) of
						#recMapObject{killList = List} ->
							addKillPlayer(List, CasterCode);
						_ ->
							skip
					end;
				#recMapObject{other = [{moveStatus,_},{subType,1},{casterCode,CasterCode}]} ->
					case playerSkill:getObject(CasterCode) of
						#recMapObject{killList = List} ->
							addKillPlayer(List, CasterCode);
						_ ->
							skip
					end;
				_ ->
					skip
			end
	end.

-spec addKillPlayer(TKPL, TCode) -> ok when
		  TKPL :: list(),
		  TCode :: uint().
addKillPlayer(TKPL, TCode) ->
	Now = time:getUTCNowMSDiff2010(),
	KPL = playerState:getKillPlayerList(),
	case isAddKillPlayer(TKPL, TCode, KPL) of
		true ->
			NewKPL = lists:keystore(TCode, 1, KPL, {TCode, Now}),
			playerState:setKillPlayerList(NewKPL),
			noticeKillPlayer(TCode);
		_ ->
			skip
	end,
	ok.
		
%%增加杀戮值
-spec addKillValue(IsFirst, TCode) -> ok when
		IsFirst :: boolean(),
		TCode :: uint().
addKillValue(true, TCode) ->
	IsInBattle = isInBattleLearn(),
	IsInActivityMap = playerState:getIsInActivityMap(),
	IsInWildBoss = playerWildBoss:isInWildBoss(),
	if
		IsInBattle -> skip;
		IsInActivityMap -> skip;
		IsInWildBoss -> skip;
		true ->
			case playerSkill:getObject(TCode) of
				#recMapObject{type = ?ObjTypePlayer, status = Status} ->
					case isAddKillValue(TCode, ?ObjTypePlayer, Status) of
						true -> addFirstKillValue();
						_ -> skip
					end;
				#recMapObject{type = ?ObjTypePet, status = Status, other = [CasterCode]} ->
					case isAddKillValue(CasterCode, ?ObjTypePet, Status) of
						true -> addFirstKillValue();
						_ -> skip
					end;
				_ -> skip
			end
	end;
addKillValue(_, TargetCode) ->
	IsInBattle = isInBattleLearn(),
	IsInActivityMap = playerState:getIsInActivityMap(),
	IsInWildBoss = playerWildBoss:isInWildBoss(),
	if
		IsInBattle -> skip;
		IsInActivityMap -> skip;
		IsInWildBoss -> skip;
		true ->
			case playerSkill:getObject(TargetCode) of
				#recMapObject{type = ?ObjTypePlayer, status = Status} ->
					case isAddKillValue(TargetCode, ?ObjTypePlayer, Status) of
						true -> addNormalKillValue();
						_ -> skip
					end;
				_ -> skip
			end
	end.

%%增加首次杀戮值
-spec addFirstKillValue() -> ok.
addFirstKillValue() ->
	KillValue = playerPropSync:getProp(?PubProp_PlayerKillValue),
	addFirstKillValue(KillValue).
addFirstKillValue(0) ->
	playerPropSync:setInt(?PubProp_PlayerKillValue, ?AddFirstKillValue);
addFirstKillValue(_) ->
	ok.

%%增加每次杀死玩家杀戮值
-spec addNormalKillValue() -> ok.
addNormalKillValue() ->
	KV = playerPropSync:getProp(?PubProp_PlayerKillValue),
	Level = playerState:getLevel(),
	CKV = KV + ?AddKillValue,
	case CKV >= ?OneHundredKillValue of
		true ->
			Status = playerState:getStatus(),
			case misc:testBit(Status, ?CreatureSpecStautsRedName) of
				true ->
					skip;
			_ ->
				playerMsg:sendErrorCodeMsg(?ErrorCode_BattleLearnKillBuff),
				playerBuff:addSpecBuff(?KillBuff, Level)
			end;
		_ ->
			skip
	end,
	playerMsg:sendErrorCodeMsg(?ErrorCode_BattleLearnKillValue, [?AddKillValue]),
	playerPropSync:setInt(?PubProp_PlayerKillValue, CKV).

%%是否增加杀戮值
-spec isAddKillValue(PlayerCode, PlayerType, Status) -> boolean() when
		  PlayerCode :: uint(),
          PlayerType :: uint(),
          Status :: uint().
isAddKillValue(PlayerCode, PlayerType, Status) ->
	PL = playerState:getKillPlayerList(),
	case lists:keyfind(PlayerCode, 1, PL) of
		false ->
			case camp:isRedName(PlayerType, Status) of
				true ->
					false;
				_ ->
					true
			end;
		_ ->
			false
	end.

%%是否增加杀戮人
-spec isAddKillPlayer(TKPL, TCode, KPL) -> boolean() when
          TKPL :: list(),
          TCode :: uint(),
          KPL :: list().
isAddKillPlayer(TKPL, TCode, KPL) ->
	Status = playerState:getStatus(),
	MyCode = playerState:getPlayerCode(),
	case misc:testBit(Status, ?CreatureSpecStautsRedName) of
		true ->
			false;
		_ ->
			case lists:keyfind(MyCode, 1 , TKPL) of
				false ->
					case lists:keyfind(TCode, 1, KPL) of
						false ->
							true;
						_ ->
							false
					end;
				_ ->
					false
			end
	end.
%%强制切换pk模式
fotceTranState(State) ->
	playerState:setPkStatus(State),
	noticePetsPkState(State),
	broadcastPkState(State).
%%转换状态
-spec tranState(State::uint()) -> ok.
tranState(?PlayerPeaceStatus) ->
	playerState:setPkStatus(?PlayerPeaceStatus),
	noticePetsPkState(?PlayerPeaceStatus),
	broadcastPkState(?PlayerPeaceStatus);
tranState(State) ->
	MapID = playerState:getMapID(),
	IsKillMap = isKillMap(MapID),
	%%IsKillTime = isKillTime(),
	tranState(State, IsKillMap, true).
tranState(State, true, true) ->
	playerState:setPkStatus(State),
	noticePetsPkState(State),
	broadcastPkState(State);
tranState(_State,true, false) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_KillModeNightProtect);
tranState(_State,_, _) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_KillModePeaceMap).

%%如果此地图为和平地图,PK状态不为和平状态,强制修改为和平状态
-spec forcePeace(MapID) -> ok when
       MapID :: uint().
forcePeace(MapID) ->
	State = playerState:getPkStatus(),
	Flag = isKillMap(MapID),
	if
		Flag =:= false andalso State =/= ?PlayerPeaceStatus ->
			playerState:setPkStatus(?PlayerPeaceStatus),
			noticePetsPkState(?PlayerPeaceStatus),
			broadcastPkState(?PlayerPeaceStatus);
		true -> 
			skip
	end,
	ok.

%%tick强制转换模式
tickTranState() ->
	case isPeaceState() of
		false ->
			tranState(?PlayerPeaceStatus);
		_ ->
			skip
	end.


%%是否和平状态
-spec isPeaceState() -> boolean().
isPeaceState() ->
	State = playerState:getPkStatus(),
	if
		State =:= ?PlayerPeaceStatus ->
			true;
		true ->
			false
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================
%%是否可以切换杀戮
-spec isKillMap(MapID) -> boolean() when 
       MapID :: uint().
isKillMap(MapID) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{pkflag = Flag} -> misc:testBit(Flag, ?MapKill);
		_ -> false
	end.

%%判断时间是否开启杀戮模式
%% -spec isKillTime() -> boolean().
%% isKillTime() ->
%% 	Now = time:getSyncTime1970FromDBS(),
%% 	StartTime = case getCfg:getCfgPStack(cfg_globalsetup, pk_forbidden_start) of
%% 		#globalsetupCfg{setpara = [Start]} -> Start;
%% 		_ -> 0
%% 	end,
%% 	EndTime = case getCfg:getCfgPStack(cfg_globalsetup, pk_forbidden_end) of
%% 		#globalsetupCfg{setpara = [End]} -> End;
%% 			_ -> 0
%% 	end,
%% 	CurTime = Now - time:getDayBeginSeconds(time:convertSec2DateTime(Now)),
%% 	if
%% 		CurTime >= StartTime -> false;
%% 		CurTime =< EndTime -> false;
%% 		true -> true
%% 	end.
%% ====================================================================
%% notice or broadcast
%% ====================================================================
%%广播Pk状态
-spec broadcastPkState(Status) -> ok when
       Status :: uint().
broadcastPkState(Status) ->
	Code = playerState:getPlayerCode(),
	ResPkMode = #pk_GS2U_ResponseChangePKMode{code = Code, pkMode = Status},
	playerMsg:sendMsgToNearPlayer(ResPkMode, true).

%%通知召唤出来的宠物主人Pk状态发生改变
-spec noticePetsPkState(Status) -> ok when
		  Status :: uint().
noticePetsPkState(Status) ->
	PetsCode = playerState:getCallPetCodeList(),
	Fun = fun(Code) ->
				  monsterInterface:setCasterPkMode(Code, Status),
				  Res = #pk_GS2U_ResponseChangePKMode{code = Code, pkMode = Status},
				  playerMsg:sendMsgToNearPlayer(Res, true)
		  end,
	lists:foreach(Fun, PetsCode).

%通知杀戮值
-spec noticeKillValue() -> ok.
noticeKillValue() ->
	KillValue = playerPropSync:getProp(?PubProp_PlayerKillValue),
	Res = #pk_GS2U_KillValueResponse{killValue = KillValue},
	playerMsg:sendNetMsg(Res).

%%通知杀戮人
-spec noticeKillPlayer(Code) -> ok when
		  Code :: uint().
noticeKillPlayer(Code) ->
    Res = #pk_GS2U_KillPlayerResponse{code = Code},
    playerMsg:sendNetMsg(Res).

%%通知玩家阵营
-spec noticeCamp(Camp) -> ok when
         Camp :: uint().
noticeCamp(Camp) -> 
	Res = #pk_GS2U_ChangeCamp{code = playerState:getPlayerCode(), camp = Camp},
	playerMsg:sendMsgToNearPlayer(Res, true).

%%通知召唤出来的宠物主人阵营发生改变
-spec noticePetsCamp(Camp) -> ok when
		  Camp :: uint().
noticePetsCamp(Camp) ->
	PetsCode = playerState:getCallPetCodeList(),
	Fun = fun(Code) ->
				  monsterInterface:setPetCamp(Code, Camp),
				  {X, Y} = monsterInterface:getPetPos(Code),
				  MapPid = playerState:getMapPid(),
				  PlayerEts = playerState:getMapPlayerEts(),
				  GroupID = monsterInterface:getPetGroupID(Code),
				  Res = #pk_GS2U_ChangeCamp{code = Code, camp = Camp},
				  NearPlayerList = mapView:getMutualObject(MapPid, PlayerEts, ?ObjTypePlayer, {X, Y}, GroupID),
				  [mapView:sendNetMsgToNetPid(NetPid, Res) || #recMapObject{netPid = NetPid} <- NearPlayerList]
		  end,
	lists:foreach(Fun, PetsCode).

-spec isInBattleLearn() -> boolean().
isInBattleLearn() ->
	case playerState:getBattleLearnInfo() of
		#recBattleLearn{} -> true;
		_ -> false
	end.