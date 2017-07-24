%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170103
%%%-------------------------------------------------------------------
-module(marriageState).
-author("meitianyang").

-include("marriagePrivate.hrl").

-compile(export_all).

%% 查询另一半ID
-spec queryMarriageRoleID(RoleID::uint64()) -> TargetRoleID::uint64().
queryMarriageRoleID(RoleID) ->
	case queryRelation(RoleID) of
		#rec_marriage{targetRoleID = TID} ->
			TID;
		_ ->
			0
	end.

%% 查询姻缘关系
-spec queryRelation(RoleID::uint64()) -> #rec_marriage{}.
queryRelation(RoleID) ->
	case ets:lookup(?EtsMarriageData, RoleID) of
		[#rec_marriage{} = Rec] ->
			Rec;
		_ ->
			?DefaultValueOfMarriage(RoleID)
	end.

%% 查询夫妻技能槽位状态
-spec querySlots(RoleID::uint64()) -> [{SlotID::uint32(), SlotExp::uint32()}, ...].
querySlots(RoleID) ->
	case ets:lookup(?EtsMarriageSkill, RoleID) of
		[#recMarriageSkill{slots = Slots}] ->
			Slots;
		_ ->
			[]
	end.

%% 查询指定夫妻技能槽位的经验
-spec querySlotExp(RoleID::uint64(), SlotID::uint32()) -> SlotExp::uint32().
querySlotExp(RoleID, SlotID) ->
	case ets:lookup(?EtsMarriageSkill, RoleID) of
		[#recMarriageSkill{slots = Slots}] ->
			case lists:keyfind(SlotID, 1, Slots) of
				{_, SlotExp} ->
					SlotExp;
				_ ->
					0
			end;
		_ ->
			0
	end.

%% 覆写姻缘关系
-spec replaceRelation(Relation::#rec_marriage{}) -> ok.
replaceRelation(Relation) ->
	ets:insert(?EtsMarriageData, Relation),
	ok.

%% 覆写夫妻技能槽位
-spec replaceSlot(Slot::#rec_marriage_skill{}) -> ok.
replaceSlot(#rec_marriage_skill{roleID = RoleID, slotID = SlotID, slotExp = SlotExp}) ->
	Slots = querySlots(RoleID),
	SlotsNew = lists:keystore(SlotID, 1, Slots, {SlotID, SlotExp}),
	ets:insert(?EtsMarriageSkill, #recMarriageSkill{roleID = RoleID, slots = SlotsNew}),
	ok.

%% 一大波配置
configTimeOut() ->
	#globalsetupCfg{setpara = [Value]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [60]},
			marriage_TimeOut
		),
	Value.
configBreakCost() ->
	#globalsetupCfg{setpara = [Value]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [20000]},
			marriage_BreakCost
		),
	Value.
configStringBoradcast(RoleID, ItemID, TargetRoleID, Count) ->
	RoleName = playerNameUID:getPlayerNameByUID(RoleID),
	#itemCfg{name = ItemName} = getCfg:getCfgByKey(cfg_item, ItemID),
	TargetRoleName = playerNameUID:getPlayerNameByUID(TargetRoleID),
	stringCfg:getString(marriage_Boradcast, [RoleName, ItemName, TargetRoleName, Count]).
configStringMailTitleBuild() ->
	stringCfg:getString(marriage_TitleBuild).
configStringMailContentBuild(RoleID, Count) ->
	stringCfg:getString(marriage_ContentBuild, [playerNameUID:getPlayerNameByUID(RoleID), Count]).
configStringMailTitleBreak() ->
	stringCfg:getString(marriage_TitleBreak).
configStringMailContentBreak(RoleID) ->
	stringCfg:getString(marriage_ContentBreak, [playerNameUID:getPlayerNameByUID(RoleID)]).
configStringMailTitleBuildFaild() ->
	stringCfg:getString(marriage_TitleBuildFaild).
configStringMailContentBuildFaild(RoleID) ->
	stringCfg:getString(marriage_ContentBuildFaild, [playerNameUID:getPlayerNameByUID(RoleID)]).
configRingItemList() ->
	#globalsetupCfg{setpara = List} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = []},
			marriage_RingItemList
		),
	List.
configFriendlinessLimit() ->
	#globalsetupCfg{setpara = [Value]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [100]},
			marriage_FriendlinessLimit
		),
	Value.
configFriendlinessDownWithTeam() ->
	#globalsetupCfg{setpara = [Value]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [50]},
			marriage_FriendlinessDownWithTeam
		),
	Value.
configFriendlinessDownWithoutTeam() ->
	#globalsetupCfg{setpara = [Value]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [1]},
			marriage_FriendlinessDownWithoutTeam
		),
	Value.
-spec configClosenessLimitEveryday(Reason::type_mcs()) -> uint32().
configClosenessLimitEveryday(Reason) ->
	#globalsetupCfg{setpara = List} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = []},
			marriage_ClosenessLimitEveryday
		),
	case erlang:length(List) < Reason + 1 of
		true ->
			0;
		_ ->
			lists:nth(Reason + 1, List)
	end.
configKillMonsterAddCloseness() ->
	#globalsetupCfg{setpara = [Value]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [1]},
			marriage_KillMonsterGetCloseness
		),
	Value.
configFerescale() ->
	#globalsetupCfg{setpara = [Value]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [1.0]},
			marriage_ferescale
		),
	Value.
configTaskFidlist() ->
	#globalsetupCfg{setpara = List} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = []},
			marriage_taskFidlist
		),
	List.

%% 根据经验、槽位，取得配置和剩余经验
-spec configSkillCur(SlotID::uint32(), Exp::uint32()) -> {Cfg::#spouseskillCfg{}, ExpLeft::uint32()}.
configSkillCur(SlotID, Exp) ->
	FunGetCfg =
		fun(Level, {_, {CfgLast, ExpLeft}}) ->
			Cfg = getCfg:getCfgByKey(cfg_spouseskill, SlotID, Level),
			#spouseskillCfg{exp = NeedExp} = Cfg,
			case ExpLeft >= NeedExp of
				true ->
					{false, {Cfg, ExpLeft - NeedExp}};
				_ ->
					{true, {CfgLast, ExpLeft}}
			end
		end,
	{_, Ret} = misc:foldlEx(FunGetCfg, {false, {getCfg:getCfgByKey(cfg_spouseskill, SlotID, 1), Exp}}, getCfg:get2KeyList(cfg_spouseskill, SlotID)),
	Ret.
%% 获取槽位最大等级配置
-spec configSkillMax(SlotID::uint32()) -> Cfg::#spouseskillCfg{}.
configSkillMax(SlotID) ->
	LevelMax = lists:last(getCfg:get2KeyList(cfg_spouseskill, SlotID)),
	getCfg:getCfgByKey(cfg_spouseskill, SlotID, LevelMax).
%% 获得指定角色等级、婚戒总等级可以学习的最大槽位等级相关信息
-spec configSkillLimit(SlotID::uint32(), RoleLevel::uint(), RingLevel::uint32()) -> {CfgLimitLast::#spouseskillCfg{}, NeedExpMax::uint32(), CfgCannotNext::#spouseskillCfg{}|0}.
configSkillLimit(SlotID, RoleLevel, RingLevel) ->
	FunGetCfg =
		fun(Level, {_, {CfgLimitLast, NeedExpMax, CfgCannotNext}}) ->
			Cfg = getCfg:getCfgByKey(cfg_spouseskill, SlotID, Level),
			#spouseskillCfg{
				skilllevel = SkillLevel,
				level = LevelLimit,
				exp = NeedExp
			} = Cfg,
			case RoleLevel >= LevelLimit andalso RingLevel >= SkillLevel of
				true ->
					{false, {Cfg, NeedExp + NeedExpMax, CfgCannotNext}};
				_ ->
					{true, {CfgLimitLast, NeedExp + NeedExpMax - 1, Cfg}}
			end
		end,
	{_, Ret} = misc:foldlEx(FunGetCfg, {false, {getCfg:getCfgByKey(cfg_spouseskill, SlotID, 1), 0, 0}}, getCfg:get2KeyList(cfg_spouseskill, SlotID)),
	Ret.
%% 根据婚戒突破次数、经验值，取得婚戒配置
-spec configRingCur(Top::uint32(), Exp::uint32()) -> {Cfg::#weddingringCfg{}, ExpLeft::uint32()}.
configRingCur(Top, Exp) ->
	FunGetCfg =
		fun(Level, {_, {_, ExpLeft}}) ->
			case getCfg:getCfgByKey(cfg_weddingring, Top, Level) of
				#weddingringCfg{exp = ExpLimit} = CfgLast when ExpLeft >= ExpLimit ->
					{false, {CfgLast, ExpLeft - ExpLimit}};
				Cfg ->
					{true, {Cfg, ExpLeft}}
			end
		end,
	{_, Ret} = misc:foldlEx(FunGetCfg, {false, {0, Exp}}, getCfg:get2KeyList(cfg_weddingring, Top)),
	Ret.
%% 获得指定阶段可以将婚戒升级至待突破的经验
-spec configRingLimit(Top::uint32()) -> NeedExpMax::uint32().
configRingLimit(Top) ->
	FunGetExp =
		fun(Level, ExpMax) ->
			#weddingringCfg{exp = Exp} = getCfg:getCfgByKey(cfg_weddingring, Top, Level),
			Exp + ExpMax
		end,
	misc:foldlEx(FunGetExp, 0, getCfg:get2KeyList(cfg_weddingring, Top)).
%% 获得婚戒总等级
-spec configRingLevel(Top::uint32(), Exp::uint32()) -> Level::uint32().
configRingLevel(Top, Exp) ->
	{#weddingringCfg{level = Lv}, _} = configRingCur(Top, Exp),
	configRingLevel_(Top - 1, Lv).
configRingLevel_(0, LvAcc) ->
	LvAcc;
configRingLevel_(Top, LvAcc) ->
	configRingLevel_(Top - 1, erlang:length(getCfg:get2KeyList(cfg_weddingring, Top)) + LvAcc).

%% 获取当前时间
%% 由于该时间可能会与客户端通讯，故采用与客户端的同步时间
-spec now() -> uint32().
now() ->
	time:getSyncTimeFromDBS().