%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 14. 四月 2015 17:28
%%%-------------------------------------------------------------------

-module(dbRoleDataCache).
-author("ZhongYuanWei").

-include("dbsInc.hrl").
-include("emysql.hrl").
-include("gsDef.hrl").

%% API
-export([
	getRoleAllDataFromDB/1,
    getRoleDataFromDB/2,
	getBaseRole/1,
    loadVariant0/0
]).

loadVariant0() ->
	?LOG_OUT("loadVariant0..."),
	SQL = "select * from variant0 where roleID < 1000000",
	VariantList = dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_variant0)),
	variant:initVariantFromDB(VariantList),
	variant:variantFirstInit(),
	?LOG_OUT("global variant list len:~p",[erlang:length(VariantList)]),
	ok.

getRoleDataFromDB(RoleID, _PidFromPlayerDataOtp) ->
    case getBaseRole(RoleID) of
        #rec_base_role{} = Base ->
            getRoleAllDataFromDB(RoleID),

            %% 加载其它数据rec_playerdata
            #rec_playerdata{} = PlayerData = dbGSDataLoad:loadRoleData(RoleID),

            %% 返回给GS,发给gs:playerDataMgrOtp进程
			psMgr:sendMsg2PS(?PlayerDataMgr, loadRoleDataFromDBAck, {Base, PlayerData}),
            ok;
        _ ->
            ?ERROR_OUT("is delete player:~p", [RoleID])
    end,
    ok.

getRoleAllDataFromDB(RoleID) ->
	Now = os:timestamp(),
    getPlayerCoin(RoleID),
	getAchieve(RoleID),
	getPackageInfo(RoleID),
	getItemByRoleID(RoleID),
	getPlayerSkill(RoleID),
	getBadge(RoleID),
	getWaken(RoleID),
	getDailyCounter(RoleID),
	getPersonInfo(RoleID),
	getFashion(RoleID),
	getVariant(RoleID),
	getBuff(RoleID),
	getPetInfo(RoleID),
	getPetDunInfo(RoleID),
	getPetDunScore(RoleID),
	getPetManorBattle(RoleID),
	getRefineInfo(RoleID),
	getTitle(RoleID),
	getMSShop(RoleID),
	getCommonActiveCode(RoleID),
	getTalent(RoleID),
	getExtRole(RoleID),
	getWarriorTrial(RoleID),
	getGodWeapon(RoleID),
	getSourceShopLimit(RoleID),
	getOperateExchangeData(RoleID),
	getPlayerClock(RoleID),
	getPlayerLiveness(RoleID),
	getPlayerHolidayTask(RoleID),
	getPlayerDrop(RoleID),
	Ret = timer:now_diff(os:timestamp(), Now),
	?DEBUG_OUT("getRoleAllDataFromDB:~p,~p",[RoleID,Ret]),
	Ret.

getPlayerCoin(RoleID) ->
    %% 读他拥有的钱钱
    SQL_Coin = io_lib:format("select * from player_coin where roleID=~p",[RoleID]),
    dbMemCacheCommon:getDataFromDB(SQL_Coin,?MakeArg(rec_player_coin)),
    ok.

-spec getBaseRole(RoleID::uint()) -> #rec_base_role{} | [].
getBaseRole(RoleID) ->
	%% 读他娃的基本数据
	SQL = io_lib:format("select * from base_role where roleID=~p",[RoleID]),
    Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
    {Result, _LeftResult} = mysql:nextResult(Ret),
    case emysql_util:as_record(Result, rec_base_role, record_info(fields, rec_base_role)) of
        [#rec_base_role{} = Role] -> Role;
        _ -> []
    end.

getExtRole(RoleID) ->
	SQL = io_lib:format("select * from ext_role where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_ext_role)),
	ok.

getAchieve(RoleID) ->
	SQL = io_lib:format("select * from achieve where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_achieve)),
	ok.

getPackageInfo(RoleID) ->
	SQL = io_lib:format("select * from package_info where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_package_info)),
	ok.

getItemByRoleID(RoleID) ->
	%Now = time:getUTCNowSec(),
	%NowStr = time:convertTimeStamp2DateTimeStr(Now),

	%%1.首先转移备份回收站道具(没有必要备份，弄到回收站也走删除流程)
%%	SQLICycle = io_lib:format("insert into item_bak select * from item WHERE roleID = ~p AND pos = 5;"
%%		"delete FROM item WHERE roleID = ~p AND pos = 5",[RoleID, RoleID]),
%%	emysql:execute(?GAMEDB_CONNECT_POOL,SQLICycle),

	%%2.加载所有道具，过期道具在逻辑层删除
	SQLItem = io_lib:format("SELECT * FROM item WHERE roleID = ~p",[RoleID]),
	dbMemCacheCommon:getItemBySql(SQLItem),

%%	%%首先获取角色没有删除标记的且在有效期的不在回收站的道具
%%	SQLItem = io_lib:format("SELECT * FROM item WHERE roleID = ~p AND pos <> 5 AND deleteTime = '1970-01-01 00:00:00' AND (expiredTime > ~p OR expiredTime < 1)",[RoleID,Now]),
%%	dbMemCacheCommon:getItemBySql(SQLItem),
%%
%%	%%再获取角色在回收站中的道具，由于回收站只有10个最近删除的道具，所以只取10个
%%	SQLItem1 = io_lib:format("SELECT * FROM item WHERE roleID = ~p AND pos = 5 AND deleteTime >= DATE_SUB('~ts', INTERVAL 24 HOUR) AND (expiredTime > ~p OR expiredTime < 1) ORDER BY deleteTime DESC LIMIT 10",[RoleID,NowStr,Now]),
%%	dbMemCacheCommon:getItemBySql(SQLItem1),

	SQLItemCD = io_lib:format("select * from item_used_cd where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQLItemCD,?MakeArg(rec_item_used_cd)),
	ok.

getPlayerSkill(RoleID) ->
	SQLSkill = io_lib:format("select * from skill where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQLSkill,?MakeArg(rec_skill)),
	SQLSkillSlot = io_lib:format("select * from skill_slot where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQLSkillSlot,?MakeArg(rec_skill_slot)),
	ok.

getBadge(RoleID) ->
	SQL = io_lib:format("select * from badge where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_badge)),
	ok.

getWaken(RoleID) ->
	SQL = io_lib:format("select * from awaken_info where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_awaken_info)),
	ok.

%% getCopyMapData(RoleID) ->
%% 	SQL1 = io_lib:format("select * from copy_map_data where roleID=~p",[RoleID]),
%% 	dbMemCacheCommon:getDataFromDB(SQL1,?MakeArg(rec_copy_map_data)),
%% 	SQL2 = io_lib:format("select * from copymapscore where roleID=~p",[RoleID]),
%% 	dbMemCacheCommon:getDataFromDB(SQL2,?MakeArg(rec_copymapscore)),
%% 	ok.

getDailyCounter(RoleID) ->
	N = RoleID rem 10,
	SQL = io_lib:format("select * from daily_counter~p where roleID=~p",[N,RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_daily_counter0)),
	ok.

getVariant(RoleID) ->
	N = RoleID rem 10,
	SQL = io_lib:format("select * from variant~p where roleID=~p",[N,RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_variant0)),
	ok.

getFashion(RoleID) ->
	SQL1 = io_lib:format("select * from role_fashions where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL1,?MakeArg(rec_role_fashions)),
	SQL2 = io_lib:format("select * from fashion_slot where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL2,?MakeArg(rec_fashion_slot)),
	ok.

getPersonInfo(RoleID) ->
	SQL = io_lib:format("select * from personality_info where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_personality_info)),
	ok.

getBuff(RoleID) ->
	SQL = io_lib:format("select * from buff where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_buff)),
	ok.

getPetInfo(RoleID) ->
	SQLPet = io_lib:format("select * from pet_info where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQLPet,?MakeArg(rec_pet_info)),

	SQLPetEquip = io_lib:format("select * from pet_equip where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQLPetEquip,?MakeArg(rec_pet_equip)),

	SQLPetSkill = io_lib:format("select * from pet_skill where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQLPetSkill,?MakeArg(rec_pet_skill)),
	ok.

getPetDunInfo(RoleID) ->
	SQLPetDunInfo = io_lib:format("select * from pet_dungeon_info where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQLPetDunInfo,?MakeArg(rec_pet_dungeon_info)),
	ok.

getPetDunScore(RoleID) ->
	SQLPetDunScore = io_lib:format("select * from pet_dungeon_score where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQLPetDunScore,?MakeArg(rec_pet_dungeon_score)),
	ok.

getPetManorBattle(RoleID) ->
	SQLPetManorBattle = io_lib:format("select * from pet_manor_battle where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQLPetManorBattle,?MakeArg(rec_pet_manor_battle)),
	ok.
	
getRefineInfo(RoleID) ->
	SQL = io_lib:format("select * from equip_refine_info where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_equip_refine_info)),
	ok.

getTitle(RoleID) ->
	SQL = io_lib:format("select * from title where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_title)),
	ok.

getMSShop(RoleID) ->
	SQL = io_lib:format("select * from player_ms_shop where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_player_ms_shop)),
	ok.

getCommonActiveCode(RoleID) ->
	SQL = io_lib:format("select * from common_active_code where role_id=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_common_active_code)),
	ok.

getTalent(RoleID) ->
	SQL = io_lib:format("select * from talent where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_talent)),
	ok.

getWarriorTrial(RoleID) ->
	SQL = io_lib:format("select * from warrior_trial where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_warrior_trial)),
	ok.

getGodWeapon(RoleID) ->
	SQL = io_lib:format("select * from god_weapon where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_god_weapon)),
	ok.

getSourceShopLimit(RoleID) ->
	SQL = io_lib:format("select * from sourceshop_forever_limit where roleID=~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_sourceshop_forever_limit)),
	ok.

getOperateExchangeData(RoleID) ->
	NowTime = time:getSyncUTCTime1970FromDBS() - ?SECS_FROM_0_TO_1970,
	SQL = io_lib:format("select * from operate_exchange_data oed left join operate_exchange oe on oe.id = oed.exchangeID where oed.roleID=~p and ~p < oe.endTime",[RoleID,NowTime]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_operate_exchange_data)),
	ok.
%getPlayerTeam(RoleID) ->
%	SQL = io_lib:format("select * from player_team where roleID = ~p",[RoleID]),
%	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_player_team)),
%	ok.
getPlayerClock(RoleID) ->
	SQL = io_lib:format("SELECT * FROM player_clock pc WHERE pc.roleID = ~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_player_clock)),
	ok.

getPlayerLiveness(RoleID)->
	SQL = io_lib:format("SELECT * FROM player_liveness pl WHERE pl.playerID = ~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_player_liveness)),
	ok.

getPlayerHolidayTask(RoleID)->
	SQL = io_lib:format("SELECT playerID,acceptedTaskId,acceptedTime,completedTask FROM holiday_task ht WHERE ht.playerID = ~p",[RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL,?MakeArg(rec_holiday_task)),
	ok.

getPlayerDrop(RoleID) ->
	SQL = io_lib:format("SELECT * FROM player_drop where roleID = ~p", [RoleID]),
	dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_player_drop)),
	ok.