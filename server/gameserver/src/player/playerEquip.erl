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
-define(AllEquipStar, 2).%%全部位冲星
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
	getEquipQuality/1,
	getEquipByType/1,
	getRefineLevel/0,
	getStartLevel/0
%%	getAffixesCfg/2,
]).

-export([
	onEquipOn/2,
	onEquipOff/2,
	equipChangeProp/3
]).

%%装备精炼
-export([
	initEquipRefine/0,
	equipRefine/2,
	equipRefineOneKey/0,
	sendRefineList/1,
	equipRecastInit/0,
	sendEquipRecastInit2Client/0
]).

%%装备冲星
-export([
	initEquipStar/0,
	equipStar/2,
	allEquipUpStar/2

]).

%%根据角色初始化默认装备，并穿到身上
-spec initRoleDefaultEquip() -> ok.
initRoleDefaultEquip() ->
	CareerID = playerState:getCareer(),
	case getCfg:getCfgPStack(cfg_player_desc, CareerID) of
		#player_descCfg{equip = EquipIDList} when erlang:is_list(EquipIDList)
			andalso erlang:length(EquipIDList) > 0 ->
			[initEquip(CareerID, EquipID) || EquipID <- EquipIDList, EquipID > 0],
			playerForce:calcPlayerForce(?PlayerEquipForce, true);
		_ ->
			skip
	end,
	ok.

%%根据装备ID和装备品质，生成装备，包括基础装备、特殊装备、套装装备
-spec makeEquip(EquipID, _Quality, BagType, IsBind) -> #recSaveEquip{}
	when EquipID :: itemId(), _Quality :: equipQuality(), BagType :: bagType(), IsBind :: boolean().
makeEquip(EquipID, _, BagType, IsBind) ->
	#equipmentCfg{qualityType = Quality} = EquipCfg = getCfg:getCfgPStack(cfg_equipment, EquipID),
	{NewQuality, RealQuality} = recalcQuality(EquipID, Quality),
	EquipUID = uidMgr:makeItemUID(),
	?LOG_OUT("player:~p make EquipID:~p UID:~p Quality:~p BagType:~p IsBind:~p", [playerState:getRoleID(), EquipID, EquipUID, RealQuality, BagType, IsBind]),
	{BaseProp, ExtProp} =
		if
		%%绿色到红色
			NewQuality >= ?EquipColorTypeGreen andalso NewQuality =< ?EquipColorTypeMax ->  %%绿色装备有基础属性和附加属性
				{
					makeEquipBaseProp(EquipID, NewQuality, EquipUID),
					#rec_equip_ext_info{equipUID = EquipUID}
				};
			true ->
				%%默认为白色,装备只有基础属性
				{
					makeEquipBaseProp(EquipID, ?EquipColorTypeWhite, EquipUID),
					#rec_equip_ext_info{equipUID = EquipUID}
				}
		end,
	EnhanceProp = makeEquipEnahanceProp(EquipCfg, EquipUID),
	%%这里判定并添加防御加成
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
		enhanceProp = EnhanceProp
	}.

recalcQuality(_EquipID, Quality) -> {Quality, Quality}.


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
	ok.

sendEquipRecastInit2Client() ->
	List = playerPropSync:getProp(?SerProp_EquipRecastList),
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
	changeSuitRefineProp(RefineSuitLevel, ?EquipOn),
	sendRefineList(RefineList).


getRefineLevel()->
	RefineList = playerState:getEquipRefine(),
	getSuitRefineLevel(RefineList).

%%装备精炼

canEquipRefine(Type) ->
	case checkEquipRefineType(Type) of
		true ->
			RList = playerState:getEquipRefine(),
			Lv = getPosRefineLevel(Type, RList),
			case Lv < playerState:getLevel() of
				true ->
					case getCfg:getCfgByKey(cfg_equipIntenLevel, Lv + 1) of
						#equipIntenLevelCfg{} = Cfg ->
							case checkEquipRefineMaterial(Cfg) of
								CList when is_list(CList) ->
									{true, Lv, CList, RList};
								false ->
									{false, ?ErrorCode_BagEquipRefineMaterialNotEnougth}
							end;
						_ ->
							{false, ?ErrorCode_BagEquipRefineHasMax}
					end;
				_ ->
					{false, ?ErrorCode_BagEquipNotPlayerLevel}
			end;
		_ ->
			{false, ?ErrorCode_BagEquipRefineTypeNotExist}
	end.

equipRefine(Type, IsNotify) ->
	equipRefine(Type, true, IsNotify).

equipRefine(Type, IsCalcForce, IsNotify) ->
	case canEquipRefine(Type) of
		{true, Lv, CList, RList} ->
			doEquipRefine(Type, Lv, CList, RList, IsCalcForce);
		{_, ErrorCode} when IsNotify ->
			playerMsg:sendErrorCodeMsg(ErrorCode);
		_ ->
			skip
	end,
	ok.


doEquipRefine(Type, Lv, CList, RList, IsCalcForce) ->
	equipRefineSpec(RList),
	playerAchieve:achieveEvent(?Achieve_StrMan, [1]),
	OldSuitLevel = getSuitRefineLevel(RList),

	%%目前装备跟精炼部位没有关系
	NewRList = lists:keystore(Type, 1, RList, {Type, Lv + 1}),
	playerState:setEquipRefine(NewRList),
	%%套装加成
	CurSuitLevel = getSuitRefineLevel(NewRList),
	case OldSuitLevel =/= CurSuitLevel of
		true ->
			playerGameNotice:sendGameNotice(?SuitRefineLevel_Notice, CurSuitLevel, 0, 0),
			playerAchieve:achieveEvent(?Achieve_StrongestKing, [1]),
			playerTask:updateTask(?TaskSubType_System, ?TaskSubType_System_Sub_EquipRedefine, 1),
			changeSuitRefineProp(OldSuitLevel, ?EquipOff),
			changeSuitRefineProp(CurSuitLevel, ?EquipOn),

			#globalsetupCfg{setpara = RefineL} = getCfg:getCfgByKey(cfg_globalsetup, equipinten_worldtext_limit),
			case lists:member(CurSuitLevel, RefineL) of
				true ->
					String = stringCfg:getString(equipstronger_worldtext_inten, [playerState:getName(), CurSuitLevel]),
					core:sendBroadcastNotice(String);
				_ ->
					skip
			end;
		_ ->
			skip
	end,

	case getEquipByType(Type) of
		{true, _Equip} ->
			%%部位加成
			changePosRefineProp(Lv, Type, ?EquipOff),
			changePosRefineProp(Lv + 1, Type, ?EquipOn);
		_ ->
			skip
	end,
	delItem(CList, ?ItemDeleteReasonRefine),
	playerSave:saveRefine(Type, Lv + 1),
	sendRefineResult(Type, Lv + 1),
	playerSevenDayAim:updateCondition(?SevenDayAim_EquipRefine, []),
	if
		IsCalcForce ->
			playerForce:calcPlayerForce(?PlayerStrForce, true);
		true ->
			skip
	end.

%% 装备一键精炼
equipRefineOneKey() ->
	EquipTypeList = getEquipRefineOneKeyList(),
	%% 交换精炼顺序，优先精炼武器
	lists:foreach(fun(Type) -> equipRefine(Type, false, false) end, lists:reverse(EquipTypeList)),
	playerForce:calcPlayerForce(?PlayerStrForce, true),
	ok.

%% 装备全部位升星
getEquipStarOneKeyList()->
	EquipTypeList = lists:seq(?EquipTypeStart, ?EquipTypeMax),
	RList0 = playerState:getEquipStarList(),
	RList1 = lists:foldl(
		fun(Type, AccIn)->
			case lists:keyfind(Type, #recEquipStar.pos, RList0) of
				false ->
					[#recEquipStar{
						bless = 0,
						pos = Type,
						prog = 0,
						star = 0
					}| AccIn];
				V ->
					[V | AccIn]
			end
		end, [], EquipTypeList),
	MinLevel = lists:foldl(
		fun(#recEquipStar{pos =_Type,star = Level}, AccMinLevel)->
			case Level < AccMinLevel of
				true ->
					Level;
				_ ->
					AccMinLevel
			end
		end, 999, RList1),
	[EquipType || #recEquipStar{pos =EquipType,star = RefineLevel} <- RList1, RefineLevel =:= MinLevel].


getEquipRefineOneKeyList()->
	EquipTypeList = lists:seq(?EquipTypeStart, ?EquipTypeMax),
	RList0 = playerState:getEquipRefine(),
	RList1 = lists:foldl(
		fun(Type, AccIn)->
			case lists:keyfind(Type, 1, RList0) of
				false ->
					[{Type, 0} | AccIn];
				V ->
					[V | AccIn]
			end
		end, [], EquipTypeList),
	MinLevel = lists:foldl(
		fun({_Type, Level}, AccMinLevel)->
			case Level < AccMinLevel of
				true ->
					Level;
				_ ->
					AccMinLevel
			end
		end, 999, RList1),
	[EquipType || {EquipType, RefineLevel} <- RList1, RefineLevel =:= MinLevel].

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
					playerTask:updateTask(?TaskSubType_System, ?TaskSubType_System_Sub_EquipRedefine, SuitLv),
					playerAchieve:achieveEvent(?Achieve_StrongestKing, [SuitLv])
			end,
			playerPropSync:setInt(?SerProp_LoadRefineFlag, 1);
		true ->
			skip
	end.

-spec checkEquipRefineType(Type :: uint()) -> boolean().
checkEquipRefineType(Type) when Type >= ?EquipTypeStart andalso Type =< ?EquipTypeMax ->
	true;
checkEquipRefineType(_Type) ->
	false.


checkEquipRefineMaterial(
	#equipIntenLevelCfg{
		materialCost = MaterialCost,
		materialTransform = SubCost
	}) ->
	checkEquipRefineMaterial(MaterialCost, SubCost, []).

%%修改成只支持主消耗一种道具，
checkEquipRefineMaterial([], _SubMaterial, CostList) ->
	CostList;
checkEquipRefineMaterial([{ID, Num} | _], [], CostList) ->
	case playerPackage:getItemNumByID(ID) >= Num of
		true ->
			[{ID, Num} | CostList];
		_ ->
			false
	end;
checkEquipRefineMaterial([{AID, ANum} | _], [{BID, BNum} | _], CostList) ->
	HaveA = playerPackage:getItemNumByID(AID),
	case HaveA >= ANum of
		true ->
			[{AID, ANum} | CostList];
		%% A不够B来凑
		_ ->
			LeftA = ANum - HaveA,
			NeedB = LeftA * BNum,
			HaveB = playerPackage:getItemNumByID(BID),
			case HaveB >= NeedB of
				true ->
					if
						HaveA > 0 ->
							[{AID, HaveA}, {BID, NeedB} | CostList];
						true ->
							[{BID, NeedB} | CostList]
					end;
				_ ->
					false
			end
	end.

%%初始化装备冲星
-spec initEquipStar() -> ok.
initEquipStar() ->
	L = playerState:getEquipStarList(),
	Slv = getSuitUpStarLv(L),
	changeSuitStarProp(Slv, ?EquipOn),
	sendEquipUpStarList(L).

getStartLevel()->
	L = playerState:getEquipStarList(),
	getSuitUpStarLv(L).

%%装备冲星
-spec allEquipUpStar(Pos :: uint(), Type :: uint()) -> ok.
allEquipUpStar(Pos,Type)->
	case Type =:= ?AllEquipStar of
		true ->
			EquipTypeList = getEquipStarOneKeyList(),
			%% 交换冲星顺序，优先冲星武器
			lists:foreach(fun(Pos1) -> equipStar(Pos1, 0) end, lists:reverse(EquipTypeList));
		_->
			equipStar(Pos,Type)
	end,
	ok.

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
	case getCfg:getCfgByArgs(cfg_equipstar, EquipStar#recEquipStar.star, Pos) of
		#equipstarCfg{limit_level = LimitLv} = EquipStarCfg when Lv >= LimitLv ->
			case getCfg:getCfgByArgs(cfg_equipstar, EquipStar#recEquipStar.star + 1, Pos) of
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

itemB2A(0, _TransB) ->
	0;
itemB2A(_HaveB, 0) ->
	0;
itemB2A(HaveB, TransB) ->
	erlang:trunc(HaveB / TransB).

itemA2ABList(ItemA, HaveA, NeedA, 0, _HaveB, _TransB) ->
	case HaveA >= NeedA of
		true ->
			[{ItemA, NeedA}];
		_ ->
			false %%不应该到这里
	end;
itemA2ABList(ItemA, HaveA, NeedA, _ItemB, _HaveB, 0) ->
	case HaveA >= NeedA of
		true ->
			[{ItemA, NeedA}];
		_ ->
			false  %%不应该到这里
	end;
itemA2ABList(ItemA, HaveA, NeedA, ItemB, HaveB, TransB) ->
	case HaveA >= NeedA of
		true ->
			[{ItemA, NeedA}];
		%% A不够B来凑
		_ ->
			LeftA = NeedA - HaveA,
			NeedB = LeftA * TransB,
			if
				HaveB < NeedB ->
					false;%%不应该到这里
				HaveA > 0 ->
					[{ItemA, HaveA}, {ItemB, NeedB}];
				true ->
					[{ItemB, NeedB}]
			end
	end.

%%单次冲星
equipStar(
	?EachUpStar,
	#recEquipStar{bless = Bless, star = Star} = EquipStar,
	#equipstarCfg{
		cost_item = ItemID, fail_odd = FailOdd,
		transform_item = TItemID, transform_num = TNumber
	} = EquipStarCfg
) ->
	HaveA = playerPackage:getItemNumByID(ItemID),
	HaveB = playerPackage:getItemNumByID(TItemID),
	Num = HaveA + itemB2A(HaveB, TNumber),
	Coin = playerState:getCoin(?CoinTypeGold),
	case eachEquipStar(Bless, Num, Coin, 0, EquipStarCfg) of
		{?UpStar_NoItem_Fail, _, _, _} ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipStarMaterialNotEnougth);
		{?UpStar_NoCoin_Fail, _, _, _} ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipStarCoinNotEnougth);
		Other ->
			{Res, Index1, ReNum1, ReCoin1, NewEquipStar} =
				case Other of
					{?UpStar_Lv_Succ, Index, ReNum, ReCoin} ->
						{?UpStar_Lv_Succ, Index, ReNum, ReCoin, EquipStar#recEquipStar{
							bless = 0,
							prog = 0,
							star = Star + 1
						}};
					{?UpStar_Fail, Index, ReNum, ReCoin} ->
						{?UpStar_Fail, Index, ReNum, ReCoin, EquipStar#recEquipStar{
							bless = Bless + trunc(FailOdd * 1000),
							prog = 0
						}}
				end,
			CostItemList = itemA2ABList(ItemID, HaveA, Num - ReNum1, TItemID, HaveB, TNumber),
			equipStarRes(?EachUpStar, CostItemList, Coin - ReCoin1, Index1, Res, NewEquipStar)
	end;
%%一键冲星
equipStar(
	?QuickUpStar,
	EquipStar,
	#equipstarCfg{
		cost_item = ItemID,
		transform_item = TItemID, transform_num = TNumber
	} = EquipStarCfg
) ->
	HaveA = playerPackage:getItemNumByID(ItemID),
	HaveB = playerPackage:getItemNumByID(TItemID),
	Num = HaveA + itemB2A(HaveB, TNumber),

	Coin = playerState:getCoin(?CoinTypeGold),
	{Res, Index, ReNum, ReCoin, NewEquipStar} = equipStar(Num, Coin, 0, EquipStar, EquipStarCfg),
	CostItemList = itemA2ABList(ItemID, HaveA, Num - ReNum, TItemID, HaveB, TNumber),
	equipStarRes(?QuickUpStar, CostItemList, Coin - ReCoin, Index, Res, NewEquipStar).

equipStar(
	Num,
	Coin,
	Index,
	#recEquipStar{bless = Bless, star = Star} = EquipStar,
	#equipstarCfg{fail_odd = FailOdd} = EquipStarCfg
) ->
	case eachEquipStar(Bless, Num, Coin, Index, EquipStarCfg) of
		{?UpStar_Fail, Index1, ReNum, ReCoin} ->
			NewEquipStar = EquipStar#recEquipStar{
				bless = Bless + trunc(FailOdd * 1000),
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
equipStarRes(_Type, false, _CostCoin, _Index, _Res, _EquipStar) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipStarMaterialNotEnougth);
equipStarRes(Type, CostItemList, CostCoin, Index, Res, #recEquipStar{pos = Pos} = EquipStar) ->
	%%删除物品
	delItem(CostItemList, ?ItemDeleteReasonEquipUpStar),

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
					changeSuitStarProp(Old, ?EquipOff),
					changeSuitStarProp(New, ?EquipOn);
				true ->
					skip
			end,
			playerTask:updateTask(?TaskSubType_System, ?TaskSubType_System_Sub_EquipStar),
			playerForce:calcPlayerForce(?PlayerEquipForce, true),
			if
				Old =/= New andalso New > 0 ->
%%					%%勇士[00ff00]<t=9>[~p],[~p],【~ts】</t>[-]将全身装备冲星至[00ff00]【~ts】[-]，创造新的传奇。
					SuitBroadL =
						case getCfg:getCfgByKey(cfg_globalsetup, equipstar_worldtext_limit) of
							#globalsetupCfg{setpara = V} ->
								V;
							_ ->
								[]
						end,
					case lists:member(New, SuitBroadL) of
						true ->
							case getCfg:getCfgByArgs(cfg_equipstar, New, Pos) of
								#equipstarCfg{desc = Desc1} ->
									Desc = Desc1;
								_ ->
									Desc = ""
							end,
							String = stringCfg:getString(equipstronger_worldtext_star, [playerState:getName(), Desc]),
							core:sendBroadcastNotice(String);
						_ ->
							skip
					end;
%%					N = stringCfg:getString(equipUpstar, [playerState:getRoleID(), playerState:getPlayerCode(), playerState:getName(), Desc]),
%%					core:sendBroadcastNotice(N);
				true ->
					skip
			end;
		_ ->
			NL = lists:keystore(Pos, #recEquipStar.pos, L, EquipStar),
			playerState:setEquipStarList(NL)
	end,
	playerSave:saveEquipStar(EquipStar),

	%%发送消息
	sendEquipUpStarRes(EquipStar, Type, Index, CostItemList, CostCoin, Res),
	playerSevenDayAim:updateCondition(?SevenDayAim_EquipStar, []).

%%装备单次冲星结果
eachEquipStar(
	_Bless,
	Num,
	Coin,
	Index,
	#equipstarCfg{cost_num = CostNum}
) when Num < CostNum ->
	{?UpStar_NoItem_Fail, Index, Num, Coin};
eachEquipStar(
	_Bless,
	Num,
	Coin,
	Index,
	#equipstarCfg{
		cost_coin = CostCoin
	}
) when Coin < CostCoin ->
	{?UpStar_NoCoin_Fail, Index, Num, Coin};
eachEquipStar(
	Bless,
	Num,
	Coin,
	Index,
	#equipstarCfg{
		progress = _Progress,
		fail_odd = FailOdd,
		fail_min = FailTimes,
		cost_num = CostNum,
		cost_coin = CostCoin
	}
) when Bless < trunc(FailOdd * FailTimes * 1000) ->
	{?UpStar_Fail, Index + 1, Num - CostNum, Coin - CostCoin};
eachEquipStar(
	Bless,
	Num,
	Coin,
	Index,
	#equipstarCfg{
		odd = Odd,
		cost_num = CostNum,
		cost_coin = CostCoin
	}
) ->
	eachEquipStar(random:uniform(100), Odd * 100 + Bless / 10, Index, Num, Coin, CostNum, CostCoin).

eachEquipStar(
	R, Odd, Index,
	Num, Coin, CostNum, CostCoin
) when R =< Odd ->
	{?UpStar_Lv_Succ, Index + 1, Num - CostNum, Coin - CostCoin};
eachEquipStar(_R, _Odd, Index,
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


makeEquipEnahanceProp(#equipmentCfg{randomprop = []}, EquipUID) ->
	#rec_equip_enhance_info{equipUID = EquipUID};
makeEquipEnahanceProp(#equipmentCfg{randomprop = [_X, 0]}, EquipUID) ->
	#rec_equip_enhance_info{equipUID = EquipUID};
makeEquipEnahanceProp(#equipmentCfg{randomprop = [PoolID, N]}, EquipUID) ->
	L1 = getCfg:get2KeyList(cfg_equipment_randomprop, PoolID),
	L2 = lists:foldl(
		fun(PropID, ACC)->
			case getCfg:getCfgByArgs(cfg_equipment_randomprop, PoolID, PropID) of
				#equipment_randompropCfg{probability = Prob} = Cfg ->
					[{Prob, Cfg} | ACC];
				_ ->
					ACC
			end
		end, [], L1),
	L3 = [misc:calcOddsByWeightList(L2) || _X <- lists:seq(1, N)],
	makeEquipEnahanceProp2(EquipUID, L3);
makeEquipEnahanceProp(_Cfg, EquipUID) ->
	#rec_equip_enhance_info{equipUID = EquipUID}.


makeEquipEnahanceProp2(EquipUID, [])->
	#rec_equip_enhance_info{equipUID = EquipUID};
makeEquipEnahanceProp2(EquipUID, CfgList)->
	PropList = [randomEnPropVal(Cfg) || Cfg <- CfgList],
	PropListLen = erlang:length(PropList),
	{PropID1, PropVal1} = safeGetFromList(1, PropListLen, PropList),
	{PropID2, PropVal2} = safeGetFromList(2, PropListLen, PropList),
	{PropID3, PropVal3} = safeGetFromList(3, PropListLen, PropList),
	{PropID4, PropVal4} = safeGetFromList(4, PropListLen, PropList),
	{PropID5, PropVal5} = safeGetFromList(5, PropListLen, PropList),
	#rec_equip_enhance_info{
		equipUID = EquipUID
		, propKey1 = PropID1, propValue1 = PropVal1
		, propKey2 = PropID2, propValue2 = PropVal2
		, propKey3 = PropID3, propValue3 = PropVal3
		, propKey4 = PropID4, propValue4 = PropVal4
		, propKey5 = PropID5, propValue5 = PropVal5
	}.

safeGetFromList(Index, N, _L) when Index > N orelse Index < 1->
	{0,0};
safeGetFromList(Index, _N, L)->
	lists:nth(Index, L).


randomEnPropVal(#equipment_randompropCfg{propid = PropID, min = Min, max = Max, prop_probability = PL})->
	Diff = Max - Min,
	L1 = [{WT,{PLO, PMO}} || {PLO, PMO, WT} <- PL],
	{PMin, PMax} = misc:calcOddsByWeightList(L1),
	{PropID, Min + misc:rand(erlang:trunc(Diff * PMin), erlang:trunc(Diff * PMax))/100}.


%%检查默认装备职业
checkDefaultEquipClass(PlayerClass, EquipClass) when is_list(EquipClass) ->
	lists:member(PlayerClass, EquipClass);
checkDefaultEquipClass(PlayerClass, EquipClass) when EquipClass =:= PlayerClass orelse EquipClass =:= 0 ->
	true;
checkDefaultEquipClass(_, _) ->
	false.

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
			%%在配置的最小值和最大值之间取随机float值，配置的最大值是1
			Source1 = getEquipSourceValue(EquipID),  %%等级资源基础值
			%%取装备的部位价格权重和等级基础价格
			case getCfg:getCfgPStack(cfg_equipment, EquipID) of
				#equipmentCfg{itemLevel = ItemLevel} ->
					LevelBasePrice = getEquipBasePrice(ItemLevel);   %%等级基础价格
				_ ->
					LevelBasePrice = 0
			end,

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

					ChangePurpleEssence = Source1,

					%% 获得爵位加成
					playerMoney:addCoin(?CoinTypePurpleEssence, ChangePurpleEssence,
						#recPLogTSMoney{
							reason = ?CoinSourceEquipResolve,
							param = EquipUID,
							target = ?PLogTS_PlayerSelf,
							source = ?PLogTS_EquipResolve
						}),%%更新玩家的紫色精华

					[ChangePurpleEssence, 0];
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
	Fun =
		fun(Equip, EquipList) ->
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
equipChangeProp(#recSaveEquip{itemID = ItemID, baseProp = BaseProp, enhanceProp = EnProp}, Operate, IsNotify) ->
	playerState:setEquips(getPlayerEquip()),
	case getCfg:getCfgPStack(cfg_equipment, ItemID) of
		#equipmentCfg{type = Type} ->
			PosLevel = getPosStarLevel(Type, playerState:getEquipStarList()),
			StartProps =
				case getCfg:getCfgByArgs(cfg_equipstar, PosLevel, Type) of
					#equipstarCfg{starProps = SPL} when is_list(SPL) ->
						SPL;
					_ ->
						[]
				end,

			EquipStartProps = playerCalcProp:makePropsGroup_Equip(
				BaseProp,
				StartProps,
				Operate
			),

			#rec_equip_base_info{
				propKey1 = K1, propValue1 = V1,
				propKey2 = K2, propValue2 = V2,
				propKey3 = K3, propValue3 = V3,
				propKey4 = K4, propValue4 = V4,
				propKey5 = K5, propValue5 = V5
			} = BaseProp,

			BasePropCalc = [
				{K1, V1, ?PropCalcType_Add},
				{K2, V2, ?PropCalcType_Add},
				{K3, V3, ?PropCalcType_Add},
				{K4, V4, ?PropCalcType_Add},
				{K5, V5, ?PropCalcType_Add}
			],

			#rec_equip_enhance_info{
				propKey1 = KE1, propValue1 = VE1,
				propKey2 = KE2, propValue2 = VE2,
				propKey3 = KE3, propValue3 = VE3,
				propKey4 = KE4, propValue4 = VE4,
				propKey5 = KE5, propValue5 = VE5
			} = EnProp,

			EnhancePropCalc = [
				{KE1, VE1, ?PropCalcType_Add},
				{KE2, VE2, ?PropCalcType_Add},
				{KE3, VE3, ?PropCalcType_Add},
				{KE4, VE4, ?PropCalcType_Add},
				{KE5, VE5, ?PropCalcType_Add}
			],

			RedefineProps = getPosRefineProp(Type),
			GemsProps = playerGem:getEquipGemProps(Type),

			playerCalcProp:changeProp_CalcType(
				BasePropCalc,
				EquipStartProps ++ RedefineProps ++ GemsProps ++ EnhancePropCalc,
				Operate,
				IsNotify
			);
		_ ->
			?ERROR_OUT("equipChangeProp not find item:roleID=~p,roleName=~ts,itemID=~p",
				[playerState:getRoleID(), playerState:getName(), ItemID]),
			ok
	end.

%%==========================================================================
%%装备精炼
%%==========================================================================

%%改变装备精炼部位属性加成
-spec changePosRefineProp(PosLevel :: uint(), Type :: uint(), Opreate :: uint()) -> ok.
changePosRefineProp(0, _, _) ->
	ok;
changePosRefineProp(PosLevel, Type, Operate) ->
	playerCalcProp:changeProp_CalcType(getPosRefineProp(PosLevel, Type), Operate, true).

%%改变装备精炼套装属性加成
-spec changeSuitRefineProp(SuitLevel :: uint(), Operate :: uint()) -> ok.
changeSuitRefineProp(0, _) ->
	skip;
changeSuitRefineProp(SuitLevel, Operate) ->
	#equipIntenLevelCfg{allBonus = Bonus} = getCfg:getCfgByKey(cfg_equipIntenLevel, SuitLevel),
	playerCalcProp:changeProp_CalcType(Bonus, Operate, true).

%%改变装备重新部位套装属性
changeSuitStarProp(0, _) ->
	skip;
changeSuitStarProp(SuitLevel, Operate) ->
	#equipstarCfg{allbonus = Bonus} = getCfg:getCfgByArgs(cfg_equipstar, SuitLevel, ?EquipTypeWeapon),
	playerCalcProp:changeProp_CalcType(Bonus, Operate, true).


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
getPosRefineProp(Type) ->
	RList = playerState:getEquipRefine(),
	Lv = getPosRefineLevel(Type, RList),
	getPosRefineProp(Lv, Type).

-spec getPosRefineProp(PosLevel :: uint(), Type :: uint()) -> {float(), list()}.
getPosRefineProp(0, _Type) ->
	[];
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

sendEquipUpStarRes(#recEquipStar{
	pos = Pos,
	bless = Bless,
	prog = Prog,
	star = Star
}, Type, Index, List, Coin, Res) ->
	Info = #pk_EquipUpStarInfo{
		pos = Pos,
		level = Star,
		prog = Prog,
		bless = Bless
	},
	CostList = [#pk_starCostItem{itemID = ItemID, itemNum = ItemNum} || {ItemID, ItemNum} <- List],
	Msg = #pk_GS2U_EquipUpStarRes{
		equipUpStarInfo = Info,
		type = Type,
		index = Index,
		costList = CostList,
		coin = Coin,
		res = Res
	},
	playerMsg:sendNetMsg(Msg).



