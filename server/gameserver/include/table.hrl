-ifndef(ETS_TABLE_HRL).
-define(ETS_TABLE_HRL,1).

%%ETS定义表
%% 表名具有唯一性，且只能有一个（地图进程里的ETS表不要放在这里）

%% 玩家管理进程管理表
-define(TABLE_PlayerInfo, 		ets_rec_OnlinePlayer).

%% 玩家管理进程管理表
-define(TABLE_PlayerInfoCross, 		playerInfoTableCross).

%% 玩家管理进程管理表
-define(TABLE_MiscKV, 		miscKVTable).

%% Main进程管理表
-define(TABLE_AllPlayerSharedEquip, allPlayerSharedEquipTable). %%所有玩家共享出去的装备ETS表，包括聊天、邮件里插入的装备

%% 组队定义表
-define(TABLE_TeamInfo, 	teamInfoTable).
%% 组队成员定义表
-define(TABLE_TeamPlayerInfo, 	teamPlayerInfoTable).

%% 跨服组队
-define(TABLE_CrosTeam,		crosTeamInfo).

%%掉落
-define(TABLE_DROP,			dropInfo).

%% 登录活动配置表
-define(TABLE_PlayerLoginAwardConf, 		playerLoginAwardConfTable).

%% 玩家语音缓存表
-define(TABLE_PlayerVoice, voiceInfoTable).

%% 玩家排行榜缓存表
-define(TABLE_RankInfo, rankTableInfo).

%%funcell日志缓存表
-define(TABLE_ToFuncellLog,toFuncellLog).

-define(TABLE_ToFuncellLogTxt,"toFuncellLog.txt").
%% 保存数据库的队伍信息
-define(TABLE_DBTeamInfo, 	dbTeamInfoTable).
%% 保存野外boss信息
-define(TABLE_WildBoss, 	wildBossTable).
%% 保存聊天CD
-define(TABLE_CHATCD,		chatCD).

-endif.
