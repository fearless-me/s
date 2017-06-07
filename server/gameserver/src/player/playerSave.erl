%%
%% @author zhongyunawei
%% @doc @todo 玩家数据存储到数据库.
%%


-module(playerSave).
-author(zhongyuanwei).

-include("playerPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	saveInitRoleBase/0,
	savePlayer/1,
	saveRoleBase/1,
	offlineSavePlayerPre/0,
	offlineSavePlayer/0,
	saveRoleBase/0,
	updateRoleName/2,
	updateRoleLogin/1,
	saveAllSkill/1,
	saveNewSkillSlot/1,
	saveAchieve/1,
	saveBadge/1,
	saveGoods/1,
	saveRefine/2,
	saveEquipStar/1,
	saveNewTitle/2,
	saveInSertTitle/2,
	savePet/1,
	savePet/2,
	savePetEquip/1,
	savePetSkill/2,
	savePetSkill/3,
	saveVariant/2,
	saveDailyCounter/0,
	saveFashion/1,
	saveFashionSlot/0,
	savePackageInfo/1,
	savePersonalityInfo/1,
	savePlayerClock/1,
	saveAWaken/1,
	saveDrop/1,
	saveCanReName/2,
	savePetDunScore/1,
	savePetDunInfo/1,
	savePetManorBattle/1,
	saveUpdateReward/1,
	savePlayerMSShop/2,
	saveWarriorTrialInfo/1,
	saveTalent/1,
	saveGodWeaponInfo/1,
	deleteTitle/2,
    clearAccount/1
]).

-export([
	deleteGoods/1,
	deleteRoleCache/1,
	deleteRoleCache/2, %该接口会被跨进程调用
	deleteRole/1,
	deleteBuff/0
]).

-export([changeGoodsOwner/3]).

-export([getEMysqlNowDateTime/0]).

%%定时10分钟保存玩家信息
-spec savePlayer(Now::uint()) -> ok.
savePlayer(Now) ->
	case playerState:getIsPlayer() of
		true ->
            RoleID = playerState:getRoleID(),
			case core:isCross() of
				false ->
                    playerState:setLastSaveTime(Now),
					?LOG_OUT("RoleID[~p] Name[~ts] SavePlayer",[RoleID,playerState:getName()]),

					saveRoleBase(),
					saveAllSkill(false),
					playerClock:saveClock(),
					playerPersonalityInfo:savePersonalityInfo(),
					playerWarriorTrial:saveWarriorTrialInfoDB(),
%%					playerTeam2:savePlayerTeam(),
					saveDailyCounter(),
					playerAchieve:saveAllAchieve(),
					playerPetPvE:savePetDunInfoAndScore(),

                    saveAcceptedTaskList(),

                    %% 定时保存重要数据 FIXME 这个一定要放在最后处理
                    updatePlayerDataToEts(),
                    gsSendMsg:sendMsg2PlayerDataMgr(tickSavePlayerData, {playerState:getAccountID(), RoleID}),
                    ok;
				_ ->
					skip
			end,
			myEts:updateEts(ets_rec_OnlinePlayer, RoleID, [{#rec_OnlinePlayer.playerSaveTime, Now}]),
			ok;
		_ ->
			skip
	end,
	ok.

offlineSavePlayerPre() ->
	case playerState:getIsPlayer() andalso not core:isCross() of
		true ->
			saveDailyCounter(),
			playerPetPvE:savePetDunInfoAndScore(),
			playerAchieve:saveAllAchieve(),
			playerConvoy:convoyFailedCallBack(),
			?LOG_OUT("RoleID[~p] Name[~ts] offlineSavePlayerPre",
				[playerState:getRoleID(),playerState:getName()]);
		_ ->
			skip
	end.

offlineSavePlayer() ->
	case playerState:getIsPlayer() andalso not core:isCross() of
		true ->
			RoleID = playerState:getRoleID(),
			AccountID = playerState:getAccountID(),
            %% 下线
			?DEBUG_OUT("==>delete oneline account id [~p]",[AccountID]),
			ets:delete(ets_rec_OnlineAccount, AccountID),
            ets:delete(ets_rec_OnlinePlayer, RoleID),
			playerScreen:deleteScreen(playerState:getPlayerCode()),

            %Now = time:getUTCNowMS(),
			?LOG_OUT("RoleID[~p] Name[~ts] offlineSavePlayer",[RoleID,playerState:getName()]),

			saveRoleBase(true),
			saveAllSkill(true),
			saveAcceptedTaskList(),
			saveBuffList(),
			saveDailyCounter(),
			playerAchieve:saveAllAchieve(),
			playerPetPvE:savePetDunInfoAndScore(),
			saveItemUsedCD(),
			saveFashionSlot(),
			playerClock:saveClock(),
			playerPersonalityInfo:savePersonalityInfo(),
			playerWarriorTrial:saveWarriorTrialInfoDB(),
%%			playerTeam2:savePlayerTeam(),
			playerChat:saveChatCd(),
			savePlayerLiveness(RoleID),
			saveHolidayTask(RoleID),

			updateRoleList(),

            %% 下线保存玩家所有数据 FIXME 这个一定要放在最后处理
            updatePlayerDataToEts(),
            gsSendMsg:sendMsg2PlayerDataMgr(offlineSavePlayerData, {playerState:getAccountID(), RoleID}),
			ok;
		_ ->
			skip
	end,
	ok.

%%下线更新角色列表信息
updateRoleList() ->
	%% 更新角色的关键数据
	playerRank:updatePlayerKeyInfo(),

	%% 更新一下自己的内存模型
	playerRank:updatePlayerDataInfo(),
	ok.

%% 更新玩家进程字典保存的数据到ETS内存
updatePlayerDataToEts() ->
    case playerState:getIsPlayer() of
        true ->
            RoleID = playerState:getRoleID(),

            %% 更新玩家属性
			L = lists:seq(#rec_playerdata.roleID + 1, #rec_playerdata.thisIsEndFlag - 1),
			F =
				fun(Index) ->
					{Index, playerState2:getPlayerDataElement(Index)}
				end,
			UpdateL = lists:map(F, L),
            ets:update_element(ets_rec_playerdata, RoleID, UpdateL),
            ok;
        _ ->
            skip
    end,
    ok.

deleteRoleCache(RoleID)->
	AccountID = playerState:getAccountID(),
	deleteRoleCache(AccountID, RoleID).

%%gm网站可以发个roleid来清指定角色缓存，所以需要保证能在其他进程调用,%该接口会被跨进程调用
-spec deleteRoleCache(AccountID, RoleID) -> boolean() when RoleID::uint(),AccountID::uint().
deleteRoleCache(AccountID,RoleID) ->
	case ets:lookup(ets_rec_base_role, RoleID) of
		[#rec_base_role{}] ->
			%%从缓存数据库中删除相关数据

			edb:dirtyDeleteRecord(rec_talent, RoleID),
			edb:dirtyDeleteRecord(rec_pet_manor_battle, RoleID),
			edb:dirtyDeleteRecord(rec_pet_dungeon_info, RoleID),
			edb:dirtyDeleteRecord(rec_personality_info, RoleID),

			[
				edb:dirtyDeleteRecord(rec_achieve,Key2)
				|| #rec_achieve{roleID = Key2}
				<- edb:dirtyMatchRecord(rec_achieve, #rec_achieve{roleID = {RoleID, _ = '_'}, _ = '_'})
			],

			[
				edb:dirtyDeleteRecord(rec_awaken_info,K3)
				|| #rec_awaken_info{roleID = K3}
				<- edb:dirtyMatchRecord(rec_awaken_info, #rec_awaken_info{roleID = {RoleID, _ = '_'}, _ = '_'})
			],

			[
				edb:dirtyDeleteRecord(rec_badge,K4)
				|| #rec_badge{roleID = K4}
				<- edb:dirtyMatchRecord(rec_badge, #rec_badge{roleID = {RoleID, _ = '_'}, _ = '_'})
			],

			[
				edb:dirtyDeleteRecord(rec_buff,K5)
				|| #rec_buff{roleID = K5}
				<- edb:dirtyMatchRecord(rec_buff, #rec_buff{roleID = {RoleID, _ = '_'}, _ = '_'})
			],

			[
				edb:dirtyDeleteRecord(rec_daily_counter0,K6)
				|| #rec_daily_counter0{roleID = K6}
				<- edb:dirtyMatchRecord(rec_daily_counter0, #rec_daily_counter0{roleID = {RoleID, _ = '_'}, _ = '_'})
			],

			[
				edb:dirtyDeleteRecord(rec_equip_refine_info,K7)
				|| #rec_equip_refine_info{roleID = K7}
				<- edb:dirtyMatchRecord(rec_equip_refine_info, #rec_equip_refine_info{roleID = {RoleID, _ = '_'}, _ = '_'})
			],

			[
				edb:dirtyDeleteRecord(rec_fashion_slot,K8)
				|| #rec_fashion_slot{roleID = K8}
				<- edb:dirtyMatchRecord(rec_fashion_slot, #rec_fashion_slot{roleID = {RoleID, _ = '_'}, _ = '_'})
			],

			[
				edb:dirtyDeleteRecord(rec_pet_equip,K9)
				|| #rec_pet_equip{roleID = K9}
				<- edb:dirtyMatchRecord(rec_pet_equip, #rec_pet_equip{roleID = {RoleID, _ = '_'}, _ = '_'})
			],

			[
				edb:dirtyDeleteRecord(rec_pet_info,K10)
				|| #rec_pet_info{roleID = K10}
				<- edb:dirtyMatchRecord(rec_pet_info, #rec_pet_info{roleID = {RoleID, _ = '_'}, _ = '_'})
			],

			[
				edb:dirtyDeleteRecord(rec_player_clock,K11)
				|| #rec_player_clock{roleID = K11}
				<- edb:dirtyMatchRecord(rec_player_clock, #rec_player_clock{roleID = {RoleID, _ = '_'}, _ = '_'})
			],

			[
				edb:dirtyDeleteRecord(rec_role_fashions,K13)
				|| #rec_role_fashions{roleID = K13}
				<- edb:dirtyMatchRecord(rec_role_fashions, #rec_role_fashions{roleID = {RoleID, _ = '_'}, _ = '_'})
			],

			[
				edb:dirtyDeleteRecord(rec_skill,K14)
				|| #rec_skill{roleID = K14}
				<- edb:dirtyMatchRecord(rec_skill, #rec_skill{roleID = {RoleID, _ = '_'}, _ = '_'})
			],

			[
				edb:dirtyDeleteRecord(rec_skill_slot,K15)
				|| #rec_skill_slot{roleID = K15}
				<- edb:dirtyMatchRecord(rec_skill_slot, #rec_skill_slot{roleID = {RoleID, _ = '_'}, _ = '_'})
			],

			[
				edb:dirtyDeleteRecord(rec_title,K18)
				|| #rec_title{roleID = K18}
				<- edb:dirtyMatchRecord(rec_title, #rec_title{roleID = {RoleID, _ = '_'}, _ = '_'})
			],

			[
				edb:dirtyDeleteRecord(rec_variant0,K19)
				|| #rec_variant0{roleID = K19}
				<- edb:dirtyMatchRecord(rec_variant0, #rec_variant0{roleID = {RoleID, _ = '_'}, _ = '_'})
			],

			[
				edb:dirtyDeleteRecord(rec_pet_dungeon_score,K20)
				|| #rec_pet_dungeon_score{roleID = K20}
				<- edb:dirtyMatchRecord(rec_pet_dungeon_score, #rec_pet_dungeon_score{roleID = {RoleID, _ = '_'}, _ = '_'})
			],


            ets:delete(ets_rec_base_role, RoleID),
            ets:delete(ets_rec_playerdata, RoleID),
            ets:delete(ets_rec_OnlinePlayer, RoleID),

            clearAccount(AccountID),

			true;
		_ ->
			false
	end.

clearAccount(AccountID) ->
    ets:delete(ets_recRoleList, AccountID),
    ok.

deleteRole(RoleID) ->
    deleteRoleCache(RoleID),

	%%不管缓存中是否有数据，都需要立即从数据库中删除，不能让update表去写入数据库
	%%因为update表写入数据库是定时写的，如果还没有写入的时候，玩家下线再上线就还会看到角色没删除
	gsSendMsg:sendMsg2DBServer(deleteRole,playerState:getAccountID(),{RoleID}),
	ok.


%%保存玩家基本信息
saveRoleBase() ->
	saveRoleBase(false),
	ok.

saveInitRoleBase() ->
	RoleID = playerState:getRoleID(),
	[#rec_base_role{} = BaseRole] = ets:lookup(ets_rec_base_role, RoleID),
	updateRoleLogin(BaseRole),
	ok.

updateRoleLogin(#rec_base_role{} = RB) ->
	LastLoginTime = getEMysqlNowDateTime(),
	RoleBase = RB#rec_base_role{lastLoginTime = LastLoginTime},
	updateRoleBase(RoleBase).

saveRoleBase(IsOffline) ->
	case playerState:getIsPlayer() of
		true ->
			case core:isCross() of
				true ->skip;
				_ ->
					RoleID = playerState:getRoleID(),
					[#rec_base_role{} = BaseRole] = ets:lookup(ets_rec_base_role, RoleID),
					%%有记录更新
					case IsOffline of
						true ->
							Sec = time2:getLocalDateTimeSec(),
							DateTime = time:convertSec2DateTime(Sec),
							LastLoginTime = time:dateTimeToInt64(BaseRole#rec_base_role.lastLoginTime),
							CurOnlineTime = Sec - LastLoginTime,
							TotalOnlineTime = BaseRole#rec_base_role.totalOnlineTime + CurOnlineTime,
							NewBaseRole = BaseRole#rec_base_role{
								isOnline = 0,
								lastLogoutTime = {datetime,DateTime},
								totalOnlineTime = TotalOnlineTime,
								denyChatTime = playerState:getDenyChatTime()
							},
							updateRoleBase(NewBaseRole);
						%%这里需要立即更新数据库的是否在线字段
						%%gsSendMsg:sendMsg2DBServer(updateIsOnline, playerState:getAccountID(), {RoleID,0});
						_ ->
							updateRoleBase(BaseRole)
					end
			end;
		_ ->
			skip
	end,
	ok.

updateRoleBase(#rec_base_role{roleID = RoleID} = BaseRole) ->
	case playerState:getIsPlayer() of
		true ->
			{X,Y,OldMapId,OldX, OldY} =
				case playerState:getPos() of
					{X0,Y0} ->
						{OldMapId0, OldX0, OldY0} = getOldMapPos(),
						{X0,Y0,OldMapId0,OldX0, OldY0};
					_ ->
						{0.0,0.0,0,0.0,0.0}
				end,

			RoleBase = #rec_base_role{
				roleID = RoleID,													%%玩家角色唯一ID bigint(20) unsigned
				roleName = playerState:getName(),									%%玩家的角色名 varchar(32)
				accountID = playerState:getAccountID(),								%%玩家账号唯一ID bigint(20) unsigned
				sex = BaseRole#rec_base_role.sex,			    					%%性别,0为女，1为男 tinyint(1) unsigned
				camp = BaseRole#rec_base_role.camp,									%%阵营 tinyint(4) unsigned
				career = playerState:getCareer(),									%%职业 tinyint(4) unsigned
				race =  playerState:getRace(),
				mapID = playerState:getMapID(),										%%玩家当前所在的地图ID smallint(6) unsigned
				x = X,																%%玩家所在地图的X坐标 float
				y = Y,																%%玩家所在地图的Y坐标 float
				oldMapID = OldMapId,												%%玩家进入副本前所在地图ID smallint(6) unsigned
				oldX = OldX,														%%进入副本前所在的X float
				oldY = OldY,														%%进入副本前所在的Y float
				pkMode = playerState:getPkStatus(),									%%玩家Pk状态 tinyint(4) unsigned
				level = playerState:getLevel(),										%%玩家的当前等级 tinyint(4) unsigned
				exp = playerState:getCurExp(),										%%玩家经验 int(10) unsigned
				hp = playerState:getCurHp(),										%%玩家当前生命值 int(10) unsigned
				mp = BaseRole#rec_base_role.mp,										%%当前魔法 int(10) unsigned
				reputation = playerPropSync:getProp(?PriProp_Reputation),			%%爵位声望(只增不减) int(10) unsigned
				power = BaseRole#rec_base_role.power,								%%每个职业的能量值 int(11) unsigned
				achieve = playerPropSync:getProp(?PriProp_Achieve),					%%成就 int(11) unsigned
				createTime = BaseRole#rec_base_role.createTime,						%%角色创建时间 datetime
				lastLoginTime = BaseRole#rec_base_role.lastLoginTime,				%%上次登录时间 datetime
				lastLogoutTime = BaseRole#rec_base_role.lastLogoutTime,				%%上次下线时间 datetime
				denyChatTime = BaseRole#rec_base_role.denyChatTime,					%%禁言时间(unix_time,转换成秒是为了方便比较) bigint(20) unsigned
				deleteTime = BaseRole#rec_base_role.deleteTime,						%%删除时间 datetime
				isOnline = BaseRole#rec_base_role.isOnline,							%%是否在线 tinyint(1) unsigned
				totalOnlineTime = BaseRole#rec_base_role.totalOnlineTime,			%%累计在线时长，单位：秒 bigint(20) unsigned
				lastTransferMapTime = playerState:getTransferMapTime()				%%上次使用小地图传送的Unix UTC时间，单位秒 int(10) unsigned
			},
            ets:insert(ets_rec_base_role, RoleBase),

            gsSendMsg:sendMsg2DBServer(updateRole,playerState:getAccountID(),RoleBase),

			%% 保存玩家的货币
			updateRoleCoin(RoleID),
			ok;
		_ ->
			skip
	end,
	ok.

%% 保存玩家的货币
-spec updateRoleCoin(RoleID::uint64()) -> ok.
updateRoleCoin(RoleID) ->
	L1 = lists:seq(?CoinTypeMin, ?CoinTypeMax),
	L2 = lists:delete(?CoinTypeExploit, L1),

	Fun =
		fun(CoinType) ->
			Value = playerState:getCoin(CoinType),
			Key = {RoleID, CoinType},
			Rec = #rec_player_coin{roleID = Key, coinType = CoinType, coinNumber = Value},
			edb:dirtySave(rec_player_coin,Key,Rec,new_rec_player_coin,update_rec_player_coin)
		end,
	lists:foreach(Fun, L2),
	ok.

-spec updateRoleName(RoleID::uint64(),Name::string()) -> ok.
updateRoleName(RoleID,Name) ->
%%	[#rec_base_role{} = BaseRole] = ets:lookup(ets_rec_base_role, RoleID),
%%	Name = playerState:getName(),
%%	NewRoleBase = BaseRole#rec_base_role{roleName = Name},
%%	myEts:changeField()
%%	?DEBUG_OUT("NewRoleBase = ~p", [NewRoleBase]),
%%	edb:writeRecord(NewRoleBase),
	%%需要及时存储名字
	ets:update_element(ets_rec_base_role, RoleID, {#rec_base_role.roleName, Name}),
	gsSendMsg:sendMsg2DBServer(changeNewName, playerState:getAccountID(), {RoleID, Name}),
	%% 添加到内存表
	#?RoleKeyRec{} = core:queryRoleKeyInfoByRoleID(RoleID),
    gsSendMsg:sendMsg2PublicDMSaveData({?RoleKeyRec, RoleID, [{#?RoleKeyRec.roleName, Name}]}),
	ok.

%% 定时保存时，不计算技能CD，只有下线保存时才计算CD时间
-spec saveAllSkill(IsCalcSkillCD::boolean()) -> ok.
saveAllSkill(IsCalcSkillCD) ->
	case playerState:getIsPlayer() of
		true ->
			%% 保存技能
			RoleID = playerState:getRoleID(),

			%% 进程字典中的技能列表
			SkillList = playerState:getSkill(),
			F =
				fun(#recSkill{skillID = SkillID, level = Level}) ->
					Key = {RoleID, SkillID},
					#rec_skill{
						roleID = Key,
						skillID = SkillID,
						level = Level,
						lastUseTime = getSkillCD(SkillID, IsCalcSkillCD)
					}
				end,
			ProcessSkillList = lists:map(F, SkillList),

			%% 内存数据库中的技能列表
			Sql = qlc:q([Skill || #rec_skill{roleID = {RID, _}} = Skill <- mnesia:table(rec_skill), RID =:= RoleID]),
			MemSkillList = edb:selectRecord(Sql),

			%% 过滤掉没有改变的
			NeedSaveList = lists:filter(fun(DA) -> not lists:member(DA, MemSkillList) end, ProcessSkillList),

			%% 保存改变的
			F2 =
				fun(#rec_skill{roleID = Key} = Skill) ->
					edb:dirtySave(rec_skill, Key, Skill, new_rec_skill, update_rec_skill)
				end,
			lists:foreach(F2, NeedSaveList),

			%% 保存插槽技能
			SkillSlotList = getSaveSlotSkill(RoleID),
			Fun1 =
				fun(#rec_skill_slot{slot = Slot} = SkillSlot) ->
					Key = {RoleID,Slot},
					edb:dirtySave(rec_skill_slot,Key,SkillSlot#rec_skill_slot{roleID = Key},new_rec_skill_slot,update_rec_skill_slot)
				end,
			lists:foreach(Fun1,SkillSlotList);
		_ ->
			skip
	end,
	ok.

%%保存技能槽
-spec saveNewSkillSlot(Slot) -> ok when Slot::uint().
saveNewSkillSlot(Slot) ->
	case playerState:getIsPlayer() of
		true ->
			RoleID = playerState:getRoleID(),
			Key = {RoleID,Slot},
			SkillSlot = #rec_skill_slot{roleID = Key,slot = Slot,skillID = 0},
			edb:dirtySave(rec_skill_slot,Key,SkillSlot,new_rec_skill_slot,update_rec_skill_slot);
		_ ->
			skip
	end.

%%获取技能CD时间
-spec getSkillCD(SkillID::uint(), IsCalcSkillCD::boolean()) -> uint().
getSkillCD(_SkillID, false) ->
	0;
getSkillCD(SkillID, true) ->
	SkillListCD = playerState:getSkillCD(),
	case lists:keyfind(SkillID, 1, SkillListCD) of
		{SkillID, Time} ->
			Time;
		_ ->
			0
	end.

%%获取需要保存的技能槽
-spec getSaveSlotSkill(RoleID) -> list() when
	RoleID :: uint().
getSaveSlotSkill(RoleID) ->
	SlotList = playerState:getSlotList(),
	SlotSkill = playerState:getSlotSkill(),
	DelList = playerState:getDelSlotSkillList(),
	Fun = fun({Index, IsOpen}, Acc) ->
		case IsOpen of
			true ->
				case lists:keyfind(Index, #recSlotSkill.slot, SlotSkill) of
					#recSlotSkill{skillID = SkillID,isModified = true} ->
						[#rec_skill_slot{roleID = RoleID, slot = Index, skillID = SkillID} | Acc];
					_ ->
						%%没有找到，可能已经被删除，查看是否有删除记录
						case lists:keyfind(Index,1,DelList) of
							false ->
								Acc;
							_ ->
								[#rec_skill_slot{roleID = RoleID, slot = Index, skillID = 0} | Acc]
						end
				end;
			_ ->
				Acc
		end
	end,
	RetList = lists:foldl(Fun, [], SlotList),
	playerState:setDelSlotSkillList([]),
	RetList.

%%保存成就
-spec saveAchieve(#recAchieve{}) -> ok.
saveAchieve(#recAchieve{
	aID = AchieveID,
	aScheduleLevel = AchieveSID,
	aScheduleGetLevel = AchieveLevel,
	aScheduleNum  = AchieveSnum
	}) ->
	RoleID = playerState:getRoleID(),
	Key = {RoleID,AchieveID},
	Ach = #rec_achieve{
		roleID = Key,
		achieveID  = AchieveID,
		achieveSID  = AchieveSID,
		achieveLevel  = AchieveLevel,
		achieveSnum = AchieveSnum
	},
	edb:dirtySave(rec_achieve,Key,Ach,new_rec_achieve,update_rec_achieve),
	ok.

%%保存徽章进度
-spec saveBadge(#recBadge{}) -> ok.
saveBadge(#recBadge{
	mapID = MapID,
	itemList = ItemList
}) ->
	RoleID = playerState:getRoleID(),
	Key = {RoleID,MapID},
	Badge = #rec_badge{
		roleID = Key,
		mapID = MapID,
		items  = ItemList
	},
	edb:dirtySave(rec_badge,Key,Badge,new_rec_badge,update_rec_badge),
	ok.

deleteGoods(ItemUID) ->
	case edb:dirtyReadRecord(rec_item,ItemUID) of
		[#rec_item{} = Item] ->
			%%最后从缓存数据库中删除
			edb:deleteRecord(rec_item,ItemUID),

			%% 告诉数据库需要删除
			DeleteTime = getEMysqlNowDateTime(),
			NewItem = Item#rec_item{deleteTime = DeleteTime},
			gsSendMsg:sendMsg2DBServer(save_item_data,  playerState:getAccountID(), {delete, NewItem}),
			true;
		_ ->
			false
	end.

deleteBuff() ->
	case playerState:getIsPlayer() of
		true ->
			RoleID = playerState:getRoleID(),
			%%删除内存数据库中的BUFF
			F = fun() ->
				AllKey = mnesia:all_keys(rec_buff),
				Fun = fun({ID, _} = Key) ->
					case ID =:= RoleID of
						true ->
							mnesia:delete({rec_buff,Key}),
							mnesia:delete({new_rec_buff,Key}),
							mnesia:delete({update_rec_buff,Key});
						_ ->
							skip
					end
				 end,
				lists:foreach(Fun,AllKey),
				AllKey
			end,
			case mnesia:transaction(F) of
				{atomic, []} ->
					ok;
				{atomic, _Val} ->
					%%向数据库请求删除BUFF
					gsSendMsg:sendMsg2DBServer(deleteBuff,playerState:getAccountID(), {RoleID}),
					ok;
				Error ->
					?WARN_OUT("Error:~p",[Error]),
					error
			end;
		_ ->
			skip
	end,
	ok.

deleteTitle(RoleID,TitleID)->
	Key = {RoleID,TitleID},
	case edb:deleteDBMemSave(rec_title,new_rec_title,update_rec_title,Key) of
		true ->
			%%从new表中查到有记录，则说明还没有插入到数据库，不需要从数据库中删除
			skip;
		_ ->
			gsSendMsg:sendMsg2DBServer(deleteTitle,playerState:getAccountID(), {RoleID, TitleID})
	end,
	ok.

saveGoods(#rec_item{
					itemUID = UID,							%%道具UID
					itemID = ItemID,					    %%道具ID
					isBind = IsBind,				    	%%是否绑定
					isLocked = IsLocked					
				   } = Item)
	when (erlang:is_boolean(IsBind) orelse IsBind =:= 1 orelse IsBind =:= 0),
	(erlang:is_boolean(IsLocked) orelse IsLocked =:= 1 orelse IsLocked =:= 0),
	ItemID < ?Item_Differentiate ->
	case goods:getGoodsCfg(ItemID) of
		#itemCfg{} ->
			saveItemData(rec_item, UID, Item),
			ok;
		_ ->
			?ERROR_OUT("player:~p Error Save Item:~p,not cfg in item_cfg,~p",[playerState:getRoleID(),Item,misc:getStackTrace()])
	end;
saveGoods(#recSaveEquip{
	roleID = RoleID,					%%角色ID
	itemUID = UID,						%%道具UID
	itemID = ItemID,					%%道具ID
	pos = Pos,							%%背包类型
	recastCount = Count,				%%重叠次数
	isBind = IsBind,				    %%是否绑定
	isLocked = IsLocked,				%%是否锁定
	quality = Q,        				%%品质
	createTime = CT,                    %%创建时间
	deleteTime = DT,					%%删除时间
	expiredTime = ET,                   %%过期时间
	baseProp = #rec_equip_base_info{equipUID = UID} = BP,
	extProp = #rec_equip_ext_info{} = ExtP,
	enhanceProp = #rec_equip_enhance_info{equipUID = UID} = EnhP
} = SaveEquip) when ItemID > ?Item_Differentiate ->
	case goods:getGoodsCfg(ItemID) of
		#equipmentCfg{} ->
			case Pos =:= ?Item_Location_Equip_Bag orelse Pos =:= ?Item_Location_Equip_Storage orelse
				Pos =:= ?Item_Location_BodyEquipBag orelse Pos =:= ?Item_Location_Recycle of
				true ->
					skip;
				_ ->
					?ERROR_OUT("player:~p Error Save Equip:~p,Error Equip Pos",[playerState:getRoleID(),SaveEquip]),
					%%这里抛出异常，中断后续的流程，打印出堆栈
					throw("Error Pos Save Equip")
			end;
		_ ->
			?ERROR_OUT("player:~p Error Save Equip:~p,not cfg in equip_cfg",[playerState:getRoleID(),SaveEquip]),
			%%这里抛出异常，中断后续的流程，打印出堆栈
			throw("Error Save Equip")
	end,

%%	BPInfo = erlang:setelement(1,BP,rec_equip_base_info),
%%	EnhPropInfo = erlang:setelement(1,EnhP,rec_equip_enhance_info),
%%	ExtPropInfo = erlang:setelement(1,ExtP,rec_equip_ext_info),

	Item = #rec_item{
		itemUID = UID,					%%道具UID bigint(20) unsigned
		roleID = RoleID,				%%角色ID bigint(20) unsigned
		itemID = ItemID,				%%道具ID smallint(6)
		pos = Pos,						%%背包类型 smallint(6)
		pileNum = 1,					%%堆叠数量 smallint(6)
		recastCount = Count,			%%重铸次数 smallint(6)
		isBind = IsBind,				%%是否绑定 tinyint(1) unsigned
		isLocked = IsLocked,			%%玩家是否自己锁定 tinyint(1) unsigned
		quality = Q,					%%品质 tinyint(4) unsigned
		deleteTime = DT,				%%删除时间 datetime
		createTime = CT,
		expiredTime = ET,
		equipBase = BP,
		equipEnhance = EnhP,
		equipExt = ExtP
	},


	%AccountD = playerState:getAccountID(),

	%% rec_item
	saveItemData(rec_item, UID, Item),

	%% rec_equip_base_info
%%	saveItemData(rec_equip_base_info, UID, BPInfo),

	%% rec_equip_enhance_info
%%	saveItemData(rec_equip_enhance_info, UID, EnhPropInfo),

%%	%% rec_equip_ext_info
%%	case ExtUID > 0 of
%%		true ->
%%			saveItemData(rec_equip_ext_info, UID, ExtPropInfo);
%%		_ ->
%%			skip
%%	end,
	ok.

saveItemData(Table, Key, Item) ->
	case edb:dirtyReadRecord(Table, Key) of
		[Item] ->
			skip;
		[] ->
			%% 插入
			edb:dirtyWriteRecord(Table, Item),
			gsSendMsg:sendMsg2DBServer(save_item_data, playerState:getAccountID(), {insert, Item});
		_ ->
			%% 更新
			edb:dirtyWriteRecord(Table, Item),
			gsSendMsg:sendMsg2DBServer(save_item_data, playerState:getAccountID(), {update, Item})
	end,
	ok.

%%保存精炼等级
-spec saveRefine(Type::uint(), Level::uint()) -> ok.
saveRefine(Type, Level) ->
	RoleID = playerState:getRoleID(),
	L = playerState:getEquipStarList(), 
	case lists:keyfind(Type, #recEquipStar.pos, L) of
		false ->
			Prog = 0,
			Bless = 0,
			Star = 0;
		#recEquipStar{} = E ->
			Prog = E#recEquipStar.prog,
			Bless = E#recEquipStar.bless,
			Star = E#recEquipStar.star
	end,
	Key = {RoleID,Type},
	Refine = #rec_equip_refine_info{
		roleID = Key,
		type = Type,
		level  = Level,
		prog = Prog,				
		bless = Bless,				
		star = Star				
	},
	edb:dirtySave(rec_equip_refine_info,Key,Refine,new_rec_equip_refine_info,update_rec_equip_refine_info),
	ok.

%%保存装备星级
-spec saveEquipStar(#recEquipStar{}) -> ok.
saveEquipStar(#recEquipStar{
		pos = Pos, 
		bless = Bless, 
		prog = Prog, 
		star = Star
	}) ->
	RoleID = playerState:getRoleID(),
	L = playerState:getEquipRefine(),
	case lists:keyfind(Pos, 1, L) of
		false ->
			Level = 0;
		{Pos, Lv} ->
			Level = Lv
	end,
	Key = {RoleID,Pos},
	Refine = #rec_equip_refine_info{
		roleID = Key,
		type = Pos,
		level  = Level,
		prog = Prog,				
		bless = Bless,				
		star = Star	
	},
	edb:dirtySave(rec_equip_refine_info,Key,Refine,new_rec_equip_refine_info,update_rec_equip_refine_info),
	ok.

saveNewTitle(TitleID,EndTime) ->
	RoleID = playerState:getRoleID(),
	Key = {RoleID,TitleID},
	Title = #rec_title{roleID = Key,titleID = TitleID,endTime = EndTime },
	%%添加到新加表
	edb:writeRecord(new_rec_title,Title),
	%%更新到缓存
	edb:writeRecord(Title),
	ok.

saveInSertTitle(RoleID,TitleID) ->
	Key = {RoleID,TitleID},
	EndTime = case getCfg:getCfgPStack(cfg_titlesystem, TitleID) of
				  []-> 0;
				  Cfg ->
					  case Cfg#titlesystemCfg.time =:= 0 of
						  true->0;
						  _ -> Cfg#titlesystemCfg.time + time:getSyncTimeFromDBS()
					  end
			  end,
	Title = #rec_title{roleID = Key,titleID = TitleID,endTime  = EndTime },
	%%添加到新加表
	edb:writeRecord(new_rec_title,Title),
	%%更新到缓存
	edb:writeRecord(Title),
	ok.

saveCanReName(RoleID, CanRename) ->
	case playerState:getIsPlayer() of
		true ->
			ExtRole = case edb:dirtyReadRecord(rec_ext_role, RoleID) of
						  [#rec_ext_role{} = ER] ->
							  ER;
						  _ ->
							  #rec_ext_role{roleID = RoleID}
					  end,
			NewExtRole = ExtRole#rec_ext_role{
				canRename = CanRename
			},
			edb:dirtySave(rec_ext_role,RoleID,NewExtRole,new_rec_ext_role,update_rec_ext_role);
		_ ->
			skip
	end,
	ok.
saveUpdateReward(UpdateReward) ->
	case playerState:getIsPlayer() of
		true ->
			RoleID = playerState:getRoleID(),
			case edb:dirtyReadRecord(rec_ext_role,RoleID) of
				[#rec_ext_role{} = ER] ->
					NewExtRole = ER#rec_ext_role{
						updateReward = UpdateReward
					},
					edb:dirtySave(rec_ext_role,RoleID,NewExtRole,new_rec_ext_role,update_rec_ext_role);
				_ ->
					NewExtRole = #rec_ext_role{
						roleID = RoleID,
						updateReward = UpdateReward
					},
					edb:dirtySave(rec_ext_role,RoleID,NewExtRole,new_rec_ext_role,update_rec_ext_role)
			end;
		_ ->
			skip
	end,
	ok.

%%保存宠物
-spec savePet(Pet::#recPetInfo{}) -> ok.
savePet(#recPetInfo{pet_id = PetID,				%%  宠物ID
	pet_star = Star,							%%  宠物星阶
	pet_name = Name,							%%  宠物名字
	pet_status = Status,						%%  0:休息  1:出战
	pet_force = Force,							%% 	宠物战力
	pet_attas = Attas,							%%	宠物提升属性列表
	pet_time = Time,
	pet_raw = Raw								%%  宠物转生等级
}) ->
	case playerState:getIsPlayer() of
		true ->
			RoleID = playerState:getRoleID(),
			Key = {RoleID,PetID},
			SavePet = #rec_pet_info{
				roleID = Key,
				petID = PetID,
				status = Status,
				star = Star,
				name = Name,
				attas = Attas,
				force = Force,
				time = Time,
				raw = Raw
			},
			edb:dirtySave(rec_pet_info,Key,SavePet,new_rec_pet_info,update_rec_pet_info);
		_ ->
			skip
	end,
	ok.

savePet(RoleID, #recPetInfo{
		pet_id = PetID,		%%  宠物ID
		pet_star = Star,	%%  宠物星阶
		pet_name = Name,	%%  宠物名字
		pet_status = Status,%%  0:休息  1:出战
		pet_force = Force,	%% 	宠物战力
		pet_time = Time,
		pet_attas = Attas,	%%	宠物提升属性列表
		pet_raw = Raw		%%  宠物转生等级
	}) ->
	Key = {RoleID,PetID},
	SavePet = #rec_pet_info{
		roleID = Key,
		petID = PetID,
		status = Status,
		star = Star,
		name = Name,
		time = Time,
		attas = Attas,
		force = Force,
		raw = Raw
	},
	edb:dirtySave(rec_pet_info,Key,SavePet,new_rec_pet_info,update_rec_pet_info).

%%保存宠物装备
-spec savePetEquip(PetEquip::#recPetEquip{}) -> ok.
savePetEquip(#recPetEquip{
	equip_id = ID,			%% 装备ID
	equip_lv = LV,			%% 装备强化
	equip_pos = Pos			%%  装备位置
}) ->
	RoleID = playerState:getRoleID(),
	Key = {RoleID,Pos},
	PetEquip = #rec_pet_equip{
		roleID = Key,						%%角色ID bigint(20) unsigned
		equipPos = Pos,						%%装备位置 tinyint(4) unsigned
		equipID = ID,						%%装备ID tinyint(4) unsigned
		equipLv = LV						%%装备等级 tinyint(4) unsigned
	},
	edb:dirtySave(rec_pet_equip,Key,PetEquip,new_rec_pet_equip,update_rec_pet_equip),
	ok.

%%保存宠物技能
-spec savePetSkill(PetID::uint(), PetSkill::#recPetSkill{}) -> ok.
savePetSkill(PetID, #recPetSkill{
	skill_index = Index,		%%  宠物技能的下标
	skill_id = ID,				%%  宠物技能ID
	skill_cd = CD,				%%  宠物技能CD
	skill_type = Type,			%%  0:天赋技能 1：通用技能 2:基础技能
	skill_level = LV, 			%%  宠物技能等级
	skill_is_unlock = IsLock	%%  0:未解锁 1:解锁
}) ->
	case playerState:getIsPlayer() of
		true ->
			RoleID = playerState:getRoleID(),
			Key = {RoleID,PetID,Index},
			SaveSkill = #rec_pet_skill{
				roleID = Key,			%%角色ID bigint(20) unsigned
				petID = PetID,			%%宠物ID smallint(5) unsigned
				skillID = ID,			%%技能ID smallint(6) unsigned
				index = Index,			%%技能索引 tinyint(4) unsigned
				level = LV,				%%等级 tinyint(4) unsigned
				unlock = IsLock,		%%0:未解锁 1:解锁 tinyint(4) unsigned
				type = Type,			%%技能type 0:天赋 1:通用 2:基础 tinyint(4) unsigned
				cd = CD					%%宠物技能CD bigint(20)
			},
			edb:dirtySave(rec_pet_skill,Key,SaveSkill,new_rec_pet_skill,update_rec_pet_skill);
		_ ->
			skip
	end,
	ok.

savePetSkill(RoleID, PetID, #recPetSkill{
	skill_index = Index,		%%  宠物技能的下标
	skill_id = ID,				%%  宠物技能ID
	skill_cd = CD,				%%  宠物技能CD
	skill_type = Type,			%%  0:天赋技能 1：通用技能 2:基础技能
	skill_level = LV, 			%%  宠物技能等级
	skill_is_unlock = IsLock	%%  0:未解锁 1:解锁
}) ->
	Key = {RoleID,PetID,Index},
	SaveSkill = #rec_pet_skill{
		roleID = Key,			%%角色ID bigint(20) unsigned
		petID = PetID,			%%宠物ID smallint(5) unsigned
		skillID = ID,			%%技能ID smallint(6) unsigned
		index = Index,			%%技能索引 tinyint(4) unsigned
		level = LV,				%%等级 tinyint(4) unsigned
		unlock = IsLock,		%%0:未解锁 1:解锁 tinyint(4) unsigned
		type = Type,			%%技能type 0:天赋 1:通用 2:基础 tinyint(4) unsigned
		cd = CD					%%宠物技能CD bigint(20)
	},
	edb:dirtySave(rec_pet_skill,Key,SaveSkill,new_rec_pet_skill,update_rec_pet_skill).

%%保存宠物远征副本积分
-spec savePetDunScore([#rec_pet_dungeon_score{}, ...]) -> ok.
savePetDunScore([]) ->
	ok;
savePetDunScore([#rec_pet_dungeon_score{}|_] = DunList) ->
	case playerState:getIsPlayer() of
		true ->
			%% 与内存中的数据比较，有变化再存储
			RoleID = playerState:getRoleID(),

			Sql = qlc:q([
				#rec_pet_dungeon_score{roleID = RID, dungeon_ID = DID, dungeon_score = DS}
				|| #rec_pet_dungeon_score{roleID = {RID, _}, dungeon_ID = DID, dungeon_score = DS} <- mnesia:table(rec_pet_dungeon_score), RID =:= RoleID]),
			OldDunList = edb:selectRecord(Sql),

			%% 过滤掉没有改变的
			NeedSaveList = lists:filter(fun(DA) -> not lists:member(DA, OldDunList) end, DunList),

			%% 保存改变的
			Fun =
				fun(#rec_pet_dungeon_score{dungeon_ID = DungeonID} = DC) ->
					Key = {RoleID, DungeonID},
					Rec = DC#rec_pet_dungeon_score{roleID = Key},
					edb:dirtySave(rec_pet_dungeon_score,Key,Rec,new_rec_pet_dungeon_score,update_rec_pet_dungeon_score)
				end,
			lists:foreach(Fun, NeedSaveList);
		_ ->
			skip
	end,
	ok.

-spec savePetDunInfo(#rec_pet_dungeon_info{}) -> ok.
savePetDunInfo(#rec_pet_dungeon_info{roleID = RoleID} = DunInfo) ->
	case playerState:getIsPlayer() of
		true ->
			edb:dirtySave(rec_pet_dungeon_info, RoleID, DunInfo, new_rec_pet_dungeon_info, update_rec_pet_dungeon_info);
		_ ->
			skip
	end,
	ok.

-spec savePetManorBattle(#rec_pet_manor_battle{}) -> ok.
savePetManorBattle(#rec_pet_manor_battle{roleID = RoleID} = MB) ->
	case playerState:getIsPlayer() of
		true ->
			edb:dirtySave(rec_pet_manor_battle, RoleID, MB, new_rec_pet_manor_battle, update_rec_pet_manor_battle);
		_ ->
			skip
	end,
	ok.

-spec savePersonalityInfo(NewPersonalityInfo :: #rec_personality_info{}) -> ok.
savePersonalityInfo(NewPersonalityInfo) ->
	case playerState:getIsPlayer() of
		true ->
			RoleID = playerState:getRoleID(),
			edb:dirtySave(rec_personality_info, RoleID, NewPersonalityInfo, new_rec_personality_info, update_rec_personality_info);
		_ ->
			skip
	end,
	ok.

-spec saveBuffList() -> ok.
saveBuffList() ->
	case playerState:getIsPlayer() of
		true ->
			RoleID = playerState:getRoleID(),
			Now = time:getUTCNowMS(),
			BuffList = playerState:getBuffList(),
			Fun = fun(#recBuff{endTime = Time, buffID = ID}) ->
				Key = {RoleID,ID},
				#buffCfg{buffstore = BuffStore} = getCfg:getCfgPStack(cfg_buff, ID),
				?DEBUG_OUT("save buff [~p], buff store class [~p] end time [~p]",[ID,BuffStore,Time]),
				case BuffStore of
					?StoreTime -> %%结束时间
						?DEBUG_OUT("save buff [~p], storeTime end time [~p]",[ID,Time]),
						Buff = #rec_buff{buffID = ID, endtime = Time, roleID = Key},
						edb:dirtySave(rec_buff,Key,Buff,new_rec_buff,update_rec_buff);
					?StoreUnTime -> %%剩余时间
						?DEBUG_OUT("save buff [~p], storeunTime end time [~p]",[ID,Time - Now]),
						Buff = #rec_buff{buffID = ID, endtime = Time - Now, roleID = Key},
						edb:dirtySave(rec_buff,Key,Buff,new_rec_buff,update_rec_buff);
					_ ->
						skip
				end
			end,
			lists:foreach(Fun, BuffList);
		_ ->
			skip
	end,
	ok.

%% 保存接受任务列表
-spec saveAcceptedTaskList() -> {AcceptedTaskList,CompletedTaskList} when
	AcceptedTaskList::list(),CompletedTaskList::list().
saveAcceptedTaskList() ->
    %% 先保存完成任务
    saveSubmitedTaskList(),

    %% 再保存接受任务
%%    RoleID = playerState:getRoleID(),
%%    AcceptedTaskFun =
%%        fun(#recTaskAccepted{taskID = TaskID, taskProcess = TP}, AccList) ->
%%            Len = erlang:length(TP),
%%            case erlang:is_integer(TaskID) andalso TaskID > 0 andalso Len > 0 andalso Len =< 3 of
%%                true ->
%%                    [A,B,C] = getTaskProcess(TP),
%%                    TA = #rec_task_accepted{
%%                        roleID = RoleID,
%%                        taskID = TaskID,
%%                        subType1 = A#recTaskProcess.subTaskType,
%%                        count1 = A#recTaskProcess.curCount,
%%                        subType2 = B#recTaskProcess.subTaskType,
%%                        count2 = B#recTaskProcess.curCount,
%%                        subType3 = C#recTaskProcess.subTaskType,
%%                        count3 = C#recTaskProcess.curCount
%%                    },
%%                    [TA | AccList];
%%                _ ->
%%                    ?ERROR_OUT("Error Sub Task Num when Save Task[~p][~p]",[TaskID,RoleID]),
%%                    AccList
%%            end
%%        end,
%%    APList = playerState:getAcceptedTask2(),
%%    NewList = lists:foldl(AcceptedTaskFun, [], APList),

    %% 保存到公共数据中
    playerState2:setPlayerDataElement(#rec_playerdata.rec_task_accepted, playerState:getAcceptedTask()),
	ok.

%% 保存完成任务列表
-spec saveSubmitedTaskList() -> ok.
saveSubmitedTaskList() ->
    L = playerState:getSubmittedTask(),
    RoleID = playerState:getRoleID(),
    Fun =
        fun({Slot, Value}) ->
            #rec_task_submitted{roleID = RoleID, taskSlot = Slot, taskFlag = Value}
        end,
    NL = lists:map(Fun, L),

    %% 保存到公共数据中
    playerState2:setPlayerDataElement(#rec_playerdata.rec_task_submitted, NL),
    ok.

-spec saveDailyCounter() -> ok.
saveDailyCounter() ->
	case playerState:getIsPlayer() of
		true ->
			case playerState:getDailyCounterList() of
				List when erlang:is_list(List)->
					%% 与内存中的数据比较，有变化再存储
					RoleID = playerState:getRoleID(),
					Sql = qlc:q([Daily || #rec_daily_counter0{roleID = {RID, _}} = Daily <- mnesia:table(rec_daily_counter0), RID =:= RoleID]),
					OldDailyList = edb:selectRecord(Sql),

					%% 过滤掉没有改变的计数器
					NeedSaveList = lists:filter(fun(DA) -> not lists:member(DA, OldDailyList) end, List),

					%% 保存改变的计数器
					Fun = fun(#rec_daily_counter0{roleID = Key} = DC) ->
						edb:dirtySave(rec_daily_counter0,Key,DC,new_rec_daily_counter0,update_rec_daily_counter0)
					end,
					lists:foreach(Fun, NeedSaveList);
				_ ->
					[]
			end;
		_ ->
			skip
	end,
	ok.

saveItemUsedCD() ->
	RoleID = playerState:getRoleID(),
	List = playerState:getItemUsedTimeList(),
	Fun = fun(#rec_item_used_cd{
		itemGroupID = GID,                 		%%道具组ID
		lastUsedTime = Time                    	%%道具组上次使用的时间，以2010年1月1日为基准，单位：毫秒
	}) ->
		Key = {RoleID,GID},
		CD = #rec_item_used_cd{
			roleID = Key,					%%角色ID bigint(20) unsigned
			itemGroupID = GID,				%%道具组ID smallint(6)
			lastUsedTime = Time				%%上次使用时间，以2010年1月1日为准的时间，单位：毫秒 bigint(20) unsigned
		},
		edb:dirtySave(rec_item_used_cd,Key,CD,new_rec_item_used_cd,update_rec_item_used_cd)
	end,
	lists:foreach(Fun,List).

saveVariant(Index,Value) ->
	RoleID = playerState:getRoleID(),
	Key = {RoleID,Index},
	Variant = #rec_variant0{roleID = Key,index = Index,value = Value},
	edb:dirtySave(rec_variant0,Key,Variant,new_rec_variant0,update_rec_variant0),
	ok.

saveFashion(FashionRec) ->
	RoleID = playerState:getRoleID(),
	Key = {RoleID,FashionRec#recFashion.fashionID},
	RF = #rec_role_fashions{roleID = Key, fashionID = FashionRec#recFashion.fashionID, endTime = FashionRec#recFashion.endTime},
	edb:dirtySave(rec_role_fashions,Key,RF,new_rec_role_fashions,update_rec_role_fashions),
	ok.

saveFashionSlot() ->
	List = playerState:getFashionSlotList(),
	Fun = fun(#recFashionOnLoad{
		roleID = RoleID,
		index = Index,
		value = V
	}) ->
		Key = {RoleID,Index},
		FS = #rec_fashion_slot{
			roleID = Key,				%% bigint(10) unsigned
			slot = Index,				%% tinyint(3) unsigned
			fashionID = V				%% smallint(5) unsigned
		},
		edb:dirtySave(rec_fashion_slot,Key,FS,new_rec_fashion_slot,update_rec_fashion_slot)
	end,
	lists:foreach(Fun,List),
	ok.

savePackageInfo(#rec_package_info{
	roleID = RoleID,				%%角色ID
	bagType = Type,			%%背包类型
	maxSlot = Slot				%%背包已经开启的最大格子数
}) ->
	Key = {RoleID,Type},
	Info = #rec_package_info{
		roleID = Key,				%%角色ID
		bagType = Type,			%%背包类型
		maxSlot = Slot				%%背包已经开启的最大格子数
	},
	edb:dirtySave(rec_package_info,Key,Info,new_rec_package_info,update_rec_package_info),
	ok.

savePlayerClock(#rec_player_clock{
	roleID = RoleID,     %  '玩家roleid',
	clockType = Type, 	%  '计时器类型',
	offTime = OT, 	%  '下线是否计时(1计时,2不计时)',
	startTime = ST, %  '开始时间',
	lastTime = LT, 	%  '最后一次记录时间',
	lengthTime = LenT,	%  '持续时间，秒',
	passTime  = PT 	%  '已经花去的时间，秒',
} = Value) ->
	case playerState:getIsPlayer() of
		true ->
			Key = case RoleID of
				      {_, _} ->
					      RoleID;
					  _ ->
						  ?ERROR_OUT("savePlayerClock:roleID=~p, Value=~p, param=~p", [playerState:getRoleID(), Value, RoleID]),
						  {RoleID, Type}
			      end,
			NewValue = #rec_player_clock{
				roleID = Key,     %  '玩家roleid',
				clockType = Type, 	%  '计时器类型',
				offTime = OT, 	%  '下线是否计时(1计时,2不计时)',
				startTime = ST, %  '开始时间',
				lastTime = LT, 	%  '最后一次记录时间',
				lengthTime = LenT,	%  '持续时间，秒',
				passTime  = PT 	%  '已经花去的时间，秒',
			},
			F =
				case Type /= 0 of
					true ->
						%% 保存有效时钟，需要检查是不是正在插入表中等待删除，如果是，则要改为更新数据库
						fun() ->
							%% 先读取是不是在插入表中
							case mnesia:read(new_rec_player_clock, Key, write) of
								[#rec_player_clock{clockType = WaitType}] when WaitType =:= Type ->
									%% 最新的，在等待插入
									mnesia:write(rec_player_clock, NewValue, write),
									mnesia:write(new_rec_player_clock, NewValue, write);
								[#rec_player_clock{clockType = 0}] ->
									%% 在等待删除
									mnesia:delete(new_rec_player_clock, Key, write),

									mnesia:write(rec_player_clock, NewValue, write),
									mnesia:write(update_rec_player_clock, NewValue, write);
								_ ->
									case mnesia:read(rec_player_clock, Key, write) of
										[Value] ->
											%% 记录相同，不处理
											ok;
										[] ->
											%% 无记录，插入
											mnesia:write(rec_player_clock, NewValue, write),
											mnesia:write(new_rec_player_clock, NewValue, write);
										_ ->
											%% 有记录，更新
											mnesia:write(rec_player_clock, NewValue, write),
											mnesia:write(update_rec_player_clock, NewValue, write)
									end
							end
						end;
					_ ->
						%% 删除clock
						fun() ->
							%% 先直接从主表中删除
							mnesia:delete(rec_player_clock, Key, write),

							%% 如果在更新表，就从更新表中删掉
							case mnesia:read(update_rec_player_clock, Key, write) of
								[#rec_player_clock{}|_] = List ->
									%% 还在更新表，那就直接删掉
									[mnesia:delete_object(update_rec_player_clock, Clock, write) || Clock <- List];
								_ ->
									skip
							end,

							%% 需要添加到插入表，利用插入表来处理删除
							mnesia:write(new_rec_player_clock, NewValue, write)
						end
				end,
			case mnesia:transaction(F) of
				{atomic, _Val} ->
					ok;
				Error ->
					?WARN_OUT("savePlayerClock Error:~p, ~p", [Error, Value]),
					skip
			end;
		_ ->
			skip
	end,
	ok.

savePlayerMSShop(#rec_player_ms_shop{roleID = RoleIDKey} = Rec, IsDelete) ->
	case IsDelete of
		false ->
			%% 更新
			F = fun() ->
				case mnesia:read(update_rec_player_ms_shop, RoleIDKey,write) of
					[_] ->
						%% 在更新表中有需要删除的记录，则更新总表与update表
						mnesia:write(Rec),
						mnesia:write(update_rec_player_ms_shop,Rec,write),
						true;
					_ ->
						false
				end
			    end,
			case mnesia:transaction(F) of
				{atomic, true} ->
					true;
				{atomic, false} ->
					edb:checkAndSave(rec_player_ms_shop, RoleIDKey,Rec,new_rec_player_ms_shop,update_rec_player_ms_shop);
				Error ->
					?ERROR_OUT("savePlayerMSShop Error:~p,~p",[Error, Rec]),
					error
			end;
		true ->
			%% 删除
			UpdateRec = Rec#rec_player_ms_shop{only_id = 0},
			F = fun() ->
				case mnesia:read(new_rec_player_ms_shop, RoleIDKey,write) of
					[_] ->
						%% 该key还在插入表中,说明还未保存数据库,则全部清空就行
						mnesia:delete({rec_player_ms_shop, RoleIDKey}),
						mnesia:delete({new_rec_player_ms_shop, RoleIDKey}),
						mnesia:delete({update_rec_player_ms_shop, RoleIDKey}),
						true;
					_ ->
						%% 不在插入表中，则清空主表，且更新update表(dbserver会选择从数据库中删除)
						mnesia:delete({rec_player_ms_shop, RoleIDKey}),

						mnesia:write(update_rec_player_ms_shop,UpdateRec,write),
						true
				end
			    end,
			case mnesia:transaction(F) of
				{atomic, Val} ->
					Val;
				Error ->
					?ERROR_OUT("savePlayerMSShop delete Error:~p,~p",[Error, UpdateRec]),
					error
			end
	end,
	ok.

saveAWaken(#rec_awaken_info{
	roleID 	= RoleID,	%%角色ID
	cardID	= CardID,	%%卡牌ID
	level 	= LV,		%%觉醒等级
	itemNum = N, 		%%当前吃的道具个数
	progress = Progress,
	stateMax = LockStateMax,
	curState = CurState
}) ->
	Key = {RoleID,CardID},
	AI = #rec_awaken_info{
		roleID = Key,				%%玩家角色唯一ID bigint(20) unsigned
		level = LV,					%%觉醒等级 smallint(6)
		itemNum = N,				%%当前等级吃了多少个道具(最大不会超过65535) smallint(6)
		cardID = CardID,				%% smallint(6)
		progress = Progress,
		stateMax = LockStateMax,
		curState = CurState
	},
	edb:dirtySave(rec_awaken_info,Key,AI,new_rec_awaken_info,update_rec_awaken_info),
	ok.

-spec saveDrop(#recDrop{}) -> ok.
saveDrop(#recDrop
		 {
		  id = ID,
		  num = Num,
		  time = Time
		 }) ->
	case playerState:getIsPlayer() of
		true ->
			Key = {playerState:getRoleID(), ID},
			Drop = #rec_player_drop
			{
				roleID = Key,
				id = ID,
				num = Num,
				time = Time
			},
			edb:dirtySave(rec_player_drop, Key, Drop, new_rec_player_drop, update_rec_player_drop);
		_ ->
			skip
	end,
	ok.

saveWarriorTrialInfo(#rec_warrior_trial{roleID = RoleID} = WT) ->
	edb:dirtySave(rec_warrior_trial,RoleID,WT,new_rec_warrior_trial,update_rec_warrior_trial),
	ok.

saveTalent(#rec_talent{roleID = RoleID} = Talent) ->
	edb:dirtySave(rec_talent,RoleID,Talent,new_rec_talent,update_rec_talent),
	ok.

saveGodWeaponInfo(#rec_god_weapon{roleID = RoleID} = GodWeaponInfo) ->
	edb:dirtySave(rec_god_weapon,RoleID,GodWeaponInfo,new_rec_god_weapon,update_rec_god_weapon),
	ok.

%% 获取进入副本前保存的位置信息
-spec getOldMapPos() -> {OldMapId, OldX, OldY} when
	OldMapId::uint(),OldX::float(),OldY::float().
getOldMapPos() ->
	{X,Y} = playerState:getPos(),
	{OldMapId, OldX, OldY} = playerState:getOldMapPos(),
	MapID = playerState:getMapID(),
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeBitplane} ->
			%% 如果是位面，更新位置
			{OldMapId, X, Y};
		_ ->
			{OldMapId, OldX, OldY}
	end.

getEMysqlNowDateTime() ->
	Sec = time2:getLocalDateTimeSec(),
	DateTime = time:convertSec2DateTime(Sec),
	{datetime,DateTime}.


changeGoodsOwner(GoodsUID,CurOwnerID,ToOwnerID) ->
	F = fun() ->
		case mnesia:read(rec_item,GoodsUID,write) of
			[#rec_item{roleID = RoleID} = Item] ->
				case RoleID =:= CurOwnerID of
					true ->
						NewItem = Item#rec_item{roleID = ToOwnerID},
						%%写入缓存数据库
						mnesia:write(NewItem),
						NewItem;
					_ ->
						RoleID
				end;
			_ ->
				1
		end
	end,
	case mnesia:transaction(F) of
		{atomic, Val} ->
			case Val of
				#rec_item{} ->
					gsSendMsg:sendMsg2DBServer(save_item_data, playerState:getAccountID(), {update, Val}),
					skip;
				1 ->
					?ERROR_OUT("Error change Goods:~p CurOwner:~p ToOwner:~p not found in memdb",[GoodsUID,CurOwnerID,ToOwnerID]);
				_ ->
					?ERROR_OUT("Error change Goods:~p CurOwner:~p ToOwner:~p,Real CurOwner Is:~p",[GoodsUID,CurOwnerID,ToOwnerID,Val])
			end;
		Error ->
			?WARN_OUT("changeGoodsOwner Error:~p",[Error])
	end,
	ok.

savePlayerLiveness(RoleID)->
	case playerState:getLiveness() of
		#rec_player_liveness{} = Record ->
			edb:dirtySave(rec_player_liveness,RoleID,Record,new_rec_player_liveness,update_rec_player_liveness);
		_ -> skip
	end,
	ok.

saveHolidayTask(RoleID)->
	case playerState:getPlayerHolidayTask() of
		#rec_holiday_task{} = Record ->
			edb:dirtySave(rec_holiday_task,RoleID,Record,new_rec_holiday_task,update_rec_holiday_task);
		_ -> skip
	end.

%%

%%item	22962927
%%equip_enhance_info	11972986
%%equip_base_info	11811422
%%skill	9560503
%%equip_ext_info	8790541
%%player_prop	7286631
%%player_coin	6847372
%%achieve	6547200
%%pet_skill	5021205
%%task_submitted	3625024
%%pet_dungeon_score	3222355
%%badge	2933407
%%pet_equip	2636285
%%skill_slot	2586330
%%mail_attachment	2052818
%%copymapscore	1903506
%%mail	1897563
%%friend_info	1896368
%%variant0	1833442
%%variant4	1832508
%%variant6	1822234
%%variant9	1784874
%%variant8	1784874
%%variant7	1750783
%%variant3	1743778
%%variant2	1716225
%%variant1	1705484
%%variant5	1681667
%%equip_refine_info	1518217
%%awaken_info	1207195
%%title	1178253
%%trade	1047628
%%pet_info	996033
%%daily_counter3	986700
%%daily_counter2	984000
%%daily_counter5	978600
%%daily_counter0	974700
%%daily_counter1	973500
%%daily_counter4	971400
%%daily_counter9	967800
%%daily_counter8	960600
%%daily_counter7	960600
%%daily_counter6	946800
%%task_accepted	864600
%%item_used_cd	737984
%%warrior_trial	678551
%%pet_dungeon_info	668631
%%ext_role	650110
%%personality_info	649215
%%god_weapon	646840
%%base_role	635323
%%account	584442
%%player_ms_shop	519200
%%player_liveness	303962
%%lottery_result	271469
%%holiday_task	212058
%%rune_prop	209033
%%recharge	207655
%%pet_manor_battle	166101
%%package_info	135960
%%role_fashions	80561
%%sourceshop_forever_limit	74778
%%guild_member_skill	61256
%%ladder_1v1	60377
%%rune_base	51935
%%fashion_slot	51757
%%player_data	47838
%%player_clock	41978
%%companion	34500
%%role_award_takens	29920
%%guild_member	27342
%%player_find_res	26263
%%player_drop	18098
%%guild_skill	8548
%%guild_task	6240
%%talent	2410
%%pet_battle_report	1875
%%guard_mirror_rank	1534
%%offline_data	1412
%%guild_buff	1305
%%player_rank	1083
%%guild	884
%%operate_data	814
%%recharge_rebate_taken	442
%%marriage	209
%%darkness_ac_rank	172
%%malllimitbuy	89
%%redenvelope	53
%%recharge_rebate	49
%%mall	35
%%manor_battle	33
%%game_notice	28
%%server_drop	22
%%login_award_conf	14
%%activity	12
%%sundries	10
%%operate_activity	8
%%guild_war_paid	6
%%guild_battle	4
%%guild_war	3
%%xml_notice	2
%%guard_mirror	1
%%limit_sales	0
%%monitor	0
%%marriage_engagement	0
%%team	0
%%db_info	0
%%copy_map_data	0
%%gsconfig	0
%%common_active_code	0
%%operate_exchange_data	0
%%platform	0
%%pre_charge_account	0
%%buff	0
%%operate_exchange	0
%%player_team	0
%%account_welfare	0