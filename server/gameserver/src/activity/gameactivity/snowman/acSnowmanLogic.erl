%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170220
%%%-------------------------------------------------------------------
-module(acSnowmanLogic).
-author("meitianyang").

-include("acSnowmanPrivate.hrl").

%% 业务逻辑
-export([
	enterTry/1,
	checkSnowman/1,
	gatherSuccess/1,
	donate/2,

	gmNext/1,
	gmGetRes/1,
	gmCheckMonster/1,

	deleteGuild/1,
	leaveGuild/1,
	deleteRole/1
]).

%% 本进程调用的系统接口
-export([
	init/0,
	activityChangeCallBack/1,
	createActivityMapAck/1,
	activityMapMsg/2
]).

%% 外部进程调用
-export([
	sendSnowSettle/5
]).

%%% ====================================================================
%%% API functions 常规接口
%%% ====================================================================

%%----------------------------------------------------------------------------------------------
%% 请求进入堆雪人活动地图
-spec enterTry({RoleID::uint64(), IsGM::boolean()}) -> ok.
enterTry({RoleID, IsGM}) ->
	?DEBUG_OUT("[DebugForSnowman] enterTry RoleID:~p IsGM:~p", [RoleID, IsGM]),
	%% 1.验证公会
	case acSnowmanState:getGuildIDByRoleID(RoleID) of
		0 ->
			sendErrorCodeByRoleID(RoleID, ?ErrorCode_GuildSnowmanEnterNoFamily, [], ?LINE);	%% 没有加入家族，无法进入
		{GuildID, GuildLevel} ->
			%% 2.验证地图是否存在
			case acSnowmanState:getMapInfoByGuildID(GuildID) of
				#recMapInfo{state = ?MapState_Creating} ->
					sendErrorCodeByRoleID(RoleID, ?ErrorCode_GuildSnowmanEnterCreating, [], ?LINE);	%% 正在创建，请稍后进入
				#recMapInfo{state = ?MapState_Settle, mapPid = MapPid_} ->
					case IsGM of
						true ->
							enterTryNotice(MapPid_, RoleID);	%% 防止GM创建的地图无法被销毁
						_ ->
							sendErrorCodeByRoleID(RoleID, ?ErrorCode_GuildSnowmanEnterSetting, [], ?LINE)	%% 结算状态，活动结束，进去做什么
					end;
				#recMapInfo{mapPid = MapPid} ->
					%% 3.1 正常进入
					enterTryNotice(MapPid, RoleID);
				_ ->
					%% 3.2 地图不存在，验证是否是活动时间（非活动时间可以使用GM命令创建好地图再进入，便于测试）
					%% 仅限于准备阶段和主玩法阶段创建地图，其余阶段无法进行有效地玩耍
					CanCreate =
						case IsGM of
							true ->
								true;
							_ ->
								case acSnowmanState:getStage() of
									?MapState_Ready ->
										true;
									?MapState_Playing ->
										true;
									_ ->
										false
								end
						end,
					case CanCreate of
						false ->
							sendErrorCodeByRoleID(RoleID, ?ErrorCode_GuildSnowmanEnterNotActive, [], ?LINE);	%% 不在活动时间禁止进入
						_ ->
							%% 创建地图
							?DEBUG_OUT("[DebugForSnowman] onEnterMap RoleID:~p GuildID:~p will createActivityMap", [RoleID, GuildID]),
							acSnowmanState:replaceMapInfo(#recMapInfo{guildID = GuildID, guildLv = GuildLevel, isGM = IsGM}),
							core:sendMsgToMapMgr(?GuildSnowmanMapID, createActivityMap, {?GuildSnowmanMapID, 1, {GuildID, RoleID}})
					end
			end
	end,
	ok.

%%----------------------------------------------------------------------------------------------
%% 请求雪人状态
-spec checkSnowman(RoleID::uint64()) -> ok.
checkSnowman(RoleID) ->
	?DEBUG_OUT("[DebugForSnowman] checkSnowman RoleID:~p", [RoleID]),
	case acSnowmanState:getMapInfoByRoleID(RoleID) of
		#recMapInfo{snowmanBuilding = ListResSnowman, snowmanCount = Count,
			guildLv = GuildLevel, subState = SubState} ->
			#guildCfg{snowman = CountMax} =
				getCfg:getCfgPStack(cfg_guild, GuildLevel),
			sendNetMsgByRoleID(
				RoleID,
				#pk_GS2U_Guild_SnowmanSnowman_Sync{
					count			= Count,
					countMax		= CountMax,
					subState		= SubState,
					listResSnowman	= ListResSnowman
				}
			);
		_ ->
			skip
	end,
	ok.

%%----------------------------------------------------------------------------------------------
%% 采集成功
-spec gatherSuccess({RoleID::uint64(), GatherID::uint32()}) -> ok.
gatherSuccess({RoleID, GatherID}) ->
	?DEBUG_OUT("[DebugForSnowman] gatherSuccess RoleID:~p GatherID:~p", [RoleID, GatherID]),
	case acSnowmanState:getMapInfoByRoleID(RoleID) of
		#recMapInfo{listPlayerInfo = ListPlayerInfo} = MapInfoOld ->
			case acSnowmanState:configSnowmanID(GatherID, ?SrcType_Collect) of
				0 ->
					?ERROR_OUT("gatherSuccess can not find GatherID:~p from cfg_guildsnowman", [GatherID]);
				ID ->
					%% 检查携带的材料
					PlayerInfoOld =
						#recMapPlayerInfo{
							resource = ListResPlayer
						} = getPlayerInfo(RoleID, ListPlayerInfo),
					#guildsnowmanCfg{
						name = Name,
						carryMax = CarryMax
					} = acSnowmanState:configSnowman(ID),
					case lists:nth(ID, ListResPlayer) >= CarryMax of
						true ->
							%% 已达材料上限
							sendErrorCodeByRoleID(RoleID, ?ErrorCode_GuildSnowmanEnterCarryMax, [Name], ?LINE);
						_ ->
							%% 更新携带的材料
							ListResPlayerNew = resAdd(ListResPlayer, ID, 1),
							PlayerInfoNew = PlayerInfoOld#recMapPlayerInfo{resource = ListResPlayerNew},
							ListPlayerInfoNew = lists:keystore(RoleID, #recMapPlayerInfo.roleID, ListPlayerInfo, PlayerInfoNew),
							acSnowmanState:replaceMapInfo(
								MapInfoOld#recMapInfo{
									listPlayerInfo = ListPlayerInfoNew
								}
							),
							%% 反馈消息
							sendNetMsgByRoleID(
								RoleID,
								#pk_GS2U_Guild_SnowmanPlayer_Sync{
									listResPlayer	= ListResPlayerNew
								}
							)
					end
			end;
		_ ->
			skip
	end,
	ok.

%%----------------------------------------------------------------------------------------------
%% 捐献
-spec donate(FromPid::pid(), {RoleID::uint64(), SubState::uint32(), SnowmanID::uint32()}) -> ok.
donate(FromPid, {RoleID, SubState, SnowmanID}) ->
	?DEBUG_OUT("[DebugForSnowman] donate RoleID:~p ResID:~p SnowmanID:~p", [RoleID, SubState, SnowmanID]),
	case acSnowmanState:getMapInfoByRoleID(RoleID) of
		#recMapInfo{state = ?MapState_Settle} ->
			skip;	%% 结算阶段忽略捐献
		#recMapInfo{listPlayerInfo = ListPlayerInfo, snowmanBuilding = ListResSnowman,
			guildLv = GuildLevel, snowmanCount = Count, subState = SubState,
			mapPid = MapPid, state = State} = MapInfoOld ->
			%% 材料ID已在角色进程检查过了
			%% 1.检查已完成雪人是否已达上限
			#guildCfg{snowman = CountMax} =
				getCfg:getCfgPStack(cfg_guild, GuildLevel),
			case Count >= CountMax orelse SnowmanID =< Count of
				true ->
					checkSnowman(RoleID); %% 堆满了雪人，不能再堆了；或者指定的雪人已经完成。同步雪人状态
				_ ->
					%% 2.无脑将自身指定材料全部捐献给正在建设的雪人
					PlayerInfoOld =
						#recMapPlayerInfo{
							resource = ListResPlayer,
							count = CountOld
						} = getPlayerInfo(RoleID, ListPlayerInfo),
					ListResSnowmanMax = acSnowmanState:configSnowmanNeed(),
					{
						ListResPlayerNew,
						ListResSnowmanNew0,
						ListResDonate
					} = donate(
						ListResPlayer,
						ListResSnowman,
						ListResSnowmanMax,
						SubState,
						1,
						{[], [], []}
					),
					%% 3.如果有数据变化则更新数据
					case ListResPlayerNew of
						ListResPlayer ->
							skip;	%% 什么都没捐
						_ ->
							%% 4.雪人材料满则生成新的完整雪人
							{ListResSnowmanNew1, CountNew, SubStateNew} =
								case ListResSnowmanNew0 of
									ListResSnowmanMax ->
										%% 全满
										{resZero(), Count + 1, 1};
									_ ->
										case lists:nth(SubState, ListResSnowmanNew0) =:=
											lists:nth(SubState, ListResSnowmanMax) of
											true ->
												%% 指定材料满
												{ListResSnowmanNew0, Count, SubState + 1};
											_ ->
												%% 都没满
												{ListResSnowmanNew0, Count, SubState}
										end
								end,
							%% 5.子进度如果有变化则需要重置玩家携带资源并重新刷怪/采集物
							Donate = lists:nth(SubState, ListResDonate),
							PlayerInfoNew = PlayerInfoOld#recMapPlayerInfo{
								resource = ListResPlayerNew,
								count = CountOld + Donate
							},
							ListPlayerInfoNew0 = lists:keystore(RoleID, #recMapPlayerInfo.roleID, ListPlayerInfo, PlayerInfoNew),
							ListPlayerInfoNew =
								case SubState of
									SubStateNew ->
										ListPlayerInfoNew0;
									_ ->
										ListSZero = resZero(),
										[R#recMapPlayerInfo{resource = ListSZero} || R <- ListPlayerInfoNew0]
								end,
							spawnMonsterOrCollect(SubStateNew, MapPid),
							%% 6.保存新的数据
							MapInfoNew =
								MapInfoOld#recMapInfo{
									listPlayerInfo = ListPlayerInfoNew,
									snowmanBuilding = ListResSnowmanNew1,
									snowmanCount = CountNew,
									subState = SubStateNew
								},
							acSnowmanState:replaceMapInfo(MapInfoNew),
							%% 7.反馈角色进程进行奖励发放
							%?DEBUG_OUT("[DebugForSnowman] ExpAll:~p ExpBase:~p Level:~p ListResDonate:~p", [ExpAll, ExpBase, Level, ListResDonate]),
							psMgr:sendMsg2PS(FromPid, snowman_donateAck, {SubState, Donate}),
							%% 8.捐赠成功，广播消息
							syncAll2(RoleID, MapInfoNew),
							%% 9.堆完所有雪人跳过等待阶段直接结算
							case CountNew of
								CountMax ->
									updateStage(?MapState_Settle, MapInfoNew#recMapInfo{state = ?MapState_Wait});
								_ ->
									skip
							end
					end
			end;
		_ ->
			skip
	end,
	ok.

%%----------------------------------------------------------------------------------------------
%% GM命令进入下一阶段
-spec gmNext(RoleID::uint64()) -> ok.
gmNext(RoleID) ->
	case acSnowmanState:getMapInfoByRoleID(RoleID) of
		#recMapInfo{isGM = true, state = State} = MapInfo ->
			?DEBUG_OUT("[DebugForSnowman] gmNext RoleID:~p State:~w", [RoleID, State]),
			updateStage(State + 1, MapInfo);
		_E ->
			%% 该地图非GM地图或者地图不存在……
			?ERROR_OUT("gmNext invalid call~n~p", [_E])
	end,
	ok.

%%----------------------------------------------------------------------------------------------
%% GM命令获得携带材料
-spec gmGetRes({RoleID::uint64(), ResID::uint32(), Count::uint32()}) -> ok.
gmGetRes({RoleID, ResID, Count}) ->
	?DEBUG_OUT("[DebugForSnowman] gmGetRes RoleID:~p ResID:~p Count:~p", [RoleID, ResID, Count]),
	case acSnowmanState:getMapInfoByRoleID(RoleID) of
		#recMapInfo{isGM = true, mapPid = MapPid} ->
			ListCount = lists:seq(1, Count),
			case acSnowmanState:configSnowman(ResID) of
				#guildsnowmanCfg{srcType = ?SrcType_Monster, srcID = MonsterID} ->
					%% 模拟杀怪掉落
					lists:foreach(
						fun(_) ->
							activityMapMsg(?ACMapMsg_KillMonster, {?GuildSnowmanMapID, MapPid, RoleID, 0, MonsterID})
						end,
						ListCount
					);
				#guildsnowmanCfg{srcType = ?SrcType_Collect, srcID = CollectID} ->
					%% 模拟采集成功
					lists:foreach(
						fun(_) ->
							gatherSuccess({RoleID, CollectID})
						end,
						ListCount
					);
				_InvalidCfg ->
					%% 配置错误或GM命令错误
					?ERROR_OUT("gmGetRes invalid Cfg or invalid GM call~n~p", [{ResID, _InvalidCfg}])
			end;
		_E ->
			%% 该地图非GM地图或者地图不存在……
			?ERROR_OUT("gmGetRes invalid call~n~p", [_E])
	end,
	ok.

%%----------------------------------------------------------------------------------------------
%% GM查询怪物信息
-spec gmCheckMonster(RoleID::uint64()) -> ok.
gmCheckMonster(RoleID) ->
	?DEBUG_OUT("[DebugForSnowman] gmCheckMonster RoleID:~p", [RoleID]),
	case acSnowmanState:getMapInfoByRoleID(RoleID) of
		#recMapInfo{isGM = true, etsMonster = EtsMonster} ->
			FunDebug =
				fun(#recMapObject{code = Code, id = ID, x = X, y = Y, hp = HP, ownId = OwnId}, _) ->
					?DEBUG_OUT("[DebugForSnowman] gmCheckMonster Code:~p ID:~p X:~p Y:~p HP:~p OwnID:~p", [Code, ID, X, Y, HP, OwnId]),
					ok
				end,
			ets:foldl(FunDebug, 0, EtsMonster);
		_E ->
			%% 该地图非GM地图或者地图不存在……
			?ERROR_OUT("gmCheckMonster invalid call~n~p", [_E])
	end,
	ok.

%%----------------------------------------------------------------------------------------------
%% 异常处理：解散军团（解散家族）
-spec deleteGuild(GuildID::uint64()) -> ok.
deleteGuild(GuildID) ->
	?LOG_OUT("deleteGuild GuildID:~p", [GuildID]),
	case acSnowmanState:getMapInfoByGuildID(GuildID) of
		#recMapInfo{mapPid = MapPid} = MapInfo ->
			psMgr:sendMsg2PS(MapPid, resetCopyMap, {}),	%% 直接销毁地图
			acSnowmanState:deleteMapInfo(MapInfo);
		_ ->
			skip
	end,
	ok.

%%----------------------------------------------------------------------------------------------
%% 异常处理：退出军团（退出家族）
-spec leaveGuild({GuildID::uint64(), RoleID::uint64()}) -> ok.
leaveGuild({GuildID, RoleID}) ->
	?LOG_OUT("leaveGuild GuildID:~p RoleID:~p", [GuildID, RoleID]),
	case acSnowmanState:getMapInfoByGuildID(GuildID) of
		#recMapInfo{etsPlayer = EtsPlayer} ->
			%% 如果目标角色在目标地图上，则踢出
			case core:queryOnLineRoleByRoleID(RoleID) of
				#rec_OnlinePlayer{code = Code} ->
					case ets:lookup(EtsPlayer, Code) of
						[#recMapObject{pid = Pid}] ->
							psMgr:sendMsg2PS(Pid, kickCopyMapPlayer, {});
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%%----------------------------------------------------------------------------------------------
%% 异常处理：删除角色
-spec deleteRole({GuildID::uint64(), RoleID::uint64()}) -> ok.
deleteRole({GuildID, RoleID}) ->
	?LOG_OUT("deleteRole GuildID:~p RoleID:~p", [GuildID, RoleID]),
	case acSnowmanState:getMapInfoByGuildID(GuildID) of
		#recMapInfo{listPlayerInfo = ListPlayerInfo} = MapInfoOld ->
			%% 删除该角色的活动数据
			ListPlayerInfoNew = lists:keydelete(RoleID, #recMapPlayerInfo.roleID, ListPlayerInfo),
			acSnowmanState:replaceMapInfo(MapInfoOld#recMapInfo{listPlayerInfo = ListPlayerInfoNew});
		_ ->
			skip
	end,
	ok.

%%% ====================================================================
%%% API functions 系统接口
%%% ====================================================================

%%----------------------------------------------------------------------------------------------
%% 活动管理器回调
-spec init() -> ok.
init() ->
	?DEBUG_OUT("[DebugForSnowman] init"),
	acSnowmanState:initMapInfoEts(),
	ok.

%%----------------------------------------------------------------------------------------------
%% 心跳

%%----------------------------------------------------------------------------------------------
%% 活动管理器回调
-spec activityChangeCallBack(Phase::uint()) -> ok.
activityChangeCallBack(Phase) ->
	acSnowmanState:setStage(Phase),

	%% 回调
	activityChangeCallBack2(Phase),

	%% 刷新地图
	updateStage(Phase),
	ok.

%% （由于地图是第一个尝试进入的角色触发进行创建的，因此活动阶段由无法由该接口统一更新，而改为本进程使用心跳检测更新）
%% 不过由于只执行1次这个特性，可以用来触发走马灯
-spec activityChangeCallBack2(Phase::uint()) -> ok.
activityChangeCallBack2(?ActivityPhase_Close) ->
	?DEBUG_OUT("[DebugForSnowman] activityChangeCallBack ?ActivityPhase_Close"),
	ok;
activityChangeCallBack2(?MapState_Sleep) ->
	?DEBUG_OUT("[DebugForSnowman] activityChangeCallBack ?MapState_Sleep"),
	%% 忽略
	ok;
activityChangeCallBack2(?MapState_Ready) ->
	?DEBUG_OUT("[DebugForSnowman] activityChangeCallBack ?MapState_Ready"),
	%% 清空所有家族的雪人数量
	psMgr:sendMsg2PS(?PsNameGuild, resetSnowman, 0),
	%% 不用清空所有角色的雪人领奖记录变量每次获取时根据时间可自动校正
	ok;
activityChangeCallBack2(?MapState_Playing) ->
	?DEBUG_OUT("[DebugForSnowman] activityChangeCallBack ?MapState_Playing"),
	% 取消走马灯，改为特定消息发送
	psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {snowman_beginNotice, 0}),
	%case getCfg:getCfgPStack(cfg_activity, ?ActivityType_Snowman) of
	%	#activityCfg{stage = [_StageReady, StagePlaying, _StageWait, _StageSettle]} ->
	%		Min = StagePlaying div 60,
	%		Content = stringCfg:getString(guild_snowman_begin, [Min]),
	%		core:sendBroadcastNotice(Content);
	%	_ ->
	%		?ERROR_OUT("can not find ?ActivityType_Snowman from cfg_activity")
	%end,
	ok;
activityChangeCallBack2(?MapState_Wait) ->
	?DEBUG_OUT("[DebugForSnowman] activityChangeCallBack ?MapState_Wait"),
	% 取消走马灯
	%case getCfg:getCfgPStack(cfg_activity, ?ActivityType_Snowman) of
	%	#activityCfg{stage = [_StageReady, _StagePlaying, StageWait, _StageSettle]} ->
	%		Min = StageWait div 60,
	%		Content = stringCfg:getString(guild_snowman_end, [Min]),
	%		core:sendBroadcastNotice(Content);
	%	_ ->
	%		?ERROR_OUT("can not find ?ActivityType_Snowman from cfg_activity")
	%end,
	ok;
activityChangeCallBack2(?MapState_Settle) ->
	?DEBUG_OUT("[DebugForSnowman] activityChangeCallBack ?MapState_Settle"),
	ok.

%%----------------------------------------------------------------------------------------------
%% 创建地图成功（比?ACMapMsg_CreateMap更先收到）
-spec createActivityMapAck({MapID::uint(), ListMapPid::list(), {GuildID::uint64(), RoleID::uint64()}}) -> ok.
createActivityMapAck({_MapID, [MapPid], {GuildID, RoleID}} = _Data) ->
	?DEBUG_OUT("[DebugForSnowman] createActivityMapAck RoleID:~p GuildID:~p", [RoleID, GuildID]),
	case acSnowmanState:getMapInfoByGuildID(GuildID) of
		#recMapInfo{state = ?MapState_Creating} = MapInfoOld ->
			acSnowmanState:replaceMapInfo(MapInfoOld#recMapInfo{mapPid = MapPid, creatorID = RoleID});
		_E ->
			?ERROR_OUT("createActivityMapAck RoleID:~p GuildID:~p ~n~p", [RoleID, GuildID, _E]),
			psMgr:sendMsg2PS(MapPid, resetCopyMap, {})	%% 错误的创建，强制关闭
	end,
	ok.

%%----------------------------------------------------------------------------------------------
%% 活动地图的消息
-spec activityMapMsg(MsgType::uint(), Data::term()) -> ok.
%% 创建后的初始化消息
activityMapMsg(?ACMapMsg_CreateMap, {_CreatorRoleID, _MapID, MapPid, PlayerEts, MonsterEts, CollectEts, _NpcEts} = _Data) ->
	%?DEBUG_OUT("[DebugForSnowman] activityMapMsg ?ACMapMsg_CreateMap ~p", [_Data]),
	case acSnowmanState:getMapInfoByMapPid(MapPid) of
		#recMapInfo{state = ?MapState_Creating, creatorID = CreatorID} = MapInfo ->
			MapInfoNew =
				MapInfo#recMapInfo{
					state			= ?MapState_Ready,	%% 没错，这里直接跳过了sleep阶段，因为sleep阶段就不允许创建地图
					etsPlayer		= PlayerEts,
					etsMonster		= MonsterEts,
					etsCollect		= CollectEts,
					snowmanBuilding	= resZero()
				},
			acSnowmanState:replaceMapInfo(MapInfoNew),

			%% 刷新活动地图
			updateStage(acSnowmanState:getStage()),

			enterTryNotice(MapPid, CreatorID);	%% 通知创建者进入
		_E ->
			?ERROR_OUT("activityMapMsg ?ACMapMsg_CreateMap ~p", [_E]),
			psMgr:sendMsg2PS(MapPid, resetCopyMap, {})	%% 错误的创建，强制关闭
	end,
	ok;
%% 销毁地图
activityMapMsg(?ACMapMsg_DestoryMap, MapPid) ->
	%?DEBUG_OUT("[DebugForSnowman] activityMapMsg ?ACMapMsg_DestoryMap ~p", [MapPid]),
	acSnowmanState:deleteMapInfo(MapPid),
	ok;
%% 击杀怪物
activityMapMsg(?ACMapMsg_KillMonster, {_MapID, _MapPid, AttackRoleID, _MonsterCode, MonsterID} = _Data) ->
	%?DEBUG_OUT("[DebugForSnowman] activityMapMsg ?ACMapMsg_KillMonster ~p", [_Data]),
	case acSnowmanState:getMapInfoByRoleID(AttackRoleID) of
		#recMapInfo{listPlayerInfo = ListPlayerInfo, etsPlayer = EtsPlayer} = MapInfoOld ->
			case acSnowmanState:configSnowmanID(MonsterID, ?SrcType_Monster) of
				0 ->
					?ERROR_OUT("activityMapMsg ?ACMapMsg_KillMonster can not find MonsterID:~p from cfg_guildsnowman", [MonsterID]);
				ID ->
					%% 从击杀者队伍中随机选取1人作为奖励获得者
					%% 无队伍时只有自己
					ListTeamMember = getListTeamMemberID(AttackRoleID, EtsPlayer),
					Rand = misc:rand(1, erlang:length(ListTeamMember)),
					RoleID = lists:nth(Rand, ListTeamMember),
					%% 检查携带的材料
					PlayerInfoOld =
						#recMapPlayerInfo{
							resource = ListResPlayer
						} = getPlayerInfo(RoleID, ListPlayerInfo),
					#guildsnowmanCfg{
						name = Name,
						carryMax = CarryMax
					} = acSnowmanState:configSnowman(ID),
					case lists:nth(ID, ListResPlayer) >= CarryMax of
						true ->
							%% 已达材料上限
							sendErrorCodeByRoleID(RoleID, ?ErrorCode_GuildSnowmanEnterCarryMax, [Name], ?LINE);
						_ ->
							%% 更新携带的材料
							ListResPlayerNew = resAdd(ListResPlayer, ID, 1),
							PlayerInfoNew = PlayerInfoOld#recMapPlayerInfo{resource = ListResPlayerNew},
							ListPlayerInfoNew = lists:keystore(RoleID, #recMapPlayerInfo.roleID, ListPlayerInfo, PlayerInfoNew),
							acSnowmanState:replaceMapInfo(
								MapInfoOld#recMapInfo{
									listPlayerInfo = ListPlayerInfoNew
								}
							),
							%% 反馈消息
							sendNetMsgByRoleID(
								RoleID,
								#pk_GS2U_Guild_SnowmanPlayer_Sync{
									listResPlayer	= ListResPlayerNew
								}
							)
					end
			end;
		_ ->
			skip
	end,
	ok;
%% 角色进入
activityMapMsg(?ACMapMsg_PlayerEnter,  {RoleID, MapPid, _} = _Data) ->
	%?DEBUG_OUT("[DebugForSnowman] activityMapMsg ?ACMapMsg_PlayerEnter ~p", [_Data]),
	case acSnowmanState:getMapInfoByMapPid(MapPid) of
		#recMapInfo{} = MapInfo ->
			syncAll(RoleID, MapInfo);
		_E ->
			?ERROR_OUT("activityMapMsg ?ACMapMsg_PlayerEnter Invalid MapPid:~p ~n~p", [MapPid, _E]),
			psMgr:sendMsg2PS(MapPid, resetCopyMap, {})	%% 错误的地图数据，强制关闭
	end,
	ok;
%% 忽略其它消息
activityMapMsg(_, _) ->
	ok.

%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%%----------------------------------------------------------------------------------------------
%% 向角色发送ErrorCode
-spec sendErrorCodeByRoleID(RoleID::uint64(), ErrorCode::uint32(), Param::list(), Line::uint32()) -> ok.
sendErrorCodeByRoleID(RoleID, ErrorCode, Param, _Line) ->
	?DEBUG_OUT("[DebugForSnowman] sendErrorCodeByPid RoleID:~p ErrorCode:~p Param:~p Line:~p", [RoleID, ErrorCode, Param, _Line]),
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{netPid = NetPid} ->
			playerMsg:sendErrorCodeMsg(NetPid, ErrorCode, Param);
		_ ->
			skip
	end.

%%----------------------------------------------------------------------------------------------
%% 向角色发送网络消息
-spec sendNetMsgByRoleID(RoleID::uint64(), Msg::term()) -> ok.
sendNetMsgByRoleID(RoleID, Msg) ->
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{netPid = NetPid} ->
			playerMsg:sendNetMsg(NetPid, Msg);
		_ ->
			skip
	end.

%%----------------------------------------------------------------------------------------------
%% 通知角色进入地图
-spec enterTryNotice(MapPid::pid(), RoleID::uint64()) -> ok.
enterTryNotice(MapPid, RoleID) ->
	?DEBUG_OUT("[DebugForSnowman] enterTryNotice RoleID:~p MapPid:~p", [RoleID, MapPid]),
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{pid = Pid} ->
			syncAll(RoleID, acSnowmanState:getMapInfoByRoleID(RoleID)),	%% 客户端可能存在先进入地图遇到NPC再收到初始化消息，这里提前发送初始化消息
			psMgr:sendMsg2PS(Pid, snowman_enterTryAck, MapPid);
		_ ->
			skip
	end.

%%----------------------------------------------------------------------------------------------
%% 查找指定的活动角色数据
-spec getPlayerInfo(RoleID::uint64(), ListPlayerInfo::[#recMapPlayerInfo{}, ...]) -> #recMapPlayerInfo{}.
getPlayerInfo(RoleID, ListPlayerInfo) ->
	case lists:keyfind(RoleID, #recMapPlayerInfo.roleID, ListPlayerInfo) of
		#recMapPlayerInfo{} = Rec ->
			Rec;
		_ ->
			ListZero = resZero(),
			#recMapPlayerInfo{
				roleID		= RoleID,
				resource	= ListZero
			}
	end.

%%----------------------------------------------------------------------------------------------
%% 材料列表中指定值增加
-spec resAdd(ListRes::[uint32(), ...], ID::uint32(), Add::uint32()) -> ListResNew::[uint32(), ...].
resAdd(ListRes, ID, Add) ->
	FunUpdate =
		fun(Res, {Count, ListResNewR}) ->
			case Count =:= ID of
				true ->
					{Count + 1, [Res + Add | ListResNewR]};
				_ ->
					{Count + 1, [Res | ListResNewR]}
			end
		end,
	{_, ListResNewR} = lists:foldl(FunUpdate, {1, []}, ListRes),
	lists:reverse(ListResNewR).

%%----------------------------------------------------------------------------------------------
%% 生成空的材料序列
-spec resZero() -> ListRes::[uint32(), ...].
resZero() ->
	lists:foldl(
		fun(_, R) ->
			[0 | R]
		end,
		[],
		getCfg:get1KeyList(cfg_guildsnowman)
	).

%%----------------------------------------------------------------------------------------------
%% 同步雪人状态和自己的材料携带量
-spec syncAll(RoleID::uint64(), MapInfo::#recMapInfo{}) -> ok.
syncAll(RoleID, #recMapInfo{listPlayerInfo = ListPlayerInfo, snowmanBuilding = ListResSnowman, snowmanCount = Count, subState = SubState, guildLv = GuildLevel}) ->
	#recMapPlayerInfo{
		resource = ListResPlayer
	} = getPlayerInfo(RoleID, ListPlayerInfo),
	#guildCfg{snowman = CountMax} =
		getCfg:getCfgPStack(cfg_guild, GuildLevel),
	sendNetMsgByRoleID(
		RoleID,
		#pk_GS2U_Guild_SnowmanAll_Sync{
			count			= Count,
			countMax		= CountMax,
			subState		= SubState,
			listResSnowman	= ListResSnowman,
			listResPlayer	= ListResPlayer
		}
	),
	ok.

%%----------------------------------------------------------------------------------------------
%% 捐献成功后对捐献人执行syncAll/2，对其他人仅同步雪人状态
-spec syncAll2(RoleID::uint64(), MapInfo::#recMapInfo{}) -> ok.
syncAll2(RoleID, #recMapInfo{snowmanBuilding = ListResSnowman, snowmanCount = Count, etsPlayer = EtsPlayer, guildLv = GuildLevel, subState = SubState} = MapInfo) ->
	syncAll(RoleID, MapInfo),
	#guildCfg{snowman = CountMax} =
		getCfg:getCfgPStack(cfg_guild, GuildLevel),
	Msg =
		#pk_GS2U_Guild_SnowmanSnowman_Sync{
			count			= Count,
			countMax		= CountMax,
			subState		= SubState,
			listResSnowman	= ListResSnowman
		},
	Fun2 =
		fun(#recMapObject{id = AnotherRoleID, netPid = NetPid}, _) ->
			case AnotherRoleID of
				RoleID ->
					skip;
				_ ->
					playerMsg:sendNetMsg(NetPid, Msg)
			end
		end,
	ets:foldl(Fun2, 0, EtsPlayer),
	ok.

%%----------------------------------------------------------------------------------------------
%% 获得同队伍的角色ID
-spec getListTeamMemberID(RoleID::uint64(), EtsPlayer::etsTab()) -> [uint64(), ...].
getListTeamMemberID(RoleID, EtsPlayer) ->
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{code = Code} ->
			case ets:lookup(EtsPlayer, Code) of
				[#recMapObject{teamID = TeamID}] when TeamID > 0 ->
					FunFind =
						fun(#recMapObject{id = RoleID_, teamID = TeamID_}, R) ->
							case TeamID_ of
								TeamID ->
									[RoleID_ | R];
								_ ->
									R
							end
						end,
					ets:foldl(FunFind, [], EtsPlayer);
				_ ->
					[RoleID]	%% 没有队伍，只有自己
			end;
		_ ->
			[RoleID]	%% 只在怪物被击杀时调用，此时不在线不正常，但依然要走后面的流程
	end.

%%----------------------------------------------------------------------------------------------
%% 捐献
-spec donate(
	ListResPlayer::[uint32(), ...],
	ListResSnowman::[uint32(), ...],
	ListResSnowmanMax::[uint32(), ...],
	ResID::uint32(),
	Count::uint32(),
	Acc::{[uint32(), ...], [uint32(), ...], [uint32(), ...]}
) ->
	{
		ListResPlayerNew::[uint32(), ...],
		ListResSnowmanNew::[uint32(), ...],
		ListResDonate::[uint32(), ...]
	}.
%% ResID =:= 0 全部类型捐献
%% 遍历结束，计算中结果为反序，反转后返回
donate([], [], _, _, _, {ListResPlayerNewR, ListResSnowmanNewR, ListResDonateR}) ->
	{
		lists:reverse(ListResPlayerNewR),
		lists:reverse(ListResSnowmanNewR),
		lists:reverse(ListResDonateR)
	};
%% ResID =:= Count 时，遇到了指定捐献的材料，执行捐献
donate([HPlayer|TPlayer], [HSnowman|TSnowman], [HSnowmanMax|TSnowmanMax],
	ResIDAsSameCount, ResIDAsSameCount,
	{ListResPlayerNewR, ListResSnowmanNewR, ListResDonateR}) ->
	{HPlayerNew, HSnowmanNew} =
		case HPlayer + HSnowman > HSnowmanMax of
			true ->
				{HPlayer + HSnowman - HSnowmanMax, HSnowmanMax};
			_ ->
				{0, HPlayer + HSnowman}
		end,
	donate(
		TPlayer, TSnowman, TSnowmanMax,
		ResIDAsSameCount, ResIDAsSameCount + 1,
		{[HPlayerNew | ListResPlayerNewR], [HSnowmanNew | ListResSnowmanNewR], [HPlayer - HPlayerNew | ListResDonateR]}
	);
%% ResID =:= 0 时，所有材料都执行捐赠
donate([HPlayer|TPlayer], [HSnowman|TSnowman], [HSnowmanMax|TSnowmanMax],
	0, Count,
	{ListResPlayerNewR, ListResSnowmanNewR, ListResDonateR}) ->
	{HPlayerNew, HSnowmanNew} =
		case HPlayer + HSnowman > HSnowmanMax of
			true ->
				{HPlayer + HSnowman - HSnowmanMax, HSnowmanMax};
			_ ->
				{0, HPlayer + HSnowman}
		end,
	donate(
		TPlayer, TSnowman, TSnowmanMax,
		0, Count + 1,
		{[HPlayerNew | ListResPlayerNewR], [HSnowmanNew | ListResSnowmanNewR], [HPlayer - HPlayerNew | ListResDonateR]}
	);
%% 其余情况忽略
donate([HPlayer|TPlayer], [HSnowman|TSnowman], [_HSnowmanMax|TSnowmanMax],
	ResID, Count,
	{ListResPlayerNewR, ListResSnowmanNewR, ListResDonateR}) ->
	donate(
		TPlayer, TSnowman, TSnowmanMax,
		ResID, Count + 1,
		{[HPlayer | ListResPlayerNewR], [HSnowman | ListResSnowmanNewR], [0 | ListResDonateR]}
	).

%%----------------------------------------------------------------------------------------------

%%----------------------------------------------------------------------------------------------
%% 更新地图的活动阶段
-spec updateStage(Stage::type_MapState()) -> ok.
updateStage(?MapState_Sleep) ->
	%% 该阶段用于时间校正，忽略
	ok;
updateStage(?MapState_Ready) ->
	%% 地图创建成功初始化后自动进入准备阶段，故此处忽略
	ok;
updateStage(Stage) ->
	ListMapInfo = acSnowmanState:getListMapInfo(),
	Fun =
		fun(Rec) ->
			updateStage(Stage, Rec)
		end,
	lists:foreach(Fun, ListMapInfo),
	ok.

%%----------------------------------------------------------------------------------------------
%% 同上
-spec updateStage(Stage::type_MapState(), MapInfo::#recMapInfo{}) -> ok.
updateStage(?MapState_Complete, #recMapInfo{mapPid = MapPid} = MapInfoOld) ->
	%% 活动完成阶段忽略
	%% 发现一个地图，kill一个地图
	acSnowmanState:deleteMapInfo(MapInfoOld),
	psMgr:sendMsg2PS(MapPid, resetCopyMap, {}),
	ok;
updateStage(?MapState_Sleep, #recMapInfo{}) ->
	%% 活动沉睡阶段忽略
	ok;
updateStage(?MapState_Ready, #recMapInfo{}) ->
	%% 活动准备阶段忽略
	ok;
updateStage(_, #recMapInfo{state = ?MapState_Complete}) ->
	%% 忽略已完成的地图
	ok;
updateStage(_, #recMapInfo{state = ?MapState_Creating}) ->
	%% 忽略还在创建或者没有创建的地图
	ok;
updateStage(?MapState_Playing, #recMapInfo{state = ?MapState_Ready, mapPid = MapPid, subState = SubState} = MapInfoOld) ->
	%% 所有处于准备阶段的地图进入主玩法阶段
	acSnowmanState:replaceMapInfo(MapInfoOld#recMapInfo{state = ?MapState_Playing}),
	%% 除了更改状态还需要刷怪、刷采集物
	spawnMonsterOrCollect(SubState, MapPid),
	ok;
updateStage(?MapState_Wait, #recMapInfo{mapPid = MapPid} = MapInfoOld) ->
	%% 所有处于主玩法阶段的地图进入等待阶段
	acSnowmanState:replaceMapInfo(MapInfoOld#recMapInfo{state = ?MapState_Wait}),
	%% 除了更改状态还需要清怪、清采集物
	psMgr:sendMsg2PS(MapPid, clearAllObject, [?CodeTypeMonster, ?CodeTypeCollect]),
	ok;
updateStage(?MapState_Settle, #recMapInfo{guildID = GuildID,
	snowmanCount = Count, listPlayerInfo = ListPlayerInfo, etsPlayer = EtsPlayer} = MapInfoOld) ->
	%% 所有处于等待阶段的地图进入结算阶段
	acSnowmanState:replaceMapInfo(MapInfoOld#recMapInfo{state = ?MapState_Settle}),
	%% 结算发放奖励
	%% 0.通知家族进程设置新的雪人值
	psMgr:sendMsg2PS(?PsNameGuild, setSnowman, {GuildID, Count}),
	case Count > 0 of
		true ->
			%% 1.根据完成的雪人数量发放奖励
			#guildsnoman_settleCfg{rl = [Resource, Liveness]} = Cfg =
				getCfg:getCfgPStack(cfg_guildsnoman_settle, Count),
			playerGuild:addguildresource(GuildID, Resource * Count),
			playerGuild:addguildliveness(GuildID, Liveness * Count),
			settle(Cfg, ListPlayerInfo);
		_ ->
			skip
	end,
	%% 2.根据每人的贡献度排序，贡献度一样则按时间升序排列
	[#rec_guild{guildName = GuildName}] =
		ets:lookup(rec_guild, GuildID),
	Msg = #pk_GS2U_Guild_SnowmanSettle_Sync{
		guildName = GuildName,
		count = Count
	},
	%% 4.将结算消息发给本地图角色
	FunSend =
		fun(#recMapObject{netPid = NetPid}, _) ->
			playerMsg:sendNetMsg(NetPid, Msg)
		end,
	ets:foldl(FunSend, 0, EtsPlayer),
	ok;
updateStage(ErrorState, Info) ->
	%% 其它情况忽略
	?ERROR_OUT("updateStage:~p,~p", [ErrorState, Info]),
	ok.

%% 根据子状态刷怪或者刷采集物
-spec spawnMonsterOrCollect(SubState::uint32(), MapPid::pid()) -> ok.
spawnMonsterOrCollect(SubState, MapPid) ->
	%% 先清理别的怪物或者采集物
	psMgr:sendMsg2PS(MapPid, clearAllObject, [?CodeTypeMonster, ?CodeTypeCollect]),
	%% 刷对应子状态的对象
	Msg =
		case getCfg:getCfgPStack(cfg_guildsnowman, SubState) of
			#guildsnowmanCfg{srcType = ?SrcType_Monster, srcID = MonsterID, pos = ListPosM} ->
				lists:foldl(
					fun({X, Y}, RM) ->
						Arg =
							#recSpawnMonster{
								id      = MonsterID,
								mapID   = ?GuildSnowmanMapID,
								mapPid  = MapPid,
								x       = erlang:float(X),
								y       = erlang:float(Y),
								groupID = 0
							},
						[{Arg, 0, 0, 0} | RM]
					end,
					[],
					ListPosM
				);
			#guildsnowmanCfg{srcType = ?SrcType_Collect, srcID = CollectID, pos = ListPosC} ->
				lists:foldl(
					fun({X, Y}, RC) ->
						Arg =
							#recSpawnCollect{
								id      = CollectID,
								x    	= erlang:float(X),
								y    	= erlang:float(Y),
								groupID = 0
							},
						[{Arg, 0, 0, 0} | RC]
					end,
					[],
					ListPosC
				)
		end,
	?DEBUG_OUT("[DebugForSnowman] spawnMonsterOrCollect SubState:~w~n~p", [SubState, Msg]),
	psMgr:sendMsg2PS(MapPid, spawnObject, Msg),
	ok.

%% 角色相关结算奖励
-spec settle(Cfg::#guildsnoman_settleCfg{}, ListPlayerInfo::[#recMapPlayerInfo{}, ...]) -> ok.
settle(#guildsnoman_settleCfg{coin = Coin, item = Item}, ListPlayerInfo) ->
	%% 1.筛选出成功捐献过材料的角色
	FunFilter =
		fun(#recMapPlayerInfo{roleID = RoleID, count = Count}, R) ->
			case Count > 0 of
				true ->
					[RoleID | R];
				_ ->
					R
			end
		end,
	ListRoleID = lists:foldl(FunFilter, [], ListPlayerInfo),
	%% 2.对以上成员发放邮件奖励（玩家可能不在线）
	Title = stringCfg:getString(guild_snowman_headline),
	Content = stringCfg:getString(guild_snowman_award),
	CoinReal =
		case Coin of
			undefined -> [];
			"[]" -> [];
			_ -> Coin
		end,
	ItemReal =
		case Item of
			undefined -> [];
			"[]" -> [];
			_ -> Item
		end,
	FunMail =
		fun(RoleID) ->
			%% 有可能出现，这里判断到在线，但是发过去的时候，玩家已经不在了，那么这个人就领不到奖，这种情况可能出现，但是机率比较小，不考虑，记录一个日志好了
			case core:queryOnLineRoleByRoleID(RoleID) of
				#rec_OnlinePlayer{pid = Pid} ->
					?LOG_OUT("settle RoleID=~p, ItemReal=~p, CoinReal=~p", [RoleID, ItemReal, CoinReal]),
					psMgr:sendMsg2PS(Pid, snow_settle, {RoleID, Title, Content, ItemReal, CoinReal});
				_ ->
					sendSnowSettle(false, RoleID, Title, Content, ItemReal),
					sendSnowSettle(true, RoleID, Title, Content, CoinReal)
			end
		end,
	lists:foreach(FunMail, ListRoleID),
	ok.

%% 雪人奖励
-spec sendSnowSettle(IsCoin::boolean(), RoleID::uint64(), Title::string(), Content::string(), {CoinType::uint32(), CoinNum::uint32()}) -> ok.
sendSnowSettle(true, RoleID, Title, Content, {CoinType, CoinNum}) ->
	MailCoin = playerMail:createMailCoin(CoinType, CoinNum),
	mail:sendSystemMail(RoleID, Title, Content, [MailCoin], ""),
	ok;
sendSnowSettle(false, RoleID, Title, Content, {ItemID, ItemCount}) ->
	MailItemList = playerMail:createMailGoods(ItemID, ItemCount, true, 0, RoleID, ?ItemSourceGuildSnowman),
	mail:sendSystemMail(RoleID, Title, Content, MailItemList, ""),
	ok;
sendSnowSettle(IsCoin, RoleID, Title, Content, [Obj | List]) ->
	sendSnowSettle(IsCoin, RoleID, Title, Content, Obj),
	sendSnowSettle(IsCoin, RoleID, Title, Content, List);
sendSnowSettle(IsCoin, RoleID, Title, Content, Param) ->
	?ERROR_OUT("IsCoin=~p, RoleID=~p, Title=~p, Content=~p, Param=~p",
		[IsCoin, RoleID, Title, Content, Param]),
	ok.