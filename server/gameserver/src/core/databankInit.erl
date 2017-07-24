%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 非玩家个人数据－数据银行
%%% @end
%%% Created : 22. 五月 2015 14:35
%%%-------------------------------------------------------------------
-module(databankInit).
-author("tiancheng").

-include("databankPrivate.hrl").
-include("gsDef.hrl").

%% API
-export([
	initBank/0,
	syncToDB/0
]).

%% 逻辑接口
-export([
	getRoleDataInfo/1,
	getRoleAppearance/2,
	ladder1V1Init/1
]).

-spec initBank() -> ok.
initBank() ->
%%%%%%%%%%%%%%%%%%%%%%%%请注意，所有init加载的数据，请自行处理同步加载%%%%%%%%%%%%%%%%%%%%%%%%
	Node = node(),
	TableList = [
		%% 玩家保存数据
		{
			rec_player_data,
			[{ram_copies, [Node]}, {attributes, record_info(fields, rec_player_data)}],
			fun playerDataInit/0,
			fun playerDataInsert/0,
			fun playerDataUpdate/0
		},

		%%运营活动数据
		{
			rec_operate_activity,
			[{ram_copies, [Node]}, {attributes, record_info(fields, rec_operate_activity)}],
			fun operateActivityInit/0,
			fun operateActivityInsert/0,
			fun operateActivityUpdate/0
		},

		%%运营活动玩家数据
		{
			rec_operate_data,
			[{ram_copies, [Node]}, {attributes, record_info(fields, rec_operate_data)}],
			fun operateDataInit/0,
			fun operateDataInsert/0,
			fun operateDataUpdate/0
		},

		%%运营兑换数据
		{
			rec_operate_exchange,
			[{ram_copies, [Node]}, {attributes, record_info(fields, rec_operate_exchange)}],
			fun operateExchangeInit/0,
			fun operateExchangeInsert/0,
			fun operateExchangeUpdate/0
		},
%%%%%%%%%%%%%%%%%%%%%%%%请注意，所有init加载的数据，请自行处理同步加载%%%%%%%%%%%%%%%%%%%%%%%%
		%%杂项数据
		{
			rec_sundries,
			[{ram_copies, [Node]}, {attributes, record_info(fields, rec_sundries)}],
			fun sundriesInit/0,
			fun sundriesInsert/0,
			fun sundriesUpdate/0
		},

		%% 占卜，抽奖
		{
			rec_lottery_result,
			[{ram_copies, [Node]}, {attributes, record_info(fields, rec_lottery_result)}, {type,bag}],
			fun lotteryResultInit/0,
			fun lotteryResultInsert/0,
			fun lotteryResultUpdate/0
		},

		%% 军团内存表
		{rec_guild_war, [{ram_copies, [Node]}, {attributes, record_info(fields, rec_guild_war)}], fun guildWarInit/0},
		{rec_guild_war_paid, [{ram_copies, [Node]}, {attributes, record_info(fields, rec_guild_war_paid)}], fun guildWarPaidInit/0},

		{
			rec_guild_member_skill, [{ram_copies, [Node]}, {attributes, record_info(fields, rec_guild_member_skill)}],
			fun guildMemberSkillInit/0,
			fun guildMemberSkillInsert/0,
			fun guildMemberSkillUpdate/0
		},
		{
			rec_guild_skill, [{ram_copies, [Node]}, {attributes, record_info(fields, rec_guild_skill)}],
			fun guildSkillInit/0,
			fun guildSkillInsert/0,
			fun guildSkillUpdate/0
		},
		%%%%%%%%%%%%%%%%%%%%%%%%请注意，所有init加载的数据，请自行处理同步加载%%%%%%%%%%%%%%%%%%%%%%%%
		{
			rec_guild_buff, [{ram_copies, [Node]}, {attributes, record_info(fields, rec_guild_buff)}, {type,bag}],
			fun guildBuffInit/0,
			fun guildBuffInsert/0,
			fun guildBuffUpdate/0
		},
		{
			rec_guild_task, [{ram_copies, [Node]}, {attributes, record_info(fields, rec_guild_task)}],
			fun guildTaskInit/0,
			fun guildTaskInsert/0,
			fun guildTaskUpdate/0
		},

		%% 争夺战城池数据
		{	rec_manor_battle,
			[{ram_copies, [Node]}, {attributes, record_info(fields, rec_manor_battle)}],
			fun manorBattleInit/0,
			fun manorBattleInsert/0,
			fun manorBattleUpdate/0
		},

		%% 玩家战报信息
		{  rec_pet_battle_report,
		   [{ram_copies, [Node]}, {attributes, record_info(fields, rec_pet_battle_report)}],
			fun petBattleReportInit/0,
			fun petBattleReportInsert/0,
			fun petBattleReportUpdate/0
		 },
%%%%%%%%%%%%%%%%%%%%%%%%请注意，所有init加载的数据，请自行处理同步加载%%%%%%%%%%%%%%%%%%%%%%%%
		%% 玩家离线数据
		{
		  rec_offline_data,
		  [{ram_copies, [Node]}, {attributes, record_info(fields, rec_offline_data)}],
		  fun offlineDataInit/0,
		  fun offlineDataInsert/0,
		  fun offlineDataUpdate/0
		 },
	
		%% 服务器掉落数量
		{
		  rec_server_drop,
		  [{ram_copies, [Node]}, {attributes, record_info(fields, rec_server_drop)}],
		  fun serverDropInit/0,
		  fun serverDropInsert/0,
		  fun serverDropUpdate/0
		 },

		%% 黑暗之地特殊玩法排行榜
		{	rec_darkness_ac_rank,
			[{ram_copies, [Node]}, {attributes, record_info(fields, rec_darkness_ac_rank)}],
			fun darknessRankInit/0,
			fun darknessRankInsert/0,
			fun darknessRankUpdate/0
		},

		{rec_limit_sales,	[{ram_copies, [Node]}, {attributes, record_info(fields, rec_limit_sales)}],
			fun initLimitSalesPush/0 },

		%% 符文
		{recRune, [{ram_copies, [Node]}, {attributes, record_info(fields, recRune)}], fun recRuneInit/0},
%%%%%%%%%%%%%%%%%%%%%%%%请注意，所有init加载的数据，请自行处理同步加载%%%%%%%%%%%%%%%%%%%%%%%%
		%% 玩家资源找回表
		{rec_player_find_res, [{ram_copies, [Node]}, {attributes, record_info(fields, rec_player_find_res)}], fun playerFindResInit/0},

		{rec_msg_c_2_s, [{ram_copies, [Node]}, {attributes, record_info(fields, rec_msg_c_2_s)}]},
		{rec_msg_s_2_c, [{ram_copies, [Node]}, {attributes, record_info(fields, rec_msg_s_2_c)}]}
	],

	%% 建表并初始化
	[databank_dataInit(OneRec) || OneRec <- TableList],

	%% 检查并修复错误数据
%%	checkAndDelErrorData(),
	ok.

%% 同步至数据库
-spec syncToDB() -> ok.
syncToDB() ->
	InsertFunList = [
		fun darknessRankInsert/0,
		fun offlineDataInsert/0,
		fun petBattleReportInsert/0,
		fun manorBattleInsert/0,
		fun guildTaskInsert/0,
		fun guildBuffInsert/0,
		fun guildSkillInsert/0,
		fun guildMemberSkillInsert/0,
		fun lotteryResultInsert/0,
		fun sundriesInsert/0,
		fun operateExchangeInsert/0,
		fun operateDataInsert/0,
		fun operateActivityInsert/0,
		fun playerDataInsert/0,
		fun serverDropInsert/0
	],
	lists:foreach(fun doSyncFun/1, InsertFunList),

	UpdateFunList = [
		fun darknessRankUpdate/0,
		fun offlineDataUpdate/0,
		fun petBattleReportUpdate/0,
		fun manorBattleUpdate/0,
		fun guildTaskUpdate/0,
		fun guildBuffUpdate/0,
		fun guildSkillUpdate/0,
		fun guildMemberSkillUpdate/0,
		fun lotteryResultUpdate/0,
		fun sundriesUpdate/0,
		fun operateExchangeUpdate/0,
		fun operateDataUpdate/0,
		fun operateActivityUpdate/0,
		fun playerDataUpdate/0,
		fun serverDropUpdate/0
	],
	lists:foreach(fun doSyncFun/1, UpdateFunList),
	ok.

%% 初始化
databank_dataInit(Param) ->
	case Param of
		{Table, AttribList, InitFun, InsertFun, UpdateFun} ->
			R1 = edb:createTable(Table,AttribList),
			?LOG_OUT("CreateTable:~p",[Table]),
			R2 = case R1 of
				     true ->
					     case erlang:is_function(InitFun) of
						     true ->
							     ?LOG_OUT("init Table:~p...",[Table]),
							     Ret1 = InitFun(),
							     ?LOG_OUT("init Table:~p ok",[Table]),
							     Ret1;
						     _ -> false
					     end;
				     _ -> R1
			     end,
			case erlang:is_function(InsertFun) of
			    true ->
			        addInsertFunToList(InsertFun),
			        NT = dbMemCache:getNewTableName(Table),
			        edb:createTable(NT,[{record_name,Table} | AttribList]),
			        ?LOG_OUT("CreateTable:~p",[NT]),
			        NT;
			    _ -> ""
			end,
			case erlang:is_function(UpdateFun) of
			    true ->
			        addUpdateFunToList(UpdateFun),
			        UT = dbMemCache:getUpdateTableName(Table),
			        edb:createTable(UT,[{record_name,Table} | AttribList]),
			        ?LOG_OUT("CreateTable:~p",[UT]),
			        UT;
			    _ -> ""
			end,
			?LOG_OUT("createBank Table ~p[~p],init[~p]", [Table, R1, R2]);
		{Table, AttribList, InitFun} ->
			R1 = edb:createTable(Table,AttribList),
			?LOG_OUT("CreateTable:~p",[Table]),
			R2 = case R1 of
				     true ->
					     case erlang:is_function(InitFun) of
						     true ->
							     ?LOG_OUT("init Table:~p...",[Table]),
							     Ret2 = InitFun(),
							     ?LOG_OUT("init Table:~p ok",[Table]),
							     Ret2;
						     _ ->
							     false
					     end;
				     _ -> R1
			     end,
			?LOG_OUT("createBank Table ~p[~p],init [~p]", [Table, R1, R2]);
		{Table, AttribList} ->
			R1 = edb:createTable(Table,AttribList),
			?LOG_OUT("createBank Table ~p[~p], not init", [Table, R1]);
		_ ->
			?ERROR_OUT("initBank unknow format:~p", [Param])
	end,
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================


operateActivityInit() ->
	SQL = "SELECT * FROM operate_activity",
	dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_operate_activity)),
	ok.

operateActivityInsert() ->
	operateActivityInsert(edb:selectTableAndClearTable(new_rec_operate_activity)).
operateActivityInsert([]) ->
	skip;
operateActivityInsert(List) when is_list(List) ->
	Fun =
	fun(#rec_operate_activity{} = R, AccIn) ->
		io_lib:format(",(~p,~p,'~ts','~ts',~p,~p,~p,~p,~p,'~ts','~ts','~ts','~ts','~ts')",
			[
				R#rec_operate_activity.id,
				R#rec_operate_activity.type,
				binary_to_list(R#rec_operate_activity.name),
				binary_to_list(R#rec_operate_activity.desc),
				R#rec_operate_activity.phase,
				R#rec_operate_activity.starttime,
				R#rec_operate_activity.endtime,
				R#rec_operate_activity.minlevel,
				R#rec_operate_activity.maxlevel,
				misc:term_to_string(R#rec_operate_activity.arg1),
				misc:binToString(R#rec_operate_activity.arg2),
				misc:binToString(R#rec_operate_activity.arg3),
				misc:binToString(R#rec_operate_activity.arg4),
				misc:binToString(R#rec_operate_activity.arg5)
			]) ++ AccIn
	end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("insert operate_activity (id, type, name,`desc`, phase, starttime, endtime, minlevel, maxlevel, arg1, arg2, arg3, arg4, arg5) values ~ts",[T]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert operate_activity", Ret, SQL),
	ok.

operateActivityUpdate() ->
	operateActivityUpdate(edb:selectTableAndClearTable(update_rec_operate_activity)).
operateActivityUpdate([]) ->
	skip;
operateActivityUpdate(List) when is_list(List) ->
	Fun =
	fun(#rec_operate_activity{} = R) ->
		SQL = io_lib:format("update operate_activity set name='~ts',`desc`='~ts',phase=~p,endtime=~p,minlevel=~p,maxlevel=~p,arg1='~ts', arg2='~ts', arg3='~ts', arg4='~ts', arg5='~ts' where id=~p",
			[
				binary_to_list(R#rec_operate_activity.name),
				binary_to_list(R#rec_operate_activity.desc),
				R#rec_operate_activity.phase,
				R#rec_operate_activity.endtime,
				R#rec_operate_activity.minlevel,
				R#rec_operate_activity.maxlevel,
				misc:term_to_string(R#rec_operate_activity.arg1),
				misc:binToString(R#rec_operate_activity.arg2),
				misc:binToString(R#rec_operate_activity.arg3),
				misc:binToString(R#rec_operate_activity.arg4),
				misc:binToString(R#rec_operate_activity.arg5),
				R#rec_operate_activity.id
			]),
		Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
		dbMemCache:logResult("update operate_activity", Ret, SQL)
	end,
	lists:foreach(Fun, List).

operateDataInit() ->
	Phase = 2, %%正在执行活动活动的玩家数据
	SQL = io_lib:format("SELECT * FROM operate_data od left join operate_activity oa on od.id = oa.id where oa.phase != ~p",[Phase]),
	dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_operate_data)),
	ok.

operateDataInsert() ->
	operateDataInsert(edb:selectTableAndClearTable(new_rec_operate_data)).
operateDataInsert([]) ->
	skip;
operateDataInsert(List) when  is_list(List) ->
	Fun =
	fun(#rec_operate_data{roleID = {RoleID, _}} = R, AccIn) ->
		io_lib:format(",(~p,~p,'~ts')",
			[
				RoleID,
				R#rec_operate_data.id,
				misc:term_to_string(R#rec_operate_data.arg1)
			]) ++ AccIn
	end,
	[_|T] = lists:foldl(Fun, [], List),
	SQL = io_lib:format("insert operate_data (roleID, id, arg1) values ~ts",[T]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert operate_data", Ret, SQL),
	ok.

operateDataUpdate() ->
	operateDataUpdate(edb:selectTableAndClearTable(update_rec_operate_data)).
operateDataUpdate([]) ->
	skip;
operateDataUpdate(List) when is_list(List) ->
	Fun =
	fun(#rec_operate_data{roleID = {RoleID, _}} = R) ->
		SQL = io_lib:format("update operate_data set arg1='~ts' where id=~p and roleID=~p",
			[
				misc:term_to_string(R#rec_operate_data.arg1),
				R#rec_operate_data.id,
				RoleID
			]),
		Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
		dbMemCache:logResult("update operate_data", Ret, SQL)
	end,
	lists:foreach(Fun, List).

operateExchangeInit() ->
	SQL = "select * from operate_exchange",
	RecordList = dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_operate_exchange)),
	?LOG_OUT("load operate_exchange:"),
	Fun = fun(#rec_operate_exchange{id = ID, exchangeType = Type, exchangeTarget = Target, exchangeNum = N,name = Name}) ->
		?LOG_OUT("\texchange name:\"~ts\" ID:~p type:~p target:~p num:~p",[erlang:binary_to_list(Name),ID,Type,Target,N])
	end,
	lists:foreach(Fun, RecordList),
	?LOG_OUT("load operate_exchange end"),
	ok.

operateExchangeInsert() ->
	List = edb:selectTableAndClearTable(new_rec_operate_exchange),
	operateExchangeInsert(List).

operateExchangeUpdate() ->
	List = edb:selectTableAndClearTable(update_rec_operate_exchange),
	operateExchangeUpdate(List).


operateExchangeInsert([]) ->
	ok;
operateExchangeInsert(List) ->
	Fun = fun(#rec_operate_exchange{
		id = ID,						%%兑换ID int(10) unsigned
		exchangeType = T,				%%兑换的类型，1.道具，2.货币，3.自定义 tinyint(3) unsigned
		exchangeTarget = A,				%%兑换的参数，如果兑换的是道具，则为道具ID；如果是货币则为货币类型 int(10) unsigned
		exchangeNum = N,				%%兑换的数量 smallint(5) unsigned
		require = R,					%%需要的道具信息，格式[{道具ID，道具数量},...] text
		limitCount = M,			        %%每个人可以兑换的最大次数 smallint(6)
		startTime = S,					%%兑换的开始时间 int(11) unsigned
		endTime = E,					%%兑换的结束时间 int(11) unsigned
		name = Name,						%%名字，实际使用6个汉字字符 char(30)
		title = D,						%%标题，实际使用20个汉字字符 varchar(255)
		content = C						%%内容，实际使用100个汉字字符 text
	}) ->
		%%由于兑换配置有很多字符串，为防止多条记录一起插入超限，这里一条一条的插入到数据库中
		SQL = io_lib:format("insert into operate_exchange(id,exchangeType,exchangeTarget,exchangeNum,limitCount,startTime,endTime,`require`,`name`,`title`,content) "
		"values (~p,~p,~p,~p,~p,~p,~p,'~ts','~ts','~ts','~ts')",[ID,T,A,N,M,S,E,misc:term_to_string(R),Name,D,C]),
		Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
		dbMemCache:logResult("insert operate_exchange", Ret, SQL)
	end,
	lists:foreach(Fun,List).

operateExchangeUpdate([]) ->
	ok;
operateExchangeUpdate(List) ->
	Fun = fun(#rec_operate_exchange{
		id = ID,						%%兑换ID int(10) unsigned
		exchangeType = T,				%%兑换的类型，1.道具，2.货币，3.自定义 tinyint(3) unsigned
		exchangeTarget = A,				%%兑换的参数，如果兑换的是道具，则为道具ID；如果是货币则为货币类型 int(10) unsigned
		exchangeNum = N,				%%兑换的数量 smallint(5) unsigned
		require = R,					%%需要的道具信息，格式[{道具ID，道具数量},...] text
		limitCount = M,			        %%每个人可以兑换的最大次数 smallint(6)
		startTime = S,					%%兑换的开始时间 int(11) unsigned
		endTime = E,					%%兑换的结束时间 int(11) unsigned
		name = Name,					%%名字，实际使用6个汉字字符 char(30)
		title = D,						%%标题，实际使用20个汉字字符 varchar(255)
		content = C						%%内容，实际使用100个汉字字符 text
	}) ->
		SQL = case E of
			      0 ->
				      io_lib:format("delete from operate_exchange where id=~p",[ID]);
			      _ ->
				      io_lib:format("update operate_exchange set exchangeType=~p,exchangeTarget=~p,exchangeNum=~p,limitCount=~p,"
				      "startTime=~p,endTime=~p,`require`='~ts',`name`='~ts',`title`='~ts',content='~ts' where id=~p",
					      [T,A,N,M,S,E,misc:term_to_string(R),Name,D,C,ID])
		      end,
		Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
		dbMemCache:logResult("update operate_exchange", Ret, SQL)
	end,
	lists:foreach(Fun,List).

%%初始化杂项内容
sundriesInit() ->
	SQL = "select * from sundries",
	dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_sundries)),
	ok.

%%插入杂项内容
sundriesInsert() ->
	List = edb:selectTableAndClearTable(new_rec_sundries),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_sundries{id = {ID,_},key = Key,value = V}) ->
				SQL = io_lib:format("insert sundries(id,`key`,`value`) values(~p,'~ts','~ts')",[ID,misc:term_to_string(Key),misc:term_to_string(V)]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
				dbMemCache:logResult("insert sundries", Ret, SQL)
			end,
			lists:foreach(Fun,List)
	end,
	ok.

%%更新杂项内容
sundriesUpdate() ->
	List = edb:selectTableAndClearTable(update_rec_sundries),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_sundries{id = {ID,_},key = Key,value = V}) ->
				SQL = io_lib:format("update sundries set `value`='~ts' where id=~p and `key`='~ts'",[misc:term_to_string(V),ID,misc:term_to_string(Key)]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
				dbMemCache:logResult("update sundries", Ret, SQL)
			end,
			lists:foreach(Fun,List)
	end,
	ok.

%% 加载占卜note数据
lotteryResultInit() ->
	SQL = "select * from lottery_result",
	dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_lottery_result)),
	ok.

%% 军团相关数据初始化
guildWarInit() ->
	SQL = "SELECT * FROM guild_war",
	dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_guild_war)),
	ok.
guildWarPaidInit() ->
	SQL = "SELECT * FROM guild_war_paid",
	dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_guild_war_paid)),
	ok.

guildMemberSkillInit() ->
	SQL = "SELECT * FROM guild_member_skill",
	dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_guild_member_skill)),
	ok.
guildMemberSkillInsert() ->
	List = edb:selectTableAndClearTable(new_rec_guild_member_skill),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_guild_member_skill{guildID = {GuildID, RoleID, SkillID}, skillLvl = SLvl}, AccIn) ->
					io_lib:format(",(~p,~p,~p,~p)", [GuildID,RoleID,SkillID,SLvl]) ++ AccIn
				end,
			[_|T] = lists:foldl(Fun, [], List),
			SQL = io_lib:format("INSERT INTO guild_member_skill (guildID, roleID, skillID, skillLvl) VALUES ~ts", [T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
			dbMemCache:logResult("insert guild_member_skill", Ret, SQL)
	end,
	ok.
guildMemberSkillUpdate() ->
	List = edb:selectTableAndClearTable(update_rec_guild_member_skill),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_guild_member_skill{guildID = {GuildID, RoleID, SkillID}, skillID = SkillID2, skillLvl = SLvl}) ->
					case SkillID /= SkillID2 of
						true ->
							%% 删除
							SQL1 = io_lib:format("DELETE FROM guild_member_skill WHERE guildID = ~p AND roleID = ~p AND skillID = ~p",
								[GuildID, RoleID, SkillID]),
							Ret1 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL1),
							dbMemCache:logResult("DELETE guild_member_skill", Ret1, SQL1);
						_ ->
							%% 更新
							SQL2 = io_lib:format("UPDATE guild_member_skill gms set gms.skillLvl = ~p WHERE guildID = ~p AND roleID = ~p AND skillID = ~p",
								[SLvl, GuildID, RoleID, SkillID]),
							Ret2 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL2),
							dbMemCache:logResult("update guild_member_skill", Ret2, SQL2)
					end
				end,
			lists:foreach(Fun,List)
	end,
	ok.

guildSkillInit() ->
	SQL = "SELECT * FROM guild_skill",
	dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_guild_skill)),
	ok.
guildSkillInsert() ->
	List = edb:selectTableAndClearTable(new_rec_guild_skill),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_guild_skill{guildID = {GuildID, SkillID}, skillID = SkillID, skillLvl = SLvl}, AccIn) ->
					io_lib:format(",(~p,~p,~p)", [GuildID,SkillID,SLvl]) ++ AccIn
				end,
			[_|T] = lists:foldl(Fun, [], List),
			SQL = io_lib:format("INSERT INTO guild_skill (guildID, skillID, skillLvl) VALUES ~ts", [T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
			dbMemCache:logResult("insert guild_skill", Ret, SQL)
	end,
	ok.
guildSkillUpdate() ->
	List = edb:selectTableAndClearTable(update_rec_guild_skill),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_guild_skill{guildID = {GuildID, SkillID}, skillID = SkillID2, skillLvl = SLvl}) ->
					case SkillID /= SkillID2 of
						true ->
							%% 删除
							SQL1 = io_lib:format("DELETE FROM guild_skill WHERE guildID = ~p AND skillID = ~p", [GuildID, SkillID]),
							Ret1 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL1),
							dbMemCache:logResult("DELETE guild_skill", Ret1, SQL1);
						_ ->
							%% 更新
							SQL2 = io_lib:format("UPDATE guild_skill gs set gs.skillLvl = ~p WHERE gs.guildID = ~p AND gs.skillID = ~p",
								[SLvl, GuildID, SkillID]),
							Ret2 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL2),
							dbMemCache:logResult("update guild_skill", Ret2, SQL2)
					end
				end,
			lists:foreach(Fun,List)
	end,
	ok.

guildBuffInit() ->
	SQL = "SELECT * FROM guild_buff",
	dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_guild_buff)),
	ok.
guildBuffInsert() ->
	List = edb:selectTableAndClearTable_Bag(new_rec_guild_buff),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_guild_buff{guildID = GuildID, buffID = BuffID, buyTime = BTime, buyRoleID = BRoleID}, AccIn) ->
					io_lib:format(",(~p,~p,~p,~p)", [GuildID,BuffID,BTime,BRoleID]) ++ AccIn
				end,
			[_|T] = lists:foldl(Fun, [], List),
			SQL = io_lib:format("INSERT INTO guild_buff (guildID, buffID, buyTime, buyRoleID) VALUES ~ts", [T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
			dbMemCache:logResult("insert guild_buff", Ret, SQL)
	end,
	ok.
guildBuffUpdate() ->
	List = edb:selectTableAndClearTable_Bag(update_rec_guild_buff),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_guild_buff{guildID = GuildID, buffID = BuffID, buyTime = BTime}) ->
					%% 删除
					SQL = io_lib:format("DELETE FROM guild_buff WHERE guildID = ~p AND buffID = ~p AND buyTime = ~p",
						[GuildID, BuffID, BTime]),
					Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
					dbMemCache:logResult("DELETE guild_buff", Ret, SQL)
				end,
			lists:foreach(Fun,List)
	end,
	ok.

guildTaskInit() ->
	SQL = "SELECT * FROM guild_task",
	dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_guild_task)),
	ok.
guildTaskInsert() ->
	List = edb:selectTableAndClearTable(new_rec_guild_task),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_guild_task{roleID = {RoleID, TaskType}, taskType = TaskType} = Task, AccIn) ->
					io_lib:format(",(~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p)",
						[
							RoleID,
							TaskType,
							Task#rec_guild_task.taskID,
							Task#rec_guild_task.targetGuildID,
							Task#rec_guild_task.targetRoleID,
							Task#rec_guild_task.curTimes,
							Task#rec_guild_task.maxTimes,
							Task#rec_guild_task.freshTime,
							Task#rec_guild_task.number1,
							Task#rec_guild_task.number2,
							Task#rec_guild_task.number3
						]) ++ AccIn
				end,
			[_|T] = lists:foldl(Fun, [], List),
			SQL = io_lib:format("INSERT INTO guild_task (roleID, taskType, taskID, targetGuildID, targetRoleID, curTimes, maxTimes, freshTime, number1, number2, number3) VALUES ~ts", [T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
			dbMemCache:logResult("insert guild_task", Ret, SQL)
	end,
	ok.
guildTaskUpdate() ->
	List = edb:selectTableAndClearTable(update_rec_guild_task),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_guild_task{roleID = {RoleID, TaskType1}, taskType = TaskType2} = Task) ->
					case TaskType1 =:= TaskType2 of
						true ->
							%% 更新
							SQL = io_lib:format("UPDATE guild_task gt
								SET gt.taskID = ~p,
								gt.targetGuildID = ~p,
								gt.targetRoleID = ~p,
								gt.curTimes = ~p,
								gt.maxTimes = ~p,
								gt.freshTime = ~p,
								gt.number1 = ~p,
								gt.number2 = ~p,
								gt.number3 = ~p WHERE gt.roleID = ~p AND gt.taskType = ~p",
								[
									Task#rec_guild_task.taskID,
									Task#rec_guild_task.targetGuildID,
									Task#rec_guild_task.targetRoleID,
									Task#rec_guild_task.curTimes,
									Task#rec_guild_task.maxTimes,
									Task#rec_guild_task.freshTime,
									Task#rec_guild_task.number1,
									Task#rec_guild_task.number2,
									Task#rec_guild_task.number3,
									RoleID,
									TaskType1
								]),
							Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
							dbMemCache:logResult("UPDATE guild_task", Ret, SQL);
						_ ->
							%% 删除
							SQL = io_lib:format("DELETE FROM guild_task WHERE roleID = ~p AND taskType = ~p", [RoleID, TaskType1]),
							Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
							dbMemCache:logResult("DELETE guild_task", Ret, SQL)
					end
				end,
			lists:foreach(Fun,List)
	end,
	ok.

darknessRankInit() ->
	SQL = "SELECT * FROM darkness_ac_rank",
	dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_darkness_ac_rank)),
	ok.
darknessRankInsert() ->
	List = edb:selectTableAndClearTable(new_rec_darkness_ac_rank),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_darkness_ac_rank{roleID = RoleID, camp = Camp, rank = Rank, point = Point}, AccIn) ->
					io_lib:format(",(~p,~p,~p,~p)", [RoleID,Camp,Rank,Point]) ++ AccIn
				end,
			[_|T] = lists:foldl(Fun, [], List),
			SQL = io_lib:format("INSERT INTO darkness_ac_rank (roleID, camp, rank, `point`) VALUES ~ts", [T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
			dbMemCache:logResult("insert darkness_ac_rank", Ret, SQL)
	end,
	ok.
darknessRankUpdate() ->
	List = edb:selectTableAndClearTable(update_rec_darkness_ac_rank),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_darkness_ac_rank{roleID = RoleID, camp = Camp, rank = Rank, point = Point}) ->
					case Camp =:= 0 of
						true ->
							%% 删除
							SQL1 = io_lib:format("DELETE FROM darkness_ac_rank WHERE roleID = ~p", [RoleID]),
							Ret1 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL1),
							dbMemCache:logResult("DELETE darkness_ac_rank", Ret1, SQL1);
						_ ->
							%% 更新
							SQL2 = io_lib:format("UPDATE darkness_ac_rank set camp = ~p, rank = ~p, `point` = ~p WHERE roleID = ~p",
								[Camp, Rank, Point, RoleID]),
							Ret2 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL2),
							dbMemCache:logResult("update darkness_ac_rank", Ret2, SQL2)
					end
				end,
			lists:foreach(Fun,List)
	end,
	ok.

lotteryResultInsert() ->
	List = edb:selectTableAndClearTable_Bag(new_rec_lottery_result),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_lottery_result{roleID = RID, itemID = ItemID, itemNumber = Num, isBind = Bind, isServerNote = Note, zbTime = Time}, AccIn) ->
					io_lib:format(",(~p,~p,~p,~p,~p,~p)", [RID, ItemID, Num, Bind, Note, Time]) ++ AccIn
				end,
			[_|T] = lists:foldl(Fun, [], List),
			SQL = io_lib:format("INSERT INTO lottery_result (roleID, itemID, itemNumber, isBind, isServerNote, zbTime) VALUES ~ts", [T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
			dbMemCache:logResult("lotteryResultInsert", Ret, SQL)
	end,
	ok.

lotteryResultUpdate() ->
	List = edb:selectTableAndClearTable_Bag(update_rec_lottery_result),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_lottery_result{roleID = RID, zbTime = Time}) ->
					SQL = io_lib:format("DELETE FROM lottery_result WHERE roleID = ~p AND zbTime = ~p", [RID, Time]),
					Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
					dbMemCache:logResult("lotteryResultUpdate", Ret, SQL)
				end,
			lists:foreach(Fun,List)
	end,
	ok.

manorBattleInit() ->
	SQL = "select * from manor_battle",
	dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_manor_battle)),
	ok.

manorBattleInsert() ->
	L = edb:selectTableAndClearTable_Bag(new_rec_manor_battle),
	manorBattleInsert(L).
manorBattleInsert([]) ->
	ok;
manorBattleInsert(L) ->
	F = fun(#rec_manor_battle{manorID = MID, manorHp = Hp, manorMaxHp = MaxHp, manorPos = Pos, manorForce = Force, manorTime = Time, roleID = RoleID}, AccIn) ->
					io_lib:format(",(~p,~p,~p,'~ts',~p,~p,~p)", [MID, Hp, MaxHp, misc:term_to_string(Pos), Force, Time, RoleID]) ++ AccIn
	end,
	[_|T] = lists:foldl(F, [], L),
	SQL = io_lib:format("insert manor_battle (manorID, manorHp, manorMaxHp, manorPos, manorForce, manorTime, roleID) VALUES ~ts", [T]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert manor_battle", Ret, SQL),
	ok.

manorBattleUpdate() ->
	L = edb:selectTableAndClearTable_Bag(update_rec_manor_battle),
	manorBattleUpdate(L).

manorBattleUpdate([]) ->
	ok;
manorBattleUpdate(L) ->
	F = fun(#rec_manor_battle{manorID = MID, manorHp = Hp, manorMaxHp = MaxHp, manorPos = Pos, manorForce = Force, manorTime = Time, roleID = RoleID}) ->
		SQL = io_lib:format("update manor_battle set manorHp=~p, manorMaxHp = ~p, manorPos='~ts',manorForce = ~p, manorTime = ~p, roleID='~p' where manorID=~p ",[Hp,MaxHp,misc:term_to_string(Pos),Force,Time,RoleID,MID]),
		Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
		dbMemCache:logResult("update manor_battle", Ret, SQL)
	end,
	lists:foreach(F, L).

serverDropInit() ->
	SQL = "select * from server_drop",
	dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_server_drop)),
	ok.

serverDropInsert() ->
	L = edb:selectTableAndClearTable(new_rec_server_drop),
	serverDropInsert(L).
serverDropInsert([]) ->
	ok;
serverDropInsert(L) ->
	F = fun(#rec_server_drop{id = Id, num = Num, time = Time}, AccIn) ->
		io_lib:format(",(~p,~p,~p)", [Id, Num, Time]) ++ AccIn
	end,
	[_|T] = lists:foldl(F, [], L),
	SQL = io_lib:format("insert server_drop (id, num, time) VALUES ~ts", [T]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert server_drop", Ret, SQL),
	ok.

serverDropUpdate() ->
	L = edb:selectTableAndClearTable_Bag(update_rec_server_drop),
	serverDropUpdate(L).
serverDropUpdate([]) ->
	ok;
serverDropUpdate(L) ->
	F = fun(#rec_server_drop{id = Id, num = Num, time = Time}) ->
		SQL = io_lib:format("update server_drop set num = ~p, time = ~p where id=~p ",[Num, Time, Id]),
		Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
		dbMemCache:logResult("update server_drop", Ret, SQL)
	end,
	lists:foreach(F, L).

offlineDataInit() ->
	SQL = "select * from offline_data",
	dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_offline_data)),
	ok.

offlineDataInsert() ->
	L = edb:selectTableAndClearTable_Bag(new_rec_offline_data),
	offlineDataInsert(L).
offlineDataInsert([]) ->
	ok;
offlineDataInsert(L) ->
	F = fun(#rec_offline_data{roleID = RoleID, sysID = SysID, isLoad = IsLoad}, AccIn) ->
		io_lib:format(",(~p,~p,~p)", [RoleID, SysID, IsLoad]) ++ AccIn
	end,
	[_|T] = lists:foldl(F, [], L),
	SQL = io_lib:format("insert offline_data (roleID, sysID, isLoad) VALUES ~ts", [T]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert offline_data", Ret, SQL),
	ok.

offlineDataUpdate() ->
	L = edb:selectTableAndClearTable_Bag(update_rec_offline_data),
	offlineDataUpdate(L).
offlineDataUpdate([]) ->
	ok;
offlineDataUpdate(L) ->
	F = fun(#rec_offline_data{sysID = SysID, roleID = RoleID, isLoad = IsLoad}) ->
		SQL = io_lib:format("update offline_data set sysID = ~p, isLoad = ~p where roleID=~p ",[SysID, IsLoad, RoleID]),
		Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
		dbMemCache:logResult("update offline_data", Ret, SQL)
	end,
	lists:foreach(F, L).

petBattleReportInit() ->
	SQL = "select * from pet_battle_report",
	dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_pet_battle_report)),
	ok.

petBattleReportInsert() ->
	L = edb:selectTableAndClearTable_Bag(new_rec_pet_battle_report),
	petBattleReportInsert(L).
petBattleReportInsert([]) ->
	ok;
petBattleReportInsert(L) ->
	F = fun(#rec_pet_battle_report{br_list = BrList, roleID = RoleID}, AccIn) ->
					io_lib:format(",('~ts',~p)", [misc:term_to_string(BrList), RoleID]) ++ AccIn
	end,
	[_|T] = lists:foldl(F, [], L),
	SQL = io_lib:format("insert pet_battle_report (br_list, roleID) VALUES ~ts", [T]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert pet_battle_report", Ret, SQL),
	ok.

petBattleReportUpdate() ->
	L = edb:selectTableAndClearTable_Bag(update_rec_pet_battle_report),
	petBattleReportUpdate(L).

petBattleReportUpdate([]) ->
	ok;
petBattleReportUpdate(L) ->
	F = fun(#rec_pet_battle_report{br_list = BrList, roleID = RoleID}) ->
		SQL = io_lib:format("update pet_battle_report set br_list='~ts' where roleID=~p ",[misc:term_to_string(BrList),RoleID]),
		Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
		dbMemCache:logResult("update pet_battle_report", Ret, SQL)
	end,
	lists:foreach(F, L).

playerDataInit() ->
    SQL = "SELECT pd.* FROM player_data pd LEFT JOIN base_role br ON pd.roleID = br.roleID WHERE br.deleteTime < '2000-01-01 00:00:01';",
    dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_player_data)),
	ok.

playerDataInsert() ->
	List = edb:selectTableAndClearTable(new_rec_player_data),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_player_data{roleID = RoleID} = R, AccIn) ->
					case RoleID > 0 of
						true ->
							io_lib:format(",(~p,~p,~p)",
								[
									RoleID,
									R#rec_player_data.exitGuildTime,
									R#rec_player_data.guildAwardTime
								]) ++ AccIn;
						_ ->
							AccIn
					end
				end,
			case lists:foldl(Fun,[],List) of
				[_|T] ->
					SQL = io_lib:format("INSERT player_data (roleID, exitGuildTime, guildAwardTime) VALUES ~ts",[T]),
					Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
					dbMemCache:logResult("INSERT player_data",Ret,SQL);
				_ ->
					skip
			end
	end,
	ok.

playerDataUpdate() ->
	List = edb:selectTableAndClearTable(update_rec_player_data),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_player_data{roleID = RoleID} = R) ->
					SQL =
						case RoleID of
							{RID} ->
								%% 删除
								io_lib:format("DELETE FROM player_data WHERE roleID = ~p", [RID]);
							_ ->
								%% 更新
								io_lib:format("UPDATE player_data pd set pd.exitGuildTime = ~p, pd.guildAwardTime = ~p WHERE pd.roleID = ~p",
									[R#rec_player_data.exitGuildTime, R#rec_player_data.guildAwardTime, RoleID])
						end,
					Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
					dbMemCache:logResult("update player_data",Ret,SQL)
				end,
			lists:foreach(Fun,List)
	end,
	ok.

ladder1V1Init(PidFromGS) ->
	SQL = "SELECT COUNT(*) FROM ladder_1v1 lv",
	OneCount = ?One_LoadRoleData,    % 每次取一千个角色

	%% 查询角色个数
	RetCount = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	{RoleCount, _LeftResult} = mysql:nextResult(RetCount),
	Count = mysql:getFieldValue(1, mysql:firstRow(RoleCount)),
	Name = ?Prestrain_ladder1V1Init3,
	RankPlayerName = ?Prestrain_loadRankPlayerInfo,
    case Count of
        0 ->
			spawnLoadData:delLoadDataPid(RankPlayerName),
            psMgr:sendMsg2PS(PidFromGS, loadLadder1v1InfoAck, 0);
        _ ->
            %% 查询总次数
            Times = case Count =< OneCount of
                        true -> 0;
                        false -> Count div OneCount
                    end,
            %% 多查询一次
            TimesList = lists:seq(0, Times + 1),
            [ladder1V1Init2(PidFromGS, OneCount, Number, Name, RankPlayerName) || Number <- TimesList],
            ok
    end,
	spawnLoadData:delLoadDataPid(Name),
	ok.

ladder1V1Init2(PidFromGS, OneCount, Number, Name, RankPlayerName) ->
    erlang:spawn(fun() -> ladder1V1Init3(PidFromGS, OneCount, Number, Name, RankPlayerName) end),
    ok.

ladder1V1Init3(PidFromGS, OneCount, Number, Name, RankPlayerName) ->
    spawnLoadData:putLoadDataPid(#recProcess{pid = self(), name = Name}),

    %% 睡几秒，等加载进程分配完成
    timer:sleep(misc:rand(1000,5000)),

	SQL = io_lib:format("SELECT * FROM ladder_1v1 lv LIMIT ~p, ~p",[Number * OneCount, OneCount]),
    Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
    RecordList = emysql_util:as_record(Ret, rec_ladder_1v1, record_info(fields, rec_ladder_1v1)),
    psMgr:sendMsg2PS(PidFromGS, loadLadder1v1InfoAck, RecordList),

    %% 加载模型数据
    case Number of
	    0 ->
		    dbMemLoadData:loadLadderRankPlayerInfo(RecordList, RankPlayerName);
		_ ->
			skip
    end,

	spawnLoadData:delLoadDataPid(RankPlayerName),

    %% 移除自己
    spawnLoadData:delLoadDataPid(self()),

    case spawnLoadData:getLoadDataList(Name) of
        [] ->
            %% 加载完毕
            psMgr:sendMsg2PS(PidFromGS, loadLadder1v1InfoAck, -1),
            ok;
        _ ->
            skip
    end,
	ok.

%% 加载玩家角色模形外观到内存数据库
%% param IsCheckLoad 要检查已经加载
-spec getRoleAppearance([integer(),...], boolean()) -> list().
getRoleAppearance(RoleIDList, IsCheckLoad) when erlang:is_list(RoleIDList) ->
	Fun =
		fun(RoleID, AccList) ->
			IsLoad =
				case uidMgr:checkUID(?UID_TYPE_Role, RoleID) of
					true ->
						case IsCheckLoad of
							true ->
								case ets:lookup(recPlayerObjectID, RoleID) of
									[#recKeyValue{}] -> false;
									[] ->
										%% 没找到，插入成功则加载
										ets:insert_new(recPlayerObjectID, #recKeyValue{key = RoleID})
								end;
							_ ->
								%% 不检查，如果没有，则插入
								ets:insert_new(recPlayerObjectID, #recKeyValue{key = RoleID}),
								true
						end;
					_ ->
						?ERROR_OUT("getRoleAppearance:~p,~p", [RoleID, misc:getStackTrace()]),
						false
				end,
			case IsLoad of
				true ->
					%% 从数据库中获取模型数据
					EquipInfoList = dbGSLoad:getRoleVisualEquip(RoleID),

					%% titledata
					SQL2 = io_lib:format("call getPlayerProp(~p)", [RoleID]),
					Ret2 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL2),
					{Result2, _LeftResult2} = mysql:nextResult(Ret2),
					PropList = emysql_util:as_record(Result2, rec_player_prop, record_info(fields, rec_player_prop)),
					TitleRec = #pk_TitleData{
						title1 = getSyncPropIntValue(?PubProp_TitleSlot1, PropList),
						title2 = getSyncPropIntValue(?PubProp_TitleSlot2, PropList),
						title3 = getSyncPropIntValue(?PubProp_TitleSlot3, PropList),
						color = getSyncPropIntValue(?PubProp_TitleColorSlot, PropList),
						background = getSyncPropIntValue(?PubProp_TitleFloorSlot, PropList)
					},
%%					WingLevelProp = getSyncPropIntValue(?PubProp_WingLevel, PropList),
%%					<< _IsShow:1,WingLevel:31>> = << WingLevelProp:32 >>,

					%% visibleEquipLevels
					RefineList = dbGSLoad:getRoleEquipRefine(RoleID),
					Fun =
						fun(#rec_equip_refine_info{} = Refine, Acc) ->
							[{Refine#rec_equip_refine_info.type,Refine#rec_equip_refine_info.level} | Acc]
						end,
					EquipLvList = lists:foldl(Fun, [], RefineList),

					%% 时装
					FashionIDList =
						case getSyncPropIntValue(?PubProp_FashionVisibleFlag, PropList) of
							0 ->
								FNow = time:getUTCNowSec(),
								FFashion =
									fun(#recFashionOnLoad{value = FValue, endTime = FEndTime}, AccL) ->
										case FEndTime =:= 0 orelse
											(erlang:is_integer(FEndTime) andalso FEndTime > FNow) of
											true ->
												[FValue | AccL];
											_ ->
												AccL
										end
									end,
								lists:foldl(FFashion, [], dbGSLoad:getRoleFashion(RoleID));
							_ ->
								[]
						end,

					Value = {RoleID, 0, TitleRec, EquipInfoList, EquipLvList, FashionIDList},
					ets:update_element(recPlayerObjectID, RoleID, {#recKeyValue.value, Value}),
					[Value | AccList];
				false ->
					AccList
			end
		end,
	RetList = lists:foldl(Fun, [], RoleIDList),
	%% 返回给GS
	case RetList of
		[] -> skip;
		_ ->
			psMgr:sendMsg2PS(?PublicDataMgr, loadPlayerRankInfoAck, RetList)
	end,
	RetList.


%% 加载玩家角色模形数据到内存数据库
-spec getRoleDataInfo([integer(),...] | integer()) -> ok.
getRoleDataInfo([]) ->
	ok;
getRoleDataInfo(RoleIDList) ->
	Len = erlang:length(RoleIDList),
	case Len >= ?One_LoadRoleData of
		true ->
			L = lists:sublist(RoleIDList, ?One_LoadRoleData),
			erlang:spawn(fun() -> getRoleDataInfo2(L) end),
			getRoleDataInfo(RoleIDList -- L);
		_ ->
			%% 直接加载
			getRoleAppearance(RoleIDList, true)
	end.
getRoleDataInfo2(RoleIDList) ->
	Name = ?Prestrain_loadPlayerObject,
	spawnLoadData:putLoadDataPid(#recProcess{pid = self(), name = Name}),
	%% 睡几秒，等加载进程分配完成
	timer:sleep(misc:rand(1000,5000)),
	getRoleAppearance(RoleIDList, true),
	spawnLoadData:delLoadDataPid(self()),
	ok.

addInsertFunToList(Fun) ->
	L = getInsertFunList(),
	put(databankInit_InsertFunToList, [Fun | L]).

getInsertFunList() ->
	case get(databankInit_InsertFunToList) of
		undefined -> [];
		List -> List
	end.

addUpdateFunToList(Fun) ->
	L = getUpdateFunList(),
	put(databankInit_UpdateFunToList, [Fun | L]).

getUpdateFunList() ->
	case get(databankInit_UpdateFunToList) of
		undefined -> [];
		List -> List
	end.

doSyncFun(Fun) ->
	try
		Fun()
	catch
		_:Why ->
			?ERROR_OUT("~p Error SyncToDB:~p Stack:~p",[?MODULE, Why,erlang:get_stacktrace()])
	end.

getSyncPropIntValue(Index_ID, PropList) ->
	case lists:keyfind(Index_ID, #rec_player_prop.propIndex, PropList) of
		#rec_player_prop{propValue = BinData} ->
			Value = case erlang:is_binary(BinData) of
				        true -> erlang:binary_to_list(BinData);
				        _ -> BinData
			        end,
			erlang:list_to_integer(Value);
		_ -> 0
	end.

initLimitSalesPush()->
	SQL = "SELECT * FROM limit_sales",
%%	case emysql:execute(?GAMEDB_CONNECT_POOL,SQL) of
%%		[]-> skip;
%%		Ret ->
%%			{TableRecord,RecInfo} = ?MakeArg(rec_limit_sales),
%%			RecordList = emysql_util:as_record(Ret, TableRecord, RecInfo),
%%			Fun = fun(Record) ->
%%				edb:writeRecord(Record)
%%				  end,
%%			lists:foreach(Fun,RecordList)
%%	end,
	dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_limit_sales)),
	ok.

%% 符文
recRuneInit() ->
	RuneBaseEts = ets:new(rune_temp_base, [protected, {keypos, #rec_rune_base.runeUID},{write_concurrency, true},{read_concurrency, true}]),
	RunePropEts = ets:new(rune_temp_prop, [protected, duplicate_bag, {keypos, #rec_rune_prop.runeUID},{write_concurrency, true},{read_concurrency, true}]),

	loadRuneData(RuneBaseEts, 0, 100000, rec_rune_base, record_info(fields, rec_rune_base)),
	loadRuneData(RunePropEts, 0, 100000, rec_rune_prop, record_info(fields, rec_rune_prop)),

	FProp =
		fun(#rec_rune_prop{runeUID = RuneUID, propType = Type, propKey = Key, propValue = Value, calcType = CalcType}, {Index, Acc1, Acc2}) ->
			R = #recRuneProp{
				runeUID = RuneUID,
				index = Index,
				propType = Type,
				propKey = Key,
				propValue = Value,
				calcType = CalcType
			},
			case Type of
				1 -> {Index + 1, [R | Acc1], Acc2};
				_ -> {Index + 1, Acc1, [R | Acc2]}
			end
		end,

	F =
		fun(#rec_rune_base{runeUID = UID} = Base, _Acc) ->
			Prop = ets:lookup(RunePropEts, UID),
			{_, BaseP, RandP} = lists:foldl(FProp, {1, [], []}, Prop),
			Rec = #recRune{
				runeUID = UID,
				runeID = Base#rec_rune_base.runeID,
				roleID = Base#rec_rune_base.roleID,
				subOwnerID = Base#rec_rune_base.subOwnerID,
				level = Base#rec_rune_base.level,
				exp = Base#rec_rune_base.exp,
				isBind = Base#rec_rune_base.isBind,
				createTime = runeTimeStringToInt64(Base#rec_rune_base.createTime),
				deleteTime = runeTimeStringToInt64(Base#rec_rune_base.deleteTime),
				expiredTime = runeTimeStringToInt64(Base#rec_rune_base.expiredTime),
				baseProps = BaseP,
				randProps = RandP
			},
			edb:dirtyWriteRecord(Rec),
			ok
		end,
	ets:foldl(F, 0, RuneBaseEts),

	ets:delete_all_objects(RuneBaseEts),
	ets:delete_all_objects(RunePropEts),
	ok.

runeTimeStringToInt64(DateTime) ->
	case erlang:is_integer(DateTime) of
		true ->
			DateTime;
		false ->
			case DateTime of
				{datetime, {{1970, 1, 1}, {0, 0, 0}}} ->
					0;
				{datetime, DT} ->
					time:convertDateTime1970ToSec(DT) - ?SECS_FROM_0_TO_1970
			end
	end.

loadRuneData(RuneBaseEts, Start, OneCount, TableName, TableInfo) ->
	Now = time:getUTCNowSec(),
	NowStr = time:convertTimeStamp2DateTimeStr(Now),
	N = Start * OneCount,
	SQL =
		case TableName of
			rec_rune_base ->
				io_lib:format("SELECT * FROM rune_base rb WHERE rb.deleteTime = '1970-01-01 00:00:00'
							AND (expiredTime = '1970-01-01 00:00:00' OR expiredTime > '~ts') LIMIT ~p, ~p;", [NowStr, N, OneCount]);
			rec_rune_prop ->
				io_lib:format("SELECT rp.* FROM rune_base rb LEFT JOIN rune_prop rp ON rb.runeUID = rp.runeUID WHERE rb.deleteTime = '1970-01-01 00:00:00'
							AND (expiredTime = '1970-01-01 00:00:00' OR expiredTime > '~ts') LIMIT ~p, ~p;", [NowStr, N, OneCount])
		end,
	?LOG_OUT("loadRuneBaseData:~p,~p,~ts", [TableName,N,SQL]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
	case emysql_util:as_record(Ret, TableName, TableInfo) of
		[] -> skip;
		List ->
			ets:insert(RuneBaseEts, List),
			case erlang:length(List) >= OneCount of
				true ->
					%% 继续取数据
					loadRuneData(RuneBaseEts, Start + 1, OneCount, TableName, TableInfo);
				_ ->
					skip
			end
	end.

%% 加载玩家资源找回数据
playerFindResInit() ->
	playerFindResInit2(0, 100000),
	ok.

playerFindResInit2(Start, OneCount) ->
	N = Start * OneCount,
	SQL = io_lib:format("SELECT * FROM player_find_res pfr order by roleID, activityID LIMIT ~p, ~p", [N, OneCount]),

	?LOG_OUT("playerFindResInit:~ts", [SQL]),

	%% 这里暂时不用多进程的方式来做，等数据量大点再说吧
	List = dbMemCacheCommon:getDataFromDB(SQL, ?MakeArg(rec_player_find_res)),
	case erlang:length(List) =:= OneCount of
		true ->
			%% 继续取数据
			playerFindResInit2(Start + 1, OneCount);
		_ ->
			skip
	end.