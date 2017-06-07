%%
%% @doc @todo 装备系统.

-module(playerEquip).
-include("playerPrivate.hrl").
-define(UpStar_NoItem_Fail, 0).%%冲星材料不够,失败
-define(UpStar_NoCoin_Fail, 1).%%冲星材料不够,失败
-define(UpStar_Prog_Succ, 2).%%冲星当前进度,成功
-define(UpStar_Lv_Succ, 3).%%冲星等级,成功
-define(UpStar_Fail, 4).%%冲星失败

-define(EachUpStar, 0).%%单次冲星
-define(QuickUpStar, 1).%%快速冲星
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initRoleDefaultEquip/0,
	getEquipQuailtyRatio/1,
	makeEquip/4,
	equipRecast/4,
	equipSalePrice/1,
	equipResolve/1,
	sharedEquip/1,
	getPlayerVisibleEquip/0,
	getEquipQuality/1
%%	getAffixesCfg/2,
]).

-export([
	onEquipOn/2,
	onEquipOff/2
]).

%%装备精炼
-export([
	initEquipRefine/0,
	equipRefine/1,
	equipRefineOneKey/0,
	sendRefineList/1,
	equipRecastInit/0,
	sendEquipRecastInit2Client/0
]).

%%装备冲星
-export([
	initEquipStar/0,
	equipStar/2
]).

%%根据角色初始化默认装备，并穿到身上
-spec initRoleDefaultEquip() -> ok.
initRoleDefaultEquip() ->
	CareerID = playerState:getCareer(),
	case getCfg:getCfgPStack(cfg_player_desc, CareerID) of
		#player_descCfg{equip = EquipIDList} when erlang:is_list(EquipIDList)
			andalso erlang:length(EquipIDList) > 0 ->
			[initEquip(CareerID, EquipID) || EquipID <- EquipIDList],
			playerForce:calcPlayerForce(?PlayerEquipForce, true);
		_ ->
			skip
	end,
	ok.

%%根据装备ID和装备品质，生成装备，包括基础装备、特殊装备、套装装备
-spec makeEquip(EquipID, _Quality, BagType, IsBind) -> #recSaveEquip{}
	when EquipID :: itemId(), _Quality :: equipQuality(), BagType :: bagType(), IsBind :: boolean().
makeEquip(EquipID, _, BagType, IsBind) ->
	#equipmentCfg{qualityType = Quality} = getCfg:getCfgPStack(cfg_equipment, EquipID),
	{NewQuality, RealQuality} = recalcQuality(EquipID, Quality),
	EquipUID = uidMgr:makeItemUID(),
	?LOG_OUT("player:~p make EquipID:~p UID:~p Quality:~p BagType:~p IsBind:~p", [playerState:getRoleID(), EquipID, EquipUID, RealQuality, BagType, IsBind]),
	{BaseProp, ExtProp} =
		if
		%%绿色到红色
			NewQuality >= ?EquipColorTypeGreen andalso NewQuality =< ?EquipColorTypeMax ->  %%绿色装备有基础属性和附加属性
				{
					makeEquipBaseProp(EquipID, NewQuality, EquipUID),
					makeEquipExtProp(EquipID, NewQuality, EquipUID)
				};
			true ->
				%%默认为白色,装备只有基础属性
				{
					makeEquipBaseProp(EquipID, ?EquipColorTypeWhite, EquipUID),
					#rec_equip_ext_info{}
				}
		end,
	EnhanceProp = makeEquipEnahanceProp(BaseProp, NewQuality),
	%%这里判定并添加防御加成
	NewEnhanceProp = addDefensiveBonusProp(EnhanceProp, ExtProp),
	#recSaveEquip{
		roleID = 0,
		itemUID = EquipUID,
		itemID = EquipID,
		pos = BagType,
		isBind = IsBind,
		quality = RealQuality,
		createTime = time:getUTCNowSec(),
		expiredTime = 0,
		baseProp = BaseProp,
		extProp = ExtProp,
		enhanceProp = NewEnhanceProp
	}.

recalcQuality(_EquipID, Quality) -> {Quality, Quality}.
%%	%%之前不知道特殊装备品质规则，现在只能在这里做特殊判断了
%%	#equipmentCfg{qualityType = QualityType, uniqTierID = UniqTierID} = getCfg:getCfgPStack(cfg_equipment, EquipID),
%%	%%这里要兼容固定属性的装备，所以需要有一个用于走流程的品质，一个用于标识实际品质的品质
%%	case QualityType of
%%		?EquipTypeSpecial ->
%%			case UniqTierID > 0 of
%%				true ->
%%					{?EquipColorTypeOrange, ?EquipColorTypeOrange};
%%				_ ->
%%					{?EquipColorTypeOrange, Quality}
%%			end;
%%		?EquipTypeSuit ->
%%			case UniqTierID > 0 of
%%				true ->
%%					{?EquipColorTypeRed, ?EquipColorTypeRed};
%%				_ ->
%%					{?EquipColorTypeRed, Quality}
%%			end;
%%		?EquipTypeSpecial1 ->
%%			case UniqTierID > 0 of
%%				true ->
%%					{?EquipColorTypePurple, ?EquipColorTypePurple};
%%				_ ->
%%					{?EquipColorTypePurple, Quality}
%%			end;
%%		_ ->
%%			case UniqTierID > 0 of
%%				true ->
%%					{?EquipColorTypeOrange, Quality};
%%				_ ->
%%					{Quality, Quality}
%%			end
%%	end.


%%套装定制奖励根据ID,套装个数进行战斗奖励
-spec equipSuitAward(Type, EquipID, IsNotify) -> ok when Type :: atom(), EquipID :: uint(), IsNotify :: boolean().
equipSuitAward(Type, EquipID, IsNotify) ->
	case getCfg:getCfgPStack(cfg_equipment, EquipID) of
		#equipmentCfg{qualityType = QualityType, tierBonusID = TierBonusID} when TierBonusID =/= 0 ->
			Count = getBodyEquipByBonusID(TierBonusID),
			case QualityType =:= ?EquipTypeSuit andalso Count > 1 of
				true ->
					equipSuitAward2(Type, TierBonusID, Count, IsNotify);
				false ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% --- 初始化
equipRecastInit() ->
	Career = playerState:getCareer(),
	Seq = lists:seq(?EquipTypeStart + 1, ?EquipTypeMax + 1),
	RecastProps =
		lists:foldl(
			fun(EquipPos, Acc) ->
				case getCfg:getCfgByArgs(cfg_equipRecastInit, ?Career2CareerBase(Career), EquipPos) of
					#equipRecastInitCfg{props = Props1} ->
						{_, Props} =
							lists:foldl(
								fun({PropID, Val, Max}, {Index, Acc1}) ->
									NewRec = #recRecastProp{prop_pos = Index, prop_id = PropID, prop_val = Val, prop_max = Max},
									{Index + 1, [NewRec | Acc1]}
								end, {1, []}, Props1),

						[#recEquipRecast{equip_pos = EquipPos, props = Props} | Acc];
					_ ->
						[#recEquipRecast{equip_pos = EquipPos} | Acc]
				end
			end, [], Seq),

	playerPropSync:setAny(?SerProp_EquipRecastList, RecastProps),
%%	?DEBUG_OUT("init recast prop(~p),~p", [?SerProp_EquipRecastList, RecastProps]),
	ok.

sendEquipRecastInit2Client() ->
	List = playerPropSync:getProp(?SerProp_EquipRecastList),
%%	?DEBUG_OUT("player(~p),~p", [playerState:getRoleID(), List]),
	InfoList = lists:map(
		fun(#recEquipRecast{equip_pos = Pos, recast_val = Val, props = Props, props_ext = PropsExt} = EquipRecast) ->
			onRecastStore(EquipRecast, ?EquipOn, true),
			#pk_RecastPosInfo{
				equipPos = Pos,
				recastVal = Val,
				recastInfo = translateProp2Net(Props), recastInfo_ext = translateProp2Net(PropsExt)
			}
		end, List),
	Msg = #pk_GS2U_EquipRecastInfoInit{recastInfoList = InfoList},
	playerMsg:sendNetMsg(Msg),

	ok.

%%装备重铸
equipRecast(EquipPos, ?RecastTypeCommon, ?RecastOPTypeCast, _) ->
	case checkRecastCost(?RecastTypeCommon, skip) of
		{true, _} ->
			true = recastCost(?RecastTypeCommon, skip),
			equipRecastCommon(EquipPos);
		{false, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end;
equipRecast(EquipPos, ?RecastTypeCommon, ?RecastOPTypeSave, _) ->
	equipRecastReplace(EquipPos, ?RecastOPTypeSave);
equipRecast(EquipPos, ?RecastTypeAdvance, ?RecastOPTypeCast, LockList) ->
	case checkRecastCost(?RecastTypeAdvance, length(LockList)) of
		{true, _} ->
			true = recastCost(?RecastTypeAdvance, length(LockList)),
			equipRecastAdvance(EquipPos, LockList);
		{false, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end;

equipRecast(EquipPos, ?RecastTypeAdvance, ?RecastOPTypeSave, _) ->
	equipRecastReplace(EquipPos, ?RecastOPTypeSave);
equipRecast(_, _, _, _) ->
	ok.



checkRecastCost(Type, LockLen) ->
	case getRecastCost(Type, LockLen) of
		[ItemID, ItemNum] ->
			{playerPackage:getItemNumByID(ItemID) >= ItemNum, ?ErrorCode_BagEquipRecastMaterialNotEnough};
		_ ->
			{true, 0}
	end.

recastCost(Type, LockLen) ->
	case getRecastCost(Type, LockLen) of
		[ItemID, ItemNum] ->
			%% 扣除道具
			PLog = #recPLogTSItem{
				old = 1,
				new = 0,
				change = -1,
				target = ?PLogTS_EquipRecast,
				source = ?PLogTS_PlayerSelf,
				gold = 0,
				goldtype = 0,
				changReason = ?ItemDeleteReasonRecast,
				reasonParam = Type
			},
			playerPackage:delGoodsByID(?Item_Location_Bag, ItemID, ItemNum, PLog);
		_ ->
			true
	end.

getRecastCost(?RecastTypeCommon, _) ->
	case getCfg:getCfgByArgs(cfg_globalsetup, equipRecastpropcast) of
		#globalsetupCfg{setpara = [ItemID, ItemNum]} ->
			[ItemID, ItemNum];
		_ ->
			[]
	end;
getRecastCost(?RecastTypeAdvance, 0) ->
	case getCfg:getCfgByArgs(cfg_globalsetup, equipRecastrunecast0) of
		#globalsetupCfg{setpara = [ItemID, ItemNum]} ->
			[ItemID, ItemNum];
		_ ->
			[]
	end;
getRecastCost(?RecastTypeAdvance, 1) ->
	case getCfg:getCfgByArgs(cfg_globalsetup, equipRecastrunecast1) of
		#globalsetupCfg{setpara = [ItemID, ItemNum]} ->
			[ItemID, ItemNum];
		_ ->
			[]
	end;
getRecastCost(?RecastTypeAdvance, 2) ->
	case getCfg:getCfgByArgs(cfg_globalsetup, equipRecastrunecast1) of
		#globalsetupCfg{setpara = [ItemID, ItemNum]} ->
			[ItemID, ItemNum];
		_ ->
			[]
	end.

%% --- 重铸
equipRecastCommon(EquipPos) ->
	playerState:setEquipsRecast(undefined),
	Career = playerState:getCareer(),
	Recast = #recEquipRecast{},
	{RecastValList, GroupIdList} =
		case getCfg:getCfgByArgs(cfg_equipRecastInit, ?Career2CareerBase(Career), EquipPos) of
			#equipRecastInitCfg{reCastValue = CfgValList, group = Groups} ->
				{CfgValList, Groups};
			_ ->
				{[], []}
		end,
	RecastRandGroupIndex = lists:foldl(
		fun(Val, Acc) ->
			case Recast#recEquipRecast.recast_val >= Val of
				true ->
					Acc + 1;
				_ ->
					Acc
			end
		end, 1, RecastValList),

	RecastRandGroups =
		case RecastRandGroupIndex =< length(GroupIdList) of
			true ->
				lists:nth(RecastRandGroupIndex, GroupIdList);
			_ ->
				[]
		end,

	RecastRandValList1 =
		lists:foldl(
			fun(GroupID, Acc) ->
				NewVal = randValueFromOneGroup(GroupID),
				[NewVal | Acc]
			end, [], RecastRandGroups),

	RecastRandValList = lists:reverse(RecastRandValList1),
	case makeRecastResult({[], []}, RecastRandValList, getEquipRecastProperty(EquipPos)) of
		{true, AccRet} ->
			{RandRetValList, PropResultList} = AccRet,
			?DEBUG_OUT("player[~p],equipPos[~p], modify[~p],result[~p]",
				[playerState:getRoleID(), EquipPos, RandRetValList, PropResultList]),

			NewRecastValRet =
				case getEquipRecastProperty(EquipPos) of
					#recEquipRecast{recast_val = OldRecastVal} = RecastOld ->
						NewRecastVal = OldRecastVal + 1,
						NewCastRec1 = onRecastValChange(RecastOld#recEquipRecast{recast_val = NewRecastVal}),
						playerState:setEquipsRecast(NewCastRec1#recEquipRecast{props = PropResultList}),
						saveEquipRecastProperty(EquipPos, NewCastRec1),
						NewRecastVal;
					_ ->
						0
				end,

			RecastResultInfo = lists:map(
				fun({Pos, PropIndex, ModifyVal}) ->
					#pk_RecastResultInfo{pos = Pos, propIndex = PropIndex, value = ModifyVal}
				end, RandRetValList),
			Msg = #pk_GS2U_EquipRecastProp{equipPos = EquipPos, recastVal = NewRecastValRet,
				recastType = ?RecastTypeCommon, resultList = RecastResultInfo},
			playerMsg:sendNetMsg(Msg),

			playerAchieve:achieveEvent(?Achieve_ConciseMaster, [1]),
			playerSevenDays:onMissionEvent(?SevenDayMission_Event_11, 1, 0),
			ok;
		{false, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.

onRecastValChange(#recEquipRecast{
	equip_pos = EquipSlot, recast_val = CastVal, props_ext = PropExt
} = OldCastRec) ->
	?DEBUG_OUT("player[~p],equipPos[~p], oldProp[~p]",
		[playerState:getRoleID(), EquipSlot, OldCastRec#recEquipRecast.props]),
	Career = playerState:getCareer(),
	case getCfg:getCfgByArgs(cfg_equipRecastInit, ?Career2CareerBase(Career), EquipSlot) of
		#equipRecastInitCfg{lockCastVal = LockValList} ->
			PropLen = length(PropExt),
			LockLen = length(LockValList),
			case PropLen >= LockLen of
				true ->
					OldCastRec;
				_ ->
					Career = playerState:getCareer(),
					RealLockList = [LockVal || LockVal <- LockValList, LockVal =< CastVal],
					RealLockListLen = length(RealLockList),
					case RealLockListLen > PropLen of
						true ->
							PropList = randPropertyFromRecastAdvance(Career, EquipSlot, RealLockListLen - PropLen),
							{_, NewAddProps} =
								lists:foldl(
									fun({PropID, PropVal}, {Index, Acc}) ->
										NewPropRec = #recRecastProp{prop_pos = Index + 1, prop_id = PropID, prop_val = PropVal},
										{Index + 1, [NewPropRec | Acc]}
									end, {PropLen, []}, PropList),
							NewCastRec1 = OldCastRec#recEquipRecast{props_ext = lists:append(PropExt, NewAddProps)},
							sendRecastInfo2Client(NewCastRec1),
							onAddNewRecastProp(NewAddProps),
							NewCastRec1;
						_ ->
							OldCastRec
					end
			end;
		_ ->
			OldCastRec
	end.

makeRecastResult(Acc, ValList, #recEquipRecast{props = Props}) ->
	makeRecastResult(Acc, ValList, Props);
makeRecastResult(_Acc, [], undefined) ->
	{false, ?ErrorCode_BagEquipPropNotRelace};
makeRecastResult(Acc, [], []) ->
	{true, Acc};
makeRecastResult(_Acc, [], _Props) ->
	{false, ?ErrorCode_BagEquipPropNotRelace};
makeRecastResult(_Acc, _ValList, []) ->
	{false, ?ErrorCode_BagEquipPropNotRelace};
makeRecastResult({AccM, AccR}, [Val | ValList], [#recRecastProp{prop_pos = Pos, prop_max = Max, prop_id = PropIndex, prop_val = OldVal} = Prop | PropList]) ->
	NewVal = OldVal + Val,
	{ModifyVal, ResultVal} =
		if
			NewVal >= Max ->
				{Max - OldVal, Max};
			NewVal =< 0 ->
				{0 - OldVal, 0};
			true ->
				{Val, NewVal}
		end,
	NewAcc = {[{Pos, PropIndex, ModifyVal} | AccM], [Prop#recRecastProp{prop_val = ResultVal} | AccR]},
	makeRecastResult(NewAcc, ValList, PropList).

%% --- 替换属性
equipRecastReplace(EquipPos, _Type) ->
	OldRecast = getEquipRecastProperty(EquipPos),
	RecastStore = playerState:getEquipsRecast(),
	?DEBUG_OUT("player[~p] store [~p]", [playerState:getRoleID(), RecastStore]),
	playerState:setEquipsRecast(undefined),
	case RecastStore of
		#recEquipRecast{} ->
			saveEquipRecastProperty(EquipPos, RecastStore),
			sendRecastInfo2Client(RecastStore),
			onRecastStore(OldRecast, ?EquipOff, false),
			onRecastStore(RecastStore, ?EquipOn, true);
		_ ->
			skip
	end,
	ok.

onRecastStore(Recast, OpType, IsNotify) ->
	#recEquipRecast{props = Props, props_ext = PropEx} = Recast,
	MF = fun(#recRecastProp{prop_id = PropID, prop_val = PropVal}, Acc) ->
		[{PropID, PropVal, ?PropCalcType_Add} | Acc]
	     end,
	ExtProp1 = lists:foldl(MF, [], Props),
	ExtProp2 = lists:foldl(MF, ExtProp1, PropEx),
	playerCalcProp:changeProp_CalcType(ExtProp2, OpType, IsNotify).

onAddNewRecastProp(Props) ->
	MF = fun(#recRecastProp{prop_id = PropID, prop_val = PropVal}, Acc) ->
		[{PropID, PropVal, ?PropCalcType_Add} | Acc]
	     end,
	ExtProp = lists:foldl(MF, [], Props),
	playerCalcProp:changeProp_CalcType(ExtProp, ?EquipOn, true).

sendRecastInfo2Client(#recEquipRecast{equip_pos = Pos, recast_val = Val, props = Props, props_ext = PropsExt}) ->
	Info = #pk_RecastPosInfo{
		equipPos = Pos,
		recastVal = Val,
		recastInfo = translateProp2Net(Props),
		recastInfo_ext = translateProp2Net(PropsExt)
	},

	playerMsg:sendNetMsg(#pk_GS2U_EquipRecastInfo{recastInfo = Info}).

translateProp2Net(Props) ->
	[#pk_RecastPropInfo{pos = Pos, propIndex = PropIdx, propValue = PropVal, propValMax = Max} ||
		#recRecastProp{prop_pos = Pos, prop_id = PropIdx, prop_val = PropVal, prop_max = Max} <- Props].

getEquipRecastProperty(EquipPos) ->
	List = playerPropSync:getProp(?SerProp_EquipRecastList),
	case lists:keyfind(EquipPos, #recEquipRecast.equip_pos, List) of
		#recEquipRecast{} = Rec ->
			Rec;
		_ ->
			undefined
	end.

saveEquipRecastProperty(EquipPos, #recEquipRecast{equip_pos = EquipPos} = Rec) ->
	L1 = playerPropSync:getProp(?SerProp_EquipRecastList),
	L2 = lists:keystore(EquipPos, #recEquipRecast.equip_pos, L1, Rec),
	playerPropSync:setAny(?SerProp_EquipRecastList, L2);
saveEquipRecastProperty(EquipPos, Rec) ->
	?ERROR_OUT("setEquipRecast error, ~p, ~p", [EquipPos, Rec]).

%% ---
randValueFromOneGroup(GroupID) ->
	L1 = getCfg:get1KeyList(cfg_equipRecastRand),
	L2 = lists:foldl(
		fun(ID, Acc) ->
			case getCfg:getCfgByArgs(cfg_equipRecastRand, ID) of
				#equipRecastRandCfg{group = GroupID, weight = Weight} = Cfg ->
					[{Weight, Cfg} | Acc];
				_ ->
					Acc
			end
		end, [], L1),

	case catch misc:calcOddsByWeightList(L2) of
		#equipRecastRandCfg{values = [Min, Max | _]} ->
			misc:rand(Min, Max);
		_ ->
			0
	end.


%% --- 高级重铸
equipRecastAdvance(EquipSlot, LockList) ->
	playerState:setEquipsRecast(undefined),
	RecastInfo = getEquipRecastProperty(EquipSlot),
	case canRecastAdvance(EquipSlot, LockList, RecastInfo) of
		{true, _} ->
			Career = playerState:getCareer(),
			Left = length(RecastInfo#recEquipRecast.props_ext) - length(LockList),
			PropList = randPropertyFromRecastAdvance(?Career2CareerBase(Career), EquipSlot, Left),
			dealAdvanceResult(EquipSlot, PropList, LockList);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.

dealAdvanceResult(EquipPos, PropList, LockList) ->
	case getEquipRecastProperty(EquipPos) of
		#recEquipRecast{props_ext = PropsExt, recast_val = OldRecastVal} = OldRecast ->

			{ReserveList, ReplaceList, _} =
				lists:foldl(
					fun(#recRecastProp{prop_pos = Pos} = RecProp, {AccRes, AccRep, RandList}) ->
						case lists:member(Pos, LockList) of
							true ->
								{[RecProp | AccRes], AccRep, RandList};
							_ ->
								[{PropID, Value} | LeftRand] = RandList,
								{AccRes, [#recRecastProp{prop_pos = Pos, prop_id = PropID, prop_val = Value} | AccRep], LeftRand}
						end
					end, {[], [], PropList}, PropsExt),
			RecastResultInfo = [#pk_RecastResultInfo{pos = Pos, propIndex = PropID, value = Value} ||
				#recRecastProp{prop_pos = Pos, prop_id = PropID, prop_val = Value} <- ReplaceList],
			Msg = #pk_GS2U_EquipRecastProp{equipPos = EquipPos, recastVal = OldRecastVal,
				recastType = ?RecastTypeAdvance, resultList = RecastResultInfo},
			playerMsg:sendNetMsg(Msg),
			?DEBUG_OUT("player[~p],equipPos=~p,old=~p, reserve=~p, replace=~p",
				[playerState:getRoleID(), EquipPos, PropsExt, ReserveList, ReplaceList]),
%%			setEquipRecastProperty(EquipPos, OldRecast#rec_equip_recast{recast_val = OldRecastVal + 1}),
			playerState:setEquipsRecast(OldRecast#recEquipRecast{
				recast_val = OldRecastVal, props_ext = lists:append(ReserveList, ReplaceList)}),
			ok;
		_ ->
			ok
	end,
	ok.

canRecastAdvance(EquipSlot, _LockList, _Recast) when EquipSlot < ?EquipTypeStart + 1, EquipSlot > ?EquipTypeMax + 1 ->
	{false, ?ErrorCode_BagEquipRecastTypeNotExist};
canRecastAdvance(_EquipSlot, _LockList, undefined) ->
	{false, ?ErrorCode_BagEquipNotRecast};
canRecastAdvance(_EquipSlot, LockList, #recEquipRecast{props_ext = ExtProps}) ->
	{length(LockList) < length(ExtProps), ?ErrorCode_BagEquipRecastLockMax};
canRecastAdvance(_, _, _) ->
	{false, ?ErrorCode_BagEquipNotRecast}.

%%%
randPropertyFromRecastAdvance(Career, Slot, N) ->
	L1 = getCfg:get1KeyList(cfg_equipRecastAdvance),
	L2 = lists:foldl(
		fun(ID, Acc) ->
			case getCfg:getCfgByArgs(cfg_equipRecastAdvance, ID) of
				#equipRecastAdvanceCfg{career = Career, slot = Slot, weight = Weight} = Cfg ->
					[{Weight, Cfg} | Acc];
				_ ->
					Acc
			end
		end, [], L1),
	randPropertyFromRecastAdvance1([], L2, N).

randPropertyFromRecastAdvance1(Acc, _L, N) when N =< 0 ->
	Acc;
randPropertyFromRecastAdvance1(Acc, L, N) ->
	Prop =
		case catch misc:calcOddsByWeightList(L) of
			#equipRecastAdvanceCfg{props = [{PropID, Min, Max} | _]} ->
				{PropID, misc:rand(Min, Max)};
			_ ->
				{0, 0}
		end,
	randPropertyFromRecastAdvance1([Prop | Acc], L, N - 1).


%%装备的出售价格
%%装备出售价格 = 装备原始价格 * selloff * global_in
-spec equipSalePrice(Equip) -> uint() when Equip :: #recSaveEquip{}.
equipSalePrice(Equip) ->
	EquipSourcePrice = equipSourcePrice(Equip), %%装备原始价格
	SellOff = getConfigValueByName(selloff),    %%出售折扣值
	GlobalIn = getConfigValueByName(global_in),
	EquipSalePrice = EquipSourcePrice * SellOff * GlobalIn,
	case EquipSalePrice >= 1 of
		true ->
			erlang:trunc(EquipSalePrice);
		_ ->
			1
	end.

%%分解装备背包里的装备
-spec equipResolve(EquipUID) -> ok | [] when EquipUID :: uint().
equipResolve(EquipUID) ->
	Equip = playerPackage:getGoodsByUID(EquipUID, ?Item_Location_Equip_Bag),
	case Equip of
		#recSaveEquip{isLocked = false} ->
			case equipResolveProcess(Equip) of %%调用装备分解
				[PurpleEssence, GoldenEssence] ->
					[PurpleEssence, GoldenEssence];
				_ ->
					ok
			end;
		_ ->
			ok
	end.

%%玩家共享装备
-spec sharedEquip(EquipUIDs) -> ok when EquipUIDs :: [uint(), ...].
sharedEquip(EquipUIDs) ->
	Fun = fun(EquipUID) ->
		Equip = playerPackage:getGoodsByUID(EquipUID, ?Item_Location_Equip_Bag),
		case Equip of
			#recSaveEquip{} ->
				psMgr:sendMsg2PS(?PsNameMain, playerSharedEquip, Equip);
			_ ->
				EquipBody = playerPackage:getGoodsByUID(EquipUID, ?Item_Location_BodyEquipBag),
				case EquipBody of
					#recSaveEquip{} ->
						psMgr:sendMsg2PS(?PsNameMain, playerSharedEquip, EquipBody);
					_ ->
						skip
				end
		end
	      end,
	lists:foreach(Fun, EquipUIDs),
	ok.

%%获取玩家当前身上对远程玩家可见的装备
-spec getPlayerVisibleEquip() -> []|[#pk_visibleEquip{}, ...].
getPlayerVisibleEquip() ->
	Bag = playerState:getPackage(?Item_Location_BodyEquipBag),
	Fun = fun(Equip, VisibleEquipList) ->
		case Equip of
			#recSaveEquip{itemID = EquipID, quality = Quality} ->
				case checkIsVisible(EquipID) of
					true ->
						VisibleEquip = #pk_visibleEquip{
							equipID = EquipID,
							quality = Quality
						},
						[VisibleEquip | VisibleEquipList];
					false ->
						VisibleEquipList
				end;
			_ ->
				VisibleEquipList
		end
	      end,
	lists:foldl(Fun, [], Bag).

%%根据配置的品质分类产生具体的品质值
-spec getEquipQuality(QualityType) -> uint() when QualityType :: uint().
getEquipQuality(QualityType) ->
	case QualityType of
		?EquipTypeNormal ->
			Quality = lists:nth(random:uniform(4), [?EquipColorTypeWhite, ?EquipColorTypeGreen,
				?EquipColorTypeBlue, ?EquipColorTypePurple]);
		?EquipTypeSpecial ->
			Quality = ?EquipColorTypeOrange;
		?EquipTypeSuit ->
			Quality = ?EquipColorTypeRed;
		_ ->
			Quality = ?EquipColorTypeInvalid
	end,
	Quality.

onEquipOn(#recSaveEquip{baseProp = BaseProp, itemID = EquipID, quality = Quality} = Equip, IsNotifyClient) ->
	#equipmentCfg{
		skill1 = SkillID1,
		skill2 = SkillID2,
		normal_comboSkill = NormalSkill
	} = getCfg:getCfgPStack(cfg_equipment, EquipID),

	%%增加装备技能
	equipComboSkill(NormalSkill, ?EquipOn),
	playerSkill:addGoodsSkill(SkillID1, BaseProp#rec_equip_base_info.skillLevel1),
	playerSkill:addGoodsSkill(SkillID2, BaseProp#rec_equip_base_info.skillLevel2),

	equipChangeProp(Equip, ?EquipOn, true), %%修改战斗属性
	equipSuitAward(equipOn, EquipID, true),
	%%品质成就
	if
		Quality =:= ?EquipColorTypeBlue ->
			playerAchieve:achieveEvent(?Achieve_weapon_quality_2, [Quality]);
		Quality =:= ?EquipColorTypeRed ->
			playerAchieve:achieveEvent(?Achieve_weapon_quality_3, [Quality]);
		Quality =:= ?EquipColorTypePurple ->
			playerAchieve:achieveEvent(?Achieve_weapon_quality_4, [Quality]);
		true ->
			skip
	end,

	case IsNotifyClient of
		true ->
			visibleEquipOnBroadcast(EquipID, Quality);  %%广播给周围玩家
		_ ->
			skip
	end,
	playerForce:calcPlayerForce(?PlayerEquipForce, true).

onEquipOff(#recSaveEquip{itemID = EquipID} = Equip, IsNotify) ->
	%%脱武器时，把武器影响的攻击间隔取消
	%%删除装备技能

	#equipmentCfg{
		type = EquipType,
		skill1 = SkillID1,
		skill2 = SkillID2,
		normal_comboSkill = NormalSkill
	} = getCfg:getCfgPStack(cfg_equipment, EquipID),

	equipComboSkill(NormalSkill, ?EquipOff),
	playerSkill:delGoodsSkill(SkillID1),
	playerSkill:delGoodsSkill(SkillID2),

	case EquipType of
		?EquipTypeWeapon ->
			playerState:setAttackIntervalTime(?DefaultAttackInternalTime);
		_ ->
			skip
	end,

	equipSuitAward(equipOff, EquipID, IsNotify),
	equipChangeProp(Equip, ?EquipOff, IsNotify),%%修改战斗属性
	visibleEquipOffBroadcast(Equip#recSaveEquip.itemID, EquipType),  %%广播给周围玩家
	playerForce:calcPlayerForce(?PlayerEquipForce, IsNotify).

equipComboSkill(0, _Op) ->
	skip;
equipComboSkill(ComSkillID, Op) ->
	CombSkillList =
		case getCfg:getCfgPStack(cfg_comboSkill, ComSkillID) of
			#comboSkillCfg{skills = Skills} ->
				Skills;
			_ ->
				[]
		end,
	lists:foreach(
		fun(SkillID) ->
			case Op of
				?EquipOn ->
					playerSkill:addGoodsSkill(SkillID, 1);
				_ ->
					playerSkill:delGoodsSkill(SkillID)
			end
		end, CombSkillList),
	ok.

%%初始化装备精炼
-spec initEquipRefine() -> ok.
initEquipRefine() ->
	RefineList = playerState:getEquipRefine(),
	RefineSuitLevel = getSuitRefineLevel(RefineList),
	[changePosRefineProp(PosLevel, Type, ?AddEquipProp) || {Type, PosLevel} <- RefineList],
	[changeSuitRefineProp(Level, ?AddEquipProp) || Level <- lists:seq(1, RefineSuitLevel)],
	sendRefineList(RefineList).

%%装备精炼
-spec equipRefine(Type :: uint()) -> ok.
equipRefine(Type) ->
	equipRefine(Type, checkEquipRefineType(Type)).
equipRefine(Type, true) ->
	RList = playerState:getEquipRefine(),
	Lv = getPosRefineLevel(Type, RList),
	case getCfg:getCfgByKey(cfg_equipIntenLevel, Lv + 1) of
		#equipIntenLevelCfg{} = Cfg ->
			case Lv >= playerState:getLevel() of
				true ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipNotPlayerLevel);
				_ ->
					case checkEquipRefineMaterial(Cfg) of
						CList when is_list(CList) ->
							equipRefine(Type, Lv, CList, RList),
							playerSevenDays:onMissionEvent(?SevenDayMission_Event_1, 1, 0);
						false ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipRefineMaterialNotEnougth)
					end
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipRefineHasMax)
	end;
equipRefine(_, _) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipRefineTypeNotExist).
equipRefine(Type, Lv, CList, RList) ->
	equipRefineSpec(RList),
	playerAchieve:achieveEvent(?Achieve_StrMan, [1]),
	OldSuitLevel = getSuitRefineLevel(RList),
	%%目前装备跟精炼部位没有关系
	NewRList = lists:keystore(Type, 1, RList, {Type, Lv + 1}),
	playerState:setEquipRefine(NewRList),
	CurSuitLevel = getSuitRefineLevel(NewRList),
	%%套装加成
	case OldSuitLevel =:= CurSuitLevel of
		false ->
			playerGameNotice:sendGameNotice(?SuitRefineLevel_Notice, CurSuitLevel, 0, 0),
			playerAchieve:achieveEvent(?Achieve_StrongestKing, [1]),
			changeSuitRefineProp(CurSuitLevel, ?AddEquipProp);
		_ ->
			skip
	end,
	%%部位加成
	changePosRefineProp(Lv, Type, ?DelEquipProp),
	changePosRefineProp(Lv + 1, Type, ?AddEquipProp),
	delItem(CList, ?ItemDeleteReasonRefine),
	playerSave:saveRefine(Type, Lv + 1),
	sendRefineResult(Type, Lv + 1),
	playerForce:calcPlayerForce(?PlayerStrForce, true).

%% 装备一键精炼
equipRefineOneKey() ->
	RList0 = playerState:getEquipRefine(),
	TypeListFull = [?EquipTypeWeapon, ?EquipTypeHelmet, ?EquipTypeEarrings, ?EquipTypeArmor, ?EquipTypeNecklace, ?EquipTypeTrousers, ?EquipTypeRing, ?EquipTypeBoots],
	FunFill =
		fun(Type, AccIn) ->
			case lists:keyfind(Type, 1, RList0) of
				false ->
					[{Type, 0} | AccIn];
				V ->
					[V | AccIn]
			end
		end,
	RList1 = lists:foldl(FunFill, [], TypeListFull),
	FunFindMin =
		fun({_, Level}, LevelMin) ->
			case Level < LevelMin of
				true ->
					Level;
				_ ->
					LevelMin
			end
		end,
	
	LevelMax = lists:max(getCfg:get1KeyList(cfg_equipIntenLevel)),
	LevelMin = lists:foldl(FunFindMin, LevelMax, RList1),
	LevelRole = playerState:getLevel(),
	?DEBUG_OUT("[DebugForDebugForRefine] equipRefineOneKey LevelRole(~p) LevelMin(~p) LevelMax(~p) RList1(~p)", [LevelRole, LevelMin, LevelMax, RList1]),
	case LevelRole =< LevelMin of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipNotPlayerLevel);
		_ ->
			FunGetMin =
				fun({Type, Level}, {RList2, RList3}) ->
					case Level of
						LevelMin ->
							{[Type | RList2], RList3};
						_ ->
							{RList2, [{Type, Level} | RList3]}
					end
				end,
			{RList2, RList3} = lists:foldl(FunGetMin, {[], []}, RList1),
			case RList2 of
				[] ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipRefineHasMax);
				_ ->
					case getCfg:getCfgByKey(cfg_equipIntenLevel, LevelMin + 1) of
						#equipIntenLevelCfg{} = Cfg ->
							RefineCount = erlang:length(RList2),
							case checkEquipRefineOneKeyMaterial(Cfg, RefineCount) of
								CList when is_list(CList) ->
									equipRefineOneKey(RList2, RefineCount, RList3, LevelMin, CList, RList1),
									playerSevenDays:onMissionEvent(?SevenDayMission_Event_1, RefineCount, 0);
								false ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipRefineMaterialNotEnougth)
							end;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipRefineHasMax)
					end
			end
	end,
	ok.
equipRefineOneKey(TypeList, Count, RList3, Lv, CList, RList) ->
	equipRefineSpec(RList),
	playerAchieve:achieveEvent(?Achieve_StrMan, [Count]),
	OldSuitLevel = getSuitRefineLevel(RList),
	%%目前装备跟精炼部位没有关系
	FunNewRListA =
		fun(TypeIn, AccIn) ->
			[{TypeIn, Lv + 1} | AccIn]
		end,
	NewRListA = lists:foldl(FunNewRListA, [], TypeList),
	NewRList = NewRListA ++ RList3,
	delItem(CList, ?ItemDeleteReasonRefine),    %% 扣除资源
	playerState:setEquipRefine(NewRList),
	CurSuitLevel = getSuitRefineLevel(NewRList),
	%%套装加成
	case OldSuitLevel =:= CurSuitLevel of
		false ->
			playerGameNotice:sendGameNotice(?SuitRefineLevel_Notice, CurSuitLevel, 0, 0),
			playerAchieve:achieveEvent(?Achieve_StrongestKing, [1]),
			changeSuitRefineProp(CurSuitLevel, ?AddEquipProp);
		_ ->
			skip
	end,
	%%部位加成
	FunRefineProp =
		fun(TypeIn) ->
			changePosRefineProp(Lv, TypeIn, ?DelEquipProp),
			changePosRefineProp(Lv + 1, TypeIn, ?AddEquipProp),
			playerSave:saveRefine(TypeIn, Lv + 1)
		end,
	lists:foreach(FunRefineProp, TypeList),
	%%消息
	Msg = #pk_GS2U_EquipRefineResultOneKey{
		code = playerState:getPlayerCode(),
		typeList = TypeList,
		levelOld = Lv,
		levelNew = Lv + 1
	},
	playerMsg:sendMsgToNearPlayer(Msg, true),
	playerForce:calcPlayerForce(?PlayerStrForce, true).

equipRefineSpec(RL) ->
	PropValue = playerPropSync:getProp(?SerProp_LoadRefineFlag),
	if
		PropValue =:= undefined orelse PropValue =:= 0 ->
			Fun = fun({_, Lv}, Sum) ->
				Lv + Sum
			      end,
			AllLv = lists:foldl(Fun, 0, RL),
			SuitLv = getSuitRefineLevel(RL),
			case AllLv of
				0 ->
					skip;
				_ ->
					playerAchieve:achieveEvent(?Achieve_StrMan, [AllLv])
			end,
			case SuitLv of
				0 ->
					skip;
				_ ->
					playerAchieve:achieveEvent(?Achieve_StrongestKing, [SuitLv])
			end,
			playerPropSync:setInt(?SerProp_LoadRefineFlag, 1);
		true ->
			skip
	end.

-spec checkEquipRefineType(Type :: uint()) -> boolean().
checkEquipRefineType(Type) when Type >= ?EquipTypeStart andalso Type =< ?EquipTypeMax ->
	%%?DEBUG_OUT("[DebugForRefine] Type(~p)", [Type]),
	true;
checkEquipRefineType(_Type) ->
	%%?DEBUG_OUT("[DebugForRefine] Type(~p)", [_Type]),
	false.

-spec checkEquipRefineMaterial(Cfg :: #equipIntenLevelCfg{}) -> false | list().
checkEquipRefineMaterial(#equipIntenLevelCfg{materialCost = MaterialCost}) ->
	checkEquipRefineMaterial(MaterialCost, []).
checkEquipRefineMaterial([], CostList) ->
	CostList;
checkEquipRefineMaterial([{ID, Num} | List], CostList) ->
	case playerPackage:getItemNumByID(ID) >= Num of
		true ->
			checkEquipRefineMaterial(List, [{ID, Num} | CostList]);
		_ ->
			false
	end.

-spec checkEquipRefineOneKeyMaterial(Cfg :: #equipIntenLevelCfg{}, Count :: uint()) -> false | list().
checkEquipRefineOneKeyMaterial(#equipIntenLevelCfg{materialCost = MaterialCost}, Count) ->
	checkEquipRefineOneKeyMaterial(MaterialCost, Count, []).

checkEquipRefineOneKeyMaterial([], _Count, CostList) ->
	CostList;
checkEquipRefineOneKeyMaterial([{ID, Num} | List], Count, CostList) ->
	case playerPackage:getItemNumByID(ID) >= Num * Count of
		true ->
			checkEquipRefineOneKeyMaterial(List, Count, [{ID, Num * Count} | CostList]);
		_ ->
			false
	end.

%%初始化装备冲星
-spec initEquipStar() -> ok.
initEquipStar() ->
	L = playerState:getEquipStarList(),
	Slv = getSuitUpStarLv(L),
	[changeSuitStarProp(Lv, ?AddEquipProp) || Lv <- lists:seq(1, Slv)],
	sendEquipUpStarList(L).

%%装备冲星
-spec equipStar(Pos :: uint(), Type :: uint()) -> ok.
equipStar(Pos, Type) ->
	Lv = playerState:getLevel(),
	L = playerState:getEquipStarList(),
	EquipStar =
		case lists:keyfind(Pos, #recEquipStar.pos, L) of
			false ->
				#recEquipStar{
					bless = 0,
					pos = Pos,
					prog = 0,
					star = 0
				};
			Tuple ->
				Tuple
		end,
	case getCfg:getCfgByArgs(cfg_equipstar, EquipStar#recEquipStar.star) of
		#equipstarCfg{limit_level = LimitLv} = EquipStarCfg when Lv >= LimitLv ->
			case getCfg:getCfgByArgs(cfg_equipstar, EquipStar#recEquipStar.star + 1) of
				#equipstarCfg{} ->
					equipStar(Type, EquipStar, EquipStarCfg),
					playerSevenDays:onMissionEvent(?SevenDayMission_Event_10, 1, 0);
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipStarMaxLevel)
			end;
		#equipstarCfg{} ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipStarLvNotOverPlayer);
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipStarMaxLevel)
	end.

%%单次冲星
equipStar(
	?EachUpStar,
	#recEquipStar{bless = Bless, prog = Prog, star = Star} = EquipStar,
	#equipstarCfg{cost_item = ItemID, fail_odd = FailOdd} = EquipStarCfg
) ->
	Num = playerPackage:getItemNumByID(ItemID),
	Coin = playerState:getCoin(?CoinTypeGold),
	case eachEquipStar(Bless, Prog, Num, Coin, 0, EquipStarCfg) of
		{?UpStar_NoItem_Fail, _, _, _} ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipStarMaterialNotEnougth);
		{?UpStar_NoCoin_Fail, _, _, _} ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipStarCoinNotEnougth);
		Other ->
			{Res, Index1, ReNum1, ReCoin1, NewEquipStar} =
				case Other of
					{?UpStar_Prog_Succ, Index, ReNum, ReCoin} ->
						{?UpStar_Prog_Succ, Index, ReNum, ReCoin, EquipStar#recEquipStar{
							bless = 0,
							prog = Prog + 1
						}};
					{?UpStar_Lv_Succ, Index, ReNum, ReCoin} ->
						{?UpStar_Lv_Succ, Index, ReNum, ReCoin, EquipStar#recEquipStar{
							bless = 0,
							prog = 0,
							star = Star + 1
						}};
					{?UpStar_Fail, Index, ReNum, ReCoin} ->
						{?UpStar_Fail, Index, ReNum, ReCoin, EquipStar#recEquipStar{
							bless = Bless + trunc(FailOdd*1000),
							prog = 0
						}}
				end,
			equipStarRes(?EachUpStar, ItemID, Num - ReNum1, Coin - ReCoin1, Index1, Res, NewEquipStar)
	end;
%%一键冲星
equipStar(
	?QuickUpStar,
	EquipStar,
	#equipstarCfg{cost_item = ItemID} = EquipStarCfg
) ->
	Num = playerPackage:getItemNumByID(ItemID),
	Coin = playerState:getCoin(?CoinTypeGold),
	{Res, Index, ReNum, ReCoin, NewEquipStar} = equipStar(Num, Coin, 0, EquipStar, EquipStarCfg),
	equipStarRes(?QuickUpStar, ItemID, Num - ReNum, Coin - ReCoin, Index, Res, NewEquipStar).

equipStar(
	Num,
	Coin,
	Index,
	#recEquipStar{bless = Bless, prog = Prog, star = Star} = EquipStar,
	#equipstarCfg{fail_odd = FailOdd} = EquipStarCfg
) ->
	case eachEquipStar(Bless, Prog, Num, Coin, Index, EquipStarCfg) of
		{?UpStar_Prog_Succ, Index1, ReNum, ReCoin} ->
			NewEquipStar = EquipStar#recEquipStar{
				bless = 0,
				prog = Prog + 1
			},
			equipStar(ReNum, ReCoin, Index1, NewEquipStar, EquipStarCfg);
		{?UpStar_Fail, Index1, ReNum, ReCoin} ->
			NewEquipStar = EquipStar#recEquipStar{
				bless = Bless + trunc(FailOdd*1000),
				prog = 0
			},
			equipStar(ReNum, ReCoin, Index1, NewEquipStar, EquipStarCfg);
		{?UpStar_Lv_Succ, Index1, ReNum, ReCoin} ->
			NewEquipStar = EquipStar#recEquipStar{
				bless = 0,
				prog = 0,
				star = Star + 1
			},
			{?UpStar_Lv_Succ, Index1, ReNum, ReCoin, NewEquipStar};
		{Type, Index1, ReNum, ReCoin} ->
			{Type, Index1, ReNum, ReCoin, EquipStar}
	end.

%%装备冲星结果
equipStarRes(Type, CostItemID, CostNum, CostCoin, Index, Res, #recEquipStar{pos = Pos} = EquipStar) ->
	%%删除物品
	delItem([{CostItemID, CostNum}], ?ItemDeleteReasonEquipUpStar),

	%%删除金币
	true = playerMoney:useCoin(?CoinUseTypeGold, CostCoin,
		#recPLogTSMoney{reason = ?CoinUseEquipUpStar, param = 0, target = ?PLogTS_EquipUpStar, source = ?PLogTS_PlayerSelf}),
	L = playerState:getEquipStarList(),
	%%改变装备属性
	case Res of
		?UpStar_Lv_Succ ->
			{Old, New} =
				case getEquipByType(Pos) of
					{true, Equip} ->
						equipChangeProp(Equip, ?EquipOff, true),
						%%还原原来的装备
						NL = lists:keystore(Pos, #recEquipStar.pos, L, EquipStar),
						playerState:setEquipStarList(NL),
						%%再同步修改角色的战斗属性
						equipChangeProp(Equip, ?EquipOn, true),

						%%广播
						OldSuitLv = getSuitUpStarLv(L),
						CurSuitLv = getSuitUpStarLv(NL),

						playerForce:calcPlayerForce(?PlayerEquipForce, true),
						{OldSuitLv, CurSuitLv};
					_ ->
						NL = lists:keystore(Pos, #recEquipStar.pos, L, EquipStar),
						playerState:setEquipStarList(NL),
						OldSuitLv = getSuitUpStarLv(L),
						CurSuitLv = getSuitUpStarLv(NL),
						{OldSuitLv, CurSuitLv}
				end,
			if
				Old =/= New ->
					changeSuitStarProp(New, ?AddEquipProp);
				true ->
					skip
			end,
			if
				Old =/= New andalso (New rem 5) =:= 0 andalso New > 0 ->
					%%勇士[00ff00]<t=9>[~p],[~p],【~ts】</t>[-]将全身装备冲星至[00ff00]【~ts】[-]，创造新的传奇。
					case getCfg:getCfgByArgs(cfg_equipstar, New) of
						#equipstarCfg{desc = Desc1} ->
							Desc = Desc1;
						_ ->
							Desc = ""
					end,
					N = stringCfg:getString(equipUpstar, [playerState:getRoleID(), playerState:getPlayerCode(), playerState:getName(), Desc]),
					core:sendBroadcastNotice(N);
				true ->
					skip
			end;
		_ ->
			NL = lists:keystore(Pos, #recEquipStar.pos, L, EquipStar),
			playerState:setEquipStarList(NL)
	end,
	playerSave:saveEquipStar(EquipStar),

	%%发送消息
	sendEquipUpStarRes(EquipStar, Type, Index, CostItemID, CostNum, CostCoin, Res).

%%装备单次冲星结果
eachEquipStar(
	_Bless,
	_Prog,
	Num,
	Coin,
	Index,
	#equipstarCfg{cost_num = CostNum}
) when Num < CostNum ->
	{?UpStar_NoItem_Fail, Index, Num, Coin};
eachEquipStar(
	_Bless,
	_Prog,
	Num,
	Coin,
	Index,
	#equipstarCfg{
		cost_coin = CostCoin
	}
) when Coin < CostCoin ->
	{?UpStar_NoCoin_Fail, Index, Num, Coin};
%%eachEquipStar(
%%	Bless,
%%	_Prog,
%%	Num,
%%	Coin,
%%	Index,
%%	#equipstarCfg{
%%		fail_odd = FailOdd,
%%		fail_min = FailTimes,
%%		cost_num = CostNum,
%%		cost_coin = CostCoin
%%	}
%%) when Bless >= trunc(FailOdd * FailTimes * 1000) ->
%%	{?UpStar_Lv_Succ, Index + 1, Num - CostNum, Coin - CostCoin};
eachEquipStar(
	Bless,
	Prog,
	Num,
	Coin,
	Index,
	#equipstarCfg{
		progress = Progress,
		fail_odd = FailOdd,
		fail_min = FailTimes,
		cost_num = CostNum,
		cost_coin = CostCoin
	}
) when Bless < trunc(FailOdd * FailTimes * 1000) ->
	{?UpStar_Fail, Index + 1, Num - CostNum, Coin - CostCoin};
eachEquipStar(
	Bless,
	Prog,
	Num,
	Coin,
	Index,
	#equipstarCfg{
		progress = Progress,
		odd = Odd,
		cost_num = CostNum,
		cost_coin = CostCoin
	}
) ->
	eachEquipStar(Prog, random:uniform(100), Odd * 100 + Bless / 10, Index, Progress, Num, Coin, CostNum, CostCoin).

eachEquipStar(
	Prog, R, Odd, Index, Progress,
	Num, Coin, CostNum, CostCoin
) when R =< Odd andalso (Progress - Prog) =:= 1 ->
	{?UpStar_Lv_Succ, Index + 1, Num - CostNum, Coin - CostCoin};
eachEquipStar(
	_Prog, R, Odd, Index, _Progress,
	Num, Coin, CostNum, CostCoin
) when R =< Odd ->
	{?UpStar_Prog_Succ, Index + 1, Num - CostNum, Coin - CostCoin};
eachEquipStar(
	_Prog, _R, _Odd, Index, _Progress,
	Num, Coin, CostNum, CostCoin
) ->
	{?UpStar_Fail, Index + 1, Num - CostNum, Coin - CostCoin}.

%% ====================================================================
%% Internal functions
%% ====================================================================

%%生成装备的基础属性,EquipID装备配置表ID, Quality装备品质
-spec makeEquipBaseProp(EquipID, Quality, EquipUID) -> #rec_equip_base_info{}
	when EquipID :: uint(), Quality :: equipQuality(), EquipUID :: uint().
makeEquipBaseProp(EquipID, _Quality, EquipUID) ->
	#equipmentCfg{} = EquipmentCfg = getCfg:getCfgPStack(cfg_equipment, EquipID),      %%装备基础属性
	#rec_equip_base_info{
		equipUID = EquipUID,
		propKey1 = EquipmentCfg#equipmentCfg.propType1,
		propValue1 = misc:rand(EquipmentCfg#equipmentCfg.min1, EquipmentCfg#equipmentCfg.max1),
		propKey2 = EquipmentCfg#equipmentCfg.propType2,
		propValue2 = misc:rand(EquipmentCfg#equipmentCfg.min2, EquipmentCfg#equipmentCfg.max2),
		propKey3 = EquipmentCfg#equipmentCfg.propType3,
		propValue3 = misc:rand(EquipmentCfg#equipmentCfg.min3, EquipmentCfg#equipmentCfg.max3),
		propKey4 = EquipmentCfg#equipmentCfg.propType4,
		propValue4 = misc:rand(EquipmentCfg#equipmentCfg.min4, EquipmentCfg#equipmentCfg.max4),
		propKey5 = EquipmentCfg#equipmentCfg.propType5,
		propValue5 = misc:rand(EquipmentCfg#equipmentCfg.min5, EquipmentCfg#equipmentCfg.max5),
		skillLevel1 = misc:rand(EquipmentCfg#equipmentCfg.minLevel1, EquipmentCfg#equipmentCfg.maxLevel1),
		skillLevel2 = misc:rand(EquipmentCfg#equipmentCfg.minLevel2, EquipmentCfg#equipmentCfg.maxLevel2)
	}.

-spec makeEquipEnahanceProp(#rec_equip_base_info{}, Quality) -> #rec_equip_enhance_info{} when
	Quality :: equipQuality().
makeEquipEnahanceProp(#rec_equip_base_info{equipUID = EquipUID} = BaseProp, Quality) ->
	EquipQuailtyRatio = getEquipQuailtyRatio(Quality), %%装备品质加成系数
	#rec_equip_enhance_info{
		equipUID = EquipUID,
		propKey1 = BaseProp#rec_equip_base_info.propKey1,
		propValue1 = BaseProp#rec_equip_base_info.propValue1 * (1 + EquipQuailtyRatio),
		propKey2 = BaseProp#rec_equip_base_info.propKey2,
		propValue2 = BaseProp#rec_equip_base_info.propValue2 * (1 + EquipQuailtyRatio),
		propKey3 = BaseProp#rec_equip_base_info.propKey3,
		propValue3 = BaseProp#rec_equip_base_info.propValue3 * (1 + EquipQuailtyRatio),
		propKey4 = BaseProp#rec_equip_base_info.propKey4,
		propValue4 = BaseProp#rec_equip_base_info.propValue4 * (1 + EquipQuailtyRatio),
		propKey5 = BaseProp#rec_equip_base_info.propKey5,
		propValue5 = BaseProp#rec_equip_base_info.propValue5 * (1 + EquipQuailtyRatio)
	}.
%%
%%%%获取装备附加属性指定的职业
%%-spec getEquipAffixClass(Class :: uint()) -> uint().
%%getEquipAffixClass(Class) ->
%%	%%一开始就确定装备的附加属性职业
%%	#globalsetupCfg{setpara = [Selfchance]} = getCfg:getCfgPStack(cfg_globalsetup, selfChance),
%%	NewSelfChance = Selfchance * 100,
%%	RandomNum = random:uniform(100),
%%	if
%%		Class =:= ?EquipAffixClassAll ->
%%			if
%%				RandomNum =< NewSelfChance ->
%%					playerState:getCareer();
%%				true ->
%%					ClassList = [1, 2, 3, 4],
%%					NewClassList = lists:delete(playerState:getCareer(), ClassList),
%%					lists:nth(random:uniform(3), NewClassList)
%%			end;
%%		true ->
%%			Class
%%	end.

%%生成装备的附加属性,EquipID装备配置表ID, Quality装备品质
-spec makeEquipExtProp(EquipID, Quality, EquipUID) -> #rec_equip_ext_info{}
	when EquipID :: uint(), Quality :: int(), EquipUID :: uint().
makeEquipExtProp(_EquipID, _Quality, _EquipUID) ->
	#rec_equip_ext_info{}.
%%	%%特殊套装要先获得指定属性
%%	#equipmentCfg{
%%		qualityType = Type,
%%		class = Class
%%	} = getCfg:getCfgPStack(cfg_equipment, EquipID),
%%	{FrontNum, AfterNum} = selectAffixGroup(EquipID, Quality, Type),%%获得前后缀里的几前几后{1,2,0.5}->{1,2}
%%	EquipAffixClass = getEquipAffixClass(Class),
%%	[SpecialPropAffixes, ExcludedData] = getEspecialEquipUProperty(EquipID, EquipAffixClass),
%%	{ResultFrontAffixes, ResultAfterAffixes} = makeEquipAffixes(SpecialPropAffixes, FrontNum, AfterNum, EquipID, ExcludedData, EquipAffixClass),%%获得前后属性列表{[{},{}...],[{},{}...]}
%%	ResultEquipAffixes = ResultFrontAffixes ++ ResultAfterAffixes,%%[{},{},{},{}...]
%%	#rec_equip_ext_info{
%%		equipUID = EquipUID,
%%		propKey1 = getEquipAffiexKey(ResultEquipAffixes, 1),
%%		propAffixe1 = getEquipAffiexID(ResultEquipAffixes, 1),
%%		propValue1 = getEquipExtPropAffixeValue(ResultEquipAffixes, 1),
%%		propRecast1 = getEquipAffiexRecast(ResultEquipAffixes, 1),
%%		calcType1 = getEquipAffiexCalcType(ResultEquipAffixes, 1),
%%		propKey2 = getEquipAffiexKey(ResultEquipAffixes, 2),
%%		propAffixe2 = getEquipAffiexID(ResultEquipAffixes, 2),
%%		propValue2 = getEquipExtPropAffixeValue(ResultEquipAffixes, 2),
%%		propRecast2 = getEquipAffiexRecast(ResultEquipAffixes, 2),
%%		calcType2 = getEquipAffiexCalcType(ResultEquipAffixes, 2),
%%		propKey3 = getEquipAffiexKey(ResultEquipAffixes, 3),
%%		propAffixe3 = getEquipAffiexID(ResultEquipAffixes, 3),
%%		propValue3 = getEquipExtPropAffixeValue(ResultEquipAffixes, 3),
%%		propRecast3 = getEquipAffiexRecast(ResultEquipAffixes, 3),
%%		calcType3 = getEquipAffiexCalcType(ResultEquipAffixes, 3),
%%		propKey4 = getEquipAffiexKey(ResultEquipAffixes, 4),
%%		propAffixe4 = getEquipAffiexID(ResultEquipAffixes, 4),
%%		propValue4 = getEquipExtPropAffixeValue(ResultEquipAffixes, 4),
%%		propRecast4 = getEquipAffiexRecast(ResultEquipAffixes, 4),
%%		calcType4 = getEquipAffiexCalcType(ResultEquipAffixes, 4),
%%		propKey5 = getEquipAffiexKey(ResultEquipAffixes, 5),
%%		propAffixe5 = getEquipAffiexID(ResultEquipAffixes, 5),
%%		propValue5 = getEquipExtPropAffixeValue(ResultEquipAffixes, 5),
%%		propRecast5 = getEquipAffiexRecast(ResultEquipAffixes, 5),
%%		calcType5 = getEquipAffiexCalcType(ResultEquipAffixes, 5),
%%		propKey6 = getEquipAffiexKey(ResultEquipAffixes, 6),
%%		propAffixe6 = getEquipAffiexID(ResultEquipAffixes, 6),
%%		propValue6 = getEquipExtPropAffixeValue(ResultEquipAffixes, 6),
%%		propRecast6 = getEquipAffiexRecast(ResultEquipAffixes, 6),
%%		calcType6 = getEquipAffiexCalcType(ResultEquipAffixes, 6)
%%	}.

%%-spec getEquipAffiexKey(List, Index) -> uint() when
%%	List :: list(), Index :: uint().
%%getEquipAffiexKey(List, Index) ->
%%	Len = erlang:length(List),
%%	case Len == 0 orelse Index > Len of
%%		true ->
%%			?EquipConfigInvalid;
%%		false ->
%%			#equipAffixesCfg{
%%				propType = PropType
%%			} = lists:nth(Index, List),
%%			case PropType < 256 of
%%				true ->
%%					PropType;
%%				_ ->
%%					throw("equipAffixesCfg propType, out of range[0,255]")
%%			end
%%	end.
%%
%%-spec getEquipAffiexID(List, Index) -> uint() when
%%	List :: list(), Index :: uint().
%%getEquipAffiexID(List, Index) ->
%%	Len = erlang:length(List),
%%	case Len == 0 orelse Index > Len of
%%		true ->
%%			?EquipConfigInvalid;
%%		false ->
%%			#equipAffixesCfg{
%%				affixID = AffixID
%%			} = lists:nth(Index, List),
%%			AffixID
%%	end.

%%-spec getEquipAffiexCalcType(List, Index) -> uint() when
%%	List :: list(), Index :: uint().
%%getEquipAffiexCalcType(List, Index) ->
%%	Len = erlang:length(List),
%%	case Len == 0 orelse Index > Len of
%%		true ->
%%			?EquipConfigInvalid;
%%		false ->
%%			#equipAffixesCfg{
%%				mulityOrPlus = CalcType
%%			} = lists:nth(Index, List),
%%			CalcType
%%	end.
%%
%%-spec getEquipAffiexRecast(List, Index) -> uint() when
%%	List :: list(), Index :: uint().
%%getEquipAffiexRecast(List, Index) ->
%%	Len = erlang:length(List),
%%	case Len == 0 orelse Index > Len of
%%		true ->
%%			?EquipPropTypeExtNeverRecast;
%%		false ->
%%			case lists:nth(Index, List) of
%%				#equipAffixesCfg{affixType = ?UniEquipAffixFront} ->
%%					?EquipPropTypeExtNeverRecast;
%%				#equipAffixesCfg{affixType = ?UniEquipAffixAfter} ->
%%					?EquipPropTypeExtNeverRecast;
%%				_ ->
%%					?EquipPropTypeExtNoRecast
%%			end
%%	end.
%%
%%-spec getEquipExtPropAffixeValue(List, Index) -> uint() when
%%	List :: list(), Index :: uint().
%%getEquipExtPropAffixeValue(List, Index) ->
%%	Len = erlang:length(List),
%%	case Len == 0 orelse Index > Len of
%%		true ->
%%			?EquipConfigInvalid;
%%		false ->
%%			#equipAffixesCfg{
%%				dice = Dice,
%%				max2 = Max2,
%%				min = Min
%%			} = lists:nth(Index, List),
%%			randValue(Min, Max2, Dice)
%%	end.

%%防御加成
-spec addDefensiveBonusProp(EnhanceProp, ExtProp) -> #rec_equip_enhance_info{} when
	EnhanceProp :: #rec_equip_enhance_info{}, ExtProp :: #rec_equip_ext_info{}.
addDefensiveBonusProp(#rec_equip_enhance_info{} = EnhanceProp,
	#rec_equip_ext_info{
		propKey1 = PpropKey1, propValue1 = PropValue1,
		propKey2 = PpropKey2, propValue2 = PropValue2,
		propKey3 = PpropKey3, propValue3 = PropValue3,
		propKey4 = PpropKey4, propValue4 = PropValue4,
		propKey5 = PpropKey5, propValue5 = PropValue5,
		propKey6 = PpropKey6, propValue6 = PropValue6
	}) ->
	[IsCanAddDefen, DefenValue] =
		if
			PpropKey1 =:= ?EquipDefensiveBonusID ->
				[true, PropValue1];
			PpropKey2 =:= ?EquipDefensiveBonusID ->
				[true, PropValue2];
			PpropKey3 =:= ?EquipDefensiveBonusID ->
				[true, PropValue3];
			PpropKey4 =:= ?EquipDefensiveBonusID ->
				[true, PropValue4];
			PpropKey5 =:= ?EquipDefensiveBonusID ->
				[true, PropValue5];
			PpropKey6 =:= ?EquipDefensiveBonusID ->
				[true, PropValue6];
			true ->
				[false, 0]
		end,
	Fun = fun(Key, Value) ->
		case lists:member(Key, ?EquipDefenList) of
			true ->
				Value * (1 + DefenValue);
			_ ->
				Value
		end
	      end,

	if
		IsCanAddDefen =:= true ->
			EnhanceProp#rec_equip_enhance_info{
				propValue1 = Fun(EnhanceProp#rec_equip_enhance_info.propKey1, EnhanceProp#rec_equip_enhance_info.propValue1),
				propValue2 = Fun(EnhanceProp#rec_equip_enhance_info.propKey2, EnhanceProp#rec_equip_enhance_info.propValue2),
				propValue3 = Fun(EnhanceProp#rec_equip_enhance_info.propKey3, EnhanceProp#rec_equip_enhance_info.propValue3),
				propValue4 = Fun(EnhanceProp#rec_equip_enhance_info.propKey4, EnhanceProp#rec_equip_enhance_info.propValue4),
				propValue5 = Fun(EnhanceProp#rec_equip_enhance_info.propKey5, EnhanceProp#rec_equip_enhance_info.propValue5)
			};
		true ->
			EnhanceProp
	end.

%%%%根据附加属性产生规则，产生一条附加属性
%%-spec makeEquipAffixes(SpecialAffixes, FrontNum, AfterNum, EquipID, ExcludedData, EquipAffixClass) -> {ResultFrontAffixes, ResultAfterAffixes} when
%%	SpecialAffixes :: list(), FrontNum :: uint(), AfterNum :: uint(), EquipID :: uint(), ResultFrontAffixes :: list(), ResultAfterAffixes :: list(), ExcludedData :: list(), EquipAffixClass :: uint().
%%makeEquipAffixes(SpecialAffixes, FrontNum, AfterNum, EquipID, ExcludedData, EquipAffixClass) ->
%%	{NewFrontAffixes, NewAfterAffixes} = queryContentConditionAffix(EquipID, ExcludedData, EquipAffixClass),%%适合此ID装备的职业，等级，部位的前后装备列表
%%	%%特殊装备的指定属性及前后缀+等级 列表
%%	{SpecialFrontAffixes, SpecialAfterAffixes} = querySpecialAffix(SpecialAffixes),
%%	%%排除特殊装备选中的属性 再进行前后缀选择
%%	ResultFrontAffixes = randGetAffixFromAffixList(0, FrontNum, lists:subtract(NewFrontAffixes, SpecialFrontAffixes), SpecialFrontAffixes),
%%	ResultAfterAffixes = randGetAffixFromAffixList(0, AfterNum, lists:subtract(NewAfterAffixes, SpecialAfterAffixes), SpecialAfterAffixes),
%%	{ResultFrontAffixes, ResultAfterAffixes}.

%%%%从符合条件的词缀列表中，根据权重随机取出最终使用的词缀
%%-spec randGetAffixFromAffixList(MaxNum, MaxNum, AffixList, GetAffixList) -> [#equipAffixesCfg{}, ...]
%%	when MaxNum :: uint(), AffixList :: [#equipAffixesCfg{}], GetAffixList :: [#equipAffixesCfg{}].
%%randGetAffixFromAffixList(_CurMax, _MaxNum, [], GetAffixList) ->
%%	GetAffixList;
%%randGetAffixFromAffixList(MaxNum, MaxNum, _, GetAffixList) ->
%%	GetAffixList;
%%randGetAffixFromAffixList(CurNum, MaxNum, AffixList, GetedAffixList) when MaxNum > CurNum ->
%%	Fun = fun(#equipAffixesCfg{weight = Weight} = Affix, AccIn) ->
%%		[{Weight, Affix} | AccIn]
%%	      end,
%%	WeightList = lists:foldl(Fun, [], AffixList),
%%	#equipAffixesCfg{
%%		iD = ID,
%%		conflict = Conflict
%%	} = Affix = misc:calcOddsByWeightList(WeightList),
%%	case lists:keyfind(ID, #equipAffixesCfg.iD, GetedAffixList) of
%%		false ->
%%			NewAffixList = lists:keydelete(ID, #equipAffixesCfg.iD, AffixList),
%%			case Conflict =/= 0 andalso lists:keyfind(Conflict, #equipAffixesCfg.conflict, GetedAffixList) of
%%				#equipAffixesCfg{} ->
%%					randGetAffixFromAffixList(CurNum, MaxNum, NewAffixList, GetedAffixList);
%%				_ ->
%%					randGetAffixFromAffixList(CurNum + 1, MaxNum, NewAffixList, [Affix | GetedAffixList])
%%			end;
%%		Affix ->
%%			NewAffixList = lists:keydelete(ID, #equipAffixesCfg.iD, AffixList),
%%			randGetAffixFromAffixList(CurNum, MaxNum, NewAffixList, GetedAffixList)
%%	end.
%%
%%%%查询符合条件的词缀列表，分别返回前缀列表和后缀列表
%%-spec queryContentConditionAffix(EquipID, ExcludedData, EquipAffixClass) -> {FrontAffixes, AfterAffixes} when
%%	EquipID :: uint(), ExcludedData :: list(), FrontAffixes :: list(), AfterAffixes :: list(), EquipAffixClass :: uint().
%%queryContentConditionAffix(EquipID, ExcludedData, EquipAffixClass) ->
%%	case getCfg:getCfgPStack(cfg_equipment, EquipID) of
%%		#equipmentCfg{type = Type, itemLevel = CfgItemLevel, qualityType = QualityType} ->
%%			Fun = fun({Key1, Key2}, {FrontAffixes, AfterAffixes}) ->
%%				CfgAffix = getCfg:getCfgPStack(cfg_equipAffixes, Key1, Key2),  %%附加属性配置数据项
%%				case CfgAffix of
%%					#equipAffixesCfg{affixID = AffixID,
%%						affixType = AffixType,
%%						itemLevel = ItemLevel,
%%						equipType = EquipType,
%%						equipClass = EquipClass,
%%						weight = Weight} ->
%%						case Weight =:= 0 orelse (lists:member(AffixID, ExcludedData) =:= true) of
%%							false ->
%%								CheckEquipType = checkEquipPart(Type, EquipType),  %%检查装备部位
%%								CheckEquipClass = checkEquipClass(EquipAffixClass, EquipClass), %%检查适用职业
%%								if
%%									CfgItemLevel >= ItemLevel andalso CheckEquipType =:= true
%%										andalso CheckEquipClass =:= true ->
%%										if
%%											QualityType =:= ?EquipTypeNormal andalso AffixType =:= ?EquipAffixFront ->  %%普通装备前缀词缀
%%												{addMaxItemLevelToAffixList(CfgAffix, FrontAffixes), AfterAffixes};
%%											QualityType =:= ?EquipTypeNormal andalso AffixType =:= ?EquipAffixAfter ->  %%普通装备后缀词缀
%%												{FrontAffixes, addMaxItemLevelToAffixList(CfgAffix, AfterAffixes)};
%%											QualityType > ?EquipTypeNormal andalso AffixType =:= ?SpeEquipAffixFront ->  %%特殊装备前缀词缀
%%												{addMaxItemLevelToAffixList(CfgAffix, FrontAffixes), AfterAffixes};
%%											QualityType > ?EquipTypeNormal andalso AffixType =:= ?SpeEquipAffixAfter -> %%特殊装备后缀词缀
%%												{FrontAffixes, addMaxItemLevelToAffixList(CfgAffix, AfterAffixes)};
%%											true ->
%%												{FrontAffixes, AfterAffixes}
%%										end;
%%									true ->
%%										{FrontAffixes, AfterAffixes}
%%								end;
%%							true ->
%%								{FrontAffixes, AfterAffixes}
%%						end;
%%					_ ->
%%						{FrontAffixes, AfterAffixes}
%%				end
%%			      end,
%%			lists:foldl(Fun, {[], []}, getCfg:getKeyList(cfg_equipAffixes));%%符合部位、职业、同ID itemLevel最大等规则的前后缀属性列表
%%		_ ->
%%			{[], []}
%%	end.

%%%%特殊装备指定属性
%%-spec querySpecialAffix(SpecialAffixes :: list()) -> {list(), list()}.
%%querySpecialAffix([]) ->
%%	{[], []};
%%querySpecialAffix(SpecialAffixes) ->
%%	Fun = fun(CfgAffix, {FrontAffixes, AfterAffixes}) ->
%%		case CfgAffix of
%%			#equipAffixesCfg{affixType = ?SpeEquipAffixFront} ->
%%				{addMaxItemLevelToAffixList(CfgAffix, FrontAffixes), AfterAffixes};
%%			#equipAffixesCfg{affixType = ?UniEquipAffixFront} ->
%%				{addMaxItemLevelToAffixList(CfgAffix, FrontAffixes), AfterAffixes};
%%			#equipAffixesCfg{affixType = ?SpeEquipAffixAfter} ->
%%				{FrontAffixes, addMaxItemLevelToAffixList(CfgAffix, AfterAffixes)};
%%			#equipAffixesCfg{affixType = ?UniEquipAffixAfter} ->
%%				{FrontAffixes, addMaxItemLevelToAffixList(CfgAffix, AfterAffixes)};
%%			_ ->
%%				{FrontAffixes, AfterAffixes}
%%		end
%%	      end,
%%	lists:foldl(Fun, {[], []}, SpecialAffixes).
%%
%%%%用于套装装备属性选取，将ID相同的附加属性，ItemLevel最大的项增加到列表中
%%-spec addMaxItemLevelToAffixList(CfgAffix, AffixList) -> [#equipAffixesCfg{}] when CfgAffix :: #equipAffixesCfg{},
%%	AffixList :: [#equipAffixesCfg{}].
%%addMaxItemLevelToAffixList(CfgAffix, AffixList) when erlang:is_list(AffixList) ->
%%	case lists:keyfind(CfgAffix#equipAffixesCfg.iD, #equipAffixesCfg.iD, AffixList) of
%%		false ->
%%			case lists:keyfind(CfgAffix#equipAffixesCfg.affixID, #equipAffixesCfg.affixID, AffixList) of
%%				false ->
%%					lists:keystore(CfgAffix#equipAffixesCfg.affixID, #equipAffixesCfg.affixID, AffixList, CfgAffix);
%%				#equipAffixesCfg{iD = ID, itemLevel = ItemLevel} when CfgAffix#equipAffixesCfg.itemLevel > ItemLevel ->
%%					NewAffixList = lists:keydelete(ID, #equipAffixesCfg.iD, AffixList),
%%					lists:keystore(CfgAffix#equipAffixesCfg.affixID, #equipAffixesCfg.affixID, NewAffixList, CfgAffix);
%%				_ ->
%%					AffixList
%%			end;
%%		_ ->
%%			AffixList
%%	end.

%%%%检查装备职业
%%-spec checkEquipClass(EquipClass, AffixClass) -> boolean()
%%	when EquipClass :: uint(), AffixClass :: [uint(), ...].
%%checkEquipClass(EquipClass, AffixClass) when is_list(AffixClass) ->
%%	AllClass = lists:nth(1, AffixClass),
%%	case AllClass =:= ?EquipAffixClassAll of
%%		true ->
%%			true;
%%		false ->
%%			lists:member(EquipClass, AffixClass)  %%装备适用职业在职业配置列表中
%%	end;
%%checkEquipClass(_, AffixClass) when AffixClass =:= ?EquipAffixClassAll ->
%%	true;
%%checkEquipClass(_, _) ->
%%	false.

%%检查默认装备职业
checkDefaultEquipClass(PlayerClass, EquipClass) when is_list(EquipClass) ->
	lists:member(PlayerClass, EquipClass);
checkDefaultEquipClass(PlayerClass, EquipClass) when EquipClass =:= PlayerClass orelse EquipClass =:= 0 ->
	true;
checkDefaultEquipClass(_, _) ->
	false.

%%%%检查装备部位
%%-spec checkEquipPart(EquipPart, AffixPart) -> boolean() when EquipPart :: uint(), AffixPart :: [uint(), ...] | uint().
%%checkEquipPart(EquipPart, AffixPart) when is_list(AffixPart) ->
%%	lists:member(EquipPart, AffixPart);
%%checkEquipPart(_EquipPart, AffixPart) when AffixPart =:= ?EquipAffixPartAll ->
%%	true;
%%checkEquipPart(_, _) ->
%%	false.

%%扣除道具
-spec delItem(ItemList :: list(), Reason :: uint()) -> ok.
delItem([], _) ->
	ok;
delItem([{ID, Num} | List], Reason) ->
	case erlang:is_integer(ID) andalso ID > 0 andalso erlang:is_integer(Num) andalso Num > 0 of
		true ->
			Plog = #recPLogTSItem{
				old = Num,
				new = 0,
				change = -Num,
				target = ?PLogTS_Item,
				source = ?PLogTS_PlayerSelf,
				gold = 0,
				goldtype = 0,
				changReason = Reason,
				reasonParam = 0
			},
			playerPackage:delGoodsByID(?Item_Location_Bag, ID, Num, Plog);
		_ ->
			skip
	end,
	delItem(List, Reason).
%%
%%%%根据装备颜色分类、出现几率来产生选中的词缀组合
%%-spec selectAffixGroup(EquipID, EquipAffixColorType, Type) -> {FrontNum, AfterNum}
%%	when EquipID :: uint(), EquipAffixColorType :: uint(), Type :: uint(), FrontNum :: uint(), AfterNum :: uint().
%%selectAffixGroup(EquipID, EquipAffixColorType, Type) ->
%%	AffixSplitList =
%%		case EquipAffixColorType of
%%			?EquipColorTypeGreen ->
%%				convertEquipAffixConfig(?EquipAffixGreenRow);%%前后缀列表及权重
%%			?EquipColorTypeBlue ->
%%				convertEquipAffixConfig(?EquipAffixBlueRow);
%%			?EquipColorTypePurple ->
%%				case Type of
%%					?EquipTypeNormal ->
%%						convertEquipAffixConfig(?EquipAffixPurpleRow);
%%					_ ->
%%						RandCount = getEspecialEquipAffixType(EquipID),
%%						case RandCount > 0 of
%%							true ->
%%								convertEquipAffixConfig(lists:nth(RandCount, ?EquipAffixOraRedAllRow));
%%							_ ->
%%								[]
%%						end
%%				end;
%%			?EquipColorTypeOrange ->
%%				RandCount = getEspecialEquipAffixType(EquipID),
%%				case RandCount > 0 of
%%					true ->
%%						convertEquipAffixConfig(lists:nth(RandCount, ?EquipAffixOraRedAllRow));
%%					_ ->
%%						[]
%%				end;
%%			?EquipColorTypeRed ->
%%				RandCount = getEspecialEquipAffixType(EquipID),
%%				case RandCount > 0 of
%%					true ->
%%						convertEquipAffixConfig(lists:nth(RandCount, ?EquipAffixOraRedAllRow));
%%					_ ->
%%						[]
%%				end
%%		end,
%%
%%	if
%%		length(AffixSplitList) > 0 ->
%%			computeRatio(AffixSplitList);%%获得前后缀里的几前几后{1,2,0.5}->{1,2}
%%		true ->
%%			{0, 0}
%%	end.

%%%%获取套装和独特装生前指定属性
%%getEspecialEquipUProperty(EquipID, EquipAffixClass) ->
%%	case getCfg:getCfgPStack(cfg_equipment, EquipID) of
%%		#equipmentCfg{uniqTierID = UniqTierID, itemLevel = CfgItemLevel} ->
%%			case UniqTierID =:= undefined orelse UniqTierID =:= 0 of
%%				true ->
%%					[[], []];
%%				_ ->
%%					case getCfg:getCfgPStack(cfg_uniqTierProperty, UniqTierID) of
%%						#uniqTierPropertyCfg{uniqAffix = UniqAffix} ->
%%							%%在列表中每个元组里去挑选适合的属性ID列
%%							Fun = fun(AffixIDList, [AffixRet, ExcludedDataRet]) ->
%%								Fun1 = fun({Key1, Key2}, [AffixRet1, AffixRet2]) ->
%%									AffixesCfg = getCfg:getCfgPStack(cfg_equipAffixes, Key1, Key2),
%%									#equipAffixesCfg{affixID = AffixID, equipClass = EquipClass, itemLevel = ItemLevel} = AffixesCfg,
%%									%%排除不一样的ID，选择适合等级的Affix xujian
%%									case CfgItemLevel >= ItemLevel andalso lists:member(AffixID, AffixIDList) of
%%										true ->
%%											%%选择适合的职业
%%											case lists:member(EquipAffixClass, EquipClass) orelse EquipClass =:= [0] of
%%												true ->
%%
%%													[[AffixesCfg | AffixRet1], AffixRet2];
%%												false ->
%%													[AffixRet1, [AffixesCfg | AffixRet2]]
%%											end;
%%										false ->
%%											[AffixRet1, AffixRet2]
%%									end
%%								       end,
%%								case lists:foldl(Fun1, [[], []], getCfg:getKeyList(cfg_equipAffixes)) of
%%									[[], NewAffixRet2] ->
%%										%%先随机一个，再把所有合适的找出来
%%										#equipAffixesCfg{affixID = AffixID2_nth} = lists:nth(random:uniform(erlang:length(NewAffixRet2)), NewAffixRet2),
%%										Fun2 = fun(#equipAffixesCfg{affixID = AffixID2} = AffixCfg2, Ret2) ->
%%											case AffixID2_nth =:= AffixID2 of
%%												true ->
%%													[AffixCfg2 | Ret2];
%%												false ->
%%													Ret2
%%											end
%%										       end,
%%										LastAffixRet2 = lists:foldl(Fun2, [], NewAffixRet2),
%%										[lists:append(LastAffixRet2, AffixRet), [ExcludedDataRet | AffixIDList]];%%[NewAffixRet2 | AffixRet];	%%没找到同职业的，随机选一个
%%									[NewAffixRet3, _] ->
%%										#equipAffixesCfg{affixID = AffixID3_nth} = lists:nth(random:uniform(erlang:length(NewAffixRet3)), NewAffixRet3),
%%										Fun3 = fun(#equipAffixesCfg{affixID = AffixID3} = AffixCfg3, Ret3) ->
%%											case AffixID3_nth =:= AffixID3 of
%%												true ->
%%													[AffixCfg3 | Ret3];
%%												false ->
%%													Ret3
%%											end
%%										       end,
%%										LastAffixRet3 = lists:foldl(Fun3, [], NewAffixRet3),
%%										[lists:append(LastAffixRet3, AffixRet), [ExcludedDataRet | AffixIDList]]%%[NewAffixRet1 | AffixRet]	%%有同职业的，其它的全部不要，在同职业中做随机
%%								end
%%							      end,
%%							lists:foldl(Fun, [[], []], UniqAffix);
%%						_ ->
%%							[[], []]
%%					end
%%			end;
%%		_ ->
%%			[[], []]
%%	end.

%%%%获取套装和独特装备的词缀组合类型
%%getEspecialEquipAffixType(EquipID) ->
%%	case getCfg:getCfgPStack(cfg_equipment, EquipID) of
%%		#equipmentCfg{exUniqAffix = [Min, Max]} ->
%%			misc:rand(Min, Max);
%%		_ ->
%%			1
%%	end.

%%%%读取配置表数据进行转换处理
%%-spec convertEquipAffixConfig(EquipAffixRowID) -> [#recAffixSplit{}, ...] | [] when EquipAffixRowID :: atom().
%%convertEquipAffixConfig(EquipAffixRowID) ->
%%	GlobalsetupCfg = getCfg:getCfgPStack(cfg_globalsetup, EquipAffixRowID),
%%	case GlobalsetupCfg of
%%		#globalsetupCfg{setpara = SetParaList} when erlang:is_list(SetParaList) ->
%%			NewSetParaList = SetParaList, %%misc:string_to_term(SetParaList),
%%			Fun = fun(AffixTuple, AffixSplits) ->
%%				AffixSplit = #recAffixSplit{
%%					frontNum = element(1, AffixTuple),
%%					afterNum = element(2, AffixTuple),
%%					ratio = element(3, AffixTuple)
%%				},
%%				[AffixSplit | AffixSplits]
%%			      end,
%%			lists:foldl(Fun, [], NewSetParaList);
%%		_ ->
%%			[]
%%	end.

%%%%根据词缀出现概率计算出使用的词缀组合
%%-spec computeRatio(AffixSplitList) -> {FrontNum, AfterNum}
%%	when AffixSplitList :: [#recAffixSplit{}], FrontNum :: uint(), AfterNum :: uint().
%%computeRatio(AffixSplitList) ->
%%	Fun = fun(#recAffixSplit{ratio = Odds} = Split, AccIn) when erlang:is_integer(Odds) -> %%取出配置里的此颜色的出现概率列表
%%		[{Odds, Split} | AccIn]
%%	      end,
%%	RatioList = lists:foldl(Fun, [], AffixSplitList),
%%	#recAffixSplit{frontNum = FN, afterNum = AN} = misc:calcOddsByWeightList(RatioList),
%%	{FN, AN}.

-spec getBodyEquipByBonusID(QueryTierBonusID) -> Count when
	QueryTierBonusID :: uint(), Count :: uint().
getBodyEquipByBonusID(QueryTierBonusID) ->
	Fun = fun(#recSaveEquip{itemID = EquipID, quality = Quality}, Count) ->
		case Quality =:= ?EquipColorTypeRed of
			true ->
				case getCfg:getCfgPStack(cfg_equipment, EquipID) of
					#equipmentCfg{tierBonusID = TierBonusID} ->
						case QueryTierBonusID =:= TierBonusID of
							true ->
								Count + 1;
							false ->
								Count
						end;
					_ ->
						Count
				end;
			false ->
				Count
		end
	      end,
	lists:foldl(Fun, 0, playerState:getPackage(?Item_Location_BodyEquipBag)).

%%套装战斗属性的改变
-spec equipSuitAward2(Type, TierID, Count, IsNotify) -> ok
	when Type :: atom(), Count :: uint(), TierID :: uint(), IsNotify :: boolean().
equipSuitAward2(Type, TierID, Count, IsNotify) ->
	TierBonus = getCfg:getCfgPStack(cfg_tierBonus, TierID, Count),
	case TierBonus of
		#tierBonusCfg{
			propType1 = PropType1, %%奖励类型1
			value1 = PropValue1,
			mulityOrPlus1 = MulityOrPlus1,
			propType2 = PropType2,
			value2 = PropValue2,
			mulityOrPlus2 = MulityOrPlus2,
			propType3 = PropType3,
			value3 = PropValue3,
			mulityOrPlus3 = MulityOrPlus3,
			propType4 = PropType4,
			value4 = PropValue4,
			mulityOrPlus4 = MulityOrPlus4
		} ->
			ExtProp = [{PropType1, PropValue1, MulityOrPlus1}, {PropType2, PropValue2, MulityOrPlus2},
				{PropType3, PropValue3, MulityOrPlus3}, {PropType4, PropValue4, MulityOrPlus4}],
			case Type of
				equipOn ->
					playerCalcProp:changeProp_CalcType(ExtProp, ?EquipOn, IsNotify);
				equipOff ->
					playerCalcProp:changeProp_CalcType(ExtProp, ?EquipOff, IsNotify)
			end
	end,
	ok.


%%根据配置名从配置表中取出配置值
-spec getConfigValueByName(RowName) -> term() when RowName :: atom().
getConfigValueByName(RowName) ->
	GlobalsetupCfg = getCfg:getCfgPStack(cfg_globalsetup, RowName),
	case GlobalsetupCfg of
		#globalsetupCfg{setpara = []} ->
			?EquipConfigInvalid;
		#globalsetupCfg{setpara = Value} when erlang:is_list(Value) andalso erlang:length(Value) > 0 ->
			lists:nth(1, Value);
		_ ->
			?EquipConfigInvalid
	end.

%%根据配置名从配置表中取出配置值
-spec getConfigValueByNameGroup(RowName, No) -> term() when RowName :: string(), No :: int().
getConfigValueByNameGroup(RowName, No) ->
	RowID = RowName ++ erlang:integer_to_list(No),
	AtomRowID = misc:string_to_term(RowID),
	GlobalsetupCfg = getCfg:getCfgPStack(cfg_globalsetup, AtomRowID),
	case GlobalsetupCfg of
		#globalsetupCfg{setpara = []} ->
			?EquipConfigInvalid;
		#globalsetupCfg{setpara = Value} when erlang:is_list(Value) andalso erlang:length(Value) > 0 ->
			lists:nth(1, Value);
		_ ->
			?EquipConfigInvalid
	end.

%%从装备基础价格表取出对应装备的基础价格
-spec getEquipBasePrice(ItemLevel) -> float() when ItemLevel :: uint().
getEquipBasePrice(ItemLevel) ->
	case getCfg:getCfgPStack(cfg_eq_charge, ItemLevel) of
		#eq_chargeCfg{eq_charge = Charge} ->
			float(Charge);
		_ ->
			0.0
	end.

%%获取装备分解的等级资源配置值
-spec getEquipSourceValue(EquipID) -> uint() when EquipID :: uint().
getEquipSourceValue(EquipID) ->
	case getCfg:getCfgPStack(cfg_equipment, EquipID) of
		#equipmentCfg{itemLevel = ItemLevel} ->
			case getCfg:getCfgPStack(cfg_eq_charge, ItemLevel) of
				#eq_chargeCfg{source1 = Source1} ->
					Source1;
				_ ->
					0
			end;
		_ ->
			0
	end.

%%获取品质价格权重值
-spec getQualityPriceWeight(Quality) -> uint() when Quality :: uint().
getQualityPriceWeight(Quality) ->
	%%品质体格权重
	case Quality of
		?EquipColorTypeWhite ->
			getConfigValueByName(charge_white);
		?EquipColorTypeGreen ->
			getConfigValueByName(charge_green);
		?EquipColorTypeBlue ->
			getConfigValueByName(charge_blue);
		?EquipColorTypePurple ->
			getConfigValueByName(charge_purple);
		?EquipColorTypeOrange ->
			getConfigValueByName(charge_orange);
		?EquipColorTypeRed ->
			getConfigValueByName(charge_red);
		_ ->
			0
	end.

%%%%获取资源品质权重
%%-spec getSourceQualityWeight(Quality) -> {uint(), uint()} when Quality::uint().
%%getSourceQualityWeight(Quality) ->
%%	%%资源品质权重
%%	case Quality of
%%		?EquipColorTypeWhite ->
%%			QualityPriceWeight1 = getConfigValueByName(source1_white),
%%			QualityPriceWeight2 = getConfigValueByName(source2_white);
%%		?EquipColorTypeGreen ->
%%			QualityPriceWeight1 = getConfigValueByName(source1_green),
%%			QualityPriceWeight2 = getConfigValueByName(source2_green);
%%		?EquipColorTypeBlue ->
%%			QualityPriceWeight1 = getConfigValueByName(source1_blue),
%%			QualityPriceWeight2 = getConfigValueByName(source2_blue);
%%		?EquipColorTypePurple ->
%%			QualityPriceWeight1 = getConfigValueByName(source1_purple),
%%			QualityPriceWeight2 = getConfigValueByName(source2_purple);
%%		?EquipColorTypeOrange ->
%%			QualityPriceWeight1 = getConfigValueByName(source1_orange),
%%			QualityPriceWeight2 = getConfigValueByName(source2_orange);
%%		?EquipColorTypeRed ->
%%			QualityPriceWeight1 = getConfigValueByName(source1_red),
%%			QualityPriceWeight2 = getConfigValueByName(source2_red);
%%		_ ->
%%			QualityPriceWeight1 = 0,
%%			QualityPriceWeight2 = 0
%%	end,
%%	{QualityPriceWeight1, QualityPriceWeight2}.

%%根据品质得到装备的加成系数
-spec getEquipQuailtyRatio(Quality) -> uint() when Quality :: equipQuality().
getEquipQuailtyRatio(Quality) ->
	if
		Quality =:= ?EquipColorTypeWhite ->
			getConfigValueByName(?EquipQualityRatioWhite);
		Quality =:= ?EquipColorTypeGreen ->
			getConfigValueByName(?EquipQualityRatioGreen);
		Quality =:= ?EquipColorTypeBlue ->
			getConfigValueByName(?EquipQualityRatioBlue);
		Quality =:= ?EquipColorTypePurple ->
			getConfigValueByName(?EquipQualityRatioPurple);
		Quality =:= ?EquipColorTypeOrange ->
			getConfigValueByName(?EquipQualityRatioOrange);
		Quality =:= ?EquipColorTypeRed ->
			getConfigValueByName(?EquipQualityRatioRed);
		true ->
			?EquipConfigInvalid
	end.

%%初始化角色默认装备
-spec initEquip(CareerID, EquipID) -> ok when
	CareerID :: career(), EquipID :: itemId().
initEquip(CareerID, EquipID) ->
	#equipmentCfg{iD = EquipID, class = EquipClass, type = Type, atkDelay = AtkDelay} = getCfg:getCfgPStack(cfg_equipment, EquipID),
	case checkDefaultEquipClass(CareerID, EquipClass) of
		true ->
			BagType = ?Item_Location_BodyEquipBag,
			Equip = makeEquip(EquipID, ?EquipColorTypeWhite, BagType, true), %%修改战斗属性
			PLog = #recPLogTSItem{
				old = 0,
				new = 1,
				change = 1,
				target = ?PLogTS_PlayerSelf,
				source = ?PLogTS_System,
				gold = 0,
				goldtype = 0,
				changReason = ?ItemSourceIntenal,
				reasonParam = CareerID
			},
			playerPackage:addGoodsInstance(Equip, PLog),
			equipChangeProp(Equip, ?EquipOn, true),
			case Type of
				?EquipTypeWeapon ->
					playerState:setAttackIntervalTime(AtkDelay);
				_ ->
					skip
			end;
		false ->
			skip
	end,
	ok.

%%检查此装备是否对远程玩家可见
-spec checkIsVisible(EquipID) -> boolean() when EquipID :: uint().
checkIsVisible(EquipID) ->
	case getCfg:getCfgPStack(cfg_equipment, EquipID) of
		#equipmentCfg{type = Type} ->
			lists:member(Type, ?EquipTypeVisibleOfOtherPlayer);
		_ ->
			false
	end.

%%向周围玩家广播穿上的可见装备
-spec visibleEquipOnBroadcast(EquipID, Quality) -> ok when EquipID :: uint(), Quality :: uint().
visibleEquipOnBroadcast(EquipID, Quality) ->
	case checkIsVisible(EquipID) of
		true ->
			sendVisibleEquipOnMessage(EquipID, Quality);
		false ->
			skip
	end,
	ok.

%%向周围玩家广播脱下的可见装备
-spec visibleEquipOffBroadcast(EquipID, Type) -> ok when EquipID :: uint(), Type :: uint().
visibleEquipOffBroadcast(EquipID, Type) ->
	case checkIsVisible(EquipID) of
		true ->
			sendVisibleEquipOffMessage(Type);
		false ->
			skip
	end,
	ok.

%%%%根据UID找到装备
%%-spec getEquipByUID(EquipUID) -> {BagType, RetEquip} when
%%	EquipUID :: uint(), BagType :: bagType(), RetEquip :: undefined | #recSaveEquip{}.
%%getEquipByUID(EquipUID) ->
%%	Equip = playerPackage:getGoodsByUID(EquipUID, ?Item_Location_BodyEquipBag),
%%	case Equip of
%%		#recSaveEquip{} ->
%%			{?Item_Location_BodyEquipBag, Equip};
%%		_ ->
%%			NewEquip = playerPackage:getGoodsByUID(EquipUID, ?Item_Location_Equip_Bag),
%%			case NewEquip of
%%				#recSaveEquip{} ->
%%					{?Item_Location_Equip_Bag, NewEquip};
%%				_ ->
%%					{?Item_Location_Equip_Bag, undefined}
%%			end
%%	end.

%%根据部位找身上装备
-spec getEquipByType(Type) -> #recSaveEquip{} when
	Type :: uint().
getEquipByType(Type) ->
	Bag = playerState:getPackage(?Item_Location_BodyEquipBag),
	getEquipByType(Type, Bag).

getEquipByType(_Type, []) ->
	false;
getEquipByType(Type, [Equip | BagList]) ->
	{EquipType, _} = getEquipType(Equip#recSaveEquip.itemID),
	case EquipType =:= Type of
		true ->
			{true, Equip};
		_ ->
			getEquipByType(Type, BagList)
	end.

%%装备分解为代币,返回紫色精华和金色精华值
%%紫色精华 = 分解资源1=等级资源1基础值*资源1品质权重*随机值
%%金色精华 = 分解资源2=等级资源2基础值*资源2品质权重*随机值
%%分解价格 = 等级基础价格*部位价格权重*品质价格权重*destroyoff*global_out
-spec equipResolveProcess(Equip) -> ok | [] when Equip :: #recSaveEquip{}.
equipResolveProcess(#recSaveEquip{itemID = EquipID, itemUID = EquipUID, quality = Quality}) ->
%%	case Quality >= ?EquipColorTypeBlue of
	case Quality >= ?EquipColorTypeWhite of
		true ->
%%			SourecMin = getConfigValueByName(source_min),
%%			SourecMax = getConfigValueByName(source_max),
			%%在配置的最小值和最大值之间取随机float值，配置的最大值是1
%%			RandValue = misc:rand(SourecMin * 10, SourecMax * 10) / 10,
			Source1 = getEquipSourceValue(EquipID),  %%等级资源基础值
			%%取装备的部位价格权重和等级基础价格
			case getCfg:getCfgPStack(cfg_equipment, EquipID) of
				#equipmentCfg{itemLevel = ItemLevel} ->
%%					PartPriceWeight = getConfigValueByNameGroup("part", Type), %%部位价格权重
					LevelBasePrice = getEquipBasePrice(ItemLevel);   %%等级基础价格
				_ ->
%%					PartPriceWeight = 0,
					LevelBasePrice = 0
			end,
%%			DestroyOff = getConfigValueByName(destroyoff),
%%			GlobalOut = getConfigValueByName(global_out),
%%			QualityPriceWeight = getQualityPriceWeight(Quality), %%品质价格权重
			%%分解价格=	等级基础价格*部位价格权重*品质价格权重*destroyoff*global_out
			ResolvePrice = erlang:trunc(LevelBasePrice),%%erlang:round(LevelBasePrice * PartPriceWeight * QualityPriceWeight * DestroyOff * GlobalOut),
			GoldIsEnough = playerMoney:canUseCoin(?CoinUseTypeGold, ResolvePrice),  %%玩家当前的剩余金币是否足够
			case GoldIsEnough of  %%判断玩家的金币是否足够
				true ->
					%%从装备背包里删除已分解的装备
					playerPackage:deleteGoodsByUID(?Item_Location_Equip_Bag, EquipUID,
						#recPLogTSItem{
							old = 1,
							new = 0,
							change = -1,
							target = ?PLogTS_EquipResolve,
							source = ?PLogTS_PlayerSelf,
							gold = 0,
							goldtype = 0,
							changReason = ?ItemDeleteReasonResolve,
							reasonParam = 0
						}),
					%%装备分解完成后扣除金币
					true = playerMoney:useCoin(?CoinUseTypeGold, ResolvePrice,
						#recPLogTSMoney{
							reason = ?CoinSourceEquipResolve,
							param = EquipUID,
							target = ?PLogTS_EquipResolve,
							source = ?PLogTS_PlayerSelf
						}),

%%					{QualityPriceWeight1, QualityPriceWeight2} = getSourceQualityWeight(Quality),
					ChangePurpleEssence = Source1, %%erlang:round(Source1 * QualityPriceWeight1 * RandValue),
%%					ChangeGoldenEssence = Source2, %%erlang:round(Source2 * QualityPriceWeight2 * RandValue),

					%% 获得爵位加成
%%					New_ChangePurpleEssence = playerVipInter:getDecomposeItem(ChangePurpleEssence),
%%					New_ChangeGoldenEssence = playerVipInter:getDecomposeItem(ChangeGoldenEssence),
					playerMoney:addCoin(?CoinTypePurpleEssence, ChangePurpleEssence,
						#recPLogTSMoney{
							reason = ?CoinSourceEquipResolve,
							param = EquipUID,
							target = ?PLogTS_PlayerSelf,
							source = ?PLogTS_EquipResolve
						}),%%更新玩家的紫色精华

%%					playerMoney:addCoin(?CoinTypeGoldenEssence, New_ChangeGoldenEssence,
%%						#recPLogTSMoney{
%%							reason = ?CoinSourceEquipResolve,
%%							param = EquipUID,
%%							target = ?PLogTS_PlayerSelf,
%%							source = ?PLogTS_EquipResolve
%%						}),%%更新玩家的金色精华

					[ChangePurpleEssence, 0];
				%%playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipResolveSuccess);
				false ->
					ok
			end;
		_ ->
			ok
	end.

%%返回玩家身上的装备信息，供战斗模块检测校验使用
-spec getPlayerEquip() -> []|[#recEquipEnhance{}, ...].
getPlayerEquip() ->
	Bag = playerState:getPackage(?Item_Location_BodyEquipBag),
	Fun = fun(Equip, EquipList) ->
		case Equip of
			#recSaveEquip{itemID = EquipID, enhanceProp = EnhanceProp, extProp = ExtProp} ->
				{Type, SubType} = getEquipType(EquipID),
				EquipEnhance = #recEquipEnhance{
					id = EquipID,
					type = Type,
					subType = SubType,
					enhanceProp = EnhanceProp,
					extProp = ExtProp
				},
				[EquipEnhance | EquipList];
			_ ->
				EquipList
		end
	      end,
	lists:foldl(Fun, [], Bag).

%%获取装备的类型/部位和子类型,返回-1时配置有问题
-spec getEquipType(EquipID) -> {int(), int()} when EquipID :: uint().
getEquipType(EquipID) ->
	case getCfg:getCfgPStack(cfg_equipment, EquipID) of
		#equipmentCfg{type = Type, subType = SubType} ->
			{Type, SubType};
		_ ->
			{-1, -1}
	end.

%%装备的原始价格
%%装备原始价格 = 等级基础价格*部位价格权重*品质价格权重
-spec equipSourcePrice(Equip) -> uint() when Equip :: #recSaveEquip{}.
equipSourcePrice(#recSaveEquip{itemID = EquipID, quality = Quality}) ->
	case getCfg:getCfgPStack(cfg_equipment, EquipID) of
		#equipmentCfg{type = Type, itemLevel = ItemLevel} ->
			PartPriceWeight = getConfigValueByNameGroup("part", Type), %%部位价格权重
			LevelBasePrice = getEquipBasePrice(ItemLevel);   %%等级基础价格
		_ ->
			PartPriceWeight = 0,
			LevelBasePrice = 0.0
	end,
	QualityPriceWeight = getQualityPriceWeight(Quality),
	EquipSourcePrice = LevelBasePrice * PartPriceWeight * QualityPriceWeight,
	erlang:round(EquipSourcePrice);
equipSourcePrice(_) ->
	0.

%%发送可见装备穿上广播消息
-spec sendVisibleEquipOnMessage(EquipID, Quality) -> ok when EquipID :: uint(), Quality :: uint().
sendVisibleEquipOnMessage(EquipID, Quality) ->
	VisibleEquip = #pk_visibleEquip{
		equipID = EquipID,
		quality = Quality
	},
	playerMsg:sendMsgToNearPlayer(#pk_GS2U_BroadcastVisibleEquipOn{
		equip = VisibleEquip,
		code = playerState:getPlayerCode()
	}, true),
	ok.

%%发送可见装备卸下广播消息
-spec sendVisibleEquipOffMessage(Type) -> ok when Type :: uint().
sendVisibleEquipOffMessage(Type) ->
	playerMsg:sendMsgToNearPlayer(#pk_GS2U_BroadcastVisibleEquipOff{
		type = Type,
		code = playerState:getPlayerCode()
	}, true),
	ok.

-spec equipChangeProp(Equip :: #recSaveEquip{}, Operate :: ?EquipOn | ?EquipOff, IsNotify :: boolean()) -> ok.
equipChangeProp(#recSaveEquip{
	itemID = ItemID,
	quality = Quality,
	extProp = ExtProp,
	baseProp = BaseProp,
	enhanceProp = EnhanceProp
}, Operate, IsNotify) ->
	playerState:setEquips(getPlayerEquip()),
	#rec_equip_ext_info{
		propKey1 = ExtPropKey1,
		propValue1 = ExtPropValue1,
		calcType1 = ExtCalcType1,
		propKey2 = ExtPropKey2,
		propValue2 = ExtPropValue2,
		calcType2 = ExtCalcType2,
		propKey3 = ExtPropKey3,
		propValue3 = ExtPropValue3,
		calcType3 = ExtCalcType3,
		propKey4 = ExtPropKey4,
		propValue4 = ExtPropValue4,
		calcType4 = ExtCalcType4,
		propKey5 = ExtPropKey5,
		propValue5 = ExtPropValue5,
		calcType5 = ExtCalcType5,
		propKey6 = ExtPropKey6,
		propValue6 = ExtPropValue6,
		calcType6 = ExtCalcType6
	} = ExtProp,
	case getCfg:getCfgPStack(cfg_equipment, ItemID) of
		#equipmentCfg{type = Type} ->
			PosLevel = getPosStarLevel(Type, playerState:getEquipStarList()),
			Mult =
				case getCfg:getCfgByArgs(cfg_equipstar, PosLevel) of
					#equipstarCfg{ratio = Ratio} ->
						Ratio;
					_ ->
						0
				end,
			QuaRatio = getEquipQuailtyRatio(Quality),
			#rec_equip_base_info{
				propValue1 = BasePropValue1,
				propValue2 = BasePropValue2,
				propValue3 = BasePropValue3,
				propValue4 = BasePropValue4,
				propValue5 = BasePropValue5
			} = BaseProp,
			Fun = fun(Val) ->
				Val * (1 + QuaRatio) * (1 + Mult)
			      end,
			#rec_equip_enhance_info{
				propKey1 = EnhancePropKey1,
				propValue1 = EnhancePropValue1,
				propKey2 = EnhancePropKey2,
				propValue2 = EnhancePropValue2,
				propKey3 = EnhancePropKey3,
				propValue3 = EnhancePropValue3,
				propKey4 = EnhancePropKey4,
				propValue4 = EnhancePropValue4,
				propKey5 = EnhancePropKey5,
				propValue5 = EnhancePropValue5
			} = addDefensiveBonusProp(
				EnhanceProp#rec_equip_enhance_info{
					propValue1 = Fun(BasePropValue1),
					propValue2 = Fun(BasePropValue2),
					propValue3 = Fun(BasePropValue3),
					propValue4 = Fun(BasePropValue4),
					propValue5 = Fun(BasePropValue5)},
				ExtProp),

			EnhanceProp1 =
				[{EnhancePropKey1, EnhancePropValue1, ?PropCalcType_Add},
					{EnhancePropKey2, EnhancePropValue2, ?PropCalcType_Add},
					{EnhancePropKey3, EnhancePropValue3, ?PropCalcType_Add},
					{EnhancePropKey4, EnhancePropValue4, ?PropCalcType_Add},
					{EnhancePropKey5, EnhancePropValue5, ?PropCalcType_Add}],

			ExtProp1 =
				[{ExtPropKey1, ExtPropValue1, ExtCalcType1},
					{ExtPropKey2, ExtPropValue2, ExtCalcType2},
					{ExtPropKey3, ExtPropValue3, ExtCalcType3},
					{ExtPropKey4, ExtPropValue4, ExtCalcType4},
					{ExtPropKey5, ExtPropValue5, ExtCalcType5},
					{ExtPropKey6, ExtPropValue6, ExtCalcType6}],
			playerCalcProp:changeProp_CalcType(EnhanceProp1, ExtProp1, Operate, IsNotify);
		_ ->
			?ERROR_OUT("equipChangeProp not find item:roleID=~p,roleName=~ts,itemID=~p",
				[playerState:getRoleID(), playerState:getName(), ItemID]),
			ok
	end.

%%getValue(ExtList, Index, Index1) ->
%%	Len = length(ExtList),
%%	case Len =:= 0 orelse Len < Index of
%%		true ->
%%			?EquipConfigInvalid;
%%		_ ->
%%			case lists:nth(Index, ExtList) of
%%				{Key, Value, CalcType, IsRecast, AffixeID} ->
%%					case Index1 of
%%						1 ->
%%							Key;
%%						2 ->
%%							Value;
%%						3 ->
%%							CalcType;
%%						4 ->
%%							IsRecast;
%%						_ ->
%%							AffixeID
%%					end;
%%				_ ->
%%					?EquipConfigInvalid
%%			end
%%	end.

%%
%%-spec randValue(Min :: number(), Max :: number(), Dice :: uint()) -> number().
%%randValue(Min, Max, Dice) ->
%%	RandNum = random:uniform(Dice + 1),
%%	Min + (Max - Min) * (RandNum - 1) / Dice.
%%==========================================================================
%%装备精炼
%%==========================================================================

%%改变装备精炼部位属性加成
-spec changePosRefineProp(PosLevel :: uint(), Type :: uint(), Opreate :: uint()) -> ok.
changePosRefineProp(0, _, _) ->
	ok;
changePosRefineProp(PosLevel, Type, ?AddEquipProp) ->
	playerCalcProp:changeProp_CalcType(getPosRefineProp(PosLevel, Type), ?EquipOn, true);
changePosRefineProp(PosLevel, Type, ?DelEquipProp) ->
	playerCalcProp:changeProp_CalcType(getPosRefineProp(PosLevel, Type), ?EquipOff, true).

%%改变装备精炼套装属性加成
-spec changeSuitRefineProp(SuitLevel :: uint(), Operate :: uint()) -> ok.
changeSuitRefineProp(0, _) ->
	skip;
changeSuitRefineProp(SuitLevel, ?AddEquipProp) ->
	#equipIntenLevelCfg{allBonus = Bonus} = getCfg:getCfgByKey(cfg_equipIntenLevel, SuitLevel),
	playerCalcProp:changeProp_CalcType(Bonus, ?EquipOn, true);
changeSuitRefineProp(SuitLevel, ?DelEquipProp) ->
	#equipIntenLevelCfg{allBonus = Bonus} = getCfg:getCfgByKey(cfg_equipIntenLevel, SuitLevel),
	playerCalcProp:changeProp_CalcType(Bonus, ?EquipOff, true).

%%改变装备重新部位套装属性
-spec changeSuitStarProp(SuitLevel :: uint(), Operate :: uint()) -> ok.
changeSuitStarProp(0, _) ->
	skip;
changeSuitStarProp(SuitLevel, ?AddEquipProp) ->
	#equipstarCfg{allbonus = Bonus} = getCfg:getCfgByArgs(cfg_equipstar, SuitLevel),
	playerCalcProp:changeProp_CalcType(Bonus, ?EquipOn, true).


%%获取装备精炼部位等级
-spec getPosRefineLevel(Type :: uint(), RefineList :: list()) -> uint().
getPosRefineLevel(Type, RefineList) ->
	case lists:keyfind(Type, 1, RefineList) of
		{Type, Level} ->
			Level;
		_ ->
			0
	end.

%%获取装备部位星级
-spec getPosStarLevel(Pos :: uint(), L :: list()) -> uint().
getPosStarLevel(Pos, L) ->
	case lists:keyfind(Pos, #recEquipStar.pos, L) of
		false ->
			0;
		#recEquipStar{star = Star} ->
			Star
	end.

%%获取装备精炼部位属性值根据部位等级
-spec getPosRefineProp(PosLevel :: uint(), Type :: uint()) -> {float(), list()}.
getPosRefineProp(PosLevel, Type) ->
	Career = playerState:getCareer(),
	#equipNewIntenCfg{
		offHandBonus = OffHandBonus,
		amuletBonus = AmuletBonus,
		bootBonus = BootBonus,
		ringBonus = RingBonus,
		helmBonus = HelmBonus,
		pantBonus = PantBonus,
		chestBonus = ChestBonus,
		mainHandBonus = MainHandBonus
	} = getCfg:getCfgPStack(cfg_equipNewInten, ?Career2CareerBase(Career)),
		case Type of
			?EquipTypeWeapon ->
				getPosProp(PosLevel, MainHandBonus);
			?EquipTypeEarrings ->
				getPosProp(PosLevel, OffHandBonus);
			?EquipTypeArmor ->
				getPosProp(PosLevel, ChestBonus);
			?EquipTypeBoots ->
				getPosProp(PosLevel, BootBonus);
			?EquipTypeRing ->
				getPosProp(PosLevel, RingBonus);
			?EquipTypeNecklace ->
				getPosProp(PosLevel, AmuletBonus);
			?EquipTypeTrousers ->
				getPosProp(PosLevel, PantBonus);
			?EquipTypeHelmet ->
				getPosProp(PosLevel, HelmBonus)
	end.

getPosProp(_PosLevel, undefined) ->
	[];
getPosProp(PosLevel, PosBonus) ->
	#equipIntenLevelCfg{
		bonus = MainHandBonus
	} = getCfg:getCfgByKey(cfg_equipIntenLevel, PosLevel),
	getPosProp(PosLevel, MainHandBonus, PosBonus, []).
getPosProp(_PosLevel, _MainHandBonus, [], AllBonus) ->
	AllBonus;
getPosProp(PosLevel, MainHandBonus, [{Key, A, B} | L], AllBonus) ->
	case lists:keyfind(Key, 1, MainHandBonus) of
		false ->
			?ERROR_OUT("cfg_equipIntenLevel not find prop ~p", [Key]),
			[];
		{Key, BaseValue, CalcType} ->
			NewValue = {Key, BaseValue * A + PosLevel * B, CalcType},
			getPosProp(PosLevel, MainHandBonus, L, [NewValue | AllBonus])
	end.

%%获取装备精炼套装等级
-spec getSuitRefineLevel(RefineList :: list()) -> uint().
getSuitRefineLevel(RefineList) ->
	getSuitRefineLevel(lists:seq(?EquipTypeStart, ?EquipTypeMax), RefineList, 0).

getSuitRefineLevel([], _RefineList, MinLv) ->
	MinLv;
getSuitRefineLevel([Type | Types], RefineList, MinLv) ->
	case lists:keyfind(Type, 1, RefineList) of
		{Type, Level} ->
			case MinLv =:= 0 of
				true ->
					getSuitRefineLevel(Types, RefineList, Level);
				_ ->
					case Level >= MinLv of
						true ->
							getSuitRefineLevel(Types, RefineList, MinLv);
						_ ->
							getSuitRefineLevel(Types, RefineList, Level)
					end
			end;
		_ ->
			0
	end.

%%获取装备冲星套装等级
-spec getSuitUpStarLv(L :: list()) -> uint().
getSuitUpStarLv(L) ->
	getSuitUpStarLv(lists:seq(?EquipTypeStart, ?EquipTypeMax), L, 0).
getSuitUpStarLv([], _L, Lv) ->
	Lv;
getSuitUpStarLv([Pos | PL], L, MinLv) ->
	case lists:keyfind(Pos, #recEquipStar.pos, L) of
		#recEquipStar{star = Star} ->
			if
				MinLv =:= 0 ->
					getSuitUpStarLv(PL, L, Star);
				Star >= MinLv ->
					getSuitUpStarLv(PL, L, MinLv);
				true ->
					getSuitUpStarLv(PL, L, Star)
			end;
		_ ->
			0
	end.

%%装备精炼列表
-spec sendRefineList(RefineList :: list()) -> ok.
sendRefineList(RefineList) ->
	Fun = fun({Type, Level}) ->
		#pk_EquipRefineLevel{
			type = Type,
			level = Level
		}
	      end,
	Msg = #pk_GS2U_EquipRefineLevel{
		equipRefines = lists:map(Fun, RefineList)
	},
	playerMsg:sendNetMsg(Msg).

%%装备精炼结果
-spec sendRefineResult(Type :: uint(), Level :: uint()) -> ok.
sendRefineResult(Type, Level) ->
	Msg = #pk_GS2U_EquipRefineResult{
		code = playerState:getPlayerCode(),
		type = Type,
		level = Level
	},
	playerMsg:sendMsgToNearPlayer(Msg, true).

%%==========================================================================
%%装备升星
%%==========================================================================
-spec sendEquipUpStarList(L :: list()) -> ok.
sendEquipUpStarList(L) ->
	Fun = fun(#recEquipStar{
		pos = Pos,
		bless = Bless,
		prog = Prog,
		star = Star
	}) ->
		#pk_EquipUpStarInfo{
			pos = Pos,
			level = Star,
			prog = Prog,
			bless = Bless
		}
	      end,
	List = lists:map(Fun, L),
	Msg = #pk_GS2U_EquipUpStarInfoList{
		equipUpStars = List
	},
	playerMsg:sendNetMsg(Msg).

-spec sendEquipUpStarRes(#recEquipStar{}, Type :: uint(), Index :: uint(), ItemID :: uint(), ItemNum :: uint(), Coin :: uint(), Res :: uint()) -> ok.
sendEquipUpStarRes(#recEquipStar{
	pos = Pos,
	bless = Bless,
	prog = Prog,
	star = Star
}, Type, Index, ItemID, ItemNum, Coin, Res) ->
	Info = #pk_EquipUpStarInfo{
		pos = Pos,
		level = Star,
		prog = Prog,
		bless = Bless
	},
	Msg = #pk_GS2U_EquipUpStarRes{
		equipUpStarInfo = Info,
		type = Type,
		index = Index,
		itemID = ItemID,
		itemNum = ItemNum,
		coin = Coin,
		res = Res
	},
	playerMsg:sendNetMsg(Msg).



