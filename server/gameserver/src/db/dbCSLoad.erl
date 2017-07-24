%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三科技
%%% @doc
%%%
%%% @end
%%% Created : 03. 七月 2014 17:49
%%%-------------------------------------------------------------------
-module(dbCSLoad).
-author("ZhongYuanWei").

-include("dbPrivate.hrl").

%% API
-export([initCSLoadPrepare/0]).
-export([
    loadGuildData/1,
	getTradeData/3,
	getMailList/2,
	getAwardTakens/1,
	getMallData/1,
	getMallLimitData/1,
	getPlayerRankData/2,
	getNewAndLast7DaysOrder/0,
	getRechargeRebateAndTaken/0,
	getActivityData/0,
	getPreChargeAccount/0,
	loadHomeData/0
]).

initCSLoadPrepare() ->
	emysql:prepare(stGetTradeDataCount, "call getTradeDataCount(?)"),
	emysql:prepare(stGetTradeData, "call getTradeData(?,?,?)"),
    emysql:prepare(stGetTradeRuneData, "call getTradeRuneData(?,?,?)"),
	emysql:prepare(stGetMailListCount,"call getMailListCount(?)"),
	emysql:prepare(stGetMailList,"call getMailList(?,?,?)"),
	%% emysql:prepare(stGetGuildData, "call getGuildData()"),		已废弃，使用时注意更新
	emysql:prepare(stGetGuildMember, "call getGuildMember(?)"),
	emysql:prepare(stGetGuildBattle, "call getGuildBattle()"),
	emysql:prepare(stLoadRoleAwardTakensRoleID, "call loadRoleAwardTakensRoleID()"),
	emysql:prepare(stLoadRoleAwardTakensAwardID, "call loadRoleAwardTakensAwardID(?)"),
	emysql:prepare(stGetMallData,"call getMallData()"),
	emysql:prepare(stGetMallLimitData,"call getMallLimitData()"),
	emysql:prepare(stGetRankData,"call getRankData(?)"),
	emysql:prepare(stGetActivityData,"call getActivityData()"),
	emysql:prepare(stGetPreChargeAccount,"call getPreChargeAccount()"),
	emysql:prepare(stGetNewAndLast7DaysOrder,"call getRechargeNewAndLast7DaysOrder()"),
	emysql:prepare(stGetRechargeRebateAndTaken,"call getRechargeRebateAndTaken()"),

	ok.

%% 查询家园数据
-spec loadHomeData() -> {[#rec_home{},...], [#rec_home_area{},...]}.
loadHomeData() ->
	SQL1 = "SELECT h.* FROM home h LEFT JOIN base_role br ON h.roleID = br.roleID WHERE br.deleteTime = '1970/1/1 0:00:00'",
	Ret1 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL1),
	dbMemCache:logResult("loadHomeData", Ret1, SQL1),
	Homes = emysql_util:as_record(Ret1, rec_home, record_info(fields, rec_home)),

	SQL2 = "SELECT ha.* FROM home_area ha LEFT JOIN home h ON ha.homeID = h.homeID LEFT JOIN base_role br ON h.roleID = br.roleID WHERE br.deleteTime = '1970/1/1 0:00:00'",
	Ret2 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL2),
	dbMemCache:logResult("loadHomeData area", Ret2, SQL2),
	HomeAreas = emysql_util:as_record(Ret2, rec_home_area, record_info(fields, rec_home_area)),
	{Homes, HomeAreas}.

%% 加载军团数据
-spec loadGuildData(PidFromCS::pid()) -> ok.
loadGuildData(PidFromCS) ->
    SQL1 = "SELECT * FROM guild",
    Ret1 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL1),
    dbMemCache:logResult("loadGuildData", Ret1, SQL1),
    GuildList = emysql_util:as_record(Ret1, rec_guild, record_info(fields, rec_guild)),

    SQL2 = "SELECT * FROM guild_member",
    Ret2 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL2),
    dbMemCache:logResult("loadGuildData member", Ret2, SQL2),
    GuildMemberList = emysql_util:as_record(Ret2, rec_guild_member, record_info(fields, rec_guild_member)),

    SQL3 = "SELECT * FROM guild_battle_paid",
    Ret3 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL3),
    dbMemCache:logResult("loadGuildData battle", Ret3, SQL3),
    GuildBattleList = emysql_util:as_record(Ret3, rec_guild_battle_paid, record_info(fields, rec_guild_battle_paid)),

	SQL4 = "select * from guild_ride",
	Ret4 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL4),
	dbMemCache:logResult("loadGuildData ride", Ret4, SQL4),
	GuildRideList = emysql_util:as_record(Ret4, rec_guild_ride, record_info(fields, rec_guild_ride)),

    psMgr:sendMsg2PS(PidFromCS, loadGuildDataAck, {GuildList, GuildMemberList, GuildBattleList, GuildRideList}),
    ok.

%% 获取交易行数据
getTradeData(Pid, Type, OneCount) ->
    %% 查询交易行条数
    RetCount = emysql:execute(?GAMEDB_CONNECT_POOL, stGetTradeDataCount, [Type]),
    {SilverTrade, _LeftResult} = mysql:nextResult(RetCount),
    Count = mysql:getFieldValue(1, mysql:firstRow(SilverTrade)),
    %% 查询总次数
    Times = case Count =< OneCount of
                true ->
                    0;
                false ->
                    Count div OneCount
            end,
    %% 多查询一次
    TimeList = lists:seq(0, Times + 1),
    Fun =
        fun(X) ->
            %% 得到值
            Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stGetTradeData, [Type, X * OneCount, OneCount]),
            {Trade, _Left} = mysql:nextResult(Ret),
            TradeInfo = emysql_util:as_record(Trade, trade, record_info(fields, trade)),
            psMgr:sendMsg2PS(Pid, tradeInfo, {Type, TradeInfo}),
            dbMemCacheInit:initTradeItemData(TradeInfo),

            RetRune = emysql:execute(?GAMEDB_CONNECT_POOL, stGetTradeRuneData, [Type, X * OneCount, OneCount]),
            {TradeRune, _Left1} = mysql:nextResult(RetRune),
            TradeInfoRune = emysql_util:as_record(TradeRune, trade, record_info(fields, trade)),
            psMgr:sendMsg2PS(Pid, tradeInfo, {Type, TradeInfoRune}),
            ok
        end,
    lists:foreach(Fun, TimeList),
    ok.

%% 获取邮件列表
getMailList(PidFromCS, OneCount) ->
	%% 查询个数
	NowTime = time:getLocalNowSec1970(),
	NowTimeS = time:int64ToTimeString(NowTime),
	RetCount = emysql:execute(?GAMEDB_CONNECT_POOL, stGetMailListCount, [NowTimeS]),
	{RecCount, _LeftResult} = mysql:nextResult(RetCount),
	Count = mysql:getFieldValue(1, mysql:firstRow(RecCount)),
	%% 查询总次数
	Times = case Count =< OneCount of
		        true ->
			        0;
		        false ->
			        Count div OneCount
			end,
	?LOG_OUT("getMailList count:~p,times:~p,~ts", [Count, Times, NowTimeS]),
	%% 多查询一次
	TimeList = lists:seq(0, Times + 1),
	Fun =
		fun(X) ->
			%% 得到值
			?LOG_OUT("getmail:~p,~p,~p,~ts", [X, X * OneCount, OneCount, NowTimeS]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stGetMailList, [X * OneCount, OneCount, NowTimeS]),
			{AttachMent, LeftResult} = mysql:nextResult(Ret),
			AttachMentRec = emysql_util:as_record(AttachMent, recMailAttachMent, record_info(fields, recMailAttachMent)),
			{MailList, _} = mysql:nextResult(LeftResult),
			MailListRec = emysql_util:as_record(MailList, recSaveMail, record_info(fields, recSaveMail)),
			%% 返回结果
			psMgr:sendMsg2PS(PidFromCS, getMailListAck, {MailListRec, AttachMentRec}),
			dbMemCacheInit:initMailItemData(AttachMentRec)
		end,
	lists:foreach(Fun, TimeList),
	ok.

%% 加载本服所有以领取玩家的信息
getAwardTakens(Pid) ->
	?DEBUG_OUT("getAwardTakens"),
	Result = emysql:execute(?GAMEDB_CONNECT_POOL, stLoadRoleAwardTakensRoleID, []),
	{ResultList, _LeftResult} = mysql:nextResult(Result),
	RoleList = emysql_util:as_record(ResultList, awardTakenRow, record_info(fields, awardTakenRow)),

	AllTakenList = [getAwardIDByRoleID(Row#awardTakenRow.role_id) || Row <- RoleList],

	psMgr:sendMsg2PS(Pid, requestDBSAck, {AllTakenList}),
	psMgr:sendMsg2PS(Pid, canStart, {}),
	ok.

%% 加载商城数据
-spec getMallData(Pid::pid()) -> ok.
getMallData(Pid) ->
	Result = emysql:execute(?GAMEDB_CONNECT_POOL, stGetMallData),
	{Result1, _LeftResult} = mysql:nextResult(Result),
	List = emysql_util:as_record(Result1, recSaveMall, record_info(fields, recSaveMall)),
	psMgr:sendMsg2PS(Pid, loadMallDataAck, {List}),
	ok.
%% 加载限购数据
-spec getMallLimitData(Pid::pid()) -> ok.
getMallLimitData(Pid) ->
	Result = emysql:execute(?GAMEDB_CONNECT_POOL, stGetMallLimitData),
	{Result1, _LeftResult} = mysql:nextResult(Result),
	List = emysql_util:as_record(Result1, recSaveLimitMall, record_info(fields, recSaveLimitMall)),
	psMgr:sendMsg2PS(Pid, loadLimitMallDataAck, {List}),
	ok.

%% 根据roleid取出活动id
getAwardIDByRoleID(RoleID) ->
	?DEBUG_OUT("getAwardIDByRoleID:~p", [RoleID]),
	Result = emysql:execute(?GAMEDB_CONNECT_POOL, stLoadRoleAwardTakensAwardID, [RoleID]),
	{ResultList, _LeftResult} = mysql:nextResult(Result),
	AIDList = emysql_util:as_record(ResultList, awardTakenRow, record_info(fields, awardTakenRow)),
	#awardTakenEts{
		roleID = RoleID,
		takenList = [Row#awardTakenRow.award_id || Row <- AIDList]
	}.

getPlayerRankData(_Pid, []) ->
	ok;
getPlayerRankData(Pid, [RankType|TypeList]) ->
	?LOG_OUT("getPlayerRankData:~p", [RankType]),
	Result = emysql:execute(?GAMEDB_CONNECT_POOL, stGetRankData, [RankType]),
	{Result1, _LeftResult} = mysql:nextResult(Result),
	List = emysql_util:as_record(Result1, recSaveRank, record_info(fields, recSaveRank)),
	psMgr:sendMsg2PS(Pid, getPlayerRankDataAck, {RankType, List}),

	%% 取下一个排行榜
	getPlayerRankData(Pid, TypeList),
	ok.

%%取出预充值的数据
-spec getPreChargeAccount() ->[#recPreChargeAccount{}].
getPreChargeAccount() ->
	Result = emysql:execute(?GAMEDB_CONNECT_POOL, stGetPreChargeAccount),
	
	{Result1, _LeftResult} = mysql:nextResult(Result),
	emysql_util:as_record(Result1, recPreChargeAccount, record_info(fields, recPreChargeAccount)).

%%初始化玩家充值返利配置与已领记录
-spec getRechargeRebateAndTaken() ->{[#recSaveRechargeRebate{}],[#recSaveRechargeRebateTaken{}]}.
getRechargeRebateAndTaken() ->
	Result = emysql:execute(?GAMEDB_CONNECT_POOL, stGetRechargeRebateAndTaken),
	{Result1, LeftResult} = mysql:nextResult(Result),
	{Result2, _LeftResult1} = mysql:nextResult(LeftResult),
	R1 = emysql_util:as_record(Result1, recSaveRechargeRebate, record_info(fields, recSaveRechargeRebate)),
	R2 = emysql_util:as_record(Result2, recSaveRechargeRebateTaken, record_info(fields, recSaveRechargeRebateTaken)),
	{R1,R2}.

%%初始化玩家充值
-spec getNewAndLast7DaysOrder() ->[#recRecharge{}].
getNewAndLast7DaysOrder() ->
	Result = emysql:execute(?GAMEDB_CONNECT_POOL, stGetNewAndLast7DaysOrder),
	{Result1, _LeftResult} = mysql:nextResult(Result),
	emysql_util:as_record(Result1, recRecharge, record_info(fields, recRecharge)).

getActivityData() ->
	Result = emysql:execute(?GAMEDB_CONNECT_POOL, stGetActivityData),
	{Result1, _LeftResult} = mysql:nextResult(Result),
	emysql_util:as_record(Result1, rec_activity, record_info(fields, rec_activity)).