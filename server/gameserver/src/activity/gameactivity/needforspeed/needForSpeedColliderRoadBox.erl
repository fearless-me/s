%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%港口竞速，路面上的道具碰撞盒
%%% @end
%%% Created : 28. 十一月 2016 15:50
%%%-------------------------------------------------------------------
-module(needForSpeedColliderRoadBox).
-author("wenshaofei").

-include("needForSpeedPrivate.hrl").
-include("../../activityPrivate.hrl").


%% API 刷新路面上的盒子
-export([colliderRoadBox/1]).

colliderRoadBox(PlayerID) ->
  {ok, AthleteData = #need_for_speed_athlete{}} = needForSpeedAthlete:getAthleteInfo(PlayerID),
  colliderRoadBox1(AthleteData).
%%撞到路面上的盒子
%%副驾驶玩家撞到了道具忽略掉
%%,
colliderRoadBox1(#need_for_speed_athlete{isPetdoubleMaster = false, partner_id = PartnerID}) when PartnerID > 0 ->
  skip;
%%玩家身上已经有两个道具了忽略掉
colliderRoadBox1(#need_for_speed_athlete{item_list = ItemList}) when length(ItemList) >= ?NEED_FOR_SPEED_ITEM_MAX_NUMBER ->
  skip;
colliderRoadBox1(AthleteData = #need_for_speed_athlete{competition_id = CompetionID, isPetdoubleMaster = true, partner_id = PartnerID}) when PartnerID > 0 ->
  SortList = needForSpeedAthlete:sortAthleteListRemoveDoublePet(CompetionID),
  Index = misc:getListPos(AthleteData, SortList),
  colliderRoadBox2(AthleteData, Index),
  {ok,PartnerAthlete} = needForSpeedAthlete:getAthleteInfo(PartnerID),
  colliderRoadBox2(PartnerAthlete, Index);
colliderRoadBox1(#need_for_speed_athlete{role_id = ROleID, isPetdoubleMaster = false, partner_id = PartnerID}) when PartnerID > 0 ->
  ?DEBUG_OUT("guest colliderRoadBox1==ROleID=~p~n",[ROleID]),
  skip;
colliderRoadBox1(AthleteData = #need_for_speed_athlete{competition_id = CompetionID}) ->
  SortList = needForSpeedAthlete:sortAthleteListRemoveDoublePet(CompetionID),
  Index = misc:getListPos(AthleteData, SortList),
  colliderRoadBox2(AthleteData, Index).

colliderRoadBox2(#need_for_speed_athlete{} = AthleteData, Index) ->
  case getCfg:getCfgByKey(cfg_needForSpeedRandomItem, Index) of
    #needForSpeedRandomItemCfg{item_weight_list = WeightList} ->
      ItemID = misc:calcOddsByAfterWeightList(WeightList),
      needForSpeedAthlete:addItem(AthleteData, ItemID);
    R ->
      ?ERROR_OUT("====colliderRoadBox2=============cfg error id =~p,~p", [Index, R])
  end.


