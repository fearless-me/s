%%
%% @doc @todo觉醒系统.

%% 20161031 女神系统与觉醒技能分离，所以叫觉醒系统已经不准确了。原觉醒技能转移到器灵（原神器）模块中实现，参考playerGoldWeapon

-module(playerGoddess).
-include("playerPrivate.hrl").

%%
%%-define(AddProp, 0).    %%增加属性
%%-define(DelProp, 1).    %%删除属性
%%
%%-export([
%%	autoActiveCard/1,
%%	sendWakeList2ClientOnLogin/0,
%%	initRoleWake/0,
%%	upGradeWake/1,
%%	getRPWakeInfo/0,
%%	gmWakeUp/0,
%%	onKeyUpWakeInfo/1,
%%	sendWakeList/1
%%]).
%%
%%-export([
%%	unlockGoddess/1,
%%	callGoddess/1,
%%	unlockGoddessState/2,
%%	changeGoddessState/2
%%]).
%%
%%
%%unlockGoddess(CardID) ->
%%	List = playerState:getWakes(),
%%	case lists:keyfind(CardID, #recWake.cardID, List) of
%%		#recWake{activeProgress = ?ProgressMax} = Wake ->
%%			NewWake = Wake#recWake{activeProgress = ?ProgressUnlocked},
%%			saveWakeAndSend(NewWake),
%%			%%激活女神成就
%%			cardActiveProgress(NewWake);
%%		_ ->
%%			skip
%%	end,
%%	ok.
%%
%%
%%callGoddess(CardID) ->
%%	case checkIsActive(CardID) of
%%		#recWake{curState = State, curLevel = Level} ->
%%			{OldGoddessID, OldGoddessLevel, _} = getCallGoddessInfo(),
%%			setCallGoddessID(CardID, Level, State),
%%			onCalledCard(OldGoddessID, OldGoddessLevel, CardID);
%%		_ ->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_AwakenCardNotActive)
%%	end,
%%	ok.
%%unlockGoddessState(CardID, State) ->
%%%%	case checkIsActive(CardID) of
%%%%		#recWake{curLevel = Level, unLockStateMax = UnlockMax} = Wake when UnlockMax < State ->
%%%%			#transformCfg{stateMax = MaxState} = getCfg:getCfgByArgs(cfg_transform, CardID, Level),
%%%%			case MaxState >= State of
%%%%				true ->
%%%%					NewWake = Wake#recWake{unLockStateMax = State},
%%%%					saveWakeAndSend(NewWake),
%%%%					changeWakeProp(Level, CardID, UnlockMax, ?DelProp),
%%%%					changeWakeProp(Level, CardID, State, ?AddProp);
%%%%				_ ->
%%%%					skip
%%%%			end;
%%%%		_ ->
%%%%			playerMsg:sendErrorCodeMsg(?ErrorCode_AwakenCardNotActive)
%%%%	end,
%%	ok.
%%
%%
%%changeGoddessState(CardID, State) ->
%%	CalledID = getCallGoddessID(),
%%	case checkIsActive(CardID) of
%%		%%强制匹配召唤出的Card
%%		#recWake{cardID = CalledID, unLockStateMax = UnlockMax, curLevel = Level} = Wake when UnlockMax >= State ->
%%			NewWake = Wake#recWake{curState = State},
%%			saveWakeAndSend(NewWake),
%%			setCallGoddessID(CalledID, Level, State);
%%		#recWake{unLockStateMax = UnlockMax1} = Wake1 when UnlockMax1 >= State ->
%%			NewWake1 = Wake1#recWake{curState = State},
%%			saveWakeAndSend(NewWake1);
%%		_ ->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_AwakenCardNotActive)
%%	end,
%%	ok.
%%
%%
%%setCallGoddessID(CardID, Level, State) ->
%%	<<CallGoddessID:64>> = <<Level:32, State:16, CardID:16>>,
%%	playerPropSync:setInt64(?PubProp_ActiveGoddessID, CallGoddessID).
%%
%%getCallGoddessID() ->
%%	CallGoddessID = playerPropSync:getProp(?PubProp_ActiveGoddessID),
%%	<<_:32, _:16, CardID:16>> = <<CallGoddessID:64>>,
%%	CardID.
%%getCallGoddessInfo() ->
%%	CallGoddessID = playerPropSync:getProp(?PubProp_ActiveGoddessID),
%%	<<Level:32, State:16, CardID:16>> = <<CallGoddessID:64>>,
%%	{CardID, Level, State}.
%%%% ====================================================================
%%%% API functions
%%%% ====================================================================
%%
%%%%创建角色初始化觉醒
%%-spec initRoleWake() -> ok.
%%initRoleWake() ->
%%	AutoActiveCardID = autoActiveCardID(),
%%	CardIDList = getCfg:get1KeyList(cfg_transform),
%%	lists:foreach(
%%		fun(CardID) ->
%%			case checkCareer(CardID) of
%%				true ->
%%					{CurState, MaxState, Progress} =
%%						case AutoActiveCardID =:= CardID of
%%							true ->
%%								{1, 1, ?ProgressMax};
%%							_ ->
%%								{0, 0, 0}
%%						end,
%%					Wake = #recWake{
%%						cardID = CardID,
%%						curLevel = 1,
%%						activeProgress = Progress,
%%						curState = CurState,
%%						unLockStateMax = MaxState
%%					},
%%					saveDbWakeInfo(Wake),
%%					saveMemWakeInfo(Wake);
%%				_ ->
%%					skip
%%			end
%%		end, CardIDList),
%%	ok.
%%
%%autoActiveCardID() ->
%%	Career = playerState:getCareer(),
%%	case getCfg:getCfgByArgs(cfg_globalsetup, transformopenid) of
%%		#globalsetupCfg{setpara = V} ->
%%			case lists:keyfind(?Career2CareerBase(Career), 1, V) of
%%				{_, CardID} ->
%%					CardID;
%%				_ ->
%%					0
%%			end;
%%		_ ->
%%			0
%%	end.
%%
%%-spec sendWakeList2ClientOnLogin() -> ok.
%%sendWakeList2ClientOnLogin() ->
%%	Wakes = playerState:getWakes(),
%%	sendWakeList(Wakes),
%%	Fun =
%%		fun(#recWake{cardID = ID, curLevel = Level, unLockStateMax = LockState, activeProgress = Progress}) ->
%%			case Progress >= ?ProgressUnlocked of
%%				true ->
%%					changeWakeProp(Level, ID, LockState, ?AddProp);
%%				_ ->
%%					skip
%%			end
%%		end,
%%	lists:foreach(Fun, Wakes),
%%	onCalledCard(0, 0, getCallGoddessID()),
%%	playerForce:calcPlayerForce(?PlayerGoddessForce, true),
%%	ok.
%%
%%onCalledCard(OldGoddessID, OldGoddessLevel, CardID) when CardID > 0 ->
%%	case checkIsActive(CardID) of
%%		#recWake{curLevel = Level} ->
%%			callCardSkill(OldGoddessID, OldGoddessLevel, false),
%%			callCardSkill(CardID, Level, true);
%%		_ ->
%%			skip
%%	end;
%%onCalledCard(_, _, _) -> ok.
%%
%%callCardSkill(CardID, Level, false) when CardID > 0 andalso Level > 0 ->
%%	#transformCfg{activeSkills = [SkillID | _]} = getCfg:getCfgByArgs(cfg_transform, CardID, Level),
%%	playerSkill:delGoddessSkill(SkillID),
%%	ok;
%%callCardSkill(CardID, Level, true) ->
%%	#transformCfg{activeSkills = [SkillID | _]} = getCfg:getCfgByArgs(cfg_transform, CardID, Level),
%%	Msg = #pk_GS2U_GoddessActiveSkill{skillID = SkillID},
%%	playerMsg:sendNetMsg(Msg),
%%	playerSkill:addGoddessSkill(SkillID, 1);
%%%%1.通知客户端新技能
%%callCardSkill(_, _, _) -> ok.
%%
%%-spec autoActiveCard(TaskId :: int()) -> ok.
%%autoActiveCard(TaskId) ->
%%	case getCfg:get1KeyList(cfg_transform) of
%%		[] ->
%%			skip;
%%		L ->
%%			autoActiveCard1(L, TaskId)
%%	end,
%%	ok.
%%
%%autoActiveCard1([], _TaskId) ->
%%	ok;
%%autoActiveCard1([CardID | L], TaskId) ->
%%	doAutoActive(CardID, TaskId),
%%	autoActiveCard1(L, TaskId).
%%
%%doAutoActive(CardID, TaskId) ->
%%	case checkCareer(CardID) andalso checkActiveTask(CardID, TaskId) of
%%		true ->
%%			case addCardActiveProgress(TaskId, CardID) of
%%				#recWake{} = Wake ->
%%					saveWakeAndSend(Wake),
%%					cardActiveProgress(Wake);
%%				_ ->
%%					skip
%%			end;
%%		_ ->
%%			skip
%%	end,
%%	ok.
%%
%%cardActiveProgress(#recWake{cardID = CardID, curLevel = Level, unLockStateMax = LockState, activeProgress = ?ProgressUnlocked}) ->
%%	changeWakeProp(Level, CardID, LockState, ?AddProp),
%%	%%激活女神成就
%%	playerAchieve:achieveEvent(?Achieve_activate_goddess_1, [1]),
%%	playerForce:calcPlayerForce(?PlayerGoddessForce, true),
%%	ok;
%%cardActiveProgress(_) -> skip.
%%
%%addCardActiveProgress(TaskID, CardID) ->
%%	List = playerState:getWakes(),
%%	case lists:keyfind(CardID, #recWake.cardID, List) of
%%		#recWake{activeProgress = OldProgress} = Wake when OldProgress < ?ProgressMax ->
%%			case getCfg:getCfgByArgs(cfg_transform, CardID, 0) of
%%				#transformCfg{activeTaskList = [TaskIDMin, TaskIDMax]} ->
%%					NewProgress1 = OldProgress + 1 / (TaskIDMax - TaskIDMin + 1) * ?ProgressMax,
%%					NewProgress =
%%						case TaskID =:= TaskIDMax of
%%							true ->
%%								?ProgressMax;
%%							_ ->
%%								erlang:trunc(NewProgress1)
%%						end,
%%
%%					case NewProgress >= ?ProgressMax of
%%						true ->
%%							Wake#recWake{activeProgress = ?ProgressMax, curState = 1, unLockStateMax = 1};
%%						_ ->
%%							Wake#recWake{activeProgress = NewProgress}
%%					end;
%%				_ ->
%%					false
%%			end;
%%		_ ->
%%			false
%%	end.
%%
%%
%%-spec gmWakeUp() -> ok.
%%gmWakeUp() ->
%%	lists:foreach(
%%		fun(R) ->
%%			Wake = R#recWake{activeProgress = ?ProgressUnlocked},
%%			saveWakeAndSend(Wake),
%%			cardActiveProgress(Wake)
%%		end,
%%		playerState:getWakes()
%%	),
%%
%%%%	CardList = [],
%%%%	Fun =
%%%%		fun(CarID) ->
%%%%			NewWake = #recWake{
%%%%				cardID = CarID,
%%%%				curLevel = 20,
%%%%				curNum = 0,
%%%%				activeProgress = ?ProgressMax
%%%%			},
%%%%			saveDbWakeInfo(NewWake),
%%%%			saveMemWakeInfo(NewWake),
%%%%			changeWakeProp(20, CarID, ?AddProp)
%%%%		end,
%%%%	lists:foreach(Fun, CardList),
%%%%	Wakes = playerState:getWakes(),
%%%%	sendWakeList(Wakes),
%%%%	%%计算战斗力
%%%%	playerForce:calcPlayerForce(?PlayerGoddessForce, true),
%%	ok.
%%
%%
%%-spec upGradeWake(CardID :: uint()) -> ok.
%%upGradeWake(CardID) -> ok.
%%%%	PlayerLevel = playerState:getLevel(),
%%%%	case checkCareer(CardID) of
%%%%		true ->
%%%%			case checkIsActive(CardID) of
%%%%				false ->
%%%%					skip;
%%%%				#recWake{curLevel = Level, curNum = _Num} when Level >= PlayerLevel ->
%%%%					playerMsg:sendErrorCodeMsg(?ErrorCode_AwakenCardNotOutOfPlayerLevel);
%%%%				#recWake{curLevel = Level, unLockStateMax = LockState} = Wake ->
%%%%					case checkIsUp(Wake) of
%%%%						{true, Gold} ->
%%%%							changeWakeProp(Level, CardID, LockState, ?DelProp),
%%%%							changeWakeProp(Level + 1, CardID, LockState, ?AddProp),
%%%%							playerMoney:decCoin(?CoinTypeGold, Gold,
%%%%								#recPLogTSMoney{reason = ?CoinUseWakeUp, param = Level + 1, target = ?PLogTS_GradeWake, source = ?PLogTS_PlayerSelf}),
%%%%							NewWake = Wake#recWake{
%%%%								curNum = 0,
%%%%								curLevel = Level + 1
%%%%							},
%%%%							saveWakeAndSend(NewWake),
%%%%							%%计算战斗力
%%%%							playerForce:calcPlayerForce(?PlayerGoddessForce, true);
%%%%						{false, Error} ->
%%%%							playerMsg:sendErrorCodeMsg(Error)
%%%%					end
%%%%			end;
%%%%		_ ->
%%%%			skip
%%%%	end.
%%-spec onKeyUpWakeInfo(CardID :: uint()) -> ok.
%%onKeyUpWakeInfo(CardID) ->
%%	?DEBUG_OUT("[DebugForGoddess] CardID:~p", [CardID]),
%%	PlayerLevel = playerState:getLevel(),
%%	case checkCareer(CardID) of
%%		true ->
%%			case checkIsActive(CardID) of
%%				false ->
%%					?DEBUG_OUT("[DebugForGoddess] error CardID:~p", [CardID]),
%%					playerMsg:sendErrorCodeMsg(?ErrorCode_AwakenCardNotActive);
%%				#recWake{curLevel = Level} when Level >= PlayerLevel ->
%%					?DEBUG_OUT("[DebugForGoddess] error CardID:~p", [CardID]),
%%					playerMsg:sendErrorCodeMsg(?ErrorCode_AwakenCardNotOutOfPlayerLevel);
%%				#recWake{curLevel = _Level, activeProgress = ?ProgressMax} ->
%%					?DEBUG_OUT("[DebugForGoddess] error CardID:~p", [CardID]),
%%					skip;
%%				#recWake{curLevel = Level, curNum = Num, unLockStateMax = LockState} = Wake ->
%%					NewWake = case checkOnKeyConsumeEnouth(CardID, Num, Level + 1) of
%%						          {true, _ItemID1, ConsumeNum1, NewMaxState} ->
%%							          playerliveness:decTotalLivenessValue(ConsumeNum1),
%%							          MaxNumWake = Wake#recWake{curLevel = Level, curNum = Num + ConsumeNum1},
%%							          %%觉醒升级
%%							          case checkIsUp(MaxNumWake) of
%%								          {true, Gold} ->
%%									          ?DEBUG_OUT("[DebugForGoddess] OK CardID:~p", [CardID]),
%%									          changeWakeProp(Level, CardID, LockState, ?DelProp),
%%									          changeWakeProp(Level + 1, CardID, NewMaxState, ?AddProp),
%%									          playerMoney:decCoin(
%%										          ?CoinTypeGold,
%%										          Gold,
%%										          #recPLogTSMoney{
%%											          reason = ?CoinUseWakeUp,
%%											          param = Level + 1,
%%											          target = ?PLogTS_GradeWake,
%%											          source = ?PLogTS_PlayerSelf
%%										          }
%%									          ),
%%									          %%女神升级成就
%%									          playerTask:updateTask(?TaskSubType_System, ?TaskSubType_System_Sub_Goddess),
%%									          playerAchieve:achieveEvent(?Achieve_goddess_level, [1]),
%%									          Wake#recWake{curLevel = Level + 1, curNum = 0, unLockStateMax = NewMaxState};
%%								          {false, Error1} ->
%%									          ?DEBUG_OUT("[DebugForGoddess] error CardID:~p", [CardID]),
%%									          playerMsg:sendErrorCodeMsg(Error1),
%%									          MaxNumWake
%%							          end;
%%						          {false, ItemID2, ConsumeNum2} ->
%%							          ?DEBUG_OUT("[DebugForGoddess] error CardID:~p", [CardID]),
%%							          delItem([{ItemID2, ConsumeNum2}], ?ItemDeleteReasonWake),
%%							          Wake#recWake{curLevel = Level, curNum = Num + ConsumeNum2};
%%						          Error2 ->
%%							          ?DEBUG_OUT("[DebugForGoddess] error CardID:~p", [CardID]),
%%							          playerMsg:sendErrorCodeMsg(Error2),
%%							          error
%%					          end,
%%					case NewWake of
%%						#recWake{} ->
%%							saveWakeAndSend(NewWake),
%%							changeGoddessState(NewWake#recWake.cardID, NewWake#recWake.unLockStateMax),
%%							%%计算战斗力
%%							playerForce:calcPlayerForce(?PlayerGoddessForce, true);
%%						_ ->
%%							skip
%%					end;
%%				_E ->
%%					?DEBUG_OUT("[DebugForGoddess] error CardID:~p ~p", [CardID, _E]),
%%					skip
%%			end;
%%		_ ->
%%			?DEBUG_OUT("[DebugForGoddess] error CardID:~p", [CardID]),
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_AwakenCardNotActive)
%%	end.
%%%% ====================================================================
%%%% Internal functions
%%%% ====================================================================
%%
%%-spec checkIsActive(CardID :: uint()) -> false | #recWake{}.
%%checkIsActive(CardID) ->
%%	List = playerState:getWakes(),
%%	case lists:keyfind(CardID, #recWake.cardID, List) of
%%		#recWake{activeProgress = ?ProgressUnlocked} = Wake ->
%%			Wake;
%%		_ ->
%%			false
%%	end.
%%
%%-spec checkCareer(CardID :: uint()) -> boolean().
%%checkCareer(CardID) ->
%%	case getCfg:getCfgByArgs(cfg_transform, CardID, 0) of
%%		#transformCfg{class = Class} ->
%%			Career = playerState:getCareer(),
%%			?Career2CareerBase(Career) =:= Class;
%%		_ ->
%%			false
%%	end.
%%
%%checkActiveTask(CardID, TaskId) ->
%%	case getCfg:getCfgByArgs(cfg_transform, CardID, 0) of
%%		#transformCfg{activeTaskList = [TaskIDMin, TaskIDMax]} ->
%%			TaskId >= TaskIDMin andalso TaskId =< TaskIDMax;
%%		_ ->
%%			false
%%	end.
%%
%%-spec checkOnKeyConsumeEnouth(CardID :: uint(), Schedule :: uint(), Level :: uint()) -> uint() | {boolean(), uint(), uint()}.
%%checkOnKeyConsumeEnouth(CardID, Schedule, Level) ->
%%	case getCfg:getCfgByArgs(cfg_transform, CardID, Level) of
%%		#transformCfg{fragment = [ID, NeedNum], stateMax = MaxState} ->
%%			CurNum = playerliveness:getTotalLivenessValue(),%playerPackage:getItemNumByID(ID),
%%			if
%%				CurNum =:= 0 ->
%%					?ErrorCode_AwakenUpShenLi_Enough;
%%			%%够升一级了
%%				CurNum >= NeedNum - Schedule ->
%%					{true, ID, NeedNum - Schedule,MaxState};
%%%%				CurNum < NeedNum - Schedule ->
%%%%					{false, ID, CurNum};
%%				true ->
%%					?ErrorCode_AwakenUpShenLi_Enough
%%			end;
%%		_ ->
%%			?ErrorCode_AwakenUpCard_Max
%%	end.
%%-spec checkIsUp(#recWake{}) -> uint() | {boolean(), uint()}.
%%checkIsUp(#recWake{
%%	cardID = CardID,
%%	curLevel = CurLevel,
%%	curNum = CurNum
%%}) ->
%%	#transformCfg{
%%		money = Money,
%%		fragment = [_ID, NeedNum]
%%	} = getCfg:getCfgPStack(cfg_transform, CardID, CurLevel + 1),
%%	case CurNum =:= NeedNum of
%%		true ->
%%			Gold = playerState:getCoin(?CoinTypeGold),
%%			case Gold >= Money of
%%				true ->
%%					{true, Money};
%%				false ->
%%					{false, ?ErrorCode_AwakenUpCardCoin_Enough}
%%			end;
%%		_ ->
%%			{false, ?ErrorCode_AwakenUpCard_Error}
%%	end.
%%
%%-spec delItem(ItemList :: list(), Reason :: uint()) -> ok.
%%delItem([], _) ->
%%	ok;
%%delItem([{ID, Num} | List], Reason) ->
%%	case erlang:is_integer(ID) andalso ID > 0 andalso erlang:is_integer(Num) andalso Num > 0 of
%%		true ->
%%			PLog = #recPLogTSItem{
%%				old = Num,
%%				new = 0,
%%				change = -Num,
%%				target = ?PLogTS_GradeWake,
%%				source = ?PLogTS_PlayerSelf,
%%				gold = 0,
%%				goldtype = 0,
%%				changReason = Reason,
%%				reasonParam = 0
%%			},
%%			playerPackage:delGoodsByID(?Item_Location_Bag, ID, Num, PLog);
%%		_ ->
%%			skip
%%	end,
%%	delItem(List, Reason).
%%
%%-spec changeWakeProp(Level :: uint(), CardID :: uint(), State :: uint(), Operate :: uint()) -> ok.
%%changeWakeProp(0, _, _, _) ->
%%	ok;
%%changeWakeProp(Level, CardID, LockState, ?AddProp) ->
%%	#transformCfg{
%%		property = Props, passiveSkills = PassiveSkillsFull
%%	} = getCfg:getCfgPStack(cfg_transform, CardID, Level),
%%	PassiveSkills = case length(PassiveSkillsFull) > LockState of
%%		                true ->
%%			                lists:sublist(PassiveSkillsFull, LockState);
%%		                _ ->
%%			                PassiveSkillsFull
%%	                end,
%%	playerCalcProp:changeProp_CalcType(Props, ?EquipOn, true),
%%	changeWakePassSkill(PassiveSkills, ?AddProp);
%%changeWakeProp(Level, CardID, LockState, ?DelProp) ->
%%	#transformCfg{
%%		property = Props, passiveSkills = PassiveSkillsFull
%%	} = getCfg:getCfgPStack(cfg_transform, CardID, Level),
%%	PassiveSkills = case length(PassiveSkillsFull) > LockState of
%%		                true ->
%%			                lists:sublist(PassiveSkillsFull, LockState);
%%		                _ ->
%%			                PassiveSkillsFull
%%	                end,
%%
%%	playerCalcProp:changeProp_CalcType(Props, ?EquipOff, true),
%%	changeWakePassSkill(PassiveSkills, ?DelProp).
%%
%%changeWakePassSkill(PassiveSkills, ?AddProp) ->
%%	lists:foreach(fun(SkillID) -> playerSkill:addGoddessSkill(SkillID, 1) end, PassiveSkills),
%%	ok;
%%changeWakePassSkill(PassiveSkills, ?DelProp) ->
%%	lists:foreach(fun(SkillID) -> playerSkill:delGoddessSkill(SkillID) end, PassiveSkills),
%%	ok.
%%
%%
%%-spec saveDbWakeInfo(WakeInfo :: #recWake{}) -> ok.
%%saveDbWakeInfo(WakeInfo) ->
%%	SaveWake = #rec_awaken_info{
%%		roleID = playerState:getRoleID(),
%%		cardID = WakeInfo#recWake.cardID,
%%		itemNum = WakeInfo#recWake.curNum,
%%		level = WakeInfo#recWake.curLevel,
%%		progress = WakeInfo#recWake.activeProgress,
%%		stateMax = WakeInfo#recWake.unLockStateMax,
%%		curState = WakeInfo#recWake.curState
%%	},
%%	playerSave:saveAWaken(SaveWake).
%%
%%-spec saveMemWakeInfo(WakeInfo :: #recWake{}) -> ok.
%%saveMemWakeInfo(#recWake{cardID = CardID} = WakeInfo) ->
%%	Wakes = playerState:getWakes(),
%%	case lists:keyfind(CardID, #recWake.cardID, Wakes) of
%%		false ->
%%			NewWakes = lists:keystore(CardID, #recWake.cardID, Wakes, WakeInfo);
%%		_ ->
%%			NewWakes = lists:keyreplace(CardID, #recWake.cardID, Wakes, WakeInfo)
%%	end,
%%	playerState:setWakes(NewWakes).
%%
%%-spec sendWakeInfo(WakeInfo :: #recWake{}) -> ok.
%%sendWakeInfo(WakeInfo) ->
%%	Msg = #pk_GS2U_WakeInfo{wakeInfo = makePk_WakeInfo(WakeInfo)},
%%	playerMsg:sendNetMsg(Msg).
%%
%%-spec sendWakeList(List :: [#recWake{}, ...]) -> ok.
%%sendWakeList(List) ->
%%	Fun = fun(#recWake{} = Wake) -> makePk_WakeInfo(Wake) end,
%%	Msg = #pk_GS2U_WakeInfoList{
%%		wakeInfoList = lists:map(Fun, List)
%%	},
%%	playerMsg:sendNetMsg(Msg).
%%
%%makePk_WakeInfo(#recWake{} = WakeInfo) ->
%%	#pk_WakeInfo{
%%		cardID = WakeInfo#recWake.cardID,
%%		level = WakeInfo#recWake.curLevel,
%%		curNum = WakeInfo#recWake.curNum,
%%		activeProgress = WakeInfo#recWake.activeProgress,
%%		unlockStateMax = WakeInfo#recWake.unLockStateMax,
%%		curState = WakeInfo#recWake.curState
%%	}.
%%
%%
%%
%%%% 提供查看远程玩家觉醒女神信息
%%-spec getRPWakeInfo() -> []|[#pk_LookWakeInfo{}, ...].
%%getRPWakeInfo() ->
%%	case playerBase:getMainMenuAct(?ActivateWakeFun) of
%%		true ->
%%			playerState:addMainMenuSta(?PlayerMainMenuWake),
%%			Wakes = playerState:getWakes(),
%%			Fun1 = fun(#recWake{cardID = CardID, curLevel = Level}) ->
%%				#pk_LookWakeInfo{
%%					cardID = CardID,
%%					level = Level
%%				}
%%			       end,
%%			lists:map(Fun1, Wakes);
%%		_ ->
%%			[]
%%	end.
%%
%%saveWakeAndSend(NewWake) ->
%%	saveDbWakeInfo(NewWake),
%%	saveMemWakeInfo(NewWake),
%%	sendWakeInfo(NewWake).