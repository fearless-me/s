%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 属性同步模块
%%% @end
%%% Created : 20. 十一月 2014 14:32
%%%-------------------------------------------------------------------
-module(playerPropSync).
-author("tiancheng").

-include("playerPrivate.hrl").

%% 玩家上线后，等待多久第一次自动保存玩家的公共属性
-define(TickSavePlayerProp, 3000).

%% API
-export([
	init/0,
	tickPlayer/0,

	%% 设置模糊属性
	setProp/2,

	%% 设置类型属性(可同步接口)
	setInt/2,
	setInt64/2,
	setInt64/3, % 第三个参数，是自己控制是否同步true要同步，false不同步
	setFloat/2,
	setString/2,
	setAny/2,   % 设置任意类型

	setPropValue/4,

	%% 获取属性
	getProp/1,
	getPropType/1
]).

%% 所需同步的属性统一处理相关接口
-export([
	syncPropToClient/1,
	syncAllPropToClient/0,

	getPubPropValueList/0,
	getPriPropValueList/0,

	sendPubPropMsgToClientByPropValueList/3
]).

%% 数据库操作
-export([
	loadPlayerPropList/1,
	tickSavePlayerSyncProp/0
]).

%% ====================================================================
%% API functions
%% ====================================================================
%% 属性初始化
-spec init() -> ok.
init() ->
	setInitStates(true),
	init2(),
	setInitStates(false),
	ok.

init2() ->
	NowTime = time:getSyncTime1970FromDBS(),

	setFloat(?SerProp_RepMountSpeed, 0.0),

	setInt(?PubProp_GuildLevel, 0),
	setInt(?PubProp_DarknessCamp, 0),
	setInt(?PriProp_Reputation, 0),
	setInt(?PriProp_Achieve, 0),
	setInt(?PriProp_LoopTaskProcess, 0),
	setInt(?SerProp_RobRoleSkillSN, 1),
	%%时装属性初始化为0
	setInt(?PubProp_FashionMajorHand, 0),
	setInt(?PubProp_FashionHead, 0),
	setInt(?PubProp_FashionClothes, 0),
	setInt(?PubProp_FashionVisibleFlag, 0),
	setInt(?PubProp_PetTurnRaw, 0),
	setInt(?PubProp_TitleSlot1, 0),
	setInt(?PubProp_TitleSlot2, 0),
	setInt(?PubProp_TitleSlot3, 0),
	setInt(?PriProp_PlayerGmSwitch, 0),
	setInt(?PubProp_TitleColorSlot, 0),
	setInt(?PubProp_TitleFloorSlot, 0),
	setInt(?PubProp_GemSpriteLevel,1),
	setInt(?PriProp_RoleCreateTime, 0),
	setInt(?PriProp_PreRecharge, 0),
	setInt(?PubProp_PlayerKillValue, 0),
	setInt(?PriProp_PlayerKpNum, 0),
	setInt(?PriProp_MeditationExp, 0),
	setInt(?SerProp_LoadGiveEndIndex,0),
	setInt(?SerProp_LoadRefineFlag,0),
	setInt(?SerProp_PlayerRevivePhase,0),
	setInt(?SerProp_PlayerRTime,0),
	setInt(?SerProp_BattleLearnHP,0),
	setInt(?PubProp_TitleOutDate,0),
	setInt(?PriProp_PlayerOnlineTime, 0),
	setInt(?PriProp_PlayerDailySignIn, 0),
	setInt(?PriProp_PlayerSignReward, 0),
	setInt(?PriProp_GuildApplyNumber, 0),

	playerWing:setWingLevel(0, 0 ),
	setInt(?PriProp_WingExp, 0),
	setInt(?PriProp_WingMaxLevel, 0),
	setInt(?PriProp_CrosArenaInte, 0),

	setInt64(?SerProp_PlayerDTime,NowTime),
	setInt64(?PriProp_PlayerForce, 0),
	setInt64(?PriProp_PlayerAllPetForce, 0),
	setInt64(?PubProp_TeamID, 0),
	setInt64(?PriProp_PetForce, 0),
	setInt64(?PubProp_GuildID, 0),
	setInt64(?PubProp_GroupID, 0),
	setInt64(?PriProp_PlayerOnlineReward, 0),
	setInt64(?SerProp_HDBattleGetRYTime, 0),
	setInt64(?SerProp_CrosArenaSyncHurt, 0),
	setInt64(?SerProp_GetRankRewardCDTime, 0),
	setInt(?SerProp_MeditationState, 0),
	setInt64(?SerProp_MSShopNextFreshTime, 0),
	setInt64(?SerProp_PlayerHistoryForce, 0),
	setInt64(?SerProp_PRequestDarkness, 0),
	setInt64(?SerProp_CrosArenaTickTime, 0),

	setString(?PubProp_GuildName, ""),
	setString(?SerProp_PlayerClockCache, []),
	setString(?SerProp_VipPowerList, []),
	setString(?SerProp_LoadPropList, []),
	setString(?SerProp_PlayerLadder1v1Prop, []),

	setAny(?SerProp_PlayerLottery,{0,0,0}),
	setAny(?SerProp_PlayerInvestment, []),
	setAny(?SerProp_PlayerSevenMission, []),
	setAny(?SerProp_PlayerPetFairy, {}),
	setAny(?SerProp_GuildExpeditinScore, {0,0}),
	setAny(?SerProp_GuildSkillDec, []),
	setAny(?SerProp_GuildSkillDiv, []),
	setAny(?SerProp_PetAssistBattleInfo, []),
	setAny(?SerProp_playerLevelReward, []),
	setAny(?SerProp_playerFindRes, []),
	setAny(?SerProp_PlayerRune, []),
	setAny(?SerProp_PlayerPetRune, []),
	setAny(?SerProp_PlayerBQs, []),
	setAny(?SerProp_PlayerDZs, []),
	setAny(?SerProp_ActiveFashionSuitList, []),
	setInt64(?SerProp_Ladder1v1BestScort, 0),
	setInt(?SerProp_LotterySys, 0),
	setInt(?SerProp_DanceState, 0),

	setInt(?SerProp_GoblinPayMoneyOnce, 0),
	setInt(?SerProp_GoblinPayMoneyTenTimes, 0),
	setInt(?SerProp_TreasurePayMoneyOnce, 0),
	setInt(?SerProp_TreasurePayMoneyTenTimes, 0),
	?DEBUG_OUT("=================~p~n",[getProp(?SerProp_TreasurePayMoneyTenTimes)]),

	setAny(?SerProp_RedEnvelopeHistory, []),
	setInt(?PriProp_WorldRedEnvelope, 0),
	setInt64(?PriProp_RedEnvelopeSendNum, 0),
	setInt64(?PriProp_RedEnvelopeSendMoney, 0),
	setInt64(?PriProp_RedEnvelopeRecvNum, 0),
	setInt64(?PriProp_RedEnvelopeRecvMoney, 0),
	setInt64(?PriProp_Liveness, 0),
	setInt64(?PriProp_MaterialValue, 0),
	setInt64(?PriProp_SkillPoint, 0),

	setInt(?PriProp_WakeUpExp, 0),
	setAny(?SerProp_ActionPoint, [0, 0]),
	setInt(?PubProp_WakeSkillLv, 0),
	setInt(?PubProp_HeadEmoticonIcon, 0),
    setInt(?SerProp_HeadEmoticonIconTime, 0),
	setInt64(?SerProp_RobRoleTargetCode, 0),
    setAny(?SerProp_RobSkillCD, {0, 0}),
	setFloat(?PubProp_MoveSpeed, 0.0),

	setAny(?SerProp_RobPetSkillListAndMinAttackLen, {[], 0}),
	setAny(?SerProp_RobSkillListAndMinAttackLen, {[], 0}),
	setAny(?SerProp_MarriageWantBuildTime, []),
	setAny(?SerProp_MarriageSkillListCache, []),
	setAny(?SerProp_MarriageTaskInfo, {0, 0}),
	setAny(?SerProp_MarriageRingAdd, {[], []}),

	setAny(?SerProp_BagFullTipsLastTime, []),
	setAny(?SerProp_EquipRecastList, []),
	setInt64(?SerProp_PlayerFlag, 0),
	setInt64(?PubProp_ActiveGoddessID, 0),

	setInt(?PriProp_Guild_GodBless_LastTime, 0),
	setAny(?SerProp_Guild_GodBless_Schedule, {0, []}),
	setAny(?SerProp_PlayerConvoyTarget, {0,0,undefined}),
	setAny(?SerProp_Guild_ExchangeMax, []),
	setAny(?SerProp_Guild_ExchangeCur, []),
	setAny(?SerProp_CopyMapSpecEventTemp, []),

	setAny(?SerProp_PetTerritoryVigor, [0, 0]),
	setAny(?SerProp_PetTerritorySearch, []),

	setAny(?SerProp_SevenDayAim_CopyMap, []),
	setInt(?SerProp_SevenDayAim_WarriorTrial, 0),
	setAny(?SerProp_SevenDayAim_FashionCount, []),
	setInt64(?SerProp_SevenDayAim_Force, 0),
	setAny(?SerProp_SevenDayAim_EquipQuality, [0, 0, 0, 0, 0, 0]),
	setAny(?SerProp_SevenDayAim_PetAdd, []),
	setInt(?SerProp_SevenDayAimTimeBegin, 0),
	setAny(?SerProp_SevenDayAimAlreadyReward, []),
	setAny(?SerProp_SevenDayAim_ProtectGod, 0),

	setAny(?SerProp_SideTaskCompleteList, []),

	setInt(?SerProp_ThirtyDayTimeAlreadyReward, 0),

	ok.

%% 同步属性心跳
-spec tickPlayer() -> ok.
tickPlayer() ->
	syncPropToClient(false),
	ok.

%% 通用设置属性，类型用Value来判断
-spec setProp(PropIndex::pubProp() | priProp() | serProp(), Value::term()) -> boolean().
setProp(PropIndex, Value) when erlang:is_float(Value) ->
	setFloat(PropIndex, Value);
setProp(PropIndex, Value) when erlang:is_integer(Value) andalso Value >= 4294967296 ->
	setInt64(PropIndex, Value);
setProp(PropIndex, Value) when erlang:is_integer(Value) ->
	setInt(PropIndex, Value);
setProp(PropIndex, Value) when erlang:is_list(Value) ->
	setString(PropIndex, Value);
setProp(PropIndex, Value) ->
	setAny(PropIndex, Value).

%% 设置整形属性
-spec setInt(PropIndex::pubProp() | priProp() | serProp(), Value::integer()) -> boolean().
setInt(PropIndex, Value) when erlang:is_integer(Value) ->
	setPropValue(PropIndex, ?PropType_INT, Value);
setInt(PropIndex, Value) ->
	?ERROR_OUT("setInt:~ts,~p,~p,~p", [playerState:getName(),playerState:getRoleID(),PropIndex,Value]),
	false.

%% 设置64位整形属性
-spec setInt64(PropIndex::pubProp() | priProp() | serProp(), Value::integer()) -> boolean().
setInt64(PropIndex, Value) when erlang:is_integer(Value) ->
	setPropValue(PropIndex, ?PropType_INT64, Value);
setInt64(PropIndex, Value) ->
	?ERROR_OUT("setInt64:~ts,~p,~p,~p", [playerState:getName(),playerState:getRoleID(),PropIndex,Value]),
	false.

%% 设置64位整形属性
-spec setInt64(PropIndex::pubProp() | priProp() | serProp(), Value::integer(), IsSync::boolean()) -> boolean().
setInt64(PropIndex, Value, IsSync) when erlang:is_integer(Value) ->
	setPropValue(PropIndex, ?PropType_INT64, Value, IsSync);
setInt64(PropIndex, Value, IsSync) ->
	?ERROR_OUT("setInt64:~ts,~p,~p,~p,~p", [playerState:getName(),playerState:getRoleID(),PropIndex,Value,IsSync]),
	false.

%% 设置浮点型属性
-spec setFloat(PropIndex::pubProp() | priProp() | serProp(), Value::float()) -> boolean().
setFloat(PropIndex, Value) when erlang:is_float(Value) ->
	setPropValue(PropIndex, ?PropType_FLOAT, Value);
setFloat(PropIndex, Value) ->
	?ERROR_OUT("setFloat:~ts,~p,~p,~p", [playerState:getName(),playerState:getRoleID(),PropIndex,Value]),
	false.

%% 设置字符串属性
-spec setString(PropIndex::pubProp() | priProp() | serProp(), Value::list()) -> boolean().
setString(PropIndex, Value) when erlang:is_list(Value) ->
	setPropValue(PropIndex, ?PropType_STRING, Value);
setString(PropIndex, Value) ->
	?ERROR_OUT("setString:~ts,~p,~p,~p", [playerState:getName(),playerState:getRoleID(),PropIndex,Value]),
	false.

%% 设置可变结构（注意，可变结构只能是服务器内部属性）
-spec setAny(PropIndex::serProp(), Value::term()) -> boolean().
setAny(PropIndex, Value) when PropIndex > ?SerProp_Start andalso PropIndex < ?SerProp_End ->
	%% 自由属性只能是服务器内部用的，不能用于任何形式同步给客户端
	setPropValue(PropIndex, ?PropType_Any, Value);
setAny(PropIndex, Value) ->
	?ERROR_OUT("setAny:~ts,~p,~p,~p", [playerState:getName(),playerState:getRoleID(),PropIndex,Value]),
	false.

%% 获取属性，有值返回Value，否则返回error
-spec getProp(PropIndex::pubProp() | priProp() | serProp()) -> term() | undefined.
getProp(PropIndex) ->
	case getPropBufValue(PropIndex) of
		#recProp{propValue = PV} ->
			PV;
		_ ->
			undefined
	end.

%% 获取属性的类型
-spec getPropType(PropIndex::pubProp() | priProp() | serProp()) -> propType() | undefined.
getPropType(PropIndex) ->
	case getPropBufValue(PropIndex) of
		#recProp{propType = Type} ->
			Type;
		_ ->
			undefined
	end.

%% 获取公共可视属性值列表
-spec getPubPropValueList() -> list().
getPubPropValueList() ->
	PublicPropIndexList = lists:seq(?PubProp_Start + 1, ?PubProp_End - 1),
	[getProp(Index) || Index <- PublicPropIndexList].

%% 把公共可视属性值变为与客户端通信的消息
-spec sendPubPropMsgToClientByPropValueList(TargetNetPid::pid(), OwnerCode::uint(), PubPropList::list()) -> ok.
sendPubPropMsgToClientByPropValueList(TargetNetPid, OwnerCode, PubPropList) ->
	case length(PubPropList) =:= ?PubProp_End - 1 of
		true ->
			PublicPropIndexList = lists:seq(?PubProp_Start + 1, ?PubProp_End - 1),
			Fun = fun(Index, {IntL, Int64L, FloatL, StrL}) ->
				Type = getPropType(Index),
				Value = lists:nth(Index, PubPropList),
				getNewValueMsg(Index, Type, Value, {IntL, Int64L, FloatL, StrL})
			end,
			Result = lists:foldl(Fun, {[], [], [], []}, PublicPropIndexList),
			sendPropMsgToClient(TargetNetPid, OwnerCode, Result);
		_ ->
			?ERROR_OUT("getPubPropMsgByList error:~ts,~p,~p,~p",
				[playerState:getName(), playerState:getRoleID(), PubPropList, ?PubProp_End])
	end.

%% 获取私有可视属性值列表
-spec getPriPropValueList() -> list().
getPriPropValueList() ->
	PrivatePropIndexList = lists:seq(?PriProp_Start + 1, ?PriProp_End - 1),
	[getProp(Index) || Index <- PrivatePropIndexList].

%% ====================================================================
%% Internal functions
%% ====================================================================

%%无条件同步一次给client
-spec syncAllPropToClient() ->ok.
syncAllPropToClient() ->
	Fun = fun(Index, {IntL, Int64L, FloatL, StrL}) ->
				  case getPropBufValue(Index) of
					  #recProp{propType = PropType, propValue = PropValue} = Prop when PropValue =/= undefined ->
						  %% 先设置已经同步
						  setPropBufValue(Index, Prop#recProp{isChange = false}),
						  
						  getNewValueMsg(Index, PropType, PropValue, {IntL, Int64L, FloatL, StrL});
					  _ ->
						  {IntL, Int64L, FloatL, StrL}
				  end
		  end,
	syncPropToClient(true,Fun),
	ok.

%% 同步属性变化给客户端
-spec syncPropToClient(IsOnlySelfClient::boolean()) -> ok.
syncPropToClient(IsOnlySelfClient) ->
	Fun = fun(Index, {IntL, Int64L, FloatL, StrL}) ->
				  case getPropBufValue(Index) of
					  #recProp{isChange = true, propType = PropType, propValue = PropValue} = Prop ->
						  %% 先设置已经同步
						  setPropBufValue(Index, Prop#recProp{isChange = false}),
						  
						  getNewValueMsg(Index, PropType, PropValue, {IntL, Int64L, FloatL, StrL});
					  _ ->
						  {IntL, Int64L, FloatL, StrL}
				  end
		  end,
	syncPropToClient(IsOnlySelfClient,Fun),
	ok.

-spec syncPropToClient(IsOnlySelfClient::boolean(),Fun::fun()) -> ok.
syncPropToClient(IsOnlySelfClient,Fun) ->

	SelfNetPid = playerState:getNetPid(),

	%% 同步公共可视属性
	PublicPropIndexList = lists:seq(?PubProp_Start, ?PubProp_End),
	Result1 = lists:foldl(Fun, {[], [], [], []}, PublicPropIndexList),
	case IsOnlySelfClient of
		true ->
			%% 只把公共可视属性发给自己
			sendPropMsgToClient(SelfNetPid, playerState:getPlayerCode(), Result1);
		_ ->
			%% 需要把公共可视同步给周围玩家
			broadcastPropMsgToCilent(Result1)
	end,

	%% 同步私有可视属性
	PrivatePropIndexList = lists:seq(?PriProp_Start, ?PriProp_End),
	Result2 = lists:foldl(Fun, {[], [], [], []}, PrivatePropIndexList),
	sendPropMsgToClient(SelfNetPid, playerState:getPlayerCode(), Result2),
	ok.

sendPropMsgToClient(TargetNetPid, OwnerCode, {IntL, Int64L, FloatL, StrL}) ->
%% 	PlayerCode = playerState:getPlayerCode(),
	None = #pk_GS2U_PropSync{code = OwnerCode, ints = [], int64s = [], floats = [], strs = []},
	Msg = None#pk_GS2U_PropSync{ints = IntL, int64s = Int64L, floats = FloatL, strs = StrL},
	case None =:= Msg of
		true ->
			skip;
		_ ->
%% 			?DEBUG_OUT("broadcastPropMsgToCilent.sendPropMsgToClient:[~p,~p] ~p Msg = ~p",
%% 					   [playerState:getRoleID(), playerState:getPlayerCode(), OwnerCode,Msg]),
			gsSendMsg:sendNetMsg(TargetNetPid, Msg)
	end,
	ok.

broadcastPropMsgToCilent({IntL, Int64L, FloatL, StrL}) ->
	PlayerCode = playerState:getPlayerCode(),
	None = #pk_GS2U_PropSync{code = PlayerCode, ints = [], int64s = [], floats = [], strs = []},
	Msg = None#pk_GS2U_PropSync{ints = IntL, int64s = Int64L, floats = FloatL, strs = StrL},
	case None =:= Msg of
		true ->
			skip;
		_ ->
			MapPid = playerState:getMapPid(),
			PlayerEts = playerState:getMapPlayerEts(),
			SelfNetPid = playerState:getNetPid(),

			%% 先判断是否需要向自己同步
			case playerState:isFirstEnterMap() of
				false ->
%% 					?DEBUG_OUT("broadcastPropMsgToCilent:~p,~p,~p", [playerState:getRoleID(),PlayerCode,Msg]),
					playerMsg:sendNetMsg(Msg);
				_ ->
					skip
			end,

			%% 再给RP玩家同步
			case ets:lookup(PlayerEts, PlayerCode) of
				[#recMapObject{x = X,y = Y, groupID = GroupID}] ->
					%% 获取能看见我和我能看见的所有玩家
					NearPlayerList = mapView:getMutualObject(MapPid, PlayerEts, ?ObjTypePlayer, {X, Y}, GroupID),
					Fun = fun(#recMapObject{netPid = NearPid}) ->
						case SelfNetPid =/= NearPid of
							true ->
								%% 直接向远程玩家的网络进程发送消息，不再通过远程玩家进程转发
								mapView:sendNetMsgToNetPid(NearPid, Msg);
							_ ->
								skip
						end
					end,
					lists:foreach(Fun, NearPlayerList);
				_ ->
					skip
			end
	end,
	ok.

%% 设置属性并立即同步
-spec setPropValue(PropIndex::pubProp() | priProp() | serProp(), PropType::propType(), PropValue::term()) -> boolean().
setPropValue(PropIndex, PropType, PropValue) ->
	setPropValue(PropIndex, PropType, PropValue, true).

%%% 设置属性且不同步到客户端
%-spec setPropValueOnly(PropIndex::pubProp() | priProp() | serProp(), PropType::propType(), PropValue::term()) -> boolean().
%setPropValueOnly(PropIndex, PropType, PropValue) ->
%	setPropValue(PropIndex, PropType, PropValue, false).

%% 设置属性(IsImmedSync->true立即同步，false->不立即同步)
-spec setPropValue(PropIndex::pubProp() | priProp() | serProp(), PropType::propType(), PropValue::term(), IsImmedSync::boolean()) -> boolean().
setPropValue(PropIndex, PropType, PropValue, IsImmedSync) ->
	case getCanSetProp(PropIndex) of
		true ->
			{IsChange, OldValue} =
				case getPropBufValue(PropIndex) of
					#recProp{propType = PT, propValue = PV} = Prop ->
						case PT /= PropType of
							true ->
								?ERROR_OUT("setPropValue.type change:~ts,~p,[~p,~p,~p],~p",
									[playerState:getName(),playerState:getRoleID(),PropIndex,PropType,PropValue,Prop]);
							_ ->
								skip
						end,

						%% 属性值是否改变
						{PropValue =/= PV, PV};
					_ ->
						{true, undefined}
				end,

			case IsChange of
				true ->
					%% 注意，一定要先设置新的值
					NewProp = #recProp{propIndex = PropIndex, propType = PropType, propValue = PropValue, isChange = IsImmedSync},
					setPropBufValue(PropIndex, NewProp),

					case getInitStates() of
						true ->
							%% 是初始化属性，不需要保存
							skip;
						_ ->
							savePlayerProp(NewProp)
					end,

 					%% 实时同步属性变化到客户端
					case IsImmedSync andalso (not playerState:isFirstEnterMap()) of
						true ->
							syncPropToClient(false);
						_ ->
							skip
					end,

					%% 属性改变回调
					case getInitStates() of
						true ->
							%% 是初始化属性，不需要保存
							skip;
						_ ->
							try
								%% 属性改变回调
								propChangeCallBack(PropIndex, PropType, OldValue, PropValue)
							catch
								_:Why->
									?LOG_OUT("ExceptionFunc_Module:[~p] ExceptionFunc[recover] Why[~p] stack[~p]",
											 [?MODULE, Why, erlang:get_stacktrace()])
							end
					end,
					true;
				_ ->
					false
			end;
		_ ->
			?ERROR_OUT("setPropValue.unknow type:~ts,~p,[~p,~p,~p]",
				[playerState:getName(),playerState:getRoleID(),PropIndex,PropType,PropValue]),
			false
	end.

getCanSetProp(PropIndex) ->
	if
		PropIndex > ?PubProp_Start andalso PropIndex < ?PubProp_End ->
			%% 设置公共可视属性
			true;
		PropIndex > ?PriProp_Start andalso PropIndex < ?PriProp_End ->
			%% 设置私有属性
			true;
		PropIndex > ?SerProp_Start andalso PropIndex < ?SerProp_End ->
			%% 设置服务器内部属性
			true;
		true ->
			false
	end.

%% 获取属性缓存
-spec getPropBufValue(Index::pubProp() | priProp() | serProp()) -> #recProp{} | undefined.
getPropBufValue(Index) ->
	get({'MM_PlayerPropSync_Special_Fields', Index}).

-spec setPropBufValue(Index::pubProp() | priProp() | serProp(), Value::#recProp{}) -> #recProp{} | undefined.
setPropBufValue(Index, Value) ->
	put({'MM_PlayerPropSync_Special_Fields', Index}, Value).

%% 设置是否是属性初始化状态
getInitStates() ->
	case get(propInitStates) of
		undefined ->
			true;
		V ->
			V
	end.

setInitStates(V) ->
	put(propInitStates, V).

%% 根据新属性获取封装的消息包元组列表
getNewValueMsg(Index, Type, Value, {IntL, Int64L, FloatL, StrL}) ->
	case Value of
		undefined ->
			%% 这个不需要同步
			{IntL, Int64L, FloatL, StrL};
		_ ->
			case Type of
				?PropType_INT ->
					case erlang:is_integer(Value) of
						true ->
							NInt = #pk_PropInt{index = Index, value = Value},
							{[NInt | IntL], Int64L, FloatL, StrL};
						_ ->
							?ERROR_OUT("~p:getNewValueMsg int failed:~p,~p,~p", [?MODULE, Index, Type, Value]),
							{IntL, Int64L, FloatL, StrL}
					end;
				?PropType_INT64 ->
					case erlang:is_integer(Value) of
						true ->
							NInt64 = #pk_PropInt64{index = Index, value = Value},
							{IntL, [NInt64 | Int64L], FloatL, StrL};
						_ ->
							?ERROR_OUT("~p:getNewValueMsg int64 failed:~p,~p,~p", [?MODULE, Index, Type, Value]),
							{IntL, Int64L, FloatL, StrL}
					end;
				?PropType_FLOAT ->
					case erlang:is_float(Value) of
						true ->
							NFloat = #pk_PropFloat{index = Index, value = Value},
							{IntL, Int64L, [NFloat | FloatL], StrL};
						_ ->
							?ERROR_OUT("~p:getNewValueMsg float failed:~p,~p,~p", [?MODULE, Index, Type, Value]),
							{IntL, Int64L, FloatL, StrL}
					end;
				?PropType_STRING ->
					case erlang:is_list(Value) of
						true ->
							NStr = #pk_PropString{index = Index, value = Value},
							{IntL, Int64L, FloatL, [NStr | StrL]};
						_ ->
							?ERROR_OUT("~p:getNewValueMsg string failed:~p,~p,~p", [?MODULE, Index, Type, Value]),
							{IntL, Int64L, FloatL, StrL}
					end;
				_ ->
					?ERROR_OUT("~p:getNewValueMsg failed:~p,~p,~p", [?MODULE, Index, Type, Value]),
					%% 不同步任意类型
					{IntL, Int64L, FloatL, StrL}
			end
	end.

%% fixme 分组改变回调 注意，如果在改变回调里重新设置属性新值，则很容易造成死循环，请仔细阅读代码并慎重添加回调！
%% 属性回调
-spec propChangeCallBack(PropIndex::pubProp() | priProp() | serProp(), PropType::propType(), term(), term()) -> ok.
propChangeCallBack(?PubProp_GroupID, _PropType, PropOldValue, 0) when erlang:is_integer(PropOldValue) andalso PropOldValue > 0 ->
	%% 从分组中出来，移出固定BUFF
	playerBuff:delBuff(?OUTOFCONTROL),
	playerBuff:delBuff(?PLAYERBLUR),

	%% 删除对应buff
	playerBuff:delBuffByScene(),
	ok;
propChangeCallBack(?PubProp_GroupID, _PropType, _PropOldValue, PropNewValue) when erlang:is_integer(PropNewValue) andalso PropNewValue > 0 ->
	%% 进入分组，添加固定buff，这里本应该根据配置，来判断是否添加BUFF,由于时间原因,进入所有分组时都添加禁止攻击，禁止移动buff
	PlayerLevel = playerState:getLevel(),
	playerBuff:addBuff(?OUTOFCONTROL, PlayerLevel),
	playerBuff:addBuff(?PLAYERBLUR, PlayerLevel),

	playerPetDouble:doubleMountOff(),
	ok;
%% 战斗力改变，检测是否更新最大战斗力
propChangeCallBack(?PriProp_PlayerForce, _PropType, _PropOldValue, PropNewValue) ->
	CurForce = getProp(?PriProp_PetForce) + PropNewValue,
	MaxForce = getProp(?SerProp_PlayerHistoryForce),
	case CurForce > MaxForce of
		true -> setInt64(?SerProp_PlayerHistoryForce, CurForce);
		_ -> skip
	end,
	ok;
propChangeCallBack(?PriProp_PetForce, _PropType, _PropOldValue, PropNewValue) ->
	CurForce = getProp(?PriProp_PlayerForce) + PropNewValue,
	MaxForce = getProp(?SerProp_PlayerHistoryForce),
	case CurForce > MaxForce of
		true -> setInt64(?SerProp_PlayerHistoryForce, CurForce);
		_ -> skip
	end,
	ok;
propChangeCallBack(?PriProp_Reputation, _PropType, _PropOldValue, PropNewValue) when erlang:is_integer(PropNewValue) andalso PropNewValue >= 0 ->
	playerVip:vipReputationChange(),
	ok;
propChangeCallBack(_PropIndex, _PropType, _PropOldValue, _PropNewValue) ->
	ok.

%% 从数据库中加载玩家的扩展属性
-spec loadPlayerPropList(List::[#rec_player_prop{},...]) -> ok.
loadPlayerPropList([]) ->
	%% 秒钟之后，保存一次玩家需要存的公共属性
	erlang:send_after(?TickSavePlayerProp, self(), tickSavePlayerSyncProp),
	ok;
loadPlayerPropList(#rec_player_prop{roleID = RoleID, propIndex = Index, propValue = BinValue} = Rec) ->
%% 	?DEBUG_OUT("loadPlayerPropList:~p", [Rec]),
	RID = playerState:getRoleID(),
	case RID =:= RoleID of
		true ->
			case getPropType(Index) of
				undefined ->
					case lists:member(Index, ?SaveSqlPropList) of
						true ->
							?ERROR_OUT("loadPlayerPropList not init:~p", [Rec]);
						_ ->
							%% 属性废弃
%%							?LOG_OUT("loadPlayerPropList:roleID=~p,index=~p, rec=~p",
%%								[RoleID, Index, Rec]),
%%							edb:writeRecord(update_rec_player_prop, Rec#rec_player_prop{propIndex = 0}),
							skip
					end,
					skip;
				Type when Type >= ?PropType_INT andalso Type =< ?PropType_Any ->
					Value = case erlang:is_binary(BinValue) of
								true ->
									erlang:binary_to_list(BinValue);
								_ ->
									BinValue
							end,
					RealValue = case Type of
						            ?PropType_INT ->
							            V = case erlang:is_integer(Value) of
												true -> Value;
												_ -> erlang:list_to_integer(Value)
							                end,
							            setInt(Index, V),
							            V;
						            ?PropType_INT64 ->
							            V = erlang:list_to_integer(Value),
							            setInt64(Index, V),
							            V;
						            ?PropType_FLOAT ->
							            V = erlang:list_to_float(Value),
							            setFloat(Index, V),
							            V;
						            ?PropType_STRING ->
							            setString(Index, Value),
							            Value;
									?PropType_Any ->
										V = misc:string_to_term(Value),
										setAny(Index, V),
										V
					            end,
					%% 保存刚刚加载的公共属性
					case lists:member(Index, ?SaveSqlPropList) of
						true ->
							L = getProp(?SerProp_LoadPropList),
							NL = [Rec#rec_player_prop{propValue = RealValue}|L],
							setString(?SerProp_LoadPropList, NL),
							ok;
						_ ->
							%% 不在保存属性列表中了，要物理删除掉
%%							?LOG_OUT("loadPlayerPropList:roleID=~p,index=~p, value=~p, rec=~p",
%%								[RoleID, Index, RealValue, Rec]),
%%							edb:writeRecord(update_rec_player_prop, Rec#rec_player_prop{propIndex = 0}),
							skip
					end;
				Error ->
					?ERROR_OUT("loadPlayerPropList unknow type:~p,~p", [Rec, Error])
			end;
		_ ->
			?ERROR_OUT("loadPlayerPropList:~p,~p", [RID, Rec])
	end,
	ok;
loadPlayerPropList([H|Right]) ->
	loadPlayerPropList(H),
	loadPlayerPropList(Right).

%% 秒钟之后，保存一次玩家需要存的公共属性
tickSavePlayerSyncProp() ->
	?LOG_OUT("tickSavePlayerSyncProp first save prop:~p", [playerState:getRoleID()]),
	case playerState:isFirstEnterMap() of
		false ->
			%% 登录完毕，可以保存需要保存的公共属性了
			?LOG_OUT("tickSavePlayerSyncProp first save prop [real save]:~p", [playerState:getRoleID()]),
			L = getProp(?SerProp_LoadPropList),
			Fun = fun(PropIndex) ->
				case getPropBufValue(PropIndex) of
					#recProp{propValue = Value} = Prop ->
						case lists:keyfind(PropIndex, #rec_player_prop.propIndex, L) of
							#rec_player_prop{propValue = Value2} ->
								%% 找到了
								case Value =/= Value2 of
									true ->
										%% 缓存属性与从数据库加载出来的数据不同，则保存数据库
										savePlayerProp(Prop);
									_ ->
										skip
								end;
							_ ->
								%% 没在加载中找到，这里也需要保存
								savePlayerProp(Prop),
								skip
						end;
					_ ->
						skip
				end
			end,
			lists:foreach(Fun, ?SaveSqlPropList),

			%% 清空缓存
			setString(?SerProp_LoadPropList, []);
		_ ->
			%% 还在登录过程中，重新心跳
			erlang:send_after(?TickSavePlayerProp, self(), tickSavePlayerSyncProp)
	end,
	ok.

%% 保存属性
-spec savePlayerProp(#recProp{}) -> ok.
savePlayerProp(#recProp{propIndex = Index, propType = Type, propValue = Value}) ->
	case lists:member(Index, ?SaveSqlPropList) of
		false ->
			skip;
		_ ->
			%% 在进入地图状态时不保存属性
			case playerState:isFirstEnterMap() of
				false ->
					savePlayerProp(Index, Type, Value);
				_ ->
					skip
			end
	end,
	ok.

savePlayerProp(_Index, _Type, undefined) ->
	?ERROR_OUT("savePlayerProp undefined:~p,~p,~p",[playerState:getRoleID(),_Index,_Type]),
	ok;
savePlayerProp(Index, Type, Value) ->
	case playerState:getIsPlayer() of
		true ->
			NValue = case Type of
				         ?PropType_INT ->
					         erlang:integer_to_list(Value);
				         ?PropType_INT64 ->
					         erlang:integer_to_list(Value);
				         ?PropType_FLOAT ->
					         erlang:float_to_list(Value);
				         ?PropType_STRING ->
					         Value;
						 ?PropType_Any ->
							 misc:term_to_string(Value);
				         _ ->
					         ?ERROR_OUT("savePlayerProp unknow type:~p,~p,~p,~p", [playerState:getRoleID(),Index,Type,Value]),
					         false
			         end,
			case NValue /= false of
				true ->
                    RoleID = playerState:getRoleID(),
					R = #rec_player_prop{
						roleID = RoleID,
						propIndex = Index,
						propValue = NValue
					},

					%% 保存数据
                    L = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_prop),
                    NL = lists:keystore(Index, #rec_player_prop.propIndex, L, R),
                    playerState2:setPlayerDataElement(#rec_playerdata.rec_player_prop, NL);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.