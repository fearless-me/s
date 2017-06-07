%%%-------------------------------------------------------------------
%%% @author ly
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%% 首领入侵
%%% @end
%%% Created : 31. 五月 2017 20:22
%%%-------------------------------------------------------------------
-author("ly").

-ifndef(Hrl_acWorldBossPrivate__hrl___).
-define(Hrl_acWorldBossPrivate__hrl___, 1).

-define(WorldBossNeedMinLevel,30).%%玩家最低等级
-define(WorldBossKey, 1).
-define(WorldBossTenLength, 20).

-record(recWorldBossInfo,{
	key = ?WorldBossKey
	,
	dataID = 0,
	x = 0.0,
	y = 0.0,
	maxHP = 1,
	curHP = 0,
	killer = 0
}).

-record(recWorldBossMapInfo,{
	mapID,
	mapPID,
	monsterEts,
	playerEts
}).

-record(recWorldBossDamageTop,{
	key = ?WorldBossKey,
	list = []
}).

-record(recWorldBossDamage,{
	roleID,
	damage
}).

-define(ActivityType_WorldBoss_1, 1).
-define(ActivityType_WorldBoss_2, 2).
-define(ActivityType_WorldBoss_3, 3).


-define(WorldBossEts, wbEts___).
-define(WorldBossTopEts, wbTopEts___).
-define(WorldBossDamageEts, wbDamageEts___).

-define(FinishReason_Timeout, 1).
-define(FinishReason_Killed, 2).


-define(WorldBossTick, 10*1000).

-endif.

