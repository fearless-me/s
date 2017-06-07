%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 十一月 2016 15:36
%%%-------------------------------------------------------------------
-module(needForSpeedOtp).
-author("wenshaofei").


-behaviour(myGenServer).

-include("../../activityPrivate.hrl").
-include("needForSpeedPrivate.hrl").

-export([start_link/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3, handle_exception/3]).

start_link(Name) ->
  myGenServer:start_link({local, Name}, ?MODULE, [], [{timeout, ?Start_Link_TimeOut_ms}]).

init([]) ->
  ?LOG_OUT("~p ~p init OK", [?MODULE, self()]),
  needForSpeedLogic:init(),
  {ok, {}}.

handle_call(Req, _From, State) ->
  ?ERROR_OUT("[~p] unhandle call ~p", [?MODULE, Req]),
  {noreply, State}.

handle_cast(Msg, State) ->
  ?ERROR_OUT("[~p] unhandle cast ~p", [?MODULE, Msg]),
  {noreply, State}.

handle_info(<<"state_ticker">>, State) ->
  needForSpeedLogic:startStateTicker(),
  needForSpeedLogic:stateTickerCallBack(),
  {noreply, State};
%% 主活动模块给出的回调
handle_info({activityChangeCallBack, _Pid, {?ActivityType_NeedForSpeed, _Phase}}, State) ->
  {noreply, State};
%% 地图工作者进程创建黑暗之地成功
handle_info({createActivityMapAck, _PidFrom, {MapID, [MapPid], {[RoleID | _] = RoleIDList, Postions}}}, State) ->
  {ok, #need_for_speed_athlete{competition_id = CompetitionID}} = needForSpeedAthlete:getAthleteInfo(RoleID),
  needForSpeedLogic:updateCompetitionInfo(CompetitionID, [{#need_for_speed_competition.map_pid, MapPid}]),
  needForSpeedLogic:transform2ActiveMap(RoleIDList, MapID, MapPid, Postions),
  {noreply, State};
%% 单人骑乘匹配
handle_info({match, _RolePid, {RoleID}}, State) ->
  needForSpeedLogic:match(RoleID),
  {noreply, State};
%% 双人骑乘匹配
handle_info({match, _RolePid, {RoleID, PartnerID}}, State) ->
  needForSpeedLogic:match(RoleID, PartnerID),
  {noreply, State};


%% 双人骑乘取消匹配
handle_info({cancelMatch, _RolePid, {RoleID, PartnerID}}, State) ->
  needForSpeedLogic:cancelMatch(RoleID, PartnerID),
  {noreply, State};
%% 单人骑乘取消匹配
handle_info({cancelMatch, _RolePid, {RoleID}}, State) ->
  needForSpeedLogic:cancelMatch(RoleID),
  {noreply, State};

%% 退出比赛场景
handle_info({exitCompetition, _RolePid, RoleID}, State) ->
  needForSpeedLogic:exitCompetition(RoleID),
  {noreply, State};

%%玩家撞到了分数线
handle_info({collideScoreLine, _RolePid, {RoleID, Postion, CollideScoreLineId}}, State) ->
  case needForSpeedAthlete:getAthleteInfo(RoleID) of
    {ok, #need_for_speed_athlete{} = AthleteInfo} ->
      needForSpeedLogic:collideScoreLine(AthleteInfo, Postion, CollideScoreLineId);
    _ ->
      skip
  end,
  {noreply, State};
%%玩家撞到了路面上的盒子
handle_info({collideRoadBox, _RolePid, {RoleID}}, State) ->
  needForSpeedColliderRoadBox:colliderRoadBox(RoleID),
  {noreply, State};

%%玩家撞到了路面上的盒子
handle_info({useItem, _RolePid, {RoleID, ItemID, TargetRoleIDList}}, State) ->
  ?DEBUG_OUT("useItem=======~p~n", [needForSpeedAthlete:getAthleteInfo(RoleID)]),
  case needForSpeedAthlete:getAthleteInfo(RoleID) of
    {ok, none} -> skip;
    {ok, AthleteInfo} ->
      needForSpeedAthlete:useItem(AthleteInfo, ItemID, TargetRoleIDList)
  end,
  {noreply, State};


%% 活动地图的消息接口
handle_info({activityMapMsg, _Pid, {MsgType, Data}}, State) ->
  case MsgType of
    ?ACMapMsg_PlayerEnter ->
      {RoleID, _, #recMapObject{}} = Data,
      case needForSpeedAthlete:getAthleteInfo(RoleID) of
        {ok, none} ->
          skip;
        {ok, #need_for_speed_athlete{competition_id = CompetitionID}} ->
          CurrentIsWin = needForSpeedLogic:isWin(CompetitionID),
          needForSpeedLogic:flashCompletionInfo2Client(CompetitionID, CurrentIsWin),
          gsSendMsg:sendRolePidMsgByRoleID(RoleID, transfer2NeedForSpeedMapAck,[])
      end;
    ?ACMapMsg_Offline ->
      RoleID = Data,
      ?DEBUG_OUT("=exit ACMapMsg_Offline =Data==~p~n", [RoleID]),
      case needForSpeedAthlete:getAthleteInfo(RoleID) of
        {ok, none} ->
          skip;
        {ok, _AthleteInfo} ->
          playerNeedForSpeed:exitCompetitionByNetError(RoleID)
      end;
    _ ->
      skip
  end,
  {noreply, State};
handle_info({activityDataLoadAckCallBack, _Pid, _Data}, State) ->
  {noreply, State};
handle_info(Info, State) ->
  ?ERROR_OUT("unhandle info:[~p] in [~p] [~p,~p]", [Info, node(), ?MODULE, self()]),
  {noreply, State}.

terminate(_Reason, _State) ->
  ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.

handle_exception(Type, Why, State) ->
  myGenServer:default_handle_excetion(Type, Why, State).