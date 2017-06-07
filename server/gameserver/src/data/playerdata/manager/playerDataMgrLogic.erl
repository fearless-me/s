%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%% 玩家数据管理类逻辑
%%% @end
%%% Created : 22. 九月 2016 14:46
%%%-------------------------------------------------------------------
-module(playerDataMgrLogic).
-author("tiancheng").

-include("gsInc.hrl").
-include("gamedataLog.hrl").

%% API
-export([
	init/0,
	alreadyConnectDBServer/0,
	tickSavePlayerData/1,
	offlineSavePlayerData/1,
	saveOtherPlayerData/1,
	changeRoleOwner/1
]).

init() -> ok.

alreadyConnectDBServer() ->
	?LOG_OUT("alreadyConnectDBServer"),
%%    case core:isCross() of
%%        false ->
	playerDataMgrLoad:loadData(),
%%        _ ->
%%	        skip
%%    end,
	ok.

%% 定时保存玩家重要数据
tickSavePlayerData({AccountID, RoleID}) ->
	Ret =
		case ets:lookup(ets_rec_playerdata, RoleID) of
			[
				#rec_playerdata{
					rec_player_prop = Props,
					rec_task_accepted = Accepts,
					rec_task_submitted = Submitted
				} = Data
			] ->
				%% 检查有哪些改变，没改变的不存
				case playerDataMgrState:queryPlayerDataTempDict(RoleID) of
					[#rec_playerdata{} = Data] ->
						%% 与上次保存的数据完全一样，不再保存
						skip;
					[#rec_playerdata{
						rec_player_prop = Props2,
						rec_task_accepted = Accepts2,
						rec_task_submitted = Submitted2}
					] ->
						Data2 =
							case Props =:= Props2 of
								true -> Data#rec_playerdata{rec_player_prop = undefined};
								_ -> Data
							end,
						Data3 =
							case Accepts =:= Accepts2 of
								true -> Data2#rec_playerdata{rec_task_accepted = undefined};
								_ -> Data2
							end,
						Data4 =
							case Submitted =:= Submitted2 of
								true -> Data3#rec_playerdata{rec_task_submitted = undefined};
								_ -> Data3
							end,
						gsSendMsg:sendMsg2DBServer(playerDataCommonMsg, AccountID, Data4),
						ok;
					_ ->
						gsSendMsg:sendMsg2DBServer(playerDataCommonMsg, AccountID, Data),
						playerDataMgrState:putPlayerDataTempDict(Data),
						true
				end;
			Error ->
				?ERROR_OUT("not found role:~p,accountID:~p,error:~p", [RoleID, AccountID, Error]),
				error
		end,
	?LOG_OUT("tickSavePlayerData accountID:~p,roleID:~p,~p", [AccountID,RoleID,Ret]),
	ok.

%% 下线保存玩家所有数据
offlineSavePlayerData({AccountID, RoleID}) ->
	?WARN_OUT("offlineSavePlayerData:~p", [RoleID]),

	%% 先保存基本数据
	tickSavePlayerData({AccountID, RoleID}),

	%% 再保存其它数据，目前没有
%%    gsSendMsg:sendMsg2DBServer(playerDataCommonMsg, AccountID, Data),
	ok.

%% 单独保存的数据,Data可为元组或者list
saveOtherPlayerData(Data) ->
	?DEBUG_OUT("saveOtherPlayerData:~p", [Data]),
	gsSendMsg:sendMsg2DBServer(playerDataCommonMsg, 0, Data),
	ok.

changeRoleOwner({_CmdSerial, DAccountID, SAccountID, SRoleID,_GMSocketPid}) ->
	DestinationAccountID = misc:toInteger(DAccountID),
	SourceAccountID = misc:toInteger(SAccountID),
	SourceRoleID = misc:toInteger(SRoleID),
	Ret =
		case ets:lookup(ets_rec_base_role, SourceRoleID) of
			[#rec_base_role{accountID = SourceAccountID} = Base] ->
				ets:delete(ets_recRoleList, DestinationAccountID),
				ets:delete(ets_recRoleList, SourceAccountID),
				ets:update_element(ets_rec_base_role, SourceRoleID, {#rec_base_role.accountID, DestinationAccountID}),
				%% 保存改变数据
				gsSendMsg:sendMsg2DBServer(updateRole,DestinationAccountID,Base#rec_base_role{accountID = DestinationAccountID}),
				%% 记录日志
				dbLog:sendSaveLogChangeRoleOwner(?LogType_ChangeRoleOwner,
					#rec_log_change_role_owner{descAccountID = DestinationAccountID, sourceAccountID = SourceAccountID, sourceRoleID = SourceRoleID}),
				true;
			_ ->
				false
		end,
	?LOG_OUT("changeRoleOwner:~p,~p,~p ret[~p].",[DestinationAccountID,SourceAccountID,SourceRoleID,Ret]),
	Ret.
