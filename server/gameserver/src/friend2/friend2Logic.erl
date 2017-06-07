%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20161115
%%%-------------------------------------------------------------------
-module(friend2Logic).
-author("meitianyang").

-include("friend2Private.hrl").

%% Tools
-export([
	check/1,
	checkCAT/4
]).

%% API
-export([
	init/0,
	tick/0,
	relation/2,
	relation2/2,
	offlineMsg/1,
	offlineMsgSend/1,
	applyOneKey/2,
	formalOP/1,
	closenessAdd/1,
	deleteRole/1,
	marriage_break/1,
	clearBan/1
]).

%% 本系统在cfg_mainMenu中对应的ID
-define(IDOfMainMenu, 3).

%%% ====================================================================
%%% Tools functions
%%% ====================================================================

%% 检查增加亲密度操作是否可行
%% 为0时不可行
-spec checkCAT(ClosenessAdd::uint(), CAT::type_cat(), Relation::#rec_friend2_relation{}, ClosenessAddOld::uint()) -> ClosenessAddInfact::uint().
checkCAT(ClosenessAdd, CAT, #rec_friend2_relation{roleID = RoleID, targetRoleID = TargetRoleID, relation = ?RELATION_FORMAL}, ClosenessAddOld) ->
	#globalsetupCfg{setpara = [ClosenessAddMax]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [10]},
			friend2_formal_closeness_count
		),
	case CAT of
		?ClosenessAddType_GM ->
			ClosenessAdd;
		_ ->
			ClosenessAddRemaining = ClosenessAddMax - ClosenessAddOld,
			ClosenessAddWill = erlang:min(ClosenessAdd, ClosenessAddRemaining),
			case ClosenessAddWill > 0 of
				true ->
					case checkCAT_(CAT, RoleID, TargetRoleID) of
						true ->
							ClosenessAddWill;
						_ ->
							0
					end;
				_ ->
					0
			end
	end;
checkCAT(_, _, _, _) ->
	0.
-spec checkCAT_(CAT::type_cat(), RoleID::uint64(), TargetRoleID::uint64()) -> boolean().
checkCAT_(?ClosenessAddType_Chat, RoleID, TargetRoleID) ->
	daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_C_FristChat) =:= 0;
checkCAT_(?ClosenessAddType_TeamCopyMap, RoleID, TargetRoleID) ->
	daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_C_TeamCopyMap) =:= 0;
checkCAT_(?ClosenessAddType_Like, _RoleID, _TargetRoleID) ->
	true; %% 点赞操作在玩家进程进行验证并计数，此处不处理
checkCAT_(?ClosenessAddType_GiveAP, _RoleID, _TargetRoleID) ->
	true; %% 赠送操作在玩家进程进行验证并计数，此处不处理
checkCAT_(?ClosenessAddType_DateLink, _RoleID, _TargetRoleID) ->
	true; %% 约会地下城产生的友好度由约会地下城相关配置（次数，每次获得）进行限制，这里无条件放开
checkCAT_(?ClosenessAddType_RedEnvelope, RoleID, TargetRoleID) ->
	#globalsetupCfg{setpara = [Limit]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [5]},
			friendlinessFromRedEnvelopeLimit
		),
	daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_RedEnvelope) < Limit.

%% 增加计数
-spec addCount(CAT::type_cat(), RoleID::uint64(), TargetRoleID::uint64()) -> term().
addCount(?ClosenessAddType_Chat, RoleID, TargetRoleID) ->
	Old = daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_C_FristChat),
	daily2Logic:saveDaily2({RoleID, TargetRoleID, ?Daily2Type_C_FristChat, Old + 1});
addCount(?ClosenessAddType_TeamCopyMap, RoleID, TargetRoleID) ->
	Old = daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_C_TeamCopyMap),
	daily2Logic:saveDaily2({RoleID, TargetRoleID, ?Daily2Type_C_TeamCopyMap, Old + 1});
addCount(?ClosenessAddType_Like, _RoleID, _TargetRoleID) ->
	true; %% 点赞操作在玩家进程进行验证并计数，此处不处理
addCount(?ClosenessAddType_GiveAP, _RoleID, _TargetRoleID) ->
	true; %% 赠送操作在玩家进程进行验证并计数，此处不处理
addCount(?ClosenessAddType_DateLink, _RoleID, _TargetRoleID) ->
	true; %% 约会地下城产生的友好度由约会地下城相关配置（次数，每次获得）进行限制，这里无条件放开
addCount(?ClosenessAddType_RedEnvelope, RoleID, TargetRoleID) ->
	Old = daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_RedEnvelope),
	daily2Logic:saveDaily2({RoleID, TargetRoleID, ?Daily2Type_S_RedEnvelope, Old + 1}).

%% 玩家进程和公共进程都需要检测的一些限制
%% 玩家进程检测是为了让公共进程减少不通过的几率
%% 公共进程检测是为了防止多进程不同步问题
-spec check({RelationType::type_relation(), RoleID::uint64(), TargetRoleID::uint64()}) ->
	{Continue::type_continue(), {ErrorCode::uint(), Param::list()}}.

%% 添加好友
check({?RELATION_FORMAL, RoleID, TargetRoleID}) ->
	%% 0.检查自身等级是否符合要求
	case getRoleLevel(RoleID) of
		Level ->
			#mainMenuCfg{parameters = LevelMin} =
				getCfg:getCfgPStackWithDefaultValue(cfg_mainMenu, #mainMenuCfg{parameters = 10}, ?IDOfMainMenu),
			case Level < LevelMin of
				true ->
					{?CONTINUE_NONE, {?ErrorCode_Friend2Level, [LevelMin]}};
				_ ->
					%% 1.检查目标角色是否存在
					case getRoleLevel(TargetRoleID) of
						0 ->
							{?CONTINUE_NONE, {?ErrorCode_Friend2_None, []}};
						Level_ ->
							case Level_ < LevelMin of
								true ->
									{?CONTINUE_NONE, {?ErrorCode_Friend2Level, [LevelMin]}};
								_ ->
									Friend2DataMine = friend2State:queryFriend2Data(RoleID),
									%% 2.验证是否已经是好友关系
									RelationMine = friend2State:queryRelation(Friend2DataMine, TargetRoleID),
									case RelationMine of
										#rec_friend2_relation{relation = ?RELATION_FORMAL} ->
											{?CONTINUE_NONE, {?ErrorCode_Friend2Add_Success, [playerNameUID:getPlayerNameByUID(TargetRoleID)]}};
										_ ->
											%% 3.验证自己的好友数量是否已达上限
											#globalsetupCfg{setpara = [CountFormalMax]} =
												getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = [0]}, friend2_formal_count),
											RelationsFormalMine = friend2State:queryRelations(Friend2DataMine#recFriend2Data.relations, ?RELATION_FORMAL),
											case erlang:length(RelationsFormalMine) >= CountFormalMax of
												true ->
													{?CONTINUE_NONE, {?ErrorCode_Friend2Add_MyCountMax, []}};
												_ ->
													%% 4.验证对方的好友数量是否已达上限
													Friend2DataTarget = friend2State:queryFriend2Data(TargetRoleID),
													RelationsFormalTarget = friend2State:queryRelations(Friend2DataTarget#recFriend2Data.relations, ?RELATION_FORMAL),
													case erlang:length(RelationsFormalTarget) >= CountFormalMax of
														true ->
															{?CONTINUE_NONE, {?ErrorCode_Friend2Add_TargetCountMax, []}};
														_ ->
															%% 5.验证对方是否是自己的黑名单
															case RelationMine of
																#rec_friend2_relation{relation = ?RELATION_BLACK} ->
																	{?CONTINUE_AddFromBlackAsk, {0, []}}; %% 后续执行询问是否从黑名单中添加好友
																_ ->
																	%% 6.验证自己是否是对方的黑名单
																	case friend2State:queryRelation(Friend2DataTarget, RoleID) of
																		#rec_friend2_relation{relation = ?RELATION_BLACK} ->
																			{?CONTINUE_NONE, {?ErrorCode_Friend2Add_Wait, [playerNameUID:getPlayerNameByUID(TargetRoleID)]}};
																		_ ->
																			%% 7.验证是否已经发送过申请
																			InteractionMine = friend2State:queryInteraction(Friend2DataMine, TargetRoleID),
																			InteractionTarget = friend2State:queryInteraction(Friend2DataTarget, RoleID),
																			case {InteractionMine, InteractionTarget} of
																				{_, #rec_friend2_interaction{timeBeApply = TimeBeApply}} when TimeBeApply > 0 ->
																					{?CONTINUE_NONE, {?ErrorCode_Friend2Add_Wait, [playerNameUID:getPlayerNameByUID(TargetRoleID)]}};
																				{#rec_friend2_interaction{timeBeApply = TimeBeApply}, _} when TimeBeApply > 0 ->
																					%% 9.1 自己已收到了对方的申请，后续执行结为好友
																					{?CONTINUE_AddDo, {0, []}};
																				_ ->
																					%% 9.2 自己未收到对方的申请，后续执行申请好友
																					{?CONTINUE_AddApply, {0, []}}
																			end
																	end
															end
													end
											end
									end
							end
					end
			end
	end;
%% 解除关系（好友、临时好友、黑名单）
check({?RELATION_NONE, RoleID, TargetRoleID}) ->
	%% 1.检查目标角色是否存在
	case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
		{} ->
			{?CONTINUE_NONE, {?ErrorCode_Friend2_None, []}};
		_ ->
			%% 2.验证是否存在各种关系
			Friend2DataMine = friend2State:queryFriend2Data(RoleID),
			RelationMine = friend2State:queryRelation(Friend2DataMine, TargetRoleID),
			case RelationMine of
				#rec_friend2_relation{relation = ?RELATION_FORMAL} ->
					%% 不能解除与伴侣的好友关系
					case marriageState:queryRelation(RoleID) of
						#rec_marriage{targetRoleID = TargetRoleID} ->
							{?CONTINUE_NONE, {?ErrorCode_Friend2Del_Partner, []}};
						_ ->
							%?DEBUG_OUT("[DebugForFriend2]~p", [misc:getStackTrace()]),
							{?CONTINUE_DelFormal, {0, []}} %% 可以解除正式好友关系
					end;
				#rec_friend2_relation{relation = ?RELATION_TEMP} ->
					%?DEBUG_OUT("[DebugForFriend2]~p", [misc:getStackTrace()]),
					{?CONTINUE_DelTemp, {0, []}};   %% 可以解除临时好友关系
				#rec_friend2_relation{relation = ?RELATION_BLACK} ->
					%?DEBUG_OUT("[DebugForFriend2]~p", [misc:getStackTrace()]),
					{?CONTINUE_DelBlack, {0, []}};  %% 可以解除黑名单关系
				_ ->
					%?DEBUG_OUT("[DebugForFriend2]~p", [misc:getStackTrace()]),
					{?CONTINUE_NONE, {0, []}} %% 什么都做不了
			end
	end;
%% 解除关系（拒绝申请）
check({?RELATION_NONE, RoleID, TargetRoleID, 0}) ->
	%% 1.检查目标角色是否存在
	case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
		{} ->
			{?CONTINUE_NONE, {?ErrorCode_Friend2_None, []}};
		_ ->
			%% 2.验证是否收到了对方的好友申请
			case friend2State:queryInteraction(friend2State:queryFriend2Data(RoleID), TargetRoleID) of
				#rec_friend2_interaction{timeBeApply = TimeBeApply} when TimeBeApply > 0 ->
					%?DEBUG_OUT("[DebugForFriend2]~p", [misc:getStackTrace()]),
					{?CONTINUE_DelApply, {0, []}};  %% 可以拒绝对方的好友申请
				_ ->
					%?DEBUG_OUT("[DebugForFriend2]~p", [misc:getStackTrace()]),
					{?CONTINUE_NONE, {0, []}} %% 什么都做不了
			end
	end;
%% 拉黑
check({?RELATION_BLACK, RoleID, TargetRoleID}) ->
	%% 0.检查自身等级是否符合要求
	case getRoleLevel(RoleID) of
		Level ->
			#mainMenuCfg{parameters = LevelMin} =
				getCfg:getCfgPStackWithDefaultValue(cfg_mainMenu, #mainMenuCfg{parameters = 10}, ?IDOfMainMenu),
			case Level < LevelMin of
				true ->
					{?CONTINUE_NONE, {?ErrorCode_Friend2Level, [LevelMin]}};
				_ ->
					%% 1.检查目标角色是否存在
					case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
						{} ->
							{?CONTINUE_NONE, {?ErrorCode_Friend2_None, []}};
						#?RoleKeyRec{roleName = Name} ->
							%% 2.验证是否已经是好友关系或黑名单关系
							Friend2DataMine = friend2State:queryFriend2Data(RoleID),
							RelationMine = friend2State:queryRelation(Friend2DataMine, TargetRoleID),
							case RelationMine of
								#rec_friend2_relation{relation = ?RELATION_FORMAL} ->
									%% 不能拉黑伴侣
									case marriageState:queryRelation(RoleID) of
										#rec_marriage{targetRoleID = TargetRoleID} ->
											{?CONTINUE_NONE, {?ErrorCode_Friend2Del_Partner, []}};
										_ ->
											{?CONTINUE_BanFromFormal, {0, []}} %% 需要询问客户端是否先解除好友关系
									end;
								#rec_friend2_relation{relation = ?RELATION_BLACK} ->
									{?CONTINUE_NONE, {?ErrorCode_Friend2Ban_Success, [Name]}}; %% 已经是黑名单关系
								_ ->
									%% 3.验证自己的黑名单数量是否已达上限
									#globalsetupCfg{setpara = [CountBlackMax]} =
										getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = [0]}, friend2_black_count),
									RelationsBlackMine = friend2State:queryRelations(Friend2DataMine#recFriend2Data.relations, ?RELATION_BLACK),
									case erlang:length(RelationsBlackMine) >= CountBlackMax of
										true ->
											{?CONTINUE_BanWithUnBan, {0, []}};  %% 黑名单满，需要询问客户端是否先解除黑名单关系
										_ ->
											{?CONTINUE_Ban, {0, []}}  %% 普通拉黑
									end
							end
					end
			end
	end;
%% 添加临时好友（或者刷新好友的交互时间）
check({?RELATION_TEMP, RoleID, TargetRoleID}) ->
	%% 0.检查自身及对方等级是否符合要求
	case getRoleLevel(RoleID) of
		Level ->
			#mainMenuCfg{parameters = LevelMin} =
				getCfg:getCfgPStackWithDefaultValue(cfg_mainMenu, #mainMenuCfg{parameters = 10}, ?IDOfMainMenu),
			case Level < LevelMin of
				true ->
					{?CONTINUE_NONE, {0, []}};
				_ ->
					%% 1.检查目标角色是否存在
					case getRoleLevel(TargetRoleID) of
						0 ->
							{?CONTINUE_NONE, {0, []}};
						Level_ ->
							case Level_ < LevelMin of
								true ->
									{?CONTINUE_NONE, {0, []}};
								_ ->
									%% 2.验证是否已经是好友、黑名单
									Friend2DataMine = friend2State:queryFriend2Data(RoleID),
									Friend2DataTarget = friend2State:queryFriend2Data(TargetRoleID),
									RelationMine = friend2State:queryRelation(Friend2DataMine, TargetRoleID),
									RelationTarget = friend2State:queryRelation(Friend2DataTarget, RoleID),
									case RelationMine of
										#rec_friend2_relation{relation = ?RELATION_FORMAL} ->
											{?CONTINUE_FreshInteraction, {0, []}};  %% 刷新交互时间
										#rec_friend2_relation{relation = ?RELATION_BLACK} ->
											{?CONTINUE_NONE, {0, []}};
										#rec_friend2_relation{relation = ?RELATION_TEMP} ->
											{?CONTINUE_AddDoTemp, {0, []}};     %% 刷新临时好友关系
										_ ->
											case RelationTarget of
												#rec_friend2_relation{relation = ?RELATION_BLACK} ->
													{?CONTINUE_NONE, {0, []}};
												_ ->
													% 临时好友不判断上限，新的覆盖旧的
													%%% 3.验证自己的临时好友数量是否已达上限
													%#globalsetupCfg{setpara = [CountTempMax]} =
													%	getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = [0]}, friend2_temp_count),
													%RelationsTempMine = friend2State:queryRelations(Friend2DataMine#recFriend2Data.relations, ?RELATION_TEMP),
													%case erlang:length(RelationsTempMine) >= CountTempMax of
													%	true ->
													%		{?CONTINUE_NONE, {0, []}};  %% 临时好友已满，忽略
													%	_ ->
															{?CONTINUE_AddDoTemp, {0, []}}  %% 新增临时好友关系
													%end
											end
									end
							end
					end
			end
	end.

%%% ====================================================================
%%% API functions
%%% ====================================================================

%% 初始化
-spec init() -> ok.
init() ->
	%?DEBUG_OUT("[DebugForFriend2] init", []),
	erlang:send_after(?Friend2HeartBeat, self(), tick),
	ok.

%% 心跳
-spec tick() -> ok.
tick() ->
	%?DEBUG_OUT("[DebugForFriend2] tick", []),
	erlang:send_after(?Friend2HeartBeat, self(), tick),
	tick_delApply(),
	tick_delOfflineMsgs(),
	ok.

%% 一键处理申请请求
-spec applyOneKey(Pid::pid(), {RoleID::uint64(), IsAgreed::boolean()}) -> ok.
applyOneKey(Pid, {RoleID, IsAgreed}) ->
	%?DEBUG_OUT("[DebugForFriend2] applyOneKey ~p", [{RoleID, IsAgreed}]),
	Friend2DataMine = friend2State:queryFriend2Data(RoleID),
	case IsAgreed of
		true ->
			RelationsFormal = friend2State:queryRelations(Friend2DataMine#recFriend2Data.relations, ?RELATION_FORMAL),
			CountFormal = erlang:length(RelationsFormal),
			#globalsetupCfg{setpara = [CountFormalMax]} =
				getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = [0]}, friend2_formal_count),
			case CountFormal < CountFormalMax of
				true ->
					CountNeed = CountFormalMax - CountFormal,
					ApplicantsAll = friend2State:sortRelationsApplicant(Friend2DataMine),
					{CountHas, ApplicantsHas} =
						case erlang:length(ApplicantsAll) > CountNeed of
							true ->
								{ListA, _ListB} = lists:split(CountNeed, ApplicantsAll),
								{CountNeed, ListA};
							_ ->
								{erlang:length(ApplicantsAll), ApplicantsAll}
						end,
					TimeNow = time:getSyncUTCTimeFromDBS(),
					FunAdd =
						fun(ID) ->
							%% 建立好友关系
							Friend2DataMine_ = friend2State:queryFriend2Data(RoleID),
							Friend2DataTarget_ = friend2State:queryFriend2Data(ID),
							RelationOldMine_ = friend2State:queryRelation(Friend2DataMine_, ID),
							RelationOldTarget_ = friend2State:queryRelation(Friend2DataTarget_, RoleID),
							RelationNewMine_ =
								RelationOldMine_#rec_friend2_relation{
									relation = ?RELATION_FORMAL,
									closeness = 0,
									timeRelation = TimeNow,
									timeLastInteractive = TimeNow
								},
							RelationNewTarget_ =
								RelationOldTarget_#rec_friend2_relation{
									relation = ?RELATION_FORMAL,
									closeness = 0,
									timeRelation = TimeNow,
									timeLastInteractive = TimeNow
								},
							%% 清除可能的申请关系
							%InteractionOldMine_ = friend2State:queryInteraction(Friend2DataMine_, ID),
							%InteractionOldTarget_ = friend2State:queryInteraction(Friend2DataTarget_, RoleID),
							InteractionNewMine_ = ?DefaultValueOfInteraction(RoleID, ID),
							InteractionNewTarget_ = ?DefaultValueOfInteraction(ID, RoleID),
							%% 写数据
							DBOPT_R_A = friend2State:replaceRelation(RelationNewMine_),
							DBOPT_R_B = friend2State:replaceRelation(RelationNewTarget_),
							DBOPT_I_A = friend2State:replaceInteraction(InteractionNewMine_),
							DBOPT_I_B = friend2State:replaceInteraction(InteractionNewTarget_),
							filterInvalidDBMsg(friend2_dbsave, [
								{DBOPT_R_A, RelationNewMine_},
								{DBOPT_R_B, RelationNewTarget_},
								{DBOPT_I_A, InteractionNewMine_},
								{DBOPT_I_B, InteractionNewTarget_}
							]),
							%% error_code形式的用户提示
							error_code(Pid, {?ErrorCode_Friend2Add_Success, [playerNameUID:getPlayerNameByUID(ID)]}),
							error_code(ID, {?ErrorCode_Friend2Add_Success, [playerNameUID:getPlayerNameByUID(RoleID)]}),
							continue(?CONTINUE_SyncFormalB, {RoleID, ID}), %% 影响好友名单变化
							%% 可能影响临时好友名单变化
							case RelationOldMine_#rec_friend2_relation.relation of
								?RELATION_TEMP ->
									continue(?CONTINUE_SyncTempB, {RoleID, ID});
								_ ->
									skip
							end,
							%% 用于客户端特殊处理
							case core:queryOnLineRoleByRoleID(RoleID) of
								#rec_OnlinePlayer{netPid = NetPid_A} ->
									gsSendMsg:sendNetMsg(NetPid_A, #pk_GS2U_Friend2MakeFormal_Sync{id = ID});
								_ ->
									skip
							end,
							case core:queryOnLineRoleByRoleID(ID) of
								#rec_OnlinePlayer{netPid = NetPid_B} ->
									gsSendMsg:sendNetMsg(NetPid_B, #pk_GS2U_Friend2MakeFormal_Sync{id = RoleID});
								_ ->
									skip
							end
						end,
					lists:foreach(FunAdd, ApplicantsHas),
					error_code(Pid, {?ErrorCode_Friend2Add_SuccessMany, [CountHas]}),
					continue(?CONTINUE_SyncFormalA, {RoleID, 0}),   %% 影响好友名单变化
					continue(?CONTINUE_SyncTempA, {RoleID, 0}),     %% 可能影响临时好友名单
					continue(?CONTINUE_SyncApplyA, {RoleID, 0});    %% 可能影响临时申请者名单
				_ ->
					error_code(Pid, {?ErrorCode_Friend2Add_MyCountMax, []})
			end;
		_ ->
			FunCancel =
				fun(#rec_friend2_interaction{targetRoleID = TargetRoleID}, Result) ->
					InteractionNew = ?DefaultValueOfInteraction(RoleID, TargetRoleID),
					DBOPT = friend2State:replaceInteraction(InteractionNew),
					[{DBOPT, InteractionNew} | Result]
				end,
			Msgs = lists:foldl(FunCancel, [], Friend2DataMine#recFriend2Data.interactions),
			filterInvalidDBMsg(friend2_dbsave, Msgs),
			continue(?CONTINUE_SyncApplyA, {RoleID, 0})
	end,
	ok.

%% 缓存离线消息
-spec offlineMsg({RoleID::uint64(), TargetRoleID::uint64(), Data::term()}) -> ok.
offlineMsg({RoleID, TargetRoleID, Data}) ->
	%?DEBUG_OUT("[DebugForFriend2] offlineMsg RoleID(~p) TargetRoleID(~p)", [RoleID, TargetRoleID]),
	case erlang:is_list(Data) of
		true ->
			lists:foreach(fun(X) -> offlineMsg({RoleID, TargetRoleID, X}) end, Data);
		_ ->
			Friend2DataTarget = friend2State:queryFriend2Data(TargetRoleID),
			HasRelation =
				case friend2State:queryRelation(Friend2DataTarget, RoleID) of
					#rec_friend2_relation{relation = ?RELATION_BLACK} ->
						false;
					_ ->
						true
				end,
			case HasRelation of
				true ->
					ChatMsgOld = friend2State:queryChatMsg(Friend2DataTarget, RoleID),
					ChatMsgNew = ChatMsgOld#recFriend2Chat{chatMsgs = [Data | ChatMsgOld#recFriend2Chat.chatMsgs]},
					friend2State:replaceChatMsg(TargetRoleID, ChatMsgNew);
				_ ->
					skip
			end
	end,
	ok.

%% 已发送缓存离线消息
-spec offlineMsgSend(RoleID::uint64()) -> ok.
offlineMsgSend(RoleID) ->
	%?DEBUG_OUT("[DebugForFriend2] offlineMsgSend RoleID(~p)", [RoleID]),
	Friend2Data = friend2State:queryFriend2Data(RoleID),
	friend2State:replaceFriend2Data(Friend2Data#recFriend2Data{chatMsgs = []}),
	ok.

%% 关系改变
-spec relation(Pid::pid(), {RelationType::type_relation(), RoleID::uint64(), TargetRoleID::uint64()}) -> ok.
relation(Pid, Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] relation Msg(~p)", [Msg]),
	case friend2Logic:check(Msg) of
		{?CONTINUE_NONE, E} ->
			error_code(Pid, E);
		{Continue, _} ->
			case Msg of
				{_, RoleID, TargetRoleID} ->
					continue(Continue, {RoleID, TargetRoleID});
				{_, RoleID_, TargetRoleID_, _} ->
					continue(Continue, {RoleID_, TargetRoleID_})
			end
	end,
	ok.

%% 关系双重改变
-spec relation2(Pid::pid(), {Continue::type_continue(), Data::term()}) -> ok.
relation2(Pid, {?CONTINUE_BanFromFormalDo, {RoleID, TargetRoleID}}) ->
	%% 拉黑好友
	case friend2Logic:check({?RELATION_BLACK, RoleID, TargetRoleID}) of
		{?CONTINUE_NONE, E} ->
			error_code(Pid, E);
		{?CONTINUE_BanFromFormal, _} ->
			continue(?CONTINUE_Ban, {RoleID, TargetRoleID});  %% 执行拉黑
		{?CONTINUE_BanWithUnBan, _} ->
			continue(?CONTINUE_BanWithUnBan, {RoleID, TargetRoleID});
		{?CONTINUE_Ban, _} ->
			continue(?CONTINUE_Ban, {RoleID, TargetRoleID}) %% 执行拉黑
	end,
	ok;
relation2(Pid, {?CONTINUE_DelBlackAndBan, {RoleID, TargetRoleID_A, TargetRoleID_B}}) ->
	%% 解除黑名单A
	case friend2Logic:check({?RELATION_NONE, RoleID, TargetRoleID_A}) of
		{?CONTINUE_DelBlack, _} ->
			continue(?CONTINUE_DelBlack, {RoleID, TargetRoleID_A});
		_ ->
			skip
	end,
	%% 尝试拉黑B
	case friend2Logic:check({?RELATION_BLACK, RoleID, TargetRoleID_B}) of
		{?CONTINUE_NONE, E} ->
			error_code(Pid, E);
		{?CONTINUE_BanFromFormal, _} ->
			%% B是好友，需要走另外的流程
			continue(?CONTINUE_BanFromFormal, {RoleID, TargetRoleID_B});
		{?CONTINUE_BanWithUnBan, _} ->
			%% 黑名单依然很满，继续走流程
			continue(?CONTINUE_BanWithUnBan, {RoleID, TargetRoleID_B});
		{?CONTINUE_Ban, _} ->
			continue(?CONTINUE_Ban, {RoleID, TargetRoleID_B})
	end,
	ok;
relation2(Pid, {?CONTINUE_AddApplyFromBlack, {RoleID, TargetRoleID}}) ->
	%% 申请对象可能在是黑名单
	case friend2Logic:check({?RELATION_FORMAL, RoleID, TargetRoleID}) of
		{?CONTINUE_NONE, E} ->
			error_code(Pid, E);
		{?CONTINUE_AddFromBlackAsk, _} ->
			continue(?CONTINUE_DelBlack, {RoleID, TargetRoleID}),
			%% 如果对方没有拉黑自己则执行添加临时好友并申请添加正是好友的操作
			case friend2State:queryRelation(friend2State:queryFriend2Data(TargetRoleID), RoleID) of
				#rec_friend2_relation{relation = ?RELATION_BLACK} ->
					skip;
				_ ->
					continue(?CONTINUE_AddDoTemp, {RoleID, TargetRoleID}),
					continue(?CONTINUE_AddApply, {RoleID, TargetRoleID})
			end;
		{?CONTINUE_AddDo, _} ->
			continue(?CONTINUE_AddDo, {RoleID, TargetRoleID});
		{?CONTINUE_AddApply, _} ->
			continue(?CONTINUE_AddDoTemp, {RoleID, TargetRoleID}),
			continue(?CONTINUE_AddApply, {RoleID, TargetRoleID})
	end,
	ok.

%% 扩展功能
-spec formalOP({EXOP::type_exop(), RoleID::uint64(), TargetRoleID::uint64()}) -> ok.
formalOP({?EXOP_Like, RoleID, TargetRoleID}) ->
	%?DEBUG_OUT("[DebugForFriend2] formalOP EXOP_Like ~p", [{RoleID, TargetRoleID}]),
	closenessAdd({?ClosenessAddType_Like, RoleID, TargetRoleID, 1}),
	%% 如果对方在线则发送给对方玩家进程增加赞值，否则执行特殊逻辑写入对应玩家属性
	Like = modifyPlayerVariant(TargetRoleID, ?Setting_PlayerVarReadOnly_BeLike, 1),
	Name = playerNameUID:getPlayerNameByUID(TargetRoleID),
	error_code(RoleID, {?ErrorCode_Friend2Formal_LikeSuccess, [Name]}),
	#rec_OnlinePlayer{pid = Pid} = core:queryOnLineRoleByRoleID(RoleID),
	psMgr:sendMsg2PS(Pid, friend2_like, {TargetRoleID, Name, Like}),
	ok;
formalOP({?EXOP_GiveAP, RoleID, TargetRoleID}) ->
	%?DEBUG_OUT("[DebugForFriend2] formalOP EXOP_GiveAP ~p", [{RoleID, TargetRoleID}]),
	closenessAdd({?ClosenessAddType_GiveAP, RoleID, TargetRoleID, 1}),
	error_code(RoleID, {?ErrorCode_Friend2Formal_GiveAPSuccess, [playerNameUID:getPlayerNameByUID(TargetRoleID)]}),
	continue(?CONTINUE_SyncFormalAB, {RoleID, TargetRoleID}),
	ok;
formalOP({?EXOP_GainAP, RoleID, TargetRoleID}) ->
	%?DEBUG_OUT("[DebugForFriend2] formalOP EXOP_GainAP ~p", [{RoleID, TargetRoleID}]),
	error_code(RoleID, {?ErrorCode_Friend2Formal_GainAPSuccess, [playerNameUID:getPlayerNameByUID(TargetRoleID)]}),
	continue(?CONTINUE_SyncFormalAB, {RoleID, TargetRoleID}),
	ok.

%% 增加亲密度
-spec closenessAdd({CAT::type_cat(), RoleID::uint64(), TargetRoleID::uint64(), ClosenessAdd::int32()}) -> boolean().
closenessAdd({CAT, RoleID, TargetRoleID, ClosenessAdd}) ->
	%?DEBUG_OUT("[DebugForFriend2] closenessAdd CAT(~p) RoleID(~p) TargetRoleID(~p) ClosenessAdd(~p)", [CAT, RoleID, TargetRoleID, ClosenessAdd]),
	Friend2Data = friend2State:queryFriend2Data(RoleID),
	Relation = friend2State:queryRelation(Friend2Data, TargetRoleID),
	ClosenessAddOld = daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_C_AddFriendliness),
	ClosenessAddWill = friend2Logic:checkCAT(ClosenessAdd, CAT, Relation, ClosenessAddOld),
	case ClosenessAddWill > 0 of
		true ->
			?DEBUG_OUT("[DebugForFriend2] closenessAdd CAT(~p) RoleID(~p) TargetRoleID(~p) ClosenessAdd(~p)", [CAT, RoleID, TargetRoleID, ClosenessAdd]),
			%% 修改亲密度
			Friend2DataTarget = friend2State:queryFriend2Data(TargetRoleID),
			RelationTarget = friend2State:queryRelation(Friend2DataTarget, RoleID),
			RelationNewMine =
				Relation#rec_friend2_relation{
					closeness = Relation#rec_friend2_relation.closeness + ClosenessAddWill
				},
			RelationNewTarget =
				RelationTarget#rec_friend2_relation{
					closeness = RelationTarget#rec_friend2_relation.closeness + ClosenessAddWill
				},
			%% GM命令来源不计入当日总计数
			case CAT of
				?ClosenessAddType_GM ->
					skip;
				_ ->
					?DEBUG_OUT("[DebugForFriend2] closenessAdd CAT(~p) RoleID(~p) TargetRoleID(~p) ClosenessAdd(~p)", [CAT, RoleID, TargetRoleID, ClosenessAdd]),
					daily2Logic:saveDaily2({RoleID, TargetRoleID, ?Daily2Type_C_AddFriendliness, ClosenessAddOld + ClosenessAddWill}),
					addCount(CAT, RoleID, TargetRoleID)
			end,
			%% 记录亲密度变化日志（各种增加亲密度
			dbLog:sendSaveLogFriend(#rec_log_player_friend{
				roleID = RoleID,
				targetRoleID = TargetRoleID,
				oldCloseness = Relation#rec_friend2_relation.closeness,
				newCloseness = RelationNewMine#rec_friend2_relation.closeness,
				reason = CAT,
				isActive = 1,
				time = time:getLogTimeSec()
			}),
			dbLog:sendSaveLogFriend(#rec_log_player_friend{
				roleID = TargetRoleID,
				targetRoleID = RoleID,
				oldCloseness = RelationTarget#rec_friend2_relation.closeness,
				newCloseness = RelationNewTarget#rec_friend2_relation.closeness,
				reason = CAT,
				isActive = 0,
				time = time:getLogTimeSec()
			}),
			%% 写数据
			DBOPT_R_A = friend2State:replaceRelation(RelationNewMine),
			DBOPT_R_B = friend2State:replaceRelation(RelationNewTarget),
			filterInvalidDBMsg(friend2_dbsave, [
				{DBOPT_R_A, RelationNewMine},
				{DBOPT_R_B, RelationNewTarget}
			]),
			%% 通知玩家
			case core:queryOnLineRoleByRoleID(RoleID) of
				#rec_OnlinePlayer{netPid = NetPid_A} ->
					gsSendMsg:sendNetMsg(
						NetPid_A,
						#pk_GS2U_Friend2ClosenessChange_Sync{
							id = TargetRoleID,
							closeness = RelationNewMine#rec_friend2_relation.closeness
						}
					);
				_ ->
					skip
			end,
			case core:queryOnLineRoleByRoleID(TargetRoleID) of
				#rec_OnlinePlayer{netPid = NetPid_B} ->
					gsSendMsg:sendNetMsg(
						NetPid_B,
						#pk_GS2U_Friend2ClosenessChange_Sync{
							id = RoleID,
							closeness = RelationNewTarget#rec_friend2_relation.closeness
						}
					);
				_ ->
					skip
			end,
			true;
		_ ->
			false
	end.

%% 删除角色
-spec deleteRole(RoleID::uint64()) -> ok.
deleteRole(RoleID) ->
	%% 解除所有关系双向关系、正向关系、逆向关系、交互信息、离线消息
	%% 1.筛选需要修改的数据
	FunFindF =
		fun(#recFriend2Data{
			roleID = RoleID_A,
			relations = Relations,
			interactions = Interactions,
			chatMsgs = ChatMsgs
		}, {ListRelation, ListInteraction, ListChatMsgs}) ->
			case RoleID_A of
				RoleID ->
					%% 都是目标的数据，需要全部清除
					FunAllC =
						fun(Msgs, R) ->
							[{RoleID_A, Msgs} | R]
						end,
					{Relations ++ ListRelation, Interactions ++ ListInteraction, lists:foldl(FunAllC, [], ChatMsgs) ++ ListChatMsgs};
				_ ->
					%% 可能与目标有关的数据，需要甄别
					FunFindR =
						fun(#rec_friend2_relation{targetRoleID = RoleID_B} = Rec, ListR) ->
							case RoleID_B of
								RoleID ->
									[Rec | ListR];
								_ ->
									ListR
							end
						end,
					ListR = lists:foldl(FunFindR, ListRelation, Relations),
					FunFindI =
						fun(#rec_friend2_interaction{targetRoleID = RoleID_B} = Rec, ListI) ->
							case RoleID_B of
								RoleID ->
									[Rec | ListI];
								_ ->
									ListI
							end
						end,
					ListI = lists:foldl(FunFindI, ListInteraction, Interactions),
					FunFindC =
						fun(#recFriend2Chat{targetRoleID = RoleID_B} = Rec, ListC) ->
							case RoleID_B of
								RoleID ->
									[{RoleID_A, Rec} | ListC];
								_ ->
									ListC
							end
						end,
					ListC = lists:foldl(FunFindC, ListChatMsgs, ChatMsgs),
					{ListR, ListI, ListC}
			end
		end,
	{ListRelation, ListInteracion, ListChatMsgs} = ets:foldl(FunFindF, {[], [], []}, ?EtsFriend2Data),
	%% 2.修改关系数据
	%% 同时得出该部分可能需要通知的玩家ID列表
	FunClearRelation =
		fun(RelationOld, {R, LI}) ->

			%% 记录亲密度变化日志（删除角色导致关系解除
			dbLog:sendSaveLogFriend(#rec_log_player_friend{
				roleID = RoleID,
				targetRoleID = RelationOld#rec_friend2_relation.roleID,
				oldCloseness = RelationOld#rec_friend2_relation.closeness,
				newCloseness = 0,
				reason = ?ClosenessDelType_BreakF,
				isActive = 1,
				time = time:getLogTimeSec()
			}),
			dbLog:sendSaveLogFriend(#rec_log_player_friend{
				roleID = RelationOld#rec_friend2_relation.roleID,
				targetRoleID = RoleID,
				oldCloseness = RelationOld#rec_friend2_relation.closeness,
				newCloseness = 0,
				reason = ?ClosenessDelType_BreakF,
				isActive = 0,
				time = time:getLogTimeSec()
			}),

			RelationNew =
				RelationOld#rec_friend2_relation{
					relation = 0,
					closeness = 0,
					timeRelation = 0,
					timeLastInteractive = 0
				},
			R_ = [{friend2State:replaceRelation(RelationNew), RelationNew} | R],
			LI_ = [RelationNew#rec_friend2_relation.roleID | LI],
			{R_, [RelationNew#rec_friend2_relation.targetRoleID | LI_]}
		end,
	{ListWillSaveR, ListID1} = lists:foldl(FunClearRelation, {[], []}, ListRelation),
	%% 3.修改交互数据
	%% 同时得出该部分可能需要通知的玩家ID列表
	FunClearInteraction =
		fun(InteractionOld, {R, LI}) ->
			InteractionNew =
				InteractionOld#rec_friend2_interaction{
					timeBeApply = 0
				},
			R_ = [{friend2State:replaceInteraction(InteractionNew), InteractionNew} | R],
			LI_ = [InteractionNew#rec_friend2_interaction.roleID | LI],
			{R_, [InteractionNew#rec_friend2_interaction.targetRoleID | LI_]}
		end,
	{ListWillSaveI, ListID2} = lists:foldl(FunClearInteraction, {[], []}, ListInteracion),
	%% 4.修改离线聊天数据
	FunClearChatMsgs =
		fun({ID, Msgs}) ->
			friend2State:replaceChatMsg(ID, Msgs)
		end,
	lists:foreach(FunClearChatMsgs, ListChatMsgs),
	%% 5.写入数据
	filterInvalidDBMsg(friend2_dbsave, ListWillSaveR ++ ListWillSaveI),
	%% 6.筛选非目标角色的在线角色同步
	ListID3 = lists:usort(ListID1 ++ ListID2),
	FunFilterOnlineRoleID =
		fun(ID) ->
			case ID of
				RoleID ->
					skip;
				_ ->
					case core:queryOnLineRoleByRoleID(ID) of
						#rec_OnlinePlayer{pid = Pid} ->
							psMgr:sendMsg2PS(Pid, friend2_sync_formal, {}),
							psMgr:sendMsg2PS(Pid, friend2_sync_temp, {}),
							psMgr:sendMsg2PS(Pid, friend2_sync_black, {}),
							psMgr:sendMsg2PS(Pid, friend2_sync_apply, {});
						_ ->
							skip
					end
			end
		end,
	lists:foreach(FunFilterOnlineRoleID, ListID3),
	ok.

%% 离婚导致的友好度下降
-spec marriage_break({RoleID::uint64(), TargetRoleID::uint64(), Friendliness::uint32()}) -> ok.
marriage_break({RoleID, TargetRoleID, Friendliness}) ->
	Friend2DataMine = friend2State:queryFriend2Data(RoleID),
	Friend2DataTarget = friend2State:queryFriend2Data(TargetRoleID),
	RelationOldMine = friend2State:queryRelation(Friend2DataMine, TargetRoleID),
	RelationOldTarget = friend2State:queryRelation(Friend2DataTarget, RoleID),
	RelationNewMine =
		RelationOldMine#rec_friend2_relation{
			closeness = Friendliness
		},
	RelationNewTarget=
		RelationOldTarget#rec_friend2_relation{
			closeness = Friendliness
		},
	%% 写数据
	DBOPT_R_A = friend2State:replaceRelation(RelationNewMine),
	DBOPT_R_B = friend2State:replaceRelation(RelationNewTarget),
	filterInvalidDBMsg(friend2_dbsave, [
		{DBOPT_R_A, RelationNewMine},
		{DBOPT_R_B, RelationNewTarget}
	]),
	%% 影响好友名单变化
	continue(?CONTINUE_SyncFormalAB, {RoleID, TargetRoleID}),
	%% 记录亲密度变化日志（离婚重置亲密度
	dbLog:sendSaveLogFriend(#rec_log_player_friend{
		roleID = RoleID,
		targetRoleID = TargetRoleID,
		oldCloseness = RelationOldMine#rec_friend2_relation.closeness,
		newCloseness = Friendliness,
		reason = ?ClosenessDelType_BreakM,
		isActive = 1,
		time = time:getLogTimeSec()
	}),
	dbLog:sendSaveLogFriend(#rec_log_player_friend{
		roleID = TargetRoleID,
		targetRoleID = RoleID,
		oldCloseness = RelationNewTarget#rec_friend2_relation.closeness,
		newCloseness = Friendliness,
		reason = ?ClosenessDelType_BreakM,
		isActive = 0,
		time = time:getLogTimeSec()
	}),
	ok.

%% 平台gm 取消黑名单
-spec clearBan({RoleID::uint64(), CallbackPid::pid(), CmdSerial::term()}) -> ok.
clearBan({RoleID, CallbackPid, CmdSerial}) ->
	variant:setPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_BeBlackCount, 0),
	psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial, 0}),
	ok.

%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%% 异常码处理
-spec error_code(
		Key::pid()|uint64(),
		{
			ErrorCode::uint(),
			Param::list()
		}
) ->
	ok.
error_code(_, {0, []}) ->
	?ERROR_OUT("error_code unknown error!~n~p", [misc:getStackTrace()]),
	ok;
error_code(Pid, ErrorInfo) when erlang:is_pid(Pid) ->
	%?DEBUG_OUT("[DebugForFriend2] error_code ~p", [ErrorInfo]),
	psMgr:sendMsg2PS(Pid, friend2_error, ErrorInfo),
	ok;
error_code(RoleID, ErrorInfo) ->
	%?DEBUG_OUT("[DebugForFriend2] error_code ~p", [ErrorInfo]),
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{pid = Pid} ->
			psMgr:sendMsg2PS(Pid, friend2_error, ErrorInfo);
		_ ->
			skip
	end,
	ok.

%% 剔除无效消息
-spec filterInvalidDBMsg(MsgID::atom(), ListIn::[{type_dbopt(), _}, ...]) -> ok.
filterInvalidDBMsg(MsgID, ListIn) ->
	FunFilter =
		fun({DBOPT, _} = Msg, Result) ->
			case DBOPT of
				?DBOPT_ERROR ->
					Result;
				_ ->
					[Msg | Result]
			end
		end,
	case lists:foldl(FunFilter, [], ListIn) of
		[] ->
			skip;
		List ->
			gsSendMsg:sendMsg2DBServer(MsgID, 0, List)
	end,
	ok.

%% 后续操作处理
-spec continue(Continue::type_continue(), P::term()) -> ok.
continue(?CONTINUE_NONE, _) ->
	ok;
continue(?CONTINUE_AddFromBlackAsk, {RoleID, TargetRoleID}) ->
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{pid = Pid} ->
			psMgr:sendMsg2PS(Pid, friend2_relationAck, {?CONTINUE_AddFromBlackAsk, TargetRoleID});
		_ ->
			skip
	end,
	ok;
continue(?CONTINUE_BanWithUnBan, {RoleID, TargetRoleID}) ->
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{pid = Pid} ->
			psMgr:sendMsg2PS(Pid, friend2_relationAck, {?CONTINUE_BanWithUnBan, TargetRoleID});
		_ ->
			skip
	end,
	ok;
continue(?CONTINUE_BanFromFormal, {RoleID, TargetRoleID}) ->
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{pid = Pid} ->
			psMgr:sendMsg2PS(Pid, friend2_relationAck, {?CONTINUE_BanFromFormal, TargetRoleID});
		_ ->
			skip
	end,
	ok;
continue(?CONTINUE_DelFormalS, {RoleID, TargetRoleID}) ->
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{pid = Pid} ->
			psMgr:sendMsg2PS(Pid, friend2_relationAck, {?CONTINUE_DelFormalS, TargetRoleID});
		_ ->
			skip
	end,
	ok;
continue(?CONTINUE_SyncFormalA, {RoleID, _}) ->
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{pid = PidA} ->
			psMgr:sendMsg2PS(PidA, friend2_sync_formal, {});
		_ ->
			skip
	end,
	ok;
continue(?CONTINUE_SyncTempA, {RoleID, _}) ->
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{pid = PidA} ->
			psMgr:sendMsg2PS(PidA, friend2_sync_temp, {});
		_ ->
			skip
	end,
	ok;
continue(?CONTINUE_SyncBlackA, {RoleID, _}) ->
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{pid = PidA} ->
			psMgr:sendMsg2PS(PidA, friend2_sync_black, {});
		_ ->
			skip
	end,
	ok;
continue(?CONTINUE_SyncApplyA, {RoleID, _}) ->
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{pid = PidA} ->
			psMgr:sendMsg2PS(PidA, friend2_sync_apply, {});
		_ ->
			skip
	end,
	ok;
continue(?CONTINUE_SyncFormalB, {_, TargetRoleID}) ->
	case core:queryOnLineRoleByRoleID(TargetRoleID) of
		#rec_OnlinePlayer{pid = Pid} ->
			psMgr:sendMsg2PS(Pid, friend2_sync_formal, {});
		_ ->
			skip
	end,
	ok;
continue(?CONTINUE_SyncTempB, {_, TargetRoleID}) ->
	case core:queryOnLineRoleByRoleID(TargetRoleID) of
		#rec_OnlinePlayer{pid = PidA} ->
			psMgr:sendMsg2PS(PidA, friend2_sync_temp, {});
		_ ->
			skip
	end,
	ok;
continue(?CONTINUE_SyncBlackB, {_, TargetRoleID}) ->
	case core:queryOnLineRoleByRoleID(TargetRoleID) of
		#rec_OnlinePlayer{pid = PidA} ->
			psMgr:sendMsg2PS(PidA, friend2_sync_black, {});
		_ ->
			skip
	end,
	ok;
continue(?CONTINUE_SyncApplyB, {_, TargetRoleID}) ->
	case core:queryOnLineRoleByRoleID(TargetRoleID) of
		#rec_OnlinePlayer{pid = PidA} ->
			psMgr:sendMsg2PS(PidA, friend2_sync_apply, {});
		_ ->
			skip
	end,
	ok;
continue(?CONTINUE_SyncFormalAB, {RoleID, TargetRoleID}) ->
	continue(?CONTINUE_SyncFormalA, {RoleID, TargetRoleID}),
	continue(?CONTINUE_SyncFormalB, {RoleID, TargetRoleID}),
	ok;
continue(?CONTINUE_SyncTempAB, {RoleID, TargetRoleID}) ->
	continue(?CONTINUE_SyncTempA, {RoleID, TargetRoleID}),
	continue(?CONTINUE_SyncTempB, {RoleID, TargetRoleID}),
	ok;
continue(?CONTINUE_SyncBlackAB, {RoleID, TargetRoleID}) ->
	continue(?CONTINUE_SyncBlackA, {RoleID, TargetRoleID}),
	continue(?CONTINUE_SyncBlackB, {RoleID, TargetRoleID}),
	ok;
continue(?CONTINUE_SyncApplyAB, {RoleID, TargetRoleID}) ->
	continue(?CONTINUE_SyncApplyA, {RoleID, TargetRoleID}),
	continue(?CONTINUE_SyncApplyB, {RoleID, TargetRoleID}),
	ok;
continue(?CONTINUE_Ban, {RoleID, TargetRoleID}) ->
	%% 单向建立黑名单关系，如果对方不是黑名单关系，则解除
	Friend2DataMine = friend2State:queryFriend2Data(RoleID),
	Friend2DataTarget = friend2State:queryFriend2Data(TargetRoleID),
	RelationOldMine = friend2State:queryRelation(Friend2DataMine, TargetRoleID),
	RelationOldTarget = friend2State:queryRelation(Friend2DataTarget, RoleID),
	InteractionOldMine = friend2State:queryInteraction(Friend2DataMine, TargetRoleID),
	InteractionOldTarget = friend2State:queryInteraction(Friend2DataTarget, RoleID),
	TimeNow = time:getSyncUTCTimeFromDBS(),
	RelationNewMine =
		RelationOldMine#rec_friend2_relation{
			relation = ?RELATION_BLACK,
			closeness = 0,
			timeRelation = TimeNow,
			timeLastInteractive = TimeNow
		},
	RelationNewTarget =
		case RelationOldTarget#rec_friend2_relation.relation of
			?RELATION_BLACK ->
				RelationOldTarget;
			_ ->
				RelationOldTarget#rec_friend2_relation{
					relation = ?RELATION_NONE,
					closeness = 0,
					timeRelation = 0,
					timeLastInteractive = 0
				}
		end,
	%% 解除可能的被申请关系
	InteractionNewMine = ?DefaultValueOfInteraction(RoleID, TargetRoleID),
	InteractionNewTarget = ?DefaultValueOfInteraction(TargetRoleID, RoleID),
	%% 清除离线聊天记录
	ChatMsgNewMine = ?DefaultValueOfChatMsg(TargetRoleID),
	ChatMsgNewTarget = ?DefaultValueOfChatMsg(RoleID),
	friend2State:replaceChatMsg(RoleID, ChatMsgNewMine),
	friend2State:replaceChatMsg(TargetRoleID, ChatMsgNewTarget),
	%% 写数据
	DBOPT_R_A = friend2State:replaceRelation(RelationNewMine),
	DBOPT_R_B = friend2State:replaceRelation(RelationNewTarget),
	DBOPT_I_A = friend2State:replaceInteraction(InteractionNewMine),
	DBOPT_I_B = friend2State:replaceInteraction(InteractionNewTarget),
	filterInvalidDBMsg(friend2_dbsave, [
		{DBOPT_R_A, RelationNewMine},
		{DBOPT_R_B, RelationNewTarget},
		{DBOPT_I_A, InteractionNewMine},
		{DBOPT_I_B, InteractionNewTarget}
	]),
	%% 通知当前用户
	error_code(RoleID, {?ErrorCode_Friend2Ban_Success, [playerNameUID:getPlayerNameByUID(TargetRoleID)]}),
	continue(?CONTINUE_SyncBlackA, {RoleID, TargetRoleID}),   %% 影响黑名单变化
	%% 可能影响申请者名单变化
	case InteractionOldMine#rec_friend2_interaction.timeBeApply > 0 of
		true ->
			continue(?CONTINUE_SyncApplyA, {RoleID, TargetRoleID});
		_ ->
			skip
	end,
	case InteractionOldTarget#rec_friend2_interaction.timeBeApply > 0 of
		true ->
			continue(?CONTINUE_SyncApplyB, {RoleID, TargetRoleID});
		_ ->
			skip
	end,
	%% 可能影响好友、临时好友名单变化
	case RelationOldMine#rec_friend2_relation.relation of
		?RELATION_FORMAL ->
			core:sendMsgToActivity(?ActivityType_Date, date_breakFriend, RoleID),
			continue(?CONTINUE_SyncFormalAB, {RoleID, TargetRoleID});
		?RELATION_TEMP ->
			continue(?CONTINUE_SyncTempAB, {RoleID, TargetRoleID});
		_ ->
			skip
	end,
	modifyPlayerVariant(TargetRoleID, ?Setting_PlayerVarReadOnly_BeBlackCount, 1),
	ok;
continue(?CONTINUE_FreshInteraction, {RoleID, TargetRoleID}) ->
	%% 刷新好友的交互时间
	Friend2DataMine = friend2State:queryFriend2Data(RoleID),
	Friend2DataTarget = friend2State:queryFriend2Data(TargetRoleID),
	RelationOldMine = friend2State:queryRelation(Friend2DataMine, TargetRoleID),
	RelationOldTarget = friend2State:queryRelation(Friend2DataTarget, RoleID),
	TimeNow = time:getSyncUTCTimeFromDBS(),
	RelationNewMine =
		RelationOldMine#rec_friend2_relation{
			timeLastInteractive = TimeNow
		},
	RelationNewTarget =
		RelationOldTarget#rec_friend2_relation{
			timeLastInteractive = TimeNow
		},
	DBOPT_R_A = friend2State:replaceRelation(RelationNewMine),
	DBOPT_R_B = friend2State:replaceRelation(RelationNewTarget),
	filterInvalidDBMsg(friend2_dbsave, [
		{DBOPT_R_A, RelationNewMine},
		{DBOPT_R_B, RelationNewTarget}
	]),
	continue(?CONTINUE_SyncFormalAB, {RoleID, TargetRoleID}),   %% 影响好友名单变化
	ok;
continue(?CONTINUE_AddDoTemp, {RoleID, TargetRoleID}) ->
	%% 如果双方不是临时好友，且临时好友即将超过数量限制，则删除最陈旧的关系
	Friend2DataMineOld = friend2State:queryFriend2Data(RoleID),
	case friend2State:queryRelation(Friend2DataMineOld, TargetRoleID) of
		#rec_friend2_relation{relation = ?RELATION_TEMP} ->
			skip;
		_ ->
			#globalsetupCfg{setpara = [CountTempMax]} =
				getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = [0]}, friend2_temp_count),
			ListTempMine = friend2State:sortRelations(?RELATION_TEMP, RoleID),
			CountTempMine = erlang:length(ListTempMine),
			case CountTempMine + 1 >= CountTempMax andalso CountTempMine > 0 of
				true ->
					[TempRoleIDMine] = lists:nthtail(CountTempMine - 1, ListTempMine),
					continue(?CONTINUE_DelTemp, {RoleID, TempRoleIDMine});
				_ ->
					skip
			end,
			ListTempTarget = friend2State:sortRelations(?RELATION_TEMP, TargetRoleID),
			CountTempTarget = erlang:length(ListTempTarget),
			case CountTempTarget + 1 >= CountTempMax andalso CountTempTarget > 0 of
				true ->
					[TempRoleIDTarget] = lists:nthtail(CountTempTarget - 1, ListTempTarget),
					continue(?CONTINUE_DelTemp, {TargetRoleID, TempRoleIDTarget});
				_ ->
					skip
			end
	end,
	%% 建立临时好友关系（如果已经建立则单纯刷新时间）
	Friend2DataMine = friend2State:queryFriend2Data(RoleID),
	Friend2DataTarget = friend2State:queryFriend2Data(TargetRoleID),
	RelationOldMine = friend2State:queryRelation(Friend2DataMine, TargetRoleID),
	RelationOldTarget = friend2State:queryRelation(Friend2DataTarget, RoleID),
	TimeNow = time:getSyncUTCTimeFromDBS(),
	RelationNewMine =
		RelationOldMine#rec_friend2_relation{
			relation = ?RELATION_TEMP,
			closeness = 0,
			timeRelation = TimeNow,
			timeLastInteractive = TimeNow
		},
	RelationNewTarget =
		RelationOldTarget#rec_friend2_relation{
			relation = ?RELATION_TEMP,
			closeness = 0,
			timeRelation = TimeNow,
			timeLastInteractive = TimeNow
		},
	DBOPT_R_A = friend2State:replaceRelation(RelationNewMine),
	DBOPT_R_B = friend2State:replaceRelation(RelationNewTarget),
	filterInvalidDBMsg(friend2_dbsave, [
		{DBOPT_R_A, RelationNewMine},
		{DBOPT_R_B, RelationNewTarget}
	]),
	continue(?CONTINUE_SyncTempAB, {RoleID, TargetRoleID}),   %% 影响临时好友名单变化
	ok;
continue(?CONTINUE_AddDo, {RoleID, TargetRoleID}) ->
	%% 建立好友关系
	Friend2DataMine = friend2State:queryFriend2Data(RoleID),
	Friend2DataTarget = friend2State:queryFriend2Data(TargetRoleID),
	RelationOldMine = friend2State:queryRelation(Friend2DataMine, TargetRoleID),
	RelationOldTarget = friend2State:queryRelation(Friend2DataTarget, RoleID),
	TimeNow = time:getSyncUTCTimeFromDBS(),
	RelationNewMine =
		RelationOldMine#rec_friend2_relation{
			relation = ?RELATION_FORMAL,
			closeness = 0,
			timeRelation = TimeNow,
			timeLastInteractive = TimeNow
		},
	RelationNewTarget =
		RelationOldTarget#rec_friend2_relation{
			relation = ?RELATION_FORMAL,
			closeness = 0,
			timeRelation = TimeNow,
			timeLastInteractive = TimeNow
		},
	%% 清除可能的申请关系
	%InteractionOldMine = friend2State:queryInteraction(Friend2DataMine, TargetRoleID),
	%InteractionOldTarget = friend2State:queryInteraction(Friend2DataTarget, RoleID),
	InteractionNewMine = ?DefaultValueOfInteraction(RoleID, TargetRoleID),
	InteractionNewTarget = ?DefaultValueOfInteraction(TargetRoleID, RoleID),
	%% 写数据
	DBOPT_R_A = friend2State:replaceRelation(RelationNewMine),
	DBOPT_R_B = friend2State:replaceRelation(RelationNewTarget),
	DBOPT_I_A = friend2State:replaceInteraction(InteractionNewMine),
	DBOPT_I_B = friend2State:replaceInteraction(InteractionNewTarget),
	filterInvalidDBMsg(friend2_dbsave, [
		{DBOPT_R_A, RelationNewMine},
		{DBOPT_R_B, RelationNewTarget},
		{DBOPT_I_A, InteractionNewMine},
		{DBOPT_I_B, InteractionNewTarget}
	]),
	%% error_code形式的用户提示
	error_code(RoleID, {?ErrorCode_Friend2Add_Success, [playerNameUID:getPlayerNameByUID(TargetRoleID)]}),
	error_code(TargetRoleID, {?ErrorCode_Friend2Add_Success, [playerNameUID:getPlayerNameByUID(RoleID)]}),
	continue(?CONTINUE_SyncFormalAB, {RoleID, TargetRoleID}), %% 影响好友名单变化
	%% 可能影响申请者列表变化
	case DBOPT_I_A of
		?DBOPT_ERROR ->
			skip;
		_ ->
			continue(?CONTINUE_SyncApplyA, {RoleID, TargetRoleID})
	end,
	%% 可能影响临时好友名单变化
	case RelationOldMine#rec_friend2_relation.relation of
		?RELATION_TEMP ->
			continue(?CONTINUE_SyncTempAB, {RoleID, TargetRoleID});
		_ ->
			skip
	end,
	%% 用于客户端特殊处理
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{netPid = NetPid_A, pid = Pid_A} ->
			gsSendMsg:sendNetMsg(NetPid_A, #pk_GS2U_Friend2MakeFormal_Sync{id = TargetRoleID}),
			%% 成就系统：向角色发送添加成功消息
			psMgr:sendMsg2PS(Pid_A, achieve_addfriend, TargetRoleID);
		_ ->
			skip
	end,
	case core:queryOnLineRoleByRoleID(TargetRoleID) of
		#rec_OnlinePlayer{netPid = NetPid_B, pid = Pid_B} ->
			gsSendMsg:sendNetMsg(NetPid_B, #pk_GS2U_Friend2MakeFormal_Sync{id = RoleID}),
			%% 成就系统：向角色发送添加成功消息
			psMgr:sendMsg2PS(Pid_B, achieve_addfriend, RoleID);
		_ ->
			skip
	end,

	ok;
continue(?CONTINUE_AddApply, {RoleID, TargetRoleID}) ->
	%% 超过名单最大值时自动删除最古老的申请
	#globalsetupCfg{setpara = [CountApplicantMax]} =
		getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = [0]}, friend2_add_applicant_count),
	%Friend2DataMine = friend2State:queryFriend2Data(RoleID),
	Friend2DataTarget = friend2State:queryFriend2Data(TargetRoleID),
	ApplicantsTarget = friend2State:sortRelationsApplicant(Friend2DataTarget),
	MsgDel =
		case erlang:length(ApplicantsTarget) >= CountApplicantMax of
			true ->
				[OldestRoleID] = lists:nthtail(CountApplicantMax - 1, ApplicantsTarget),
				%InteractionOldest = friend2State:queryInteraction(Friend2DataTarget, OldestRoleID),
				InteractionOldest_ = ?DefaultValueOfInteraction(Friend2DataTarget, OldestRoleID),
				DBOPT_I_Oldest = friend2State:replaceInteraction(InteractionOldest_),
				[{DBOPT_I_Oldest, InteractionOldest_}];
			_ ->
				[]
		end,
	%% 添加本次申请
	InteractionOldTarget = friend2State:queryInteraction(Friend2DataTarget, RoleID),
	TimeNow = time:getSyncUTCTimeFromDBS(),
	InteractionNewTarget =
		InteractionOldTarget#rec_friend2_interaction{
			timeBeApply = TimeNow
		},
	%% 写数据
	DBOPT_I_B = friend2State:replaceInteraction(InteractionNewTarget),
	filterInvalidDBMsg(friend2_dbsave, [
		{DBOPT_I_B, InteractionNewTarget}
	] ++ MsgDel),
	%% 通知客户端
	error_code(RoleID, {?ErrorCode_Friend2Add_Wait, [playerNameUID:getPlayerNameByUID(TargetRoleID)]}),
	continue(?CONTINUE_SyncApplyB, {RoleID, TargetRoleID}), %% 同步申请者列表
	ok;
continue(?CONTINUE_DelFormal, {RoleID, TargetRoleID}) ->
	%% 解除好友关系并清除离线聊天记录
	Friend2DataMine = friend2State:queryFriend2Data(RoleID),
	#rec_friend2_relation{closeness = Closeness} =
		friend2State:queryRelation(Friend2DataMine, TargetRoleID),
	RelationNewMine = ?DefaultValueOfRelation(RoleID, TargetRoleID),
	RelationNewTarget = ?DefaultValueOfRelation(TargetRoleID, RoleID),
	ChatMsgNewMine = ?DefaultValueOfChatMsg(TargetRoleID),
	ChatMsgNewTarget = ?DefaultValueOfChatMsg(RoleID),
	%% 写数据
	DBOPT_R_A = friend2State:replaceRelation(RelationNewMine),
	DBOPT_R_B = friend2State:replaceRelation(RelationNewTarget),
	friend2State:replaceChatMsg(RoleID, ChatMsgNewMine),
	friend2State:replaceChatMsg(TargetRoleID, ChatMsgNewTarget),
	filterInvalidDBMsg(friend2_dbsave, [
		{DBOPT_R_A, RelationNewMine},
		{DBOPT_R_B, RelationNewTarget}
	]),
	%% 通知客户端
	error_code(RoleID, {?ErrorCode_Friend2Del_Success, [playerNameUID:getPlayerNameByUID(TargetRoleID)]}),
	continue(?CONTINUE_SyncFormalAB, {RoleID, TargetRoleID}), %% 同步好友列表
	core:sendMsgToActivity(?ActivityType_Date, date_breakFriend, RoleID),
	continue(?CONTINUE_DelFormalS, {RoleID, TargetRoleID}), %% 通知用户进程删除成功，用于后续处理是否要拉黑
	%% 记录亲密度变化日志（解除好友关系清零亲密度
	dbLog:sendSaveLogFriend(#rec_log_player_friend{
		roleID = RoleID,
		targetRoleID = TargetRoleID,
		oldCloseness = Closeness,
		newCloseness = 0,
		reason = ?ClosenessDelType_BreakF,
		isActive = 1,
		time = time:getLogTimeSec()
	}),
	dbLog:sendSaveLogFriend(#rec_log_player_friend{
		roleID = TargetRoleID,
		targetRoleID = RoleID,
		oldCloseness = Closeness,
		newCloseness = 0,
		reason = ?ClosenessDelType_BreakF,
		isActive = 0,
		time = time:getLogTimeSec()
	}),
	ok;
continue(?CONTINUE_DelTemp, {RoleID, TargetRoleID}) ->
	%% 解除临时好友关系并清除离线聊天记录（需要清除可能有的好友申请）
	Friend2DataMine = friend2State:queryFriend2Data(RoleID),
	Friend2DataTarget = friend2State:queryFriend2Data(TargetRoleID),
	RelationNewMine = ?DefaultValueOfRelation(RoleID, TargetRoleID),
	RelationNewTarget = ?DefaultValueOfRelation(TargetRoleID, RoleID),
	ChatMsgNewMine = ?DefaultValueOfChatMsg(TargetRoleID),
	ChatMsgNewTarget = ?DefaultValueOfChatMsg(RoleID),
	InteractionOldMine = friend2State:queryInteraction(Friend2DataMine, TargetRoleID),
	InteractionOldTarget = friend2State:queryInteraction(Friend2DataTarget, RoleID),
	InteractionNewMine = ?DefaultValueOfInteraction(RoleID, TargetRoleID),
	InteractionNewTarget = ?DefaultValueOfInteraction(TargetRoleID, RoleID),
	%% 写数据
	DBOPT_R_A = friend2State:replaceRelation(RelationNewMine),
	DBOPT_R_B = friend2State:replaceRelation(RelationNewTarget),
	DBOPT_I_A = friend2State:replaceInteraction(InteractionNewMine),
	DBOPT_I_B = friend2State:replaceInteraction(InteractionNewTarget),
	friend2State:replaceChatMsg(RoleID, ChatMsgNewMine),
	friend2State:replaceChatMsg(TargetRoleID, ChatMsgNewTarget),
	filterInvalidDBMsg(friend2_dbsave, [
		{DBOPT_R_A, RelationNewMine},
		{DBOPT_R_B, RelationNewTarget},
		{DBOPT_I_A, InteractionNewMine},
		{DBOPT_I_B, InteractionNewTarget}
	]),
	continue(?CONTINUE_SyncTempAB, {RoleID, TargetRoleID}), %% 同步临时好友列表
	%% 可能需要同步申请者列表
	case InteractionOldMine#rec_friend2_interaction.timeBeApply > 0 of
		true ->
			continue(?CONTINUE_SyncApplyA, {RoleID, TargetRoleID});
		_ ->
			skip
	end,
	case InteractionOldTarget#rec_friend2_interaction.timeBeApply > 0 of
		true ->
			continue(?CONTINUE_SyncApplyB, {RoleID, TargetRoleID});
		_ ->
			skip
	end,
	ok;
continue(?CONTINUE_DelBlack, {RoleID, TargetRoleID}) ->
	%% 解除黑名单关系（单向）
	RelationNewMine = ?DefaultValueOfRelation(RoleID, TargetRoleID),
	%% 写数据
	DBOPT_R_A = friend2State:replaceRelation(RelationNewMine),
	filterInvalidDBMsg(friend2_dbsave, [
		{DBOPT_R_A, RelationNewMine}
	]),
	%% 通知客户端
	error_code(RoleID, {?ErrorCode_Friend2Unban_Success, [playerNameUID:getPlayerNameByUID(TargetRoleID)]}),
	continue(?CONTINUE_SyncBlackA, {RoleID, TargetRoleID}), %% 同步黑名单列表
	%% 刷新被拉黑角色的计数
	modifyPlayerVariant(TargetRoleID, ?Setting_PlayerVarReadOnly_BeBlackCount, -1),
	ok;
continue(?CONTINUE_DelApply, {RoleID, TargetRoleID}) ->
	%% 解除申请者关系
	%Friend2DataMine = friend2State:queryFriend2Data(RoleID),
	%InteractionOldMine = friend2State:queryInteraction(Friend2DataMine, TargetRoleID),
	%TimeNow = time:getSyncUTCTimeFromDBS(),
	InteractionNewMine = ?DefaultValueOfInteraction(RoleID, TargetRoleID),
	%% 写数据
	DBOPT_I_A = friend2State:replaceInteraction(InteractionNewMine),
	filterInvalidDBMsg(friend2_dbsave, [
		{DBOPT_I_A, InteractionNewMine}
	]),
	continue(?CONTINUE_SyncApplyA, {RoleID, TargetRoleID}), %% 同步申请者列表
	ok.

%% 删除超时的好友申请
-spec tick_delApply() -> ok.
tick_delApply() ->
	TimeNow = time:getSyncUTCTimeFromDBS(),
	FunFind1 =
		fun(Friend2Data, Interactions1) ->
			ListApply = friend2State:sortRelationsApplicant(Friend2Data),
			ListApplyR = lists:reverse(ListApply),
			FunFind2 =
				fun(ID, {Mark, Interaction2}) ->
					Interaction = friend2State:queryInteraction(Friend2Data, ID),
					case TimeNow - Interaction#rec_friend2_interaction.timeBeApply >= ?ApplicantLife of
						true ->
							{Mark, [Interaction | Interaction2]};
						_ ->
							{true, Interaction2}
					end
				end,
			{_, Interaction2} = misc:foldlEx(FunFind2, {false, Interactions1}, ListApplyR),
			Interaction2
		end,
	Interactions = ets:foldl(FunFind1, [], ?EtsFriend2Data),
	FunDel =
		fun(InteractionOld, Msgs) ->
			InteractionNew = InteractionOld#rec_friend2_interaction{timeBeApply = 0},
			DBOPT = friend2State:replaceInteraction(InteractionNew),
			[{DBOPT, InteractionNew} | Msgs]
		end,
	Msgs = lists:foldl(FunDel, [], Interactions),
	filterInvalidDBMsg(friend2_dbsave, Msgs),
	ok.

%% 删除超时的离线聊天消息
-spec tick_delOfflineMsgs() -> ok.
tick_delOfflineMsgs() ->
	TimeNow = time:getSyncUTCTimeFromDBS(),
	FunReset1 =
		fun(#recFriend2Data{roleID = RoleID, chatMsgs = ChatMsgsOld}, ChatMsgsNewWithRoleID) ->
			FunReset2 =
				fun(#recFriend2Chat{chatMsgs = MsgsOld} = Rec, MsgsNewWithRoleID) ->
					FunFilter =
						fun(Data, Result) ->
							case Data of
								#pk_U2GS_Friend2FormalChat_Request{time = TimeC}
									when TimeNow - TimeC >= ?OfflineMsgLife ->
									Result;
								#pk_U2GS_Friend2FormalChatVoice_Request{time = TimeV}
									when TimeNow - TimeV >= ?OfflineMsgLife ->
									Result;
								_ ->
									[Data | Result]
							end
						end,
					MsgsNew = lists:foldl(FunFilter, [], lists:reverse(MsgsOld)),
					[{RoleID, Rec#recFriend2Chat{chatMsgs = MsgsNew}} | MsgsNewWithRoleID]
				end,
			lists:foldl(FunReset2, ChatMsgsNewWithRoleID, ChatMsgsOld)
		end,
	Msgs = ets:foldl(FunReset1, [], ?EtsFriend2Data),
	FunReset =
		fun({RoleID, Msg}) ->
			friend2State:replaceChatMsg(RoleID, Msg)
		end,
	lists:foreach(FunReset, Msgs),
	ok.

%% 获取指定角色的等级，返回为0时表示目标不存在
-spec getRoleLevel(RoleID::uint64()) -> uint().
getRoleLevel(RoleID) ->
	%% 优先从base_role获取即时信息
	case core:queryBaseRoleByRoleID(RoleID) of
		#rec_base_role{level = LevelB} ->
			LevelB;
		_ ->
			%% 否则从roleKeyInfo获取具有延时的信息
			case core:queryRoleKeyInfoByRoleID(RoleID) of
				#?RoleKeyRec{level = LevelK} ->
					LevelK;
				_ ->
					?ERROR_OUT("getRoleLevel can not find RoleID(~p) from core:queryRoleKeyInfoByRoleID/1~n~p", [RoleID, misc:getStackTrace()]),
					0
			end
	end.

%% 修改用户变量
%% 并发送给在线玩家进程处理
-spec modifyPlayerVariant(RoleID::uint64(), VariantIndex::uint(), DeltaValue::int32()) -> int32().
modifyPlayerVariant(RoleID, VariantIndex, DeltaValue) ->
	VariantValue = variant:getPlayerVariant(RoleID, VariantIndex),
	ValueNew = VariantValue + DeltaValue,
	?DEBUG_OUT("[DebugForFriend2] modifyPlayerVariant RoleID(~p) VariantIndex(~p) VariantValue(~p) DeltaValue(~p)", [RoleID, VariantIndex, VariantValue, DeltaValue]),
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{pid = Pid} ->
			psMgr:sendMsg2PS(Pid, friend2_modifyVariant, {VariantIndex, ValueNew});
		_ ->
			variant:setPlayerVariant(RoleID, VariantIndex, ValueNew)
	end,
	ValueNew.
