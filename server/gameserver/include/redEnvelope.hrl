%%%-------------------------------------------------------------------
%%% @author zhengzhichun
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 四月 2016 14:13:41
%%%-------------------------------------------------------------------
-author("Administrator").

-ifndef(RedEnvelope_hrl).
-define(RedEnvelope_hrl, 1).

-include("gamedata.hrl").
-include("gamedataLog.hrl").

-define(RED_TimeOut_Tick, 60000).

-define(REDENVELOPE_HISTORY_LEN, 20).
-define(REDENVELOPE_1VN_MAXPER, 10).

%% 红包类型
% 每次固定金额 保留
-define(REDENVELOPE_TYPE_FIX, 1).
% 每次随机金额
-define(REDENVELOPE_TYPE_RANDOM, 2).

%世界红包
-define(REDENVELOPE_TARGET_WORLD, 1).
%帮会 保留
-define(REDENVELOPE_TARGET_GUILD, 2).
% 婚姻 保留
-define(REDENVELOPE_TARGET_MARRIAGE, 3).
%地图 保留
-define(REDENVELOPE_TARGET_MAP, 4).
%制定玩家红包 比如好友
-define(REDENVELOPE_TARGET_FIXROLE, 5).


%%
-define(REDENVELOPE_WORLD_SENDMAX,10).
-define(REDENVELOPE_WORLD_RECVMAX,10).

%%发红包
-define(RED_Opt_Code_Send, 1).

%%领红包
-define(RED_Opt_Code_Get, 2).

%%
-define(RED_QUERYLIST_CD, 1000).

%%
-define(RED_MAXNUM_ONERED, 100).

%%
-record(rec_History,{
	roleID,
	name,
	time,
	money
}).

%%
-record(rec_HistorySelf,{
	redUID = 0,
	creator = 0,
	type = 0,
	name = "",
	time = 0,
	money = 0
}).

%%
-record(rec_redEnvelopeHistory,{
	redUID = 0,
	list = []
}).

%%
-record(rec_redEnvelopeSim,{
	redUID,
	targetUID,
	targetType,
	deadlineTime
}).

%%
-record(rec_RSLimit,{
	targetType,
	recvNumber,
	sendNumber
}).

%%
-record(rec_redEnvelopeRand,{
	redUID = 0,
	list = []
}).


-endif. % RedEnvelope_hrl