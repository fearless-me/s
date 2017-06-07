%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170227
%%%-------------------------------------------------------------------

-module(playerSpiritArea).
-author("meitianyang").
-include("playerPrivate.hrl").
-include("../activity/gameactivity/spiritArea/acSpiritAreaPrivate.hrl").

%% API
-export([
	onEnterMap/1,
	enterCopyMap/1,
	reward/1,
	keepWake/1
]).

%%-------------------------------------------------------------------
%% 请求进入灵界活动
-spec onEnterMap(CopyMapID::uint()) -> ok.
onEnterMap(?SpiritAreaMapID)->
	core:sendMsgToActivity(
		?ActivityType_SpiritArea,
		spiritArea_enter,
		{playerState:getRoleID(), ?SpiritAreaMapID, playerState:getTeamID()}
	);
onEnterMap(CopyMapID)->
	?ERROR_OUT("onEnterMap invalid map id ~p", [CopyMapID]),
	ok.

%%-------------------------------------------------------------------
%% 被允许进入灵界副本
-spec enterCopyMap(CopyMapID::uint()) -> boolean().
enterCopyMap(CopyMapID) ->
	playerScene:onRequestEnterMap(CopyMapID).

%%-------------------------------------------------------------------
%% 波次奖励
-spec reward({Level::uint32(), Wave::uint32()}) -> ok.
reward({Level, Wave}) ->
	case getCfg:getCfgByKey(cfg_spiritArea, Level, Wave) of
		#spiritAreaCfg{reward = ListReward} ->
			FunReward =
				fun({ItemID, ItemCount}) ->
					case getCfg:getCfgByKey(cfg_item, ItemID) of
						#itemCfg{itemType = ItemType} when ItemCount > 0 ->
							BagType = playerPackage:getPackageType(ItemType),
							OldCount = playerPackage:getGoodsNumByID(BagType, ItemID, true),
							PLog =
								#recPLogTSItem{
									old = OldCount,
									new = ItemCount + OldCount,
									change = ItemCount,
									target = ?PLogTS_PlayerSelf,
									source = ?PLogTS_SpiritArea,
									changReason = ?ItemSourceSpiritAreaReward,
									reasonParam = ItemID
								},
							playerPackage:addGoodsAndMail(ItemID, ItemCount, true, 0, PLog);
						_ ->
							skip
					end
				end,
			lists:foreach(FunReward, ListReward);
		_ ->
			skip
	end,
	ok.

%%-------------------------------------------------------------------
%% 保持觉醒
-spec keepWake(NeedWake::boolean()) -> ok | skip.
keepWake(NeedWake) ->
	MapID = playerState:getMapID(),
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeSpiritArea} ->
			%?DEBUG_OUT("[DebugForSpiritArea] keepWake"),
			playerSkillLearn:keepWake(NeedWake),
			ok;
		#mapsettingCfg{} ->
			skip;
		_ ->
			?ERROR_OUT("can not find MapID(~p) from cfg_mapsetting", [MapID]),
			skip
	end.
