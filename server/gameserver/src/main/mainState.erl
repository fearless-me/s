%% @author Administrator
%% @doc @todo Add description to mainState.


-module(mainState).
-include("mainPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================

-export([
		 getPlayerPidInfo/0,
		 setPlayerPidInfo/1,
		 getSaveTeamTime/0,
		 setSaveTeamTime/1
		 ]).

%% ====================================================================
%% API functions
%% ====================================================================

%% 获取玩家的进程信息
-spec getPlayerPidInfo() -> Result when
		  Result :: dict:dict() | undefined.
getPlayerPidInfo() ->
	get('PlayerPidInfo').

%% 设置玩家的进程信息
-spec setPlayerPidInfo(PlayerPidInfoDict) -> OldVal | undefined when
		  PlayerPidInfoDict :: dict:dict(),
		  OldVal :: dict:dict().
setPlayerPidInfo(PlayerPidInfoDict) ->
	dict:size(PlayerPidInfoDict),
	put('PlayerPidInfo', PlayerPidInfoDict).
%% 获取上次保存队伍信息时间
-spec getSaveTeamTime() -> uint64().
getSaveTeamTime() ->
	case get('SaveTeamTime') of
		undefined ->
			0;
		Time ->
			Time
	end.
%% 设置保存队伍信息时间
-spec setSaveTeamTime(SaveTeamTime::uint64()) -> OldVal::uint64()|undefined.
setSaveTeamTime(SaveTeamTime) ->
	put('SaveTeamTime', SaveTeamTime).
%%% ========================================================
%%% internal functions
%%% ========================================================

%%% 保存玩家进程Pid到进程字典（玩家上线用）
%-spec addPlayerPidInfo(PlayerCode, PlayerPid) -> ok when
%		  PlayerCode :: uint(),
%		  PlayerPid :: pid().
%addPlayerPidInfo(PlayerCode, PlayerNetPid) when erlang:is_integer(PlayerCode)
%  									  andalso PlayerCode > 0 andalso erlang:is_pid(PlayerNetPid) ->
%	PlayerPidInfoDict = getPlayerPidInfo(),
%	NewPlayerPidInfoDict = dict:store(PlayerCode, PlayerNetPid, PlayerPidInfoDict),
%	setPlayerPidInfo(NewPlayerPidInfoDict),
%	ok.
%
%%% 删除玩家进程Pid到进程字典（玩家下线用）
%-spec delPlayerPidInfo(PlayerCode) -> ok when
%		  PlayerCode :: uint().
%delPlayerPidInfo(PlayerCode) when erlang:is_integer(PlayerCode) andalso PlayerCode >= 0 ->
%	PlayerPidInfoDict = getPlayerPidInfo(),
%	NewPlayerPidInfoDict = dict:erase(PlayerCode, PlayerPidInfoDict),
%	setPlayerPidInfo(NewPlayerPidInfoDict),
%	ok;
%delPlayerPidInfo(_PlayerCode) ->
%	ok.



															