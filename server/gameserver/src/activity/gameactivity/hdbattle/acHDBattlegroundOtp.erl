%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 混沌战场otp
%%% @end
%%% Created : 13. 一月 2015 19:22
%%%-------------------------------------------------------------------
-module(acHDBattlegroundOtp).
-author("tiancheng").

-behaviour(myGenServer).

-include("../../activityPrivate.hrl").
-include("acHDBattlegroundPrivate.hrl").

-export([start_link/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3, handle_exception/3]).


start_link(Name) ->
	myGenServer:start_link({local,Name}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

init([]) ->
	?LOG_OUT("~p ~p init OK",[?MODULE, self()]),
	acHDBattlegroundLogic:init(),
	{ok,{}}.

handle_call(Req, _From, State) ->
	?ERROR_OUT("[~p] unhandle call ~p", [?MODULE, Req]),
	{noreply, State}.

handle_cast(Msg, State) ->
	?ERROR_OUT("[~p] unhandle cast ~p", [?MODULE, Msg]),
	{noreply, State}.

%% 主活动模块给出的回调
handle_info({activityChangeCallBack, _Pid, {?ActivityType_HDBattle, Phase}}, State) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_HDBattle) of
		true ->
			acHDBattlegroundLogic:activityChangeCallBack(Phase);
		_ ->
			skip
	end,
	{noreply,State};

%% 活动地图的消息接口
handle_info({activityMapMsg, _Pid, {MsgType, Data}}, State) ->
	case MsgType of
		?ACMapMsg_HurtMonster ->
			%% 有怪物受到伤害
			acHDBattlegroundLogic:monsterDamageAdd(Data);
		?ACMapMsg_KillMonster ->
			%% 有怪物死亡
			acHDBattlegroundLogic:monsterDead(Data);
		?ACMapMsg_PlayerEnter ->
			{RoleID, _, _} = Data,
			%% 玩家进入混沌战场活动地图
			acHDBattlegroundLogic:playerEntermap(RoleID);
		?ACMapMsg_CreateMap ->
			{_CreateRoleID,_MapID,Pid,PlayerEts,_MonsterEts,_CollectEts,_NpcEts} = Data,
			acHDBattlegroundLogic:setHDPlayerEts(Pid, PlayerEts),
			ok;
		_ ->
			skip
	end,
	{noreply,State};

%% 请求加入战场，如果没报名，则判断报名，如果报名成功，则判断能否加入，能加入直接返回可以加入
handle_info({requestJoinHDBattle, PidFrom, Msg}, State) ->
	Ret = acHDBattlegroundLogic:requestJoinHDBattle(Msg),
	psMgr:sendMsg2PS(PidFrom, requestJoinHDBattleAck, Ret),
	{noreply,State};

%% 更新个人信息
handle_info({playerOnline, _PidFrom, Msg}, State) ->
	acHDBattlegroundLogic:updateInfo(Msg),
	{noreply,State};

%% 玩家掉线，删除报名
handle_info({playerOffline, _PidFrom, RoleID}, State) ->
	acHDBattlegroundLogic:delApplyPlayer(RoleID),
	{noreply,State};

%% 请求战场信息
handle_info({requestQueueNumber, _PidFrom, {RoleID, RoleNetPID}}, State) ->
	L = acHDBattlegroundLogic:getWaitJoinBattlePlayer(),
	IsInApply = case acHDBattlegroundLogic:getSelfApplyRec(RoleID) of
		            {ok, #recHDApply{}} -> true;
					_ -> false
	            end,
	ACIsStart = (acHDBattlegroundLogic:getHDBattlePhase() =:= ?HDPhase_Start),
	Msg = #pk_GS2U_QueueNumber{
		queueNumber = erlang:length(L),
		isStart = ACIsStart,
		isIMApply = IsInApply
	},
	gsSendMsg:sendNetMsg(RoleNetPID, Msg),
	{noreply,State};

%% 删除报名
handle_info({cancelApply, _PidFrom, {RoleID, RoleNetPID}}, State) ->
	Msg =
		case acHDBattlegroundLogic:delApplyPlayer(RoleID) of
			true ->
				playerMsg:getErrorCodeMsg(?ErrorCode_CancelHDBattleApply_Success, []);
			_ ->
				playerMsg:getErrorCodeMsg(?ErrorCode_CancelHDBattleApply_Failed, [])
		end,
	gsSendMsg:sendNetMsg(RoleNetPID, Msg),
	{noreply,State};

%% 活动开启前的全服喊话心跳
handle_info(hDPlayerReadStartBattle, State) ->
	acHDBattlegroundLogic:sendTipsToAllPlayer(?ErrorCode_ActivityHDWillStart),
	{_H1, H2, H3} = acHDBattlegroundLogic:getHDBattleHeart(),
	TimerRef = erlang:send_after(?HDPlayerReadStartBattle, self(), hDPlayerReadStartBattle),
	acHDBattlegroundLogic:setHDBattleHeart({TimerRef, H2, H3}),
	{noreply,State};

%% 把报名的人拉去战场心跳
handle_info(hDPlayerWaitJoinBattle, State) ->
	acHDBattlegroundLogic:hDPlayerWaitJoinBattle(),
	{H1, _H2, H3} = acHDBattlegroundLogic:getHDBattleHeart(),
	TimerRef = erlang:send_after(?HDPlayerWaitJoinBattle, self(), hDPlayerWaitJoinBattle),
	acHDBattlegroundLogic:setHDBattleHeart({H1, TimerRef, H3}),
	{noreply,State};

%% 刷怪心跳
handle_info(hDBattleFreshMonster, State) ->
	acHDBattlegroundLogic:hDBattleFreshMonster(),
	{H1, H2, _H3} = acHDBattlegroundLogic:getHDBattleHeart(),
	TimerRef = erlang:send_after(?HDBattleFreshMonster, self(), hDBattleFreshMonster),
	acHDBattlegroundLogic:setHDBattleHeart({H1, H2, TimerRef}),
	{noreply,State};

%% 清除刷怪的心跳
handle_info(clearFreshMonsterTick, State) ->
	%% 最后移除刷怪的心跳
	{_H1, _H2, H3} = acHDBattlegroundLogic:getHDBattleHeart(),
	acHDBattlegroundLogic:delHDBattleHeart(H3),
	acHDBattlegroundLogic:setHDBattleHeart(undefined),
	acHDBattlegroundLogic:setHDBattlePhase(?HDPhase_Close),
	{noreply,State};

%% 准备心跳
handle_info(tickPrepare, State) ->
	acHDBattlegroundLogic:tickPrepare(),
	{noreply,State};

%% gm命令创建一个混沌战场
handle_info({gm_createhdbattle, _Pid, _Msg}, State) ->
	core:sendMsgToMapMgr(?HDBattleMapID, createActivityMap, {?HDBattleMapID, 1, 0}),
	{noreply,State};

%% 地图工作者进程创建战场成功
handle_info({createActivityMapAck, _Pid, Data}, State) ->
	acHDBattlegroundLogic:createHDBattleMapAck(Data),
	{noreply,State};

%% 每五秒更新一次信息，并且增加荣誉值
handle_info({updateHDInfo, _PidFrom, {RoleID,_,_} = Msg}, State) ->
	acHDBattlegroundLogic:updateInfo(Msg),
	acHDBattlegroundLogic:addHonor(RoleID,undefined,?HDAddHonorGD),
	{noreply,State};

%% 杀人了
handle_info({killedTarget, _Pid, {DeadRoleID, AttackRoleID}}, State) ->
	acHDBattlegroundLogic:playerDead(DeadRoleID),
	acHDBattlegroundLogic:killedTarget(AttackRoleID),
	{noreply,State};

%% 在混沌战场中采集了一个东西
handle_info({hdbattleGatherSuccess, _Pid, Data}, State) ->
	acHDBattlegroundLogic:hdbattleGatherSuccess(Data),
	{noreply,State};

%% 获取混沌战场击杀玩家排行榜数据
handle_info({requestHDKillRank, _Pid, Msg}, State) ->
	acHDBattlegroundLogic:requestHDKillRank(Msg),
	{noreply,State};
handle_info({activityDataLoadAckCallBack, _Pid, _Data}, State) ->
	{noreply, State};
handle_info(Info, State) ->
	?ERROR_OUT("unhandle info:[~p] in [~p] [~p,~p]",[Info,node(),?MODULE,self()]),
	{noreply,State}.

terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).