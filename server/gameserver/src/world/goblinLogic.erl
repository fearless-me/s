%% @author chengxs
%% @doc @todo 日常玩法--哥布林玩法.


-module(goblinLogic).
-include("mapPrivate.hrl").
-include("cfg_goblin.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initConfig/0,
	spawnGoblin/0,
	spawnBoss/0,
	destoryAllGoblin/0,
	goblinBeKilled/1
]).

%%初始化配置
initConfig() ->
	MapIDList = getCfg:get1KeyList(cfg_goblin),
	MapID = mapState:getMapId(),
	Fun = fun(E) ->
		E =:= MapID
	end,
	case lists:any(Fun, MapIDList) of
		false ->
			skip;
		_ ->
			countBeginTime(MapID)
	end,
	ok.

%%计算活动开始时间
countBeginTime(MapID) ->
	case getCfg:getCfgPStack(cfg_goblin, MapID) of
		#goblinCfg{refreshtime = TimeList} ->
			Fun = fun(BeginTime) ->
				Time = time:getSyncTime1970FromDBS(),
				{{Y, M, D}, {_H, _Min, _S}} = time:convertSec2DateTime(Time),
				RefreshTime = time:convertDateTime1970ToSec({{Y, M, D}, {BeginTime, 0, 0}}),
				case RefreshTime < Time of
					true ->
						case Time - RefreshTime =< ?GoblinTotalTime of
							true ->
								?LOG_OUT("MapID[~p] BeginTime[~p] had Pass[~p]", [MapID,BeginTime, Time - RefreshTime]),
								erlang:send(self(), {goblinBegin, Time - RefreshTime});
							_ ->
								?LOG_OUT("[1]MapID[~p] BeginTime[~p] [~p]second begin spawn", [MapID,BeginTime, RefreshTime + ?One_Day_Second - Time]),
								erlang:send_after((RefreshTime + ?One_Day_Second - Time) * 1000, self(), {goblinBegin, 0})
						end;
					_ ->
						?LOG_OUT("[2]MapID[~p] BeginTime[~p] [~p]second begin spawn", [MapID,BeginTime, RefreshTime - Time]),
						erlang:send_after((RefreshTime - Time + 1) * 1000, self(), {goblinBegin, 0})
				end
			end,
			lists:foreach(Fun, TimeList);
%% 			erlang:send_after(60000, self(), goblinBegin);
		_ ->
			skip
	end.

%%刷出哥布林
spawnGoblin() ->
	MapID = mapState:getMapId(),
	?LOG_OUT("spawn goblin MapID[~p]", [MapID]),
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_StealBtn) of
		true ->
            MonsterEts = mapState:getMapMonsterEts(),
            PlayerEts = mapState:getMapPlayerEts(),
            PetEts = mapState:getMapPetEts(),
            case getCfg:getCfgPStack(cfg_goblin, MapID) of
                #goblinCfg{monsterid = MonsterID, refreshpos = RefreshPos} ->
                    %%预防之前的怪没成功删除，先删除掉
                    gameMapLogic:destroyAllMonsterByID(MonsterID),
                    MapID = mapState:getMapId(),
                    case getCfg:getCfgPStack(cfg_monster, MonsterID) of
                        #monsterCfg{level = Level} ->
                            Fun =
                                fun({PosX, PosY}) ->
                                    Arg = #recSpawnMonster{
                                        id = MonsterID,
                                        mapID = MapID,
                                        mapPid = self(),
                                        x = PosX,
                                        y = PosY,
                                        level = Level,
                                        camp = 0,
                                        guildID = 0,
                                        playerEts = PlayerEts,
                                        monsterEts = MonsterEts,
                                        petEts = PetEts,
                                        groupID = 0
                                    },
                                    monsterInterface:spawnMonster(Arg)
                                end,
                            lists:foreach(Fun, RefreshPos);
                        _ ->
                            skip
                    end;
                _ ->
                    skip
            end;
        _ ->
            skip
    end.

%%刷新boss
spawnBoss()->
	MapID = mapState:getMapId(),
	?LOG_OUT("spawn goblin Boss MapID[~p]", [MapID]),
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_StealBtn) of
		true ->
			MonsterEts = mapState:getMapMonsterEts(),
			PlayerEts = mapState:getMapPlayerEts(),
			PetEts = mapState:getMapPetEts(),
			case getCfg:getCfgPStack(cfg_goblin, MapID) of
				#goblinCfg{bossid = MonsterID, bossrefreshpos = RefreshPos} ->
					%%预防之前的怪没成功删除，先删除掉
					gameMapLogic:destroyAllMonsterByID(MonsterID),
					MapID = mapState:getMapId(),
                    case getCfg:getCfgPStack(cfg_monster, MonsterID) of
                        #monsterCfg{level = Level} ->
                            Fun =
                                fun({PosX, PosY}) ->
                                    Arg = #recSpawnMonster{
                                        id = MonsterID,
                                        mapID = MapID,
                                        mapPid = self(),
                                        x = PosX,
                                        y = PosY,
                                        level = Level,
                                        camp = 0,
                                        guildID = 0,
                                        playerEts = PlayerEts,
                                        monsterEts = MonsterEts,
                                        petEts = PetEts,
                                        groupID = 0
                                    },
                                    monsterInterface:spawnMonster(Arg)
                                end,

                            lists:foreach(Fun, RefreshPos);
                        _ ->
                            skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end.

%% 删除藏宝图玩法的普通怪和boss
destoryAllGoblin() ->
	MapID = mapState:getMapId(),
	?LOG_OUT("goblin end MapID = ~p", [MapID]),
	case getCfg:getCfgPStack(cfg_goblin, MapID) of
		#goblinCfg{monsterid = MID, bossid = BID} ->
			gameMapLogic:destroyAllMonsterByID(MID),
			gameMapLogic:destroyAllMonsterByID(BID);
		_ ->
			?ERROR_OUT("Destory goblin failed!")
	end.
%% 哥布林死啦
-spec goblinBeKilled(MonsterID :: uint()) -> ok.
goblinBeKilled(MonsterID) ->
	MapID = mapState:getMapId(),
	case lists:member(MapID, getCfg:get1KeyList(cfg_goblin)) of
		true ->
			#goblinCfg{monsterid = MID, bossid = BID} = getCfg:getCfgPStack(cfg_goblin, MapID),
			if
				MonsterID =:= MID ->
					%%此时还没删除当前这个怪，所以要-1
					LeftNum = gameMapLogic:getMonsterNumByID(MID),
					Fun1 = fun(#recMapObject{pid = PlayerPid}) ->
						psMgr:sendMsg2PS(PlayerPid, goblinKilled, LeftNum-1)
					end,
					gameMapLogic:doFun4AllPlayer(Fun1);
				MonsterID =:= BID ->
					Fun2 = fun(#recMapObject{pid = PlayerPid}) ->
						psMgr:sendMsg2PS(PlayerPid, goblinBossKilled)
					end,
					gameMapLogic:doFun4AllPlayer(Fun2);
				true ->
					skip
			end;
		_ ->
			skip
	end,
	ok.
