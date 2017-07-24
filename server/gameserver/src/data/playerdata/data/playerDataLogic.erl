%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%% ETS 初始化
%%% @end
%%% Created : 22. 九月 2016 17:50
%%%-------------------------------------------------------------------
-module(playerDataLogic).
-author("tiancheng").

-include("gsInc.hrl").

%% API
-export([
	initEts/0
]).

initEts() ->

	ets:new(ets_rec_base_role, [public, named_table, set, {keypos, #rec_base_role.roleID},{write_concurrency, true},{read_concurrency, true}]),
	ets:new(ets_rec_playerdata, [public, named_table, set, {keypos, #rec_playerdata.roleID},{write_concurrency, true},{read_concurrency, true}]),
	ets:new(ets_rec_RoleName, [public, named_table, set, {keypos, #rec_RoleName.roleID},{write_concurrency, true},{read_concurrency, true}]),
	ets:new(ets_rec_OnlinePlayer, [public, named_table, set, {keypos, #rec_OnlinePlayer.roleID},{write_concurrency, true},{read_concurrency, true}]),
	ets:new(ets_rec_OnlineAccount, [public, named_table, set, {keypos, #rec_OnlineAccount.accountID},{write_concurrency, true},{read_concurrency, true}]),
	ets:new(ets_recRoleList, [public, named_table, set, {keypos, #recRoleList.accountID},{write_concurrency, true},{read_concurrency, true}]),

	%% 身份证系统
	ets:new(?EtsIdentityData, [public, named_table, set, {keypos, #rec_player_identity.roleID}, {write_concurrency, true}, {read_concurrency, true}]),
	ets:new(?EtsPicDataMain, [public, named_table, set, {keypos, #rec_pic_data_main.md5}, {write_concurrency, true}, {read_concurrency, true}]),
	ets:new(?EtsPicDataSub, [public, named_table, set, {keypos, #rec_pic_data_sub.md5}, {write_concurrency, true}, {read_concurrency, true}]),
	ets:new(?EtsGiftHistory, [public, named_table, set, {keypos, #pk_GiftHistory.index}, {write_concurrency, false}, {read_concurrency, true}]),

	%% 新版好友系统
	ets:new(?EtsFriend2Data, [public, named_table, set, {keypos, #recFriend2Data.roleID}, {write_concurrency, true}, {read_concurrency, true}]),
	ets:new(?EtsFriend2LBS, [public, named_table, set, {keypos, #recFriend2LBS.mixRoleID}, {write_concurrency, true}, {read_concurrency, true}]),
	ets:new(?EtsFriend2Cross, [public, named_table, set, {keypos, #recFriend2Cross.roleID}, {write_concurrency, true}, {read_concurrency, true}]),

	%% 双角色相关的每日计数
	ets:new(?EtsDaily2Data, [public, named_table, set, {keypos, #recDaily2Data.key}, {write_concurrency, true}, {read_concurrency, true}]),

	%% 姻缘系统
	ets:new(?EtsMarriageData, [public, named_table, set, {keypos, #rec_marriage.roleID}, {write_concurrency, true}, {read_concurrency, true}]),
	ets:new(?EtsMarriageSkill, [public, named_table, set, {keypos, #recMarriageSkill.roleID}, {write_concurrency, true}, {read_concurrency, true}]),

	%% 新版骑宠领地
	ets:new(?EtsTerritoryPlayerData, [public, named_table, set, {keypos, #recTerritoryData.roleID}, {write_concurrency, false}, {read_concurrency, true}]),
	ets:new(?EtsTerritoryPetData, [public, named_table, set, {keypos, #recTerritoryData.roleID}, {write_concurrency, false}, {read_concurrency, true}]),
	ets:new(?EtsTerritoryHistoryAData, [public, named_table, set, {keypos, #recTerritoryData.roleID}, {write_concurrency, false}, {read_concurrency, true}]),
	ets:new(?EtsTerritoryHistoryDData, [public, named_table, set, {keypos, #recTerritoryData.roleID}, {write_concurrency, false}, {read_concurrency, true}]),

	%% 远程玩家属性
	ets:new(recRPView, [public, named_table, set, {keypos, #recRPView.roleID}, {write_concurrency, true}, {read_concurrency, true}]),
	ok.
