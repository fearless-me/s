%%
%% @author zhongyunawei
%% @doc @todo Add description to playerBattle.


-module(playerBattle).
-author(zhongyuanwei).

-include("playerPrivate.hrl").
-include("skill.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	attack/5,
	beAttack/2,
	dealAttackRes/4,
	onDead/5,
	delHate/1,
	addHate/2,
	killedMonster/1,
	gainExpByKilledMonster/1,
	dropBykilledMonster/3,
	killedTarget/5,
	treat/4,
	addTreat/2,
	leaveBattle/1,
	noticeBlood/2,
%%	getSameMapTeamMemberPid/0,
	getAttackRoleID/1,
	isHateTarget/1
]).

%%攻击某些目标
-spec attack(#recSkill{}, SN, CodeList, SpecSkillList, MainCode) -> ok when
	SN :: uint(),
	CodeList :: list(),
	SpecSkillList :: list(),
	MainCode :: uint().
attack(#recSkill{
	damageMultiply = DamageMultiply,
	skillID = SkillID,
	level = SkillLevel,
	damagePlus = DamagePlus,
	damage = Damage
}, SN, CodeList, SpecSkillList, MainCode) ->
%%	IntervalTime = playerState:getFinalAttackIntervalTime(),
%%	?DEBUG_OUT("attack, skillID=~p, intervalTime=~p",[SkillID, IntervalTime]),
%%	EffIDList = effect:getTriEffIDList(SkillID, IntervalTime),
	BeAttack = #recBeAttack{
		attackerEnergy = playerBase:getSpecBattlePropPower(),
		attackerProp = playerCalcProp:getBattleProp(),
		attackerCode = playerState:getPlayerCode(),
		damage = Damage,
		damageMultiply = DamageMultiply,
		specSkillList = SpecSkillList,
		damagePlus = DamagePlus,
		skillID = SkillID,
		skillLevel = SkillLevel,
		serial = SN,
		isCarrier = false,
		mainCode = MainCode,
		attackerPid = self(),
		attackerType = ?AttackerTypePlayer,
		attackerName = playerState:getName(),
		attackerLevel = playerState:getLevel(),
		attackerCamp = playerState:getCamp(),
		attackerID = playerState:getRoleID(),
		attackerGroupID = playerState:getGroupID(),
		attackerGuildID = playerState:getGuildID(),
		attackerTeamID = playerState:getTeamID(),
		attackerPkMode = playerState:getPkStatus(),
		callMonsterList = playerState:getCallMonsterList(),
		callCarrierList = playerState:getCallCarrierList()
	},
	playerState:setHitRestoreHp({SkillID, SN}),
	SelfCode = playerState:getPlayerCode(),
	attack1(CodeList, BeAttack, SelfCode),

	%% 退出灵力冥想
	playerOfflineExp:endMeditation(),
	ok.

-spec attack1(TargetList :: list(), BeAttack :: #recBeAttack{}, SelfCode :: uint()) -> ok.
attack1([], _BeAttack, _SelfCode) ->
	ok;
attack1([{_IsRan, Code, _Times} | List], BeAttack, SelfCode) when SelfCode =:= Code ->
	attack1(List, BeAttack, SelfCode);
attack1([{IsRan, Code, Times} | List], BeAttack, SelfCode) ->
	case playerSkill:getObject(Code) of
		#recMapObject{pid = Pid} ->
			enterBattle(Code, Pid),
			NewBeAttack = BeAttack#recBeAttack{
				targetCode = Code,
				times = Times
			},
			psMgr:sendMsg2PS(Pid, beAttacked, {Code, NewBeAttack});
		_ ->
			ok
	end,
	attack1(List, BeAttack, SelfCode).

isBossTarget([], _AttackerCode) ->
	false;
isBossTarget([BossID | T], AttackerCode) ->
	BossTargetCode = mapWildBoss:getWildBossTarget(BossID),
	case playerRedName:isInWildBoss(AttackerCode, BossTargetCode) of
		false ->
			isBossTarget(T, AttackerCode);
		_ ->
			true
	end.

%%被攻击者受到攻击
-spec beAttack(AttackerPid, #recBeAttack{}) -> ok when
	AttackerPid :: pid().
beAttack(AttackerPid, #recBeAttack{
	attackerProp = Props,
	times = RanTimes,
	skillID = SkillID,
	skillLevel = SkillLevel,
	isCarrier = IsCarrier,
	targetCode = TargetCode,
	mainCode = MainTargetCode,
	attackerType = AttackType,
	attackerCode = AttackerCode
} = BeAttack) ->
	delAttackProtect(IsCarrier, AttackType, AttackerPid, AttackerCode),
	#skillCfg{
		secTarget = SecTarget,
		effectTimes = Times
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	ET = battle:getAttackerTimes(false, RanTimes, Times),
	case ET of
		0 ->
			skip;
		_ ->
			case playerState:getCurHp() > 0 of
				%%如果目标被buff打死,就不用再次计算伤害包了
				true ->
					IsMainTarget = battle:isMainTarget(TargetCode, MainTargetCode),
					%%增加杀戮仇人
					BossIDList = getCfg:get1KeyList(cfg_wildboss),
					case isBossTarget(BossIDList, AttackerCode) of
						false ->
							playerRedName:addKp(AttackerCode, 0);
						_ ->
							ok
					end,
					%%产生几个效果做几次判定
					List = lists:seq(1, ET),

					DefenderLevel = playerState:getLevel(),
					AttackLevel = BeAttack#recBeAttack.attackerLevel,

					Func =
						fun(_, AccIn) ->
							AttackResult = battle:beJudge(
								SkillID
								, SkillLevel
								, AttackLevel
								, Props
								, DefenderLevel
								, playerCalcProp:getBattleProp()
							),
							[AttackResult | AccIn]
						end,
					HitResultList = lists:foldl(Func, [], List),
					NewBeAttack = battle:damageCalcAssistSkill(
						SkillID
						, SkillLevel
						, Props
						, playerCalcProp:getBattleProp()
						, BeAttack
					),
					calcBeAttackDamage(AttackerPid, HitResultList, NewBeAttack, IsMainTarget, SecTarget);
				_ ->
					skip
			end
	end,

	%% 退出灵力冥想
	playerOfflineExp:endMeditation(),
	ok.

%%处理玩家杀死怪物
-spec killedMonster(MonsterID) -> ok
	when MonsterID :: uint().
killedMonster(MonsterID) ->
	%%添加杀怪成就统计
	playerAchieve:achieveEvent(?Achieve_AnnihilatorLeader, [MonsterID, 1]),
	playerAchieve:achieveEvent(?Achieve_TestKillMonster, [MonsterID, 1]),
	playerAchieve:achieveEvent(?Achieve_MonsterSlayer, [1]),
	playerAchieve:achieveEvent(?Achieve_Act_Event4, [MonsterID, 1]),
	playerAchieve:achieveEvent(?Achieve_Act_Event5, [MonsterID, 1]),
	playerAchieve:achieveEvent(?Achieve_Act_Event14, [MonsterID, 1]),
	playerAchieve:achieveEvent(?Achieve_DarkPrime, [MonsterID, 1]),
	MapID = playerState:getMapID(),
	playerTask:updateTask(?TaskSubType_Monster, MonsterID),
	playerTask:updateTask(?TaskSubType_Drop, MonsterID),
	playerMaterialCopy:killedMonster(MapID, MonsterID),
	teamInterface:sendMsg2TeamInSameMapWithRoleID(
		playerState:getRoleID(),
		playerState:getMapPlayerEts(),
		teamKilledMonster,
		MonsterID,
		false
	),
	ok.

-spec gainExpByKilledMonster(MonsterID) -> ok when MonsterID :: uint().
gainExpByKilledMonster(MonsterID) ->
	#monsterCfg{exp = Exp} = getCfg:getCfgPStack(cfg_monster, MonsterID),
	playerBase:addExp(Exp, ?ExpSourceKillMonster, MonsterID),
	teamInterface:sendMsg2TeamInSameMapWithRoleID(
		playerState:getRoleID(),
		playerState:getMapPlayerEts(),
		teamMemberGainExpByKilledMonster,
		{MonsterID, Exp},
		false
	),
	ok.


-spec dropBykilledMonster(Code :: uint(), MonsterID, MonsterLevel) -> ok
	when MonsterID :: uint(), MonsterLevel :: uint().
dropBykilledMonster(Code, MonsterID, MonsterLevel) ->
	%%设定玩家杀死的怪物Code，主要用于掉落系统
	playerState:setKillMonsterCode(Code),

	%% 活动掉落-杀怪掉落
	Arg = #recAcKilledMonsterArg{
		mapID = playerState:getMapID(),
		monsterID = MonsterID,
		monsterLv = MonsterLevel
	},
	AcArg = #recOperateActivityArg{
		roleID = playerState:getRoleID(),
		type = ?OperateActType_KilledMonster,
		arg = Arg,
		pid = self(),
		lv = playerState:getLevel()
	},
	AcList = activity:getOperateActCfgByType(?OperateActType_KilledMonster),
	activity:operateActEvent(AcList, AcArg),
	%%psMgr:sendMsg2PS(?PsNameOperateActivity, eventActivity, AcArg),
	%% 如果是副本，获取加成掉落概率
	OddPer = 1,
	TeamMemberPidList = teamInterface:getTeamMemberPidListInSameMapWithRoleID(
		playerState:getRoleID(),
		playerState:getMapPlayerEts(),
		false
	),%%getSameMapTeamMemberPid(),
	TeamMemberNum = teamInterface:getTeamMemberCountWithRoleID(
		playerState:getRoleID(), false
	),%%erlang:length(TeamMemberPidList),

	dropBykilledMonsterFromMonster(OddPer, MonsterID, MonsterLevel, TeamMemberPidList, TeamMemberNum),
	dropBykilledMonsterFromMap(OddPer, MonsterID, MonsterLevel, TeamMemberPidList, TeamMemberNum),
	%%清除玩家杀死的怪物Code
	playerState:setKillMonsterCode(undefined),
	ok.

%%杀死怪物后，怪物本身的掉落
dropBykilledMonsterFromMonster(OddPer, MonsterID, MonsterLevel, TeamMemberPidList, TeamMemberNum) ->
	%% 杀怪掉落
	#monsterCfg{
		dropList = ItemDropID,
		equipDropList = EquipDropList1,
		dropShip = DropShip
	} = getCfg:getCfgPStack(cfg_monster, MonsterID),
	EquipDropList = if
		                is_list(EquipDropList1) ->
			                EquipDropList1;
		                is_number(EquipDropList1) ->
			                case EquipDropList1 > 0 of
				                true ->
					                [EquipDropList1];
				                _ ->
					                []
			                end;
		                true ->
			                []
	                end,
	dropBykilledMonster1(MonsterID, DropShip, MonsterLevel, OddPer, ItemDropID, EquipDropList, TeamMemberPidList, TeamMemberNum),
	ok.

%%杀死怪物后，地图掉落
dropBykilledMonsterFromMap(OddPer, MonsterID, MonsterLevel, TeamMemberPidList, TeamMemberNum) ->
	MapID = playerState:getMapID(),
	%% 地图掉落
	#mapsettingCfg{
		dropid = ItemDropID,
		equipdropid = DropID
	} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
	%%地图掉落，默认可以发给队友
	EquipDropList = case DropID > 0 of
		                true ->
			                [DropID];
		                _ ->
			                []
	                end,
	dropBykilledMonster1(MonsterID, ?MonsterDropShipFirstAttackerAndTeam, MonsterLevel, OddPer, ItemDropID, EquipDropList, TeamMemberPidList, TeamMemberNum),
	ok.

dropBykilledMonster1(MonsterID, DropShip, MonsterLevel, OddPer, ItemDropID, EquipDropList, TeamMemberPidList, TeamMemberNum) ->
%%	playerCopyMap:copyMapIsAward(playerState:getMapID())

	IsAward = playerCopyMapReward:isRewardInCopyMap(),
	%%给自己掉落普通物品
	IsDropItem = case ItemDropID =/= 0 of
		             true when IsAward =:= true ->
			             playerDrop:goodsDrop(ItemDropID, OddPer, MonsterID, ?ItemSourceKillMonster),
			             true;
		             true ->
			             true;
		             false ->
			             false
	             end,
	%%给自己掉落装备
	IsDropEquip = case erlang:is_list(EquipDropList) andalso EquipDropList =/= [0] of
		              true when IsAward =:= true ->
			              Fun = fun(EquipDropID) ->
				              playerDrop:equipDrop(EquipDropID, MonsterID, MonsterLevel, ?Drop_Equip_Source_ByMonster, TeamMemberNum, ?ItemSourceKillMonster)
			                    end,
			              lists:foreach(Fun, EquipDropList),
			              true;
		              true ->
			              true;
		              false ->
			              false
	              end,

	IsTeamDrop = (IsDropItem orelse IsDropEquip) andalso
		(
			DropShip =:= ?MonsterDropShipFirstAttackerAndTeam orelse
				DropShip =:= ?MonsterDropShipLastAttackerAndTeam orelse
				DropShip =:= ?MonsterDropShipCallMonsterPlayerAndTeam
		),

	%%如果有掉落普通道具或者掉落装备则需要向队友发消息掉落
	case IsTeamDrop of
		true ->
			%%给队友发掉落消息
			FunTeamMebmer = fun(PlayerPid) ->
				psMgr:sendMsg2PS(PlayerPid, equipDrop,
					#recKillMonsterDrop{
						equipDropType = ?Drop_Equip_Source_ByMonster,
						equipDropList = EquipDropList,

						itemDropID = ItemDropID,
						itemDropOdd = OddPer,

						monsterID = MonsterID,
						monsterLevel = MonsterLevel,
						teamMemberNum = TeamMemberNum})
			                end,
			lists:foreach(FunTeamMebmer, TeamMemberPidList);
		_ ->
			skip
	end,
	ok.


%%处理玩家杀死玩家
-spec killedTarget(TargetCode, Msg, X, Y, IsBossTargetCode) -> ok when
	TargetCode :: uint(),
	Msg :: #pk_GS2U_Dead{},
	X :: float(),
	Y :: float(),
	IsBossTargetCode :: boolean().
killedTarget(TargetCode, Msg, X, Y, IsBossTargetCode) ->
	PlayerEts = playerState:getMapPlayerEts(),
	case IsBossTargetCode of
		false ->
			playerRedName:addKv(false, TargetCode, 0);
		_ ->
			ok
	end,
	mapView:sendMsg2NearPlayerByPos(playerState:getMapPid(), PlayerEts, Msg, X, Y, playerState:getGroupID()).

%%处理技能回血
-spec treat(#recSkill{}, SN, CodeList, MainCode) -> ok when
	SN :: uint(),
	CodeList :: list(),
	MainCode :: uint().
treat(#recSkill{
	skillID = SkillID,
	level = Level,
	damageMultiply = Multi,
	damagePlus = Plus
}, SN, CodeList, MainCode) ->
	#skillCfg{healProperty = Prop, damageType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	BattleProp = playerCalcProp:getBattleProp(),
	case Type of
		?SkillDamageTypeMedicine ->
			ProValue = playerState:getBattlePropTotal(Prop);
		_ ->
			ProValue = 0
	end,
	SelfCode = playerState:getPlayerCode(),
	Name = playerState:getName(),
	CurHp = playerState:getCurHp(),
	MaxHp = playerState:getMaxHp(),
	Camp = playerState:getCamp(),
	ID = playerState:getRoleID(),
	GroupID = playerState:getGroupID(),
	GuildID = playerState:getGuildID(),
	TeamID = playerState:getTeamID(),
	PowerEnergy = playerBase:getSpecBattlePropPower(),
	Hp_Per = skill:getPercent(CurHp, MaxHp),
	%%获取技能效果ID列表
	HealFactor = playerState:getBattlePropTotal(?Prop_HealthFactor),
	IntervalTime = playerState:getFinalAttackIntervalTime(),
	EffIDList = effect:getTriEffIDList(SkillID, IntervalTime),
	TotalTreat = erlang:trunc((ProValue * Multi + Plus) * HealFactor * misc:rand(0.9, 1.1)),
	CallMonsterList = playerState:getCallMonsterList(),
	CallCarrierList = playerState:getCallCarrierList(),
	RecBeTreat = #recBeTreat{
		skillID = SkillID,
		level = Level,
		serial = SN,
		attackerCode = SelfCode,
		attackerName = Name,
		attackerPid = self(),
		attackerCamp = Camp,
		attackerID = ID,
		attackerLevel = playerState:getLevel(),
		attackerGroupID = GroupID,
		attackerGuildID = GuildID,
		attackerTeamID = TeamID,
		attackerEnergy = PowerEnergy,
		attackerType = ?AttackerTypePlayer,
		attackerPkMode = playerState:getPkStatus(),
		attackerProp = BattleProp,
		callMonsterList = CallMonsterList,
		callCarrierList = CallCarrierList,
		mainTarget = MainCode,
		effectList = EffIDList,
		isCarrier = false,
		skillTotalTreat = TotalTreat
	},
	Fun = fun(TargetCode) ->
		case playerSkill:getObject(TargetCode) of
			#recMapObject{pid = TargetPid} when erlang:is_pid(TargetPid) ->
				%%非攻击触发技能
				playerSkill:noAttackTriggerSkill(SkillID, TargetCode),
				case SelfCode =:= TargetCode of
					true ->
						addTreat(RecBeTreat, Hp_Per);
					_ ->
						psMgr:sendMsg2PS(TargetPid, beTreat, {TargetCode, RecBeTreat, Hp_Per})
				end;
			_ ->
				skip
		end
	      end,
	lists:foreach(Fun, CodeList).

%%玩家技能回血并通知客服端
-spec addTreat(#recBeTreat{}, AHp_Per) -> ok when
	AHp_Per :: uint().
addTreat(#recBeTreat{
	skillTotalTreat = TreatValue,
	attackerCode = AttackerCode,
	attackerName = AttackerName,
	attackerPid = AttackerPid,
	attackerProp = AttackerProp,
	attackerType = AttackerType,
	attackerCamp = AttackerCamp,
	attackerID = AttackerID,
	attackerLevel = AttackerLevel,
	attackerGroupID = AttackerGroupID,
	attackerGuildID = AttackerGuildID,
	attackerTeamID = AttackerTeamID,
	attackerPkMode = AttackerPkMode,
	attackerEnergy = AttackerEnergy,
	callMonsterList = CallMonsterList,
	callCarrierList = CallCarrierList,
	effectList = EffIDList,
	skillID = SkillID,
	level = Level,
	isCarrier = IsCarrier,
	serial = Serial
}, AHp_Per) ->
	OldHp = playerState:getCurHp(),
	case OldHp > 0 of
		true ->
			{X, Y} = playerState:getPos(),
			SelfCode = playerState:getPlayerCode(),

			%%构造执行效果所需要的record
			RecEffect = #recSkillEffect{
				skillID = SkillID,
				level = Level,
				serial = Serial,
				isCarrier = IsCarrier,
				attackerID = AttackerID,
				attackerLevel = AttackerLevel,
				attackerCode = AttackerCode,
				attackerName = AttackerName,
				attackerPid = AttackerPid,
				attackerProp = AttackerProp,
				attackerType = AttackerType,
				attackerCamp = AttackerCamp,
				attackerGroupID = AttackerGroupID,
				attackerGuildID = AttackerGuildID,
				attackerTeamID = AttackerTeamID,
				attackerPkMode = AttackerPkMode,
				attackerEnergy = AttackerEnergy,
				callMonsterList = CallMonsterList,
				callCarrierList = CallCarrierList,
				targetDamageList = [],
				targetCode = SelfCode
			},
			%%获取技能效果列表
			EffectList = effect:getEffList(EffIDList),
			[playerEffect:skillEffectRes(Effect, RecEffect) || Effect <- EffectList],

			MaxHp = playerState:getMaxHp(),
			GetHealFactor = playerState:getBattlePropTotal(?Prop_GetHealthFactor),
			NewTreatValue = erlang:trunc(TreatValue * GetHealFactor),
			NewTreatValue1 = misc:clamp(NewTreatValue, 0, MaxHp),
			CurHp = misc:clamp(OldHp + NewTreatValue1, 0, MaxHp),
			DiffHp = erlang:trunc(CurHp - OldHp),
			playerState:setCurHp(CurHp),
			BHp_Per = skill:getPercent(CurHp, MaxHp),
			%%构造治疗结果record
			AttackResultList = [],
%%			AttackResultList = [#pk_AttackResultList{type = ?RestoreHp, value = 0},
%%								#pk_AttackResultList{type = ?BackHp, value = 0}],
			TreatMsg = #pk_GS2U_AttackResult{
				userCode = AttackerCode,
				targetCode = SelfCode,
				skillId = SkillID,
				serial = Serial,
				result = [?HitResultTreat],
				damageHp = [NewTreatValue1],
				ahp_per = AHp_Per,
				bhp_per = BHp_Per,
				diffHp = DiffHp,
				arList = AttackResultList
			},
			broadcastAttackResult(TreatMsg, X, Y);
		_ ->
			skip
	end,
	ok.
%% ====================================================================
%% Internal functions
%% ====================================================================

%%-spec calcBeAttack(AttackerPid, HitResultList, #recBeAttack{}, HateValue, IsMainTarget, SecTarget) -> ok when
%%	AttackerPid :: pid(),
%%	HitResultList :: list(),
%%	HateValue :: number(),
%%	IsMainTarget :: boolean(),
%%	SecTarget :: float().
%%calcBeAttack(AttackerPid, HitResultList, #recBeAttack{} = BeAttack, _HateValue, IsMainTarget, SecTarget) ->
%%	calcBeAttackDamage(AttackerPid, HitResultList, BeAttack, IsMainTarget, SecTarget).


-spec calcBeAttackDamage(AttackerPid, HitResultList, #recBeAttack{}, IsMainTarget, SecTarget) -> ok when
	AttackerPid :: pid(), HitResultList :: list(), IsMainTarget :: boolean(), SecTarget :: float().
calcBeAttackDamage(AttackerPid, HitResultList, #recBeAttack{} = BeAttack, IsMainTarget, _SecTarget) ->
	SkillID = BeAttack#recBeAttack.skillID,
	AttackerType = BeAttack#recBeAttack.attackerType,
	AttackerCode = BeAttack#recBeAttack.attackerCode,
	AttackerName = BeAttack#recBeAttack.attackerName,
	AttackerPid = BeAttack#recBeAttack.attackerPid,
	AttackerId = BeAttack#recBeAttack.attackerID,
	AttackerLevel = BeAttack#recBeAttack.attackerLevel,
	IsCarrier = BeAttack#recBeAttack.isCarrier,
	OldHp = playerState:getCurHp(),
	MapID = playerState:getMapID(),
	%%DamageList = calcSkillDamageToTarget(BeAttack, HitResultList, IsMainTarget, SecTarget),
	DamageList = calcSkillDamageMe(BeAttack, HitResultList),
	%%构造仇恨
	Hate = #recHate{hateCode = AttackerCode, hatePid = AttackerPid},
	addHate(Hate, IsCarrier),
	%%计算坐骑耐久值
	calcMountSta(AttackerLevel),
	%%被攻击者技能触发
	playerSkill:attackTriggerSkill(SkillID, HitResultList, AttackerCode, ?BeAttackTriggerSkill),
	%%伤害反弹
	DamageBack = 0,%%erlang:trunc(playerState:getBattlePropTotal(?Prop_thorn)),
	%%处理效果
	calcBeAttackSkillEffect(BeAttack, HitResultList, DamageList, DamageBack, IsMainTarget, OldHp),
	CurHp = playerState:getCurHp(),
	Diff = OldHp - CurHp,
	playerBeHurt(isStatHurt(MapID), MapID, AttackerCode, AttackerPid, AttackerId, Diff),
	%%检查是否死亡
	case CurHp =:= 0 of
		true ->
			onDead(AttackerCode, AttackerPid, AttackerType, AttackerName, SkillID);
		_ ->
			skip
	end,
	ok.

isStatHurt(?CrosArenaMapID1) ->
	true;
isStatHurt(?CrosArenaMapID2) ->
	true;
isStatHurt(?CrosArenaMapID3) ->
	true;
isStatHurt(_) ->
	false.

playerBeHurt(true, MapID, AttackCode, AttackPid, AttackID, DiffHP) ->
	AttackType = codeMgr:getObjectTypeByCode(AttackCode),
	{_RealAttackOwnerID, RealAttackOwnerPid} =
		case AttackType of
			?ObjTypePlayer ->
				{AttackID, AttackPid};
			?ObjTypePet ->
				PetEts = playerState:getMapPetEts(),
				case myEts:lookUpEts(PetEts, AttackCode) of
					[#recMapObject{ownId = EtsOwnId, ownCode = EtsOwnCode1} | _] ->
						%%根据附属字段的ownCode找创建者信息
						PlayerEts = playerState:getMapPlayerEts(),
						case myEts:lookUpEts(PlayerEts, EtsOwnCode1) of
							[#recMapObject{pid = EtsOwnPid1}] ->
								{EtsOwnId, EtsOwnPid1};
							_ ->
								{EtsOwnId, skip}
						end;
					_ ->
						{false, skip}
				end;
			_ ->
				MonsterEts = playerState:getMapMonsterEts(),
				case myEts:lookUpEts(MonsterEts, AttackCode) of
					[#recMapObject{ownId = EtsOwnId, ownCode = EtsOwnCode} | _] ->
						%%根据附属字段的ownCode找创建者信息
						PlayerEts = playerState:getMapMonsterEts(),
						case myEts:lookUpEts(PlayerEts, EtsOwnCode) of
							[#recMapObject{pid = EtsOwnPid}] ->
								{EtsOwnId, EtsOwnPid};
							_ ->
								{EtsOwnId, skip}
						end;
					_ ->
						{false, skip}
				end
		end,
	case RealAttackOwnerPid =/= skip of
		true ->
			psMgr:sendMsg2PS(RealAttackOwnerPid, statHurt, {MapID, DiffHP, AttackType, AttackID});
		_ ->
			skip
	end;
playerBeHurt(_, _MapID, _AttackCode, _AttackPid, _AttackID, _DiffHP) ->
	skip.

-spec initEffectRecord(BeAttack, DamageList) -> #recSkillEffect{} when
	BeAttack :: #recBeAttack{},
	DamageList :: list().
initEffectRecord(BeAttack, DamageList) ->
	TargetPid = self(),
	TargetID = playerState:getRoleID(),
	TargetCode = playerState:getPlayerCode(),
	{TargetX, TargetY} = playerState:getPos(),
	#recSkillEffect{
		targetX = TargetX,
		targetY = TargetY,
		targetID = TargetID,
		targetPid = TargetPid,
		targetCode = TargetCode,
		targetType = ?ObjTypePlayer,
		targetDamageList = DamageList,
		serial = BeAttack#recBeAttack.serial,
		skillID = BeAttack#recBeAttack.skillID,
		level = BeAttack#recBeAttack.skillLevel,
		targetMainCode = BeAttack#recBeAttack.mainCode,
		isCarrier = BeAttack#recBeAttack.isCarrier,
		callMonsterList = BeAttack#recBeAttack.callMonsterList,
		callCarrierList = BeAttack#recBeAttack.callCarrierList,
		attackerID = BeAttack#recBeAttack.attackerID,
		attackerLevel = BeAttack#recBeAttack.attackerLevel,
		attackerPid = BeAttack#recBeAttack.attackerPid,
		attackerCode = BeAttack#recBeAttack.attackerCode,
		attackerCamp = BeAttack#recBeAttack.attackerCamp,
		attackerGroupID = BeAttack#recBeAttack.attackerGroupID,
		attackerGuildID = BeAttack#recBeAttack.attackerGuildID,
		attackerTeamID = BeAttack#recBeAttack.attackerTeamID,
		attackerType = BeAttack#recBeAttack.attackerType,
		attackerName = BeAttack#recBeAttack.attackerName,
		attackerProp = BeAttack#recBeAttack.attackerProp,
		attackerEnergy = BeAttack#recBeAttack.attackerEnergy,
		attackerPkMode = BeAttack#recBeAttack.attackerPkMode
	}.
-spec initTargetDamageRecord(BeAttack, HitResultList, DamageList, DamageBack) -> #recAttackTargetDamage{} when
	BeAttack :: #recBeAttack{},
	HitResultList :: list(),
	DamageList :: list(),
	DamageBack :: uint().
initTargetDamageRecord(BeAttack, HitResultList, DamageList, DamageBack) ->
	TargetPid = self(),
	TargetID = playerState:getRoleID(),
	TargetName = playerState:getName(),
	TargetCode = playerState:getPlayerCode(),
	TargetType = skill:getAttackType(TargetCode, false, TargetID),
	#recAttackTargetDamage{
		skillID = BeAttack#recBeAttack.skillID,
		serial = BeAttack#recBeAttack.serial,
		attackerCode = BeAttack#recBeAttack.attackerCode,
		attackerHit = HitResultList,
		targetType = TargetType,
		targetCode = TargetCode,
		targetName = TargetName,
		targetPid = TargetPid,
		targetID = TargetID,
		targetDamageList = DamageList,
		totalDamageBack = DamageBack
	}.
%%处理技能效果
-spec calcBeAttackSkillEffect(BeAttack, HitResultList, DamageList, DamageBack, IsMainTarget, OldHp) -> ok when
	BeAttack :: #recBeAttack{},
	HitResultList :: list(),
	DamageList :: list(),
	DamageBack :: uint(),
	IsMainTarget :: boolean(),
	OldHp :: uint().
calcBeAttackSkillEffect(BeAttack, HitResultList, DamageList, DamageBack, IsMainTarget, OldHp) ->
	TargetCode = playerState:getPlayerCode(),

	%%构造执行效果所需要的record
	RecEffect = initEffectRecord(BeAttack, DamageList),

	%%构造被攻击者数据
	ATD = initTargetDamageRecord(BeAttack, HitResultList, DamageList, DamageBack),

	IntervalTime = playerState:getFinalAttackIntervalTime(),
	EffIDList = effect:getTriEffIDList(BeAttack#recBeAttack.skillID, IntervalTime),
	%%分离攻击者和被攻击者的效果列表
	[AttackEffect, BeAttackEffect] = effect:skillEffect(HitResultList, EffIDList, IsMainTarget),

	%%被攻击者增加技能效果
	[playerEffect:skillEffectRes(Effect, RecEffect) || Effect <- BeAttackEffect],

	%%更新效果伤害百分比(不能更改顺序,必须要在效果包后面)
	CurHp = playerState:getCurHp(),
	MaxHp = playerState:getMaxHp(),
	MapID = playerState:getMapID(),
	DiffHp = erlang:trunc(CurHp - OldHp),
	Hp_Per = skill:getPercent(CurHp, MaxHp),
	DamageMsg = #pk_GS2U_AttackResult{
		diffHp = DiffHp,
		bhp_per = Hp_Per,
		targetCode = TargetCode,
		damageHp = DamageList,
		result = HitResultList,
		userCode = BeAttack#recBeAttack.attackerCode,
		skillId = BeAttack#recBeAttack.skillID,
		serial = BeAttack#recBeAttack.serial
	},
	%%统计伤害
	playerStatistics:copyMapBeHurtStat(MapID, DiffHp),

	%% 载体技能且攻击者是玩家且攻击者PID为地图PID，则要转换
	#recBeAttack{attackerCode = AttackCode, attackerPid = AttackPid} = BeAttack,
	AttackPID =
		case codeMgr:isCodeType(?CodeTypeCarrier, AttackCode) of
			true ->
				MEts = playerState:getMapMonsterEts(),
				case ets:lookup(MEts, AttackCode) of
					[#recMapObject{ownCode = OwnerCode}] ->
						case codeMgr:isCodeType(?CodeTypePlayer, OwnerCode) of
							true ->
								PEts = playerState:getMapPlayerEts(),
								case ets:lookup(PEts, OwnerCode) of
									[#recMapObject{pid = OwnerPid}] -> OwnerPid;
									_ -> AttackPid
								end;
							_ -> AttackPid
						end;
					_ -> AttackPid
				end;
			_ -> AttackPid
		end,
	%%通知攻击者执行效果,并广播伤害
	psMgr:sendMsg2PS(AttackPID, attackRes, {BeAttack#recBeAttack.attackerCode, AttackEffect, DamageMsg, RecEffect, ATD}).

%%攻击者处理效果
-spec dealAttackRes(AttackEffect, RecEffect, ATD, DamageMsg) -> ok when
	AttackEffect :: list(),
	RecEffect :: #recSkillEffect{},
	ATD :: #recAttackTargetDamage{},
	DamageMsg :: #pk_GS2U_AttackResult{}.
dealAttackRes(AttackEffect,
	#recSkillEffect{
		targetX = X,
		targetY = Y
	} = RecEffect,
	#recAttackTargetDamage{
		serial = SN,
		skillID = SkillID,
		targetPid = TargetPid,
		targetName = TargetName,
		totalDamageBack = BackDamage,
		attackerHit = HitList,
		targetCode = TargetCode,
		targetType = TargetType,
		targetDamageList = DamageList
	},
	#pk_GS2U_AttackResult{} = DamageMsg) ->

	%%增加技能效果
	FilterEffect = playerEffect:filterEffect(AttackEffect),
	[playerEffect:skillEffectRes(Effect, RecEffect) || Effect <- FilterEffect],
	%%攻击者技能触发
	playerSkill:attackTriggerSkill(SkillID, HitList, TargetCode, ?AttackTriggerSkill),

	%%计算伤害和击中回血
	OldHp = playerState:getCurHp(),
	case OldHp > 0 of
		true ->
			MaxHp = playerState:getMaxHp(),
			RestoreHp = calcAttackRestoreHp(SN, SkillID, DamageList),
			CurHp = OldHp + RestoreHp - BackDamage,
			Hp_Per = skill:getPercent(CurHp, MaxHp),
			AttackResultList = [#pk_AttackResultList{type = ?RestoreHp, value = RestoreHp},
				#pk_AttackResultList{type = ?BackHp, value = BackDamage}],
			NewDamageMsg = DamageMsg#pk_GS2U_AttackResult{arList = AttackResultList, ahp_per = Hp_Per},
			broadcastAttackResult(NewDamageMsg, X, Y),

			%%计算反弹伤害
			case CurHp > 0 of
				true ->
					playerState:setCurHp(CurHp);
				_ ->
					playerState:setCurHp(0),
					onDead(TargetCode, TargetPid, TargetType, TargetName, SkillID)
			end;
		_ ->
			AttackResultList = [#pk_AttackResultList{type = ?RestoreHp, value = 0},
				#pk_AttackResultList{type = ?BackHp, value = 0}],
			NewDamageMsg = DamageMsg#pk_GS2U_AttackResult{arList = AttackResultList, ahp_per = 0},
			broadcastAttackResult(NewDamageMsg, X, Y)
	end,
	ok.

-spec broadcastAttackResult(DamageMsg, X, Y) -> ok when
	DamageMsg :: #pk_GS2U_AttackResult{}, X :: float(), Y :: float().
broadcastAttackResult(#pk_GS2U_AttackResult{
	userCode = UseCode,
	targetCode = TargetCode,
	skillId = SkillID,
	serial = Serial,
	bhp_per = BPer,
	ahp_per = APer,
	diffHp = DiffHp,
	damageHp = DamageHp
} = DamageMsg, X, Y) ->
	?DEBUG_OUT("skill(~p,~p),~p(~p) -> ~p(~p),diffHp:~p(~w)",
		[SkillID, Serial, UseCode, APer, TargetCode, BPer, DiffHp, DamageHp]),
	PlayerEts = playerState:getMapPlayerEts(),
	mapView:sendMsg2NearPlayerByPos(playerState:getMapPid(), PlayerEts, DamageMsg, X, Y, playerState:getGroupID()),
	ok.


%%计算坐骑耐久度
-spec calcMountSta(AttackerLevel) -> ok when
	AttackerLevel :: uint().
calcMountSta(AttackerLevel) ->
	Ignore = isIgnoreMountSa(),
	if
		Ignore -> skip;
		true ->
			case playerState:getPetMounts() of
				{_, ?PetOnMount} ->
					MountSta = playerState:getPetMountSta(),
					case AttackerLevel >= MountSta of
						true ->
							playerState:setPetMountSta(0),
							playerPet:petOffMount(false);
						_ ->
							playerState:setPetMountSta(MountSta - AttackerLevel)
					end;
				_ ->
					skip
			end
	end.
%%是否忽略掉坐骑耐久度计算
isIgnoreMountSa() ->
	playerState:getMapID() =:= ?NeedForSpeedMapID.
%%计算击中回血和伤害回血
-spec calcAttackRestoreHp(SN :: uint(), SkillID :: uint(), DamageList :: list()) -> number().
calcAttackRestoreHp(SN, SkillID, DamageList) ->
	#skillCfg{
		triggerFactor = HeathArg
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	{SkillID1, SN1} = playerState:getHitRestoreHp(),
	calcAttackRestoreHp(SN, SkillID, DamageList, SN1, SkillID1, HeathArg).

calcAttackRestoreHp(_SN, _SID, _DamageList, _SN1, _SID1, HeathArg) when HeathArg =< 0 ->
	0;
calcAttackRestoreHp(SN, SID, _DamageList, SN1, SID1, _HeathArg) when SID =/= SID1 orelse SN =/= SN1 ->
	0;
calcAttackRestoreHp(_SN, _SID, DamageList, _SN1, SID1, HeathArg) ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SID1),
	case Type =:= ?InstantSkill orelse Type =:= ?SingSkill orelse Type =:= ?GuideSkill of
		true ->
			SumDamage = lists:sum(DamageList),
			case SumDamage < 0 of
				true ->
					0;
%%					Hdam = playerState:getBattlePropTotal(?Prop_hpdam),
%%					HpHit = playerState:getBattlePropTotal(?Prop_hphit),
%%					Regainmast = playerState:getBattlePropTotal(?Prop_regainmast),
%%					GetHealfactor = playerState:getBattlePropTotal(?Prop_gethealfactor),
%%					trunc((HpHit * HeathArg + Hdam * abs(SumDamage)) * GetHealfactor * (1 + Regainmast));
				_ ->
					0
			end;
		_ ->
			0
	end.

calcSkillDamageMe(BeAttack, ResList) ->
	AbsorbValue = playerState:getAbsorbShield(),
	CurHp = playerState:getCurHp(),
	Code = playerState:getPlayerCode(),
	BattleProps = playerCalcProp:getBattleProp(),
	{NewAbsorbValue, NewHp, DamageList} = battle:calcDamage(
		AbsorbValue
		, CurHp
		, Code
		, BattleProps
		, BeAttack
		, ResList
	),
	playerState:setAbsorbShield(NewAbsorbValue),
	playerState:setCurHp(NewHp),
	DamageList.

%%玩家死亡事件，AttackerCode为被哪个杀死的
-spec onDead(AttackerCode, AttackerPid, AttackerType, AttackerName, SkillID) -> ok when
	AttackerCode :: uint(), AttackerPid :: pid(), AttackerType :: uint(), AttackerName :: string(), SkillID :: uint16().
onDead(AttackerCode, AttackerPid, AttackerType, AttackerName, SkillID) ->
	SelfCode = playerState:getPlayerCode(),
	RoleID = playerState:getRoleID(),
	MapID = playerState:getMapID(),
	?LOG_OUT("player[~p,~p,~ts] Kill Dead by Code[~p,~ts], skillID=~p",
		[RoleID, SelfCode, playerState:getName(), AttackerCode, AttackerName, SkillID]),

	{X, Y} = playerState:getPos(),

	playerBuff:triggerBuffOnDead(),

	case SkillID > 0 of
		true ->
			%%协助触发技能
			assistTrigger(SkillID),

			%%死亡触发技能
			playerSkill:deadTriggerSkill(SkillID);
		_ ->
			skip
	end,
	case playerWing:regeneration() of
		true ->
			playerMap:syncPlayerToEts(),
			ok;
		_ ->
			%%脱离战斗
			leaveBattle(SelfCode),

			case playerState:getActionStatus() of
				?CreatureActionStatusDead ->
					?ERROR_OUT("Player[~ts] already Dead", [playerState:getName()]),
					skip;
				_Status ->
					%% 通知副本地图进程，有玩家死亡了一次；其它地图不用处理
					MapID = playerState:getMapID(),
					case playerScene:getMapType(MapID) of
						?MapTypeCopyMap ->
							case playerScene:getMapSubType(MapID) of
								?MapSubTypeWarrior ->
									%%先通知客户端挑战失败
									playerMsg:sendNetMsg(#pk_GS2U_WarriorTrialSuccess{result = false}),
									%%四秒后重置副本
									erlang:send_after(4000, self(), {warriorTrialBeKilled, MapID});
								_ ->
									skip
							end,
							MapPid = playerState:getMapPid(),
							psMgr:sendMsg2PS(MapPid, playerDead, {playerState:getPlayerCode(), playerState:getGroupID()});
						_ ->
							skip
					end,
					playerState:setActionStatus(?CreatureActionStatusDead),

					CurHp = playerState:getCurHp(),
					case CurHp > 0 of
						true ->
							%%死亡了，应该没有血了
							?ERROR_OUT("player[~ts] onDead But Hp[~p] > 0", [playerState:getName(), CurHp]);
						_ ->
							skip
					end,

					%%通知玩家清除buff
					playerBuff:delBuff(),

					%%通知玩家下马
					playerPet:petOffMount(false),

					playerMap:syncPlayerToEts(),

					%% 得到攻击者RoleID和姓名
					AttackRoleID = playerBattle:getAttackRoleID(AttackerCode),

					case playerState:getBattleLearnInfo() of
						#recBattleLearn{} = BattleLearn ->
							%% 自己死亡了
							playerRevive:onDead(AttackerCode, AttackRoleID, AttackerName, true),

							%%增加目标保护措施
							playerBattleLearn:dealBattleLearnResult(BattleLearn, playerState:getGroupID());
						_ ->
							%%通知玩家清除所有宠物
							try {
								playerPet:clearAllPets()
							} catch
								_:Why ->
									?ERROR_OUT("pet clearAllPets err playerID:~p why:~p", [playerState:getRoleID(), Why])
							end,

							%% 自己死亡了
							playerRevive:onDead(AttackerCode, AttackRoleID, AttackerName, false),

							playerGuildExpedition:playerDead(AttackerCode, AttackRoleID),

							BossIDList = getCfg:get1KeyList(cfg_wildboss),
							IsBossTargetCode = isBossTarget(BossIDList, AttackerCode),
							case IsBossTargetCode of
								false ->
									playerRedName:deadPunish(AttackerCode, AttackerName, 0);
								_ ->
									ok
							end,

							%% 成就死亡判断
							playerAchieve:achieveEvent(?Achieve_First_dead, [1]),

							%% 死亡了，通知周围玩家
							Msg = #pk_GS2U_Dead{
								deadActorCode = SelfCode,
								killerCode = AttackerCode,
								killerName = AttackerName,
								skillID = SkillID
							},

							%% 其它异常死亡时，直接强制死亡
							ForceDeadMsg = #pk_GS2U_ForceDeadNow{
								skillID = SkillID,
								killerCode = AttackerCode,
								killerName = AttackerName,
								deadActorCode = SelfCode
							},

							%%通知队友
							TeamMsg = #pk_GS2U_DeadToTeam{
								roleID = RoleID,
								killerCode = AttackerCode,
								killerName = AttackerName
							},
							playerRevive:noticeTeam(X, Y, TeamMsg),

							case misc:is_process_alive(AttackerPid) of
								true ->
									%% 通知攻击者，自己死亡了
									psMgr:sendMsg2PS(AttackerPid, killedTarget, {AttackerCode, SelfCode, Msg, X, Y, IsBossTargetCode});
								_ ->
									%% 其它异常死亡
									case AttackerCode =:= 0 andalso not erlang:is_pid(AttackerPid) of
										true ->
											PlayerEts = playerState:getMapPlayerEts(),
											mapView:sendMsg2NearPlayerByPos(playerState:getMapPid(), PlayerEts, ForceDeadMsg, X, Y, playerState:getGroupID()),
											ok;
										_ ->
											skip
									end
							end,

							onDead(AttackerCode, AttackerType),

							playerState:setKillSelfType(AttackerType),
							ok
					end
			end
	end.

-spec onDead(AttackCode :: uint(), AttackerType :: uint()) -> ok.
onDead(AttackCode, AttackerType) ->
	case playerState:getIsInActivityMap() of
		true ->
			MapID = playerState:getMapID(),
			AttackRoleID = getAttackRoleID(AttackCode),
			DeadRoleID = playerState:getRoleID(),

			playerRobBattle:rob_dead({MapID, playerState:getMapPid(), AttackRoleID, DeadRoleID, playerState:getRobRoleID()}),

			%% 找攻击者
			case AttackRoleID =:= 0 of
				true ->
					skip;
				false ->
					psMgr:sendMsg2PS(playerState:getMapPid(), activeMapKillPlayer, {AttackRoleID, DeadRoleID, playerState:getPlayerCode()}),
					FMID = globalCfg:getGlobalCfg(fightall_map_id),
					case MapID of
						?HDBattleMapID ->
							core:sendMsgToActivity(?ActivityType_HDBattle, killedTarget, {DeadRoleID, AttackRoleID});
						%?GuildHomeMapID ->
						%	playerGuildHome:updateGuildTask(?GuildTaskType_Dead, AttackRoleID);
						?CrosHdBattleMapID ->
							case AttackerType =:= ?AttackerTypePlayer orelse AttackerType =:= ?AttackerTypePet of
								true ->
									List = playerState:getHateList(),
									F =
										fun(#recHate{hateCode = HateCode}, Acc) ->
											case codeMgr:getObjectTypeByCode(HateCode) of
												?ObjTypePlayer ->
													PlayerEts = playerState:getMapPlayerEts(),
													case myEts:lookUpEts(PlayerEts, HateCode) of
														[#recMapObject{id = ID}] ->
															[ID | Acc];
														_ ->
															Acc
													end;
												_ ->
													Acc
											end
										end,
									HateRoleList = lists:foldl(F, [], List),
									psMgr:sendMsg2PS(?PsNameCrosHd, killedPlayer, {AttackRoleID, playerState:getMapPid(), lists:delete(AttackRoleID, HateRoleList)});
								_ ->
									skip
							end;

						FMID ->
							core:sendMsgToActivity(?ActivityType_KingBattleAll, killedTarget, {DeadRoleID, AttackRoleID});
						_ ->
							case lists:member(MapID, ?CrosArenaMapIDList) of
								true ->
									case playerState:getPlayerCopyMapStatHurt() of
										#rec_stat_hurt{petHurt = PetHurt, playerHurt = PlayerHurt} ->
											psMgr:sendMsg2PS(?PsNameCrosArena, killedPlayer, {playerState:getMapPid(), DeadRoleID, AttackRoleID, playerState:getCamp(), PlayerHurt + PetHurt});
										_ ->
											psMgr:sendMsg2PS(?PsNameCrosArena, killedPlayer, {playerState:getMapPid(), DeadRoleID, AttackRoleID, playerState:getCamp(), 0})
									end;
								_ ->
									skip
							end
					end
			end;
		_ ->
			case playerWildBoss:isInWildBoss() of
				true ->
					%%野外boss活动中玩家被杀
					playerWildBoss:playerDead(AttackCode);
				_ ->
					skip
			end
	end,
	ok.

%%删除攻击者的PK保护
-spec delAttackProtect(IsCarrier, AttackType, AttackPid, AttackerCode) -> ok when
	IsCarrier :: #recCasterInfo{} | false,
	AttackType :: uint(),
	AttackPid :: pid(),
	AttackerCode :: uint().
delAttackProtect(#recCasterInfo{casterType = Type} = CasterInfo, _AttackType, _AttackPid, _AttackerCode) ->
	sendAttackDelPro(CasterInfo#recCasterInfo.casterPid, Type, CasterInfo#recCasterInfo.casterCode);
delAttackProtect(_, AttackType, AttackPid, AttackerCode) ->
	sendAttackDelPro(AttackPid, AttackType, AttackerCode).

-spec sendAttackDelPro(AttackPid, AttackType, AttackerCode) -> ok when
	AttackPid :: pid(),
	AttackType :: uint(),
	AttackerCode :: uint().
sendAttackDelPro(AttackPid, AttackType, AttackerCode) ->
	HateList = playerState:getHateList(),
	case AttackType =:= ?AttackerTypePlayer orelse AttackType =:= ?AttackerTypePet of
		true ->
			case lists:keyfind(AttackerCode, #recHate.hateCode, HateList) of
				false ->
					psMgr:sendMsg2PS(AttackPid, delProtect, {});
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% ====================================================================
%% hate logic functions
%% ====================================================================

%%进入战斗,初始化仇恨值
-spec enterBattle(TCode, TPid) -> ok when
	TCode :: uint(),
	TPid :: pid().
enterBattle(TCode, TPid) ->
	Hate = #recHate{
		hateCode = TCode,
		hatePid = TPid
	},
	addHate(Hate, false),

	BossIDList = getCfg:get1KeyList(cfg_wildboss),
	case isBossTarget(BossIDList, TCode) of
		false ->
			playerRedName:addKv(true, TCode, 0);
		_ ->
			ok
	end.

%%脱离战斗,删除仇恨值
-spec leaveBattle(Code :: uint()) -> reference().
leaveBattle(Code) ->
	HateList = playerState:getHateList(),
	Fun = fun(#recHate{hateCode = AttackerCode, hatePid = AttackerPid}) ->
		Hate1 = #recHate{
			hateCode = Code,
			hatePid = self(),
			hateValue = 0
		},
		psMgr:sendMsg2PS(AttackerPid, delHate, {AttackerCode, Hate1})
	      end,
	lists:foreach(Fun, HateList),
	erlang:send_after(2000, self(), delHate).

%%根据仇恨值,攻击者协助击杀或者击杀触发的技能
-spec assistTrigger(SkillID) -> ok when
	SkillID :: uint().
assistTrigger(SkillID) ->
	HateList = playerState:getHateList(),
	Fun = fun(#recHate{hatePid = AttackerPid, hateCode = AttackerCode}) ->
		psMgr:sendMsg2PS(AttackerPid, assistTrigger, {AttackerCode, SkillID})
	      end,
	lists:foreach(Fun, HateList).

%%增加仇恨值
-spec addHate(Hate, IsCarrier) -> ok when
	Hate :: #recHate{},
	IsCarrier :: false | #recCasterInfo{}.
addHate(#recHate{} = Hate, #recCasterInfo{casterCode = CasterCode, casterPid = CasterPid}) ->
	MapID = playerState:getMapID(),
	case playerSkill:getObject(CasterCode) of
		#recMapObject{hp = Hp, mapId = CasterMapID} ->
			case Hp =< 0 orelse CasterMapID =/= MapID of
				true ->
					ok;
				_ ->
					NewHate = Hate#recHate{hateCode = CasterCode, hatePid = CasterPid},
					addHate(NewHate, false)
			end;
		_ ->
			ok
	end;
addHate(#recHate{hateCode = Code, hatePid = _Pid} = Hate, false) ->
	Level = playerState:getLevel(),
	PlayerCode = playerState:getPlayerCode(),
	case playerState:isPlayerBattleStatus() of
		true ->
			skip;
		_ ->
			playerBuff:addSpecBuff(?EnergyBuff, Level),
			playerState:setPlayerBattleStatus(true)
	end,
	HateList = playerState:getHateList(),
	case lists:keyfind(Code, #recHate.hateCode, HateList) of
		false ->
			noticeHate(PlayerCode, Hate, ?AddHate),
			playerState:setHateList([Hate | HateList]),

			%% 立即显现对方
			playerMap:addScreenPKPlayer(Code),
			ok;
		_ ->
			skip
	end,
	ok.

%%删除仇恨者
-spec delHate(Hate) -> ok when
	Hate :: #recHate{}.
delHate(#recHate{hateCode = Code} = Hate) ->
	PlayerCode = playerState:getPlayerCode(),
	noticeHate(PlayerCode, Hate, ?DelHate),
	HateList = playerState:getHateList(),
	NewHateList = lists:keydelete(Code, #recHate.hateCode, HateList),
	case NewHateList of
		[] ->
			playerBuff:delSpecBuff(?EnergyBuff),
			playerBuff:delSpecBuff(?RedNameBuff),
			playerState:setPlayerBattleStatus(false);
		_ ->
			skip
	end,
	playerState:setHateList(NewHateList),
	%% 移除绑定的追击方向
	psMgr:sendMsg2PS(playerState:getMapPid(), delHate_AttackDir, {playerState:getPlayerCode(), Code}),
	ok.

%%通知客服端仇恨值变化
-spec noticeHate(CasterCode, Hate, Operate) -> ok when
	CasterCode :: uint(),
	Hate :: #recHate{},
	Operate :: uint().
noticeHate(CasterCode, Hate, Operate) ->
	playerMsg:sendNetMsg(#pk_GS2U_HateInfo{
		code = CasterCode,
		opreate = Operate,
		hateCode = Hate#recHate.hateCode
	}).

%% 是否是仇恨目标
-spec isHateTarget(TargetCode :: uint64()) -> boolean().
isHateTarget(TargetCode) ->
	HateList = playerState:getHateList(),
	lists:keymember(TargetCode, #recHate.hateCode, HateList).

%%通知当前血量
-spec noticeBlood(CurHp :: uint(), OldHp :: uint()) -> ok.
noticeBlood(CurHp, OldHp) when CurHp =/= OldHp ->
	MaxHp = playerState:getMaxHp(),
	SyncHp = misc:clamp(CurHp, 0, MaxHp),
	Msg = #pk_GS2U_PlayerHp{
		code = playerState:getPlayerCode(),
		hp = SyncHp
	},
	playerMsg:sendNetMsg(Msg);
noticeBlood(_, _) ->
	ok.

%% 根据code获取攻击者ID
-spec getAttackRoleID(AttackCode :: uint()) -> uint64() | 0.
getAttackRoleID(0) -> 0;
getAttackRoleID(AttackCode) ->
	case codeMgr:getObjectTypeByCode(AttackCode) of
		?ObjTypePlayer ->
			%% 攻击者是人
			PlayerEts = playerState:getMapPlayerEts(),
			case myEts:lookUpEts(PlayerEts, AttackCode) of
				[#recMapObject{id = RoleID} | _] ->
					RoleID;
				_ ->
					0
			end;
		?ObjTypePet ->
			%% 攻击者是宠物
			PetEts = playerState:getMapPetEts(),
			case myEts:lookUpEts(PetEts, AttackCode) of
				[#recMapObject{ownId = EtsOwnId} | _] ->
					EtsOwnId;
				_ ->
					0
			end;
		?ObjTypeCarrier ->
			%% 攻击者是载体
			MonsterEts = playerState:getMapMonsterEts(),
			case myEts:lookUpEts(MonsterEts, AttackCode) of
				[#recMapObject{ownId = EtsOwnId} | _] ->
					EtsOwnId;
				_ ->
					0
			end;
		?ObjTypeMonster ->
			%% 攻击者是怪物
			MonsterEts = playerState:getMapMonsterEts(),
			case myEts:lookUpEts(MonsterEts, AttackCode) of
				[#recMapObject{id = MonsterID} | _] ->
					MonsterID;
				_ ->
					0
			end;
		_ ->
			0
	end.