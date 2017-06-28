%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 09. 六月 2017 15:20
%%%-------------------------------------------------------------------
-module(playerDance).
-author(tiancheng).

-include("playerPrivate.hrl").

-define(DanceMapID, 2).	% 阿克勒港口

-define(DanceArea_In, 1).
-define(DanceArea_Out, 2).

-define(DanceLevel, 25).

-define(DanceStateIng, 1).
-define(DanceStateBreak, 0).

%% API
-export([
	applyDance/1,
	danceArea/1,
	selectDanceID/1,
	breakDance/0,
	breakDance/1,
	dance_tick_addExp/1,
	selectDanceIDAck/1
]).

-export([
	leaveDanceMap/0
]).

applyDance(Type) ->
	case isPlayerLevelCondition() of
		true ->
			IsIn =
				case isInMainCity() of
					true ->
						Type =:= ?DanceArea_In;
					_ ->
						false
				end,

			core:sendMsgToActivity(?ActivityType_Dance, applyDance,
				{playerState:getRoleID(), self(), playerState:getNetPid(), IsIn});
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_ApplyDanceFailedPlayerLevel)
	end,
	ok.

leaveDanceMap() ->
	case isPlayerLevelCondition() of
		true ->
			playerPropSync:setInt(?SerProp_DanceState, ?DanceStateBreak),

			%% 切换场景
			core:sendMsgToActivity(?ActivityType_Dance, leaveDanceMap, playerState:getRoleID());
		_ ->
			skip
	end.

danceArea(Type) ->
	case isPlayerLevelCondition() of
		true ->
			IsIn =
				case isInMainCity() of
					true ->
						Type =:= ?DanceArea_In;
					_ ->
						false
				end,

			core:sendMsgToActivity(?ActivityType_Dance, inDanceArea,
				{playerState:getRoleID(), self(), playerState:getNetPid(), IsIn});
		_ ->
			skip
	end,
	ok.

selectDanceID(DanceID) ->
	case isPlayerLevelCondition() of
		true ->
			core:sendMsgToActivity(?ActivityType_Dance, selectDanceID,
				{playerState:getRoleID(), self(), playerState:getNetPid(), DanceID});
		_ ->
			skip
	end,
	ok.

selectDanceIDAck({RoleID, Correct}) ->
	case playerState:getRoleID() of
		RoleID ->
			case Correct of
				true ->
					playerPropSync:setInt(?SerProp_DanceState, ?DanceStateIng),
					ok;
				false ->
					playerPropSync:setInt(?SerProp_DanceState, ?DanceStateBreak),
					case getCfg:getCfgPStack(cfg_globalsetup, square_dancing_3) of
						#globalsetupCfg{setpara = []} ->
							skip;
						#globalsetupCfg{setpara = [BuffID]} ->
							playerBuff:addBuff(BuffID, 1);
						_ ->
							0
					end
			end;
		RID ->
			?ERROR_OUT("selectDanceIDError:self=~p,target=~p", [RID, RoleID])
	end,
	ok.

breakDance() ->
	case playerPropSync:getProp(?SerProp_DanceState) of
		?DanceStateIng ->
			playerPropSync:setInt(?SerProp_DanceState, ?DanceStateBreak),

			core:sendMsgToActivity(?ActivityType_Dance, breakDance,
				{playerState:getRoleID(), self()});
		_ ->
			skip
	end,
	ok.

dance_tick_addExp({RoleID, Correct}) ->
	case playerState:getRoleID() of
		RoleID -> dance_tick_addExp2({RoleID, Correct});
		RID ->
			?ERROR_OUT("dance_tick_addExp self=~p, role=~p, correct=~p", [RID, RoleID, Correct])
	end.
dance_tick_addExp2({_RoleID, true}) ->
	case getCfg:getCfgPStack(cfg_globalsetup, square_dancing_1) of
		#globalsetupCfg{setpara = [AddExp]} ->
			playerBase:addExp(AddExp, ?ExpSourceDanceIng, 1);
		_ ->
			skip
	end,
	ok;
dance_tick_addExp2({_RoleID, false}) ->
	case getCfg:getCfgPStack(cfg_globalsetup, square_dancing_4) of
		#globalsetupCfg{setpara = [AddExp]} ->
			playerBase:addExp(AddExp, ?ExpSourceDanceIng, 0);
		_ ->
			skip
	end,
	ok.

%% 打断跳舞动作
-spec breakDance(RoleID::uint64()) -> ok.
breakDance(RoleID) ->
	Msg = #pk_GS2U_BreakDance{roleID = RoleID},
	playerMsg:sendMsgToNearPlayer(Msg, true),
	ok.

isPlayerLevelCondition() ->
	playerState:getLevel() >= ?DanceLevel.

isInMainCity() -> isInMainCity(playerState:getMapID()).
isInMainCity(?DanceMapID) -> true;
isInMainCity(_) -> false.