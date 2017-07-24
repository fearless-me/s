%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 24. 四月 2015 16:19
%%%-------------------------------------------------------------------

-module(playerEDBLoad).
-author("ZhongYuanWei").

-include("gsInc.hrl").

%% API
-export([
	loadRoleAndCleanCache/1,
	loadRole/1,
	loadRoleFromMem/1,
	getVisualableEquipList/1,
	getEquipRefineInfoList/1,
	getFashionBody/1
]).

-export([
	onLoadPlayerTeam/1
]).

loadRoleFromMem(RoleID) ->
	case ets:lookup(ets_rec_base_role, RoleID) of
		[#rec_base_role{} = BaseRole] ->
			onLoadRoleBase(BaseRole),
			ok;
		_ ->
			?ERROR_OUT("loadRoleFromMem:~p", [RoleID]),
			skip
	end,
	ok.

-spec loadRoleAndCleanCache(RoleID::uint64()) -> boolean().
loadRoleAndCleanCache(RoleID) ->
	needCleanRoleCache(RoleID),
	?DEBUG_OUT("loadRoleAndCleanCache"),
	loadRole(RoleID).

-spec loadRole(RoleID::uint64()) -> boolean().
loadRole(RoleID) ->
	case ets:lookup(ets_rec_base_role, RoleID) of
		[#rec_base_role{} = BaseRole] ->
			onLoadRoleBase(BaseRole),
			playerState:setRunStep(?PlayerStateLoadRoleOK),
			true;
		_ ->
			?DEBUG_OUT("loadRole from DBS"),
			gsSendMsg:sendMsg2DBServer(loadRole, playerState:getAccountID(), {RoleID, core:getPlayerDataMgrOtp()}),
			false
	end.

%%查看玩家是否需要重置其缓存
-spec needCleanRoleCache(RoleID::uint64()) ->ok.
needCleanRoleCache(RoleID) ->
	case edb:dirtyReadRecord(rec_clean_role_cache,RoleID) of
		[] ->
			skip;
		_ ->
			edb:deleteRecord(rec_clean_role_cache, RoleID),
			playerSave:deleteRoleCache(RoleID)
	end,
	ok.

getVisualableEquipList(RoleID) ->
	{_ItemList,EquipList} = getGoodsList(RoleID),
	Fun = fun(#recSaveEquip{pos = Pos,itemID = EquipID,quality = Q},AccIn) ->
		case Pos =:= ?Item_Location_BodyEquipBag of
			true ->
				[#recVisibleEquip{
					roleID = RoleID,			%%角色ID
					equipID = EquipID,			%%装备ID
					quality = Q					%%装备品质
				} | AccIn];
			_ ->
				AccIn
		end
	end,
	lists:foldl(Fun,[],EquipList).

getEquipRefineInfoList(RoleID) ->
	Match = #rec_equip_refine_info{roleID = {RoleID, _ = '_'}, _ = '_'},
	edb:dirtyMatchRecord(rec_equip_refine_info, Match).

getFashionBody(RoleID) ->
	Match = #rec_fashion_slot{roleID = {RoleID, _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_fashion_slot, Match),
	Fun = fun(#rec_fashion_slot{
		slot = Slot,				%% tinyint(3) unsigned
		fashionID = FID				%% smallint(5) unsigned
	},AccIn) ->
		[#recFashionOnLoad{
			roleID 	= RoleID,			%%角色ID
			index = Slot,
			value = FID
		} | AccIn]
	end,
	lists:foldl(Fun,[],List).

%% 加载角色其它信息，不是进入场景的依赖关系
onLoadRoleData_Other(#rec_playerdata{roleID = RoleID} = Data) ->
	printLog("onLoadRefine:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadRefine(RoleID),

	printLog("onLoadPackageInfo:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadPackageInfo(RoleID),

	printLog("onLoadGoods:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadGoods(RoleID),

	printLog("onLoadSkill:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadSkill(RoleID),

	printLog("onLoadSkillSlot:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadSkillSlot(RoleID),

	printLog("onLoadTask:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadTask({RoleID, Data#rec_playerdata.rec_task_accepted, Data#rec_playerdata.rec_task_submitted}),

	printLog("onLoadTitle:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadTitle(RoleID),

	printLog("onLoadAwake:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadAwake(RoleID),

	printLog("onLoadBadge:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadBadge(RoleID),

	printLog("onLoadPet:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadPet(RoleID),

	printLog("onLoadDrop:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadDrop(RoleID),

	printLog("onLoadPetManorBattle:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadPetManorBattle(RoleID),

	printLog("onLoadPetDunInfo:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadPetDunInfo(RoleID),

	printLog("onLoadPetDunScore:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadPetDunScore(RoleID),

	%printLog("onLoadFriend:~p,~p", [RoleID, time2:getTimestampMS()]),
	%onLoadFriend(RoleID),

	printLog("onLoadFashion:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadFashion(RoleID),

	printLog("onLoadFashionSlot:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadFashionSlot(RoleID),

	printLog("onLoadPlayerClock:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadPlayerClock(RoleID),

	printLog("onLoadBuffList:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadBuffList(RoleID),

	printLog("onLoadItemUsedCD:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadItemUsedCD(RoleID),

	printLog("onLoadTalentInfo:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadTalentInfo(RoleID),

	printLog("onLoadGodWeaponInfo:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadGodWeaponInfo(RoleID),

	printLog("onLoadWarriorTrialInfo:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadWarriorTrialInfo(RoleID),

	printLog("onLoadPlayerLiveness:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadPlayerLiveness(RoleID),

	printLog("onLoadPlayerHolidayTask:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadPlayerHolidayTask(RoleID),

	printLog("onLoadPlayerRune:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadPlayerRune(RoleID),

	printLog("onLoadRoleData_Other end:~p,~p", [RoleID, time2:getTimestampMS()]),
	ok.

%% 加载进入场景依赖的数据
onLoadRoleData_Scene(#rec_playerdata{roleID = RoleID, rec_player_prop = Props}) ->
	printLog("onLoadExtRole:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadExtRole(RoleID),

	printLog("onLoadPlayerProp:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadPlayerProp(Props),

	printLog("onLoadVariant:~p,~p", [RoleID, time2:getTimestampMS()]),
    onLoadVariant(RoleID),

	printLog("onLoadDailyCounter:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadDailyCounter(RoleID),

	printLog("onLoadPlayerTeam:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadPlayerTeam(RoleID),

	printLog("onLoadAchieve:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadAchieve(RoleID),

	printLog("onLoadRoleData_Scene end:~p,~p", [RoleID, time2:getTimestampMS()]),
	ok.

onLoadRoleBase(#rec_base_role{roleID = RoleID} = RoleBase) ->
	%% 加载基础信息
	playerLogin:onLoadRoleDataAck([RoleBase]),
	playerSave:updateRoleLogin(RoleBase),

    case ets:lookup(ets_rec_playerdata, RoleID) of
        [#rec_playerdata{} = PlayerData] ->
            playerState2:setPlayerData(PlayerData),

            %% 加载进入场景依赖的数据
            onLoadRoleData_Scene(PlayerData),

            %% 尝试进入场景
            playerLogin:tryToOnlineEnterMap(),

            %% 加载角色其它信息
            onLoadRoleData_Other(PlayerData),

            ok;
        _ ->
            ?ERROR_OUT("onLoadRoleBase:~p", [RoleID]),
            skip
    end,
	ok.

onLoadGoods(RoleID) ->
	printLog("onLoadGoods-1:~p,~p", [RoleID, time2:getTimestampMS()]),
	{ItemList,EquipList} = getGoodsList(RoleID),
	printLog("onLoadGoods-2:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadRoleDataAck(ItemList),
	printLog("onLoadGoods-3:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadRoleDataAck(EquipList),
	printLog("onLoadGoods-4:~p,~p", [RoleID, time2:getTimestampMS()]),
	ok.

getGoodsList(RoleID) ->
	printLog("onLoadGoods-1-1:~p,~p", [RoleID, time2:getTimestampMS()]),
	List = mnesia:dirty_index_read(rec_item,RoleID,#rec_item.roleID),
	printLog("onLoadGoods-1-2:~p,~p", [RoleID, time2:getTimestampMS()]),
	Fun = fun(#rec_item{
		pos = Pos
	} = Item,{ItemAccIn,EquipAccIn}) ->
		case Pos > 0 of
			true ->
				case  itemUtils:makeEquipRecFromItem(RoleID, Item) of
					#recSaveEquip{} = RecEquip ->
						{ItemAccIn, [RecEquip| EquipAccIn]};
					_ ->
						{[Item | ItemAccIn],EquipAccIn}
				end;
			_ ->
				{ItemAccIn,EquipAccIn}
		end
	end,
	lists:foldl(Fun,{[],[]},List).

onLoadPackageInfo(RoleID) ->
	Match = #rec_package_info{roleID = {RoleID, _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_package_info, Match),
	onLoadRoleDataAck(List),
	ok.

onLoadSkill(RoleID) ->
	Match = #rec_skill{roleID = {RoleID, _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_skill, Match),
	onLoadRoleDataAck(List),
	ok.

onLoadSkillSlot(RoleID) ->
	Match = #rec_skill_slot{roleID = {RoleID, _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_skill_slot, Match),
	onLoadRoleDataAck(List),
	ok.

onLoadTask({_RoleID, AcceptL, SubmitL}) ->
	onLoadRoleDataAck(AcceptL),
	onLoadRoleDataAck(SubmitL),
	ok.

onLoadTitle(RoleID) ->
	Match = #rec_title{roleID = {RoleID, _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_title, Match),
	onLoadRoleDataAck(List),
	ok.

onLoadExtRole(RoleID) ->
    List = edb:dirtyReadRecord(rec_ext_role,RoleID),
    onLoadRoleDataAck(List),
    ok.

onLoadAwake(RoleID) ->
	Match = #rec_awaken_info{roleID = {RoleID, _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_awaken_info, Match),
	onLoadRoleDataAck(List),
	ok.

onLoadDrop(RoleID) ->
	Match = #rec_player_drop{roleID = {RoleID, _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_player_drop, Match),
	onLoadRoleDataAck(List),
	ok.

onLoadAchieve(RoleID) ->
	Match = #rec_achieve{roleID = {RoleID, _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_achieve, Match),
	onLoadRoleDataAck(List),
	ok.

onLoadBadge(RoleID) ->
	Match = #rec_badge{roleID = {RoleID, _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_badge, Match),
	onLoadRoleDataAck(List),
	ok.

onLoadPet(RoleID) ->
	printLog("onLoadPet-1:~p,~p", [RoleID, time2:getTimestampMS()]),
	Match = #rec_pet_info{roleID = {RoleID, _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_pet_info, Match),
	printLog("onLoadPet-2:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadRoleDataAck(List),
	printLog("onLoadPet-3:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadPetEquip(RoleID),
	printLog("onLoadPet-4:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadPetSkill(RoleID),
	printLog("onLoadPet-5:~p,~p", [RoleID, time2:getTimestampMS()]),
	ok.

onLoadPetEquip(RoleID) ->
	Match = #rec_pet_equip{roleID = {RoleID, _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_pet_equip, Match),
	printLog("onLoadPet-3-1:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadRoleDataAck(List),
	printLog("onLoadPet-3-2:~p,~p", [RoleID, time2:getTimestampMS()]),
	ok.

onLoadPetSkill(RoleID) ->
	Match = #rec_pet_skill{roleID = {RoleID, _ = '_', _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_pet_skill, Match),
	printLog("onLoadPet-4-1:~p,~p", [RoleID, time2:getTimestampMS()]),
	onLoadRoleDataAck(List),
	printLog("onLoadPet-4-2:~p,~p", [RoleID, time2:getTimestampMS()]),
	ok.

onLoadPetManorBattle(RoleID) ->
	Match = #rec_pet_manor_battle{roleID = RoleID, _ = '_'},
	List = edb:dirtyMatchRecord(rec_pet_manor_battle, Match),
	onLoadRoleDataAck(List),
	ok.

onLoadPetDunInfo(RoleID) ->
	Match = #rec_pet_dungeon_info{roleID = RoleID, _ = '_'},
	List = edb:dirtyMatchRecord(rec_pet_dungeon_info, Match),
	onLoadRoleDataAck(List),
	ok.

onLoadPetDunScore(RoleID) ->
	Sql = qlc:q([
		#rec_pet_dungeon_score{roleID = RID, dungeon_ID = DID, dungeon_score = DS}
		|| #rec_pet_dungeon_score{roleID = {RID, _}, dungeon_ID = DID, dungeon_score = DS} <- mnesia:table(rec_pet_dungeon_score), RID =:= RoleID]),
	List = edb:selectRecord(Sql),
	onLoadRoleDataAck(List),
	ok.

onLoadRefine(RoleID) ->
	L = getEquipRefineInfoList(RoleID),
	onLoadRoleDataAck(L),
	ok.

onLoadPlayerProp(List) ->
	onLoadRoleDataAck(List),
	ok.

onLoadFashion(RoleID) ->
	Match = #rec_role_fashions{roleID = {RoleID, _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_role_fashions, Match),
	Fun = fun(#rec_role_fashions{
		fashionID = FID,				%%时装Id int(1) unsigned
		endTime = ET					%%结束时间 int(10) unsigned
	},AccIn) ->
		[#recFashion{
			roleID 	= RoleID,			%%角色ID
			fashionID = FID,			%%时装Id int(1) unsigned
			endTime = ET				%%结束时间 int(10) unsigned
		} | AccIn]
	end,
	L = lists:foldl(Fun,[],List),
	onLoadRoleDataAck(L),
	ok.

onLoadFashionSlot(RoleID) ->
	L = getFashionBody(RoleID),
	onLoadRoleDataAck(L),
	ok.

onLoadPlayerClock(RoleID) ->
	Match = #rec_player_clock{roleID = {RoleID, _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_player_clock, Match),
	onLoadRoleDataAck(List),
	ok.
onLoadVariant(RoleID) ->
	Match = #rec_variant0{roleID = {RoleID, _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_variant0, Match),
	onLoadRoleDataAck(List),
	ok.
onLoadDailyCounter(RoleID) ->
	Match = #rec_daily_counter0{roleID = {RoleID, _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_daily_counter0, Match),
	onLoadRoleDataAck(List),
	ok.
onLoadBuffList(RoleID) ->
	Match = #rec_buff{roleID = {RoleID, _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_buff, Match),
	onLoadRoleDataAck(List),
	ok.

onLoadItemUsedCD(RoleID) ->
	Match = #rec_item_used_cd{roleID = {RoleID, _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_item_used_cd, Match),
	onLoadRoleDataAck(List),
	ok.

onLoadTalentInfo(RoleID) ->
	case edb:dirtyReadRecord(rec_talent,RoleID) of
		[#rec_talent{
			roleID = RoleID,					%%玩家ID bigint(20) unsigned
			propIntensify = V1,					%%属性强化等级 tinyint(7) unsigned
			phyDefIntensify = V2,				%%物防强化等级 tinyint(7) unsigned
			magDefIntensify = V3,				%%魔防强化等级 tinyint(7) unsigned
			petDamIntensify = V4,				%%宠物伤害强化等级 tinyint(7) unsigned
			petDefIntensify = V5				%%宠物防御强化等级 tinyint(7) unsigned
		}] ->
			TI = #rec_talent{
				roleID = RoleID,					%%玩家ID bigint(20) unsigned
				propIntensify = V1,					%%属性强化等级 tinyint(7) unsigned
				phyDefIntensify = V2,				%%物防强化等级 tinyint(7) unsigned
				magDefIntensify = V3,				%%魔防强化等级 tinyint(7) unsigned
				petDamIntensify = V4,				%%宠物伤害强化等级 tinyint(7) unsigned
				petDefIntensify = V5				%%宠物防御强化等级 tinyint(7) unsigned
			},
			playerTalent:getTalentInfoAck(TI);
		_ ->
			playerTalent:getTalentInfoAck(#rec_talent{roleID = RoleID})
	end,
	ok.

onLoadGodWeaponInfo(RoleID) ->
	Match = #rec_god_weapon{roleID = {RoleID, _ = '_'}, _ = '_'},
	List = edb:dirtyMatchRecord(rec_god_weapon, Match),
	playerGodWeapon:getWeaponInfoAck(List),
	ok.
onLoadWarriorTrialInfo(RoleID) ->
	case edb:dirtyReadRecord(rec_warrior_trial,RoleID) of
		[#rec_warrior_trial{roleID = RoleID,trialSchedule = TS, tswkTrialSchedule = TTS, tswkTrialTime = TTT}] ->
			playerWarriorTrial:setWarriorTrialInfoAck(#rec_warrior_trial{roleID = RoleID,trialSchedule = TS,tswkTrialSchedule = TTS,tswkTrialTime = TTT});
		_ ->
			playerWarriorTrial:setWarriorTrialInfoAck(#rec_warrior_trial{roleID = RoleID,trialSchedule = 0,tswkTrialSchedule = 0,tswkTrialTime = 0})
	end,
	ok.
onLoadPlayerTeam(RoleID) ->
%%	Match = #rec_player_team{roleID = {RoleID, _ = '_'}, _ = '_'},
%%	List = edb:dirtyMatchRecord(rec_player_team, Match),
%%	playerTeam2:getTeamIDs(List),
	ok.

onLoadRoleDataAck([]) ->
	ok;
onLoadRoleDataAck(List) when erlang:is_list(List) ->
	playerLogin:onLoadRoleDataAck(List),
	ok.

onLoadPlayerLiveness(RoleID) ->
	Match = #rec_player_liveness{playerID = RoleID, _ = '_'},
	List = edb:dirtyMatchRecord(rec_player_liveness, Match),
	?DEBUG_OUT("onLoadPlayerLiveness ~p",[List]),
	playerliveness:onPlayerOnlineInit(List),
	ok.

onLoadPlayerHolidayTask(RoleID) ->
	Match = #rec_holiday_task{playerID = RoleID, _ = '_'},
	TaskList = edb:dirtyMatchRecord(rec_holiday_task, Match),
	?DEBUG_OUT("onLoadPlayerHolidayTask ~p",[TaskList]),
	case TaskList of
		[]-> playerHolidayTask:initHolidayTask(0);
		[Task | _]->
			playerHolidayTask:initHolidayTask(Task)
	end,
	ok.

onLoadPlayerRune(RoleID) ->
	Match = #recRune{roleID = RoleID, _ = '_'},
	List = edb:dirtyMatchRecord(recRune, Match),
%%	?DEBUG_OUT("onLoadPlayerRune:~p,~p", [RoleID, List]),
	playerRune:loadRuneData(List),
	ok.

printLog(String, ParamList) ->
	?LOG_OUT(String, ParamList).