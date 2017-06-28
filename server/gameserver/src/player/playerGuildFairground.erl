%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170503
%%%-------------------------------------------------------------------
-module(playerGuildFairground).
-author("meitianyang").

-include("playerPrivate.hrl").
-include("../guild/guildPrivate.hrl").

%% MSG
-export([
	enter_try/1,	%% 尝试进入游乐场
	onUseRide/2		%% 使用游乐场设施 乘坐、取消乘坐、升级
]).

%% API
-export([
	init/0,					%% 初始化游乐场功能角色部分
	getGuildFairground/0,	%% 获取当前所在游乐场信息
	getGuildFairground/1,	%% 获取指定游乐场信息
	callbackEnter/0,		%% 进入游乐场回调
	callbackLeaveGuild/0,	%% 离开家族回调
	isCanEnter/1,			%% 是否可以进入指定游乐场
	isIn/0,					%% 是否处于任意游乐场
	isIn/1,					%% 是否处于指定游乐场
	queryRideUser/1,		%% 查询指定家族游乐场中所有设施的使用情况
	queryRideUser/2,		%% 查询指定家族游乐场中指定设施的使用情况
	useRideAck/1,			%% 使用游乐场设施反馈
	useRide_check/6,		%% 乘坐或取消乘坐设施前检查
	useRide_check/5,		%% 乘坐或取消乘坐设施前检查
	useRide_check/4,		%% 升级设施前检查
	tryRideDown/2,			%% 离开地图或下线引起的尝试取消乘坐操作
	onReward/1				%% 获取奖励
]).



%%% ====================================================================
%%% MSG functions
%%% ====================================================================

%% 尝试进入游乐场
-spec enter_try(TargetGuildID::uint64()) -> ok.
enter_try(TargetGuildID) ->
	SelfGuildID = playerState:getGuildID(),
	enter_try(SelfGuildID, TargetGuildID),
	ok.
-spec enter_try(SelfGuildID::uint64(), TargetGuildID::uint64()) -> term().
enter_try(0, _TargetGuildID) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_GuildNotJoin);
enter_try(_SelfGuildID, 0) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_Guild_TargetNotExist);
enter_try(_SelfGuildID, TargetGuildID) ->
	case isCanEnter(TargetGuildID) of
		false ->
			skip;
		_ ->
			playerScene:onRequestEnterGuildFairground(TargetGuildID)
	end.

-spec onUseRide(RideID::typeRideType(), UseType::typeRideUseType()) -> ok.
onUseRide(RideID, UseType) when RideID >= ?RideType_Start andalso RideID =< ?RideType_End
	andalso UseType > ?RideUseType_BEGIN andalso UseType =< ?RideUseType_END ->
	{TX, TY} =
		case ets:lookup(playerState:getMapNpcEts(), playerState:getSelectTargetCode()) of
			[#recMapObject{x = X, y = Y}] -> {X, Y};
			_ -> {0, 0}
		end,
	{SX, SY} = playerState:getPos(),
	DX = SX - TX,
	DY = SY - TY,
	case math:sqrt(DX * DX + DY * DY) < 10 of
		true ->
			?DEBUG_OUT("useRide guildID=~p, roleID=~p, rideID=~p, type=~p",
				[playerState:getGuildID(), playerState:getRoleID(), RideID, UseType]),
			useRide(RideID, UseType);
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_PetDoubleMountFarFrom)
	end;
onUseRide(RideID, UseType) ->
	?ERROR_OUT("useride roldid=~p, rideid=~p, type=~p",
		[playerState:getRoleID(), RideID, UseType]),
	ok.

%% 尝试使用游乐设施
-spec useRide(RideID::typeRideType(), Type::typeRideUseType()) -> ok.
useRide(RideID, ?RideUseType_Up) ->
	RoleID = playerState:getRoleID(),
	NetPid = playerState:getNetPid(),
	case useRide_check(RoleID, NetPid, 0, RideID, true) of
		false ->
			skip;
		#recGuildRideParam{
			guildID = GuildID,
			cfg =
			#guild_rideCfg{
				level = RideLevel,
				costType = CostType,
				costValue = CostValue,
				buffID = BuffID
			}
		} ->
			%% 检测免费使用次数
			#globalsetupCfg{setpara = [FreeCount]} =
				getCfg:getCfgPStackWithDefaultValue(
					cfg_globalsetup,
					#globalsetupCfg{setpara = [1]},
					guild_fairground_free
				),
			UseCount = playerDaily:getDailyCounter(?DailyType_GuildRideUse, 0),
			case UseCount < FreeCount of
				true ->
					%% 免费乘坐
					playerDaily:incDailyCounter(?DailyType_GuildRideUse, 0),

					case RideID of
						?RideType_IceCream ->
							onReward(BuffID);
						_ ->
							UR = getPlayerRecUseRide(),
							MsgFree = UR#recUseRide{guildID = GuildID, type = ?RideUseType_Up, rideID = RideID},
							psMgr:sendMsg2PS(?PsNameGuild, guildFairground_ride, MsgFree)
					end;
				_ ->
					%% 需要消费
					PLog =
						#recPLogTSMoney{
							target = ?PLogTS_Guild,
							source = ?PLogTS_PlayerSelf,
							reason = ?CoinUseGuildFairgroundRide,
							param = {RideID, RideLevel}
						},
					case playerMoney:quickUseCoin(CostType, CostValue, PLog, {?ErrorCode_GuildFairground_CoinLess, []}) of
						true ->
							playerDaily:incDailyCounter(?DailyType_GuildRideUse, 0),

							case RideID of
								?RideType_IceCream ->
									onReward(BuffID);
								_ ->
									UR = getPlayerRecUseRide(),
									MsgPaid =
										UR#recUseRide{
											type = ?RideUseType_Up,
											guildID = GuildID,
											rideID = RideID,
											exParam = {CostType, CostValue}
										},
									psMgr:sendMsg2PS(?PsNameGuild, guildFairground_ride, MsgPaid)
							end;
						_ ->
							skip
					end
			end
	end,
	ok;
useRide(RideID, ?RideUseType_Down) ->
	RoleID = playerState:getRoleID(),
	NetPid = playerState:getNetPid(),
	case useRide_check(RoleID, NetPid, 0, RideID, false) of
		false ->
			skip;
		#recGuildRideParam{guildID = GuildID} ->
			UR = getPlayerRecUseRide(),
			Msg =
				UR#recUseRide{
					type = ?RideUseType_Down,
					guildID = GuildID,
					rideID = RideID
				},
			psMgr:sendMsg2PS(?PsNameGuild, guildFairground_ride, Msg)
	end,
	ok;
useRide(RideID, ?RideUseType_Upgrade) ->
	RoleID = playerState:getRoleID(),
	NetPid = playerState:getNetPid(),
	GuildID = playerState:getGuildID(),
	case useRide_check(RoleID, NetPid, GuildID, RideID) of
		false ->
			skip;
		{RideLevel, _NeedRes, _Res} ->
			UR = getPlayerRecUseRide(),
			Msg =
				UR#recUseRide{
					type = ?RideUseType_Upgrade,
					rideID = RideID,
					exParam = RideLevel
				},
			psMgr:sendMsg2PS(?PsNameGuild, guildFairground_ride, Msg)
	end,
	ok;
useRide(RideID, RideUseType) ->
	?ERROR_OUT("useRide roleid=~p,~p,~p", [playerState:getRoleID(), RideID, RideUseType]),
	ok.

%% BUFF奖励
onReward(BuffID) when erlang:is_integer(BuffID) andalso BuffID > 0 ->
	playerBuff:addBuff(BuffID, 1),
	case getCfg:getCfgPStack(cfg_buff, BuffID) of
		#buffCfg{buffName = Name} ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaGatherBuff, [Name]);
		_ ->
			skip
	end,
	ok;
onReward(BuffID) ->
	?ERROR_OUT("onreward roleID=~p, buffid=~p", [playerState:getRoleID(), BuffID]),
	ok.

%% 乘坐或取消乘坐设施前检查
-spec useRide_check(RoleID::uint64(), NetPid::pid(), GuildIDIn::uint64(), RideID::uint32(), UpOrDown::boolean()) -> false | #recGuildRideParam{}.
useRide_check(RoleID, NetPid, GuildIDIn, RideID, UpOrDown) ->
	useRide_check(RoleID, NetPid, GuildIDIn, RideID, UpOrDown, playerState:getMapPid()).

%% 乘坐或取消乘坐设施前检查
-spec useRide_check(RoleID::uint64(), NetPid::pid(), GuildIDIn::uint64(), RideID::uint32(), UpOrDown::boolean(), MapPID::pid()) -> false | #recGuildRideParam{}.
useRide_check(RoleID, NetPid, GuildIDIn, RideID, UpOrDown, MapPID) ->
	%% 1.检查是否处于任意游乐场中
	case getGuildFairground(MapPID) of
		#recGuildFairground{mapPid = undefined} ->
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_GuildFairground_NeedIn),
			false;
		#recGuildFairground{guildID = GuildID}
			when GuildIDIn =:= 0; GuildID =:= GuildIDIn ->	%% 这里判断0是让角色进程忽略验证而仅由公共进程验证
			useRide_check_(RoleID, NetPid, GuildID, RideID, UpOrDown, guildState:queryRide(GuildID, RideID));
		#recGuildFairground{guildID = GuildID} ->
			%% 公共进程处理该消息时，角色已经换了不同的家族游乐场，直接判断操作失败
			%% 这种情况应该只在理论上才能出现
			?ERROR_OUT("useRide_check guildID is changed! RoleID:~w GuildID:~w GuildIDIn:~w", [RoleID, GuildID, GuildIDIn]),
			false
	end.

useRide_check_(_RoleID, NetPid, GuildID, RideID, true, #rec_guild_ride{rideLevel = 0}) ->
	?ERROR_OUT("useRide_check_ up invalid rideID(~w) guildID(~w)", [RideID, GuildID]),
	playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_GuildFairground_ErrorRideID),
	false;
useRide_check_(_RoleID, NetPid, _GuildID, _RideID, true, #rec_guild_ride{rideState = ?RideState_Maintain}) ->
	playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_GuildFairground_Maintain),
	false;
useRide_check_(_RoleID, NetPid, _GuildID, _RideID, true, #rec_guild_ride{rideState = ?RideState_Close}) ->
	playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_GuildFairground_Close),
	false;
useRide_check_(RoleID, NetPid, GuildID, RideID, true, #rec_guild_ride{rideState = ?RideState_Open, rideLevel = RideLevel} = Ride) ->
	%% 检查设施使用情况
	#guild_rideCfg{playerMax = CountMax} = Cfg =
		getCfg:getCfgPStack(cfg_guild_ride, RideID, RideLevel),
	RecGuildRideUser = queryRideUser(GuildID, RideID),
	ListRideUser = [Role || #recGuildRideUser{role = Role} <- RecGuildRideUser],
	%% 乘坐操作下需要额外判断
	case ets:lookup(?EtsGuildRideUser, RoleID) of
		[#recGuildRideUser{}] ->
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_GuildFairground_Riding),
			false;
		_ ->
			case erlang:length(ListRideUser) < CountMax of
				false ->
					playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_GuildFairground_Full),
					false;
				_ ->
					%% 没有乘坐任何设施，可以乘坐
					#recGuildRideParam{
						guildID = GuildID,
						cfg = Cfg,
						ride = Ride,
						listUser = ListRideUser
					}
			end
	end;
useRide_check_(_RoleID, NetPid, GuildID, RideID, false, #rec_guild_ride{rideLevel = 0}) ->
	?ERROR_OUT("useRide_check_ down invalid rideID(~w) guildID(~w)", [RideID, GuildID]),
	playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_GuildFairground_ErrorRideID),
	false;
useRide_check_(RoleID, _NetPid, GuildID, RideID, false, #rec_guild_ride{rideLevel = RideLevel} = Ride) ->
	%% 设备存在时始终允许下设备
	Cfg = getCfg:getCfgPStack(cfg_guild_ride, RideID, RideLevel),
	RecGuildRideUser = queryRideUser(GuildID, RideID),
	ListRideUser = [Role || #recGuildRideUser{role = Role} <- RecGuildRideUser],
	%% 取消乘坐操作下的最终判断
	case lists:keyfind(RoleID, #pk_RideRole.roleID, ListRideUser) of
		#pk_RideRole{} ->
			%% 正在乘坐目标设施，可以取消乘坐
			#recGuildRideParam{
				guildID = GuildID,
				cfg = Cfg,
				ride = Ride,
				listUser = ListRideUser
			};
		_ ->
			%% 没有乘坐目标设施，忽略取消乘坐
			false
	end.

%% 升级设施前检查
-spec useRide_check(RoleID::uint64(), NetPid::pid(), GuildIDIn::uint64(), RideID::uint32()) ->
	false |
	{RideLevel::uint(), NeedRes::uint(), Res::uint()}.
useRide_check(RoleID, NetPid, GuildID, RideID) ->
	case guildState:queryRide(GuildID, RideID) of
		#rec_guild_ride{rideLevel = 0} ->
			%% 如果没有加入家族，必然设备等级为0
			%% 如果已经加入家族，可能传参RideID错误
			%% 也有可能是cfg_guild_ride新增设备导致数据未能正确初始化
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_GuildNotJoin),
			false;
		#rec_guild_ride{rideLevel = RideLevel} ->
			#guild_rideCfg{
				upgrade = NeedRes,
				upgradePower = PowerLimit
			} = getCfg:getCfgPStack(cfg_guild_ride, RideID, RideLevel),
			%% 验证家族等级限制
			case ets:lookup(rec_guild, GuildID) of
				[#rec_guild{guildLevel = GuildLevel}]
					when RideLevel >= GuildLevel ->
					playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_GuildFairground_LevelLimit),
					false;
				%% 验证资金
				[#rec_guild{resource = Res}] when Res >= NeedRes ->
					%% 验证配置等级限制
					case getCfg:getCfgByKey(cfg_guild_ride, RideID, RideLevel + 1) of
						#guild_rideCfg{} ->
							%% 验证权限
							case ets:lookup(rec_guild_member, RoleID) of
								[#rec_guild_member{power = Power, guildID = GuildID}]
									when Power >= PowerLimit ->
									{RideLevel, NeedRes, Res};
								_ ->
									false
							end;
						_ ->
							playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_GuildFairground_LevelMax),
							false
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_GuildWar_GuildResNot),
					false
			end
	end.

%%% ====================================================================
%%% API functions
%%% ====================================================================

-spec init() -> ok.
init() ->
	ok.

%% 查看自己已处于的游乐场地图信息
-spec getGuildFairground() -> #recGuildFairground{}.
getGuildFairground() ->
	MapPid = playerState:getMapPid(),
	getGuildFairground(MapPid).
-spec getGuildFairground(MapPid::pid()) -> GuildID::uint64().
getGuildFairground(MapPid) ->
	MatchSpec = ets:fun2ms(fun(T) when T#recGuildFairground.mapPid =:= MapPid -> T end),
	case myEts:selectEts(?EtsGuildFairground, MatchSpec) of
		[#recGuildFairground{} = GuildFairground] ->
			GuildFairground;
		[] ->
			#recGuildFairground{}
	end.

%% 进入游乐场回调
-spec callbackEnter() -> ok.
callbackEnter() ->
	case playerState:getMapID() of
		?GuildFairgroundMapID ->
			case getGuildFairground() of
				#recGuildFairground{mapPid = undefined} ->
					?ERROR_OUT("callbackEnter be called without GuildFairground~n~p", [misc:getStackTrace()]);
				#recGuildFairground{guildID = GuildID} ->
					#recGuildRide{listRide = ListRide} =
						guildState:queryGuildRide(GuildID),
					ListRideNew =
						[
							#pk_Ride{id = ID, level = Lv, state = St} ||
							#rec_guild_ride{rideID = ID, rideLevel = Lv, rideState = St}
								<- ListRide
						],
					ListRole = queryRideUser(GuildID),
					ListRoleNew = [Role || #recGuildRideUser{role = Role} <- ListRole],
					Msg =
						#pk_GS2U_Guild_FairgroundEnter_Ack{
							guildID = GuildID,
							listRide = ListRideNew,
							listRole = ListRoleNew
						},
					playerMsg:sendNetMsg(Msg)
			end;
		_ ->
			skip
	end,
	ok.

%% 离开家族回调
-spec callbackLeaveGuild() -> ok.
callbackLeaveGuild() ->
	case isIn() of
		true ->
			playerCopyMap:leaveCopyMap();
		_ ->
			skip
	end,
	ok.

%% 是否可以进入目标游乐场
-spec isCanEnter(TargetGuildID::uint64()) -> boolean().
isCanEnter(TargetGuildID) ->
	case getGuildFairground() of
		#recGuildFairground{guildID = GuildID} when GuildID =/= TargetGuildID ->
			true;	%% 不同游乐场之间切换，允许
		_ ->
			false	%% 相同游乐场之内切换，不允许
	end.

%% 是否在处于目标游乐场
-spec isIn() -> boolean().
isIn() ->
	case getGuildFairground() of
		#recGuildFairground{mapPid = undefined} ->
			false;
		_ ->
			true
	end.
-spec isIn(GuildID::uint64()) -> boolean().
isIn(0) ->
	false;
isIn(GuildID) ->
	MapPid = playerState:getMapPid(),
	case ets:lookup(?EtsGuildFairground, GuildID) of
		[#recGuildFairground{mapPid = MapPid}] ->
			true;
		_ ->
			false
	end.

%% 查询指定家族游乐场中所有设施的使用情况
-spec queryRideUser(GuildID::uint64()) -> [#recGuildRideUser{}, ...].
queryRideUser(GuildID) ->
	MatchSpec = ets:fun2ms(
		fun(T)
			when T#recGuildRideUser.role#pk_RideRole.guildID =:= GuildID ->
			T
		end
	),
	ets:select(?EtsGuildRideUser, MatchSpec).

%% 查询指定家族游乐场中的指定设施的使用情况
-spec queryRideUser(GuildID::uint64(), RideID::uint32()) -> [#recGuildRideUser{}, ...].
queryRideUser(GuildID, RideID) ->
	MatchSpec = ets:fun2ms(
		fun(T)
			when T#recGuildRideUser.role#pk_RideRole.guildID =:= GuildID,
			T#recGuildRideUser.role#pk_RideRole.rideID =:= RideID ->
			T
		end
	),
	ets:select(?EtsGuildRideUser, MatchSpec).

%% 使用游乐场设施反馈
-spec useRideAck(UseRide::#recUseRide{}) -> ok.
useRideAck(#recUseRide{type = ?RideUseType_Up, exParam = 0}) ->
	%% 免费乘坐，仅返还次数
	playerDaily:reduceDailyCounter(?DailyType_GuildRideUse, 0, 1),
	ok;
useRideAck(#recUseRide{type = ?RideUseType_Up, rideID = RideID, exParam = {CostType, CostValue}}) ->
	%% 付费乘坐，返还次数和费用
	playerDaily:reduceDailyCounter(?DailyType_GuildRideUse, 0, 1),
	PLog =
		#recPLogTSMoney{
			target = ?PLogTS_PlayerSelf,
			source = ?PLogTS_Guild,
			reason = ?CoinSourceGuildFairgroundRide,
			param = RideID
		},
	MoneyType =
		case CostType of
			?CoinUseTypeGold ->
				?CoinTypeGold;
			?CoinUseTypeDiamond ->
				?CoinTypeBindDiamond;
			?CoinUseTypeDiamondJustNotBind ->
				?CoinTypeBindDiamond;
			?CoinUseTypeGuildContribute ->
				?CoinTypeGuildContribute;
			_ ->
				?ERROR_OUT("invalid CostType(~w) CostValue(~w)", [CostType, CostValue])
		end,
	playerMoney:addCoin(MoneyType, CostValue, PLog),
	ok.

%% 离开地图或下线引起的尝试取消乘坐操作
-spec tryRideDown(RoleID::uint64(), MapPid::pid()) -> ok.
tryRideDown(RoleID, MapPid) ->
	MatchSpec = ets:fun2ms(
		fun(T)
			when T#recGuildRideUser.roleID =:= RoleID ->
			T
		end
	),
	case ets:select(?EtsGuildRideUser, MatchSpec) of
		[] ->
			skip;
		[#recGuildRideUser{role = #pk_RideRole{rideID = RideID}} | _] ->
			case useRide_check(RoleID, undefined, 0, RideID, false, MapPid) of
				false ->
					skip;
				#recGuildRideParam{guildID = GuildID} ->
					UR = getPlayerRecUseRide(),
					Msg =
						UR#recUseRide{
							roleID = RoleID,
							pid = undefined,
							mapPid = MapPid,
							netPid = undefined,
							guildID = GuildID,
							rideID = RideID
						},
					psMgr:sendMsg2PS(?PsNameGuild, guildFairground_ride, Msg)
			end
	end,
	ok.

getPlayerRecUseRide() ->
	#recUseRide{
		type = ?RideUseType_Down,
		roleID = playerState:getRoleID(),
		pid = self(),
		mapPid = playerState:getMapPid(),
		netPid = playerState:getNetPid(),
		guildID = playerState:getGuildID(),
		rideID = 0,
		exParam = 0
	}.