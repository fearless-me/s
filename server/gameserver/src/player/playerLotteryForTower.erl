%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 四月 2016 14:59
%%%-------------------------------------------------------------------
-module(playerLotteryForTower).
-author("wenshaofei").
-include("playerPrivate.hrl").
-include("../normal_otp/lottery_for_tower/lotteryForTowerPrivate.hrl").
-include("setupLang.hrl").

%% API
-export([random_award/1, flush_lottery_tower_info/1,flashBeginTimeEndTimeMsg/0]).
random_award(_) -> ok.
flush_lottery_tower_info(_) -> ok.
flashBeginTimeEndTimeMsg() -> ok.
%%
%%random_award(#pk_U2GS_LotteryForTowerRandonAward{randomNumber = RandomNumber,isShowPanel = IsShowPanel}) ->
%%    RoleName = playerState:getName(),
%%    Coin = playerState:getCoin(?CoinTypeDiamond),
%%    [LotteryForTowerCfg | _] = getCfg:getAllCfg(cfg_lotteryForTower),
%%    case is_enough_coin(RandomNumber, Coin, LotteryForTowerCfg) of
%%        {true, Price} ->
%%            case  playerDaily:getDailyCounter(?DailyType_LotteryForTowerID, 0) of
%%				0 ->
%%					CfgID=1;
%%				CfgID->
%%					CfgID
%%			end,
%%            case psMgr:call(?PsNameLotteryForTower, <<"random_award">>, {RoleName, CfgID, RandomNumber}, 5000) of
%%                {ok, LotteryForTowerCfgList} ->
%%                    ItemInfo = [{ItemID, ItemNumber,IsBindInt} || #lotteryForTowerCfg{item_id = ItemID, item_number = ItemNumber,is_binded = IsBindInt} <- LotteryForTowerCfgList],
%%					[#lotteryForTowerCfg{id = NewCfgID} | _] = lists:reverse(LotteryForTowerCfgList),
%%                    playerMoney:decCoin(?CoinTypeDiamond, Price, #recPLogTSMoney{reason = ?LotteryForTower, param = NewCfgID, target = ?PLogTS_LotteryForTower, source = ?PLogTS_PlayerSelf}),
%%                    playerDaily:incCounter(?DailyType_LotteryForTowerID, 0, NewCfgID),
%%                    give_item_to_player(ItemInfo),
%%                    case psMgr:call(?PsNameLotteryForTower, <<"get_lottery_for_tower_info">>, [], 5000) of
%%                        {ok, NoticeList, _,_} ->
%%                            ClientNoticeList = [#pk_lotteryForTowerNotice{roleName = RoleName,itemID =ItemId,itemNumber = ItemNumber} || #lottery_for_tower_notice{ item_id =  ItemId,item_number = ItemNumber,  role_name = RoleName} <- NoticeList];
%%                        CallErroeReason->
%%                            ?ERROR_OUT("lottery for tower rpc call error RoleInfo=~p,module info=~p,Reason=~p ", [{playerState:getRoleID(), RoleName}, {?MODULE, ?LINE}, CallErroeReason]),
%%                            ClientNoticeList=[]
%%                    end,
%%                    show_panel(IsShowPanel,ItemInfo),
%%                    RewardCfgList =   [CfgID || #lotteryForTowerCfg{id = CfgID} <- LotteryForTowerCfgList],
%%                    Msg=#pk_GS2U_LotteryForTowerRandonAward{
%%                        current_cfg_id=NewCfgID,
%%                        noticeList=lists:reverse(ClientNoticeList),
%%                        reward_cfg_id_list=RewardCfgList
%%                    },
%%                    playerMsg:sendNetMsg(Msg),
%%                    ?LOG_OUT("lottery for tower random success RoleInfo=~w,module info=~w,awardInfo=~w ", [{playerState:getRoleID(), RoleName}, {?MODULE, ?LINE},ItemInfo]);
%%                {error, Reason} ->
%%%%                   ?ERROR_OUT("Error [~p] in ~p:receive_reward", [ReceiveGiftLevel, ?MODULE]),
%%                    ?LOG_OUT("lottery for tower close RoleInfo=~p,module info=~p,Reason=~p ", [{playerState:getRoleID(), RoleName}, {?MODULE, ?LINE},Reason]),
%%                    playerMsg:sendErrorCodeMsg(?ErrorCode_CrosBattle_AcHasNotOpen);
%%                R ->
%%                    ?ERROR_OUT("lottery for tower rpc call error RoleInfo=~p,module info=~p,Reason=~p ", [{playerState:getRoleID(), RoleName}, {?MODULE, ?LINE}, R]),
%%                    playerMsg:sendErrorCodeMsg(?ErrorCode_CompanionIsNotcomming)
%%            end;
%%        {false,Price} when is_integer(Price) ->
%%            playerMsg:sendErrorCodeMsg(?ErrorCode_LotteryForTower_NotEnoughMoney);
%%		{false,R}->
%%			 ?ERROR_OUT("lottery for tower receive unkonw msg RoleInfo=~p,module info=~p,RandomNumber=~p,Reason=~p ", [{playerState:getRoleID(), RoleName}, {?MODULE, ?LINE},RandomNumber, R])
%%    end.
%%
%%
%%%%获取金宝塔信息
%%flush_lottery_tower_info(#pk_U2GS_LotteryForTowerInfo{  }) ->
%%    case psMgr:call(?PsNameLotteryForTower, <<"get_lottery_for_tower_info">>, [], 5000) of
%%        {ok, NoticeList,_, EndTime} ->
%%            NowSec = time:getUTCNowSec(),
%%            if
%%                (EndTime-NowSec)>0 ->
%%                    LastSec=EndTime-NowSec;
%%                true ->
%%                    LastSec=0
%%            end,
%%            case playerDaily:getDailyCounter(?DailyType_LotteryForTowerID, 0) of
%%                0 ->
%%                    CfgID=1;
%%                CfgID ->
%%                   CfgID
%%            end,
%%            ClientNoticeList = [#pk_lotteryForTowerNotice{roleName = RoleName,itemID =ItemId,itemNumber = ItemNumber} || #lottery_for_tower_notice{ item_id =  ItemId,item_number = ItemNumber,  role_name = RoleName} <- NoticeList],
%%            AllConfig =  [ #lotteryForTowerCfg{for_1 = OneTimeCost,for_10 = TenTimeCost,for_50 = FiftyTimeCost} | _] = getCfg:getAllCfg(cfg_lotteryForTower),
%%            ItemList = [#pk_lotteryForToweItem{pool_id=PoolID, cfg_id=ID, itemID=ItemId, itemNumber=ItemNumber,isBind =IsBind,isWin = IsWin }||#lotteryForTowerCfg{item_id = ItemId,item_number = ItemNumber, id=ID,pool_id = PoolID,is_binded = IsBind,is_win = IsWin}<-AllConfig],
%%            playerMsg:sendNetMsg(#pk_GS2U_LotteryForTowerInfo{
%%                current_cfg_id =CfgID,
%%                oneTimeCost=OneTimeCost,
%%                tenTimeCost=TenTimeCost,
%%                fiftyTimeCost=FiftyTimeCost,
%%                itemList = lists:reverse(ItemList) ,
%%                endTime = LastSec,
%%                noticeList =lists:reverse(ClientNoticeList )});
%%        R ->
%%            RoleName = playerState:getName(),
%%            ?LOG_OUT("lottery for tower rpc call error RoleInfo=~p,module info=~p,Reason=~p ", [{playerState:getRoleID(), RoleName}, {?MODULE, ?LINE}, R]),
%%            playerMsg:sendErrorCodeMsg(?ErrorCode_CompanionIsNotcomming)
%%    end.
%%%%刷新金宝塔开始时间和结束时间
%%flashBeginTimeEndTimeMsg() ->
%%    IsInCross = core:isCross(),
%%    case IsInCross of
%%        true  ->
%%            skip;
%%        _ ->
%%            case psMgr:call(?PsNameLotteryForTower, <<"get_lottery_for_tower_info">>, [], 5000) of
%%                {ok, _NoticeList, StartTime, EndTime} ->
%%                    Msg = lotteryForTowerLogic:getBeginTimeEndTImeMsg(StartTime, EndTime),
%%                    playerMsg:sendNetMsg(Msg);
%%                _ ->
%%                    ?ERROR_OUT("lottery for tower receive unkonw msg RoleInfo=~p,module info=~p ", [{playerState:getRoleID(), playerState:getName()}, {?MODULE, ?LINE}]),
%%                    Msg = lotteryForTowerLogic:getBeginTimeEndTImeMsg(0, 0),
%%                    playerMsg:sendNetMsg(Msg)
%%            end
%%    end.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%PRIVATE METHOD%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%判断用户是否有足够的宝石
%%is_enough_coin(1, Coin, #lotteryForTowerCfg{for_1 = OneTimeCost}) ->
%%    {Coin >= OneTimeCost, OneTimeCost};
%%is_enough_coin(10, Coin, #lotteryForTowerCfg{for_10 = TenTimeCost}) ->
%%    {Coin >= TenTimeCost, TenTimeCost};
%%is_enough_coin(50, Coin, #lotteryForTowerCfg{for_50 = FiftyTimeCost}) ->
%%    {Coin >= FiftyTimeCost, FiftyTimeCost};
%%is_enough_coin(_, _, _) -> {false,<<"error times">>}.
%%
%%give_item_to_player([]) ->
%%    ok;
%%give_item_to_player([{GoodsId, GoodsNum,IsBindInt} | GoodsList]) ->
%%    Quality= getItemQuality(GoodsId),
%%    Plog = #recPLogTSItem{
%%        old = 0,
%%        new = GoodsNum,
%%        change = GoodsNum,
%%        target = ?PLogTS_PlayerSelf,%%
%%        source = ?PLogTS_LotteryForTower,%%
%%        gold = GoodsId,
%%        goldtype = 0,
%%        changReason = ?ItemSourceLotteryForTower,
%%        reasonParam = 0
%%    },
%%    IsBind = IsBindInt=:=1,
%%    playerPackage:addGoodsAndMail(GoodsId, GoodsNum, IsBind, Quality, Plog),
%%    give_item_to_player(GoodsList).
%%
%%show_panel(true,RandomItemList) ->
%%    Fun = fun({ItemID, ItemNumber,IsBindInt}) ->
%%                Quality= getItemQuality(ItemID),
%%                #pk_UseItemGainGoodsTips{
%%                    itemID = ItemID,
%%                    itemNum = ItemNumber,
%%                    quality = Quality,
%%                    isBind = IsBindInt
%%                }
%%          end,
%%    Tips = lists:map(Fun, RandomItemList),
%%    Msg = #pk_GS2U_UseItemGainGoodsTips{
%%        listTips = Tips
%%    },
%%    playerMsg:sendNetMsg(Msg),
%%    ok;
%%show_panel(_,_)->
%%	ok.
%%
%%%%获取道具的品质
%%getItemQuality(ItemId)->
%%    case goods:getGoodsCfg(ItemId) of
%%        #equipmentCfg{qualityType = Quality} ->
%%            Quality;
%%        #itemCfg{} ->
%%             0;
%%        _ ->
%%            ?ERROR_OUT("Error ItemId[~p] in ~p:give_goods_to_player", [ItemId, {?MODULE, ?LINE}]),
%%            throw("Error in getGoodsCfg")
%%    end.