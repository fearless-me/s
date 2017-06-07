%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 玩家数据机器人模块
%%% @end
%%% Created : 25. 四月 2017 14:26
%%%-------------------------------------------------------------------
-module(playerRob).
-author(tiancheng).

-include("playerPrivate.hrl").
-include("rob.hrl").

-define(WaitRobEnterMapTime, 3000).
%% 机器人最大生命周期s
-define(RobLifeMaxTime, 3600).

%% API
-export([
	createRob/1,
	sendToMeLoadRobRoleData/2,
	sendToMeLRobPlayerExit/3,
	loadRobRoleData/1,
	loadRobRoleDataAck/1,
	rob_enterMap_tick/0,
	rob_tick/0,
	enterMapIng/1,
	enterMapReal/1,
	robPlayerCanExit/2
]).

-export([
	getRobType/0
]).

%% 创建一个机器人进程
-spec createRob(RoleID::uint64()) -> pid().
createRob(RoleID) ->
	{ok, Pid} = playerOtp:start_link([RoleID, rob_player_otp]),
	?LOG_OUT("createRob:~p,~p", [RoleID, Pid]),
	erlang:send_after(?RobLifeMaxTime * 1000, Pid, rob_max_life_time),
	Pid.

%% 机器人能否退出
-spec robPlayerCanExit(TargetCode::uint64(), TargetRoleID::uint64()) -> boolean().
robPlayerCanExit(TargetCode, TargetRoleID) ->
	RobCode = playerState:getPlayerCode(),
	RobRoleID = playerState:getRobRoleID(),
	case playerState:getIsPlayer() of
		true ->
			?ERROR_OUT("not rob player:~p,~p,~p", [TargetCode, TargetRoleID, RobCode]),
			false;
		_ ->
			case TargetRoleID =:= RobRoleID andalso TargetCode =:= RobCode of
				true ->
					?LOG_OUT("playerotp exit:roleid=~p,code=~p,robroleid=~p,name:~ts",
						[playerState:getRoleID(),RobCode,RobRoleID,playerState:getName()]),
					true;
				_ ->
					?ERROR_OUT("not correct rob player:~p,~p,~p,~p", [TargetCode, TargetRoleID, RobCode, RobRoleID]),
					false
			end
	end.

%% 发送消息给机器人进程
-spec sendToMeLoadRobRoleData(Pid::pid(), #rec_LoadRobData{}) -> ok.
sendToMeLoadRobRoleData(Pid, #rec_LoadRobData{} = LoadData) ->
	psMgr:sendMsg2PS(Pid, loadRobRoleData, LoadData).

%% 发送消息给机器人进程退出
-spec sendToMeLRobPlayerExit(Pid::pid(), Code::uint64(), RoleID::uint64()) -> ok.
sendToMeLRobPlayerExit(Pid, Code, RoleID) ->
	psMgr:sendMsg2PS(Pid, robplayerExit, {Code, RoleID}).

-spec loadRobRoleData(#rec_LoadRobData{}) -> ok.
loadRobRoleData(#rec_LoadRobData{robRoleID = RobRoleID, robType = RobType} = LoadData) when
	RobType >= ?RobType_Start andalso RobType =< ?RobType_End ->
	playerPropSync:setAny(?SerProp_RobRoleLoadData, LoadData),
	?LOG_OUT("loadRobRoleData:~p,~p", [RobRoleID, RobType]),
	Ret = playerEDBLoad:loadRole(RobRoleID),
	loadRobRoleDataAck(Ret),
	ok;
loadRobRoleData(LoadData) ->
	?ERROR_OUT("loadRobRoleData:~p,~p,~p,~p", [playerState:getRoleID(), playerState:getRobRoleID(), self(), LoadData]),
	ok.

loadRobRoleDataAck(false) ->
	?ERROR_OUT("loadRobRoleDataAck false:~p,~p,~p", [playerState:getRoleID(), playerState:getRobRoleID(), self()]),
	ok;
loadRobRoleDataAck(true) ->
	%% 加载成功，把本身的roleID置0
	RoleID = playerState:getRoleID(),
	RobRoleID = playerState:getRobRoleID(),
	RoleID = RobRoleID,

	?LOG_OUT("loadRobRoleDataAck:~p", [RoleID]),

	%% 置零
	playerState:setRoleID(0),
	MaxHp = playerState:getMaxHp(),
	?DEBUG_OUT("robot[~p] change hp ~p -> ~p",[RoleID, playerState:getCurHp(), MaxHp]),
	playerState:setCurHp(MaxHp),

	%% 机器人加载完毕
	LoadData = #rec_LoadRobData{
		robEnterMap = Map
	} = playerPropSync:getProp(?SerProp_RobRoleLoadData),
	loadRobRoleDataOk(LoadData),

	%% 机器人战斗初始化
	playerRobBattle:rob_battle_init(),

	%% 进入地图
	#rec_RobEnterMap{
		mapID = TMapID,
		mapPID = TMapPID,
		x = TX,
		y = TY
	} = Map,
	playerScene:rob_requestEnterMap(TMapID, TMapPID, TX, TY),

	%% 等待机器人进入地图延时
	erlang:send_after(?WaitRobEnterMapTime, self(), rob_entermap_tick),
	ok.

loadRobRoleDataOk(#rec_LoadRobData{robType = ?RobType_NormalMapFollow, param = Code}) ->
	playerPropSync:setInt64(?SerProp_RobRoleTargetCode, Code),
	ok;
loadRobRoleDataOk(#rec_LoadRobData{robType = ?RobType_Ladder1v1, param = CreateRank}) ->
	%% 设置自己的状态
	playerPropSync:setInt(?SerProp_PlayerInLadder1v1, CreateRank),
	ok;
loadRobRoleDataOk(_Data) ->
	ok.

rob_enterMap_tick() ->
	?DEBUG_OUT("rob_entermap_tick:~p,~ts deal enter game", [playerState:getRobRoleID(), playerState:getName()]),
	playerMap:dealEnteredGame(0),
	ok.

-spec rob_tick() -> ok.
rob_tick() ->
	case playerState:getIsPlayer() of
		false ->
			playerRobBattle:rob_battle_tick();
		_ ->
			skip
	end,
	ok.

%% 进入切场景流程(包含机器人)
enterMapIng(MapID) ->
	playerLadder1v1:onEnterLadder1v1Map(MapID),
	ok.

%% 玩家真正进入战场地图
enterMapReal(MapID) ->
	playerLadder1v1:playerEnterMapReal(MapID),
	ok.

getRobType() ->
	case playerPropSync:getProp(?SerProp_RobRoleLoadData) of
		#rec_LoadRobData{robType = RobType} -> RobType;
		_ ->
			?ERROR_OUT("getRobType:~p,~p", [playerState:getRoleID(), playerState:getRobRoleID()]),
			?RobType_Error
	end.