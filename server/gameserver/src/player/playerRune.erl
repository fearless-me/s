%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%% 符文
%%% @end
%%% Created : 19. 四月 2016 11:17
%%%-------------------------------------------------------------------
-module(
playerRune).
-author("tiancheng").

-include("player.hrl").
-include("playerPrivate.hrl").
-include("playerPropSyncDefine.hrl").
-include("gamedataLog.hrl").

-define(RuneType_Role, 0).  %角色符文
-define(RuneType_Pet, 1).   %骑宠符文

-define(RuneSubType_DB, 0). %%: 0 大地
-define(RuneSubType_HY, 1). %%: 1 海洋
-define(RuneSubType_LY, 2). %%: 2 烈焰
-define(RuneSubType_TK, 3). %%: 3 天空
-define(RuneSubType_SM, 4). %%: 4 生命
-define(RuneSubType_VIP, 5). %%: 5 VIP
%% 符文子列表
-define(RuneSubType_List,
	[
		?RuneSubType_DB,
		?RuneSubType_HY,
		?RuneSubType_LY,
		?RuneSubType_TK,
		?RuneSubType_SM,
		?RuneSubType_VIP
	]).

-define(RunePropType_Base, 1). %符文基础属性
-define(RunePropType_Rand, 2). %符文随机属性

%%符文计算方式
-define(RuneCalcType_Add, 0).%加法
-define(RuneCalcType_Mult, 1).%乘法

-define(RuneGridNumber, 60).   %符文格子数
-define(RunePlayerGrid, 1).
-define(RunePlayerPetGrid, 2).

%% 符文位置
-define(RunePos_Package, 0).   %背包中，通过符文类型区分宠物背包还是玩家背包
-define(RunePos_Player, 1).    %玩家装备在孔上的符文

%% 保存符文
-export([saveRune/2]).

%% API
-export([
	loadRuneData/1,
	sendRuneDataToClient/0,
	sendRPRuneDataToClient/3,
	getPetRunePropList/1,
	tickRune/0,
	dropRune/3,
	getNetRuneInfo/1
]).

%% Msg
-export([
	openRuneGrid/2,
	deleteRunes/1,
	requestSuitProp/1,
	runeEmbedOn/2,
	runeEmbedOff/1,
	runeMelt/2,
	runeCast/3,
	runeCompound/1,
	queryRuneTips/1,
	runeCastAffirm/2,
	meltForGM/2
]).

-export([
	getRuneConf/1,
	saveRuneLog/2,
	getRuneGridNumber/1,
	getSelfRuneObject/1,
	changeRuneOwner/4,
	getPetRuneForce/0,
	getPlayerRuneForce/0,
	gmdeleteRune/0
]).

gmdeleteRune() ->
	PlayerRunes = playerPropSync:getProp(?SerProp_PlayerRune),
	PetRunes = playerPropSync:getProp(?SerProp_PlayerPetRune),

	playerRune:deleteRunes(PlayerRunes),
	playerRune:deleteRunes(PetRunes),
	ok.

%% 开启格子
openRuneGrid(_TargetID, _Num) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_SystemGettingFailed4NeedBuy),
	ok.
%% 请求套装属性
requestSuitProp(TargetID) ->
	sendTargetSuiteProps(TargetID),
	ok.

%% 符文镶嵌
runeEmbedOn(TargetID, UIDs) ->
	UIDs2 = misc:takeRepeatMember(UIDs, []),
%%	?DEBUG_OUT("runeEmbedOn:~p,~ts,~p,~p,~p", [playerState:getRoleID(),playerState:getName(),TargetID, UIDs, UIDs2]),
	CanOnRune =
		case TargetID of
			?RunePos_Player ->
				getRuneOnList(TargetID, UIDs2);
			0 ->
				?ErrorCode_RuneEmbedOnFailed;
			_ ->
				%% 判断是否有该宠物
				Pets = playerState:getPets(),
				case lists:keyfind(TargetID, #recPetInfo.pet_id, Pets) of
					#recPetInfo{} ->
						getRuneOnList(TargetID, UIDs2);
					_ ->
						?ErrorCode_PetNotExistError
				end
		end,
	case CanOnRune of
		[#recRune{} | _] = List ->
			case TargetID of
				?RunePos_Player ->
					playerRuneOn(List);
				_ ->
					playerPetRuneOn(List, TargetID)
			end,
			ok;
		[] ->
%%			?DEBUG_OUT("runeEmbedOn no xqqqq:~p", [playerState:getRoleID()]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_RuneEmbedOnFailed);
		ErrorCode ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.

%% 符文拆卸
runeEmbedOff(UIDs) ->
	case misc:takeRepeatMember(UIDs, []) of
		[] -> skip;
		[UID | _] = UIDs2 ->
%%			?DEBUG_OUT("runeEmbedOff:~p,~ts,~p,~p", [playerState:getRoleID(), playerState:getName(),UIDs, UIDs2]),
			PlayerRunes = playerPropSync:getProp(?SerProp_PlayerRune),
			CXInfo =
				case lists:keyfind(UID, #recRune.runeUID, PlayerRunes) of
					#recRune{} ->
						PlayerXQs = lists:filter(fun(#recRune{subOwnerID = Pos}) ->
							Pos =:= ?RunePos_Player end, PlayerRunes),
						{?RunePlayerGrid, PlayerXQs};
					_ ->
						PetRunes = playerPropSync:getProp(?SerProp_PlayerPetRune),
						case lists:keyfind(UID, #recRune.runeUID, PetRunes) of
							#recRune{subOwnerID = Pos} when Pos =/= ?RunePos_Package ->
								PetXQs = lists:filter(fun(#recRune{subOwnerID = Pos2}) -> Pos =:= Pos2 end, PetRunes),
								{?RunePlayerPetGrid, PetXQs};
							_ ->
								playerMsg:sendErrorCodeMsg(?ErrorCode_RuneNotExist)
						end
				end,
			case CXInfo of
				{GridType, RuneList} ->
					{Cur, Max} = getRuneGridNumber(GridType),
					Diff = Max - Cur,
					case Diff >= erlang:length(UIDs2) of
						true ->
							%% 确定UID是否在镶嵌列表中
							F =
								fun(UU, Acc) ->
									case lists:keyfind(UU, #recRune.runeUID, RuneList) of
										#recRune{} = Rune ->
											[Rune | Acc];
										_ ->
											Acc
									end
								end,
							case lists:foldl(F, [], UIDs2) of
								[] ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_RuneEmbeOffFailed);
								OffList ->
									case GridType of
										?RunePlayerGrid -> playerRuneOff(OffList, false);
										_ -> playerPetRuneOff(OffList, false)
									end
							end;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_NotEnoughRuneGrid)
					end;
				_ ->
					skip
			end
	end,
	ok.

%% 符文熔炼
runeMelt(TargetUID, MaterialUIDs) ->
	?DEBUG_OUT("[DebugForRune] runeMelt ~p", [{TargetUID, MaterialUIDs}]),
	case misc:takeRepeatMember(MaterialUIDs, []) of
		[] ->
			?DEBUG_OUT("[DebugForRune] runeMelt skip1", []),
			skip;
		MaterialUIDs2 ->
			case lists:member(TargetUID, MaterialUIDs2) of
				false ->
					F =
						fun(UID, {DList, Acc}) ->
							case lists:keyfind(UID, #recRune.runeUID, DList) of
								#recRune{subOwnerID = ?RunePos_Package} = Rune ->
									{DList, [Rune | Acc]};
								_ ->
									{DList, Acc}
							end
						end,
					PlayerRunes = playerPropSync:getProp(?SerProp_PlayerRune),
					{TargetRune, MaterialRunes, TargetPos} =
						case lists:keyfind(TargetUID, #recRune.runeUID, PlayerRunes) of
							#recRune{subOwnerID = ?RunePos_Package} = Rune1 ->
								{_, Mater1} = lists:foldl(F, {PlayerRunes, []}, MaterialUIDs2),
								{Rune1, Mater1, ?RunePos_Package};
							%% 20160921
							%% 支持对装备中的符文进行熔炼（吞噬）
							#recRune{subOwnerID = ?RunePos_Player} = Rune1_ ->
								{_, Mater1_} = lists:foldl(F, {PlayerRunes, []}, MaterialUIDs2),
								{Rune1_, Mater1_, ?RunePos_Player};
							_ ->
								PetRunes = playerPropSync:getProp(?SerProp_PlayerPetRune),
								case lists:keyfind(TargetUID, #recRune.runeUID, PetRunes) of
									#recRune{subOwnerID = ?RunePos_Package} = Rune2 ->
										{_, Mater2} = lists:foldl(F, {PetRunes, []}, MaterialUIDs2),
										{Rune2, Mater2, ?RunePos_Package};
									%% 20160921
									%% 支持对装备中的符文进行熔炼（吞噬）
									#recRune{subOwnerID = OwnerID} = Rune2_ when OwnerID > ?RunePos_Player ->
										{_, Mater2_} = lists:foldl(F, {PetRunes, []}, MaterialUIDs2),
										{Rune2_, Mater2_, OwnerID};
									_ ->
										{false, false, ?RunePos_Package}
								end
						end,
					melt(TargetRune, MaterialRunes, TargetPos);
				_ ->
					?DEBUG_OUT("[DebugForRune] runeMelt skip2", []),
					skip
			end
	end,
	ok.

%% 符文洗练
runeCast(TargetUID, IndexNumber, MaterialUID) when TargetUID /= MaterialUID ->
	PlayerRunes = playerPropSync:getProp(?SerProp_PlayerRune),
	{TargetRune, MaterialRune, TargetPos} =
		case lists:keyfind(TargetUID, #recRune.runeUID, PlayerRunes) of
			#recRune{subOwnerID = ?RunePos_Package, randProps = RandProps1} = Rune1 ->
				case lists:keyfind(IndexNumber, #recRuneProp.index, RandProps1) of
					#recRuneProp{} ->
						case lists:keyfind(MaterialUID, #recRune.runeUID, PlayerRunes) of
							#recRune{subOwnerID = ?RunePos_Package, randProps = RandProps2} = Rune2 ->
								case erlang:length(RandProps2) > 0 of
									true -> {Rune1, Rune2, ?RunePos_Package};
									_ -> {false, false, ?RunePos_Package}
								end;
							_ -> {false, false, ?RunePos_Package}
						end;
					_ -> {false, false, ?RunePos_Package}
				end;
			%% 20160921
			%% 支持对装备中的符文进行洗炼
			#recRune{subOwnerID = ?RunePos_Player, randProps = RandProps1_} = Rune1_ ->
				case lists:keyfind(IndexNumber, #recRuneProp.index, RandProps1_) of
					#recRuneProp{} ->
						case lists:keyfind(MaterialUID, #recRune.runeUID, PlayerRunes) of
							#recRune{subOwnerID = ?RunePos_Package, randProps = RandProps2_} = Rune2_ ->
								case erlang:length(RandProps2_) > 0 of
									true -> {Rune1_, Rune2_, ?RunePos_Player};
									_ -> {false, false, ?RunePos_Package}
								end;
							_ -> {false, false, ?RunePos_Package}
						end;
					_ -> {false, false, ?RunePos_Package}
				end;
			_ ->
				PetRunes = playerPropSync:getProp(?SerProp_PlayerPetRune),
				case lists:keyfind(TargetUID, #recRune.runeUID, PetRunes) of
					#recRune{subOwnerID = ?RunePos_Package, randProps = RandProps1} = Rune1 ->
						case lists:keyfind(IndexNumber, #recRuneProp.index, RandProps1) of
							#recRuneProp{} ->
								case lists:keyfind(MaterialUID, #recRune.runeUID, PetRunes) of
									#recRune{subOwnerID = ?RunePos_Package, randProps = RandProps2} = Rune2 ->
										case erlang:length(RandProps2) > 0 of
											true -> {Rune1, Rune2, ?RunePos_Package};
											_ -> {false, false, ?RunePos_Package}
										end;
									_ -> {false, false, ?RunePos_Package}
								end;
							_ -> {false, false, ?RunePos_Package}
						end;
					#recRune{subOwnerID = OwnerID, randProps = RandProps1_} = Rune1_ when OwnerID > ?RunePos_Player ->
						case lists:keyfind(IndexNumber, #recRuneProp.index, RandProps1_) of
							#recRuneProp{} ->
								case lists:keyfind(MaterialUID, #recRune.runeUID, PetRunes) of
									#recRune{subOwnerID = ?RunePos_Package, randProps = RandProps2_} = Rune2_ ->
										case erlang:length(RandProps2_) > 0 of
											true -> {Rune1_, Rune2_, OwnerID};
											_ -> {false, false, ?RunePos_Package}
										end;
									_ -> {false, false, ?RunePos_Package}
								end;
							_ -> {false, false, ?RunePos_Package}
						end;
					_ -> {false, false, ?RunePos_Package}
				end
		end,
%%	?DEBUG_OUT("runeCast,~p,~p,~p --> ~p,~p", [TargetUID, IndexNumber, MaterialUID, TargetRune, MaterialRune]),
	cast(TargetRune, IndexNumber, MaterialRune, TargetPos),
	ok.

%% 符文合成
runeCompound(CompoundID) ->
	case getCfg:getCfgPStack(cfg_rune_compound, CompoundID) of
		#rune_compoundCfg{material = Materials, cost = Cost, dropid = DropID} ->
			case playerState:getCoin(?CoinTypeGold) >= Cost of
				true ->
					%% 是否有足够的材料道具
					case checkRuneCompoundMaterial(Materials) of
						true ->
							%% 扣钱
							PLog = #recPLogTSMoney{
								reason = ?CoinUseRune,
								param = CompoundID,
								target = ?PLogTS_RuneCompound,
								source = ?PLogTS_PlayerSelf
							},
							playerMoney:decCoin(?CoinTypeGold, Cost, PLog),

							%% 扣除道具
							F =
								fun({ItemID, NeedNumber}) ->
									PlogItem = #recPLogTSItem{
										old = NeedNumber,
										new = 0,
										change = -NeedNumber,
										target = ?PLogTS_RuneCompound,
										source = ?PLogTS_PlayerSelf,
										gold = Cost,
										goldtype = ?CoinTypeGold,
										changReason = ?ItemDeleteReasonRuneCompound,
										reasonParam = CompoundID
									},
									playerPackage:delGoodsByID(?Item_Location_Bag, ItemID, NeedNumber, PlogItem)
								end,
							lists:foreach(F, Materials),

							%% 掉落
							playerDrop:goodsDrop(DropID, CompoundID, ?ItemSourceRuneCompound),
							ok;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_NotEnoughRuneMaterial)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_TradeGold)
			end;
		_ ->
			skip
	end,
	ok.

checkRuneCompoundMaterial([]) -> true;
checkRuneCompoundMaterial({ItemID, NeedNumber}) ->
	HaveItemNumber = playerPackage:getItemNumByID(ItemID),
	HaveItemNumber >= NeedNumber;
checkRuneCompoundMaterial([Needs | List]) ->
	case checkRuneCompoundMaterial(Needs) of
		true ->
			checkRuneCompoundMaterial(List);
		_ ->
			false
	end.

%% 改变符文拥有者
-spec changeRuneOwner(RuneUID :: uint64(), RuneID :: uint(), NowOwnerID :: uint64(), TargetOwnerID :: uint64()) -> boolean().
changeRuneOwner(RuneUID, RuneID, NowOwnerID, TargetOwnerID) when NowOwnerID =/= TargetOwnerID ->
	RoleID = playerState:getRoleID(),
	case edb:dirtyReadRecord(recRune, RuneUID) of
		[#recRune{roleID = NowOwnerID, subOwnerID = Pos} = Rune] when Pos /= ?RunePos_Package ->
			?ERROR_OUT("changeRuneOwner failed not off:~p,~p", [Rune, misc:getStackTrace()]),
			false;
		[#recRune{roleID = NowOwnerID} = Rune] ->
			if
				RoleID =:= NowOwnerID ->
					%% 我的符文转移给别人
					NewRune = Rune#recRune{roleID = TargetOwnerID},
					edb:dirtyWriteRecord(NewRune),

					%% 从内存中删除
					saveRuneCache(NewRune, ?RuneSaveType_Delete),

					%% 记录日志
					saveRuneLog(NewRune, ?RuneSaveType_UpdateBase),

					gsSendMsg:sendMsg2DBServer(savePlayerRuneData, playerState:getAccountID(), {NewRune, ?RuneSaveType_UpdateBase}),

					%% 通知客户端删除该符文
					playerMsg:sendNetMsg(#pk_DeleteRunes{runeUIDS = [RuneUID]}),
					true;
				RoleID =:= TargetOwnerID ->
					%% 别人的符文转移给我
					NewRune = Rune#recRune{roleID = TargetOwnerID},
					saveRune(NewRune, ?RuneSaveType_UpdateBase),

					%% 通知客户端获得符文
					NetRunes = getNetRuneInfo(NewRune),
					playerMsg:sendNetMsg(#pk_GS2U_RuneInfoList{runeList = [NetRunes]}),
					true;
				(NowOwnerID =:= ?Trade_Role_ID orelse NowOwnerID =:= ?Mail_Role_ID) andalso
					(TargetOwnerID =:= ?Trade_Role_ID orelse TargetOwnerID =:= ?Mail_Role_ID) ->
					%% 与我无关的，只有系统拥有者之间才允许转移
					NewRune = Rune#recRune{roleID = TargetOwnerID},
					saveRune(NewRune, ?RuneSaveType_UpdateBase),
					true;
				true ->
					%% 其它对象的符文
					?ERROR_OUT("changeRuneOwner error roleID=~p, RuneUID=~p, RuneID=~p, NowOwnerID=~p, TargetOwnerID=~p,~p",
						[RoleID, RuneUID, RuneID, NowOwnerID, TargetOwnerID, misc:getStackTrace()]),
					false
			end;
		_ ->
			?ERROR_OUT("changeRuneOwner not find roleID=~p, RuneUID=~p, RuneID=~p, NowOwnerID=~p, TargetOwnerID=~p",
				[RoleID, RuneUID, RuneID, NowOwnerID, TargetOwnerID]),
			false
	end;
changeRuneOwner(RuneUID, RuneID, NowOwnerID, TargetOwnerID) ->
	?ERROR_OUT("changeRuneOwner param error RuneUID=~p, RuneID=~p, NowOwnerID=~p, TargetOwnerID=~p, ~p",
		[RuneUID, RuneID, NowOwnerID, TargetOwnerID, misc:getStackTrace()]),
	false.

queryRuneTips(UID) ->
	case edb:dirtyReadRecord(recRune, UID) of
		[#recRune{} = Rune] ->
			Nets = getNetRuneInfo(Rune),
			playerMsg:sendNetMsg(#pk_GS2U_QueryRuneTipsAck{info = Nets}),
			ok;
		_ ->
			skip
	end,
	ok.

%% 掉落符文，要判断是否发邮件
-spec dropRune(RuneID :: uint(), Num :: uint(), IsBind :: boolean()) -> [#recRune{}, ...] | [].
dropRune(RuneID, Num, IsBind) when erlang:is_integer(Num) andalso Num > 0 ->
	case getRuneConf(RuneID) of
		#runeCfg{type = Type} ->
			GridType = case Type of
				           ?RuneType_Role -> ?RunePlayerGrid;
				           ?RuneType_Pet -> ?RunePlayerPetGrid
			           end,
			{Cur, Max} = getRuneGridNumber(GridType),
			Diff = Max - Cur,
			DAdd = erlang:min(Diff, Num),

			%% 直接增加
			RoleID = playerState:getRoleID(),
			RoleName = playerState:getName(),
			DAddRunes = [makeRune(RuneID, RoleID, IsBind, RoleName) || _ <- lists:seq(1, DAdd)],
			%% 告诉客户端
			NetRunes = [getNetRuneInfo(Rune) || Rune <- DAddRunes],
			playerMsg:sendNetMsg(#pk_GS2U_RuneInfoList{runeList = NetRunes}),

			%% 发送邮件
			MAdd = Num - DAdd,
			case [makeRune(RuneID, ?Mail_Role_ID, IsBind, RoleName) || _ <- lists:seq(1, MAdd)] of
				[] -> DAddRunes;
				MAddRunes ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_RuneBagFull),
					MailItemList = [#recMailItem{itemUID = UID, itemID = RuneID} || #recRune{runeUID = UID} <- MAddRunes],
					playerMail:sendLoseGoodsMail(MailItemList, ""),
					MAddRunes ++ DAddRunes
			end;
		_ ->
			[]
	end.

loadRuneData(List) ->
	F =
		fun(#recRune{runeID = RuneID}) ->
			getRuneType(RuneID) =:= ?RuneType_Pet
		end,
	PetList = lists:filter(F, List),
	RoleList = List -- PetList,

	playerPropSync:setAny(?SerProp_PlayerRune, RoleList),
	playerPropSync:setAny(?SerProp_PlayerPetRune, PetList),

	EquipRune = lists:filter(fun(#recRune{subOwnerID = Pos}) -> Pos =:= ?RunePos_Player end, RoleList),
	%% 计算符文修正属性
	case getRuneProps(EquipRune) of
		[] ->
			skip;
		{AddProps, MultiProps} ->
			{{SuiteAddProps, SuiteMultiProps}, _Info} = getRuneSuitProps(EquipRune),


			playerCalcProp:changeProp_AddMulti(
				lists:append(SuiteAddProps, AddProps),
				lists:append(SuiteMultiProps, MultiProps), ?EquipOn, true),
			%% 计算战斗力
			playerForce:calcPlayerForce(?PlayerRuneForce, true),
			ok
	end,
	ok.

%% 发送符文背包信息给客户端
sendRuneDataToClient() ->
	%格子
	playerMsg:sendNetMsg(#pk_GS2U_RuneGrid{ownerID = ?RunePlayerGrid, cur = ?RuneGridNumber, max = ?RuneGridNumber}),
	playerMsg:sendNetMsg(#pk_GS2U_RuneGrid{ownerID = ?RunePlayerPetGrid, cur = ?RuneGridNumber, max = ?RuneGridNumber}),

	%符文
	List = playerPropSync:getProp(?SerProp_PlayerRune),
	ListPet = playerPropSync:getProp(?SerProp_PlayerPetRune),
	F = fun(#recRune{} = Rune, Acc) -> [getNetRuneInfo(Rune) | Acc] end,
	R1 = lists:foldl(F, [], List),
	R2 = lists:foldl(F, R1, ListPet),
	playerMsg:sendNetMsg(#pk_GS2U_RuneInfoList{runeList = R2}),

	% 发送玩家的套装属性
	sendTargetSuiteProps(?RunePos_Player),
	ok.

sendRPRuneDataToClient(TargetNetPID, TargetRoleID, PetID) ->
	%符文
	List = playerPropSync:getProp(?SerProp_PlayerRune),
	ListPet = playerPropSync:getProp(?SerProp_PlayerPetRune),

	F =
		fun(#recRune{subOwnerID = OwnerID} = Rune, {ID, Acc}) ->
			case OwnerID /= 0 andalso OwnerID =:= ID of
				true ->
					NetRune = getNetRuneInfo(Rune),
					{ID, [NetRune | Acc]};
				_ ->
					{ID, Acc}
			end
		end,

	{_, R1} = lists:foldl(F, {?RunePos_Player, []}, List),
	{_, R2} = lists:foldl(F, {PetID, R1}, ListPet),
	Msg = #pk_GS2U_RPRuneInfoList{
		targetRoleID = TargetRoleID,
		runeList = R2
	},
	gsSendMsg:sendNetMsg(TargetNetPID, Msg),

	% fixme 远程玩家，没有发送套装属性
	ok.

%% 获取目标宠物ID的符文修正列表
getPetRunePropList(PetIDs) ->
	getPetRunePropList(PetIDs, {[], []}).
getPetRunePropList([], Props) ->
	Props;
getPetRunePropList(0, Props) ->
	Props;
getPetRunePropList(PetID, {AddProps, MultProps} = Props) when erlang:is_integer(PetID) andalso PetID > 0 ->
	PlayerPetProps = playerPropSync:getProp(?SerProp_PlayerPetRune),
	PlayerPetProps2 = lists:filter(fun(#recRune{subOwnerID = SubID}) -> SubID =:= PetID end, PlayerPetProps),
	case getRuneProps(PlayerPetProps2) of
		{Adds, Mults} ->
			{{SuiteAdds, SuiteMults}, _Info} = getRuneSuitProps(PlayerPetProps2),
			{SuiteAdds ++ Adds ++ AddProps, SuiteMults ++ Mults ++ MultProps};
		[] -> Props
	end;
getPetRunePropList([PetID | OtherIDs], Props) ->
	RetProps = getPetRunePropList(PetID, Props),
	getPetRunePropList(OtherIDs, RetProps);
getPetRunePropList(PetID, Props) ->
	?ERROR_OUT("getPetRunePropList:~p,~p,~p,~p", [playerState:getRoleID(), PetID, Props, misc:getStackTrace()]),
	Props.

getPetRuneForce() ->
	%% 包含出战宠物与助战宠物
	Pets = playerState:getPets(),
	ZZPetIDs = [PID || #recPetInfo{pet_id = PID, pet_status = PetStatus} <- Pets, PetStatus >= ?PetState_Assist],

	F =
		fun(PetID, Force) ->
			PlayerPetProps = playerPropSync:getProp(?SerProp_PlayerPetRune),
			PlayerPetProps2 = lists:filter(fun(#recRune{subOwnerID = SubID}) -> SubID =:= PetID end, PlayerPetProps),
			getRuneForce(PlayerPetProps2, false) + Force
		end,
	lists:foldl(F, 0, ZZPetIDs).

getPlayerRuneForce() ->
	%% 需要单件计算，因为单件还有修正系数
	List = playerPropSync:getProp(?SerProp_PlayerRune),
	EquipRune = lists:filter(fun(#recRune{subOwnerID = Pos}) -> Pos =:= ?RunePos_Player end, List),
	getRuneForce(EquipRune, true).

getRuneForce([], _) -> 0;
getRuneForce([#recRune{} | _] = EquipRune, IsPlayer) ->
	%% 基础战斗力
	F =
		fun(#recRune{runeID = RuneID} = Rune, ForceAll) ->
			%% 单件符文战斗力
			case getRuneProps([Rune]) of
				[] ->
					ForceAll;
				{_AddProps, _MultiProps} = Props ->
					Force = getForce(Props, IsPlayer),

					%% 计算增幅
					#runeCfg{battlepower_add = AddPro} = getRuneConf(RuneID),
					ForceAll + erlang:round(AddPro * Force)
			end
		end,
	BaseForce = lists:foldl(F, 0, EquipRune),

	%% 套装战斗力
	{_, SuiteInfo} = getRuneSuitProps(EquipRune),
	FSuite =
		fun({SuiteID, Number, SuiteProps}, SuiteForceAll) ->
			Force1 = getForce(SuiteProps, IsPlayer),

			%% 计算套装属性战斗力增幅
			case getCfg:getCfgByKey(cfg_rune_suite, SuiteID, Number) of
				#rune_suiteCfg{addpower = AddPro1} ->
					SuiteForceAll + erlang:round(AddPro1 * Force1);
				_ ->
					Force1 + SuiteForceAll
			end
		end,
	SuiteForce = lists:foldl(FSuite, 0, SuiteInfo),
	BaseForce + SuiteForce.

getForce({[], []}, _) -> 0;
getForce({Adds, Mults}, IsPlayer) ->
	F =
		fun({Key, Value}, {IsAdd, Force}) ->
			case getCfg:getCfgByKey(cfg_rune_battlepower, Key) of
				#rune_battlepowerCfg{standard_addition = SA, standard_multi = SM, power = Power, pet_power = PetPower} ->
					P =
						case IsPlayer of
							true -> Power;
							false -> PetPower
						end,
					case IsAdd of
						true ->
							{IsAdd, erlang:round(P * (Value / SA)) + Force};
						_ ->
							{IsAdd, erlang:round(P * (Value / SM)) + Force}
					end;
				_ ->
					{IsAdd, Force}
			end
		end,
	{_, AddForce} = lists:foldl(F, {true, 0}, Adds),
	{_, MultForce} = lists:foldl(F, {false, AddForce}, Mults),
	MultForce.

%% 处理时效符文
-spec tickRune() -> ok.
tickRune() ->
	Now = getNowTime(),
	F =
		fun(#recRune{expiredTime = ExpiredTime} = Rune, DelAcc) ->
			case ExpiredTime of
				0 ->
					DelAcc;
				_ ->
					case Now - ExpiredTime > 0 of
						true ->
							DelAcc;
						_ ->
							[Rune | DelAcc]
					end
			end
		end,
	%% 玩家符文
	PlayerProps = playerPropSync:getProp(?SerProp_PlayerRune),
	PlayerDeletes = lists:foldl(F, [], PlayerProps),
	deleteRunes(PlayerDeletes),

	%% 宠物符文
	PlayerPetProps = playerPropSync:getProp(?SerProp_PlayerPetRune),
	PlayerPetDeletes = lists:foldl(F, [], PlayerPetProps),
	deleteRunes(PlayerPetDeletes),
	ok.

%% 删除符文
deleteRunes([]) -> ok;
deleteRunes(DeleteList) ->
	%% 分类需要删除的符文
	{RoleRunes, RoleBagRunes, PetRunes, PetBagRunes} = getDelRuneList(DeleteList, {[], [], [], []}),

	%% 先删除角色身上的
	playerRuneOff(RoleRunes, true),

	%% 再删除宠物身上的
	playerPetRuneOff(PetRunes, true),

	%% 去掉背包中的过期道具
	case getOffUpdateToClient(RoleBagRunes, true) of
		[] -> skip;
		UpdateToClient1 -> playerMsg:sendNetMsg(#pk_DeleteRunes{runeUIDS = UpdateToClient1})
	end,

	case getOffUpdateToClient(PetBagRunes, true) of
		[] -> skip;
		UpdateToClient2 -> playerMsg:sendNetMsg(#pk_DeleteRunes{runeUIDS = UpdateToClient2})
	end,
	ok.

%% 玩家镶嵌卸载符文
playerRuneOn([]) -> ok;
playerRuneOn([#recRune{} | _] = List) ->
	PlayerProps = playerPropSync:getProp(?SerProp_PlayerRune),
	EquipRune = lists:filter(fun(#recRune{subOwnerID = Pos}) -> Pos =:= ?RunePos_Player end, PlayerProps),

	%% 移除原来修正的属性
	{AddProps_Del, MultiProps_Del} =
		case getRuneProps(EquipRune) of
			{AddProps, MultiProps} ->
				{AddProps, MultiProps};
			_ ->
				{[], []}
		end,
	{AddProps_Suit_Del, MultiProps_Suit_Del} =
		case getRuneSuitProps(EquipRune) of
			{{SuiteAddProps, SuiteMultiProps}, _PlayerSuitInfo} ->
				{SuiteAddProps, SuiteMultiProps};
			_ ->
				{[], []}
		end,

	%% 修正新属性
	FOn =
		fun(#recRune{} = Rune, {Acc, AccToClient}) ->
			NewRune = Rune#recRune{subOwnerID = ?RunePos_Player},
			saveRune(NewRune, ?RuneSaveType_UpdateBase),
			NetRune = getNetRuneInfo(NewRune),
			{[NewRune | Acc], [NetRune | AccToClient]}
		end,
	{EquipRune2, UpdateToClient} = lists:foldl(FOn, {EquipRune, []}, List),

	{AddProps_Add, MultiProps_Add} =
		case getRuneProps(EquipRune2) of
			{AddProps2, MultiProps2} ->
				{AddProps2, MultiProps2};
			_ ->
				{[], []}
		end,
	{{AddProps_Suit_Add, MultiProps_Suit_Add}, SuiteRet} =
		case getRuneSuitProps(EquipRune2) of
			{{SuiteAddProps2, SuiteMultiProps2}, PlayerSuitInfo2} ->
				{{SuiteAddProps2, SuiteMultiProps2}, getSuitePropList(PlayerSuitInfo2, ?RunePos_Player)};
			_ ->
				{{[], []}, []}
		end,


	%% 通知客户端镶嵌结果
	playerMsg:sendNetMsg(#pk_GS2U_RuneEmbedOnAck{targetID = ?RunePos_Player, runeList = UpdateToClient}),

	%% 重新计算战斗力
	playerCalcProp:changeProp_AddMulti(
		AddProps_Del ++ AddProps_Suit_Del,
		MultiProps_Del ++ MultiProps_Suit_Del,
		AddProps_Add ++ AddProps_Suit_Add,
		MultiProps_Add ++ MultiProps_Suit_Add, true),
	playerForce:calcPlayerForce(?PlayerRuneForce, true),

	%% 发送玩家的套装属性
	sendTargetSuiteProps(SuiteRet),
	ok.

playerRuneOff([], _IsDelete) -> ok;
playerRuneOff([#recRune{} | _] = List, IsDelete) ->
	PlayerProps = playerPropSync:getProp(?SerProp_PlayerRune),
	EquipRune = lists:filter(fun(#recRune{subOwnerID = Pos}) -> Pos =:= ?RunePos_Player end, PlayerProps),

	%% 移除原来修正的属性
	{AddProps_Del, MultiProps_Del} =
		case getRuneProps(EquipRune) of
			{AddProps, MultiProps} ->
				{AddProps, MultiProps};
			_ ->
				{[],[]}
		end,
	{AddProps_Suit_Del, MultiProps_Suit_Del} =
		case getRuneSuitProps(EquipRune) of
			{{SuiteAddProps, SuiteMultiProps}, _PlayerSuitInfo} ->
				{SuiteAddProps, SuiteMultiProps};
			_ ->
				{[],[]}
		end,
	%% 修正新属性
	F =
		fun(#recRune{runeUID = UID}, Acc) ->
			lists:keydelete(UID, #recRune.runeUID, Acc)
		end,
	EquipRune2 = lists:foldl(F, EquipRune, List),


	{AddProps_Add, MultiProps_Add} =
		case getRuneProps(EquipRune2) of
			{AddProps2, MultiProps2} ->
				{AddProps2, MultiProps2};
			_ ->
				{[],[]}
		end,
	{{AddProps_Suit_Add, MultiProps_Suit_Add}, SuiteRet} =
		case getRuneSuitProps(EquipRune2) of
			{{SuiteAddProps2, SuiteMultiProps2}, PlayerSuitInfo2} ->
				{{SuiteAddProps2, SuiteMultiProps2}, getSuitePropList(PlayerSuitInfo2, ?RunePos_Player)};
			_ ->
				{{[],[]}, []}
		end,

	%% 去掉
	UpdateToClient = getOffUpdateToClient(List, IsDelete),

	%% 重新计算战斗力
	playerCalcProp:changeProp_AddMulti(
		AddProps_Del ++ AddProps_Suit_Del,
		MultiProps_Del ++ MultiProps_Suit_Del,
		AddProps_Add ++ AddProps_Suit_Add,
		MultiProps_Add ++ MultiProps_Suit_Add, true),
	playerForce:calcPlayerForce(?PlayerRuneForce, true),

	%% 刷新客户端
	case IsDelete of
		false ->
			%% 通知客户端符文卸载
			playerMsg:sendNetMsg(#pk_GS2U_RuneEmbedOffAck{runeList = UpdateToClient}),
			ok;
		_ ->
			playerMsg:sendNetMsg(#pk_DeleteRunes{runeUIDS = UpdateToClient})
	end,

	%% 发送玩家的套装属性
	sendTargetSuiteProps(SuiteRet),
	ok.

%% 宠物镶嵌卸载符文
playerPetRuneOn([], _TargetID) ->
	ok;
playerPetRuneOn([#recRune{subOwnerID = PetID} | _] = List, TargetID) ->
	FOn =
		fun(#recRune{} = Rune, AccToClient) ->
			NewRune = Rune#recRune{subOwnerID = TargetID},
			saveRune(NewRune, ?RuneSaveType_UpdateBase),
			NetRune = getNetRuneInfo(NewRune),
			[NetRune | AccToClient]
		end,
	playerPet:onPetAttrChange(PetID, ?EquipOff),
	UpdateToClient = lists:foldl(FOn, [], List),
	?DEBUG_OUT("TargetID=================TargetID:~w,pets:~w~n", [TargetID, playerState:getPets()]),
	playerPet:onPetAttrChange(PetID, ?EquipOn),
	%% 重新计算战斗力
	playerForce:calcOnePetForce(PetID, true),
	%% 镶嵌结果
	playerMsg:sendNetMsg(#pk_GS2U_RuneEmbedOnAck{targetID = TargetID, runeList = UpdateToClient}),

	%% 刷新套装属性
	sendTargetSuiteProps(TargetID),
	ok.

sendTargetSuiteProps([#pk_RuneSuitProp{} | _] = SuiteRet) ->
	playerMsg:sendNetMsg(#pk_GS2U_RuneSuitPropList{suitProps = SuiteRet});
sendTargetSuiteProps(0) -> ok;
sendTargetSuiteProps([]) -> ok;
sendTargetSuiteProps(?RunePos_Player) ->
	sendTargetSuiteProps(playerPropSync:getProp(?SerProp_PlayerRune), ?RunePos_Player);
sendTargetSuiteProps(TargetID) -> sendTargetSuiteProps(playerPropSync:getProp(?SerProp_PlayerPetRune), TargetID).
sendTargetSuiteProps([], _TargetID) -> ok;
sendTargetSuiteProps([#recRune{} | _] = List, TargetID) ->
	EquipRune = lists:filter(fun(#recRune{subOwnerID = Pos}) -> Pos =:= TargetID end, List),
	{{_SuiteAddProps, _SuiteMultProps}, PlayerInfo} = getRuneSuitProps(EquipRune),
	SuiteRet = getSuitePropList(PlayerInfo, TargetID),
	case SuiteRet of
		[] -> skip;
		_ ->
			playerMsg:sendNetMsg(#pk_GS2U_RuneSuitPropList{suitProps = SuiteRet})
	end,
	ok.

playerPetRuneOff([], _IsDelete) -> ok;
playerPetRuneOff([#recRune{subOwnerID = PetID} | _] = List, IsDelete) ->
	playerPet:onPetAttrChange(PetID, ?EquipOff),
	UpdateToClient = getOffUpdateToClient(List, IsDelete),
	playerPet:onPetAttrChange(PetID, ?EquipOn),
	%% 重新计算战斗力
	playerForce:calcOnePetForce(PetID, true),
	%% 刷新客户端
	case IsDelete of
		false ->
			playerMsg:sendNetMsg(#pk_GS2U_RuneEmbedOffAck{runeList = UpdateToClient});
		_ ->
			playerMsg:sendNetMsg(#pk_DeleteRunes{runeUIDS = UpdateToClient})
	end,
	ok.

getRandPropNumber(Min, Max) when Min == Max ->
	Min;
getRandPropNumber(Min, Max) ->
	{RMin, RMax} = getMinMax(Min, Max),
	case getCfg:getCfgPStack(cfg_globalsetup, rune_weightfornum) of
		#globalsetupCfg{setpara = WeighRands} ->
			case lists:filter(fun({Num, _Weight}) -> Num >= RMin andalso Num =< RMax end, WeighRands) of
				[] ->
					?ERROR_OUT("rune_weightfornum:~p,~p,~p", [RMin, RMax, WeighRands]),
					RMin;
				WeighRands2 ->
					misc:calcOddsByAfterWeightList(WeighRands2)
			end;
		_ ->
			RMin
	end.

%% 生成一个符文
-spec makeRune(RuneID :: uint(), RoleID :: uint64(), IsBind :: boolean(), RealRoleName :: string()) -> #recRune{}.
makeRune(RuneID, RoleID, IsBind, RealRoleName) ->
	#runeCfg{
		name = RuneName,
		quality = Quality,
		stage = Level,
		usefulLife = Life,
		based_property_group_id = BasePropGroupID,
		random_property_group_id = RandPropGroupID,
		level_up_group_id = LvlGroupID,
		inbind = IsBind2,
		min_num = Min,
		max_num = Max
	} = getRuneConf(RuneID),
	Now = getNowTime(),
	#rune_levelCfg{exp = Exp, smeltRatio = Ratio} = getCfg:getCfgPStack(cfg_rune_level, LvlGroupID, 1),
	BaseExp = erlang:max(erlang:round(Exp * Ratio), 1),
	ExpiredTime = case Life =:= 0 of
		              true -> 0;
		              _ -> Now + Life
	              end,
	RealBind = case erlang:is_boolean(IsBind) of
		           true -> misc:convertBool2Int(IsBind);
		           _ -> IsBind2
	           end,
	%%基础属性
	BaseProps = getRuneBasePro(BasePropGroupID),

	%% 随机属性
	RandPropNumber = getRandPropNumber(Min, Max),
	RandProps = getRuneRandPro(RandPropGroupID, RandPropNumber),

	UID = uidMgr:makeRuneUID(),
	F =
		fun({ID, Value, CalcType}, {PropType, Index, Acc}) ->
			R = #recRuneProp{
				runeUID = UID,
				index = Index,
				propType = PropType,
				propKey = ID,
				propValue = Value,
				calcType = CalcType
			},
			{PropType, Index + 1, [R | Acc]}
		end,
	{_, _, BasePropList} = lists:foldl(F, {?RunePropType_Base, 1, []}, BaseProps),
	{_, _, RandPropList} = lists:foldl(F, {?RunePropType_Rand, 1, []}, RandProps),
	Rune = #recRune{
		runeUID = UID,
		runeID = RuneID,
		roleID = RoleID,
		subOwnerID = ?RunePos_Package,
		level = Level,
		exp = BaseExp,
		isBind = RealBind,
		createTime = Now,
		deleteTime = 0,
		expiredTime = ExpiredTime,
		baseProps = BasePropList,
		randProps = RandPropList
	},
	saveRune(Rune, ?RuneSaveType_Insert),

	%% 公告获得
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_PlayerRune) of
		true ->
			case getCfg:getCfgByKey(cfg_globalsetup, rune_boardcast) of
				#globalsetupCfg{setpara = [TL]} when Quality >= TL ->
					Content = stringCfg:getString(rune_boardcast, [RealRoleName, RuneName]),
					core:sendBroadcastNotice(Content),
					ok;
				_ ->
					skip
			end;
		_ ->
			?LOG_OUT("GlobalBitVarReadOnly_PlayerRune close..."),
			skip
	end,
	Rune.

%% 保存符文
-spec saveRune(#recRune{}, uint8()) -> boolean().
saveRune(#recRune{runeUID = RuneUID} = Rec, ?RuneSaveType_Delete = SaveType) ->
	%% 从内存数据库中删除
	edb:dirtyDeleteRecord(recRune, RuneUID),

	%% 添加删除时间，并标记为更新
	NewRec = Rec#recRune{deleteTime = getNowTime()},
	gsSendMsg:sendMsg2DBServer(savePlayerRuneData, playerState:getAccountID(), {NewRec, ?RuneSaveType_UpdateBase}),

	{Ret, CanSaveLog} = saveRuneCache(NewRec, SaveType),

	%% 记录删除日志
	case CanSaveLog of
		true ->
			saveRuneLog(NewRec, SaveType);
		_ ->
			skip
	end,
	Ret;
saveRune(#recRune{} = Rec, SaveType) ->
	edb:dirtyWriteRecord(Rec),
	gsSendMsg:sendMsg2DBServer(savePlayerRuneData, playerState:getAccountID(), {Rec, SaveType}),
	{Ret, CanSaveLog} = saveRuneCache(Rec, SaveType),
	%% 记录更新日志
	case CanSaveLog of
		true ->
			saveRuneLog(Rec, SaveType);
		_ ->
			skip
	end,
	Ret.
%% 保存玩家符文缓存（注意，只有自己的才保存）
-spec saveRuneCache(#recRune{}, uint8()) -> boolean().
saveRuneCache(#recRune{runeUID = RuneUID, runeID = RuneID, roleID = RoleID, subOwnerID = Pos, exp = Exp} = Rec, SaveType) ->
	Package =
		case getRuneType(RuneID) of
			?RuneType_Role -> ?SerProp_PlayerRune;
			?RuneType_Pet -> ?SerProp_PlayerPetRune
		end,
	OldList = playerPropSync:getProp(Package),

	case playerState:getRoleID() of
		RoleID ->
			CanSaveLog =
				case lists:keyfind(RuneUID, #recRune.runeUID, OldList) of
					#recRune{} = Old ->
						%% 判断是不是子位置变化与经验变化，如果是这两者，都不记日志
						Old2 = Old#recRune{subOwnerID = Pos, exp = Exp},
						Rec /= Old2;
					_ -> true
				end,
			NewList =
				case SaveType of
					?RuneSaveType_Delete -> lists:keydelete(RuneUID, #recRune.runeUID, OldList);
					_ -> lists:keystore(RuneUID, #recRune.runeUID, OldList, Rec)
				end,
			playerPropSync:setAny(Package, NewList),
			{true, CanSaveLog};
		_ ->
			%% 不是我的符文，直接从我的缓存中删除
			case lists:keyfind(RuneUID, #recRune.runeUID, OldList) of
				#recRune{} ->
					NewList = lists:keydelete(RuneUID, #recRune.runeUID, OldList),
					playerPropSync:setAny(Package, NewList),
					ok;
				_ ->
					skip
			end,
			{false, true}
	end.
saveRuneLog(#recRune{} = Rec, ?RuneSaveType_UpdateBase = SaveType) ->
	RLog =
		#rec_log_rune{
			roleID = Rec#recRune.roleID,
			accountID = playerState:getAccountID(),
			runeUID = Rec#recRune.runeUID,
			runeID = Rec#recRune.runeID,
			operate = SaveType,
			level = Rec#recRune.level,
			exp = Rec#recRune.exp,
			isBind = Rec#recRune.isBind,
			createTime = Rec#recRune.createTime,
			deleteTime = Rec#recRune.deleteTime,
			expiredTime = Rec#recRune.expiredTime,
			time = 0,
			props = ""
		},
	dbLog:sendSaveLogRune(RLog),
	ok;
saveRuneLog(#recRune{baseProps = Bases, randProps = Rands} = Rec, SaveType) ->
	PPs = [{Type, Key, Value, Calc} || #recRuneProp{propType = Type, propKey = Key, propValue = Value, calcType = Calc} <- (Bases ++ Rands)],
	RLog =
		#rec_log_rune{
			roleID = Rec#recRune.roleID,
			accountID = playerState:getAccountID(),
			runeUID = Rec#recRune.runeUID,
			runeID = Rec#recRune.runeID,
			operate = SaveType,
			level = Rec#recRune.level,
			exp = Rec#recRune.exp,
			isBind = Rec#recRune.isBind,
			createTime = Rec#recRune.createTime,
			deleteTime = Rec#recRune.deleteTime,
			expiredTime = Rec#recRune.expiredTime,
			time = 0,
			props = misc:term_to_string(PPs)
		},
	dbLog:sendSaveLogRune(RLog),
	ok.

%% 获取符文类型
getRuneType(RuneID) ->
	#runeCfg{type = Type} = getRuneConf(RuneID),
	Type.
-spec getRuneConf(RuneID :: uint()) -> #runeCfg{}.
getRuneConf(RuneID) -> getCfg:getCfgPStack(cfg_rune, RuneID).

-spec getSelfRuneObject(RuneUID :: uint64()) -> #recRune{} | false.
getSelfRuneObject(RuneUID) ->
	PlayerRunes = playerPropSync:getProp(?SerProp_PlayerRune),
	case lists:keyfind(RuneUID, #recRune.runeUID, PlayerRunes) of
		#recRune{} = Rune -> Rune;
		_ ->
			PetRunes = playerPropSync:getProp(?SerProp_PlayerPetRune),
			lists:keyfind(RuneUID, #recRune.runeUID, PetRunes)
	end.

%% 获取一个符文的网络传输对象
getNetRuneInfo(#recRune{expiredTime = ExpiredTime, baseProps = BPS, randProps = RPS} = Info) ->
	ValidSec =
		case ExpiredTime of
			0 -> 0;
			_ ->
				Now = getNowTime(),
				erlang:max(1, ExpiredTime - Now)
		end,
	FB =
		fun(#recRuneProp{propKey = K, propValue = V, calcType = C}) ->
			#pk_RuneBaseProp{prop = K, calcType = C, value = V}
		end,
	BaseProps = lists:map(FB, BPS),
	FR =
		fun(#recRuneProp{propKey = K, propValue = V, calcType = C, index = Index}) ->
			R = #pk_RuneBaseProp{prop = K, calcType = C, value = V},
			#pk_RuneRandProp{prop = R, indexNumber = Index}
		end,
	RandProps = lists:map(FR, RPS),
	#pk_RuneInfo{
		runeUID = Info#recRune.runeUID,
		pos = Info#recRune.subOwnerID,
		runeID = Info#recRune.runeID,
		level = Info#recRune.level,
		exp = Info#recRune.exp,
		isBind = Info#recRune.isBind,
		validSecond = ValidSec,
		baseProps = BaseProps,
		randProps = RandProps
	}.

get6float(Value) ->
	case erlang:is_float(Value) of
		true ->
			erlang:binary_to_float(erlang:list_to_binary(io_lib:format("~f", [Value])));
		_ ->
			Value
	end.

getRuneBasePro(BasePropGroupID) ->
	BaseKey2List = getCfg:get2KeyList(cfg_rune_basePro, BasePropGroupID),
	F =
		fun(Key2) ->
			#rune_baseProCfg{
				property_id = ID,
				property_number = Value,
				mulityOrPlus = CalcType
			} = getCfg:getCfgPStack(cfg_rune_basePro, BasePropGroupID, Key2),
			NewValue = get6float(Value),
			{ID, NewValue, CalcType}
		end,
	lists:map(F, BaseKey2List).

getRuneRandPro(_RandPropGroupID, Number) when Number < 1 ->
	[];
getRuneRandPro(RandPropGroupID, Number) ->
	RandKey2List = getCfg:get2KeyList(cfg_rune_randomPro, RandPropGroupID),
	F =
		fun(Key2) ->
			Conf = #rune_randomProCfg{weight = Weight} = getCfg:getCfgPStack(cfg_rune_randomPro, RandPropGroupID, Key2),
			{Weight, Conf}
		end,
	case lists:map(F, RandKey2List) of
		[] ->
			[];
		List ->
%%			RandPropWeight =
%%				case getCfg:getCfgPStack(cfg_globalsetup, rune_weightforpro) of
%%					#globalsetupCfg{setpara = Para} ->
%%						[{Weight, {SP, EP}} || {Weight, SP, EP} <- Para];
%%					_ -> []
%%				end,
			FP =
				fun(_, Acc) ->
					#rune_randomProCfg{
						property_id = ID,
						property_number_min = MinValue,
						property_number_max = MaxValue,
						mulityOrPlus = CalcType
					} = misc:calcOddsByWeightList(List),
					{V1, V2} =
						case erlang:is_float(MinValue) orelse erlang:is_float(MaxValue) of
							true ->
								getMinMax(erlang:float(MinValue), erlang:float(MaxValue));
							_ ->
								getMinMax(MinValue, MaxValue)
						end,
					Value = misc:rand(V1, V2),
					%% 保留六位小数
					Value2 = get6float(Value),
					[{ID, Value2, CalcType} | Acc]
				end,
			lists:foldl(FP, [], lists:seq(1, Number))
	end.

%%getRandPropValue([], Min, _Max) ->
%%	get6float(Min);
%%getRandPropValue(RandPropWeight, Min, Max) ->
%%	Diff = Max - Min,
%%	{ProS, ProE} = misc:calcOddsByWeightList(RandPropWeight),
%%	Value =
%%		case ProS /= ProE of
%%			true ->
%%				{RProS, RProE} = getMinMax(ProS, ProE),
%%				DS = erlang:min(Diff * RProS, Diff),
%%				DE = erlang:min(Diff * RProE, Diff),
%%
%%				misc:rand(Min + DS, Min + DE);
%%			_ ->
%%				DS = erlang:min(Diff * ProS, Diff),
%%				Min + DS
%%		end,
%%	case erlang:float(Min) of
%%		true ->
%%			get6float(Value);
%%		_ ->
%%			erlang:trunc(Value)
%%	end.

getMinMax(V1, V2) ->
	case V1 =< V2 of
		true ->
			{V1, V2};
		_ ->
			{V2, V1}
	end.

%% 获取符文修正的属性列表
getRuneProps([]) -> [];
getRuneProps([#recRune{} | _] = List) ->
	FCalc =
		fun
			(#recRuneProp{calcType = ?RuneCalcType_Add, propKey = Key, propValue = Value}, {AddProps, MultProps}) ->
				{[{Key, Value} | AddProps], MultProps};
			(#recRuneProp{calcType = ?RuneCalcType_Mult, propKey = Key, propValue = Value}, {AddProps, MultProps}) ->
				{AddProps, [{Key, Value} | MultProps]}
		end,
	F =
		fun(#recRune{baseProps = Bases, randProps = Rands}, {AddProps, MultProps}) ->
			{Adds, Mults} = lists:foldl(FCalc, {[], []}, Bases ++ Rands),
			{Adds ++ AddProps, Mults ++ MultProps}
		end,
	lists:foldl(F, {[], []}, List).

%% 获取符文的套装属性
getRuneSuitProps([]) -> {{[], []}, []};
getRuneSuitProps([#recRune{} | _] = List) ->
	F =
		fun(#recRune{runeID = RuneID}) ->
			#runeCfg{property_suite_id = SuiteID} = getRuneConf(RuneID),
			SuiteID
		end,
	SuiteList = lists:map(F, List),
	SuiteNumberList = getSuiteNumber(SuiteList, []),
	FCalc =
		fun
			({Key, Value, ?RuneCalcType_Add}, {AddProps, MultProps}) ->
				{[{Key, Value} | AddProps], MultProps};
			({Key, Value, ?RuneCalcType_Mult}, {AddProps, MultProps}) ->
				{AddProps, [{Key, Value} | MultProps]}
		end,
	FS =
		fun({SuiteID, Number}, {{AddProps, MultProps}, SourceInfo} = Acc) ->
			case getCfg:getCfgByKey(cfg_rune_suite, SuiteID, Number) of
				#rune_suiteCfg{property = Props} ->
					PPS = {Adds, Mults} = lists:foldl(FCalc, {[], []}, Props),
					{{Adds ++ AddProps, Mults ++ MultProps}, [{SuiteID, Number, PPS} | SourceInfo]};
				_ ->
					Acc
			end
		end,
	lists:foldl(FS, {{[], []}, []}, SuiteNumberList).

getSuiteNumber([], RetList) -> RetList;
getSuiteNumber([SuiteID | _] = SuiteList, RetList) ->
	SL = lists:filter(fun(SID) -> SID =:= SuiteID end, SuiteList),
	getSuiteNumber(SuiteList -- SL, [{SuiteID, erlang:length(SL)} | RetList]).

%getPlayerPetAllSuite([], Ret) -> Ret;
%getPlayerPetAllSuite([#recRune{subOwnerID = PetID} | _] = Runes, Ret) ->
%	Runes2 = lists:filter(fun(#recRune{subOwnerID = PID}) -> PetID =:= PID end, Runes),
%	{{_SuiteAddProps, _SuiteMultProps}, PetInfo} = getRuneSuitProps(Runes2),
%	SuiteRet = getSuitePropList(PetInfo, PetID),
%	getPlayerPetAllSuite(Runes -- Runes2, SuiteRet ++ Ret).

getSuitePropList([], _OwnerID) -> [];
getSuitePropList([{_, _, _} | _] = Info, OwnerID) ->
	FAdd = fun({K, V}) -> #pk_RuneBaseProp{prop = K, calcType = ?RuneCalcType_Add, value = V} end,
	FMult = fun({K, V}) -> #pk_RuneBaseProp{prop = K, calcType = ?RuneCalcType_Mult, value = V} end,
	F =
		fun({SuiteID, Number, {AddProps, MultProps}}, Acc) ->
			R =
				#pk_RuneSuitProp{
					props = lists:map(FMult, MultProps) ++ lists:map(FAdd, AddProps),
					suitID = SuiteID,
					suitNum = Number,
					ownerID = OwnerID
				},
			[R | Acc]
		end,
	lists:foldl(F, [], Info).

getDelRuneList(false, RetRunes) -> RetRunes;
getDelRuneList(#recRune{runeID = RuneID, subOwnerID = Sub} = Rune, {RoleRunes, RoleBagRunes, PetRunes, PetBagRunes}) ->
	case getRuneType(RuneID) of
		?RuneType_Role ->
			case Sub of
				?RunePos_Player ->
					%% 玩家身上的
					{[Rune | RoleRunes], RoleBagRunes, PetRunes, PetBagRunes};
				_ ->
					%% 玩家背包的
					{RoleRunes, [Rune | RoleBagRunes], PetRunes, PetBagRunes}
			end;
		?RuneType_Pet ->
			case Sub of
				?RunePos_Package ->
					%% 宠物背包的
					{RoleRunes, RoleBagRunes, PetRunes, [Rune | PetBagRunes]};
				_ ->
					%% 宠物身上的
					{RoleRunes, RoleBagRunes, [Rune | PetRunes], PetBagRunes}
			end
	end;
getDelRuneList(RuneUID, RetRunes) when erlang:is_integer(RuneUID) andalso RuneUID > 0 ->
	PlayerProps = playerPropSync:getProp(?SerProp_PlayerRune),
	case lists:keyfind(RuneUID, #recRune.runeUID, PlayerProps) of
		#recRune{} = Rune ->
			getDelRuneList(Rune, RetRunes);
		false ->
			PlayerPetProps = playerPropSync:getProp(?SerProp_PlayerPetRune),
			Ret = lists:keyfind(RuneUID, #recRune.runeUID, PlayerPetProps),
			getDelRuneList(Ret, RetRunes)
	end;
getDelRuneList([], RetRunes) -> RetRunes;
getDelRuneList([#recRune{} = Rune | List], RetRunes) ->
	NewRetRunes = getDelRuneList(Rune, RetRunes),
	getDelRuneList(List, NewRetRunes);
getDelRuneList([RuneUID | List], RetRunes) when erlang:is_integer(RuneUID) andalso RuneUID > 0 ->
	NewRetRunes = getDelRuneList(RuneUID, RetRunes),
	getDelRuneList(List, NewRetRunes).

%getPropAddToDec(AddProps) ->
%	F =
%		fun({Key, Value}) ->
%			{Key, -Value}
%		end,
%	lists:map(F, AddProps).

getOffUpdateToClient([], _) -> [];
getOffUpdateToClient([#recRune{} | _] = List, IsDelete) ->
	FOff =
		fun(#recRune{runeUID = UID} = Rune, AccTolient) ->
			case IsDelete of
				false ->
					NewRune = Rune#recRune{subOwnerID = ?RunePos_Package},
					saveRune(NewRune, ?RuneSaveType_UpdateBase),
					NetRune = getNetRuneInfo(NewRune),
					[NetRune | AccTolient];
				_ ->
					saveRune(Rune, ?RuneSaveType_Delete),
					[UID | AccTolient]
			end
		end,
	lists:foldl(FOff, [], List).

-spec getRuneGridNumber(uint()) -> {Cur :: uint(), Max :: uint()}.
getRuneGridNumber(?RunePlayerGrid) ->
	RuneList = playerPropSync:getProp(?SerProp_PlayerRune),
	OnList = lists:filter(fun(#recRune{subOwnerID = Pos}) -> Pos =:= ?RunePos_Package end, RuneList),
	{erlang:length(OnList), ?RuneGridNumber};
getRuneGridNumber(?RunePlayerPetGrid) ->
	RuneList = playerPropSync:getProp(?SerProp_PlayerPetRune),
	OnList = lists:filter(fun(#recRune{subOwnerID = Pos}) -> Pos =:= ?RunePos_Package end, RuneList),
	{erlang:length(OnList), ?RuneGridNumber};
getRuneGridNumber(RuneID) ->
	case getRuneConf(RuneID) of
		#runeCfg{type = Type} ->
			GridType =
				case Type of
					?RuneType_Role -> ?RunePlayerGrid;
					?RuneType_Pet -> ?RunePlayerPetGrid
				end,
			getRuneGridNumber(GridType);
		_ ->
			{0, 0}
	end.

%% 得到镶嵌的孔位与可镶嵌的孔位
getRuneOnList(_TargetID, []) ->
	?ErrorCode_RuneEmbedOnFailed;
getRuneOnList(TargetID, UIDs) ->
	VipLevel = playerState:getVip(),
	{ConditionKey, RuneList, SubList} =
		case TargetID of
			?RunePos_Player ->
				VipL = case VipLevel of
					       0 -> lists:delete(?RuneSubType_VIP, ?RuneSubType_List);
					       _ -> ?RuneSubType_List
				       end,
				{rune_openlv_player, playerPropSync:getProp(?SerProp_PlayerRune), VipL};
			_ ->
				{rune_openlv_mount, playerPropSync:getProp(?SerProp_PlayerPetRune), lists:delete(?RuneSubType_VIP, ?RuneSubType_List)}
		end,
	%% 得到镶嵌的列表与孔位
	F =
		fun(#recRune{runeID = RuneID, subOwnerID = Pos} = Rune, {Acc1, Acc2}) ->
			case Pos =:= TargetID of
				true ->
					#runeCfg{subtype = SubType} = getRuneConf(RuneID),
					{[Rune | Acc1], lists:delete(SubType, Acc2)};
				_ ->
					{Acc1, Acc2}
			end
		end,
	case lists:foldl(F, {[], SubList}, RuneList) of
		{_, []} -> ?ErrorCode_RuneEmbedOnFailed;
		{_XQList, SYList} ->
%%			?DEBUG_OUT("getRuneOnList:~p,~p", [_XQList, SYList]),
			#globalsetupCfg{setpara = Conditions} = getCfg:getCfgPStack(cfg_globalsetup, ConditionKey),
			PlayerLevel = playerState:getLevel(),
			%% 得到真实的镶嵌UIDs
			FX =
				fun(UID, Acc) ->
					case lists:keyfind(UID, #recRune.runeUID, RuneList) of
						#recRune{subOwnerID = Pos, runeID = RuneID} = Rune when Pos =:= ?RunePos_Package ->
							#runeCfg{subtype = SType, equipLevel = EquipLevel} = getRuneConf(RuneID),
							case PlayerLevel >= EquipLevel of
								true ->
									IsNeeds =
										case lists:keyfind(SType, 1, Conditions) of
											{_, 0, Lvl} ->
												%% 要求玩家等级
												PlayerLevel >= Lvl;
											{_, 1, Lvl} ->
												%% 要求VIP等级
												VipLevel >= Lvl;
											{_, Lvl} ->
												PlayerLevel >= Lvl;
											_ ->
												false
										end,
									case IsNeeds andalso lists:member(SType, SYList) of
										true ->
											[Rune | Acc];
										_ ->
											Acc
									end;
								_ ->
									Acc
							end;
						_ ->
							Acc
					end
				end,
			lists:foldl(FX, [], UIDs)
	end.

getNowTime() ->
	Now = time:getUTCNowSec(),
	Now + time:getLocalTimeAdjustHour() * 3600.

setRuneCastProp(Data) ->
	?LOG_OUT("setRuneCastProp:~p,~p", [playerState:getRoleID(), Data]),
	put('RuneCastProp', Data),
	ok.

getRuneCastProp() ->
	get('RuneCastProp').

cast(
	#recRune{runeUID = TargetRuneUid, runeID = RuneID, randProps = Props1} = TargetRune,
	IndexNumber,
	#recRune{runeUID = MaterialUID, randProps = Props2} = MaterialRune,
	TargetPos
) ->
	OldProp = #recRuneProp{propKey = OldPk, calcType = OldCt, propValue = OldPv} = lists:keyfind(IndexNumber, #recRuneProp.index, Props1),

	#runeCfg{quality = Quality, smeltcost = CastID} = getRuneConf(RuneID),
	#rune_smeltcostCfg{ratio_quality = Ratios, cost = Cost} = getCfg:getCfgPStack(cfg_rune_smeltcost, CastID),
	Ratio = case erlang:length(Ratios) > Quality of
		        true ->
			        lists:nth(Quality + 1, Ratios);
		        _ ->
			        [R | _] = Ratios,
			        R
	        end,
	RealCost = erlang:round(Cost * Ratio),
	case playerState:getCoin(?CoinTypeGold) >= RealCost of
		true ->
			%% 扣钱
			PLog = #recPLogTSMoney{
				reason = ?CoinUseRune,
				param = RuneID,
				target = ?PLogTS_RuneCast,
				source = ?PLogTS_PlayerSelf
			},
			case playerMoney:decCoin(?CoinTypeGold, RealCost, PLog) of
				true ->
					%% 删除材料符文
					saveRune(MaterialRune, ?RuneSaveType_Delete),

					%% 20160921
					%% 支持对装备中的符文进行洗炼
					%% 洗炼前取下符文
					case TargetPos of
						?RunePos_Package ->
							skip;
						?RunePos_Player ->
							playerRuneOff([TargetRune], false);
						_ ->
							playerPetRuneOff([TargetRune], false)
					end,

					%% 取一个随机属性
					RandProp = #recRuneProp{propKey = NewPk, calcType = NewCt, propValue = NewPv}
						= lists:nth(misc:rand(1, erlang:length(Props2)), Props2),
					Props3 = lists:keydelete(IndexNumber, #recRuneProp.index, Props1),
					Props4 = [RandProp#recRuneProp{index = IndexNumber, runeUID = TargetRuneUid} | Props3],
					NewRune = TargetRune#recRune{randProps = Props4},
					saveRune(NewRune, ?RuneSaveType_UpdateProp),

					%% 20160921
					%% 支持对装备中的符文进行洗炼
					%% 洗炼后装备符文
					case TargetPos of
						?RunePos_Package ->
							skip;
						?RunePos_Player ->
							playerRuneOn([NewRune]);
						_ ->
							playerPetRuneOn([NewRune], TargetPos)
					end,
					NewRune_ = NewRune#recRune{subOwnerID = TargetPos},

					%% 本次洗练结果
					RuneInfo = getNetRuneInfo(NewRune_),
					playerMsg:sendNetMsg(#pk_GS2U_RuneCastAck{runeInfo = RuneInfo, runeUIDS = [MaterialUID]}),

					%% 备份属性
					setRuneCastProp({MaterialUID, IndexNumber, OldProp, TargetRune, NewRune_}),

					OldPropMsg = #pk_RuneBaseProp{prop = OldPk, calcType = OldCt, value = OldPv},
					NewPropMsg = #pk_RuneBaseProp{prop = NewPk, calcType = NewCt, value = NewPv},

					%% 通知客户端，洗练出来的属性结果
					Msg = #pk_GS2U_RuneCastProp{
						flagID = MaterialUID,
						oldprop = OldPropMsg,
						newprop = NewPropMsg
					},
					playerMsg:sendNetMsg(Msg),
					ok;
				_ ->
					skip
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_TradeGold)
	end,
	ok;
cast(_, _, _, _) ->
	ok.

runeCastAffirm(_FlagID, true) ->
	%% 同意选择本条属性，不处理了
	setRuneCastProp(undefined),
	ok;
runeCastAffirm(FlagID, false) ->
	%% 放弃本条属性
	case getRuneCastProp() of
		{FlagID, PropIndexNumber, #recRuneProp{} = OldProp,
			#recRune{} = TargetRune,
			#recRune{runeUID = RuneUID, runeID = RuneID, randProps = Props1, subOwnerID = OwnerID} = NewRune} ->
			%% 检验符文是否改变
			IsOK =
				case getRuneType(RuneID) of
					?RuneType_Role ->
						PlayerRunes = playerPropSync:getProp(?SerProp_PlayerRune),
						case lists:keyfind(RuneUID, #recRune.runeUID, PlayerRunes) of
							NewRune -> true;
							_ -> false
						end;
					?RuneType_Pet ->
						PlayerPetRunes = playerPropSync:getProp(?SerProp_PlayerPetRune),
						case lists:keyfind(RuneUID, #recRune.runeUID, PlayerPetRunes) of
							NewRune -> true;
							_ -> false
						end
				end,

			case IsOK of
				true ->
					#globalsetupCfg{setpara = [Diamond]} = getCfg:getCfgPStack(cfg_globalsetup, rune_regain),
					case Diamond > 0 andalso playerState:getCoin(?CoinTypeDiamond) >= Diamond of
						true ->
							%% 扣钱
							PLog = #recPLogTSMoney{
								reason = ?CoinUseRune,
								param = RuneID,
								target = ?PLogTS_RuneCast,
								source = ?PLogTS_PlayerSelf
							},
							playerMoney:decCoin(?CoinTypeDiamond, Diamond, PLog),

							%% 20160921
							%% 支持对装备中的符文进行洗炼
							%% 还原前取下符文
							case OwnerID of
								?RunePos_Package ->
									skip;
								?RunePos_Player ->
									playerRuneOff([NewRune], false);
								_ ->
									playerPetRuneOff([NewRune], false)
							end,

							%% 还原属性
							Props3 = lists:keydelete(PropIndexNumber, #recRuneProp.index, Props1),
							Props4 = [OldProp#recRuneProp{index = PropIndexNumber} | Props3],
							NewRune2 = TargetRune#recRune{randProps = Props4},
							saveRune(NewRune2, ?RuneSaveType_UpdateProp),

							%% 20160921
							%% 支持对装备中的符文进行洗炼
							%% 还原后装备符文
							case OwnerID of
								?RunePos_Package ->
									skip;
								?RunePos_Player ->
									playerRuneOn([NewRune2]);
								_ ->
									playerPetRuneOn([NewRune2], OwnerID)
							end,
							NewRune2_ = NewRune2#recRune{subOwnerID = OwnerID},

							%% 通知客户端更新符文
							RuneInfo = getNetRuneInfo(NewRune2_),
							playerMsg:sendNetMsg(#pk_GS2U_RuneInfoList{runeList = [RuneInfo]}),

							setRuneCastProp(undefined),
							ok;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_TradeDiamond)
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% 不消耗资源给指定符文增加经验（必须是自己的符文）
-spec meltForGM(TargetUID :: uint64(), Exp :: uint()) -> ok.
meltForGM(TargetUID, Exp) when erlang:is_integer(Exp), Exp > 0 ->
	PlayerRunes = playerPropSync:getProp(?SerProp_PlayerRune),
	{TargetRune, TargetPos} =
		case lists:keyfind(TargetUID, #recRune.runeUID, PlayerRunes) of
			#recRune{subOwnerID = ?RunePos_Package} = Rune1 ->
				{Rune1, ?RunePos_Package};
			#recRune{subOwnerID = ?RunePos_Player} = Rune1_ ->
				{Rune1_, ?RunePos_Player};
			_ ->
				PetRunes = playerPropSync:getProp(?SerProp_PlayerPetRune),
				case lists:keyfind(TargetUID, #recRune.runeUID, PetRunes) of
					#recRune{subOwnerID = ?RunePos_Package} = Rune2 ->
						{Rune2, ?RunePos_Package};
					#recRune{subOwnerID = OwnerID} = Rune2_ when OwnerID > ?RunePos_Player ->
						{Rune2_, OwnerID};
					_ ->
						{false, false}
				end
		end,
	case runeUpgrade2(TargetRune, Exp) of
		TargetRune ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_RuneMaxLevel);
		_ ->
			case TargetPos of
				?RunePos_Package ->
					skip;
				?RunePos_Player ->
					playerRuneOff([TargetRune], false);
				_ ->
					playerPetRuneOff([TargetRune], false)
			end,
			NewRune = runeUpgrade(TargetRune, Exp),
			case TargetPos of
				?RunePos_Package ->
					skip;
				?RunePos_Player ->
					playerRuneOn([NewRune]);
				_ ->
					playerPetRuneOn([NewRune], TargetPos)
			end,
			NewRune_ = NewRune#recRune{subOwnerID = TargetPos},
			RuneInfo = getNetRuneInfo(NewRune_),
			playerMsg:sendNetMsg(#pk_GS2U_RuneMeltAck{runeInfo = RuneInfo, runeUIDS = []})
	end,
	ok.

melt(false, _MaterialRunes, _TargetPos) ->
	?DEBUG_OUT("[DebugForRune] melt skip1", []),
	ok;
melt(_TargetRune, [], _TargetPos) ->
	?DEBUG_OUT("[DebugForRune] melt skip2", []),
	ok;
melt(#recRune{runeID = RuneID} = TargetRune, [#recRune{} | _] = MaterialRunes, TargetPos) ->
	{Exp, Cost} = getMeltCost(MaterialRunes, {0, 0}),
	%% 20160921
	%% 补充对符文最大等级时熔炼（吞噬）失败的提示
	case runeUpgrade2(TargetRune, Exp) of
		TargetRune ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_RuneMaxLevel);
		_ ->
			case playerState:getCoin(?CoinTypeGold) >= Cost of
				true ->
					%% 扣钱
					PLog = #recPLogTSMoney{
						reason = ?CoinUseRune,
						param = RuneID,
						target = ?PLogTS_RuneMelt,
						source = ?PLogTS_PlayerSelf
					},
					case playerMoney:decCoin(?CoinTypeGold, Cost, PLog) of
						true ->
							FD =
								fun(#recRune{runeUID = UID} = Rune, UIDAcc) ->
									%% 删除材料符文
									saveRune(Rune, ?RuneSaveType_Delete),
									[UID | UIDAcc]
								end,
							UIDs = lists:foldl(FD, [], MaterialRunes),
							%% 20160921
							%% 支持对装备中的符文进行熔炼（吞噬）
							%% 熔炼（吞噬）前卸载
							case TargetPos of
								?RunePos_Package ->
									skip;
								?RunePos_Player ->
									playerRuneOff([TargetRune], false);
								_ ->
									playerPetRuneOff([TargetRune], false)
							end,
							%% 熔炼（吞噬）
							NewRune = runeUpgrade(TargetRune, Exp),
							%% 熔炼（吞噬）后装备
							case TargetPos of
								?RunePos_Package ->
									skip;
								?RunePos_Player ->
									playerRuneOn([NewRune]);
								_ ->
									playerPetRuneOn([NewRune], TargetPos)
							end,
							NewRune_ = NewRune#recRune{subOwnerID = TargetPos},
							?DEBUG_OUT("melt ~p, ~p, ~p -> ~p", [playerState:getRoleID(), TargetRune =:= NewRune, TargetRune, NewRune]),
							%% 熔炼结果
							RuneInfo = getNetRuneInfo(NewRune_),
							playerMsg:sendNetMsg(#pk_GS2U_RuneMeltAck{runeInfo = RuneInfo, runeUIDS = UIDs}),
							ok;
						_ ->
							?DEBUG_OUT("[DebugForRune] melt skip3", []),
							skip
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_TradeGold)
			end
	end,
	ok.

runeUpgrade(#recRune{baseProps = Props1} = Rune, AddExp) ->
	NewRune = #recRune{baseProps = Props2} = runeUpgrade2(Rune, AddExp),
	case Props1 =:= Props2 of
		true ->
			saveRune(NewRune, ?RuneSaveType_UpdateBase);
		_ ->
			saveRune(NewRune, ?RuneSaveType_UpdateAll)
	end,
	NewRune.

runeUpgrade2(#recRune{runeID = RuneID, level = Lvl, exp = Exp, baseProps = BaseProps, randProps = RandProps} = Rune, AddExp) ->
	#runeCfg{level_up_group_id = LvlGroupID} = getRuneConf(RuneID),
	#rune_levelCfg{exp = LvlExp} = getCfg:getCfgPStack(cfg_rune_level, LvlGroupID, Lvl),
	NeedExp = LvlExp - Exp,
	%%判断符文下一等级是否可以
	NextLvIsAvailableFun = fun(_TempLvlGroupID, TempCurrentLevel) ->
		%%如果配置文件里面没有下一等级的配置信息，则表示当前等级已经是最大等级了
		case getCfg:getCfgPStack(cfg_rune_level, LvlGroupID, TempCurrentLevel + 1) of
			#rune_levelCfg{} -> true;
			_ -> false
		end
	                       end,
	NextLvIsAvailable = NextLvIsAvailableFun(LvlGroupID, Lvl),
	if
		(NeedExp =:= AddExp) and NextLvIsAvailable ->
			%% 刚刚升级
			NewLevel = Lvl + 1,
			#rune_levelCfg{growRatio = Ratio} = getCfg:getCfgPStack(cfg_rune_level, LvlGroupID, NewLevel),
			%% 属性升级
			BaseProps1 = lists:map(fun(#recRuneProp{propValue = PropValue} = Prop) ->
				Prop#recRuneProp{propValue = PropValue * Ratio} end, BaseProps),
			Rune1 = Rune#recRune{level = NewLevel, exp = 0, baseProps = BaseProps1},
			RandProps1 = lists:map(fun(#recRuneProp{propValue = PropValue} = Prop) ->
				Prop#recRuneProp{propValue = PropValue * Ratio} end, RandProps),
			Rune1#recRune{randProps = RandProps1};
		NeedExp > AddExp ->
			%% 不够升级
			Rune#recRune{exp = Exp + AddExp};
		NextLvIsAvailable ->
			%% 还可以继续升级
			NewLevel = Lvl + 1,
			#rune_levelCfg{growRatio = Ratio} = getCfg:getCfgPStack(cfg_rune_level, LvlGroupID, NewLevel),
			%% 属性升级
			BaseProps1 = lists:map(fun(#recRuneProp{propValue = PropValue} = Prop) ->
				Prop#recRuneProp{propValue = PropValue * Ratio} end, BaseProps),
			Rune1 = Rune#recRune{level = NewLevel, exp = 0, baseProps = BaseProps1},
			RandProps1 = lists:map(fun(#recRuneProp{propValue = PropValue} = Prop) ->
				Prop#recRuneProp{propValue = PropValue * Ratio} end, RandProps),
			NewRune = Rune1#recRune{randProps = RandProps1},
			runeUpgrade2(NewRune, AddExp - NeedExp);
		NextLvIsAvailable =:= false ->
			%%已升级到最大等级
			Rune
	end.

getMeltCost([], Ret) -> Ret;
getMeltCost(#recRune{runeID = RuneID, level = Lvl, exp = Exp}, {ExpRet, CostRec}) ->
	#runeCfg{exp_group_id = GroupID} = getRuneConf(RuneID),
	Key2List = getCfg:get2KeyList(cfg_rune_level, GroupID),
	Key2List2 = [Key2 || Key2 <- Key2List, Key2 < Lvl],
	F =
		fun(K2, ExpAcc) ->
			#rune_levelCfg{smeltRatio = Ratio, exp = E} = getCfg:getCfgPStack(cfg_rune_level, GroupID, K2),
			ExpAcc + erlang:max(erlang:round(Ratio * E), 1)
		end,
	ExpRet2 = lists:foldl(F, ExpRet, Key2List2),
	#rune_levelCfg{smeltRatio = Ratio2, cost = Cost} = getCfg:getCfgPStack(cfg_rune_level, GroupID, Lvl),
	ExpRet3 = ExpRet2 + erlang:max(erlang:round(Ratio2 * Exp), 1),
	{ExpRet3, CostRec + Cost};
getMeltCost([#recRune{} = Rune | List], Ret) ->
	Ret2 = getMeltCost(Rune, Ret),
	getMeltCost(List, Ret2).