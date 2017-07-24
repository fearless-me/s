%%
%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 用于处理单个副本中的逻辑
%%% @end
%%% Created : 04. 七月 2014 14:22
%%%-------------------------------------------------------------------
-module(gameMapLogic).
-author("tiancheng").

-include("mapPrivate.hrl").

%% API
-export([
	init/1,
	initCopyMapSchedule/1,
	tickMap/1,
	kickAll/0,
	clearGroupAllObject/1,
	kickAllPlayer/1,
	destroyAllMonster/0,
	destroyAllMonster/1,
	destroyAllMonsterByID/1,
	getMapID/1,
	doFun4AllPlayer/1,
	destroyMonster/2,
	destroyCollect/2,
	destroyNpc/2,
	prepareDestroy/2,
	createWarriorTrialBoss/1,
	getMonsterNumByID/1,
	eraseGroup/1,
	getMonsterCodeByID/1,
	sendMapLeftTimeToMapPlayer/1
]).

init([#recCreateMapArg{mapId = MapID, createRoleID = CreateRoleID, mapCfg = MapCfg}]) ->
	?LOG_OUT("gameMapOtp ID[~p] init",[MapID]),

	%% 怪物初始化
	%%monsterInterface:init(),

	%% 采集物初始化
	gatherNpcMgr:init(),

	%% 注意，如果是第一个进度，则需要重新刷所有怪物
	initMapSchedule(MapID, CreateRoleID),

	%% 刷对象
	mapBase:spawnAllObject(MapCfg),
	?LOG_OUT("gameMapOtp init OK: ~p, ~p", [self(), MapID]),

	%%初始化哥布林玩法
	goblinLogic:initConfig(),
	%%初始化野外boss
	mapWildBoss:initWildBoss(),
	%% 延迟一个地图心跳给活动进程发消息地图创建好了
	erlang:send_after(?UpdateMapInternal, self(), {delay_send_createmapmsg_to_activity, CreateRoleID}),

	%% map tick
	erlang:send_after(?UpdateMapInternal, self(), tick),
	erlang:send_after(1000, self(), tickUpdateNpcPos),

	WildBossMaoIDList = getMapList(),
	case lists:member(MapID, WildBossMaoIDList) of
		true ->
			%%有野外boss刷的地图
			erlang:send_after(60000, self(), tickFreshWildBoss);
		_ ->
			skip
	end,

	gameMapAcKingBattleAll:createKingStatueToMapOnMapInit(),
	ok.

getMapList()->
	BossIDList = getCfg:get1KeyList(cfg_wildboss),
	Fun = fun(BossID,Arg) ->
		#wildbossCfg{mapID = MapID} = getCfg:getCfgByArgs(cfg_wildboss, BossID),
		[MapID|Arg]
		  end,
	lists:foldl(Fun,[],BossIDList).

%% 初始化副本分组进度
-spec initCopyMapSchedule(GroupID::uint()) -> ok.
initCopyMapSchedule(GroupID) ->
	%%?LOG_OUT("initCopyMapSchedule:~p", [GroupID]),
	mapState:setMapStartTime(GroupID, time:getUTCNowMS()),			%% 地图开始时间，用于副本结算
	mapState:setAllPlayersDeadTimes(GroupID, 0),

	copyMapScheduleState:setOpenBlockList(GroupID, []),
	copyMapScheduleState:setMapSchedule(GroupID, 1),

	copyMapScheduleInit:setCopyMapMaxSchedule(GroupID),   %% 最大进度默认设置为配置的进度，这里可能是会修改的，比如要求角色只需要完成多少进度
	copyMapScheduleInit:initCopyMapSchedule(GroupID, 1),
	copyMapScheduleInit:initParallelScheduleConf(GroupID),

	%% 设置副本已经初始化过了
	mapState:setGroupMapDelayInit(GroupID, false),
	ok.

tickMap(NowTime) ->
	%% 如果当前副本已经完成且副本里没有人了，则立即销毁
	MapID = mapState:getMapId(),
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeNormal} ->
			tickNormalMap(NowTime);
		#mapsettingCfg{type = ?MapTypeActivity, subtype = SubType} ->
			IsEmpty = mapState:getMapPlayerNum() =< 0,
			case SubType of
				?MapSubTypeDarknessReady ->
					%% 黑暗之地准备间，无人时，一分钟后销毁
					case mapState:getDestoryTime() =:= 0 andalso IsEmpty of
						true -> prepareDestroy(60 * 1000, false);
						_ -> skip
					end;
				?MapSubTypeGuildFairground ->
					%% 游乐场地图，无人时销毁
					case mapState:getDestoryTime() =:= 0 andalso IsEmpty of
						true -> prepareDestroy(60 * 1000, false);
						_ -> skip
					end;
				?MapSubTypeDate ->
					%% 消消乐无人时销毁
					case mapState:getDestoryTime() =:= 0 andalso IsEmpty of
						true ->
							prepareDestroy(10 * 1000, false);
						_ -> skip
					end;
				?MapSubTypeDatebox ->
					%% 推箱子无人时销毁
					case mapState:getDestoryTime() =:= 0 andalso IsEmpty of
						true ->
							prepareDestroy(10 * 1000, false);
						_ -> skip
					end;
				?MapSubTypeDatePoolParty ->
					%% 泳池派对无人时销毁
					case mapState:getDestoryTime() =:= 0 andalso IsEmpty of
						true ->
							prepareDestroy(10 * 1000, false);
						_ -> skip
					end;
				?MapSubTypeDateFindTreasure ->
					%% 寻找宝箱
					case mapState:getDestoryTime() =:= 0 andalso IsEmpty of
						true ->
							prepareDestroy(10 * 1000, false);
						_ -> skip
					end;
				_ -> skip
			end,
			tickActivityMap(NowTime);
%%		#mapsettingCfg{subtype = ?MapSubTypeDemonBattle} ->
%%			noScheduleTick(NowTime);
		#mapsettingCfg{subtype = ?MapSubTypeMaterial} ->
			gameMapMaterial:createMonster1By1(NowTime),
			tickNotNormalMap(NowTime);%%包含普通副本的tick
		_ ->
			tickNotNormalMap(NowTime)
	end,

	tickPlayerEts(NowTime),
	timerMgr:tick(NowTime),
	monsterInterface:tick(NowTime),
	gameMapDayNight:tick(NowTime),
	gameMapConvoy:tick(NowTime),
	ok.

%%检查玩家Ets中保存的进程是否存在，如果不存在了，则从Ets中删除，以防止地图进程不能销毁
-spec tickPlayerEts(NowTime) -> ok when NowTime::uint().
tickPlayerEts(NowTime) ->
	Time = mapState:getNextTickPlayerEtsTime(),
	if
		Time > 0 andalso NowTime >= Time ->
			Ets = mapState:getMapPlayerEts(),
			MS = ets:fun2ms(fun(Obj) ->
				{Obj#recMapObject.code,Obj#recMapObject.pid}
							end),
			List = myEts:selectEts(Ets,MS),
			Fun = fun({Code,Pid},AccIn) ->
				case misc:is_process_alive(Pid) of
					true ->
						AccIn + 1;
					_ ->
						myEts:deleteEts(Ets,Code),
						AccIn
				end
				  end,
			TotalNum = lists:foldl(Fun,0,List),
			mapState:setMapPlayerNum(TotalNum),
			%%设置下次检查的时间，30分钟检查一次
			mapState:setNextTickPlayerEtsTime(NowTime + 30000);
		Time =:= 0 ->
			%%设置下次检查的时间，30分钟检查一次
			mapState:setNextTickPlayerEtsTime(NowTime + 30000);
		true ->
			skip
	end,
	ok.


-spec tickNormalMap(NowTime) -> ok when NowTime::uint().
tickNormalMap(NowTime) ->
	case mapState:getDestoryTime() of
		0 ->
			checkDestroy();
		Time ->
			case NowTime >= Time of
				true ->
					%% 立即销毁
					sendDestroyToSelf("NormalMap Destory Time End");
				_ ->
					skip
			end
	end,
	ok.

-spec checkDestroy() -> ok.
checkDestroy() ->
	%%检查地图中是否有人，如果没人则准备60秒后退出进程
	case mapState:getMapPlayerNum() =< 0 of
		true ->
			?LOG_OUT("MapPid:~p Num =< 0, Will Be Destory",[self()]),
			prepareDestroy(?DestoryNormalMapNoBodyTime,false);
		_ ->
			skip
	end,
	ok.

%% 活动地图回收心跳
-spec tickActivityMap(NowTime::uint()) -> ok.
tickActivityMap(NowTime) ->
	MaxTime = mapState:getCopyMapExistTime(),
	case NowTime >= MaxTime of
		false ->
			case mapState:getDestoryTime() of
				0 ->
					skip;
				Time ->
					case NowTime >= Time of
						false ->
							skip;
						true ->
							%% 判断是否要强制销毁
							case mapState:getForceDestory() of
								true ->
									%% 立即销毁
									sendDestroyToSelf("ActivityMap Time End,ForceDestory");
								_ ->
									%% 不强制销毁的时候，判断下副本中的人数
									case mapState:getMapPlayerNum() > 0 of
										true ->
											%% 副本还有人，怎么还有销毁时间？应该在有人进入副本时就清除掉销毁时间的，这里再清一下
											mapState:deleteDestoryTime();
										_ ->
											%% 没人了，结束吧
											sendDestroyToSelf("ActivityMap No Player")
									end
							end
					end
			end;
		_ ->
			?LOG_OUT("tickActivityMap:[mapid=~p,mappid=~p], nowtime:~p, maxtime=~p", [mapState:getMapId(), self(), NowTime, MaxTime]),
			%% 大于活动地图存在最大时间了，立即销毁
			sendDestroyToSelf("ActivityMap Life End")
	end,
	ok.

-spec tickNotNormalMap(NowTime) -> ok when NowTime::uint().
tickNotNormalMap(NowTime) ->
	IsEmpty = mapState:getMapPlayerNum() =< 0,
	%%勇士试炼副本没进度不算完成
	MapPlan = copyMapScheduleState:getMapSchedule(0),
	MaxMapPlan = copyMapScheduleState:getMapScheduleMax(0),
	IsCompleted = case mapState:getMapSubType() of
					  ?MapSubTypeWarrior ->
						  false;
					  ?MapSubTypeMaterial ->
						  false;
					  ?MapSubTypeMoneyDungeon ->
						  false;
					  ?MapSubTypeSpiritArea ->
						  false;
					  _ ->
						  MapPlan >= MaxMapPlan andalso copyMapScheduleComplete:checkCompleteCopyMap(0, 0)
				  end,
	if
		IsEmpty andalso IsCompleted ->
			%%如果已经完成且没人则立即销毁
			sendDestroyToSelf("Not Normal Map PlayerNum =< 0 && Completed");
		IsEmpty ->
			%%?WARN_OUT("CopyMap Num <=0 DT:~p",[mapState:getDestoryTime()]),
			%%如果副本没人则在等待时间内销毁
			case mapState:getDestoryTime() of
				0 ->
					#mapsettingCfg{wait_time = WT} = getCfg:getCfgPStack(cfg_mapsetting, mapState:getMapId()),
					prepareDestroy(WT * 1000,false);
				_ ->
					tickCopyMap(NowTime)
			end;
		IsCompleted ->
			%%如果已经完成了副本，则在完成等待时间内销毁
			case mapState:getDestoryTime() of
				0 ->
					#mapsettingCfg{finish_time = WT} = getCfg:getCfgPStack(cfg_mapsetting, mapState:getMapId()),
					prepareDestroy(WT * 1000, true);
				_ ->
					tickCopyMap(NowTime)
			end;
		true ->
			tickCopyMap(NowTime)
	end,
	ok.

-spec tickCopyMap(NowTime) -> ok when NowTime::uint().
tickCopyMap(NowTime) ->
	MaxTime = mapState:getCopyMapExistTime(),
	case NowTime >= MaxTime of
		false ->
			case mapState:getDestoryTime() of
				0 ->
					skip;
				Time ->
					case NowTime >= Time of
						false ->
							skip;
						true ->
							%% 判断是否要强制销毁
							case mapState:getForceDestory() of
								true ->
									?DEBUG_OUT("NowTime = ~p, MaxTime = ~p", [NowTime, MaxTime]),
									%% 立即销毁
									sendDestroyToSelf("CopyMap Time End,ForceDestory");
								_ ->
									%% 不强制销毁的时候，判断下副本中的人数
									case mapState:getMapPlayerNum() > 0 of
										true ->
											%% 副本还有人，怎么还有销毁时间？应该在有人进入副本时就清除掉销毁时间的，这里再清一下
											mapState:deleteDestoryTime();
										_ ->
											%% 没人了，结束吧
											sendDestroyToSelf("CopyMap No Player")
									end
							end
					end
			end;
		_ ->
			%% 大于副本存在最大时间了，立即销毁
			Msg = playerMsg:getErrorCodeMsg(?ErrorCode_WarriorTrialTimeOut, []),
			sendNetMsgToMapPlayer(mapState:getMapPlayerEts(),Msg),
			sendDestroyToSelf("CopyMap Life End")
	end,
	ok.

%%没有进度的副本类型tick
%%-spec noScheduleTick(NowTime) -> ok when NowTime::uint().
%%noScheduleTick(NowTime) ->
%%	tickCopyMap(NowTime),%%包含普通副本的tick
%%	AliveMonster = mapState:getMapAliveMonsterNum(),
%%	Cnf = mapState:getCnfFromdic(),
%%	NeedDestory =
%%		case Cnf of
%%			#copyMapDemonBattleCnf{}->
%%				mapState:getGoddessDead();
%%			_ ->
%%				false
%%		end,
%%	One = get({one,self()}) =:= undefined,
%%	case NeedDestory andalso One of
%%		true ->
%%			put({one,self()},true),
%%			copyMapDemonBattle:noticeScheduleStatus(1),%%挑战失败
%%			copyMapGoddess:goddessSettlement(),
%%
%%			psMgr:sendMsg2PS(self(), clearAllObject, ?CodeTypeMonster),
%%			erlang:send_after(1000*10, self(), {mapOtpAfterDo,fun()-> sendDestroyToSelf("First Step Destory") end });
%%		false when AliveMonster/= undefined andalso AliveMonster =< 0 ->
%%
%%			CurrScheduleNum = Cnf#copyMapDemonBattleCnf.fableCurrentSchedule,
%%			PrepareTimeNum = Cnf#copyMapDemonBattleCnf.fablePreparetimeNum,
%%			ChallengetimeNum = Cnf#copyMapDemonBattleCnf.fableChallengetimeNum,
%%			AllScheduleNum = Cnf#copyMapDemonBattleCnf.fableAllSchedule,
%%
%%			case copyMapGoddess:initBoss() of
%%				ok ->
%%					ok;
%%				Interval when erlang:is_integer(Interval) andalso CurrScheduleNum < AllScheduleNum->
%%					mapState:clearMapAliveMonsterNum(),
%%					mapState:setCnf2dic(Cnf#copyMapDemonBattleCnf{
%%						fableCurrentSchedule = CurrScheduleNum+1,
%%						fablePreparetimeEnd = time:getUTCNowSec()+PrepareTimeNum,
%%						fableChallengetimeEnd = time:getUTCNowSec()+PrepareTimeNum+ChallengetimeNum
%%					}),
%%					copyMapDemonBattle:noticeGift(),%%通知玩家发本关宝箱
%%					copyMapDemonBattle:noticeScheduleStatus(0),%%挑战成功
%%					noticeMapPlayerUpdateSevenDayAim(CurrScheduleNum),
%%					erlang:send_after(Interval, self(), {mapOtpAfterDo,fun()->copyMapGoddess:initSchedule() end });
%%				_ ->
%%					case One of
%%						true ->
%%							noticeMapPlayerUpdateSevenDayAim(CurrScheduleNum),
%%							put({one,self()},true),
%%							copyMapGoddess:goddessSettlement(),
%%							%%完成了总进度，出副本
%%							erlang:send_after(1000*60, self(), {mapOtpAfterDo,fun()-> sendDestroyToSelf("All Complete Destory") end });
%%						_ ->
%%							ok
%%					end
%%			end,
%%
%%			ok;
%%		_ ->
%%			skip
%%	end,
%%	ok.

noticeMapPlayerUpdateSevenDayAim(Schedule) ->
	FunSend =
		fun(#recMapObject{pid = Pid}, _) ->
			psMgr:sendMsg2PS(Pid, updateProtectGod, Schedule)
		end,
	ets:foldl(FunSend, 0, mapState:getMapPlayerEts()).

-spec prepareDestroy(DestroyAfterTime,IsForceDestroy) -> ok when DestroyAfterTime ::uint(),IsForceDestroy::boolean().
prepareDestroy(DestroyAfterTime, IsForceDestroy) ->
	?LOG_OUT("prepareDestory Map[~p],PID[~p],DestoryAfterTime[~p],IsForceDestory[~p]",
		[mapState:getMapId(),self(), DestroyAfterTime, IsForceDestroy]),

	mapState:setDestoryTime(DestroyAfterTime + time:getUTCNowMS()),
	mapState:setForceDestory(IsForceDestroy),

	case mapMgrState:getCopyMap(self()) of
		#recCopyMapInfo{} = CopyMapInfo ->
			mapMgrState:setCopyMap(CopyMapInfo#recCopyMapInfo{destroyTime = trunc(time2:getUTCDateTimeSec() + DestroyAfterTime /1000)});
		_ ->
			ok
	end,

	case IsForceDestroy of
		true ->
			%%向管理进程发消息，准备删除，此后不能再有人进入该地图进程
			MapID = mapState:getMapId(),
			case mapState:getGoonCopyMapState() of
				true -> skip;
				_ -> core:sendMsgToMapMgr(MapID, prepareDestory, {MapID,self()})
			end;
		_ ->
			skip
	end,
	ok.

-spec sendDestroyToSelf(Reason) -> ok when Reason::string().
sendDestroyToSelf(Reason) ->
	case mapState:getWaitForceDestory() of
		true ->
			%%已经通知了自己销毁
			skip;
		_ ->
			%%还没有通知自己销毁
			MapID = mapState:getMapId(),
			case mapState:getForceDestory() of
				false ->
					%%之前没有通知管理进程，现在通知
					mapState:setForceDestory(true),
					%%向管理进程发消息，准备删除，此后不能再有人进入该地图进程
					case mapState:getGoonCopyMapState() of
						true -> skip;
						_ -> core:sendMsgToMapMgr(MapID, prepareDestory, {MapID, self()})
					end;
				_ ->
					skip
			end,

			%%是军团副本的话要保存结束时间
			#mapsettingCfg{type = Type, subtype = SubType} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
			case Type =:= ?MapTypeCopyMap andalso SubType =:= ?MapSubTypeGuild of
				true ->
					GuildID = mapState:getGuildID(),
					NowTime = time:getSyncTime1970FromDBS(),
					core:sendMsgToMapMgr(MapID, guildCopyMapOver, {MapID,GuildID}),
					psMgr:sendMsg2PS(?PsNameGuild, updateLastGuildCopyOverTime, {GuildID, NowTime, 0});
				_ ->
					skip
			end,
			mapState:setWaitForceDestory(true),
			?LOG_OUT("MapPid:~p sendDestoryToSelf By:~p",[self(),Reason]),
			psMgr:sendMsg2PS(self(),destory,{})
	end,
	ok.

-spec kickAll() -> ok.
kickAll() ->
	kickAllPlayer(),
	destroyAllMonster(),
	destroyAllCollect(),
	ok.

-spec kickAllPlayer() -> ok.
kickAllPlayer() ->
	Ets = mapState:getMapPlayerEts(),
	MapPid = self(),
	MatchSpec = ets:fun2ms(fun(Object) when Object#recMapObject.mapPid =:= MapPid ->
		Object
						   end),
	List = myEts:selectEts(Ets,MatchSpec),
	case List of
		[] ->
			?LOG_OUT("MapPid:~p kickAllPlayer of ETS:~p，no player",[MapPid,Ets]),
			skip;
		_ ->
			?LOG_OUT("MapPid:~p kickAllPlayer of ETS:~p",[MapPid,Ets]),
			[kickPlayer(Object) || Object <- List]
	end,
	ok.

-spec kickAllPlayer(GroupID) -> ok when GroupID::uint().
kickAllPlayer(GroupID) ->
	Ets = mapState:getMapPlayerEts(),
	MapPid = self(),
	?LOG_OUT("MapPid:~p groupid[~p] kickAllPlayer of ETS:~p By GroupID:~p",[MapPid,GroupID,Ets,GroupID]),
	MatchSpec = ets:fun2ms(fun(Object) when
		Object#recMapObject.mapPid =:= MapPid andalso Object#recMapObject.groupID =:= GroupID ->
		Object
						   end),
	List = myEts:selectEts(Ets,MatchSpec),
	case List of
		[] ->
			eraseGroup(GroupID);
		[Object|_] ->
			kickPlayer(Object),
			erlang:send_after(1000, self(), {clearBitMapPlayer, self(), GroupID})
	end,
	ok.

eraseGroup(GroupID) when erlang:is_integer(GroupID) andalso GroupID >= 0 ->
	?DEBUG_OUT("eraseGroup:mapid=~p,mappid=~p,mapgroupid=~p,groupid=~p",
		[mapState:getMapId(),self(),mapState:getMapId(GroupID),GroupID]),
	mapState:deleteAllPlayersDeadTimes(GroupID),
	mapState:deleteMapStartTIme(GroupID),
	mapState:deleteGrouMapDelayInit(GroupID),
	copyMapScheduleState:delOpenBlockList(GroupID),
	copyMapScheduleState:delMapSchedule(GroupID),
	copyMapScheduleState:delMapScheduleMax(GroupID),
	copyMapScheduleState:delKilledMonsterList(GroupID),
	copyMapScheduleState:delCollectItemList(GroupID),
	copyMapScheduleState:delParallelScheduleConfList(GroupID),
	copyMapScheduleState:delMapParallelSchedule(GroupID),
	copyMapScheduleState:delScheduleFriendMonsterIDList(GroupID),
	ok;
eraseGroup(_) ->
	ok.

-spec kickPlayer(#recMapObject{}) -> ok.
kickPlayer(#recMapObject{pid = Pid,id = RoleID,name = Name}) ->
	?LOG_OUT("MapPid:~p kickplayer ID:~p Name:~ts", [self(),RoleID,Name]),
	psMgr:sendMsg2PS(Pid,kickCopyMapPlayer,{}),
	ok.

-spec destroyAllMonster() -> ok.
destroyAllMonster() ->
	MonEts = mapState:getMapMonsterEts(),
	MapPid = self(),
	?LOG_OUT("MapPid:~p destory all monster of map ets tables is [~p]",[self(),MonEts]),
	MatchSpec = ets:fun2ms(fun(Object) when erlang:is_pid(Object#recMapObject.pid) andalso Object#recMapObject.mapPid =:= MapPid ->
		{Object#recMapObject.code,Object#recMapObject.mapPid}
						   end),
	List = myEts:selectEts(MonEts,MatchSpec),
	case List of
		[] ->
			skip;
		_ ->
			[destroyMonster(Code1,Pid1) || {Code1,Pid1} <- List]
	end,
	ok.

%% 销毁指定位面的怪物
-spec destroyAllMonster(GroupID::uint()) -> ok.
destroyAllMonster(GroupID) ->
	MonEts = mapState:getMapMonsterEts(),
	MapPid = self(),
	?LOG_OUT("MapPid:~p groupid[~p] destory all monster of map ets tables is [~p]",[self(),GroupID,MonEts]),
	MatchSpec = ets:fun2ms(fun(Object) when
		erlang:is_pid(Object#recMapObject.pid) andalso Object#recMapObject.mapPid =:= MapPid andalso Object#recMapObject.groupID =:= GroupID ->
		{Object#recMapObject.code,Object#recMapObject.pid}
						   end),
	List = myEts:selectEts(MonEts,MatchSpec),
	case List of
		[] ->
			skip;
		_ ->
			[destroyMonster(Code1,Pid1) || {Code1,Pid1} <- List]
	end,
	ok.

%% 销毁指定ID的怪物
-spec destroyAllMonsterByID(MonsterID::uint()) -> ok.
destroyAllMonsterByID(MonsterID) ->
	MonEts = mapState:getMapMonsterEts(),
	MapPid = self(),
	?LOG_OUT("MapPid:~p destory monster of map ets tables is [~p]",[self(),MonEts]),
	MatchSpec = ets:fun2ms(fun(Object) when
		erlang:is_pid(Object#recMapObject.pid) andalso Object#recMapObject.mapPid =:= MapPid andalso MonsterID =:= Object#recMapObject.id ->
		{Object#recMapObject.code,Object#recMapObject.pid}
						   end),
	List = myEts:selectEts(MonEts,MatchSpec),
	case List of
		[] ->
			skip;
		_ ->
			[destroyMonster(Code1,Pid1) || {Code1,Pid1} <- List]
	end,
	ok.
%% 销毁所有的采集物
-spec destroyAllCollect() -> ok.
destroyAllCollect() ->
	CEts = mapState:getMapCollectEts(),
	MapPid = self(),
	?LOG_OUT("MapPid:~p destory all collect of map ets tables is [~p]",[self(),CEts]),
	MatchSpec = ets:fun2ms(fun(Object) when
		erlang:is_pid(Object#recMapObject.pid) andalso Object#recMapObject.mapPid =:= MapPid ->
		Object#recMapObject.code
						   end),
	List = myEts:selectEts(CEts,MatchSpec),
	case List of
		[] ->
			skip;
		_ ->
			[destroyCollect(One, 0) || One <- List]
	end,
	ok.

%% 销毁所有的采集物
-spec destroyAllCollect(GroupID::uint()) -> ok.
destroyAllCollect(GroupID) ->
	CEts = mapState:getMapCollectEts(),
	MapPid = self(),
	?LOG_OUT("MapPid:~p groupid[~p] destory all collect of map ets tables is [~p]",[MapPid,GroupID,CEts]),
	MatchSpec = ets:fun2ms(fun(Object) when
		erlang:is_pid(Object#recMapObject.pid) andalso Object#recMapObject.mapPid =:= MapPid andalso Object#recMapObject.groupID =:= GroupID ->
		Object#recMapObject.code
						   end),
	List = myEts:selectEts(CEts,MatchSpec),
	case List of
		[] ->
			skip;
		_ ->
			[destroyCollect(One, GroupID) || One <- List]
	end,
	ok.

%% 清理该地图中，属性该分组的所有对象
-spec clearGroupAllObject(GroupID::uint()) -> ok.
clearGroupAllObject(GroupID) ->
	destroyAllMonster(GroupID),
	destroyAllCollect(GroupID),
	ok.

%% 删除采集物
-spec destroyCollect(Code::uint(), GroupID::uint64()) -> ok.
destroyCollect(Code, GroupID) ->
	%% 注意，要先同步给客户端，服务器再删除
	Ets = mapState:getMapCollectEts(),

	%% 同步给客户端
	Msg = #pk_GS2U_BroadcastDisapear{code = [Code]},
	mapView:sendMsg2AllPlayer(self(), mapState:getMapPlayerEts(), Msg, GroupID),

	%% 从ETS里面删除
	myEts:deleteEts(Ets, Code),
	ok.

-spec destroyMonster(Code,Pid) -> ok when Code::uint(),Pid::pid().
destroyMonster(Code,_Pid) ->
	monsterInterface:clearSpawn(Code),
	ok.

%% 删除NPC
-spec destroyNpc(Code::uint(), GroupID::uint64()) -> ok.
destroyNpc(Code, GroupID) ->
	%% 注意，要先同步给客户端，服务器再删除
	Ets = mapState:getMapNpcEts(),

	%% 同步给客户端
	Msg = #pk_GS2U_BroadcastDisapear{code = [Code]},
	mapView:sendMsg2AllPlayer(self(), mapState:getMapPlayerEts(), Msg, GroupID),

	%% 从ETS里面删除
	myEts:deleteEts(Ets, Code),
	ok.

%% 获取地图ID，考虑分组
-spec getMapID(GroupID::uint()) -> uint().
getMapID(GroupID) ->
	case groupBase:getMapIDByGroupID(GroupID) of
		0 ->
			mapState:getMapId();
		ID ->
			ID
	end.

-spec doFun4AllPlayer(Fun) -> ok when Fun::fun().
doFun4AllPlayer(Fun) when erlang:is_function(Fun)->
	PlayerEts = mapState:getMapPlayerEts(),
	PlayerList = ets:tab2list(PlayerEts),
	lists:foreach(Fun, PlayerList).

%% 副本初始化
-spec initMapSchedule(CopyMapID::uint(), OwnerID::uint()) -> boolean().
initMapSchedule(CopyMapID, _OwnerID) ->
	mapState:setCopyMapExistTime(CopyMapID),
	initCopyMapSchedule(0),
%%	copyMapGoddess:initCnf(CopyMapID),%%加载地宫参数
	ok.

%%勇士试炼种boss
-spec createWarriorTrialBoss(Mission::uint()) -> ok.
createWarriorTrialBoss(Mission) ->
	#warriortrialCfg{camera_boss = CameraBoss , bossid = BossID, coordinate = [{PosX, PosY}]} = getCfg:getCfgPStack(cfg_warriortrial, Mission),
	%%先删除副本中所有的怪
	destroyAllMonster(),
	%%种怪
	?DEBUG_OUT("BossID1 = ~p, PosX = ~p, PosY = ~p", [BossID, PosX, PosY]),
	copyMapScheduleInit:addMonsterToMap(0, [{BossID, 1, PosX, PosY}], 0),
	PlayerEts = mapState:getMapPlayerEts(),
	MapID = mapState:getMapId(),
	case CameraBoss of
		1 ->
			MonsterCode = case getMonsterCodeByID(BossID) of
							  [V| _] -> V;
							  _ -> 0
						  end,
			sendNetMsgToMapPlayer(PlayerEts,#pk_GS2U_CopySpecialSchedule{mapID = MapID, schedule = Mission, code = MonsterCode});
		_ -> skip
	end,
	ok.
%% 获得一种怪物的数量
-spec getMonsterNumByID(MonsterID::uint()) -> uint().
getMonsterNumByID(MonsterID) ->
	MonEts = mapState:getMapMonsterEts(),
	MapPid = self(),
	MatchSpec = ets:fun2ms(fun(Object) when
		erlang:is_pid(Object#recMapObject.pid) andalso Object#recMapObject.mapPid =:= MapPid andalso MonsterID =:= Object#recMapObject.id ->
		{Object#recMapObject.code}
						   end),
	List = myEts:selectEts(MonEts,MatchSpec),
	length(List).

sendNetMsgToMapPlayer(PlayerEts, Msg)->
	try
		MatchSpec = ets:fun2ms(fun(Object) ->  Object#recMapObject.netPid end),
		MapPlayerNetPidList = myEts:selectEts(PlayerEts, MatchSpec),
		lists:foreach(fun(NetPid) -> playerMsg:sendNetMsg(NetPid, Msg) end, MapPlayerNetPidList)
	catch
		_ : _  -> skip
	end.


%%通过id检查npc的code
-spec getMonsterCodeByID(NpcID::uint32()) ->[uint64()].
getMonsterCodeByID(NpcID) ->
	MonsterEts = mapState:getMapMonsterEts(),
	MatchSpec = ets:fun2ms(fun(R) when R#recMapObject.id==NpcID -> R#recMapObject.code end),
	L = myEts:selectEts(MonsterEts, MatchSpec),
	L.


sendMapLeftTimeToMapPlayer(NetPid)->
	MapType = mapState:getMapType(),
	MapSubType = mapState:getMapSubType(),
	case needSendLeftTime(MapType, MapSubType) of
		true ->
			sendLeftTimeToPlayer(NetPid);
		_ ->
			skip
	end.

needSendLeftTime(?MapTypeCopyMap, ?MapSubTypeNormal)->
	true;
needSendLeftTime(?MapTypeCopyMap, ?MapSubTypeHeroCopy)->
	true;
needSendLeftTime(?MapTypeCopyMap, ?MapSubTypeChanllengeCopy)->
	true;
needSendLeftTime(?MapTypeCopyMap, ?MapSubTypeExpCopyMap)->
	true;
needSendLeftTime(_MapType, _MapSubType)->
	false.

sendLeftTimeToPlayer(NetPid)->
	MapID = mapState:getMapId(),
	NowTime = time:getUTCNowMS(),
	ExistTime = mapState:getCopyMapExistTime(),
	case is_pid(NetPid) of
		true ->
			LeftTimeMs1 = ExistTime - NowTime,
			LeftTimeMs2 = misc:clamp(LeftTimeMs1, 0, 3600*10*1000),
			playerMsg:sendNetMsg(NetPid, #pk_GS2U_CopyMapLeftTime{mapID = MapID, leftTimeMs = LeftTimeMs2 });
		_ ->
			skip
	end.