%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc条件触发器,指定条件完成之后会执行条件触发器
%%%
%%% @end
%%% Created : 05. 九月 2016 20:00
%%%-------------------------------------------------------------------
-module(logicArguLib).
-author("wenshaofei").
-include("gsInc.hrl").
%% API
-compile(export_all).
%%获取logic Argu
%%获取logic Argu

getRoleBaseInfoArgu(#rec_base_role{}=BaseRole)->
    logicLib:createLogicArgu(?LK_CURRENT_ROLE_BASE,BaseRole);
getRoleBaseInfoArgu(RoleID)->
    [RecBaseRole] = ets:lookup(ets_rec_base_role, RoleID),
    getRoleBaseInfoArgu(RecBaseRole).
%%获取logic Argu
getRoleBaseInfoArgu()->
    [RecBaseRole] = ets:lookup(ets_rec_base_role, playerState:getRoleID()),
    getRoleBaseInfoArgu(RecBaseRole).
%%当前所在的地图
getCurrentMapId()->
    MapId= playerState:getMapID(),
    logicLib:createLogicArgu(?LK_CURRENT_MAP_ID,MapId).
%%当前所在的地图
getMapId(MapId)->
    logicLib:createLogicArgu(?LK_CURRENT_MAP_ID,MapId).
%%生成DailyCountArgu增加参数
getDailyCountArgu(DailyType,DailyID,AddValue)->
    ?CheckDailyType(DailyType),
    logicLib:createLogicArgu(?LK_ADD_DAILY_COUNTER,[DailyType,DailyID,AddValue]).
%%生成被击杀目标的code和id参数
getKillTargetCodeIDArgu(TargetType,TargetID)->
    logicLib:createLogicArgu(?LK_KILL_TARGET_TYPE_ID,[TargetType,TargetID]).
%%生成地图内广播消息参数
%%@parma MapPlayerEts 地图呢的玩家ets
%%@param StringFormatArgu  格式化消息需要用到的信息
getNoticeInMapArgu(MapPids,StringFormatArgu) when is_list(StringFormatArgu) and is_list(MapPids)->
    logicLib:createLogicArgu(?LK_NOTICE_IN_MAP,{MapPids,StringFormatArgu}).
%%生成跑马灯消息参数
getPaoMaDengFormatArgu(StringFormatArgu) when is_list(StringFormatArgu)->
    logicLib:createLogicArgu(?LK_NOTICE_ALL_SERVER,StringFormatArgu).
%%生成邮件内道具参数
%%ItemList={id,number,isBind=[1|0]}
getMailItemsArgu(MailTitleFormatArgu,MailContextFormatArgu,ItemList)->
    logicLib:createLogicArgu(?LK_MAIL_GOODS,{MailTitleFormatArgu,MailContextFormatArgu,ItemList}).

%%生成经验值参数
%%Value,ExpSource,ExpSourceArgu
getExpValueArgu(Value,ExpSource,ExpSourceArgu)->
    logicLib:createLogicArgu(?LK_EXP_VALUE,{Value,ExpSource,ExpSourceArgu}).
%%获取传送目标地图参数
getTargetMapPidPosArgu(MapID,MapPid,X,Y)->
    logicLib:createLogicArgu(?LK_TARGET_MAP_PID_POS,{MapID,MapPid,X,Y}).
%%生成作用目标的角色id列表
getTargetRoleIDList(RoleIDList) when is_list(RoleIDList)->
    logicLib:createLogicArgu(?LK_TARGET_ROLE_ID_LIST,RoleIDList).