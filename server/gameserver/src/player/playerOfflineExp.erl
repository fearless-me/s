%% @author wangjie
%% @doc @todo 玩家离线经验模块

-module(playerOfflineExp).

-include("playerPrivate.hrl").

-define(OfflineExpType0, 0).				%%离线经验领取类型 0免费领取
-define(OfflineExpType1, 1).				%%离线经验领取类型 1金币领取
-define(OfflineExpType2, 2).				%%离线经验领取类型 2砖石领取

-define(MeditationState_Out, 0).	%% 非冥想状态 >0 冥想状态的上次计数时间

-define(MeditationStateBuff, 60000).	%% 冥想BUFF

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	startMeditation/0,
	endMeditation/0,
	accumulateMeditation/0,
	getOfflineReward/1,
	initLastOfflineExp/0
]).

%% 开始灵力冥想
-spec startMeditation() -> ok.
startMeditation() ->
	PlayerLevel = playerState:getLevel(),
	case getCfg:getCfgByKey(cfg_globalsetup, offlineexp_openlevel) of
		#globalsetupCfg{setpara = [OpenLevel]} when PlayerLevel >= OpenLevel ->
			case playerPropSync:getProp(?SerProp_MeditationState) of
				?MeditationState_Out ->
					playerPropSync:setInt(?SerProp_MeditationState, time2:getTimestampSec()),
					%% 添加BUFF
					playerBuff:addBuff(?MeditationStateBuff, 1);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% 解除灵力冥想
-spec endMeditation() -> ok.
endMeditation() ->
	case playerPropSync:getProp(?SerProp_MeditationState) of
		?MeditationState_Out -> skip;
		_ ->
			playerPropSync:setInt(?SerProp_MeditationState, ?MeditationState_Out),
			playerBuff:delBuff(?MeditationStateBuff)
	end,
	ok.

%% 累积灵力冥想经验
-spec accumulateMeditation() -> ok.
accumulateMeditation() ->
	case playerPropSync:getProp(?SerProp_MeditationState) of
		?MeditationState_Out -> skip;
		LastTime ->
			NowTime = time2:getTimestampSec(),
			case NowTime - LastTime >= 60 of
				true ->
					playerPropSync:setInt(?SerProp_MeditationState, NowTime),

					BaseExp = playerPropSync:getProp(?PriProp_MeditationExp),
					case getCfg:getCfgByKey(cfg_indexFunction, playerState:getLevel()) of
						#indexFunctionCfg{offLineExpFree = One, offLineExpFreeAll = All} when BaseExp < All ->
							playerPropSync:setInt(?PriProp_MeditationExp, erlang:min(BaseExp + One, All));
						_ ->
							skip
					end;
				_ ->
					skip
			end
	end,
	ok.

%% 重新上线累积的离线经验
-spec initLastOfflineExp() -> ok.
initLastOfflineExp() ->
	RoleID = playerState:getRoleID(),
	LastLogout = playerState:getLastLogoutTime(),
	case erlang:is_integer(LastLogout) andalso LastLogout > 0 of
		true ->
			Level = playerState:getLevel(),
			NowTime = time:getSyncTime1970FromDBS(),
			Diff = NowTime - LastLogout,
			case Diff >= 60 of
				true ->
					BaseExp = playerPropSync:getProp(?PriProp_MeditationExp),

					case getCfg:getCfgByKey(cfg_indexFunction, Level) of
						#indexFunctionCfg{offLineExpFree = One, offLineExpFreeAll = All} when BaseExp < All ->
							AddExp = (Diff div 60) * One,

							?LOG_OUT("initLastOfflineExp:~p,roleID:~p, level:~p,AddExp:~p", [Diff, RoleID, Level, AddExp]),
							playerPropSync:setInt(?PriProp_MeditationExp, erlang:min(BaseExp + AddExp, All));
						_ ->
							skip
					end;
				_ ->
					?LOG_OUT("initLastOfflineExp exp:~p skip...", [RoleID]),
					skip
			end;
		_ ->
			?LOG_OUT("initLastOfflineExp exp:~p first create role", [RoleID])
	end,
	ok.

%% 领取离线经验奖励
-spec getOfflineReward(Multiple) -> ok when Multiple::uint().
getOfflineReward(?OfflineExpType0) ->
	BaseExp = playerPropSync:getProp(?PriProp_MeditationExp),
	addOfflineExp(BaseExp, ?CoinUseGetOfflineExp, 0),
	ok;
getOfflineReward(?OfflineExpType1) ->
	BaseExp = playerPropSync:getProp(?PriProp_MeditationExp),
	case BaseExp > 0 of
		true ->
			case getCfg:getCfgByKey(cfg_indexFunction, playerState:getLevel()) of
				#indexFunctionCfg{offLineExpGold = OfflineExpGold, offLineGoldCost = OfflineGoldCost} ->
					Money = misc:ceil(BaseExp * OfflineGoldCost),
					case playerMoney:canUseCoin(?CoinUseTypeGold, Money) of
						true ->
							Plo = #recPLogTSMoney{
								target = ?PLogTS_PlayerSelf,
								source = ?PLogTS_OfflineExp,
								reason = ?CoinUseGetOfflineExp,
								param = 0
							},
							playerMoney:useCoin(?CoinUseTypeGold, Money, Plo),
							addOfflineExp(trunc(BaseExp * OfflineExpGold), ?CoinUseGetOfflineExp, 0),
							ok;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_TradeGold)
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok;
getOfflineReward(?OfflineExpType2) ->
	BaseExp = playerPropSync:getProp(?PriProp_MeditationExp),
	case BaseExp > 0 of
		true ->
			case getCfg:getCfgByKey(cfg_indexFunction, playerState:getLevel()) of
				#indexFunctionCfg{offLineExpDiamond = OfflineExpGold, offLineDiamondCost = OfflineGoldCost} ->
					Money = misc:ceil(BaseExp * OfflineGoldCost / 10000),
					case playerMoney:canUseCoin(?CoinUseTypeDiamond, Money) of
						true ->
							Plo = #recPLogTSMoney{
								target = ?PLogTS_PlayerSelf,
								source = ?PLogTS_OfflineExp,
								reason = ?CoinUseGetOfflineExp,
								param = 0
							},
							playerMoney:useCoin(?CoinUseTypeDiamond, Money, Plo),
							addOfflineExp(trunc(BaseExp * OfflineExpGold), ?CoinUseGetOfflineExp, 0),
							ok;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_TradeDiamond)
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok;
getOfflineReward(_) -> ok.

%% ====================================================================
%% Internal functions
%% ====================================================================
%%领取奖励离线经验
-spec addOfflineExp(TotalExp, Type, Para) -> ok when TotalExp :: uint(), Type :: uint(), Para ::term().
addOfflineExp(TotalExp, Type, Para) when TotalExp > 0->
	%% 先把累积清零
	playerPropSync:setInt(?PriProp_MeditationExp, 0),

	?LOG_OUT("palyerGetOfflineExpSucess TotalExp:~p, PlayerId:~p", [TotalExp, playerState:getRoleID()]),
	playerBase:addExp(TotalExp, Type, Para),
	dbLog:sendSaveLogRoleExt(playerState:getRoleID(), TotalExp, TotalExp, Type),
    playerMsg:sendErrorCodeMsg(?ErrorCode_SystemGettingSuccess);
addOfflineExp(0, _Type, _Para) ->
	ok.