%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20161115
%%%-------------------------------------------------------------------
-module(friend2State).
-author("meitianyang").

-include("friend2Private.hrl").

%% API
-export([
	queryFriend2Data/1,
	queryRelation/2,
	queryRelations/2,
	queryInteraction/2,
	queryChatMsg/2,
	queryUnGainAP/1,
	sortRelations/2,
	sortRelationsForMarriage/2,
	sortRelationsApplicant/1,
	isBlack/2,
	beBlackCount/1,
	isFriend/2
]).
-export([
	replaceFriend2Data/1,
	replaceRelation/1,
	replaceInteraction/1,
	replaceChatMsg/2
]).

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%% 任意进程可用的读取数据接口 begin

%% 查询总体信息
-spec queryFriend2Data(RoleID::uint64()) -> Friend2Data::#recFriend2Data{}.
queryFriend2Data(RoleID) ->
	case ets:lookup(?EtsFriend2Data, RoleID) of
		[#recFriend2Data{} = Rec] ->
			Rec;
		_ ->
			?DefaultValueOfFriend2Data(RoleID)
	end.

%% 查询双方关系
-spec queryRelation(Friend2Data::#recFriend2Data{}, TargetRoleID::uint64()) -> Realtion::#rec_friend2_relation{}.
queryRelation(Friend2Data, TargetRoleID) ->
	FunQuery =
		fun(#rec_friend2_relation{targetRoleID = TargetRoleID_} = Rec, {Mark, Result}) ->
			case TargetRoleID_ of
				TargetRoleID ->
					{true, Rec};
				_ ->
					{Mark, Result}
			end
		end,
	Relations = Friend2Data#recFriend2Data.relations,
	RelationDefault = ?DefaultValueOfRelation(Friend2Data#recFriend2Data.roleID, TargetRoleID),
	{_, Relation} = misc:foldlEx(FunQuery, {false, RelationDefault}, Relations),
	Relation.

%% 查询指定关系列表
-spec queryRelations(RelationsIn::[#rec_friend2_relation{}, ...], RelationType::type_relation()) -> RelationsOut::[#rec_friend2_relation{}, ...].
queryRelations(RelationsIn, RelationType) ->
	FunQuery =
		fun(#rec_friend2_relation{relation = RelationType_} = Rec, Result) ->
			case RelationType_ of
				RelationType ->
					[Rec | Result];
				_ ->
					Result
			end
		end,
	lists:foldl(FunQuery, [], RelationsIn).

%% 查询双方交互
-spec queryInteraction(Friend2Data::#recFriend2Data{}, TargetRoleID::uint64()) -> Interaction::#rec_friend2_interaction{}.
queryInteraction(Friend2Data, TargetRoleID) ->
	FunQuery =
		fun(#rec_friend2_interaction{targetRoleID = TargetRoleID_} = Rec, {Mark, Result}) ->
			case TargetRoleID_ of
				TargetRoleID ->
					{true, Rec};
				_ ->
					{Mark, Result}
			end
		end,
	Interactions = Friend2Data#recFriend2Data.interactions,
	InterationDefault = ?DefaultValueOfInteraction(Friend2Data#recFriend2Data.roleID, TargetRoleID),
	{_, Interaction} = misc:foldlEx(FunQuery, {false, InterationDefault}, Interactions),
	Interaction.

%% 查询聊天信息
-spec queryChatMsg(Friend2Data::#recFriend2Data{}, TargetRoleID::uint64()) -> ChatMsg::#recFriend2Chat{}.
queryChatMsg(Friend2Data, TargetRoleID) ->
	FunQuery =
		fun(#recFriend2Chat{targetRoleID = TargetRoleID_} = Rec, {Mark, Result}) ->
			case TargetRoleID_ of
				TargetRoleID ->
					{true, Rec};
				_ ->
					{Mark, Result}
			end
		end,
	ChatMsgs = Friend2Data#recFriend2Data.chatMsgs,
	ChatMsgDefault = ?DefaultValueOfChatMsg(TargetRoleID),
	{_, ChatMsg} = misc:foldlEx(FunQuery, {false, ChatMsgDefault}, ChatMsgs),
	ChatMsg.

%% 查询是否有未领取的行动点（体力值）
-spec queryUnGainAP(Friend2Data::#recFriend2Data{}) -> boolean().
queryUnGainAP(Friend2Data) ->
	FunQuery =
		fun(#rec_friend2_relation{roleID = RoleID, targetRoleID = TargetRoleID, relation = Relation}, {_, _}) ->
			case Relation of
				?RELATION_FORMAL ->
					IsBeGive = daily2State:queryDaily2(TargetRoleID, RoleID, ?Daily2Type_S_Friend2GiveAP),
					IsGain = daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_Friend2GainAP),
					{IsGain < IsBeGive, 0};
				_ ->
					{false, 0}
			end
		end,
	Relations = Friend2Data#recFriend2Data.relations,
	{Result, _} = misc:foldlEx(FunQuery, {false, 0}, Relations),
	Result.

%% 获取排序后的好友列表
-spec sortRelations(RelationType::type_relation(), RoleID::uint64()) -> ListTargetRoleID::[uint64(), ...].
sortRelations(?RELATION_TEMP, RoleID) ->
	Friend2Data = queryFriend2Data(RoleID),
	Relations = queryRelations(Friend2Data#recFriend2Data.relations, ?RELATION_TEMP),
	List1 = createSortHelper(Relations),
	List2 = lists:sort(fun(A, B) -> sort(A, B) end, List1),
	%?DEBUG_OUT("[DebugForFriend2] sortRelations temp RoleID(~p)~n~p", [RoleID, List2]),
	sortHelperToRoleID(List2);
sortRelations(?RELATION_FORMAL, RoleID) ->
	Friend2Data = queryFriend2Data(RoleID),
	Relations = queryRelations(Friend2Data#recFriend2Data.relations, ?RELATION_FORMAL),
	List1 = createSortHelper(Relations),
	List2 = lists:sort(fun(A, B) -> sort(A, B) end, List1),
	%?DEBUG_OUT("[DebugForFriend2] sortRelations formal RoleID(~p)~n~p", [RoleID, List2]),
	sortHelperToRoleID(List2);
sortRelations(?RELATION_BLACK, RoleID) ->
	Friend2Data = queryFriend2Data(RoleID),
	Relations = queryRelations(Friend2Data#recFriend2Data.relations, ?RELATION_BLACK),
	%% 黑名单只需要按结成关系时间降序排序
	FunCeateSortHelper =
		fun(#rec_friend2_relation{timeRelation = A}, #rec_friend2_relation{timeRelation = B}) ->
			A < B
		end,
	List1 = lists:sort(FunCeateSortHelper, Relations),
	FunRelationToRoleID =
		fun(#rec_friend2_relation{targetRoleID = ID}, Result) ->
			[ID | Result]
		end,
	List2 = lists:foldl(FunRelationToRoleID, [], List1),
	%?DEBUG_OUT("[DebugForFriend2] sortRelations black RoleID(~p)~n~p", [RoleID, List2]),
	List2;
	%%lists:reverse(List2);
sortRelations(InvalidType, RoleID) ->
	?ERROR_OUT("sortRelations invalid argument ~p~n~p", [{InvalidType, RoleID}, misc:getStackTrace()]),
	[].

%% 获取排序后的好友列表（姻缘系统专供，排序方式与好友系统不同，仅支持正式好友）
-spec sortRelationsForMarriage(RelationType::type_relation(), RoleID::uint64()) -> ListTargetRoleID::[uint64(), ...].
sortRelationsForMarriage(?RELATION_FORMAL, RoleID) ->
	Friend2Data = queryFriend2Data(RoleID),
	Relations = queryRelations(Friend2Data#recFriend2Data.relations, ?RELATION_FORMAL),
	#globalsetupCfg{setpara = [IsCoupleSame]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [0]},
			marriage_iscouplesame
		),
	#mainMenuCfg{parameters = LevelMin} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_mainMenu,
			#mainMenuCfg{parameters = 35},
			47 %% 对应婚姻
		),
	case core:queryRoleKeyInfoByRoleID(RoleID) of
		#?RoleKeyRec{sex = MySex, level = LevelMine} when LevelMine >= LevelMin ->
			FunFilter =
				fun(#rec_friend2_relation{targetRoleID = TargetRoleID} = Rec, R) ->
					case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
						#?RoleKeyRec{sex = Sex, level = LevelTarget}
							when (Sex =/= MySex orelse IsCoupleSame =:= 1) andalso
							LevelTarget >= LevelMin ->
							[Rec | R];
						_ ->
							R
					end
				end,
			RelationsReal = lists:foldl(FunFilter, [], Relations),
			List1 = createSortHelper(RelationsReal),
			List2 = lists:sort(fun(A, B) -> sortForMarriage(A, B) end, List1),
			sortHelperToRoleID(List2);
		_ ->
			[]
	end;
sortRelationsForMarriage(InvalidType, RoleID) ->
	?ERROR_OUT("sortRelationsForMarriage invalid argument ~p~n~p", [{InvalidType, RoleID}, misc:getStackTrace()]),
	[].

%% 获取排序后的申请者列表
-spec sortRelationsApplicant(Friend2Data::#recFriend2Data{}) -> ListTargetRoleID::[uint64(), ...].
sortRelationsApplicant(Friend2Data) ->
	Interactions = Friend2Data#recFriend2Data.interactions,
	%% 申请者列表只按申请时间降序排序
	FunCeateSortHelper =
		fun(#rec_friend2_interaction{timeBeApply = A}, #rec_friend2_interaction{timeBeApply = B}) ->
			A < B
		end,
	List1 = lists:sort(FunCeateSortHelper, Interactions),
	FunInteractionToRoleID =
		fun(#rec_friend2_interaction{targetRoleID = ID}, Result) ->
			[ID | Result]
		end,
	List2 = lists:foldl(FunInteractionToRoleID, [], List1),
	%?DEBUG_OUT("[DebugForFriend2] sortRelations apply RoleID(~p)~n~p", [Friend2Data#recFriend2Data.roleID, List2]),
	List2.
	%%lists:reverse(List2).

%% 是否是拉黑关系
-spec isBlack(RoleID::uint64(), TargetRoleID::uint64()) -> boolean().
isBlack(RoleID, TargetRoleID) ->
	Friend2Data = queryFriend2Data(RoleID),
	case queryRelation(Friend2Data, TargetRoleID) of
		#rec_friend2_relation{relation = ?RELATION_BLACK} ->
			true;
		_ ->
			false
	end.

%% 获取被拉黑总次数
-spec beBlackCount(RoleID::uint64()) -> uint().
beBlackCount(RoleID) ->
	FunCount =
		fun(Friend2Data, Count) ->
			case friend2State:queryRelation(Friend2Data, RoleID) of
				#rec_friend2_relation{relation = ?RELATION_BLACK} ->
					Count + 1;
				_ ->
					Count
			end
		end,
	ets:foldl(FunCount, 0, ?EtsFriend2Data).

%% 是否是好友
-spec isFriend(RoleID::uint64(), TargetRoleID::uint64()) -> boolean().
isFriend(RoleID, TargetRoleID) ->
	Friend2Data = queryFriend2Data(RoleID),
	case queryRelation(Friend2Data, TargetRoleID) of
		#rec_friend2_relation{relation = ?RELATION_FORMAL} ->
			true;
		_ ->
			false
	end.

%% 任意进程可用的读取数据接口 end
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%% 限定本进程操作的写入数据接口 begin

%% 覆写总体信息
-spec replaceFriend2Data(Friend2Data::#recFriend2Data{}) -> DBOPT::type_dbopt().
replaceFriend2Data(Friend2Data) ->
	RoleID = Friend2Data#recFriend2Data.roleID,
	Friend2DataOld = queryFriend2Data(RoleID),
	Friend2DataDefault = ?DefaultValueOfFriend2Data(RoleID),
	DBOPT = createDBOPT(Friend2Data, Friend2DataOld, Friend2DataDefault),
	case DBOPT of
		?DBOPT_ERROR ->
			skip;
		?DBOPT_INSERT ->
			ets:insert(?EtsFriend2Data, Friend2Data);
		?DBOPT_DELETE ->
			ets:delete(?EtsFriend2Data, RoleID);
		?DBOPT_UPDATE ->
			ets:insert(?EtsFriend2Data, Friend2Data)
	end,
	DBOPT.

%% 覆写关系
-spec replaceRelation(Relation::#rec_friend2_relation{}) -> DBOPT::type_dbopt().
replaceRelation(Relation) ->
	RoleID = Relation#rec_friend2_relation.roleID,
	TargetRoleID = Relation#rec_friend2_relation.targetRoleID,
	RelationDefault = ?DefaultValueOfRelation(RoleID, TargetRoleID),
	Friend2DataOld = queryFriend2Data(RoleID),
	RelationOld = queryRelation(Friend2DataOld, TargetRoleID),
	DBOPT = createDBOPT(Relation, RelationOld, RelationDefault),
	RelationsOld = Friend2DataOld#recFriend2Data.relations,
	Friend2DataDefualt = ?DefaultValueOfFriend2Data(RoleID),
	case DBOPT of
		?DBOPT_ERROR ->
			skip;
		?DBOPT_INSERT ->
			case Friend2DataDefualt of
				Friend2DataOld ->
					%% 不存在上级数据，完全插入
					ets:insert(?EtsFriend2Data, Friend2DataDefualt#recFriend2Data{relations = [Relation]});
				_ ->
					%% 存在上级数据，改写式插入
					ets:update_element(?EtsFriend2Data, RoleID, {#recFriend2Data.relations, [Relation | RelationsOld]})
			end;
		?DBOPT_DELETE ->
			FunDelete =
				fun(#rec_friend2_relation{targetRoleID = TargetRoleID_} = Rec, Result) ->
					case TargetRoleID_ of
						TargetRoleID ->
							Result;
						_ ->
							[Rec | Result]
					end
				end,
			RelationsNew = lists:foldl(FunDelete, [], RelationsOld),
			case Friend2DataOld#recFriend2Data{relations = RelationsNew} of
				Friend2DataDefualt ->
					%% 删成了空架子，直接删除上级数据
					ets:delete(?EtsFriend2Data, RoleID);
				_ ->
					%% 仅删除局部数据
					ets:update_element(?EtsFriend2Data, RoleID, {#recFriend2Data.relations, RelationsNew})
			end;
		?DBOPT_UPDATE ->
			FunUpdate =
				fun(#rec_friend2_relation{targetRoleID = TargetRoleID_} = Rec, Result) ->
					case TargetRoleID_ of
						TargetRoleID ->
							[Relation | Result];
						_ ->
							[Rec | Result]
					end
				end,
			ets:update_element(?EtsFriend2Data, RoleID, {#recFriend2Data.relations, lists:foldl(FunUpdate, [], RelationsOld)})
	end,
	DBOPT.

%% 覆写交互
-spec replaceInteraction(Interaction::#rec_friend2_interaction{}) -> DBOPT::type_dbopt().
replaceInteraction(Interaction) ->
	RoleID = Interaction#rec_friend2_interaction.roleID,
	TargetRoleID = Interaction#rec_friend2_interaction.targetRoleID,
	InteractionDefault = ?DefaultValueOfInteraction(RoleID, TargetRoleID),
	Friend2DataOld = queryFriend2Data(RoleID),
	InteractionOld = queryInteraction(Friend2DataOld, TargetRoleID),
	DBOPT = createDBOPT(Interaction, InteractionOld, InteractionDefault),
	InteractionsOld = Friend2DataOld#recFriend2Data.interactions,
	Friend2DataDefualt = ?DefaultValueOfFriend2Data(RoleID),
	case DBOPT of
		?DBOPT_ERROR ->
			skip;
		?DBOPT_INSERT ->
			case Friend2DataDefualt of
				Friend2DataOld ->
					%% 不存在上级数据，完全插入
					ets:insert(?EtsFriend2Data, Friend2DataDefualt#recFriend2Data{interactions = [Interaction]});
				_ ->
					%% 存在上级数据，改写式插入
					ets:update_element(?EtsFriend2Data, RoleID, {#recFriend2Data.interactions, [Interaction | InteractionsOld]})
			end;
		?DBOPT_DELETE ->
			FunDelete =
				fun(#rec_friend2_interaction{targetRoleID = TargetRoleID_} = Rec, Result) ->
					case TargetRoleID_ of
						TargetRoleID ->
							Result;
						_ ->
							[Rec | Result]
					end
				end,
			InteractionsNew = lists:foldl(FunDelete, [], InteractionsOld),
			case Friend2DataOld#recFriend2Data{relations = InteractionsNew} of
				Friend2DataDefualt ->
					%% 删成了空架子，直接删除上级数据
					ets:delete(?EtsFriend2Data, RoleID);
				_ ->
					%% 仅删除局部数据
					ets:update_element(?EtsFriend2Data, RoleID, {#recFriend2Data.interactions, InteractionsNew})
			end;
		?DBOPT_UPDATE ->
			FunUpdate =
				fun(#rec_friend2_interaction{targetRoleID = TargetRoleID_} = Rec, Result) ->
					case TargetRoleID_ of
						TargetRoleID ->
							[Interaction | Result];
						_ ->
							[Rec | Result]
					end
				end,
			ets:update_element(?EtsFriend2Data, RoleID, {#recFriend2Data.interactions, lists:foldl(FunUpdate, [], InteractionsOld)})
	end,
	DBOPT.

%% 覆写聊天消息
-spec replaceChatMsg(RoleID::uint64(), ChatMsg::#recFriend2Chat{}) -> DBOPT::type_dbopt().
replaceChatMsg(RoleID, ChatMsg) ->
	TargetRoleID = ChatMsg#recFriend2Chat.targetRoleID,
	ChatMsgDefault = ?DefaultValueOfChatMsg(TargetRoleID),
	Friend2DataOld = queryFriend2Data(RoleID),
	ChatMsgOld = queryChatMsg(Friend2DataOld, TargetRoleID),
	DBOPT = createDBOPT(ChatMsg, ChatMsgOld, ChatMsgDefault),
	ChatMsgsOld = Friend2DataOld#recFriend2Data.chatMsgs,
	Friend2DataDefualt = ?DefaultValueOfFriend2Data(RoleID),
	case DBOPT of
		?DBOPT_ERROR ->
			skip;
		?DBOPT_INSERT ->
			case Friend2DataDefualt of
				Friend2DataOld ->
					%% 不存在上级数据，完全插入
					ets:insert(?EtsFriend2Data, Friend2DataDefualt#recFriend2Data{chatMsgs = [ChatMsg]});
				_ ->
					%% 存在上级数据，改写式插入
					ets:update_element(?EtsFriend2Data, RoleID, {#recFriend2Data.chatMsgs, [ChatMsg | ChatMsgsOld]})
			end;
		?DBOPT_DELETE ->
			FunDelete =
				fun(#recFriend2Chat{targetRoleID = TargetRoleID_} = Rec, Result) ->
					case TargetRoleID_ of
						TargetRoleID ->
							Result;
						_ ->
							[Rec | Result]
					end
				end,
			ChatMsgsNew = lists:foldl(FunDelete, [], ChatMsgsOld),
			case Friend2DataOld#recFriend2Data{relations = ChatMsgsNew} of
				Friend2DataDefualt ->
					%% 删成了空架子，直接删除上级数据
					ets:delete(?EtsFriend2Data, RoleID);
				_ ->
					%% 仅删除局部数据
					ets:update_element(?EtsFriend2Data, RoleID, {#recFriend2Data.chatMsgs, ChatMsgsNew})
			end;
		?DBOPT_UPDATE ->
			FunUpdate =
				fun(#recFriend2Chat{targetRoleID = TargetRoleID_} = Rec, Result) ->
					case TargetRoleID_ of
						TargetRoleID ->
							[ChatMsg | Result];
						_ ->
							[Rec | Result]
					end
				end,
			ets:update_element(?EtsFriend2Data, RoleID, {#recFriend2Data.chatMsgs, lists:foldl(FunUpdate, [], ChatMsgsOld)})
	end,
	DBOPT.

%% 限定本进程操作的写入数据接口 end
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%% 本进程适用辅助函数 begin

%% 本进程适用辅助函数 end
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%% 本模块适用辅助函数 begin

%% 判断修改类型
-spec createDBOPT(New::term(), Old::term(), Default::term()) -> DBOPT::type_dbopt().
createDBOPT(New, Old, Default) ->
	case Old of
		New ->
			%% 数据无变化，不予改动
			%% 包括了“已存在原始数据且数据无变化”和“不存在原始数据且传入数据为默认值”的两种情况）
			?DBOPT_ERROR;
		Default ->
			%% 不存在原始数据，需要执行插入操作
			?DBOPT_INSERT;
		_ ->
			case New of
				Default ->
					%% 存在原始数据，传入值是默认值，需要执行删除操作
					?DBOPT_DELETE;
				_ ->
					%% 存在原始数据，传入值不是默认值，需要执行修改操作
					?DBOPT_UPDATE
			end
	end.

%% 排序前生成排序键值
-spec createSortHelper(Relations::[#rec_friend2_relation{}, ...]) -> Helpers::[#recSortHelper{}, ...].
createSortHelper(Relastions) ->
	FunCreate =
		fun(#rec_friend2_relation{
			targetRoleID = TargetRoleID,
			closeness = Closeness,
			timeRelation = TimeRelation,
			timeLastInteractive = TimeLastInteractive
		}, Result) ->
			Code =
				case core:queryOnLineRoleByRoleID(TargetRoleID) of
					#rec_OnlinePlayer{code = Code_} ->
						Code_;
					_ ->
						0
				end,
			%% 优先取用base_role的数据，没有时使用roleKeyInfo的数据
			{Level, TimeLastOnline} =
				case core:queryBaseRoleByRoleID(TargetRoleID) of
					#rec_base_role{level = LevelB, lastLogoutTime = TimeLastOnlineB} ->
						{LevelB, time:dateTimeToInt64(TimeLastOnlineB) - ?SECS_FROM_0_TO_1970};
					_ ->
						case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
							#?RoleKeyRec{level = LevelK, offlineTime = TimeLastOnlineK} ->
								{LevelK, TimeLastOnlineK - ?SECS_FROM_0_TO_1970 - time2:getTimezoneSec()};
							_ ->
								?ERROR_OUT("createSortHelper can not find TargetRoleID(~p) from core:queryRoleKeyInfoByRoleID/1", [TargetRoleID]),
								{0, 0}
						end
				end,
			[
				#recSortHelper{
					targetRoleID = TargetRoleID,
					isOnline = Code > 0,
					level = Level,
					closeness = Closeness,
					timeRelation = TimeRelation,
					timeLastOnline = TimeLastOnline,
					timeLastInteractive = TimeLastInteractive
				} |
				Result
			]
		end,
	lists:foldl(FunCreate, [], Relastions).

%% 较为普遍的排序方法，适用于临时好友、正式好友
-spec sort(DataA::#recSortHelper{}, DataB::#recSortHelper{}) -> boolean().
sort(
		#recSortHelper{
			isOnline = IsOnline_A,                      %% 1
			level = Level_A,                            %% 6
			closeness = Closeness_A,                    %% 4
			timeRelation = TimeRelation_A,            	%% 5
			timeLastOnline = TimeLastOnline_A,          %% 3
			timeLastInteractive = TimeLastInteractive_A %% 2
		},
		#recSortHelper{
			isOnline = IsOnline_B,
			level = Level_B,
			closeness = Closeness_B,
			timeRelation = TimeRelation_B,
			timeLastOnline = TimeLastOnline_B,
			timeLastInteractive = TimeLastInteractive_B
		}) ->
	if
		IsOnline_A =:= IsOnline_B ->
			if
				TimeLastInteractive_A =:= TimeLastInteractive_B ->
					if
						TimeLastOnline_A =:= TimeLastOnline_B ->
							if
								Closeness_A =:= Closeness_B ->
									if
										TimeRelation_A =:= TimeRelation_B ->
											if
												Level_A =:= Level_B ->
													false;
												true ->
													Level_A > Level_B
											end;
										true ->
											TimeRelation_A < TimeRelation_B
									end;
								true ->
									Closeness_A > Closeness_B
							end;
						true ->
							TimeLastOnline_A > TimeLastOnline_B
					end;
				true ->
					TimeLastInteractive_A < TimeLastInteractive_B
			end;
		true ->
			IsOnline_A
	end.

%% 姻缘系统专供排序
-spec sortForMarriage(DataA::#recSortHelper{}, DataB::#recSortHelper{}) -> boolean().
sortForMarriage(
		#recSortHelper{
			isOnline = IsOnline_A,                      %% 1
			level = Level_A,                            %% 6
			closeness = Closeness_A,                    %% 2
			timeRelation = TimeRelation_A,            	%% 5
			timeLastOnline = TimeLastOnline_A,          %% 4
			timeLastInteractive = TimeLastInteractive_A %% 3
		},
		#recSortHelper{
			isOnline = IsOnline_B,
			level = Level_B,
			closeness = Closeness_B,
			timeRelation = TimeRelation_B,
			timeLastOnline = TimeLastOnline_B,
			timeLastInteractive = TimeLastInteractive_B
		}) ->
	if
		IsOnline_A =:= IsOnline_B ->
			if
				Closeness_A =:= Closeness_B ->
					if
						TimeLastInteractive_A =:= TimeLastInteractive_B ->
							if
								TimeLastOnline_A =:= TimeLastOnline_B ->
									if
										TimeRelation_A =:= TimeRelation_B ->
											if
												Level_A =:= Level_B ->
													false;
												true ->
													Level_A > Level_B
											end;
										true ->
											TimeRelation_A < TimeRelation_B
									end;
								true ->
									TimeLastOnline_A < TimeLastOnline_B
							end;
						true ->
							TimeLastInteractive_A < TimeLastInteractive_B
					end;
				true ->
					Closeness_A > Closeness_B
			end;
		true ->
			IsOnline_A
	end.

%% 将辅助排序的结构提取为角色ID
-spec sortHelperToRoleID(Helpers::[#recSortHelper{}, ...]) -> [uint64(), ...].
sortHelperToRoleID(Helpers) ->
	ListTemp =
		lists:foldl(
			fun(#recSortHelper{targetRoleID = ID}, Result) ->
				[ID | Result]
			end,
			[],
			Helpers
		),
	lists:reverse(ListTemp).

%% 本模块适用辅助函数 end
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------


