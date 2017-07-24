%% @author zhengzhichun
%% @doc @todo Add description to playerCrossLogic.
%%跨服时，玩家在GS冻结数据，到Cross创建进程
%%玩家的跨服数据，只能通过跨服上的玩家进程，发回各自的服务器

-module(playerCrossLogic).
-include("playerPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	loginCross/1,
	packRoleData/0,
	createCrossPlayerOtp/2,
	crossRolePidInit/1,
	backGS/0,

	createGSPlayerOtp/1,
	doCallBack/1
]).

-export([
	sendDataToSourceServer/3
]).

-spec packRoleData() -> #rec_crossRoleData{}.
packRoleData() ->
	RoleID = playerState:getRoleID(),
	playerState:setHostRealName(gsMainLogic:getAreaName()),
	#rec_crossRoleData{
		accountID = playerState:getAccountID(),
		roleID = RoleID,
		role_list = playerState:getRoleList(),
		gmLevel = playerState:getGmLevel(),
		funcellInfo = playerState:getFuncellInfo(),
		platformAccountID = playerState:getPlateformAccountID(),
		platfromID = playerState:getPlateformID(),
		netPid = playerState:getNetPid(),
		oldRolePid = self(),
		playerState = 0,
		playerData = packRoleData(RoleID)
	}.


packRoleData(RoleID) ->

	playerSave:saveAllSkill(false),

	PlayerProps = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_prop),

	BaseRole =
		case ets:lookup(ets_rec_base_role, RoleID) of
			[#rec_base_role{} = BaseRole1] ->
				BaseRole1;
			_ ->
				throw(no_base_role)
		end,

	RoleKeyInfo =
		case core:queryRoleKeyInfoByRoleID(RoleID) of
			#?RoleKeyRec{} = RoleKeyInfo1 ->
				RoleKeyInfo1;
			_ ->
				throw(no_roleKeyInfo)
		end,

	MCoin = #rec_player_coin{roleID = {RoleID, _ = '_'}, _ = '_'},
	CoinList = edb:dirtyMatchRecord(rec_player_coin, MCoin),

	ListExt = edb:dirtyReadRecord(rec_ext_role, RoleID),


	MV = #rec_variant0{roleID = {RoleID, _ = '_'}, _ = '_'},
	VariantList = edb:dirtyMatchRecord(rec_variant0, MV),

	MDC = #rec_daily_counter0{roleID = {RoleID, _ = '_'}, _ = '_'},
	DailyCounterList = edb:dirtyMatchRecord(rec_daily_counter0, MDC),

	EquipRedefine = playerEDBLoad:getEquipRefineInfoList(RoleID),

	MPI = #rec_package_info{roleID = {RoleID, _ = '_'}, _ = '_'},
	PackageInfo = edb:dirtyMatchRecord(rec_package_info, MPI),

	ItemList = mnesia:dirty_index_read(rec_item, RoleID, #rec_item.roleID),

	MS = #rec_skill{roleID = {RoleID, _ = '_'}, _ = '_'},
	SkillList = edb:dirtyMatchRecord(rec_skill, MS),

	MSS = #rec_skill_slot{roleID = {RoleID, _ = '_'}, _ = '_'},
	SkillSlots = edb:dirtyMatchRecord(rec_skill_slot, MSS),

	MT = #rec_title{roleID = {RoleID, _ = '_'}, _ = '_'},
	TitleList = edb:dirtyMatchRecord(rec_title, MT),

	MAI = #rec_awaken_info{roleID = {RoleID, _ = '_'}, _ = '_'},
	AwakenInfo = edb:dirtyMatchRecord(rec_awaken_info, MAI),

	MPetI = #rec_pet_info{roleID = {RoleID, _ = '_'}, _ = '_'},
	PetList = edb:dirtyMatchRecord(rec_pet_info, MPetI),

	MPetE = #rec_pet_equip{roleID = {RoleID, _ = '_'}, _ = '_'},
	PetEquip = edb:dirtyMatchRecord(rec_pet_equip, MPetE),

	MPetS = #rec_pet_skill{roleID = {RoleID, _ = '_', _ = '_'}, _ = '_'},
	PetSkillList = edb:dirtyMatchRecord(rec_pet_skill, MPetS),

	MFashion = #rec_role_fashions{roleID = {RoleID, _ = '_'}, _ = '_'},
	FashionList = edb:dirtyMatchRecord(rec_role_fashions, MFashion),

	MFashionSlot = #rec_fashion_slot{roleID = {RoleID, _ = '_'}, _ = '_'},
	FashionSlot = edb:dirtyMatchRecord(rec_fashion_slot, MFashionSlot),

	MGodW = #rec_god_weapon{roleID = {RoleID, _ = '_'}, _ = '_'},
	GodWeapon = edb:dirtyMatchRecord(rec_god_weapon, MGodW),

	MRune = #recRune{roleID = RoleID, _ = '_'},
	RuneList = edb:dirtyMatchRecord(recRune, MRune),

	#rec_fullData{
		base_role = BaseRole,
		roleKeyInfo = RoleKeyInfo,
		coin_list = CoinList,
		ext_role = ListExt,
		variant = VariantList,
		daily_counter = DailyCounterList,
		equip_redefine = EquipRedefine,
		package_info = PackageInfo,
		props_list = PlayerProps,
		item_list = ItemList,
		skill_list = SkillList,
		skill_slot = SkillSlots,
		title_list = TitleList,
		awaken_info = AwakenInfo,
		pet_list = PetList,
		pet_equip = PetEquip,
		pet_skill_list = PetSkillList,
		fashion_list = FashionList,
		fashion_slots = FashionSlot,
		god_weapon = GodWeapon,
		rune_list = RuneList
	}.

%%登录到跨服,创建进程(GS)
%%这里强制匹配一下，醒目
-spec loginCross(TransMsg :: term()) -> ok.
loginCross(TransMsg) ->
	RoleID = playerState:getRoleID(),
	case core:isCross() of
		false ->
			TransMsg2 =
				case TransMsg of
					{_CrossMsgID, _Data} ->
						TransMsg;
					_ ->
						undefined
				end,
			?WARN_OUT("loginCross-1,roleID[~p],TransMsg[~p] -> TransMsg2[~p]", [RoleID, TransMsg, TransMsg2]),
			loginCross2(TransMsg2);
		_ ->
			?ERROR_OUT("loginCross is cross:~p,~p", [RoleID, misc:getStackTrace()]),
			skip
	end.
loginCross2(TransMsg) ->
	RoleData2 = packRoleData(),
	RoleData = RoleData2#rec_crossRoleData{transMsg = TransMsg},
	AccountID = playerState:getAccountID(),
	%% 记录切跨服的状态
	ets:insert(?TABLE_PlayerInfoCross, #onlinePlayerInfo{accountID = AccountID}),

	%% 发消息到跨服
	gsSendMsg:sendMsg2Cross(?PsNamePlayerMgr, createCrossPlayerOtp, RoleData),
	ok.

%%cross里执行，初始化进程
-spec crossRolePidInit(RoleData :: #rec_crossRoleData{}) -> ok.
crossRolePidInit( #rec_crossRoleData{
	netPid = NetPid,
	transMsg = TransMsg,
	oldRolePid = OldRolePid,
	role_list = RoleList,
	gmLevel = GMLevel,
	funcellInfo = FuncellInfo,
	platformAccountID = PlatformAccount,
	platfromID = PlatformID
} = RoleData) ->
	initCrossPlayerData(RoleData#rec_crossRoleData.playerData),
	playerState:setRoleList(RoleList),
	playerState:setGmLevel(GMLevel),
	playerState:setFuncellInfo(FuncellInfo),
	playerState:setPlateformAccountID(PlatformAccount),
	playerState:setPlateformID(PlatformID),
	
	case TransMsg of
		{CrossActivityID, _} ->
			playerState:setCrossActivityID(CrossActivityID);
		_ ->
			playerState:setCrossActivityID(undefined)
	end,


	PlayerCode = playerState:getPlayerCode(),
	PlayerID = playerState:getRoleID(),
	MaxHp = playerState:getMaxHp(),

	?WARN_OUT("loginCross-3,crossRolePidInit[~p],oldPid[~p],MaxHp[~p]", [PlayerID, OldRolePid, MaxHp]),
	playerState:setRunStep(?PlayerStateLoadRoleOK),
	AccountID = playerState:getAccountID(),

	myEts:updateEts(ets_rec_OnlinePlayer, AccountID, [
		{#rec_OnlinePlayer.roleID, PlayerID},
		{#rec_OnlinePlayer.pid, self()},
		{#rec_OnlinePlayer.code, PlayerCode}]),

	%% 通知普通服网络进程，绑定新的玩家进程
	psMgr:sendMsg2PS(NetPid, bindPid, self()),
	
	%% 通知普通服，旧玩家PID，登陆跨服成功
	psMgr:sendMsg2PS(OldRolePid, loginCrossAck, TransMsg),
	ok.


initCrossPlayerData(#rec_fullData{
	base_role = BaseRole,
	roleKeyInfo = RoleKeyInfo,
	coin_list = CoinList,
	ext_role = ExtRoleList,
	variant = VariantList,
	daily_counter = DailyCounterList,
	equip_redefine = EquipRedefine,
	package_info = PackageInfo,
	props_list = PlayerProps,
	item_list = ItemList,
	skill_list = SkillList,
	skill_slot = SkillSlots,
	title_list = TitleList,
	awaken_info = AwakenInfo,
	pet_list = PetList,
	pet_equip = PetEquip,
	pet_skill_list = PetSkillList,
	fashion_list = FashionList,
	fashion_slots = FashionSlot,
	god_weapon = GodWeapon,
	rune_list = RuneList
}) ->
	%% 写道内存
	writeRecord2Edb(rec_player_coin, CoinList),
	writeRecord2Edb(rec_ext_role, ExtRoleList),
	writeRecord2Edb(rec_variant0, VariantList),
	writeRecord2Edb(rec_daily_counter0, DailyCounterList),
	writeRecord2Edb(rec_equip_refine_info, EquipRedefine),
	writeRecord2Edb(rec_package_info, PackageInfo),
	writeRecord2Edb(rec_item, ItemList),
	writeRecord2Edb(rec_skill, SkillList),

	writeRecord2Edb(rec_skill_slot, SkillSlots),
	writeRecord2Edb(rec_title, TitleList),
	writeRecord2Edb(rec_awaken_info, AwakenInfo),
	writeRecord2Edb(rec_pet_info, PetList),
	writeRecord2Edb(rec_pet_equip, PetEquip),

	writeRecord2Edb(rec_pet_skill, PetSkillList),
	writeRecord2Edb(rec_role_fashions, FashionList),
	writeRecord2Edb(rec_fashion_slot, FashionSlot),
	writeRecord2Edb(rec_god_weapon, GodWeapon),
	writeRecord2Edb(recRune, RuneList),

	ets:insert(ets_rec_playerdata, #rec_playerdata{roleID = BaseRole#rec_base_role.roleID, rec_player_prop = PlayerProps}),
	ets:insert(ets_rec_base_role, BaseRole),
	ets:insert(ets_rolekeyinfo, RoleKeyInfo),

	%%初始化到进程
	playerState:setAccountID(BaseRole#rec_base_role.accountID),
	playerEDBLoad:loadRole(BaseRole#rec_base_role.roleID),
	ok.

writeRecord2Edb(Table, List)->
	[edb:writeRecord(Table, Record) || Record <- List] .

%%cross里执行
%%FromPid 为源玩家进程PID，其实这个PID已经没有意义
-spec createCrossPlayerOtp(FromPid :: pid(), RoleData :: #rec_crossRoleData{}) -> ok.
createCrossPlayerOtp(FromPid, #rec_crossRoleData{
	netPid = NetPid,
	accountID = AccountID,
	roleID = RoleID
} = RoleData) ->

	%%没有进程，新建一个进程
	{ok, RolePid} = playerOtp:start_link([NetPid]),

	ets:insert(ets_rec_OnlinePlayer, #rec_OnlinePlayer{
		accountID = AccountID,
		pid = RolePid,
		roleID = RoleID,
		netPid = NetPid,
		playerSaveTime = time:getUTCNowMS()}),
	psMgr:sendMsg2PS(RolePid, crossRolePidInit, RoleData),
	?LOG_OUT("loginCross-2,createCrossPlayerOtp(~p),Bind FromPid[~p],PlayerPid[~p],AccountID[~p]", [RoleID, FromPid, RolePid, AccountID]),
	ok.

%%cross里玩家进程执行
backGS() ->
	?WARN_OUT("backGS[~p]",[playerState:getRoleID()]),
	case core:isCross() of
		true ->
			backGS2();
		_ ->
			?ERROR_OUT("backGS not in cross[~p]", [playerState:getRoleID()]),
			skip
	end.
backGS2() ->
	RoleID = playerState:getRoleID(),
	NetPid = playerState:getNetPid(),
	RoleList = playerState:getRoleList(),
	AccountID = playerState:getAccountID(),
	GMLevel = playerState:getGmLevel(),
	Node = erlang:node(NetPid),
	MapPid = playerState:getMapPid(),
	PlayerCode = playerState:getPlayerCode(),
	PetCodeList = playerState:getCallPetCodeList(),

	try
		playerPet:clearAllPets()
	catch
		_:Err2 ->
			?ERROR_OUT("backGS clearAllPets err:~p", [Err2])
	end,

	CallBackTuple = packCrossActivityData(playerState:getCrossActivityID()),

	%% 带回源服的数据
	DataMsg = #rec_CrossToNormalData{
		roleID = RoleID,
		netPid = NetPid,
		roleList = RoleList,
		accountID = AccountID,
		gMLevel = GMLevel,
		playerCode = PlayerCode,
		callBackTuple = CallBackTuple,
		funcellInfo = playerState:getFuncellInfo(),
		plateformAccountID = playerState:getPlateformAccountID(),
		plateformID = playerState:getPlateformID()
	},
	
	psMgr:sendMsg2PS({?PsNamePlayerMgr, Node}, createGSPlayerOtp, DataMsg),
	psMgr:sendMsg2PS(MapPid, playerOffline, {PlayerCode, PetCodeList}),
	erlang:exit(self(), normal),
	ok.

%% 从跨服发消息到自己的源服
-spec sendDataToSourceServer(OtpName :: atom(), MsgID :: atom(), MsgData :: term()) -> boolean().
sendDataToSourceServer(OtpName, MsgID, MsgData) ->
	case core:isCross() of
		true ->
			NetPid = playerState:getNetPid(),
			Node = erlang:node(NetPid),
			psMgr:sendMsg2PS({?PsNameNormalCross, Node}, sendDataToSourceServer, {OtpName, MsgID, MsgData}),
			true;
		_ ->
			false
	end.

%%gs里执行，创建玩家进程，并自己加载指定角色
createGSPlayerOtp(#rec_CrossToNormalData{roleID = RoleID, accountID = AccountID, netPid = NetPid, gMLevel = GMLevel} = Data) ->
	%%没有进程，新建一个进程
	case playerMgrOtp:getOnlinePlayerInfoByAccountID(AccountID) of
		[#rec_OnlinePlayer{} | _] ->
			?ERROR_OUT("createGSPlayerOtp err:exist AccountID:~p", [AccountID]),
			skip;
		_ ->
			{ok, RolePid} = playerOtp:start_link([NetPid]),
			ets:insert(ets_rec_OnlinePlayer, #rec_OnlinePlayer{
				accountID = AccountID,
				roleID = RoleID,
				playerSaveTime = time:getUTCNowMS(),
				pid = RolePid,
				netPid = NetPid}),

			?LOG_OUT("loginCross-5,createGSPlayerOtp Bind NetPid[~p] PlayerPid[~p] AccountID[~p] gmlevel:~p", [NetPid, RolePid, AccountID, GMLevel]),
			ets:delete(?TABLE_PlayerInfoCross, AccountID),
			psMgr:sendMsg2PS(NetPid, bindPid, RolePid),

			%% 最后告诉玩家
			psMgr:sendMsg2PS(RolePid, loginGSFromCross, Data),
			ok
	end,
	ok.

%%在跨服上准备回本地服了，把一些活动数据带回去本地服中
-spec packCrossActivityData(ActivityID :: term()) -> term().
packCrossActivityData(requestJoinArenaBattleAck) ->
	TeamID = playerState:getCrosTeamID(),
	?WARN_OUT("packCrossActivityData ~p ~p  ~p", [playerState:getRoleID(), playerState:getCrosTeamID(), playerState:getCrosAreadReward()]),
	{dealCrosAreadReward, TeamID, playerState:getCrosAreadReward()};
packCrossActivityData(_) ->
	ok.

%%从跨服回到gs后，在GS上执行的回调（已经选定角色)
-spec doCallBack(Args :: term()) -> ok.
doCallBack({dealCrosAreadReward, TeamID, {BattleRes, GoodsID, GoodsNum, ArenaVal}}) ->
	playerState:setCrosTeamID(TeamID),
	playerCrosTeam:dealCrosAreadReward(BattleRes, GoodsID, GoodsNum, ArenaVal),
	psMgr:sendMsg2PS(?PsNameCrosArena, updateTeamMemberPid, {TeamID, playerState:getRoleID()}),
	fixPlayPid4CrossTeam(),
	ok;
doCallBack({dealCrosAreadReward, TeamID, _}) ->
	playerState:setCrosTeamID(TeamID),
	playerCrosTeam:dealCrossState(0),
	psMgr:sendMsg2PS(?PsNameCrosArena, updateTeamMemberPid, {TeamID, playerState:getRoleID()}),
	fixPlayPid4CrossTeam(),
	ok;
doCallBack(_) ->
	ok.


%%修改跨服角斗场的playerpid
fixPlayPid4CrossTeam() ->
	TeamID = playerState:getCrosTeamID(),
	RoleID = playerState:getRoleID(),
	case ets:lookup(?TABLE_CrosTeam, TeamID) of
		[#recCrosTeam{member = Members}] ->
			case lists:keyfind(RoleID, #recCrosTeamInfo.roleID, Members) of
				#recCrosTeamInfo{} = One ->
					NewMembers = lists:keyreplace(RoleID, #recCrosTeamInfo.roleID, Members, One#recCrosTeamInfo{pid = self()}),
					ets:update_element(?TABLE_CrosTeam, TeamID, [{#recCrosTeam.member, NewMembers}]);
				_ ->
					playerState:setCrosTeamID(0)
			end;
		_ -> playerState:setCrosTeamID(0)
	end,
	ok.
