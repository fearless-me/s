%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 十二月 2016 14:12
%%%-------------------------------------------------------------------
-author("Administrator").
-ifndef(Hrl_acMaterialPrivate__hrl___).
-define(Hrl_acMaterialPrivate__hrl___, 1).

-include("gsInc.hrl").
-include("activityDef.hrl").

%%%------------------------------------
-define(CHAPTER_0, 0).
-define(CHAPTER_PREPARE, 1).
-define(CHAPTER_GOING, 2).
-define(CHAPTER_FINISH, 3).
-define(CHAPTER_TIMEOUT, 4).
-define(CHAPTER_FAILED, 5).
-define(CHAPTER_GIVE, 6).
-define(CHAPTER_KICK, 7).


-define(MaterialTicTime, 200).
-define(EndWaitTime, 15000).
-define(PrepareTime, 15000).

-define(TowerMaxType, 3).
-define(TowerMaxNumber, 3).

-define(AddMVDefault, 200).

%%%------------------------------------
%% 待进列表
-record(waitingPlayer, {
	roleID = 0,
	time = 0    % 请求进入时间
}).

%%%------------------------------------
-record(chapter,{
	headCount = 20,
	maxChapter = 1,
	curChapter = 0,
	curFinishTime = 0,
	createdMonster = 0,%% = disappearMonster + killedMonster
	disappearMonster = 0,
	killedMonster = 0,
	createMonsterTime = 0,
	materialVal = 0
}).

-record(tower,{
	dataId = 0,
	type = 0,
	lv = 0
}).

-record(playerDrop,{
	roleID = 0,
	drops = []
}).


%% 地图
-record(materialMap, {
	creator = 0,
	state = 0,
	mapID = 0,
	teamID = 0,
	mapPID = undefined, % 地图如果销毁，有玩家进入，需要重新创建地图
	playerEts = undefined,
	monsterEts = undefined,
	isCreating = false,
	deadlineTime = 0,  % 本地图结束时间
	finishTime = 0,
	createTime = 0,
	chapterData = #chapter{}, %
	towerData = [], % #tower{}
	roleDropList = [] % [#playerDrop{}]
}).



-endif. %% Hrl_acMaterialPrivate__hrl___