%% @author wangjie
%% @doc @todo 玩家领取更新资源奖励


-module(playerUpdateReward).
-include("playerPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([initUpdateReward/0,
         initUpdateRewardFromDB/1,
         getMsgStruct/2,
		 getUpdateReward/1]).


%%玩家登陆地图初始化更新资源奖励
-spec initUpdateReward() -> ok.
initUpdateReward() ->
    case playerState:getIsPlayer() of
        true ->
            List = playerState:getUpdateReward(),
            RewardList = getMsgStruct(List, []),
            sendResultToClient(lists:reverse(RewardList)),
            ok;
        _ ->
            skip
    end,
	ok.

%%初始化数据库更新资源信息
-spec initUpdateRewardFromDB(#rec_ext_role{}) -> ok.
initUpdateRewardFromDB(#rec_ext_role{updateReward = UpdateReward}) ->
    case misc:size(UpdateReward) > 0 andalso is_list(UpdateReward) of
        true ->
            playerState:setUpdateReward(UpdateReward);
        _ ->
            playerState:setUpdateReward([{1, false},{2, false}])
    end,
    ok.

%%发送更新资源奖励
-spec getUpdateReward(Count) -> ok when Count :: uint().
getUpdateReward(Count) ->
    RewardList = playerState:getUpdateReward(),
    case lists:keyfind(Count,1,RewardList) of
        {Count,false} ->
            List = getGolbalValue(Count),
            #globalsetupCfg{setpara = SetPara} = List,
            case erlang:is_list(SetPara) of
                true ->
	                try
		                Fun = fun({ItemID, Number}) ->
			                case ItemID > 0 andalso Number > 0 of
				                true ->
					                Plog = #recPLogTSItem{
						                old = 0,
						                new = Number,
						                change = Number,
						                target = ?PLogTS_PlayerSelf,
						                source = ?PLogTS_UpdateResource,
						                gold = 0,
						                goldtype = 0,
						                changReason = ?ItemSourceUpdateResource,
						                reasonParam = Count
					                },
					                playerPackage:addGoodsAndMail(ItemID, Number, true, 0, Plog);
				                _ ->
					                skip
			                end
		                end,
		                lists:foreach(Fun, SetPara)
	                catch
		                _:Why ->
			                ?ERROR_OUT("error config reward of update client,[~p]",[Why])
	                end,
                    NewList = lists:keyreplace(Count, 1, RewardList, {Count, true}),
                    playerState:setUpdateReward(NewList),
	                playerSave:saveUpdateReward(NewList),

                    sendResultToClient(getMsgStruct(NewList, []));
                _ ->
                    skip
            end;
        _ ->
            skip
    end,
    ok.

%% ====================================================================
%% Internal functions
%% ====================================================================
%%发送奖励列表到客户端
sendResultToClient([]) ->
	ok;
sendResultToClient(RewardList) ->
    Msg = #pk_GS2U_GetRewardUpdateResource{resultList = RewardList},
    playerMsg:sendNetMsg(Msg),
    ok.

%%获取奖励的道具结构
getMsgStruct([], Acc) ->
    Acc;
getMsgStruct(RewardList, Acc) ->
    [{Count,Flag}|Last] = RewardList,
        List = getGolbalValue(Count),
		#globalsetupCfg{setpara = SetPara} = List,
		case misc:size(SetPara) > 0 of
		true ->
	        Fun1 = fun({Item, Num}) ->
	            #pk_UpdateReward
	            {
	                itemid = Item,
	                number = Num
	            }
	        end,
	        ItemList = lists:map(Fun1, SetPara),
	        Acc1 = [#pk_RewardUpdateResource{
	            count = Count,
	            flag = Flag,
	            rewardList = ItemList} | Acc];   
		_ ->
			Acc1 = Acc
		end,
		getMsgStruct(Last, Acc1).

%%判断领取奖励类型
getGolbalValue(Count) ->
    if
        Count =:= 1 ->
            getCfg:getCfgPStack(cfg_globalsetup, updategift_1);
        Count =:= 2 ->
            getCfg:getCfgPStack(cfg_globalsetup, updategift_2);
        Count =:= 3 ->
            #globalsetupCfg{};
        true ->
            #globalsetupCfg{}
    end.

