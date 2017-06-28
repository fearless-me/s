%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%% 保存数据，demo版
%%% @end
%%% Created : 23. 九月 2016 17:06
%%%-------------------------------------------------------------------
-module(dbGSDataSave).
-author("tiancheng").

-include("dbsInc.hrl").

%% API
-export([
	initGSSavePrepare/0
]).

-export([
	savePlayerData/1,
	saveIdentityData/2,
	savePicData/2,
	saveFriend2Data/1,
	resetDaily2Data/0,
	saveDaily2Data/1,
	saveMarriageData/1,
	savePetTerritoryData/1
]).

initGSSavePrepare() ->
	ok.

savePlayerData([]) ->
	ok;
savePlayerData(
	#rec_playerdata{
		roleID = RoleID,
		rec_player_prop = Props,
		rec_task_accepted = Accepts,
		rec_task_submitted = Submits
	}) ->
	savePlayerDataHandle(Props),
	%% FIXME 保存接受任务要特殊处理，因为可能没有值！ tiancheng
	savePlayerDataHandle({RoleID, rec_task, Accepts}),
	savePlayerDataHandle(Submits),
	ok;
savePlayerData(#rec_base_role{} = Role) ->
	#rec_base_role{
		accountID=AccountID,
		career = Career,
		roleID = RoleID,						%%玩家角色唯一ID bigint(20) unsigned
		mapID = MapID,							%%玩家当前所在的地图ID smallint(6) unsigned
		x = X,									%%玩家所在地图的X坐标 float
		y = Y,									%%玩家所在地图的Y坐标 float
		oldMapID = OldMapID,					%%玩家进入副本前所在地图ID smallint(6) unsigned
		oldX = OldX,							%%进入副本前所在的X float
		oldY = OldY,							%%进入副本前所在的Y float
		pkMode = Pk,							%%玩家Pk状态 tinyint(4) unsigned
		level = Level,							%%玩家的当前等级 tinyint(4) unsigned
		exp = Exp,								%%玩家经验 int(10) unsigned
		hp = Hp,								%%玩家当前生命值 int(10) unsigned
		reputation = Reputation,				%%爵位声望(只增不减) int(10) unsigned
		achieve = Achieve,						%%成就 int(11) unsigned
		createTime = _CreateTime,				%%角色创建时间 datetime
		lastLoginTime = LastLoginTime,			%%上次登录时间 datetime
		lastLogoutTime = LastLogoutTime,		%%上次下线时间 datetime
		denyChatTime = DenyChatTime,			%%禁言时间(unix_time,转换成秒是为了方便比较) bigint(20) unsigned
		deleteTime = DeleteTime,				%%删除时间 datetime
		isOnline = IsOnline,					%%是否在线 tinyint(1) unsigned
		totalOnlineTime = TotalOnlineTime,		%%累计在线时长，单位：秒 bigint(20) unsigned
		lastTransferMapTime = LTMT				%%上次使用小地图传送的Unix UTC时间，单位秒 int(10) unsigned
	} = Role,
	SQL = io_lib:format("update base_role set mapID=~p,x=~p,y=~p,oldMapID=~p,oldX=~p,oldY=~p,pkMode=~p,level=~p,career=~p,exp=~p,hp=~p,"
	"reputation=~p,achieve=~p,lastTransferMapTime=~p,denyChatTime=~p,"
	"lastLoginTime='~ts',lastLogoutTime='~ts',deleteTime='~ts',isOnline=~p,totalOnlineTime=~p,accountID=~p"
	" where roleID=~p",
		[MapID,X,Y,OldMapID,OldX,OldY,Pk,Level,Career,Exp,Hp,Reputation,Achieve,LTMT,DenyChatTime,
			time:convert2MysqlDateTimeStr(LastLoginTime), time:convert2MysqlDateTimeStr(LastLogoutTime),
			time:convert2MysqlDateTimeStr(DeleteTime),IsOnline,TotalOnlineTime,AccountID,
			RoleID
		]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
	dbMemCache:logResult("Update RoleBase",Ret,SQL),
	ok;
savePlayerData(Data) ->
	savePlayerDataHandle(Data),
	ok.

savePlayerDataHandle(undefined) ->
	ok;
savePlayerDataHandle([#rec_task_submitted{roleID = RoleID}|_] = List) ->
	Fun =
		fun(#rec_task_submitted{
			roleID = RoleID2,				%%角色ID bigint(20) unsigned
			taskSlot = Slot,				%%任务旗标索引，支持65536个任务ID，需要65536/64＝1024个索引 smallint(5) unsigned
			taskFlag = V				    %%任务旗标，每个任务占一个位 bigint(20) unsigned
		},AccIn) ->
			io_lib:format(",(~p,~p,~p)",[RoleID2,Slot,V]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun,[],List),
	SQL = io_lib:format("DELETE FROM task_submitted WHERE roleID = ~p;insert into task_submitted(roleID,taskSlot,taskFlag) values ~ts",[RoleID, T]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert into task_submitted", Ret, SQL),
	ok;
savePlayerDataHandle({_RoleID, rec_task, undefined}) ->
	ok;
savePlayerDataHandle({RoleID, rec_task, []}) ->
	SQL = io_lib:format("DELETE FROM task WHERE roleID = ~p;", [RoleID]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("delete task", Ret, SQL),
	?WARN_OUT("task_accepted:~ts", [SQL]),
	ok;
savePlayerDataHandle({RoleID, rec_task, [#rec_task{}|_] = List}) ->
	Fun =
		fun(#rec_task{
			roleID = RoleID2,				%%角色ID bigint(20) unsigned
			taskID = TaskID,				%%任务ID int(11)
			taskType = T1,				%%任务类型 int(11)
			taskSubType = T2,				%%任务子类型 int(11)
			taskKey = K1,				%%任务key int(11)
			taskTarget = TR,				%%任务目标 int(11)
			taskTargetCur = TRC,				%%当前数量 int(11)
			taskTargetMax = TRM				%%最大数量 int(11)
		}, Acc) ->
			io_lib:format(",(~p,~p,~p,~p,~p,~p,~p,~p)",[RoleID2,TaskID,T1,T2, K1, TR,TRC,TRM]) ++ Acc
		end,
	[_|T] = lists:foldl(Fun,[],List),
	SQL = io_lib:format("DELETE FROM task WHERE roleID = ~p;insert into task(roleID,taskID,taskType,taskSubType,taskKey,taskTarget,taskTargetCur,taskTargetMax) values ~ts",
		[RoleID,T]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert into task", Ret, SQL),
	ok;
savePlayerDataHandle({update, #rec_ladder_1v1{} = Rec}) ->
	savePlayerDataHandle({update, [Rec]});
savePlayerDataHandle({update, [#rec_ladder_1v1{}|_] = List}) ->
	Fun =
		fun(#rec_ladder_1v1{exploit = Exploit} = R) ->
			case Exploit >= 2147483648 of
				true ->
					?ERROR_OUT("ladder1V1Update to max:~p,~p", [Exploit, R]);
				_ ->
					skip
			end,
			SQL = io_lib:format("update ladder_1v1 set roleID=~p,exploit=~p,cur_win=~p,max_win=~p,win_times=~p,worship_times=~p,rankMin=~p where rankSort=~p",
				[
					R#rec_ladder_1v1.roleID,
					erlang:min(Exploit, 2147483648),
					R#rec_ladder_1v1.cur_win,
					R#rec_ladder_1v1.max_win,
					R#rec_ladder_1v1.win_times,
					R#rec_ladder_1v1.worship_times,
					R#rec_ladder_1v1.rankMin,
					R#rec_ladder_1v1.rankSort
				]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			dbMemCache:logResult("update ladder_1v1",Ret,SQL)
		end,
	lists:foreach(Fun,List),
	ok;
savePlayerDataHandle({insert, #rec_ladder_1v1{} = Rec}) ->
	savePlayerDataHandle({insert, [Rec]});
savePlayerDataHandle({insert, [#rec_ladder_1v1{}|_] = List}) ->
	Fun =
		fun(#rec_ladder_1v1{} = R, AccIn) ->
			io_lib:format(",(~p,~p,~p,~p,~p,~p,~p,~p)",
				[
					R#rec_ladder_1v1.rankSort,
					R#rec_ladder_1v1.roleID,
					R#rec_ladder_1v1.exploit,
					R#rec_ladder_1v1.cur_win,
					R#rec_ladder_1v1.max_win,
					R#rec_ladder_1v1.win_times,
					R#rec_ladder_1v1.worship_times,
					R#rec_ladder_1v1.rankMin
				]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun,[],List),
	SQL = io_lib:format("insert into ladder_1v1 values ~ts",[T]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert into ladder_1v1", Ret, SQL),
	ok;
savePlayerDataHandle(#rec_player_prop{} = Rec) ->
	SQL = io_lib:format("REPLACE INTO player_prop(roleID, propIndex, propValue) VALUES (~p,~p,'~ts')",
		[Rec#rec_player_prop.roleID, Rec#rec_player_prop.propIndex, Rec#rec_player_prop.propValue]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("player_prop", Ret, SQL),
	ok;
savePlayerDataHandle([#rec_player_prop{roleID = RoleID}|_] = List) ->
	Fun =
		fun(#rec_player_prop{roleID = RoleID2, propIndex = Index, propValue = V}, AccIn) ->
			io_lib:format(",(~p,~p,'~ts')",[RoleID2,Index,V]) ++ AccIn
		end,
	[_|T] = lists:foldl(Fun,[],List),
	SQL = io_lib:format("DELETE FROM player_prop WHERE roleID = ~p;INSERT INTO player_prop(roleID, propIndex, propValue) VALUES ~ts",[RoleID,T]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert player_prop", Ret, SQL),
	ok;
savePlayerDataHandle([]) ->
	ok;
savePlayerDataHandle(Data) ->
	?ERROR_OUT("save data no handle:~p", [Data]),
	ok.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 身份证系统 begin

%% API 保存数据
-spec saveIdentityData(MsgID::atom(), Msg::term()) -> ok.
saveIdentityData(identity_Update, {IDIT, IdentityID, Data} = _Msg)->
	%?DEBUG_OUT("[DebugForIdentity] identity_Update ~p", [{IDIT, IdentityID}]),
	SQL = io_lib:format(
		"update player_identity set ~ts where roleID=~p",
		[saveIdentityData_SQLForUpdate(IDIT, Data), IdentityID]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("update player_identity", Ret, SQL),
	ok;
saveIdentityData(identity_Insert, {IDIT, IdentityID, Data} = _Msg)->
	%?DEBUG_OUT("[DebugForIdentity] identity_Insert ~p", [{IDIT, IdentityID}]),
	SQL = saveIdentityData_SQLForInsert(IDIT, IdentityID, Data),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert player_identity", Ret, SQL),
	ok;
saveIdentityData(identity_Delete, {_, IdentityID} = _Msg)->
	%?DEBUG_OUT("[DebugForIdentity] identity_Delete ~p", [IdentityID]),
	SQL = io_lib:format(
		"delete from player_identity where roleID=~p",
		[IdentityID]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("delete player_identity", Ret, SQL),
	ok;
saveIdentityData(MsgID, Msg) ->
	?ERROR_OUT("saveIdentityData invalid argument~n~p~n~p", [{MsgID, Msg}, misc:getStackTrace()]),
	ok.

%% API 保存照片数据
-spec savePicData(MsgID::atom(), Msg::term()) -> ok.
savePicData(identity_pic_UpdateCount, {MD5, InMain, Count} = _Msg) when Count > 0 ->
	%?DEBUG_OUT("[DebugForIdentity] identity_pic_UpdateCount ~p", [_Msg]),
	Format =
		case InMain of
			true ->
				"update pic_data_main set `count`=~p where `md5`='~ts'";
			_ ->
				"update pic_data_sub set `count`=~p where `md5`='~ts'"
		end,
	SQL = io_lib:format(Format, [Count, misc:listUnit8_to_stringASCII(MD5)]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("update pic_data_", Ret, SQL),
	ok;
savePicData(identity_pic_UpdateCount, {MD5, InMain, _} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] identity_pic_UpdateCount ~p", [_Msg]),
	Format =
		case InMain of
			true ->
				"delete from pic_data_main where `md5`='~ts'";
			_ ->
				"delete from pic_data_sub where `md5`='~ts'"
		end,
	SQL = io_lib:format(Format, [misc:listUnit8_to_stringASCII(MD5)]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("delete pic_data_", Ret, SQL),
	ok;
savePicData(identity_pic_InsertMain, #rec_pic_data_main{
	md5 = MD5,
	data = Data,
	timeLastDown = TimeLastDown,
	timeLastUp = TimeLastUp,
	state = State,
	count = Count
} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] identity_pic_InsertMain ~p", [MD5]),
	SQL = io_lib:format(
		"insert into pic_data_main values ('~ts','~ts',~p,~p,~p,~p)",
		[misc:listUnit8_to_stringASCII(MD5), misc:listUnit8_to_stringASCII(Data), TimeLastDown, TimeLastUp, State, Count]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert pic_data_main", Ret, SQL),
	ok;
savePicData(identity_pic_Active, {Pid, {IdentityID, MD5} = _Msg}) ->
	%?DEBUG_OUT("[DebugForIdentity] identity_pic_Active ~p", [MD5]),
	SQL1 = io_lib:format("select * from pic_data_sub where `md5`='~ts'", [misc:listUnit8_to_stringASCII(MD5)]),
	Ret1 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL1),
	{TableRecord1, RecInfo1} = ?MakeArg(rec_pic_data_sub),
	Pic =
		case emysql_util:as_record(Ret1, TableRecord1, RecInfo1) of
			[#rec_pic_data_sub{
				md5 = MD5SubBin,
				data = DataSubBin,
				timeLastUp = TimeLastUpSub,
				state = StateSub,
				count = CountSub
			}] ->
				Pic_ =
					#rec_pic_data_main{
						md5 = misc:listUnit8_to_stringASCII_inverse(erlang:binary_to_list(MD5SubBin)),
						data = misc:listUnit8_to_stringASCII_inverse(erlang:binary_to_list(DataSubBin)),
						timeLastDown = time:getSyncUTCTimeFromDBS(),
						timeLastUp = TimeLastUpSub,
						state = StateSub,
						count = CountSub
					},
				savePicData(identity_pic_InsertMain, Pic_),
				SQL2 = io_lib:format("delete from pic_data_sub where `md5`='~ts'", [misc:listUnit8_to_stringASCII(MD5)]),
				Ret2 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL2),
				dbMemCache:logResult("delete pic_data_sub", Ret2, SQL2),
				Pic_;
			_ ->
				{}
		end,
	psMgr:sendMsg2PS(Pid, identity_picDownAck, {IdentityID, MD5, Pic}),
	ok;
savePicData(identity_picWantDown, MD5) ->
	%?DEBUG_OUT("[DebugForIdentity] identity_picWantDown ~p", [MD5]),
	SQL = io_lib:format(
		"update pic_data_main set `timeLastDown`=~p where `md5`='~ts'",
		[time:getSyncUTCTimeFromDBS(), misc:listUnit8_to_stringASCII(MD5)]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("update pic_data_main timeLastDown", Ret, SQL),
	ok;
savePicData(identity_pic_Unactive, #rec_pic_data_main{
	md5 = MD5,
	data = Data,
	timeLastDown = TimeLastDown,
	timeLastUp = TimeLastUp,
	state = State,
	count = Count
} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] identity_pic_Unactive ~p", [MD5]),
	SQL_Insert = io_lib:format(
		"insert into pic_data_sub values ('~ts','~ts',~p,~p,~p,~p)",
		[misc:listUnit8_to_stringASCII(MD5), misc:listUnit8_to_stringASCII(Data), TimeLastDown, TimeLastUp, State, Count]
	),
	Ret_Insert = emysql:execute(?GAMEDB_CONNECT_POOL, SQL_Insert),
	dbMemCache:logResult("insert pic_data_sub", Ret_Insert, SQL_Insert),
	SQL_Delete = io_lib:format("delete from pic_data_main where `md5`='~ts'", [misc:listUnit8_to_stringASCII(MD5)]),
	Ret_Delete = emysql:execute(?GAMEDB_CONNECT_POOL, SQL_Delete),
	dbMemCache:logResult("delete pic_data_main", Ret_Delete, SQL_Delete),
	ok;
savePicData(MsgID, Msg) ->
	?ERROR_OUT("savePicData invalid argument~n~p~n~p", [{MsgID, Msg}, misc:getStackTrace()]),
	ok.

%% Internal 生成更新脚本
-spec saveIdentityData_SQLForUpdate(IDIT::type_idit(), Data::term()) -> SQL::string().
saveIdentityData_SQLForUpdate(?IDIT_AGE, Age) ->
	io_lib:format("`age`=~p", [Age]);
saveIdentityData_SQLForUpdate(?IDIT_BIRTH, {Month, Day}) ->
	io_lib:format("`birthmonth`=~p,`birthday`=~p", [Month, Day]);
saveIdentityData_SQLForUpdate(?IDIT_ZODIAC, Zodiac) ->
	io_lib:format("`zodiac`=~p", [Zodiac]);
saveIdentityData_SQLForUpdate(?IDIT_BLOOD, Blood) ->
	io_lib:format("`bloodType`=~p", [Blood]);
saveIdentityData_SQLForUpdate(?IDIT_HOMETOWN, {Hometown1, Hometown2}) ->
	io_lib:format("`hometown1`=~p,`hometown2`=~p", [Hometown1, Hometown2]);
saveIdentityData_SQLForUpdate(?IDIT_LOCATION, {Location1, Location2}) ->
	io_lib:format("`location1`=~p,`location2`=~p", [Location1, Location2]);
saveIdentityData_SQLForUpdate(?IDIT_TAGS, Tags) ->
	io_lib:format("`tags`='~ts'", [misc:anti_sqlInjectionAttack(Tags)]);
saveIdentityData_SQLForUpdate(?IDIT_PIC1, Pic) ->
	io_lib:format("`pic1`='~ts'", [misc:listUnit8_to_stringASCII(Pic)]);
saveIdentityData_SQLForUpdate(?IDIT_PIC2, Pic) ->
	io_lib:format("`pic2`='~ts'", [misc:listUnit8_to_stringASCII(Pic)]);
saveIdentityData_SQLForUpdate(?IDIT_PIC3, Pic) ->
	io_lib:format("`pic3`='~ts'", [misc:listUnit8_to_stringASCII(Pic)]);
saveIdentityData_SQLForUpdate(?IDIT_FACE, Face) ->
	io_lib:format("`face`='~ts'", [misc:listUnit8_to_stringASCII(Face)]);
saveIdentityData_SQLForUpdate(?IDIT_SIGN, Sign) ->
	io_lib:format("`sign`='~ts'", [misc:anti_sqlInjectionAttack(Sign)]);
saveIdentityData_SQLForUpdate(IDIT, Data) ->
	?ERROR_OUT("saveIdentityData_SQLForUpdate invalid argument ~p~n~p", [{IDIT, Data}, misc:getStackTrace()]),
	[].

%% Internal 生成插入脚本
-spec saveIdentityData_SQLForInsert(IDIT::type_idit(), IdentityID::uint64(), Data::term()) -> SQL::string().
saveIdentityData_SQLForInsert(?IDIT_AGE, IdentityID, Age) ->
	io_lib:format("insert into player_identity(`roleID`,`age`) values(~p,~p)", [IdentityID, Age]);
saveIdentityData_SQLForInsert(?IDIT_BIRTH, IdentityID, {Month, Day}) ->
	io_lib:format("insert into player_identity(`roleID`,`birthmonth`,`birthday`) values(~p,~p,~p)", [IdentityID, Month, Day]);
saveIdentityData_SQLForInsert(?IDIT_ZODIAC, IdentityID, Zodiac) ->
	io_lib:format("insert into player_identity(`roleID`,`zodiac`) values(~p,~p)", [IdentityID, Zodiac]);
saveIdentityData_SQLForInsert(?IDIT_BLOOD, IdentityID, Blood) ->
	io_lib:format("insert into player_identity(`roleID`,`bloodType`) values(~p,~p)", [IdentityID, Blood]);
saveIdentityData_SQLForInsert(?IDIT_HOMETOWN, IdentityID, {Hometown1, Hometown2}) ->
	io_lib:format("insert into player_identity(`roleID`,`hometown1`,`hometown2`) values(~p,~p,~p)", [IdentityID, Hometown1, Hometown2]);
saveIdentityData_SQLForInsert(?IDIT_LOCATION, IdentityID, {Location1, Location2}) ->
	io_lib:format("insert into player_identity(`roleID`,`location1`,`location2`) values(~p,~p,~p)", [IdentityID, Location1, Location2]);
saveIdentityData_SQLForInsert(?IDIT_TAGS, IdentityID, Tags) ->
	io_lib:format("insert into player_identity(`roleID`,`tags`) values(~p,'~ts')", [IdentityID, misc:anti_sqlInjectionAttack(Tags)]);
saveIdentityData_SQLForInsert(?IDIT_PIC1, IdentityID, Pic) ->
	io_lib:format("insert into player_identity(`roleID`,`pic1`) values(~p,'~ts')", [IdentityID, misc:listUnit8_to_stringASCII(Pic)]);
saveIdentityData_SQLForInsert(?IDIT_PIC2, IdentityID, Pic) ->
	io_lib:format("insert into player_identity(`roleID`,`pic2`) values(~p,'~ts')", [IdentityID, misc:listUnit8_to_stringASCII(Pic)]);
saveIdentityData_SQLForInsert(?IDIT_PIC3, IdentityID, Pic) ->
	io_lib:format("insert into player_identity(`roleID`,`pic3`) values(~p,'~ts')", [IdentityID, misc:listUnit8_to_stringASCII(Pic)]);
saveIdentityData_SQLForInsert(?IDIT_FACE, IdentityID, Face) ->
	io_lib:format("insert into player_identity(`roleID`,`face`) values(~p,'~ts')", [IdentityID, misc:listUnit8_to_stringASCII(Face)]);
saveIdentityData_SQLForInsert(?IDIT_SIGN, IdentityID, Sign) ->
	io_lib:format("insert into player_identity(`roleID`,`sign`) values(~p,'~ts')", [IdentityID, misc:anti_sqlInjectionAttack(Sign)]);
saveIdentityData_SQLForInsert(IDIT, IdentityID, Data) ->
	?ERROR_OUT("saveIdentityData_SQLForInsert invalid argument ~p~n~p", [{IDIT, IdentityID, Data}, misc:getStackTrace()]),
	[].

%% 身份证系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 新版好友系统 begin

-spec saveFriend2Data({DBOPT::type_dbopt(), Data::term()}) -> ok.
saveFriend2Data({?DBOPT_INSERT, #rec_friend2_relation{
	roleID = RoleID,
	targetRoleID = TargetRoleID,
	relation = Relation,
	closeness = Closeness,
	timeRelation = TimeRelation,
	timeLastInteractive = TimeLastInteractive
}} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] saveFriend2Data ~p", [_Msg]),
	SQL = io_lib:format(
		"insert into friend2_relation values (~p,~p,~p,~p,~p,~p)",
		[RoleID, TargetRoleID, Relation, Closeness, TimeRelation, TimeLastInteractive]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert friend2_relation", Ret, SQL),
	ok;
saveFriend2Data({?DBOPT_UPDATE, #rec_friend2_relation{
	roleID = RoleID,
	targetRoleID = TargetRoleID,
	relation = Relation,
	closeness = Closeness,
	timeRelation = TimeRelation,
	timeLastInteractive = TimeLastInteractive
}} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] saveFriend2Data ~p", [_Msg]),
	SQL = io_lib:format(
		"replace into friend2_relation values (~p,~p,~p,~p,~p,~p)",
		[RoleID, TargetRoleID, Relation, Closeness, TimeRelation, TimeLastInteractive]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("replace friend2_relation", Ret, SQL),
	ok;
saveFriend2Data({?DBOPT_DELETE, #rec_friend2_relation{
	roleID = RoleID,
	targetRoleID = TargetRoleID
}} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] saveFriend2Data ~p", [_Msg]),
	SQL = io_lib:format(
		"delete from friend2_relation where roleID=~p and targetRoleID=~p",
		[RoleID, TargetRoleID]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("delete friend2_relation", Ret, SQL),
	ok;
saveFriend2Data({?DBOPT_INSERT, #rec_friend2_interaction{
	roleID = RoleID,
	targetRoleID = TargetRoleID,
	timeBeApply = TimeBeApply
}} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] saveFriend2Data ~p", [_Msg]),
	SQL = io_lib:format(
		"insert into friend2_interaction values (~p,~p,~p)",
		[RoleID, TargetRoleID, TimeBeApply]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert friend2_interaction", Ret, SQL),
	ok;
saveFriend2Data({?DBOPT_UPDATE, #rec_friend2_interaction{
	roleID = RoleID,
	targetRoleID = TargetRoleID,
	timeBeApply = TimeBeApply
}} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] saveFriend2Data ~p", [_Msg]),
	SQL = io_lib:format(
		"replace into friend2_interaction values (~p,~p,~p)",
		[RoleID, TargetRoleID, TimeBeApply]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("replace friend2_interaction", Ret, SQL),
	ok;
saveFriend2Data({?DBOPT_DELETE, #rec_friend2_interaction{
	roleID = RoleID,
	targetRoleID = TargetRoleID
}} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] saveFriend2Data ~p", [_Msg]),
	SQL = io_lib:format(
		"delete from friend2_interaction where roleID=~p and targetRoleID=~p",
		[RoleID, TargetRoleID]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("delete friend2_interaction", Ret, SQL),
	ok.

%% 新版好友系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 双角色相关的每日计数 begin

-spec resetDaily2Data() -> ok.
resetDaily2Data() ->
	%?DEBUG_OUT("[DebugForDaily2] resetDaily2Data"),
	SQL = "delete from player_daily2",
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("delete player_daily2", Ret, SQL),
	ok.

-spec saveDaily2Data({DBOPT::type_dbopt(), Data::#rec_player_daily2{}}) -> ok.
saveDaily2Data({?DBOPT_INSERT, #rec_player_daily2{
	roleID_A = RoleID_A,
	roleID_B = RoleID_B,
	daily2Type = Daily2Type,
	lastUpdateTime = LastUpdateTime,
	counter = Counter
}} = _Msg) ->
	%?DEBUG_OUT("[DebugForDaily2] saveDaily2Data ~p", [_Msg]),
	SQL = io_lib:format(
		"insert into player_daily2 values (~p,~p,~p,~p,~p)",
		[RoleID_A, RoleID_B, Daily2Type, LastUpdateTime, Counter]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert player_daily2", Ret, SQL),
	ok;
saveDaily2Data({?DBOPT_UPDATE, #rec_player_daily2{
	roleID_A = RoleID_A,
	roleID_B = RoleID_B,
	daily2Type = Daily2Type,
	lastUpdateTime = LastUpdateTime,
	counter = Counter
}} = _Msg) ->
	%?DEBUG_OUT("[DebugForDaily2] saveDaily2Data ~p", [_Msg]),
	SQL = io_lib:format(
		"replace into player_daily2 values (~p,~p,~p,~p,~p)",
		[RoleID_A, RoleID_B, Daily2Type, LastUpdateTime, Counter]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("replace player_daily2", Ret, SQL),
	ok;
saveDaily2Data({?DBOPT_DELETE, #rec_player_daily2{
	roleID_A = RoleID_A,
	roleID_B = RoleID_B,
	daily2Type = Daily2Type
}} = _Msg) ->
	%?DEBUG_OUT("[DebugForDaily2] saveDaily2Data ~p", [_Msg]),
	SQL = io_lib:format(
		"delete from player_daily2 where roleID_A=~p and roleID_B=~p and daily2Type=~p",
		[RoleID_A, RoleID_B, Daily2Type]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("delete player_daily2", Ret, SQL),
	ok.

%% 双角色相关的每日计数 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 姻缘系统 begin

-spec saveMarriageData(Data::term()) -> ok.
saveMarriageData({
	#rec_marriage{
		roleID = RoleID_A,
		targetRoleID = TargetRoleID_A,
		closeness = Closeness_A,
		timeRelation = TimeRelation_A,
		ringTop = RingTop_A,
		ringExp = RingExp_A
	}, #rec_marriage{
		roleID = RoleID_B,
		targetRoleID = TargetRoleID_B,
		closeness = Closeness_B,
		timeRelation = TimeRelation_B,
		ringTop = RingTop_B,
		ringExp = RingExp_B
	}}) ->
	SQL = io_lib:format(
		"replace into marriage values (~p,~p,~p,~p,~p,~p),(~p,~p,~p,~p,~p,~p)",
		[
			RoleID_A, TargetRoleID_A, Closeness_A, TimeRelation_A, RingTop_A, RingExp_A,
			RoleID_B, TargetRoleID_B, Closeness_B, TimeRelation_B, RingTop_B, RingExp_B
		]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("replace marriage", Ret, SQL),
	ok;
saveMarriageData(
	#rec_marriage{
		roleID = RoleID_A,
		targetRoleID = TargetRoleID_A,
		closeness = Closeness_A,
		timeRelation = TimeRelation_A,
		ringTop = RingTop_A,
		ringExp = RingExp_A
	}
) ->
	SQL = io_lib:format(
		"replace into marriage values (~p,~p,~p,~p,~p,~p)",
		[
			RoleID_A, TargetRoleID_A, Closeness_A, TimeRelation_A, RingTop_A, RingExp_A
		]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("replace marriage", Ret, SQL),
	ok;
saveMarriageData(
	#rec_marriage_skill{
		roleID = RoleID,
		slotID = SlotID,
		slotExp = SlotExp
	}
) ->
	SQL = io_lib:format(
		"replace into marriage_skill values (~p,~p,~p)",
		[RoleID, SlotID, SlotExp]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("replace marriage_skill", Ret, SQL),
	ok;
saveMarriageData(
	RoleID
) when erlang:is_integer(RoleID) ->
	SQL1 = io_lib:format(
		"delete from marriage where roleID=~p",
		[RoleID]
	),
	Ret1 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL1),
	dbMemCache:logResult("delete marriage", Ret1, SQL1),
	SQL2 = io_lib:format(
		"delete from marriage_skill where roleID=~p",
		[RoleID]
	),
	Ret2 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL2),
	dbMemCache:logResult("delete marriage_skill", Ret2, SQL2),
	ok.

%% 姻缘系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 新版骑宠领地 begin

-spec savePetTerritoryData({DBOPT::type_dbopt(), Data::term()}) -> ok.

%% 更新骑宠数据
savePetTerritoryData({?DBOPT_UPDATE, #rec_player_territory_pet{
	roleID		= RoleID,
	petID		= PetID,
	petLevel	= PetLevel,
	territoryID	= TerritoryID,
	petForce	= PetForce,
	prop		= Prop,
	skill		= Skill,
	star		= Star,
	raw			= Raw
}}) ->
	SQL = io_lib:format(
		"update player_territory_pet set petLevel=~w,territoryID=~w,petForce=~w,prop='~ts',skill='~ts',star=~w,raw=~w where roleID=~w and petID=~w",
		[PetLevel, TerritoryID, PetForce, misc:term_to_string(Prop), misc:term_to_string(Skill), RoleID, PetID, Star, Raw]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("update player_territory_pet", Ret, SQL),
	ok;

%% 插入骑宠数据
savePetTerritoryData({?DBOPT_INSERT, #rec_player_territory_pet{
	roleID		= RoleID,
	petID		= PetID,
	petLevel	= PetLevel,
	territoryID	= TerritoryID,
	petForce	= PetForce,
	prop		= Prop,
	skill		= Skill,
	star		= Star,
	raw			= Raw
}}) ->
	SQL = io_lib:format(
		"insert into player_territory_pet values (~p,~p,~p,~p,~p,'~ts','~ts',~w,~w)",
		[RoleID, PetID, PetLevel, TerritoryID, PetForce, misc:term_to_string(Prop), misc:term_to_string(Skill), Star, Raw]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert player_territory_pet", Ret, SQL),
	ok;

%% 删除骑宠数据
savePetTerritoryData({?DBOPT_DELETE, #rec_player_territory_pet{
	roleID	= RoleID,
	petID	= PetID
}}) ->
	SQL = io_lib:format(
		"delete from player_territory_pet where roleID=~p and petID=~p",
		[RoleID, PetID]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("delete player_territory_pet", Ret, SQL),
	ok;

%% 插入领地数据
savePetTerritoryData({?DBOPT_INSERT, #rec_player_territory{
	roleID			= RoleID,
	territoryID		= TerritoryID,
	cfgReward		= CfgReward,
	cfgTime			= CfgTime,
	cfgLevel		= CfgLevel,
	cfgForce		= CfgForce,
	timeFresh		= TimeFresh,
	timeEnd			= TimeEnd,
	rewardCount1	= RewardCount1,
	rewardCount2	= RewardCount2,
	timeSafe		= TimeSafe,
	timeSearch		= TimeSearch
}}) ->
	SQL = io_lib:format(
		"insert into player_territory values (~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p)",
		[RoleID, TerritoryID, CfgReward, CfgTime, CfgLevel, CfgForce, TimeFresh, TimeEnd, RewardCount1, RewardCount2, TimeSafe, TimeSearch]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert player_territory", Ret, SQL),
	ok;

%% 更新领地数据
savePetTerritoryData({?DBOPT_UPDATE, #rec_player_territory{
	roleID			= RoleID,
	territoryID		= TerritoryID,
	timeFresh		= TimeFresh,
	rewardCount1	= RewardCount1,
	rewardCount2	= RewardCount2,
	timeSafe		= TimeSafe,
	timeSearch		= TimeSearch
}}) ->
	SQL = io_lib:format(
		"update player_territory set timeFresh=~p,rewardCount1=~p,rewardCount2=~p,timeSafe=~p,timeSearch=~p where roleID=~p and territoryID=~p",
		[TimeFresh, RewardCount1, RewardCount2, TimeSafe, TimeSearch, RoleID, TerritoryID]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("update player_territory", Ret, SQL),
	ok;

%% 删除领地数据
savePetTerritoryData({?DBOPT_DELETE, #rec_player_territory{
	roleID		= RoleID,
	territoryID	= TerritoryID
}}) ->
	SQL = io_lib:format(
		"delete from player_territory where roleID=~p and territoryID=~p",
		[RoleID, TerritoryID]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("delete player_territory", Ret, SQL),
	ok;

%% 插入掠夺记录
savePetTerritoryData({?DBOPT_INSERT, #rec_player_territory_history_a{
	roleID			= RoleID,
	timeEvent		= TimeEvent,
	targetRoleID	= TargetRoleID,
	territoryID		= TerritoryID,
	cfgReward		= CfgReward,
	count1			= Count1,
	count2			= Count2
}}) ->
	SQL = io_lib:format(
		"insert into player_territory_history_a values(~p,~p,~p,~p,~p,~p,~p)",
		[RoleID, TimeEvent, TargetRoleID, TerritoryID, CfgReward, Count1, Count2]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert player_territory_history_a", Ret, SQL),
	ok;

%% 插入防守记录
savePetTerritoryData({?DBOPT_INSERT, #rec_player_territory_history_d{
	roleID			= RoleID,
	timeEvent		= TimeEvent,
	targetRoleID	= TargetRoleID,
	territoryID		= TerritoryID,
	cfgReward		= CfgReward,
	count1			= Count1,
	count2			= Count2
}}) ->
	SQL = io_lib:format(
		"insert into player_territory_history_d values(~p,~p,~p,~p,~p,~p,~p)",
		[RoleID, TimeEvent, TargetRoleID, TerritoryID, CfgReward, Count1, Count2]
	),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult("insert player_territory_history_d", Ret, SQL),
	ok;

%% 删除攻防数据
savePetTerritoryData({?DBOPT_DELETE, TimeLine}) ->
	SQL1 = io_lib:format(
		"delete from player_territory_history_a where timeEvent<~p",
		[TimeLine]
	),
	Ret1 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL1),
	dbMemCache:logResult("delete player_territory_history_a", Ret1, SQL1),
	SQL2 = io_lib:format(
		"delete from player_territory_history_d where timeEvent<~p",
		[TimeLine]
	),
	Ret2 = emysql:execute(?GAMEDB_CONNECT_POOL, SQL2),
	dbMemCache:logResult("delete player_territory_history_d", Ret2, SQL2),
	ok.

%% 新版骑宠领地 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
