%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc世界守护，奖励相关逻辑
%%%
%%% @end
%%% Created : 14. 十二月 2016 16:57
%%%-------------------------------------------------------------------
-module(acKingbattleAward).
-author("wenshaofei").

-include("../../activityPrivate.hrl").
-include("acKingBattleAllPrivatePrivate.hrl").
%% API
-export([sendRankAward/0,sendDefenderWinAward/0,sendAwardWhenDefenderFail/2]).

%%发送排名奖励,只给发前10名发放奖励
%% argu=[[【大经验丹道具id，大经验丹经验值】，【小经验丹道具id，小经验丹经验值】],RankItemAwardList=[【排名开始值，排名结束值，道具id，道具个数，是否绑定】]]
sendRankAward() ->
  AttackerSortList = acKingBattleAllLogic:sortAttackerByDamage(),
  RankItemAwardList = globalCfg:getGlobalCfg(king_battle_rank_item_info),
  AwardRankNumber = globalCfg:getGlobalCfg(king_battle_award_rank_number),
  SubAttackerList = lists:sublist(AttackerSortList,AwardRankNumber),
  sendRankAward(SubAttackerList, 1, RankItemAwardList).
rank2ExpItem(RoleID, RankIndex) ->
  [[BigExpItemID, BigExpValue, IsBindBig], [SamllExpItemID, SmallExpValue, IsBindSmall]] = globalCfg:getGlobalCfgList(exp_2_item_info),
  AwardRankNumber = globalCfg:getGlobalCfg(king_battle_award_rank_number),
  case ets:lookup(ets_rec_base_role, RoleID) of
    [#rec_base_role{level = Level}] ->
      Exp = Level * 50 + 1000 * (1 + (1.1 - RankIndex / AwardRankNumber)),
      BigExpItemNumber = erlang:trunc(Exp) div BigExpValue,
      if
        BigExpItemNumber > 0 ->
          BigExpItems = awardItemList2MailItems([[BigExpItemID, BigExpItemNumber, IsBindBig]], RoleID);
        true ->
          BigExpItems = []
      end,
      SmallExpItemNumber = erlang:trunc(Exp - BigExpItemNumber * BigExpValue) div SmallExpValue,
      if
        SmallExpItemNumber > 0 ->
          SmallExpItems = awardItemList2MailItems([[SamllExpItemID, SmallExpItemNumber, IsBindSmall]], RoleID);
        true ->
          SmallExpItems = []
      end,
      SmallExpItems ++ BigExpItems;
    _ ->
      ?ERROR_OUT("rank2ExpItem error roleID=~p~n",[RoleID]),
      []
  end.

sendRankAward([], _, _) ->
  ok;
sendRankAward([#king_battle_attacker{roleID = RoleID} | AttackerSortList], Index, []) ->
  Title = stringCfg:getString(kingBattleRankAwardTitle),
  Content = stringCfg:getString(kingBattleRankAwardContext, [Index]),
  ExpItems = rank2ExpItem(RoleID, Index),
  mail:sendSystemMail(RoleID, Title, Content, ExpItems, erlang:integer_to_list(Index)),
  sendRankAward(AttackerSortList, Index + 1, []);
sendRankAward([#king_battle_attacker{roleID = RoleID} | AttackerSortList], Index, [RankAwardItems | RankAwardItemsList]) ->
  Title = stringCfg:getString(kingBattleRankAwardTitle),
  Content = stringCfg:getString(kingBattleRankAwardContext, [Index]),
  ExpItems = rank2ExpItem(RoleID, Index),
  RankItems =  awardItemList2MailItems([RankAwardItems],RoleID),
  mail:sendSystemMail(RoleID, Title, Content, RankItems ++ ExpItems, erlang:integer_to_list(Index)),
  sendRankAward(AttackerSortList, Index + 1, RankAwardItemsList).
%%给守护者发送守护成功奖励
sendDefenderWinAward() ->
  case acKingBattleAllLogic:getCurrentDefenderInfo() of
    {ok, #rec_guard_mirror{roleID = RoleID}} ->
      DefenderItemAwardList = globalCfg:getGlobalCfg(king_battle_defender_item_info),
      Title = stringCfg:getString(kingBattleDefenderAwardWinTitle),
      Content = stringCfg:getString(kingBattleDefenderAwardWinContext),
      Index=1,
      ExpItems = rank2ExpItem(RoleID, Index),
      DefenderItems =  awardItemList2MailItems(DefenderItemAwardList,RoleID)  ,
      ?DEBUG_OUT("======sendDefenderWinAward====11111111======~p~n",[{RoleID,DefenderItems,ExpItems}]),
      mail:sendSystemMail(RoleID, Title, Content, DefenderItems ++ ExpItems, erlang:integer_to_list(Index)),
%%	        没有产生新的守护者，活动准时结束
      KillNum = erlang:length(acKingBattleAllLogic:getKillRoleIDList()),
      RoleName=playerNameUID:getPlayerNameByUID(RoleID),
      BroadCastContent = stringCfg:getString(cnTextKingBattleAllDefendWin, [RoleName, KillNum]),
      activityCommon:sendBroadcastNotice(BroadCastContent) ,
      ok;
    R ->
      ?ERROR_OUT("sendDefenderAward error can not find defender info  R=~p", [R])
  end.
%%给守护者发送守护失败奖励
sendDefenderFailAward(DefenderRoleID) ->
  case acKingBattleAllLogic:getCurrentDefenderInfo() of
    {ok, #rec_guard_mirror{roleID = RoleID}} ->
      DefenderItemAwardList = globalCfg:getGlobalCfg(king_battle_defender_item_info),
      Title = stringCfg:getString(kingBattleDefenderAwardFailTitle),
      Content = stringCfg:getString(kingBattleDefenderAwardFailContext),
      DefenderItems =awardItemList2MailItems(DefenderItemAwardList,RoleID),
      mail:sendSystemMail(DefenderRoleID, Title, Content,  DefenderItems, erlang:integer_to_list(DefenderRoleID));
    R ->
      ?ERROR_OUT("sendDefenderAward error can not find defender info  R=~p", [R])
  end.
%%新守护者诞生奖励
sendNewDefenderAward(RoleID)->
  DefenderItemAwardList = globalCfg:getGlobalCfg(king_battle_defender_item_info),
  Title = stringCfg:getString(kingBattleNewDefenderAwardTitle),
  Content = stringCfg:getString(kingBattleDefenderAwardContext),
  Index=1,
  ExpItems = rank2ExpItem(RoleID, Index),
  DefenderItems = awardItemList2MailItems(DefenderItemAwardList,RoleID),
  mail:sendSystemMail(RoleID, Title, Content, DefenderItems ++ ExpItems, erlang:integer_to_list(Index)) .
%%当防守方失败之后进行奖励发放
sendAwardWhenDefenderFail(NewDefenderID,OlderDefenderID)->
  sendNewDefenderAward(NewDefenderID),
  sendDefenderFailAward(OlderDefenderID),
  AttackerName=playerNameUID:getPlayerNameByUID( NewDefenderID),
  OlderDefenderName=playerNameUID:getPlayerNameByUID(OlderDefenderID),
  Content = stringCfg:getString(cnTextKingBattleAllAttackWin, [AttackerName,OlderDefenderName]),
  activityCommon:sendBroadcastNotice(Content) .

awardItemList2MailItems(ItemAwardList,RoleID)->
  ?DEBUG_OUT("=ItemAwardList========~p~n",[{ItemAwardList,RoleID}]),
  awardItemList2MailItems(ItemAwardList,[],RoleID).

awardItemList2MailItems([[ItemID, ItemNumber, IsBindInt]|T],MailItems,RoleID)->
  TempMailItems=playerMail:createMailGoods(ItemID, ItemNumber, IsBindInt =:= 0,0, RoleID, ?ItemSourceKingBattleAllAward),
  awardItemList2MailItems(T,TempMailItems ++ MailItems,RoleID);
awardItemList2MailItems([],MailItems,_RoleID)->
  MailItems.