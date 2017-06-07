%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%%
%%% @end
%%% Created : 08. 十月 2014 10:52
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(Define_groupPrivate_hrl_____).
-define(Define_groupPrivate_hrl_____, 1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 分组规则
%%% 1:不同分组的人不允许战斗
%%% 2:分组号为0表示大世界分组，所有NPC，怪物以及玩家默认均在大世界中
%%% 3:分组号为1表示特殊分组，所有分组中的玩家都可以看见该分组中的对象
%%% 4:满足以上条件外，其它通过分配新分组ID获利的分组，只能相互看见所处同分组的对象
%%% 5:切换场景退出分组

-include("gsInc.hrl").

-define(GroupEts, groupPlayerEts).

%% 空的回收时间，目前设定一分钟后回收
-define(EmptyGroupRecycleTick, emptyGroupRecycleTick).
%% 心跳时间(毫秒)
-define(EmptyGroupRecycleTickTime, 1 * 60 * 1000).

%% 空分组保留时间(秒)
-define(EmptyGroupRetainTime, 1 * 60).

-define(Group_Normal, 0).       % 0号分组，大世界分组
-define(Group_AllVisible, 1).   % 1号分组，特殊分组，所有其它分组均可见该分组中的对象

%% 分组信息
-record(recGroup, {
	groupID = 0,
	mapID = 0,
	mapPid = 0,
	groupCreateTime = 0,    % 分组创建时间
	lastOpTime = 0,         % 最后一次操作时间
	playerList = [] ::[#recGroupPlayerInfo{},...] | []
}).

-endif. %% Define_groupPrivate_hrl_____