%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20161115
%%%-------------------------------------------------------------------

-module(playerFriend2).
-include("playerPrivate.hrl").
-include("../friend2/friend2Private.hrl").

-export([
	error_code/1,
	relationAck/1,
	simple/1,
	search/1,
	recommend/2,
	applyOneKey/1,
	refuse/1,
	add/1,
	addFromBlack/1,
	del/1,
	addTemp/1,
	delTemp/1,
	ban/2,
	banWithUnban/2,
	banWithUnbanAndDel/2,
	unban/1,
	agreeApply/1,
	queryList_Temp/1,
	queryList_Formal/1,
	queryList_Black/1,
	queryList_Applicant/1,
	queryList_FormalForMarriage/1,
	chat/1,
	sendOfflineMsg/0,
	formalOP/2,
	modifyVariant/1,
	%maybeBeBan/0,
	closenessAdd/4,
	queryLike/1,
	deleteRole/1,
	forLook/1,
	wantChat/1
]).

%%% ====================================================================
%%% API functions
%%% ====================================================================

%% 异常码处理
-spec error_code({
	ErrorCode::uint(),
	Param::list()
}) ->
	ok.
error_code({0, []}) ->
	ok;
error_code({ErrorCode, Param}) ->
	%?DEBUG_OUT("[DebugForFriend2] error_code ~p", [{ErrorCode, Param}]),
	case Param of
		[] ->
			playerMsg:sendErrorCodeMsg(ErrorCode);
		_ ->
			playerMsg:sendErrorCodeMsg(ErrorCode, Param)
	end,
	ok.

%% relationAck
-spec relationAck({Continue::type_continue(), TargetRoleID::uint64()}) -> ok.
relationAck({?CONTINUE_AddFromBlackAsk, TargetRoleID}) ->
	playerMsg:sendNetMsg(
		#pk_GS2U_Friend2AddFromBlack_Ask{
			id = TargetRoleID,
			name = playerNameUID:getPlayerNameByUID(TargetRoleID)
		}
	),
	ok;
relationAck({?CONTINUE_BanFromFormal, TargetRoleID}) ->
	MsgFromFormal =
		#pk_GS2U_Friend2BanFromFormal_Ask{
			id = TargetRoleID,
			name = playerNameUID:getPlayerNameByUID(TargetRoleID)
		},
	playerMsg:sendNetMsg(MsgFromFormal),
	ok;
relationAck({?CONTINUE_BanWithUnBan, _}) ->
	RoleID = playerState:getRoleID(),
	ListBlack = friend2State:sortRelations(?RELATION_BLACK, RoleID),
	[BlackRoleID] = lists:nthtail(erlang:length(ListBlack) - 1, ListBlack),
	MsgWithUnBan =
		#pk_GS2U_Friend2BanWithUnban_Ask{
			id = BlackRoleID,
			name = playerNameUID:getPlayerNameByUID(BlackRoleID)
		},
	playerMsg:sendNetMsg(MsgWithUnBan),
	ok;
relationAck({?CONTINUE_BanWithUnBanAndDel, TargetRoleID}) ->
	RoleID = playerState:getRoleID(),
	ListBlack = friend2State:sortRelations(?RELATION_BLACK, RoleID),
	[BlackRoleID] = lists:nthtail(erlang:length(ListBlack) - 1, ListBlack),
	MsgWithUnBanAndDel =
		#pk_GS2U_Friend2BanWithUnbanAndDel_Ask{
			idUnban = BlackRoleID,
			nameUnban = playerNameUID:getPlayerNameByUID(BlackRoleID),
			idDel = TargetRoleID,
			nameDel = playerNameUID:getPlayerNameByUID(TargetRoleID)
		},
	playerMsg:sendNetMsg(MsgWithUnBanAndDel),
	ok;
relationAck({?CONTINUE_DelFormalS, TargetRoleID}) ->
	List = playerState2:getFriend2WantBanFormal(),
	case lists:keyfind(TargetRoleID, 1, List) of
		false ->
			skip;
		_ ->
			ListNew = lists:keydelete(TargetRoleID, 1, List),
			playerState2:setFriend2WantBanFormal(ListNew),
			ban(TargetRoleID, false)
	end,
	ok.

%% 请求精简信息 0正式好友1临时好友2黑名单3申请列表
-spec simple(Type::uint8()) -> ok.
simple(Type) ->
	%?DEBUG_OUT("[DebugForFriend2] Type(~p)", [Type]),
	RoleID = playerState:getRoleID(),
	ListID =
		case Type of
			0 ->
				friend2State:sortRelations(?RELATION_FORMAL, RoleID);
			1 ->
				friend2State:sortRelations(?RELATION_TEMP, RoleID);
			2 ->
				friend2State:sortRelations(?RELATION_BLACK, RoleID);
			3 ->
				Friend2Data = friend2State:queryFriend2Data(RoleID),
				friend2State:sortRelationsApplicant(Friend2Data);
			_ ->
				skip
		end,
	%?DEBUG_OUT("[DebugForFriend2] ~p", [ListID]),
	case erlang:is_list(ListID) of
		true ->
			FunCreateInfoWithByte =
				fun(ID, List) ->
					Info = createInfoSimple(ID),
					% 此处只是想要获取字符串占用的空间，对于erlang建议的替换为unicode:characters_to_binary/1是不可行的，如有必要可以自行遍历检测
					%{_, NameBin} = unicode:characters_to_binary(Info#pk_Friend2InfoSimple.name),
					{_, NameBin} = asn1rt:utf8_list_to_binary(Info#pk_Friend2InfoSimple.name),
					Byte = 8 + erlang:size(NameBin) + 2 + 1 + 1 + 1,  %% 注意：需要与pk_Friend2InfoSimple结构同步
					[{Byte, Info} | List]
				end,
			ListInfoWithByte = lists:foldl(FunCreateInfoWithByte, [], ListID),
			FunSplit =
				fun({Byte, Info}, {ByteCounter, Msg, Msgs}) ->
					case ByteCounter + Byte >= 8000 of
						true ->
							{Byte, [Info], [Msg | Msgs]};
						_ ->
							{Byte + ByteCounter, [Info | Msg], Msgs}
					end
				end,
			{ByteLeft, MsgLeft, Msgs} = lists:foldl(FunSplit, {0, [], []}, ListInfoWithByte),
			{Count, MsgsAll} =
				case ByteLeft > 0 of
					true ->
						{erlang:length(Msgs) + 1, [MsgLeft | Msgs]};
					_ ->
						{erlang:length(Msgs), Msgs}
				end,
			case Count > 0 of
				true ->
					FunSend =
						fun(MsgIn, Index) ->
							NetMsg =
								#pk_GS2U_Friend2SimpleList_Ack{
									type = Type,
									count = Count,
									index = Index,
									listInfo = MsgIn
								},
							%?DEBUG_OUT("[DebugForFriend2] ~p", [NetMsg]),
							playerMsg:sendNetMsg(NetMsg),
							Index + 1
						end,
					lists:foldl(FunSend, 0, lists:reverse(MsgsAll));
				_ ->
					%?DEBUG_OUT("[DebugForFriend2]", []),
					playerMsg:sendNetMsg(
						#pk_GS2U_Friend2SimpleList_Ack{
							type = Type,
							count = Count,
							index = 0,
							listInfo = []
						}
					)
			end;
		_ ->
			%?DEBUG_OUT("[DebugForFriend2]", []),
			skip
	end,
	ok.

%% 搜索好友
-spec search(Name::string()) -> ok.
search(Name) ->
	%?DEBUG_OUT("[DebugForFriend2] search RoleID(~p) Name(~p)", [playerState:getRoleID(), Name]),
	case playerState:getName() of
		Name ->
			skip; %% 忽略自己
		[] ->
			skip; %% 忽略空
		_ ->
			case core:queryBaseRoleByRoleName(Name) of
				#rec_base_role{roleID = TargetRoleID} ->
					Msg =
						#pk_GS2U_Friend2Search_Ack{
							listInfo = [createInfoBase(TargetRoleID)]
						},
					playerMsg:sendNetMsg(Msg);
				_ ->
					error_code({?ErrorCode_Friend2_None, []})
			end
	end,
	ok.

%% 推荐好友
-spec recommend(Sex::uint8(), IsNear::boolean()) -> ok.
recommend(Sex, IsNear) ->
	RoleID = playerState:getRoleID(),
	ListID = recommend_get({RoleID, Sex, IsNear}, false),
	FunCreateInfo =
		fun(ID, Result) ->
			case createInfoBase(ID) of
				#pk_Friend2InfoBase{} = Info ->
					[Info | Result];
				_ ->
					Result
			end
		end,
	Msg =
		#pk_GS2U_Friend2Recommend_Ack{
			listInfo = lists:foldl(FunCreateInfo, [], ListID)
		},
	playerMsg:sendNetMsg(Msg),
	ok.

%% 一键处理好友请求
-spec applyOneKey(IsAgreed::boolean()) -> ok.
applyOneKey(IsAgreed) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForFriend2] applyOneKey RoleID(~p) IsAgreed(~p)", [RoleID, IsAgreed]),
	psMgr:sendMsg2PS(?PsNameFriend2, friend2_applyOneKey, {RoleID, IsAgreed}),
	ok.

%% 拒绝好友申请
-spec refuse(TargetRoleID::uint64()) -> ok.
refuse(TargetRoleID) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForFriend2] del RoleID(~p) TargetRoleID(~p)", [RoleID, TargetRoleID]),
	case friend2Logic:check({?RELATION_NONE, RoleID, TargetRoleID, 0}) of
		{?CONTINUE_DelApply, _} ->
			psMgr:sendMsg2PS(?PsNameFriend2, friend2_relation, {?RELATION_NONE, RoleID, TargetRoleID, 0});
		{?CONTINUE_NONE, E} ->
			error_code(E);
		_ ->
			%% 已经不是申请者，同步一下当前页申请者信息
			queryList_Applicant(playerState2:getFriend2PageApp())
	end,
	ok.

%% 添加好友
-spec add(TargetRoleID::uint64()) -> ok.
add(TargetRoleID) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForFriend2] add RoleID(~p) TargetRoleID(~p)", [RoleID, TargetRoleID]),
	case RoleID of
		TargetRoleID ->
			skip; %% 忽略自己加自己
		_ ->
			%% 如果对象玩家是自己的申请者，则忽略冷却时间限制
			IsContinue =
				case friend2State:queryInteraction(friend2State:queryFriend2Data(RoleID), TargetRoleID) of
					#rec_friend2_interaction{timeBeApply = TimeBeApply} when TimeBeApply > 0 ->
						true;
					_ ->
						false
				end,
			case IsContinue =:= true orelse isCooldown({friend2_add_cd, TargetRoleID}) of
				false ->
					%% 计算冷却时间转换为分钟数
					#globalsetupCfg{setpara = [CD]} =
						getCfg:getCfgPStackWithDefaultValue(
							cfg_globalsetup,
							#globalsetupCfg{setpara = [0]},
							friend2_add_cd
						),
					Minute = playerState2:getFriend2CDReturnMinute({friend2_add_cd, TargetRoleID}, CD),
					error_code({?ErrorCode_Friend2Add_NotCoolDown, [Minute]});
				_ ->
					case friend2Logic:check({?RELATION_FORMAL, RoleID, TargetRoleID}) of
						{?CONTINUE_NONE, E} ->
							error_code(E);
						{?CONTINUE_AddFromBlackAsk, _} ->
							relationAck({?CONTINUE_AddFromBlackAsk, TargetRoleID});
						{?CONTINUE_AddDo, _} ->
							psMgr:sendMsg2PS(?PsNameFriend2, friend2_relation, {?RELATION_FORMAL, RoleID, TargetRoleID});
						{?CONTINUE_AddApply, _} ->
							addTemp(TargetRoleID),  %% 申请成为好友时自动结为临时好友关系
							playerState2:setFriend2CD({friend2_add_cd, TargetRoleID}),
							psMgr:sendMsg2PS(?PsNameFriend2, friend2_relation, {?RELATION_FORMAL, RoleID, TargetRoleID})
					end
			end
	end,
	ok.

%% 从黑名单中添加好友
-spec addFromBlack(TargetRoleID::uint64()) -> ok.
addFromBlack(TargetRoleID) ->
	RoleID = playerState:getRoleID(),
	?DEBUG_OUT("[DebugForFriend2] addFromBlack RoleID(~p) TargetRoleID(~p)", [RoleID, TargetRoleID]),
	case RoleID of
		TargetRoleID ->
			skip; %% 忽略自己加自己
		_ ->
			case friend2Logic:check({?RELATION_FORMAL, RoleID, TargetRoleID}) of
				{?CONTINUE_NONE, E} ->
					error_code(E);
				{?CONTINUE_AddFromBlackAsk, _} ->
					psMgr:sendMsg2PS(?PsNameFriend2, friend2_relation2, {?CONTINUE_AddApplyFromBlack, {RoleID, TargetRoleID}});
				{?CONTINUE_AddDo, _} ->
					psMgr:sendMsg2PS(?PsNameFriend2, friend2_relation, {?RELATION_FORMAL, RoleID, TargetRoleID});
				{?CONTINUE_AddApply, _} ->
					addTemp(TargetRoleID),  %% 申请成为好友时自动结为临时好友关系
					playerState2:setFriend2CD({friend2_add_cd, TargetRoleID}),
					psMgr:sendMsg2PS(?PsNameFriend2, friend2_relation, {?RELATION_FORMAL, RoleID, TargetRoleID})
			end
	end,
	ok.

%% 删除好友
-spec del(TargetRoleID::uint64()) -> ok.
del(TargetRoleID) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForFriend2] del RoleID(~p) TargetRoleID(~p)", [RoleID, TargetRoleID]),
	case friend2Logic:check({?RELATION_NONE, RoleID, TargetRoleID}) of
		{?CONTINUE_DelFormal, _} ->
			psMgr:sendMsg2PS(?PsNameFriend2, friend2_relation, {?RELATION_NONE, RoleID, TargetRoleID});
		{?CONTINUE_NONE, E} ->
			error_code(E);
		_ ->
			%% 已经不是好友，同步一下当前页好友信息
			queryList_Formal(playerState2:getFriend2PageFormal())
	end,
	ok.

%% 拉黑
-spec ban(TargetRoleID::uint64(), IsFriend::boolean()) -> ok.
ban(TargetRoleID, IsFriend) ->
	RoleID = playerState:getRoleID(),
	?DEBUG_OUT("[DebugForFriend2] ban RoleID(~p) TargetRoleID(~p) IsFriend(~p)", [RoleID, TargetRoleID, IsFriend]),
	case RoleID of
		TargetRoleID ->
			skip; %% 忽略自己加自己
		_ ->
			case friend2Logic:check({?RELATION_BLACK, RoleID, TargetRoleID}) of
				{?CONTINUE_NONE, E} ->
					error_code(E);
				{?CONTINUE_BanFromFormal, _} ->
					%% 由于验证的先后顺序问题，这里需要再次验证自己的黑名单数量是否已达上限
					Friend2DataMine = friend2State:queryFriend2Data(RoleID),
					#globalsetupCfg{setpara = [CountBlackMax]} =
						getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = [0]}, friend2_black_count),
					RelationsBlackMine = friend2State:queryRelations(Friend2DataMine#recFriend2Data.relations, ?RELATION_BLACK),
					case erlang:length(RelationsBlackMine) >= CountBlackMax of
						true ->
							%% 黑名单满的情况下，试图拉黑好友
							relationAck({?CONTINUE_BanWithUnBanAndDel, TargetRoleID});
						_ ->
							case IsFriend of
								true ->
									%% 已确认对方是好友，执行删除
									psMgr:sendMsg2PS(?PsNameFriend2, friend2_relation2, {?CONTINUE_BanFromFormalDo, {RoleID, TargetRoleID}});
								_ ->
									%% 不知道对方是否是好友，需要确认
									relationAck({?CONTINUE_BanFromFormal, TargetRoleID})
							end
					end;
				{?CONTINUE_BanWithUnBan, _} ->
					relationAck({?CONTINUE_BanWithUnBan, TargetRoleID});
				{?CONTINUE_Ban, _} ->
					psMgr:sendMsg2PS(?PsNameFriend2, friend2_relation, {?RELATION_BLACK, RoleID, TargetRoleID})
			end
	end,
	ok.

%% 移除黑名单A，然后拉黑B
-spec banWithUnban(TargetRoleID_A::uint64(), TargetRoleID_B::uint64()) -> ok.
banWithUnban(TargetRoleID_A, TargetRoleID_B) ->
	RoleID = playerState:getRoleID(),
	?DEBUG_OUT("[DebugForFriend2] banWithUnban RoleID(~p) TargetRoleID_A(~p) TargetRoleID_B(~p)", [RoleID, TargetRoleID_A, TargetRoleID_B]),
	case RoleID of
		TargetRoleID_A ->
			skip; %% 忽略自己操作自己
		TargetRoleID_B ->
			skip; %% 忽略自己操作自己
		_ when TargetRoleID_A =:= TargetRoleID_B ->
			skip; %% 忽略解除对象与拉黑对象相同的情况
		_ ->
			case friend2Logic:check({?RELATION_NONE, RoleID, TargetRoleID_A}) of
				{?CONTINUE_DelBlack, _} ->
					%% 验证B是否是好友
					Friend2Data = friend2State:queryFriend2Data(RoleID),
					case friend2State:queryRelation(Friend2Data, TargetRoleID_B) of
						#rec_friend2_relation{relation = ?RELATION_FORMAL} ->
							%% B是好友，移除A的黑名单再走走另外的流程
							psMgr:sendMsg2PS(?PsNameFriend2, friend2_relation, {?RELATION_NONE, RoleID, TargetRoleID_A}),
							relationAck({?CONTINUE_BanFromFormal, TargetRoleID_B});
						_ ->
							psMgr:sendMsg2PS(?PsNameFriend2, friend2_relation2, {?CONTINUE_DelBlackAndBan, {RoleID, TargetRoleID_A, TargetRoleID_B}})
					end;
				_ ->
					%% A已经不是黑名单用户，直接拉黑B
					case friend2Logic:check({?RELATION_BLACK, RoleID, TargetRoleID_B}) of
						{?CONTINUE_NONE, E} ->
							error_code(E);
						{?CONTINUE_BanFromFormal, _} ->
							%% B是好友，需要走另外的流程
							relationAck({?CONTINUE_BanFromFormal, TargetRoleID_B});
						{?CONTINUE_BanWithUnBan, _} ->
							%% 黑名单依然很满，继续走流程
							relationAck({?CONTINUE_BanWithUnBan, TargetRoleID_B});
						{?CONTINUE_Ban, _} ->
							psMgr:sendMsg2PS(?PsNameFriend2, friend2_relation, {?RELATION_BLACK, RoleID, TargetRoleID_B})
					end
			end
	end,
	ok.

%% 黑名单满时拉黑好友
-spec banWithUnbanAndDel(IDUnban::uint64(), IDDel::uint64()) -> ok.
banWithUnbanAndDel(IDUnban, IDDel) ->
	RoleID = playerState:getRoleID(),
	?DEBUG_OUT("[DebugForFriend2] banWithUnbanAndDel RoleID(~p) IDUnban(~p) IDDel(~p)", [RoleID, IDUnban, IDDel]),
	case RoleID of
		IDUnban ->
			skip; %% 忽略自己操作自己
		IDDel ->
			skip; %% 忽略自己操作自己
		_ when IDUnban =:= IDDel ->
			skip; %% 忽略操作对象一致
		_ ->
			%% 解除好友关系和解除黑名单关系这两个动作可以同时进行
			del(IDDel),
			unban(IDUnban),
			%% 缓存希望拉黑的好友，等待解除好友关系后再拉黑
			List = playerState2:getFriend2WantBanFormal(),
			ListNew = lists:keystore(IDDel, 1, List, {IDDel}),
			playerState2:setFriend2WantBanFormal(ListNew)
	end,
	ok.

%% 移除黑名单
-spec unban(TargetRoleID::uint64()) -> ok.
unban(TargetRoleID) ->
	%?DEBUG_OUT("[DebugForFriend2] unban RoleID(~p) TargetRoleID(~p)", [playerState:getRoleID(), TargetRoleID]),
	RoleID = playerState:getRoleID(),
	case friend2Logic:check({?RELATION_NONE, RoleID, TargetRoleID}) of
		{?CONTINUE_DelBlack, _} ->
			psMgr:sendMsg2PS(?PsNameFriend2, friend2_relation, {?RELATION_NONE, RoleID, TargetRoleID});
		_ ->
			%% 已经不是黑名单用户，同步一下当前页黑名单信息
			queryList_Black(playerState2:getFriend2PageBlack())
	end,
	ok.

%% 不由玩家消息控制，由系统调用的
%% 添加临时好友，如果是正式好友则刷新交互时间
-spec addTemp(TargetRoleID::uint64()) -> ok.
addTemp(TargetRoleID) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForFriend2] addTemp RoleID(~p) TargetRoleID(~p)", [RoleID, TargetRoleID]),
	case RoleID of
		TargetRoleID ->
			skip; %% 忽略自己加自己
		_ ->
			case friend2Logic:check({?RELATION_TEMP, RoleID, TargetRoleID}) of
				{?CONTINUE_NONE, E} ->
					error_code(E);
				{?CONTINUE_FreshInteraction, _} ->
					psMgr:sendMsg2PS(?PsNameFriend2, friend2_relation, {?RELATION_TEMP, RoleID, TargetRoleID});
				{?CONTINUE_AddDoTemp, _} ->
					psMgr:sendMsg2PS(?PsNameFriend2, friend2_relation, {?RELATION_TEMP, RoleID, TargetRoleID})
			end
	end,
	ok.

%% 不由玩家消息控制，由系统调用的
%% 删除临时好友
-spec delTemp(TargetRoleID::uint64()) -> ok.
delTemp(TargetRoleID) ->
	%?DEBUG_OUT("[DebugForFriend2] delTemp RoleID(~p) TargetRoleID(~p)", [playerState:getRoleID(), TargetRoleID]),
	RoleID = playerState:getRoleID(),
	case friend2Logic:check({?RELATION_NONE, RoleID, TargetRoleID}) of
		{?CONTINUE_DelTemp, _} ->
			psMgr:sendMsg2PS(?PsNameFriend2, friend2_relation, {?RELATION_NONE, RoleID, TargetRoleID});
		_ ->
			%% 已经不是临时好友用户，同步一下当前页临时好友信息
			queryList_Temp(playerState2:getFriend2PageTemp())
	end,
	ok.

%% 是否同意好友申请
-spec agreeApply({TargetRoleID::uint64(), IsAgreed::boolean()}) -> ok.
agreeApply({TargetRoleID, IsAgreed}) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForFriend2] agreeApply RoleID(~p) Argument(~p)", [RoleID, {TargetRoleID, IsAgreed}]),
	case IsAgreed of
		true ->
			case friend2State:queryInteraction(friend2State:queryFriend2Data(RoleID), TargetRoleID) of
				#rec_friend2_interaction{timeBeApply = TimeBeApply} when TimeBeApply > 0 ->
					psMgr:sendMsg2PS(?PsNameFriend2, friend2_relation, {?RELATION_FORMAL, RoleID, TargetRoleID});
				_ ->
					%% 已经是好友，同步一下当前页好友信息
					queryList_Formal(playerState2:getFriend2PageFormal())
			end;
		_ ->
			case friend2Logic:check({?RELATION_NONE, RoleID, TargetRoleID}) of
				{?CONTINUE_DelApply, _} ->
					psMgr:sendMsg2PS(?PsNameFriend2, friend2_relation, {?RELATION_NONE, RoleID, TargetRoleID});
				_ ->
					%% 已经不是申请者，同步一下当前页申请者信息
					queryList_Applicant(playerState2:getFriend2PageApp())
			end
	end,
	ok.

%% 请求各种列表
-spec queryList_Temp(Page::uint8()) -> ok.
queryList_Temp(Page) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForFriend2] queryList_Temp RoleID(~p) Page(~p)", [RoleID, Page]),
	List1 = friend2State:sortRelations(?RELATION_TEMP, RoleID),
	%?DEBUG_OUT("[DebugForFriend2] ~p", [List1]),
	#globalsetupCfg{setpara = [CountPage]} =
		getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = [10]}, friend2_temp_page_count),
	{PageValid, List2} = getListByPage(Page, CountPage, List1),
	%?DEBUG_OUT("[DebugForFriend2] ~p", [List2]),
	playerState2:setFriend2PageTemp(PageValid),
	FunCreateInfo =
		fun(ID, Result) ->
			[createInfoBase(ID) | Result]
		end,
	Msg =
		#pk_GS2U_Friend2TempReset_Sync{
			count = erlang:length(List1),
			page = PageValid,
			listInfo = lists:reverse(lists:foldl(FunCreateInfo, [], List2))
		},
	%?DEBUG_OUT("[DebugForFriend2] ListTemp~n~p", [Msg]),
	playerMsg:sendNetMsg(Msg),
	ok.
-spec queryList_Formal(Page::uint8()) -> ok.
queryList_Formal(Page) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForFriend2] queryList_Formal RoleID(~p) Page(~p)", [RoleID, Page]),
	Friend2DataMine = friend2State:queryFriend2Data(RoleID),
	List1 = friend2State:sortRelations(?RELATION_FORMAL, RoleID),
	%?DEBUG_OUT("[DebugForFriend2] ~p", [List1]),
	#globalsetupCfg{setpara = [CountPage]} =
		getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = [10]}, friend2_formal_page_count),
	{PageValid, List2} = getListByPage(Page, CountPage, List1),
	%?DEBUG_OUT("[DebugForFriend2] ~p", [List2]),
	playerState2:setFriend2PageFormal(PageValid),
	FunCreateInfo =
		fun(ID, Result) ->
			[createInfoFormal(ID) | Result]
		end,
	Msg =
		#pk_GS2U_Friend2FormalReset_Sync{
			count = erlang:length(List1),
			hasAP = friend2State:queryUnGainAP(Friend2DataMine),
			page = PageValid,
			listInfo = lists:reverse(lists:foldl(FunCreateInfo, [], List2))
		},
	%?DEBUG_OUT("[DebugForFriend2] ListFormal~n~p", [Msg]),
	playerMsg:sendNetMsg(Msg),
	ok.
-spec queryList_Black(Page::uint8()) -> ok.
queryList_Black(Page) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForFriend2] queryList_Black RoleID(~p) Page(~p)", [RoleID, Page]),
	List1 = friend2State:sortRelations(?RELATION_BLACK, RoleID),
	%?DEBUG_OUT("[DebugForFriend2] ~p", [List1]),
	#globalsetupCfg{setpara = [CountPage]} =
		getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = [10]}, friend2_black_page_count),
	{PageValid, List2} = getListByPage(Page, CountPage, List1),
	%?DEBUG_OUT("[DebugForFriend2] ~p", [List2]),
	playerState2:setFriend2PageBlack(PageValid),
	FunCreateInfo =
		fun(ID, Result) ->
			[createInfoBase(ID) | Result]
		end,
	Msg =
		#pk_GS2U_Friend2BlackReset_Sync{
			count = erlang:length(List1),
			page = PageValid,
			listInfo = lists:reverse(lists:foldl(FunCreateInfo, [], List2))
		},
	%?DEBUG_OUT("[DebugForFriend2] ListBlack~n~p", [Msg]),
	playerMsg:sendNetMsg(Msg),
	ok.
-spec queryList_Applicant(Page::uint8()) -> ok.
queryList_Applicant(Page) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForFriend2] queryList_Applicant RoleID(~p) Page(~p)", [RoleID, Page]),
	Friend2DataMine = friend2State:queryFriend2Data(RoleID),
	List1 = friend2State:sortRelationsApplicant(Friend2DataMine),
	%?DEBUG_OUT("[DebugForFriend2] ~p", [List1]),
	#globalsetupCfg{setpara = [CountPage]} =
		getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = [10]}, friend2_add_applicant_page_count),
	{PageValid, List2} = getListByPage(Page, CountPage, List1),
	%?DEBUG_OUT("[DebugForFriend2] ~p", [List2]),
	playerState2:setFriend2PageApp(PageValid),
	FunCreateInfo =
		fun(ID, Result) ->
			[createInfoBase(ID) | Result]
		end,
	Msg =
		#pk_GS2U_Friend2ApplicantReset_Sync{
			count = erlang:length(List1),
			page = PageValid,
			listInfo = lists:reverse(lists:foldl(FunCreateInfo, [], List2))
		},
	%?DEBUG_OUT("[DebugForFriend2] ListApplicant~n~p", [Msg]),
	playerMsg:sendNetMsg(Msg),
	ok.
-spec queryList_FormalForMarriage(Page::uint8()) -> ok.
queryList_FormalForMarriage(Page) ->
	RoleID = playerState:getRoleID(),
	Friend2DataMine = friend2State:queryFriend2Data(RoleID),
	List1 = friend2State:sortRelationsForMarriage(?RELATION_FORMAL, RoleID),
	#globalsetupCfg{setpara = [CountPage]} =
		getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = [10]}, friend2_formal_page_count),
	{PageValid, List2} = getListByPage(Page, CountPage, List1),
	FunCreateInfo =
		fun(ID, Result) ->
			[createInfoFormal(ID) | Result]
		end,
	Msg =
		#pk_GS2U_Friend2FormalForMarriage_Sync{
			count = erlang:length(List1),
			hasAP = friend2State:queryUnGainAP(Friend2DataMine),
			page = PageValid,
			listInfo = lists:reverse(lists:foldl(FunCreateInfo, [], List2))
		},
	playerMsg:sendNetMsg(Msg),
	ok.

%% 聊天
-spec chat(term()) -> ok.
chat(#pk_U2GS_Friend2FormalChat_Request{
	receiverID = ID,
	content = Content,
	time = Time
} = Rec) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForFriend2] chat c RoleID(~p) ", [RoleID]),
	%% 仅供非黑名单
	Friend2DataTarget = friend2State:queryFriend2Data(ID),
	Msg =
		#pk_GS2U_Friend2FormalChat_Ack{
			senderID = RoleID,
			receiverID = ID,
			time = Time,
			content = Content
		},
	playerMsg:sendNetMsg(Msg),
	case friend2State:queryRelation(Friend2DataTarget, RoleID) of
		#rec_friend2_relation{relation = ?RELATION_BLACK} ->
			skip;
		#rec_friend2_relation{relation = Relation} ->
			%% 保存聊天记录
			playerChat:sendLogChatInfo(
				#pk_U2GS_ChatInfo{
					receiverID  = ID,
					content     = Content,
					channel     = ?CHAT_CHANNEL_PRIVATE
				}
			),
			%% 聊天特别处理，将相关列表页码重置，以便目标用户排序调整后能显示在开头
			case Relation of
				?RELATION_TEMP ->
					playerState2:setFriend2PageTemp(0);
				?RELATION_FORMAL ->
					playerState2:setFriend2PageFormal(0);
				_ ->
					skip
			end,
			addTemp(ID),  %% 尝试加对方为临时好友
			case core:queryOnLineRoleByRoleID(ID) of
				#rec_OnlinePlayer{netPid = NetPid} ->
					%% 每日第一次与在线好友聊天增加1点亲密度
					closenessAdd(?ClosenessAddType_Chat, RoleID, ID, 1),
					playerMsg:sendNetMsg(NetPid, Msg);
				_ ->
					psMgr:sendMsg2PS(?PsNameFriend2, friend2_offlineMsg, {RoleID, ID, Rec})
			end
	end,
	ok;
chat(#pk_U2GS_Friend2FormalChatVoice_Request{
	receiverID = ID,
	time = Time,
	duration = Duration,
	count = Count,
	index = Index
} = Rec) ->
	RoleID = playerState:getRoleID(),
	?DEBUG_OUT("[DebugForFriend2] chat v RoleID(~p) ", [RoleID]),
	case Duration > 12.0 of
		true ->
			?DEBUG_OUT("[DebugForFriend2] chat v RoleID(~p) too long ~p", [Duration]),
			skip; %% 抛弃大于12秒的数据
		_ ->
			%% 仅供非黑名单
			Friend2DataTarget = friend2State:queryFriend2Data(ID),
			case friend2State:queryRelation(Friend2DataTarget, RoleID) of
				#rec_friend2_relation{relation = ?RELATION_BLACK} ->
					case Index =:= Count of
						true ->
							?DEBUG_OUT("[DebugForFriend2] chat v RoleID(~p) black", [RoleID]),
							Msg__ =
								#pk_GS2U_Friend2FormalChatVoice_AckS{
									senderID = playerState:getRoleID(),
									receiverID = ID,
									time = Time
								},
							playerMsg:sendNetMsg(Msg__);
						_ ->
							?DEBUG_OUT("[DebugForFriend2] chat v RoleID(~p) black skip", [RoleID]),
							skip
					end;
				#rec_friend2_relation{relation = Relation} ->
					case Index of
						1 ->
							?DEBUG_OUT("[DebugForFriend2] chat v RoleID(~p) new msg", [RoleID]),
							%% 索引为1时视为新的消息直接覆盖
							playerState2:setFriend2VoiceCache([Rec]);
						_ ->
							?DEBUG_OUT("[DebugForFriend2] chat v RoleID(~p) continue msg ~p", [RoleID, Index]),
							%% 索引不为1时需要与缓存的消息头部时间戳匹配，索引紧邻
							ListCache = playerState2:getFriend2VoiceCache(),
							IndexLast = Index - 1,
							case ListCache of
								[] ->
									skip;
								[#pk_U2GS_Friend2FormalChatVoice_Request{time = Time, index = IndexLast}|_] ->
									playerState2:setFriend2VoiceCache([Rec | ListCache]);
								_ ->
									?ERROR_OUT("chat invalid rec~n~p~n~p", [Rec, ListCache])
							end
					end,
					%% 缓存了完整了语音消息时尝试发送等后续操作
					ListCacheAll = playerState2:getFriend2VoiceCache(),
					case ListCacheAll of
						[] ->
							?DEBUG_OUT("[DebugForFriend2] chat v RoleID(~p) cache not full", [RoleID]),
							skip;
						[HAll|_] ->
							?DEBUG_OUT("[DebugForFriend2] chat v RoleID(~p) cache check full", [RoleID]),
							IndexAll = HAll#pk_U2GS_Friend2FormalChatVoice_Request.index,
							CountAll = HAll#pk_U2GS_Friend2FormalChatVoice_Request.count,
							case CountAll =:= IndexAll of
								true ->
									?DEBUG_OUT("[DebugForFriend2] chat v RoleID(~p) cache full", [RoleID]),
									%% 聊天特别处理，将相关列表页码重置，以便目标用户排序调整后能显示在开头
									case Relation of
										?RELATION_TEMP ->
											playerState2:setFriend2PageTemp(0);
										?RELATION_FORMAL ->
											playerState2:setFriend2PageFormal(0);
										_ ->
											skip
									end,
									addTemp(ID),  %% 尝试加对方为临时好友
									case core:queryOnLineRoleByRoleID(ID) of
										#rec_OnlinePlayer{netPid = NetPid} ->
											FunSend =
												fun(#pk_U2GS_Friend2FormalChatVoice_Request{
													receiverID = ID_,
													time = Time_,
													duration = Duration_,
													count = Count_,
													index = Index_,
													data = Data_
												}) ->
													Msg =
														#pk_GS2U_Friend2FormalChatVoice_AckR{
															senderID = playerState:getRoleID(),
															receiverID = ID_,
															duration = Duration_,
															time = Time_,
															count = Count_,
															index = Index_,
															data = Data_
														},
													playerMsg:sendNetMsg(NetPid, Msg)
												end,
											%% 每日第一次与在线好友聊天增加1点亲密度
											closenessAdd(?ClosenessAddType_Chat, RoleID, ID, 1),
											lists:foreach(FunSend, lists:reverse(ListCacheAll));
										_ ->
											psMgr:sendMsg2PS(?PsNameFriend2, friend2_offlineMsg, {RoleID, ID, ListCacheAll})
									end,
									Msg_ =
										#pk_GS2U_Friend2FormalChatVoice_AckS{
											senderID = playerState:getRoleID(),
											receiverID = ID,
											time = Time
										},
									playerMsg:sendNetMsg(Msg_),
									playerState2:setFriend2VoiceCache([]);
								_ ->
									skip
							end
					end
			end
	end,
	ok.

%% 发送离线消息
-spec sendOfflineMsg() -> ok.
sendOfflineMsg() ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForFriend2] sendOfflineMsg RoleID(~p) ", [RoleID]),
	Friend2Data = friend2State:queryFriend2Data(RoleID),
	FunSend2 =
		fun(Msg, SenderID) ->
			case Msg of
				#pk_U2GS_Friend2FormalChat_Request{
					receiverID = ID,
					content = Content,
					time = Time
				} ->
					MsgChat =
						#pk_GS2U_Friend2FormalChat_Ack{
							senderID = SenderID,
							receiverID = ID,
							time = Time,
							content = Content
						},
					playerMsg:sendNetMsg(MsgChat);
				#pk_U2GS_Friend2FormalChatVoice_Request{
					receiverID = ID_,
					time = Time_,
					duration = Duration_,
					count = Count_,
					index = Index_,
					data = Data_
				} ->
					MsgVoice =
						#pk_GS2U_Friend2FormalChatVoice_AckR{
							senderID = SenderID,
							receiverID = ID_,
							time = Time_,
							duration = Duration_,
							count = Count_,
							index = Index_,
							data = Data_
						},
					playerMsg:sendNetMsg(MsgVoice)
			end,
			SenderID
		end,
	FunSend1 =
		fun(#recFriend2Chat{targetRoleID = TargetRoleID, chatMsgs = Msgs}) ->
			lists:foldl(FunSend2, TargetRoleID, lists:reverse(Msgs))
		end,
	lists:foreach(FunSend1, Friend2Data#recFriend2Data.chatMsgs),
	psMgr:sendMsg2PS(?PsNameFriend2, friend2_offlineMsgSend, RoleID),
	ok.

%% 扩展功能
%% 原计划所有扩展功能仅限正式好友使用，但后来设计变化，部分功能可能不是好友
-spec formalOP(TargetRoleID::uint64(), OPType::uint8()) -> ok.
formalOP(TargetRoleID, ?EXOP_Like) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForFriend2] formalOP RoleID(~p) TargetRoleID(~p) EXOP_Like", [RoleID, TargetRoleID]),
	%% 1.每日只能赞指定次数
	LikeToday = playerDaily:getDailyCounter(?DailyType_Friend2_Like, 0),
	#globalsetupCfg{setpara = [LikeMax]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [10]},
			friend2_formal_like_count
		),
	case LikeToday < LikeMax of
		true ->
			%% 2.每日只能赞对方1次
			case daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_Friend2Like) of
				0 ->
					playerDaily:incDailyCounter(?DailyType_Friend2_Like, 0),
					daily2Logic:saveDaily2({RoleID, TargetRoleID, ?Daily2Type_S_Friend2Like, 1}),
					psMgr:sendMsg2PS(?PsNameFriend2, friend2_formalOP, {?EXOP_Like, RoleID, TargetRoleID});
				_ ->
					error_code({?ErrorCode_Friend2Formal_LikeSame, [playerNameUID:getPlayerNameByUID(TargetRoleID)]})
			end;
		_ ->
			error_code({?ErrorCode_Friend2Formal_LikeMax, [LikeMax]})
	end,
	ok;
formalOP(TargetRoleID, ?EXOP_GiveAP) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForFriend2] formalOP RoleID(~p) TargetRoleID(~p) EXOP_GiveAP", [RoleID, TargetRoleID]),
	%% 1.每日只能赠送指定次数
	APToday = playerDaily:getDailyCounter(?DailyType_Friend2_Action_Point_Give, 0),
	#globalsetupCfg{setpara = [APMax]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [10]},
			friend2_formal_give_ap_count
		),
	case APToday < APMax of
		true ->
			%% 2.每日只能赠送对方1次
			case daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_Friend2GiveAP) of
				0 ->
					%% 3.仅限正式好友关系
					Friend2DataMine = friend2State:queryFriend2Data(RoleID),
					case friend2State:queryRelation(Friend2DataMine, TargetRoleID) of
						#rec_friend2_relation{relation = ?RELATION_FORMAL} ->
							playerDaily:incDailyCounter(?DailyType_Friend2_Action_Point_Give, 0),
							daily2Logic:saveDaily2({RoleID, TargetRoleID, ?Daily2Type_S_Friend2GiveAP, 1}),
							psMgr:sendMsg2PS(?PsNameFriend2, friend2_formalOP, {?EXOP_GiveAP, RoleID, TargetRoleID}),
							playerliveness:onFinishLiveness(?LivenessFriendActionPoint, 1);
						_ ->
							error_code({?ErrorCode_Friend2NeedFormal, []})
					end;
				_ ->
					error_code({?ErrorCode_Friend2Formal_GiveAPSame, [playerNameUID:getPlayerNameByUID(TargetRoleID)]})
			end;
		_ ->
			error_code({?ErrorCode_Friend2Formal_GiveAPMax, [APMax]})
	end,
	ok;
formalOP(TargetRoleID, ?EXOP_GainAP) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForFriend2] formalOP RoleID(~p) TargetRoleID(~p) EXOP_GainAP", [RoleID, TargetRoleID]),
	%% 1.每日只能领取指定次数
	APToday = playerDaily:getDailyCounter(?DailyType_Friend2_Action_Point_Gain, 0),
	#globalsetupCfg{setpara = APMax} =
		getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = 10}, friend2_formal_gain_ap_count),
	case APToday < APMax of
		true ->
			%% 2.忽略未被赠送的情况，每日只能领取对方1次
			case daily2State:queryDaily2(TargetRoleID, RoleID, ?Daily2Type_S_Friend2GiveAP) of
				0 ->
					skip;
				_ ->
					case daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_Friend2GainAP) of
						0 ->
							%% 3.仅限正式好友关系
							Friend2DataMine = friend2State:queryFriend2Data(RoleID),
							case friend2State:queryRelation(Friend2DataMine, TargetRoleID) of
								#rec_friend2_relation{relation = ?RELATION_FORMAL} ->
									%% 4.如果领取导致溢出，则领取失败
									#globalsetupCfg{setpara = [APMaxMax]} =
										getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = [500]}, player_action_point_max),
									#globalsetupCfg{setpara = [APEveryGain]} =
										getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = [2]}, friend2_formal_gain_ap_value),
									APOld = playerActionPoint:getActionPoint(),
									case APOld + APEveryGain > APMaxMax of
										true ->
											error_code({?ErrorCode_Friend2AP_Max, []});
										_ ->
											playerActionPoint:addActionPoint(APEveryGain),
											playerDaily:incDailyCounter(?DailyType_Friend2_Action_Point_Gain, 0),
											daily2Logic:saveDaily2({RoleID, TargetRoleID, ?Daily2Type_S_Friend2GainAP, 1}),
											psMgr:sendMsg2PS(?PsNameFriend2, friend2_formalOP, {?EXOP_GainAP, RoleID, TargetRoleID})
									end;
								_ ->
									error_code({?ErrorCode_Friend2NeedFormal, []})
							end;
						_ ->
							error_code({?ErrorCode_Friend2Formal_GainAPSame, [playerNameUID:getPlayerNameByUID(TargetRoleID)]})
					end
			end;
		_ ->
			error_code({?ErrorCode_Friend2Formal_GainAPMax, [APMax]})
	end,
	ok;
formalOP(TargetRoleID, ?EXOP_Transmit) ->
	%RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForFriend2] formalOP RoleID(~p) TargetRoleID(~p) EXOP_Transmit", [RoleID, TargetRoleID]),
	playerVip:transmit(TargetRoleID),
	ok.

%% 扩展功能部分需要回执的处理
-spec modifyVariant({VariantIndex::uint(), ValueNew::int32()}) -> ok.
modifyVariant({VariantIndex, ValueNew}) ->
	playerVariant:setPlayerVariant(VariantIndex, ValueNew),
	%%% 如果是被拉黑次数改变，则可能执行踢下线的逻辑
	%case VariantIndex of
	%	?Setting_PlayerVarReadOnly_BeBlackCount ->
	%		maybeBeBan();
	%	_ ->
	%		skip
	%end,
	ok.

%%% 被拉黑次数过多可能会被T下线并且禁止登录
%-spec maybeBeBan() -> boolean().
%maybeBeBan() ->
%	%?DEBUG_OUT("[DebugForFriend2] maybeBeBan  RoleID(~p) ", [playerState:getRoleID()]),
%	#globalsetupCfg{setpara = [BanLevel, BanNum]} =
%		getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = [20, 40]}, friend2_black_ban),
%	case playerState:getLevel() < BanLevel of
%		true ->
%			BlackCount = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_BeBlackCount),
%			case BlackCount >= BanNum of
%				true ->
%					?LOG_OUT("maybeBeBan RoleID(~p) bekick", [playerState:getRoleID()]),
%					error_code({?ErrorCode_Friend2Black_Ban, []}),
%					timer:sleep(2000),
%					psMgr:sendMsg2PS(self(), kickOutAccount, {undefined, gmKickOut, undefined}),
%					true;
%				_ ->
%					false
%			end;
%		_ ->
%			false
%	end.

%% 增加亲密度
-spec closenessAdd(CAT::type_cat(), RoleID::uint64(), TargetRoleID::uint64(), ClosenessAdd::int32()) -> ok.
closenessAdd(CAT, RoleID, TargetRoleID, ClosenessAdd) ->
	%?DEBUG_OUT("[DebugForFriend2] closenessAdd CAT(~p) RoleID(~p) TargetRoleID(~p) ClosenessAdd(~p)", [CAT, RoleID, TargetRoleID, ClosenessAdd]),
	Friend2Data = friend2State:queryFriend2Data(RoleID),
	Relation = friend2State:queryRelation(Friend2Data, TargetRoleID),
	ClosenessAddOld = daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_C_AddFriendliness),
	ClosenessAddWill = friend2Logic:checkCAT(ClosenessAdd, CAT, Relation, ClosenessAddOld),
	case ClosenessAddWill > 0 of
		true ->
			psMgr:sendMsg2PS(?PsNameFriend2, friend2_closenessAdd, {CAT, RoleID, TargetRoleID, ClosenessAddWill});
		_ ->
			skip
	end,
	ok.

%% 查询指定用户的点赞值
-spec queryLike(RoleID::uint64()) -> uint().
queryLike(RoleID) ->
	variant:getPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_BeLike).

%% 删除角色
-spec deleteRole(RoleID::uint64()) -> ok.
deleteRole(RoleID) ->
	?LOG_OUT("deleteRole ~p", [RoleID]),
	psMgr:sendMsg2PS(?PsNameFriend2, friend2_deleteRole, RoleID),
	core:sendMsgToActivity(?ActivityType_Date, date_deleteRole, RoleID),
	ok.

%% 查询指定信息
-spec forLook(TargetRoleID::uint64()) -> ok.
forLook(0) ->
	ok;	%% 忽略无效请求
forLook(TargetRoleID) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForFriend2] forLook RoleID(~p) TargetRoleID(~p)", [RoleID, TargetRoleID]),
	Friend2Data = friend2State:queryFriend2Data(RoleID),
	#rec_friend2_relation{relation = Relation} =
		friend2State:queryRelation(Friend2Data, TargetRoleID),
	IsBeApplicant =
		case friend2State:queryInteraction(Friend2Data, TargetRoleID) of
			#rec_friend2_interaction{timeBeApply = TimeBeApply} when TimeBeApply > 0 ->
				true;
			_ ->
				false
		end,
	IsGiveLike = daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_Friend2Like) > 0,
	RelationForNetMsg =
		case Relation of
			?RELATION_FORMAL ->
				0;
			?RELATION_TEMP ->
				1;
			?RELATION_BLACK ->
				2;
			_ ->
				case IsBeApplicant of
					true ->
						3;
					_ ->
						4
				end
		end,
	Like = queryLike(TargetRoleID),
	#pk_Friend2InfoSimple{
		name = Name,
		level = Level
	} = createInfoSimple(TargetRoleID),
	playerMsg:sendNetMsg(
		#pk_GS2U_Friend2ForLook_Ack{
			id = TargetRoleID,
			name = Name,
			relation = RelationForNetMsg,
			like = Like,
			isGiveLike = IsGiveLike,
			level = Level
		}
	),
	ok.

%% 希望聊天
-spec wantChat(TargetRoleID::uint64()) -> ok.
wantChat(TargetRoleID) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForFriend2] wantChat RoleID(~p) TargetRoleID(~p)", [RoleID, TargetRoleID]),
	Friend2Data = friend2State:queryFriend2Data(RoleID),
	#rec_friend2_relation{relation = Relation} =
		friend2State:queryRelation(Friend2Data, TargetRoleID),
	%% 根据关系提取列表
	%% 0正式好友1临时好友2黑名单3申请者（被视为陌生人）4陌生人
	{RelationForNetMsg, {Page, List}, Length} =
		case Relation of
			?RELATION_FORMAL ->
				#globalsetupCfg{setpara = [CountPage0]} =
					getCfg:getCfgPStackWithDefaultValue(
						cfg_globalsetup,
						#globalsetupCfg{setpara = [10]},
						friend2_formal_page_count
					),
				List0 = friend2State:sortRelations(?RELATION_FORMAL, RoleID),
				{0, getListByRoleID(TargetRoleID, CountPage0, List0), erlang:length(List0)};
			?RELATION_TEMP ->
				#globalsetupCfg{setpara = [CountPage1]} =
					getCfg:getCfgPStackWithDefaultValue(
						cfg_globalsetup,
						#globalsetupCfg{setpara = [10]},
						friend2_temp_page_count
					),
				List1 = friend2State:sortRelations(?RELATION_TEMP, RoleID),
				{1, getListByRoleID(TargetRoleID, CountPage1, List1), erlang:length(List1)};
			?RELATION_BLACK ->
				#globalsetupCfg{setpara = [CountPage2]} =
					getCfg:getCfgPStackWithDefaultValue(
						cfg_globalsetup,
						#globalsetupCfg{setpara = [10]},
						friend2_black_page_count
					),
				List2 = friend2State:sortRelations(?RELATION_BLACK, RoleID),
				{2, getListByRoleID(TargetRoleID, CountPage2, List2), erlang:length(List2)};
			_ ->
				%% 为陌生人时提取临时好友列表
				#globalsetupCfg{setpara = [CountPage4]} =
					getCfg:getCfgPStackWithDefaultValue(
						cfg_globalsetup,
						#globalsetupCfg{setpara = [10]},
						friend2_temp_page_count
					),
				List4 = friend2State:sortRelations(?RELATION_TEMP, RoleID),
				case List4 of
					[] ->
						{4, {0, []}, 0};
					[H|_] ->
						{4, getListByRoleID(H, CountPage4, List4), erlang:length(List4)}
				end
		end,
	%% 重置缓存页码
	case Relation of
		?RELATION_FORMAL ->
			playerState2:setFriend2PageFormal(Page);
		?RELATION_TEMP ->
			playerState2:setFriend2PageTemp(Page);
		?RELATION_BLACK ->
			playerState2:setFriend2PageBlack(Page);
		_ ->
			skip
	end,
	%% 构造并发送消息
	FunCreateInfo =
		fun(ID, Result) ->
			[createInfoFormal(ID) | Result]
		end,
	playerMsg:sendNetMsg(
		#pk_GS2U_Friend2WantChat_Ack{
			id = TargetRoleID,
			info = createInfoBase(TargetRoleID),
			relation = RelationForNetMsg,
			count = Length,
			hasAP = friend2State:queryUnGainAP(Friend2Data),
			page = Page,
			listInfo = lists:reverse(lists:foldl(FunCreateInfo, [], List))
		}
	),
	ok.

%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%% 构建精简信息
-spec createInfoSimple(TargetRoleID::uint64()) -> #pk_Friend2InfoSimple{} | error.
createInfoSimple(TargetRoleID) ->
	%% 优先从base_role获取基本信息
	case core:queryBaseRoleByRoleID(TargetRoleID) of
		#rec_base_role{level = Level, career = Career, race = Race, sex = Sex, head = Head} ->
			Name = playerNameUID:getPlayerNameByUID(TargetRoleID),
			#pk_Friend2InfoSimple{
				id = TargetRoleID,
				name = Name,
				level = Level,
				career = Career,
				race = Race,
				sex = Sex,
				head = Head
			};
		_ ->
			%% 从roleKeyInfo里找不到即是错误
			case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
				#?RoleKeyRec{roleName = NameK, level = LevelK, career = CareerK, race = RaceK, sex = SexK, head = HeadK} ->
					#pk_Friend2InfoSimple{
						id = TargetRoleID,
						name = NameK,
						level = LevelK,
						career = CareerK,
						race = RaceK,
						sex = SexK,
						head = HeadK
					};
				_ ->
					?ERROR_OUT("createInfoSimple can not find TargetRoleID(~p) from core:queryRoleKeyInfoByRoleID/1", [TargetRoleID]),
					error
			end
	end.

%% 构建基础信息
-spec createInfoBase(TargetRoleID::uint64()) -> #pk_Friend2InfoBase{}.
createInfoBase(TargetRoleID) ->
	%% 优先从从base_role获取基本信息
	{NameB, LevelB, CareerB, RaceB, SexB, HeadB, TimeLastOnlineB} =
		case core:queryBaseRoleByRoleID(TargetRoleID) of
			#rec_base_role{level = LevelB_, career = CareerB_, race = RaceB_, sex = SexB_, head = HeadB_, lastLogoutTime = TimeLastOnlineB_} ->
				{playerNameUID:getPlayerNameByUID(TargetRoleID), LevelB_, CareerB_, RaceB_, SexB_, HeadB_, time:dateTimeToInt64(TimeLastOnlineB_) - ?SECS_FROM_0_TO_1970};
			_ ->
				{[], 0, 0, 0, 0, 1, 0}
		end,
	%% 获取家族（军团）名
	FamilyName =
		case ets:lookup(rec_guild_member, TargetRoleID) of
			[#rec_guild_member{guildID = GuildID}] ->
				case ets:lookup(rec_guild, GuildID) of
					[#rec_guild{guildName = GuildName}] ->
						GuildName;
					_ ->
						[]
				end;
			_ ->
				[]
		end,
	%% 无法从base_role获取时使用roleKeyInfo的信息，并且部分字段只能使用这里的信息，找不到就是异常
	{Name, Level, Career, Race, Sex, Head, TimeLastOnline, VipLv, Force} =
		case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
			#?RoleKeyRec{roleName = NameK, level = LevelK, career = CareerK, race = RaceK, sex = SexK, head = HeadK, vipLv = VipLvK, playerForce = ForceK, offlineTime = TimeLastOnlineK} ->
				case NameB of
					[] ->
						{NameK, LevelK, CareerK, RaceK, SexK, HeadK, TimeLastOnlineK - ?SECS_FROM_0_TO_1970 - time2:getTimezoneSec(), VipLvK, ForceK};
					_ ->
						{NameB, LevelB, CareerB, RaceB, SexB, HeadB, TimeLastOnlineB, VipLvK, ForceK}
				end;
			_ ->
				?ERROR_OUT("createInfoBase can not find TargetRoleID(~p) from core:queryRoleKeyInfoByRoleID/1", [TargetRoleID])
		end,
	%% 从ets_rec_OnlinePlayer获取在线状态
	Code =
		case core:queryOnLineRoleByRoleID(TargetRoleID) of
			#rec_OnlinePlayer{code = Code_} ->
				Code_;
			_ ->
				0
		end,
	%% 从身份证系统获取自定义头像信息
	{_, Identity} = identityState:queryIdentity(TargetRoleID),
	Face = Identity#rec_player_identity.face,
	%% 好友系统关系信息提供
	Friend2DataMine = friend2State:queryFriend2Data(playerState:getRoleID()),
	#rec_friend2_relation{timeRelation = TimeRelation, timeLastInteractive = TimeLastInteractive} =
		friend2State:queryRelation(Friend2DataMine, TargetRoleID),
	%% 是否点赞与被点赞
	RoleID = playerState:getRoleID(),
	IsGiveLike = daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_Friend2Like) > 0,
	IsBeGiveLike = daily2State:queryDaily2(TargetRoleID, RoleID, ?Daily2Type_S_Friend2Like) > 0,
	%% 是否已婚
	IsMarried =
		case marriageState:queryRelation(TargetRoleID) of
			#rec_marriage{targetRoleID = TargetRoleID} when TargetRoleID > 0 ->
				true;
			_ ->
				false
		end,
	%% 查询两者距离
	Distance = friend2LBSOtp:queryDistance(RoleID, TargetRoleID),
	%% 构建
	Simple =
		#pk_Friend2InfoSimple{
			id = TargetRoleID,
			name = Name,
			level = Level,
			career = Career,
			race = Race,
			sex = Sex,
			head = Head
		},
	#pk_Friend2InfoBase{
		simple = Simple,
		code = Code,
		face = Face,
		vipLv = VipLv,
		familyName = FamilyName,
		force = Force,
		timeRelation = TimeRelation,
		timeLastOnline = TimeLastOnline,
		timeLastInteractive = TimeLastInteractive,
		like = queryLike(TargetRoleID),
		isGiveLike = IsGiveLike,
		isBeGiveLike = IsBeGiveLike,
		isMarried = IsMarried,
		distance = Distance
	}.

%% 构建正式好友信息
-spec createInfoFormal(TargetRoleID::uint64()) -> #pk_Friend2InfoFormal{}.
createInfoFormal(TargetRoleID) ->
	%% 亲密度来自关系模块
	Friend2DataMine = friend2State:queryFriend2Data(playerState:getRoleID()),
	RelationOldMin = friend2State:queryRelation(Friend2DataMine, TargetRoleID),
	Closeness = RelationOldMin#rec_friend2_relation.closeness,
	%% 是否赠送与被赠送
	RoleID = playerState:getRoleID(),
	IsGiveAP = daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_Friend2GiveAP) > 0,
	IsBeGiveAP = daily2State:queryDaily2(TargetRoleID, RoleID, ?Daily2Type_S_Friend2GiveAP) > 0,
	IsGainAP = daily2State:queryDaily2(RoleID, TargetRoleID, ?Daily2Type_S_Friend2GainAP) > 0,
	IsBeGainAP = daily2State:queryDaily2(TargetRoleID, RoleID, ?Daily2Type_S_Friend2GainAP) > 0,
	%% 构建
	#pk_Friend2InfoFormal{
		base = createInfoBase(TargetRoleID),
		closeness = Closeness,
		isGiveAP = IsGiveAP,
		isGainAP = IsGainAP,
		isBeGiveAP = IsBeGiveAP,
		isBeGainAP = IsBeGainAP
	}.

%% 查询操作是否冷却
-spec isCooldown({CDType::atom(), TargetRoleID::uint64()}) -> boolean().
isCooldown({CDType, _} = Key) ->
	#globalsetupCfg{setpara = [CD]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [0]},
			CDType
		),
	playerState2:getFriend2CD(Key, CD).

%% 获取第N页的数据
-spec getListByPage(Page::uint8(), CountPage::uint8(), ListIn::list()) -> {PageValid::uint8(), ListOut::list()}.
getListByPage(Page, CountPage, ListIn) ->
	Length2 =
		case erlang:length(ListIn) of
			0 ->
				0;
			Length1 ->
				Length1 - 1
		end,
	PageMax = erlang:trunc(Length2 / CountPage),
	PageValid =
		case Page > PageMax of
			true ->
				PageMax;
			_ ->
				Page
		end,
	Nth = PageValid * CountPage,
	List1 = lists:nthtail(Nth, ListIn),
	ListOut =
		case erlang:length(List1) > CountPage of
			true ->
				{List2, _} = lists:split(CountPage, List1),
				List2;
			_ ->
				List1
		end,
	{PageValid, ListOut}.

%% 获取目标所在的页码及数据
-spec getListByRoleID(TargetRoleID::uint64(), CountPage::uint8(), ListIn::[uint64(), ...]) -> {Page::uint8(), ListOut::list()}.
getListByRoleID(TargetRoleID, CountPage, ListIn) ->
	getListByRoleID_(TargetRoleID, CountPage, ListIn, 0).
getListByRoleID_(TargetRoleID, CountPage, ListIn, Page) ->
	FunCheck =
		fun(E, {_, 0}) ->
			{E =:= TargetRoleID, 0}
		end,
	case erlang:length(ListIn) > CountPage of
		true ->
			{ListA, ListB} = lists:split(CountPage, ListIn),
			case misc:foldlEx(FunCheck, {false, 0}, ListA) of
				{true, _} ->
					{Page, ListA};
				_ ->
					getListByRoleID_(TargetRoleID, CountPage, ListB, Page + 1)
			end;
		_ ->
			case misc:foldlEx(FunCheck, {false, 0}, ListIn) of
				{true, _} ->
					{Page, ListIn};
				_ ->
					{0, []}
			end
	end.

%% 推荐好友（重置随机列表）
-spec recommend_reset(IsNear::boolean()) -> ok.
recommend_reset(true) ->
	%?DEBUG_OUT("[DebugForFriend2] recommend_reset true"),
	#mainMenuCfg{parameters = LevelMin} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_mainMenu,
			#mainMenuCfg{parameters = 10},
			3 %% 对应好友
		),
	RoleIDMine = playerState:getRoleID(),
	FunCreate =
		fun(#rec_OnlinePlayer{roleID = RoleID}, Result) ->
			case core:queryBaseRoleByRoleID(RoleID) of
				#rec_base_role{level = Level} when Level >= LevelMin, RoleIDMine =/= RoleID ->
					Distance = friend2LBSOtp:queryDistance(RoleIDMine, RoleID),
					case Distance < 120.0 of  %% 此处限制就达到120千米的数据参与计算，具体数据需要策划进行配置 friend2LBSOtp ?DistanceMax
						true ->
							[{Distance, RoleID} | Result];
						_ ->
							Result
					end;
				_ ->
					Result  %% 等级不足、是自己、数据延时
			end
		end,
	List = ets:foldl(FunCreate, [], ets_rec_OnlinePlayer),
	playerState2:setFriend2OnlineListRoleIDNear(lists:keysort(1, List)),
	ok;
recommend_reset(false) ->
	%?DEBUG_OUT("[DebugForFriend2] recommend_reset false"),
	#mainMenuCfg{parameters = LevelMin} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_mainMenu,
			#mainMenuCfg{parameters = 10},
			3 %% 对应好友
		),
	Count = ets:info(ets_rec_OnlinePlayer, size),
	RoleIDMine = playerState:getRoleID(),
	FunCreate =
		fun(#rec_OnlinePlayer{roleID = RoleID}, Result) ->
			case core:queryBaseRoleByRoleID(RoleID) of
				#rec_base_role{level = Level} when Level >= LevelMin, RoleIDMine =/= RoleID ->
					[{misc:rand(1, Count), RoleID} | Result];
				_ ->
					Result  %% 等级不足、是自己、数据延时
			end
		end,
	List = ets:foldl(FunCreate, [], ets_rec_OnlinePlayer),
	playerState2:setFriend2OnlineListRoleID(lists:keysort(1, List)),
	ok.

%% 推荐好友（获得筛选的角色ID）
-spec recommend_get({RoleID::uint64(), Sex::uint8(), IsNear::boolean()}, IsRecursion::boolean()) -> [uint64(), ...].
recommend_get(PA = {RoleID, Sex, IsNear}, IsRecursion) ->
	#globalsetupCfg{setpara = [CountMax]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [10]},
			friend2_recommend_count
		),
	List1 =
		case IsNear of
			true ->
				playerState2:getFriend2OnlineListRoleIDNear();
			_ ->
				playerState2:getFriend2OnlineListRoleID()
		end,
	Friend2DataMine = friend2State:queryFriend2Data(RoleID),
	case recommend_getR({0, [], List1}, {Friend2DataMine, CountMax, Sex}) of
		{CountGet, ListID, List2} when CountGet >= CountMax ->
			playerState2:setFriend2OnlineListRoleID(List2),
			ListID; %% 得到了足够的数据，返回
		{_, ListID, List2} when IsRecursion =:= true ->
			playerState2:setFriend2OnlineListRoleID(List2),
			ListID; %% 没有得到足够的数据，但根据传参直接返回结果
		_ ->
			%% 没有得到足够的数据，重置随机列表后强制返回结果
			%% 强制返回结果是防止在线人数始终不足造成的数据始终不足
			%% 在线人数不足时频繁重置也不会造成什么消耗
			recommend_reset(IsNear),
			recommend_get(PA, true)
	end.

%% 推荐好友（获得筛选的角色ID） 递归
-spec recommend_getR(
	{CountGet::uint(), ListID::[uint64(), ...], ListSrc::[{term(), uint64()}, ...]},
	{FriendDataMine::#recFriend2Data{}, CountMax::uint(), Sex::uint8()}
) ->
	{}.
recommend_getR({CountGet, ListID, ListSrc}, {_, CountMax, _}) when CountGet >= CountMax ->
	{CountGet, ListID, ListSrc};  %% 获取量达到满足条件，成功返回
recommend_getR({CountGet, ListID, []}, _) ->
	{CountGet, ListID, []}; %% 数据源不足，返回，外部判断是否可用
recommend_getR({CountGet, ListID, [{_, TargetRoleID} | ListSrcTail]}, {Friend2DataMine, CountMax, Sex}) ->
	%% 缓存列表时的在线者可能此时不在线，需要再次验证在线状态
	TargetRoleIDValid1 =
		case core:queryOnLineRoleByRoleID(TargetRoleID) of
			#rec_OnlinePlayer{} ->
				%% 需要验证双方关系
				case friend2State:queryRelation(Friend2DataMine, TargetRoleID) of
					#rec_friend2_relation{relation = ?RELATION_FORMAL} ->
						0;  %% 已经是正式好友
					#rec_friend2_relation{relation = ?RELATION_BLACK} ->
						0;  %% 对方已被自己拉黑
					_ ->
						Friend2DataTarget = friend2State:queryFriend2Data(TargetRoleID),
						case friend2State:queryRelation(Friend2DataTarget, Friend2DataMine#recFriend2Data.roleID) of
							#rec_friend2_relation{relation = ?RELATION_BLACK} ->
								0;  %% 自己已被对方拉黑
							_ ->
								TargetRoleID  %% 有效的参选者
						end
				end;
			_ ->
				0   %% 对方不在线
		end,
	%% 根据性别要求进行筛选（0男，1女，否则不限制）
	TargetRoleIDValid2 =
		case TargetRoleIDValid1 > 0 of
			true ->
				case Sex > 1 of
					true ->
						TargetRoleIDValid1; %% 无性别限制，直接通过
					_ ->
						case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
							#?RoleKeyRec{sex = Sex} ->
								TargetRoleIDValid1; %% 性别符合，通过
							_ ->
								0 %% 性别不符，不通过
						end
				end;
			_ ->
				0 %% 上一次筛选未通过，不进行性别筛选
		end,
	%% 根据筛选结果决定返回值
	case TargetRoleIDValid2 > 0 of
		true ->
			recommend_getR({CountGet + 1, [TargetRoleIDValid2 | ListID], ListSrcTail}, {Friend2DataMine, CountMax, Sex});
		_ ->
			recommend_getR({CountGet, ListID, ListSrcTail}, {Friend2DataMine, CountMax, Sex})
	end.
