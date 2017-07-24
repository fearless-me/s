%% @author zhengzhichun
%% @doc @todo 日常玩法--魔神地宫（基于副本）.


-module(copyMapDemonBattle).
-include("mapPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	addMonster/2,
	initFirstSchedule4demonBattle/1,
	noticeTime/3,
	noticeMonsterNum/0,
	noticeScheduleStatus/1,
	noticeGift/0,
	initSchedule/0,
	createPropCallback/2,
	createPropCallback_Rift/1,
	createPropCallback_Mirror/1,
	createPropCallback_CopyMap/1,
	createPropCallback_EscortPower/1,
	createPropCallback_EscortGharry/1,
	noticeCanDieCount/0,
	getXYByRand/2,
	send2PlayerSchduleInfo/1,
    createProp_WorldLevel/3
]).




%%刷地宫动态进度怪
addMonster(MapLevel, ScheduleNum) ->
	Type = 2,%%战斗剩余时间
	Cnf = mapState:getCnfFromdic(),
	noticeTime(Type,Cnf#copyMapDemonBattleCnf.fableChallengetimeNum,Cnf#copyMapDemonBattleCnf.fableCurrentSchedule),
	
	LocationInstanceList = getMonsterRecList(ScheduleNum),
	CallBack = createPropCallback(MapLevel, ScheduleNum),
	mapBase:spawnAllMonster(LocationInstanceList,CallBack,MapLevel),
	
	mapState:addMapAliveMonsterNum(erlang:length(LocationInstanceList)),%%当前的怪物数
	noticeMonsterNum(),
	ok.

%%根据波数，取出相应的种怪位置配置
-spec getMonsterRecList(ScheduleNum)->[#recMapObjData{},...] when  ScheduleNum::uint().
getMonsterRecList( ScheduleNum )->
	LocList = getCfg:get1KeyList(cfg_demonBattleLoc),
	case getLoc(LocList, ScheduleNum) of
		skip ->
			skip;
		{MonsterLocationList,BossLocation} ->
			{MonsterList,BossList} = getMonsterCnfByRand(),%%随机出一组怪物ID
			getMonsterRec(MonsterLocationList,BossLocation,MonsterList,BossList)%%生成地图怪物实例
	end.

%%取出种怪位置集（小怪位置集、boss位置）
getLoc(LocList, CurrScheduleNum) ->
	Fun = fun(OneID, Acc) ->
				  case getCfg:getCfgPStack(cfg_demonBattleLoc, OneID) of
					  #demonBattleLocCfg{turns = TurnsNum} = SelectCfg when erlang:is_integer(Acc) andalso CurrScheduleNum =< TurnsNum ->
						  {break, SelectCfg};
					  _Other ->
						  Acc
				  end
		  end,
	
	case misc:mapAccList(LocList, 0, Fun) of
		#demonBattleLocCfg{monsterLoc = MonsterLocList, bossLoc=BossLoc} ->
			{MonsterLocList, BossLoc};
		_Other ->
			?ERROR_OUT("demonBattleLocCfg err:~p",[_Other]),
			skip
	end.


%%随机取出一组怪物配置（{小怪集、BOSS集}）
getMonsterCnfByRand() ->
	case getCfg:get1KeyList(cfg_demonBattleID) of
		GroupList when erlang:is_list(GroupList) ->
			GroupID = getElementByRand(GroupList),
			case getCfg:getCfgPStack(cfg_demonBattleID, GroupID) of
				#demonBattleIDCfg{monster = MS, boss = Boss}=_Row ->
					{MS,Boss};
				_OtherRow ->
					?ERROR_OUT("cfg_demonBattleID:getRow(~p)=~p",[GroupID,_OtherRow])
			end;
		_Other ->
			?ERROR_OUT("cfg_demonBattleID:err ~p",[_Other])
	end.

%%根据位置和怪物ID生成怪物RECORD
getMonsterRec(MonterLocationS,BossLocation,MonsterIDS,BossIDS) ->
	MonsterFun = fun({X,Y},MonsterAcc) ->
						 MsIDList = getElementByRand(MonsterIDS),
						 CreateMonsterObj = fun(ID) ->
													{X1,Y1} = getXYByRand(X,Y),
													#recMapObjData{id = ID,mapX = erlang:float(X1),mapY = erlang:float(Y1)}
											end,
						 
						[CreateMonsterObj(ID) || ID <- MsIDList] ++ MonsterAcc
				 end,
	MonsterInstanceS = lists:foldl(MonsterFun,[], MonterLocationS),
	%%BOSS
	[BossX,BossY] = BossLocation,
	{BossX1,BossY1} = getXYByRand(BossX,BossY),
	[BossID] = getElementByRand(BossIDS),
	[#recMapObjData{id = BossID,mapX = erlang:float(BossX1),mapY = erlang:float(BossY1)} | MonsterInstanceS].


%%返回怪物属性修改回调ScheduleNum
-spec createPropCallback(MapLevel::uint32(), ScheduleNum::uint32()) ->fun() .
createPropCallback(_MapLevel, _ScheduleNum) ->
	case mapState:getMapId() of
		190 ->
			skip;
		MapID ->
			?WARN_OUT("createPropCallback will not use indexGrowth.index21~indexGrowth.index26 in MapID:~p", [MapID])
	end,
	Fun = fun(P) -> P
		  % LUNA-1361 【服务器】【守卫女神】怪物属性不和IndexGrowth关联
			%(PropList) when erlang:is_list(PropList)->
			%	  #indexGrowthCfg{index21=Index21,index22=Index22,index23=Index23}
			%						 = getCfg:getCfgPStack(cfg_indexGrowth, MapLevel),
			%	  #indexGrowthCfg{index24=Index24,index25=Index25,index26=Index26}
			%						 = getCfg:getCfgPStack(cfg_indexGrowth, ScheduleNum),
			%
			%	  Base1 = updateItemBase([?Prop_holydamage,?Prop_physicaldamage,?Prop_shadowdamage,?Prop_elementdamage], Index21*Index24, PropList),
			%	  Base2 = updateItemBase([?Prop_holyresist,?Prop_physicalresist,?Prop_shadowresist,?Prop_elementresist],Index22*Index25, Base1),
			%	  Base3 = updateItemBase([?Prop_MaxHP],Index23*Index26,Base2),
%% 			%	  ?DEBUG_OUT("createPorpCallback:~p,~w~w~w--------~w",[self(),MapLevel, ScheduleNum,PropList,Base3]),
			%	  Base3;
			%(PropList) ->
			%	  ?DEBUG_OUT("createPorpCallback:~p,~w~w~w",[self(),MapLevel, ScheduleNum,PropList]),
			%	  PropList
		  end,
	Fun.

%% 时空裂痕返回怪物属性修改回调ScheduleNum
-spec createPropCallback_Rift(MapLevel::uint32() ) ->fun() .
createPropCallback_Rift(MapLevel) ->
	Fun = fun
		(PropList) when erlang:is_list(PropList)->
			#indexGrowthCfg{index27=Index27,index28=Index28,index29=Index29} = getCfg:getCfgPStack(cfg_indexGrowth, MapLevel),
			Base3 = updateItemBase([?Prop_MaxHP],Index29,PropList),
			Base3;
		(PropList) ->
			PropList
	end,
	Fun.

%% 刷怪物时，属性匹配玩家等级
-spec createPropCallback_EscortPower(PlayerLevel::uint32() ) ->fun() .
createPropCallback_EscortPower(PlayerLevel) ->
	Fun = fun
		(PropList) when erlang:is_list(PropList)->
			#indexGrowthCfg{index33=Index33,index34=Index34} = getCfg:getCfgPStack(cfg_indexGrowth, PlayerLevel),
			Base3 = updateItemBase([?Prop_MaxHP],Index34,PropList),
			Base3;
		(PropList) ->
			PropList
	end,
	Fun.

%% 刷马车时，修正马车的血量
-spec createPropCallback_EscortGharry(HDRatio::float()) ->fun() .
createPropCallback_EscortGharry(HDRatio) ->
	Fun = fun
		(PropList) when erlang:is_list(PropList)->
			Base3 = updateItemBase([?Prop_MaxHP],HDRatio,PropList),
			Base3;
		(PropList) ->
			PropList
	end,
	Fun.

%%王者战天下
-spec createPropCallback_Mirror(PropKvList::list() ) ->fun() .
createPropCallback_Mirror(PropKvList) ->
	Fun = fun
		(PropList) when erlang:is_list(PropList)->
			%%缺少了法术防御
%%			Base2 = updateItemBase([?Prop_MaxHP,?Prop_physicaldefence,?Prop_critical,?Prop_becritical,?Prop_tough,?Prop_hitratio,?Prop_dodge,?Prop_ArmorPenetrationLevel], Percent, PropList),
			 replaceItemBase(PropKvList, PropList);
		(PropList) ->
			PropList
	end,
	Fun.

%% 普通副本难度，怪物属性改变回调
-spec createPropCallback_CopyMap(Difficulty::uint32() ) ->fun() .
createPropCallback_CopyMap(Difficulty) ->
	Fun = fun
		(PropList) when erlang:is_list(PropList)->
			#indexGrowthCfg{index30=Index30,index31=Index31} = getCfg:getCfgPStack(cfg_indexGrowth, Difficulty),
			Base2 = updateItemBase([?Prop_MaxHP], Index31, PropList),
			Base2;
		(PropList) ->
			PropList
	end,
	Fun.

%% 世界等级改变指定怪物属性
-spec createProp_WorldLevel(Code ::uint(), LevelList ::uint(), PropList ::list()) -> list().
createProp_WorldLevel(Code, LevelList, PropList) ->
        case LevelList of
	        [IndexDamage, IndexMaxHp] ->
				WorldLevel = core:getWorldLevel(),
                case erlang:is_list(PropList) andalso erlang:length(PropList) > 0 of
                    true ->
						monsterState:setLevel(Code, WorldLevel),
						monsterState:setMonsterWorldLevel(Code, WorldLevel),
                        DamageIndex = buff:getIndexGrowthValue(WorldLevel,IndexDamage),
                        MaxHpIndex = buff:getIndexGrowthValue(WorldLevel,IndexMaxHp),
                        Base2 = updateItemBase([?Prop_MaxHP], MaxHpIndex, PropList),
                        Base2;
                    _ ->
                        PropList
                end;
			_ ->
				PropList
        end.

%%@NewPropKvList=[{PropIndex,Value},{PropIndex1,Value1},]
%%@PropList 属性列表
%%@return  [#battleProp{},...]
replaceItemBase(NewPropKvList, PropList) ->

	Fun = fun
					({?Prop_MaxHP,NewValue},List) ->
						%%这里一定会找到这个索引
						BP = lists:keyfind(?Prop_MaxHP, #battleProp.propIndex, List),
						BattleProp = BP#battleProp{
							baseValue = NewValue,
							isModified = true
						},
						lists:keystore(?Prop_MaxHP, #battleProp.propIndex, List, BattleProp);
					({Prop,NewValue},List) ->
						%%这里一定会找到这个索引
						BP = lists:keyfind(Prop, #battleProp.propIndex, List),
						BattleProp = BP#battleProp{
							baseValue = NewValue,
							isModified = true
						},
						lists:keystore(Prop, #battleProp.propIndex, List, BattleProp)
				end,
	lists:foldl(Fun, PropList, NewPropKvList).






-spec updateItemBase(PropIndexList, Multiplier1, PropList) -> [#battleProp{},...] | [] when PropIndexList::list(), Multiplier1::float(), PropList::[].
updateItemBase(PropIndexList, Multiplier1, PropList) ->
	Multiplier = 
	case Multiplier1 =< 0 of
		true -> 
			?ERROR_OUT("updateItemBase err baseValue<0 ~p",[Multiplier1]),
			1;
		_ ->Multiplier1
	end,
	Fun = fun
			 (?Prop_MaxHP,List) ->
				  %%这里一定会找到这个索引
				  BP = lists:keyfind(?Prop_MaxHP, #battleProp.propIndex, List),
				  BattleProp = BP#battleProp{
											 baseValue = BP#battleProp.baseValue * Multiplier,
											 isModified = true
											},
				  lists:keystore(?Prop_MaxHP, #battleProp.propIndex, List, BattleProp);
			 (Prop,List) ->
				  %%这里一定会找到这个索引
				  BP = lists:keyfind(Prop, #battleProp.propIndex, List),
				  BattleProp = BP#battleProp{
											 baseValue = BP#battleProp.baseValue * Multiplier,
											 isModified = true
											},
				  lists:keystore(Prop, #battleProp.propIndex, List, BattleProp)
		  end,
	lists:foldl(Fun, PropList, PropIndexList).

%%第一次有人进入地图，初始化第一关
initFirstSchedule4demonBattle(PlayerPid) ->
	MapID = mapState:getMapId(),
	case mapState:getCnfFromdic() of
		Cnf when erlang:is_record(Cnf, copyMapDemonBattleCnf) ->
			CurrScheduleNum = Cnf#copyMapDemonBattleCnf.fableCurrentSchedule,
			case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
				#mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeDemonBattle} when CurrScheduleNum =:= 0 ->
					
					PrepareTimeNum = Cnf#copyMapDemonBattleCnf.fablePreparetimeNum,
					ChallengetimeNum = Cnf#copyMapDemonBattleCnf.fableChallengetimeNum,
					mapState:setCnf2dic(Cnf#copyMapDemonBattleCnf{
																			fableCurrentSchedule = 1,
																			fableMapLevelCoefficient = mapState:getMapLevel(0),
																			fablePreparetimeEnd = time:getUTCNowSec()+PrepareTimeNum,
																			fableChallengetimeEnd = time:getUTCNowSec()+PrepareTimeNum+ChallengetimeNum
																		   }),
					initSchedule();
				_ ->
					%%发送给中途进入的玩家当前时间（怪物数）提示
					send2PlayerSchduleInfo(PlayerPid),
					skip
			end;
		_ ->
			skip
	end.
%%初始化进度
initSchedule() ->
	Cnf = mapState:getCnfFromdic(),
	Type = 1,%%准备时间
	noticeTime(Type,Cnf#copyMapDemonBattleCnf.fablePreparetimeNum,Cnf#copyMapDemonBattleCnf.fableCurrentSchedule),
	erlang:send_after(1000*Cnf#copyMapDemonBattleCnf.fablePreparetimeNum, self(), {randAddMonster,self(),{Cnf#copyMapDemonBattleCnf.fableMapLevelCoefficient, Cnf#copyMapDemonBattleCnf.fableCurrentSchedule} }),
	ok.

%%中途进入的玩家，同步进度信息
-spec send2PlayerSchduleInfo(PlayerPid::pid()) ->ok.
send2PlayerSchduleInfo(PlayerPid) ->
	Cnf = mapState:getCnfFromdic(),
	
	CurrentSchedule = Cnf#copyMapDemonBattleCnf.fableCurrentSchedule,
	AliveMonster = mapState:getMapAliveMonsterNum(),
	case AliveMonster of
		undefined ->
			%%准备战斗中
			Second= Cnf#copyMapDemonBattleCnf.fablePreparetimeEnd - time:getUTCNowSec(),
			Msg = #pk_GS2U_CopyMapProcessCurrentScheduleSurplusSecond{
																	  curSchedule = CurrentSchedule,
																	  type = 1,%%1为准备；2为战斗
																	  surplusSecond = Second
																	 },
			psMgr:sendMsg2PS(PlayerPid, sendNetMsg, {Msg}),
			ok;
		_ ->
			%%战斗中
			Second = Cnf#copyMapDemonBattleCnf.fableChallengetimeEnd - time:getUTCNowSec(),
			Msg = #pk_GS2U_CopyMapProcessCurrentScheduleSurplusSecond{
																	  curSchedule = CurrentSchedule,
																	  type = 2,%%1为准备；2为战斗
																	  surplusSecond = Second
																	 },
			psMgr:sendMsg2PS(PlayerPid, sendNetMsg, {Msg}),
			
			Msg2 = #pk_GS2U_monsterChange{number = AliveMonster },
			psMgr:sendMsg2PS(PlayerPid, sendNetMsg, {Msg2}),
			ok
	end.

%%广播本进度准备/战斗剩余时间
-spec noticeTime(Type::1|2, Second::uint32(), CurrentSchedule::uint16()) ->ok.
noticeTime(Type, Second, CurrentSchedule) ->
	Fun = fun(#recMapObject{pid=PlayerPid}) ->
				  Msg = #pk_GS2U_CopyMapProcessCurrentScheduleSurplusSecond{
																			curSchedule = CurrentSchedule,
																			type = Type,
																			surplusSecond = Second
																		   },
				  psMgr:sendMsg2PS(PlayerPid, sendNetMsg, {Msg}),
				  ?DEBUG_OUT("prepare:~w",[PlayerPid])
		  end,
	gameMapLogic:doFun4AllPlayer(Fun).

%%广播怪物变化数量
noticeMonsterNum() ->
	Num = 
		case mapState:getMapAliveMonsterNum() of
			undefined ->
				0;
			Val ->
				Val
		end,
	
	Fun = fun(#recMapObject{pid=PlayerPid}) ->
				  Msg = #pk_GS2U_monsterChange{number = Num },
				  psMgr:sendMsg2PS(PlayerPid, sendNetMsg, {Msg})
		  end,
	gameMapLogic:doFun4AllPlayer(Fun).

%%广播进度成功/失败(0/1)
-spec noticeScheduleStatus(Status) -> ok when Status::0|1.
noticeScheduleStatus(Status) ->
	Cnf = mapState:getCnfFromdic(),
	Fun = fun(#recMapObject{pid=PlayerPid}) ->
				  Msg = #pk_GS2U_CopyMapProcessCurrentScheduleStatus{
																	 curSchedule = Cnf#copyMapDemonBattleCnf.fableCurrentSchedule,
																	 status = Status
																	},
				  psMgr:sendMsg2PS(PlayerPid, sendNetMsg, {Msg}),
				 
				  ?DEBUG_OUT("ScheduleStatus:~w",[PlayerPid])
		  end,
	gameMapLogic:doFun4AllPlayer(Fun).

noticeGift() ->
	Cnf = mapState:getCnfFromdic(),
	MapLevel = Cnf#copyMapDemonBattleCnf.fableMapLevelCoefficient,
	CurrSchedule = Cnf#copyMapDemonBattleCnf.fableCurrentSchedule,
	Fun = fun(#recMapObject{id = RoleID, pid=PlayerPid}) ->
		case core:isAssistCopyMapByCopyMapPID(RoleID, self()) of
			true ->
				skip;
			_ ->
				psMgr:sendMsg2PS(PlayerPid, demonBattleAward, {MapLevel,CurrSchedule})
		end
		  end,
	gameMapLogic:doFun4AllPlayer(Fun).

noticeCanDieCount() ->
	MapID = mapState:getMapId(),
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{subtype=?MapSubTypeDemonBattle} ->
			#copyMapDemonBattleCnf{fableDie = CanDieCnt}=mapState:getCnfFromdic(),
			DiedNum = mapState:getAllPlayersDeadTimes(0),
			
%% 			?DEBUG_OUT("========~w--~w",[CanDieCnt,DiedNum]),
			Surplus = CanDieCnt - DiedNum+1,
			Msg = playerMsg:getErrorCodeMsg(?ErrorCode_CanDieCount, [Surplus]),
			Fun = fun(#recMapObject{pid=PlayerPid}) ->
						  psMgr:sendMsg2PS(PlayerPid, sendNetMsg, {Msg})
				  end,
			if 
				Surplus > 0 ->
					gameMapLogic:doFun4AllPlayer(Fun);
				true ->
					skip
			end;
		_ ->
			skip
	end.


-spec getXYByRand(X1::number(),Y1::number()) ->tuple().
getXYByRand(X1,Y1) ->
	X = erlang:float(X1),
	Y = erlang:float(Y1),
%% 	YX = copyMapScheduleInit:getAddMonsterPos(X,Y,4.0),
%% 	YX.
	{X, Y}.


-spec getElementByRand(List) ->term() when List::list().
getElementByRand(List) when erlang:is_list(List)->
  Rand = misc:rand(1, erlang:length(List)),
  lists:nth(Rand,List).

