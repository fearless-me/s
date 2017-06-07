%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170303
%%%-------------------------------------------------------------------
-module(acPetTerritoryState).
-author("meitianyang").

-include("acPetTerritoryPrivate.hrl").

%% API
-compile(export_all).

%%% ====================================================================
%%% 领地数据管理（DB相关）
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 加载玩家对应领地数据
-spec loadDB_Player(ListPlayer::[#rec_player_territory{}, ...]) -> ok.
loadDB_Player([]) ->
	ok;
loadDB_Player([H|T]) ->
	replacePlayer(H),
	loadDB_Player(T).

%%% --------------------------------------------------------------------
%% 加载玩家对应骑宠数据
-spec loadDB_Pet(ListPet::[#rec_player_territory_pet{}, ...]) -> ok.
loadDB_Pet([]) ->
	ok;
loadDB_Pet([H|T]) ->
	replacePet(H),
	loadDB_Pet(T).

%%% --------------------------------------------------------------------
%% 加载玩家对应掠夺记录
-spec loadDB_HistoryA(ListHistoryA::[#rec_player_territory_history_a{}, ...]) -> ok.
loadDB_HistoryA([]) ->
	ok;
loadDB_HistoryA([H|T]) ->
	replaceHistoryA(H),
	loadDB_HistoryA(T).

%%% --------------------------------------------------------------------
%% 加载玩家对应防守记录
-spec loadDB_HistoryD(ListHistoryD::[#rec_player_territory_history_d{}, ...]) -> ok.
loadDB_HistoryD([]) ->
	ok;
loadDB_HistoryD([H|T]) ->
	replaceHistoryD(H),
	loadDB_HistoryD(T).

%%% 分隔符 --------------------------------------------------------------------
%%% 分隔符 --------------------------------------------------------------------

%%% --------------------------------------------------------------------
%% 查询玩家对应领地数据
-spec queryPlayer(RoleID::uint64()) -> ListPlayer::[#rec_player_territory{}, ...].
queryPlayer(RoleID) ->
	case ets:lookup(?EtsTerritoryPlayerData, RoleID) of
		[#recTerritoryData{value = ListPlayer}] ->
			ListPlayer;
		_ ->
			[]
	end.

-spec queryPlayer(RoleID::uint64(), TerritoryID::uint32()) -> #rec_player_territory{} | undefined.
queryPlayer(RoleID, TerritoryID) ->
	case lists:keyfind(TerritoryID, #rec_player_territory.territoryID, queryPlayer(RoleID)) of
		false ->
			undefined;
		Rec ->
			Rec
	end.

%%% --------------------------------------------------------------------
%% 查询玩家对应骑宠数据
-spec queryPet(RoleID::uint64()) -> ListPet::[#rec_player_territory_pet{}, ...].
queryPet(RoleID) ->
	case ets:lookup(?EtsTerritoryPetData, RoleID) of
		[#recTerritoryData{value = ListPet}] ->
			ListPet;
		_ ->
			[]
	end.

-spec queryPet(RoleID::uint64(), PetID::uint64()) -> #rec_player_territory_pet{} | undefined.
queryPet(RoleID, PetID) ->
	case lists:keyfind(PetID, #rec_player_territory_pet.petID, queryPet(RoleID)) of
		false ->
			undefined;
		Rec ->
			Rec
	end.

-spec queryPetByTerritoryID(RoleID::uint64(), TerritoryID::uint32()) -> [#rec_player_territory_pet{}, ...].
queryPetByTerritoryID(RoleID, TerritoryID) ->
	FunFilter =
		fun(#rec_player_territory_pet{territoryID = TerritoryID_} = Rec, R) ->
			case TerritoryID_ of
				TerritoryID ->
					[Rec | R];
				_ ->
					R
			end
		end,
	lists:foldl(FunFilter, [], queryPet(RoleID)).

%%% --------------------------------------------------------------------
%% 查询玩家对应掠夺记录
-spec queryHistoryA(RoleID::uint64()) -> ListHistoryA::[#rec_player_territory_history_a{}, ...].
queryHistoryA(RoleID) ->
	case ets:lookup(?EtsTerritoryHistoryAData, RoleID) of
		[#recTerritoryData{value = ListHistoryA}] ->
			ListHistoryA;
		_ ->
			[]
	end.

%%% --------------------------------------------------------------------
%% 查询玩家对应防守记录
-spec queryHistoryD(RoleID::uint64()) -> ListHistoryD::[#rec_player_territory_history_d{}, ...].
queryHistoryD(RoleID) ->
	case ets:lookup(?EtsTerritoryHistoryDData, RoleID) of
		[#recTerritoryData{value = ListHistoryD}] ->
			ListHistoryD;
		_ ->
			[]
	end.

%%% 分隔符 --------------------------------------------------------------------
%%% 分隔符 --------------------------------------------------------------------

%%% --------------------------------------------------------------------
%% 覆写玩家对应领地数据
-spec replacePlayer(Data::#rec_player_territory{}) -> DBOPT::type_dbopt().
replacePlayer(#rec_player_territory{roleID = RoleID, territoryID = TerritoryID} = Rec) ->
	case queryPlayer(RoleID) of
		[] ->
			ets:insert(?EtsTerritoryPlayerData, #recTerritoryData{roleID = RoleID, value = [Rec]}),
			?DBOPT_INSERT;	%% 从无到有，插入
		ListPlayer ->
			case lists:keyfind(TerritoryID, #rec_player_territory.territoryID, ListPlayer) of
				false ->
					ets:insert(?EtsTerritoryPlayerData, #recTerritoryData{roleID = RoleID, value = [Rec | ListPlayer]}),
					?DBOPT_INSERT;	%% 新增，插入
				Rec ->
					?DBOPT_ERROR;	%% 插入内容已有，且相同，插入失败
				_ ->
					ListPlayerNew = lists:keystore(TerritoryID, #rec_player_territory.territoryID, ListPlayer, Rec),
					ets:insert(?EtsTerritoryPlayerData, #recTerritoryData{roleID = RoleID, value = ListPlayerNew}),
					?DBOPT_UPDATE	%% 插入内容已有，且不同，更新
			end
	end.

%%% --------------------------------------------------------------------
%% 覆写玩家对应骑宠数据
-spec replacePet(Data::#rec_player_territory_pet{}) -> DBOPT::type_dbopt().
replacePet(#rec_player_territory_pet{prop = Prop, skill = Skill} = Rec) when erlang:is_binary(Prop) ->
	replacePet(
		Rec#rec_player_territory_pet{
			prop	= misc:string_to_term(erlang:binary_to_list(Prop)),
			skill	= misc:string_to_term(erlang:binary_to_list(Skill))
		}
	);
replacePet(#rec_player_territory_pet{roleID = RoleID, petID = PetID} = Rec) ->
	case queryPet(RoleID) of
		[] ->
			ets:insert(?EtsTerritoryPetData, #recTerritoryData{roleID = RoleID, value = [Rec]}),
			?DBOPT_INSERT;	%% 从无到有，插入
		ListPet ->
			case lists:keyfind(PetID, #rec_player_territory_pet.petID, ListPet) of
				false ->
					ets:insert(?EtsTerritoryPetData, #recTerritoryData{roleID = RoleID, value = [Rec | ListPet]}),
					?DBOPT_INSERT;	%% 新增，插入
				Rec ->
					?DBOPT_ERROR;	%% 插入内容已有，且相同，插入失败
				_ ->
					ListPetNew = lists:keystore(PetID, #rec_player_territory_pet.petID, ListPet, Rec),
					ets:insert(?EtsTerritoryPetData, #recTerritoryData{roleID = RoleID, value = ListPetNew}),
					?DBOPT_UPDATE	%% 插入内容已有，且不同，更新
			end
	end.

%%% --------------------------------------------------------------------
%% 覆写玩家对应掠夺记录
-spec replaceHistoryA(Data::#rec_player_territory_history_a{}) -> DBOPT::type_dbopt().
replaceHistoryA(#rec_player_territory_history_a{roleID = RoleID} = Rec) ->
	ets:insert(?EtsTerritoryHistoryAData, #recTerritoryData{roleID = RoleID, value = [Rec | queryHistoryA(RoleID)]}),
	?DBOPT_INSERT.	%% 新增，插入

%%% --------------------------------------------------------------------
%% 覆写玩家对应防守记录
-spec replaceHistoryD(Data::#rec_player_territory_history_d{}) -> DBOPT::type_dbopt().
replaceHistoryD(#rec_player_territory_history_d{roleID = RoleID} = Rec) ->
	ets:insert(?EtsTerritoryHistoryDData, #recTerritoryData{roleID = RoleID, value = [Rec | queryHistoryD(RoleID)]}),
	?DBOPT_INSERT.	%% 新增，插入

%%% 分隔符 --------------------------------------------------------------------
%%% 分隔符 --------------------------------------------------------------------

%%% --------------------------------------------------------------------
%% 删除玩家对应领地数据 （包含了清除搜索历史记录的CD，但其派驻骑宠需要另外手动调用，以得到需要写数据库的参数）
-spec deletePlayer(Data::#rec_player_territory{}) -> DBOPT::type_dbopt().
deletePlayer(#rec_player_territory{roleID = RoleID, territoryID = TerritoryID}) ->
	deletePlayer(RoleID, TerritoryID).

-spec deletePlayer(RoleID::uint64(), TerritoryID::uint32()) -> DBOPT::type_dbopt().
deletePlayer(RoleID, TerritoryID) ->
	case queryPlayer(RoleID) of
		[] ->
			?DBOPT_ERROR;	%% 没有什么可以删除的，删除失败
		ListPlayer ->
			case lists:keydelete(TerritoryID, #rec_player_territory.territoryID, ListPlayer) of
				ListPlayer ->
					?DBOPT_ERROR;	%% 删除结果与删除前没有变化，删除失败
				[] ->
					ets:delete(?EtsTerritoryPlayerData, RoleID),
					deleteSearch({RoleID, TerritoryID}),
					?DBOPT_DELETE;	%% 删除结果导致该角色ID下结果集为空，清空根节点
				ListPlayerNew ->
					ets:insert(?EtsTerritoryPlayerData, #recTerritoryData{roleID = RoleID, value = ListPlayerNew}),
					deleteSearch({RoleID, TerritoryID}),
					?DBOPT_DELETE	%% 删除结果与删除前有变化，删除成功
			end
	end.

%%% --------------------------------------------------------------------
%% 删除玩家对应骑宠数据
-spec deletePet(Data::#rec_player_territory_pet{}) -> DBOPT::type_dbopt().
deletePet(#rec_player_territory_pet{roleID = RoleID, petID = PetID}) ->
	deletePet(RoleID, PetID).

-spec deletePet(RoleID::uint64(), PetID::uint64()) -> DBOPT::type_dbopt().
deletePet(RoleID, PetID) ->
	case queryPet(RoleID) of
		[] ->
			?DBOPT_ERROR;	%% 没有什么可以删除的，删除失败
		ListPet ->
			case lists:keydelete(PetID, #rec_player_territory_pet.petID, ListPet) of
				ListPet ->
					?DBOPT_ERROR;	%% 删除结果与删除前没有变化，删除失败
				[] ->
					ets:delete(?EtsTerritoryPetData, RoleID),
					?DBOPT_DELETE;	%% 删除结果导致该角色ID下结果集为空，清空根节点
				ListPetNew ->
					ets:insert(?EtsTerritoryPetData, #recTerritoryData{roleID = RoleID, value = ListPetNew}),
					?DBOPT_DELETE	%% 删除结果与删除前有变化，删除成功
			end
	end.

-spec deletePetByTerritory(Territory::#rec_player_territory{}) -> [{DBOPT::type_dbopt(), Pet::#rec_player_territory_pet{}}, ...].
deletePetByTerritory(#rec_player_territory{roleID = RoleID, territoryID = TerritoryID}) ->
	deletePetByTerritory(RoleID, TerritoryID).

-spec deletePetByTerritory(RoleID::uint64(), TerritoryID::uint32()) -> [{DBOPT::type_dbopt(), Pet::#rec_player_territory_pet{}}, ...].
deletePetByTerritory(RoleID, TerritoryID) ->
	ListPet = queryPet(RoleID),
	FunDelete =
		fun(#rec_player_territory_pet{territoryID = TerritoryID_} = Rec, R) ->
			case TerritoryID_ of
				TerritoryID ->
					[Rec | R];
				_ ->
					R
			end
		end,
	[{deletePet(Rec), Rec} || Rec <- lists:foldl(FunDelete, [], ListPet)].

%%% --------------------------------------------------------------------
%% 删除玩家对应攻防记录
-spec deleteHistory(TimeLine::uint32()) -> ok.
deleteHistory(TimeLine) ->
	%% 删除掠夺记录
	FunFindA2 =
		fun(#rec_player_territory_history_a{timeEvent = TimeEvent} = Rec, R) ->
			case TimeEvent < TimeLine of
				true ->
					R;
				_ ->
					[Rec | R]
			end
		end,
	FunFindA1 =
		fun(#recTerritoryData{value = ListHistory}, AccR) ->
			lists:foldl(FunFindA2, [], ListHistory) ++ AccR
		end,
	FunDelete =
		fun
			(#recTerritoryData{roleID = RoleID, value = []}, Ets) ->
				ets:delete(Ets, RoleID),
				Ets;
			(Rec, Ets) ->
				ets:insert(Ets, Rec),
				Ets
		end,
	ListA = ets:foldl(FunFindA1, [], ?EtsTerritoryHistoryAData),
	lists:foldl(FunDelete, ?EtsTerritoryHistoryAData, ListA),
	%% 删除防守记录
	FunFindD2 =
		fun(#rec_player_territory_history_d{timeEvent = TimeEvent} = Rec, R) ->
			case TimeEvent < TimeLine of
				true ->
					R;
				_ ->
					[Rec | R]
			end
		end,
	FunFindD1 =
		fun(#recTerritoryData{value = ListHistory}, AccR) ->
			lists:foldl(FunFindD2, [], ListHistory) ++ AccR
		end,
	ListD = ets:foldl(FunFindD1, [], ?EtsTerritoryHistoryDData),
	lists:foldl(FunDelete, ?EtsTerritoryHistoryDData, ListD),
	ok.

%%% ====================================================================
%%% 领地数据管理（内存相关）
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 初始化私有ETS
-spec initETS() -> ok.
initETS() ->
	case get(isInit) of
		true ->
			skip;
		_ ->
			ets:new(?EtsSearchOwner, [protected, named_table, set, {keypos, #recSearchOwner.key}, {write_concurrency, false}, {read_concurrency, true}]),
			ets:new(?EtsSearchHistory, [protected, named_table, set, {keypos, #recSearchHistory.roleID}, {write_concurrency, false}, {read_concurrency, true}]),
			ets:new(?EtsBattleMap, [protected, named_table, set, {keypos, #recBattleMap.roleID}, {write_concurrency, false}, {read_concurrency, true}]),
			put(isInit, true)
	end,
	ok.

%%% 分隔符 --------------------------------------------------------------------
%%% 分隔符 --------------------------------------------------------------------

%%% --------------------------------------------------------------------
%% 查询搜索归属权
-spec querySearchOwner({TargetRoleID::uint64(), TerritoryID::uint32()}) -> OwnerID :: uint64() | 0.
querySearchOwner(Key) ->
	case ets:lookup(?EtsSearchOwner, Key) of
		[#recSearchOwner{ownerID = OwnerID}] ->
			OwnerID;
		_ ->
			0
	end.

%%% --------------------------------------------------------------------
%% 查询搜索历史记录
-spec querySearchHistory(RoleID::uint64()) -> [{{TargetRoleID::uint64(), TerritoryID::uint32()}, Time::uint32()}, ...].
querySearchHistory(RoleID) ->
	case ets:lookup(?EtsSearchHistory, RoleID) of
		[#recSearchHistory{history = History}] ->
			History;
		_ ->
			[]
	end.

-spec querySearchHistory(RoleID::uint64(), {TargetRoleID::uint64(), TerritoryID::uint32()}) -> boolean().
querySearchHistory(RoleID, Key) ->
	case lists:keyfind(Key, 1, querySearchHistory(RoleID)) of
		{_, Time} ->
			TimeNow = time:getSyncTimeFromDBS(),
			#globalsetupCfg{setpara = [TimeSame]} = getCfg:getCfgPStack(cfg_globalsetup, petTerritory_sameCD),
			case Time + TimeSame >= TimeNow of
				true ->
					false;	%% CD中
				_ ->
					case lists:keydelete(Key, 1, querySearchHistory(RoleID)) of
						[] ->
							ets:delete(?EtsSearchHistory, RoleID);
						ListHistory ->
							ets:insert(?EtsSearchHistory, #recSearchHistory{roleID = RoleID, history = ListHistory})
					end,
					true	%% CD失效
			end;
		_ ->
			true	%% 未命中
	end.

%%% --------------------------------------------------------------------
%% 地图数据辅助（地图进程ID转为角色ID）
-spec battleMap_MapPid2RoleID(MapPid::pid()) -> RoleID::uint64().
battleMap_MapPid2RoleID(MapPid) ->
	MatchSpec = ets:fun2ms(
		fun(#recBattleMap{mapPid = MapPid_, roleID = RoleID})
			when MapPid =:= MapPid_ ->
			RoleID
		end
	),
	case ets:select(?EtsBattleMap, MatchSpec) of
		[] ->
			0;
		[H|_] ->
			H
	end.

%%% --------------------------------------------------------------------
%% 查询地图数据
-spec queryBattleMap(Key :: uint64() | pid()) -> #recBattleMap{} | undefined.
queryBattleMap(MapPid) when erlang:is_pid(MapPid) ->
	case battleMap_MapPid2RoleID(MapPid) of
		0 ->
			undefined;
		RoleID ->
			queryBattleMap(RoleID)
	end;
queryBattleMap(RoleID) ->
	case ets:lookup(?EtsBattleMap, RoleID) of
		[#recBattleMap{} = Rec] ->
			Rec;
		_ ->
			undefined
	end.

%%% 分隔符 --------------------------------------------------------------------
%%% 分隔符 --------------------------------------------------------------------

%%% --------------------------------------------------------------------
%% 覆写玩家搜索归属与搜索记录
-spec replaceSearch(RoleID::uint64(), {TargetRoleID::uint64(), TerritoryID::uint32()}) -> ok.
replaceSearch(RoleID, Key) ->
	ets:insert(?EtsSearchOwner, #recSearchOwner{key = Key, ownerID = RoleID}),
	ListHistory = lists:keystore(Key, 1, querySearchHistory(RoleID), {Key, time:getSyncTimeFromDBS()}),
	ets:insert(?EtsSearchHistory, #recSearchHistory{roleID = RoleID, history = ListHistory}),
	ok.

%%% --------------------------------------------------------------------
%% 覆写地图数据
-spec replaceBattleMap(Map::#recBattleMap{}) -> ok.
replaceBattleMap(Map) ->
	ets:insert(?EtsBattleMap, Map),
	ok.

%%% 分隔符 --------------------------------------------------------------------
%%% 分隔符 --------------------------------------------------------------------

%%% --------------------------------------------------------------------
%% 因领地失效删除搜索归属与搜索记录
-spec deleteSearch({TargetRoleID::uint64(), TerritoryID::uint32()}) -> ok.
deleteSearch(Key) ->
	ets:delete(?EtsSearchOwner, Key),
	FunFind =
		fun(#recSearchHistory{roleID = RoleID, history = ListHistory} = Rec, {ListD, ListU}) ->
			case lists:keydelete(Key, 1, ListHistory) of
				[] ->
					{[RoleID | ListD], ListU};
				ListHistory ->
					{ListD, ListU};
				ListHistoryNew ->
					{ListD, [Rec#recSearchHistory{history = ListHistoryNew} | ListU]}
			end
		end,
	{ListD, ListU} = ets:foldl(FunFind, {[], []}, ?EtsSearchHistory),
	[ets:delete(?EtsSearchHistory, RoleID) || RoleID <- ListD],
	[ets:insert(?EtsSearchHistory, Rec) || Rec <- ListU],
	ok.

%%% --------------------------------------------------------------------
%% 因掠夺结束（无论成功失败）删除搜索归属
-spec deleteSearchByPlunder({TargetRoleID::uint64(), TerritoryID::uint32()}) -> ok.
deleteSearchByPlunder(Key) ->
	ets:delete(?EtsSearchOwner, Key).

%%% --------------------------------------------------------------------
%% 删除地图数据
-spec deleteBattleMap(Key :: uint64() | #recBattleMap{} | pid()) -> ok.
deleteBattleMap(#recBattleMap{roleID = RoleID}) ->
	deleteBattleMap(RoleID);
deleteBattleMap(MapPid) when erlang:is_pid(MapPid) ->
	ets:delete(?EtsBattleMap, battleMap_MapPid2RoleID(MapPid));
deleteBattleMap(RoleID) ->
	ets:delete(?EtsBattleMap, RoleID).

%%% ====================================================================
%%% 其它
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 辅助：每N次主心跳检测一次，是否需要检测领地状态并通知在线领主
-spec countForCheck() -> boolean().
countForCheck() ->
	Count =
		case get(notice) of
			undefined ->
				1;
			V ->
				V + 1
		end,
	case Count >= ?NoticeCount of
		true ->
			put(notice, 0),
			true;
		_ ->
			put(notice, Count),
			false
	end.
