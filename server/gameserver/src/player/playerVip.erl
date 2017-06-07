%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 爵位vip系统
%%% @end
%%% Created : 17. 十二月 2014 16:09
%%%-------------------------------------------------------------------
-module(playerVip).
-author("tiancheng").

-include("playerPrivate.hrl").
-define(Rec_sourceshop_forever_limit_Type4KnightBuy,1).%%标记表中的类型
%% API
-export([
	init/0,
	topUpMoney/1,
	vipReputationChange/0,
	addReputation/1,
	getReputation/0,
	dealRepPowerValue/2,
	getVipReward/1,
	addVipBuff/0,
	buy/1,
	transmit/1
]).

-define(RepEvent,[
	{?RepEvent_CDTime, fun reduceTransferCDTime/4},
	{?RepEvent_BuyItem, fun reduceMoneyBuyItem/4},
	{?RepEvent_DecomposeItem, fun decomposeItem/4},
	{?RepEvent_CopyMapCoin, fun addCopyMapCoinReward/4},
	{?RepEvent_Luckly, fun addKillMonsterDropLuckly/4},
	{?RepEvent_CMTimes, fun addCopyMapTimes/4},
	{?RepEvent_MonterExp, fun addKillMonsterExp/4},
	{?RepEvent_Mount, fun addSpeedByMount/4},
	{?RepEvent_CopyMapExp, fun addCopyMapExpReward/4},
	{?RepEvent_Honor, fun addHonor/4},
    {?RepEvent_ChatCDTime, fun vipChatCDTime/4},
    {?RepEvent_BuyLadderNum, fun buyLadderNum/4}
]).

-define(VipRewardLVList,[
	?Setting_PlayerBitVarReadOnly_GetVipRewardByLV1,
	?Setting_PlayerBitVarReadOnly_GetVipRewardByLV2,
	?Setting_PlayerBitVarReadOnly_GetVipRewardByLV3,
	?Setting_PlayerBitVarReadOnly_GetVipRewardByLV4,
	?Setting_PlayerBitVarReadOnly_GetVipRewardByLV5,
	?Setting_PlayerBitVarReadOnly_GetVipRewardByLV6,
	?Setting_PlayerBitVarReadOnly_GetVipRewardByLV7,
	?Setting_PlayerBitVarReadOnly_GetVipRewardByLV8,
	?Setting_PlayerBitVarReadOnly_GetVipRewardByLV9,
	?Setting_PlayerBitVarReadOnly_GetVipRewardByLV10,
	?Setting_PlayerBitVarReadOnly_GetVipRewardByLV11,
	?Setting_PlayerBitVarReadOnly_GetVipRewardByLV12,
	?Setting_PlayerBitVarReadOnly_GetVipRewardByLV13,
	?Setting_PlayerBitVarReadOnly_GetVipRewardByLV14,
	?Setting_PlayerBitVarReadOnly_GetVipRewardByLV15,
	?Setting_PlayerBitVarReadOnly_GetVipRewardByLV16
]).

%% 初始化
-spec init() -> ok.
init() ->
	ok.

%% 上线增加VIPBUFF
-spec addVipBuff() -> ok.
addVipBuff() ->
	case getVipLevelList() of
		LvlList when erlang:is_list(LvlList) andalso LvlList =/= [] ->
			Level = erlang:max(0, lists:max(LvlList)),

			case playerState:isFirstEnterMap() of
				false ->
					addVipBuff(Level, LvlList -- [Level]);
				_ ->
					skip
			end,
			ok;
		_ ->
			skip
	end,
	ok.

-spec vipReputationChange() -> ok.
vipReputationChange() ->
	L = getPowerList(),
	playerPropSync:setString(?SerProp_VipPowerList, L),

	%% 设置vip等级
	case getVipLevelList() of
		LvlList when erlang:is_list(LvlList) andalso LvlList =/= [] ->
			Level = erlang:max(0, lists:max(LvlList)),
			playerState:setVip(Level),
			changeChatCD(),

			case playerState:isFirstEnterMap() of
				false ->
					addVipBuff(Level, LvlList -- [Level]);
				_ ->
					skip
			end,

			?DEBUG_OUT("vipReputationChange player vip level:~p", [Level]),
			ok;
		_ ->
			skip
	end,
	ok.

%% 充值成功多少钱(元)
-spec topUpMoney(Money::float() | uint()) -> ok.
topUpMoney(MoneyU) when erlang:is_integer(MoneyU) andalso MoneyU > 0 ->
	addReputation(MoneyU),
	ok;
topUpMoney(MoneyF) when erlang:is_float(MoneyF) ->
	topUpMoney(erlang:trunc(MoneyF));
topUpMoney(_MoneyF) ->
	ok.


%% 增加爵位声望
-spec addReputation(AddValue::uint()) -> uint().
addReputation(AddValue) when erlang:is_integer(AddValue) andalso AddValue > 0 ->
	OldValue = getReputation(),
	NewValue = OldValue + AddValue,
	Ret = playerPropSync:setInt(?PriProp_Reputation, NewValue),
	?LOG_OUT("addReputation:roleid=~p,oldvalue=~p,addvlaue=~p,ret=~p", [playerState:getRoleID(),OldValue,AddValue,Ret]),
	playerMsg:sendErrorCodeMsg(?ErrorCode_BagGainVipReputation, [AddValue]),

	%% 立即保存一次
	playerSave:saveRoleBase(),

	NewValue;
addReputation(AddValue) ->
	?ERROR_OUT("addReputation error:~s,~p,~p", [playerState:getName(),playerState:getRoleID(),AddValue]),
	getReputation().

%% 查询爵位声望
-spec getReputation() -> uint().
getReputation() ->
	playerPropSync:getProp(?PriProp_Reputation).

%% 执行爵位事件，可能需要返回值
-spec dealRepPowerValue(RepType::reputation(), Param::term()) -> term().
dealRepPowerValue(RepType, Param) when RepType >= ?Reputation_Start andalso RepType =< ?Reputation_End ->
	%% 获取拥有的爵位权限列表
	L = playerPropSync:getProp(?SerProp_VipPowerList),
	case lists:keyfind(RepType, 1, L) of
		{_, Level} ->
			case getCfg:getCfgPStack(cfg_vip_power, RepType, Level) of
				#vip_powerCfg{powerType = UseType} = Conf
					when erlang:is_integer(UseType) andalso UseType > 0 ->
					case lists:keyfind(UseType, 1, ?RepEvent) of
						{UseType, Fun} ->
							Fun(Param, Conf#vip_powerCfg.param1, Conf#vip_powerCfg.param2, Conf#vip_powerCfg.param3);
						_ ->
							?ERROR_OUT("dealRepPowerValue:~p,RepType=~p,Level=~p,UseType=~p",
									   [playerState:getRoleID(),RepType,Level,UseType]),
							undefined
					end;
				_ ->
					undefined
			end;
		_ ->
			undefined
	end.

%% 领取爵位等级对应的奖励道具
-spec getVipReward(VipLevel::uint()) -> ok.
getVipReward(VipLevel) ->
	case VipLevel > ?VipMinLevel andalso VipLevel < ?VipMaxLevel of
		true ->
			case lists:member(VipLevel, getVipLevelList()) of
				true ->
					case getVipRevardTakeState(VipLevel) of
						false ->
							#knighted_levelCfg{
										reward_item = RewardList
							} = getCfg:getCfgPStack(cfg_knighted_level, VipLevel),
							giveRewardItems(RewardList),
							setVipRevardTakeState(VipLevel);
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_VipRewardHaveGet)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_VipLevelLimit)
			end;
		_ ->
			?ERROR_OUT("playerID:~p,getVipAward by Lv:~p",[playerState:getRoleID(),VipLevel])
	end,
	ok.

%%根据道具信息列表发放奖励
-spec giveRewardItems(ItemInfoList :: list()) -> ok.
giveRewardItems(ItemInfoList) ->
	Fun = fun({ItemID, ItemNum}) ->
		case erlang:is_integer(ItemID) andalso ItemNum > 0 of
			true ->
				Plog = #recPLogTSItem{
					old = 0,
					new = ItemNum,
					change = ItemNum,
					target = ?PLogTS_PlayerSelf,
					source = ?PLogTS_Vip,
					gold = 0,
					goldtype = 0,
					changReason = ?ItemSourceVipLevelAward,
					reasonParam = ItemID
				},
				playerPackage:addGoodsAndMail(ItemID, ItemNum, true, 0, Plog);
			_ ->
				skip
		end
	end,
	lists:foreach(Fun, ItemInfoList),
	ok.

%% 设置爵位奖励领取状态
-spec setVipRevardTakeState(VipLevel) -> boolean() when 
	VipLevel::integer().
setVipRevardTakeState(VipLevel) ->
	GetVipRewardByLV = lists:nth(VipLevel, ?VipRewardLVList),
	playerVariant:setPlayerBitVariant(GetVipRewardByLV, true).

%% 获取爵位奖励领取状态
-spec getVipRevardTakeState(VipLevel) -> boolean() when 
	VipLevel::integer().
getVipRevardTakeState(VipLevel) ->
	RoleId = playerState:getRoleID(),
	GetVipRewardByLV = lists:nth(VipLevel, ?VipRewardLVList),
	variant:getPlayerBitVariant(RoleId, GetVipRewardByLV).
		
%% 降低传送冷却时间
reduceTransferCDTime(InParam, ConfParam1, _ConfParam2, _ConfParam3) ->
	case erlang:is_integer(InParam) andalso erlang:is_integer(ConfParam1) of
		true ->
			erlang:round(InParam * ((100 - ConfParam1) / 100));
		_ ->
			InParam
	end.

%% 通过商店购买道具时降低价格
reduceMoneyBuyItem(InParam, ConfParam1, _ConfParam2, _ConfParam3) ->
	case erlang:is_integer(InParam) andalso erlang:is_integer(ConfParam1) of
		true ->
			%% 最小值为1
			erlang:max(1, erlang:round(InParam * ((100 - ConfParam1) / 100)));
		_ ->
			InParam
	end.

%% 分解获得精华加成
decomposeItem(InParam, ConfParam1, _ConfParam2, _ConfParam3) ->
	case erlang:is_integer(InParam) andalso erlang:is_integer(ConfParam1) of
		true ->
			erlang:round(InParam + InParam * (ConfParam1 / 100));
		_ ->
			InParam
	end.

%% 副本通关奖励金币奖励增加
addCopyMapCoinReward(InParam, ConfParam1, _ConfParam2, _ConfParam3) ->
	case erlang:is_integer(InParam) andalso erlang:is_integer(ConfParam1) of
		true ->
			erlang:round(InParam + InParam * (ConfParam1 / 100));
		_ ->
			InParam
	end.

%% 击杀怪物获得战利品概率提高（幸运）
addKillMonsterDropLuckly(_InParam, ConfParam1, _ConfParam2, _ConfParam3) ->
	ConfParam1.

%% 增加副本可通关次数
addCopyMapTimes(InParam, ConfParam1, ConfParam2, _ConfParam3) ->
	case erlang:is_integer(ConfParam1) andalso erlang:is_integer(ConfParam2) of
		true ->
			%% 从日常的配置中读取
			case getCfg:getCfgPStack(cfg_dailyInterface, ConfParam2) of
				#dailyInterfaceCfg{mapid = MapidList} when erlang:is_list(MapidList) ->
					case lists:keymember(InParam, 2, MapidList) of
						true ->
							ConfParam1;
						_ ->
							undefined
					end;
				_ ->
					undefined
			end;
		_ ->
			undefined
	end.

%% 购买更多的竞技场次数
buyLadderNum(_InParam, ConfParam1, _ConfParam2, _ConfParam3) ->
	erlang:max(ConfParam1, 0).

%% 打怪获得经验提升
addKillMonsterExp(InParam, ConfParam1, _ConfParam2, _ConfParam3) ->
	case erlang:is_integer(InParam) andalso erlang:is_integer(ConfParam1) of
		true ->
			erlang:round(InParam + InParam * (ConfParam1 / 100));
		_ ->
			InParam
	end.

%% 骑乘状态下，速度提升
addSpeedByMount(_InParam, ConfParam1, _ConfParam2, _ConfParam3) ->
	ConfParam1.

%% 副本结算奖励时，经验增加百分之多少
addCopyMapExpReward(InParam, ConfParam1, _ConfParam2, _ConfParam3) ->
	case erlang:is_integer(InParam) andalso erlang:is_integer(ConfParam1) of
		true ->
			erlang:round(InParam + InParam * (ConfParam1 / 100));
		_ ->
			InParam
	end.

%% 荣誉获得速度提升
addHonor(InParam, ConfParam1, _ConfParam2, _ConfParam3) ->
	case erlang:is_integer(InParam) andalso erlang:is_integer(ConfParam1) of
		true ->
			erlang:round(InParam + InParam * (ConfParam1 / 100));
		_ ->
			InParam
	end.

%% 获取聊天CD减少
vipChatCDTime(_InParam, _ConfParam1, _ConfParam2, _ConfParam3) ->
    #globalsetupCfg{setpara = ChatCD2} = getCfg:getCfgPStack(cfg_globalsetup, chat_cd2),
    case erlang:is_list(ChatCD2) andalso erlang:length(ChatCD2) =:= 4 of
        true ->
            ChatCD2;
        _ ->
            undefined
    end.

%% 获取爵位对应的特权列表[{id,lvl},...]
-spec getPowerList() -> [{ID::uint(), Level::uint()},...].
getPowerList() ->
	%% 得到满足的id列表
	L1 = getVipLevelList(),

	%% 拼装所有的权限
	FunP2 = fun(Param, LL) ->
		case Param of
			{ID, Lvl} ->
				case lists:keyfind(ID, 1, LL) of
					{_, OldLvl} ->
						case Lvl > OldLvl of
							true ->
								%% 替换
								lists:keyreplace(ID, 1, LL, {ID, Lvl});
							_ ->
								LL
						end;
					_ ->
						%% 插入
						[{ID, Lvl}|LL]
				end;
			ErrorConf ->
				?ERROR_OUT("getPowerList:~p,~p",[playerState:getRoleID(),ErrorConf]),
				LL
		end
	end,

	FunP = fun(Index, AccList) ->
		case getCfg:getCfgPStack(cfg_knighted_level, Index) of
			#knighted_levelCfg{power = PowerList} when erlang:is_list(PowerList) ->
				lists:foldl(FunP2, AccList, PowerList);
			_ ->
				AccList
		end
	end,
	lists:foldl(FunP, [], L1).

%% 得到已达到或超过的爵位等级列表
-spec getVipLevelList() -> VipLevelList :: list().
getVipLevelList() ->
	%% 获取爵位声望
	Rep = getReputation(),
	%% 得到所有等级
	LvList = getCfg:get1KeyList(cfg_knighted_level),

	Fun = fun(Index) ->
		#knighted_levelCfg{exp = Exp} = getCfg:getCfgPStack(cfg_knighted_level, Index),
		RExp = if
				   Exp =:= 0 ->
					   ?MaxReputation;
				   Exp < 0 ->
					   ?MaxReputation;
				   true ->
					   Exp
			   end,
		Rep >= RExp
	end,
	lists:filter(Fun, LvList).

%%爵位购买id
-spec buy(ID::uint32()) ->ok.
buy(ID) ->
	BoughtIDList = playerShop:getMyHasForeverLimitID(?Rec_sourceshop_forever_limit_Type4KnightBuy),
	Succ =
	case lists:member(ID, BoughtIDList) of
		false ->
			buy1(ID);
		true ->
			?ERROR_OUT("has bought id:~p",[ID]),
			false
	end,
	playerMsg:sendNetMsg(#pk_GS2U_RequesBuyIDAck{
												 type = ?Rec_sourceshop_forever_limit_Type4KnightBuy,
												 id = ID,
												 succ = Succ
												}),
	ok.

%% 传送
-spec transmit(TargetRoleID::uint64()) -> ok.
transmit(TargetRoleID) ->
	%% 1.战斗和死亡状态不让传送
	ActStatus = playerState:getActionStatus(),
	case ActStatus =:= ?CreatureActionStatusDead orelse playerState:isPlayerBattleStatus() of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailedPlayerDeadOrBattle);
		_ ->
			%% 2.正在切换地图中不能传送
			case ActStatus =/= ?CreatureActionStatusChangeMap of
				true ->
					%%% 3.vip等级不足不能传送
					#globalsetupCfg{setpara = [_VipLvLimit, TransmitCD]} =
						getCfg:getCfgPStackWithDefaultValue(
							cfg_globalsetup,
							#globalsetupCfg{setpara = [1, 15]},
							friend2_Transmit
							),
					%case playerState:getVip() >= VipLvLimit of
					%	true ->
							%% 4.CD没到不能传送
							TimeNow = time:getSyncUTCTimeFromDBS(),
							LeftTime = TransmitCD - (TimeNow - playerState:getVipLastTransmit()),
							case LeftTime =< 0 of
								true ->
									playerMap:tryGetFriendPos(TargetRoleID);
								_ ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_VipTranmitCD, [LeftTime])
							end;
					%	_ ->
					%		playerMsg:sendErrorCodeMsg(?ErrorCode_VipLevelLimit)
					%end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
			end
	end,
	ok.

%%取配置项执行购买
-spec buy1(ID::uint32()) ->boolean().
buy1(ID) ->
	VipLevel = playerState:getVip(),
	case getCfg:getCfgPStack(cfg_knightedPackage, ID) of
		#knightedPackageCfg{
							level=Level,
							item = ItmeList,
							diamonds = DiamondNum,
							integral = GiveIntegral
						   } when VipLevel >= Level ->
			UseCoinType = ?CoinTypeDiamond,
			CoinTypeDiamondNum = playerState:getCoin(UseCoinType),
			case CoinTypeDiamondNum >= DiamondNum of
				true ->
					[ giveGoods(ItemID,ItemNum,UseCoinType,DiamondNum) || {ItemID,ItemNum} <-ItmeList ],
					
					playerMoney:decCoin(UseCoinType, DiamondNum,
										#recPLogTSMoney{reason=?CoinUseGodKnightBuy,param=ID,target=?PLogTS_Vip,source=?PLogTS_PlayerSelf}),
					playerMoney:addCoin(?CoinTypeScore, GiveIntegral,
										#recPLogTSMoney{reason=?CoinSourceVipBuySend,param=ID,target=?PLogTS_PlayerSelf,source=?PLogTS_PlayerSelf}),
					
					PlayerID = playerState:getRoleID(),
					case edb:dirtyReadRecord(rec_sourceshop_forever_limit, {PlayerID,?Rec_sourceshop_forever_limit_Type4KnightBuy} ) of
						[#rec_sourceshop_forever_limit{sourceshopIDList=LBinStr}|_] ->
							SaveIDS1 = misc:string_to_term( misc:binToString(LBinStr) ),
							SaveIDS = SaveIDS1 ++[ID],
							NewRec = #rec_sourceshop_forever_limit{
																   roleID = {PlayerID,?Rec_sourceshop_forever_limit_Type4KnightBuy},
																   type = ?Rec_sourceshop_forever_limit_Type4KnightBuy,
																   sourceshopIDList = misc:term_to_string(SaveIDS)
																  },
							edb:writeRecord(update_rec_sourceshop_forever_limit,NewRec),
							edb:writeRecord(rec_sourceshop_forever_limit, NewRec),
							ok;
						[] ->
							NewRec = #rec_sourceshop_forever_limit{
																   roleID = {PlayerID,?Rec_sourceshop_forever_limit_Type4KnightBuy},
																   type = ?Rec_sourceshop_forever_limit_Type4KnightBuy,
																   sourceshopIDList = misc:term_to_string([ID])
																  },
							edb:writeRecord(new_rec_sourceshop_forever_limit,NewRec),
							edb:writeRecord(rec_sourceshop_forever_limit, NewRec),
							ok
					end,
					?LOG_OUT("rec_sourceshop_forever_limit roleid:~p type=~p NewRec:~p additem:~p",[PlayerID,
																									?Rec_sourceshop_forever_limit_Type4KnightBuy,
																									NewRec#rec_sourceshop_forever_limit.sourceshopIDList,
																									ID]),
					true;
				false -> 
					playerMsg:sendErrorCodeMsg(?ErrorCode_MallBuy_Diamond_Not_Enough),
					false
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_VipLevelLimit),
			false
	end.

-spec giveGoods(ItemID::uint32(),Number::uint32(),UseCoinType::coinType(),CoinNum::int()) -> ok.
giveGoods(ItemID,Number,UseCoinType,CoinNum) ->
	{RealCount,RealEquipQuality} =
		case ItemID < ?Item_Differentiate of
			true ->	{Number,0};
			false ->{1,Number}
		end,
	Plog = #recPLogTSItem{
						  old = 0,
						  new = RealCount,
						  change = RealCount,
						  target = ?PLogTS_PlayerSelf,
						  source = ?PLogTS_Vip,
						  gold = CoinNum,
						  goldtype = UseCoinType,
						  changReason = ?ItemSourceKnightBuy,
						  reasonParam = ItemID
						 },
	
	playerPackage:addGoodsAndMail(ItemID, RealCount, true, RealEquipQuality, Plog),
	ok.

%% vip聊天CD
-spec changeChatCD() -> ok.
changeChatCD() ->
	case playerVipInter:getVipChatCDTime() of
		undefined ->
			skip;
		Time ->
			TimeList = playerChat:changeStruct(Time),
			playerState:setCdChatTime(TimeList)
	end,
	ok.

%% VIP特权BUFF
addVipBuff(0, _OldLevelList) ->
	ok;
addVipBuff(NewLevel, OldLevelList) ->
	%% 先移除之前的BUFF
	F =
		fun(Lvl) ->
			#knighted_levelCfg{vip_buff = BuffID} = getCfg:getCfgPStack(cfg_knighted_level, Lvl),
			playerBuff:delBuff(BuffID)
		end,
	lists:foreach(F, OldLevelList),

	%% 添加新BUFF
	#knighted_levelCfg{vip_buff = AddBuffID} = getCfg:getCfgPStack(cfg_knighted_level, NewLevel),
	PlayerLevel = playerState:getLevel(),
	playerBuff:addBuff(AddBuffID, PlayerLevel),
	ok.