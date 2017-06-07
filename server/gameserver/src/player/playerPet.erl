%%%
%%%-------------------------------------------------------------------
%%% @author 罗维
%%% @copyright (C) 2014, <haowan123>
%%% @doc
%%% 玩家骑宠系统
%%% @end
%%% Created : 27. 二月 2015 10:13
%%%-------------------------------------------------------------------

%% 人物战力
%% 宠物战力 =
%% 人物战力排行榜 = 人物战力 + 出战宠物
%% 宠物战力排行榜 = 所有宠物
%% 宠物属性折算 = 出战+助战+休息 (全部在宠物表)
%%



-module(playerPet).
-author(luowei).

-include("playerPrivate.hrl").
-include("pet.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
%% 限时坐骑星阶和转生等级
-define(ExpressPetLevel, 10).

-define(RPBattlePropPetIDS,
	[
		?Prop_MaxHP,
		?Prop_PhysicalAttack,
		?Prop_MagicAttack,
		?Prop_PhysicalDefence,
		?Prop_MagicDefence,
		?Prop_CriticalLevel,
		?Prop_CriticalResistLevel,
		?Prop_CriticalDamageLevel,
		?Prop_TenaciousLevel,
		?Prop_HitLevel,
		?Prop_DodgeLevel,
		?Prop_ArmorPenetrationLevel
	]).


-define(PetPropToMaster,
	[
		?Prop_MaxHP,
		?Prop_PhysicalAttack,
		?Prop_MagicAttack,
		?Prop_PhysicalDefence,
		?Prop_MagicDefence,
		?Prop_CriticalLevel,
		?Prop_CriticalResistLevel,
		?Prop_CriticalDamageLevel,
		?Prop_TenaciousLevel,
		?Prop_HitLevel,
		?Prop_DodgeLevel,
		?Prop_ArmorPenetrationLevel
	]).

-export([
	petOnMountOther/3,
	petOffMountOther/1
]).

-export([
	petMake/1,
	petShow/0,
	petHide/0,
	petSwitch/1,
	petUpStar/1,
	petTurnRaw/1,
	petReName/2,
	petOnMount/0,
	petOffMount/1,
	petDisapear/1,
	petAttaAdd/2,
	petAttaSave/1,
	petQEquipStr/1,
	petSEquipStr/1,
	petSkillCast/2,
	petAssistBattle/3,
	petSkillReplace/1,
	petFixCast/3,
	onPetAttrChange2Master/3,
	makePetProp/5,
	getPetByID/1
]).

-export([
	initExpressPet/1,
	initPetEquip/0,
	initPetBattle/0,
	addExpressPet/1,
	tickExpressPet/0,
	getPetUpStar/2,
	getPetRaw/2,
	getPetMountID/0,
	getPetBattle/0,
	getPetBattleID/0,
	getPetBattleCode/0,
	getPetBattleRPInfo/0,
	getPetMountStatus/1,
	getPetMaxMountSta/0,
	updatePetMountSta/2,
	updateBattlePetProp/3,
	onBattlePetAttrChange/2,
	makePetBaseProp/4,
	makePetEquipProp/0,
	makePetEquipProp/3,
	makeSkillPetProp/2,
	savePetSkillCDToDB/2,
	savePetInfoToDB/1,
	sendPetInfoToClient/1,

	getPetSkills/1,    %% 提取指定骑宠ID的所有技能，用于新版骑宠领地模拟战斗时的创建骑宠
	getPetProps/1    %% 提取指定骑宠的所有属性，用于新版骑宠领地模拟战斗时的创建骑宠
	%getPetForce/1    %% 提取指定骑宠的战力，用于新版骑宠领地模拟战斗时的创建骑宠
%%	,
%%		 calcPetToCasterAddProp/2
]).
-export([
	spawnPet/1,
	spawnMonster/1,
	spawnCarrier/1,
	clearSpawn/1,
	clearSpawnPet/1,
	clearSpawnPetAck/1,
	clearAllPets/0,
	clearAllPetBuff/0,
	callPet/1,
	initPetAck/1,
	delPetByID/1,
	getSkillPet/0,
	petOnRevive/1,
	getPetCodeList/1,
	syncPetObject/2
]).

-export([
	sendPetInfoListToClient/0,
	sendPetAssistInfoListToClient/0,
	sendPetEquipListToClient/0,
	sendPetOnMountResult/4
]).

-export([
	updatePetAchieveEvent/0,
	checkBattlePet/0
]).

-export([
	gmDelPetTurnRaw/2
]).

%%tick限时宠物
-spec tickExpressPet() -> ok.
tickExpressPet() -> ok.
%%	L = getExpressPet(),
%%	Fun = fun(#recPetInfo{pet_id = ID, pet_status = Status} = Pet) ->
%%		if
%%			Status =:= ?PetState_Assist -> %%助战
%%				clearTimeLimitPetAssistBattle(ID, Pet);
%%			true ->    %%出战
%%				case getNoExpressPet() of
%%					#recPetInfo{} = NewPet ->
%%						petSwitch(false, NewPet#recPetInfo.pet_id, {true, NewPet});
%%					_ ->
%%						?ERROR_OUT("player name [~ts],roleID [~w] have no express pet", [playerState:getName(), playerState:getRoleID()])
%%				end
%%		end
%%	      end,
%%	lists:foreach(Fun, L).

%%初始化限时骑宠
-spec initExpressPet(PetID :: uint()) -> {#recPetInfo{}, [#recPetSkill{}, ...]}.
initExpressPet(PetID) ->
	#petCfg{
		petName = PetName,
		time = Time,
		stronger = Stronger,
		strongervalue = Value,
		talentSkill = TalentSkill,
		randomSkill = RandomSkill
	} = getCfg:getCfgPStack(cfg_pet, PetID),
	SL = getPetTalentSkill(TalentSkill) ++
		getPetRandomSkill(RandomSkill),
	Fun = fun(K) ->
		#pet_strongerCfg{
			maxvalue = MaxValue
		} = getCfg:getCfgPStack(cfg_pet_stronger, K),
		{K, MaxValue * Value}
	      end,
	PetAttas = lists:map(Fun, Stronger),
	Pet = #recPetInfo{
		pet_time = time2:getLocalDateTimeSec() + Time,
		pet_id = PetID,
		pet_star = ?ExpressPetLevel,
		pet_raw = ?ExpressPetLevel,
		pet_name = PetName,
		pet_force = 0,
		pet_attas = PetAttas,
		pet_status = ?PetState_Assist
	},
	{Pet, SL}.

%%增加限时骑宠
-spec addExpressPet(PetID :: uint()) -> ok.
addExpressPet(PetID) ->
	?ERROR_OUT("can't  add express pet"),
	ok.
%%	Pets = playerState:getPets(),
%%	case checkPetIsExist(PetID, Pets) of
%%		false ->
%%			{NewPetInfo, SL} = initExpressPet(PetID),
%%			playerState:setPetSkills(PetID, SL),
%%			Fun = fun(PetSkill) ->
%%				savePetSkillToDB(PetID, PetSkill)
%%			      end,
%%			lists:foreach(Fun, SL);
%%		#recPetInfo{} = PetInfo ->
%%			#petCfg{
%%				time = Time
%%			} = getCfg:getCfgPStack(cfg_pet, PetID),
%%			NewPetInfo = PetInfo#recPetInfo{
%%				pet_time = time2:getLocalDateTimeSec() + Time
%%			}
%%	end,
%%	savePetInfoToDB(NewPetInfo),
%%	sendPetInfoToClient(NewPetInfo).

getExpressPet() ->
	Now = time2:getLocalDateTimeSec(),
	Pets = playerState:getPets(),
	getExpressPet(Pets, Now, []).
getExpressPet([], _Now, L) ->
	L;
getExpressPet([#recPetInfo{pet_time = Time, pet_status = Status} = Pet | L], Now, L1)
	when Status >= ?PetState_Assist andalso Now >= Time andalso Time =/= 0 ->
	getExpressPet(L, Now, [Pet | L1]);
getExpressPet([_ | L], Now, L1) ->
	getExpressPet(L, Now, L1).

%%获取一个没有过期的宠物
getNoExpressPet() ->
	Pets = playerState:getPets(),
	Now = time2:getLocalDateTimeSec(),
	getNoExpressPet(Pets, Now).

getNoExpressPet([], _Now) ->
	[];
getNoExpressPet([#recPetInfo{pet_time = Time} = Pet | _L], _Now) when Time =:= 0 ->
	Pet;
getNoExpressPet([#recPetInfo{pet_time = Time} = Pet | _L], Now) when Time >= Now ->
	Pet;
getNoExpressPet([_ | L], Now) ->
	getNoExpressPet(L, Now).

%%初始化宠物装备列表
-spec initPetEquip() -> ok.
initPetEquip() ->
	#globalsetupCfg{
		setpara = EquipIDList
	} = getCfg:getCfgPStack(cfg_globalsetup, pet_equipment),
	initPetEquip(EquipIDList, []).
initPetEquip([], Acc) ->
	playerState:setPetEquip(Acc);
initPetEquip([EquipID | EquipIDList], Acc) ->
	#petEquipmentCfg{
		parts = Parts
	} = getCfg:getCfgPStack(cfg_petEquipment, EquipID),
	Equip = #recPetEquip{
		equip_id = EquipID,
		equip_lv = 1,
		equip_pos = Parts
	},
	savePetEquipToDB(Equip),
	%%写日志
	dbLog:sendSaveLogPetEquipStr(playerState:getRoleID(), 0, EquipID, 0, 1),
	initPetEquip(EquipIDList, [Equip | Acc]).

%%初始化出战宠物,不用计算角色战力，因为上层调用会计算
-spec initPetBattle() -> ok.
initPetBattle() ->
	renewPetMountSta(),
	L = playerState:getPets(),
	initPetBattle(L),
	initPetAttr2Master(L).


%%登录自动上坐骑
initPetBattle([]) ->
	ok;
initPetBattle([#recPetInfo{pet_status = ?PetState_Battle_Show} = Pet | _]) ->
	callPet(Pet),
	%%上坐骑
	petOnMount(Pet#recPetInfo.pet_id);
initPetBattle([_ | Pets]) ->
	initPetBattle(Pets).

initPetAttr2Master([]) ->
	ok;
initPetAttr2Master([#recPetInfo{pet_id = PetID} | Pets]) ->
	onPetAttrChange2Master(PetID, ?EquipOn, false),
	initPetAttr2Master(Pets).

%%生成宠物
-spec petMake(PetID :: uint()) -> false | ok.
petMake(PetID) ->
	Pets = playerState:getPets(),
	petMake(checkPetIsExist(PetID, Pets), PetID, Pets).
petMake(false, PetID, Pets) ->
	_PetSkill = makePetSkill(PetID),
	PetInfo1 = makePetInfo(PetID),
	PetInfo = playerForce:calcOnePetForce(PetInfo1, true),
	%%添加坐骑外观成就统计
	playerAchieve:achieveEvent(?Achieve_CollecteMounts, [1]),
	dbLog:sendSaveLogCreatePet(playerState:getRoleID(), PetInfo),
	%%宠物是否出战
	case Pets of
		[] ->
			NewPet = PetInfo#recPetInfo{
				pet_status = ?PetState_Battle_Show
			},
			savePetInfoToDB(NewPet),
			sendPetStatusToClient(PetID, ?PetState_Battle_Show),
			callPet(PetInfo);
		_ ->
			skip
	end,
	onPetAttrChange2Master(PetID, ?EquipOn, true),
	playerForce:calcPlayerForce(true);
petMake(_, _, _) ->
	false.

%%宠物显示
-spec petShow() -> ok.
petShow() ->
	case playerState:getActionStatus() of
		?CreatureActionStatusDead ->
			?ERROR_OUT("player name [~s] dead, can't operate pet! ", [playerState:getName()]);
		_ ->
			petShow(checkPetCD(), getPetBattle())
	end.

petShow(_, false) ->
	skip;
petShow(false, #recPetInfo{}) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_PetHasNotCD);
petShow(true, #recPetInfo{pet_status = ?PetState_Battle_Show}) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_PetHasShow);
petShow(true, #recPetInfo{pet_id = PetID, pet_status = ?PetState_Battle_Hide} = Pet) ->
	callPet(Pet),
	onPetAttrChange2Master(PetID, ?EquipOff, false),
	NewPet = Pet#recPetInfo{pet_status = ?PetState_Battle_Show},
	savePetInfoToDB(NewPet),
	sendPetStatusToClient(NewPet#recPetInfo.pet_id, NewPet#recPetInfo.pet_status),
	onPetAttrChange2Master(PetID, ?EquipOn, true),
	playerForce:calcPlayerForce(true);
petShow(_, _) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_PetMountHasSleep).

%%隐藏当前出战宠物
-spec petHide() -> ok.
petHide() ->
	case playerState:getActionStatus() of
		?CreatureActionStatusDead ->
			?ERROR_OUT("player name [~s] dead, can't operate pet! ", [playerState:getName()]);
		_ ->
			petHide(getPetBattle())
	end.
petHide(false) ->
	skip;
petHide(#recPetInfo{pet_status = ?PetState_Battle_Hide}) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_PetHasHide);
petHide(TempPetPet = #recPetInfo{pet_id = PetID, pet_status = Status}) when Status >= ?PetState_Battle_Show ->
	case checkPetIsSleep() of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_PetMountHasSleep);
		_ ->
			onPetAttrChange2Master(PetID, ?EquipOff, false),
			Pet = TempPetPet#recPetInfo{pet_status = ?PetState_Battle_Hide},

			case playerPetDouble:isDoubleMountType(?DoublePetGuest) of
				false ->
					petOffMount(false);
				_ ->
					skip
			end,

			Code = getPetBattleCode(),
			Sl = getPetUnLockPassSkill(PetID),
			F = fun(#recPetSkill{skill_id = SkillID}) ->
				monsterInterface:delPetPassEffect(Code, SkillID)
			    end,
			lists:foreach(F, Sl),
			savePetSkillCDToDB(PetID, Code),
			clearSpawnPet(Code),
			savePetInfoToDB(Pet),
			sendPetStatusToClient(PetID, Pet#recPetInfo.pet_status),
			onPetAttrChange2Master(PetID, ?EquipOn, true),
			playerForce:calcPlayerForce(true)
	end;
petHide(_) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_PetHasHide).

%%宠物升星
-spec petUpStar(PetID :: uint()) -> ok.
petUpStar(PetID) ->
	Pets = playerState:getPets(),
	petUpStar(PetID, checkPetIsUpStar(PetID, Pets)).
petUpStar(PetID, {Cost, Opens, Pet}) ->
	OldStar = Pet#recPetInfo.pet_star,
	NewStar = OldStar + 1,
	case lists:keyfind(NewStar, 1, Opens) of
		{NewStar, Pos} ->
			SkillID = unlockPetSkill(PetID, Pos);
		_ ->
			SkillID = 0
	end,

	playerAchieve:achieveEvent(?Achieve_PetUpstar, [1]),
	onPetAttrChange2Master(PetID, ?EquipOff, false),
	NewPet = Pet#recPetInfo{pet_star = NewStar},
	delItem(Cost, ?ItemDeleteReasonPetUpStar),
	savePetInfoToDB(NewPet),
	sendPetUpStarToClient(PetID, NewStar, SkillID),

	onPetAttrChange2Master(PetID, ?EquipOn, true),

	%%写日志
	dbLog:sendSaveLogPetUpStar(playerState:getRoleID(), PetID, OldStar, NewStar),
	playerForce:calcPlayerForce(true),
	playerForce:calcOnePetForce(PetID, true);
petUpStar(_PetID, Error) ->
	playerMsg:sendErrorCodeMsg(Error).

%% 更新骑宠成就 fixme 这里有个问题没搞懂，playerAchieve:achieveEvent 更新一次成就，就把所有的加上了？
-spec updatePetAchieveEvent() -> ok.
updatePetAchieveEvent() ->
	MaxStar = getPetMaxStar(),
	case MaxStar > 0 andalso (MaxStar rem 2) =:= 0 of
		true ->
			Div = MaxStar div 2,
			#achievementCfg{reward = ReWardList} = getCfg:getCfgPStack(cfg_achievement, ?Achieve_PetUpstar),
			case lists:filter(fun([Star, _, _]) -> Div =:= Star end, ReWardList) of
				[_ | _] ->
					AchieveList = playerState:getPlayerAchieveList(),
					AchieveLvl =
						case lists:keyfind(?Achieve_PetUpstar, #recAchieve.aID, AchieveList) of
							#recAchieve{aScheduleLevel = Lvl} -> Lvl;
							_ -> 0
						end,
					case (Div - 1) > AchieveLvl of
						true ->
%%							?WARN_OUT("updatePetAchieveEvent:~ts,~p", [playerState:getName(), MaxStar]),
							playerAchieve:achieveEvent(?Achieve_PetUpstar, [1]),

							%% 判断一下是否初始化设置
							case lists:keyfind(?Achieve_PetUpstar, #recAchieve.aID, playerState:getPlayerAchieveList()) of
								#recAchieve{aScheduleLevel = 0} = Value ->
									%% 再设置一次
									?LOG_OUT("updatePetAchieveEvent:roleID=~p,MaxStar=~p,Value=~p", [playerState:getRoleID(), MaxStar, Value]),
									playerAchieve:achieveEvent(?Achieve_PetUpstar, [1]);
								_ -> skip
							end,
							ok;
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.


%%宠物转生
-spec petTurnRaw(PetID :: uint()) -> ok.
petTurnRaw(PetID) ->
	Pets = playerState:getPets(),
	petTurnRaw(PetID, checkPetIsRaw(PetID, Pets)).
petTurnRaw(PetID, {Cost, Pet}) ->
	NewRaw = Pet#recPetInfo.pet_raw + 1,
	NewPet = Pet#recPetInfo{pet_raw = NewRaw},
	onPetAttrChange2Master(PetID, ?EquipOff, false),
	delItem(Cost, ?ItemDeleteReasonPetRaw),
	savePetInfoToDB(NewPet),
	onPetAttrChange2Master(PetID, ?EquipOn, true),
	%%写日志
	dbLog:sendSaveLogPetRaw(playerState:getRoleID(), PetID, Pet#recPetInfo.pet_raw, NewRaw),
	sendPetRawToClient(PetID, NewRaw),
	%%宠物转生成就
	playerAchieve:achieveEvent(?Achieve_pet_rebon, [1]),
	playerForce:calcPlayerForce(true),
	playerForce:calcOnePetForce(PetID, true);
%%updatePetBaseProp();
petTurnRaw(_PetID, Error) ->
	playerMsg:sendErrorCodeMsg(Error).

gmDelPetTurnRaw(PetID, Raw) ->
	Pets = playerState:getPets(),
	case lists:keyfind(PetID, #recPetInfo.pet_id, Pets) of
		false ->
			?LOG_OUT("not find pet id [~p]", [PetID]);
		Pet ->
			onPetAttrChange2Master(PetID, ?EquipOff, false),
			NewPet = Pet#recPetInfo{pet_raw = Raw},
			savePetInfoToDB(NewPet),
			onPetAttrChange2Master(PetID, ?EquipOn, true),
			playerForce:calcPlayerForce(true),
			playerForce:calcOnePetForce(PetID, true)
	end.


%%宠物切换
-spec petSwitch(PetID :: uint()) -> ok.
petSwitch(PetID) ->
	petSwitch(playerState:isPlayerBattleStatus(), PetID).
petSwitch(true, _) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_PetMountNotSwitch);
petSwitch(false, PetID) ->
	petSwitch(false, PetID, canBattlePet(PetID)).
petSwitch(false, PetID, {true, Pet}) ->
	%%将宠物改为助战状态并且刷新客户端信息
	AssistPetAndFlash =
		fun(TempCallPet) ->
			OldCallPet = TempCallPet#recPetInfo{pet_status = Pet#recPetInfo.pet_status},
			savePetInfoToDB(OldCallPet),
			sendPetStatusToClient(OldCallPet#recPetInfo.pet_id, OldCallPet#recPetInfo.pet_status)
		end,
	%%收回招出宠物
	BattlePetID =
		case getPetBattle() of
			#recPetInfo{pet_status = PetState, pet_id = CallPetID} = TempCallPet when (PetState =:= ?PetState_Battle_Show) or (PetState =:= ?PetState_Battle_Mount) ->
				IsDoubPetGuest = playerPetDouble:isDoubleMountType(?DoublePetGuest),
				IsDoubPetOwner = playerPetDouble:isDoubleMountType(?DoublePetOwner),
				if
					PetState =:= ?PetState_Battle_Mount andalso IsDoubPetGuest =:= false ->
						petOffMount(false);
					IsDoubPetOwner =:= true ->
						playerPetDouble:doubleMountOff();
					true ->
						ok
				end,
				Code = getPetBattleCode(),
				Sl = getPetUnLockPassSkill(PetID),
				F =
					fun(#recPetSkill{skill_id = SkillID}) ->
						monsterInterface:delPetPassEffect(Code, SkillID)
					end,
				lists:foreach(F, Sl),
				savePetSkillCDToDB(PetID, Code),
				clearSpawnPet(Code),
				onPetAttrChange2Master(CallPetID, ?EquipOff, false),
				AssistPetAndFlash(TempCallPet),
				onPetAttrChange2Master(CallPetID, ?EquipOn, false),
				playerForce:calcOnePetForce(CallPetID, false),
				CallPetID;
			#recPetInfo{pet_id = CallPetID1} = TempCallPet ->
				onPetAttrChange2Master(CallPetID1, ?EquipOff, false),
				AssistPetAndFlash(TempCallPet),
				onPetAttrChange2Master(CallPetID1, ?EquipOn, false),
				playerForce:calcOnePetForce(CallPetID1, false),
				CallPetID1;
			_ ->
				0
		end,
	onPetAttrChange2Master(PetID, ?EquipOff, false),

	NewPet = Pet#recPetInfo{pet_status = ?PetState_Battle_Show},
	savePetInfoToDB(NewPet),
	playerForce:calcOnePetForce(PetID, true),
	sendPetStatusToClient(NewPet#recPetInfo.pet_id, NewPet#recPetInfo.pet_status),
	callPet(Pet),
	onPetAttrChange2Master(PetID, ?EquipOn, true),
	playerForce:calcPlayerForce(true),
	onPetSwitch(BattlePetID, PetID, Pet#recPetInfo.pet_status),
	%%上坐骑
	petOnMount(PetID);
petSwitch(_, _, Error) ->
	playerMsg:sendErrorCodeMsg(Error).

onPetSwitch(CallPetID, NewCallPetID, ?PetState_Assist) ->
	case getPetAssistBattleSlot(NewCallPetID) of
		Slot when Slot > 0 ->
			updatePetAssistBattleInfo(?PetState_Assist, Slot, CallPetID);
		_ ->
			?ERROR_OUT("onPetSwitch,pet assist status error  petid(~p), assistlist(~w)",
				[NewCallPetID, getPetAssistBattleInfo()])
	end;
onPetSwitch(_CallPetID, _NewCallPetID, _NewCallPetStatus) ->
	ok.

%% 上别人的双人坐骑
petOnMountOther(Code, OwnerCode, PetID) ->
	case playerState:isPlayerBattleStatus() of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_PetMountHasBattle),
			false;
		_ ->
			%%先下
			petOffMount(false),
			changeMoveSpeed(PetID, ?PetOnMount),
%%			playerVipInter:setMountSpeedAdd(?PetOnMount),
			playerState:setPetMounts({PetID, ?PetOnMount}),
			sendPetOnMountResult(Code, PetID, OwnerCode, playerState:getPlayerCode()),
			true
	end.
%% 下别人的双人坐骑
petOffMountOther(Code) ->
	case playerState:getPetMounts() of
		{ID, ?PetOnMount} ->
			changeMoveSpeed(ID, ?PetOffMount),
			playerVipInter:setMountSpeedAdd(?PetOffMount),
			playerState:setPetMounts({ID, ?PetOffMount}),
			sendPetOffMountResult(Code);
		_ ->
			skip
	end.

%%上骑宠
-spec petOnMount() -> ok.
petOnMount() ->
	case playerPetDouble:isInDoubleMountState() of
		true ->
			?ERROR_OUT(" role[~p], isInDoubleMountState ", [playerState:getRoleID()]);
		_ ->
			doPetOnMount()
	end,
	ok.

doPetOnMount() ->
	case playerState:isPlayerBattleStatus() of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_PetMountHasBattle);
		_ ->
			case getPetBattle() of
				false ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_PetMountNotExist);
				#recPetInfo{pet_status = Status} when Status =:= ?PetState_Battle_Hide ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_PetMountHasNotShow);
				#recPetInfo{pet_id = ID} ->
					Code = getPetBattleCode(),
					case getPetMountStatus(Code) of
						?CreatureActionStatusDead ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_PetMountHasSleep);
						_ ->
							case playerState:getPetMounts() of
								{_, ?PetOnMount} ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_PetMountHasOnMount);
								_ ->
									renewPetMountSta(),
									changeMoveSpeed(ID, ?PetOnMount),
									playerVipInter:setMountSpeedAdd(?PetOnMount),
									playerState:setPetMounts({ID, ?PetOnMount}),
									monsterInterface:setPetAction(Code, ?CreatrueActionStatusStealth),
									sendPetOnMountResult(Code, ID, playerState:getPlayerCode(), 0)
							end
					end
			end
	end.

%%setMountPetState(ID, State)->
%%	case lists:keyfind(ID, #recPetInfo.pet_id, playerState:getPets()) of
%%		#recPetInfo{} = Pet ->
%%			NewPet = Pet#recPetInfo{pet_status = ?PetBattleState3},
%%			savePetInfoToDB(NewPet);
%%		_ ->
%%			skip
%%	end,
%%
%%	ok.

petOnMount(PetID) ->
	IsDoublePetGuest = playerPetDouble:isDoubleMountType(?DoublePetGuest),
	case playerState:getPetMounts() of
		{OldPetID, ?PetOnMount} when PetID =:= OldPetID andalso IsDoublePetGuest =:= false ->
			changeMoveSpeed(PetID, ?PetOnMount),
			playerVipInter:setMountSpeedAdd(?PetOnMount),
			sendPetOnMountResult(getPetBattleCode(), PetID, playerState:getPlayerCode(), 0);
		{OldPetID, ?PetOnMount} when PetID =/= OldPetID andalso IsDoublePetGuest =:= false ->
			changeMoveSpeed(OldPetID, ?PetOffMount),
			playerVipInter:setMountSpeedAdd(?PetOffMount),
			changeMoveSpeed(PetID, ?PetOnMount),
			playerVipInter:setMountSpeedAdd(?PetOnMount),
			playerState:setPetMounts({PetID, ?PetOnMount}),
			sendPetOnMountResult(getPetBattleCode(), PetID, playerState:getPlayerCode(), 0);
		_ ->
			skip
	end.

%%下骑宠
-spec petOffMount(Boolean :: boolean()) -> ok.
petOffMount(IsSendErrorCode) ->
	Ret =
		case playerPetDouble:doubleMountOff() of
			true ->
				false;
			_ ->
				IsSendErrorCode
		end,
	doPetOffMount(Ret).

doPetOffMount(IsSendErrorCode) ->
	case getPetBattle() of
		false ->
			case IsSendErrorCode of
				true ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_PetMountNotExist);
				_ ->
					skip
			end;
		#recPetInfo{pet_status = Status} when Status =:= ?PetState_Battle_Hide ->
			case IsSendErrorCode of
				true ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_PetMountHasNotShow);
				_ ->
					skip
			end;
		#recPetInfo{pet_id = ID} ->
			case playerState:getPetMounts() of
				{_, ?PetOnMount} ->
					changeMoveSpeed(ID, ?PetOffMount),
					playerVipInter:setMountSpeedAdd(?PetOffMount),
					playerState:setPetMounts({ID, ?PetOffMount}),
					monsterInterface:setPetAction(getPetBattleCode(), ?CreatureActionStatusStand),
					sendPetOffMountResult(getPetBattleCode());
				_ ->
					skip
			end
	end.

%%强制删除宠物
-spec petDisapear(TargetCode :: uint()) -> ok.
petDisapear(TargetCode) ->
	Pos = playerState:getPos(),
	MapPid = playerState:getMapPid(),
	GroupID = playerState:getGroupID(),
	PetEts = playerState:getMapPetEts(),
	List = mapView:getNearViewObject(MapPid, PetEts, ?ObjTypePet, Pos, GroupID),
	case lists:keyfind(TargetCode, #recMapObject.code, List) of
		#recMapObject{status = Status} ->
			case Status of
				?CreatureActionStatusDead ->
					Msg = #pk_GS2U_BroadcastDisapear{code = [TargetCode]},
					playerMsg:sendNetMsg(Msg);
				?CreatrueActionStatusStealth ->
					Msg = #pk_GS2U_BroadcastDisapear{code = [TargetCode]},
					playerMsg:sendNetMsg(Msg);
				_ ->
					skip
			end;
		_ ->
			Msg = #pk_GS2U_BroadcastDisapear{code = [TargetCode]},
			playerMsg:sendNetMsg(Msg)
	end,
	ok.

%%获取骑宠星级的最大等级
-spec getPetMaxStar() -> uint().
getPetMaxStar() ->
	Pets = playerState:getPets(),
	Fun =
		fun(#recPetInfo{pet_time = Time, pet_star = Star}, Max) ->
			case Time =:= 0 of
				true ->
					%% 只取普通骑宠
					case Star >= Max of
						true -> Star;
						_ -> Max
					end;
				_ -> Max
			end
		end,
	lists:foldr(Fun, 0, Pets).

%%获取骑宠Code
-spec getPetCodeList(PetList :: list()) -> list().
getPetCodeList([]) ->
	[];
getPetCodeList(PetList) ->
	Fun = fun(#recCallPet{pet_code = Code}) ->
		Code
	      end,
	lists:map(Fun, PetList).

%%获取宠物升星精灵点数
-spec getPetUpStar(Lv :: uint(), Qual :: uint()) -> uint().
getPetUpStar(0, _) ->
	0;
getPetUpStar(Lv, Qual) ->
	#petfairy_pointCfg{
		enhan_point = [A, B, C, D, E]
	} = getCfg:getCfgPStack(cfg_petfairy_point, Lv),
	case Qual of
		?PetQualityWhite ->
			A;
		?PetQualityGreen ->
			B;
		?PetQualityBlue ->
			C;
		?PetQualityPurple ->
			D;
		?PetQualityOrange ->
			E;
		?PetQualityRed ->
			E
	end.

%%获取宠物转生精灵点数
-spec getPetRaw(Lv :: uint(), Qual :: uint()) -> uint().
getPetRaw(0, _) ->
	0;
getPetRaw(Lv, Qual) ->
	#petfairy_pointCfg{
		reborn_point = [A, B, C, D, E]
	} = getCfg:getCfgPStack(cfg_petfairy_point, Lv),
	case Qual of
		?PetQualityWhite ->
			A;
		?PetQualityGreen ->
			B;
		?PetQualityBlue ->
			C;
		?PetQualityPurple ->
			D;
		?PetQualityOrange ->
			E;
		?PetQualityRed ->
			E
	end.

%%获取骑宠ID
-spec getPetMountID() -> int().
getPetMountID() ->
	case playerState:getPetMounts() of
		{ID, ?PetOnMount} ->
			ID;
		_ ->
			0
	end.

%%获取骑宠状态
-spec getPetMountStatus(Code :: uint()) -> int().
getPetMountStatus(Code) ->
	monsterInterface:getPetActionStatus(Code).

%% 更新骑宠耐久值
-spec updatePetMountSta(MountSta :: number(), MaxMountSta :: uint()) -> ok.
updatePetMountSta(MountSta, MaxMountSta) when erlang:is_number(MountSta), MountSta >= 0 ->
	if
		MountSta < MaxMountSta ->
			playerState:setPetMountSta(MountSta);
		true ->
			playerState:setPetMountSta(MaxMountSta)
	end,
	ok.

%% 获取骑宠最大耐久值
-spec getPetMaxMountSta() -> uint().
getPetMaxMountSta() ->
	case globalCfg:getMountSta() of
		not_found ->
			Sta = 0;
		Sta ->
			Sta
	end,
	PlayerLevel = playerState:getLevel(),
	Sta * PlayerLevel.

%% 加满骑宠耐久值
-spec renewPetMountSta() -> ok.
renewPetMountSta() ->
	MaxMountSta = getPetMaxMountSta(),
	playerState:setPetMountSta(MaxMountSta).

%%召唤宠物
-spec callPet(#recPetInfo{}) -> ok.
callPet(#recPetInfo{pet_id = PetID} = Pet) ->
	IDList = playerState:getCallPetIDList(),
	callPet(lists:member(PetID, IDList), Pet).
callPet(true, Pet) ->
	?ERROR_OUT("player name [~s] call pet [~p] has exist! ", [playerState:getName(), Pet#recPetInfo.pet_id]);
callPet(_, #recPetInfo{pet_id = ID, pet_star = Star, pet_raw = Raw, pet_name = PetName}) ->
	{X, Y} = playerState:getPos(),
	Level = playerState:getLevel(),
	Time = time:getUTCNowMSDiff2010(),
	BPL = makePetProp(ID, Level, Star, Raw, ?PetState_Battle_Show),
	%%Force = calcPetForce(ID, BPL),
	Skills = getPetUnLockActiveSkill(ID),
	PetArg = #recSpawnPet{
		caster_code = playerState:getPlayerCode(),
		caster_pkmode = playerState:getPkStatus(),
		caster_id = playerState:getRoleID(),
		caster_name = playerState:getName(),
		caster_type = ?AttackerTypePlayer,
		caster_pid = self(),
		pet_status = initPetState(),
		pet_mapid = playerState:getMapID(),
		pet_mapPid = playerState:getMapPid(),
		pet_name = PetName,

		pet_skills = Skills,
		pet_props = BPL,
		pet_level = Level,

		pet_id = ID,
		pet_x = X,
		pet_y = Y,
		pet_other = [0, ?CallPetTypeRMB],
		pet_camp = playerState:getCamp(),
		pet_guildID = playerState:getGuildID(),
		pet_groupID = playerState:getGroupID(),
		pet_teamID = playerState:getTeamID(),
		pet_petEts = playerState:getMapPetEts(),
		pet_playerEts = playerState:getMapPlayerEts(),
		pet_monsterEts = playerState:getMapMonsterEts()
	},
	playerState:setPetCD(Time),
	playerPropSync:setInt(?PubProp_PetTurnRaw, Raw),
	spawnPet(PetArg).

%%宠物属性
%%改变移动速度属性
-spec changeMoveSpeed(PetID :: uint(), Operate :: uint()) -> ok.
changeMoveSpeed(PetID, ?PetOnMount) ->
	#petCfg{
		mountSpeed = MountSpeed
	} = getCfg:getCfgPStack(cfg_pet, PetID),
	playerCalcProp:changeProp_AddMulti([{?Prop_MoveSpeed, MountSpeed}], [], ?EquipOn, true);
changeMoveSpeed(PetID, ?PetOffMount) ->
	#petCfg{
		mountSpeed = MountSpeed
	} = getCfg:getCfgPStack(cfg_pet, PetID),
	playerCalcProp:changeProp_AddMulti([{?Prop_MoveSpeed, -MountSpeed}], [], ?EquipOn, true).


%%更新宠物属性(加法和乘法值),仅仅给出战宠物加成
-spec updateBattlePetProp(AddProps :: list(), MultiProps :: list(), Flag :: boolean()) -> ok.
updateBattlePetProp(AddProps, MultiProps, Flag) ->
	%PetBattle = getPetBattle(),
	monsterInterface:changeProp_AddMulti(getPetBattleCode(), AddProps, MultiProps, Flag).

%%更新宠物名字
-spec updatePetName(PetID :: uint(), Name :: string) -> ok.
updatePetName(PetID, Name) ->
	updatePetName(getPetBattle(), PetID, Name).
updatePetName(#recPetInfo{
	pet_status = Status,
	pet_id = ID
}, PetID, Name) when Status =:= ?PetState_Battle_Show andalso PetID =:= ID ->
	monsterInterface:updatePetName(getPetBattleCode(), Name);
updatePetName(_, _, _) ->
	ok.

%%生成宠物属性,所有属性
-spec makePetProp(PetID :: uint(), Level :: uint(), Star :: uint(), Raw :: uint(), Status :: uint()) -> list().
makePetProp(PetID, Level, Star, Raw, Status) when Status >= ?PetState_Battle_Show ->
	%%宠物基础值
	PropList = makePetBaseProp(PetID, Level, Star, Raw),
	BattlePropList = battleProp:initBattleProp(false),
	BattlePropList0 = battleProp:setBattlePropBaseValue(BattlePropList, PropList),

	%%宠物提升属性
	{AttaAddProps, AttaMultiProps} = makePetAddProp(PetID),

	%%天赋系统
	{TalAddProps, TalMultiProps} = makePetTalentProp(),

	%%宠物宝石
	{GemAddProps, GemMultiProps} = makePetGemProp(),

	{OwnerPetAddProps, OwnerPetMultiProps} = makePetOwnerProp(),
	%%宠物装备
	{EquipAddProps, EquipMultiProps} = makePetEquipProp(),
	%%宠物符文
	{RuneAddProps, RuneMultProps} = playerRune:getPetRunePropList([PetID]),

	BattlePropList1 = battleProp:addBattlePropAddValue(
		BattlePropList0, AttaAddProps ++ TalAddProps ++ GemAddProps ++ EquipAddProps ++ RuneAddProps ++ OwnerPetAddProps),
	BattlePropList2 = battleProp:addBattlePropRateValue(
		BattlePropList1, AttaMultiProps ++ TalMultiProps ++ GemMultiProps ++ EquipMultiProps ++ RuneMultProps ++ OwnerPetMultiProps),
	battleProp:calcCharBattleProp(BattlePropList2);
makePetProp(PetID, Level, Star, Raw, _) ->
	%%宠物基础值
	PropList = makePetBaseProp(PetID, Level, Star, Raw),
	BattlePropList = battleProp:initBattleProp(false),
	BattlePropList0 = battleProp:setBattlePropBaseValue(BattlePropList, PropList),

	%%宠物提升属性
	{AttrAddProps, AttrMultiProps} = makePetAddProp(PetID),

	%%天赋系统
%%	{TalAddProps, TalMultiProps} = makePetTalentProp(),

	%%宠物宝石
%%	{GemAddProps, GemMultiProps} = makePetGemProp(),

	%%
%%	{OwnerPetAddProps, OwnerPetMultiProps} = makePetOwnerProp(),

	%%宠物装备
%%	{EquipAddProps, EquipMultiProps} = makePetEquipProp(),

	%%宠物符文
	{RuneAddProps, RuneMuliProps} = playerRune:getPetRunePropList([PetID]),

	BattlePropList1 = battleProp:addBattlePropAddValue(
		BattlePropList0, AttrAddProps ++ RuneAddProps),%% ++ TalAddProps ++ GemAddProps  ++ OwnerPetAddProps ++ EquipAddProps),
	BattlePropList2 = battleProp:addBattlePropRateValue(
		BattlePropList1, AttrMultiProps ++ RuneMuliProps), %% ++ TalMultiProps ++ GemMultiProps ++ OwnerPetMultiProps ++ EquipMultiProps),
	battleProp:calcCharBattleProp(BattlePropList2).

%%makPetProp(PetID, Level, Star, Raw, _ ) ->
%%	%%宠物基础值
%%	PropList = makePetBaseProp(PetID, Level, Star, Raw),
%%	BattlePropList = battleProp:initBattleProp(false),
%%	BattlePropList0 = battleProp:setBattlePropBaseValue(BattlePropList, PropList),
%%	%%宠物提升属性
%%	{AttaAddProps, AttaMultiProps} = makePetAddProp(PetID),
%%	%%计算总值
%%	BattlePropList1 = battleProp:addBattlePropAddValue(BattlePropList0, AttaAddProps),
%%	BattlePropList2 = battleProp:addBattlePropRateValue(BattlePropList1, AttaMultiProps),
%%	battleProp:calcCharBattleProp(BattlePropList2).


%%生成技能宠物属性，计算出来的结果将会被放到地图上面
makeSkillPetProp(PetID, Level) ->
	%%技能召唤宠物受人物属性加成列表
	BattlePropList = battleProp:initBattleProp(false),
	BasePropListInitValue = makePetBaseProp(PetID, Level, 0, 0),
	BattlePropList0 = battleProp:setBattlePropBaseValue(BattlePropList, BasePropListInitValue),
	battleProp:calcCharBattleProp(BattlePropList0).
%%
%%%%生成宠物基础属性
%%-spec makePetBaseProp(PetID :: uint(), Leve :: uint()) -> list().
%%makePetBaseProp(PetID, Level) ->
%%	#petCfg{
%%		tough = Tough,
%%		runSpeed = RunSpeed,
%%		hpMulti = HpMulti,
%%		score = Score,
%%		eleDamMulti = EleDamMulti,
%%		eleDefMulti = EleDefMulti,
%%		phycDefMulti = PhycDefMulti,
%%		holyDefMulti = HolyDefMulti,
%%		shadDefMulti = ShadDefMulti,
%%		phycDamMulti = PhycDamMulti,
%%		holyDamMulti = HolyDamMulti,
%%		shadDamMulti = ShadDamMulti
%%	} = getCfg:getCfgPStack(cfg_pet, PetID),
%%	#petLevelPropertyCfg{
%%		maxHP = MaxHp,
%%		phyDef = PhyDef,
%%		holyDef = HolyDef,
%%		shadDef = ShadDef,
%%		eleDef = EleDef,
%%		phycDam = PhycDam,
%%		holyDam = HolyDam,
%%		shadDam = ShadDam,
%%		eleDam = EleDam
%%	} = getCfg:getCfgPStack(cfg_petLevelProperty, Level),
%%	[
%%		{?Prop_physicaldefence, PhycDefMulti * PhyDef},
%%		{?Prop_physicaldamage, PhycDamMulti * PhycDam},
%%		{?Prop_shadowdefence, ShadDefMulti * ShadDef},
%%		{?Prop_holydefence, HolyDefMulti * HolyDef},
%%		{?Prop_tough, Tough},
%%		{?Prop_hitratio, Score},
%%		{?Prop_MaxHP, MaxHp * HpMulti},
%%		{?Prop_movespeed, RunSpeed},
%%		{?Prop_holydamage, HolyDamMulti * HolyDam},
%%		{?Prop_elementdamage, EleDamMulti * EleDam},
%%		{?Prop_shadowdamage, ShadDamMulti * ShadDam},
%%		{?Prop_elementdefence, EleDefMulti * EleDef}
%%	].

%%生成人民币宠物基础属性，计算出来的结果会被存放到进程字典内
%% -spec makePetBaseProp(PetID :: uint(), Leve::uint(), Star::uint(), Raw::uint()) -> list().
makePetBaseProp(PetID, Level, Star, Raw) ->
	#petCfg{
		enhCost = GroupID,
		petquality = Quality,
		runSpeed = RunSpeed,
		maxHP_Multi = HPMulti,
		physicalAttack_Multi = PSAMulti,
		magicAttack_Multi = MSAMulti,
		physicalDefence_Multi = PDMulti,
		magicDefence_Multi = MDMulti,
		criticalLevel_Multi = CLMulti,
		criticalResistLevel_Multi = CRLMulti,
		criticalDamageLevel_Multi = CDLMulti,
		tenaciousLevel_Multi = TLMulti,
		hitLevel_Multi = HLMulti,
		dodgeLevel_Multi = DLMulit,
		armorPenetrationLevel_Multi = APLMulti,
		hPRecover_Multi = HPRMulti,
		mPRecover_Multi = MPRMuti
	} = getCfg:getCfgPStack(cfg_pet, PetID),
	#petLevelPropertyCfg{
		maxHP2 = MaxHp,
		physicalAttack = PhysicalAttack,
		magicAttack = MagicAttack,
		physicalDefence = PhysicalDefence,
		magicDefence = MagicDefence,
		criticalLevel = CriticalLevel,
		criticalResistLevel = CriticalResistLevel,
		criticalDamageLevel = CriticalDamageLevel,
		tenaciousLevel = TenaciousLevel,
		hitLevel = HitLevel,
		dodgeLevel = DodgeLevel,
		armorPenetrationLevel = ArmorPenetrationLevel,
		hPRecover = HPRecover,
		mPRecover = MPRecover
	} = getCfg:getCfgPStack(cfg_petLevelProperty, Level),
	#petrebornCfg{
		star = StarArg
	} = getCfg:getCfgPStack(cfg_petreborn, GroupID, Star),
	#petrebornCfg{
		reborn = RawArg
	} = getCfg:getCfgPStack(cfg_petreborn, GroupID, Raw),
	QualityArg = globalCfg:getGlobalCfg(erlang:list_to_atom("petQuality" ++ erlang:integer_to_list(Quality))),
	[
		{?Prop_MoveSpeed, RunSpeed},
		{?Prop_MaxHP, MaxHp * (StarArg + QualityArg + RawArg) * HPMulti},
		{?Prop_PhysicalAttack, PhysicalAttack * (StarArg + QualityArg + RawArg) * PSAMulti},                %%物攻：物理职业只有物攻
		{?Prop_MagicAttack, MagicAttack * (StarArg + QualityArg + RawArg) * MSAMulti},                        %%法攻：法术职业只有法攻
		{?Prop_PhysicalDefence, PhysicalDefence * (StarArg + QualityArg + RawArg) * PDMulti},                %%物理防御
		{?Prop_MagicDefence, MagicDefence * (StarArg + QualityArg + RawArg) *  MDMulti},                    %%法防：所有职业都有，细微偏差
		{?Prop_CriticalLevel, CriticalLevel * (StarArg + QualityArg + RawArg) * CLMulti},                    %%暴击等级：通过公式转换成暴击率
		{?Prop_CriticalResistLevel, CriticalResistLevel * (StarArg + QualityArg + RawArg) * CRLMulti}, %%抗爆等级：通过公式转换成减免暴击率
		{?Prop_CriticalDamageLevel, CriticalDamageLevel* (StarArg + QualityArg + RawArg) * CDLMulti},        %%爆伤等级：初始为普通攻击的2倍伤害，通过公式转换成暴击伤害增加到暴击伤害上
		{?Prop_TenaciousLevel, TenaciousLevel* (StarArg + QualityArg + RawArg) * TLMulti},                %%韧性等级：爆伤等级的反属性
		{?Prop_HitLevel, HitLevel * (StarArg + QualityArg + RawArg) * HLMulti},                            %%命中等级：通过公式转换成命中率
		{?Prop_DodgeLevel, DodgeLevel * (StarArg + QualityArg + RawArg) * DLMulit},                        %%闪避等级：通过公式转换成闪避等级
		{?Prop_ArmorPenetrationLevel, ArmorPenetrationLevel * (StarArg + QualityArg + RawArg) * APLMulti},    %%破甲等级：通过转换公式，转换成破甲率，当命中公式判断为破甲伤害时，则忽略对方护甲
		{?Prop_HPRecover, HPRecover* (StarArg + QualityArg + RawArg) * HPRMulti},                            %%生命秒回值
		{?Prop_MPRecover, MPRecover* (StarArg + QualityArg + RawArg) * MPRMuti}                            %%法术秒回值
	].

%%makePetBaseProp(PetID, Level, Star, Raw) ->
%%	#petCfg{
%%		pveSpeed = PveSpeed,
%%		hpMulti = HpMulti,
%%		petquality = Quality,
%%		tough = Tough,
%%		score = Score,
%%		runSpeed = RunSpeed,
%%		eleDamMulti = EleDamMulti,
%%		eleDefMulti = EleDefMulti,
%%		phycDefMulti = PhycDefMulti,
%%		holyDefMulti = HolyDefMulti,
%%		shadDefMulti = ShadDefMulti,
%%		phycDamMulti = PhycDamMulti,
%%		holyDamMulti = HolyDamMulti,
%%		shadDamMulti = ShadDamMulti
%%	} = getCfg:getCfgPStack(cfg_pet, PetID),
%%	#petLevelPropertyCfg{
%%		phyDef = PhyDef,
%%		holyDef = HolyDef,
%%		shadDef = ShadDef,
%%		eleDef = EleDef,
%%		phycDam = PhycDam,
%%		holyDam = HolyDam,
%%		shadDam = ShadDam,
%%		eleDam = EleDam,
%%		maxHP2 = MaxHp,
%%		physicalAttack = PhysicalAttack,
%%		magicAttack = MagicAttack,
%%		physicalDefence = PhysicalDefence,
%%		magicDefence = MagicDefence,
%%		criticalLevel = CriticalLevel,
%%		criticalResistLevel = CriticalResistLevel,
%%		criticalDamageLevel = CriticalDamageLevel,
%%		tenaciousLevel = TenaciousLevel,
%%		hitLevel = HitLevel,
%%		dodgeLevel = DodgeLevel,
%%		armorPenetrationLevel = ArmorPenetrationLevel,
%%		hPRecover = HPRecover,
%%		mPRecover = MPRecover
%%	} = getCfg:getCfgPStack(cfg_petLevelProperty, Level),
%%	#petrebornCfg{
%%		star = StarArg
%%	} = getCfg:getCfgPStack(cfg_petreborn, Star),
%%	#petrebornCfg{
%%		reborn = RawArg
%%	} = getCfg:getCfgPStack(cfg_petreborn, Raw),
%%	#petrebornCfg{
%%		quanlity = QualityArg
%%	} = getCfg:getCfgPStack(cfg_petreborn, Quality),
%%	[
%%		{?Prop_physicaldefence, PhycDefMulti * PhyDef},
%%		{?Prop_physicaldamage, PhycDamMulti * PhycDam * StarArg * QualityArg * RawArg},
%%		{?Prop_shadowdefence, ShadDefMulti * ShadDef},
%%		{?Prop_holydefence, HolyDefMulti * HolyDef},
%%		{?Prop_tough, Tough},
%%		{?Prop_hitratio, Score},
%%		{?Prop_petattackspeed, PveSpeed},
%%		{?Prop_MaxHP, MaxHp * HpMulti * StarArg * QualityArg * RawArg},
%%		{?Prop_movespeed, RunSpeed},
%%		{?Prop_holydamage, HolyDamMulti * HolyDam * StarArg * QualityArg * RawArg},
%%		{?Prop_elementdamage, EleDamMulti * EleDam * StarArg * QualityArg * RawArg},
%%		{?Prop_shadowdamage, ShadDamMulti * ShadDam * StarArg * QualityArg * RawArg},
%%		{?Prop_elementdefence, EleDefMulti * EleDef},
%%		{?Prop_PhysicalAttack, PhysicalAttack},                %%物攻：物理职业只有物攻
%%		{?Prop_MagicAttack, MagicAttack},                        %%法攻：法术职业只有法攻
%%		{?Prop_PhysicalDefence, PhysicalDefence},                %%物防：所有职业都有，细微偏差
%%		{?Prop_MagicDefence, MagicDefence},                    %%法防：所有职业都有，细微偏差
%%		{?Prop_CriticalLevel, CriticalLevel},                    %%暴击等级：通过公式转换成暴击率
%%		{?Prop_CriticalResistLevel, CriticalResistLevel},        %%抗爆等级：通过公式转换成减免暴击率
%%		{?Prop_CriticalDamageLevel, CriticalDamageLevel},        %%爆伤等级：初始为普通攻击的2倍伤害，通过公式转换成暴击伤害增加到暴击伤害上
%%		{?Prop_TenaciousLevel, TenaciousLevel},                %%韧性等级：爆伤等级的反属性
%%		{?Prop_HitLevel, HitLevel},                            %%命中等级：通过公式转换成命中率
%%		{?Prop_DodgeLevel, DodgeLevel},                        %%闪避等级：通过公式转换成闪避等级
%%		{?Prop_ArmorPenetrationLevel, ArmorPenetrationLevel},    %%破甲等级：通过转换公式，转换成破甲率，当命中公式判断为破甲伤害时，则忽略对方护甲
%%		{?Prop_HPRecover, HPRecover},                            %%生命秒回值
%%		{?Prop_MPRecover, MPRecover}                            %%法术秒回值
%%	].

%%生成宠物装备属性
%% -spec makePetEquipProp() -> {list(), list()}.
makePetEquipProp() ->
	EquipList = playerState:getPetEquip(),
	makePetEquipProp(EquipList, [], []).
makePetEquipProp([], AddProps, MultiProps) ->
	{AddProps, MultiProps};
makePetEquipProp([#recPetEquip{equip_id = ID, equip_lv = Lv} | EquipList], AddProps, MultiProps) ->
	#petEquipmentCfg{baseProperty = Props} = getCfg:getCfgPStack(cfg_petEquipment, ID),
	makePetEquipProp(EquipList, AddProps, MultiProps, Lv, Props).
makePetEquipProp(EquipList, AddProps, MultiProps, _Lv, []) ->
	makePetEquipProp(EquipList, AddProps, MultiProps);
makePetEquipProp(EquipList, AddProps, MultiProps, Lv, [{Key, ParaA, ParaB} | Props]) ->
	#petEquipmentLevelCfg{propertyIndex = PropIndexs} = getCfg:getCfgPStack(cfg_petEquipmentLevel, Lv),
	{Key, Value, CalcType} = lists:keyfind(Key, 1, PropIndexs),
	case CalcType of
		0 ->
			NewAddProps = [{Key, Value * ParaA + Lv * ParaB} | AddProps],
			makePetEquipProp(EquipList, NewAddProps, MultiProps, Lv, Props);
		1 ->
			NewMultiProps = [{Key, Value * ParaA + Lv * ParaB} | MultiProps],
			makePetEquipProp(EquipList, AddProps, NewMultiProps, Lv, Props)
	end.

%%生成天赋系统属性
-spec makePetTalentProp() -> {list(), list()}.
makePetTalentProp() ->
	playerTalent:getPetTalentProp().

%%生成宠物宝石属性
-spec makePetGemProp() -> {list(), list()}.
makePetGemProp() ->
	playerPackage:getAllPetGemIDFromPackage().

makePetOwnerProp() ->
	PetPlus = playerState:getBattlePropTotal(?Prop_PetDamagePlus),
	PetReduce = playerState:getBattlePropTotal(?Prop_PetDamageReduce),
	{[{?Prop_PetDamagePlus, PetPlus}, {?Prop_PetDamageReduce, PetReduce}], []}.

%%
%%%%生成宠物助战属性
%%%% -spec makePetBattleProp() -> {list(), list()}.
%%makePetBattleProp([], AddProps, MultiProps) ->
%%	{AddProps, MultiProps};
%%makePetBattleProp([#recPetInfo{pet_id = ID, pet_star = Star, pet_raw = Raw, pet_status = ?PetNoBattleStateAssist} | PetList], AddProps, MultiProps) ->
%%	BPL = makePetBaseProp(ID, playerState:getLevel(), Star, Raw),
%%	#globalsetupCfg{setpara = [ParaA]} = getCfg:getCfgPStack(cfg_globalsetup, petAssist),
%%	makePetBattleProp(?PetBattleProps, AddProps, MultiProps, PetList, BPL, ParaA);
%%makePetBattleProp([_ | PetList], AddProps, MultiProps) ->
%%	makePetBattleProp(PetList, AddProps, MultiProps).
%%makePetBattleProp([], AddProps, MultiProps, PetList, _BPL, _ParaA) ->
%%	makePetBattleProp(PetList, AddProps, MultiProps);
%%makePetBattleProp([Key | List], AddProps, MultiProps, PetList, BPL, ParaA) ->
%%	{Key, Val} = lists:keyfind(Key, 1, BPL),
%%	NewAddProps = [{Key, Val * ParaA} | AddProps],
%%	makePetBattleProp(List, NewAddProps, MultiProps, PetList, BPL, ParaA).

%%生成宠物提升属性
-spec makePetAddProp(PetID :: uint()) -> {list(), list()}.
makePetAddProp(PetID) ->
	Pets = playerState:getPets(),
	case lists:keyfind(PetID, #recPetInfo.pet_id, Pets) of
		#recPetInfo{pet_attas = Attas} ->
			{Attas, []};
		_ ->
			{[], []}
	end.

%%%%宠物增加主人属性
%%-spec calcPetToCasterAddProp(PetID::uint(), List::list()) -> ok.
%%calcPetToCasterAddProp(PetID, List) ->
%%	case get(petBattleProp) of
%%		 L when is_list(L) ->
%%			 %%去掉变化前的
%%			 Fun = fun({K, V}) ->
%%				{K, -V}
%%			 end,
%%			 BP = playerCalcProp:getBattleProp(),
%%			 BPL = battleProp:addBattlePropAddValue(BP, lists:map(Fun, L)),
%%			 ?LOG_OUT("pet to caster change ~p", [lists:map(Fun, L)]),
%%			 addPropToMaster(PetID, List, BPL);
%%		_ ->
%%			BPL = playerCalcProp:getBattleProp(),
%%			addPropToMaster(PetID, List, BPL)
%%	end.

%%addPropToMaster(PetID, List, BPL) ->
%%	Pl = [
%%		?Prop_MaxHP,
%%		?Prop_physicaldefence,
%%		?Prop_elementdefence,
%%		?Prop_holydamage,
%%		?Prop_physicaldamage,
%%		?Prop_shadowdamage,
%%		?Prop_elementdamage
%%	],
%%	#petCfg{
%%		petToMaster = PetToMaster
%%	} = getCfg:getCfgPStack(cfg_pet, PetID),
%%	Fun = fun(#pk_BattleProp{index = Index, value = Value}, Acc) ->
%%		case lists:member(Index, Pl) of
%%			true ->
%%				[{Index, Value * PetToMaster} | Acc];
%%			false ->
%%				Acc
%%		end
%%	      end,
%%	L = lists:foldl(Fun, [], List),
%%	put(petBatttleProp, L),
%%	BPL1 = battleProp:addBattlePropAddValue(BPL, L),
%%	?LOG_OUT("pet to caster add change ~p", [L]),
%%	playerCalcProp:calcBattleProp(BPL1, true, true).

%%宠物改名
-spec petReName(PetID :: uint(), Name :: string()) -> ok.
petReName(PetID, Name) ->
	Pets = playerState:getPets(),
	case canPetReName(PetID, Name, Pets) of
		{ok, #recPetInfo{} = Pet} ->
			NewPet = Pet#recPetInfo{
				pet_name = Name
			},
			savePetInfoToDB(NewPet),
			sendPetReNameToClient(PetID, Name),
			updatePetName(PetID, Name);
		Error ->
			playerMsg:sendErrorCodeMsg(Error)
	end.

sendPetAssistInfoListToClient() ->
	L1 = getPetAssistBattleInfo(),
	L2 = [#pk_AssistBattleInfo{slot = Slot, petID = PetID} || #recPetAssistInfo{slot = Slot, petID = PetID} <- L1],
	playerMsg:sendNetMsg(#pk_GS2U_PetAssistInit{infoList = L2}),
	ok.
%%宠物助战
-spec petAssistBattle(Slot :: uint(), PetID :: uint(), Status :: uint()) -> ok.
petAssistBattle(Slot, PetID, Status) ->
	petAssistBattle(Slot, PetID, Status, canPetAssistBattle(Slot, PetID, Status)).
petAssistBattle(Slot, PetID, Status, #recPetInfo{} = Pet) ->
	NewPet = Pet#recPetInfo{pet_status = Status},
	onPetAttrChange2Master(PetID, ?EquipOff, false),
	savePetInfoToDB(NewPet),
	sendPetStatusToClient(PetID, Status),
	updatePetAssistBattleInfo(Status, Slot, PetID),
	%%改变属性
	onPetAttrChange2Master(PetID, ?EquipOn, true),
	playerForce:calcPlayerForce(true);
petAssistBattle(_, _, _, Error) ->
	playerMsg:sendErrorCodeMsg(Error).

getPetAssistBattleInfo() ->
	playerPropSync:getProp(?SerProp_PetAssistBattleInfo).

setPetAssistBattleInfo(L) ->
	playerPropSync:setAny(?SerProp_PetAssistBattleInfo, L).

isPetAssistBattleInfoSlotEmpty(Slot) ->
	L = getPetAssistBattleInfo(),
	case lists:keyfind(Slot, #recPetAssistInfo.slot, L) of
		#recPetAssistInfo{petID = PetID} when PetID > 0 ->
			false;
		_ ->
			true
	end.

getPetAssistBattleSlot(PetID) ->
	L = getPetAssistBattleInfo(),
	case lists:keyfind(PetID, #recPetAssistInfo.petID, L) of
		#recPetAssistInfo{slot = Slot} ->
			Slot;
		_ ->
			0
	end.

updatePetAssistBattleInfo(?PetState_Assist, Slot, PetID) ->
	doUpdatePetAssistBattleInfo(Slot, PetID);
updatePetAssistBattleInfo(_Status, Slot, _PetID) ->
	doUpdatePetAssistBattleInfo(Slot, 0).

doUpdatePetAssistBattleInfo(Slot, PetID) ->
	L1 = getPetAssistBattleInfo(),
	L2 =
		case PetID > 0 of
			true ->
				lists:keystore(Slot, #recPetAssistInfo.slot, L1, #recPetAssistInfo{slot = Slot, petID = PetID});
			_ ->
				lists:keydelete(Slot, #recPetAssistInfo.slot, L1)
		end,
	setPetAssistBattleInfo(L2),
	playerMsg:sendNetMsg(#pk_GS2U_PetAssistUpdateSlot{
		slot = Slot, petID = PetID}).

%%宠物是否可以助战
-spec canPetAssistBattle(Slot :: uint(), PetID :: uint(), Status :: uint()) -> uint() | #recPetInfo{}.
canPetAssistBattle(Slot, PetID, Status) ->
	Pets = playerState:getPets(),
	Now = time2:getLocalDateTimeSec(),
	IsSlotEmpty = isPetAssistBattleInfoSlotEmpty(Slot),
	if
		IsSlotEmpty =:= true andalso Status =:= ?PetState_Idle ->
			?ErrorCode_PetMountHasCancelAssistBattle;
		IsSlotEmpty =:= false andalso Status =:= ?PetState_Assist ->
			?ErrorCode_PetMountHasAssistBattle;
		true ->
			case checkPetIsExist(PetID, Pets) of
				false ->
					?ErrorCode_PetNotExistError;
				#recPetInfo{pet_status = ?PetState_Idle} when Status =:= ?PetState_Idle ->
					?ErrorCode_PetMountHasCancelAssistBattle;
				#recPetInfo{pet_status = ?PetState_Assist} when Status =:= ?PetState_Assist ->
					?ErrorCode_PetMountHasAssistBattle;
				#recPetInfo{pet_status = State} when State > ?PetState_Assist ->
					?ErrorCode_PetHasBattle;
				#recPetInfo{pet_time = Time} when Now >= Time andalso Time =/= 0 ->
					?ErrorCode_PetMountHasExpress;
				#recPetInfo{} = Pet when Status =:= ?PetState_Assist ->
					MaxNumber = getPetAssistMaxNum(),
					case getPetBattleAssistNum() >= MaxNumber andalso Slot >= 1 andalso Slot =< MaxNumber of
						true ->
							?ErrorCode_PetAssistBattleMax;
						_ ->
							Pet
					end;
				#recPetInfo{} = Pet ->
					Pet
			end
	end.

getPetAssistMaxNum() ->
	Level = playerState:getLevel(),
	case globalCfg:getPetAssistNum() of
		not_found ->
			0;
		L ->
			lists:foldl(
				fun({MinLv, Num}, Acc) ->
					case Level >= MinLv of
						true -> Num;
						_ -> Acc
					end
				end, 0, L)
	end.

%%获取助战宠物个数
-spec getPetBattleAssistNum() -> uint().
getPetBattleAssistNum() ->
	getPetBattleAssistNum(playerState:getPets(), 0).
getPetBattleAssistNum([], Num) ->
	Num;
getPetBattleAssistNum([#recPetInfo{pet_status = ?PetState_Assist} | Pets], Num) ->
	getPetBattleAssistNum(Pets, Num + 1);
getPetBattleAssistNum([_ | Pets], Num) ->
	getPetBattleAssistNum(Pets, Num).

%%清除时限类宠物助战状态、只有时限类宠物才会执行改代码
clearTimeLimitPetAssistBattle(PetID, #recPetInfo{} = Pet) ->
	NewPet = Pet#recPetInfo{
		pet_status = ?PetState_Idle
	},
	savePetInfoToDB(NewPet),
	sendPetStatusToClient(PetID, NewPet#recPetInfo.pet_status),
	onPetAttrChange2Master(PetID, ?EquipOff, true),
%%	屏蔽此处战斗力计算：因为宠物属性不会发生变化
	playerForce:calcPlayerForce(true);
clearTimeLimitPetAssistBattle(_, Error) ->
	playerMsg:sendErrorCodeMsg(Error).

%%宠物装备

%%一建宠物装备强化
-spec petQEquipStr(EquipID :: uint()) -> ok.
petQEquipStr(EquipID) ->
	petQEquipStr(EquipID, canPetEquipStr(EquipID)).

petQEquipStr(_EquipID, {#recPetEquip{} = Equip, Items}) ->
	onBattlePetAttrChange(?EquipOff, false),
	NewEquip = petEquipStr(Equip, Items),
	petQEquipStr(Equip, NewEquip, checkPetEquipStrMaterial(NewEquip)),
	onBattlePetAttrChange(?EquipOn, true),
	calcBattlePetForce(true),
	playerForce:calcPlayerForce(true);
petQEquipStr(_, Error) ->
	playerMsg:sendErrorCodeMsg(Error).

petQEquipStr(#recPetEquip{} = OldEquip, #recPetEquip{} = NewEquip, Items) when is_list(Items) ->
	NewEquip1 = petEquipStr(NewEquip, Items),
	petQEquipStr(OldEquip, NewEquip1, checkPetEquipStrMaterial(NewEquip1));
petQEquipStr(OldEquip, NewEquip, _) ->
	sendPetEquipToClient(NewEquip),
	{OldAddProps, OldMultiProps} = makePetEquipProp([OldEquip], [], []),
	{NewAddProps, NewMultiProps} = makePetEquipProp([NewEquip], [], []),
	Addlevel = NewEquip#recPetEquip.equip_lv - OldEquip#recPetEquip.equip_lv,
	%%骑宠装备升级成就
	playerAchieve:achieveEvent(?Achieve_pet_weapon, [Addlevel]),

	updateBattlePetProp(getDeductProps(OldAddProps), OldMultiProps, false),
	updateBattlePetProp(NewAddProps, NewMultiProps, true).
%%	%%	装备强化只会改变宠物总战斗力
%%	calcBattlePetForce(true),
%%	playerForce:calcAllPetForce(true),
%%	playerForce:calcPlayerForce(true).

%%宠物装备强化
-spec petSEquipStr(EquipID :: uint()) -> ok.
petSEquipStr(EquipID) ->
	petSEquipStr(EquipID, canPetEquipStr(EquipID)).
petSEquipStr(_EquipID, {#recPetEquip{} = Equip, Items}) ->
	onBattlePetAttrChange(?EquipOff, false),
	NewEquip = petEquipStr(Equip, Items),
	sendPetEquipToClient(NewEquip),
	{OldAddProps, OldMultiProps} = makePetEquipProp([Equip], [], []),
	{NewAddProps, NewMultiProps} = makePetEquipProp([NewEquip], [], []),
	updateBattlePetProp(getDeductProps(OldAddProps), OldMultiProps, false),
	updateBattlePetProp(NewAddProps, NewMultiProps, true),
	Addlevel = NewEquip#recPetEquip.equip_lv - Equip#recPetEquip.equip_lv,
	%%骑宠装备升级成就
	playerAchieve:achieveEvent(?Achieve_pet_weapon, [Addlevel]),

	%%	装备强化只会改变宠物总战斗力
	onBattlePetAttrChange(?EquipOn, true),
	calcBattlePetForce(true);
petSEquipStr(_, Error) ->
	playerMsg:sendErrorCodeMsg(Error).

petEquipStr(#recPetEquip{equip_lv = Lv, equip_id = ID} = Equip, Items) ->
	NewEquip =
		if
			((Lv + 1) rem ?PetEquipUpLv) =:= 0 ->
				#petEquipmentCfg{
					advanced = Advanced
				} = getCfg:getCfgPStack(cfg_petEquipment, ID),
				case Advanced of
					0 ->
						Equip#recPetEquip{
							equip_lv = Lv + 1
						};
					NewID ->
						Equip#recPetEquip{
							equip_id = NewID,
							equip_lv = Lv + 1
						}
				end;
			true ->
				Equip#recPetEquip{
					equip_lv = Lv + 1
				}
		end,
	delItem(Items, ?ItemDeleteReasonPetEquipStr),
	savePetEquipToDB(NewEquip),
	savePetEquipToMem(NewEquip),

	%%写日志
	dbLog:sendSaveLogPetEquipStr(playerState:getRoleID(), ID, NewEquip#recPetEquip.equip_id, Lv, Lv + 1),
	NewEquip.

%%宠物属性提升
-spec petAttaAdd(PetID :: uint(), Times :: uint()) -> ok.
petAttaAdd(PetID, Times) ->
	Pets = playerState:getPets(),
	petAttaAdd(PetID, Times, canPetAddAtta(PetID, Pets, Times)).
petAttaAdd(PetID, Times, {#recPetInfo{pet_attas = Atta}, true}) ->
	playerState:setRmbCastPetAtta(PetID, []),
	[{CostId, CostNum}] = globalCfg:getPetAttaMaterial(),
	delItem([{CostId, CostNum * Times}], ?ItemDeleteReasonAddPetAtta),
	#petCfg{
		stronger = Stronger,
		strongervalue = Value
	} = getCfg:getCfgPStack(cfg_pet, PetID),
	Fun = fun(K) ->
		#pet_strongerCfg{
			maxvalue = MaxValue
		} = getCfg:getCfgPStack(cfg_pet_stronger, K),
		{K, MaxValue * Value}
	      end,
	MaxList = lists:map(Fun, Stronger),
	PropList = getPetAddAttaRuleRes(Atta, MaxList, Times),
	?DEBUG_OUT("pet add atta list [~p], [~p]", [Atta, PropList]),
	playerState:setRmbCastPetAtta(PetID, PropList),
	sendPetAddAttaResult(PetID, PropList);
petAttaAdd(_, _, Error) ->
	playerMsg:sendErrorCodeMsg(Error).

%%宠物属性保存
-spec petAttaSave(PetID :: uint()) -> ok.
petAttaSave(PetID) ->
	Pets = playerState:getPets(),
	petAttaSave(PetID, canPetSaveAtta(PetID, Pets)).
petAttaSave(PetID, {#recPetInfo{pet_attas = Attas} = PetInfo, PropList}) ->
	#petCfg{
		stronger = Stronger,
		strongervalue = Value
	} = getCfg:getCfgPStack(cfg_pet, PetID),
	Fun1 = fun(K) ->
		#pet_strongerCfg{
			maxvalue = MaxValue
		} = getCfg:getCfgPStack(cfg_pet_stronger, K),
		{K, MaxValue * Value}
	       end,
	MaxList = lists:map(Fun1, Stronger),
	Fun =
		fun({K, V}, {Acc, Acc1}) ->
			V1 =
				case lists:keyfind(K, 1, Acc) of
					false ->
						0;
					{K, Value1} ->
						Value1
				end,
			{K, Max} = lists:keyfind(K, 1, MaxList),
			{CurV, CurV1} =
				if
					V1 + V >= Max ->
						{Max, Max - V1};
					V1 + V =< 0 ->
						{0, -V1};
					true ->
						{V1 + V, V}
				end,
			{lists:keystore(K, 1, Acc, {K, CurV}), [{K, CurV1} | Acc1]}
		end,

	onPetAttrChange2Master(PetID, ?EquipOff, false),
%%	onBattlePetAttrChange(?EquipOff, false),
	{NAttas, NewPropList} = lists:foldl(Fun, {Attas, []}, PropList),
	NewPet = PetInfo#recPetInfo{pet_attas = NAttas},
	savePetInfoToDB(NewPet),
	playerState:setRmbCastPetAtta(PetID, []),
	playerForce:calcOnePetForce(PetID, true),
	sendPetSaveAttaResult(PetID, NAttas),
	case getPetBattle() of
		#recPetInfo{pet_id = PetID} ->
			updateBattlePetProp(NewPropList, [], true);
		_ ->
			skip
	end,
	onPetAttrChange2Master(PetID, ?EquipOn, true),

	playerForce:calcPlayerForce(true);

petAttaSave(_PetID, Error) ->
	playerMsg:sendErrorCodeMsg(Error).

%%生成宠物
-spec makePetInfo(PetID :: uint()) -> #recPetInfo{}.
makePetInfo(PetID) ->
	#petCfg{
		%petquality = PetQuality,
		petName = PetName,
		stronger = Stronger
	} = getCfg:getCfgPStack(cfg_pet, PetID),
	Fun = fun(K) ->
		{K, 0}
	      end,
	PetProps = lists:map(Fun, Stronger),
	#recPetInfo{
		pet_id = PetID,
		pet_star = 0,
		pet_raw = 0,
		pet_name = PetName,
		pet_force = 0,
		pet_attas = PetProps,
		pet_status = ?PetState_Idle
	}.

%%宠物技能

%%生成宠物技能
-spec makePetSkill(PetID :: uint()) -> ok.
makePetSkill(PetID) ->
	makeInternalPetSkill(PetID),
	makeAdditionalPetSkill(PetID),
	PetSkills = playerState:getPetSkills(PetID),
	Fun = fun(PetSkill) ->
		savePetSkillToDB(PetID, PetSkill)
	      end,
	lists:foreach(Fun, PetSkills).

%%解锁宠物技能
-spec unlockPetSkill(PetID :: uint(), StarLv :: uint()) -> uint().
unlockPetSkill(PetID, StarLv) ->
	SkillList = playerState:getPetSkills(PetID),
	Skill = lists:keyfind(
		StarLv,
		#recPetSkill.skill_index,
		SkillList
	),
	#recPetSkill{
		skill_id = SkillID,
		skill_level = Level
	} = NewSkill = Skill#recPetSkill{
		skill_is_unlock = ?PetSkillLock
	},
	NewSkillList = lists:keyreplace(
		StarLv,
		#recPetSkill.skill_index,
		SkillList,
		NewSkill
	),
	playerState:setPetSkills(PetID, NewSkillList),
	addPetBattleSkill(PetID, SkillID, Level),
	savePetSkillToDB(PetID, NewSkill),
	NewSkill#recPetSkill.skill_id.

%%洗炼宠物技能
-spec petSkillCast(PetID :: uint(), SkillIDs :: list()) -> ok.
petSkillCast(_PetID, []) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_PetSkillCastError);
petSkillCast(PetID, SkillIDs) ->
	case canCastPetSkill(PetID, SkillIDs) of
		MaterialList when is_list(MaterialList) ->
			#petCfg{
				petquality = PetQual
			} = getCfg:getCfgPStack(cfg_pet, PetID),
			%%洗练宠物技能
			CommonSkillList = getPetSkillByType(PetID, ?PetSkillTypeCommon),
			%%已经拥有的普通技能
			FilterList = filterRepeatPetSkill1(SkillIDs, CommonSkillList),
			CastPetSkills = calcSkillCastRule(PetQual, SkillIDs, FilterList, []),
			playerState:setRmbCastPetSkill(CastPetSkills),
			delItem(MaterialList, ?ItemDeleteReasonPetSkillCast),
			sendPetSkillCastResult(PetID, CastPetSkills),
			playerSevenDays:onMissionEvent(?SevenDayMission_Event_9, 1, 0);
		Error ->
			playerMsg:sendErrorCodeMsg(Error)
	end.

%%替换宠物技能
-spec petSkillReplace(PetID :: uint()) -> ok.
petSkillReplace(PetID) ->
	case playerState:getRmbCastPetSkill() of
		[] ->
			skip;
		List ->
			Skills = playerState:getPetSkills(PetID),
			Fun = fun(#recPetSkillCast{
				skill_old_id = OldSkillID,
				skill_new_id = NewSkillID,
				skill_level = NewSkillLevel
			}, Acc) ->
				Skill = lists:keyfind(
					OldSkillID,
					#recPetSkill.skill_id,
					Skills
				),
				OldSkillLevel = Skill#recPetSkill.skill_level,
				NewSkill = Skill#recPetSkill{
					skill_id = NewSkillID,
					skill_level = NewSkillLevel
				},
				NewSkills = lists:keyreplace(
					Skill#recPetSkill.skill_index,
					#recPetSkill.skill_index,
					Acc,
					NewSkill
				),
				delPetBattleSkill(PetID, OldSkillID),
				addPetBattleSkill(PetID, NewSkillID, NewSkillLevel),
				savePetSkillToDB(PetID, NewSkill),
				%%写日志
				dbLog:sendSaveLogPetCast(playerState:getRoleID(), PetID, OldSkillID, NewSkillID, OldSkillLevel, NewSkillLevel),
				NewSkills
			      end,
			playerState:setPetSkills(PetID, lists:foldl(Fun, Skills, List)),
			playerState:setRmbCastPetSkill([]),
			playerForce:calcOnePetForce(PetID, true),
			sendPetSkillReplaceResult(PetID)
	end.


%%根据ID删除指定宠物
-spec delPetByID(ID) -> ok when
	ID :: uint().
delPetByID(ID) ->
	CallPetList = playerState:getCallPet(),
	Fun = fun(#recCallPet{pet_id = PetID, pet_code = Code}) ->
		if
			ID =:= PetID ->
				clearSpawnPet(Code);
			true ->
				skip
		end
	      end,
	lists:foreach(Fun, CallPetList).

%%获取召唤魔宠
-spec getSkillPet() -> list().
getSkillPet() ->
	PetList = playerState:getCallPet(),
	Fun = fun(#recCallPet{pet_type = ?CallPetTypeSkill}) ->
		true;
		(#recCallPet{}) ->
			false
	      end,
	lists:filter(Fun, PetList).

%%召唤宠物(玩家进程创建)
spawnPet(PetArg) ->
	monsterInterface:spawnPet(PetArg),
	ok.

%%收回宠物(玩家进程收回)
clearSpawnPet(Code) ->
	monsterInterface:clearSpawnPet(Code).

%%召唤怪物(地图进程创建)
spawnMonster(Arg) ->
	MapPid = playerState:getMapPid(),
	psMgr:sendMsg2PS(MapPid, spawnMonster, {Arg}),
	ok.

%%召唤载体(地图进程创建)
spawnCarrier(Arg) ->
	MapPid = playerState:getMapPid(),
	psMgr:sendMsg2PS(MapPid, spawnCarrier, {Arg}),
	ok.

%%收回怪物和载体(地图进程创建)
clearSpawn(Code) ->
	MapPid = playerState:getMapPid(),
	psMgr:sendMsg2PS(MapPid, clearSpawn, [Code]),
	ok.

%%清除所有宠物
-spec clearAllPets() -> ok.
clearAllPets() ->
	try
		PetList = playerState:getCallPet(),
		Fun = fun(#recCallPet{pet_code = Code}, Acc) ->
			monsterInterface:leaveBattle(Code),
			monsterInterface:clearSpawnPet(Code),
			[Code | Acc];
			(_, Acc) ->
				Acc
		      end,
		lists:foldl(Fun, [], PetList)
	catch
		_:_ ->
			?ERROR_OUT("roleID[~p] clearAllPets exception, MapPid:[~p] MapID:[~p]",
				[playerState:getRoleID(), playerState:getMapPid(), playerState:getMapID()])
	end,
	ok.

%%清除所有宠物减益buff
-spec clearAllPetBuff() -> ok.
clearAllPetBuff() ->
	PetList = playerState:getCallPet(),
	Fun = fun(#recCallPet{pet_code = Code}, Acc) ->
		monsterInterface:leaveBattle(Code),
		monsterInterface:delBuff(Code),
		[Code | Acc];
		(_, Acc) ->
			Acc
	      end,
	lists:foldl(Fun, [], PetList).

%%收回宠物进程返回信息
-spec clearSpawnPetAck(Code) -> ok when
	Code :: uint().
clearSpawnPetAck(Code) ->
	PetList = playerState:getCallPet(),
	case lists:keyfind(Code, #recCallPet.pet_code, PetList) of
		#recCallPet{} ->
			NewPetList = lists:keydelete(Code, #recCallPet.pet_code, PetList),
			playerState:setCallPet(NewPetList),
			%% 同步到队伍信息
%%			playerTeam2:syncInfoToTeam(?PlayerTeamTypeNormal, #recTeamMemberInfo.petInfo, NewPetList);
			ok;
		false ->
			skip
	end,
	ok.

petOnRevive(Code) ->
	case lists:member(Code, playerState:getCallPetCodeList()) of
		true ->
			{X, Y} = playerState:getPos(),
			PetEts = playerState:getMapPetEts(),
			[#recMapObject{maxHp = MaxHp} = Pet] = myEts:lookUpEts(PetEts, Code),
			monsterInterface:setPetAction(Code, ?CreatureActionStatusStand),
			monsterInterface:setPetHp(Code, MaxHp),
			monsterInterface:setPetPos(Code, X, Y),
			NewPet = Pet#recMapObject{
				x = X,
				y = Y,
				hp = MaxHp,
				actionStatus = ?CreatureActionStatusStand
			},
			syncPetObject(NewPet, false);
		_ ->
			skip
	end.

-spec initPetState() -> uint().
initPetState() ->
	IsInDouble = playerPetDouble:isInDoubleMountState(),
	case playerState:getPetMounts() of
		{_, ?PetOnMount} when IsInDouble =:= false ->
			?CreatrueActionStatusStealth;
		_ ->
			?CreatureActionStatusStand
	end.

-spec initPetAck(#recCallPet{}) -> ok.
initPetAck(#recCallPet{pet_code = Code} = CallPet) ->
	PetEts = playerState:getMapPetEts(),
	[#recMapObject{} = PetObject | _] = ets:lookup(PetEts, Code),

	%%加载宠物数据到当前召唤宠物列表中
	PetList = playerState:getCallPet(),
	NewPetList = [CallPet | PetList],
	playerState:setCallPet(NewPetList),
	?LOG_OUT("player roleID : ~p create pet code [~p] succ ", [playerState:getRoleID(), Code]),
	%% 同步到队伍信息
%%	playerTeam2:syncInfoToTeam(?PlayerTeamTypeNormal, #recTeamMemberInfo.petInfo, NewPetList),

	%%同步对象到客服端
	syncPetObject(PetObject, true),

	%%通知属性
	monsterInterface:sendBattlePropsList(Code).

-spec syncPetObject(#recMapObject{}, IsInit :: boolean()) -> ok.
syncPetObject(#recMapObject{
	other = [CasterCode | _],
	actionStatus = Status,
	moveSpeed = Speed,
	buffList = Buffs,
	pkMode = PkMode,
	level = Level,
	code = Code,
	camp = Camp,
	hp = CurHp,
	maxHp = MaxHp,
	name = Name,
	id = ID,
	x = X,
	y = Y
}, IsInit) ->
	case IsInit of
		true ->
			%%增加召唤呆滞buff
			case getCfg:getCfgPStack(cfg_pet, ID) of
				#petCfg{petBorn = List} when is_list(List) ->
					Fun =
						fun(BuffID) ->
							monsterInterface:addPetBuff(Code, BuffID, Level)
						end,
					lists:foreach(Fun, List);
				_ ->
					skip
			end,

			%%增加天生被动技能
			SkillList = getPetUnLockPassSkill(ID),
			Fun1 =
				fun(#recPetSkill{skill_id = SkillID, skill_level = Level1}) ->
					monsterInterface:addPetPassEffect(Code, SkillID, Level1)
				end,
			lists:foreach(Fun1, SkillList);
		_ ->
			skip
	end,

	PlayerEts = playerState:getMapPlayerEts(),

	%% 广播告诉主要周边，宠物属性发生变化
	case ets:lookup(PlayerEts, CasterCode) of
		[#recMapObject{x = CasterX, y = CasterY, groupID = GroupID}] ->
			HpPer = skill:getPercent(CurHp, MaxHp),
			LookInfoPet = #pk_LookInfoPet{
				name = Name,
				code = Code,
				id = ID,
				pkMode = PkMode,
				playerCode = CasterCode,
				x = X,
				y = Y,
				targetX = 0,
				targetY = 0,
				buffs = Buffs,
				camp = Camp,
				move_speed = Speed,
				status = Status,
				hp_per = HpPer
			},
			MapPid = playerState:getMapPid(),
			Msg = #pk_GS2U_PetList{pet_list = [LookInfoPet]},
			mapView:sendMsg2NearPlayerByPos(MapPid, PlayerEts, Msg, CasterX, CasterY, GroupID),
			ok;
		_ ->
			?ERROR_OUT("syncPetObject code:~p,~p,~p, castercode:~p,~p",
				[playerState:getRoleID(), Code, ID, CasterCode, misc:getStackTrace()]),
			skip
	end,
%%	NearPlayerList = mapView:getMutualObject(MapPid, PlayerEts, ?ObjTypePlayer, {X, Y}, GroupID),
%%	[mapView:sendNetMsgToNetPid(NetPid, Msg) || #recMapObject{netPid = NetPid} <- NearPlayerList],
	%% 告诉自己宠物当前血量
	playerMsg:sendNetMsg(#pk_GS2U_PlayerHp{code = Code, hp = erlang:trunc(CurHp)}),
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================

%%宠物是否可以出战
-spec canBattlePet(PetID :: uint()) -> {true, #recPetInfo{}} | uint().
canBattlePet(PetID) ->
	canBattlePet(PetID, playerState:getPets()).
canBattlePet(PetID, Pets) ->
	Pets = playerState:getPets(),
	case checkPetIsExist(PetID, Pets) of
		false ->
			?ErrorCode_PetNotExistError;
		Pet ->
			case checkPetIsExpress(Pet) of
				true ->
					?ErrorCode_PetMountHasExpress;
				_ ->
					case checkPetCD() of
						true ->
							case checkPetIsBattle(Pet) of
								false ->
									case checkPetIsSleep() of
										true ->
											?ErrorCode_PetMountHasSleep;
										_ ->
											{true, Pet}
									end;
								_ ->
									?ErrorCode_PetHasBattle
							end;
						_ ->
							?ErrorCode_PetHasNotCD
					end
			end
	end.

%%宠物技能洗练检查
-spec canCastPetSkill(PetID :: uint(), SkillIDs :: list()) -> uint() | list().
canCastPetSkill(PetID, SkillIDs) ->
	case checkPetSkillIsCanCast(PetID, SkillIDs) of
		true ->
			case checkPetSkillMaterial(PetID, SkillIDs) of
				MaterialList when is_list(MaterialList) ->
					MaterialList;
				MaterialError ->
					MaterialError
			end;
		Error ->
			Error
	end.

%%宠物装备是否可以强化
-spec canPetEquipStr(EquipID :: uint()) -> uint() | tuple().
canPetEquipStr(EquipID) ->
	EquipList = playerState:getPetEquip(),
	case checkPetEquipIsExist(EquipID, EquipList) of
		#recPetEquip{} = Equip ->
			case checkPetEquipStrMaterial(Equip) of
				Items when is_list(Items) ->
					{Equip, Items};
				Error1 ->
					Error1
			end;
		Error ->
			Error
	end.



%%宠物是否可以改名
-spec canPetReName(PetID :: uint(), Name :: string(), Pets :: list()) -> uint() | {#recPetInfo{}, list()}.
canPetReName(PetID, Name, Pets) ->
	case checkPetIsExist(PetID, Pets) of
		false ->
			?ErrorCode_PetNotExistError;
		Pet ->
			case checkPetNameIsSame(Name, Pet) of
				true ->
					case checkPetNameChar(Name) of
						true ->
							case checkPetNameLength(Name) of
								true ->
									{ok, Pet};
								Error ->
									Error
							end;
						_ ->
							?ErrorCode_PetNameIsNotValidate
					end;
				_ ->
					?ErrorCode_PetNameIsName
			end
	end.

%%宠物是否可以提升属性
-spec canPetAddAtta(PetID :: uint(), Pets :: list(), Times :: uint()) -> uint() | {#recPetInfo{}, boolean()}.
canPetAddAtta(PetID, Pets, Times) ->
	case checkPetIsExist(PetID, Pets) of
		false ->
			?ErrorCode_PetNotExistError;
		Pet ->
			case checkPetAddAttaMaterial(Times) of
				true ->
					{Pet, true};
				Err ->
					Err
			end
	end.

%%宠物保存属性
-spec canPetSaveAtta(PetID :: uint(), Pets :: list()) -> {#recPetInfo{}, list()} | uint().
canPetSaveAtta(PetID, Pets) ->
	case checkPetIsExist(PetID, Pets) of
		false ->
			?ErrorCode_PetNotExistError;
		Pet ->
			case playerState:getRmbCastPetAtta(PetID) of
				[] ->
					?ErrorCode_PetAttaNotAdd;
				PropList ->
					{Pet, PropList}
			end
	end.

%%检查宠物属性提升材料
-spec checkPetAddAttaMaterial(Times :: uint()) -> true | uint().
checkPetAddAttaMaterial(Times) ->
	[{CostId, CostNum}] = globalCfg:getPetAttaMaterial(),
	case checkMaterial([{CostId, CostNum * Times}]) of
		true ->
			true;
		_ ->
			?ErrorCode_PetAttaMaterialNotEnough
	end.

%%检查宠物名字是否未改变
-spec checkPetNameIsSame(Name :: string(), Pet :: #recPetInfo{}) -> boolean().
checkPetNameIsSame(Name, Pet) ->
	case Name =:= Pet#recPetInfo.pet_name of
		true ->
			false;
		_ ->
			true
	end.

%%检查宠物名字是否超过长度
-spec checkPetNameLength(Name :: string()) -> true | uint().
checkPetNameLength(Name) ->
	Length = str:get_utf8_char_count(Name),
	if
		Length < 2 ->
			?ErrorCode_PetNameLenNotEnough;
		Length > 12 ->
			?ErrorCode_PetNameLenOutMax;
		true ->
			true
	end.

%%检查是否有不合法字符
-spec checkPetNameChar(Name :: string()) -> boolean().
checkPetNameChar([]) ->
	true;
checkPetNameChar([H | T]) ->
	case H < 33 of
		true ->
			false;
		_ ->
			checkPetNameChar(T)
	end.

%%检查宠物装备是否存在
-spec checkPetEquipIsExist(EquipID :: uint(), EquipList :: list()) -> uint() | #recPetEquip{}.
checkPetEquipIsExist(EquipID, EquipList) ->
	case lists:keyfind(EquipID, #recPetEquip.equip_id, EquipList) of
		false ->
			?ErrorCode_PetEquipStrNotExist;
		#recPetEquip{} = Equip ->
			Equip
	end.

%%检查宠物装备升级材料
-spec checkPetEquipStrMaterial(Equip :: #recPetEquip{}) -> uint() | list().
checkPetEquipStrMaterial(
	#recPetEquip{
		equip_lv = Lv
	}) ->
	case getCfg:getCfgByKey(cfg_petEquipmentLevel, Lv + 1) of
		#petEquipmentLevelCfg{
			item = Items
		} ->
			checkPetEquipStrMaterial(Items, Items);
		_ ->
			?ErrorCode_PetEquipStrMaxLv
	end.
checkPetEquipStrMaterial(Items, []) ->
	Items;
checkPetEquipStrMaterial(Items, [{ID, Num} | ItemList]) ->
	case playerPackage:getItemNumByID(ID) >= Num of
		true ->
			checkPetEquipStrMaterial(Items, ItemList);
		_ ->
			?ErrorCode_PetEquipStrMaterialNotEnough
	end.

%%检查宠物是否存在
-spec checkPetIsExist(PetID :: uint(), Pets :: list()) -> false | #recPetInfo{}.
checkPetIsExist(PetID, Pets) ->
	case lists:keyfind(PetID, #recPetInfo.pet_id, Pets) of
		false ->
			false;
		Pet ->
			Pet
	end.

%%检查宠物是否出战
-spec checkPetIsBattle(Pet :: #recPetInfo{}) -> boolean().
checkPetIsBattle(#recPetInfo{pet_status = Status}) when Status =< ?PetState_Assist ->
	false;
checkPetIsBattle(_) ->
	true.

%%检查宠物是否过期
checkPetIsExpress(#recPetInfo{pet_time = 0}) ->
	false;
checkPetIsExpress(#recPetInfo{pet_time = Time}) ->
	Now = time2:getLocalDateTimeSec(),
	case Now >= Time of
		true ->
			true;
		_ ->
			false
	end.

%%检查出战宠物是否休眠
-spec checkPetIsSleep() -> boolean().
checkPetIsSleep() ->
	checkPetIsSleep(getPetBattleCode()).
checkPetIsSleep(0) ->
	false;
checkPetIsSleep(Code) ->
	case getPetMountStatus(Code) of
		?CreatureActionStatusDead ->
			true;
		_ ->
			false
	end.

%%检查宠物CD
-spec checkPetCD() -> boolean().
checkPetCD() ->
	PetCD = playerState:getPetCD(),
	NowTime = time:getUTCNowMSDiff2010(),
	case PetCD + ?PetBattleCDTime > NowTime of
		true ->
			false;
		_ ->
			true
	end.

%%检查宠物升星材料
checkUpStarMaterial(Lv, GroupID) ->
	case getCfg:getCfgPStack(cfg_petreborn, GroupID, Lv) of
		#petrebornCfg{item_star = L} ->
			case checkMaterial(L) of
				true ->
					L;
				_ ->
					?ErrorCode_PetUpStarMaterialNotEnough
			end;
		_ ->
			?ErrorCode_PetUpStarMaxLevel
	end.

checkMaterial([]) ->
	true;
checkMaterial([{ItemID, Num} | L]) ->
	case playerPackage:getItemNumByID(ItemID) >= Num of
		true ->
			checkMaterial(L);
		_ ->
			false
	end.

%%检查宠物升星
-spec checkPetIsUpStar(PetID :: uint(), Pets :: list()) -> uint() | {list(), list(), #recPetInfo{}}.
checkPetIsUpStar(PetID, Pets) ->
	case checkPetIsExist(PetID, Pets) of
		#recPetInfo{pet_star = Star} = Pet ->
			case getCfg:getCfgPStack(cfg_pet, PetID) of
				#petCfg{time = 0, enhCost = EnhCostGroupID, skillOpen = Opens} ->
					case checkUpStarMaterial(Star + 1, EnhCostGroupID) of
						List when is_list(List) ->
							case is_list(Opens) of
								true ->
									{List, Opens, Pet};
								_ ->
									{List, [], Pet}
							end;
						Error ->
							Error
					end;
				_ ->
					?ErrorCode_PetMountExpressNotUpstar
			end;
		false ->
			?ErrorCode_PetNotExistError
	end.

%%检查宠物转生材料
checkRawMaterial(RawNextLv, ItemList) ->
	CostLen = length(ItemList),
	case RawNextLv =< CostLen of
		true ->
			Material = lists:nth(RawNextLv, ItemList),
			checkRawMaterial1(Material);
		_ ->
			?ErrorCode_PetRawMaxLevel
	end.

checkRawMaterial1({ID1, ID2, Num}) ->
	case checkMaterial([{ID1, Num}]) of
		true ->
			[{ID1, Num}];
		_ ->
			case checkMaterial([{ID2, Num}]) of
				true ->
					[{ID2, Num}];
				_ ->
					?ErrorCode_PetRawMaterialNotEnough
			end
	end;
checkRawMaterial1({ID, Num}) ->
	case checkMaterial([{ID, Num}]) of
		true ->
			[{ID, Num}];
		_ ->
			?ErrorCode_PetRawMaterialNotEnough
	end;
checkRawMaterial1(_) ->
	?ErrorCode_PetRawMaterialNotEnough.



%%检查宠物转生
-spec checkPetIsRaw(PetID :: uint(), Pets :: list()) -> uint() | {list(), list(), #recPetInfo{}}.
checkPetIsRaw(PetID, Pets) ->
	case checkPetIsExist(PetID, Pets) of
		#recPetInfo{pet_raw = Raw} = Pet ->
			case getCfg:getCfgPStack(cfg_pet, PetID) of
				#petCfg{time = 0, avatar = EnhCost} ->
					case checkRawMaterial(Raw + 1, EnhCost) of
						List when is_list(List) ->
							{List, Pet};
						Error ->
							Error
					end;
				_ ->
					?ErrorCode_PetMountExpressNotRaw
			end;
		false ->
			?ErrorCode_PetNotExistError
	end.

%%检查宠物技能是否解锁
-spec checkPetSkillIsCanCast(PetID :: uint(), SkillIDs :: list()) -> true | uint().
checkPetSkillIsCanCast(_PetID, []) ->
	true;
checkPetSkillIsCanCast(PetID, [SkillID | SkillIDs]) ->
	CommonSkillList = getPetSkillByType(PetID, ?PetSkillTypeCommon),
	case lists:keyfind(SkillID, #recPetSkill.skill_id, CommonSkillList) of
		#recPetSkill{skill_is_unlock = UnLock} when UnLock =:= ?PetSkillLock ->
			checkPetSkillIsCanCast(PetID, SkillIDs);
		#recPetSkill{} ->
			?ErrorCode_PetSkillUnLock;
		false ->
			?ErrorCode_PetSkillTypeError
	end.

%%检查宠物技能需要材料
-spec checkPetSkillMaterial(PetID :: uint(), SkillIDs :: list()) -> list() | uint().
checkPetSkillMaterial(PetID, SkillIDs) ->
	NeedMaterial = getCastCostMaterial(getPetSkillLockNum(PetID, SkillIDs)),
	case playerPackage:getItemNumByID(?CostMaterialID) >= NeedMaterial of
		true ->
			[{?CostMaterialID, NeedMaterial}];
		_ ->
			?ErrorCode_PetSkillCastMaterialNotEnough
	end.

%%生成宠物内置技能
-spec makeInternalPetSkill(PetID :: uint()) -> ok.
makeInternalPetSkill(PetID) ->
	#petCfg{
		talentSkill = TalentSkill,
		randomSkill = RandomSkill
	} = getCfg:getCfgPStack(cfg_pet, PetID),
	getPetTalentSkill(PetID, TalentSkill),
	getPetRandomSkill(PetID, RandomSkill).

%%生成宠物额外技能
-spec makeAdditionalPetSkill(PetID :: uint()) -> ok.
makeAdditionalPetSkill(PetID) ->
	CommonSkillList = getPetSkillByType(PetID, ?PetSkillTypeCommon),
	makeAdditionalPetSkill(PetID, CommonSkillList, length(CommonSkillList) + 1).
makeAdditionalPetSkill(_PetID, _CommonSkillList, Len) when Len > ?CommonSkillMaxIndex ->
	ok;
makeAdditionalPetSkill(PetID, CommonSkillList, Len) ->
	SkillList = filterRepeatPetSkill(CommonSkillList, getCfg:getAllCfg(cfg_petSkill)),
	getPetAdditionalSkill(PetID, SkillList, Len + 1).

%%过滤重复的宠物技能
-spec filterRepeatPetSkill(CommonSkillList :: [#recPetSkill{}, ...], CfgSkillList :: [#petSkillCfg{}, ...]) -> [#petSkillCfg{}, ...].
filterRepeatPetSkill([], CfgSkillList) ->
	CfgSkillList;
filterRepeatPetSkill([#recPetSkill{skill_id = ID} | CommonSkillList], CfgSkillList) ->
	case lists:keyfind(ID, #petSkillCfg.iD, CfgSkillList) of
		#petSkillCfg{} ->
			NewList = lists:keydelete(ID, #petSkillCfg.iD, CfgSkillList),
			filterRepeatPetSkill(CommonSkillList, NewList);
		_ ->
			filterRepeatPetSkill(CommonSkillList, CfgSkillList)
	end.

-spec filterRepeatPetSkill1(SkillIDs :: list(), CommonSkillList :: [#recPetSkill{}, ...]) -> [#recPetSkill{}, ...].
filterRepeatPetSkill1([], CommonSkillList) ->
	CommonSkillList;
filterRepeatPetSkill1([ID | SkillIDs], CommonSkillList) ->
	case lists:keyfind(ID, #recPetSkill.skill_id, CommonSkillList) of
		#recPetSkill{} ->
			NewList = lists:keydelete(ID, #recPetSkill.skill_id, CommonSkillList),
			filterRepeatPetSkill1(SkillIDs, NewList);
		_ ->
			filterRepeatPetSkill1(SkillIDs, CommonSkillList)
	end.

-spec delItem(ItemList :: list(), Reason :: uint()) -> ok.
delItem([], _) ->
	ok;
delItem([{ID, Num} | List], Reason) ->
	case erlang:is_integer(ID) andalso ID > 0 andalso erlang:is_integer(Num) andalso Num > 0 of
		true ->
			Plog = #recPLogTSItem{
				old = Num,
				new = 0,
				change = -Num,
				target = ?PLogTS_Pet,
				source = ?PLogTS_PlayerSelf,
				gold = 0,
				goldtype = 0,
				changReason = Reason,
				reasonParam = 0
			},
			playerPackage:delGoodsByID(?Item_Location_Bag, ID, Num, Plog);
		_ ->
			skip
	end,
	delItem(List, Reason).

%%增加出战中宠物技能
-spec addPetBattleSkill(PetID :: uint(), SkillID :: uint(), Level :: uint()) -> ok.
addPetBattleSkill(PetID, SkillID, Level) ->
	addPetBattleSkill(getPetBattle(), PetID, SkillID, Level).
addPetBattleSkill(#recPetInfo{pet_status = Sta, pet_id = ID}, PetID, SkillID, Level) when Sta =:= ?PetState_Battle_Show andalso ID =:= PetID ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Type of
		?PassivitySkill ->
			monsterInterface:addPetPassEffect(getPetBattleCode(), SkillID, Level);
		_ ->
			monsterInterface:addPetActiveSkill(getPetBattleCode(), SkillID, Level)
	end;
addPetBattleSkill(_, _, _, _) ->
	ok.

%%移除出战中宠物技能
-spec delPetBattleSkill(PetID :: uint(), SkillID :: uint()) -> ok.
delPetBattleSkill(PetID, SkillID) ->
	delPetBattleSkill(getPetBattle(), PetID, SkillID).
delPetBattleSkill(#recPetInfo{pet_status = Sta, pet_id = ID}, PetID, SkillID) when Sta =:= ?PetState_Battle_Show andalso ID =:= PetID ->
	#skillCfg{skillType = Type} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case Type of
		?PassivitySkill ->
			monsterInterface:delPetPassEffect(getPetBattleCode(), SkillID);
		_ ->
			monsterInterface:delPetActiveSkill(getPetBattleCode(), SkillID)
	end;
delPetBattleSkill(_, _, _) ->
	ok.
%%获取减法属性，将增益属性扣掉
-spec getDeductProps(Props :: list()) -> list().
getDeductProps(Props) ->
	getDeductProps(Props, []).
getDeductProps([], Acc) ->
	Acc;
getDeductProps([{Key, Value} | Props], Acc) ->
	getDeductProps(Props, [{Key, -Value} | Acc]).

%%获取人民币宠物code
-spec getPetBattleCode() -> uint().
getPetBattleCode() ->
	getPetBattleCode(playerState:getCallPet()).
getPetBattleCode([]) ->
	0;
getPetBattleCode([#recCallPet{pet_code = Code, pet_type = Type} | _]) when Type =:= ?CallPetTypeRMB ->
	Code;
getPetBattleCode([_ | CallList]) ->
	getPetBattleCode(CallList).

%%获取出战宠物
-spec getPetBattle() -> false | #recPetInfo{}.
getPetBattle() ->
	Pets = playerState:getPets(),
	getPetBattle(Pets).

getPetBattle([]) ->
	false;
getPetBattle([#recPetInfo{pet_status = Status} = Pet | _]) when Status >= ?PetState_Battle_Show ->
%%	checkPetBattleError(Pets),
	Pet;
getPetBattle([_ | Pets]) ->
	getPetBattle(Pets).

%%%%校验宠物状态错误
%%checkPetBattleError(_) ->
%%	ok.
%%checkPetBattleError([]) ->
%%	ok;
%%checkPetBattleError([#recPetInfo{pet_status = Status} = Pet | Pets]) when Status =:= ?PetBattleState1 ->
%%	?ERROR_OUT("player name [~s] pet [~p] has battle! pet status [~p] ", [playerState:getName(), Pet#recPetInfo.pet_id, Status]),
%%	callBackPet( Pet#recPetInfo{pet_status = ?PetNoBattleStateAssist}),
%%	checkPetBattleError(Pets);
%%checkPetBattleError([#recPetInfo{pet_status = Status} = Pet | Pets]) when Status =:= ?PetBattleState2 ->
%%	?ERROR_OUT("player name [~s] pet [~p] has battle! pet status [~p] ", [playerState:getName(), Pet#recPetInfo.pet_id, Status]),
%%	NewPet = Pet#recPetInfo{pet_status = ?PetNoBattleStateAssist},
%%	savePetInfoToMem(NewPet),
%%	savePetInfoToDB(NewPet),
%%	sendPetStatusToClient(NewPet#recPetInfo.pet_id, ?PetNoBattleStateAssist),
%%	checkPetBattleError(Pets);
%%checkPetBattleError([_ | Pets]) ->
%%	checkPetBattleError(Pets).

%%获取出战宠物
-spec getPetBattleID() -> uint().
getPetBattleID() ->
	getPetBattleID(getPetBattle()).
getPetBattleID(false) ->
	0;
getPetBattleID(#recPetInfo{pet_id = ID}) ->
	ID.

%%获取出战宠物属性
-spec getPetBattleProp() -> [].
getPetBattleProp() ->
	getPetBattleProp(getPetBattle()).
getPetBattleProp(false) ->
	[];
getPetBattleProp(#recPetInfo{pet_status = ?PetState_Battle_Show}) ->
	case getPetBattleCode() of
		0 ->
			?ERROR_OUT("player[~ts] get pet prop failed", [playerState:getName()]),
			[];
		Code ->
			monsterInterface:getPetBattleProps(Code)
	end;
getPetBattleProp(#recPetInfo{
	pet_id = PetID,
	pet_star = Star,
	pet_raw = Raw,
	pet_status = Status
}) ->
	Level = playerState:getLevel(),
	makePetProp(PetID, Level, Star, Raw, Status).

%%获取助战宠物个数
%%-spec getPetBattleAssistNum() -> uint().
%%getPetBattleAssistNum() ->
%%	getPetBattleAssistNum(playerState:getPets(), 0).
%%getPetBattleAssistNum([], Num) ->
%%	Num;
%%getPetBattleAssistNum([#recPetInfo{pet_status = Status} | Pets], Num) when Status =:= ?PetNoBattleStateAssist ->
%%	getPetBattleAssistNum(Pets, Num + 1);
%%getPetBattleAssistNum([_ | Pets], Num) ->
%%	getPetBattleAssistNum(Pets, Num).

%%提供远程玩家查看出战宠物信息
-spec getPetBattleRPInfo() -> #pk_LookPetInfo{} | [].
getPetBattleRPInfo() ->
	case playerBase:getMainMenuAct(?ActivatePetFun) of
		true ->
			playerState:addMainMenuSta(?PlayerMainMenuPet),
			getPetBattleRPInfo(getPetBattle());
		_ ->
			#pk_LookPetInfo{
				petID = 0,
				petStar = 0,
				petname = "",
				petForce = 0,
				petColNum = 0,
				petRaw = 0,
				petSkill = [],
				equalInfo = [],
				petPropValues = []
			}
	end.
getPetBattleRPInfo(false) ->
	#pk_LookPetInfo{
		petID = 0,
		petStar = 0,
		petname = "",
		petForce = 0,
		petColNum = 0,
		petRaw = 0,
		petSkill = [],
		equalInfo = [],
		petPropValues = []
	};
getPetBattleRPInfo(#recPetInfo{} = Pet) ->
	BPL = getPetBattleProp(),
	EquipFun = fun(#recPetEquip{equip_id = Id, equip_lv = Lev}) ->
		#pk_LookPetEquipInfo{
			equipID = Id,
			equipLv = Lev
		}
	           end,
	PropFun = fun(Key, Acc) ->
		case lists:keyfind(Key, #battleProp.propIndex, BPL) of
			false ->
				Acc;
			#battleProp{propIndex = _Index, totalValue = TotalValue} ->
				[TotalValue | Acc]
		end
	          end,
	PetSkill = playerState:getPetSkills(Pet#recPetInfo.pet_id),
	PetFun = fun(#recPetSkill{
		skill_id = SkillID,
		skill_type = Type,
		skill_level = Level,
		skill_is_unlock = Islock
	}, Acc) ->
		case Islock =:= 1 of
			true ->
				[
					#pk_LookPetSkill{
						petSkillId = SkillID,
						petSkillLv = Level,
						petSkillType = Type
					} | Acc
				];
			_ ->
				Acc
		end
	         end,
	PetSkillList = lists:foldr(PetFun, [], PetSkill),
	case playerBase:getMainMenuAct(?ActivatePetEquip) of
		true ->
			PetEquip = lists:map(EquipFun, playerState:getPetEquip());
		_ ->
			PetEquip = []
	end,
	PetProp = lists:foldr(PropFun, [], ?RPBattlePropPetIDS),
	#pk_LookPetInfo{
		petID = Pet#recPetInfo.pet_id,
		petStar = Pet#recPetInfo.pet_star,
		petname = Pet#recPetInfo.pet_name,
		petForce = playerPropSync:getProp(?PriProp_PetForce),
		petColNum = length(playerState:getPets()),
		petRaw = Pet#recPetInfo.pet_raw,
		petSkill = PetSkillList,
		equalInfo = PetEquip,
		petPropValues = PetProp
	}.

%%获取宠物的被动技能
-spec getPetUnLockPassSkill(PetID :: uint()) -> list().
getPetUnLockPassSkill(PetID) ->
	SkillList = playerState:getPetSkills(PetID),
	Fun = fun(#recPetSkill{skill_id = SkillID, skill_is_unlock = UnLock} = Skill, Acc) ->
		#skillCfg{
			skillType = Type
		} = getCfg:getCfgPStack(cfg_skill, SkillID),
		case Type =:= ?PassivitySkill andalso UnLock =:= ?PetSkillLock of
			true ->
				[Skill | Acc];
			_ ->
				Acc
		end
	      end,
	lists:foldl(Fun, [], SkillList).

%%获取宠物的主动技能
-spec getPetUnLockActiveSkill(PetID :: uint()) -> list().
getPetUnLockActiveSkill(PetID) ->
	SkillList = playerState:getPetSkills(PetID),
	Fun = fun(#recPetSkill{skill_id = SkillID, skill_is_unlock = UnLock} = Skill, Acc) ->
		#skillCfg{
			skillType = Type
		} = getCfg:getCfgPStack(cfg_skill, SkillID),
		IsActive = lists:member(Type, ?ActiveSkillList),
		case IsActive =:= true andalso UnLock =:= ?PetSkillLock of
			true ->
				[Skill | Acc];
			_ ->
				Acc
		end
	      end,
	lists:foldl(Fun, [], SkillList).

%%获取宠物天赋技能
-spec getPetTalentSkill(PetID :: uint(), SkillID :: uint()) -> ok.
getPetTalentSkill(_, 0) ->
	ok;
getPetTalentSkill(PetID, SkillID) ->
	PetSkills = playerState:getPetSkills(PetID),
	Skill = #recPetSkill{
		skill_index = 1,
		skill_id = SkillID,
		skill_cd = 0,
		skill_type = ?PetSkillTypeTalent,
		skill_level = 1,
		skill_is_unlock = ?PetSkillLock
	},
	playerState:setPetSkills(PetID, [Skill | PetSkills]).

getPetTalentSkill(0) ->
	[];
getPetTalentSkill(SkillID) ->
	Skill = #recPetSkill{
		skill_index = 1,
		skill_id = SkillID,
		skill_cd = 0,
		skill_type = ?PetSkillTypeTalent,
		skill_level = 1,
		skill_is_unlock = ?PetSkillLock
	},
	[Skill].

getPetRandomSkill(undefined) ->
	[];
getPetRandomSkill(L) when is_list(L) ->
	Fun = fun(SkillID, {Index, Acc}) ->
		Skill = #recPetSkill{
			skill_index = Index,
			skill_id = SkillID,
			skill_cd = 0,
			skill_type = ?PetSkillTypeCommon,
			skill_level = getPetSkillLevelByWeight(),
			skill_is_unlock = ?PetSkillLock
		},
		{Index + 1, [Skill | Acc]}
	      end,
	{_, SL} = lists:foldl(Fun, {2, []}, L),
	SL;
getPetRandomSkill(_) ->
	[].

%%获取宠物随机技能
-spec getPetRandomSkill(PetID :: uint(), SkillIDs :: list() | undefined) -> ok.
getPetRandomSkill(_, undefined) ->
	ok;
getPetRandomSkill(PetID, SkillIDs) ->
	getPetRandomSkill(PetID, SkillIDs, 2).
getPetRandomSkill(_, [], _) ->
	ok;
getPetRandomSkill(PetID, [SkillID | SkillIDs], Index) ->
	PetSkills = playerState:getPetSkills(PetID),
	Skill = #recPetSkill{
		skill_index = Index,
		skill_id = SkillID,
		skill_cd = 0,
		skill_type = ?PetSkillTypeCommon,
		skill_level = getPetSkillLevelByWeight(),
		skill_is_unlock = ?PetSkillUnLock
	},
	playerState:setPetSkills(PetID, [Skill | PetSkills]),
	getPetRandomSkill(PetID, SkillIDs, Index + 1).

%%获取宠物额外技能
-spec getPetAdditionalSkill(PetID :: uint(), SkillList :: [#petSkillCfg{}], Index :: uint()) -> ok.
getPetAdditionalSkill(_, _, ?CommonSkillMaxIndex + 1) ->
	ok;
getPetAdditionalSkill(PetID, SkillList, Index) ->
	RandomNum = random:uniform(length(SkillList)),
	CfgSkill = lists:nth(RandomNum, SkillList),
	PetSkills = playerState:getPetSkills(PetID),
	Skill = #recPetSkill{
		skill_index = Index,
		skill_cd = 0,
		skill_id = CfgSkill#petSkillCfg.iD,
		skill_type = ?PetSkillTypeCommon,
		skill_level = getPetSkillLevelByWeight(),
		skill_is_unlock = ?PetSkillUnLock
	},
	playerState:setPetSkills(PetID, [Skill | PetSkills]),
	NewSkillList = lists:keydelete(
		CfgSkill#petSkillCfg.iD,
		#petSkillCfg.iD,
		SkillList
	),
	getPetAdditionalSkill(PetID, NewSkillList, Index + 1).

%%根据类型获取宠物技能列表
-spec getPetSkillByType(PetID :: uint(), Type :: uint()) -> list().
getPetSkillByType(PetID, Type) ->
	PetSkills = playerState:getPetSkills(PetID),
	getPetSkillByType(Type, PetSkills, []).
getPetSkillByType(_, [], SkillList) ->
	SkillList;
getPetSkillByType(Type, [#recPetSkill{skill_type = Type1} = Skill | PetSkills], SkillList) when Type1 =:= Type ->
	getPetSkillByType(Type, PetSkills, [Skill | SkillList]);
getPetSkillByType(Type, [_ | PetSkills], SkillList) ->
	getPetSkillByType(Type, PetSkills, SkillList).

%%获取宠物技能锁定数量
-spec getPetSkillLockNum(PetID :: uint(), SkillIDs :: list()) -> uint().
getPetSkillLockNum(PetID, SkillIDs) ->
	SkillList = getPetSkillUnlockCommon(getPetSkillByType(PetID, ?PetSkillTypeCommon)),
	length(SkillList) - length(SkillIDs).

%%获取宠物未锁定的通用技能
-spec getPetSkillUnlockCommon(CommonSkillList :: list()) -> list().
getPetSkillUnlockCommon(CommonSkillList) ->
	getPetSkillUnlockCommon(CommonSkillList, []).
getPetSkillUnlockCommon([], SkillList) ->
	SkillList;
getPetSkillUnlockCommon([#recPetSkill{skill_is_unlock = ?PetSkillLock} = Skill | SkillList], List) ->
	getPetSkillUnlockCommon(SkillList, [Skill | List]);
getPetSkillUnlockCommon([_ | SkillList], List) ->
	getPetSkillUnlockCommon(SkillList, List).

%%获取宠物通用技能等级
-spec getPetSkillLevelByWeight() -> uint().
getPetSkillLevelByWeight() ->
	List = [
		{20, 1},
		{40, 2},
		{20, 3},
		{10, 4},
		{10, 5}
	],
	misc:calcOddsByWeightList(List).


%%获取洗练消耗的材料根据锁定技能数量
-spec getCastCostMaterial(UnLockNum :: uint()) -> uint().
getCastCostMaterial(?UnLockNum0) ->
	1;
getCastCostMaterial(?UnLockNum1) ->
	2;
getCastCostMaterial(?UnLockNum2) ->
	4;
getCastCostMaterial(?UnLockNum3) ->
	8.

-spec getAttaRandRange(K :: uint(), V :: uint(), M :: uint()) -> uint().
getAttaRandRange(K, V, M) ->
	#pet_strongerCfg{
		point_1 = Point_1,
		point_2 = Point_2,
		point_3 = Point_3,
		point_4 = Point_4,
		point_5 = Point_5,
		value_1 = [Min1, Max1],
		value_2 = [Min2, Max2],
		value_3 = [Min3, Max3],
		value_4 = [Min4, Max4],
		value_5 = [Min5, Max5]
	} = getCfg:getCfgPStack(cfg_pet_stronger, K),
	if
		V >= Point_1 * M andalso V =< Point_2 * M ->
			misc:rand(Min1, Max1, 3);
		V > Point_2 * M andalso V =< Point_3 * M ->
			misc:rand(Min2, Max2, 3);
		V > Point_3 * M andalso V =< Point_4 * M ->
			misc:rand(Min3, Max3, 3);
		V > Point_4 * M andalso V =< Point_5 * M ->
			misc:rand(Min4, Max4, 3);
		V > Point_5 * M andalso V =< M ->
			misc:rand(Min5, Max5, 3);
		true ->
			?ERROR_OUT("current atta value error [~p]", [V]),
			0
	end.

getAttaRandList(AttaList, MaxAttaList, Num) ->
	getAttaRandList(AttaList, MaxAttaList, Num, []).

getAttaRandList(_, _, 0, L) ->
	L;
getAttaRandList(AL, MAL, N, L) ->
	R = random:uniform(length(MAL)),
	E = {K, M} = lists:nth(R, MAL),
	case lists:keyfind(K, 1, AL) of
		false ->
			V = 0;
		{K, Value} ->
			V = Value
	end,
	V1 = getAttaRandRange(K, V, M),
	getAttaRandList(AL, lists:delete(E, MAL), N - 1, [{K, V1} | L]).

%%获取宠物提升属性规则结果列表(多次提升,按照当前值来取区间)
-spec getPetAddAttaRuleRes(AttaList :: list(), MaxAttaList :: list(), Times :: uint()) -> list().
getPetAddAttaRuleRes(AttaList, MaxAttaList, Times) ->
	getPetAddAttaRuleRes(AttaList, MaxAttaList, Times, []).

getPetAddAttaRuleRes(_, _, 0, L) ->
	L;
getPetAddAttaRuleRes(AL, MAL, N, L) ->
	R = globalCfg:getPetAttaNum(),
	RL = getAttaRandList(AL, MAL, R),
	Fun = fun({K, V} = E, Acc) ->
		case lists:keyfind(K, 1, Acc) of
			false ->
				[E | Acc];
			{K, V1} ->
				lists:keyreplace(K, 1, Acc, {K, V + V1})
		end
	      end,
	NL = lists:foldl(Fun, L, RL),
	getPetAddAttaRuleRes(AL, MAL, N - 1, NL).


%%宠物技能洗练改版
calcSkillCastRule(_, [], _, CastList) ->
	CastList;
calcSkillCastRule(PetQual, [ID | CastIDList], ExistSkillList, CastList) ->
	SkillPool = getSkillCastPool(getSkillCastQual(PetQual)),
	Fun = fun(#petSkillCfg{weight = Weight, iD = SkillID} = Cfg, Acc) ->
		case checkIsGroupSkill1(Cfg, ExistSkillList) of
			false ->
				case checkIsGroupSkill2(Cfg, CastList) of
					false ->
						[{Weight, SkillID} | Acc];
					true ->
						Acc
				end;
			true ->
				Acc
		end
	      end,
	WeightPool = lists:foldl(Fun, [], SkillPool),
	Lv = getPetSkillLevelByWeight(),
	SkillID = misc:calcOddsByWeightList(WeightPool),
	Skill = #recPetSkillCast{
		skill_old_id = ID,
		skill_new_id = SkillID,
		skill_level = Lv
	},
	calcSkillCastRule(PetQual, CastIDList, ExistSkillList, [Skill | CastList]).

%%获取技能洗练品质
getSkillCastQual(Qual) ->
	#petSkillRollCfg{
		petSkillroll = Rl
	} = getCfg:getCfgPStack(cfg_petSkillRoll, Qual),
	misc:calcOddsByAfterWeightList(Rl).

%%获取洗练技能池
-spec getSkillCastPool(SkillQual :: uint()) -> list().
getSkillCastPool(SkillQual) ->
	getSkillCastPool(SkillQual, getCfg:getAllCfg(cfg_petSkill), []).
getSkillCastPool(_SkillQual, [], L) ->
	L;
getSkillCastPool(SkillQual, [#petSkillCfg{quality = Qual} = Cfg | CfgList], L) when Qual =:= SkillQual ->
	getSkillCastPool(SkillQual, CfgList, [Cfg | L]);
getSkillCastPool(SkillQual, [_ | CfgList], L) ->
	getSkillCastPool(SkillQual, CfgList, L).

%%检查是否是同组技能
checkIsGroupSkill1(_Cfg, []) ->
	false;
checkIsGroupSkill1(#petSkillCfg{petSkillType = Group1} = Cfg, [#recPetSkill{skill_id = ID} | L]) ->
	#petSkillCfg{petSkillType = Group2} = getCfg:getCfgPStack(cfg_petSkill, ID),
	case Group2 =:= Group1 of
		false ->
			checkIsGroupSkill1(Cfg, L);
		_ ->
			true
	end.

checkIsGroupSkill2(_Cfg, []) ->
	false;
checkIsGroupSkill2(#petSkillCfg{petSkillType = Group1} = Cfg, [#recPetSkillCast{skill_new_id = ID} | L]) ->
	#petSkillCfg{petSkillType = Group2} = getCfg:getCfgPStack(cfg_petSkill, ID),
	case Group2 =:= Group1 of
		false ->
			checkIsGroupSkill2(Cfg, L);
		_ ->
			true
	end.


%%宠物保存

%%保存宠物装备到内存中
-spec savePetEquipToMem(Equip :: #recPetEquip{}) -> ok.
savePetEquipToMem(Equip) ->
	EquipList = playerState:getPetEquip(),
	NewEquipList = lists:keyreplace(
		Equip#recPetEquip.equip_pos,
		#recPetEquip.equip_pos,
		EquipList,
		Equip
	),
	playerState:setPetEquip(NewEquipList).

%%%%保存宠物到内存中
%%-spec savePetInfoToMem(Pet :: #recPetInfo{}) -> ok.
%%savePetInfoToMem(Pet) ->
%%	Pets = playerState:getPets(),
%%	NewPets = lists:keystore(
%%		Pet#recPetInfo.pet_id,
%%		#recPetInfo.pet_id,
%%		Pets,
%%		Pet
%%	),
%%	playerState:setPets(NewPets).

%%保存宠物到数据库中
-spec savePetInfoToDB(Pet :: #recPetInfo{}) -> ok.
savePetInfoToDB(Pet) ->
%%	savePetInfoToMem(NewPetInfo),
	Pets = playerState:getPets(),
	NewPets = lists:keystore(
		Pet#recPetInfo.pet_id,
		#recPetInfo.pet_id,
		Pets,
		Pet
	),
	playerState:setPets(NewPets),
	playerSave:savePet(Pet).

%%保存宠物装备
-spec savePetEquipToDB(Equip :: #recPetEquip{}) -> ok.
savePetEquipToDB(Equip) ->
	playerSave:savePetEquip(Equip).

%%保存宠物技能
-spec savePetSkillToDB(PetID :: uint(), PetSkill :: #recPetSkill{}) -> ok.
savePetSkillToDB(PetID, PetSkill) ->
	playerSave:savePetSkill(PetID, PetSkill).

%%保存宠物技能CD
-spec savePetSkillCDToDB(PetID :: uint(), Code :: uint()) -> ok.
savePetSkillCDToDB(PetID, Code) ->
	SkillList = playerState:getPetSkills(PetID),
	SkillCDList = monsterInterface:getPetSkillCDList(Code),
	Fun = fun(#recPetSkill{
		skill_id = ID
	} = Skill) ->
		case lists:keyfind(ID, 1, SkillCDList) of
			{ID, Time} ->
				NewSkill = Skill#recPetSkill{
					skill_cd = Time
				},
				NewSkillList = lists:keyreplace(
					ID,
					#recPetSkill.skill_id,
					SkillList,
					NewSkill
				),
				playerState:setPetSkills(PetID, NewSkillList),
				savePetSkillToDB(PetID, NewSkill);
			_ ->
				skip
		end
	      end,
	lists:foreach(Fun, SkillList).

%%构造宠物基本信息
-spec makePetBaseInfo(Pet :: #recPetInfo{}) -> #pk_PetBaseInfo{}.
makePetBaseInfo(#recPetInfo{
	pet_time = PetTime,
	pet_name = PetName,
	pet_id = PetID,
	pet_star = PetStar,
	pet_status = PetStatus,
	pet_raw = PetRaw,
	pet_attas = PetAttas,
	pet_force = PetForce
}) ->
	Fun = fun(#recPetSkill{
		skill_cd = CD,
		skill_id = SkillID,
		skill_index = Index,
		skill_level = Level,
		skill_type = Type,
		skill_is_unlock = Unlock
	}) ->
		Time = time:getUTCNowMSDiff2010(),
		case Time >= CD of
			true ->
				NewCD = 0;
			_ ->
				NewCD = CD - Time
		end,
		#pk_PetSkillBaseInfo{
			petSkillIndex = Index,
			petSkillId = SkillID,
			petSkillType = Type,
			petSkillLv = Level,
			petSkillCd = NewCD,
			petSkillIsUnlock = Unlock
		}
	      end,
	Fun1 = fun({K, V}) ->
		#pk_AddProp{
			prop = K,
			value = V
		}
	       end,
	PetSkills = playerState:getPetSkills(PetID),
	Attas = lists:map(Fun1, PetAttas),
	Skills = lists:map(Fun, PetSkills),
%%	?DEBUG_OUT("==PetForce=pk_PetBaseInfo====~p~n",[{PetName,PetForce}]),
	#pk_PetBaseInfo{
		petID = PetID,
		petTime = PetTime,
		petName = PetName,
		petRaw = PetRaw,
		petStar = PetStar,
		petProps = Attas,
		status = PetStatus,
		skillList = Skills,
		petForce = PetForce
	}.

%%宠物消息处理 

%%发送宠物基本信息给客服端
-spec sendPetInfoToClient(Pet :: #recPetInfo{}) -> ok.
sendPetInfoToClient(Pet) ->
	PetBaseInfo = makePetBaseInfo(Pet),
%%	?DEBUG_OUT("=======sendPetInfoToClient==1========~p~n",[Pet]),
	Msg = #pk_GS2U_PetBaseInfo{
		info = PetBaseInfo
	},
	playerMsg:sendNetMsg(Msg).

%%发送宠物基本信息列表给客服端
-spec sendPetInfoListToClient() -> ok.
sendPetInfoListToClient() ->
	Pets = playerState:getPets(),
%%	?DEBUG_OUT("=======sendPetInfoListToClient=====2=====~p~n",[Pets]),
	Fun = fun(Pet) ->
		makePetBaseInfo(Pet)
	      end,
	PetBaseInfoList = lists:map(Fun, Pets),
	Msg = #pk_GS2U_PetInfoList{
		petInfoList = PetBaseInfoList
	},
	playerMsg:sendNetMsg(Msg).

%%发送宠物装备列表给客服端
-spec sendPetEquipListToClient() -> ok.
sendPetEquipListToClient() ->
	EquipList = playerState:getPetEquip(),
	Fun = fun(#recPetEquip{
		equip_id = ID,
		equip_lv = Lv
	}) ->
		#pk_PetEquipInfo{
			equipID = ID,
			equipLv = Lv
		}
	      end,
	EquipInfoList = lists:map(Fun, EquipList),
	Msg = #pk_GS2U_PetEquipInfoList{
		petEquipInfoList = EquipInfoList
	},
	playerMsg:sendNetMsg(Msg).

%%发送宠物改名结果
-spec sendPetReNameToClient(PetID :: uint(), Name :: string()) -> ok.
sendPetReNameToClient(PetID, Name) ->
	Msg = #pk_PetReName{
		petID = PetID,
		name = Name
	},
	playerMsg:sendNetMsg(Msg).

%%发送宠物装备给客服端
-spec sendPetStatusToClient(PetID :: uint(), Status :: uint()) -> ok.
sendPetStatusToClient(PetID, Status) ->
	Msg = #pk_GS2U_UpdatePetStatus{
		petID = PetID,
		status = Status
	},
	playerMsg:sendNetMsg(Msg).

%%发送宠物装备给客服端
-spec sendPetEquipToClient(Equip :: #recPetEquip{}) -> ok.
sendPetEquipToClient(Equip) ->
	PetEquipInfo = #pk_PetEquipInfo{
		equipID = Equip#recPetEquip.equip_id,
		equipLv = Equip#recPetEquip.equip_lv
	},
	Msg = #pk_GS2U_PetStrAck{
		petEquipInfo = PetEquipInfo
	},
	playerMsg:sendNetMsg(Msg).

%%发送宠物升星结果
-spec sendPetUpStarToClient(PetID :: uint(), Lv :: uint(), SkillID :: uint()) -> ok.
sendPetUpStarToClient(PetID, Lv, SkillID) ->
	Msg = #pk_GS2U_UpStartPetResult{
		petID = PetID,
		curStar = Lv,
		petSkillID = SkillID
	},
	playerMsg:sendNetMsg(Msg).

%%发送转生结果
-spec sendPetRawToClient(PetID :: uint(), Raw :: uint()) -> ok.
sendPetRawToClient(PetID, Raw) ->
	Msg = #pk_GS2U_RawPetResult{
		petID = PetID,
		curRaw = Raw
	},
	playerMsg:sendNetMsg(Msg).

%%发送宠物技能洗练结果
-spec sendPetSkillCastResult(PetID :: uint(), CastPetSkills :: list()) -> ok.
sendPetSkillCastResult(PetID, CastPetSkills) ->
	Fun = fun(#recPetSkillCast{
		skill_old_id = OldSkillID,
		skill_new_id = NewSkillID,
		skill_level = Level
	}) ->
		#pk_PetSkillCastResult{
			oldSkillID = OldSkillID,
			newSkillID = NewSkillID,
			newSkillLevel = Level
		}
	      end,
	Skills = lists:map(Fun, CastPetSkills),
	Msg = #pk_GS2U_PetSkillCastResult{
		petID = PetID,
		skillList = Skills
	},
	playerMsg:sendNetMsg(Msg).


%%发送替换宠物技能结果
-spec sendPetSkillReplaceResult(PetID :: uint()) -> ok.
sendPetSkillReplaceResult(PetID) ->
	Msg = #pk_PetSkillReplace{
		petID = PetID
	},
	playerMsg:sendNetMsg(Msg).

%%发送上坐骑结果
sendPetOnMountResult(PetCode, PetID, OwnerCode, GuetsCode) ->
	Msg = #pk_GS2U_OnMountPetAck{
		ownerCode = OwnerCode,
		petCode = PetCode,
		petId = PetID,
		guestCode = GuetsCode
	},
	?DEBUG_OUT("=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> [~ts],[~w]", [playerState:getName(), Msg]),
	%%广播给主人周围的玩家
%%	playerMsg:sendMsgToNearPlayer(Msg, true),
	%%广播给宠物周围的玩家
	case monsterInterface:getPetPos(PetCode) of
		{X, Y} ->
			mapView:sendMsg2NearPlayerByPos(playerState:getMapPid(), playerState:getMapPlayerEts(), Msg, X, Y, playerState:getGroupID());
		_ ->
			skip
	end,
	ok.

%%发送下坐骑结果
sendPetOffMountResult(PetCode) ->
	Code = playerState:getPlayerCode(),
	{X, Y} = playerState:getPos(),
	Msg = #pk_GS2U_OffMountPetAck{
		code = Code,
		x = X,
		y = Y
	},
	?DEBUG_OUT("=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> [~ts],[~w]", [playerState:getName(), Msg]),
	monsterInterface:setPetPos(PetCode, X, Y),
	PetEts = playerState:getMapPetEts(),
	case myEts:lookUpEts(PetEts, PetCode) of
		[#recMapObject{} = Pet] ->
			NewPet = Pet#recMapObject{x = X, y = Y},
			syncPetObject(NewPet, false);
		_ ->
			skip
	end,
	playerMsg:sendMsgToNearPlayer(Msg, true).


%%发送宠物提升属性结果
-spec sendPetAddAttaResult(PetID :: uint(), PropList :: list()) -> ok.
sendPetAddAttaResult(PetID, PropList) ->
	Fun = fun({Key, Value}, Acc) ->
		M = #pk_AddProp{
			prop = Key,
			value = Value
		},
		[M | Acc]
	      end,
	L = lists:foldl(Fun, [], PropList),
	Msg = #pk_GS2U_PetAddAttaRes{
		petID = PetID,
		propList = L
	},
	playerMsg:sendNetMsg(Msg).

%%发送宠物保存属性结果
-spec sendPetSaveAttaResult(PetID :: uint(), PropList :: list()) -> ok.
sendPetSaveAttaResult(PetID, PropList) ->
	Fun = fun({Key, Value}, Acc) ->
		M = #pk_AddProp{
			prop = Key,
			value = Value
		},
		[M | Acc]
	      end,
	L = lists:foldl(Fun, [], PropList),
	Msg = #pk_GS2U_PetAttaSaveRes{
		petID = PetID,
		propList = L
	},
	playerMsg:sendNetMsg(Msg).

checkBattlePet() ->
	PetList = playerState:getPets(),
	case PetList of
		[] -> skip;
		_ ->
			case lists:filter(fun(#recPetInfo{pet_status = Status}) ->
				case Status >= ?PetState_Battle_Show of
					true -> true;
					_ -> false
				end
			                  end, PetList) of
				[] ->
					case lists:keyfind(51001, #recPetInfo.pet_id, PetList) of
						#recPetInfo{} = Pet ->
							NewPets = lists:keyreplace(51001, #recPetInfo.pet_id, PetList,
								Pet#recPetInfo{pet_status = ?PetState_Battle_Show}),
							playerState:setPets(NewPets);
						_ -> skip
					end,
					ok;
				_ -> skip
			end
	end,
	ok.

petFixCast(PetID, OldSkillID, ItemID) ->
	case checkFixCast(PetID, OldSkillID, ItemID) of
		{ok, ItemCfg, Skill} ->
			onPetAttrChange2Master(PetID, ?EquipOff, false),
			doFixCastSkillReplace(PetID, ItemCfg, Skill),
			onPetAttrChange2Master(PetID, ?EquipOn, true),
			playerForce:calcOnePetForce(PetID, true),
			playerForce:calcPlayerForce(true);
		{false, Code} ->
			?LOG_OUT("petFixCast error, y=~p, player:~p, pet=~p, OldSkillID=~p, item=~p", [Code, playerState:getRoleID(), PetID, OldSkillID, ItemID]),
			playerMsg:sendErrorCodeMsg(Code)
	end.

checkFixCast(PetID, OldSkillID, ItemID) ->
	case checkFixCastItem(ItemID) of
		{ok, ItemCfg} ->
			case checkFixCastSkill(PetID, OldSkillID, ItemCfg) of
				{ok, Skill} ->
					{ok, ItemCfg, Skill};
				Err2 ->
					Err2
			end;
		Err1 ->
			Err1
	end.

checkFixCastItem(ItemID) ->
	Num = playerPackage:getItemNumByID(ItemID),
	case Num > 0 of
		true ->
			case getCfg:getCfgPStack(cfg_item, ItemID) of
				#itemCfg{itemType = ItemType, useType = UseType} = Cfg ->
					case ItemType =:= ?ItemTypePlayerPetSkillBook andalso UseType =:= ?Item_Use_PetSkillBook of
						true ->
							{ok, Cfg};
						_ ->
							{false, ?ErrorCode_PetSkillBookNotExist}
					end;
				_ ->
					{false, ?ErrorCode_PetSkillBookNotExist}
			end;
		_ ->
			{false, ?ErrorCode_PetSkillBookNotExist}
	end.

checkFixCastSkill(_PetID, _OldSkillID, #itemCfg{useParam1 = NewSkillID}) when NewSkillID =< 0 ->
	{false, ?ErrorCode_PetSkillBookNotExist};
checkFixCastSkill(PetID, OldSkillID, #itemCfg{useParam1 = NewSkillID}) when NewSkillID =:= OldSkillID ->
	checkCanCastSkill(PetID, OldSkillID);
checkFixCastSkill(PetID, OldSkillID, #itemCfg{useParam1 = NewSkillID}) ->
	CommonSkillList = getPetSkillByType(PetID, ?PetSkillTypeCommon),
	case checkCanCastSkill(PetID, OldSkillID) of
		{ok, Skill} ->
			case lists:keyfind(NewSkillID, #recPetSkill.skill_id, CommonSkillList) of
				#recPetSkill{} ->
					{false, ?ErrorCode_PetSkillHasTargetSkill};
				_ ->
					case checkSkillType(OldSkillID, NewSkillID, PetID) of
						{ok, _} ->
							{ok, Skill};
						Err2 ->
							Err2
					end
			end;
		Err1 ->
			Err1
	end.

%%
checkSkillType(OldSkillID, NewSkillID, PetID) ->
	OldSkillCfg = getCfg:getCfgPStack(cfg_petSkill, OldSkillID),
	NewSkillCfg = getCfg:getCfgPStack(cfg_petSkill, NewSkillID),
	docheckSkillType(OldSkillCfg, NewSkillCfg, PetID).
%%
docheckSkillType([], _, _) ->
	{false, ?ErrorCode_PetSkillSourceSkillNotExist};
docheckSkillType(_, [], _) ->
	{false, ?ErrorCode_PetSkillBookNotExist};
docheckSkillType(#petSkillCfg{petSkillType = OldType}, #petSkillCfg{petSkillType = NewType}, _) when OldType =:= NewType ->
	{ok, 0};
docheckSkillType(_, #petSkillCfg{petSkillType = NewType}, PetID) ->
	CommonSkillList = getPetSkillByType(PetID, ?PetSkillTypeCommon),
	F = fun(#recPetSkill{skill_id = SkillID}) ->
		case getCfg:getCfgPStack(cfg_petSkill, SkillID) of
			#petSkillCfg{petSkillType = CurType} when CurType =:= NewType ->
				true;
			_ ->
				false
		end
	    end,
	case lists:any(F, CommonSkillList) of
		true ->
			{false, ?ErrorCode_PetSkillTypeExist};
		_ ->
			{ok, 0}
	end.



checkCanCastSkill(PetID, OldSkillID) ->
	CommonSkillList = getPetSkillByType(PetID, ?PetSkillTypeCommon),
	case lists:keyfind(OldSkillID, #recPetSkill.skill_id, CommonSkillList) of
		#recPetSkill{skill_is_unlock = UnLock} = Skill when UnLock =:= ?PetSkillLock ->
			{ok, Skill};
		#recPetSkill{} ->
			{false, ?ErrorCode_PetSkillUnLock};
		_ ->
			{false, ?ErrorCode_PetSkillSourceSkillNotExist}
	end.

doFixCastSkillReplace(PetID, ItemCfg, #recPetSkill{skill_id = OldSkillID} = SkillRec) ->
	Skills = playerState:getPetSkills(PetID),
	NewSkill = makeNewSkill(ItemCfg, SkillRec),
	NewSkills = lists:keyreplace(
		SkillRec#recPetSkill.skill_index, #recPetSkill.skill_index, Skills, NewSkill),

	case delItem(ItemCfg#itemCfg.id, 1, ?ItemDeleteReasonUseSkillBook) of
		true ->
			delPetBattleSkill(PetID, OldSkillID),
			addPetBattleSkill(PetID, NewSkill#recPetSkill.skill_id, NewSkill#recPetSkill.skill_level),
			savePetSkillToDB(PetID, NewSkill),
			%%写日志
			?LOG_OUT("doFixCastSkillReplace, roleid =~p, petid=~p, item=~p, oldskill=(~p,~p), newskill=(~p,~p)",
				[playerState:getRoleID(), PetID, ItemCfg#itemCfg.id,
					SkillRec#recPetSkill.skill_id, SkillRec#recPetSkill.skill_level,
					NewSkill#recPetSkill.skill_id, NewSkill#recPetSkill.skill_level]),

			playerState:setPetSkills(PetID, NewSkills),
			playerForce:calcOnePetForce(PetID, true),
			playerMsg:sendNetMsg(#pk_GS2U_UsePetSkillBook{petID = PetID, oldSkillId = OldSkillID,
				newSkillId = NewSkill#recPetSkill.skill_id, newSkillLevel = NewSkill#recPetSkill.skill_level}),
			playerMsg:sendErrorCodeMsg(?ErrorCode_PetSkillBookUseSuccess);
		_ ->
			%%写日志
			playerMsg:sendErrorCodeMsg(?ErrorCode_PetSkillBookNotExist),
			?ERROR_OUT("doFixCastSkillReplace error, delItem(false), roleid =~p, petid=~p, item=~p",
				[playerState:getRoleID(), PetID, ItemCfg#itemCfg.id])
	end,
	ok.

delItem(ID, Num, Reason) ->
	Plog = #recPLogTSItem{
		old = Num,
		new = 0,
		change = -Num,
		target = ?PLogTS_Pet,
		source = ?PLogTS_PlayerSelf,
		gold = 0,
		goldtype = 0,
		changReason = Reason,
		reasonParam = 0
	},
	playerPackage:delGoodsByID(?Item_Location_Bag, ID, Num, Plog).

makeNewSkill(ItemCfg, Skill) ->
	#itemCfg{useParam1 = SkillID, useParam2 = Level} = ItemCfg,
	SkillLevel =
		case Level =< 0 of
			true ->
				trunc(misc:rand(1, 5));
			_ ->
				Level
		end,
	Skill#recPetSkill{skill_id = SkillID, skill_level = SkillLevel}.
%%根据宠物id来获取宠物
getPetByID(PetID) ->
	Pets = playerState:getPets(),
%%	?DEBUG_OUT("find(~p) from ~p", [PetID, Pets]),
	PetInfo = lists:keyfind(PetID, #recPetInfo.pet_id, Pets),
	if
		is_record(PetInfo, recPetInfo) ->
			{ok, PetInfo};
		true ->
			{error, none}
	end.


%% 提取指定骑宠ID的所有技能，用于新版骑宠领地模拟战斗时的创建骑宠
-spec getPetSkills(PetID :: uint64()) -> [{SkillID :: uint32(), SkillLevel :: uint32()}, ...].
getPetSkills(PetID) ->
	#petCfg{
		talentSkill = TalentSkill,
		randomSkill = RandomSkill
	} = getCfg:getCfgPStack(cfg_pet, PetID),
	RandomSkillReal =
		case RandomSkill of
			undefined ->
				[];
			_ ->
				RandomSkill
		end,
	ListSkillRandom = [{SkillID, getPetSkillLevelByWeight()} || SkillID <- RandomSkillReal],
	case TalentSkill of
		undefined ->
			ListSkillRandom;
		0 ->
			ListSkillRandom;
		_ ->
			lists:keystore(TalentSkill, 1, ListSkillRandom, {TalentSkill, 1})
	end.

%% 提取指定骑宠的所有附加属性，用于新版骑宠领地模拟战斗时的创建骑宠
%% 模拟makCallPetProp/4
-spec getPetProps(PetID :: uint64()) -> {[{PropPIndex :: uint32(), PropPValue :: float()}, ...], [{PropMIndex :: uint32(), PropMValue :: float()}, ...]}.
getPetProps(PetID) ->
	case lists:keyfind(PetID, #recPetInfo.pet_id, playerState:getPets()) of
		#recPetInfo{pet_star = Star, pet_raw = Raw} ->
			%%基础属性
			PropList = makePetBaseProp(PetID, playerState:getLevel(), Star, Raw),
			%%宠物提升属性
			{AttaAddProps, AttaMultiProps} = makePetAddProp(PetID),
			%%天赋系统
			{TalAddProps, TalMultiProps} = makePetTalentProp(),
			%%宠物宝石
			{GemAddProps, GemMultiProps} = makePetGemProp(),
			%%拥有者附加属性（这个名字是我胡诌的）
			{OwnerPetAddProps, OwnerPetMultiProps} = makePetOwnerProp(),
			%%宠物装备
			{EquipAddProps, EquipMultiProps} = makePetEquipProp(),
			%%宠物符文
			{RuneAddProps, RuneMultProps} = playerRune:getPetRunePropList([PetID]),
			%%合并相同属性并返回
			FunCombine =
				fun({Key, Value}, R) ->
					case lists:keyfind(Key, 1, R) of
						{_, ValueOld} ->
							lists:keyreplace(Key, 1, R, {Key, Value + ValueOld});
						_ ->
							[{Key, Value} | R]
					end
				end,
			ListAddOld = PropList ++ AttaAddProps ++ TalAddProps ++ GemAddProps ++ EquipAddProps ++ RuneAddProps ++ OwnerPetAddProps,
			ListMultiOld = AttaMultiProps ++ TalMultiProps ++ GemMultiProps ++ EquipMultiProps ++ RuneMultProps ++ OwnerPetMultiProps,
			ListAddNew = lists:foldl(FunCombine, [], ListAddOld),
			ListMultiNew = lists:foldl(FunCombine, [], ListMultiOld),
			{ListAddNew, ListMultiNew};
		_ ->
			?ERROR_OUT("getPetProps can not find PetID:~p from RoleID:~p", [PetID, playerState:getRoleID()]),
			{[], []}
	end.

%%% 提取指定骑宠的战力，用于新版骑宠领地模拟战斗时的创建骑宠
%-spec getPetForce(PetID :: uint64()) -> uint64().
%getPetForce(PetID) ->
%	case lists:keyfind(PetID, #recPetInfo.pet_id, playerState:getPets()) of
%		#recPetInfo{pet_force = PetForce} ->
%			PetForce;
%		_ ->
%			0
%	end.

%% 属性修改只针对出战宠物
onBattlePetAttrChange(Op, IsNotify) ->
	case getPetBattle() of
		#recPetInfo{pet_id = PetID} ->
			onPetAttrChange2Master(PetID, Op, IsNotify);
		_ ->
			skip
	end,
	ok.

calcBattlePetForce(IsNotify) ->
	case getPetBattle() of
		#recPetInfo{pet_id = PetID} ->
			playerForce:calcOnePetForce(PetID, IsNotify);
		_ ->
			skip
	end.

%% 通用
onPetAttrChange2Master(PetID, Op, IsNotify) ->
	case lists:keyfind(PetID, #recPetInfo.pet_id, playerState:getPets()) of
		#recPetInfo{pet_id = PetID} = Pet ->
			doPetAttrChange2Master(Pet, Op, IsNotify);
		_ ->
			skip
	end.


%% 出战
doPetAttrChange2Master(#recPetInfo{
	pet_id = PetID,
	pet_star = Star,
	pet_raw = Raw,
	pet_status = Status} = Pet,
	?EquipOn,
	IsNotify
) when Status >= ?PetState_Battle_Show ->
	Level = playerState:getLevel(),
	AddProps = makePetAllProps2MasterList(PetID, Star, Raw, Status),
	BaseProps = makePetBaseProp(PetID, Level, Star, Raw),
	playerCalcProp:changeProp_CalcType(AddProps, ?EquipOn, IsNotify),
	?DEBUG_OUT("role[~p],pet[~p] add to master ~p",
		[playerState:getRoleID(), PetID, AddProps]),
	resetBattlePetBaseProp2Local(getPetBattleCode(), BaseProps, Level, Pet),
	ok;
%% 其他情况
doPetAttrChange2Master(#recPetInfo{
	pet_id = PetID,
	pet_star = Star,
	pet_raw = Raw,
	pet_status = Status},
	?EquipOn,
	IsNotify
) ->
	AddProps = makePetAllProps2MasterList(PetID, Star, Raw, Status),
	?DEBUG_OUT("role[~p],pet[~p] add to master ~p",
		[playerState:getRoleID(), PetID, AddProps]),
	playerCalcProp:changeProp_CalcType(AddProps, ?EquipOn, IsNotify),
	ok;
doPetAttrChange2Master(#recPetInfo{
	pet_id = PetID,
	pet_star = Star,
	pet_raw = Raw,
	pet_status = Status},
	?EquipOff,
	IsNotify
) ->
	AddProps = makePetAllProps2MasterList(PetID, Star, Raw, Status),
	?DEBUG_OUT("role[~p],pet[~p] dec to master ~p",
		[playerState:getRoleID(), PetID, AddProps]),
	playerCalcProp:changeProp_CalcType(AddProps, ?EquipOff, IsNotify),
	ok;
doPetAttrChange2Master(_Pet, _OP, _IsNotify) ->
	error.


makePetAllProps2MasterList(PetID, Star, Raw, Status) ->
	Level = playerState:getLevel(),
	Props = makePetProp(PetID, Level, Star, Raw, Status),
	calcAddPropList(Props, getPropPercent(PetID, Status)).

getPropPercent(PetID, Status) when Status >= ?PetState_Battle_Show ->
	case getCfg:getCfgByArgs(cfg_pet, PetID) of
		#petCfg{masterAdd = BP} -> BP;
		_ -> 0
	end;
getPropPercent(PetID, ?PetState_Assist) ->
	case getCfg:getCfgByArgs(cfg_pet, PetID) of
		#petCfg{petToMaster = AP} -> AP;
		_ -> 0
	end;
getPropPercent(PetID, _Status) ->
	case getCfg:getCfgByArgs(cfg_pet, PetID) of
		#petCfg{idlePetToMaster = IP} -> IP;
		_ -> 0
	end.

calcAddPropList(_Props, 0) ->
	[];
calcAddPropList(Props, Percent) ->
	[{Key, Val * Percent, ?PropCalcType_Add} ||
		#battleProp{propIndex = Key, totalValue = Val} <- Props, lists:member(Key, ?PetPropToMaster)].


resetBattlePetBaseProp2Local(0, _, _, #recPetInfo{pet_status = ?PetState_Battle_Hide}) ->
	skip;
resetBattlePetBaseProp2Local(0, _, _, Pet) ->
	?ERROR_OUT("player[~ts] update pet base prop failed, pet info[~p]~n~p",
		[playerState:getName(), Pet, misc:getStackTrace()]);
resetBattlePetBaseProp2Local(Code, Prop, Lv, Pet) ->
	playerPropSync:setInt(?PubProp_PetTurnRaw, Pet#recPetInfo.pet_raw),
	monsterInterface:updatePetLevel(Code, Lv),
	?DEBUG_OUT("battlepetprop,~p,~p,~p",[Pet#recPetInfo.pet_id, Code, Prop]),
	monsterInterface:setPetBaseProp(Code, Prop).