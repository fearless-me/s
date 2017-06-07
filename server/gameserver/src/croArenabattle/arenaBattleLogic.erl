%%-------------------------------------------------------------------
%%% @author luowei
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 跨服角斗士(角斗场)
%%% @end
%%% Created : 22. 十二月 2015 17:36
%%-------------------------------------------------------------------

-module(arenaBattleLogic).
-include("arenaBattlePrivate.hrl").
-include("gsInc.hrl").
%% API
-export([
	init/0,
	startAc/2,
	closeAc/1,
	delayCloseAc/0,
	dump_rank/0
]).

-export([
	tick/0,
	match/1,
	gm_match/1,
	addTeam/4,
	destoryMap/1,
	updateTeam/5,
	getAcData/0,
	getAcSwitch/0,
	getRankData/0,
	getFirstRankData/0,
	getHightRankData/0,
	getArenaJoinTeamList/0,
	sysHurt/3,
	gatherHurt/5,
	playerDead/5,
	playerLevelMap/3,
	cancelMatch/3,
	setNodeList/1,
	getNodeList/0,
	setStatPlayerNum/1,
	getStatPlayerNum/0,

	updatePlayerPid/3,
	refreshTurret/1
]).

-spec init() -> ok.
init() ->
	#activityCfg{starttime = [{_, Starttime} | _], lenghtime = Sec} = getAcData(),
	{{_Year,_Month,_Day}, {Hour,Minute,Second}} = time:getLocalNowDateTime1970(),
	OpenTime = Starttime * ?OneHourAcSec,
	EndTime = Starttime * ?OneHourAcSec + Sec,
	NowTime = Hour * ?OneHourAcSec + Minute * ?OneMinAcSec + Second,
	?DEBUG_OUT("ac time ~p,~p,~p",[NowTime, OpenTime, EndTime]),
	if
		NowTime < OpenTime ->
			%%即将开始(100毫秒防止进程还未启动成功)
			erlang:send_after((OpenTime - NowTime) * 1000 + 100, self(), startArenaAc);
		NowTime >= OpenTime andalso NowTime =< EndTime ->
			%%活动中,
			erlang:send_after(1000, self(), startArenaAc);
		true ->
			%%活动结束
			erlang:send_after((?OneDayAcSec - NowTime + OpenTime) * 1000, self(), startArenaAc)
	end,
	ok.

-spec startAc(Flag::boolean(), EndTime::uint()) -> ok.
startAc(false, EndTime) ->
	?LOG_OUT("gm arena battle ac will start !, cd time [~p]", [EndTime]),
	%%清空数据
	setStatPlayerNum(0),
	setArenaTeamList([]),
	setArenaJoinTeamList([]),
	setOneArenaApplyList([]),
	setTwoArenaApplyList([]),

	%%清理排行榜
	Day = getWeekDay(),
	clearRank(Day),
	setAcSwitch(true);

startAc(true, EndTime) ->
	Day = getWeekDay(),
	#activityCfg{starttime = L} = getAcData(),
	case L of
		[{0, Time}] ->
			L1 = [{1,Time},{2,Time},{3,Time},{4,Time},{5,Time},{6,Time},{7,Time}];
		_ ->
			L1 = L
	end,
	case lists:keyfind(Day, 1, L1) of
		{Day, _} ->
			?LOG_OUT("arena battle ac will start !, cd time [~p]", [EndTime]),
			%%清空数据
			setArenaTeamList([]),
			setArenaJoinTeamList([]),
			setOneArenaApplyList([]),
			setTwoArenaApplyList([]),
			
			%%清理排行榜
			clearRank(Day),
			setAcSwitch(true);
		_ ->
			?LOG_OUT("arena battle ac today not open")
	end.

-spec closeAc(Flag::boolean()) -> ok.
closeAc(false) ->
	?LOG_OUT("gm arena battle ac will close !"),
	setAcSwitch(false),
	%%活动结束 延迟刷新排行榜
	erlang:send_after(?CloseAcTime, self(), delayCloseAc);
closeAc(true) ->
	Day = getWeekDay(),
	#activityCfg{starttime = L} = getAcData(),
	case L of
		[{0, Time}] ->
			L1 = [{1,Time},{2,Time},{3,Time},{4,Time},{5,Time},{6,Time},{7,Time}];
		_ ->
			L1 = L
	end,
	case lists:keyfind(Day, 1, L1) of
		{Day, _} ->
			?LOG_OUT("arena battle ac will close !"),
			setAcSwitch(false),
			%%活动结束 延迟刷新排行榜
			erlang:send_after(?CloseAcTime, self(), delayCloseAc);
		_ ->
			?LOG_OUT("arena battle ac today not close")
	end.

-spec delayCloseAc() -> ok.
delayCloseAc() ->
	
	%%更新数据
	NodeList = getNodeList(),
	Fun = fun({_DBID, Pid}) ->
		psMgr:sendMsg2PS(Pid, updateArenaRank, [getRankData(), getHightRankData()])
	end,
	lists:foreach(Fun, NodeList),
	
	%%保存数据
	ets:tab2file(?Ets_Tab_Arena_Rank, ?Ets_Tab_Arena_Rank_Txt),
	
	%%清空数据
	setStatPlayerNum(0),
	setArenaTeamList([]),
	setArenaJoinTeamList([]),
	setOneArenaApplyList([]),
	setTwoArenaApplyList([]).

-spec updatePlayerPid(_TeamID::uint64(),RoleID::uint64(),NewPlayerPid::pid()) ->ok.
updatePlayerPid(_TeamID,RoleID,NewPlayerPid) ->
	L = getArenaTeamList(),
	Fun = fun(#arenaTeamInfo{member = Members} = Row) ->
		case lists:keyfind(RoleID, #arenaPlayerInfo.roleID, Members) of
			#arenaPlayerInfo{} = FindRow ->
				NewMember = lists:keyreplace(RoleID, #arenaPlayerInfo.roleID,Members,FindRow#arenaPlayerInfo{pid = NewPlayerPid}),
				Row#arenaTeamInfo{member = NewMember};
			_ ->
				Row
		end
	      end,
	NewL =[ Fun(One) || One<- L],

	setArenaTeamList(NewL),
	ok.
%%参加竞技场活动1人报名列表
-spec getOneArenaApplyList() -> list().
getOneArenaApplyList() ->
	case get(oneapplylist) of
		undefined ->
			[];
		L ->
			L
	end.

%%设置竞技场活动1人报名列表
-spec setOneArenaApplyList(L::list()) -> ok.
setOneArenaApplyList(L) ->
	put(oneapplylist, L),
	ok.

%%参加竞技场活动2人报名列表
-spec getTwoArenaApplyList() -> list().
getTwoArenaApplyList() ->
	case get(twoapplylist) of
		undefined ->
			[];
		L ->
			L
	end.

%%设置竞技场活动2人报名列表
-spec setTwoArenaApplyList(L::list()) -> ok.
setTwoArenaApplyList(L) ->
	put(twoapplylist, L),
	ok.

%%设置队伍列表
-spec setArenaTeamList(L::list()) -> ok.
setArenaTeamList(L) ->
	put(teamarenaList, L),
	ok.

%%获取队伍列表
-spec getArenaTeamList() -> list().
getArenaTeamList() -> 
	case get(teamarenaList) of
		undefined ->
			[];
		L ->
			L
	end.

%%设置比赛队伍
-spec setArenaJoinTeamList(L::list()) -> ok.
setArenaJoinTeamList(L) ->
	put(jointeamarenaList, L),
	ok.
	

%%获取比赛队伍
-spec getArenaJoinTeamList() -> list().
getArenaJoinTeamList() ->
	case get(jointeamarenaList) of
		undefined ->
			[];
		L ->
			L
	end.

%%设置活动开关
-spec setAcSwitch(State::boolean()) -> ok.
setAcSwitch(State) ->
	put(arenaAcSwitch, State).

%%获取活动开关
-spec getAcSwitch() -> boolean().
getAcSwitch() ->
	case get(arenaAcSwitch) of
		undefined ->
			false;
		State ->
			State
	end.

%%活动实时统计人数
-spec setStatPlayerNum(Num::uint()) -> ok.
setStatPlayerNum(Num) ->
	put(statPlayerNum, Num).

%%获取活动实时统计人数
-spec getStatPlayerNum() -> ok.
getStatPlayerNum() ->
	case get(statPlayerNum) of
		undefined ->
			0;
		Time ->
			Time
	end.

%%保存各节点信息
-spec setNodeList(L::uint()) -> ok.
setNodeList(L) ->
	put(gsNodeList, L),
	ok.

%%获取各节点信息
-spec getNodeList() -> ok.
getNodeList() ->
	case get(gsNodeList) of
		undefined ->
			[];
		L ->
			L
	end.

-spec getRankData() -> ok.
getRankData() ->
	L = ets:tab2list(?Ets_Tab_Arena_Rank),
	L1 = lists:reverse(lists:keysort(#?Ets_Tab_Arena_Rank.record, L)),


	case length(L1) =< ?RankNum of
		true ->
			L1;
		_ ->
			lists:sublist(L1, ?RankNum)
	end.

-spec getHightRankData() -> list().
getHightRankData() ->
	ets:tab2list(?Ets_Tab_Arena_Hight_Rank).

%%获取第一名
-spec getFirstRankData() -> [] | #arenaBattleRank{}.
getFirstRankData() ->
	L = ets:tab2list(?Ets_Tab_Arena_Rank),
	L1 = lists:reverse(lists:keysort(#?Ets_Tab_Arena_Rank.record, L)),
	case L1 of
		[] ->
			[];
		[H | _] ->
			H
	end.
		
-spec getWeekDay() -> uint().
getWeekDay() ->
	{{Year,Month,Day}, {_,_,_}} = time:getLocalNowDateTime1970(),
	calendar:day_of_the_week(Year,Month,Day).

%%更新排行榜数据
-spec updateRank(Members::uint()) -> ok.
updateRank([]) ->
	ok;
updateRank([#arenaPlayerInfo{roleID = RoleID} = Info | L]) ->
	case myEts:lookUpEts(?Ets_Tab_Arena_Rank, RoleID) of
		[#?Ets_Tab_Arena_Rank{record = R, win = W, fail = F} = B] ->
			B1 = B#?Ets_Tab_Arena_Rank{
				   sname = Info#arenaPlayerInfo.sname,
				   dbID = Info#arenaPlayerInfo.dbID,
				   force = Info#arenaPlayerInfo.force,
				   name = Info#arenaPlayerInfo.name,
				   win = W + Info#arenaPlayerInfo.win,
				   fail = F + Info#arenaPlayerInfo.fail,
				   record = R + Info#arenaPlayerInfo.arenaVal
				   };
		_ ->
			B1 = #?Ets_Tab_Arena_Rank{
				  roleID = Info#arenaPlayerInfo.roleID,
				  carrer = Info#arenaPlayerInfo.career,
				  sname = Info#arenaPlayerInfo.sname,
				  dbID = Info#arenaPlayerInfo.dbID,
				  force = Info#arenaPlayerInfo.force,
				  name = Info#arenaPlayerInfo.name,
				  win = Info#arenaPlayerInfo.win,
				  fail = Info#arenaPlayerInfo.fail,
				  record = Info#arenaPlayerInfo.arenaVal
				  }
	end,
	ets:insert(?Ets_Tab_Arena_Rank, B1),
	updateRank(L).

%%tick
-spec tick() -> ok.
tick() ->
	tickTeam(),
	tickApply(),
	tickGameAc().
	
%%tick匹配队友是否超时
-spec tickApply() -> ok.
tickApply() ->
	L1 = getOneArenaApplyList(),
	L2 = getTwoArenaApplyList(),
	Now = time:getLocalNowSec1970(),
	Fun = fun(#arenaPlayerInfo{netPid = NetPid, roleID = RoleID, time = Time, pid = Pid}, Acc) ->
		case Now >= Time + ?MatchApplyTimeOut of
			true ->
				?DEBUG_OUT("roleid [~p] match apply fail.....",[RoleID]),
				psMgr:sendMsg2PS(Pid, matchFail, {0}),
				playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosArenaMatchMateTimeOut),
				lists:keydelete(RoleID, #arenaPlayerInfo.roleID, Acc);
			_ ->
				Acc
		end
	end,
	setOneArenaApplyList(lists:foldl(Fun, L1, L1)),
	setTwoArenaApplyList(lists:foldl(Fun, L2, L2)).
%kk()->
%	receive
%		M ->
%			ok
%	end.
%%tick本场比赛时间
-spec tickGameAc() -> ok.
tickGameAc() ->
	L = getArenaJoinTeamList(),
	tickGameAc(L).

tickGameAc([]) ->
	ok;
tickGameAc([#arenaTeamJoinInfo{time = 0}| L]) ->
	tickGameAc(L);
tickGameAc([#arenaTeamJoinInfo{mappid = MapPid, mapid = MapID, time = Time} = Info | L]) ->
	Now = time:getLocalNowSec1970(),
	case Now >= Time of
		true ->
			endBattle(Info);
		_ ->
			refreshObject(Info),
			clearResist(MapPid, MapID)
	end,
	tickGameAc(L).

%%tick匹配队伍
-spec tickTeam() -> ok.
tickTeam() ->
	L = getArenaTeamList(),
	Now = time:getLocalNowSec1970(),
	Fun = fun(#arenaTeamInfo{maxval = MaxVal, time = Time, member = Member}, Acc) ->
		case Now >= Time + ?MatchTeamTimeOut of
			true ->
				Fun1 = fun(#arenaPlayerInfo{pid = Pid, roleID = RoleID, netPid = NetPid}) ->
					?DEBUG_OUT("roleid [~p] match Team fail.....",[RoleID]),
					psMgr:sendMsg2PS(Pid, matchFail, {1}),
					playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosArenaMatchTeamTimeOut)
				end,
				lists:foreach(Fun1, Member),
				lists:keydelete(MaxVal, #arenaPlayerInfo.arenaVal, Acc);
			_ ->
				Acc
		end
	end,
	setArenaTeamList(lists:foldl(Fun, L, L)).

%%取消匹配
-spec cancelMatch(RoleID::uint(), TeamID::uint(), DBID::uint()) -> ok.
cancelMatch(RoleID, TeamID, DBID) ->
	Ret = cancelApplyMatch(RoleID, TeamID, DBID),
	Ret1 = case cancelTeamMatch(Ret, RoleID) of
		true ->
			?LOG_OUT("cancel  match success roleID:~p, TeamID::~p, DBID::~p",[RoleID, TeamID, DBID]),
			true;
		_ ->
			?ERROR_OUT("cancel  match fail roleID:~p, TeamID::~p, DBID::~p",[RoleID, TeamID, DBID]),
			false
	end,
	Ret1.

%%取消队伍列表
-spec cancelTeamMatch(Ret::boolean(), RoleID::uint()) -> boolean().
cancelTeamMatch(false, RoleID) ->
	L = getArenaTeamList(),
	Fun = fun(#arenaTeamInfo{maxval = MaxVal, member = Members}, {Flag, Acc}) ->
		case lists:keyfind(RoleID, #arenaPlayerInfo.roleID, Members) of
			#arenaPlayerInfo{} ->
				%%通知玩家进程取消匹配
				F = fun(#arenaPlayerInfo{pid = Pid}) ->		
					psMgr:sendMsg2PS(Pid, cancelMatch, {})
				end,
				lists:foreach(F, Members),
				NewAcc = lists:keydelete(MaxVal, #arenaTeamInfo.maxval, Acc),
				{true, NewAcc};
			_ ->
				{Flag, Acc}
		end
	end,
	{Bool, L1} = lists:foldl(Fun, {false, L}, L),
	setArenaTeamList(L1),
	Bool;
cancelTeamMatch(true, _) ->
	true.

%%取消申请列表
-spec cancelApplyMatch(RoleID::uint(), TeamID::uint(), DBID::uint()) -> boolean().
cancelApplyMatch(RoleID, TeamID, DBID) ->
	L1 = getOneArenaApplyList(),
	L2 = getTwoArenaApplyList(),
	Ret = case lists:keyfind(RoleID, #arenaPlayerInfo.roleID, L1) of
		#arenaPlayerInfo{pid = Pid} ->
			%%通知玩家进程取消匹配
			psMgr:sendMsg2PS(Pid, cancelMatch, {}),
			L3 = lists:keydelete(RoleID, #arenaPlayerInfo.roleID, L1),
			setOneArenaApplyList(L3),
			true;
		_ ->
			false
	end,
	case Ret of
		false ->
			case lists:keyfind(RoleID, #arenaPlayerInfo.roleID, L2) of
				#arenaPlayerInfo{} ->
					Fun = fun(#arenaPlayerInfo{roleID = PlayerID, pid = Pid, teamID = PlayerTeamID, dbID = PlayerDBID}, Acc) ->
						case PlayerTeamID =:= TeamID andalso DBID =:= PlayerDBID of
							true ->
								%%通知玩家进程取消匹配
								psMgr:sendMsg2PS(Pid, cancelMatch, {}),
								lists:keydelete(PlayerID, #arenaPlayerInfo.roleID, Acc);
							_ ->
								Acc
						end
					end,
					L4 = lists:foldl(Fun, L2, L2),
					setTwoArenaApplyList(L4),
					true;
				_ ->
					false
			end;
		true ->
			true
	end.

%%匹配队友
-spec gm_match(MemberList::list()) -> ok.
gm_match(MemberList) ->
	case checkMember1(MemberList) of
		true ->
			V =
				case getArenaTeamList() of
					[] ->
						case getOneArenaApplyList() of
							[] ->
								case getTwoArenaApplyList() of
									[] ->
										false;
									[#arenaPlayerInfo{} = Info|L3] ->
										InfoInfo =
											case getSameTeam(Info, L3) of
												[] ->
													setTwoArenaApplyList(L3),
													[Info];
												Info2 ->
													setTwoArenaApplyList(L3 -- [Info2]),
													[Info, Info2]
											end,
										#arenaTeamInfo{member = InfoInfo, maxval = 0, time = 0}
								end;
							[#arenaPlayerInfo{} = Info|L2] ->
								setOneArenaApplyList(L2),
								#arenaTeamInfo{member = [Info], maxval = 0, time = 0}
						end;
					[#arenaTeamInfo{} = TeamInfo|_] = L1 ->
						setArenaTeamList(lists:delete(TeamInfo, L1)),
						TeamInfo
				end,

			case V of
				#arenaTeamInfo{member = Members} ->
					%%匹配成功
					?LOG_OUT("gm_match team succ, match aers team [~p], match ders team [~p]", [MemberList, Members]),

					%%分配地图线
					#activityCfg{mapidlist = MapList} = getAcData(),
					MapID = lists:nth(misc:rand(1, length(MapList)), MapList),
					core:sendMsgToMapMgr(MapID, createActivityMap, {MapID, 1, {MemberList, Members}});
				_ ->
					?ERROR_OUT("gm_match no enough player:~p", [MemberList]),
					false
			end;
		_ ->
			?ERROR_OUT("repeat enter arena battle [~p]",[MemberList])
	end.

%%匹配队友
-spec match(MemberList::list()) -> ok.
match(MemberList) ->
	case checkMember1(MemberList) of
		true ->
			match1(MemberList);
		_ ->
			?ERROR_OUT("repeat enter arena battle [~p]",[MemberList])
	end.

match1(MemberList) when length(MemberList) =:= 3 ->
	matchTeam(MemberList);
match1(MemberList) when length(MemberList) =:= 2 ->
	matchApply1(MemberList);
match1(MemberList) ->
	matchApply2(MemberList).

checkMember1(L) ->
	checkMember1(L, getOneArenaApplyList() ++ getTwoArenaApplyList()).

checkMember1(L, []) ->
	checkMember2(L);
checkMember1([], _) ->
	true;
checkMember1([#arenaPlayerInfo{roleID = RoleID} = Info | L], L1) ->
	case lists:keyfind(RoleID, #arenaPlayerInfo.roleID, L1) of
		false ->
			case checkMember2([Info]) of
				true ->
					checkMember1(L, L1);
				_ ->
					false
			end;
		_ ->
			false
	end.

checkMember2(L) ->
	checkMember2(L, getArenaTeamList()).

checkMember2([], _) ->
	true;
checkMember2([#arenaPlayerInfo{} = Info | L], L1) ->
	case checkMember3(Info, L1) of
		true ->
			checkMember2(L, L1);
		_ ->
			false
	end.
		  
checkMember3(#arenaPlayerInfo{}, []) ->
	true;
checkMember3(#arenaPlayerInfo{roleID = RoleID} = Info, [#arenaTeamInfo{member = Member} | L]) ->
	case lists:keyfind(RoleID, #arenaPlayerInfo.roleID, Member) of
		false ->
			checkMember3(Info, L);
		_ ->
			false
	end.

matchApply1(MemberList) ->
	case getOneArenaApplyList() of
		[] ->
			TwoL = getTwoArenaApplyList(),
			setTwoArenaApplyList(MemberList ++ TwoL);
		L ->
			[H | L1] = lists:keysort(#arenaPlayerInfo.time, L),
			setOneArenaApplyList(L1),
			matchTeam([H | MemberList])
	end.

matchApply2(MemberList) ->
	case getTwoArenaApplyList() of
		[] ->		
			case getOneArenaApplyList() of
				[] ->
					setOneArenaApplyList(MemberList);
				L when length(L) =:= 1 ->
					setOneArenaApplyList(MemberList ++ L);
				L ->
					[H | L1] = lists:keysort(#arenaPlayerInfo.time, L),
					[H1 | L2] = L1,
					setOneArenaApplyList(L2),
					matchTeam([H] ++ [H1] ++ MemberList)
			end;
		TwoL ->
			[H | TwoL1] = lists:keysort(#arenaPlayerInfo.time, TwoL),
			case getSameTeam(H, TwoL1) of
				[] ->
					setOneArenaApplyList(MemberList);
				H1 ->
					setTwoArenaApplyList(TwoL1 -- [H1]),
					matchTeam([H] ++ [H1] ++ MemberList)
			end
	end.

getSameTeam(#arenaPlayerInfo{roleID = RoleID, dbID = DBID, teamID = TeamID}, []) ->
	?ERROR_OUT("get same team member fail, roleID:~p, DBID:~p, teamID:~p",[RoleID, DBID, TeamID]),
	[];
getSameTeam(#arenaPlayerInfo{ dbID = DBID, teamID = TeamID}, [#arenaPlayerInfo{dbID = DBID1, teamID = TeamID1} = H | _L]) when DBID =:= DBID1 andalso TeamID =:= TeamID1 ->
	H;
getSameTeam(H, [_ | L]) ->
	getSameTeam(H, L).

matchTeam(MemberList) ->
	MaxVal = getMaxVal(MemberList),
	L = lists:keysort(#arenaTeamInfo.time, getArenaTeamList()),
	matchTeam(MaxVal, MemberList, L, L).

matchTeam(MaxVal, MemberList, [], L) -> %%未找到匹配
	Team = #arenaTeamInfo{maxval = MaxVal,time = time:getLocalNowSec1970(), member = MemberList},
	setArenaTeamList([Team | L]);
matchTeam(MaxVal, MemberList, [#arenaTeamInfo{maxval = Val, member = Members} = TeamInfo | L1], L) ->
	MatchValue = globalCfg:getArenaMatch(),
	case abs(MaxVal - Val) > MatchValue of
		true ->
			matchTeam(MaxVal, MemberList, L1, L);
		_ ->
			%%匹配成功
			?LOG_OUT("match team succ, match aers team [~p], match ders team [~p]", [MemberList, Members]),
			setArenaTeamList(lists:delete(TeamInfo, L)),
			
			%%分配地图线
			#activityCfg{mapidlist = MapList} = getAcData(),
			MapID = lists:nth(misc:rand(1, length(MapList)), MapList),
			core:sendMsgToMapMgr(MapID, createActivityMap, {MapID, 1, {MemberList, Members}})
	end.

-spec addTeam(Aers::list(), Ders::list(), MapPid::pid(), MapID::pid()) -> ok.
addTeam(Aers, Ders, MapPid, MapID) ->
	L = getArenaJoinTeamList(),
	Now = time:getLocalNowSec1970(),
	#arenaCfg{
		event_time = EventTime
	} = getCfg:getCfgPStack(cfg_arena, MapID),
	case EventTime of
		0 ->
			RefreshTime = 0;
		_ ->
			RefreshTime = Now
	end,
	JoinTeam = #arenaTeamJoinInfo{refreshtime = RefreshTime, mapid = MapID, mappid = MapPid, members = Aers ++ Ders, time = Now + ?GameAcLifeTime + 10},
	setArenaJoinTeamList([JoinTeam | L]).

-spec updateTeam(MapPid::pid(), RoleID::uint(), Camp::uint(), IsGame::uint(),NewPlayPid::pid()) -> ok.
updateTeam(MapPid, RoleID, _Camp, IsGame,NewPlayPid) ->
	L = getArenaJoinTeamList(),
	case lists:keyfind(MapPid, #arenaTeamJoinInfo.mappid, L) of
		false ->
			?ERROR_OUT("update team not exist, mappid [~p]", [MapPid]),
			skip;
		#arenaTeamJoinInfo{time = Time, members = Members} = Info ->
			case lists:keyfind(RoleID, #arenaPlayerInfo.roleID, Members) of
				false ->
					?ERROR_OUT("update team member not exist, roleid [~p]", [RoleID]),
					skip;
				#arenaPlayerInfo{netPid = NetPid} = Member ->
					NewMember = Member#arenaPlayerInfo{ingame = IsGame,pid=NewPlayPid},
					NewMembers = lists:keyreplace(RoleID, #arenaPlayerInfo.roleID, Members, NewMember),
					NewInfo = Info#arenaTeamJoinInfo{members = NewMembers},
					NewL = lists:keyreplace(MapPid, #arenaTeamJoinInfo.mappid, L, NewInfo),
					setArenaJoinTeamList(NewL),
					
					%%发送队伍信息
					sendRoleList(NetPid, Time - time:getLocalNowSec1970(), NewMembers)
			end
	end,				
	ok.

%%玩家离开地图
-spec playerLevelMap(Camp::uint(), MapPid::pid(), RoleID::uint()) -> ok.
playerLevelMap(Camp, MapPid, RoleID) ->
	?DEBUG_OUT("player level map pid [~p], roleID [~p]",[MapPid, RoleID]),
	L = getArenaJoinTeamList(),
	case lists:keyfind(MapPid, #arenaTeamJoinInfo.mappid, L) of
		false -> 
			?ERROR_OUT("player [~p] level map, has not join cros arena, mappid [~p]", [MapPid, RoleID]);
		#arenaTeamJoinInfo{members = Members} = JoinInfo ->
			%%发送死亡消息
			sendRoleDead(RoleID, Members),
			
			%%更新玩家信息
			Role = #arenaPlayerInfo{} = lists:keyfind(RoleID, #arenaPlayerInfo.roleID, Members),
			NewRole = Role#arenaPlayerInfo{ingame = ?OutGame},
			Members1 = lists:keyreplace(RoleID, #arenaPlayerInfo.roleID, Members, NewRole),
			
			%%更新队伍信息
			JoinInfo1 = JoinInfo#arenaTeamJoinInfo{members = Members1},
			L1 = lists:keyreplace(MapPid, #arenaTeamJoinInfo.mappid, L, JoinInfo1),
			setArenaJoinTeamList(L1),
			
			TeamMember = getMemberList(Camp, Members1),
			case checkTeamIsLose(TeamMember) of
				true ->
					?DEBUG_OUT("player [~p] level map, map pid [~p] end battle, camp [~p]",[RoleID, MapPid, Camp]),
					endBattle(Camp, JoinInfo1, L1);
				_ ->
					?DEBUG_OUT("player [~p] level map, map pid [~p] come on battle, camp [~p]",[RoleID, MapPid, Camp]),
					skip
			end
	end,
	ok.

%%同步玩家伤害
-spec sysHurt(Hurt::uint(), RoleID::uint(), MapPid::uint()) -> ok.
sysHurt(Hurt, RoleID, MapPid) ->
	L = getArenaJoinTeamList(),
	case lists:keyfind(MapPid, #arenaTeamJoinInfo.mappid, L) of
		false ->
			?ERROR_OUT("sys hurt [~p] dead, has not join cros arena, mappid [~p]", [RoleID, MapPid]),
			ok;
		#arenaTeamJoinInfo{members = Members} = JoinInfo ->
			Role = #arenaPlayerInfo{} = lists:keyfind(RoleID, #arenaPlayerInfo.roleID, Members),
			NewRole = Role#arenaPlayerInfo{hurt = Hurt},
			Members1 = lists:keyreplace(RoleID, #arenaPlayerInfo.roleID, Members, NewRole),	
			JoinInfo1 = JoinInfo#arenaTeamJoinInfo{members = Members1},
			L1 = lists:keyreplace(MapPid, #arenaTeamJoinInfo.mappid, L, JoinInfo1),
			setArenaJoinTeamList(L1)
	end.

%%大炮造成的伤害
-spec gatherHurt(Camp::uint(), PcHurt::uint(), MapPid::uint(), RoleID::uint(), NetPid::pid()) -> ok.
gatherHurt(Camp, PcHurt, MapPid, RoleID, NetPid) ->
	L = getArenaJoinTeamList(),
	case lists:keyfind(MapPid, #arenaTeamJoinInfo.mappid, L) of
		false ->
			?ERROR_OUT("player [~p] gatherHurt, has not join cros arena, mappid [~p]", [RoleID, MapPid]);
		#arenaTeamJoinInfo{members = Members, refreshtime = RefreshTime} = JoinTeam ->
			Now = time:getLocalNowSec1970(),
			case Now >= RefreshTime of
				true ->
					Cd = globalCfg:getArenaGatherCd(),
					NewJoinTeam = JoinTeam#arenaTeamJoinInfo{refreshtime = Now + Cd},
					L1 = lists:keyreplace(MapPid, #arenaTeamJoinInfo.mappid, L, NewJoinTeam),
					setArenaJoinTeamList(L1),
					gatherHurt(Camp, PcHurt, Members);
				_ ->
					playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosArenaHasCd)
			end
	end.

gatherHurt(?CampRedBattle, PcHurt, Members) ->
	MemberList = getMemberOnlineList(getMemberList(?CampBlueBattle, Members), []),
	gatherHurt1(MemberList, PcHurt, Members);
gatherHurt(_, PcHurt, Members) ->
	MemberList = getMemberOnlineList(getMemberList(?CampRedBattle, Members), []),
	gatherHurt1(MemberList, PcHurt, Members).
	
gatherHurt1([], _, _) ->
	?ERROR_OUT("cros battle all player dead or out game"),
	ok;
gatherHurt1(MemberList, PcHurt, Members) ->
	Len = length(MemberList),
	RandNum = misc:rand(1, Len),
	#arenaPlayerInfo{
		pid = Pid, 
		name = Name
	} = lists:nth(RandNum, MemberList),
	%%广播消息
	N = stringCfg:getString(arena_DapaoRefresh, [Name, globalCfg:getArenaGatherCd()]),
	Fun = fun(#arenaPlayerInfo{netPid = NetPid}) ->
		core:sendBroadcastNotice(N, NetPid)
	end,
	lists:foreach(Fun, Members),
	psMgr:sendMsg2PS(Pid, gatherHurtAck, {PcHurt}).

%%玩家死亡
%%camp = ?CampBlueBattle / ?CampRedBattle,
-spec playerDead(MapPid::pid(), RoleID::uint(), AttackRoleID::uint(), Camp::uint(), Hurt::uint()) -> ok.
playerDead(MapPid, RoleID, AttackRoleID, Camp, Hurt) ->
	L = getArenaJoinTeamList(),
	case lists:keyfind(MapPid, #arenaTeamJoinInfo.mappid, L) of
		false ->
			?ERROR_OUT("player [~p] dead, has not join cros arena, mappid [~p]", [RoleID, MapPid]);
		#arenaTeamJoinInfo{members = Members} = JoinInfo ->
			%%发送死亡消息
			sendRoleDead(RoleID, Members),
			
			%%被自己的buff这种搞死的，就在敌对阵营找一个来得这个击杀数
			RealAttacker =
			case AttackRoleID == RoleID of
				true ->
					RealCamp = case Camp of
								   ?CampRedBattle ->?CampBlueBattle;
								   _ ->?CampRedBattle
							   end,

					case lists:keyfind(RealCamp, #arenaPlayerInfo.camp, Members) of
						#arenaPlayerInfo{roleID = ArenaRoleID} ->
							ArenaRoleID;
						_ ->
							AttackRoleID
					end;
				_ ->
					AttackRoleID
			end,
			
			%%更新自己信息
			Role = #arenaPlayerInfo{} = lists:keyfind(RoleID, #arenaPlayerInfo.roleID, Members),
			NewRole = Role#arenaPlayerInfo{hurt = Hurt, isdead = ?Dead},
			Members1 = lists:keyreplace(RoleID, #arenaPlayerInfo.roleID, Members, NewRole),	
			
			%%更新攻击者信息
			case lists:keyfind(RealAttacker, #arenaPlayerInfo.roleID, Members) of
				#arenaPlayerInfo{killnum = OldNum} = AttackRole ->
					NewAttackRole = AttackRole#arenaPlayerInfo{killnum = OldNum + 1},
					Members2 = lists:keyreplace(RealAttacker, #arenaPlayerInfo.roleID, Members1, NewAttackRole);
				_ ->
					Members2 = Members1
			end,	
			JoinInfo1 = JoinInfo#arenaTeamJoinInfo{members = Members2},
			L1 = lists:keyreplace(MapPid, #arenaTeamJoinInfo.mappid, L, JoinInfo1),
			setArenaJoinTeamList(L1),
			
			TeamMember = getMemberList(Camp, Members2),
			case checkTeamIsLose(TeamMember) of
				true ->
					?DEBUG_OUT("player [~p] dead, map pid [~p] end battle, attack roleID [~p], camp [~p], hurt [~p] ",[RoleID, MapPid, RealAttacker, Camp, Hurt]),
					endBattle(Camp, JoinInfo1, L1);
				_ ->
					?DEBUG_OUT("player [~p] dead, map pid [~p] come on battle, attack roleID [~p], camp [~p], hurt [~p] ",[RoleID, MapPid, RealAttacker, Camp, Hurt]),
					skip
			end
	end,
	ok.

%%战斗结束
endBattle(#arenaTeamJoinInfo{members = Members} = JoinInfo) ->
	L = getArenaJoinTeamList(),
	Res = getBattleRes(Members),
	endBattle1(Res, JoinInfo, L).

endBattle(Camp, #arenaTeamJoinInfo{} = JoinInfo, L) ->
	Res = 
	case Camp of
		?CampRedBattle ->
			?Fail;
		_ ->
			?Win
	end,
	endBattle1(Res, JoinInfo, L),
	ok.

endBattle1(Res, #arenaTeamJoinInfo{mappid = MapPid, members = Members, mapid = MapID} = JoinInfo, L) ->
	%%两对队员
	RedMember = getMemberList(?CampRedBattle, Members),
	BlueMember = getMemberList(?CampBlueBattle, Members),
	
	%%两对战斗值
	RedMaxVal = getMaxVal(RedMember),
	BlueMaxVal = getMaxVal(BlueMember),
	
	%%获取阶段分数
	RedArenaVal = getMemberRewardPoint(RedMaxVal, Res, red),
	BlueArenaVal = getMemberRewardPoint(BlueMaxVal, Res, blue),
	
	{[RedGoodsID, RedGoodNum, RedRes], [BlueGoodsID, BlueGoodsNum, BlueRes]} = getMemberRewardGood(Res),

	%%增加队友积分
	Fun = fun(#arenaPlayerInfo{pid = Pid, arenaVal = ArenaVal} = Info, {Val, GoodsID, GoodsNum, BattleRes, Acc}) ->
				case misc:is_process_alive(Pid) of
					true ->
						psMgr:sendMsg2PS(Pid, dealCrosAreadReward, {BattleRes, GoodsID, GoodsNum, Val}),
						{Val, GoodsID, GoodsNum, BattleRes, [Info#arenaPlayerInfo{arenaVal = ArenaVal + Val} | Acc]};
					_ ->
						{Val, GoodsID, GoodsNum, BattleRes, [Info | Acc]}
				end
	end,
	{_, _, _, _, NewRedMember} = lists:foldl(Fun, {RedArenaVal, RedGoodsID, RedGoodNum, RedRes, []}, RedMember),
	{_, _, _, _, NewBlueMember} = lists:foldl(Fun, {BlueArenaVal, BlueGoodsID, BlueGoodsNum, BlueRes, []}, BlueMember),
	NewMembers = NewRedMember ++ NewBlueMember,
	NewJoinInfo = JoinInfo#arenaTeamJoinInfo{members = NewMembers, res = Res},
	L1 = lists:keydelete(MapPid, #arenaTeamJoinInfo.mappid, L),
	%%L1 = lists:keyreplace(MapPid, #arenaTeamJoinInfo.mappid, L, NewJoinInfo),
	%%保存排行榜数据
	updateRank(NewMembers),
	
	%%删除本次战斗信息
	setArenaJoinTeamList(L1),
	
	%%发送战斗结果
	sendBattlRes(NewJoinInfo, RedArenaVal, BlueArenaVal),

	%%通知地图踢玩家
	erlang:send_after(getCrosMapDestoryTime(MapID), self(), {noticeDestoryCrosMap, MapPid}),
	ok.

%%清理空气墙
-spec clearResist(MapPid::pid(), MapID::uint()) -> ok.
clearResist(MapPid, MapID) ->
	L = getArenaJoinTeamList(),
	Now = time:getLocalNowSec1970(),
	case lists:keyfind(MapPid, #arenaTeamJoinInfo.mappid, L) of
		#arenaTeamJoinInfo{time = Time, members = Members, isclear = false} = JoinInfo ->
			case Time - Now =< ?GameAcLifeTime of
				true ->
					%%发送消息
					Fun = fun(#arenaPlayerInfo{netPid = NetPid}) ->
						if
							MapID =:= ?Map6018 ->
								playerMsg:sendNetMsg(NetPid, ?Block6018);
							MapID =:= ?Map6019 ->
								playerMsg:sendNetMsg(NetPid, ?Block6019);
							MapID =:= ?Map6020 ->
								playerMsg:sendNetMsg(NetPid, ?Block6020);
							true ->
								skip
						end
					end,
					lists:foreach(Fun, Members),
					NewJoinInfo = JoinInfo#arenaTeamJoinInfo{isclear = true},
					L1 = lists:keyreplace(MapPid, #arenaTeamJoinInfo.mappid, L, NewJoinInfo),
					setArenaJoinTeamList(L1);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.
		
%%刷新炮塔
-spec refreshTurret(MapPid::pid()) -> ok.
refreshTurret(MapPid) ->
	L = getArenaJoinTeamList(),
	JoinInfo = #arenaTeamJoinInfo{} = lists:keyfind(MapPid, #arenaTeamJoinInfo.mappid, L),
	refreshObject(JoinInfo).

%%刷新对象
-spec refreshObject(#arenaTeamJoinInfo{}) -> ok.
refreshObject(#arenaTeamJoinInfo{mappid = MapPid, refreshtime = Time, mapid = MapID, members = Members} = JoinInfo) ->
	#arenaCfg{
		event_type = Type,
		event_id = Ids,
		coordinate = Pos,
		event_num = Num,
		event_time = EventTime
	} = getCfg:getCfgPStack(cfg_arena, MapID),
	Now = time:getLocalNowSec1970(),
	Fun = fun(_Index) ->
		Rand1 = misc:rand(1, length(Ids)),
		Rand2 = misc:rand(1, length(Pos)),
		ID = lists:nth(Rand1, Ids),
		{X, Y} = lists:nth(Rand2, Pos),
		{ID, 1, X, Y}
	end,
	if
		EventTime =:= 0 andalso Time =:= 0 ->
			refreshObject(Type, lists:map(Fun, lists:seq(1, Num)), MapPid, Members),
			NewJoinInfo = JoinInfo#arenaTeamJoinInfo{refreshtime  = Now},
			L1 = lists:keyreplace(MapPid, #arenaTeamJoinInfo.mappid, getArenaJoinTeamList(), NewJoinInfo),			   
			setArenaJoinTeamList(L1);
		EventTime =:= 0 andalso Time =/= 0 ->
			skip;
		Now >= EventTime + Time ->
			refreshObject(Type, lists:map(Fun, lists:seq(1, Num)), MapPid, Members),
			%%广播消息
			NewJoinInfo = JoinInfo#arenaTeamJoinInfo{refreshtime  = Now},
			L1 = lists:keyreplace(MapPid, #arenaTeamJoinInfo.mappid, getArenaJoinTeamList(), NewJoinInfo),			   
			setArenaJoinTeamList(L1);
		true ->
			skip
	end,
	ok.

refreshObject(?RefreshObject1, L, MapPid, Members) ->
	N = stringCfg:getString(arena_MonsterRefresh),
	Fun = fun(#arenaPlayerInfo{netPid = NetPid}) ->
		core:sendBroadcastNotice(N, NetPid)
	end,
	lists:foreach(Fun, Members),
	psMgr:sendMsg2PS(MapPid, addMonsterToMap, {0, L});
refreshObject(?RefreshObject2, L, MapPid, Members) ->
	N = stringCfg:getString(arena_ObjectRefresh),
	Fun = fun(#arenaPlayerInfo{netPid = NetPid}) ->
		core:sendBroadcastNotice(N, NetPid)
	end,
	lists:foreach(Fun, Members),
	psMgr:sendMsg2PS(MapPid, addCollectToMap, {0, L});
refreshObject(?RefreshObject3, L, MapPid, _) ->
	psMgr:sendMsg2PS(MapPid, addCollectToMap, {0, L}).

-spec destoryMap(MapPid::pid()) -> ok.
destoryMap(MapPid) ->
	L = getArenaJoinTeamList(),
	L1 = lists:keydelete(MapPid, #arenaTeamJoinInfo.mapid, L),
	setArenaJoinTeamList(L1).

%%获取队伍奖励物品
-spec getMemberRewardGood(Res::uint()) -> list().
getMemberRewardGood(?Win) ->
	[Goods, Num] = globalCfg:getArenaWinReward(),
	[Goods1, Num1] = globalCfg:getArenaLoseReward(),
	{[Goods, Num, ?Win], [Goods1, Num1, ?Fail]};
getMemberRewardGood(?Draw) ->
	[Goods, Num] = globalCfg:getArenaLoseReward(),
	{[Goods, Num, ?Fail], [Goods, Num, ?Fail]};
getMemberRewardGood(_) ->
	[Goods, Num] = globalCfg:getArenaWinReward(),
	[Goods1, Num1] = globalCfg:getArenaLoseReward(),
	{[Goods1, Num1, ?Fail], [Goods, Num, ?Win]}.

%%获取队伍奖励分数
-spec getMemberRewardPoint(Val::uint(), Res::uint(), Type::red | blue) -> uint().
getMemberRewardPoint(Val, ?Win, red) ->
	getMemberRewardPoint(Val, ?Win);
getMemberRewardPoint(Val, ?Win, blue) ->
	getMemberRewardPoint(Val, ?Fail);
getMemberRewardPoint(Val, ?Fail, red) ->
	getMemberRewardPoint(Val, ?Fail);
getMemberRewardPoint(Val, ?Fail, blue) ->
	getMemberRewardPoint(Val, ?Win);
getMemberRewardPoint(Val, _, _) ->
	getMemberRewardPoint(Val, ?Fail).

-spec getMemberRewardPoint(Val::uint(), Res::uint()) -> uint().
getMemberRewardPoint(Val, ?Win) ->
	[ArenaVal1, WinVal1, _FailVal1] = globalCfg:getArenaDan1(),
	[ArenaVal2, WinVal2, _FailVal2] = globalCfg:getArenaDan2(),
	[ArenaVal3, WinVal3, _FailVal3] = globalCfg:getArenaDan3(),
	[ArenaVal4, WinVal4, _FailVal4] = globalCfg:getArenaDan4(),
	[ArenaVal5, WinVal5, _FailVal5] = globalCfg:getArenaDan5(),
	[ArenaVal6, WinVal6, _FailVal6] = globalCfg:getArenaDan6(),
	if
		Val >= ArenaVal1 andalso Val < ArenaVal2 ->
			WinVal1;
		Val >= ArenaVal2 andalso Val < ArenaVal3 ->
			WinVal2;
		Val >= ArenaVal3 andalso Val < ArenaVal4 ->
			WinVal3;
		Val >= ArenaVal4 andalso Val < ArenaVal5 ->
			WinVal4;
		Val >= ArenaVal5 andalso Val < ArenaVal6 ->
			WinVal5;
		true ->
			WinVal6
	end;
getMemberRewardPoint(Val, _) ->
	[ArenaVal1, _WinVal1, FailVal1] = globalCfg:getArenaDan1(),
	[ArenaVal2, _WinVal2, FailVal2] = globalCfg:getArenaDan2(),
	[ArenaVal3, _WinVal3, FailVal3] = globalCfg:getArenaDan3(),
	[ArenaVal4, _WinVal4, FailVal4] = globalCfg:getArenaDan4(),
	[ArenaVal5, _WinVal5, FailVal5] = globalCfg:getArenaDan5(),
	[ArenaVal6, _WinVal6, FailVal6] = globalCfg:getArenaDan6(),
	if
		Val >= ArenaVal1 andalso Val < ArenaVal2 ->
			FailVal1;
		Val >= ArenaVal2 andalso Val < ArenaVal3 ->
			FailVal2;
		Val >= ArenaVal3 andalso Val < ArenaVal4 ->
			FailVal3;
		Val >= ArenaVal4 andalso Val < ArenaVal5 ->
			FailVal4;
		Val >= ArenaVal5 andalso Val < ArenaVal6 ->
			FailVal5;
		true ->
			FailVal6
	end.
	
%%获取队伍中队员最大阶段值
-spec getMaxVal(MemberList::list()) -> uint().
getMaxVal(MemberList) ->
	getMaxVal(MemberList, 0).
getMaxVal([], MaxVal) ->
	MaxVal;
getMaxVal([#arenaPlayerInfo{arenaVal = Val} | L], MaxVal) when Val > MaxVal->
	getMaxVal(L, Val);
getMaxVal([_ | L], MaxVal) ->
	getMaxVal(L, MaxVal).

%%获取战斗结果
getBattleRes(Members) ->
	getBattleRes(Members, 0, 0, 0, 0).
getBattleRes([], H1, H2, K1, K2) ->
	if
		K1 > K2 ->
			?Win;
		K1 < K2 ->
			?Fail;
		true ->
			if
				H1 > H2 ->
					?Win;
				H1 < H2 ->
					?Fail;
				true ->
					?Draw
			end
	end;
getBattleRes([#arenaPlayerInfo{camp = Camp, hurt = Hurt, killnum = KillNum} | L], H1, H2, K1, K2) ->
	case Camp of
		?CampRedBattle ->
			getBattleRes(L, H1 + Hurt, H2, K1 + KillNum, K2);
		_ ->
			getBattleRes(L, H1, H2 + Hurt, K1, K2 + KillNum)
	end.

%%获取队伍列表
-spec getMemberList(Camp::uint(), MemberList::list()) -> list().
getMemberList(Camp, MemberList) ->
	getMemberList(Camp, MemberList, []).
getMemberList(_Camp, [], L) ->
	L;
getMemberList(Camp, [#arenaPlayerInfo{camp = Camp} = Player | L], MemberList) ->
	getMemberList(Camp, L, [Player | MemberList]);
getMemberList(Camp, [_ | L], MemberList) ->
	getMemberList(Camp, L, MemberList).

getMemberOnlineList([], L) ->
	L;
getMemberOnlineList([#arenaPlayerInfo{isdead = ?NoDead, ingame = ?InGame} = Info | L], L1) ->
	getMemberOnlineList(L, [Info | L1]);
getMemberOnlineList([_ | L], L1) ->
	getMemberOnlineList(L, L1).

%%获取跨服竞技场配置数据
-spec getAcData() -> #activityCfg{}.
getAcData() ->
	#activityCfg{} = Ac = 
	getCfg:getCfgPStack(cfg_activity, ?CfgID),
	Ac.

%%获取位面销毁时间
-spec getCrosMapDestoryTime(MapID::uint()) -> uint().
getCrosMapDestoryTime(MapID) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{finish_time = Time} ->
			Time * 1000;
		_ ->
			0
	end.

%%检查队友是否输了
-spec checkTeamIsLose(Members::list()) -> boolean().
checkTeamIsLose([]) ->
	true;
checkTeamIsLose([#arenaPlayerInfo{isdead = IsDead, ingame = InGame} | _L]) when IsDead =:= ?NoDead andalso InGame =:= ?InGame ->
	false;
checkTeamIsLose([_ | L]) ->
	checkTeamIsLose(L).

%%清理排行榜
-spec clearRank(Day::uint()) -> ok.
clearRank(Day) when Day =:= ?WeekOne->
	%%保存最高排行榜
	case getFirstRankData() of
		#?Ets_Tab_Arena_Rank{} = Info ->
			Rank = #?Ets_Tab_Arena_Hight_Rank{	
			 roleID = Info#?Ets_Tab_Arena_Rank.roleID,
			 name = Info#?Ets_Tab_Arena_Rank.name,
			 sname = Info#?Ets_Tab_Arena_Rank.sname,
			 dbID = Info#?Ets_Tab_Arena_Rank.dbID,
			 carrer	= Info#?Ets_Tab_Arena_Rank.carrer,
			 force	= Info#?Ets_Tab_Arena_Rank.force,
			 record = Info#?Ets_Tab_Arena_Rank.record,
			 win = Info#?Ets_Tab_Arena_Rank.win,
			 fail = Info#?Ets_Tab_Arena_Rank.fail,
			 time = time:getLocalNowSec1970()
			},
			ets:insert(?Ets_Tab_Arena_Hight_Rank, Rank),
			ets:tab2file(?Ets_Tab_Arena_Hight_Rank, ?Ets_Tab_Arena_Rank_Hight_Txt);
		 _ ->
			skip
	end,
	ets:delete_all_objects(?Ets_Tab_Arena_Rank),
	ets:tab2file(?Ets_Tab_Arena_Rank, ?Ets_Tab_Arena_Rank_Txt),
	ok;
clearRank(_) ->
	ok.

%%send msg

%%参赛人员列表
-spec sendRoleList(NetPid::pid(), Time::uint(), MemberList::list()) -> ok.
sendRoleList(NetPid, Time, MemberList) ->
	Fun = fun(#arenaPlayerInfo{} = Info) ->
		#pk_ArenaRole{
			servername = Info#arenaPlayerInfo.sname,
			name = Info#arenaPlayerInfo.name,
			camp = Info#arenaPlayerInfo.camp,
			id = Info#arenaPlayerInfo.roleID
		}
	end,
	L = lists:map(Fun, MemberList),
	Msg = #pk_GS2U_ArenaRoleList{time = Time, roleList = L},
	playerMsg:sendNetMsg(NetPid, Msg).

%%发送玩家死亡信息
-spec sendRoleDead(RoleID::uint(), MemberList::list()) -> ok.
sendRoleDead(RoleID, MemberList) ->
	Msg = #pk_GS2U_ArenaRoleDead{id = RoleID},
	sendRoleDead(RoleID, Msg, MemberList).

sendRoleDead(_, _, []) ->
	ok;
sendRoleDead(RoleID, Msg, [#arenaPlayerInfo{ingame = ?InGame, netPid = NetPid} | L]) ->
	playerMsg:sendNetMsg(NetPid, Msg),
	sendRoleDead(RoleID, Msg, L);
sendRoleDead(RoleID, Msg, [_ | L]) ->
	sendRoleDead(RoleID, Msg, L).

%%发送结算
-spec sendBattlRes(#arenaTeamJoinInfo{}, RedVal::uint(), BlueVal::uint()) -> ok.
sendBattlRes(#arenaTeamJoinInfo{members = Members, res = Res}, RedVal, BlueVal) ->
	Fun = fun(#arenaPlayerInfo{} = Info) ->
		case Info#arenaPlayerInfo.ingame of
			?InGame ->
				Hurt = Info#arenaPlayerInfo.hurt;
			_ ->
				Hurt = 0
		end,
		case Info#arenaPlayerInfo.camp of
			?CampRedBattle ->
				ArenaVal = RedVal;
			_ ->
				ArenaVal = BlueVal
		end,
		#pk_ArenaBattle{
			id = Info#arenaPlayerInfo.roleID,
			name = Info#arenaPlayerInfo.name,
			servername = Info#arenaPlayerInfo.sname,
			killnum = Info#arenaPlayerInfo.killnum,
			force = Info#arenaPlayerInfo.force ,
			hurt = Hurt,
			camp = Info#arenaPlayerInfo.camp,
			arenaVal = ArenaVal
		}
	end,
	case Res of
		?Win ->
			Camp = ?CampRedBattle;
		?Fail ->
			Camp = ?CampBlueBattle;
		_ ->
			Camp = 0
	end,
	Bl = lists:map(Fun, Members),
	Msg = #pk_GS2U_ArenaBattleList{res = Camp, bList = Bl},
	Fun1 = fun(#arenaPlayerInfo{netPid = NetPid}) ->
		playerMsg:sendNetMsg(NetPid, Msg)
	end,
	lists:foreach(Fun1, Members).
			

dump_rank()->
	case file:read_file_info(?Ets_Tab_Arena_Rank_Txt) of
		{ok,_Info} ->
			%%有缓存文件，强制加载成功，否则报错
			{ok,_} = ets:file2tab(?Ets_Tab_Arena_Rank_Txt),
			?LOG_OUT("ets arena rank[~ts],load cache ok",[?Ets_Tab_Arena_Rank_Txt])
	end,
	RankList = ets:match(	?Ets_Tab_Arena_Rank, '$1'),
	lists:foreach(fun([#arenaBattleRank{name=Name,roleID = RoleId,sname=Servername,record=Record}])->
		?LOG_OUT("~ts,~ts,~w,~w",[Servername,Name,RoleId,Record])
				  end,RankList)
.