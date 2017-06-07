%%%
%%%-------------------------------------------------------------------
%%% @author 罗维
%%% @copyright (C) 2014, <haowan123>
%%% @doc
%%% 玩家在线领取奖励
%%% @end
%%% Created : 29. 二月 2016 11:55
%%%-------------------------------------------------------------------

-module(playerOnlineReward).
-author(luowei).

-include("playerPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================

-export([
		 init/0,
		 tick/0,
		 reset/0,
		 get/1
		]).


%%初始化
-spec init() -> ok.
init() ->
	isReset().

%%tick时间
-spec tick() -> ok.
tick() ->
	CurValue = playerPropSync:getProp(?PriProp_PlayerOnlineTime),
	playerPropSync:setProp(?PriProp_PlayerOnlineTime, CurValue + 1).

%%领奖
-spec get(ID::uint()) -> ok.
get(ID) ->
	case check(ID) of
		true ->
			#online_rewardCfg
			{
			 item1 = Item1, num1 = Num1, item2 = Item2, num2 = Num2,
			 item3 = Item3, num3 = Num3, item4 = Item4, num4 = Num4,
			 item5 = Item5, num5 = Num5
			} = getCfg:getCfgByArgs(cfg_online_reward, ID),
			L = [{Item1, Num1}, {Item2, Num2}, {Item3, Num3}, {Item4, Num4}, {Item5, Num5}],
			Fun = fun({ItemID, ItemNum}) ->
						  case erlang:is_integer(ItemID) andalso ItemNum > 0 of
							  true ->
								  Plog = #recPLogTSItem
										 {
										  old = 0,
										  new = ItemNum,
										  change = ItemNum,
										  target = ?PLogTS_PlayerSelf,
										  source = ?PLogTS_OnlineReward,
										  gold = 0,
										  goldtype = 0,
										  changReason = ?ItemSourceOnlineReward,
										  reasonParam = 0
										 },
								  playerPackage:addGoodsAndMail(ItemID, ItemNum, true, 0, Plog);
							  _ ->
								  skip
						  end
				  end,
			lists:foreach(Fun, L),
			Flag = erlang:trunc(math:pow(2, ID - 1)),
			OnlineReward = playerPropSync:getProp(?PriProp_PlayerOnlineReward),
			NewOnlineReward = misc:setBit(OnlineReward, Flag),
			playerPropSync:setInt64(?PriProp_PlayerOnlineReward, NewOnlineReward);
		ErrorCode ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end.

%%检查
-spec check(ID::uint()) -> true | uint().
check(ID) ->
	IsGet = isGet(ID),
	check(IsGet, ID).
check(true, ID) ->
	isCanGet(ID);
check(Error, _) ->
	Error.

%%重置
-spec reset() -> ok.
reset() ->
	playerPropSync:setInt(?PriProp_PlayerOnlineTime, 0),
	playerPropSync:setInt64(?PriProp_PlayerOnlineReward, 0).

%%是否可以领取
-spec isCanGet(ID::uint()) -> true | uint().
isCanGet(ID) ->
	CurTime = playerPropSync:getProp(?PriProp_PlayerOnlineTime),
	case getCfg:getCfgByArgs(cfg_online_reward, ID) of
		#online_rewardCfg{time = Time} when CurTime >= Time ->
			true;
		_ ->
			?ErrorCode_MiscSysOnlineNotEnough
	end.

%%是否领取
-spec isGet(ID::uint()) -> true | uint().
isGet(ID) ->
	OnlineReward = playerPropSync:getProp(?PriProp_PlayerOnlineReward),
	Flag = erlang:trunc(math:pow(2, ID - 1)),
	case misc:testBit(OnlineReward, Flag) of
		true ->
			?ErrorCode_MiscSysOnlineHasGetReward;
		_ ->
			true
	end.

%%是否重置
-spec isReset() -> ok.
isReset() ->
	Logout = playerState:getLastLogoutTime(),
	isReset(Logout).

isReset(undefined) ->
	ok;
isReset(Logout) ->
	NowTime = time:getSyncTime1970FromDBS(),
	{{Y,M,D},{_, _, _}} = time:convertSec2DateTime(NowTime),
	{{LastY,LastM,LastD},{_, _, _}} = time:convertSec2DateTime(Logout),
	isReset(LastY, Y, LastM, M, LastD, D).
isReset(LastY, Y, LastM, M, LastD, D) when LastY =:= Y andalso LastM =:= M andalso LastD =:= D ->
	ok;
isReset(_, _, _, _, _, _) ->
	playerPropSync:setInt(?PriProp_PlayerOnlineTime, 0),
	playerPropSync:setInt64(?PriProp_PlayerOnlineReward, 0).