%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20161111
%%%-------------------------------------------------------------------
-module(playerIdentity).
-author("tiancheng").

-include("playerPrivate.hrl").
-include("../identity/identityPrivate.hrl").

-export([
	init/0,
	error_code/1,
	queryIdentity/1,
	makeQueryIdentity/1,
	editIdentity/2,
	editIdentity_Tags/2,
	editIdentity_Pics/4,
	editIdentity_PicsAck/1,
	editIdentityAck/1,
	picUpload/1,
	picDownloadBegin/1,
	picDownloadBeginAck/1,
	picDownloadContinue/1,
	picOutTime/0,
	requestRoleHeadPic/2,

	%% 玩家不在线时对点赞值和魅力值的管理
	queryFace/1,
	queryLike/1,
	queryCharm/1,
	addLike/3,
	addCharm/3,

	%% 赠礼
	giveGift/4,

	%% 删除角色
	deleteRole/1
]).

%%% ====================================================================
%%% API functions
%%% ====================================================================

%% 初始化
-spec init() -> ok.
init() ->
	RoleID = playerState:getRoleID(),
	queryIdentity(RoleID),
	init_giveGift(RoleID),
	ok.

%% 上线时推送和当前角色相关的赠礼记录
init_giveGift(RoleID) ->
	ListGiftHistory = init_giveGift_history(RoleID),
	ListID = init_giveGift_listID(ListGiftHistory, [], RoleID),
	ListName = init_giveGift_name(ListID, []),
	{ListItemID, ListItemCount} = init_giveGift_gifts(RoleID),
	Msg =
		#pk_GS2U_GiftHistory_Sync{
			listHistory = ListGiftHistory,
			nameTables = ListName,
			listItemID = ListItemID,
			listItemCount = ListItemCount
		},
	playerMsg:sendNetMsg(Msg),
	ok.
init_giveGift_history(RoleID) ->
	Q = ets:fun2ms(
		fun (#pk_GiftHistory{roleID = IDA, tarRoleID = IDB} = R)
			when IDA =:= RoleID; IDB =:= RoleID ->
			R
		end
	),
	ets:select(?EtsGiftHistory, Q).
init_giveGift_listID([], Acc, RoleID) ->
	lists:usort([RoleID | Acc]);
init_giveGift_listID([#pk_GiftHistory{roleID = RoleID, tarRoleID = IDB} | T], Acc, RoleID) ->
	init_giveGift_listID(T, [IDB | Acc], RoleID);
init_giveGift_listID([#pk_GiftHistory{roleID = IDA, tarRoleID = RoleID} | T], Acc, RoleID) ->
	init_giveGift_listID(T, [IDA | Acc], RoleID).
init_giveGift_name([], Acc) ->
	Acc;
init_giveGift_name([H | T], Acc) ->
	Name = playerNameUID:getPlayerNameByUID(H),
	init_giveGift_name(T, [#pk_NameTable{id = H, name = Name} | Acc]).
init_giveGift_gifts(RoleID) ->
	{_, #rec_player_identity{gifts = Gifts}} = identityState:queryIdentity(RoleID),
	init_giveGift_gifts_split(Gifts, [], []).
init_giveGift_gifts_split([], AccID, AccCount) ->
	{AccID, AccCount};
init_giveGift_gifts_split([{ID, Count} | T], AccID, AccCount) ->
	init_giveGift_gifts_split(T, [ID | AccID], [Count | AccCount]).

%% 异常码处理
-spec error_code({
	ErrorCode::uint(),
	Param::list()
}) ->
	ok.
error_code({ErrorCode, Param}) ->
	%?DEBUG_OUT("[DebugForIdentity] error_code ~p", [{ErrorCode, Param}]),
	case Param of
		[] ->
			playerMsg:sendErrorCodeMsg(ErrorCode);
		_ ->
			playerMsg:sendErrorCodeMsg(ErrorCode, Param)
	end,
	ok.

%% 查询身份证信息
-spec queryIdentity(IdentityID::uint64()) -> ok.
queryIdentity(IdentityID) ->
	%?DEBUG_OUT("[DebugForIdentity] queryIdentity RoleID(~p) IdentityID(~p)", [playerState:getRoleID(), IdentityID]),
	%% 验证是否在线，同时获取Code
	case core:queryOnLineRoleByRoleID(IdentityID) of
		#rec_OnlinePlayer{} ->
			Msg = makeQueryIdentity(IdentityID),
			%?DEBUG_OUT("[DebugForIdentity] ~p", [Msg]),
			playerMsg:sendNetMsg(Msg);
		_ ->
			error_code({?ErrorCode_IdentityGet_Offline, []})
	end,
	ok.

%% 生成身份证协议
-spec makeQueryIdentity(IdentityID::uint64()) -> #pk_GS2U_Identity_Ack{}.
makeQueryIdentity(IdentityID) ->
	Code =
		case core:queryOnLineRoleByRoleID(IdentityID) of
			#rec_OnlinePlayer{code = C} -> C;
			_ -> 0
		end,
	{_, Identity} = identityState:queryIdentity(IdentityID),
	case playerState:getRoleID() of
		IdentityID ->
			identity2NetMsgMySelf(Identity, Code);
		_ ->
			identity2NetMsgAnother(Identity, Code)
	end.

%% 编辑身份证信息
%% 注1：标签除外，使用其它方式进行编辑
%% 注2：相册除外，使用其它方式进行管理
%% 注3：点赞值和魅力值除外，不受玩家编辑，而是其它功能调用
-spec editIdentity(IDIT::type_idit(), Data::term()) -> ok.
editIdentity(IDIT, Data) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForIdentity] editIdentity IDIT(~p) RoleID(~p) Data(~p)", [IDIT, RoleID, Data]),
	{_, IdentityOld} = identityState:queryIdentity(RoleID),
	case identityLogic:getNewIdentity(IDIT, Data, IdentityOld) of
		IdentityOld ->
			%% 需要排除修改后新值与旧值相同的情况
			skip;
		_ ->
			%% 检验取值范围（内部触发ErrorCode）
			case checkValueLimit(IDIT, Data) of
				true ->
					%% 通知公共进程修改属性
					psMgr:sendMsg2PS(?PsNameIdentity, identity_edit, {IDIT, RoleID, Data});
				_ ->
					skip
			end
	end,
	ok.

%% 编辑标签
%% 注：该函数是作为editIdentity/2不足的补充，仅处理标签的编辑请求
-spec editIdentity_Tags(AddOrDel::boolean(), TagInfo::term()) -> ok.
editIdentity_Tags(true, Tags) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForIdentity] editIdentity_Tags RoleID(~p) Data(~p)", [RoleID, {true, Tags}]),
	case Tags of
		[] ->
			%% 忽略无效（内容空）的请求
			skip;
		_ ->
			%% 检验取值范围并尝试生成新的身份证信息
			{_, IdentityOld} = identityState:queryIdentity(RoleID),
			FunAll =
				fun(TagID, {Mark, Identity}) ->
					case Mark of
						true ->
							case getCfg:getCfgByKey(cfg_identity_tag, TagID) of
								#identity_tagCfg{} ->
									editIdentity_Tags_NewIdentity(true, TagID, Identity);
								_ ->
									{false, {}}
							end;
						_ ->
							{Mark, Identity}
					end
				end,
			{IsContinue, IdentityNew} = lists:foldl(FunAll, {true, IdentityOld}, Tags),
			case IsContinue andalso IdentityNew =/= IdentityOld of
				true ->
					%% 通知公共进程修改属性
					psMgr:sendMsg2PS(?PsNameIdentity, identity_edit, {?IDIT_TAGS, RoleID, IdentityNew#rec_player_identity.tags});
				_ ->
					error_code({?ErrorCode_IdentityEdit_TagLimit, []})
			end
	end,
	ok;
editIdentity_Tags(false, TagID) ->
	RoleID = playerState:getRoleID(),
	%?DEBUG_OUT("[DebugForIdentity] editIdentity_Tags RoleID(~p) Data(~p)", [RoleID, {false, TagID}]),
	%% 检验取值范围
	case getCfg:getCfgByKey(cfg_identity_tag, TagID) of
		#identity_tagCfg{} ->
			%% 尝试生成新的身份证信息
			{_, IdentityOld} = identityState:queryIdentity(RoleID),
			{IsContinue, IdentityNew} = editIdentity_Tags_NewIdentity(false, TagID, IdentityOld),
			case IsContinue andalso IdentityNew =/= IdentityOld of
				true ->
					%% 通知公共进程修改属性
					psMgr:sendMsg2PS(?PsNameIdentity, identity_edit, {?IDIT_TAGS, RoleID, IdentityNew#rec_player_identity.tags});
				_ ->
					skip
			end;
		_ ->
			error_code({?ErrorCode_IdentityEdit_TagLimit, []})
	end,
	ok.

%% 编辑相册
%% 注：该函数是作为editIdentity/2不足的补充，仅处理相册的编辑请求
-spec editIdentity_Pics(OpType::type_idupt(), MD5::list(), Size::uint32(), Pos::uint8()) -> ok.
editIdentity_Pics(_OpType, MD5, Size, Pos) ->
	RoleID = playerState:getRoleID(),
	?LOG_OUT("[DebugForIdentity] editIdentity_Pics RoleID(~p) Data(~p)", [RoleID, {Size, Pos}]),
	case Size > ?PicLimitSize of
		true ->
			error_code({?ErrorCode_IdentityPicUp_PicLimitSize, []});
		_ ->
			%% 客户端对应每张照片有具体的位置，不在位置中的操作将被忽略
			case Pos >= 0 andalso Pos < ?CountPics andalso MD5 =/= [] of
				true ->
					case playerState2:getIdentityUporDownLoadTaskInfo() of
						#upOrDownLoadTask{} ->
							error_code({?ErrorCode_IdentityEdit_UpOrDownOnlyOne, []});
						_ ->
%% 20161229 更改流程，编辑相册操作以覆盖方式进行 begin
							%% 尝试生成新的身份证信息
							%% 其中验证了添加重复值、删除不存在值、编辑后结果雷同的情况
							{_, IdentityOld} = identityState:queryIdentity(RoleID),
							case editIdentity_Pics_NewIdentity(MD5, IdentityOld, Pos) of
								{true, _IdentityNew, MD5Del} ->
									case MD5 of
										[] ->
											skip;
										_ ->
											%% 添加照片时需要做更多的事
											%% 发送一个延时消息作为超时处理，并记录下任务信息
											TimeR = erlang:send_after(?UpOrDownLoadTaskOutTime, self(), ?UpOrDownLoadTaskMsgID),
											TaskInfo =
												#upOrDownLoadTask{
													timeR = TimeR,
													isOpen = false,
													timeBegin = time:getSyncUTCTimeFromDBS(),
													md5 = MD5,
													sizeMax = Size,
													upOrDown = true,
													size = 0,
													pos = Pos
												},
											playerState2:setIdentityUporDownLoadTaskInfo(TaskInfo)
									end,
									psMgr:sendMsg2PS(?PsNameIdentity, identity_edit_pic, {RoleID, Pos, MD5Del, MD5});
								_ ->
									?LOG_OUT("[DebugForIdentity] editIdentity_Pics skip RoleID(~p) same data", [RoleID]),
									skip
							end
%% 20161229 更改流程，编辑相册操作以覆盖方式进行 end
					end;
				_ ->
					?LOG_OUT("[DebugForIdentity] editIdentity_Pics skip RoleID(~p) Data(~w)", [RoleID, MD5]),
					skip
			end
	end,
	ok.

%% 编辑相册反馈（仅需要上传数据的情况）
-spec editIdentity_PicsAck({MD5::list(), IsExists::boolean()}) -> ok.
editIdentity_PicsAck({MD5, false}) ->
	?LOG_OUT("[DebugForIdentity] editIdentity_PicsAck false RoleID(~p)", [playerState:getRoleID()]),
	%% 检查任务是否有效
	case playerState2:getIdentityUporDownLoadTaskInfo() of
		#upOrDownLoadTask{md5 = MD5, isOpen = false, upOrDown = true} = TaskInfo ->
			%% 开放上传
			playerState2:setIdentityUporDownLoadTaskInfo(TaskInfo#upOrDownLoadTask{isOpen = true, index = -1}),
			Msg = #pk_GS2U_IdentityPicUpload_Ack{md5 = MD5, isComplete = false},
			playerMsg:sendNetMsg(Msg);
		_T ->
			?WARN_OUT("[DebugForIdentity] editIdentity_PicsAck false RoleID(~p)~n~p", [playerState:getRoleID(), _T]),
			skip
	end,
	ok;
editIdentity_PicsAck({MD5, true}) ->
	?LOG_OUT("[DebugForIdentity] editIdentity_PicsAck true RoleID(~p)", [playerState:getRoleID()]),
	%% 删除任务直接提示上传成功
	case playerState2:getIdentityUporDownLoadTaskInfo() of
		#upOrDownLoadTask{md5 = MD5, isOpen = false, upOrDown = true} = TaskInfo ->
			erlang:cancel_timer(TaskInfo#upOrDownLoadTask.timeR),

			%% 照片上传成就
			%%playerAchieve:achieveEvent(?Achieve_Social_Event1,[1]),
			playerState2:setIdentityUporDownLoadTaskInfo(undefined),
			Msg = #pk_GS2U_IdentityPicUpload_Ack{md5 = MD5, isComplete = true},
			playerMsg:sendNetMsg(Msg);
		_T ->
			?WARN_OUT("[DebugForIdentity] editIdentity_PicsAck true RoleID(~p)~n~p", [playerState:getRoleID(), _T]),
			skip
	end,
	ok.

%% 编辑身份证信息反馈
%% 注1：反馈所有身份证信息的编辑反馈，包括标签、相册
%% 注2：点赞值和魅力值除外，不受玩家编辑，而是其它功能调用
-spec editIdentityAck({IDIT::type_idit(), Data::term()}) -> ok.
editIdentityAck({_IDIT, _Data} = Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] editIdentityAck IDIT(~p) RoleID(~p) Data(~p)", [_IDIT, playerState:getRoleID(), _Data]),
	playerMsg:sendNetMsg(editIdentityAck_Data2Msg(Msg)),
	ok.

%% 上传图片
-spec picUpload({MD5::list(), Count::uint16(), Index::uint16(), Data::list()}) -> ok.
picUpload({MD5, _Count, Index, Data}) ->
	?LOG_OUT("[DebugForIdentity] picUpload RoleID(~p) Msg(~p)", [playerState:getRoleID(), {MD5, _Count, Index}]),
	%% 检查任务是否有效
	case playerState2:getIdentityUporDownLoadTaskInfo() of
		#upOrDownLoadTask{md5 = MD5, isOpen = true, upOrDown = true, index = IndexOld} = TaskInfo when IndexOld =:= Index - 1 ->
			SizeNew = TaskInfo#upOrDownLoadTask.size + erlang:length(Data),
			DataNew = TaskInfo#upOrDownLoadTask.data ++ Data,
			%?DEBUG_OUT("[DebugForIdentity] picUpload RoleID(~p) sizeOld(~p) sizeNew(~p) sizeMax(~p)", [playerState:getRoleID(), TaskInfo#upOrDownLoadTask.size, SizeNew, TaskInfo#upOrDownLoadTask.sizeMax]),
			case SizeNew > TaskInfo#upOrDownLoadTask.sizeMax of
				true ->
					%% 数据超量，传输失败
					%% 关闭计时器并结束任务
					erlang:cancel_timer(TaskInfo#upOrDownLoadTask.timeR),
					playerState2:setIdentityUporDownLoadTaskInfo(undefined),
					error_code({?ErrorCode_IdentityPicUp_Invalid, []});
				_ ->
					case SizeNew < TaskInfo#upOrDownLoadTask.sizeMax of
						true ->
							%% 数据不足，保存后等待下一波数据
							TaskInfoNew = TaskInfo#upOrDownLoadTask{index = Index, size = SizeNew, data = DataNew},
							?LOG_OUT("[DebugForIdentity] picUpload wait RoleID(~p) Msg(~p)", [playerState:getRoleID(), Index]),
							playerState2:setIdentityUporDownLoadTaskInfo(TaskInfoNew);
						_ ->
							%% 关闭计时器并结束任务
							erlang:cancel_timer(TaskInfo#upOrDownLoadTask.timeR),
							playerState2:setIdentityUporDownLoadTaskInfo(undefined),
							%% 传输完毕，校验MD5码是否正确
							case erlang:binary_to_list(erlang:md5(DataNew)) of
								MD5 ->
									%% 数据校验通过，向公共进程请求保存数据
									playerAchieve:achieveEvent(?Achieve_Social_Event1,[1]),
									Msg = #pk_GS2U_IdentityPicUpload_Ack{md5 = MD5, isComplete = true},
									playerMsg:sendNetMsg(Msg),
									psMgr:sendMsg2PS(?PsNameIdentity, identity_picUp, {playerState:getRoleID(), MD5, DataNew, TaskInfo#upOrDownLoadTask.pos});
								MD5_erlang ->
									%% 数据校验未通过，传输失败
									?WARN_OUT("picUpload RoleID(~p) MD5(~p) is not MD5_erlang(~p)~n~p", [playerState:getRoleID(), MD5, MD5_erlang, DataNew]),
									error_code({?ErrorCode_IdentityPicUp_Invalid, []})
							end
					end
			end;
		_T ->
			%% 网络请求与缓冲的任务不符，忽略
			?WARN_OUT("[DebugForIdentity] picUpload RoleID(~p)~n~p~n~p", [playerState:getRoleID(), {MD5, _Count, Index}, _T]),
			skip
	end,
	ok.

%% 下载图片_开始
-spec picDownloadBegin({MD5::list(), ID::uint64()|0}) -> ok.
picDownloadBegin({[], _ID}) ->
	?DEBUG_OUT("[DebugForCross] face ~w []", [_ID]),
	skip;
picDownloadBegin({MD5, 0}) ->
%%	?DEBUG_OUT("[DebugForIdentity] picDownload RoleID(~p) Msg(~p)", [playerState:getRoleID(), {MD5}]),
	case playerState2:getIdentityUporDownLoadTaskInfo() of
		undefined ->
			%% 首先在本进程验证图片是否存在
			{InMain, State, Data} =
				case identityState:queryPicsMain(MD5) of
					#rec_pic_data_main{state = StateMain, data = DataMain} ->
						{true, StateMain, DataMain};
					_ ->
						case identityState:queryPicsSub(MD5) of
							#rec_pic_data_sub{state = StateSub} ->
								{false, StateSub, []};
							_ ->
								{none, 0, []}
						end
				end,
			case InMain of
				none ->
					%% 数据不存在，需要重新上传
					%% 该异常由非errorcode的协议进行回复
					playerMsg:sendNetMsg(#pk_GS2U_IdentityPicDownloadError_Ack{md5 = MD5, error = ?IDDER_NotExists});
				_ ->
					case State of
						?IDDER_NotExists ->
							%% 此处表示审核通过，详见?IDDER_NotExists注释
							%% 创建下载任务
							TimeR = erlang:send_after(?UpOrDownLoadTaskOutTime, self(), ?UpOrDownLoadTaskMsgID),
							SizeMax = erlang:length(Data),
							TaskInfo =
								#upOrDownLoadTask{
									timeR = TimeR,
									isOpen = false,
									timeBegin = time:getSyncUTCTimeFromDBS(),
									md5 = MD5,
									sizeMax = SizeMax,
									index = 0,
									upOrDown = false,
									size = SizeMax,
									data = []
								},
							playerState2:setIdentityUporDownLoadTaskInfo(TaskInfo),
							case InMain of
								true ->
									%% 主表中有数据，直接执行任务
									picDownloadBeginAck({true, MD5, State, Data});
								_ ->
									%% 副表中有数据，但是需要先从数据库中进行加载
									psMgr:sendMsg2PS(?PsNameIdentity, identity_picDown, {playerState:getRoleID(), MD5})
							end;
						_ ->
							%% 审核中或无法审核等其它异常，不提供下载
							%% 该异常由非errorcode的协议进行回复
							playerMsg:sendNetMsg(#pk_GS2U_IdentityPicDownloadError_Ack{md5 = MD5, error = State})
					end
			end;
		_ ->
			error_code({?ErrorCode_IdentityEdit_UpOrDownOnlyOne, []})
	end,
	ok;
picDownloadBegin({MD5, RoleID}) ->
	case core:isCross() of
		true ->
			case core:getRealDBIDByUID(RoleID) of
				0 ->
					picDownloadBegin({MD5, 0});
				DBID1 ->
					?DEBUG_OUT("[DebugForCross] face ~w []", [RoleID]),
					picDownloadBeginCross(DBID1, MD5, true, 0)
			end;
		_ ->
			MyDBID = globalSetup:getDBID(),
			case core:getRealDBIDByUID(RoleID) of
				0 ->
					picDownloadBegin({MD5, 0});
				MyDBID ->
					picDownloadBegin({MD5, 0});
				DBID2 ->
					picDownloadBeginCross(DBID2, MD5, false, MyDBID)
			end
	end.

picDownloadBeginCross(DBID, MD5, IsCross, MyDBID) ->
	%% bu创建下载任务
	RoleID = playerState:getRoleID(),
	case IsCross of
		true ->
			gsSendMsg:sendMsg2OneSource(DBID, ?PsNameIdentity, friend2Cross_pic, {MD5, MyDBID, RoleID});
		_ ->
			gsSendMsg:sendMsg2NormalServer(DBID, ?PsNameIdentity, friend2Cross_pic, {MD5, MyDBID, RoleID})
	end.

%% 反馈下载图片_开始
-spec picDownloadBeginAck({IsExists::boolean(), MD5::list(), State::uint8(), Data::list()}) -> ok.
picDownloadBeginAck({IsExists, MD5, State, Data}) ->
%%	?DEBUG_OUT("[DebugForIdentity] picDownloadBeginAck RoleID(~p) Msg(~p)", [playerState:getRoleID(), {IsExists, MD5, State}]),
	case playerState2:getIdentityUporDownLoadTaskInfo() of
		#upOrDownLoadTask{timeR = TimeR, md5 = MD5, isOpen = false, upOrDown = false} = TaskInfo ->
			case IsExists of
				false ->
					%% 数据不存在，需要重新上传，并关闭任务
					%% 该异常由非errorcode的协议进行回复
					erlang:cancel_timer(TimeR),
					playerState2:setIdentityUporDownLoadTaskInfo(undefined),
					playerMsg:sendNetMsg(#pk_GS2U_IdentityPicDownloadError_Ack{md5 = MD5, error = ?IDDER_NotExists});
				_ ->
					%% 通知公共进程更新最近下载时间
					psMgr:sendMsg2PS(?PsNameIdentity, identity_picWantDown, MD5),
					case State of
						?IDDER_NotExists ->
							%% 此处表示审核通过，详见?IDDER_NotExists注释
							%% 打开任务，开始下载
							playerState2:setIdentityUporDownLoadTaskInfo(TaskInfo#upOrDownLoadTask{isOpen = true, data = Data}),
							picDownloadContinue({MD5});
						_ ->
							%% 审核中或无法审核等其它异常，不提供下载，并关闭任务
							%% 该异常由非errorcode的协议进行回复
							erlang:cancel_timer(TimeR),
							playerState2:setIdentityUporDownLoadTaskInfo(undefined),
							playerMsg:sendNetMsg(#pk_GS2U_IdentityPicDownloadError_Ack{md5 = MD5, error = State})
					end
			end;
		_T ->
%%			?DEBUG_OUT("[DebugForIdentity] picDownloadBeginAck RoleID(~p) MD5(~p)~n~p", [playerState:getRoleID(), MD5, _T]),
			skip
	end,
	ok.

%% 下载图片_继续
-spec picDownloadContinue({MD5::list()}) -> ok.
picDownloadContinue({MD5}) ->
%%	?DEBUG_OUT("[DebugForIdentity] picDownloadContinue RoleID(~p) Msg(~p)", [playerState:getRoleID(), {MD5}]),
	case playerState2:getIdentityUporDownLoadTaskInfo() of
		#upOrDownLoadTask{timeR = TimeR, md5 = MD5, isOpen = true, upOrDown = false, sizeMax = SizeMax, index = Index, data = Data, size = Size} = TaskInfo ->
			%% 截取分段数据
			{DataA, DataB} =
				case Size >= ?DownLoadDataCell of
					true ->
						lists:split(?DownLoadDataCell, Data);
					_ ->
						{Data, []}
				end,
			%% 判断任务是否完成
			case DataB of
				[] ->
					%% 任务完成，关闭任务
					erlang:cancel_timer(TimeR),
					playerState2:setIdentityUporDownLoadTaskInfo(undefined);
				_ ->
					%% 更新任务信息
					playerState2:setIdentityUporDownLoadTaskInfo(TaskInfo#upOrDownLoadTask{
						index = Index + 1,
						size = Size - ?DownLoadDataCell,
						data = DataB
					})
			end,
			%% 发送数据
			Msg =
				#pk_GS2U_IdentityPicDownloadData_Ack{
					md5 = MD5,
					size = SizeMax,
					count = misc:ceil(SizeMax / ?DownLoadDataCell),
					index = Index,
					data = DataA
				},
%%			?DEBUG_OUT("AAA:~p ~p,~p BBB", [playerState:getRoleID(), SizeMax, erlang:length(DataA)]),
			playerMsg:sendNetMsg(Msg);
		_T ->
%%			?DEBUG_OUT("[DebugForIdentity] picDownloadBeginAck RoleID(~p) MD5(~p)~n~p", [playerState:getRoleID(), MD5, _T]),
			skip
	end,
	ok.

%% 上传或下载任务超时
-spec picOutTime() -> ok.
picOutTime() ->
	case playerState2:getIdentityUporDownLoadTaskInfo() of
		#upOrDownLoadTask{upOrDown = UpOrDown} = _Rec ->
			?LOG_OUT("[DebugForIdentity] picOutTime RoleID(~p)~n~p", [playerState:getRoleID(), _Rec]),
			case UpOrDown of
				true ->
					error_code({?ErrorCode_IdentityPicUp_OutTime, []});
				_ ->
					error_code({?ErrorCode_IdentityPicDown_OutTime, []})
			end,
			time:getSyncUTCTimeFromDBS(),
			playerState2:setIdentityUporDownLoadTaskInfo(undefined);
		_ ->
			?LOG_OUT("[DebugForIdentity] picOutTime RoleID(~p) skip", [playerState:getRoleID()]),
			skip
	end,
	ok.

%% 请求角色的头像图片
-spec requestRoleHeadPic(Heads::[#pk_RoleHeadPic{},...], RetList::[#pk_RoleHeadPic{},...]) -> [#pk_RoleHeadPic{},...].
requestRoleHeadPic([], RetList) ->
	RetList;
requestRoleHeadPic(#pk_RoleHeadPic{roleID = RoleID, md5 = MD5}, RetList) ->
	case identityState:queryIdentity(RoleID) of
		{true, #rec_player_identity{face = MD5}} ->
			RetList;
		{true, #rec_player_identity{face = FaceMD5}} ->
			[#pk_RoleHeadPic{roleID = RoleID, md5 = FaceMD5} | RetList];
		_ ->
			RetList
	end;
requestRoleHeadPic([#pk_RoleHeadPic{} = Head|Heads], RetList) ->
	RetList2 = requestRoleHeadPic(Head, RetList),
	requestRoleHeadPic(Heads, RetList2).

%%%-------------------------------------------------------------------
% 查询头像
-spec queryFace(RoleID::uint64()) -> string().
queryFace(RoleID) ->
	case ets:lookup(?EtsIdentityData, RoleID) of
		[#rec_player_identity{face = Face}] ->
			Face;
		_ ->
			""
	end.

% 查询点赞值
-spec queryLike(RoleID::uint64()) -> uint32().
queryLike(RoleID) ->
	case ets:lookup(?EtsIdentityData, RoleID) of
		[#rec_player_identity{like = Like}] ->
			Like;
		_ ->
			0
	end.

%%%-------------------------------------------------------------------
% 查询魅力值
-spec queryCharm(RoleID::uint64()) -> uint32().
queryCharm(RoleID) ->
	case ets:lookup(?EtsIdentityData, RoleID) of
		[#rec_player_identity{charm = Charm}] ->
			Charm;
		_ ->
			0
	end.

%%%-------------------------------------------------------------------
% 增加点赞值
-spec addLike(RoleID::uint64(), TargetRoleID::uint64(), Like::uint32()) -> no_return().
addLike(RoleID, TargetRoleID, Like) when erlang:is_integer(Like), Like > 0 ->
	psMgr:sendMsg2PS(?PsNameIdentity, identity_like, {RoleID, TargetRoleID, Like}).

%%%-------------------------------------------------------------------
% 增加魅力值
-spec addCharm(RoleID::uint64(), TargetRoleID::uint64(), Charm::uint32()) -> no_return().
addCharm(RoleID, TargetRoleID, Charm) when erlang:is_integer(Charm), Charm > 0 ->
	psMgr:sendMsg2PS(?PsNameIdentity, identity_charm, {RoleID, TargetRoleID, Charm}).

%%%-------------------------------------------------------------------
% 赠礼
-spec giveGift(TarRoleID::uint64(), ItemID::uint16(), ItemCount::uint16(), Content::string()) -> no_return().
giveGift(0, _ItemID, _ItemCount, _Content) ->
	skip;
giveGift(_TarRoleID, 0, _ItemCount, _Content) ->
	skip;
giveGift(_TarRoleID, _ItemID, 0, _Content) ->
	skip;
giveGift(TarRoleID, ItemID, ItemCount, []) ->
	%% 获取默认祝福语
	case getCfg:getCfgPStack(cfg_globalsetup, giveGiftString) of
		#globalsetupCfg{setpara = L} ->
			FunIndex =
				fun(C, {_, I}) ->
					case ItemCount < C of
						true ->
							{true, I};
						_ ->
							{false, I + 1}
					end
				end,
			case misc:foldlEx(FunIndex, {false, 0}, L) of
				{_, 0} ->
					?ERROR_OUT("can not match ~w from globalsetup.giveGiftString:~w", [ItemCount, L]),
					skip;
				{_, Index} ->
					Key = erlang:list_to_atom(lists:flatten(io_lib:format("giveGiftString~w", [Index]))),
					case stringCfg:getString(Key) of
						[] ->
							skip;
						Content ->
							giveGift(TarRoleID, ItemID, ItemCount, Content)
					end
			end;
		_ ->
			skip
	end;
giveGift(TarRoleID, ItemID, ItemCount, Content) ->
	RoleLevel = playerState:getLevel(),
	case getCfg:getCfgPStack(cfg_globalsetup, giveGiftLevel) of
		#globalsetupCfg{setpara = [LevelMin]} when RoleLevel >= LevelMin ->
			case playerState:getRoleID() of
				TarRoleID ->
					?ERROR_CODE(?ErrorCode_GiveGift_Self);
				RoleID ->
					case core:queryRoleKeyInfoByRoleID(TarRoleID) of
						#?RoleKeyRec{} ->
							case getCfg:getCfgByKey(cfg_item, ItemID) of
								#itemCfg{
									itemType = ?ItemTypeGift,
									level = Level,
									useParam1 = Charm,
									useParam2 = Friendly
								} when RoleLevel >= Level,
									erlang:is_integer(Charm), Charm >= 0,
									erlang:is_integer(Friendly), Friendly >= 0 ->
									ItemCountOld = playerPackage:getItemNumByID(ItemID),
									case ItemCountOld >= ItemCount of
										true ->
											giveGiftDo(RoleID, TarRoleID, ItemID, ItemCount, Content, Friendly, Charm, ItemCountOld);
										_ ->
											?ERROR_CODE(?ErrorCode_ActExchange_ItemNotEnough)
									end;
								_ ->
									?ERROR_CODE(?ErrorCode_YourLevelIsTooLower)	%% 配置错误也会报这个ErrorCode
							end;
						_ ->
							?ERROR_CODE(?ErrorCode_SystemWarning)
					end
			end;
		_ ->
			?ERROR_CODE(?ErrorCode_YourLevelIsTooLower)	%% 功能未开放
	end.

% 赠礼_执行
giveGiftDo(RoleID, TarRoleID, ItemID, ItemCount, Content, Friendly, Charm, ItemCountOld) ->
	%% 扣除道具
	FriendlyAll =
		case friend2State:queryFRT(RoleID, TarRoleID) of
			?FRT_Formal ->
				Friendly * ItemCount;
			_ ->
				0
		end,
	CharmAll = Charm * ItemCount,
	PLog = #recPLogTSItem{
		old = ItemCount,
		change = -ItemCount,
		target = ?PLogTS_GiveGift,
		source = ?PLogTS_PlayerSelf,
		changReason = ?ItemDeleteReasonGiveGift,
		reasonParam = TarRoleID
	},
	case playerPackage:delGoodsByID(?Item_Location_Bag, ItemID, ItemCount, PLog) of
		true ->
			ContentNew =
				case getCfg:getCfgPStack(cfg_globalsetup, giveGiftVIP) of
					#globalsetupCfg{setpara = [Limit]} when
						erlang:is_integer(Limit), ItemCount >= Limit ->
						Content;
					_ ->
						[]
				end,
			psMgr:sendMsg2PS(?PsNameIdentity, giveGift, {RoleID, TarRoleID, ItemID, ItemCount, CharmAll, FriendlyAll, ContentNew});
		_ ->
			?ERROR_OUT(
				"playerPackage:delGoodsByID/4 failed oldItemCount:~w wantDelItemCount:~w newItemCount:~w roleID:~w",
				[ItemCountOld, ItemCount, playerPackage:getItemNumByID(ItemID), RoleID]
			),
			?ERROR_CODE(?ErrorCode_ActExchange_ItemNotEnough)
	end.

%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%% 加工原始身份证信息为网络消息（别人的信息）
-spec identity2NetMsgAnother(Identity::#rec_player_identity{}, Code::uint64()) -> #pk_GS2U_Identity_Ack{}.
identity2NetMsgAnother(
		#rec_player_identity{
			roleID = RoleID,
			face = Face,
			age = Age,
			birthmonth = Birthmonth,
			birthday = Birthday,
			zodiac = Zodiac,
			bloodType = BloodType,
			hometown1 = Hometown1,
			hometown2 = Hometown2,
			location1 = Location1,
			location2 = Location2,
			tags = Tags,
			sign = Sign,
			pic1 = Pic1,
			pic2 = Pic2,
			pic3 = Pic3,
			like = Like,
			charm = Charm
}, Code) ->
	{Name, Level, Career, Race, Sex, VipLv} =
		case core:queryRoleKeyInfoByRoleID(RoleID) of
			#?RoleKeyRec{roleName = Name1, level = Level1, career = Career1, race = Race1, sex = Sex1, vipLv = VipLv1} ->
				{Name1, Level1, Career1, Race1, Sex1, VipLv1};
			_ ->
				?ERROR_OUT("identity2NetMsgAnother can not find RoleID(~p) from  core:queryRoleKeyInfoByRoleID/1", [RoleID]),
				{[], 0, 0, 0, 0, 0}
		end,
	RoleIDMine = playerState:getRoleID(),
	IsGiveLike = daily2State:queryDaily2(RoleIDMine, RoleID, ?Daily2Type_S_Friend2Like) > 0,
	%% 获取家族（军团）名
	FamilyName =
		case ets:lookup(rec_guild_member, RoleID) of
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
	#pk_GS2U_Identity_Ack{
		id = RoleID,
		code = Code,
		name = Name,
		idi_face = Face,
		level = Level,
		career = Career,
		race = Race,
		sex = Sex,
		vipLv = VipLv,
		like = Like,
		charm = Charm,
		isGiveLike = IsGiveLike,
		familyName = FamilyName,
		idi_age = Age,
		idi_birthmonth = Birthmonth,
		idi_birthday = Birthday,
		idi_zodiac = Zodiac,
		idi_bloodType = BloodType,
		idi_hometown1 = Hometown1,
		idi_hometown2 = Hometown2,
		idi_location1 = Location1,
		idi_location2 = Location2,
		idi_listTag = Tags,
		idi_sign = Sign,
		idi_listPic = [#pk_MD5{md5 = Pic1}, #pk_MD5{md5 = Pic2}, #pk_MD5{md5 = Pic3}]
	}.

%% 加工原始身份证信息为网络消息（自己的信息）
-spec identity2NetMsgMySelf(Identity::#rec_player_identity{}, Code::uint64()) -> #pk_GS2U_Identity_Ack{}.
identity2NetMsgMySelf(
		#rec_player_identity{
			roleID = RoleID,
			face = Face,
			age = Age,
			birthmonth = Birthmonth,
			birthday = Birthday,
			zodiac = Zodiac,
			bloodType = BloodType,
			hometown1 = Hometown1,
			hometown2 = Hometown2,
			location1 = Location1,
			location2 = Location2,
			tags = Tags,
			sign = Sign,
			pic1 = Pic1,
			pic2 = Pic2,
			pic3 = Pic3,
			like = Like,
			charm = Charm
}, Code) ->
	#pk_GS2U_Identity_Ack{
		id = RoleID,
		code = Code,
		name = playerState:getName(),
		idi_face = Face,
		level = playerState:getLevel(),
		career = playerState:getCareer(),
		race = playerState:getRace(),
		sex = playerState:getSex(),
		vipLv = playerState:getVip(),
		like = Like,
		charm = Charm,
		isGiveLike = 1,   %% 不能给自己点赞
		familyName = playerState:getGuildName(),
		idi_age = Age,
		idi_birthmonth = Birthmonth,
		idi_birthday = Birthday,
		idi_zodiac = Zodiac,
		idi_bloodType = BloodType,
		idi_hometown1 = Hometown1,
		idi_hometown2 = Hometown2,
		idi_location1 = Location1,
		idi_location2 = Location2,
		idi_listTag = Tags,
		idi_sign = Sign,
		idi_listPic = [#pk_MD5{md5 = Pic1}, #pk_MD5{md5 = Pic2}, #pk_MD5{md5 = Pic3}]
	}.

%% 取值值区间校验（仅允许合法的值和可用于删除设定的默认值）
-spec checkValueLimit(IDIT::type_idit(), Data::term()) -> true | false.
checkValueLimit(?IDIT_AGE, Age) ->
	[Min, Max] =
		case getCfg:getCfgByKey(cfg_globalsetup, identity_age_limit) of
			#globalsetupCfg{setpara = Value} ->
				Value;
			_ ->
				?ERROR_OUT("checkValueLimit can not find identity_age_limit from cfg_globalsetup"),
				[0, ?DefaultValueOfAge - 1]
		end,
	case (Age >= Min andalso Age =< Max) orelse Age =:= ?DefaultValueOfAge of
		false ->
			error_code({?ErrorCode_IdentityEdit_AgeLimit, [Min, Max]}),
			false;
		_ ->
			true
	end;
checkValueLimit(?IDIT_BIRTH, {Month, Day}) ->
	Result =
		case {Month, Day} of
			{0, 0} ->
				true;
			_ when Day >= 1 ->
				case Month of
					1 -> Day =< 31;
					2 -> Day =< 29;
					3 -> Day =< 31;
					4 -> Day =< 30;
					5 -> Day =< 31;
					6 -> Day =< 30;
					7 -> Day =< 31;
					8 -> Day =< 31;
					9 -> Day =< 30;
					10 -> Day =< 31;
					11 -> Day =< 30;
					12 -> Day =< 31;
					_ -> false
				end;
			_ ->
				false
		end,
	case Result of
		false ->
			error_code({?ErrorCode_IdentityEdit_BirthLimit, []});
		_ ->
			skip
	end,
	Result;
checkValueLimit(?IDIT_ZODIAC, Zodiac) ->
	case Zodiac of
		0 ->
			true;
		_ ->
			case lists:keyfind(Zodiac, 1, getCfg:getKeyList(cfg_identity_zodiac)) of
				false ->
					error_code({?ErrorCode_IdentityEdit_ZodiacLimit, []}),
					false;
				_ ->
					true
			end
	end;
checkValueLimit(?IDIT_BLOOD, BloodType) ->
	case BloodType >= ?BLOOD_UNKNOWN andalso BloodType =< ?BLOOD_O of
		true ->
			true;
		_ ->
			error_code({?ErrorCode_IdentityEdit_BloodTypeLimit, []}),
			false
	end;
checkValueLimit(?IDIT_HOMETOWN, {Hometown1, Hometown2}) ->
	case {Hometown1, Hometown2} of
		{0, 0} ->
			true;
		_ ->
			case getCfg:getCfgByKey(cfg_identity_area, Hometown1, Hometown2) of
				#identity_areaCfg{} ->
					true;
				_ ->
					error_code({?ErrorCode_IdentityEdit_AreaLimit, []}),
					false
			end
	end;
checkValueLimit(?IDIT_LOCATION, {Location1, Location2}) ->
	case {Location1, Location2} of
		{0, 0} ->
			true;
		_ ->
			case getCfg:getCfgByKey(cfg_identity_area, Location1, Location2) of
				#identity_areaCfg{} ->
					true;
				_ ->
					error_code({?ErrorCode_IdentityEdit_AreaLimit, []}),
					false
			end
	end;
%checkValueLimit(?IDIT_TAGS, Tags) ->
%	false;	%% 标签数据不可使用该接口编辑
%checkValueLimit(?IDIT_PIC1, _Pic) ->
%	false;	%% 相册数据不可使用该接口编辑
%checkValueLimit(?IDIT_PIC2, _Pic) ->
%	false;	%% 相册数据不可使用该接口编辑
%checkValueLimit(?IDIT_PIC3, _Pic) ->
%	false;	%% 相册数据不可使用该接口编辑
checkValueLimit(?IDIT_FACE, _Face) ->
	true;
checkValueLimit(?IDIT_SIGN, Sign) ->
	case Sign of
		[] ->
			true;
		_ ->
			CountMax =
				case getCfg:getCfgByKey(cfg_globalsetup, identity_sign_count) of
					#globalsetupCfg{setpara = [CountMax_]} ->
						CountMax_;
					_ ->
						0
				end,
			case erlang:length(Sign) > CountMax of
				true ->
					error_code({?ErrorCode_IdentityEdit_SignLimit, [CountMax]}),
					false;
				_ ->
					true
			end
	end;
%checkValueLimit(?IDIT_LIKE, _Like) ->
%	false;	%% 点赞值数据不可使用该接口编辑
%checkValueLimit(?IDIT_CHARM, _Charm) ->
%	false;	%% 魅力值数据不可使用该接口编辑
checkValueLimit(InvalidIDIT, Data) ->
	?ERROR_OUT("checkValueLimit invalid argument(~p)~n~p", [{InvalidIDIT, Data}, misc:getStackTrace()]).

%% 编辑身份证信息反馈消息转换为网络消息
%% 注：点赞值和魅力值除外，不受玩家编辑，而是其它功能调用
-spec editIdentityAck_Data2Msg({IDIT::type_idit(), Data::term()}) -> term() | error.
editIdentityAck_Data2Msg({?IDIT_AGE, Age}) ->
	#pk_U2GS2U_IdentityEditAge{idi_age = Age};
editIdentityAck_Data2Msg({?IDIT_BIRTH, {Month, Day}}) ->
	#pk_U2GS2U_IdentityEditBirth{idi_birthmonth = Month, idi_birthday = Day};
editIdentityAck_Data2Msg({?IDIT_ZODIAC, Zodiac}) ->
	#pk_U2GS2U_IdentityEditZodiac{idi_zodiac = Zodiac};
editIdentityAck_Data2Msg({?IDIT_BLOOD, Blood}) ->
	#pk_U2GS2U_IdentityEditBloodType{idi_bloodType = Blood};
editIdentityAck_Data2Msg({?IDIT_HOMETOWN, {Hometown1, Hometown2}}) ->
	#pk_U2GS2U_IdentityEditHometown{idi_hometown1 = Hometown1, idi_hometown2 = Hometown2};
editIdentityAck_Data2Msg({?IDIT_LOCATION, {Location1, Location2}}) ->
	#pk_U2GS2U_IdentityEditLocation{idi_location1 = Location1, idi_location2 = Location2};
editIdentityAck_Data2Msg({?IDIT_TAGS, Tags}) ->
	#pk_GS2U_IdentityEditTag_Ack{idi_listTag = Tags};
editIdentityAck_Data2Msg({?IDIT_PIC1, _}) ->
	#pk_GS2U_IdentityEditPic_Ack{idi_listPic = getPics()};
editIdentityAck_Data2Msg({?IDIT_PIC2, _}) ->
	#pk_GS2U_IdentityEditPic_Ack{idi_listPic = getPics()};
editIdentityAck_Data2Msg({?IDIT_PIC3, _}) ->
	#pk_GS2U_IdentityEditPic_Ack{idi_listPic = getPics()};
editIdentityAck_Data2Msg({?IDIT_FACE, Face}) ->
	#pk_U2GS2U_IdentityEditFace{idi_face = Face};
editIdentityAck_Data2Msg({?IDIT_SIGN, Sign}) ->
	#pk_U2GS2U_IdentityEditSign{idi_sign = Sign};
editIdentityAck_Data2Msg({IDIT, Data}) ->
	?ERROR_OUT("editIdentityAck_Data2Msg invalid argument(~p)~n~p", [{IDIT, Data}, misc:getStackTrace()]),
	error.

%% 将所有照片信息收集在一起
-spec getPics() -> [#pk_MD5{}, ...].
getPics() ->
	getPics(playerState:getRoleID()).
-spec getPics(RoleID::uint64()) -> [#pk_MD5{}, ...].
getPics(RoleID) ->
	{_, #rec_player_identity{pic1 = Pic1, pic2 = Pic2, pic3 = Pic3}} = identityState:queryIdentity(RoleID),
	[#pk_MD5{md5 = Pic1}, #pk_MD5{md5 = Pic2}, #pk_MD5{md5 = Pic3}].

%% 增加或删除标签而产生新的身份证信息
-spec editIdentity_Tags_NewIdentity(AddOrDel::boolean(), TagID::uint(), IdentityOld::#rec_player_identity{}) ->
	{true, IdentityNew::#rec_player_identity{}} |
	{false, {}}.
editIdentity_Tags_NewIdentity(true, TagID, IdentityOld) ->
	#globalsetupCfg{setpara = [CountMax]} =
		getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = [0]}, identity_tag_count),
	Count = erlang:length(IdentityOld#rec_player_identity.tags),
	case Count >= CountMax of
		true ->
			error_code({?ErrorCode_IdentityEdit_TagLimitCount, [CountMax]}),
			{false, {}};
		_ ->
			FunAdd =
				fun(ID, {Mark, R}) ->
					case Mark of
						true ->
							case ID of
								TagID ->
									{false, []};
								_ ->
									{Mark, [ID | R]}
							end;
						_ ->
							{Mark, R}
					end
				end,
			{Mark, R} = lists:foldl(FunAdd, {true, []}, IdentityOld#rec_player_identity.tags),
			case Mark of
				true ->
					{Mark, IdentityOld#rec_player_identity{tags = lists:reverse([TagID | R])}};
				_ ->
					error_code({?ErrorCode_IdentityEdit_TagLimit, []}),
					{Mark, {}}
			end
	end;
editIdentity_Tags_NewIdentity(false, TagID, IdentityOld) ->
	FunDel =
		fun(ID, {Mark, R}) ->
			case Mark of
				false ->
					case ID of
						TagID ->
							{true, R};
						_ ->
							{Mark, [ID | R]}
					end;
				_ ->
					{Mark, [ID | R]}
			end
		end,
	{Mark, R} = lists:foldl(FunDel, {false, []}, IdentityOld#rec_player_identity.tags),
	case Mark of
		true ->
			{Mark, IdentityOld#rec_player_identity{tags = lists:reverse(R)}};
		_ ->
			error_code({?ErrorCode_IdentityEdit_TagLimit, []}),
			{Mark, {}}
	end.

%% 20161229 更改流程，编辑相册操作以覆盖方式进行 begin
%%% 相册操作而产生新的身份证信息
%%(OpType::type_idupt(), MD5::list(), Size::uint32()) -> ok.
%-spec editIdentity_Pics_NewIdentity(OpType::type_idupt(), MD5::list(), IdentityOld::#rec_player_identity{}, Pos::uint8()) ->
%	{true, IdentityNew::#rec_player_identity{}} |
%	{false, {}}.
%editIdentity_Pics_NewIdentity(?IDUPT_DEL, MD5, IdentityOld, Pos) when Pos >= 0, Pos < ?CountPics ->
%	PicOld =
%		case Pos of
%			0 ->
%				IdentityOld#rec_player_identity.pic1;
%			1 ->
%				IdentityOld#rec_player_identity.pic2;
%			2 ->
%				IdentityOld#rec_player_identity.pic3
%		end,
%	case PicOld of
%		[] ->
%			error_code({?ErrorCode_IdentityEdit_PicNotExists, []}),
%			{false, {}};
%		_ ->
%			case Pos of
%				0 ->
%					{true, IdentityOld#rec_player_identity{pic1 = []}};
%				1 ->
%					{true, IdentityOld#rec_player_identity{pic2 = []}};
%				2 ->
%					{true, IdentityOld#rec_player_identity{pic3 = []}}
%			end
%	end;
%editIdentity_Pics_NewIdentity(?IDUPT_ADD, MD5, IdentityOld, Pos) when Pos >= 0, Pos < ?CountPics ->
%	PicOld =
%		case Pos of
%			0 ->
%				IdentityOld#rec_player_identity.pic1;
%			1 ->
%				IdentityOld#rec_player_identity.pic2;
%			2 ->
%				IdentityOld#rec_player_identity.pic3
%		end,
%	case PicOld of
%		[] ->
%			case Pos of
%				0 ->
%					{true, IdentityOld#rec_player_identity{pic1 = MD5}};
%				1 ->
%					{true, IdentityOld#rec_player_identity{pic2 = MD5}};
%				2 ->
%					{true, IdentityOld#rec_player_identity{pic3 = MD5}}
%			end;
%		_ ->
%			error_code({?ErrorCode_IdentityEdit_PicIsExists, []}),
%			{false, {}}
%	end.
-spec editIdentity_Pics_NewIdentity(MD5::list(), IdentityOld::#rec_player_identity{}, Pos::uint8()) ->
	{true, IdentityNew::#rec_player_identity{}, MD5Del::list()} |
	false.
editIdentity_Pics_NewIdentity(MD5, IdentityOld, 0) ->
	case IdentityOld#rec_player_identity.pic1 of
		[] when MD5 =/= [] ->
			{true, IdentityOld#rec_player_identity{pic1 = MD5}, []};
		MD5Del when MD5 =/= MD5Del ->
			{true, IdentityOld#rec_player_identity{pic1 = MD5}, MD5Del};
		_ ->
			false
	end;
editIdentity_Pics_NewIdentity(MD5, IdentityOld, 1) ->
	case IdentityOld#rec_player_identity.pic2 of
		[] when MD5 =/= [] ->
			{true, IdentityOld#rec_player_identity{pic2 = MD5}, []};
		MD5Del when MD5 =/= MD5Del ->
			{true, IdentityOld#rec_player_identity{pic2 = MD5}, MD5Del};
		_ ->
			false
	end;
editIdentity_Pics_NewIdentity(MD5, IdentityOld, 2) ->
	case IdentityOld#rec_player_identity.pic3 of
		[] when MD5 =/= [] ->
			{true, IdentityOld#rec_player_identity{pic3 = MD5}, []};
		MD5Del when MD5 =/= MD5Del ->
			{true, IdentityOld#rec_player_identity{pic3 = MD5}, MD5Del};
		_ ->
			false
	end;
editIdentity_Pics_NewIdentity(_MD5, _IdentityOld, _) ->
	false.
%% 20161229 更改流程，编辑相册操作以覆盖方式进行 end


%%%-------------------------------------------------------------------
% 删除角色
-spec deleteRole(RoleID::uint64()) -> ok.
deleteRole(RoleID) ->
	?LOG_OUT("deleteRole ~p", [RoleID]),
	psMgr:sendMsg2PS(?PsNameIdentity, deleteRole, RoleID),
	ok.