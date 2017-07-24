%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 04. 七月 2017 14:35
%%%-------------------------------------------------------------------
-author(tiancheng).

-ifndef(Cross_Gs_Private_hrl).
-define(Cross_Gs_Private_hrl, 1).

-define(ETSNormalServers, eTSNormalServers).

%% 普通服信息
-record(normalInfo, {
	serverID = 0,
	serverName = "",
	node = "",
	pid = undefined
}).

-endif.