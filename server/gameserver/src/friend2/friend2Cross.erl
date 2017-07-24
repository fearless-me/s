%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170809
%%%-------------------------------------------------------------------
-module(friend2Cross).
-author("meitianyang").

-include("friend2Private.hrl").

-define(EtsRoleInfo,	refresh).	%% 局部ETS，用于临时存储角色数据的刷新
-define(EtsDelete,		delete).	%% 局部ETS，用于临时存储需要删除的角色
-record(delete, {id = 0, na}).

%% Tools
-export([
	check/2,			%% 关系变动通用检查
	sendMsg2Mgr1/2,		%% 向大总管发送消息（跨服的好友公共进程）（什么？没连跨服？没连跨服怎么管理跨服好友啊？）
	sendMsg2Mgr2/3,		%% 向小总管发送消息（普通服的好友公共进程）（跨服上玩家不在线，可以在普通服找找）
	sendMsg2Mgr3/3,		%% 向执事总管发送消息（在跨服，跨服的好友公共进程就是执事总管；在普通服，普通服的好友公共进程就是执事总管）
	sendMsg2Mgr4/3,		%% 向同僚总管发送消息（在跨服，普通服的好友公共进程就是同僚总管；在普通服，跨服的好友公共进程就是同僚总管）
	sendMsg2Role/3		%% 试图发消息给跨服角色
]).

%% API Cross
-export([
	cross_add/1,		%% 添加好友
	cross_add2/1,		%% 同意或拒绝申请者
	cross_add2Reply/1,	%% 收到同意添加好友的请求的反馈
	cross_del/1,		%% 删除好友
	cross_tick/0		%% 跨服上的长心跳，用于延时同步数据
]).

%% API Current(Cross or Normal)
-export([
	current_syncR/2,	%% 实时同步数据
	current_syncD/2,	%% 延时同步数据
	%current_chat/1,		%% chat
	current_addAsk/1,	%% 收到添加好友的请求
	current_add2Ask/1	%% 收到同意添加好友的请求
]).

%% API Normal
-export([
	normal_syncInit/0	%% 向跨服初始化跨服好友数据
]).

%% API Transit
-export([
	transit/1
]).



%%% ====================================================================
%%% Tools functions
%%% ====================================================================

%%%-------------------------------------------------------------------
% 关系变动通用检查
-spec check(RoleID::uint64(), TarRoleID::uint64()) -> skip | type_frt().
check(0, _TarRoleID) ->
	skip;
check(_RoleID, 0) ->
	skip;
check(RoleID, RoleID) ->
	skip;
check(RoleID, TarRoleID) ->
	friend2State:queryFRT(RoleID, TarRoleID).

%%%-------------------------------------------------------------------
% 向大总管发送消息（跨服的好友公共进程）（什么？没连跨服？没连跨服怎么管理跨服好友啊？）
% 如果是在普通服，则发送数据给跨服的好友公共进程
% 如果是在跨服，则发送数据给本地的好友公共进程
-spec sendMsg2Mgr1(MsgID::term(), Msg::term()) -> no_return().
sendMsg2Mgr1(MsgID, Msg) ->
	case core:isCross() of
		true ->
			psMgr:sendMsg2PS(?PsNameFriend2, MsgID, Msg);
		_ ->
			gsSendMsg:sendMsg2Cross(?PsNameFriend2, MsgID, Msg)
	end.

%%%-------------------------------------------------------------------
% 向小总管发送消息（普通服的好友公共进程）（跨服上玩家不在线，可以在普通服找找）
-spec sendMsg2Mgr2(MsgID::term(), Msg::term(), TarRoleID::uint64()) -> no_return().
sendMsg2Mgr2(MsgID, Msg, TarRoleID) ->
	case core:isCross() of
		true ->
			case core:getRealDBIDByUID(TarRoleID) of
				0 ->
					skip;	%% 目标错误
				DBID ->
					gsSendMsg:sendMsg2OneSource(DBID, ?PsNameFriend2, MsgID, Msg)
			end;
		_ ->
			MyDBID = globalSetup:getDBID(),
			case core:getRealDBIDByUID(TarRoleID) of
				MyDBID ->
					psMgr:sendMsg2PS(?PsNameFriend2, MsgID, Msg); %% 目标在本地
				0 ->
					skip;	%% 目标错误
				DBID ->
					gsSendMsg:sendMsg2NormalServer(DBID, ?PsNameFriend2, MsgID, Msg)
			end
	end.

%%%-------------------------------------------------------------------
% 向执事总管发送消息（在跨服，跨服的好友公共进程就是执事总管；在普通服，普通服的好友公共进程就是执事总管）
-spec sendMsg2Mgr3(MsgID::term(), Msg::term(), TarRoleID::uint64()) -> no_return().
sendMsg2Mgr3(MsgID, Msg, TarRoleID) ->
	case core:queryOnLineRoleByRoleID(TarRoleID) of
		#rec_OnlinePlayer{} ->
			psMgr:sendMsg2PS(?PsNameFriend2, MsgID, Msg);
		_ ->
			sendMsg2Mgr4(MsgID, Msg, TarRoleID)
	end.

%%%-------------------------------------------------------------------
% 向同僚总管发送消息（在跨服，普通服的好友公共进程就是同僚总管；在普通服，跨服的好友公共进程就是同僚总管）
-spec sendMsg2Mgr4(MsgID::term(), Msg::term(), TarRoleID::uint64()) -> no_return().
sendMsg2Mgr4(MsgID, Msg, TarRoleID) ->
	case core:isCross() of
		true ->
			sendMsg2Mgr2(MsgID, Msg, TarRoleID);
		_ ->
			sendMsg2Mgr1(MsgID, Msg)
	end.

%%%-------------------------------------------------------------------
% 试图发消息给跨服角色
-spec sendMsg2Role(MsgID::term(), Msg::term(), TarRoleID::uint64()) -> boolean().
sendMsg2Role(MsgID, Msg, TarRoleID) ->
	case core:queryOnLineRoleByRoleID(TarRoleID) of
		#rec_OnlinePlayer{pid = Pid} ->
			psMgr:sendMsg2PS(Pid, MsgID, Msg),	%% 该角色在本地
			?DEBUG_OUT("[DebugForCross] sendMsg2Role ~w:~w.~w ~w", [core:isCross(), TarRoleID, Msg, MsgID]),
			true;
		_ ->
			case core:isCross() of
				true ->
					case core:getRealDBIDByUID(TarRoleID) of
						0 ->
							?ERROR_OUT("[DebugForCross] cross_add2 del ~w:~w.~w ~w", [core:isCross(), TarRoleID, Msg, MsgID]),
							false;	%% 目标错误
						DBID ->
							gsSendMsg:sendMsg2OneSource(DBID, ?PsNameFriend2, transit, {MsgID, TarRoleID, Msg}),	%% 目标可能在归属服
							?DEBUG_OUT("[DebugForCross] sendMsg2Role ~w:~w.~w ~w", [core:isCross(), TarRoleID, Msg, MsgID]),
							true
					end;
				_ ->
					MyDBID = globalSetup:getDBID(),
					case core:getRealDBIDByUID(TarRoleID) of
						MyDBID ->
							?WARN_OUT("[DebugForCross] cross_add2 del ~w:~w.~w ~w", [core:isCross(), TarRoleID, Msg, MsgID]),
							false;	%% 目标在本地，但是不在线
						0 ->
							?ERROR_OUT("[DebugForCross] cross_add2 del ~w:~w.~w ~w", [core:isCross(), TarRoleID, Msg, MsgID]),
							false;	%% 目标错误
						_DBID ->
							gsSendMsg:sendMsg2Cross(?PsNameFriend2, transitC, {MsgID, TarRoleID, Msg}), %% 目标可能在归属服也可能在跨服，先发给跨服
							?DEBUG_OUT("[DebugForCross] sendMsg2Role ~w:~w.~w ~w", [core:isCross(), TarRoleID, Msg, MsgID]),
							true
					end
			end
	end.

%%% ====================================================================
%%% API Cross functions
%%% ====================================================================

%%%-------------------------------------------------------------------
% 添加好友
-spec cross_add(#rec_friend2_cross{}) -> no_return().
cross_add(#rec_friend2_cross{roleID = TarRoleID, tarRoleID = RoleID}=Msg) ->
	%% 这里是跨服公共进程
	%% A：tarRoleID = RoleID；B：roleID = TarRoleID
	%% A将申请成为B的申请者
	case check(RoleID, TarRoleID) of
		?FRT_NoneC ->
			sendMsg2Mgr3(friend2Cross_3_addAsk, Msg, TarRoleID),	%% 尝试向对方发起申请
			sendMsg2Role(friend2Cross_r_addAck, TarRoleID, RoleID);	%% 直接向发起方反馈成功
		?FRT_CApply ->
			cross_add2(Msg);	%% 如同同意申请者
		_T ->
			?DEBUG_OUT("[DebugForCross] ~w:~w.~w ~w", [core:isCross(), RoleID, TarRoleID, _T]),
			skip
	end.

%%%-------------------------------------------------------------------
% 同意或拒绝申请者
-spec cross_add2(#rec_friend2_cross{}|{uint64(), uint64()}) -> no_return().

%% 同意
cross_add2(#rec_friend2_cross{roleID = TarRoleID, tarRoleID = RoleID}=Msg) ->
	%% 这里是跨服公共进程
	%% A：tarRoleID = RoleID；B：roleID = TarRoleID
	%% A将同意申请者B成为跨服好友
	%% 这里需要验证A的状态
	case check(RoleID, TarRoleID) of
		?FRT_CApply ->
			?DEBUG_OUT("[DebugForCross] ~w:~w.~w", [core:isCross(), RoleID, TarRoleID]),
			#recFriend2Cross{friends = L} = friend2State:queryFriend2Cross(RoleID),
			#globalsetupCfg{setpara = [MAX]} =
				getCfg:getCfgPStack(cfg_globalsetup, friends_crosscount),
			Len = erlang:length(L),
			case Len >= MAX of
				true ->
					Ack = {?ErrorCode_Friend2CrossAdd2_Max1, [TarRoleID]},
					sendMsg2Role(friend2Cross_r_add2Ack, Ack, RoleID);		%% 直接向发起方反馈失败
				_ ->
					sendMsg2Mgr3(friend2Cross_3_add2Ask, Msg, TarRoleID)	%% 尝试向对方发起申请
			end;
		_T ->
			?DEBUG_OUT("[DebugForCross] ~w:~w.~w ~w", [core:isCross(), RoleID, TarRoleID, _T]),
			skip
	end;

%% 拒绝所有
cross_add2({RoleID, 0}) ->
	%% 这里是跨服公共进程
	%% A：RoleID；B：0表示所有
	%% A将拒绝所有申请者
	#recFriend2Cross{applys = L} = Friend2Cross =
		friend2State:queryFriend2Cross(RoleID),
	ets:insert(?EtsFriend2Cross, Friend2Cross#recFriend2Cross{applys = []}),
	Msg = {?SYNC_R_DeleteApply, RoleID},
	sendMsg2Mgr4(friend2Cross_syncR, Msg, RoleID),		%% 向同僚发起同步
	Ack = {?ErrorCode_Friend2CrossAdd2_Refuse, [ID || #rec_friend2_cross{tarRoleID = ID} <- L]},
	sendMsg2Role(friend2Cross_r_add2Ack, Ack, RoleID);	%% 直接向发起方反馈成功

%% 拒绝指定
cross_add2({RoleID, TarRoleID}) ->
	%% 这里是跨服公共进程
	%% A：RoleID；B：TarRoleID
	%% A将拒绝申请者B成为跨服好友
	?DEBUG_OUT("[DebugForCross] cross_add2 del ~w:~w.~w", [core:isCross(), RoleID, TarRoleID]),
	#recFriend2Cross{applys = L} = Friend2Cross =
		friend2State:queryFriend2Cross(RoleID),
	LNew = lists:keydelete(TarRoleID, #rec_friend2_cross.tarRoleID, L),
	ets:insert(?EtsFriend2Cross, Friend2Cross#recFriend2Cross{applys = LNew}),
	Msg = {?SYNC_R_DeleteApply, {RoleID, TarRoleID}},
	sendMsg2Mgr4(friend2Cross_syncR, Msg, RoleID),		%% 向同僚发起同步
	Ack = {?ErrorCode_Friend2CrossAdd2_Refuse, [TarRoleID]},
	sendMsg2Role(friend2Cross_r_add2Ack, Ack, RoleID).	%% 直接向发起方反馈成功

%%%-------------------------------------------------------------------
% 收到同意添加好友的请求的反馈
-spec cross_add2Reply(Data) -> no_return() when
	Data :: {#rec_friend2_cross{}, #rec_friend2_cross{}}	%% 成功
		|	{uint32(), {uint64(), uint64()}}.							%% 失败

%% 成功
cross_add2Reply(
	{#rec_friend2_cross{roleID = TarRoleID, tarRoleID = RoleID} = DataA,
	#rec_friend2_cross{roleID = RoleID, tarRoleID = TarRoleID} = DataB}
) ->
	%% 这里是跨服公共进程
	%% A：RoleID；B：TarRoleID
	%% A将同意申请者B成为跨服好友，且这里已经收到了B所在公共进程的的状态许可
	%% 开始执行结为好友
	%% A、B在跨服内存中结为好友，同时删除A中B的申请者数据
	friend2State:replaceFriend2CrossF(DataA),
	friend2State:replaceFriend2CrossF(DataB),
	%% 同步数据
	sendMsg2Mgr2(friend2Cross_syncR, {?SYNC_R_UpdateFriend, DataA}, TarRoleID),
	sendMsg2Mgr2(friend2Cross_syncR, {?SYNC_R_UpdateFriend, DataB}, RoleID),
	%% 可能的网络消息
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{netPid = NetPidA} ->
			MsgA = #pk_GS2U_Friend2CrossAdd2_Ack{info = playerFriend2Cross:db2net(DataB)},
			playerMsg:sendNetMsg(NetPidA, MsgA);
		_ ->
			skip
	end,
	case core:queryOnLineRoleByRoleID(TarRoleID) of
		#rec_OnlinePlayer{netPid = NetPidB} ->
			MsgB = #pk_GS2U_Friend2CrossAdd2_Ack{info = playerFriend2Cross:db2net(DataA)},
			playerMsg:sendNetMsg(NetPidB, MsgB);
		_ ->
			skip
	end;

%% 失败
cross_add2Reply({Reason, {RoleID, TarRoleID}}) ->
	%% 这里是跨服公共进程
	%% A：RoleID；B：TarRoleID
	%% A将同意申请者B成为跨服好友，但是因为跨服公共进程或者B所在服公共进程检测没通过，因此失败
	%% Reason是失败原因，对应ErrorCode
	%% 删掉这个申请者
	friend2State:deleteFriend2CrossA(RoleID, TarRoleID),
	%% 同步数据
	sendMsg2Mgr2(friend2Cross_syncR, {?SYNC_R_DeleteApply, {RoleID, TarRoleID}}, RoleID),
	%% 反馈客户端
	sendMsg2Role(friend2Cross_r_add2Ack, {Reason, [TarRoleID]}, RoleID).

%%%-------------------------------------------------------------------
% 删除好友
-spec cross_del({uint64(), uint64()}) -> no_return().
cross_del({RoleID, TarRoleID}) ->
	%% 这里是跨服公共进程
	%% A：RoleID；B：TarRoleID
	%% A将删除跨服好友B
	case check(RoleID, TarRoleID) of
		?FRT_Cross ->
			%% A、B在跨服内存中解除好友关系
			friend2State:deleteFriend2CrossF(RoleID, TarRoleID),
			friend2State:deleteFriend2CrossF(TarRoleID, RoleID),
			%% 同步数据
			sendMsg2Mgr2(friend2Cross_syncR, {?SYNC_R_DeleteFriend, {RoleID, TarRoleID}}, RoleID),
			sendMsg2Mgr2(friend2Cross_syncR, {?SYNC_R_DeleteFriend, {TarRoleID, RoleID}}, TarRoleID),
			%% 可能的网络消息
			case core:queryOnLineRoleByRoleID(RoleID) of
				#rec_OnlinePlayer{netPid = NetPidA} ->
					MsgA = #pk_GS2U_Friend2CrossDel_Ack{id = TarRoleID, isFix = false},
					playerMsg:sendNetMsg(NetPidA, MsgA);
				_ ->
					skip
			end,
			case core:queryOnLineRoleByRoleID(TarRoleID) of
				#rec_OnlinePlayer{netPid = NetPidB} ->
					MsgB = #pk_GS2U_Friend2CrossDel_Ack{id = RoleID, isFix = false},
					playerMsg:sendNetMsg(NetPidB, MsgB);
				_ ->
					skip
			end;
		_T ->
			?DEBUG_OUT("[DebugForCross] ~w:~w.~w ~w", [core:isCross(), RoleID, TarRoleID, _T]),
			skip
	end.

%%%-------------------------------------------------------------------
% 跨服上的长心跳，用于延时同步数据
cross_tick() ->
	case core:isCross() of
		false ->
			skip;
		_ ->
			case friend2State:getSyncDS() of
				?SYNC_DS_Tick ->
					cross_tick(?SYNC_DS_Tick);
				?SYNC_DS_AskRole ->
					?WARN_OUT("cross_tick time out ~w", [?SYNC_DS_AskRole]),	%% 普通服迟迟没有回复
					cross_tick(?SYNC_DS_AskRole);
				DS ->
					?WARN_OUT("cross_tick time out ~w", [DS])	%% 算法超时
			end
	end.

%% 不同状态下触发下一条件
cross_tick(?SYNC_DS_Tick) ->
	friend2State:setSyncDS(?SYNC_DS_AllRoleID),
	friend2State:setAskNormalList([]),
	LAllID = cross_tick_getAllRoleID1(),
	Dict = cross_tick_splitRoleID(LAllID, dict:new()),
	case dict:to_list(Dict) of
		[] ->
			%% 没有可以查询的角色，重置为初始状态
			friend2State:setSyncDS(?SYNC_DS_Tick);
		LAllIDSplit ->
			resetRoleInfoEts(),
			cross_tick_askRoleID(LAllIDSplit)
	end;
cross_tick(?SYNC_DS_AskRole) ->
	friend2State:setSyncDS(?SYNC_DS_MatchInfo),
	friend2State:setAskNormalList([]),
	Dict = cross_tick_matchInfo(),
	case dict:to_list(Dict) of
		[] ->
			%% 没有可以校正的角色，重置为初始状态
			friend2State:setSyncDS(?SYNC_DS_Tick);
		ListFix ->
			cross_tick_fix(ListFix)
	end,
	resetRoleInfoEts().

%% 收集所有不重复的角色ID
cross_tick_getAllRoleID1() ->
	LAll = ets:tab2list(?EtsFriend2Cross),
	LAllID = cross_tick_getAllRoleID2(LAll, []),
	lists:usort(LAllID).
cross_tick_getAllRoleID2([], Acc) ->
	Acc;
cross_tick_getAllRoleID2([#recFriend2Cross{roleID = ID, friends = LF, applys = LA} | T], Acc0) ->
	Acc1 = cross_tick_getAllRoleID3(LF, Acc0),
	Acc2 = cross_tick_getAllRoleID3(LA, Acc1),
	cross_tick_getAllRoleID2(T, [ID | Acc2]).
cross_tick_getAllRoleID3([], Acc) ->
	Acc;
cross_tick_getAllRoleID3([#rec_friend2_cross{tarRoleID = ID} | T], Acc) ->
	cross_tick_getAllRoleID3(T, [ID | Acc]).

%% 根据不同归属服分类角色ID
cross_tick_splitRoleID([], Dict) ->
	Dict;
cross_tick_splitRoleID([H | T], Dict) ->
	case core:queryOnLineRoleByRoleID(H) of
		#rec_OnlinePlayer{} ->
			cross_tick_splitRoleID(T, Dict);	%% 忽略，在线于跨服
		_ ->
			case core:getRealDBIDByUID(H) of
				0 ->
					cross_tick_splitRoleID(T, Dict);	%% 忽略，应该是暂时没连上
				DBID ->
					DictNew = dictAppend(DBID, H, Dict),
					cross_tick_splitRoleID(T, DictNew)
			end
	end.

%% 根据不同归属服分别向普通服查询状态
cross_tick_askRoleID([]) ->
	friend2State:setSyncDS(?SYNC_DS_AskRole),
	ok;
cross_tick_askRoleID([{DBID, LID} | T]) ->
	LSrv = friend2State:getAskNormalList(),
	friend2State:setAskNormalList([DBID | LSrv]),
	gsSendMsg:sendMsg2OneSource(DBID, ?PsNameFriend2, friend2Cross_syncD, {?SYNC_D_C2N_AskRole, LID}),
	cross_tick_askRoleID(T).

%% 遍历所有数据
cross_tick_matchInfo() ->
	ListData = ets:tab2list(?EtsFriend2Cross),
	cross_tick_matchInfo(ListData, dict:new()).

%% 第一层遍历，主要处理#recFriend2Cross.roleID
cross_tick_matchInfo([], Dict) ->
	Dict;
cross_tick_matchInfo([#recFriend2Cross{roleID = RoleID} = H | T], Dict) ->
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{} ->
			cross_tick_matchInfo(T, Dict);	%% 在线于跨服时忽略刷新
		_ ->
			case core:getRealDBIDByUID(RoleID) of
				0 ->
					cross_tick_matchInfo(T, Dict);	%% 找不到归属服时忽略
				DBID ->
					case ets:lookup(?EtsDelete, RoleID) of
						[#delete{}] ->
							DictNew = dictAppend(DBID, RoleID, Dict),
							cross_tick_matchInfo(T, DictNew);	%% 需要整个删除
						_ ->
							cross_tick_matchInfo1(H, Dict)	%% 需要针对更新或删除
					end
			end
	end.

%% 第二层遍历，分别处理#recFriend2Cross.friends和#recFriend2Cross.applys
cross_tick_matchInfo1(#recFriend2Cross{friends = LF, applys = LA}, Dict) ->
	DictTemp = cross_tick_matchInfo2(LF, ?LT_Cross, Dict),
	cross_tick_matchInfo2(LA, ?LT_Apply, DictTemp).
cross_tick_matchInfo2([], _Type, Dict) ->
	Dict;
cross_tick_matchInfo2([#rec_friend2_cross{roleID = RoleID, tarRoleID = TarRoleID} = Data | T], Type, Dict) ->
	case core:getRealDBIDByUID(RoleID) of
		0 ->
			cross_tick_matchInfo2(T, Type, Dict);	%% 找不到归属服时忽略
		DBID ->
			case core:queryOnLineRoleByRoleID(TarRoleID) of
				#rec_OnlinePlayer{} ->
					%% 在线于跨服时，使用跨服上的数据进行刷新，注意tarSrvName和timeRelation这两个字段保持原服状态
					DataNew1 = cross_tick_matchInfo3(Data, playerFriend2Cross:makeData(TarRoleID, RoleID)),
					case DataNew1 of
						Data ->
							cross_tick_matchInfo2(T, Type, Dict);		%% 新旧数据相同，忽略
						_ ->
							DictNew1 = dictAppend(DBID, {Type, DataNew1}, Dict),
							cross_tick_matchInfo2(T, Type, DictNew1)	%% 需要针对刷新
					end;
				_ ->
					%% 不在线则优先查询是否被删除
					case ets:lookup(?EtsDelete, TarRoleID) of
						[#delete{}] ->
							DictNew2 = dictAppend(DBID, {Type, {RoleID, TarRoleID}}, Dict),
							cross_tick_matchInfo2(T, Type, DictNew2);	%% 需要针对删除
						_ ->
							%% 确认角色存在时，需要逆向查询好友关系是否存在，或者验证申请关系是否超时
							case cross_tick_matchInfo4(Type, Data) of
								false ->
									DictNew3 = dictAppend(DBID, {Type, {RoleID, TarRoleID}}, Dict),
									cross_tick_matchInfo2(T, Type, DictNew3);	%% 需要针对删除
								_ ->
									%% 有新数据就刷新，没有就忽略
									case ets:lookup(?EtsRoleInfo, TarRoleID) of
										[#rec_friend2_cross{} = DataNormal] ->
											DataNew4 = cross_tick_matchInfo3(Data, DataNormal#rec_friend2_cross{roleID = RoleID}),
											case DataNew4 of
												Data ->
													cross_tick_matchInfo2(T, Type, Dict);		%% 新旧数据相同，忽略
												_ ->
													DictNew4 = dictAppend(DBID, {Type, DataNew4}, Dict),
													cross_tick_matchInfo2(T, Type, DictNew4)	%% 需要针对刷新
											end;
										_ ->
											cross_tick_matchInfo2(T, Type, Dict)	%% 没有数据则忽略
									end
							end
					end
			end
	end.

%% 刷新数据时需要保留原数据的几个字段
cross_tick_matchInfo3(
	#rec_friend2_cross{
		tarSrvName = TarSrvName,
		timeRelation = TimeRelation,
		timeLastInteractive = TimeLastInteractive
	},
	DataNew
	) ->
	DataNew#rec_friend2_cross{
		tarSrvName = TarSrvName,
		timeRelation = TimeRelation,
		timeLastInteractive = TimeLastInteractive
	}.

%% 确认角色存在时，需要逆向查询好友关系是否存在，或者验证申请关系是否超时
cross_tick_matchInfo4(?LT_Cross, #rec_friend2_cross{roleID = RoleID, tarRoleID = TarRoleID}) ->
	case friend2State:queryFriend2CrossF(TarRoleID, RoleID) of
		{?FRT_Cross, _} ->
			true;	%% 关系存在
		_ ->
			false	%% 关系不存在，以不存在的为准
	end;
cross_tick_matchInfo4(?LT_Apply, #rec_friend2_cross{timeRelation = TimeRelation}) ->
	TimeNow = time:getSyncTimeFromDBS(),
	case TimeNow > TimeRelation + ?ApplicantLife of
		true ->
			false;	%% 申请超时，需要删除
		_ ->
			true	%% 未超时，忽略
	end.


%% 根据不同归属服分别向普通服同步修正条目
%% 同时自己也刷新数据
cross_tick_fix([]) ->
	friend2State:setSyncDS(?SYNC_DS_Tick),
	ok;
cross_tick_fix([H | T]) ->
	cross_tick_fix1(H),
	cross_tick_fix(T).

cross_tick_fix1({DBID, LData}) ->
	gsSendMsg:sendMsg2OneSource(DBID, ?PsNameFriend2, friend2Cross_syncD, {?SYNC_D_C2N_Fix, LData}),
	cross_tick_fix2(LData).

cross_tick_fix2([]) ->
	ok;
cross_tick_fix2([{?LT_Cross, #rec_friend2_cross{} = Data} | T]) ->	%% 刷新好友数据
	friend2State:replaceFriend2CrossF(Data),
	cross_tick_fix2(T);
cross_tick_fix2([{?LT_Apply, #rec_friend2_cross{} = Data} | T]) ->	%% 刷新申请者数据
	friend2State:replaceFriend2CrossA(Data),
	cross_tick_fix2(T);
cross_tick_fix2([{?LT_Cross, {RoleID, TarRoleID}} | T]) ->			%% 针对删除
	friend2State:deleteFriend2CrossF(RoleID, TarRoleID),
	%% 可能的网络消息
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{netPid = NetPid} ->
			Msg = #pk_GS2U_Friend2CrossDel_Ack{id = TarRoleID, isFix = true},
			playerMsg:sendNetMsg(NetPid, Msg);
		_ ->
			skip
	end,
	cross_tick_fix2(T);
cross_tick_fix2([{?LT_Apply, {RoleID, TarRoleID}} | T]) ->			%% 针对删除
	friend2State:deleteFriend2CrossA(RoleID, TarRoleID),
	%% 可能的网络消息
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{netPid = NetPid} ->
			Msg = #pk_GS2U_Friend2CrossAdd2Failed_Ack{
				reason = ?ErrorCode_Friend2CrossAdd2_Fix,
				listDel = [TarRoleID]
			},
			playerMsg:sendNetMsg(NetPid, Msg);
		_ ->
			skip
	end,
	cross_tick_fix2(T);
cross_tick_fix2([RoleID | T]) ->									%% 完全删除
	ets:delete(?EtsFriend2Cross, RoleID),
	cross_tick_fix2(T).

%%% ====================================================================
%%% API Normal functions
%%% ====================================================================


%%% ====================================================================
%%% API Current(Cross or Normal) functions
%%% ====================================================================

%%%-------------------------------------------------------------------
% 实时同步数据
-spec current_syncR(IsCross::boolean(), Data::{type_syncR(), term()}) -> no_return().

%% 更新申请者列表
current_syncR(_IsCross, {?SYNC_R_UpdateApply, {RoleID, Data, LDelID}}) ->
	#recFriend2Cross{applys = L} = Friend2Cross =
		friend2State:queryFriend2Cross(RoleID),
	FunDelete =
		fun(ID, Acc) ->
			lists:keydelete(ID, #rec_friend2_cross.tarRoleID, Acc)
		end,
	LNew = [Data | lists:foldl(FunDelete, L, LDelID)],
	ets:insert(?EtsFriend2Cross, Friend2Cross#recFriend2Cross{applys = LNew});

%% 拒绝指定申请者
current_syncR(_IsCross, {?SYNC_R_DeleteApply, {RoleID, TarRoleID}}) ->
	#recFriend2Cross{applys = L} = Friend2Cross =
		friend2State:queryFriend2Cross(RoleID),
	LNew = lists:keydelete(TarRoleID, #rec_friend2_cross.tarRoleID, L),
	ets:insert(?EtsFriend2Cross, Friend2Cross#recFriend2Cross{applys = LNew});

%% 拒绝所有申请者
current_syncR(_IsCross, {?SYNC_R_DeleteApply, RoleID}) ->
	Friend2Cross = friend2State:queryFriend2Cross(RoleID),
	ets:insert(?EtsFriend2Cross, Friend2Cross#recFriend2Cross{applys = []});

%% 更新好友列表（必然只是跨服处理完后向普通服同步）
current_syncR(false, {?SYNC_R_UpdateFriend, #rec_friend2_cross{roleID = RoleID, tarRoleID = TarRoleID} = Data}) ->
	%% 数据存储
	case friend2State:replaceFriend2CrossF(Data) of
		?DBOPT_UPDATE ->
			gsSendMsg:sendMsg2DBServer(friend2Cross_dbsave, 0, [{?DBOPT_UPDATE, Data}]);
		?DBOPT_INSERT ->
			gsSendMsg:sendMsg2DBServer(friend2Cross_dbsave, 0, [{?DBOPT_INSERT, Data}]);
		_ ->
			skip
	end,
	friend2State:deleteFriend2CrossA(RoleID, TarRoleID),
	%% 可能的网络消息
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{netPid = NetPid} ->
			?DEBUG_OUT("[DebugForCross] pk_GS2U_Friend2CrossAdd2_Ack"),
			Msg = #pk_GS2U_Friend2CrossAdd2_Ack{info = playerFriend2Cross:db2net(Data)},
			playerMsg:sendNetMsg(NetPid, Msg);
		_ ->
			skip
	end;

%% 删除好友（必然只是跨服处理完后向普通服同步）
current_syncR(false, {?SYNC_R_DeleteFriend, {RoleID, TarRoleID} = Data}) ->
	%% 数据存储
	case friend2State:deleteFriend2CrossF(RoleID, TarRoleID) of
		?DBOPT_DELETE ->
			gsSendMsg:sendMsg2DBServer(friend2Cross_dbsave, 0, [{?DBOPT_DELETE, Data}]);
		_ ->
			skip
	end,
	%% 可能的网络消息
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{netPid = NetPid} ->
			Msg = #pk_GS2U_Friend2CrossDel_Ack{id = TarRoleID, isFix = false},
			playerMsg:sendNetMsg(NetPid, Msg);
		_ ->
			skip
	end.

%%%-------------------------------------------------------------------
% 延时同步数据
-spec current_syncD(IsCross::boolean(), Data::{type_syncD(), term()}) -> no_return().

%% 普通服向跨服初始化列表
current_syncD(true, {?SYNC_D_N2C_Init, {DBID, ListData}}) ->
	{_, LDelID} = lists:foldl(fun init1_find/2, {DBID, []}, ListData),
	init1_delete(LDelID),
	init2_insert(ListData);

%% 跨服向普通服请求刷新角色状态
current_syncD(false, {?SYNC_D_C2N_AskRole, ListRoleID}) ->
	{ListFilter, ListDelete} = askRole1_filter(ListRoleID, [], []),
	ListOnline = askRole2_online(ListFilter, []),
	ListData = askRole3_make(ListOnline, []),
	gsSendMsg:sendMsg2Cross(?PsNameFriend2, friend2Cross_syncD, {?SYNC_D_N2C_AckRole, {globalSetup:getDBID(), ListDelete, ListData}});

%% 普通服向跨服反馈角色状态
current_syncD(true, {?SYNC_D_N2C_AckRole, {DBID, ListDelete, ListData}}) ->
	case friend2State:getSyncDS() of
		?SYNC_DS_AskRole ->
			case friend2State:getAskNormalList() of
				[] ->
					skip;	%% 已经收到足够的数据，抛弃额外数据
				LSrv ->
					FunDelete =
						fun(ID, {Mark, Acc}) ->
							case ID of
								DBID ->
									{true, Acc};
								_ ->
									{Mark, [ID | Acc]}
							end
						end,
					case lists:foldl(FunDelete, {false, []}, LSrv) of
						{false, _} ->
							skip;	%% 已经收到该DBID的数据，抛弃额外数据
						{true, []} ->
							friend2State:setAskNormalList([]),
							ets:insert(?EtsRoleInfo, ListData),
							[ets:insert(?EtsDelete, #delete{id = ID}) || ID <- ListDelete],
							cross_tick(?SYNC_DS_AskRole);
						{true, LSrvNew} ->
							friend2State:setAskNormalList(LSrvNew),
							ets:insert(?EtsRoleInfo, ListData),
							[ets:insert(?EtsDelete, #delete{id = ID}) || ID <- ListDelete]
					end
			end;
		_ ->
			skip	%% 超时时抛弃数据
	end;

%% 跨服向普通服同步校正数据
current_syncD(false, {?SYNC_D_C2N_Fix, ListData}) ->
	DBMsg = fix1_member(ListData, []),
	fix2_dbsave(DBMsg, []).

%% 普通服向跨服初始化列表_优先以从普通服DB读取的数据为准，首先需要删除归属服是初始化服的数据
init1_find(#recFriend2Cross{roleID = RoleID}, {DBID, LDelID}) ->
	case core:getRealDBIDByUID(RoleID) of
		DBID ->
			{DBID, [RoleID | LDelID]};
		_ ->
			{DBID, LDelID}
	end.
init1_delete([]) ->
	ok;
init1_delete([H | T]) ->
	ets:delete(?EtsFriend2Cross, H),
	init1_delete(T).

%% 普通服向跨服初始化列表_直接插入，此处不验证数据匹配错误
init2_insert([]) ->
	ok;
init2_insert([H | T]) ->
	ets:insert(?EtsFriend2Cross, H),
	init2_insert(T).

%% 跨服向普通服请求刷新角色状态_首先筛选出已经删掉的角色
askRole1_filter([], Acc1, Acc2) ->
	{Acc1, Acc2};
askRole1_filter([H | T], Acc1, Acc2) ->
	case core:queryRoleKeyInfoByRoleID(H) of
		#?RoleKeyRec{} ->
			askRole1_filter(T, [H | Acc1], Acc2);
		_ ->
			askRole1_filter(T, Acc1, [H | Acc2])
	end.

%% 跨服向普通服请求刷新角色状态_然后忽略不在线的角色
askRole2_online([], Acc) ->
	Acc;
askRole2_online([H | T], Acc) ->
	case core:queryOnLineRoleByRoleID(H) of
		#rec_OnlinePlayer{} ->
			askRole2_online(T, [H | Acc]);
		_ ->
			askRole2_online(T, Acc)
	end.

%% 跨服向普通服请求刷新角色状态_构建新的数据
askRole3_make([], Acc) ->
	Acc;
askRole3_make([H | T], Acc) ->
	Data = playerFriend2Cross:makeData(H),
	askRole3_make(T, [Data | Acc]).

%% 跨服向普通服同步校正数据_刷新内存数据
fix1_member([], Acc) ->
	Acc;
fix1_member([{?LT_Cross, #rec_friend2_cross{} = Data} | T], Acc) ->		%% 刷新好友数据
	DBOP =
		case friend2State:replaceFriend2CrossF(Data) of
			?DBOPT_UPDATE ->
				{?DBOPT_UPDATE, Data};
			?DBOPT_INSERT ->
				?WARN_OUT("fix1_member ?DBOPT_INSERT ~w", [Data]),
				{?DBOPT_INSERT, Data};
			_ ->
				skip
		end,
	fix1_member(T, [DBOP | Acc]);
fix1_member([{?LT_Apply, #rec_friend2_cross{} = Data} | T], Acc) ->		%% 刷新申请者数据
	friend2State:replaceFriend2CrossA(Data),
	fix1_member(T, Acc);
fix1_member([{?LT_Cross, {RoleID, TarRoleID} = Data} | T], Acc) ->		%% 针对删除
	DBOP =
		case friend2State:deleteFriend2CrossF(RoleID, TarRoleID) of
			?DBOPT_DELETE ->
				%% 可能的网络消息
				case core:queryOnLineRoleByRoleID(RoleID) of
					#rec_OnlinePlayer{netPid = NetPid} ->
						Msg = #pk_GS2U_Friend2CrossDel_Ack{id = TarRoleID, isFix = true},
						playerMsg:sendNetMsg(NetPid, Msg);
					_ ->
						skip
				end,
				{?DBOPT_DELETE, Data};
			_ ->
				skip
		end,
	fix1_member(T, [DBOP | Acc]);
fix1_member([{?LT_Apply, {RoleID, TarRoleID}} | T], Acc) ->				%% 针对删除
	friend2State:deleteFriend2CrossA(RoleID, TarRoleID),
	%% 可能的网络消息
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{netPid = NetPid} ->
			Msg = #pk_GS2U_Friend2CrossAdd2Failed_Ack{
				reason = ?ErrorCode_Friend2CrossAdd2_Fix,
				listDel = [TarRoleID]
			},
			playerMsg:sendNetMsg(NetPid, Msg);
		_ ->
			skip
	end,
	fix1_member(T, Acc);
fix1_member([RoleID | T], Acc) ->										%% 完全删除
	#recFriend2Cross{friends = LF} =
		friend2State:queryFriend2Cross(RoleID),
	L = [{?LT_Cross, RoleID, TarRoleID} || #rec_friend2_cross{tarRoleID = TarRoleID} <- LF],
	AccNew = fix1_member(L, Acc),
	ets:delete(?EtsFriend2Cross, RoleID),
	fix1_member(T, AccNew).

%% 跨服向普通服同步校正数据_处理数据库保存
fix2_dbsave([], Acc) ->
	gsSendMsg:sendMsg2DBServer(friend2Cross_dbsave, 0, Acc);
fix2_dbsave([skip | T], Acc) ->
	fix2_dbsave(T, Acc);
fix2_dbsave([H | T], Acc) ->
	fix2_dbsave(T, [H | Acc]).

% 直接转发消息给角色进程
%%%%-------------------------------------------------------------------
%% chat
%-spec current_chat(#pk_GS2U_Friend2FormalChat_Ack{}|[#pk_GS2U_Friend2FormalChatVoice_AckR{}, ...]) -> no_return().
%
%%% text
%current_chat(#pk_GS2U_Friend2FormalChat_Ack{receiverID = ID} = Msg) ->
%	case core:queryOnLineRoleByRoleID(ID) of
%		#rec_OnlinePlayer{netPid = NetPid} ->
%			gsSendMsg:sendNetMsg(NetPid, Msg);
%		_ ->
%			skip
%	end;
%
%%% voice
%current_chat([]) ->
%	ok;
%current_chat([#pk_GS2U_Friend2FormalChatVoice_AckR{receiverID = ID} = Msg | T]) ->
%	case core:queryOnLineRoleByRoleID(ID) of
%		#rec_OnlinePlayer{netPid = NetPid} ->
%			gsSendMsg:sendNetMsg(NetPid, Msg);
%		_ ->
%			skip
%	end,
%	current_chat(T).

%%%-------------------------------------------------------------------
% 收到添加好友的请求
-spec current_addAsk(#rec_friend2_cross{}) -> no_return().
current_addAsk(#rec_friend2_cross{roleID = RoleID, tarRoleID = TarRoleID} = Data) ->
	%% 这里是B在线的公共进程
	%% A：tarRoleID = TarRoleID；B：roleID = RoleID
	%% A将申请成为B的申请者
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{netPid = NetPid} ->
			#recFriend2Cross{applys = L} = Friend2Cross =
				friend2State:queryFriend2Cross(RoleID),
			%% 如果列表中没有该角色则添加，否则刷新
			{LNew, LDelID} =
				case lists:keyfind(TarRoleID, #rec_friend2_cross.tarRoleID, L) of
					false ->
						%% 如果申请者列表大于上限，则按申请时间降序排列，从尾剔除至MAX-1
						#globalsetupCfg{setpara = [MAX]} =
							getCfg:getCfgPStack(cfg_globalsetup, friends_crossapplycount),
						Len = erlang:length(L),
						case Len >= MAX of
							true ->
								LSort = lists:sort(fun sortR_apply/2, L),
								{LTemp, LDel} = lists:split(MAX - 1, LSort),
								{[Data | LTemp], [ID || #rec_friend2_cross{tarRoleID = ID} <- LDel]};
							_ ->
								{[Data | L], []}
						end;
					_ ->
						{lists:keyreplace(TarRoleID, #rec_friend2_cross.tarRoleID, L, Data), []}
				end,
			%% 写入数据，并通知同僚同步数据
			ets:insert(?EtsFriend2Cross, Friend2Cross#recFriend2Cross{applys = LNew}),	%% 不涉及数据库变化，直接写入
			Msg = {?SYNC_R_UpdateApply, {RoleID, Data, LDelID}},
			sendMsg2Mgr4(friend2Cross_syncR, Msg, RoleID),
			%% 通知客户端
			playerMsg:sendNetMsg(NetPid, #pk_GS2U_Friend2CrossAdd_Sync{info = playerFriend2Cross:db2net(Data), listDel = LDelID});
		_T ->
			?DEBUG_OUT("[DebugForCross] ~w:~w.~w ~w", [core:isCross(), RoleID, TarRoleID, _T]),
			skip	%% 不在线则无法操作
	end.

%% 申请者列表逆排序
-spec sortR_apply(#rec_friend2_cross{}, #rec_friend2_cross{}) -> boolean().
sortR_apply(#rec_friend2_cross{timeRelation = TA}, #rec_friend2_cross{timeRelation = TB}) ->
	TA > TB.

%%%-------------------------------------------------------------------
% 收到同意添加好友的请求
-spec current_add2Ask(#rec_friend2_cross{}) -> no_return().
current_add2Ask(#rec_friend2_cross{roleID = TarRoleID, tarRoleID = RoleID} = Data) ->
	%% 这里是B在线的公共进程
	%% A：tarRoleID = RoleID；B：roleID = TarRoleID
	%% A将同意申请者B成为跨服好友
	%% 这里需要验证B的状态
	?DEBUG_OUT("[DebugForCross] ~w:~w.~w", [core:isCross(), RoleID, TarRoleID]),
	#recFriend2Cross{friends = L} =
		friend2State:queryFriend2Cross(TarRoleID),
	case lists:keyfind(RoleID, #rec_friend2_cross.tarRoleID, L) of
		false ->
			#globalsetupCfg{setpara = [MAX]} =
				getCfg:getCfgPStack(cfg_globalsetup, friends_crosscount),
			Len = erlang:length(L),
			case Len >= MAX of
				true ->
					sendMsg2Mgr1(friend2Cross_add2Reply, {?ErrorCode_Friend2CrossAdd2_Max1, {RoleID, TarRoleID}});
				_ ->
					sendMsg2Mgr1(friend2Cross_add2Reply, {Data, playerFriend2Cross:makeData(TarRoleID, RoleID)})	%% 生成B关于A的数据
			end;
		_ ->
			sendMsg2Mgr1(friend2Cross_add2Reply, {?ErrorCode_Friend2CrossAdd_AlreadyIs, {RoleID, TarRoleID}})
	end.

%%% ====================================================================
%%% API Normal functions
%%% ====================================================================

%%%-------------------------------------------------------------------
% 第一次收到广播时向跨服同步跨服好友数据
-spec normal_syncInit() -> no_return().
normal_syncInit() ->
	case friend2State:isInitCross() of
		false ->
			friend2State:setInitCross(),
			ListData = ets:tab2list(?EtsFriend2Cross),
			DBID = globalSetup:getDBID(),
			gsSendMsg:sendMsg2Cross(?PsNameFriend2, friend2Cross_syncD, {?SYNC_D_N2C_Init, {DBID, ListData}});
		_ ->
			skip
	end.

%%% ====================================================================
%%% API Transit functions
%%% ====================================================================

%%%-------------------------------------------------------------------
% 公共进程转发消息给角色进程
% 此时公共进程可能在跨服、可能在普通服
-spec transit({MsgID::term(), RoleID::uint64(), Msg::term()}) -> no_return().
transit({MsgID, RoleID, Msg}) ->
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{pid = Pid} ->
			psMgr:sendMsg2PS(Pid, MsgID, Msg);
		_ ->
			skip	%% 不在线，忽略
	end,
	ok.

%%%-------------------------------------------------------------------
% 重置角色信息ETS
-spec resetRoleInfoEts() -> no_return().
resetRoleInfoEts() ->
	case ets:info(?EtsRoleInfo, size) of
		0 ->
			skip;
		undefined ->
			ets:new(?EtsRoleInfo, [private, named_table, set, {keypos, #rec_friend2_cross.tarRoleID}, {write_concurrency, false}, {read_concurrency, false}]);
		_ ->
			ets:delete_all_objects(?EtsRoleInfo)
	end,
	resetRoleInfoEts(ets:tab2list(ets_rec_OnlinePlayer)),
	case ets:info(?EtsDelete, size) of
		0 ->
			skip;
		undefined ->
			ets:new(?EtsDelete, [private, named_table, set, {keypos, #delete.id}, {write_concurrency, false}, {read_concurrency, false}]);
		_ ->
			ets:delete_all_objects(?EtsDelete)
	end.
resetRoleInfoEts([]) ->
	ok;
resetRoleInfoEts([#rec_OnlinePlayer{roleID = ID} | T]) ->
	ets:insert(?EtsRoleInfo, playerFriend2Cross:makeData(ID)),
	resetRoleInfoEts(T).

%%%-------------------------------------------------------------------
% 字典值为列表时的添加
-spec dictAppend(K::term(), E::term(), D::dict:dict()) -> DNew::dict:dict().
dictAppend(K, E, D) ->
	case dict:find(K, D) of
		{ok, L} ->
			dict:store(K, [E | L], D);
		_ ->
			dict:store(K, [E], D)
	end.
