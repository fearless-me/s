%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, raink
%%% @doc
%%% 七日目标
%%% http://192.168.2.32:8080/browse/LUNA-2663
%%% @end
%%% Created : 20170620
%%%-------------------------------------------------------------------
-module(playerSevenDayAim).
-author("meitianyang").

-include("playerPrivate.hrl").
-include("cfg_seven_day_aim.hrl").

-define(SevenDayTime, 604800).	%% 七日目标持续时间（秒）

%% MSG
-export([
	reward/1	%% 领取奖励
]).

%% API
-export([
	init/0,				%% 上线初始化
	updateCondition/2	%% 更新条件值
]).

%%% ====================================================================
%%% MSG functions
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 领取奖励
-spec reward(ID::uint()) -> ok.
reward(ID) ->
	?DEBUG_OUT("[DebugForSevenDayAim] RoleID:~w ID:~w", [playerState:getRoleID(), ID]),
	%% 取消配置时请将type设置为0，新增配置请增加在末尾
	%% 以这种方式保证已有的配置ID不会发生变化，确保服务端记录的已领取奖励是正确的
	ListAlreadyReward = playerPropSync:getProp(?SerProp_SevenDayAimAlreadyReward),
	case lists:member(ID, ListAlreadyReward) of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimAlreadyReward);
		_ ->
			#seven_day_aimCfg{
				day			= Day,			%% 第几日
				type		= Type,			%% 主题类型，0无效
				subType1	= SubType1,		%% 条件类型 参考类型sevenDayAim() 但是为0时无效
				args1		= Args1,		%% 条件参数 参考类型sevenDayAim()
				subType2	= SubType2,		%% 如同subType1
				args2		= Args2,		%% Args1
				subType3	= SubType3,		%% 如同subType1
				args3		= Args3,		%% Args1
				rewardCoin	= RewardCoin,	%% 货币奖励 [{CoinType, CoinNum}, ...]
				rewardItem	= RewardItem	%% 道具奖励 [{ItemID, ItemNum}, ...]
			} = getCfg:getCfgPStack(cfg_seven_day_aim, ID),
			Ret1 = reward_CheckType(Type),
			Ret2 = reward_checkTime(Ret1, Day),
			Ret3 = reward_checkCondition(Ret2, SubType1, Args1),
			Ret4 = reward_checkCondition(Ret3, SubType2, Args2),
			Ret5 = reward_checkCondition(Ret4, SubType3, Args3),
			case Ret5 of
				1 ->
					playerPropSync:setAny(?SerProp_SevenDayAimAlreadyReward, [ID | ListAlreadyReward]),
					reward_coin(Ret5, RewardCoin),
					reward_item(Ret5, RewardItem),
					playerMsg:sendNetMsg(#pk_GS2U_SevenDayAimReward_Ack{id = ID});
				_ ->
					ok
			end
	end.

%% 检查主题类型（兼有开关功能）
-spec reward_CheckType(Type::uint()) -> 0|1.
reward_CheckType(0) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimClose),
	0;
reward_CheckType(_Type) ->
	1.

%% 检查活动时间与配置时间
%% 第一天不能做第二天的目标，但是第七天可以做第一天的目标
-spec reward_checkTime(Mark::0|1, Day::uint()) -> 0|1.
reward_checkTime(0, _Day) ->
	0;
reward_checkTime(_Mark, Day) ->
	TimeNow = time:getSyncTimeFromDBS(),
	case checkTime() of
		false ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimTimeOut),
			0;
		_ ->
			case (TimeNow - getTimeBegin() div 86400) + 1 of
				DayNow when DayNow >= Day ->
					1;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimDayError),
					0
			end
	end.

%% 检查是否满足领奖条件
-spec reward_checkCondition(Mark::0|1, SubType::sevenDayAim(), Args::list()) -> 0|1.
reward_checkCondition(0, _SubType, _Args) ->
	0;
reward_checkCondition(_Mark, 0, _Args) ->
	1;	%% 忽略该条件
reward_checkCondition(_Mark, ?SevenDayAim_CopyMap = SubType, [MapID]) ->
	#pk_SevenDayAimUpdate{args = Args} = getCondition(SubType),
	case lists:member(MapID, Args) of
		true ->
			1;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_WarriorTrial = SubType, [LayerAim]) ->
	#pk_SevenDayAimUpdate{args = [Layer]} = getCondition(SubType),
	case Layer >= LayerAim of
		true ->
			1;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_RoleLevel = SubType, [LevelAim]) ->
	#pk_SevenDayAimUpdate{args = [Level]} = getCondition(SubType),
	case Level >= LevelAim of
		true ->
			1;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_PetCount = SubType, [-1, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListPet} = getCondition(SubType),
	case lists:foldl(fun(A, B) -> A + B end, 0, ListPet) of
		Count when Count >= CountAim ->
			1;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_PetCount = SubType, [QualityAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListPet} = getCondition(SubType),
	try
		case lists:nth(QualityAim, ListPet) >= CountAim of
			true ->
				1;
			_ ->
				playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
				0
		end
	catch
	    _:_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_FashionCount = SubType, [CountAim]) ->
	#pk_SevenDayAimUpdate{args = [Count]} = getCondition(SubType),
	case Count >= CountAim of
		true ->
			1;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_Force = SubType, [ForceAim]) ->
	#pk_SevenDayAimUpdate{args = [Force]} = getCondition(SubType),
	case Force >= ForceAim of
		true ->
			1;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_Ranking = SubType, [RankAim]) ->
	#pk_SevenDayAimUpdate{args = [Rank]} = getCondition(SubType),
	case Rank >= RankAim of
		true ->
			1;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_EquipQuality = SubType, [-1, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListEquip} = getCondition(SubType),
	case lists:foldl(fun(A, B) -> A + B end, 0, ListEquip) of
		Count when Count >= CountAim ->
			1;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_EquipQuality = SubType, [QualityAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListEquip} = getCondition(SubType),
	try
		case lists:nth(QualityAim, ListEquip) >= CountAim of
			true ->
				1;
			_ ->
				playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
				0
		end
	catch
		_:_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_EquipStar = SubType, [StarAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListEquip} = getCondition(SubType),
	FunCount =
		fun(Star, Count) ->
			case Star >= StarAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	case lists:foldl(FunCount, 0, ListEquip) >= CountAim of
		true ->
			1;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_EquipRefine = SubType, [RefineAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListEquip} = getCondition(SubType),
	FunCount =
		fun(Refine, Count) ->
			case Refine >= RefineAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	case lists:foldl(FunCount, 0, ListEquip) >= CountAim of
		true ->
			1;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_GemLevel = _SubType, _Args) ->
	0;	% （纹章系统重新开发中，此处暂不支持）
reward_checkCondition(_Mark, ?SevenDayAim_GemMaster = _SubType, _Args) ->
	0;	% （纹章系统重新开发中，此处暂不支持）
reward_checkCondition(_Mark, ?SevenDayAim_WingLevel = SubType, [LevelAim]) ->
	#pk_SevenDayAimUpdate{args = [Level]} = getCondition(SubType),
	case Level >= LevelAim of
		true ->
			1;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_GodWeapon = SubType, [LevelAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListGodWeapon} = getCondition(SubType),
	FunCount =
		fun(Level, Count) ->
			case Level >= LevelAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	case lists:foldl(FunCount, 0, ListGodWeapon) >= CountAim of
		true ->
			1;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_PetStar = SubType, [StarAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListEquip} = getCondition(SubType),
	FunCount =
		fun(Star, Count) ->
			case Star >= StarAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	case lists:foldl(FunCount, 0, ListEquip) >= CountAim of
		true ->
			1;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_PetTurn = SubType, [TurnAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListEquip} = getCondition(SubType),
	FunCount =
		fun(Turn, Count) ->
			case Turn >= TurnAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	case lists:foldl(FunCount, 0, ListEquip) >= CountAim of
		true ->
			1;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, ?SevenDayAim_PetAdd = SubType, [AddAim, CountAim]) ->
	#pk_SevenDayAimUpdate{args = ListEquip} = getCondition(SubType),
	FunCount =
		fun({_, Add}, Count) ->
			case Add >= AddAim of
				true ->
					Count + 1;
				_ ->
					Count
			end
		end,
	case lists:foldl(FunCount, 0, ListEquip) >= CountAim of
		true ->
			1;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
			0
	end;
reward_checkCondition(_Mark, SubType, Args) ->
	?ERROR_OUT("Invalid Argument SubType:~w Args:~w", [SubType, Args]),
	playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayAimCannot),
	0.

%% 尝试可能的货币奖励
-spec reward_coin(Mark::0|1, RewardCoin::list()) -> ok.
reward_coin(0, _RewardCoin) ->
	ok;
reward_coin(_Mark, RewardCoin) when erlang:is_list(RewardCoin) ->
	reward_coin(RewardCoin),
	ok;
reward_coin(_Mark, RewardCoin) ->
	ok.
reward_coin([]) ->
	ok;
reward_coin([{CoinType, CoinNum} | T]) ->
	PLog = #recPLogTSMoney{
		reason = ?CoinSourceSevenDayAimReward,
		param = 0,
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_SevenDayAim
	},
	playerMoney:addCoin(CoinType, CoinNum, PLog),
	reward_coin(T);
reward_coin([InvalidCfg | T]) ->
	?ERROR_OUT("invalid Cfg:~w", [InvalidCfg]),
	reward_coin(T);
reward_coin(_Null) ->
	ok.

%% 尝试可能的道具奖励
-spec reward_item(Mark::0|1, RewardItem::list()) -> ok.
reward_item(0, _RewardItem) ->
	ok;
reward_item(_Mark, RewardItem) when erlang:is_list(RewardItem) ->
	reward_item(RewardItem),
	ok;
reward_item(_Mark, RewardItem) ->
	ok.
reward_item([]) ->
	ok;
reward_item([{ItemID, ItemNum} | T]) ->
	PLog = #recPLogTSItem{
		old         = 0,
		new         = ItemNum,
		change      = ItemNum,
		target      = ?PLogTS_PlayerSelf,
		source      = ?PLogTS_SevenDayAim,
		gold        = 0,
		goldtype    = 0,
		changReason = ?ItemSourceSevenDayAimReward,
		reasonParam = 0
	},
	playerPackage:addGoodsAndMail(ItemID, ItemNum, false, 0, PLog),
	reward_item(T);
reward_item([InvalidCfg | T]) ->
	?ERROR_OUT("invalid Cfg:~w", [InvalidCfg]),
	reward_item(T);
reward_item(_Null) ->
	ok.

%%% ====================================================================
%%% API functions
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 上线初始化并推送状态
-spec init() -> ok.
init() ->
	case playerPropSync:getProp(?SerProp_SevenDayAimTimeBegin) of
		0 ->
			%% 取当天凌晨4点时间
			TimeNowUTC = time:getSyncTime1970FromDBS(),
			Date = time:convertSec2DateTime(TimeNowUTC),
			TimeBeginOfDay = time:getDayBeginSeconds(Date) + ?ResetTimeHour * 3600 - ?SECS_FROM_0_TO_1970,
			playerPropSync:setInt(?SerProp_SevenDayAimTimeBegin, TimeBeginOfDay);
		_ ->
			skip
	end,
	Conditions =
		case checkTime() of
			true ->
				[getCondition(Aim, true) || Aim <- ?SevenDayAim_ALL];
			_ ->
				[]
		end,
	Msg = #pk_GS2U_SevenDayAimState_Sync{
		timeBegin = getTimeBegin(),
		conditions = Conditions,
		alreadyReward = playerPropSync:getProp(?SerProp_SevenDayAimAlreadyReward)
	},
	playerMsg:sendNetMsg(Msg),
	playerState2:setSevenDayAimIsInit(true),
	ok.

%%% --------------------------------------------------------------------
%% 更新条件值
-spec updateCondition(ID::sevenDayAim(), Args::list()) -> ok.
updateCondition(ID, Args) ->
	case checkTime() of
		false ->
			ok;	%% 不在活动时间，忽略
		_ ->
			case updateCondition_(ID, Args) of
				#pk_GS2U_SevenDayAimUpdate_Sync{} = Msg ->
					case playerState2:getSevenDayAimIsInit() of
						true ->
							?DEBUG_OUT("[DebugForSevenDayAim] updateCondition ID:~w Args:~w~n~w", [ID, Args, Msg]),
							playerMsg:sendNetMsg(Msg);
						_ ->
							ok	%% 未初始化，不发送消息
					end;
				_ ->
					ok	%% 无效更新
			end
	end.

%% 通关指定副本
updateCondition_(?SevenDayAim_CopyMap = ID, [MapID]) ->
	ListMapIDOld = playerPropSync:getProp(?SerProp_SevenDayAim_CopyMap),
	case lists:member(MapID, ListMapIDOld) of
		true ->
			ok;	%% 已通关，忽略
		_ ->
			ListMapIDNew = [MapID | ListMapIDOld],
			playerPropSync:setAny(?SerProp_SevenDayAim_CopyMap, ListMapIDNew),
			#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = ListMapIDNew}
	end;

%% 勇者荣耀通过第N层
updateCondition_(?SevenDayAim_WarriorTrial = ID, [Layer]) ->
	LayerOld = playerPropSync:getProp(?SerProp_SevenDayAim_WarriorTrial),
	case Layer =< LayerOld of
		true ->
			ok;	%% 已通关，忽略
		_ ->
			playerPropSync:setInt(?SerProp_SevenDayAim_WarriorTrial, Layer),
			#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [Layer]}
	end;

%% 角色达到指定等级（客户端本地获取）
updateCondition_(?SevenDayAim_RoleLevel = ID, _Args) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};

%% 指定品质（等于）的骑宠达到指定数量（客户端本地获取）
updateCondition_(?SevenDayAim_PetCount = ID, _Args) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};

%% 拥有时装达到指定数量
updateCondition_(?SevenDayAim_FashionCount = ID, [FashionID]) ->
	ListFashionIDOld = playerPropSync:getProp(?SerProp_SevenDayAim_FashionCount),
	case lists:member(FashionID, ListFashionIDOld) of
		true ->
			ok;	%% 已拥有，忽略
		_ ->
			ListFashionIDNew = [FashionID | ListFashionIDOld],
			playerPropSync:setAny(?SerProp_SevenDayAim_FashionCount, ListFashionIDNew),
			#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [erlang:length(ListFashionIDNew)]}
	end;

%% 战力达到指定数量
updateCondition_(?SevenDayAim_Force = ID, [Force]) ->
	playerPropSync:setInt64(?SerProp_SevenDayAim_Force, Force),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [Force]};

%% 竞技场排名达到前N
updateCondition_(?SevenDayAim_Ranking = ID, [RankMin]) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [RankMin]};

%% 指定品质（等于）的装备达到指定数量
updateCondition_(?SevenDayAim_EquipQuality = ID, _Args) ->
	EquipsBody = playerState:getPackage(?Item_Location_BodyEquipBag),
	EquipsBag = playerState:getPackage(?Item_Location_Equip_Bag),
	EquipsStorage = playerState:getPackage(?Item_Location_Equip_Storage),
	FunSum =
		fun
			(#recSaveEquip{quality = ?EquipColorTypeWhite}, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0 + 1, Count1, Count2, Count3, Count4, Count5];
			(#recSaveEquip{quality = ?EquipColorTypeGreen}, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1 + 1, Count2, Count3, Count4, Count5];
			(#recSaveEquip{quality = ?EquipColorTypeBlue}, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1, Count2 + 1, Count3, Count4, Count5];
			(#recSaveEquip{quality = ?EquipColorTypeRed}, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1, Count2, Count3 + 1, Count4, Count5];
			(#recSaveEquip{quality = ?EquipColorTypePurple}, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1, Count2, Count3, Count4 + 1, Count5];
			(#recSaveEquip{quality = ?EquipColorTypeOrange}, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1, Count2, Count3, Count4, Count5 + 1];
			(_, L) ->
				L
		end,
	[Count0, Count1, Count2, Count3, Count4, Count5] = L0 =
		playerPropSync:getProp(?SerProp_SevenDayAim_EquipQuality),
	L1 = lists:foldl(FunSum, [0, 0, 0, 0, 0, 0], EquipsBody),
	L2 = lists:foldl(FunSum, L1, EquipsBag),
	[Count0_, Count1_, Count2_, Count3_, Count4_, Count5_] =
		lists:foldl(FunSum, L2, EquipsStorage),
	case [
		erlang:max(Count0, Count0_),
		erlang:max(Count1, Count1_),
		erlang:max(Count2, Count2_),
		erlang:max(Count3, Count3_),
		erlang:max(Count4, Count4_),
		erlang:max(Count5, Count5_)
	] of
		L0 ->
			ok;	%% 未变化，忽略
		L4 ->
			playerPropSync:setAny(?SerProp_SevenDayAim_EquipQuality, L4),
			#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = L4}
	end;

%% 满足星级要求（大于等于）的装备（槽位）达到指定数量（客户端本地获取）
updateCondition_(?SevenDayAim_EquipStar = ID, _Args) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};

%% 满足精炼要求（大于等于）的装备（槽位）达到指定数量（客户端本地获取）
updateCondition_(?SevenDayAim_EquipRefine = ID, _Args) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};

%% 满足等级要求（大于等于）的纹章镶嵌达到指定数量（纹章系统重新开发中，此处暂不支持）
updateCondition_(?SevenDayAim_GemLevel = ID, _Args) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};

%% 满足等级要求（大于等于）的纹章大师达到指定数量（纹章系统重新开发中，此处暂不支持）
updateCondition_(?SevenDayAim_GemMaster = ID, _Args) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};

%% 翅膀达到指定阶级（客户端本地获取）
updateCondition_(?SevenDayAim_WingLevel = ID, _Args) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};

%% 满足等级要求（大于等于）的器灵达到指定数量（客户端本地获取）
updateCondition_(?SevenDayAim_GodWeapon = ID, _Args) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};

%% 满足星级要求（大于等于）的骑宠达到指定数量（客户端本地获取）
updateCondition_(?SevenDayAim_PetStar = ID, _Args) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};

%% 满足转生要求（大于等于）的骑宠达到指定数量（客户端本地获取）
updateCondition_(?SevenDayAim_PetTurn = ID, _Args) ->
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [0]};

%% 满足提升要求（大于等于）的骑宠达到指定数量
updateCondition_(?SevenDayAim_PetAdd = ID, [PetID, Count]) ->
	ListOld = playerPropSync:getProp(?SerProp_SevenDayAim_PetAdd),
	ListNew =
		case lists:keyfind(PetID, 1, ListOld) of
			{_, CountOld} ->
				lists:keyreplace(PetID, 1, ListOld, {PetID, CountOld + Count});
			_ ->
				[{PetID, Count} | ListOld]
		end,
	playerPropSync:setAny(?SerProp_SevenDayAim_PetAdd, ListNew),
	FunMsg =
		fun({_PetID, AddCount}, R) ->
			[AddCount | R]
		end,
	ListMsg = lists:foldl(FunMsg, [], ListNew),
	#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = ListMsg};

%% 守护女神通过第几波
updateCondition_(?SevenDayAim_ProtectGod = ID, [Wave]) ->
	WaveOld = playerPropSync:getProp(?SerProp_SevenDayAim_ProtectGod),
	case Wave =< WaveOld of
		true ->
			ok;	%% 已通关，忽略
		_ ->
			playerPropSync:setInt(?SerProp_SevenDayAim_ProtectGod, Wave),
			#pk_GS2U_SevenDayAimUpdate_Sync{type = ID, args = [Wave]}
	end.

%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 获取活动开始时间
-spec getTimeBegin() -> Sec::uint32().
getTimeBegin() ->
	playerPropSync:getProp(?SerProp_SevenDayAimTimeBegin).

%%% --------------------------------------------------------------------
%% 检查活动时间
-spec checkTime() -> boolean().
checkTime() ->
	TimeNow = time:getSyncTimeFromDBS(),
	case playerPropSync:getProp(?SerProp_SevenDayAimTimeBegin) + ?SevenDayTime =< TimeNow of
		true ->
			false;
		_ ->
			true
	end.

%%% --------------------------------------------------------------------
%% 获取条件
-spec getCondition(ID::sevenDayAim()) -> #pk_SevenDayAimUpdate{}.
getCondition(ID) ->
	getCondition(ID, false).
-spec getCondition(ID::sevenDayAim(), IsInit::boolean()) -> #pk_SevenDayAimUpdate{}.
getCondition(?SevenDayAim_CopyMap = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = playerPropSync:getProp(?SerProp_SevenDayAim_CopyMap)
	};
getCondition(?SevenDayAim_WarriorTrial = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [playerPropSync:getProp(?SerProp_SevenDayAim_WarriorTrial)]
	};
getCondition(?SevenDayAim_RoleLevel = ID, true) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [0]
	};
getCondition(?SevenDayAim_RoleLevel = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [playerState:getLevel()]
	};
getCondition(?SevenDayAim_PetCount = ID, true) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [0]
	};
getCondition(?SevenDayAim_PetCount = ID, _IsInit) ->
	FunSum1 =
		fun
			(?PetQualityWhite, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0 + 1, Count1, Count2, Count3, Count4, Count5];
			(?PetQualityGreen, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1 + 1, Count2, Count3, Count4, Count5];
			(?PetQualityBlue, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1, Count2 + 1, Count3, Count4, Count5];
			(?PetQualityPurple, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1, Count2, Count3 + 1, Count4, Count5];
			(?PetQualityOrange, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1, Count2, Count3, Count4 + 1, Count5];
			(?PetQualityRed, [Count0, Count1, Count2, Count3, Count4, Count5]) ->
				[Count0, Count1, Count2, Count3, Count4, Count5 + 1]
		end,
	FunSum2 =
		fun(#recPetInfo{pet_id = ID_}, Args) ->
			case getCfg:getCfgByKey(cfg_pet, ID_) of
				#petCfg{petquality = Quality} ->
					FunSum1(Quality, Args);
				_ ->
					Args
			end
		end,
	Args = lists:foldl(FunSum2, [0, 0, 0, 0, 0, 0], playerState:getPets()),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = Args
	};
getCondition(?SevenDayAim_FashionCount = ID, _IsInit) ->
	ListFashionID = playerPropSync:getProp(?SerProp_SevenDayAim_FashionCount),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [erlang:length(ListFashionID)]
	};
getCondition(?SevenDayAim_Force = ID, _IsInit) ->
	Force = playerPropSync:getProp(?SerProp_SevenDayAim_Force),
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [Force]
	};
getCondition(?SevenDayAim_Ranking = ID, _IsInit) ->
	RoleID = playerState:getRoleID(),
	MS = ets:fun2ms(fun(#rec_ladder_1v1{} = T) when T#rec_ladder_1v1.roleID =:= RoleID -> T end),
	case ets:select(ets_rec_ladder_1v1, MS) of
		[#rec_ladder_1v1{rankMin = RankMin}] ->
			#pk_SevenDayAimUpdate{
				type = ID,
				args = [RankMin]
			};
		_ ->
			#pk_SevenDayAimUpdate{
				type = ID,
				args = [0]
			}
	end;
getCondition(?SevenDayAim_EquipQuality = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = playerPropSync:getProp(?SerProp_SevenDayAim_EquipQuality)
	};
getCondition(?SevenDayAim_EquipStar = ID, true) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [0]
	};
getCondition(?SevenDayAim_EquipStar = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [Star || #recEquipStar{star = Star} <- playerState:getEquipStarList()]
	};
getCondition(?SevenDayAim_EquipRefine = ID, true) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [0]
	};
getCondition(?SevenDayAim_EquipRefine = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [Lv || {_, Lv} <- playerState:getEquipRefine()]
	};
getCondition(?SevenDayAim_WingLevel = ID, true) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [0]
	};
getCondition(?SevenDayAim_WingLevel = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [playerWing:getWingLevel()]
	};
getCondition(?SevenDayAim_GodWeapon = ID, true) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [0]
	};
getCondition(?SevenDayAim_GodWeapon = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [Lv || #rec_god_weapon{weaponLevel = Lv} <- playerState:getGodWeaponInfo()]
	};
getCondition(?SevenDayAim_PetStar = ID, true) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [0]
	};
getCondition(?SevenDayAim_PetStar = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [Star || #recPetInfo{pet_star = Star} <- playerState:getPets()]
	};
getCondition(?SevenDayAim_PetTurn = ID, true) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [0]
	};
getCondition(?SevenDayAim_PetTurn = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [Turn || #recPetInfo{pet_raw = Turn} <- playerState:getPets()]
	};
getCondition(?SevenDayAim_PetAdd = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [Count || {_PetID, Count} <- playerPropSync:getProp(?SerProp_SevenDayAim_PetAdd)]
	};
getCondition(?SevenDayAim_ProtectGod = ID, _IsInit) ->
	#pk_SevenDayAimUpdate{
		type = ID,
		args = [playerPropSync:getProp(?SerProp_SevenDayAim_ProtectGod)]
	}.
