%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%% 玩家接口
%%% 约会地下城（活动）
%%% @end
%%% Created : 20161202
%%%-------------------------------------------------------------------

-module(playerDate).
-include("playerPrivate.hrl").
-include("../activity/gameactivity/date/acDatePrivate.hrl").

%% 进入活动接口
-export([
	enterTry/2,
	enterTryAck/1,
	enterTryAsk/2,
	enterTryReply/1
]).

%% 消除玩法接口
-export([
	link/2,
	link/4,
	touchBox/4,
	link_addBuff/1,
	link_reshuffle/1,
	link_giveup/1,
	link_resetPos/1,
	link_buff/1,
	poolShooting/1
]).

%%% ====================================================================
%%% API functions 进入活动接口
%%% ====================================================================

%% 尝试进入
-spec enterTry(DateActiveID::type_daid(), IsGM::boolean()) -> ok.
enterTry(DateActiveID, IsGM) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForDate] enterTry DateActiveID(~p) at RoleID(~p)", [DateActiveID, RoleID]),
	case checkMyMap() of
		ok ->
			core:sendMsgToActivity(?ActivityType_Date, date_enterTry, {RoleID, DateActiveID, IsGM});
		ErrorCode ->
			error_code(ErrorCode)
	end,
	ok.

%% 尝试进入反馈
-spec enterTryAck(Msg::type_daid()|{uint(), pid(), type_daid(), uint64()}) -> ok.
%% 地图已存在，可以直接进入
enterTryAck({MapID, MapPid, _DateActiveID, _AnotherRoleID}) ->
	%?DEBUG_OUT("[DebugForDate] enterTryAck MapID(~p) MapPid(~p) DateActiveID(~p) AnotherRoleID(~p) at RoleID(~p)", [MapID, MapPid, _DateActiveID, _AnotherRoleID, playerState:getRoleID()]),
	case checkMyMap(MapID) of
		skip ->
			skip;
		ok ->
			%% 隐藏当前出战宠物（收回）
			case playerPet:getPetBattle() of
				false ->
					skip;
				_ ->
					playerPet:petHide()
			end,
			playerScene:onRequestEnterActivityMap(MapID, MapPid);
		ErrorCode ->
			error_code(ErrorCode)
	end,
	ok;
%% 地图不存在，需要创建
enterTryAck(DateActiveID) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForDate] enterTryAck DateActiveID(~p) at RoleID(~p)", [DateActiveID, RoleID]),
	%% 1.检查玩法是否开放
	case acDateState:checkActiveOpenTime(DateActiveID) of
		false ->
			error_code(?ErrorCode_Date_Active_NotTime);
		_ ->
			%% 2.必须是队长才能进行操作
			TeamMemberList = teamInterface:getTeamMemberInfoListWithRoleID(RoleID), %%playerTeam2:getTeamAllMemberInfoList(?PlayerTeamTypeNormal),
			case  teamInterface:isTeamLeader(RoleID) of
				false ->
					error_code(?ErrorCode_Date_Team_MemberNeedLeader);
				_ ->
					%% 3.必须以2人组队的形式进入
					case erlang:length(TeamMemberList) =:= 2 of
						false ->
							error_code(?ErrorCode_Date_Team_MemberCountNeed2);
						_ ->
							%% 4.队友必须与自己是好友关系
							FunIsFriend =
								fun(#recTeamMemberInfo{roleID = RoleID_}, {IsFriend, TargetRoleID}) ->
									case RoleID_ of
										RoleID ->
											{IsFriend, TargetRoleID};
										_ ->
											Friend2DataMine = friend2State:queryFriend2Data(RoleID),
											case friend2State:queryRelation(Friend2DataMine, RoleID_) of
												#rec_friend2_relation{relation = 2} -> %% ?RELATION_FORMAL =:= 2
													{true, RoleID_};
												_ ->
													{IsFriend, TargetRoleID}
											end
									end
								end,
							case misc:foldlEx(FunIsFriend, {false, 0}, TeamMemberList) of
								{false, _} ->
									error_code(?ErrorCode_Date_Team_MemberNeedFriend);
								%% 5.检查自己的地图位置是否正确
								{_, TargetRoleID} ->
									case checkMyMap() of
										ok ->
											%% 6.检查自身等级与每日次数限制
											DailyType = acDateState:getDailyTypeWithActiveID(DateActiveID),
											DailyCount = playerDaily:getDailyCounter(DailyType, 0),
											case acDateState:checkLevelAndDailyCounter(DateActiveID, playerState:getLevel(), DailyCount) of
												ok ->
													%% 7.检查队员是否在线
													case core:queryOnLineRoleByRoleID(TargetRoleID) of
														#rec_OnlinePlayer{pid = Pid} ->
															%% 询问队员状态
															psMgr:sendMsg2PS(Pid, date_enterTryAsk, {RoleID, DateActiveID});
														_ ->
															error_code(?ErrorCode_Date_Team_NeedOnline)
													end;
												ErrorCodeLevelOrDailyCount ->
													error_code(ErrorCodeLevelOrDailyCount)
											end;
										ErrorCodeMap ->
											error_code(ErrorCodeMap)
									end
							end
					end
			end
	end,
	ok.

%% 收到其它玩家进程的询问
-spec enterTryAsk(Pid::pid(), {FromRoleID::uint64(), DateActiveID::type_daid()}) -> ok.
enterTryAsk(Pid, {_FromRoleID, DateActiveID}) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForDate] enterTryAsk DateActiveID(~p) at RoleID(~p) _FromRoleID(~p)", [DateActiveID, RoleID, _FromRoleID]),
	{ErrorCode,DailyCount} =
		%% 1.检查自己的地图位置是否正确
		case checkMyMap() of
			?ErrorCode_Date_Map_NotGroup ->
				{?ErrorCode_Date_Team_Map_NotGroup,0};
			?ErrorCode_Date_Map_NeedNormal ->
				{?ErrorCode_Date_Team_Map_NeedNormal,0};
			ok ->
				%% 2.检查自身等级与每日次数限制
				DailyType = acDateState:getDailyTypeWithActiveID(DateActiveID),
				case acDateState:checkLevelAndDailyCounter(DateActiveID, playerState:getLevel(),0) of
					ok ->
						%% 此处增加队员的每日计数
						playerDaily:incDailyCounter(DailyType, 0),
						Count = playerDaily:getDailyCounter(DailyType, 0),
						{0 ,Count};
					ErrorCodeLevelOrDailyCount ->
						{ErrorCodeLevelOrDailyCount,0}
				end
		end,

	psMgr:sendMsg2PS(Pid, date_enterTryReply, {RoleID, DateActiveID, ErrorCode,DailyCount}),
	ok.

%% 收到询问的反馈
-spec enterTryReply({FromRoleID::uint64(), DateActiveID::type_daid(), ErrorCode::uint(), OhterDailyCount::uint()}) -> ok.
enterTryReply({FromRoleID, DateActiveID, ErrorCode,OhterDailyCount}) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForDate] enterTryReply DateActiveID(~p) at RoleID(~p) FromRoleID(~p) ErrorCode(~p)", [DateActiveID, RoleID, FromRoleID, ErrorCode]),
	case ErrorCode of
		0 ->
			%% 验证通过，向公共进程请求创建活动地图
			%% 此处增加队长的每日计数
			DailyType = acDateState:getDailyTypeWithActiveID(DateActiveID),
			playerDaily:incDailyCounter(DailyType, 0),
			DailyCount = playerDaily:getDailyCounter(DailyType, 0),
			core:sendMsgToActivity(?ActivityType_Date, date_enterCreate, {DateActiveID, RoleID, FromRoleID,DailyCount,OhterDailyCount});
		_ ->
			%% 队友验证未通过
			error_code(ErrorCode)
	end,
	ok.

%%% ====================================================================
%%% API functions 消除玩法接口
%%% ====================================================================

%% 不带坐标信息，没有位置，便于GM指令调用
-spec link(IsSelect::boolean(), GMMod::0|1|2) -> ok.
link(IsSelect, GMMod) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForDate] link at RoleID(~p) IsSelect(~p) GMMod(~p)", [RoleID, IsSelect, GMMod]),
	%% 不在目标地图时忽略该消息
	MapID = playerState:getMapID(),
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeDate} ->
			core:sendMsgToActivity(?ActivityType_Date, date_link_link, {RoleID, {IsSelect, GMMod}});
		#mapsettingCfg{} = _Cfg ->
			%?DEBUG_OUT("[DebugForDate] link ~p", [_Cfg]),
			skip;
		_ ->
			?ERROR_OUT("can not find MapID(~p) from cfg_mapsetting", [MapID])
	end,
	ok.

%% 带坐标信息，便于客户端传坐标以在误差范围内允许操作
-spec link(Pos::uint8(), PosXY::{float(), float()}, IsSelect::boolean(), GMMod::0|1|2) -> ok.
link(Pos, PosXY, IsSelect, GMMod) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForDate] link at RoleID(~p) Pos(~p) IsSelect(~p) GMMod(~p)", [RoleID, Pos, IsSelect, GMMod]),
	case isInMap(?ActivityType_Date) of
		true ->
			core:sendMsgToActivity(?ActivityType_Date, date_link_link, {RoleID, {Pos, PosXY, IsSelect, GMMod}});
		_ ->
			skip
	end,
	ok.

%% 碰撞到箱子
-spec touchBox(Code::uint64(), PosXY::{float(), float()},IsDelete::boolean(), GMMod::0|1|2) -> ok.
touchBox(Code, PosXY,  IsDelete,GMMod) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForDate] link at RoleID(~p) Pos(~p) IsSelect(~p) GMMod(~p)", [RoleID, Pos, IsSelect, GMMod]),
	case isInMap(?ActivityType_Date) of
		true ->
			core:sendMsgToActivity(?ActivityType_Date, date_touch_box, {RoleID, {Code, PosXY,IsDelete, GMMod}});
		_ ->
			skip
	end,
	ok.


%% 碰撞到箱子
-spec poolShooting( GMMod::0|1|2) -> ok.
poolShooting(GMMod) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForDate] link at RoleID(~p) Pos(~p) IsSelect(~p) GMMod(~p)", [RoleID, Pos, IsSelect, GMMod]),
	case isInMap(?ActivityType_Date) of
		true ->
			core:sendMsgToActivity(?ActivityType_Date, date_pool_shooting, {RoleID, { GMMod}});
		_ ->
			skip
	end,
	ok.



%% 活动进程通知添加BUFF
-spec link_addBuff(BuffID::uint()) -> ok.
link_addBuff(BuffID) ->
	%?DEBUG_OUT("[DebugForDate] link_addBuff at RoleID(~p) BuffID(~p)", [playerState:getRoleID(), BuffID]),
	playerBuff:addBuff(BuffID, playerState:getLevel()),
	ok.

%% 活动进程通知重置坐标
-spec link_resetPos({X::float(), Y::float()}) -> ok.
link_resetPos({X, Y}) ->
	%?DEBUG_OUT("[DebugForDate] link_resetPos at RoleID(~p) Pos(~p) ~p", [playerState:getRoleID(), {X, Y}, self()]),
	TX = X * 1.0,
	TY = Y * 1.0,
	{SX, SY} = playerState:getPos(),
	case SX =/= TX orelse SY =/= TY of
		true ->
			MapID = playerState:getMapID(),
			playerMap:onLaterTransferPosAck(MapID, TX, TY);
		_ ->
			skip
	end,
	ok.

%% 手动重置宝石阵
-spec link_reshuffle(IsGM::boolean()) -> ok.
link_reshuffle(IsGM) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForDate] link_reshuffle at RoleID(~p) IsGM(~p)", [RoleID, IsGM]),
	case isInMap(?ActivityType_Date) of
		true ->
			core:sendMsgToActivity(?ActivityType_Date, date_link_reshuffle, {RoleID, IsGM});
		_ ->
			skip
	end,
	ok.

%% 放弃游戏，tue直接进入结算状态，false直接销毁地图
-spec link_giveup(IsSettle::boolean()) -> ok.
link_giveup(IsSettle) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForDate] link_giveup at RoleID(~p) IsSettle(~p)", [RoleID, IsSettle]),
	case isInMap(?ActivityType_Date) of
		true ->
			core:sendMsgToActivity(?ActivityType_Date, date_link_end, {RoleID, IsSettle});
		_ ->
			skip
	end,
	ok.

%% 直接产生正面状态
-spec link_buff(BuffType::term()) -> ok.
link_buff(BuffType) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForDate] link_buff at RoleID(~p) BuffType(~p)", [RoleID, BuffType]),
	case isInMap(?ActivityType_Date) of
		true ->
			core:sendMsgToActivity(?ActivityType_Date, date_link_buff, {RoleID, BuffType});
		_ ->
			skip
	end,
	ok.

%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%% 为了打印调试日志
-spec error_code(ErrorCode::uint()) -> ok.
error_code(ErrorCode) ->
	%?DEBUG_OUT("[DebugForDate] error_code at RoleID(~p) ErrorCode(~p)", [playerState:getRoleID(), ErrorCode]),
	playerMsg:sendErrorCodeMsg(ErrorCode).
%-spec error_code(ErrorCode::uint(), Param::list()) -> ok.
%error_code(ErrorCode, Param) ->
%	%?DEBUG_OUT("[DebugForDate] error_code at RoleID(~p) ErrorCode(~p) Param(~p)", [playerState:getRoleID(), ErrorCode, Param]),
%	playerMsg:sendErrorCodeMsg(ErrorCode, Param).

%% 检查自己所在地图是否能进入指定活动地图
-spec checkMyMap() -> ErrorCode::uint() | ok | skip.
checkMyMap() ->
	checkMyMap({}).  % 此处为{}表示尚未指定需要进入的MapID，跳过checkMyMap/1中的第0项检查
-spec checkMyMap(MapID::uint()) -> uint() | ok | skip.
checkMyMap(MapID) ->
	case playerState:getMapID() of
		MapID ->
			skip; %% 0.不能原地跳跃
		MapIDNow ->
			case playerState:getGroupID() =/= 0 of
				true ->
					?ErrorCode_Date_Map_NotGroup; %% 1.不能从位面进入
				_ ->
					case getCfg:getCfgByArgs(cfg_mapsetting, MapIDNow) of
						#mapsettingCfg{type = ?MapTypeNormal, subtype = ?MapSubTypeNormal} ->
							ok;
						_ ->
							?ErrorCode_Date_Map_NeedNormal %% 2.不能从非普通地图进入
					end
			end
	end.

%% 玩法对应的地图子类型
-spec getSubMapTypeByActiveID(DateActiveID::type_daid()) -> boolean().
getSubMapTypeByActiveID(?ActivityType_Date) -> ?MapSubTypeDate.


%% 是否处于目标玩法地图，用于过滤一些无效操作
-spec isInMap(DateActiveID::type_daid()) -> boolean().
isInMap(DateActiveID) ->
	MapID = playerState:getMapID(),
	MapSubType = getSubMapTypeByActiveID(DateActiveID),
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeActivity, subtype = MapSubType} ->
			true;
		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeDatebox} ->
			true;
		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeDatePoolParty} ->
			true;
		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeDateFindTreasure} ->
			true;
		#mapsettingCfg{} ->
			false;
		_ ->
			?ERROR_OUT("can not find MapID(~p) from cfg_mapsetting", [MapID]),
			false
	end.

