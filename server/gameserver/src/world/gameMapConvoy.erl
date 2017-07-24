%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 护送
%%% @end
%%% Created : 09. 三月 2017 15:01
%%%-------------------------------------------------------------------
-module(gameMapConvoy).
-author(tiancheng).

-include("mapPrivate.hrl").
-include("bst.hrl").

-define(ConvoyTimeOut, 15*60*1000).
-define(ConvoyTickIntervalTime, 3000).
-define(ConvoyTickErrorTimes, 3).
-define(ConvoyDistance, 10).

%% API
-export([
	initMapConvoy/1,
	leaveConvoy/1,
	tick/1,
	monsterDead/1,
	convoyEnd/1
]).

%% 初始化护送
initMapConvoy({#recConvoyInfo{roleID = RoleID, roleCode = RoleCode, extData = ExData} = Info, #monsterCfg{} = Cfg, {PX, PY}}) ->
	convoyEnd({Info#recConvoyInfo.roleID}),

	MonsterEts = mapState:getMapMonsterEts(),
	PlayerEts = mapState:getMapPlayerEts(),
	PetEts = mapState:getMapPetEts(),

	case ets:lookup(PlayerEts, RoleCode) of
		[#recMapObject{id = RoleID, name = PlayerName, guild = GuildID, groupID = GroupID}] ->
			MonsterName = io_lib:format("~ts(~ts)", [Cfg#monsterCfg.showName, PlayerName]),

			%% 创建护送
			Arg = #recSpawnMonster{
				id = Info#recConvoyInfo.monsterID,
				name = MonsterName,
				mapID = mapState:getMapId(),
				mapPid = self(),
				x = float(trunc(PX)),
				y = float(trunc(PY)),
				rotW = 0.0,
				level = Cfg#monsterCfg.level,
				camp = 0,
				guildID = GuildID,
				playerEts = PlayerEts,
				monsterEts = MonsterEts,
				petEts = PetEts,
				groupID = GroupID,
				params = ExData,
				other = #recCallConvoy{roleID = RoleID, roleCode = RoleCode},
				initBattlePropCallBack = undefined
			},
			creatureBase:initConvoyCreature(?InitMonster, Arg, Info#recConvoyInfo.monsterCode),

			mapState:addConvoyInfoList(Info#recConvoyInfo{timeOut = time:getUTCNowMS() + ?ConvoyTimeOut}),
			monsterAI:setAIEvent(Info#recConvoyInfo.monsterCode, ?BSTCondVar_IsSelfAlive, 1),
			ok;
		_ ->
			convoyEnd(Info)
	end,
	ok.

tick(NowTimeMS) ->
	case mapState:getConvoyInfoList() of
		[] ->
			skip;
		List ->
			LastTimeMS = mapState:getLastConvoyTickTime(),
			case NowTimeMS - LastTimeMS >= ?ConvoyTickIntervalTime of
				true ->
					mapState:setLastConvoyTickTime(NowTimeMS),
					tickConvoy(List);
				_ ->
					skip
			end
	end,
	ok.

tickConvoy(#recConvoyInfo{timeOut = TimeOut, errorTimes = ErrorTimes} = Info) ->
	case time:getUTCNowMS() >= TimeOut of
		false ->
			case checkDis(Info) of
				true ->
					mapState:addConvoyInfoList(Info#recConvoyInfo{errorTimes = 0});
				_ ->
					ErrorTimes2 = ErrorTimes + 1,
					case ErrorTimes2 >= getConvoyCfgTimes() of
						true ->
							playerMsg:sendErrorCodeMsg(Info#recConvoyInfo.playerNetPid, ?ErrorCode_SystemConvoyFailed),
							convoyEnd(Info),
							mapState:delConvoyInfoList(Info);
						_ ->
							playerMsg:sendErrorCodeMsg(Info#recConvoyInfo.playerNetPid, ?ErrorCode_SystemConvoyTargetDistince),
							mapState:addConvoyInfoList(Info#recConvoyInfo{errorTimes = ErrorTimes2})
					end
			end;
		_ ->
			?ERROR_OUT("tickConvoy timeout:~p", [Info]),
			convoyEnd(Info),
			mapState:delConvoyInfoList(Info)
	end,
	ok;
tickConvoy([]) -> ok;
tickConvoy([#recConvoyInfo{} = Info | List]) ->
	tickConvoy(Info),
	tickConvoy(List).


getConvoyCfgTimes()->
	case getCfg:getCfgByArgs(cfg_globalsetup, convoy_task_range_time) of
		#globalsetupCfg{setpara = [_L,V]}->
			V;
		_ ->
			{?ConvoyTickErrorTimes}
	end.

getConvoyCfgDistance()->
	case getCfg:getCfgByArgs(cfg_globalsetup, convoy_task_range_time) of
		#globalsetupCfg{setpara = [V,_N]}->
			V;
		_ ->
			{?ConvoyDistance}
	end.

monsterDead(Code) ->
	case monsterState:getIsConvoy(Code) of
		true ->
			L = mapState:getConvoyInfoList(),
			case lists:keyfind(Code, #recConvoyInfo.monsterCode, L) of
				#recConvoyInfo{} = Info ->
					convoyEnd(Info);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% 护送失败
convoyEnd(#recConvoyInfo{monsterID = ID, monsterCode = Code} = Info) ->
	?LOG_OUT("convoyFailed:~p", [Info]),

	%% 通知玩家回调
	psMgr:sendMsg2PS(
		Info#recConvoyInfo.playerPid,
		convoyFailedCallBack,
		{Info#recConvoyInfo.monsterID, Code, Info#recConvoyInfo.extData}
	),

	%% 回收目标
	recycle(ID, Code),
	ok;
%% 护送成功
convoyEnd({success, RoleID}) ->
	L = mapState:getConvoyInfoList(),
	case lists:keyfind(RoleID, #recConvoyInfo.roleID, L) of
		false ->
			?ERROR_OUT("not find convoy success:~p", [RoleID]),
			skip;
		#recConvoyInfo{monsterID = ID, monsterCode = Code} = Info ->
			?LOG_OUT("success convoyEnd ~p", [Info]),
			mapState:delConvoyInfoList(Info),

			%% 回收目标
			recycle(ID, Code)
	end,
	ok;
%% 放弃护送
convoyEnd({Pid, RoleID}) ->
	L = mapState:getConvoyInfoList(),
	case lists:keyfind(RoleID, #recConvoyInfo.roleID, L) of
		false ->
			?ERROR_OUT("not find convoy:~p", [RoleID]),
			psMgr:sendMsg2PS(Pid, convoyFailedCallBack, {RoleID, false});
		Info ->
			?LOG_OUT("giveup convoyFailed ~p", [Info]),
			mapState:delConvoyInfoList(Info),
			convoyEnd(Info)
	end,
	ok;
%% 处理地图上该玩家的老护送
convoyEnd({RoleID}) ->
	L = mapState:getConvoyInfoList(),
	case lists:keyfind(RoleID, #recConvoyInfo.roleID, L) of
		false ->
			skip;
		Info ->
			?LOG_OUT("dealOldConvoy ~p", [Info]),
			mapState:delConvoyInfoList(Info),
			convoyEnd(Info)
	end,
	ok.

%% 离开护送
leaveConvoy(RoleID) ->
	L = mapState:getConvoyInfoList(),
	case lists:keyfind(RoleID, #recConvoyInfo.roleID, L) of
		false ->
			skip;
		#recConvoyInfo{monsterID = MonsterID, monsterCode = Code} = Info ->
			?LOG_OUT("leaveConvoy ~p", [Info]),

			%% 回收目标
			recycle(MonsterID, Code),

			mapState:delConvoyInfoList(Info)
	end,
	ok.

checkDis(#recConvoyInfo{roleID = RoleID, roleCode = RoleCode, monsterID = MonsterID, monsterCode = MonsterCode}) ->
	PEts = mapState:getMapPlayerEts(),
	MEts = mapState:getMapMonsterEts(),
	case ets:lookup(PEts, RoleCode) of
		[#recMapObject{id = RoleID, groupID = PGroupID} = PObj] ->
			case ets:lookup(MEts, MonsterCode) of
				[#recMapObject{groupID = PGroupID, id = MonsterID, ownId = RoleID, ownCode = RoleCode} = MObj] ->
					MaxDistance = getConvoyCfgDistance(),
					case mapView:getObjectDist(PObj, MObj) of
						{ok, Dist, _, _} when Dist =< MaxDistance ->
%%							?DEBUG_OUT("checkDis:~p,~p,~p,~p,~p", [RoleID,RoleCode,MonsterID,MonsterCode,Dist]),
							true;
						_ ->
							false
					end;
				_ ->
					false
			end;
		_ ->
			false
	end.

%% 回收目标
recycle(MonsterID, MonsterCode) ->
	Ets = mapState:getMapMonsterEts(),
	case ets:lookup(Ets, MonsterCode) of
		[#recMapObject{id = MonsterID}] ->
			gameMapLogic:destroyMonster(MonsterCode, self());
		Error ->
			?ERROR_OUT("recycle:~p,~p,~p", [MonsterID, MonsterCode, Error])
	end,
	ok.