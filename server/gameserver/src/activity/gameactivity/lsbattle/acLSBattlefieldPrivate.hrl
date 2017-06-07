%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc乱世为王战场宏定义
%%%
%%% @end
%%% Created : 21. 九月 2016 11:00
%%%-------------------------------------------------------------------
-author("wenshaofei").
-include("netmsgRecords.hrl").
%%乱世为王玩家信息数据,killPlayerNumber=累计杀人数，disposableKillNumber=连续杀人数死亡后该数值清0，revenge_list=复仇列表，如果被人击杀了，击杀者会被存放到复仇列表内,isInActive=是否正在参加活动。
-record(recLSMemberInfo,{roleID=0,killPlayerNumber=0,disposableKillNumber=0,score=0,rank=0,revenge_list=[],isInActive=false}).
%%活动准备开始状态
-define(AC_LS_STATE_BEGIN_READY,1).
%%活动开始状态
-define(AC_LS_STATE_BEGIN,2).
%%活动准备结束状态
-define(AC_LS_STATE_END_READY,3).
%%活动结束状态
-define(AC_LS_STATE_END,4).
%%活动结束一段时间后开始吧玩家提出地图状态
-define(AC_LS_STATE_END_KICK_PLAYER_OUT,5).

%%乱世为王活动地图id
-define(AC_LS_MAP_ID,1000).
%%站在地图上加经验时间间隔
-define(TICKER_ADD_EXP_TIME,30000).
%%召唤怪兽ticker加经验时间间隔
-define(TICKER_CALL_MONSTER_TIME,1000).
%%计算排行榜的ticker加经验时间间隔
-define(TICKER_RANK_TIME,1000).
%%活动状态监测时间间隔
-define(TICKER_ACTIVE_STATE_CHANGE_TIME,300).
%%%%%%%%%%%消息key定义%%%%%%%%%%%%%%%%%%%%%%%%%%
%%消息key_站在地图上上加经验
-define(MSG_KEY_MAP_ADD_EXP_TICKER,"mapAddExpTicker").
%%消息key_召唤地图上的怪物
-define(MSG_KEY_CALL_MONSTER_TICKER,"callMonsterTicker").
%%消息key_计算排行榜消息
-define(MSG_KEY_RANK_TICKER,"rankTicker").
%%消息key_活动状态改变ticker
-define(MSG_KEY_ACTIVE_STATE_CHANGE_TICKER,"activeStateChangeTicker").
%%%%%%%%%%%%%%%%%%%%
-define(LS_BATTLE_FIELD_MAP_ID,8000).
