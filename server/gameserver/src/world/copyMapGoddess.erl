%% @author zhengzhichun
%% @doc @todo Add description to copyMapGoddess.
%% 新地宫（守护女神）策划：王亚栋


-module(copyMapGoddess).
-include("mapPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 initCnf/1,
		 createMonster/2,
		 initFirstSchedule4demonBattle/1,
		 initBoss/0,
		 goddessBeKilled/2,
		 initSchedule/0,
		 goddessSettlement/0
		]).


%%根据mapid来看是否要加载地宫玩法
-spec initCnf(MapID) ->ok when MapID::uint().
initCnf(MapID) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeDemonBattle} ->
			mapState:setMapSubType(?MapSubTypeDemonBattle),
			?DEBUG_OUT("=========================+++++++++++++++++"),
			setCnf2dic();
		_Other ->
			skip
	end,
	ok.

-spec setCnf2dic() ->#copyMapDemonBattleCnf{}.
setCnf2dic() ->
	#globalsetupCfg{settype = 'fable_die',setpara = [Die |_]} = getCfg:getCfgPStack(cfg_globalsetup, 'fable_die'),
	#globalsetupCfg{settype = 'fable_preparetime',setpara = [Preparetime|_]} = getCfg:getCfgPStack(cfg_globalsetup, 'fable_preparetime'),
	#globalsetupCfg{settype = 'fable_challengetime',setpara = [Challengetime|_]} = getCfg:getCfgPStack(cfg_globalsetup, 'fable_challengetime'),
	#globalsetupCfg{settype = 'fable_challengetime',setpara = [Challengetime|_]} = getCfg:getCfgPStack(cfg_globalsetup, 'fable_challengetime'),
	NowUTC = time:getUTCNowSec(),
	AllSchedule = erlang:length( getCfg:get1KeyList(cfg_goddess) ),
	Cnf = #copyMapDemonBattleCnf{
								 fableAllSchedule = AllSchedule,
								 
								 fableDie = Die,
								 fablePreparetimeNum = Preparetime,
								 fablePreparetimeEnd = NowUTC+Preparetime,
								 fableChallengetimeNum = Challengetime,
								 fableChallengetimeEnd = NowUTC+Preparetime+Challengetime
								},
	mapState:setCnf2dic(Cnf).

%%动态产指定怪
-spec createMonster(LocationInstanceList::[#recMapObjData{}],MapLevel::uint16()) ->ok.
createMonster(LocationInstanceList,MapLevel) ->
	Cnf = mapState:getCnfFromdic(),
	
	CallBack = copyMapDemonBattle:createPropCallback( MapLevel, Cnf#copyMapDemonBattleCnf.fableCurrentSchedule ),
	mapBase:spawnAllMonster(LocationInstanceList,CallBack,MapLevel),
	ok.


%%第一次有人进入地图，初始化第一关
-spec initFirstSchedule4demonBattle(PlayerPid::pid()) ->ok |skip.
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
					
%% 					initGoddess( mapState:getMapLevel(0) ),
					#globalsetupCfg{settype = 'fable_preparetime',setpara = [Preparetime|_]} = getCfg:getCfgPStack(cfg_globalsetup, 'fable_preparetime'),
					Type = 1,%%准备时间(第一关)
					copyMapDemonBattle:noticeTime(Type,Preparetime,1),
					erlang:send_after(Preparetime*1000, self(), {mapOtpAfterDo,fun initSchedule/0 });
				_ ->
					%%发送给中途进入的玩家当前时间（怪物数）提示
					copyMapDemonBattle:send2PlayerSchduleInfo(PlayerPid),
					skip
			end;
		_ ->
			skip
	end.

%%给女神回血（20%）
-spec backGoddessHp() ->ok.
backGoddessHp() ->
	MonsterCode1 = mapState:getGoddessCode(),
	
	doBackGoddessHp(MonsterCode1),
	ok.

%%回血并公告本地图所有玩家
-spec doBackGoddessHp(MonsterCode::uint32()) ->ok.
doBackGoddessHp(MonsterCode) when erlang:is_number(MonsterCode) andalso MonsterCode >0 ->
	Hp = monsterState:getCurHp(MonsterCode),
	MaxHp = monsterState:getBattlePropTotal(MonsterCode,?Prop_MaxHP),
	#globalsetupCfg{settype = 'goddess_lamb',setpara = [BackRate|_]} = getCfg:getCfgPStack(cfg_globalsetup, 'goddess_lamb'),
	%%按比例回血
	NewHp = 
		case Hp + BackRate * MaxHp of
			Val when Val>= MaxHp ->
				MaxHp;
			Val ->
				Val
		end,
	PC = skill:getPercent(NewHp, MaxHp),
	monsterState:setCurHp(MonsterCode,NewHp),
	?DEBUG_OUT("zzc==========backupHP new[~w],old[~w]",[NewHp,Hp]),
	Fun = fun(#recMapObject{pid=PlayerPid}) ->
				  Msg = #pk_GS2U_BroadcastPlayerHpPC{
													 code = MonsterCode,
													 hpPC =PC
													},
				  psMgr:sendMsg2PS(PlayerPid, sendNetMsg, {Msg})
		  end,
	gameMapLogic:doFun4AllPlayer(Fun),
	ok;
doBackGoddessHp(_MonsterCode) ->
	ok.

-spec goddessBeKilled(MonsterID::uint32(), AttackerCode::uint64()) ->term().
goddessBeKilled(MonsterID,AttackerCode) ->
	#globalsetupCfg{setpara =[ID,_X,_Y] } = getCfg:getCfgByArgs(cfg_globalsetup, goddess),
	if
		MonsterID =:= ID ->
			?LOG_OUT("goddessBeKilled MapPid:~p attackerCode:~p",[self(),AttackerCode]),
			mapState:setGoddessDead(true);
		true ->
			skip
	end.

%%广播所有玩家结算界面
-spec goddessSettlement() ->ok.
goddessSettlement() ->
	EndTime = time:getUTCNowMS(),				%% 完成时间
	StartTime = mapState:getMapStartTime(0),		%% 开始时间
	DiffTime = erlang:trunc( (EndTime - StartTime) / 1000 ),
	
	Fun = fun(#recMapObject{pid=PlayerPid}) ->
				  psMgr:sendMsg2PS(PlayerPid, goddessSettlement,{DiffTime, mapState:getMapId()})
		  end,
	gameMapLogic:doFun4AllPlayer(Fun).

%%小怪杀完，看要产精英怪不，看要不要进下一关
-spec initBoss() ->ok | scheduleEnd | Interval when
		  Interval::uint32().
initBoss() ->
	Cnf = mapState:getCnfFromdic(),
	IsBossing = mapState:getGoddessBossing(),
	case getCfg:getCfgByArgs(cfg_goddess, Cnf#copyMapDemonBattleCnf.fableCurrentSchedule) of
		#goddessCfg{
					boss_ID=BossList, boss_num=Num,interval=Interval
				   } ->
			case BossList of
				[[_,_,_]] when not IsBossing->
					getMonsterRec(Cnf#copyMapDemonBattleCnf.fableMapLevelCoefficient,BossList,0,Num,1),
					AllNum = erlang:length(BossList)*Num,
					%%当前的怪物数
					mapState:addMapAliveMonsterNum(AllNum),
					mapState:setGoddessBossing(true),
					copyMapDemonBattle:noticeMonsterNum(),
					ok;
				_ when Cnf#copyMapDemonBattleCnf.fableCurrentSchedule < Cnf#copyMapDemonBattleCnf.fableAllSchedule ->
					mapState:setCnf2dic(Cnf#copyMapDemonBattleCnf{
														 fableCurrentSchedule = Cnf#copyMapDemonBattleCnf.fableCurrentSchedule+1
														 }),
					Type = 1,%%准备时间
					copyMapDemonBattle:noticeTime(Type,erlang:trunc(Interval/1000),Cnf#copyMapDemonBattleCnf.fableCurrentSchedule+1),
					backGoddessHp(),
					Interval;
				_ ->
					scheduleEnd
			end;
		_ ->
			scheduleEnd
	end.

%%初始化进度
-spec initSchedule() ->ok|skip.
initSchedule() ->
	Cnf = mapState:getCnfFromdic(),
	case getCfg:getCfgByArgs(cfg_goddess, Cnf#copyMapDemonBattleCnf.fableCurrentSchedule) of
		#goddessCfg{
					monsterA_ID = MonsterAList,
					monsterA_num = ANum,
					monsterA_cd = ACD,
					monsterB_ID = MonsterBList,
					monsterB_num = BNum,
					monsterB_cd = BCD,
					monsterC_ID = MonsterCList,
					monsterC_num = CNum,
					monsterC_cd = CCD
					} ->
			?DEBUG_OUT("zzc===========fableMapLevelCoefficient==~p",[Cnf#copyMapDemonBattleCnf.fableMapLevelCoefficient]),
			getMonsterRec(Cnf#copyMapDemonBattleCnf.fableMapLevelCoefficient,MonsterAList,ACD,ANum,1),
			getMonsterRec(Cnf#copyMapDemonBattleCnf.fableMapLevelCoefficient,MonsterBList,BCD,BNum,1),
			getMonsterRec(Cnf#copyMapDemonBattleCnf.fableMapLevelCoefficient,MonsterCList,CCD,CNum,1),
			AllNum = erlang:length(MonsterAList)*ANum + erlang:length(MonsterBList)*BNum+erlang:length(MonsterCList)*CNum,
			%%当前的怪物数
			mapState:addMapAliveMonsterNum(AllNum),
			copyMapDemonBattle:noticeMonsterNum(),
			mapState:setGoddessBossing(false),
			ok;
		_ ->
			?DEBUG_OUT("goddessCfg err"),
			skip
	end,
	ok.

%%刷一组怪
-spec getMonsterRec(MonsterLevel::uint16(),IDList::list(),CD::uint16(),MonsterNumber::uint16(),Order::uint16()) ->ok.
getMonsterRec(_MonsterLevel,[],_CD,_MonsterNumber,_Order) ->
	ok;
getMonsterRec(_MonsterLevel,_IDList,_CD,MonsterNumber,Order) when MonsterNumber < Order ->
	ok;
getMonsterRec(MonsterLevel,IDList,CD,MonsterNumber,Order) ->
	Fun = fun
			 ([ID,X,Y],Acc) ->
				  {X1,Y1} = copyMapDemonBattle:getXYByRand(X,Y),
				  [
				   #recMapObjData{id = ID,mapX = erlang:float(X1),mapY = erlang:float(Y1)}
				  | Acc
				  ];
			  (_,Acc) ->
				   Acc
		  end,
	R = lists:foldl(Fun, [], IDList),
	?DEBUG_OUT("times==================~p level[~w]",[CD*Order,MonsterLevel]),
	case R of
		[#recMapObjData{} | _] ->
			erlang:send_after(CD*(Order-1), self(), {randAddMonster,self(),{R,MonsterLevel} });
		_ ->
			skip
	end,
	getMonsterRec(MonsterLevel,IDList,CD,MonsterNumber,Order + 1).
