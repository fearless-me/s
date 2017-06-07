%% @author zhengzhichun
%% @doc @todo Add description to playerWing.


-module(playerWing).
-include("gsInc.hrl").
-include("common/playerPropSyncDefine.hrl").
-include("playerPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	needInitWingLevel/1,
	initWing/0,

	useWingItem/4,

	useWingItemS/4,
	getWingExp/0,
	%getWingLevel/0,

	regeneration/0,

	initWingLevel/0,

	changeWingLevel/1
]).

-export([
	getWingLevel/0,
	setWingLevel/2,
	setWingMaxLevel/1,
	getWingMaxLevel/0
]).

changeWingLevel(NewLevel) when NewLevel >= 0 ->
	MaxWingLevel = getWingMaxLevel(),
	IsShow = getWingShowFlag(),
	case MaxWingLevel >= NewLevel of
		true ->
			setWingLevel(IsShow, NewLevel);
		_ ->
			skip
	end;
changeWingLevel(_) -> ok.

%%玩家登录时，初始化翅膀
initWing() ->
	?DEBUG_OUT("initWing"),
%%	ProVal = playerPropSync:getProp(?PubProp_WingLevel),
%%	ProVal2 = playerPropSync:getProp(?PriProp_WingExp),
%%	playerState:setWingExp(ProVal2),
%%	playerState:setWingLevel(ProVal),
	initWingProp(),
	ok.

%%物品升级翅膀的逻辑
-spec useWingItemS(ItemID :: uint64(), ItemNum :: uint(), MinExp :: int(), MaxExp :: int()) -> int().
useWingItemS(ItemID, ItemNum, MinExp, MaxExp) ->
	?LOG_OUT("useWingItemS itemid:~p num:~p roleid:~p", [ItemID, ItemNum, playerState:getRoleID()]),
	CurLevel = getWingMaxLevel(),
	MaxLevel = lists:max(getCfg:get1KeyList(cfg_wing)),
	case getCfg:getCfgByArgs(cfg_wing, CurLevel) of
		#wingCfg{} when CurLevel + 1 > MaxLevel ->
			%%等级上限，不能在升
			playerMsg:sendErrorCodeMsg(?ErrorCode_CnWingLevelLimit),
			0;
		#wingCfg{cast_money = CostMoney} ->
			TotallMoney = round(CostMoney * ItemNum),
			UseCoin = playerMoney:useCoin(?CoinUseTypeGold, TotallMoney,
				#recPLogTSMoney{reason = ?CoinUseWing, param = CurLevel, target = ?PLogTS_Wing, source = ?PLogTS_PlayerSelf}),
			case UseCoin of
				true ->
					useWingItem(MaxLevel, ItemNum, MinExp, MaxExp);
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_CnWingRiseNeedGold),
					0
			end;
		_ ->
			?ERROR_OUT("useWingItemS itemid:~p num:~p roleid:~p, curLevel:~p",
				[ItemID, ItemNum, playerState:getRoleID(), CurLevel]),
			0
	end.

-spec useWingItem(MaxLevel :: uint(), MaxNum :: uint(), MinExp :: int(), MaxExp :: int()) -> uint().
useWingItem(MaxLevel, MaxNum, MinExp, MaxExp) ->
	OldLevel = getWingMaxLevel(),
	OldExp = getWingExp(),
	{NewLevel, NewExp, UseItemCount} =
		doUseWingItem(MaxLevel, OldLevel, OldExp, MaxNum, 0, MinExp, MaxExp, true),

	try
		?DEBUG_OUT("use item ~p, level ~p -> ~p, exp ~p -> ~p",
			[UseItemCount, OldLevel, NewLevel, OldExp, NewExp]),
		case OldExp =/= NewExp of
			true ->
				playerPropSync:setInt(?PriProp_WingExp, NewExp);
			_ ->
				skip
		end,

		case NewLevel > OldLevel of
			true ->
				setWingMaxLevel(NewLevel),
				onWingLevelUp(OldLevel, NewLevel),
				%%判断翅膀升阶

				case NewLevel>0 andalso (NewLevel rem 12) =:= 1 of
					 true ->
						 playerAchieve:achieveEvent(?Achieve_Wings_up, [1]);
				     _->
						skip
				end;
			_ ->
				skip
		end
	catch
	   _ : Why ->
		   ?ERROR_OUT("use item ~p, level ~p -> ~p, exp ~p -> ~p, error:~p",
			   [UseItemCount, OldLevel, NewLevel, OldExp, NewExp, Why])
	end,
	UseItemCount.

onWingLevelUp(OldLevel, NewLevel) ->
	case getCfg:getCfgByArgs(cfg_wing, OldLevel) of
		#wingCfg{property = PropListOld} ->
			case getCfg:getCfgByArgs(cfg_wing, NewLevel) of
				#wingCfg{property = PropListNew} ->
					playerCalcProp:changeProp_CalcType(PropListOld, ?EquipOff, true),
					playerCalcProp:changeProp_CalcType(PropListNew, ?EquipOn, true),
					playerForce:calcPlayerForce(?PlayerWingForce, true);
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_CnWingNotOk)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_CnWingNotOk)
	end.

doUseWingItem(_MaxLevel, CurLevel, CurExp, _MaxItemCount, UseItemCount, _MinExp, _MaxExp, false) ->
	{CurLevel, CurExp, UseItemCount};
doUseWingItem(MaxLevel, CurLevel, CurExp, _MaxItemCount, UseItemCount, _, _, _) when MaxLevel =< CurLevel ->
	{MaxLevel, CurExp, UseItemCount};
doUseWingItem(_MaxLevel, CurLevel, CurExp, MaxItemCount, UseItemCount, _, _, _) when MaxItemCount =< UseItemCount ->
	{CurLevel, CurExp, MaxItemCount};
doUseWingItem(MaxLevel, CurLevel, CurExp, MaxItemCount, UseItemCount, MinExp, MaxExp, true) ->
	{NewLevel, NewCurExp, NewUseItemCount, GoOn} =
		case getCfg:getCfgByArgs(cfg_wing, CurLevel) of
			#wingCfg{exp = ConfExp} ->
				RandExp = misc:rand(MinExp, MaxExp),
				OldExp2 = playerState:getWingExpAccPerItemUse(),
				playerState:setWingExpAccPerItemUse(RandExp + OldExp2),

				ExistExp = CurExp + RandExp,
				case ExistExp >= ConfExp of
					true ->
						{OnceLevel, ExpLeft} = calcLevel(CurLevel, ExistExp, true),
						{OnceLevel, ExpLeft, UseItemCount + 1, true};
					_ ->
						{CurLevel, ExistExp, UseItemCount + 1, true}
				end;
			_ ->
				{CurLevel, CurExp, UseItemCount, false}
		end,
	doUseWingItem(MaxLevel, NewLevel, NewCurExp, MaxItemCount, NewUseItemCount, MinExp, MaxExp, GoOn).

calcLevel(CurLevel, Exp, false) ->
	{CurLevel, Exp};
calcLevel(CurLevel, Exp, _) when Exp =< 0 ->
	{CurLevel, 0};
calcLevel(CurLevel, Exp, _GoOn) ->
	{NewLevel, NewExp, Go} =
		case getCfg:getCfgByArgs(cfg_wing, CurLevel) of
			#wingCfg{exp = ConfExp} when Exp >= ConfExp ->
				{CurLevel + 1, Exp - ConfExp, true};
			_ ->
				{CurLevel, Exp, false}
		end,
	calcLevel(NewLevel, NewExp, Go).

%%取出翅膀等级
-spec getWingLevel() -> uint().
getWingLevel() ->
	WinLevel = playerPropSync:getProp(?PubProp_WingLevel),
	<<_:1, Level:31>> = <<WinLevel:32>>,
	Level.

setWingMaxLevel(WingLevel)->
	playerPropSync:setInt(?PriProp_WingMaxLevel, WingLevel).

getWingMaxLevel() ->
	playerPropSync:getProp(?PriProp_WingMaxLevel).

getWingShowFlag()->
	WinLevel = playerPropSync:getProp(?PubProp_WingLevel),
	<<Show:1, _:31>> = <<WinLevel:32>>,
	Show.

setWingLevel(Show, Level) ->
	<<WingLevel:32>> = <<Show:1, Level:31>>,
	playerPropSync:setInt(?PubProp_WingLevel, WingLevel).

-spec getWingExp() -> uint().
getWingExp() -> playerPropSync:getProp(?PriProp_WingExp).

%%初始化翅膀附加的属性
-spec initWingProp() -> ok.
initWingProp() ->
	CurLevel = getWingLevel(),
	case CurLevel > 0 of
		true ->
			case getCfg:getCfgPStack(cfg_wing, CurLevel) of
				#wingCfg{property = PropList1} ->
					?LOG_OUT("wing level:~p roleid:~p", [CurLevel, playerState:getRoleID()]),
					playerCalcProp:changeProp_CalcType(PropList1, ?EquipOn, true);
				_ ->
					undefined
			end;
		_ ->
			?DEBUG_OUT("initwing role=~p, winlevel=~p", [playerState:getRoleID(), CurLevel]),
			skip
	end,
	ok.

%%开启翅膀功能，初始等级为1
-spec initWingLevel() -> boolean().
initWingLevel() ->
	?LOG_OUT("initWingLevel roleid:~p", [playerState:getRoleID()]),
	setWingLevel(0, 1),
	setWingMaxLevel(1),
	initWingProp(),
	playerForce:calcPlayerForce(?PlayerWingForce, true).

%%是否需要初始翅膀
-spec needInitWingLevel(RoleLevel :: uint32()) -> ok.
needInitWingLevel(RoleLevel) ->
	StartRoleLevel = globalCfg:getGlobalCfg(wing_open_level),
	case getWingMaxLevel() =< 0 andalso StartRoleLevel =< RoleLevel of
		true ->
			initWingLevel();
		_ -> skip
	end,
	ok.


%%  策划把翅膀技能表字段全部清空了

%%翅膀复活BUFF
-spec regeneration() -> boolean().
regeneration() ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_playerWing) of
		false ->
			?LOG_OUT("regeneration:~p,false", [playerState:getRoleID()]),
			false;
		_ ->
			regeneration2()
	end.
regeneration2() ->
	%%有死亡技能要触发，先给1滴血，用来满足放技能的需要
	%%这种死亡技能CD要长些，此处可使玩家一直死不掉，策划谨记
	CurLevel = getWingLevel(),
	case getCfg:getCfgByKey(cfg_wing, CurLevel) of
		#wingCfg{
			buff = BuffIDList,
			wing_regeneratio_CD = CDLength,
			wing_regeneratio = Ratio
		} ->
			?LOG_OUT("wing regeneration HP level:~p roleid:~p buffid:~p", [CurLevel, playerState:getRoleID(), BuffIDList]),
			case playerBase:checkWingRegenerationCD(0, CDLength) of
				true ->
					MaxHp = playerState:getMaxHp(),
					L = globalCfg:getWingRegeneratio(),
					case lists:keyfind(Ratio, 1, L) of
						{_, Ra} ->

							playerState:setCurHp(MaxHp * Ra / 100);
						_ ->
							playerState:setCurHp(1)
					end,
					NowCurHp = playerState:getCurHp(),
					PC = skill:getPercent(NowCurHp, MaxHp),
					playerBase:sendPropHpPC(PC),
					case BuffIDList of
						undefined ->
							skip;
						_ ->
							[playerBuff:addBuff(BuffID, CurLevel) || BuffID <- BuffIDList]
					end,
					true;
				_ ->
					?LOG_OUT("cding wing regeneration HP skip level:~p roleid:~p buffid:~p", [CurLevel, playerState:getRoleID(), BuffIDList]),
					false
			end;
		_ ->
			false
	end.


%%%%单物品使用逻辑(策划数值上控制，一个物品的经验只能升一级翅膀)
%%-spec useWingItem(MaxNum :: uint(), CurNum :: uint(), MinExp :: int(), MaxExp :: int()) -> uint().
%%useWingItem(MaxNum, CurNum, _MinExp, _MaxExp) when MaxNum =< CurNum ->
%%	MaxNum;
%%useWingItem(MaxNum, CurNum, MinExp, MaxExp) ->
%%	CurLevel = getWingLevel(),
%%	MaxLevel = lists:max(getCfg:get1KeyList(cfg_wing)),
%%	?DEBUG_OUT("useWingItem"),
%%	RealMaxNum =
%%		case getCfg:getCfgByArgs(cfg_wing, CurLevel) of
%%			#wingCfg{} when CurLevel + 1 > MaxLevel ->
%%				%%等级上限，不能在升
%%				playerMsg:sendErrorCodeMsg(?ErrorCode_CnWingLevelLimit),
%%				CurNum;
%%			#wingCfg{cast_money = CostMoney, exp = ConfExp, property = PropList} ->
%%				%%策划的经验随机时，为0就-1
%%				Exp =
%%					case misc:rand(MinExp, MaxExp) of
%%						0 -> -1;
%%						RandVal ->
%%							RandVal
%%					end,
%%				HasExp = getWingExp(),
%%				?LOG_OUT("wing exp:~p hasExp:~p curLevel:~p roleid:~p", [Exp, HasExp, CurLevel, playerState:getRoleID()]),
%%				CalcExp = HasExp + Exp,
%%				RealCalcExp =
%%					case CalcExp - ConfExp of
%%						Calc1 when Calc1 >= 0 ->
%%							NewLevel = CurLevel + 1,
%%							case getCfg:getCfgByArgs(cfg_wing, NewLevel) of
%%								#wingCfg{property = PropList2} ->
%%									ProVal = playerPropSync:getProp(?PubProp_WingLevel),
%%									<<IsShow:1, _Level:31>> = <<ProVal:32>>,
%%									<<NewPropWingLevel:32>> = <<IsShow:1, NewLevel:31>>,
%%									playerPropSync:setInt(?PubProp_WingLevel, NewPropWingLevel),
%%									playerEquip:changeProp(PropList, [], ?EquipOff, true),
%%									playerEquip:changeProp(PropList2, [], ?EquipOn, true),
%%									playerForce:calcPlayerForce(?PlayerWingForce, true),
%%									Calc1;
%%								_ ->
%%									?LOG_OUT("wing has max level roleid:~p", [playerState:getRoleID()]),
%%									ConfExp
%%							end;
%%						_ when CalcExp > 0 ->
%%							CalcExp;
%%						_ ->
%%							0
%%					end,
%%				OldExp2 = playerState:getWingExpAccPerItemUse(),
%%				playerState:setWingExpAccPerItemUse(Exp + OldExp2),
%%				playerPropSync:setInt(?PriProp_WingExp, RealCalcExp),
%%				?LOG_OUT("wing RealCalcExp:~p  curLevel:~p roleid:~p", [RealCalcExp, getWingLevel(), playerState:getRoleID()]),
%%				MaxNum;
%%			_ ->
%%				%%当前等级取不出翅膀配置
%%				playerMsg:sendErrorCodeMsg(?ErrorCode_CnWingNotOk),
%%				CurNum
%%		end,
%%	useWingItem(RealMaxNum, CurNum + 1, MinExp, MaxExp).