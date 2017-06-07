%% @author ZhongYuanwei
%% @doc @todo 地图进程使用的进程字典接口.


-module(mapState).
-author(zhongyuanwei).

-include("mapPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-compile(export_all).

% 获取地图ID
-spec getMapId() -> uint16().
getMapId() ->
	case get('MapId') of
		undefined ->
			0;
		ID ->
			ID
	end.

% 获取分组的地图ID
-spec getMapId(GroupID::uint()) -> uint16() .
getMapId(GroupID) ->
	gameMapLogic:getMapID(GroupID).

% 设置地图ID
-spec setMapId(MapId) -> OldVal | undefined when
	MapId :: number(), OldVal :: number().
setMapId(MapId) when erlang:is_number(MapId) ->
	put('MapId', MapId).

% 获取地图Type
-spec getMapType() -> Result | undefined when Result :: uint().
getMapType() ->
	get('MapType').

% 设置地图Type
-spec setMapType(MapType) -> OldVal  | undefined when
	MapType :: uint(), OldVal :: uint().
setMapType(MapType) when erlang:is_integer(MapType) andalso MapType >= 0 ->
	put('MapType', MapType).

% 获取地图Line
-spec getMapLine() -> Result | undefined when Result :: uint().
getMapLine() ->
	get('MapLine').

% 设置地图Line
-spec setMapLine(MapLine) -> OldVal  | undefined when
	MapLine :: uint(), OldVal :: uint().
setMapLine(MapLine) when erlang:is_integer(MapLine) andalso MapLine >= 0 ->
	put('MapLine', MapLine).

setMapScreenEts(Ets) ->
	put('MapScreenEts', Ets).
getMapScreenEts() ->
	get('MapScreenEts').

% 获取地图上玩家的ETS表
-spec getMapPlayerEts() -> Result | undefined when Result :: etsTab().
getMapPlayerEts() ->
	get('MapPlayerEts').

% 设置地图上 玩家的ETS表
-spec setMapPlayerEts(PlayerEts) -> OldVal  | undefined when
	PlayerEts :: etsTab(), OldVal :: etsTab().
setMapPlayerEts(PlayerEts) ->
	put('MapPlayerEts', PlayerEts).

% 获取地图上怪物的ETS表
-spec getMapMonsterEts() -> Result | undefined when Result :: etsTab().
getMapMonsterEts() ->
	get('MapMonsterEts').

% 设置地图上怪物的ETS表
-spec setMapMonsterEts(MonsterEts) -> OldVal  | undefined when
	MonsterEts :: etsTab(), OldVal :: etsTab().
setMapMonsterEts(MonsterEts) ->
	put('MapMonsterEts', MonsterEts).

% 获取地图上宠物的ETS表
-spec getMapPetEts() -> Result | undefined when Result :: etsTab().
getMapPetEts() ->
	get('MapPetEts').

% 设置地图上宠物的ETS表
-spec setMapPetEts(PetEts) -> OldVal  | undefined when
	PetEts :: etsTab(), OldVal :: etsTab().
setMapPetEts(PetEts) ->
	put('MapPetEts', PetEts).

% 获取地图上 NPC 的ETS表
-spec getMapNpcEts() -> Result | undefined when Result :: etsTab().
getMapNpcEts() ->
	get('MapNpcEts').

% 设置地图上 NPC 的ETS表
-spec setMapNpcEts(NpcEts) -> OldVal  | undefined when
	NpcEts :: etsTab(), OldVal :: etsTab().
setMapNpcEts(NpcEts) ->
	put('MapNpcEts', NpcEts).

% 获取地图上 采集对象 的ETS表
-spec getMapCollectEts() -> Result | undefined when Result :: etsTab().
getMapCollectEts() ->
	get('MapCollectEts').

% 设置地图上 采集对象 的ETS表
-spec setMapCollectEts(CollectEts) -> OldVal  | undefined when
	CollectEts :: etsTab(), OldVal :: etsTab().
setMapCollectEts(CollectEts) ->
	put('MapCollectEts', CollectEts).

% 获取地图上 使用物品 的ETS表
-spec getMapUseItemEts() -> Result | undefined when Result :: etsTab().
getMapUseItemEts() ->
	get('MapUseItemEts').

% 设置地图上 使用物品 的ETS表
-spec setMapUseItemEts(UseItemEts) -> OldVal  | undefined when
	UseItemEts :: etsTab(), OldVal :: etsTab().
setMapUseItemEts(UseItemEts) ->
	put('MapUseItemEts', UseItemEts).

%%地宫配置
-spec setCnf2dic(Cnf::#copyMapDemonBattleCnf{}) ->#copyMapDemonBattleCnf{}.
setCnf2dic(Cnf) when erlang:is_record(Cnf, copyMapDemonBattleCnf)->
	put(copyMapDemonBattleCnf,Cnf),
	Cnf.
%%地宫配置
-spec getCnfFromdic() -> Val::#copyMapDemonBattleCnf{} | undefined.
getCnfFromdic() ->
	get(copyMapDemonBattleCnf).

% 获取地图上 所有玩家的人数
-spec getMapPlayerNum() -> Result | undefined when Result :: uint().
getMapPlayerNum() ->
	get('MapPlayerNum').

% 设置地图上所有玩家的人数
-spec setMapPlayerNum(MapPlayerNum) -> OldVal  | undefined when
	MapPlayerNum :: uint(), OldVal :: uint().
setMapPlayerNum(MapPlayerNum) when erlang:is_integer(MapPlayerNum) andalso MapPlayerNum >= 0 ->
	put('MapPlayerNum', MapPlayerNum).

%%设置删除时间ms
-spec setDestoryTime(Time) -> ok when Time::uint().
setDestoryTime(Time) ->
	put(destoryTime,Time),
	ok.

%%获取删除时间ms
-spec getDestoryTime() -> uint().
getDestoryTime() ->
	case get(destoryTime) of
		undefined ->
			0;
		Time ->
			Time
	end.

%%删除地图销毁时间
-spec deleteDestoryTime() -> ok.
deleteDestoryTime() ->
	erase(destoryTime),
	erase(isForceDestory),
	ok.

%%设置副本存在最大时间ms
-spec setCopyMapExistTime(Time) -> ok when Time::uint().
setCopyMapExistTime(MapID) ->
	AddTime = case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
				  #mapsettingCfg{type = MapType, all_time = AT} when
					  MapType =:= ?MapTypeCopyMap orelse MapType =:= ?MapTypeBitplane orelse MapType =:= ?MapTypeActivity ->
					  AT * 1000;
				  _ ->
					  %% 其它地图保留时间为一年
					  12*30*24*3600*1000
			  end,
	NowTime = time:getUTCNowMS(),
	put(copyMapExistTime, NowTime + AddTime),
	?LOG_OUT("setCopyMapExistTime:[mapID=~p,pid=~p], nowtime:~p,addtime:~p", [MapID, self(), NowTime, AddTime]),
	ok.

-spec setCopyMapExistTime(MapID::uint(), Time::uint()) -> ok.
setCopyMapExistTime(_MapID, Time) ->
	put(copyMapExistTime, Time),
	ok.

%%获取副本存在最大时间ms
-spec getCopyMapExistTime() -> undefined | uint().
getCopyMapExistTime() ->
	get(copyMapExistTime).

%% 获取地图开始时间
-spec getMapStartTime(GroupID::uint()) -> uint().
getMapStartTime(GroupID) ->
	get({'MapStartTime', GroupID}).

%% 设置地图开始时间
-spec setMapStartTime(GroupID::uint(), Time :: uint()) -> ok.
setMapStartTime(GroupID, Time) when erlang:is_integer(Time), Time > 0 ->
	put({'MapStartTime', GroupID}, Time),
	ok.

deleteMapStartTIme(GroupID) ->
	erase({'MapStartTime', GroupID}).

%% 获取所有玩家在此地图的死亡次数
-spec getAllPlayersDeadTimes(GroupID::uint()) -> uint().
getAllPlayersDeadTimes(GroupID) ->
	case get({'AllPlayersDeadTimes', GroupID}) of
		Val when erlang:is_integer(Val) ->
			Val;
		_ ->
			0
	end.

%% 设置所有玩家在此地图的死亡次数
-spec setAllPlayersDeadTimes(GroupID::uint(), Times :: uint()) -> ok.
setAllPlayersDeadTimes(GroupID, Times) when erlang:is_integer(Times), Times >= 0 ->
	put({'AllPlayersDeadTimes', GroupID}, Times),
	ok.

deleteAllPlayersDeadTimes(GroupID) ->
	erase({'AllPlayersDeadTimes', GroupID}).

%%设置是否强制删除地图，用于副本地图已经完成进度
-spec setForceDestory(IsForceDestory) -> undefined | boolean() when
	IsForceDestory::boolean().
setForceDestory(IsForceDestory) ->
	put(isForceDestory,IsForceDestory).

%%获取是否强制删除地图，用于副本地图已经完成进度
-spec getForceDestory() -> boolean() | undefined.
getForceDestory() ->
	get(isForceDestory).

%% 当前副本是否已经等待强制销毁
-spec setWaitForceDestory(IsWaitForceDestory) -> undefined | boolean() when
	IsWaitForceDestory::boolean().
setWaitForceDestory(IsWaitForceDestory) ->
	put(isWaitForceDestory,IsWaitForceDestory).

%% 当前副本是否已经等待强制销毁
-spec getWaitForceDestory() -> boolean() | undefined.
getWaitForceDestory() ->
	get(isWaitForceDestory).

%%当前地图是否处于睡眠状态
-spec isMapSleep() -> boolean().
isMapSleep() ->
	case get(isMapSleep) of
		undefined ->
			false;
		Bool ->
			Bool
	end.

%%设置当前地图处于睡眠状态
-spec setMapSleep() -> ok.
setMapSleep() ->
	put(isMapSleep,true),
	ok.

%%设置当前地图等级（等于队长等级或单玩家等级）动态随机怪用
-spec setMapLevel(GroupID, Level)->term() when GroupID::uint(),Level::integer().
setMapLevel(GroupID, Level) ->
	put({mapLevel, GroupID},Level).

-spec getMapLevel(GroupID::uint()) -> integer().
getMapLevel(GroupID) ->
	case get({mapLevel, GroupID}) of
		undefined ->
			1;
		Level ->
			Level
	end.


%%设置当前地图的创建者
-spec setMapOwnerID(GroupID, RoleID)->term() when GroupID::uint(),RoleID::integer().
setMapOwnerID(GroupID, RoleID) ->
	put({mapCreateRoleID, GroupID},RoleID).

-spec getMapOwnerID(GroupID::uint()) -> integer().
getMapOwnerID(GroupID) ->
	case get({mapCreateRoleID, GroupID}) of
		undefined ->
			0;
		RoleID ->
			RoleID
	end.

%% 设置NPC本次改变坐标的时间
-spec setNpcChangePosTime(NpcCode::uint()) -> uint() | undefined.
setNpcChangePosTime(NpcCode) ->
	put({'NpcChangePosTime', NpcCode}, time:getUTCNowSec()).

%% 获取NPC上次改变坐标的时间
-spec getNpcChangePosTime(NpcCode::uint()) -> uint() | undefined.
getNpcChangePosTime(NpcCode) ->
	get({'NpcChangePosTime', NpcCode}).

%%设置地图子类型
-spec setMapSubType(Type) ->term() when Type::term().
setMapSubType(Type) ->
	put(mapSubType,Type).
%%设置地图子类型
-spec getMapSubType() ->Val::term() | undefined.
getMapSubType() ->
	get(mapSubType).

-spec clearMapAliveMonsterNum() -> ok.
clearMapAliveMonsterNum() ->
	erase(mapAliveMonsterNum),
	ok.

-spec addMapAliveMonsterNum(Num) -> ok when Num::int().
addMapAliveMonsterNum(Num) when erlang:is_integer(Num) ->
	Curr1 =
		case getMapAliveMonsterNum() of
			undefined ->
				0;
			Curr ->
				Curr
		end,
	put(mapAliveMonsterNum,Curr1 + Num),
	ok.

-spec getMapAliveMonsterNum()->Val::integer()|undefined.
getMapAliveMonsterNum() ->
	get(mapAliveMonsterNum).

-spec setGoddessBossing(IsBossing::boolean()) ->term().
setGoddessBossing(IsBossing) ->
	put(mapGoddessBossing,IsBossing).

-spec getGoddessBossing() ->boolean().
getGoddessBossing() ->
	get(mapGoddessBossing) =:= true.

-spec setGoddessCode(Code::uint32()) ->term().
setGoddessCode(Code) ->
	put(goddessCode,Code).

-spec getGoddessCode() ->number() |0.
getGoddessCode() ->
	case get(goddessCode) of
		undefined ->
			case mapState:getMapMonsterEts() of
				undefined ->
					0;
				Tab ->
					#globalsetupCfg{setpara =[ID,_X,_Y] } = getCfg:getCfgByArgs(cfg_globalsetup, goddess),
					MatchSpec = ets:fun2ms(fun
											   (Row) when Row#recMapObject.id =:= ID ->
												   Row#recMapObject.code
										   end
					),
					case myEts:selectEts(Tab, MatchSpec) of
						[MonsterCode |_] ->
							setGoddessCode(MonsterCode),
							MonsterCode;
						_ ->
							0
					end
			end;
		Code ->
			Code
	end.

-spec setGoddessDead(IsDead::boolean()) ->term().
setGoddessDead(IsDead) ->
	put(goddessDead,IsDead).

-spec getGoddessDead() ->boolean().
getGoddessDead() ->
	get(goddessDead) =:= true.



%%boss战分配的位面编号
-spec setMapGroupID(add|del,GroupID) -> list() when GroupID::uint().
setMapGroupID(add,GroupID) ->
	List = getMapGroupID(),
	put(worldBossMapGroupID,[ GroupID| List]);
setMapGroupID(del,GroupID) ->
	List = getMapGroupID(),
	put(worldBossMapGroupID,lists:delete(GroupID, List) ).
-spec getMapGroupID() -> list().
getMapGroupID() ->
	case get(worldBossMapGroupID) of
		[H |_] = Ret when erlang:is_integer(H) ->
			Ret;
		_Ret ->
			[]
	end.

%%boss战申请进位面的玩家队列
getWorldBossPlayerQueue() ->
	Value = get(worldBossPlayerRequestQueue),
	case queue:is_queue(Value) of
		true  ->
			Value;
		_ ->
			queue:new()
	end.
setWorldBossPlayerQueue( PlayerQue ) ->
	case queue:is_queue( PlayerQue ) of
		true ->
			put(worldBossPlayerRequestQueue,PlayerQue);
		false ->
			put(worldBossPlayerRequestQueue,queue:new())
	end.

%%上次请求进入位面的人
setLastParallelUniverse( Val ) ->
	put(lastParallelUniverse,Val).
getLastParallelUniverse() ->
	get(lastParallelUniverse).

%%boss战进度
-spec setBossSchedule(CurrSchedule::integer()) ->term().
setBossSchedule(CurrSchedule) ->
	put(setBossSchedule,CurrSchedule).
-spec getBossSchedule() ->integer() | undefined.
getBossSchedule() ->
	get(setBossSchedule).

%% 设置分组地图延时初始化(玩家真正进入才初始化)
-spec setGroupMapDelayInit(GroupID::uint(), Value::boolean()) -> undefined | boolean().
setGroupMapDelayInit(GroupID, Value) ->
	put({'GroupMapDelayInit', GroupID}, Value).

-spec getGroupMapDelayInit(GroupID::uint()) -> boolean().
getGroupMapDelayInit(GroupID) ->
	get({'GroupMapDelayInit', GroupID}).

deleteGrouMapDelayInit(GroupID) ->
	erase({'GroupMapDelayInit', GroupID}).

getNextTickPlayerEtsTime() ->
	case get(nextTickPlayerEtsTime) of
		undefined ->
			0;
		Time ->
			Time
	end.

setNextTickPlayerEtsTime(Time) ->
	put(nextTickPlayerEtsTime,Time),
	ok.

%% 采集物复活列表相关
setGatherWaitReliveList(List) ->
	put(gatherWaitReliveList, List).

addGatherWaitReliveList(#gatherWaitReliveRec{} = Rec) ->
	L = getGatherWaitReliveList(),
	NL = [Rec | L],
	setGatherWaitReliveList(NL).

delGatherWaitReliveList(Code) ->
	L = getGatherWaitReliveList(),
	NL = lists:keydelete(Code, #gatherWaitReliveRec.code, L),
	setGatherWaitReliveList(NL).

getGatherWaitReliveList() ->
	case get(gatherWaitReliveList) of
		undefined ->
			[];
		V ->
			V
	end.
%% 如果是军团副本地图，保存个军团ID
-spec setGuildID(GuildID::int64()) ->int64().
setGuildID(GuildID) ->
	put(guildID,GuildID).
-spec getGuildID() ->int64().
getGuildID() ->
	case get(guildID) of
		undefined ->
			0;
		GuildID ->
			GuildID
	end.
%% 如果是军团副本地图，保存个队伍ID
-spec setTeamID(TeamID::int64()) ->int64().
setTeamID(TeamID) ->
	put(teamID,TeamID).
-spec getTeamID() ->int64().
getTeamID() ->
	case get(teamID) of
		undefined ->
			0;
		TeamID ->
			TeamID
	end.

setGoonCopyMapState(V) ->
	put('GoonCopyMapState', V).

getGoonCopyMapState() ->
	get('GoonCopyMapState').


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% begin 【野外BOSS优化改动】 20160913

%% 野外BOSS最后一个目标
setWildBossLastTarget(0,_BossID) ->
	skip;
setWildBossLastTarget(Code,BossID) ->
	put({'WildBossLastTarget',BossID}, Code).

getWildBossLastTarget(BossID) ->
	case get({'WildBossLastTarget',BossID}) of
		undefined -> 0;
		Code -> Code
	end.

%% 清理数据
delWildBossDamageFromPlayer(BossID) ->
	erase({'WildBossLastAttacker',BossID}),
	erase({'WildBossLastTarget',BossID}),
	erase({'WildBossDamageFromPlayer',BossID}).

%% 最后一个攻击者
%% 原逻辑中，以BOSS最后一个攻击目标作为击杀者判断
%% 但是玩家足够秒杀BOSS时，BOSS并未产生攻击目标，导致后续逻辑异常
%% 特此新加入最后一个攻击BOSS的记录，用于该异常情况下进行弥补
setWildBossLastAttacker(0,_BossID) ->
	skip;
setWildBossLastAttacker(Code,BossID) ->
	put({'WildBossLastAttacker',BossID}, Code).
getWildBossLastAttacker(BossID) ->
	case get({'WildBossLastAttacker',BossID}) of
		undefined -> 0;
		Code -> Code
	end.

%% 获得某个玩家对野外BOSS造成的伤害值
getWildBossDamageFromPlayer(RoleID,BossID) ->
	case get({'WildBossDamageFromPlayer',BossID}) of
		undefined ->
			0;
		Dict ->
			case dict:find(RoleID, Dict) of
				{ok, V} ->
					V;
				_ ->
					0
			end
	end.

%% 获得所有玩家对野外BOSS造成有效伤害的角色ID列表
getWildBossDamageFromPlayer_validRoleID(BossID) ->
	case get({'WildBossDamageFromPlayer',BossID}) of
		undefined ->
			[];
		Dict ->
			FunGet =
				fun(RoleID, Damage, ListRoleID) ->
					if
					%% 此处伤害值实际上为BOSS的HP变动值
					%% 故有效值为负
						Damage < 0 ->
							[RoleID | ListRoleID];
						true ->
							ListRoleID
					end
				end,
			dict:fold(FunGet, [], Dict)
	end.

%% 累计玩家对野外BOSS造成的伤害值
addWildBossDamageFromPlayer(RoleID,BossID, DamageNew) ->
	DictNew =
		case get({'WildBossDamageFromPlayer',BossID}) of
			undefined ->
				dict:store(RoleID, DamageNew, dict:new());
			DictOld ->
				case dict:find(RoleID, DictOld) of
					{ok, DamageOld} ->
						dict:store(RoleID, DamageOld + DamageNew, DictOld);
					_ ->
						dict:store(RoleID, DamageNew, DictOld)
				end
		end,
	put({'WildBossDamageFromPlayer',BossID}, DictNew),
	ok.

%% 获得领取过幸运奖励的角色ID列表
getWildBossRoleIDListLucky() ->
	case get('WildBossLucky') of
		undefined ->
			[];
		RoleIDList ->
			RoleIDList
	end.

%% 添加领取过幸运奖励的玩家以及领取次数
addWildBossRoleIDLucky(RoleID) ->
	case get('WildBossLucky') of
		undefined ->
			put('WildBossLucky', [{RoleID,1}]);
		RoleIDList ->
			case lists:keyfind(RoleID,1,RoleIDList) of
				false->
					put('WildBossLucky', [{RoleID,1}|RoleIDList]);
				{RoleID,Num}->
					put('WildBossLucky', [{RoleID,Num+1}|RoleIDList])
			end
	end.

%% 设置地图当前时间状态
setMapDay(Day) ->
	put(mapDay, Day).
getMapDay() ->
	case get(mapDay) of
		undefined -> core:isDay();
		D -> D
	end.

%% 上一次刷新地图白天黑夜时间
setLastTickDayNightTime(Time) ->
	put('LastTickDayNightTime', Time).
getLastTickDayNightTime() ->
	case get('LastTickDayNightTime') of
		undefined -> 0;
		T -> T
	end.

setConvoyInfoList(List) ->
	put('ConvoyInfoList', List),
	List.
addConvoyInfoList(#recConvoyInfo{roleID = RoleID} = Info) ->
	L = getConvoyInfoList(),
	NL = lists:keystore(RoleID, #recConvoyInfo.roleID, L, Info),
	setConvoyInfoList(NL).
getConvoyInfoList() ->
	case get('ConvoyInfoList') of
		undefined -> [];
		L -> L
	end.
delConvoyInfoList(#recConvoyInfo{roleID = RoleID}) ->
	L = getConvoyInfoList(),
	NL = lists:keydelete(RoleID, #recConvoyInfo.roleID, L),
	setConvoyInfoList(NL);
delConvoyInfoList(RoleID) when erlang:is_integer(RoleID) andalso RoleID > 0 ->
	L = getConvoyInfoList(),
	NL = lists:keydelete(RoleID, #recConvoyInfo.roleID, L),
	setConvoyInfoList(NL).

%% 上一次护送Tick时间
setLastConvoyTickTime(Time) ->
	put('LastConvoyTickTime', Time).
getLastConvoyTickTime() ->
	case get('LastConvoyTickTime') of
		undefined -> 0;
		T -> T
	end.

%% end 【野外BOSS优化改动】
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addMapHistoryEnterPlayer(GroupID, RoleID) ->
	L = getMapHistoryEnterPlayerList(GroupID),
	case lists:member(RoleID, L) of
		false ->
			setMapHistoryEnterPlayerList(GroupID, [RoleID | L]),
			0;
		_ ->
			1
	end.

getMapHistoryEnterPlayerList(GroupID) ->
	case get({'MapHistoryEnterPlayerList', GroupID}) of
		undefined -> [];
		L -> L
	end.

setMapHistoryEnterPlayerList(GroupID, List) ->
	put({'MapHistoryEnterPlayerList', GroupID}, List).

%% ====================================================================
%% Internal functions
%% ====================================================================


