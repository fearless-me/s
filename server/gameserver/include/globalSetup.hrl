%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 公共定义
%%% @end
%%% Created : 01. 三月 2017 15:37
%%%-------------------------------------------------------------------
-author(tiancheng).

-ifndef(Global_SetUp_hrl___).
-define(Global_SetUp_hrl___,1).

%% 公共定义ETS名字
-define(GlobalSetupTable, rec_globalSetup).

%% 公共定义Key
-define(GSKey_adbID,					1).
-define(GSKey_dbID, 					2).
-define(GSKey_serverName, 				3).
-define(GSKey_maxPlayer, 				4).
-define(GSKey_RecentServerStartTime, 	5).	% 最近开服时间
-define(GSKey_LastServerEndTime, 		6).	% 最后关服时间
-define(GSKey_ServerStartIndex, 		7).	% 本次开服Index
-define(GSKey_areaMaintain, 			8).
-define(GSKey_authUrl, 					9).
-define(GSKey_hasGs, 					10).
-define(GSKey_checkProtoVer, 			13). % 检查版本号

-endif.