%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc乱世为王战场触发器模块
%%%
%%% @end
%%% Created : 21. 九月 2016 11:00
%%%-------------------------------------------------------------------
-module(acLSBattlefieldTrigger).
-author("wenshaofei").

-include("../../activityPrivate.hrl").
-include("../activityPhaseDefine.hrl").
-include("acLSBattlefieldPrivate.hrl").
%% API
-compile(export_all).

%%发送排名奖励
%% argu=[[【大经验丹道具id，大经验丹经验值】，【小经验丹道具id，小经验丹经验值】],RankItemAwardList=[【排名开始值，排名结束值，道具id，道具个数，是否绑定】]]
sendRankAward(#triggerCfg{id = TriggerID, argu = [[[BigExpItemID, BigExpValue], [SamllExpItemID, SmallExpValue]] | RankItemAwardList]} = Cfg, ProgramArgs, FromCondationArgu) ->
    LSMembers = ets:tab2list(recLSMemberInfo),
    AwardFun =
        fun(#recLSMemberInfo{roleID = RoleID, rank = Rank, score = Score,isInActive = IsInActive}) ->
            [playerMail:createMailGoods(ItemID, ItemNumber, IsBindInt =:= 0, RoleID, ?ItemSourceACLSBattlefield) || {RankBegin, RankEnd, ItemID, ItemNumber, IsBindInt} <- RankItemAwardList, RankBegin =< Rank, Rank =< RankEnd],
            RankItemsMsg = [#pk_lsbattlefield_award{itemid=ItemID, number=ItemNumber,isBind =IsBindInt } || {RankBegin, RankEnd, ItemID, ItemNumber, IsBindInt} <- RankItemAwardList, RankBegin =< Rank, Rank =< RankEnd],
            [#rec_base_role{level = LV}] = ets:lookup(ets_rec_base_role, RoleID),
            Exp = LV * 200000 + Score * 10000,
            BigExpItemNumber = Exp div BigExpValue,
            if
                BigExpItemNumber > 0 ->
                    BigExpItems = playerMail:createMailGoods(BigExpItemID, BigExpItemNumber, true, 0, RoleID, ?ItemSourceACLSBattlefield),
                    BigExpItemmAwardMsg = [#pk_lsbattlefield_award{itemid = BigExpItemID, number = BigExpItemNumber,isBind = 0}];
                true ->
                    BigExpItems = [],
                    BigExpItemmAwardMsg = []
            end,
            SmallExpItemNumber = (Exp - BigExpItemNumber * BigExpValue) div SmallExpValue,
            if
                SmallExpItemNumber > 0 ->
                    SmallExpItems = playerMail:createMailGoods(SamllExpItemID, SmallExpItemNumber,true, 0, RoleID, ?ItemSourceACLSBattlefield),
                    SmallExpItemmAwardMsg = [#pk_lsbattlefield_award{itemid = SamllExpItemID, number = SmallExpItemNumber,isBind = 0}];
                true ->
                    SmallExpItems = [],
                    SmallExpItemmAwardMsg = []
            end,
            ExpItems = SmallExpItems++BigExpItems,
            BindCoind = LV * 200000 + Score * 10000,
            MailCoin = playerMail:createMailCoin(?CoinTypeGold, BindCoind),
            Title = stringCfg:getString(lsBattleFiledRankAwardTitle),
            Content = stringCfg:getString(lsBattleFiledRankAwardContext),
            mail:sendSystemMail(RoleID, Title, Content, [MailCoin] ++ ExpItems, erlang:integer_to_list(TriggerID)),
          ?DEBUG_OUT("======111111111111111111=============~p~n",[{ets:lookup(ets_rec_OnlinePlayer, RoleID),IsInActive}]),
            case ets:lookup(ets_rec_OnlinePlayer, RoleID) of
                [#rec_OnlinePlayer{netPid = NetPid}] when IsInActive=:=true ->
                    Notify = #pk_GS2U_lsbattlefield_award_list{index =Rank , coinType = ?CoinTypeGold, coinValue = BindCoind, award_list = SmallExpItemmAwardMsg ++ BigExpItemmAwardMsg++RankItemsMsg},
                    gsSendMsg:sendNetMsg(NetPid, Notify);
                _R ->
                    ok
            end
        end,
  lists:foreach(
    fun(LSMemberInfo) ->
      erlang:spawn(
        fun() ->
          try
            AwardFun(LSMemberInfo)
          catch
            ErrorInfo:Reason ->
              ?ERROR_OUT(" acLSBattleLogic Award exception LSMemberInfo:~p, ErrorInfo:~p,Reason:~p,stack:~p~n", [LSMemberInfo, ErrorInfo, Reason, erlang:get_stacktrace()])
          end
        end)
    end,
    LSMembers),
    triggerLib:getSuccessReturn(Cfg, ProgramArgs, FromCondationArgu).

%%添加分数
addScore(#triggerCfg{argu = [AddScoreValue]} = Cfg, ProgramArgs, FromCondationArgu) ->
  {ok, #rec_base_role{roleID = ID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgramArgs),
  acLSBattlefieldLogic:addScore(ID, AddScoreValue),
  triggerLib:getSuccessReturn(Cfg, ProgramArgs, FromCondationArgu).

%%修改乱世为王活动状态
changeActiveState(#triggerCfg{argu = [NewState]} = Cfg, ProgramArgs, FromCondationArgu) ->
  acLSBattlefieldLogic:changeActiveState(NewState),
  triggerLib:getSuccessReturn(Cfg, ProgramArgs, FromCondationArgu).

%%增加杀人次数
addKillPlayerNumber(#triggerCfg{argu = [AddValue]} = Cfg, ProgramArgs, FromCondationArgu) ->
  {ok, #rec_base_role{roleID = ID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgramArgs),
  {ok,[_TargetType,KillRoleID]}=logicLib:getLogicArguValue(?LK_KILL_TARGET_TYPE_ID,ProgramArgs),
 
  acLSBattlefieldLogic:addKillPlayerNumber(ID, AddValue),
  acLSBattlefieldLogic:addRevenge(KillRoleID,ID),
  triggerLib:getSuccessReturn(Cfg, ProgramArgs, FromCondationArgu).


removeFromRevengeList(#triggerCfg{} = Cfg, ProgramArgs, FromCondationArgu) ->
  {ok, #rec_base_role{roleID = ID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgramArgs),
  {ok,[_TargetType,KillRoleID]}=logicLib:getLogicArguValue(?LK_KILL_TARGET_TYPE_ID,ProgramArgs),

  acLSBattlefieldLogic:removeFromRevenge(ID,KillRoleID),
  triggerLib:getSuccessReturn(Cfg, ProgramArgs, FromCondationArgu).