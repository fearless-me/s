%%%-------------------------------------------------------------------
%%% @author zhengzhichun
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 王者战天下otp
%%% @end
%%% Created : 13. 一月 2015 19:22
%%%-------------------------------------------------------------------
-module(acKingBattleAllOtp).
-author("zzc").

-behaviour(myGenServer).

-include("../../activityPrivate.hrl").
-include("acKingBattleAllPrivatePrivate.hrl").

-export([start_link/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3, handle_exception/3]).


start_link(Name) ->
	myGenServer:start_link({local, Name}, ?MODULE, [], [{timeout, ?Start_Link_TimeOut_ms}]).

init([]) ->
	?LOG_OUT("~p ~p init OK", [?MODULE, self()]),
	acKingBattleAllLogic:init(),
	{ok, {}}.

handle_call(Req, _From, State) ->
	?ERROR_OUT("[~p] unhandle call ~p", [?MODULE, Req]),
	{noreply, State}.

handle_cast(Msg, State) ->
	?ERROR_OUT("[~p] unhandle cast ~p", [?MODULE, Msg]),
	{noreply, State}.

handle_info({getRolesAppearanceFromDBAck, _Pid, {_,Info}}, State) ->
	acKingBattleAllLogic:saveMirrotApperance(Info),
	?DEBUG_OUT("getRolesAppearanceFromDBAck==============~p~n",[Info]),
	{noreply, State};
%% 主活动模块给出的回调
handle_info({activityChangeCallBack, _Pid, {?ActivityType_KingBattleAll, Phase}}, State) ->
	%% 再执行其它操作
	case acKingBattleAllLogic:globalControlIsOpen() of
		true ->
			?LOG_OUT("ActivityType_KingBattleAll Phase====~p",[Phase]),
			acKingBattleAllLogic:activityChangeCallBack(Phase);
		_ ->
			?LOG_OUT("ActivityType_KingBattleAll close..."),
			skip
	end,
	{noreply, State};

%% 活动地图的消息接口
handle_info({activityMapMsg, _Pid, {MsgType, Data}}, State) ->
	case MsgType of
		?ACMapMsg_HurtMonster ->
			%% 有怪物受到伤害
			acKingBattleAllLogic:monsterDamage(Data);
		?ACMapMsg_KillMonster ->
			%% 有怪物死亡
			acKingBattleAllLogic:monsterDead(Data);
		?ACMapMsg_PlayerEnter ->
			{RoleID, _, _} = Data,
			gsSendMsg:sendRolePidMsgByRoleID(RoleID, enterKingBattleSenceSuccessAck, []);
		?ACMapMsg_DestoryMap ->
			acKingBattleAllLogic:onMapDestroy(Data);
		?ACMapMsg_CreateMap ->
			{_CreateRoleID,_MapID ,_,_PlayerEts, _MonsterEts, _CollectEts, _NpcEts} = Data,
			acKingBattleAllLogic:setACMapPid(_Pid),
			acKingBattleAllLogic:createKingMirroring(),
			ok;
		?ACMapMsg_Offline ->
			RoleID = Data,
			acKingBattleAllLogic:offlineInMap(RoleID);
		?ACMapMsg_PlayerLeave ->
			{RoleID, _, _}  = Data,
			acKingBattleAllLogic:offlineInMap(RoleID);
		_ ->
			skip
	end,
	{noreply, State};

%% 设置王者战天下目标
handle_info({gm_setfightallrole, _PlayerPid, {RoleID, FightForce}}, State) ->
	case acKingBattleAllLogic:resetKingData(RoleID, FightForce) of
		{ok, <<"success">>} ->
			psMgr:sendMsg2PS(?PsNameActivity, setActivePhase, {?ActivityType_KingBattleAll, ?ActivityPhase_Close});
		_ ->
			?ERROR_OUT("gm_setfightallrole fail can not find role info,{RoleID, FightForce}=~p~n", [{RoleID, FightForce}])
	end,
	{noreply, State};

%% 请求进入王者战天下，
handle_info({requestJoinKingBattleMap, PlayerPid, Info}, State) ->
	Ret = acKingBattleAllLogic:joinKingBattleAC(Info),
	psMgr:sendMsg2PS(PlayerPid, requestJoinKingBattleMapAck, Ret),
	{noreply, State};

%% 请求伤害排行
handle_info({requestKingBattleDamageRank, PlayerPid, {RoleID}}, State) ->
	Ret = acKingBattleAllLogic:damageRank(RoleID),
	psMgr:sendMsg2PS(PlayerPid, requestKingBattleDamageRankAck, Ret),
	{noreply, State};

%%%% 进攻方胜利，玩家进程告诉我公告的内容，
%%handle_info({attackerWin, _PlayerPid, {AttackerName, DefenderName}}, State) ->
%%  acKingBattleAllLogic:attackerWin(AttackerName, DefenderName),
%%  {noreply, State};

%%有玩家离开活动
handle_info({onLevelKingBattleMap, _PlayerPid, {RoleID}}, State) ->
	acKingBattleAllLogic:offlineInMap(RoleID),
	{noreply, State};

%% 地图工作者进程创建战场成功
handle_info({createActivityMapAck, _Pid, {_MapID, _MapPIDList, _Data}}, State) ->
	{noreply, State};

%%%% 镜像的仇恨值
%%handle_info({marrorHateList, _Pid, HateList}, State) ->
%%  acKingBattleAllLogic:sendMail2AllRoleInHateList(HateList),
%%  {noreply, State};

%% 有人死亡
handle_info({playerDead, _Pid, RoleID}, State) ->
	acKingBattleAllLogic:playerDead(RoleID),
	{noreply, State};

%% 杀人了
handle_info({killedTarget, _Pid, {DeadRoleID, AttackRoleID}}, State) ->
	acKingBattleAllLogic:killedTarget({DeadRoleID, AttackRoleID}),
	{noreply, State};

%%%% 刷面板数据
%%handle_info({getRoleData4KingMarrorAck, _Pid,{RoleID}}, State) ->
%%  gsSendMsg:sendMsg2DBServer(getRolesAppearanceFromDB, 0, [RoleID]),
%%  ?LOG_OUT("getRoleData4KingMarrorAck"),
%%  {noreply, State};

%%%% 玩家数据与战力
%%handle_info({getRoleData4KingAck, _Pid, Data}, State) ->
%%  acKingBattleAllLogic:initMirrorFromRank(Data),
%%  {noreply, State};
handle_info({activityDataLoadAckCallBack, _Pid, _Data}, State) ->
	?DEBUG_OUT("==========activityDataLoadAckCallBack=====ackingbattle========="),
	acKingBattleAllLogic:activityDataLoadAckCallBack(),
	{noreply, State};
handle_info({deleteRoleCallBack, _Pid, [RoleID]}, State) ->
  ?DEBUG_OUT("=======deleteRoleCallBack=======~p~n",[RoleID]),
  acKingBattleAllLogic:deleteRole(RoleID),
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