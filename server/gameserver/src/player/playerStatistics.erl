%%%
%%%-------------------------------------------------------------------
%%% @author 罗维
%%% @copyright (C) 2014, <haowan123>
%%% @doc
%%% 玩家统计伤害数值
%%% @end
%%% Created : 26. 一月 2015 17:30
%%%-------------------------------------------------------------------

-module(playerStatistics).
-author(luowei).

-include("playerPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================

-export([
		copyMapHurtStat/4,
		copyMapBeHurtStat/2,
		playerTeamCopyMapHurtStat/2,
		
		clearCopyMapHurtStat/0,
		sendCopyMapHurtToClient/0
		]).

sendCopyMapHurtToClient() ->
	L = #pk_GS2U_CopyMapStatHurtList{
		statList = getStatHurtList()
	},
	playerMsg:sendNetMsg(L).

%%清除玩家当前副本伤害统计
-spec clearCopyMapHurtStat() -> ok.
clearCopyMapHurtStat() ->
	playerState:setPlayerCopyMapStatHurt(undefined).

%%玩家队友伤害统计
-spec playerTeamCopyMapHurtStat(RoleID::uint(), Hurt::#rec_stat_hurt{} | undefined) -> ok.

playerTeamCopyMapHurtStat(RoleID, #rec_stat_hurt{} = Hurt) ->
	playerState:setPlayerTeamCopyMapStatHurt(RoleID, Hurt);
playerTeamCopyMapHurtStat(_, _) ->
	ok.

%%玩家副本打出伤害统计(包括宠物,载体,自己本身)
-spec copyMapHurtStat(AttackType::uint(), AttackID::uint(), MapID::uint(), DiffHp::uint()) -> ok.
copyMapHurtStat(?ObjTypePet, AttackID, MapID, DiffHp) ->
	case getCfg:getCfgPStack(cfg_pet, AttackID) of
		#petCfg{petType = 0} ->
			stateHurt(?PetHurt, MapID, DiffHp);
		_ ->
			stateHurt(?PlayerHurt, MapID, DiffHp)
	end;
copyMapHurtStat(_, _ , MapID, DiffHp) ->
	stateHurt(?PlayerHurt, MapID, DiffHp).

%%玩家副本受到伤害统计(自己本身)
-spec copyMapBeHurtStat(MapID::uint(), DiffHp::uint()) -> ok.
copyMapBeHurtStat(MapID, DiffHp) ->
	case isStatHurt(MapID) of
		true ->
			stateBeHurt(?PlayerHurt, MapID, DiffHp);
		_ ->
			ok
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================

%%统计攻击伤害
-spec stateHurt(HurtType::?PlayerHurt | ?PetHurt, MapID::uint(), DiffHp::int()) -> ok.
stateHurt(HurtType, MapID, DiffHp) ->
	stateHurt(HurtType, MapID, DiffHp, isSameCopyMap(MapID)).
stateHurt(HurtType, _MapID, DiffHp, true) ->
	Hurt = playerState:getPlayerCopyMapStatHurt(),
	stateHurt1(HurtType, DiffHp, Hurt);
stateHurt(HurtType, MapID, DiffHp, false) ->
	MapPid = playerState:getMapPid(),
	Hurt = #rec_stat_hurt{mapPid = MapPid, mapID = MapID},
	stateHurt1(HurtType, DiffHp, Hurt).

stateHurt1(?PetHurt, DiffHp, #rec_stat_hurt{petHurt = Hurt} = OldHurt) ->
	NewHurt = OldHurt#rec_stat_hurt{petHurt = Hurt + abs(DiffHp)},
	playerState:setPlayerCopyMapStatHurt(NewHurt);
stateHurt1(?PlayerHurt, DiffHp, #rec_stat_hurt{playerHurt = Hurt} = OldHurt) ->
	NewHurt = OldHurt#rec_stat_hurt{playerHurt = Hurt + abs(DiffHp)},
	playerState:setPlayerCopyMapStatHurt(NewHurt).

%%统计受击伤害
-spec stateBeHurt(HurtType::?PlayerBeHurt | ?PetBeHurt, MapID::uint(), DiffHp::int()) -> ok.
stateBeHurt(HurtType, MapID, DiffHp) ->
	stateBeHurt(HurtType, MapID, DiffHp, isSameCopyMap(MapID)).

stateBeHurt(HurtType, _MapID, DiffHp, true) ->
	Hurt = playerState:getPlayerCopyMapStatHurt(),
	stateBeHurt1(HurtType, DiffHp, Hurt);
stateBeHurt(HurtType, MapID, DiffHp, false) ->
	MapPid = playerState:getMapPid(),
	Hurt = #rec_stat_hurt{mapPid = MapPid, mapID = MapID},
	stateBeHurt1(HurtType, DiffHp, Hurt).

stateBeHurt1(?PetBeHurt, DiffHp, #rec_stat_hurt{petBeHurt = Hurt} = OldHurt) ->
	NewHurt = OldHurt#rec_stat_hurt{petBeHurt = Hurt + abs(DiffHp)},
	playerState:setPlayerCopyMapStatHurt(NewHurt);
stateBeHurt1(?PlayerBeHurt, DiffHp, #rec_stat_hurt{playerBeHurt = Hurt} = OldHurt) ->
	NewHurt = OldHurt#rec_stat_hurt{playerBeHurt = Hurt + abs(DiffHp)},
	playerState:setPlayerCopyMapStatHurt(NewHurt).

%%是否是相同副本
-spec isSameCopyMap(MapID::uint()) -> boolean().
isSameCopyMap(MapID) ->
	StatHurt = playerState:getPlayerCopyMapStatHurt(),
	isSameCopyMap(MapID, StatHurt).
isSameCopyMap(_MapID, undefined) ->
	false;
isSameCopyMap(MapID, #rec_stat_hurt{mapID = OldMapID, mapPid = OldMapPid}) ->
	OldMapID =:= MapID andalso OldMapPid =:= playerState:getMapPid().

isStatHurt(?HDBattleMapID) ->
	true;
isStatHurt(MapID) ->
	#mapsettingCfg{
		type = Type
	} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
	if
		Type =:= ?MapTypeCopyMap -> 
			true;
		true ->
			false
	end.

%%获取伤害列表
getStatHurtList() ->
	getSelfStatHurt() ++ 
		getTeamStatHurt().
		
getSelfStatHurt() ->
	RoleID = playerState:getRoleID(),
	Hurt = playerState:getPlayerCopyMapStatHurt(),
	getSelfStatHurt(Hurt, RoleID).
getSelfStatHurt(undefined, RoleID) ->
	[#pk_CopyMapStatHurt{
		playerHurt = 0,
		petHurt = 0,
		roleID = RoleID,
		beHurt = 0
	}];
getSelfStatHurt(#rec_stat_hurt{
	playerHurt = PlayerHurt,
	petHurt = PetHurt,
	playerBeHurt = BeHurt}, RoleID) ->
	[#pk_CopyMapStatHurt{
		playerHurt = PlayerHurt,
		petHurt = PetHurt,
		roleID = RoleID,
		beHurt = BeHurt
	}].

getTeamStatHurt() ->
	RoleID = playerState:getRoleID(),
	TML = teamInterface:getTeamMemberRoleIDListWithRoleID(RoleID),
	getTeamStatHurt(TML, RoleID, []).

getTeamStatHurt([], _, Hl) ->
	Hl;
getTeamStatHurt([RoleID | TML], RoleID, Hl)->
	getTeamStatHurt(TML, RoleID, Hl);
getTeamStatHurt([RoleID1 | TML], RoleID, Hl) ->
	OldMapID = playerState:getMapID(),
	case playerState:getPlayerTeamCopyMapStatHurt(RoleID1) of
		#rec_stat_hurt{mapID = MapID} = Hurt when MapID =:= OldMapID ->
			NewHurt = #pk_CopyMapStatHurt{
				playerHurt = Hurt#rec_stat_hurt.playerHurt,
				petHurt = Hurt#rec_stat_hurt.petHurt,
				roleID = RoleID1,
				beHurt = Hurt#rec_stat_hurt.petBeHurt
			};
		_ ->
			NewHurt = #pk_CopyMapStatHurt{
				playerHurt = 0,
				petHurt = 0,
				roleID = RoleID1,
				beHurt = 0
			}
	end,
	getTeamStatHurt(TML, RoleID, [NewHurt | Hl]).




