%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%% 玩家数据管理类逻辑
%%% @end
%%% Created : 22. 九月 2016 14:46
%%%-------------------------------------------------------------------
-module(publicDataMgrLogic).
-author("tiancheng").

-include("gsInc.hrl").
-include("gamedataLog.hrl").

%% API
-export([
    init/0,
    alreadyConnectDBServer/0,
    savePublicData/1
]).

init() -> ok.

alreadyConnectDBServer() ->
    ?LOG_OUT("alreadyConnectDBServer"),
%%    case core:isCross() of
%%        false ->
            publicDataMgrLoad:loadData(),
%%        _ ->
%%            skip
%%    end,
    ok.

savePublicData(clearWarriorTrialDataInRoleKeyInfo) ->
    ?LOG_OUT("clearWarriorTrialDataInRoleKeyInfo"),
    Fun =
        fun(#?RoleKeyRec{roleID = RoleID}, _) ->
            ets:update_element(ets_rolekeyinfo, RoleID, [{#?RoleKeyRec.wtPhase, 0}, {#?RoleKeyRec.wtPhaseTime, 0}]),
            ok
        end,
    ets:foldl(Fun, 0, ets_rolekeyinfo),
    ok;
savePublicData({?RoleKeyRec, Key, UpdateList}) ->
    ets:update_element(ets_rolekeyinfo, Key, UpdateList),
    ok;
savePublicData(Data) ->
    ?ERROR_OUT("no handler fun:~p", [Data]),
    ok.