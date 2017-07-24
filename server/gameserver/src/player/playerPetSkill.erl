%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 七月 2017 17:01
%%%-------------------------------------------------------------------
-module(playerPetSkill).
-author("Administrator").

-include("playerPrivate.hrl").
-include("pet.hrl").
%% API
-export([
	petSkillOperate/3
	, canAutoUnLockPetSkill/3
]).


-define(PetSkillOperateUnlock, 1).
-define(PetSkillOperateLevelUp, 2).

%%%-------------------------------------------------------------------
canAutoUnLockPetSkill(PetInfo, SkillID, SkillLevel)->
	case getCfg:getCfgByKey(cfg_pet_skills_upgrading, SkillID, SkillLevel) of
		#pet_skills_upgradingCfg{} = Cfg ->
			checkSkillCondition(PetInfo, Cfg) andalso checkSkillCost(Cfg);
		_ ->
			false
	end.

%%%-------------------------------------------------------------------
petSkillOperate(?PetSkillOperateUnlock, PetID, SkillID) ->
	levelUptPetSkill(PetID, SkillID);
petSkillOperate(?PetSkillOperateLevelUp, PetID, SkillID) ->
	levelUptPetSkill(PetID, SkillID);
petSkillOperate(_Type, _PetID, _SkillID) ->
	ok.

%%%-------------------------------------------------------------------
levelUptPetSkill(PetID, SkillID) ->
	case canLevelUptPetSkill(PetID, SkillID) of
		{true, Cfg} ->
			doLevelUptPetSkill(PetID, SkillID, Cfg);
		{false, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode);
		_ ->
			skip
	end,
	ok.

doLevelUptPetSkill(PetID, SkillID,
	#pet_skills_upgradingCfg{item_cost = ItemList, coin_cost = CoinList}
) ->
	true = decItems(ItemList),
	true = useCoin(CoinList),
	playerPet:petSkillLevelUp(PetID, SkillID),
	syncPetSkillList(PetID, SkillID, playerState:getPetSkills(PetID)),
	ok.

canLevelUptPetSkill(PetID, SkillID) ->
	case checkSkillExist(PetID, SkillID) of
		{true, SkillInfo} ->
			case playerPet:getPetByID(PetID) of
				{ok, PetInfo} ->
					checkPet(PetInfo, SkillInfo);
				_ ->
					error
			end;
		V ->
			V
	end.

checkSkillExist(PetID, SkillID) ->
	SkillList = playerState:getPetSkills(PetID),
	case lists:keyfind(SkillID, #recPetSkill.skill_id, SkillList) of
		#recPetSkill{} = SkillInfo ->
			{true, SkillInfo};
		_ ->
			{false, ?ErrorCode_PetSkillNotExists}
	end.

checkPet(
	#recPetInfo{pet_level = PetLevel},
	#recPetSkill{skill_level = SkillLevel}
) when PetLevel =< SkillLevel->
	{false, ?ErrorCode_PetSkillCantSelfLevel};
checkPet(PetInfo, #recPetSkill{skill_id = SkillID, skill_level = SkillLevel}) ->
	case getCfg:getCfgByKey(cfg_pet_skills_upgrading, SkillID, SkillLevel + 1) of
		#pet_skills_upgradingCfg{} = Cfg ->
			case checkSkillCondition(PetInfo, Cfg) of
				true ->
					case checkSkillCost(Cfg) of
						true ->
							{true, Cfg};
						_ ->
							{false, ?ErrorCode_PetSkillCostNotEnough}
					end;
				_ ->
					{false, ?ErrorCode_PetSkillConditionErr}
			end;
		_ ->
			{false, ?ErrorCode_PetSkillMaxLevel}
	end;
checkPet(_PetID, _Skill) ->
	skip.

checkSkillCondition(
	PetInfo,
	#pet_skills_upgradingCfg{
		star_limit = StartLimit,
		reborn_limit = RebornLimit,
		level_limit = LevelLimit
	}
) ->
	case PetInfo of
		#recPetInfo{pet_star = Star, pet_raw = Reborn} ->
			PlayerLevel = playerState:getLevel(),
			if
				Star + 1 < StartLimit ->
					false;
				Reborn < RebornLimit ->
					false;
				PlayerLevel < LevelLimit ->
					false;
				true ->
					true
			end;
		_ ->
			false
	end.

checkSkillCost(#pet_skills_upgradingCfg{
	item_cost = ItemList,
	coin_cost = CoinList
}) ->
	IsItemOk =
		case ItemList of
			[ItemID, ItemNumber] ->
				#itemCfg{itemType = ItemType} = getCfg:getCfgPStack(cfg_item, ItemID),
				playerPackage:getGoodsNumByID(playerPackage:getPackageType(ItemType), ItemID) >= ItemNumber;
			_ ->
				true
		end,
	IsMoneyOk =
		case CoinList of
			[CoinUseType, UseNumber] ->
				playerMoney:canUseCoin(CoinUseType, UseNumber);
			_ ->
				true
		end,
	IsItemOk andalso IsMoneyOk.

decItems([ItemID, Num]) ->
	PLog = #recPLogTSItem{
		old = Num,
		new = 0,
		change = -Num,
		target = ?PLogTS_Pet,
		source = ?PLogTS_PlayerSelf,
		gold = 0,
		goldtype = 0,
		changReason = ?ItemDeleteReasonPetSkillLevelUp,
		reasonParam = 0
	},
	#itemCfg{itemType = ItemType} = getCfg:getCfgPStack(cfg_item, ItemID),
	playerPackage:delGoodsByID(playerPackage:getPackageType(ItemType), ItemID, Num, PLog);
decItems(_) ->
	true.

useCoin([UseType, Number]) ->
	playerMoney:useCoin(UseType, Number,
		#recPLogTSMoney{
			reason = ?CoinUsePetSkillLevelUp,
			param = 0,
			target = ?PLogTS_Pet,
			source = ?PLogTS_PlayerSelf
		});
useCoin(_) ->
	true.

%%%-------------------------------------------------------------------
syncPetSkillList(PetID, SkillID, PetSkills) ->
	case lists:keyfind(SkillID, #recPetSkill.skill_id, PetSkills) of
		#recPetSkill{
			skill_cd = CD,
			skill_id = SkillID,
			skill_index = Index,
			skill_level = Level,
			skill_type = Type,
			skill_is_unlock = Unlock
		} ->
			Time = time:getUTCNowMSDiff2010(),
			case Time >= CD of
				true ->
					NewCD = 0;
				_ ->
					NewCD = CD - Time
			end,
			Msg =
				#pk_GS2U_UpdatePetSkill{
					petID = PetID,
					skillInfo = #pk_PetSkillBaseInfo{
						petSkillIndex = Index,
						petSkillId = SkillID,
						petSkillType = Type,
						petSkillLv = Level,
						petSkillCd = NewCD,
						petSkillIsUnlock = Unlock
					}
				},
			playerMsg:sendNetMsg(Msg);
		_ ->
			skip
	end,
	ok.
