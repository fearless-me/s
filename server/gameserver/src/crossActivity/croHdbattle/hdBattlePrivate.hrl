%%%-------------------------------------------------------------------
%%% @author luowei
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 跨服混沌战场模块
%%% @end
%%% Created : 16. 十一月 2015 17:36
%%%-------------------------------------------------------------------
-ifndef(HdBattlePrivate_hrl).
-define(HdBattlePrivate_hrl, 1).

-define(CfgID, 11).			%%混沌战场活动配置ID

-define(MapHighClass,		1).	%%高端战场
-define(MapMidClass,		2).	%%中端战场
-define(MapLowClass,		3).	%%低端战场

-define(OnLine,				0).		%%玩家在活动中
-define(OffLine,			1).		%%玩家离开活动中

-define(HasNoCol,			0).		%%未采集
-define(HasCol,				1).		%%已经采集

-define(BoxClass1,			1).		
-define(BoxClass2,			2).

%%排行榜数量
-define(RankNum,			50).

%% 一分钟的秒
-define(OneMinAcSec,	60).
%% 一小时的秒
-define(OneHourAcSec, 3600).
%% 一天的秒
-define(OneDayAcSec, 86400).

-define(CorsHdBattleTick,	1000).	%%tick时间

-define(OnePhase,	1).	%%阶段1
-define(TwoPhase,	2).	%%阶段2
-define(ThreePhase,	3).	%%阶段3
-define(FourPhase,	4). %%阶段4

-define(WeekOne,	1). 
-define(WeekFive,	5).

-define(Ets_Tab_Rank,	battleRank).
-define(Ets_Tab_Rank_Txt, "toCrosServerRank.txt").

%%战场信息
-record(battleMapInfo,{
	mapPid = 0,
	mapNum = 0,
	mapType = 0,
	mapANum = 0,	%%红队人数
	mapBNum = 0,	%%绿队积分
	mapExt 	= 0,	%%马车加成
	mapH	= 0,	%%马车血量
	mapA	= 0,	%%红队积分
	mapB	= 0,	%%蓝队积分
	mapC	= 0,	%%马车阵营
	mapG	= 0,	%%守卫个数
	mapT	= 0,	%%刷新时间
	mapP	= 0		%%阶段
	}).

%%战场玩家信息
-record(battlePlayerInfo,{
	roleID 	= 0,
	dbID	= 0,
	sname	= "",
	pid		= 0,
	netPid	= 0,
	mapPid	= 0,
	carrer	= 0,
	force	= 0,
	record	= 0,
	kill	= 0,
	asKill	= 0,
	name	= 0,
	inAc	= 0,
	isCol	= 0,
	camp	= 0,
	cd      = 0
	}).

-endif. %% hdBattlePrivate_hrl