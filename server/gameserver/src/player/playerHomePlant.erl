%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 玩家家园系统_种植区
%%% @end
%%% Created : 20170825
%%%-------------------------------------------------------------------
-module(playerHomePlant).
-author(meitianyang).

-include("gsInc.hrl").
-include("playerPrivate.hrl").

%% MSG
-export([
	msg/1
]).

%% API
-export([
	sendHomePlantInfo/2,	%% 初始化种植区信息
	plant2NetMsg/1,			%% 种植区：作物内存数据转换为网络消息
	plantTodayAndLast/1,	%% 种植区：计算当日次数与最后时间
	plantSuccess/1			%% 种植区：操作成功反馈
]).

%% gm
-export([
	gmUpdatePlant/1,		%% GM修改指定作物状态
	gmQueryPlant/1			%% GM查询指定作物状态
]).

%%%-------------------------------------------------------------------
% 协议
msg(#pk_U2GS_HomePlantOperate_Request{homeID = HomeID, areaType = AreaType, pos = Pos, operateType = OpType, itemID = ItemID}) ->
	RoleID = playerState:getRoleID(),
	plant(OpType, RoleID, {HomeID, AreaType, Pos}, ItemID),
	ok;
msg(Msg) ->
	?ERROR_OUT("receive error msg:~p,~p", [playerState:getRoleID(), Msg]),
	playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotOpen),
	ok.

%%%-------------------------------------------------------------------
% 种植区操作_角色操作接口
-spec plant(OpType, RoleID, GlobalPos, ItemID) -> no_return() when
	OpType :: ?HomePlant_BEGIN .. ?HomePlant_END,
	RoleID :: uint64(),
	GlobalPos :: {HomeID, AreaType, Pos},
	HomeID :: uint64(),
	AreaType :: ?Home_Plantation_A | ?Home_Plantation_B | ?Home_Plantation_C,
	Pos :: 1 .. ?HomePlantPosMax,
	ItemID :: uint16().
plant(OpType, _RoleID, _GlobalPos, _ItemID) when					%% 错误的操作类型
	OpType < ?HomePlant_BEGIN; OpType > ?HomePlant_END ->
	?DEBUG_OUT("[DebugForHomePlant] plantOperate Invalid OpType:~w", [OpType]),
	skip;
plant(_OpType, _RoleID, {_HomeID, AreaType, _Pos}, _ItemID) when	%% 错误的区域类型
	AreaType =/= ?Home_Plantation_A,
	AreaType =/= ?Home_Plantation_B,
	AreaType =/= ?Home_Plantation_C ->
	?DEBUG_OUT("[DebugForHomePlant] plantOperate Invalid AreaType:~w", [AreaType]),
	skip;
plant(_OpType, _RoleID, {_HomeID, _AreaType, Pos}, _ItemID) when	%% 错误的种植点
	Pos < 1; Pos > ?HomePlantPosMax ->
	?DEBUG_OUT("[DebugForHomePlant] plantOperate Invalid Pos:~w", [Pos]),
	skip;
plant(OpType, RoleID, {HomeID, AreaType, _Pos} = GlobalPos, ItemID) ->
	% 确认目标区域开放
	ListArea = homeInterface:queryHomeArea(HomeID),
	?DEBUG_OUT("[DebugForHomePlant] GlobalPos:~w ListArea:~w", [GlobalPos, ListArea]),
	case lists:keyfind(AreaType, #rec_home_area.areaID, ListArea) of
		false ->
			?ERROR_CODE(?ErrorCode_HomePlant_NotOpen);
		_ ->
			%% 执行操作
			homePlantLogic:plant({true, OpType, RoleID, GlobalPos, ItemID, []})
	end.

%%%-------------------------------------------------------------------
% 初始化种植区信息
-spec sendHomePlantInfo(HomeID::uint64(), Flag::uint()) -> no_return().
sendHomePlantInfo(HomeID, ?Home_Courtyard) ->
	MS = ets:fun2ms(
		fun(#recHomePlant{key = {HomeID_, _AreaID, _Pos}} = Plant) when
			HomeID =:= HomeID_ ->
			Plant
		end
	),
	ListPlantForNetMsg = sendHomePlantInfo_listPlant2NetMsg(ets:select(?EtsHomePlant, MS), []),
	playerMsg:sendNetMsg(#pk_GS2U_HomePlant_Sync{listPlant = ListPlantForNetMsg});
sendHomePlantInfo(_HomeID, _Flag) ->
	skip.
sendHomePlantInfo_listPlant2NetMsg([], Acc) ->
	Acc;
sendHomePlantInfo_listPlant2NetMsg([Plant | T], Acc) ->
	{_, PlantNew} = homePlantLogic:plantTryRefresh(Plant),
	PlantForNetMsg = plant2NetMsg(PlantNew),
	sendHomePlantInfo_listPlant2NetMsg(T, [PlantForNetMsg | Acc]).

%%%-------------------------------------------------------------------
% 作物内存数据转换为网络消息
-spec plant2NetMsg(PlantMemory) -> PlantNetMsg when
	PlantMemory :: #recHomePlant{} | {uint64(), uint8(), uint8()},
	PlantNetMsg::#pk_Plant{}.
plant2NetMsg(#recHomePlant{
	key = {HomeID, AreaID, Pos},
	id = ID,
	time = Time,
	health = Health,
	watering = ListWatering,
	compost = ListCompost,
	pestis = {IsPestis, _PestisCount, _NextPestis}
}) ->
	{CountWatering, LastWatering} = plantTodayAndLast(ListWatering),
	{CountCompost, LastCompost} = plantTodayAndLast(ListCompost),
	#pk_Plant{
		homeID = HomeID,
		areaType = AreaID,
		pos = Pos,
		id = ID,
		time = Time,
		health = Health,
		wateringCount = CountWatering,
		wateringTime = LastWatering,
		compostCount = CountCompost,
		compostTime = LastCompost,
		isPestis = IsPestis
	};
plant2NetMsg({HomeID, AreaID, Pos}) ->	%% 此处表示目标位置没有作物，用作错误反馈
	#pk_Plant{
		homeID = HomeID,
		areaType = AreaID,
		pos = Pos,
		id = 0,
		time = 0,
		health = 0,
		wateringCount = 0,
		wateringTime = 0,
		compostCount = 0,
		compostTime = 0,
		isPestis = false
	}.

%%%-------------------------------------------------------------------
% 计算当日次数与最后时间
-spec plantTodayAndLast(ListTime::[uint32(), ...]) -> {CountToday::uint8(), TimeLast::uint32()}.
plantTodayAndLast(ListTime) ->
	plantTodayAndLast(ListTime, {0, 0}).
-spec plantTodayAndLast(ListTime::[uint32(), ...], Acc::{uint8(), uint32()}) -> {CountToday::uint8(), TimeLast::uint32()}.
plantTodayAndLast([], Acc) ->
	Acc;
plantTodayAndLast([H | T], {CountToday, TimeLast}) ->
	case core:timeIsOnDay(H + ?SECS_FROM_0_TO_1970) of
		true ->
			TimeLastNew = erlang:max(H, TimeLast),
			plantTodayAndLast(T, {CountToday + 1, TimeLastNew});
		_ ->
			plantTodayAndLast(T, {CountToday, TimeLast})
	end.

%%%-------------------------------------------------------------------
% 操作成功反馈，目前只有收获
-spec plantSuccess({RoleID, OpType, Plant, GlobalPos, PlantID, Health}) -> no_return() when
	RoleID :: uint64(),
	OpType :: ?HomePlant_BEGIN .. ?HomePlant_END,
	Plant :: #recHomePlant{} | false,
	GlobalPos :: {HomeID, AreaType, Pos},
	HomeID :: uint64(),
	AreaType :: ?Home_Plantation_A | ?Home_Plantation_B | ?Home_Plantation_C,
	Pos :: 1 .. ?HomePlantPosMax,
	PlantID :: uint16(),	%% PlantID和Plant无关，收获时Plant必然为false，此处给出PlantID便于收获资源
	Health :: uint8().		%% Health和Plant无关，收获时Plant必然为false，此处给出Health便于收获资源
plantSuccess({RoleID, ?HomePlant_Harvest, _Plant, GlobalPos, PlantID, Health}) ->
	case getCfg:getCfgPStack(cfg_home_plants, PlantID) of
		#home_plantsCfg{result = RewardNormal, bonus = RewardLuck} ->
			ListReward = plantSuccess_parseReward(RewardNormal ++ RewardLuck, RoleID, PlantID, misc:rand(1, 100), []),
			plantSuccess_reward(ListReward, PlantID, ?PLogTS_Home, ?ItemSourceHomePlantHarvest, Health, RoleID, GlobalPos),
			ok;
		_ ->
			skip
	end.

%% 解析奖励
-spec plantSuccess_parseReward(ListReward, RoleID, PlantID, Rand, Acc) -> Result when
	ListReward :: [Reward, ...],									%% 奖励配置格式
	Reward :: {ItemID, ItemCount} | {ItemID, ItemCount, Rate100},	%% 奖励配置格式
	ItemID :: uint16(),												%% 道具ID
	ItemCount :: uint(),											%% 道具数量
	Rate100 :: 0 .. 100,											%% 中奖几率
	RoleID :: uint64(),												%% 角色ID，用于异常日志记录
	PlantID :: uint16(),											%% 作物ID，用于异常日志记录
	Rand :: 1 .. 100,												%% 外部传入随机数
	Acc :: [{RewardItemID, RewardItemCount}, ...],					%% 累计奖励
	RewardItemID :: uint16(),										%% 累计奖励道具ID
	RewardItemCount :: uint(),										%% 累计奖励道具数量
	Result :: Acc.													%% 最终累计奖励作为结果
plantSuccess_parseReward([], _RoleID, _PlantID, _Rand, Acc) ->
	Acc;
plantSuccess_parseReward([{ItemID, ItemCount} = H | T], RoleID, PlantID, Rand, Acc) when
	erlang:is_integer(ItemCount), ItemCount > 0 ->
	case getCfg:getCfgByKey(cfg_item, ItemID) of
		#itemCfg{} ->
			% 普通奖励直接命中
			plantSuccess_parseReward(T, RoleID, PlantID, Rand, [H | Acc]);
		_ ->
			% 道具异常，记录关联配置
			?ERROR_OUT(
				"plantSuccess_parseReward can not find ItemID:~w from cfg_item, RoleID:~w, PlantID:~w",
				[ItemID, RoleID, PlantID]
			),
			plantSuccess_parseReward(T, RoleID, PlantID, Rand, Acc)
	end;
plantSuccess_parseReward([{ItemID, ItemCount, Rate100} | T], RoleID, PlantID, Rand, Acc) when
	erlang:is_integer(ItemCount), ItemCount > 0 ->
	case getCfg:getCfgByKey(cfg_item, ItemID) of
		#itemCfg{} ->
			% 幸运奖励概率命中
			case Rand =< Rate100 of
				true ->
					plantSuccess_parseReward(T, RoleID, PlantID, Rand, [{ItemID, ItemCount} | Acc]);
				_ ->
					plantSuccess_parseReward(T, RoleID, PlantID, Rand, Acc)
			end;
		_ ->
			% 道具异常，记录关联配置
			?ERROR_OUT(
				"plantSuccess_parseReward can not find ItemID:~w from cfg_item, RoleID:~w, PlantID:~w",
				[ItemID, RoleID, PlantID]
			),
			plantSuccess_parseReward(T, RoleID, PlantID, Rand, Acc)
	end;
plantSuccess_parseReward([H | T], RoleID, PlantID, Rand, Acc) ->
	% 记录错误的配置结构
	?ERROR_OUT(
		"plantSuccess_parseReward unknown reward:~w, RoleID:~w, PlantID:~w",
		[H, RoleID, PlantID]
	),
	plantSuccess_parseReward(T, RoleID, PlantID, Rand, Acc).

%% 发奖
-spec plantSuccess_reward(ListReward, PlantID, PLogTS, Reason, Health, RoleID, GlobalPos) -> no_return() when
	ListReward :: [{ItemID, ItemCount}, ...],
	ItemID :: uint16(),
	ItemCount :: uint(),
	PlantID :: uint16(),
	PLogTS :: uint(),
	Reason :: uint(),
	Health :: uint8(),
	RoleID ::uint64(),
	GlobalPos :: {HomeID, AreaType, Pos},
	HomeID :: uint64(),
	AreaType :: ?Home_Plantation_A | ?Home_Plantation_B | ?Home_Plantation_C,
	Pos :: 1 .. ?HomePlantPosMax.
plantSuccess_reward([], _PlantID, _PLogTS, _Reason, _Health, _RoleID, _GlobalPos) ->
	ok;
plantSuccess_reward([{ItemID, ItemCount} | T], PlantID, PLogTS, Reason, Health, RoleID, {HomeID, AreaType, _Pos} = GlobalPos) ->
	case misc:ceil(erlang:float(Health) / 100.0 * ItemCount) of
		ItemCountReal when ItemCountReal > 0 ->
			PLog = #recPLogTSItem{
				new = ItemCountReal,
				change = ItemCountReal,
				target = ?PLogTS_PlayerSelf,
				source = PLogTS,
				changReason = Reason,
				reasonParam = PlantID
			},
			playerPackage:addGoodsAndMail(ItemID, ItemCountReal, false, 0, PLog),

			%% 收获记录
			Visit = #rec_home_visit{
				homeID = HomeID,
				opType = ?HomeOpType_Harvest,
				opParam1 = ItemID,
				opParam2 = ItemCountReal,
				opParam3 = PlantID,
				visitID = RoleID,	%% 访客ID
				areaID = AreaType,		%% 区域ID
				timestamp = time2:getLocalDateTimeSec()	%% 时间戳
			},
			ets:insert(?HomeVisitEts, Visit),
			ok;
		_ ->
			skip
	end,
	plantSuccess_reward(T, PlantID, PLogTS, Reason, Health, RoleID, GlobalPos).

%%%-------------------------------------------------------------------
% GM修改指定作物状态
-spec gmUpdatePlant({GlobalPos, State, IsPestis, Health}) -> ok | none when
	GlobalPos :: {HomeID, AreaID, Pos},
	HomeID :: uint64(),
	AreaID :: ?Home_Plantation_A | ?Home_Plantation_B | ?Home_Plantation_C,
	Pos :: 1 .. ?HomePlantPosMax,
	State :: 1 .. 4,	%% 幼苗 发育 成熟 枯萎
	IsPestis :: bool01(),
	Health :: 0 .. 100.
gmUpdatePlant({GlobalPos, State, IsPestis, Health}) ->
	case ets:lookup(?EtsHomePlant, GlobalPos) of
		[#recHomePlant{id = PlantID, pestis = Pestis} = Plant0] ->
			Cfg = getCfg:getCfgPStack(cfg_home_plants, PlantID),
			TimePlant = gmUpdatePlant_State(State, Cfg),
			PestisNew = gmUpdatePlant_IsPestis(IsPestis, Pestis),
			Plant1 = Plant0#recHomePlant{
				health = Health,
				time = TimePlant,
				pestis = PestisNew
			},
			{_, Plant2} = homePlantLogic:plantTryRefresh(Plant1),
			ets:insert(?EtsHomePlant, Plant2),	%% 仅作调试用GM指令，不然不准在角色进程写数据
			%% 通知地图上所有人
			Msg =
				#pk_GS2U_HomePlantOperate_Ack{
					roleID = playerState:getRoleID(),
					operateType = ?HomePlant_Plant,		%% 假装是在种植
					reason = 0,
					plant = plant2NetMsg(Plant2)
				},
			EtsPlayer = playerState:getMapPlayerEts(),
			ets:foldl(fun(#recMapObject{netPid = NetPid}, _) -> playerMsg:sendNetMsg(NetPid, Msg) end, 0, EtsPlayer),
			ok;
		_ ->
			none
	end.

gmUpdatePlant_State(1, _Cfg) ->
	time:getSyncTimeFromDBS();
gmUpdatePlant_State(2, #home_plantsCfg{growtime = [T1, _T2, _T3]}) ->
	time:getSyncTimeFromDBS() - T1 * 60;
gmUpdatePlant_State(3, #home_plantsCfg{growtime = [T1, T2, _T3]}) ->
	time:getSyncTimeFromDBS() - (T1 + T2) * 60;
gmUpdatePlant_State(4, #home_plantsCfg{growtime = [T1, T2, T3]}) ->
	time:getSyncTimeFromDBS() - (T1 + T2 + T3) * 60.

gmUpdatePlant_IsPestis(1, {false, Count, _}) ->
	{true, Count + 1, time:getSyncTimeFromDBS()};
gmUpdatePlant_IsPestis(1, {true, _, _} = Pestis) ->
	Pestis;
gmUpdatePlant_IsPestis(0, {false, _, _} = Pestis) ->
	Pestis;
gmUpdatePlant_IsPestis(0, {true, Count, _}) ->
	{false, Count, 0}.

%%%-------------------------------------------------------------------
% GM修改指定作物状态
-spec gmQueryPlant(GlobalPos) -> none | #recHomePlant{} when
	GlobalPos :: {HomeID, AreaID, Pos},
	HomeID :: uint64(),
	AreaID :: ?Home_Plantation_A | ?Home_Plantation_B | ?Home_Plantation_C,
	Pos :: 1 .. ?HomePlantPosMax.
gmQueryPlant(GlobalPos) ->
	case ets:lookup(?EtsHomePlant, GlobalPos) of
		[#recHomePlant{} = Plant] ->
			{_, PlantNew} = homePlantLogic:plantTryRefresh(Plant),
			PlantNew;
		_ ->
			none
	end.
