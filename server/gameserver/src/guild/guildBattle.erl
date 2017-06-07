%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 军团战
%%% @end
%%% Created : 07. 四月 2015 11:05
%%%-------------------------------------------------------------------
-module(guildBattle).
-author("tiancheng").

-include("guildPrivate.hrl").
-include("activityDef.hrl").

-export([
    applyGuildBattle/1
]).

applyGuildBattle({GuildID, RoleID}) ->
    case isApplyIng() of
        true ->
            case ets:lookup(rec_guild_battle_paid, GuildID) of
                [] ->
                    case guildLogic:queryRoleGuildInfo(RoleID) of
                        {#rec_guild{resource = Res},
                            #rec_guild_member{guildID = GuildID, power = Power}} when Power >= ?GuildMemLevel_ViceLeader ->
                            #globalsetupCfg{setpara = [NeedRes]} = getCfg:getCfgPStack(cfg_globalsetup, guildbattleapplyres),
                            case Res >= NeedRes of
                                true ->
                                    guildBase:addguildresource(GuildID, -NeedRes),
									BR = #rec_guild_battle_paid{guildID = GuildID, applytime = time:getUTCNowSec()},
                                    ets:insert(rec_guild_battle_paid, BR),
									gsSendMsg:sendMsg2DBServer(saveGuildBattleData, 0, BR),
                                    true;
                                _ ->
                                    ?ErrorCode_GuildBattle_ApplyFailed
                            end;
                        _ ->
                            ?ErrorCode_GuildBattle_PowerLvelLow
                    end;
                _ ->
                    ?ErrorCode_GuildBattle_ApplyRepeat
            end;
        _ ->
            ?ErrorCode_GuildBattle_NotInTime
    end.

%% 是否在报名阶段
isApplyIng() ->
	case activityLogic:getActivePhase(?ActivityType_GuildBattle) of
		{ok, 1} -> true;
		_ -> false
	end.