%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 时空裂痕
%%% @end
%%% Created : 06. 一月 2015 16:40
%%%-------------------------------------------------------------------
-module(playerCopyMapRift).
-author("tiancheng").

-include("playerPrivate.hrl").

%% API
-export([
	requestRiftNpcInfo/1,
	requestRiftNpcInfoAck/1,
	requestEnterRift/2,
	inviteMemberToRift/1,
	isRiftMap/1,
	getSurplusTimes/0,
	getRiftMoneyAndExpRatio/0
]).

%% 请求时空裂痕npc的信息
-spec requestRiftNpcInfo(NpcCode::uint()) -> ok.
requestRiftNpcInfo(0) ->
	%% 这个是没有选中npc的时候，直接请求自己的参与次数
	R = #pk_GS2U_RequestRiftNpcInfo{
		npcCode = 0,
		npcID = 0,
		surplusTimes = getSurplusTimes(),
		disappearTime = 0,
		groupID = 0,
		bitplaneMapID = 0
	},
	?DEBUG_OUT("requestRiftNpcInfo:~p", [R]),
	playerMsg:sendNetMsg(R),
	ok;
requestRiftNpcInfo(NpcCode) ->
	%% 这个是选中npc了，还要寻问这个npc什么时候消失
	case canEnterRift(NpcCode) of
		true ->
			MapPID = playerState:getMapPid(),
			psMgr:sendMsg2PS(MapPID, requestRiftNpcInfo, NpcCode);
		_ ->
			skip
	end,
	ok.

%% 时空裂痕npc移动的剩余时间
-spec requestRiftNpcInfoAck({NpcCode::uint(), SurplusTime::uint()}) -> ok.
requestRiftNpcInfoAck({NpcCode, SurplusTime}) ->
	NpcID = case myEts:lookUpEts(playerState:getMapNpcEts(), NpcCode) of
				[#recMapObject{id = ID}] ->
					ID;
				_ ->
					0
			end,
	R = #pk_GS2U_RequestRiftNpcInfo{
		npcCode = NpcCode,
		npcID = NpcID,
		surplusTimes = getSurplusTimes(),
		disappearTime = SurplusTime,
		groupID = 0,
		bitplaneMapID = 0
	},
	?DEBUG_OUT("requestRiftNpcInfoAck:~p", [R]),
	playerMsg:sendNetMsg(R),
	ok.

%% 玩家请求进入时空裂痕
-spec requestEnterRift(GroupID::uint(), BMapID::uint()) -> ok.
requestEnterRift(GroupID, BMapID) ->
	%% 首先判断进入时间
	RoleID = playerState:getRoleID(),
	LastEnterTime = gsMainLogic:getEnterRiftTime(RoleID),
	NowTime = time:getUTCNowSec(),
	DiffTime = NowTime - LastEnterTime,
	case DiffTime >= ?Rift_Enter_IntervalTime of
		true ->
			case canPlayerEnterRift(GroupID) of
				true ->
					BitPlaneMapID = getBitPlaneMapID(BMapID),
					case erlang:is_integer(BitPlaneMapID) andalso BitPlaneMapID > 0 andalso getCfg:getCfgPStack(cfg_mapsetting, BitPlaneMapID) of
						#mapsettingCfg{playerEnter_MinLevel = Min, playerEnter_MaxLevel = Max} ->
							case playerCopyMap:checkEnterCopyMapLevel(Min, Max) of
								true ->
									case BitPlaneMapID > 0 andalso playerScene:getMapType(BitPlaneMapID) of
										?MapTypeBitplane ->
											%% 如果分组为0，且自己不是队长，则不允许进入时空
											TeamID = playerState:getTeamID(),
%%											case TeamID > 0 andalso GroupID == 0 andalso RoleID /= team2:getTeamLeaderID(TeamID) of
											case TeamID > 0 andalso GroupID == 0 andalso teamInterface:isTeamLeader(RoleID) =:= false of
												false ->
													%% 设置进入时间
													gsMainLogic:setEnterRiftTime(RoleID, NowTime),

													%% 可以进入时空裂痕
													RetGroupID = case GroupID > 0 of
																	 true ->
																		 playerScene:onEnterGroup(GroupID);
																	 _ ->
																		 playerScene:onEnterBitGroup(BitPlaneMapID)
																 end,
													%% 进入结果
													requestEnterRiftResult(RetGroupID, BitPlaneMapID);
												_ ->
													%% 不满足组队进入时空裂痕的条件
													playerMsg:sendErrorCodeMsg(?ErrorCode_EnterRiftYouNotLeader),
													skip
											end;
										_ ->
											skip
									end;
								_ ->
									%% 进入等级不满足
									playerMsg:sendErrorCodeMsg(?ErrorCode_EnterRiftLevelNotEnough, [Min]),
									skip
							end;
						_ ->
							%% 没有找到这个位面配置
							playerMsg:sendErrorCodeMsg(?ErrorCode_EnterRiftNotRiftMap),
							skip
					end;
				ErrorCode ->
					%% 提示进入时空裂痕失败
					playerMsg:sendErrorCodeMsg(ErrorCode),
					skip
			end;
		_ ->
			%% 提示还有多少秒可以进
			SurplusTime = ?Rift_Enter_IntervalTime - DiffTime,
			playerMsg:sendErrorCodeMsg(?ErrorCode_EnterRiftIntervalTime, [SurplusTime])
	end,
	ok.

%% 进入时空裂痕结果
-spec requestEnterRiftResult(GroupID::uint(), BMapID::uint()) -> ok.
requestEnterRiftResult(0, _BMapID) ->
	%% 进入失败
	?ERROR_OUT("requestEnterRiftResult:~p,~p,~p",[playerState:getPlayerCode(),playerState:getRoleID(),_BMapID]),
	playerMsg:sendErrorCodeMsg(?ErrorCode_EnterRiftBitPlaneFailed),
	ok;
requestEnterRiftResult(GroupID, BMapID) ->
	%% 时空裂痕成就
	playerAchieve:achieveEvent(?Achieve_Rift, [1]),

	%% 进入成功，如果是队长，通知队友
	case playerState:getTeamID() of
		TeamID when TeamID > 0 ->
			RoleID = playerState:getRoleID(),
%%			case team2:getTeamInfoByTeamID(TeamID) of
			case teamInterface:getTeamInfoWithTeamID(TeamID) of
				#recTeamInfo{leaderID = LID, memberList = MembersList} ->
					case LID =:= RoleID of
						true ->
							%% 只有队长可以邀请
							[psMgr:sendMsg2PS(Pid, inviteMemberToRift, {GroupID, BMapID})
							 || #recTeamMemberInfo{roleID = MemberID, pid = Pid} <- MembersList, MemberID =/= RoleID];
						_ ->
							%% 是队员进入，把他拉到队长所在的位置
							transferMemberToLeader(RoleID, LID),
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,

	%% 提示进入的什么时空裂痕
	noticeEnterWhatType(BMapID),
	ok.

transferMemberToLeader(Member, Leader) ->
	%% 先取目标的坐标
	PlayerEts = playerState:getMapPlayerEts(),
	MatchSpec = ets:fun2ms(fun(Object) when Object#recMapObject.id =:= Leader -> Object end),
	MapID = playerState:getMapID(),
	SelfMapPid = playerState:getMapPid(),

	%% 要确保自己与队长在同一地图，才可以瞬移
	case myEts:selectEts(PlayerEts, MatchSpec) of
		[#recMapObject{x = TX, y = TY, mapPid = SelfMapPid, mapId = MapID}] ->
			%% 再取自己的坐标
			{SX, SY} = playerState:getPos(),

			%% 判断两者之间的距离,>1米，才传送,目标方向向量
			DX = TX - SX,
			DY = TY - SY,
			%%目标距离
			case math:sqrt(DX * DX + DY * DY) > 2 of
				true ->
					%% 传送
					?LOG_OUT("transferMemberToLeader:roleID=~p -> Leader=~p, {SX=~p,SY=~p} -> {TX=~p,TY=~p}",
						[Member,Leader,SX, SY,TX,TY]),
					playerMap:onLaterTransferPosAck(MapID, TX, TY);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% 队长邀请队员进入时空裂痕
-spec inviteMemberToRift({GroupID::uint(), BMapID::uint()}) -> ok.
inviteMemberToRift({GroupID, BMapID}) ->
	R = #pk_GS2U_RequestRiftNpcInfo{
		npcCode = 0,
		npcID = 0,
		surplusTimes = getSurplusTimes(),
		disappearTime = 10,
		groupID = GroupID,
		bitplaneMapID = BMapID
	},
	?DEBUG_OUT("inviteMemberToRift:~p", [R]),
	playerMsg:sendNetMsg(R),
	ok.

%% 获取时空裂痕的位面ID
-spec getBitPlaneMapID(BMapID::uint()) -> uint().
getBitPlaneMapID(BMapID) ->
	case BMapID > 0 of
		true ->
			BMapID;
		_ ->
			%% 随机一个
			Code = playerState:getSelectTargetCode(),
			case canEnterRift(Code) of
				true ->
					MapID = playerState:getMapID(),
					[#recMapObject{id = ID}] = myEts:lookUpEts(playerState:getMapNpcEts(), Code),
					case getCfg:getCfgPStack(cfg_rift_rand, MapID, ID) of
						#rift_randCfg{mapsetting_id = MList} when erlang:is_list(MList) andalso length(MList) > 0 ->
							%% 随机一个位面ID
							Len = length(MList),
							Index = misc:rand(1, Len),
							lists:nth(Index, MList);
						_ ->
							?ERROR_OUT("getBitPlaneMapID cfg_rift_rand:roleid=~p,bmapid=~p,nowmapid=~p,npcid=~p",
								[playerState:getRoleID(),BMapID,playerState:getMapID(),ID]),
							0
					end;
				_ ->
					?ERROR_OUT("getBitPlaneMapID not canEnterRift:roleid=~p,bmapid=~p,nowmapid=~p",
						[playerState:getRoleID(),BMapID,playerState:getMapID()]),
					0
			end
	end.

%% 能否进入时空裂痕
-spec canPlayerEnterRift(GroupID::uint()) -> boolean().
canPlayerEnterRift(GroupID) ->
	MapID = playerState:getMapID(),
	case playerScene:getMapType(MapID) of
		?MapTypeNormal ->
			%% 判断次数是否用尽
			case getSurplusTimes() > 0 of
				true ->
					case lists:member(MapID, getCfg:get1KeyList(cfg_rift)) of
						true ->
							case playerState:getGroupID() =< 0 of
								true ->
									%% 如果有组队，判断和队长是否处于同一个地图
									canTeamEnterRift(GroupID);
								_ ->
									%% 已经在分组中，不允许进入
									?ErrorCode_EnterRiftAlreadyBitMap
							end;
						_ ->
							%% 不是时空裂痕的地图
							?ErrorCode_EnterRiftNotRiftMap
					end;
				_ ->
					%% 进入时空裂痕次数已达上限
					?ErrorCode_EnterRiftAlreadyMaxTimes
			end;
		_ ->
			%% 当前所在地图不是普通地图
			?ErrorCode_EnterRiftNotRiftMap
	end.

%% 如果有组队，判断和队长是否处于同一个地图
canTeamEnterRift(GroupID) ->
	TeamID = playerState:getTeamID(),
	if
		TeamID > 0 ->
			RoleID = playerState:getRoleID(),
			LeaderID = teamInterface:getLeaderIDWithTeamID(TeamID),%%team2:getTeamLeaderID(TeamID),
			case RoleID =:= LeaderID of
				true ->
					%% 自己是队长，允许进入
					true;
				_ ->
					%% 自己不是队长，判断是否和队长处于同一地图
					MatchSpec = ets:fun2ms(fun(Obj) when Obj#recMapObject.id =:= LeaderID ->
						Obj
										   end),
					case myEts:selectEts(playerState:getMapPlayerEts(), MatchSpec) of
						[#recMapObject{mapPid = MPid, groupID = LeaderGID}] ->
							%% 和队长的mappid相等
							case MPid =:= playerState:getMapPid() andalso GroupID =:= LeaderGID of
								true ->
									true;
								_ ->
									?ErrorCode_EnterRiftNotFoundTeamLeader
							end;
						_ ->
							%% 在自己所在的地图，没有找到队长，不允许进
							?ErrorCode_EnterRiftNotFoundTeamLeader
					end
			end;
		TeamID =< 0 andalso GroupID > 0 ->
			?ErrorCode_EnterRiftBitPlaneFailed;
		true ->
			%% 没有队伍，个人单刷请直接进
			true
	end.

-spec canEnterRift(NpcCode::uint()) -> boolean().
canEnterRift(NpcCode) ->
	NpcEts = playerState:getMapNpcEts(),
	case myEts:lookUpEts(NpcEts, NpcCode) of
		[#recMapObject{id = ID}] ->
			MapID = playerState:getMapID(),
			case lists:member({MapID, ID}, getCfg:getKeyList(cfg_rift_rand)) of
				true ->
					true;
				false ->
					?ERROR_OUT("canEnterRift:roleid=~p,mapid=~p,npcid=~p",
						[playerState:getRoleID(),MapID,ID]),
					false
			end;
		_ ->
			?ERROR_OUT("canEnterRift:roleid=~p,mapid=~p,npccode=~p",
				[playerState:getRoleID(),playerState:getMapID(),NpcCode]),
			false
	end.

%% 获取时空裂痕剩余次数
-spec getSurplusTimes() -> uint().
getSurplusTimes() ->
	NowNumber = playerDaily:getDailyCounter(?DailyType_Everyday, ?PlayerEveryDay_Rift),
	erlang:max(?Rift_EveryDay_Max_Times - NowNumber, 0).

%% 是不是时空裂痕地图
-spec isRiftMap(MapID::uint()) -> boolean().
isRiftMap(MapID) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeBitplane, subtype = ?MapSubTypeRift} ->
			true;
		_ ->
			false
	end.

%% 获取时空裂痕金钱经验奖励比例
getRiftMoneyAndExpRatio() ->
	case getCfg:getCfgPStack(cfg_globalsetup, liehen_reduce) of
		#globalsetupCfg{setpara = [Value]} ->
			case Value > 1 of
				true ->
					?ERROR_OUT("getRiftMoneyAndExpRatio: config error!"),
					0;
				_ ->
					Value
			end;
		_ ->
			0
	end.

%% 提示进入的什么时空裂痕
noticeEnterWhatType(BMapID) ->
	case getCfg:getCfgPStack(cfg_mapsetting, BMapID) of
		#mapsettingCfg{scheduleConf = Schedule} ->
			case Schedule of
				[{InitID, _}|_] ->
%% 					#copymapScheduleInitCfg{addcollect = CCC} = getCfg:getCfgPStack(cfg_copymapScheduleInit, InitID),
%% 					?WARN_OUT("noticeEnterWhatType:~p,~p,~p", [BMapID,InitID,CCC]),
					case getCfg:getCfgPStack(cfg_copymapScheduleInit, InitID) of
						#copymapScheduleInitCfg{addcollect = [{_,_}|_]} ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_RiftCollectItemComplete);
						#copymapScheduleInitCfg{addcollect = [{_,_,_}|_]} ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_RiftCollectItemComplete);
						#copymapScheduleInitCfg{addcollect = [[_,_]|_]} ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_RiftCollectItemComplete);
						#copymapScheduleInitCfg{addcollect = [[_,_,_]|_]} ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_RiftCollectItemComplete);
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_RiftKillMonsterComplete)
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.