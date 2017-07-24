%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, raink
%%% @doc
%%% 跨服骑宠竞速_角色接口
%%% @end
%%% Created : 20170901
%%%-------------------------------------------------------------------
-module(playerRace).
-author("meitianyang").

-include("playerPrivate.hrl").
-include("../crossActivity/cacRace/cacRacePrivate.hrl").

%% msg
-export([
	msg/1			%% 协议处理
]).

%% api
-export([
	init/0,			%% 上线初始化
	apply/0,		%% 报名参加活动
	apply/2,		%% 此处导出是为了能够指定模块调用，因为不小心和默认函数erlang:apply/2重名了
	cancel/0,		%% 取消报名（注意需要在切换地图、进入位面、下线、下坐骑时取消报名
	useItem/1		%% 使用虚拟道具
]).

%% callback
-export([
	onQueryAck/1,	%% 收到查询报名情况（仅上线请求回调）
	onApply/0,		%% 有人上了自己的双人坐骑，如果自己已经报名，则需要重新报名
	onApplyAck/1,	%% 收到报名结果
	onCancelAck/1,	%% 收到取消报名结果

	onNoticeEnter/1,%% 通知进入
	gatherSuccess/1,%% 采集成功
	onModAck/1,		%% 收到下一场活动的模式
	onGiveUp/0,		%% 下马时弃赛
	onBuff/1,		%% 需要添加BUFF
	onTryMount/1,	%% 尝试上马
	onTryGiveUp/0	%% 准备倒计时结束后被通知如果没有骑乘则需要放弃比赛
]).

%% gm
-export([
]).

%%%-------------------------------------------------------------------
% msg:协议处理
-spec msg(term()) -> no_return().
msg(Msg) ->
	case activity:queryActivitySwitch(?ActivityType_CrossRace) of
		true ->
			msg_real(Msg);
		_ ->
			?ERROR_CODE(?ErrorCode_Race_Apply_NotOpen)
	end.

-spec msg_real(term()) -> no_return().
msg_real(#pk_U2GS_RaceApply_Request{}) ->
	playerRace:apply();
msg_real(#pk_U2GS_RaceCancel_Request{}) ->
	cancel();
msg_real(#pk_U2GS_RaceMapItem_Request{itemID = ItemID}) ->
	useItem(ItemID);
msg_real(Unknown) ->
	?ERROR_OUT("invalid msg:~w RoleID:~w", [Unknown, playerState:getRoleID()]).

%%%-------------------------------------------------------------------
% api:上线初始化
-spec init() -> no_return().
init() ->
	core:sendMsgToActivity(?ActivityType_CrossRace, race_mod, 0).	%% 询问下场活动的模式

%%%-------------------------------------------------------------------
% api:报名参加活动
-spec apply() -> no_return().
apply() ->
	case playerState2:getCrossApply() of
		#recCrossApply{} ->
			?DEBUG_OUT("[DebugForRace] apply"),
			skip;	%% 忽略重复的报名请求
		_ ->
			RoleID = playerState:getRoleID(),
			Ret0 = check_map({0, []}),											%% 检查当前角色所在地图是否合法
			Ret1 = check_level(Ret0, RoleID, ?ErrorCode_YourLevelIsTooLower),	%% 检查当前角色等级是否满足要求
			{Ret2, TeamInfo} = check_pet(Ret1, RoleID),							%% 检查当前角色的骑乘状态
			case TeamInfo of
				{RoleID, _, GuestRoleID} ->
					%% 自己是骑宠主人，可能有同乘者，需要检查乘客等级
					RetMaster = check_level(Ret2, GuestRoleID, ?ErrorCode_Race_Apply_PartnerLevelTooLow),
					playerRace:apply(RetMaster, TeamInfo);
				{MasterRoleID, _, RoleID} ->
					%% 自己是乘客，需要检查骑宠主人等级
					RetGuest = check_level(Ret2, MasterRoleID, ?ErrorCode_Race_Apply_PartnerLevelTooLow),
					playerRace:apply(RetGuest, TeamInfo);
				_ ->
					?DEBUG_OUT("[DebugForRace] apply"),
					Ret2
			end
	end.

% 检测通过，执行报名
-spec apply({ErrorCodeIn, ErrorArgsIn}, {MasterRoleID, PetID, GuestRoleID}) -> {ErrorCodeOut, ErrorArgsOut} when
	ErrorCodeIn :: uint(),
	ErrorArgsIn :: list(),
	MasterRoleID :: uint64(),
	PetID :: uint16(),
	GuestRoleID :: uint64(),
	ErrorCodeOut :: uint(),
	ErrorArgsOut :: list().
apply({ErrorCodeIn, _} = In, _) when ErrorCodeIn > 0 ->
	?DEBUG_OUT("[DebugForRace] apply"),
	In;
apply(_In, {MasterRoleID, PetID, 0}) ->	%% 单人报名
	Data = #recCrossApply{
		id = 0,
		activityType = ?ActivityType_CrossRace,
		leader = MasterRoleID,
		applicant = playerState:getRoleID(),
		members = [core:queryCrossRoleBase(MasterRoleID)],
		paramEx = PetID
	},
	?DEBUG_OUT("[DebugForRace] apply"),
	core:sendMsgToActivityMgrCross(cac_apply, Data);
apply(_In, {MasterRoleID, PetID, GuestRoleID}) ->	%% 双人报名
	Data = #recCrossApply{
		id = 0,
		activityType = ?ActivityType_CrossRace,
		leader = MasterRoleID,
		applicant = playerState:getRoleID(),
		members = [core:queryCrossRoleBase(MasterRoleID), core:queryCrossRoleBase(GuestRoleID)],
		paramEx = PetID
	},
	?DEBUG_OUT("[DebugForRace] apply"),
	core:sendMsgToActivityMgrCross(cac_apply, Data).

%%%-------------------------------------------------------------------
% api:取消报名（注意需要在切换地图、进入位面、下线、下坐骑时取消报名
-spec cancel() -> no_return().
cancel() ->
	?DEBUG_OUT("[DebugForRace] cancel ~p", [misc:getStackTrace()]),
	case playerState2:getCrossApply() of
		#recCrossApply{id = ApplyID} ->
			?DEBUG_OUT("[DebugForRace] cancel"),
			core:sendMsgToActivityMgrCross(cac_cancel, {?ActivityType_CrossRace, {ApplyID, playerState:getRoleID()}});
		_ ->
			?DEBUG_OUT("[DebugForRace] cancel"),
			skip	%% 忽略没有报名的情况
	end.

%%%-------------------------------------------------------------------
% api:使用道具（虚拟的
-spec useItem(ItemID::uint8()) -> no_return().
useItem(ItemID) ->
	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
		#mapsettingCfg{subtype = ?MapSubTypeCrossRace} ->
			core:sendMsgToActivity(?ActivityType_CrossRace, race_item, {playerState:getRoleID(), ItemID});
		_ ->
			skip
	end.

%%%-------------------------------------------------------------------
% callback:收到查询报名情况（仅上线请求回调）
-spec onQueryAck(#recCrossApply{}|0) -> no_return().
onQueryAck(#recCrossApply{
	activityType = ?ActivityType_CrossRace,
	id = ApplyID,
	leader = LeaderID,
	members = Members,
	paramEx = PetID
}) ->
	Msg = #pk_GS2U_RaceApplyInfo_Sync{
		info = #pk_RaceTeamBase{
			applyID = ApplyID,
			leaderID = LeaderID,
			members = Members,
			petID = PetID
		}
	},
	playerMsg:sendNetMsg(Msg);
onQueryAck(_) ->
	skip.

%%%-------------------------------------------------------------------
% callback:有人上了自己的双人坐骑，如果自己已经报名，则需要重新报名
-spec onApply() -> no_return().
onApply() ->
	case playerState2:getCrossApply() of
		#recCrossApply{id = ApplyID} ->
			%% 记录下取消报名的报名组ID，如果收到的第一个取消报名反馈是这个报名组ID，则在符合条件时执行自动报名
			playerState2:setRaceCrossApplyID(ApplyID),
			core:sendMsgToActivityMgrCross(cac_cancel, {?ActivityType_CrossRace, {ApplyID, playerState:getRoleID()}});
		_ ->
			skip
	end.

%%%-------------------------------------------------------------------
% callback:收到报名结果
-spec onApplyAck({ErrorCode::uint(), Apply::#recCrossApply{}}) -> no_return().
% 报名成功
onApplyAck({0, #recCrossApply{
	id = ApplyID,
	leader = LeaderID,
	members = Members,
	paramEx = PetID
} = Apply}) ->
	?DEBUG_OUT("[DebugForRace] onApplyAck"),
	playerState2:setCrossApply(Apply),
	Msg = #pk_GS2U_RaceApply_Ack{
		info = #pk_RaceTeamBase{
			applyID = ApplyID,
			leaderID = LeaderID,
			members = Members,
			petID = PetID
		}
	},
	playerMsg:sendNetMsg(Msg);
% 不在报名时间
onApplyAck({?ErrorCode_Race_Apply_NotTime = ErrorCode, #recCrossApply{}}) ->
	?DEBUG_OUT("[DebugForRace] onApplyAck"),
	playerState2:setCrossApply(0),
	playerMsg:sendErrorCodeMsg(ErrorCode);
% 报名人数已满
onApplyAck({?ErrorCode_Race_Apply_Max = ErrorCode, #recCrossApply{}}) ->
	?DEBUG_OUT("[DebugForRace] onApplyAck"),
	playerState2:setCrossApply(0),
	playerMsg:sendErrorCodeMsg(ErrorCode).

%%%-------------------------------------------------------------------
% callback:收到取消报名结果
-spec onCancelAck(Apply::#recCrossApply{}) -> no_return().
onCancelAck(#recCrossApply{
	id = ApplyID,
	activityType = ?ActivityType_CrossRace,
	applicant = RoleID,
	members = Members
}) ->
	?DEBUG_OUT("[DebugForRace] onCancelAck"),
	Msg = #pk_GS2U_RaceCancel_Ack{
		role = lists:keyfind(RoleID, #pk_CrossRoleBase.id, Members)
	},
	playerMsg:sendNetMsg(Msg),
	%% 如果处于需要自动报名的状态，则执行申请（参考playerRace:onApply/0
	case playerState2:getRaceCrossApplyID() of
		ApplyID ->
			case check_pet({0, []}, playerState:getRoleID()) of
				{{0, []}, {RoleID, _PetID, 0}} ->
					skip;		%% 自己是骑宠主人，但是没有乘客，忽略
				{{0, []}, {RoleID, _PetIDDouble, _GuestRoleID}} ->
					playerRace:apply();	%% 自己是骑宠主人，有乘客，执行报名
				_ ->
					skip		%% 忽略其它情况
			end;
		_ ->
			skip	%% 不需要自动报名
	end,
	playerState2:setRaceCrossApplyID(0);	%% 重置自动报名状态
onCancelAck(_) ->
	?DEBUG_OUT("[DebugForRace] onCancelAck"),
	skip.

%%%-------------------------------------------------------------------
% callback:收到取消报名结果
-spec onNoticeEnter({MapPid::pid(), X::float(), Y::float()}) -> no_return().
onNoticeEnter({MapPid, X, Y} = Data) ->
	case core:isCross() of
		false ->
			%% 未进入跨服，需要先进入跨服
			playerCrossLogic:loginCross({race_enter, Data});
		true ->
			%% 已经在跨服，进入地图
			playerScene:onRequestEnterActivityMap(?CrossRaceMapID, MapPid, erlang:float(X), erlang:float(Y))
	end.

%%%-------------------------------------------------------------------
% callback:收到采集成功消息
-spec gatherSuccess(GatherID::uint32()) -> no_return().
gatherSuccess(GatherID) ->
	case getCfg:getCfgByKey(cfg_object, GatherID) of
		#objectCfg{type = ?GatherType_Race} ->
			core:sendMsgToActivity(?ActivityType_CrossRace, race_gather, {playerState:getRoleID(), GatherID});
		_ ->
			skip
	end.

%%%-------------------------------------------------------------------
% callback:收到下一场活动的模式
-spec onModAck(Mod::uint()) -> no_return().
onModAck(Mod) ->
	playerMsg:sendNetMsg(#pk_GS2U_RaceType_Sync{type = Mod}).

%%%-------------------------------------------------------------------
% callback:需要添加BUFF
-spec onBuff(BuffID::uint16()) -> no_return().
onBuff(BuffID) ->
	#globalsetupCfg{setpara = [BuffID_invincible]} =
		getCfg:getCfgPStack(cfg_globalsetup, race_invincible),
	#buffCfg{buffType = BuffType} =
		getCfg:getCfgPStack(cfg_buff, BuffID),
	ListBuff = playerState:getBuffList(),
	onBuff(BuffID, BuffID_invincible, BuffType, ListBuff).
onBuff(BuffID, BuffID, _BuffType, ListBuff) ->
	onBuffDel(ListBuff), %% 添加了无敌BUFF，需要清除负面BUFF
	playerBuff:addBuff(BuffID, 1);
onBuff(BuffID, BuffID_invincible, ?BuffTypeSub, ListBuff) ->
	case lists:keyfind(BuffID_invincible, #recBuff.buffID, ListBuff) of
		#recBuff{} ->
			skip;	%% 存在无敌BUFF，不能添加负面BUFF
		_ ->
			playerBuff:addBuff(BuffID, 1)
	end;
onBuff(BuffID, _BuffID_invincible, _BuffType, _ListBuff) ->
	playerBuff:addBuff(BuffID, 1).	%% 不过滤正面BUFF
onBuffDel([]) ->
	ok;
onBuffDel([#recBuff{buffID = BuffID} | T]) ->
	case getCfg:getCfgPStack(cfg_buff, BuffID) of
		#buffCfg{buffType = ?BuffTypeSub} ->
			playerBuff:delBuff(BuffID);
		_ ->
			skip
	end,
	onBuffDel(T).

%%%-------------------------------------------------------------------
% callback:尝试上马
-spec onTryMount({IsLeader::boolean(), PetID::uint16(), ListRoleID::[uint64(), ...], ExData::term()}) -> no_return().
% 活动进程或乘客角色进程通知主人上马
% 主人直接上马，成功上马后通知乘客
onTryMount({true, PetID, ListRoleID, _ExData}) ->
	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
		#mapsettingCfg{subtype = ?MapSubTypeCrossRace} ->
			%% 确认目标骑宠处于出战状态
			ListCallPet = playerState:getCallPet(),
			case lists:keyfind(?CallPetTypeRMB, #recCallPet.pet_type, ListCallPet) of
				false ->
					%% 未召唤骑宠，则召唤骑宠
					playerPet:callPet(PetID);
				#recCallPet{pet_id = PetID} ->
					%% 已召唤骑宠，且就是匹配的骑宠，忽略
					skip;
				#recCallPet{} ->
					%% 已召唤骑宠，但不是匹配的骑宠，切换
					playerPet:petSwitch(PetID)
			end,
			%% 确认处于骑乘状态
			case playerState:getPetMounts() of
				{_, ?PetOnMount} ->
					%% 已是骑乘状态，忽略
					skip;
				_ ->
					%% 不是骑乘状态，骑乘
					playerPet:petOnMount()
			end,
			%% 如果是双人坐骑则需要通知乘客上马
			case erlang:length(ListRoleID) of
				2 ->
					[MasterRoleID | [GuestRoleID]] = ListRoleID,
					case core:queryOnLineRoleByRoleID(GuestRoleID) of
						#rec_OnlinePlayer{pid = Pid} ->
							SelfCode = playerState:getPlayerCode(),
							PetCode = playerPet:getPetBattleCode(),
							ExData = {PetID, PetCode, SelfCode, MasterRoleID},
							psMgr:sendMsg2PS(Pid, race_tryMount, {false, PetID, ListRoleID, ExData});
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end;
% 活动进程通知乘客上马
% 乘客不知道有没有马可以上，所以先通知主人上马
onTryMount({false, PetID, [MasterRoleID, _GuestRoleID] = ListRoleID, true}) ->
	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
		#mapsettingCfg{subtype = ?MapSubTypeCrossRace} ->
			case core:queryOnLineRoleByRoleID(MasterRoleID) of
				#rec_OnlinePlayer{pid = Pid} ->
					psMgr:sendMsg2PS(Pid, race_tryMount, {true, PetID, ListRoleID, false});
				_ ->
					skip
			end;
		_ ->
			skip
	end;
% 主人通知乘客上马
% 乘客二话不说就上了马
onTryMount({false, _PetID, [MasterRoleID, _GuestRoleID], ExData}) ->
	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
		#mapsettingCfg{subtype = ?MapSubTypeCrossRace} ->
			case core:queryOnLineRoleByRoleID(MasterRoleID) of
				#rec_OnlinePlayer{pid = Pid} ->
					playerPetDouble:beInviteOtherDoubleMountGo(Pid, ExData);
				_ ->
					skip
			end;
		_ ->
			skip
	end.

%%%-------------------------------------------------------------------
% callback:准备倒计时结束后被通知如果没有骑乘则需要放弃比赛
-spec onTryGiveUp() -> no_return().
onTryGiveUp() ->
	case check_pet({0, []}, playerState:getRoleID()) of
		{{0, []}, _} ->
			skip;	%% 正常，不需要放弃比赛
		_ ->
			onGiveUp()
	end.

%%%-------------------------------------------------------------------
% callback:下马时弃赛
-spec onGiveUp() -> no_return().
onGiveUp() ->
	case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
		#mapsettingCfg{subtype = ?MapSubTypeCrossRace} ->
			core:sendMsgToActivity(?ActivityType_CrossRace, race_giveUp, {playerState:getRoleID(), ?GiveUpReason_Dismount});
		_ ->
			skip
	end.

%%%-------------------------------------------------------------------
% internal:检查所在地图
-spec check_map({ErrorCodeIn, ErrorArgsIn}) -> {ErrorCodeOut, ErrorArgsOut} when
	ErrorCodeIn :: uint(),
	ErrorArgsIn :: list(),
	ErrorCodeOut :: uint(),
	ErrorArgsOut :: list().
check_map({ErrorCodeIn, _} = In) when ErrorCodeIn > 0 ->
	In;
check_map(_In) ->
	case playerState:getGroupID() of
		0 ->
			#globalsetupCfg{setpara = L} =
				getCfg:getCfgByKey(cfg_globalsetup, race_apply_map),
			case lists:member(playerState:getMapID(), L) of
				true ->
					{0, []};
				_ ->
					FunName =
						fun(MapID, Names) ->
							case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
								#mapsettingCfg{show_name = Name} ->
									"[" ++ Name ++ "]" ++ Names;
								_ ->
									Names
							end
						end,
					MapNames = lists:foldl(FunName, [], L),
					?ERROR_CODE(?ErrorCode_Race_Apply_InvalidMap, [MapNames]),
					{?ErrorCode_Race_Apply_InvalidMap, [MapNames]}
			end;
		_ ->
			?ERROR_CODE(?ErrorCode_Race_Apply_FromGroup, []),
			{?ErrorCode_Race_Apply_FromGroup, []}
	end.

%%%-------------------------------------------------------------------
% internal:检查角色等级
-spec check_level({ErrorCodeIn, ErrorArgsIn}, RoleID, UseErrorCode) -> {ErrorCodeOut, ErrorArgsOut} when
	ErrorCodeIn :: uint(),
	ErrorArgsIn :: list(),
	RoleID :: uint64(),
	UseErrorCode :: ?ErrorCode_YourLevelIsTooLower | ?ErrorCode_Race_Apply_PartnerLevelTooLow,
	ErrorCodeOut :: uint(),
	ErrorArgsOut :: list().
check_level({ErrorCodeIn, _} = In, _RoleID, _UseErrorCode) when ErrorCodeIn > 0 ->
	In;
check_level(_In, 0, _UseErrorCode) ->
	{0, []};	%% 目标不需要被检查
check_level(_In, RoleID, UseErrorCode) ->
	case getCfg:getCfgPStack(cfg_activity, ?ActivityType_CrossRace) of
		#activityCfg{mapidlist = [MapID|_]} ->
			#?RoleKeyRec{level = RoleLevel} =
				core:queryRoleKeyInfoByRoleID(RoleID),
			case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
				#mapsettingCfg{playerEnter_MinLevel = Min} when
					RoleLevel >= Min ->
					{0, []};
				_ ->
					?ERROR_CODE(UseErrorCode),
					{UseErrorCode, []}
			end;
		_T ->
			?ERROR_OUT("invalid cfg_activity.id=~w~n~p", [?ActivityType_CrossRace, _T]),
			?ERROR_CODE(UseErrorCode),
			{UseErrorCode, []}
	end.

%%%-------------------------------------------------------------------
% internal:检查角色骑乘状态
-spec check_pet({ErrorCodeIn, ErrorArgsIn}, RoleID) -> {{ErrorCodeOut, ErrorArgsOut}, {MasterRoleID, PetID, GuestRoleID}} when
	ErrorCodeIn :: uint(),
	ErrorArgsIn :: list(),
	RoleID :: uint64(),
	ErrorCodeOut :: uint(),
	ErrorArgsOut :: list(),
	MasterRoleID :: uint64(),
	PetID :: uint16(),
	GuestRoleID :: uint64().
check_pet({ErrorCodeIn, _} = In, _RoleID) when ErrorCodeIn > 0 ->
	In;
check_pet(_In, RoleID) ->
	case playerPetDouble:getDoubleMount() of
		#recDoublePetMount{petID = 0} ->
			%% 不在双人骑宠状态
			case playerState:getPetMounts() of
				{PetIDSingle, ?PetOnMount} ->
					{{0, []}, {RoleID, PetIDSingle, 0}};
				_ ->
					?ERROR_CODE(?ErrorCode_Race_Apply_NeedPet),
					{{?ErrorCode_Race_Apply_NeedPet, []}, {0, 0, 0}}
			end;
		#recDoublePetMount{petID = PetIDDouble, ownerRoleID = RoleID, guestRoleID = GuestRoleID} ->
			%% 双人骑宠状态，当前角色是主人
			{{0, []}, {RoleID, PetIDDouble, GuestRoleID}};
		#recDoublePetMount{petID = PetIDDouble, ownerRoleID = MasterRoleID, guestRoleID = RoleID} ->
			%% 双人骑宠状态，当前角色是乘客
			{{0, []}, {MasterRoleID, PetIDDouble, RoleID}};
		_T ->
			%% 不是主人也不是乘客居然还在双人骑宠上，你是马鞍吗？
			?ERROR_OUT("check_pet invalid doublepet:~w RoleID:~w~n~p", [_T, RoleID, misc:getStackTrace()]),
			?ERROR_CODE(?ErrorCode_Race_Apply_NeedPet),
			{{?ErrorCode_Race_Apply_NeedPet, []}, {0, 0, 0}}
	end.
