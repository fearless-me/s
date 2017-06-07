%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 07. 十二月 2016 19:45
%%%-------------------------------------------------------------------
-module(playerGuildBattle).
-author("tiancheng").

-include("playerPrivate.hrl").

%% MSG
-export([
    playerleaveGuild/2,
    openGuildApplyForm/0,
    applyOrEnterBattle/0,
	requestGuildBattleResult/0
]).

%% ACK
-export([
    applyGuildBattleAck/1,
    enterGuildBattleAck/1
]).

%% API
-export([
    playerEnterMapReal/0,
    gatherSuccess/1,
	gatherFailed/1,
	guildBattleEndPlayerReward/1
]).

requestGuildBattleResult() ->
	MapID = playerState:getMapID(),
	case getCfg:getCfgByKey(cfg_activity, ?ActivityType_GuildBattle) of
		#activityCfg{mapidlist = [MapID]} ->
			GuildID = playerState:getGuildID(),
			case GuildID > 0 of
				true ->
					case ets:lookup(rec_guild_battle_paid, GuildID) of
						[#rec_guild_battle_paid{}] ->
							%% 请求积分
							core:sendMsgToActivity(?ActivityType_GuildBattle, requestGuildBattleResult,
								{GuildID, playerState:getRoleID(), playerState:getNetPid()});
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

gatherSuccess(GatherID) ->
    MapID = playerState:getMapID(),
    case getCfg:getCfgByKey(cfg_activity, ?ActivityType_GuildBattle) of
        #activityCfg{mapidlist = [MapID]} ->
            #globalsetupCfg{setpara = CIDs} = getCfg:getCfgPStack(cfg_globalsetup, guildbattlecollectids),
            case lists:keyfind(GatherID, 1, CIDs) of
                {GatherID, Point} ->
					RoleID = playerState:getRoleID(),
					?DEBUG_OUT("gatherSuccess:~p,~p,~p", [RoleID, GatherID, Point]),
                    core:sendMsgToActivity(?ActivityType_GuildBattle, gatherSuccess,
                        {playerState:getGuildID(), RoleID, playerState:getNetPid(), GatherID, Point});
                _ ->
                    skip
            end;
        _ ->
            skip
    end,
    ok.

gatherFailed(GatherID) ->
	MapID = playerState:getMapID(),
	case getCfg:getCfgByKey(cfg_activity, ?ActivityType_GuildBattle) of
		#activityCfg{mapidlist = [MapID]} ->
			#globalsetupCfg{setpara = CIDs} = getCfg:getCfgPStack(cfg_globalsetup, guildbattlecollectids),
			case lists:keyfind(GatherID, 1, CIDs) of
				{GatherID, _Point} ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_GuildBattle_GoodsNone);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% 打开军团报名界面
-spec openGuildApplyForm() -> ok.
openGuildApplyForm() ->
    F =
        fun(#rec_guild_battle_paid{guildID = GuildID} = G, Acc) ->
            case ets:lookup(rec_guild, GuildID) of
                [#rec_guild{guildName = GName} = Guild] ->
                    %% 正式成员
                    [#rec_guild_member{roleID = RID}] = playerGuild:getGuildMember(GuildID, [?GuildMemLevel_Leader]),

                    R = #pk_GuildBattleInfo{
                        %% UInt64 公会唯一ID
                        guildID = GuildID,
                        %% String 公会名
                        guildName = GName,
                        %% Byte 公会等级
                        guildLevel = Guild#rec_guild.guildLevel,
                        %% UInt32 军团总战力
                        fightForce = Guild#rec_guild.fightForce,
                        %% String 会长姓名
                        leaderName = playerNameUID:getPlayerNameByUID(RID),
                        %% UInt64 会长id
                        leaderRoleID = RID,
                        %% Byte 军团标志
                        denoter = Guild#rec_guild.denoter
                    },
                    [R | Acc];
                _ ->
                    ?ERROR_OUT("openGuildApplyForm:~p", [G]),
                    Acc
            end
        end,
    L = ets:foldl(F, [], rec_guild_battle_paid),
    SelfGuildID = playerState:getGuildID(),
    TargetGuildID = case ets:lookup(rec_guildBattle, SelfGuildID) of
                        [#rec_guildBattle{targetGuildID = TGID}] -> TGID;
                        _ -> 0
                    end,
    playerMsg:sendNetMsg(#pk_GS2U_GuildBattleApply{list = L, selfGuildID = SelfGuildID, targetGuildID = TargetGuildID}),
    ok.

%% 报名或者进入军团战
-spec applyOrEnterBattle() -> ok.
applyOrEnterBattle() ->
    GuildID = playerState:getGuildID(),
    case GuildID > 0 of
        true ->
            case ets:lookup(rec_guild_battle_paid, GuildID) of
                [#rec_guild_battle_paid{}] ->
                    %% 进入
                    enterGuildBattle();
                _ ->
                    %% 报名
                    guildBattleApply()
            end;
        _ ->
            skip
    end,
    ok.

%% 报名军团战
-spec guildBattleApply() -> ok.
guildBattleApply() ->
    case playerState:getSelfGuildMember() of
        #rec_guild_member{guildID = GuildID, roleID = RoleID, power = Power} when Power >= ?GuildMemLevel_Leader ->
            psMgr:sendMsg2PS(?PsNameGuild, applyGuildBattle, {GuildID, RoleID}),
            ok;
        _ ->
            playerMsg:sendErrorCodeMsg(?ErrorCode_GuildBattle_PowerLvelLow)
    end,
    ok.

applyGuildBattleAck(Results) ->
    case Results of
        true ->
			%% 重新刷新一下界面
			openGuildApplyForm(),

            playerMsg:sendErrorCodeMsg(?ErrorCode_GuildBattle_ApplySuccess);
        ErrorCode ->
            playerMsg:sendErrorCodeMsg(ErrorCode),
            ok
    end,
    ok.

%% 进入军团战或者报名
-spec enterGuildBattle() -> ok.
enterGuildBattle() ->
    GuildID = playerState:getGuildID(),
    case GuildID > 0 of
        true ->
            case ets:lookup(rec_guildBattle, GuildID) of
                [#rec_guildBattle{isStart = IsStart, isEnd = IsEnd}] ->
                    case IsStart =:= true andalso IsEnd =:= false of
                        true ->
                            core:sendMsgToActivity(
                                ?ActivityType_GuildBattle,
                                enterGuildBattle,
                                {GuildID, playerState:getRoleID(), playerState:getName(), playerState:getNetPid()}),
                            ok;
                        _ ->
                            playerMsg:sendErrorCodeMsg(?ErrorCode_GuildBattle_NowCanotEnterBattle)
                    end;
                _ ->
                    playerMsg:sendErrorCodeMsg(?ErrorCode_GuildBattle_EnterBattleNotMember)
            end;
        _ ->
            playerMsg:sendErrorCodeMsg(?ErrorCode_GuildBattle_EnterBattleFailed)
    end,
    ok.

enterGuildBattleAck({MapID, MapPID, {X, Y}}) ->
    playerScene:onRequestEnterActivityMap(MapID, MapPID, erlang:float(X), erlang:float(Y)),
    ok;
enterGuildBattleAck(ErrorCode) ->
    playerMsg:sendErrorCodeMsg(ErrorCode),
    ok.

playerEnterMapReal() ->
    MapID = playerState:getMapID(),
    case getCfg:getCfgByKey(cfg_activity, ?ActivityType_GuildBattle) of
        #activityCfg{mapidlist = [MapID]} ->
            RoleID = playerState:getRoleID(),
            case ets:lookup(rec_guild_member, RoleID) of
                [#rec_guild_member{guildID = GuildID}] ->
                    core:sendMsgToActivity(?ActivityType_GuildBattle, playerEnterMapReal, {GuildID, RoleID, playerState:getNetPid()}),

%%					case playerState:getTeamID() > 0 of
%%						true ->
%%							%% 离开队伍
%%							playerTeam2:leaveTeam(?PlayerTeamTypeNormal);
%%						_ ->
%%							skip
%%					end,
	                playerTeam:leaveTeam(false),

					%% 军团杀戮
					playerPk:tranState(?PlayerMutiKillStatus),
                    ok;
                _ ->
                    playerCopyMap:leaveCopyMap()
            end;
        _ ->
            skip
    end,
    ok.

%% 玩家离开军团
-spec playerleaveGuild(GuildID::uint64(), RoleID::uint64()) -> ok.
playerleaveGuild(GuildID, RoleID) ->
    case ets:lookup(rec_guildBattle, GuildID) of
        [#rec_guildBattle{}] ->
            core:sendMsgToActivity(?ActivityType_GuildBattle, playerleaveGuild, {GuildID, RoleID}),

            %% 离开地图
            MapID = playerState:getMapID(),
            case getCfg:getCfgByKey(cfg_activity, ?ActivityType_GuildBattle) of
                #activityCfg{mapidlist = [MapID]} ->
                    playerCopyMap:leaveCopyMap();
                _ ->
                    skip
            end,
            ok;
        _ ->
            skip
    end,
    ok.

%% 结束发奖
guildBattleEndPlayerReward({Exp, Gold, Contribute}) ->
	Level = playerState:getLevel(),

	playerBase:addExp(Exp * Level, ?ExpSourceGuildBattle, 0),

	GuildID = playerState:getGuildID(),
	Plo = #recPLogTSMoney{
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_GuildBattle,
		reason = ?CoinSourceGuildBattle,
		param = GuildID
	},
	playerMoney:addCoin(?CoinTypeGold,Gold * Level,Plo),

	%% 增加个人军团贡献点
	playerMoney:addCoin(?CoinTypeGuildContribute, Contribute,
		#recPLogTSMoney{reason = ?CoinSourceGuildBattle, param = GuildID, target = ?PLogTS_PlayerSelf, source = ?PLogTS_GuildBattle}),
	ok.