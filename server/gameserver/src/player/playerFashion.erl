%% @author zhengzhichun
%% @doc @todo Add description to playerFashion.


-module(playerFashion).
-include("gsInc.hrl").
-include("common/playerPropSyncDefine.hrl").
-include("playerPrivate.hrl").

-define(OperationTypeBuy, 0).
-define(OperationTypeOn, 1).
-define(OperationTypeOff, 2).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initFashion/1,
	initFashionSlot/1,
	getShowFashions/0,
	checkFashionTimeOut/1,
	gs2uFashionOperateResult/3
]).

-export([
	putOnAndOffClothes/2,
	useDiamond4fashion/2,
	useItemEvent4Fashion/4,
	activeFashionSuit/2
]).

-export([
	onLogin/0
]).

onLogin() ->
	sendFashionList2Client(),
	sendActiveFashionSuitList2Client().

getActiveFashionSuitList() ->
	playerPropSync:getProp(?SerProp_ActiveFashionSuitList).

setActiveFashionSuitList(L) ->
	playerPropSync:setAny(?SerProp_ActiveFashionSuitList, L).

activeFashionSuit(SuitID, true) ->
	suitChangePassive(SuitID, ?EquipOn);
activeFashionSuit(SuitID, _) ->
	suitChangePassive(SuitID, ?EquipOff).

%%玩家登录时初始化时装
-spec initFashion(MyFashionList :: [#recFashion{}, ...]) -> ok.
initFashion([#recFashion{} | _] = MyFashionList) ->
	?DEBUG_OUT("zzc===FashionList========~w", [MyFashionList]),
	playerState:setFashionList(MyFashionList),
	checkFashionTimeOut(false),
	initFashionSuit(),
	playerForce:calcPlayerForce(?PlayerFashionColForce, false),
	ok.

%%拥有的时装下来后，再看着在身上的过期没
-spec initFashionSlot(List) -> ok when List :: [#recFashionOnLoad{}].
initFashionSlot([#recFashionOnLoad{} | _] = List) ->
	?DEBUG_OUT("zzc===initFashionSlot========[~p]", [List]),
	playerState:setFashionSlotList(List),
	equipOnFashionOnInit(),
	ok.

%%getFashinSlotList()->
%%	L0 = [?PubProp_FashionMajorHand,?PubProp_FashionMinorHand,?PubProp_FashionClothes],
%%	lists:foldl(
%%		fun(PropID, Acc) ->
%%			FashionID = playerPropSync:getProp(PropID),
%%			Rec = makeFashionSlotRec(FashionID, PropID),
%%			[Rec | Acc]
%%		end, [], L0).
%%
%%makeFashionSlotRec(FashionID, Position)when FashionID =< 0->
%%	RoleID = playerState:getRoleID(),
%%	#recFashionOnLoad{roleID = RoleID, index = Position, value = 0, endTime = 0 };
%%makeFashionSlotRec(FashionID, Position)->
%%	RoleID = playerState:getRoleID(),
%%	L = playerState:getFashionList(),
%%	case lists:keyfind(FashionID, #recFashion.fashionID, L) of
%%		#recFashion{endTime= BaseEndTime} ->
%%			#recFashionOnLoad{roleID = RoleID, index = Position, value = FashionID, endTime = BaseEndTime};
%%		_ ->
%%			#recFashionOnLoad{roleID = RoleID, index = Position, value = 0, endTime = 0 }
%%	end.

-spec getOnBodyFashions() -> [Fashion :: integer(), ...].
getOnBodyFashions() ->
	Ma = playerPropSync:getProp(?PubProp_FashionMajorHand),
	Mi = playerPropSync:getProp(?PubProp_FashionHead),
	C = playerPropSync:getProp(?PubProp_FashionClothes),
	FashionIDS = lists:foldl(fun
		                         (Item, Acc) when erlang:is_integer(Item) ->
			                         [Item | Acc];
		                         (_, Acc) ->
			                         Acc
	                         end, [], [Ma, Mi, C]),
	FashionIDS.

%%获取可显示的时间
-spec getShowFashions() -> [Fashion :: integer(), ...].
getShowFashions() ->
	case playerPropSync:getProp(?PubProp_FashionVisibleFlag) of
		0 ->
			getOnBodyFashions();
		_ ->
			[]
	end.

%%用物品点亮时装
-spec useItemEvent4Fashion(ItemUID :: integer(), UseItemID :: integer(), FashionID :: integer(), Time :: integer()) -> RealUseNum :: uint16().
useItemEvent4Fashion(ItemUID, UseItemID, FashionID, ExpiresSecond) ->
	?DEBUG_OUT("fashion use item ~w", [{ItemUID, UseItemID, FashionID, ExpiresSecond}]),

	Now = time:getUTCNowSec(),
	L = playerState:getFashionList(),
	case lists:keyfind(FashionID, #recFashion.fashionID, L) of
		#recFashion{endTime = BaseEndTime} when erlang:is_integer(BaseEndTime) andalso BaseEndTime =:= ?ForeverFashionSecond ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagItemNotNeedUse),
			0;
		#recFashion{endTime = BaseEndTime} when erlang:is_integer(BaseEndTime) andalso BaseEndTime > Now ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagItemNotNeedUse),
			0;
		_ ->
			case addFashionTime(FashionID, ExpiresSecond) of
				true ->
					?DEBUG_OUT("useItemEvent4Fashion ok"),
					gs2uFashionOperateResult(FashionID, ?OperationTypeBuy, ExpiresSecond),
					1;
				false ->
					gs2uFashionOperateResult(FashionID, ?OperationTypeBuy, 0),
					0
			end
	end.

%%点亮或延长时装时长
-spec addFashionTime(FashionID :: integer(), ExpiresSecond :: integer()) -> boolean().
addFashionTime(FashionID, ExpiresSecond) ->
	Now = time:getUTCNowSec(),
	PlayerID = playerState:getRoleID(),
	FashionList = playerState:getFashionList(),

	Ret =
		case lists:keyfind(FashionID, #recFashion.fashionID, FashionList) of
			#recFashion{endTime = EndTime} when EndTime =:= ?ForeverFashionSecond ->
				ok;
			#recFashion{endTime = EndTime1} = Fashion ->
				NewFaionRec = Fashion#recFashion{endTime = calcExpireSeconds(EndTime1, ExpiresSecond)},
				L0 = lists:keystore(FashionID, #recFashion.fashionID, FashionList, NewFaionRec),
				{NewFaionRec, L0, false};
			_ ->
				playerAchieve:achieveEvent(?Achieve_Fashion, [1]),
				NewRec = #recFashion{roleID = PlayerID, fashionID = FashionID, endTime = calcExpireSeconds(Now, ExpiresSecond)},
				L1 = [NewRec | FashionList],
				fashionChange(FashionID, ?EquipOn),
				playerForce:calcPlayerForce(?PlayerFashionColForce, true),
				addNewFashion(FashionID),
				{NewRec, L1, true}
		end,

	case Ret of
		{#recFashion{} = Rec, L, SuitChange} ->
			playerState:setFashionList(L),
			playerSave:saveFashion(Rec),
			checkSuit(SuitChange, ?EquipOn),
			true;
		_ ->
			false
	end.

calcExpireSeconds(NowTime, ExpiresSecond) ->
	case NowTime + ExpiresSecond >= ?ForeverFashionSecond of
		true ->
			?ForeverFashionSecond;
		_ ->
			NowTime + ExpiresSecond
	end.

addNewFashion(FashionID) ->
	case getCfg:getCfgPStack(cfg_fashion, FashionID) of
		#fashionCfg{is_Notice = 1, name = Name} ->
			NoticeStr = getNoticeStr(playerState:getSex(), Name),
			core:sendBroadcastNotice(NoticeStr);
		_ ->
			ok
	end.

getNoticeStr(?SexWoman, FashionName) ->
	stringCfg:getString(getFashionNotice_female, [playerState:getRoleID(), playerState:getPlayerCode(), playerState:getName(), FashionName]);
getNoticeStr(_, FashionName) ->
	stringCfg:getString(getFashionNotice_male, [playerState:getRoleID(), playerState:getPlayerCode(), playerState:getName(), FashionName]).


%%时装没过期才能上装
-spec canPutOn4Time(FashionID :: integer()) -> boolean().
canPutOn4Time(FashionID) ->
	try
		FashionList = playerState:getFashionList(),
		case lists:keyfind(FashionID, #recFashion.fashionID, FashionList) of
			#recFashion{endTime = EndTime} ->
				if
					EndTime =:= ?ForeverFashionSecond ->
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

%%会自动检查时装时间
-spec putOnClothes(Position :: integer(), FashionID :: integer()) -> boolean().
putOnClothes(Position, FashionID) when 0 =:= FashionID ->
	doPutOnClose(Position, FashionID, Position);
putOnClothes(Position, FashionID) ->
	case canPutOn4Time(FashionID) of
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
	case Position of
		?PubProp_FashionMajorHand when Type =:= Position ->
			setFashionSolt(Position, FashionID),
			playerPropSync:setInt(?PubProp_FashionMajorHand, FashionID);
		?PubProp_FashionHead when Type =:= Position ->
			setFashionSolt(Position, FashionID),
			playerPropSync:setInt(?PubProp_FashionHead, FashionID);
		?PubProp_FashionClothes when Type =:= Position ->
			setFashionSolt(Position, FashionID),
			playerPropSync:setInt(?PubProp_FashionClothes, FashionID);
		_ ->
			?LOG_OUT("putOnClothes fail. position[~w],fid[~w] type[~w]", [Position, FashionID, Type]),
			false
	end.


%%检查身上的时装是否有效，过期就不能再穿
-spec equipOnFashionOnInit() -> ok.
equipOnFashionOnInit() ->
	MyFashionSlotList = playerState:getFashionSlotList(),
	?DEBUG_OUT("checkBodyClothes[~p]", [MyFashionSlotList]),
	lists:foreach(
		fun(#recFashionOnLoad{index = Position, value = FashionID}) ->
			putOnClothes(Position, FashionID)
		end, MyFashionSlotList),
	ok.

%%穿，卸操作
-spec putOnAndOffClothes(FashionID :: integer(), Flag :: boolean()) -> ok.
putOnAndOffClothes(FashionID, true) ->
	?DEBUG_OUT("[DebugForFashion] putOnAndOffClothes FashionID:~p true", [FashionID]),
	Ret =
		case getCfg:getCfgPStack(cfg_fashion, FashionID) of
			#fashionCfg{subType = Position} ->
				%%发须先卸
				putOnClothes(Position, FashionID);
			_ ->
				false
		end,
	gs2uFashionOperateResult(FashionID, ?OperationTypeOn, misc:convertBool2Int(Ret));

putOnAndOffClothes(FashionID, _Flag) when erlang:is_boolean(_Flag) ->
	?DEBUG_OUT("[DebugForFashion] putOnAndOffClothes FashionID:~p _Flag:~p", [FashionID, _Flag]),
	Ret =
		case getCfg:getCfgPStack(cfg_fashion, FashionID) of
			#fashionCfg{subType = Position} ->
				putOnClothes(Position, 0);
			_ ->
				false
		end,
	gs2uFashionOperateResult(FashionID, ?OperationTypeOff, misc:convertBool2Int(Ret)).

%%玩家登录时，下发已经点亮的时装列表
-spec sendFashionList2Client() -> ok.
sendFashionList2Client() ->
	Now = time:getUTCNowSec(),
	PlayerFasionList = playerState:getFashionList(),
	L1 = lists:foldl(
		fun(#recFashion{fashionID = FashionID, endTime = EndTime}, Acc) ->
			if
				EndTime =:= ?ForeverFashionSecond ->
					[#pk_FashionInfo{time = ?ForeverFashionSecond, fashionID = FashionID} | Acc];
				EndTime - Now > 0 ->
					[#pk_FashionInfo{time = EndTime - Now, fashionID = FashionID} | Acc];
				true ->
					Acc
			end
		end, [], PlayerFasionList),

	Msg = #pk_GS2U_FashionList{datas = L1},
	?DEBUG_OUT("gs2uFashionInitList[~p]", [Msg]),
	playerMsg:sendNetMsg(Msg).


sendActiveFashionSuitList2Client() ->
	L = getActiveFashionSuitList(),
	Msg = #pk_GS2U_ActiveFashionSuitList{activeFashionSuitList = L},
	playerMsg:sendNetMsg(Msg).

%% 时装过期检查
checkFashionTimeOut(IsNotify) ->
	Now = time:getUTCNowSec(),
	RoleID = playerState:getRoleID(),
	L1 = playerState:getFashionList(),
	{L2, Flag, SuitFlag} = lists:foldl(
		fun(#recFashion{fashionID = FashionID, endTime = EndTime} = Rec, {Acc, Calc, SuitChanges}) ->
			if
				EndTime =:= ?ForeverFashionSecond ->
					{[Rec | Acc], Calc, SuitChanges};
				EndTime - Now > 0 ->
					{[Rec | Acc], Calc, SuitChanges};
				true ->
					?LOG_OUT("role[~p],fashion timeout[~w]", [RoleID, Rec]),
					fashionChange(FashionID, ?EquipOff),
					{Acc, true, true}
			end
		end, {[], false, false}, L1),
	playerState:setFashionList(L2),
%%	checkSuit(SuitFlag, ?EquipOff),
	onFashionTimeOut(SuitFlag),
	case Flag =:= true andalso IsNotify =:= true of
		true ->
			playerForce:calcPlayerForce(?PlayerFashionColForce, IsNotify);
		_ ->
			skip
	end.


%%回馈client操作结果(0: 购买 1：穿戴 2：卸载)
-spec gs2uFashionOperateResult(FashionID :: integer(), Type :: 1|2|0, Value :: uint()) -> ok.
gs2uFashionOperateResult(FashionID, Type, Value) ->
	?DEBUG_OUT("[DebugForFashion] gs2uFashionOperateResult FashionID:~p Type:~p Value:~p", [FashionID, Type, Value]),
	Msg = #pk_GS2U_FashionResult{fashionID = FashionID, type = Type, value = Value},
	playerMsg:sendNetMsg(Msg).

%%着装时，记录插槽上的时装id
%%1）登录时，过期后，FashionID=0
%%2）换装时，外部逻辑必须先卸再穿
-spec setFashionSolt(SoltID :: integer(), FashionID :: integer()) -> ok.
setFashionSolt(SoltID, FashionID) ->
	OldList = playerState:getFashionSlotList(),
	NewItem = #recFashionOnLoad{roleID = playerState:getRoleID(), index = SoltID, value = FashionID},
	NewList =
		case lists:keyfind(SoltID, #recFashionOnLoad.index, OldList) of
			false ->
				[NewItem | OldList];
			#recFashionOnLoad{value = OldFashionID} when erlang:is_integer(OldFashionID) andalso OldFashionID =/= FashionID ->
				lists:keyreplace(SoltID, #recFashionOnLoad.index, OldList, NewItem);
			#recFashionOnLoad{} ->
				lists:keyreplace(SoltID, #recFashionOnLoad.index, OldList, NewItem)
		end,
	playerState:setFashionSlotList(NewList),
	ok.


%% 时装过期时，调整套装属性
fashionChange(FashionID, ?EquipOff) ->
	%%
	addFashionProp(FashionID, ?EquipOff);
%%	%%
%%	L1 = playerState:getFashionSuitList(),
%%	%% 新激活的套装列表
%%	L2 = makeExistFashionSuitList(),
%%
%%	L3 = lists:subtract(L1, L2),
%%	playerState:setFashionSuitList(L2 ),
%%	changeFashionSuitProp(L3, ?EquipOff);
fashionChange(FashionID, ?EquipOn) ->
	%%
	addFashionProp(FashionID, ?EquipOn);

%%	%%
%%	L1 = playerState:getFashionSuitList(),
%%
%%	%% 新激活的套装列表
%%	L2 = makeExistFashionSuitList(),
%%
%%	L3 = lists:append(L2, L1),
%%	playerState:setFashionSuitList(L2),
%%	changeFashionSuitProp(L3, ?EquipOn);
fashionChange(_, _) ->
	ok.


checkSuit(true, _Op) ->
	skip; %%策划说需要改成手动激活，保留自动激活机制原因你懂的
%%	suitChange(Op);
checkSuit(_, _) ->
	ok.

%suitChange(?EquipOff) ->
%	%%
%	L1 = playerState:getFashionSuitList(),
%	%% 新激活的套装列表
%	L2 = makeExistFashionSuitList(),
%
%	L3 = lists:subtract(L1, L2),
%	playerState:setFashionSuitList(L2),
%	changeFashionSuitProp(L3, ?EquipOff);
%suitChange(?EquipOn) ->
%	%%
%	L1 = playerState:getFashionSuitList(),
%
%	%% 新激活的套装列表
%	L2 = makeExistFashionSuitList(),
%
%	L3 = lists:subtract(L2, L1),
%	playerState:setFashionSuitList(L2),
%	?DEBUG_OUT("  [~p]", [L3]),
%	changeFashionSuitProp(L3, ?EquipOn);
%suitChange(_) ->
%	ok.

onFashionTimeOut(false) ->
	skip;
onFashionTimeOut(_) ->
	L1 = getActiveFashionSuitList(),
	L2 = makeExistFashionSuitList(),
	L3 = lists:subtract(L1, L2),
	lists:foreach(
		fun(SuitID) ->
			suitChangePassive(SuitID, ?EquipOff)
		end, L3).


suitChangePassive(SuitID, ?EquipOn) ->
	L1 = getActiveFashionSuitList(),
	%% 新激活的套装列表
	L2 = makeExistFashionSuitList(),
	case lists:member(SuitID, L1) of
		false ->
			case lists:member(SuitID,L2) of
				true ->
					activeFashionSuitChange(SuitID, ?EquipOn),
					changeFashionSuitProp([SuitID], ?EquipOn),
					playerForce:calcPlayerForce(?PlayerFashionColForce, true);
				_ ->
					skip
			end;
		_ ->
			skip
	end;
suitChangePassive(SuitID, ?EquipOff) ->
	L1 = getActiveFashionSuitList(),
	case lists:member(SuitID, L1) of
		true ->
			activeFashionSuitChange(SuitID, ?EquipOff),
			changeFashionSuitProp([SuitID], ?EquipOff),
			playerForce:calcPlayerForce(?PlayerFashionColForce, true);
		_ ->
			false
	end,
	ok.


activeFashionSuitChange(SuitID, ?EquipOn) ->
	L1 = getActiveFashionSuitList(),
	setActiveFashionSuitList([SuitID | L1]),
	sendActiveFashionSuitList2Client();
activeFashionSuitChange(SuitID, _) ->
	L1 = getActiveFashionSuitList(),
	L2 = lists:delete(SuitID, L1),
	setActiveFashionSuitList(L2),
	sendActiveFashionSuitList2Client().

%%身上时装变化，同步更新玩家的战斗属性
-spec addFashionProp(FashionID, Operate) -> ok|skip when
	FashionID :: integer(), Operate :: ?EquipOn | ?EquipOff.
addFashionProp(0, _Operate) ->
	skip;
addFashionProp(FashionID, Operate) ->
	case getCfg:getCfgPStack(cfg_fashion, FashionID) of
		[] ->
			skip;
		#fashionCfg{property1 = PropList} ->
			?LOG_OUT("setBattleProp4Fashion {FashionID,Operate}=~w", [{FashionID, Operate}]),
			playerCalcProp:changeProp_CalcType(PropList,Operate, true),
			playerForce:calcPlayerForce(?PlayerFashionColForce, true)
	end.

%%
initFashionSuit() ->
	L1 = makeExistFashionSuitList(),
	L2 = getExistFashionIDList(),
	playerState:setFashionSuitList(L1),
	changeFashionSuitProp(L1, ?EquipOn),
	lists:foreach(fun(FashionID) -> addFashionProp(FashionID, ?EquipOn) end, L2).

%%
%%haveFashionSuit1(ExistSuitList, SuitID)->
%%	lists:member(ExistSuitList, SuitID).

haveFashionSuit2(FashionIDList, SuitID) ->
	SelfSex = playerState:getSex(),
	case getCfg:getCfgByArgs(cfg_fashionCollection, SuitID) of
		#fashionCollectionCfg{fashionIDGroup = L1, gender = Sex} when Sex =:= SelfSex orelse Sex =:= 0 ->
			case getSuitFashionListByCarrer(L1, playerState:getCareer()) of
				L2 when is_list(L2) ->
					L3 = lists:subtract(L2, FashionIDList),
					length(L3) =< 0;
				_ ->
					false
			end;
		_ ->
			false
	end.

getSuitFashionListByCarrer(L, _Career) ->
	L.
%% 以前说的要区分职业
%%	case length(L) >= Carrer of
%%		true ->
%%			lists:nth(Carrer, L);
%%		_ ->
%%			false
%%	end.


%%
-spec changeFashionSuitProp(FashionSuitID, Op) -> ok|skip when FashionSuitID :: list(), Op :: ?EquipOn | ?EquipOff.
changeFashionSuitProp([], _) ->
	ok;
changeFashionSuitProp([FashionSuitID | L], Op) ->
	doChangeFashionSuitProp(FashionSuitID, Op),
	changeFashionSuitProp(L, Op).

doChangeFashionSuitProp(FashionSuitID, Operate) ->
	case getCfg:getCfgByArgs(cfg_fashionCollection, FashionSuitID) of
		#fashionCollectionCfg{	paladin = Warrior, wizard = Mage, assassin = Assassin} ->
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
			playerCalcProp:changeProp_CalcType(PropList,Operate, true),
			?DEBUG_OUT("zzc=========fashionCollectionCfg  ~w", [PropList]);
		_ ->
			?ERROR_OUT("fashion suit config not exist,key:~p", [FashionSuitID])
	end.

%%
makeExistFashionSuitList() ->
	L1 = getExistFashionIDList(),
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
getExistFashionIDList() ->
	L0 = playerState:getFashionList(),
	[FashionID || #recFashion{fashionID = FashionID} <- L0].

%%
getCfgSuitIDList() ->
	getCfg:get1KeyList(cfg_fashionCollection).


%%非绑钻石购买时装
-spec useDiamond4fashion(FashionID :: integer(), _ExpiresSecond :: integer()) -> ok.
useDiamond4fashion(FashionID, _ExpiresSecond) ->
	L = playerState:getFashionList(),
	case getCfg:getCfgPStack(cfg_fashion, FashionID) of
		#fashionCfg{type = 2, cost = CostMoney, limitTime = LimitTimeDays} when CostMoney > 0 ->
			LifeTime = case LimitTimeDays =:= 0 of
				           true -> ?ForeverFashionSecond;
				           _ -> LimitTimeDays * ?One_Day_Second
			           end,
			case lists:keyfind(FashionID, #recFashion.fashionID, L) of
				#recFashion{endTime = BaseEndTime} when erlang:is_integer(BaseEndTime) andalso BaseEndTime =:= ?ForeverFashionSecond ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BagItemNotNeedUse),
					false;
				_ ->
					PLog = #recPLogTSMoney{
						reason = ?CoinUseFashionClothes,
						param = FashionID,
						target = ?PLogTS_Fashion,
						source = ?PLogTS_PlayerSelf
					},
					case playerMoney:decCoin(?CoinTypeDiamond, CostMoney, PLog) of
						true ->
							case addFashionTime(FashionID, LifeTime) of
								true ->
									?DEBUG_OUT("useDiamond4fashion ok"),
									gs2uFashionOperateResult(FashionID, ?OperationTypeBuy, LifeTime);
								false ->
									gs2uFashionOperateResult(FashionID, ?OperationTypeBuy, 0)
							end;
						_ ->
							?LOG_OUT("useDiamond4fashion fail[CoinTypeDiamond not enough]FID:~w", [FashionID]),
							playerMsg:sendErrorCodeMsg(?ErrorCode_TradeDiamond)
					end
			end;
		_ ->
			skip
	end.

