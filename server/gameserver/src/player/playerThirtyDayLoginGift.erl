%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, raink
%%% @doc
%%% 30日大礼包
%%% http://192.168.2.32:8080/browse/LUNA-2695
%%% 活动时间与七日目标（playerSevenDayAim）共同使用?SerProp_SevenDayAimTimeBegin
%%% @end
%%% Created : 20170622
%%%-------------------------------------------------------------------
-module(playerThirtyDayLoginGift).
-author("meitianyang").

-include("playerPrivate.hrl").
-include("cfg_thirty_day_login_gift.hrl").

-define(ThirtyDayTime, 2592000).	%% 七日目标持续时间（秒）

%% 条件类型
-define(ThirtyDayAim_RoleLevel,	1).	%% 角色等级playerState:getLevel()
-define(ThirtyDayAim_LoginDay,	2).	%% 角色累计登录天数variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_AccLoginDay)
-type thirtyDayAim() :: ?ThirtyDayAim_RoleLevel | ?ThirtyDayAim_LoginDay.

%% 奖励类型thirty_day_login_gift.rewardstype
-define(RewardsType_Equipment,	1).
-define(RewardsType_Fashion,	2).
-define(RewardsType_Item,		3).

%% MSG
-export([
	reward/1	%% 领取奖励
]).

%% API
-export([
	init/0		%% 上线初始化
]).

%%% ====================================================================
%%% MSG functions
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 领取奖励
-spec reward(ID::uint()) -> ok.
reward(ID) ->
	case reward_checkID(ID) of
		true ->
			#thirty_day_login_giftCfg{
				type		= Type,			%% 条件类型：1等级playerState:getLevel/0；2登录天数
				value		= Value,		%% 条件要求值
				rewardstype = RewardsType,	%% 1装备 2时装 3道具
				rewards 	= Rewards		%% 奖励
			} = getCfg:getCfgPStack(cfg_thirty_day_login_gift, ID),
			case checkTime() of
				false ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_ThirtyDayLoginGiftTimeOut);
				_ ->
					case reward_checkCondition(Type, Value) of
						true ->
							playerPropSync:setInt(?SerProp_ThirtyDayTimeAlreadyReward, ID),
							reward_item(RewardsType, Rewards),
							playerMsg:sendNetMsg(#pk_GS2U_ThirtyDayLoginGift_Ack{id = ID});
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_ThirtyDayLoginGiftCannot)
					end
			end;
		_ ->
			ok
	end.

%% 检查是配置ID是否正确
-spec reward_checkID(ID::uint()) -> boolean().
reward_checkID(ID) ->
	AlreadyRewardIDMax = playerPropSync:getProp(?SerProp_ThirtyDayTimeAlreadyReward),
	case ID =< AlreadyRewardIDMax of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_ThirtyDayLoginGiftAlreadyReward),
			false;
		_ ->
			case AlreadyRewardIDMax + 1 =:= ID of
				true ->
					true;
				_ ->
					%% 配置的ID可能是不连续的
					ListID = lists:seq(AlreadyRewardIDMax + 1, ID - 1),
					FunFind =
						fun(IDMaybe) ->
							case getCfg:getCfgByKey(cfg_thirty_day_login_gift, IDMaybe) of
								#thirty_day_login_giftCfg{} -> true;
								_ -> false
							end
						end,
					case lists:any(FunFind, ListID) of
						true ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_ThirtyDayLoginGiftNeedPrevious),
							false;
						_ ->
							true
					end
			end
	end.

%% 检查是否满足领奖条件
-spec reward_checkCondition(Type::thirtyDayAim(), ValueAim::uint()) -> boolean().
reward_checkCondition(?ThirtyDayAim_RoleLevel, ValueAim) ->
	playerState:getLevel() >= ValueAim;
reward_checkCondition(?ThirtyDayAim_LoginDay, ValueAim) ->
	variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_AccLoginDayAll) >= ValueAim;
reward_checkCondition(Type, ValueAim) ->
	?ERROR_OUT("invalie Type:~w ValueAim:~w", [Type, ValueAim]),
	false.

%% 尝试可能的奖励
-spec reward_item(RwardsType::uint(), Rewards::term()) -> ok.
reward_item(_RwardsType, undefined) ->
	ok;
reward_item(_RwardsType, []) ->
	ok;
reward_item(_RwardsType, "[]") ->
	ok;
%% 带数量的时装奖励
reward_item(?RewardsType_Fashion = RwardsType, [{Sex, ID, Count} | T]) when Sex =:= ?SexMan; Sex =:= ?SexWoman ->
	%% 匹配自身性别
	case playerState:getSex() of
		Sex ->
			PLog = #recPLogTSItem{
				old         = 0,
				new         = Count,
				change      = Count,
				target      = ?PLogTS_PlayerSelf,
				source      = ?PLogTS_ThirtyDayLoginGift,
				gold        = 0,
				goldtype    = 0,
				changReason = ?ItemSourceThirtyDayLoginGift,
				reasonParam = 0
			},
			playerPackage:addGoodsAndMail(ID, Count, false, 0, PLog);
		_ ->
			skip
	end,
	reward_item(RwardsType, T);
%% 不带数量的时装奖励
reward_item(?RewardsType_Fashion = RwardsType, [{Sex, ID} | T]) when Sex =:= ?SexMan; Sex =:= ?SexWoman ->
	reward_item(RwardsType, [{Sex, ID, 1} | T]);
%% 带数量的装备奖励
reward_item(?RewardsType_Equipment = RwardsType, [{Career, ID, Count} | T]) when
	Career =:= ?Career_10_Warrior;
	Career =:= ?Career_20_Magician;
	Career =:= ?Career_30_Bravo ->
	%% 匹配自身职业
	case ?Career2CareerBase(playerState:getCareer()) of
		Career ->
			PLog = #recPLogTSItem{
				old         = 0,
				new         = Count,
				change      = Count,
				target      = ?PLogTS_PlayerSelf,
				source      = ?PLogTS_ThirtyDayLoginGift,
				gold        = 0,
				goldtype    = 0,
				changReason = ?ItemSourceThirtyDayLoginGift,
				reasonParam = 0
			},
			playerPackage:addGoodsAndMail(ID, Count, false, 0, PLog);
		_ ->
			skip
	end,
	reward_item(RwardsType, T);
%% 不带数量的装备奖励
reward_item(?RewardsType_Equipment = RwardsType, [{Career, ID} | T]) when
	Career =:= ?Career_10_Warrior;
	Career =:= ?Career_20_Magician;
	Career =:= ?Career_30_Bravo ->
	reward_item(RwardsType, [{Career, ID, 1} | T]);
%% 带数量的道具奖励
reward_item(?RewardsType_Item = RwardsType, [{ItemID, Count} | T]) ->
	PLog = #recPLogTSItem{
		old         = 0,
		new         = Count,
		change      = Count,
		target      = ?PLogTS_PlayerSelf,
		source      = ?PLogTS_ThirtyDayLoginGift,
		gold        = 0,
		goldtype    = 0,
		changReason = ?ItemSourceThirtyDayLoginGift,
		reasonParam = 0
	},
	playerPackage:addGoodsAndMail(ItemID, Count, false, 0, PLog),
	reward_item(RwardsType, T);
%% 不带数量的道具奖励
reward_item(?RewardsType_Item = RwardsType, [{ItemID} | T]) ->
	reward_item(RwardsType, [{ItemID, 1} | T]);
%% 无法解析的格式
reward_item(RwardsType, [Unknown | T]) ->
	?ERROR_OUT("invalid RwardsType:~w rewards:~w", [RwardsType, Unknown]),
	reward_item(RwardsType, T).

%%% ====================================================================
%%% API functions
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 上线初始化并推送状态
-spec init() -> ok.
init() ->
	case playerPropSync:getProp(?SerProp_ThirtyDayTimeBegin) of
		0 ->
			%% 取当天凌晨4点时间
			TimeNowUTC = time:getSyncTime1970FromDBS(),
			Date = time:convertSec2DateTime(TimeNowUTC),
			TimeBeginOfDay = time:getDayBeginSeconds(Date) + ?ResetTimeHour * 3600 - ?SECS_FROM_0_TO_1970,
			playerPropSync:setInt(?SerProp_ThirtyDayTimeBegin, TimeBeginOfDay);
		_ ->
			skip
	end,
	Msg = #pk_GS2U_ThirtyDayLoginGiftState_Sync{
		timeBegin = getTimeBegin(),
		alreadyReward = playerPropSync:getProp(?SerProp_ThirtyDayTimeAlreadyReward)
	},
	playerMsg:sendNetMsg(Msg),
	ok.

%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 获取活动开始时间
-spec getTimeBegin() -> Sec::uint32().
getTimeBegin() ->
	playerPropSync:getProp(?SerProp_ThirtyDayTimeBegin).

%%% --------------------------------------------------------------------
%% 检查活动时间
-spec checkTime() -> boolean().
checkTime() ->
	TimeNow = time:getSyncTimeFromDBS(),
	case playerPropSync:getProp(?SerProp_ThirtyDayTimeBegin) + ?ThirtyDayTime =< TimeNow of
		true ->
			false;
		_ ->
			true
	end.
