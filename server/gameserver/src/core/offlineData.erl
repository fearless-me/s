%% @author 罗维
%% @doc @todo 维护离线数据

-module(offlineData).

-include("gamedata.hrl").
-include("common.hrl").

-define(NoLoad, 0). %%不加载
-define(OnLoad,	1).	%%加载
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	addOfflineData/2,
	delOfflineData/1
	]).


%%增加离线数据
-spec addOfflineData(RoleID::uint(), SysID::uint()) -> ok.
addOfflineData(RoleID, SysID) ->
	OffData = #rec_offline_data{
		roleID = RoleID,
		sysID = SysID,
		isLoad = ?OnLoad
	},
	saveOfflineData(OffData).

%%删除离线数据
-spec delOfflineData(RoleID::uint()) -> ok.
delOfflineData(RoleID) ->
	OffData = #rec_offline_data{
		roleID = RoleID,
		sysID = 0,
		isLoad = ?NoLoad
	},
	saveOfflineData(OffData).


%%保存离线数据
-spec saveOfflineData(#rec_offline_data{}) -> ok.
saveOfflineData(#rec_offline_data{roleID = RoleID} = OfflineData) ->
	edb:checkAndSave(rec_offline_data, RoleID, OfflineData, new_rec_offline_data, update_rec_offline_data).