%% @author zhengzhichun
%% @doc @todo Add description to playerAcKingBattleAll.
%%王者战天下  刘展

-module(playerAcKingBattleAll).

-include("playerPrivate.hrl").
-include("../activity/activityPrivate.hrl").
-include("../activity/gameactivity/kingbattleall/acKingBattleAllPrivatePrivate.hrl").
-include("../activity/gameactivity/activityPhaseDefine.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	synAllActivityState/0,
	getKingRevivePt/0,
	flashMirrorInfo/0,
	giveMarrorFlower/0
]).

-export([
	enterKingBattleSenceSuccessAck/0,
	onEnterAcMap/1,
	onLeaveAcMap/1,
	onLevelKingBattleMap/0,
	changeMap/1,
	requestInKingMap/0,
	requestJoinKingBattleMapAck/1,
	requestQuotaNumber/2,
	attacker_buy_buff/0,
	attacker_buy_buff_one_key/0,
	defender_buy_buff/0,
	defender_buy_buff_one_key/0,
	defender_buy_mirror_buff/0,
	defender_buy_mirror_buff_one_key/0,
	repair_mirror/1,
	flashBuffInfo/0,
	setKingDeclaration/1
]).

%%同步下发各活动状态
-spec synAllActivityState() -> ok.
synAllActivityState() ->
	L = getCfg:get1KeyList(cfg_activity),
	Fun =
		fun(AID) ->
			case canSendToClient(AID) of
				true ->
					#activityCfg{id = CfgID, mapidlist = ListMapID} = getCfg:getCfgByArgs(cfg_activity, AID),
					MapID =
						case ListMapID of
							[] -> 0;
							[MID | _] -> MID
						end,
					PhaseValue =
						case myEts:lookUpEts(?AcEts, CfgID) of
							[#rec_activity{phase = Phase} | _] when Phase > 0 ->
								%%活动阶段phase值>0表示活动开启中，其他为没开启
								Phase;
							_ -> 0
						end,
					Msg = #pk_GS2U_ActivityState{
						activityID = CfgID,
						mapID = MapID,
						phase = PhaseValue
					},
					playerMsg:sendNetMsg(Msg);
				_ ->
					skip
			end
		end,
	lists:foreach(Fun, L),
	ok.

%% 能不能同步给客户端
canSendToClient(?ActivityType_Darkness) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Darkness) of
		true ->
			%% 活动是开启的，要同步
			true;
		_ -> false
	end;
canSendToClient(?ActivityType_PetBattle) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_PetBattle) of
		true -> true;
		_ -> false
	end;
canSendToClient(?ActivityType_AnswerPlay) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_LuckAnswerBtn) of
		true -> true;
		_ -> false
	end;
canSendToClient(?ActivityType_CityMonster) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_GuardCityBtn) of
		true -> true;
		_ -> false
	end;
canSendToClient(?ActivityType_HDBattle) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_HDBattle) of
		true -> true;
		_ -> false
	end;
canSendToClient(?ActivityType_GuildExpedition) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_GuildExpedition) of
		true -> true;
		_ -> false
	end;
canSendToClient(?ActivityType_KingBattleAll) ->
	acKingBattleAllLogic:globalControlIsOpen();
canSendToClient(?ActivityType_EscortGoods) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_EscortGoods) of
		true -> true;
		_ -> false
	end;
%canSendToClient(?ActivityType_WeddingSite) ->
%	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_WeddingSite) of
%		true -> true;
%		_ -> false
%	end;
canSendToClient(_AID) ->
	true.

%%下线或退出王者战天下时的处理
-spec onLevelKingBattleMap() -> ok.
onLevelKingBattleMap() ->
	CurMapID = playerState:getMapID(),
	case globalCfg:getGlobalCfg(fightall_map_id) of
		Val when Val =:= CurMapID ->
			core:sendMsgToActivity(?ActivityType_KingBattleAll,
				onLevelKingBattleMap,
				{
					playerState:getRoleID()
				}),
			ok;
		_ ->
			skip
	end,
	ok.

%%王者战天下的复活点
-spec getKingRevivePt() -> {X :: float(), Y :: float()}.
getKingRevivePt() ->
	RoleID = playerState:getRoleID(),
	L =
		case edb:readAllRecord(rec_guard_mirror) of
		            [#rec_guard_mirror{roleID = KingRoleID} | _] when KingRoleID =:= RoleID ->
			            %%防守方复活时的无敌buff
			            psMgr:sendMsg2PS(self(), addBuff, {playerState:getLevel(), 221}),
			            globalCfg:getGlobalCfgList(fightall_defend);
		            _ ->
			            globalCfg:getGlobalCfgList(fightall_attack)
	            end,
	Index = misc:rand(1, erlang:length(L)),
	lists:nth(Index, L).

%%申请进入 王者战天下
-spec requestInKingMap() -> ok.
requestInKingMap() ->
	core:sendMsgToActivity(?ActivityType_KingBattleAll,
		requestJoinKingBattleMap,
		{
			playerState:getRoleID(),
			playerPropSync:getProp(?SerProp_PlayerHistoryForce)
		}),
	ok.
requestJoinKingBattleMapAck({MapID, MapPID, {X, Y}}) ->
	playerScene:onRequestEnterActivityMap(MapID, MapPID, X, Y);
requestJoinKingBattleMapAck(ErrorCode) ->
	playerMsg:sendErrorCodeMsg(ErrorCode).
%%成功进入到守护世界地图
enterKingBattleSenceSuccessAck() ->
	Argu = logicArguLib:getRoleBaseInfoArgu(),
	R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_AC_KING_BATTLE_ENTER_ACTIVE_SENCE, [Argu]),
	?DEBUG_OUT("R=======enterKingBattleSenceSuccessAck=====~p~n", [R]).

%% 王者战天下（查询名额）
-spec requestQuotaNumber(V_activityID :: uint16(), V_mapID :: uint16()) -> ok.
requestQuotaNumber(V_activityID, V_mapID) ->
	KingBattleAllAttackerNum = acKingBattleAllLogic:getOnlineAttackerNumber(),
	[{CnfAttackerNum}, _] = globalCfg:getGlobalCfgList(fightall_attacker),
	Msg = #pk_GS2U_AttackerDefenderQuotaNumberAck{
		activityID = V_activityID,
		mapID = V_mapID,
		acctackerQuotaNum = CnfAttackerNum - KingBattleAllAttackerNum
	},
	?DEBUG_OUT("~p ~p ", [Msg, KingBattleAllAttackerNum]),
	playerMsg:sendNetMsg(Msg),
	ok.

-spec changeMap(MapID :: uint16()) -> ok.
changeMap(MapID) ->
	case globalCfg:getGlobalCfg(fightall_map_id) of
		MapID ->
			onEnterAcMap(MapID);
		_ ->
			onLeaveAcMap(MapID)
	end,
	ok.

-spec onEnterAcMap(MapID :: uint16()) -> ok.
onEnterAcMap(AcKingBattleAllMapID) ->
	case globalCfg:getGlobalCfg(fightall_map_id) of
		AcKingBattleAllMapID ->
			RoleID = playerState:getRoleID(),
			case edb:readAllRecord(rec_guard_mirror) of
				[#rec_guard_mirror{
					roleID = MirrorRoleID
				} | _] when RoleID == MirrorRoleID ->
					?DEBUG_OUT("CampRedBattle"),
					%%玩家设置成与镜像一个阵营
					playerState:setCamp(?CampRedBattle, true),
					ok;
				_ ->
					?DEBUG_OUT("CampBlueBattle"),
					%%玩家设置成与镜像敌对阵营
					playerState:setCamp(?CampBlueBattle, true)
			end,
			%%mwh-new-team
			playerTeam:leaveTeam(false),
%%			case playerState:getTeamID() > 0 of
%%				true -> playerTeam2:leaveTeam(?TeamTypeNormal);
%%				_ -> skip
%%			end,
			playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_ShiJieShouHu),
			playerLogAdd:addLogParticipatorInfo(?LogParticipator_FightAll),
%%      playerliveness:onFinishLiveness(?LivenessFightAll, 1),
			ok;
		_ ->
			ok
	end.

%%玩家离开 王者战天下 地图
-spec onLeaveAcMap(TargetMapID :: integer()) -> ok.
onLeaveAcMap(TargetMapID) ->
	case globalCfg:getGlobalCfg(fightall_map_id) of
		TargetMapID ->
			skip;
		_ ->
			%%玩家重置为玩家阵营
			playerState:setCamp(?CampPlayer, true)
	end,
	ok.

%%王者雕像的点赞
-spec giveMarrorFlower() -> ok.
giveMarrorFlower() ->
	?DEBUG_OUT("giveMarrorFlower"),
	MyRoleID = playerState:getRoleID(),
	[#rec_guard_mirror{roleID = RoleID} | _] = edb:readAllRecord(rec_guard_mirror),
	%%每日计数的id是54位的，长了报错
	<<_:10, RoleID2:54>> = <<RoleID:64>>,
	case playerDaily:getDailyCounter(?DailyType_AddPraise4Marror, RoleID2) > 0 of
		true ->
			%%今天已经对该玩家点过赞了
			playerMsg:sendErrorCodeMsg(?ErrorCode_KingGiveFlowerDeny);
		false when RoleID =:= MyRoleID ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_KingGiveFlowerDeny4self);
		_ ->
			case playerPersonalityInfo:addPraiseAPI(RoleID) of
				true ->
					playerDaily:incDailyCounter(?DailyType_AddPraise4Marror, RoleID2),
					AwardItem = globalCfg:getGlobalCfg(flowers),
					Plog = #recPLogTSItem{
						old = 0,
						new = 1,
						change = 1,
						target = ?PLogTS_PlayerSelf,
						source = ?PLogTS_Item4KingBattleAll,
						gold = 0,
						goldtype = 0,
						changReason = ?ItemSourceKingBattleAllAward,
						reasonParam = 0
					},
					playerPackage:addGoodsAndMail(AwardItem, 1, true, 0, Plog),
					playerMsg:sendNetMsg(#pk_GS2U_AddPraise{}),
					playerMsg:sendErrorCodeMsg(?ErrorCode_KingGiveFlowerSucc),
					ok;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_KingGiveFlowerFail)
			end
	end,
	ok.

%%设置守护宣言
-spec setKingDeclaration(Declaration::string()) -> ok.
setKingDeclaration(Declaration)->
	CurrentRoleID = playerState:getRoleID(),
	{ok,State}= activityLogic:getActivePhase(?ActivityType_KingBattleAll) ,
	case acKingBattleAllLogic:getDefenderInfo(CurrentRoleID) of
		{ok, #rec_guard_mirror{} = Mirror} when ?ActivityPhase_KingBattleAll_5  =/= State->
			acKingBattleAllLogic:updateDefenderInfo(Mirror#rec_guard_mirror{declaration = Declaration}),
			Msg  = #pk_GS2U_ChangeGuardianDeclaration{
						isChange = true
					},
			playerMsg:sendNetMsg(Msg);
		_->
			Msg  = #pk_GS2U_ChangeGuardianDeclaration{
			isChange = false
			},
			playerMsg:sendNetMsg(Msg)
	end,

ok.

%%等级，名字，战力
-spec flashMirrorInfo() -> ok|skip.
flashMirrorInfo() ->
	CurrentRole = playerState:getRoleID(),

	case acKingBattleAllLogic:getCurrentDefenderInfo() of
		{ok, #rec_guard_mirror{roleID = RoleID,guardTimes = DefnedDays,hpNumber = CurrentHp,fightForce = LastFightForce,declaration =  Declaration}}  ->
			if
				CurrentRole =:=RoleID ->
					FightForce = playerPropSync:getProp(?SerProp_PlayerHistoryForce);
				true ->
					FightForce=LastFightForce
			end,
			?DEBUG_OUT("FightForce=======~p~n",[{FightForce,CurrentHp}]),
			MaxHp = acKingBattleAllLogic:playerForce2MirroeHp(FightForce),
			#?RoleKeyRec{roleName = Name, level = Level,career = Career,race = Race,sex = Sex,head = Head} = core:queryRoleKeyInfoByRoleID(RoleID),

			%%[#rec_base_role{roleName = Name, level = Level,career = Career,race = Race,sex = Sex,head = Head}] = ets:lookup(ets_rec_base_role, RoleID),
			case ets:lookup(ets_rec_OnlinePlayer, RoleID) of
				[#rec_OnlinePlayer{}] ->
					Code=1;
				_ ->
					Code =0
			end,

			GuildName = guildLogic:getGuildNameByRoleID(RoleID),
			{ok,#king_battle_mirror_appearance{equipIDList =EquipList,equipLevelList = EquipLevelIDList , fashionIDList = FashionIDList,  wingLevel=WingLevel }}=acKingBattleAllLogic:getMirrorAppearance(RoleID),
			MsgEquipmentList = [#pk_PlayerKingBattleEquip{equipID =EquipID,quality = Quarlity }||#recVisibleEquip{equipID = EquipID,quality = Quarlity}<-EquipList],
			MsgEquipLevelIDLis=[#pk_PlayerKingBattleEquipLevel{type = EqType,level = EqLv}||{ EqType, EqLv}<-EquipLevelIDList] ,
			playerMsg:sendNetMsg(#pk_GS2U_MarrorInfoAck{
				nickName = binToString(Name),
				playerLevel = Level,
				playerForce = FightForce,
				%% UInt64 角色ID
				roleID=RoleID,
				%% UInt64 玩家流水号
				playerCode=Code,
				%% SByte 职业
				career=Career,
				%% SByte 种族
				race=Race,
				wingLevel=WingLevel,
				%% SByte 性别
				sex=Sex,
				%% Int32
				head=Head,
				%% String军团名
				clique=GuildName,
				%% UInt32成功防守天数
				defendDays=DefnedDays,
				%% UInt64防守镜像最大生命值
				mirrorMaxHp=MaxHp,
				%% UInt64防守镜像剩余生命值
				mirrorLastHp=erlang:trunc(CurrentHp),
				%%时装
				fashionIDs = FashionIDList,
				%% PlayerKingBattleEquip 装备ID列表
				equipIDList=MsgEquipmentList,
				%% PlayerKingBattleEquipLevel装备等级列表
				equipLevelList=MsgEquipLevelIDLis,
				%%守护宣言
				declaration = binToString(Declaration)
			});
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_KingBattleNoKing)
	end.
%%购买buff
attacker_buy_buff() ->
	Argu = logicArguLib:getRoleBaseInfoArgu(),
	R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_AC_KING_BATTLE_BUY_ATTACKER_BUFF, [Argu]),
	flashBuffInfo(),
	?DEBUG_OUT("==========attacker_buy_buff=====~p~n", [R]).
attacker_buy_buff_one_key() ->
	Argu = logicArguLib:getRoleBaseInfoArgu(),
	R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_AC_KING_BATTLE_BUY_ATTACKER_BUFF_ONE_KEY, [Argu]),
	flashBuffInfo(),
	?DEBUG_OUT("==========attacker_buy_buff_one_key=====~p~n", [R]).
defender_buy_buff() ->
	Argu = logicArguLib:getRoleBaseInfoArgu(),
	R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_AC_KING_BATTLE_BUY_DEFENDER_BUFF, [Argu]),
	flashBuffInfo(),
	?DEBUG_OUT("==========defender_buy_buff=====~p~n", [R]).
defender_buy_buff_one_key() ->
	Argu = logicArguLib:getRoleBaseInfoArgu(),
	R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_AC_KING_BATTLE_BUY_DEFENDER_BUFF_ONE_KEY, [Argu]),
	flashBuffInfo(),
	?DEBUG_OUT("==========defender_buy_buff_one_key=====~p~n", [R]).
defender_buy_mirror_buff() ->
	Argu = logicArguLib:getRoleBaseInfoArgu(),
	R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_AC_KING_BATTLE_BUY_MIRROR_BUFF, [Argu]),
	flashBuffInfo(),
	?DEBUG_OUT("==========defender_buy_mirror_buff=====~p~n", [R]).
defender_buy_mirror_buff_one_key() ->
	Argu = logicArguLib:getRoleBaseInfoArgu(),
	R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_AC_KING_BATTLE_BUY_MIRROR_BUFF_ONE_KEY, [Argu]),
	flashBuffInfo(),
	?DEBUG_OUT("==========defender_buy_mirror_buff_one_key=====~p~n", [R]).



%%获取数据时需要先将数据发送给客户端一次。
repair_mirror(IsRepairAll )->
%%  KingBattleHpPerCoin=500,?CoinTypeDiamond
	%%world_guardian_one
	{CoinType, KingBattleHpPerCoin} = globalCfg:getGlobalCfg(kingBattleRepairMirrorCfg),
	World_guardian_one = globalCfg:getGlobalCfg(world_guardian_one),
	CurrentRoleID = playerState:getRoleID(),
	{ok,State}= activityLogic:getActivePhase(?ActivityType_KingBattleAll) ,
	case acKingBattleAllLogic:getDefenderInfo(CurrentRoleID) of
		{ok, #rec_guard_mirror{hpNumber = HpNumber} = Mirror} when ?ActivityPhase_KingBattleAll_5  =/= State->
			FightForce = playerPropSync:getProp(?SerProp_PlayerHistoryForce),
			MaxHp = acKingBattleAllLogic:playerForce2MirroeHp(FightForce),
			RepairHp=
			case IsRepairAll of true
				  ->
					MaxHp - HpNumber;
                  _->
	                 OneRepairHp =  KingBattleHpPerCoin * World_guardian_one,
	                 NeedHp =  MaxHp - HpNumber,
	                 if
	                 OneRepairHp > NeedHp ->
		                 NeedHp;
					 true ->
						OneRepairHp
					end
			end,
			?DEBUG_OUT("========repair_mirror==1111=====~p~n",[{MaxHp,HpNumber,FightForce,RepairHp,KingBattleHpPerCoin,CoinType, playerState:getCoin(CoinType)}]),
			if
				RepairHp > 0 ->
					ReapirNeedCoin = erlang:round(RepairHp / KingBattleHpPerCoin),
					Plog =
						#recPLogTSMoney{
							reason = ?CoinUseKingBattleAll,
							param = [RepairHp],
							target = ?PLogTS_Item4KingBattleAll,
							source = ?PLogTS_PlayerSelf
						},
					CurrenCoin = playerState:getCoin(CoinType),
					if
						CurrenCoin > ReapirNeedCoin ->
							UseCoin = ReapirNeedCoin,

							NewHp =
							case IsRepairAll of true
                                ->
								MaxHp;
								_->
									HpNumber +RepairHp
							end;
						true ->
							UseCoin = CurrenCoin,
							NewHp = HpNumber + erlang:trunc(UseCoin * KingBattleHpPerCoin)
					end,
					case playerMoney:decCoin(CoinType, UseCoin, Plog) of
						true ->
							acKingBattleAllLogic:updateDefenderInfo(Mirror#rec_guard_mirror{hpNumber = NewHp, fightForce = FightForce, roleLevel = playerState:getLevel()}),
							playerMsg:sendErrorCodeMsg(?ErrorCode_KingBattleRepairTips, [UseCoin, NewHp-HpNumber]),
							Msg = #pk_GS2U_KingBattleRepairMirror{
								mirrorMaxHp = MaxHp,
								mirrorCurrentHp = NewHp},
							playerMsg:sendNetMsg(Msg);
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_MallBuy_Diamond_Not_Enough)
					end;
				true ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_KingBattleNotNeedRepair)
			end;
		{ok, #rec_guard_mirror{}}->
			playerMsg:sendErrorCodeMsg(?ErrorCode_KingBattleOpenFobidRepairMirror);
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_KingBattleOpDeny)
	end,
	ok.

%%Msg = {error,?ErrorCode_KingBattleNoKing};
%%%%        ErrorCode_KingBattleNotJoin

%%刷新buff信息
flashBuffInfo() ->
	CurrentRoleID = playerState:getRoleID(),
	case acKingBattleAllLogic:getCurrentDefenderInfo() of
		{ok, #rec_guard_mirror{roleID = CurrentRoleID,  mirrorBuffCfgID = MirrorBuffID, roleBuffCffgID = DefendeiBuffID}} ->
			Msg = #pk_GS2U_KingBattleBuffInfo{
				defenderBuffcfgID = DefendeiBuffID,
				mirrorBuffcfgID = MirrorBuffID,
				attackerBuffcfgID = 0};
		{ok, #rec_guard_mirror{mirrorBuffCfgID = MirrorBuffID, roleBuffCffgID = DefendeiBuffID}} ->
			case acKingBattleAllLogic:getAttackerInfo(CurrentRoleID) of
				{error, none} ->
					Msg = {error, ?ErrorCode_KingBattleNotJoin};
				{ok, #king_battle_attacker{buffCfgID = BuffCfgID}} ->
					Msg = #pk_GS2U_KingBattleBuffInfo{
						defenderBuffcfgID = DefendeiBuffID,
						mirrorBuffcfgID = MirrorBuffID,
						attackerBuffcfgID = BuffCfgID}
			end;
		_ ->
			Msg = {error, ?ErrorCode_KingBattleNoKing}
	end,
	case Msg of
		{error, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode);
		_ ->
			playerMsg:sendNetMsg(Msg)
	end.
%% ====================================================================
%% Internal functions
%% ====================================================================

binToString(BinStr) when erlang:is_list(BinStr) ->
	BinStr;
binToString(BinStr) ->
	erlang:binary_to_list(BinStr).

