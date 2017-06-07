%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 机器人定义模块
%%% @end
%%% Created : 25. 四月 2017 14:30
%%%-------------------------------------------------------------------
-author(tiancheng).

-ifndef(Rob_hrl).
-define(Rob_hrl, 1).

-define(RobType_Error, 0).
-define(RobType_Start, 1).
-define(RobType_Ladder1v1, 			1).			%% 竞技场机器人
-define(RobType_CopyMap, 			2).			%% 副本助战机器人
-define(RobType_NormalMapFollow, 	3).			%% 普通场景机器人（测试）跟随
-define(RobType_NormalMap, 			4).			%% 普通场景机器人（测试）
-define(RobType_End, 4).
-export_type([rob_type/0]).
-type rob_type() :: ?RobType_Start .. ?RobType_End.

%% 加载机器人成功后，进入指定的地图与位置
-record(rec_RobEnterMap, {
	mapID = 0,
	mapPID = undefined,
	x = 0.0,
	y = 0.0
}).

-record(rec_LoadRobData, {
	robType = 0,
	robRoleID = 0,
	robEnterMap = {} :: #rec_RobEnterMap{},
	param = {}
}).

-endif. %% Rob_hrl