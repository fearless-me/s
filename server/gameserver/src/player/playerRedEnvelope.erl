%%%-------------------------------------------------------------------
%%% 红包
%%%-------------------------------------------------------------------
-module(playerRedEnvelope).
-author("Administrator").
-include("playerPrivate.hrl").
-include("redEnvelope.hrl").

-define(RED_MIN_DIAMOND, 100).

-export([
	sendRedEnvelope/6,
	sendRedEnvelopeAck/1,
	robRedEnvelope/1,
	robRedEnvelopeAck/1,
	redEnvelopeHistory/0,
	redEnvelopeInfo/1,
	redEnvelopeQuery/1,
	newRedEnvelopeReached/1
]).

-export([
	onPlayerLogin/0
]).

onPlayerLogin()->
	case core:isCross() of
		true ->
			skip;
		_ ->
			redEnvelopeQuery(?REDENVELOPE_TARGET_FIXROLE)
	end.


%%%-------------------------------------------------------------------
%% 发
sendRedEnvelope(Type,TargetType,TargetUID,AllNumber,AllMoney,LuckContent)->
	case checkTargetGUID(TargetType, TargetUID) of
		{true,_} ->
			case canSendRedEnveLope(TargetType, AllNumber, AllMoney) of
				{true,_} ->
					doSendRedEnvelope(Type,TargetType,TargetUID,AllNumber,AllMoney,LuckContent);
				{_, ErrorCode}->
					?DEBUG_OUT("==>redEnvelope send error(~w)",[ErrorCode]),
					playerMsg:sendErrorCodeMsg(ErrorCode)
			end;
		{_, ErrorCode1}->
			?DEBUG_OUT("==>redEnvelope send error(~w)",[ErrorCode1]),
			playerMsg:sendErrorCodeMsg(ErrorCode1)
	end,
	ok.
doSendRedEnvelope(Type,TargetType,TargetUID,AllNumber,AllMoney,LuckContent)->
	%% 扣钱
	RoleID = playerState:getRoleID(),
	PLog = #recPLogTSMoney{
		reason = ?CoinUseSendRed,
		param = TargetType,
		target = ?PLogTS_RedEnvelope,
		source = ?PLogTS_PlayerSelf
	},
	case playerMoney:decCoin(?CoinTypeDiamond, AllMoney, PLog) of
		true ->
			?DEBUG_OUT("==>redEnvelope send ok to otp"),
			addPrivateProp(?PriProp_RedEnvelopeSendNum, 1),
			addPrivateProp(?PriProp_RedEnvelopeSendMoney, AllMoney),
			addRedEnvelopeSendCount(TargetType),
			psMgr:sendMsg2PS(
				?PsNameRedEnvelope,
				'SendRedEnvelope',
				{RoleID,Type,TargetType,TargetUID,AllNumber,AllMoney,LuckContent}
			);
		_ ->
			?DEBUG_OUT("==>redEnvelope send error(no money)"),
			skip
	end.

addPrivateProp(Index,Plus)->
	V = playerPropSync:getProp(Index),
	playerPropSync:setInt64(Index, V + Plus).
%%%-------------------------------------------------------------------
%% 发成功
sendRedEnvelopeAck(#rec_redenvelope{ redUID = UID,
	targetType = TargetType,createTime=CreateTime, allMoney = AllMoney})->
	%%
	Histroy = #rec_HistorySelf{
		redUID = UID
		,creator = playerState:getRoleID()
		,type = TargetType
		,name = playerState:getName()
		,time = CreateTime
		,money = 0-AllMoney
	},
	addHistoryList(Histroy),
	playerAchieve:achieveEvent(?Achieve_Sending_redenvelope, [1]),
	?DEBUG_OUT("==>redEnvelope send recive ack ok from otp"),
	playerMsg:sendErrorCodeMsg(?ErrorCode_RedEnvelope_code_Sucess),
	ok;
sendRedEnvelopeAck(_)->
	ok.
%%%-------------------------------------------------------------------
%% 我能抢的红包
newRedEnvelopeReached(#rec_redenvelope{targetType = ?REDENVELOPE_TARGET_FIXROLE} = R)->
	case makeRedEnvelopeBaseInfoFromRec(R) of
		#pk_redEnvelopeBaseInfo{} = Info ->
			Msg = #pk_GS2U_RedEnvelopeQuery{redEnvelopeList = [Info]},
			playerMsg:sendNetMsg(Msg);
		_ ->
			ok
	end,
	ok;
newRedEnvelopeReached(#rec_redenvelope{targetType = ?REDENVELOPE_TARGET_WORLD})->
	V = playerPropSync:getProp(?PriProp_WorldRedEnvelope),
	?DEBUG_OUT("==>redEnvelope reached(~w)",[V]),
	IsLevelLimit = checkLevelLimit(),
	{Ret,_} = checkRobCountLimit(?REDENVELOPE_TARGET_WORLD),
	case V =:= 0 andalso Ret =:= true andalso IsLevelLimit =:= true of
		true ->
			playerPropSync:setInt(?PriProp_WorldRedEnvelope, 1);
		_ ->
			skip
	end;
newRedEnvelopeReached(_)->
	ok.
%%%-------------------------------------------------------------------
%% 抢
robRedEnvelope(RedUID)->
	Name = playerState:getName(),
	RoleID = playerState:getRoleID(),
	GuildID = playerState:getGuildID(),
	case canRobRedEnvelope(RoleID,RedUID) of
		{true,_}->
			case redEnvelopeLogic:getRedEnvelope(RedUID) of
				#rec_redenvelope{targetType = TargetType} ->
					?DEBUG_OUT("==>redEnvelope rob send to otp"),
					addRedEnvelopeRobCount(TargetType),
					psMgr:sendMsg2PS(
						?PsNameRedEnvelope,
						'RobRedEnvelope',
						{RoleID,Name,GuildID,RedUID}
					);
				_ ->
					?DEBUG_OUT("==>redEnvelope rob error(not exist)"),
					skip
			end;
		{_, ErrorCode}->
			?DEBUG_OUT("==>redEnvelope rob error(~w)",[ErrorCode]),
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end.
%%%-------------------------------------------------------------------
%% 抢成功
robRedEnvelopeAck({Now,RobMoney,
	#rec_redenvelope{ redUID = UID, creator = Creator,targetType = TargetType} = R})->
	%%---------------------
	Histroy = #rec_HistorySelf{
		redUID = UID,
		creator = Creator,
		type = TargetType,
		name = getName(Creator),
		time = Now,
		money = RobMoney
	},
	?DEBUG_OUT("==>redEnvelope rob recive ack from otp"),
	addHistoryList(Histroy),
	%%---------------------
	addPrivateProp(?PriProp_RedEnvelopeRecvNum, 1),
	addPrivateProp(?PriProp_RedEnvelopeRecvMoney, RobMoney),
	%%---------------------
	Info = makeRedEnvelopeBaseInfoFromRec(R),
	HistoryList = makeRedEnvelopeHistory(UID),
	Msg = #pk_GS2U_RobRedEnvelopeAck{
		robAmount = RobMoney,
		red = #pk_redEnvelopeInfo{ baseInfo = Info, takenList = HistoryList}},
	playerMsg:sendNetMsg(Msg),
	%%---------------------
	%% 尝试增加友好度（发送者->自己）
	%% 函数内部判断是否是正式好友、剩余多少限制次数等
	playerFriend2:closenessAdd(?ClosenessAddType_RedEnvelope, Creator, playerState:getRoleID(), 1),
	ok.

%%%-------------------------------------------------------------------
%% 能否发红包
canSendRedEnveLope(TargetType, AllNumber,AllMoney)->
	case checkSendCountLimit(TargetType) of
		{true,_}->
			checkMoney(AllNumber, AllMoney);
		V ->
			V
	end.
%%%-------------------------------------------------------------------
checkTargetGUID(?REDENVELOPE_TARGET_FIXROLE, TargetGUID)->
	case uidMgr:getUIDType(TargetGUID) of
		?UID_TYPE_Role ->
			{true, 0};
		_ ->
			{false, ?ErrorCode_RedEnvelope_code_Arg_AppointErr}
	end;
checkTargetGUID(?REDENVELOPE_TARGET_WORLD, TargetGUID)->
	{TargetGUID =:= 0, ?ErrorCode_RedEnvelope_code_Arg_Err};
checkTargetGUID(_, _)->
	{false, ?ErrorCode_RedEnvelope_code_Arg_Err}.

%%%-------------------------------------------------------------------
%% 检查发送次数
checkSendCountLimit(?REDENVELOPE_TARGET_FIXROLE)->
	{true,0};
checkSendCountLimit(?REDENVELOPE_TARGET_WORLD)->
	{true,0};
%%	{getRedEnvelopeSendCount(?REDENVELOPE_TARGET_WORLD) < getRobLimitFromCfg(), ?ErrorCode_RedEnvelope_code_SendLimit};
checkSendCountLimit(_)->
	{false,?ErrorCode_RedEnvelope_code_Arg_AppointErr}.
%%%-------------------------------------------------------------------
%% 检查钱
checkMoney(AllNumber, _) when AllNumber =< 0 orelse AllNumber > ?RED_MAXNUM_ONERED ->
	{false, ?ErrorCode_RedEnvelope_code_Arg_Err};
checkMoney(_, AllMoney) when AllMoney < ?RED_MIN_DIAMOND ->
	{false, ?ErrorCode_RedEnvelope_code_Arg_Err};
checkMoney(AllNumber, AllMoney)->
	V = trunc(AllMoney/AllNumber),
	case V of
		_ when V  =< 0 ->
			{false, ?ErrorCode_RedEnvelope_code_Arg_Rem};
		_ ->
			{playerState:getCoin(?CoinTypeDiamond) >= AllMoney, ?ErrorCode_TradeDiamond}
	end.

%%%-------------------------------------------------------------------
%% 能抢红包
canRobRedEnvelope(RoleID, RedUID)->
	case checkRobedRedEnvelope(RoleID, RedUID) of
		{true, _}->
			case redEnvelopeLogic:getRedEnvelope(RedUID) of
				#rec_redenvelope{targetType = TargetType} ->
					checkRobCountLimit(TargetType);
				_ ->
					{false, ?ErrorCode_RedEnvelope_code_Not_Exist}
			end;
		V ->
			V
	end.
%%%-------------------------------------------------------------------
%% 是否已经抢了
checkRobedRedEnvelope(RoleID, RedUID)->
	case redEnvelopeLogic:getHistory(RedUID) of
		[]->
			{true, 0};
		L ->
			case lists:keyfind(RoleID, #rec_History.roleID, L) of
				#rec_History{} ->
					{false, ?ErrorCode_RedEnvelope_code_Has_Taken};
				_ ->
					{true, 0}
			end
	end.
%%%-------------------------------------------------------------------
%% 抢的次数
checkRobCountLimit(?REDENVELOPE_TARGET_FIXROLE)->
	{true,0};
checkRobCountLimit(?REDENVELOPE_TARGET_WORLD)->
	{getRedEnvelopeRobCount(?REDENVELOPE_TARGET_WORLD) < getRobLimitFromCfg(), ?ErrorCode_RedEnvelope_code_RobLimit};
checkRobCountLimit(_)->
	{false,?ErrorCode_RedEnvelope_code_Not_Exist}.

%%%-------------------------------------------------------------------
redEnvelopeHistory()->
	L1 = getHistoryList(),
	L2 = lists:foldl(
		fun(#rec_HistorySelf{} = R, Acc)->
			Rec = #pk_redEnvelopeHistory{
				redUID = R#rec_HistorySelf.redUID,
				creatorRoleID = R#rec_HistorySelf.creator,
				creatorName =  R#rec_HistorySelf.name,
				createTime =  R#rec_HistorySelf.time,
				targetType =  R#rec_HistorySelf.type,
				moneyNumber =  R#rec_HistorySelf.money},
			[Rec | Acc]
		end, [], L1),
	Msg = #pk_GS2U_RedEnvelopeHistoryAck{ historyList = L2},
	playerMsg:sendNetMsg(Msg),
	ok.
%%%-------------------------------------------------------------------
redEnvelopeInfo(RedUID)->
	case redEnvelopeLogic:getRedEnvelope(RedUID) of
		#rec_redenvelope{} = R ->
			Info = makeRedEnvelopeBaseInfoFromRec(R),
			HistoryList = makeRedEnvelopeHistory(RedUID),
			Msg = #pk_GS2U_RedEnvelopeInfoAck{
				red = #pk_redEnvelopeInfo{ baseInfo = Info, takenList = HistoryList}},
			playerMsg:sendNetMsg(Msg);
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_RedEnvelope_code_Expires)
	end.
%%%-------------------------------------------------------------------
redEnvelopeQuery(TargetType)->
	case cd_only_query_call() >= ?RED_QUERYLIST_CD of
		true ->
			%%-------------------------------
			case checkRobCountLimit(TargetType) of
				{true,_} ->
					doRedEnvelopeQuery(TargetType);
				{_, ErrorCode} ->
					playerPropSync:setInt(?PriProp_WorldRedEnvelope, 0),
					playerMsg:sendErrorCodeMsg(ErrorCode)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_RedEnvelope_code_tooFast)
	end.

doRedEnvelopeQuery(TargetType)->
	%%-------------------------------
	Now = os:timestamp(),
	L1 = redEnvelopeLogic:getRedEnvelopeList(playerState:getRoleID(), TargetType),
	Diff = timer:now_diff( os:timestamp(), Now) / 1000,
	Length = length(L1),
	?DEBUG_OUT("redEnvelopeQuery[~p],len[~p],diff[~p]ms",[TargetType, Length, Diff]),
	redEnvelopeQueryOk(TargetType, Length),
	%%-------------------------------
	L2 = lists:foldl(
		fun(UID, Acc)->
			[makeRedEnvelopeBaseInfoFromSimRec(UID) | Acc]
		end, [], L1),
	Msg = #pk_GS2U_RedEnvelopeQuery{redEnvelopeList = L2},
	playerMsg:sendNetMsg(Msg).

redEnvelopeQueryOk(?REDENVELOPE_TARGET_WORLD,Len)->
	IsLevelOk = checkLevelLimit(),
	V = playerPropSync:getProp(?PriProp_WorldRedEnvelope),
	if
		Len > 0 andalso V =:= 0 andalso IsLevelOk =:= true ->
			playerPropSync:setInt(?PriProp_WorldRedEnvelope, 1);
		Len =:= 0 andalso V =:= 1 ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_RedEnvelope_code_NoMore),
			playerPropSync:setInt(?PriProp_WorldRedEnvelope, 0);
		Len =:= 0 ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_RedEnvelope_code_NoMore);
		true ->
			skip
	end;
redEnvelopeQueryOk(_,_)->
	ok.

checkLevelLimit()->
	case getCfg:getCfgByArgs(cfg_globalsetup, redEnvelope_LevelLimit) of
		#globalsetupCfg{setpara = [V] } ->
			playerState:getLevel() >= V;
		_  ->
			playerState:getLevel() >= 10
	end.

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
getHistoryList()->
	playerPropSync:getProp(?SerProp_RedEnvelopeHistory).

setHistoryList(L)->
	playerPropSync:setAny(?SerProp_RedEnvelopeHistory, L).

addHistoryList(Rec)->
	L1 = getHistoryList(),
	L2 = [Rec | L1],
	L3 = lists:sublist(L2, ?REDENVELOPE_HISTORY_LEN),
	setHistoryList(L3).

%%%-------------------------------------------------------------------
getName(RoleID)->
	case core:queryRoleKeyInfoByRoleID(RoleID) of
		#?RoleKeyRec{roleName = Name} ->
			Name;
		_ ->
			"???"
	end.

%%%-------------------------------------------------------------------
makeRedEnvelopeBaseInfoFromSimRec(UID)->
	case redEnvelopeLogic:getRedEnvelope(UID) of
		#rec_redenvelope{} = R ->
			makeRedEnvelopeBaseInfoFromRec(R);
		_ ->
			undefined
	end.

makeRedEnvelopeBaseInfoFromRec(#rec_redenvelope{ redUID = UID, creator = Creator} = R)->
	case core:queryRoleKeyInfoByRoleID(Creator) of
		#?RoleKeyRec{roleName = Name, race = Race, career = Career, sex = Sex, head = Head, level = Level} ->
			#pk_redEnvelopeBaseInfo{
				redUID =  R#rec_redenvelope.redUID,
				creatorRoleID = Creator,
				targetUID = R#rec_redenvelope.targetUID,
				luckContent = R#rec_redenvelope.luckContent,
				creatorName = Name,
				type = ?REDENVELOPE_TYPE_RANDOM,
				targetType = R#rec_redenvelope.targetType,
				creatorLevel = Level,
				creatorCareer = Career,
				creatorRace = Race,
				creatorSex = Sex,
				creatorHead = Head,
				allMoney = R#rec_redenvelope.allMoney,
				allNumber = R#rec_redenvelope.allNumber,
				takenMoney = R#rec_redenvelope.takeMoney,
				takenNumber = R#rec_redenvelope.takeNumber
			};
		_ ->
			?ERROR_OUT("redenvelope[~p],creator[~p] not exist",[UID, Creator]),
			undefined
	end.
%%%-------------------------------------------------------------------
makeRedEnvelopeHistory(UID)->
	L = redEnvelopeLogic:getHistory(UID),
	lists:foldl(
		fun(R,Acc)->
			Rec = #pk_takeHistory{
				takeRoleID = R#rec_History.roleID,
				takeName = R#rec_History.name,
				takeTime = R#rec_History.time,
				takeMoney = R#rec_History.money
			},
			[Rec | Acc]
		end, [], L).
%%%-------------------------------------------------------------------
%getRedEnvelopeSendCount(TargetType)->
%	playerDaily:getDailyCounter(?DailyType_RedEnvelope_SendNumber, TargetType).
addRedEnvelopeSendCount(TargetType)->
	playerDaily:addDailyCounter(?DailyType_RedEnvelope_SendNumber, TargetType,1).

getRedEnvelopeRobCount(TargetType)->
	playerDaily:getDailyCounter(?DailyType_RedEnvelope_RobNumber, TargetType).
addRedEnvelopeRobCount(TargetType)->
	playerDaily:addDailyCounter(?DailyType_RedEnvelope_RobNumber, TargetType,1).


cd_only_query_call()->
	Now = myNow____(),
	case get('RedEnvelopeQueryCDTime') of
		undefined->
			put('RedEnvelopeQueryCDTime', Now),
			888888;
		V ->
			put('RedEnvelopeQueryCDTime', Now),
			Now - V
	end.


%%%-------------------------------------------------------------------
myNow____() -> time:getUTCNowMS().

getRobLimitFromCfg()->
	case getCfg:getCfgPStack(cfg_globalsetup, redEnvelope_WorldReceiveAmount) of
		#globalsetupCfg{setpara = [V]} ->
			V;
		_ ->
			?REDENVELOPE_WORLD_RECVMAX
	end.