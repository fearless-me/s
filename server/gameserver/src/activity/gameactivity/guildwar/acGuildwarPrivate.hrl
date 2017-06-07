%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, 好玩一二三
%%% @doc
%%% 活动模块私有定义
%%% @end
%%% Created : 06. 二月 2015 14:29
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(Hrl_acGuildwarPrivate__hrl___).
-define(Hrl_acGuildwarPrivate__hrl___, 1).

-include("gsInc.hrl").
-include("activityDef.hrl").

-define(GuildWarTick, 5000).
-define(KillRankNumber, 20).
-define(GuildWar_CS, 1).    % 初赛
-define(GuildWar_JS, 2).    % 决赛

%% 初始化始水晶数据
-define(InitPebbleDataInfo, 2000).

%% 阻挡协议列表
-define(BlockIDMsg,
	#pk_GS2U_BlockStatusChange{
		changes = [
			#pk_BlockStatusChange{blockName = "d1", blockStatus = ?BlockNpc_Open},
			#pk_BlockStatusChange{blockName = "d2", blockStatus = ?BlockNpc_Open},
			#pk_BlockStatusChange{blockName = "d3", blockStatus = ?BlockNpc_Open},
			#pk_BlockStatusChange{blockName = "d4", blockStatus = ?BlockNpc_Open},
			#pk_BlockStatusChange{blockName = "d5", blockStatus = ?BlockNpc_Open},
			#pk_BlockStatusChange{blockName = "d6", blockStatus = ?BlockNpc_Open},
			#pk_BlockStatusChange{blockName = "d7", blockStatus = ?BlockNpc_Open}
		]
	}
).

-record(recGuildWarPlayer, {
	guildID = 0,
	mapPID = undefined,
	reviveCD = 0,
	key = 0,%%{stage,group}
	startTime = 0,
	bornPos = undefined
}).

-record(recGuildID, {
	guildID = 0,
	bornPos = undefined,
	pebbleNumber = 0,  % 占领水晶次数
	cannonNumber = 0   % 争夺到炮台的次数
}).

-record(recPebble, {
	monsterCode = 0,
	monsterID = 0,
	deadTime = 0,
	reviveCD = 0,   % 复活CD
	curHp = 0,
	maxHp = 0,
	guilds = []    % [{guildID, hurtTimes},...] 军团成员造成伤害次数
}).

-record(recCannon, {
	collectCode = 0,
	collectID = 0,
	useTime = 0,
	useCD = 0
}).

-record(recPlayer, {
	guildID = 0,
	roleID = 0,
	roleName = "",
	lxKill = 0, % 连杀
	killPlayer = 0,
	secondAttack = 0
}).

-record(recGuildWar, {
	stage = 0,
	group = 0,
	key = 0,    % key:{stage,group}
	mapPid = undefined,
	playerEts = undefined,
	monsterEts = undefined,
	collectEts = undefined,
	startTime = 0,
	isEnd = false,
	winGuildID = 0,
	enterPlayerList = [], % [#recPlayer{},...] 进入的玩家列表
	pebbleState = [],    % [#recPebble{},...]   水晶状态
	cannonState = [],  % [#recCannon{},...] 大炮可使用的CD
	guilds = []    % [#recGuildID{},...]   本地图包含的军团比赛列表
}).


-endif. %% Hrl_acGuildwarPrivate__hrl___