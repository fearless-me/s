%% @author zhongyunawei
%% @doc @todo Add description to libMail.


-module(libMail).
-author(zhongyuanwei).

-include("mailPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================

%%玩家操作的API
-export([
    newMail/1,
    readMail/1,
    lockMail/1,
    unlockMail/1,
    deleteMail/1,
    getMailCoin/1,
    getMailItem/1,
    deleteMailUnConditional/1
]).

%%服务器内部操作的API
-export([
    initMailFromDB/2,
    getSelfMailList/1,
	newMailAck/3,
    dealOverTimeMail/0,
    noticeNewMail/1,
	isItemOrCoin/1
]).

%% 处理过期邮件
dealOverTimeMail() ->
    dealOverTimeSystemMail(),

    dealOverTimeSimpleMail(),

    ok.

%% 获取自己的邮件列表
getSelfMailList(RoleID) ->
    %?LOG_OUT("getSelfMailList:~p", [RoleID]),
	NowTime = time:getSyncTime1970FromDBS(),

    %% 优先查找系统邮件
    SqlBin1 = qlc:q([changeToRecMail(SysMail) || SysMail <- mnesia:table(?MnesiaSysMail),
        SysMail#?MnesiaSysMail.toRoleID =:= RoleID]),
    SysMails = edb:selectRecord(SqlBin1),

	%% 清除过期的邮件
	FS =
		fun(#recMail{mailID = MailID1, deleteTime = DT1, isLocked = IL1, attachment = AttachMent} = Mail, Acc) ->
			case NowTime >= DT1 andalso IL1 =:= 0 of
				true ->
					%% 删除邮件
					edb:deleteRecord(?MnesiaSysMail, MailID1),
					deleteMailFromDB(MailID1),
					Acc;
				_ ->
					%% 有效邮件则检查附件
					AttachMent2 = judgeAttachMentItemExist(AttachMent, []),
					[Mail#recMail{attachment = AttachMent2} | Acc]
			end
		end,
	SysMailList = lists:foldl(FS, [], SysMails),

    %% 再查找私人邮件
    SqlBin2 = qlc:q([changeToRecMail(Mail) || Mail <- mnesia:table(?MnesiaMail),
        Mail#?MnesiaMail.toRoleID =:= RoleID]),
    Mails = edb:selectRecord(SqlBin2),

	%% 清除过期私人邮件
	FM =
		fun(#recMail{mailID = MailID2, deleteTime = DT2, isLocked = IL2} = ML, Acc2) ->
			case NowTime >= DT2 andalso IL2 =:= 0 of
				true ->
					%% 删除邮件
					edb:deleteRecord(?MnesiaMail, MailID2),
					deleteMailFromDB(MailID2),
					Acc2;
				_ ->
					[ML | Acc2]
			end
		end,
	Mails2 = lists:foldl(FM, [], Mails),
	{SysMailList, Mails2}.

%% 判断附件中的道具是否存在
-spec judgeAttachMentItemExist(list(), RetAttachMent::list()) -> list().
judgeAttachMentItemExist([], RetAttachMent) ->
    RetAttachMent;
judgeAttachMentItemExist([#recMailAttachMent{mtype = Type, mvalue = ItemUID, mvalue2 = ItemID} = Attach | T], RetAttachMent) ->
    case Type =:= 0 of
        true ->
            case ItemID < ?Item_RuneIDStart of
                true ->
                    %% 判断道具是否存在
                    case edb:dirtyReadRecord(rec_item, ItemUID) of
                        [#rec_item{}] ->
                            %% 附件存在
                            judgeAttachMentItemExist(T, [Attach | RetAttachMent]);
                        [] ->
                            ?ERROR_OUT("getAttachMentUID not found item:~p", [Attach]),
                            judgeAttachMentItemExist(T, RetAttachMent)
                    end;
                _ ->
                    case edb:dirtyReadRecord(recRune, ItemUID) of
                        [#recRune{}] ->
                            judgeAttachMentItemExist(T, [Attach | RetAttachMent]);
                        [] ->
                            ?ERROR_OUT("getAttachMentUID not found rune:~p", [Attach]),
                            judgeAttachMentItemExist(T, RetAttachMent)
                    end
            end;
        _ ->
            %% 其它数据
            judgeAttachMentItemExist(T, [Attach | RetAttachMent])
    end.

%% 改变表名为节点间通讯的名字
changeToRecMail(Mail) ->
	case Mail of
		#?MnesiaSysMail{} ->
			#recMail{
				mailID          = Mail#?MnesiaSysMail.mailID,
				mailReadTime    = Mail#?MnesiaSysMail.mailReadTime,
				mailSendTime    = Mail#?MnesiaSysMail.mailSendTime,
				isLocked        = Mail#?MnesiaSysMail.isLocked,
				senderRoleID    = Mail#?MnesiaSysMail.senderRoleID,
				toRoleID        = Mail#?MnesiaSysMail.toRoleID,
				mailTitle       = Mail#?MnesiaSysMail.mailTitle,
				mailContent     = Mail#?MnesiaSysMail.mailContent,
				mailSubjoinMsg  = Mail#?MnesiaSysMail.mailSubjoinMsg,
				deleteTime      = Mail#?MnesiaSysMail.deleteTime,
				attachment      = Mail#?MnesiaSysMail.attachment
			};
		#?MnesiaMail{} ->
			#recMail{
				mailID          = Mail#?MnesiaMail.mailID,
				mailReadTime    = Mail#?MnesiaMail.mailReadTime,
				mailSendTime    = Mail#?MnesiaMail.mailSendTime,
				isLocked        = Mail#?MnesiaMail.isLocked,
				senderRoleID    = Mail#?MnesiaMail.senderRoleID,
				toRoleID        = Mail#?MnesiaMail.toRoleID,
				mailTitle       = Mail#?MnesiaMail.mailTitle,
				mailContent     = Mail#?MnesiaMail.mailContent,
				mailSubjoinMsg  = Mail#?MnesiaMail.mailSubjoinMsg,
				deleteTime      = Mail#?MnesiaMail.deleteTime,
				attachment      = []
			}
	end.

%% 初始化邮件列表
-spec initMailFromDB(MailListRec, AttachMent) -> ok when
    MailListRec::list(),AttachMent::list().
initMailFromDB(MailListRec, AttachMent) when erlang:is_list(MailListRec) andalso erlang:is_list(AttachMent) ->
    %% 解析邮件列表和附件
    case MailListRec of
        [] ->
            skip;
        _ ->
            %% 当前时间
            NowTime = time:getSyncTime1970FromDBS(),

            %% 解析普通邮件和系统邮件，并添加附件
            FunMail = fun(#recSaveMail{mailID = MailID, senderRoleID = SenderRoleID} = Mail) ->
                %% 判断该邮件是否已经过期
                #recSaveMail{deleteTime = DeleteTime, isLocked = IsLocked} = getMnesiaMail(Mail),
                case IsLocked =:= 0 andalso NowTime >= DeleteTime of
                    true ->
                        %% 邮件过期
                        skip;
                    _ ->
                        %% 提取附件
                        AttachList = case isSysMail(SenderRoleID) of
                                         true ->
                                             case AttachMent of
                                                 [] ->
                                                     [];
                                                 _ ->
                                                     %% 提取附件函数
                                                     FunAttach = fun(#recMailAttachMent{mailID = AMailID} = Attach, Attachs) ->
                                                         case MailID =:= AMailID of
                                                             true ->
                                                                 [Attach | Attachs];
                                                             false ->
                                                                 Attachs
                                                         end
                                                     end,

                                                     lists:foldl(FunAttach, [], AttachMent)
                                             end;
                                         false ->
                                             []
                                     end,

                        %% 保存到内存数据库
                        saveToMnesia(Mail, AttachList)
                end
            end,

            lists:foreach(FunMail, MailListRec)
    end,
	ok.

-spec newMail(#recMail{}) -> integer().
newMail(#recMail{
            mailID = MailID,
            mailSendTime = MailSendTime,
            senderRoleID = SenderRoleID,
            toRoleID = ToRoleID,
            mailTitle = MailTitle,
            mailContent = MailContent,
            mailSubjoinMsg = MailSubjoinMsg,
            attachment = Attachment}) ->
    case canSendMail(SenderRoleID, ToRoleID) of
        0 ->
            %% 应该删除时间
            DeleteTime = 30 * ?SECONDS_PER_DAY + MailSendTime,

            %% 保存数据库
            Mail = #recSaveMail{
                mailID = MailID,
                mailSendTime = MailSendTime,
                mailReadTime = 0,
                isLocked = 0,
                senderRoleID = SenderRoleID,
                toRoleID = ToRoleID,
                mailTitle = MailTitle,
                mailContent = MailContent,
                mailSubjoinMsg = MailSubjoinMsg,
                deleteTime = DeleteTime     % 30天之后删除
            },

            %% 保存到数据库
            gsSendMsg:sendMsg2DBServer(newMail, 0, {Mail, Attachment}),
            0;
        R ->
            R
    end.

%% 能否发送邮件，返回0成功，其它值表示错误码
canSendMail(SenderRoleID, ToRoleID) ->
    case SenderRoleID of
        0 ->
            %% 这是系统邮件，不限制
            0;
        _ ->
            %% 判断接收者收件箱是否已满
            Count = mail:getPlayerMailCount(ToRoleID),
            case Count < ?Mail_Player_Max_Count of
                true ->
                    0;
                _ ->
                    %% 接收者邮件达到最大数量
                    1
            end
    end.

%% 新邮件发送结果
newMailAck(#recSaveMail{senderRoleID = SenderRoleID, toRoleID = RecviverID, mailID = MailID} = Mail, Attachments, Ret) ->
    case Ret of
        true ->
            %% 保存到内存数据库
            saveToMnesia(Mail, Attachments),

            %% 取最新数据
            NewMail = queryMail(SenderRoleID, MailID),

            case isSysMail(RecviverID) of
                false ->
                    NoticeMail = changeToRecMail(NewMail),
                    case mailState:getNoticeMailTick(RecviverID) of
                        undefined ->
                            %% 获取玩家是否在线
                            case playerMgrOtp:getOnlinePlayerInfoByID(RecviverID) of
                                #rec_OnlinePlayer{pid = PID} when erlang:is_pid(PID) ->
                                    %% 三秒后新邮件提醒
                                    TimeRef = erlang:send_after(?DELAY_NOTICE_RECEIVEMAIL, self(), {delay_noticeRecvNewMail, RecviverID}),
                                    mailState:setNoticeMailTick(RecviverID, {PID, TimeRef, [NoticeMail]});
                                _ -> skip
                            end;
                        {Pid, Ref, MList} ->
                            mailState:setNoticeMailTick(RecviverID, {Pid, Ref, [NoticeMail | MList]})
                    end;
                _ -> skip
            end;
        _ ->
            %% 数据库那里失败了
            ?ERROR_OUT("[~p] sendmail failed [~p, ~p]", [?MODULE, Mail, Attachments])
    end,
	ok.

%% 新邮件提醒
-spec noticeNewMail(RoleID::uint64()) -> ok.
noticeNewMail(RoleID) ->
    case mailState:getNoticeMailTick(RoleID) of
        undefined -> skip;
        {PlayerPID, _, List} -> psMgr:sendMsg2PS(PlayerPID, receiveNewMail, List)
    end,

    %% 置空
    mailState:setNoticeMailTick(RoleID, undefined),
    ok.

%% 更新邮件
updateMail(MailID, NewMail) ->
    %% 获取更新的表名
    TableName = case NewMail of
                    #?MnesiaSysMail{} ->
                        ?MnesiaSysMail;
                    #?MnesiaMail{} ->
                        ?MnesiaMail
                end,

    F = fun() ->
        %% 获取一个写的锁
        mnesia:read(TableName, MailID, write),
        mnesia:write(NewMail)
    end,

    case mnesia:transaction(F) of
        {atomic, ok} ->
            true;
        _ ->
            false
    end.

%% 这里只更新邮件，不更新附件
updateMail2DB(MailID, NewMail) ->
    Rec = case NewMail of
              #?MnesiaSysMail{mailReadTime = ReadTime, deleteTime = DeleteTime, isLocked = IsLocked} ->
                  #recUpdateMail{mailID = MailID, mailReadTime = ReadTime, deleteTime = DeleteTime, isLocked = IsLocked};
              #?MnesiaMail{mailReadTime = ReadTime, deleteTime = DeleteTime, isLocked = IsLocked} ->
                  #recUpdateMail{mailID = MailID, mailReadTime = ReadTime, deleteTime = DeleteTime, isLocked = IsLocked}
          end,

    gsSendMsg:sendMsg2DBServer(updateMail, 0, {Rec}),

    ok.

%% 删除附件
deleteAttachMent(#recMailAttachMent{} = Attach) ->
    gsSendMsg:sendMsg2DBServer(deleteAttachMent, 0, {Attach}),
    ok.

%% 读邮件，注意，如果读取快要到删除时间的邮件，则删除时间不重新赋新值
readMail({SenderID, OwnerID, MailID}) ->
	Mail = queryMail(SenderID, OwnerID, MailID),
    NewMail = case Mail of
                  #?MnesiaSysMail{mailReadTime = ReadTime, attachment = AttachMent, deleteTime = DeleteTime1} ->
                      case ReadTime > 0 of
                          true ->
                              Mail;
                          false ->
                              NowTime = time:getSyncTime1970FromDBS(),
                              DeleteTime2 = case length(AttachMent) > 0 of
                                                true ->
                                                    NowTime + 30 * ?SECONDS_PER_DAY;
                                                false ->
                                                    NowTime + 7 * ?SECONDS_PER_DAY
                                            end,
                              DeleteTime = erlang:min(DeleteTime1, DeleteTime2),
                              Mail#?MnesiaSysMail{mailReadTime = NowTime, deleteTime = DeleteTime}
                      end;
                  #?MnesiaMail{mailReadTime = ReadTime, deleteTime = DeleteTime1} ->
                      case ReadTime > 0 of
                          true ->
                              Mail;
                          false ->
                              NowTime = time:getSyncTime1970FromDBS(),
                              DeleteTime2 = NowTime + 7 * ?SECONDS_PER_DAY,
                              DeleteTime = erlang:min(DeleteTime1, DeleteTime2),
                              Mail#?MnesiaMail{mailReadTime = NowTime, deleteTime = DeleteTime}
                      end;
                  _ ->
                      false
              end,

    case NewMail of
        false ->
            false;
        _ ->
            %% 更新
            updateMail(MailID, NewMail),

            %% 更新mysql
            updateMail2DB(MailID, NewMail),

            changeToRecMail(NewMail)
    end.

%% 锁定邮件
lockMail({SenderID, OwnerID, MailID}) ->
    Mail = queryMail(SenderID, OwnerID, MailID),
    NewMail = case Mail of
                  #?MnesiaSysMail{isLocked = IsLocked} ->
                      case IsLocked =:= 0 of
                          true ->
                              Mail#?MnesiaSysMail{isLocked = 1};
                          false ->
                              false
                      end;
                  #?MnesiaMail{isLocked = IsLocked} ->
                      case IsLocked =:= 0 of
                          true ->
                              Mail#?MnesiaMail{isLocked = 1};
                          false ->
                              false
                      end;
                  _ ->
                      false
              end,

    case NewMail of
        false ->
            false;
        _ ->
            %% 更新
            updateMail(MailID, NewMail),

            %% 更新mysql
            updateMail2DB(MailID, NewMail),

            changeToRecMail(NewMail)
    end.

%% 解锁邮件
unlockMail({SenderID, OwnerID, MailID}) ->
    Mail = queryMail(SenderID, OwnerID, MailID),
    NewMail = case Mail of
                  #?MnesiaSysMail{isLocked = IsLocked} ->
                      case IsLocked =/= 0 of
                          true ->
                              Mail#?MnesiaSysMail{isLocked = 0};
                          false ->
                              false
                      end;
                  #?MnesiaMail{isLocked = IsLocked} ->
                      case IsLocked =/= 0 of
                          true ->
                              Mail#?MnesiaMail{isLocked = 0};
                          false ->
                              false
                      end;
                  _ ->
                      false
              end,

    case NewMail of
        false ->
            false;
        _ ->
            %% 更新
            updateMail(MailID, NewMail),

            %% 更新mysql
            updateMail2DB(MailID, NewMail),

            changeToRecMail(NewMail)
    end.

%% 获取货币
-spec getMailCoin({SenderID::uint(), OwnerID::uint(), MailID::uint()}) -> {uint(), uint(), #recMail{}} | false.
getMailCoin({SenderID, OwnerID, MailID}) ->
    %% 只有系统邮件才有货币
    Mail = queryMail(SenderID, OwnerID, MailID),
    Result = case Mail of
                 #?MnesiaSysMail{attachment = Attachment} ->
                     case Attachment of
                         [] ->
                             false;
                         _ ->
                             Coin = getCoin(Attachment),
                             case Coin of
                                 [] ->
                                     false;
                                 [CoinRec] ->
                                     %% 通知db删除该附件
                                     deleteAttachMent(CoinRec),

                                     New = Mail#?MnesiaSysMail{attachment = Attachment -- Coin},

	                                 %% 提取附件后改变邮件删除时间
	                                 New1 = changeMailDeleteTime(New),

                                     {CoinRec#recMailAttachMent.mtype, CoinRec#recMailAttachMent.mvalue, New1}
                             end
                     end;
                 _ ->
                     false
             end,

    case Result of
        false ->
            false;
        {Mtype, Mvalue, NewMail} ->
            %% 更新
            updateMail(MailID, NewMail),

	        updateMail2DB(MailID, NewMail),

            {Mtype, Mvalue, changeToRecMail(NewMail)}
    end.

%% 获取货币
getCoin(Attachment) ->
    Fun = fun(#recMailAttachMent{mtype = Mtype} = _Attach) ->
        Mtype > 0
    end,
    lists:filter(Fun, Attachment).

%% 获取道具
getItem(Attachment, ItemUID) ->
    Fun = fun(#recMailAttachMent{mtype = Mtype, mvalue = Mvalue} = _Attach) ->
        Mtype =:= 0 andalso ItemUID =:= Mvalue
    end,
    lists:filter(Fun, Attachment).

isItemOrCoin(#recMailAttachMent{mtype = 0, mvalue = ItemUID, mvalue2 = ItemID}) -> {ItemUID, ItemID};
isItemOrCoin(#recMailAttachMent{}) -> true;
isItemOrCoin(_) -> undefined.

%% 获取货币
-spec getMailItem({SenderID::uint(), OwnerID::uint(), MailID::uint(), ItemUID::uint()}) -> {uint(), uint(), #recMail{}} | false.
getMailItem({SenderID, OwnerID, MailID, ItemUID}) ->
    %% 只有系统邮件才有货币
    Mail = queryMail(SenderID, OwnerID, MailID),
    Result = case Mail of
                 #?MnesiaSysMail{attachment = Attachment} ->
                     case Attachment of
                         [] ->
                             false;
                         _ ->
                             ItemList = getItem(Attachment, ItemUID),
                             case ItemList of
                                 [] ->
                                     false;
                                 [ItemRec] ->
                                     %% 通知db删除该附件
                                     deleteAttachMent(ItemRec),

                                     NewMail = Mail#?MnesiaSysMail{attachment = Attachment -- ItemList},

	                                 %% 提取附件后改变邮件删除时间
	                                 New1 = changeMailDeleteTime(NewMail),

                                     {ItemRec#recMailAttachMent.mvalue, ItemRec#recMailAttachMent.mvalue2, New1}
                             end
                     end;
                 _ ->
                     false
             end,

    case Result of
        false ->
            false;
        {Mvalue, Mvalue2, New} ->
            %% 更新
            updateMail(MailID, New),

	        updateMail2DB(MailID, New),

            {Mvalue, Mvalue2, changeToRecMail(New)}
    end.

%% 无条件删除邮件
deleteMailUnConditional({OwnerID, MailID}) ->
	%?DEBUG_OUT("deleteMailUnConditional:~p,~p", [OwnerID, MailID]),
    NowTime = time:getSyncTime1970FromDBS(),
    case edb:dirtyReadRecord(?MnesiaSysMail, MailID) of
        [] ->
            skip;
        [#?MnesiaSysMail{} = RS] ->
            case RS#?MnesiaSysMail.toRoleID =:= OwnerID of
                true ->
                    %% 记录日志
                    ?LOG_OUT("deleteMailUnConditional:~p", [RS]),

                    %% 删除
                    edb:deleteRecord(?MnesiaSysMail, MailID),

                    %% 更新mysql
                    updateMail2DB(MailID, RS#?MnesiaSysMail{deleteTime = NowTime}),

                    deleteMailFromDB(MailID);
                _ ->
                    skip
            end
    end,

    case edb:dirtyReadRecord(?MnesiaMail, MailID) of
        [] ->
            skip;
        [#?MnesiaMail{} = R] ->
            case R#?MnesiaMail.toRoleID =:= OwnerID of
                true ->
                    %% 记录日志
                    ?LOG_OUT("deleteMailUnConditional:~p", [R]),

                    %% 删除
                    edb:deleteRecord(?MnesiaMail, MailID),

                    %% 更新mysql
                    updateMail2DB(MailID, R#?MnesiaMail{deleteTime = NowTime}),

                    deleteMailFromDB(MailID);
                _ ->
                    skip
            end
    end,
    ok.

%% 删除邮件
deleteMail({SenderID, OwnerID, MailID}) ->
    Mail = queryMail(SenderID, OwnerID, MailID),

    NowTime = time:getSyncTime1970FromDBS(),

    NewMail = case Mail of
                  #?MnesiaSysMail{mailReadTime = ReadTime,isLocked = IsLocked,attachment = Attachment} ->
                      if
                          ReadTime > 0 andalso IsLocked =:= 0 andalso Attachment =:= [] ->

                              %% 删除
                              edb:deleteRecord(?MnesiaSysMail, MailID),

                              Mail#?MnesiaSysMail{deleteTime = NowTime};
                          true ->
                              false
                      end;
                  #?MnesiaMail{mailReadTime = ReadTime,isLocked = IsLocked} ->
                      if
                          ReadTime > 0 andalso IsLocked =:= 0 ->

                              %% 删除
                              edb:deleteRecord(?MnesiaMail, MailID),

                              Mail#?MnesiaMail{deleteTime = NowTime};
                          true ->
                              false
                      end;
                  _ ->
                      false
              end,

    case NewMail of
        false ->
            false;
        _ ->
            %% 更新mysql
            updateMail2DB(MailID, NewMail),

            deleteMailFromDB(MailID),

            MailID
    end.

deleteMailFromDB(MailID) ->
    gsSendMsg:sendMsg2DBServer(deleteMail, 0, MailID),
    ok.

%% 获取内存中保存的表数据库结构
getMnesiaMail(#recSaveMail{
    mailSendTime = SendTime,
    mailReadTime = ReadTime,
    deleteTime = DeleteTime,
    isLocked = IsLocked} = Mail) ->
    %?DEBUG_OUT("Mail=~p", [Mail]),
    Locked = case IsLocked of
                 true ->
                     1;
                 false ->
                     0;
                 1 ->
                     1;
                 0 ->
                     0;
                 _ ->
                     %% 不知道是个什么值，改为锁定
                     1
             end,

    MailTitle = case erlang:is_binary(Mail#recSaveMail.mailTitle) of
                    true ->
                        binary_to_list(Mail#recSaveMail.mailTitle);
                    false ->
                        Mail#recSaveMail.mailTitle
                end,

    MailContent = case erlang:is_binary(Mail#recSaveMail.mailContent) of
                      true ->
                          binary_to_list(Mail#recSaveMail.mailContent);
                      false ->
                          Mail#recSaveMail.mailContent
                  end,

    MailSubjoinMsg = case Mail#recSaveMail.mailSubjoinMsg of
                         undefined ->
                             [];
                         _ when erlang:is_binary(Mail#recSaveMail.mailSubjoinMsg) ->
                             binary_to_list(Mail#recSaveMail.mailSubjoinMsg);
                         _ ->
                             Mail#recSaveMail.mailSubjoinMsg
                     end,

    Mail#recSaveMail{mailSendTime = time:dateTimeToInt64(SendTime), mailReadTime = time:dateTimeToInt64(ReadTime),
        deleteTime = time:dateTimeToInt64(DeleteTime), isLocked = Locked,
        mailTitle = MailTitle, mailContent = MailContent, mailSubjoinMsg = MailSubjoinMsg}.

%% 判断是不是系统邮件
isSysMail(SenderID) ->
    case SenderID of
        ?SystemID ->
            true;
        _ ->
            false
    end.

%% 处理普通邮件
dealOverTimeSimpleMail() ->
    %% 得到当前时间
    NowTime = time:getSyncTime1970FromDBS(),

    %% 当前时间大于等于删除时间，又没有锁定，则过期
    SqlBin = qlc:q([Mail || Mail <- mnesia:table(?MnesiaMail),
        NowTime >= Mail#?MnesiaMail.deleteTime, Mail#?MnesiaMail.isLocked =:= 0]),

    Results = edb:selectRecord(SqlBin),

    Fun = fun(#?MnesiaMail{mailID = MailID, toRoleID = OwnerID} = _MailFun) ->
        %% 自动删除过期邮件
        autoDeleteMail(OwnerID, MailID),

        %% 删除邮件，这里不用更新数据库了，因为下次不会加载的，哦耶
        edb:deleteRecord(?MnesiaMail, MailID),
        deleteMailFromDB(MailID)
    end,

    lists:foreach(Fun, Results).

%%　处理系统邮件
dealOverTimeSystemMail() ->
    %% 得到当前时间
    NowTime = time:getSyncTime1970FromDBS(),

    %% 当前时间大于等于删除时间，又没有锁定，则过期
    SqlBin = qlc:q([Mail || Mail <- mnesia:table(?MnesiaSysMail),
        NowTime >= Mail#?MnesiaSysMail.deleteTime, Mail#?MnesiaSysMail.isLocked =:= 0]),

    Results = edb:selectRecord(SqlBin),

	Fun =
		fun(#?MnesiaSysMail{mailID = MailID, toRoleID = OwnerID} = _MailFun) ->
			%% 自动删除过期邮件
			autoDeleteMail(OwnerID, MailID),

			%% 删除邮件，这里不用更新数据库了，因为下次不会加载的，哦耶
			edb:deleteRecord(?MnesiaSysMail, MailID),
			deleteMailFromDB(MailID)
		end,

	lists:foreach(Fun, Results).

%% 自动删除过期邮件
autoDeleteMail(PlayerID, MailID) ->
    %% 通知收件人
    case playerMgrOtp:getOnlinePlayerInfoByID(PlayerID) of
        #rec_OnlinePlayer{pid = PID} ->
            %% 角色在线
            case erlang:is_pid(PID) of
                true ->
                    psMgr:sendMsg2PS(PID, deleteMailAck, {MailID});
                _ ->
                    skip
            end;
        _ ->
            skip
    end,
    ok.

%% 保存到内存表
saveToMnesia(#recSaveMail{senderRoleID = SenderID} = Mail, AttachList) ->
    %% 先修改表里的时间字段
    MnesiaMailRec = getMnesiaMail(Mail),

    Data = case isSysMail(SenderID) of
               true ->
	               #?MnesiaSysMail{
		               mailID          = MnesiaMailRec#recSaveMail.mailID,
		               mailReadTime    = MnesiaMailRec#recSaveMail.mailReadTime,
		               mailSendTime    = MnesiaMailRec#recSaveMail.mailSendTime,
		               isLocked        = MnesiaMailRec#recSaveMail.isLocked,
		               senderRoleID    = MnesiaMailRec#recSaveMail.senderRoleID,
		               toRoleID        = MnesiaMailRec#recSaveMail.toRoleID,
		               mailTitle       = MnesiaMailRec#recSaveMail.mailTitle,
		               mailContent     = MnesiaMailRec#recSaveMail.mailContent,
		               mailSubjoinMsg  = MnesiaMailRec#recSaveMail.mailSubjoinMsg,
		               deleteTime      = MnesiaMailRec#recSaveMail.deleteTime,
		               attachment      = AttachList
	               };
               _ ->
                   %% 普通邮件
	               #?MnesiaMail{
		               mailID          = MnesiaMailRec#recSaveMail.mailID,
		               mailReadTime    = MnesiaMailRec#recSaveMail.mailReadTime,
		               mailSendTime    = MnesiaMailRec#recSaveMail.mailSendTime,
		               isLocked        = MnesiaMailRec#recSaveMail.isLocked,
		               senderRoleID    = MnesiaMailRec#recSaveMail.senderRoleID,
		               toRoleID        = MnesiaMailRec#recSaveMail.toRoleID,
		               mailTitle       = MnesiaMailRec#recSaveMail.mailTitle,
		               mailContent     = MnesiaMailRec#recSaveMail.mailContent,
		               mailSubjoinMsg  = MnesiaMailRec#recSaveMail.mailSubjoinMsg,
		               deleteTime      = MnesiaMailRec#recSaveMail.deleteTime
	               }
           end,

    %% 保存
    edb:writeRecord(Data),

    ok.

%% 查询邮件
queryMail(SenderRoleID, OwnerID, MailID) ->
    case isSysMail(SenderRoleID) of
        true ->
            case edb:dirtyReadRecord(?MnesiaSysMail, MailID) of
                [] ->
                    {};
                [#?MnesiaSysMail{toRoleID = RoleID} = R] ->
                    case RoleID =:= OwnerID of
                        true ->
                            R;
                        _ ->
                            {}
                    end
            end;
        false ->
            case edb:dirtyReadRecord(?MnesiaMail, MailID) of
                [] ->
                    {};
                [#?MnesiaMail{toRoleID = RoleID} = R] ->
                    case RoleID =:= OwnerID of
                        true ->
                            R;
                        _ ->
                            {}
                    end
            end
    end.

%% 查询邮件
queryMail(SenderRoleID, MailID) ->
    case isSysMail(SenderRoleID) of
        true ->
            case edb:dirtyReadRecord(?MnesiaSysMail, MailID) of
                [] ->
                    {};
                [R] ->
                    R
            end;
        false ->
            case edb:dirtyReadRecord(?MnesiaMail, MailID) of
                [] ->
                    {};
                [R] ->
                    R
            end
    end.

%% 改变系统邮件的删除时间
-spec changeMailDeleteTime(#?MnesiaSysMail{}) -> #?MnesiaSysMail{}.
changeMailDeleteTime(#?MnesiaSysMail{attachment = AttachMent, deleteTime = DeleteTime1} = SysMail) ->
	NowTime = time:getSyncTime1970FromDBS(),
	DeleteTime2 = case length(AttachMent) > 0 of
		              true ->
			              %% 还有附件，删除时间保持原样
			              DeleteTime1;
		              false ->
			              %% 没有附件了，最大时间变为7天
			              NowTime + 7 * ?SECONDS_PER_DAY
	              end,

	%% 取一个最小的时间
	DeleteTime = erlang:min(DeleteTime1, DeleteTime2),

	%% 更新删除时间
	SysMail#?MnesiaSysMail{deleteTime = DeleteTime}.