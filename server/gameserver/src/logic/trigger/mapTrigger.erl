%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc 处理地图相关业务逻辑的触发器
%%%
%%% @end
%%% Created : 06. 九月 2016 10:41
%%%-------------------------------------------------------------------
-module(mapTrigger).
-author("wenshaofei").
-include("../private_logic.hrl").
-include("../../world/mapPrivate.hrl").
%% API
-compile(export_all).
%%传送当前用户到指定的地图
transferCurrentRoleToMap(#triggerCfg{argu = [TargetMapId,PosList]}=Cfg, FromProgramArgs,FromCondationArgu)->
    [[PosX, PosY]]=misc:randUniqueFromList(1,PosList),
    case playerState:getActionStatus() of
        %%地图传送状态不能再传送
        ?CreatureActionStatusChangeMap ->
            playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed),
            triggerLib:getSuccessReturn(Cfg, FromProgramArgs,FromCondationArgu);
        ?CreatureActionStatusMove ->
            playerMove:stopMove(false),
            erlang:send_after(200, self(), {laterTransfer, TargetMapId, PosX*1.0, PosY*1.0}),
            triggerLib:getSuccessReturn(Cfg, FromProgramArgs,FromCondationArgu);
        _ ->
            case checkMapFromTo(playerState:getMapID(), TargetMapId) of
                true ->
                    playerScene:onRequestEnterMap(TargetMapId, PosX*1.0, PosY*1.0),
                    triggerLib:getSuccessReturn(Cfg, FromProgramArgs,FromCondationArgu);
                ErrorCode ->
                    playerMsg:sendErrorCodeMsg(ErrorCode)
            end
    end.

%%将当前用户传送到上次地图位置
transferCurrentRoleToLastMap(#triggerCfg{}=Cfg, FromProgramArgs,FromCondationArgu)->
    {TargetMapId, PosX, PosY}=playerState:getOldMapPos(),
%%    ok=playerMap:transfer2NewPos(OldMapId, OldX, OldY),
%%    triggerLib:getSuccessReturn(Cfg, FromProgramArgs,FromCondationArgu),
    case playerState:getActionStatus() of
        %%地图传送状态不能再传送
        ?CreatureActionStatusChangeMap ->
            playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed),
            triggerLib:getSuccessReturn(Cfg, FromProgramArgs,FromCondationArgu);
        ?CreatureActionStatusMove ->
            playerMove:stopMove(false),
            erlang:send_after(200, self(), {laterTransfer, TargetMapId, PosX*1.0, PosY*1.0}),
            triggerLib:getSuccessReturn(Cfg, FromProgramArgs,FromCondationArgu);
        _ ->
            case checkMapFromTo(playerState:getMapID(), TargetMapId) of
                true ->
                    playerScene:onRequestEnterMap(TargetMapId, PosX*1.0, PosY*1.0),
                    triggerLib:getSuccessReturn(Cfg, FromProgramArgs,FromCondationArgu);
                ErrorCode ->
                    playerMsg:sendErrorCodeMsg(ErrorCode)
            end
    end.

%%将用户传送到最热的地图线上,在地图坐标点内进行随机
transferCurrentRoleToHotMap(#triggerCfg{argu =[MapID,PosList] }=Cfg, FromProgramArgs,FromCondationArgu)->
    [[PosX, PosY]]=misc:randUniqueFromList(1,PosList),
    MapList= mapMgrState:getMapInfoByMapID(MapID),
    CanJoinMapList = [MapInfo||MapInfo=#recMapInfo{isReachMaxNum =IsFull }<-MapList,IsFull =:= false],
    if
        CanJoinMapList =:= [] ->
            PlayerActionStatus = playerState:getActionStatus(),
            case PlayerActionStatus of
                %%地图传送状态不能再传送
                ?CreatureActionStatusChangeMap ->
                    playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed);
                ?CreatureActionStatusMove ->
                    playerMove:stopMove(false),
                    erlang:send_after(200, self(), {laterTransfer, MapID, PosX, PosY});
                _ ->
                    playerScene:onRequestEnterMap(MapID, PosX, PosY)
            end;
        true ->
            SortList = lists:keysort(#recMapInfo.totalPlayerNum,CanJoinMapList),
            #recMapInfo{pid = HotMapPid}= lists:last(SortList),
			?DEBUG_OUT("req join hot map =========xxxxxxxxxxxx=====~p~n",[{MapID,HotMapPid}]),
            playerScene:onRequestEnterActivityMap(MapID,HotMapPid,PosX, PosY)
    end,
    triggerLib:getSuccessReturn(Cfg, FromProgramArgs,FromCondationArgu) .

%%通过程序将用户传送到指定的地图上,需要程序指定地图的id，pid，x、y坐标
transferCurrentRoleToMapByProgrom(#triggerCfg{}=Cfg, FromProgramArgs,FromCondationArgu)->
    {ok,[MapPid,MapID,PosX, PosY]} = logicLib:getLogicArguValue(?LK_TARGET_MAP_PID_POS, FromProgramArgs),
    playerScene:onRequestEnterActivityMap(MapID,MapPid,PosX, PosY),
    triggerLib:getSuccessReturn(Cfg, FromProgramArgs,FromCondationArgu) .

%% 检查来去地图类型
-spec checkMapFromTo(FromMapID::uint(), ToMapID::uint()) -> true | uint().
checkMapFromTo(FromMapID, FromMapID) ->
    ?ErrorCode_SystemTheSameMapChangeSceneFailed;   %% 不能同地图切换
checkMapFromTo(FromMapID, ToMapID) ->
    case getCfg:getCfgByKey(cfg_mapsetting, ToMapID) of
        #mapsettingCfg{type = Type} when Type =/= ?MapTypeNormal ->
            case getCfg:getCfgByKey(cfg_mapsetting, FromMapID) of
                #mapsettingCfg{type = ?MapTypeNormal} ->
                    true;   %% 从普通地图向非普通地图切换
                _ ->
                    ?ErrorCode_Date_Map_NeedNormal  %% 无法从非普通地图向非普通地图切换
            end;
        _ ->
            true    %% 从任意地图向普通地图切换
    end.
