%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170809
%%%-------------------------------------------------------------------

-module(playerFriend2Cross).
-include("playerPrivate.hrl").
-include("../friend2/friend2Private.hrl").

%% api
-export([
	init/0,			%% 上线初始化
	makeData/1,		%% 创建指定目标的跨服数据
	makeData/2,		%% 创建指定目标的跨服数据
	db2net/1		%% DB数据结构转换为网络数据结构
]).

%% cmd
-export([
	queryAll/1,		%% 查询全列表
	add/1,			%% 请求添加跨服好友
	add2/2,			%% 同意或拒绝申请者
	del/1			%% 请求删除跨服好友
]).

%% callback
-export([
	onAddAck/1,		%% 申请成功提示
	onAdd2Ack/1		%% 拒绝申请者成功，或者添加失败
]).

%%% ====================================================================
%%% API functions
%%% ====================================================================

%%%-------------------------------------------------------------------
% 上线初始化
-spec init() -> no_return().
init() ->
	RoleID = playerState:getRoleID(),
	#recFriend2Cross{friends = LF, applys = LA} =
		friend2State:queryFriend2Cross(RoleID),
	Msg =
		#pk_GS2U_Friend2CrossInit_Sync{
			listCross = db2net(LF),
			listApply = db2net(LA)
		},
	playerMsg:sendNetMsg(Msg).

%%%-------------------------------------------------------------------
% 发起跨服好友申请时，创建发起者的信息（此时发起者必然在线）
% 同意跨服好友申请时，刷新双方信息（此时双方必须在线）
-spec makeData(TarRoleID::uint64()) -> #rec_friend2_cross{}|{}.
makeData(TarRoleID) ->
	makeData(TarRoleID, 0).
-spec makeData(TarRoleID::uint64(), RoleID::uint64()) -> #rec_friend2_cross{}|{}.
makeData(TarRoleID, RoleID) ->
	case core:queryRoleKeyInfoByRoleID(TarRoleID) of
		#?RoleKeyRec{
			roleName = TarRoleName,
			head = TarHead,
			career = TarCareer,
			race = TarRace,
			sex = TarSex,
			level = TarLevel,
			face = TarFace
		} ->
			WhereIs =
				case core:queryOnLineRoleByRoleID(TarRoleID) of
					#rec_OnlinePlayer{} ->
						case core:isCross() of
							true ->
								?WhereIs_Cross;
							_ ->
								?WhereIs_Normal
						end;
					_ ->
						?WhereIs_Offline
				end,
			#rec_friend2_cross{
				roleID = RoleID,
				tarRoleID = TarRoleID,
				tarRoleName = TarRoleName,
				tarSrvName = core:queryServerNameByUID(TarRoleID),
				tarHead = TarHead,
				tarFace = TarFace,
				tarCareer = TarCareer,
				tarRace = TarRace,
				tarSex = TarSex,
				tarLevel = TarLevel,
				timeRelation = time:getSyncTimeFromDBS(),
				timeLastOnline = time:getSyncTimeFromDBS(),
				timeLastInteractive = 0,
				whereis = WhereIs
			};
		_ ->
			?ERROR_OUT("can not find RoleID:~w~n~p", [TarRoleID, misc:getStackTrace()]),
			{}
	end.

%%%-------------------------------------------------------------------
% rec_friend2_cross to #pk_Friend2InfoCross{}
-spec db2net(#rec_friend2_cross{}|[#rec_friend2_cross{}, ...]) ->
	#pk_Friend2InfoCross{} | [#pk_Friend2InfoCross{}, ...].
db2net(#rec_friend2_cross{
	tarRoleID = TarRoleID,
	tarRoleName = TarRoleName,
	tarSrvName = TarSrvName,
	tarHead = TarHead,
	tarFace = TarFace,
	tarCareer = TarCareer,
	tarRace = TarRace,
	tarSex = TarSex,
	tarLevel = TarLevel,
	timeRelation = TimeRelation,
	timeLastOnline = TimeLastOnline,
	timeLastInteractive = TimeLastInteractive,
	whereis = WhereIs
}) ->
	#pk_Friend2InfoCross{
		id = TarRoleID,
		name = TarRoleName,
		server = TarSrvName,
		level = TarLevel,
		career = TarCareer,
		race = TarRace,
		sex = TarSex,
		head = TarHead,
		face = TarFace,
		timeRelation = TimeRelation,
		timeLastOnline = TimeLastOnline,
		timeLastInteractive = TimeLastInteractive,
		whereis = WhereIs
	};
db2net(Data) ->
	db2net(Data, []).
db2net([], Acc) ->
	Acc;
db2net([H | T], Acc) ->
	R = db2net(H),
	db2net(T, [R | Acc]).

%%% ====================================================================
%%% CMD functions
%%% ====================================================================

%%%-------------------------------------------------------------------
% 查询全列表
-spec queryAll(Type::uint()) -> no_return().
queryAll(?LT_Cross) ->
	RoleID = playerState:getRoleID(),
	#recFriend2Cross{friends = L} =
		friend2State:queryFriend2Cross(RoleID),
	Msg =
		#pk_GS2U_Friend2CrossAll_Sync{
			type = ?LT_Cross,
			listAll = db2net(L)
		},
	playerMsg:sendNetMsg(Msg);
queryAll(?LT_Apply) ->
	RoleID = playerState:getRoleID(),
	#recFriend2Cross{applys = L} =
		friend2State:queryFriend2Cross(RoleID),
	Msg =
		#pk_GS2U_Friend2CrossAll_Sync{
			type = ?LT_Apply,
			listAll = db2net(L)
		},
	playerMsg:sendNetMsg(Msg).

%%%-------------------------------------------------------------------
% 请求添加跨服好友
-spec add(TarRoleID::uint64()) -> no_return().
add(TarRoleID) ->
	%% 这里是A的角色进程
	%% A：RoleID；B：TarRoleID
	%% A将申请成为B的申请者
	RoleID = playerState:getRoleID(),
	case friend2Cross:check(RoleID, TarRoleID) of
		?FRT_NoneC ->
			case add_isCD(TarRoleID) of
				true ->
					add_setTime(TarRoleID),
					friend2Cross:sendMsg2Mgr1(friend2Cross_1_add, makeData(RoleID, TarRoleID));
				_ ->
					?ERROR_CODE(?ErrorCode_Friend2CrossAdd_Wait)
			end;
		?FRT_CApply ->
			friend2Cross:sendMsg2Mgr1(friend2Cross_1_add, makeData(RoleID, TarRoleID));
		?FRT_Cross ->
			?ERROR_CODE(?ErrorCode_Friend2CrossAdd_AlreadyIs);
		_T ->
			?DEBUG_OUT("[DebugForCross] ~w:~w.~w ~w", [core:isCross(), RoleID, TarRoleID, _T]),
			skip
	end.

add_isCD(TarRoleID) ->
	case get({friend2Cross, TarRoleID}) of
		undefined ->
			true;
		TimeLast ->
			TimeNow = time:getSyncTimeFromDBS(),
			#globalsetupCfg{setpara = [CD]} =
				getCfg:getCfgPStack(cfg_globalsetup, friends_crossapplycd),
			TimeNow > TimeLast + CD
	end.
add_setTime(TarRoleID) ->
	put({friend2Cross, TarRoleID}, time:getSyncTimeFromDBS()).


%%%-------------------------------------------------------------------
% 同意或拒绝申请者
-spec add2(TarRoleID::uint64(), IsAgreed::boolean()) -> no_return().
% 一键同意
add2(0, true) ->
	RoleID = playerState:getRoleID(),
	case friend2State:queryFriend2Cross(RoleID) of
		#recFriend2Cross{applys = []} ->
			skip;	%% 没有申请者，忽略
		#recFriend2Cross{applys = L} ->
			[add2(TarRoleID, true) || #rec_friend2_cross{tarRoleID = TarRoleID} <- L]
	end;
% 一键拒绝
add2(0, false) ->
	RoleID = playerState:getRoleID(),
	case friend2State:queryFriend2Cross(RoleID) of
		#recFriend2Cross{applys = []} ->
			skip;	%% 没有申请者，忽略
		#recFriend2Cross{} ->
			friend2Cross:sendMsg2Mgr1(friend2Cross_1_add2, {RoleID, 0})
	end;
add2(TarRoleID, true) ->
	%% 这里是A的角色进程
	%% A：RoleID；B：TarRoleID
	%% A将同意申请者B成为跨服好友
	RoleID = playerState:getRoleID(),
	case friend2Cross:check(RoleID, TarRoleID) of
		?FRT_CApply ->
			friend2Cross:sendMsg2Mgr1(friend2Cross_1_add2, makeData(RoleID, TarRoleID));
		_T ->
			?DEBUG_OUT("[DebugForCross] ~w:~w.~w ~w", [core:isCross(), RoleID, TarRoleID, _T]),
			skip	%% 对方不是申请者，无法执行同意
	end;
add2(TarRoleID, false) ->
	%% 这里是A的角色进程
	%% A：RoleID；B：TarRoleID
	%% A将拒绝申请者B成为跨服好友
	RoleID = playerState:getRoleID(),
	case friend2Cross:check(RoleID, TarRoleID) of
		?FRT_CApply ->
			friend2Cross:sendMsg2Mgr1(friend2Cross_1_add2, {RoleID, TarRoleID});
		_T ->
			?DEBUG_OUT("[DebugForCross] ~w:~w.~w ~w", [core:isCross(), RoleID, TarRoleID, _T]),
			skip	%% 对方不是申请者，无法执行拒绝
	end.

%%%-------------------------------------------------------------------
% 请求删除跨服好友
-spec del(TarRoleID::uint64()) -> no_return().
del(TarRoleID) ->
	%% 这里是A的角色进程
	%% A：RoleID；B：TarRoleID
	%% A将删除跨服好友B
	RoleID = playerState:getRoleID(),
	case friend2Cross:check(RoleID, TarRoleID) of
		?FRT_Cross ->
			friend2Cross:sendMsg2Mgr1(friend2Cross_1_del, {RoleID, TarRoleID});
		_T ->
			?DEBUG_OUT("[DebugForCross] ~w:~w.~w ~w", [core:isCross(), RoleID, TarRoleID, _T]),
			skip	%% 对方不是好友，无法执行删除
	end.

%%% ====================================================================
%%% Callback functions
%%% ====================================================================

%%%-------------------------------------------------------------------
% 申请成功提示
-spec onAddAck(TarRoleID::uint64()) -> no_return().
onAddAck(_TarRoleID) ->
	?ERROR_CODE(?ErrorCode_Friend2CrossAdd_Success).

%%%-------------------------------------------------------------------
% 拒绝申请者成功，或者添加失败
-spec onAdd2Ack({Reason::uint32(), LDelID::[uint64(), ...]}) -> no_return().
onAdd2Ack({Reason, LDelID}) ->
	playerMsg:sendNetMsg(#pk_GS2U_Friend2CrossAdd2Failed_Ack{reason = Reason, listDel = LDelID}).


%%% ====================================================================
%%% Internal functions
%%% ====================================================================

