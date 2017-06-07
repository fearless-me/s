%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三科技
%%% @doc
%%%
%%% @end
%%% Created : 08. 七月 2014 11:56
%%%-------------------------------------------------------------------
-module(dbMsg).
-author("ZhongYuanWei").

-include("dbPrivate.hrl").
-include("gsDef.hrl").

%% API
-export([handle_msg/2]).

%% 服务器监控消息
handle_msg({server_monitor_msg, _Pid, {_PidFrom, {_Type, _Value}}}, State)->
	%UTCTime = time:getSyncUTCTimeFromDBS(),

%%	%% 写入数据库
%%	SQL = io_lib:format("REPLACE INTO monitor (m_type, m_value, m_time) VALUES (~p,~p,~p)", [Type, Value, UTCTime]),
%%	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
%%	Desc = io_lib:format("REPLACE INTO monitorType:~p, Value:~p, UTCTime:~p", [Type, Value, UTCTime]),
%%	dbMemCache:logResult(Desc, Ret, SQL),
	{noreply, State};

%%======================================================================================================================
%%数据统一管理，加载玩家数据
handle_msg({loadUserAccount, _Pid, {PidFromGS, _}}, State)->
	Ret = dbGSDataLoad:loadUserAccount(PidFromGS),
	psMgr:sendMsg2PS(PidFromGS, loadUserAccountAck, Ret),
	{noreply, State};

handle_msg({loadRoleName, _Pid, {PidFromGS, _}}, State)->
	Ret = dbGSDataLoad:loadRoleName(),
	psMgr:sendMsg2PS(PidFromGS, loadRoleNameAck, Ret),
	{noreply, State};

handle_msg({loadIdentity, _Pid, {PidFromGS, _}}, State) ->
	Ret = dbGSDataLoad:loadIdentity(),
	psMgr:sendMsg2PS(PidFromGS, loadIdentityAck, Ret),
	{noreply, State};

handle_msg({loadFriend2, _Pid, {PidFromGS, _}}, State) ->
	Ret = dbGSDataLoad:loadFriend2(),
	psMgr:sendMsg2PS(PidFromGS, loadFriend2Ack, Ret),
	{noreply, State};

handle_msg({loadDaily2, _Pid, {PidFromGS, _}}, State) ->
	Ret = dbGSDataLoad:loadDaily2(),
	psMgr:sendMsg2PS(PidFromGS, loadDaily2Ack, Ret),
	{noreply, State};

handle_msg({loadMarriage, _Pid, {PidFromGS, _}}, State) ->
	Ret = dbGSDataLoad:loadMarriage(),
	psMgr:sendMsg2PS(PidFromGS, loadMarriageAck, Ret),
	{noreply, State};

handle_msg({loadPetTerritory, _Pid, {PidFromGS, _}}, State) ->
	Ret = dbGSDataLoad:loadPetTerritory(),
	psMgr:sendMsg2PS(PidFromGS, loadPetTerritoryAck, Ret),
	{noreply, State};

handle_msg({playerDataCommonMsg, _Pid, {_PidFromGS, Data}}, State)->
	dbGSDataSave:savePlayerData(Data),
	{noreply, State};

handle_msg({updateRole, _Pid, {_PidFromGS, #rec_base_role{} = Role}}, State)->
	dbGSDataSave:savePlayerData(Role),
	{noreply, State};

handle_msg({saveladder1v1data, _Pid, {_PidFromGS, Data}}, State)->
	dbGSDataSave:savePlayerData(Data),
	{noreply, State};

%% 加载公共数据
handle_msg({loadRoleKeyInfo, _Pid, {PidFromGS, RoleID}}, State)->
	dbGSDataLoad:loadRoleKeyInfo(PidFromGS, RoleID),
	{noreply, State};

handle_msg({loadLadder1v1Info, _Pid, {PidFromGS, _}}, State)->
	dbGSDataLoad:loadLadder1v1Info(PidFromGS),
	{noreply, State};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 身份证系统 begin
handle_msg({identity_Update, _Pid, {_PidFromGS, Msg}}, State)->
	%%?DEBUG_OUT("[DebugForIdentity] identity_Update ~p", [Msg]),
	dbGSDataSave:saveIdentityData(identity_Update, Msg),
	{noreply, State};
handle_msg({identity_Insert, _Pid, {_PidFromGS, Msg}}, State)->
	%%?DEBUG_OUT("[DebugForIdentity] identity_Insert ~p", [Msg]),
	dbGSDataSave:saveIdentityData(identity_Insert, Msg),
	{noreply, State};
handle_msg({identity_Delete, _Pid, {_PidFromGS, Msg}}, State)->
	%%?DEBUG_OUT("[DebugForIdentity] identity_Delete ~p", [Msg]),
	dbGSDataSave:saveIdentityData(identity_Delete, Msg),
	{noreply, State};
handle_msg({identity_pic_UpdateCount, _Pid, {_PidFromGS, Msg}}, State)->
	%%?DEBUG_OUT("[DebugForIdentity] identity_pic_UpdateCount ~p", [Msg]),
	dbGSDataSave:savePicData(identity_pic_UpdateCount, Msg),
	{noreply, State};
handle_msg({identity_pic_InsertMain, _Pid, {_PidFromGS, Msg}}, State)->
	%%?DEBUG_OUT("[DebugForIdentity] identity_pic_InsertMain ~p", [Msg]),
	dbGSDataSave:savePicData(identity_pic_InsertMain, Msg),
	{noreply, State};
handle_msg({identity_pic_Active, Pid, {_PidFromGS, Msg}}, State)->
	%%?DEBUG_OUT("[DebugForIdentity] identity_pic_Active ~p", [Msg]),
	dbGSDataSave:savePicData(identity_pic_Active, {Pid, Msg}),
	{noreply, State};
handle_msg({identity_pic_Unactive, _Pid, {_PidFromGS, Msg}}, State)->
	%%?DEBUG_OUT("[DebugForIdentity] identity_pic_Unactive ~p", [Msg]),
	case erlang:is_list(Msg) of
		true ->
			lists:foreach(fun(E) -> dbGSDataSave:savePicData(identity_pic_Unactive, E) end, Msg);
		_ ->
			dbGSDataSave:savePicData(identity_pic_Unactive, Msg)
	end,
	{noreply, State};
handle_msg({identity_picWantDown, _Pid, {_PidFromGS, Msg}}, State)->
	%%?DEBUG_OUT("[DebugForIdentity] identity_picWantDown ~p", [Msg]),
	dbGSDataSave:savePicData(identity_picWantDown, Msg),
	{noreply, State};
%% 身份证系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 新版好友系统 begin
handle_msg({friend2_dbsave, _Pid, {_PidFromGS, Msg}}, State)->
	%?DEBUG_OUT("[DebugForFriend2] friend2_dbsave ~p", [Msg]),
	FunSave =
		fun(P) ->
			dbGSDataSave:saveFriend2Data(P)
		end,
	lists:foreach(FunSave, Msg),
	{noreply, State};
%% 新版好友系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 双角色相关的每日计数 begin
handle_msg({daily2_dbsave, _Pid, {_PidFromGS, Msg}}, State) when erlang:is_list(Msg) ->
	%?DEBUG_OUT("[DebugForDaily2] friend2_dbsave ~p", [Msg]),
	[dbGSDataSave:saveDaily2Data(MsgCell) || MsgCell <- Msg],
	{noreply, State};
handle_msg({daily2_dbsave, _Pid, {_PidFromGS, Msg}}, State) ->
	%?DEBUG_OUT("[DebugForDaily2] friend2_dbsave ~p", [Msg]),
	dbGSDataSave:saveDaily2Data(Msg),
	{noreply, State};
handle_msg({daily2_dbreset, _Pid, {_PidFromGS, _Msg}}, State)->
	%?DEBUG_OUT("[DebugForDaily2] daily2_dbreset"),
	dbGSDataSave:resetDaily2Data(),
	{noreply, State};
%% 双角色相关的每日计数 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 姻缘系统 begin
handle_msg({marriage_dbsave, _Pid, {_PidFromGS, Msg}}, State)->
	FunSave =
		fun(P) ->
			dbGSDataSave:saveMarriageData(P)
		end,
	lists:foreach(FunSave, Msg),
	{noreply, State};
%% 姻缘系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 新版骑宠领地 begin
handle_msg({petTerritory_dbsave, _Pid, {_PidFromGS, Msg}}, State) when erlang:is_list(Msg) ->
	[dbGSDataSave:savePetTerritoryData(MsgCell) || MsgCell <- Msg],
	{noreply, State};
handle_msg({petTerritory_dbsave, _Pid, {_PidFromGS, Msg}}, State) ->
	dbGSDataSave:savePetTerritoryData(Msg),
	{noreply, State};
%% 新版骑宠领地 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%数据统一管理
%%======================================================================================================================


handle_msg({loadRoleList, _Pid, {PidFromGS, {Account, NeedLoadRoles, RoleIDList}}}, State)->
	Objects = databankInit:getRoleAppearance(RoleIDList, false),
	psMgr:sendMsg2PS(PidFromGS, loadRoleListAck, {Account, NeedLoadRoles, Objects}),
	{noreply, State};

handle_msg({loadRoleList, _Pid, {PidFromGS, Account}}, State)->
	Ret = dbGSLoad:getRoleList(Account),
	psMgr:sendMsg2PS(PidFromGS, loadRoleListAck, Ret),
	{noreply, State};

handle_msg({createRole,_Pid,{PidFromGS,{AccountID,NewRoleID,GameServerID,Pk,PlatFormName}}}, State) ->
	?LOG_OUT("createRole:~p,~p,~p", [AccountID,NewRoleID,Pk]),
	RoleID = dbGSSave:createRole(AccountID,NewRoleID,GameServerID,Pk,PlatFormName),
	BaseRole =
		case RoleID > 0 of
			true ->
				dbRoleDataCache:getBaseRole(RoleID);
			_ ->
				[]
		end,
	psMgr:sendMsg2PS(PidFromGS, createRoleAck, {RoleID,BaseRole,Pk}),
	{noreply, State};

handle_msg({deleteBuff, _Pid, {_PidStr, {RoleID}}}, State) ->
	dbGSSave:deleteBuff(RoleID),
	{noreply, State};

handle_msg({deleteRole,_Pid,{PidStr,{RoleID}}},State) ->
	Ret = dbGSSave:deleteRole(RoleID),
	?LOG_OUT("delete RoleID[~p],Ret[~p]",[RoleID,Ret]),
	psMgr:sendMsg2PS(PidStr, deleteRoleAck, {Ret}),
	{noreply, State};

handle_msg({loadRole,_Pid,{PidStr,{RoleID, PlayerDataOtp}}},State) ->
	?LOG_OUT("loadRole[~p]",[RoleID]),
	dbGSLoad:getRoleData(RoleID,PidStr,PlayerDataOtp),
	{noreply, State};

handle_msg({saveRole,_Pid,{_PidFromGS,SaveRole}}, State) ->
	dbGSSave:saveRole(SaveRole),
	{noreply, State};

handle_msg({saveVariant,_Pid,{_PidFromGS,Msg}},State) ->
	?LOG_OUT("saveVariant[~p]",[Msg]),
	dbGSSave:saveVariant(Msg),
	{noreply, State};

%% 获取邮件列表
handle_msg({getMailList, _Pid , {PidFromCS,{OneCount}}}, State) ->
	?LOG_OUT("getMailList Count[~p]",[OneCount]),
	dbCSLoad:getMailList(PidFromCS, OneCount),
	{noreply, State};

handle_msg({newMail, _Pid, {PidFromCS, {#recSaveMail{} = Mail, Attachments}}}, State) ->
	Ret = dbCSSave:newMail(Mail, Attachments),
	?LOG_OUT("newMail[~p],Attachments[~p],Ret[~p]",[Mail,Attachments,Ret]),
	%% 返回结果
	psMgr:sendMsg2PS(PidFromCS, newMailAck, {Mail, Attachments, Ret}),

	%% 记录日志
	saveMailCreateLog(Mail, Attachments),
	{noreply, State};

%% 删除附件
handle_msg({deleteAttachMent, _Pid, {_PidFromCS,{#recMailAttachMent{} = Attachments}}}, State) ->
	?LOG_OUT("deleteAttachMent[~p]",[Attachments]),
	dbCSSave:deleteAttachMent(Attachments),
	{noreply, State};

handle_msg({updateMail, _Pid, {_PidFromCS,{#recUpdateMail{} = UpdateMail}}}, State) ->
	?LOG_OUT("UpdateMail[~p]",[UpdateMail]),
	dbCSSave:updateMail(UpdateMail),
	{noreply, State};

handle_msg({deleteMail, _Pid, {_PidFromCS, MainID}}, State) ->
	?LOG_OUT("deleteMail[~p]",[MainID]),
	dbCSSave:deleteMail(MainID),
	{noreply, State};

%%根据角色id取出王者战天下用的数据
handle_msg({getRoleData4King, _Pid, {PidFromGS,{RoleID}}}, State) ->
	?LOG_OUT("getRoleData4King[~p]",[RoleID]),
	Ret = dbGSLoad:getRoleData4King(RoleID),
	psMgr:sendMsg2PS(PidFromGS, getRoleData4KingAck, Ret),
	{noreply, State};

%%根据角色id取出王者战天下的雕像信息数据
%%handle_msg({getRoleData4KingMarror, _Pid, {PidFromGS,{RoleID,PlayerDataOtp}}}, State) ->
%%	?LOG_OUT("getRoleData4KingMarror[~p]",[RoleID]),
%%%%	case edb:dirtyReadRecord(rec_base_role,RoleID) of
%%%%		[] ->
%%			dbRoleDataCache:getRoleDataFromDB(RoleID, PlayerDataOtp),
%%%%		_ ->
%%%%			skip
%%%%	end,
%%	psMgr:sendMsg2PS(PidFromGS, getRoleData4KingMarrorAck,{RoleID}),
%%	{noreply, State};

%%网络gm发的gs线路修改、添加
handle_msg({updateDBInfo, _Pid, {_PidFromLS,Data}}, State) ->
	?LOG_OUT("updateDBInfo[~w]",[Data]),
	dbLSSave:updateDBInfo(Data),
	{noreply, State};

%%转到业务模块取出帐号数据，异步给LS节点
handle_msg({getAccount, _Pid, {PidFrom,Msg} }, State) ->
	?LOG_OUT("Ls getAccount[~p]",[Msg]),
	dbLSLoad:getAccount(PidFrom, Msg),
	{noreply, State};

%%中转 设置帐号 mysql操作
handle_msg({setAccountLoginStatus, _Pid, {_, Msg } }, State) ->
	?LOG_OUT("Ls setAccount[~p]",[Msg]),
	dbLSSave:setAccountLoginStatus(Msg),
	{noreply, State};

%%中转 取出黑、白名单列表 mysql操作
handle_msg({getBlackAndWhiteAccountList, _Pid, {PidFrom,_Msg} }, State) ->
%% 	?LOG_OUT("Ls getBlackAndWhiteAccountList[~p]",[Msg]),
	%%从全局帐号取面黑名单异步给LS节点进程
	dbLSLoad:getGameDenyAccount(PidFrom),
	%%从全局帐号取面白名单异步给LS节点进程
	dbLSLoad:getGameWhiteAccount(PidFrom),
	{noreply, State};

%%中转，清理某GS上的所有帐号在线id
handle_msg({clearAccountOnGS, _Pid, {_,Msg} }, State) ->
	?LOG_OUT("Ls clearAccountOnGS [~p]",[Msg]),
	dbLSSave:clearAccountOnGS(Msg),
	{noreply, State};

%% 回收游戏币
handle_msg({revokeRoleMoney, _Pid, {_PidFromLS, {MoneyList} }}, State) ->
	dbGSSave:revokeRoleMoney(MoneyList),
	{noreply, State};

%% 回收爵位经验
handle_msg({revokeRoleReputation, _Pid, {_PidFromLS, {Old, Dec, RoleID} }}, State) ->
	dbGSSave:revokeRoleReputation(Old, Dec, RoleID),
	{noreply, State};

%% 回收物品
handle_msg({revokeRoleItem, _Pid, {_PidFromLS, {ItemList,RoleID} }}, State) ->
	dbGSSave:revokeRoleItem(ItemList,RoleID),
	{noreply, State};

%% 禁言
handle_msg({saveRoleDenyChatTime, _Pid, {_PidFromLS, {DenyRoleID, DenyChatTime} = Msg}}, State)
	when is_integer(DenyRoleID), DenyRoleID > 0, is_integer(DenyChatTime), DenyChatTime > 0 ->
	?LOG_OUT("Ls saveRoleDenyChatTime, [~p]", [Msg]),
	dbGSSave:saveRoleDenyChatTime(Msg),
	{noreply, State};

handle_msg({changeGoodsOwner,_Pid,{_PidFromGS, {RoleID, GoodsUID, OwnerID,EquipID}}}, State) ->
	%%修改物品的拥有者
	?LOG_OUT("changeGoodsOwner [~p]",[{RoleID, GoodsUID, OwnerID,EquipID}]),
%% 	dbGSSave:changeGoodsOwner(RoleID, GoodsUID, OwnerID,IsEquip),
	case EquipID < ?Item_RuneIDStart of
		true ->
			dbGSSave:changeGoodsOwner(GoodsUID, RoleID, OwnerID);
		_ ->
			dbGSSave:changeRuneOwner(GoodsUID, RoleID, OwnerID)
	end,
	{noreply, State};

handle_msg({loadTradeData, _Pid, {PidFromCS,{Type, OneCount}}}, State) ->
	%% 获取交易行数据
	?LOG_OUT("loadTradeData [~p]",[{Type, OneCount}]),
	dbCSLoad:getTradeData(PidFromCS, Type, OneCount),
	{noreply, State};

handle_msg({saveTradeData, _Pid, {_PidFromCS,Msg}}, State) ->
	%% 保存交易行数据
	?LOG_OUT("saveTradeData...~p",[Msg]),
	dbCSSave:saveTradeData(Msg),
	{noreply, State};

handle_msg({saveGuildData, _Pid, {PidFromCS, Msg}}, State) ->
	%% 保存公会数据
	case erlang:is_list(Msg) of
		true ->
			lists:foreach(
				fun(MsgCell) ->
					?LOG_OUT("saveGuildData [~p]",[MsgCell]),
					dbCSSave:saveGuildData(PidFromCS, MsgCell)
				end,
				Msg
			);
		_ ->
			?LOG_OUT("saveGuildData [~p]",[Msg]),
			dbCSSave:saveGuildData(PidFromCS, Msg)
	end,
	{noreply, State};

handle_msg({saveGuildWarPaidData, _Pid, {PidFromCS, Msg}}, State) ->
	%% 保存公会城战竞价数据
	?LOG_OUT("saveGuildWarPaidData [~p]",[Msg]),
	dbCSSave:saveGuildWarPaidData(PidFromCS, Msg),
	{noreply, State};

handle_msg({saveGuildWarData, _Pid, {PidFromCS, Msg}}, State) ->
	%% 保存公会城战数据
	?LOG_OUT("saveGuildWarData [~p]",[Msg]),
	dbCSSave:saveGuildWarData(PidFromCS, Msg),
	{noreply, State};

handle_msg({saveGuildBattleData, _Pid, {PidFromCS, Msg}}, State) ->
	%% 保存军团战数据
	?LOG_OUT("saveGuildBattleData [~p]",[Msg]),
	dbCSSave:saveGuildBattleData(PidFromCS, Msg),
	{noreply, State};

handle_msg({loadGuildData, _Pid, {PidFromCS, Msg}}, State) ->
	%% 加载军团数据
	?LOG_OUT("loadGuildData [~p]",[Msg]),
	dbCSLoad:loadGuildData(PidFromCS),
	{noreply, State};


%% 保存商城数据
handle_msg({saveMallData, _Pid, {PidFromCS, Msg}}, State) ->
	dbCSSave:saveMallData(PidFromCS, Msg),
	{noreply, State};

%%删除商城道具
handle_msg({delMallData,_Pid,{PidFromCS,Msg}}, State) ->
	?LOG_OUT("delMallData Db_ID:~p",[Msg]),
	dbCSSave:deleteMallItem(PidFromCS, Msg),
	{noreply, State};

%% 保存商城限购数据
handle_msg({saveLimitMallData, _Pid, {PidFromCS, Msg}}, State) ->
	?LOG_OUT("saveLimitMallData [~p]",[Msg]),
	dbCSSave:saveLimitMallData(PidFromCS, Msg),
	{noreply, State};

%% 保存商城数据变化LOG
handle_msg({saveMallChangeLog, _Pid, {_PidFromCS, [?LogType_MallChange, #recSaveMall{}=Mall, Type]}}, State) ->
	saveMallChangeLog(?LogType_MallChange, #recSaveMall{}=Mall, Type),
	{noreply, State};

handle_msg({monitorsj_addmonitorsjip, _Pid, {_PidFromGS, {Type, IP} = Data}}, State) ->
	try
		SQL =
			case Type of
				1 ->
					io_lib:format("REPLACE INTO eventlist1(id) VALUES('~ts');", [IP]);
				2 ->
					io_lib:format("REPLACE INTO eventlist2(id) VALUES('~ts');", [IP]);
				10 ->
					io_lib:format("DELETE FROM eventlist1 WHERE id = '~ts';", [IP]);
				20 ->
					io_lib:format("DELETE FROM eventlist2 WHERE id = '~ts';", [IP])
			end,
		Ret = emysql:execute(?LOGINDB_CONNECT_POOL, SQL),
		libDB:logExecResult(monitorsj_addmonitorsjip,Type,Ret)
	catch
		_:Why ->
			?ERROR_OUT("monitorsj_addmonitorsjip:~p,~p", [Data, Why])
	end,
	{noreply, State};

handle_msg({getCopyMapHighestScore, _Pid, {PidFromGS, RoleID}}, State) ->
	%% 获取副本的最高分数
	Result = dbGSLoad:getCopyMapHighestScore(RoleID),
	psMgr:sendMsg2PS(PidFromGS, getCopyMapHighestScoreAck, Result),
	{noreply, State};

handle_msg({saveCopyMapHighestScore, _Pid, {_PidFromGS, #recCopyMapScore{} = R}}, State) ->
	%% 获取副本的最高分数
	dbGSSave:saveCopyMapHighestScore(R),
	{noreply, State};

%% 获取排行榜数据
handle_msg({getPlayerRankData, _Pid,{PidFromCS, TypeList}}, State) ->
	dbCSLoad:getPlayerRankData(PidFromCS, TypeList),
	{noreply, State};

%% 加载玩家的模型数据
handle_msg({getPlayerDataInfoFromDB, _Pid, {_PidFromCS, RoleID}}, State) ->
	?DEBUG_OUT("getPlayerDataInfoFromDB:~p", [RoleID]),
	databankInit:getRoleDataInfo([RoleID]),
	{noreply, State};
%% 加载玩家的模型数据
handle_msg({getRolesAppearanceFromDB, _PidFrom, {PidFromGS, RoleIDList}}, State) ->
	?DEBUG_OUT("getRolesAppearanceFromDB:~p", [RoleIDList]),
	ApprenceInfos=databankInit:getRoleAppearance(RoleIDList, false),
	psMgr:sendMsg2PS(PidFromGS, getRolesAppearanceFromDBAck, {self(),ApprenceInfos}),
	{noreply, State};

%% 保存排行榜数据
handle_msg({saveRankData, _Pid,{_PidFromCS, {RankType, List}}}, State) ->
	Len = erlang:length(List),
	?LOG_OUT("saveRankData:~p,~p", [RankType, Len]),
	dbCSSave:saveRankData(RankType, Len, List),
	{noreply, State};

%% 获取活动数据
handle_msg({getActivityData, _Pid,{PidFromCS, _Msg}}, State) ->
	List = dbCSLoad:getActivityData(),
	psMgr:sendMsg2PS(PidFromCS, getActivityDataAck, List),
	{noreply, State};

%% 保存活动数据
handle_msg({saveActivityData, _Pid,{_PidFromCS, Activity}}, State) ->
	dbCSSave:saveActivityData(Activity),
	{noreply, State};

%% 玩家上线
handle_msg({playerOnline, _Pid, {_PidFrom,RoleID}}, State) ->
	?LOG_OUT("playerOnline ~p",[RoleID]),
	dbGSSave:saveRoleLoginTime(RoleID),
	{noreply, State};

%% 玩家下线
handle_msg({playerOffline, _Pid, {_PidFrom,RoleID}}, State) ->
	?LOG_OUT("playerOffline[~p]",[RoleID]),
	dbGSSave:saveRoleLogoutTime(RoleID),
	{noreply, State};

%% 获取UID列表
%%handle_msg({getUIDList, _Pid, {PidFrom,{TypeList, GSID}}}, State) ->
%%	?LOG_OUT("getUIDList[~p]",[{TypeList, GSID}]),
%%	Ret = dbGSLoad:getUIDList(TypeList, GSID),
%%	psMgr:sendMsg2PS(PidFrom, getUIDListAck, {Ret}),
%%	{noreply, State};

%% 获取游戏公告列表
handle_msg({getGameNotice, _Pid, {PidFrom,{}} }, State) ->
	?LOG_OUT("getGameNotice",[]),
	Ret = dbLSSave:selGameNotice( ),
	psMgr:sendMsg2PS(PidFrom, getGameNoticeAck, {Ret}),
	{noreply, State};

%% 增加公告
handle_msg({addGameNotice,_Pid,{PidFromGS,{GMCmdSerial,#gameNotice{} = GameNotice}}}, State)->
	?LOG_OUT("addGameNotice=======~w~n",[{GMCmdSerial,GameNotice}]),
	GameNoticeID = dbLSSave:addGameNotice(GameNotice),
	?LOG_OUT("addGameNotice ok,ID[~p]",[GameNoticeID]),
	psMgr:sendMsg2PS(PidFromGS, handleDBSAck, {GMCmdSerial,GameNoticeID}),
	{noreply, State};

%% 删除公告(公告id)
handle_msg({delGameNotice,_Pid,{PidFromGS,{GMCmdSerial,NoticeID}}}, State)->
	?LOG_OUT("delGameNotice",[]),
	ok = dbLSSave:delGameNotice(NoticeID),
	?LOG_OUT("delGameNotice ok,ID[~p]",[NoticeID]),
	psMgr:sendMsg2PS(PidFromGS, handleDBSAck, {GMCmdSerial,NoticeID}),
	{noreply, State};

%% 设置要清除缓存的玩家
handle_msg({flagCleanCacheRoleID, _Pid,{PidFromLS,{GMCmdSerial,RoleID}}}, State) ->
	edb:writeRecord(#rec_clean_role_cache{roleID = RoleID}),
	?LOG_OUT("flagCleanCacheRoleID[~p]",[RoleID]),
	psMgr:sendMsg2PS(PidFromLS, handleDBSAck, {GMCmdSerial,true}),
	{noreply, State};

%% 恢复角色
handle_msg({returnRole, _Pid,{PidFromLS,{GMCmdSerial,RoleID}}}, State) ->
	Ret = dbLSSave:returnRole(RoleID),
	?LOG_OUT("restoreRoleID[~p],Ret[~p]",[RoleID,Ret]),
	psMgr:sendMsg2PS(PidFromLS, handleDBSAck, {GMCmdSerial,Ret}),
	{noreply, State};

%%物品恢复
handle_msg({returnItem,_Pid,{ PidFromLS, {GMCmdSerial,ItemUID, RoleID}}},State) ->
	Ret = dbLSSave:returnItem(ItemUID),
	?LOG_OUT("returnItem RoleID[~p] itemUID [~p],Ret[~p]",[RoleID, ItemUID,Ret]),
	psMgr:sendMsg2PS(?PsNameDBS, returnItem, {PidFromLS,GMCmdSerial,RoleID, ItemUID}),
	{noreply, State};

%% 增加登录有礼活动配置
handle_msg({addLoginAwardConf,_Pid,{PidFromGS,{GMCmdSerial,LoginAwardConf}}}, State)->
	?LOG_OUT("addLoginAwardConf",[]),
	ok = dbLSSave:addLoginAwardConf(LoginAwardConf),
	?LOG_OUT("addLoginAwardConf[~p],~p",[GMCmdSerial,PidFromGS]),
	psMgr:sendMsg2PS(PidFromGS, handleDBSAck, {GMCmdSerial,ok}),
	{noreply, State};

%% 取出登录有礼活动配置
handle_msg({selLoginAwardConf,_Pid,{PidFromGS,{}}}, State)->
	?LOG_OUT("selLoginAwardConf",[]),
	LoginAwardConfList = dbLSSave:selLoginAwardConf(),
	psMgr:sendMsg2PS(PidFromGS, selLoginAwardConfAck, {LoginAwardConfList}),
	{noreply, State};

%% 取消登录有礼活动配置
handle_msg({delLoginAwardConf,_Pid,{PidFromGS,{GMCmdSerial,LoginAwardID}}}, State)->
	?LOG_OUT("delLoginAwardConf",[]),
	Ret = dbLSSave:delGameLoginAward(LoginAwardID),
	psMgr:sendMsg2PS(PidFromGS, handleDBSAck, {GMCmdSerial,Ret}),
	{noreply, State};

%% 记录玩家已经领取过的活动id
handle_msg({saveAwardTakens,_Pid,{_PidFromGS,{RoleID,AwardID}}}, State)->
	?LOG_OUT("saveAwardTakens:~p ~p",[RoleID,AwardID]),
	dbCSSave:saveAwardTakens(RoleID, AwardID),
	{noreply, State};

%% 加载玩家已经领取过的活动id
handle_msg({loadAwardTakens,_Pid,{PidFromGS,{} }}, State)->
	?LOG_OUT("loadAwardTakens"),
	dbCSLoad:getAwardTakens(PidFromGS),
	{noreply, State};

%% 增加xml公告
handle_msg({addXmlNotice,_Pid,{PidFromGS,{GMCmdSerial,Type,XmlContent,Md5}}}, State)->
	?LOG_OUT("addXmlNotice:~w",[XmlContent]),
	Ret = dbLSSave:xmlNoticeAdd(Type,XmlContent,Md5),
	psMgr:sendMsg2PS(PidFromGS, handleDBSAck, {GMCmdSerial,Ret}),
	{noreply, State};

%% 获取xml公告
handle_msg({getXmlNotice,_Pid,{PidFromGS,_Msg}}, State)->
	?LOG_OUT("addXmlNotice",[]),
	Ret = dbLSLoad:xmlNoticSel(),
	psMgr:sendMsg2PS(PidFromGS, getXmlNoticeAck, {Ret}),
	{noreply, State};

%% %%设置帐号gm级别
handle_msg({setGMAccountLevel,_Pid,{PidFromGS,{GMCmdSerial,Level,AccountIDListStr}}}, State)->
	?LOG_OUT("setGMAccountLevel:~w",[AccountIDListStr]),
	Ret = dbLSSave:setGMAccountLevel(AccountIDListStr,Level),
	psMgr:sendMsg2PS(PidFromGS, handleDBSAck, {GMCmdSerial,Ret}),
	{noreply, State};

%% 设置设备禁止登录
handle_msg({denyDeviceSet,_Pid,{PidFromGS,{GMCmdSerial,DeviceID,OpType}}}, State)->
	?LOG_OUT("denyDeviceSet:~w start.",[GMCmdSerial]),
	Ret = dbLSSave:denyDeviceSet(DeviceID,OpType),
	?LOG_OUT("denyDeviceSet:~w,~w ret[~w].",[DeviceID,OpType,Ret]),
	psMgr:sendMsg2PS(PidFromGS, handleDBSAck, {GMCmdSerial,Ret}),
	{noreply, State};

%% 获取设备禁止登录的配置
handle_msg({getDenyDevice,_FromPid,{PidFromLS,{}}}, State)->
	?LOG_OUT("getDenyDevice====="),
	DenyDeviceCnfList = dbLSLoad:getDeviceSet(),
	?DEBUG_OUT("===~w",[DenyDeviceCnfList]),
	psMgr:sendMsg2PS(PidFromLS, getDenyDeviceCnfAck, {DenyDeviceCnfList}),
	{noreply, State};

handle_msg({getRandIpList,_FromPid,{PidFromLS,{}}}, State)->
	List = dbLSLoad:getRandIpList(),
	psMgr:sendMsg2PS(PidFromLS, getRandIpListAck, List),
	{noreply, State};

%% %%设置帐号是否为黑名单
%%handle_msg({setDenyAccountID,_Pid,{PidFromGS,{GMCmdSerial,Operate,AccountID,AreaID}}}, State)->
handle_msg({setDenyAccountID,_Pid,{PidFromGS,{GMCmdSerial,Operate,AccountID,AreaID, BeginTime, EndTime}}}, State)->
	?LOG_OUT("setDenyAccountID:~w",[AccountID]),
	Ret = dbLSSave:setDenyAccountID(Operate,AccountID,AreaID, BeginTime, EndTime),
	case GMCmdSerial of
		notWebCmd -> skip;  %%如果不是WebGM命令， 不用返回，以后有需求在添加
		_ ->
			psMgr:sendMsg2PS(PidFromGS, handleDBSAck, {GMCmdSerial,Ret})
	end,
	{noreply, State};

%%设置帐号是否为 白名单
handle_msg({setWhiteAccountID,_Pid,{PidFromGS,{GMCmdSerial,Operate,AccountID}}}, State)->
	?LOG_OUT("setWhiteAccountID:~w",[AccountID]),
	Ret = dbLSSave:setWhiteAccountID(Operate,AccountID),
	psMgr:sendMsg2PS(PidFromGS, handleDBSAck, {GMCmdSerial,Ret}),
	{noreply, State};

%%设置角色是否为 删除
handle_msg({setRoleDelFlag,_Pid,{PidFromGS,{GMCmdSerial,Operate,RoleIDListStr}}}, State)->
	?LOG_OUT("setRoleDelFlag:~w",[RoleIDListStr]),
	Ret = dbLSSave:setRoleDelFlag(Operate,RoleIDListStr),
	psMgr:sendMsg2PS(PidFromGS, handleDBSAck, {GMCmdSerial,Ret}),
	{noreply, State};

%% 平台设置 保存商城数据
handle_msg({saveMallGoods, _Pid, {PidFromGS, {CmdSerial, MallList}}}, State) ->
	?LOG_OUT("saveMallData by platform MallList:~w",[MallList]),
	Ret = dbLSSave:saveMallData(PidFromGS,MallList),
	%% GM设置CS商城数据
	psMgr:sendMsg2PS(?PsNameMall, gmSaveMallGoods, {MallList, Ret}),
	%%设置log
	saveMallChangeLog(?LogType_MallChange, MallList, ?Mall_Change_Updata),
	%%返回LS
	psMgr:sendMsg2PS(PidFromGS, handleDBSAck, {CmdSerial, Ret}),
	{noreply, State};

%% 平台删除商城数据
handle_msg({delMallGoods, _Pid, {PidFromGS, {CmdSerial, Msg}}}, State) ->
	?LOG_OUT("delMallData by platform Msg:~w",[Msg]),
	Ret = dbLSSave:deleteMallItem(PidFromGS, Msg),
	%% GM设置CS商城数据
	psMgr:sendMsg2PS(?PsNameMall, gmDelMallGoods, {Msg, Ret}),
	MallList = #recSaveMall{dbID=Msg},
	%%设置log
	saveMallChangeLog(?LogType_MallChange, MallList, ?Mall_Change_Del),
	%%返回LS
	psMgr:sendMsg2PS(PidFromGS, handleDBSAck, {CmdSerial, Ret}),
	{noreply, State};

%%激活码查询
handle_msg({getActiveCodeRequest,_Pid,{PidStr, Data}},State) ->
	Ret = dbGSLoad:getActiveCodeRequestInGlobal(Data),
	psMgr:sendMsg2PS(PidStr, getActiveCodeRequestAck, {Data, Ret}),
	{noreply, State};

%%激活码更新
handle_msg({updateActiveCode,_Pid,{PidStr,{ActiveCode, RoleID, AccountID, PlatformAccountID, PlatformID, Item_ID, Item_Count}}},State) ->
	Ret = dbGSSave:updateActiveCodeInGlobal(ActiveCode, RoleID, AccountID, PlatformAccountID, PlatformID),
	psMgr:sendMsg2PS(PidStr, updateActiveCodeAck, {ActiveCode, RoleID, Ret, Item_ID, Item_Count}),
	{noreply, State};

%%激活码(一对多玩家领取记录)
handle_msg({saveActiveCode4Role,_Pid,{PidStr,{ActiveCodeID, RoleID, _AccountID, _PlatformAccountID, _PlatformID, Item_ID, Item_Count}}},State) ->
	Ret = case dbGSSave:saveActiveCode4Role(RoleID, ActiveCodeID) of
			  ok -> 1;
			  _ -> -1
		  end,
	psMgr:sendMsg2PS(PidStr, updateActiveCodeAck, {ActiveCodeID, RoleID, Ret, Item_ID, Item_Count}),
	{noreply, State};

%%加载商城数据
handle_msg({loadMallData, _Pid, {PidFromCS, _Msg}}, State) ->
	?LOG_OUT("loadMallData init"),
	dbCSLoad:getMallData(PidFromCS),
	dbCSLoad:getMallLimitData(PidFromCS),
	{noreply, State};

%%cs启服初始化预充值过的玩家
handle_msg({getPreChargeAccount, _Pid, {PidFromCS, _Msg}}, State) ->
	?LOG_OUT("getPreChargeAccount"),
	PreChargeAccount = dbCSLoad:getPreChargeAccount(),
	psMgr:sendMsg2PS(PidFromCS, getPreChargeAccountAck, PreChargeAccount),
	{noreply, State};

%%cs删除已经领了预充值的数据
handle_msg({delPreRecharge, _Pid, {_PidFromCS, {AccountID} }}, State) ->
	Ret = dbCSSave:delPreRecharge(AccountID),
	?LOG_OUT("delPreRecharge aid[~w] mysqlRet[~w]",[AccountID,Ret]),
	{noreply, State};

%%cs 保存充值返利的配置
handle_msg({saveRechargeRebate, _Pid, {_PidFromCS, Row }}, State) ->
	Ret = dbCSSave:saveRechargeRebate(Row),
	?LOG_OUT("saveRechargeRebate[~w] mysqlRet[~w]",[Row,Ret]),
	{noreply, State};

%%cs 保存充值返利已经领取的玩家与活动id
handle_msg({saveRechargeRebateTaken, _Pid, {_PidFromCS, {RoleID,RebateID}=Arg }}, State) ->
	Ret = dbCSSave:saveRechargeRebateTaken(RoleID,RebateID),
	?LOG_OUT("saveRechargeRebateTaken[~w] mysqlRet[~w]",[Arg,Ret]),
	{noreply, State};

%%cs 清除充值返利已经领取的玩家与活动id
handle_msg({cleanRechargeRebateTaken, _Pid, {_PidFromCS, {RebateTakenID}=Arg }}, State) ->
	Ret = dbCSSave:cleanRechargeRebateTaken(RebateTakenID),
	?LOG_OUT("cleanRechargeRebateTaken[~w] mysqlRet[~w]",[Arg,Ret]),
	{noreply, State};



%%cs 保存双倍首充活动的配置
handle_msg({saveRechargeRebateFirstDoubleConf, _Pid, {_PidFromCS, {RebateID,PayMoney} }}, State) ->
	dbMemCacheCommon:setPayDoubleConf(#rec_recharge_double_conf{
		rebateID  = RebateID,
		funcellPayItemID = PayMoney
	}),
	{noreply, State};


%%cs启服初始化充值返利的配置与已经领取的记录
handle_msg({getRechargeRebateAndTaken, _Pid, {PidFromCS, _Msg}}, State) ->
	?LOG_OUT("getRechargeRebateAndTaken"),
	{RebateConf,RebateTaken} = dbCSLoad:getRechargeRebateAndTaken(),
	psMgr:sendMsg2PS(PidFromCS, getRechargeRebateAck, RebateConf),
	psMgr:sendMsg2PS(PidFromCS, getRechargeRebateTakenAck, RebateTaken),
	{noreply, State};

%%cs启服初始化玩家近7天和状态为0的订单
handle_msg({getNewAndLast7DaysOrder, _Pid, {PidFromCS, _Msg}}, State) ->
	?LOG_OUT("getNewAndLast7DaysOrder"),
	InitRechargeList = dbCSLoad:getNewAndLast7DaysOrder(),
	psMgr:sendMsg2PS(PidFromCS, getNewAndLast7DaysOrderAck, InitRechargeList),
	{noreply, State};


%%gs取出帐号的福利
handle_msg({getAccountWelfare, _Pid, {PidFromGS, {AccountID, WelfareTypeID} }}, State) ->
	ItemListStr = dbGSLoad:getAccountWelfare(AccountID, WelfareTypeID),
	?LOG_OUT("getAccountWelfare account[~w] ackStr[~ts]",[AccountID,ItemListStr]),
	psMgr:sendMsg2PS(PidFromGS, getAccountWelfareAck, ItemListStr),
	{noreply, State};

%%保存角色绑定手机号
handle_msg({setBindPhone, _Pid, {_PidFromGS, {AccountID, PhoneNum}}}, State) ->
	?LOG_OUT("setBindPhone"),
	dbGSSave:setBindPhoneNum(AccountID, PhoneNum),
	{noreply, State};

%%获取角色绑定手机号
handle_msg({getBindPhone, _Pid, {PidFromGS, {AccountID}}}, State) ->
	PhoneNum = dbGSLoad:getBindPhoneNum(AccountID),
	psMgr:sendMsg2PS(PidFromGS, getBindPhoneAck, PhoneNum),
	?DEBUG_OUT("getBindPhone[~p]", [PhoneNum]),
	{noreply, State};

%%删除队伍
handle_msg({deleteTeamInfo, _Pid, {_PidFromGS, TeamID}}, State) ->
	dbGSSave:deleteTeamInfo(TeamID),
	{noreply, State};
%%删除队伍
handle_msg({deleteTeamID, _Pid, {_PidFromGS, {_RoleID, _TeamID}}}, State) ->
%%	dbGSSave:deleteTeamID(RoleID, TeamID),
	{noreply, State};
%%检查名字是否可用
handle_msg({canUseNewName, _Pid, {PidFromGS, {RoleID,NewName}}}, State) ->
	Ret = dbGSLoad:canUseNewName(RoleID,NewName),
	psMgr:sendMsg2PS(PidFromGS, canUseNewNameAck, {Ret, RoleID, NewName}),
	{noreply, State};
%%存储新名字
handle_msg({changeNewName, _Pid, {_PidFromGS, {RoleID,NewName}}}, State) ->
	dbGSSave:saveNameName(RoleID, NewName),
	{noreply, State};
handle_msg({deleteTitle, _Pid, {_PidStr, {RoleID,TitleID}}}, State) ->
	dbGSSave:deleteTitle(RoleID,TitleID),
	{noreply, State};
%%-----------------------------------------------------------------------
%% 读取红包数据
handle_msg({getRedEnvelopeData, _Pid, {PidFromGS, _}}, State) ->
	Ret = dbGSLoad:getRedEnvelopeData(),
	?DEBUG_OUT("getRedEnvelopeData ~p",[Ret]),
	psMgr:sendMsg2PS(PidFromGS, getRedEnvelopeDataAck, Ret),
	{noreply, State};

handle_msg({redEnvelopeOperation, _Pid, {_PidFromGS,{Op,Param}}}, State) ->
	case Op of
		clearall->
			dbGSSave:clearRedEnvelope();
		insert ->
			dbGSSave:insertRedenvelope(Param);
		update ->
			dbGSSave:updateRedenvelope(Param);
		delete ->
			dbGSSave:deleteRedEnvelope(Param);
		_ ->
			?ERROR_OUT("redEnvelopeOperation unknow op(~w,~w)",[Op, Param])
	end,
	{noreply, State};

%%handle_msg({clearRedEnvelope, _Pid, {PidFromGS, _}}, State) ->
%%	dbGSSave:clearRedEnvelope(),
%%	{noreply, State};
%%
%%handle_msg({deleteRedEnvelope, _Pid, {PidFromGS, RedUID}}, State) ->
%%	dbGSSave:deleteRedEnvelope(RedUID),
%%	{noreply, State};
%%
%%%% 写红包数据
%%handle_msg({insertRedEnvelope, _Pid, {PidFromGS, Rec}}, State) ->
%%	Ret = dbGSSave:insertRedenvelope(Rec),
%%	{noreply, State};
%%
%%handle_msg({updatetRedEnvelope, _Pid, {PidFromGS,Rec}}, State) ->
%%	Ret = dbGSSave:updateRedenvelope(Rec),
%%	{noreply, State};
%%-----------------------------------------------------------------------


%% 保存道具数据
handle_msg({save_item_data, _Pid, {_PidStr, {Op, Rec}}}, State) ->
	dbItemSave:save_item_data(Op, Rec),
	{noreply, State};

handle_msg({deletePet, _Pid, {_PidStr, {RoleID, PetID}}}, State) ->
	dbGSSave:deletePet(RoleID,PetID),
	{noreply, State};

handle_msg({deletePetSkill, _Pid, {_PidStr, {RoleID, PetID}}}, State) ->
	dbGSSave:deletePetSkill(RoleID,PetID),
	{noreply, State};

handle_msg({addLimitPushSale, PidFromLS, {GMCmdSerial,Data} }, State) ->
	dbLSSave:saveLimitSalesItem(Data),
	?LOG_OUT("addLimitPushSale [~p],~p,data [~p]",[GMCmdSerial,PidFromLS,Data]),
	psMgr:sendMsg2PS(PidFromLS, handleDBSAck, {GMCmdSerial,ok}),
	{noreply, State};
handle_msg({delLimitSale, _Pid, {PidFromLS, {GMCmdSerial}}}, State) ->
	dbLSSave:delLimitSales(),
	psMgr:sendMsg2PS(PidFromLS, handleDBSAck, {GMCmdSerial,ok}),
	{noreply, State};

handle_msg({gmaddLimitPushSale, _Pid, {PidStr, {GMCmdSerial,Data}}}, State) ->
	dbLSSave:saveLimitSalesItem(Data),
	?LOG_OUT("gmaddLimitPushSale [~p],~p,data [~p]",[GMCmdSerial,PidStr,Data]),
	{noreply, State};

handle_msg({savePlayerFindRes, _Pid, {_PidStr, {#rec_player_find_res{} = Res, Type}}}, State) ->
	dbGSSave:savePlayerFindRes(Res, Type),
%%	?LOG_OUT("savePlayerFindRes [~p], ~p, ~p", [Key, P1, P2]),
	{noreply, State};

handle_msg({savePlayerRuneData, _Pid, {_PidStr, Data}}, State) ->
	dbGSSave:savePlayerRuneData(Data),
	?LOG_OUT("savePlayerRuneData:~p", [Data]),
	{noreply, State};

handle_msg({unlockNewRace, _Pid, {_PidStr, MsgData}}, State) ->
	dbGSSave:setlockNewRace(MsgData),
	{noreply, State};

handle_msg({loadRubbishRoleList, _Pid, {PidFromCS, Setting}}, State) ->
	dbGSRubbishCleaner:loadRubbishRoleList(PidFromCS, Setting),
	{noreply, State};

handle_msg({cleanRubbishRoleData, _Pid, {PidFromCS, Data}}, State) ->
	dbGSRubbishCleaner:cleanOneRole(PidFromCS, Data),
	{noreply, State};

handle_msg(Msg, State)->
	?ERROR_OUT("unhandle msg:[~p] in [~p] [~p,~p]",[Msg,node(),?MODULE,self()]),
	{noreply, State}.

%handle_call(Msg, _State) ->
%	?ERROR_OUT("unhandle msg:[~p] in [~p] [~p,~p]",[Msg,node(),?MODULE,self()]),
%	{error,<<"unknow msg">>}.

saveMailCreateLog(#recSaveMail{senderRoleID = SenderRoleID, toRoleID = ToRoleID} = Mail, Attachment) ->
	Fun1 =
		fun(#recMailAttachMent{mtype = Mtype, mvalue = Mvalue, mvalue2 = Mvalue2} = _Attach, Acc ) ->
			{AttachItemUID_1 ,AttachItemDataID_1, AttachItemUID_2,AttachItemDataID_2,AttachCoinType, AttachCoin} = Acc,
			case Mtype =:= 0 of
				true->
					case AttachItemUID_1 =:= 0 of
						true->
							{Mvalue, Mvalue2, AttachItemUID_2, AttachItemDataID_2, AttachCoinType, AttachCoin};
						_->
							{AttachItemUID_1 ,AttachItemDataID_1, Mvalue, Mvalue2, AttachCoinType, AttachCoin}
					end;
				false->
					{AttachItemUID_1 ,AttachItemDataID_1, AttachItemUID_2,AttachItemDataID_2,Mtype,Mvalue}
			end
		end,
	{AttachItemUID_1 ,AttachItemDataID_1, AttachItemUID_2,AttachItemDataID_2,AttachCoinType, AttachCoin} =
		lists:foldl(Fun1, {0,0,0,0,0,0}, Attachment),

	MailLog =
		#recLogCreateMail{
			mailUID = Mail#recSaveMail.mailID,			%%邮件唯一ID
			senderRoleID = SenderRoleID,				%%邮件发送者ID
			senderRoleName = "",			%%邮件发送者名字
			toRoleID = ToRoleID,						%%邮件接收者ID
			toRoleName = "",					%%邮件接收者名字
			mailTitle = Mail#recSaveMail.mailTitle,						%%邮件标题
			mailContent = Mail#recSaveMail.mailContent,					%%邮件内容
			mailSubjoinMsg = Mail#recSaveMail.mailSubjoinMsg,			%%预留
			attachItemUID_1 = AttachItemUID_1,			%%附件物品UID
			attachItemDataID_1 = AttachItemDataID_1,	%%附件物品DataID
			attachItemUID_2 = AttachItemUID_2,			%%附件物品UID
			attachItemDataID_2 = AttachItemDataID_2,	%%附件物品DataID
			attachCoinType = AttachCoinType,			%%附件货币类型
			attachCoin = AttachCoin,					%%附件货币值
			time = time:getLogTimeSec()					%%时间
		},
	logDBPID ! {?LogType_CreateMail, MailLog},
	ok.

saveMallChangeLog(?LogType_MallChange, #recSaveMall{}=Mall, Type) ->
	MallChangeData = #recSaveMallChangeLog{
		dbID = Mall#recSaveMall.dbID,
		itemID = Mall#recSaveMall.itemID,
		sort = Mall#recSaveMall.sort,
		type=Mall#recSaveMall.type,
		type1=Mall#recSaveMall.type1,
		diamond=Mall#recSaveMall.diamond,
		bindDiamond=Mall#recSaveMall.bindDiamond,
		useIntegral=Mall#recSaveMall.useIntegral,
		getIntegral=Mall#recSaveMall.getIntegral,
		limitBuy=Mall#recSaveMall.limitBuy,
		limitType=Mall#recSaveMall.limitType,
		limitBeginTime=Mall#recSaveMall.limitBeginTime,
		limitEndTime=Mall#recSaveMall.limitEndTime,
		buyReset=Mall#recSaveMall.buyReset,
		level=Mall#recSaveMall.level,
		recharge=Mall#recSaveMall.recharge,
		isHide=Mall#recSaveMall.isHide,
		beginTime=Mall#recSaveMall.beginTime,
		endTime=Mall#recSaveMall.endTime,
		rebate=Mall#recSaveMall.rebate,
		rebateBeginTime=Mall#recSaveMall.rebateBeginTime,
		rebateEndTime=Mall#recSaveMall.rebateEndTime,
		showType=Mall#recSaveMall.showType,
		buySendItem=Mall#recSaveMall.buySendItem,
		buySendNum=Mall#recSaveMall.buySendNum,
		buySendLimit=Mall#recSaveMall.buySendLimit,
		buySendBeginTime=Mall#recSaveMall.buySendBeginTime,
		buySendEndTime=Mall#recSaveMall.buySendEndTime,
		state=Type,
		changeTime=time:getUTCNowSec()
	},
	logDBPID ! {?LogType_MallChange, MallChangeData},
	ok.