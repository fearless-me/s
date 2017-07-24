%%%-------------------------------------------------------------------
%%% @author burce
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 玩家家园系统_养殖区
%%% @end
%%% Created : 25. 八月 2017 17:48
%%%-------------------------------------------------------------------
-module(playerHomeFarming).
-author("cxl").

-include("gsInc.hrl").
-include("playerPrivate.hrl").

%% MSG
-export([
	msg/1
]).
%% API
-export([
	sendHomeFarmingInfo/2,
	farming_tick_addExp/1,
	zooFoodSuccess/1

]).


% 协议
msg(#pk_U2GS_PutPetInFarming{homeID = HomeID, petID = PetID,areaType = AreaType}) ->
	RoleID = playerState:getRoleID(),
	putInFarming(HomeID,AreaType,RoleID,PetID),
	ok;

% 协议
msg(#pk_U2GS_PutOutPetFarming{homeID = HomeID,petID = PetID,areaType = AreaType}) ->
	RoleID = playerState:getRoleID(),
	putOutFarming(HomeID,AreaType,RoleID,PetID),
	ok;

% 协议
msg(#pk_U2GS_GetPetFood{homeID = HomeID,petID = PetID,itemID = ItemID, areaType = AreaType}) ->
	RoleID = playerState:getRoleID(),
	putPetFoodFarming(HomeID,AreaType,RoleID,PetID,ItemID),
	ok;
msg(Msg) ->
	?ERROR_OUT("receive error msg:~p,~p", [playerState:getRoleID(), Msg]),
	playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotOpen),
	ok.


% 放置宠物进入饲养区
-spec putInFarming(HomeID ::uint64(),AreaType ::uint8(),RoleID :: uint64(), PetID :: uint16())-> no_return().

putInFarming(HomeID,AreaType,RoleID,PetID)->					%% 错误的操作类型

	HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
	case HomeRole =:= ?HomeRole_Master orelse HomeRole =:= ?HomeRole_Partner of
		true ->
			case ets:lookup(?HomeAreaEts, {HomeID, AreaType}) of
				[#rec_home_area{areaLvl =  AreaLvl,areaData = StrDataOld} = AreaOld] ->
					ListDataOld = misc:string_to_term(StrDataOld),
					HasNum =   erlang:length(ListDataOld),
					#home_zooCfg{pet_num = MaxNum} = getCfg:getCfgByKey(cfg_home_zoo, AreaLvl),
					?ERROR_OUT("AreaLvl  AreaLvl AreaLvl msg:~p", [AreaLvl]),
					case HasNum>=  MaxNum of
						true->
							?ERROR_CODE(?ErrorCode_PetTaskAcceptmax);
						_->
							TimeNow = time:getSyncTimeFromDBS(),
							case lists:keyfind(PetID, 1, ListDataOld) of
								{D, Time} ->
									?ERROR_CODE(?ErrorCode_PetTaskAcceptmax),
									skip;	%% 数据相同，不需要更新
								_ ->

									ListDataNew = lists:keystore(PetID, 1, ListDataOld, {PetID, TimeNow}),
									StrDataNew = misc:term_to_string(ListDataNew),
									AreaNew = AreaOld#rec_home_area{areaData = StrDataNew},
									ets:insert(?HomeAreaEts, AreaNew),
									homeInterface:saveHome(AreaNew),
									putInFarmingSuccess(HomeID,PetID,1)
							end
					end;
				_ ->
					?ERROR_CODE(?ErrorCode_HomePlant_NotOpen)
			end;
		_->
			skip
	end.


% 从饲养区 取回宠物
-spec putOutFarming(HomeID ::uint64(),AreaType ::uint8(),RoleID :: uint64(), PetID :: uint16())-> no_return().
putOutFarming(HomeID,AreaType,RoleID,PetID)->					%% 错误的操作类型

	HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
	case HomeRole =:= ?HomeRole_Master orelse HomeRole =:= ?HomeRole_Partner of
		true ->
			case ets:lookup(?HomeAreaEts, {HomeID, AreaType}) of
				[#rec_home_area{areaLvl =  AreaLvl,areaData = StrDataOld} = AreaOld] ->
					ListDataOld = misc:string_to_term(StrDataOld),

					TimeNow = time:getSyncTimeFromDBS(),
					case lists:keyfind(PetID, 1, ListDataOld) of
						{D, Time} ->

							GetDeltaTime  =  playerDaily:getDailyCounter(?DailyType_Home_PutPetFarmingTime, PetID),
							CurTime =  TimeNow - Time,
							Minutes =  erlang:trunc(CurTime/60),
							ExpNum =
								case getCfg:getCfgByKey(cfg_home_zoo, AreaLvl) of
									#home_zooCfg{exp_get = [Exp,Validtime]} ->
										case GetDeltaTime  < Validtime  of
											true ->
												GetExp =
													case  Validtime - (GetDeltaTime +Minutes) >0 of
														true ->
															Minutes * Exp;
														_->
															(Validtime - GetDeltaTime)*Exp
													end,
												GetExp;
											_->
												0
										end;
									_->
										0
								end,
							playerDaily:addDailyCounter(?DailyType_Home_PutPetFarmingTime, PetID,Minutes),
							Pid = core:queryPlayerPidByRoleID(RoleID),
							playerPet:petAddExp(PetID,ExpNum),
							%%psMgr:sendMsg2PS(Pid, home_Farming_addExp, {RoleID, ExpNum}),
							ListDataNew = lists:delete({D,Time},ListDataOld),
							StrDataNew = misc:term_to_string(ListDataNew),
							AreaNew = AreaOld#rec_home_area{areaData = StrDataNew},
							ets:insert(?HomeAreaEts, AreaNew),
							homeInterface:saveHome(AreaNew),
							putOutFarmingSuccess(HomeID,PetID,ExpNum,1,Minutes);
						_ ->
							skip
					end;
				_ ->
					?ERROR_CODE(?ErrorCode_HomePlant_NotOpen)
			end;
		_->
			skip
	end.

% 从饲养区 喂食物
-spec putPetFoodFarming(HomeID ::uint64(),AreaType ::uint8(),RoleID :: uint64(), PetID :: uint16(), ItemID :: uint16())-> no_return().
putPetFoodFarming(HomeID,AreaType,RoleID,PetID,ItemID)->					%% 错误的操作类型

	HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
	case HomeRole =:= ?HomeRole_Master orelse HomeRole =:= ?HomeRole_Partner of
		true ->
			case ets:lookup(?HomeAreaEts, {HomeID, AreaType}) of
				[#rec_home_area{areaLvl =  AreaLvl,areaData = StrDataOld} = AreaOld] ->

					#home_zooCfg{food_times = MaxNum} = getCfg:getCfgByKey(cfg_home_zoo, AreaLvl),
					Count =  playerDaily:getDailyCounter(?DailyType_Home_PetFarming, PetID),
					case Count >=MaxNum of
						true->
							?ERROR_CODE(?ErrorCode_UseSkillErrorNoUseCounter);
						_->
							ListDataOld = misc:string_to_term(StrDataOld),
							case lists:keyfind(PetID, 1, ListDataOld) of
								{D, Time} ->

									{BackItmeID,BackITemNum} =
										case getCfg:getCfgByKey(cfg_home_zoofood, ItemID) of
											#home_zoofoodCfg{back_item  = Back_item,range = Range} ->

												Randm =  misc:rand(1,Range),
												F1= fun({GainItem,Min,Max,Star,End},{_, {_,_}})->
													case Randm>= Star  andalso Randm < End of
														true ->
															Rnum = misc:rand(Min,Max),
															{true, {GainItem,Rnum}} ;
														_->
															{false, {0,0}}
													end
												    end,
												{IsIn, {ItID,ITNum}} =   misc:foldlEx(F1,{false,{0,0}},Back_item),
												{ItID,ITNum};
											_->
												{0,0}
										end,
									case  BackItmeID >0 andalso BackITemNum >0 of
										true->

											case playerBase:costRes(?BackType_Item, ItemID, 1, ?PLogTS_Home, ?ItemDeleteReasonHomeFarmingOP, ?ItemSourceHomeFarmingHarvest) of
												{true, CostItem} ->

													playerDaily:incDailyCounter(?DailyType_Home_PetFarming, D),
													playerMsg:sendNetMsg(#pk_GS2U_GetPetFoodResults_Sync{
														result = 1,
														petID = PetID,itemID =BackItmeID,num =BackITemNum  }),
													Pid = core:queryPlayerPidByRoleID(RoleID),
													psMgr:sendMsg2PS(Pid, zooFoodSuccess, {RoleID, BackItmeID,BackITemNum});
												_->
													playerMsg:sendNetMsg(#pk_GS2U_GetPetFoodResults_Sync{
														result = 3,
														petID = PetID,itemID =BackItmeID,num =BackITemNum })
											end;
										_->
											?ERROR_OUT("BackItmeID BackItmeID (~p)", [ItemID])
									end;
								_ ->
									skip
							end;
						_ ->
							?ERROR_CODE(?ErrorCode_HomePlant_NotOpen)
					end
			end;

		_->
			skip
	end.



%%%-------------------------------------------------------------------
% 初始化养殖区
-spec sendHomeFarmingInfo(HomeID::uint64(), Flag::uint()) -> no_return().
sendHomeFarmingInfo(HomeID, ?Home_Courtyard) ->

	case ets:lookup(?HomeAreaEts, {HomeID, ?Home_BreedArea}) of
		[#rec_home_area{areaLvl =  AreaLvl,areaData = StrDataOld} = AreaOld] ->
			TimeNow = time:getSyncTimeFromDBS(),
			ListDataOld = misc:string_to_term(StrDataOld),
			F =
			  fun({PetID,Time},Vecter) ->
				    LastdeltaTime = erlang:trunc((TimeNow - Time)/60),
				    DeltaMinutesTime  =  playerDaily:getDailyCounter(?DailyType_Home_PutPetFarmingTime, PetID),
				    AllTime = DeltaMinutesTime + LastdeltaTime,
					[#pk_FarmingPet{petID = PetID,time = TimeNow,lastdeltaTime = LastdeltaTime,deltaTime = AllTime} |Vecter]
              end,
			NewVecter = lists:foldl(F, [], ListDataOld),
			playerMsg:sendNetMsg(#pk_GS2U_HomeFarming_Sync{petList = NewVecter});
		_->
			skip
    end;

sendHomeFarmingInfo(_HomeID, _Flag) ->
	skip.

farming_tick_addExp({RoleID, Correct}) ->
	case playerState:getRoleID() of
		RoleID ->

			?ERROR_OUT(" farming_tick_addExp  RoleID (~p)  Exp  (~p)",[RoleID ,Correct]),
			playerBase:addExp(Correct, ?ExpSourceHomeFarming, 1);
		RID ->
			?ERROR_OUT("farming_tick_addExp self=~p, role=~p, correct=~p", [RID, RoleID, Correct])
	end.

zooFoodSuccess({RoleID, BackItemID,BackITemNum}) ->
	case playerState:getRoleID() of
		RoleID ->
			?ERROR_OUT(" zooFoodSuccess  BackItemID (~p)  BackITemNum  (~p)",[BackItemID ,BackITemNum]),
			PLog = #recPLogTSItem{
				new = BackITemNum,
				change = BackITemNum,
				target = ?PLogTS_PlayerSelf,
				source = ?PLogTS_Home,
				changReason = ?ItemSourceHomeFarmingHarvest,
				reasonParam = BackItemID
			},
			playerPackage:addGoodsAndMail(BackItemID, BackITemNum, false, 0, PLog);
		RID ->
			?ERROR_OUT("zooFoodSuccess self=~p, role=~p, BackItemID=~p", [RID, RoleID,BackItemID])
	end.


putInFarmingSuccess(HomeID,PetID, Result) ->

	%% 通知地图上所有角色
	DeltaMinutesTime  =  playerDaily:getDailyCounter(?DailyType_Home_PutPetFarmingTime, PetID),
	TimeNow = time:getSyncTimeFromDBS(),
	case ets:lookup(?HomeMapEts, {HomeID, ?Home_Courtyard}) of
		[#rec_home_map{mapPID = MapPid}] ->
			Msg = #pk_GS2U_PutPetInFarmingResults_Sync{
				result = Result,
				petFarming = #pk_FarmingPet{petID = PetID,time = TimeNow,deltaTime = DeltaMinutesTime,lastdeltaTime = 0}
			},
			psMgr:sendMsg2PS(MapPid, plantSuccess, Msg);
		_ ->
			skip
	end.

putOutFarmingSuccess(HomeID,PetID, ExpNum,Result,Minutes) ->

	%% 通知地图上所有角色
	case ets:lookup(?HomeMapEts, {HomeID, ?Home_Courtyard}) of
		[#rec_home_map{mapPID = MapPid}] ->
			Msg = #pk_GS2U_PutOutPetFarmingResults_Sync{
				result = Result,
				petID =PetID,
				exp = ExpNum,
				minutes = Minutes
			},
			psMgr:sendMsg2PS(MapPid, plantSuccess, Msg);
		_ ->
			skip
	end.