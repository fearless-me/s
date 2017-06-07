%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, 好玩一二三
%%% @doc
%%% 地图模块，活动相关的处理逻辑
%%% @end
%%% Created : 09. 二月 2015 15:44
%%%-------------------------------------------------------------------
-module(gameMapActivityLogic).
-author("tiancheng").

-include("mapPrivate.hrl").
-include("activityDef.hrl").

%% API
-export([
	createMap/1,
	destoryMap/0,
	hurtMonster/4,
	killMonster/3,
	killPlayer/3,
	playerOffline/1,
	playerEnterACMap/2,
	playerLeaveACMap/2,
	sendMsgToAcProcess/2
]).

%% 创建地图
createMap(CreateRoleID) ->
	sendMsgToAcProcess(?ACMapMsg_CreateMap,
					   {
						   CreateRoleID,
						   mapState:getMapId(),
						   self(),
						   mapState:getMapPlayerEts(),
						   mapState:getMapMonsterEts(),
						   mapState:getMapCollectEts(),
						   mapState:getMapNpcEts()
					   }).

%% 销毁地图
-spec destoryMap() -> ok.
destoryMap() ->
	sendMsgToAcProcess(?ACMapMsg_DestoryMap, self()).

hurtMonster(AttackRoleID, MonsterCode, MonsterID, Damage) ->
	sendMsgToAcProcess(?ACMapMsg_HurtMonster, {mapState:getMapId(), self(), AttackRoleID, MonsterCode, MonsterID, Damage}).

killMonster(AttackRoleID, MonsterCode, MonsterID) ->
	sendMsgToAcProcess(?ACMapMsg_KillMonster, {mapState:getMapId(), self(), AttackRoleID, MonsterCode, MonsterID}).
%%击杀玩家
killPlayer(AttackRoleID,DeadRoleID, DeadRoleCode) ->
	sendMsgToAcProcess(?ACMapMsg_KillPlayer, {mapState:getMapId(), self(), AttackRoleID, DeadRoleCode, DeadRoleID}).

playerEnterACMap(RoleID, #recMapObject{groupID = GroupID} = RoleObj) ->
	case GroupID =:= 0 of
		true ->
			sendMsgToAcProcess(?ACMapMsg_PlayerEnter, {RoleID, self(), RoleObj});
		_ ->
			skip
	end.
playerLeaveACMap(RoleID, #recMapObject{groupID = GroupID} = RoleObj) ->
	case GroupID =:= 0 of
		true ->
			sendMsgToAcProcess(?ACMapMsg_PlayerLeave, {RoleID, self(), RoleObj});
		_ ->
			skip
	end.
playerOffline(RoleID) ->
	core:sendMsgToActivity(?ActivityType_HDBattle, playerOffline,RoleID),
	core:sendMsgToActivity(?ActivityType_Darkness, playerOffline,RoleID),
	MapID = playerState:getMapID(),
	AcList = getCfg:get1KeyList(cfg_activity),
	Fun =
		fun(Key) ->
			#activityCfg{mapidlist = MapIDList} = getCfg:getCfgPStack(cfg_activity, Key),
			case lists:member(MapID, MapIDList) of
				true ->
					core:sendMsgToActivity(Key,activityMapMsg,{?ACMapMsg_Offline, RoleID});
				_ ->
					skip
			end
		end,
	lists:foreach(Fun, AcList).

%% 发消息给活动子进程
sendMsgToAcProcess(Type, Data) ->
	ACList = getActivityIDList(),
	Fun = fun(Key) ->
		core:sendMsgToActivity(Key, activityMapMsg, {Type, Data})
	end,
	lists:foreach(Fun, ACList),
	ok.

%% 通过地图ID获取活动ID列表
-spec getActivityIDList() -> list().
getActivityIDList() ->
	MapID = mapState:getMapId(0),
	AcList = getCfg:get1KeyList(cfg_activity),
	Fun = fun(Key, AccIDList) ->
		#activityCfg{mapidlist = MapIDList} = getCfg:getCfgPStack(cfg_activity, Key),
		case lists:member(MapID, MapIDList) of
			true ->
				[Key | AccIDList];
			_ ->
				AccIDList
		end
	end,
	lists:foldl(Fun, [], AcList).