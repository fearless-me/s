%%-------------------------------------------------------------------
%% @author ZhongYuanWei
%% @copyright (C) 2014, 好玩一二三
%% @doc
%%
%% @end
%% Created : 13. 十月 2014 19:50
%%-------------------------------------------------------------------
-module(monsterInterface).
-author("ZhongYuanWei").

-include("monsterPrivate.hrl").

%% API
-export([
	init/0,
	tick/1,
	spawnMonster/1,
	spawnCarrier/1,
	clearSpawn/1,
	dealAttackRes/4,
	killedTarget/6,
	addTreat/3,
	beAttack/3,
	delBuff/1,
	addBuff/3,
	delBuff/2,
	addHate/3,
	delHate/2,
	assistTriggerSkill/2
]).

%%玩家进程API
-export([
	spawnPet/1,
	spawnPetAck/1,
	clearSpawnPet/1,
	clearSpawnPetAck/1,
	addPetBuff/3,
	addPetPassEffect/3,
	delPetPassEffect/2,
	addPetActiveSkill/3,
	delPetActiveSkill/2,
	addPetNoRepeatBuff/3,
	addPetSpawnCarrier/1,
	addPetClearCarrier/2,
	getPetSkillCDList/1,
	getPetActionStatus/1,
	getPetBattleProps/1,
	updatePetName/2,
	changeProp_AddMulti/4,
	updatePetTotalProp/2,
	setPetBaseProp/2,
	updatePetLevel/2,
%%	addMasterProp/2,
	addMasterPassEffect/2,
	delMasterPassEffect/1,
	sendMsg/1,
	moveTo/3,
	stopMove/3,
	useSkill/4,
	enterMap/2,
	leaveBattle/1,
	setPetCamp/2,
	setPetGroupID/2,
	setPetAction/2,
	setPetHp/2,
	setPetPos/3,
	getPetPos/1,
	getPetGroupID/1,
	setCasterPkMode/2,
	sendBattlePropsList/1,
	
	getMonsterHateList/1,
	getMonsterIDByCode/1,
	getMarrorAttackerID/0,
	setMarrorAttackerID/2
]).


-export([
	noticeBattleList/2
]).

%%%%%%%%%%%%%%%%%%%%%所有进程共享接口%%%%%%%%%%%%%%%%%%%%%%%%%%%
init() ->
	bstTree:initNodeId(),
	libBstAI:setAIList([]),
	monsterState:setLastTickTime(time:getUTCNowMS()),
	monsterState:setLastMoveTickTime(time:getUTCNowMS()),
	monsterState:setLastAIMoveTickTime(time:getUTCNowMS()),
	monsterState:setMonsterList([]),
	monsterState:setDeadMonsterList([]),
	ok.

tick(Now) ->
	creatureBase:tick(Now).

spawnMonster(#recSpawnMonster{} = SpawnArg) ->
	creatureBase:initCreature(?InitMonster, SpawnArg).

spawnCarrier(#recSpawnMonster{} = SpawnArg) ->
	creatureBase:initCreature(?InitCarrier, SpawnArg).

clearSpawn(Code) ->
	CodeType = monsterState:getCodeType(Code),
	clearSpawn(Code, CodeType).
clearSpawn(Code, CodeType) when CodeType =:= ?SpawnCallMonster orelse CodeType =:= ?SpawnCarrier ->
	CasterInfo = monsterState:getCasterInfo(Code),
	monsterEffect:delCallInfo(CodeType, Code, CasterInfo),
	creatureBase:delCreature(Code);
clearSpawn(Code, _) ->
	creatureBase:delCreature(Code).

dealAttackRes(AttackEffect, RecEffect, ATD, DamageMsg) ->
	monsterBattle:dealAttackRes(AttackEffect, RecEffect, ATD, DamageMsg).
	
killedTarget(AttackerCode, TargetCode, Msg, X, Y, BossTargetCode) ->
	monsterBattle:killedTarget(AttackerCode, TargetCode, Msg, X, Y, BossTargetCode).

beAttack(Code, AttackerPid, #recBeAttack{} = BeAttack) ->
	monsterBattle:beAttack(Code, AttackerPid, BeAttack).

addTreat(Code, BeTreat, AHp_Per) ->
	monsterBattle:addTreat(Code, BeTreat, AHp_Per).

addHate(Code, Hate, IsCarrier) ->
	monsterBattle:addHate(Code, Hate, IsCarrier).

delHate(Code, Hate) ->
	monsterBattle:delHate(Code, Hate).

addBuff(Code, BuffID, Level) ->
	monsterBuff:addBuff(Code, BuffID, Level).

delBuff(Code, BuffID) ->
	monsterBuff:delBuff(Code, BuffID).

delBuff(Code) ->
	monsterBuff:delBuff(Code, ?BuffTypeSub, 0).

assistTriggerSkill(Code, SkillID) ->
	monsterSkill:assistTriggerSkill(Code, SkillID).

%%%%%%%%%%%%%%%%%%%%%玩家进程接口%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%宠物创建
spawnPet(#recSpawnPet{} = PetArg) ->
	creatureBase:initCreature(?InitPet, PetArg).

%%宠物创建后返回信息
-spec spawnPetAck(#recCallPet{}) -> ok.
spawnPetAck(#recCallPet{} = CallPet) ->
	playerPet:initPetAck(CallPet).

%%宠物收回
-spec clearSpawnPet(Code::uint()) -> ok.
clearSpawnPet(0) ->
	?LOG_OUT("player dead, pet has call back");
clearSpawnPet(Code) ->
	creatureBase:delCreature(Code),
	clearSpawnPetAck(Code).

%%宠物收回返回信息
-spec clearSpawnPetAck(Code::uint()) -> ok.
clearSpawnPetAck(Code) ->
	playerPet:clearSpawnPetAck(Code).

%%宠物召唤载体
-spec addPetSpawnCarrier(Arg::#recSpawnMonster{}) -> ok.
addPetSpawnCarrier(Arg) ->
	playerPet:spawnCarrier(Arg).

%%宠物删除载体
-spec addPetClearCarrier(Code::uint(), CasterInfo::#recCasterInfo{}) -> ok.
addPetClearCarrier(Code, CasterInfo) ->
	playerEffect:delCallInfo(?SpawnCallMonster, Code, CasterInfo),
	playerPet:clearSpawn(Code).

%%获取宠物CD
-spec getPetSkillCDList(Code::uint()) -> list().
getPetSkillCDList(0) ->
	?LOG_OUT("player dead, pet has call back, not save pet skill cd"),
	[];
getPetSkillCDList(Code) ->
	monsterState:getPetSkillCD(Code).

%%获取宠物状态
-spec getPetActionStatus(Code::uint()) -> uint().
getPetActionStatus(Code) ->
	monsterState:getActionStatus(Code).

%%获取宠物属性
-spec getPetBattleProps(Code::uint()) -> list().
getPetBattleProps(Code) ->
	monsterState:getBattleProp(Code).

%%更新宠物基础属性
-spec setPetBaseProp(Code::uint(), PropList::list()) -> ok.
setPetBaseProp(Code, PropList) ->
	BattleProps = monsterState:getBattleProp(Code),
	NewBattleProps = battleProp:setBattlePropBaseValue(BattleProps, PropList),
	NewBattleProps1 = battleProp:calcCharBattleProp(NewBattleProps),
	monsterState:setBattleProp(Code, NewBattleProps1),
	monsterInterface:noticeBattleList(Code, NewBattleProps1).

%%通知战斗属性
-spec noticeBattleList(Code :: uint(), BattleList :: list()) -> ok.
noticeBattleList(Code, BattleList) ->
	case monsterState:getCodeType(Code) of
		?SpawnPet ->
			List =
				[
					?Prop_MaxHP,
					?Prop_MagicDefence,
					?Prop_PhysicalAttack,
					?Prop_MagicAttack,
					?Prop_PhysicalDefence,
					?Prop_CriticalLevel,
					?Prop_HitLevel,
					?Prop_MoveSpeed

				],
			Fun = fun(Index, Acc) ->
				case lists:keyfind(Index, #battleProp.propIndex, BattleList) of
					false ->
						[#pk_BattleProp{
							index = Index,
							value = 0.0
						} | Acc
						];
					#battleProp{totalValue = Value} ->
						[#pk_BattleProp{
							index = Index,
							value = Value
						} | Acc
						]
				end
			      end,
			SendList = lists:foldl(Fun, [], List),
			Msg = #pk_GS2U_BattlePropList{
				code = Code,
				battleProp = SendList,
				id = monsterState:getId(Code)
			},
			%%monsterInterface:addMasterProp(Code, SendList),
			monsterInterface:sendMsg(Msg);
		_ ->
			ok
	end.

%%更新宠物属性 Flag=true增加属性、Flag=false减少属性
-spec changeProp_AddMulti(Code::uint(), AddProps::list(), MultiProps::list(), Flag::boolean()) -> ok.
changeProp_AddMulti(0, _, _, _) ->
	?LOG_OUT("player login, pet has not call , not update pet props"),
	ok;
changeProp_AddMulti(Code, AddProps, MultiProps, true) ->
	BattleProps = monsterState:getBattleProp(Code),	
	NewBattleProps = battleProp:addBattlePropAddValue(BattleProps, AddProps),
	NewBattleProps1 = battleProp:addBattlePropRateValue(NewBattleProps, MultiProps),
	NewBattleProps2 = battleProp:calcCharBattleProp(NewBattleProps1),
	monsterState:setBattleProp(Code, NewBattleProps2),
	monsterInterface:noticeBattleList(Code, NewBattleProps2);
changeProp_AddMulti(Code, AddProps, MultiProps, false) ->
	BattleProps = monsterState:getBattleProp(Code),	
	NewBattleProps = battleProp:addBattlePropAddValue(BattleProps, AddProps),
	NewBattleProps1 = battleProp:delBattlePropRateValue(NewBattleProps, MultiProps),
	NewBattleProps2 = battleProp:calcCharBattleProp(NewBattleProps1),
	monsterState:setBattleProp(Code, NewBattleProps2),
	monsterInterface:noticeBattleList(Code, NewBattleProps2).

updatePetTotalProp(Code, PropList) ->
	monsterState:setBattleProp(Code, PropList),
	monsterInterface:noticeBattleList(Code, PropList).
	
%%跟新宠物名字
updatePetName(Code, Name) ->
	Msg = #pk_GS2U_PetReName{
		code = Code, 
		name = Name
	},
	monsterState:setName(Code, Name),
	sendBroadCastMsg(Msg).

%%更新宠物等级
-spec updatePetLevel(Code::uint(), Level::uint()) -> ok.
updatePetLevel(Code, Level) ->
	monsterState:setLevel(Code, Level).

%%宠物移动
-spec moveTo(Code::uint(),X::float(),Y::float()) -> ok.
moveTo(Code, X, Y) ->
	monsterMove:moveTo(Code, X, Y).

%%宠物停止
-spec stopMove(Code::uint(),X::float(),Y::float()) -> ok.
stopMove(Code, X, Y) ->
	monsterMove:stopMove(Code, X, Y).

%%宠物使用技能
-spec useSkill(Code::uint(),SkillID::uint(),CodeList::list(), SN::uint()) -> ok.
useSkill(Code, SkillID, CodeList, SN) ->
	{X, Y} = monsterState:getMonsterPos(Code),
	monsterSkill:onUsePetSkill(Code, SkillID, CodeList, SN, X, Y).

%%宠物增加buff
-spec addPetBuff(Code::uint(), BuffID::uint(), Level::uint()) -> ok.
addPetBuff(Code, BuffID, Level) ->
	monsterBuff:addBuff(Code, BuffID, Level).

%%宠物增加buff(不存在的时候才增加,并不替换)
-spec addPetNoRepeatBuff(Code::uint(), BuffID::uint(), Level::uint()) -> ok.
addPetNoRepeatBuff(Code, BuffID, Level) ->
	monsterBuff:addNoRepeatBuff(Code, BuffID, Level).

%%增加宠物被动技能
-spec addPetPassEffect(Code::uint(), SkillID::uint(), Level::uint()) -> ok.
addPetPassEffect(0, _, _) ->
	ok;
addPetPassEffect(Code, SkillID, Level) ->
	#skillCfg{
		targetSearch = Ts
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Ts of
		?SingleSkillMy ->
			monsterEffect:addPassEffect(Code, SkillID, Level);
		?SingleSkillMyMaster ->
			addMasterPassEffect(SkillID, Level);
		_ ->
			skip
	end.

%%移除宠物被动技能
-spec delPetPassEffect(Code::uint(), SkillID::uint()) -> ok.
delPetPassEffect(0, _) ->
	ok;
delPetPassEffect(Code, SkillID) ->
	#skillCfg{
		targetSearch = Ts
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Ts of
		?SingleSkillMy ->
			monsterEffect:delPassEffect(Code, SkillID);
		?SingleSkillMyMaster ->
			delMasterPassEffect(SkillID);
		_ ->
			skip
	end.

%%增加宠物主动技能
-spec addPetActiveSkill(Code::uint(), SkillID::uint(), Level::uint()) -> ok.
addPetActiveSkill(0, _, _) ->
	ok;
addPetActiveSkill(Code, SkillID, Level) ->
	monsterSkill:addTempSkill(Code, SkillID, Level).

%%移除宠物主动技能
-spec delPetActiveSkill(Code::uint(), SkillID::uint()) -> ok.
delPetActiveSkill(0, _) ->
	ok;
delPetActiveSkill(Code, SkillID) -> 
	monsterSkill:delTempSkill(Code, SkillID).

%%宠物夸地图
-spec enterMap(MapInfo::#enterMapInfo{}, Code::uint()) -> ok.
enterMap(MapInfo, Code) ->
    creatureMap:dealEnterMapAck(MapInfo, Code).

%%宠物脱战
-spec leaveBattle(Code::uint()) -> ok.
leaveBattle(Code) ->
    monsterBattle:delBothHate(Code).

%%重新设置宠物主人PkMode
-spec setCasterPkMode(Code::uint(), PkMode::uint()) -> ok.
setCasterPkMode(Code, PkMode) ->
	CasterInfo = monsterState:getCasterInfo(Code),
	monsterState:setCasterInfo(Code, CasterInfo#recCasterInfo{casterPkMode = PkMode}).

%%重新设置宠物的Camp
-spec setPetCamp(Code::uint(), Camp::uint()) -> ok.
setPetCamp(Code, Camp) ->
	Ets = monsterState:getMapPetEts(Code),
	case ets:info(Ets) of
		undefined ->?LOG_OUT("setPetCamp ets:~p not found,code:~p",[Ets,Code]);
		_ ->
			myEts:updateEts(Ets, Code, [{#recMapObject.camp, Camp}])
	end,

	monsterState:setCamp(Code, Camp).

%%设置宠物分组ID
-spec setPetGroupID(Code::uint(), GroupID::uint()) -> ok.
setPetGroupID(Code, GroupID) ->
	monsterState:setGroupID(Code, GroupID).

%%设置宠物Action
-spec setPetAction(Code::uint(), ActionStatus::uint()) -> ok.
setPetAction(Code, ActionStatus) ->
	monsterState:setActionStatus(Code, ActionStatus).

%%设置宠物血量
-spec setPetHp(Code::uint(), Hp::uint()) -> ok.
setPetHp(Code, Hp) ->
	monsterState:setCurHp(Code, Hp).

%%设置宠物坐标
-spec setPetPos(Code::uint(), X::float(), Y::float()) -> ok.
setPetPos(Code, X, Y) ->
	monsterState:setMonsterPos(Code, X, Y).

%%获取宠物位置
-spec getPetPos(Code) -> {X,Y} | undefined when Code::uint(),X::number(),Y::number().
getPetPos(Code) ->
	case codeMgr:isCodeType(?CodeTypePet,Code) of
		true ->
			monsterState:getMonsterPos(Code);
		_ ->
			undefined
	end.

%%获取宠物分组
-spec getPetGroupID(Code::uint()) -> uint().
getPetGroupID(Code) ->
	monsterState:getGroupID(Code).

%%发送消息
-spec sendMsg(Msg::tuple()) -> ok.
sendMsg(Msg) ->
	playerMsg:sendNetMsg(Msg).

%%%%增加主人属性
%%-spec addMasterProp(Code::uint(), List::list()) -> ok.
%%addMasterProp(Code, List) ->
%%	PetID = monsterState:getId(Code),
%%	playerPet:calcPetToCasterAddProp(PetID, List).

%%增加主人被动技能
-spec addMasterPassEffect(SkillID::uint(), Level::uint()) -> ok.
addMasterPassEffect(SkillID, Level) ->
	playerEffect:addPassEffect(SkillID, Level).

%%移除主人被动技能
-spec delMasterPassEffect(SkillID::uint()) -> ok.
delMasterPassEffect(SkillID) ->
	playerEffect:delPassEffect(SkillID).

%%发送广播消息
-spec sendBroadCastMsg(Msg::tuple()) -> ok.
sendBroadCastMsg(Msg) ->
	playerMsg:sendMsgToNearPlayer(Msg, true).

%%通知战斗属性
-spec sendBattlePropsList(Code::uint()) -> ok.
sendBattlePropsList(Code) ->
	BPL = monsterState:getBattleProp(Code),
	monsterInterface:noticeBattleList(Code, BPL).

%%%%%%%%%%%%%%%%%%%%%地图进程接口%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%取怪物仇恨列表
-spec getMonsterHateList(MonsterCode::uint() ) ->list().
getMonsterHateList(MonsterCode ) ->
	monsterState:getHateList( MonsterCode ).

getMonsterIDByCode(MonsterCode) ->
	monsterState:getId(MonsterCode).

%%取镜像的攻击者
getMarrorAttackerID() ->
	monsterState:getAttackerID4Marror(code4Marror).
%%镜像被攻击
setMarrorAttackerID(MonsterCode,AttackerID) ->
	ID = monsterState:getId(MonsterCode),
	#globalsetupCfg{setpara=MirroringList} = getCfg:getCfgByArgs(cfg_globalsetup, mirroring),
	
	case lists:keyfind(ID, 1, MirroringList) of
		false ->
			skip;
		_ ->
			monsterState:setAttackerID4Marror(code4Marror,AttackerID)
	end.