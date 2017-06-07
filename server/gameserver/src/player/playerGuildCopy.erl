%%%-------------------------------------------------------------------
%%% @author chengxs
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%% 军团副本
%%% @end
%%% Created : 28. 二月 2015 10:31
%%%-------------------------------------------------------------------


-module(playerGuildCopy).
-author(chengxs).
-include("gsInc.hrl").
-include("playerPrivate.hrl").
%%军团副本队伍时间
-define(GuildCopyTeamTime, 3600).
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	sendLastOverTime/0,
	activeGuildCopy/1,
	activeGuildCopyAck/1,
	enterGuildCopy/1,
	synsOpenStateToOnlineMember/2,
	onSynsOpenState/2,
	onCopyMapOver/1,
	checkGuildCopyTeam/0,
	getGuildCopyMapOwnerID/0
]).
checkGuildCopyTeam() ->
	%% 先检查下军团副本队伍是否到期
	skip.

%% 发送军团副本时间
sendLastOverTime() ->
	%%?DEBUG_OUT("sendLastOverTime: ~p", [playerState:getSelfGuildInfo()]),
	case playerState:getSelfGuildInfo() of
		#rec_guild{guildID = GuilID, lastGuildCopyOverTime = Time} ->
			MaxOverTime =
				case myEts:lookUpEts(recGuildMemory, GuilID) of
					[#recGuildMemory{guildCopyMaxOverTime = MT}] -> MT;
					_ -> 0
				end,
			?DEBUG_OUT("lastGuildCopyOverTime = ~p， guildCopyMaxOverTime = ~p", [Time, MaxOverTime]),
			OpenTime = case Time =:= 0 of
						   true ->
							   0;
						   _ ->
							   Time+?GuildCopyCD
					   end,

			?DEBUG_OUT("OpenTime = ~p", [OpenTime]),

			playerMsg:sendNetMsg(#pk_GS2U_SendGuildCopyOpenTime{time = OpenTime}),

			case MaxOverTime > 0 of
				true ->
					playerMsg:sendNetMsg(#pk_GS2U_IsGuildCopyOpen{flag = true, time = MaxOverTime});
				_ ->
					playerMsg:sendNetMsg(#pk_GS2U_IsGuildCopyOpen{flag = false, time = 0})
			end;
		_ ->
			%% 还木有军团
			skip
	end.

%% 激活军团副本
activeGuildCopy(MapID) ->
	case judgeActiveCopy(MapID) of
		{ok, _} ->
			core:sendMsgToMapMgr(MapID, leaderCreateGuildCopyMap, {MapID, playerState:getRoleID(), playerState:getGuildID()}),
			ok;
		{false, Code} ->
			%%激活军团副本失败
			playerMsg:sendErrorCodeMsg(Code)
	end,
	ok.

activeGuildCopyAck({MapID, MaxOverTime, Code})->

	playerMsg:sendErrorCodeMsg(Code),
	case Code of
		?ErrorCode_GuildCopy_Open ->
			%%进入副本
			playerCopyMap:enterCopyMap(MapID),

			%%激活军团副本成功
			playerMsg:sendNetMsg(#pk_ActiveGuildCopy{mapID = MapID}),

			%%保存副本最大存在的时间点
			GuildID = playerState:getGuildID(),
			psMgr:sendMsg2PS(?PsNameGuild, updateLastGuildCopyOverTime, {GuildID, 0, MaxOverTime}),

			%%给所有在线成员同步这一消息
			synsOpenStateToOnlineMember(true, MaxOverTime),

			%%系统通知
			Content = stringCfg:getString(cnTextGuildCopyBegin),
			playerGuild:guildChatNotice(Content);
		_ ->
			skip
	end,
	ok.

%% 进入军团副本
enterGuildCopy(MapID) ->
	case judgeEnterCopy(MapID) of
		{ok, _} ->
			%% 找出进军团副本的系统队伍ID（leader只可能是军团长和副军团长，且只有一个）
			playerCopyMap:enterCopyMap(MapID);
		{false, Code} ->
			%%进入军团副本失败
			playerMsg:sendErrorCodeMsg(Code)
	end,
	ok.

%% 给所有在线成员同步副本开启状态和副本最晚结束时间
-spec synsOpenStateToOnlineMember(State::boolean(), MaxOverTime::uint64()) -> ok.
synsOpenStateToOnlineMember(Flag, MaxOverTime) ->
	List = playerGuild:getOnlineMemberPid(),
	?DEBUG_OUT("synsOpenStateToOnlineMember List = ~p", [List]),
	[psMgr:sendMsg2PS(Pid, synsOpenState, {Flag, MaxOverTime}) || Pid <- List],
	ok.

%% 军团副本结束结算
-spec onCopyMapOver(OverTime::int64()) -> ok.
onCopyMapOver(OverTime) ->
	?DEBUG_OUT("onCopyMapOver Time ~p", [OverTime+?GuildCopyCD]),
	playerMsg:sendNetMsg(#pk_GS2U_SendGuildCopyOpenTime{time = OverTime+?GuildCopyCD}),
	synsOpenStateToOnlineMember(false, 0),
	ok.

%% 军团副本开启或者关闭了
-spec onSynsOpenState(Flag::boolean(), MaxOverTime::uint64()) -> ok.
onSynsOpenState(Flag, MaxOverTime) ->
	%% 通知客户端
	?DEBUG_OUT("Flag = ~p, MaxOverTime = ~p",[Flag, MaxOverTime]),
	playerMsg:sendNetMsg(#pk_GS2U_IsGuildCopyOpen{flag = Flag, time = MaxOverTime}),
	case Flag of
		true ->
			%% 军团副本开启啦，快去战斗吧，少年！
			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildCopy_Open);
		_ ->
			%% 军团副本已经关闭了
			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildCopy_Close)
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================
%% 判断是否能激活军团副本
-spec judgeActiveCopy(MapID :: uint()) -> {boolean(), uint()}.
judgeActiveCopy(MapID) ->
	#mapsettingCfg{type = MapType, subtype = SubType} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
	IsOpen = playerState:getGuildCopyOpenState(),
	GuildLevel = playerGuild:getGuildSelfLevel(),
	NowTime = time:getSyncTime1970FromDBS(),
	Time = case playerState:getSelfGuildInfo() of
			   #rec_guild{lastGuildCopyOverTime = LTime} ->
				   LTime;
			   _ ->
				   -1
		   end,
	if
		MapType =/= ?MapTypeCopyMap orelse SubType =/= ?MapSubTypeGuild ->
			{false,?ErrorCode_GuildCopy_Active_Failed};

		IsOpen ->
			{false, ?ErrorCode_GuildCopy_Already_Active};

		GuildLevel < ?GuildMemLevel_ViceLeader ->
			{false, ?ErrorCode_GuildCopy_GuildLevel_limited};

		Time =:= -1 ->
			{false,?ErrorCode_GuildCopy_Active_Failed};

		Time + ?GuildCopyCD > NowTime ->
			{false, ?ErrorCode_GuildCopy_CD};

		true ->
			{ok, 0}
	end.


%% 判断是否能进入军团副本
-spec judgeEnterCopy(MapID :: uint()) -> {boolean(), uint()}.
judgeEnterCopy(MapID) ->
	#mapsettingCfg{type = MapType, subtype = SubType} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
	IsOpen = playerState:getGuildCopyOpenState(),
	GuildLevel = playerGuild:getGuildSelfLevel(),
	if
		MapType =/= ?MapTypeCopyMap orelse SubType =/= ?MapSubTypeGuild ->
			{false,?ErrorCode_GuildCopy_Enter_Failed};

		IsOpen =:= false ->
			{false, ?ErrorCode_GuildCopy_Not_Open};


		GuildLevel < ?GuildMemLevel_Normal ->
			{false, ?ErrorCode_GuildCopy_Enter_Failed};
		true ->
			{ok, 0}
	end.



getGuildCopyMapOwnerID() ->
	GuildID = playerState:getGuildID(),
	case myEts:lookUpEts(recGuildMemory, GuildID) of
		[#recGuildMemory{ ownerID = OwnerID }] ->
			OwnerID;
		_ ->
			0
	end.
