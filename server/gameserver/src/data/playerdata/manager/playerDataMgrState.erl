%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 27. 九月 2016 10:31
%%%-------------------------------------------------------------------
-module(playerDataMgrState).
-author("tiancheng").

-include("gsInc.hrl").

%% API
-compile(export_all).

addLoadPlayerDataProcess(Flag) ->
    L = getLoadPlayerDataProcess(),
    NL =
        case lists:member(Flag, L) of
            false ->
                put('LoadPlayerDataProcess', [Flag | L]),
                [Flag | L];
            _ ->
                L
        end,
    NL.

getLoadPlayerDataProcess() ->
    case get('LoadPlayerDataProcess') of
        undefined -> [];
        L -> L
    end.

%% 玩家数据保存缓存，如果一样则不存了。
getPlayerDataTempDict() ->
	case get('PlayerDataTempDict') of
		undefined -> dict:new();
		Dict -> Dict
	end.
setPlayerDataTempDict(Dict) ->
	put('PlayerDataTempDict', Dict).
queryPlayerDataTempDict(RoleID) ->
	Dict = getPlayerDataTempDict(),
	case dict:find(RoleID, Dict) of
		{ok, Data} -> Data;
		_ -> false
	end.
putPlayerDataTempDict(#rec_playerdata{roleID = RoleID} = Data) ->
	Dict = getPlayerDataTempDict(),
	NewDict = dict:store(RoleID, Data, Dict),
	setPlayerDataTempDict(NewDict).