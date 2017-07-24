%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 四月 2015 10:38
%%%-------------------------------------------------------------------
-module(dbMemCacheCommon).
-author("tiancheng").

-include("dbsInc.hrl").
-include_lib("stdlib/include/qlc.hrl").

%% API
-export([
	getDataFromDB/2,
	getGuardMirror/0,
	getGuardMirrorRank/0,
	setPayDoubleConf/1,
	
	getItemByItemUID/1,
	getItemBySql/1,

	modifyRecord/1
]).

-spec getItemByItemUID(ItemUID::uint64()) -> ok.
getItemByItemUID(ItemUID) ->
	SQLItem = io_lib:format("select * from item where itemUID=~p",[ItemUID]),
	getItemBySql(SQLItem).

-spec getItemBySql(SQLItem::string()) -> ok.
getItemBySql(SQLItem) ->
	getDataFromDB(SQLItem,?MakeArg(rec_item)),
%%	ItemList = getDataFromDB(SQLItem,?MakeArg(rec_item)),
%%	Fun = fun(#rec_item{itemUID = ItemUID,deleteTime = {datetime,_DT}}) ->
%%		SQLEquipBase = io_lib:format("select * from equip_base_info where equipUID = ~p",[ItemUID]),
%%		case getDataFromDB(SQLEquipBase,?MakeArg(rec_equip_base_info)) of
%%			[] ->
%%				%%没有取得装备的基础信息，应该不是装备
%%				skip;
%%			_ ->
%%				%%获取装备的强化属性
%%				SQLEquipEnhance = io_lib:format("select * from equip_enhance_info where equipUID = ~p",[ItemUID]),
%%				getDataFromDB(SQLEquipEnhance,?MakeArg(rec_equip_enhance_info)),
%%				%%获取装备的扩展属性
%%				SQLEquipExt = io_lib:format("select * from equip_ext_info where equipUID = ~p",[ItemUID]),
%%				getDataFromDB(SQLEquipExt,?MakeArg(rec_equip_ext_info))
%%		end
%%	end,
%%	lists:foreach(Fun,ItemList),
	ok.

%%启服初始化王者挑战的数据
getGuardMirror() ->
	SQL = "select * from guard_mirror",
	getDataFromDB(SQL,?MakeArg(rec_guard_mirror)),
	ok.

%%启服初始化王者挑战的排行榜数据
getGuardMirrorRank() ->
	SQL = "SELECT gmr.roleID,gmr.days  from guard_mirror_rank AS gmr LEFT JOIN base_role br ON gmr.roleID = br.roleID WHERE br.deleteTime ='1970/1/1 0:00:00'",
	getDataFromDB(SQL,?MakeArg(rec_guard_mirror_rank)),
	ok.
  

%%导入双倍充值配置
-spec setPayDoubleConf(Row::#rec_recharge_double_conf{}) -> ok .
setPayDoubleConf(Row) ->
	F = fun() ->
				mnesia:write(Row)
		end,
	case mnesia:transaction(F) of
		{atomic, _} ->
			ok;
		Why ->
			?ERROR_OUT("Error[~p] Save setPayDoubleConf:~p",[Why,Row])
	end,
	ok.

getDataFromDB(SQL, {TableRecord,RecInfo}) ->
    Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
    RecordList = emysql_util:as_record(Ret, TableRecord, RecInfo),
    Fun =
        fun(Record, AccL) ->
            NewRec = modifyRecord(Record),
            edb:writeRecord(NewRec),
			[NewRec | AccL]
        end,
    lists:foldl(Fun, [], RecordList).

modifyRecord(#rec_item{isBind = IsBind,isLocked = IsLocked} = Rec) ->
	NewRec = Rec#rec_item{isBind = misc:convertBoolFromInt(IsBind),isLocked = misc:convertBoolFromInt(IsLocked)},
	itemUtils:makeItemRecFromDB(NewRec);
modifyRecord(#rec_package_info{roleID = RoleID,bagType = SK} = Rec) ->
	Rec#rec_package_info{roleID = {RoleID,SK}};
modifyRecord(#rec_skill{roleID = RoleID,skillID = SK} = Rec) ->
	Rec#rec_skill{roleID = {RoleID,SK}};
modifyRecord(#rec_skill_slot{roleID = RoleID,slot = SK} = Rec) ->
	Rec#rec_skill_slot{roleID = {RoleID,SK}};
modifyRecord(#rec_sourceshop_forever_limit{roleID = RoleID,type = Type} = Rec) ->
	Rec#rec_sourceshop_forever_limit{roleID = {RoleID,Type}};
%%modifyRecord(#rec_task_submitted{roleID = RoleID,taskSlot = SK} = Rec) ->
%%	Rec#rec_task_submitted{roleID = {RoleID,SK}};
%%modifyRecord(#rec_task_accepted{roleID = RoleID,taskID = SK} = Rec) ->
%%	Rec#rec_task_accepted{roleID = {RoleID,SK}};
modifyRecord(#rec_title{roleID = RoleID,titleID = SK} = Rec) ->
	Rec#rec_title{roleID = {RoleID,SK}};
modifyRecord(#rec_awaken_info{roleID = RoleID,cardID = SK} = Rec) ->
	Rec#rec_awaken_info{roleID = {RoleID,SK}};
modifyRecord(#rec_achieve{roleID = RoleID,achieveID = SK} = Rec) ->
	Rec#rec_achieve{roleID = {RoleID,SK}};
modifyRecord(#rec_badge{roleID = RoleID, mapID = SK,items = Items} = Rec) ->
	Rec#rec_badge{roleID = {RoleID,SK}, items = misc:string_to_term(erlang:binary_to_list(Items))};
modifyRecord(#rec_pet_info{roleID = RoleID, petID = SK,name = BinName, attas = Atta} = Rec) ->
	Rec#rec_pet_info{roleID = {RoleID,SK},name = erlang:binary_to_list(BinName), attas = misc:string_to_term(erlang:binary_to_list(Atta))};
modifyRecord(#rec_pet_equip{roleID = RoleID, equipPos = SK} = Rec) ->
	Rec#rec_pet_equip{roleID = {RoleID,SK}};
modifyRecord(#rec_pet_skill{roleID = RoleID, petID = SK, index = TK} = Rec) ->
	Rec#rec_pet_skill{roleID = {RoleID,SK,TK}};
modifyRecord(#rec_equip_refine_info{roleID = RoleID, type = SK} = Rec) ->
	Rec#rec_equip_refine_info{roleID = {RoleID,SK}};
modifyRecord(#rec_player_prop{roleID = RoleID, propIndex = SK} = Rec) ->
	Rec#rec_player_prop{roleID = {RoleID,SK}};
modifyRecord(#rec_player_clock{roleID = RoleID, clockType = SK} = Rec) ->
	Rec#rec_player_clock{roleID = {RoleID,SK}};
modifyRecord(#rec_variant0{roleID = RoleID, index = SK} = Rec) ->
	Rec#rec_variant0{roleID = {RoleID,SK}};
modifyRecord(#rec_daily_counter0{roleID = RoleID, dailyType = SK} = Rec) ->
	Rec#rec_daily_counter0{roleID = {RoleID,SK}};
modifyRecord(#rec_item_used_cd{roleID = RoleID, itemGroupID = SK} = Rec) ->
	Rec#rec_item_used_cd{roleID = {RoleID,SK}};
modifyRecord(#rec_buff{roleID = RoleID, buffID = SK} = Rec) ->
	Rec#rec_buff{roleID = {RoleID,SK}};
modifyRecord(#rec_fashion_slot{roleID = RoleID, slot = SK} = Rec) ->
	Rec#rec_fashion_slot{roleID = {RoleID,SK}};
modifyRecord(#rec_role_fashions{roleID = RoleID, fashionID = SK} = Rec) ->
	Rec#rec_role_fashions{roleID = {RoleID,SK}};
modifyRecord(#rec_player_ms_shop{roleID = RoleID, only_id = SK} = Rec) ->
	Rec#rec_player_ms_shop{roleID = {RoleID,SK}};
modifyRecord(#rec_ext_role{updateReward = UpdateReward} = Rec) ->
	Rec#rec_ext_role{updateReward = misc:string_to_term(erlang:binary_to_list(UpdateReward))};
modifyRecord(#rec_operate_data{roleID = RoleID, id = SK, arg1 = Arg} = Rec) ->
	Rec#rec_operate_data{roleID = {RoleID, SK}, arg1 = misc:string_to_term(erlang:binary_to_list(Arg))};
modifyRecord(#rec_operate_activity{arg1 = Arg} = Rec) ->
	Rec#rec_operate_activity{arg1 = misc:string_to_term(erlang:binary_to_list(Arg))};
modifyRecord(#rec_operate_exchange{require = Require,name = Name,title = Title,content = Content} = Rec) ->
	Rec#rec_operate_exchange{
		require = misc:string_to_term(erlang:binary_to_list(Require)),
		name = erlang:binary_to_list(Name),
		title = erlang:binary_to_list(Title),
		content = erlang:binary_to_list(Content)
	};
modifyRecord(#rec_operate_exchange_data{roleID = RoleID,exchangeID = EID} = Rec) ->
	Rec#rec_operate_exchange_data{roleID= {RoleID,EID} };
modifyRecord(#rec_god_weapon{roleID = RoleID, weaponID = SK} = Rec) ->
	Rec#rec_god_weapon{roleID = {RoleID,SK}};
modifyRecord(#rec_pet_dungeon_score{roleID = RoleID, dungeon_ID = DungeonID} = Rec) ->
	Rec#rec_pet_dungeon_score{roleID = {RoleID, DungeonID}};
modifyRecord(#rec_pet_dungeon_info{pet_pos = Pos} = Rec) ->
	Rec#rec_pet_dungeon_info{pet_pos = misc:string_to_term(erlang:binary_to_list(Pos))};
modifyRecord(#rec_sundries{id = ID,key = Key,value = V} = Rec) ->
	K = misc:string_to_term(erlang:binary_to_list(Key)),
	Rec#rec_sundries{id = {ID,K}, key = K, value = misc:string_to_term(erlang:binary_to_list(V)) };
modifyRecord(#rec_player_coin{roleID = ID, coinType = Type} = Rec) ->
	Rec#rec_player_coin{roleID = {ID,Type}};
modifyRecord(#rec_manor_battle{manorPos = Pos} = Rec) ->
	Rec#rec_manor_battle{manorPos = misc:string_to_term(erlang:binary_to_list(Pos))};
modifyRecord(#rec_pet_manor_battle{pet_pos = Pos} = Rec) ->
	Rec#rec_pet_manor_battle{pet_pos = misc:string_to_term(erlang:binary_to_list(Pos))};
modifyRecord(#rec_team{members = M, customProp = C} = Rec) ->
	Rec#rec_team{members = erlang:binary_to_list(M), customProp = erlang:binary_to_list(C)};
modifyRecord(#rec_pet_battle_report{br_list = L} = Rec) ->
	Rec#rec_pet_battle_report{br_list = misc:string_to_term(erlang:binary_to_list(L))};
modifyRecord(#rec_guild_war{stage = S, group = G} = Rec) ->
	Rec#rec_guild_war{stage = {S, G}};
modifyRecord(#rec_guild_member_skill{guildID = G, roleID = R, skillID = S} = Rec) ->
	Rec#rec_guild_member_skill{guildID = {G, R, S}};
modifyRecord(#rec_guild_skill{guildID = G, skillID = S} = Rec) ->
	Rec#rec_guild_skill{guildID = {G, S}};
modifyRecord(#rec_guild_task{roleID = RID, taskType = TaskType} = Rec) ->
	Rec#rec_guild_task{roleID = {RID, TaskType}};
modifyRecord(#rec_player_liveness{ livenessList = LiveList,livenessGiftDrew = GiftList} = Rec)->
	Rec#rec_player_liveness{livenessList = misc:string_to_term(erlang:binary_to_list(LiveList)),
			livenessGiftDrew = misc:string_to_term(erlang:binary_to_list(GiftList))};
modifyRecord(#rec_holiday_task{ completedTask = CompletedTask} = Rec)->
	Rec#rec_holiday_task{ completedTask = misc:string_to_term(erlang:binary_to_list(CompletedTask))};
modifyRecord(#rec_player_find_res{roleID = RID, activityID = AID} = Rec)->
	Rec#rec_player_find_res{roleID = {RID, AID}};
modifyRecord(#rec_player_drop{roleID = RID, id = ID} = Rec) ->
	Rec#rec_player_drop{roleID = {RID, ID}};
modifyRecord(Record) ->
	Record.

