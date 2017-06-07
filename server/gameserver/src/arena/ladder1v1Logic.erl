%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 天梯1v1竞技场模块
%%% @end
%%% Created : 29. 五月 2015 11:37
%%%-------------------------------------------------------------------
-module(ladder1v1Logic).
-author("tiancheng").

-include("ladder1v1Private.hrl").
-include("playerLog.hrl").
-include("setupLang.hrl").

%% API
-export([
	createLadder1v1Match/2,
	giveUpChallenge/2,
	createActivityMapAck/1,
	enterLadder1v1Map/2,
	robenterLadder1v1Map/2,
	playerOffline/1,
	playerleaveLadder1v1Map/1,
	ladder1v1_monster_dead/2,
	killedTarget/2,
	ladder1v1_Tick/0,
    deleteRole/1,
    setExploitValue/1,
    worshipTarget/1,
    insertSelfToLadderList/1,
    clearLadderMatchState/1
]).

%% 请求创建一个比赛
%%-spec createLadder1v1Match(PlayerPid::pid(), {CreateRank::uint(), CreateRoleID::uint64(), CreateNetPID::pid(), TargetRank::uint(), TargetRoleID::uint64()}) -> ok.
createLadder1v1Match(PlayerPid, {CreateRank, CreateRoleID, CreateNetPID, TargetRank, TargetRoleID,TargetName}) ->
	ladder1v1State:addWaitAllocBattleMapList(PlayerPid),

	MatchRec = #recladder1v1match{
		createRank = CreateRank,
		createRoleID = CreateRoleID,
		createPlayerPID = PlayerPid,
        createPlayerNetPID = CreateNetPID,
		targetRank = TargetRank,
		targetRoleID = TargetRoleID,
		createTime = time:getSyncTime1970FromDBS()
	},
	addTargetMonsterName(TargetRoleID,TargetName),
	%% 设置比赛时间
	#globalsetupCfg{setpara = [BattleTime]} = getCfg:getCfgPStack(cfg_globalsetup, jjc_time),
	ladder1v1State:setLadder1v1BattleTime(BattleTime),

	%% 这是调试代码，如果有重复的，把错误打印出来
	L = ladder1v1State:getLadderGameMatchList(),
	case lists:keyfind(CreateRoleID, #recladder1v1match.createRoleID, L) of
		#recladder1v1match{} = Rec ->
			?ERROR_OUT("createLadder1v1Match:~p", [Rec]);
		_ ->
			skip
	end,

	%% 覆盖，保存最新的
	NL = lists:keystore(CreateRoleID, #recladder1v1match.createRoleID, L, MatchRec),
	ladder1v1State:setLadderGameMatchList(NL),

	%% 创建比赛地图
	core:sendMsgToMapMgr(?Ladder1v1MapID, createActivityMap, {?Ladder1v1MapID, 1, 0}),
	ok.

%% 创建比赛场景成功
-spec createActivityMapAck(BattleMapPID::[pid(),...]) -> ok.
createActivityMapAck([BattleMapPID]) ->
	case ladder1v1State:getFirstWaitAllocBattleMapList() of
		false ->
			skip;
		PlayerPid ->
			%% 已经创建战斗场景成功的就删除
			ladder1v1State:delWaitAllocBattleMapListFirst(),

			L = ladder1v1State:getLadderGameMatchList(),
			#recladder1v1match{createRank = Rank} = R = lists:keyfind(PlayerPid, #recladder1v1match.createPlayerPID, L),
			NR = R#recladder1v1match{battlemapPID = BattleMapPID},
			NL = lists:keystore(PlayerPid, #recladder1v1match.createPlayerPID, L, NR),
			ladder1v1State:setLadderGameMatchList(NL),

			%% 通知玩家进入战斗场景
			#globalsetupCfg{setpara = [TX, TY]} = getCfg:getCfgPStack(cfg_globalsetup, jjc_attack),
			psMgr:sendMsg2PS(PlayerPid, enterLadder1v1Map, {?Ladder1v1MapID, BattleMapPID, float(TX), float(TY), Rank}),
			ok
	end,
	ok.

%% 挑战者进入战场了
-spec enterLadder1v1Map(PlayerPID::pid(), {RoleID::uint64(), MapPID::pid(), RoleCode::uint()}) -> ok.
enterLadder1v1Map(PlayerPID, {RoleID, MapPID, RoleCode}) ->
	L = ladder1v1State:getLadderGameMatchList(),
	case lists:keyfind(PlayerPID, #recladder1v1match.createPlayerPID, L) of
		#recladder1v1match{createRoleID = RoleID, battlemapPID = MapPID, targetRoleID = TRoleID} = R ->
			case uidMgr:checkUID(?UID_TYPE_Role, TRoleID) of
				true ->
					%% 创建机器人进程
					Pid = playerRob:createRob(TRoleID),
					NL2 = lists:keystore(PlayerPID, #recladder1v1match.createPlayerPID, L,
						R#recladder1v1match{targetPlayerPID = Pid, createPlayerCode = RoleCode}
					),
					ladder1v1State:setLadderGameMatchList(NL2),

					%% 加载目标对象
					#globalsetupCfg{setpara = [MTX, MTY]} = getCfg:getCfgPStack(cfg_globalsetup, jjc_defend),

					LoadRob = #rec_LoadRobData{
						robType = ?RobType_Ladder1v1,
						robRoleID = TRoleID,
						robEnterMap = #rec_RobEnterMap{mapID = ?Ladder1v1MapID, mapPID = MapPID, x = float(MTX), y = float(MTY)},
						param = 0
					},
					playerRob:sendToMeLoadRobRoleData(Pid, LoadRob),
					ok;
				_ ->
					%% 在地图中创建怪物
					#globalsetupCfg{setpara = [MTX, MTY]} = getCfg:getCfgPStack(cfg_globalsetup, jjc_defend),
					psMgr:sendMsg2PS(MapPID, addMonsterToMap, {0, [{TRoleID, 1, MTX, MTY}]}),

					%% 设置开始时间，与阶段
					battlePrepare(MapPID),
					ok
			end,
			ok;
		_ ->
			skip
	end,
	ok.

%% 机器人进入战场了
-spec robenterLadder1v1Map(PlayerPID::pid(), {RobCode::uint64(), RobRoleID::uint64(), MapPID::pid()}) -> ok.
robenterLadder1v1Map(PlayerPID, {RobCode, RobRoleID, MapPID}) ->
	L = ladder1v1State:getLadderGameMatchList(),
	case lists:keyfind(PlayerPID, #recladder1v1match.targetPlayerPID, L) of
		#recladder1v1match{targetRoleID = RobRoleID, battlemapPID = MapPID} = Match ->
			NL = lists:keystore(PlayerPID, #recladder1v1match.targetPlayerPID, L,
				Match#recladder1v1match{targetRoleCode = RobCode}),
			ladder1v1State:setLadderGameMatchList(NL),

			battlePrepare(MapPID),
			ok;
		_ ->
			?ERROR_OUT("robenterLadder1v1Map:robpid=~p,robroleid=~p,mappid=~p", [PlayerPID, RobRoleID, MapPID]),
			skip
	end,
	ok.

battlePrepare(MapPID) ->
	%% 设置开始时间阶段并通知客户端开始倒计时
	L = ladder1v1State:getLadderGameMatchList(),
	#recladder1v1match{createPlayerNetPID = NetPID} = R = lists:keyfind(MapPID, #recladder1v1match.battlemapPID, L),
    NowTime = time:getSyncTime1970FromDBS(),
    NR = R#recladder1v1match{phase = ?Ladder1v1_Phase_Prepare, time = NowTime, prepareTime = ?Battle_Prepare_Time},
	NL = lists:keystore(MapPID, #recladder1v1match.battlemapPID, L, NR),
    ladder1v1State:setLadderGameMatchList(NL),

	%% 两者战斗力相差太大，需要给强者补属性
	case uidMgr:checkUID(?UID_TYPE_Role, R#recladder1v1match.targetRoleID) of
		true ->
			PForce1 = queryRoleForce(R#recladder1v1match.createRoleID),
			PForce2 = queryRoleForce(R#recladder1v1match.targetRoleID),
			Diff = erlang:abs(PForce1 - PForce2),
			#globalsetupCfg{setpara = List} = getCfg:getCfgPStack(cfg_globalsetup, jjc_plus),
			case lists:filter(fun({S, E, _PropList}) -> Diff >= S andalso Diff =< E end, List) of
				[{_,_,PropList}] ->
					%% 匹配上了，通知玩家进程修正属性
					case PForce1 > PForce2 of
						true ->
							psMgr:sendMsg2PS(R#recladder1v1match.createPlayerPID, ladder1v1_addprop, PropList);
						_ ->
							psMgr:sendMsg2PS(R#recladder1v1match.targetPlayerPID, ladder1v1_addprop, PropList)
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,

    %% 客户端开始倒计时
    Msg = #pk_GS2U_PrepareSec{second = ?Battle_Prepare_Time},
    gsSendMsg:sendNetMsg(NetPID, Msg),
	ok.

battlestart(MapPID) ->
	L = ladder1v1State:getLadderGameMatchList(),
	case lists:keyfind(MapPID, #recladder1v1match.battlemapPID, L) of
		#recladder1v1match{
			createRoleID = CreateRoleID,
			createPlayerPID = CreatePID,
			createPlayerNetPID = _NetPID,
			targetRoleID = TargetID,
			targetPlayerPID = TargetPID,
			createPlayerCode = CreatePlayerCode,
			phase = ?Ladder1v1_Phase_Prepare
		} = R ->
			?DEBUG_OUT("battlestart:~p vs ~p", [CreateRoleID, TargetID]),
			NowTime = time:getSyncTime1970FromDBS(),
			NR = R#recladder1v1match{phase = ?Ladder1v1_Phase_Battle, time = NowTime},
			NL = lists:keystore(MapPID, #recladder1v1match.battlemapPID, L, NR),
			ladder1v1State:setLadderGameMatchList(NL),

			%% 通知机器人可以开打
			case erlang:is_pid(TargetPID) of
				true ->
					psMgr:sendMsg2PS(TargetPID, ladder1v1_rob_start_battle, {CreateRoleID, CreatePlayerCode}),
					ok;
				_ -> skip
			end,

			%% 通知玩家，移除定身buff和改变杀戮状态
			BattleTime = ladder1v1State:getLadder1v1BattleTime(),
			Msg = #pk_GS2U_BattleStartSec{second = BattleTime},
			psMgr:sendMsg2PS(CreatePID, ladder1v1_player_start_battle, {TargetID, Msg}),
			ok;
		_ ->
			skip
	end,
	ok.

%% 比赛时间结束，失败
battleEnd(MapPID) ->
	%% 删除进程字典
	battle_end2(MapPID, ?Ladder1v1BattleEnd_Failed).

%% 放弃挑战
-spec giveUpChallenge(PlayerPid::pid(), {CreateRank::uint(), CreateRoleID::uint64()}) -> ok.
giveUpChallenge(PlayerPid, {CreateRank, CreateRoleID}) ->
	L = ladder1v1State:getLadderGameMatchList(),
	case lists:keyfind(PlayerPid, #recladder1v1match.createPlayerPID, L) of
		#recladder1v1match{createRank = CreateRank, createRoleID = CreateRoleID, battlemapPID = MapPID} ->
			%% 失败
			battle_end2(MapPID, ?Ladder1v1BattleEnd_Failed);
		_ ->
			skip
	end,
	ok.

%% 比赛中下线，直接失败
-spec playerOffline(MapPID::pid()) -> ok.
playerOffline(MapPID) ->
	L = ladder1v1State:getLadderGameMatchList(),
	case lists:keyfind(MapPID, #recladder1v1match.battlemapPID, L) of
		#recladder1v1match{} ->
			%% 比赛中下线，直接失败
			battle_end2(MapPID, ?Ladder1v1BattleEnd_Failed);
		_ ->
			skip
	end,
	ok.

%% 角色删除
-spec deleteRole({RoleID::uint64(), MonsterID::uint64()}) -> ok.
deleteRole({RoleID, MonsterID}) ->
    case selectRoleLadder(RoleID) of
        [#rec_ladder_1v1{}|_] = List ->
            ?LOG_OUT("delete role:~p,~p", [RoleID, List]),
            FunStore =
                fun(#rec_ladder_1v1{rankSort = Rank}) ->
                    %% 更新
                    NRec = #rec_ladder_1v1{
                        rankSort = Rank,			%%排名 smallint(6)
                        roleID = MonsterID,			%%角色ID bigint(20) unsigned
                        exploit = 0,				%%总功勋 int(10) unsigned
                        cur_win = 0,				%%当前连胜 smallint(5) unsigned
                        max_win = 0,				%%最大连胜 smallint(5) unsigned
                        win_times = 0,				%%累计胜利 smallint(5) unsigned
                        worship_times = 0			%%被膜拜总次数 smallint(5) unsigned
                    },
                    ets:update_element(ets_rec_ladder_1v1, Rank,
                        [
                            {#rec_ladder_1v1.roleID, MonsterID},
                            {#rec_ladder_1v1.exploit, 0},
                            {#rec_ladder_1v1.cur_win, 0},
                            {#rec_ladder_1v1.max_win, 0},
                            {#rec_ladder_1v1.win_times, 0},
                            {#rec_ladder_1v1.worship_times, 0}
                        ]),

                    psMgr:sendMsg2PS(core:getPublicDataMgrOtp(), saveladder1v1data, {update, NRec}),
                    ok
                end,
            lists:foreach(FunStore, List),
            ok;
        _ ->
            skip
    end,
    ok.

setExploitValue({_RoleID, _V}) ->
%%    case selectRoleLadder(RoleID) of
%%        [#rec_ladder_1v1{rankSort = Rank, exploit = OV} = Rec|_] ->
%%            ?WARN_OUT("setExploitValue:~p,~p", [Rec, V]),
%%            ets:update_element(ets_rec_ladder_1v1, Rank, {#rec_ladder_1v1.exploit, V}),
%%            saveExploitChangeLog(RoleID, OV, V),
%%            psMgr:sendMsg2PS(core:getPublicDataMgrOtp(), saveladder1v1data, {update, [Rec#rec_ladder_1v1{exploit = V}]}),
%%            ok;
%%        _ ->
%%            skip
%%    end,
    ok.

worshipTarget({_SelfRoleID, TargetRoleID, _AddExploit}) ->
%%    case selectRoleLadder(SelfRoleID) of
%%        [#rec_ladder_1v1{rankSort = R1, exploit = Old} = Rec1|_] ->
%%            ets:update_element(ets_rec_ladder_1v1, R1, {#rec_ladder_1v1.exploit, Old + AddExploit}),
%%            saveExploitChangeLog(SelfRoleID, Old, AddExploit),
%%            psMgr:sendMsg2PS(core:getPublicDataMgrOtp(), saveladder1v1data, {update, [Rec1#rec_ladder_1v1{exploit = Old + AddExploit}]}),
%%            ok;
%%        _ ->
%%            skip
%%    end,

    case selectRoleLadder(TargetRoleID) of
        [#rec_ladder_1v1{rankSort = R2, worship_times = OWT} = Rec2|_] ->
            ets:update_element(ets_rec_ladder_1v1, R2, {#rec_ladder_1v1.worship_times, OWT + 1}),
            psMgr:sendMsg2PS(core:getPublicDataMgrOtp(), saveladder1v1data, {update, [Rec2#rec_ladder_1v1{worship_times = OWT + 1}]}),
            ok;
        _ ->
            skip
    end,
    ok.

insertSelfToLadderList(RoleID) ->
    case selectRoleLadder(RoleID) of
        [] ->
            F =
                fun(#rec_ladder_1v1{rankSort = R}, Max) ->
                    case R > Max of
                        true -> R;
                        _ -> Max
                    end
                end,
            New = ets:foldl(F, 0, ets_rec_ladder_1v1) + 1,
            R = #rec_ladder_1v1{rankSort = New, roleID = RoleID},
            ets:insert(ets_rec_ladder_1v1, R),
            psMgr:sendMsg2PS(core:getPublicDataMgrOtp(), saveladder1v1data, {insert, [R]}),
            ok;
        _ ->
            skip
    end,
    ok.

clearLadderMatchState({TargetRoleID, Time}) ->
    Q = ets:fun2ms(
        fun(#recLadderMatchState{} = ST) when ST#recLadderMatchState.roleID =:= TargetRoleID ->
            ST
        end
    ),
    case ets:select(ets_recLadderMatchState, Q) of
        [#recLadderMatchState{}|_] = List ->
            ?ERROR_OUT("query clearLadderMatchState:~p,~p,~p",[TargetRoleID, Time, List]),
            NowTime = time:getSyncTime1970FromDBS(),
            Fun =
                fun(#recLadderMatchState{time = StartTime} = State) ->
                    case NowTime - StartTime >= Time of
                        true ->
                            ?ERROR_OUT("clearLadderMatchState:~p", [State]),
                            ets:delete_object(ets_recLadderMatchState, State);
                        _ ->
                            ?ERROR_OUT("clearLadderMatchState but in time:~p", [State]),
                            skip
                    end
                end,
            lists:foreach(Fun, List),
            ok;
        _ ->
            ?ERROR_OUT("clearLadderMatchState:~p, null", [TargetRoleID]),
            skip
    end,
    ok.

%% 玩家离开比赛地图
-spec playerleaveLadder1v1Map({Rank::uint(), RoleID::uint64(), PlayerPid::pid()}) -> ok.
playerleaveLadder1v1Map({Rank, RoleID, Pid}) ->
	giveUpChallenge(Pid, {Rank, RoleID}).

%% 怪物死亡，挑战者胜利
ladder1v1_monster_dead(PidFrom, MonsterID) ->
	L = ladder1v1State:getLadderGameMatchList(),
	case lists:keyfind(PidFrom, #recladder1v1match.battlemapPID, L) of
		#recladder1v1match{targetRoleID = MonsterID} ->
			battle_end2(PidFrom, ?Ladder1v1BattleEnd_Victory);
		_ ->
			skip
	end,
	ok.

killedTarget(DeadPid, {MapPID, _AttackRoleID, DeadRoleID, DeadRobRoleID} = Data) ->
	RealDead = case DeadRoleID =:= 0 of
				   true -> DeadRobRoleID;
				   _ -> DeadRoleID
	           end,
	L = ladder1v1State:getLadderGameMatchList(),
	case lists:keyfind(MapPID, #recladder1v1match.battlemapPID, L) of
		#recladder1v1match{createPlayerPID = CPID, createRoleID = CID, targetRoleID = TID, targetPlayerPID = TPID} = R ->
			if
				RealDead =:= CID andalso DeadPid =:= CPID ->
					%% 挑战者死亡
					battle_end2(MapPID, ?Ladder1v1BattleEnd_Failed);
				RealDead =:= TID andalso DeadPid =:= TPID ->
					%% 被挑战者死亡
					battle_end2(MapPID, ?Ladder1v1BattleEnd_Victory);
				true ->
					?ERROR_OUT("killedTarget:rec=~p, param=~p, deadpid=~p", [R, Data, DeadPid])
			end;
		_ ->
			skip
	end,
	ok.

%% 比赛结束
battle_end2(MapPID, Result) ->
	L = ladder1v1State:getLadderGameMatchList(),
	#recladder1v1match{
		createRank = CreateRank,
		createRoleID = CreateRoleID,
		createPlayerPID = PlayerPid,
		createPlayerNetPID = _CreateNetPID,
		targetRank = TargetRank,
		targetRoleCode = TargetRoleCode,
		targetRoleID = TargetRoleID,
		targetPlayerPID = TargetRolePID
	} = R = lists:keyfind(MapPID, #recladder1v1match.battlemapPID, L),

	%% 处理比赛结果
	{
		%% 比赛前数据-挑战者
		#rec_ladder_1v1{ cur_win = C1},
		%% 比赛前数据-被挑战者
		#rec_ladder_1v1{  cur_win = C2},
		%% 比赛后数据-挑战者
		#rec_ladder_1v1{rankSort = Rank1, roleID = RID1, cur_win = P1_Cur_Win},
		%% 比赛后数据-被挑战者
		#rec_ladder_1v1{rankSort = Rank2, roleID = RID2, cur_win = P2_Cur_Win}
	} = dealMatchResult(CreateRank, TargetRank, Result),

	?DEBUG_OUT("battle_end3:[~p(~p) VS ~p(~p)-result=~p] -> [~p(~p),~p(~p)]",
		[CreateRoleID,CreateRank,TargetRoleID,TargetRank,Result,RID1,Rank1,RID2,Rank2]),

	%% 内存中记录比赛信息
	NowTime = time:getUTCNowMS(),
	case Result of
		?Ladder1v1BattleEnd_Victory ->
			case (P1_Cur_Win > 0 andalso (P1_Cur_Win rem 5) =:= 0) orelse C2 >= 5 of
				true ->
					%% 跑马灯广播
					sendPMDMsg(CreateRoleID, P1_Cur_Win),

					R1 = #recLadderLS{
						roleID = CreateRoleID, % 胜利者
						isTerminator = (C2 >= 5), % 是否终结目标超神,true是
						ls_times = P1_Cur_Win, % 连胜次数
						targetID = TargetRoleID, % 失败者，目标
						time = NowTime, % 发生时间，毫秒
						targetMonsterName = getTargetMonsterName(TargetRoleID)
					},
                    ets:insert(ets_recLadderLS, R1);
				_ -> skip
			end;
		?Ladder1v1BattleEnd_Failed ->
			case (P2_Cur_Win > 0 andalso (P2_Cur_Win rem 5) =:= 0) orelse C1 >= 5 of
				true ->
					%% 跑马灯广播
					sendPMDMsg(TargetRoleID, P2_Cur_Win),

					R2 = #recLadderLS{
						roleID = TargetRoleID, % 胜利者
						isTerminator = (C1 >= 5), % 是否终结目标超神,true是
						ls_times = P2_Cur_Win, % 连胜次数
						targetID = CreateRoleID, % 失败者，目标
						time = NowTime, % 发生时间，毫秒
						targetMonsterName =  getTargetMonsterName(TargetRoleID)
					},
                    ets:insert(ets_recLadderLS, R2);
				_ -> skip
			end
	end,
	SelfMatchInfo = #recLadderMatchInfo{
		roleID = CreateRoleID, % 自己
		isChallenge = true, % true挑战者,false被挑战者
		isWin = (Result =:= ?Ladder1v1BattleEnd_Victory), % true胜利,false失败
		targetID = TargetRoleID, % 目标
		rank1 = CreateRank, % 挑战前排名
		rank2 = Rank1, % 挑战后排名
		time = NowTime, % 发生时间，毫秒
		targetMonsterName =  getTargetMonsterName(TargetRoleID)
	},
    ets:insert(ets_recLadderMatchInfo, SelfMatchInfo),
	case uidMgr:checkUID(?UID_TYPE_Role, TargetRoleID) of
		true ->
			TargetMatchInfo = #recLadderMatchInfo{
				roleID = TargetRoleID, % 自己
				isChallenge = false, % true挑战者,false被挑战者
				isWin = (Result =:= ?Ladder1v1BattleEnd_Failed), % true胜利,false失败
				targetID = CreateRoleID, % 目标
				rank1 = TargetRank, % 挑战前排名
				rank2 = Rank2, % 挑战后排名
				time = NowTime, % 发生时间，毫秒
				targetMonsterName="" %怪物不可能会攻击玩家此处必须为空
			},
            ets:insert(ets_recLadderMatchInfo, TargetMatchInfo);
		_ -> skip
	end,

	%% 结算结果发给挑战者客户端
	%#globalsetupCfg{setpara = [WinAdd]} = getCfg:getCfgPStack(cfg_globalsetup, jjc_win),
	%#globalsetupCfg{setpara = [LoseAdd]} = getCfg:getCfgPStack(cfg_globalsetup, jjc_lose),
%%	?ERROR_OUT("hahahahha Ladder1v1BattleEnd_Victory ~p", [Result]),
%%	{SelfAddExploit,TargetAddExploit} =
%%		case Result of
%%			?Ladder1v1BattleEnd_Victory ->
%%				{WinAdd,LoseAdd};
%%			?Ladder1v1BattleEnd_Failed ->
%%				{LoseAdd,WinAdd}
%%		end,
	Msg = #pk_GS2U_Ladder1v1BattleEnd{
		result = Result,
		exploit = 0,
		rank = Rank1
	},

%%    case ets:lookup(ets_rec_ladder_1v1, Rank1) of
%%        [#rec_ladder_1v1{exploit = OldExploit, roleID = RID} = RS] ->
%%            ets:update_element(ets_rec_ladder_1v1, Rank1, {#rec_ladder_1v1.exploit, OldExploit + SelfAddExploit}),
%%            saveExploitChangeLog(RID,OldExploit,SelfAddExploit),
%%            psMgr:sendMsg2PS(core:getPublicDataMgrOtp(), saveladder1v1data, {update, RS#rec_ladder_1v1{exploit = OldExploit + SelfAddExploit}}),
%%            ok;
%%        _ ->
%%            skip
%%    end,

	psMgr:sendMsg2PS(PlayerPid, ladder1v1_battle_result, Msg),

	%% 清理进程字典
	ladder1v1State:delLadderGameMatchList(R),

	%% 机器人进程退出
	case erlang:is_pid(TargetRolePID) of
		true ->
			?DEBUG_OUT("rob exit:~p,~p,~p", [TargetRoleCode, TargetRoleID, TargetRolePID]),
			playerRob:sendToMeLRobPlayerExit(TargetRolePID, TargetRoleCode, TargetRoleID);
		_ -> skip
	end,

	%% 从状态表中删除
    ets:delete(ets_recLadderMatchState, Rank1),
    ets:delete(ets_recLadderMatchState, Rank2),
	ok.

%% 处理比赛结果
dealMatchResult(CreateRank, TargetRank, Result) ->
	%% 处理事务
    [#rec_ladder_1v1{exploit = E1, cur_win = C1, max_win = M1, win_times = W1} = P1] = ets:lookup(ets_rec_ladder_1v1, CreateRank),
    [#rec_ladder_1v1{exploit = E2} = P2] = ets:lookup(ets_rec_ladder_1v1, TargetRank),
    {#rec_ladder_1v1{} = NP1,
        #rec_ladder_1v1{} = NP2} =
        case Result of
            ?Ladder1v1BattleEnd_Victory ->
                %#globalsetupCfg{setpara = [LoseAdd]} = getCfg:getCfgPStack(cfg_globalsetup, jjc_lose),
%%                saveExploitChangeLog(P2#rec_ladder_1v1.roleID,E2,LoseAdd),

                P3CurWin = C1 + 1,
                P3MaxWin = erlang:max(P3CurWin, M1),
                P3 = P1#rec_ladder_1v1{exploit = E1, cur_win = P3CurWin, max_win = P3MaxWin, win_times = W1 + 1},
                P4 = P2#rec_ladder_1v1{exploit = E2 + 0},

                case CreateRank > TargetRank of
                    true ->
                        %% 挑战者排名比对方低，且挑战者赢了，交换位置，晋级
                        {P3#rec_ladder_1v1{rankSort = TargetRank}, P4#rec_ladder_1v1{rankSort = CreateRank}};
                    _ ->
                        {P3, P4}
                end;
            ?Ladder1v1BattleEnd_Failed ->
                %#globalsetupCfg{setpara = [WinAdd]} = getCfg:getCfgPStack(cfg_globalsetup, jjc_win),
%%                saveExploitChangeLog(P2#rec_ladder_1v1.roleID,E2,WinAdd),

                P3 = P1#rec_ladder_1v1{exploit = E1, cur_win = 0},
%% 						P4CurWin = C2 + 1,
%% 						P4MaxWin = erlang:max(P4CurWin, M2),
                P4 = P2#rec_ladder_1v1{exploit = E2 + 0},
                {P3, P4}
        end,

    %% 保存NP1,先更新主表
    ets:insert(ets_rec_ladder_1v1, NP1),
    ets:insert(ets_rec_ladder_1v1, NP2),
    psMgr:sendMsg2PS(core:getPublicDataMgrOtp(), saveladder1v1data, {update, [NP1, NP2]}),
    {P1,P2,NP1,NP2}.

%%saveExploitChangeLog(RoleID,OldExploit,AddValue) ->
%%	case uidMgr:checkUID(RoleID) of
%%		true ->
%%			case core:queryRoleKeyInfoByRoleID(RoleID) of
%%				#?RoleKeyRec{
%%					roleID = RoleID, % 角色ID
%%					accountID = AID  % 帐号ID
%%				} ->
%%					PLog = #recLogCoin{
%%						playerID = RoleID,
%%						accountID = AID,
%%						platformName = "ladder1v1",
%%						oldcoin = OldExploit,
%%						newcoin = OldExploit + AddValue,
%%						addOrDec = ?AddCoin,
%%						changecoin = AddValue,
%%						reason = ?CoinSourceLadder,
%%						target = ?PLogTS_PlayerSelf,
%%						source = ?PLogTS_Ladder1v1,
%%						param = 0,
%%						dbID = gsMainLogic:getDBID4GS(),
%%						moneyType = ?CoinTypeExploit
%%					},
%%					dbLog:sendSaveLogCoinChange(?CoinTypeExploit,PLog);
%%				_ ->
%%					?ERROR_OUT("Error find roleID:~p RoleKeyInfo when saveExploitChangeLog:~p",[RoleID,AddValue])
%%			end;
%%		_ ->
%%			skip
%%	end,
%%	ok.

%% 天梯排行榜发奖
-spec ladder1v1_RankReward_Tick(NowTime::uint64()) -> ok.
ladder1v1_RankReward_Tick(NowTime) ->
	LastTime = ladder1v1State:getLadder1v1RankRewardTime(),
	case LastTime =:= 0 of
		false ->
			{{_Year, _Month, _Day}, {Hour, Minute, _Second}} = time:convertSec2DateTime(NowTime),

			DailyRewardHour = getDailyRewardTimeHour(),
			%% 每小时结算
			case Minute =:= 0 andalso NowTime - LastTime > 60 andalso DailyRewardHour =:=  Hour of
                true ->
					ladder1v1State:setLadder1v1RankRewardTime(NowTime),
					FE =
						fun(#rec_ladder_1v1{roleID = RID} = Ladder, AccList) ->
							case uidMgr:checkUID(?UID_TYPE_Role, RID) of
								true ->
									[Ladder | AccList];
								_ ->
									AccList
							end
						end,
					L2 = ets:foldl(FE, [], ets_rec_ladder_1v1),

					%% 7表示星期天，1表示星期一
%%							Week = calendar:day_of_the_week(Year, Month, Day),

					ladder1v1_RankReward(L2, false);
				_ ->
					skip
			end,
			ok;
		true ->
			%% 刚启动服务器，本次CD不发奖
			ladder1v1State:setLadder1v1RankRewardTime(NowTime),
			skip
	end,
	ok.

ladder1v1_RankReward([], _IsSettleWeek) -> ok;
ladder1v1_RankReward([#rec_ladder_1v1{} = R | List], IsSettleWeek) ->
	ladder1v1_RankReward(R, IsSettleWeek),
	ladder1v1_RankReward(List, IsSettleWeek);
ladder1v1_RankReward(#rec_ladder_1v1{rankSort = Rank, roleID = RoleID}, _IsSettleWeek) ->
	case getRankRewardExploit(Rank) of
		{_AddExploit, _ItemID, [CoinType, CoinNumber]} ->
			%% 保存数据
            %% 新结果
%%            NRec = R#rec_ladder_1v1{exploit = OldExploit + AddExploit},
%%            ets:update_element(ets_rec_ladder_1v1, Rank, {#rec_ladder_1v1.exploit, OldExploit + AddExploit}),
%%            psMgr:sendMsg2PS(core:getPublicDataMgrOtp(), saveladder1v1data, {update, NRec}),

			Title = stringCfg:getString(arena_Ladder1v1_WeekReward_Title),
            Content2 = stringCfg:getString(arena_Ladder1v1_WeekReward_Content, [Rank]),
            mail:sendMoneySystemMail(RoleID, Title, Content2, CoinType, CoinNumber, erlang:integer_to_list(Rank)),

%%            %% 判断角色是否在线，如果在线，通知客户端
%%            case core:queryNetPidByRoleID(RoleID) of
%%                NetPid when erlang:is_pid(NetPid) ->
%%                    %% 系统消息
%%                    Content = stringCfg:getString(arena_Ladder1v1_RankReward, [Rank, 0, Win]),
%%                    ChatInfo = playerChat:getSystemChatInfo(Content),
%%                    gsSendMsg:sendNetMsg(NetPid, ChatInfo);
%%                _ ->
%%                    skip
%%            end,
%%
%%            %% 发周结算奖
%%            case IsSettleWeek andalso ItemID > 0 of
%%                true ->
%%                    case playerMail:createMailGoods(ItemID, 1, true, 0, RoleID, ?ItemSourceArenaLadder1v1) of
%%                        [#recMailItem{}|_] = MailItemList ->
%%                            Title = stringCfg:getString(arena_Ladder1v1_WeekReward_Title),
%%                            Content2 = stringCfg:getString(arena_Ladder1v1_WeekReward_Content, [Rank]),
%%                            mail:sendSystemMail(RoleID, Title, Content2, MailItemList, erlang:integer_to_list(Rank));
%%                        _ ->
%%                            ?ERROR_OUT("ladder1v1_RankReward week reward rank=~p,roleid=~p,itemid=~p",[Rank, RoleID, ItemID]),
%%                            false
%%                    end,
%%                    ok;
%%                _ ->
%%                    skip
%%            end,
			ok;
		false ->
			?ERROR_OUT("ladder1v1_RankReward:roleid=~p, rank=~p", [RoleID, Rank])
	end,
	ok.

getRankRewardExploit(Rank) ->
	KeyList = getCfg:getKeyList(cfg_ladder_1v1_reward),
	case lists:filter(fun({S, E}) -> Rank >= S andalso Rank =< E end, KeyList) of
		[{Start, End}] ->
			#ladder_1v1_rewardCfg{normal = Normal, extra = Extra, item = ItemID,everydaycoin = DailyReward} =
					getCfg:getCfgPStack(cfg_ladder_1v1_reward, Start, End),
			{Normal + Extra, ItemID, DailyReward};
		_ ->
			false
	end.

%% 天梯心跳
-spec ladder1v1_Tick() -> ok.
ladder1v1_Tick() ->
	%% 先处理比赛的心跳
	BattleList = ladder1v1State:getLadderGameMatchList(),
	NowTime = time:getSyncTime1970FromDBS(),
	ladder1v1BattlePhase(NowTime, BattleList),

	%% 再给天梯排行榜发奖
	ladder1v1_RankReward_Tick(NowTime),

	%% 然后清理掉过期的比赛
	L = ladder1v1State:getLadderGameMatchList(),
	NL = clearTimeOutMatch(NowTime, L, []),
	ladder1v1State:setLadderGameMatchList(NL),
	ok.

clearTimeOutMatch(_NowTime, [], List) ->
	List;
clearTimeOutMatch(NowTime, #recladder1v1match{createTime = CTime} = Match, List) ->
	case NowTime - CTime >= ?LadderMatchStateProtcetTime of
		true ->
			%% 这条数据已经超时了
			?ERROR_OUT("clearTimeOutMatch nowtime=~p, match=~p", [NowTime, Match]),
			List;
		_ ->
			[Match | List]
	end;
clearTimeOutMatch(NowTime, [#recladder1v1match{} = Match | Right], List) ->
	NList = clearTimeOutMatch(NowTime, Match, List),
	clearTimeOutMatch(NowTime, Right, NList).

%% 遍历比赛
ladder1v1BattlePhase(NowTime,
	#recladder1v1match{
		phase = ?Ladder1v1_Phase_Prepare,
		time = Time,
		prepareTime = PrePareTime,
		createPlayerNetPID = NetPID,
		battlemapPID = MapPID} = Rec) ->
	%% 准备阶段
	case NowTime - Time >= ?Battle_Prepare_Time of
		true ->
			%% 准备时间结束
			battlestart(MapPID);
		_ ->
			case PrePareTime > 0 of
				true ->
					NPrePareTime = PrePareTime - 1,
					L = ladder1v1State:getLadderGameMatchList(),
					NL = lists:keystore(MapPID, #recladder1v1match.battlemapPID, L, Rec#recladder1v1match{prepareTime = NPrePareTime}),
					ladder1v1State:setLadderGameMatchList(NL),

					%% 通知客户端倒计时
					gsSendMsg:sendNetMsg(NetPID, #pk_GS2U_PrepareSec{second = NPrePareTime}),
					ok;
				_ ->
					skip
			end
	end,
	ok;
ladder1v1BattlePhase(NowTime, #recladder1v1match{phase = ?Ladder1v1_Phase_Battle, time = Time, battlemapPID = MapPID}) ->
	%% 比赛阶段
	BattleTime = ladder1v1State:getLadder1v1BattleTime(),
	case NowTime - Time >= BattleTime of
		true ->
			battleEnd(MapPID);
		_ ->
			skip
	end,
	ok;
ladder1v1BattlePhase(NowTime, [#recladder1v1match{} = Match | List]) ->
	ladder1v1BattlePhase(NowTime, Match),
	ladder1v1BattlePhase(NowTime, List);
ladder1v1BattlePhase(_NowTime, []) -> ok;
ladder1v1BattlePhase(_NowTime, #recladder1v1match{}) -> ok.

-spec sendPMDMsg(RoleID::uint64(), CurWin::uint()) -> ok.
sendPMDMsg(RoleID, CurWin) ->
	case ?Cur_Lang of
		?Lang_KOR -> skip;
		_ ->
			sendPMDMsg2(RoleID, CurWin)
	end,
	ok.

sendPMDMsg2(RoleID, 5) ->
	Content = stringCfg:getString(arena_Ladder1v1_5, [queryTargetName(RoleID), 5]),
	sendPMDMsg(Content),
	ok;
sendPMDMsg2(RoleID, 10) ->
	Content = stringCfg:getString(arena_Ladder1v1_10, [queryTargetName(RoleID), 10]),
	sendPMDMsg(Content),
	ok;
sendPMDMsg2(RoleID, CurWin) when CurWin > 10 ->
	case (CurWin rem 5) =:= 0 of
		true ->
			Content = stringCfg:getString(arena_Ladder1v1_11, [queryTargetName(RoleID), CurWin]),
			sendPMDMsg(Content);
		_ ->
			skip
	end,
	ok;
sendPMDMsg2(_RoleID, _CurWin) ->
	ok.

queryTargetName(RoleID) ->
	case uidMgr:checkUID(?UID_TYPE_Role, RoleID) of
		true ->
			case core:queryRoleKeyInfoByRoleID(RoleID) of
				#?RoleKeyRec{roleName = N1} -> N1;
				_ -> ""
			end;
		_ ->
			case getCfg:getCfgPStack(cfg_monster, RoleID) of
				#monsterCfg{showName = N2} -> N2;
				_ -> ""
			end
	end.

sendPMDMsg(Content) ->
	%% 跑马灯
	NoticeInfo = #pk_NoticeInfo{
		id = 9999999999,
		type = 0,
		pos = 0, %%走马灯
		content = Content,
		color = 16#FFFFFF,
		afterSecondStart = 0,
		duration = 120,
		interval = 30
	},
	PMDMsg = #pk_GS2U_NoticeAdd{notice =[NoticeInfo]},
	playerMgrOtp:sendMsgToAllPlayer([PMDMsg]),
	ok.

queryRoleForce(RoleID) ->
	?DEBUG_OUT("RoleID======xxxxxx========~p~n",[RoleID]),
	?DEBUG_OUT("RoleID======xxxxxx===111=====~p~n",[core:queryRoleKeyInfoByRoleID(RoleID)]),
	case core:queryRoleKeyInfoByRoleID(RoleID) of
		#?RoleKeyRec{playerForce = PF, petForce = PetF} -> PF + PetF;
		_ -> 0
	end.

selectRoleLadder(RoleID) ->
    Q = ets:fun2ms(
        fun(#rec_ladder_1v1{} = Ladder) when Ladder#rec_ladder_1v1.roleID =:= RoleID ->
            Ladder
        end
    ),
    ets:select(ets_rec_ladder_1v1, Q).
%%获取挑战目标怪物名字，如果目标是玩家则获取空名字，玩家的名字不能写死。需要动态的获取。玩家存在改名的可能性
getTargetMonsterName(MonsterID)->
	case get({<<"monster_name">>,MonsterID}) of
		undefined ->
			"";
		MonsterName ->
			MonsterName
	end.
%%增加挑战怪物名字，如果是玩家则忽略
addTargetMonsterName(MonsterID,MonsterName)->
	case uidMgr:checkUID(?UID_TYPE_Role, MonsterID) of
		true -> skip;
		_ ->
			put({<<"monster_name">>,MonsterID},MonsterName)
	end.

getDailyRewardTimeHour() ->
	case getCfg:getCfgByArgs(cfg_globalsetup, jjc_1v1_rewardtime) of
		#globalsetupCfg{setpara = [V]} -> V;
		_ -> 21
	end.