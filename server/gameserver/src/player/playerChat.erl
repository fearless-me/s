%%%
%%%玩家聊天相关功能模块

-module(playerChat).
-author(zhongyuanwei).

-include("playerPrivate.hrl").

-define(WORLD_CHAT_MIN_LEVEL,15).%%聊天最低等级
-define(CHAT_MAX_COUNT,1024).%%聊天字符串最大长度

-define(HORN_CHAT_MIN_LEVEL, 30).%%喇叭聊天最低等级
-define(HORN_LIMIT_NUM, 3).      %%喇叭平民使用次数
%%speak间隔时间(单位：秒)
-define(Chat_Space_Time, 10).

-define(Chat_Success, 0).%%聊天成功
-define(Chat_Failed, 1). %%聊天失败

%% ====================================================================
%% 语音定义
%% ====================================================================
-define(Voice_MaxStoreNum, 30000). %%语音保存最多30000条    50 x 15 x 2000 /1024 约  1.4个G
-define(Voice_Begin_Clear, 10000). %%语音10000条开始启动清理功能
-define(Voice_MaxStoreTime, 3600). %%语音最多保存 1个小时
-define(Voice_DownLoad_Failed, -1). %%下载失败
-define(Voice_Commit_Succe, 0). %% 上传成功

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initChatCd/0,		% 聊天CD初始化
	saveChatCd/0,		% 保存玩家下线聊天CD				
	onPlayerChatMsg/1,  % 玩家聊天消息
	sendChatInfo/4,
	storeVoice/1,
	getVoice/1,
	clearOldVoice/0,
	onSystemChatMsg/1,  % 服务器发送系统消息
	onChannelSystemChatMsg/2,    % 服务器发送指针特定频道的系统消息
	onChannelGuildChatMsg/2,
	changeStruct/1,
	playerChangeChatCD/1,
    showHeadEmoticonIcon/1,
    freshHeadEmoticonIcon/0,
	sendLogChatInfo/1
]).

-export([
	getPlayerPerformanceIDList/1
]).

-export([
	getSystemChatInfo/1,
	isOpenWorldChannel/1
]).

-spec initChatCd() -> ok.
initChatCd() ->
	CDTime =
		case playerVipInter:getVipChatCDTime() of
			undefined ->
				case myEts:lookUpEts(?TABLE_CHATCD, playerState:getRoleID()) of
					[#recChatCD{chatCdList= ChatCdList}|_] ->
						ChatCdList;
					_ ->
						getChatCDTime()
				end;
			Time ->
				changeStruct(Time)
		end,
	playerState:setCdChatTime(CDTime),
	ok.

-spec saveChatCd() -> ok.
saveChatCd() ->
	ets:insert(?TABLE_CHATCD, #recChatCD{roleID = playerState:getRoleID(), chatCdList = playerState:getCdChatTime()}),
	ok.

%% 显示头顶表情符号
-spec showHeadEmoticonIcon(IconIndex::uint()) -> ok.
showHeadEmoticonIcon(IconIndex) ->
    Time = time:getUTCNowSec(),
    case Time - playerPropSync:getProp(?SerProp_HeadEmoticonIconTime) > 5 of
        true ->
            playerPropSync:setInt(?SerProp_HeadEmoticonIconTime, Time),
            playerPropSync:setInt(?PubProp_HeadEmoticonIcon, IconIndex),
	        %% 气泡成就
	        playerAchieve:achieveEvent(?Achieve_Social_Event2,[1]),
            ok;
        _ ->
            ?DEBUG_OUT("showHeadEmoticonIcon in time:~p,~p", [playerState:getRoleID(),IconIndex]),
            skip
    end,
    ok.

%% 刷新头顶表情符号
-spec freshHeadEmoticonIcon() -> ok.
freshHeadEmoticonIcon() ->
    case playerPropSync:getProp(?PubProp_HeadEmoticonIcon) /= 0 of
        true ->
            case time:getUTCNowSec() - playerPropSync:getProp(?SerProp_HeadEmoticonIconTime) >= 5 of
                true ->
                    playerPropSync:setInt(?PubProp_HeadEmoticonIcon, 0),
	                 %% 气泡成就
	                playerAchieve:achieveEvent(?Achieve_Social_Event2,[1]);
                _ ->
                    skip
            end;
        _ ->
            skip
    end,
    ok.

%% 获取免费的表情或者动作ID列表,1表情,2动作
-spec getPlayerPerformanceIDList(Type::1 | 2) -> [integer(),...].
getPlayerPerformanceIDList(Type) ->
	L = getCfg:get1KeyList(cfg_bubbleExpression),
	F =
		fun(ID) ->
			case getCfg:getCfgByKey(cfg_bubbleExpression, ID) of
				#bubbleExpressionCfg{type = Type, lock = 0} ->
					true;
				_ ->
					false
			end
		end,
	lists:filter(F, L).

%%聊天消息处理
-spec onPlayerChatMsg(ChatInfo) -> ok when
	ChatInfo :: #pk_U2GS_ChatInfo{}.
onPlayerChatMsg(#pk_U2GS_ChatInfo{channel = Channel, receiverID = ReceiverID, content = Content} = ChatInfo) ->
	IsGMCmd =
		case playerState:getGmLevel() > 0 of
			true ->
				%% 尝试执行GM指令
				playerGM:execGM(Content);
			_ ->
				false
		end,

	case IsGMCmd of
		false ->
			case isPlayerCanChat(Channel, ReceiverID, Content) of
				true->
					sendLogChatInfo(ChatInfo),
					onChatMsg(ChatInfo);
				false->
					ok
			end;
		_ ->
			skip
	end,
	ok.

%% 系统发消息到客户端
-spec onSystemChatMsg(Content::list()) -> ok.
onSystemChatMsg(Content) ->
	case isOpenChannel(?CHAT_CHANNEL_SYSTEM) of
		true ->
			ChatInfo = getSystemChatInfo(Content),
			playerMsg:sendNetMsg(ChatInfo);
		_ ->
			%%玩家不希望收到系统消息
			skip
	end,
	ok.

%% 对某指定家族发送家族消息
-spec onChannelGuildChatMsg(TargetGuildID::uint64(), Content::list()) -> ok.
onChannelGuildChatMsg(_, "") ->
	ok;
onChannelGuildChatMsg(0, _Content) ->
	ok;
onChannelGuildChatMsg(TargetGuildID, Content) ->
	ChatInfo = getSystemChatInfo(?CHAT_CHANNEL_GUILD, Content),
	case playerState:getGuildID() > 0 of
		true ->
			PidList = playerGuild:getOnlineMemberPid(TargetGuildID),
			sendChatMsgToClient(ChatInfo, PidList, false);
		_ ->
			?ERROR_OUT("onChannelGuildChatMsg.CHAT_CHANNEL_LEAGUE:~p,~s", [playerState:getRoleID(),Content]),
			skip
	end,
	ok.

%% 对某频道发送系统消息
-spec onChannelSystemChatMsg(chatChannelEnum(), Content::list()) -> ok.
onChannelSystemChatMsg(?CHAT_CHANNEL_GUILD, Content) ->
	ChatInfo = getSystemChatInfo(?CHAT_CHANNEL_GUILD, Content),
	case playerState:getGuildID() > 0 of
		true ->
			PidList = playerGuild:getOnlineMemberPid(),
			sendChatMsgToClient(ChatInfo, PidList, false);
		_ ->
			?ERROR_OUT("onChannelSystemChatMsg.CHAT_CHANNEL_LEAGUE:~p,~s", [playerState:getRoleID(),Content]),
			skip
	end,
	ok;
onChannelSystemChatMsg(?CHAT_CHANNEL_SYSTEM, Content) ->
	ChatInfo = getSystemChatInfo(Content),
    onSendWorldMsg(ChatInfo, false),
	ok;
onChannelSystemChatMsg(UnDefChannelType, Content) ->
	?ERROR_OUT("onChannelSystemChatMsg:~p,~p,~s", [playerState:getRoleID(),UnDefChannelType,Content]),
	ok.

%% 优化方式发送世界聊天
onSendWorldMsg(#pk_GS2U_Chatinfo{channel = Channel} = Msg, IsCheck) ->
	case canSendChat() of
        true ->
			SenderNetPid = playerState:getNetPid(),
			RoleID = playerState:getRoleID(),
            %% 允许聊天
			case Channel of
				?CHAT_CHANNEL_WORLD ->
					psMgr:sendMsg2PS(?ChatOtp, sendWorldMsg,
						{Msg, IsCheck, playerState:getRoleID(), self(), SenderNetPid});
				_ ->
					%% 系统消息和喇叭消息，强制发送
					Fun =
						fun(#rec_OnlinePlayer{roleID = TargetRoleID, pid = _PlayerPid, netPid = NetPid}, _) ->
							case isOpenChannel(TargetRoleID, Channel) of
								true ->
									case friend2State:isBlack(TargetRoleID, RoleID) of
										true ->
											skip;
										_ ->
											playerMsg:sendNetMsg(NetPid, Msg)
									end;
								_ ->
									skip
							end
						end,
					ets:foldl(Fun, [], ets_rec_OnlinePlayer)
			end;
        _ ->
            %% 只能发给自己
			playerMsg:sendNetMsg(Msg)
    end,
    ok.

%% 频道开关判断,玩家是否开启了此频道
-spec isOpenChannel(Channel::uint()) -> boolean().
isOpenChannel(Channel) ->
	isOpenChannel(playerState:getRoleID(), Channel).

%% 频道开关判断,玩家是否开启了此频道
-spec isOpenChannel(RoleID::uint64(), Channel::uint()) -> boolean().
isOpenChannel(RoleID, Channel) ->
	case core:isCross() of
		true ->
			true;
		_ ->
			case Channel of
				?CHAT_CHANNEL_WORLD  ->
					variant:getPlayerBitVariant(RoleID, ?Setting_PlayerBitVar_WorldChatMsg);
				?CHAT_CHANNEL_PRIVATE  ->
					variant:getPlayerBitVariant(RoleID, ?Setting_PlayerBitVar_PrivateChatMsg);
				?CHAT_CHANNEL_TEAM  ->
					variant:getPlayerBitVariant(RoleID, ?Setting_PlayerBitVar_TeamChatMsg);
				?CHAT_CHANNEL_GUILD  ->
					variant:getPlayerBitVariant(RoleID, ?Setting_PlayerBitVar_GuildChatMsg);
				?CHAT_CHANNEL_SYSTEM  ->
					variant:getPlayerBitVariant(RoleID, ?Setting_PlayerBitVar_SystemMsg);
				?CHAT_CHANNEL_HORN ->
					true;
				_ ->
					false
			end
	end.

%% 玩家是否打开了聊天频道
-spec isOpenWorldChannel(RoleID::uint64()) -> boolean().
isOpenWorldChannel(RoleID) ->
	case core:isCross() of
		true ->
			true;
		_ ->
			variant:getPlayerBitVariant(RoleID, ?Setting_PlayerBitVar_WorldChatMsg)
	end.

%% (跟发送者的关系确认)发送消息
%%%% 消息接收（自己也会收到自己发送的消息） 20161026验证
-spec sendChatInfo(ChatInfo, SenderNetPid, SenderPid, IsCheck) -> ok when
	ChatInfo :: #pk_GS2U_Chatinfo{},
	SenderNetPid :: pid(),
	SenderPid :: pid(),
	IsCheck ::boolean().
sendChatInfo(#pk_GS2U_Chatinfo{channel = Channel, senderID = SenderID} = ChatInfo, _SenderNetPid, _SenderPid, _IsCheck) ->
	case isOpenChannel(Channel) of
		true ->
			case Channel of
				?CHAT_CHANNEL_PRIVATE ->
					%% 私聊频道才判断是否添加临时好友
					playerFriend2:addTemp(SenderID),  %% 收到的对方的私聊消息，尝试添加对方为临时好友
					ok;
				_ -> skip
			end,

			playerMsg:sendNetMsg(ChatInfo);
		_ ->
			skip %% 玩家设置了拒绝接受
	end,
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================

getTalkMaxLength()->
	case getCfg:getCfgByKey(cfg_globalsetup, talk_name_max_length) of
		#globalsetupCfg{setpara = [LenMax]} ->
			LenMax;
		_ ->
			?CHAT_MAX_COUNT
	end.

%%玩家进程调用是否能够发言
-spec isPlayerCanChat(Channel ::chatChannelEnum() ,ReceiverID :: uint(), Content :: string()) -> boolean().
isPlayerCanChat(Channel,ReceiverID, Content) ->
    Now = time:getUTCNowSec(),
    LastChatTime = playerState:getLastChatTime(Channel),
    DenyChatTime = playerState:getDenyChatTime(),
    CDTime =  getChannelCD(Channel),
    #globalsetupCfg{setpara = [ItemId]}  = getCfg:getCfgByKey(cfg_globalsetup, horn_item),
    case checkChatTask(Channel) of
        ?Chat_Success ->
            Result0 = checkChatTime(DenyChatTime, Now),
            Result1 = checkCDTime(Result0, LastChatTime, Now, CDTime),
            Result2 = checkChatSelf(Result1, ReceiverID),
            NewResults =
                if
                    Channel =:= ?CHAT_CHANNEL_HORN ->
                        Result4 = checkVipLimitNum(Result2, ItemId),
                        checkUserHornItem(Result4, ItemId);
                    Channel =:= ?CHAT_CHANNEL_WORLD ->
                        checkWorldChatDailyCount(Result2);
                    true ->
                        Result2
                end,
            LenMax = getTalkMaxLength(),
            NewResult = checkMsgLength(NewResults, Content, LenMax),
            if
                NewResult =:= ?Chat_Success ->
                    playerState:setLastChatTime(Now, Channel),
                    true;
                NewResult =:= ?Chat_Failed ->
                    false;
                true ->
                    playerMsg:sendErrorCodeMsg(NewResult),
                    false
            end;
        _ ->
            false
    end.

%% （按频道）处理聊天消息
-spec onChatMsg(ChatInfo) -> ok when
	ChatInfo :: #pk_U2GS_ChatInfo{}.
%% 世界消息
onChatMsg(#pk_U2GS_ChatInfo{channel = ?CHAT_CHANNEL_WORLD, content = Content}) ->
    playerDaily:incDailyCounter(?DailyType_ChatCount, 0),
	Msg = getPlayerChatInfo(?CHAT_CHANNEL_WORLD, Content),
    onSendWorldMsg(Msg, false),
	ok;

%% 私人消息
%%%% 消息发送 20161026验证
onChatMsg(#pk_U2GS_ChatInfo{channel = ?CHAT_CHANNEL_PRIVATE,
	receiverID = ReceiverID,
	content = Content}) ->
	case playerMgrOtp:getOnlinePlayerInfoByID(ReceiverID) of
		#rec_OnlinePlayer{pid = PlayerPid} ->
			case friend2State:isBlack(ReceiverID, playerState:getRoleID()) of
				true ->
					skip;
				_ ->
					sendChatMsgToClient(?CHAT_CHANNEL_PRIVATE,
						Content,
						[PlayerPid, erlang:self()],
						true)
			end;
		%% 对方不在线
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_ChatErrorReceiverOffLine)
	end,
	ok;

%% 队伍消息
onChatMsg(#pk_U2GS_ChatInfo{channel = ?CHAT_CHANNEL_TEAM,
	content = Content}) ->
	RoleID = playerState:getRoleID(),
	case teamInterface:getTeamMemberPidListWithRoleID(RoleID) of
		[] ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_TeamNotJoin);
		MembersPidList ->
			sendChatMsgToClient(?CHAT_CHANNEL_TEAM,
				Content,
				MembersPidList,
				false
			)
	end,
	ok;

%% 帮会消息
onChatMsg(#pk_U2GS_ChatInfo{channel = ?CHAT_CHANNEL_GUILD, content = Content}) ->
	case playerState:getGuildID() > 0 of
		true ->
			PidList = playerGuild:getOnlineMemberPid(),
			sendChatMsgToClient(?CHAT_CHANNEL_GUILD, Content, PidList, false);
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildNotJoin)
	end,
	ok;

%% 喇叭消息
onChatMsg(#pk_U2GS_ChatInfo{channel = ?CHAT_CHANNEL_HORN, content = Content}) ->
    playerDaily:incDailyCounter(?DailyType_HornNum, 0),
	Msg = getPlayerChatInfo(?CHAT_CHANNEL_HORN, Content),
    onSendWorldMsg(Msg, false),
	ok;

%% 系统消息
onChatMsg(#pk_U2GS_ChatInfo{channel = ?CHAT_CHANNEL_SYSTEM}) ->
	ok;

onChatMsg(ChatInfo) ->
	?ERROR_OUT("unhandle chat info msg ~p", [ChatInfo]),
	ok.

%% 发送聊天信息到客户端
-spec sendChatMsgToClient(#pk_GS2U_Chatinfo{}, ReceiverPidList::[pid()|_], IsCheck::boolean()) -> ok.
sendChatMsgToClient(#pk_GS2U_Chatinfo{} = Msg, ReceiverPidList, IsCheck) ->
	SenderNetPid = playerState:getNetPid(),
	[psMgr:sendMsg2PS(ReceiverPid, chatmsg, {Msg, SenderNetPid, IsCheck}) || ReceiverPid <- getFilterPidList(ReceiverPidList)],
	ok.

%%发送聊天信息to客户端
-spec sendChatMsgToClient(Channel, Content, ReceiverPidList, IsCheck)-> ok when
	Channel :: uint(),
	Content :: string(),
	ReceiverPidList :: [ReceiverPid | _],
	ReceiverPid :: pid(),
	IsCheck :: boolean().		%%    IsCheck 检查是否可以成为临时好友
sendChatMsgToClient(Channel, Content, ReceiverPidList, IsCheck) ->
	Msg = getPlayerChatInfo(Channel, Content),
	SenderNetPid = playerState:getNetPid(),
	[psMgr:sendMsg2PS(ReceiverPid,
		chatmsg,
		{Msg, SenderNetPid, IsCheck}) || ReceiverPid <- getFilterPidList(ReceiverPidList)],
	ok.

%% 获取过滤Pid
-spec getFilterPidList(PidList::list()) -> list().
getFilterPidList(PidList) ->
	%#globalsetupCfg{setpara = [BanLevel, BanNum]} =
	%	getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = [30, 30]}, friend2_black_silent),
	%case playerState:getLevel() < BanLevel of
	%	true ->
	%		BlackCount = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_BeBlackCount),
	%		getFilterPidList(PidList, BlackCount, BanNum);
	%	_ ->
			PidList.
	%end.
%getFilterPidList(_PidList, CurNum, BanNum) when CurNum >= BanNum ->
%	[self()];
%getFilterPidList(PidList, _, _) ->
%	PidList.

%% 能否聊天，不能聊天则只发给自己
-spec canSendChat() -> boolean().
canSendChat() ->
	%#globalsetupCfg{setpara = [BanLevel, BanNum]} =
	%	getCfg:getCfgPStackWithDefaultValue(cfg_globalsetup, #globalsetupCfg{setpara = [30, 30]}, friend2_black_silent),
	%case playerState:getLevel() < BanLevel of
	%	true ->
	%		BlackCount = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_BeBlackCount),
	%		BlackCount < BanNum;
	%	_ ->
			true.
	%end.

%% 获取聊天CD时间
-spec getChatCDTime() -> uint().
getChatCDTime() ->
	PlayerLevel = playerState:getLevel(),
	#globalsetupCfg{setpara = [ChatLevel]} = getCfg:getCfgPStack(cfg_globalsetup, chat_cd_level),
	CDList =
		case PlayerLevel > ChatLevel of
			true ->
				#globalsetupCfg{setpara = ChatCD1} = getCfg:getCfgPStack(cfg_globalsetup, chat_cd2),
				ChatCD1;
			_ ->
				#globalsetupCfg{setpara = ChatCD2} = getCfg:getCfgPStack(cfg_globalsetup, chat_cd1),
				ChatCD2
		end,
	changeStruct(CDList).


-spec changeStruct(CDList::list()) -> list().
changeStruct(CDList) when erlang:length(CDList) > 0 ->
	Fun = fun(Time, {Num, AccList}) ->
		case erlang:is_integer(Time) andalso Time >= 0 of
			true ->
				{Num + 1, [{Num, Time}| AccList]};
			_ ->
				{Num + 1, [{Num, 0}| AccList]}
		end
				end,
	{_Num, List} = lists:foldl(Fun, {1, []}, CDList),
	lists:reverse(List);
changeStruct(_) ->
	[{1,25},{2,10},{3,10},{4,10}].
%% 检查禁言
-spec checkChatTime(DenyChatTime :: uint(), Now :: uint()) -> ErrorCode :: uint().
checkChatTime(DenyChatTime, Now) when DenyChatTime =:= undefined
	orelse Now >= DenyChatTime ->
	?Chat_Success;
checkChatTime(DenyChatTime, Now) ->
	?DEBUG_OUT("deny chat time ~p, now ~p", [DenyChatTime, Now]),
	?ErrorCode_ChatErrorDenyChatTime.

%% 检查聊天CD
-spec checkCDTime(ErrorCode :: uint(), LastChatTime :: uint(), Now :: uint(), CDTime :: uint())
			-> NewErrorCode :: uint().
checkCDTime(?Chat_Success, LastChatTime, Now, CDTime) ->
	case Now - LastChatTime >= CDTime of
		false ->
			?ErrorCode_ChatErrorCDTime;
		true ->
			?Chat_Success
	end;
checkCDTime(ErrorCode, _LastChatTime, _Now, _CDTime) ->
	ErrorCode.

-spec checkChatTask(Channel :: ?CHAT_CHANNEL_WORLD) -> NewErrorCode :: uint().
checkChatTask(?CHAT_CHANNEL_WORLD) ->
	case getCfg:getCfgByKey(cfg_globalsetup, chat_task) of
        #globalsetupCfg{setpara = [0]} ->
			?Chat_Success;
        #globalsetupCfg{setpara = []} ->
            ?Chat_Success;
        #globalsetupCfg{setpara = [TaskID]} ->
            case playerTask:isSubmittedTaskByID(TaskID) of
                true ->
                    ?Chat_Success;
                false ->
                    case getCfg:getCfgByKey(cfg_task, TaskID) of
                        #task_newCfg{task_name = TaskName} ->
                            playerMsg:sendErrorCodeMsg(?ErrorCode_ChatErrorTaskNosubmit,[TaskName]),
                            ?Chat_Failed;
                        _ ->
                            ?Chat_Failed
                    end
            end;
        _ ->
            playerMsg:sendErrorCodeMsg(?ErrorCode_System_Error_Unknow),
            ?Chat_Failed
    end;
checkChatTask(_Channel) ->
	?Chat_Success.

-spec getChannelCD(Channel ::uint()) -> uint().
getChannelCD(Channel) ->
	Length = misc:size(playerState:getCdChatTime()),
	case Channel > Length orelse Channel < ?CHAT_CHANNEL_WORLD of
		true ->
			0;
		_ ->
			{Channel, Time} = lists:nth(Channel, playerState:getCdChatTime()),
			Time
	end.

%% 检查消息长度
-spec checkMsgLength(ErrorCode :: uint(), Content :: string(), MsgLen ::uint()) -> NewErrorCode :: uint().
checkMsgLength(?Chat_Success, Content, MsgLen) ->
	Len = string:len(Content),
	case Len > 0 andalso Len < MsgLen of
		true ->
			?Chat_Success;
		false ->
			?ErrorCode_ChatErrorMsgTooLong
	end;
checkMsgLength(ErrorCode, _Content, _MsgLen) ->
	ErrorCode.

%% 检查玩家发小喇叭Vip限制次数
-spec checkVipLimitNum(ErrorCode :: uint(), ItemId :: uint()) -> NewErrorCode :: uint().
checkVipLimitNum(?Chat_Success, _ItemId) ->
	DailyNum = playerDaily:getDailyCounter(?DailyType_HornNum, 0),
	case playerState:getVip() > 0 of
		true ->
			?Chat_Success;
		_ ->
			case DailyNum >= ?HORN_LIMIT_NUM of
				true ->
					?ErrorCode_ChatErrorHornLimit;
				_ ->
					?Chat_Success
			end

	end;
checkVipLimitNum(ErrorCode, _ItemUid) ->
	ErrorCode.

-spec checkWorldChatDailyCount(ErrorCode :: uint()) -> NewErrorCode :: uint().
checkWorldChatDailyCount(?Chat_Success) ->
	#globalsetupCfg{setpara = ChatList}  = getCfg:getCfgByKey(cfg_globalsetup, chat_counts),
	case erlang:is_list(ChatList) andalso erlang:length(ChatList) =:= 2 of
		true ->
			[Level, Count] = ChatList,
%%			orelse playerState:getVip() >= 1
			case playerState:getLevel() >= Level of
				true ->
					?Chat_Success;
				_ ->
					DailyCount = playerDaily:getDailyCounter(?DailyType_ChatCount, 0),
					case DailyCount >= Count of
						true ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_ChatErrorDailyCount,[Level]),
							?Chat_Failed;
						_ ->
							?Chat_Success
					end
			end;
		_ ->
			?Chat_Success
	end;
checkWorldChatDailyCount(ErrorCode) ->
	ErrorCode.

%% 检查背包小喇叭
-spec checkUserHornItem(ErrorCode ::uint(), ItemId :: uint()) -> NewErrorCode :: uint().
checkUserHornItem(?Chat_Success, ItemId) ->
	List = playerPackage:getGoodsByID(ItemId, ?Item_Location_Bag),
	case List of
		[#rec_item{itemUID = ItemUID}|_] ->
			%%检测背包有小喇叭直接使用
			case playerItem:useBagItem(ItemUID ,1, ?ItemUseReasonPlayer, ItemUID) of
				ok ->
					%%使用喇叭成功增加成就
					playerAchieve:achieveEvent(?Achieve_Social_Event4, [1]),

					?Chat_Success;
				_ ->
					?Chat_Failed
			end;
		_ ->
			?Chat_Failed
	end;

checkUserHornItem(ErrorCode, _ItemUid) ->
	ErrorCode.

%% 检查是否跟自己聊天
-spec checkChatSelf(ErrorCode :: uint(), ReceiverID :: uint()) -> NewErrorCode :: uint().
checkChatSelf(?Chat_Success, ReceiverID) ->
	case ReceiverID =/= playerState:getRoleID() of
		true ->
			?Chat_Success;
		false ->
			?ErrorCode_ChatErrorNoSelf
	end;
checkChatSelf(ErrorCode, _ReceiverID) ->
	ErrorCode.

%% 玩家等级达到聊天CD减少限制改变聊天CD
-spec playerChangeChatCD(Level :: uint()) -> ok.
playerChangeChatCD(Level) ->
	#globalsetupCfg{setpara = [ChatLevel]} = getCfg:getCfgPStack(cfg_globalsetup, chat_cd_level),
	case Level >= ChatLevel of
		true ->
			#globalsetupCfg{setpara = ChatCD1} = getCfg:getCfgPStack(cfg_globalsetup, chat_cd2),
			TimeList = changeStruct(ChatCD1),
			playerState:setCdChatTime(TimeList);
		_ ->
			skip
	end,
	ok.

%%% 检查消息发送者是否在黑名单中
%%% 受开关影响
%-spec isBlackFriend(SenderID) -> Result when
%	SenderID :: uint(),
%	Result :: boolean().
%isBlackFriend(SenderID) ->
%	case playerState2:isOpenFriendBlackAvoidHarassment(?FAH_CHAT) of
%		true ->
%			case playerState2:getFriendBlack(SenderID) of
%				{} ->
%					false;
%				_ ->
%					true
%			end;
%		_ ->
%			false
%	end.

%%保存聊天数据，加log
-spec sendLogChatInfo(ChatInfo :: #pk_U2GS_ChatInfo{}) -> ok.
sendLogChatInfo(#pk_U2GS_ChatInfo{receiverID=Receiveplayerid, content=ChatString,channel=ChatChannel} = _Data) ->
	dbLog:sendSaveLogChat(playerState:getRoleID(), Receiveplayerid, ChatString, ChatChannel),
	ok.




%%语音相关接口
%%语音只检测时间
-spec isPlayerCanChat() -> boolean().
isPlayerCanChat()->
	Now = time:getUTCNowSec(),
	LastChatTime = playerState:getLastChatTime(?CHAT_CHANNEL_PRIVATE),
	DenyChatTime = playerState:getDenyChatTime(),
	Result = checkChatTime(DenyChatTime, Now),
	#globalsetupCfg{setpara = [VoiceCD]} = getCfg:getCfgPStack(cfg_globalsetup, voicechat_cd),
	Result1 = checkCDTime(Result, LastChatTime, Now, VoiceCD),
	case Result1 =:= ?Chat_Success of
		true ->
			true;
		false ->
			playerMsg:sendErrorCodeMsg(Result1),
			false
	end.

%%保存语音
-spec storeVoice(ChatInfo :: #pk_U2GS_ChatVoice{}) -> ok.
storeVoice(Msg) ->
	case isPlayerCanChat() of
		true -> startStoreVoice(Msg);
		_ ->
			%%  ?ERROR_OUT("cannot chat!"),
			skip
	end,
	ok.

%%如果语音包是被拆分了的，等待包，包满了保存
%%如果没有拆分的，直接保存
-spec startStoreVoice(ChatInfo :: #pk_U2GS_ChatVoice{}) -> ok.
startStoreVoice(#pk_U2GS_ChatVoice{count = Count, index = Index,playerCode=PlayerCode, key = Key1, data = Data}) ->
	%% ?ERROR_OUT("storeVoice key:~p, count:~p, index:~p ", [Key, Count,Index]),
	Key = {PlayerCode,Key1},
	case playerState:getTempVoice() of
		{} ->
			case Count =:= 1 of
				true ->
					ets:insert(?TABLE_PlayerVoice, #recVoiceInfo{key = Key, count = Count, time = time:getUTCNowSec(), voiceList = [#recVoice{index = Index, value = Data}]}),
					%%      ?ERROR_OUT("storeVoice key:~p ", [Key]),
					playerMsg:sendNetMsg(#pk_GS2U_RespChatVoiceError{key = Key1,playerCode=PlayerCode, errorCode = ?Voice_Commit_Succe});
				_ ->
					playerState:setTempVoice({Key,[#recVoice{index = Index, value = Data}]})
			end;
		{Key, OldTempVoiceList} ->
			NewTempVoiceList = [#recVoice{index = Index, value = Data} | OldTempVoiceList],
			case length(NewTempVoiceList) =:= Count of
				true ->
					ets:insert(?TABLE_PlayerVoice, #recVoiceInfo{key = Key, count = Count, time = time:getUTCNowSec(), voiceList = NewTempVoiceList}),
					%%    ?ERROR_OUT("storeVoice key:~p ", [Key]),
					playerMsg:sendNetMsg(#pk_GS2U_RespChatVoiceError{key = Key1,playerCode=PlayerCode, errorCode = ?Voice_Commit_Succe});
				_ -> playerState:setTempVoice({Key,NewTempVoiceList})
			end;
		_ ->  %%异常，理论上不可能走这个分支
			case Count =:= 1 of
				true ->
					ets:insert(?TABLE_PlayerVoice, #recVoiceInfo{key = Key, count = Count, time = time:getUTCNowSec(), voiceList = [#recVoice{index = Index, value = Data}]}),
					%%   ?ERROR_OUT("storeVoice key:~p ", [Key]),
					playerMsg:sendNetMsg(#pk_GS2U_RespChatVoiceError{key = Key1,playerCode=PlayerCode, errorCode = ?Voice_Commit_Succe});
				_ ->
					playerState:setTempVoice({Key,[#recVoice{index = Index, value = Data}]})
			end
	end,
	ok.

%%获取语音
-spec getVoice({PlayerCode::uint64(),Key :: uint64()}) -> ok.
getVoice({PlayerCode,Key1} = Key) ->
	case myEts:lookUpEts(?TABLE_PlayerVoice, Key) of
		[] ->
			playerMsg:sendNetMsg(#pk_GS2U_RespChatVoiceError{key = Key1,playerCode=PlayerCode, errorCode = ?Voice_DownLoad_Failed});
		[#recVoiceInfo{key = Key, count = Count,time = _Time, voiceList = VoiceList} |_] ->
			%% ?ERROR_OUT("getvoiced key:~p ", [Key]),
			lists:foreach(
				fun(#recVoice{index = Index, value = Value}) ->
					playerMsg:sendNetMsg(#pk_GS2U_RespChatVoice{key = Key1,playerCode=PlayerCode,count = Count, index = Index,data = Value}) end,
				VoiceList);
		_ ->
			playerMsg:sendNetMsg(#pk_GS2U_RespChatVoiceError{key = Key1,playerCode=PlayerCode, errorCode = ?Voice_DownLoad_Failed}),
			ok
	end,
	ok.

%%清理语音垃圾
-spec clearOldVoice() -> ok.
clearOldVoice() ->
	NowTime = time:getUTCNowSec(),
	VoiceCount = ets:info(?TABLE_PlayerVoice, size),
	case VoiceCount > ?Voice_MaxStoreNum * 2 of
		true ->
			?ERROR_OUT("naughty children attack voice server!"),
			ets:delete_all_objects(?TABLE_PlayerVoice);
		_ -> skip
	end,
	case VoiceCount > ?Voice_MaxStoreNum andalso VoiceCount < ?Voice_MaxStoreNum * 2 of
		true -> %% [30000, 60000] 清理策略  360 秒清理一次
			CheckTime = NowTime -  ?Voice_MaxStoreTime div 10,
			CanDelete=ets:fun2ms(fun(#recVoiceInfo{key = '_', count = '_',time = Time, voiceList = '_'}) when  Time < CheckTime -> true end),
			ets:select_delete(?TABLE_PlayerVoice, CanDelete);
		_ -> skip
	end,
	case VoiceCount > ?Voice_Begin_Clear  andalso VoiceCount < ?Voice_MaxStoreNum of
		true -> %% [10000, 30000] 清理策略  3600 秒清理一次
			CheckTime2 = NowTime -  ?Voice_MaxStoreTime,
			CanDelete2=ets:fun2ms(fun(#recVoiceInfo{key = '_', count = '_',time = Time, voiceList = '_'}) when  Time < CheckTime2 -> true end),
			ets:select_delete(?TABLE_PlayerVoice, CanDelete2);
		_ -> skip
	end,
	ok.

%% 获取系统频道聊天结构
-spec getSystemChatInfo(Content::string()) -> #pk_GS2U_Chatinfo{}.
getSystemChatInfo(Content) ->
	getSystemChatInfo(?CHAT_CHANNEL_SYSTEM, Content).
getSystemChatInfo(Channel, Content) when Channel =:= ?CHAT_CHANNEL_SYSTEM orelse Channel =:= ?CHAT_CHANNEL_GUILD ->
	#pk_GS2U_Chatinfo{
		%% SByte频道
		channel = Channel,
		%% UInt64发送者ID
		senderID = 0,
		%% String发送者Name
		senderName = [],
		%% SByte发送者vip等级
		senderVip = 999,
		%% SByte 种族
		senderRace = 0,
		%% UInt32职业
		senderCareer = 0,
		%% SByte性别
		senderSex = 0,
		%% Int32头
		senderHead = 0,
		%% Int16当前等级
		senderLevel = 0,
		%% String内容
		content = Content,
		%% UInt64发送者Code
		senderCode = 0
	}.

getPlayerChatInfo(Channel, Content) ->
	#pk_GS2U_Chatinfo{
		%% SByte频道
		channel = Channel,
		%% UInt64发送者ID
		senderID = playerState:getRoleID(),
		%% String发送者Name
		senderName = playerState:getName(),
		%% SByte发送者vip等级
		senderVip = playerState:getVip(),
		%% SByte 种族
		senderRace = playerState:getRace(),
		%% UInt32职业
		senderCareer = playerState:getCareer(),
		%% SByte性别
		senderSex = playerState:getSex(),
		%% Int32头
		senderHead = playerState:getHead(),
		%% Int16当前等级
		senderLevel = playerState:getLevel(),
		%% String内容
		content = Content,
		%% UInt64发送者Code
		senderCode = playerState:getPlayerCode()
	}.