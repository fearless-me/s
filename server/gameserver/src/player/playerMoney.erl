%%
%% @author zhongyunawei
%% @doc @todo 玩家货币模块.


-module(playerMoney).
-author(zhongyuanwei).

-include("playerPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 addCoin/3,
		 decCoin/3,
		 canUseCoin/2,
		 useCoin/3
		]).

-export([
	quickUseCoin/4	%% 内部调用canUseCoin/2和useCoin/3，失败时发送ErrorCode（如果不为0），注：消耗数量为0时跳过判断与使用直接返回true
]).

%%添加货币，返回是否添加成功
-spec addCoin(CoinType,CoinNum,#recPLogTSMoney{}) -> boolean() when
	CoinType:: coinType(),CoinNum::uint().
addCoin(CoinType,CoinNum,#recPLogTSMoney{} = PLog) when CoinType >= ?CoinTypeMin andalso CoinType =< ?CoinTypeMax
											 andalso erlang:is_integer(CoinNum) andalso CoinNum >= 0 ->
	case core:isCross() of
		true ->
			?WARN_OUT("crossServer addCoin roleid:~p,cointype:~p,num:~p ---PLog:~p",[playerState:getRobRoleID(),CoinType,CoinNum,PLog]);
		_ ->skip
	end,
	changeCoin(CoinType,CoinNum,PLog);
addCoin(CoinType,CoinNum,#recPLogTSMoney{}=PLog) ->
	?ERROR_OUT("addCoin fail CoinType=~p,CoinNum=~p,PLog=~p",[CoinType,CoinNum,PLog]),
	true.

%%扣除货币，返回是否扣除成功
-spec decCoin(CoinType,CoinNum,#recPLogTSMoney{}) -> boolean() when
	CoinType:: coinType(),CoinNum::uint().
decCoin(CoinType,CoinNum,#recPLogTSMoney{} = PLog) when CoinType >= ?CoinTypeMin andalso CoinType =< ?CoinTypeMax
											 andalso erlang:is_integer(CoinNum) andalso CoinNum > 0 ->
	changeCoin(CoinType,-CoinNum,PLog);
decCoin(_CoinType,0,#recPLogTSMoney{}) ->
	true;
decCoin(CoinType,CoinNum,#recPLogTSMoney{} = PLog) ->
	?ERROR_OUT("Player[~ts] Error decCoin Type[~p] Num[~p] Reason[~p]",[playerState:getName(),CoinType,CoinNum,PLog]),
	false.

-spec canUseCoin(CoinUseType,CoinNum) -> boolean() when
	CoinUseType::coinUseType(),CoinNum::uint().
canUseCoin(?CoinUseTypeGold,CoinNum) ->
	canUseMoney(?CoinTypeGold,CoinNum);
canUseCoin(?CoinUseTypeDiamond,CoinNum) ->
	canUseMoney(?CoinTypeBindDiamond,?CoinTypeDiamond,CoinNum);
canUseCoin(?CoinTypeScore,CoinNum) ->
	canUseMoney(?CoinTypeScore,CoinNum);
canUseCoin(?CoinUseTypePrestige,CoinNum) ->
	canUseMoney(?CoinTypePrestige,CoinNum);
canUseCoin(?CoinUseTypeHonor,CoinNum) ->
	canUseMoney(?CoinTypeHonor,CoinNum);
canUseCoin(?CoinUseTypeDiamondJustNotBind,CoinNum) ->
	canUseMoney(?CoinTypeDiamond,CoinNum);
canUseCoin(?CoinUseTypeGuildContribute,CoinNum) ->
	canUseMoney(?CoinTypeGuildContribute,CoinNum);
canUseCoin(UseCoinType,CoinNum) ->
	%%策划未定义的使用货币类型
 	?ERROR_OUT("Undefined UseCoinType[~p] Num[~p] in canUseCoin",[UseCoinType,CoinNum]),
	false.

%%使用（消耗）货币，返回是否使用成功

%%使用金币，优先使用绑定金币，绑定金币不足再使用非绑定金币
-spec useCoin(CoinUseType,CoinNum,#recPLogTSMoney{}) -> boolean() when
	CoinUseType::coinUseType(),CoinNum::uint().
useCoin(?CoinUseTypeGold,CoinNum,#recPLogTSMoney{} = PLog) ->
	useMoney(?CoinTypeGold,CoinNum,PLog);
%%使用积分，仅用于商城
useCoin(?CoinUseTypeScore,CoinNum,#recPLogTSMoney{} = PLog) ->
	useMoney(?CoinTypeScore,CoinNum,PLog);
%%使用声望
useCoin(?CoinUseTypePrestige,CoinNum,#recPLogTSMoney{} = PLog) ->
	useMoney(?CoinTypePrestige,CoinNum,PLog);
%%使用荣誉
useCoin(?CoinUseTypeHonor,CoinNum,#recPLogTSMoney{} = PLog) ->
	useMoney(?CoinTypeHonor,CoinNum,PLog);
%%使用钻石币，优先使用绑定钻石币，绑定钻石币不足再使用非绑定钻石币
useCoin(?CoinUseTypeDiamond,CoinNum,#recPLogTSMoney{} = PLog) ->
	useMoney(?CoinTypeBindDiamond,?CoinTypeDiamond,CoinNum,PLog);
%%仅使用非绑钻石
useCoin(?CoinUseTypeDiamondJustNotBind,CoinNum,#recPLogTSMoney{} = PLog) ->
	useMoney(?CoinTypeDiamond,?CoinTypeDiamond,CoinNum,PLog);
%%使用军团贡献
useCoin(?CoinUseTypeGuildContribute,CoinNum,#recPLogTSMoney{} = PLog) ->
	useMoney(?CoinTypeGuildContribute,?CoinTypeGuildContribute,CoinNum,PLog);
useCoin(UseCoinType,CoinNum,#recPLogTSMoney{} = PLog) ->
	%%策划未定义的使用货币类型
	?ERROR_OUT("Undefined UseCoinType[~p] Num[~p] in useCoin Reason[~p]",[UseCoinType,CoinNum,PLog]),
	false.

-spec quickUseCoin(CoinUseType, CoinNum, PLog, ErrorCodeWithParam) -> IsSuccess when
	CoinUseType :: coinUseType(),
	CoinNum :: integer(),
	PLog :: #recPLogTSMoney{},
	ErrorCodeWithParam :: {integer(), list()},
	IsSuccess :: boolean().
quickUseCoin(_, 0, _, _) ->
	true;
quickUseCoin(CoinUseType, CoinNum, PLog, {ErrorCode, ErrorParam}) when ErrorCode > 0 ->
	case canUseCoin(CoinUseType, CoinNum) of
		true ->
			case useCoin(CoinUseType, CoinNum, PLog) of
				true ->
					true;
				_ ->
					playerMsg:sendErrorCodeMsg(ErrorCode, ErrorParam),
					false
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(ErrorCode, ErrorParam),
			false
	end;
quickUseCoin(CoinUseType, CoinNum, PLog, _) ->
	case canUseCoin(CoinUseType, CoinNum) of
		true ->
			useCoin(CoinUseType, CoinNum, PLog);
		_ ->
			false
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================

-spec canUseMoney(CoinType,CoinNum) -> boolean() when
	CoinType::coinType(),CoinNum::uint().
canUseMoney(CoinType,CoinNum) ->
	Num = playerState:getCoin(CoinType),
	Num >= CoinNum.

-spec canUseMoney(CoinType,CoinTypeRC,CoinNum) -> boolean() when
	CoinType::coinType(),CoinTypeRC::coinType(),CoinNum::uint().
canUseMoney(CoinType,CoinTypeRC,CoinNum) ->
	BindNum = playerState:getCoin(CoinType),
	case BindNum >= CoinNum of
		true ->
			true;
		_ ->
			Num = CoinNum - BindNum,
			GoldNum = playerState:getCoin(CoinTypeRC),
			GoldNum >= Num
	end.

-spec useMoney(CoinType,CoinNum,#recPLogTSMoney{}) -> boolean() when
	CoinType::coinType(),CoinNum::uint().
useMoney(CoinType,CoinNum,#recPLogTSMoney{} = PLog) ->
	case CoinNum =:= 0 of
		true->
			true;
		_->
			Num = playerState:getCoin(CoinType),
			case Num >= CoinNum of
				true ->
					changeCoin(CoinType,-CoinNum,PLog),
					true;
				_ ->
					false
			end
	end.

%%使用CoinType，如果CoinType不足，则使用CoinTypeRC
%% CoinType 与 CoinTypeRC 相同时只判断1次
-spec useMoney(CoinType,CoinTypeRC,CoinNum,#recPLogTSMoney{}) -> boolean() when
	CoinType::coinType(),CoinTypeRC::coinType(),CoinNum::uint().
useMoney(CoinType,CoinType,CoinNum,#recPLogTSMoney{} = PLog) ->
	case CoinNum =:= 0 of
		true->
			true;
		_->
			BindNum = playerState:getCoin(CoinType),
			case BindNum >= CoinNum of
				true ->
					changeCoin(CoinType,-CoinNum,PLog),
					true;
				_ ->
					false
			end
	end;
useMoney(CoinType,CoinTypeRC,CoinNum,#recPLogTSMoney{} = PLog) ->
	case CoinNum =:= 0 of
		true->
			true;
		_->
			BindNum = playerState:getCoin(CoinType),
			case BindNum >= CoinNum of
				true ->
					changeCoin(CoinType,-CoinNum,PLog),
					true;
				_ ->
					Num = CoinNum - BindNum,
					GoldNum = playerState:getCoin(CoinTypeRC),
					case GoldNum >= Num of
						true ->
							changeCoin(CoinType,-BindNum,PLog),
							changeCoin(CoinTypeRC,-Num,PLog),
							true;
						_ ->
							false
					end
			end
	end.

%%内部改变货币的函数
-spec changeCoin(CoinType,CoinNum,#recPLogTSMoney{}) -> boolean() when
		  CoinType::coinType(),CoinNum::int().
changeCoin(CoinType,CoinNum, #recPLogTSMoney{reason = Reason} = PLog) ->
	case CoinNum =:= 0 of
		true->
			true;
		_->
			OldCoin = playerState:getCoin(CoinType),
			if
			%%改变的值必须是正数（添加）或者当前值够扣除
				CoinNum > 0 orelse OldCoin >= abs(CoinNum) ->
					NewCoin =
						case CoinType of
							?CoinTypeGuildContribute ->
								#globalsetupCfg{setpara = [Max]} =
									getCfg:getCfgPStack(cfg_globalsetup, guild_contribute_max),
								misc:clamp(OldCoin + CoinNum,0,Max);
							_ ->
								misc:clamp(OldCoin + CoinNum,0,?PlayerCoinMax)
						end,
					playerState:setCoin(CoinType,NewCoin),
					%%如果是钻石、绑定钻石或者是积分（仅商城使用）发生变化都及时保存一次所有货币
					case CoinType =:= ?CoinTypeDiamond orelse CoinType =:= ?CoinTypeBindDiamond orelse CoinType =:= ?CoinTypeScore of
						true ->
							playerSave:saveRoleBase();
						_ ->
							skip
					end,
					%%添加各种货币类型成就统计
					if
						CoinNum > 0 andalso CoinType =:= ?CoinTypeGold ->
							playerAchieve:achieveEvent(?Achieve_MoneyWayward1, [CoinNum]);
						CoinNum > 0 andalso CoinType =:= ?CoinTypeScore ->
							playerAchieve:achieveEvent(?Achieve_Integral, [CoinNum]);
						true ->
							skip
					end,
					playerMsg:sendNetMsg(#pk_GS2U_PlayerChangedWealth{
						type = CoinType,
						wealth = NewCoin,
						%%加原因码给客户端，让客户端判定是否需要发日志给TalkingData
						reason = Reason
					}),
					addLog(CoinType, NewCoin, CoinNum, OldCoin, PLog),
					
					%%非绑定钻石消费活动(不计交易行的钻石交易)
					case CoinType =:= ?CoinTypeDiamond andalso CoinNum < 0 of
						true when PLog#recPLogTSMoney.target == ?PLogTS_Trade,PLog#recPLogTSMoney.reason ==?CoinUseTradeBuy->
							skip;
						true when PLog#recPLogTSMoney.target == ?PLogTS_RedEnvelope, PLog#recPLogTSMoney.reason == ?CoinUseSendRed ->
							skip;
						true ->
							playerACChargeOrUse:onUseDiamon( erlang:abs(CoinNum) );
						false ->
							skip
					end,
					
					true;
				true ->
					false
			end
	end.


%%添加金钱变化LOG
-spec addLog(CoinType, NewCoin, CoinNum, OldCoin, #recPLogTSMoney{}) -> ok when
	CoinType::coinType(),NewCoin::uint(),CoinNum::uint(),OldCoin::uint().
addLog(CoinType, NewCoin, CoinNum, OldCoin, #recPLogTSMoney{} = PLog) ->
	{_Fgi,_FedID,PlatformName} = playerState:getFuncellInfo(),
	Rec = #recLogCoin{
		playerID = playerState:getRoleID(),
		accountID = playerState:getAccountID(),
		platformName = PlatformName,
		oldcoin = OldCoin,
		newcoin = NewCoin,
		addOrDec = ?AddCoin,
		changecoin = CoinNum,
		reason = PLog#recPLogTSMoney.reason,
		target = PLog#recPLogTSMoney.target,
		source = PLog#recPLogTSMoney.source,
		param = PLog#recPLogTSMoney.param,
		dbID = gsMainLogic:getDBID4GS(),
		moneyType = CoinType
	},
	case CoinNum >= 0 of
		true->
			dbLog:sendSaveLogCoinChange(CoinType, Rec);
		false->
			dbLog:sendSaveLogCoinChange(CoinType, Rec#recLogCoin{addOrDec = ?DelCoin})
	end,
	case CoinType of
		?CoinTypeDiamond ->
			GoldRec = erlang:setelement(1, Rec, recLogGold),
			case CoinNum >= 0 of
				true->
					dbLog:sendSaveLogGold(GoldRec);
				false->
					dbLog:sendSaveLogGold(GoldRec#recLogGold{addOrDec = ?DelCoin})
			end;
		_->
			skip
	end,
	ok.
