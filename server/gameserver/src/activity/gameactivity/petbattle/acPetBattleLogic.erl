%%%-------------------------------------------------------------------
%%% @author luowei
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 宠物领地战活动
%%% @end
%%% Created : 25. 八月 2015 19:50
%%%-------------------------------------------------------------------
-module(acPetBattleLogic).
-author("luowei").

-include("../../activityPrivate.hrl").
-include("../activityPhaseDefine.hrl").
-include("acPetBattlePrivate.hrl").

-define(MinIntervalTime, 15).	%%刷新间隔时间 %%小于60

%% API
-export([
	tick/0,
	openClearCity/0
]).

-export([
	activityChangeCallBack/1,
	activityMapMsg/2
]).

-spec tick() -> ok.
tick() ->
	case getPetBattleIsOpen() of
		true ->
			{{_, _, _},{Hour, Min, _}} = time:convertSec2DateTime(time2:getLocalDateTimeSec()),
			{NextHour, NextMin} = getPetBattleIntervalTime(),
			if
				(Hour > NextHour) orelse (NextHour =:= Hour andalso Min >= NextMin) ->
					case NextMin + ?MinIntervalTime >= 60 of
						true ->
							setPetBattleIntervalTime({Hour + 1, NextMin + ?MinIntervalTime - 60});
						_ ->
							setPetBattleIntervalTime({Hour, NextMin + ?MinIntervalTime})
					end,
					setPetBattlePhase(getPetBattlePhase() + 1),
					MBL = edb:readAllRecord(rec_manor_battle),
					dealReward(MBL);
				true ->
					ok
			end;
		_ ->
			ok
	end.	

-spec dealReward([#rec_manor_battle{}, ...]) -> ok.
dealReward([]) ->
	ok;
dealReward([#rec_manor_battle{roleID = 0} | L]) ->
	dealReward(L);
dealReward([#rec_manor_battle{roleID = RoleID, manorID = ManorID} | L]) ->
	case getCfg:getCfgByArgs(cfg_pet_pvp, ManorID) of
		#pet_pvpCfg{
					drop_money = DropMoney, 
					drop_item = DropItem,
					integral = Integral,
					name = CityName,
					level = Level,
					time = Time
				   } ->
			CurPhase = getPetBattlePhase(),
			case (CurPhase rem Time) =:= 0 of
				true ->
					%%发奖
                    SaveTime = time:getWeekBeginSecondsByDay(time:convertSec2DateTime(time2:getLocalDateTimeSec())) + 4 * 60 * 60,
                    Fun =
                        fun() ->
                            case mnesia:read(rec_pet_manor_battle, RoleID, write) of
                                [] ->
                                    false;
                                [#rec_pet_manor_battle{save_time = LastSaveTime, pet_integral = PetIntegral} = MB] ->
                                    case core:queryRoleKeyInfoByRoleID(RoleID) of
                                        #?RoleKeyRec{} ->
                                            case LastSaveTime =:= SaveTime of
                                                true ->
                                                    case core:queryOnLineRoleByRoleID(RoleID) of
                                                        {} ->
                                                            gsSendMsg:sendMsg2PublicDMSaveData(
                                                                {?RoleKeyRec, RoleID, [{#?RoleKeyRec.pvpIntegral, {SaveTime, PetIntegral + Integral}}]});
                                                        _ ->
                                                            skip
                                                    end,
                                                    NMB = MB#rec_pet_manor_battle{pet_integral = PetIntegral + Integral};
                                                _ ->
                                                    NMB = MB#rec_pet_manor_battle{save_time = SaveTime, pet_integral = Integral}
                                            end,
                                            Br = #rec_battle_report{
                                                report_city_id = ManorID,
                                                report_role_id = RoleID,
                                                report_type = ?OccType2,
                                                report_time = time2:getLocalDateTimeSec()
                                            },
                                            petbattle:addBr(RoleID, Br),
                                            petbattle:updateMn(new_rec_pet_manor_battle, update_rec_pet_manor_battle, RoleID, NMB),
                                            true;
                                        _ ->
                                            ?ERROR_OUT("player data not exist [~p]", [RoleID]),
                                            false
                                    end
                            end
                        end,
					case mnesia:transaction(Fun) of
						{atomic, Val} ->
							case Val of
								true ->
									L1 = case playerMail:createMailGoods(DropItem, 1, true, 0, RoleID, ?ItemSourcePetPvpBattle) of
										[#recMailItem{itemID = ItemID}|_] = MailItemList -> 
											case goods:getGoodsCfg(ItemID) of
												#itemCfg{name = Name} ->
													ItemName = Name;
												_ ->
													ItemName = ""
											end,
											MailItemList;
										_ ->
											ItemName = "",
											[]
									end,
									L2 = case DropMoney of
										[{MoneyType, MoneyNum}] ->
											[#recMailCoin{coinType = MoneyType,coinNum = MoneyNum}];
										_ ->
											[]
									end,
									Title = stringCfg:getString(petpvpmailtitle),
									Content = stringCfg:getString(petpvpmailcontent, [CityName, Level, time:convertSec2DateTimeStr(time2:getLocalDateTimeSec()), ItemName]),
									?LOG_OUT("pet pvp deal reward to roleID:~p, cityID:~p",[RoleID, ManorID]),
									mail:sendSystemMail(RoleID, Title, Content, L1 ++ L2, "");
								_ ->
									?ERROR_OUT("error deal reward, roleID:[~p]", [RoleID])
							end;
						Error ->
							?ERROR_OUT("pet battle deal reward roleID=~p, error=~p", [RoleID, Error])
					end;
				_ ->
					skip
			end,
			dealReward(L);
		_ ->
			dealReward(L)
	end.

%%清空城池列表
-spec closeClearCity() -> ok.
closeClearCity() ->
	MBL = edb:readAllRecord(rec_manor_battle),
	closeClearCity(MBL).
closeClearCity([]) ->
	ok;
closeClearCity([#rec_manor_battle{manorID = CityID, roleID = RoleID} = MB | L]) ->
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
			?ERROR_OUT("clear city failed =~p, error=~p", [Error])
	end,
	case RoleID =/= 0 of
		true ->
			offlineData:delOfflineData(RoleID);
		_ ->
			skip
	end,
	closeClearCity(L).

openClearCity() ->
	MBL = edb:readAllRecord(rec_manor_battle),
	openClearCity(MBL).
openClearCity([]) ->
	ok;
openClearCity([#rec_manor_battle{roleID  = 0}| L]) ->
	openClearCity(L);
openClearCity([#rec_manor_battle{manorID = CityID, manorTime = ManorTime} = MB | L]) ->
	{{_, Month, Day}, {_, _, _}} = time:convertSec2DateTime(ManorTime),
	{{_, Month1, Day1}, {_, _, _}} = time:convertSec2DateTime(time:getSyncTime1970FromDBS()),
	case Month =:= Month1 andalso Day =:= Day1 of
		true ->
			ok;
		_ ->		
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
					?ERROR_OUT("clear city failed =~p, error=~p", [Error])
				end,
			openClearCity(L)
	end.

-spec activityChangeCallBack(Phase::uint()) -> ok.
activityChangeCallBack(?ActivityPhase_Close) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_PetBattle) of
		true ->
			?LOG_OUT("pet battle manor activity will be close"),
			closeClearCity(),
			delPetBattleIntervalTime(),
			setPetBattlePhase(0),
			setPetBattleIsOpen(false);
		_ ->
			?LOG_OUT("pet battle global bit variant close"),
			skip
	end;
activityChangeCallBack(?ActivityPhase_Example_1) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_PetBattle) of
		true ->
			?LOG_OUT("pet battle manor activity will be open"),
			delPetBattleIntervalTime(),
			erlang:send_after(?PetBattleTickReStart, self(), ?PetBattleMsgReStart),
			setPetBattleIsOpen(true);
		_ ->
			?LOG_OUT("pet battle global bit variant open"),
			skip
	end;
activityChangeCallBack(Phase) ->
	?ERROR_OUT("~p ~p activityChangeCallBack:~p", [?MODULE, self(), Phase]),
	ok.

-spec activityMapMsg(MsgType::uint(), Data::term()) -> ok.
activityMapMsg(_MsgType, _Data) ->
	ok.

-spec setPetBattleIsOpen(Flag::boolean()) -> ok.
setPetBattleIsOpen(Flag) ->
	put('PetBattleAcState', Flag).

-spec getPetBattleIsOpen() -> boolean().
getPetBattleIsOpen() ->
	case get('PetBattleAcState') of
		undefined ->
			false;
		State ->
			State
	end.

-spec setPetBattlePhase(Phase::uint()) -> ok.
setPetBattlePhase(Phase) ->
	put('PetBattlePhase', Phase).

-spec getPetBattlePhase() -> uint().
getPetBattlePhase() ->
	case get('PetBattlePhase') of
		undefined ->
			{Hour, Min} = getPetBattleIntervalTime(),
			(((Hour - 10) * 60 + Min) div ?MinIntervalTime) - 2;
		Phase ->
			Phase
	end.

-spec setPetBattleIntervalTime({Hour::uint(), Min::uint()}) -> ok.
setPetBattleIntervalTime(Tuple) ->
	put('PetBattleIntervalTime', Tuple).

-spec delPetBattleIntervalTime() -> ok.
delPetBattleIntervalTime() ->
	erlang:erase('PetBattleIntervalTime'),
	ok.

-spec getPetBattleIntervalTime() -> ok.
getPetBattleIntervalTime() ->
	case get('PetBattleIntervalTime') of
		undefined ->
			{Hour, Min} = getIntervalTime(),
			setPetBattleIntervalTime({Hour, Min}),
			{Hour, Min};
		T ->
			T
	end.

getIntervalTime() ->
	{{_, _, _},{Hour, Min, _}} = time:convertSec2DateTime(time2:getLocalDateTimeSec()),
	case Hour >= 10 of
		true ->
			IntNum = (Min div ?MinIntervalTime) + 1,
			getIntervalTime(Hour, IntNum);
		_ ->
			{10, ?MinIntervalTime}
	end.

getIntervalTime(Hour, IntNum) when IntNum * ?MinIntervalTime >= 60 ->
	{Hour + 1, IntNum * ?MinIntervalTime - 60};
getIntervalTime(Hour, IntNum) ->
	{Hour, IntNum * ?MinIntervalTime}.

