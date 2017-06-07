%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. 五月 2017 22:02
%%%-------------------------------------------------------------------
-module(userLogin).
-author("Administrator").

-include("lsInc.hrl").
-include("logRecord.hrl").
-include("dataDefine.hrl").
-include("table.hrl").
-include("userPrivate.hrl").


%% API
-export([
	loadAccount/1,
	loadAccountAck/1,
	sendLoginResult/4,
	auth/1,
	gameServerList/0,
	checkAccount/2,
	onLoadRoleListAck/1
]).

%%%-------------------------------------------------------------------
auth(Msg) ->
	userLocal:setStatus(?US_CONNECTED),
	Socket = userLocal:getSocket(),
	case platformLoginDispatcher:loginVerify(Msg, Socket) of
		#recPlatformReturn{state = failed} ->
			sendLoginResult(
				?LoginResultSearchFail
				, 0
				, ""
				, stringCfg:getString(loginResultSearchFailInFuncell_Text)
			);
		#recPlatformReturn{state = deviceDeny} ->
			sendLoginResult(
				?LoginResultDeviceDenied
				, 0
				, ""
				, stringCfg:getString(loginResultDeviceDenied_Text)
			);
		#recPlatformReturn{state = success} = Data ->
			loadAccount(Data)
	end,
	ok.

%%%-------------------------------------------------------------------
loadAccount(#recPlatformReturn{
	state = success,
	platformAccount = PlatformAccount,
	platformAccountID = PlatformAccountID,
	platformName = PlatformName,
	fgi = Fgi,
	lsNickName = LsNickName,
	deviceId = DeviceId,
	imei = Imei,
	idfa = Idfa,
	mac = Mac
}) ->
	userLocal:setStatus(?US_AUTHED),
	DID = globalSetup:getDBID(),
	Msg = {DID, PlatformAccount, PlatformAccountID, PlatformName, Fgi, LsNickName, DeviceId, Imei, Idfa, Mac},
	?LOG_OUT("getAccountInfoFromDBReq(~w):~ts,ptName[~ts],deviceId[~ts],imei[~ts],idfa[~ts],mac[~ts],fgi[~w]", [
		self(), PlatformAccount, PlatformName, DeviceId, Imei, Idfa, Mac, Fgi]),
	lsSendMsg:sendMsg2DBServer(getAccount, Msg),
	ok.


loadAccountAck({doErr}) ->
	?ERROR_OUT("Dbserver return value doErr at checkAccount in mysql"),
	%%给客户端发送帐号验证错误
	sendLoginResult(
		?LoginResultDbErr
		, 0
		, ""
		, stringCfg:getString(loginResultDbErr_Text)
	);
loadAccountAck({Result, Account, _PostedMsg}) ->
	?LOG_OUT("socketPid[~p] onMsgGetAccountAck:result[~p ~p ~p]",
		[self(), Result, Account#account.accountID, Account#account.platformAccountID]),
	doLogin(Account, 5),
	ok.

doLogin(#account{}, 0)->
	userLocal:setStatus(?US_ANOTHER_KICK);
doLogin(#account{accountID = AccountID} = Record, N) ->
	userLocal:setStatus(?US_UNIQUE_CHECK),
	case psMgr:call(userMgrOtp, unique,{self(), Record},10000) of
		ok ->
			?LOG_OUT("unique check ok[~p]",[Record]),
			RandIdentity = makeRandIdentity(),
			sendLoginResult(
				?LoginResultSucc
				, AccountID
				, RandIdentity
				, ""
			);
		{error, OnlinePid} ->
			?WARN_OUT("unique check error, account[~p]other pid[~p], me[~p]",
				[AccountID, OnlinePid, self()]),
			psMgr:sendMsg2PS(OnlinePid, repetitionLogin),
			doLogin(Record, N - 1)
	end.


%%%-------------------------------------------------------------------
sendLoginResult(ResultCode, AccountID, Identity, Msg) ->
	NetMsg = #pk_LS2U_LoginResult{
		result = ResultCode
		, accountID = AccountID
		, identity = Identity
		, msg = Msg
	},
	userNet:sendNetMsg(NetMsg),
	ok.


-spec makeRandIdentity() -> string().
makeRandIdentity() ->
	NowMicro = os:system_time(micro_seconds),
	integer_to_list(NowMicro).

gameServerList()->
	Info = 
	#pk_GameServerInfo{
		lineid 		= 1,
		name		= "snail",
		ip 			= "192.168.18.52",
		port		= 6789,
		state		= ?GameServer_State_Running
	},
	Msg = #pk_LS2U_GameLineServerList{
		gameServers = [Info]
	},
	userNet:sendNetMsg(Msg),
	?LOG_OUT("send game server list:~p",[Msg]),
	ok.


checkAccount(AccountID, Key)->
	?LOG_OUT("account[~p],key[~p] login",
		[AccountID, Key]),
	onLoadRoleList(AccountID),
	ok.

onLoadRoleList(AccountID) ->
	case ets:lookup(ets_recRoleList, AccountID) of
		[#recRoleList{} = Data] ->
			gsSendMsg:sendMsg2DBServer(loadRoleList, AccountID, Data);
		_ ->
			gsSendMsg:sendMsg2DBServer(loadRoleList, AccountID, AccountID)
	end,
	ok.

onLoadRoleListAck(#recRoleList{accountID = AccountID, roleListInfo = RoleList} = Account) ->
	{NewRoleList, NeedLoadRoles} = getAccountRoleListIfs(AccountID, RoleList),
	NewAccount = Account#recRoleList{roleListInfo = NewRoleList},
	case NeedLoadRoles of
		[] ->
			onLoadRoleListAck({NewAccount, []});
		_ ->
			%% 需要从数据库中去加载没有模型的角色ID
			NeedLoadRoleIDs = [RID || #recRoleListInfo{roleID = RID} <- NeedLoadRoles],
			?LOG_OUT("need load playerobject:~p,~p", [AccountID, NeedLoadRoleIDs]),
			gsSendMsg:sendMsg2DBServer(loadRoleList, AccountID, {NewAccount, NeedLoadRoles, NeedLoadRoleIDs})
	end;
onLoadRoleListAck({#recRoleList{accountID = AccountID, roleListInfo = RoleList} = Account, []}) ->
	%% 更新角色列表
	ets:insert(ets_recRoleList, Account),
%%	RunStep = playerState:getRunStep(),
	?LOG_OUT("AID:~p Load Role List Len ~p OK", [AccountID, erlang:length(RoleList)]),

	sendPlayerList(RoleList),
	ok;
onLoadRoleListAck({#recRoleList{accountID = AccountID, roleListInfo = RoleInfo} = Account, NeedLoadRoles, PlayerObjects}) ->
	Fun =
		fun(#recRoleListInfo{roleID = RoleID} = Info, AccIn) ->
			case core:queryRoleKeyInfoByRoleID(RoleID) of
				#?RoleKeyRec{} = RoleKey ->
					NewInfo = getRoleInfo(Info, RoleKey, lists:keyfind(RoleID, 1, PlayerObjects)),
					[NewInfo | AccIn];
				_ ->
					?LOG_OUT("account:~p,role is delete:~p", [AccountID, RoleID]),
					AccIn
			end
		end,
	NewRoleInfo = lists:foldl(Fun, RoleInfo, NeedLoadRoles),
	onLoadRoleListAck({Account#recRoleList{roleListInfo = NewRoleInfo}, []}).


sendPlayerList(RoleList)->
	Fun =
		fun(#recRoleListInfo{
			roleID = RoleID,
			sex = Sex,
			head = Head,
			roleName = RoleName,
			camp = Camp,
			wingLevel = WingLevel,
			race = Race,
			career = Career,
			level = Level,
			mapID = MapID,                        %%玩家的当前地图ID
			oldMapID = OldMapID,                %%玩家之前的地图ID
			canRename = CanRename,
			visibleEquips = VisibleEquipList,
			fashionOnbody = FashionOnbody,
			refine_levels = RefineLevelList
		}, AccRoleData) ->
			case RoleID =:= 0 of
				true ->
					?ERROR_OUT("RoleID is 0 of RoleList");
				_ ->
					skip
			end,

			Name = case erlang:is_binary(RoleName) of
				       true ->
					       erlang:binary_to_list(RoleName);
				       _ ->
					       RoleName
			       end,

			%%包装可见装备为网络通信协议
			VisibleEquipFun =
				fun(#recVisibleEquip{equipID = EquipID, quality = Quality}, VisibleEquips) ->
					VisibleEquip = #pk_visibleEquip{equipID = EquipID, quality = Quality},
					[VisibleEquip | VisibleEquips]
				end,

			ResultVisibleEquipList = lists:foldl(VisibleEquipFun, [], VisibleEquipList),

			UserData = #pk_UserPlayerData{
				roleID = RoleID,
				name = Name,
				level = Level,
				race = Race,
				career = Career,
				sex = Sex,
				head = Head,
				wingLevel = WingLevel,
				camp = Camp,
				mapID = MapID,
				oldMapID = OldMapID,
				canRename = CanRename,
				visible_equips = ResultVisibleEquipList,
				fashionList = FashionOnbody,
				refine_levels = RefineLevelList
			},

			?DEBUG_OUT("=====sendPlayerList:~p,~ts=====~p", [RoleID, Name, CanRename]),
			{[], [UserData | AccRoleData]}
		end,
	{_, RoleListData} = lists:mapfoldr(Fun, [], RoleList),

	userNet:sendNetMsg(#pk_GS2U_UserPlayerList{
		unlockNewRace = 0,
		info = RoleListData
	}).


getAccountRoleListIfs(AccountID, RoleList) ->
	Fun =
		fun(#recRoleListInfo{roleID = RoleID} = Info, {AccIn, AccNoRoleList} = Acc) ->
			case core:queryRoleKeyInfoByRoleID(RoleID) of
				#?RoleKeyRec{} = RoleKey ->
					case ets:lookup(ets_recPlayerRankInfo, RoleID) of
						[#recPlayerRankInfo{} = RankInfo] ->
							NewInfo = getRoleInfo(Info, RoleKey, RankInfo),
							{[NewInfo | AccIn], AccNoRoleList};
						_ ->
							%% 需要从数据库中去加载
							{AccIn, [Info | AccNoRoleList]}
					end;
				_ ->
					?ERROR_OUT("getAccountRoleListInfos account:~p, role:~p is delete", [AccountID, RoleID]),
					Acc
			end
		end,
	lists:foldl(Fun, {[], []}, RoleList).

getRoleInfo(#recRoleListInfo{} = Info,
	#?RoleKeyRec{level = RLvl, career = RCareer, head = RHead, roleName = RoleName},
	#recPlayerRankInfo{visibleEquips = VES, fashionIDs = FADS, wingLevel = WL, visibleEquipLevels = VEALS}) ->
	getRoleInfo2(Info, RLvl, RCareer, RHead, RoleName, WL, VES, VEALS, FADS);
getRoleInfo(#recRoleListInfo{roleID = RoleID} = Info,
	#?RoleKeyRec{level = RLvl, career = RCareer, head = RHead, roleName = RoleName},
	{RoleID, WingLevel, _TitleRec, EquipInfoList, EquipLvList, FashionIDList}) ->
	getRoleInfo2(Info, RLvl, RCareer, RHead, RoleName, WingLevel, EquipInfoList, EquipLvList, FashionIDList);
getRoleInfo(#recRoleListInfo{roleID = RoleID} = Info, #?RoleKeyRec{accountID = AccountID}, Param) ->
	?ERROR_OUT("getRoleInfo accountID:~p roleID:~p, Param:~p", [AccountID, RoleID, Param]),
	Info.
getRoleInfo2(Info, RLvl, RCareer, RHead, RoleName, WingLevel, EquipInfoList, EquipLvList, FashionIDList) ->
	Info#recRoleListInfo{
		level = RLvl,
		career = RCareer,
		head = RHead,
		roleName = RoleName,
		canRename = false,
		visibleEquips = EquipInfoList,
		fashionOnbody = FashionIDList,
		refine_levels = [#pk_refineLevel{type = Type, level = RL} || #rec_equip_refine_info{type = Type, level = RL} <- EquipLvList],
		wingLevel = WingLevel
	}.
