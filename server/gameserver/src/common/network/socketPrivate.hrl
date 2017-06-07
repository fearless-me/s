%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 12. 一月 2017 14:28
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(SOCKET_PRIVATE_HRL______).
-define(SOCKET_PRIVATE_HRL______,1).

-include("type.hrl").
-include("commonDef.hrl").
-include("logger.hrl").
-include("netmsgRecords.hrl").

-define(Client_2_Server, 1).
-define(Server_2_Client, 2).

%% 消息统计同步主库间隔
-define(MsgStatisticsInterval, 28). % s
%% 打印消息统计间隔
-define(PrintMsgStatisticsInterval, 300000).

%% 接收包的原子
-define(RecvPackageAtom, recvPackageNumberAtom).
%% 接收客户端消息包的间隔时间
-define(RecvClientPackageIntervalTime, 5000).
%% 在这个间隔时间内，最大只接收客户端包的个数，超过则断线
-define(RecvClientPackageNumber, 500).

-define(KIB,(1024)).
-define(MIB,(?KIB*1024)).
-define(GIB,(?MIB*1024)).

-endif. %% SOCKET_PRIVATE_HRL______