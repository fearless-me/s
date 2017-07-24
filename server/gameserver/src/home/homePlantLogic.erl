%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 家园逻辑模块_种植区
%%% @end
%%% Created : 20170825
%%%-------------------------------------------------------------------
-module(homePlantLogic).
-author(meitianyang).

-include("gsInc.hrl").

-export([
	loadHomeDataAck/1	% 加载种植区数据
]).

-export([
	plant/1,			%% 种植区操作
	plantFailed/1,		%% 操作失败处理
	plantTryRefresh/1	%% 尝试刷新作物状态（仅在当前上下文逻辑上刷新，不做内存和DB数据的改变
]).

%%%-------------------------------------------------------------------
% 加载种植区数据
-spec loadHomeDataAck(HomeArea::#rec_home_area{}) -> HomeAreaNew::#rec_home_area{}.
loadHomeDataAck(#rec_home_area{areaID = AreaID} = HomeArea) when
	AreaID =/= ?Home_Plantation_A,
	AreaID =/= ?Home_Plantation_B,
	AreaID =/= ?Home_Plantation_C ->
	HomeArea;	%% 不是种植区，忽略
loadHomeDataAck(#rec_home_area{homeID = {HomeID, _}, areaID = AreaID, areaData = Data} = HomeArea) ->
	List =
		try
			loadHomeDataAck(misc:string_to_term(Data), {HomeID, AreaID}, [])
		catch
			_A:_B ->
				?ERROR_OUT("loadHomeDataAck invalid Data:~ts", [Data]),
				?ERROR_OUT("loadHomeDataAck ~w.~w~n~p", [_A, _B, misc:getStackTrace()]),
				[]
		end,
	HomeArea#rec_home_area{areaData = List}.
loadHomeDataAck([], _HalfKey, Acc) ->
	misc:term_to_string(lists:reverse(Acc));	%% 反转列表是为了保持原有顺序
loadHomeDataAck([{Pos, _ID, _Time} | T], {HomeID, _AreaID} = HalfKey, Acc) when
	Pos < 1, Pos > ?HomePlantPosMax ->
	?ERROR_OUT("loadHomeDataAck Invalid HomeID:~w Pos:~w", [HomeID, Pos]),
	loadHomeDataAck(T, HalfKey, Acc);
loadHomeDataAck([{Pos, ID, Time} = H | T], {HomeID, AreaID} = HalfKey, Acc) ->
	case getCfg:getCfgPStack(cfg_home_plants, ID) of
		#home_plantsCfg{} = Cfg ->
			{_, Plant} = plantTryRefresh({true, HomeID, AreaID, Pos, Time}, Cfg),
			ets:insert(?EtsHomePlant, Plant),
			loadHomeDataAck(T, HalfKey, [H | Acc]);
		_ ->
			loadHomeDataAck(T, HalfKey, Acc)
	end.

%%%-------------------------------------------------------------------
% 目标作物可能需要刷新
-spec plantTryRefresh(#recHomePlant{}|false) -> {boolean(), #recHomePlant{}|false}.
plantTryRefresh(false) ->
	{false, false};
plantTryRefresh(#recHomePlant{id = ID} = PlantOld) ->
	Cfg = getCfg:getCfgPStack(cfg_home_plants, ID),
	plantTryRefresh(PlantOld, Cfg).

%%%-------------------------------------------------------------------
% 目标作物可能需要刷新（内部实现、DB初始化接口、新作物初始化接口）
-spec plantTryRefresh(#recHomePlant{} | {boolean(), uint64(), uint8(), uint8(), uint32()}, #home_plantsCfg{}) -> {boolean(), #recHomePlant{}}.
% 目标作为刚从DB读取，尚未生成内存数据，因此返回必然需要刷新
plantTryRefresh(
	{true, HomeID, AreaID, Pos, Time},
	#home_plantsCfg{
		id = PlantID,
		growtime = [T1, T2, T3], health = [_Default, Max],
		pestis = [_TimePestisMin, _TimePestisMax, PestisCountMax, _PestisSubHealth]
	}
) ->
	TimeNow = time:getSyncTimeFromDBS(),
	TimeEnd = Time + (T1 + T2 + T3) * 60,
	Health =
		case TimeNow >= TimeEnd of
			true ->
				0;
			_ ->
				Max	%% 重启服务导致作物满健康
		end,
	Plant = #recHomePlant{
		key = {HomeID, AreaID, Pos},
		id = PlantID,
		time = Time,
		health = Health,
		pestis = {false, PestisCountMax, 0}	%% 重启服务导致作物免受虫害
	},
	{true, Plant};
% 新种植作物，尚未生成内存数据，因此返回必然需要刷新
plantTryRefresh(
	{false, HomeID, AreaID, Pos, Time},
	#home_plantsCfg{id = PlantID, growtime = [T1, T2, T3], health = [Default, _Max]} = Cfg
) ->
	TimeNow = time:getSyncTimeFromDBS(),
	TimeEnd = Time + (T1 + T2 + T3) * 60,
	Health =
		case TimeNow >= TimeEnd of
			true ->
				0;
			_ ->
				Default
		end,
	Plant = #recHomePlant{
		key = {HomeID, AreaID, Pos},
		id = PlantID,
		time = Time,
		health = Health
	},
	{_, PlantNew} = plantTryRefresh_pestis(Plant, Cfg, {TimeNow, TimeEnd}),
	{true, PlantNew};
% 目标已经枯萎，不需要计算
plantTryRefresh(#recHomePlant{health = 0} = PlantOld, _Cfg) ->
	{false, PlantOld};
% 目标尚未枯萎，根据种植时间和虫害时间判断是否枯萎
plantTryRefresh(
	#recHomePlant{time = TimePlant} = PlantOld,
	#home_plantsCfg{growtime = [T1, T2, T3]} = Cfg
	) ->
	TimeNow = time:getSyncTimeFromDBS(),
	TimeEnd = TimePlant + (T1 + T2 + T3) * 60,
	case TimeNow >= TimeEnd of
		true ->
			{true, PlantOld#recHomePlant{health = 0}};	%% 已经枯萎
		_ ->
			plantTryRefresh_pestis(PlantOld, Cfg, {TimeNow, TimeEnd})
	end.
%% 对plantTryRefresh/2虫害部分的补充，亦可用作下次虫害时间的刷新
-spec plantTryRefresh_pestis(#recHomePlant{}, #home_plantsCfg{}, {uint32(), uint32()}) -> {boolean(), #recHomePlant{}}.
%% 虫害中，计算虫害影响健康值变化
plantTryRefresh_pestis(
	#recHomePlant{health = Health, pestis = {IsPestis, PestisCount, TimePestis}} = PlantOld,
	#home_plantsCfg{pestis = [_TimePestisMin, _TimePestisMax, _PestisCountMax, PestisSubHealth]},
	{TimeNow, _TimeEnd}
) when TimeNow >= TimePestis, TimePestis =/= 0 ->
	case (TimeNow - TimePestis) div 3600 of
		0 when IsPestis =:= false ->
			{true, PlantOld#recHomePlant{pestis = {true, PestisCount, TimePestis}}};	%% 标记为虫害状态
		0 ->
			{false, PlantOld};	%% 时间差太小，不足以影响计算
		TimePestisUse ->
			TimePestisNew = TimePestis + TimePestisUse * 3600,
			HealthNew = Health - TimePestisUse * PestisSubHealth,
			{true, PlantOld#recHomePlant{health = HealthNew, pestis = {true, PestisCount, TimePestisNew}}}
	end;
%% 非虫害中且虫害时间未满，计算下一次虫害时间
plantTryRefresh_pestis(
	#recHomePlant{id = _IDA, time = TimePlant, pestis = {IsPestis, PestisCount, TimePestis}} = PlantOld,
	#home_plantsCfg{id = _IDB, pestis = [TimePestisMin, TimePestisMax, PestisCountMax, _PestisSubHealth]},
	{_TimeNow, TimeEnd}
) when PestisCount < PestisCountMax, TimePestis =:= 0 ->
	TimePestisMinTemp = TimePlant + TimePestisMin * 60,
	TimePestisMaxTemp = TimePlant + TimePestisMax * 60,
	TimePestisMinReal = erlang:max(TimePestisMinTemp, TimePlant),
	TimePestisMaxReal = erlang:min(TimePestisMaxTemp, TimeEnd),
	case TimePestisMinReal > TimePestisMaxReal of
		true ->
			%% 目标幸运地躲过了虫害（或者是一次性经历了太久的虫灾，想想那个水淹了小船1次，却淹了大船3次的脑筋急转弯）
			{false, PlantOld};
		_ ->
			TimePestisNext = misc:rand(TimePestisMinReal, TimePestisMaxReal),
			%% 有大先知预言目标会遇到虫害，早点枯萎可以逃脱此劫
			?DEBUG_OUT("[DebugForHomePlant] ID:~w.~w TimePestisMin:~w TimePestisMax:~w TimePlant:~w TimePestisNext:~w", [_IDA, _IDB, TimePestisMin, TimePestisMax, TimePlant, TimePestisNext]),
			{true, PlantOld#recHomePlant{pestis = {IsPestis, PestisCount + 1, TimePestisNext}}}
	end;
% 恭喜道友渡劫成功
plantTryRefresh_pestis(PlantOld, _Cfg, _TimeArg) ->
	{false, PlantOld}.

%%%-------------------------------------------------------------------
% 对作物的操作可能需要角色进程消耗货币或道具，因此需要在角色进程操作
% 同时，可能有多个人对同一作物进行操作，因此需要在公共进程进行最终操作
% 其中很多逻辑相似，汇总在此
-spec plant({IsInRole, OpType, RoleID, GlobalPos, ItemID, Cost}) -> no_return() when
	IsInRole :: boolean(),														%% true在角色进程；false在家园公共进程
	OpType :: ?HomePlant_BEGIN .. ?HomePlant_END,								%% 操作类型
	RoleID :: uint64(),															%% 操作者角色ID
	GlobalPos :: {HomeID, AreaType, Pos},										%% 操作目标绝对坐标
	HomeID :: uint64(),															%% 家园ID
	AreaType :: ?Home_Plantation_A | ?Home_Plantation_B | ?Home_Plantation_C,	%% 区域ID
	Pos :: 1 .. ?HomePlantPosMax,												%% 种植点
	ItemID :: uint16(),															%% 可能消耗的道具ID
	Cost :: argsBack().															%% 如果有消耗需要返还
plant({IsInRole, OpType, RoleID, {HomeID, _AreaID, _Pos} = GlobalPos, ItemID, CostCoin}) ->
	%% 确认操作者身份
	HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
	%% 确认目标作物状态
	Plant = homeInterface:queryHomePlant(GlobalPos),
	{NeedUpdate, PlantNew} = plantTryRefresh(Plant),
	?DEBUG_OUT("[DebugForHomePlant] HomeID:~w RoleID:~w HomeRole:~w~n~w~nTimeNow:~w", [HomeID, RoleID, HomeRole, PlantNew, time:getSyncTimeFromDBS()]),
	case NeedUpdate of
		true when IsInRole =:= false ->
			%% 此处刷新下内存值，节省下次计算，不存数据库
			ets:insert(?EtsHomePlant, PlantNew);
		_ ->
			skip
	end,
	%% 执行操作
	plantOperate(IsInRole, OpType, HomeRole, PlantNew, RoleID, GlobalPos, ItemID, CostCoin).

%%%-------------------------------------------------------------------
% 操作失败处理
-spec plantFailed({IsInRole, RoleID, OpType, Reason, Plant, GlobalPos, Cost}) -> no_return() when
	IsInRole :: boolean(),
	RoleID :: uint64(),
	OpType :: ?HomePlant_BEGIN .. ?HomePlant_END,
	Reason :: {uint32(), list()},
	Plant :: #recHomePlant{} | false,
	GlobalPos :: {HomeID, AreaType, Pos},
	HomeID :: uint64(),
	AreaType :: ?Home_Plantation_A | ?Home_Plantation_B | ?Home_Plantation_C,
	Pos :: 1 .. ?HomePlantPosMax,
	Cost :: argsBack().
% 不在角色进程时，交给角色进程处理
plantFailed({false, RoleID, OpType, Reason, Plant, GlobalPos, Cost}) ->
	Pid = core:queryPlayerPidByRoleID(RoleID),
	psMgr:sendMsg2PS(Pid, plantFailed, {true, RoleID, OpType, Reason, Plant, GlobalPos, Cost});
% 在角色进程时直接处理
plantFailed({true, RoleID, OpType, {ErrorCode, ErrorArgs}, Plant, GlobalPos, Cost}) ->
	playerBase:backRes(Cost),			%% 返还资源
	?ERROR_CODE(ErrorCode, ErrorArgs),	%% 发送ErrorCode
	%% 同步目标状态
	PlantForNetMsg =
		case Plant of
			#recHomePlant{} ->
				playerHomePlant:plant2NetMsg(Plant);
			_ ->
				playerHomePlant:plant2NetMsg(GlobalPos)
		end,
	playerMsg:sendNetMsg(#pk_GS2U_HomePlantOperate_Ack{
		roleID = RoleID,
		operateType = OpType,
		reason = ErrorCode,
		plant = PlantForNetMsg
	}).

%%%-------------------------------------------------------------------
% 操作成功处理
-spec plantSuccess(RoleID, OpType, Plant, GlobalPos, PlantID, Health) -> no_return() when
	RoleID :: uint64(),
	OpType :: ?HomePlant_BEGIN .. ?HomePlant_END,
	Plant :: #recHomePlant{} | false,
	GlobalPos :: {HomeID, AreaType, Pos},
	HomeID :: uint64(),
	AreaType :: ?Home_Plantation_A | ?Home_Plantation_B | ?Home_Plantation_C,
	Pos :: 1 .. ?HomePlantPosMax,
	PlantID :: uint16(),	%% PlantID和Plant无关，收获时Plant必然为false，此处给出PlantID便于收获资源
	Health :: uint8().		%% Health和Plant无关，收获时Plant必然为false，此处给出Health便于收获资源
plantSuccess(RoleID, OpType, Plant, {HomeID, _AreaID, _Pos} = GlobalPos, PlantID, Health) ->
	%% 仅收获时需要通知操作者进程添加资源
	case OpType of
		?HomePlant_Harvest ->
			Pid = core:queryPlayerPidByRoleID(RoleID),
			psMgr:sendMsg2PS(Pid, plantSuccess, {RoleID, OpType, Plant, GlobalPos, PlantID, Health});
		_ ->
			skip
	end,
	%% 通知地图上所有角色
	case ets:lookup(?HomeMapEts, {HomeID, ?Home_Courtyard}) of
		[#rec_home_map{mapPID = MapPid}] ->
			PlantForNetMsg =
				case Plant of
					#recHomePlant{} ->
						playerHomePlant:plant2NetMsg(Plant);
					_ ->
						playerHomePlant:plant2NetMsg(GlobalPos)
				end,
			Msg = #pk_GS2U_HomePlantOperate_Ack{
				roleID = RoleID,
				operateType = OpType,
				reason = 0,
				plant = PlantForNetMsg
			},
			psMgr:sendMsg2PS(MapPid, plantSuccess, Msg);
		_ ->
			skip
	end.

%%%-------------------------------------------------------------------
% 作物关键数据的存储
-spec plantSave(Plant) -> no_return() when
	Plant :: #recHomePlant{} | {uint64(), uint8(), uint8()}.
%% 刷新
plantSave(#recHomePlant{key = {HomeID, AreaID, Pos}, id = ID, time = Time} = Plant) ->
	case ets:lookup(?HomeAreaEts, {HomeID, AreaID}) of
		[#rec_home_area{areaData = StrDataOld} = AreaOld] ->
			ListDataOld = misc:string_to_term(StrDataOld),
			case lists:keyfind(Pos, 1, ListDataOld) of
				{Pos, ID, Time} ->
					skip;	%% 数据相同，不需要更新
				_ ->
					ListDataNew = lists:keystore(Pos, 1, ListDataOld, {Pos, ID, Time}),
					StrDataNew = misc:term_to_string(ListDataNew),
					AreaNew = AreaOld#rec_home_area{areaData = StrDataNew},
					ets:insert(?HomeAreaEts, AreaNew),
					homeInterface:saveHome(AreaNew)
			end;
		_ ->
			?ERROR_OUT("can not find area~n~p~n~p", [Plant, misc:getStackTrace()])
	end;
%% 删除
plantSave({HomeID, AreaID, Pos}) ->
	case ets:lookup(?HomeAreaEts, {HomeID, AreaID}) of
		[#rec_home_area{areaData = StrDataOld} = AreaOld] ->
			ListDataOld = misc:string_to_term(StrDataOld),
			case lists:keyfind(Pos, 1, ListDataOld) of
				false ->
					skip;	%% 数据不存在，忽略
				_ ->
					AreaNew =
						case lists:keydelete(Pos, 1, ListDataOld) of
							[] ->
								AreaOld#rec_home_area{areaData = []};
							ListDataNew ->
								StrDataNew = misc:term_to_string(ListDataNew),
								AreaOld#rec_home_area{areaData = StrDataNew}
						end,
					ets:insert(?HomeAreaEts, AreaNew),
					homeInterface:saveHome(AreaNew)
			end;
		_ ->
			skip	%% 没有找到区域，忽略
	end.

%%%-------------------------------------------------------------------
% 以下是种植区的各种操作实现
-spec plantOperate(IsInRole, OpType, HomeRole, Plant, RoleID, GlobalPos, ItemID, Cost) -> no_return() when
	IsInRole :: boolean(),
	OpType :: ?HomePlant_BEGIN .. ?HomePlant_END,
	HomeRole :: ?HomeRole_BEGIN .. ?HomeRole_END,
	Plant :: #recHomePlant{} | false,
	RoleID :: uint64(),
	GlobalPos :: {HomeID, AreaType, Pos},
	HomeID :: uint64(),
	AreaType :: ?Home_Plantation_A | ?Home_Plantation_B | ?Home_Plantation_C,
	Pos :: 1 .. ?HomePlantPosMax,
	ItemID :: uint16(),
	Cost :: argsBack().

% ?HomePlant_Plant 种植
% 已种植时反馈失败
plantOperate(IsInRole, ?HomePlant_Plant = OpType, _HomeRole, #recHomePlant{} = Plant, RoleID, GlobalPos, _ItemID, Cost) ->
	plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_AlreadyPlant, []}, Plant, GlobalPos, Cost});
% 只有主人和伴侣能够在未种植时种植（角色进程扣除资源
plantOperate(true = IsInRole, ?HomePlant_Plant = OpType, HomeRole, false = Plant, RoleID, GlobalPos, ItemID, Cost) when
	HomeRole =:= ?HomeRole_Master; HomeRole =:= ?HomeRole_Partner ->
	%% 1.检查配置
	case getCfg:getCfgByKey(cfg_item, ItemID) of
		#itemCfg{itemType = ?ItemTypeSeed, useParam1 = PlantID} ->
			case getCfg:getCfgPStack(cfg_home_plants, PlantID) of
				#home_plantsCfg{buy_type = CoinUseType, price = CoinCount} ->
					%% 2.优先扣除已有道具
					case playerBase:costRes(?BackType_Item, ItemID, 1, ?PLogTS_Home, ?ItemDeleteReasonHomePlantOP, ?ItemSourceHomePlantOPBack) of
						{true, CostItem} ->
							psMgr:sendMsg2PS(?HomeOtp, plant, {false, OpType, RoleID, GlobalPos, ItemID, [CostItem]});
						_ ->
							%% 3.没有道具就扣钱当作是买道具了，省略中间道具变化
							case playerBase:costRes(?BackType_Coin, CoinUseType, CoinCount, ?PLogTS_Home, ?CoinUseHomePlantOP, ?CoinSourceHomePlantOPBack) of
								{true, CostCoin} ->
									psMgr:sendMsg2PS(?HomeOtp, plant, {false, OpType, RoleID, GlobalPos, ItemID, [CostCoin]});
								_ ->
									plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_PlantWithoutMoney, []}, Plant, GlobalPos, Cost})
							end
					end;
				_ ->
					skip	%% 该错误已有报错，即便回复客户端也无济于事，此处忽略
			end;
		_ ->
			skip %% 该错误可能是异常发包导致，忽略
	end;
% 只有主人和伴侣能够在未种植时种植（公共进程执行操作
plantOperate(false, ?HomePlant_Plant = OpType, HomeRole, false, RoleID, {HomeID, AreaID, Pos} = GlobalPos, ItemID, _Cost) when
	HomeRole =:= ?HomeRole_Master; HomeRole =:= ?HomeRole_Partner ->
	%% 1.检查配置（如果角色进程通过配置检查，则公共进程一定能取到配置
	case getCfg:getCfgByKey(cfg_item, ItemID) of
		#itemCfg{itemType = ?ItemTypeSeed, useParam1 = PlantID} ->
			case getCfg:getCfgPStack(cfg_home_plants, PlantID) of
				#home_plantsCfg{} = CfgPlant ->
					%% 2.在内存中初始化作物数据
					TimeNow = time:getSyncTimeFromDBS(),
					{_, PlantNew} = plantTryRefresh({false, HomeID, AreaID, Pos, TimeNow}, CfgPlant),
					ets:insert(?EtsHomePlant, PlantNew),
					%% 3.向DB保存作物关键数据
					plantSave(PlantNew),
					%% 4.向地图上所有角色同步操作成功的数据
					plantSuccess(RoleID, OpType, PlantNew, GlobalPos, PlantID, PlantNew#recHomePlant.health)
			end;
		_ ->
			skip %% 该错误可能是异常发包导致，忽略
	end;
% 访客没有权限
plantOperate(IsInRole, ?HomePlant_Plant = OpType, _HomeRole, Plant, RoleID, GlobalPos, _ItemID, Cost) ->
	plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_Guest, []}, Plant, GlobalPos, Cost});

% ?HomePlant_Grubbing 清除
% 对象为空时反馈失败
plantOperate(IsInRole, ?HomePlant_Grubbing = OpType, _HomeRole, false = Plant, RoleID, GlobalPos, _ItemID, Cost) ->
	plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_TarNull, []}, Plant, GlobalPos, Cost});
% 只有主人和伴侣能够执行清除（角色进程直接通知公共进程
plantOperate(true, ?HomePlant_Grubbing = OpType, HomeRole, #recHomePlant{}, RoleID, GlobalPos, ItemID, Cost) when
	HomeRole =:= ?HomeRole_Master; HomeRole =:= ?HomeRole_Partner ->
	psMgr:sendMsg2PS(?HomeOtp, plant, {false, OpType, RoleID, GlobalPos, ItemID, Cost});
% 只有主人和伴侣能够执行清除（公共进程执行操作
plantOperate(false, ?HomePlant_Grubbing = OpType, HomeRole, #recHomePlant{id = PlantID, health = Health}, RoleID, GlobalPos, _ItemID, _Cost) when
	HomeRole =:= ?HomeRole_Master; HomeRole =:= ?HomeRole_Partner ->
	%% 1.清除内存数据
	ets:delete(?EtsHomePlant, GlobalPos),
	%% 2.向DB保存作物关键数据
	plantSave(GlobalPos),
	%% 3.向地图上所有角色同步操作成功的数据
	plantSuccess(RoleID, OpType, false, GlobalPos, PlantID, Health);
% 访客没有权限
plantOperate(IsInRole, ?HomePlant_Grubbing = OpType, _HomeRole, Plant, RoleID, GlobalPos, _ItemID, Cost) ->
	plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_Guest, []}, Plant, GlobalPos, Cost});

% ?HomePlant_Harvest 收获
% 对象为空时反馈失败
plantOperate(IsInRole, ?HomePlant_Harvest = OpType, _HomeRole, false = Plant, RoleID, GlobalPos, _ItemID, Cost) ->
	plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_TarNull, []}, Plant, GlobalPos, Cost});
% 对象枯萎时反馈失败
plantOperate(IsInRole, ?HomePlant_Harvest = OpType, _HomeRole, #recHomePlant{health = 0} = Plant, RoleID, GlobalPos, _ItemID, Cost) ->
	plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_TarDie, []}, Plant, GlobalPos, Cost});
% 只有主人和伴侣能够执行收获
plantOperate(IsInRole, ?HomePlant_Harvest = OpType, HomeRole, #recHomePlant{id = PlantID, time = TimePlant, health = Health} = Plant, RoleID, GlobalPos, ItemID, Cost) when
	HomeRole =:= ?HomeRole_Master; HomeRole =:= ?HomeRole_Partner ->
	#home_plantsCfg{growtime = [T1, T2, _T3]} = getCfg:getCfgPStack(cfg_home_plants, PlantID),
	TimeNow = time:getSyncTimeFromDBS(),
	TimeMin = TimePlant + (T1 + T2) * 60,
	case TimeNow < TimeMin of
		true ->
			plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_HarvestNot, []}, Plant, GlobalPos, Cost});	%% 未成熟
		_ ->
			%% 已经验证过是否枯萎，这里不作验证
			case IsInRole of
				true ->
					%% 角色进程向公共进程请求收获
					psMgr:sendMsg2PS(?HomeOtp, plant, {false, OpType, RoleID, GlobalPos, ItemID, Cost});
				_ ->
					%% 公共进程处理收获
					%% 1.清除内存数据
					ets:delete(?EtsHomePlant, GlobalPos),
					%% 2.向DB保存作物关键数据
					plantSave(GlobalPos),
					%% 3.向地图上所有角色同步操作成功的数据
					plantSuccess(RoleID, OpType, false, GlobalPos, PlantID, Health)
			end
	end;
% 访客没有权限
plantOperate(IsInRole, ?HomePlant_Harvest = OpType, _HomeRole, Plant, RoleID, GlobalPos, _ItemID, Cost) ->
	plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_Guest, []}, Plant, GlobalPos, Cost});

% ?HomePlant_Watering 浇水
% 对象为空时反馈失败
plantOperate(IsInRole, ?HomePlant_Watering = OpType, _HomeRole, false = Plant, RoleID, GlobalPos, _ItemID, Cost) ->
	plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_TarNull, []}, Plant, GlobalPos, Cost});
% 对象枯萎时反馈失败
plantOperate(IsInRole, ?HomePlant_Watering = OpType, _HomeRole, #recHomePlant{health = 0} = Plant, RoleID, GlobalPos, _ItemID, Cost) ->
	plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_TarDie, []}, Plant, GlobalPos, Cost});
% 只有主人和伴侣能够执行浇水
plantOperate(IsInRole, ?HomePlant_Watering = OpType, HomeRole, #recHomePlant{id = PlantID, watering = Watering, health = HealthOld} = Plant, RoleID, GlobalPos, ItemID, Cost) when
	HomeRole =:= ?HomeRole_Master; HomeRole =:= ?HomeRole_Partner ->
	{WateringCount, WateringLast} = playerHomePlant:plantTodayAndLast(Watering),
	#globalsetupCfg{setpara = [HealthAdd, CountMax, CDMinute]} = getCfg:getCfgPStack(cfg_globalsetup, plant_watering),
	case WateringCount >= CountMax of
		true ->
			plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_WartringMore, []}, Plant, GlobalPos, Cost});	%% 浇水次数满
		_ ->
			TimeNow = time:getSyncTimeFromDBS(),
			case TimeNow >= WateringLast + CDMinute * 60 of
				true ->
					case IsInRole of
						true ->
							%% 角色进程向公共进程请求浇水
							psMgr:sendMsg2PS(?HomeOtp, plant, {false, OpType, RoleID, GlobalPos, ItemID, Cost});
						_ ->
							%% 公共进程处理浇水
							%% 1.刷新内存数据
							#home_plantsCfg{health = [_Default, HealthMax]} = getCfg:getCfgPStack(cfg_home_plants, PlantID),
							HealthNew = erlang:min(HealthOld + HealthAdd, HealthMax),
							PlantNew = Plant#recHomePlant{health = HealthNew, watering = [TimeNow | Watering]},
							ets:insert(?EtsHomePlant, PlantNew),
							%% 2.向DB保存作物关键数据
							plantSave(PlantNew),
							%% 3.向地图上所有角色同步操作成功的数据
							plantSuccess(RoleID, OpType, PlantNew, GlobalPos, PlantID, PlantNew#recHomePlant.health)
					end;
				_ ->
					plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_WartringCD, []}, Plant, GlobalPos, Cost})	%% 浇水CD中
			end
	end;
% 访客没有权限
plantOperate(IsInRole, ?HomePlant_Watering = OpType, _HomeRole, Plant, RoleID, GlobalPos, _ItemID, Cost) ->
	plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_Guest, []}, Plant, GlobalPos, Cost});

% ?HomePlant_Compost 施肥
% 对象为空时反馈失败
plantOperate(IsInRole, ?HomePlant_Compost = OpType, _HomeRole, false = Plant, RoleID, GlobalPos, _ItemID, Cost) ->
	plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_TarNull, []}, Plant, GlobalPos, Cost});
% 对象枯萎时反馈失败
plantOperate(IsInRole, ?HomePlant_Compost = OpType, _HomeRole, #recHomePlant{health = 0} = Plant, RoleID, GlobalPos, _ItemID, Cost) ->
	plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_TarDie, []}, Plant, GlobalPos, Cost});
% 只有主人和伴侣能够执行施肥
plantOperate(IsInRole, ?HomePlant_Compost = OpType, HomeRole, #recHomePlant{id = PlantID, compost = Compost, health = HealthOld} = Plant, RoleID, GlobalPos, ItemID, Cost) when
	HomeRole =:= ?HomeRole_Master; HomeRole =:= ?HomeRole_Partner ->
	{CompostCount, CompostLast} = playerHomePlant:plantTodayAndLast(Compost),
	#globalsetupCfg{setpara = [CountMax, CDMinute]} = getCfg:getCfgPStack(cfg_globalsetup, plant_composttimes),
	case getCfg:getCfgByKey(cfg_item, ItemID) of
		#itemCfg{itemType = ?ItemTypeCompost, useParam1 = HealthAdd} ->
			case CompostCount >= CountMax of
				true ->
					plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_CompostMore, []}, Plant, GlobalPos, Cost});	%% 浇水次数满
				_ ->
					TimeNow = time:getSyncTimeFromDBS(),
					case TimeNow >= CompostLast + CDMinute * 60 of
						true ->
							case IsInRole of
								true ->
									%% 角色进程扣除资源后向公共进程请求施肥
									case playerBase:costRes(?BackType_Item, ItemID, 1, ?PLogTS_Home, ?ItemDeleteReasonHomePlantOP, ?ItemSourceHomePlantOPBack) of
										{true, CostItem} ->
											psMgr:sendMsg2PS(?HomeOtp, plant, {false, OpType, RoleID, GlobalPos, ItemID, [CostItem]});
										_ ->
											plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_CompostWithoutItem, []}, Plant, GlobalPos, Cost})	%% 肥料不足
									end;
								_ ->
									%% 公共进程处理施肥
									%% 1.刷新内存数据
									#home_plantsCfg{health = [_Default, HealthMax]} = getCfg:getCfgPStack(cfg_home_plants, PlantID),
									HealthNew = erlang:min(HealthOld + HealthAdd, HealthMax),
									PlantNew = Plant#recHomePlant{health = HealthNew, compost = [TimeNow | Compost]},
									ets:insert(?EtsHomePlant, PlantNew),
									%% 2.向DB保存作物关键数据
									plantSave(PlantNew),
									%% 3.向地图上所有角色同步操作成功的数据
									plantSuccess(RoleID, OpType, PlantNew, GlobalPos, PlantID, PlantNew#recHomePlant.health)
							end;
						_ ->
							plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_CompostCD, []}, Plant, GlobalPos, Cost})	%% 施肥CD中
					end
			end;
		_ ->
			skip %% 该错误可能是异常发包导致，忽略
	end;
% 访客没有权限
plantOperate(IsInRole, ?HomePlant_Compost = OpType, _HomeRole, Plant, RoleID, GlobalPos, _ItemID, Cost) ->
	plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_Guest, []}, Plant, GlobalPos, Cost});

% ?HomePlant_ClearPestis 除虫
% 对象为空时反馈失败
plantOperate(IsInRole, ?HomePlant_ClearPestis = OpType, _HomeRole, false = Plant, RoleID, GlobalPos, _ItemID, Cost) ->
	plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_TarNull, []}, Plant, GlobalPos, Cost});
% 对象枯萎时反馈失败
plantOperate(IsInRole, ?HomePlant_ClearPestis = OpType, _HomeRole, #recHomePlant{health = 0} = Plant, RoleID, GlobalPos, _ItemID, Cost) ->
	plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_TarDie, []}, Plant, GlobalPos, Cost});
% 对象没有发生虫害时反馈失败
plantOperate(IsInRole, ?HomePlant_ClearPestis = OpType, _HomeRole, #recHomePlant{pestis = {false, _, _}} = Plant, RoleID, GlobalPos, _ItemID, Cost) ->
	plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_PestisNull, []}, Plant, GlobalPos, Cost});
% 只有主人和伴侣能够执行除虫
plantOperate(IsInRole, ?HomePlant_ClearPestis = OpType, HomeRole,
	#recHomePlant{id = PlantID, time = TimePlant, health = HealthOld, pestis = {_IsPestis, PestisCount, _TimePestis}} = Plant,
	RoleID, GlobalPos, ItemID, Cost) when
	HomeRole =:= ?HomeRole_Master; HomeRole =:= ?HomeRole_Partner ->
	#globalsetupCfg{setpara = [HealthAdd]} = getCfg:getCfgPStack(cfg_globalsetup, plant_clearpestis),
	case IsInRole of
		true ->
			%% 角色进程向公共进程请求除虫
			psMgr:sendMsg2PS(?HomeOtp, plant, {false, OpType, RoleID, GlobalPos, ItemID, Cost});
		_ ->
			%% 公共进程处理除虫
			%% 1.刷新内存数据
			#home_plantsCfg{health = [_Default, HealthMax], growtime = [T1, T2, T3]} = Cfg =
				getCfg:getCfgPStack(cfg_home_plants, PlantID),
			HealthNew = erlang:min(HealthOld + HealthAdd, HealthMax),
			PlantNew = Plant#recHomePlant{health = HealthNew, pestis = {false, PestisCount, 0}},
			TimeNow = time:getSyncTimeFromDBS(),
			TimeEnd = TimePlant + (T1 + T2 + T3) * 60,
			{_, PlantNew2} = plantTryRefresh_pestis(PlantNew, Cfg, {TimeNow, TimeEnd}),
			ets:insert(?EtsHomePlant, PlantNew2),
			%% 2.向DB保存作物关键数据
			plantSave(PlantNew2),
			%% 3.向地图上所有角色同步操作成功的数据
			plantSuccess(RoleID, OpType, PlantNew2, GlobalPos, PlantID, PlantNew2#recHomePlant.health)
	end;
% 访客没有权限
plantOperate(IsInRole, ?HomePlant_ClearPestis = OpType, _HomeRole, Plant, RoleID, GlobalPos, _ItemID, Cost) ->
	plantFailed({IsInRole, RoleID, OpType, {?ErrorCode_HomePlant_Guest, []}, Plant, GlobalPos, Cost});

% 捕获未处理的消息分支
plantOperate(IsInRole, OpType, HomeRole, Plant, RoleID, GlobalPos, ItemID, Cost) ->
	?ERROR_OUT("plantOperate invalid args:~w", [[IsInRole, OpType, HomeRole, Plant, RoleID, GlobalPos, ItemID, Cost]]).
