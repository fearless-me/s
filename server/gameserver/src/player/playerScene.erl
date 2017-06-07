%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%% 只处理场景切换相关
%%% @end
%%% Created : 13. 十月 2014 10:02
%%%-------------------------------------------------------------------
-module(playerScene).
-author("tiancheng").

-include("playerPrivate.hrl").

%% API
-export([
	onEnterGroup/1,
	onEnterBitGroup/1,

	onPlayerPetEnterGroup/0,
	onPetEnterGroup/2,          %% 宠物进入分组

	onRequestEnterMap/1,        %% 玩家进入场景
	onRequestEnterMap/2,
	onRequestEnterMap/3,
	onRequestEnterActivityMap/2,%% 玩家进入活动地图
	onRequestEnterActivityMap/4,%% 玩家进入活动地图指定坐标

	rob_requestEnterMap/4,	%% 机器人直接进入地图，不走切场景流程

	onRequestEnterGuildFairground/1,  %% 玩家进入家族游乐场

	canTransferMapAndSetNewTransferInfo/0,

	getMapType/1,
	getMapSubType/1,
	requestEnterMapAck/1,
	requestEnterMap_ByDirectAck/1,
	teamCopyMapCreateSuccess/1,

	canEnterMap/2,
	sendGMEnterMapLine/4,

	gm_requestEnterMap/4		%% gm进入目标地图目标位置
]).

%% 进入一个指定的分组
-spec onEnterGroup(GroupID::uint()) -> uint().
onEnterGroup(GroupID) ->
	OldGroupID = playerState:getGroupID(),
	case OldGroupID =:= GroupID of
		true ->
			?ERROR_OUT("onEnterGroup:enter same group:~p,~p,~p", [GroupID, OldGroupID, playerState:getRoleID()]);
		_ ->
			skip
	end,
	MapID = playerState:getMapID(),
	case getMapType(MapID) of
		?MapTypeCopyMap ->
			0;
		?MapTypeBitplane ->
			0;
		_ ->
			playerState:setGroupID(GroupID),
			GroupID
	end.

%% 进入一个位面分组
-spec onEnterBitGroup(BitMapID::uint()) -> uint().
onEnterBitGroup(BitMapID) ->
	MapID = playerState:getMapID(),
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeNormal} ->
			case getCfg:getCfgPStack(cfg_mapsetting, BitMapID) of
				#mapsettingCfg{type = ?MapTypeBitplane, subtype = ?MapSubTypeRift} ->
					%% 禁止进入时空裂痕
					?ERROR_OUT("onEnterBitGroup enter rift forbidden:~p,~p", [playerState:getRoleID(), BitMapID]),
					playerMsg:sendErrorCodeMsg(?ErrorCode_EnterRiftBitPlaneFailed),
					0;
				#mapsettingCfg{type = ?MapTypeBitplane, belongto = MapID} ->
					NewGroupID = groupBase:getNewGroupID(BitMapID),
					onEnterGroup(NewGroupID);
				#mapsettingCfg{type = ?MapTypeBitplane, show_name = Name} ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_SystemFromNowMapEnterBitMap, [Name]),
					?ERROR_OUT("11can not enter bitmap[~p] from[~p]", [BitMapID, MapID]),
					0;
				Err ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_EnterRiftBitPlaneFailed),
					?ERROR_OUT("22can not enter bitmap[~p] from[~p][~p]", [BitMapID, MapID, Err]),
					0
			end;
		Error ->
			?ERROR_OUT("33can not enter bitmap[~p] from[~p][~p]", [BitMapID, MapID, Error]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_Date_Map_NeedNormal),
			0
	end.

%% 让玩家所有的宠物都进入分组
-spec onPlayerPetEnterGroup() -> ok.
onPlayerPetEnterGroup() ->
	GroupID = playerState:getGroupID(),
	PetCodeList = playerState:getCallPetCodeList(),
	[onPetEnterGroup(Code, GroupID) || Code <- PetCodeList],
	ok.

%% 宠物进入分组
-spec onPetEnterGroup(PetCode::uint(), GroupID::uint()) -> boolean().
onPetEnterGroup(PetCode, GroupID) ->
	PetEts = playerState:getMapPetEts(),
	case myEts:lookUpEts(PetEts, PetCode) of
		[#recMapObject{groupID = OldGroupID}] when OldGroupID =/= GroupID ->
			%% 更新分组
			myEts:updateEts(PetEts, PetCode, {#recMapObject.groupID, GroupID}),

			%% 宠物进入分组先脱战
			monsterInterface:leaveBattle(PetCode),

			monsterInterface:setPetGroupID(PetCode, GroupID),

			%% 同步宠物数据
			playerMap:syncPetChangeGroupID(PetCode, OldGroupID, GroupID);
		_ ->
			false
	end.

%% 请求进入目标场景
-spec onRequestEnterMap(TargetMapID::uint()) -> boolean().
onRequestEnterMap(TargetMapID) when erlang:is_integer(TargetMapID)->
	MapCfg = core:getMapCfg(TargetMapID),
	Rec = #recPlayerEEMap{
		targetMapID = TargetMapID,
		targetMapPID = undefined,
		targetX = MapCfg#recGameMapCfg.initX,
		targetY = MapCfg#recGameMapCfg.initY,
		isRequireLeaveMap = true
	},
	requestEnterMap(Rec).

%% 请求进入目标场景，指定的路点
-spec onRequestEnterMap(TargetMapID::uint(), WayPointName::string()) -> boolean().
onRequestEnterMap(TargetMapID, WayPointName) ->
	case playerState:getCurHp() > 0 of
		true ->
			%%只有活着才能传地图
			case core:getMapWayPt(TargetMapID) of
				WayPtList when erlang:is_list(WayPtList) ->
					Key = string:to_lower(WayPointName),
					Ret = lists:keyfind(Key, #recMapWayPt.name, WayPtList),
					case Ret of
						#recMapWayPt{x = InitX,y = InitY} ->
							Rec = #recPlayerEEMap{
								targetMapID = TargetMapID,
								targetMapPID = undefined,
								targetX = InitX,
								targetY = InitY,
								isRequireLeaveMap = true
							},
							requestEnterMap(Rec);
						_ ->
							?ERROR_OUT("Error WayPt[~p] of MapId[~p] in WayPtList[~p],Key[~p]",[WayPointName,TargetMapID,WayPtList,Key]),
							playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapNoWayPt),
							false
					end;
				_ ->
					?ERROR_OUT("Error changeToMap[~p],cannot find it",[TargetMapID]),
					playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapNoMap),
					false
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailedPlayerDeadOrBattle)
	end.

%% 请求进入目标场景，指定的坐标
-spec onRequestEnterMap(TargetMapID::uint(), TargetX::float(), TargetY::float()) -> boolean().
onRequestEnterMap(TargetMapID, TargetX, TargetY) ->
	Rec = #recPlayerEEMap{
		targetMapID = TargetMapID,
		targetMapPID = undefined,
		targetX = TargetX,
		targetY = TargetY,
		isRequireLeaveMap = true
	},
	requestEnterMap(Rec).

%% 玩家进入家族游乐场
-spec onRequestEnterGuildFairground(GuildID::uint64()) -> boolean().
onRequestEnterGuildFairground(GuildID) ->
	ActStatus = playerState:getActionStatus(),
	if
		ActStatus =:= ?CreatureActionStatusMove ->
			%% 停止移动
			playerMove:stopMove(true),
			ok;
		true ->
			skip
	end,
	MapID = ?GuildFairgroundMapID,
	MapPid =
		case myEts:lookUpEts(?EtsGuildFairground, GuildID) of
			[#recGuildFairground{mapPid = MapPid_}] ->
				MapPid_;
			_ ->
				undefined
		end,
	MapCfg = core:getMapCfg(MapID),
	Rec = #recPlayerEEMap{
		targetMapID = MapID,
		targetMapPID = MapPid,
		targetX = MapCfg#recGameMapCfg.initX,
		targetY = MapCfg#recGameMapCfg.initY,
		isRequireLeaveMap = true,
		enterGuildFairgroundID = GuildID
	},
	requestEnterMap(Rec).

%% 请求进入目标活动场景
-spec onRequestEnterActivityMap(MapID::uint(), MapPID::pid() | undefined) -> boolean().
onRequestEnterActivityMap(MapID, MapPID) ->
	ActStatus = playerState:getActionStatus(),
	if
		ActStatus =:= ?CreatureActionStatusMove ->
			%% 停止移动
			playerMove:stopMove(true),
			ok;
		true ->
			skip
	end,
	MapCfg = core:getMapCfg(MapID),
	Rec = #recPlayerEEMap{
		targetMapID = MapID,
		targetMapPID = MapPID,
		targetX = MapCfg#recGameMapCfg.initX,
		targetY = MapCfg#recGameMapCfg.initY,
		isRequireLeaveMap = true
	},
	requestEnterMap(Rec).

%% 请求进入目标活动场景
-spec onRequestEnterActivityMap(MapID::uint(), MapPID::pid() | undefined, TX::float(), TY::float()) -> boolean().
onRequestEnterActivityMap(MapID, MapPID, TX, TY) ->
	ActStatus = playerState:getActionStatus(),
	if
		ActStatus =:= ?CreatureActionStatusMove ->
			%% 停止移动
			playerMove:stopMove(true),
			ok;
		true ->
			skip
	end,
	Rec = #recPlayerEEMap{
		targetMapID = MapID,
		targetMapPID = MapPID,
		targetX = TX,
		targetY = TY,
		isRequireLeaveMap = true
	},
	requestEnterMap(Rec).

%% 进入目标场景
-spec requestEnterMap(#recPlayerEEMap{}) -> boolean().
requestEnterMap(#recPlayerEEMap{targetMapID = TargetMapID} = Rec) ->
	RoleID = playerState:getRoleID(),
	case canEnterMap(TargetMapID, Rec) of
		true ->
			Ret =
				case getCfg:getCfgPStack(cfg_mapsetting, TargetMapID) of
					#mapsettingCfg{type = ?MapTypeCopyMap, daily_entercount = DailyEnterCount} = MapCfg ->
						%% 判断玩家是否有次数限制
						case playerCopyMap:checkEnterCopyMapDailyCount(MapCfg, TargetMapID, DailyEnterCount) of
							true ->
								true;
							_ ->
								?LOG_OUT("requestEnterMap copymap repeat:~p,~p", [RoleID, TargetMapID]),

								%% 次数不够用了，判断他是否存在地图
								RequestRec = getRecRequestEnterMap(Rec),

								%% 询问地图可以进入不
								core:sendMsgToMapMgr(TargetMapID, requestEnterMap_ByDirect, {RequestRec, {RequestRec, Rec}}),
								false
						end;
					_ ->
						true
				end,
			case Ret of
				true ->
					%% 如果是死亡状态，先立即强制复活
					revivePlayerEnterMap(),

					sendEnterMap(Rec);
				_ ->
					skip
			end,
			Ret;
		ErrorCode ->
			playerMsg:sendErrorCodeMsg(ErrorCode),
			false
	end.

%% gm 进入目标所在地图
-spec gm_requestEnterMap(TargetMapID::uint(),TargetMapPID::pid(),TargetX::float(),TargetY::float()) -> ok.
gm_requestEnterMap(TargetMapID,TargetMapPID,TargetX,TargetY) ->
	MapID = playerState:getMapID(),
	MapPID = playerState:getMapPid(),
	PetList = playerState:getCallPet(),
	PetCodeList = playerPet:getPetCodeList(PetList),

	%% gm自己先离开现在的地图
	psMgr:sendMsg2PS(MapPID, gm_leaveMap, {playerState:getPlayerCode(),PetCodeList}),

	{X, Y} = case playerState:getPos() of
				 undefined ->
					 {0.0, 0.0};
				 {X1, Y1} ->
					 {X1, Y1}
			 end,
	playerState:setOldMapPos(MapID, X, Y),

	%% 设置切换场景状态
	playerState:setActionStatus(?CreatureActionStatusChangeMap),

	%% 再直接进入新地图
	Rec = #recPlayerEEMap{
		targetMapID = TargetMapID,
		targetMapPID = TargetMapPID,
		targetX = TargetX,
		targetY = TargetY,
		isRequireLeaveMap = true
	},
	RequestRec = getRecRequestEnterMap(Rec),
	requestEnterMapAck({true, RequestRec}),
	ok.

rob_requestEnterMap(TargetMapID,TargetMapPID,TargetX,TargetY) ->
	%% 设置切换场景状态
	playerState:setActionStatus(?CreatureActionStatusChangeMap),

	%% 再直接进入新地图
	Rec = #recPlayerEEMap{
		targetMapID = TargetMapID,
		targetMapPID = TargetMapPID,
		targetX = TargetX,
		targetY = TargetY,
		isRequireLeaveMap = true
	},
	RequestRec = getRecRequestEnterMap(Rec),
	requestEnterMapAck({true, RequestRec}),
	ok.

sendEnterMap(#recPlayerEEMap{
	targetMapID = TargetMapID,
	targetMapPID = TargetMapPID,
	targetX = TargetX,
	targetY = TargetY } = Rec) ->
	IsFirst = playerState:isFirstEnterMap(),

	%% 设置切换场景状态
	playerState:setActionStatus(?CreatureActionStatusChangeMap),

	MapID = playerState:getMapID(),
	{X, Y} = case playerState:getPos() of
				 undefined ->
					 {0.0, 0.0};
				 {X1, Y1} ->
					 {X1, Y1}
			 end,

	%% 保存原来的位置
	case IsFirst of
		true ->
			%% 第一次进入地图，不要再次保存位置(可能造成重复进入同一地图的问题)
			skip;
		_ ->
			playerState:setOldMapPos(MapID, X, Y)
	end,

	%% 获取进入场景结构
	RequestRec = getRecRequestEnterMap(Rec),

	?LOG_OUT("requestEnterMap:nowpos={~p,~p},roleid=~p,nowmapid=~p,targetmapid=~p,tmappid=~p,tx=~p,ty=~p,first=~p,teamleaderid=~p,guildid=~p",
		[X,Y,playerState:getRoleID(),MapID,TargetMapID,TargetMapPID,TargetX,TargetY,IsFirst,
			RequestRec#recRequsetEnterMap.teamLeaderRoleID, RequestRec#recRequsetEnterMap.guildID]),

	%% 请求进入地图
	playerTeam:onPlayerChangeScene(MapID),
	core:sendMsgToMapMgr(MapID, requestEnterMap, RequestRec),
	ok.

sendGMEnterMapLine(TargetMapID,TargetX,TargetY, Line) ->
	%% 设置切换场景状态
	playerState:setActionStatus(?CreatureActionStatusChangeMap),
	IsFirst = playerState:isFirstEnterMap(),

	MapID = playerState:getMapID(),
	{X, Y} = case playerState:getPos() of
				 undefined ->
					 {0.0, 0.0};
				 {X1, Y1} ->
					 {X1, Y1}
			 end,

	%% 保存原来的位置
	case IsFirst of
		true ->
			%% 第一次进入地图，不要再次保存位置(可能造成重复进入同一地图的问题)
			skip;
		_ ->
			playerState:setOldMapPos(MapID, X, Y)
	end,

	Rec = #recPlayerEEMap{
		targetMapID = TargetMapID,
		targetMapPID = undefined,
		targetX = TargetX,
		targetY = TargetY,
		isRequireLeaveMap = true
	},
	RequestRec = getRecRequestEnterMap(Rec),
	RequestRec2 = RequestRec#recRequsetEnterMap{targetLine = Line},

	%% 请求进入地图
	core:sendMsgToMapMgr(MapID, requestEnterMap, RequestRec2),
	ok.

requestEnterMap_ByDirectAck({false, {#recRequsetEnterMap{isFirstEnterMap = true} = EnterMap, #recPlayerEEMap{} = Rec}}) ->
	?LOG_OUT("requestEnterMap_ByDirectAck:~p,~p,~p", [playerState:getRoleID(), EnterMap, Rec]),
	playerMsg:sendErrorCodeMsg(?ErrorCode_CopyMapCountLimit),
	reEnterMap(false),
	ok;
requestEnterMap_ByDirectAck({false, {#recRequsetEnterMap{isFirstEnterMap = false}, #recPlayerEEMap{}}}) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_CopyMapCountLimit),
	ok;
requestEnterMap_ByDirectAck({true, {_, #recPlayerEEMap{} = Rec}}) ->
	?LOG_OUT("requestEnterMap_ByDirectAck:~p,~p", [playerState:getRoleID(), Rec]),

	%% 如果是死亡状态，先立即强制复活
	revivePlayerEnterMap(),

	sendEnterMap(Rec),
	ok.

%% 请求进入地图的结果(允许进入地图放在第一行，确保优先匹配)
requestEnterMapAck({true, #recRequsetEnterMap{oldMapID = OldMapID, targetMapID = TMapID, targetMapPID = TMapPID} = Request}) ->
	?LOG_OUT("player:~p requestEnterMap[~p][~p] OK", [playerState:getRoleID(),TMapID,TMapPID]),
	
	%%清理伤害统计
	case lists:member(OldMapID, [?CrosArenaMapID1, ?CrosArenaMapID2, ?CrosArenaMapID3]) of
		true ->
			playerStatistics:clearCopyMapHurtStat();
		_ ->
			skip
	end,
	
	%% 允许进入
	case getCfg:getCfgByKey(cfg_mapsetting, TMapID) of
		#mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeMoneyDungeon} ->
			%% 金币副本（惊天喵盗团）特殊处理，出生点与路点分离
			#recGameMapCfg{
				colCellNum = ColCellNum,
				rowCellNum = RowCellNum,
				cellSize = CellSize,
				block = BlockBinary} = core:getMapCfg(TMapID),
			{TargetX, TargetY} = {InitX, InitY} = acMoneyDungeonLogic:configStartPointPlayer();
		_ ->
			#recGameMapCfg{
				colCellNum = ColCellNum,
				rowCellNum = RowCellNum,
				cellSize = CellSize,
				block = BlockBinary,
				initX = InitX,
				initY = InitY} = core:getMapCfg(TMapID),
			TargetX = Request#recRequsetEnterMap.targetX,
			TargetY = Request#recRequsetEnterMap.targetY
	end,

	EnterMap = #recEnterMap{
		pid = self(),
		code = playerState:getPlayerCode(),
		id  = playerState:getRoleID(),
		mapId = TMapID,
		camp = playerState:getCamp(),
		x = TargetX,
		y = TargetY,
		other = playerState:getCallPet()    % 宠物列表
	},

	%% 检查是否在阻挡内
	case mapView:isBlock(erlang:float(TargetX), erlang:float(TargetY), ColCellNum, RowCellNum, CellSize, BlockBinary) of
		true ->
			?WARN_OUT("player:~p requestEnter [~p] Map[~p](~p,~p) isBlock", [playerState:getRoleID(),TMapPID,TMapID,InitX,InitY]),
			psMgr:sendMsg2PS(TMapPID, enterMap, EnterMap#recEnterMap{x = InitX, y = InitY});
		_ ->
			psMgr:sendMsg2PS(TMapPID, enterMap, EnterMap)
	end,
	
	ok;
requestEnterMapAck({_,#recRequsetEnterMap{oldMapID = OldMapID, targetMapID = TargetMapID, enterGuildFairgroundID = EGuildID}}) when OldMapID =:= TargetMapID->
	%% 如果新地图与原来的地图相同则进入默认地图，这里在canEnterMap时就有判定是否是进入同一地图ID，所以理论上不会走到这里
	%% 但为了保险起见，保留此情况处理
	?LOG_OUT("player:~p requestEnterMap[~p] but Target is equal current mapID", [playerState:getRoleID(),TargetMapID]),
	DefaultMapID = globalCfg:getStartMap(),
	MapCfg = core:getMapCfg(DefaultMapID),
	Rec = #recPlayerEEMap{
		targetMapID = DefaultMapID,
		targetMapPID = undefined,
		targetX = MapCfg#recGameMapCfg.initX,
		targetY = MapCfg#recGameMapCfg.initY,
		isRequireLeaveMap = true,
		enterGuildFairgroundID = EGuildID
	},
	sendEnterMap(Rec);
requestEnterMapAck({ErrorCode, #recRequsetEnterMap{targetMapID = TargetMapID} = Request}) ->
	?ERROR_OUT("requestEnterMapAck errorcode:~p, request:~p", [ErrorCode, Request]),
	%%不管地图是否换地图成功，都需要把切换地图的状态清除掉
	playerState:setActionStatus(?CreatureActionStatusStand),
	case ErrorCode of
		?EnterMapErrorCode_CopyMapCreateFailed ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SystemErrorMapCfg);
		?EnterMapErrorCode_FirstEnterCopyMapButNotSchedule ->
			%% 上线就在副本，副本不存在，进入普通场景（还没有老地图，所以需要进入一个新的地图）
			?ERROR_OUT("player:~p request Enter Map[~p] failed by FirstEnterCopyMapButNotSchedule", [playerState:getRoleID(),TargetMapID]),
			reEnterMap(false);
		?EnterMapErrorCode_TeamMemberEnterWaitDestoryCopyMap ->
			%% 队伍的副本地图进程已经无效，又离开了原来的普通地图进程，但苦于没有权限创建新的副本地图
			%% 所以只好乖乖返回原来的地图呆到起
			?ERROR_OUT("player:~p request Enter Map[~p] failed by TeamMemberEnterWaitDestoryCopyMap", [playerState:getRoleID(),TargetMapID]),
			reEnterMap(false);
		?EnterMapErrorCode_CRITIAL ->
			%% 这种错误可能是策划没有配置相应的地图信息或者是启动地图子进程失败
			?ERROR_OUT("player:~p request Enter Map[~p] Ack create map failed", [playerState:getRoleID(),TargetMapID]),
			%% 请求进入新地图但创建新的地图进程失败，需要重新进入原来的地图
			reEnterMap(false),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed);
		?EnterMapErrorCode_CopyMapNotMsgData ->
			%% 离开地图时，发现该地图实际已经没有自己的相关信息了，可能是重复离开了多次
			%% 请求进入新地图但创建新的地图进程失败，需要重新进入原来的地图
			reEnterMap(false);
		?EnterMapErrorCode_EnterGuildHomeMap ->
			%%请求进入一个人数已满的军团驻地地图，需要进入原地图
			reEnterMap(false),
			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildHome_PlayerMoreEnterFailed);
		?EnterMapErrorCode_CopyMapLeaderNotStart ->
			%%组队情况下，进入一个队长还没有创建的副本，之前有所在地图，但还没有离开原地图
			case playerState:isFirstEnterMap() of
				true ->
					reEnterMap(false);
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_CopyMapLeaderNotStart)
			end;
		?EnterMapErrorCode_CopyMapMaxNum ->
			%%副本已经到达人数上限
			case playerState:isFirstEnterMap() of
				false ->
					skip;
				_ ->
					reEnterMap(false)
			end,
			playerMsg:sendErrorCodeMsg(?ErrorCode_CopyMapMaxNum);
		?EnterMapErrorCode_NoTeam ->
			case playerState:isFirstEnterMap() of
				false ->
					skip;
				_ ->
					reEnterMap(false)
			end,
			playerMsg:sendErrorCodeMsg(?ErrorCode_TeamNotJoin);
		?EnterMapErrorCode_PlayerNoBelongCopyMap ->
			case playerState:isFirstEnterMap() of
				false ->
					skip;
				_ ->
					reEnterMap(false)
			end,
			playerMsg:sendErrorCodeMsg(?ErrorCode_PlayerNotBelongCopyMap);
		?EnterMapErrorCode_CopyMapIsForceDestroy ->
			case playerState:isFirstEnterMap() of
				false ->
					skip;
				_ ->
					reEnterMap(false)
			end,
			playerMsg:sendErrorCodeMsg(?ErrorCode_TargetCopyMapIsInDestroy);
		_ ->
			%% 还没有离开原来的地图，所以出现此情况不需要进入新地图
			?ERROR_OUT("player:~p request Enter Map[~p] Ack failed by:~p", [playerState:getRoleID(),TargetMapID,ErrorCode]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
	end,
	ok.

-spec reEnterMap(IsRequireLeaveMap) -> ok when IsRequireLeaveMap::boolean().
reEnterMap(IsRequireLeaveMap) ->
	{OldMapID, OldX, OldY} = playerState:getOldMapPos(),
	Rec =
		case getMapType(OldMapID) =/= ?MapTypeNormal of
			true ->
				%% 进入默认地图
				DefaultMapID = globalCfg:getStartMap(),
				MapCfg = core:getMapCfg(DefaultMapID),
				#recPlayerEEMap{
					targetMapID = DefaultMapID,
					targetMapPID = undefined,
					targetX = MapCfg#recGameMapCfg.initX,
					targetY = MapCfg#recGameMapCfg.initY,
					isRequireLeaveMap = IsRequireLeaveMap
				};
			_ ->
				#recPlayerEEMap{
					targetMapID = OldMapID,
					targetMapPID = undefined,
					targetX = OldX,
					targetY = OldY,
					isRequireLeaveMap = IsRequireLeaveMap
				}
		end,
	?LOG_OUT("reEnterMap:~p,~p,OldMapID=~p,~p", [playerState:getRoleID(),IsRequireLeaveMap,OldMapID,Rec]),
	sendEnterMap(Rec),
	ok.

%% 创建组队副本成功
-spec teamCopyMapCreateSuccess({MapID::uint(),MapPID::pid()}) -> ok.
teamCopyMapCreateSuccess({MapID, MapPID}) ->
	TeamID = playerState:getTeamID(),
	RoleID = playerState:getRoleID(),

	?LOG_OUT("teamCopyMapCreateSuccess:roleid=~p,teamid=~p,mapid=~p,mappid=~p",
		[RoleID, TeamID, MapID, MapPID]),
	case erlang:is_integer(TeamID) andalso TeamID > 0 of
		true ->
			%% 通知队友，可以进入副本
			playerTeamCopyMap:inviteMemberToCopyMap(TeamID, RoleID, MapID);
		_ ->
			skip
	end,
	ok.

%% 能否进入地图
-spec canEnterMap(TargetMapID::uint(), Data::false | #recPlayerEEMap{}) -> true | uint().
canEnterMap(TargetMapID, Data) ->
	case playerState:getGroupID() > 0 of
		true ->
			%% 分组中不允许切换场景
			?ERROR_OUT("canEnterMap.failed:~p,~p,~p group", [playerState:getRoleID(),playerState:getPlayerCode(),TargetMapID]),
			?ErrorCode_SystemBitMapPlaneChangeSceneFailed;
		false ->
			case playerState:isFirstEnterMap() of
				false ->
					PlayerStatus = playerState:getActionStatus(),
					case PlayerStatus =:= ?CreatureActionStatusChangeMap of
						true ->
							?ERROR_OUT("canEnterMap.failed:~p,~p,~p status error,Changing Map",
								[playerState:getRoleID(),playerState:getPlayerCode(),TargetMapID]),
							?ErrorCode_SystemChangeMapFailed;
						false ->
							NowMapID = playerState:getMapID(),
							#mapsettingCfg{type = TargetMapType, timestep = TimeStep} = getCfg:getCfgPStack(cfg_mapsetting, TargetMapID),
							%#mapsettingCfg{type = NowMapType, subtype = NowSubType} = getCfg:getCfgPStack(cfg_mapsetting, NowMapID),
							CanEnter =
								case TimeStep of
									undefined -> true;
									0 -> true;
									[0, _] -> true;
									[_, 0] -> true;
									[ST, ET] when ST < ET ->
										{{_Year, _Month, _Day}, {Hour, Minute, _Second}} = time2:getLocalDateTime(),
										Time = Hour * 100 + Minute,
										Time >= ST andalso Time =< ET;
									[ST, ET] when ST > ET ->
										{{_Year, _Month, _Day}, {Hour, Minute, _Second}} = time2:getLocalDateTime(),
										Time = Hour * 100 + Minute,
										Time >= ST orelse Time =< ET;
									_ -> true
								end,
							case CanEnter of
								true -> canEnterMap(TargetMapType, NowMapID, TargetMapID, Data);
								_ -> ?ErrorCode_SystemNotInTimeChangeSceneFailed
							end
					end;
				true -> true
			end
	end.

%% 判断能否传送，并设置最新传送与CD时间
-spec canTransferMapAndSetNewTransferInfo() -> boolean().
canTransferMapAndSetNewTransferInfo() ->
	#globalsetupCfg{setpara = [NorCDTime]} = getCfg:getCfgPStack(cfg_globalsetup, map_convey),
	VipCDTime = playerVipInter:getTransferTime(NorCDTime), % 爵位减少之后的CD时间
	CD = case playerState:getTransferMapCDTime() of
		     undefined ->
			     %% 第一次传送
			     playerState:setTransferMapCDTime(VipCDTime),
			     0;
		     CDTime ->
			     %% 把最小的一个CD设为CD时间
			     MinCD = erlang:min(VipCDTime, CDTime),
			     playerState:setTransferMapCDTime(MinCD),
			     MinCD
	     end,

	NowTime = time:getUTCNowSec(),  % 当前时间
	LastTransferTime = playerState:getTransferMapTime(),    % 上次传送的时间

	case NowTime - LastTransferTime >= CD of
		true ->
			playerState:setTransferMapTime(NowTime),
			true;
		_ -> false
	end.
	
%% 能否进入场景
-spec canEnterMap(map_type(), NowMapID::uint(), TargetMapID::uint(), Data::false | #recPlayerEEMap{}) -> true | uint().
canEnterMap(?MapTypeNormal, NowMapID, TargetMapID, _Data) ->
	%% 进入普通场景
	case getMapType(NowMapID) =:= ?MapTypeNormal of
		false -> true;
		true ->
			CurHp = playerState:getCurHp(),
			if
				NowMapID =:= TargetMapID ->
					%% 源地图与目标地图相同
					?ERROR_OUT("canEnterMap.failed:roleid=~p map[~p] to targetmapid=[~p] same",
						[playerState:getRoleID(),NowMapID,TargetMapID]),
					?ErrorCode_SystemTheSameMapChangeSceneFailed;
				CurHp =< 0 ->
					%% 死亡状态不能切换地图
					?ERROR_OUT("canEnterMap.failed:roleid=~p map[~p] to targetmapid=[~p] hp =< 0",
						[playerState:getRoleID(),NowMapID,TargetMapID]),
					?ErrorCode_SystemDeadChangeSceneFailed;
				true -> true
			end
	end;
canEnterMap(?MapTypeActivity, NowMapID, TargetMapID, Data) ->
	%% 进入活动场景
	CurHp = playerState:getCurHp(),
	if
		CurHp =< 0 ->
			%% 死亡状态不能切换地图
			?ERROR_OUT("canEnterMap.failed:roleid=~p map[~p] to targetmapid=[~p] activity hp =< 0",
				[playerState:getRoleID(),NowMapID,TargetMapID]),
			?ErrorCode_SystemDeadChangeSceneFailed;
		NowMapID =:= TargetMapID andalso TargetMapID =:= ?GuildFairgroundMapID ->
			%% 源地图与目标地图相同（家族-游乐场）
			IsCanEnter =
				case Data of
					#recPlayerEEMap{enterGuildFairgroundID = GuildFairgroundID}
						when GuildFairgroundID > 0 ->
						playerGuildFairground:isCanEnter(GuildFairgroundID);
					_ ->
						false
				end,
			case IsCanEnter of
				true ->
					true;
				false ->
					?ERROR_OUT("canEnterMap.failed to guildfairground:roleid=~p map[~p] to targetmapid=[~p] activity same or enterGuildFairgroundID is 0",
						[playerState:getRoleID(),NowMapID,TargetMapID]),
					?ErrorCode_SystemTheSameMapChangeSceneFailed
			end;
		NowMapID =:= TargetMapID ->
			%% 源地图与目标地图相同
			?ERROR_OUT("canEnterMap.failed:roleid=~p map[~p] to targetmapid=[~p] activity same",
				[playerState:getRoleID(),NowMapID,TargetMapID]),
			?ErrorCode_SystemTheSameMapChangeSceneFailed;
		true -> true
	end;
canEnterMap(?MapTypeCopyMap, NowMapID, TargetMapID, _Data) ->
	%% 进入副本场景
	CurHp = playerState:getCurHp(),
	if
		CurHp =< 0 ->
			%% 死亡状态不能切换地图
			?ERROR_OUT("canEnterMap.failed:roleid=~p map[~p] to targetmapid=[~p] copymap hp =< 0",
				[playerState:getRoleID(),NowMapID,TargetMapID]),
			?ErrorCode_SystemDeadChangeSceneFailed;
		true -> playerCopyMap:canEnterCopyMap_NotJudgeTimes(TargetMapID)
	end;
canEnterMap(Other, NowMapID, TargetMapID, _Data) ->
	?ERROR_OUT("canEnterMap.failed:roleid=~p map[~p] to targetmapid=[~p] unknowtype Other=~p",
		[playerState:getRoleID(),NowMapID,TargetMapID,Other]),
	?ErrorCode_SystemChangeMapFailed.

%% 获取场景类型
-spec getMapType(MapID::uint()) -> map_type().
getMapType(MapID) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = Type} -> Type;
		_ -> 999
	end.
%% 获取场景类型
-spec getMapSubType(MapID::uint()) -> map_type().
getMapSubType(MapID) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{subtype = SubType} -> SubType;
		_ -> 9999
	end.

getRecRequestEnterMap(#recPlayerEEMap{targetMapID = TargetMapID} = Rec) ->
	PetList = playerState:getCallPet(),
	PetCodeList = playerPet:getPetCodeList(PetList),

	#mapsettingCfg{type = Type, subtype = SubType} = getCfg:getCfgPStack(cfg_mapsetting, TargetMapID),
%%	{TeamID, GuildID} =
%%		case Type =:= ?MapTypeCopyMap andalso SubType =:= ?MapSubTypeGuild of
%%			true ->
%%				{playerState:getTeamID(?PlayerTeamTypeGuildCopy), playerState:getGuildID()};
%%			_ ->
%%				{playerState:getTeamID(), 0}
%%		end,
%%	TeamLeaderID = team:getTeamLeaderID(TeamID),


	{TeamID, GuildID, TeamLeaderID} =
		case Type =:= ?MapTypeCopyMap andalso SubType =:= ?MapSubTypeGuild of
			true ->
				{0, playerState:getGuildID(), playerGuildCopy:getGuildCopyMapOwnerID()};
			_ ->
				TID = playerState:getTeamID(),
				TLID =
					case core:isCross() of
						true ->
							playerState:getRoleID();
						_ ->
							teamInterface:getLeaderIDWithTeamID(TID)
%%							team2:getTeamLeaderID(TID)
					end,

				{TID, 0, TLID}
		end,
%%			todo 军团多人本修改
	#recRequsetEnterMap{
		code = playerState:getPlayerCode(),
		roleID = playerState:getRoleID(),
		roleLevel = playerState:getLevel(),
		rolePID = self(),
		isFirstEnterMap = playerState:isFirstEnterMap(),
		isRequireLeaveMap = Rec#recPlayerEEMap.isRequireLeaveMap,
		oldMapID = playerState:getMapID(),
		oldMapPID = playerState:getMapPid(),
		targetMapID = TargetMapID,
		targetMapPID = Rec#recPlayerEEMap.targetMapPID,
		targetX = Rec#recPlayerEEMap.targetX,
		targetY = Rec#recPlayerEEMap.targetY,
		teamID = TeamID,
		teamLeaderRoleID =  TeamLeaderID,
		petCodeList = PetCodeList,
		guildID = GuildID,
		enterGuildFairgroundID = Rec#recPlayerEEMap.enterGuildFairgroundID
	}.

%% 如果是死亡状态，先立即强制复活
revivePlayerEnterMap() ->
	case playerState:getCurHp() > 0 of
		true ->
			skip;
		_ ->
			?LOG_OUT("requestEnterMapAck:true, but player dead. onRevive!~ts,~p", [playerState:getName(),playerState:getRoleID()]),
			playerRevive:requestRevive_Unconditional(),
			%% 复活后sleep一段时间
			timer:sleep(800)
	end,
	ok.