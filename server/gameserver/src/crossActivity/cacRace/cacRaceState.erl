%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, raink
%%% @doc
%%% 港口竞速-数据模块
%%% @end
%%% Created : 20170707
%%%-------------------------------------------------------------------
-module(cacRaceState).
-author("meitianyang").

-include("cacRacePrivate.hrl").

-compile(export_all).

%%%-------------------------------------------------------------------
% 初始化标记
-spec setInit(Is::boolean()) -> no_return().
setInit(Is) ->
	put(init, Is).
-spec getInit() -> true | term().
getInit() ->
	get(init).

%%%-------------------------------------------------------------------
% 获取赛场自增ID
-spec newID() -> uint().
newID() ->
	case get(id) of
		undefined ->
			0;
		ID ->
			New = ID + 1,
			put(id, New),
			New
	end.

%%%-------------------------------------------------------------------
% 查找地图信息：数据量最多上千所以没有做?EtsMapInfoHelper
% 查找地图信息（使用自增ID，参考newID/0）
-spec queryMapInfo(ID::uint()) -> #recRace{} | 0.
queryMapInfo(ID) ->
	case ets:lookup(?EtsMapInfo, ID) of
		[#recRace{} = R] ->
			R;
		_ ->
			0
	end.
% 查找地图信息（使用MapPid）
-spec queryMapInfoByMapPid(MapPid::pid()) -> #recRace{} | 0.
queryMapInfoByMapPid(MapPid) when erlang:is_pid(MapPid) ->
	Match = ets:fun2ms(fun(#recRace{mapPid = MapPid_} = R) when MapPid =:= MapPid_ -> R end),
	case ets:select(?EtsMapInfo, Match) of
		[#recRace{} = R] ->
			R;
		_ ->
			0
	end.
% 查找地图信息（使用报名组ID）
-spec queryMapInfoByApplyID(ApplyID::uint64()) -> #recRace{} | 0.
queryMapInfoByApplyID(0) ->
	0;
queryMapInfoByApplyID(ApplyID) ->
	FunCheck =
		fun
			(#pk_RaceTeamEx{base = #pk_RaceTeamBase{applyID = ApplyID_}}, _) when
				ApplyID =:= ApplyID_ ->
				{true, 0};
			(_, Acc) ->
				Acc
		end,
	FunQuery =
		fun(#recRace{teams = Teams} = R, Acc) ->
			case misc:foldlEx(FunCheck, {false, 0}, Teams) of
				{true, _} ->
					[R | Acc];
				_ ->
					Acc
			end
		end,
	case ets:foldl(FunQuery, [], ?EtsMapInfo) of
		[#recRace{} = R] ->
			R;
		_ ->
			0
	end.
% 查找地图信息（使用角色ID）
-spec queryMapInfoByRoleID(RoleID::uint64()) -> #recRace{} | 0.
queryMapInfoByRoleID(0) ->
	0;
queryMapInfoByRoleID(RoleID) ->
	FunCheck =
		fun(#pk_RaceTeamEx{base = #pk_RaceTeamBase{members = Members}}, Acc) ->
			case lists:member(RoleID, Members) of
				true ->
					{true, 0};
				_ ->
					Acc
			end
		end,
	FunQuery =
		fun(#recRace{teams = Teams} = R, Acc) ->
			case misc:foldlEx(FunCheck, {false, 0}, Teams) of
				{true, _} ->
					[R | Acc];
				_ ->
					Acc
			end
		end,
	case ets:foldl(FunQuery, [], ?EtsMapInfo) of
		[#recRace{} = R] ->
			R;
		_ ->
			0
	end.

%%%-------------------------------------------------------------------
%% 覆盖型插入地图信息
-spec replaceMapInfo(#recRace{}) -> no_return().
replaceMapInfo(#recRace{} = R) ->
	ets:insert(?EtsMapInfo, R).

%%%-------------------------------------------------------------------
%% 删除地图信息
-spec deleteMapInfo(#recRace{}|uint()) -> no_return().
deleteMapInfo(#recRace{id = ID}) ->
	ets:delete(?EtsMapInfo, ID);
deleteMapInfo(ID) ->
	ets:delete(?EtsMapInfo, ID).

%%%-------------------------------------------------------------------
%% 根据参数重置子玩法模式
-spec getMod() -> {Mod::uint(), Count::uint()} | undefined.
getMod() ->
	get(mod).
-spec resetMod() -> {boolean(), uint()}.
resetMod() ->
	%% 每次活动结束后重置随机模式，根据配置在N次内随机不重复，超过N次则重新随机
	%% 注意模式数不能小于N
	#globalsetupCfg{setpara = [N]} =
		getCfg:getCfgPStack(cfg_globalsetup, race_mod),
	case getMod() of
		undefined ->
			List = lists:seq(?SubType_BEGIN, ?SubType_END),
			[Mod | T] = misc:shuffle(List),
			put(mod, {Mod, 1}),
			put(modList, T),
			{false, Mod};	%% 初始化不需要通知
		{_ModOld, Count} when Count >= N ->
			List = lists:seq(?SubType_BEGIN, ?SubType_END),
			[Mod | T] = misc:shuffle(List),
			put(mod, {Mod, 1}),
			put(modList, T),
			{true, Mod};
		{_ModOld, Count} ->
			[Mod | T] = get(modList),
			put(mod, {Mod, Count + 1}),
			put(modList, T),
			{true, Mod}
	end.

%%%-------------------------------------------------------------------
%% 每次活动开始从cfg_object初始化最大里程碑序号
-spec resetMilestoneMax() -> no_return().
resetMilestoneMax() ->
	List1Key = getCfg:get1KeyList(cfg_object),
	Max = resetMilestoneMax(List1Key, 0),
	put(milestoneMax, Max).
resetMilestoneMax([], Acc) ->
	Acc;
resetMilestoneMax([H | T], Acc) ->
	case getCfg:getCfgByKey(cfg_object, H) of
		#objectCfg{type = ?GatherType_Race, param1 = ?OBT_Milestone, param2 = [Index]} when
			Index > Acc ->
			resetMilestoneMax(T, Index);
		_ ->
			resetMilestoneMax(T, Acc)
	end.
-spec getMilestoneMax() -> uint().
getMilestoneMax() ->
	get(milestoneMax).

%%%-------------------------------------------------------------------
%% 每次活动开始从cfg_race_item初始化道具随机概率
%% 根据名次不同，获得道具的权值不同，故cfg_race_item.rand是个列表，对应不同名次
%% 每次重置既保证热更功能有效又能优化运算
-spec resetItemRand() -> no_return().
resetItemRand() ->
	List1Key = getCfg:get1KeyList(cfg_race_item),
	ListRandSplit = resetItemRand_split(List1Key, []),
	ListRand = [resetItemRand(ListRandSplitCell, {[], 0}) || ListRandSplitCell <- ListRandSplit],
	put(itemRand, ListRand).

% 将每个记录的列表分离为每个名次的随机表
resetItemRand_split([], Acc) ->
	Acc;
resetItemRand_split([H | T], Acc) ->
	#race_itemCfg{rand = ListRand} =
		getCfg:getCfgByKey(cfg_race_item, H),
	AccNew = resetItemRand_splitCell(ListRand, Acc, H, []),
	resetItemRand_split(T, AccNew).
resetItemRand_splitCell([], [], _ID, Acc) ->
	lists:reverse(Acc);
resetItemRand_splitCell([], [H | T], ID, Acc) ->
	resetItemRand_splitCell([], T, ID, [H | Acc]);
resetItemRand_splitCell([H | T], [], ID, Acc) ->
	resetItemRand_splitCell(T, [], ID, [[{ID, H}] | Acc]);
resetItemRand_splitCell([H1 | T1], [H2 | T2], ID, Acc) ->
	resetItemRand_splitCell(T1, T2, ID, [[{ID, H1} | H2] | Acc]).

% 初始化每个名次的随机表
resetItemRand([], Acc) ->
	Acc;
resetItemRand([{ID, Rand} | T], {List, Sum}) when Rand > 0 ->
	AccNew = {
		[{Sum + Rand, ID} | List],
		Sum + Rand
	},
	resetItemRand(T, AccNew);
resetItemRand([_H | T], Acc) ->
	resetItemRand(T, Acc).

-spec randItem(SortID::uint()) -> ItemID::uint8().
randItem(SortID) ->
	ListAll = get(itemRand),
	{List, Sum} = lists:nth(SortID, ListAll),
	Rand = misc:rand(1, Sum),
	randItem(List, Rand).
randItem([], _Rand) ->
	?ERROR_OUT("invalid logic"),
	0;
randItem([{RandMax, ItemID} | _T], Rand) when Rand =< RandMax ->
	ItemID;
randItem([_ | T], Rand) ->
	randItem(T, Rand).
