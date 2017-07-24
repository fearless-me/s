%%
%% @author zhongyunawei
%% @doc @todo 玩家技能相关.


-module(playerSkill).
-author(zhongyuanwei).

-include("playerPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	getObject/1,
	onUseSkill/5,
	onUseDashSkill/2,
	tickSkill/1,
	tickDashSkill/1,
	breakUseSkill/1,
	getSkillRemainCD/1,
	getMaxCourage/0,
	getPlayerSkillLevel/1
]).

%%触发技能
-export([
	addTriggerSkill/2,
	delTriggerSkill/1,
	deadTriggerSkill/1,
	assistTriggerSkill/1,
	attackTriggerSkill/4,
	releaseTriggerSkill/1,
	noAttackTriggerSkill/2
]).

%%调用技能
-export([
	addCallSkill/2,
	delCallSkill/1,
	addBuffCallSkill/2,
	delBuffCallSkill/1
]).

%%系统加成技能
-export([
	addGemSkill/2,
	delGemSkill/1,
	addGoodsSkill/2,
	delGoodsSkill/1,
	addGodWeaponSkill/2,
	delGodWeaponSkill/1,
	addMarriageSkill/2,
	delMarriageSkill/1,
	addWingSkill/2,
	delWingSkill/1,
	addFailrySkill/2,
	delFailrySkill/1,
	addSysSkill/2,
	delSysSkill/1,
	addGoddessSkill/2,
	delGoddessSkill/1,
	addPolymorphSkill/2,
	delPolymorphSkill/1
]).

%% 条件判断
-export([
	canUseSkill/1
]).

-export([
	upgradeSkillBuff/2
]).

%%玩家使用技能
-spec onUseSkill(SkillID, CodeList, SN, X, Y) -> ok | true when
	SkillID :: uint(),
	CodeList :: list(),
	SN :: uint(),
	X :: float(),
	Y :: float().
onUseSkill(SkillID, CodeList, SN, X, Y) ->
	IsTriSkill = skill:isTriggerSkill(SkillID),
	CurSkill = playerState:getCurUseSlowSkill(),
	onUseSkill(SkillID, CodeList, SN, X, Y, IsTriSkill, CurSkill).

%%引导技能和吟唱技能
onUseSkill(SkillID, CodeList, SN, X, Y, false, #recCurUseSkill{
	skillID = SkillID,
	serial = Serial,
	usedCount = Count,
	mainCode = MainCode,
	triggerTime = TT
}) when Serial =:= SN ->
	NowTime = time:getUTCNowMS(),
	#skillCfg{targetSearch = SearchType, durationTimes = Dura} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case isCanAttack(SearchType, CodeList, SkillID) of
		{Code, CodeList} when Code =:= MainCode ->
			if
				Dura =< Count ->
					breakUseSkill(true);
				NowTime + 100 < TT -> %%增加一点施法容错
					skip;
				true ->
					FilterCodeList = getFilterResList(SkillID, MainCode, CodeList, X, Y),
					castSkill(SkillID, FilterCodeList, MainCode, Count, SN),
					case Count + 1 =:= Dura of
						true ->
							breakUseSkill(false);
						_ ->
							skip
					end,
					true
			end;
		_ ->
			breakUseSkill(true)
	end;
%%正常使用技能
onUseSkill(SkillID, CodeList, SN, X, Y, IsTriSkill, _CurSkill) ->
	Res =
		case playerState:getSkipSkillCheck() of
			true ->
				true;
			_ ->
				case IsTriSkill of
					true ->
						canUseSkill0(SkillID);
					_ ->
						canUseSkill(SkillID)
				end
		end,
	onUseSkill1(SkillID, CodeList, SN, X, Y, Res).

onUseSkill1(SkillID, _CodeList, _SN, _X, _Y, skip) ->
	delUsedTriggerSkill(SkillID);
onUseSkill1(SkillID, CodeList, SN, X, Y, true) ->
	#skillCfg{targetSearch = SearchType} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case isCanAttack(SearchType, CodeList, SkillID) of
		{MainCode, CodeList} ->
			FilterCodeList = getFilterResList(SkillID, MainCode, CodeList, X, Y),
			useSkill(SkillID, FilterCodeList, MainCode, SN, X, Y),
			true;
		?ErrorCode_UseSkillErrorTargetDead ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_UseSkillErrorTargetDead, [lists:nth(1, CodeList)]);
		?ErrorCode_UseSkillErrorTargetCamp ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_UseSkillErrorTargetCamp, [lists:nth(1, CodeList)]);
		?ErrorCode_UseSkillErrorTarget ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_UseSkillErrorTarget, [lists:nth(1, CodeList)]);
		?ErrorCode_UseSkillErrorTargetDist ->
			case getObject(lists:nth(1, CodeList)) of
				#recMapObject{x = X1, y = Y1} ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_UseSkillErrorTargetDist, [lists:nth(1, CodeList), float(X1), float(Y1)]);
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_UseSkillErrorTargetDist, [lists:nth(1, CodeList), float(0), float(0)])
			end;
		_Error ->
			Code = playerState:getPlayerCode(),
			breakUseSkill(Code, SkillID, SN),
			skip
	end;
onUseSkill1(_SkillID, _CodeList, _SN, _X, _Y, Res) ->
	if
		is_number(Res) ->
			playerMsg:sendErrorCodeMsg(Res);
		true ->
			skip

	end.

%%玩家滑屏技能
-spec onUseDashSkill(X, Y) -> ok when
	X :: number(),
	Y :: number().
onUseDashSkill(X, Y) ->
	case canUseDashSkill(X, Y) of
		true ->
			%%打断技能
			breakUseSkill(true),
			setDashCD(),
			costDashPhys(),
			playerState:setPos(X, Y),
			playerState:setPlayerDashStatus({true, time:getUTCNowMS()}),
			PlayerCode = playerState:getPlayerCode(),
			Msg = #pk_GS2U_DashTo{
				code = PlayerCode,
				posX = X,
				posY = Y
			},
			playerMsg:sendMsgToNearPlayer(Msg, false),
			ok;
		Error ->
			playerMsg:sendErrorCodeMsg(Error)
	end,
	ok.

%%tick滑屏技能操作
-spec tickDashSkill(NowTime) -> ok when
	NowTime :: uint().
tickDashSkill(NowTime) ->
	case playerState:getPlayerDashStatus() of
		{true, Time} ->
			%%当滑屏技能超过2秒后,恢复状态
			case NowTime - Time >= 2000 of
				true ->
					playerState:setPlayerDashStatus({false, NowTime});
				_ ->
					skip
			end;
		_ ->
			skip
	end.

%%tick技能操作
-spec tickSkill(NowTime) -> ok when
	NowTime :: uint().
tickSkill(NowTime) ->
	SlotSkillList = playerState:getSlotSkill(),
	tickSkill(SlotSkillList, NowTime).

tickSkill([], _) ->
	ok;
tickSkill([#recSlotSkill{} = SS | List], NowTime) ->
	tickSpecSkill(SS),
	tickSkill(List, NowTime);
tickSkill([_ | List], NowTime) ->
	tickSkill(List, NowTime).

%%tick特殊技能
-spec tickSpecSkill(#recSlotSkill{}) -> ok.
tickSpecSkill(#recSlotSkill{skillID = SkillID, type = ?PassivitySkill}) ->
	#skillCfg{skillEx = Ex} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case is_list(Ex) of
		true ->
			SkillList = playerState:getSkill(),
			case lists:keyfind(SkillID, #recSkill.skillID, SkillList) of
				#recSkill{level = SkillLevel} ->
					Fun =
						fun(Element) ->
							case Element of
								{?SpecPassSkill1, Time, BuffID} ->
									delSpecSkill1(Time, BuffID, SkillLevel);
								{?SpecPassSkill2, PetID, BuffID} ->
									delSpecSkill2(PetID, BuffID, SkillLevel);
								{?SpecPassSkill3, Percent, BuffID} ->
									delSpecSkill3(Percent, BuffID, SkillLevel);
								{?SpecPassSkill4, Percent, BuffID} ->
									delSpecSkill4(Percent, BuffID, SkillLevel);
								_ ->
									skip
							end
						end,
					lists:foreach(Fun, Ex);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok;
tickSpecSkill(_) ->
	ok.

%% 技能升级，更新技能BUFF
upgradeSkillBuff(SkillID, _NewLv) ->
	SlotSkillList = playerState:getSlotSkill(),
	case lists:keyfind(SkillID, #recSlotSkill.skillID, SlotSkillList) of
		#recSlotSkill{type = ?PassivitySkill} ->
			#skillCfg{skillEx = Ex} = getCfg:getCfgPStack(cfg_skill, SkillID),
			case is_list(Ex) of
				true ->
					Fun =
						fun(Element) ->
							case Element of
								{?SpecPassSkill1, _Time, BuffID} ->
									playerBuff:delNoRepeatBuff(BuffID);
								{?SpecPassSkill2, _PetID, _BuffID} ->
									skip;
								{?SpecPassSkill3, _Percent, BuffID} ->
									playerBuff:delNoRepeatBuff(BuffID);
								{?SpecPassSkill4, _Percent, BuffID} ->
									playerBuff:delNoRepeatBuff(BuffID);
								_ ->
									skip
							end
						end,
					lists:foreach(Fun, Ex);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%%中断当前使用的技能
-spec breakUseSkill(IsSendBreak) -> ok when
	IsSendBreak :: boolean().
breakUseSkill(IsSendBreak) ->
	CurSkill = playerState:getCurUseSlowSkill(),
	breakUseSkill(CurSkill, IsSendBreak).
breakUseSkill(#recCurUseSkill{skillID = SkillID, serial = SN}, IsSendBreak) ->
	#skillCfg{skillType = Type, channalBuff = BuffList} = getCfg:getCfgPStack(cfg_skill, SkillID),
	if
		Type =:= ?SingSkill orelse Type =:= ?GuideSkill ->
			Msg = #pk_GS2U_BreakSkill{
				userCode = playerState:getPlayerCode(),
				skillId = SkillID,
				serial = SN
			},
			case BuffList =/= undefined of
				true ->
					[playerBuff:delSpecBuff(BuffID) || BuffID <- BuffList];
				_ ->
					skip
			end,
			case IsSendBreak of
				true ->
					playerMsg:sendMsgToNearPlayer(Msg, true);
				_ ->
					skip
			end,
			playerState:setCurUseSlowSkill(undefined);
		true ->
			playerState:setCurUseSlowSkill(undefined)
	end;
breakUseSkill(_, _IsSendBread) ->
	playerState:setCurUseSlowSkill(undefined),
	playerState:setCurUseFastSkill(undefined),
	ok.

breakUseSkill(Code, SkillID, SN) ->
	Msg = #pk_GS2U_BreakSkill{
		serial = SN,
		userCode = Code,
		skillId = SkillID
	},
	playerMsg:sendMsgToNearPlayer(Msg, true).

%%增加buff调用技能
-spec addBuffCallSkill(SkillID, Level) -> ok when
	SkillID :: uint(),
	Level :: uint().
addBuffCallSkill(0, _Level) ->
	ok;
addBuffCallSkill(SkillID, Level) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	addBuffCallSkill(Type, SkillID, Level).
addBuffCallSkill(?BuffCallSkill, SkillID, Level) ->
	addTempSkill(SkillID, Level),
	addTempSlotSkill(SkillID, ?BuffCallSkill),
	noticeUseCallSkill(SkillID);
addBuffCallSkill(_, _, _) ->
	ok.

%%删除buff调用技能
-spec delBuffCallSkill(SkillID) -> ok when
	SkillID :: uint().
delBuffCallSkill(0) ->
	ok;
delBuffCallSkill(SkillID) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	delBuffCallSkill(Type, SkillID).

delBuffCallSkill(?BuffCallSkill, SkillID) ->
	delTempSkill(SkillID),
	delTempSlotSkill(SkillID);
delBuffCallSkill(_, _) ->
	ok.

%%增加调用技能
-spec addCallSkill(SkillID, Level) -> ok when
	SkillID :: uint(),
	Level :: uint().
addCallSkill(0, _Level) ->
	ok;
addCallSkill(SkillID, Level) ->
	#skillCfg{misc = Misc, miscP1 = MiscArg} = getCfg:getCfgPStack(cfg_skill, SkillID),
	addCallSkill(Misc, MiscArg, Level).
addCallSkill(?SkillCall, SkillID, Level) ->
	#skillCfg{skillType = Type, skillEx = Ex} = getCfg:getCfgPStack(cfg_skill, SkillID),
	if
		Type =:= ?PassivitySkill andalso Ex =:= undefined ->
			playerEffect:addPassEffect(SkillID, Level);
		true ->
			skip
	end,
	addTempSkill(SkillID, Level),
	addTempSlotSkill(SkillID, Type);
addCallSkill(_, _, _) ->
	ok.

%%删除调用技能
-spec delCallSkill(SkillID) -> ok when
	SkillID :: uint().
delCallSkill(0) ->
	ok;
delCallSkill(SkillID) ->
	#skillCfg{misc = Misc, miscP1 = MiscArg} = getCfg:getCfgPStack(cfg_skill, SkillID),
	delCallSkill(Misc, MiscArg).
delCallSkill(?SkillCall, SkillID) ->
	#skillCfg{skillType = Type, skillEx = Ex} = getCfg:getCfgPStack(cfg_skill, SkillID),
	if
		Type =:= ?PassivitySkill andalso Ex =:= undefined ->
			playerEffect:delPassEffect(SkillID);
		true ->
			skip
	end,
	delTempSkill(SkillID),
	delTempSlotSkill(SkillID);
delCallSkill(_, _) ->
	ok.

%%增加触发技能
-spec addTriggerSkill(SkillID, Level) -> ok when
	SkillID :: uint(),
	Level :: uint().
addTriggerSkill(0, _) ->
	ok;
addTriggerSkill(SkillID, Level) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	Flag = lists:member(Type, ?TriggerSkill),
	addTriggerSkill(Flag, SkillID, Level, Type).
addTriggerSkill(true, SkillID, Level, Type) ->
	addTempSkill(SkillID, Level),
	addTempSlotSkill(SkillID, Type);
addTriggerSkill(_, _, _, _) ->
	ok.

%%删除触发技能
-spec delTriggerSkill(SkillID) -> ok when
	SkillID :: uint().
delTriggerSkill(0) ->
	ok;
delTriggerSkill(SkillID) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	Flag = lists:member(Type, ?TriggerSkill),
	delTriggerSkill(Flag, SkillID).
delTriggerSkill(true, SkillID) ->
	delTempSkill(SkillID),
	delTempSlotSkill(SkillID);
delTriggerSkill(_, _) ->
	ok.

%%增加翅膀技能
-spec addWingSkill(SkillID :: uint(), Level :: uint()) -> ok|skip.
addWingSkill(SkillID, Level) ->
	#skillCfg{
		skillClass = Class,
		skillType = SkillType,
		skillEx = Ex
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Class =:= ?PlayerWingSkill of
		true ->
			?LOG_OUT("addWingSkill sid:~p Level:~p roleid:~p", [SkillID, Level, playerState:getRoleID()]),
			addSysSkill(SkillType, Ex, SkillID, Level);
		_ ->
			skip
	end.

%%删除宝石技能
-spec delWingSkill(SkillID :: uint()) -> ok.
delWingSkill(SkillID) ->
	#skillCfg{
		skillClass = Class,
		skillType = SkillType,
		skillEx = Ex
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Class =:= ?PlayerWingSkill of
		true ->
			?LOG_OUT("delWingSkill sid:~p  roleid:~p", [SkillID, playerState:getRoleID()]),
			delSysSkill(SkillType, Ex, SkillID);
		_ ->
			skip
	end.

%%添加女神技能
addGoddessSkill(SkillID, Level) ->
	#skillCfg{
		skillClass = Class,
		skillType = SkillType,
		skillEx = Ex
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Class =:= ?GoddessSkill of
		true ->
			addSysSkill(SkillType, Ex, SkillID, Level);
		_ ->
			skip
	end.

%%删除女神技能
delGoddessSkill(SkillID) ->
	#skillCfg{
		skillClass = Class,
		skillType = SkillType,
		skillEx = Ex
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Class =:= ?GoddessSkill of
		true ->
			delSysSkill(SkillType, Ex, SkillID);
		_ ->
			skip
	end.


%%增加宝石技能
-spec addGemSkill(SkillID :: uint(), Level :: uint()) -> ok.
addGemSkill(SkillID, Level) ->
	#skillCfg{
		skillClass = Class,
		skillType = SkillType,
		skillEx = Ex
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Class =:= ?GemSkill of
		true ->
			addSysSkill(SkillType, Ex, SkillID, Level);
		_ ->
			skip
	end.

-spec addFailrySkill(SkillID :: uint(), Level :: uint()) -> ok.
addFailrySkill(SkillID, Level) ->
	#skillCfg{
		skillClass = Class,
		skillType = SkillType,
		skillEx = Ex
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Class =:= ?PetFairySkill of
		true ->
			addSysSkill(SkillType, Ex, SkillID, Level);
		_ ->
			skip
	end,
	ok.

%%删除宝石技能
-spec delGemSkill(SkillID :: uint()) -> ok.
delGemSkill(SkillID) ->

	#skillCfg{
		skillClass = Class,
		skillType = SkillType,
		skillEx = Ex
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Class =:= ?GemSkill of
		true ->
			delSysSkill(SkillType, Ex, SkillID);
		_ ->
			skip
	end.

-spec delFailrySkill(SkillID :: uint()) -> ok.
delFailrySkill(SkillID) ->
	#skillCfg{
		skillClass = Class,
		skillType = SkillType,
		skillEx = Ex
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Class =:= ?PetFairySkill of
		true ->
			delSysSkill(SkillType, Ex, SkillID);
		_ ->
			skip
	end.

%%增加装备物品对主人加成技能
-spec addGoodsSkill(SkillID :: uint(), Level :: uint()) -> ok.
addGoodsSkill(0, _Level) ->
	skip;
addGoodsSkill(SkillID, Level) ->
	#skillCfg{
		skillClass = Class,
		skillType = SkillType,
		skillEx = Ex
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Class =:= ?GoodsSkill of
		true ->
			?DEBUG_OUT("addGoodsSkill(~p)", [SkillID]),
			addSysSkill(SkillType, Ex, SkillID, Level);
		_ ->
			skip
	end.

%%删除装备物品对主人加成技能
-spec delGoodsSkill(SkillID :: uint()) -> ok.
delGoodsSkill(0) ->
	skip;
delGoodsSkill(SkillID) ->
	#skillCfg{
		skillClass = Class,
		skillType = SkillType,
		skillEx = Ex
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Class =:= ?GoodsSkill of
		true ->
			delSysSkill(SkillType, Ex, SkillID);
		_ ->
			skip
	end.

%%增加装备物品对主人加成技能
-spec addPolymorphSkill(SkillID :: uint(), Level :: uint()) -> ok.
addPolymorphSkill(0, _Level) ->
	skip;
addPolymorphSkill(SkillID, Level) ->
	#skillCfg{
		skillClass = Class,
		skillType = SkillType,
		skillEx = Ex
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Class =:= ?PolymorphRoleSkill of
		true ->
			?DEBUG_OUT("addGoodsSkill(~p)", [SkillID]),
			addSysSkill(SkillType, Ex, SkillID, Level);
		_ ->
			skip
	end.

%%删除装备物品对主人加成技能
-spec delPolymorphSkill(SkillID :: uint()) -> ok.
delPolymorphSkill(0) ->
	skip;
delPolymorphSkill(SkillID) ->
	#skillCfg{
		skillClass = Class,
		skillType = SkillType,
		skillEx = Ex
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Class =:= ?PolymorphRoleSkill of
		true ->
			delSysSkill(SkillType, Ex, SkillID);
		_ ->
			skip
	end.


%%增加神器技能
-spec addGodWeaponSkill(SkillID :: uint(), Level :: uint()) -> ok.
addGodWeaponSkill(0, _) ->
	ok;
addGodWeaponSkill(SkillID, Level) ->
	#skillCfg{
		skillClass = Class,
		skillType = SkillType,
		skillEx = Ex
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Class =:= ?GodWeaponSkill of
		true ->
			addSysSkill(SkillType, Ex, SkillID, Level);
		_ ->
			skip
	end,
	ok.

%%删除神器技能
-spec delGodWeaponSkill(SkillID :: uint()) -> ok.
delGodWeaponSkill(0) ->
	ok;
delGodWeaponSkill(SkillID) ->
	#skillCfg{
		skillClass = Class,
		skillType = SkillType,
		skillEx = Ex
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Class =:= ?GodWeaponSkill of
		true ->
			delSysSkill(SkillType, Ex, SkillID);
		_ ->
			skip
	end,
	ok.
addSysSkill(?PassivitySkill, undefined, SkillID, Level) ->
	playerEffect:addPassEffect(SkillID, Level);
addSysSkill(SkillType, _Ex, SkillID, Level) ->
	addTempSkill(SkillID, Level),
	addTempSlotSkill(SkillID, SkillType).

delSysSkill(?PassivitySkill, undefined, SkillID) ->
	playerEffect:delPassEffect(SkillID);
delSysSkill(?PassivitySkill, Ex, SkillID) ->
	playerSkillLearn:delPassEff(SkillID, Ex),
	delTempSkill(SkillID),
	delTempSlotSkill(SkillID);
delSysSkill(_, _, SkillID) ->
	delTempSkill(SkillID),
	delTempSlotSkill(SkillID).

%%增加夫妻技能
-spec addMarriageSkill(SkillID :: uint(), Level :: uint()) -> ok.
addMarriageSkill(SkillID, Level) ->
	#skillCfg{
		skillClass = Class,
		skillType = SkillType,
		skillEx = Ex
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Class =:= ?MarrigeSkill of
		true ->
			%?DEBUG_OUT("[DebugForMarriage] addMarriageSkill RoleID:~p will study ~w.~w", [playerState:getRoleID(), SkillID, Level]),
			addSysSkill(SkillType, Ex, SkillID, Level);
		_ ->
			?ERROR_OUT("addMarriageSkill skill(~p) is not marriage skill", [SkillID]),
			skip
	end,
	ok.

%% 删除夫妻技能
-spec delMarriageSkill(SkillID :: uint()) -> ok.
delMarriageSkill(SkillID) ->
	#skillCfg{
		skillClass = Class,
		skillType = SkillType,
		skillEx = Ex
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Class =:= ?MarrigeSkill of
		true ->
			delSysSkill(SkillType, Ex, SkillID);
		_ ->
			?ERROR_OUT("delMarriageSkill skill(~p) is not marriage skill", [SkillID]),
			skip
	end,
	ok.

%% 增加系统技能
-spec addSysSkill(SkillID :: uint(), Level :: uint()) -> ok.
addSysSkill(SkillID, Level) ->
	#skillCfg{
		skillType = SkillType,
		skillEx = Ex
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	addSysSkill(SkillType, Ex, SkillID, Level),
	ok.

%% 删除系统技能
-spec delSysSkill(SkillID :: uint()) -> ok.
delSysSkill(SkillID) ->
	#skillCfg{
		skillType = SkillType,
		skillEx = Ex
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	delSysSkill(SkillType, Ex, SkillID),
	ok.

%%攻击目标和被攻击触发技能
-spec attackTriggerSkill(Skill, HitList, TargetCode, TriType) -> ok when
	Skill :: uint(),
	HitList :: list(),
	TargetCode :: uint(),
	TriType :: uint().
attackTriggerSkill(SkillID, HitList, TargetCode, TriType) ->
	#skillCfg{
		skillType = SkillType,
		aggressivity = AttackType
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case lists:member(SkillType, ?TriggerSkill) of
		true ->
			ok;
		_ ->
			SkillList = getTriSkillList(SkillID, TriType),
			%?DEBUG_OUT("trigger skill list TriType=~p, =~p ~n~n",[TriType, SkillList]),
			attackTriggerSkill(SkillList, HitList, TargetCode, SkillType, AttackType)
	end.

attackTriggerSkill(SkillList, HitList, TargetCode, SkillType, AttackType) ->
	BitAType = skill:getAttackTypeBit(AttackType),
	AttackTime = playerState:getAttackIntervalTime(),
	Fun = fun(#recSlotSkill{skillID = SkillID}) ->
		#skillCfg{
			misc = Misc,
			triggerAggressi = Aggress,
			triggercondition = Cond,
			triggerChance = TriggerChance
		} = getCfg:getCfgPStack(cfg_skill, SkillID),
		%%触发概率跟技能等级相关
		TriggerChance1 = case TriggerChance of
							 undefined ->
								 [0, 0];
							 _ ->
								 TriggerChance
						 end,
		SkillList1 = playerState:getSkill(),
		#recSkill{level = SkillLevel} = lists:keyfind(SkillID, #recSkill.skillID, SkillList1),
		[Chance, LevelAdd] = TriggerChance1,
		NewChance = erlang:float(Chance + LevelAdd * (SkillLevel - 1)),
		Flag0 = skill:isTriggerBySkillType(SkillType, Misc),
		Flag1 =
			case Flag0 of
				true ->
					skill:isTriggerByAttackType(BitAType, Aggress);
				_ ->
					Flag0
			end,
		Flag2 =
			case Flag1 of
				true ->
					skill:isTriggerByPossible(NewChance, AttackTime);
				_ ->
					Flag1
			end,
		Flag3 =
			case Flag2 of
				true ->
					skill:isTriggerByAttackResult(Cond, HitList);
				_ ->
					Flag2
			end,
		case Flag3 of
			true ->
				Code = skill:getTriSkillCode(SkillID, TargetCode),
				noticeUseTriggerSkill(SkillID, Code);
			_ ->
				skip
		end
		  end,
	lists:foreach(Fun, SkillList).

%%非攻击触发技能
-spec noAttackTriggerSkill(SkillID, TargetCode) -> ok when
	SkillID :: uint() | list(),
	TargetCode :: uint().
noAttackTriggerSkill(SkillID, TargetCode) when is_integer(SkillID) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case lists:member(Type, ?TriggerSkill) of
		true ->
			ok;
		_ ->
			SkillList = getTriSkillList(SkillID, ?NoAttackTriggerSkill),
			noAttackTriggerSkill(SkillList, TargetCode)
	end;
noAttackTriggerSkill(SkillList, TargetCode) when is_list(SkillList) ->
	AttackTime = playerState:getAttackIntervalTime(),
	Fun = fun(#recSlotSkill{skillID = SkillID}) ->
		#skillCfg{triggerChance = TriggerChance} = getCfg:getCfgPStack(cfg_skill, SkillID),
		TriggerChance1 = case TriggerChance of
							 undefined ->
								 [0, 0];
							 _ ->
								 TriggerChance
						 end,
		%%触发概率跟技能等级相关
		[Chance, LevelAdd] = TriggerChance1,
		SkillList1 = playerState:getSkill(),
		#recSkill{level = SkillLevel} = lists:keyfind(SkillID, #recSkill.skillID, SkillList1),
		NewChance = erlang:float(Chance + LevelAdd * (SkillLevel - 1)),
		case skill:isTriggerByPossible(NewChance, AttackTime) of
			true ->
				Code = skill:getTriSkillCode(SkillID, TargetCode),
				noticeUseTriggerSkill(SkillID, Code);
			_ ->
				skip
		end
		  end,
	lists:foreach(Fun, SkillList).

%%释放技能触发
-spec releaseTriggerSkill(SkillID) -> ok when
	SkillID :: uint() | list().
releaseTriggerSkill(SkillID) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case lists:member(Type, ?TriggerSkill) of
		true ->
			ok;
		_ ->
			SkillList = getTriSkillList(SkillID, ?ReleaseTriggerSkill),
			#skillCfg{skillType = SkillType, aggressivity = AttackType} = getCfg:getCfgPStack(cfg_skill, SkillID),
			releaseTriggerSkill(SkillList, AttackType, SkillType)
	end.

releaseTriggerSkill(SkillList, AttackType, SkillType) ->
	BitAType = skill:getAttackTypeBit(AttackType),
	AttackTime = playerState:getAttackIntervalTime(),
	Fun = fun(#recSlotSkill{skillID = SkillID}) ->
		#skillCfg{
			misc = Misc,
			triggerAggressi = Aggress,
			triggerChance = TriggerChance
		} = getCfg:getCfgPStack(cfg_skill, SkillID),
		%%触发概率跟技能等级相关
		TriggerChance1 = case TriggerChance of
							 undefined ->
								 [0, 0];
							 _ ->
								 TriggerChance
						 end,
		[Chance, LevelAdd] = TriggerChance1,
		SkillList1 = playerState:getSkill(),
		#recSkill{level = SkillLevel} = lists:keyfind(SkillID, #recSkill.skillID, SkillList1),
		NewChance = erlang:float(Chance + LevelAdd * (SkillLevel - 1)),
		Flag0 = skill:isTriggerBySkillType(SkillType, Misc),
		Flag1 =
			case Flag0 of
				true ->
					skill:isTriggerByAttackType(BitAType, Aggress);
				_ ->
					Flag0
			end,
		Flag2 =
			case Flag1 of
				true ->
					skill:isTriggerByPossible(NewChance, AttackTime);
				_ ->
					Flag1
			end,
		case Flag2 of
			true ->
				Code = skill:getTriSkillCode(SkillID, 0),
				noticeUseTriggerSkill(SkillID, Code);
			_ ->
				skip
		end
		  end,
	lists:foreach(Fun, SkillList).

%%死亡技能触发
-spec deadTriggerSkill(Skill) -> ok when
	Skill :: uint() | list().
deadTriggerSkill(SkillID) when is_integer(SkillID) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case lists:member(Type, ?TriggerSkill) of
		true ->
			ok;
		_ ->
			SkillList = getTriSkillList(SkillID, ?DeadTriggerSkill),
			deadTriggerSkill(SkillList)
	end;
deadTriggerSkill(SkillList) when is_list(SkillList) ->
	AttackTime = playerState:getAttackIntervalTime(),
	Fun = fun(#recSlotSkill{skillID = SkillID}) ->
		#skillCfg{triggerChance = TriggerChance} = getCfg:getCfgPStack(cfg_skill, SkillID),
		%%触发概率跟技能等级相关
		TriggerChance1 = case TriggerChance of
							 undefined ->
								 [0, 0];
							 _ ->
								 TriggerChance
						 end,
		[Chance, LevelAdd] = TriggerChance1,
		SkillList1 = playerState:getSkill(),
		#recSkill{level = SkillLevel} = lists:keyfind(SkillID, #recSkill.skillID, SkillList1),
		NewChance = erlang:float(Chance + LevelAdd * (SkillLevel - 1)),
		case skill:isTriggerByPossible(NewChance, AttackTime) of
			true ->
				noticeUseTriggerSkill(SkillID, 0);
			_ ->
				skip
		end
		  end,
	lists:foreach(Fun, SkillList);
deadTriggerSkill(_) ->
	ok.

%%击杀目标或者协助击杀触发
-spec assistTriggerSkill(Skill) -> ok when
	Skill :: uint() | list().
assistTriggerSkill(SkillID) when is_integer(SkillID) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case lists:member(Type, ?TriggerSkill) of
		true ->
			ok;
		_ ->
			SkillList = getTriSkillList(SkillID, ?AssistTriggerSkill),
			assistTriggerSkill(SkillList)
	end;
assistTriggerSkill(SkillList) when is_list(SkillList) ->
	AttackTime = playerState:getAttackIntervalTime(),
	Fun = fun(#recSlotSkill{skillID = SkillID}) ->
		#skillCfg{triggerChance = TriggerChance} = getCfg:getCfgPStack(cfg_skill, SkillID),
		TriggerChance1 = case TriggerChance of
							 undefined ->
								 [0, 0];
							 _ ->
								 TriggerChance
						 end,
		[Chance, LevelAdd] = TriggerChance1,
		SkillList1 = playerState:getSkill(),
		#recSkill{level = SkillLevel} = lists:keyfind(SkillID, #recSkill.skillID, SkillList1),
		NewChance = erlang:float(Chance + LevelAdd * (SkillLevel - 1)),
		case skill:isTriggerByPossible(NewChance, AttackTime) of
			true ->
				noticeUseTriggerSkill(SkillID, 0);
			_ ->
				skip
		end
		  end,
	lists:foreach(Fun, SkillList);
assistTriggerSkill(_) ->
	ok.

%%删除使用的触发技能
-spec delUsedTriggerSkill(SkillID) -> ok when
	SkillID :: uint().
delUsedTriggerSkill(SkillID) ->
	TriList = playerState:getTriggerSkill(),
	NewTriList = lists:delete(SkillID, TriList),
	playerState:setTriggerSkill(NewTriList),
	ok.
%% ====================================================================
%% Internal functions
%% ====================================================================	

%% 引导型或者吟唱型技能的释放，如果没有目标则打断施法
-spec castSkill(SkillID, CodeList, MainCode, Count, SN) -> ok when
	SkillID :: uint(),
	CodeList :: list(),
	MainCode :: uint(),
	Count :: uint(),
	SN :: uint().
castSkill(SkillID, CodeList, MainCode, Count, SN) ->
	ActStatus = playerState:getActionStatus(),
	castSkill(SkillID, CodeList, MainCode, SN, Count, ActStatus).

castSkill(_SkillID, _CodeList, _MainCode, _SN, _Count, ?CreatureActionStatusDead) ->
	breakUseSkill(true);
castSkill(SkillID, CodeList, MainCode, SN, Count, _) ->
	SkillCfg = getCfg:getCfgPStack(cfg_skill, SkillID),
	IsAttack = (SkillCfg#skillCfg.aggressivity =/= 0),
	useSkill2(SkillID, SN, IsAttack, CodeList, MainCode),
	setCurSkill(SkillID, SN, Count + 1, CodeList, MainCode).

%%使用技能
-spec useSkill(SkillID, CodeList, MainCode, SN, X, Y) -> ok when
	SkillID :: skillId(),
	CodeList :: list(),
	MainCode :: uint(),
	SN :: uint(),
	X :: float(),
	Y :: float().
useSkill(SkillID, CodeList, MainCode, SN, X, Y) ->
	#skillCfg{
		countTime = Count,
		aggressivity = Agg,
		aoe = Aoe
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	%%设置技能操作
	setSkillOperate(SkillID, X, Y),
	%%消耗次数
	costSkillCount(SkillID, Count),
	%%扣道具
	%%useSkillDelItem(SkillID),
	%%如果为触发技能,需要清除
	delUsedTriggerSkill(SkillID),
	IsAttack = (Agg =/= 0),
	case Aoe of
		0 ->
			useSkill1(SkillID, SN, IsAttack, CodeList, MainCode);
		_ ->
			useAOESkill(SkillID, SN, IsAttack, CodeList, MainCode)
	end,
	ok.

%%使用AOE技能，如果是瞬发技能或者是第二类引导技能则筛选出AOE目标，再使用调用一般技能函数
%%如果是第一类引导技能则保留当前使用技能，处于引导状态
-spec useAOESkill(SkillID, SN, IsAttack, CodeList, MainCode) -> ok when
	SN :: uint(),
	SkillID :: skillId(),
	IsAttack :: boolean(),
	CodeList :: list(),
	MainCode :: uint().
useAOESkill(SkillID, SN, IsAttack, CodeList, MainCode) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	IsGuide = skill:is2ndGuideSkill(SkillID),
	IsTrigger = lists:member(Type, ?TriggerSkill),
	if
		Type =:= ?InstantSkill orelse IsTrigger =:= true orelse Type =:= ?CarrierSkill orelse IsGuide =:= true orelse Type =:= ?BuffCallSkill ->
			useSkill1(SkillID, SN, IsAttack, CodeList, MainCode);
		true ->
			broadcastUseSkill(SkillID, SN, CodeList),
			AttackTime = playerState:getAttackIntervalTime(),
			AttackSpeed = 0, %% playerState:getBattlePropTotal(?Prop_attackspeed),
			setCurSkill(SkillID, SN, 0, CodeList, AttackTime, AttackSpeed, MainCode)
	end,
	ok.

%%玩家使用技能
-spec useSkill1(SkillID, SN, IsAttack, CodeList, MainCode) -> ok when
	SN :: uint(),
	SkillID :: skillId(),
	IsAttack :: boolean(),
	CodeList :: list(),
	MainCode :: uint().
useSkill1(SkillID, SN, IsAttack, CodeList, MainCode) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	AttackTime = playerState:getAttackIntervalTime(),
	AttackSpeed = 0, %% playerState:getBattlePropTotal(?Prop_attackspeed),
	%%广播技能
	broadcastUseSkill(SkillID, SN, CodeList),
	%%设置当前技能信息
	setCurSkill(SkillID, SN, 0, CodeList, AttackTime, AttackSpeed, MainCode),
	%%如果为瞬发技能或者是第二种引导技能（引导开始即释放伤害）则直接计算伤害，
	%%否则只保留状态，后面施法结束时计算伤害
	IsTrigger = lists:member(Type, ?TriggerSkill),
	case Type =:= ?InstantSkill orelse Type =:= ?CarrierSkill orelse IsTrigger =:= true orelse Type =:= ?BuffCallSkill of
		true ->
			useSkill2(SkillID, SN, IsAttack, CodeList, MainCode);
		_ ->
			case skill:is2ndGuideSkill(SkillID) of
				true ->
					useSkill2(SkillID, SN, IsAttack, CodeList, MainCode);
				_ ->
					ok
			end
	end.

%%使用技能
-spec useSkill2(SkillID, SN, IsAttack, CodeList, MainCode) -> ok when
	SN :: uint(),
	SkillID :: skillId(),
	IsAttack :: boolean(),
	CodeList :: list(),
	MainCode :: uint().
useSkill2(SkillID, SN, IsAttack, CodeList, MainCode) ->
	costSkillEnergy(SkillID),
	SkillList = playerState:getSkill(),
	case lists:keyfind(SkillID, #recSkill.skillID, SkillList) of
		false ->
			skip;
		Skill ->
			Damage = #recDamage{
				magicDamage = playerState:getBattlePropTotal(?Prop_MagicAttack),
				physDamage = playerState:getBattlePropTotal(?Prop_PhysicalAttack)
			},
			useSkill3(IsAttack, SN, SkillID, Skill, Damage, MainCode, CodeList, SkillList)
	end,
	ok.

-spec useSkill3(IsAttack, SN, SkillID, Skill, Damage, MainCode, CodeList, SkillList) -> ok when
	IsAttack :: boolean(),
	SN :: uint(),
	SkillID :: uint(),
	Skill :: #recSkill{},
	Damage :: #recDamage{},
	MainCode :: uint(),
	CodeList :: list(),
	SkillList :: list().
useSkill3(true, SN, SkillID, Skill, Damage, MainCode, CodeList, SkillList) ->
	%%触发技能
	releaseTriggerSkill(SkillID),
	#skillCfg{misc = Misc, durationTimes = Times, damFactor = DamFactor} = getCfg:getCfgPStack(cfg_skill, SkillID),
	InternalTime = playerState:getAttackIntervalTime(),
	FactorValue = playerState:getBattlePropTotal(DamFactor),
	Prop_master = 0,%% playerState:getBattlePropTotal(?Prop_master),
	{true, Skill1} = skill:calcUserSkillDamage(Skill, Damage, FactorValue, Prop_master, InternalTime),
	NewSkill = lists:keyreplace(SkillID, #recSkill.skillID, SkillList, Skill1),
	playerState:setSkill(NewSkill),
	SpecSkillList = getSpecSkill(),
	NewList = skill:clacAttackTargetNum(Misc, Times, CodeList),
	playerBattle:attack(Skill1, SN, NewList, SpecSkillList, MainCode),
	playerEffect:addSkillUseEffect(SkillID, Skill1#recSkill.level);
useSkill3(_, SN, SkillID, Skill, Damage, MainCode, CodeList, SkillList) ->
	releaseTriggerSkill(SkillID),
	{true, Skill1} = skill:calcUserSkillTreat(Skill, Damage),
	NewSkill = lists:keyreplace(SkillID, #recSkill.skillID, SkillList, Skill1),
	playerState:setSkill(NewSkill),
	playerBattle:treat(Skill1, SN, CodeList, MainCode),
	playerEffect:addSkillUseEffect(SkillID, Skill1#recSkill.level).

%------------------------------------------
%使用技能
%------------------------------------------
-spec setSkillOperate(SkillID, X, Y) -> ok when
	SkillID :: skillId(),
	X :: float(),
	Y :: float().
setSkillOperate(SkillID, X, Y) ->
	setStop(SkillID),
	setSkillCD(SkillID),
	setComboSkill(SkillID),
	playerState:setPos(X, Y),
	playerState:setCurUseSkillEffect([]),
	ok.

%%设置玩家使用技能停止
-spec setStop(SkillID) -> ok when
	SkillID :: uint().
setStop(SkillID) ->
	ActStatus = playerState:getActionStatus(),
	setStop(SkillID, ActStatus).
setStop(SkillID, ?CreatureActionStatusMove) ->
	case skill:isCallSkill(SkillID) of
		false ->
			case skill:isTriggerSkill(SkillID) of
				false ->
					case skill:isBreakSkill(SkillID) of
						true ->
							playerMove:stopMove(false);
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end;
setStop(_, _) ->
	ok.

%%设置技能CD
-spec setSkillCD(SkillID) -> ok when
	SkillID :: skillId().
setSkillCD(SkillID) ->
	Time = time:getUTCNowMSDiff2010(),
	SkillCfg = getCfg:getCfgPStack(cfg_skill, SkillID),
	GID = SkillCfg#skillCfg.skillCoolDownGroup,
	GlobeCoolDown = SkillCfg#skillCfg.skill_GlobeCoolDown,
	CDTime = calcCDTime(SkillID),
	%%设置自身CD
	SkillCDList = playerState:getSkillCD(),
	%%?LOG_OUT("playerName [~ts] skill [~p], cdtime is [~p], nowTime [~p] ",[playerState:getName(), SkillID, CDTime, Time]),
	case lists:keyfind(SkillID, 1, SkillCDList) of
		false ->
			NewSkillCDList = [{SkillID, Time + CDTime} | SkillCDList];
		_ ->
			NewSkillCDList = lists:keyreplace(SkillID, 1, SkillCDList, {SkillID, Time + CDTime})
	end,
	playerState:setSkillCD(NewSkillCDList),

	%%检测这个技能是否触发组CD
	SkillGCDList = playerState:getSkillGroupCD(),
	NewSkillGCDList =
		case GID > 0 of
			true ->
				case lists:keyfind(GID, 1, SkillGCDList) of
					false ->
						[{GID, Time} | SkillGCDList];
					_ ->
						lists:keyreplace(GID, 1, SkillGCDList, {GID, Time})
				end;
			_ ->
				SkillGCDList
		end,
	playerState:setSkillGroupCD(NewSkillGCDList),
	if
		GlobeCoolDown =:= 0 ->
%%			AttackSpeed = playerState:getBattlePropTotal(?Prop_attackspeed),
			AIT0 = playerState:getAttackIntervalTime(),
			%%计算减少后的公共CD时间
%%			AIT = AIT0 / (1 + AttackSpeed),
			playerState:setGlobalCD(Time + AIT0);
		GlobeCoolDown > 0 ->
			playerState:setGlobalCD(GlobeCoolDown);
		true ->
			skip
	end,
	%%检测这个技能是否触发全局CD
	%%playerState:setGlobalCD(GlobeCoolDown),
	ok.

%%设置连击技能
-spec setComboSkill(SkillID) -> ok when
	SkillID :: skillId().
setComboSkill(SkillID) ->
	Carrer = playerState:getCareer(),
	SkillCfg = getCfg:getCfgPStack(cfg_skill, SkillID),
	setComboSkill(Carrer, SkillCfg#skillCfg.comboID, SkillID).
setComboSkill(_Carrer, 0, _SkillID) ->
	ok;
setComboSkill(?Career_30_Bravo, ComboID, SkillID) ->
	Now = time:getUTCNowMSDiff2010(),
	ComboSkillList = playerState:getComboSkill(),
	case lists:keyfind(ComboID, #comboSkill.comboID, ComboSkillList) of
		#comboSkill{} ->
			updateComboSkill(Now, SkillID, ComboID);
		_ ->
			addComboSkill(Now, SkillID, ComboID)
	end;
setComboSkill(_Carrer, _ComboID, _SkillID) ->
	ok.

%%增加连击技能
-spec addComboSkill(Now, SkillID, ComboID) -> ok when
	Now :: uint(),
	SkillID :: skillId(),
	ComboID :: uint().
addComboSkill(Now, SkillID, ComboID) ->
	ComboSkillList = playerState:getComboSkill(),
	ComboSkill = #comboSkill{skillID = SkillID,
		comboID = ComboID,
		lasttime = Now},
	NewComBoSkillList = [ComboSkill | ComboSkillList],
	playerState:setComboSkill(NewComBoSkillList),
	ok.

%%更新连击技能
-spec updateComboSkill(Now, SkillID, ComboID) -> ok when
	Now :: uint(),
	SkillID :: skillId(),
	ComboID :: uint().
updateComboSkill(Now, SkillID, ComboID) ->
	ComboSkillList = playerState:getComboSkill(),
	ComboSkill = #comboSkill{skillID = SkillID,
		comboID = ComboID,
		lasttime = Now},
	NewComBoSkillList = lists:keyreplace(ComboID, #comboSkill.comboID, ComboSkillList, ComboSkill),
	playerState:setComboSkill(NewComBoSkillList),
	ok.

%%设置滑屏CD
-spec setDashCD() -> ok.
setDashCD() ->
	Time = time:getUTCNowMSDiff2010(),
	playerState:setDashCD(Time),
	ok.

%%设置当前技能
-spec setCurSkill(SkillID, SN, Count, CodeList, AttackTime, AttackSpeed, MainCode) -> ok when
	SkillID :: skillId(),
	SN :: uint(),
	Count :: uint(),
	CodeList :: list(),
	AttackTime :: uint(),
	AttackSpeed :: number(),
	MainCode :: uint().
setCurSkill(SkillID, SN, Count, CodeList, AttackTime, AttackSpeed, MainCode) ->
	#skillCfg{skillType = Type, castFactor = CastFactor, costEnergy = CostEnergy, costFactor = CostFactor} = getCfg:getCfgPStack(cfg_skill, SkillID),
	CalcEnergy = calcCostEnergy(float(CostEnergy), CostFactor),
	CastValue = playerState:getBattlePropTotal(CastFactor),
	TT = skill:getTriggerTime(SkillID, AttackTime, AttackSpeed, CastValue),
	CurSkill = #recCurUseSkill{
		skillID = SkillID,
		serial = SN,
		usedCount = Count,
		mainCode = MainCode,
		targetCode = CodeList,
		triggerTime = TT,
		costEnergy = CalcEnergy
	},
	case Type =:= ?SingSkill orelse Type =:= ?GuideSkill of
		true ->
			playerState:setCurUseSlowSkill(CurSkill);
		_ ->
			playerState:setCurUseFastSkill(CurSkill)
	end,
	ok.

-spec setCurSkill(SkillID, SN, Count, CodeList, MainCode) -> ok when
	SkillID :: skillId(),
	SN :: uint(),
	Count :: uint(),
	CodeList :: list(),
	MainCode :: uint().
setCurSkill(SkillID, SN, Count, CodeList, MainCode) ->
	CurSkill = playerState:getCurUseSlowSkill(),
	NewCurSkill = CurSkill#recCurUseSkill{
		skillID = SkillID,
		serial = SN,
		usedCount = Count,
		mainCode = MainCode,
		targetCode = CodeList
	},
	playerState:setCurUseSlowSkill(NewCurSkill),
	ok.

%%消耗滑屏体力值
-spec costDashPhys() -> ok.
costDashPhys() ->
	Carrer = playerState:getCareer(),
	CurPhys = playerState:getCurPhys(),
	NeedPhys = skill:getDashPhys(Carrer),
	playerState:setCurPhys(CurPhys - NeedPhys),
	playerBase:sendPropPhys(CurPhys - NeedPhys),
	ok.

%%消耗技能次数
-spec costSkillCount(SkillID, CountTime) -> ok when
	SkillID :: skillId(),
	CountTime :: int().
costSkillCount(SkillID, CountTime) when CountTime > 0 ->
	SlotSkillList = playerState:getSlotSkill(),
	case lists:keyfind(SkillID, #recSlotSkill.skillID, SlotSkillList) of
		false ->
			skip;
		SlotSkill ->
			NewSlotSkill = SlotSkill#recSlotSkill{canUseCount = SlotSkill#recSlotSkill.canUseCount - 1},
			NewSlotSkillList = lists:keyreplace(SkillID, #recSlotSkill.skillID, SlotSkillList, NewSlotSkill),
			playerState:setSlotSkill(NewSlotSkillList)
	end,
	ok;
costSkillCount(_SkillID, _CountTime) ->
	ok.

%%消耗能量值或者怒气值
-spec costSkillEnergy(SkillID) -> ok when
	SkillID :: uint().
costSkillEnergy(SkillID) ->
	#skillCfg{skillClass = SkillClass, skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case SkillClass of
		%%神器技能特殊处理
		?GodWeaponSkill ->
			case Type =:= ?InstantSkill of
				true ->
					%%如果能放怒气必定消耗完
					case playerState:getCourageCostFlag() > 0 of
						true ->
							%%GM测试无消耗
							skip;
						_ ->
							playerState:setPlayerCourage(0),
							playerBase:sendPropCour(0)
					end;
				_ ->
					skip
			end;
		_ ->
			case Type =:= ?SingSkill orelse Type =:= ?GuideSkill of
				true ->
					UseSkill = playerState:getCurUseSlowSkill();
				_ ->
					UseSkill = playerState:getCurUseFastSkill()
			end,
			PowerEnergy = playerBase:getSpecBattlePropPower(),

			CostEnergy = UseSkill#recCurUseSkill.costEnergy,
			MaxEnergy = playerBase:getMaxSpecBattlePropPower(),
			CurEnergy = misc:clamp(PowerEnergy + CostEnergy, 0, MaxEnergy),
			playerBase:setSpecBattlePropPower(CurEnergy),
			playerBase:sendPropSp(trunc(CurEnergy), trunc(PowerEnergy)),
			costEnergyBlackBlood(abs(CostEnergy))
	end.

-spec calcCostEnergy(CostEnergy, CostFactor) -> number() when
	CostEnergy :: number(),
	CostFactor :: number().
calcCostEnergy(0.0, _) ->
	0;
calcCostEnergy(CostEnergy, CostFactor) ->
	0.
%%	SaveEnergy = playerState:getBattlePropTotal(?Prop_saveenergy),
%%	CostValue = playerState:getBattlePropTotal(CostFactor),
%%	case getCfg:getCfgPStack(cfg_globalsetup, coolspeedfactor) of
%%		#globalsetupCfg{setpara = [Value]} ->
%%			(CostEnergy / (1 + Value * SaveEnergy)) * (1 - CostValue);
%%		_ ->
%%			CostEnergy * (1 - CostValue)
%%	end.

%%消耗能量回血
-spec costEnergyBlackBlood(CostEnergy) -> ok when
	CostEnergy :: float().
costEnergyBlackBlood(CostEnergy) ->
	Career = playerState:getCareer(),
	CurHp = playerState:getCurHp(),
	MaxHp = playerState:getMaxHp(),
	if
		Career =:= ?Career_10_Warrior orelse Career =:= ?CareerTrainee ->
			ok;
%%			GetHealfactor = playerState:getBattlePropTotal(?Prop_gethealfactor),
%%			Regainmast = playerState:getBattlePropTotal(?Prop_regainmast),
%%			MaxSpec = playerBase:getSpecBattlePropRestorePower(),
%%			BlackBlood = CostEnergy * MaxSpec * GetHealfactor * (1 + Regainmast),
%%			NewHp = erlang:trunc(misc:clamp(CurHp + BlackBlood, 0, MaxHp)),
%%			playerState:setCurHp(NewHp),
%%			playerBattle:noticeBlood(NewHp, CurHp);
		true ->
			skip
	end,
	ok.

%%广播当前使用的技能
-spec broadcastUseSkill(SkillID, SN, TargetCodeList) -> ok when
	SkillID :: skillId(),
	SN :: uint(),
	TargetCodeList :: list().
broadcastUseSkill(SkillID, SN, TargetCodeList) ->
	#skillCfg{castFactor = CastFactor, channalBuff = BuffList, skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	SelfCode = playerState:getPlayerCode(),
	Level = playerState:getLevel(),
	AttackSpeed = 0, %% playerState:getBattlePropTotal(?Prop_attackspeed),
	AttackTime = playerState:getAttackIntervalTime(),
	CastValue = playerState:getBattlePropTotal(CastFactor),
	case Type =:= ?GuideSkill andalso BuffList =/= undefined of
		true ->
			[playerBuff:addSpecBuff(BuffID, Level) || BuffID <- BuffList];
		_ ->
			skip
	end,
	UseSkill = #pk_GS2U_UseSkillToObject{
		userCode = SelfCode,
		skillId = SkillID,
		serial = SN,
		targetCodeList = TargetCodeList,
		time = skill:getSkillParam(SkillID, AttackTime, AttackSpeed, CastValue)
	},
	playerMsg:sendMsgToNearPlayer(UseSkill, true).

%%通知客服端当前触发技能
-spec noticeUseTriggerSkill(SkillID, TargetCode) -> ok when
	SkillID :: uint(),
	TargetCode :: uint().
noticeUseTriggerSkill(SkillID, TargetCode) ->
	TriList = playerState:getTriggerSkill(),
	PlayerCode = playerState:getPlayerCode(),
	case canUseSkill(SkillID) of
		true ->
			UseTriggerSkill = #pk_GS2U_TriggerSkill{
				skillId = SkillID,
				userCode = PlayerCode,
				targetCode = TargetCode
			},
			playerMsg:sendNetMsg(UseTriggerSkill),
			playerState:setTriggerSkill([SkillID | TriList]);
		_Error ->
			skip
	end.

%%计算剩余CD
-spec getSkillRemainCD(SkillID) -> uint() when
	SkillID :: uint().
getSkillRemainCD(SkillID) ->
	Time = time:getUTCNowMSDiff2010(),
	SkillCDList = playerState:getSkillCD(),
	case lists:keyfind(SkillID, 1, SkillCDList) of
		{SkillID, CDTime} ->
			case Time >= CDTime of
				true ->
					0;
				_ ->
					CDTime - Time
			end;
		_ ->
			0
	end.

-spec noticeUseCallSkill(SkillID) -> ok when
	SkillID :: uint().
noticeUseCallSkill(SkillID) ->
	PlayerCode = playerState:getPlayerCode(),
	UseCallSkill = #pk_GS2U_CallSkill{
		userCode = PlayerCode,
		skillId = SkillID
	},
	playerMsg:sendNetMsg(UseCallSkill).

%------------------------------------------
%使用技能校验
%------------------------------------------
%%检查技能是否存在
-spec canUseSkill(SkillID) -> skip | true | uint() when
	SkillID :: uint().
canUseSkill(SkillID) ->
	%%首先检查状态，如果状态不对，则后面的检查都不执行了，以提高效率
	case checkUseSkillActionState() of
		true ->
			case getCfg:getCfgPStack(cfg_skill, SkillID) of
				#skillCfg{} = Skill ->
					canUseSkill1(Skill);
				_ ->
					case skill:isTriggerSkill(SkillID) of
						true ->
							skip;
						_ ->
							?ErrorCode_UseSkillErrorSkill
					end
			end;
		_ ->
			skip
	end.

%%检查触发技能是否存在
-spec canUseSkill0(SkillID) -> true | skip when
	SkillID :: uint().
canUseSkill0(SkillID) ->
	TriList = playerState:getTriggerSkill(),
	case lists:member(SkillID, TriList) of
		true ->
			true;
		_ ->
			skip
	end.

%%检查技能是否学习
canUseSkill1(Skill) ->
	IsCheck = lists:member(Skill#skillCfg.skillClass, ?RoleSkill),
	case checkUseSkillLearn(IsCheck, Skill#skillCfg.skillID) of
		true ->
			canUseSkill2(Skill);
		_ ->
			case skill:isTriggerSkill(Skill#skillCfg.skillID) of
				true ->
					skip;
				_ ->
					?ErrorCode_UseSkillErrorNotLearn
			end

	end.

%%检查是否为主动技能
canUseSkill2(Skill) ->
	case checkUseSkillIsActive(Skill#skillCfg.skillType) of
		true ->
			canUseSkill3(Skill);
		_ ->
			case skill:isTriggerSkill(Skill#skillCfg.skillID) of
				true ->
					skip;
				_ ->
					?ErrorCode_UseSkillErrorNotActive
			end
	end.

%%检查技能使用次数
canUseSkill3(Skill) ->
	case checkUseSkillCount(Skill) of
		true ->
			canUseSkill4(Skill);
		_ ->
			case skill:isTriggerSkill(Skill#skillCfg.skillID) of
				true ->
					skip;
				_ ->
					?ErrorCode_UseSkillErrorNoUseCounter
			end
	end.

%%检查能量值
canUseSkill4(Skill) ->
	case checkUseSkillEnergy(Skill) of
		true ->
			canUseSkill5(Skill);
		_ ->
			case skill:isTriggerSkill(Skill#skillCfg.skillID) of
				true ->
					skip;
				_ ->
					?ErrorCode_UseSkillErrorNoEnergy
			end
	end.
%%检查武器判定
canUseSkill5(Skill) ->
	case checkUseSkillWeapon(Skill#skillCfg.weaponNeed) of
		true ->
			canUseSkill6(Skill);
		_ ->
			case skill:isTriggerSkill(Skill#skillCfg.skillID) of
				true ->
					skip;
				_ ->
					?ErrorCode_UseSkillErrorNoMatchWeapon
			end
	end.
%%检查魔法系技能
canUseSkill6(Skill) ->
	case checkUseSkillMagic(Skill#skillCfg.skillSchool) of
		true ->
			canUseSkill7(Skill);
		_ ->
			case skill:isTriggerSkill(Skill#skillCfg.skillID) of
				true ->
					skip;
				_ ->
					?ErrorCode_UseSkillErrorNoRelease
			end
	end.
%%检查人物特殊状态
canUseSkill7(Skill) ->
	case checkUseSkillState(Skill#skillCfg.weaponNeed, Skill#skillCfg.use_Spec) of
		true ->
			canUseSkill8(Skill);
		_ ->
			case skill:isTriggerSkill(Skill#skillCfg.skillID) of
				true ->
					skip;
				_ ->
					?ErrorCode_UseSkillErrorNoMagic
			end
	end.
%%检查特殊职业使用技能
canUseSkill8(Skill) ->
	Carrer = playerState:getCareer(),
	case checkUseSkillCareer(Carrer, Skill#skillCfg.comboID, Skill#skillCfg.skillID) of
		true ->
			canUseSkill9(Skill);
		_ ->
			case skill:isTriggerSkill(Skill#skillCfg.skillID) of
				true ->
					skip;
				_ ->
					?ErrorCode_UseSkillErrorCombo
			end
	end.

%%检查技能CD
canUseSkill9(Skill) ->
	case checkUseSkillCD(Skill#skillCfg.skillID) of
		true ->
			canUseSkill11(Skill);
		globalCD ->
			case skill:isTriggerSkill(Skill#skillCfg.skillID) of
				true ->
					canUseSkill11(Skill);
				_ ->
					?ErrorCode_UseSkillErrorGlobalCD
			end;
		_ ->
			case skill:isTriggerSkill(Skill#skillCfg.skillID) of
				true ->
					skip;
				_ ->
					?ErrorCode_UseSkillErrorCD
			end
	end.

%%检查变身技能
canUseSkill11(Skill) ->
	case Skill#skillCfg.skillClass of
		?ShapegetSkill ->
			Status = playerState:getStatus(),
			case misc:testBit(Status, ?CreatureSpeStautsShapeShifte) of
				true ->
					true;
				_ ->
					?ErrorCode_UseSkillErrorTranSkill
			end;
		_ ->
			true
	end.

%%检查技能是否学习
-spec checkUseSkillLearn(IsCheck, SkillID) -> boolean() when
	IsCheck :: boolean(),
	SkillID :: uint().
checkUseSkillLearn(true, SkillID) ->
	SkillList = playerState:getSkill(),
	case lists:keyfind(SkillID, #recSkill.skillID, SkillList) of
		#recSkill{} ->
			true;
		_ ->
			false
	end;
checkUseSkillLearn(_, _SkillID) ->
	true.

%%检查是否为主动技能
-spec checkUseSkillIsActive(SkillType) -> boolean() when
	SkillType :: uint().
checkUseSkillIsActive(?PassivitySkill) ->
	false;
checkUseSkillIsActive(_) ->
	true.

%%检查技能使用次数
-spec checkUseSkillCount(Skill) -> boolean() when
	Skill :: #skillCfg{}.
checkUseSkillCount(#skillCfg{
	skillID = SkillID,
	countTime = CountTime,
	maxCount = MaxCount
} = Skill) ->
	Now = time:getUTCNowMS(),
	SlotSkillList = playerState:getSlotSkill(),
	case lists:keyfind(Skill#skillCfg.skillID, #recSlotSkill.skillID, SlotSkillList) of
		#recSlotSkill{canUseCount = Count, time = Time} = SlotSkill ->
			case Skill#skillCfg.countTime =< 0 of
				true ->
					true;
				_ ->
					AccuCount = (Now - Time) div CountTime,
					if
						AccuCount + Count =:= 0 ->
							false;
						AccuCount + Count > MaxCount ->
							NewSlotSkill = SlotSkill#recSlotSkill{
								canUseCount = MaxCount,
								time = Now
							},
							NewSlotSkillList = lists:keyreplace(SkillID, #recSlotSkill.skillID, SlotSkillList, NewSlotSkill),
							playerState:setSlotSkill(NewSlotSkillList),
							true;
						true ->
							Rem = (Now - Time) rem CountTime,
							NewSlotSkill = SlotSkill#recSlotSkill{
								canUseCount = AccuCount + Count,
								time = Now - Rem
							},
							NewSlotSkillList = lists:keyreplace(SkillID, #recSlotSkill.skillID, SlotSkillList, NewSlotSkill),
							playerState:setSlotSkill(NewSlotSkillList),
							true
					end
			end;
		_ ->
			true
	end.

%%检查技能能量值
-spec checkUseSkillEnergy(Skill) -> boolean() when
	Skill :: #skillCfg{}.
checkUseSkillEnergy(Skill) ->
	CostEnergy = Skill#skillCfg.costEnergy,
	SkillType = Skill#skillCfg.skillType,
	DurationTime = Skill#skillCfg.durationTimes,
	CostFactor = Skill#skillCfg.costFactor,
	CastStep = Skill#skillCfg.castStep,
	CostCourage = getMaxCourage(),
	SkillClass = Skill#skillCfg.skillClass,
	case SkillClass =:= ?GodWeaponSkill andalso SkillType =:= ?InstantSkill of
		%%神器技能消耗怒气
		true ->
			checkUseSkillCourage(-CostCourage);
		_ ->
			checkUseSkillEnergy(CostEnergy, SkillType, DurationTime, CostFactor, CastStep)
	end.

checkUseSkillEnergy(0, _Type, _Time, _CostFactor, _CastStep) ->
	true;
checkUseSkillEnergy(0.0, _Type, _Time, _CostFactor, _CastStep) ->
	true;
checkUseSkillEnergy(CostEnergy, Type, Times, CostFactor, CastStep) ->
	true.
%%	SaveEnergy = playerState:getBattlePropTotal(?Prop_saveenergy),
%%	CostValue = playerState:getBattlePropTotal(CostFactor),
%%	PowerEnergy = playerBase:getSpecBattlePropPower(),
%%	if
%%		?GuideSkill =:= Type andalso CastStep =:= 1 ->
%%			TotalCost = CostEnergy * (Times + 1);
%%		?GuideSkill =:= Type ->
%%			TotalCost = CostEnergy * Times;
%%		true ->
%%			TotalCost = CostEnergy
%%	end,
%%	case getCfg:getCfgPStack(cfg_globalsetup, coolspeedfactor) of
%%		#globalsetupCfg{setpara = [Value]} ->
%%			FinalCost = (TotalCost / (1 + Value * SaveEnergy)) * (1 - CostValue);
%%		_ ->
%%			FinalCost = TotalCost * (1 - CostValue)
%%	end,
%%	if
%%		FinalCost >= 0 ->
%%			true;
%%		true ->
%%			case PowerEnergy >= abs(FinalCost) of
%%				true ->
%%					true;
%%				_ ->
%%					false
%%			end
%%	end.
-spec checkUseSkillCourage(CostCourage :: float()) -> boolean().
checkUseSkillCourage(CostCourage) ->
	CurCourage = playerState:getPlayerCourage(),
	CurCourage + CostCourage >= 0.
%%检查武器判定技能
-spec checkUseSkillWeapon(IsNeedWeapon) -> boolean() when
	IsNeedWeapon :: uint().
checkUseSkillWeapon(0) ->
	true;
checkUseSkillWeapon(WeaponType) when WeaponType > ?EquipSubTypeNon andalso WeaponType =< ?EquipSubMax ->
	EquipList = playerState:getEquips(),
	case lists:keyfind(?EquipTypeWeapon, #recEquipEnhance.type, EquipList) of
		#recEquipEnhance{subType = SubType} ->
			SubType =:= WeaponType;
		_ ->
			false
	end;
checkUseSkillWeapon(_) ->
	false.

%%检查魔法系技能,如果沉默,不能使用该技能
-spec checkUseSkillMagic(SkillSchool) -> boolean() when
	SkillSchool :: uint().
checkUseSkillMagic(?SkillMixture) ->
	true;
checkUseSkillMagic(?SkillPhysisc) ->
	true;
checkUseSkillMagic(?SkillMagic) ->
	Status = playerState:getStatus(),
	misc:testBit(Status, ?CreatureSpeStautsSilence) =/= true.

%%检查人物特殊状态
-spec checkUseSkillState(IsWeaponNeed, UseSpec) -> boolean() when
	IsWeaponNeed :: uint(),
	UseSpec :: uint().
checkUseSkillState(IsWeaponNeed, UseSpec) ->
	Status = playerState:getStatus(),
	IsUseSpec = UseSpec =:= ?NoUseSpec,
	Flag = misc:testBit(Status, ?CreatureSpeStautsDisarm) andalso lists:member(IsWeaponNeed, ?MajorWeapon),
	checkUseSkillState1(IsWeaponNeed, IsUseSpec, Flag).
%%缴械状态
checkUseSkillState1(_IsWeaponNeed, _IsUseSpec, true) ->
	false;
checkUseSkillState1(IsWeaponNeed, IsUseSpec, _) ->
	Status = playerState:getStatus(),
	Flag = misc:testBit(Status, ?CreatureSpeStatusComa) orelse misc:testBit(Status, ?CreatureSpeStautsFreeze)
		orelse misc:testBit(Status, ?CreatureSpeStautsDeformation) orelse misc:testBit(Status, ?CreatureSpeStautsNoControl),
	checkUseSkillState2(IsWeaponNeed, IsUseSpec, Flag).

%%眩晕，冰冻，变身 不受控制状态
checkUseSkillState2(_IsWeaponNeed, true, true) ->
	false;
checkUseSkillState2(_IsWeaponNeed, _IsUseSpec, _Flag) ->
	true.

%%检查职业特殊技能连击(刺客技能连击)
-spec checkUseSkillCareer(Career, ComboID, SkillID) -> boolean() when
	Career :: uint(),
	ComboID :: uint(),
	SkillID :: uint().
checkUseSkillCareer(_Career, 0, _SkillID) ->
	true;
%%checkUseSkillCareer(?Career_30_Bravo, ComboID, SkillID) ->
%%	ComboSkillList = playerState:getComboSkill(),
%%	case lists:keyfind(ComboID, #comboSkill.comboID, ComboSkillList) of
%%		#comboSkill{} = ComboSkill ->
%%			checkComboSkill(ComboSkill, ComboID, SkillID);
%%		_ ->
%%			checkComboSkill(ComboID, SkillID)
%%	end;
checkUseSkillCareer(_Career, _ComboID, _SkillID) ->
	true.

%-spec checkComboSkill(ComboID, SkillID) -> boolean() when
%	ComboID :: uint(),
%	SkillID :: uint().
%checkComboSkill(ComboID, SkillID) ->
%	Combo = getCfg:getCfgPStack(cfg_comboSkill, ComboID),
%	misc:getListPos(SkillID, Combo#comboSkillCfg.skills) =:= 1.
%
%
%-spec checkComboSkill(#comboSkill{}, ComboID, SkillID) -> boolean() when
%	ComboID :: uint(),
%	SkillID :: uint().
%checkComboSkill(#comboSkill{lasttime = Time, skillID = LastSkillID}, ComboID, SkillID) ->
%	Combo = getCfg:getCfgPStack(cfg_comboSkill, ComboID),
%	Now = time:getUTCNowMSDiff2010(),
%	#globalsetupCfg{setpara = [ComBolLast]} = getCfg:getCfgByKey(cfg_globalsetup, combol_last),
%	if
%		Now - Time >= ComBolLast + 100 ->
%			misc:getListPos(SkillID, Combo#comboSkillCfg.skills) =:= 1;
%		true ->
%			LastPos = misc:getListPos(LastSkillID, Combo#comboSkillCfg.skills),
%			CurPos = misc:getListPos(SkillID, Combo#comboSkillCfg.skills),
%			CurPos =:= (LastPos + 1)
%	end.

%%检查人物行为状态
-spec checkUseSkillActionState() -> boolean().
checkUseSkillActionState() ->
	ActStatus = playerState:getActionStatus(),
	case ActStatus of
		?CreatureActionStatusDead ->
			false;
		?CreatureActionStatusPick ->
			false;
		?CreatureActionStatusChangeMap ->
			false;
		_ ->
			true
	end.

%%根据技能相应的CD，检查玩家是否可以使用指定的技能ID，能使用返回true，否则返回false或者相应的错误
-spec checkUseSkillCD(SkillID) -> globalCD | groupCD | noSkill | boolean() when
	SkillID :: uint().
checkUseSkillCD(SkillID) ->
	Skill = getCfg:getCfgPStack(cfg_skill, SkillID),
	GID = Skill#skillCfg.skillCoolDownGroup,
	GlobeCoolDown = playerState:getGlobalCD(),
	NowTime = time:getUTCNowMSDiff2010(),
	%%检查全局CD
	case checkGlobalCD(GlobeCoolDown, NowTime) of
		true ->
			SkillCDList = playerState:getSkillCD(),
			CDSpeed = 0,%%playerState:getBattlePropTotal(?Prop_coolspeed),
			%%检查组CD
			case checkGroupCD(NowTime, GID, CDSpeed) of
				false ->
					%%检查技能自身CD
					case lists:keyfind(SkillID, 1, SkillCDList) of
						{SkillID, CDTime} ->
							case NowTime >= CDTime of
								true ->
									%%?LOG_OUT("playerName [~ts] skill [~p],cdspeed is [~p], cdtime is [~p], nowTime [~p] differ time [~p]",[playerState:getName(), SkillID, CDSpeed, CDTime, NowTime, CDTime - NowTime]),
									true;
								_ ->
									%%?ERROR_OUT("playerName [~ts] skill [~p] cd error,cdspeed is [~p], cdtime is [~p], nowTime [~p] differ time [~p]",[playerState:getName(), SkillID, CDSpeed, CDTime, NowTime, CDTime - NowTime]),
									false
							end;
						_ ->
							%%没有用过这个技能
							true
					end;
				_ ->
					true
			end;
		_ ->
			globalCD
	end.

-spec calcCDTime(SkillID) -> uint() when
	SkillID :: uint().
calcCDTime(SkillID) ->
	#skillCfg{cDFactor = CDFactor, skillClass = Class, skillType = Type, skillCoolDown = CDTime0} = getCfg:getCfgPStack(cfg_skill, SkillID),
	MinusCDFactor = playerState:getBattlePropTotal(?Prop_SkillMinusCDFactor),
	ExtraCD = playerState:getBattlePropTotal(CDFactor),
%%	IsRoleSkill = lists:member(Class, ?RoleSkill),
	IsActiveSkill = lists:member(Type, ?ActiveSkillList),

	%% 不区分角色和宠物
	case IsActiveSkill of
		false ->
			trunc(CDTime0 * (1 - ExtraCD));
		_ ->
			trunc(CDTime0 * (1 - ExtraCD) * MinusCDFactor)
	end.

%% -1不会触发和被触发公共冷却
%% 0正常触发和被触发公共冷却，角色公共冷却来自武器的攻击间隔，怪物，宠物，npc来自基础表中的设定
%% 填写大于0的其它值，为配置的公共冷却，毫秒
%% 吟唱和引导技能开始进行时就开始公共冷却
-spec checkGlobalCD(CoolDown, NowTime) -> boolean() when
	CoolDown :: int(),
	NowTime :: uint().
checkGlobalCD(CoolDown, NowTime) when NowTime >= CoolDown ->
	true;
checkGlobalCD(_, _) ->
	false.

%%组CD为0，则不属于任何一个组
-spec checkGroupCD(Time, GID, CDSpeed) -> boolean() when
	Time :: uint(), GID :: uint(), CDSpeed :: number().
checkGroupCD(_Time, 0, _CDSpeed) ->
	false;
checkGroupCD(Time, GID, CDSpeed) ->
	#skillCDGroupCfg{time = GroupCDTime0} = getCfg:getCfgPStack(cfg_skillCDGroup, GID),
	GroupCDTime = GroupCDTime0 / (1 + CDSpeed),
	SkillGCDList = playerState:getSkillGroupCD(),
	case lists:keyfind(GID, 1, SkillGCDList) of
		{GID, LUseTime} ->
			Time - LUseTime > GroupCDTime;
		_ ->
			%%没有组CD则可以使用
			false
	end.

%%检查当前状态能否滑屏
-spec canUseDashSkill(X, Y) -> true | uint() when
	X :: number(),
	Y :: number().
canUseDashSkill(X, Y) ->
	case checkDashSkill() of
		true ->
			canUseDashSkill0(X, Y);
		_ ->
			?ErrorCode_UseDashSkillErrorInStatus
	end.

%%检查当前滑屏距离
canUseDashSkill0(X, Y) ->
	case checkDashDist(X, Y) of
		true ->
			canUseDashSkill1();
		_ ->
			?ErrorCode_UseDashSkillErrorDist
	end.

%%检查当前滑屏CD
canUseDashSkill1() ->
	case checkDashCD() of
		true ->
			canUseDashSkill2();
		_ ->
			?ErrorCode_UseDashSkillErrorInCD
	end.
%%检查当前滑屏体力值
canUseDashSkill2() ->
	case checkDashPhys() of
		true ->
			true;
		_ ->
			?ErrorCode_UseDashSkillErrorNoPhys
	end.

%%检查滑屏技能
-spec checkDashSkill() -> boolean().
checkDashSkill() ->
	ActStatus = playerState:getActionStatus(),
	%%如果当前处于切换地图的状态，则不能滑屏
	case ActStatus of
		?CreatureActionStatusChangeMap ->
			false;
		_ ->
			%%如果玩家处于昏迷、冻结、形变或者定身状态，也不能滑屏
			Status = playerState:getStatus(),
			Flag = misc:testBit(Status, ?CreatureSpeStatusComa) orelse misc:testBit(Status, ?CreatureSpeStautsFreeze)
				orelse misc:testBit(Status, ?CreatureSpeStautsDeformation) orelse misc:testBit(Status, ?CreatureSpeStautsFixed),
			not Flag
	end.

%%检查滑屏CD
-spec checkDashCD() -> boolean().
checkDashCD() ->
	Carrer = playerState:getCareer(),
	LastDashCD = playerState:getDashCD(),
	NowTime = time:getUTCNowMSDiff2010(),
	CD = skill:getDashCD(?Career2CareerBase(Carrer)),
	NowTime >= LastDashCD + CD.

%%检查滑屏距离
-spec checkDashDist(X, Y) -> boolean() when
	X :: number(),
	Y :: number().
checkDashDist(X, Y) ->
	{NewX, NewY} = playerState:getPos(),
	Carrer = playerState:getCareer(),
	Dist = skill:getDashDisc(?Career2CareerBase(Carrer)),
	NewDist = math:sqrt((X - NewX) * (X - NewX) + (Y - NewY) * (Y - NewY)),
	NewDist =< Dist + 0.5.

%%检查滑屏体力值
-spec checkDashPhys() -> boolean().
checkDashPhys() ->
	Carrer = playerState:getCareer(),
	CurPhys = playerState:getCurPhys(),
	NeedPhys = skill:getDashPhys(?Career2CareerBase(Carrer)),
	CurPhys >= NeedPhys.

%------------------------------------------
%使用技能检测目标合法性
%------------------------------------------

-spec getObject(Code) -> #recMapObject{} | [] when
	Code :: uint().
getObject(0) ->
	[];
getObject(Code) ->
	PlayerEts = playerState:getMapPlayerEts(),
	PetEts = playerState:getMapPetEts(),
	MonsterEts = playerState:getMapMonsterEts(),
	mapView:getMapObjectFromEts(Code, {
		PlayerEts,
		MonsterEts,
		PetEts
	}).

getObject(0, _X, _Y) ->
	[];
getObject(Code, X, Y) ->
	case getObject(Code) of
		#recMapObject{} = Object ->
			Object#recMapObject{x = X, y = Y};
		_ ->
			[]
	end.

-spec getObjectList(CodeList) -> list() when
	CodeList :: list().
getObjectList(CodeList) ->
	[getObject(Code) || Code <- CodeList].

-spec getObjectCodeList(MainCode, List) -> list() when
	MainCode :: uint(),
	List :: list().
getObjectCodeList(0, List) ->
	[Object#recMapObject.code || Object <- List];
getObjectCodeList(MainCode, List) ->
	[Object#recMapObject.code || Object <- List] ++ [MainCode].

-spec getFilterResList(SkillID, MainCode, CodeList, X, Y) -> list() when
	SkillID :: uint(),
	MainCode :: uint(),
	CodeList :: list(),
	X :: float(),
	Y :: float().
getFilterResList(SkillID, MainCode, CodeList, X, Y) ->
	MyTeam = teamInterface:getTeamInfoWithRoleID(playerState:getRoleID()),%%playerTeam2:getTeamInfo(),
	SelfObject = getObject(playerState:getPlayerCode(), X, Y),
	KillList = playerState:getKillPlayerList(),
	TargetList = getObjectList(lists:delete(MainCode, CodeList)),
	FilterList = camp:filterTarget(SkillID, MyTeam, KillList, SelfObject, TargetList),
	getObjectCodeList(MainCode, FilterList).

-spec isCanAttack(SearchType, CodeList, SkillID) -> uint() | tuple() when
	SearchType :: uint(),
	CodeList :: list(),
	SkillID :: uint().

isCanAttack(?SingleSkillMyMaster, _CodeList, _SkillID) ->
	?ErrorCode_UseSkillErrorSearchType;
isCanAttack(?MutiSkillCirMyEnemy, CodeList, _SkillID) ->
	{0, CodeList};
isCanAttack(?MutiSkillSecEnemy, CodeList, _SkillID) ->
	{0, CodeList};
isCanAttack(?MutiSkillAngEnemy, CodeList, _SkillID) ->
	{0, CodeList};
isCanAttack(?MutiTranSkillCirMyEnermy, CodeList, _SkillID) ->
	{0, CodeList};
isCanAttack(?MutiTranSkillSecMyEnermy, CodeList, _SkillID) ->
	{0, CodeList};

isCanAttack(?SingleSkillMy, CodeList, _SkillID) ->
	case length(CodeList) > 0 of
		true ->
			MainCode = lists:nth(1, CodeList),
			case MainCode =:= playerState:getPlayerCode() of
				true ->
					{MainCode, CodeList};
				_ ->
					?ErrorCode_UseSkillErrorNoTarget
			end;
		_ ->
			?ErrorCode_UseSkillErrorNoTarget
	end;
isCanAttack(?SingleSkillMyPet, CodeList, SkillID) ->
	case length(CodeList) > 0 of
		true ->
			PetCodeList = playerState:getCallPetCodeList(),
			MainCode = lists:nth(1, CodeList),
			case lists:member(MainCode, PetCodeList) of
				true ->
					resFilter(SkillID, MainCode, CodeList, false);
				_ ->
					?ErrorCode_UseSkillErrorNoTarget
			end;
		_ ->
			?ErrorCode_UseSkillErrorNoTarget
	end;
isCanAttack(Param, CodeList, SkillID) ->
	case length(CodeList) > 0 of
		true ->
			%% 自己的护送目标不能击杀
			case playerConvoy:filterConvoyObject(CodeList) of
				CodeList ->
					MainCode = lists:nth(1, CodeList),
					case resFilter(SkillID, MainCode, CodeList, true) of
						{MainCode1, CodeList1} ->
							{MainCode1, CodeList1};
						Error ->
							Error
					end;
				CodeList2 ->
					isCanAttack(Param, CodeList2, SkillID)
			end;
		_ ->
			?ErrorCode_UseSkillErrorNoTarget
	end.

-spec resFilter(SkillID, MainCode, CodeList, IsCheckShip) -> uint() | {uint, list()} when
	SkillID :: uint(),
	MainCode :: uint(),
	CodeList :: list(),
	IsCheckShip :: boolean().
resFilter(SkillID, MainCode, CodeList, IsCheckShip) ->
	SelfObject = getObject(playerState:getPlayerCode()),
	TargetObject = getObject(MainCode),
	MyTeam = teamInterface:getTeamInfoWithRoleID(playerState:getRoleID()),%%playerTeam2:getTeamInfo(),
	KillList = playerState:getKillPlayerList(),
	case camp:isFilter(SkillID, MyTeam, KillList, SelfObject, TargetObject, IsCheckShip) of
		false ->
			{MainCode, CodeList};
		Error ->
			Error
	end.

%------------------------------------------
% tools
%------------------------------------------
%%增加战斗中或者装备获取的临时技能
-spec addTempSkill(SkillID, Level) -> ok when
	SkillID :: uint(),
	Level :: uint().
addTempSkill(SkillID, Level) ->
	SkillList = playerState:getSkill(),
	Skill = #recSkill{
		skillID = SkillID,
		level = Level,
		damagePlus = 0,
		damageMultiply = 1,
		damage = 0
	},
	NewSkill = playerSkillLearn:setLevel(Skill, Level),
	?DEBUG_OUT("addTempSkill: (~p,~p),~p", [SkillID, Level, NewSkill#recSkill.damageMultiply]),
	NewSkilList = lists:keystore(SkillID, #recSkill.skillID, SkillList, NewSkill),
	playerState:setSkill(NewSkilList),
	ok.

%%删除战斗中或者装备获取的临时技能
-spec delTempSkill(SkillID) -> ok when
	SkillID :: uint().
delTempSkill(SkillID) ->
	SkillList = playerState:getSkill(),
	NewSkillList = lists:keydelete(SkillID, #recSkill.skillID, SkillList),
	playerState:setSkill(NewSkillList),
	ok.

%%增加战斗中或者装备获取的临时技能,并镶嵌在0号技能槽中,用于隐藏技能
-spec addTempSlotSkill(SkillID, Type) -> ok when
	SkillID :: uint(),
	Type :: uint().
addTempSlotSkill(SkillID, Type) ->
	SlotSkillList = playerState:getSlotSkill(),
	Now = time:getUTCNowMSDiff2010(),
	Skill = #recSlotSkill{
		skillID = SkillID,
		slot = ?HideSlot,
		type = Type,
		time = Now,
		canUseCount = 0
	},
	NewSSL = lists:keystore(SkillID, #recSlotSkill.skillID, SlotSkillList, Skill),
	playerState:setSlotSkill(NewSSL).

%%删除镶嵌战斗中或者装备获取的临时技能
-spec delTempSlotSkill(SkillID) -> ok when
	SkillID :: uint().
delTempSlotSkill(SkillID) ->
	SlotSkillList = playerState:getSlotSkill(),
	NewSSL = lists:keydelete(SkillID, #recSlotSkill.skillID, SlotSkillList),
	playerState:setSlotSkill(NewSSL).

%%获取触发技能列表
-spec getTriSkillList(SkillID, Type) -> list() when
	SkillID :: uint(),
	Type :: uint().
getTriSkillList(SkillID, Type) ->
	SkillList = playerState:getSlotSkill(),
	FilterTypeList = filterTypeTriSkill(Type, SkillList),
	filterAssignTriSkill(SkillID, FilterTypeList).

%%过滤触发技能类型
-spec filterTypeTriSkill(Type, TriSkillList) -> list() when
	Type :: uint(),
	TriSkillList :: list().
filterTypeTriSkill(Type, TriSkillList) ->
	Fun = fun(#recSlotSkill{skillID = SkillID}) ->
		#skillCfg{skillType = SkillType} = getCfg:getCfgPStack(cfg_skill, SkillID),
		case SkillType =:= Type of
			true ->
				true;
			_ ->
				false
		end
		  end,
	lists:filter(Fun, TriSkillList).

%%过滤指定技能触发
-spec filterAssignTriSkill(SkillID, TriSkillList) -> list() when
	SkillID :: uint(),
	TriSkillList :: list().
filterAssignTriSkill(SkillID, TriSkillList) ->
	Fun = fun(#recSlotSkill{skillID = ID}) ->
		#skillCfg{triggerSkill = SkillList} = getCfg:getCfgPStack(cfg_skill, ID),
		if
			SkillList =:= undefined ->
				true;
			true ->
				lists:member(SkillID, SkillList)
		end
		  end,
	lists:filter(Fun, TriSkillList).

%%获取特殊被动提高伤害百分比技能
-spec getSpecSkill() -> list().
getSpecSkill() ->
	SSL = playerState:getSlotSkill(),
	getSpecSkill(SSL, []).

getSpecSkill([], List) ->
	List;
getSpecSkill([#recSlotSkill{skillID = ID, type = ?PassivitySkill} | SSL], List) ->
	#skillCfg{skillEx = Ex} = getCfg:getCfgPStack(cfg_skill, ID),
	case is_list(Ex) of
		true ->
			Fun = fun(Element, Acc) ->
				case Element of
					{?SpecPassSkill5, Percent, Param} ->
						[{?SpecPassSkill5, Percent, Param} | Acc];
					{?SpecPassSkill6, Percent, Param} ->
						[{?SpecPassSkill6, Percent, Param} | Acc];
					_ ->
						Acc
				end
				  end,
			getSpecSkill(SSL, lists:foldl(Fun, [], Ex) ++ List);
		_ ->
			getSpecSkill(SSL, List)
	end;
getSpecSkill([_ | SSL], List) ->
	getSpecSkill(SSL, List).

%%站立不动获取buff
-spec delSpecSkill1(Time, BuffID, SkillLevel) -> ok when
	Time :: uint(),
	BuffID :: uint(),
	SkillLevel :: uint().
delSpecSkill1(Time, BuffID, SkillLevel) ->
	ActionStatus = playerState:getActionStatus(),
	ActionTime = playerState:getActionTime(),
	Time1 = time:getUTCNowMSDiff2010(),
	if
		ActionStatus =:= ?CreatureActionStatusStand andalso Time1 - ActionTime > Time ->
%%			Level = playerState:getLevel(),
			playerBuff:addNoRepeatBuff(BuffID, SkillLevel);
		true ->
			playerBuff:delNoRepeatBuff(BuffID)
	end.

%%给宠物增加buff
-spec delSpecSkill2(PetID, BuffID, SkillLevel) -> ok when
	PetID :: uint(),
	BuffID :: uint(),
	SkillLevel :: uint().
delSpecSkill2(PetID, BuffID, SkillLevel) ->
	PetList = playerState:getCallPet(),
	Fun = fun(#recCallPet{pet_code = Code, pet_id = ID}) ->
		case PetID =:= ID of
			true ->
%%						  Level = playerState:getLevel(),
				monsterInterface:addPetNoRepeatBuff(Code, BuffID, SkillLevel);
			_ ->
				skip
		end
		  end,
	lists:foreach(Fun, PetList).

%%生命低于某百分比增加buff
-spec delSpecSkill3(Percent, BuffID, SkillLevel) -> ok when
	Percent :: float(),
	BuffID :: uint(),
	SkillLevel :: uint().
delSpecSkill3(Percent, BuffID, SkillLevel) ->
	CurHp = playerState:getCurHp(),
	MaxHp = playerState:getMaxHp(),
	Hp_Per = skill:getPercent(CurHp, MaxHp),
	if
		Hp_Per =< Percent * 100 ->
%%			Level = playerState:getLevel(),
			playerBuff:addNoRepeatBuff(BuffID, SkillLevel);
		true ->
			playerBuff:delNoRepeatBuff(BuffID)
	end.

%%生命高于某百分比增加buff
-spec delSpecSkill4(Percent, BuffID, SkillLevel) -> ok when
	Percent :: float(),
	BuffID :: uint(),
	SkillLevel :: uint().
delSpecSkill4(Percent, BuffID, SkillLevel) ->
	CurHp = playerState:getCurHp(),
	MaxHp = playerState:getMaxHp(),
	Hp_Per = skill:getPercent(CurHp, MaxHp),
	if
		Hp_Per >= Percent * 100 andalso Hp_Per >= 0 ->
%%			Level = playerState:getLevel(),
			playerBuff:addNoRepeatBuff(BuffID, SkillLevel);
		true ->
			playerBuff:delNoRepeatBuff(BuffID)
	end.
getMaxCourage() -> 100.
%%	Career = playerState:getCareer(),
%%	case Career of
%%		?Career_10_Warrior ->
%%			%% 骑士
%%			globalCfg:getGlobalCfg(qs_nq);
%%		?Career_20_Magician ->
%%			%% 魔法师
%%			globalCfg:getGlobalCfg(fs_nq);
%%		?Career_30_Bravo ->
%%			%% 刺客
%%			globalCfg:getGlobalCfg(ck_nq);
%%		?CareerTrainee ->
%%			%% 灵魂收割者
%%			globalCfg:getGlobalCfg(mn_nq);
%%		?CareerMechanic ->
%%			globalCfg:getGlobalCfg(jjs_nq);
%%		_ ->
%%			?ERROR_OUT("getMaxCourage error Career[~p]", [Career]),
%%			999
%%	end.

getPlayerSkillLevel(SkillID) ->
	SkillList = playerState:getSkill(),
	case lists:keyfind(SkillID, #recSkill.skillID, SkillList) of
		#recSkill{level = Lv} ->
			Lv;
		_ ->
			0
	end.