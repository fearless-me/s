%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%% @end
%%% Created : 20. 四月 2016 10:23
%%%-------------------------------------------------------------------
-module(gameMapGuildExpedition).
-author("Administrator").

-include("mapPrivate.hrl").
-include("common/activityDef.hrl").
-include("common/PlayerPropSyncDefine.hrl").

%% API
-export([
    createStatue/1,
    createBannerNpc/1
]).

%%-----------------------------------------------------------------------------------------------------------------------
%%-----------------------------------------------------------------------------------------------------------------------
%%雕像
createStatue({List}) ->
    L = getStatueObjIDList(),

%%    delte
    NpcEts = mapState:getMapNpcEts(),
    FD =
        fun(IDOne) ->
            CodeList = getNpcCodeByID(IDOne),
            [ gatherNpcMgr:deleteObject(NpcEts,Code1) || Code1 <- CodeList ]
        end,
    lists:foreach(FD, L),

    PL0 = getStatuePosList(),
    PL1 = lists:filter(fun({ML, _}) -> lists:member(mapState:getMapId(), ML) end, PL0),

    case PL1 of
        [] ->
            skip;
        [{_, PL} | _] ->
            doCreateStatue(List, PL)
    end,
    ok.

%% 雕像(RoleIDList, PointList)
doCreateStatue([], _) -> skip;
doCreateStatue(_, []) -> skip;
doCreateStatue([RH | RL ], [PH | PL]) ->
    doCreateStatue(RH, PH),
    doCreateStatue(RL, PL);
doCreateStatue(RoleID, {X1,Y1,RotW})->
    {Career, Name} = getRoleInfo(RoleID),
    ObjID = getStatueObjID(Career),
%%
    NpcInstance = #recSpawnNpc{id = ObjID,name=Name,rotW =RotW,x = erlang:float(X1),y = erlang:float(Y1)},
    mapBase:npcSpawn(NpcInstance),

    ?LOG_OUT("~p createStatue,mapid=~p,mapPid=~p,npc=~p",[?MODULE, mapState:getMapId(), self(),NpcInstance]);
doCreateStatue(_PlayerList,_PointList) ->
    ok.
%%-----------------------------------------------------------------------------------------------------------------------
%%-----------------------------------------------------------------------------------------------------------------------
%% 创建旗帜NPC
createBannerNpc({_GuildID, GuildName, _GatherID,PointIndex})->
    doCreateBanner(PointIndex, GuildName),
    ok.

%% 创建旗帜
doCreateBanner(PointIndex, GuildName) ->
    ObjID = getBannerObjID(PointIndex),
    NpcEts = mapState:getMapNpcEts(),
    CodeList = getNpcCodeByID(ObjID),
    [gatherNpcMgr:deleteObject(NpcEts, Code1) || Code1 <- CodeList],

    {X1, Y1, RotW} = getBannerPos(mapState:getMapId(), PointIndex),
    NpcInstance = #recSpawnNpc{id = ObjID, name = GuildName, rotW = RotW, x = erlang:float(X1), y = erlang:float(Y1)},
    mapBase:npcSpawn(NpcInstance),
    ?LOG_OUT("~p doCreateBanner,mapid=~p,mapPid=~p,npc=~p", [?MODULE, mapState:getMapId(), self(), NpcInstance]),
    ok.
%%-----------------------------------------------------------------------------------------------------------------------
%%-----------------------------------------------------------------------------------------------------------------------
%% 获取旗帜NPC的ID
getBannerObjID(PointIndex)->
    L = getBannerIDList(),
    case length(L) >= PointIndex  andalso PointIndex > 0 of
        true ->
            lists:nth(PointIndex,L);
        _ ->
            0
    end.

%% 获取旗帜NPC的坐标
getBannerPos(MapID, PointIndex)->
    L0 = getBannerPosList(),
    L1 = lists:filter( fun({ML,_}) -> lists:member(MapID, ML) end, L0),
    case L1 of
        [] ->
            {0,0,0};
        [{_, PL} | _] ->
            case length(PL) >= PointIndex  andalso PointIndex > 0 of
                true ->
                    lists:nth(PointIndex, PL);
                _ ->
                    {0,0,0}
            end
    end.


%% 旗帜ID列表
getBannerIDList() ->
    [462,463,464].
%%%%    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_banner) of
%%%%        #globalsetupCfg{setpara = List} ->
%%%%            List;
%%%%        _ ->
%%%%            []
%%%%    end.

%% 旗帜坐标列表
getBannerPosList() ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_bannerPresent) of
        #globalsetupCfg{setpara = List} ->
            List;
        _ ->
            []
    end.

%%-----------------------------------------------------------------------------------------------------------------------
%%-----------------------------------------------------------------------------------------------------------------------

getStatueObjID(Career) ->
    L = getStatueObjIDList(),
    N = length(L),
    case Career > 0  andalso N >= Career of
        true ->
            lists:nth(Career,L);
        _ ->
            0
    end.

%% 雕像ID列表
getStatueObjIDList() ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_npcid) of
        #globalsetupCfg{setpara = List} ->
            List;
        _ ->
            []
    end.


%%雕像坐标列表
getStatuePosList() ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_npcxy) of
        #globalsetupCfg{setpara = List} ->
            List;
        _ ->
            []
    end.
%%-----------------------------------------------------------------------------------------------------------------------
%%-----------------------------------------------------------------------------------------------------------------------
%%通过id检查npc的code
-spec getNpcCodeByID(NpcID::uint32()) ->[uint64()].
getNpcCodeByID(NpcID) ->
    NpcEts = mapState:getMapNpcEts(),
    MatchSpec = ets:fun2ms(fun(R) when R#recMapObject.id==NpcID -> R#recMapObject.code end),
    L = myEts:selectEts(NpcEts, MatchSpec),
    L.

%% 查询玩家信息
getRoleInfo(RoleID)  ->
    case core:queryRoleKeyInfoByRoleID(RoleID) of
        #?RoleKeyRec{career = Career, roleName = Name } ->
            {Career,Name};
        _ ->
            {1, ""}
    end.
