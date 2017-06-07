%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 港口竞速数据结构定义
%%% @end
%%% Created : 24. 六月 2015 14:08
%%%-------------------------------------------------------------------
-author("wenshaofei").
-include("cfg_needForSpeedScoreLine.hrl").
-include("cfg_needForSpeedCollideRoadBox.hrl").
-include("cfg_needForSpeedRandomItem.hrl").
-include("cfg_needForSpeedItem.hrl").
%%港口竞速活动[关闭状态、准备开始状态、开始状态、准备关闭状态、关闭状态]
-record(need_for_speed_activety,{state}).
%%港口竞速比赛
%%参赛准备阶段：匹配阶段：人满了就开始
%%进入场景等待开始阶段：倒计时10秒开始比赛
%%比赛开始阶段：跑了一圈又一圈，一圈一圈再一圈
%%比赛奖励阶段：弹出活动奖励面板、给用户发放奖励、并且在特定时间之后将用户传送出活动地图
%%比赛结束：用户会被传送出去、
-record(need_for_speed_competition,{id,state, end_time,map_pid}).
%%%%港口竞速id编号、使用ets的特效让其实现递增 
%%-record(need_for_speed_competition_index,{index}).

%%港口竞速:运动员数据结构,运动员数据内不包含离开赛场的运动员，所有离开赛场的运动员一律从ets数据库内删除
%%current_score_line_id当前撞击的分数线编号、collide_line_ms=撞到分数线时的时间,
%% effect_join_number=有效参与次数，改值在会同步玩家每日玩家计数上的港口竞速次数
-record(need_for_speed_athlete,{competition_id,role_id,isPetdoubleMaster=false,partner_id=0,item_list=[], current_score_line_id =0, collide_line_ms =0,current_circle=0,effect_join_number=0}).

%%港口竞速：路面碰撞盒子
%%competition_and_box_cfg_id=军团id和碰撞盒子配置id，is_taken=是否已被其它玩家取走（一个碰撞到盒子的玩家将会带走盒子里面的随机道具）
-record(need_for_speed_collider_road_box,{competition_and_box_cfg_id,is_taken=false}).
%%港口竞速道具最大个数
-define(NEED_FOR_SPEED_ITEM_MAX_NUMBER,2).
%%%%%%%%%%%%%%%%%%%%%%%%港口竞速活动状态定义BEGIN%%%%%%%%%%%%%%%%%%%%%%
%%港口竞速活动状态：结束
-define(NEED_FOR_SPEED_ACTIVETY_STATE_OVER,0).
%%港口竞速活动状态：结束
-define(NEED_FOR_SPEED_ACTIVETY_STATE_BEGIN,1).
%%%%%%%%%%%%%%%%%%%%%%%%港口竞速活动状态定义END%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%港口竞速赛场状态定义BEGIN%%%%%%%%%%%%%%%%%%%%%%%%
%%港口竞速赛场状态：匹配阶段
-define(NEED_FOR_SPEED_COPETITION_STATE_MATCHING,1).
%%港口竞速赛场状态：准备开始阶段
-define(NEED_FOR_SPEED_COPETITION_STATE_READY_BEGIN,2).
%%港口竞速赛场状态：开始阶段
-define(NEED_FOR_SPEED_COPETITION_STATE_BEGIN,3).
%%港口竞速赛场状态：奖励发放、并通知客户端提示比赛结果信息
-define(NEED_FOR_SPEED_COPETITION_STATE_AWARD_AND_END_INFO,4).
%%港口竞速赛场状态：比赛结束、等待系统回收资源
-define(NEED_FOR_SPEED_COPETITION_STATE_OVER,5).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%港口竞速赛场状态定义END%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%通用定义%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%地图上分数线的最大个数,用来计算用户得到的分数，分数=当前圈数*MAX_SCORE_LINE_NUMBER+当前撞击的分数线id
-define(MAX_SCORE_LINE_NUMBER,10000000).
-define(ETS_NEED_FOR_SPEED_COMPETITION_INDEX,need_for_speed_competition_index).

%%港口竞速随机奖励配置文件
-record(needForSpeedRandomAwardCfg,{id,awardInfo=[[lvBegin,lvEnd, itemNumber,itemId]]}).
%%港口竞速退出奖励配置id
-define(NEED_FOR_SPEED_LITTLE_AWARD_CFG_ID,11).

%%港口竞速活动资源清理等待时间
-define(NEED_FOR_SPEED_DELETE_COMPETITION_WAIT_TIME_SEC,3).