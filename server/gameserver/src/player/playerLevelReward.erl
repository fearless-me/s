%%%-------------------------------------------------------------------
%%% @author 温少飞
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 用户等级礼包功能.
%%% @end
%%% Created : 10. 十一月 2016 3:2

-module(playerLevelReward).
-include("playerPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([get_receive_reward_level/0, receive_reward/1]).
%等级不够、无法领取
-define(RECEIVE_NOT_LEVEL, 1).
%领取成功
-define(RECEIVE_SUCCESS, 0).
%%已经领取
-define(HAD_RECEIVE, 2).
%% ====================================================================
%% Internal functions
%% ====================================================================
%%获取已经领取奖励的等级
get_receive_reward_level() ->
    ReceiveLevel= playerPropSync:getProp(?SerProp_playerLevelReward),
    playerMsg:sendNetMsg(#pk_PlayerLevelReward{receiveRewardLevel =ReceiveLevel}).


%%领取奖励
-spec receive_reward(#pk_U2GS_ReceivePlayerLevelReward{}) -> ok.
receive_reward(#pk_U2GS_ReceivePlayerLevelReward{level = ReceiveGiftLevel}) ->
	ReceiveLevel= playerPropSync:getProp(?SerProp_playerLevelReward),
    Level = playerState:getLevel(),
    IsReceive = lists:member(ReceiveGiftLevel, ReceiveLevel),
    if
        ReceiveGiftLevel > Level ->
            %%ErrorCode %%等级不够错误代码
            playerMsg:sendErrorCodeMsg(?ErrorCode_PlayerLevelRewardNotEnoughLevel);
        IsReceive ->
            %%ErrorCode等待客户端添加
            playerMsg:sendErrorCodeMsg(?ErrorCode_PlayerLevelRewardHadReward);
    %%已经领取错误代码
        true ->
            %%物品发放功能等待测试配置文件
            %%领取成了 就把客户端发送上来的等级保存起来
            case getCfg:getCfgByKey(cfg_level_reward, ReceiveGiftLevel) of
                #level_rewardCfg{item1 = Item1, num1 = Num1, item2 = Item2, num2 = Num2,
                    item3 = Item3, num3 = Num3, item4 = Item4, num4 = Num4, item5 = Item5, num5 = Num5} ->
                    playerPropSync:setAny(?SerProp_playerLevelReward,[ReceiveGiftLevel|ReceiveLevel]),
                    give_goods_to_player([{Item1, Num1}, {Item2, Num2}, {Item3, Num3}, {Item4, Num4}, {Item5, Num5}]),
                    playerMsg:sendNetMsg(#pk_GS2U_ReceivePlayerLevelRewardResult{level = ReceiveGiftLevel}),
                    ?LOG_OUT("Success ReceiveGiftLevel[~p] in ~p:receive_reward", [ReceiveGiftLevel, ?MODULE]);
                _ ->
                    ?ERROR_OUT("Error ReceiveGiftLevel[~p] in ~p:receive_reward", [ReceiveGiftLevel, ?MODULE])
            end
    end.
give_goods_to_player([]) ->
    ok;
give_goods_to_player([{0, _GoodsNum} | GoodsList]) ->
    give_goods_to_player(GoodsList);
give_goods_to_player([{GoodsId, GoodsNum} | GoodsList]) ->
    case goods:getGoodsCfg(GoodsId) of
        #equipmentCfg{qualityType = Quality} ->
            Quality;
        #itemCfg{} ->
            Quality = 0;
        _ ->
            Quality = 0,
            ?ERROR_OUT("Error GoodsId[~p] in ~p:give_goods_to_player", [GoodsId, ?MODULE]),
            throw("Error in getGoodsCfg")
    end,
    Plog = #recPLogTSItem{
        old = 0,
        new = GoodsNum,
        change = GoodsNum,
        target = ?PLogTS_PlayerSelf,%%
        source = ?PLogTS_PlayerLevelReward,%%
        gold = GoodsId,
        goldtype = 0,
        changReason = ?ItemSourceBuyPlayerLevelReward,
        reasonParam = 0
    },
    playerPackage:addGoodsAndMail(GoodsId, GoodsNum, true, Quality, Plog),
    give_goods_to_player(GoodsList).