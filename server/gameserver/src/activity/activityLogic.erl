%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 活动模块逻辑处理
%%% @end
%%% Created : 29. 十二月 2014 17:43
%%%-------------------------------------------------------------------
-module(activityLogic).
-author("tiancheng").

-include("activityPrivate.hrl").

-define(LenghtTimeMax, 3600).

%% API
-export([
	init/0,
	fresh/0,
	setActivePhase/2,
	getActivePhase/1,
	getActivityDataAck/1,
	isActivityValid/1,
	setIsLoadSuccess/1,
	getIsLoadSuccess/0,
	addwaitGetActivityData/1,
	setIsLoadDataInitEnd/1,
	getIsLoadDataInitEnd/0,
	setwaitGetActivityData/1,
	getwaitGetActivityData/0
]).
-export([gm_start_activity/2]).
-spec init() -> ok.
init() ->
	ok.

%% 活动是否有效
-spec isActivityValid(ID::activityType()) -> boolean().
isActivityValid(ID) ->
	activity:isActivityValid(ID).

%% 活动刷新
-spec fresh() -> ok.
fresh() ->
	Fun =
		fun(#rec_activity{id = ID, phase = Phase} = Activity, _) ->
			IsValid =
				case getCfg:getCfgByArgs(cfg_activity,ID) of
					#activityCfg{cycletype = ACType} ->
						if
							?ActivityCycle_Close =:= ACType ->
								%% 活动关闭
								false;
							?ActivityCycle_Forever =:= ACType ->
								%% 永久活动，不进入阶段
								false;
%%										?ActivityCycle_IGNORE =:= ACType ->
%%											%% 忽略活动自身的状态变更、状态更替交给活动自身来实现
%%											false;
							true ->
								true
						end;
					_ ->
						%% 没找到配置
						false
				end,
			case IsValid of
				true ->
					case activity:queryActivitySwitch(ID) of
						true ->
							case Phase of
								?ActivityPhase_Close ->
									%% 这个活动上次已经结束
									freshInit(Activity);
								_ ->
									%% 这个活动正在运行
									freshGoon(Activity)
							end;
						_ ->
							skip
					end;
				_ ->
					skip
			end,
			ok
		end,
	ets:foldl(Fun, 0, ?AcEts),

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%% LUN-844 20161222 begin
	%% 问题：地图没人后会被销毁，销毁后无法正常刷新wildboss，而系统公告是刷新的时候再广播的
	%% 解决：将mapWildboss.erl中关于公告的广播转移到activityOtp的心跳消息中处理
	wildBossNotice(),
	%% LUN-844 20161222 end
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	ok.

%% 活动初始化刷新
-spec freshInit(#rec_activity{}) -> ok.
freshInit(#rec_activity{id = ID, starttime = _LastStartTime, phasetime = LastPhaseTime} = Activity) ->
	NowTime = time:getSyncTime1970FromDBS(),
	case NowTime > LastPhaseTime of
		true ->
			#activityCfg{cycletype = CycleType} = Conf =
				case getCfg:getCfgPStack(cfg_activity, ID) of
					#activityCfg{stage = []} = C1 ->
						C1#activityCfg{stage = [0]};
					C2 ->
						C2
				end,
			case canfreshInit(CycleType, Activity, Conf) of
				false ->
					skip;
				NewTime when erlang:is_integer(NewTime) andalso NewTime > 0 andalso NewTime >= LastPhaseTime ->
					[#rec_activity{phase = Phase} = R] = ets:lookup(?AcEts, ID),
					NPhase = Phase + 1,
					ets:update_element(?AcEts, ID,
						[
							{#rec_activity.starttime, NewTime},
							{#rec_activity.phasetime, NewTime},
							{#rec_activity.phase, NPhase}
						]),
					?DEBUG_OUT("=======NPhase=========~p~n",[{ID,NPhase}]),
					NR = R#rec_activity{starttime = NewTime, phasetime = NewTime, phase = NPhase},

					%% 保存数据库
					saveActivityData(NR),

					%% 活动改变回调
					activityChangeCallBack(NR),
					ok;
				_NewTime ->
%%					?ERROR_OUT("freshInit failed ID[~p] LastStartTime[~ts] LastPhaseTime[~ts] NewTime[~ts]",
%%						[ID, getTimeStr(LastStartTime), getTimeStr(LastPhaseTime), getTimeStr(NewTime)])
					skip
			end;
		_ ->
%%			?ERROR_OUT("activity failed ID[~p] LastStartTime[~ts] LastPhaseTime[~ts] NowTime[~ts]",
%%				[ID, getTimeStr(LastStartTime), getTimeStr(LastPhaseTime), getTimeStr(NowTime)]),
			skip
	end.

%%直接设置活动当前的阶段（主要用在流程控制业务中）
-spec setActivePhase(ActivityID::uint(), Phase::uint()) ->ok.
setActivePhase(ActivityID, Phase) ->
	NowTime = time:getSyncTime1970FromDBS(),
	setActivePhase(ActivityID, Phase, NowTime).
setActivePhase(ActivityID, Phase, PhaseTime) ->
	case ets:update_element(?AcEts, ActivityID, [{#rec_activity.phasetime, PhaseTime}, {#rec_activity.phase, Phase}]) of
		true ->
			[NActivity|_] = ets:lookup(?AcEts, ActivityID),

			%% 保存数据库
			saveActivityData(NActivity),

			%% 活动改变回调
			activityChangeCallBack(NActivity);
		false ->
			skip
	end,
	ok.

%%获取活动当前的阶段（主要用在流程控制业务中）
-spec getActivePhase(ActivityID::uint()) ->ok.
getActivePhase(ActivityID) ->
	case ets:lookup(?AcEts, ActivityID) of
		[#rec_activity{phase=Phase}] ->
			{ok,Phase};
		[] ->
			{error,none}
	end.

%% 活动过程中时间刷新
-spec freshGoon(#rec_activity{}) -> ok.
freshGoon(#rec_activity{id = ID, starttime = StartTime, phase = Phase, phasetime = PhaseTime}) ->
	#activityCfg{lenghtime = LengthTime, stage = StageList = [First|_]} =
		case getCfg:getCfgPStack(cfg_activity, ID) of
			#activityCfg{stage = []} = C1 ->
				C1#activityCfg{stage = [0]};
			C2 ->
				C2
		end,

	NowTime = time:getSyncTime1970FromDBS(),
	case NowTime - StartTime < LengthTime of
		true ->
			%% 活动还在进行中
			case erlang:is_list(StageList) andalso First > 0 of
				true ->
					%% 当前阶段小于总的阶段数
					case Phase < erlang:length(StageList) of
						true ->
							NextTime = lists:nth(Phase, StageList),
							case NowTime - PhaseTime >= NextTime of
								true ->
									%% 进入下一个阶段
									setActivePhase(ID, Phase + 1, NowTime);
								_ ->
									skip
							end;
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			%% 活动已经结束
			setActivePhase(ID, ?ActivityPhase_Close, NowTime)
	end,
	ok.

%% 活动改变回调
activityChangeCallBack(#rec_activity{starttime = STime, phasetime = PTime} = Activity) ->
	case getIsLoadDataInitEnd() of
		true ->
			%% 第一次心跳完了再同步给GS
			%% 广播给所有GS，活动阶段改变
%%			csSendMsg:sendMsg2AllGSServer(activityChangeMsg, Activity),
			psMgr:sendMsg2PS(?PsNameActivityMgr, activityChangeMsg, Activity),
			NowTime = time:getSyncTime1970FromDBS(),
			?LOG_OUT("activityChangeCallBack:~p,nowtime=~ts,stime=~ts,ptime=~ts",
				[Activity, getTimeStr(NowTime), getTimeStr(STime), getTimeStr(PTime)]),
			ok;
		_ ->
			skip
	end,
	ok.

getTimeStr(0) -> "";
getTimeStr(Time) -> time:convertSec2DateTimeStr(Time).

%% 能否重新刷新活动
canfreshInit(?ActivityCycle_Hour, #rec_activity{}, #activityCfg{}) ->
	%% 每小时
	NowTime = time:getSyncTime1970FromDBS(),
	{{Year, Month, Day}, {Hour, Minute, _Second}} = time:convertSec2DateTime(NowTime),
	case isAllowMargin(Minute) of
		true ->
			time:convertDateTime1970ToSec({{Year, Month, Day}, {Hour, 0, 0}});
		_ ->
			false
	end;
canfreshInit(?ActivityCycle_Day, #rec_activity{id = ID}, #activityCfg{starttime = StartTimeList, lenghtime = LenghTime, stage = [First|_]}) ->
	%% 每天
	case erlang:is_list(StartTimeList) andalso length(StartTimeList) > 0 of
		true ->
			NowTime = time:getSyncTime1970FromDBS(),
			{{Year, Month, Day}, {Hour, Minute, _Second}} = time:convertSec2DateTime(NowTime),

			%% 判断是不是指定开始时间
			case lists:member({0, Hour}, StartTimeList) andalso isAllowMargin(Minute) of
				true ->
					time:convertDateTime1970ToSec({{Year, Month, Day}, {Hour, 0, 0}});
				_ ->
					%% 如果活动持续时间大于一个小时，则再次判断是否打开活动
					case LenghTime > ?LenghtTimeMax andalso First =:= 0 of
						true ->
							case lists:filter(fun({0, H}) -> H =< Hour end, lists:reverse(StartTimeList)) of
								[{0, HH}|_] ->
									Time = time:convertDateTime1970ToSec({{Year, Month, Day}, {HH, 0, 0}}),
									case NowTime - Time < LenghTime - 300 of
										true ->
%%											?LOG_OUT("day activity start special:~p", [ID]),
											Time;
										_ ->
											false
									end;
								_ ->
									false
							end;
						_ ->
							false
					end
			end;
		_ ->
			?ERROR_OUT("canfreshInit:~p,~p", [ID, ?ActivityCycle_Day]),
			false
	end;
canfreshInit(?ActivityCycle_Week, #rec_activity{id = ID}, #activityCfg{starttime = StartTimeList, lenghtime = LenghTime, stage = [First|_]}) ->
	%% 每周
	case erlang:is_list(StartTimeList) andalso length(StartTimeList) > 0 of
		true ->
			NowTime = time:getSyncTime1970FromDBS(),
			%% 判断是不是整周
			{{Year, Month, Day}, {Hour, Minute, Second}} = time:convertSec2DateTime(NowTime),
			%% 7表示星期天，1表示星期一
			Week = calendar:day_of_the_week(Year, Month, Day),

			case lists:member({Week, Hour}, StartTimeList) andalso isAllowMargin(Minute) of
				true ->
					time:convertDateTime1970ToSec({{Year, Month, Day}, {Hour, 0, 0}});
				_ ->
					%% 错过正常开启时间，则检测是否报名时间很长
					case LenghTime > ?LenghtTimeMax andalso First > ?LenghtTimeMax of
						true ->
							case lists:keyfind(Week, 1, StartTimeList) of
								{Week, HH} when HH =< Hour ->
									case ((Hour - HH) * 3600 + Minute * 60 + Second) < (First - 300) of
										true ->
%%											?LOG_OUT("week activity start special:~p", [ID]),
											time:convertDateTime1970ToSec({{Year, Month, Day}, {HH, 0, 0}});
										_ ->
											false
									end;
								_ ->
									false
							end;
						_ ->
							false
					end
			end;
		_ ->
			?ERROR_OUT("canfreshInit:~p,~p", [ID, ?ActivityCycle_Week]),
			false
	end;
canfreshInit(?ActivityCycle_Month, #rec_activity{id = ID}, #activityCfg{starttime = StartTimeList}) ->
	%% 每月
	case erlang:is_list(StartTimeList) andalso length(StartTimeList) > 0 of
		true ->
			NowTime = time:getSyncTime1970FromDBS(),
			{{Year, Month, Day}, {Hour, Minute, _Second}} = time:convertSec2DateTime(NowTime),

			case lists:member({Day, Hour}, StartTimeList) andalso isAllowMargin(Minute) of
				true ->
					time:convertDateTime1970ToSec({{Year, Month, Day}, {Hour, 0, 0}});
				_ ->
					false
			end;
		_ ->
			?ERROR_OUT("canfreshInit:~p,~p", [ID, ?ActivityCycle_Month]),
			false
	end;
canfreshInit(?ActivityCycle_Other, #rec_activity{id = ID, starttime = StartTime, phasetime = EndTime}, #activityCfg{cycletime = CycleTime}) ->
	%% 按秒的周期
	case CycleTime > 0 of
		true ->
			NowTime = time:getSyncTime1970FromDBS(),
			if
				EndTime =:= 0 ->
					NowTime;
				NowTime - StartTime >= CycleTime ->
					NowTime;
				true ->
					false
			end;
		_ ->
			?ERROR_OUT("canfreshInit:~p,~p", [ID, ?ActivityCycle_Other]),
			false
	end.

%% 从数据库中加载了活动数据
-spec getActivityDataAck(List::[#rec_activity{}|_]) -> ok.
getActivityDataAck(List) ->
	Fun =
		fun(#rec_activity{id = ID} = Activity, IDList) ->
			case getCfg:getCfgPStack(cfg_activity, ID) of
				#activityCfg{} ->
					StartTime = time:dateTimeToInt64(Activity#rec_activity.starttime),
					PhaseTime = time:dateTimeToInt64(Activity#rec_activity.phasetime),
					R = #rec_activity{
						id = ID,
						starttime = StartTime,
						phasetime = PhaseTime,
						phase = Activity#rec_activity.phase
					},
					ets:insert(?AcEts, R),
					[ID | IDList];
				_ ->
					?ERROR_OUT("activity is delete from config:~p", [Activity]),
					IDList
			end
		end,
	L = lists:foldl(Fun, [], List),

	%% 获取配置中的新活动，加入到ets中
	L_Conf = getCfg:get1KeyList(cfg_activity),

	New_L = lists:subtract(L_Conf, L),
	FunAdd =
		fun(IDIndex) ->
			case getCfg:getCfgPStack(cfg_activity, IDIndex) of
				#activityCfg{type = 0} ->
					RR = #rec_activity{
						id = IDIndex,
						starttime = 0,
						phasetime = 0,
						phase = ?ActivityPhase_Close
					},
					ets:insert(?AcEts, RR),

					%% 保存数据
					saveActivityData(RR);
				_ ->
					skip
			end
		end,
	lists:foreach(FunAdd, New_L),
	ok.

%% 保存活动数据到数据库
saveActivityData(#rec_activity{} = Activity) ->
	StartTime = Activity#rec_activity.starttime,
	PhaseTime = Activity#rec_activity.phasetime,
	StartTimeStr = case StartTime > 0 of
					   true ->
						   time:convertSec2DateTimeStr(StartTime);
					   _ ->
						   "1970-01-01 00:00:00"
				   end,

	PhaseTimeStr = case PhaseTime > 0 of
					   true ->
						   time:convertSec2DateTimeStr(PhaseTime);
					   _ ->
						   "1970-01-01 00:00:00"
				   end,

	gsSendMsg:sendMsg2DBServer(saveActivityData, 0,
		Activity#rec_activity{starttime = StartTimeStr, phasetime = PhaseTimeStr}),
	ok.

%% 分钟是否在允许的误差范围
isAllowMargin(Minute) ->
	Minute >= ?MarginMinuteMin andalso Minute =< ?MarginMinuteMax.

setIsLoadSuccess(B) ->
	put('IsLoadSuccess', B).

getIsLoadSuccess() ->
	case get('IsLoadSuccess') of
		undefined -> false;
		B -> B
	end.

addwaitGetActivityData(PID) ->
	L = getwaitGetActivityData(),
	NL =
		case lists:member(PID, L) of
			false ->
				[PID | L];
			true ->
				L
		end,
	setwaitGetActivityData(NL),
	ok.

getwaitGetActivityData() ->
	case get('waitGetActivityData') of
		undefined -> [];
		L -> L
	end.

setwaitGetActivityData(L) ->
	put('waitGetActivityData', L).

getIsLoadDataInitEnd() ->
	case get('IsLoadDataInitEnd') of
		undefined -> false;
		B -> B
	end.

setIsLoadDataInitEnd(B) ->
	put('IsLoadDataInitEnd', B).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LUN-844 20161222 begin
%% 问题：地图没人后会被销毁，销毁后无法正常刷新wildboss，而系统公告是刷新的时候再广播的
%% 解决：将mapWildboss.erl中关于公告的广播转移到activityOtp的心跳消息中处理
-spec wildBossNotice() -> ok.
wildBossNotice() ->
	NowTime = time:getSyncTime1970FromDBS(),
	FunCheck =
		fun(#recWildBossInfo{nextRefreshTime = NRTime, isNotice = IsNotice, mapID = MapID, bossID = BossID}, R) ->
			case NowTime >= NRTime andalso IsNotice =:= false of
				true ->
					%% 给在线玩家发系统信息
					#mapsettingCfg{desc = MapName} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
					#monsterCfg{showName = BossName} = getCfg:getCfgPStack(cfg_monster, BossID),
					Text = stringCfg:getString(cnTextWildBossRefresh, [BossName, MapName]),
					?LOG_OUT("initWildBoss:~p,~ts,~p,~ts,~ts", [MapID,MapName,BossID,BossName,Text]),
					core:sendBroadcastNotice({?NBroadCastColor, Text}),
					psMgr:sendMsg2PS(?PsNamePlayerMgr, wildBossRefresh, Text),
					%% 设置已经公告
					myEts:updateEts(?TABLE_WildBoss, BossID,
						[
							{#recWildBossInfo.isNotice, true}
						]),
					case lists:member(MapID,R) of
						true->
							R;
						_ ->
							[MapID | R]
					end;
				_ ->
					R
			end
		end,
	case ets:foldl(FunCheck, [], ?TABLE_WildBoss) of
		[] ->
			skip;
		Msg ->
			%% 优化：发送消息给可能存在的地图进程进行刷怪，避免心跳误差产生的大概率刷新延迟现象
			%% 1.向管理者发送刷新消息
			psMgr:sendMsg2PS(?PSNameNormalMapMgr, wildbossFresh, Msg)
	end,
	ok.
%%通过GM指令前置开启活动
gm_start_activity(ID,NPhase) ->
	NowTime = time:getSyncTime1970FromDBS(),
	{{Year, Month, Day}, {Hour, Minute, Second}} = time:convertSec2DateTime(NowTime),
	Time = time:convertDateTime1970ToSec({{Year, Month, Day}, {Hour, Minute, Second}}),
	[#rec_activity{} = R] = ets:lookup(?AcEts, ID),
	ets:update_element(?AcEts, ID,
		[
			{#rec_activity.starttime, Time},
			{#rec_activity.phasetime, Time},
			{#rec_activity.phase, NPhase}
		]),
	NR = R#rec_activity{starttime = Time, phasetime = Time, phase = NPhase},
	%% 保存数据库
	saveActivityData(NR),
	%% 活动改变回调
	activityChangeCallBack(NR).
%% LUN-844 20161222 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%