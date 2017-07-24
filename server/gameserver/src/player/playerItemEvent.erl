%%
%% @author zhongyunawei
%% @doc @todo 该文件专门处理道具事件.

-module(playerItemEvent).
-author(zhongyuanwei).
-include("playerPrivate.hrl").
-define(BattlePropMedicineEffect, 6).

%%使用道具事件集
%道具使用触发的事件类型
-define(UseItemEventList,[
	{?Item_Use_Unkown,				fun doNothing/2},				%% 1 无效类型不做事
	{?Item_Use_Buffer,				fun useItemCreateBuff/2},		%% 2 产生一个buff
	{?Item_Use_HPMP,				fun useItemChangeHPMP/2},		%% 3 立即恢复HPMP
	{?Item_Use_Skill,				fun useItemTrigerSkill/2},		%% 4 使用技能
	{?Item_Use_PetEgg,				fun useItemGetPet/2},          	%% 5 获得宠物
	{?Item_Use_GetBindedGold,		fun useItemGetMoney/2},   		%% 6 获得金钱
	{?Item_Use_OpenGift,			fun useItemOpenEquipPackge/2},	%% 7 开装备礼包
	{?Item_Use_LiBao,				fun useItemOpenItemPackge/2},	%% 8 开道礼包
	{?Item_Use_GetTask,				fun useItemGetTask/2},         	%% 9 获取任务
	{?Item_Use_AddExploit,			fun useItemGetAddExploit/2},    %% 10 增加功勋值
	{?Item_Use_GetEXP,				fun useItemGetExp/2},         	%% 11 获得经验
	{?Item_Use_AddExpByLevel,		fun useItemAddExpByLevel/2},   	%% 12 据等级给经验
	{?Item_Use_MultiExp,			fun useItemMultyExp/2},        	%% 13 增加多陪经验
	{?Item_Use_PetMount,			fun useItemGetPetMount/2},    	%% 14 获得骑宠
	{?Item_Use_AddOneLevel,			fun useItemAddOneLevel/2},		%% 15 使用道具后等级加1
	{?Item_Use_CallMonster,	        fun useItemCallMonster/2},	    %% 16 召唤怪物道具
	{?Item_Use_AddFashionCloths,	fun useItemAddFashionCloths/2},	%% 17 使用后点亮该时装或延长有效时长
	{?Item_Use_AddVipReputation,	fun useItemAddVipReputation/2},	%% 18 使用增加爵位声望的道具
	{?Item_Use_FindTreasure,		fun useItemFindTreasure/2},		%% 19 藏宝图道具，使用后知道宝藏地点
	{?Item_Use_RandTitle,			fun useItemRandTitle/2},  		%% 20 称号道具，使用“称号词组卷轴”随机获得一个当前未获得的一个词组
	{?Item_Use_MonthCard,			fun useItemAddMonthCard/2},		%% 21 月卡道具,使用后增加30天（绝对值）月卡服务
	{?Item_Use_SpecTitle,			fun useItemSpecTitle/2},  		%% 22 称号道具，使用“称号效果卷轴”获得对应特定编号的效果或者词组
	{?Item_Use_AddCopyMapDropOdd,	fun useItemAddCopyMapDropOdd/2},%% 23 增加副本掉落几率道具
	{?Item_Use_DarknessTransfer,	fun useItemDarknessTransfer/2}, %% 24 黑暗之地传送道具
	{?Item_Use_ClearKv,				fun useItemClearKv/2},  		%% 25 清理杀戮值道具
	{?Item_Use_ChangeName,			fun useItemChangeName/2},		%% 26 改名卡
	{?Item_Use_GuildContribute,		fun useItemGuildContribute/2},	%% 27 增加军团贡献
	{?Item_Use_WingRise,			fun useItemWingRise/2},			%% 28 翅膀升级物品的使用
	{?Item_Use_OpenAllFun,			fun useItemOpenAllFun/2},		%% 29 打开所有功能模块
	{?Item_Use_GrowUp,				fun useItemBuyGrowUp/2},		%% 29 使用可打开成长礼包
	{?Item_Use_PlayerBQ,			fun useItemPlayerBQ/2},			%% 32 使用获得表情
	{?Item_Use_PlayerDZ,			fun useItemPlayerDZ/2},			%% 33 使用获得动作
	{?Item_Use_StarMoon,			fun useItemOpenItemPackge/2},	%% 34 使用星月秘盒获得
	{?Item_Use_PetExp,				fun useItemAddPetExp/2}			%% 35 宠物经验丹
]).

-record(recUseItemArg,{
	itemType,       %%道具类型
	useType,		%%使用类型
	useNum,			%%使用数量
	level,			%%道具使用等级
	useArg1,        %%使用道具的参数1
	useArg2,        %%使用道具的参数2
	useArg3,        %%使用道具的参数3
	useArg4         %%使用道具的参数4
}).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	triggerUseItemEvent/2
]).

%%触发道具使用事件的指派函数
-spec triggerUseItemEvent(#rec_item{},UseNum) -> UsedNum::uint() when UseNum::uint().
triggerUseItemEvent(#rec_item{itemID = ID} = Item,UseNum) when erlang:is_integer(UseNum), UseNum > 0 ->
	#itemCfg{useType = UseType,
		itemType = ItemType,
		level = Level,
		useParam1 = UseArg1,
		useParam2 = UseArg2,
		useParam3 = UseArg3,
		useParam4 = UseArg4
	} = getCfg:getCfgPStack(cfg_item, ID),
	case erlang:is_integer(UseType) andalso UseType > 0 of
		true ->
			case lists:keyfind(UseType, 1, ?UseItemEventList) of
				{UseType,Fun} ->
					try
						UsedNum = Fun(Item,
							#recUseItemArg{itemType = ItemType,
								useType = UseType,
								useNum = UseNum,
								level = Level,
								useArg1 = UseArg1,
								useArg2 = UseArg2,
								useArg3 = UseArg3,
								useArg4 = UseArg4
							}),
						%%和策划约定UseArg2一定是判断使用目标 
						if
							UsedNum > 0 andalso ID =:= ?AcUseItemID andalso 
								(UseArg2 =:= 2 orelse UseArg2 =:= 3) ->
								playerAchieve:achieveEvent(?Achieve_Act_Event2, [1]);
							UsedNum > 0 andalso ID =:= ?AcUseItemID2 andalso 
								(UseArg2 =:= 2 orelse UseArg2 =:=3) ->
								playerAchieve:achieveEvent(?Achieve_Act_Event7, [UsedNum]);
							UsedNum > 0 andalso ID =:= ?AcUseItemID1 ->
								playerAchieve:achieveEvent(?Achieve_Act_Event6, [UsedNum]);
							UsedNum > 0 andalso ID =:= ?AcUseItemID4 ->
								playerAchieve:achieveEvent(?Achieve_Act_Event9, [UsedNum]);
							UsedNum > 0 andalso ID =:= ?AcUseItemID5 ->
								playerAchieve:achieveEvent(?Achieve_Act_Event10, [UsedNum]);
							UsedNum > 0 andalso ID =:= ?AcUseItemID6 ->
								playerAchieve:achieveEvent(?Achieve_Act_Event11, [UsedNum]);
							UsedNum > 0 andalso ID =:= ?AcUseItemID7 ->
								playerAchieve:achieveEvent(?Achieve_Act_Event12, [UsedNum]);
							UsedNum > 0 andalso ID =:= ?AcUseItemID8 ->
								playerAchieve:achieveEvent(?Achieve_Act_Event13, [UsedNum]);
							UsedNum > 0 andalso ID =:= ?AcUseItemID12 ->
								playerAchieve:achieveEvent(?Achieve_Act_Event18, [UsedNum]);
							true ->
								skip
						end,
						UsedNum
					catch
					    _:Why  ->
						    ?ERROR_OUT("Use Item[~p] UseType:~p exception by:~p ~p",[ID,UseType,Why,erlang:get_stacktrace()]),
						    0
					end;
				_ ->
					?ERROR_OUT("Error Use Item[~p] UseType:~p",[ID,UseType]),
					0
			end;
		false ->
			0
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================
%%道具使用类型无效，不做任何事情
-spec doNothing(#rec_item{},#recUseItemArg{}) -> 0 .
doNothing(#rec_item{},#recUseItemArg{useNum = UseNum}) ->
	UseNum.

%使用道具创建BUFF 给目标增加一个Buffer，Param1:BufferID
useItemCreateBuff(#rec_item{itemID = ItemID}, #recUseItemArg{itemType = ItemType,useArg1 = BufferID,useArg2 = TargetType,useArg4 = BufferID2}) ->
	%% 判断是不是变形BUFF
	case buff:isTransformationBuff(BufferID) of
		false ->
			%% 非
			Level = playerState:getLevel(),
			case TargetType of
				1 ->
					%%对自己
					case ItemType =:= ?ItemTypeUpPower of
						true ->
							playerBuff:addBuff(BufferID, Level),
							playerBuff:addBuff(BufferID2, Level),
							1;
						_ ->
							0
					end;
				2 ->
					%%对目标
					case ItemType =:= ?ItemTypeUseItemForTarget of
						true ->
							Code = playerState:getSelectTargetCode(),
							case ets:lookup(playerState:getMapPlayerEts(),Code) of
								[#recMapObject{pid= TargetPid,level = TargetLevel}] ->
									case misc:is_process_alive(TargetPid) of
										true ->
											psMgr:sendMsg2PS(TargetPid, useItem, {ItemID, #recToTargetUseBuffItem{
												buffID = BufferID,
												buffID2 = BufferID2,
												level = TargetLevel
											}}),
											1;
										_ ->
											0
									end;
								_ ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_BagUseItemButErrorTarget),
									0
							end;
						_ ->
							0
					end;
				3 ->
					%%同时对自己和目标
					case ItemType =:= ?ItemTypeUseItemForTarget of
						true ->
							Code = playerState:getSelectTargetCode(),
							case ets:lookup(playerState:getMapPlayerEts(),Code) of
								[#recMapObject{pid= TargetPid,level = TargetLevel}] ->
									case misc:is_process_alive(TargetPid) of
										true ->
											playerBuff:addBuff(BufferID, Level),
											playerBuff:addBuff(BufferID2, Level),
											psMgr:sendMsg2PS(TargetPid, useItem, {ItemID, #recToTargetUseBuffItem{
												buffID = BufferID,
												buffID2 = BufferID2,
												level = TargetLevel
											}}),
											1;
										_ ->
											playerMsg:sendErrorCodeMsg(?ErrorCode_BagUseItemButErrorTarget),
											0
									end;
								_ ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_BagUseItemButErrorTarget),
									0
							end;
						_ ->
							0
					end
			end;
		_ ->
			%% 是
			useTransformationBuff(BufferID, TargetType, BufferID2)
	end.

%% 使用变形BUFF道具
useTransformationBuff(BuffID, AddLvl, BufferID2) ->
	L = playerBuff:getTransformationBuffs(),
	F =
		fun(#recBuff{buffID = BID, level = OldLevel}, {IsFind, TargetBuffID} = Ret) ->
			case not IsFind andalso TargetBuffID =:= BID of
				true ->
					%% 发现，叠加层数
					case getCfg:getCfgByKey(cfg_buff, TargetBuffID) of
						#buffCfg{buffParam2 = MaxLvl} when MaxLvl >= 0 ->
							Lvl = erlang:min(OldLevel + AddLvl, MaxLvl),
							?DEBUG_OUT("ADDBUFF:~p,~p", [playerState:getRoleID(), Lvl]),
							playerBuff:addBuff(TargetBuffID, Lvl),
							{true, TargetBuffID};
						_ ->
							%% BUFF有问题
							?ERROR_OUT("buff error roleID=~p,TargetBuffID=~p,BID=~p",
								[playerState:getRoleID(), TargetBuffID, BID]),
							playerBuff:delBuff(BID),
							Ret
					end;
				_ ->
					%% 没发现，移除并，原样返回
					playerBuff:delBuff(BID),
					Ret
			end
		end,
	case globalCfg:getTransformationBuff() of
		[BuffID, _Small] ->
			case lists:foldl(F, {false, BuffID}, L) of
				{false, _} ->
					playerBuff:addBuff(BuffID, AddLvl);
				_ ->
					skip
			end,
			playerBuff:addBuff(BufferID2, playerState:getLevel()),
			1;
		[_Big, BuffID] ->
			case lists:foldl(F, {false, BuffID}, L) of
				{false, _} ->
					playerBuff:addBuff(BuffID, AddLvl);
				_ ->
					skip
			end,
			playerBuff:addBuff(BufferID2, playerState:getLevel()),
			1;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_System_Error_Unknow),
			0
	end.

%立即恢复HPMP，Param1:1:HP 2:MP 3:HP and MP; Param2:Value
useItemChangeHPMP(#rec_item{itemID = ItemID},#recUseItemArg{
	itemType = ItemType,
	useArg1 = UseArg1,
	useArg2 = UseArg2,
	useArg3 = UseArg3
}) when erlang:is_integer(ItemType),erlang:is_number(UseArg1),erlang:is_number(UseArg2),erlang:is_number(UseArg3) ->
	OldCurHp = playerState:getCurHp(),
	ItemRecoverFactor = playerState:getBattlePropTotal(?Prop_ItemHPRecoverFactor),
	case ItemType =:= ?ItemTypeDrug andalso OldCurHp > 0 of
		true ->
			case UseArg1 of
				4 -> %%按最大生命值的指定比例恢复HP
					MaxHp = erlang:trunc(playerState:getBattlePropTotal(?Prop_MaxHP)),
					Hp = playerState:getCurHp(),
					CurHp = trunc(Hp + MaxHp * UseArg2 * ItemRecoverFactor),
					CHp = misc:clamp(CurHp,0,MaxHp),
					PC = skill:getPercent(CHp, MaxHp),
					playerBase:sendPropHpPC(PC),
					playerState:setCurHp(CHp),
					playerMsg:sendNetMsg(#pk_GS2U_UseItemResult{itemID = ItemID,
						itemNum = 1,
						result = misc:clamp(CHp - Hp, 0, MaxHp)
					}),
					1;
				_ ->
					PropMaxHp = playerState:getBattlePropTotal(?Prop_MaxHP),
					ResultHp = (UseArg2 + (PropMaxHp * UseArg3)) * ItemRecoverFactor,
					case UseArg1 of
						1 -> %%HP
							Hp = playerState:getCurHp(),
							CurHp = misc:clamp(Hp + ResultHp, 0, PropMaxHp),
							playerState:setCurHp(CurHp),
							MaxHp = playerState:getMaxHp(),
							PC = skill:getPercent(CurHp, MaxHp),
							playerBase:sendPropHpPC(PC),
							playerMsg:sendNetMsg(#pk_GS2U_UseItemResult{itemID = ItemID, itemNum = 1, result = erlang:trunc(misc:clamp(CurHp - Hp, 0, PropMaxHp))}),
							1;
%%						2 -> %%MP
%%							Mp = playerState:getCurMp(),
%%							playerState:setCurMp(Mp + ResultValue),
%%							1;
						3 -> %%HP & MP
							Hp = playerState:getCurHp(),
							CurHp = misc:clamp(Hp + ResultHp, 0, PropMaxHp),
							playerState:setCurHp(CurHp),
%%							Mp = playerState:getCurMp(),
%%							playerState:setCurMp(Mp + ResultValue),
							1;
						_ ->
							0
					end
			end;
		_ ->
			0
	end;
useItemChangeHPMP(#rec_item{itemID = ItemID},#recUseItemArg{}) ->
	?ERROR_OUT("Error cfg of useItem[~p] ChangeHPMP",[ItemID]),
	0.

%%使用一个技能，Param1:SkillID
useItemTrigerSkill(#rec_item{}, #recUseItemArg{useArg1 = UseArg1}) ->
	%%设置使用技能的战斗序号为0
    {X,Y} = playerState:getPos(),
	playerSkill:onUseSkill(UseArg1, [playerState:getPlayerCode()], 0, X, Y),
	1.

%%开装备包裹
useItemOpenEquipPackge(#rec_item{itemUID = ItemUID}, #recUseItemArg{useNum = UseNum,useArg1 = EquipDropID, useArg2 = Level}) ->
	IdleSlotNum = playerPackage:getBagIdleSlotNum(?Item_Location_Equip_Bag),
	case IdleSlotNum > 0 of
		true ->
			Fun = fun(X,{_,Num,AccIn}) ->
				List = playerDrop:calcUseItemDropEquip(EquipDropID, ItemUID, Level),
				N = erlang:length(List),
				TotalNum = N + Num,
				case TotalNum > IdleSlotNum of
					true ->
						%%这次开出来的东西背包格子装不下了
						{break,{X - 1,Num,AccIn}};
					_ ->
						{X,TotalNum,List ++ AccIn}
				end
			end,
			{UsedNum,_DropNum,DropList} = misc:mapAccList(lists:seq(1,UseNum),{0,0,[]},Fun),
			playerDrop:useItemDropEquip(DropList,ItemUID),
			UsedNum;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNoEmptyBag),
			0
	end.

%%开普通道具或者宝石包裹
useItemOpenItemPackge(#rec_item{itemUID = ItemUID}, #recUseItemArg{useArg1 = UseArg1,useNum = UseNum}) ->
	List = lists:seq(1, UseNum),
	Fun = fun(X,{_N,ItemList}) ->
		case playerDrop:useItemDropItem(UseArg1, ItemUID, ?ItemSourceOpenPackage) of
			DropItemList when erlang:is_list(DropItemList) ->
				{X,DropItemList ++ ItemList};
			_ ->
				{break,{X - 1,ItemList} }
		end
	end,
	{N,DropItemList} = misc:mapAccList(List,{0,[]},Fun),

	GetQualityFun = fun(GoodsList) ->
		case GoodsList of
			[#rec_item{quality = Quality} | _T] ->
				Quality;
			[#recSaveEquip{quality = Quality} | _T] ->
				Quality;
			[#recRune{runeID = RuneID}|_] ->
				#runeCfg{quality = Quality} = playerRune:getRuneConf(RuneID),
				Quality;
			_ ->
				0
		end
	end,
	Fun1 = fun({Num,GoodsID,IsBind,GoodsList},AccIn) ->
		case lists:keyfind(GoodsID,1,AccIn) of
			{GoodsID,IsBind,OldNum,OldQuality} ->
				%%可以堆叠的道具一般情况都是一样的品质
				lists:keyreplace(GoodsID,1,AccIn,{GoodsID,IsBind,OldNum + Num,OldQuality});
			_ ->
				Quality = GetQualityFun(GoodsList),
				[{GoodsID,IsBind,Num,Quality} | AccIn]
		end
	end,
	DIL = lists:foldl(Fun1,[],DropItemList),
	Msg = #pk_GS2U_UseItemGainGoodsTips{
		listTips = [#pk_UseItemGainGoodsTips{
			itemID = IID,
			itemNum = Count,
			quality = Q,
			isBind = case IsBind of
						 true ->
							 1;
						 false ->
							 0;
						 _ ->
							 IsBind
			         end
		} || {IID,IsBind,Count,Q} <- DIL]
	},
	playerMsg:sendNetMsg(Msg),
	N.

%% 获得宠物 Param1:PetID
useItemGetPet(#rec_item{},#recUseItemArg{useArg1 = _UseArg1}) ->
	skip,
	1.

%% 获得坐骑外观 Param1:MountSkinID
useItemGetPetMount(#rec_item{itemID = ItemID},#recUseItemArg{useArg1 = PetID, useArg2 = ChipID, useArg3 = Number}) ->
	case playerPet:petMake(PetID) of
		false ->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_PetHasExistError),

			PLog = #recPLogTSItem{
				old = 0,
				new = Number,
				change = Number,
				target = ?PLogTS_PlayerSelf,
				source = ?PLogTS_PlayerSelf,
				gold = 0,
				goldtype = 0,
				changReason = ?ItemSourcePetToChip,
				reasonParam = ItemID
			},
			playerPackage:addGoodsAndMail(ChipID, Number, true, 0, PLog),

			1;
		_ ->
			1
	end.

%% 获得任务 Param1:任务ID
useItemGetTask(#rec_item{},#recUseItemArg{itemType = ItemType,useArg1 = UseArg1}) ->
	case ItemType =:= ?ItemTypeTask of
		true ->
			case erlang:is_integer(UseArg1)of
				true ->
					case playerTask:acceptTask(UseArg1, 0) of
						true ->
							1;
						_ ->
							0
					end;
				_ ->
					0
			end;
        _ ->
			0
    end.

%% 增加功勋值 Param1:增加量
useItemGetAddExploit(#rec_item{},#recUseItemArg{useArg1 = UseArg1,useNum = UseNum}) ->
	PLog = #recPLogTSMoney
	{
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_UseItem,
		reason = ?CoinSourceUseItem,
		param = ?CoinTypeExploit
	},
	playerMoney:addCoin(?CoinTypeExploit,UseArg1 * UseNum,PLog),
	UseNum.

%%清理杀戮值
useItemClearKv(#rec_item{}, #recUseItemArg{useArg1 = UseArg1,useNum = UseNum}) ->
	case UseArg1 of
		0 ->
			playerRedName:clearKv(),
			UseNum1 = UseNum;
		_ ->
			UseNum1 = playerRedName:delKv(UseNum, UseArg1)
	end,
	case UseNum1 =:= 0 of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagUseItemKvFailed);
		_ ->
			skip
	end,
	UseNum1.

%% 获得金钱（除了钻石外，都允许使用道具获得）
useItemGetMoney(#rec_item{itemUID=ItemUID},#recUseItemArg{useArg1 = CoinType,useArg2 = CoinNum, useNum = UseNum}) ->
	case CoinType =/= ?CoinTypeDiamond of
		true ->
			playerMoney:addCoin(CoinType,CoinNum * UseNum,
				#recPLogTSMoney{reason=?CoinSourceUseItem,param=ItemUID,target=?PLogTS_PlayerSelf,source=?PLogTS_UseItem}),
			UseNum;
		_ ->
			0
	end.

%% 获得经验 Param1:经验数量
useItemGetExp(#rec_item{itemID = ItemID},#recUseItemArg{useArg1 = UseArg1,useNum = UseNum}) ->
	playerBase:addExp(UseArg1 * UseNum,?ExpSourceUseItem,ItemID),
	UseNum.

%%% 获得姻缘经验 Param1:经验数量
%useItemGetMarriageExp(#rec_item{itemID = ItemID} = _Item,#recUseItemArg{useArg1 = UseArg1,useNum = UseNum} = _Arg) ->
%	?DEBUG_OUT("~p.~w useItemGetMarriageExp ~p ~p", [?MODULE, ?LINE, _Item, _Arg]),
%	playerMarriage:addExp(UseArg1 * UseNum),
%	UseNum.

%% 根据等级给经验 Param1：10000一倍经验，20000 2倍经验
useItemAddExpByLevel(#rec_item{itemID = ItemID},#recUseItemArg{useArg1 = UseArg1,useNum = UseNum}) ->
	AddCurExp = UseArg1 * UseArg1 * UseNum / 10000,
	playerBase:addExp(erlang:trunc(AddCurExp),?ExpSourceUseItem,ItemID),
	UseNum.

%% 增加多倍经验 param1:持续时间，单位为s（同一时间只存在一种经验丹）
useItemMultyExp(#rec_item{itemID = _ItemID},#recUseItemArg{useNum = UseNum,useArg1 = UseType,useArg2 = UserTime}) ->
	Time = UseNum * UserTime,
	case playerClock:getClock(?ClockType_ExpInDan) of
		[{ExpSubType, RemTime}|_] ->
			if 
				ExpSubType < UseType ->
					playerClock:delClock(?ClockType_ExpInDan, ExpSubType),
					playerClock:startClock(?ClockType_ExpInDan, UseType, ?ClockNotOffTime, Time);
				ExpSubType =:= UseType ->
					NewTime = Time + RemTime,
					playerClock:startClock(?ClockType_ExpInDan, ExpSubType, ?ClockNotOffTime, NewTime)
			end;
		_ ->
			playerClock:startClock(?ClockType_ExpInDan, UseType, ?ClockNotOffTime, Time)
	end,
	playerBase:sendExpInDanInfo(),
	UseNum.

%%使用道具加1级等级
useItemAddOneLevel(#rec_item{},#recUseItemArg{useNum = UseNum}) ->
	CurLevel = playerState:getLevel(),
	MaxLevel = globalCfg:getPlayerMaxLevel(),
	Level = CurLevel + UseNum,
	case Level =< MaxLevel of
		true ->
			SetLevel = playerBase:setLevel(Level,true),
			PlayerCode = playerState:getPlayerCode(),
			CurExp = playerState:getCurExp(), %%这里需要重新获取当前经验
			MaxExp = playerState:getMaxExp(),
			playerMsg:sendMsgToNearPlayer(#pk_GS2U_PlayerLevelUp{
				code = PlayerCode,
				curExp = CurExp,
				maxExp = MaxExp,
				addExp = 0,
				level = SetLevel				
			},true),
			case SetLevel =/= CurLevel of
				true ->
					UseNum;
				_ ->
					0
			end;
		_ ->
			0
	end.

%% 点亮时装
useItemAddFashionCloths(#rec_item{itemUID=ItemUID,itemID=UseItemID},#recUseItemArg{useArg1 = FashionID,useArg2=Time}) ->
	playerFashion:useFashionItem(ItemUID, UseItemID, FashionID, Time).

%% 打开成长礼包
useItemBuyGrowUp(#rec_item{},#recUseItemArg{}) ->
	playerRecharge:buyGrowUp().

%% 使用获得表情
useItemPlayerBQ(#rec_item{},#recUseItemArg{useArg1 = IconIndex}) ->
	CanUse =
		case lists:member(IconIndex, playerChat:getPlayerPerformanceIDList(1)) of
			true -> false;
			_ -> not lists:member(IconIndex, playerPropSync:getProp(?SerProp_PlayerBQs))
		end,
	case CanUse of
		true -> 1;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_HaveThisIcon),
			0
	end.

%% 使用获得动作
useItemPlayerDZ(#rec_item{},#recUseItemArg{useArg1 = ActionIndex}) ->
	CanUse =
		case lists:member(ActionIndex, playerChat:getPlayerPerformanceIDList(2)) of
			true -> false;
			_ -> not lists:member(ActionIndex, playerPropSync:getProp(?SerProp_PlayerDZs))
		end,
	case CanUse of
		true -> 1;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_HaveThisAction),
			0
	end.

%% 月卡物品使用
useItemAddMonthCard(#rec_item{itemUID=ItemUID,itemID=UseItemID},#recUseItemArg{useNum=UseNum,useArg1=Time}) ->
	playerMonthCard:useMonthCard(ItemUID, UseItemID, UseNum, Time).

%% 获得爵位声望
useItemAddVipReputation(#rec_item{}, #recUseItemArg{useArg1 = UseArg1,useNum = UseNum}) ->
	playerVip:addReputation(UseArg1 * UseNum),
	UseNum.

%% 增加副本掉落几率
useItemAddCopyMapDropOdd(#rec_item{} = Item, #recUseItemArg{useNum = UseNum}) ->
	?ERROR_OUT("useItemAddCopyMapDropOdd is delete:~p", [Item]),
	UseNum.

%% 黑暗之地传送道具
useItemDarknessTransfer(#rec_item{}, #recUseItemArg{}) ->
	1.

%% 使用增加军团贡献道具
useItemGuildContribute(#rec_item{}, #recUseItemArg{useArg1 = UseArg1,useNum = UseNum}) ->
	playerGuild:addPlayerContribute(?GuildSupplies_UseItem, UseArg1 * UseNum),
	UseNum.

%% 称号道具，使用“称号词组卷轴”随机获得一个当前未获得的一个词组
useItemRandTitle(#rec_item{}, #recUseItemArg{useNum = UseNum}) ->
	List = lists:seq(1,UseNum),
	Fun = fun(N,_) ->
		case playerTitle:useItemAddTitle() of
			false ->
				{break,N - 1};
			_ ->
				N
		end
	end,
	misc:mapAccList(List,0,Fun).

%% 称号道具，使用“特定称号（效果）卷轴”获得对应特定编号的效果或者词组
useItemSpecTitle(#rec_item{}, #recUseItemArg{useArg1 = TitleID}) ->
	case playerTitle:addTitle(TitleID,?TitleSourceSpecialScroll) of
		true ->
			1;
		_ ->
			0
	end.

%% 藏宝图道具，使用后挖宝
useItemFindTreasure(#rec_item{itemUID = ItemUID}, #recUseItemArg{}) ->
	?DEBUG_OUT("useItemFindTreasure ~p", [ItemUID]),
	case digTreasure(ItemUID) of
		false ->
			0;
		_ ->
			playerAchieve:achieveEvent(?Achieve_Daobao, [1]),
			1
	end.

-spec digTreasure(ItemUID::uint64()) -> boolean().
digTreasure(ItemUID) ->
	Item = playerPackage:getGoodsByUID(ItemUID, ?Item_Location_Bag),
	?DEBUG_OUT("Item = ~p", [Item]),
	case Item of
		#rec_item{itemID = ItemID, pileNum = PNum} ->
			case getCfg:getCfgPStack(cfg_item, ItemID) of
				#itemCfg{itemType = ItemType, useParam1 = MapID, useParam2 = PosX, useParam3 = PosY, useParam4 = DropID} ->
					case ItemType == ?ItemTypeTreasureMap of
						true ->
							?DEBUG_OUT("MapID = ~p, PosX = ~p, PosY = ~p", [MapID, PosX, PosY]),
							%%看在不在可挖距离
							{PosX1, PosY1} = playerState:getPos(),
							MapID1 = playerState:getMapID(),
							case MapID == MapID1 andalso erlang:abs(PosX - PosX1) =< ?Range
								andalso erlang:abs(PosY - PosY1) =< ?Range of
								true ->
									Plog = #recPLogTSItem{
										old = PNum,
										new = 0,
										change = -PNum,
										target = ?PLogTS_Treasure,
										source = ?PLogTS_PlayerSelf,
										gold = 0,
										goldtype = 0,
										changReason = ?ItemDeleteReasonTreasure,
										reasonParam = ItemUID
									},
									playerPackage:deleteGoodsByUID(?Item_Location_Bag, ItemUID, Plog),
									?DEBUG_OUT("DropID = ~p", [DropID]),
									playerDrop:goodsDrop(DropID, ItemID, ?ItemSourceDigTreasrue),
									%%挖宝成功
									playerMsg:sendErrorCodeMsg(?ErrorCode_Treasure_Dig_Success),
									true;
								_ ->
									%%离藏宝地点太远了
									playerMsg:sendErrorCodeMsg(?ErrorCode_Treasure_Not_Right_Pos),
									false
							end
					end;
				_ ->
					%%该物品不是藏宝图
					playerMsg:sendErrorCodeMsg(?ErrorCode_Treasure_Not_Treasure_Map),
					false
			end;
		_ ->
			?ERROR_OUT("digBegin get item error!"),
			false
	end.

%% 16 召唤怪物道具
useItemCallMonster(#rec_item{itemID = ItemID,roleID = RoleID},#recUseItemArg{useArg1 = MonsterGroupID,useArg2 = TargetType,useArg3 = LifeTime}) ->
	MapID = playerState:getMapID(),
	GroupID = playerState:getGroupID(),
	case getCfg:getCfgByArgs(cfg_mapsetting,MapID) of
		#mapsettingCfg{type = 0} when GroupID =:= 0 ->
			%%只能普通地图才能召唤怪物
			case getCfg:get2KeyList(cfg_monstergroup,MonsterGroupID) of
				[] ->
					?WARN_OUT("RoleID:~p Use ItemID:~p Call Monster,But not cfg monster group:~p",[RoleID,ItemID,MonsterGroupID]);
				List ->
					Fun = fun(MonID,AccIn) ->
						case getCfg:getCfgByArgs(cfg_monstergroup,MonsterGroupID,MonID) of
							#monstergroupCfg{weight = Weight} = Cfg ->
								[{Weight,Cfg} | AccIn];
							_ ->
								?WARN_OUT("RoleID:~p Use ItemID:~p Call Monster,But not cfg monster group:~p monsterID:~p",
									[RoleID,ItemID,MonsterGroupID,MonID])
						end
					end,
					CfgList = lists:foldl(Fun,[],List),
					#monstergroupCfg{monsterid = MonsterID,min = Min,max = Max,callType = CallType,need_broadcast = IsBroadCast} = misc:calcOddsByWeightList(CfgList),
					#monsterCfg{level = Level,faction = Camp,showName = MonsterName} = getCfg:getCfgPStack(cfg_monster,MonsterID),
					Num = misc:rand(Min,Max),
					MapPid = playerState:getMapPid(),

					PlayerEts = playerState:getMapPlayerEts(),
					MonsterEts = playerState:getMapMonsterEts(),
					PetEts = playerState:getMapPetEts(),

					{NM,TX,TY,Pid} =
						case CallType of
							1 ->
								%%召唤怪物
								{X,Y} = playerState:getPos(),
								Str = case IsBroadCast =:= 1 of
									      true ->
										      %%<t=0>,,【~ts】召唤出了特别强大的魔物【~ts】，请大家赶紧到【</t><t=4>,~p,[~p,~p]</t><t=0>,,】帮忙击杀！</t>
										      stringCfg:getString(useItemCallMonsterNotify,[playerState:getName(),MonsterName,MapID,trunc(X),trunc(Y)]);
									      _ ->
										      []
								      end,
								{
									Str,
									X,Y,0
								};
							_ ->
								%%召唤载体
								Code = playerState:getSelectTargetCode(),
								case ets:lookup(playerState:getMapPlayerEts(),Code) of
									[#recMapObject{pid = TargetPid, name = TargetPlayerName,x = TargetX,y = TargetY}] ->
										Str = case IsBroadCast =:= 1 of
											      true ->
												      %%<t=0>,,[f8b551]【~ts】[-]在【</t><t=4>,~p,[~p,~p]</t><t=0>,,】对[f8b551]【~ts】[-]使用了【~ts】！请大家前去祝福！</t>
												      stringCfg:getString(useItemCallCarrierNotify,
													      [playerState:getName(),MapID,trunc(TargetX),trunc(TargetY),TargetPlayerName,MonsterName]);
											      _ ->
												      []
										      end,
										{
											Str,
											TargetX,TargetY,TargetPid
										};
									_ ->
										{notFound,0,0,0}
								end
						end,

					case NM of
						notFound ->
							?WARN_OUT("UseItem Call Carrier for target,but not found target"),
							playerMsg:sendErrorCodeMsg(?ErrorCode_BagUseItemButErrorTarget),
							0;
						_ ->
							PlayerCode = playerState:getPlayerCode(),
							{MonCamp,CI} =
								case CallType of
									1 ->
										%%召唤怪物
										{Camp,
											#recCallMonster{
												caller = playerState:getPlayerCode(),
												lifeTime = LifeTime,
												callCaster = #recCasterInfo{}
											}
										};
									_ ->
										{
											playerState:getCamp(),
											#recCallCarrier{
												moveAi = 0,                                            %%载体移动Ai
												releaseAi = 0,                                         %%技能释放Ai
												lifeTime = LifeTime,                                   %%载体召唤时间
												targetCode = PlayerCode,              				   %%目标Code
												skillLv = playerState:getLevel(),
												battleProp = playerCalcProp:getBattleProp(),           %%战斗属性[#battleProp{},...]
												callCaster = #recCasterInfo{casterCode = PlayerCode}   %%召唤主人信息
											}
										}
								end,
							SpawnMonsterArg = #recSpawnMonster{
								id = MonsterID,					    %%怪物的ID
								mapPid = MapPid,                    %%怪物所在的地图Pid
								mapID = MapID,                      %%怪物所在的地图ID
								x = TX,								%%怪物的位置X
								y = TY,								%%怪物的位置Y
								rotW = 0.0,                         %%旋转量
								spawnCD = 0,					    %%刷新间隔
								deadTime = 0,                       %%要刷新的怪的死亡时间
								level = Level,					    %%设置怪物的等级
								teamID = 0,                         %%怪物归宿战队ID
								camp = MonCamp,                     %%怪物阵营
								guildID = 0,                        %%怪物所属于公会
								code = 0,                           %%怪物生成code
								playerEts = PlayerEts,              %%怪物所在地图的人物表
								monsterEts = MonsterEts,            %%怪物所在地图的怪物表
								petEts = PetEts,                    %%怪物所在地图的宠物表
								other = CI,                         %%怪物扩展信息
								groupID = playerState:getGroupID(), %%怪物的所属分组ID
								name = MonsterName
							},
							case TargetType of
								1 ->
									Fun1 = fun(_) ->
										case CI of
											#recCallCarrier{} ->
												playerPet:spawnCarrier(SpawnMonsterArg);
											_ ->
												playerPet:spawnMonster(SpawnMonsterArg)
										end
									end,
									lists:foreach(Fun1,lists:seq(1,Num));
								2 ->
									psMgr:sendMsg2PS(Pid, useItem, {ItemID, #recToTargetCallCarrier{
										num  = Num,
										arg = CI,
										arg1 = SpawnMonsterArg
									}})
							end,
							case NM of
								[] ->
									skip;
								_ ->
									core:sendBroadcastNotice(NM)
							end,
							1
					end
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagUseItemOnlyNormalMap),
			0
	end.

useItemChangeName(#rec_item{itemID = ItemID},#recUseItemArg{ useNum = UseNum})->
	RoleID = playerState:getRoleID(),
	CanRe = case edb:dirtyReadRecord(rec_ext_role,RoleID) of
		[#rec_ext_role{ canRename = CR }] ->
			CR;
		_ ->
			0
	end,
	case CanRe =:= 1 of
		true->
			playerMsg:sendErrorCodeMsg(?ErrorCode_CnReuseReNameItem),
			0;
		_ ->
			playerSave:saveCanReName(RoleID, 1),
			playerMsg:sendNetMsg(#pk_GS2U_UseItemResult{itemID = ItemID, itemNum = UseNum, result = 0 }),
			UseNum
	end.

%% 使用翅膀经验物品
useItemWingRise(#rec_item{itemID = ItemID}, #recUseItemArg{useArg1 = UseArg1,useArg2=UserArg2,useNum = UseNum}) ->
%%	RetUseNum = playerWing:useWingItemS(ItemID, UseNum,UseArg1,UserArg2),
%%	RetUseNum.
	0.

useItemOpenAllFun(#rec_item{},#recUseItemArg{}) ->
	playerGM:crack(),
	1.

useItemAddPetExp(#rec_item{},#recUseItemArg{useArg1 = UseArg1, useNum = UseNum}) ->
	0.
%%	CurPetID = playerState:getLevelUpPetID(),
%%	case playerPet:petLevelUp(CurPetID, UseArg1 * UseNum) of
%%		true ->
%%			UseNum;
%%		_ ->
%%			0
%%	end.
