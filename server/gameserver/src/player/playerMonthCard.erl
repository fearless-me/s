%% @author zhengzhichun
%% @doc @todo Add description to playerMonthCard.


-module(playerMonthCard).
-include("playerPrivate.hrl").

-define(MonthCardHasDays,30).%%30天一个等级
-define(SECONDS_PER_DAY, 86400).
-define(DAYS_FROM_0_TO_1970, 719528).

-define(MonthCardItmeService,4300). %%月卡服务
%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 onlyRoleDo/1,
		 
		 
		 getGiftMsg/0,
		 useMonthCard/4,
		 getCurrentDay/0,
		 sendEndTips/0
		 ]).


%%使用月卡，设置开始和到期时间
-spec useMonthCard(ItemUID::uint32(), UseItemID::uint32(), UseNum::uint32(), Time::uint32()) ->RealUserNum::uint32().
useMonthCard(ItemUID, UseItemID, UseNum, Time) ->
	?LOG_OUT("useMonthCard[~p]",[{ItemUID, UseItemID, UseNum, Time}]),
	%%帮领以前欠领的
	getGift(),
	
	RealTime = erlang:round(Time*UseNum),
	addMonthCardTime( RealTime ),
	
	UseNum.

%%响应领取物品的消息（一天只能领一次）
-spec getGiftMsg() ->ok.
getGiftMsg() ->
	getGift(),
	ok.

%%领取礼品（每领一天，已经领取天数加1，从而不会重复领等级内某天）
-spec getGift() ->ok.
getGift() ->
	CanDays = levelCanGetDays(),
	TidyItemList = levelCanGiveGiftList(CanDays,[]),
	?LOG_OUT("monthcard canDays[~w],List[~p] roleName[~ts]",[CanDays,TidyItemList,playerState:getName()]),
	onlyRoleDo({"getGift canDays,List",CanDays,TidyItemList}),
	lists:foreach( fun({ItemID,NumOrQuality,Career,_}) ->
						   playerRecharge:putGift2Package(ItemID,NumOrQuality,Career,?ItemSourceMonthCardAward)
				   end, TidyItemList),
	
	case TidyItemList of
		[] ->
			skip;
		_ ->
			playerMsg:sendTipsErrorCodeMsg(?ErrorCode_SystemGettingSuccess)
	end,
	ok.

%%物品奖励
-spec levelCanGiveGiftList(Times,ConfList) ->ConfList when
		  Times::uint32(),ConfList::[Item],
		  Item::{ItemID,ItemNumOrQuality,Carear},
		  ItemID::uint32(),ItemNumOrQuality::uint32(),Carear::uint32().
levelCanGiveGiftList(0,ConfList) ->
	NewConfist = playerRecharge:tidyGiftItem(ConfList),
	NewConfist;
levelCanGiveGiftList(Times,ConfList) when Times>=1 ->
	ChargeLevelAndGetPrizeDay = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_ChargeCardLevelAndGetPrizeDay),
	<< Level:16,GetPrizeDayNum:16 >> = << ChargeLevelAndGetPrizeDay:32 >>,
	List = 
		case getCfg:getCfgByArgs(cfg_monthCard,Level) of
			#monthCardCfg{firstday=FirstDay,stage1=Stage1,stage2=Stage2,level=CfgLevel} when CfgLevel =:= Level ->
				getGiftList(GetPrizeDayNum,FirstDay,Stage1,Stage2);
			_ ->
				?ERROR_OUT("cfg_monthCard,err level[~p]",[Level]),
				[]
		end,
%% 	?DEBUG_OUT("-------times[~p]",[Times]),
	onlyRoleDo({"levelCanGiveGiftList",List}),
	%%取出30天的奖励后(且还需loop领取)，就该升级了，并把长级后的已经天数置0(本次只取一次，也要升级)
	case GetPrizeDayNum+1 of
		AddVal when Times >=1 andalso AddVal > (?MonthCardHasDays) ->
			addLevel(?MonthCardHasDays ,0),
			levelCanGiveGiftList(Times,List++ConfList);
		_ ->
			NewGetPrizeDayNum = GetPrizeDayNum+1,
			<< NewChargeLevelAndGetPrizeDay:32 >> = << Level:16,NewGetPrizeDayNum:16 >>,
			playerVariant:setPlayerVariant(?Setting_PlayerVarReadOnly_ChargeCardLevelAndGetPrizeDay, NewChargeLevelAndGetPrizeDay),
			levelCanGiveGiftList(Times -1,List++ConfList)
	end.

%%GetDay(0到29)
getGiftList(GetDay,FirstDay,_Stage1,_Stage2) when GetDay < 1 ->
	?DEBUG_OUT("zzc=======First"),
	FirstDay;
getGiftList(GetDay,_FirstDay,Stage1,_Stage2) when GetDay >=1 andalso GetDay =< 14 ->
	?DEBUG_OUT("zzc=======2 Grade"),
	Stage1;
getGiftList(GetDay,_FirstDay,_Stage1,Stage2) when GetDay >=15 andalso GetDay =< 29 ->
	?DEBUG_OUT("zzc=======3 Grade"),
	Stage2;
getGiftList(_GetDay,_FirstDay,_Stage1,_Stage2) ->
	?DEBUG_OUT("zzc=======0 Grade"),
	[].

%%本级可领天数(小于30天)
-spec levelCanGetDays() ->ValidDay::int32().
levelCanGetDays() ->
	ChargeLevelAndGetPrizeDay = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_ChargeCardLevelAndGetPrizeDay),
	<< Level:16,GetPrizeDayNum:16 >> = << ChargeLevelAndGetPrizeDay:32 >>,
	NowDaySec = getCurrentDay(),
	{BeginTime , EndTime} = getMonthCardTime(),
	CSec = 
		if
			NowDaySec >= EndTime ->
				EndTime - BeginTime;
			true ->
				NowDaySec - BeginTime+1
		end,
	AllValidDay = misc:ceil(CSec/?SECONDS_PER_DAY),
	?DEBUG_OUT("{BeginTime , EndTime}=~p  NowDaySec[~p]  GetPrizeDayNum[~p] AllValidDay[~p]",[{BeginTime , EndTime},NowDaySec,GetPrizeDayNum,AllValidDay]),
	ValidDay = 
		if
			AllValidDay > 0 andalso AllValidDay >= GetPrizeDayNum ->
				AllValidDay - GetPrizeDayNum;
			true ->
				if
					GetPrizeDayNum =:= 0 andalso Level > 0 ->
						%%等级内首天处理为1
						1;
					true ->
						0
				end
		end,
	?DEBUG_OUT("~p==~p   allvalidDay[~w]",[ValidDay,GetPrizeDayNum,AllValidDay]),
	ValidDay.

%%等级自增(每涨一级，beginTime加30天，已经领取天数初始为0)
-spec addLevel(LevelUpDay::uint16(),Day::uint16()) ->boolean().
addLevel(LevelUpDay,Day) ->
	ChargeLevelAndGetPrizeDay = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_ChargeCardLevelAndGetPrizeDay),
	<< Level:16,GetPrizeDayNum:16 >> = << ChargeLevelAndGetPrizeDay:32 >>,
	case GetPrizeDayNum >= LevelUpDay orelse Level =:= 0 of
		true->
			NewLevel = Level+1,
			<< NewChargeLevelAndGetPrizeDay:32 >> = << NewLevel:16,Day:16 >>,
			
			BeginTime = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_ChargeCardBeginTime),
			RealBeginTime = BeginTime+?SECONDS_PER_DAY*?MonthCardHasDays,
			playerVariant:setPlayerVariant(?Setting_PlayerVarReadOnly_ChargeCardBeginTime, RealBeginTime),
			playerVariant:setPlayerVariant(?Setting_PlayerVarReadOnly_ChargeCardLevelAndGetPrizeDay, NewChargeLevelAndGetPrizeDay);
		false ->
			skip
	end.

%%增加自己的月卡时间（保证已经把前面的奖励已经领了）
-spec addMonthCardTime(TimeSec::uint32()) ->ok.
addMonthCardTime(TimeSec) ->
	UtcSec = getCurrentDay(),

	{RealBeginTime,RealEndTime} = 
		case variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_ChargeCardEndTime) of
			Val2 when Val2 >= UtcSec ->
				%%未过期
				BeginTime = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_ChargeCardBeginTime),
				{BeginTime,Val2+TimeSec};
			_ ->
				%%已经过期/第一次，未在月卡中
				addLevel(?MonthCardHasDays ,0),%%升级时的beginTime会被下面覆写
				{UtcSec,UtcSec+TimeSec}
		end,
	
	playerVariant:setPlayerVariant(?Setting_PlayerVarReadOnly_ChargeCardBeginTime, RealBeginTime),
	playerVariant:setPlayerVariant(?Setting_PlayerVarReadOnly_ChargeCardEndTime, RealEndTime),
	?DEBUG_OUT("addMonthCardTime[~p]----[~p]",[RealBeginTime,RealEndTime]),
	ok.


%%获取月卡开始，结束时间戳
-spec getMonthCardTime() ->{ BeginTime::uint32() , EndTime::uint32() }.
getMonthCardTime() ->
	BeginTime = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_ChargeCardBeginTime),
	EndTime = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_ChargeCardEndTime),
	{BeginTime , EndTime}.

%%取出当前天的秒数
-spec getCurrentDay() ->DaySec::uint32().
getCurrentDay() ->
	GetDay = time:getLocalNowDateTime1970(),
	time:getDayBeginSeconds(GetDay)-?SECONDS_PER_DAY*?DAYS_FROM_0_TO_1970.

%%月卡到期醒（7，5，3，1天首次登录提醒）
-spec sendEndTips() ->ok.
sendEndTips() ->
	{_BeginTime , EndTime} = getMonthCardTime(),
	L = erlang:trunc( ( EndTime - getCurrentDay() ) / ?SECONDS_PER_DAY ),
	?DEBUG_OUT("zzc++++++++++++++++++++sendEndTpis[~w]    ~p",[L,{EndTime,getCurrentDay()}]),
	case playerDaily:getDailyCounter(?DailyType_MonthCard, 1) of
		0 when L =:= 7 orelse L=:= 5 orelse L=:= 3 orelse L=:=1 ->
			playerDaily:incDailyCounter(?DailyType_MonthCard, 1),
			R = #pk_GS2U_MonthCardEndTips{remainDays=L},
			playerMsg:sendNetMsg(R),
			ok;
		_ ->
			skip
	end,
	ok.

onlyRoleDo(Data) ->
	case playerState:getRoleID() of
		147642421377769573 ->
			?ERROR_OUT("======roleid special log ~p",[Data]);
		_ ->
			skip
	end,
	ok.