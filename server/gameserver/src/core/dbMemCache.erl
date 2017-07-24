%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 15. 四月 2015 9:32
%%%-------------------------------------------------------------------

-module(dbMemCache).
-author("ZhongYuanWei").

-include("mysql.hrl").
-include("db.hrl").
-include("logger.hrl").
-include("emysql.hrl").
-include("dbsInc.hrl").
-include("gsDef.hrl").

%% API
-export([
	initDBTable/0,
	syncToDB/0
]).

-export([
	getNewTableName/1,
	getUpdateTableName/1,
	logResult/3
]).

-export([
	convert2MysqlDateTimeStr/1
]).

initDBTable() ->
	Node = node(),
	TableList = [
		{rec_achieve,			 [{ram_copies, [Node]}, {attributes, record_info(fields, rec_achieve)}]},				%%成就
		{rec_awaken_info,		 [{ram_copies, [Node]}, {attributes, record_info(fields, rec_awaken_info)}]},			%%觉醒
		{rec_badge,				 [{ram_copies, [Node]}, {attributes, record_info(fields, rec_badge)}]},					%%徽章
		{rec_player_coin,        [{ram_copies, [Node]}, {attributes, record_info(fields, rec_player_coin)}]},			%%角色货币
		{rec_buff,               [{ram_copies, [Node]}, {attributes, record_info(fields, rec_buff)}]},					%%BUFF
		{rec_common_active_code, [{ram_copies, [Node]}, {attributes, record_info(fields, rec_common_active_code)}]},	%%激活码
		{rec_daily_counter0,     [{ram_copies, [Node]}, {attributes, record_info(fields, rec_daily_counter0)}]},		%%每日计数器
%%		{rec_equip_base_info,    [{ram_copies, [Node]}, {attributes, record_info(fields, rec_equip_base_info)}]},		%%装备基本信息
%%		{rec_equip_enhance_info, [{ram_copies, [Node]}, {attributes, record_info(fields, rec_equip_enhance_info)}]},	%%装备强化信息
%%		{rec_equip_ext_info,     [{ram_copies, [Node]}, {attributes, record_info(fields, rec_equip_ext_info)}]},		%%装备扩展信息
		{rec_equip_refine_info,  [{ram_copies, [Node]}, {attributes, record_info(fields, rec_equip_refine_info)}]},		%%部位强化
		{rec_fashion_slot,       [{ram_copies, [Node]}, {attributes, record_info(fields, rec_fashion_slot)}]},			%%穿上的时装信息
		{rec_item,               [{ram_copies, [Node]}, {attributes, record_info(fields, rec_item)},{index, [roleID]}]},%%道具信息
		{rec_item_used_cd,       [{ram_copies, [Node]}, {attributes, record_info(fields, rec_item_used_cd)}]},			%%道具使用CD
		{rec_package_info,       [{ram_copies, [Node]}, {attributes, record_info(fields, rec_package_info)}]},			%%背包格子信息
		{rec_pet_equip,          [{ram_copies, [Node]}, {attributes, record_info(fields, rec_pet_equip)}]},				%%宠物装备信息
		{rec_pet_info,           [{ram_copies, [Node]}, {attributes, record_info(fields, rec_pet_info)}]},				%%宠物信息
		{rec_pet_skill,          [{ram_copies, [Node]}, {attributes, record_info(fields, rec_pet_skill)}]},				%%宠物技能
		{rec_pet_manor_battle,   [{ram_copies, [Node]}, {attributes, record_info(fields, rec_pet_manor_battle)}]},		%%宠物争夺战信息
		{rec_pet_dungeon_score,  [{ram_copies, [Node]}, {attributes, record_info(fields, rec_pet_dungeon_score)}]},		%%宠物远征副本
		{rec_pet_dungeon_info,   [{ram_copies, [Node]}, {attributes, record_info(fields, rec_pet_dungeon_info)}]},		%%宠物远征副本信息		
		{rec_player_clock,       [{ram_copies, [Node]}, {attributes, record_info(fields, rec_player_clock)}]},			%%角色计时器
		{rec_player_team,        [{ram_copies, [Node]}, {attributes, record_info(fields, rec_player_team)}]},			%%玩家队伍信息
		{rec_role_fashions,      [{ram_copies, [Node]}, {attributes, record_info(fields, rec_role_fashions)}]},			%%角色已经获得的时装
		{rec_skill,              [{ram_copies, [Node]}, {attributes, record_info(fields, rec_skill)}]},					%%技能
		{rec_skill_slot,         [{ram_copies, [Node]}, {attributes, record_info(fields, rec_skill_slot)}]},			%%技能槽上的技能
		{rec_talent,             [{ram_copies, [Node]}, {attributes, record_info(fields, rec_talent)}]},				%%天赋信息
		{rec_warrior_trial,      [{ram_copies, [Node]}, {attributes, record_info(fields, rec_warrior_trial)}]},			%%勇者试练
%%		{rec_task_accepted,      [{ram_copies, [Node]}, {attributes, record_info(fields, rec_task_accepted)}]},			%%接受的任务
%%		{rec_task_submitted,     [{ram_copies, [Node]}, {attributes, record_info(fields, rec_task_submitted)}]},		%%已经提交的任务
		{rec_title,              [{ram_copies, [Node]}, {attributes, record_info(fields, rec_title)}]},					%%称号
		{rec_variant0,           [{ram_copies, [Node]}, {attributes, record_info(fields, rec_variant0)}]},				%%变量
		{recSaveRechargeRebateTaken,[{ram_copies, [Node]}, {attributes, record_info(fields, recSaveRechargeRebateTaken)},{type,bag}]},%%充值活动记录
		{rec_recharge_double_conf,[{ram_copies, [Node]}, {attributes, record_info(fields, rec_recharge_double_conf)}]},%%充值双倍配置
		{rec_clean_role_cache,   [{ram_copies, [Node]}, {attributes, record_info(fields, rec_clean_role_cache)}]},%%玩家要重置缓存
		{rec_guard_mirror,   	 [{ram_copies, [Node]}, {attributes, record_info(fields, rec_guard_mirror)}]},%%王者守护缓存
		{rec_guard_mirror_rank,  [{ram_copies, [Node]}, {attributes, record_info(fields, rec_guard_mirror_rank)}]},%%王者守护天数排行榜
		{rec_player_ms_shop,     [{ram_copies, [Node]}, {attributes, record_info(fields, rec_player_ms_shop)}]},			%%神秘商店
		{rec_ext_role,           [{ram_copies, [Node]}, {attributes, record_info(fields, rec_ext_role)}]},                %%玩家扩展信息
		{rec_sourceshop_forever_limit,         [{ram_copies, [Node]}, {attributes, record_info(fields, rec_sourceshop_forever_limit)}]},%%资源兑换标记
		{rec_operate_exchange_data,[{ram_copies, [Node]}, {attributes, record_info(fields, rec_operate_exchange_data)}]},  %%玩家的运营兑换活动信息
		{recSaveRechargeRebate,  [{ram_copies, [Node]}, {attributes, record_info(fields, recSaveRechargeRebate)}]}, %%充值活动配置
		{rec_god_weapon,         [{ram_copies, [Node]}, {attributes, record_info(fields, rec_god_weapon)}]},                %%神器系统
		{rec_player_liveness,	[{ram_copies, [Node]}, {attributes, record_info(fields, rec_player_liveness)}] },
		{rec_holiday_task,	[{ram_copies, [Node]}, {attributes, record_info(fields, rec_holiday_task)}] },
		{rec_player_drop,	[{ram_copies, [Node]}, {attributes, record_info(fields, rec_player_drop)}] }%%玩家掉落
	],

	?LOG_OUT("create edb table..."),
	Fun = fun({Table,AttribList}) ->
		edb:createTable(Table,AttribList),
		NewTab = getNewTableName(Table),
		edb:createTable(NewTab,[{record_name,Table} | AttribList]),
		UpdateTab = getUpdateTableName(Table),
		edb:createTable(UpdateTab,[{record_name,Table} | AttribList])
		  end,
	lists:foreach(Fun,TableList),
	?LOG_OUT("create edb table ok"),

	?LOG_OUT("cleanDataBase..."),
%%	cleanDataBase(),
	?LOG_OUT("cleanDataBase ok"),

%%	?LOG_OUT("initRoleList..."),
%%	initRoleList(),
%%	?LOG_OUT("initRoleList ok"),

	?LOG_OUT("databankInit init..."),
	%% 非玩家个人数据初始化
	databankInit:initBank(),
	?LOG_OUT("databankInit init ok"),

	%% 数据初始化
%%	?LOG_OUT("preLoadRoleData..."),
%%	dbRoleDataCache:preLoadRoleData(),
%%	?LOG_OUT("preLoadRoleData ok"),

	?LOG_OUT("dbMemCacheInit..."),
	dbMemCacheInit:init(),
	?LOG_OUT("dbMemCacheInit ok"),

	?LOG_OUT("createBakTableOnSvrStart..."),
	dbGSRubbishCleaner:createBakTableOnSvrStart(),
	?LOG_OUT("createBakTableOnSvrStart ok"),

	LocalTables = mnesia:system_info(local_tables),
	mnesia:wait_for_tables(LocalTables, infinity),
	ok.

getNewTableName(Table) ->
	List = erlang:atom_to_list(Table),
	erlang:list_to_atom("new_" ++ List).

getUpdateTableName(Table) ->
	List = erlang:atom_to_list(Table),
	erlang:list_to_atom("update_" ++ List).

%cleanDataBase() ->
%	SQL = "call cleanItem()",
%	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
%	case Ret of
%		#ok_packet{affected_rows = AR} ->
%			?LOG_OUT("cleanDataBase affected_rows:~p",[AR]);
%		_ ->
%			?ERROR_OUT("cleanDataBase Ret:~p",[Ret])
%	end,
%	ok.

%%initRoleList() ->
%%	edb:createTable(recRoleList, [{ram_copies, [node()]}, {attributes, record_info(fields, recRoleList)}]),
%%	SQL = "SELECT accountID FROM account WHERE lastloginTime > DATE_SUB(NOW(),INTERVAL 3 DAY)",
%%	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
%%	{R,_} = mysql:nextResult(Ret),
%%	List = emysql:as_proplist(R),
%%	Len = erlang:length(List),
%%	Fun = fun([{_,AID}],N) ->
%%		{_UnlockNewRace,_GMLevel,RoleList} = dbGSLoad:getRoleList(AID),
%%		edb:writeRecord(#recRoleList{accountID = AID,roleListInfo = RoleList}),
%%		?WARN_OUT("initRoleList:~p/~p = ~p%",[N,Len,N * 100 div Len]),
%%		N + 1
%%	      end,
%%	lists:foldl(Fun, 1, List).

syncToDB() ->
	case core:isCross() of
		true ->
%%			?WARN_OUT("cross server skip save data to database!!"),
			skip;
		_ ->
			syncInsert(),
			syncUpdate()
	end,


	%% 同步非玩家数据至数据库
	databankInit:syncToDB(),

	%% 恢复错误数据用
%% 	checkSqlAndRAM(),

	%% 告诉DB进程，我完成了一次数据存储
	dbSendMsg:sendMsg2DBPID(server_monitor_msg, {self(), 0, {?ServerMonitor_Save, 0}}),

	%% 告诉日志，保存
	psMgr:sendMsg2PS(?LogDBPID, tick_saveCacheLog, 0),
	ok.

syncInsert() ->
	List = [
		fun syncInsertPlayerCoin/0,
		fun syncInsertItem/0,
%%		fun syncInsertEquipBaseInfo/0,
%%		fun syncInsertEquipEnhanceInfo/0,
%%		fun syncInsertEquipExtInfo/0,
		fun syncInsertAchieve/0,
		fun syncInsertAwakenInfo/0,
		fun syncInsertBadge/0,
		fun syncInsertDailyCounter/0,
		fun syncInsertRefineInfo/0,
		fun syncInsertFashion/0,
		fun syncInsertFashionSlot/0,
		fun syncInsertItemUsedCD/0,
		fun syncInsertPackageInfo/0,
		fun syncInsertPetInfo/0,
		fun syncInsertPetEquip/0,
		fun syncInsertPetSkill/0,
		fun syncInsertPetManorBattle/0,
		fun syncInsertPetDunScore/0,
		fun syncInsertPetDunInfo/0,
		fun syncInsertPlayerClock/0,
		fun syncInsertSkill/0,
		fun syncInsertSkillSlot/0,
		fun syncInsertTitle/0,
		fun syncInsertVariant/0,
		fun syncInsertMSShop/0,
		fun synCInsertGuardMirror/0,
		fun syncInsertCommonActive/0,
		fun syncInsertTalent/0,
		fun syncInsertExtrole/0,
		fun syncInsertWarriorTrial/0,
		fun syncInsertGodWeapon/0,
		fun synCInsertGuardMirrorRank/0,
		fun synCInsertSourceShop/0,
		fun syncInsertOperateExchange/0,
%		fun syncInsertPlayerTeam/0,
		fun syncInsertPlayerLiveness/0,
		fun syncInsertPlayerHolidayTask/0,
		fun syncInsertPlayerDrop/0
	],
	lists:foreach(fun doSyncFun/1,List),
	ok.

syncUpdate() ->
	List = [
		fun syncUpdatePlayerCoin/0,
		fun syncUpdateItem/0,
%%		fun syncUpdateEquipBaseInfo/0,
%%		fun syncUpdateEquipEnhanceInfo/0,
%%		fun syncUpdateEquipExtInfo/0,
		fun syncUpdateAchieve/0,
		fun syncUpdateAwakenInfo/0,
		fun syncUpdateBadge/0,
		fun syncUpdateDailyCounter/0,
		fun syncUpdateRefineInfo/0,
		fun syncUpdateFashion/0,
		fun syncUpdateFashionSlot/0,
		fun syncUpdateItemUsedCD/0,
		fun syncUpdatePackageInfo/0,
		fun syncUpdatePetInfo/0,
		fun syncUpdatePetEquip/0,
		fun syncUpdatePetSkill/0,
		fun syncUpdatePetManorBattle/0,
		fun syncUpdatePetDunScore/0,
		fun syncUpdatePetDunInfo/0,
		fun syncUpdatePlayerClock/0,
		fun syncUpdateSkill/0,
		fun syncUpdateSkillSlot/0,
		fun syncUpdateVariant/0,
		fun syncUpdateMSShop/0,
		fun syncUpdateGuardMirror/0,
		fun syncUpdateCommonActive/0,
		fun syncUpdateTalent/0,
		fun syncUpdateExtrole/0,
		fun syncUpdateWarriorTrial/0,
		fun syncUpdateGodWeapon/0,
		fun syncUpdateGuardMirrorRank/0,
		fun synCUpdateSourceShop/0,
		fun syncUpdateOperateExchange/0,
%		fun syncUpdatePlayerTeam/0,
		fun syncUpdateLiveness/0,
		fun syncUpdateHolidayTask/0,
		fun syncUpdatePlayerDrop/0
	],
	lists:foreach(fun doSyncFun/1,List),
	ok.

doSyncFun(Fun) ->
	try
		Fun()
	catch
		_:Why ->
			?ERROR_OUT("Error SyncToDB:~p Stack:~p",[Why,erlang:get_stacktrace()])
	end.

syncInsertPlayerCoin() ->
	List = edb:selectTableAndClearTable(new_rec_player_coin),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_player_coin{
					roleID = {RoleID, CoinType},
					coinType = CoinType,
					coinNumber = Value
				},AccIn) ->
					io_lib:format(",(~p,~p,~p)",[RoleID,CoinType,Value]) ++ AccIn
				end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert player_coin(roleID,coinType,coinNumber) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert player_coin",Ret,SQL)
	end,
	ok.

syncUpdatePlayerCoin() ->
	List = edb:selectTableAndClearTable(update_rec_player_coin),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_player_coin{
					roleID = {RoleID,CoinType},
					coinType = CoinType,
					coinNumber = Value
				}) ->
					SQL = io_lib:format("update player_coin set coinNumber=~p where roleID=~p and coinType=~p",[Value,RoleID,CoinType]),
					Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
					logResult("update player_coin",Ret,SQL)
				end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertItem() ->
	List = edb:selectTableAndClearTable(new_rec_item),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_item{
				itemUID = UID,					%%道具UID bigint(20) unsigned
				roleID = RoleID,				%%角色ID bigint(20) unsigned
				itemID = ID,					%%道具ID smallint(6)
				pos = Pos,						%%背包类型 smallint(6)
				pileNum = Num,					%%堆叠数量 smallint(6)
				recastCount = Count,			%%重铸次数 smallint(6)
				isBind = IsBind,				%%是否绑定 tinyint(1) unsigned
				isLocked = IsLocked,			%%玩家是否自己锁定 tinyint(1) unsigned
				quality = Quality,				%%品质 tinyint(4) unsigned
				deleteTime = DeleteTime,		%%删除时间 datetime
				createTime = CreateTime,        %%创建时间
				expiredTime = ExpiredTime       %%过期时间
			},{AccIn,UIDList1}) ->
				{io_lib:format(",(~p,~p,~p,~p,~p,~p,~p,~p,~p,'~ts',~p,~p)",
					[UID,RoleID,ID,Pos,Num,Count,IsBind,IsLocked,Quality,convert2MysqlDateTimeStr(DeleteTime),CreateTime,ExpiredTime])
					++ AccIn,
					[UID | UIDList1]}
				  end,
			{[_|T],UIDList} = lists:foldl(Fun,{[],[]},List),
			SQL = io_lib:format("insert item(itemUID,roleID,itemID,pos,pileNum,recastCount,isBind,isLocked,quality,deleteTime,createTime,expiredTime) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			dealMysqlRetError(List,Ret,SQL),
			Desc = io_lib:format("insert item:~p",[UIDList]),
			logResult(Desc,Ret,SQL)
	end,
	ok.

syncUpdateItem() ->
	List = edb:selectTableAndClearTable(update_rec_item),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_item{} = Rec ) ->
				dbItemSave:save_item_data(update, Rec)
				  end,
			lists:foreach(Fun,List)
	end,
	ok.
%%
%%syncInsertEquipBaseInfo() ->
%%	List = edb:selectTableAndClearTable(new_rec_equip_base_info),
%%	case List of
%%		[] ->
%%			skip;
%%		_ ->
%%			Fun = fun(#rec_equip_base_info{
%%				equipUID = UID,					%%装备UID bigint(20) unsigned
%%				propKey1 = K1,					%%属性标识主键1 tinyint(4) unsigned
%%				propValue1 = V1,				%%装备附加属性值1 double
%%				propKey2 = K2,					%% tinyint(4) unsigned
%%				propValue2 = V2,				%% double
%%				propKey3 = K3,					%% tinyint(4) unsigned
%%				propValue3 = V3,				%% double
%%				propKey4 = K4,					%% tinyint(4) unsigned
%%				propValue4 = V4,				%% double
%%				propKey5 = K5,					%% tinyint(4) unsigned
%%				propValue5 = V5,				%% double
%%				skillLevel1 = SL1,				%%技能1等级 tinyint(4) unsigned
%%				skillLevel2 = SL2				%%技能2等级 tinyint(4) unsigned
%%			},AccIn) ->
%%				io_lib:format(",(~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p)",
%%					[UID,K1,V1,K2,V2,K3,V3,K4,V4,K5,V5,SL1,SL2])
%%				++ AccIn
%%			end,
%%			[_|T] = lists:foldl(Fun,[],List),
%%			SQL = io_lib:format("insert equip_base_info(equipUID,propKey1,propValue1,propKey2,propValue2,propKey3,propValue3,"
%%			"propKey4,propValue4,propKey5,propValue5,skillLevel1,skillLevel2) values ~ts",[T]),
%%			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
%%			logResult("insert equip_base_info",Ret,SQL)
%%	end,
%%	ok.
%%
%%syncUpdateEquipBaseInfo() ->
%%	List = edb:selectTableAndClearTable(update_rec_equip_base_info),
%%	case List of
%%		[] ->
%%			skip;
%%		_ ->
%%			Fun = fun(#rec_equip_base_info{
%%				equipUID = UID,					%%装备UID bigint(20) unsigned
%%				propKey1 = K1,					%%属性标识主键1 tinyint(4) unsigned
%%				propValue1 = V1,				%%装备附加属性值1 double
%%				propKey2 = K2,					%% tinyint(4) unsigned
%%				propValue2 = V2,				%% double
%%				propKey3 = K3,					%% tinyint(4) unsigned
%%				propValue3 = V3,				%% double
%%				propKey4 = K4,					%% tinyint(4) unsigned
%%				propValue4 = V4,				%% double
%%				propKey5 = K5,					%% tinyint(4) unsigned
%%				propValue5 = V5,				%% double
%%				skillLevel1 = SL1,				%%技能1等级 tinyint(4) unsigned
%%				skillLevel2 = SL2				%%技能2等级 tinyint(4) unsigned
%%			}) ->
%%				SQL = io_lib:format("update equip_base_info set propKey1=~p,propValue1=~p,propKey2=~p,propValue2=~p,propKey3=~p,propValue3=~p,"
%%				"propKey4=~p,propValue4=~p,propKey5=~p,propValue5=~p,skillLevel1=~p,skillLevel2=~p where equipUID=~p",
%%					[K1,V1,K2,V2,K3,V3,K4,V4,K5,V5,SL1,SL2,UID]),
%%				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
%%				logResult("Update equip_base_info",Ret,SQL)
%%			end,
%%			lists:foreach(Fun,List)
%%	end,
%%	ok.
%%
%%syncInsertEquipEnhanceInfo() ->
%%	List = edb:selectTableAndClearTable(new_rec_equip_enhance_info),
%%	case List of
%%		[] ->
%%			skip;
%%		_ ->
%%			Fun = fun(#rec_equip_enhance_info{
%%				equipUID = UID,					%%装备UID bigint(20) unsigned
%%				propKey1 = K1,					%%属性标识主键1 tinyint(4) unsigned
%%				propValue1 = V1,				%%装备附加属性值1 double
%%				propKey2 = K2,					%% tinyint(4) unsigned
%%				propValue2 = V2,				%% double
%%				propKey3 = K3,					%% tinyint(4) unsigned
%%				propValue3 = V3,				%% double
%%				propKey4 = K4,					%% tinyint(4) unsigned
%%				propValue4 = V4,				%% double
%%				propKey5 = K5,					%% tinyint(4) unsigned
%%				propValue5 = V5					%% double
%%			},AccIn) ->
%%				io_lib:format(",(~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p)",
%%					[UID,K1,V1,K2,V2,K3,V3,K4,V4,K5,V5]) ++ AccIn
%%			end,
%%			[_|T] = lists:foldl(Fun,[],List),
%%			SQL = io_lib:format("insert equip_enhance_info(equipUID,propKey1,propValue1,propKey2,propValue2,propKey3,propValue3,"
%%			"propKey4,propValue4,propKey5,propValue5) values ~ts",[T]),
%%			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
%%			logResult("insert equip_enhance_info",Ret,SQL)
%%	end,
%%	ok.
%%
%%syncUpdateEquipEnhanceInfo() ->
%%	List = edb:selectTableAndClearTable(update_rec_equip_enhance_info),
%%	case List of
%%		[] ->
%%			skip;
%%		_ ->
%%			Fun = fun(#rec_equip_enhance_info{
%%				equipUID = UID,					%%装备UID bigint(20) unsigned
%%				propKey1 = K1,					%%属性标识主键1 tinyint(4) unsigned
%%				propValue1 = V1,				%%装备附加属性值1 double
%%				propKey2 = K2,					%% tinyint(4) unsigned
%%				propValue2 = V2,				%% double
%%				propKey3 = K3,					%% tinyint(4) unsigned
%%				propValue3 = V3,				%% double
%%				propKey4 = K4,					%% tinyint(4) unsigned
%%				propValue4 = V4,				%% double
%%				propKey5 = K5,					%% tinyint(4) unsigned
%%				propValue5 = V5					%% double
%%			}) ->
%%				SQL = io_lib:format("update equip_enhance_info set propKey1=~p,propValue1=~p,propKey2=~p,propValue2=~p,propKey3=~p,propValue3=~p,"
%%				"propKey4=~p,propValue4=~p,propKey5=~p,propValue5=~p where equipUID=~p",
%%					[K1,V1,K2,V2,K3,V3,K4,V4,K5,V5,UID]),
%%				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
%%				logResult("Update equip_enhance_info",Ret,SQL)
%%			end,
%%			lists:foreach(Fun,List)
%%	end,
%%	ok.
%%
%%syncInsertEquipExtInfo() ->
%%	List = edb:selectTableAndClearTable(new_rec_equip_ext_info),
%%	case List of
%%		[] ->
%%			skip;
%%		_ ->
%%			Fun = fun(#rec_equip_ext_info{
%%				equipUID = UID,					%%装备UID bigint(20) unsigned
%%				propKey1 = K1,					%%属性标识主键1 tinyint(4) unsigned
%%				propValue1 = V1,				%%装备附加属性值1 double
%%				propRecast1 = R1,				%% tinyint(4) unsigned
%%				propAffixe1 = A1,				%% smallint(5) unsigned
%%				calcType1 = T1,					%%属性计算方式 0：加法 1：乘法 tinyint(4) unsigned
%%				propKey2 = K2,					%% tinyint(4) unsigned
%%				propValue2 = V2,				%% double
%%				propRecast2 = R2,				%% tinyint(4) unsigned
%%				propAffixe2 = A2,				%% smallint(5) unsigned
%%				calcType2 = T2,					%% tinyint(4) unsigned
%%				propKey3 = K3,					%% tinyint(4) unsigned
%%				propValue3 = V3,				%% double
%%				propRecast3 = R3,				%% tinyint(4) unsigned
%%				propAffixe3 = A3,				%% smallint(5) unsigned
%%				calcType3 = T3,					%% tinyint(4) unsigned
%%				propKey4 = K4,					%% tinyint(4) unsigned
%%				propValue4 = V4,				%% double
%%				propRecast4 = R4,				%% tinyint(4) unsigned
%%				propAffixe4 = A4,				%% smallint(5) unsigned
%%				calcType4 = T4,					%% tinyint(4) unsigned
%%				propKey5 = K5,					%% tinyint(4) unsigned
%%				propValue5 = V5,				%% double
%%				propRecast5 = R5,				%% tinyint(4) unsigned
%%				propAffixe5 = A5,				%% smallint(5) unsigned
%%				calcType5 = T5,					%% tinyint(4) unsigned
%%				propKey6 = K6,					%% tinyint(4) unsigned
%%				propValue6 = V6,				%% double
%%				propRecast6 = R6,				%% tinyint(4) unsigned
%%				propAffixe6 = A6,				%% smallint(5) unsigned
%%				calcType6 = T6					%% tinyint(4) unsigned
%%			},AccIn) ->
%%				io_lib:format(",(~p,"
%%				"~p,~p,~p,~p,~p,"
%%				"~p,~p,~p,~p,~p,"
%%				"~p,~p,~p,~p,~p,"
%%				"~p,~p,~p,~p,~p,"
%%				"~p,~p,~p,~p,~p,"
%%				"~p,~p,~p,~p,~p)",
%%					[UID,
%%						K1,V1,R1,A1,T1,
%%						K2,V2,R2,A2,T2,
%%						K3,V3,R3,A3,T3,
%%						K4,V4,R4,A4,T4,
%%						K5,V5,R5,A5,T5,
%%						K6,V6,R6,A6,T6]
%%				) ++ AccIn
%%			end,
%%			[_|T] = lists:foldl(Fun,[],List),
%%			SQL = io_lib:format("insert equip_ext_info(equipUID,"
%%			"propKey1,propValue1,propRecast1,propAffixe1,calcType1,"
%%			"propKey2,propValue2,propRecast2,propAffixe2,calcType2,"
%%			"propKey3,propValue3,propRecast3,propAffixe3,calcType3,"
%%			"propKey4,propValue4,propRecast4,propAffixe4,calcType4,"
%%			"propKey5,propValue5,propRecast5,propAffixe5,calcType5,"
%%			"propKey6,propValue6,propRecast6,propAffixe6,calcType6)"
%%			" values ~ts",
%%				[T]),
%%			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
%%			logResult("insert equip_ext_info",Ret,SQL)
%%	end,
%%	ok.
%%
%%syncUpdateEquipExtInfo() ->
%%	List = edb:selectTableAndClearTable(update_rec_equip_ext_info),
%%	case List of
%%		[] ->
%%			skip;
%%		_ ->
%%			Fun = fun(#rec_equip_ext_info{
%%				equipUID = UID,					%%装备UID bigint(20) unsigned
%%				propKey1 = K1,					%%属性标识主键1 tinyint(4) unsigned
%%				propValue1 = V1,				%%装备附加属性值1 double
%%				propRecast1 = R1,				%% tinyint(4) unsigned
%%				propAffixe1 = A1,				%% smallint(5) unsigned
%%				calcType1 = T1,					%%属性计算方式 0：加法 1：乘法 tinyint(4) unsigned
%%				propKey2 = K2,					%% tinyint(4) unsigned
%%				propValue2 = V2,				%% double
%%				propRecast2 = R2,				%% tinyint(4) unsigned
%%				propAffixe2 = A2,				%% smallint(5) unsigned
%%				calcType2 = T2,					%% tinyint(4) unsigned
%%				propKey3 = K3,					%% tinyint(4) unsigned
%%				propValue3 = V3,				%% double
%%				propRecast3 = R3,				%% tinyint(4) unsigned
%%				propAffixe3 = A3,				%% smallint(5) unsigned
%%				calcType3 = T3,					%% tinyint(4) unsigned
%%				propKey4 = K4,					%% tinyint(4) unsigned
%%				propValue4 = V4,				%% double
%%				propRecast4 = R4,				%% tinyint(4) unsigned
%%				propAffixe4 = A4,				%% smallint(5) unsigned
%%				calcType4 = T4,					%% tinyint(4) unsigned
%%				propKey5 = K5,					%% tinyint(4) unsigned
%%				propValue5 = V5,				%% double
%%				propRecast5 = R5,				%% tinyint(4) unsigned
%%				propAffixe5 = A5,				%% smallint(5) unsigned
%%				calcType5 = T5,					%% tinyint(4) unsigned
%%				propKey6 = K6,					%% tinyint(4) unsigned
%%				propValue6 = V6,				%% double
%%				propRecast6 = R6,				%% tinyint(4) unsigned
%%				propAffixe6 = A6,				%% smallint(5) unsigned
%%				calcType6 = T6					%% tinyint(4) unsigned
%%			}) ->
%%				SQL = io_lib:format("update equip_ext_info set propKey1=~p,propValue1=~p,propRecast1=~p,propAffixe1=~p,calcType1=~p,"
%%				"propKey2=~p,propValue2=~p,propRecast2=~p,propAffixe2=~p,calcType2=~p,"
%%				"propKey3=~p,propValue3=~p,propRecast3=~p,propAffixe3=~p,calcType3=~p,"
%%				"propKey4=~p,propValue4=~p,propRecast4=~p,propAffixe4=~p,calcType4=~p,"
%%				"propKey5=~p,propValue5=~p,propRecast5=~p,propAffixe5=~p,calcType5=~p,"
%%				"propKey6=~p,propValue6=~p,propRecast6=~p,propAffixe6=~p,calcType6=~p "
%%				" where equipUID=~p",
%%					[K1,V1,R1,A1,T1,
%%						K2,V2,R2,A2,T2,
%%						K3,V3,R3,A3,T3,
%%						K4,V4,R4,A4,T4,
%%						K5,V5,R5,A5,T5,
%%						K6,V6,R6,A6,T6,
%%						UID]),
%%				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
%%				logResult("Update equip_ext_info",Ret,SQL)
%%			end,
%%			lists:foreach(Fun,List)
%%	end,
%%	ok.

syncInsertAchieve() ->
	List = edb:selectTableAndClearTable(new_rec_achieve),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_achieve{
				roleID = {RoleID,AID},				%%角色ID bigint(20) unsigned
				achieveID = AID,					%%成就ID smallint(6) unsigned
				achieveSID = SID,					%%成就进度ID tinyint(4) unsigned
				achieveLevel = LV,					%%成就领取等级 tinyint(4) unsigned
				achieveSnum = N						%%成就进度数量 int(11) unsigned
			},AccIn) ->
				io_lib:format(",(~p,~p,~p,~p,~p)",[RoleID,AID,SID,LV,N]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert achieve(roleID,achieveID,achieveSID,achieveLevel,achieveSnum) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert achieve",Ret,SQL)
	end,
	ok.

syncUpdateAchieve() ->
	List = edb:selectTableAndClearTable(update_rec_achieve),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_achieve{
				roleID = {RoleID,AID},				%%角色ID bigint(20) unsigned
				achieveID = AID,					%%成就ID smallint(6) unsigned
				achieveSID = SID,					%%成就进度ID tinyint(4) unsigned
				achieveLevel = LV,					%%成就领取等级 tinyint(4) unsigned
				achieveSnum = N						%%成就进度数量 int(11) unsigned
			}) ->
				SQL = io_lib:format("update achieve set achieveSID=~p,achieveLevel=~p,achieveSnum=~p where roleID=~p and achieveID=~p",[SID,LV,N,RoleID,AID]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update achieve",Ret,SQL)
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertAwakenInfo() ->
	List = edb:selectTableAndClearTable(new_rec_awaken_info),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_awaken_info{
				roleID = {RoleID,CardID},		%%玩家角色唯一ID bigint(20) unsigned
				level = Level,					%%觉醒等级 smallint(6)
				itemNum = ItemNum,				%%当前等级吃了多少个道具(最大不会超过65535) smallint(6)
				cardID = CardID,				%% smallint(6)
				progress = Progress,
				stateMax = StateMax,
				curState = CurState
			},AccIn) ->
				io_lib:format(",(~p,~p,~p,~p,~p,~p,~p)",[RoleID,CardID,Level,ItemNum,Progress, StateMax, CurState]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert awaken_info(roleID,cardID,`level`,itemNum,progress,stateMax,curState) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert awaken_info",Ret,SQL)
	end,
	ok.

syncUpdateAwakenInfo() ->
	List = edb:selectTableAndClearTable(update_rec_awaken_info),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_awaken_info{
				roleID = {RoleID,CardID},		%%玩家角色唯一ID bigint(20) unsigned
				level = Level,					%%觉醒等级 smallint(6)
				itemNum = ItemNum,				%%当前等级吃了多少个道具(最大不会超过65535) smallint(6)
				cardID = CardID,					%% smallint(6)
				progress = Progress,
				stateMax = StateMax,
				curState = CurState
			}) ->
				SQL = io_lib:format("update awaken_info set `level`=~p,itemNum=~p,progress=~p,stateMax=~p,curState=~p where roleID=~p and cardID=~p",
					[Level,ItemNum,Progress, StateMax, CurState,RoleID,CardID]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update awaken_info",Ret,SQL)
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertBadge() ->
	List = edb:selectTableAndClearTable(new_rec_badge),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_badge{
				roleID = {RoleID,MapID},			%%角色ID bigint(20) unsigned
				mapID = MapID,						%%成就ID smallint(6) unsigned
				items = ItemList
			},AccIn) ->
				io_lib:format(",(~p,~p,'~ts')",[RoleID,MapID,misc:term_to_string(ItemList)]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert badge(roleID,mapID,items) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			dealMysqlRetError(List, Ret, SQL),
			logResult("insert badge",Ret,SQL)
	end,
	ok.

syncUpdateBadge() ->
	List = edb:selectTableAndClearTable(update_rec_badge),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_badge{
				roleID = {RoleID,MapID},			%%角色ID bigint(20) unsigned
				mapID = MapID,						%%成就ID smallint(6) unsigned
				items = ItemList
			}) ->
				SQL = io_lib:format("update badge set items='~ts' where roleID=~p and mapID=~p",[misc:term_to_string(ItemList),RoleID,MapID]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update badge",Ret,SQL)
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertDailyCounter() ->
	List = edb:selectTableAndClearTable(new_rec_daily_counter0),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_daily_counter0{
				roleID = {RoleID,Type},				%%角色ID bigint(20) unsigned
				dailyType = Type,					%%每日计数器类型 bigint(20) unsigned
				lastUpdateTime = Time,				%%最后一次更新时间 bigint(20) unsigned
				counter = Counter					%%每日已经完成的计数器值 mediumint(8) unsigned
			},AccIn) when RoleID >0 ->
				Str = io_lib:format(",(~p,~p,~p,~p)",[RoleID,Type,Time,Counter]),
				N = RoleID rem 10,
				case lists:keyfind(N,1,AccIn) of
					false ->
						[{N,Str} | AccIn];
					{N,L} ->
						lists:keyreplace(N,1,AccIn,{N,Str ++ L})
				end;
				(_,AccIn) ->
					AccIn
				  end,
			ResultList = lists:foldl(Fun,[],List),
			Fun1 = fun({Num,[_|T]}) ->
				SQL = io_lib:format("insert daily_counter~p(roleID,dailyType,lastUpdateTime,counter) values ~ts",[Num,T]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("insert daily_counter",Ret,SQL)
				   end,
			lists:foreach(Fun1,ResultList)
	end,
	ok.

syncUpdateDailyCounter() ->
	List = edb:selectTableAndClearTable(update_rec_daily_counter0),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_daily_counter0{
				roleID = {RoleID,Type},				%%角色ID bigint(20) unsigned
				dailyType = Type,					%%每日计数器类型 bigint(20) unsigned
				lastUpdateTime = Time,				%%最后一次更新时间 bigint(20) unsigned
				counter = Counter					%%每日已经完成的计数器值 mediumint(8) unsigned
			}) when RoleID>0 ->
				N = RoleID rem 10,
				SQL = io_lib:format("update daily_counter~p set lastUpdateTime =~p,counter=~p where roleID=~p and dailyType = ~p",[N,Time,Counter,RoleID,Type]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update daily_counter",Ret,SQL);
				(_) ->
					ok
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertRefineInfo() ->
	List = edb:selectTableAndClearTable(new_rec_equip_refine_info),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_equip_refine_info{
				roleID = {RoleID,Type},				%%角色ID bigint(20) unsigned
				type = Type,						%%精炼部位 tinyint(4) unsigned
				level = Lv,							%%精炼等级 tinyint(4) unsigned
				prog = Prog,
				bless = Bless,
				star = Star
			},AccIn) ->
				io_lib:format(",(~p,~p,~p,~p,~p,~p)",[RoleID,Type,Lv,Prog,Bless,Star]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert equip_refine_info(roleID,type,level,prog,bless,star) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert equip_refine_info",Ret,SQL)
	end,
	ok.

syncUpdateRefineInfo() ->
	List = edb:selectTableAndClearTable(update_rec_equip_refine_info),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_equip_refine_info{
				roleID = {RoleID,Type},				%%角色ID bigint(20) unsigned
				type = Type,						%%精炼部位 tinyint(4) unsigned
				level = Lv,							%%精炼等级 tinyint(4) unsigned
				prog = Prog,
				bless = Bless,
				star = Star
			}) ->
				SQL = io_lib:format("update equip_refine_info set level = ~p, prog = ~p,bless = ~p, star = ~p where roleID=~p and type = ~p",[Lv,Prog,Bless,Star,RoleID,Type]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update equip_refine_info",Ret,SQL)
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertFashion() ->
	List = edb:selectTableAndClearTable(new_rec_role_fashions),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_role_fashions{
				roleID = {RoleID,ID},				%%玩家id bigint(1) unsigned
				fashionID = ID,				%%时装Id int(1) unsigned
				endTime = Time				%%结束时间 int(10) unsigned
			},AccIn) ->
				io_lib:format(",(~p,~p,~p)",[RoleID,ID,Time]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert role_fashions(roleID,fashionID,endTime) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert role_fashions",Ret,SQL)
	end,
	ok.

syncUpdateFashion() ->
	List = edb:selectTableAndClearTable(update_rec_role_fashions),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_role_fashions{
				roleID = {RoleID,ID},				%%玩家id bigint(1) unsigned
				fashionID = ID,				%%时装Id int(1) unsigned
				endTime = Time				%%结束时间 int(10) unsigned
			}) ->
				SQL = io_lib:format("update role_fashions set endTime=~p where roleID=~p and fashionID=~p",[Time,RoleID,ID]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update role_fashions",Ret,SQL)
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertFashionSlot() ->
	List = edb:selectTableAndClearTable(new_rec_fashion_slot),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_fashion_slot{
				roleID = {RoleID,Slot},				%% bigint(10) unsigned
				slot = Slot,				%% tinyint(3) unsigned
				fashionID = ID				%% smallint(5) unsigned
			},AccIn) ->
				io_lib:format(",(~p,~p,~p)",[RoleID,Slot,ID]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert fashion_slot(roleID,slot,fashionID) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert fashion_slot",Ret,SQL)
	end,
	ok.

syncUpdateFashionSlot() ->
	List = edb:selectTableAndClearTable(update_rec_fashion_slot),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_fashion_slot{
				roleID = {RoleID,Slot},				%% bigint(10) unsigned
				slot = Slot,				%% tinyint(3) unsigned
				fashionID = ID				%% smallint(5) unsigned
			}) ->
				SQL = io_lib:format("update fashion_slot set fashionID=~p where roleID=~p and slot=~p",[ID,RoleID,Slot]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update fashion_slot",Ret,SQL)
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertItemUsedCD() ->
	List = edb:selectTableAndClearTable(new_rec_item_used_cd),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_item_used_cd{
				roleID = {RoleID,GID},				%%角色ID bigint(20) unsigned
				itemGroupID = GID,				%%道具组ID smallint(6)
				lastUsedTime = Time				%%上次使用时间，以2010年1月1日为准的时间，单位：毫秒 bigint(20) unsigned
			},AccIn) ->
				io_lib:format(",(~p,~p,~p)",[RoleID,GID,Time]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert item_used_cd(roleID,itemGroupID,lastUsedTime) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert item_used_cd",Ret,SQL)
	end,
	ok.

syncUpdateItemUsedCD() ->
	List = edb:selectTableAndClearTable(update_rec_item_used_cd),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_item_used_cd{
				roleID = {RoleID,GID},				%%角色ID bigint(20) unsigned
				itemGroupID = GID,				%%道具组ID smallint(6)
				lastUsedTime = Time				%%上次使用时间，以2010年1月1日为准的时间，单位：毫秒 bigint(20) unsigned
			}) ->
				SQL = io_lib:format("update item_used_cd set lastUsedTime=~p where roleID=~p and itemGroupID=~p",[Time,RoleID,GID]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("insert item_used_cd",Ret,SQL)
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertPackageInfo() ->
	List = edb:selectTableAndClearTable(new_rec_package_info),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_package_info{
				roleID = {RoleID,Type},				%%角色ID bigint(20) unsigned
				bagType = Type,				%%背包类型 tinyint(3) unsigned
				maxSlot = Slot				%%背包已经开启的格子数 smallint(5) unsigned
			},AccIn) ->
				io_lib:format(",(~p,~p,~p)",[RoleID,Type,Slot]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert package_info(roleID,bagType,maxSlot) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert package_info",Ret,SQL)
	end,
	ok.

syncUpdatePackageInfo() ->
	List = edb:selectTableAndClearTable(update_rec_package_info),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_package_info{
				roleID = {RoleID,Type},				%%角色ID bigint(20) unsigned
				bagType = Type,				%%背包类型 tinyint(3) unsigned
				maxSlot = Slot				%%背包已经开启的格子数 smallint(5) unsigned
			}) ->
				SQL = io_lib:format("update package_info set maxSlot=~p where roleID=~p and bagType=~p",[Slot,RoleID,Type]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("insert package_info",Ret,SQL)
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertPetInfo() ->
	List = edb:selectTableAndClearTable(new_rec_pet_info),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_pet_info{
					roleID = {RoleID,PetID},	%%玩家角色ID bigint(20) unsigned
					petID = PetID,				%%宠物id smallint(5) unsigned
					star = Star,				%%宠物星级 tinyint(4) unsigned
					status = Status,			%%0:休息 1:出战 tinyint(4) unsigned
					name = Name,				%%宠物名字 varchar(20)
					force = Force,				%%宠物战力 bigint(20)
					attas = Attas,				%%宠物提升属性列表
					raw = Raw,					%%宠物转生tinyint(4) unsigned
					time = Time,
					upCount = UpCount,
					petLv = PetLevel,
					exp = Exp
				},AccIn) ->
					io_lib:format(",(~p,~p,~p,~p,'~s',~p,~p,'~s',~p,~p,~p,~p)",
						[RoleID,PetID,Star,Status,Name,Force,Raw,misc:term_to_string(Attas), Time, UpCount, PetLevel, Exp]) ++ AccIn
				end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert pet_info(roleID,petID,star,`status`,name,`force`,raw,attas,`time`, upCount, petLv,exp) values ~s",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert pet_info",Ret,SQL)
	end,
	ok.

syncUpdatePetInfo() ->
	List = edb:selectTableAndClearTable(update_rec_pet_info),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_pet_info{
					roleID = {RoleID,PetID},	%%玩家角色ID bigint(20) unsigned
					petID = PetID1,				%%宠物id smallint(5) unsigned
					star = Star,				%%宠物星级 tinyint(4) unsigned
					status = Status,			%%0:休息 1:出战 tinyint(4) unsigned
					name = Name,				%%宠物名字 varchar(20)
					force = Force,				%%宠物战力 bigint(20)
					attas = Attas,				%%宠物提升属性列表
					raw = Raw,					%%宠物转生 tinyint(4) unsigned
					time = Time,
					upCount = UpCount,
					petLv = PetLevel,
					exp = Exp
				}) ->
					SQL =
						case PetID =:= PetID1 of
							true ->
								io_lib:format(
									"update pet_info set star=~p,`status`=~p,name='~s',`force`=~p, attas=~p,raw=~p, time = ~p, upCount = ~p, petLv = ~p, exp = ~p where roleID=~p and petID=~p",
									[Star,Status,Name,Force,misc:term_to_string(Attas),Raw,Time, UpCount, PetLevel, Exp, RoleID, PetID]);
							_ ->
								io_lib:format("DELETE FROM pet_info WHERE roleID = ~p AND petID = ~p;", [RoleID, PetID])
						end,
					Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
					logResult("update pet_info",Ret,SQL)
				end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertPetEquip() ->
	List = edb:selectTableAndClearTable(new_rec_pet_equip),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_pet_equip{
				roleID = {RoleID,Pos},		%%角色ID bigint(20) unsigned
				equipPos = Pos,				%%装备位置 tinyint(4) unsigned
				equipID = ID,				%%装备ID tinyint(4) unsigned
				equipLv = LV				%%装备等级 tinyint(4) unsigned
			},AccIn) ->
				io_lib:format(",(~p,~p,~p,~p)",[RoleID,Pos,ID,LV]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert pet_equip(roleID,equipPos,equipID,equipLv) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert pet_equip",Ret,SQL)
	end,
	ok.

syncUpdatePetEquip() ->
	List = edb:selectTableAndClearTable(update_rec_pet_equip),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_pet_equip{
				roleID = {RoleID,Pos},				%%角色ID bigint(20) unsigned
				equipPos = Pos,				%%装备位置 tinyint(4) unsigned
				equipID = ID,				%%装备ID tinyint(4) unsigned
				equipLv = LV				%%装备等级 tinyint(4) unsigned
			}) ->
				SQL = io_lib:format("update pet_equip set equipID=~p,equipLv=~p where roleID=~p and equipPos=~p",[ID,LV,RoleID,Pos]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update pet_equip",Ret,SQL)
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertPetSkill() ->
	List = edb:selectTableAndClearTable(new_rec_pet_skill),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_pet_skill{
				roleID = {RoleID,PetID,Index},				%%角色ID bigint(20) unsigned
				petID = PetID,				%%宠物ID smallint(5) unsigned
				skillID = SkillID,				%%技能ID smallint(6) unsigned
				index = Index,				%%技能索引 tinyint(4) unsigned
				level = LV,				%%等级 tinyint(4) unsigned
				unlock = IsUnlock,				%%0:未解锁 1:解锁 tinyint(4) unsigned
				type = Type,				%%技能type 0:天赋 1:通用 2:基础 tinyint(4) unsigned
				cd = CD				%%宠物技能CD bigint(20)
			},AccIn) ->
				io_lib:format(",(~p,~p,~p,~p,~p,~p,~p,~p)",[RoleID,PetID,SkillID,Index,LV,IsUnlock,Type,CD]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert pet_skill(roleID,petID,skillID,`index`,`level`,`unlock`,`type`,cd) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert pet_skill",Ret,SQL)
	end,
	ok.

syncUpdatePetSkill() ->
	List = edb:selectTableAndClearTable(update_rec_pet_skill),
	case List of
		[] ->
			skip;
		_ ->
			Fun =
				fun(#rec_pet_skill{
					roleID = {RoleID,PetID,Index},				%%角色ID bigint(20) unsigned
					petID = PetID,				%%宠物ID smallint(5) unsigned
					skillID = SkillID,				%%技能ID smallint(6) unsigned
					index = Index1,				%%技能索引 tinyint(4) unsigned
					level = LV,				%%等级 tinyint(4) unsigned
					unlock = IsUnlock,				%%0:未解锁 1:解锁 tinyint(4) unsigned
					type = Type,				%%技能type 0:天赋 1:通用 2:基础 tinyint(4) unsigned
					cd = CD				%%宠物技能CD bigint(20)
				}) ->
					SQL =
						case Index =:= Index1 of
							true ->
								io_lib:format("update pet_skill set skillID=~p,`level`=~p,`unlock`=~p,`type`=~p,cd=~p where roleID=~p and petID=~p and `index`=~p",
									[SkillID,LV,IsUnlock,Type,CD,RoleID,PetID,Index]);
							_ ->
								io_lib:format("DELETE FROM pet_skill WHERE roleID = ~p AND petID = ~p;", [RoleID, PetID])
						end,
					Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
					logResult("update pet_skill",Ret,SQL)
				end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertPetManorBattle() ->
	L = edb:selectTableAndClearTable(new_rec_pet_manor_battle),
	syncInsertPetManorBattle(L).
syncInsertPetManorBattle([]) ->
	ok;
syncInsertPetManorBattle(L) ->
	F = fun(#rec_pet_manor_battle{
		roleID = RoleID,
		pet_reel = PetReel,
		pet_pos = PetPos,
		save_time = SaveTime,
		off_time = OffTime,
		pet_integral = Integral
	},	Acc) ->
		io_lib:format(",(~p,~p,'~ts',~p,~p,~p)",[RoleID,PetReel,misc:term_to_string(PetPos),SaveTime,OffTime,Integral]) ++ Acc
		end,
	[_|T] = lists:foldl(F, [], L),
	SQL = io_lib:format("insert pet_manor_battle(roleID,pet_reel,pet_pos,save_time,off_time,pet_integral) values ~ts",[T]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	logResult("insert pet_manor_battle",Ret,SQL),
	ok.

syncUpdatePetManorBattle() ->
	L = edb:selectTableAndClearTable(update_rec_pet_manor_battle),
	syncUpdatePetManorBattle(L).
syncUpdatePetManorBattle([]) ->
	ok;
syncUpdatePetManorBattle(L) ->
	F = fun(#rec_pet_manor_battle{
		roleID = RoleID,
		pet_reel = PetReel,
		pet_pos = PetPos,
		save_time = SaveTime,
		off_time = OffTime,
		pet_integral = Integral
	}) ->
		SQL = io_lib:format("update pet_manor_battle set pet_reel=~p,pet_pos='~ts',save_time=~p,off_time=~p,pet_integral=~p where roleID=~p",
			[PetReel,misc:term_to_string(PetPos),SaveTime,OffTime,Integral,RoleID]),
		Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
		logResult("update pet_manor_battle",Ret,SQL)
		end,
	lists:foreach(F, L).

syncInsertPetDunScore() ->
	L = edb:selectTableAndClearTable(new_rec_pet_dungeon_score),
	syncInsertPetDunScore(L).
syncInsertPetDunScore([]) ->
	skip;
syncInsertPetDunScore(L) ->
	Fun = fun(#rec_pet_dungeon_score{
		roleID = {RoleID,_DungeonID},
		dungeon_ID = DungeonID,
		dungeon_score = DungeonScore
	}, AccIn) ->
		io_lib:format(",(~p, ~p, ~p)",[RoleID, DungeonID, DungeonScore]) ++ AccIn
		  end,
	[_ | T] = lists:foldl(Fun, [], L),
	SQL = io_lib:format("insert pet_dungeon_score (roleID, dungeon_ID, dungeon_score) values ~ts",[T]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	logResult("insert pet_dungeon_score", Ret, SQL),
	ok.

syncUpdatePetDunScore() ->
	L = edb:selectTableAndClearTable(update_rec_pet_dungeon_score),
	syncUpdatePetDunScore(L).
syncUpdatePetDunScore([]) ->
	skip;
syncUpdatePetDunScore(L) ->
	Fun = fun(#rec_pet_dungeon_score{
		roleID = {RoleID,_DungeonID},
		dungeon_ID = DungeonID,
		dungeon_score = DungeonScore
	}) ->
		SQL = io_lib:format("update pet_dungeon_score set dungeon_score=~p where roleID=~p and dungeon_ID=~p",
			[DungeonScore, RoleID, DungeonID]),
		Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
		logResult("update pet_dungeon_score", Ret, SQL)
		  end,
	lists:foreach(Fun, L).

syncInsertPetDunInfo() ->
	L = edb:selectTableAndClearTable(new_rec_pet_dungeon_info),
	syncInsertPetDunInfo(L).
syncInsertPetDunInfo([]) ->
	skip;
syncInsertPetDunInfo(L) ->
	Fun = fun(#rec_pet_dungeon_info{
		roleID = RoleID,
		dungeon_ID = DungeonID,
		pet_phys = Phys,
		pet_pos = Pos,
		pet_reward = Reward,
		time = Time
	}, AccIn) ->
		io_lib:format(",(~p, ~p, ~p, '~ts', ~p, ~p)",[RoleID, DungeonID, Phys, misc:term_to_string(Pos), Reward, Time]) ++ AccIn
		  end,
	[_ | T] = lists:foldl(Fun, [], L),
	SQL = io_lib:format("insert pet_dungeon_info (roleID, dungeon_ID, pet_phys, pet_pos, pet_reward, time) values ~ts",[T]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	logResult("insert pet_dungeon_info", Ret, SQL),
	ok.

syncUpdatePetDunInfo() ->
	L = edb:selectTableAndClearTable(update_rec_pet_dungeon_info),
	syncUpdatePetDunInfo(L).
syncUpdatePetDunInfo([]) ->
	skip;
syncUpdatePetDunInfo(L) ->
	Fun = fun(#rec_pet_dungeon_info{
		roleID = RoleID,
		dungeon_ID = DungeonID,
		pet_phys = Phys,
		pet_pos = Pos,
		pet_reward = Reward,
		time = Time
	}) ->
		SQL = io_lib:format("update pet_dungeon_info set dungeon_ID = ~p, pet_phys = ~p, pet_pos = '~ts', pet_reward = ~p, time = ~p where roleID=~p",
			[DungeonID, Phys, misc:term_to_string(Pos), Reward, Time, RoleID]),
		Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
		logResult("update pet_dungeon_info", Ret, SQL)
		  end,
	lists:foreach(Fun, L).

syncInsertPlayerClock() ->
	List = edb:selectTableAndClearTable(new_rec_player_clock),
	case List of
		[] ->
			skip;
		_ ->
			syncInsertPlayerClock(List)
	end,
	ok.
syncInsertPlayerClock(List) ->
	Fun =
		fun(#rec_player_clock{
			roleID = {RoleID,Type},				%%玩家roleid bigint(20) unsigned
			clockType = Type1,				%%计时器类型 bigint(20)
			offTime = OT,				%%下线是否计时(1计时,2不计时) tinyint(3) unsigned
			startTime = ST,				%%开始时间 datetime
			lastTime = LT,				%%最后一次记录时间 datetime
			lengthTime = LenT,				%%持续时间，秒 int(11)
			passTime = PT				%%已经花去的时间，秒 int(11)
		}) ->
			SQL = case Type =/= Type1 of
					  true ->
						  %% 不相等表示要删除
						  io_lib:format("DELETE FROM player_clock WHERE roleID = ~p AND clockType = ~p",[RoleID,Type]);
					  _ ->
						  io_lib:format("insert player_clock(roleID,clockType,offTime,startTime,lastTime,lengthTime,passTime) values(~p,~p,~p,'~ts','~ts',~p,~p)",
							  [RoleID,Type,OT,convert2MysqlDateTimeStr(ST),convert2MysqlDateTimeStr(LT),LenT,PT])
				  end,
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert player_clock",Ret,SQL)
		end,
	lists:foreach(Fun,List).

syncUpdatePlayerClock() ->
	List = edb:selectTableAndClearTable(update_rec_player_clock),
	case List of
		[] ->
			skip;
		_ ->
			syncUpdatePlayerClock(List)
	end,
	ok.
syncUpdatePlayerClock(List) ->
	Fun =
		fun(#rec_player_clock{
			roleID = {RoleID,Type},				%%玩家roleid bigint(20) unsigned
			%clockType = Type1,				%%计时器类型 bigint(20)
			offTime = OT,				%%下线是否计时(1计时,2不计时) tinyint(3) unsigned
			startTime = ST,				%%开始时间 datetime
			lastTime = LT,				%%最后一次记录时间 datetime
			lengthTime = LenT,				%%持续时间，秒 int(11)
			passTime = PT				%%已经花去的时间，秒 int(11)
		}) ->
			SQL = io_lib:format("update player_clock set offTime=~p,startTime='~ts',lastTime='~ts',lengthTime=~p,passTime=~p where roleID=~p and clockType=~p",
				[OT,convert2MysqlDateTimeStr(ST),convert2MysqlDateTimeStr(LT),LenT,PT,RoleID,Type]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("update player_clock",Ret,SQL)
		end,
	lists:foreach(Fun,List).

syncInsertSkill() ->
	List = edb:selectTableAndClearTable(new_rec_skill),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_skill{
				roleID = {RoleID,ID},				%%角色唯一id bigint(20) unsigned
				skillID = ID,				%%技能ID smallint(6)
				level = LV,				%%技能等级 tinyint(3) unsigned
				lastUseTime = Time				%%上次使用的时间 bigint(20) unsigned
			},AccIn) ->
				io_lib:format(",(~p,~p,~p,~p)",[RoleID,ID,LV,Time]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert skill(roleID,skillID,level,lastUseTime) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert skill",Ret,SQL)
	end,
	ok.

syncUpdateSkill() ->
	List = edb:selectTableAndClearTable(update_rec_skill),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_skill{
				roleID = {RoleID,ID},				%%角色唯一id bigint(20) unsigned
				skillID = ID,				%%技能ID smallint(6)
				level = LV,				%%技能等级 tinyint(3) unsigned
				lastUseTime = Time				%%上次使用的时间 bigint(20) unsigned
			}) ->
				SQL = io_lib:format("update skill set level=~p,lastUseTime=~p where roleID=~p and skillID=~p",[LV,Time,RoleID,ID]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update skill",Ret,SQL)
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertSkillSlot() ->
	List = edb:selectTableAndClearTable(new_rec_skill_slot),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_skill_slot{
				roleID = {RoleID,Slot},				%%角色ID bigint(20) unsigned
				slot = Slot,				%%技能所在技能槽，主动技能从1开始，被动技能从100开始 tinyint(4) unsigned
				skillID = ID				%%技能ID smallint(6)
			},AccIn) ->
				io_lib:format(",(~p,~p,~p)",[RoleID,Slot,ID]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert skill_slot(roleID,slot,skillID) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert skill_slot",Ret,SQL)
	end,
	ok.

syncUpdateSkillSlot() ->
	List = edb:selectTableAndClearTable(update_rec_skill_slot),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_skill_slot{
				roleID = {RoleID,Slot},				%%角色ID bigint(20) unsigned
				slot = Slot,				%%技能所在技能槽，主动技能从1开始，被动技能从100开始 tinyint(4) unsigned
				skillID = ID				%%技能ID smallint(6)
			}) ->
				SQL = io_lib:format("update skill_slot set skillID=~p where roleID=~p and slot=~p",[ID,RoleID,Slot]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update skill_slot",Ret,SQL)
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertTitle() ->
	List = edb:selectTableAndClearTable(new_rec_title),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_title{
				roleID = {RoleID,TitleID},				%%角色ID bigint(20) unsigned
				titleID = TitleID,				%%称号ID smallint(6) unsigned
				endTime = EndTime
			},AccIn) ->
				io_lib:format(",(~p,~p,~p)",[RoleID,TitleID,EndTime]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert title(roleID,titleID,endTime) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			dealMysqlRetError(List,Ret,SQL),
			logResult("insert title",Ret,SQL)
	end,
	ok.

syncInsertVariant() ->
	List = edb:selectTableAndClearTable(new_rec_variant0),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_variant0{
				roleID = {RoleID,Index},				%%玩家ID bigint(20) unsigned
				index = Index,				%%设置键 smallint(5) unsigned
				value = V				%%设置值 int(11)
			},AccIn) when RoleID >0 ->
				Str = io_lib:format(",(~p,~p,~p)",[RoleID,Index,V]),
				N = RoleID rem 10,
				case lists:keyfind(N,1,AccIn) of
					false ->
						[{N,Str} | AccIn];
					{N,L} ->
						lists:keyreplace(N,1,AccIn,{N,Str ++ L})
				end;
				(_,AccIn) ->
					AccIn
				  end,
			ResultList = lists:foldl(Fun,[],List),
			Fun1 = fun({Num,[_|T]}) ->
				SQL = io_lib:format("insert variant~p(roleID,`index`,value) values ~ts",[Num,T]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("insert variant",Ret,SQL)
				   end,
			lists:foreach(Fun1,ResultList)
	end,
	ok.

syncUpdateVariant() ->
	List = edb:selectTableAndClearTable(update_rec_variant0),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_variant0{
				roleID = {RoleID,Index},		%%玩家ID bigint(20) unsigned
				index = Index,					%%设置键 smallint(5) unsigned
				value = V						%%设置值 int(11)
			}) when RoleID >0 ->
				N = RoleID rem 10,
				SQL = io_lib:format("update variant~p set value=~p where roleID=~p and `index`=~p",[N,V,RoleID,Index]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update variant",Ret,SQL);
				(_) ->
					ok
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

synCInsertSourceShop() ->
	case edb:selectTableAndClearTable(new_rec_sourceshop_forever_limit) of
		[] -> skip;
		List ->
			Fun = fun(#rec_sourceshop_forever_limit{
				roleID = {RoleID,_type},
				type = Type,
				sourceshopIDList = SourceshopIDList
			},AccIn) ->
				io_lib:format(",(~p,~p,~p)",[RoleID,SourceshopIDList,Type]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert sourceshop_forever_limit(roleID,sourceshopIDList,type) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert sourceshop_forever_limit",Ret,SQL)
	end,
	ok.
synCUpdateSourceShop() ->
	case edb:selectTableAndClearTable(update_rec_sourceshop_forever_limit) of
		[] -> skip;
		List ->
			Fun = fun(#rec_sourceshop_forever_limit{
				roleID = {RoleID,_type},
				type = Type,
				sourceshopIDList = SourceshopIDList
			}) ->
				SQL = io_lib:format("update sourceshop_forever_limit set sourceshopIDList='~ts' where roleID=~p and type=~p ",[SourceshopIDList,RoleID,Type]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update sourceshop_forever_limit",Ret,SQL)
				  end,
			lists:foreach(Fun, List)
	end,
	ok.

synCInsertGuardMirrorRank() ->
	case edb:selectTableAndClearTable(new_rec_guard_mirror_rank) of
		[] -> skip;
		List ->
			emysql:prepare(insertGuard_mirror_rank, "insert guard_mirror_rank(roleID,days) values (?,?)"),
			Fun = fun(#rec_guard_mirror_rank{
				roleID = RoleID,
				days = Days}) ->
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,insertGuard_mirror_rank,[RoleID,Days]),
				logResult("insertGuard_mirror_rank",Ret,"insert guard_mirror_rank")
				  end,
			lists:foreach(Fun,List)
	end,
	ok.
syncUpdateGuardMirrorRank() ->
	List = edb:selectTableAndClearTable(update_rec_guard_mirror_rank),
	Fun = fun(#rec_guard_mirror_rank{
		roleID = RoleID,
		days = Days}) ->
		SQL =
			emysql:prepare(updateGuard_mirror_rank,
				"update guard_mirror_rank set days=? where roleID=?"
			),

		Ret = emysql:execute(?GAMEDB_CONNECT_POOL,updateGuard_mirror_rank,[Days,RoleID]),
		logResult("updateGuard_mirror_rank",Ret,SQL)
		  end,
	lists:foreach(Fun,List),
	ok.

synCInsertGuardMirror() ->
	case edb:selectTableAndClearTable(new_rec_guard_mirror) of
		[] -> skip;
		List ->
			emysql:prepare(insertGuard_mirror, "insert guard_mirror(roleID,roleLevel,roleCareer,roleName,hpNumber,guardTimes,fightForce,mirrorBuffCfgID,roleBuffCffgID,declaration) values (?,?,?,?,?,?,?,?,?,?)"),
			Fun = fun(#rec_guard_mirror{
				roleID = RoleID,
				roleLevel = Level,
				roleCareer = Career,
				roleName = RoleName,
				hpNumber=Hp,
				guardTimes = Times,
				fightForce = FightForce,
				mirrorBuffCfgID=MirrorBuffCfgID,
				roleBuffCffgID=RoleBuffCffgID,
				declaration = Declaration}) ->
				TruncatSql = "TRUNCATE TABLE guard_mirror",
				emysql:execute(?GAMEDB_CONNECT_POOL, TruncatSql),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,insertGuard_mirror,[RoleID,Level,Career,RoleName,Hp,Times,FightForce,MirrorBuffCfgID,RoleBuffCffgID,Declaration]),
				logResult("insert guard_mirror",Ret,"insert guard_mirror")
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

syncUpdateGuardMirror() ->
	List = edb:selectTableAndClearTable(update_rec_guard_mirror),
	Fun = fun(
		#rec_guard_mirror{roleID = RoleID, roleLevel = Level,
			roleCareer = Career, roleName = RoleName, hpNumber = Hp,
			guardTimes = Times, fightForce = FightForce,
			mirrorBuffCfgID=MirrorBuffCfgID,
			roleBuffCffgID=RoleBuffCffgID,declaration = Declaration}) ->
		SQL =
			emysql:prepare(updateGuard_mirror,
				"update guard_mirror set roleID=?,roleName=?,hpNumber=?,guardTimes=?,roleLevel=?,roleCareer=?,fightForce=?,mirrorBuffCfgID=?,roleBuffCffgID=?,declaration=?"
			),

		Ret = emysql:execute(?GAMEDB_CONNECT_POOL, updateGuard_mirror, [RoleID, RoleName, Hp, Times, Level, Career,FightForce,MirrorBuffCfgID,RoleBuffCffgID,Declaration]),
		logResult("update guard_mirror", Ret, SQL)
		  end,
	lists:foreach(Fun, List),
	ok.

syncInsertMSShop() ->
	List = edb:selectTableAndClearTable(new_rec_player_ms_shop),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_player_ms_shop{roleID = {RoleID, OnlyID}, only_id = OnlyID, itemID = ItemID, count = Count},AccIn) ->
				io_lib:format(",(~p,~p,~p,~p)",[RoleID, OnlyID, ItemID, Count]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert player_ms_shop(roleID,only_id,itemID,`count`) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert player_ms_shop",Ret,SQL)
	end,
	ok.

syncUpdateMSShop() ->
	List = edb:selectTableAndClearTable(update_rec_player_ms_shop),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_player_ms_shop{roleID = {RoleID, OnlyID}, only_id = OnlyID2, itemID = ItemID, count = Count}) ->
				SQL = case OnlyID =:= OnlyID2 of
						  true ->
							  io_lib:format("update player_ms_shop set `count`=~p,itemID=~p where roleID=~p and only_id=~p",
								  [Count, ItemID, RoleID, OnlyID]);
						  _ ->
							  io_lib:format("DELETE FROM player_ms_shop WHERE roleID = ~p AND only_id = ~p",[RoleID, OnlyID])
					  end,
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update rec_player_ms_shop",Ret,SQL)
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertCommonActive() ->
	List = edb:selectTableAndClearTable(new_rec_common_active_code),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_common_active_code{role_id = {RoleID, Code}, awardcode = Code, taken_time = TT},AccIn) ->
				io_lib:format(",(~p,~p,~p)",[RoleID, Code, TT]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert common_active_code(role_id,awardcode,taken_time) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert common_active_code",Ret,SQL)
	end,
	ok.

syncUpdateCommonActive() ->
	List = edb:selectTableAndClearTable(update_rec_common_active_code),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_common_active_code{role_id = {RoleID, Code}, awardcode = Code1, taken_time = TT}) ->
				case Code =:= Code1 of
					true ->
						SQL = io_lib:format("update common_active_code set taken_time = ~p where role_id = ~p and awardcode = ~p",[TT,RoleID,Code]),
						Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
						logResult("update common_active_code",Ret,SQL);
					_ ->
						%%这里暂时不支持删除，如果有必要再打开
						%%io_lib:format("delete from common_active_code where role_id = ~p and awardcode = ~p",[RoleID,Code]),
						?WARN_OUT("update common actvie code,but code is error,want to delete?"),
						skip
				end
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertTalent() ->
	List = edb:selectTableAndClearTable(new_rec_talent),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_talent{roleID = RoleID,
				propIntensify = PI,
				phyDefIntensify = PhyDef,
				magDefIntensify = MagDef,
				petDamIntensify = PDamI,
				petDefIntensify = PDI
			},AccIn) ->
				io_lib:format(",(~p,~p,~p,~p,~p,~p)",[RoleID,PI,PhyDef,MagDef,PDamI,PDI]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert talent(roleID,propIntensify,phyDefIntensify,magDefIntensify,petDamIntensify,petDefIntensify) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert talent",Ret,SQL)
	end,
	ok.

syncUpdateTalent() ->
	List = edb:selectTableAndClearTable(update_rec_talent),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_talent{roleID = RoleID,
				propIntensify = PI,
				phyDefIntensify = PhyDef,
				magDefIntensify = MagDef,
				petDamIntensify = PDamI,
				petDefIntensify = PDI}) ->
				SQL = io_lib:format("update talent set propIntensify=~p,phyDefIntensify=~p,magDefIntensify=~p,petDamIntensify=~p,petDefIntensify=~p where roleID=~p",
					[PI,PhyDef,MagDef,PDamI,PDI,RoleID]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update talent",Ret,SQL)
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertExtrole() ->
	List = edb:selectTableAndClearTable(new_rec_ext_role),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_ext_role{roleID = RoleID,
				totalOfflineTime = V,
				canRename = CanRename,
				updateReward = UpdateReward},AccIn) ->
				io_lib:format(",(~p,~p,~p,'~ts')",[RoleID,V,CanRename,misc:term_to_string(UpdateReward)]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert ext_role(roleID,totalOfflineTime,canRename,updateReward) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert ext_role",Ret,SQL)
	end,
	ok.

syncUpdateExtrole() ->
	List = edb:selectTableAndClearTable(update_rec_ext_role),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_ext_role{roleID = RoleID,
				totalOfflineTime = V,
				canRename = CanRename,
				updateReward = UpdateReward}) ->
				SQL = io_lib:format("update ext_role set totalOfflineTime=~p,canRename=~p,updateReward='~ts' where roleID=~p",[V,CanRename,misc:term_to_string(UpdateReward),RoleID]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update ext_role",Ret,SQL)
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertWarriorTrial() ->
	List = edb:selectTableAndClearTable(new_rec_warrior_trial),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_warrior_trial{roleID = RoleID,trialSchedule = TS,tswkTrialSchedule = TTS, tswkTrialTime = TTT},AccIn) ->
				io_lib:format(",(~p,~p,~p,~p)",[RoleID,TS,TTS,TTT]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert warrior_trial(roleID,trialSchedule,tswkTrialSchedule,tswkTrialTime) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert warrior_trial",Ret,SQL)
	end,
	ok.

syncUpdateWarriorTrial() ->
	List = edb:selectTableAndClearTable(update_rec_warrior_trial),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_warrior_trial{roleID = RoleID,trialSchedule = TS,tswkTrialSchedule = TTS, tswkTrialTime = TTT}) ->
				SQL = io_lib:format("update warrior_trial set trialSchedule=~p,tswkTrialSchedule=~p,tswkTrialTime=~p where roleID=~p",[TS,TTS,TTT,RoleID]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update warrior_trial",Ret,SQL)
				  end,
			lists:foreach(Fun,List)
	end,
	ok.
syncInsertGodWeapon() ->
	List = edb:selectTableAndClearTable(new_rec_god_weapon),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_god_weapon{roleID = {RoleID,WeaponID},
				weaponID = WeaponID,
				weaponLevel = WLevel,
				skillLevel = SLevel
			},AccIn) ->
				io_lib:format(",(~p,~p,~p,~p)",[RoleID,WeaponID,WLevel,SLevel]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert god_weapon(roleID,weaponID,weaponLevel,skillLevel) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert god_weapon",Ret,SQL)
	end,
	ok.

syncUpdateGodWeapon() ->
	List = edb:selectTableAndClearTable(update_rec_god_weapon),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_god_weapon{roleID = {RoleID,WeaponID},
				weaponID = WeaponID,
				weaponLevel = WLevel,
				skillLevel = SLevel}) ->
				SQL = io_lib:format("update god_weapon set weaponLevel=~p,skillLevel=~p where roleID=~p and weaponID=~p",
					[WLevel,SLevel,RoleID,WeaponID]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update god_weapon",Ret,SQL)
				  end,
			lists:foreach(Fun,List)
	end,
	ok.

syncInsertOperateExchange() ->
	List = edb:selectTableAndClearTable(new_rec_operate_exchange_data),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_operate_exchange_data{
				roleID = {RoleID,EXID},				%%角色ID bigint(20) unsigned
				exchangeID = EXID,				    %%活动ID int(10) unsigned
				exchangeCount = Count				%%兑换次数 smallint(6)
			},AccIn) ->
				io_lib:format(",(~p,~p,~p)",[RoleID,EXID,Count]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert operate_exchange_data(roleID,exchangeID,exchangeCount) values ~ts",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert rec_operate_exchange_data",Ret,SQL)

	end,
	ok.

syncUpdateOperateExchange() ->
	List = edb:selectTableAndClearTable(update_rec_operate_exchange_data),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_operate_exchange_data{
				roleID = {RoleID,EXID},				%%角色ID bigint(20) unsigned
				exchangeID = EXID,				    %%活动ID int(10) unsigned
				exchangeCount = Count				%%兑换次数 smallint(6)
			}) ->
				SQL = io_lib:format("update operate_exchange_data set exchangeCount=~p where roleID=~p and exchangeID=~p",[Count,RoleID,EXID]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update rec_operate_exchange_data",Ret,SQL)
				  end,
			lists:foreach(Fun,List)
	end,
	ok.
%%玩家队伍
%syncInsertPlayerTeam() ->
%	List = edb:selectTableAndClearTable(new_rec_player_team),
%	case List of
%		[] ->
%			skip;
%		_ ->
%			Fun = fun(#rec_player_team{
%				roleID = {RoleID,Type},				%%玩家角色ID bigint(20) unsigned
%				type = Type,				%%队伍类型 tinyint(3) unsigned
%				teamID = TeamID				%%队伍ID bigint(20) unsigned
%			},AccIn) ->
%				io_lib:format(",(~p,~p,~p)",[RoleID,Type,TeamID]) ++ AccIn
%			end,
%			[_|T] = lists:foldl(Fun,[],List),
%			SQL = io_lib:format("insert player_team(roleID,type,teamID) values ~ts",[T]),
%			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
%			logResult("insert player_team",Ret,SQL)
%	end,
%	ok.
%
%syncUpdatePlayerTeam() ->
%	List = edb:selectTableAndClearTable(update_rec_player_team),
%	case List of
%		[] ->
%			skip;
%		_ ->
%			Fun = fun(#rec_player_team{
%				roleID = {RoleID,Type},				%%玩家角色ID bigint(20) unsigned
%				type = Type,				%%队伍类型 tinyint(3) unsigned
%				teamID = TeamID				%%队伍ID bigint(20) unsigned
%			}) ->
%				SQL = io_lib:format("update player_team set type=~p,teamID=~p where roleID=~p",
%					[Type, TeamID, RoleID]),
%				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
%				logResult("update player_team",Ret,SQL)
%			end,
%			lists:foreach(Fun,List)
%	end,
%	ok.
-spec logResult(Desc,Ret,SQL) -> boolean() when
	Desc::term(),Ret::term(),SQL::string().
logResult(Desc,#ok_packet{affected_rows = 0},SQL) ->
	?DEBUG_OUT("exec[~ts] affected_rows[0], SQL[~ts]",[Desc,SQL]),
	true;
logResult(_Desc,#ok_packet{},_SQL) ->
%%	?LOG_OUT("exec[~ts] affected_rows[~p]",[Desc,AffectedRowNum]),
	true;
logResult(_Desc,#result_packet{},_SQL) ->
%%	?LOG_OUT("exec[~ts] affected_rows[~p]",[Desc,AffectedRowNum]),
	true;
logResult(Desc,#error_packet{seq_num = SN,code = Code,status = Status,msg = Msg},SQL) ->
	?ERROR_OUT("exec[~ts] Failed, SN:~p Code:~p Status:~p Msg:~ts SQL:~ts",[Desc,SN,Code,Status,Msg,SQL]),
	false;
logResult(Desc,[],SQL) ->
	?DEBUG_OUT("exec[~ts] result [] SQL:~ts", [Desc, SQL]),
	true;
logResult(Desc,[_H|T],SQL) ->
	logResult(Desc,T,SQL);
logResult(Desc,Ret,SQL) ->
	?ERROR_OUT("exec[~ts] failed, Result[~p] SQL:~ts",[Desc,Ret,SQL]),
	false.

convert2MysqlDateTimeStr(0) ->
	"1970-01-01 00:00:00";
convert2MysqlDateTimeStr({datetime,{{Y,M,D},{H,Min,S}}}) ->
	io_lib:format("~p/~p/~p ~p:~p:~p",[Y,M,D,H,Min,S]).

-spec dealMysqlRetError(DataList::list(),#error_packet{},SQL::string()) ->ok|skip.
%%检查是否有重复key的insert错误，有就踢掉重复的(针对mysql的返回消息做解析处理)
dealMysqlRetError([H|_] = DataList,#error_packet{status = <<"23000">>,msg = Msg},_SQL) ->
	TS = string:tokens(Msg, " "),
	Keys = lists:nth(3, TS),
	Keys2 = string:strip(Keys, both,$'),
	KeyList1 = string:tokens(Keys2, "-"),
	[RecName|[RecKey|_]] = erlang:tuple_to_list(H),

	RealRecKey = createRowKeyByModel(RecKey,KeyList1),
	PredFun = fun(T,Acc) ->
		[_RecName|[RecKey2|_]] = erlang:tuple_to_list(T),
		case RecKey2==RealRecKey of
			true ->Acc;
			false ->[T|Acc]
		end
			  end,
	NewDataList = lists:foldl(PredFun,[], DataList),
	NewTab = getNewTableName(RecName),

	[edb:writeRecord(NewTab, Row)||Row <- NewDataList],
	?ERROR_OUT("NewTab rewrite ~p  ~p",[NewTab,RealRecKey]),
	ok;
%%检测到有死锁情况
dealMysqlRetError(_DataList,#error_packet{status = <<"40001">>} = Error,SQL) ->
	dealMysqlDeadlock(Error,SQL,3);
dealMysqlRetError(_,_,_) ->
	skip.

%%处理死锁情况
dealMysqlDeadlock(Error,SQL,0) ->
	?ERROR_OUT("Mysql exec:~ts Ret Error:~p, exec 3 times,but failed",[SQL,Error]),
	ok;
dealMysqlDeadlock(#error_packet{status = <<"40001">>} = Error,SQL,N) ->
	?ERROR_OUT("Mysql exec:~ts Ret Error:~p, will exec again",[SQL,Error]),
	%%出现死锁，检查一下InnoDB的状态
	libDB:showMysqlInnoDBStatus(),
	timer:sleep(3000),
	%%再次执行原来的SQL语句
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
	dealMysqlDeadlock(Ret,SQL,N - 1);
dealMysqlDeadlock(#ok_packet{affected_rows = AffectedRowNum},SQL,N) ->
	?LOG_OUT("dealMysqlDeadlock exec[~ts] affected_rows[~p] @ ~p",[SQL,AffectedRowNum,N]),
	ok.

createRowKeyByModel(RecKey,KeyList1) when erlang:is_tuple(RecKey) ->
	RecKeyArg = erlang:tuple_to_list(RecKey),
	A = createRowKey(KeyList1,RecKeyArg,[]),
	erlang:list_to_tuple(A);
createRowKeyByModel(RecKey,[KeyData|_]) when erlang:is_list(RecKey) ->
	KeyData;
createRowKeyByModel(RecKey,[KeyData|_]) when erlang:is_integer(RecKey) ->
	erlang:list_to_integer(KeyData);
createRowKeyByModel(RecKey,[KeyData|_]) when erlang:is_float(RecKey) ->
	erlang:list_to_float(KeyData);
createRowKeyByModel(_RecKey,KeyData) ->
	?ERROR_OUT("createRowKeyByModel ~p",[KeyData]),
	undefined.

createRowKey([],_,DT) ->
	DT;
createRowKey([HData|TailData],[HModel|TailModel],DT) ->
	RealHData =
		case HModel of
			V when erlang:is_integer(V) ->
				erlang:list_to_integer(HData);
			V when erlang:is_float(V) ->
				erlang:list_to_float(HData);
			_ ->
				HData
		end,
	createRowKey(TailData,TailModel,DT++[RealHData]).

syncInsertPlayerLiveness()->
	List = edb:selectTableAndClearTable(new_rec_player_liveness),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_player_liveness{
				playerID = PlayerID,
				livenessValue = LiveValue,				%%玩家活跃度值 int(4) unsigned
				livenessList = LiveList,				%%玩家活跃度完成列表 varbinary(64)
				livenessGiftDrew = GiftDraw,
				lastUpdateTime = LastTime
			},AccIn) ->
%%                SQ = [io_lib:format(",(~p,~p,'~s',~p)",[PlayerID,LiveValue,misc:term_to_string(LiveList),misc:term_to_string(GiftDraw)]) | AccIn],
%%                string:join(SQ,",")
				io_lib:format(",(~p,~p,'~ts','~ts',~p)",[PlayerID,LiveValue,misc:term_to_string(LiveList),misc:term_to_string(GiftDraw),LastTime]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert player_liveness(playerID,livenessValue,livenessList,livenessGiftDrew,lastUpdateTime) values ~s",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			dealMysqlRetError(List,Ret,SQL),
			logResult("insert player_liveness",Ret,SQL)
	end,
	ok.

syncUpdateLiveness()->
	List = edb:selectTableAndClearTable(update_rec_player_liveness),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_player_liveness{
				playerID = PlayerID,
				livenessValue = LiveValue,				%%玩家活跃度值 int(4) unsigned
				livenessList = LiveList,				%%玩家活跃度完成列表 varbinary(64)
				livenessGiftDrew = GiftDraw,
				lastUpdateTime = LastTime
			}) ->
				SQL = io_lib:format("update player_liveness set livenessValue = ~p,livenessList = '~ts',livenessGiftDrew = '~ts',lastUpdateTime=~p where playerID=~p ",[LiveValue,misc:term_to_string(LiveList),misc:term_to_string(GiftDraw),LastTime,PlayerID]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update player_liveness",Ret,SQL)
				  end,

			lists:foreach(Fun,List)
	end,
	ok.


syncInsertPlayerHolidayTask()->
	List = edb:selectTableAndClearTable(new_rec_holiday_task),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_holiday_task{
				playerID = PlayerID,
				acceptedTaskId = AccTask,
				acceptedTime = AccTime,
				completedTask = CompletedTask

			},AccIn) ->
				io_lib:format(",(~p,~p,~p,'~ts')",[PlayerID,AccTask,AccTime,misc:term_to_string(CompletedTask)]) ++ AccIn
				  end,
			[_|T] = lists:foldl(Fun,[],List),
			SQL = io_lib:format("insert holiday_task(playerID,acceptedTaskId,acceptedTime,completedTask) values ~s",[T]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			logResult("insert holiday_task",Ret,SQL)
	end,
	ok.

syncUpdateHolidayTask()->
	List = edb:selectTableAndClearTable(update_rec_holiday_task),
	case List of
		[] ->
			skip;
		_ ->
			Fun = fun(#rec_holiday_task{
				playerID = PlayerID,
				acceptedTaskId = AccTask,
				acceptedTime = AccTime,
				completedTask = CompletedTask
			}) ->
				SQL = io_lib:format("update holiday_task set acceptedTaskId = ~p,acceptedTime=~p,completedTask='~ts' where playerID=~p ",[AccTask,AccTime,misc:term_to_string(CompletedTask),PlayerID]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				logResult("update holiday_task",Ret,SQL)
				  end,

			lists:foreach(Fun,List)
	end,
	ok.

syncInsertPlayerDrop()->
	List = edb:selectTableAndClearTable(new_rec_player_drop),
	syncInsertPlayerDrop(List).
syncInsertPlayerDrop([]) ->
	ok;
syncInsertPlayerDrop(List) ->
	Fun = fun(#rec_player_drop
	{
		roleID = {RoleID, _},
		id = Id,
		num = Num,
		time = Time
	},AccIn) ->
		io_lib:format(",(~p,~p,~p,~p)",[RoleID, Id, Num, Time]) ++ AccIn
		  end,
	[_|T] = lists:foldl(Fun,[],List),
	SQL = io_lib:format("insert player_drop(roleID, id, num, time) values ~s",[T]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
	logResult("insert player_drop",Ret,SQL),
	ok.

syncUpdatePlayerDrop() ->
	List = edb:selectTableAndClearTable(update_rec_player_drop),
	syncUpdatePlayerDrop(List).
syncUpdatePlayerDrop([]) ->
	ok;
syncUpdatePlayerDrop(List) ->
	Fun = fun(#rec_player_drop
	{
		roleID = {RoleID, _},
		id = Id,
		num = Num,
		time = Time
	}) ->
		SQL = io_lib:format("update player_drop set num = ~p, time = ~p where roleID=~p and id=~p",[Num,Time,RoleID,Id]),
		Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
		logResult("update player_drop",Ret,SQL)
		  end,

	lists:foreach(Fun,List).