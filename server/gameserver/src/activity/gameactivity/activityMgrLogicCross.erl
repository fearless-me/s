%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, raink
%%% @doc
%%% 活动管理_跨服相关逻辑处理
%%% @end
%%% Created : 20170905
%%%-------------------------------------------------------------------
-module(activityMgrLogicCross).
-author("meitianyang").

-include("../activityPrivate.hrl").

% api
-export([
	crossBroadcastAllServerRole/2,	%% 广播所有服所有角色
	crossAckMsg2NormalRole/3,		%% 从跨服向普通服角色发消息

	query/1,	% 查询报名情况
	apply/1,	% 活动报名
	cancel/1,	% 取消报名
	applyEnd/1,	% 报名截止（报名时间根据活动进度来判断，这里是响应活动结束报名后，拷贝走了报名数据，这里需要清除
	mail/1,		% 邮件发奖
	match/2		% 匹配（目前只支持【同时开展】类型的活动）
]).

% gm
-export([
	gm/1
]).

% ets
-export([
	queryApply/1	% 查询是否已经报名
]).

%%%-------------------------------------------------------------------
% api:广播所有服所有角色
-spec crossBroadcastAllServerRole(MsgID::term(), Msg::term()) -> no_return().
crossBroadcastAllServerRole(MsgID, Msg) ->
	gsSendMsg:sendMsg2AllSource(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {MsgID, Msg}).

%%%-------------------------------------------------------------------
% api:反馈普通服的请求
-spec crossAckMsg2NormalRole(ListRole, MsgID::term(), Msg::term()) -> no_return() when
	ListRole :: [uint64(), ...] | [#recCrossApply{}, ...].
crossAckMsg2NormalRole(ListRole, MsgID, Msg) ->
	crossAckMsg2NormalRole(ListRole, MsgID, Msg, []).
crossAckMsg2NormalRole([], MsgID, Msg, Acc) ->
	[
		gsSendMsg:sendMsg2OneSource(DBID, ?PsNamePlayerMgr, transit, {MsgID, ListRoleID, Msg}) ||
		{DBID, ListRoleID} <- Acc
	];
crossAckMsg2NormalRole([#pk_CrossRoleBase{id = RoleID} | T], MsgID, Msg, Acc) ->
	DBID = core:getRealDBIDByUID(RoleID),
	case lists:keyfind(DBID, 1, Acc) of
		false ->
			crossAckMsg2NormalRole(T, MsgID, Msg, [{DBID, [RoleID]} | Acc]);
		{_, ListRoleID} ->
			AccNew = lists:keyreplace(DBID, 1, Acc, {DBID, [RoleID | ListRoleID]}),
			crossAckMsg2NormalRole(T, MsgID, Msg, AccNew)
	end;
crossAckMsg2NormalRole([RoleID | T], MsgID, Msg, Acc) ->
	DBID = core:getRealDBIDByUID(RoleID),
	case lists:keyfind(DBID, 1, Acc) of
		false ->
			crossAckMsg2NormalRole(T, MsgID, Msg, [{DBID, [RoleID]} | Acc]);
		{_, ListRoleID} ->
			AccNew = lists:keyreplace(DBID, 1, Acc, {DBID, [RoleID | ListRoleID]}),
			crossAckMsg2NormalRole(T, MsgID, Msg, AccNew)
	end.

%%%-------------------------------------------------------------------
% api:查询报名情况
-spec query(RoleID::uint64()) -> no_return().
query(RoleID) ->
	Msg =
		case queryApply([RoleID]) of
			[] ->
				0;	%% 没有报名
			[{_, #recCrossApply{} = Apply}] ->
				Apply	%% 有报名
		end,
	crossAckMsg2NormalRole([RoleID], cac_queryAck, Msg).

%%%-------------------------------------------------------------------
% api:活动报名
-spec apply(#recCrossApply{}) -> no_return().
apply(#recCrossApply{activityType = ActivityType, applicant = ApplicantRoleID, members = Members} = Data)
	when ActivityType =:= ?ActivityType_CrossRace ->
	?DEBUG_OUT("[DebugForRace] apply"),
	%% 1.检查活动是否在报名阶段
	case crossCheckPhaseForApply(ActivityType) of
		false ->
			?DEBUG_OUT("[DebugForRace] apply"),
			crossAckMsg2NormalRole([ApplicantRoleID], cac_applyAck, {?ErrorCode_Race_Apply_NotTime, Data});	%% 失败，不在报名时间
		_ ->
			%% 2.检查报名角色数量是否已满
			case apply_checkMax(ActivityType, Data) of
				false ->
					?DEBUG_OUT("[DebugForRace] apply"),
					crossAckMsg2NormalRole([ApplicantRoleID], cac_applyAck, {?ErrorCode_Race_Apply_Max, Data});	%% 失败，名额已满
				_ ->
					%% 3.已经报名的角色需要取消报名
					case queryApply(Members) of
						[] ->
							%% 无人报名，不需要取消报名
							skip;
						ListApply ->
							%% 有人已经报名，需要取消报名（理论上不应该出现这种情况
							?ERROR_OUT("Invalid ListApply:~w", [ListApply]),
							[cancel({ApplyID, RoleID}) || {RoleID, #recCrossApply{id = ApplyID}} <- ListApply]
					end,
					%% 4. 执行新的报名
					UID = uidMgr:makeCrossApplyUID(),
					Apply = Data#recCrossApply{id = UID},
					insertApply(Apply),
					?DEBUG_OUT("[DebugForRace] apply"),
					crossAckMsg2NormalRole(Members, cac_applyAck, {0, Apply})	%% 成功，反馈所有人
			end
	end,
	ok.

-spec apply_checkMax(ActivityType::activityType(), #recCrossApply{}) -> boolean().
apply_checkMax(ActivityType, #recCrossApply{members = Members}) ->
	case getCfg:getCfgByKey(cfg_activity, ActivityType) of
		#activityCfg{limitApply = LimitApply} when
			erlang:is_integer(LimitApply), LimitApply > 0 ->
			CountAcc = erlang:length(Members),
			queryApplyRoleCount(ActivityType) + CountAcc =< LimitApply;
		_ ->
			false
	end.

%%%-------------------------------------------------------------------
% api:取消报名
-spec cancel({ActivityType::activityType(), {ApplyID::uint64(), RoleID::uint64()}}) -> no_return().
cancel({_ActivityType, {ApplyID, RoleID}}) ->
	?DEBUG_OUT("[DebugForRace] cancel"),
	case ets:lookup(?EtsCrossApply, ApplyID) of
		[#recCrossApply{members = Members} = Apply] ->
			deleteApplyByApplyID(ApplyID),
			?DEBUG_OUT("[DebugForRace] cancel"),
			crossAckMsg2NormalRole(Members, cac_cancelAck, Apply#recCrossApply{applicant = RoleID});	%% 告诉大家这个人取消了报名
		_ ->
			%% 没有找到ApplyID，可能是角色进程的数据丢失
			?DEBUG_OUT("[DebugForRace] cancel ApplyID:~w", [ApplyID]),
			case queryApply([RoleID]) of
				[] ->
					skip;
				[{_, #recCrossApply{id = ApplyID_}}] ->
					cancel({ApplyID_, RoleID})
			end
	end.

%%%-------------------------------------------------------------------
% api:报名截止（报名时间根据活动进度来判断，这里是响应活动结束报名后，拷贝走了报名数据，这里需要清除
-spec applyEnd(ActivityType::activityType()) -> no_return().
applyEnd(ActivityType) ->
	Match = ets:fun2ms(fun(#recCrossApply{activityType = ActivityType_} = R) when ActivityType =:= ActivityType_ -> R end),
	ets:select_delete(?EtsCrossApply, Match).

%%%-------------------------------------------------------------------
% api:邮件发奖
-spec mail({ActivityType::activityType(), Data::term()}) -> no_return().
mail({?ActivityType_CrossRace, Data}) ->
	cacRaceLogic:mail(Data).

%%%-------------------------------------------------------------------
% gm:gm指令
-spec gm(Data::term()) -> no_return().
gm(race2) ->
	activity:setActivitySwitch(?ActivityType_CrossRace, true),	%% 首先在本服将开关打开
	playerGM:startac( ["16", "1"]),								%% 在本服开启报名阶段
	ok.

%%%-------------------------------------------------------------------
% api:匹配（目前只支持【同时开展】类型的活动）
-spec match(ListApply::[#recCrossApply{}, ...], ActivityType::activityType()) ->
	{ListMatch::[[#recCrossApply{}, ...], ...], ListSpecial::[#recCrossApply{}, ...]}.
match([], _ActivityType) ->
	{[], []};
match(ListApply, ActivityType) ->
	case match_cfg(ActivityType) of
		{0, _, _, _} ->
			{[], []};	%% 配置错误，无法开赛
		Cfg ->
			ListApplySplit = match_split(ListApply, []),
			match_match(ListApplySplit, Cfg, {[], 0}, [])
	end.

%% 获取配置参数
%% X值表示标准单场最小多少报名组可以开赛
%% Y值表示标准单场最多多少报名组可以开赛
%% Z值表示匹配剩余报名组不足以开赛时，是否允许加塞到已经匹配好的组合，此时单场最多可能有X+Y-1个报名组
%% L值表示匹配剩余报名组不足以开赛时，且不允许加塞或没有匹配好的组合，此时允许在小于X的情况下开赛，优先级低于Z
-spec match_cfg(ActivityType::activityType()) -> {X::uint(), Y::uint(), Z::bool01(), L::bool01()}.
match_cfg(ActivityType) ->
	case getCfg:getCfgPStack(cfg_activity, ActivityType) of
		#activityCfg{limitGroup = [X, Y, Z, L]} when
		erlang:is_integer(X), X >= 2,
		erlang:is_integer(Y), Y >= X,
		erlang:is_integer(Z), Z >= 0,
		erlang:is_integer(L), L >= 0 ->
			{X, Y, misc:convertBool2Int(Z > 0), misc:convertBool2Int(L > 0)};
		#activityCfg{limitGroup = LimitGroup} ->
			?ERROR_OUT("invalid cfg_activity.id=~w LimitGroup:~w", [ActivityType, LimitGroup]),
			{0, 0, 0, 0};
		_ ->
			{0, 0, 0, 0}
	end.

%% 根据队长ID分为不同归属服来源，便于优先匹配来源不同的角色
-spec match_split(ListApply, Acc) -> ListApplySplit when
	ListApply :: [#recCrossApply{}, ...],
	Acc :: [{uint(), [#recCrossApply{}, ...]}, ...],
	ListApplySplit :: [{uint(), [#recCrossApply{}, ...]}, ...].
match_split([], Acc) ->
	Acc;
match_split([#recCrossApply{leader = ID} = H | T], Acc) ->
	DBID = core:getRealDBIDByUID(ID),
	AccNew =
		case lists:keyfind(DBID, 1, Acc) of
			false ->
				[{DBID, [H]} | Acc];
			{_, L} ->
				lists:keyreplace(DBID, 1, Acc, {DBID, [H | L]})
		end,
	match_split(T, AccNew).

%% 执行匹配
-spec match_match(ListApplySplit, Cfg, AccTemp, AccResult) -> {ListMatch, ListSpecial} when
	ListApplySplit :: [{uint(), [#recCrossApply{}, ...]}, ...],	%% 根据来源服不同分组好的报名组列表
	Cfg :: {uint(), uint(), bool01(), bool01()},				%% 匹配相关配置参数，详见match_cfg/1
	AccTemp :: {ListTemp, CountTemp},							%% 计算中间变量
	ListTemp :: [#recCrossApply{}, ...],						%% 临时存储报名组
	CountTemp :: uint(),										%% 临时存储的报名组数量
	AccResult :: [[#recCrossApply{}, ...], ...],				%% 匹配好的报名组
	ListMatch :: [[#recCrossApply{}, ...], ...],				%% 返回匹配好的报名组
	ListSpecial :: [#recCrossApply{}, ...].						%% 返回需要特殊处理的报名组
match_match([], _Cfg, {[], _}, AccResult) ->
	{AccResult, []};				%% 没有数据
match_match([], {_X, Y, _Z, _L}, {ListTemp, Y}, AccResult) ->
	{[ListTemp | AccResult], []};	%% 刚好匹配完
match_match([], {X, _Y, _Z, _L}, {ListTemp, CountTemp}, AccResult) when CountTemp >= X ->
	{[ListTemp | AccResult], []};	%% 刚好匹配完
match_match([], {_X, _Y, 1, _L}, AccTemp, AccResult) when AccResult =/= [] ->
	{match_match_Z(AccTemp, AccResult), []};	%% 需要加塞
match_match([], {_X, _Y, _Z, 1}, {ListTemp, _CountTemp}, AccResult) ->
	{[ListTemp | AccResult], []};	%% 允许开赛
match_match([], _Cfg, {ListTemp, _CountTemp}, AccResult) ->
	{AccResult, ListTemp};			%% 需要特殊处理
match_match(ListApplySplit, {_X, Y, _Z, _L} = Cfg, {ListTemp, Y}, AccResult) ->
	match_match(ListApplySplit, Cfg, {[], 0}, [ListTemp | AccResult]);	%% 成功匹配一场，继续
match_match(ListApplySplit, Cfg, {ListTemp, CountTemp}, AccResult) ->
	{#recCrossApply{} = R, ListApplySplitNew} = match_match_getOne(ListApplySplit),
	match_match(ListApplySplitNew, Cfg, {[R | ListTemp], CountTemp + 1}, AccResult).	%% 无脑添加一波数据

%% 取不同来源的报名组
-spec match_match_getOne(ListApplySplitIn) -> {Ret, ListApplySplitOut} when
	ListApplySplitIn :: [{uint(), [#recCrossApply{}, ...]}, ...],
	Ret :: #recCrossApply{} | 0,
	ListApplySplitOut :: [{uint(), [#recCrossApply{}, ...]}, ...].
match_match_getOne([]) ->
	{0, []};	%% 没有了
match_match_getOne([{DBID, L} | T]) ->
	case L of
		[Ret] ->
			{Ret, T};
		[Ret | TL] ->
			{Ret, T ++ [{DBID, TL}]}
	end.

%% 加塞
-spec match_match_Z(AccTemp, AccResult) -> AccResultNew when
	AccTemp :: {ListTemp, CountTemp},
	ListTemp :: [#recCrossApply{}, ...],
	CountTemp :: uint(),
	AccResult :: [[#recCrossApply{}, ...], ...],
	AccResultNew :: [[#recCrossApply{}, ...], ...].
match_match_Z({_ListTemp, CountTemp} = AccTemp, AccResult) ->
	Number = misc:ceil(erlang:float(CountTemp)/erlang:length(AccResult)),	%% 计划均摊加塞组数
	match_match_Z_(AccTemp, AccResult, Number).
match_match_Z_({[], _CountTemp}, AccResult, _Number) ->
	AccResult;
match_match_Z_({ListTemp, CountTemp}, [H | T], Number) when CountTemp >= Number ->
	{LA, LB} = lists:split(Number, ListTemp),
	AccResultNew = T ++ [LA ++ H],
	match_match_Z_({LB, CountTemp - Number}, AccResultNew, Number);
match_match_Z_({ListTemp, CountTemp}, [H | T], Number) ->
	AccResultNew = T ++ [ListTemp ++ H],
	match_match_Z_({[], CountTemp - Number}, AccResultNew, Number).

%%%-------------------------------------------------------------------
% ets:查询报名角色数量
-spec queryApplyRoleCount(ActivityType::activityType()) -> Count::uint().
queryApplyRoleCount(ActivityType) ->
	ets:foldl(
		fun
			(#recCrossApply{activityType = ActivityType_, members = Members}, Acc) when
				ActivityType =:= ActivityType_ ->
				erlang:length(Members) + Acc;
			(_, Acc) ->
				Acc
		end,
		0,
		?EtsCrossApply
	).

%%%-------------------------------------------------------------------
% ets:查询是否已经报名
-spec queryApply(ListRoleID::[uint64(), ...]|[#pk_CrossRoleBase{}, ...]) -> Result::[{uint64(), #recCrossApply{}}, ...].
queryApply(ListRoleID) ->
	queryApply(ListRoleID, []).
queryApply([], Acc) ->
	Acc;
queryApply([#pk_CrossRoleBase{id = RoleID} | T], Acc) ->
	case ets:lookup(?EtsCrossApplyHelper, RoleID) of
		[#recCrossApplyHelper{id = ID}] ->
			case ets:lookup(?EtsCrossApply, ID) of
				[#recCrossApply{} = Rec] ->
					queryApply(T, [{RoleID, Rec} | Acc]);
				_ ->
					ets:delete(?EtsCrossApplyHelper, RoleID),	%% fix
					queryApply(T, Acc)
			end;
		_ ->
			queryApply(T, Acc)
	end;
queryApply([H | T], Acc) ->
	case ets:lookup(?EtsCrossApplyHelper, H) of
		[#recCrossApplyHelper{id = ID}] ->
			case ets:lookup(?EtsCrossApply, ID) of
				[#recCrossApply{} = Rec] ->
					queryApply(T, [{H, Rec} | Acc]);
				_ ->
					ets:delete(?EtsCrossApplyHelper, H),	%% fix
					queryApply(T, Acc)
			end;
		_ ->
			queryApply(T, Acc)
	end.

%%%-------------------------------------------------------------------
% ets:插入报名
-spec insertApply(#recCrossApply{}) -> no_return().
insertApply(#recCrossApply{id = ID, members = Members} = Rec) ->
	[ets:insert(?EtsCrossApplyHelper, #recCrossApplyHelper{roleID = RoleID, id = ID}) || #pk_CrossRoleBase{id = RoleID} <- Members],
	ets:insert(?EtsCrossApply, Rec).

%%%-------------------------------------------------------------------
% ets:取消报名

% 暂时用不着
%-spec deleteApply(RoleOrApplyID::uint64()) -> ListRoleID::[uint64(), ...].
%deleteApply(RoleOrApplyID) ->
%	case uidMgr:getUIDType(RoleOrApplyID) of
%		?UID_TYPE_CrossApply ->
%			deleteApplyByApplyID(RoleOrApplyID);
%		?UID_TYPE_Role ->
%			deleteApplyByRoleID(RoleOrApplyID);
%		_ ->
%			?ERROR_OUT("invalid ID:~w~n~p", [RoleOrApplyID, misc:getStackTrace()]),
%			[]
%	end.

-spec deleteApplyByApplyID(ApplyID::uint64()) -> ListRoleID::[uint64(), ...].
deleteApplyByApplyID(ApplyID) ->
	case ets:lookup(?EtsCrossApply, ApplyID) of
		[] ->
			[];
		[#recCrossApply{members = Members}] ->
			ets:delete(?EtsCrossApply, ApplyID),
			[ets:delete(?EtsCrossApplyHelper, RoleID) || #pk_CrossRoleBase{id = RoleID} <- Members],
			Members
	end.

% 暂时用不着
%-spec deleteApplyByRoleID(RoleID::uint64()) -> ListRoleID::[uint64(), ...].
%deleteApplyByRoleID(RoleID) ->
%	case ets:lookup(?EtsCrossApplyHelper, RoleID) of
%		[] ->
%			[];
%		[#recCrossApplyHelper{id = ApplyID}] ->
%			deleteApplyByApplyID(ApplyID)
%	end.

%%%-------------------------------------------------------------------
% internal,cross:检查活动是否处于报名阶段（第一阶段）
-spec crossCheckPhaseForApply(ActivityType::activityType()) -> boolean().
crossCheckPhaseForApply(ActivityType) ->
	case ets:lookup(?AcMgrEts, ActivityType) of
		[#rec_activity{phase = 1}] ->
			true;
		_ ->
			false
	end.
