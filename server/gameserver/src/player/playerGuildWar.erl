%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 军团城战
%%% @end
%%% Created : 19. 十月 2015 17:42
%%%-------------------------------------------------------------------
-module(playerGuildWar).
-author("tiancheng").

-include("../activity/gameactivity/guildwar/acGuildwarPrivate.hrl").
-include("playerPrivate.hrl").

%% 军团城战最大参与数量
-define(GuildWarMaxNumber, 6).

%% Msg
-export([
	requestGuildWar/0,
	bidding/1,
	useCannon/2
]).

%% API
-export([
	joinGuildWarBiddingAck/1,
	getGuildName/1,
	playerDead/1,
	getRevivePos/1,
	playerEnterMapReal/0,
	requestEnterGuildWar/1,
	playerLeaveGuildWar/0
]).

useCannon(CannonCode, TargetGuildID) ->
	case playerState:getMapID() =:= ?GuildWarMapID of
		true ->
			%% 判断是否死亡
			case playerState:getCurHp() > 0 of
				true ->
					ETS = playerState:getMapCollectEts(),
					case myEts:lookUpEts(ETS, CannonCode) of
						[#recMapObject{type = ?ObjTypeCollect, id = ID}] ->
							#globalsetupCfg{setpara = L} = getCfg:getCfgPStack(cfg_globalsetup, cannon_xy),
							case lists:keymember(ID, 1, L) of
								true ->
									core:sendMsgToActivity(
										?ActivityType_GuildWar,
										guildWarGatherSuccess,
										{playerState:getMapPid(), playerState:getRoleID(), playerState:getNetPid(), CannonCode, TargetGuildID}),
									ok;
								_ ->
									skip
							end;
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			true
	end,
	ok.

playerLeaveGuildWar() ->
	case playerState:getMapID() =:= ?GuildWarMapID of
		true ->
			playerCopyMap:leaveCopyMap();
		_ ->
			skip
	end,
	ok.

requestEnterGuildWar(?GuildWarMapID) ->
	case playerState:getMapID() =:= ?GuildWarMapID of
		false ->
			GuildID = playerState:getGuildID(),
			case GuildID > 0 of
				true ->
					Lvl = playerGuild:getGuildSelfLevel(),
					case Lvl >= ?GuildMemLevel_Admin of
						true ->
							case myEts:lookUpEts(recGuildWarPlayer, GuildID) of
								[#recGuildWarPlayer{mapPID = MapPID, bornPos = {X, Y}}] ->
									playerScene:onRequestEnterActivityMap(?GuildWarMapID, MapPID, X, Y);
								Error ->
									?ERROR_OUT("requestEnterGuildWar:~p, ~p, ~p, ~p", [?GuildWarMapID, playerState:getRoleID(), GuildID, Error]),
									playerMsg:sendErrorCodeMsg(?ErrorCode_GuildWar_NotStartBattle)
							end;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_GuildWar_OnlyGuildAdminJoin)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_GuildWar_OnlyGuildJoin)
			end;
		_ ->
			skip
	end,
	ok;
requestEnterGuildWar(_CopyMapID) ->
	false.

playerEnterMapReal() ->
	case playerState:getMapID() =:= ?GuildWarMapID of
		true ->
			GuildID = playerState:getGuildID(),
			RoleID = playerState:getRoleID(),
			case GuildID > 0 of
				true ->
					%% 再验证下职位
					case ets:lookup(rec_guild_member, RoleID) of
						[#rec_guild_member{power = RoleGuildLvl}] when RoleGuildLvl >= ?GuildMemLevel_Admin ->
%%							case playerState:getTeamID() > 0 of
%%								true ->
%%									%% 离开队伍
%%									playerTeam2:leaveTeam(?PlayerTeamTypeNormal);
%%								_ ->
%%									skip
%%							end,

							playerTeam:leaveTeam(false),

							%% 军团杀戮
							playerPk:tranState(?PlayerMutiKillStatus),

							core:sendMsgToActivity(
								?ActivityType_GuildWar,
								playerEnterMapReal,
								{playerState:getMapPid(), GuildID, RoleID, playerState:getName(), playerState:getNetPid()}),
							ok;
						_ ->
							%% 职位不对了，离开
							playerCopyMap:leaveCopyMap()
					end;
				_ ->
					%% 不在军团中了，离开
					playerCopyMap:leaveCopyMap()
			end;
		_ ->
			skip
	end,
	ok.

playerDead(AttackRoleID) ->
	GuildID = playerState:getGuildID(),
	case GuildID > 0 of
		true ->
			case playerState:getMapID() =:= ?GuildWarMapID of
				true ->
					List = playerState:getHateList(),
					F =
						fun(#recHate{hateCode = HateCode}, Acc) ->
							case codeMgr:getObjectTypeByCode(HateCode) of
								?ObjTypePlayer ->
									PlayerEts = playerState:getMapPlayerEts(),
									case myEts:lookUpEts(PlayerEts, HateCode) of
										[#recMapObject{id = ID}] ->
											[ID | Acc];
										_ ->
											Acc
									end;
								_ ->
									Acc
							end
						end,
					HateRoleList = lists:foldl(F, [], List),

					%% 排除击杀者
					core:sendMsgToActivity(?ActivityType_GuildWar, playerDead,
						{playerState:getMapPid(), playerState:getRoleID(), AttackRoleID, lists:delete(AttackRoleID, HateRoleList)}),

					case myEts:lookUpEts(recGuildWarPlayer, GuildID) of
						[#recGuildWarPlayer{startTime = 0, reviveCD = CD}] ->
							{true, CD};
						[#recGuildWarPlayer{startTime = STime, reviveCD = CD}] ->
							NowTime = time:getSyncTime1970FromDBS(),
							#globalsetupCfg{setpara = [CXTime]} = getCfg:getCfgPStack(cfg_globalsetup, resurrection_tozero),
							case NowTime - STime >= CXTime of
								true ->
									{true, 0};
								_ ->
									{true, CD}
							end;
						_ ->
							{false, 0}
					end;
				_ ->
					{false, 0}
			end;
		_ ->
			{false, 0}
	end.

getRevivePos(MapID) ->
	GuildID = playerState:getGuildID(),
	case GuildID > 0 of
		true ->
			case MapID =:= ?GuildWarMapID of
				true ->
					case myEts:lookUpEts(recGuildWarPlayer, GuildID) of
						[#recGuildWarPlayer{bornPos = Pos}] ->
							Pos;
						_ ->
							false
					end;
				_ ->
					false
			end;
		_ ->
			false
	end.

%% 请求竞价军团列表与自己军团信息和分组信息
requestGuildWar() ->
	%% 发送物资列表
	sendGuildBiddingToClient(playerState:getGuildID()),

	%% 发送分组列表
	sendGuildWarBattle(),
	ok.

sendGuildWarBattle() ->
	L = edb:readAllRecord(rec_guild_war),
	F =
		fun(#rec_guild_war{stage = {S, G}, group = G, guildID1 = G1, guildID2 = G2, guildID3 = G3, winguildID = WG}) ->
			#pk_GuildWar{
				stage = S,
				group = G,
				guildID1 = G1,
				guildName1 = getGuildName(G1),
				guildID2 = G2,
				guildName2 = getGuildName(G2),
				guildID3 = G3,
				guildName3 = getGuildName(G3),
				winguildID = WG,
				winguildName = getGuildName(WG)
			}
		end,
	L2 = lists:map(F, L),
	playerMsg:sendNetMsg(#pk_GS2U_GuildWar{list = L2}),
	ok.

sendGuildBiddingToClient() ->
	sendGuildBiddingToClient(playerState:getGuildID()).

sendGuildBiddingToClient(GuildID) ->
	L = edb:readAllRecord(rec_guild_war_paid),
	F1 =
		fun(#rec_guild_war_paid{guildID = G1, paidmoney = P1}, #rec_guild_war_paid{guildID = G2, paidmoney = P2}) ->
			if
				P1 > P2 -> true;
				P1 =:= P2 andalso G1 < G2 -> true;
				true ->
					false
			end
		end,
	L2 = lists:sort(F1, L),

	F2 =
		fun(_, {LL, AccList}) ->
			{R, LR} =
				case LL of
					[#rec_guild_war_paid{guildID = G, paidmoney = P}|LRRR] ->
						{#pk_BiddingGuild{
							guildID = G,
							guildName = getGuildName(G),
							biddingMoney = P
						}, LRRR};
					_ ->
						#globalsetupCfg{setpara = [NeedMoney]} = getCfg:getCfgPStack(cfg_globalsetup, bidding),
						{#pk_BiddingGuild{
							guildID = 0,
							guildName = "",
							biddingMoney = NeedMoney
						}, []}
				end,
			{LR, [R | AccList]}
		end,
	{_, RetL} = lists:foldl(F2, {L2, []}, lists:seq(1, ?GuildWarMaxNumber)),

	Res = case erlang:is_integer(GuildID) andalso GuildID > 0 of
			  true ->
				  case ets:lookup(rec_guild, GuildID) of
					  [#rec_guild{resource = R}] -> R;
					  _ -> 0
				  end;
			  _ -> 0
	      end,
	RetL2 = lists:reverse(RetL),
%% 	?DEBUG_OUT("sendGuildBiddingToClient:~p,~p,~p", [GuildID, RetL, RetL2]),
	playerMsg:sendNetMsg(#pk_GS2U_BiddingGuildMsg{list = RetL2, resorce = Res}),
	ok.

%% 参与竞价
bidding(TargetGuilID) ->
	case isInApplyPhase() of
		true ->
			RoleID = playerState:getRoleID(),
			GuildPower = playerGuild:getGuildSelfLevel(),
			case GuildPower >= ?GuildMemLevel_ViceLeader of
				true ->
					psMgr:sendMsg2PS(?PsNameGuild, joinGuildWarBidding, {TargetGuilID, RoleID}),
					ok;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_GuildWar_OnlyVicLeader)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildWar_NotInTime)
	end,
	ok.

%% 是否在竞价时间段（周一 04 ~ 周三 11:59:59）
isInApplyPhase() ->
	NowTime = time:getSyncTime1970FromDBS(),
	%% 判断是不是整周
	{{Year, Month, Day}, {Hour, _Minute, _Second}} = time:convertSec2DateTime(NowTime),
	%% 7表示星期天，1表示星期一
	Week = calendar:day_of_the_week(Year, Month, Day),
	if
		Week =:= 1 andalso Hour >= ?ResetTimeHour -> true;
		Week =:= 2 -> true;
		Week =:= 3 andalso Hour < 12 -> true;
		true -> false
	end.

joinGuildWarBiddingAck({Ret, {ErrorCode, Param}}) ->
	playerMsg:sendErrorCodeMsg(ErrorCode, Param),

	case Ret of
		true ->
			%% 需要同步数据给客户端
			sendGuildBiddingToClient(),
			ok;
		_ ->
			skip
	end,
	ok.

%% 获取军团的名字
-spec getGuildName(GuildID::uint()) -> list().
getGuildName(GuildID) when erlang:is_integer(GuildID) andalso GuildID > 0 ->
	case ets:lookup(rec_guild, GuildID) of
		[#rec_guild{guildName = GuildName}] ->
			GuildName;
		_ ->
			""
	end;
getGuildName(_GuildID) -> "".