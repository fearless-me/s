%%
%% @author zhongyunawei
%% @doc @todo 此文件为玩家数据状态存取，此模块中的所有函数必须是玩家进程调用，其它进程不能调用.


-module(playerState).
-author(zhongyuanwei).

-include("playerPrivate.hrl").
-include("../activity/gameactivity/worldboss/acWorldBossPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-compile(export_all).

% 获取角色Code
-spec getPlayerCode() -> Val | undefined when Val :: uint().
getPlayerCode() ->
	get(playerCode).

% 设置角色Code
-spec setPlayerCode(Code) -> OldVal | undefined when 
		  Code :: uint(), OldVal :: uint().
setPlayerCode(Code) when erlang:is_integer(Code) andalso Code > 0 ->
	put(playerCode, Code).

% 获取角色账户ID
-spec getAccountID() -> Val | undefined when Val :: uint().
getAccountID() ->
	get(playerAccountID).

% 设置角色账户ID
-spec setAccountID(AccountID) -> OldVal | undefined when 
		  AccountID :: uint(), OldVal :: uint().
setAccountID(AccountID) when erlang:is_integer(AccountID) andalso AccountID > 0 ->
	put(playerAccountID, AccountID).

% 设置帐户GM等级
-spec setGmLevel(Lvl::integer()) -> integer() | undefined.
setGmLevel(Lvl) ->
	case erlang:is_integer(Lvl) andalso Lvl >= 0 of
		true ->
			put(playerGmLevel, Lvl);
		_ ->
			put(playerGmLevel, 0)
	end.

-spec getGmLevel() -> integer() | undefined.
getGmLevel() ->
	get(playerGmLevel).

% 设置帐户是否解锁新种族
-spec setAccountUnlockNewRace(Val::integer()) -> integer() | undefined.
setAccountUnlockNewRace(Val) ->
	put(accountUnlockNewRace, Val).

-spec getAccountUnlockNewRace() -> integer() | undefined.
getAccountUnlockNewRace() ->
	case get(accountUnlockNewRace) of
		undefined ->
			0;
		Val ->
			Val
	end.

% 获取角色账户
-spec getAccount() -> Val | undefined when Val :: string().
getAccount() ->
	get(playerAccount).

% 设置角色账户
-spec setAccount(Account) -> OldVal | undefined when 
		  Account :: string(), OldVal :: string().
setAccount(Account) when erlang:is_list(Account) ->
	put(playerAccount, Account).

% 获取玩家下线标识
%%Type::(robKickOut|gmKickOut|normal|changeLine)
-spec getOffLineFlag() -> atom().
getOffLineFlag() ->
	get(kickedOutFlag).

% 设置玩家下线标识
-spec setOffLineFlag(Type::atom()) -> ok.
%%Type::(robKickOut|gmKickOut|normal|changeLine)
setOffLineFlag(Type) when Type =:= ?OffLineTypeRobKickOut orelse Type =:= ?OffLineTypeGmKickOut orelse 
							  Type =:= ?OffLineTypeNormal orelse Type =:= ?OffLineTypeChangeLine orelse
								Type =:= ?OffLineTypeServerDownKickOut orelse Type =:= ?OffLineTypeLoadDataFailed->
	put(kickedOutFlag, Type),
	ok;
setOffLineFlag(Type) ->
	?ERROR_OUT("setOffLineFlag badarg:[~p]",[Type]),
	ok.

%%保存地图得到的经验、金币
-spec setMapAward(Val::#recMapAward{}) ->term().
setMapAward(Val) ->
	put(mapAward,Val).

-spec getMapAward() ->#recMapAward{}.
getMapAward() ->
	case get(mapAward) of
		undefined ->
			#recMapAward{};
		Val ->
			Val
	end.
	
% 获取角色状态
-spec getStatus() -> Val when Val :: uint().
getStatus()->
	case get(playerStatus) of
		undefined ->
			0;
		Status ->
			Status
	end.

% 添加角色状态
-spec addStatus(Status) -> OldVal | undefined when
		  Status :: uint(), OldVal :: uint().
addStatus(Status) when erlang:is_integer(Status) andalso Status >= 0 ->
	Old = getStatus(),
	New = Old bor Status,
	put(playerStatus,New).

clearStatus(Status) ->
	Old = getStatus(),
	New = Old band (bnot Status),
	put(playerStatus,New),
    ok.

% 获取角色激活主菜单状态
-spec getMainMenuSta() -> Val when Val :: uint().
getMainMenuSta()->
	case get(mainMenuSta) of
		undefined ->
			0;
		Status ->
			Status
	end.

% 添加角色激活主菜单状态
-spec addMainMenuSta(Status) -> OldVal | undefined when
		  Status :: uint(), OldVal :: uint().
addMainMenuSta(Status) when erlang:is_integer(Status) andalso Status >= 0 ->
	Old = getMainMenuSta(),
	New = Old bor Status,
	put(mainMenuSta,New).

clearMainMenuSta(Status) ->
	Old = getMainMenuSta(),
	New = Old band (bnot Status),
	put(mainMenuSta,New),
    ok.

resetStatus() ->
	put(playerStatus,0).

%%获取动作状态
getActionStatus() ->
	get(actionStatus).

%%设置动作状态，比如站立，移动，死亡，拾取等等不由技能产生的状态
%%此函数只能在未死亡状态才能调用
setActionStatus(ActionStatus) when ActionStatus > 0, ActionStatus =< ?CreatureActionStatusMax ->
	case getActionStatus() of
		?CreatureActionStatusDead ->
			?ERROR_OUT("Player[~ts] Dead, can not set ActStatus[~p],Stack[~p]",
				[playerState:getName(),
					ActionStatus,
					misc:getStackTrace()
				]);
		State ->
			case State =/= ActionStatus of
				true ->
					%%只有状态不同，需要改变才记录时间
					Time = time:getUTCNowMSDiff2010(),
					setActionTime(Time),
					put(actionStatus,ActionStatus);
				_ ->
					%%状态相同，跳过
					skip
			end
	end.

%%只有死亡状态才能调用此函数
-spec setStandActionStatusFromDeadStatus() -> ok.
setStandActionStatusFromDeadStatus() ->
	case getActionStatus() of
		?CreatureActionStatusDead ->
			Time = time:getUTCNowMSDiff2010(),
			setActionTime(Time),
			put(actionStatus,?CreatureActionStatusStand);
		Status ->
			?ERROR_OUT("Player[~ts] Status[~p] is not Dead Status,,Stack[~p]",
				[playerState:getName(),
					Status,
					misc:getStackTrace()
				])
	end,
	ok.

%%设置当前状态时间
-spec setActionTime(Time) -> ok when
         Time :: uint().
setActionTime(Time) ->
	put(actionTime, Time),
	ok.

%%获取当前状态设置时间
-spec getActionTime() -> uint().
getActionTime() ->
	case get(actionTime) of
		undefined ->
			0;
		Val ->
			Val
	end.

%%获取PK状态
-spec getPkStatus() -> Val | undefined when Val :: uint().
getPkStatus() ->
    get(playerPkStatus).

%%设置PK状态
-spec setPkStatus(Status) -> OldVal | undefined when
       Status :: uint(),
       OldVal :: uint().
setPkStatus(Status) -> 
    put(playerPkStatus, Status).

%%获取是否在等待客户端返回切换地图成功的消息
isWaitClientAckEnteredMap() ->
	case get(isWaitClientAckEnteredMap) of
		true ->
			true;
		_ ->
			false
	end.

%%设置是否在等待客户端返回切换地图成功的消息
setWaitClientAckEnteredMap(V) ->
	put(isWaitClientAckEnteredMap,V),
	ok.
			
%%设置等待客服端消息
setWaitClientAckEnteredMapRef(Ref) ->
	put(clientAckEnteredMapRef, Ref),
	ok.

%%获取等待客服端消息
getWaitClientAckEnteredMapRef() ->
	get(clientAckEnteredMapRef).

%% 设置选中目标code
setSelectTargetCode(Code) when erlang:is_integer(Code) ->
    put(selectTargetCode, Code).

%% 获取选中目标的code
getSelectTargetCode() ->
	get(selectTargetCode).

%% 获取发送签到信息标记
-spec getSignInInfoSendFlag() -> Val | undefined when
	Val :: boolean().
getSignInInfoSendFlag() ->
	get(signInInfoSendFlag).
%% 设置发送签到信息标记
-spec setSignInInfoSendFlag(Set) -> OldVal | undefined when
	OldVal :: boolean(), Set::boolean().
setSignInInfoSendFlag(Set) ->
	put(signInInfoSendFlag, Set).

%% 获取哥布林玩法通知需要信息的列表
-spec getGoblinNoticeInfo() -> Val | undefined when
	Val :: list().
getGoblinNoticeInfo() ->
	get(goblinNoticeInfo).
%% 设置哥布林玩法通知需要信息的列表
-spec setGoblinNoticeInfo(Val) -> OldVal | undefined when
	Val :: list(),
	OldVal :: list().
setGoblinNoticeInfo(Val) ->
	put(goblinNoticeInfo, Val).

 
% 获取角色网络进程号
-spec getNetPid() -> Val | undefined when Val :: pid().
getNetPid() ->
	get(playerNetPid).

% 设置角色网络进程号
-spec setNetPid(NetPid) -> OldVal | undefined when
		  NetPid ::pid() | undefined, OldVal :: pid().
setNetPid(NetPid) ->
	put(playerNetPid, NetPid).

% 获取玩家的角色列表
-spec getRoleList() -> Val | undefined when Val :: list().
getRoleList() ->
	case get(roleList) of
		undefined ->
			[];
		List ->
			List
	end.

% 设置玩家的角色列表
-spec setRoleList(RoleList) -> OldVal | undefined when
		  RoleList :: list(), OldVal :: list().
setRoleList(RoleList) when erlang:is_list(RoleList) ->
	put(roleList,RoleList).

% 获取角色运行步骤
-spec getRunStep() -> Val | undefined when Val :: uint().
getRunStep() ->
	get(playerRunStep).

% 设置角色运行步骤
-spec setRunStep(RunStep) -> OldVal | undefined when
		  RunStep :: uint(), OldVal :: uint().
setRunStep(RunStep) when erlang:is_integer(RunStep) andalso RunStep >= 0 ->
	put(playerRunStep,RunStep).

%%获取角色ID
-spec getRoleID() -> Val when Val :: uint().
getRoleID() ->
	case get(playerRoleID) of
        undefined ->
			0;
        RoleID ->
			RoleID
    end.

%%设置角色ID
-spec setRoleID(RoleID) -> OldVal | undefined when
		  RoleID::uint(),OldVal::uint().
setRoleID(RoleID) when erlang:is_integer(RoleID) andalso RoleID >= 0 ->
	put(playerRoleID,RoleID).

%% 机器人的原RoleID
setRobRoleID(RoleID) ->
	put(playerRobRoleID, RoleID).

getRobRoleID() ->
	case get(playerRobRoleID) of
		undefined -> 0;
		RoleID -> RoleID
	end.

%% 获取是不是玩家进程，true是真正的玩家，false是机器人镜像
getIsPlayer() ->
	getRobRoleID() =:= 0.

%%设置角色创建时间
-spec setRoleCreateTime(Time::{datetime,{year,month,day,h,i,s}}) ->term().
setRoleCreateTime(Time) ->
	{datetime,CreateTime} = Time,
	UtcSec = time:diffSecFrom1970(CreateTime),
	playerPropSync:setInt(?PriProp_RoleCreateTime, UtcSec),
	put(roleCreateTime,Time).
%%获取角色创建时间
-spec getRoleCreateTime() ->{datetime,{year,month,day,h,i,s}}.
getRoleCreateTime() ->
	get(roleCreateTime).

% 获取角色所在地图ID
-spec getMapID() -> Val | undefined when Val :: uint().
getMapID() ->
	get(playerMapID).

% 设置角色所在地图ID
-spec setMapID(MapID) -> OldVal | undefined when
	MapID :: uint(), OldVal :: uint().
setMapID(MapID) when erlang:is_integer(MapID) andalso MapID >=0 ->
	put(playerMapID,MapID).

%%获取上次重置到复活点的时间
-spec getLastResetPosToRevivePtTime() -> uint().
getLastResetPosToRevivePtTime() ->
	case get(lastResetPosToRevivePtTime) of
		undefined ->
			0;
		N ->
			N
	end.

%%设置上次重置到复活点的时间
setLastResetPosToRevivePtTime(N) when erlang:is_integer(N) ->
	put(lastResetPosToRevivePtTime,N),
	ok.

% 获取角色所在的分组地图ID
-spec getMapIDGroup() -> Val | undefined when Val::uint().
getMapIDGroup() ->
	GroupID = getGroupID(),
	MapID = getMapID(),
	case GroupID > groupBase:getMinGroupID() of
		true ->
			groupBase:getMapIDByGroupID(GroupID);
		_ ->
			MapID
	end.

%% 设置分组ID
-spec setGroupID(GroupID::uint()) -> boolean().
setGroupID(GroupID) when erlang:is_integer(GroupID) andalso GroupID >= 0 ->
	OldGroupID = getGroupID(),
	playerPropSync:setInt64(?PubProp_GroupID, GroupID),
	case OldGroupID =/= GroupID of
		true ->
			%%?DEBUG_OUT("setGroupID: [~p ~s] [~p -> ~p]", [playerState:getRoleID(), playerState:getName(), OldGroupID, GroupID]),

			%% 强制脱战
			playerMap:syncChangeGroupID(OldGroupID, GroupID),
			playerBattle:leaveBattle(getPlayerCode());
		_ ->
			false
	end.

%% 只设置分组ID，不同步数据到客户端
-spec setGroupIDOnly(GroupID::uint()) -> ok.
setGroupIDOnly(GroupID) ->
	OldGroupID = getGroupID(),
	playerPropSync:setInt64(?PubProp_GroupID, GroupID),
	case OldGroupID =/= GroupID of
		true ->
			%%?DEBUG_OUT("setGroupIDOnly: [~p ~s] [~p -> ~p]", [playerState:getRoleID(), playerState:getName(), OldGroupID, GroupID]),
			%% 强制脱战
			playerBattle:leaveBattle(getPlayerCode()),
			psMgr:sendMsg2PS(?PsNameGroup, playerGroupIDChange, {OldGroupID, GroupID, playerMap:makeGroupPlayerInfo()});
		_ ->
			skip
	end,
	ok.

%% 获取分组ID
-spec getGroupID() -> uint().
getGroupID() ->
	case playerPropSync:getProp(?PubProp_GroupID) of
		undefined ->
			0;
		GroupID ->
			GroupID
	end.

% 获取角色所在位置
-spec getPos() -> {X,Y} | undefined when
		  X::float(),Y::float().
getPos() ->
	get(playerPos).

%%设置角色所在位置，该函数会自动同步到ETS表
%%同时支持瞬时移动时的九宫格刷新和离开通知
-spec setPos(X, Y) -> ok when X :: float(), Y :: float().
setPos(X,Y) when erlang:is_float(X) andalso erlang:is_float(Y) ->
	case getPos() of
		{SX,SY} when SX =/= X orelse SY =/= Y->
			put(playerPos,{X,Y}),
			playerMap:syncChangePos(SX,SY,X,Y,false);
		_ ->
			put(playerPos,{X,Y}),
			ok
	end,
	ok;
setPos(X,Y) when erlang:is_integer(X) orelse erlang:is_integer(Y) ->
	setPos(float(X), float(Y)).

%%只设置位置，不同步位置改变
-spec setPosOnly(X, Y) -> ok when
	X :: float(), Y :: float().
setPosOnly(X,Y) when erlang:is_float(X) andalso erlang:is_float(Y) ->
	case getPos() of
		{SX,SY} when SX =/= X orelse SY =/= Y->
			put(playerPos,{X,Y});
		_ ->
			put(playerPos,{X,Y}),
			ok
	end,
	ok.

-spec setCopyMapScoreDict(Dict::etsTab()) -> ok.
setCopyMapScoreDict(Dict) ->
	put(copyMapScoreDict, Dict),
	ok.

-spec getCopyMapScoreDict() -> undefined | etsTab().
getCopyMapScoreDict() ->
	get(copyMapScoreDict).

% 设置上次所在的地图位置
-spec setOldMapPos(MapId::uint(), OldX::float(), OldY::float()) -> boolean().
setOldMapPos(MapId, OldX, OldY) when erlang:is_float(OldX),erlang:is_float(OldY) ->
	case playerScene:getMapType(MapId) of
		?MapTypeNormal ->
			%% 只有普通地图才能设置
			put(oldMapPos, {MapId, OldX, OldY}),
			true;
		_ ->
			false
	end.

getOldMapPos() ->
	case get(oldMapPos) of
		{OldMapId, OldX, OldY} ->
			{OldMapId, OldX, OldY};
		Other ->
			?ERROR_OUT("getOldMapPos: ~p ~p ~p ~p ~p", [self(), ?MODULE, getPlayerCode(), Other, erlang:get_stacktrace()]),
			{1, 38.3,104.3}
	end.


%%设置当前地图的销毁时间
setCurrentCopyMapDestroyTime(MapID, MapPid) ->
	put(lastCopyMapDestoryTime,{MapID, MapPid}).
%%获取当前地图的销毁时间
getCurrentCopyMapDestroyTime()-> get(lastCopyMapDestoryTime).

% 获取角色所在地图的进程号
-spec getMapPid() -> Val | undefined when Val :: pid().
getMapPid() ->
	get(playerMapPid).

% 设置角色所在地图的进程号
-spec setMapPid(MapPid) -> OldVal | undefined when
		  MapPid :: pid(), OldVal :: pid().
setMapPid(MapPid) when erlang:is_pid(MapPid) ->
	put(playerMapPid,MapPid).
	
% 获取角色名
-spec getName() -> Name :: string().
getName() ->
	case get(playerName) of
		Name when erlang:is_list(Name) ->
			Name;
		_ErrorName ->
			""
	end.

% 设置角色名
-spec setName(Name) -> OldVal | undefined when
		  Name :: list(), OldVal :: list().
setName(Name) when erlang:is_list(Name) ->
	put(playerName, Name);
setName(Name) when erlang:is_binary(Name) ->
	setName(erlang:binary_to_list(Name)).

%%取出累计充值
-spec getRechargeAcc()->uint().
getRechargeAcc() ->
	variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_AccCharge).

% 获取角色等级
-spec getLevel() -> Val when Val :: uint().
getLevel() ->
	case get(playerLevel) of
		undefined ->
			0;
		N ->
			N
	end.

% 设置角色等级
-spec setLevel(Level) -> OldVal | undefined when
		   Level :: uint(), OldVal :: uint().
setLevel(Level) when erlang:is_integer(Level) andalso Level >= 0 ->
	Ret = put(playerLevel,Level),
	case Ret < Level of
		true ->
			playerSevenDayAim:updateCondition(?SevenDayAim_RoleLevel, []);
		_ ->
			skip
	end,
	Ret.

% 获取角色性别
-spec getSex() -> Val | undefined when Val :: race().
getSex() ->
	case get(playerSex) of
		undefined ->
			0;
		Sex ->
			Sex
	end.

% 设置角色性别
setSex(Sex) when erlang:is_integer(Sex) ->
	put(playerSex, Sex),
	ok.

% 获取角色头
getHead() ->
	case get(playerHead) of
		undefined ->
			0;
		Head ->
			Head
	end.

% 设置角色头
setHead(Head) when erlang:is_integer(Head) ->
	put(playerHead, Head),
	ok.

% 获取角色种族
-spec getRace() -> Val | undefined when Val :: race().
getRace() ->
	case get(playerRace) of
		undefined ->
			0;
		Race ->
			Race
	end.

% 设置角色种族
-spec setRace(Race) -> ok when
	Race :: race().
setRace(Race) when erlang:is_integer(Race) andalso Race > 0 ->
	put(playerRace, Race),
	ok;
setRace(Race) when erlang:is_integer(Race) ->
	?ERROR_OUT("race is error:rid=~p,race=~p",[playerState:getRoleID(), Race]),
	ok.

% 获取角色职业
-spec getCareer() -> Val | undefined when Val :: career().
getCareer() ->
	case get(playerCareer) of
		undefined ->
			0;
		Career ->
			Career
	end.

% 设置角色职业
-spec setCareer(Career) -> ok when
		   Career :: career().
setCareer(Career) when erlang:is_integer(Career) andalso Career > 0 ->
	put(playerCareer, Career),
	ok.


-spec setFashionList(FashionS::list()) -> term().
setFashionList(FashionS) when erlang:is_list(FashionS) ->
	put(playerFashionList,FashionS).

%% 时装列表
-spec getFashionList() ->[#recFashion{},...] | [].
getFashionList() ->
	case get(playerFashionList) of
		FashionS when erlang:is_list(FashionS) ->
			FashionS;
		_Val ->
			[]
	end.

%%保存已经穿戴的时装
-spec setFashionSlotList(List) -> ok when List::list().
setFashionSlotList(List) ->
	put(fashionSlotList,List),
	ok.

%%获取已经穿戴的时装
-spec getFashionSlotList() -> [#recFashionOnLoad{}].
getFashionSlotList() ->
	case get(fashionSlotList) of
		undefined ->
			[];
		List ->
			List
	end.

%%保存已经激活的套装
-spec setFashionSuitList(List) -> ok when List::list().
setFashionSuitList(List) ->
	put(fashionSuitList,List),
	ok.

%%获取已经激活的套装
-spec getFashionSuitList() -> [integer()].
getFashionSuitList() ->
	case get(fashionSuitList) of
		undefined ->
			[];
		List ->
			List
	end.

% 获取角色阵营
-spec getCamp() -> Val | undefined when Val :: uint().
getCamp() ->
	get(camp).

% 设置角色阵营
-spec setCamp(Camp, IsSend) -> OldVal | undefined when
		   Camp :: uint(), IsSend :: boolean(), OldVal :: uint().
setCamp(Camp, IsSend) when erlang:is_integer(Camp) andalso Camp >= 0 ->
	case IsSend of
		true ->
			playerPk:noticeCamp(Camp),
			playerPk:noticePetsCamp(Camp);
		_ ->
			skip
	end,
	put(camp, Camp).

%%保存跨服阵营
-spec setCrosCamp(Tuple::uint()) -> ok.
setCrosCamp(Tuple) ->
	put(crosCamp, Tuple),
	ok.

%%设置跨服阵营
-spec getCrosCamp() -> uint().
getCrosCamp() ->
	get(crosCamp).

-spec setCrosArenaCamp(Tuple::uint()) -> ok.
setCrosArenaCamp(Tuple) ->
	put(crosArenaCamp, Tuple),
	ok.

%%设置跨服阵营
-spec getCrosArenaCamp() -> uint().
getCrosArenaCamp() ->
	get(crosArenaCamp).

%%获取货币
-spec getCoin(CoinType) -> uint() | undefined when CoinType:: coinType().
getCoin(?CoinTypeExploit) ->
	playerLadder1v1:getArenaExploit();
getCoin(CoinType) when CoinType > 0 andalso CoinType =< ?CoinTypeMax ->
	get({coin,CoinType}).

%%设置货币
-spec setCoin(CoinType,CoinNum) -> ok when CoinType:: coinType(),CoinNum::uint().
setCoin(?CoinTypeExploit,CoinNum) ->
	case isFirstEnterMap() of
		false ->
			case playerState:getRunStep() of
				?PlayerStateLoadRoleOK ->
					playerLadder1v1:setExploitValue(CoinNum);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok;
setCoin(CoinType,CoinNum) when CoinType > 0 andalso CoinType =< ?CoinTypeMax
							   andalso erlang:is_number(CoinNum) andalso CoinNum >= 0 ->
	NewCoinNum = erlang:trunc(CoinNum),
	put({coin,CoinType},NewCoinNum),

	if
		?CoinTypePebble =:= CoinType ->
			playerDarkness:updatePlayerPebble();
		true ->
			skip
	end,
	ok.

% 获取角色当前HP值
-spec getCurHp() -> Val | undefined when Val :: uint().
getCurHp() ->
	Hp = get(playerCurHp),
	MaxHp = erlang:trunc(getBattlePropTotal(?Prop_MaxHP)),
	erlang:min(Hp, MaxHp).

% 设置角色当前HP值，此函数只能在活着的状态才能调用
-spec setCurHp(Hp) -> ok when
		   Hp :: number().
setCurHp(Hp) when erlang:is_float(Hp) andalso Hp >= 0.0 ->
	setCurHp(erlang:trunc(Hp));
%% 
%% setCurHp(Hp) when erlang:is_integer(Hp) ->
%% 	case playerState:getActionStatus() of
%% 		?CreatureActionStatusDead ->
%% 			%%为了得到堆栈信息，这里需要抛出一个异常
%% 			try
%% 				throw(error)
%% 			catch
%% 				_:_ ->
%% 					?ERROR_OUT("player[~ts] is dead,can not set hp,Stack[~p]",
%% 					           [playerState:getName(),
%% 					            erlang:get_stacktrace()])
%% 			end;
%% 		_ ->
%% 			MaxHp = erlang:trunc(getBattlePropTotal(?Prop_MaxHP)),
%% 			CurHp = misc:clamp(Hp, 0, MaxHp),
%% 			put('PlayerCurHp', CurHp)
%% 	end,
%% 	ok.

setCurHp(Hp) when erlang:is_integer(Hp), Hp >= 0 ->
	case playerState:getActionStatus() of
		?CreatureActionStatusDead ->
			put(playerCurHp, 0);
		_ ->
			MaxHp = erlang:trunc(getBattlePropTotal(?Prop_MaxHP)),
			CurHp = misc:clamp(Hp, 0, MaxHp),
			%%如果设置的值为0则同时设置状态为死亡状态
			case CurHp of
				0 ->
					playerState:setActionStatus(?CreatureActionStatusWillDie);
				_ ->
					skip
			end,
			put(playerCurHp, CurHp)
	end,
	ok.

%%设置玩家从数据库中初始化的血量
-spec setInitHpFromDB(Hp) -> ok when Hp::uint().
setInitHpFromDB(Hp) when erlang:is_integer(Hp), Hp > 0 ->
	put(playerCurHp, Hp).

-spec setRebornHp(Hp) -> ok when Hp::uint().
setRebornHp(Hp) when erlang:is_integer(Hp), Hp > 0 ->
	case playerState:getActionStatus() of
		?CreatureActionStatusDead ->
			MaxHp = erlang:trunc(getBattlePropTotal(?Prop_MaxHP)),
			CurHp = misc:clamp(Hp, 0, MaxHp),
			playerState:setStandActionStatusFromDeadStatus(),
			put(playerCurHp, CurHp);
		State ->
			%% fixme 这里为临时处理代码，处理血量和死亡状态不统一时，导致复活不成功的BUG
			?ERROR_OUT("setRebornHp name=~ts, roleID=~p, curHP=~p, State=~p",
				[getName(), getRoleID(), getCurHp(), State]),

			MaxHp = erlang:trunc(getBattlePropTotal(?Prop_MaxHP)),
			CurHp = misc:clamp(Hp, 0, MaxHp),
			put(playerCurHp, CurHp),

			Time = time:getUTCNowMSDiff2010(),
			setActionTime(Time),
			put(actionStatus, ?CreatureActionStatusStand),

			skip
	end,
	ok.

%%此函数只能用于复活时
%% -spec setRebornHp(Hp) -> ok when Hp::uint().
%% setRebornHp(Hp) ->
%% 	case playerState:getActionStatus() of
%% 		?CreatureActionStatusDead ->
%% 			MaxHp = erlang:trunc(getBattlePropTotal(?Prop_MaxHP)),
%% 			CurHp = misc:clamp(Hp, 0, MaxHp),
%% 			put('PlayerCurHp', CurHp);
%% 		_ ->
%% 			%%为了得到堆栈信息，这里需要抛出一个异常
%% 			try
%% 				throw(error)
%% 			catch
%% 				_:_ ->
%% 					?ERROR_OUT("player[~ts] is dead,can not set hp,Stack[~p]",
%% 					           [playerState:getName(),
%% 					            erlang:get_stacktrace()])
%% 			end
%% 	end,
%% 	ok.


%%获取最大HP
-spec getMaxHp() -> uint().
getMaxHp() ->
	MaxHp = playerState:getBattlePropTotal(?Prop_MaxHP),
	erlang:trunc(MaxHp).

% 获取角色当前MP值
-spec getCurMp() -> Val | undefined when Val :: uint().
getCurMp() ->
	get(playerCurMp).

% 设置角色当前MP值
-spec setCurMp(Mp) -> OldVal | undefined when
		   Mp :: number(), OldVal :: uint().
setCurMp(Mp) when erlang:is_float(Mp) andalso Mp >= 0.0 ->
	setCurMp(erlang:trunc(Mp));

setCurMp(Mp) when erlang:is_integer(Mp) ->
	put(playerCurMp, 0).
%%	MaxMp = erlang:trunc(getBattlePropTotal(?Prop_mana)),
%%    CurMp = misc:clamp(Mp, 0, MaxMp),
%%	put(playerCurMp, CurMp).

%%获取当前体力值
-spec getCurPhys() -> Value when
		  Value :: uint().
getCurPhys() ->
	case get(playerCurPhys) of
		undefined ->
			0;
		Value ->
			Value
	end.

%%设置当前体力值
-spec setCurPhys(Value) -> ok when
		  Value :: number().
setCurPhys(Value) when is_float(Value) andalso Value >= 0.0 ->
	setCurPhys(trunc(Value));
setCurPhys(Value) when is_integer(Value) ->
	MaxPhys = 0,%% trunc(getBattlePropTotal(?Prop_physical)),
	CurPhys = misc:clamp(Value, 0, MaxPhys),
	put(playerCurPhys, CurPhys).

%%获取上次广播的血量百分比
getLastHpPC() ->
	get(lastHpPC).

%%设置广播的血量百分比
setLastHpPC(PC) ->
	put(lastHpPC,PC).

%% 获取禁言时间
-spec getDenyChatTime() -> DateTime :: uint().
getDenyChatTime() ->
	case get(denyChatTime) of
        undefined -> 0;
        DateTime -> DateTime
    end.

%% 设置禁言时间
-spec setDenyChatTime(DateTime :: uint()) -> ok.
setDenyChatTime(DateTime) when erlang:is_integer(DateTime), DateTime >= 0 ->
	put(denyChatTime, DateTime),
	ok;
setDenyChatTime(_DateTime) ->
	put(denyChatTime, 0),
	ok.

%% 设置聊天CD时间
-spec setCdChatTime(CDTime ::list()) -> ok.
setCdChatTime(CDTime) when erlang:length(CDTime) > 0 ->
	put(cdChatTime, CDTime),
	ok;
setCdChatTime(_CDTime) ->
	put(cdChatTime, [{1,25},{2,10},{3,10},{4,10}]),
	ok.

%% 获取聊天CD时间
-spec getCdChatTime() -> list().
getCdChatTime() ->
	case get(cdChatTime) of
        undefined -> [{1,25},{2,10},{3,10},{4,10}];
        CDList -> CDList
    end.

% 获取角色当前经验值
-spec getCurExp() -> Val | undefined when Val :: uint().
getCurExp() ->
	get(playerCurExp).

% 设置角色当前经验值
-spec setCurExp(Exp) -> OldVal | undefined when
		   Exp :: uint(), OldVal :: uint().
setCurExp(Exp) when erlang:is_integer(Exp) andalso Exp >= 0 ->
	put(playerCurExp, Exp).

% 获取角色当前最大经验值
-spec getMaxExp() -> Val | undefined when Val :: uint().
getMaxExp() ->
	get(playerMaxExp).

% 设置角色当前最大经验值
-spec setMaxExp(Exp) -> OldVal | undefined when
    Exp :: uint(), OldVal :: uint().
setMaxExp(Exp) ->
    put(playerMaxExp, Exp).


% 获取角色移动目标列表
-spec getMoveTargetList() -> Val | undefined when Val :: list().
getMoveTargetList() ->
	get(playerMoveTargetList).

% 设置角色移动目标列表
-spec setMoveTargetList(MoveTargetList) -> OldVal | undefined when 
		  MoveTargetList :: list(), OldVal :: list().
setMoveTargetList(MoveTargetList) ->
	put(playerMoveTargetList, MoveTargetList).

% 获取角色移动方向
-spec getMoveDir() -> Val | undefined when Val :: uint().
getMoveDir() ->
	get(playerMoveDir).

% 设置角色移动方向
-spec setMoveDir(Dir) -> OldVal | undefined when 
		  Dir :: uint(), OldVal :: uint().
setMoveDir(Dir) when erlang:is_integer(Dir) andalso Dir >= 0 ->
	put(playerMoveDir, Dir).

% 获取角色真正移动方向
-spec getMoveRealDir() -> Val | undefined when Val :: uint().
getMoveRealDir() ->
	get(playerMoveRealDir).

% 设置角色真正移动方向
-spec setMoveRealDir(Dir) -> OldVal | undefined when 
		  Dir :: uint(), OldVal :: uint().
setMoveRealDir(Dir) when erlang:is_integer(Dir) andalso Dir >= 0 ->
	put(playerMoveRealDir, Dir).

% 获取角色当前使用技能
-spec getCurUseSkill() -> Val | undefined when Val :: #recCurUseSkill{}.
getCurUseSkill() ->
	get(curUseSkill).

% 设置角色当前使用技能
-spec setCurUseSkill(CurUseSkill) -> OldVal | undefined when
		  OldVal::#recCurUseSkill{},CurUseSkill::#recCurUseSkill{} | undefined.
setCurUseSkill(CurUseSkill)  ->
	put(curUseSkill, CurUseSkill).

% 获取角色当前使用瞬发技能
-spec getCurUseFastSkill() -> Val | undefined when Val :: #recCurUseSkill{}.
getCurUseFastSkill() ->
	get(curUseFastSkill).

% 设置角色当前使用瞬发技能
-spec setCurUseFastSkill(CurUseSkill) -> OldVal | undefined when
		  OldVal::#recCurUseSkill{},CurUseSkill::#recCurUseSkill{} | undefined.
setCurUseFastSkill(CurUseSkill)  ->
	put(curUseFastSkill, CurUseSkill).

% 获取角色当前使用引导技能
-spec getCurUseSlowSkill() -> Val | undefined when Val :: #recCurUseSkill{}.
getCurUseSlowSkill() ->
	get(curUseSlowSkill).

% 设置角色当前使用引导技能
-spec setCurUseSlowSkill(CurUseSkill) -> OldVal | undefined when
		  OldVal::#recCurUseSkill{},CurUseSkill::#recCurUseSkill{} | undefined.
setCurUseSlowSkill(CurUseSkill)  ->
	put(curUseSlowSkill, CurUseSkill).

%% 获取角色当前连击技能
-spec getComboSkill() -> undefined | list().
getComboSkill() ->
    get(comboSkill).

%% 设置角色当前连击技能
-spec setComboSkill(Val) -> list() | undefined when
        Val :: list().
setComboSkill(Val) ->
    put(comboSkill, Val).

%%获取角色当前使用技能效果作用次数
-spec getCurUseSkillEffect() -> Val | undefined when Val :: list().
getCurUseSkillEffect() ->
	get(curUseSkillEffect).

%%设置角色当前使用技能效果作用次数
-spec setCurUseSkillEffect(SkillEffectList) -> OldVal | undefined when 
                   SkillEffectList :: list(), OldVal :: list().
setCurUseSkillEffect(SkillEffectList) ->
	put(curUseSkillEffect, SkillEffectList).

% 获取角色技能字典，Key为技能ID，Value为#recSkill{}
-spec getSkill() -> Val | undefined when Val :: list().
getSkill() ->
	get(skill).

% 设置角色技能列表，Value为#recSkill{}
-spec setSkill(SkillList) -> OldVal | undefined when
		SkillList :: list(), OldVal :: list().
setSkill(SkillList) when erlang:is_list(SkillList)->
	put(skill, SkillList).

% 获取本次触发技能
-spec getTriggerSkill() -> Val | undefined when Val :: list().
getTriggerSkill() ->
	get(triskill).

% 设置本次触发技能
-spec setTriggerSkill(SkillList) -> ok when
        SkillList :: list().
setTriggerSkill(SkillList) when erlang:is_list(SkillList) ->
	put(triskill, SkillList),
	ok.

% 获取玩家技能槽
-spec getSlotList() -> SlotList | undefined when SlotList :: list().
getSlotList() ->
	get(slotList).

% 设置玩家技能槽
-spec setSlotList(SlotList::list()) -> ok.
setSlotList(SlotList) ->
	put(slotList, SlotList),
	ok.

%% 获取当前觉醒值
-spec getAwakens() -> list().
getAwakens() ->
	case get(awakenList) of
		undefined ->
			[];
		AwakenList ->
			AwakenList
	end.

%% 设置觉醒值
-spec setAwakens(AwakenList :: list()) -> OldVal :: list() | undefined.
setAwakens(AwakenList) when erlang:is_list(AwakenList) ->
	put(awakenList, AwakenList).

%% 获取当前觉醒列表
-spec getWakes() -> list().
getWakes() ->
	case get(wakeList) of
		undefined ->
			[];
		List ->
			List
	end.

%% 设置觉醒
-spec setWakes(List :: list()) -> ok.
setWakes(List) ->
	put(wakeList, List).

%%获取攻击间隔时间
getAttackIntervalTime() ->
	case get(attackIntervalTime) of
		undefined ->
			?DefaultAttackInternalTime; %%默认情况下为1000毫秒
		Time ->
			Time
	end.

%%设置攻击间隔时间，只有在更改了武器的情况下才会更新，默认情况下为1000毫秒
setAttackIntervalTime(Time) when erlang:is_integer(Time) andalso Time > 0 ->
	put(attackIntervalTime,Time);
setAttackIntervalTime(_) ->
	skip.

%%获取最终攻击间隔时间
getFinalAttackIntervalTime() ->
	AttackSpeed = 0, %% getBattlePropTotal(?Prop_attackspeed),
	AIT0 = getAttackIntervalTime(),
	AIT0 / (1 + AttackSpeed).

% 获取角色技能冷却, Key为技能ID，值为time:getUTCNowMSDiff2010()得到的值
-spec getSkillCD() -> Val | undefined when Val :: list().
getSkillCD() ->
	get(playerSkillCDList).

% 设置角色技能冷却, Key为技能ID，值为time:getUTCNowMSDiff2010()得到的值
-spec setSkillCD(SkillCDList) -> OldVal | undefined when
		   SkillCDList :: list(), OldVal :: list().
setSkillCD(SkillCDList) ->
	put(playerSkillCDList, SkillCDList).

% 获取群体技能冷却时间字典
-spec getSkillGroupCD() -> Val | undefined when Val :: list().
getSkillGroupCD() ->
	get(playerSkillGroupCDList).

% 设置群体技能冷却时间字典
-spec setSkillGroupCD(SkillGroupCDList) -> OldVal | undefined when
		   SkillGroupCDList :: list(), OldVal :: list().
setSkillGroupCD(SkillGroupCDList) ->
	put(playerSkillGroupCDList, SkillGroupCDList).

% 获取角色全局冷却时间
-spec getGlobalCD() -> Val | undefined when Val :: uint().
getGlobalCD() ->
	get(playerGlobalCD).

% 设置角色全局冷却时间
-spec setGlobalCD(GlobalCD) -> OldVal | undefined when
		  GlobalCD :: uint(), OldVal :: uint().
setGlobalCD(GlobalCD) ->
	put(playerGlobalCD, GlobalCD).

%%设置角色滑屏使用时间
-spec setDashCD(UseTime) -> OldVal | undefined when
       UseTime :: uint(), OldVal :: uint().
setDashCD(UseTime) ->
   put(playerDashCD, UseTime).

%%获取角色滑屏使用时间
-spec getDashCD() -> Val | undefined when Val :: uint().
getDashCD() ->
	get(playerDashCD).

%% 获取角色战斗属性基础值
-spec getBattlePropBase(Prop) -> Val | undefined when Prop::uint(),Val::number().
getBattlePropBase(Prop) when Prop >= ?Prop_Min andalso Prop =< ?PropMax ->
	get({battlePropBase,Prop}).

%% 设置角色战斗属性基础值
-spec setBattlePropBase(Prop,Val) -> OldVal | undefined when
		  Prop::uint(), Val::number(),OldVal::number().
setBattlePropBase(Prop,Val) when Prop >= ?Prop_Min andalso Prop =< ?PropMax ->
	put({battlePropBase,Prop},Val).

%% 获取角色战斗属性加法值
-spec getBattlePropAdd(Prop) -> Val | undefined when Prop::uint(),Val::number().
getBattlePropAdd(Prop) when Prop >= ?Prop_Min andalso Prop =< ?PropMax ->
	get({battlePropAdd,Prop}).

%% 设置角色战斗属性加法值
-spec setBattlePropAdd(Prop,Val) -> Val | undefined when
		  Prop::uint(), Val::number().
setBattlePropAdd(Prop,Val) when Prop >= ?Prop_Min andalso Prop =< ?PropMax ->
	put({battlePropAdd,Prop},Val).

%% 获取角色战斗属性乘法值
-spec getBattlePropPC(Prop) -> Val | undefined when Prop::uint(),Val::list().
getBattlePropPC(Prop) when Prop >= ?Prop_Min andalso Prop =< ?PropMax ->
	get({battlePropPC,Prop}).

%% 设置角色战斗属性乘法值
-spec setBattlePropPC(Prop,Val) -> OldVal | undefined when
		  Prop::uint(), OldVal::list(),Val::list().
setBattlePropPC(Prop,Val) when Prop >= ?Prop_Min andalso Prop =< ?PropMax andalso erlang:is_list(Val) ->
	put({battlePropPC,Prop},Val).

%% 设置角色buff属性加法值列表
-spec setBuffBattlePropAddList(PropAddList::list()) -> ok.
setBuffBattlePropAddList(PropAddList) ->
	put(buffBattlePropAdd, PropAddList).

%%获取角色buff属性加法值列表
-spec getBuffBattlePropAddList() -> list().
getBuffBattlePropAddList() ->
	case get(buffBattlePropAdd) of
		undefined ->
			[];
		List ->
			List
	end.

%% 设置角色buff属性乘法值列表
-spec setBuffBattlePropPcList(PropPcList::list()) -> ok.
setBuffBattlePropPcList(PropPcList) ->
	put(buffBattlePropPc, PropPcList).

%% 获取角色buff属性乘法值列表
-spec getBuffBattlePropPcList() -> list().
getBuffBattlePropPcList() ->
	case get(buffBattlePropPc) of
		undefined ->
			[];
		List ->
			List
	end.

%% 获取角色战斗属性总值
-spec getBattlePropTotal(Prop) -> Val when Prop::uint(),Val::number().
getBattlePropTotal(Prop) when Prop >= ?Prop_Min andalso Prop =< ?PropMax ->
	case get({battlePropTotal,Prop}) of
		undefined ->
			0.0;
		V ->
			V
	end;
getBattlePropTotal(_Prop) ->
	0.0.

%% 设置角色战斗属性总值
-spec setBattlePropTotal(Prop,Val) -> ok when
		  Prop::uint(), Val::number().
setBattlePropTotal(Prop,Val) when Prop >= ?Prop_Min andalso Prop =< ?PropMax ->
	put({battlePropTotal,Prop},Val),
	ok.

%% 获取角色战斗属性修改标记
-spec getBattlePropModified(Prop) -> Val | undefined when Prop::uint(),Val::boolean().
getBattlePropModified(Prop) when Prop >= ?Prop_Min andalso Prop =< ?PropMax ->
	get({battlePropModified,Prop}).

%% 设置角色战斗属性修改标记
-spec setBattlePropModified(Prop,Val) -> OldVal | undefined when
		   Prop::uint(), OldVal::boolean(),Val::boolean().
setBattlePropModified(Prop,Val) when Prop >= ?Prop_Min andalso Prop =< ?PropMax ->
	put({battlePropModified,Prop},Val).

% 获取角色特有战斗属性
-spec getPlayerSpecBattleProp() -> Val | undefined when Val :: #recPlayerSpecBattleProp{}.
getPlayerSpecBattleProp() ->
	get(playerSpecBattleProp).

% 设置角色特有战斗属性
-spec setPlayerSpecBattleProp(PlayerSpecBattleProp) -> OldVal | undefined when
		  PlayerSpecBattleProp :: #recPlayerSpecBattleProp{}, OldVal :: #recPlayerSpecBattleProp{}.
setPlayerSpecBattleProp(#recPlayerSpecBattleProp{} = PlayerSpecBattleProp) ->
	put(playerSpecBattleProp,PlayerSpecBattleProp).
% 获取角色怒气
-spec getPlayerCourage() -> Val | undefined when Val :: float().
getPlayerCourage() ->
	case get(playerCourage) of
		undefined ->
			0;
		Courage ->
			Courage
	end.
% 设置角色怒气
-spec setPlayerCourage(Val) -> OldVal | undefined when
	Val :: float(), OldVal :: float().
setPlayerCourage(Val) ->
	put(playerCourage,Val).
% 获取角色触发器
-spec getTrigger() -> Val | undefined when Val :: array:array().
getTrigger() ->
	get(playerTrigger).

% 设置角色触发器
-spec setTrigger(ArTrigger) -> OldVal | undefined | badarg when 
		  ArTrigger :: array:array(), OldVal :: array:array().
setTrigger(ArTrigger) ->
	case array:is_array(ArTrigger) of
		true ->
			put(playerTrigger, ArTrigger);
		_ ->
			throw(badarg)
	end.

%% 获取角色装备
-spec getEquips() -> Val | undefined when Val :: list().
getEquips() ->
	get(playerEquip).

%% 设置角色装备
-spec setEquips(EquipList) -> OldVal | undefined  when 
		  EquipList :: list(), OldVal :: list().
setEquips(EquipList) when erlang:is_list(EquipList) -> 
	put(playerEquip,EquipList).

%% 获取角色装备重铸
-spec getEquipsRecast() -> Val | undefined when Val ::tuple().
getEquipsRecast() ->
	get(playerEquipRecast).

%% 设置角色装备重铸
-spec setEquipsRecast(RecastRes) -> OldVal when 
		  RecastRes :: tuple() | undefined, OldVal :: tuple() | undefined.
setEquipsRecast(RecastRes) -> 
	put(playerEquipRecast,RecastRes).

%% 获取角色装备精炼
-spec getEquipRefine() -> list().
getEquipRefine() ->
	case get(playerEquipRefine) of
		undefined ->
			[];
		RefineList ->
			RefineList
	end.

%% 获取装备冲星
-spec getEquipStarList() -> list().
getEquipStarList() ->
	case get(playerEquipStar) of
		undefined ->
			[];
		L ->
			L
	end.

%% 设置装备冲星
-spec setEquipStarList(L::list()) -> ok.
setEquipStarList(L) ->
	put(playerEquipStar, L).

%% 设置角色装备精炼
-spec setEquipRefine(RefineList::list()) -> ok.
setEquipRefine(RefineList) ->
	put(playerEquipRefine, RefineList),
	ok.

%%获取玩家使用外挂的次数
getUseExtPluginCount() ->
	case get(useExtPluginCount) of
		undefined ->
			0;
		N ->
			N
	end.

%%获取玩家使用外挂的次数
setUseExtPluginCount(N) ->
	put(useExtPluginCount,N).


getUseExtPluginStartTime() ->
	case get(useExtPluginStartTime) of
		undefined ->
			0;
		Time ->
			Time
	end.

setUseExtPluginStartTime(Time) ->
	put(useExtPluginStartTime,Time).

%% ======================================================================
%% @doc team
%% ======================================================================

%% 获取角色队伍ID
-spec getTeamID() -> TeamID when TeamID::uint().
getTeamID() ->
	teamInterface:getTeamID(playerState:getRoleID()).
%%	getTeamID(?PlayerTeamTypeNormal).

-spec getTeamID(Type) -> TeamID when Type::uint(), TeamID::uint().
getTeamID(Type) when Type >= ?PlayerTeamTypeMin andalso Type =<?PlayerTeamTypeMax ->
	case get({teamID,Type}) of
       undefined ->
		   0;
		TeamID ->
			TeamID
	end.

%% 设置角色队伍ID
-spec setTeamID(TeamID) -> OldVal::uint() | undefined when
	TeamID::uint().
setTeamID(TeamID) -> ok.
%%	setTeamID(TeamID, ?PlayerTeamTypeNormal).

-spec setTeamID(TeamID, Type) -> OldVal::uint() | undefined when
		  TeamID::uint(),
		  Type::uint().
setTeamID(TeamID, Type) when Type >= ?PlayerTeamTypeMin andalso Type =<?PlayerTeamTypeMax ->
	OldTeamID = getTeamID(Type),
	case OldTeamID =/= TeamID andalso Type =:= ?PlayerTeamTypeNormal of
		true ->
			%% 普通队伍有改变
			?DEBUG_OUT("setTeamID:~s,~p,[~p -> ~p]", [getName(), self(), OldTeamID, TeamID]),
			playerPropSync:setInt64(?PubProp_TeamID, TeamID);
		_ ->
			skip
	end,
	put({teamID, Type}, TeamID).

%% 清除队伍ID
-spec delTeamID(Type::uint()) -> ok.
delTeamID(Type) when Type >= ?PlayerTeamTypeMin andalso Type =<?PlayerTeamTypeMax ->
	setTeamID(0, Type),
	ok.

%% 删除队伍信息（删除后才能进行删除队伍ID操作）
%% 此步骤会把队伍信息全部删掉
-spec delTeamInfo(Type::uint()) -> ok.
delTeamInfo(Type) when Type >= ?PlayerTeamTypeMin andalso Type =<?PlayerTeamTypeMax ->
%%	case playerState:getTeamID(Type) of
%%		TeamID when erlang:is_integer(TeamID) andalso TeamID > 0 ->
%%			ets:delete(?TABLE_TeamInfo, TeamID);
%%		_ ->
%%			skip
%%	end,
	ok.
%% 发送普通队伍队友位置信息的缓存
-spec setIsOpenMapPanel(Flag::boolean()) -> OldVal::boolean()| undefined.
setIsOpenMapPanel(Flag) ->
	put(isOpenMapPanel, Flag).
-spec getIsOpenMapPanel() -> Val::boolean().
getIsOpenMapPanel() ->
	case get(isOpenMapPanel) of
		undefined ->
			false;
		Flag ->
			Flag
	end.
%% 上次发起快速组队时间
-spec setQuickTeamStartTime(Time::uint64()) -> OldVal::uint64()| undefined.
setQuickTeamStartTime(Time) ->
	put(quickTeamCD, Time).
-spec getQuickTeamStartTime() -> Val::uint64().
getQuickTeamStartTime() ->
	case get(quickTeamCD) of
		undefined ->
			0;
		Time ->
			Time
	end.
%% ======================================================================
%% ======================================================================

%% 获取坐骑耐久值
-spec getMountSta() -> number().
getMountSta() ->
	case get(mountSta) of
		undefined -> 
			0;
		Sta ->
			Sta
	end.

%% 设置坐骑耐久值（耐久值为0，下马）
%% 内部会判断耐久值是不是为负，自动设置为0
-spec setMountSta(MountSta :: number()) -> ok.
setMountSta(MountSta) when erlang:is_number(MountSta) ->
	case MountSta >= 0 of
		true ->
			put(mountSta, MountSta);
		false ->
			put(mountSta, 0)
	end.

%%设置宠物战斗力
-spec setPetForce(Force::uint()) -> ok.
setPetForce(Force) ->
	?DEBUG_OUT("pet force value:~p", [Force]),
	put(petForce, Force),
	ok.

%%获取宠物战斗力
-spec getPetForce() -> ok.
getPetForce() ->
	case get(petForce) of
		undefined -> 
			0;
		Force ->
			Force
	end.

%%获取玩家当前召唤宠物信息(包含召唤的人民币宠物和魔法召唤宠物)
-spec getCallPet() ->  CallPet when CallPet :: list().
getCallPet() ->
    case get(playerCallPet) of
		CallPet when erlang:is_list(CallPet) ->
			CallPet;
		undefined -> 
			[]
	end.

-spec getCallPetCodeList() -> list().
getCallPetCodeList() ->
	List = getCallPet(),
	[Code ||#recCallPet{pet_code = Code} <- List].

-spec getCallPetIDList() -> list().
getCallPetIDList() ->
	List = getCallPet(),
	[ID || #recCallPet{pet_id = ID} <- List].

%%设置玩家当前召唤宠物信息
-spec setCallPet(CallPet :: list()) ->  ok.
setCallPet(CallPet) when erlang:is_list(CallPet) ->
	put(playerCallPet, CallPet),

	%% 更新宠物与召唤宠物
	PlayerCode = getPlayerCode(),
	PlayerEts = getMapPlayerEts(),
	case PlayerEts /= undefined andalso PlayerCode /= undefined of
		true ->
			ets:update_element(PlayerEts, PlayerCode, {#recMapObject.callPetList, CallPet});
		_ ->
			skip
	end,
	ok.

%%获取当前召唤的载体
-spec getCallCarrierList() -> list().
getCallCarrierList() ->
	case get(callCarrier) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置当前召唤的载体
-spec setCallCarrierList(List) -> ok when
		  List :: list().
setCallCarrierList(List) ->
	put(callCarrier, List),
	ok.

%%获取当前召唤的怪物
-spec getCallMonsterList() -> list().
getCallMonsterList() ->
	case get(callMonster) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置当前召唤的怪物
-spec setCallMonsterList(List) -> ok when
		  List :: list().
setCallMonsterList(List) ->
	put(callMonster, List),
	ok.

%%获取上次更新的时间
-spec getLastTickTime() -> uint().
getLastTickTime() ->
	get(playerLastTickTime).

%%设置上次更新的时间
-spec setLastTickTime(TickTime) -> OldVal | undefined when
		  TickTime::uint(),OldVal::uint().
setLastTickTime(TickTime) when erlang:is_integer(TickTime)->
	put(playerLastTickTime,TickTime).

%% 获取上次聊天时间
-spec getLastChatTime(Channel :: uint()) -> uint().
getLastChatTime(Channel) ->
	case get({playerLastChatTime, Channel}) of
		undefined ->
			0;
		Time ->
			Time
	end.

%% 设置上次聊天时间
-spec setLastChatTime(ChatTime :: uint(), Channel :: uint()) -> ok.
setLastChatTime(ChatTime, Channel) ->
	put({playerLastChatTime, Channel}, ChatTime),
	ok.

% 获取玩家所在地图的所有玩家表
-spec getMapPlayerEts() -> Val | undefined when Val :: etsTab().
getMapPlayerEts() ->
	get(mapPlayerEts).

% 设置玩家所在地图的所有玩家表
-spec setMapPlayerEts(PlayerEts) -> OldVal | undefined when
		  PlayerEts :: etsTab(), OldVal :: etsTab().
setMapPlayerEts(PlayerEts) ->
	put(mapPlayerEts,PlayerEts).

% 获取宠物所在地图的所有宠物表
-spec getMapPetEts() -> Val | undefined when Val :: etsTab().
getMapPetEts() ->
	get(mapPetEts).

% 设置宠物所在地图的所有宠物表
-spec setMapPetEts(PetEts) -> OldVal | undefined when
		  PetEts :: etsTab(), OldVal :: etsTab().
setMapPetEts(PetEts) ->
	put(mapPetEts,PetEts).

%%获取玩家所在地图的所有怪物Ets表
getMapMonsterEts() ->
	get(mapMonsterEts).

%%设置玩家所在地图的所有怪物Ets表
-spec setMapMonsterEts(MonsterEts) -> OldVal | undefined when
		  MonsterEts :: etsTab(), OldVal :: etsTab().
setMapMonsterEts(MonsterEts) ->
	put(mapMonsterEts,MonsterEts).

%%获取玩家所在地图的所有NPC Ets表
-spec getMapNpcEts() -> etsTab() | undefined.
getMapNpcEts() ->
	get(mapNpcEts).

%%设置玩家所在地图的所有NPC Ets表
-spec setMapNpcEts(NpcEts) -> OldVal | undefined when
		  NpcEts :: etsTab(), OldVal :: etsTab().
setMapNpcEts(NpcEts) ->
	put(mapNpcEts,NpcEts).

%%获取玩家所在地图的所有采集对象 Ets表
-spec getMapCollectEts() -> etsTab() | undefined.
getMapCollectEts() ->
	get(mapCollectEts).

%%设置玩家所在地图的所有采集对象 Ets表
-spec setMapCollectEts(CollectEts) -> OldVal | undefined when
		  CollectEts :: etsTab(), OldVal :: etsTab().
setMapCollectEts(CollectEts) ->
	put(mapCollectEts,CollectEts).

%%获取玩家所在地图的所有使用物品 Ets表
-spec getMapUseItemEts() -> etsTab() | undefined.
getMapUseItemEts() ->
	get(mapUseItemEts).

%%设置玩家所在地图的所有使用物品 Ets表
-spec setMapUseItemEts(UseItemEts) -> OldVal | undefined when
		  UseItemEts :: etsTab(), OldVal :: etsTab().
setMapUseItemEts(UseItemEts) ->
	put(mapUseItemEts,UseItemEts).

% 获取玩家所在地图的Line
-spec getMapLine() -> Val | undefined when Val :: int().
getMapLine() ->
	get(mapLine).

% 设置玩家所在地图的Line
-spec setMapLine(Line) -> OldVal | undefined when
		  Line :: int(), OldVal :: int().
setMapLine(Line) when erlang:is_integer(Line) ->
	put(mapLine,Line).

%% 获取角色所有已经保存到数据库的已完成任务
-spec getSubmittedTask() -> Val when Val :: list().
getSubmittedTask() ->
	case get(playerCompletedTask) of
		undefined ->
			[];
		List ->
			List
	end.

%% 设置角色已经保存到数据库的已完成任务
-spec setSubmittedTask(CompletedTaskList) -> ok when
	CompletedTaskList :: list().
setSubmittedTask(CompletedTaskList) when erlang:is_list(CompletedTaskList) ->
	put(playerCompletedTask,CompletedTaskList),
	ok.

%% 获取角色已接受任务
-spec getAcceptedTask() -> Val when Val :: [#rec_task{},...] | [].
getAcceptedTask() ->
	case get(playerAcceptedTask) of
		undefined ->
			[];
		List ->
			List
	end.

%% 设置角色已接受任务
-spec setAcceptedTask(DictAcceptedTask) -> ok when
	DictAcceptedTask :: list().
setAcceptedTask(DictAcceptedTask) ->
	put(playerAcceptedTask, DictAcceptedTask),
	ok.

%% 获取角色VIP
-spec getVip() -> Val when Val :: number().
getVip() ->
	case get(playerVip) of
		undefined ->
			0;
		Val ->
			Val
	end.

% 设置角色VIP
-spec setVip(Vip) -> OldVal | undefined when 
		  Vip :: number(), OldVal :: number().
setVip(Vip) when erlang:is_number(Vip) ->
	put(playerVip,Vip).

%% 上次执行传送功能的时间
setVipLastTransmit(Time) ->
	put('VipLastTransmit', Time).
getVipLastTransmit() ->
	case get('VipLastTransmit') of
		undefined ->
			0;
		Time ->
			Time
	end.

%%获取上次Tick的秒时间
getLastSecTick() ->
	get(lastSecTick).

%%设置Tick的秒时间
setLastSecTick(Sec) ->
	put(lastSecTick,Sec).

%%获取上次Tick的分钟时间
getLastMinTick() ->
	get(lastMinTick).

%%设置Tick的分钟时间
setLastMinTick(Sec) ->
	put(lastMinTick,Sec).

%%获取上次杀戮值tick时间
getLastKvTick() ->
	get(lastKvTick).

%%设置上次杀戮值tick时间
setLastKvTick(T) ->
	put(lastKvTick, T).

%%获取角色的面部朝向
-spec getFaceDir() -> {DirX,DirY} when
		  DirX::float(),DirY::float().
getFaceDir() ->
	get(faceDir).

%%设置角色的面部朝向
-spec setFaceDir(DirX,DirY) -> OldVal | undefined when
		  OldVal::{DirX,DirY},DirX::float(),DirY::float().
setFaceDir(DirX,DirY) ->
	case DirX =:= 0 andalso DirY =:= 0 of
		true ->
			?ERROR_OUT("Error Face Dir[~p,~p] Value",[DirX,DirY]),
			throw("Error Face Dir");
		_ ->
			skip
	end,
	put(faceDir,{DirX,DirY}).

%%获取攻击回血技能信息
-spec getHitRestoreHp() -> {SkillID,SN} | undefined when
		  SkillID::uint(),SN::uint().
getHitRestoreHp() ->
	get(hitRestoreHp).

%%设置攻击回血技能信息
-spec setHitRestoreHp({SkillID,SN}) -> OldVal | undefined when
		  OldVal::{SkillID,SN},SkillID::uint(),SN::uint().
setHitRestoreHp({SkillID,SN} = Info) when SkillID >= 0 andalso SN >= 0 ->
	put(hitRestoreHp,Info).

%%获取仇恨值
-spec getHateList() -> list() | undefined.
getHateList() ->
	get(hate).

%%设置仇恨值
-spec setHateList(List) -> OldVal | undefined when
		  List::list(),OldVal::list().
setHateList(List) ->
	put(hate,List).

%%邮件
setMailEts(MailEts) ->
	put(mailEts, MailEts).

getMailEts() ->
	get(mailEts).

%%获取背包
-spec getPackage(PackageType) -> list() when PackageType::bagType().
getPackage(PackageType) when PackageType >= ?Item_Location_Start andalso PackageType =< ?Item_Location_Max ->
	get({package, PackageType}).

%%设置背包
-spec setPackage(PackageType, PackageContent) -> ok when PackageType::bagType(), PackageContent::list().
setPackage(PackageType,PackageContent) when PackageType >= ?Item_Location_Start andalso PackageType =< ?Item_Location_Max
							   andalso erlang:is_list(PackageContent) ->

	put({package, PackageType}, PackageContent),
	ok.


%%获取有时效性的道具或者装备的列表
getHasExpiredTimeGoodsList() ->
	case get(expiredTimeGoodsList) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置有时效性的道具或者装备的列表
setHasExpiredTimeGoodsList(List) ->
	put(expiredTimeGoodsList,List),
	ok.

%%获取背包开格子数据
-spec getPackageInfo(PackageType) -> #rec_package_info{} when PackageType::bagType().
getPackageInfo(PackageType) when PackageType >= ?Item_Location_Start andalso PackageType =< ?Item_Location_Max ->
	get({packageInfo, PackageType}).

%%设置背包开格子数据
-spec setPackageInfo(PackageType, PackageInfoContent) -> ok when PackageType::bagType(), PackageInfoContent::#rec_package_info{}.
setPackageInfo(PackageType,PackageInfoContent) when PackageType >= ?Item_Location_Start andalso PackageType =< ?Item_Location_Max ->
	put({packageInfo, PackageType}, PackageInfoContent),
	ok.

%%获取上次定时保存的时间
-spec getLastSaveTime() -> uint() | undefined. 
getLastSaveTime() ->
	get(lastSaveTime).

%%设置上次定时保存的时间
-spec setLastSaveTime(LastSaveTime) -> ok when
		  LastSaveTime::uint().
setLastSaveTime(LastSaveTime) ->
	put(lastSaveTime,LastSaveTime),
	ok.

%%获取上次宠物tick的时间
-spec getLastPetBattleTime() -> uint() | undefined. 
getLastPetBattleTime() ->
	get(lastPetBattleTime).

%%设置上次宠物tick的时间
-spec setLastPetBattleTime(LastTickTime) -> ok when
		  LastTickTime::uint().
setLastPetBattleTime(LastTickTime) ->
	put(lastPetBattleTime,LastTickTime),
	ok.

%%获取上次宠物争夺令tick的时间
-spec getLastPetManorBattleTime() -> uint() | undefined. 
getLastPetManorBattleTime() ->
	get(lastPetManorBattleTime).

%%设置上次宠物争夺令tick的时间
-spec setLastPetManorBattleTime(LastTickTime) -> ok when
		  LastTickTime::uint().
setLastPetManorBattleTime(LastTickTime) ->
	put(lastPetManorBattleTime, LastTickTime),
	ok.


%%获取插槽技能
-spec getSlotSkill() -> list().
getSlotSkill() ->
    case get(slotSkill) of
		undefined ->
			[];
		List ->
			List
    end.

%%设置插槽技能
-spec setSlotSkill(SlotSkillList) -> ok when
       SlotSkillList :: list().
setSlotSkill(SlotSkillList) -> 
    put(slotSkill, SlotSkillList),
    ok.

getDelSlotSkillList() ->
	case get(delSlotSkillList) of
		undefined ->
			[];
		List ->
			List
	end.

setDelSlotSkillList(L) when erlang:is_list(L) ->
	put(delSlotSkillList,L),
	ok.


%%获取BUFF列表
-spec getBuffList() -> list() | undefined.
getBuffList() ->
	get(buffList).

%%设置BUFF列表
-spec setBuffList(List) -> ok when
       List::list().
setBuffList(List) ->
    put(buffList,List),
    ok.

%%获取下线保存buff列表
-spec getSaveBuffList() -> list().
getSaveBuffList() ->
	case get(saveBuffList) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置下线保存buff列表
-spec setSaveBuffList(List) -> ok when
		 List :: list().
setSaveBuffList(List) ->
	put(saveBuffList, List),
	ok.

%% 获取指定npc信息
-spec getNpcByCode(Code) -> #recMapObject{} | notFound when
		  Code::uint().
getNpcByCode(Code) ->
	case getMapNpcEts() of
		undefined ->
			notFound;
		NpcEts -> 
			case myEts:lookUpEts(NpcEts, Code) of
				[#recMapObject{} = Npc] ->
					Npc;
				_ ->
					notFound
			end
	end.

%% 删除第一次进入地图标识
-spec delFirstEnterMap() -> ok.
delFirstEnterMap() ->
	erlang:erase(isFirstEnterMap),
	ok.

%% 获取第一次进入地图标识
-spec isFirstEnterMap() -> boolean().
isFirstEnterMap() ->
	case get(isFirstEnterMap) of
		undefined ->
			false;
		_ ->
			true
	end.

%% 设置第一次进入地图标识
-spec setFirstEnterMap() -> ok.
setFirstEnterMap() ->
	put(isFirstEnterMap, 1),
	ok.

%% 通过monsterCode 获取怪物所在地图信息
-spec getMapIdByMonsterID(MonsterID) -> #recMapObject{} | notFound when
		  MonsterID::uint().
getMapIdByMonsterID(MonsterCode) ->
	case getMapMonsterEts() of
		undefined ->
			notFound;
		MapMonsterEts -> 
			case myEts:lookUpEts(MapMonsterEts, MonsterCode) of
				[#recMapObject{mapId = MapId}] ->
					MapId;
				_ ->
					notFound
			end
	end.


%%获取玩家的移动速度
-spec getMoveSpeed() -> number().
getMoveSpeed() ->
	getBattlePropTotal(?Prop_MoveSpeed).


%% 获取背包上次整理时间
-spec getLastSortBagTime(BagType) -> Result when
		  BagType :: ?Item_Location_Bag
		  		   | ?Item_Location_Equip_Bag
		  		   | ?Item_Location_Storage
		  		   | ?Item_Location_Equip_Storage,
		  Result :: uint() | undefined.
getLastSortBagTime(BagType) ->
	get({sortBagTime, BagType}).

%%　 设置背包上次整理时间
-spec setLastSortBagTime(BagType, SortTime) -> OldVal | undefined when 
		  BagType :: ?Item_Location_Bag
		  		   | ?Item_Location_Equip_Bag
		  		   | ?Item_Location_Storage
		  		   | ?Item_Location_Equip_Storage,
		  SortTime :: uint(),
		  OldVal :: uint().
setLastSortBagTime(BagType, SortTime) ->
	put({sortBagTime, BagType}, SortTime).
%% 获取上次附近队伍请求时间
-spec getLastNearByTeamRequestTime() -> uint().
getLastNearByTeamRequestTime() ->
	case get(lastNearByTeamRequestTime) of
		undefined ->
			0;
		N ->
			N
	end.

%% 设置附近队伍请求时间
-spec setLastNearByTeamRequestTime(Time) -> OldTime | undefined when
		  Time :: uint(),
		  OldTime :: uint().
setLastNearByTeamRequestTime(Time) ->
	put(lastNearByTeamRequestTime, Time).

%% 获取上次获取商城列表的时间
-spec getLastItemListAtMall() -> uint().
getLastItemListAtMall() ->
	get(lastItemListAtMall).

%% 设置获取商城列表的时间
-spec setLastItemListAtMall(Time) -> OldTime | undefined when
		  Time :: uint(),
		  OldTime :: uint().
setLastItemListAtMall(Time) ->
	put(lastItemListAtMall, Time).

%% 获取指定采集对象信息
-spec getCollectByCode(Code) -> #recMapObject{} | notFound when
		  Code::uint().
getCollectByCode(Code) ->
	case getMapCollectEts() of
		undefined ->
			notFound;
		CollectEts -> 
			case myEts:lookUpEts(CollectEts, Code) of
				[#recMapObject{} = Collect] ->
					Collect;
				_ ->
					notFound
			end
	end.

%% 获取指定使用物品信息
-spec getUseItemByCode(Code) -> #recMapObject{} | notFound when
		  Code::uint().
getUseItemByCode(Code) ->
	case getMapUseItemEts() of
		undefined ->
			notFound;
		UseItemEts -> 
			case myEts:lookUpEts(UseItemEts, Code) of
				[#recMapObject{} = UseItem] ->
					UseItem;
				_ ->
					notFound
			end
	end.

%%获取玩家的每日计数器
-spec getDailyCounterList() -> undefined | list().
getDailyCounterList() ->
	case get(dailyCounter) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置玩家的每日计数器
-spec setDailyCounterList(List) -> ok when
		  List::list().
setDailyCounterList(List) ->
	put(dailyCounter,List),
	ok.

%%% 个人交易行相关字典 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 设置交易行查询条件
setTradeQueryCondition(Condition) ->
    put(tradeQueryCondition, Condition).

%% 获取交易行查询条件
getTradeQueryCondition() ->
    get(tradeQueryCondition).

%% 本次操作码
setTradeOpCode(OpCode) ->
    put(tradeOpCode, OpCode).

%% 获取本次操作码
getTradeOpCode() ->
    get(tradeOpCode).

%% 设置排序列
setTradeSortCol(Col) ->
	put(tradeSortCol, Col).

%% 获取排序列
getTradeSortCol() ->
	get(tradeSortCol).

%% 设置排序方式
setTradeSortType(Type) ->
	put(tradeSortType, Type).

%% 获取排序方式
getTradeSortType() ->
	get(tradeSortType).

%% 设置查询结果
setTradeQueryResult(Result) ->
    put(tradeQueryResult, Result).

%% 获得查询结果
getTradeQueryResult() ->
    get(tradeQueryResult).

%% 设置当前查询结果为第几页
setTradeNowPage(Number) ->
    put(tradeNowPage, Number).

%% 交易行当前查询结果第几页
getTradeNowPage() ->
    get(tradeNowPage).

%% 设置当前查询的结果总数
setTradeQueryResultNumber(Number) ->
    put(tradeQueryResultNumber, Number).

%% 获取当前查询的结果总数
getTradeQueryResultNumber() ->
    get(tradeQueryResultNumber).

%% 设置每页个数
setTradeOnePageNumber(Number) ->
    put(tradeOnePageNumber, Number).

%% 获取每页个数
getTradeOnePageNumber() ->
    get(tradeOnePageNumber).

%% 设置查询订单大类
setTradeClass(Type) ->
    put(tradeClassType, Type).

%% 获得查询订单大类
getTradeClass() ->
    get(tradeClassType).

%% 设置物品查询大类
setTradeItemClass(Type) ->
    put(tradeItemClassType, Type).

%% 获得物品查询大类
getTradeItemClass() ->
    get(tradeItemClassType).

%% 设置物品类型
setTradeItemType(Type) ->
    put(tradeItemType, Type).

%% 获得物品类型
getTradeItemType() ->
    get(tradeItemType).

%% 设置物品子类型
setTradeItemSubType(SubType) ->
    put(tradeItemSubType, SubType).

%% 获得物品子类型
getTradeItemSubType() ->
    get(tradeItemSubType).

%%% 交易行相关字典 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 自己当前所在公会中，自己的信息
-spec setSelfGuildInfo(tuple()) -> tuple() | undefined.
setSelfGuildInfo(Info) ->
	{NGuildID, NGuildName, NGuildLevel} =
		case Info of
			{#rec_guild{guildID = GuildID, guildName = GuildName}, #rec_guild_member{power = GuildLevel}} ->
				{GuildID, GuildName, GuildLevel};
			_ ->
				{0, [], 0}
		end,

	playerPropSync:setInt64(?PubProp_GuildID, NGuildID),
	playerPropSync:setInt(?PubProp_GuildLevel, NGuildLevel),
	playerPropSync:setString(?PubProp_GuildName, NGuildName),
	put(selfGuildInfo, Info).

%% 更新个人军团的同步信息
-spec updateSelfGuildInfo() -> ok.
updateSelfGuildInfo() ->
    {GuildID, GuildName, GuildLevel} =
        case getSelfGuildMember() of
            #rec_guild_member{guildID = GID, power = Power} ->
                case ets:lookup(rec_guild, GID) of
                    [#rec_guild{guildName = GName}] ->
                        {GID, GName, Power};
                    _ ->
                        {0, "", 0}
                end;
            _ ->
                {0, "", 0}
        end,

    case playerPropSync:getProp(?PubProp_GuildID) =:= GuildID of
        true -> skip;
        _ -> playerPropSync:setInt64(?PubProp_GuildID, GuildID)
    end,
    case playerPropSync:getProp(?PubProp_GuildLevel) =:= GuildLevel of
        true -> skip;
        _ -> playerPropSync:setInt(?PubProp_GuildLevel, GuildLevel)
    end,
    case playerPropSync:getProp(?PubProp_GuildName) =:= GuildName of
        true -> skip;
        _ -> playerPropSync:setString(?PubProp_GuildName, GuildName)
    end,
    ok.

%% 获取自己的军团成员信息
-spec getSelfGuildMember() -> #rec_guild_member{} | {}.
getSelfGuildMember() ->
    RoleID = getRoleID(),
    case ets:lookup(rec_guild_member, RoleID) of
        [#rec_guild_member{} = Member] -> Member;
        _ -> {}
    end.

%% 获取自己的军团信息
-spec getSelfGuildInfo() -> tuple() | undefined.
getSelfGuildInfo() ->
    case getGuildID() of
        0 -> {};
        GuildID ->
            case ets:lookup(rec_guild, GuildID) of
                [#rec_guild{} = Guild] -> Guild;
                _ -> {}
            end
    end.

%% 获取自己的公会ID
-spec getGuildID() -> uint() | 0.
getGuildID() ->
	case getSelfGuildMember() of
		#rec_guild_member{guildID = GuildID} -> GuildID;
		_ -> 0
    end.

%% 获取公会等级
-spec getGuildLevel() -> uint() | 0.
getGuildLevel() ->
	case getSelfGuildInfo() of
		#rec_guild{guildLevel = GuildLevel} -> GuildLevel;
		_ -> 0
    end.

%% 获取自己的公会名字
-spec getGuildName() -> list().
getGuildName() ->
	case getSelfGuildInfo() of
		#rec_guild{guildName = GuildName} -> GuildName;
		_ -> ""
	end.

%% 保存公会列表
-spec setGuildList(List::list()) -> list() | undefined.
setGuildList(List) ->
	put(guildList, List).

-spec getGuildList() -> list() | undefined.
getGuildList() ->
	get(guildList).

%% 保存自己所在公会的信息，包括公会主数据和成员数据
-spec setGuildInfo({#rec_guild{}, list(), list()}) -> {#rec_guild{}, list(), list()} | undefined.
setGuildInfo(Info) ->
	put(guildInfo, Info).

-spec getGuildInfo() -> {#rec_guild{}, list(), list()} | undefined.
getGuildInfo() ->
	get(guildInfo).

%% 获取军团副本开启状态
-spec getGuildCopyOpenState() -> boolean().
getGuildCopyOpenState() ->
	GuildID = getGuildID(),
	case GuildID > 0 of
		true ->
			case myEts:lookUpEts(recGuildMemory, GuildID) of
				[#recGuildMemory{isOpen = IsOpen}] ->
					IsOpen;
				_ ->
					false
			end;
		_ ->
			false
	end.

%% 设置设置信息列表
-spec setSettingInfo(SetInfo :: list()) -> OldVal | undefined when
		  OldVal :: list().
setSettingInfo(SetInfo) when erlang:is_list(SetInfo) ->
	put(setting, SetInfo).

%% 获取设置信息列表
-spec getSettingInfo() -> list().
getSettingInfo() ->
	case get(setting) of
		Val when erlang:is_list(Val) ->
			Val;
		_OtherInfo ->
			[]
	end.

%%获取上次移动超过的距离
getMoveOverDist() ->
	get(moveOverDist).

%%设置移动超过的距离
setMoveOverDist(Dist) ->
	put(moveOverDist,Dist).

%% 设置\获取gm踢人时的返回pid
setGMKickoutCallBackPidAndCMDSerial( CallbackPid ) ->
	put( gmKickoutCallBackPid, CallbackPid ).
getGMKickoutCallBackPidAndCMDSerial( ) ->
	get( gmKickoutCallBackPid ).

%% 登录玩家在funcell的信息
-type funcellInfo() :: {Fgi::string(),FedId::string(),PlatformName::string()}.
-spec setFuncellInfo(Info) -> term() when
		  Info::funcellInfo().
setFuncellInfo(Info) ->
	put(funcellInfo,Info).

-spec getFuncellInfo() ->funcellInfo().
getFuncellInfo() ->
	case get( funcellInfo ) of
		undefined ->
			{"0","0"," "};
		{Fgi,Fed,PlatformName} ->
			NewFgi = 
				if
					Fgi ==[] ->
						"0";
					true ->
						Fgi
				end,
			NewFed = 
				if
					Fed ==[] ->
						"0";
					true ->
						Fed
				end,
			{NewFgi,NewFed,PlatformName}
	end.

%% 登录时间
-spec setOnlineTime(Time) -> ok when
	Time::uint().
setOnlineTime(Time) ->
	put(onlineTime,Time),
	ok.

-spec getOnlineTime() -> uint() | undefined.
getOnlineTime() ->
	get( onlineTime ).

%%获取道具组使用时间列表
-spec getItemUsedTimeList() -> list().
getItemUsedTimeList() ->
	case get(itemGroupIDList) of
		undefined ->
			[];
		List ->
			List
	end.

%%根据道具组获取道具组使用时间
-spec getItemUseTime(ItemGroupID) -> uint() when ItemGroupID::uint16().
getItemUseTime(ItemGroupID) ->
	List = getItemUsedTimeList(),
	case lists:keyfind(ItemGroupID,#rec_item_used_cd.itemGroupID,List) of
		#rec_item_used_cd{itemGroupID = ItemGroupID,lastUsedTime = Time} ->
			Time;
		_ ->
			0
	end.

%%设置道具组使用时间
-spec setItemUseTime(ItemGroupID,UsedTime) -> ok when
	ItemGroupID::uint16(),UsedTime::uint().
setItemUseTime(ItemGroupID,UsedTime) ->
	List = getItemUsedTimeList(),
	L = lists:keystore(ItemGroupID,#rec_item_used_cd.itemGroupID,List,
					   #rec_item_used_cd{roleID = playerState:getRoleID(),
										 itemGroupID = ItemGroupID,
										 lastUsedTime = UsedTime}),
	put(itemGroupIDList,L),
	ok.
%% 角色绑定的手机号
-spec setBindPhoneNum(PhoneNum) -> OldVal | undefined when
	PhoneNum :: uint(), OldVal :: uint().
setBindPhoneNum(PhoneNum) ->
	put(bindPhoneNum, PhoneNum).
-spec getBindPhoneNum() -> Val | undefined when Val :: uint().
getBindPhoneNum() ->
	get(bindPhoneNum).
%%获取杀死怪物Code
-spec getKillMonsterCode() -> uint().
getKillMonsterCode() ->
	case get(monsterCode) of
		undefined ->
			0;
		Code ->
			Code
	end.

%%设置杀死怪物Code
-spec setKillMonsterCode(Code) -> ok when
         Code :: uint() | undefined.
setKillMonsterCode(Code) ->
	put(monsterCode, Code),
    ok.

%%获取上次杀死自己攻击者Code
-spec getKillSelfType() -> uint().
getKillSelfType() ->
	case get(attackType) of
		undefined ->
			0;
		Type ->
			Type
	end.	

%%设置上次杀死自己攻击者类型
-spec setKillSelfType(Code) -> ok when
		  Code :: uint().
setKillSelfType(Code) ->
	put(attackType, Code),
	ok.

%%获取当前吸收盾值
-spec getAbsorbShield() -> number().
getAbsorbShield() ->
	case get(absorb) of
		undefined ->
			0;
		Value ->
			Value
	end.

%%设置当前吸收盾
-spec setAbsorbShield(Value) -> ok when
		  Value :: number().
setAbsorbShield(Value) ->
	put(absorb, Value).

%%设置玩家已参与活动的ID
-spec setAwardTakens(AwardIDList) ->ok when
		  AwardIDList::[AwardID::integer() , ...] | [].
setAwardTakens(AwardIDList) ->
	put(playerAwardTakens,AwardIDList),
	ok.
%%预判是否已领
-spec getAwardTakens() -> AwardIDList when
		  AwardIDList::[AwardID::integer() , ...] | [].
getAwardTakens() ->
	case get(playerAwardTakens) of
		undefined ->
			[];
		Val ->
			Val
	end.

%%返回玩家上一次获取激活码的时刻
-spec getLastGetActiveCodeTime() -> number() | undefined.
getLastGetActiveCodeTime()->
	get( getLastGetActiveCodeTime ).

%%设置玩家上一次获取激活码的时刻
-spec setLastGetActiveCodeTime(Value) -> ok when
	Value :: number().
setLastGetActiveCodeTime(Value)->
	put( getLastGetActiveCodeTime, Value ).

%%返回玩家的平台帐号ID
-spec getPlateformAccountID() -> number() | undefined.
getPlateformAccountID()->
	get( getPlateformAccountID ).

%%设置玩家的平台帐号ID
-spec setPlateformAccountID(Value) -> ok when
	Value :: string().
setPlateformAccountID(Value)->
	put( getPlateformAccountID, Value ).

-spec getLSCheckKey() ->Val::string() | undefined.
getLSCheckKey() ->
	get('LSCheckKey').

-spec setLSCheckKey(Key::string()) ->term().
setLSCheckKey(Key) ->
	put('LSCheckKey',Key).

%%返回玩家的平台ID
-spec getPlateformID() -> number() | undefined.
getPlateformID()->
	get( getPlateformID ).

%%设置玩家的平台ID
-spec setPlateformID(Value) -> ok when
	Value :: string().
setPlateformID(Value)->
	put( getPlateformID, Value ),
	ok.

%%获取玩家战斗状态
-spec isPlayerBattleStatus() -> boolean().
isPlayerBattleStatus() ->
	case get(battleStatus) of
		undefined ->
			false;
		Status ->
			Status
	end.

%%设置玩家战斗状态
-spec setPlayerBattleStatus(IsSet) -> ok when
	IsSet :: boolean().
setPlayerBattleStatus(Value) -> 
	put(battleStatus, Value),

	case Value of
		true ->
			playerOfflineExp:endMeditation();
		_ -> skip
	end,
	ok.

%%设置上次换装备的时间
-spec setLastExchangeEquip(Time) -> ok when Time::uint().
setLastExchangeEquip(Time) ->
	put(lastExchangeEquip,Time),
	ok.

%%获取上次换装备的时间
-spec getLastExchangeEquip() -> N::uint().
getLastExchangeEquip() ->
	case get(lastExchangeEquip) of
		undefined ->
			0;
		N ->
			N
	end.

%%获取玩家滑屏状态
-spec isPlayerDashStatus() -> boolean().
isPlayerDashStatus() ->
	case get(dashStatus) of
		undefined ->
			false;
		{Status, _} ->
			Status
	end.

%%获取玩家滑屏状态
-spec getPlayerDashStatus() -> {boolean(), uint()} | undefined.
getPlayerDashStatus() ->
	get(dashStatus).

%%设置玩家滑屏状态
-spec setPlayerDashStatus(Value) -> ok when
		  Value :: {boolean(), uint()}.
setPlayerDashStatus(Value) ->
	put(dashStatus, Value),
	ok.

%%获取和平模式下可杀戮玩家
-spec getKillPlayerList() -> list().
getKillPlayerList() ->
	case get(killPlayerList) of
		undefined ->
			[];
		List ->
			List
	end.
		  
%%设置和平模式下可杀戮模式
-spec setKillPlayerList(List) -> ok when
		  List :: list().
setKillPlayerList(List) ->
	put(killPlayerList, List),
	ok.

%%保存玩家临时语音包
-spec setTempVoice(Value) -> ok when Value :: tuple().
setTempVoice(Value) ->
    put(setTempVoice, Value),
    ok.

%%获取临时语音包
-spec getTempVoice() -> tuple().
getTempVoice() ->
    case get(setTempVoice) of
        undefined -> {};
        VoiceTuple -> VoiceTuple
    end.

%%%%boss战中，玩家相关tick的时间记录
%%-spec setWorldBossTickTime(Value::#playerBossTickTime{})->term().
%%setWorldBossTickTime(Value)->
%%	put(worldBossTickTime,Value).
%%-spec getWorldBossTickTime() ->#playerBossTickTime{}.
%%getWorldBossTickTime() ->
%%	case get(worldBossTickTime) of
%%		undefined ->
%%			#playerBossTickTime{};
%%		Val ->
%%			Val
%%	end.
%%
%%-spec addWorldBossAddDamage(Damage::integer()) ->ok.
%%addWorldBossAddDamage(Damage) ->
%%	Old = getWorldBossAddDamage(),
%%	put(worldBossAddDamage,Old+Damage),
%%%%	psMgr:sendMsg2PS(?PsNameWorldBOss, bossDamageCacheReset, {playerState:getRoleID(), Old+Damage,playerState:getName()}),
%%	ok.
%%-spec getWorldBossAddDamage() -> VAl::integer().
%%getWorldBossAddDamage() ->
%%	case get(worldBossAddDamage) of
%%		undefined ->
%%			0;
%%		Val ->
%%			Val
%%	end.
%%
%%setDamageBroadcastTickTime(Time) ->
%%	put(damageBroadcastTickTime,Time).
%%getDamageBroadcastTickTime() ->
%%	get(damageBroadcastTickTime).

%%-spec cleanWorldBossAddDamage() ->boolean().
%%cleanWorldBossAddDamage() ->
%%	erlang:erase(worldBossAddDamage).

%%%% =========名次计算的进程字典
%%%% 清除累计
%%-spec cleanDictWorldBossDamageRank() -> term() | undefined.
%%cleanDictWorldBossDamageRank() ->
%%	erlang:erase(worldBossDamageRank_mc_fun).
%%
%%-spec getDictWorldBossDamageRank() ->term() | undefined.
%%getDictWorldBossDamageRank() ->
%%	get(worldBossDamageRank_mc_fun).
%%
%%-spec setDictWorldBossDamageRank(NowVal::term()) ->term().
%%setDictWorldBossDamageRank(NowVal) ->
%%	put(worldBossDamageRank_mc_fun,NowVal).

setLastLogExp(Exp) ->
	put(lastLogExp,Exp),
	ok.

getLastLogExp() ->
	case get(lastLogExp) of
		undefined ->
			0;
		Exp ->
			Exp
	end.

%%玩家切磋相关字典

%%设置玩家请求切磋时间
-spec setBattleLearnRequestTime(Time::uint()) -> ok.
setBattleLearnRequestTime(Time) ->
	put(battleLearnRequestTime, Time),
	ok.

%%获取玩家请求切磋时间
-spec getBattleLearnRequestTime() -> uint().
getBattleLearnRequestTime() ->
	case get(battleLearnRequestTime) of
		undefined ->
			0;
		Time ->
			Time
	end.

%%设置玩家切磋信息
-spec setBattleLearnInfo(#recBattleLearn{} | []) -> ok.
setBattleLearnInfo(RecBattleLearn) ->
	put(battleLearnInfo, RecBattleLearn).

%%获取玩家切磋信息
-spec getBattleLearnInfo() -> #recBattleLearn{} | [].
getBattleLearnInfo() ->
	case get(battleLearnInfo) of
		undefined ->
			[];
		BattleLearnInfo ->
			BattleLearnInfo
	end.
	
%%设置玩家定时器
-spec setPlayerTimerList(List::list()) -> ok.
setPlayerTimerList(List) ->
	put(playerTimer, List),
	ok.

%%获取玩家定时器
-spec getPlayerTimerList() -> list().
getPlayerTimerList() ->
	case get(playerTimer) of
		undefined ->
			[];
		List ->
			List
	end.
%% 玩家是否处于活动地图
-spec getIsInActivityMap() -> boolean().
getIsInActivityMap() ->
	MapID = getMapID(),
	playerScene:getMapType(MapID) =:= ?MapTypeActivity.

%% 设置gm传送到目标点的分组
setGMSSTargetGroupID(GroupID) ->
	put(gMSSTargetGroupID, GroupID).

getGMSSTargetGroupID() ->
	case get(gMSSTargetGroupID) of
		undefined ->
			0;
		V ->
			V
	end.

%% 获取地图传送时间
-spec getTransferMapTime() -> uint().
getTransferMapTime() ->
	case get(transferMapTime) of
		undefined ->
			0;
		TransferTime ->
			TransferTime
	end.
		

%% 设置地图传送时间
-spec setTransferMapTime(Time :: uint()) -> ok.
setTransferMapTime(Time) ->
	put(transferMapTime, Time),
	ok.

%% 获取玩家上次离线时间
-spec getLastLogoutTime() -> uint().
getLastLogoutTime() ->
	get(lastLogoutTime).

%% 设置玩家上次离线时间
-spec setLastLogoutTime(Time :: uint()) -> ok.
setLastLogoutTime(Time) ->
    {datetime,LogoutTime} = Time,
    UtcSec = time:convertDateTime1970ToSec(LogoutTime),
	put(lastLogoutTime, UtcSec),
	ok.

%%获取玩家更新资源奖励
-spec getUpdateReward() -> list().
getUpdateReward() ->
    case get(updateReward) of
        undefined ->
            [{1,false},{2,false}];
        List ->
            List
    end.

%%设置玩家更新资源奖励
-spec setUpdateReward(ItemList) -> ok when ItemList :: list().
setUpdateReward(ItemList) ->
    put(updateReward, ItemList),
    ok.

%% 获取地图传送冷却时间
-spec getTransferMapCDTime() -> uint() | undefined.
getTransferMapCDTime() ->
	get(transferMapCDTime).
			

%% 设置地图传送冷却时间
-spec setTransferMapCDTime(Time :: uint()) -> ok.
setTransferMapCDTime(Time)->
	put(transferMapCDTime, Time),
	ok.

%%设置玩家成就列表
-spec setPlayerAchieveList(List::list()) -> ok.
setPlayerAchieveList(List) ->
	put(playerAchieve, List),
	ok.

%%获取玩家成就列表
-spec getPlayerAchieveList() -> list().
getPlayerAchieveList() ->
	case get(playerAchieve) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置玩家徽章列表
-spec setPlayerBadgeList(List::list()) -> ok.
setPlayerBadgeList(List) ->
	put(playerBadge, List),
	ok.

%%获取玩家徽章列表
-spec getPlayerBadgeList() -> list().
getPlayerBadgeList() ->
	case get(playerBadge) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置玩家称号及效果列表
-spec setPlayerTitleList(List::list()) -> ok.
setPlayerTitleList(List) ->
	put(playerTitle, List),
	ok.

%%获取玩家称号及效果列表
-spec getPlayerTitleList() -> list().
getPlayerTitleList() ->
	case get(playerTitle) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置玩家自己副本统计伤害
-spec setPlayerCopyMapStatHurt(Tuple::tuple()) -> ok.
setPlayerCopyMapStatHurt(Tuple) ->
	put(playerCopyMapStatHurt, Tuple),
	ok.

%%获取玩家自己副本伤害统计
-spec getPlayerCopyMapStatHurt() -> tuple() | undefined.
getPlayerCopyMapStatHurt() ->
	get(playerCopyMapStatHurt).

%%设置队友副本伤害
-spec setPlayerTeamCopyMapStatHurt(RoleID::uint(), Hurt::tuple()) -> ok.
setPlayerTeamCopyMapStatHurt(RoleID, Hurt) ->
	put({playerTeamMapStatHurt, RoleID}, Hurt),
	ok.

%%获取队友副本伤害
-spec getPlayerTeamCopyMapStatHurt(RoleID::uint()) -> tuple() | undefined.
getPlayerTeamCopyMapStatHurt(RoleID) ->
	get({playerTeamMapStatHurt, RoleID}).

%%设置玩家印象UID最大值
-spec setPlayerImpressionUID(uint()) -> ok.
setPlayerImpressionUID(ImpressionUID) ->
	put(impressionUID, ImpressionUID),
	ok.
%%获取玩家印象UID最大值
-spec getPlayerImpressionUID() ->uint().
getPlayerImpressionUID() ->
	case get(impressionUID) of
		undefined ->
			0;
		ImpressionUID ->
			ImpressionUID
	end.
%%设置玩家上传照片缓存
-spec setPlayerPhotoBuff(list()) -> ok.
setPlayerPhotoBuff(PhotoBuff) ->
	put(photoBuff, PhotoBuff),
	ok.
%%获取玩家印象UID最大值
-spec getPlayerPhotoBuff() ->list().
getPlayerPhotoBuff() ->
	case get(photoBuff) of
		undefined ->
			[];
		PhotoBuff ->
			PhotoBuff
	end.

%%设置人民币宠物技能
-spec setPetSkills(uint(), list()) -> ok.
setPetSkills(PetID, List) ->
	put({rmbPetSkill, PetID}, List),
	ok.

%%获取人民币宠物技能
-spec getPetSkills(PetID::uint()) -> list().
getPetSkills(PetID) ->
	case get({rmbPetSkill, PetID}) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置人民币宠物技能洗练列表
-spec setRmbCastPetSkill(list()) -> ok.
setRmbCastPetSkill(List) ->
	put(rmbCastPetSkill, List),
	ok.

%%获取人民币宠物技能洗练列表
-spec getRmbCastPetSkill() -> list().
getRmbCastPetSkill() ->
	case get(rmbCastPetSkill) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置宠物属性洗练列表
-spec setRmbCastPetAtta(PetID::uint(), List::list()) -> ok.
setRmbCastPetAtta(PetID, List) ->
	put({rmbCastPetAtta, PetID}, List),
	ok.

%%获取宠物属性洗练列表
-spec getRmbCastPetAtta(PetID::uint()) -> list().
getRmbCastPetAtta(PetID) ->
	case get({rmbCastPetAtta, PetID}) of
		undefined ->
			[];
		List ->
			List
	end.

%%获取玩家所有人民币宠物
-spec getPets() -> PetList :: list().
getPets() ->
	case get(rmbPets) of
		PetList when erlang:is_list(PetList) ->
			PetList;
		undefined ->
			[]
	end.

%%设置玩家所有人民币宠物
-spec setPets(PetList::list()) -> ok.
setPets(PetList) when erlang:is_list(PetList) ->
	put(rmbPets,PetList).

%%获取玩家宠物装备列表
-spec getPetEquip() -> list().
getPetEquip() ->
	case get(petEquip) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置玩家宠物装备列表
-spec setPetEquip(EquipList::list()) -> ok.
setPetEquip(EquipList) ->
	put(petEquip, EquipList),
	ok.

%%获取玩家宠物远征副本评分列表
-spec getPetDunScoreList() -> list().
getPetDunScoreList() ->
	case get(petDunScoreList) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置玩家宠物远征副本评分列表
-spec setPetDunScoreList(DunScoreList::list()) -> ok.
setPetDunScoreList(DunScoreList) ->
	put(petDunScoreList, DunScoreList),
	ok.

%%获取玩家宠物远程信息
-spec getPetDunInfo() -> #rec_pet_dungeon_info{}.
getPetDunInfo() ->
	get(petDunInfo).
			
%%设置玩家宠物远程信息
-spec setPetDunInfo(PetDunInfo::#rec_pet_dungeon_info{}) -> ok.
setPetDunInfo(#rec_pet_dungeon_info{} = PetDunInfo) -> 
	put(petDunInfo, PetDunInfo),
	ok.

%%获取玩家宠物领征战信息
-spec getPetManorBattle() -> #rec_pet_manor_battle{} | undefined.
getPetManorBattle() ->
	get(petManorBattle).
			
%%设置玩家宠物领征战信息
-spec setPetManorBattle(PetManorBattle::#rec_pet_manor_battle{}) -> ok.
setPetManorBattle(#rec_pet_manor_battle{} = PetManorBattle) -> 
	put(petManorBattle, PetManorBattle),
	ok.

%%获取宠物冷却时间
-spec getPetCD() -> int().
getPetCD() ->
	case get(playerPetCD) of
		undefined ->
			0;
		CD ->
			CD
	end.

% 设置宠物冷却时间
-spec setPetCD(PetCD::uint()) -> ok.
setPetCD(PetCD) ->
	put(playerPetCD, PetCD),
	ok.

% 获取宠物骑乘状态
-spec getPetMounts() -> tuple().
getPetMounts() ->
	case get(playerPetMounts) of
		undefined ->
			{};
		Tuple ->
			Tuple
	end.

% 设置宠物骑乘状态
-spec setPetMounts(Tuple::tuple()) -> ok.
setPetMounts(Tuple) ->
	put(playerPetMounts, Tuple),
	ok.

%% 获取骑宠耐久值
-spec getPetMountSta() -> number().
getPetMountSta() ->
	case get(petMountSta) of
		undefined -> 
			0;
		Sta ->
			Sta
	end.

%% 设置坐骑耐久值（耐久值为0，下马）
%% 内部会判断耐久值是不是为负，自动设置为0
-spec setPetMountSta(MountSta :: number()) -> ok.
setPetMountSta(MountSta) when erlang:is_number(MountSta) ->
	case MountSta >= 0 of
		true ->
			put(petMountSta, MountSta);
		false ->
			put(petMountSta, 0)
	end.
%% 获取玩家天赋信息
-spec getTalentInfo() -> #rec_talent{}.
getTalentInfo() ->
	case get(talentInfo) of
		undefined ->
			#rec_talent{};
		TalentInfo ->
			TalentInfo
	end.

%% 设置玩家天赋信息
-spec setTalentInfo(TalentInfo :: #rec_talent{}) -> OldVal :: #rec_talent{}|undefined.
setTalentInfo(TalentInfo) ->
	put(talentInfo, TalentInfo).
%% 设置玩家天赋升级GM标记，1的话升级只要1点经验
-spec setTalentGMFlag(Flag :: integer()) -> OldVal :: integer()|undefined.
setTalentGMFlag(Flag) ->
	put(talentGMFlag, Flag).
%% 获取玩家天赋升级GM标记，1的话升级只要1点经验
-spec getTalentGMFlag() -> integer().
getTalentGMFlag() ->
	case get(talentGMFlag) of
		undefined ->
			0;
		Flag ->
			Flag
	end.

%% 获取玩家开始试炼时间
-spec getWarriorTrialTime() -> uint64().
getWarriorTrialTime() ->
	case get(warriorTrialTime) of
		undefined ->
			0;
		WarriorTrialTime ->
			WarriorTrialTime
	end.

%% 设置玩家开始试炼时间
-spec setWarriorTrialTime(Time :: uint64()) -> OldVal :: uint64()|undefined.
setWarriorTrialTime(Time) ->
	put(warriorTrialTime, Time).
%% 获取勇士试炼挑战状态
-spec getWarriorTrialState() -> uint8().
getWarriorTrialState() ->
	case get(warriorTrialState) of
		undefined ->
			?WarriorTrialStateNotChalleng;
		WarriorTrialState ->
			WarriorTrialState
	end.

%% 设置勇士试炼挑战状态
-spec setWarriorTrialState(State::uint8()) -> OldVal :: uint8()|undefined.
setWarriorTrialState(State) ->
	put(warriorTrialState, State).
%% 获取勇士试炼信息
-spec getWarriorTrialInfo() -> #rec_warrior_trial{}|undefined.
getWarriorTrialInfo() ->
	case get(warriorTrialInfo) of
		undefined ->
			#rec_warrior_trial{roleID = playerState:getRoleID()};
		Info ->
			Info
	end.
%% 设置勇士试炼信息
-spec setWarriorTrialInfo(Info :: #rec_warrior_trial{}) -> ok.
setWarriorTrialInfo(Info) ->
	put(warriorTrialInfo, Info),
	ok.
%%设置人物系统模块战力
-spec setPlayerSysForce(SysID::uint(), Force::uint()) -> ok.
setPlayerSysForce(SysID, Force) ->
	?DEBUG_OUT("player [~ts] sys [~p] force value:~p", [ getName(), SysID, Force]),
	put({playerSysForce, SysID}, Force),
	ok.

%%获取人物系统模块战力
-spec getPlayerSysForce(SysID::uint()) -> uint().
getPlayerSysForce(SysID) ->
	case get({playerSysForce, SysID}) of
		undefined ->
			0;
		Force ->
			Force
	end.

%%设置宠物系统模块战力
-spec setPetSysForce(SysID::uint(), Force::uint()) -> ok.
setPetSysForce(SysID, Force) ->
	?DEBUG_OUT("player [~ts] pet sys [~p] force value:~p", [getName(), SysID, Force]),
	put({petSysForce, SysID}, Force),
	ok.

%%获取宠物系统模块战力
-spec getPetSysForce(SysID::uint()) -> uint().
getPetSysForce(SysID) ->
	case get({petSysForce, SysID}) of
		undefined ->
			0;
		Force ->
			Force
	end.

%%设置回合制战斗包
-spec setTurnBattleData(list()) -> ok.
setTurnBattleData(List) ->
	put(battleData, List),
	ok.

%%获取回合制战斗包
-spec getTurnBattleData() -> list().
getTurnBattleData() ->
	case get(battleData) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置回合制战斗结果
-spec setTurnBattleAck(#rec_battle_ack{} | undefined) -> ok.
setTurnBattleAck(Tuple) ->
	put(battleAck, Tuple),
	ok.

%%获取回合制战斗结果
-spec getTurnBattleAck() -> #rec_battle_ack{} | undefined.
getTurnBattleAck() ->
	get(battleAck).
%%设置回合制战斗结果
-spec setCourageCostFlag(Flag::uint8()) -> ok.
setCourageCostFlag(Flag) ->
	put(courageCostFlag, Flag),
	ok.

%%获取回合制战斗结果
-spec getCourageCostFlag() -> uint8().
getCourageCostFlag() ->
	case get(courageCostFlag) of
		undefined ->
			0;
		Flag ->
			Flag
	end.
%%设置玩家神器信息
-spec setGodWeaponInfo(Info::[#rec_god_weapon{}]) -> ok.
setGodWeaponInfo(Info) ->
	put(godWeaponInfo, Info),
	ok.

%%获取玩家神器信息
-spec getGodWeaponInfo() -> list().
getGodWeaponInfo() ->
	case get(godWeaponInfo) of
		undefined ->
			[];
		Info ->
			Info
	end.

%%添加军团聊天更新军团活跃CD
-spec setGuildMaxOnlineTimeCD(Time::uint64()) -> ok.
setGuildMaxOnlineTimeCD(Time) ->
    put(guildMaxOnlieTimeCD, Time),
    ok.

getGuildMaxOnlineTimeCD() ->
    case get(guildMaxOnlieTimeCD) of
        undefined ->
            0;
        Time ->
            Time
    end.
%%个人信息
-spec setPersonalityInfo(Info::#rec_personality_info{}) -> ok.
setPersonalityInfo(Info) ->
	put(personalityInfo, Info),
	ok.
-spec getPersonalityInfo() -> #rec_personality_info{}.
getPersonalityInfo() ->
	case get(personalityInfo) of
		undefined ->
			NewPI = #rec_personality_info{roleID = playerState:getRoleID(),photoData = []},
			playerState:setPersonalityInfo(NewPI),
			NewPI;
		PI ->
			PI
	end.

%%设置玩家世界等级经验加成值
-spec setWorldLevelExp(ExpUp :: number()) -> ok.
setWorldLevelExp(ExpUp) ->
    put(worldLevelExp, ExpUp),
    ok.

-spec getWorldLevelExp() -> number().
getWorldLevelExp() ->
    case get(worldLevelExp) of
        undefined ->
            0;
        Value ->
            Value
    end.

-spec setWorldLevel(Level :: uint()) -> ok.
setWorldLevel(Level) ->
	put(worldLevel, Level),
    ok.

-spec getWorldLevel() -> uint().
getWorldLevel() ->
    case get(worldLevel) of
        undefined ->
            #globalsetupCfg{setpara = [MinLevel]} = getCfg:getCfgByArgs(cfg_globalsetup, worldlevel_base),
			MinLevel;
        Value ->
            Value
    end.

-spec getPetAddProps() -> list().
getPetAddProps() ->
	case get(petAddProps) of
		undefined ->
			[];
		L ->
			L
	end.

-spec setPetAddProps(L::list()) -> ok.
setPetAddProps(L) ->
	put(petAddProps, L),
	ok.

-spec setLiveness(#rec_player_liveness{}) -> ok.
setLiveness(#rec_player_liveness{} = L)->
	put(liveness,L),
	ok.

-spec getLiveness() -> #rec_player_liveness{} | {}.
getLiveness()->
	case get(liveness) of
		undefined->
			?ERROR_OUT("player:getLiveness,stack= ~p.",[misc:getStackTrace()]),
			{};
		L -> L
	end.

-spec getWingExpAccPerItemUse() ->int32().
getWingExpAccPerItemUse() ->
	CurExp = 
	case get(wingExpAccPerItemUse) of
		undefined ->0;
		Val -> Val
	end,
	setWingExpAccPerItemUse(0),
	CurExp.

-spec setWingExpAccPerItemUse(Value::int32()) ->term().
setWingExpAccPerItemUse(Value) ->
	put(wingExpAccPerItemUse,Value).


%%setWingLevel(Level) ->
%%	put(wingLevel,Level).
%%getWingLevel() ->
%%	case get(wingLevel) of
%%		undefined ->0;
%%		Val ->Val
%%	end.

%%setWingExp(Exp) ->
%%	put(wingExp,Exp).
%%getWingExp() ->
%%	case get(wingExp) of
%%		undefined ->0;
%%		Val ->Val
%%	end.
%%玩家跨服组队信息

-spec getCrosTeamInfo() -> list().
getCrosTeamInfo() ->
	case get(crosTeamInfo) of
		undefined ->
			[];
		L ->
			L
	end.

-spec setCrosTeamInfo(L::list()) -> ok.
setCrosTeamInfo(L) ->
	put(crosTeamInfo, L).

%%跨服队伍ID
-spec getCrosTeamID() -> uint().
getCrosTeamID() ->
	case get(crosTeamID) of
		undefined ->
			0;
		ID ->
			ID
	end.

-spec setCrosTeamID(TeamID::uint()) -> ok.
setCrosTeamID(TeamID) ->
	put(crosTeamID, TeamID).

%%掉落列表
-spec getDropList() -> list().
getDropList() ->
	case get(dropList) of
		undefined ->
			[];
		L ->
			L
	end.

-spec setDropList(L::list()) -> ok.
setDropList(L) ->
	put(dropList, L).

-spec setPlayerHolidayTask(Task::#rec_holiday_task{})-> ok.
setPlayerHolidayTask(Task) ->
	put(holidayTask,Task),
	ok.
-spec getPlayerHolidayTask() -> #rec_holiday_task{}.
getPlayerHolidayTask()->
	case get(holidayTask) of
		#rec_holiday_task{}=Task->Task;
		_ -> #rec_holiday_task{
			playerID = playerState:getRoleID(),
			acceptedTaskId = 0,
			acceptedTime = 0,
			completedTask = []
		}
	end.

-spec setPlayerOldCode(Code::uint64()) ->term().
setPlayerOldCode(Code) ->
	put(playerOldCode,Code).

-spec getPlayerOldCode() ->uint64()|undefined.
getPlayerOldCode() ->
	get(playerOldCode).

-spec setHostRealName(GSName::string())->term().
setHostRealName(GSName)->
	put(hostRealName,GSName).

-spec getHostRealName() ->string().
getHostRealName() ->
	case get(hostRealName) of
		undefined ->"";
		Val ->Val
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================

%%跨服活动id
-spec setCrossActivityID(ActivityID::term()) ->term().
setCrossActivityID(ActivityID) ->
	put('CrossActivityID',ActivityID).

-spec getCrossActivityID() ->term().
getCrossActivityID() ->
	get('CrossActivityID').

%%跨服竟技场奖励数据暂存
setCrosAreadReward(Data)->
	put('CrosAreadReward',Data).
getCrosAreadReward()->
	get('CrosAreadReward').


setSkipSkillCheck(Flag)->
	put('SkipSkillChech', Flag).

getSkipSkillCheck()->
	case get('SkipSkillChech') of
		undefined->
			false;
		V -> V
	end.