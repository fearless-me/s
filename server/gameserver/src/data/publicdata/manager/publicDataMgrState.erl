%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 27. 九月 2016 10:31
%%%-------------------------------------------------------------------
-module(publicDataMgrState).
-author("tiancheng").

%% API
-compile(export_all).

addLoadPublicDataProcess(Flag) ->
    L = getLoadPublicDataProcess(),
    NL =
        case lists:member(Flag, L) of
            false ->
                put('LoadPublicDataProcess', [Flag | L]),
                [Flag | L];
            _ ->
                L
        end,
    NL.

getLoadPublicDataProcess() ->
    case get('LoadPublicDataProcess') of
        undefined -> [];
        L -> L
    end.

setRoleKeyInfoTempEts(Ets) ->
   put('RoleKeyInfoTempEts', Ets).

getRoleKeyInfoTempEts() ->
    get('RoleKeyInfoTempEts').

getLoadOtherDataPidList() ->
	case get('LoadOtherDataPidList') of
		undefined -> [];
		L -> L
	end.
addLoadOtherDataPidList(Pid) ->
	L = getLoadOtherDataPidList(),
	setLoadOtherDataPidList([Pid|L]).
delLoadOtherDataPidList(Pid) ->
	L = getLoadOtherDataPidList(),
	NL = lists:delete(Pid, L),
	setLoadOtherDataPidList(NL).
setLoadOtherDataPidList(List) ->
	put('LoadOtherDataPidList', List),
	List.

setPlayerObjectList(List) ->
	put('PlayerObjectList', List).
addPlayerObjectList(Data) ->
	L = getPlayerObjectList(),
	setPlayerObjectList([Data | L]).
getPlayerObjectList() ->
	case get('PlayerObjectList') of
		undefined -> [];
		L -> L
	end.