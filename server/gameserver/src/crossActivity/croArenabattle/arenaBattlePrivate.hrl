%%%-------------------------------------------------------------------
%%% @author luowei
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 跨服跨服角斗士
%%% @end
%%% Created : 22. 十二月 2015 17:36
%%%-------------------------------------------------------------------
-ifndef(ArenaBattlePrivate_hrl).
-define(ArenaBattlePrivate_hrl, 1).

%% 一分钟的秒
-define(OneMinAcSec,	60).
%% 一小时的秒
-define(OneHourAcSec, 3600).
%% 一天的秒
-define(OneDayAcSec, 86400).

-define(CfgID, 12).			%%竞技战场活动配置ID
-define(ArenaBattleTick,	1000).	%%tick时间

-define(Ets_Tab_Arena_Rank, arenaBattleRank).
-define(Ets_Tab_Arena_Rank_Txt, "toCrosServerArenaRank.txt").

-define(Ets_Tab_Arena_Hight_Rank, arenaBattleHightRank).
-define(Ets_Tab_Arena_Rank_Hight_Txt, "toCrosServerArenaHightRank.txt").

-define(CloseAcTime,	6 * 60 * 1000).%%延迟关闭活动时间

-define(RankNum,			50). %%排行榜数量

-define(WeekOne,			1).

-define(OutGame, 0). %%不在游戏中
-define(InGame,	 1). %%在游戏中

-define(NoDead,	0). %%玩家死亡
-define(Dead,	1). %%玩家未死亡

%%战斗结果
-define(Win,	0). %%胜利
-define(Draw,   1). %%平局
-define(Fail,   2). %%失败

%%地图ID
-define(Map6018, 6018).
-define(Map6019, 6019).
-define(Map6020, 6020).


-define(MatchApplyTimeOut, 60). %%一分钟匹配队友超时时间
-define(MatchTeamTimeOut, 60). %%一分钟匹配队伍超时时间
-define(GameAcLifeTime, 5 * 60).

-define(RefreshObject1, 1). %%刷怪物
-define(RefreshObject2, 2). %%刷宝箱
-define(RefreshObject3, 3). %%刷炮塔

%%队伍信息
-record(arenaTeamInfo,{
	member = [],
	maxval = 0,
	time = 0
	}).

%%队伍匹配信息
-record(arenaPlayerInfo,{
	roleID = 0,
	arenaVal = 0,
	career = 0,
	sname = "",
	name = 0,
	dbID = 0,
	level = 0,
	force = 0,
	time = 0,
	pid		= 0,
	netPid	= 0,
	teamID = 0,
	ingame = 0,
	camp = 0,
	isdead = 0,
	win = 0,
	fail = 0,
	hurt = 0,
	killnum = 0
	}).

%%参赛队伍信息
-record(arenaTeamJoinInfo,
	{
	 mapid = 0,
	 refreshtime = 0,
	 mappid = 0,
	 members = [],
	 res = 0,
	 time = 0,
	 isclear = false
	}).

-define(Block6018,
	#pk_GS2U_BlockStatusChange{
		changes = [
			#pk_BlockStatusChange{blockName = "d2", blockStatus = ?BlockNpc_Open},
			#pk_BlockStatusChange{blockName = "d3", blockStatus = ?BlockNpc_Open}
		]
	}
).

-define(Block6019,
	#pk_GS2U_BlockStatusChange{
		changes = [
			#pk_BlockStatusChange{blockName = "d1", blockStatus = ?BlockNpc_Open},
			#pk_BlockStatusChange{blockName = "d2", blockStatus = ?BlockNpc_Open}
		]
	}
).

-define(Block6020,
	#pk_GS2U_BlockStatusChange{
		changes = [
			#pk_BlockStatusChange{blockName = "d4", blockStatus = ?BlockNpc_Open},
			#pk_BlockStatusChange{blockName = "d5", blockStatus = ?BlockNpc_Open}
		]
	}
).

-endif. %% hdBattlePrivate_hrl