%%%
%%%玩家地图相关处理

-module(playerMap).
-author(zhongyuanwei).

-include("playerPrivate.hrl").

-define(TransferOffline, 4).		%% 传送好友不在线（跟好友不在线用的同一个通知码）
-define(TransferWaitTime, 200).		%% 如果传送时，角色在移动，停止移动所需的等待时间

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	dealEnterMapAck/1,
	sync9GridInfo/0,
	syncNearObjectToClient/1,
	notifyNewPlayerInView/2,
	notifyNewPlayerInViewAck/2,
	parkDisappearPlayer/1,
	syncChangePos/5,
	syncChangeGroupID/2,
	syncPetChangeGroupID/3,
	dealEnteredGame/1,
	dealOnlyEnteredGame/1,
	syncPlayerToEts/0,
	syncPlayerNetPidToEts/1,
	findMonsterInfoList/1,
	findNpcInfoList/1,
	findCollectInfoList/1,
	findUseItemInfoList/1,
	makePlayerBaseInfo/0,
	tryGetFriendPos/1,
	transfer2NewPos/3,
	onTransferPosAck/3,
	onLaterTransferPosAck/3,
	makeGroupPlayerInfo/0,
	repeatSync9GridPlayerAndPet/0,
	querySyncTargetCode/1,
	resetPosToRevivePt/0,
	getMapRevivePt/1,
	playerRealEnterMap/0,
	tickScreenSync9GridInfo/0,
	addScreenPKPlayer/1
]).

%%玩家请求进入地图反馈处理
-spec dealEnterMapAck(Ack) -> ok when
	Ack::#enterMapInfo{}.
dealEnterMapAck(#enterMapInfo{
	mapid = MapID,
	x = X,
	y = Y,
	mapPlayerEts = MapPlayerEts,
	mapPetEts = MapPetEts,
	mapNpcEts = MapNpcEts,
	mapMonsterEts = MapMonsterEts,
	mapPid = MapPid,
	mapLine = MapLine,
	mapCollectEts = MapCollectEts,
	mapUseItemEts = MapUseItemEts,
	mapScreenEts = ScreenEts
}) ->
	case playerState:getRunStep() =:= ?PlayerStateSaveAndLogout of
		true ->
			%%在地图切换过程中下线了，这里需要通知新的地图进程玩家已经下线了
			PlayerCode = playerState:getPlayerCode(),
			PetCodeList = playerState:getCallPetCodeList(),
			playerPet:clearAllPets(),
			?WARN_OUT("RoleID:~p already offline,notify mapPid:~p",[playerState:getRoleID(),MapPid]),
			psMgr:sendMsg2PS(MapPid, playerOffline, {PlayerCode, PetCodeList});
		_ ->
			RoleID = playerState:getRoleID(),
			%%CodeID = playerState:getPlayerCode(),
			%%?LOG_OUT("self[~p] Role[~p] and Code [~p] enter mapid[~p] line[~p],Pos[~p] ok",[self(), RoleID,CodeID,MapID,MapLine,{X,Y}]),

			playerState:setMapPid(MapPid),
			playerState:setMapPlayerEts(MapPlayerEts),
			playerState:setMapPetEts(MapPetEts),
			playerState:setMapMonsterEts(MapMonsterEts),
			playerState:setMapNpcEts(MapNpcEts),
			playerState:setMapCollectEts(MapCollectEts),
			playerState:setMapUseItemEts(MapUseItemEts),
			playerScreen:setMapScreenEts(ScreenEts),
			playerState:setMapLine(MapLine),

			case playerState:getCurHp() =< 0 of
				true ->
					?ERROR_OUT("dealEnterMapAck player(~p) is dead", [RoleID]),
					playerRevive:requestRevive_Unconditional();
				_ -> skip
			end,

			%%同步NetPid必须在setMapPlayerEts之后调用
			syncPlayerNetPidToEts(playerState:getNetPid()),

			%%强制修改为和平状态
			case playerState:isFirstEnterMap() of
				false ->
					%% 设置为玩家阵营
					playerState:setCamp(?CampPlayer, true),
					playerPk:forcePeace(MapID);
				_ ->
					skip
			end,

			%如果在战斗状态中,需要先通知对方脱离战斗
			Code = playerState:getPlayerCode(),
			playerBattle:leaveBattle(Code),

			%%清除玩家的移动列表
			playerState:setMoveTargetList([]),
			playerState:setMapID(MapID),
			%%这里只设置位置，不处理位置改变需要同步给客户端的相关物件信息，因为在玩家进入地图后，会同步相关物件信息
			playerState:setPosOnly(X, Y),
			%%?LOG_OUT("Player New Pos ~p", [playerState:getPos()]),
			%% 进入地图，设置分组ID为0
			playerState:setGroupIDOnly(0),

			%由于快捷组队，将MapID=0,重置为普通队伍
%%			TeamID = playerState:getTeamID(?PlayerTeamTypeNormal),
%%			case TeamID > 0  of
%%				true->
%%					case team2:getTeamInfoByTeamID(TeamID) of
%%						#rec_team{ members = Member ,mapID = MapID } ->
%%							case length(Member) =< ?MAX_TeamMemberNum andalso MapID > 0 of
%%								true->
%%									Msg2 = (#pk_GS2U_FastTeamSucc{ time = 0 }),
%%									[playerMsg:sendNetMsg(NetPid, Msg2) || #recTeamMemberInfo{netPid = NetPid} <- Member, is_pid(NetPid)];
%%								_ -> skip
%%							end;
%%						_ -> ok
%%					end,
%%					teamOtp2:send2me(updateTeamInfo,{TeamID,[{#rec_team.mapID,0}]});
%%				_ -> skip
%%			end,

			%%更新在队伍中的地图ID
%%			playerTeam2:syncInfoToTeam(?PlayerTeamTypeNormal, [{#recTeamMemberInfo.mapID,MapID},{#recTeamMemberInfo.mapPid,MapPid}]),
%%			notifyTeamMemberMapID(MapID),
			
			%% 活动的特殊处理
			if
				?HDBattleMapID =:= MapID ->
					%% 强制改为单人杀戮状态
					playerTeam:leaveTeam(false);
%%					case playerState:getTeamID() > 0 of
%%						true ->
%%							%% 离开队伍
%%							playerTeam2:leaveTeam(?PlayerTeamTypeNormal);
%%						_ ->
%%							skip
%%					end;
				?CrosHdBattleMapID =:= MapID ->
					skip;
			%%Camp = playerState:getCrosCamp(),
			%%playerState:setCamp(Camp, true);
				true ->
					skip
			end,
			playerRob:enterMapIng(MapID),
			playerEscort:onEnterMap(MapID),
			playerDarkness:playerEnterMap(MapID),
			playerGuildExpedition:playerEnterMap(MapID),

			%%同步玩家信息到地图进程
			syncPlayerAllToEts(),

			%% 更新成就进度
			playerAchieve:achieveEvent(MapID),
			%%更新活跃
			playerliveness:livenessJoinEvent(MapID),

			%% gm 传送到目标玩家的身边时，如果对象有分组，则进入分组
			TGroupID = playerState:getGMSSTargetGroupID(),
			case TGroupID > 0 of
				true ->
					playerScene:onEnterGroup(TGroupID);
				_ ->
					skip
			end,

			%% 宠物进入分组
			playerScene:onPlayerPetEnterGroup(),
			playerMsg:sendNetMsg(#pk_Any_ChangeMap{mapId = MapID,x = X,y = Y}),
			playerState:setWaitClientAckEnteredMap(true),

			%% 最后处理双人坐骑进入
			playerPetDouble:onChangeMap(),

			%% 解除冥想
			playerOfflineExp:endMeditation(),

			%%设置等待客户端发送切换地图完成的消息的超时时间，如果超时则把玩家的状态设置为站立状态，让其可以由服务器切地图
			TimerRef = erlang:send_after(?WaitClientSendEnteredMapTime,self(),waitClientEnteredMapTimeOut),
			playerState:setWaitClientAckEnteredMapRef(TimerRef),
			?LOG_OUT("RoleID:~p dealEnterMapAck mapID:~p, MapPid:~p, Pos: ~p, ~p", [RoleID, MapID, MapPid, X, Y])
	end,
%%	playerWorldBossWar:onLeaveWorldBossMap(MapID),
	playerAcKingBattleAll:changeMap(MapID),
	case ?CrosHdBattleMapID =:= MapID of
		true ->
%%			case playerState:getTeamID() > 0 of
%%				true ->
%%					%% 离开队伍
%%					playerTeam2:leaveTeam(?PlayerTeamTypeNormal);
%%				_ ->
%%					skip
%%			end,
			playerTeam:leaveTeam(false),
			{Camp, MapPID, Msg} = playerState:getCrosCamp(),
			playerState:setCamp(Camp, true),
			psMgr:sendMsg2PS(?PsNameCrosHd, enterMapSuc, {Camp, MapPID, Msg});
		_ ->
			skip
	end,
	case lists:member(MapID, ?CrosArenaMapIDList) of
		true ->
%%			case playerState:getTeamID() > 0 of
%%				true ->
%%					%% 离开队伍
%%					playerTeam2:leaveTeam(?PlayerTeamTypeNormal);
%%				_ ->
%%					skip
%%			end,
			playerTeam:leaveTeam(false),
			{Camp1, MapPID1, RoleID1} = playerState:getCrosArenaCamp(),
			playerState:setCamp(Camp1, true),
			psMgr:sendMsg2PS(?PsNameCrosArena, enterMapSuc, {Camp1, MapPID1, RoleID1});
		_ ->
			skip
	end,

%%	PetInfo = playerState:getEveCrossPet(),
%%	case core:isCross() of
%%		true ->
%%			playerPet:petShow();
%%		false when erlang:is_record(PetInfo,recPetInfo) ->
%%			playerState:setEveCrossPet(false),
%%			playerPet:petShow();
%%		_ ->skip
%%	end,
	ok;
%%进入的目标地图(普通地图)进程将要销毁，需要重新进入一个新的地图进程
dealEnterMapAck({waitDestory,MapID,X,Y}) ->
	RoleID = playerState:getRoleID(),
	case playerState:getRunStep() =/= ?PlayerStateSaveAndLogout of
		true ->
			%%之前请求进入地图时有设置为切换地图状态，但在切换过程中发现目标地图将要销毁，
			%%这里需要重新走一下切换地图的流程，但该流程不能是切换地图状态，所以这里需要改为站立状态
			playerState:setActionStatus(?CreatureActionStatusStand),

			case playerScene:getMapType(MapID) of
				?MapTypeNormal ->
					%% 继续进入，分重新分配线路
					?LOG_OUT("map waitDestory, enter normal:RoleID=~p,~p", [RoleID, MapID]),
					playerScene:onRequestEnterMap(MapID,X,Y);
				_ ->
					%% 回到原地图所在地
					{OldMapID, OldX, OldY} = playerState:getOldMapPos(),
					?LOG_OUT("map waitDestory, enter normal:RoleID=~p,~p, enter old map=~p", [RoleID, MapID, OldMapID]),
					playerScene:onRequestEnterMap(OldMapID, OldX, OldY)
			end;
		_ ->
			%%如果是在地图切换过程中下线，则不再请求重新进入
			?WARN_OUT("Map waitDestory,RoleID:~p already offline,drop enter MapID:~p",[RoleID, MapID])
	end,
	ok.

%% 玩家真正进入地图
-spec playerRealEnterMap() -> ok.
playerRealEnterMap() ->
	MapId = playerState:getMapID(),
	?LOG_OUT("player[~p] recv enteredMap[~p]",[playerState:getRoleID(),MapId]),
	case playerState:getWaitClientAckEnteredMapRef() of
		undefined ->
			skip;
		Timer ->
			erlang:cancel_timer(Timer)
	end,
	PlayerCode = playerState:getPlayerCode(),
	playerMap:dealEnteredGame(0),

	%%玩家跨场景(包括位面)移除buff
	playerBuff:delBuffByScene(),

	%% 玩家进入地图
	playerDarkness:playerEnterMapReal(),
	playerGuildWar:playerEnterMapReal(),
	playerGuildBattle:playerEnterMapReal(),
	playerGuildFairground:callbackEnter(),
	playerRob:enterMapReal(MapId),
	playerGuildExpedition:playerEnterMapReal(),
	playerMaterialCopy:playerEnterMapReal(MapId),
	playerGuildSnowman:init_EnterFamilyMapOrOnline(MapId),

	%% 判断是否刷新军团成就
	case playerState:getGuildID() > 0 of
		true ->
			playerAchieve:achieveEvent(?Achieve_Social_Event5, [1]);
		_ ->
			skip
	end,

	%% 刷新骑宠成就
	%%playerPet:updatePetAchieveEvent(),
	playerConvoy:playerEnterMapReal(),
	playerCopyMap:enterMapHook({MapId, playerState:getMapPid()}),

	%% 告诉地图进程，我上线了，可以做一些处理
	psMgr:sendMsg2PS(playerState:getMapPid(), playerEntermap, {PlayerCode, playerState:getGroupID()}),
	ok.

%%客户端已经装载完成地图资源，进入地图场景,发送玩家数据(不删除buff等，仅作进入场景)
-spec dealOnlyEnteredGame(N) -> ok when N::uint().
dealOnlyEnteredGame(N) ->
	playerState:setWaitClientAckEnteredMap(false),
	playerState:setActionStatus(?CreatureActionStatusStand),
	syncPlayerToEts(),
	case playerState:getRunStep() of
		?PlayerStateRun ->
			?DEBUG_OUT("Changed Map[~p] Pos~p", [playerState:getMapID(),playerState:getPos()]),
			syncAllMapObjectTypes(),
			sync9GridInfo(),
			%% 发送我的宠物信息给自己
			syncPetToClient([playerState:getPlayerCode()]),
			%% 姻缘系统：进入地图时重置夫妻技能状态
			playerMarriage:resetSkill(true, true);
		?PlayerStateLoadRoleOK ->
			?LOG_OUT("role:~p Entered Map[~p]", [playerState:getRoleID(),playerState:getMapID()]),
			%case playerFriend2:maybeBeBan() of
			%	true ->
			%		skip; %% 要被T了，后续无处理
			%	_ ->
					%%设置玩家状态为运行状态
					playerState:setRunStep(?PlayerStateRun),
					playerState:delFirstEnterMap(),

					playerBase:firstEnterWorld(),

					try
						sendRoleInfo()
					catch
						_:Err ->
							?ERROR_OUT("dealOnlyEnteredGame ~p ~p",[Err,erlang:get_stacktrace()])
					end,
					syncAllMapObjectTypes(),
					sync9GridInfo(),

					playerBase:tickPlayer(),

					playerChat:initChatCd(),

					%%玩家登陆完成后初始化宠物
					playerPet:initPetBattle(),

					%% 玩家登陆后，初始化军团技能属性
					playerGuildSkillAndBuff:initPlayerGuildSkill(),
					% 玩家登录有礼(玩家进程) 登录时，升级时
					RoleID = playerState:getRoleID(),
					psMgr:sendMsg2PS(self(), checkLoginAward, { RoleID, playerState:getAwardTakens(), playerState:getLevel() }),

					case core:isCross() of
						true ->skip;
						_ ->
							%%玩家登录，初始翅膀
							playerWing:initWing()
					end,

					%%玩家登陆，重置竞技场积分
					playerCrosTeam:onlineUpdateInte(),

					case playerState:getPlayerOldCode() /= undefined orelse core:isCross() of
						true ->skip;
						_ ->
							playerLogin:broadcaseSelf()
					end,

			%% 最后刷新战力
			%% 先设置为0，以便战力数据强制同步给客户端
			playerPropSync:setInt64(?PriProp_PlayerForce, 0),
			playerForce:calcPlayerForce(true),

					%% 注册到playerMgrOtp管理进程
					sendPlayerOnLineMsgToMainPro();
		%	end;
		?PlayerStateLoadRole ->
			%%如果客户端已经装载地图完成，但服务器这边还没有从数据库读取完角色数据，需要等待读取完成才发送给客户端
			%%注意，这里不能使用timer:sleep函数等待后再执行本函数，否则数据库返回过来的数据无法接收处理。
			case N < 5 of
				true ->
					?WARN_OUT("dealOnlyEnteredGame send_after dealEnteredMap roleID=~p wait load n=~p", [playerState:getRoleID(),N]),
					erlang:send_after(2000,self(),{dealEnteredMap,N + 1});
				_ ->
					%%一直都还没有消息过来，有异常？退出
					%%通知网络进程退出
					?ERROR_OUT("dealOnlyEnteredGame roleID=~p kickOut", [playerState:getRoleID()]),
					psMgr:cast(playerState:getNetPid(), kickOut, ?OffLineTypeLoadDataFailed)
			end;
		RunStep ->
			?ERROR_OUT("accountID:~p error runstep[~p] in dealEnteredMap",[playerState:getAccountID(),RunStep])
	end,

	%% 等一秒钟重新同步九宫格的玩家和宠物
%%	erlang:send_after(1000, self(), repeatSync9GridPlayerAndPet),
	ok.


%%客户端已经装载完成地图资源，进入地图场景,发送玩家数据
-spec dealEnteredGame(N) -> ok when N::uint().
dealEnteredGame(N) ->
	dealOnlyEnteredGame(N).

%% 重新同步九宫格的玩家和宠物
-spec repeatSync9GridPlayerAndPet() -> ok.
repeatSync9GridPlayerAndPet() ->
	{X,Y} = playerState:getPos(),
	PlayerView = mapView:getNearRectByPos(X, Y),

	%%玩家
	NetPid = playerState:getNetPid(),
	PlayerEts = playerState:getMapPlayerEts(),
	PlayerList = mapView:getNearViewObject(playerState:getMapPid(),PlayerEts, ?ObjTypePlayer, PlayerView, playerState:getGroupID()),
	PlayerCode = playerState:getPlayerCode(),
	LookInfoPlayer = getLookInfoPlayer(),
	SelfPubPropList = playerPropSync:getPubPropValueList(),
	Fun =
		fun(NearPlayer) ->
			case NearPlayer#recMapObject.code /= PlayerCode of
				true ->
					%%通知其他玩家本玩家信息
					NearPid = NearPlayer#recMapObject.pid,
					psMgr:sendMsg2PS(NearPid,notifyNewPlayerInView,{NetPid,LookInfoPlayer,SelfPubPropList});
				_ ->
					skip
			end
		end,
	lists:foreach(Fun, PlayerList),

	%% 宠物
%%	syncPetToClient(PlayerList),
	ok.

%%玩家进程用发给main进程,做调度用
-spec sendPlayerOnLineMsgToMainPro()-> ok.
sendPlayerOnLineMsgToMainPro()->
	case playerState:getIsPlayer() of
		true ->
			PlayerCode = playerState:getPlayerCode(),
			%PlayerName = playerState:getName(),
			PlayerID = playerState:getRoleID(),
			?LOG_OUT("sendPlayerOnLineMsgToMainPro:~p", [PlayerID]),

			AccountID = playerState:getAccountID(),
			%Account = playerState:getAccount(),

			myEts:updateEts(ets_rec_OnlinePlayer, PlayerID, [{#rec_OnlinePlayer.pid, self()},
				{#rec_OnlinePlayer.playerSaveTime,time:getUTCNowMS()},
				{#rec_OnlinePlayer.code, PlayerCode}]),

			%% 通知db玩家上线
			gsSendMsg:sendMsg2DBServer(playerOnline, AccountID, PlayerID),

			%% 更新一下内存数据
			playerRank:updatePlayerKeyInfo(),

			%% 更新一下自己的内存模型
			playerRank:updatePlayerDataInfo(),

			%% 更新混沌战场活动进程
			core:sendMsgToActivity(?ActivityType_HDBattle, playerOnline, {PlayerID,self(),playerState:getNetPid()}),

			%% 将新上线的角色添加到LBS相关的计算队列
			psMgr:sendMsg2PS(?PsNameFriend2LBS, friend2_online, PlayerID),

			ok;
		_ ->
			skip
	end,
	ok.

%% 传送到目标角色位置
-spec tryGetFriendPos(TargetRoleID) -> ok when
	TargetRoleID :: uint().
tryGetFriendPos(TargetRoleID) when erlang:is_integer(TargetRoleID) andalso TargetRoleID > 0 ->
	case playerMgrOtp:getOnlinePlayerInfoByID(TargetRoleID) of
		#rec_OnlinePlayer{pid = Pid} ->
			psMgr:sendMsg2PS(Pid, getTransferPos, {});
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_ChatErrorReceiverOffLine),
			skip
	end,
	ok.

%% 传送到一个新的地图位置
-spec transfer2NewPos(MapID :: uint(), PosX :: float(), PosY :: float()) -> ok.
transfer2NewPos(MapID, PosX, PosY) when erlang:is_integer(MapID) andalso MapID >= 0
	andalso erlang:is_number(PosX) andalso erlang:is_number(PosY) ->
	CurMapID = playerState:getMapID(),
	case getCfg:getCfgPStack(cfg_mapsetting, CurMapID) of
		#mapsettingCfg{type = ?MapTypeNormal} ->
			%%只有普通地图才允许这样传送
			case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
				#mapsettingCfg{type = ?MapTypeNormal} ->
					%%只有传送到普通地图才允许
					case core:getMapCfg(MapID) of
						undefined ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_SystemErrorMapCfg);
						#recGameMapCfg{colCellNum = ColNum, rowCellNum = RowNum} ->
							if PosX =< ColNum andalso PosX >= 0
								andalso PosY =< RowNum andalso PosY >= 0 ->
								onTransferPosAck(MapID, PosX, PosY);
								true ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapNoWayPt)
							end
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
	end,
	ok.

%% 获取到坐标，传送到指定位置
-spec onTransferPosAck(NewMapID, PosX, PosY) -> ok when
	NewMapID :: uint(),
	PosX :: float(),
	PosY :: float().
onTransferPosAck(NewMapID, PosX, PosY) ->
	case getCfg:getCfgPStack(cfg_mapsetting, NewMapID) of
		%% 只能是普通类型的地图
		#mapsettingCfg{type = ?MapTypeNormal} ->
			PlayerActionStatus = playerState:getActionStatus(),
			case PlayerActionStatus of
				%%地图传送状态不能再传送
				?CreatureActionStatusChangeMap ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed);
				?CreatureActionStatusMove ->
					playerMove:stopMove(false),
					erlang:send_after(?TransferWaitTime, self(), {laterTransfer, NewMapID, PosX, PosY});
				_ ->
					onLaterTransferPosAck(NewMapID, PosX, PosY)
			end;
		_ErrorMapID ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
	end.

%% 玩家确定停止移动后才传送
-spec onLaterTransferPosAck(NewMapID :: mapId(), PosX :: float(), PosY :: float()) -> ok.
onLaterTransferPosAck(NewMapID, PosX, PosY) ->
	NowMapID = playerState:getMapID(),
	case NowMapID =:= NewMapID of
		false ->		%% 不同地图，切换地图
			playerScene:onRequestEnterMap(NewMapID, PosX, PosY);
		true ->			%% 同一张地图，特殊处理
			NewPos = #pk_PosInfo{x = PosX, y = PosY},
			Code = playerState:getPlayerCode(),
			Msg = #pk_GS2U_TransferNewPos{code = Code, pos = NewPos},
			playerMsg:sendNetMsg(Msg),
			{OX, OY} = playerState:getPos(),
			playerState:setPosOnly(PosX, PosY),
			playerMap:syncChangePos(OX, OY, PosX, PosY, true)
	end,
	ok.

%% 同屏策略开启后，定时刷新同屏
-spec tickScreenSync9GridInfo() -> ok.
tickScreenSync9GridInfo() ->
	case playerState:getActionStatus() of
		?CreatureActionStatusChangeMap ->
			skip;
		_ ->
			case playerState2:canFreshScreen() of
				true ->
					case playerScreen:isOpen() of
						true ->
							SelfCode = playerState:getPlayerCode(),
							List = playerScreen:getLookPlayerList(SelfCode),

							%% 修复列表
							{X, Y} = playerState:getPos(),
							NearPlayerList = mapView:getNearViewObject(
								playerState:getMapPid(),
								playerState:getMapPlayerEts(),
								?ObjTypePlayer, {X, Y},
								playerState:getGroupID()),

							F =
								fun(Code, {AccL1, AccL2}) ->
									case lists:keyfind(Code, #recMapObject.code, AccL1) of
										#recMapObject{} ->
											{lists:keydelete(Code, #recMapObject.code, AccL1), [Code | AccL2]};
										_ ->
											{AccL1, AccL2}
									end
								end,
							{SurplusNearPlayerList, HaveCodeList} = lists:foldl(F, {NearPlayerList, []}, List),
							case erlang:length(HaveCodeList) < erlang:length(List) of
								true ->
									playerScreen:setLookPlayerList(SelfCode, HaveCodeList);
								_ ->
									skip
							end,

							%% 如果还有空位，则补充
							case playerState2:canAddLookPlayer() of
								true ->
									LookInfoPlayer = getLookInfoPlayer(),
									SelfPubPropValueList = playerPropSync:getPubPropValueList(),

									Fun =
										fun(#recMapObject{code = Code, pid = NearPid}) ->
											case Code /= SelfCode of
												true ->
													%%通知其他玩家本玩家信息
													psMgr:sendMsg2PS(NearPid, notifyNewPlayerInView,
														{playerState:getNetPid(), LookInfoPlayer, SelfPubPropValueList});
												_ ->
													skip
											end
										end,
									lists:foreach(Fun, SurplusNearPlayerList);
								_ ->
									skip
							end;
						_ ->
							skip
					end;
				_ ->
					skip
			end
	end,
	ok.

%%通知9宫格内的玩家，本玩家的信息，同时将9宫格内的玩家信息告诉自己
-spec sync9GridInfo() -> ok.
sync9GridInfo() ->
	%% 通知玩家周围信息
	{X,Y} = playerState:getPos(),
	PlayerView = mapView:getNearRectByPos(X, Y),
	%%?DEBUG_OUT("PlayerView[~p]",[PlayerView]),
	case playerState:getActionStatus() of
		?CreatureActionStatusChangeMap ->
			%%切换地图中不发送消息给客户端
			?WARN_OUT("sync9GridInfo but player[~ts][~p] is changing map",[playerState:getName(),playerState:getRoleID()]),
			skip;
		_ ->
			%% 清空保留的可视列表
			playerScreen:setLookPlayerList(playerState:getPlayerCode(), []),

			syncNearObjectToClient(PlayerView)
	end,
	ok.

%% 需要全地图同步的数据
-spec syncAllMapObjectTypes() -> ok.
syncAllMapObjectTypes() ->
	syncNpcToClient(),
	syncCollectToClient(),
	syncUseItemToClient(),
	ok.

%% 需要全地图消失的数据
-spec disableAllMapObjectTypes(OldGroupID::uint64()) -> ok.
disableAllMapObjectTypes(OldGroupID) ->
	%% 原分组的所有NPC消失
	NpcList = getNpcGroupList(OldGroupID),
	syncDisableViewObj(NpcList),

	%% 原分组的所有采集物消失
	CollectList = getCollectGroupList(OldGroupID),
	syncDisableViewObj(CollectList),

	%% 原分组的所有使用物消失
	UseItemList = getUseItemGroupList(OldGroupID),
	syncDisableViewObj(UseItemList),
	ok.

%%改变位置，并同步相应格子信息
-spec syncChangePos(SX,SY,X,Y,IsFlashMove) -> ok when
	SX::float(),SY::float(),X::float(),Y::float(),IsFlashMove::boolean().
syncChangePos(SX,SY,X,Y,IsFlashMove) ->
	%%此处需要先同步位置到ETS表
	syncPlayerToEts(),

	case playerState:isFirstEnterMap() of
		false ->
			%% 已上线
			playerPetDouble:onPosChange(X, Y),
			{OldGridX, OldGridY} = mapView:getGridXYByPos(SX, SY),
			{NewGridX, NewGridY} = mapView:getGridXYByPos(X, Y),
			DGX = NewGridX - OldGridX,
			DGY = NewGridY - OldGridY,
			if
			%%如果新位置所在九宫格与原来位置所在九宫格完全不重叠，则需要把新九宫格中的所有物件同步给客户端
			%%同步通知原来所在九宫格内的玩家，自己离开了
				DGX > 2 orelse DGX < -2 orelse DGY > 2 orelse DGY < -2 ->
					%%已经设置位置，直接调用此接口
					notifyLeave9GridInfo(SX,SY,playerState:getGroupID()),
					sync9GridInfo();
			%%如果新位置所在九宫格与原来位置所在九宫格部分重叠，则按优化后的同步方案同步给客户端
				OldGridX =/= NewGridX orelse OldGridY =/= NewGridY ->
					%%所在Grid发生变化，将变化Grid中的怪物和Npc等物件信息发送给玩家
					{NewViewList,DisableViewList,NoChangeList} = mapView:getChangedView({SX, SY}, {X, Y}),
					Fun =
						fun(View,AccIn) ->
							getDisableViewObj(View,AccIn,playerState:getGroupID())
						end,
					List = lists:foldl(Fun, [], DisableViewList),
					syncDisableViewObj(List),
					case playerState:getActionStatus() of
						?CreatureActionStatusChangeMap ->
							%%切换地图中不发送消息给客户端
							skip;
						_ ->
							[syncNearObjectToClient(NewView) || NewView <- NewViewList]
					end,

					%%如果是瞬间移动，要处理可视范围内的RP瞬间移动
					syncMsgToNoChangeViewClient(IsFlashMove, NoChangeList, X, Y);
				true ->
					syncMsgToNoChangeViewClient(IsFlashMove, [mapView:getNearRectByPos(SX, SY)], X, Y),
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% 同步分组变化
-spec syncChangeGroupID(OldGroupID::uint(), NewGroupID::uint()) -> boolean().
syncChangeGroupID(OldGroupID, NewGroupID) when erlang:is_integer(NewGroupID) andalso NewGroupID >= 0 ->
	%% 同步位置到ETS表
	syncPlayerToEts(),
%% 	?DEBUG_OUT("syncChangeGroupID:~p,~p", [OldGroupID, NewGroupID]),

	case playerState:isFirstEnterMap() of
		false ->
			%% 已经上线, 先告诉周围的玩家，我的分组改变了，可视对象改变
			{X, Y} = playerState:getPos(),
			%% fixme 下面两个消失函数，玩家视野同步部分会有重复，考虑到多写一份代码麻烦，且附近的玩家对象本身不多，就不处理了，直接调
			notifyLeave9GridInfo(X, Y, OldGroupID),
			notifyLeave9GridMyGroupIDChange(X, Y, OldGroupID),

			disableAllMapObjectTypes(OldGroupID),

			%% 告诉分组管理器，我在这个分组里面
			psMgr:sendMsg2PS(?PsNameGroup, playerGroupIDChange, {OldGroupID, NewGroupID, makeGroupPlayerInfo()}),

			%% 宠物进入分组
			playerScene:onPlayerPetEnterGroup(),

			%% 重新获取周围的对象同步至客户端
			syncAllMapObjectTypes(),
			sync9GridInfo(),
			true;
		_ ->
			false
	end.

%% 同步宠物分组变化
-spec syncPetChangeGroupID(PetCode::uint(), OldGroupID::uint(), NewGroupID::uint()) -> boolean().
syncPetChangeGroupID(PetCode, OldGroupID, NewGroupID) when erlang:is_integer(NewGroupID) andalso NewGroupID >= 0 ->
	PlayerEts = playerState:getMapPlayerEts(),
	PetEts = playerState:getMapPetEts(),
	MapPid = playerState:getMapPid(),

	[#recMapObject{x = X, y = Y} = Pet] = myEts:lookUpEts(PetEts, PetCode),

	%% 先告诉原来能看见我的玩家，我消失
	OldSeeMeList = mapView:getSeeMeObject(MapPid, PlayerEts, ?ObjTypePlayer, {X, Y}, OldGroupID),
	Msg = #pk_GS2U_BroadcastDisapear{code = [PetCode]},
	[gsSendMsg:sendNetMsg(NetPid, Msg) || #recMapObject{netPid = NetPid} <- OldSeeMeList],

	%% 再告诉新分组坐标位置的玩家，我出现
	playerPet:syncPetObject(Pet, false),
	true.

%% 通知自己所在位置周围所有的能看到我的玩家
-spec notifyLeave9GridMyGroupIDChange(X::number(),Y::number(),OldGroupID::uint()) -> ok.
notifyLeave9GridMyGroupIDChange(X,Y,_OldGroupID) ->
	PlayerEts = playerState:getMapPlayerEts(),
	PlayerCode = playerState:getPlayerCode(),
	MapPid = playerState:getMapPid(),
	PlayerList = mapView:getNearAllObject(MapPid, PlayerEts, ?ObjTypePlayer, {X, Y}),
	NowGroupID = playerState:getGroupID(),
	SelfPubPropList = playerPropSync:getPubPropValueList(),

	Fun =
		fun(#recMapObject{code = Code, groupID = GroupID} = Player) ->
			case Code =/= PlayerCode of
				true ->
					%% 我能不能否看见对方
					CanSeeTarget = groupBase:canSeeTarget(NowGroupID, GroupID),
					%% 对方能否看见我
					CanSeeMe = groupBase:canSeeMe(NowGroupID, GroupID),

					case CanSeeTarget of
						true ->
							skip;
						_ ->
							%% 不能看见对方，通知自己对方消失
							playerMsg:sendNetMsg(#pk_GS2U_BroadcastDisapear{code = [Code]}),
							playerScreen:delLookPlayerList(PlayerCode, Code)
					end,

					case CanSeeMe of
						true ->
							skip;
						_ ->
							%% 对方不能看见我，直接给对方发送我消失的消息
							gsSendMsg:sendNetMsg(Player#recMapObject.netPid, #pk_GS2U_BroadcastDisapear{code = [PlayerCode]}),
							psMgr:sendMsg2PS(Player#recMapObject.pid, parkDisappearPlayer, PlayerCode)
					end,

					case CanSeeTarget orelse CanSeeMe of
						true ->
							LookInfoPlayer = getLookInfoPlayer(),
							psMgr:sendMsg2PS(Player#recMapObject.pid, notifyNewPlayerInView, {playerState:getNetPid(), LookInfoPlayer, SelfPubPropList});
						_ ->
							skip
					end;
				_ ->
%% 				?DEBUG_OUT("skip:~p,~p,~s", [Code, PlayerCode, Player#recMapObject.name]),
					skip
			end
		end,
	lists:foreach(Fun, PlayerList).

%%通知指定位置周围的玩家，自己消失了，并且通知玩家原来周围的物件消失
-spec notifyLeave9GridInfo(X,Y,OldGroupID) -> ok when
	X::number(),Y::number(),OldGroupID::number().
notifyLeave9GridInfo(X,Y,OldGroupID) ->
	%%通知玩家周围的物件消失
	DisableView = mapView:getNearRectByPos(X,Y),
	List = getDisableViewObj(DisableView,[],OldGroupID),
	syncDisableViewObj(List),
	ok.

%% 没改变的区域，处理瞬移同步
-spec syncMsgToNoChangeViewClient(IsFlashMove::boolean(),list(),float(),float()) -> ok.
syncMsgToNoChangeViewClient(false, _, _, _) ->
	ok;
syncMsgToNoChangeViewClient(_, [], _, _) ->
	ok;
syncMsgToNoChangeViewClient(true, [NoChangeView], TX, TY) ->
	MapPid = playerState:getMapPid(),
	PlayerEts = playerState:getMapPlayerEts(),
	PlayerCode = playerState:getPlayerCode(),
	NewPos = #pk_PosInfo{x = TX, y = TY},
	SelfNetPid = playerState:getNetPid(),
	Msg = #pk_GS2U_TransferNewPos{code = PlayerCode, pos = NewPos},
	NoChangePlayerList = mapView:getNearAllObject(MapPid, PlayerEts, ?ObjTypePlayer, NoChangeView),
	Fun =
		fun(#recMapObject{netPid = NearPid}) ->
			case SelfNetPid =/= NearPid of
				true ->
					mapView:sendNetMsgToNetPid(NearPid, Msg);
				_ ->
					skip
			end
		end,
	lists:foreach(Fun, NoChangePlayerList),
	ok.

%% 显现仇恨目标
-spec addScreenPKPlayer(TargetCode::uint64()) -> ok.
addScreenPKPlayer(TargetCode) ->
	case playerState:getPlayerCode() of
		undefined -> skip;
		SelfCode ->
			case playerScreen:isOpen() of
				true ->
					case playerScreen:getOwnerCode(TargetCode) of
						0 -> skip;
						Owner ->
							%% 是否同步
							List = playerScreen:getLookPlayerList(SelfCode),
							case lists:member(Owner, List) of
								true ->
									skip;
								_ ->
									LookInfoPlayer = getLookInfoPlayer(),
									SelfPubPropValueList = playerPropSync:getPubPropValueList(),

									%%通知其他玩家本玩家信息
									case ets:lookup(playerState:getMapPlayerEts(), Owner) of
										[#recMapObject{pid = NearPid}] ->
											psMgr:sendMsg2PS(NearPid, notifyNewPlayerInView, {playerState:getNetPid(),LookInfoPlayer,SelfPubPropValueList});
										_ ->
											skip
									end,
									skip
							end
					end;
				_ ->
					skip
			end
	end,
	ok.

-spec syncNearObjectToClient(PlayerView) -> ok when
	PlayerView::{{Left, Top},{Right, Bottom}},Top::int(), Left::int(), Right::int(), Bottom::int().
syncNearObjectToClient(PlayerView) ->
	%%玩家
	NetPid = playerState:getNetPid(),
	PlayerEts = playerState:getMapPlayerEts(),
	PlayerList = mapView:getNearViewObject(playerState:getMapPid(),PlayerEts, ?ObjTypePlayer, PlayerView, playerState:getGroupID()),
	PlayerCode = playerState:getPlayerCode(),
	LookInfoPlayer = getLookInfoPlayer(),
	SelfPubPropValueList = playerPropSync:getPubPropValueList(),

	Fun =
		fun(#recMapObject{code = Code, pid = NearPid}) ->
			case Code /= PlayerCode of
				true ->
					%%通知其他玩家本玩家信息
					psMgr:sendMsg2PS(NearPid,notifyNewPlayerInView,{NetPid,LookInfoPlayer,SelfPubPropValueList});
				_ ->
					skip
			end
		end,
	lists:foreach(Fun, PlayerList),
%%	syncNpcToClient(PlayerView),
	syncMonsterToClient(PlayerView),
%%	syncCarrierToClient(PlayerView),
%%	syncPetToClient(PlayerList),
%%	syncCollectToClient(),
%%	syncUseItemToClient(),
	ok.

%%通知自己有新玩家进入自己的视野，同时将自己的信息发送给新玩家
-spec notifyNewPlayerInView(PidFrom::pid(), {NewPlayerNetPid::pid(),#pk_GS2U_LookInfoPlayer{},PubPropList::list()}) -> ok.
notifyNewPlayerInView(PidFrom,
	{_NewPlayerNetPid, #pk_GS2U_LookInfoPlayer{roleID = RoleID, code = TargetCode} = NewPlayer, PubPropList}) ->

	SelfGroupId = playerState:getGroupID(),
	TargetGroupID = lists:nth(?PubProp_GroupID, PubPropList),

	SelfCode = playerState:getPlayerCode(),

	%% 先处理我能不能看见对方，能则把对方的info发给自己
	case groupBase:canSeeTarget(SelfGroupId, TargetGroupID) of
		true ->
			%% 是否同步
			CanSync =
				case playerScreen:isOpen() of
					true ->
						case playerBattle:isHateTarget(TargetCode) of
							true ->
								true;
							false ->
								playerState2:canAddLookPlayer(SelfCode)
						end;
					false ->
						true
				end,

			case CanSync of
				true ->
					%%发送给自己新玩家的信息
					playerMsg:sendNetMsg(NewPlayer),
					playerPropSync:sendPubPropMsgToClientByPropValueList(playerState:getNetPid(), TargetCode, PubPropList),

					%%发送他的宠物信息给我
					syncPetToClient([TargetCode]),

					%% 同步他的黑暗币给我
					playerDarkness:syncClientToMe(RoleID, TargetCode),

					%% 加入同屏列表
					playerScreen:addLookPlayerList(SelfCode, TargetCode),
					ok;
				_ ->
					skip
			end;
		_ ->
			skip
	end,

	case groupBase:canSeeMe(SelfGroupId, TargetGroupID) of
		true ->
			LookInfoPlayer = getLookInfoPlayer(),
			SelfPubValueList = playerPropSync:getPubPropValueList(),
			Darkness = playerDarkness:getMeToClient(),
			psMgr:sendMsg2PS(PidFrom, notifyNewPlayerInViewAck, {LookInfoPlayer, SelfPubValueList, Darkness}),
			ok;
		false ->
			%% 对方都看不见我，没必要把我的信息再发给他了
			skip
	end,
	ok.

notifyNewPlayerInViewAck(_PidFrom,  {#pk_GS2U_LookInfoPlayer{code = TargetCode} = TargetLookInfoPlayer, TargetPubValueList, Darkness}) ->
	CanSync =
		case playerScreen:isOpen() of
			true ->
				case playerBattle:isHateTarget(TargetCode) of
					true ->
						true;
					false ->
						playerState2:canAddLookPlayer()
				end;
			false ->
				true
		end,

	case CanSync of
		true ->
			NetPid = playerState:getNetPid(),
			SelfCode = playerState:getPlayerCode(),
			playerMsg:sendNetMsg(TargetLookInfoPlayer),
			playerPropSync:sendPubPropMsgToClientByPropValueList(NetPid, TargetCode, TargetPubValueList),

			%%对方的宠物信息发给我
			syncPetToClient([TargetCode]),

			%% 黑暗币
			case Darkness of
				{} -> skip;
				_ ->
					playerMsg:sendNetMsg(Darkness)
			end,

			%% 添加可视目标
			playerScreen:addLookPlayerList(SelfCode, TargetCode),
			ok;
		_ ->
			skip
	end,
	ok.

%% 对象消失
-spec parkDisappearPlayer(Code::uint()) -> ok.
parkDisappearPlayer(Code) ->
	playerScreen:delLookPlayerList(playerState:getPlayerCode(), Code),
	ok.

%%同步玩家数据到ETS表
-spec syncPlayerToEts() -> ok.
syncPlayerToEts() ->
	case playerState:getMapPlayerEts() of
		undefined ->
			skip;
		PlayerEts ->
			Code = playerState:getPlayerCode(),
			{X,Y} = playerState:getPos(),
			ActStatus = playerState:getActionStatus(),
			Status = playerState:getStatus(),
			Level = playerState:getLevel(),
			Hp = playerState:getCurHp(),
			MaxHP = playerState:getMaxHp(),
			Mp = playerState:getCurMp(),
			Camp = playerState:getCamp(),
			PkMode = playerState:getPkStatus(),
			MoveTargetList = playerState:getMoveTargetList(),
			%MoveDir = playerState:getMoveDir(),
			MoveRealDir = playerState:getMoveRealDir(),
			GuildID = playerState:getGuildID(),
			KillList = playerState:getKillPlayerList(),
			BuffList = playerBuff:getBuffInfoList(),
			TeamID = playerState:getTeamID(),
			GroupID = playerState:getGroupID(),
			MapPid = playerState:getMapPid(),
			case is_pid(MapPid)  andalso misc:is_process_alive(MapPid) of
				true ->
					myEts:updateEts(PlayerEts, Code, [
						{#recMapObject.x,X},
						{#recMapObject.y,Y},
						{#recMapObject.actionStatus,ActStatus},
						{#recMapObject.status,Status},
						{#recMapObject.level,Level},
						{#recMapObject.hp,Hp},
						{#recMapObject.maxHp,MaxHP},
						{#recMapObject.mp,Mp},
						{#recMapObject.camp,Camp},
						{#recMapObject.pkMode,PkMode},
						{#recMapObject.moveTargetList,MoveTargetList},
						%{#recMapObject.moveDir,MoveDir},
						{#recMapObject.moveRealDir,MoveRealDir},
						{#recMapObject.guild, GuildID},
						{#recMapObject.buffList, BuffList},
						{#recMapObject.killList, KillList},
						{#recMapObject.teamID, TeamID},
						{#recMapObject.groupID, GroupID}
					]);
				_ ->
					skip
			end
	end,
	ok.

%%同步玩家的网络Pid到Ets表
-spec syncPlayerNetPidToEts(NetPid) -> ok when
	NetPid::pid() | undefined.
syncPlayerNetPidToEts(NetPid) ->
	MapPid = playerState:getMapPid(),
	case misc:is_process_alive(MapPid) of
		true ->
			skip;
		_ ->
			playerState:setMapPlayerEts(undefined)
	end,
	case playerState:getMapPlayerEts() of
		undefined ->
			skip;
		PlayerEts ->
			Code = playerState:getPlayerCode(),
			myEts:updateEts(PlayerEts,Code,[{#recMapObject.netPid,NetPid}])
	end,
	ok.

-spec resetPosToRevivePt() -> ok.
resetPosToRevivePt() ->
	Time = playerState:getLastResetPosToRevivePtTime(),
	Now = time:getUTCNowSec(),
	CD = globalCfg:getGlobalCfg(resetPosToRevivePtCDTime),
	case Now - Time >= CD of
		true ->
			MapID = playerState:getMapID(),
			case getMapRevivePt(MapID) of
				{X,Y} ->
					playerState:setLastResetPosToRevivePtTime(Now),
					onLaterTransferPosAck(MapID,X,Y);
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_SystemErrorMapCfg)
			end,
			ok;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SystemTransferMapCD)
	end,
	ok.

%%活动坐标点整合
-spec getMapRevivePt(MapID) -> {X,Y} | failed when MapID::mapId(),X::number(),Y::number().
getMapRevivePt(MapID) ->
	KingMapID = globalCfg:getGlobalCfg(fightall_map_id),
	case MapID of
		MapID when MapID=:=KingMapID ->
			playerAcKingBattleAll:getKingRevivePt();
		MapID when MapID =:= ?CrosHdBattleMapID ->
			getMapRevivePt3(MapID);
		_ ->
			case playerGuildExpedition:isInExpedition(MapID) of
				true ->
					playerGuildExpedition:getRevivePt(MapID);
				_ ->getMapRevivePt2(MapID)
			end
	end.

-spec getMapRevivePt2(MapID) -> {X,Y} | failed when MapID::mapId(),X::number(),Y::number().
getMapRevivePt2(MapID) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{} ->
			%% 获取地图复活点
			Cfg = core:getMapCfg(MapID),
			case Cfg#recGameMapCfg.mapRelivePt of
				List when is_list(List) ->
					case List of
						[#recMapObjData{mapX = RX, mapY = RY}] ->
							{RX,RY};
						[#recMapObjData{}|_] = FHL ->
							%% 有多个复活点时，随机取一个
							Index = misc:rand(1, erlang:length(FHL)),
							#recMapObjData{mapX = RX, mapY = RY} = lists:nth(Index,FHL),
							{RX,RY};
						Are ->
							?ERROR_OUT("getMapObjRelivePt ret:~p,~p",[MapID, Are]),
							failed
					end;
				_ ->
					?ERROR_OUT("player[~ts] Error MapID[~p],not cfg In getRow",[playerState:getName(),MapID]),
					failed
			end;
		Ret ->
			?ERROR_OUT("player[~ts] Error MapID[~p],not cfg~p",[playerState:getName(),MapID,Ret]),
			failed
	end.

-spec getMapRevivePt3(MapID) -> {X,Y} | failed when MapID::mapId(),X::number(),Y::number().
getMapRevivePt3(MapID) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{} ->
			%% 获取地图复活点
			Cfg = core:getMapCfg(MapID),
			case Cfg#recGameMapCfg.mapRelivePt of
				List when is_list(List) andalso length(List) >= 2->
					case playerState:getCamp() of
						?CampRedBattle ->
							#recMapObjData{mapX = RX, mapY = RY} = lists:nth(1,List),
							{RX, RY};
						_ ->
							#recMapObjData{mapX = RX, mapY = RY} = lists:nth(2,List),
							{RX, RY}
					end;
				_ ->
					?ERROR_OUT("player[~ts] Error MapID[~p],not cfg In getRow",[playerState:getName(),MapID]),
					failed
			end;
		Ret ->
			?ERROR_OUT("player[~ts] Error MapID[~p],not cfg~p",[playerState:getName(),MapID,Ret]),
			failed
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================

-spec syncMonsterToClient(PlayerView) -> ok when
	PlayerView::{{Left, Top},{Right, Bottom}},Top::int(), Left::int(), Right::int(), Bottom::int().
syncMonsterToClient(PlayerView) ->
	%%怪物
	MonsterEts = playerState:getMapMonsterEts(),
%%	MonsterList = mapView:getNearViewObject(playerState:getMapPid(),MonsterEts, ?ObjTypeMonster, PlayerView, playerState:getGroupID()),
	MonsterList = mapView:getGridMonsterAndCarrier(playerState:getMapPid(),MonsterEts, PlayerView, playerState:getGroupID()),
	case MonsterList of
		[] ->
			skip;
		_ ->
			%%发送玩家视野内的怪物和载体
			MonsterInfoList = findMonsterInfoList(MonsterList),
			playerMsg:sendNetMsg(#pk_GS2U_MonsterList{monster_list = MonsterInfoList})
	end,
	ok.

%%% 载体与怪物一起同步处理了，这样减少一次遍历时间复杂度
%-spec syncCarrierToClient(PlayerView) -> ok when
%	PlayerView::{{Left, Top},{Right, Bottom}},Top::int(), Left::int(), Right::int(), Bottom::int().
%syncCarrierToClient(_PlayerView) ->
%	%%载体
%%%	MonsterEts = playerState:getMapMonsterEts(),
%%%	CarrierList = mapView:getNearViewObject(playerState:getMapPid(), MonsterEts, ?ObjTypeCarrier, PlayerView, playerState:getGroupID()),
%%%	case CarrierList of
%%%		[] ->
%%%			skip;
%%%		_ ->
%%%			%%发送玩家视野内的载体
%%%			CarrierInfoList = findMonsterInfoList(CarrierList),
%%%			playerMsg:sendNetMsg(#pk_GS2U_MonsterList{monster_list = CarrierInfoList})
%%%	end,
%	ok.

-spec syncPetToClient(PlayerList::[#recMapObject{},...]) -> ok.
syncPetToClient([]) -> ok;
syncPetToClient([#recMapObject{}|_] = PlayerList) ->
	%%宠物
%%	PetEts = playerState:getMapPetEts(),
%%	PetList = mapView:getNearViewObject(playerState:getMapPid(),PetEts, ?ObjTypePet, PlayerView, playerState:getGroupID()),
	case getPetObjectList(PlayerList) of
		[] ->
			skip;
		PetList ->
			%%发送玩家视野内的宠物
			PetInfoList = findPetInfoList(PetList),
			playerMsg:sendNetMsg(#pk_GS2U_PetList{pet_list = PetInfoList})
	end,
	ok;
syncPetToClient([C|_] = PlayerCodeList) when erlang:is_integer(C) ->
	PlayerEts = playerState:getMapPlayerEts(),
	F =
		fun(Code, AccL) ->
			case ets:lookup(PlayerEts, Code) of
				[#recMapObject{} = Obj] ->
					[Obj | AccL];
				_ ->
					AccL
			end
		end,
	List = lists:foldl(F, [], PlayerCodeList),
	syncPetToClient(List).

%% 同步本地图所有NPC到客户端
-spec syncNpcToClient() -> ok.
syncNpcToClient() ->
	NpcEts = playerState:getMapNpcEts(),
	GroupID = playerState:getGroupID(),
	MapPID = playerState:getMapPid(),

%%	NpcList = mapView:getNearViewObject(MapPID, NpcEts, ?ObjTypeNPC, PlayerView, GroupID),
	%% 直接同步所有NPC给客户端，以后不再同步
	F =
		fun(#recMapObject{} = Obj, AccL) ->
			case Obj#recMapObject.type =:= ?ObjTypeNPC
				andalso Obj#recMapObject.mapPid =:= MapPID
				andalso Obj#recMapObject.groupID =:= GroupID of
				true -> [Obj | AccL];
				_ -> AccL
			end
		end,
	NpcList = ets:foldl(F, [], NpcEts),
	case NpcList of
		[] ->
			skip;
		_ ->
			%%发送玩家视野内的Npc
			NpcInfoList = findNpcInfoList(NpcList),
			playerMsg:sendNetMsg(#pk_GS2U_NpcList{npc_list = NpcInfoList})
	end,
	ok.

getNpcGroupList(GroupID) ->
	NpcEts = playerState:getMapNpcEts(),
	MapPID = playerState:getMapPid(),

	%% 取原视野内的所有NPC Code列表
	F =
		fun(#recMapObject{code = Code} = Obj, AccL) ->
			case Obj#recMapObject.type =:= ?ObjTypeNPC
				andalso Obj#recMapObject.mapPid =:= MapPID
				andalso Obj#recMapObject.groupID =:= GroupID of
				true -> [Code | AccL];
				_ -> AccL
			end
		end,
	ets:foldl(F, [], NpcEts).

-spec syncCollectToClient() -> ok.
syncCollectToClient() ->
	%%采集物
	CollectEts = playerState:getMapCollectEts(),
	MapPID = playerState:getMapPid(),
	GroupID = playerState:getGroupID(),

%%	CollectList = mapView:getNearViewObject(MapPid, CollectEts, ?ObjTypeCollect, PlayerView, GroupID),
	F =
		fun(#recMapObject{} = Obj, AccL) ->
			case Obj#recMapObject.type =:= ?ObjTypeCollect
				andalso Obj#recMapObject.mapPid =:= MapPID
				andalso Obj#recMapObject.groupID =:= GroupID of
				true -> [Obj | AccL];
				_ -> AccL
			end
		end,
	CollectList = ets:foldl(F, [], CollectEts),
	case CollectList of
		[] ->
			skip;
		_ ->
			%%发送玩家视野内的采集对象
			CollectInfoList = findCollectInfoList(CollectList),
			playerMsg:sendNetMsg(#pk_GS2U_MissionObjectList{missionObj_list = CollectInfoList})
	end,
	ok.

getCollectGroupList(GroupID) ->
	CollectEts = playerState:getMapCollectEts(),
	MapPID = playerState:getMapPid(),

	F =
		fun(#recMapObject{code = Code} = Obj, AccL) ->
			case Obj#recMapObject.type =:= ?ObjTypeCollect
				andalso Obj#recMapObject.mapPid =:= MapPID
				andalso Obj#recMapObject.groupID =:= GroupID of
				true -> [Code | AccL];
				_ -> AccL
			end
		end,
	ets:foldl(F, [], CollectEts).

-spec syncUseItemToClient() -> ok.
syncUseItemToClient() ->
	UseItemEts = playerState:getMapUseItemEts(),
	MapPID = playerState:getMapPid(),
	GroupID = playerState:getGroupID(),

%%	UseItemList = mapView:getNearViewObject(MapPID,UseItemEts, ?ObjTypeUseItem, PlayerView, GroupID),
	F =
		fun(#recMapObject{} = Obj, AccL) ->
			case Obj#recMapObject.type =:= ?ObjTypeUseItem
				andalso Obj#recMapObject.mapPid =:= MapPID
				andalso Obj#recMapObject.groupID =:= GroupID of
				true -> [Obj | AccL];
				_ -> AccL
			end
		end,
	UseItemList = ets:foldl(F, [], UseItemEts),
	case UseItemList of
		[] ->
			skip;
		_ ->
			%%发送玩家视野内的使用物品
			UseItemInfoList = findUseItemInfoList(UseItemList),
			playerMsg:sendNetMsg(#pk_GS2U_TaskUseItemList{useItemlist = UseItemInfoList})
	end,
	ok.

getUseItemGroupList(GroupID) ->
	UseItemEts = playerState:getMapUseItemEts(),
	MapPID = playerState:getMapPid(),

	F =
		fun(#recMapObject{code = Code} = Obj, AccL) ->
			case Obj#recMapObject.type =:= ?ObjTypeUseItem
				andalso Obj#recMapObject.mapPid =:= MapPID
				andalso Obj#recMapObject.groupID =:= GroupID of
				true -> [Code | AccL];
				_ -> AccL
			end
		end,
	ets:foldl(F, [], UseItemEts).

%% 找到地图怪物信息列表
-spec findMonsterInfoList(ObjectList) ->
	list() when ObjectList::list().
findMonsterInfoList(ObjectList) when erlang:is_list(ObjectList) andalso erlang:length(ObjectList) > 0 ->
	Fun = fun(#recMapObject{code = Code,
		id = ID,
		x = X,
		y = Y,
		name = Name,
		level = ObjLevel,
		maxHp = MaxHp,
		moveSpeed = MoveSpeed,
		actionStatus = ActStatus,
		buffList = BuffList,
		other = Other,
		hp = Hp,
		camp = Camp,
		attackSpeed = AttackSpeed,
		groupID = GroupID,
		rotW = RotW
	} = Monster, Acc) ->
		case ActStatus =/= ?CreatureActionStatusDead of
			true ->
				{TX,TY} = getMoveTarget(Monster#recMapObject.moveTargetList),
				{MoveStatus,SubType,CasterCode} = getMonsterInfo(Other),
				Hp_Per = skill:getPercent(Hp, MaxHp),
				[#pk_LookInfoMonster{
					code = Code,
					id = ID,
					x = X,
					y = Y,
					rotW = float(RotW),
					targetX = TX,
					targetY = TY,
					usercode = CasterCode,
					type = SubType,
					move_speed = MoveSpeed,
					attack_speed = AttackSpeed,
					moveStatus = MoveStatus,
					camp = Camp,
					buffs = BuffList,
					hp_per = Hp_Per,
					groupID = GroupID,
					guildID = Monster#recMapObject.guild,
					name = Name,
					level = ObjLevel
				} | Acc];
			_ ->
				Acc
		end
		  end,
	lists:foldl(Fun, [], ObjectList).

%%这里MoveTarget是一个列表
getMoveTarget([#pk_PosInfo{x = TX, y = TY} | _]) ->
	{TX,TY};
getMoveTarget(_) ->
	{0.0,0.0}.

getMonsterInfo(Other) when erlang:is_list(Other)->
	MoveStatus = case lists:keyfind(moveStatus, 1, Other) of
					 {moveStatus,MStatus} ->
						 MStatus;
					 _ ->
						 0
				 end,
	SubType = case lists:keyfind(subType, 1, Other) of
				  {subType,Type} ->
					  Type;
				  _ ->
					  0
			  end,
	CasterCode = case lists:keyfind(casterCode, 1, Other) of
					 {casterCode,UserCode} ->
						 UserCode;
					 _ ->
						 0
				 end,
	{MoveStatus,SubType,CasterCode};
getMonsterInfo(_Other) ->
	{0,0,0}.

%% 找到地图宠物信息列表
-spec findPetInfoList(PetList::list()) -> list().
findPetInfoList(PetList) when erlang:is_list(PetList) andalso erlang:length(PetList) > 0 ->
	Fun =
		fun(#recMapObject{actionStatus = Status, hp = CurHp, id = PetID, buffList = BuffList, maxHp = MaxHp} = Pet, Acc) ->
			case Status of
				?CreatureActionStatusDead ->
					Acc;
				?CreatrueActionStatusStealth ->
					Acc;
				_ ->
					[CasterCode|_] = Pet#recMapObject.other,
					{TX,TY} = getMoveTarget(Pet#recMapObject.moveTargetList),
					Hp_Per = skill:getPercent(CurHp, MaxHp),

					[
						#pk_LookInfoPet{
							code = Pet#recMapObject.code,
							id = PetID,
							playerCode = CasterCode,
							name = Pet#recMapObject.name,
							x = Pet#recMapObject.x,
							y = Pet#recMapObject.y,
							targetX = TX,
							targetY = TY,
							status = Status,
							camp = Pet#recMapObject.camp,
							pkMode = Pet#recMapObject.pkMode,
							move_speed = Pet#recMapObject.moveSpeed,
							buffs = BuffList,
							hp_per = Hp_Per
						} | Acc
					]
			end
		end,
	lists:foldl(Fun, [], PetList).

% 找到地图Npc信息 列表
-spec findNpcInfoList(NpcList) -> list() when NpcList::list().
findNpcInfoList(NpcList) when erlang:is_list(NpcList) ->
	Fun =
		fun(#recMapObject{code = Code,id = ID,x = X,y = Y,rotW = RotW,name=Name,actionStatus = AStatus, other = Other}, Acc) ->
			Title =
				case erlang:is_list(Other) of
					true -> Other;
					_ -> []
				end,
			[#pk_LookInfoNpc{
				code = Code,
				id = ID,
				x = X,
				y = Y,
				rotW = RotW,
				name = misc:binToString(Name),
				title = Title,
				actionStatus = AStatus  %%同步npc状态到客户端%%
			} | Acc]
		end,
	lists:foldl(Fun, [], NpcList).

%%找到地图采集信列表
-spec findCollectInfoList(CollectList) ->
	list() when CollectList::list().
findCollectInfoList(CollectList) when erlang:is_list(CollectList) ->
	Fun =
		fun(#recMapObject{} = Collect) ->
			#pk_MissionObjectInfo{
				code = Collect#recMapObject.code,
				id = Collect#recMapObject.id,
				x = Collect#recMapObject.x,
				y = Collect#recMapObject.y,
				rotW = Collect#recMapObject.rotW
			}
		end,
	lists:map(Fun, CollectList).

%%找到地图使用物品列表
-spec findUseItemInfoList(UseItemList) ->
	list() when UseItemList::list().
findUseItemInfoList(UseItemList) when erlang:is_list(UseItemList) ->
	Fun =
		fun(#recMapObject{} = UseItem) ->
			#pk_TaskUseItem{
				code = UseItem#recMapObject.code,
				id = UseItem#recMapObject.id,
				x = UseItem#recMapObject.x,
				y = UseItem#recMapObject.y,
				rotW = UseItem#recMapObject.rotW
			}
		end,
	lists:map(Fun, UseItemList).

-spec getDisableViewObj(View,AccInList,OldGroupID) -> list() when
	View::{{Left, Top},{Right, Bottom}},Top::int(), Left::int(), Right::int(), Bottom::int(),AccInList::list(),OldGroupID::uint().
getDisableViewObj(View,AccInList,OldGroupID) ->
	MapPid = playerState:getMapPid(),
	%%玩家
	PlayerEts = playerState:getMapPlayerEts(),
	PlayerList = mapView:getNearViewObject(MapPid, PlayerEts, ?ObjTypePlayer, View, OldGroupID),

	%%通知其他玩家本玩家的消失信息
	PlayerCode = playerState:getPlayerCode(),
	DisappearMsg = #pk_GS2U_BroadcastDisapear{code = [PlayerCode | playerState:getCallPetCodeList()]},

	FunDisappear =
		fun(#recMapObject{code = Code, netPid = NetPid, pid = Pid}, AccIn) ->
			case Code /= PlayerCode of
				true ->
					%%通知其他玩家本玩家的消失信息
					playerMsg:sendNetMsg(NetPid, DisappearMsg),

					playerScreen:delLookPlayerList(PlayerCode, Code),
					psMgr:sendMsg2PS(Pid, parkDisappearPlayer, PlayerCode),

					[Code | AccIn];
				_ ->
					AccIn
			end
		end,
	L1 = lists:foldl(FunDisappear, AccInList, PlayerList),

	%%怪物
	MonsterEts = playerState:getMapMonsterEts(),
	MonsterList = mapView:getNearViewObject(MapPid,MonsterEts, ?ObjTypeMonster, View, OldGroupID),
	%%载体
	CarrierEts = playerState:getMapMonsterEts(),
	CarrierList = mapView:getNearViewObject(MapPid, CarrierEts, ?ObjTypeCarrier, View, OldGroupID),
	%%Npc
%%	NpcEts = playerState:getMapNpcEts(),
%%	NpcList = mapView:getNearViewObject(MapPid,NpcEts, ?ObjTypeNPC, View, OldGroupID),
	%%采集物
%%	CollectEts = playerState:getMapCollectEts(),
%%	CollectList = mapView:getNearViewObject(MapPid,CollectEts, ?ObjTypeCollect, View, OldGroupID),
	%%使用物品
%%	UseItemEts = playerState:getMapUseItemEts(),
%%	UseItemList = mapView:getNearViewObject(MapPid,UseItemEts, ?ObjTypeUseItem, View, OldGroupID),
	%%宠物
%%	PetEts = playerState:getMapPetEts(),
%%	PetList = mapView:getNearViewObject(MapPid,PetEts, ?ObjTypePet, View, OldGroupID),
	PetList = getPetObjectList(PlayerList),

	Fun = fun(#recMapObject{code = Code}, AccIn) -> [Code | AccIn] end,
%%	L1 = lists:foldl(Fun,AccInList,PlayerList),
	L2 = lists:foldl(Fun, L1, MonsterList),
	L3 = lists:foldl(Fun, L2, CarrierList),
%%	L4 = lists:foldl(Fun, L3, NpcList),
%%	L5 = lists:foldl(Fun, L4, CollectList),
%%	L6 = lists:foldl(Fun, L5, UseItemList),
	L4 = lists:foldl(Fun, L3, PetList),
	L4.

-spec syncDisableViewObj(List) -> ok when List::list().
syncDisableViewObj([]) ->
	ok;
syncDisableViewObj(List) ->
	playerMsg:sendNetMsg(#pk_GS2U_BroadcastDisapear{code = List}),
	ok.

%% 根据玩家列表，获取其宠物列表
getPetObjectList([]) -> [];
getPetObjectList([#recMapObject{}|_] = PlayerObjList) ->
	F =
		fun(#recMapObject{callPetList = CallPetList}, AccL) ->
			getPetObjectList(CallPetList) ++ AccL
		end,
	lists:foldl(F, [], PlayerObjList);
getPetObjectList([#recCallPet{}|_] = CallPetList) ->
	PetEts = playerState:getMapPetEts(),
	F =
		fun(#recCallPet{pet_code = PetCode}, AccL) ->
			case ets:lookup(PetEts, PetCode) of
				[#recMapObject{} = Obj] -> [Obj | AccL];
				_ -> AccL
			end
		end,
	lists:foldl(F, [], CallPetList);
getPetObjectList([C|_] = PlayerCodeList) when erlang:is_integer(C) ->
	PlayerEts = playerState:getMapPlayerEts(),
	F =
		fun(Code, AccL) ->
			case ets:lookup(PlayerEts, Code) of
				[#recMapObject{callPetList = CallPetList}] ->
					L = getPetObjectList(CallPetList),
					L ++ AccL;
				_ ->
					AccL
			end
		end,
	lists:foldl(F, [], PlayerCodeList).

%% 构造玩家在分组中的信息结构
-spec makeGroupPlayerInfo() -> #recGroupPlayerInfo{}.
makeGroupPlayerInfo() ->
	#recGroupPlayerInfo{
		roleCode = playerState:getPlayerCode(),
		rolePID = self(),
		mapID = playerState:getMapID(),
		mapPID = playerState:getMapPid(),
		playerEts = playerState:getMapPlayerEts()
	}.

-spec getLookInfoPlayer() -> #pk_GS2U_LookInfoPlayer{}.
getLookInfoPlayer() ->
	{X,Y} = playerState:getPos(),
	MaxHp = playerState:getMaxHp(),
	Hp = misc:clamp(playerState:getCurHp(),0,MaxHp),
	Hp_Per = skill:getPercent(Hp, MaxHp),
	List = playerState:getEquipRefine(),
	Fun = fun({Type, Level}) ->
		#pk_refineLevel{
			type = Type,
			level = Level
		}
		  end,
	NewList = lists:map(Fun, List),
	VE = playerEquip:getPlayerVisibleEquip(),
	{MountID, OtherCode} = playerPetDouble:getPetMountID1(),
	#pk_GS2U_LookInfoPlayer{
		code = playerState:getPlayerCode(),
		roleID = playerState:getRoleID(),
		name = playerState:getName(),
		x = X,
		y = Y,
		servername =playerState:getHostRealName(),
		hp_per = Hp_Per,
		pet_list = playerState:getCallPetCodeList(),
		move_list = playerState:getMoveTargetList(),
		move_speed = playerState:getMoveSpeed(),
		sex = playerState:getSex(),
		camp = playerState:getCamp(),
		race = playerState:getRace(),
		career = playerState:getCareer(),
		head = playerState:getHead(),
		level = playerState:getLevel(),
		buffs = playerBuff:getBuffInfoList(),
		petID = MountID,
		otherCode = OtherCode,
		pkMode = playerState:getPkStatus(),
		refine_levels = NewList,
		visible_equips = VE
	}.

-spec makePlayerBaseInfo() -> #pk_GS2U_PlayerBaseInfo{}.
makePlayerBaseInfo() ->
	{X,Y} = playerState:getPos(),
	CurHp = playerState:getCurHp(),
	MaxHp = playerState:getMaxHp(),
	List = playerState:getEquipRefine(),
	Fun = fun({Type, Level}) ->
		#pk_refineLevel{
			type = Type,
			level = Level
		}
		  end,
	NewList = lists:map(Fun, List),
	#player_baseCfg{exp = Exp} = getCfg:getCfgPStack(cfg_player_base, playerState:getLevel(), playerState:getCareer()),

	RoleID = playerState:getRoleID(),
	FunMoney =
		fun(Type) ->
			Value =
				case playerState:getCoin(Type) of
					undefined ->
						?ERROR_OUT("makePlayerBaseInfo:money init error:roleid=~p,type=~p", [RoleID, Type]),
						0;
					V ->
						V
				end,
			#pk_MoneyInit{moneyType = Type, value = Value}
		end,
	Moneys = lists:map(FunMoney, lists:seq(?CoinTypeMin, ?CoinTypeMax)),
	{MountID, OtherCode} = playerPetDouble:getPetMountID1(),
	BaseInfo = #pk_RoleBaseInfo{
		code = playerState:getPlayerCode(),
		roleID = RoleID,
		name = playerState:getName(),
		x = X,
		y = Y,
		head = playerState:getHead(),
		camp = playerState:getCamp(),
		level = playerState:getLevel(),
		career = playerState:getCareer(),
		sex = playerState:getSex(),
		race = playerState:getRace(),
		vip = playerState:getVip(),
		exp = playerState:getCurExp(),
		maxExp = Exp,
		cur_hp = CurHp,
		max_hp = MaxHp,
		hp_per = skill:getPercent(CurHp, MaxHp),
		mp = playerState:getCurMp(),
		mountID = MountID,
		otherCode = OtherCode,
		pkMode = playerState:getPkStatus(),
		maxCourage = playerSkill:getMaxCourage(),
		moneys = Moneys,
		visible_equips = playerEquip:getPlayerVisibleEquip(),
		refine_levels = NewList
	},
	#pk_GS2U_PlayerBaseInfo{
		baseInfo = BaseInfo
	}.

-spec makeBattlePropInfo() -> #pk_GS2U_AllBattleProp{}.
makeBattlePropInfo() ->
	List = lists:seq(?Prop_Min, ?PropMax),
	Fun = fun(Prop,AccIn) ->
		Value = playerState:getBattlePropTotal(Prop),
		[Value | AccIn]
		  end,
	BattlePropInfo = lists:foldr(Fun, [], List),
	#pk_GS2U_AllBattleProp{
		code = playerState:getPlayerCode(),
		battlePropInfo = [0|BattlePropInfo]
	}.




-spec sendSaveBuff() -> ok.
sendSaveBuff() ->
	Now = time:getUTCNowMS(),
	Level = playerState:getLevel(),
	BuffList = playerState:getSaveBuffList(),
	Fun = fun(#rec_buff{buffID = BuffID, endtime = EndTime}) ->
		case EndTime >= 94608000000 of %%当超过3 * 365 * 24 * 3600 * 1000为buff结束时间
			true -> %%buff结束时间
				case Now >= EndTime of
					true ->
						skip;
					_ ->
						?DEBUG_OUT("login add store buff ~p,~p~n",[BuffID, EndTime]),
						playerBuff:addBuff(BuffID, Level, EndTime)
				end;
			_ -> %%剩余时间
				?DEBUG_OUT("login add un store buff ~p,~p~n",[BuffID, EndTime]),
				playerBuff:addBuff(BuffID, Level, Now + EndTime)
		end
		  end,
	lists:foreach(Fun, BuffList),
	?DEBUG_OUT("=======delete buff in db======="),
	playerSave:deleteBuff(),
	ok.

-spec syncPlayerAllToEts() -> ok.
syncPlayerAllToEts() ->
	PlayerEts = playerState:getMapPlayerEts(),
	Code = playerState:getPlayerCode(),
	Name = playerState:getName(),
	{X,Y} = playerState:getPos(),
	ActStatus = playerState:getActionStatus(),
	Status = playerState:getStatus(),
	Level = playerState:getLevel(),
	Hp = playerState:getCurHp(),
	MaxHP = playerState:getMaxHp(),
	Mp = playerState:getCurMp(),
	Vip = playerState:getVip(),
	Camp = playerState:getCamp(),
	MoveTargetList = playerState:getMoveTargetList(),
	%MoveDir = playerState:getMoveDir(),
	MoveRealDir = playerState:getMoveRealDir(),
	GuildID = playerState:getGuildID(),
	BuffList = playerBuff:getBuffInfoList(),
	TeamID = playerState:getTeamID(),
	GroupID = playerState:getGroupID(),
	true = myEts:updateEts(PlayerEts, Code, [
		{#recMapObject.name,Name},
		{#recMapObject.x,X},
		{#recMapObject.y,Y},
		{#recMapObject.actionStatus,ActStatus},
		{#recMapObject.status,Status},
		{#recMapObject.level,Level},
		{#recMapObject.hp,Hp},
		{#recMapObject.maxHp,MaxHP},
		{#recMapObject.mp,Mp},
		{#recMapObject.vip, Vip},
		{#recMapObject.camp, Camp},
		{#recMapObject.buffList, BuffList},
		{#recMapObject.moveTargetList,MoveTargetList},
		%{#recMapObject.moveDir,MoveDir},
		{#recMapObject.moveRealDir,MoveRealDir},
		{#recMapObject.guild, GuildID},
		{#recMapObject.teamID, TeamID},
		{#recMapObject.groupID, GroupID}
	]),
	ok.

%%发送角色相关信息到客户端
-spec sendRoleInfo() -> ok.
sendRoleInfo() ->
	PlayerBaseInfo = makePlayerBaseInfo(),
	playerMsg:sendNetMsg(PlayerBaseInfo),
	playerPropSync:syncPropToClient(true),
	playerVariant:sendVariant2Client(),
	BattlePropInfo = makeBattlePropInfo(),
	playerMsg:sendNetMsg(BattlePropInfo),

	playerSkillLearn:sendSkillInfo2Client(),
	playerSkillLearn:sendSkillSlotInfo(),

	%%添加宝石添加的技能，并通知客户端
%%	屏蔽掉宝石精灵
%%	playerPackage:addGemSkill(),

	%% 背包大小信息
	playerPackage:sendInitBagSlotNetMsg(),
	sendSaveBuff(),
	%%到达等级才发送签到信息
	playerSignIn:addLogin(),
	Level = playerState:getLevel(),
	playerSignIn:checkAndSendInfo(Level),
	%% 发送好友离线消息
	playerFriend2:sendOfflineMsg(),
	%% 发送世界等级
	playerWorldLevel:sendWorldLevel(),

	%% 公会初始化
	playerGuild:init(),

	%% 好友系统修改后没有幸运币的概念，屏蔽幸运币相关代码
	%%% 幸运币获得信息
	%playerLuckyCoin:sendGetLuckyCoinInfo(),
	%% 发送玩家个性信息
	playerPersonalityInfo:sendInitInfo(),
	%%如果玩家上线时在活动的期间，通知客户端开启状态
	playerBase:sendGoblinOpenState(),
	%% 发送天赋信息
	playerTalent:sendTalentInfoToClient(),
	%% 发送军团副本初始信息
	playerGuildCopy:sendLastOverTime(),

	playerSkillLearn:sendSkillSlotSkillInfo2Client(),
	AchieveList = playerState:getPlayerAchieveList(),
	case AchieveList of
		[] ->
			playerAchieve:achieveEvent(?Achieve_Level, [1]);
		_ ->
			skip
	end,
	case core:isCross() of
		true ->
			skip;
		_ ->
			playerVipInter:addDropLuckly()
	end,

	%%发送所有物品，包括背包中的普通道具以及装备等等
	playerPackage:sendInitGoodsNetMsg(),
	%% 同步姻缘系统数据给玩家（必须在任务前）
	playerMarriage:init(),

	%%发送任务信息之前，检测是否可以领取环引导任务
	playerLoopTask:acceptLink(),
	%%发送所有已接受任务
%%	playerTask2:sendAllAcceptedTaskMsg(),
	%%发送所有已完成的任务
%%	playerTask2:sendAllCompleteTaskMsg(),
%%	playerTask:onLogin(Level),
	playerTask:sendAllCompleteTaskMsg(),
	playerTask:sendAllAcceptedTaskMsg(),

	%%补偿,请注意,必须在装备强化前面
	playerGive:giveReward(),
	playerSkillLearn:autoUpSkill(Level),
	%%	初始队伍
%%	playerTeam2:initTeam(),
	%%mwh-new-team
	playerTeam:sendInitTeamInfo(),
	playerEquip:initEquipRefine(),
	playerEquip:initEquipStar(),
	playerAchieve:initAchieve(),
	%%暂时屏蔽徽章
	%%playerBadge:initBadge(),
	playerUpdateReward:initUpdateReward(),
	playerTitle:initTitle(),
	case core:isCross() of
		true ->
			skip;
		_ -> playerGoddess:sendWakeList2ClientOnLogin()
	end,

	playerPetPvP:petPvpTip(),
	playerPet:sendPetInfoListToClient(),
	playerPet:sendPetEquipListToClient(),
	playerPetPvE:initPetPveList(),
	playerPetPvE:initPetPveInfo(),
	playerPetTerritory:init(),
	playerPet:sendPetAssistInfoListToClient(),
	playerDailySignIn:init(),
	playerOnlineReward:init(),
	playerDrop:initDrop(),
	playerRedName:broadCastKv(),
	MapID = playerState:getMapID(),
	playerPk:forcePeace(MapID),
	sendItemUsedCD(),
	playerDaily:sendToClient(),
	%%可参加BOSS战活动
	playerWorldBossWar:onLoginRoleCanIn(),
	%% 时装
	playerFashion:onLogin(),

%% 	%% 上线自动领月卡奖励
%% 	playerMonthCard:getGiftMsg(),
	playerGodWeapon:initGodWeapon(),
	playerWildBoss:sendWildBossInfo(),
	%%同步所有活动状态
	playerAcKingBattleAll:synAllActivityState(),

	playerBase:sendExpInDanInfo(),
	playerAnswer:answerQuestionInit(),

	playerMail:getSelfMailList(),
	playerACChargeOrUse:onPlayerLogin(),
	initLoginRole(playerState:getLevel()),
	%% 增加VIPBUFF
	playerVip:addVipBuff(),
	%% 宠物精灵
	%playerPetFairy:onRoleOnline(),
	playerGuildExpedition:playerOnLogin(),
	%% 初始化资源找回
	playerFindRes:initFindResList(),
	%% 发送符文背包给客户端
	playerRune:sendRuneDataToClient(),
	%%
	playerRedEnvelope:onPlayerLogin(),

	%% 玩家已经获得的收费表情和动作列表
	ICL1 = playerPropSync:getProp(?SerProp_PlayerBQs),
	ACL2 = playerPropSync:getProp(?SerProp_PlayerDZs),
	playerMsg:sendNetMsg(#pk_GS2U_HaveIconAndActionList{icons = ICL1, actions = ACL2}),

	%% 离线经验
	playerOfflineExp:initLastOfflineExp(),

	playerEquip:sendEquipRecastInit2Client(),

%%	playerLotteryForTower:flashBeginTimeEndTimeMsg(),
	playerMsg:sendNetMsg(#pk_GS2U_PlayerInitEnd{}),

	?DEBUG_OUT("send Role Info ok"),
	ok.

%%策划非得创建角色出来加属性，非得出来要觉醒,非得要满血,非得我这样写
initLoginRole(1) ->
	Hp = playerState:getMaxHp(),
	playerState:setCurHp(Hp),
	playerMsg:sendNetMsg(#pk_GS2U_PlayerHp{code = playerState:getPlayerCode(), hp = Hp}),
	skip;
initLoginRole(_) ->
	skip.

-spec sendItemUsedCD() -> ok.
sendItemUsedCD() ->
	List = playerState:getItemUsedTimeList(),
	Now = time:getUTCNowMSDiff2010(),
	Fun = fun(X,AccIn) ->
		GID = X#rec_item_used_cd.itemGroupID,
		case erlang:is_integer(GID) andalso GID > 0 of
			true ->
				LUT = X#rec_item_used_cd.lastUsedTime,
				#itemCDandCountCfg{value = CDTime} = getCfg:getCfgPStack(cfg_itemCDandCount, GID),
				Diff = Now - LUT,
				RemainCDTiem = case CDTime > Diff of
								   true ->
									   CDTime - Diff;
								   _ ->
									   0
							   end,
				[#pk_UseItemCD{itemGroupID = GID,remainCDTime = RemainCDTiem } | AccIn];
			_ ->
				AccIn
		end
		  end,
	MsgList = lists:foldl(Fun, [], List),
	playerMsg:sendNetMsg(#pk_GS2U_UseItem{vctUseItem = MsgList}),
	ok.


%% 查询并同步目标code到客户端
-spec querySyncTargetCode(TargetCode::uint()) -> ok.
querySyncTargetCode(0) ->
	ok;
querySyncTargetCode(TargetCode) ->
	case playerState:getPlayerCode() /= TargetCode of
		true ->
			%%?LOG_OUT("querySyncTargetCode:~p,~s,~p", [playerState:getRoleID(),playerState:getName(),TargetCode]),
			Type = codeMgr:getObjectTypeByCode(TargetCode),
			Pos = playerState:getPos(),
			MapPid = playerState:getMapPid(),
			GroupID = playerState:getGroupID(),
			if
				?ObjTypeMonster =:= Type ->
					List = mapView:getNearViewObject(MapPid, playerState:getMapMonsterEts(), Type, Pos, GroupID),
					case lists:keyfind(TargetCode, #recMapObject.code, List) of
						#recMapObject{} = Obj ->
							MonsterInfoList = findMonsterInfoList([Obj]),
							playerMsg:sendNetMsg(#pk_GS2U_MonsterList{monster_list = MonsterInfoList});
						_ ->
							skip
					end;
				?ObjTypePet =:= Type ->
					List = mapView:getNearViewObject(MapPid, playerState:getMapPetEts(), Type, Pos, GroupID),
					case lists:keyfind(TargetCode, #recMapObject.code, List) of
						#recMapObject{} = Obj ->
							PetInfoList = findPetInfoList([Obj]),
							playerMsg:sendNetMsg(#pk_GS2U_PetList{pet_list = PetInfoList});
						_ ->
							skip
					end;
				?ObjTypePlayer =:= Type ->
					List = mapView:getNearViewObject(MapPid, playerState:getMapPlayerEts(), Type, Pos, GroupID),
					case lists:keyfind(TargetCode, #recMapObject.code, List) of
						#recMapObject{pid = Pid} ->
							LookInfoPlayer = getLookInfoPlayer(),
							SelfPubPropValueList = playerPropSync:getPubPropValueList(),
							psMgr:sendMsg2PS(Pid, notifyNewPlayerInView, {playerState:getNetPid(),LookInfoPlayer,SelfPubPropValueList});
						_ ->
							skip
					end;
				true ->
					skip
			end;
		_ ->
			?ERROR_OUT("querySyncTargetCode target is self:~p,~s,~p", [playerState:getRoleID(),playerState:getName(),TargetCode])
	end,
	ok.
%%通知队伍成员自己的mapID
-spec notifyTeamMemberMapID(MapID) -> ok when
	MapID::uint16().
notifyTeamMemberMapID(MapID) ->
%%	case playerTeam2:getTeamAllMemberPidList(?PlayerTeamTypeNormal) of
%%		[] ->
%%			skip;
%%		TeamList ->
%%			MaxHp = playerState:getMaxHp(),
%%			CurHp = playerState:getCurHp(),
%%			PC = skill:getPercent(CurHp, MaxHp),
%%			Msg = #pk_GS2U_TeamMemberExtInfo{
%%				roleID = playerState:getRoleID(),
%%				level = playerState:getLevel(),
%%				hpPC = PC,
%%				mapID = MapID
%%			},
%%			case erlang:is_list(TeamList) of
%%				true ->
%%					[psMgr:sendMsg2PS(Pid, broadcast, Msg) || {_RoleID, Pid} <- TeamList, is_pid(Pid)];
%%				_ ->
%%					skip
%%			end
%%	end,
	ok.