%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三科技
%%% @doc
%%%
%%% @end
%%% Created : 03. 七月 2014 17:49
%%%-------------------------------------------------------------------
-module(dbGSSave).
-author("ZhongYuanWei").

-include("dbPrivate.hrl").

%% API
-export([initGSSavePrepare/0]).

-export([
	createRole/5,
	deleteRole/1,
	saveRole/1,
	deleteBuff/1,
	changeGoodsOwner/3,
	changeRuneOwner/3,
	saveRoleDenyChatTime/1,
	saveActiveCode4Role/2,
	updateActiveCodeInGlobal/5,
	saveVariant/1,
	saveCopyMapHighestScore/1,
	setBindPhoneNum/2,
	saveRoleLoginTime/1,
	saveRoleLogoutTime/1,
	deleteTeamInfo/1,
	deleteTeamID/2,
	saveNameName/2,
	deleteTitle/2,
	deletePet/2,
	deletePetSkill/2,
	revokeRoleMoney/1,
	revokeRoleItem/2,
	revokeRoleReputation/3,
	savePlayerFindRes/2,
	savePlayerRuneData/1,
	insertRedenvelope/1,
	updateRedenvelope/1,
	clearRedEnvelope/0,
	deleteRedEnvelope/1,
	setlockNewRace/1
]).

-spec initGSSavePrepare() -> ok.
initGSSavePrepare() ->
	emysql:prepare(stUpdateActiveCode,"call updateGetedActiveCode(?,?,?,?,?,@OutResult)"),
	emysql:prepare(stInsertRole,"call InsertRole(?,?,?,?,?,?,?,?,?,?,?,@RoleID)"),
	emysql:prepare(stDeleteRole,"call DeleteRole(?)"),
	emysql:prepare(stDeleteBuff, "call deleteBuff(?)"),
	emysql:prepare(stClean1RubbishRoleAllData,"call clean1RubbishRoleAllData(?)"),

	emysql:prepare(stSaveRoleDenyChatTime, "call saveDenyChatTime(?,?)" ),
	emysql:prepare(stSaveVariant,"call saveVariant(?,?,?)"),
	emysql:prepare(stAddUsedActiveCode4Role, "call addUsedActiveCode4Role(?,?)" ),

	emysql:prepare(stSaveComedMapID4Role, "call addComedMapID4Role(?,?)" ),
	emysql:prepare(stSaveAwaken,"call saveAwaken(?,?,?,?)"),
	emysql:prepare(stSaveCopyMapMaxScore,"call saveCopyMapMaxScore(?,?,?)"),
	emysql:prepare(stSaveRoleLoginTime,"call saveRoleLoginTime(?,?,?)"),
	emysql:prepare(stSetBindPhoneNum,"CALL setBindPhoneNum(?,?)"),
	emysql:prepare(stDelPlayerClock,"call delPlayerClock(?,?)"),
	emysql:prepare(stDeleteTeamInfo,"call deleteTeamInfo(?)"),
	emysql:prepare(stDeleteTeamID,"call deleteTeamID(?,?)"),
	emysql:prepare(stSavePersonalityInfo,"call savePersonalityInfo(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"),
	emysql:prepare(stdeleteTitle,<<"delete from title where roleID = ? and titleID =?">>),
	emysql:prepare(stdeletePet, <<"delete from pet_info where roleID = ? and petID =?">>),
	emysql:prepare(stdeletePetSkill, <<"delete from pet_skill where roleID = ? and petID =?">>),
	emysql:prepare(stInsertRedEnvelope, <<"INSERT INTO redenvelope(redUID,creator,targetUID,targetType,redType,allNumber,takeNumber
		,moneyType,allMoney,takeMoney,createTime,deadlineTime,luckContent) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)">>),
	emysql:prepare(stUpdateRedEnvelope, <<"update redenvelope set takeMoney=?,takeNumber=? where redUID=?">>),
	emysql:prepare(stDeleteRedEnvelope, <<"delete from redenvelope where redUID=?">>),
	ok.

-spec saveCopyMapHighestScore(#recCopyMapScore{}) -> ok.
saveCopyMapHighestScore(#recCopyMapScore{roleID = RoleID, copyMapID = CopyMapID, maxScore = Score}) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stSaveCopyMapMaxScore, [RoleID,CopyMapID,Score]),
	libDB:logExecResult(stSaveCopyMapMaxScore,RoleID,Ret),
	ok.

%%修改红包剩余
clearRedEnvelope() ->
	SQL = <<"delete from redenvelope">>,
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	libDB:logResult(clearRedEnvelope,Ret,SQL,0),
	ok.

%%修改红包剩余
deleteRedEnvelope(RedUID) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stDeleteRedEnvelope, [RedUID]),
	libDB:logExecResult(stUpdateRedEnvelope,RedUID,Ret),
	ok.

%%修改红包剩余
-spec updateRedenvelope(Row::#rec_redenvelope{}) ->ok.
updateRedenvelope(Row) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stUpdateRedEnvelope,
		[
			Row#rec_redenvelope.takeMoney,
			Row#rec_redenvelope.takeNumber,
			Row#rec_redenvelope.redUID
		]),
	libDB:logExecResult(stUpdateRedEnvelope,Row#rec_redenvelope.redUID,Ret),
	ok.

%%保存红包配置
-spec insertRedenvelope(Row::#rec_redenvelope{}) ->ok.
insertRedenvelope(Row) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stInsertRedEnvelope,
		[
			Row#rec_redenvelope.redUID,
			Row#rec_redenvelope.creator,
			Row#rec_redenvelope.targetUID,
			Row#rec_redenvelope.targetType,
			Row#rec_redenvelope.redType,
			Row#rec_redenvelope.allNumber,
			Row#rec_redenvelope.takeNumber,
			Row#rec_redenvelope.moneyType,
			Row#rec_redenvelope.allMoney,
			Row#rec_redenvelope.takeMoney,
			Row#rec_redenvelope.createTime,
			Row#rec_redenvelope.deadlineTime,
			Row#rec_redenvelope.luckContent
		]),
	?LOG_OUT("saveRedenvelope roleid:~p,redUID:~p",[Row#rec_redenvelope.creator,Row#rec_redenvelope.redUID]),
	libDB:logExecResult(stInsertRedEnvelope,Row#rec_redenvelope.creator,Ret),
	ok.

%%保存玩家变量
saveRole(#rec_variant0{} = Variant) ->
	saveVariant(Variant),
	ok;

saveRole([]) ->
	ok;
saveRole(List) when erlang:is_list(List) ->
	[saveRole(X) || X <- List],
	ok;

saveRole(Unknown) ->
	?ERROR_OUT("Save Role unknown[~p] in Moudle[~p]",[Unknown,?MODULE]),
	ok.

%创建角色
-spec createRole(AccountID,NewRoleID, GameServerID,#pk_U2GS_RequestCreatePlayer{},PlatFormName::string()) -> RoleID when
	AccountID::uint(),NewRoleID::uint(),GameServerID::uint(),RoleID::uint().
createRole(AccountID,NewRoleID, GameServerID,
	#pk_U2GS_RequestCreatePlayer{name = Name,
		camp = Camp,
		career = Career,
		race = Race,
		sex = Sex, head = Head},
	PlatFormName) when erlang:is_integer(AccountID) andalso AccountID > 0 ->
	Time = time:getLocalNowSec1970(),
	TimeStr = time:int64ToTimeString(Time),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
		stInsertRole,
		[
			AccountID,
			NewRoleID,
			Name,
			TimeStr,
			GameServerID,
			Camp,
			Race,
			Career,
			Sex,
			Head,
			PlatFormName
		]),
	?DEBUG_OUT("createRole:~p,~p,~ts,~ts,~p,~p,~p,~p,~p,~ts", [AccountID, NewRoleID,Name, TimeStr, GameServerID, Camp, Race, Career, Sex, PlatFormName]),
	%%存储过程返回值为0则表示名字重复，正常情况下为一个正数，
	%%所以内部失败我们采用一个负数去表示
	%%-1表示存储过程应该返回两个结果集，但实际只有一个结果集
	%%-2表示获取第二个结果集失败
	RoleID = case mysql:nextResult(Ret) of
				 {Result,_LeftResult} ->
					 Row = mysql:firstRow(Result),
					 RID = mysql:getFieldValue(1, Row),
					 RID;
				 _ ->
					 -1
			 end,
	?LOG_OUT("AccountID[~p] createRole[~ts] RoleID[~p]",[AccountID, Name, RoleID]),
	RoleID.

%%删除角色
-spec deleteRole(RoleID) -> #recDeleteRoleAck{} when RoleID::uint().
deleteRole(RoleID) when erlang:is_integer(RoleID) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stDeleteRole, [RoleID]),
	{Result1,LeftResult1} = mysql:nextResult(Ret),
	RoleInfoList = emysql_util:as_record(Result1, rec_base_role, record_info(fields, rec_base_role)),
	{Result2,_LeftResult2} = mysql:nextResult(LeftResult1),
	CoinList = emysql_util:as_record(Result2, rec_player_coin, record_info(fields, rec_player_coin)),
	case RoleInfoList of
		[#rec_base_role{level = Level}|_] ->
			#recDeleteRoleAck{
				isOK = true,			%%是否成功
				roleID = RoleID,		%%角色ID
				level = Level,			%%等级
				gold = getCoinFromList(?CoinTypeGold, CoinList),			%%金币
				bindGold = 0,	%%绑定金币
				diamond = getCoinFromList(?CoinTypeDiamond, CoinList),		%%钻石币
				bindDiamond = getCoinFromList(?CoinTypeBindDiamond, CoinList),		%%绑定钻石
				prestige = getCoinFromList(?CoinTypePrestige, CoinList),
				honor = getCoinFromList(?CoinTypeHonor, CoinList),
				purpleEssence = getCoinFromList(?CoinTypePurpleEssence, CoinList),
				goldenEssence = getCoinFromList(?CoinTypeGoldenEssence, CoinList)
			};
		_ ->
			#recDeleteRoleAck{
				isOK = false,			%%是否成功
				roleID = RoleID		    %%角色ID
			}
	end.

getCoinFromList(Key, CoinList) ->
	case lists:keyfind(Key, #rec_player_coin.coinType, CoinList) of
		#rec_player_coin{coinNumber = Value} -> Value;
		_ -> 0
	end.

%% 删除buff
-spec deleteBuff(RoleID) -> boolean() when
	RoleID :: non_neg_integer().
deleteBuff(RoleID) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
		stDeleteBuff,
		[RoleID
		]),
	libDB:logExecResult(stDeleteBuff,RoleID,Ret),
	true.

%% 改变符文拥有者
-spec changeRuneOwner(RuneUID::uint64(), NowOwnerID::uint64(), TargetOwnerID::uint64()) -> boolean().
changeRuneOwner(RuneUID, ?Trade_Role_ID = NowOwnerID, ?Mail_Role_ID = TargetOwnerID) ->
	case edb:dirtyReadRecord(recRune, RuneUID) of
		[#recRune{roleID = NowOwnerID} = Rune] ->
			NewRune = Rune#recRune{roleID = TargetOwnerID},
			edb:dirtyWriteRecord(NewRune),
			savePlayerRuneData({NewRune, 2}),
			ok;
		Error ->
			?ERROR_OUT("changeRuneOwner not find RuneUID=~p, NowOwnerID=~p, TargetOwnerID=~p,~p",
				[RuneUID, NowOwnerID, TargetOwnerID, Error]),
			false
	end;
changeRuneOwner(RuneUID, NowOwnerID, TargetOwnerID) ->
	?ERROR_OUT("changeRuneOwner RuneUID=~p, NowOwnerID=~p, TargetOwnerID=~p",
		[RuneUID, NowOwnerID, TargetOwnerID]),
	false.

%%修改物品的拥有者
-spec changeGoodsOwner(GoodsUID::uint64(), CurOwnerID::uint64(), ToOwnerID::uint64()) -> ok.
changeGoodsOwner(GoodsUID,CurOwnerID,ToOwnerID) ->
	F = fun() ->
		case mnesia:read(rec_item,GoodsUID,write) of
			[#rec_item{roleID = RoleID} = Item] ->
				case RoleID =:= CurOwnerID of
					true ->
						NewItem = Item#rec_item{roleID = ToOwnerID},
						%%写入缓存数据库
						mnesia:write(NewItem),
						NewItem;
					_ ->
						RoleID
				end;
			_ ->
				1
		end
		end,
	case mnesia:transaction(F) of
		{atomic, Val} ->
			case Val of
				#rec_item{} ->
					dbItemSave:save_item_data(update, Val),
					skip;
				1 ->
					?ERROR_OUT("Module=~p, Error change Goods:~p CurOwner:~p ToOwner:~p not found in memdb",[?MODULE, GoodsUID,CurOwnerID,ToOwnerID]);
				_ ->
					?ERROR_OUT("Module=~p, Error change Goods:~p CurOwner:~p ToOwner:~p,Real CurOwner Is:~p",[?MODULE, GoodsUID,CurOwnerID,ToOwnerID,Val])
			end;
		Error ->
			?WARN_OUT("Module=~p, changeGoodsOwner Error:~p",[?MODULE, Error])
	end,
	ok.

%% 保存玩家的禁言时间
saveRoleDenyChatTime({DenyRoleID, DenyChatTime}) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
		stSaveRoleDenyChatTime,
		[DenyRoleID,
			DenyChatTime]),
	%% FIXME 是否需要处理返回值
%% 	{_Result1,LeftResult} = mysql:nextResult(Ret),
%% 	{Result2,_LeftResult} = mysql:nextResult(LeftResult),
%% 	Row = mysql:firstRow(Result2),
%% 	OutRet = mysql:getFieldValue(1, Row),
%% 	OutRet.
	libDB:logResult(stSaveRoleDenyChatTime, Ret, "RoleID ~p, DateTime ~p", [DenyRoleID, DenyChatTime]),
	ok.

%%记录玩家已经领取了的万能码id
-spec saveActiveCode4Role(RoleID,ActiveCodeID) ->ok|err when
	RoleID::integer(),ActiveCodeID::integer().
saveActiveCode4Role(RoleID,ActiveCodeID) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stAddUsedActiveCode4Role, [RoleID, ActiveCodeID]),
	libDB:logExecResult(stAddUsedActiveCode4Role,RoleID,Ret),
	case Ret of
		#ok_packet{} -> ok;
		_ -> err
	end.

%% 保存角色登陆时间
saveRoleLoginTime(RoleID) ->
	Time = time:getLocalNowSec1970(),
	TimeStr = time:int64ToTimeString(Time),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
		stSaveRoleLoginTime,
		[
			1,       %%1表示登录时间
			RoleID,
			TimeStr
		]),
	libDB:logExecResult(stSaveRoleLoginTime,RoleID,Ret),
	ok.

%% 保存角色登出时间
saveRoleLogoutTime(RoleID) ->
	Time = time:getLocalNowSec1970(),
	TimeStr = time:int64ToTimeString(Time),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,
		stSaveRoleLoginTime,
		[
			0,       %%0表示登出时间
			RoleID,
			TimeStr
		]),
	%%由于登出与登录使用的同一个存储过程，这里把Log记录的原子改一下，以示区别
	libDB:logExecResult(stSaveRoleLogoutTime,RoleID,Ret),
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================


%%保存变量
saveVariant(#rec_variant0{roleID = RoleID, index = Index, value = Value}) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stSaveVariant,[RoleID, Index, Value]),
	libDB:logExecResult(stSaveVariant,RoleID,Ret),
	ok.
-spec setBindPhoneNum(AccountID, PhoneNum) -> ok when
	AccountID::uint(),
	PhoneNum::uint().
%%设置角色绑定手机号
setBindPhoneNum(AccountID, PhoneNum) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stSetBindPhoneNum,[AccountID, PhoneNum]),
	libDB:logResult(stSetBindPhoneNum,Ret,"AccountID:",AccountID),
	ok.

%%删除队伍信息
-spec deleteTeamInfo(TeamID) -> ok when TeamID::uint64().
deleteTeamInfo(TeamID) ->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stDeleteTeamInfo,[TeamID]),
	libDB:logResult(stDeleteTeamInfo,Ret,"TeamID:",TeamID),
	ok.

%%删除队伍ID
deleteTeamID(RoleID,TeamID) ->
	?DEBUG_OUT("deleteTeamID RoleID = ~p,TeamID = ~p", [RoleID,TeamID]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stDeleteTeamID,[RoleID, TeamID]),
	libDB:logResult(stDeleteTeamID,Ret,"RoleID:",RoleID),
	ok.

%%更新激活码信息(0为成功；-1为失败)
updateActiveCodeInGlobal(ActiveCode, RoleID, AccountID, PlatformAccountID, PlatformID)->
	Ret = emysql:execute(?ACTIVECODEDB_CONNECT_POOL, stUpdateActiveCode,
		[ActiveCode, RoleID, AccountID, PlatformAccountID, PlatformID]),
	Result =
		case mysql:nextResult(Ret) of
			{FirstRow,_LeftResult} ->
				Row = mysql:firstRow(FirstRow),
				mysql:getFieldValue(1, Row);
			_ ->
				-1
		end,
	?LOG_OUT("updateActiveCodeInGlobal ~p,~p", [{ActiveCode, RoleID, AccountID, PlatformAccountID, PlatformID}, Result]),
	Result.

%%保存新名字
-spec saveNameName(RoleID::uint(), NewName::string()) -> ok.
saveNameName(RoleID, NewName) ->
	SQL = "UPDATE base_role Set roleName = ? WHERE roleID = ?",
	emysql:prepare(stSaveNameName, SQL),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stSaveNameName, [NewName, RoleID]),
	case Ret of
		#ok_packet{} ->
			?LOG_OUT("roleID[~p] save new name[~ts] success.",[RoleID, NewName]);
		Error ->
			?ERROR_OUT("exec[~ts] Error[~p]", [SQL, Error])
	end,
	ok.

deleteTitle(RoleID,TitleID)->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stdeleteTitle, [RoleID, TitleID]),
	case Ret of
		#ok_packet{} ->ok;
		Error ->
			?ERROR_OUT("exec[stdeleteTitle] Error[~p]", [Error])
	end,
	ok.

deletePet(RoleID, PetID)->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stdeletePet, [RoleID, PetID]),
	case Ret of
		#ok_packet{} ->
			?LOG_OUT("exec[stdeletePet] succ[~p]", [ok]),
			ok;
		Error ->
			?ERROR_OUT("exec[stdeletePet] Error[~p]", [Error])
	end,
	ok.

deletePetSkill(RoleID, PetID)->
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, stdeletePetSkill, [RoleID, PetID]),
	case Ret of
		#ok_packet{} ->
			?LOG_OUT("exec[stdeletePetSkill] succ[~p]", [ok]),
			ok;
		Error ->
			?ERROR_OUT("exec[stdeletePetSkill] Error[~p]", [Error])
	end,
	ok.


%%扣钻石等
-spec revokeRoleMoney(List::[#rec_player_coin{}]) ->ok.
revokeRoleMoney(List) ->
	?WARN_OUT("revokeRoleMoney ~p",[List]),
	Fun =
		fun(#rec_player_coin{
			roleID = {RoleID,CoinType},
			coinType = CoinType,
			coinNumber = Value
		}) ->
			SQL = io_lib:format("update player_coin set coinNumber=coinNumber-~p where roleID=~p and coinType=~p",[Value,RoleID,CoinType]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			libDB:logResult('update player_coin',Ret,SQL,RoleID)
		end,
	lists:foreach(Fun,List),
	ok.

%%扣除爵位经验
revokeRoleReputation(_Old,Dec,RoleID) ->
	SQL = io_lib:format("update base_role set reputation=reputation-~p where roleID=~p",[Dec,RoleID]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
	libDB:logResult('revokeRoleReputation',Ret,SQL,RoleID),
	ok.

getEMysqlNowDateTime() ->
	Sec = time2:getLocalDateTimeSec(),
	DateTime = time:convertSec2DateTime(Sec),
	{datetime,DateTime}.
convert2MysqlDateTimeStr(0) ->
	"1970-01-01 00:00:00";
convert2MysqlDateTimeStr({datetime,{{Y,M,D},{H,Min,S}}}) ->
	io_lib:format("~p/~p/~p ~p:~p:~p",[Y,M,D,H,Min,S]).
%%扣除装备或物品,物品传{itemid,num};装备传UID
revokeRoleItem(List,RoleID) ->
	?WARN_OUT("revokeRoleItem ~p",[List]),
	Fun =
		fun({UID,_ID,Num,Dec} ) when erlang:is_integer(Num),erlang:is_integer(Dec),(Num-Dec) <1 ->
			SQL = io_lib:format("update item set deleteTime='~ts' where itemUID=~p and roleID=~p",[convert2MysqlDateTimeStr(getEMysqlNowDateTime()),UID,RoleID]),
			Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
			libDB:logResult('update item',Ret,SQL,RoleID),
			edb:deleteRecord(rec_item,UID);
			({UID,_ID,Num,Dec} ) ->
				SQL = io_lib:format("update item set pileNum=~p where itemUID=~p and roleID=~p",[Num-Dec,UID,RoleID]),
				Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
				libDB:logResult('update item',Ret,SQL,RoleID),
				case edb:readRecord(rec_item, UID) of
					ItemData when erlang:is_record(ItemData, rec_item)->
						NewItemData = ItemData#rec_item{pileNum =Num},
						edb:deleteRecord(rec_item,UID),
						edb:writeRecord(rec_item, NewItemData);
					_ ->skip
				end
		end,
	lists:foreach(Fun,List),
	ok.

%% 保存资源找回
savePlayerFindRes(#rec_player_find_res{roleID = {RoleID, ACID}, activityID = ACID, param1 = P1, param2 = P2, freshtime = FT}, 0) ->
	%% 插入
	SQL = io_lib:format("INSERT INTO player_find_res (roleID, activityID, param1, param2, freshtime) VALUES (~p,~p,~p,~p,~p)",
		[RoleID, ACID, P1, P2, FT]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	libDB:logResult('savePlayerFindRes insert',Ret,SQL,RoleID),
	ok;
savePlayerFindRes(#rec_player_find_res{roleID = {RoleID, ACID}, activityID = ACID, param1 = P1, param2 = P2, freshtime = FT}, 1) ->
	%% 更新
	SQL = io_lib:format("UPDATE player_find_res pfr set pfr.param1 = ~p, pfr.param2 = ~p, pfr.freshtime = ~p WHERE pfr.roleID = ~p AND pfr.activityID = ~p",
		[P1, P2, FT, RoleID, ACID]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	libDB:logResult('savePlayerFindRes update',Ret,SQL,RoleID),
	ok.


%% 符文存储
savePlayerRuneData({#recRune{runeUID = RuneUID} = Rec, 0}) ->
	%% 插入
	PropSQL = getRunePropSQL(Rec),
	SQL = io_lib:format("INSERT INTO rune_base (runeUID, runeID, roleID, subOwnerID, level, exp, isBind, createTime, deleteTime, expiredTime)
	                        VALUES (~p,~p,~p,~p,~p,~p,~p,'~ts','~ts','~ts');~ts",
		[
			RuneUID,
			Rec#recRune.runeID,
			Rec#recRune.roleID,
			Rec#recRune.subOwnerID,
			Rec#recRune.level,
			Rec#recRune.exp,
			misc:convertBool2Int(Rec#recRune.isBind),
			runeInt64ToTimeString(Rec#recRune.createTime),
			runeInt64ToTimeString(Rec#recRune.deleteTime),
			runeInt64ToTimeString(Rec#recRune.expiredTime),
			PropSQL
		]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	libDB:logResult('savePlayerRuneData insert',Ret,SQL,RuneUID),
	ok;
savePlayerRuneData({#recRune{runeUID = RuneUID} = Rec, 1}) ->
	%% 更新所有
	PropSQL = getRunePropSQL(Rec),
	SQL = io_lib:format("UPDATE rune_base rb SET
						    rb.roleID = ~p,
						    rb.subOwnerID = ~p,
						    rb.level = ~p,
						    rb.exp = ~p,
						    rb.isBind = ~p,
						    rb.createTime = '~ts',
						    rb.deleteTime = '~ts',
						    rb.expiredTime = '~ts' WHERE rb.runeUID = ~p;~ts",
		[
			Rec#recRune.roleID,
			Rec#recRune.subOwnerID,
			Rec#recRune.level,
			Rec#recRune.exp,
			misc:convertBool2Int(Rec#recRune.isBind),
			runeInt64ToTimeString(Rec#recRune.createTime),
			runeInt64ToTimeString(Rec#recRune.deleteTime),
			runeInt64ToTimeString(Rec#recRune.expiredTime),
			RuneUID,
			PropSQL
		]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	libDB:logResult('savePlayerRuneData update1',Ret,SQL,RuneUID),
	ok;
savePlayerRuneData({#recRune{runeUID = RuneUID} = Rec, 2}) ->
	%% 更新基础
	SQL = io_lib:format("UPDATE rune_base rb SET
						    rb.roleID = ~p,
						    rb.subOwnerID = ~p,
						    rb.level = ~p,
						    rb.exp = ~p,
						    rb.isBind = ~p,
						    rb.createTime = '~ts',
						    rb.deleteTime = '~ts',
						    rb.expiredTime = '~ts' WHERE rb.runeUID = ~p;",
		[
			Rec#recRune.roleID,
			Rec#recRune.subOwnerID,
			Rec#recRune.level,
			Rec#recRune.exp,
			misc:convertBool2Int(Rec#recRune.isBind),
			runeInt64ToTimeString(Rec#recRune.createTime),
			runeInt64ToTimeString(Rec#recRune.deleteTime),
			runeInt64ToTimeString(Rec#recRune.expiredTime),
			RuneUID
		]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	libDB:logResult('savePlayerRuneData update2',Ret,SQL,RuneUID),
	ok;
savePlayerRuneData({#recRune{runeUID = RuneUID} = Rec, 3}) ->
	%% 更新属性
	PropSQL = getRunePropSQL(Rec),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, PropSQL),
	libDB:logResult('savePlayerRuneData update3',Ret,PropSQL,RuneUID),
	ok;
savePlayerRuneData({RuneUID, 4}) when erlang:is_integer(RuneUID) andalso RuneUID > 0 ->
	%% 更新属性
	DelSQL = io_lib:format("DELETE FROM rune_prop WHERE runeUID = ~p;DELETE FROM rune_base WHERE runeUID = ~p;", [RuneUID, RuneUID]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, DelSQL),
	libDB:logResult('savePlayerRuneData delete',Ret,DelSQL,RuneUID),
	ok;
savePlayerRuneData(ErrorMatch) ->
	?ERROR_OUT("savePlayerRuneData:~p", [ErrorMatch]),
	ok.

runeInt64ToTimeString(Time) ->
	case Time > 0 of
		true ->
			time:convertTimeStamp2DateTimeStr(Time);
		_ ->
			"1970-01-01 00:00:00"
	end.

getRunePropSQL(#recRune{runeUID = RuneUID, baseProps = Bases, randProps = Rands}) ->
	Fun =
		fun(#recRuneProp{
			propType = PropType,
			propKey = PropKey,
			propValue = PropValue,
			calcType = CalcType
		},AccIn) ->
			io_lib:format(",(~p,~p,~p,~p,~p)", [RuneUID,PropType,PropKey,PropValue,CalcType]) ++ AccIn
		end,
	case lists:foldl(Fun, [], Bases ++ Rands) of
		[] -> "";
		[_|T] ->
			io_lib:format("DELETE FROM rune_prop WHERE runeUID = ~p;INSERT INTO rune_prop (runeUID, propType, propKey, propValue, calcType)
				VALUES ~ts;", [RuneUID, T])
	end.


setlockNewRace({AccountID, Val}) ->
	%% 插入
	SQL = io_lib:format("update account set unlockNewRace = ~p where accountID=~p",
		[Val, AccountID]),
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	libDB:logResult('update account unlockRace',Ret,SQL, {Val, AccountID}),
	ok.


