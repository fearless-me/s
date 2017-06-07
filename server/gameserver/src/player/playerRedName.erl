%%
%%%-------------------------------------------------------------------
%%% @author 罗维
%%% @copyright (C) 2015, <haowan123>
%%% @doc
%%% 玩家红名状态
%%% @end
%%% Created : 14. 十月 2015 14:12
%%
%% 代码逻辑说明
%%
%%加入杀戮列表3分钟清除
%%	加入条件 not (切磋/活动地图/野外boss活动(杀戮目标是boss目标或者我是boss目标))
%%
%%杀戮值每隔global_setup:killing_time[tickTime,tickVal] 减少tickVal
%%
%%  增加杀戮值条件 not (切磋/活动地图/野外boss活动(杀戮目标是boss目标或者我是boss目标))
%%		如果是第一次
%%			如果被攻击者非玩家或者宠物 -> skip
%%			如果被攻击者在我的反击列表里 -> skip
%%			-go
%%		非第一次
%%			如果被击杀者不是玩家 -> skip
%%			如果被击杀者在我的反击列表里 -> skip
%%			-go
%%%-------------------------------------------------------------------
-module(playerRedName).
-author(luowei).
-include("playerPrivate.hrl").

-define(TickKpTime,   30 * 1000).  %%反击列表消除时间
-export([
	addKp/2,
	delKv/2,
	addKv/3,
	tickKp/0,
	tickKv/0,
	clearKv/0,
	deadPunish/3,
	broadCastKv/0,
	isInWildBoss/2
]).

%%tick杀戮值
-spec tickKv() -> ok.
tickKv() ->
	[_, TickKv] = globalCfg:getTickKv(),
	Kv = playerPropSync:getProp(?PubProp_PlayerKillValue),
	tickKv(Kv - TickKv).

%%tick反击列表
-spec tickKp() -> ok.
tickKp() ->
	Now = time:getUTCNowMSDiff2010(),
	Kp = playerState:getKillPlayerList(),
	Fun = fun({C, T}) ->
		case Now - T >= ?TickKpTime of
			true ->
				NewKp = lists:keydelete(C, 1, Kp),
				playerState:setKillPlayerList(NewKp),
				?LOG_OUT("delkp,roleid=~p,code=~p,tar(~p,~p)",[playerState:getRoleID(), playerState:getPlayerCode(), C, T]);
			_ ->
				skip
		end
		  end,
	lists:foreach(Fun, Kp).

%%减少杀戮值
-spec delKv(Num :: uint(), SingleNum::uint()) -> ok.
delKv(Num, SingleNum) ->
	Kv = playerPropSync:getProp(?PubProp_PlayerKillValue),
	if
		Kv =:= 0 ->
			NeedNum = 0;
		(Kv rem SingleNum) =/= 0 ->
			NeedNum = (Kv div SingleNum) + 1;
		true ->
			NeedNum = Kv div SingleNum
	end,
	case Num >= NeedNum of
		true ->
			delKv1(NeedNum * SingleNum, Kv),
			NeedNum;
		_ ->
			delKv1(Num * SingleNum, Kv),
			Num
	end.


%%增加杀戮值
-spec addKv(IsFirst::boolean(), Code::uint(), BossTargetCode::uint()) -> ok.
addKv(IsFirst, Code, BossTargetCode) ->
	OldKv= playerPropSync:getProp(?PubProp_PlayerKillValue),
	addKv1(isSet(Code, BossTargetCode, IsFirst), IsFirst, Code),
	NewKv = playerPropSync:getProp(?PubProp_PlayerKillValue),
	case OldKv =/= NewKv orelse playerState:getRoleID() =:= 173012553750807308 of
		true ->
			?LOG_OUT("addkv roleid=~p, selfcode=~p,tarcode=~p, bosstarcode=~p, isinbatlearn=~p, mapId=~p, oldv=~p,newv=~p",
				[playerState:getRoleID(), playerState:getPlayerCode(),Code, BossTargetCode, isInBattleLearn(), playerState:getMapID(), OldKv, NewKv]);
		_ ->
			skip
	end,
	ok.


%%增加杀戮人
-spec addKp(Code::uint(), BossTargetCode::uint()) -> ok.
addKp(Code, BossTargetCode) ->
	addKp1(isSet(Code, BossTargetCode, true), Code).

%%清除杀戮值
-spec clearKv() -> ok.
clearKv() ->
	playerPropSync:setInt(?PubProp_PlayerKillValue, 0).

%%死亡惩罚
-spec deadPunish(AttackCode::uint(), AttackName::string(), BossTargetCode::uint()) -> ok.
deadPunish(AttackCode, AttackName, BossTargetCode) ->
	deadPunish1(isSet(AttackCode, BossTargetCode, true), AttackCode, AttackName).
deadPunish1(false, _, _) ->
	skip;
deadPunish1(true, AttackCode, AttackName) ->
	case codeMgr:getObjectTypeByCode(AttackCode) of
		?ObjTypePlayer ->
			Pkv = globalCfg:getPunishKv(),
			Kv = playerPropSync:getProp(?PubProp_PlayerKillValue),
			deadPunish3(AttackName, deadPunish2(Pkv, Kv));
		_ ->
			skip
	end.

%%全服广播
-spec broadCastKv() -> ok.
broadCastKv() ->
	case playerState:getIsPlayer() of
		true ->
			broadCastKv(playerDaily:getDailyCounter(?DailyType_BroadCastKv, 0));
		_ ->
			skip
	end,
	ok.
broadCastKv(0) ->
	MinKv = globalCfg:getBroadCastKv(),
	Kv = playerPropSync:getProp(?PubProp_PlayerKillValue),
	case Kv >= MinKv of
		true ->
			{X, Y} = playerState:getPos(),
			playerDaily:incDailyCounter(?DailyType_BroadCastKv, 0),
			N = stringCfg:getString(kvBroadcast,
				[playerState:getRoleID(),
					playerState:getPlayerCode(),
					playerState:getName(),
					playerState:getMapID(),
					trunc(X),
					trunc(Y)
				]),
			core:sendBroadcastNotice(N);
		_ ->
			skip
	end;
broadCastKv(_) ->
	skip.


%%通知杀戮人
-spec sendKp(Code::uint()) -> ok.
sendKp(Code) ->
	Res = #pk_GS2U_KillPlayerResponse{code = Code},
	playerMsg:sendNetMsg(Res).

%% ====================================================================
%% Internal functions
%% ====================================================================
%%设置初次杀戮值
-spec setFirstKv() -> ok.
setFirstKv() ->
	Kv = playerPropSync:getProp(?PubProp_PlayerKillValue),
	setFirstKv(Kv).
setFirstKv(0) ->
	FristKv = globalCfg:getFirstKv(),
	playerPropSync:setInt(?PubProp_PlayerKillValue, FristKv);
setFirstKv(_) ->
	ok.

%%设置每次杀死玩家杀戮值
-spec setEachKv() -> ok.
setEachKv() ->
	%%增加恶人榜数量
	KpNum = playerPropSync:getProp(?PriProp_PlayerKpNum),
	playerPropSync:setInt(?PriProp_PlayerKpNum, KpNum + 1),
	EachKv = globalCfg:getEachKv(),
	Kv = playerPropSync:getProp(?PubProp_PlayerKillValue),
	playerPropSync:setInt(?PubProp_PlayerKillValue, Kv + EachKv),
	playerMsg:sendErrorCodeMsg(?ErrorCode_BattleLearnKillValue, [EachKv]).

%%获取攻击目标code
-spec getAttackedCode(Code::uint()) -> uint() | false.
getAttackedCode(Code) ->
	case codeMgr:getObjectTypeByCode(Code) of
		?ObjTypePet ->
			PetEts = playerState:getMapPetEts(),
			case myEts:lookUpEts(PetEts, Code) of
				[#recMapObject{ownCode = OwnCode}|_] ->
					OwnCode;
				_  ->
					false
			end;
		?ObjTypePlayer ->
			Code;
		_ ->
			false
	end.

%%获取击杀目标
-spec getKilledCode(Code::uint()) -> uint() | false.
getKilledCode(Code) ->
	case codeMgr:getObjectTypeByCode(Code) of
		?ObjTypePlayer ->
			Code;
		_ ->
			false
	end.

%%获取主人Code
-spec getCasteredCode(Code::uint()) -> {uint(), list()} | false.
getCasteredCode(Code) ->
	case codeMgr:getObjectTypeByCode(Code) of
		?ObjTypePlayer ->
			PlayerEts = playerState:getMapPlayerEts(),
			case myEts:lookUpEts(PlayerEts, Code) of
				[#recMapObject{killList = TargetKp}] ->
					{Code, TargetKp};
				_ ->
					false
			end;
		?ObjTypePet ->
			%% 攻击者是宠物
			PetEts = playerState:getMapPetEts(),
			case myEts:lookUpEts(PetEts, Code) of
				[#recMapObject{ownCode = OwnCode}|_] ->
					PlayerEts = playerState:getMapPlayerEts(),
					case myEts:lookUpEts(PlayerEts, OwnCode) of
						[#recMapObject{killList = TargetKp}] ->
							{OwnCode, TargetKp};
						_ ->
							false
					end;
				_  ->
					false
			end;
		?ObjTypeCarrier ->
			%% 攻击者是载体(宿主是宠物,则忽略)
			MonsterEts = playerState:getMapMonsterEts(),
			case myEts:lookUpEts(MonsterEts, Code) of
				[#recMapObject{ownCode = OwnCode}|_] ->
					PlayerEts = playerState:getMapPlayerEts(),
					case myEts:lookUpEts(PlayerEts, OwnCode) of
						[#recMapObject{killList = TargetKp}] ->
							{OwnCode, TargetKp};
						_ ->
							false
					end;
				_ ->
					false
			end;
		_ ->
			false
	end.


%%是否设置杀戮值or杀戮人
-spec isSet(TargetCode::uint(), BossTargetCode::uint(), IsFirst::boolean()) -> boolean().
isSet(TargetCode, BossTargetCode, _IsFirst) ->
	%%print log
%%	case IsFirst of
%%		false ->
%%			?LOG_OUT("kill player, is add kill value [~ts], ~p, ~p, ~p, ~p, ~p",[playerState:getName(), TargetCode, BossTargetCode, isInBattleLearn(), isInActivityMap(), isInWildBoss(TargetCode, BossTargetCode)]);
%%		_ ->
%%			skip
%%	end,
	not (isInBattleLearn() orelse isInActivityMap() orelse isInWildBoss(TargetCode, BossTargetCode)).

%%是否设置首次杀戮值
-spec isSetFirstKv(Code::uint()) -> boolean().
isSetFirstKv(Code) ->
	case getAttackedCode(Code) of
		false ->
			false;
		OwnCode ->
			not isInKp(OwnCode)
	end.

%%是否设置每次杀戮值
-spec  isSetEachKv(Code::uint()) -> boolean().
isSetEachKv(Code) ->
	case getKilledCode(Code) of
		false ->
			false;
		OwnCode ->
			not isInKp(OwnCode)
	end.

%%是否在反击列表中
-spec isInKp(Code::uint()) -> boolean().
isInKp(Code) ->
	Kp = playerState:getKillPlayerList(),
	case lists:keyfind(Code, 1, Kp) of
		false ->
			false;
		_ ->
			true
	end.

-spec isSetKp(TargetKp::list(), Kp::list(), TargetCode::uint()) -> boolean().
isSetKp(TargetKp, Kp, TargetCode) ->
	MyCode = playerState:getPlayerCode(),
	case lists:keyfind(MyCode, 1, TargetKp) of
		false ->
			case lists:keyfind(TargetCode, 1, Kp) of
				false ->
					true;
				_ ->
					false
			end;
		_ ->
			false
	end.

%%是否切磋状态
-spec isInBattleLearn() -> boolean().
isInBattleLearn() ->
	isInBattleLearn(playerState:getBattleLearnInfo()).

%%是否活动地图状态
-spec isInActivityMap() -> boolean().
isInActivityMap() ->
	isInActivityMap(playerState:getIsInActivityMap()).

%%是否野外boss状态中
-spec isInWildBoss(TargetCode::uint(), BossTargetCode::uint()) -> boolean().
isInWildBoss(_, 0) ->
	false;
isInWildBoss(TargetCode, BossTargetCode) when TargetCode =:= BossTargetCode ->
	true;
isInWildBoss(_TargetCode, BossTargetCode) ->
	BossTargetCode =:= playerState:getPlayerCode().

tickKv(Kv) when Kv >= 0 ->
	playerPropSync:setInt(?PubProp_PlayerKillValue, Kv);
tickKv(_) ->
	playerPropSync:setInt(?PubProp_PlayerKillValue, 0).

addKv1(false, _, _) ->
	ok;
addKv1(true, true, Code) ->
	addKv2(isSetFirstKv(Code));
addKv1(true, _, Code) ->
	addKv3(isSetEachKv(Code)).

addKv2(true) ->
	setFirstKv();
addKv2(_) ->
	ok.

addKv3(true) ->
	setEachKv();
addKv3(_) ->
	ok.

addKp1(false, _) ->
	ok;
addKp1(true, Code) ->
	addKp2(getCasteredCode(Code)).

addKp2(false) ->
	ok;
addKp2({Code, TargetKp}) ->
	Now = time:getUTCNowMSDiff2010(),
	Kp = playerState:getKillPlayerList(),
	case isSetKp(TargetKp, Kp, Code)of
		true ->
			NewKp = lists:keystore(Code, 1, Kp, {Code, Now}),
			playerState:setKillPlayerList(NewKp),
			sendKp(Code),
			?LOG_OUT("addkp,roleid=~p,code=~p,tar(~p,~p)",[playerState:getRoleID(), playerState:getPlayerCode(), Code, Now]);
		_ ->
			ok
	end.

delKv1(Value, Kv) when Value >= Kv ->
	playerPropSync:setInt(?PubProp_PlayerKillValue, 0);
delKv1(Value, Kv) ->
	playerPropSync:setInt(?PubProp_PlayerKillValue, Kv - Value).

isInBattleLearn(#recBattleLearn{}) -> true;
isInBattleLearn(_) -> false.

isInActivityMap(true) -> true;
isInActivityMap(_) -> false.

%isInWildBoss(true) -> true;
%isInWildBoss(_) -> false.

deadPunish2(Pkv, Kv) when Kv >= Pkv ->
	CostCoin = globalCfg:getCostKv() * Kv,
	BuffID = globalCfg:getPunishBuff(),
	GoldIsEnough = playerMoney:canUseCoin(?CoinUseTypeGold, CostCoin),
	case GoldIsEnough of
		true ->
			true = playerMoney:useCoin(?CoinUseTypeGold, CostCoin,
				#recPLogTSMoney{reason=?CoinUseReName, param= 0, target=?PLogTS_RedName,source=?PLogTS_PlayerSelf}),
			CostCoin;
		_ ->
			Lv = playerState:getLevel(),
			playerBuff:addBuff(BuffID, Lv),
			Coin = playerState:getCoin(?CoinTypeGold),
			true = playerMoney:decCoin(?CoinTypeGold, Coin,
				#recPLogTSMoney{reason=?CoinUseReName, param= 0, target=?PLogTS_RedName,source=?PLogTS_PlayerSelf}),
			Coin
	end;
deadPunish2(_, _) ->
	0.

deadPunish3(AttackName, Coin) ->
	MinKv = globalCfg:getBroadCastBeKv(),
	Kv = playerPropSync:getProp(?PubProp_PlayerKillValue),
	case Kv >= MinKv andalso Coin =/= 0 of
		true ->
			playerDaily:incDailyCounter(?DailyType_BroadCastKv, 0),
			N = stringCfg:getString(dieBroadcast, [AttackName, playerState:getName(),Coin]),
			core:sendBroadcastNotice(N);
		_ ->
			skip
	end,
	ok.
