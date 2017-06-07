%%
%% @author luowei
%% @doc @todo 玩家宠物PvP(宠物领地战)


-module(playerPetPvP).
-author(luowei).

-include("playerPrivate.hrl").
-include("setupLang.hrl").
-define(MaxBrlNum, 10).
%% ====================================================================
%% API functions
%% ====================================================================
-export([
			petPvpInit/0,
			petPvpReel/0,
			petPvptick/0,
			petPvpBattle/2,
			petPvpEndBattle/4,
			petPvpPos/1,
			petPvpOff/0,
			petPvpDel/1,
			petPvpTip/0
		]).

-export([
		 getOfflineReel/3,
		 savePetManorBattleToDB/1
		]).

-spec petPvpTip() -> ok.
petPvpTip() ->
	Brl = petbattle:getBrl(playerState:getRoleID()),
	case Brl =/= [] of
		true ->
			#rec_battle_report{
				report_time = Time
			} = lists:nth(1, Brl),
			LogoutTime = playerState:getLastLogoutTime(),
			case Time >= LogoutTime of
				true ->
					sendBrTip();
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%%宠物领地战初始化
-spec petPvpInit() -> ok.
petPvpInit() ->
	RoleID = playerState:getRoleID(),
	MB = playerState:getPetManorBattle(),
	MaxReel = globalCfg:getPetPvpReelMaxNum(),
	case MB of
		undefined -> %%初始化
			NewMB = #rec_pet_manor_battle{
				roleID = RoleID,
				pet_pos = [0,0,0,0,0],
				pet_reel = MaxReel
			},
			savePetManorBattleToDB(NewMB),
			savePetManorBattleToMem(NewMB);
		#rec_pet_manor_battle{} = MB->
%% 			CurReel = getOfflineReel(Reel, MaxReel, OffTime),
%% 			NewMB = MB#rec_pet_manor_battle{
%% 				off_time = 0,
%% 				pet_reel = CurReel
%% 			}
			NewMB = MB
	end,
	%%savePetManorBattleToDB(NewMB),
	%%savePetManorBattleToMem(NewMB),
	sendPetManorBattleInit(petbattle:getAcl(), petbattle:getBrl(RoleID), petbattle:getInte(RoleID), NewMB).

%%购买劵
-spec petPvpReel() -> ok.
petPvpReel() ->
	IsMaxReel = checkPetBattleMaxReel(),
	{MoneyType, Money} = getPurcReelCost(),
	petPvpReel(IsMaxReel, MoneyType, Money).
petPvpReel(true, _, _) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_PvpPet_Reel_Max);
petPvpReel(#rec_pet_manor_battle{pet_reel = PB} = MB, MoneyType, Money) ->
	IsMoneyEnough =
		case MoneyType of
			?CoinTypeGold ->
				playerMoney:canUseCoin(?CoinUseTypeGold, Money);
			?CoinTypeBindDiamond ->
				playerMoney:canUseCoin(?CoinUseTypeDiamond, Money);
			0 -> 
				true;
			_ -> 
				false
		end,
	case IsMoneyEnough of
		true ->
			NewMB = MB#rec_pet_manor_battle{pet_reel = PB + 1},
			playerDaily:incDailyCounter(?DailyType_PetPvpPurc, 0),
			case MoneyType of
				?CoinTypeGold ->
					PLog1 = #recPLogTSMoney{
						reason = ?CoinUsePetPvpReel,
						param = PB + 1,
						target = ?PLogTS_PetPvp,
						source = ?PLogTS_PlayerSelf
					},
					playerMoney:useCoin(?CoinUseTypeGold, Money, PLog1);
				?CoinTypeBindDiamond ->
					PLog2 = #recPLogTSMoney{
						reason = ?CoinUsePetPvpReel,
						param = PB + 1,
						target = ?PLogTS_PetPvp,
						source = ?PLogTS_PlayerSelf
					},
					playerMoney:useCoin(?CoinUseTypeDiamond, Money, PLog2);
				0 -> 
					skip
			end,
			playerMsg:sendErrorCodeMsg(?ErrorCode_PvpPet_Purc_Reel_Succ),
			savePetManorBattleToMem(NewMB),
			savePetManorBattleToDB(NewMB),
			sendPetManorBattleReel(PB + 1);
		_ ->
			case MoneyType of
				?CoinTypeGold ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_PvpPet_Not_Enough_Coin);
				?CoinTypeBindDiamond ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_PvpPet_Not_Enough_Diamond);
				_ ->
					?ERROR_OUT("pet pvp phrc reel unknow error:roleid=~p", [playerState:getRoleID()])
			end
	end.

%%宠物领地战战斗
-spec petPvpBattle(CityID::uint(), RoleID::uint()) -> ok.
petPvpBattle(CityID, _ToRoleID) ->
	#rec_pet_manor_battle{
		pet_pos = Pos,
		pet_reel = Reel,
		roleID = RoleID
	} = MB 
	= playerState:getPetManorBattle(),
	case canPetManorBattle(CityID, MB) of
		true ->
			Fun = fun() ->
				case mnesia:read(rec_manor_battle, CityID, write) of
					[] -> %%直接占领
						PetList = getPetList(Pos),
						ManorHp = getPetManorBattleMaxHp(PetList),
						ManorForce = getPetManorBattleForce(PetList),
						M = #rec_manor_battle{
							roleID  = RoleID,
							manorID = CityID,
							manorForce = ManorForce,
							manorHp = ManorHp,
							manorMaxHp = ManorHp,
							manorPos = Pos,
							manorTime = time:getSyncTime1970FromDBS()
						},
						petbattle:writeMn(new_rec_manor_battle, M),
						petPvpBr(RoleID, 0, CityID, ?BattleWin),
						petPvpEndBattle(?BattleWin, 0, M, playerState:getLevel()),
						{true, MB#rec_pet_manor_battle{pet_reel = Reel - 1, pet_pos = [0,0,0,0,0]}};
					[#rec_manor_battle{roleID = NewRoleID}] when NewRoleID =:= 0 ->
						PetList = getPetList(Pos),
						ManorHp = getPetManorBattleMaxHp(PetList),
						ManorForce = getPetManorBattleForce(PetList),
						NewM = #rec_manor_battle{
							roleID  = RoleID,
							manorID = CityID,
							manorForce = ManorForce,
							manorHp = ManorHp,
							manorMaxHp = ManorHp,
							manorPos = Pos,
							manorTime = time:getSyncTime1970FromDBS()
						},
						petbattle:updateMn(new_rec_manor_battle, update_rec_manor_battle, CityID, NewM),
						petPvpBr(RoleID, 0, CityID, ?BattleWin),
						petPvpEndBattle(?BattleWin, 0, NewM, playerState:getLevel()),
						{true, MB#rec_pet_manor_battle{pet_reel = Reel - 1, pet_pos = [0,0,0,0,0]}};
					[#rec_manor_battle{roleID = ToRoleID}] when ToRoleID =:= RoleID ->
						?ErrorCode_PvpPet_Have_MySelf;
					[#rec_manor_battle{roleID = ToRoleID, manorPos = DPos, manorHp = CurHp} = M] ->	%%直接攻击
						case checkPetManorCityIsProc(M) of
							true ->
								Lv = playerState:getLevel(),
								PetList = playerState:getPets(),
								EquipList = playerState:getPetEquip(),
								playerState:setTurnBattleData([]),
								playerState:setTurnBattleAck(undefined),
								%%这里需要获取离线宠物数据
								case getOccupyCityPetList(ToRoleID, DPos) of
									{} ->
										?ErrorCode_PvpPet_Have_City_Occupy;
									{ToRoleID, DLv, DL, DEL} ->
										InitAersPos = playerTurnBattle:initPetPos(Pos, PetList),
										InitDersPos = playerTurnBattle:initPetPos(DPos,DL),
										Aers = playerTurnBattle:initBattle(?PetBattle, ?AerRole, Lv, EquipList, InitAersPos),   
										Ders = playerTurnBattle:initBattle(?PetBattle, ?DerRole, DLv, DEL, InitDersPos),
										Orders = playerTurnBattle:initBattleOrder(Aers ++ Ders),
										playerTurnBattle:sendInitBattleListToClient(Orders),
										{Res, _, Al, BT, HP} = playerTurnBattle:startBattle(?BattlePvp, CurHp, Aers, Ders, Orders, 30),
										if
											Res =:= ?BattleWin andalso HP =< 0 ->
												PetList1 = getPetList(Pos),
												ManorHp = getPetManorBattleMaxHp(PetList1),
												ManorForce = getPetManorBattleForce(PetList1),
												NewM = M#rec_manor_battle{
													roleID = RoleID,
													manorHp = ManorHp,
													manorMaxHp = ManorHp,
													manorPos = Pos,
													manorForce = ManorForce,
													manorTime = time:getSyncTime1970FromDBS()
												},
												NewMB = MB#rec_pet_manor_battle{pet_reel = Reel - 1, pet_pos = [0,0,0,0,0]};
											true ->
												NewM = M#rec_manor_battle{manorHp = HP},
												NewMB = MB#rec_pet_manor_battle{pet_reel = Reel - 1}
										end,
										petPvpBr(RoleID, ToRoleID, CityID, Res),
										BattleAck = #rec_battle_ack{
											cityInfo = NewM,
											oldOccID = ToRoleID,
											res = Res,
											type = BT
										},
										petbattle:updateMn(new_rec_manor_battle, update_rec_manor_battle, CityID, NewM),
										playerState:setTurnBattleAck(BattleAck),
										playerState:setTurnBattleData(lists:reverse(Al)),
										{true, NewMB}
									end;
							Time ->
								{false, Time}
						end;
					_ -> %%刷新
						?ErrorCode_PvpPet_Have_City_Occupy
				end
			end,
			case mnesia:transaction(Fun) of
				{atomic, Val} ->
					case Val of
						{true, #rec_pet_manor_battle{pet_reel = NewReel} = NMB} ->
							case NewReel + 1 =:= globalCfg:getPetPvpReelMaxNum() of
								true ->
									playerState:setLastPetManorBattleTime(time:getUTCNowMS());
								_ ->
									skip
							end,
							savePetManorBattleToDB(NMB),
							savePetManorBattleToMem(NMB),
							sendPetManorBattleReel(NewReel),
							playerSevenDays:onMissionEvent(?SevenDayMission_Event_8, 1, 0);
						{false, Time} ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_PvpPet_Have_Proc_Time, [Time]);
						Error1 ->
							playerMsg:sendErrorCodeMsg(Error1)
					end;
				Error ->
					?ERROR_OUT("pet pvp battle roleID=~p, error=~p", [playerState:getRoleID(), Error])
			end;
		ErrorCode ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end.

-spec petPvpEndBattle(Res::uint(), OldOccID::uint(), #rec_manor_battle{}, Lv::uint()) -> ok.
petPvpEndBattle(Res, OldOccID, #rec_manor_battle{} = CityInfo, Lv) ->
	sendPetManorBattleCityUpdate(Res, OldOccID, Lv, CityInfo).

%%位置保存
-spec petPvpPos(L::list()) -> ok.
petPvpPos(L) when is_list(L) andalso length(L) =:= 5 andalso L =/= [0,0,0,0,0] ->
	petPvpPos(L, []);
petPvpPos(L) when is_list(L) andalso length(L) =:= 6 ->
	?ERROR_OUT("pet pvp pos error:playerID :[~p], posList [~p]", [playerState:getRoleID(), L]),
	petPvpPos(lists:delete(lists:last(L), L), []);
petPvpPos(L) ->
	?ERROR_OUT("pet pvp pos error:playerID :[~p], posList [~p]", [playerState:getRoleID(), L]).

petPvpPos([], PL) ->
	NPL = lists:reverse(PL),
	MB = playerState:getPetManorBattle(),
	NewMB = MB#rec_pet_manor_battle{
		pet_pos = NPL
	},
	savePetManorBattleToMem(NewMB),
	savePetManorBattleToDB(NewMB),
	sendPetManorBattlePos(NPL);
petPvpPos([ID | PL], L) ->
	case canSavePetManorPos(ID, PL ++ L) of
		true ->
			petPvpPos(PL, [ID | L]);
		Error ->
			playerMsg:sendErrorCodeMsg(Error)
	end.


%%离线处理
-spec petPvpOff() -> ok.
petPvpOff() -> 
	case playerState:getLastPetManorBattleTime() of
		undefined ->
			Time = time:getUTCNowMS();
		T ->
			Time = T
	end,
	case playerState:getPetManorBattle() of
		#rec_pet_manor_battle{} = MB ->
			NewMB = MB#rec_pet_manor_battle{					
				off_time = Time
			},
			savePetManorBattleToDB(NewMB),
			savePetManorBattleToMem(NewMB);
		_ ->
			skip
	end.

%%宠物争夺战tick
-spec petPvptick() -> ok.
petPvptick() ->
	MB = playerState:getPetManorBattle(),
	MaxReel = globalCfg:getPetPvpReelMaxNum(),
	petPvptick(MB, MaxReel).
petPvptick(#rec_pet_manor_battle{pet_reel = Reel} = MB, MaxReel) when Reel < MaxReel ->
	NewMB = MB#rec_pet_manor_battle{pet_reel = Reel + 1},
	savePetManorBattleToDB(NewMB),
	savePetManorBattleToMem(NewMB),
	sendPetManorBattleReel(Reel + 1);
petPvptick(_, _) ->
	ok.

petPvpBr(RoleID, 0, CityID, _) ->
	Abr = #rec_battle_report{
		report_city_id = CityID,
		report_role_id = RoleID,
		report_type = ?OccType1,
		report_time = time2:getLocalDateTimeSec()
	},
	petbattle:addBr(RoleID, Abr),
	sendUpdateBr(Abr);
petPvpBr(RoleID, ToRoleID, CityID, Res) ->
	case Res of
		?BattleWin ->
			AttackType = ?OccType6,
			BeAttackType = ?OccType3;
		_ ->
			AttackType = ?OccType4,
			BeAttackType = ?OccType5
	end,
	Abr = #rec_battle_report{
		report_city_id = CityID,
		report_role_id = RoleID,
		report_type = AttackType,
		report_time = time2:getLocalDateTimeSec()
	},
	Bbr = #rec_battle_report{
		report_city_id = CityID,
		report_role_id = RoleID,
		report_type = BeAttackType,
		report_time = time2:getLocalDateTimeSec()
	},
	petbattle:addBr(RoleID, Abr),
	petbattle:addBr(ToRoleID, Bbr),
	sendUpdateBr(Abr),
	sendBrTipToRole(ToRoleID).

petPvpDel(RoleID) ->
	Cl = petbattle:getCl(RoleID),
	petPvpDel1(Cl).
petPvpDel1([]) ->
	ok;
petPvpDel1([#rec_manor_battle{manorID = CityID} = MB | L]) ->
	Fun = fun() ->
		NewMB = MB#rec_manor_battle{
			manorMaxHp = 0,
			manorTime = 0,  
			manorHp = 0, 
			roleID = 0,
			manorPos = [], 
			manorForce = 0
		},
		mnesia:write(NewMB),
		case mnesia:read(new_rec_manor_battle, CityID, write) of
			[#rec_manor_battle{}] ->
				mnesia:write(new_rec_manor_battle, NewMB, write);
			[] ->
				mnesia:write(update_rec_manor_battle, NewMB, write)
		end,
		true
	end,
	case mnesia:transaction(Fun) of
		{atomic, true} ->
			skip;
		Error ->
			?ERROR_OUT("pet pvp del city failed =~p, error=~p", [Error])
	end,
	petPvpDel1(L).

%% ====================================================================
%% Internal functions
%% ====================================================================

%%是否可以保存宠物出战位置
-spec canSavePetManorPos(ID::uint(), PL::list()) -> {uint() | true}.
canSavePetManorPos(ID, PL) ->
	case checkPetIsRepeat(ID, PL) of
		true -> ?ErrorCode_PvpPet_Have_Repeat;
		_ ->	
			case checkPetIsExist(ID) of
				false -> ?ErrorCode_PvpPet_Have_Exist;
				_ ->
					case checkPetIsManorBattle(ID) of
						true -> ?ErrorCode_PvpPet_Have_Occupy;
						_ -> true
					end
			end
	end.
		
%%是否可以战斗
-spec canPetManorBattle(CityID::uint(), #rec_pet_manor_battle{}) -> true | uint().
canPetManorBattle(CityID, #rec_pet_manor_battle{pet_pos = Pos, pet_reel = Reel}) ->
	case checkPetManorIsOpen() of
		true ->
			case checkPetManorCityIsExist(CityID) of
				true ->
					case checkPetIsHaveBattle(Pos) of
						true -> 
							case checkPetManorBattleReelIsEnougth(Reel) of
								true -> true;
								_ -> ?ErrorCode_PvpPet_No_Reel
							end;
						_ -> ?ErrorCode_PvpPet_No_Battle_Pet
					end;
				_ ->
					?ErrorCode_PvpPet_Have_Not_City
			end;
		_ ->
			?ErrorCode_PvpPet_Have_No_Open
	end.
	
%%检查争夺令是否最大值
-spec checkPetBattleMaxReel() -> true | #rec_pet_manor_battle{}.
checkPetBattleMaxReel() ->
	MB = playerState:getPetManorBattle(),
	MaxNum = globalCfg:getPetPvpReelMaxNum(),
	checkPetBattleMaxReel(MB, MaxNum).
checkPetBattleMaxReel(#rec_pet_manor_battle{pet_reel = CurNum}, MaxNum) when CurNum>= MaxNum ->
	true;
checkPetBattleMaxReel(#rec_pet_manor_battle{} = MB, _) ->
	MB.

%%检查宠物是否已经获取
-spec checkPetIsExist(ID::uint()) -> boolean().
checkPetIsExist(0) ->
	true;
checkPetIsExist(ID) ->
	PL = playerState:getPets(),
	checkPetIsExist(ID, PL).
checkPetIsExist(_ID, []) ->
	false;
checkPetIsExist(ID, [#recPetInfo{pet_id = PetID} | _PL]) when ID =:= PetID ->
	true;
checkPetIsExist(ID, [_ | PL]) ->
	checkPetIsExist(ID, PL).

%%检查宠物是否重复出战
-spec checkPetIsRepeat(ID::uint(), L::list()) -> boolean().
checkPetIsRepeat(0, _) ->
	false;
checkPetIsRepeat(ID, L) ->
	lists:member(ID, L).

%%检查宠物是否占领城池
-spec checkPetIsManorBattle(ID::uint()) -> boolean().
checkPetIsManorBattle(0) ->
	false;
checkPetIsManorBattle(ID) ->
	RoleID = playerState:getRoleID(),
	checkPetIsManorBattle(ID, petbattle:getCl(RoleID)).
checkPetIsManorBattle(_ID, []) ->
	false;
checkPetIsManorBattle(ID, [#rec_manor_battle{manorPos = PL} | L]) ->
	case lists:member(ID, PL) of
		false ->
			checkPetIsManorBattle(ID, L);
		_ ->
			true
	end.

%%检查宠物是否有出战宠物
-spec checkPetIsHaveBattle(#rec_pet_manor_battle{}) -> boolean().
checkPetIsHaveBattle(Pos) when Pos =/= [0,0,0,0,0] andalso is_list(Pos) ->
	true;
checkPetIsHaveBattle(_) ->
	false.

%%检查争夺令是否足够
-spec checkPetManorBattleReelIsEnougth(Reel::uint()) -> boolean().
checkPetManorBattleReelIsEnougth(Reel) when Reel > 0 ->
	true;
checkPetManorBattleReelIsEnougth(_) ->
	false.

%%检查城池是否存在
-spec checkPetManorCityIsExist(CityID::uint()) -> boolean().
checkPetManorCityIsExist(CityID) ->
	case getCfg:getCfgByArgs(cfg_pet_pvp, CityID) of
		#pet_pvpCfg{} ->
			true;
		_ ->
			false
	end.

%%检查城池是否保护状态
-spec checkPetManorCityIsProc(#rec_manor_battle{}) -> boolean().
checkPetManorCityIsProc(#rec_manor_battle{manorTime = ManorTime}) -> 
	Now = time:getSyncTime1970FromDBS(),
	ProcTime = globalCfg:getPetPvpProc(),
	case Now - ManorTime >= ProcTime of
		true ->
			true;
		_ ->
			ProcTime - (Now - ManorTime)
	end.

%%检查活动是否开启
-spec checkPetManorIsOpen() -> boolean().
checkPetManorIsOpen() -> 
	case activityMgrOtp:getActivityPhase(?ActivityType_PetBattle) of
		0 ->
			false;
		_ ->
			true
	end.

-spec getCoinAndExp(Lv::uint()) -> uint().
getCoinAndExp(Lv) ->
	getCoinAndExp(Lv, 1).
getCoinAndExp(Lv, Num) ->
	L = globalCfg:getPetPvpReward(),
	case Num + 1 > length(L) of
		true ->
			{_, Coin, Exp} = lists:nth(Num, L),
			{Coin, Exp};
		_ ->
			{Lv1, Coin1, Exp1} = lists:nth(Num, L),
			case Lv < Lv1 of
				true ->
					{0, 0};
				_ ->
					{Lv2, _, _} = lists:nth(Num + 1, L),
					case Lv < Lv2 of
						true ->
							{Coin1, Exp1};
						_ ->
							getCoinAndExp(Lv, Num + 1)
					end
			end
	end.
	

%%获取占领城池玩家数据
-spec getOccupyCityPetList(RoleID::uint(), RolePetPosList::uint()) -> tuple() .
getOccupyCityPetList(RoleID, RolePetPosList) ->
	case core:queryRoleKeyInfoByRoleID(RoleID) of
		#?RoleKeyRec{roleID = RoleID, level = Lv} ->
			F1= fun(Pos, Acc1) ->
				case Pos =:= 0 of
					false ->
						case mnesia:dirty_read(rec_pet_info, {RoleID, Pos}) of
							[#rec_pet_info{
								attas = Attas,
								petID = PetID,
								star = Star,
								status = Status,
								name = Name,
								force = Force,
								raw = Raw
							} | _] ->
								 [#recPetInfo{
									pet_attas = Attas,
									pet_force = Force,
									pet_name = Name,
									pet_id = PetID,
									pet_star = Star,
									pet_raw = Raw,
									pet_status = Status
								 } | Acc1];
							_ ->
								Acc1
						end;
					_ ->
						Acc1
				end
			end,
			F2= fun(Type, Acc2) ->
				case mnesia:dirty_read(rec_pet_equip, {RoleID, Type}) of
					[#rec_pet_equip{
						equipID = EquipID,
						equipLv = EquipLv,
						equipPos = EquipPos
					} | _] ->
						[#recPetEquip{
							equip_id = EquipID,
							equip_lv = EquipLv,
							equip_pos = EquipPos
						 } | Acc2];
					_ ->
						Acc2
				end
			end,
			PL = lists:foldl(F1, [], RolePetPosList),
			EL = lists:foldl(F2, [], lists:seq(0, 3)),								
			{RoleID, Lv, PL, EL};
		_ ->
			{}
	end.

%%获取购买争夺令消耗的金币或者钻石
-spec getPurcReelCost() -> {uint(), uint()}.
getPurcReelCost() ->
	PurcPricList = globalCfg:getPetPvpPurcReel(),
	PurcNum = playerDaily:getDailyCounter(?DailyType_PetPvpPurc, 0),
	case length(PurcPricList) >= PurcNum + 1 of
		true ->
			lists:nth(PurcNum + 1, PurcPricList);
		_ ->
			lists:nth(length(PurcPricList), PurcPricList)
	end.

%%获取离线回复的争夺令
getOfflineReel(Reel, MaxReel, _OffLineTime) when Reel >= MaxReel ->
	Reel;
getOfflineReel(Reel, _, 0) ->
	playerState:setLastPetManorBattleTime(time:getUTCNowMS()),
	Reel;
getOfflineReel(Reel, MaxReel, OffLineTime) ->
	OffLineNum = trunc((time:getUTCNowMS() - OffLineTime) / (globalCfg:getPetPvpReelRestoreCD() * 1000)),
	RemainTime = OffLineTime + OffLineNum * globalCfg:getPetPvpReelRestoreCD() * 1000,
	playerState:setLastPetManorBattleTime(RemainTime),
	case (Reel + OffLineNum) > MaxReel of
		true ->
			MaxReel;
		_ ->
			Reel + OffLineNum
	end.

%%获取宠物宠物列表总的战斗力
-spec getPetManorBattleForce(PL::[] | [#recPetInfo{}, ...]) -> uint().
getPetManorBattleForce([]) ->
	0;
getPetManorBattleForce(PL) ->
	getPetManorBattleForce(PL, 0).
getPetManorBattleForce([], Force) ->
	Force;
getPetManorBattleForce([#recPetInfo{} = Pet | PL], Force) ->
	CurForce = playerForce:calcPetNoBattleForce(Pet),
	getPetManorBattleForce(PL, CurForce + Force).

%%获取城池最大血量
-spec getPetManorBattleMaxHp(PL::list()) -> uint().
getPetManorBattleMaxHp([]) ->
	0;
getPetManorBattleMaxHp(PL) ->
	getPetManorBattleMaxHp(PL, 0).

getPetManorBattleMaxHp([], MaxHp) ->
	trunc(MaxHp);
getPetManorBattleMaxHp([#recPetInfo{pet_id = ID, pet_star = Star, pet_raw = Raw} | PL], MaxHp) ->
	Lv = playerState:getLevel(),
	{Add, Multi} = playerPet:makePetEquipProp(),
	Bpl0 = battleProp:initBattleProp(false),
%%	Bpl1 = battleProp:initRmbPetBaseProp(ID, Lv, Star, Raw),
	Bpl1 = playerPet:makePetBaseProp(ID, Lv, Star, Raw),
	Bpl2 = battleProp:setBattlePropBaseValue(Bpl0, Bpl1),
	Bpl3 = battleProp:addBattlePropAddValue(Bpl2, getEquipProp(Add)),
	Bpl4 = battleProp:addBattlePropRateValue(Bpl3, getEquipProp(Multi)),
	Bpl5 = battleProp:calcCharBattleProp(Bpl4),
	Hp = battleProp:getBattlePropTotalValue(Bpl5, ?Prop_MaxHP),
	getPetManorBattleMaxHp(PL, MaxHp + Hp).

getEquipProp([]) ->
	[];
getEquipProp(Acc) ->
	getEquipProp(Acc, []).
getEquipProp([], Acc) ->
	Acc;
getEquipProp([{Key, Value} | L], Acc) ->
	getEquipProp(L, [{Key, Value * globalCfg:getPetWarEquipAddArg()} | Acc]).

%%获取出战宠物列表
-spec getPetList(PL::list()) -> [] | [#recPetInfo{}, ...].
getPetList([]) ->
	[];
getPetList(PL) ->
	getPetList(PL, []).
getPetList([], PL) ->
	PL;
getPetList([0 | L], PL) ->
	getPetList(L, PL);
getPetList([ID | L], PL) ->
	PetList = playerState:getPets(),
	case lists:keyfind(ID, #recPetInfo.pet_id, PetList) of
		#recPetInfo{} = Pet ->
			getPetList(L, [Pet | PL]);
		_ ->
			getPetList(L, PL)
	end.

%%生成城池信息
-spec makeCi(#rec_manor_battle{}) -> #pk_PvPCityInfo{}.
makeCi(#rec_manor_battle{
		manorID = CityID,
		manorHp = CityHp,
		manorMaxHp = CityMaxHp,
		manorPos = PL,
		manorForce = Force,
		manorTime = CityTime,
		roleID = RoleID
		}) ->
			case core:queryRoleKeyInfoByRoleID(RoleID) of
				#?RoleKeyRec{roleName = RoleName} ->
					Name = RoleName;
				_ ->
					Name = ""
			end,
			#pk_PvPCityInfo{
				cityID = CityID,
				cityTime = CityTime,
				roleID = RoleID,
				cityHp = CityHp,
				cityMax = CityMaxHp,
				force = Force,
				roleName = Name,
				petList = PL
			}.

-spec makeBr(#rec_battle_report{}) -> #pk_PvpBattleReportInfo{}.
makeBr(#rec_battle_report{
	report_time = Rtime,
	report_type = Rtype,
	report_city_id = Rci,
	report_role_id = Rri
	}) ->
	case core:queryRoleKeyInfoByRoleID(Rri) of
		#?RoleKeyRec{roleName = RoleName} ->
			RName = RoleName;
		_ ->
			RName = ""
	end,
	#pk_PvpBattleReportInfo{
		time = Rtime,
		type = Rtype,
		cityID = Rci,
		roleID = Rri,
		roleName = RName
	}.

%%保存玩家宠物争夺战信息
-spec savePetManorBattleToMem(#rec_pet_manor_battle{}) -> ok.
savePetManorBattleToMem(#rec_pet_manor_battle{} = MB) -> 
	playerState:setPetManorBattle(MB).

-spec savePetManorBattleToDB(#rec_pet_manor_battle{}) -> ok.
savePetManorBattleToDB(#rec_pet_manor_battle{roleID = RoleID} = MB) ->
	NewMB = case edb:dirtyReadRecord(rec_pet_manor_battle, RoleID) of
		[#rec_pet_manor_battle{
			save_time = SaveTime, 
			pet_integral = PetInte
		} | _] ->
			MB#rec_pet_manor_battle{
				save_time = SaveTime,
				pet_integral = PetInte
			};
		_ ->
			MB
	end,
	playerSave:savePetManorBattle(NewMB).

%%发送争夺令更新消息
-spec sendPetManorBattleReel(Reel::uint()) -> ok.
sendPetManorBattleReel(Reel) ->
	M = #pk_GS2U_UpdateReel{reel = Reel},
	playerMsg:sendNetMsg(M).
	
%%发送宠物位置保存成功消息
-spec sendPetManorBattlePos(PL::list()) -> ok.
sendPetManorBattlePos(PL) ->
	M = #pk_GS2U_PvpPosSaveAck{petList = PL},
	playerMsg:sendNetMsg(M).

%%更新城池信息列表
-spec sendPetManorBattleCityUpdate(Res::uint(), OldOccID::uint(), Lv::uint(), #rec_manor_battle{}) -> ok.
sendPetManorBattleCityUpdate(Res, OldOccID, Lv, #rec_manor_battle{roleID  = RoleID, manorID = ManorID} = C) ->
	case Res of
		?BattleWin ->
			if
				OldOccID =:= 0 ->
					broadCastBattleRes(ManorID),
					offlineData:addOfflineData(RoleID, ?AllSys);
				OldOccID =/= RoleID ->
					broadCastBattleRes(ManorID),
					offlineData:delOfflineData(OldOccID),
					offlineData:addOfflineData(RoleID, ?AllSys);
				true ->
					skip
			end,
			{Coin, Exp} = getCoinAndExp(Lv),
			true = playerBase:addExp(Exp, ?ExpSourcePetPvp, ManorID),
			true = playerMoney:addCoin(?CoinTypeGold, Coin,
			#recPLogTSMoney{reason=?CoinSourcePetPvpReward,param=ManorID,target=?PLogTS_PlayerSelf,source=?PLogTS_PetPvp});
		_ ->
			{Coin, Exp} = {0, 0}
	end,
	M = #pk_GS2U_PvpBattleResult{
		res = Res,
		exp = Exp,
		coin = Coin,
		pi = makeCi(C)
	},
	playerMsg:sendNetMsg(M).

%%更新战报
-spec sendUpdateBr(#rec_battle_report{}) -> ok.
sendUpdateBr(#rec_battle_report{} = Br) ->
	M = #pk_GS2U_PvpBattleUpdateReport{
		br = makeBr(Br)
	},
	playerMsg:sendNetMsg(M).

-spec sendBrTip() -> ok.
sendBrTip() ->
	M = #pk_GS2U_PvpBattleReportTip{
	},
	playerMsg:sendNetMsg(M).

-spec sendBrTipToRole(ToRoleID::uint()) -> ok.
sendBrTipToRole(ToRoleID) ->
	case playerMgrOtp:getOnlinePlayerInfoByID(ToRoleID) of
		#rec_OnlinePlayer{netPid = Pid} ->
			case misc:is_process_alive(Pid) of
				true ->
					M = #pk_GS2U_PvpBattleReportTip{
					},
					playerMsg:sendNetMsg(Pid, M);
				_ ->
					skip
			end;
		_ ->
			skip
	end.

%%发送骑宠pvp初始化信息
-spec sendPetManorBattleInit(Acl::[#rec_manor_battle{}, ...] | [], Brl::[] | [#rec_battle_report{},...], Inte::uint(), MB::#rec_pet_manor_battle{}) -> ok.
sendPetManorBattleInit(Acl, Brl, Inte, #rec_pet_manor_battle{pet_reel = Reel, pet_pos = PL}) ->
	F1 = fun(#rec_manor_battle{} = C) ->
		makeCi(C)
	end,
	F2 = fun(#rec_battle_report{} = Br) ->
		makeBr(Br)
	end,
	MakeAcl = lists:map(F1, Acl),
	MakeBrl = lists:map(F2, Brl),
	M = #pk_GS2U_PvpBattleInfoRes{
		bpl = MakeBrl,
		cl = MakeAcl,
		reel = Reel,
		point = Inte,
		pl = PL
	},
	playerMsg:sendNetMsg(M).

broadCastBattleRes(ManorID) ->
	#pet_pvpCfg{
		name = Name
	} = getCfg:getCfgPStack(cfg_pet_pvp, ManorID),
%%	case Type =:= 4 of
%%		true ->
			N = stringCfg:getString(petpvpcontent, [playerState:getName(),Name]),
			case ?Cur_Lang of
				?Lang_KOR ->
					core:sendBroadcastChatNotice(N);
				_ ->
					core:sendBroadcastNotice(N)
			end.
%%		_ ->
%%			skip
%%	end.

