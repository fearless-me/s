%%
%% @author zhongyunawei
%% @doc @todo 生物信息同步到地图.


-module(creatureMap).
-author(zhongyuanwei).


-include("monsterPrivate.hrl").
-define(EnemyCamp, 2).
%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 addCreatureToEts/3,
		 delCreatureFromEts/2,
		 syncCreatureToEts/1,
		 searchEnemy/2,
		 dealEnterMapAck/2
		]).

%% 添加Creature到ETS表中
-spec addCreatureToEts(Code, MapObject, CodeType) -> true when
	Code :: uint(),
	MapObject :: #recMapObject{},
	CodeType :: ?SpawnCarrier | ?SpawnCallMonster | ?SpawnMonster | ?SpawnPet | ?SpawnCallPet.
addCreatureToEts(Code, MapObject, ?SpawnPet) ->
	PetEts = monsterState:getMapPetEts(Code),
	myEts:insertEts(PetEts, MapObject);
addCreatureToEts(Code, MapObject, ?SpawnCallPet) ->
	PetEts = monsterState:getMapPetEts(Code),
	myEts:insertEts(PetEts, MapObject);
addCreatureToEts(Code, MapObject, _CodeType) ->
	MonsterEts = monsterState:getMapMonsterEts(Code),
	myEts:insertEts(MonsterEts, MapObject).


%%  在ETS表中删除Creature
-spec delCreatureFromEts(Code, CodeType) -> true when
	Code :: uint(),
	CodeType :: ?SpawnCarrier | ?SpawnCallMonster | ?SpawnMonster | ?SpawnPet | ?SpawnCallPet.
delCreatureFromEts(Code, ?SpawnPet) ->
	PetEts = monsterState:getMapPetEts(Code),
	Res = myEts:deleteEts(PetEts, Code),
	?LOG_OUT("player roleID : ~p del pet code [~p] succ, Res [~p]", [playerState:getRoleID(), Code, Res]),
	Res;
delCreatureFromEts(Code, ?SpawnCallPet) ->
	PetEts = monsterState:getMapPetEts(Code),
	Res = myEts:deleteEts(PetEts, Code),
	?LOG_OUT("player roleID : ~p del pet code [~p] succ, Res [~p]", [playerState:getRoleID(), Code, Res]),
	Res;
delCreatureFromEts(Code, _) ->
	MonsterEts = monsterState:getMapMonsterEts(Code),
	myEts:deleteEts(MonsterEts, Code).

-spec dealEnterMapAck(Ack, Code) -> ok when
		  Ack :: #enterMapInfo{},
    Code :: uint().
dealEnterMapAck(#enterMapInfo{
    mapid = MapID,
    mapPlayerEts = MapPlayerEts,
    mapPetEts = MapPetEts,
    mapMonsterEts = MapMonsterEts,
    mapPid = MapPid,
    mapLine = MapLine,
    x = X,
    y = Y
}, Code) ->
	?LOG_OUT("Pet Code [~p] enter mapid[~p] mapPid[~p] line[~p] ~p,~p ok",[Code,MapID,MapPid,MapLine, X ,Y]),
	monsterState:setMapPlayerEts(Code,MapPlayerEts),
	monsterState:setMapPetEts(Code,MapPetEts),
	monsterState:setMapMonsterEts(Code,MapMonsterEts),
	monsterState:setMapID(Code, MapID),
	monsterState:setMapPid(Code, MapPid),
	monsterState:setMonsterPos(Code, X, Y),
	monsterState:setMoveTarget(Code, 0, 0),
	%%强制脱战
	monsterBattle:delBothHate(Code),
	
	%%同屏给周围玩家
%%	CasterInfo = monsterState:getCasterInfo(Code),
%%	Camp = monsterState:getCamp(Code),
%%	BuffList = monsterBuff:getBuffInfoList(Code),
%%	Speed = monsterState:getMoveSpeed(Code),
%%	MaxHp = monsterState:getBattlePropTotal(Code,?Prop_MaxHP),
%%	case misc:isZero(MaxHp) of
%%		true ->
%%			Hp_Per = 0;
%%		_ ->
%%			Hp = monsterState:getCurHp(Code),
%%			Hp_Per = erlang:round(Hp / MaxHp * 100)
%%	end,
%%	Msg = #pk_GS2U_PetList{pet_list = [#pk_LookInfoPet{
%%		code = Code,
%%		id = monsterState:getId(Code),
%%		status = monsterState:getActionStatus(Code),
%%		pkMode = CasterInfo#recCasterInfo.casterPkMode,
%%		playerCode = CasterInfo#recCasterInfo.casterCode,
%%		name = monsterState:getName(Code),
%%		x = X,
%%		y = Y,
%%		targetX = 0,
%%		targetY = 0,
%%		move_speed = Speed,
%%		hp_per = Hp_Per,
%%		camp = Camp,
%%		buffs = BuffList
%%		}]},
%%	PlayerView = mapView:getNearRectByPos(X, Y),
%%	PlayerList = mapView:getNearViewObject(MapPid, MapPlayerEts, ?ObjTypePlayer, PlayerView, monsterState:getGroupID(Code)),
%%	case PlayerList of
%%		[] ->
%%			skip;
%%		_ ->
%%			[psMgr:sendMsg2PS(Pid, broadcast, Msg) ||#recMapObject{pid = Pid} <- PlayerList]
%%	end,
	ok.

%%  同步所有生物到ETS表中
-spec syncCreatureToEts(Code) -> Result when
		  Code :: uint(),
		  Result :: boolean().
syncCreatureToEts(Code) ->
	{X,Y} = monsterState:getMonsterPos(Code),
	ActionStatus = monsterState:getActionStatus(Code),
	Status = monsterState:getStatus(Code),
	Hp = monsterState:getCurHp(Code),
	Mp = monsterState:getCurMp(Code),
	Name = monsterState:getName(Code),
	GuildID = monsterState:getGuildID(Code),
	GroupID = monsterState:getGroupID(Code),
	TeamID = monsterState:getTeamID(Code),
	Camp = monsterState:getCamp(Code),
	{TX,TY} = monsterState:getMoveTarget(Code),
	MoveList = [#pk_PosInfo{x = TX,y = TY}],
	MoveSpeed = monsterState:getMoveSpeed(Code),
	MoveStatus = monsterState:getMoveStatus(Code),
	CasterInfo = monsterState:getCasterInfo(Code),
	BuffList = monsterBuff:getBuffInfoList(Code),
	MaxHp = monsterState:getBattlePropTotal(Code, ?Prop_MaxHP),
	Speed = 0, %% monsterState:getBattlePropTotal(Code, ?Prop_attackspeed),
	List = [{#recMapObject.x, X},
			{#recMapObject.y, Y},
			{#recMapObject.name,Name},
			{#recMapObject.actionStatus, ActionStatus},
			{#recMapObject.status, Status},
			{#recMapObject.hp, Hp}, 
			{#recMapObject.mp, Mp},
			{#recMapObject.maxHp, MaxHp},
			{#recMapObject.moveTargetList, MoveList},
			{#recMapObject.buffList, BuffList},
			{#recMapObject.moveSpeed, MoveSpeed},
			{#recMapObject.guild, GuildID},
			{#recMapObject.teamID, TeamID},
			{#recMapObject.camp, Camp},
			{#recMapObject.groupID, GroupID},
			{#recMapObject.attackSpeed, Speed},
			{#recMapObject.ownId, CasterInfo#recCasterInfo.casterId},
			{#recMapObject.ownPid, CasterInfo#recCasterInfo.casterPid},
			{#recMapObject.ownCode, CasterInfo#recCasterInfo.casterCode},
			{#recMapObject.pkMode, CasterInfo#recCasterInfo.casterPkMode}],
	case monsterState:getCodeType(Code) of
		?SpawnPet ->
			Ets = monsterState:getMapPetEts(Code),
			NewList = List;
		?SpawnCallPet ->
			Ets = monsterState:getMapPetEts(Code),
			NewList = List;
		?SpawnCarrier ->
			Ets = monsterState:getMapMonsterEts(Code),
			NewList = [{#recMapObject.other,[{moveStatus,MoveStatus},{subType,1},{casterCode,CasterInfo#recCasterInfo.casterCode}]} | List];
		_ ->   
			Ets = monsterState:getMapMonsterEts(Code),
			NewList = [{#recMapObject.other,[{moveStatus,MoveStatus},{subType,0},{casterCode,CasterInfo#recCasterInfo.casterCode}]} | List]
	end,
	myEts:updateEts(Ets, Code, NewList).

-spec searchEnemy(Type, Code) -> ok when
    Type :: uint(),
	Code :: uint().
searchEnemy(?SpawnPet, _Code) ->
	ok;
searchEnemy(?SpawnCallPet, _Code) ->
	ok;
searchEnemy(?SpawnCarrier, _Code) ->
	ok;
searchEnemy(_, Code) ->
	case monsterState:getMonsterPos(Code) of
		{X,Y} ->
			MonID = monsterState:getId(Code),
			#monsterCfg{watchRadius = WatchRadius,monsterAI = AI} = getCfg:getCfgPStack(cfg_monster, MonID),
			GroupID = monsterState:getGroupID(Code),
			HateList1 = monsterState:getHateList(Code),
			AttackTarget = monsterState:getAttackTarget(Code),

			HateList = case getMonsterType(Code) of
						   ?MonsterSTypeTower when AttackTarget =:= undefined ->
							   [];
						   _ ->
							   HateList1
			           end,

			case AI of
				[?AI_Type_Active, ?BST_SELTARGET_ENEMY_MONSTER, _] ->
					MonsterEts = monsterState:getMapMonsterEts(Code),
					searchEnemy1(Code,?BST_SELTARGET_ENEMY_MONSTER,HateList,WatchRadius,MonsterEts,?ObjTypeMonster,X,Y,GroupID);
				[?AI_Type_Active, ?BST_SELTARGET_ENEMY_MONSTER_FIRST, _] ->
					MonsterEts = monsterState:getMapMonsterEts(Code),
					case HateList of
						[] ->
							searchEnemy1(Code,?BST_SELTARGET_ENEMY_MONSTER_FIRST,HateList,WatchRadius,MonsterEts,?ObjTypeMonster,X,Y,GroupID);
						_ ->
							skip
					end;
				[?AI_Type_Active, TargetType, _] ->
					PlayerEts = monsterState:getMapPlayerEts(Code),
					searchEnemy1(Code,TargetType,HateList,WatchRadius,PlayerEts,?ObjTypePlayer,X,Y,GroupID);
				[?AI_Type_PassiveSpecWay, TargetType, _] ->
					PlayerEts = monsterState:getMapPlayerEts(Code),
					searchEnemy1(Code,TargetType,[],WatchRadius,PlayerEts,?ObjTypePlayer,X,Y,GroupID);
					%TargetCode = monsterState:getAttackTarget(Code);
%%					?DEBUG_OUT("###########searchEnemy(~p/~p),monster(~p,~p),hlen(~p)",[TargetCode, WatchRadius, MonID, AI, length(HateList)]);
				_ ->
					skip
			end;
%%			case MonID >= 8300 andalso MonID < 8302 of
%%				true ->
%%					?DEBUG_OUT("@@@@@@@@@@@@@@@@@@@@@@@@@@ searchEnemy(~w,~w, ~w -> ~w,~w)",
%%						[MonID, AI,AttackTarget, monsterState:getAttackTarget(Code),HateList]);
%%				_ -> skip
%%			end;
		_ ->
			skip
	end,

	%% [DebugForPetTerritory]
	%debugForPetTerritory(Code),
	ok.

%debugForPetTerritory(Code) ->
%	case monsterState:getMapID(Code) of
%		6000 ->
%			HateList = monsterState:getHateList(Code),
%			AttackTarget = monsterState:getAttackTarget(Code),
%			Camp = monsterState:getCamp(Code),
%			case AttackTarget of
%				undefined ->
%					?DEBUG_OUT("[DebugForPetTerritory] Code:~p HateList:~p", [Code, HateList]),
%					?DEBUG_OUT("[DebugForPetTerritory] Code:~p AttackTarget:~p", [Code, AttackTarget]),
%					?DEBUG_OUT("[DebugForPetTerritory] Code:~p Camp:~p", [Code, Camp]),
%					MonsterEts = monsterState:getMapMonsterEts(Code),
%					FunDebug =
%						fun(#recMapObject{code = Code_, camp = Camp_, hp = Hp}, _) ->
%							case Camp =/= Camp_ of
%								true ->
%									?DEBUG_OUT("[DebugForPetTerritory] Code:~p Code_:~p Hp:~p", [Code, Code_, Hp]);
%								_ ->
%									skip
%							end
%						end,
%					ets:foldl(FunDebug, 0, MonsterEts),
%					monsterState:setHateList(Code, []);
%				_ ->
%					skip
%			end;
%		_ ->
%			skip
%	end.

getMonsterType(Code)->
	MonID = monsterState:getId(Code),
	case getCfg:getCfgByArgs(cfg_monster, MonID) of
		#monsterCfg{monsterSubType = SubType} -> SubType;
		_->0
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================
%searchEnemy2(528, Code,TargetType,HateList,WatchRadius,Ets,ObjType,X,Y,GroupID) ->
%	case HateList of
%		[] ->
%			SelfCamp = monsterState:getCamp(Code),
%			Match = mapView:getNearViewObject(monsterState:getMapPid(Code),Ets, ObjType, {X, Y}, GroupID),
%			case Match of
%				[] ->
%					skip;
%				_ ->
%					Ctrler = [Obj || #recMapObject{type = Type} = Obj <- Match,Type =:= ?ObjTypePlayer orelse Type =:= ?ObjTypePet],
%					selectEnemy(Code,WatchRadius,X,Y,Ctrler)
%			end;
%		_ ->
%			skip
%	end.

searchEnemy1(Code,TargetType,HateList,WatchRadius,Ets,ObjType,X,Y,GroupID) ->
	case HateList of
		[] ->
			SelfCamp = monsterState:getCamp(Code),
			Match = mapView:getNearViewObject(monsterState:getMapPid(Code),Ets, ObjType, {X, Y}, GroupID),
			case Match of
				[] ->
					skip;
				_ ->
					case TargetType of
						?BST_SELTARGET_ENEMY_CTRLER -> %%选择玩家
							Ctrler = [Obj || #recMapObject{type = Type, hp = CurHp} = Obj <- Match,Type =:= ?ObjTypePlayer orelse Type =:= ?ObjTypePet, CurHp > 0],
							selectEnemy(Code,WatchRadius,X,Y,Ctrler);
						?BST_SELTARGET_ENEMY_MONSTER -> %%选择怪物
							Ctrler = [Obj || #recMapObject{code = TargetCode,type = Type,camp = Camp} = Obj <- Match,Type =:= ?ObjTypeMonster,TargetCode =/= Code,SelfCamp =/= Camp],
							selectEnemy(Code,WatchRadius,X,Y,Ctrler);
						?BST_SELTARGET_ENEMY_MONSTER_FIRST -> %%首先选择怪物，没有则选择玩家
							Ctrler = [Obj || #recMapObject{code = TargetCode,type = Type,camp = Camp} = Obj <- Match,Type =:= ?ObjTypeMonster,TargetCode =/= Code,SelfCamp =/= Camp],
							case selectEnemy(Code,WatchRadius,X,Y,Ctrler) of
								true ->
									%%找到目标怪物
									skip;
								_ ->
									%%没找到目标怪物，则找目标玩家
									PlayerEts = monsterState:getMapPlayerEts(Code),
									searchEnemy1(Code,?BST_SELTARGET_ENEMY_CTRLER,HateList,WatchRadius,PlayerEts,?ObjTypePlayer,X,Y,GroupID)
							end;
						_ ->
							MonsterGuildID = monsterState:getGuildID(Code),
							Fun =
								fun(#recMapObject{camp = Camp, guild = PlayerGuildID} = Target, Acc) ->
									IsSameGuild = camp:isSameGuild(?ObjTypePlayer, MonsterGuildID, PlayerGuildID),
									Res =
										case camp:getBattleRelation(SelfCamp, Camp) of
											national ->
												camp:getBattleCampRelation(SelfCamp, Camp);
											pve ->
												camp:getPveCampRelation(SelfCamp, Camp, IsSameGuild);
											other ->
												camp:getBattleOtherCampRelation(SelfCamp, Camp);
											_ ->
												skip
										end,
									case Res of
										?EnemyCamp ->
											[Target | Acc];
										_ ->
											Acc
									end
								end,
							selectEnemy(Code,WatchRadius,X,Y,lists:foldl(Fun, [], Match))
					end,
					ok
			end;
		_ ->
			%% 20170328
			%% 新版骑宠领地
			%% 问题描述：A骑宠打死B骑宠后，A骑宠愣住不动，（注：AI[2,5,1]）
			%% 观察结果：A骑宠攻击目标失效，但仇恨列表不为空，寻怪心跳始终跳过
			%% 解决方式：当攻击目标失效时，从仇恨列表中选择一个作为攻击目标
			%% 注意：如果影响其它模块，请在此处加上条件限制
			case monsterState:getAttackTarget(Code) of
				undefined ->
					[#recHate{hateCode = HateCode} | _] = HateList,
					monsterState:setAttackTarget(Code, HateCode);
				_ ->
					skip
			end,
			skip
%%			AttackTarget = monsterState:getAttackTarget(Code),
%%			case getMonsterType(Code) of
%%			   ?MonsterSTypeTower when AttackTarget =:= undefined ->
%%				   case HateList of
%%					   [#recHate{hateCode = HateCode} | _] ->
%%						   ?ERROR_OUT("spcial code, change Target"),
%%						   monsterState:setAttackTarget(Code, HateCode),
%%						   monsterBattle:setAIBattleCondEvent(Code);
%%					   _ ->
%%						   skip
%%				   end;
%%			   _ ->
%%				   skip
%%			end
	end.

selectEnemy(Code,WatchRadius,X,Y,Match) ->
	TargetCode = filterEnemy(WatchRadius * WatchRadius,X,Y,Match),
	case TargetCode > 0 of
		true ->
			monsterState:setAttackTarget(Code, TargetCode),
			monsterBattle:setAIBattleCondEvent(Code),
			true;
		_ ->
			false
	end.

-spec filterEnemy(WSQR,X,Y,ObjList) -> Code::uint() when
	WSQR::uint(),X::float(),Y::float(),ObjList::[#recMapObject{},...] | [].
filterEnemy(_WSQR,_X,_Y,[]) ->
	0;
filterEnemy(WSQR,X,Y,[#recMapObject{actionStatus = ?CreatureActionStatusChangeMap} | T]) ->
	filterEnemy(WSQR,X,Y,T);
filterEnemy(WSQR,X,Y,[#recMapObject{code = TargetCode,x = TX,y = TY,hp = Hp} | T]) ->
	SQR = misc:calcDistSquare(X, Y, TX, TY),
	case SQR =< WSQR andalso Hp > 0 of
		true ->
			TargetCode;
		_ ->
			filterEnemy(WSQR,X,Y,T)
	end.
