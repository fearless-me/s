%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%%
%%% @end
%%% Created : 08. 十月 2014 10:52
%%%-------------------------------------------------------------------
-module(groupBase).
-author("tiancheng").

-include("groupPrivate.hrl").

-define(GIDEts,groupUIDEts).

%% API
-export([
	getNewGroupID/1,
	getMapIDByGroupID/1,
	playerGroupChange/1,
	recycleEmptyGroup/0,
	canSeeTarget/2,
	canSeeMe/2,
	playerLeaveGroup/2,
	playerEnterMap/2,
	getMinGroupID/0
]).

-export([initGroup/0]).

initGroup() ->
	ets:new(?GIDEts, [public, named_table]),
	ets:insert(?GIDEts,{1,?GroupIDNormalNumber}),
	ok.

%% 获取一个新的分组ID
-spec getNewGroupID(MapID::uint()) -> uint().
getNewGroupID(MapID) ->
	ID = makeGroupUID(),
	<<GroupID:64>> = <<ID:48, MapID:16>>,
	GroupID.

%% 通过分组ID获取分组的mapid
-spec getMapIDByGroupID(GroupID::uint()) -> MapID::uint().
getMapIDByGroupID(GroupID) ->
	case GroupID > getMinGroupID() of
		true ->
			<<_ID:48, MapID:16>> = <<GroupID:64>>,
			MapID;
		_ ->
			0
	end.

%% 玩家分组发生改变
-spec playerGroupChange(Msg::tuple()) -> ok.
playerGroupChange(Msg) ->
	{OldGroupID, NewGroupID, #recGroupPlayerInfo{roleCode = Code, mapPID = _MapPID, rolePID = _RolePID} = PlayerInfo} = Msg,

	delPlayer(OldGroupID, Code),

	addPlayer(NewGroupID, PlayerInfo),

	%% 告诉地图，有玩家进入分组了
%% 	case NewGroupID > getMinGroupID() of
%% 		true ->
%% 			psMgr:sendMsg2PS(MapPID, playerEntermap, {Code});
%% 		_ ->
%% 			skip
%% 	end,
	ok.

%% 玩家退出分组
-spec playerLeaveGroup(GroupID::uint(), RoleCode::uint()) -> ok.
playerLeaveGroup(GroupID, RoleCode) ->
	delPlayer(GroupID, RoleCode),
	ok.

%% 玩家进入地图
-spec playerEnterMap(GroupID::uint(), #recGroupPlayerInfo{}) -> ok.
playerEnterMap(GroupID, #recGroupPlayerInfo{} = RoleInfo) ->
	updatePlayer(GroupID, RoleInfo),
	ok.

%% 自己所在分组能否看见目标所在分组
-spec canSeeTarget(SelfGroupID::uint(), TargetGroupID::uint()) -> boolean().
canSeeTarget(SelfGroupID, TargetGroupID) ->
	if
		SelfGroupID =:= TargetGroupID ->
			true;
		TargetGroupID =:= ?Group_AllVisible ->
			true;
		true ->
			false
	end.

%% 目标所在分组能否看见自己所在分组
-spec canSeeMe(SelfGroupID::uint(), TargetGroupID::uint()) -> boolean().
canSeeMe(SelfGroupID, TargetGroupID) ->
	canSeeTarget(TargetGroupID, SelfGroupID).

%% 回收空的分组，注意，这里只回收新分配的分组，暂不考虑回收特殊分组
-spec recycleEmptyGroup() -> ok.
recycleEmptyGroup() ->
	NowTime = time:getUTCNowSec() - ?EmptyGroupRetainTime,
	MinGroupNormalID = getMinGroupID(),
	MS = ets:fun2ms(fun(Group) when
		Group#recGroup.playerList =:= [] andalso NowTime >= Group#recGroup.lastOpTime andalso Group#recGroup.groupID > MinGroupNormalID ->
		{Group#recGroup.mapPid, Group#recGroup.groupID}
	end),
	RecycleLust = myEts:selectEts(?GroupEts, MS),

	Fun = fun({MPID, GID}) ->
		psMgr:sendMsg2PS(MPID, clearGroupAllObject, GID),
		ets:delete(?GroupEts, GID),
		ok
	end,
	lists:foreach(Fun, RecycleLust),
	ok.

%% 在一个分组中删除一个玩家
-spec delPlayer(GroupID::uint(), RoleCode::uint()) -> ok.
delPlayer(GroupID, RoleCode) ->
	case myEts:lookUpEts(?GroupEts, GroupID) of
		[#recGroup{playerList = PlayerList}] ->
			NPlayerList = lists:keydelete(RoleCode, #recGroupPlayerInfo.roleCode, PlayerList),
			myEts:updateEts(?GroupEts, GroupID, [{#recGroup.playerList, NPlayerList}, {#recGroup.lastOpTime, time:getUTCNowSec()}]),
			ok;
		_ ->
 			%%?ERROR_OUT("there is not found groupid:~p,~p", [GroupID,RoleCode]),
			skip
	end,
	ok.

%% 更新一个分组中的玩家
-spec updatePlayer(GroupID::uint(), #recGroupPlayerInfo{}) -> ok.
updatePlayer(GroupID, #recGroupPlayerInfo{roleCode = Code} = RoleInfo) ->
	delPlayer(GroupID, Code),
	addPlayer(GroupID, RoleInfo),
	ok.

%% 在一个分组中添加一个玩家
-spec addPlayer(NewGroupID::uint(), #recGroupPlayerInfo{}) -> ok.
addPlayer(NewGroupID, #recGroupPlayerInfo{mapID = MapID, mapPID = MapPID, rolePID = RolePID, roleCode = Code} = GroupPlayer) ->
	NowTime = time:getUTCNowSec(),
	case myEts:lookUpEts(?GroupEts, NewGroupID) of
		[#recGroup{playerList = PlayerList}] ->
			%% 有该分组的信息，判断成员是否存在，如果存在，则更新
			Code = GroupPlayer#recGroupPlayerInfo.roleCode,
			NPlayerList = lists:keystore(Code, #recGroupPlayerInfo.roleCode, PlayerList, GroupPlayer),
			myEts:updateEts(?GroupEts, NewGroupID,
				[{#recGroup.playerList, NPlayerList}, {#recGroup.lastOpTime, NowTime}]);
		_ ->
			%% 没有该分组的信息，插入一条数据
			ets:insert(?GroupEts, #recGroup{groupID = NewGroupID, mapID = MapID, mapPid = MapPID,
				groupCreateTime = NowTime, lastOpTime = NowTime, playerList = [GroupPlayer]}),

			%% 新分组，发给地图初始化进度
			case NewGroupID > getMinGroupID() of
				true ->
					GroupMapID = getMapIDByGroupID(NewGroupID),
					psMgr:sendMsg2PS(MapPID, initBitCopyMap, {NewGroupID, GroupMapID, Code, RolePID});
				_ ->
					skip
			end
	end,
	ok.

%% 获取最小的普通分组id
-spec getMinGroupID() -> uint().
getMinGroupID() ->
	<<GroupID:64>> = <<?GroupIDNormalNumber:48, 0:16>>,
	GroupID.

-spec makeGroupUID() -> uint().
makeGroupUID() ->
	ets:update_counter(?GIDEts, 1, 1).
