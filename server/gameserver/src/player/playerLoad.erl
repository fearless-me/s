%% coding: utf-8
%% @author zhongyunawei
%% @doc @todo 玩家相关数据从数据库读取.


-module(playerLoad).
-author(zhongyuanwei).

-include("playerPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initSkillFromDB/1,
	initSkillSlotFromDB/1,
	initPetFromDB/1,
	initPetEquipFromDB/1,
	initPetSkillFromDB/1,
	initPetManorBattleFromDB/1,
	initPetDungeonInfoFromDB/1,
	initPetDungeonScoreFromDB/1,
	initBuffFromDB/1,
	initAchieveFromDB/1,
	initBadgeFromDB/1,
	initTitleFromDB/1,
	initRefineFromDB/1,
	initPackageInfoFromDB/1,
	initItemFromDB/1,
	initDailyCounterFromDB/1,
	initMailFromDB/1,
	initAcceptedTaskFromDB/1,
	initSubmitedTaskFromDB/1,
	initItemUsedTimeFromDB/1,
	initAwakenFromDB/1,
	initDropListFromDB/1,
	initOfflineExpFromDB/1
]).

-spec initSkillFromDB(SkillList) -> ok when
	SkillList :: list().
initSkillFromDB(SkillList) when erlang:is_list(SkillList) ->
	[initSkill(Skill) || Skill <- SkillList],
	ok.

-spec initSkillSlotFromDB(SkillSlotList) -> ok when
	SkillSlotList :: list().
initSkillSlotFromDB(SkillSlotList) when erlang:is_list(SkillSlotList) ->
	Fun = fun(#rec_skill_slot{slot = Slot, skillID = SkillID}) ->
		initSlot(Slot, true),
		initSkillSlot(SkillID, Slot)
	      end,
	lists:foreach(Fun, SkillSlotList),
	ok.

-spec initPetFromDB(PetList) -> ok when
	PetList :: list().
initPetFromDB(PetList) when erlang:is_list(PetList) ->
	[initPet(Pet) || Pet <- PetList],
	playerPet:checkBattlePet(),
	ok.

-spec initPetEquipFromDB(PetEquipList :: list()) -> ok.
initPetEquipFromDB(PetEquipList) when erlang:is_list(PetEquipList) ->
	[initPetEquip(PetEquip) || PetEquip <- PetEquipList],
	ok.

-spec initPetSkillFromDB(PetSkillList) -> ok when
	PetSkillList :: list().
initPetSkillFromDB(PetSkillList) when erlang:is_list(PetSkillList) ->
	[initPetSkill(PetSkill) || PetSkill <- PetSkillList],
	ok.

-spec initPetManorBattleFromDB(PetManorBattleList :: [#rec_pet_manor_battle{}, ...]) -> ok.
initPetManorBattleFromDB([#rec_pet_manor_battle{pet_reel = Reel, off_time = OffTime} = PetManorBattle | _]) ->
	MaxReel = globalCfg:getPetPvpReelMaxNum(),
	CurReel = playerPetPvP:getOfflineReel(Reel, MaxReel, OffTime),
	NewMB = PetManorBattle#rec_pet_manor_battle{
		off_time = 0,
		pet_reel = CurReel
	},
	playerPetPvP:savePetManorBattleToDB(NewMB),
	playerState:setPetManorBattle(NewMB).

-spec initPetDungeonInfoFromDB(PetDungeonInfoList) -> ok when
	PetDungeonInfoList :: [#rec_pet_dungeon_info{}, ...].
initPetDungeonInfoFromDB([#rec_pet_dungeon_info{} = PetDungeonInfo | _]) ->
	playerState:setPetDunInfo(PetDungeonInfo).

-spec initPetDungeonScoreFromDB(PetDungeonScoreList) -> ok when
	PetDungeonScoreList :: list().
initPetDungeonScoreFromDB(PetDungeonScoreList) when erlang:is_list(PetDungeonScoreList) ->
	[initPetDungeonScore(PetDungeon) || PetDungeon <- PetDungeonScoreList],
	ok.

-spec initBuffFromDB(BuffList) -> ok when
	BuffList :: list().
initBuffFromDB(BuffList) when erlang:is_list(BuffList) ->
	playerState:setSaveBuffList(BuffList),
	ok.

-spec initAchieveFromDB(AchieveList) -> ok when
	AchieveList :: list().
initAchieveFromDB(AchieveList) when erlang:is_list(AchieveList) ->
	[initAchieve(Achieve) || Achieve <- AchieveList],
	ok.

-spec initBadgeFromDB(BadgeList) -> ok when
	BadgeList :: list().
initBadgeFromDB(BadgeList) when erlang:is_list(BadgeList) ->
	[initBadge(Badge) || Badge <- BadgeList],
	ok.

-spec initTitleFromDB(TitleList) -> ok when
	TitleList :: list().
initTitleFromDB(TitleList) when erlang:is_list(TitleList) ->
	[initTitle(Title) || Title <- TitleList],
	ok.

-spec initRefineFromDB(RefineList) -> ok when
	RefineList :: list().
initRefineFromDB(RefineList) when erlang:is_list(RefineList) ->
	[initRefine(Refine) || Refine <- RefineList],
	ok.

-spec initAwakenFromDB(AwakenList) -> ok when
	AwakenList :: list().
initAwakenFromDB(AwakenList) when erlang:is_list(AwakenList) ->
	[initWake(Wake) || Wake <- AwakenList],
	ok.

-spec initDropListFromDB(DropList) -> ok when DropList :: list().
initDropListFromDB(DropList) when erlang:is_list(DropList) ->
	Fun = fun(#rec_player_drop{
%%		roleID = {_, Id},
		id = Id,
		num = Num,
		time = Time
	}) ->
		#recDrop{id = Id, num = Num, time = Time}
	      end,
	L = lists:map(Fun, DropList),
	playerState:setDropList(L).

-spec initPackageInfoFromDB(PackageInfoList) -> ok when
	PackageInfoList :: list().
initPackageInfoFromDB(PackageInfoList) when erlang:is_list(PackageInfoList) ->
	RoleID = playerState:getRoleID(),
	[playerPackage:initPackageInfoFromDB(PackageInfo#rec_package_info{roleID = RoleID}) || PackageInfo <- PackageInfoList],
	ok.

%%从数据库中读取的道具信息，需要存储到背包中，只能使用此接口
-spec initItemFromDB(ItemList) -> ok when ItemList :: list().
initItemFromDB(ItemList) ->
	[playerPackage:initGoodsFromDB(Item) || Item <- ItemList],
	ok.

%%从数据库初始化道具组使用时间
-spec initItemUsedTimeFromDB(List) -> ok when List :: list().
initItemUsedTimeFromDB(List) ->
	[playerState:setItemUseTime(ItemGroupID, UsedTime) || #rec_item_used_cd{itemGroupID = ItemGroupID, lastUsedTime = UsedTime} <- List],
	ok.

%%从数据库中读取每日计数器
-spec initDailyCounterFromDB(List) -> ok when
	List :: list().
initDailyCounterFromDB(List) when erlang:is_list(List) ->
	playerDaily:initDailyCounter(List),
	ok.

-spec initMailFromDB(List) -> ok when
	List :: list().
initMailFromDB(MailList) when erlang:is_list(MailList) ->
	psMgr:sendMsg2PS(?PsNameMail, initMailFromDB, {playerState:getRoleID(), playerState:getNetPid(), MailList}),
	ok.

%%初始化已经接受的任务列表
-spec initAcceptedTaskFromDB(AcceptedTaskList) -> ok when
	AcceptedTaskList :: [#rec_task{}, ...].
initAcceptedTaskFromDB(AcceptedTaskList) ->
%%    AcceptedTaskList = [TA || #rec_task_accepted{taskID = TaskID} = TA <- AcceptedTaskList0, erlang:is_integer(TaskID), TaskID > 0],
%%    %%已接受的任务写入字典中
%%    AcceptedTaskFun =
%%        fun(#rec_task_accepted{roleID = RoleID, taskID = AcceptedTaskID} = Record, AcceptedList) ->
%%            case getCfg:getCfgPStack(cfg_task_new, AcceptedTaskID) of
%%                #task_newCfg{target_para = TargetParaCfg,target_type = TargetType} ->
%%                    TaskProcessFun =
%%                        fun(#target_paraCfg{} = TargetPara, SubAimIndexList) ->
%%                            if
%%                                TargetType =:= ?TaskType_Talk ->
%%                                    [0 | SubAimIndexList];
%%                                TargetType =:= ?TaskType_Monster -> %%杀怪任务
%%                                    [TargetPara#target_paraCfg.mst | SubAimIndexList];
%%                                TargetType =:= ?TaskType_Drop ->    %%掉落任务
%%                                    [TargetPara#target_paraCfg.kmst | SubAimIndexList];
%%                                TargetType =:= ?TaskType_CollectItem ->  %%采集任务
%%                                    [TargetPara#target_paraCfg.cobj | SubAimIndexList];
%%                                TargetType =:= ?TaskType_UseItem ->  %%使用物品任务
%%                                    [TargetPara#target_paraCfg.uobj | SubAimIndexList];
%%                                TargetType =:= ?TaskType_CopyMap ->  %%通关副本
%%                                    [TargetPara#target_paraCfg.finishcopy | SubAimIndexList];
%%                                TargetType =:= ?TaskType_MiniCopy ->  %%位面
%%                                    [TargetPara#target_paraCfg.minicopy | SubAimIndexList];
%%                                TargetType =:= ?TaskType_Active ->  %%活动任务
%%                                    [TargetPara#target_paraCfg.dailyid | SubAimIndexList];
%%                                TargetType =:= ?TaskType_LevLimit -> %%等级限制任务
%%                                    [TargetPara#target_paraCfg.getlevel | SubAimIndexList];
%%                                true ->
%%                                    SubAimIndexList
%%                            end
%%                        end,
%%                    case erlang:is_list(TargetParaCfg) of
%%                        true ->
%%                            NewSubAimIndexList = lists:foldl(TaskProcessFun, [], TargetParaCfg);
%%                        false ->
%%                            NewSubAimIndexList = lists:foldl(TaskProcessFun, [], [TargetParaCfg])
%%                    end;
%%                _ ->
%%                    NewSubAimIndexList = [0]
%%            end,
%%            %%根据数据库里的数据，初始化子任务的aimType、aimCurCount项
%%            TaskMaxCount = playerTask2:getTaskMaxCount(AcceptedTaskID),
%%            AimList = [#recTaskProcess{
%%                subTaskType = Record#rec_task_accepted.subType1,
%%                curCount = Record#rec_task_accepted.count1,
%%                maxCount = TaskMaxCount},
%%                #recTaskProcess{
%%                    subTaskType = Record#rec_task_accepted.subType2,
%%                    curCount = Record#rec_task_accepted.count2,
%%                    maxCount = TaskMaxCount},
%%                #recTaskProcess{
%%                    subTaskType = Record#rec_task_accepted.subType3,
%%                    curCount = Record#rec_task_accepted.count3,
%%                    maxCount = TaskMaxCount}],
%%
%%            %%合并aimIndex项到数据库里的子任务列表里
%%            AddAimIndexFun =
%%                fun(AimIndex, {Index, TaskProcessList}) ->
%%                    TaskAccepted = lists:nth(Index, AimList),
%%                    {Index + 1, [TaskAccepted#recTaskProcess{targetID = AimIndex} | TaskProcessList]}
%%                end,
%%            {_, NewTaskProcessList} = lists:foldl(AddAimIndexFun, {1, []}, NewSubAimIndexList),
%%            lists:keystore(AcceptedTaskID, #recTaskAccepted.taskID, AcceptedList, #recTaskAccepted {
%%                taskID = AcceptedTaskID,
%%                roleID = RoleID,
%%                taskProcess = NewTaskProcessList
%%            })
%%        end,
%%    NewAcceptedList = lists:foldl(AcceptedTaskFun, [], AcceptedTaskList),
	playerState:setAcceptedTask(AcceptedTaskList),
	ok.

%%初始化已经完成的任务列表
-spec initSubmitedTaskFromDB(CompletedTaskList) -> ok when
	CompletedTaskList :: [#rec_task_submitted{}, ...].
initSubmitedTaskFromDB(CompletedTaskList) ->
	%%已完成的任务写入字典中
	CompletedTaskFun =
		fun(#rec_task_submitted{taskSlot = Slot, taskFlag = Flag}, TaskList) ->
			lists:keystore(Slot, 1, TaskList, {Slot, Flag})
		end,
	NewCompletedList = lists:foldl(CompletedTaskFun, [], CompletedTaskList),
	playerState:setSubmittedTask(NewCompletedList),
	ok.

-spec initOfflineExpFromDB(ExtRole) -> ok when
	ExtRole :: [#rec_ext_role{}, ...].
initOfflineExpFromDB(ExtRole) ->
	[NewExtRole | _] = ExtRole,
	playerUpdateReward:initUpdateRewardFromDB(NewExtRole).
%% ====================================================================
%% Internal functions
%% ====================================================================

-spec initSkill(#rec_skill{}) -> ok.
initSkill(#rec_skill{
	skillID = SkillID,
	level = Level,
	lastUseTime = UsedTime
}) ->
	case getCfg:getCfgPStack(cfg_skill, SkillID) of
		#skillCfg{nouse = 0} ->
			Skill = #recSkill{
				level = 1,
				damagePlus = 0,
				damageMultiply = 1,
				skillID = SkillID,
				damage = 0
			},
			Skill1 = playerSkillLearn:setLevel(Skill, Level),
			SkillList = playerState:getSkill(),
			%%这里需要重新设置修改标记为false
			playerState:setSkill([Skill1#recSkill{isModified = false} | SkillList]),
			SkillCDList = playerState:getSkillCD(),
			playerState:setSkillCD([{SkillID, UsedTime} | SkillCDList]);
		#skillCfg{} ->
			skip;
		_ ->
			?LOG_OUT("Role[~p] Init Skill[~p] From DB, But not Exist in cfg",
				[playerState:getRoleID(), SkillID])
	end,
	ok.

-spec initSlot(Slot, IsOpen) -> ok when
	Slot :: uint(),
	IsOpen :: boolean().
initSlot(Slot, IsOpen) when erlang:is_boolean(IsOpen) ->
	SlotList = playerState:getSlotList(),
	SL = lists:keystore(Slot, 1, SlotList, {Slot, IsOpen}),
	playerState:setSlotList(SL).

-spec initSkillSlot(SkillID, Slot) -> ok when
	SkillID :: uint(),
	Slot :: uint().
initSkillSlot(0, _) ->
	ok;
initSkillSlot(SkillID, Slot) ->
	Cfg = getCfg:getCfgPStack(cfg_skill, SkillID),
	initSkillSlot(SkillID, Slot, Cfg).

initSkillSlot(SkillID, Slot, #skillCfg{skillType = Type}) ->
	Now = time:getUTCNowMSDiff2010(),
	SlotSkill = playerState:getSlotSkill(),
	RecSoltSkill = #recSlotSkill{skillID = SkillID,
		slot = Slot,
		type = Type,
		time = Now},
	SSL = lists:keystore(SkillID, #recSlotSkill.skillID, SlotSkill, RecSoltSkill),
	playerState:setSlotSkill(SSL);
initSkillSlot(SkillID, _, _) ->
	?LOG_OUT("Role[~p] Init Skill[~p] From DB, But not Exist in cfg", [playerState:getRoleID(), SkillID]).

-spec initAchieve(#rec_achieve{}) -> ok.
initAchieve(#rec_achieve{
	achieveID = AchieveID,
	achieveSID = AchieveSID,
	achieveLevel = AchieveLevel,
	achieveSnum = AchieveSnum
}) ->
	Achieve = #recAchieve{
		aID = AchieveID,
		aScheduleLevel = AchieveSID,
		aScheduleGetLevel = AchieveLevel,
		aScheduleNum = AchieveSnum
	},
	AchieveList = playerState:getPlayerAchieveList(),
	NewAchieveList = lists:keystore(AchieveID, #recAchieve.aID, AchieveList, Achieve),
	playerState:setPlayerAchieveList(NewAchieveList).

-spec initBadge(#rec_badge{}) -> ok.
initBadge(#rec_badge{
	mapID = MapID,
	items = Items
}) ->
	#achievecollectionCfg{items = Items1} = getCfg:getCfgPStack(cfg_achievecollection, MapID),
	case erlang:is_list(Items) of
		true ->
			Badge = #recBadge{
				mapID = MapID,
				itemList = Items,
				isComplete = (lists:sort(Items) =:= lists:sort(Items1))
			},
			BadgeList = playerState:getPlayerBadgeList(),
			playerState:setPlayerBadgeList([Badge | BadgeList]);
		_ ->
			skip
	end,
	ok.


-spec initTitle(#rec_title{}) -> ok.
initTitle(#rec_title{
	titleID = TitleID,
	endTime = Time
}) ->
	Title = #recTitle{
		titleID = TitleID,
		timestamp = Time
	},
	TitleList = playerState:getPlayerTitleList(),
	playerState:setPlayerTitleList([Title | TitleList]).

-spec initRefine(#rec_equip_refine_info{}) -> ok.
initRefine(#rec_equip_refine_info{
	type = Type,
	level = Level,
	prog = Prog,
	star = Star,
	bless = Bless
}) ->
	RefineList = playerState:getEquipRefine(),
	playerState:setEquipRefine([{Type, Level} | RefineList]),

	L = playerState:getEquipStarList(),
	Tuple = #recEquipStar{
		pos = Type,
		prog = Prog,
		star = Star,
		bless = Bless
	},
	playerState:setEquipStarList([Tuple | L]).

-spec initWake(#rec_awaken_info{}) -> ok.
initWake(#rec_awaken_info{
	cardID = CardID,
	itemNum = Num,
	level = Level,
	progress = Progress,
	stateMax = LockStateMax,
	curState = CurState
}) ->
	Wake = #recWake{
		cardID = CardID,
		curLevel = Level,
		curNum = Num,
		activeProgress = Progress,
		unLockStateMax = LockStateMax,
		curState = CurState
	},
	Wakes = playerState:getWakes(),
	playerState:setWakes([Wake | Wakes]).

-spec initPet(#rec_pet_info{}) -> ok.
initPet(#rec_pet_info{
	attas = Attas,
	petID = PetID,
	petLv = PetLevel,
	exp = Exp,
	star = Star,
	status = Status,
	name = Name,
	force = Force,
	raw = Raw,
	time = Time,
	upCount = UpCount
} ) ->
	Pets = playerState:getPets(),
	NewStatus =
		case Status of
			?PetState_Battle_Mount ->
				playerState:setPetMounts({PetID, ?PetOnMount}),
				?PetState_Battle_Show;
			_ ->
				Status
		end,
	Pet = #recPetInfo{
		pet_time = Time,
		pet_level = PetLevel,
		pet_exp = Exp,
		pet_attas = Attas,
		pet_force = Force,
		pet_name = Name,
		pet_id = PetID,
		pet_star = Star,
		pet_raw = Raw,
		pet_status = NewStatus,
		upCount = UpCount
	},
	playerState:setPets([Pet | Pets]).

-spec initPetEquip(#rec_pet_equip{}) -> ok.
initPetEquip(#rec_pet_equip{
	equipID = EquipID,
	equipLv = EquipLv,
	equipPos = EquipPos
}) ->
	PetEquipList = playerState:getPetEquip(),
	PetEquip = #recPetEquip{
		equip_id = EquipID,
		equip_lv = EquipLv,
		equip_pos = EquipPos
	},
	playerState:setPetEquip([PetEquip | PetEquipList]).

-spec initPetSkill(#rec_pet_skill{}) -> ok.
initPetSkill(#rec_pet_skill{
	petID = PetID,
	skillID = SkillID,
	index = Index,
	level = Level,
	unlock = Unlock,
	type = Type,
	cd = CD
}) ->
	Skills = playerState:getPetSkills(PetID),
	Skill = #recPetSkill{
		skill_index = Index,
		skill_id = SkillID,
		skill_cd = CD,
		skill_type = Type,
		skill_level = Level,
		skill_is_unlock = Unlock
	},
	playerState:setPetSkills(PetID, [Skill | Skills]).

-spec initPetDungeonScore(#rec_pet_dungeon_score{}) -> ok.
initPetDungeonScore(#rec_pet_dungeon_score{} = DungeonScore) ->
	PetDunScoreList = playerState:getPetDunScoreList(),
	playerState:setPetDunScoreList([DungeonScore | PetDunScoreList]).
