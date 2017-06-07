%%
%% @author chengxs
%% @doc @todo 天赋凝练.


-module(playerTalent).
-author(chengxs).
-include("gsInc.hrl").
-include("playerPrivate.hrl").
%%天赋技能作用类型
-define(TargetPlayer, 1).
-define(TargetPet, 2).
-define(GMNeedLevelUpExp, 1).
%%天赋ID
-define(PropIntensify, 1).
-define(PhyDefIntensify, 2).
-define(MagDefIntensify, 3).
-define(PetDamIntensify, 4).
-define(PetDefIntensify, 5).
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	getTalentInfoAck/1,
	sendTalentInfoToClient/0,
	talentLevelUp/1,
	getPetTalentProp/0
]).


-spec getTalentInfoAck(TalentInfoList :: #rec_talent{}) -> ok.
getTalentInfoAck(#rec_talent{} = TalentInfo) ->
	playerState:setTalentInfo(TalentInfo),
	initBattleProp(TalentInfo),
	ok.

%%给玩家初始化天赋系统加的属性
-spec initBattleProp(TalentInfo::#rec_talent{}) -> ok.
initBattleProp(TalentInfo) ->
	#rec_talent{propIntensify = PropIntensify,
		phyDefIntensify = PhyDefIntensify,
		magDefIntensify = MagDefIntensify,
		petDamIntensify = PetDamIntensify,
		petDefIntensify = PetDefIntensify} = TalentInfo,
	Fun = fun({Index, Level}) ->
		addPlayerProp(Index, Level)
		end,
	lists:foreach(Fun, [{1, PropIntensify}, {2, PhyDefIntensify}, {3, MagDefIntensify}, {4, PetDamIntensify}, {5, PetDefIntensify}]).

sendTalentInfoToClient() ->
	TalentInfo = playerState:getTalentInfo(),
	Fun = fun(ID, AccList) ->
		%%记录里前两位是记录名和roleID
		RealIndex = ID + 2,
		TalentLevel = element(RealIndex, TalentInfo),
		#talentPropCfg{maxLevel = MaxLevel} = getCfg:getCfgPStack(cfg_talentProp, ID),
		NextLevelExp = case TalentLevel < MaxLevel of
							 true ->
								 #talentExpCfg{exp = Exp} = getCfg:getCfgPStack(cfg_talentExp, TalentLevel + 1),
								 Exp;
						   _ ->
							   0
						 end,
		Info = #pk_TalentInfo{id = ID, level = TalentLevel, nextlevelexp = NextLevelExp},
		[Info | AccList]
	end,
	TalentInfos = lists:foldr(Fun, [], [?PropIntensify, ?PhyDefIntensify, ?MagDefIntensify, ?PetDamIntensify, ?PetDefIntensify]),
	?DEBUG_OUT("sendTalentInfoToClient[~p]",[TalentInfos]),
	playerMsg:sendNetMsg(#pk_GS2U_TalentInitAck{talentInfos = TalentInfos}).
-spec talentLevelUp(TalentID::uint8()) -> ok.
talentLevelUp(TalentID) ->
	%%记录里前两位是记录名和roleID
	RealIndex = TalentID + 2,
	TalentInfo = playerState:getTalentInfo(),
	TalentLevel = element(RealIndex, TalentInfo),
	NewTalentLevel = TalentLevel + 1,
	case canTalentLevelUp(TalentID, NewTalentLevel) of
		true ->
			%%升一级
			NewTalentInfo = erlang:setelement(TalentID + 2, TalentInfo, NewTalentLevel),
			#rec_talent{
				roleID = RoleID,
				propIntensify = V1,
				phyDefIntensify = V2,
				magDefIntensify = V3,
				petDamIntensify = V4,
				petDefIntensify = V5
			} = NewTalentInfo,
			playerSave:saveTalent(#rec_talent{
				roleID = RoleID,
				propIntensify = V1,
				phyDefIntensify = V2,
				magDefIntensify = V3,
				petDamIntensify = V4,
				petDefIntensify = V5
			}),
			playerState:setTalentInfo(NewTalentInfo),
			%%加属性
			addPlayerProp(TalentID, 1),
			%%保存完通知客户端
			%%下一级经验
			#talentPropCfg{target = Target, maxLevel = MaxLevel} = getCfg:getCfgPStack(cfg_talentProp, TalentID),
			case Target of
				?TargetPlayer ->
					playerForce:calcPlayerForce(?PlayerTalentForce, true);
				_ ->
					playerForce:calcBattlePetForce(?PetTalentForce, true)
			end,
			NextLevelExp = case NewTalentLevel < MaxLevel of
							   true ->
								   #talentExpCfg{exp = Exp} = getCfg:getCfgPStack(cfg_talentExp, NewTalentLevel + 1),
								   Exp;
							   _ ->
								   0
						   end,
			playerMsg:sendNetMsg(#pk_GS2U_TalentLevelUpSuccess{talentInfo = #pk_TalentInfo{id = TalentID,
				level = NewTalentLevel, nextlevelexp = NextLevelExp}}),
			playerMsg:sendErrorCodeMsg(?ErrorCode_TalentLevelUpSuccess);
		_ ->
			skip
	end,
	ok.
%% 天赋改变属性,每次都是加一级
-spec addPlayerProp(TalentID :: uint8(), Level::uint8()) -> ok.
addPlayerProp(_TalentID, _Level) ->
%%	case Level > 0 of
%%		true ->
%%			?DEBUG_OUT("TalentID = ~p", [TalentID]),
%%			Career = playerState:getCareer(),
%%			#talentPropCfg{target = Target, mechanic = Mechanic, paladin = Paladin, wizard = Wizard, assassin = Assassin, soulReaper = SoulReaper}
%%				= getCfg:getCfgPStack(cfg_talentProp, TalentID),
%%			PropList = case Career of
%%						   ?CareerMechanic ->
%%							   Mechanic;
%%						   ?Career_10_Warrior ->
%%							   %% 骑士
%%							   Paladin;
%%						   ?Career_20_Magician ->
%%							   %% 魔法师
%%							   Wizard;
%%						   ?Career_30_Bravo ->
%%							   %% 刺客
%%							   Assassin;
%%						   ?CareerTrainee ->
%%							   %% 灵魂收割者
%%							   SoulReaper
%%					   end,
%%			case Target of
%%				?TargetPlayer ->
%%					Fun1 = fun({PropID, Value, AddorRate}, {AccAddPropList, AccMultPropList}) ->
%%						case AddorRate of
%%							?CalcTypeAdd ->
%%								{[{PropID, Value*Level} | AccAddPropList], AccMultPropList};
%%							?CalcTypeMult ->
%%								{AccAddPropList, [{PropID, Value*Level} | AccMultPropList]};
%%							_ ->
%%								?ERROR_OUT("CalcType error CalcType = [~p]", [AddorRate])
%%						end
%%					end,
%%
%%					{AddPropList, MultPropList} = lists:foldl(Fun1, {[], []}, PropList),
%%					%%?DEBUG_OUT("AddPropList = ~p, MultPropList = ~p", [AddPropList, MultPropList]),
%%					BattleProp = playerCalcProp:getBattleProp(),
%%					NewBattleProp = battleProp:addBattlePropAddValue(BattleProp, AddPropList),
%%					NewBattleProp2 = battleProp:addBattlePropRateValue(NewBattleProp, MultPropList),
%%					?DEBUG_OUT("TargetPlayer AddPropList = ~p, MultPropList = ~p", [AddPropList, MultPropList]),
%%					playerCalcProp:calcBattleProp(NewBattleProp2, true, true);
%%				?TargetPet ->
%%					Fun2 = fun({PropID, Value, AddorRate}, {AccAddPropList1, AccMultPropList1}) ->
%%						case AddorRate of
%%							?CalcTypeAdd ->
%%								{[{PropID, Value*Level} | AccAddPropList1], AccMultPropList1};
%%							?CalcTypeMult ->
%%								{AccAddPropList1, [{PropID, Value*Level} | AccMultPropList1]};
%%							_ ->
%%								?ERROR_OUT("CalcType error CalcType = [~p]", [AddorRate])
%%						end
%%
%%					end,
%%					{AddPropList1, MultPropList1} = lists:foldl(Fun2, {[], []}, PropList),
%%					%%?DEBUG_OUT("AddPropList1 = ~p, MultPropList1 = ~p", [AddPropList1, MultPropList1]),
%%					%%?DEBUG_OUT("TargetPet AddPropList1 = ~p, MultPropList1 = ~p", [AddPropList1, MultPropList1]),
%%					playerPet:updateBattlePetProp(AddPropList1, MultPropList1, true);
%%				_ ->
%%					?ERROR_OUT("TargetType error TargetType = ~p", [Target])
%%			end;
%%		_ ->
%%			skip
%%	end,

	ok.
%%判断天赋是否可升级,可以的话把经验给扣了
-spec canTalentLevelUp(TalentID :: uint8(), TalentLevel :: uint8()) -> boolean().
canTalentLevelUp(TalentID, TalentLevel) ->
	%%满级才可以升天赋
	Level = playerState:getLevel(),
	OpenLevleLimit = globalCfg:getGlobalCfg(talentOpenPlayerLevelLimit),
	case Level >= OpenLevleLimit of
		true ->
			case TalentID =< length(getCfg:get1KeyList(cfg_talentProp)) of
				true ->
					#talentPropCfg{maxLevel = MaxLevel}
						= getCfg:getCfgPStack(cfg_talentProp, TalentID),
					case TalentLevel > MaxLevel of
						true ->
							%%天赋已升至满级
							playerMsg:sendErrorCodeMsg(?ErrorCode_TalentLevelMax),
							false;
						_ ->
							NeedExp = case playerState:getTalentGMFlag() of
										  1 ->
											  ?GMNeedLevelUpExp;
										  _ ->
											  #talentExpCfg{exp = NeedExp1} = getCfg:getCfgPStack(cfg_talentExp, TalentLevel),
											  NeedExp1
									  end,
							%%扣经验
							case playerBase:decExp(NeedExp, ?ExpOutTalentLevelUp, NeedExp) of
								true ->
									true;
								_ ->
									%%升级天赋的经验不足
									playerMsg:sendErrorCodeMsg(?ErrorCode_TalentNeedExpNotEnough),
									false
							end
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_TalentLevelUpFailed)
			end;
		_ ->
			%%满级才能提升天赋
			playerMsg:sendErrorCodeMsg(?ErrorCode_TalentLevelIsNotMax)
	end.

-spec getPetTalentProp() -> {AddPropList, MultiPropList} when AddPropList :: [{Key, Value}, ...] | [], MultiPropList :: [{Key, Value}, ...] | [], Key :: uint(), Value :: uint().
getPetTalentProp() ->    {[],[]}.
%%	Fun = fun(TalentID, {PropAddList, PropMultList}) ->
%%		#talentPropCfg{target = Target, mechanic = Mechanic, paladin = Paladin, wizard = Wizard, assassin = Assassin, soulReaper = SoulReaper}
%%			= getCfg:getCfgPStack(cfg_talentProp, TalentID),
%%		case Target of
%%			?TargetPet ->
%%				TalentInfo = playerState:getTalentInfo(),
%%				RealIndex = TalentID + 2,
%%				TalentLevel = element(RealIndex, TalentInfo),
%%				Career = playerState:getCareer(),
%%				PropList = case Career of
%%							   ?CareerMechanic ->
%%								   Mechanic;
%%							   ?Career_10_Warrior ->
%%								   %% 骑士
%%								   Paladin;
%%							   ?Career_20_Magician ->
%%								   %% 魔法师
%%								   Wizard;
%%							   ?Career_30_Bravo ->
%%								   %% 刺客
%%								   Assassin;
%%							   ?CareerTrainee ->
%%								   %% 灵魂收割者
%%								   SoulReaper
%%						   end,
%%				Fun1 = fun({PropID, Value, AddorRate}, {AccAdd, AccMult}) ->
%%					case AddorRate of
%%						?CalcTypeAdd ->
%%							{[{PropID, Value * TalentLevel} | AccAdd], AccMult};
%%						?CalcTypeMult ->
%%							{AccAdd, [{PropID, Value * TalentLevel} | AccMult]}
%%					end
%%
%%				end,
%%				{AddList, MultList} = lists:foldl(Fun1, {[], []}, PropList),
%%				?DEBUG_OUT("~p", [{AddList, MultList}]),
%%				{PropAddList ++ AddList, PropMultList ++ MultList};
%%			_ ->
%%				{PropAddList, PropMultList}
%%		end
%%	end,
%%	lists:foldl(Fun, {[], []}, getCfg:get1KeyList(cfg_talentProp)).