%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc乱世为王战场OTP模块
%%%
%%% @end
%%% Created : 21. 九月 2016 11:00
%%%-------------------------------------------------------------------
-module(acLSBattlefieldOtp).
-author("wenshaofei").

-behaviour(myGenServer).

-include("../../activityPrivate.hrl").
-include("acLSBattlefieldPrivate.hrl").

-export([start_link/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3, handle_exception/3]).

start_link(Name) ->
	myGenServer:start_link({local,Name}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

init([]) ->
	?LOG_OUT("~p ~p init OK",[?MODULE, self()]),
	acLSBattlefieldLogic:init(),
	{ok,{}}.

handle_call(Req, _From, State) ->
	?ERROR_OUT("[~p] unhandle call ~p", [?MODULE, Req]),
	{noreply, State}.

handle_cast(Msg, State) ->
	?ERROR_OUT("[~p] unhandle cast ~p", [?MODULE, Msg]),
	{noreply, State}.

%% 主活动模块给出的回调
handle_info({activityChangeCallBack, _Pid, {?ActivityType_LSBattleField, _Phase}}, State) ->
	{noreply,State};

%% 活动地图的消息接口
handle_info({activityMapMsg, _Pid, {MsgType, Data}}, State) ->
	case MsgType of
		?ACMapMsg_KillMonster ->
			{MapID, FromMapPid, AttackRoleID, _MonsterCode, MonsterID}=Data,
			?DEBUG_OUT("===================================kill monster ~w~n",[{MsgType,Data}]),
			MapIDArgu = logicArguLib:getMapId(MapID),
			CodeArgu = logicArguLib:getKillTargetCodeIDArgu(?ObjTypeMonster,MonsterID),
			CurrentRoleArgu=logicArguLib:getRoleBaseInfoArgu(AttackRoleID),
			[#rec_base_role{roleName = AttackerName}] = ets:lookup(ets_rec_base_role,AttackRoleID),
			#monsterCfg{showName = ShowName} =  getCfg:getCfgPStack(cfg_monster, MonsterID) ,
			NoticeArgu  = logicArguLib:getNoticeInMapArgu([FromMapPid],[AttackerName,ShowName]),
			PMDNoticeArgu = logicArguLib:getPaoMaDengFormatArgu([AttackerName]),
			%% 有怪物死亡
			logicLib:runLogicGroup(?LOGIC_GROUP_ID_LS_BATTLEFIELD_KILL,[MapIDArgu,CodeArgu,CurrentRoleArgu,NoticeArgu,PMDNoticeArgu]);
		?ACMapMsg_KillPlayer ->
			{MapID, FromMapPid, AttackRoleID, _DeadCode, DeadID}=Data,
			?DEBUG_OUT("========================================kill player ~w~n",[{MsgType,Data,DeadID}]),
			MapIDArgu = logicArguLib:getMapId(MapID),
			CodeArgu = logicArguLib:getKillTargetCodeIDArgu(?ObjTypePlayer,DeadID),
			CurrentRoleArgu=logicArguLib:getRoleBaseInfoArgu(AttackRoleID),
			[#rec_base_role{roleName = AttackerName}] = ets:lookup(ets_rec_base_role,AttackRoleID),
			[#rec_base_role{roleName = DeadName}] = ets:lookup(ets_rec_base_role,DeadID),
			NoticeArgu  = logicArguLib:getNoticeInMapArgu([FromMapPid],[AttackerName,DeadName]),
			PMDNoticeArgu = logicArguLib:getPaoMaDengFormatArgu([AttackerName]),
			%% 有人死亡
			R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_LS_BATTLEFIELD_KILL,[MapIDArgu,CodeArgu,CurrentRoleArgu,NoticeArgu,PMDNoticeArgu]),
			?DEBUG_OUT("R=======kill player ================~p~n",[R])	;
		?ACMapMsg_PlayerEnter ->
			{RoleID, _, #recMapObject{pid = RolePid}} = Data,
			psMgr:sendMsg2PS(RolePid, ls_battleField_change_pk_state, []),
			acLSBattlefieldLogic:joinActive(RoleID);
		?ACMapMsg_PlayerLeave->
			{RoleID, _, _} = Data,
			acLSBattlefieldLogic:leaveActive(RoleID);
		_ ->
			skip
	end,
	{noreply,State};
handle_info(?MSG_KEY_ACTIVE_STATE_CHANGE_TICKER, State) ->
 acLSBattlefieldLogic:startActiveStateTicket(),
{noreply,State};
handle_info(?MSG_KEY_MAP_ADD_EXP_TICKER, State) ->
	acLSBattlefieldLogic:startAddExpTicker(),
	{noreply,State};
handle_info(?MSG_KEY_CALL_MONSTER_TICKER,  State) ->
	acLSBattlefieldLogic:startCallMonsterTicker(),
	{noreply,State};
handle_info(?MSG_KEY_RANK_TICKER, State) ->
	acLSBattlefieldLogic:startRankTicker(),
	{noreply,State};
handle_info({activityDataLoadAckCallBack, _Pid, _Data}, State) ->
	{noreply, State};
handle_info(Info, State) ->
	?ERROR_OUT("receive unknow msg:~w~n",[Info]),
	{noreply,State}.

terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).