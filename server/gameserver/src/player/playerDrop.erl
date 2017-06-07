%%
%% @doc @todo 掉落系统

-module(playerDrop).

-include("playerPrivate.hrl").

-define(MaxWeight,10000).				%%最大权重

-record(dropResult,{
	coinType = 0,
	goodsID = 0,
	num = 0,
	isBind = false
}
).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initDrop/0,
	resetDrop/0,
	goodsDrop/3,
	goodsDrop/4,
	equipDrop/6,
	useItemDropItem/3,
	calcUseItemDropEquip/3,
	useItemDropEquip/2
]).

%%物品掉落,包括掉落包掉落处理,不带影响掉落几率的参数
-spec goodsDrop(DropID, ParamValue, DropReason) -> List::[{Num,playerPackage:goodsList()},...] | []
	when DropID::uint(), _DropType::uint(), ParamValue::uint(), DropReason::uint(),Num::uint().
goodsDrop(DropID, ParamValue, DropReason) ->
	itemDrop(DropID,1,ParamValue, DropReason).

%%物品掉落,包括掉落包掉落处理，带影响掉落几率的参数
-spec goodsDrop(DropID, OddParam, ParamValue, DropReason) -> List::[{Num,playerPackage:goodsList()},...] | []
	when DropID::uint(), _DropType::uint(), OddParam::number(),ParamValue::uint(), DropReason::uint(),Num::uint().
goodsDrop(DropID, OddParam, ParamValue, DropReason) ->
	itemDrop(DropID,OddParam,ParamValue, DropReason).

%%装备掉落处理
-spec equipDrop(DropID, ParamValue, UseLevel, DropSouceType, TeamMemberNum, DropReason) -> ok
	when DropID::uint(), ParamValue::uint(), UseLevel::uint(), DropSouceType::uint(), TeamMemberNum::uint(), DropReason::uint().
equipDrop(DropID, ParamValue, UseLevel, DropSouceType, TeamMemberNum, DropReason) ->
	RetEquipList = getEquipDropCfg(DropID),
	[equipDropProcess(DropInfo, ParamValue, UseLevel, DropSouceType, TeamMemberNum, DropReason,true) || DropInfo <- RetEquipList],
	ok.

calcUseItemDropEquip(DropID,ParamValue,UseLevel) ->
	RetEquipList = getEquipDropCfg(DropID),
	Fun = fun(DropInfo,AccIn) ->
		DropEquipList = equipDropProcess(DropInfo, ParamValue, UseLevel, ?Drop_EquipSource_ByPackage, 0, ?ItemSourceOpenPackage,false),
		DropEquipList ++ AccIn
	end,
	lists:foldl(Fun,[],RetEquipList).

useItemDropEquip(List,ParamValue) ->
	Fun = fun({EquipID,Quality,IsBind},AccIn) ->
		[#recSaveEquip{quality = RealQuality}] = equipDropProcessNew(EquipID, Quality, ParamValue, IsBind, ?ItemSourceOpenPackage),
		[#pk_UseItemGainGoodsTips{
			itemID = EquipID,
			itemNum = 1,
			quality = RealQuality,
			isBind = IsBind
		} | AccIn]
	end,
	Tips = lists:foldl(Fun,[],List),
	Msg = #pk_GS2U_UseItemGainGoodsTips{
		listTips = Tips
	},
	playerMsg:sendNetMsg(Msg),
	ok.

itemDrop(DropID, OddParam, ParamValue, DropReason) ->
	RetDropList = getDropCfg(DropID),
	Fun = fun(#dropCfg{dropclass = Class} = Cfg,AccIn) ->
		case goodsDropProcess(Cfg, OddParam) of
			#dropResult{} = DR ->
				case checkDrop(Class) of
					true ->
						updateDrop(Class),
						[DR | AccIn];
					_ ->
						AccIn
				end;
			_ ->
				AccIn
		end
	end,



	DropResultList = lists:foldl(Fun,[],RetDropList),
	dealDropResult(DropResultList,DropReason,ParamValue,false).

%%重置掉落
-spec resetDrop() -> ok.
resetDrop() ->
	L = playerState:getDropList(),
	Fun = fun(#recDrop{id = ID} = Info, Acc) ->
		NowTime = time:getSyncTime1970FromDBS(),
		{{Year, Month, Day},{_, _, _}} = time:convertSec2DateTime(NowTime),
		#drop_controlCfg{trigger_cycle = Cycle} = getCfg:getCfgPStack(cfg_drop_control, ID),
		NewInfo = Info#recDrop{num = 0, time = NowTime},
		case Cycle of
			1 ->
				playerSave:saveDrop(NewInfo),
				[NewInfo | Acc];
			2 -> 
				case calendar:day_of_the_week({Year, Month, Day}) of
					1 ->
						playerSave:saveDrop(NewInfo),
						[NewInfo | Acc];
					_ ->
						[Info | Acc]
				end;
			3 -> 
				case Day of
					1 ->
						playerSave:saveDrop(NewInfo),
						[NewInfo | Acc];
					_ ->
						[Info | Acc]
				end;
			4 ->
				playerSave:saveDrop(NewInfo),
				[NewInfo | Acc]
		end
	end,
	NewL = lists:foldl(Fun, [], L),
	playerState:setDropList(NewL).

-spec initDrop() -> ok.
initDrop() ->
	L = playerState:getDropList(),
	Fun = fun(#recDrop{id = ID, time = Time} = Info, Acc) ->
		NowTime = time:getSyncTime1970FromDBS(),
		#drop_controlCfg{trigger_cycle = Cycle} = getCfg:getCfgPStack(cfg_drop_control, ID),
		NewInfo = Info#recDrop{num = 0, time = NowTime},
		case Cycle of
			1 ->
				case core:timeIsOnDay(Time) of
					false ->
						playerSave:saveDrop(NewInfo),
						[NewInfo | Acc];
					_ ->	
						[Info | Acc]
				end;
			2 -> 
				case core:timeIsOnWeek(Time) of
					false ->
						playerSave:saveDrop(NewInfo),
						[NewInfo | Acc];
					_ ->
						[Info | Acc]
				end;
			3 -> 
				case core:timeIsOnMonth(Time) of
					false ->
						playerSave:saveDrop(NewInfo),
						[NewInfo | Acc];
					_ ->
						[Info | Acc]
				end;
			4 ->
				case core:timeIsOnHour(Time) of
					false ->
						playerSave:saveDrop(NewInfo),
						[NewInfo | Acc];
					_ ->
						[Info | Acc]
				end
		end
	end,
	NewL = lists:foldl(Fun, [], L),
	playerState:setDropList(NewL).

%%检查掉落
-spec checkDrop(DropID::uint()) -> ok.
checkDrop(0) ->
	true;
checkDrop(DropID) ->
	#drop_controlCfg{
		drop_cd = DropCD,
		server_limits = ServerLimit,
		personal_limits = PlayerLimit 
	} = getCfg:getCfgPStack(cfg_drop_control, DropID),
	case checkServerDrop(DropID, ServerLimit, DropCD) of
		true ->
			checkPlayerDrop(DropID, PlayerLimit);
		_ ->
			false
  	end.

checkServerDrop(_DropID, 0, _DropCD) ->
	true;
checkServerDrop(DropID, ServerLimit, DropCD) ->
	case ets:lookup(?TABLE_DROP, DropID) of
		[#rec_server_drop{num = Num}] when Num >= ServerLimit ->
			false;
		[#rec_server_drop{num = Num, time = LastTUpdateTime}] ->
			checkServerDropCD(LastTUpdateTime, Num, DropCD);
		_ ->
			true
	end.


checkServerDropCD(0, _CurNum, _CDTime) ->
	true;
checkServerDropCD(_LastUpTime, 0, _CDTime) ->
	true;
checkServerDropCD(_LastUpTime, _CurNum, 0) ->
	true;
checkServerDropCD(LastUpTime,_CurNum, CDTime) ->
	NowTime = time:getSyncTime1970FromDBS(),
	LastUpTime + CDTime =< NowTime.

checkPlayerDrop(_DropID, 0) ->
	true;
checkPlayerDrop(DropID, PlayerLimit) ->
	L = playerState:getDropList(),
	case lists:keyfind(DropID, #recDrop.id, L) of
		#recDrop{num = Num} when Num >= PlayerLimit ->
			false;
		_ ->
			true
	end.

%%更新掉落
-spec updateDrop(DropID::uint()) -> ok.
updateDrop(0) ->
	ok;
updateDrop(DropID) ->
	#drop_controlCfg{
		server_limits = ServerLimit,
		personal_limits = PlayerLimit 
	} = getCfg:getCfgPStack(cfg_drop_control, DropID),
	if
		ServerLimit =/= 0 andalso PlayerLimit =/= 0 ->
			updatePlayerDrop(DropID),
			updateServerDrop(DropID);
		ServerLimit =/= 0 andalso PlayerLimit =:= 0 ->
			updateServerDrop(DropID);	
		ServerLimit =:= 0 andalso PlayerLimit =/= 0 ->
			updatePlayerDrop(DropID);
		true ->
			ok
	end.

-spec updatePlayerDrop(DropID::uint()) -> ok.
updatePlayerDrop(DropID) ->
	L = playerState:getDropList(),
	case lists:keyfind(DropID, #recDrop.id, L) of
		#recDrop{num = Num} = Drop ->
			NewDrop = Drop#recDrop{num = Num + 1},
			NewL = lists:keyreplace(DropID, #recDrop.id, L, NewDrop);
		_ ->
			NowTime = time:getSyncTime1970FromDBS(),
			NewDrop = #recDrop{num = 1, id = DropID, time = NowTime},
			NewL = [NewDrop | L]
	end,
	playerSave:saveDrop(NewDrop),
	playerState:setDropList(NewL).

-spec updateServerDrop(DropID::uint()) -> ok.
updateServerDrop(DropID) ->
	NowTime = time:getSyncTime1970FromDBS(),
	case ets:lookup(?TABLE_DROP, DropID) of
		[#rec_server_drop{num = Num} = Drop] ->
			NewDrop = Drop#rec_server_drop{num = Num + 1, time = NowTime};
		_ ->
			NewDrop = #rec_server_drop{id = DropID, num = 1, time = NowTime}
	end,
	edb:checkAndSave(rec_server_drop, DropID, NewDrop, new_rec_server_drop, update_rec_server_drop),
	ets:insert(?TABLE_DROP, NewDrop).


%%使用道具开包裹走的掉落流程
-spec useItemDropItem(DropID::uint(),ParamValue::uint(),DropReason::uint()) -> [{Num::uint(),GoodsID::uint(),List::list()},...] | failed.
useItemDropItem(DropID,ParamValue, DropReason) ->
	RetDropList = getDropCfg(DropID),
	Fun = fun(#dropCfg{dropclass = Class} = Cfg,AccIn) ->
				  case goodsDropProcess(Cfg, 1) of
					  #dropResult{goodsID = GoodsID,num = Num,isBind = IsBind} = DR ->
						  case checkDrop(Class) of
							  true ->
								  updateDrop(Class),
								  case lists:keyfind(GoodsID,#dropResult.goodsID,AccIn) of
									  #dropResult{goodsID = GoodsID,num = OldNum,isBind = IsBind} when GoodsID > 0 ->
										  lists:keyreplace(GoodsID,#dropResult.goodsID,AccIn,DR#dropResult{num = OldNum + Num});
									  _ ->
										  [DR | AccIn]
								  end;
							  _ ->
								  AccIn
						  end;
					  _ ->
						  AccIn
				  end
		  end,
	DropResultList = lists:foldl(Fun,[],RetDropList),
	case checkDropNeedSpace(DropResultList) of
		true ->
			dealDropResult(DropResultList,DropReason,ParamValue,true);
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNoEmptyBag),
			failed
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================


%%物品掉落处理
-spec goodsDropProcess(#dropCfg{}, OddParam) -> {Num,playerPackage:goodsList()} | failed
	when OddParam::number(),Num::uint().
%%给定了指定的掉落ID，就不需要区分道具掉落还是开包裹
goodsDropProcess(#dropCfg{
	dropType = DropType,
	dataId = DataID,
	probability = Probability,
	min = Min,
	max = Max,
	dropcontrol = Dropcontrol},
	OddParam
) ->
	Odd = case Dropcontrol of
			  1 ->
				  Probability * OddParam;
			  _ ->
				  Probability
		  end,
	case random:uniform(?MaxWeight) =< Odd of
		true ->
			case DropType of
				?Drop_Type_Goods ->
					dropGoodsDirect(DataID, Min, Max, 0);
				?Drop_Type_PackageItem ->
					dropPackageGoods(DataID, 0);
				?Drop_Type_Coin ->
					dropCoin(DataID,Min,Max);
				?Drop_Type_Rune ->
					dropRune(DataID,Min,Max, 0)
			end;
		false ->
			failed
	end.

-spec dropPackageGoods(PackageID, IsBind) -> playerPackage:goodsList() | failed when
	PackageID::uint(),IsBind::0|1.
dropPackageGoods(PackageID, IsBind) ->
	%%获取要掉落的dropid所指向的配置
	DropPackageCfg = getDropPackageCfg(PackageID),
	case DropPackageCfg of
		#drop_packageCfg{itemId = ItemID, min = Min, max = Max} ->
			dropGoodsDirect(ItemID, Min, Max, IsBind);
		_ ->
			failed
	end.

%%获取所要的掉落包配置列表 
-spec getDropPackageCfg(ID) -> []|#drop_packageCfg{}
	when ID::uint().
getDropPackageCfg(ID) ->
	IDList = getCfg:getKey(cfg_drop_package,ID),	%%根据掉落ID获取配置表中掉落对应的'行'列表
	Fun = fun(Key, AccIn) ->
		case getCfg:getCfgPStack(cfg_drop_package, Key) of
			#drop_packageCfg{packageId = PackageID, weight = Weight} = Cfg->
				case ID =:= PackageID of
					true->
						[{Weight,Cfg} | AccIn];
					false->
						AccIn
				end;
			_ ->
				AccIn
		end
	end,
	List = lists:foldl(Fun, [], IDList),	%%得到指定ID包裹掉落时的权重总和
	case List of
		[] ->
			[];
		_ ->
			misc:calcOddsByWeightList(List)
	end.

%% 掉落货币
dropCoin(CoinType,Min,Max) ->
	Num = misc:rand(Min, Max),
	#dropResult{coinType = CoinType,num = Num}.

%% 掉落符文
dropRune(RuneID,Min,Max,IsBind) ->
	Num = misc:rand(Min, Max),
	#dropResult{goodsID = RuneID,num = Num,isBind = IsBind}.

%%物品掉落具体处理
-spec dropGoodsDirect(GoodsID, Min, Max, IsBind) -> #dropResult{}
	when GoodsID::uint(), Min::number(), Max::number(), IsBind::0|1.
dropGoodsDirect(GoodsID, Min, Max, IsBind) ->
	Num = misc:rand(Min, Max),
	BindOpt = case IsBind of
				  0 ->
					  false;
				  _ ->
					  true
			  end,
	#dropResult{goodsID = GoodsID,num = Num,isBind = BindOpt}.

checkDropNeedSpace(DropResultList) ->
	Fun =
		fun(#dropResult{goodsID = GoodsID,num = Num},{EquipSpaceNum,ItemSpaceNum,GemSpaceNum,PlaRuneNum,PetRuneNum} = AccIn) ->
			if
				GoodsID > 0 ->
					case goods:getGoodsCfg(GoodsID) of
						#itemCfg{maxAmount = MaxPileNum} ->
							SlotNum0 = Num div MaxPileNum,
							SlotNum = case (Num rem MaxPileNum) > 0 of
								          true ->
									          SlotNum0 + 1;
								          _ ->
									          SlotNum0
							          end,
							case goods:isGemItem(GoodsID) of
								true ->
									{EquipSpaceNum,ItemSpaceNum,GemSpaceNum + SlotNum,PlaRuneNum,PetRuneNum};
								_ ->
									{EquipSpaceNum,ItemSpaceNum + SlotNum,GemSpaceNum,PlaRuneNum,PetRuneNum}
							end;
						#equipmentCfg{} ->
							{EquipSpaceNum + Num,ItemSpaceNum,GemSpaceNum,PlaRuneNum,PetRuneNum};
						#runeCfg{type = 0} ->
							%% 角色符文
							{EquipSpaceNum,ItemSpaceNum,GemSpaceNum,PlaRuneNum + Num,PetRuneNum};
						#runeCfg{type = 1} ->
							%% 宠物符文
							{EquipSpaceNum,ItemSpaceNum,GemSpaceNum,PlaRuneNum,PetRuneNum + Num};
						_ ->
							?ERROR_OUT("Drop Error GoodsID:~p,not cfg",[GoodsID]),
							AccIn
					end;
				true ->
					AccIn
			end
		end,
	{ES,IS,GS,PlaRune,PetRune} = lists:foldl(Fun,{0,0,0,0,0},DropResultList),
	R1 = case ES > 0 of
			 true ->
				 EBS = playerPackage:getBagIdleSlotNum(?Item_Location_Equip_Bag),
				 EBS >= ES;
			 _ ->
				 true
		 end,
	R2 = case R1 andalso IS > 0 of
			 true ->
				 IBS = playerPackage:getBagIdleSlotNum(?Item_Location_Bag),
				 IBS >= IS;
			 _ ->
				 R1
		 end,
	R3 =
		case R2 andalso GS > 0 of
			true ->
				GBS = playerPackage:getBagIdleSlotNum(?Item_Location_Gem_Bag),
				GBS >= GS;
			_ ->
				R2
		end,
	R4 = case R3 andalso PlaRune > 0 of
			 true ->
				 {Cur1, Max1} = playerRune:getRuneGridNumber(1),
				 (Max1 - Cur1) >= PlaRune;
			 _ ->
				 R3
	     end,
	R5 = case R4 andalso PetRune of
		     true ->
			     {Cur2, Max2} = playerRune:getRuneGridNumber(2),
			     (Max2 - Cur2) >= PetRune;
		     _ ->
			     R4
	     end,
	R5.

-spec dealDropResult(DropResultList,DropReason,ParamValue,IsNeedGoodsID) ->
	[{Num::uint(),GoodsID::uint(),IsBind::boolean(),List::list()},...] | [{Num::uint(),List::list()},...] when DropResultList::list(),DropReason::uint(),ParamValue::uint(),IsNeedGoodsID::boolean().
dealDropResult(DropResultList,DropReason,ParamValue,IsNeedGoodsID) ->
	PLogItem = #recPLogTSItem{
		old = 0,
		new = 0,
		change = 0,
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_DropItem,
		gold = 0,
		goldtype = 0,
		changReason = DropReason,
		reasonParam = ParamValue
	},
	PLogCoin = #recPLogTSMoney{
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_DropItem,
		reason = DropReason,
		param = 0
	},
	handleDropResult(DropResultList,PLogItem,PLogCoin,IsNeedGoodsID,[]).

handleDropResult([],_PLogItem,_PLogCoin,_IsNeedGoodsID,AccIn) ->
	AccIn;
handleDropResult([#dropResult{coinType = CoinType,num = Num} | T], PLogItem, PLogCoin,IsNeedGoodsID, AccIn) when CoinType > 0 andalso Num > 0 ->
	case CoinType of
		?CoinTypePebble ->
			playerDarkness:addDarknessPebble({playerState:getRoleID(), playerState:getCoin(?CoinTypePebble), Num, 0});
		_ ->
			playerMoney:addCoin(CoinType,Num,PLogCoin#recPLogTSMoney{param = Num})
	end,
	handleDropResult(T,PLogItem, PLogCoin,IsNeedGoodsID, AccIn);
handleDropResult([#dropResult{goodsID = GoodsID,num = Num,isBind = IsBind} | T], PLogItem, PLogCoin,IsNeedGoodsID, AccIn) when GoodsID > 0 andalso Num > 0 ->
	R = case GoodsID < ?Item_RuneIDStart of
			true ->
				case playerPackage:addGoods(GoodsID, Num, IsBind, 0, PLogItem#recPLogTSItem{new = Num, change = Num}) of
					ok ->
						concat(IsNeedGoodsID,GoodsID,IsBind,0,[],AccIn);
					[] ->
						concat(IsNeedGoodsID,GoodsID,IsBind,0,[],AccIn);
					List ->
						concat(IsNeedGoodsID,GoodsID,IsBind,Num,List,AccIn)
				end;
			_ ->
				case playerRune:dropRune(GoodsID, Num, IsBind) of
					[] ->
						concat(IsNeedGoodsID,GoodsID,IsBind,0,[],AccIn);
					List ->
						concat(IsNeedGoodsID,GoodsID,IsBind,Num,List,AccIn)
				end
	    end,
	handleDropResult(T,PLogItem, PLogCoin,IsNeedGoodsID, R);
handleDropResult([#dropResult{goodsID = GoodsID,coinType = CoinType,num = Num} | T],PLogItem, PLogCoin,IsNeedGoodsID, AccIn) ->
	?ERROR_OUT("Error:~p Drop GoodsID:~p CoinType:~p Num:~p",[playerState:getRoleID(),GoodsID,CoinType,Num]),
	handleDropResult(T,PLogItem, PLogCoin,IsNeedGoodsID,AccIn).

concat(true,GoodsID,IsBind,Num,List,AccIn) ->
	[{Num,GoodsID,IsBind,List} | AccIn];
concat(false,_GoodsID,_IsBind,Num,List,AccIn) ->
	[{Num,List} | AccIn].

%%装备掉落处理
-spec equipDropProcess(#equipdropCfg{}, ParamValue, Level, DropType, TeamMemberNum, DropReason,IsDirectAddToBag) -> list()
	when ParamValue::uint(), Level::uint(), DropType::uint(), TeamMemberNum::uint(), DropReason::uint(),IsDirectAddToBag::boolean().
equipDropProcess(#equipdropCfg{
	equipdropId = EquipdropId,
	dropType = DropType,
	dropSource = DropSource,
	times = Times,
	noDrop = NoDrop,
	equipID = EquipID,
	equipQuality = EquipQuality,
	minDiffcult = MinDiffcult,
	maxDiffcult = MaxDiffcult,
	dropLevel = _DropLevel,
	quality0 = Quality0,
	quality1 = Quality1,
	quality2 = Quality2,
	quality3 = Quality3,
	quality4 = Quality4,
	quality5 = Quality5,
	isbind	 = IsBind,
	mapDiffcult = MapDiffcult
}, ParamValue, ItemOrMonterLevel, DropSouceType, TeamMemberNum, DropReason,IsDirectAddToBag) ->
	Fun = fun(_,AccIn) ->
		case getMaxWeight(NoDrop, DropSouceType, TeamMemberNum) of
			true ->
				{RetEquipID, RetQuality} =
					if
					%% 随机掉落装备
						DropType =:= ?EquipDropRandom ->
							%%1. 根据怪物/礼包等级筛选装备
							EquipCfgList = getEquipDropByDropLevel(ItemOrMonterLevel),
							%%2. 通过Monster gain筛选装备
							EquipCfgList1 = getEquipDropPool(EquipCfgList, DropSource),
							%%3. 根据难度系数筛选装备
							EquipCfgList2 = getEquipDropByDiffcult(EquipCfgList1, MinDiffcult, MaxDiffcult),
							%%4. 随机选择一个部位
							EquipCfgList3 = getEquipDropByType(EquipCfgList2),
							EquipCfgList4 = case EquipCfgList3 of
												[] ->
													EquipCfgList3;
												[#equipmentCfg{}] ->
													%%如果此时只剩一件,则跳过某些步骤
													EquipCfgList3;
												_ ->
													%%5. selfchance
													getEquipBySelfChance(EquipCfgList3)
											end,
							%%6. 装备品质
							getEquipDropQuality(EquipCfgList4, Quality0, Quality1, Quality2, Quality3, Quality4, Quality5);
						%% 指定掉落装备
						DropType =:= ?EquipDropSpecify ->
							%%指定品质
							{EquipID,getQualityByDropID(EquipID, EquipQuality)};
						true ->
							{EquipID,?EquipColorTypeWhite}
					end,
				%%?WARN_OUT("map drop equip NewEquipID ~p quality ~p", [RetEquipID, RetQuality]),
				%%发奖
				case IsDirectAddToBag of
					true ->
						equipDropProcessNew(RetEquipID, RetQuality, ParamValue, IsBind, DropReason);
					_ ->
						skip
				end,
				[{RetEquipID,RetQuality,IsBind} | AccIn];
			false ->
				AccIn
		end
	end,
	Count = case MapDiffcult of
				1 -> %%受地图难度影响
					MapID = playerState:getMapID(),
					#mapsettingCfg{difficulty = Difficulty} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
					if
						erlang:is_integer(Difficulty) andalso Difficulty > 0 ->
							#indexGrowthCfg{index32 = Arg} = getCfg:getCfgPStack(cfg_indexGrowth, Difficulty),
							calcTimes(Arg,Times);
						Difficulty =:= 0 ->
							Times;
						true ->
							%%如果出错，则让其不受地图难度影响
							?ERROR_OUT("Error Drop By MapDifficult:1 Difficult:~p in MapID:~p,EquipdropId:~p",[Difficulty,MapID,EquipdropId]),
							Times
					end;
				_ -> %%不受地图难度影响
					Times
			end,
	lists:foldl(Fun,[],lists:seq(1, Count)).

calcTimes(Arg,Times) when Arg =< 1.0 ->
	R = random:uniform(10000),
	case R =< Arg * 10000 of
		true ->
			1 + Times;
		_ ->
			Times
	end;
calcTimes(Arg,Times) ->
	A = erlang:float(Arg),
	%%取出整数部分
	I = erlang:trunc(A),
	%%取出小数部分
	F = A - I,
	calcTimes(F,Times + I).

%%获取DropID相同的掉落配置列表
-spec getDropCfg(DropID) -> []|[#dropCfg{}, ...]
	when DropID::uint().
getDropCfg(DropID) ->
	RowLineList = getCfg:getKey(cfg_drop,DropID),	%%获取到DropID对应配置所有行数列表
	Fun = fun(RowNum, ResultDropCfgs) ->
		%%从行中获取掉落配置
		case getCfg:getCfgPStack(cfg_drop, RowNum) of
			#dropCfg{dropId = DropID1} = DropCfg ->
				case DropID =:= DropID1 of
					true ->
						[DropCfg | ResultDropCfgs];
					false ->
						ResultDropCfgs
				end;
			_ ->
				ResultDropCfgs
		end
	end,
	lists:foldl(Fun, [], RowLineList).

%%获取掉落权重
-spec getMaxWeight(NoDrop, DropSouceType, TeamMemberNum) -> boolean()
	when NoDrop::uint(), DropSouceType::uint(), TeamMemberNum::uint().
getMaxWeight(NoDrop, DropSouceType, TeamMemberNum) ->
	case DropSouceType of
		?Drop_Equip_Source_ByMonster ->
			NewNoDrop = case TeamMemberNum > 0 of %%有效范围内的队友数
							true->
							 	%%队友的数量会影响不掉的几率
								%%有N个队友，则
								List = lists:seq(1, TeamMemberNum + 1),
								Fun = fun(_, X) ->
									NoDrop * X
								end,
								lists:foldl(Fun, 1, List);
							_->
								NoDrop
						end,
			random:uniform(?MaxWeight) > NewNoDrop * ?MaxWeight;
		_->
			random:uniform(?MaxWeight) > NoDrop * ?MaxWeight
	end.
	  
%%根据怪物等级或者礼包等级筛选出符合条件的装备配置
%%参数中的Level是怪物等级或者是礼包等级,用来匹配装备配置
-spec getEquipDropByDropLevel(Level) -> []|[#equipmentCfg{}, ...]
	when Level::uint().
getEquipDropByDropLevel(Level) ->
	Mod = getCfg:getTranslateModule(cfg_equipment),
	IDList = Mod:getRowByItemLevel(Level),
	Fun = fun(Key,ResultCfgs) ->
				  case getCfg:getCfgPStack(cfg_equipment, Key) of
					  #equipmentCfg{itemLevel = ItemLevel} = EquipDropCfg ->
						  case Level - 3 =< ItemLevel andalso ItemLevel =< Level of
							  true ->
								  [EquipDropCfg | ResultCfgs];
							  false ->
								  ResultCfgs
						  end;
					  _->
						  ResultCfgs
				  end
			end,
	lists:foldl(Fun, [], IDList).

%%随机掉落时根据掉落来源获取装备到装备池
-spec getEquipDropPool(EquipCfgList, DropSourceList) -> []|[#equipmentCfg{}, ...]
	when EquipCfgList::[]|[#equipmentCfg{}, ...], DropSourceList::list().
getEquipDropPool(EquipCfgList, DropSourceList)->
	Fun = fun(#equipmentCfg{gain = Gain} = EquipDropCfg, ResultCfgs) ->
				  case lists:member(Gain, DropSourceList) of
					  true->
						  [EquipDropCfg | ResultCfgs];
					  false->
						  ResultCfgs
				  end
			end,
	lists:foldl(Fun, [], EquipCfgList).

%%MinDiffcult<=itemdifficult<= MaxDiffcult 选定
-spec getEquipDropByDiffcult(EquipCfgList, MinDiffcult, MaxDiffcult) -> []|[#equipmentCfg{}, ...]
	when EquipCfgList::[]|[#equipmentCfg{}, ...],
		MinDiffcult::uint(), 
		MaxDiffcult::uint().
getEquipDropByDiffcult(EquipCfgList, MinDiffcult, MaxDiffcult) ->
	Fun = fun(#equipmentCfg{itemDifficult = ItemDifficult} = EquipDropCfg, ResultCfgs) ->
				  case MinDiffcult =< ItemDifficult andalso ItemDifficult =< MaxDiffcult of
					  true ->
						  [EquipDropCfg | ResultCfgs];
					  false ->
						  ResultCfgs
				  end
		  end,
	lists:foldl(Fun, [], EquipCfgList).

%%随机选择一个部位，筛选出这个部位的所有装备
-spec getEquipDropByType(EquipCfgList) -> []|[#equipmentCfg{}, ...]
	when EquipCfgList::[]|[#equipmentCfg{}, ...].
getEquipDropByType(EquipCfgList)->
	Fun = fun(#equipmentCfg{type = Type},TypeList) ->
				  [Type | TypeList]
			end,
	TypeList1 = lists:foldl(Fun, [], EquipCfgList),
	case TypeList1 of
		[] ->
			[];
		_ ->
			NewTypeList = lists:usort(TypeList1),
			RandomNum = random:uniform(erlang:length(NewTypeList)),
			DropType = lists:nth(RandomNum, NewTypeList),%%选定类型

			Fun1 = fun(#equipmentCfg{type = Type1} = EquipDropCfg, ResultCfgs) ->
				case Type1 =:= DropType of
					true ->
						[EquipDropCfg | ResultCfgs];
					false ->
						ResultCfgs
				end
			end,
			lists:foldl(Fun1, [], EquipCfgList)
	end.

%%根据selfchance权重决定选取什么样的职业
-spec getEquipBySelfChance(EquipCfgList) -> []|[#equipmentCfg{}, ...]
	when EquipCfgList::[]|[#equipmentCfg{}, ...].
getEquipBySelfChance(EquipCfgList) ->
	#globalsetupCfg { setpara = [Selfchance]} = getCfg:getCfgPStack(cfg_globalsetup, selfChance),
	PlayerCareer = playerState:getCareer(),
	NewDropList =
		case random:uniform(?MaxWeight) =< Selfchance * ?MaxWeight of
			true ->%%移除不适合的装备
				Fun = fun(#equipmentCfg{class = Class} = EquipDropCfg, ResultCfgs) ->
					case Class =:= PlayerCareer of
						true ->
							[EquipDropCfg | ResultCfgs];
						false ->
							ResultCfgs
					end
				end,
				lists:foldl(Fun, [], EquipCfgList);
			false ->%%移除适合的装备
				Fun = fun(#equipmentCfg{class = Class} = EquipDropCfg, ResultCfgs) ->
					case Class =/= PlayerCareer of
						true ->
							[EquipDropCfg | ResultCfgs];
						false ->
							ResultCfgs
					end
				end,
				lists:foldl(Fun, [], EquipCfgList)
		end,
	%%如果该步结束，装备池为空，则将前一步剩余的结果返回
	case NewDropList of
		[] ->
			EquipCfgList;
		_ ->
			NewDropList
	end.
	

%%普通装备品质  添加新品质记得修改返回值范围
-spec getEquipDropQuality(EquipCfgList,
	WhiteWeight,
	GreenWeight,
	BlueWeight,
	PurpleWeight,
	OrangeWeight,
	SuitWeight
) ->  {EquipID::uint(), uint()}
	when EquipCfgList::[]|[#equipmentCfg{}, ...],
	WhiteWeight::uint(),
	GreenWeight::uint(),
	BlueWeight::uint(),
	PurpleWeight::uint(),
	OrangeWeight::uint(),
	SuitWeight::uint().
getEquipDropQuality(EquipCfgList, WhiteWeight, GreenWeight, BlueWeight, PurpleWeight, OrangeWeight, SuitWeight) ->
	%%添加幸运
%%	LuckyValue = case getCfg:getCfgPStack(cfg_battlePropInfo, ?Prop_lucky) of
%%					 #battlePropInfoCfg{baseValue = BaseValue} ->
%%						 BaseValue;
%%					 _ ->
%%						 0
%%				 end,
	%% 取幸运值
	NewOrangeWeight = erlang:trunc(OrangeWeight),
	NewSuitWeight = erlang:trunc(SuitWeight),

	Quality = misc:calcOddsByWeightList([
		{WhiteWeight, ?EquipColorTypeWhite},
		{GreenWeight, ?EquipColorTypeGreen},
		{BlueWeight, ?EquipColorTypeBlue},
		{PurpleWeight, ?EquipColorTypePurple},
		{NewOrangeWeight, ?EquipColorTypeOrange},
		{NewSuitWeight, ?EquipColorTypeRed}
	]),

	%%分离出普通，独特，套装列表
	Fun = fun(#equipmentCfg{qualityType = QualityType} = EquipDropCfg, [NormalCfgs, SpecialCfgs, SuitCfgs]) ->
		case QualityType of
			?EquipTypeSpecial ->%%独特（橙装）
				[NormalCfgs, [EquipDropCfg | SpecialCfgs], SuitCfgs];
			?EquipTypeSuit ->%%套装（红装）
				[NormalCfgs, SpecialCfgs, [EquipDropCfg | SuitCfgs]];
			_ ->
				[[EquipDropCfg | NormalCfgs], SpecialCfgs, SuitCfgs]
		end
	end,
	[NewNormalList, OrangeList, NewSuitList] = lists:foldl(Fun, [[],[],[]], EquipCfgList),

	%%如果选择到了独特/套装，但是装备池中没有独特/套装装备，则降为紫色品质
	%%如果品质是独特/套装，则根据装备表中的装备权重（weight字段）再做一次随机选择，得到一件装备掉落
	if
		Quality =:= ?EquipColorTypeOrange ->
			case OrangeList of
				[] ->
					{getDropEquipID(NewNormalList), ?EquipColorTypePurple};
				_ ->
					{selectOrangeOrRedByWeight(OrangeList),?EquipColorTypeOrange}
			end;
		Quality =:= ?EquipColorTypeRed ->
			case NewSuitList of
				[] ->
					{getDropEquipID(NewNormalList), ?EquipColorTypePurple};
				_ ->
					{selectOrangeOrRedByWeight(NewSuitList),?EquipColorTypeRed}
			end;
		true ->
			%%普通装备，其它品质
			{getDropEquipID(NewNormalList), Quality}
	end.

-spec selectOrangeOrRedByWeight(EquipCfgList) -> ID::uint() when
	EquipCfgList::[]|[#equipmentCfg{}, ...].
selectOrangeOrRedByWeight(EquipCfgList) ->
	Fun = fun(#equipmentCfg{iD = ID,weight = Weight},AccIn) ->
		[{Weight,ID} | AccIn]
		end,
	List = lists:foldl(Fun,[],EquipCfgList),
	ID = misc:calcOddsByWeightList(List),
	ID.

%%随机选取一件装备 返回装备ID值
-spec getDropEquipID(EquipCfgList) -> uint()
	when EquipCfgList::[]|[#equipmentCfg{}, ...].
getDropEquipID(EquipCfgList) ->
	case EquipCfgList of
		[] ->
			0;
		_ ->
			Len = erlang:length(EquipCfgList),
			case lists:nth(random:uniform(Len), EquipCfgList) of
				#equipmentCfg{iD = ID} ->
					ID;
				_->
					0
			end
	end.

%%指定ID装备品质,如果是独特/套装，则无需指定品质
-spec getQualityByDropID(EquipID, EquipQuality) -> uint()
	when EquipID::uint(),
		EquipQuality::uint().
getQualityByDropID(EquipID, EquipQuality) ->
	case EquipQuality =:= 0 of
		true ->
			case getCfg:getCfgPStack(cfg_equipment, EquipID) of
				#equipmentCfg{qualityType = QualityType} ->
					QualityType;
				_->
					?EquipColorTypeWhite
			end;			
		false ->
			EquipQuality
	end.

%%给玩家发掉落装备
-spec equipDropProcessNew(EquipDropID, EquipQuality, ParamValue, IsBind, DropReason) -> playerPackage:goodsList()
	when EquipDropID::uint(), 
		EquipQuality::uint(),
		ParamValue::uint(),
		IsBind::uint(),
		DropReason::uint().
equipDropProcessNew(EquipDropID, EquipQuality, ParamValue, IsBind, DropReason) ->
	case EquipDropID =:= 0 of
		true->
			ok;
		_->
			PLog = #recPLogTSItem{
				old = 0,
				new = 1,
				change = 1,
				target = ?PLogTS_PlayerSelf,
				source = ?PLogTS_DropItem,
				gold = 0,
				goldtype = 0,
				changReason = DropReason,
				reasonParam = ParamValue
			},
			playerPackage:addGoods(EquipDropID, 1, misc:convertBoolFromInt(IsBind), EquipQuality, PLog)
	end.

%%获取装备掉落配置列表
-spec getEquipDropCfg(ID) -> []|[#equipdropCfg{}, ...] 
	when ID::uint().
getEquipDropCfg(ID) ->
	IDList = getCfg:getKey(cfg_equipdrop,ID),
	Fun = fun(Key, ResultCfgs) ->
				  case getCfg:getCfgPStack(cfg_equipdrop, Key) of
					  #equipdropCfg{equipdropId = DropID} = EquipDropCfg ->
						  case DropID =:= ID of
							  true ->
								  [EquipDropCfg | ResultCfgs];
							  false ->
								  ResultCfgs
						  end;
					  _ ->
						  ResultCfgs
				  end
		  end,
	lists:foldl(Fun, [], IDList).



