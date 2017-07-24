%%
%% @doc @todo 查看远程玩家属性.

-module(playerRPView).
-include("playerPrivate.hrl").

-define(RPView_Min, 1).
-define(RPView_Role, 1).		%% 角色
-define(RPView_Fashion, 2).		%% 时装
-define(RPView_Pet, 3).			%% 宠物
-define(RPView_Marriage, 4).	%% 婚姻
-define(RPView_Identity, 5).	%% 身份证
-define(RPView_Max, 5).

%% 缓存远程玩家信息的CD
-define(CacheViewInfoCD, 60).

-export([
	queryRPInfo/2,
	getBattlePropList/0
]).

-export([
	cacheViewInfo/2,
	queryRPViewInfo/2
]).

%%查看远程玩家的属性
queryRPInfo(RoleID,Type) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_RPView) of
		true ->
			case playerState:getRoleID() of
				RoleID ->
					skip;
				_ ->
					%% 判断是不是跨服玩家
					try
						case playerMgrOtp:getOnlinePlayerInfoByID(RoleID) of
							#rec_OnlinePlayer{} = PlayerInfo ->
								queryLocalServerRPInfo(Type, PlayerInfo);
							_ ->
								playerMsg:sendErrorCodeMsg(?ErrorCode_ChatErrorReceiverOffLine)
						end
					catch
						_:Why  ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_ChatErrorReceiverOffLine),
							?LOG_OUT("~p queryRpInfo exption Why:~p", [?MODULE, Why])
					end
			end;
		_ ->
			?ERROR_OUT("queryRPInfo:~p,~p", [playerState:getRoleID(), RoleID]),
			skip
	end,
	ok.

%% 查看本线玩家的属性
-spec queryLocalServerRPInfo(Type::uint(), #rec_OnlinePlayer{}) -> ok.
queryLocalServerRPInfo(Type, #rec_OnlinePlayer{pid = PlayerPid,roleID = RoleID}) when Type >= ?RPView_Min andalso Type =< ?RPView_Max ->
	case misc:is_process_alive(PlayerPid) of
		true ->
			queryRPViewInfo(Type, PlayerPid, RoleID);
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_ChatErrorReceiverOffLine)
	end,
	ok;
queryLocalServerRPInfo(_Type, _Player)->
	playerMsg:sendErrorCodeMsg(?ErrorCode_System_Error_Unknow),
	ok.

%% 发送请求查询rp玩家对象属性
-spec queryRPViewInfo(ViewType::uint8(), TargetPid::pid(), RoleID::uint()) -> ok.
queryRPViewInfo(ViewType, TargetPid, RoleID) ->
	%% 附加参数
	Param = if
				ViewType =:= ?RPView_Identity ->
					daily2State:queryDaily2(playerState:getRoleID(), RoleID, ?Daily2Type_S_Friend2Like) > 0;
				true ->
					undefined
			end,
	psMgr:sendMsg2PS(TargetPid, queryRPViewInfo, {ViewType, RoleID, playerState:getNetPid(), Param}),
	ok.

%% 查询远程玩家信息
-spec queryRPViewInfo(PidFrom::pid(), {ViewType::uint8(), RoleID::uint64(), NetPid::pid(), Param::term()}) -> ok.
queryRPViewInfo(PidFrom, {_ViewType, RoleID, NetPid, _Param} = Data) ->
	case playerState:getRoleID() of
		RoleID ->
			case ets:lookup(recRPView, RoleID) of
				[] ->
					cacheViewInfo(RoleID, true);
				_ ->
					skip
			end,

			queryRPViewInfo2(PidFrom, Data);
		_ ->
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_System_Error_Unknow)
	end,
	ok.

queryRPViewInfo2(_PidFrom, {?RPView_Role = RVType, RoleID, NetPid, _Param}) ->
	Info =
		case isCD(RVType) of
			false ->
				cache_pk_GS2U_LookRPInfo_Result(RoleID);
			_ ->
				[#recRPView{pk_GS2U_LookRPInfo_Result = M}] = ets:lookup(recRPView, RoleID),
				M
		end,
	gsSendMsg:sendNetMsg(NetPid, Info),
	ok;
queryRPViewInfo2(_PidFrom, {?RPView_Fashion = RVType, RoleID, NetPid, _Param}) ->
	Info =
		case isCD(RVType) of
			false ->
				cache_pk_GS2U_LookRPInfo_Fashion(RoleID);
			_ ->
				[#recRPView{pk_GS2U_LookRPInfo_Fashion = M}] = ets:lookup(recRPView, RoleID),
				M
		end,
	gsSendMsg:sendNetMsg(NetPid, Info),
	ok;
queryRPViewInfo2(_PidFrom, {?RPView_Pet, RoleID = RVType, NetPid, _Param}) ->
	Info =
		case isCD(RVType) of
			false ->
				cache_pk_GS2U_LookRPInfo_Pet(RoleID);
			_ ->
				[#recRPView{pk_GS2U_LookRPInfo_Pet = M}] = ets:lookup(recRPView, RoleID),
				M
		end,
	gsSendMsg:sendNetMsg(NetPid, Info),
	ok;
queryRPViewInfo2(_PidFrom, {?RPView_Marriage = RVType, RoleID, NetPid, _Param}) ->
	Info =
		case isCD(RVType) of
			false ->
				cache_pk_GS2U_LookRPInfo_Marriage(RoleID);
			_ ->
				[#recRPView{pk_GS2U_LookRPInfo_Marriage = M}] = ets:lookup(recRPView, RoleID),
				M
		end,
	gsSendMsg:sendNetMsg(NetPid, Info),
	ok;
queryRPViewInfo2(_PidFrom, {?RPView_Identity = RVType, RoleID, NetPid, Param}) ->
	Info =
		case isCD(RVType) of
			false ->
				cache_pk_GS2U_Identity_Ack(RoleID);
			_ ->
				[#recRPView{pk_GS2U_Identity_Ack = M}] = ets:lookup(recRPView, RoleID),
				M
		end,
	Info2 = case Param of
				undefined -> Info;
				_ -> Info#pk_GS2U_Identity_Ack{isGiveLike = Param}
			end,
	gsSendMsg:sendNetMsg(NetPid, Info2),
	ok;
queryRPViewInfo2(_PidFrom, {_ViewType, _RoleID, NetPid, _Param}) ->
	playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_SystemNotOpen),
	ok.

isCD(RVType) ->
	NowSec = time2:getTimestampSec(),
	case get({cache_CacheViewInfoCD, RVType}) of
		undefined ->
			put({cache_CacheViewInfoCD, RVType}, NowSec),
			false;
		V ->
			case NowSec - V >= ?CacheViewInfoCD of
				true ->
					put({cache_CacheViewInfoCD, RVType}, NowSec),
					false;
				_ ->
					true
			end
	end.

%% 下线缓存自己的数据
-spec cacheViewInfo(RoleID::uint64(), IsCheckCD::boolean()) -> ok.
cacheViewInfo(RoleID, false) ->
	cache_pk_GS2U_LookRPInfo_Result(RoleID),
	cache_pk_GS2U_Identity_Ack(RoleID),
	cache_pk_GS2U_LookRPInfo_Pet(RoleID),
	cache_pk_GS2U_LookRPInfo_Marriage(RoleID),
	cache_pk_GS2U_LookRPInfo_Fashion(RoleID),
	ok;
cacheViewInfo(RoleID, true) ->
	case isCD(?RPView_Role) of
		false ->
			cacheViewInfo(RoleID, false);
		_ ->
			skip
	end,
	ok.

%% 角色身份证
cache_pk_GS2U_Identity_Ack(RoleID) ->
	Msg = playerIdentity:makeQueryIdentity(RoleID),
	case ets:lookup(recRPView, RoleID) of
		[] -> ets:insert(recRPView, #recRPView{roleID = RoleID, pk_GS2U_Identity_Ack = Msg});
		_ -> ets:update_element(recRPView, RoleID, {#recRPView.pk_GS2U_Identity_Ack, Msg})
	end,
	Msg.

%% 角色宠物
cache_pk_GS2U_LookRPInfo_Pet(RoleID) ->
	Pets = playerState:getPets(),
	Fun =
		fun(#recPetInfo{pet_status = Status} = Pet, Acc) ->
			case Status >= ?PetState_Assist of
				true ->
					#pk_PetBaseInfo{} = MakePet = playerPet:makePetBaseInfo(Pet),
					[#pk_RPView_PetBaseInfo{
						%% UInt16宠物ID
						petID = MakePet#pk_PetBaseInfo.petID,
						%% Byte宠物星阶
						petStar = MakePet#pk_PetBaseInfo.petStar,
						%% Byte宠物是否出战 0:休息(非助战) 1:休息(助战)2:出战（非召唤）3:出战（召唤）
						status = MakePet#pk_PetBaseInfo.status,
						%% String宠物名字
						petName = MakePet#pk_PetBaseInfo.petName,
						%% Byte宠物转生
						petRaw = MakePet#pk_PetBaseInfo.petRaw,
						%% RPView_AddProp宠物属性
						petProps = [ #pk_RPView_AddProp{prop = K, value = V} || {K, V} <- MakePet#pk_PetBaseInfo.petProps],
						%% UInt64宠物战斗力
						petForce = MakePet#pk_PetBaseInfo.petForce,
						%% UInt32宠物提升次数
						upCount = MakePet#pk_PetBaseInfo.upCount
					} | Acc];
				_ ->
					Acc
			end
		end,
	PetBaseInfoList = lists:foldl(Fun, [], Pets),

	AssistList = playerPet:getPetAssistBattleInfo(),
	AssistList2 = [#pk_RPView_AssistBattleInfo{slot = Slot, petID = PetID} || #recPetAssistInfo{slot = Slot, petID = PetID} <- AssistList],

	Msg = #pk_GS2U_LookRPInfo_Pet{roleID = RoleID, petInfoList = PetBaseInfoList, infoList = AssistList2},

	case ets:lookup(recRPView, RoleID) of
		[] -> ets:insert(recRPView, #recRPView{roleID = RoleID, pk_GS2U_LookRPInfo_Pet = Msg});
		_ -> ets:update_element(recRPView, RoleID, {#recRPView.pk_GS2U_LookRPInfo_Pet, Msg})
	end,
	Msg.

%% 角色婚姻
cache_pk_GS2U_LookRPInfo_Marriage(RoleID) ->
	RoleID = playerState:getRoleID(),
	#rec_marriage{
		targetRoleID = TargetRoleID,
		closeness = Closeness,
		timeRelation = TimeRelation
	} = marriageState:queryRelation(RoleID),
	Msg =
		case TargetRoleID > 0 of
			true ->
				case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
					#?RoleKeyRec{roleName = Name, sex = Sex} ->
						#pk_GS2U_LookRPInfo_Marriage{
							roleID = RoleID,
							id = TargetRoleID,
							name = Name,
							sex = Sex,
							weddingDay = TimeRelation,
							closeness = Closeness
						};
					_ ->
						?ERROR_OUT("syncBaseInfo can not find TargetRoleID(~p) from core:queryRoleKeyInfoByRoleID/1", [TargetRoleID]),
						#pk_GS2U_LookRPInfo_Marriage{
							roleID = RoleID,
							id = TargetRoleID,
							name = [],
							sex = 0,
							weddingDay = TimeRelation,
							closeness = Closeness
						}
				end;
			_ ->
				%% 未婚
				#pk_GS2U_LookRPInfo_Marriage{
					roleID = RoleID,
					id = TargetRoleID,
					name = [],
					sex = 0,
					weddingDay = TimeRelation,
					closeness = Closeness
				}
		end,
	case ets:lookup(recRPView, RoleID) of
		[] -> ets:insert(recRPView, #recRPView{roleID = RoleID, pk_GS2U_LookRPInfo_Marriage = Msg});
		_ -> ets:update_element(recRPView, RoleID, {#recRPView.pk_GS2U_LookRPInfo_Marriage, Msg})
	end,
	Msg.

%% 角色时装
cache_pk_GS2U_LookRPInfo_Fashion(RoleID) ->
	Now = time:getUTCNowSec(),
	PlayerFashionList = playerState:getFashionList(),
	L1 = lists:foldl(
		fun(#recFashion{fashionID = FashionID, endTime = EndTime}, Acc) ->
			if
				EndTime =:= 0 ->
					[#pk_RPView_FashionInfo{time = 0, fashionID = FashionID} | Acc];
				EndTime - Now > 0 ->
					[#pk_RPView_FashionInfo{time = EndTime - Now, fashionID = FashionID} | Acc];
				true ->
					Acc
			end
		end, [], PlayerFashionList),
	L2 = playerState:getFashionSuitList(),
	Msg = #pk_GS2U_LookRPInfo_Fashion{roleID = RoleID, datas = L1, activeFashionSuitList = L2},
	case ets:lookup(recRPView, RoleID) of
		[] -> ets:insert(recRPView, #recRPView{roleID = RoleID, pk_GS2U_LookRPInfo_Fashion = Msg});
		_ -> ets:update_element(recRPView, RoleID, {#recRPView.pk_GS2U_LookRPInfo_Fashion, Msg})
	end,
	Msg.

%% 角色属性
cache_pk_GS2U_LookRPInfo_Result(RoleID) ->
	Level = playerState:getLevel(),
	Career = playerState:getCareer(),
	EquipInfo = playerPackage:getBodyEquipInfo(),
	PlayerForce = playerPropSync:getProp(?PriProp_PlayerForce),
	%% 获取战斗属性
	BattleProp = getBattlePropList(),
	FashionList = playerFashion:getShowFashions(),
	%% 获取装备精炼等级
	RefineList = playerState:getEquipRefine(),
	StartList = playerState:getEquipStarList(),
	FunEquipRefines = fun({Type, RefineLevel}) -> #pk_EquipRefineLevel{type = Type, level = RefineLevel} end,
	EquipRefines = lists:map(FunEquipRefines, RefineList),
	FunEquipStar = fun(#recEquipStar{pos = Pos, star = Star}) -> #pk_EquipStarLevel{type = Pos, level = Star} end,
	EquipStar = lists:map(FunEquipStar, StartList),
	GuildName = playerState:getGuildName(),
	Kv = playerPropSync:getProp(?PubProp_PlayerKillValue),
	RPPropMsg = #pk_GS2U_LookRPInfo_Result{
		playerKillValue = Kv,
		fashionList = FashionList,
		wingLevel = 0,
		propValues = BattleProp,
		guildName = GuildName,
		roleForce = PlayerForce,
		roleID = RoleID,
		roleName = playerNameUID:getPlayerNameByUID(RoleID),
		career = Career,
		sex = playerState:getSex(),
		race = playerState:getRace(),
		head = playerState:getHead(),
		level = Level,
		equips = EquipInfo,
		equipStar = EquipStar,
		equipRefines = EquipRefines,
		equipHonorLevel = 1
	},
	case ets:lookup(recRPView, RoleID) of
		[] -> ets:insert(recRPView, #recRPView{roleID = RoleID, pk_GS2U_LookRPInfo_Result = RPPropMsg});
		_ -> ets:update_element(recRPView, RoleID, {#recRPView.pk_GS2U_LookRPInfo_Result, RPPropMsg})
	end,
	RPPropMsg.

%% 获取玩家的战斗属性
-spec getBattlePropList() -> list().
getBattlePropList() ->
	L = lists:seq(?Prop_Min, ?PropMax),
	Fun =
		fun(PropID, RPProps) ->
			RPProps ++ [playerState:getBattlePropTotal(PropID)]
		end,
	lists:foldl(Fun, [], L).