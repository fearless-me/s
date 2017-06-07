%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 四月 2015 15:08
%%%-------------------------------------------------------------------
-module(acGuildBattleLogic).
-author("tiancheng").

-include("acGuildBattlePrivate.hrl").

%% API
-export([
	activityChangeCallBack/1,
	activityMapMsg/2
]).

-export([
    guildBattleGroup/0,
    createActivityMapAck/1,
    enterGuildBattle/1,
    playerleaveGuild/1,
    playerEnterMapReal/1,
    guildBattleHeart/0,
    gatherSuccess/1,
	requestGuildBattleResult/1,
	resetEscortMapTick/0
]).

%% 主活动模块进程回调
-spec activityChangeCallBack(Phase::uint()) -> ok.
activityChangeCallBack(Phase) ->
    ?LOG_OUT("~p activityChangeCallBack:~p", [?MODULE, Phase]),
    activityChangeCallBack2(Phase),
	ok.

activityChangeCallBack2(?ActivityPhase_Close) ->
    %% 整个活动结束
    Content = stringCfg:getString(guildBattle_BattleEnd),
    activityCommon:sendBroadcastNotice(Content),

    %% 所有队伍全部结束
    L = acGuildBattleState:getGuildPairs(),
    F =
        fun(#battleGuildPair{guildID1 = GID1, guildID2 = GID2}) ->
            guildEnd(GID1, GID2)
        end,
    lists:foreach(F, L),

	%% 延时一分钟踢人
	erlang:send_after(60000, self(), resetEscortMapTick),
    ok;
activityChangeCallBack2(?ActivityPhase_GuildBattle_1) ->
    cleanOldBattleList(),

    %% 清理战斗表
    ets:delete_all_objects(rec_guildBattle),

    %% 配对数据
    acGuildBattleState:delGuildPairs(),

	%% 公告报名阶段
	Content = stringCfg:getString(guildBattle_ApplyStart),
	activityCommon:sendBroadcastNotice(Content),

	%% 间隔一小时广播一次
	{{_Year, _Month, _Day}, {_Hour, Minute, Second}} = time2:getLocalDateTime(),
	Sec = 3600 - Minute * 60 - Second,
    %% 广播提示
    erlang:send_after(Sec * 1000, self(), guildBattle_ApplyStart),
	ok;
activityChangeCallBack2(?ActivityPhase_GuildBattle_2) ->
    %% 分组心跳
    erlang:send_after(3000, self(), guildBattleGroup),
	ok;
activityChangeCallBack2(?ActivityPhase_GuildBattle_3) ->
    %% 公告开始
    Content = stringCfg:getString(guildBattle_BattleStart),
    activityCommon:sendBroadcastNotice(Content),

    %% 没有对手的帮会，直接结束
    List = ets:tab2list(rec_guildBattle),
    F =
        fun(#rec_guildBattle{guildID = GuildID, targetGuildID = TGuildID} = Guild) ->
            case TGuildID =:= 0 of
                true ->
                    ets:update_element(rec_guildBattle, GuildID, {#rec_guildBattle.isStart, true}),
                    guildEnd(Guild#rec_guildBattle{isStart = true}, 0),
                    ok;
                _ ->
                    skip
            end
        end,
    lists:foreach(F, List),

    %% 全部设置为开始
    Size = ets:info(rec_guildBattle, size),
    case Size >= 2 of
        true ->
            Len = Size div 2,
            #activityCfg{mapidlist = [MapID]} = getCfg:getCfgPStack(cfg_activity, ?ActivityType_GuildBattle),

            %% 创建活动地图
            core:sendMsgToMapMgr(MapID, createActivityMap, {MapID, Len, 0}),
            ok;
        _ ->
            skip
    end,
	ok;
activityChangeCallBack2(Phase) ->
	?ERROR_OUT("~p ~p activityChangeCallBack2:~p", [?MODULE, self(), Phase]),
	ok.

%% 活动地图的消息
-spec activityMapMsg(MsgType::uint(), Data::term()) -> ok.
activityMapMsg(MsgType, Data) ->
	activityMapMsg2(MsgType, Data),
	ok.
activityMapMsg2(?ACMapMsg_CreateMap, {_CreateRoleID,_MapID,MapPid, PlayerEts, MonsterEts, CollectEts, NpcEts} = Data) ->
	?LOG_OUT("~p ACMapMsg_CreateMap:~p", [?MODULE, Data]),
    acGuildBattleState:addMapPIDEts({MapPid, PlayerEts, MonsterEts, CollectEts, NpcEts}),
	ok;
activityMapMsg2(?ACMapMsg_DestoryMap, MapPID) ->
	?LOG_OUT("~p ACMapMsg_DestoryMap:~p", [?MODULE, MapPID]),
	%% 地图遭销毁了
    acGuildBattleState:delMapPIDEts(MapPID),
	ok;
activityMapMsg2(?ACMapMsg_HurtMonster, {_MapID, MapPID, _AttackRoleID, MonsterCode, MonsterID, _Damage}) ->
    case lists:member(MonsterID, acGuildBattleState:getLCMonsterID()) of
        true ->
            %% 攻打粮仓
            case acGuildBattleState:getGuildPairsByMapPID(MapPID) of
                #battleGuildPair{
                    guildID1 = GID1, lc1MonsterCode = LC1Code, guild1LCBeAttackTimes = Times1, lastNoticeTime1 = NT1,
                    guildID2 = GID2, lc2MonsterCode = LC2Code, guild2LCBeAttackTimes = Times2, lastNoticeTime2 = NT2} = Pair ->
                    NewPair =
                        if
                            LC1Code =:= MonsterCode ->
                                NNT1 = noticeLCBeAttack(MapPID, GID1, NT1),
                                Pair#battleGuildPair{guild1LCBeAttackTimes = Times1 + 1, lastNoticeTime1 = NNT1};
                            LC2Code =:= MonsterCode ->
                                NNT2 = noticeLCBeAttack(MapPID, GID2, NT2),
                                Pair#battleGuildPair{guild2LCBeAttackTimes = Times2 + 1, lastNoticeTime2 = NNT2};
                            true ->
                                %% 需要重新确定粮仓目标
                                MonsterEts = acGuildBattleState:getMapMonsterEts(MapPID),
                                case ets:lookup(MonsterEts, MonsterCode) of
                                    [#recMapObject{guild = GuildID}] ->
                                        if
                                            GID1 =:= GuildID ->
                                                NNT1 = noticeLCBeAttack(MapPID, GID1, NT1),
                                                Pair#battleGuildPair{
                                                    lc1MonsterCode = MonsterCode,
                                                    guild1LCBeAttackTimes = Times1 + 1,
                                                    lastNoticeTime1 = NNT1};
                                            GID2 =:= GuildID ->
                                                NNT2 = noticeLCBeAttack(MapPID, GID2, NT2),
                                                Pair#battleGuildPair{
                                                    lc2MonsterCode = MonsterCode,
                                                    guild2LCBeAttackTimes = Times1 + 1,
                                                    lastNoticeTime2 = NNT2};
                                            true -> Pair
                                        end;
                                    _ -> Pair
                                end
                        end,
                    %% 增加积分
                    {AttackLCTimes,AddPoint} = acGuildBattleState:getAttackLCInfo(),
                    {NewPair1, TargetGuildID1, Point1} =
                        case NewPair#battleGuildPair.guild1LCBeAttackTimes >= AttackLCTimes of
                            true -> {NewPair#battleGuildPair{guild1LCBeAttackTimes = 0}, NewPair#battleGuildPair.guildID2, AddPoint};
                            _ -> {NewPair, 0, 0}
                        end,
                    addPoint(TargetGuildID1, Point1),
                    {NewPair2, TargetGuildID2, Point2} =
                        case NewPair1#battleGuildPair.guild2LCBeAttackTimes >= AttackLCTimes of
                            true -> {NewPair1#battleGuildPair{guild2LCBeAttackTimes = 0}, NewPair1#battleGuildPair.guildID1, AddPoint};
                            _ -> {NewPair1, 0, 0}
                        end,
                    addPoint(TargetGuildID2, Point2),
                    %% 保存
                    acGuildBattleState:addGuildPairs(NewPair2),
                    ok;
                _ ->
                    skip
            end;
        _ ->
            skip
    end,
    ok;
activityMapMsg2(?ACMapMsg_KillPlayer, {_MapID, MapPID, AttackRoleID, _DeadRoleCode, _DeadRoleID}) ->
    %% 击杀玩家
    case acGuildBattleState:getGuildPairsByMapPID(MapPID) of
        #battleGuildPair{} = Pair ->
            KillPlayerAddPoint = acGuildBattleState:getKillAddPoint(),
            {NewPair, GuildID, AddPoint} = addPlayerPoint(Pair, AttackRoleID, KillPlayerAddPoint),
            addPoint(GuildID, AddPoint),
            %% 保存
            acGuildBattleState:addGuildPairs(NewPair),
            ok;
        _ ->
            skip
    end,
    ok;
activityMapMsg2(_MsgType, _Data) ->
	ok.

resetEscortMapTick() ->
	L = acGuildBattleState:getGuildPairs(),
	F =
		fun(#battleGuildPair{mapPID = MapPID}) ->
			psMgr:sendMsg2PS(MapPID, resetCopyMap, {})
		end,
	lists:foreach(F, L),
	ok.

guildBattleHeart() ->
    case acGuildBattleState:isBattleIng() of
        true ->
            acGuildBattleState:setGuildBattleTimerRef(erlang:send_after(1000, self(), guildBattleHeart)),
            guildBattleHeart2();
        _ ->
            skip
    end.
guildBattleHeart2() ->
    %%　关键心跳
    NowTime = time:getUTCNowSec(),
    Rangime = acGuildBattleState:getRangeTime(),
    L = acGuildBattleState:getGuildPairs(),
    [{_G1,P1}, {_G2,P2}, {_G3,P3}] = acGuildBattleState:getCollectIDs(),
    F =
        fun(#battleGuildPair{} = Pair) ->
            case Pair#battleGuildPair.isEnd of
                false ->
                    Pair1 =
                        case NowTime - Pair#battleGuildPair.collect1LastRewardTime >= Rangime of
                            true ->
                                addPoint(Pair#battleGuildPair.collect1GuildID, P1),
                                Pair#battleGuildPair{collect1LastRewardTime = NowTime};
                            _ ->
                                Pair
                        end,
                    Pair2 =
                        case NowTime - Pair1#battleGuildPair.collect2LastRewardTime >= Rangime of
                            true ->
                                addPoint(Pair1#battleGuildPair.collect2GuildID, P2),
                                Pair1#battleGuildPair{collect2LastRewardTime = NowTime};
                            _ ->
                                Pair1
                        end,
                    Pair3 =
                        case NowTime - Pair2#battleGuildPair.collect3LastRewardTime >= Rangime of
                            true ->
                                addPoint(Pair2#battleGuildPair.collect3GuildID, P3),
                                Pair2#battleGuildPair{collect3LastRewardTime = NowTime};
                            _ ->
                                Pair2
                        end,
                    case Pair3#battleGuildPair.isEnd of
                        false ->
                            %% 刷新采集物
                            Pair4 = freshCollect(NowTime, Pair3),
                            acGuildBattleState:addGuildPairs(Pair4);
                        _ ->
                            skip
                    end;
                _ ->
                    skip
            end
        end,
    lists:foreach(F, L),
    ok.

requestGuildBattleResult({GuildID, RoleID, NetPid}) ->
	case acGuildBattleState:getGuildPairsByGuildID(GuildID) of
		#battleGuildPair{guildID1 = GID1, guildID2 = GID2} ->
			OtherGuildID =
				case GuildID of
					GID1 -> GID2;
					_ -> GID1
				end,
			[Guild1] = ets:lookup(rec_guildBattle, GuildID),
			[Guild2] = ets:lookup(rec_guildBattle, OtherGuildID),
			sendBattleResultToClient(Guild1, Guild2, GuildID, ?GuildBattleIng, {RoleID, NetPid}),
			ok;
		_ ->
			skip
	end,
	ok.

%% 结束(目标可能轮空)
guildEnd(#rec_guildBattle{guildID = GuildID, targetGuildID = 0, isReward = false} = Guild1, _) ->
    %% 对方轮空
    ets:update_element(rec_guildBattle, GuildID,
        [
            {#rec_guildBattle.isEnd, true},
            {#rec_guildBattle.isReward, true},
            {#rec_guildBattle.winGuildID, GuildID}
        ]),

    #globalsetupCfg{setpara = [
        {_Wguildres,_Wguildliv,_Wplayerexp,_Wplayerbandgold,_Wplayerguildcontribute} = Win,
        %{Lguildres,Lguildliv,Lplayerexp,Lplayerbandgold,Lplayerguildcontribute} = Lose
        _Lose
    ]} = getCfg:getCfgPStack(cfg_globalsetup, guildbattleReward),

    %% 发奖
    sendReward(Guild1, Win),
    ok;
guildEnd(
    #rec_guildBattle{mapPID = MapPID, guildID = GuildID, targetGuildID = TGuildID, isReward = false} = Guild1,
    #rec_guildBattle{mapPID = MapPID, guildID = TGuildID, targetGuildID = GuildID, isReward = false} = Guild2) ->

    %% 得到一个胜利军团ID
	{WinGuildID, LoseGuildID} =
        case Guild1#rec_guildBattle.allpoint > Guild2#rec_guildBattle.allpoint of
            true -> {GuildID, TGuildID};
            _ ->
                case misc:rand(1, 100) >= 50 of
                    true -> {GuildID, TGuildID};
                    _ -> {TGuildID, GuildID}
                end
        end,

    %% 有目标的战斗
    ets:update_element(rec_guildBattle, GuildID,
        [
            {#rec_guildBattle.isEnd, true},
            {#rec_guildBattle.isReward, true},
            {#rec_guildBattle.winGuildID, WinGuildID}
        ]),
    ets:update_element(rec_guildBattle, TGuildID,
        [
            {#rec_guildBattle.isEnd, true},
            {#rec_guildBattle.isReward, true},
            {#rec_guildBattle.winGuildID, WinGuildID}
        ]),

    %% 奖励
    #globalsetupCfg{setpara = [
        {_Wguildres,_Wguildliv,_Wplayerexp,_Wplayerbandgold,_Wplayerguildcontribute} = Win,
        {_Lguildres,_Lguildliv,_Lplayerexp,_Lplayerbandgold,_Lplayerguildcontribute} = Lose
    ]} = getCfg:getCfgPStack(cfg_globalsetup, guildbattleReward),

    %% 比赛结果
    sendBattleResultToClient(Guild1, Guild2, WinGuildID, ?GuildBattleEnd, undefined),

    PlayerEts = acGuildBattleState:getMapPlayerEts(MapPID),
    %% 发奖
    case WinGuildID =:= GuildID of
        true ->
            sendReward(Guild1, Win),
            sendReward(Guild2, Lose);
        _ ->
            sendReward(Guild1, Lose),
            sendReward(Guild2, Win)
    end,

    %% 跑马灯提示
    GuildName = guildLogic:getGuildName(WinGuildID),
    LoseGuildName = guildLogic:getGuildName(LoseGuildID),
    WinNotice = stringCfg:getString(guildBattle_WinNotice, [GuildName, LoseGuildName]),
    F =
        fun(#recMapObject{netPid = NetPid}, _) ->
            core:sendBroadcastNotice(WinNotice, NetPid)
        end,
    ets:foldl(F, 0, PlayerEts),
    ok;
guildEnd(GuildID1, GuildID2) when erlang:is_integer(GuildID1) andalso erlang:is_integer(GuildID2) ->
    case ets:lookup(rec_guildBattle, GuildID1) of
        [#rec_guildBattle{} = G1] ->
            case ets:lookup(rec_guildBattle, GuildID2) of
                [#rec_guildBattle{} = G2] ->
                    guildEnd(G1, G2);
                _ ->
                    ?ERROR_OUT("guildEnd2:[~p,~p]", [GuildID1, GuildID2])
            end;
        _ ->
            ?ERROR_OUT("guildEnd1:[~p,~p]", [GuildID1, GuildID2])
    end,
    ok;
guildEnd(Guild1, Guild2) ->
    ?LOG_OUT("guildEnd:~p,~p", [Guild1, Guild2]),
    ok.

%% 发奖
sendReward(#rec_guildBattle{guildID = GuildID, mapPID = PID} = Battle, {Wguildres,Wguildliv,Wplayerexp,Wplayerbandgold,Wplayerguildcontribute} = Reward) ->
	PlayerList =
		case acGuildBattleState:getGuildPairsByGuildID(GuildID) of
			#battleGuildPair{guildID1 = GuildID, players1 = PL1} ->
				PL1;
			#battleGuildPair{guildID2 = GuildID, players2 = PL2} ->
				PL2;
			_ ->
				?ERROR_OUT("sendReward:~p,~p", [Battle, Reward]),
				[]
		end,

	%% 给军团发奖
	psMgr:sendMsg2PS(?PsNameGuild, addguildresource, {GuildID, Wguildres}),
	psMgr:sendMsg2PS(?PsNameGuild, addguildliveness, {GuildID, Wguildliv}),

	Ets = acGuildBattleState:getMapPlayerEts(PID),

	%% 给个人发奖
	F =
		fun(#recMapObject{id = RID, pid = PPid}, _) ->
			case lists:keyfind(RID, #enterGuildBattlePlayer.roleID, PlayerList) of
				#enterGuildBattlePlayer{guildID = GuildID} ->
					psMgr:sendMsg2PS(PPid, guildBattleEndPlayerReward, {Wplayerexp,Wplayerbandgold,Wplayerguildcontribute});
				Error ->
					?ERROR_OUT("guildID = ~p, roleID=~p, Error=~p,skip", [GuildID, RID, Error]),
					skip
			end
		end,
	ets:foldl(F, 0, Ets),
	ok.

addPoint(0, _Point) ->
    ok;
addPoint(_GuildID, 0) ->
    ok;
addPoint(GuildID, Point) ->
    case ets:lookup(rec_guildBattle, GuildID) of
        [#rec_guildBattle{targetGuildID = 0}] ->
            ok;
        [#rec_guildBattle{isEnd = true}] ->
            ok;
        [#rec_guildBattle{targetGuildID = TGuildID, allpoint = AP}] ->
            MaxPoint = acGuildBattleState:getMaxPoint(),
            NewAP = erlang:min(MaxPoint, AP + Point),
            ets:update_element(rec_guildBattle, GuildID, {#rec_guildBattle.allpoint, NewAP}),
            case NewAP < MaxPoint of
                true ->
                    %% 未结束
                    ok;
                _ ->
                    %% 结束
                    guildEnd(GuildID, TGuildID),
                    ok
            end;
        Error ->
            ?ERROR_OUT("addPoint failed:~p,~p,~p", [GuildID, Point, Error]),
            skip
    end,
    ok.

gatherSuccess({GuildID, RoleID, NetPid, GatherID, Point} = Data) ->
    case acGuildBattleState:getGuildPairsByGuildID(GuildID) of
        #battleGuildPair{mapPID = MapPID, collect1GuildID = CID1, collect2GuildID = CID2, collect3GuildID = CID3} = Pair ->
            L = [{G1,_P1}, {G2,_P2}, {G3,_P3}] = acGuildBattleState:getCollectIDs(),
            case lists:keyfind(GatherID, 1, L) of
                false ->
                    %% 普通采集物
                    case addPlayerPoint(Pair, RoleID, Point) of
                        {NewPair, GuildID, Point} ->
                            addPoint(GuildID, Point),
                            acGuildBattleState:addGuildPairs(NewPair);
                        _ ->
                            %% 数据有问题
							?ERROR_OUT("gatherSuccess:~p,~p", [Data, Pair]),
                            skip
                    end;
                _ ->
                    NowTime = time:getUTCNowSec(),
                    %% 旗帜点改变
                    NewPair2 =
                        if
                            G1 =:= GatherID andalso GuildID /= CID1 ->
                                noticeBannerChange(MapPID, CID1, GuildID, RoleID, GatherID),
                                Pair#battleGuildPair{collect1GuildID = GuildID, collect1LastRewardTime = NowTime};
                            G2 =:= GatherID andalso GuildID /= CID2 ->
                                noticeBannerChange(MapPID, CID2, GuildID, RoleID, GatherID),
                                Pair#battleGuildPair{collect2GuildID = GuildID, collect2LastRewardTime = NowTime};
                            G3 =:= GatherID andalso GuildID /= CID3 ->
                                noticeBannerChange(MapPID, CID3, GuildID, RoleID, GatherID),
                                Pair#battleGuildPair{collect3GuildID = GuildID, collect3LastRewardTime = NowTime};
                            true ->
								playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_GuildBattle_AlreadyZhanLing),
                                Pair
                        end,
                    case NewPair2 /= Pair of
                        true ->
                            %% 广播旗帜拥有者
                            brodcastBannerChange(NewPair2),
                            acGuildBattleState:addGuildPairs(NewPair2);
                        _ ->
                            skip
                    end
            end;
        _ ->
            skip
    end,
    ok.

playerEnterMapReal({GuildID, RoleID, NetPID}) ->
    case ets:lookup(rec_guildBattle, GuildID) of
        [#rec_guildBattle{waitEnterPlayerIDs = Waits, targetGuildID = TGuildID} = Battle] ->
            case lists:member(RoleID, Waits) of
                true ->
                    ets:update_element(rec_guildBattle, GuildID,
                        {#rec_guildBattle.waitEnterPlayerIDs, lists:delete(RoleID, Waits)}),

                    %% 广播旗帜拥有者
                    Pair = acGuildBattleState:getGuildPairsByGuildID(GuildID),
                    Msg = getOccupyOwnerChangeMsg(Pair),
                    gsSendMsg:sendNetMsg(NetPID, Msg#pk_GS2U_OccupyOwnerChange{ownerID = GuildID, targetID = TGuildID}),
                    ok;
                _ ->
                    ?ERROR_OUT("playerEnterMapReal no in:~p,~p,~p", [GuildID,RoleID,Battle])
            end;
        _ ->
            ?ERROR_OUT("playerEnterMapReal:~p,~p", [GuildID,RoleID])
    end,
    ok.

%% 玩家离开军团
playerleaveGuild({GuildID, RoleID}) ->
    %% 只把玩家删除，玩家贡献的总积分不减少
    acGuildBattleState:delGuildPairsPlayer(GuildID, RoleID),
    ok.

enterGuildBattle({GuildID, RoleID, Name, NetPid}) ->
    case ets:lookup(rec_guildBattle, GuildID) of
        [#rec_guildBattle{isStart = true, isEnd = false, mapPID = MapPID, mapID = MapID, revivepos = Pos, waitEnterPlayerIDs = Waits}] ->
            case lists:member(RoleID, Waits) of
                true ->
                    %% 直接允许进入
                    {MapID, MapPID, Pos};
                _ ->
                    #mapsettingCfg{maxnum = MaxNum} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
                    List = getMapPlayerList(GuildID, MapPID),
                    case (erlang:length(List) + erlang:length(Waits)) < (MaxNum div 2) of
                        true ->
                            R = #enterGuildBattlePlayer{
                                roleID = RoleID,
                                guildID = GuildID,
                                roleName = Name,
                                netPid = NetPid
                            },
                            acGuildBattleState:addGuildPairsPlayer(R),

                            ets:update_element(rec_guildBattle, GuildID, {#rec_guildBattle.waitEnterPlayerIDs, [RoleID | Waits]}),

                            %% 允许进入
                            {MapID, MapPID, Pos};
                        _ ->
                            ?ErrorCode_GuildBattle_EnterBattleMore
                    end
            end;
        _ ->
            ?ErrorCode_GuildBattle_NowCanotEnterBattle
    end.

getMapPlayerList(GuildID, _MapPID) ->
    %PlayerEts = acGuildBattleState:getMapPlayerEts(MapPID),
    MS = ets:fun2ms(fun(#recMapObject{} = Obj) when Obj#recMapObject.guild =:= GuildID -> Obj end),
    ets:select(rec_guildBattle, MS).

%queryGuildID(RoleID) ->
%    case ets:lookup(rec_guild_member, RoleID) of
%        [#rec_guild_member{guildID = GuildID}] -> GuildID;
%        _ -> 0
%    end.

createActivityMapAck({MapID, MapPIDList, _} = Data) ->
    PairList = acGuildBattleState:getGuildPairs(),
    case erlang:length(MapPIDList) =:= erlang:length(PairList) of
        true ->
            F =
                fun(MapPID, Pairs) ->
                    [Pair = #battleGuildPair{guildID1 = GID1, guildID2 = GID2}|RightL] = Pairs,

                    acGuildBattleState:addGuildPairs(Pair#battleGuildPair{mapPID = MapPID}),

                    initMonster(MapPID, Pair),

                    ets:update_element(rec_guildBattle, GID1,
                        [
                            {#rec_guildBattle.mapID, MapID},
                            {#rec_guildBattle.mapPID, MapPID},
                            {#rec_guildBattle.isStart, true},
                            {#rec_guildBattle.isEnd, false}
                        ]),
                    ets:update_element(rec_guildBattle, GID2,
                        [
                            {#rec_guildBattle.mapID, MapID},
                            {#rec_guildBattle.mapPID, MapPID},
                            {#rec_guildBattle.isStart, true},
                            {#rec_guildBattle.isEnd, false}
                        ]),
                    RightL
                end,
            [] = lists:foldl(F, PairList, MapPIDList),

            acGuildBattleState:setGuildBattleTimerRef(erlang:send_after(1000, self(), guildBattleHeart)),
            ok;
        _ ->
            ?ERROR_OUT("create map ack:~p,~p,~p", [Data, PairList, ets:tab2list(rec_guildBattle)])
    end,
    ok.

%% 刷新采集物
freshCollect(NowTime, #battleGuildPair{mapPID = MapPID, normalCollectLastFreshTime = LastTime} = Pair) ->
    case NowTime - LastTime >= acGuildBattleState:getRangeTime() of
        true ->
            {IDList, PosList} = activityCommon:getMonsterOrCollectList(?ConfChaos_GuildBattle, ?HDBattle_Type_Collect),
            case activityCommon:getAllocList(IDList, PosList) of
                [] ->
                    skip;
                CollectList ->
                    psMgr:sendMsg2PS(MapPID, addCollectToMap, {0, CollectList})
            end,
            Pair#battleGuildPair{normalCollectLastFreshTime = NowTime};
        _ ->
            Pair
    end.

%% 初始化BOSS怪
initMonster(MapPID, #battleGuildPair{guildID1 = GuildID1, guildID2 = GuildID2}) ->
    case getCfg:getCfgByKey(cfg_globalsetup, guildbattleDefendBoss) of
        #globalsetupCfg{setpara = [{BossID1, X11, Y11}, {LCID1, X12, Y12}, {BossID2, X21, Y21}, {LCID2, X22, Y22}]} ->
            psMgr:sendMsg2PS(MapPID, addMonsterToMap_GuildMonster, {0, 0, GuildID1, [{BossID1, 1, X11, Y11},{LCID1, 1, X12, Y12}]}),
            psMgr:sendMsg2PS(MapPID, addMonsterToMap_GuildMonster, {0, 0, GuildID2, [{BossID2, 1, X21, Y21},{LCID2, 1, X22, Y22}]}),
            acGuildBattleState:setLCMonsterID([LCID1, LCID2]),
            ok;
        _ ->
            ?ERROR_OUT("not find globalsetup guildbattleDefendBoss config"),
            acGuildBattleState:setLCMonsterID([]),
            skip
    end,
    ok.

guildBattleGroup() ->
    List = ets:tab2list(rec_guild_battle_paid),
    F =
        fun(#rec_guild_battle_paid{guildID = GuildID}, AccL) ->
            case ets:lookup(rec_guild, GuildID) of
                [#rec_guild{} = Guild] ->
                    [Guild | AccL];
                _ ->
                    ?ERROR_OUT("guildbattle guild delete:~p", [GuildID]),
                    AccL
            end
        end,
    List2 = lists:foldl(F, [], List),

    FSort =
        fun(#rec_guild{fightForce = F1}, #rec_guild{fightForce = F2}) ->
            F1 > F2
        end,
    List3 = lists:sort(FSort, List2),
    guildBattleGroup(List3).
guildBattleGroup([]) ->
    ok;
guildBattleGroup(List) ->
    SubList = lists:sublist(List, 10),
    guildBattleGroup2(SubList),
    guildBattleGroup(List -- SubList).
guildBattleGroup2([]) -> ok;
guildBattleGroup2(List) ->
    #globalsetupCfg{setpara = [A1,A2]} = getCfg:getCfgPStack(cfg_globalsetup, guildbattlerevivepos),
    case List of
        [#rec_guild{} = Guild] ->
            R = #rec_guildBattle{
                guildID = Guild#rec_guild.guildID,
                targetGuildID = 0,
                revivepos = A1,
                allpoint = 0
            },
            ets:insert(rec_guildBattle, R),
            ok;
        _ ->
            Len = erlang:length(List),
            Rand1 = misc:rand(1, Len),
            G1 = lists:nth(Rand1, List),
            Rand2 = misc:rand(1, Len - 1),
            G2 = lists:nth(Rand2, lists:delete(G1, List)),
            R1 = #rec_guildBattle{
                guildID = G1#rec_guild.guildID,
                targetGuildID = G2#rec_guild.guildID,
                revivepos = A1,
                allpoint = 0
            },
            R2 = #rec_guildBattle{
                guildID = G2#rec_guild.guildID,
                targetGuildID = G1#rec_guild.guildID,
                revivepos = A2,
                allpoint = 0
            },
            ets:insert(rec_guildBattle, R1),
            ets:insert(rec_guildBattle, R2),

            acGuildBattleState:addGuildPairs(#battleGuildPair{guildID1 = G1#rec_guild.guildID, guildID2 = G2#rec_guild.guildID}),

            guildBattleGroup2(List -- [G1, G2])
    end.

%% 清理老数据
cleanOldBattleList() ->
    List = ets:tab2list(rec_guild_battle_paid),
    F =
        fun(#rec_guild_battle_paid{guildID = GuildID, applytime = Time}) ->
            case core:timeIsOnDay(Time + ?SECS_FROM_0_TO_1970) of
                false ->
                    ?LOG_OUT("clean guild battle:~p", [GuildID]),
                    ets:delete(rec_guild_battle_paid, GuildID),
                    gsSendMsg:sendMsg2DBServer(saveGuildBattleData, 0, GuildID),
                    ok;
                _ -> skip
            end
        end,
    lists:foreach(F, List),
    ok.

addPlayerPoint(#battleGuildPair{guildID1 = GID1, players1 = PL1, guildID2 = GID2, players2 = PL2} = Pair, RoleID, Point) ->
    case ets:lookup(rec_guild_member, RoleID) of
        [#rec_guild_member{guildID = GID1}] ->
            NewPL1 = case lists:keyfind(RoleID, #enterGuildBattlePlayer.roleID, PL1) of
                         #enterGuildBattlePlayer{point = P1} = Player1 ->
                             lists:keystore(RoleID,
                                 #enterGuildBattlePlayer.roleID,
                                 PL1,
                                 Player1#enterGuildBattlePlayer{point = P1 + Point});
                         _ ->
                             PL1
                     end,
            {Pair#battleGuildPair{players1 = NewPL1}, GID1, Point};
        [#rec_guild_member{guildID = GID2}] ->
            NewPL2 = case lists:keyfind(RoleID, #enterGuildBattlePlayer.roleID, PL2) of
                         #enterGuildBattlePlayer{point = P2} = Player2 ->
                             lists:keystore(RoleID,
                                 #enterGuildBattlePlayer.roleID,
                                 PL2,
                                 Player2#enterGuildBattlePlayer{point = P2 + Point});
                         _ ->
                             PL2
                     end,
            {Pair#battleGuildPair{players2 = NewPL2}, GID2, Point};
        _ ->
            {Pair, 0, 0}
    end.

noticeLCBeAttack(MapPID, GuildID, LastTime) ->
    NowTime = time:getUTCNowSec(),
    case NowTime - LastTime >= 30 of
        true ->
            Content = stringCfg:getString(guildBattle_BattleIng),
            PlayerEts = acGuildBattleState:getMapPlayerEts(MapPID),
            F =
                fun(#recMapObject{netPid = NetPid, guild = GID}, _) ->
                    case GuildID =:= GID of
                        true ->
                            core:sendBroadcastNotice(Content, NetPid);
                        _ ->
                            skip
                    end,
                    ok
                end,
            ets:foldl(F, 0, PlayerEts),
            NowTime;
        _ ->
            LastTime
    end.

%% 广播旗帜改变
noticeBannerChange(MapPID, 0, NewGuildID, RoleID, GatherID) ->
	PlayerName = playerNameUID:getPlayerNameByUID(RoleID),
	GatherName = case getCfg:getCfgByKey(cfg_object, GatherID) of
					 #objectCfg{name = Name} -> Name;
					 _ -> ""
				 end,
	We = stringCfg:getString(guildBattle_WeOccupy, [PlayerName, GatherName]),

	PlayerEts = acGuildBattleState:getMapPlayerEts(MapPID),
	F =
		fun(#recMapObject{netPid = NetPid, guild = GID}, _) ->
			if
				GID =:= NewGuildID ->
					core:sendBroadcastNotice(We, NetPid);
				true ->
					skip
			end,
			ok
		end,
	ets:foldl(F, 0, PlayerEts),
    ok;
noticeBannerChange(MapPID, OldGuildID, NewGuildID, RoleID, GatherID) ->
    PlayerName = playerNameUID:getPlayerNameByUID(RoleID),
    GatherName = case getCfg:getCfgByKey(cfg_object, GatherID) of
                     #objectCfg{name = Name} -> Name;
                     _ -> ""
                 end,
    Enemy = stringCfg:getString(guildBattle_EnemyOccupy, [PlayerName, GatherName]),
    We = stringCfg:getString(guildBattle_WeOccupy, [PlayerName, GatherName]),

    PlayerEts = acGuildBattleState:getMapPlayerEts(MapPID),
    F =
        fun(#recMapObject{netPid = NetPid, guild = GID}, _) ->
            if
                GID =:= OldGuildID ->
                    core:sendBroadcastNotice(Enemy, NetPid);
                GID =:= NewGuildID ->
                    core:sendBroadcastNotice(We, NetPid);
                true ->
                    skip
            end,
            ok
        end,
    ets:foldl(F, 0, PlayerEts),
    ok.

brodcastBannerChange(#battleGuildPair{mapPID = MapPID, guildID1 = GID1, guildID2 = GID2} = Pair) ->
    Msg = getOccupyOwnerChangeMsg(Pair),
    PlayerETS = acGuildBattleState:getMapPlayerEts(MapPID),
    F =
        fun(#recMapObject{netPid = NetPID, guild = GID}, _) ->
			TGID = case GID =:= GID1 of
					   true -> GID2;
					   _ -> GID1
				   end,

            gsSendMsg:sendNetMsg(NetPID, Msg#pk_GS2U_OccupyOwnerChange{ownerID = GID, targetID = TGID})
        end,
    ets:foldl(F, 0, PlayerETS),
    ok.

getOccupyOwnerChangeMsg(#battleGuildPair{} = Pair) ->
    [{G1,_P1}, {G2,_P2}, {G3,_P3}] = acGuildBattleState:getCollectIDs(),
    I1 = #pk_OccupyOwner{occupyID = G1, ownerID = Pair#battleGuildPair.collect1GuildID},
    I2 = #pk_OccupyOwner{occupyID = G2, ownerID = Pair#battleGuildPair.collect2GuildID},
    I3 = #pk_OccupyOwner{occupyID = G3, ownerID = Pair#battleGuildPair.collect3GuildID},
    #pk_GS2U_OccupyOwnerChange{infos = [I1, I2, I3]}.

%% 比赛结果
sendBattleResultToClient(
	#rec_guildBattle{mapPID = MapPID, guildID = GID1} = Guild1,
	#rec_guildBattle{} = Guild2,
	WinGuildID, BattleState, Param) ->
    Info1 = getGuildBattleInfo(Guild1),
    Info2 = getGuildBattleInfo(Guild2),
    Msg =
        case WinGuildID =:= GID1 of
            true ->
                #pk_GS2U_GuildBattleResult{isEnd = BattleState, win = Info1, lose = Info2};
            _ ->
                #pk_GS2U_GuildBattleResult{isEnd = BattleState, win = Info2, lose = Info1}
        end,

	case Param of
		{_RoleID, NetPid} ->
			gsSendMsg:sendNetMsg(NetPid, Msg),
			ok;
		_ ->
			case acGuildBattleState:getMapPlayerEts(MapPID) of
				undefined ->
					?ERROR_OUT("sendBattleResultToClient:~p,~p,~p,~p,~p", [Guild1, Guild2, WinGuildID, BattleState, Param]);
				PlayerEts ->
					F = fun(#recMapObject{netPid = NetPid}, _) -> gsSendMsg:sendNetMsg(NetPid, Msg) end,
					ets:foldl(F, 0, PlayerEts)
			end
	end,
    ok.

getGuildBattleInfo(#rec_guildBattle{mapPID = MapPID, guildID = GuildID, allpoint = Point}) ->
    #battleGuildPair{
        guildID1 = GID1, players1 = PS1,
        guildID2 = _GID2, players2 = PS2
    } = acGuildBattleState:getGuildPairsByMapPID(MapPID),

    PS = case GuildID =:= GID1 of
             true -> PS1;
             _ -> PS2
         end,

    F =
        fun(#enterGuildBattlePlayer{roleID = RoleID, roleName = RoleName, point = P}) ->
            #pk_GuildBattlePlayerInfo{roleID = RoleID, roleName = RoleName, point = P}
        end,
    PlayerInfos = lists:map(F, PS),
    GuildName = case ets:lookup(rec_guild, GuildID) of
                    [#rec_guild{guildName = GName}] -> GName;
                    _ -> ""
                end,
    #pk_GuildBattleResultInfo{guildID = GuildID, guildName = GuildName, point = Point, playerInfos = PlayerInfos}.