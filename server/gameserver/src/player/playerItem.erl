%%
%% @author zhongyunawei
%% @doc @todo 玩家道具相关.


-module(playerItem).
-author(zhongyuanwei).

-include("gsInc.hrl").
-include("playerPropSyncDefine.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	useBagItem/4
]).

%%使用背包里的物品, UseReason是使用原因码
-spec useBagItem(ItemUID, UseNum, UseReason, ParamValue) -> ok|failed when ItemUID::uint(),UseNum::uint(),UseReason::uint(), ParamValue::uint().
useBagItem(ItemUID, UseNum, UseReason, ParamValue) ->
	Item = playerPackage:getGoodsByUID(ItemUID,?Item_Location_Bag),
	case Item of
		#rec_item{itemID = ItemID, pileNum = PileNum} ->
			LimitItemIDList = [750,751,752,753,754,755,756],
			LimitMapIDList = [6000,6001],
			CurMapID = playerState:getMapID(),
			case lists:member(ItemID, LimitItemIDList) andalso not lists:member(CurMapID, LimitMapIDList) of
				true ->skip;
				_ ->
					Now = time:getUTCNowMSDiff2010(),
					case canUseItem(ItemID,Now, UseNum) of
						{true,CDGroupID,DailyCountGroupID, CanUseNum} ->
							if
								PileNum >= CanUseNum ->  %%判断数量
									useBagItem(Item,CanUseNum,CDGroupID,DailyCountGroupID,Now,UseReason,ParamValue);
								true ->
									failed
							end;
						{?ErrorCode_UseSkillErrorTargetDead, _, _,_} ->
							failed;
						{?ErrorCode_Darkness_Already_In_Floor, _, _,_} ->
							failed;
						{?ErrorCode_Darkness_Transform_Failed_BOSS, _, _,_} ->
							failed;
						{false, _, _,_} ->
							failed;
						{ErrorCode,_,_,_} ->
							playerMsg:sendErrorCodeMsg(ErrorCode)
					
					end
			end;
		_ErrorCode_Str ->
			failed
	end.

-spec useBagItem(#rec_item{},UseNum,CDGroupID,DailyCountGroupID,Now,UseReason,ParamValue) -> ok when
	UseNum::uint16(),CDGroupID::uint16(),DailyCountGroupID::uint16(),Now::uint(),UseReason::uint(),ParamValue::uint().
useBagItem(#rec_item{itemUID = ItemUID,itemID = ItemID} = Item, UseNum,CDGroupID,DailyCountGroupID,Now,UseReason,ParamValue) ->
	%%由于触发使用道具的时候会有一些检测，判断是否可以使用，所以不能先扣道具再使用
	UsedNum = playerItemEvent:triggerUseItemEvent(Item,UseNum),
	case UsedNum > 0 of
		true ->
			UseResult = playerPackage:useItemByUID(ItemUID,UsedNum,UseReason,ParamValue),
			setUseItemTips(UseResult, ItemID, UsedNum);
		_ ->
			%%如果使用了0个，则需要在各自的事件中去添加各自需要的错误码，并且发送给客户端
			%%这里不统一发送
			skip
	end,
	setUsedItem(ItemID,CDGroupID,DailyCountGroupID,Now,UsedNum),

	#itemCfg{useType = UserType, useParam1 = UseParam1} = getCfg:getCfgPStack(cfg_item, ItemID),
	usedItemCallBack(UserType, UseParam1, UsedNum),
	ok.

%%检查经验道具使用是否多余
-spec checkUseExc(UserType, UseNum, UseParam1) -> uint() when
	UserType::uint(),UseNum::uint(),UseParam1::uint().
checkUseExc(UserType, UseNum, UseParam1) when UserType =:= ?Item_Use_GetEXP orelse UserType =:=?Item_Use_AddExpByLevel->
			PlayerLev = playerState:getLevel(),
			MaxLevel = case getCfg:getCfgPStack(cfg_globalsetup, player_maxlevel) of
						#globalsetupCfg{setpara = [MaxLevel0]} ->
							MaxLevel0;
						_ ->
							999999
						end,
			case PlayerLev =:= MaxLevel of
				true ->
					Career = playerState:getCareer(),
					NowExp = playerState:getCurExp(),
					#player_baseCfg{ exp = MaxExp } = getCfg:getCfgPStack(cfg_player_base, MaxLevel, Career),
					case (NowExp + UseNum*UseParam1 > MaxExp) of
						true ->
							erlang:round((MaxExp - NowExp) div UseParam1);
						_ ->
							UseNum
					end;
				_ ->
					UseNum
			end;
checkUseExc(_, UseNum, _) ->
	UseNum.
%%检查道具是否可以使用
-spec canUseItem(ItemID,Now, UseNum) -> {true | uint(),CDGroupID,DailyCountGroupID} when
	ItemID::itemId(),Now::uint(),UseNum::uint(),CDGroupID::uint16(),DailyCountGroupID::uint16().
canUseItem(ItemID,Now,UseNum) ->
	#itemCfg{cdGroup = CDGroupID,
		dailyCountGroup = DailyCountGroupID,
		level = UseLevel,
		useType = UserType,
		useParam1 = UseParam1,
		useMaxCount = UseMaxCount,
		usePlayerClass = CareerLimit, operate = Operate} = getCfg:getCfgPStack(cfg_item, ItemID),
	case UseNum =< UseMaxCount of
		true ->
			CurLevel = playerState:getLevel(),
			Ret1 = checkLevel(CurLevel,UseLevel),
			Career = playerState:getCareer(),
			Ret2 = checkCareer(Ret1,Career,CareerLimit),
			Ret3 = checkItemUseCD(Ret2,CDGroupID,Now),
			Ret4 = checkPlayerState(Ret3),
			{Ret5, RealUseNumber} = checkItemDailyUseCount(Ret4, ItemID, UseNum, DailyCountGroupID),
			Ret6 = checkItemCanUserExpInDan(Ret5, UserType, UseParam1),
			Ret7 = checkMaxLevelExpSpill(Ret6, UserType),
			Ret8 = checkDarknessItemUse(Ret7, UserType, UseParam1),
			{Ret9, RealUseNumber2} = checkCanUseGuildContribute(Ret8, UserType, RealUseNumber, UseParam1),
			%Ret10 = checkMarriageExpItem(Ret9, UserType),
			Ret = checkItemIsAllowUse(Ret9, Operate),
			Num	= checkUseExc(UserType, RealUseNumber2, UseParam1),
			{Ret,CDGroupID,DailyCountGroupID, Num};
		_ ->
			{false,0,0,0}
	end.

%%检测经验丹是否可以使用
-spec checkItemCanUserExpInDan(true, Type :: uint(), ExpType :: uint()) -> true | uint().
checkItemCanUserExpInDan(true, Type, ExpType) ->
	case Type =:= ?Item_Use_MultiExp of
		true ->
			case playerClock:getClock(?ClockType_ExpInDan) of
				[{ExpSubType, _Time}|_] ->
					case ExpSubType > ExpType of
						true ->
							?ErrorCode_BagItemUseExpInDan;
						_ ->
							true
					end;
				_ ->
					true
			end;
		_ ->
			true
	end;
checkItemCanUserExpInDan(ErrorCode, _Type, _ExpType) ->
	ErrorCode.

%% 检测玩家最大等级使用经验道具是否溢出
-spec checkMaxLevelExpSpill(true, UserType :: uint()) -> true | uint().
checkMaxLevelExpSpill(true, UserType) ->
	case UserType =:= ?Item_Use_GetEXP orelse UserType =:=?Item_Use_AddExpByLevel of
		true ->
			Level = playerState:getLevel(),
			Career = playerState:getCareer(),
			NowExp = playerState:getCurExp(),
			MaxLevel = case getCfg:getCfgPStack(cfg_globalsetup, player_maxlevel) of
						#globalsetupCfg{setpara = [MaxLevel0]} ->
							MaxLevel0;
						_ ->
							999999
						end,
			case Level =:= MaxLevel of
				true ->	
					#player_baseCfg{ exp = MaxExp } = getCfg:getCfgPStack(cfg_player_base, Level, Career),
					case  NowExp =:= MaxExp  of
						true ->
							?ErrorCode_BagItemExpInMax;
						_ ->
							true
					end;
				_ ->
					true
			end;
		_ ->
			true
	end;
checkMaxLevelExpSpill(ErrorCode, _UserType) ->
	ErrorCode.

%%% 检查姻缘经验道具是否可以使用
%-spec checkMarriageExpItem(true, UserType :: uint()) -> true | uint().
%checkMarriageExpItem(true, UserType) ->
%	?DEBUG_OUT("~p.~w checkMarriageExpItem ~p", [?MODULE, ?LINE, UserType]),
%	case UserType =:= ?Item_Use_MarriageExp of
%		true ->
%			case playerMarriage:getPartnerRoleID() of
%				0 ->
%					?DEBUG_OUT("~p.~w checkMarriageExpItem", [?MODULE, ?LINE]),
%					?ErrorCode_Marriage_I_Unmarried;
%				_ ->
%					Lv = playerMarriage:getMarriageLevel(),
%					Exp = playerMarriage:getMarriageExp(),
%					LvList = getCfg:get1KeyList(cfg_wedding_ring),
%					LvListRev = lists:reverse(LvList),
%					[MaxLevel | _] = LvListRev,
%					#wedding_ringCfg{exp = MaxExp} =
%						getCfg:getCfgPStack(cfg_wedding_ring, MaxLevel),
%					case Exp >= MaxExp of
%						true ->
%							?DEBUG_OUT("~p.~w checkMarriageExpItem", [?MODULE, ?LINE]),
%							?ErrorCode_Marriage_I_LevelMax;
%						_ ->
%							?DEBUG_OUT("~p.~w checkMarriageExpItem", [?MODULE, ?LINE]),
%							true
%					end
%			end;
%		_ ->
%			?DEBUG_OUT("~p.~w checkMarriageExpItem", [?MODULE, ?LINE]),
%			true
%	end;
%checkMarriageExpItem(ErrorCode, _UserType) ->
%	ErrorCode.

checkCanUseGuildContribute(true, ?Item_Use_GuildContribute, UseNumber, UseParam1) ->
	case playerState:getGuildID() > 0 of
		true ->
			Add = playerGuild:canAddPlayerContribute(UseNumber * UseParam1),
			if
				Add =:= 0 ->
					{?ErrorCode_GuildContrionToMax, UseNumber};
				Add > 0 andalso Add < UseParam1 ->
					{true, 1};
				Add >= UseParam1 ->
					{true, Add div UseParam1};
				true ->
					{?ErrorCode_GuildContrionFailed, UseNumber}
			end;
		false ->
			{?ErrorCode_GuildContrionFailed, UseNumber}
	end;
checkCanUseGuildContribute(ErrorCode, _UserType, UseNumber, _UseParam1) ->
	{ErrorCode, UseNumber}.

checkDarknessItemUse(true, UserType, UseParam1) ->
	case UserType of
		?Item_Use_DarknessTransfer ->
			playerDarkness:canUseDarknessItem(UseParam1);
		_ ->
			true
	end;
checkDarknessItemUse(ErrorCode, _UserType, _UseParam1) ->
	ErrorCode.

%% 检查道具是否允许使用
-spec checkItemIsAllowUse(true | uint(), Operate::uint()) -> true | uint().
checkItemIsAllowUse(true, Operate) ->
	case misc:testBit(Operate, ?Item_Operate_NotUse) of
		true ->
			?ErrorCode_BagItemNotUse;
		_ ->
			true
	end;
checkItemIsAllowUse(ErrorCode, _Operate) ->
	ErrorCode.

-spec checkLevel(CurLevel,LevelLimit) -> true | uint() when
	CurLevel::uint16(),LevelLimit::uint16().
checkLevel(CurLevel,LevelLimit) when CurLevel < LevelLimit ->
	%%等级不足
	?ErrorCode_BagItemUseLevelLimit;
checkLevel(_CurLevel,_LevelLimit) ->
	true.

-spec checkCareer(CheckRet,Career,CareerLimit) -> CheckRet when
	CheckRet::true | uint(),Career::career(),CareerLimit::career().
checkCareer(true,Career,CareerLimit) when CareerLimit /= 0 andalso Career =/= CareerLimit->
	%%职业限制
	?ErrorCode_BagItemUseCareerLimit;
checkCareer(true,_Career,_CareerLimit) ->
	true;
checkCareer(ErrorCode,_Career,_CareerLimit) ->
	ErrorCode.

-spec checkItemUseCD(LastCheck,CDGroupID,Now) -> true | uint() when
	LastCheck::true | uint(),CDGroupID::uint16(),Now::uint().
checkItemUseCD(true,CDGroupID,Now) when erlang:is_integer(CDGroupID) andalso CDGroupID > 0 ->
	#itemCDandCountCfg{value = CDTime} = getCfg:getCfgPStack(cfg_itemCDandCount, CDGroupID),
	LastTime = playerState:getItemUseTime(CDGroupID),
	case Now - LastTime > CDTime * 1000 of
		true ->
			true;
		_ ->
			%%使用CD中
			?ErrorCode_BagItemUseInCD
	end;
checkItemUseCD(true,_CDGroupID,_Now) ->
	true;
checkItemUseCD(ErrorCode,_CDGroupID,_Now) ->
	ErrorCode.

checkPlayerState(true) ->
	case playerState:getActionStatus() of
		?CreatureActionStatusDead->
			?ErrorCode_UseSkillErrorTargetDead;
		_->
			true
	end;
checkPlayerState(ErrorCode) ->
	ErrorCode.

%%检查道具组每日使用次数
-spec checkItemDailyUseCount(LastCheck,ItemID, UseNum, DailyCountGroupID) -> {boolean(), uint()} | {uint(), uint()} when
	LastCheck::true | uint(),ItemID::uint(), UseNum::uint(), DailyCountGroupID::uint16().
checkItemDailyUseCount(true, ItemID, UseNum, DailyCountGroupID) when
	erlang:is_integer(DailyCountGroupID) andalso DailyCountGroupID > 0 andalso erlang:is_integer(UseNum) andalso UseNum > 0 ->
	case getCfg:getCfgPStack(cfg_itemCDandCount, DailyCountGroupID) of
		#itemCDandCountCfg{value = Counter} ->
			DailyCounter = playerDaily:getDailyCounter(?DailyType_UseItem,ItemID),
			SYTimes = (Counter - DailyCounter),
			if
				SYTimes =< 0 ->
					%% 今日已经不允许使用了
					playerMsg:sendErrorCodeMsg(?ErrorCode_BagItemUseDailyCountLimit, [Counter, erlang:max(SYTimes, 0)]),
					{false, UseNum};
				UseNum > SYTimes ->
					{true, SYTimes};
				true ->
					{true, UseNum}
			end;
		_ ->
			%%策划没配置相应的数据，打出错误日志，并让玩家可以使用
			?ERROR_OUT("Error,not Cfg of DailyCountGroupID[~p] in cfg_itemCDandCount",[DailyCountGroupID]),
			{true, UseNum}
	end;
checkItemDailyUseCount(true,_ItemID,UseNum,_DailyCountGroupID) ->
	{true, UseNum};
checkItemDailyUseCount(ErrorCode,_ItemID,UseNum,_DailyCountGroupID) ->
	{ErrorCode, UseNum}.

%%设置使用道具信息
-spec setUsedItem(ItemID,CDGroupID,DailyCountGroupID,Now,UsedNum) -> ok when
	ItemID::uint16(),CDGroupID::uint16(),DailyCountGroupID::uint16(),Now::uint(),UsedNum::integer().
setUsedItem(ItemID,CDGroupID,DailyCountGroupID,Now,UsedNum) ->
	playerState:setItemUseTime(CDGroupID,Now),

	%% 计数
	setUsedItemCount(ItemID, DailyCountGroupID, UsedNum),

	playerMsg:sendNetMsg(#pk_GS2U_SingleUseItem{ itemID = ItemID }),
	ok.

-spec setUsedItemCount(ItemID::uint(), DailyCountGroupID::uint(), UsedNum::uint()) -> ok.
setUsedItemCount(ItemID, DailyCountGroupID, UsedNum) when
	erlang:is_integer(DailyCountGroupID) andalso DailyCountGroupID > 0 andalso erlang:is_integer(UsedNum) andalso UsedNum > 0 ->
	%% 每日使用个数计数
	case UsedNum > 0 of
		true ->
			playerDaily:addDailyCounter(?DailyType_UseItem, ItemID, UsedNum),

			%% 给个系统提示
			#itemCDandCountCfg{value = Counter} = getCfg:getCfgPStack(cfg_itemCDandCount, DailyCountGroupID),
			DailyCounter = playerDaily:getDailyCounter(?DailyType_UseItem, ItemID),
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagItemUseDailyCountSuccess, [Counter, Counter - DailyCounter]),
			ok;
		_ ->
			skip
	end,
	ok;
setUsedItemCount(_,_,_) ->
	ok.

%%发送使用道具成功后的tip信息
-spec setUseItemTips(UseResult, ItemID, ItemNum) -> ok when
	UseResult::boolean(),ItemID::uint(),ItemNum::uint().
setUseItemTips(true, ItemID, ItemNum) ->
	case getCfg:getCfgPStack(cfg_item, ItemID) of
		#itemCfg{txt = Txt} when Txt =/= undefined ->
			playerMsg:sendNetMsg(
			  #pk_GS2U_UseItemResult{
									 itemID = ItemID, 
									 itemNum = ItemNum,
									 result = 0
									});
		_ ->
			ok
	end;
setUseItemTips(_, _, _) ->
	ok.

%% 使用道具回调
usedItemCallBack(?Item_Use_PlayerBQ, IconIndex, UsedNum) when UsedNum > 0 ->
	L = playerPropSync:getProp(?SerProp_PlayerBQs),
	playerPropSync:setAny(?SerProp_PlayerBQs, [IconIndex | L]),
	playerMsg:sendNetMsg(#pk_GS2U_HaveIconAndActionList{icons = [IconIndex], actions = []}),
	ok;
usedItemCallBack(?Item_Use_PlayerDZ, ActionIndex, UsedNum) when UsedNum > 0 ->
	L = playerPropSync:getProp(?SerProp_PlayerDZs),
	playerPropSync:setAny(?SerProp_PlayerDZs, [ActionIndex | L]),
	playerMsg:sendNetMsg(#pk_GS2U_HaveIconAndActionList{icons = [], actions = [ActionIndex]}),
	ok;
usedItemCallBack(?Item_Use_DarknessTransfer, 0, _UsedNum) ->
	%% 传送到准备间
	playerCopyMap:enterCopyMap(?DarknessPrepareMapID),
	ok;
usedItemCallBack(_UserType, _UseParam1, _UsedNum) ->
	ok.
