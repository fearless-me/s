%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%% 活动模块逻辑
%%% 约会地下城（活动）
%%% @end
%%% Created : 20161202
%%%-------------------------------------------------------------------
-module(acDateLogic).
-author("meitianyang").

-include("acDatePrivate.hrl").

%% 本进程任意玩法可调用的工具类接口
-export([
	spawnObject/3,
	spawnObject/2,
	clearObject/2,
	clearObjectFast/2,
	clearAllObject/2,
	setTimerMain/3,
	getPlayerPidNetPidFromThisMap/2,
	sendNetMsg2PlayerFromThisMap/3,
	getPlayerPosFromThisMap/2
]).

%% 本进程调用的常规接口
-export([
	init/0,
	enterTry/2,
	enterCreate/1,
	active/3
]).

%% 本进程调用的系统接口
-export([
	activityChangeCallBack/1,
	activityMapMsg/2,
	createActivityMapAck/1,
	spawnObjectAck/2,
	breakRole/1,
	deleteRole/1,
	onTimerMain/2,
	onTimerTick/0,
	canEnterMap/2
]).

%%% ====================================================================
%%% Tools functions
%%% ====================================================================

%% 创建对象（带反馈消息）
-spec spawnObject(MapPid::pid(), Arg::term(), ExParam::#recAckData{}) -> ok.
spawnObject(MapPid, Arg, ExParam) ->
	psMgr:sendMsg2PS(MapPid, spawnObject, {Arg, ?ActivityType_Date, ?MsgTypeSpawnAck, ExParam}),
	ok.
%% 创建对象（不带反馈消息）
-spec spawnObject(MapPid::pid(), Arg::term()) -> ok.
spawnObject(MapPid, Arg) ->
	psMgr:sendMsg2PS(MapPid, spawnObject, {Arg, 0, 0, 0}),
	ok.
%% 清除对象，不需要反馈消息
-spec clearObject(MapPid::pid(), {CodeType::code_type(), CodeList::[uint64(), ...]}) -> ok.
clearObject(_, {_, []}) ->
	ok;
clearObject(MapPid, Msg) ->
	psMgr:sendMsg2PS(MapPid, clearObject, Msg),
	ok.
%% 快速清除对象，不需要反馈消息
-spec clearObjectFast(MapPid::pid(), {CodeType::code_type(), CodeList::[uint64(), ...]}) -> ok.
clearObjectFast(_, {_, []}) ->
	ok;
clearObjectFast(MapPid, Msg) ->
	psMgr:sendMsg2PS(MapPid, clearObjectFast, Msg),
	ok.
%% 清除所有指定类型的对象，不需要反馈消息
-spec clearAllObject(MapPid::pid(), CodeType::code_type()) -> ok.
clearAllObject(MapPid, CodeType) ->
	psMgr:sendMsg2PS(MapPid, clearAllObject, CodeType),
	ok.

%% 发送主计时器消息
-spec setTimerMain(Time::uint(), MapPid::pid(), ExParam::#recAckData{}) -> TimerRef::term().
setTimerMain(Time, MapPid, ExParam) ->
	erlang:send_after(Time, self(), {?MsgTypeTimerMain, MapPid, ExParam}).
%% 获取用户的Pid，仅当用户在这张地图时有效
-spec getPlayerPidNetPidFromThisMap(RoleID::uint64(), PlayerEts::etsTab()) -> {pid(), pid()} | undefined.
getPlayerPidNetPidFromThisMap(RoleID, PlayerEts) ->
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{code = Code} ->
			case ets:lookup(PlayerEts, Code) of
				[#recMapObject{pid = Pid, netPid = NetPid}] ->
					{Pid, NetPid};
				_ ->
					undefined %% 在线但是不在这里
			end;
		_ ->
			undefined %% 不在线
	end.
%% 向地图上的玩家发送网络消息
-spec sendNetMsg2PlayerFromThisMap(RoleID::uint64(), PlayerEts::etsTab(), Msg::term()) -> ok.
sendNetMsg2PlayerFromThisMap(RoleID, PlayerEts, Msg) ->
	case getPlayerPidNetPidFromThisMap(RoleID, PlayerEts) of
		{_, NetPid} ->
			gsSendMsg:sendNetMsg(NetPid, Msg);
		_ ->
			skip
	end,
	ok.


%% 获取地图上玩家坐标
-spec getPlayerPosFromThisMap(RoleID::uint64(), PlayerEts::etsTab()) -> {X::float(), Y::float()}.
getPlayerPosFromThisMap(RoleID, PlayerEts) ->
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{code = Code} ->
			case ets:lookup(PlayerEts, Code) of
				[#recMapObject{x  = X, y = Y}] ->
					{X, Y};
				_ ->
					{0,0} %% 在线但是不在这里
			end;
		_ ->
			{0,0} %% 不在线
	end.

%%% ====================================================================
%%% API functions 公共回调
%%% ====================================================================

%% 主活动模块进程回调
-spec activityChangeCallBack(Phase::uint()) -> ok.
activityChangeCallBack(?ActivityPhase_Close) ->
	%?DEBUG_OUT("[DebugForDate] activityChangeCallBack ?ActivityPhase_Close"),
	ok;
activityChangeCallBack(Phase) ->
	?ERROR_OUT("activityChangeCallBack:~p", [Phase]),
	ok.

%% 活动地图的消息
-spec activityMapMsg(MsgType::uint(), Data::term()) -> ok.
%% 创建后的初始化消息
activityMapMsg(?ACMapMsg_CreateMap, {_CreateRoleID,_MapID,MapPid, PlayerEts, MonsterEts, CollectEts, NpcEts} = _Data) ->
	%?DEBUG_OUT("[DebugForDate] activityMapMsg ?ACMapMsg_CreateMap ~p", [_Data]),
	case acDateState:queryMapInfo(MapPid) of
		#recMapInfo{roleID_A = RoleID_A, roleID_B = RoleID_B, mapID = MapID, activeID = ActiveID} = RecOld ->
			RecNew = RecOld#recMapInfo{
				playerEts   = PlayerEts,
				collectEts  = CollectEts,
				monsterEts  = MonsterEts,
				npcEts      = NpcEts
			},
			acDateState:replaceMapInfo(RecNew),
			%% 创建地图的初始化
			Mod = daid2mod(ActiveID),
			Mod:initAfterCreate(RecNew),
			%% 通知玩家进入地图
			notifyPlayerEnter(RoleID_A, {MapID, MapPid, ActiveID, RoleID_B}),
			notifyPlayerEnter(RoleID_B, {MapID, MapPid, ActiveID, RoleID_A});

		_ ->
			?ERROR_OUT("activityMapMsg ACMapMsg_CreateMap map is not exists! ~p", [_Data])
	end,
	ok;
%% 销毁地图
activityMapMsg(?ACMapMsg_DestoryMap, MapPid) ->
	%?DEBUG_OUT("[DebugForDate] activityMapMsg ?ACMapMsg_DestoryMap ~p", [MapPid]),
	case acDateState:queryMapInfo(MapPid) of
		#recMapInfo{activeID = ActiveID} = RecOld->
			%% 需要在具体的玩法逻辑中删除地图信息
			Mod = daid2mod(ActiveID),
			Mod:giveup(RecOld, {RecOld#recMapInfo.roleID_A, true}),
			?ERROR_OUT("activityMapMsg ACMapMsg_DestoryMap map is not exists! ~p", [MapPid]);
		_ ->
			skip
	end,
	ok;
%% 玩家进入
activityMapMsg(?ACMapMsg_PlayerEnter, {RoleID, MapPid, #recMapObject{}} = _Data) ->
	%?DEBUG_OUT("[DebugForDate] activityMapMsg ?ACMapMsg_PlayerEnter ~p", [_Data]),
	case acDateState:queryMapInfo(MapPid) of
		#recMapInfo{isInitAfterFE = IsInitAfterFE, activeID = ActiveID} = RecOld ->
			Mod = daid2mod(ActiveID),
			RecNew =
				case IsInitAfterFE of
					false ->
						%% 玩家首次进入的初始化

						Mod:initAfterFirstEnter(RecOld);
					_ ->
						RecOld
				end,

			Mod:playerEnter(RecNew, RoleID);
		_ ->
			?ERROR_OUT("activityMapMsg ACMapMsg_PlayerEnter map is not exists! ~p", [MapPid])
	end,
	ok;
%% 玩家离开
activityMapMsg(?ACMapMsg_PlayerLeave, {RoleID, MapPid, #recMapObject{}} = _Data) ->
	%?DEBUG_OUT("[DebugForDate] activityMapMsg ?ACMapMsg_PlayerLeave ~p", [_Data]),
	case acDateState:queryMapInfo(MapPid) of
		#recMapInfo{activeID = ActiveID} = RecOld ->
			Mod = daid2mod(ActiveID),
			Mod:playerLeave(RecOld, RoleID);
		_ ->
			skip % 可能地图已被销毁
	end,
	ok;

%% 怪物死亡
activityMapMsg(?ACMapMsg_KillMonster ,{_MapID, _MapPID, AttackRoleID, _MonsterCode, MonsterID}=_Data) ->
	%%MonsterID是战天下才用的镜像id,就是镜像被杀了
	case acDateState:queryMapInfo(_MapPID) of
		#recMapInfo{activeID = ActiveID} = RecOld ->
			Mod = daid2mod(ActiveID),
			Mod:monsterDead(RecOld,_MonsterCode);
		_ ->
			skip % 可能地图已被销毁
	end,
	ok;

%% 忽略其它消息
activityMapMsg(_, _) ->
	%%?ERROR_OUT("msg:~p,~p", [ErrorType, ErrorData]),
	ok.

%% 创建地图成功（比?ACMapMsg_CreateMap更先收到）
-spec createActivityMapAck({MapID::uint(), ListMapPid::list(), {DateActiveID::type_daid(), RoleID::uint64(), AnotherRoleID::uint64(),DailyCount::uint(),AnOtherDailyCount::uint()}}) -> ok.
createActivityMapAck({MapID, [MapPid], {DateActiveID, RoleID, AnotherRoleID,DailyCount,AnOtherDailyCount}} = _Data) ->
	%?DEBUG_OUT("[DebugForDate] createActivityMapAck RoleID(~p) AnotherRoleID(~p) DateActiveID(~p) MapID(~p) MapPid(~p)", [RoleID, AnotherRoleID, DateActiveID, MapID, MapPid]),
	case acDateState:queryMapInfoHelper(RoleID, DateActiveID) of
		#recKeyInfo{} ->
			?ERROR_OUT("createActivityMapAck map is exists! will resetCopyMap new ~p", [_Data]),
			psMgr:sendMsg2PS(MapPid, resetCopyMap, {});	%% 错误的创建，强制关闭副本
		_ ->
			%% 构建地图信息
			{RoleID_A, RoleID_B,RoleA_DailyCount ,RoleB_DailyCount} =
				case RoleID < AnotherRoleID of
					true ->
						{RoleID, AnotherRoleID,DailyCount,AnOtherDailyCount};
					_ ->
						{AnotherRoleID, RoleID,AnOtherDailyCount,DailyCount}
				end,
			MapInfo =
				#recMapInfo{
					mapPID          = MapPid,         % 地图进程ID
					mapID           = MapID,          % 地图ID
					activeID        = DateActiveID,   % 玩法ID
					roleID_A        = RoleID_A,       % 较小角色ID
					roleID_B        = RoleID_B,       % 较大角色ID
					createMapTime   = time:getSyncUTCTimeFromDBS(),
					isInitAfterC    = false,          % 玩法逻辑是否执行了创建地图后的初始化
					isInitAfterFE   = false,          % 玩法逻辑是否执行了玩家首次进入后的初始化
					roleA_enterCount        = RoleA_DailyCount,     % 玩家计入次数
					roleB_enterCount        = RoleB_DailyCount,     % 玩家计入次数
					paramEx         = undefined       % 各玩法自定义扩展数据
				},
			acDateState:replaceMapInfo(MapInfo)
	end,
	ok.

%% 创建对象成功的回执消息
-spec spawnObjectAck(FromPid::pid(), {Code::boolean(), RecAckData::#recAckData{}}) -> ok.
spawnObjectAck(FromPid, {Code, #recAckData{activeID = ActiveID, paramEx = ParamEx}} = Msg) ->
	%?DEBUG_OUT("[DebugForDate] spawnObjectAck ~p", [Msg]),
	case acDateState:queryMapInfo(FromPid) of
		#recMapInfo{} = MapInfo ->
			Mod = daid2mod(ActiveID),

			Mod:spawnObjectAck(MapInfo, Code, ParamEx);

		_ ->
			?ERROR_OUT("spawnObjectAck map is not exists! ~p~n~p", [FromPid, Msg])
	end,
	ok.

%% 删除角色处理
-spec breakRole(RoleID::uint64()) -> ok.
breakRole(RoleID) ->
	?LOG_OUT("breakRole ~p", [RoleID]),
	ListHelper = acDateState:queryMapInfoHelperAll(RoleID),
	FunBreak =
		fun(#recKeyInfo{mapPID = MapPid, activeID = ActiveID}) ->
			case acDateState:queryMapInfo(MapPid) of
				#recMapInfo{} = MapInfo ->
					Mod = daid2mod(ActiveID),
					Mod:playerBreak(MapInfo, RoleID);
				_ ->
					skip
			end
		end,
	lists:foreach(FunBreak, ListHelper),
	ok.

%% 删除角色处理
-spec deleteRole(RoleID::uint64()) -> ok.
deleteRole(RoleID) ->
	?LOG_OUT("deleteRole ~p", [RoleID]),
	ListHelper = acDateState:queryMapInfoHelperAll(RoleID),
	FunDelete =
		fun(#recKeyInfo{mapPID = MapPid, activeID = ActiveID}) ->
			case acDateState:queryMapInfo(MapPid) of
				#recMapInfo{} = MapInfo ->
					Mod = daid2mod(ActiveID),
					Mod:playerDelete(MapInfo, RoleID);
				_ ->
					skip
			end
		end,
	lists:foreach(FunDelete, ListHelper),
	ok.



%% 主计时器消息响应
-spec onTimerMain(MapPid::pid(), RecAckData::#recAckData{}) -> ok.
onTimerMain(MapPid, #recAckData{activeID = ActiveID, paramEx = ParamEx} = Msg) ->
	%?DEBUG_OUT("[DebugForDate] onTimerMain ~p", [Msg]),
	case acDateState:queryMapInfo(MapPid) of
		#recMapInfo{} = MapInfo ->
			Mod = daid2mod(ActiveID),
			Mod:onTimerMain(MapInfo, ParamEx);
		_ ->
			?ERROR_OUT("onTimerMain map is not exists! ~p~n~p", [MapPid, Msg])
	end,
	ok.

%% 秒级心跳消息响应
-spec onTimerTick() -> ok.
onTimerTick() ->
	%?DEBUG_OUT("[DebugForDate] onTimerTick"),
	erlang:send_after(?TimeTick, self(), ?MsgTypeTimerTick),
	FunTick =
		fun(#recMapInfo{mapPID = MapPid, activeID = ActiveID} = MapInfo, _) ->
			case erlang:is_pid(MapPid) of
				true ->
					Mod = daid2mod(ActiveID),
					Mod:onTimerTick(MapInfo);
				_ ->
					skip
			end,
			[]  %% 固定返回空列表
		end,
	acDateState:traverseMapInfo(FunTick),
	ok.

%%% ====================================================================
%%% API functions 常规接口
%%% ====================================================================

%% 初始化
-spec init() -> ok.
init() ->
	%?DEBUG_OUT("[DebugForDate] init"),
	acDateState:init(),
	erlang:send_after(?TimeTick, self(), ?MsgTypeTimerTick),
	ok.



canEnterMap(RoleID,DateActiveID) ->
	case acDateState:queryMapInfoHelper(RoleID, DateActiveID) of
		#recKeyInfo{mapID = MapID, mapPID = MapPid, anotherRoleID = AnotherRoleID} ->
			case acDateState:queryMapInfo(MapPid) of
				#recMapInfo{paramEx = undefined} ->
					%% 创建中
					false;
				MapInfoOld ->
					%% 地图已存在，可以进入
					%% 玩法判断是否可以进入
					MapPid
			end;
		_ ->
			%% 地图不存在
			false
	end.
%% 尝试进入
-spec enterTry(Pid::pid(), {RoleID::uint64(), DateActiveID::type_daid(), IsGM::boolean()}) -> ok.
enterTry(Pid, {RoleID, DateActiveID, IsGM}) ->
	%?DEBUG_OUT("[DebugForDate] enterTry RoleID(~p) DateActiveID(~p)", [RoleID, DateActiveID]),
	case acDateState:queryMapInfoHelper(RoleID, DateActiveID) of
		#recKeyInfo{mapID = MapID, mapPID = MapPid, anotherRoleID = AnotherRoleID} ->
			case acDateState:queryMapInfo(MapPid) of
				#recMapInfo{paramEx = undefined} ->
					%% 创建中
					skip;
				MapInfoOld ->
					%% 地图已存在，可以进入
					%% 玩法判断是否可以进入
					Mod = daid2mod(DateActiveID),
					case Mod:playerEnterCheck(MapInfoOld, RoleID) of
						{_, true} ->
							psMgr:sendMsg2PS(Pid, date_enterTryAck, {MapID, MapPid, DateActiveID, AnotherRoleID});
						_ ->
							skip  %% 已由各玩法逻辑处理
					end
			end;
		_ ->
			%% 地图不存在，需要创建
			case IsGM of
				true ->
					%% GM模式直接创建地图
					?ERROR_OUT("aIsGMs! ~p", [RoleID]),
					enterCreate({DateActiveID, RoleID, 0,0,0});
				_ ->
					%% 正常模式继续走流程
					psMgr:sendMsg2PS(Pid, date_enterTryAck, DateActiveID)
			end
	end,
	ok.

%% 创建地图
-spec enterCreate({DateActiveID::type_daid(), RoleID::uint64(), AnotherRoleID::uint64(),DailyCount::uint(),AnOtherDailyCount::uint()}) -> ok.
enterCreate({DateActiveID, RoleID, AnotherRoleID,DailyCount,AnOtherDailyCount} = Key) ->
	%?DEBUG_OUT("[DebugForDate] enterCreate RoleID(~p) AnotherRoleID(~p) DateActiveID(~p)", [RoleID, AnotherRoleID, DateActiveID]),
	case acDateState:queryMapInfoHelper(RoleID, DateActiveID) of
		#recKeyInfo{} ->
			%% 地图已存在，忽略该请求
			?WARN_OUT("enterCreate map is exists! RoleID(~p) AnotherRoleID(~p) DateActiveID(~p)", [RoleID, AnotherRoleID, DateActiveID,DailyCount,AnOtherDailyCount]),
			skip;
		_ ->
			%% 地图不存在，创建

			MapID_ = acDateState:getMapIDWithActiveID(DateActiveID),
			core:sendMsgToMapMgr(MapID_, createActivityMap, {MapID_, 1, Key})
	end,
	ok.

%% 将Otp收到的消息加工后转给对应的玩法逻辑处理
-spec active(FromPid::pid(), MsgType::atom(), {RoleID::uint64(), OtherMsg::term()}) -> ok.
active(FromPid, MsgType, {RoleID, _OtherMsg} = Msg) ->
	%?DEBUG_OUT("[DebugForDate] active ~p", [{FromPid, MsgType, Msg}]),
	%% 寻找当前地图信息
	ActiveID = msgType2daid(MsgType),
	case acDateState:queryMapInfoHelper(RoleID, ActiveID) of
		#recKeyInfo{mapPID = MapPid} ->
			case acDateState:queryMapInfo(MapPid) of
				#recMapInfo{} = MapInfo ->
					active(FromPid, MsgType, Msg, MapInfo);
				_ ->
					?ERROR_OUT("active can not find MapInfo!")
			end;
		_ ->
			?WARN_OUT("active can not find MapInfoHelper!"),
			skip  %% 忽略无效的信息
	end,
	ok.
-spec active(FromPid::pid(), MsgType::atom(), Msg::term(), MapInfo::#recMapInfo{}) -> ok.
active(_FromPid, date_link_link, Msg, MapInfo) ->
	acDateActivity_Link:link(MapInfo, Msg),
	ok;
active(_FromPid, date_link_reshuffle, {RoleID, IsGM}, MapInfo) ->
	case IsGM of
		true ->
			acDateActivity_Link:createMatrix(MapInfo, 0);
		_ ->
			acDateActivity_Link:createMatrix(MapInfo, RoleID)
	end,
	ok;
active(_FromPid, date_link_end, Msg, MapInfo) ->
	acDateActivity_Link:giveup(MapInfo, Msg),
	ok;
active(_FromPid, date_link_buff, {_RoleID, BuffType}, MapInfo) ->
	acDateActivity_Link:buffForGM(MapInfo, BuffType),
	ok;

active(_FromPid, date_touch_box,Msg, MapInfo) ->
	acDateActivity_PushBox:link(MapInfo, Msg),
	ok;
active(_FromPid, date_pool_shooting,Msg, MapInfo) ->
	acDateActivity_PoolParty:link(MapInfo, Msg),
	ok.

%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%% 通知玩家进程进入地图
-spec notifyPlayerEnter(RoleID::uint64(), {MapID::uint(), MapPid::pid(), DateActiveID::type_daid(), AnotherRoleID::uint64()}) -> ok.
notifyPlayerEnter(RoleID, Msg) ->
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{pid = Pid} ->
			psMgr:sendMsg2PS(Pid, date_enterTryAck, Msg);
		_ ->
			skip
	end,
	ok.

%% 根据玩法ID获得玩法模块原子
-spec daid2mod(DateActiveID::type_daid()) -> Mod::atom().
daid2mod(?DateActiveID_Link) -> acDateActivity_Link;
daid2mod(?DateActiveID_PushBox) -> acDateActivity_PushBox;
daid2mod(?DateActiveID_PoolParty) -> acDateActivity_PoolParty;
daid2mod(?DateActiveID_FindTreasure) -> acDateActivity_FindeTreasure.






%% 根据消息类型获得玩法ID
-spec msgType2daid(MsgType::atom()) -> DateActiveID::type_daid().
msgType2daid(date_link_link)      -> ?DateActiveID_Link;
msgType2daid(date_link_reshuffle) -> ?DateActiveID_Link;
msgType2daid(date_link_end)       -> ?DateActiveID_Link;
msgType2daid(date_link_buff)      -> ?DateActiveID_Link;
msgType2daid(date_touch_box)      -> ?DateActiveID_PushBox;
msgType2daid(date_pool_shooting)      -> ?DateActiveID_PoolParty.


