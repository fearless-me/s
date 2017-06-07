%%%-------------------------------------------------------------------
%%% @author mwh
%%% 帮会沙盘
%%%-------------------------------------------------------------------
-module(acGuildExpeditionState).

-include("acGuildExpeditionPrivate.hrl").

%% API
%% -export([]).
-compile(export_all).

%% 是否初始化
setInit(Bool) ->
    put(guildexpeditionInit, Bool).

getInit() ->
    get(guildexpeditionInit).

%% 是否开启
getACIsStart() ->
    case get('ACIsStart') of
        undefined -> false;
        B -> B
    end.

setACIsStart(B) ->
    put('ACIsStart', B).

%% 地图列表
getMapList() ->
    case get(guildexpeditionMapList) of
        undefined ->
            [];
        L ->
            L
    end.

setMapList(L) ->
    put(guildexpeditionMapList, L).

%%
getMapTopCachList()->
    case get(guildMapTopNList) of
        undefined ->
            [];
        L ->
            L
    end.

setMapTopCachList(L)->
    put(guildMapTopNList, L).

getMapTopCachList(MapID) ->
    MapNList = getMapTopCachList(),
    case lists:keyfind(MapID, #topGuildCache.mapID,  MapNList) of
        #topGuildCache{} = Rec ->
            Rec;
        _ ->
           false
    end.

%% 获取申请进入列表
getApplyList() ->
    case get('ApplyList') of
        undefined ->
            [];
        L ->
            L
    end.

setApplyList(L) ->
    put('ApplyList', L).

delApplyList() ->
    erlang:erase('ApplyList').

%% 报名序号
getApplyNumber() ->
    Number =
        case get('ApplyNumber') of
            undefined ->
                1;
            Num ->
                Num + 1
        end,

    setApplyNumber(Number),
    Number.

setApplyNumber(Number) ->
    put('ApplyNumber', Number).

delApplyNumber() ->
    erlang:erase('ApplyNumber').

%% 地图ETS缓存
getMapEtsCacheList() ->
    case get('MapEtsCacheList') of
        undefined -> [];
        L -> L
    end.

delMapEtsCacheList() ->
    erlang:erase('MapEtsCacheList').

addMapEtsCache({MapPID, _PE, _ME, _CE, _NE} = Data) ->
    L = getMapEtsCacheList(),
    NL = lists:keystore(MapPID, 1, L, Data),
    put('MapEtsCacheList', NL),
    ok.

getMapEtsCache(MapPID) ->
    L = getMapEtsCacheList(),
    lists:keyfind(MapPID, 1, L).

delMapEtsCache(MapPID) ->
    L = getMapEtsCacheList(),
    NL =
        case lists:keymember(MapPID, 1, L) of
            true -> lists:keydelete(MapPID, 1, L);
            _ -> L
        end,
    put('MapEtsCacheList', NL).


%% 进入玩家字典
getPlayerDict() ->
    case get('PlayerDict') of
        undefined ->
            dict:new();
        Dict ->
            Dict
    end.

setPlayerDict(Dict) ->
    put('PlayerDict', Dict).


delPlayerDict( ) ->
    erase('PlayerDict').

delPlayerDict(RoleID) ->
    D = getPlayerDict(),
    NewD = dict:erase(RoleID, D),
    setPlayerDict(NewD),
    ok.

getPlayerObject(RoleID) ->
    Dict = getPlayerDict(),
    case dict:find(RoleID, Dict) of
        {ok, #expeditionPlayer{} = Player} -> Player;
        _ -> false
    end.

putPlayerObject(#expeditionPlayer{roleID = RoleID} = Player) ->
    Dict = getPlayerDict(),
    NDict = dict:store(RoleID, Player, Dict),
    setPlayerDict(NDict).


%%
setScoreRate(Rate)->
    put(expeditionScoreRate, Rate).

getScoreRate()->
    case get(expeditionScoreRate) of
        undefined ->
            1;
        Rate ->
            Rate
    end.


setACStartTime(Time)->
    put(acStartTime, Time).

getACStartTime()->
    case get(acStartTime) of
        undefined ->
            0;
        Time ->
            Time
    end.

%%
%% 获取军团每日领取个数
getGuildEveryDayRewardNumber(MapID,GuildID, Power) ->
    List = getEveryDayRewardList(),
    Key = {MapID, GuildID, Power},
    case lists:keyfind(Key, #guildEveryDayReward.key, List) of
        #guildEveryDayReward{number = Number} -> Number;
        _ -> 0
    end.

%% 增加一个计数
incGuildEveryDayRewardNumber(MapID,GuildID, Power) ->
    List = getEveryDayRewardList(),
    Key = {MapID, GuildID, Power},
    {NList, Num} =
        case lists:keyfind(Key, #guildEveryDayReward.key, List) of
            #guildEveryDayReward{number = Number} = Value ->
                {lists:keystore(Key, #guildEveryDayReward.key, List, Value#guildEveryDayReward{number = Number + 1}), Number + 1};
            _ ->
                {[#guildEveryDayReward{key = Key, number = 1} | List] ,1}
        end,
    setEveryDayRewardList(NList),
    Num.


%%
getEveryDayRewardList() ->
    case get('getguildEveryDayRewardList') of
        undefined -> [];
        L -> L
    end.

setEveryDayRewardList(List) ->
    put('getguildEveryDayRewardList', List).

delEveryDayRewardList() ->
    erlang:erase('getguildEveryDayRewardList').


%%
getEverdayRewardListSetTime()->
    case get('guildEveryDayRewardSetTime') of
        undefined -> 0;
        Time -> Time
    end.

setEverdayRewardListSetTime(Time)->
    put('guildEveryDayRewardSetTime', Time).