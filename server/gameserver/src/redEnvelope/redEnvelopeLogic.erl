%%%-------------------------------------------------------------------
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 五月 2016 14:57
%%%-------------------------------------------------------------------
-module(redEnvelopeLogic).
-author("tiancheng").

-include("redEnvelope.hrl").
-include("gsInc.hrl").
%% API
-export([
	initRedEnvelopeData/1,
	checkRedEnvelope/0,
	newRedEnvelope/2,
	robRedEnvelope/2
]).

%%
-export([
	getHistory/1,
	getRedEnvelope/1,
	getRedEnvelopeList/2
]).

%% test
-export([
	t/3,
	t/2,
	st/3,
	go/1
]).

%%%-------------------------------------------------------------------
getHistory(UID)->
	case myEts:readRecord(ets_redEnvelopeHistory, UID) of
		#rec_redEnvelopeHistory{list = L} ->
			L;
		_ ->
			[]
	end.
%%%-------------------------------------------------------------------
getRedEnvelope(RedUID)->
	case myEts:readRecord(ets_redEnvelope, RedUID) of
		#rec_redenvelope{} = R ->
			R;
		_ ->
			undefined
	end.
%%%-------------------------------------------------------------------
getRedEnvelopeList(RoleID, TargetType)->
	doGetRedEnvelopeList(RoleID, TargetType).

doGetRedEnvelopeList(RoleID, ?REDENVELOPE_TARGET_FIXROLE)->
	MatchSpec = ets:fun2ms(fun(Object) when Object#rec_redEnvelopeSim.targetUID =:= RoleID -> Object#rec_redEnvelopeSim.redUID end),
	myEts:selectEts(ets_redEnvelope1v1, MatchSpec);
doGetRedEnvelopeList(RoleID, ?REDENVELOPE_TARGET_WORLD)->
	L = ets:tab2list(ets_redEnvelope1vN),
	lists:foldl(
		fun(#rec_redEnvelopeSim{redUID = UID}, Acc) ->
			case getHistory(UID) of
				[] ->
					[UID | Acc];
				L1 ->
					case lists:keyfind(RoleID, #rec_History.roleID, L1) of
						#rec_History{} ->
							Acc;
						_ ->
							[UID | Acc]
					end
			end
		end, [], L);

%%	Size = myEts:getCount(ets_redEnvelope1vN),
%%	myEts:selectEts()
%%	case Size =< ?REDENVELOPE_1VN_MAXPER of
%%		true ->
%%			ets:tab2list(ets_redEnvelope1vN);
%%		_ ->
%%			L = ets:tab2list(ets_redEnvelope1vN),
%%			Pos = misc:clamp(misc:rand(1, Size - ?REDENVELOPE_1VN_MAXPER), 1, Size),
%%			lists:sublist(L, Pos, ?REDENVELOPE_1VN_MAXPER)
%%	end;
doGetRedEnvelopeList(RoleID,Type)->
	?ERROR_OUT("doGetRedEnvelopeList(~w,~w)",[RoleID,Type]).

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
newRedEnvelope(FromPid, Data)->
	{Createtor,_Type,TargetType,TargetUID,AllNumber,AllMoney,LuckContent} = Data,
	UID = uidMgr:makeRedEnvelopeUID(),
	Now = myNow(),
	LifeTimeSecond = getLifeTime(TargetType),
	Rec = #rec_redenvelope{
		redUID = UID,
		creator = Createtor,
		targetUID = TargetUID,
		targetType = TargetType,
		redType = ?REDENVELOPE_TYPE_RANDOM,
		allNumber = AllNumber,
		moneyType = ?CoinTypeDiamond,
		allMoney = AllMoney,
		createTime = Now,
		deadlineTime = Now + LifeTimeSecond,
		luckContent = LuckContent
	},
	send2DBS(insert, Rec),
	createRedEnvelopeSuccess(FromPid,Rec),
	ok.

%%%-------------------------------------------------------------------
robRedEnvelope(FromPid, Data)->
	{RoleID, Name, GuildID, UID} = Data,
	case canRobRedEnvelope(RoleID, GuildID, UID) of
		{true, _} ->
			doRobRedEnvelope1(FromPid, RoleID, Name, GuildID, UID);
		{_, ErrorCode} ->
			Msg = playerMsg:getErrorCodeMsg(ErrorCode, []),
			psMgr:sendMsg2PS(FromPid, broadcast, Msg)
	end,
	ok.

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
createRedEnvelopeSuccess(FromPid,
	#rec_redenvelope{redUID = UID, creator = Creator, targetType = TargetType,targetUID = TargetUID
		,deadlineTime = Deadline, createTime = CreateTime, allNumber = AllNumber, allMoney = AllMoney} = R)->
	%%%-------------------------------------------------------------------
	Sim = #rec_redEnvelopeSim{redUID = UID, targetUID = TargetUID, targetType = TargetType,deadlineTime = Deadline},
	%%%-------------------------------------------------------------------
	myEts:insertEts(ets_redEnvelope, R),
	%%%-------------------------------------------------------------------
	case TargetType of
		?REDENVELOPE_TARGET_FIXROLE ->
			myEts:insertEts(ets_redEnvelope1v1,Sim);
		?REDENVELOPE_TARGET_WORLD ->
			myEts:insertEts(ets_redEnvelope1vN,Sim);
		_ ->
			?ERROR_OUT("invalid type[~w]",[TargetType])
	end,
	%%%-------------------------------------------------------------------
	dingdong(R),
	LogRec = #rec_log_redenvelope{
		redID = UID,
		sendRoleID = Creator,
		playerID = R#rec_redenvelope.targetUID,
		opType = ?RED_Opt_Code_Send,
		moneyType = ?CoinTypeDiamond,
		redValue = AllMoney,
		time = CreateTime
	},
	send2Log(LogRec),
	%%%-------------------------------------------------------------------
	psMgr:sendMsg2PS(FromPid,'SendRedEnvelopeAck',R),

	%%%-------------------------------------------------------------------
	case AllMoney >= getBroadcastMoney() of
		true when TargetType =:= ?REDENVELOPE_TARGET_WORLD ->
			Content = stringCfg:getString(redEnvelope_Announcement_1, [getName(Creator)]),
			core:sendBroadcastNotice(Content);
		_ ->
			skip
	end,
	%%%-------------------------------------------------------------------
	?LOG_OUT("~w sendRed ~w, allMoney ~w, allNumber ~w,type ~w, target ~w, deadline ~w",
		[Creator, UID, AllMoney, AllNumber, TargetType, TargetUID, Deadline]),
	ok.
%%%-------------------------------------------------------------------
%% 通知
dingdong(#rec_redenvelope{targetType = ?REDENVELOPE_TARGET_FIXROLE,targetUID = TargetUID} = R)->
	case core:queryPlayerPidByRoleID(TargetUID) of
		offline ->
			skip;
		Pid ->
			psMgr:sendMsg2PS(Pid, 'NewRedEnvelopeReached', R)
	end;
dingdong(#rec_redenvelope{targetType = ?REDENVELOPE_TARGET_WORLD} = R)->
	core:boardcastAllGSMsg('NewRedEnvelopeReached',R);
dingdong(_)->
	ok.

%%%-------------------------------------------------------------------
doRobRedEnvelope1(FromPid, RoleID, Name, GuildID, UID)->
	case myEts:readRecord(ets_redEnvelope, UID) of
		#rec_redenvelope{} = R ->
			doRobRedEnvelope2(FromPid, RoleID, Name, GuildID, R);
		_ ->
			skip
	end.

doRobRedEnvelope2(FromPid, RoleID, Name, GuildID, #rec_redenvelope{ redUID = UID, targetType = TargetType,
	allMoney = AllMoney, takeMoney = TakeMoney, allNumber = AllNumber, takeNumber = TakeNumber} = R)->
	NowSys = time2:getTimestampMS(),
	Now = myNow(),
	RobMoney = randGetMoney(TargetType, AllNumber, TakeNumber, AllMoney, TakeMoney),
	%% 后续处理
	NewRec =  R#rec_redenvelope{takeMoney = TakeMoney + RobMoney, takeNumber = TakeNumber + 1},
	robRedEnvelopeSuccess(FromPid,RoleID,Name,GuildID,RobMoney,Now,NewRec),
	Diff= time2:getTimestampMS() - NowSys,
	?LOG_OUT("doRobRedEnvelope2(player:~w,~ts, red:~w,~w/~w,~w/~w,get:~w,diff ~w ms)"
		,[RoleID, Name,UID,NewRec#rec_redenvelope.takeMoney
			,AllMoney,NewRec#rec_redenvelope.takeNumber, AllNumber, RobMoney,Diff]),
	ok.

%%%-------------------------------------------------------------------
robRedEnvelopeSuccess(FromPid, RoleID, Name, _GuildID, RobMoney,Now,
	#rec_redenvelope{redUID = UID, creator = Creator, takeMoney = TakeMoney,takeNumber = TakeNumber} = NewRec)->
	%---------------------------
	myEts:updateEts(ets_redEnvelope, UID,
		[{#rec_redenvelope.takeMoney,TakeMoney},{#rec_redenvelope.takeNumber, TakeNumber}]),
	%---------------------------
	onRedEnvelopeRobed(NewRec),

	LogRec = #rec_log_redenvelope{
		redID = UID,
		sendRoleID = NewRec#rec_redenvelope.creator,
		playerID = NewRec#rec_redenvelope.targetUID,
		opType = ?RED_Opt_Code_Get,
		moneyType = ?CoinTypeDiamond,
		redValue = RobMoney,
		time = Now
	},
	send2Log(LogRec),

	%---------------------------
	?DEBUG_OUT("~w rob ~w, ~w",[RoleID, UID, RobMoney]),
	Histroy = #rec_History{roleID = RoleID, name = Name, time = Now,money = RobMoney},
	case myEts:readRecord(ets_redEnvelopeHistory, UID) of
		#rec_redEnvelopeHistory{list = L} ->
			myEts:updateEts(ets_redEnvelopeHistory, UID,{#rec_redEnvelopeHistory.list, [Histroy | L]});
		_ ->
			myEts:insertEts(ets_redEnvelopeHistory, #rec_redEnvelopeHistory{redUID = UID, list = [Histroy]})
	end,
	%---------------------------
	MailTitle2 = stringCfg:getString(bribery_money_MallTitle_get),
	MailContent2 = stringCfg:getString(bribery_money_MallContent_get, [getName(Creator),RobMoney]),
	AttachmentList = [#recMailCoin{coinType = ?CoinTypeBindDiamond, coinNum = RobMoney}],
	mail:sendSystemMail(RoleID, MailTitle2, MailContent2, AttachmentList, ""),
	%---------------------------
	%% 不对0做处理，让人来报bug
	psMgr:sendMsg2PS(FromPid,'RobRedEnvelopeAck', {Now, RobMoney, NewRec}),
	ok.

onRedEnvelopeRobed(#rec_redenvelope{creator = Creator, allMoney = AllMoney, takeMoney = TakeMoney
	,allNumber = AllNumber ,takeNumber = TakeNumber, createTime = CreateTime} = Rec)->
	%---------------------------
	case TakeMoney >= AllMoney orelse TakeNumber >= AllNumber of
		true ->
			deleteRedFromEtsAndDB(Rec),
			MailTitle = stringCfg:getString(bribery_money_MallTitle_all),
			MailContent = stringCfg:getString(bribery_money_MallContent_all, [AllNumber,AllMoney,myNow()-CreateTime]),
			mail:sendSystemMail(Creator, MailTitle, MailContent, [], "");
		_ ->
			send2DBS(update, Rec)
	end.

%%%-------------------------------------------------------------------
randGetMoney(?REDENVELOPE_TARGET_FIXROLE, _, _, AllMoney, TakeMoney)->
	AllMoney - TakeMoney;
randGetMoney(?REDENVELOPE_TARGET_WORLD, AllNumber, TakeNumer, AllMoney, TakeMoney)->
	LeftMoney = AllMoney - TakeMoney,
	LeftNumber = AllNumber - TakeNumer,
	sumSplitOne(LeftMoney, LeftNumber);
randGetMoney(_, _, _, _, _)->
	0.

%%%-------------------------------------------------------------------
canRobRedEnvelope(RoleID, GuildID, UID)->
	case myEts:readRecord(ets_redEnvelope, UID) of
		#rec_redenvelope{} = R ->
			checkCanRobRedEnvelope(RoleID, GuildID, R);
		_ ->
			{false, ?ErrorCode_RedEnvelope_code_Not_Exist}
	end.

checkCanRobRedEnvelope(RoleID, _GuildID, #rec_redenvelope{ targetUID = TargetUID, targetType = TargetType,deadlineTime = Deadline
	,allNumber = AllNumber, takeNumber = TakeNumber, allMoney = AllMoney, takeMoney = TakeMoney})->
	 case checkRedOwner(TargetType, TargetUID, RoleID) of
		 {true,_}->
			 case checkRedDeadline(Deadline) of
				 {true,_}->
					 case checkRedNumber(AllNumber, TakeNumber) of
						 {true, _} ->
							 checkRedMoney(AllMoney,TakeMoney);
						 V2 -> V2
					 end;
				 V1 -> V1
			 end;
		 V -> V
	 end.

%%%-------------------------------------------------------------------
checkRedOwner(?REDENVELOPE_TARGET_FIXROLE, TargetUID, RoleID)->
	{TargetUID =:= RoleID, ?ErrorCode_RedEnvelope_code_Unmatch};
checkRedOwner(?REDENVELOPE_TARGET_WORLD, _, _)->
	{true, 0};
checkRedOwner(_, _, _)->
	{true, 0}.
%%%-------------------------------------------------------------------
checkRedDeadline(Deadline)->
	{Deadline > myNow(), ?ErrorCode_RedEnvelope_code_Expires}.
%%%-------------------------------------------------------------------
checkRedNumber(AllNumber, TakeNumber)->
	{AllNumber > TakeNumber, ?ErrorCode_RedEnvelope_code_SY_Null}.
%%%-------------------------------------------------------------------
checkRedMoney(AllMoney, TakeMoney) ->
	{AllMoney > TakeMoney, ?ErrorCode_RedEnvelope_code_SY_Null}.


%%%-------------------------------------------------------------------
initRedEnvelopeData(L) ->
	lists:foreach( fun(R)-> giveBackRed(R) end, L),
	send2DBS(clearall,0),
	ok.

%%%-------------------------------------------------------------------
checkRedEnvelope() ->
	Now = myNow(),
	F = fun(#rec_redEnvelopeSim{redUID = UID,deadlineTime = Deadline}, _)->
			case Now >= Deadline of
				true ->
					redEnvelopeTimeout(UID);
				_ ->
					skip
			end,
			[]
	    end,
	ets:foldl(F, [],ets_redEnvelope1v1),
	ets:foldl(F, [],ets_redEnvelope1vN).

redEnvelopeTimeout(RedUID)->
	case getRedEnvelope(RedUID) of
		#rec_redenvelope{} = R->
			giveBackRed(R),
			deleteRedFromEtsAndDB(R);
		_->
			ok
	end.

deleteRedFromEtsAndDB(#rec_redenvelope{redUID = RedUID, targetType = TargetType} = R)->
	send2DBS(delete, R),
	delRedEnvelopeFromEts(TargetType, RedUID).

delRedEnvelopeFromEts(?REDENVELOPE_TARGET_FIXROLE, RedUID)->
	myEts:deleteEts(ets_redEnvelope1v1, RedUID);
delRedEnvelopeFromEts(?REDENVELOPE_TARGET_WORLD, RedUID)->
	myEts:deleteEts(ets_redEnvelope1vN, RedUID);
delRedEnvelopeFromEts(Type, RedUID)->
	?ERROR_OUT("RedEnvelope[~p][~p]delete from ets", [Type, RedUID]).

%%%-------------------------------------------------------------------
giveBackRed(#rec_redenvelope{creator = Creator, allMoney = AllMoney,
	allNumber = AllNumber, takeMoney = Take, takeNumber = TakeNumber} = R)->
	LeftMoney = AllMoney - Take,
	case LeftMoney > 0 of
		true ->
			MailTitle = stringCfg:getString(bribery_money_MallTitle_back),
			MailContent = stringCfg:getString(bribery_money_MallContent_back, [
				AllNumber,AllMoney,AllNumber - TakeNumber]),
			mail:sendMoneySystemMail(Creator, MailTitle, MailContent, ?CoinTypeBindDiamond, LeftMoney,[]),
			?LOG_OUT("giveBackRed(~w)",[R]);
		_ ->
			ok
	end.

%%%-------------------------------------------------------------------
myNow() -> time:getSyncUTCTimeFromDBS().

%%%-------------------------------------------------------------------
send2DBS(insert, R)->
	gsSendMsg:sendMsg2DBServer(redEnvelopeOperation, 0, {insert,R});
send2DBS(update, R)->
	gsSendMsg:sendMsg2DBServer(redEnvelopeOperation, 0, {update,R});
send2DBS(clearall, _)->
	gsSendMsg:sendMsg2DBServer(redEnvelopeOperation, 0, {clearall,0});
send2DBS(delete, R)->
	gsSendMsg:sendMsg2DBServer(redEnvelopeOperation, 0, {delete,R#rec_redenvelope.redUID});
send2DBS(Op, R)->
	?ERROR_OUT("~w,~w",[Op,R]).

%%%-------------------------------------------------------------------
send2Log(#rec_log_redenvelope{} = LogRec)->
	dbLog:sendSaveLogRedEnvelope(LogRec);
send2Log(R)->
	?ERROR_OUT("~w",[R]).

%%%-------------------------------------------------------------------
getName(RoleID)->
	case core:queryRoleKeyInfoByRoleID(RoleID) of
		#?RoleKeyRec{roleName = Name} ->
			Name;
		_ ->
			"???"
	end.


getLifeTime(?REDENVELOPE_TARGET_FIXROLE) ->
	case getCfg:getCfgPStack(cfg_globalsetup, redEnvelope_FriendRemainTime) of
		#globalsetupCfg{setpara = [V]} ->
			V * ?One_Hour_Second;
		_ ->
			24 * ?One_Hour_Second
	end;
getLifeTime(_) ->
	case getCfg:getCfgPStack(cfg_globalsetup, redEnvelope_WorldRemainTime) of
		#globalsetupCfg{setpara = [V]} ->
			V ;
		_ ->
			?One_Hour_Second
	end.

getBroadcastMoney() ->
	case getCfg:getCfgPStack(cfg_globalsetup, redEnvelope_WorldAnnouncementAmount) of
		#globalsetupCfg{setpara = [V]} ->
			V ;
		_ ->
			100000
	end.

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------

go(T)->
	hdlt_logger:initEnv("redSplit"),
	application:start(localLog),
	L = [{100,5},{100,10},{100,50},{100,70},{100,85},{200,5},{200,10},{200,50},{200,70}
	,{200,85},{200,100},{500,5},{500,10},{500,50},{500,70},{500,85},{500,100},{800,5}
	,{800,10},{800,50},{800,70},{800,85},{800,100},{1200,5},{1200,10},{1200,50},{1200,70}
	,{1200,85},{1200,100},{1600,5},{1600,10},{1600,50},{1600,70},{1600,85},{1600,100},{2000,5}
	,{2000,10},{2000,50},{2000,70},{2000,85},{2000,100}],
	lists:foreach( fun({X,N})-> st(T, X,N) end, L),
	ok.

%%
st(T, X, N)->
	Now = os:timestamp(),
	L1 = sumSplitOneByOne(T,[], X, N),
	Diff= timer:now_diff(os:timestamp(), Now),
	?LOG_OUT("~w/~w=~w/~w  ~w ms ~n ~w~n",[X, N, lists:sum(L1), length(L1), Diff/1000, L1]).

t(X,N)->
	t(X, N, 2*N).

t(X,N,Limit)->
	Now = os:timestamp(),
	random:seed(Now),
	L5 = sumSplitOnce(X, N, Limit),
	Diff= timer:now_diff(os:timestamp(), Now),
	?LOG_OUT("~w/~w=~w/~w  ~w ms ~n ~w~n",[X, N, lists:sum(L5),length(L5), Diff/1000, L5]).
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%%
sumSplitOne(X, N)->
	[R | _] = sumSplitOnce(X, N, 2*N),
	R.

%%
sumSplitOneByOne(_,Acc, X, _) when X =< 0->
	Acc;
sumSplitOneByOne(_,Acc, _, N) when N =< 0->
	Acc;
sumSplitOneByOne(_,Acc, X, N) when X < N->
	Acc;
sumSplitOneByOne(T,Acc, X, N)->
	R = case T of
		   0 ->
			   sumSplitOne(X, N);
		   _ ->
			   [R0 | _] = sumSplitOnce(X, N, 2*N),
			   R0
		end,
	sumSplitOneByOne(T, [R | Acc], X - R, N - 1).

%%
sumSplitOnce(X, _,_) when X =< 0->
	[0];
sumSplitOnce(X, N,_) when N =< 1->
	[X];
sumSplitOnce(X, N,_) when X < N->
	[0];
sumSplitOnce(X, N,_) when X =:= N->
	lists:duplicate(N, 1);
sumSplitOnce(X, N,_) when X < 2*N->
	L1 = lists:duplicate(N, 1),
	L2 = simpleRand(X - N, []),
	L3 = mergeAdd([], L2, L1),
	misc:shuffle(L3);
sumSplitOnce(X, N, Limit)->
	L2 = limitFastRand([X], X, N-1, Limit),
	L3 = lists:sort(L2),
	L4 = [0 | L3],
	L5 = makeResult([],L4),
	L5.

mergeAdd(L0, [], L2)->
	L0 ++ L2;
mergeAdd(L0, L1, [])->
	L0 ++ L1;
mergeAdd(L0, [A | L1], [B | L2])->
	mergeAdd([A+B | L0], L1, L2).

simpleRand(X,Acc) when X =< 0 ->
	Acc;
simpleRand(X,Acc)->
	D = misc:rand(1, X),
	simpleRand(X - D, [D | Acc]).

limitFastRand(Acc,X, _, _) when X =< 0->
	Acc;
limitFastRand(Acc,_, N, _) when N =< 0->
	Acc;
limitFastRand(Acc,_, _, Limit) when Limit =< 0->
	Acc;
limitFastRand(Acc,X, N, Limit)->
	Y = misc:rand(1, X-1),
	{Acc1,N1} =
		case lists:member(Y, Acc) of
			true ->
				{Acc,N};
			_ ->
				{[Y | Acc], N -1}
		end,
	limitFastRand(Acc1, X, N1, Limit-1).

%%
makeResult(Acc, [])->
	Acc;
makeResult(Acc,[_ | []])->
	Acc;
makeResult(Acc,[A,B | L2])->
	C = B - A,
	makeResult([C | Acc], [B | L2]).

