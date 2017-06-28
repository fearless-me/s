%%
%% @author chengxs
%%神器系统

-module(playerGodWeapon).
-author(chengxs).
-include("gsInc.hrl").
-include("playerPrivate.hrl").


%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initGodWeapon/0,
	sendGodWeaponInfo/0,
	levelupWeapon/1,
	getWeaponInfoAck/1,
    getWeaponToQuerytRPProp/0,

	freshWakeSkillFromGodWeapon/0,
	getWakeSkillLvByExp/1
]).
-define(WeaponNotOpened, 0).
-define(WeaponOpened, 1).


%% 20170214 LUNA-561 器灵技能根据职业区分
%% 从#shenqiCfg.skill中获取属于本职业的技能ID
-spec getMySkillID(SkillIDs::[uint(), ...]) -> SkillID::uint().
getMySkillID([]) ->
	?ERROR_OUT("getMySkillID SkillIDs is empty!"),
	0;
getMySkillID([0]) ->
	%% 没有对应技能
	0;
getMySkillID(SkillIDs) ->
	Career = playerState:getCareer(),
	lists:nth(?Career2CareerMain(Career), SkillIDs).

-spec initGodWeapon()-> ok.
%%玩家上线初始化
initGodWeapon() ->
%%	%%给玩家加上恢复怒气的触发技能
%%	#shenqiCfg{skill = SkillIDs} = getCfg:getCfgByKey(cfg_shenqi, 0, 0),
%%	SkillID = getMySkillID(SkillIDs),
%%	playerSkill:addGodWeaponSkill(SkillID, 1),
	%% 发送神器信息
	playerGodWeapon:sendGodWeaponInfo(),
	%% 初始化觉醒技能
	playerSkillLearn:openWakeSkill(),
	ok.

sendGodWeaponInfo() ->
	List = playerState:getGodWeaponInfo(),
	?DEBUG_OUT("List = ~p", [List]),
	%%初始化神器属性
	Fun = fun(#rec_god_weapon{weaponID = WID, weaponLevel = WL, skillLevel = SL}, AccList) ->
		case WL > 0 of
			true ->
				addPlayerProp(WID, 0, WL),
				%%玩家上线初始化玩家的神器技能
				#shenqiCfg{skill = SkillIDs} = getCfg:getCfgByKey(cfg_shenqi, WID, WL),
				SkillID = getMySkillID(SkillIDs),
				playerSkill:addGodWeaponSkill(SkillID, SL);
			_ ->
				skip
		end,
		[#pk_GodWeaponInfo{weaponID = WID, weaponLevel = WL, skillLevel = SL}|AccList]
	end,
	Infos = lists:foldl(Fun, [], List),
	playerMsg:sendNetMsg(#pk_GS2U_InitGodWeapon{infos = Infos}),
	ok.
-spec getWeaponInfoAck(List::list()) -> ok.
getWeaponInfoAck(List) ->
	playerState:setGodWeaponInfo(List),
	ok.

%%神器升级
levelupWeapon(WeaponID) ->
	case levelupWeapon_check_level(WeaponID) of
		{true, {#rec_god_weapon{weaponLevel = WLevel} = WeaponInfo, WeaponInfoList}} ->
			#shenqiCfg{upgrade = CostCoin, upitem = CostItem} =
				getCfg:getCfgPStack(cfg_shenqi, WeaponID, WLevel + 1),
			CostCoinReal =
				case CostCoin of
					undefined ->
						[];
					_ ->
						CostCoin
				end,
			CostItemReal =
				case CostItem of
					undefined ->
						[];
					_ ->
						CostItem
				end,
			case levelupWeapon_check_item(WLevel, CostItemReal) of
				true ->
					case levelupWeapon_check_coin(WLevel, CostCoinReal) of
						true ->
							case levelupWeapon_cost_item(WLevel, CostItemReal) of
								true ->
									case levelupWeapon_cost_coin(WLevel, CostCoinReal) of
										true ->
											levelupWeapon_levelup(WeaponInfo, WeaponInfoList, CostCoinReal, CostItemReal);
										_ ->
											skip
									end;
								_ ->
									skip
							end;
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

levelupWeapon_check_level(WeaponID) ->
	RoleID = playerState:getRoleID(),
	WeaponInfoList = playerState:getGodWeaponInfo(),
	WeaponInfo =
		case lists:keyfind(WeaponID, #rec_god_weapon.weaponID, WeaponInfoList) of
			#rec_god_weapon{} = WI->
				WI;
			false ->
				#rec_god_weapon{roleID = {RoleID, WeaponID}, weaponID = WeaponID}
		end,
	#rec_god_weapon{weaponLevel = WLevel} = WeaponInfo,
	MaxLevel = lists:max(getCfg:get2KeyList(cfg_shenqi,WeaponID)),
	case WLevel < MaxLevel of
		true ->
			{true, {WeaponInfo, WeaponInfoList}};
		_ ->
			%%该神器已经满级了
			playerMsg:sendErrorCodeMsg(?ErrorCode_GodWeapon_Weapon_Level_Max),
			false
	end.

levelupWeapon_check_item(_WLevel, []) ->
	true;
levelupWeapon_check_item(0, [{ItemID, ItemCount} | T]) ->
	case playerPackage:getItemNumByID(ItemID) >= ItemCount of
		false ->
			%%解锁神器所需道具不足
			playerMsg:sendErrorCodeMsg(?ErrorCode_GodWeapon_Unlock_Not_Enough_Item),
			false;
		_ ->
			levelupWeapon_check_item(0, T)
	end;
levelupWeapon_check_item(WLevel, [{ItemID, ItemCount} | T]) ->
	case playerPackage:getItemNumByID(ItemID) >= ItemCount of
		false ->
			%%神器升级所需消耗不足
			playerMsg:sendErrorCodeMsg(?ErrorCode_GodWeapon_LevelUp_Not_Enough_Cost),
			false;
		_ ->
			levelupWeapon_check_item(WLevel, T)
	end.

levelupWeapon_check_coin(_WLevel, []) ->
	true;
levelupWeapon_check_coin(WLevel, [{CoinType, CoinCount} | T]) ->
	CoinUseType = getCoinUseType(CoinType),
	case playerMoney:canUseCoin(CoinUseType, CoinCount) of
		true ->
			levelupWeapon_check_coin(WLevel, T);
		_ ->
			%%神器升级所需消耗不足
			playerMsg:sendErrorCodeMsg(?ErrorCode_GodWeapon_LevelUp_Not_Enough_Cost),
			false
	end.

levelupWeapon_cost_item(_WLevel, []) ->
	true;
levelupWeapon_cost_item(0, [{ItemID, ItemCount} | T]) ->
	#itemCfg{itemType = ItemType} =
		getCfg:getCfgPStack(cfg_item, ItemID),
	BagType = playerPackage:getPackageType(ItemType),
	OldCount =
		playerPackage:getGoodsNumByID(BagType, ItemID, true) +
			playerPackage:getGoodsNumByID(BagType, ItemID, false),
	PLog =
		#recPLogTSItem{
			old = OldCount,
			new = OldCount - ItemCount,
			change = -ItemCount,
			target = ?PLogTS_GodWeapon,
			source = ?PLogTS_PlayerSelf,
			changReason = ?ItemDeleteReasonGodWeaponUnLock
		},
	case playerPackage:delGoodsByID(BagType, ItemID, ItemCount, PLog) of
		true ->
			levelupWeapon_cost_item(0, T);
		_ ->
			%%解锁神器失败
			playerMsg:sendErrorCodeMsg(?ErrorCode_GodWeapon_Unlock_failed),
			false
	end;
levelupWeapon_cost_item(WLevel, [{ItemID, ItemCount} | T]) ->
	#itemCfg{itemType = ItemType} =
		getCfg:getCfgPStack(cfg_item, ItemID),
	BagType = playerPackage:getPackageType(ItemType),
	OldCount =
		playerPackage:getGoodsNumByID(BagType, ItemID, true) +
			playerPackage:getGoodsNumByID(BagType, ItemID, false),
	PLog =
		#recPLogTSItem{
			old = OldCount,
			new = OldCount - ItemCount,
			change = -ItemCount,
			target = ?PLogTS_GodWeapon,
			source = ?PLogTS_PlayerSelf,
			changReason = ?ItemDeleteReasonGodWeaponLevelup
		},
	case playerPackage:delGoodsByID(BagType, ItemID, ItemCount, PLog) of
		true ->
			levelupWeapon_cost_item(WLevel, T);
		_ ->
			%%解锁神器失败
			playerMsg:sendErrorCodeMsg(?ErrorCode_GodWeapon_LevelUp_Failed),
			false
	end.

levelupWeapon_cost_coin(_WLevel, []) ->
	true;
levelupWeapon_cost_coin(0, [{CoinType, CoinCount} | T]) ->
	CoinUseType = getCoinUseType(CoinType),
	PLog =
		#recPLogTSMoney{
			reason = ?CoinUseGodWeaponLevelUp,
			target = ?PLogTS_GodWeapon,
			source = ?PLogTS_PlayerSelf
		},
	case playerMoney:useCoin(CoinUseType, CoinCount, PLog) of
		true ->
			levelupWeapon_cost_coin(0, T);
		_ ->
			%%解锁神器失败
			playerMsg:sendErrorCodeMsg(?ErrorCode_GodWeapon_Unlock_failed),
			false
	end;
levelupWeapon_cost_coin(WLevel, [{CoinType, CoinCount} | T]) ->
	CoinUseType = getCoinUseType(CoinType),
	PLog =
		#recPLogTSMoney{
			reason = ?CoinUseGodWeaponLevelUp,
			target = ?PLogTS_GodWeapon,
			source = ?PLogTS_PlayerSelf
		},
	case playerMoney:useCoin(CoinUseType, CoinCount, PLog) of
		true ->
			levelupWeapon_cost_coin(WLevel, T);
		_ ->
			%%解锁神器失败
			playerMsg:sendErrorCodeMsg(?ErrorCode_GodWeapon_LevelUp_Failed),
			false
	end.

levelupWeapon_levelup(
	#rec_god_weapon{
		weaponID = WeaponID,
		weaponLevel = WLevel
	} = WeaponInfo,
	WeaponInfoList,
	CostCoinReal,
	CostItemReal
) ->
	%% skillLevel是旧有字段，现与weaponLevel同步
	NewLevel = WLevel + 1,
	NewWeaponInfo =
		WeaponInfo#rec_god_weapon{
			skillLevel = NewLevel,
			weaponLevel = NewLevel
		},
	%% 刷新器灵数据与角色属性
	saveWeaponInfo(WeaponID, WeaponInfoList, NewWeaponInfo),
	addPlayerProp(WeaponID, WLevel, NewLevel),
	%% 刷新器灵技能与觉醒技能
	{ExpLeft, WakeSkillLevel} = levelupWeapon_levelup_skill(WeaponID, NewLevel),
	%% 刷新战力
	playerForce:calcPlayerForce(true),
	%% 反馈消息
	Msg =
		#pk_GS2U_LevelUpGodWeaponResult{
			weaponID = WeaponID,
			weaponLevel = NewLevel,
			exp = ExpLeft,
			wakeSkillLv = WakeSkillLevel
		},
	playerMsg:sendNetMsg(Msg),
	playerTask:updateTask(?TaskSubType_System, ?TaskSubType_System_Sub_GodWeapon),
	%% 记录日志
	LogGodWeapon =
		#rec_log_god_weapon{
			accountID = playerState:getAccountID(),
			roleID = playerState:getRoleID(),
			weaponID = WeaponID,
			oldLevel = WLevel,
			newLevel = NewLevel,
			costItem = CostItemReal,
			costCoin = CostCoinReal,
			time = time:getLogTimeSec()
		},
	dbLog:sendSaveLogWeaponInfo(LogGodWeapon),
	playerSevenDayAim:updateCondition(?SevenDayAim_GodWeapon, []).

levelupWeapon_levelup_skill(WeaponID, NewLevel) ->
	case NewLevel > 1 of
		true ->
			%%神器升级成功
			updateGodWeaponSkill(WeaponID, NewLevel, NewLevel),
			playerMsg:sendErrorCodeMsg(?ErrorCode_GodWeapon_LevelUp_Success),
			playerAchieve:achieveEvent(?Achieve_Artifact_level, [1]);
		_ ->
			%%解锁神器成功
			activateGodWeaponSkill(WeaponID, 1),
			case WeaponID > ?Livenessactivate_Artifact_6 of
				true ->
					?ERROR_OUT(
						"WeaponID(~w) is too large for Achieve(~w)!",
						[WeaponID, ?Livenessactivate_Artifact_6]
					);
				_ ->
					playerAchieve:achieveEvent(?Achieve_activate_Artifact_1 + WeaponID - 1, [1])
			end,
			playerMsg:sendErrorCodeMsg(?ErrorCode_GodWeapon_Unlock_Success)
	end,
	%% 更新觉醒技能经验并有可能更新觉醒技能
	ExpOld = playerPropSync:getProp(?PriProp_WakeUpExp),
	ExpNew = freshWakeSkillFromGodWeapon(),
	playerPropSync:setInt(?PriProp_WakeUpExp, ExpNew),
	{_, LvOld} = getWakeSkillLvByExp(ExpOld),
	{ExpLeft, LvNew} = getWakeSkillLvByExp(ExpNew),
	case LvNew of
		LvOld when ExpOld > 0 ->
			skip;
		_ ->
			playerPropSync:setInt(?PubProp_WakeSkillLv, LvNew),
			playerSkillLearn:openWakeSkill()
	end,
	{ExpLeft, LvNew}.

-spec addPlayerProp(WeaponID :: uint8(), OldLevel::uint8(), Level::uint8()) -> ok.
addPlayerProp(WeaponID, OldLevel, NewLevel) ->
	%%先删除旧的属性
	OldPropList = case OldLevel > 0 of
					  false ->
						  [];
					  _ ->
						  getPropList(WeaponID, OldLevel)
				  end,

	playerCalcProp:changeProp_CalcType(OldPropList, ?EquipOff, true),
	case NewLevel > 0 of
		true ->
			PropList = getPropList(WeaponID, NewLevel),
			playerCalcProp:changeProp_CalcType(PropList, ?EquipOn, true);
		_ ->
			skip
	end,
	ok.

%%激活玩家的神器技能，默认等级为1
activateGodWeaponSkill(WeaponID, WeaponLevel) ->
	%%激活第一个技能的时候把怒气设满
	case WeaponID =:= 1 of
		true ->
			MaxCour = playerSkill:getMaxCourage(),
			playerState:setPlayerCourage(MaxCour),
			playerBase:sendPropCour(MaxCour);
		_ ->
			skip
	end,
	WeaponInfoList = playerState:getGodWeaponInfo(),
	OldWeaponInfo = lists:keyfind(WeaponID, #rec_god_weapon.weaponID, WeaponInfoList),
	NewWeaponInfo = OldWeaponInfo#rec_god_weapon{skillLevel = 1},
	saveWeaponInfo(WeaponID, WeaponInfoList, NewWeaponInfo),
	#shenqiCfg{skill = SkillIDs} = getCfg:getCfgByKey(cfg_shenqi, WeaponID, WeaponLevel),
	SkillID = getMySkillID(SkillIDs),
	playerSkill:addGodWeaponSkill(SkillID, 1),
	playerMsg:sendNetMsg(#pk_GS2U_LevelUpGodWeaponSkillResult{weaponID = WeaponID, skillLevel = 1}),
	ok.
%%更新玩家的神器技能
updateGodWeaponSkill(WeaponID, WeaponLevel, SkillLevel) ->
	#shenqiCfg{skill = SkillIDs} = getCfg:getCfgByKey(cfg_shenqi, WeaponID, WeaponLevel),
	SkillID = getMySkillID(SkillIDs),
	%%先删除旧的
	playerSkill:delGodWeaponSkill(SkillID),
	%%加新的
	playerSkill:addGodWeaponSkill(SkillID, SkillLevel),
	ok.

getCoinUseType(CoinType) ->
	case CoinType of
		?CoinTypeGold ->
			?CoinUseTypeGold;
		?CoinTypePrestige ->
			?CoinUseTypePrestige;
		?CoinTypeHonor ->
			?CoinUseTypeHonor;
		?CoinTypeDiamond ->
			?CoinUseTypeDiamond;
		?CoinTypeBindDiamond ->
			?CoinUseTypeDiamond;
		_ ->
			0
	end.

getPropList(WeaponID, Level) ->
	Career = playerState:getCareer(),
	#shenqiCfg{paladin = Paladin, wizard = Wizard, assassin = Assassin, soulReaper = SoulReaper, mechanic = Mechanic}
		= getCfg:getCfgPStack(cfg_shenqi, WeaponID, Level),
	PropList = case ?Career2CareerMain(Career) of
				   ?CareerMain_1_Warrior ->
					   %% 骑士
					   Paladin;
				   ?CareerMain_2_Magician ->
					   %% 魔法师
					   Wizard;
				   ?CareerMain_3_Bravo ->
					   %% 刺客
					   Assassin;
				   ?CareerMain_4 ->
					   %% 灵魂收割者
					   SoulReaper;
					?CareerMain_5 ->
						Mechanic;
				   _ ->
						?ERROR_OUT("gold weapon getPropList error Career[~p]", [Career]),
					   []
			   end,
	PropList.
saveWeaponInfo(WeaponID, OldWeaponInfoList, NewWeaponInfo) ->
	NewWeaponInfoList = case lists:keyfind(WeaponID, #rec_god_weapon.weaponID, OldWeaponInfoList) of
							false ->
								[NewWeaponInfo | OldWeaponInfoList];
							_ ->
								lists:keyreplace(WeaponID, #rec_god_weapon.weaponID, OldWeaponInfoList, NewWeaponInfo)
						end,
	playerState:setGodWeaponInfo(NewWeaponInfoList),
	playerSave:saveGodWeaponInfo(NewWeaponInfo),
	ok.

%%供远程玩家查看神器信息
getWeaponToQuerytRPProp() ->
    WeaponList = playerState:getGodWeaponInfo(),
    Fun = fun(#rec_god_weapon{
                weaponID = WeaponID,
                weaponLevel = WeaponLevel,
                skillLevel = SkillLevel
                }) ->
         #pk_LookGodWeaponInfo{
            weaponID = WeaponID,
            weaponLevel = WeaponLevel,
            skillLevel = SkillLevel}
       end,
    lists:map(Fun, WeaponList).



%% 计算器灵产生的经验值
-spec freshWakeSkillFromGodWeapon() -> Exp::uint32().
freshWakeSkillFromGodWeapon() ->
	%%?DEBUG_OUT("[DebugForQL] freshWakeSkillFromGodWeapon~n~p", [playerState:getGodWeaponInfo()]),
	FunExp =
		fun(#rec_god_weapon{weaponID = ID, weaponLevel = Lv}, Exp) ->
			{_, Exp_} = freshWakeSkillFromGodWeapon_(ID, {Lv, 0}),
			Exp + Exp_
		end,
	lists:foldl(FunExp, 0, playerState:getGodWeaponInfo()).
freshWakeSkillFromGodWeapon_(ID, {Lv, Exp}) ->
	case Lv > 0 of
		true ->
			case getCfg:getCfgByKey(cfg_shenqi, ID, Lv) of
				#shenqiCfg{exp = Exp_} ->
					freshWakeSkillFromGodWeapon_(ID, {Lv - 1, Exp + Exp_});
			_ ->
				?ERROR_OUT("levelupWeapon can not find ID(~p) Lv(~p) from cfg_shenqi", [ID, Lv]),
				{0, 0}
			end;
		_ ->
			{Lv, Exp}
	end.

%% 根据经验判定当前觉醒技能等级
-spec getWakeSkillLvByExp(Exp::uint32()) -> {ExpLeft::uint32(), Lv::uint()}.
getWakeSkillLvByExp(Exp) ->
	FunGetExpList =
		fun(Lv, {ExpLeft, MaxLv}) ->
			case getCfg:getCfgByKey(cfg_transformspell, Lv, playerState:getCareer()) of
				#transformspellCfg{exp = Exp_} ->
					case ExpLeft >= Exp_ of
						true ->
							{ExpLeft - Exp_, Lv};
						_ ->
							{ExpLeft, MaxLv}
					end;
				_ ->
					?ERROR_OUT("getWakeSkillLvByExp can not find Lv(~p) from cfg_transformspell", [Lv]),
					{ExpLeft, MaxLv}
			end
		end,
	lists:foldl(FunGetExpList, {Exp, 1}, getCfg:get1KeyList(cfg_transformspell)).
