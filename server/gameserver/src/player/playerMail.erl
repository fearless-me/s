%%%
%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <好玩123>
%%% @doc
%%% 玩家操作邮件
%%% @end
%%% Created : 06. 六月 2014 11:42
%%%-------------------------------------------------------------------
-module(playerMail).
-author("tiancheng").

-include("playerPrivate.hrl").

%% 一次发给客户端的邮件数量
-define(OneSendToClientNumber, 5).

%% API
%% 客户端请求消息函数
-export([
    readMail/1,
    newMail/4,
    lockMail/1,
    unlockMail/1,
    getMailCoin/1,
    getMailItem/2,
    deleteMail/1,
    deleteAllReadMail/0,
    sendGoodsMail/5,
	sendGoodsMailByContent/6,
    sendGoodsMailTitleAndContent/7,
	createMailGoods/6,
  createMailCoin/2
]).

%% 模块回调处理函数
-export([
    init/0,
    gmSendSysMail2Other/10,
    updateSelfMail/1,
    receiveNewMail/1,
    readMailAck/1,
    lockMailAck/1,
    unlockMailAck/1,
    getMailCoinAck/1,
    getMailItemAck/2,
    deleteMailAck/1,
    queryMail/1,
    queryAllMail/0,
    sendMailListToClent/0,
	getSelfMailList/0,
	sendLoseGoodsMail/2,
	sendLoseGoodsMail/4
]).

-export([
    queryAttachItemInfo/1,
	gm_deleteAllMail/0
]).

%% 邮件达到上限提示
-define(MailUpperLimitNote, 50).

%% 获取附件超时时间
-define(GetAttachmentTimeOut, 5000).

-spec sendMailListToClent() -> ok.
sendMailListToClent() ->
    PlayerMail = playerState:getMailEts(),

    List = ets:tab2list(PlayerMail),

    %% 把所有邮件都发送给客户端
    FunAllMail = fun(#recMail{mailID = MailID, mailReadTime = ReadTime, mailTitle = MailTitle, senderRoleID = SenderRoleID} = Mail, Mails) ->
	    case judgeMailIsNeedDelete(Mail) of
		    true ->
			    %% 无条件删除邮件
			    deleteMailUnConditional(MailID),
			    ?DEBUG_OUT("deal delete mail:~p", [Mail]),
			    Mails;
		    _ ->
			    SenderRoleName = case playerNameUID:getPlayerNameByUID(SenderRoleID) of
				                     [] when SenderRoleID > 0 ->
					                     stringCfg:getString(tradeMail_UnKnowPlayer);
				                     Name ->
					                     Name
			                     end,
			    MailInfo = #pk_MailInfo {
				    mailID = MailID,
				    mailTitle = MailTitle,
				    mailReadTime = ReadTime,
                    mailSendTime = Mail#recMail.mailSendTime,
                    ishaveAttach = erlang:length(Mail#recMail.attachment) > 0,
				    senderName = SenderRoleName
			    },
			    [MailInfo | Mails]
	    end
    end,

    Result = lists:foldl(FunAllMail, [], List),

    %% 倒序排序
    FunSort = fun(#pk_MailInfo{mailID = MailID1}, #pk_MailInfo{mailID = MailID2}) ->
        MailID1 > MailID2
    end,

    NewResult = lists:sort(FunSort, Result),
    sendMailListToClent(NewResult),

    case length(Result) > ?MailUpperLimitNote of
        true ->
            playerMsg:sendTipsErrorCodeMsg(?ErrorCode_YourMailMorer);
        false ->
            skip
    end,
    ok.

-spec sendGoodsMail(ItemID,ItemNum,IsBind,Quality,Source) -> ok
    when ItemID::uint(),ItemNum::uint(),IsBind::boolean(),Quality::uint(),Source::uint().
sendGoodsMail(ItemID,ItemNum,IsBind,Quality,#recPLogTSItem{} = TS) ->
    case createMailGoods1(ItemID,ItemNum,IsBind,Quality,TS) of
        [#recMailItem{}|_] = MailItemList ->
            sendLoseGoodsMail(MailItemList,"");
        _ -> % 失败的叠加
            ?ERROR_OUT("player add item by mail failed,ItemID:~p,ItemNum:~p,ItemBind:~p",[ItemID,ItemNum,IsBind]),
            false
    end.

-spec sendGoodsMailByContent(ItemID,ItemNum,IsBind,Quality, MsgContent,Source::uint()) -> ok
	when ItemID::uint(),ItemNum::uint(),IsBind::boolean(),Quality::uint(),MsgContent::string().
sendGoodsMailByContent(ItemID,ItemNum,IsBind,Quality,MsgContent,Source) ->
	ToRoleID = playerState:getRoleID(),
	case createMailGoods(ItemID,ItemNum,IsBind,Quality,ToRoleID, Source) of
		[#recMailItem{}|_] = MailItemList ->
			sendLoseGoodsMail(MailItemList, MsgContent);
		_ -> % 失败的叠加
			?ERROR_OUT("player add item by mail failed,ItemID:~p,ItemNum:~p,ItemBind:~p",[ItemID,ItemNum,IsBind]),
			false
	end.

-spec sendGoodsMailTitleAndContent(ItemID,ItemNum,IsBind,Quality,Title,Content,Source) -> ok
    when ItemID::uint(),ItemNum::uint(),IsBind::boolean(),Quality::uint(),Title::string(),Content::string(),Source::uint().
sendGoodsMailTitleAndContent(ItemID,ItemNum,IsBind,Quality,Title,Content,Source) ->
	ToRoleID = playerState:getRoleID(),
    case createMailGoods(ItemID,ItemNum,IsBind,Quality,ToRoleID,Source) of
        [#recMailItem{}|_] = MailItemList ->
            sendLoseGoodsMail(MailItemList, "", Title, Content);
        _ -> % 失败的叠加
            ?ERROR_OUT("player add item by mail failed,ItemID:~p,ItemNum:~p,ItemBind:~p",[ItemID,ItemNum,IsBind]),
            false
    end.

gm_deleteAllMail() ->
	Ets = playerState:getMailEts(),
	F =
		fun(#recMail{mailID = MailID}, _) ->
			deleteMailUnConditional(MailID),

			deleteMailAck(MailID)
		end,
	ets:foldl(F, 0, Ets),
	ok.

%% 无条件删除邮件
-spec deleteMailUnConditional(uint()) -> ok.
deleteMailUnConditional(MailID) ->
    psMgr:sendMsg2PS(?PsNameMail, deleteMailUnConditional, {playerState:getRoleID(), MailID}),
	dbLog:sendSaveLogMailChange(playerState:getRoleID(), MailID, ?MAIL_DEL),
    ok.

%% 删除指定已读邮件，有附件或者锁定都不允许删除
-spec deleteMail(uint()) -> ok.
deleteMail(MailID) ->
    %% 查找邮件
    Mail = queryMail(MailID),
    case Mail of
        {} ->
            false;
        #recMail{mailReadTime = ReadTime,isLocked = IsLocked,attachment = Attachment} ->
            if
                ReadTime > 0 andalso IsLocked =:= 0 andalso Attachment =:= [] ->
                    %?DEBUG_OUT("deleteMail:~p,~p", [playerState:getRoleID(), Mail]),

	                psMgr:sendMsg2PS(?PsNameMail, deleteMail, {Mail#recMail.senderRoleID, playerState:getRoleID(), MailID}),
					dbLog:sendSaveLogMailChange(playerState:getRoleID(), MailID, ?MAIL_DEL);
								IsLocked =/= 0 ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_MailDeleteLocked);
		            Attachment =/= [] ->
			            playerMsg:sendErrorCodeMsg(?ErrorCode_MailDeleteAttachment);
                true ->
                    skip
            end
    end,
    ok.

-spec deleteMailAck(uint() | false) -> ok.
deleteMailAck(Ret) ->
    case Ret of
        false ->
            %% 跳过
            false;
        MailID ->
            %% 删除邮件
            Ets = playerState:getMailEts(),
            myEts:deleteRecord(Ets, MailID),

	          playerMsg:sendErrorCodeMsg(?ErrorCode_MailDeleteSuccess),
            %?DEBUG_OUT("deleteMailAck:~p", [MailID]),

            playerMsg:sendNetMsg(#pk_GS2U_DeleteMail{mailID = MailID}),
			%%添加删除日志
			dbLog:sendSaveLogMailChange(playerState:getRoleID(), MailID, ?MAIL_DEL_DELAY),
            ok
    end,
    ok.

%% 删除所有已读邮件，有附件或者锁定都不允许删除
-spec deleteAllReadMail() -> ok.
deleteAllReadMail() ->
    Ets = playerState:getMailEts(),
    ETSMS = ets:fun2ms(fun(#recMail{mailID = MailID,mailReadTime = ReadTime,isLocked = IsLocked,attachment = Attachment})
        when ReadTime > 0 andalso IsLocked =:= 0 andalso Attachment =:= [] ->
        MailID
    end),
    MailIDList = myEts:selectEts(Ets, ETSMS),

    %% 删除
    [deleteMail(ID) || ID <- MailIDList],
    ok.

-spec getMailCoin(uint()) -> ok.
getMailCoin(MailID) ->
    %% 查找邮件
    Mail = queryMail(MailID),
    case Mail of
        {} ->
            false;
        _ ->
            %% 获取附件
            AttachMent = Mail#recMail.attachment,
            case AttachMent of
                [] ->
                    false;
                _ ->
                    %% 获取货币
                    case psMgr:call(?PsNameMail, getMailCoin, {Mail#recMail.senderRoleID, playerState:getRoleID(), MailID}) of
                        {getMailCoin, Ret} ->
                            getMailCoinAck(Ret);
                        Why ->
                            ?ERROR_OUT("getMailCoin:~p,~p", [Mail, Why]),
                            false
                    end
            end
    end,
    ok.

%% 获取货币
-spec getMailCoinAck({uint(), uint(), #recMail{}} | false) -> ok.
getMailCoinAck(Ret) ->
    case Ret of
        false ->
            %%
            playerMsg:sendTipsErrorCodeMsg(?ErrorCode_GetMailAttachmentFailed),
            false;
        {CoinType, Coin, NewMail} ->
            %% 添加货币
            MailID = NewMail#recMail.mailID,
            playerMoney:addCoin(CoinType, Coin,
                #recPLogTSMoney{reason=?CoinSourceMail,param=MailID,target=?PLogTS_PlayerSelf,source=?PLogTS_Mail}),

            updateSelfMail(NewMail),

            %% 记录日志
            dbLog:sendSaveLogMailChange(playerState:getRoleID(), MailID, ?MAIL_GET_COIN),
			
            playerMsg:sendNetMsg(#pk_GS2U_DelMailCoin{mailID = MailID})
    end,
    ok.

%% 获取道具
-spec getMailItem(uint(), uint()) -> ok.
getMailItem(MailID, ItemUID) ->
    Mail = queryMail(MailID),
    case Mail of
        #recMail{} ->
	        %% 获取附件
	        AttachMent = Mail#recMail.attachment,
	        case AttachMent of
		        [] ->
					?ERROR_OUT("getMail:~p ItemUID:~p failed,attach is []",[MailID, ItemUID]),
			        false;
		        _ ->
			        %% 判断背包格子
			        L = [A#recMailAttachMent.mvalue2 || A <- AttachMent, A#recMailAttachMent.mtype =:= 0, A#recMailAttachMent.mvalue =:= ItemUID],
			        case L of
				        [] ->
							?ERROR_OUT("getMail:~p ItemUID:~p failed,attach:[]",[MailID, ItemUID]),
					        false;
				        [ItemID] ->
					        %% 把物品信息加载到内存
                            Goods = case ItemID < ?Item_RuneIDStart of
										true ->
											playerItemTips:queryItemFromDBMemCache(ItemUID,false);
										_ ->
											edb:dirtyReadRecord(recRune, ItemUID)
                                    end,
                            onloadGoodsByUIDAck(Goods);
				        Other ->
							?ERROR_OUT("getMail:~p ItemUID:~p failed,attach:~p",[MailID, ItemUID,Other]),
					        false
			        end
	        end;
        _ ->
			?ERROR_OUT("getMail:~p ItemUID:~p failed,find mail failed",[MailID, ItemUID]),
	        false
    end,
    ok.

%%根据UID从数据库里加载物品结果
-spec onloadGoodsByUIDAck(Info) -> ok | false when Info::[] | false | #rec_item{} | #recSaveEquip{} | #recRune{}.
onloadGoodsByUIDAck([]) ->
	false;
onloadGoodsByUIDAck(false) ->
	false;
onloadGoodsByUIDAck(#rec_item{itemID = ItemID, itemUID = ItemUID, roleID = RoleID} = Info) ->
    case RoleID =:= ?Mail_Role_ID of
        true ->
			onloadGoodsByUIDAck2(ItemUID, ItemID, Info);
        _ ->
			?ERROR_OUT("Self:~p, item RoleID:~p onloadGoodsByUIDAck not MailID,can not getMailItemUID:~p ID:~p",
                [playerState:getRoleID(), RoleID,ItemUID,ItemID]),
			false
    end;
onloadGoodsByUIDAck(#recSaveEquip{itemID = ItemID, itemUID = ItemUID, roleID = RoleID} = Info) ->
    case RoleID =:= ?Mail_Role_ID of
        true ->
			onloadGoodsByUIDAck2(ItemUID, ItemID, Info);
        _ ->
			?ERROR_OUT("Self:~p, equip RoleID:~p onloadGoodsByUIDAck not MailID,can not getMailEquipUID:~p ID:~p",
                [playerState:getRoleID(), RoleID,ItemUID,ItemID]),
			false
    end;
onloadGoodsByUIDAck([#recRune{runeUID = ItemUID, runeID = ItemID, roleID = RoleID} = Info]) ->
	case RoleID =:= ?Mail_Role_ID of
		true ->
			onloadGoodsByUIDAck2(ItemUID, ItemID, Info);
		_ ->
			?ERROR_OUT("Self:~p, rune onloadGoodsByUIDAck not MailID,can not getMailEquipUID:~p",
				[playerState:getRoleID(), Info]),
			false
	end.

onloadGoodsByUIDAck2(ItemUID, ItemID, Info) ->
	%% 根据UID查询邮件ID
	Mail = queryMailByItemUID(ItemUID),
	case Mail of
		#recMail{mailID = MailID} ->
            %% 记录日志
            dbLog:sendSaveLogMailChange(playerState:getRoleID(), MailID, ?MAIL_GET_ITEM),

			%% 判断背包格子是否足够
			case playerTrade:getBagNumber(ItemID) > 0 of
				true ->
					%% 获取道具
%%					CSNode = gsMainLogic:getCSNodeName(),
					case psMgr:call(?PsNameMail, getMailItem, {Mail#recMail.senderRoleID, playerState:getRoleID(), MailID, ItemUID}) of
						{getMailItem, Ret} ->
							getMailItemAck(Ret, Info);
						Why ->
							?ERROR_OUT("getMailItem:~p,~p", [Mail, Why]),
							false
					end;
				_ ->
					playerMsg:sendTipsErrorCodeMsg(?ErrorCode_BuyItemErrorNoEmptyBag)
			end;
		_ ->
			playerMsg:sendTipsErrorCodeMsg(?ErrorCode_GetMailAttachmentFailed)
	end,
    ok.

-spec getMailItemAck({uint(), uint(), #recMail{}} | false, #rec_item{}|#recSaveEquip{}) -> ok.
getMailItemAck(Ret, ItemInfo) ->
    case Ret of
        false ->
            playerMsg:sendTipsErrorCodeMsg(?ErrorCode_GetMailAttachmentFailed),
            false;
        {ItemUID, ItemID, NewMail} ->
	        case ItemID < ?Item_RuneIDStart of
				true ->
					OldNum = case ItemInfo of
						         #rec_item{pileNum = PileNum} ->
							         PileNum;
						         #recSaveEquip{} ->
							         1
					         end,
					%% 添加道具
					Plog = #recPLogTSItem{
						old = OldNum,
						new = OldNum,
						change = 0,
						target = ?PLogTS_PlayerSelf,
						source = ?PLogTS_Mail,
						gold = 0,
						goldtype = 0,
						changReason = ?ItemDeleteReasonMail,
						reasonParam = NewMail#recMail.mailID
					},
					case playerPackage:addGoodsInstance(ItemInfo,Plog) of
						true->
							?LOG_OUT("role:~p getMailItemAck:~p", [playerState:getRoleID(),ItemInfo]),
							{_OldOwnerID, ItemID, ItemUID, _IsEquip} =
								case ItemInfo of
									#rec_item{} = Item ->
										{Item#rec_item.roleID, Item#rec_item.itemID, Item#rec_item.itemUID, false};
									#recSaveEquip{} = Equip ->
										{Equip#recSaveEquip.roleID, Equip#recSaveEquip.itemID, Equip#recSaveEquip.itemUID, false}
								end;
						false ->
							%% 背包空间不足
							playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNoEmptyBag)
					end;
				_ ->
					%% 提取符文
					playerRune:changeRuneOwner(ItemUID, ItemID, ?Mail_Role_ID, playerState:getRoleID())
	        end,

	        %% 从邮件附件的info列表里删除该对象
	        delItemAttachMentOne(ItemUID),

	        %% 更新邮件
	        updateSelfMail(NewMail),
	        playerMsg:sendNetMsg(#pk_GS2U_DelMailItem{mailID = NewMail#recMail.mailID, itemUID = ItemUID})
    end,
    ok.

-spec unlockMail(uint()) -> ok.
unlockMail(MailID) ->
    %% 查找邮件
    Mail = queryMail(MailID),
    case Mail of
        {} ->
            false;
        _ ->
            %% 判断是否已经锁定
            IsLocked = Mail#recMail.isLocked,
            case IsLocked of
                0 ->
                    Ret = #pk_retMailOpt{mailID = MailID, result = 0},
                    playerMsg:sendNetMsg(#pk_GS2U_UnlockMail{ret = Ret}),
                    false;
                1 ->
                    %% 去解锁
	                psMgr:sendMsg2PS(?PsNameMail, unlockMail, {Mail#recMail.senderRoleID, playerState:getRoleID(), MailID})
            end
    end,
    ok.

-spec unlockMailAck(#recMail{} | false) -> ok.
unlockMailAck(Ret) ->
    case Ret of
        false ->
            %%
            false;
        _ ->
            updateSelfMail(Ret),
            R = #pk_retMailOpt{mailID = Ret#recMail.mailID, result = 1},
            playerMsg:sendNetMsg(#pk_GS2U_UnlockMail{ret = R})
    end,
    ok.

%% 锁定邮件
-spec lockMail(uint()) -> ok.
lockMail(MailID) ->
    %% 查找邮件
    Mail = queryMail(MailID),
    case Mail of
        {} ->
            false;
        _ ->
            %% 判断是否已经锁定
            IsLocked = Mail#recMail.isLocked,
            case IsLocked of
                1 ->
                    %% 已经锁定
                    Ret = #pk_retMailOpt{mailID = MailID, result = 0},
                    playerMsg:sendNetMsg(#pk_GS2U_LockMail{ret = Ret}),
                    false;
                0 ->
                    %% 去锁定
					dbLog:sendSaveLogMailChange(playerState:getRoleID(), MailID, ?MAIL_LOCK),
	                psMgr:sendMsg2PS(?PsNameMail, lockMail, {Mail#recMail.senderRoleID, playerState:getRoleID(), MailID})
            end
    end,
    ok.

-spec lockMailAck(#recMail{} | false) -> ok.
lockMailAck(Ret) ->
    case Ret of
        false ->
            %%
            false;
        _ ->
            updateSelfMail(Ret),
            R = #pk_retMailOpt{mailID = Ret#recMail.mailID, result = 1},
            playerMsg:sendNetMsg(#pk_GS2U_LockMail{ret = R})
    end,
    ok.

%% 更新邮件
-spec updateSelfMail(#recMail{}) -> ok.
updateSelfMail(#recMail{mailID = MailID, toRoleID = ToRoleID} = Mail) ->
    PlayerID = playerState:getRoleID(),
    case PlayerID =:= ToRoleID of
        true ->
            %% 更新
            PlayerMail = playerState:getMailEts(),

            myEts:deleteRecord(PlayerMail, MailID),
            myEts:insertRecord(PlayerMail, Mail),

            ok;
        false ->
            ?ERROR_OUT("[~p] updateSelfMail not you mail [~p, ~p, ~p]", [?MODULE, ToRoleID, PlayerID, Mail]),
            skip
    end,
    ok.

%% 接收到新邮件
-spec receiveNewMail([#recMail{},...]) -> ok.
receiveNewMail([]) -> ok;
receiveNewMail([#recMail{}|_] = List) ->
    PlayerID = playerState:getRoleID(),
    Fun = fun(#recMail{mailID = MailID, toRoleID = ToRoleID} = Mail, AccList) ->
        case PlayerID =:= ToRoleID of
            true ->
                %% 判断邮件是否需要删除
                case judgeMailIsNeedDelete(Mail) of
                    true ->
                        %% 无条件删除邮件
                        deleteMailUnConditional(MailID),
                        ?DEBUG_OUT("deal delete mail:~p", [Mail]),
                        AccList;
                    false ->
                        %% 更新
                        PlayerMail = playerState:getMailEts(),
                        myEts:insertRecord(PlayerMail, Mail),

                        %% 处理附件
                        case getAttachMentUID(Mail#recMail.attachment, []) of
                            [] -> skip;
                            AttachList -> queryAttachItemInfo(AttachList)
                        end,

                        SenderRoleID = Mail#recMail.senderRoleID,
                        SenderRoleName = case playerNameUID:getPlayerNameByUID(SenderRoleID) of
                                             [] when SenderRoleID > 0 ->
												 stringCfg:getString(tradeMail_UnKnowPlayer);
                                             Name ->
                                                 Name
                                         end,

                        %% 通知客户端
                        MailInfo = #pk_MailInfo {
                            mailID = MailID,
                            mailTitle = Mail#recMail.mailTitle,
                            mailReadTime = Mail#recMail.mailReadTime,
                            mailSendTime = Mail#recMail.mailSendTime,
                            ishaveAttach = erlang:length(Mail#recMail.attachment) > 0,
                            senderName = SenderRoleName
                        },

                        ?DEBUG_OUT("receiveNewMail:~p,~p", [MailInfo, Mail]),
                        dbLog:sendSaveLogMailChange(playerState:getRoleID(), MailID, ?MAIL_RECV),
                        [MailInfo | AccList]
                end;
            false ->
                ?ERROR_OUT("[~p] receiveNewMail not you mail [~p, ~p, ~p]", [?MODULE, ToRoleID, PlayerID, Mail]),
                AccList
        end
    end,
    case lists:foldl(Fun, [], List) of
        [] -> skip;
        NList ->
            %% 判断邮件是否太多
            PlayerMailEts = playerState:getMailEts(),
            case myEts:getCount(PlayerMailEts) > ?MailUpperLimitNote of
                true -> playerMsg:sendTipsErrorCodeMsg(?ErrorCode_YourMailMorer);
                false -> skip
            end,
            sendMailListToClent(NList)
    end,
    ok.

%% 判断邮件是否需要直接删除
-spec judgeMailIsNeedDelete(#recMail{}) -> boolean().
judgeMailIsNeedDelete(#recMail{senderRoleID = 0}) ->
	%% 系统邮件，不删除
	false;
judgeMailIsNeedDelete(#recMail{senderRoleID = SenderID}) when SenderID > 0 ->
	%% 如果对方在我黑名单中，直接删除
	case friend2State:isBlack(playerState:getRoleID(), SenderID) of
		true ->
			true;
		_ ->
			%% 判断玩家的个人设置是否只接收好友邮件
			SetValue = variant:getPlayerBitVariant(playerState:getRoleID(),?Setting_PlayerBitVar_OnlyReceiveFriendMail),
			%%?DEBUG_OUT("judgeMailIsNeedDelete:~p", [SetValue]),
			RoleID = playerState:getRoleID(),
			Friend2Data = friend2State:queryFriend2Data(RoleID),
			IsFriend =
				case friend2State:queryRelation(Friend2Data, SenderID) of
					#rec_friend2_relation{relation = 2} ->  %% ?RELATION_FORMAL
						true;
					_ ->
						false
				end,
			case SetValue =:= true andalso IsFriend =:= false of
				true ->
					%% 玩家设置只接收好友邮件，且发送者不是我的好友
					true;
				_ ->
					false
			end
	end.

%% 发送普通邮件
-spec newMail(string(), string(), string(), string()) -> boolean().
newMail(ToRoleName, Title, Content, MailSubjoinMsg) ->
    IsOK = case canSendMail(ToRoleName, Title, Content) of
               0 ->
                   %% 发送失败
	               %% playerMsg:sendTipsErrorCodeMsg(?ErrorCode_MailSendFailed),
                   false;
               ToRoleID ->
                   case mail:sendSimpleMail(playerState:getRoleID(), ToRoleID, Title, Content, MailSubjoinMsg) of
                       more ->
                           playerMsg:sendErrorCodeMsg(?ErrorCode_TargetInboxFull),
                           false;
                       false ->
                           playerMsg:sendTipsErrorCodeMsg(?ErrorCode_MailSendFailed),
                           false;
					   MailID when erlang:is_integer(MailID) ->
						   true
                   end
           end,

    Result = case IsOK of
                 false ->
                     #pk_GS2U_SendMailAck{toRoleName = ToRoleName, isOK = 0};
                 true ->
                     #pk_GS2U_SendMailAck{toRoleName = ToRoleName, isOK = 1}
             end,

    playerMsg:sendNetMsg(Result),
    IsOK.

%% 发送系统邮件，成功返回邮件的ID，失败返回0
-spec gmSendSysMail2Other(string(), string(), string(), string(), uint(), uint(), uint(), uint(), uint(), uint()) -> uint().
gmSendSysMail2Other(ToRoleName, Title, Content, MailSubjoinMsg, ItemUID1, ItemID1, ItemUID2, ItemID2, MoneyType, MoneyNumber) ->
    case playerNameUID:getPlayerUIDByName(ToRoleName) of
        0 ->
            false;
        ToRoleID ->
            Item1 = case ItemUID1 > 0 of
                        true ->
	                        %% 拥有者改为邮件
                            PLog1 = #recPLogTSItem{
                                old = 0,
                                new = 0,
                                change = 0,
                                target = ?PLogTS_Mail,
                                source = ?PLogTS_PlayerSelf,
                                gold = 0,
                                goldtype = 0,
                                changReason = ?ItemDeleteReasonMail,
                                reasonParam = ItemID1
                            },
	                        playerPackage:changeGoodsOwner(ItemUID1, ItemID1, ?Trade_Role_ID, ?Mail_Role_ID, PLog1),
                            [#recMailItem{itemUID = ItemUID1, itemID = ItemID1}];
                        false ->
                            []
                    end,
            Item2 = case ItemUID2 > 0 of
                        true ->
	                        %% 拥有者改为邮件
                            PLog2 = #recPLogTSItem{
                                old = 0,
                                new = 0,
                                change = 0,
                                target = ?PLogTS_Mail,
                                source = ?PLogTS_PlayerSelf,
                                gold = 0,
                                goldtype = 0,
                                changReason = ?ItemDeleteReasonMail,
                                reasonParam = ItemID2
                            },
                            playerPackage:changeGoodsOwner(ItemUID2, ItemID1, ?Trade_Role_ID, ?Mail_Role_ID, PLog2),
                            [#recMailItem{itemUID = ItemUID2, itemID = ItemID2}];
                        false ->
                            []
                    end,
            Coin1 = case MoneyNumber > 0 of
                        true ->
                            [#recMailCoin{coinType = MoneyType, coinNum = MoneyNumber}];
                        false ->
                            []
                    end,

            mail:sendSystemMail(ToRoleID, Title, Content, Item1 ++ Item2 ++ Coin1, MailSubjoinMsg)
    end.

%% 能否发送邮件，如果能发送，返回目标的RoleID
-spec canSendMail(string(), string(), string()) -> uint().
canSendMail(ToRoleName, Title, Content) ->
    SelfName = playerState:getName(),
    case SelfName =:= ToRoleName of
        true ->
            %% 不能给自己发邮件
            playerMsg:sendTipsErrorCodeMsg(?ErrorCode_MailSendFailed),
            0;
        false ->
            Lvl = playerState:getLevel(),
			#mainMenuCfg{parameters = LevelMin} =
				getCfg:getCfgPStackWithDefaultValue(
					cfg_mainMenu,
					#mainMenuCfg{parameters = 1},
					6 %% 对应邮件
				),
	        case Lvl < LevelMin of
				false ->
					PlayerUID = playerNameUID:getPlayerUIDByName(ToRoleName),
					case PlayerUID > 0 of
						true ->
							case str:get_utf8_char_count(Title) > 64 orelse str:get_utf8_char_count(Content) > 1000 of
								false ->
									%IsInBlackList =
									%	case playerState2:isOpenFriendBlackAvoidHarassment(?FAH_MAIL) of
									%		true ->
									%			case playerState2:getFriendBlack(PlayerUID) of
									%				{} ->
									%					false;
									%				_ ->
									%					true
									%			end;
									%		_ ->
									%			false
									%	end,
									%case IsInBlackList of
									%	false ->
											PlayerUID;
									%	true ->
									%		playerMsg:sendTipsErrorCodeMsg(?ErrorCode_InYourBlackFriend),
									%		0
									%end;
								true ->
									%% 邮件主题或者内容过长，发送失败
									playerMsg:sendTipsErrorCodeMsg(?ErrorCode_MailSendFailed),
									0
							end;
						_ ->
							%% 目标不存在
							playerMsg:sendTipsErrorCodeMsg(?ErrorCode_MailTargetNouFound),
							0
					end;
				true ->
					playerMsg:sendTipsErrorCodeMsg(?ErrorCode_YourLevelIsTooLower),
					0
	        end
    end.

%% 阅读邮件
-spec readMail(uint()) -> ok.
readMail(MailID) ->
    %% 查找邮件
    Mail = queryMail(MailID),
    case Mail of
        {} ->
            %% 失败
            false;
        _ ->
            %% 判断是否第一次阅读
            ReadTime = Mail#recMail.mailReadTime,
            case ReadTime > 0 of
                true ->
                    %% 阅读过，只需要发给客户端
                    sendMailMsgToClient(MailID),
                    ok;
                false ->
					dbLog:sendSaveLogMailChange(playerState:getRoleID(), MailID, ?MAIL_OPEN),
                    %% 第一次阅读，需要通知cs
	                psMgr:sendMsg2PS(?PsNameMail, readMail, {Mail#recMail.senderRoleID, playerState:getRoleID(), MailID})
            end
    end,
    ok.

-spec readMailAck(#recMail{} | false) -> ok.
readMailAck(Ret) ->
    case Ret of
        false ->
            false;
        _ ->
            updateSelfMail(Ret),
            sendMailMsgToClient(Ret#recMail.mailID)
    end,
    ok.

%% 发送指定邮件到客户端
-spec sendMailMsgToClient(uint()) -> ok.
sendMailMsgToClient(MailID) ->
    Mail = queryMail(MailID),
    case Mail of
        #recMail{} ->
            %% 提取附件
            Fun = fun(#recMailAttachMent{mtype = MType, mvalue = MValue, mvalue2 = MValue2}, {Items, Coins}) ->
                case MType of
                    0 ->
                        %% 道具
                        {Number, Quality, IsBind} = getItemNumberAndQualityBind(MValue),
                        Item = #pk_MailItem{itemUID = MValue, itemID = MValue2, itemNumber = Number, quality = Quality, isBind = IsBind},
                        {[Item | Items], Coins};
                    _ ->
                        %% 货币
                        Coin = #pk_MailCoin{coinType = MType, coinNum = MValue},
                        {Items, [Coin | Coins]}
                end
            end,

            {Items, Coins} = lists:foldl(Fun, {[], []}, Mail#recMail.attachment),

	        SenderRoleID = Mail#recMail.senderRoleID,
	        SenderRoleName = case playerNameUID:getPlayerNameByUID(SenderRoleID) of
		                         [] when SenderRoleID > 0 ->
									 stringCfg:getString(tradeMail_UnKnowPlayer);
		                         Name ->
			                         Name
	                         end,

            Detail = #pk_MailDetail{
                mailID = MailID,
                sendRoleID = Mail#recMail.senderRoleID,
                isLocked = Mail#recMail.isLocked,
                remainDay = round((Mail#recMail.deleteTime - time:getSyncTime1970FromDBS()) / (24 * 3600)), % 删除时间减去当前时间，四舍五入
                sendPlayerName = SenderRoleName,
                mailTitle = Mail#recMail.mailTitle,
                mailContent = Mail#recMail.mailContent,
                itemList = Items,
                coinList = Coins
            },

            playerMsg:sendNetMsg(#pk_GS2U_Mail{detail = Detail}),
            %?DEBUG_OUT("sendMailMsgToClient:~p,~p,~p", [MailID, Items, Coins]),
            ok;
        {} ->
            %% 没有该邮件了
            skip
    end,
    ok.

-spec init() -> ok.
init() ->
    %% 加载邮件
    PlayerMail = ets:new(recMail, [protected, {keypos, #recMail.mailID}]),
    playerState:setMailEts(PlayerMail),
    ok.

%% 获取自己的邮件列表
-spec getSelfMailList() -> ok.
getSelfMailList() ->
	%% 获取自己的邮件列表
	case playerState:getIsPlayer() andalso not core:isCross() of
		true ->
			Ret = libMail:getSelfMailList(playerState:getRoleID()),
			getSelfMailListAck(Ret);
		_ ->
			skip
	end,
	ok.

%% 获取自己的邮件列表
-spec getSelfMailListAck({list(), list()}) -> ok.
getSelfMailListAck({SysMailList, MailList}) ->
    case playerState:getIsPlayer() of
		true ->
			PlayerMail = playerState:getMailEts(),
			RoleID = playerState:getRoleID(),

			%% 先清空
			myEts:deleteAllRecord(PlayerMail),

			Fun = fun(#recMail{toRoleID = ToRoleID, attachment = AttachMent} = Mail, ItemUIDList) ->
				case RoleID =:= ToRoleID of
					true ->
						%% 插入ets
						myEts:insertRecord(PlayerMail, Mail),

						%% 处理附件
						getAttachMentUID(AttachMent, ItemUIDList);
					false ->
						?ERROR_OUT("[~p] getSelfMailListAck not you mail [~p, ~p, ~p]", [?MODULE, ToRoleID, RoleID, Mail]),
						ItemUIDList
				end
			      end,

			%% 加载附件道具的tips
			ItemUIDL = lists:foldl(Fun, [], SysMailList),
			queryAttachItemInfo(ItemUIDL),

			lists:foldl(Fun, [], MailList),     %% 普通邮件没有附件
			ok;
		_ ->
			skip
    end,

    sendMailListToClent(),
    ok.

%% 查询邮件，注意，需要二次验证是不是自己的邮件
-spec queryMail(uint()) -> #recMail{} | {}.
queryMail(MailID) ->
    PlayerMail = playerState:getMailEts(),
    Mail = myEts:readRecord(PlayerMail, MailID),
    case Mail of
        #recMail{} ->
            case Mail#recMail.toRoleID =:= playerState:getRoleID() of
                true ->
                    Mail;
                false ->
                    {}
            end;
        Other ->
            ?DEBUG_OUT("playermail queryMail: ~p", [Other]),
            {}
    end.

queryAllMail() ->
    PlayerMail = playerState:getMailEts(),
    {myEts:getCount(PlayerMail), myEts:getAllRecord(PlayerMail)}.

%% 根据物品UID查询邮件ID
-spec queryMailByItemUID(uint()) -> #recMail{} | {}.
queryMailByItemUID(ItemUID) ->
	PlayerMail = playerState:getMailEts(),
	MailList = ets:tab2list(PlayerMail),
	Fun = fun(#recMail{mailID = MailID, attachment = AttachMent}) ->
		case [A#recMailAttachMent.mvalue2 || A <- AttachMent, A#recMailAttachMent.mailID =:= MailID, A#recMailAttachMent.mtype =:= 0, A#recMailAttachMent.mvalue =:= ItemUID] of
			[_ItemID] ->
				true;
			_ ->
				false
		end
	end,

	case lists:filter(Fun, MailList) of
		[#recMail{} = Mail] ->
			Mail;
		_ ->
			{}
	end.

%% 道具附件个数列表[{itemUID, ItemInfo}, ...]
-spec setItemAttachMentList(List::list()) -> undefined | list().
setItemAttachMentList(List) ->
	put('ItemAttachMentList', List).

-spec addItemAttachMentList(List::list()) -> undefined | list().
addItemAttachMentList(List) ->
	OldList = getItemAttachMentList(),
	put('ItemAttachMentList', List ++ OldList).

-spec getItemAttachMentList() -> list().
getItemAttachMentList() ->
	case get('ItemAttachMentList') of
		undefined ->
			[];
		List ->
			List
	end.

%% 从列表中删除一个指定数据
-spec delItemAttachMentOne(ItemUID::uint()) -> ok.
delItemAttachMentOne(ItemUID) ->
	L = getItemAttachMentList(),
	NL = lists:keydelete(ItemUID, 1, L),
	setItemAttachMentList(NL),
	ok.

%% 获取对象的道具个数，品质和绑定状态
-spec getItemNumberAndQualityBind(ItemUID::uint()) -> uint().
getItemNumberAndQualityBind(ItemUID) ->
	L = getItemAttachMentList(),
	case lists:keyfind(ItemUID, 1, L) of
		{_, #recSaveEquip{quality = Q1,isBind = B1}} ->
            {1, Q1, B1};
		{_, #rec_item{pileNum = Number, quality = Q2, isBind = B2}} ->
            {Number, Q2, B2};
		{_, #recRune{runeID = RuneID, isBind = IsBind}} ->
			#runeCfg{quality = Q3} = playerRune:getRuneConf(RuneID),
			{1, Q3, IsBind};
		_ ->
            {0, 0, true}
	end.

queryAttachItemInfo([]) -> ok;
queryAttachItemInfo([ItemUID|L]) ->
    queryAttachItemInfo(ItemUID),
    queryAttachItemInfo(L);
queryAttachItemInfo(ItemUID) when erlang:is_integer(ItemUID) andalso ItemUID > 0 ->
	case uidMgr:getUIDType(ItemUID) of
		?UID_TYPE_Rune ->
			case edb:dirtyReadRecord(recRune, ItemUID) of
				[#recRune{} = Rune] -> addItemAttachMentList([{ItemUID, Rune}]);
				_ -> skip
			end;
		_ ->
			case playerItemTips:queryItemFromDBMemCache(ItemUID,false) of
				false -> skip;
				Item -> addItemAttachMentList([{ItemUID, Item}])
			end
	end.

%% 提取附件中的道具UID
-spec getAttachMentUID(list(), HaveList::list()) -> list().
getAttachMentUID([], HaveList) ->
	HaveList;
getAttachMentUID([#recMailAttachMent{mtype = Type, mvalue = ItemUID}|T], HaveList) ->
	case Type =:= 0 of
		true ->
			getAttachMentUID(T, [ItemUID | HaveList]);
		_ ->
			getAttachMentUID(T, HaveList)
	end.

createMailGoods(ItemID,Num,IsBind,Quality,ToRoleID,Reason) ->
	TS = #recPLogTSItem{
		old = 0,
		new = Num,
		change = Num,
		target = 0,
		source = 0,
		changReason = Reason,
		reasonParam = ToRoleID,
		gold = 0,
		goldtype = 0
	},
	createMailGoods1(ItemID,Num,IsBind,Quality,TS).
createMailCoin(CoinType,CoinNumber) when CoinType >= ?CoinTypeMin , CoinType =< ?CoinTypeMax ->
  #recMailCoin{coinType = CoinType, coinNum = CoinNumber}.

%% ====================================================================
%% Internal functions
%% ====================================================================

%% 生成邮件道具物品
-spec createMailGoods1(ItemID,Num,IsBind,Quality,#recPLogTSItem{}) -> [] |[#recMailItem{},...] when
	ItemID::integer(),Num::integer(),IsBind::boolean(),Quality::uint().
createMailGoods1(0, _, _, _, _) ->
	[];
createMailGoods1(ItemID,Num,IsBind,Quality,#recPLogTSItem{} = TS) ->
	?DEBUG_OUT("createMailItem：~p",[{ItemID,Num,IsBind}]),
	case playerPackage:makeGoodsInstance(ItemID,Num,IsBind,Quality,?Mail_Role_ID, TS) of
		[H|_] = UIDList when erlang:is_integer(H) ->
			?DEBUG_OUT("createMailItem--UIDlist:~p",[UIDList]),
			[#recMailItem{
				itemUID = X,
				itemID  = ItemID
			} || X <- UIDList];
		_Other ->
			?ERROR_OUT("createMailItem/3 Err   ItemID:~p,Return:~p",[ItemID,_Other]),
			[]
	end.

sendLoseGoodsMail(MailItemList, MailSubjoinMsg) ->
    sendLoseGoodsMail(MailItemList, MailSubjoinMsg,
        stringCfg:getString(loseGoods_MailTitle),
        stringCfg:getString(loseGoods_MailContent)),
    ok.

%%发送自定义内容的邮件
sendLoseGoodsMail(MailItemList, MailSubjoinMsg, Title, Content) ->
	Len = erlang:length(MailItemList),
	case Len =< ?AttachmentItemNumber of
		true ->
			sendGoodsMailReal(MailItemList, MailSubjoinMsg, Title, Content);
		_ ->
			%% 大于两个附件
			Fun = fun(_, AttachList) ->
				Len2 = erlang:length(AttachList),
				if
					AttachList =:= [] ->
						[];
					Len2 =< ?AttachmentItemNumber ->
						sendGoodsMailReal(AttachList, MailSubjoinMsg, Title, Content),
						[];
					true ->
						[A1, A2 | T] = AttachList,
						sendGoodsMailReal([A1,A2], MailSubjoinMsg, Title, Content),
						T
				end
			end,
			lists:foldl(Fun, MailItemList, lists:seq(1, (Len div 2) + 1)),
			ok
	end,
	ok.

%% 真正发邮件
sendGoodsMailReal(MailItemList, MailSubjoinMsg, Title, Content) ->
	case mail:sendSystemMail(playerState:getRoleID(), Title, Content, MailItemList, MailSubjoinMsg) > 0 of
		true ->
			true;
		false ->
			% 失败的叠加
			?ERROR_OUT("player[~p][~ts] add item by sendmail failed",[playerState:getRoleID(),playerState:getName()]),
			false
	end.

sendMailListToClent([]) ->
    ok;
sendMailListToClent(List) ->
    Fun =
        fun(Item, {Number, AccL}) ->
            case Number >= ?OneSendToClientNumber of
                true ->
                    playerMsg:sendNetMsg(#pk_GS2U_MailInfo{mailInfoList = AccL}),
                    {1, [Item]};
                _ ->
                    {Number + 1, [Item | AccL]}
            end
        end,
    case lists:foldl(Fun, {0, []}, List) of
        {_Num, L} when erlang:length(L) > 0 ->
            playerMsg:sendNetMsg(#pk_GS2U_MailInfo{mailInfoList = L});
        _ ->
            skip
    end,
    ok.