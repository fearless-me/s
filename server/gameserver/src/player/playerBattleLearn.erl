%%%-------------------------------------------------------------------
%%% @author 罗维
%%% @copyright (C) 2014, <haowan123>
%%% @doc
%%% 玩家切磋
%%% @end
%%% Created : 15. 十二月 2014 17:30
%%%-------------------------------------------------------------------

-module(playerBattleLearn).
-author(luowei).

-include("gsInc.hrl").
-include("playerPrivate.hrl").

-export([
	offLineBattleLearn/0,
	outBitMapBattleLearn/0,
	dealBattleLearnResult/2,
	requestBattleLearn/1,
	toRequestBattleLearn/1,
	responseBattleLearn/2,
	enterBattleLearnMap/5,
	leaveBattleLearnMap/2,
	enterBattleLearnStatus/0,
	leaveBattleLearnStatus/0
]).

%%离线切磋处理
-spec offLineBattleLearn() -> ok.
offLineBattleLearn() ->
	case playerState:getBattleLearnInfo() of
		#recBattleLearn{isChallenger = IsChall} = RecBattleLearn ->
			GroupID = playerState:getGroupID(),
			dealBattleLearnResult(RecBattleLearn, GroupID),
			case IsChall of
				true ->
					psMgr:sendMsg2PS(playerState:getMapPid(), clearBitMapPlayer, GroupID);
				_ ->
					skip
			end;
		_ ->
			ok
	end.

%%退出位面切磋处理
-spec outBitMapBattleLearn() -> ok.
outBitMapBattleLearn() ->
	case playerState:getBattleLearnInfo() of
		#recBattleLearn{} = RecBattleLearn ->
			GroupID = playerState:getGroupID(),
			dealBattleLearnResult(RecBattleLearn, GroupID);
		_ ->
			playerScene:onEnterGroup(0)
	end.

%%处理切磋结果
-spec dealBattleLearnResult(#recBattleLearn{}, GroupID::uint()) -> ok.
dealBattleLearnResult(#recBattleLearn{isChallenger = IsChall, pid = Pid}, GroupID) ->
	case IsChall of
		true ->
			leaveBattleLearnMap(?BattleLearnFailure, GroupID);
		_ ->
			psMgr:sendMsg2PS(Pid, leaveBattleLearnMap, {?BattleLearnWin, GroupID})
	end.

%%请求切磋
-spec requestBattleLearn(Code::uint()) -> ok.
requestBattleLearn(Code) ->
	case canBattleLearn(Code) of
		{true, Pid} ->
			%%设置本次切磋进入时间
			playerState:setBattleLearnRequestTime(time:getUTCNowSec()),
			SelfName = playerState:getName(),
			SelfID = playerState:getRoleID(),
			SelfNetPid = playerState:getNetPid(),
			SelfCode = playerState:getPlayerCode(),
			psMgr:sendMsg2PS(Pid, toRequestBattleLearn, {SelfID, SelfCode, SelfName, self(), SelfNetPid});
		Error ->
			playerMsg:sendErrorCodeMsg(Error)
	end.

-spec toRequestBattleLearn({TargetID::uint(), TargetCode::uint(), TargetName::string(), TargetPid::pid(), TargetNetPid::pid() | uint()}) -> ok.
toRequestBattleLearn({_TargetID, TargetCode, TargetName, _TargetPid, TargetNetPid}) ->
	playerMsg:sendErrorCodeMsg(TargetNetPid, ?ErrorCode_BattleLearnSendOut),

	playerState:addRequestBattleLearn(TargetCode),

	noticeRequestBattleLearn(TargetCode, TargetName).

%%反馈切磋（同意 or 拒绝）
-spec responseBattleLearn(Code::uint(), Result::uint()) -> ok.
responseBattleLearn(Code, ?BattleLearnAgree) ->
	L = playerState:getRequestBattleLearnList(),
	case lists:member(Code, L) of
		true ->
			case canRecBattleLearn(Code) of
				{true, Pid, NetPid, Name} ->
					playerState:setRequestBattleLearnList([]),

					%%自己先进入位面
					case playerScene:onEnterBitGroup(getBitMap()) of
						0 ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_BattleLearnErrorEnterBitMap);
						GroupID ->
							RecBattleLearn = #recBattleLearn{
								code = Code,
								pid = Pid,
								name = Name,
								netPid = NetPid,
								hp = playerState:getCurHp(),
								isChallenger = false
							},
							playerState:setBattleLearnInfo(RecBattleLearn),
							%%通知发起切磋者进入位面
							SelfName = playerState:getName(),
							SelfNetPid = playerState:getNetPid(),
							SelfCode = playerState:getPlayerCode(),
							psMgr:sendMsg2PS(Pid, enterBattleLearnMap, {SelfCode, SelfNetPid, SelfName, GroupID})
					end;
				Error ->
					playerMsg:sendErrorCodeMsg(Error)
			end;
		_ ->
			responseBattleLearn(Code, 0)
	end;
responseBattleLearn(Code, _) ->
	PlayerEts = playerState:getMapPlayerEts(),
	case mapView:getMapObjectExcludeChangingMap(PlayerEts, Code) of
		[#recMapObject{netPid = NetPid}] ->
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_BattleLearnErrorRefuse);
		_ ->
			skip
	end.

%%进入切磋位面
-spec enterBattleLearnMap(Code::uint(), Pid::pid(), NetPid::pid(), Name::string(), GroupID::uint()) -> ok.
enterBattleLearnMap(Code, Pid, NetPid, Name, GroupID) ->
	playerScene:onEnterGroup(GroupID), %%失败处理
	RecBattleLearn = #recBattleLearn{
		code = Code,
		pid = Pid,
		name = Name,
		netPid = NetPid,
		hp = playerState:getCurHp(),
		isChallenger = true
	},
	playerState:setBattleLearnInfo(RecBattleLearn),
	SelfNetPid = playerState:getNetPid(),
	%%广播倒计时
	[noticeIsTriggerCountDown(NewPid, ?BattleLearnTriggerCD, ?BattleLearnCdStart) || NewPid <- [NetPid, SelfNetPid]],
	%%倒计时结束后进入切磋
	TimerRef = erlang:send_after(?BattleLearnCDTime, self(), enterBattleLearn),
	TimerList = playerState:getPlayerTimerList(),
	playerState:setPlayerTimerList([TimerRef | TimerList]).

%%离开切磋位面
-spec leaveBattleLearnMap(Result::uint(), GroupID::uint()) -> ok.
leaveBattleLearnMap(Result, GroupID) ->
	%%清除所有减益buff
	case Result of
		?BattleLearnWin ->
			playerBuff:delBuff(1, 0);
		_ ->
			skip
	end,
	%%关闭定时器
	cancelTimer(),
	%%通知地图进程销毁位面
	case getBitMapDestoryTime() of
		notingroup ->
			skip;
		DelayTime ->
			erlang:send_after(DelayTime, self(), {noticeDestoryBitMap, GroupID})
	end,
	playerState:setCamp(?CampPlayer, true),
	case playerState:getBattleLearnInfo() of
		#recBattleLearn{
			code = Code,
			pid = Pid,
			name = Name,
			netPid = NetPid,
			hp = HP
		} ->
			%% 恢复血量
			CurHP = playerState:getCurHp(),
			case CurHP < HP andalso CurHP > 0 of
				true ->
					playerBase:setHpDirect(HP);
				_ ->
					playerPropSync:setInt(?SerProp_BattleLearnHP, trunc(HP)),
					skip
			end,

			psMgr:sendMsg2PS(Pid, beBattleLearnLeave, {?CampPlayer}),

			playerState:setBattleLearnInfo([]),
			SelfNetPid = playerState:getNetPid(),
			%%广播结果
			[noticeBattleLearnResult(NewPid, Result, Code, Name) || NewPid <- [NetPid, SelfNetPid]],
			%%广播给周围的人
			noticeNearPlayerResult(Result, Name);
		ErrData ->
			?WARN_OUT("~p.~w leaveBattleLearnMap getBattleLearnInfo faild ~p", [?MODULE, ?LINE, ErrData])
	end.

%%进入切磋
-spec enterBattleLearnStatus() -> ok.
enterBattleLearnStatus() ->
	%%设置玩家切磋阵营
	playerState:setCamp(?CampRedBattle, true),
	#recBattleLearn{
		pid = Pid
	} = playerState:getBattleLearnInfo(),
	psMgr:sendMsg2PS(Pid, changePlayerCamp, ?CampBlueBattle),
	TimerRef = erlang:send_after(?BattleLearnTime, self(), leaveBattleLearn),
	TimerList = playerState:getPlayerTimerList(),
	playerState:setPlayerTimerList([TimerRef | TimerList]).

%%结束切磋
-spec leaveBattleLearnStatus() -> ok.
leaveBattleLearnStatus() ->
	#recBattleLearn{
		netPid = NetPid
	} = playerState:getBattleLearnInfo(),
	SelfNetPid = playerState:getNetPid(),
	%%广播倒计时
	[noticeIsTriggerCountDown(NewPid, ?BattleLearnTriggerCD, ?BattleLearnCdEnd) || NewPid <- [NetPid, SelfNetPid]],
	%%倒计时结束后进入切磋
	TimerRef = erlang:send_after(?BattleLearnCDTime, self(), leaveBattleLearnMap),
	TimerList = playerState:getPlayerTimerList(),
	playerState:setPlayerTimerList([TimerRef | TimerList]).

%%是否可以接受切磋
-spec canRecBattleLearn(Code::uint()) -> {true, pid(), pid(), string()} | uint().
canRecBattleLearn(Code) ->
	PlayerEts = playerState:getMapPlayerEts(),
	case mapView:getMapObjectExcludeChangingMap(PlayerEts, Code) of
		[] ->
			?ErrorCode_BattleLearnErrorExist;
		[#recMapObject{hp = Hp, actionStatus = Status}] when
			Hp =< 0 orelse Status =:= ?CreatureActionStatusDead ->
			?ErrorCode_BattleLearnErrorDead;
		[#recMapObject{groupID = GroupID, mapId = MapID, pid = Pid, netPid = NetPid, name = Name}] ->
			SelfMapID = playerState:getMapID(),
			case checkBattleLearnMap(SelfMapID) of
				true ->
					case checkBattleLearnMapDiff(SelfMapID, MapID) of
						true ->
							SelfGroupID = playerState:getGroupID(),
							case checkBattleLearnStatus(SelfGroupID, GroupID) of
								true ->
									{true, Pid, NetPid, Name};
								ErrorStatus ->
									ErrorStatus
							end;
						ErrorMapDiff ->
							ErrorMapDiff
					end;
				ErrorMap ->
					ErrorMap
			end
	end.

%%是否可以发起切磋
-spec canBattleLearn(Code::uint()) -> {true, pid()} | uint().
canBattleLearn(Code) ->
	PlayerEts = playerState:getMapPlayerEts(),
	case mapView:getMapObjectExcludeChangingMap(PlayerEts, Code) of
		[] ->
			?ErrorCode_BattleLearnErrorExist;
		[#recMapObject{hp = Hp, actionStatus = Status}] when
			Hp =< 0 orelse Status =:= ?CreatureActionStatusDead ->
			?ErrorCode_BattleLearnErrorDead;
		[#recMapObject{level = Lv, mapId = MapID, pid = Pid, groupID = GroupID}] ->
			SelfLv = playerState:getLevel(),
			case checkBattleLearnLv(SelfLv, Lv) of
				true ->
					Now = time:getUTCNowSec(),
					LastBlTime = playerState:getBattleLearnRequestTime(),
					case checkBattleLearnTime(Now, LastBlTime) of
						true ->
							SelfMapID = playerState:getMapID(),
							case checkBattleLearnMap(SelfMapID) of
								true ->
									case checkBattleLearnMapDiff(SelfMapID, MapID) of
										true ->
											SelfGroupID = playerState:getGroupID(),
											case checkBattleLearnStatus(SelfGroupID, GroupID) of
												true ->
													{true, Pid};
												ErrorStatus ->
													ErrorStatus
											end;
										ErrorMapDiff ->
											ErrorMapDiff
									end;
								ErrorMap ->
									ErrorMap
							end;
						ErrorTime ->
							ErrorTime
					end;
				ErrorLv ->
					ErrorLv
			end
	end.

%%检查切磋等级
-spec checkBattleLearnLv(SelfLv::uint(), TargetLv::uint()) -> boolean().
checkBattleLearnLv(SelfLv, TargetLv) ->
	NeedLevel = case getCfg:getCfgByKey(cfg_globalsetup, wildpk_openlevel) of
					#globalsetupCfg{setpara = [Lvl]} -> Lvl;
					_ -> ?BattleLearnLv
				end,
	case SelfLv >= NeedLevel andalso TargetLv >= NeedLevel of
		true -> true;
		_ -> ?ErrorCode_BattleLearnErrorLv
	end.

%%检查切磋间隔时间
-spec checkBattleLearnTime(Now::uint(), LastBlTime::uint()) -> boolean().
checkBattleLearnTime(Now, LastBlTime) when Now - LastBlTime > ?BattleLearnInterval ->
	true;
checkBattleLearnTime(_, _) ->
	?ErrorCode_BattleLearnErrorCd.

%%检查地图是否可以切磋
-spec checkBattleLearnMap(MapID::uint()) -> boolean().
checkBattleLearnMap(MapID) ->
	#mapsettingCfg{pkflag = Pkflag} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
	case misc:testBit(Pkflag, ?MapBttleLearn) of
		true ->
			true;
		_ ->
			?ErrorCode_BattleLearnErrorMap
	end.

%%检查地图是否一致
-spec checkBattleLearnMapDiff(SelfMapID::uint(), TargetMapID::uint()) -> boolean().
checkBattleLearnMapDiff(SelfMapID, TargetMapID) when SelfMapID =:= TargetMapID ->
	true;
checkBattleLearnMapDiff(_, _) ->
	?ErrorCode_BattleLearnErrorMapDiff.

%%检查切磋状态
-spec checkBattleLearnStatus(SelfGroupID::uint(), TargetGroupID::uint()) ->boolean().
checkBattleLearnStatus(0, 0) ->
	true;
checkBattleLearnStatus(SelfGroupID, TargetGroupID) ->
	SelfMapID = groupBase:getMapIDByGroupID(SelfGroupID),
	case getCfg:getCfgPStack(cfg_mapsetting, SelfMapID) of
		#mapsettingCfg{subtype = SubType} when SubType =:= 4 ->
			?ErrorCode_BattleLearnErrorSelfStatus;
		_ ->
			TargetMapID = groupBase:getMapIDByGroupID(TargetGroupID),
			case getCfg:getCfgPStack(cfg_mapsetting, TargetMapID) of
				#mapsettingCfg{subtype = SubType1} when SubType1 =:= 4 ->
					?ErrorCode_BattleLearnErrorTargetStatus;
				_ ->
					true
			end
	end.

%%获取位面
-spec getBitMap() -> uint().
getBitMap() ->
	MapID = playerState:getMapID(),
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{onevsone = Oonevsone} ->
			Oonevsone;
		_ ->
			0
	end.

%%获取位面销毁时间
-spec getBitMapDestoryTime() -> uint()|notingroup.
getBitMapDestoryTime() ->
	GroupID = playerState:getGroupID(),
	BitMapID = groupBase:getMapIDByGroupID(GroupID),
	case BitMapID of
		0 ->
			notingroup;
		_ ->
			case getCfg:getCfgPStack(cfg_mapsetting, BitMapID) of
				#mapsettingCfg{finish_time = Time} ->
					Time * 1000;
				_ ->
					notingroup
			end
	end.

%%关闭定时器
-spec cancelTimer() -> ok.
cancelTimer() ->
	TimerList = playerState:getPlayerTimerList(),
	cancelTimer(TimerList).
cancelTimer([]) ->
	playerState:setPlayerTimerList([]);
cancelTimer([Timer | List]) ->
	erlang:cancel_timer(Timer),
	cancelTimer(List).

%%通知消息

%%通知客服端XXX请求切磋
-spec noticeRequestBattleLearn(Code::uint(), Name::string()) -> ok.
noticeRequestBattleLearn(Code, Name) ->
	Msg = #pk_GS2U_BattleLearnRequest{
		code = Code,
		name = Name
	},
	playerMsg:sendNetMsg(Msg).

%%通知是否触发倒计时
-spec noticeIsTriggerCountDown(NetPid::pid(),Flag::uint(), Flag1::uint()) -> ok.
noticeIsTriggerCountDown(NetPid, Flag, Flag1) ->
	Msg = #pk_GS2U_IsTriggerCountDown{
		flag = Flag1,
		isTrigger = Flag
	},
	playerMsg:sendNetMsg(NetPid, Msg).

%%通知客服端切磋结果
-spec noticeBattleLearnResult(NetPid::pid(), Result::uint(), Code::uint(), Name::string()) -> ok.
noticeBattleLearnResult(NetPid, Result, Code, Name) ->
	Msg = #pk_GS2U_BattleLearnResult{
		result = Result,
		targetCode = Code,
		targetName = Name,
		name = playerState:getName(),
		code = playerState:getPlayerCode()
	},
	playerMsg:sendNetMsg(NetPid, Msg).

%%通知周围玩家切磋结果
-spec noticeNearPlayerResult(Result :: uint(), Name::string()) -> ok.
noticeNearPlayerResult(Result, Name) ->
	SelfName = playerState:getName(),
	MapPid = playerState:getMapPid(),
	ObjectEts = playerState:getMapPlayerEts(),
	NearList = mapView:getNearAllObject(MapPid, ObjectEts, ?ObjTypePlayer, playerState:getPos()),
	Msg =
		case Result of
			?BattleLearnFailure ->
				playerMsg:getErrorCodeMsg(?ErrorCode_BattleLearnFailure, [SelfName, Name]);
			?BattleLearnWin ->
				playerMsg:getErrorCodeMsg(?ErrorCode_BattleLearnWin, [SelfName, Name]);
			_ ->
				playerMsg:getErrorCodeMsg(?ErrorCode_BattleLearnDraw, [SelfName, Name])
		end,
	[mapView:sendNetMsgToNetPid(NetPid, Msg) || #recMapObject{netPid = NetPid} <- NearList],
	ok.

