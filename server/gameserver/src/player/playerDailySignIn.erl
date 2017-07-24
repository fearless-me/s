%%%
%%%-------------------------------------------------------------------
%%% @author 罗维
%%% @copyright (C) 2014, <haowan123>
%%% @doc
%%% 玩家每日签到
%%% @end
%%% Created : 29. 二月 2016 11:59
%%%-------------------------------------------------------------------

-module(playerDailySignIn).
-author(luowei).

-include("playerPrivate.hrl").

-define(SignDiamond, 20).

%% ====================================================================
%% API functions
%% ====================================================================

-export([	
	init/0,
	sign/0,
	signGM/1,
	reset/0,
	reset/1,
	accuReward/1
]).

-spec init() -> ok.
init() ->
	NowTime = time:getSyncTime1970FromDBS(),
	{{_, CurMouth, Day},{_, _, _}} = time:convertSec2DateTime(NowTime),
	SignIn = playerPropSync:getProp(?PriProp_PlayerDailySignIn),
	{SignMouth, SignDay, FristDay, SignNum, Stat} = getSignInfo(SignIn),
	case FristDay of
		0 ->
			%% 初始化数据
			SignRes = getSignRes(CurMouth, 0, Day, 0, 0),
			playerPropSync:setInt(?PriProp_PlayerDailySignIn, SignRes);
		_ ->
			%% 已有初始化数据，但是可能需要修复数据
			if
				SignMouth =:= CurMouth andalso SignMouth =/= 0 andalso FristDay > Day->
					%% 如果周期内签到首日大于当前日期，则除非是系统时间被往前改了，就是重置的时候除了逻辑问题
					NewSignSignRes = getSignRes(SignMouth, SignDay, Day, SignNum, Stat),
					playerPropSync:setInt(?PriProp_PlayerDailySignIn, NewSignSignRes),
					?ERROR_OUT("init FristDay(~p) > Day(~p),curMon=~p, signMon=~p,signday=~p, val=~p,now=~p",
						[FristDay, Day, CurMouth,  SignMouth, SignDay, SignIn, NowTime]);
				SignMouth =/= CurMouth andalso SignMouth =/= 0 ->
					%% 签到月不是当前月且签到月有效，则玩家已在其它月签到过了，重置当月签到与奖励
					resetReward(),
					resetSign();
				SignDay =/= Day andalso SignDay =/= 0 ->
					%% 签到月无效或者签到日不是当日，但签到日有效，重置签到状态
					resetStat();
				true ->
					ok
			end
	end,
	ok.

%%签到
-spec sign() -> ok.
sign() ->
	%% LUN-4486 【协议测试】【每日签到】角色未开启福利功能，使用协议代码跳过客户端发送每日签到请求，可以收到签到奖励
	Level = playerState:getLevel(),
	IsOK =
		case getCfg:getCfgPStack(cfg_welfare, 1) of
			#welfareCfg{openconditions = 1, parameter = LevelAim} when Level < LevelAim ->
				playerMsg:sendErrorCodeMsg(?ErrorCode_YourLevelIsTooLower),
				false;
			#welfareCfg{openconditions = 2, parameter = TaskAim} ->
				playerTask:isSubmittedTaskByID(TaskAim);
			_ ->
				true
		end,
	case IsOK of
		true ->
			?DEBUG_OUT("[DebugForSignIn] sign"),
			SignIn = playerPropSync:getProp(?PriProp_PlayerDailySignIn),
			{SignMouth, SignDay, FristDay, SignNum, Stat} = getSignInfo(SignIn),
			?DEBUG_OUT("[DebugForSignIn] sign SignIn(~p) SignMouth(~p) SignDay(~p) FristDay(~p) SignNum(~p) Stat(~p)", [SignIn, SignMouth, SignDay, FristDay, SignNum, Stat]),
			%%日期
			NowTime = time:getSyncTime1970FromDBS(),
			{{_, Month, Day},{_, _, _}} = time:convertSec2DateTime(NowTime),
			%% 修复数据
			%% 如果周期内签到首日大于当前日期，则除非是系统时间被往前改了，就是重置的时候除了逻辑问题
			NewFirstDay =
				case FristDay > Day of
					true ->
						?ERROR_OUT("sign FristDay(~p) > Day(~p),curMon=~p, SignMon=~p, signday=~p, val=~p,now=~p",
							[FristDay, Day, Month,  SignMouth, SignDay, SignIn, NowTime]),
						Day;
					_ ->
						FristDay
				end,
			case checkSign(SignNum, Day, NewFirstDay, Stat) of
				{true, Gold} ->
					%% 需要使用货币进行签到
					playerMoney:useCoin(?CoinUseTypeDiamond, Gold,
						#recPLogTSMoney{reason=?CoinUseSignInMoney, param= 0, target=?PLogTS_DailySignIn,source=?PLogTS_PlayerSelf}),
					SignRes = getSignRes(Month, Day, NewFirstDay, SignNum + 1, 1),
					playerPropSync:setInt(?PriProp_PlayerDailySignIn, SignRes),
					getSignReWard(),
					playerAchieve:achieveEvent(?Achieve_SignIn, [1]),
					ok;
				true ->
					%% 免费签到
					SignRes = getSignRes(Month, Day, NewFirstDay, SignNum + 1, 1),
					playerPropSync:setInt(?PriProp_PlayerDailySignIn, SignRes),
					getSignReWard(),
					playerAchieve:achieveEvent(?Achieve_SignIn, [1]),
					ok;
				Error ->
					%% 无法签到
					playerMsg:sendErrorCodeMsg(Error)
			end;
		_ ->
			skip
	end.

%%签到（GM调试）
-spec signGM(OffsetDay::uint16()) -> ok.
signGM(OffsetDay) ->
	?DEBUG_OUT("[DebugForSignIn] signGM OffsetDay(~p)", [OffsetDay]),
	SignIn = playerPropSync:getProp(?PriProp_PlayerDailySignIn),
	{SignMouth, SignDay, FristDay, SignNum, Stat} = getSignInfo(SignIn),
	?DEBUG_OUT("[DebugForSignIn] signGM SignIn(~p) SignMouth(~p) SignDay(~p) FristDay(~p) SignNum(~p) Stat(~p)", [SignIn, SignMouth, SignDay, FristDay, SignNum, Stat]),
	%%日期
	NowTime = time:getSyncTime1970FromDBS() + OffsetDay * 24 * 3600,
	{{_, Month, Day},{_, _, _}} = time:convertSec2DateTime(NowTime),
	%% 修复数据
	%% 如果周期内签到首日大于当前日期，则除非是系统时间被往前改了，就是重置的时候除了逻辑问题
	NewFirstDay =
		case FristDay > Day of
			true ->
				?ERROR_OUT("signGM FristDay(~p) > Day(~p),curMon=~p, SignMon=~p, signday=~p, val=~p,now=~p",
						   [FristDay, Day, Month,  SignMouth, SignDay, SignIn, NowTime]),
				Day;
			_ ->
				FristDay
		end,
	case checkSign(SignNum, Day, NewFirstDay, 0) of
		{true, Gold} ->
			%% 需要使用货币进行签到
			playerMoney:useCoin(?CoinUseTypeDiamond, Gold,
								#recPLogTSMoney{reason=?CoinUseSignInMoney, param= 0, target=?PLogTS_DailySignIn,source=?PLogTS_PlayerSelf}),
			SignRes = getSignRes(Month, Day, NewFirstDay, SignNum + 1, 1),
			playerPropSync:setInt(?PriProp_PlayerDailySignIn, SignRes),
			getSignReWard(),
			playerAchieve:achieveEvent(?Achieve_SignIn, [1]),
			ok;
		true ->
			%% 免费签到
			SignRes = getSignRes(Month, Day, NewFirstDay, SignNum + 1, 1),
			playerPropSync:setInt(?PriProp_PlayerDailySignIn, SignRes),
			getSignReWard(),
			playerAchieve:achieveEvent(?Achieve_SignIn, [1]),
			ok;
		Error ->
			%% 无法签到
			playerMsg:sendErrorCodeMsg(Error)
	end.

%%领取累计奖励
-spec accuReward(ID::uint()) -> ok.
accuReward(ID) ->
	?DEBUG_OUT("[DebugForSignIn] accuReward ID(~p)", [ID]),
	accuReward(ID, checkAccu(ID)).
accuReward(ID, #monthly_signinawardCfg{} = Cfg) ->
	?DEBUG_OUT("[DebugForSignIn] accuReward ID(~p) Cfg(~p)", [ID, Cfg]),
	Flag = erlang:trunc(math:pow(2, ID - 1)),
	SignReward = playerPropSync:getProp(?PriProp_PlayerSignReward),
	case misc:testBit(SignReward, Flag) of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_MiscSysHasGetReward);
		_ ->
			getAccReward(Cfg),
			NewSignReward = misc:setBit(SignReward, Flag),
			playerPropSync:setInt(?PriProp_PlayerSignReward, NewSignReward)
	end;
accuReward(_ID, Error) ->
	?DEBUG_OUT("[DebugForSignIn] accuReward ID(~p) Error(~p)", [_ID, Error]),
	playerMsg:sendErrorCodeMsg(Error).

-spec checkAccu(ID::uint()) -> #monthly_signinawardCfg{} | uint().
checkAccu(ID) ->
	NowTime = time:getSyncTime1970FromDBS(),
	{{_, Month, _},{_, _, _}} = time:convertSec2DateTime(NowTime),
	case getCfg:getCfgByArgs(cfg_monthly_signinaward, Month, ID) of
		#monthly_signinawardCfg{} = Cfg ->
			SignIn = playerPropSync:getProp(?PriProp_PlayerDailySignIn),
			{_, _, _, SignNum, _} = getSignInfo(SignIn),
			case SignNum >= ID of
				true ->
					Cfg;
				_ ->
					?ErrorCode_MiscSysHasNotEougth
			end;
		_ ->
			?ErrorCode_MiscSysHasNotExist
	end.

-spec checkSign(SignNum::uint(), Day::uint(), FristDay::uint(), Stat::uint()) -> true | {true, uint()} | uint().
checkSign(0, _Day, _FristDay, 0) ->
	?DEBUG_OUT("[DebugForSignIn] checkSign 0 _ _ 0"),
	true;
checkSign(0, _Day, _FristDay, 1) ->
	?DEBUG_OUT("[DebugForSignIn] checkSign 0 _ _ 1"),
	case playerMoney:canUseCoin(?CoinUseTypeDiamond, ?SignDiamond) of
		true ->
			{true, ?SignDiamond};
		_ ->
			?ErrorCode_MiscSysHasNotCoin
	end;
checkSign(SignNum, Day, FristDay, 0) when SignNum < Day - FristDay + 1 ->
	?DEBUG_OUT("[DebugForSignIn] checkSign ~p _ _ 0", [SignNum]),
	true;
checkSign(SignNum, Day, FristDay, 1) when SignNum < Day - FristDay + 1 ->
	?DEBUG_OUT("[DebugForSignIn] checkSign ~p _ _ 1", [SignNum]),
	%%OldDiamond = playerState:getCoin(?CoinTypeDiamond),
	%%case OldDiamond >= ?SignDiamond of
	case playerMoney:canUseCoin(?CoinUseTypeDiamond, ?SignDiamond) of
		true ->
			{true, ?SignDiamond};
		_ ->
			?ErrorCode_MiscSysHasNotCoin
	end;
checkSign(_1, _2, _3, _4) ->
	?DEBUG_OUT("[DebugForSignIn] checkSign ~p", [{_1, _2, _3, _4}]),
	?ErrorCode_MiscSysHasNotSign.

reset() ->
	?LOG_OUT("Daily SignIn Reset Start"),
	{{_,_,D},{_, _, _}} = time:convertSec2DateTime(time:getSyncTime1970FromDBS()),
	?LOG_OUT("Daily SignIn Reset Start Cur Day ~p",[D]),
	reset(D).
reset(1) ->
	resetReward(),
	resetSign();
reset(_) ->
	resetStat().

%%重置签到状态
-spec resetStat() -> ok.
resetStat() ->
	SignIn = playerPropSync:getProp(?PriProp_PlayerDailySignIn),
	{Month, Day, FristDay, SignNum, Stat} = getSignInfo(SignIn),
	resetStat(Month, Day, FristDay, SignNum, Stat).
resetStat(Month, Day, FristDay, SignNum, Stat) when Stat =/= 0 ->
	SignRes = getSignRes(Month, Day, FristDay, SignNum, 0),
	playerPropSync:setInt(?PriProp_PlayerDailySignIn, SignRes);
resetStat(_, _, _, _, _) ->
	ok.

%%重置每月签到
-spec resetSign() -> ok.
resetSign() ->
	SignRes = getSignRes(0, 0, 1, 0, 0),
	playerPropSync:setInt(?PriProp_PlayerDailySignIn, SignRes).

%%重置奖励
-spec resetReward() -> ok.
resetReward() ->
	playerPropSync:setInt(?PriProp_PlayerSignReward, 0).

%%获取签到领奖
getSignReWard() ->
	L = getDailySignInRewardList(0),
	Fun = fun({ItemID, ItemNum}) ->
		case erlang:is_integer(ItemID) andalso ItemNum > 0 of
			true ->
				Plog = #recPLogTSItem{
					old = 0,
					new = ItemNum,
					change = ItemNum,
					target = ?PLogTS_PlayerSelf,
					source = ?PLogTS_DailySignIn,
					gold = 0,
					goldtype = 0,
					changReason = ?ItemSourceDailySignInReward,
					reasonParam = 0
				},
				playerPackage:addGoodsAndMail(ItemID, ItemNum, true, 0, Plog);
			_ ->
				skip
		end
	end,
	lists:foreach(Fun, L).

%%获取累计奖励
-spec getAccReward(#monthly_signinawardCfg{}) -> ok.
getAccReward(#monthly_signinawardCfg{
	  	item1 = Item1, num1 = Num1, item2 = Item2, num2 = Num2,
	  	item3 = Item3, num3 = Num3, item4 = Item4, num4 = Num4,
	  	item5 = Item5, num5 = Num5
	}) ->
		L = [{Item1, Num1}, {Item2, Num2}, {Item3, Num3}, {Item4, Num4}, {Item5, Num5}],
		Fun = fun({ItemID, ItemNum}) ->
			case erlang:is_integer(ItemID) andalso ItemNum > 0 of
				true ->
				Plog = #recPLogTSItem{
					old = 0,
					new = ItemNum,
					change = ItemNum,
					target = ?PLogTS_PlayerSelf,
					source = ?PLogTS_DailySignIn,
					gold = 0,
					goldtype = 0,
					changReason = ?ItemSourceDailyAccReward,
					reasonParam = 0
				},
				playerPackage:addGoodsAndMail(ItemID, ItemNum, true, 0, Plog);
			_ ->
				skip
		end
	end,
	lists:foreach(Fun, L).

-spec getDailySignInRewardList(uint()) -> list().
getDailySignInRewardList(SignType) ->
	ItemList = getCfg:get2KeyList(cfg_signinaward,SignType),
	Fun = fun(ItemID, Acc) ->
				  case getCfg:getCfgPStack(cfg_signinaward, SignType, ItemID) of
					  #signinawardCfg{itemnum = ItemNum} ->
						  [{ItemID, ItemNum} | Acc];
					  _ ->
						  Acc
				  end
		  end,
	lists:foldl(Fun, [], ItemList).

-spec getSignInfo(SignIn::uint()) -> uint().
getSignInfo(SignIn) ->
	<<CurMonth:8, CurDay:6, FristDay:6, SignNum:6, Stat:6>> = <<SignIn:32>>,
	{CurMonth, CurDay, FristDay, SignNum, Stat}.

-spec getSignRes(CurMonth::uint(), CurDay::uint(), FristDay::uint(), SignNum::uint(), Stat::uint()) -> uint().
getSignRes(CurMonth, CurDay, FristDay, SignNum, Stat) ->
	 <<SignIn:32>> = <<CurMonth:8, CurDay:6, FristDay:6, SignNum:6, Stat:6>>,
	SignIn.


