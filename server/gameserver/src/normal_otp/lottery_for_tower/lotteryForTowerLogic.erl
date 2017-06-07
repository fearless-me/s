%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%% 金宝塔活动逻辑模块
%%% @end
%%% Created : 26. 四月 2016 10:56
%%%-------------------------------------------------------------------
-module(lotteryForTowerLogic).
-author("wenshaofei").

-include("lotteryForTowerPrivate.hrl").

%% gen_server callbacks
-export([random_award/4, init/0,verify_date/1, reloadConfig/1, getBeginTimeEndTImeMsg/2]).


%%初始化金宝塔数据
-spec init() -> {ok, [#lotteryForTowerCfg{}]}|{error, term()}.
init() ->
    case memDBCache:getSundries(?Sundries_ID_LotteryForTower, 1) of
        [] ->
            %% 读取所有金宝塔配置信息
            CfgList = getCfg:getAllCfg(cfg_lotteryForTower),
            {{CurrentYear,CurrentMonth,CurrentDay},_}=calendar:local_time(),
            NowSec = time:getUTCNowSec(),
            Info = #lottery_for_tower_info{cfg_list = CfgList, last_reset_date = {{CurrentYear,CurrentMonth,CurrentDay},{03,59,59}}},
            memDBCache:dirtySaveSundries(?Sundries_ID_LotteryForTower, 1, Info),
            {ok, #lottery_for_tower_info{start_time=NowSec,end_time=NowSec, cfg_list = CfgList, last_reset_date =calendar:local_time()}};
        [#rec_sundries{value= Info}] when is_record(Info, lottery_for_tower_info) ->
            {ok, Info};
        DbData ->
            {error, {?MODULE, ?LINE, <<"DB data error">>, DbData}}
    end.
%%重新初始化配置文件
reloadConfig(Info)->
	CfgList = getCfg:getAllCfg(cfg_lotteryForTower),
	NewInfo = Info#lottery_for_tower_info{cfg_list = CfgList},
	memDBCache:dirtySaveSundries(?Sundries_ID_LotteryForTower, 1, NewInfo),
	NewInfo.
%%获取金宝塔持续时间消息协议
getBeginTimeEndTImeMsg(StarTime,EndTime)->
    NowSec = time:getUTCNowSec(),
    if
        NowSec>StarTime ->
            StartSubTime=0;
        NowSec<StarTime->
            StartSubTime=StarTime-NowSec;
        true ->
            StartSubTime=0
    end,
    if
        NowSec>EndTime ->
            EndSubTime=0;
        NowSec<EndTime->
            EndSubTime=EndTime-NowSec;
        true ->
            EndSubTime=0
    end,
    #pk_GS2U_LotteryForTowerBeginTimeEndTime{beginTime =StartSubTime,endTime =EndSubTime  }.

%%根据奖池ID来随机奖励
%%PoolId奖池ID
%%RandomNumber随机次数
%%CurrentServerPoolItem奖池内的奖品
-spec random_award(
	RoleName::list(),
    CfgID :: uint32(),
    RandomNumber :: integer(),
    Info :: #lottery_for_tower_info{}) ->
    { #lottery_for_tower_info{}, [#lotteryForTowerCfg{}]}.
random_award(RoleName, CfgID, RandomNumber, #lottery_for_tower_info{cfg_list = LotteryCfgList} = Info) ->
    {NewLotteryCfgList, RewardCfgDataList} = random_award1(CfgID, RandomNumber, LotteryCfgList, []),
    NewNoticeList = concat_award_notice(RoleName, Info, RewardCfgDataList),
    broad_cast_notice(RoleName, RewardCfgDataList),
    NewInfo =Info#lottery_for_tower_info{cfg_list = NewLotteryCfgList, notice_list = NewNoticeList},
    memDBCache:dirtySaveSundries(?Sundries_ID_LotteryForTower, 1, NewInfo),
    {NewInfo,RewardCfgDataList}.

random_award1(_CfgID, 0, LotteryCfgList, RewardCfgDataList) ->
    {LotteryCfgList, lists:reverse(RewardCfgDataList)};
random_award1(CfgID, RandomNumber, LotteryCfgList, RewardCfgDataList) ->
    case getLotteryCfgById(CfgID,LotteryCfgList) of
        #lotteryForTowerCfg{pool_id = ?MAX_POOL_ID} ->
            NextLotteryPoolId = ?MIN_POOL_ID;
        #lotteryForTowerCfg{pool_id = PoolID, is_win = ?WIN} ->
            NextLotteryPoolId = PoolID + 1;
        #lotteryForTowerCfg{pool_id = PoolID, is_win = ?FAIL} when PoolID > ?MIN_POOL_ID ->
            NextLotteryPoolId = PoolID - 1;
        #lotteryForTowerCfg{pool_id = PoolID, is_win = ?FAIL} when PoolID =:= ?MIN_POOL_ID ->
            NextLotteryPoolId = ?MIN_POOL_ID
    end,
    {NewLotteryCfgList, #lotteryForTowerCfg{id=NewID}= RewardCfgData} = randomInPool(NextLotteryPoolId, LotteryCfgList),
    random_award1(NewID, RandomNumber - 1, NewLotteryCfgList, [RewardCfgData | RewardCfgDataList]).

broad_cast_notice(_RoleName, []) ->
    ok;
broad_cast_notice(RoleName, [#lotteryForTowerCfg{need_brodcast = 1, item_id = ItemId, item_number = ItemNumber} | T]) ->
    #itemCfg{name = Name} = getCfg:getCfgByArgs(cfg_item, ItemId),
    Notify = stringCfg:getString(lotteryForTowerBroadcast, [RoleName, Name, ItemNumber]),
    core:sendBroadcastNotice(Notify),
    broad_cast_notice(RoleName, T);
broad_cast_notice(RoleName, [_|T])->
	 broad_cast_notice(RoleName, T).

%%通过ID来获取宝金塔配置信息
getLotteryCfgById(ID, LotteryCfgList) ->
    lists:keyfind(ID, #lotteryForTowerCfg.id, LotteryCfgList).

%%在奖池里面抽奖
randomInPool(PoolID, LotteryCfgList) ->
    WeightInfoList = get_weight_info_list(LotteryCfgList, PoolID, []),
    LotteryCfgID = misc:calcOddsByWeightList(WeightInfoList),
    case getLotteryCfgById(LotteryCfgID, LotteryCfgList) of
        #lotteryForTowerCfg{pool_times_perday = ?AWARD_TIMES_PERDAY_NO_LIMIT} = AwardLotteryCfg ->
            AwardLotteryCfg;
        #lotteryForTowerCfg{pool_times_perday = CurrentTimes} = TempAwardLotteryCfg ->
            AwardLotteryCfg = TempAwardLotteryCfg#lotteryForTowerCfg{pool_times_perday = CurrentTimes - 1}
    end,
    NewLotteryCfg = lists:keyreplace(LotteryCfgID, #lotteryForTowerCfg.id, LotteryCfgList, AwardLotteryCfg),
    {NewLotteryCfg, AwardLotteryCfg}.
%%获取权重列表信息
get_weight_info_list([], _PoolID, WeightInfoList) ->
    WeightInfoList;
get_weight_info_list([#lotteryForTowerCfg{pool_id = PoolID, pool_times_perday = Times, item_weight = Weight, id = ID}|T], PoolID, WeightInfoList) when (Times =:= ?AWARD_TIMES_PERDAY_NO_LIMIT) or (Times > 0) ->
     get_weight_info_list(T, PoolID, [{Weight, ID} | WeightInfoList]);
get_weight_info_list([_| T], PoolID, WeightInfoList) ->
    get_weight_info_list(T, PoolID, WeightInfoList).

%%将奖励信息连接起来
concat_award_notice(RoleName, #lottery_for_tower_info{notice_list = OldNoticeList}, RewardCfgDataList) ->
    AwardNoticeList = [#lottery_for_tower_notice{role_name = RoleName,item_number = ItemNumber,item_id = ItemId} || #lotteryForTowerCfg{item_number = ItemNumber,item_id = ItemId,is_record = IsRecord } <- RewardCfgDataList,IsRecord=:=1],
    LotteryForTowerNoticeMaxNumber = globalCfg:getGlobalCfg(lotteryForTowerShow),
    AllNoticeList = lists:append(OldNoticeList, AwardNoticeList),
    AllNoticeNumber = erlang:length(AllNoticeList),
    if
        AllNoticeNumber > LotteryForTowerNoticeMaxNumber ->
            Start = (AllNoticeNumber-LotteryForTowerNoticeMaxNumber)+1 ;
        true ->
            Start = 1
    end,
    lists:sublist(AllNoticeList, Start, AllNoticeNumber).

verify_date( #lottery_for_tower_info{last_reset_date =InitDate,start_time = StartTime,end_time = EndTime}=Info)->

    {{CurrentYear, CurrentMonth, CurrentDay}, _} = Now = calendar:local_time(),
    NowSec = time:getUTCNowSec(),
    if
        (StartTime=<NowSec) and (NowSec=<EndTime) ->
            IsStart=true;
        true ->
            IsStart=false
    end,
    if
        IsStart ->
            case calendar:time_difference(InitDate, Now) of
                {Day, _} when Day > 0 ->
                    %% 读取所有金宝塔配置信息
                    CfgList = getCfg:getAllCfg(cfg_lotteryForTower),
                    ResetInfo = Info#lottery_for_tower_info{cfg_list = CfgList, last_reset_date = {{CurrentYear, CurrentMonth, CurrentDay}, {03, 59, 59}}},
                    memDBCache:dirtySaveSundries(?Sundries_ID_LotteryForTower, 1, ResetInfo),
                    {ok,ResetInfo} ;
                _ ->
                    {ok,Info}
            end;
        true ->
            {error, <<"active_close">>}
    end.