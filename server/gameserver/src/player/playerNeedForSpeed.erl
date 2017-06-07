%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc港口竞速玩家模块
%%%
%%% @end
%%% Created : 22. 九月 2016 10:39
%%%-------------------------------------------------------------------
-module(playerNeedForSpeed).
-author("wenshaofei").
-include("playerPrivate.hrl").
-include("cfg_needForSpeedItem.hrl").
-include("../activity/gameactivity/needforspeed/needForSpeedPrivate.hrl").

%% API
-export([match/0, cancelMatch/0, transfer2NeedForSpeedMap/4, exitCompetition/1, collideScoreLine/1, collideRoadBox/0, useItem/2, useItemAct/3, gather/1, isGather/1, transfer2NeedForSpeedMapAck/0,exitFromSence/0]).
-export([competitionOver/0,exitCompetitionByNetError/1]).
%%进行活动匹配
match() ->
	Argu = logicArguLib:getRoleBaseInfoArgu(),
	R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_NEED_FOR_SPEED_MATCH, [Argu]),
	?DEBUG_OUT("R=======match=====~p~n", [R]).

%%将用户传送到指定的地图和坐标上:
transfer2NeedForSpeedMap(MapID, MapPid, PosX, PosY) ->
	playerScene:onRequestEnterActivityMap(MapID, MapPid, PosX, PosY).
transfer2NeedForSpeedMapAck() ->
	playerliveness:onFinishLiveness(?LivenessSpeedUp,1),
	Argu = logicArguLib:getRoleBaseInfoArgu(),
	R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_NEED_FOR_SPEED_COMPATITION_TRANSFER_ACK, [Argu]),
	?DEBUG_OUT("R=======transfer2NeedForSpeedMap=====~p~n", [R]).
cancelMatch() ->
	Argu = logicArguLib:getRoleBaseInfoArgu(),
	R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_NEED_FOR_SPEED_CANCEL_MATCH, [Argu]),
	?DEBUG_OUT("R=======cancelMatch=====~p~n", [R]).

%%撞击到了路面上的分数线
collideScoreLine(CollideScoreLineId) ->
	?DEBUG_OUT("===========collideScoreLine===========================CollideScoreLineId=~p~n", [CollideScoreLineId]),
	core:sendMsgToActivity(?ActivityType_NeedForSpeed, collideScoreLine, {playerState:getRoleID(), playerState:getPos(), CollideScoreLineId}).
%%港口竞速玩家撞到了采集物
gather(GatherID) ->
	case getCfg:getCfgPStack(cfg_object, GatherID) of
		#objectCfg{type = ?GatherType_NeedForSpeed} ->
			collideRoadBox();
		_R ->
%%			collideRoadBox(),
			skip
	end,
	ok.
%%判断玩家是否可以采集指定的道具，如果玩家身上的道具个数小于2个则可以采集
isGather(GatherID) ->
	case getCfg:getCfgPStack(cfg_object, GatherID) of
		#objectCfg{type = ?GatherType_NeedForSpeed} ->
			case needForSpeedAthlete:getAthleteInfo(playerState:getRoleID()) of
				{ok, #need_for_speed_athlete{item_list = ItemList}} when length(ItemList) < ?NEED_FOR_SPEED_ITEM_MAX_NUMBER ->
					true;
				_ ->
					{false, none}
			end;
		_R ->
			true
	end.

%%撞击到了路面上的分数线
collideRoadBox() ->
	?DEBUG_OUT("=========CfgRoadID===============CollideScoreLineId=~n", []),
	core:sendMsgToActivity(?ActivityType_NeedForSpeed, collideRoadBox, {playerState:getRoleID()}).
%%退出比赛
exitCompetition(RoleID) ->
	[#rec_base_role{} = BaseRole] = ets:lookup(ets_rec_base_role, RoleID),
	Argu = logicArguLib:getRoleBaseInfoArgu(BaseRole),
	ItemInfoArgu = needForSpeedLogic:getAwardInfo(BaseRole, ?NEED_FOR_SPEED_LITTLE_AWARD_CFG_ID),
	Argu2 = logicArguLib:getMailItemsArgu([], [], ItemInfoArgu),
	R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_NEED_FOR_SPEED_EXIT_COMPATITION, [Argu, Argu2]),
	?DEBUG_OUT("exitCompetition===~p~n", [R]).
%%从活动场景内退出
exitFromSence()->
	{TargetMapId, PosX, PosY}=playerState:getOldMapPos(),
	case playerState:getActionStatus() of
		%%地图传送状态不能再传送
		?CreatureActionStatusChangeMap ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed);
		?CreatureActionStatusMove ->
			playerMove:stopMove(false),
			erlang:send_after(200, self(), {laterTransfer, TargetMapId, PosX*1.0, PosY*1.0});
		_ ->
			playerScene:onRequestEnterMap(TargetMapId, PosX*1.0, PosY*1.0)
	end.
%%因网络问题、退出比赛，
exitCompetitionByNetError(RoleID) ->
	[#rec_base_role{} = BaseRole] = ets:lookup(ets_rec_base_role, RoleID),
	Argu = logicArguLib:getRoleBaseInfoArgu(BaseRole),
	ItemInfoArgu = needForSpeedLogic:getAwardInfo(BaseRole, ?NEED_FOR_SPEED_LITTLE_AWARD_CFG_ID),
	Argu2 = logicArguLib:getMailItemsArgu([], [], ItemInfoArgu),
	R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_NEED_FOR_SPEED_EXIT_COMPATITION_BY_NET_ERROR, [Argu, Argu2]),
	?DEBUG_OUT("exitCompetition===~p~n", [R]).


%%比赛正式结束
competitionOver() ->
	Argu = logicArguLib:getRoleBaseInfoArgu(),
	R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_NEED_FOR_SPEED_COMPATITION_OVER, [Argu]),
	?DEBUG_OUT("competitionOver===~p~n", [R]).
useItem(ItemID, TargetRoleIDList) ->
	core:sendMsgToActivity(?ActivityType_NeedForSpeed, useItem, {playerState:getRoleID(), ItemID, TargetRoleIDList}).
useItemAct({error_code, ErrorCode}, _ItemID, _TargetRoleIDList) ->
	playerMsg:sendErrorCodeMsg(ErrorCode);
useItemAct({ok, <<"success">>}, ItemID, TargetRoleIDList) ->
	Argu = logicArguLib:getRoleBaseInfoArgu(),
	Argu2 = logicArguLib:getTargetRoleIDList(TargetRoleIDList),
	#needForSpeedItemCfg{logic_group_id = LogicGroupID} = getCfg:getCfgByKey(cfg_needForSpeedItem, ItemID),
	R = logicLib:runLogicGroup(LogicGroupID, [Argu, Argu2]),
	?DEBUG_OUT("=========useItem success==========~p~n", [R]).
