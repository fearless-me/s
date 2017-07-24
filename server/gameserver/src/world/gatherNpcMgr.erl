%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 采集npc管理模块
%%% @end
%%% Created : 24. 一月 2015 14:24
%%%-------------------------------------------------------------------
-module(gatherNpcMgr).
-author("tiancheng").

-include("mapPrivate.hrl").
-include("copyMapScheduleDefine.hrl").

%% API
-export([
	init/0,
	gatherTick/0,
	requestGatherItem/1,
	deleteCollect/1,
	deleteCollectFast/1,
	deleteObject/2,
	deleteObjectFast/2
]).

%% init
-spec init() -> ok.
init() ->
	%% 开启采集物管理心跳
	timerMgr:registerTimer(?GatherNpcFreshTick,gatherNpcMgr,gatherTick,[]),
	ok.

%% 采集物刷新
gatherTick() ->
	case mapState:getGatherWaitReliveList() of
		[] ->
			skip;
		List ->
			[gatherFresh(R) || R <- List]
	end,
	ok.

gatherFresh(#gatherWaitReliveRec{code = Code, id = GatherID, deadTime = DeadTime,x = X,y = Y} = WG) ->
	IsDel = case getCfg:getCfgPStack(cfg_object, GatherID) of
				#objectCfg{freshCD = 0} ->
					%% 不刷新
					true;
				#objectCfg{freshCD = CD} when CD > 0 ->
					NowTime = time:getUTCNowMS(),
					case ((NowTime - DeadTime) div 1000) >= CD of
						true ->
							%% 到刷新时间
							GroupID = WG#gatherWaitReliveRec.groupid,
							copyMapScheduleInit:addCollectToMap(GroupID, [{GatherID,1,X,Y}], ?AddMonsterRange),

							true;
						_ ->
							false
					end;
				_ ->
					?ERROR_OUT("gatherFresh:~p", [GatherID]),
					true
			end,
	case IsDel of
		true ->
			Msg = #recAcCollectItemArg{
				mapID = mapState:getMapId(),
				mapPid = self(),
				collectID = GatherID,
				x = X,
				y = Y,
				code = Code
			},
			AcList = activity:getOperateActCfgByType(?OperateActType_CollectItem),
			activity:castOperateActEvent(AcList, #recOperateActivityArg{type = ?OperateActType_CollectItem,arg = Msg}),
			mapState:delGatherWaitReliveList(Code);
		_ ->
			skip
	end,
	ok.

%% 请求采集
-spec requestGatherItem({Code::uint(), GatherID::uint()}) -> false | uint().
requestGatherItem({Code, GatherID}) ->
	CollectEts = mapState:getMapCollectEts(),
	case myEts:lookUpEts(CollectEts, Code) of
		[#recMapObject{id = GatherID, hp = HP, maxHp = MaxHP, groupID = GroupID} = Obj] when HP > 0 orelse MaxHP =:= 0 ->
			%% 可以采集
			case MaxHP =:= 0 of
				false ->
					SYHp = HP - 1,
					case SYHp > 0 of
						true ->
							%% 还可以采集
							myEts:updateEts(CollectEts, Code, {#recMapObject.hp, SYHp});
						_ ->
							%% 回收
							deleteCollect(Code),

							%% 准备复活
							R = #gatherWaitReliveRec{
								code = Code,
								id = GatherID,
								x = Obj#recMapObject.x,
								y = Obj#recMapObject.y,
								rotw = Obj#recMapObject.rotW,
								groupid = Obj#recMapObject.groupID,
								deadTime = time:getUTCNowMS()
							},
							mapState:addGatherWaitReliveList(R)
					end;
				_ ->
					%% 这是一个可以无限采集的东西
					skip
			end,
			psMgr:sendMsg2PS(self(), collectItem, {Code, GatherID, GroupID, 1}),
			%% 采集成功
			GatherID;
		_ ->
			%% 采集失败
			false
	end.

%% 删除采集物
-spec deleteCollect(Code::uint()) -> ok.
deleteCollect(Code) ->
	%% 从复活列表中删除
	mapState:delGatherWaitReliveList(Code),

	%% 从ets中删除
	CollectEts = mapState:getMapCollectEts(),
	deleteObject(CollectEts, Code),
	ok.

%% 从ets删除对象
-spec deleteObject(TargetEts::etsTab(), Code::uint()) -> ok.
deleteObject(TargetEts, Code) ->
	case ets:member(TargetEts, Code) of
		true ->
			[#recMapObject{groupID = GroupID}] = myEts:lookUpEts(TargetEts, Code),

			%% 需要回收
			myEts:deleteEts(TargetEts, Code),

			%% 广播通知客户端
			PlayerEts = mapState:getMapPlayerEts(),
			Msg = #pk_GS2U_BroadcastDisapear{code = [Code]},
			mapView:sendMsg2AllPlayer(self(), PlayerEts, Msg, GroupID);
		_ ->
			?ERROR_OUT("Map Pid:~p deleteObject Code:~p from Ets:~p", [self(),TargetEts,Code]),
			skip
	end,
	ok.

%% 删除采集物（快速）
-spec deleteCollectFast(Code::uint()) -> ok.
deleteCollectFast(Code) ->
	%% 从复活列表中删除
	mapState:delGatherWaitReliveList(Code),

	%% 从ets中删除
	CollectEts = mapState:getMapCollectEts(),
	deleteObjectFast(CollectEts, Code),
	ok.

%% 从ets删除对象（快速）
-spec deleteObjectFast(TargetEts::etsTab(), Code::uint()) -> ok.
deleteObjectFast(TargetEts, Code) ->
	case ets:member(TargetEts, Code) of
		true ->
			[#recMapObject{groupID = GroupID}] = myEts:lookUpEts(TargetEts, Code),

			%% 需要回收
			myEts:deleteEts(TargetEts, Code),

			%% 广播通知客户端
			PlayerEts = mapState:getMapPlayerEts(),
			Msg = #pk_GS2U_BroadcastDisapearFast{code = [Code]},
			mapView:sendMsg2AllPlayer(self(), PlayerEts, Msg, GroupID);
		_ ->
			?ERROR_OUT("Map Pid:~p deleteObject Code:~p from Ets:~p", [self(),TargetEts,Code]),
			skip
	end,
	ok.