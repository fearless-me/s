%% @author zhengzhichun
%% @doc @todo Add description to playerFashion.


-module(playerFashion).
-include("gsInc.hrl").
-include("common/playerPropSyncDefine.hrl").
-include("playerPrivate.hrl").

-define(OperationTypeBuy, 0).
-define(OperationTypeOn, 1).
-define(OperationTypeOff, 2).

%
-define(FashionCondition_EquipRefine, 1).
-define(FashionCondition_EquipStar, 2).
-define(FashionCondition_EquipNumber, 3).
-define(FashionCondition_PetNumber, 4).

-define(FashionPropIDs, [
    ?PubProp_FashionMajorHand,          % int 时装主手
    ?PubProp_FashionHead,               % int 时装头
    ?PubProp_FashionClothes,            % int 时装衣服
    ?PubProp_FashionBack,               % int 时装背部
    ?PubProp_FashionSpirit,             % int 时装精灵
    ?PubProp_FashionEmotion             % int 时装表情
]).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
    initFashion/1,
    initFashionSlot/1,
    getShowFashions/0,
    checkTimeout/1
]).

-export([
    roomLevelUp/0,
    roomLevelChange/2,
    buyFashion/2,
    useFashionItem/4,
    operateFashionPosition/2
]).

-export([
    sendFashionList2Client/0
]).

%%
roomLevelChange(OldLevel, NewLevel)->
	CfgOld = getCfg:getCfgByArgs(cfg_fashionCollectionLevel, OldLevel),
	CfgNew = getCfg:getCfgByArgs(cfg_fashionCollectionLevel, NewLevel),
	changeFashionRoomProp(?EquipOff, CfgOld),
	changeFashionRoomProp(?EquipOn, CfgNew),
	playerForce:calcPlayerForce(true),
    ok.

changeFashionRoomProp(
	Operate,
	#fashionCollectionLevelCfg{attribute = PropList}
)->
	playerCalcProp:changeProp_CalcType(PropList, Operate, true),
	ok;
changeFashionRoomProp(_AnyOp, _AnyCfg)->
	ok.


%% ====================================================================
roomLevelUp() ->
    case canRoomLevelUp() of
        {true, Cfg}->
            doRoomLevelUp(Cfg);
        _ ->
            skip
    end,
    ok.

doRoomLevelUp(
	#fashionCollectionLevelCfg{
		level = NextLevel
		, exp = NeedExp
	}
)->
    RoomExp = playerPropSync:getProp(?PriProp_FashionRoomExp),
    case RoomExp >= NeedExp of
        true ->
            playerPropSync:setProp(
				?PriProp_FashionRoomExp
				, RoomExp - NeedExp
			),
            playerPropSync:setProp(
				?PriProp_FashionRoomLevel
				, NextLevel
			),
            playerMsg:sendNetMsg(
				#pk_GS2U_FashionRoomLevelUp{
					roomLevel = NextLevel
				}
			),
            ok;
        _ ->
            skip
    end,
    ok;
doRoomLevelUp(_Any)->
    skip.

canRoomLevelUp()->
    RoomExp = playerPropSync:getProp(?PriProp_FashionRoomExp),
    CurLevel = playerPropSync:getProp(?PriProp_FashionRoomLevel),
    case getCfg:getCfgByArgs(cfg_fashionCollectionLevel, CurLevel + 1) of
        #fashionCollectionLevelCfg{exp = NeedExp} = Cfg when RoomExp >= NeedExp ->
            {true,Cfg};
        _ ->
            false
    end.
%% ====================================================================
%%玩家登录时初始化时装
-spec initFashion(MyFashionList :: [#recFashion{}, ...]) -> ok.
initFashion([#recFashion{} | _] = MyFashionList) ->
    playerState:setFashionList(MyFashionList),
    checkTimeout(false),
    initFashionSuit(),
    playerForce:calcPlayerForce(?PlayerFashionColForce, false),
    ok.

%%拥有的时装下来后，再看着在身上的过期没
-spec initFashionSlot(List) -> ok when List :: [#recFashionOnLoad{}].
initFashionSlot([#recFashionOnLoad{} | _] = List) ->
    lists:foreach(
        fun(#recFashionOnLoad{index = Position, value = FashionID}) ->
            putOnClothes(Position, FashionID)
        end, List),
    ok.

%%玩家登录时，下发已经点亮的时装列表
-spec sendFashionList2Client() -> ok.
sendFashionList2Client() ->
    Now = time:getUTCNowSec(),
    PlayerFashionList = playerState:getFashionList(),
    L1 = lists:foldl(
        fun(#recFashion{fashionID = FashionID, endTime = EndTime}, Acc) ->
            if
                EndTime =:= 0 ->
                    [#pk_FashionInfo{time = 0, fashionID = FashionID} | Acc];
                EndTime - Now > 0 ->
                    [#pk_FashionInfo{time = EndTime - Now, fashionID = FashionID} | Acc];
                true ->
                    Acc
            end
        end, [], PlayerFashionList),

    Msg = #pk_GS2U_FashionList{datas = L1},
    ?DEBUG_OUT("gs2uFashionInitList[~p]", [Msg]),
    playerMsg:sendNetMsg(Msg).

%% ====================================================================
getSlotFashionID(SlotID) ->
    case playerPropSync:getProp(SlotID) of
        undefined ->
            0;
        FashionID ->
            FashionID
    end.

-spec getOnBodyFashions() -> [Fashion :: integer(), ...].
getOnBodyFashions() ->
    [getSlotFashionID(FashionSlotID) || FashionSlotID <- ?FashionPropIDs].

%%获取可显示的时间
-spec getShowFashions() -> [Fashion :: integer(), ...].
getShowFashions() ->
    case playerPropSync:getProp(?PubProp_FashionVisibleFlag) of
        0 ->
            getOnBodyFashions();
        _ ->
            []
    end.

%% ====================================================================
buyFashion(FashionID, ExpiresSecond) ->
    case canBuyFashion(FashionID, ExpiresSecond) of
        true ->
            doBuyFashion(FashionID, ExpiresSecond);
        {false, ErrorCode} ->
            playerMsg:sendErrorCodeMsg(ErrorCode);
        _ ->
            skip
    end,
    ok.

doBuyFashion(FashionID, ExpiresSecond) ->
    Cfg = getCfg:getCfgPStack(cfg_fashion, FashionID),
    true = costItem(FashionID, ExpiresSecond, Cfg),
    true = costMoney(FashionID, ExpiresSecond, Cfg),

    case addFashionTime(FashionID, ExpiresSecond) of
        true ->
            ?DEBUG_OUT("useDiamond4fashion ok"),
            gs2uFashionOperateResult(FashionID, ?OperationTypeBuy, ExpiresSecond);
        false ->
            skip
%%            gs2uFashionOperateResult(FashionID, ?OperationTypeBuy, -1)
    end,
    ok.
%% ====================================================================
costItem(
    _FashionID,
    0,
    #fashionCfg{costItemForever = []}
) ->
    true;
costItem(
    _FashionID,
    _ExpiresSecond,
    #fashionCfg{costItem = []}
) ->
    true;
costItem(
    FashionID,
    ExpiresSecond,
    #fashionCfg{costItem = LimitCostList, costItemForever = ForeverCostList}
) ->
    [ItemID, Num] =
        case ExpiresSecond of
            0 ->
                ForeverCostList;
            _ ->
                LimitCostList
        end,
    PLog = #recPLogTSItem{
        old = Num,
        new = 0,
        change = -Num,
        target = ?PLogTS_Item,
        source = ?PLogTS_PlayerSelf,
        gold = 0,
        goldtype = 0,
        changReason = ?ItemDeleteReasonFashion,
        reasonParam = FashionID
    },
    ItemType = playerPackage:getItemType(ItemID),
    playerPackage:delGoodsByID(
        playerPackage:getPackageType(ItemType)
        , ItemID
        , Num
        , PLog
    );
costItem(_FashionID, _AnyTime, _AnyCfg) ->
    false.

costMoney(
    _FashionID
    , 0
    , #fashionCfg{costMoneyForever = []}
) ->
    true;
costMoney(
    _FashionID
    , _ExpiresSecond
    , #fashionCfg{costMoney = []}
) ->
    true;
costMoney(
    FashionID
    , ExpiresSecond
    , #fashionCfg{costMoney = LimitCostList, costMoneyForever = ForeverCostList}
) ->
    [UseType, UseNum] =
        case ExpiresSecond of
            0 ->
                ForeverCostList;
            _ ->
                LimitCostList
        end,
    PLog = #recPLogTSMoney{
        reason = ?CoinUseFashionClothes,
        param = FashionID,
        target = ?PLogTS_Fashion,
        source = ?PLogTS_PlayerSelf
    },
    playerMoney:useCoin(UseType, UseNum, PLog);
costMoney(_FashionID, _AnyTime, _AnyCfg) ->
    false.


%% ====================================================================
canBuyFashion(FashionID, BuySeconds) ->
    case getCfg:getCfgPStack(cfg_fashion, FashionID) of
        #fashionCfg{} = Cfg ->
            case checkFashionTime(FashionID, BuySeconds) of
                true ->
                    case checkCostAndCondition(BuySeconds, Cfg) of
                        true ->
                            checkFashion(FashionID, BuySeconds);
                        V ->
                            V
                    end;
                _ ->
                    skip
            end;
        _ ->
            skip
    end.

%% ====================================================================
checkFashion(FashionID, _BuySeconds) ->
    L = playerState:getFashionList(),
    case lists:keyfind(FashionID, #recFashion.fashionID, L) of
        #recFashion{endTime = 0} ->
            {false, ?ErrorCode_BagItemNotNeedUse};
        _ ->
            true
    end.

%% ====================================================================
checkCostAndCondition(
    BuySeconds,
    #fashionCfg{condition = C} = Cfg
) ->
    case checkCondition(C) of
        true ->
            case checkCostMoney(BuySeconds, Cfg) of
                true ->
                    case checkCostItem(BuySeconds, Cfg) of
                        true ->
                            true;
                        _ ->
                            {false, ?ErrorCode_FashionConsumeNotEnough}
                    end;
                _ ->
                    {false, ?ErrorCode_FashionConsumeNotEnough}
            end;
        _ ->
            {false, ?ErrorCode_FashionActiveCondition}
    end.

%% ====================================================================
checkCostMoney(0, #fashionCfg{costMoneyForever = []}) ->
    true;
checkCostMoney(_BuySeconds, #fashionCfg{costMoney = []}) ->
    true;
checkCostMoney(0, #fashionCfg{costMoneyForever = [UseType, UseNum]}) ->
    playerMoney:canUseCoin(UseType, UseNum);
checkCostMoney(_BuySeconds, #fashionCfg{costMoney = [UseType, UseNum]}) ->
    playerMoney:canUseCoin(UseType, UseNum).

%% ====================================================================
checkCostItem(0, #fashionCfg{costItemForever = []}) ->
    true;
checkCostItem(_BuySeconds, #fashionCfg{costItem = []}) ->
    true;
checkCostItem(0, #fashionCfg{costItemForever = [ItemID, ItemNum]}) ->
    playerPackage:getItemNumByID(ItemID) >= ItemNum;
checkCostItem(_BuySeconds, #fashionCfg{costItem = [ItemID, ItemNum]}) ->
    playerPackage:getItemNumByID(ItemID) >= ItemNum.

%% ====================================================================
checkCondition([]) ->
    true;
checkCondition([C | L]) ->
    case checkCondition1(C) of
        false ->
            false;
        _ ->
            checkCondition(L)
    end.

%% ====================================================================
checkCondition1({?FashionCondition_EquipRefine, RefineLv, _None}) ->
    playerEquip:getRefineLevel() >= RefineLv;
checkCondition1({?FashionCondition_EquipStar, StarLv, _None}) ->
    playerEquip:getStartLevel() >= StarLv;
checkCondition1({?FashionCondition_EquipNumber, Quality, Number}) ->
    playerPackage:getEquipNumAll(Quality) >= Number;
checkCondition1({?FashionCondition_PetNumber, Quality, Number}) ->
    playerPet:getPetNumber(Quality) >= Number;
checkCondition1(_Any) ->
    {false, -2}.


%% ====================================================================
%%用物品点亮时装
-spec useFashionItem(ItemUID :: integer(), UseItemID :: integer()
	, FashionID :: integer(), Time :: integer()) -> RealUseNum :: uint16().
useFashionItem(ItemUID, UseItemID, FashionID, ExpiresSecond) ->
    ?DEBUG_OUT("fashion use item ~w",
		[{ItemUID, UseItemID, FashionID, ExpiresSecond}]),

    Now = time:getUTCNowSec(),
    L = playerState:getFashionList(),
    case lists:keyfind(FashionID, #recFashion.fashionID, L) of
        #recFashion{endTime = 0} ->
            playerMsg:sendErrorCodeMsg(?ErrorCode_BagItemNotNeedUse),
            0;
        #recFashion{endTime = BaseEndTime} when BaseEndTime > Now ->
            playerMsg:sendErrorCodeMsg(?ErrorCode_BagItemNotNeedUse),
            0;
        _ ->
            case addFashionTime(FashionID, ExpiresSecond) of
                true ->
                    ?DEBUG_OUT("useItemEvent4Fashion ok"),
                    gs2uFashionOperateResult(FashionID, ?OperationTypeBuy, ExpiresSecond),
                    1;
                false ->
%%                    gs2uFashionOperateResult(FashionID, ?OperationTypeBuy, -1),
                    0
            end
    end.

%%点亮或延长时装时长
-spec addFashionTime(FashionID :: integer(), ExpiresSecond :: integer()) -> boolean().
addFashionTime(FashionID, ExpiresSecond) ->
    Now = time:getUTCNowSec(),
    PlayerID = playerState:getRoleID(),
    FashionList = playerState:getFashionList(),

    %%客户端保证时间，正常的客户端都不会出错
    true = checkFashionTime(FashionID, ExpiresSecond),

    Ret =
        case lists:keyfind(FashionID, #recFashion.fashionID, FashionList) of
            #recFashion{endTime = 0} ->
                ok;
            #recFashion{endTime = EndTime1} = Fashion when ExpiresSecond > 0 ->
                NewFashionRec = Fashion#recFashion{endTime = calcExpireSeconds(EndTime1, ExpiresSecond)},
                L0 = lists:keystore(FashionID, #recFashion.fashionID, FashionList, NewFashionRec),
                {NewFashionRec, L0, false};
            _ ->
                playerAchieve:achieveEvent(?Achieve_Fashion, [1]),
                playerTask:updateTask(?TaskSubType_System, ?TaskSubType_System_Sub_Fashion),
                NewRec = #recFashion{roleID = PlayerID, fashionID = FashionID, endTime = calcExpireSeconds(Now, ExpiresSecond)},
				L0 = lists:keystore(FashionID, #recFashion.fashionID, FashionList, NewRec),
				newFashionAddPoint(FashionID),
                {NewRec, L0, true}
        end,

    case Ret of
        {#recFashion{} = Rec, L, SuitChange} ->
            playerSave:saveFashion(Rec),
            playerState:setFashionList(L),
            checkSuit(SuitChange, ?EquipOn),
            true;
        _ ->
            false
    end.

checkFashionTime(FashionID, ExpiresSecond) ->
    case getCfg:getCfgByArgs(cfg_fashion, FashionID) of
        #fashionCfg{timeLimit = [0]} ->
            ExpiresSecond =:= 0;
        #fashionCfg{timeLimit = [X]} ->
            X * ?One_Day_Second =:= ExpiresSecond;
        #fashionCfg{timeLimit = [0, X]} ->
            ExpiresSecond =:= 0 orelse X * ?One_Day_Second =:= ExpiresSecond;
        _ ->
            false
    end.
%% ====================================================================
calcExpireSeconds(_NowTime, 0) ->
    0;
calcExpireSeconds(NowTime, ExpiresSecond) ->
    NowTime + ExpiresSecond.

%% ====================================================================
newFashionBroadcast(SuitID) ->
    case getCfg:getCfgByArgs(cfg_fashionCollection, SuitID) of
        #fashionCollectionCfg{name = Name, is_Notice = 1} ->
            NoticeStr = stringCfg:getString(fashionSuit, [playerState:getName(), Name]),
            core:sendBroadcastNotice(NoticeStr),
            ok;
        _ ->
            skip
    end.


%%时装没过期才能上装
-spec checkFashionValid(FashionID :: integer()) -> boolean().
checkFashionValid(FashionID) ->
    try
        FashionList = playerState:getFashionList(),
        case lists:keyfind(FashionID, #recFashion.fashionID, FashionList) of
            #recFashion{endTime = EndTime} ->
                if
                    EndTime =:= 0 ->
                        true;
                    true ->
                        EndTime > time:getUTCNowSec()
                end;
            _ ->
                false
        end
    catch
        _:_ ->
            false
    end.

%% ====================================================================
%%会自动检查时装时间
-spec putOnClothes(Position :: integer(), FashionID :: integer()) -> boolean().
putOnClothes(Position, FashionID) when 0 =:= FashionID ->
    doPutOnClose(Position, FashionID, Position);
putOnClothes(Position, FashionID) ->
    case checkFashionValid(FashionID) of
        true ->
            case getCfg:getCfgPStack(cfg_fashion, FashionID) of
                #fashionCfg{subType = Type2} ->
                    doPutOnClose(Position, FashionID, Type2);
                _ ->
                    false
            end;
        _ ->
            doPutOnClose(Position, 0, Position),
            ?LOG_OUT("putOnClothes fail. position[~w],fid[~w] isvalid[false]", [Position, FashionID]),
            false
    end.

doPutOnClose(Position, FashionID, Type) ->
    case lists:member(Position, ?FashionPropIDs) of
        true ->
            if
                Position =:= Type ->
                    setFashionSlot(Position, FashionID),
                    playerPropSync:setInt(Position, FashionID);
                true ->
                    ok
            end;
        _ ->
            ?LOG_OUT("putOnClothes fail. position[~w],fid[~w] type[~w]", [Position, FashionID, Type]),
            false
    end.

%% ====================================================================
%%穿，卸操作
-spec operateFashionPosition(FashionID :: integer(), Flag :: boolean()) -> ok.
operateFashionPosition(FashionID, true) ->
    ?DEBUG_OUT("[DebugForFashion] putOnAndOffClothes FashionID:~p true", [FashionID]),
    Ret =
        case getCfg:getCfgPStack(cfg_fashion, FashionID) of
            #fashionCfg{subType = Position} ->
                putOnClothes(Position, FashionID);
            _ ->
                false
        end,
    gs2uFashionOperateResult(FashionID, ?OperationTypeOn, misc:convertBool2Int(Ret));

operateFashionPosition(FashionID, _Flag) ->
    ?DEBUG_OUT("[DebugForFashion] putOnAndOffClothes FashionID:~p _Flag:~p", [FashionID, _Flag]),
    Ret =
        case getCfg:getCfgPStack(cfg_fashion, FashionID) of
            #fashionCfg{subType = Position} ->
                putOnClothes(Position, 0);
            _ ->
                false
        end,
    gs2uFashionOperateResult(FashionID, ?OperationTypeOff, misc:convertBool2Int(Ret)).

%% ====================================================================
%% 时装过期检查
checkTimeout(IsNotify) ->
    Now = time:getUTCNowSec(),
    L1 = playerState:getFashionList(),
    {L2, Flag, SuitFlag} = lists:foldl(
        fun(#recFashion{endTime = EndTime} = Rec, {Acc, Calc, SuitChanges}) ->
            if
                EndTime =:= 0 ->
                    {[Rec | Acc], Calc, SuitChanges};
                EndTime - Now > 0 ->
                    {[Rec | Acc], Calc, SuitChanges};
                true ->
                    {Acc, true, true}
            end
        end, {[], false, false}, L1),
    playerState:setFashionList(L2),
    checkSuit(SuitFlag, ?EquipOff),
    case Flag andalso IsNotify of
        true ->
            playerForce:calcPlayerForce(?PlayerFashionColForce, IsNotify);
        _ ->
            skip
    end.

%% ====================================================================
%%回馈client操作结果(0: 购买 1：穿戴 2：卸载)
gs2uFashionOperateResult(FashionID, Type, Value) ->
    ?DEBUG_OUT("[DebugForFashion] gs2uFashionOperateResult FashionID:~p Type:~p Value:~p", [FashionID, Type, Value]),
    Msg = #pk_GS2U_FashionResult{fashionID = FashionID, type = Type, value = Value},
    playerMsg:sendNetMsg(Msg),
    case Type of
        ?OperationTypeBuy when Value >= 0 ->
            playerSevenDayAim:updateCondition(?SevenDayAim_FashionCount, [FashionID]);
        _ ->
            ok
    end.

%%着装时，记录插槽上的时装id
%%1）登录时，过期后，FashionID=0
%%2）换装时，外部逻辑必须先卸再穿
-spec setFashionSlot(SlotID :: integer(), FashionID :: integer()) -> ok.
setFashionSlot(SlotID, FashionID) ->
    OldList = playerState:getFashionSlotList(),
    NewItem = #recFashionOnLoad{roleID = playerState:getRoleID(), index = SlotID, value = FashionID},
    NewList = lists:keystore(SlotID, #recFashionOnLoad.index, OldList, NewItem),
    playerState:setFashionSlotList(NewList),
    ok.


%% ====================================================================
checkSuit(true, Op) ->
    suitChange(Op);
checkSuit(_, _) ->
    ok.

suitChange(?EquipOff) ->
    %%
    L1 = playerState:getFashionSuitList(),
    %% 新激活的套装列表
    L2 = makeExistFashionSuitList(),

    L3 = lists:subtract(L1, L2),
    playerState:setFashionSuitList(L2),
    changeFashionSuitProp(L3, ?EquipOff);
suitChange(?EquipOn) ->
    %%
    L1 = playerState:getFashionSuitList(),

    %% 新激活的套装列表
    L2 = makeExistFashionSuitList(),

    L3 = lists:subtract(L2, L1),
    playerState:setFashionSuitList(L2),
    ?DEBUG_OUT("  [~p]", [L3]),
    changeFashionSuitProp(L3, ?EquipOn),
    [newFashionSuitAddPoint(SuitID) || SuitID <- L3],
    [newFashionBroadcast(SuitID) || SuitID <- L3];
suitChange(_) ->
    ok.

newFashionAddPoint(FashionID)->
	OldPoint = playerPropSync:getProp(?PriProp_FashionRoomExp),
	#fashionCfg{fashionPoint = AddPoint} = getCfg:getCfgByArgs(cfg_fashion, FashionID),
	playerPropSync:setProp(?PriProp_FashionRoomExp, OldPoint + AddPoint),
	?LOG_OUT("player[~p][~p] active fashion[~p], addPoint[~p+~p=~p]",
		[playerState:getRoleID(), self(), FashionID, OldPoint, AddPoint, OldPoint + AddPoint]
	),
	ok.

newFashionSuitAddPoint(SuitID)->
    OldPoint = playerPropSync:getProp(?PriProp_FashionRoomExp),
    #fashionCollectionCfg{suitPoint = AddPoint} = getCfg:getCfgByArgs(cfg_fashionCollection, SuitID),
    playerPropSync:setProp(?PriProp_FashionRoomExp, OldPoint + AddPoint),
    ?LOG_OUT("player[~p][~p] active fashionSuit[~p], addPoint[~p+~p=~p]",
        [playerState:getRoleID(), self(), SuitID, OldPoint, AddPoint, OldPoint + AddPoint]
    ),
    ok.


%% ====================================================================
initFashionSuit() ->
    L1 = makeExistFashionSuitList(),
    playerState:setFashionSuitList(L1),
    changeFashionSuitProp(L1, ?EquipOn).

haveFashionSuit2(FashionIDList, SuitID) ->
    SelfSex = playerState:getSex(),
    case getCfg:getCfgByArgs(cfg_fashionCollection, SuitID) of
        #fashionCollectionCfg{fashionIDGroup = L1, gender = Sex} when Sex =:= SelfSex orelse Sex =:= 0 ->
            case L1 of
                _ when is_list(L1) ->
                    L3 = lists:subtract(L1, FashionIDList),
                    length(L3) =< 0;
                _ ->
                    false
            end;
        _ ->
            false
    end.

%% ====================================================================
-spec changeFashionSuitProp(FashionSuitID, Op) -> ok|skip when FashionSuitID :: list(), Op :: ?EquipOn | ?EquipOff.
changeFashionSuitProp([], _) ->
    ok;
changeFashionSuitProp([FashionSuitID | L], Op) ->
    doChangeFashionSuitProp(FashionSuitID, Op),
    changeFashionSuitProp(L, Op).

doChangeFashionSuitProp(FashionSuitID, Operate) ->
    case getCfg:getCfgByArgs(cfg_fashionCollection, FashionSuitID) of
        #fashionCollectionCfg{paladin = Warrior, wizard = Mage, assassin = Assassin} ->
            Career = playerState:getCareer(),
            PropList = case ?Career2CareerMain(Career) of
                           ?CareerMain_1_Warrior ->
                               %% 骑士
                               Warrior;
                           ?CareerMain_2_Magician ->
                               %% 魔法师
                               Mage;
                           ?CareerMain_3_Bravo ->
                               %% 刺客
                               Assassin;
                           _ ->
                               ?ERROR_OUT("gold weapon getPropList error Career[~p]", [Career]),
                               []
                       end,
            playerCalcProp:changeProp_CalcType(PropList, Operate, true),
            ok;
        _ ->
            ?ERROR_OUT("fashion suit config not exist,key:~p", [FashionSuitID])
    end.

%%
makeExistFashionSuitList() ->
    L1 = getExistFashionIDList(true),
    L2 = getCfgSuitIDList(),

    %% 新激活的套装列表
    lists:foldl(
        fun(SuitID, NewSuitList) ->
            case haveFashionSuit2(L1, SuitID) of
                true ->
                    [SuitID | NewSuitList];
                _ ->
                    NewSuitList
            end
        end, [], L2).

%%
getExistFashionIDList(OnlyForver) ->
    L0 = playerState:getFashionList(),
    [FashionID ||
        #recFashion{
            fashionID = FashionID
            , endTime = EntTime
        } <- L0
        , OnlyForver =:= false orelse EntTime =:= 0].

%%
getCfgSuitIDList() ->
    getCfg:get1KeyList(cfg_fashionCollection).


