%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <haowan123>
%%% @doc
%%% 玩家交易行进程
%%% @end
%%% Created : 20. 五月 2014 17:27
%%%-------------------------------------------------------------------
-module(playerTrade).
-author("tiancheng").

-include("playerPrivate.hrl").
-include("tradeDefine.hrl").

%% 排序方式
-define(SortASC, 1).
-define(SortDESC, 2).
%% 排序体
-define(Sort(ST, First, Second), case ST of
	                                 ?SortASC ->
		                                 %% 升序
		                                 Second > First;
	                                 _ ->
		                                 %% 其它
		                                 First > Second
                                 end).

%% API
%% 客户端请求消息函数
-export([
    queryTrade/1,
    nextResult/2,
    sortTradeQueryResult/1,
    querySelfTrade/1,
    buyTrade/1,
    refuseBuy/1,
    putTrade/1,
    downTrade/1,
    queryNewestTrade/1
]).

%% 模块回调处理函数
-export([
    init/0,
    getBagNumber/1,     % 获取背包格子数
    printTradeArray/2   % for gm test
]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 客户端请求消息函数

%% 拒绝购买，只有指定交易能拒绝噢
-spec refuseBuy(B) -> ok when B::#pk_U2GS_TradeRefuse{}.
refuseBuy(#pk_U2GS_TradeRefuse{tradeClass = V_tradeClass, orderID = V_orderID, opCode = OpCode} = _B) ->
    playerState:setTradeOpCode(OpCode),

    %?LOG_OUT("refuseBuy:~p", [V_orderID]),
    case V_tradeClass =:= ?TradeType_Private of
        true ->
            PlayerID = playerState:getRoleID(),
            case getTradeOrder({V_tradeClass, V_orderID, PlayerID}) of
                #?TradeQueryResult{destRoleID = DestRoleID} = Result ->
                    case PlayerID =:= DestRoleID andalso isNewestOrderNotChanged(V_orderID, Result) of
                        true ->
                            %% 订单没有改变，可以拒绝购买
                            %% 删除订单，给出售者发送退回邮件
                            case opTradeOrder({V_tradeClass, V_orderID, PlayerID, PlayerID}) of
                                true ->
                                    %% 拒绝成功，删除订单成功
                                    #?TradeQueryResult{roleID = RoleID, itemUID = ItemUID, itemID = ItemID, pileNumber = Number} = Result,

                                    %% 给出售者RoleID发送退回邮件
                                    Attach = #recMailItem{itemUID = ItemUID, itemID = ItemID},

                                    %% 拥有者由交易行改为邮件
                                    case ItemID < ?Item_RuneIDStart of
                                        true ->
                                            Plog = #recPLogTSItem{
                                                old = Number,
                                                new = Number,
                                                change = 0,
                                                target = ?PLogTS_Mail,
                                                source = ?PLogTS_Trade,
                                                gold = 0,
                                                goldtype = 0,
                                                changReason = ?ItemDeleteReasonTrade,
                                                reasonParam = V_orderID
                                            },
                                            playerPackage:changeGoodsOwner(ItemUID, ItemID, ?Trade_Role_ID, ?Mail_Role_ID, Plog);
                                        _ ->
                                            playerRune:changeRuneOwner(ItemUID, ItemID, ?Trade_Role_ID, ?Mail_Role_ID)
                                    end,

                                    %% 退出物品给玩家
                                    MailID = mail:sendSystemMail(RoleID, stringCfg:getString(tradeMail_Title),
										stringCfg:getString(tradeMail_BackItem), [Attach], erlang:integer_to_list(V_orderID)),

                                    noticeClientOpResult(V_tradeClass, V_orderID, 1, OpCode),

									dbLog:sendSaveLogTradeOp(#rec_log_trade_op{
										tradeID = V_orderID,				%%订单ID bigint(8) unsigned
										downReson = ?LTOR_Back,				%%0过期，1下架，2退回，3交易成功 tinyint(1) unsigned
										roleID = PlayerID,				%%操作者ID bigint(8) unsigned
										param = MailID				%%邮件ID bigint(8) unsigned
									}),
                                    ok;
                                false ->
                                    %% 拒绝失败，不操作
                                    skip
                            end;
                        false ->
                            skip
                    end;
                _ ->
                    %% 交易行未知错误
                    playerMsg:sendErrorCodeMsg(?ErrorCode_TradeError),
                    skip
            end;
        false ->
            skip
    end,
    ok.

%% 购买
-spec buyTrade(B) -> ok when B::#pk_U2GS_TradeBuy{}.
buyTrade(#pk_U2GS_TradeBuy{tradeClass = V_tradeClass, orderID = V_orderID, opCode = OpCode} = _B) ->
    playerState:setTradeOpCode(OpCode),

    PlayerID = playerState:getRoleID(),
    Result = getTradeOrder({V_tradeClass, V_orderID, PlayerID}),
    %?LOG_OUT("buyTrade:~p", [Result]),

	%% 判断请求购买的订单是否已经发生改变
	case isNewestOrderNotChanged(V_orderID, Result) of
		true ->
			%% 判断是否可以购买
			{CanBuy, ErrorCode} =
				case Result#?TradeQueryResult.roleID =:= PlayerID of
					true ->
						%% 不能购买自己的东西
						{false, ?ErrorCode_TradeSelf};
					false ->
						%% 是否可以购买
						canTrade(Result)
				end,

			%?LOG_OUT("buyTrade aaa:~p,~p", [CanBuy,ErrorCode]),
			case CanBuy of
				false ->
					%% 不能购买，发送tips
					playerMsg:sendTipsErrorCodeMsg(ErrorCode);
				true ->
					buyTrade(Result, V_tradeClass, V_orderID, PlayerID)
			end;
		_ ->
			%% 订单已经改变或者没有搜索到
			playerMsg:sendTipsErrorCodeMsg(?ErrorCode_TradeSelled),
			skip
	end,
	ok.

%% 上架
-spec putTrade(P) -> ok when P::#pk_U2GS_PutTrade{}.
putTrade(#pk_U2GS_PutTrade{
    tradeClass = V_tradeClass,
    itemUID = V_itemUID,
    itemID = V_itemID,
    sellNumber = V_sellNumber,
    sellTime = V_sellTime,
    silver = V_silver,
    gold = V_gold,
    destRoleName = V_destRoleName,
    opCode = OpCode} = P) ->
    %?LOG_OUT("putTrade:~p", [P]),

    playerState:setTradeOpCode(OpCode),

    %% 把目标姓名转换为UID
    DestRoleID = onPlayerName2UID(V_destRoleName),

	PlayerID = playerState:getRoleID(), % 自己的ID

	%% 先本地判断能不能上架
	{CanPut, ErrorCode} = canPutTrade(V_tradeClass, V_itemUID, V_itemID, V_sellNumber, V_sellTime, V_silver, V_gold, DestRoleID),

	%% 再判断已经有的个人订单个数
	{CanPut3, ErrorCode3} =
		case CanPut of
			false -> {false, ErrorCode};
			true -> canPutTrade(V_tradeClass, PlayerID)
		end,

	{_Ret, Code} =
		case CanPut3 of
			true ->
				%% 可以上架
				case goods:getItemStaticMsg(V_itemID) of
					#tradeItemStaticRec{itemType = ItemType, itemSubType = ItemSubType, itemLevel = ItemLevel, itemProfession = ItemProfession} ->
						Quality = getItemQuality(V_itemUID, V_itemID),

						%% 扣除道具，有可能是一个拆分出来的道具，所以需要判定是否是拆分出来的道具UID
						DecRet = decItem(PlayerID, ?Trade_Role_ID, V_itemUID, V_itemID, V_sellNumber, 999),
						{IsDecOK,ItemUID} =
							case is_integer(DecRet) of
								true -> {true, DecRet};
								_ -> {DecRet,V_itemUID}
							end,
						case IsDecOK of
							true ->
								%% 生成订单ID
								OrderID = uidMgr:makeTradeUID(),

								%% 先扣道具和钱
								%% 上架成功，扣钱
								{_CoinType, Coin} = getPutTradeMoney(V_tradeClass, V_sellTime, V_silver, V_gold),
								_R = playerMoney:useCoin(?CoinUseTypeGold, Coin,
									#recPLogTSMoney{reason=?CoinUseTradeFee,param=OrderID,target=?PLogTS_Trade,source=?PLogTS_PlayerSelf}),
								%?DEBUG_OUT("putTrade:~p,~p,~p,~p,~p,~p", [V_tradeClass, V_sellTime, V_silver, V_gold, Coin, R]),

								BRet = opTradeOrder({OrderID, ItemUID, PlayerID, V_tradeClass, V_sellTime, V_silver, V_gold, DestRoleID,
									V_itemID, Quality, ItemType, ItemSubType, ItemLevel, ItemProfession, V_sellNumber}),

								case BRet of
									true ->
										%% 重新查询自己的订单
										querySelfTrade(#pk_U2GS_QuerySelfTrade{tradeClass = 0, opCode = OpCode}),

										%% 通知自己，该操作成功
										noticeClientOpResult(V_tradeClass, OrderID, 1, OpCode),

										%% 如果是指定交易，给目标发送一封普通邮件告知他
										case V_tradeClass of
											?TradeType_Private ->
												RoleName = playerState:getName(),
												ItemName =
													if
														V_itemID >= ?Item_RuneIDStart ->
															#runeCfg{name = Name3} = getCfg:getCfgPStack(cfg_rune, V_itemID),
															Name3;
														V_itemID >= ?Item_Differentiate ->
															#equipmentCfg{name = Name1} = getCfg:getCfgPStack(cfg_equipment, V_itemID),
															Name1;
														true ->
															#itemCfg{name = Name2} = getCfg:getCfgPStack(cfg_item, V_itemID),
															Name2
													end,
												MailTitle = stringCfg:getString(designated_tradingTitle),
												MailContent = stringCfg:getString(designated_tradingContent, [RoleName, ItemName]),
												%% 发送普通邮件
												mail:sendSimpleMail(PlayerID, DestRoleID, MailTitle, MailContent, erlang:integer_to_list(OrderID)),
												ok;
											_ ->
												skip
										end,

										%% 记录日志
										NowT = time2:getTimestampSec(),
										dbLog:sendSaveLogTrade(#rec_log_trade{
											roleID = PlayerID,				%%出售者角色ID bigint(20) unsigned
											orderID = OrderID,				%%订单ID bigint(20) unsigned
											itemUID = ItemUID,				%%出售者原装备唯一ID bigint(20) unsigned
											sellType = V_tradeClass,				%%出售类型,1铜币交易,2元宝交易,3指定交易 tinyint(4) unsigned
											putTime = NowT,				%%上架时间 int(10) unsigned
											downTime = NowT + V_sellTime * 3600,				%%下架时间 int(10) unsigned
											silver = V_silver,				%%银币 int(10) unsigned
											gold = V_gold,				%%金币 int(10) unsigned
											destRoleID = DestRoleID,				%%指定卖给谁 bigint(20) unsigned
											itemID = V_itemID,				%%道具编号ID int(11) unsigned
											quality = Quality				%%道具品质 tinyint(4) unsigned
										}),
										{true, ?ErrorCode_TradePutSucc};
									Other ->
										%% 上架失败，记录日志
										?ERROR_OUT("~p putTrade failed ~p, ~p", [PlayerID, P, Other]),
										{false, ?ErrorCode_TradeError}
								end;
							_ ->
								{false, ?ErrorCode_BuyItemErrorNoEmptyBag}
						end;
					_ ->
						?ERROR_OUT("[~p] putTrade getItemStaticMsg failed", [?MODULE]),
						{false, ?ErrorCode_TradeNotSell}
				end;
			false ->
				{false, ErrorCode3}
		end,

	%?LOG_OUT("putTrade bbb:~p,~p,~p,~p,~p", [CanPut, ErrorCode, CanPut3, ErrorCode3, Code]),
	playerMsg:sendTipsErrorCodeMsg(Code),
	ok.

%% 下架
-spec downTrade(D) -> ok when D::#pk_U2GS_DownTrade{}.
downTrade(#pk_U2GS_DownTrade{tradeClass = V_tradeClass, orderID = V_orderID, opCode = OpCode} = _D) ->
	playerState:setTradeOpCode(OpCode),

	PlayerID = playerState:getRoleID(),
	%?LOG_OUT("~p", [V_orderID]),
	Result = getTradeOrder({V_tradeClass, V_orderID, PlayerID}),
	{_Ret, ErroCode} =
		case Result of
			#?TradeQueryResult{roleID = RoleID, destRoleID = DestRoleID} ->
				%% 判断有没有足够的背包格子
				case getBagNumber(Result#?TradeQueryResult.itemID) >= 0 of
					true ->
						case PlayerID =:= RoleID of
							true ->
								%% 有该订单，赶快去操作订单吧，过期不候
								BRet = opTradeOrder({V_tradeClass, V_orderID, PlayerID, DestRoleID}),
								case BRet of
									true ->
										%% 重新查询自己的订单
										querySelfTrade(#pk_U2GS_QuerySelfTrade{tradeClass = 0, opCode = OpCode}),

										%% 把物品郵件給自己
										#?TradeQueryResult{itemUID = ItemUID, itemID = ItemID, pileNumber = Number} = Result,

										%% 拥有者由交易行改为邮件
										case ItemID < ?Item_RuneIDStart of
											true ->
												Plog = #recPLogTSItem{
													old = Number,
													new = Number,
													change = 0,
													target = ?PLogTS_Mail,
													source = ?PLogTS_Trade,
													gold = 0,
													goldtype = 0,
													changReason = ?ItemDeleteReasonTrade,
													reasonParam = V_orderID
												},
												playerPackage:changeGoodsOwner(ItemUID, ItemID, ?Trade_Role_ID, ?Mail_Role_ID, Plog);
											_ ->
												playerRune:changeRuneOwner(ItemUID, ItemID, ?Trade_Role_ID, ?Mail_Role_ID)
										end,

										AttachMent = #recMailItem{itemUID = ItemUID, itemID = ItemID},
										MailID = mail:sendSystemMail(PlayerID, stringCfg:getString(tradeMail_Title),
											stringCfg:getString(tradeMail_DownItem), [AttachMent], erlang:integer_to_list(V_orderID)),

										%% 通知自己，该操作成功
										noticeClientOpResult(V_tradeClass, V_orderID, 1, OpCode),

										dbLog:sendSaveLogTradeOp(#rec_log_trade_op{
											tradeID = V_orderID,				%%订单ID bigint(8) unsigned
											downReson = ?LTOR_Down,				%%0过期，1下架，2退回，3交易成功 tinyint(1) unsigned
											roleID = PlayerID,				%%操作者ID bigint(8) unsigned
											param = MailID				%%邮件ID bigint(8) unsigned
										}),

										{true, ?ErrorCode_TradeDownSucc};
									false ->
										%%
										{false, ?ErrorCode_TradeDelFailed}
								end;
							_ ->
								{false, ?ErrorCode_TradeDelFailed}
						end;
					_ ->
						{false, ?ErrorCode_BuyItemErrorNoEmptyBag}
				end;
			_ ->
				%% 没有该订单
				{false, ?ErrorCode_TradeSelled}
		end,

    %?LOG_OUT("putTrade bbb:~p,~p,~p", [Ret, ErroCode, Result]),
    playerMsg:sendTipsErrorCodeMsg(ErroCode),
    ok.

%% 查询自己的交易订单(这里是指自己上架的订单)
-spec querySelfTrade(Record) -> ok when Record::#pk_U2GS_QuerySelfTrade{} | #pk_U2GS_QueryNewestTrade{}.
querySelfTrade(#pk_U2GS_QuerySelfTrade{tradeClass = TradeClass, opCode = OpCode} = _Q) ->
    %?DEBUG_OUT("pk_U2GS_QuerySelfTrade:~p", [TradeClass]),
    %% 注意自己的订单全部一起发给客户端
    clearQueryData(),

    playerState:setTradeOpCode(OpCode),

    %% 设置一些属性
    playerState:setTradeClass(TradeClass),
    playerState:setTradeOnePageNumber(?NODE_Max_Send), % 这里把每页设为一千个

    %% 自己的角色ID
    PlayerID = playerState:getRoleID(),

    %% 设置查询条件为空
    playerState:setTradeQueryCondition({}),
	queryTradeResultList(tradeDataQueryLogic:querySelfTradeDataEnter({TradeClass, PlayerID})),
    ok;
%% 查询所有被指定的交易记录(这里是指别人指定交易给我的订单)
querySelfTrade(#pk_U2GS_QueryNewestTrade{tradeClass = V_tradeClass, getNumber = V_getNumber,
	oneNumber = V_oneNumber, opCode = OpCode} = _R) ->
	clearQueryData(),

	playerState:setTradeOpCode(OpCode),

	%% 设置一些属性
	playerState:setTradeClass(V_tradeClass),
	playerState:setTradeOnePageNumber(V_oneNumber), % 这里把每页设为一千个

	%% 自己的角色ID
	PlayerID = playerState:getRoleID(),

	%% 设置查询条件为空
	playerState:setTradeQueryCondition({}),
	queryTradeResultList(tradeDataQueryLogic:querySelfTradeDataEnter({V_tradeClass, PlayerID, V_getNumber})),
	ok.

%% 首次打开界面，获取最新的上架记录
-spec queryNewestTrade(R) -> ok when R::#pk_U2GS_QueryNewestTrade{}.
queryNewestTrade(#pk_U2GS_QueryNewestTrade{tradeClass = V_tradeClass, getNumber = V_getNumber,
    oneNumber = V_oneNumber, opCode = OpCode} = R) ->
    playerState:setTradeOpCode(OpCode),

    if
        V_tradeClass < ?TradeType_Silver
            orelse V_tradeClass > ?TradeType_Private
            orelse V_oneNumber =< 0
            orelse V_oneNumber > ?NODE_Max_Send ->
            false;
        true ->
            %% 可以查询
            case V_tradeClass of
                ?TradeType_Private ->
                    %% 是指定交易，则查询所有记录
                    querySelfTrade(R);
                _ ->
                    %% 清理数据
                    clearQueryData(),

                    %% 设置一些属性
                    playerState:setTradeClass(V_tradeClass),
                    playerState:setTradeOnePageNumber(V_oneNumber), % 这里把每页设为一千个

                    %% 设置查询条件为空
                    playerState:setTradeQueryCondition({}),

					queryTradeResultList(tradeDataQueryLogic:queryNewestTradeDataEnter({V_tradeClass, V_getNumber})),
                    ok
            end
    end,
    ok.

%% 查询交易行
-spec queryTrade(QueryCondition) -> ok when QueryCondition::#pk_U2GS_QueryTrade{}.
queryTrade(#pk_U2GS_QueryTrade{
    tradeClass = TradeClass,
    itemClass = ItemClass,
    itemTypeList = ItemTypeList, % <0表示不限制
    itemSubType = ItemSubType, % <0 表示不限制
    itemList = ItemList,
    itemLvlMin = ItemLvlMin,
    itemLvlMax = ItemLvlMax,
    itemProfession = ItemProfession,
    oneNumber = OneNumber,
    opCode = OpCode
} = _QueryCondition) ->
    %% 清空老的查询数据
    clearQueryData(),

    %% 设置一些属性
    playerState:setTradeClass(TradeClass),
    playerState:setTradeItemClass(ItemClass),
    playerState:setTradeItemType(ItemTypeList),
    playerState:setTradeItemSubType(ItemSubType),
    playerState:setTradeOnePageNumber(OneNumber), % 每页多少个
    playerState:setTradeOpCode(OpCode),

    %% 自己的角色ID
    PlayerID = playerState:getRoleID(),

    %?LOG_OUT("~p",[QueryCondition]),

    case canQuery(TradeClass, ItemClass) of
        false ->
            error;
        true ->
            %% 可以查询
            %% 查询条件列表，指定列表
            QC1 = getQueryCondition(itemlist, length(ItemList) > 0, ItemList),
            %% 等级范围
            QC2 = getQueryCondition(itemlevel, ItemLvlMax >= 0 andalso ItemLvlMin >= 0, [ItemLvlMin, ItemLvlMax]),
            %% 职业
            QC3 = getQueryCondition(profession, ItemProfession >= 0, ItemProfession),
            %% 主类型
            _QC4 = getQueryCondition(itemtype, erlang:length(ItemTypeList) > 0, ItemTypeList),
            %% 子类型
            QC5 = getQueryCondition(subtype, ItemSubType >= 0, ItemSubType),

            %% 发消息给cs查询
            QueryParam = if
                             erlang:length(ItemTypeList) > 0 andalso ItemSubType >= 0 ->
                                 %% 这最快捷的查询方式
                                 {{TradeClass, ItemClass, ItemTypeList, ItemSubType, QC1 ++ QC2 ++ QC3}, {PlayerID}};
                             erlang:length(ItemTypeList) > 0 ->
                                 %% 只有主类型
                                 {{TradeClass, ItemClass, ItemTypeList, QC1 ++ QC2 ++ QC3}, {PlayerID}};
                             ItemSubType >= 0 ->
                                 %% 没有主类型，只有子类型的时候
                                 {{TradeClass, ItemClass, QC5 ++ QC1 ++ QC2 ++ QC3}, {PlayerID}};
                             true ->
                                 %% 效率最低的查询方式，最好不要使用
                                 {{TradeClass, ItemClass, QC1 ++ QC2 ++ QC3}, {PlayerID}}
                         end,

            %% 设置查询条件
            playerState:setTradeQueryCondition(QueryParam),

            %?LOG_OUT("QueryParam:~p", [QueryParam]),
			queryTradeResultList(tradeDataQueryLogic:queryTradeDataEnter(QueryParam)),

            ok
    end,
    ok.

%% 下一组查询纪录
-spec nextResult(PageNumber, OpCode) -> ok when PageNumber::uint(), OpCode::uint().
nextResult(PageNumber, OpCode) ->
    playerState:setTradeOpCode(OpCode),

    Count = playerState:getTradeQueryResultNumber(),
    OnePageNumber = playerState:getTradeOnePageNumber(),

    %% 总页数
    D = Count / OnePageNumber,
    AllPageNumber = if
                        D == 0 ->
                            1;
                        is_float(D) ->
                            trunc(D) + 1;
                        true ->
                            D
                    end,

    if
        PageNumber > 0 andalso PageNumber =< AllPageNumber ->
            playerState:setTradeNowPage(PageNumber);
        true ->
            %% 设置为最后一页
            playerState:setTradeNowPage(AllPageNumber)
    end,

    sendResultToClient(),

    ok.

%% 对结果排序
-spec sortTradeQueryResult(Sort) -> ok when Sort::#pk_U2GS_ResultSort{}.
sortTradeQueryResult(#pk_U2GS_ResultSort{sortIndex = SortIndex, sortType = ST, pageNumber = PageNumber, opCode = OpCode} = _Sort) ->
    playerState:setTradeOpCode(OpCode),

    %% 得到总数
    AllNumber = playerState:getTradeQueryResultNumber(),

	playerState:setTradeSortCol(SortIndex),
	playerState:setTradeSortType(ST),

    if
        AllNumber < 2 ->
	        %% 直接返回结果
            nextResult(PageNumber, OpCode);
        true ->
            %% 需要排序
            case sortResult(SortIndex, ST) of
                false ->
                    %% 排序失败
                    false;
                true ->
                    %% 排序成功后，发新的页
                    nextResult(PageNumber, OpCode)
            end
    end,
    ok.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%











%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 模块回调处理函数
%% 个人交易行信息初始化
-spec init() -> ok.
init() ->
    %% 添加查询结果的进程字典
    playerState:setTradeQueryResult(array:new()),

    %% 初始化操作码
    playerState:setTradeOpCode(-1),
	%% 设置排序列
	playerState:setTradeSortCol(0),
	%% 设置排序方式
	playerState:setTradeSortType(0),
    %?LOG_OUT("aaa:~p",[playerState:getCSNodeName()]),

    ok.

%% 查询结果总数
-spec queryTradeResultNumber(Result) -> ok when Result::uint().
queryTradeResultNumber(Result) ->
    %% 发送本次查询Info给客户端去初始化
    Rec = #pk_GS2U_QueryTradeInfo{
        tradeClass  = playerState:getTradeClass(),
        itemClass   = playerState:getTradeItemClass(),
        itemTypeList= playerState:getTradeItemType(),
        itemSubType = playerState:getTradeItemSubType(),
        allNumber   = Result,
        opCode      = playerState:getTradeOpCode()
    },

    %?LOG_OUT("queryTradeResultNumber:~p", [Rec]),

    playerMsg:sendNetMsg(Rec),

    ok.

%% 查询结果
-spec queryTradeResult(Result::list()) -> uint().
queryTradeResult(Result) ->
	%?LOG_OUT("recv queryTradeDataResult: ~p", [Result]),

	%% 插入array
	Fun =
		fun(#?TradeQueryResult{orderID = OrderID, roleID = OwnerID} = ResultRec, {Array, Index}) ->
			%% 判断指定给我的交易的人，是不是在我的黑名单中，如果是，则直接拒绝掉
			case ResultRec#?TradeQueryResult.sellType =:= ?TradeType_Private of
				false ->
					{array:set(Index, ResultRec, Array), Index + 1};
				true ->
					%%% 是指定交易，判断对方在不在我的黑名单中
					PlayerID = playerState:getRoleID(),
					case friend2State:isBlack(PlayerID, OwnerID) of
						false ->
							{array:set(Index, ResultRec, Array), Index + 1};
						_ ->
							%% 直接拒绝, 删除订单，给出售者发送退回邮件
							PlayerID = playerState:getRoleID(),
							case opTradeOrder({ResultRec#?TradeQueryResult.sellType, OrderID, PlayerID, PlayerID}) of
								true ->
									%% 拒绝成功，删除订单成功
									#?TradeQueryResult{roleID = RoleID, itemUID = ItemUID, itemID = ItemID, pileNumber = Number} = ResultRec,

									%% 给出售者RoleID发送退回邮件
									Attach = #recMailItem{itemUID = ItemUID, itemID = ItemID},

									%% 拥有者由交易行改为邮件
									case ItemID < ?Item_RuneIDStart of
										true ->
											Plog = #recPLogTSItem{
												old = Number,
												new = Number,
												change = 0,
												target = ?PLogTS_Mail,
												source = ?PLogTS_Trade,
												gold = 0,
												goldtype = 0,
												changReason = ?ItemDeleteReasonTrade,
												reasonParam = OrderID
											},
											playerPackage:changeGoodsOwner(ItemUID, ItemID, ?Trade_Role_ID, ?Mail_Role_ID, Plog);
										_ ->
											playerRune:changeRuneOwner(ItemUID, ItemID, ?Trade_Role_ID, ?Mail_Role_ID)
									end,

									%% 退出物品给玩家
									mail:sendSystemMail(RoleID, stringCfg:getString(tradeMail_Title),
										stringCfg:getString(tradeMail_BackItem), [Attach], erlang:integer_to_list(OrderID)),
									ok;
								false ->
									%% 拒绝失败，不操作
									skip
							end,
							{Array, Index}
					end
			end
		end,

	Array = playerState:getTradeQueryResult(),
	Count = playerState:getTradeQueryResultNumber(),

	%% 插入数组
	{NewArray, NewCount} = lists:foldl(Fun, {Array, Count}, Result),
	%% 设置结果
	playerState:setTradeQueryResult(NewArray),
	playerState:setTradeQueryResultNumber(NewCount),
	NewCount.

%% 玩家UID转换为姓名
-spec onPlayerUID2Name(RoleID) -> RoleName when
    RoleID::integer(), RoleName::list().
onPlayerUID2Name(RoleID) -> playerNameUID:getPlayerNameByUID(RoleID).

%% 玩家姓名转换为UID
-spec onPlayerName2UID(RoleName) -> RoleID when
    RoleName::list(), RoleID::integer().
onPlayerName2UID(RoleName) -> playerNameUID:getPlayerUIDByName(RoleName).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 私有函数

%% 判断最新订单是否没有改变(主要判断出售者和上架时间)
-spec isNewestOrderNotChanged(OrderID::uint(), NewestOrder::false | #?TradeQueryResult{}) -> boolean().
isNewestOrderNotChanged(OrderID, NewestOrder) ->
    case NewestOrder of
        false ->
            false;
        #?TradeQueryResult{roleID = RoleID, putTime = PutTime} ->
            %% 获取自己身上的订单
            case getOrderByItemUID(OrderID) of
                false ->
                    false;
                #?TradeQueryResult{roleID = RoleID2, putTime = PutTime2} ->
                    if
                        RoleID =:= RoleID2 andalso PutTime =:= PutTime2 ->
                            %% 一致
                            true;
                        true ->
                            false
                    end
            end
    end.

%% 获取UID获取自己身上的查询结果
-spec getOrderByItemUID(OrderID::uint()) -> #?TradeQueryResult{} | false.
getOrderByItemUID(OrderID) ->
    AllNumber = playerState:getTradeQueryResultNumber(),
    Array = playerState:getTradeQueryResult(),
    ForList = lists:seq(0, AllNumber - 1),
    Fun = fun(Index) ->
        Rec = array:get(Index, Array),
        case Rec of
            undefined ->
                false;
            #?TradeQueryResult{orderID = OrderID2} ->
                OrderID2 =:= OrderID
        end
    end,

    case lists:filter(Fun, ForList) of
        [] ->
            false;
        [Index] ->
            array:get(Index, Array);
        _ ->
            false
    end.

%% 判断自己的订单数量是否已经满了
-spec canPutTrade(TradeClass::uint(), PlayerID::uint()) -> {boolean(), uint()}.
canPutTrade(TradeClass, PlayerID) ->
	VipLvl = playerState:getVip(),
	%% 获取允许个人能上的订单数量
	{NormalNum, PrivateNum} =
		if
			VipLvl > 0 ->
				{getConfig(?PutTradeNumVip), getConfig(?PutTradeNumPrivateVip)};
			true ->
				{getConfig(?PutTradeNum), getConfig(?PutTradeNumPrivate)}
		end,

	%% 获取总数
	case tradeDataQueryLogic:getTradeOrderNumber({PlayerID}) of
		{NS, NG, NP} ->
			%% 取到已经有的条数了
			case TradeClass of
				?TradeType_Private ->
					%% 指定交易单独判断
					{NP < PrivateNum, ?ErrorCode_TradeSellMax};
				_ ->
					{(NS + NG) < NormalNum, ?ErrorCode_TradeSellMax}
			end;
		_ ->
			{false, ?ErrorCode_TradeError}
	end.

%% 判断能否上架
-spec canPutTrade(TradeClass::uint(), ItemUID::uint(), ItemID::uint(), SellNumber::uint(),
	SellTime::uint(), Silver::uint(), Gold::uint(), DestRoleID::uint()) -> {boolean(), uint()}.
canPutTrade(TradeClass, ItemUID, ItemID, SellNumber, SellTime, Silver, Gold, DestRoleID) ->
    CanSell = canItemSell(ItemUID, ItemID),
    GoldMoney = getConfig(?TradeGoldMoney),
    CanMore = canItemMore(ItemUID, ItemID, SellNumber),
	IsInBlack =
		case uidMgr:checkUID(DestRoleID) of
			true ->
				SelfRoleID = playerState:getRoleID(),
				friend2State:isBlack(DestRoleID, SelfRoleID);
			_ ->
				false
		end,

	TradeSwitch = variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Trade),

    if
		TradeSwitch =:= false ->
			{false, ?ErrorCode_TradeError};
        Silver > 0 andalso Gold > 0 ->
            %% 两种钱都大于0时
            {false, ?ErrorCode_TradeError};
        Silver =< 0 andalso Gold =< 0 ->
            %% 两种钱不能同时=<0
            {false, ?ErrorCode_TradeSellMoneyZero};
        TradeClass =:= ?TradeType_Silver andalso Silver =< 0 ->
            %% 铜币交易行时，铜币为0
            {false, ?ErrorCode_TradeError};
        TradeClass =:= ?TradeType_Gold andalso Gold =< 0 ->
            %%元宝交易行时，元宝为0
            {false, ?ErrorCode_TradeError};
        GoldMoney =:= false ->
            %% 元宝出售时保管费用系数
            {false, ?ErrorCode_TradeError};
        TradeClass =:= ?TradeType_Private andalso DestRoleID =:= 0 ->
            %% 指定玩家不存在
            {false, ?ErrorCode_TradePlayerNotExist};
        CanSell =:= false orelse CanMore =:= false orelse SellNumber =< 0 ->
            {false, ?ErrorCode_TradeNotSell};
		IsInBlack ->
		    {false, ?ErrorCode_TradeError};
        true ->
            Coe = getTradeMoneyTime(SellTime),

            if
                Coe =:= false ->
                    {false, ?ErrorCode_TradeError};
                true ->
                    SelfID = playerState:getRoleID(),

                    %% 獲取出售需要的保管費
                    {_CoinType, Coin} = getPutTradeMoney(TradeClass, SellTime, Silver, Gold),
                    %Money = playerState:getCoin(CoinType),
                    CanDecMoney = playerMoney:canUseCoin(?CoinUseTypeGold, Coin),

                    %% 保管费扣的是绑定金币，绑定金币不足扣非绑定金币

                    if
                        TradeClass =:= ?TradeType_Private andalso SelfID =:= DestRoleID ->
                            %% 不能卖给自己
                            {false, ?ErrorCode_TradeNotPutSelf};
                        CanDecMoney =:= false ->
                            {false, ?ErrorCode_TradeGold};
                        %CoinType =:= ?CoinTypeDiamond andalso Coin > Money ->
                        %    {false, ?ErrorCode_TradeGold};
                        true ->
                            {true, 0}
                    end
            end
    end.

%% 获取出售时间对应的保管费系数
-spec getTradeMoneyTime(SellTime::uint()) -> float() | uint() | false.
getTradeMoneyTime(SellTime) ->
	Tax =
		case SellTime of
			?TradeTime12 ->
				getConfig(?TradeMoney12);
			?TradeTime24 ->
				getConfig(?TradeMoney24);
			?TradeTime48 ->
				getConfig(?TradeMoney48);
			_ ->
				false
		end,
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_PlayerTradeTax) of
		true ->
			Tax;
		_ ->
			0
	end.

%% 获取道具的绑定状态
-spec getItemIsBind(ItemUID::uint(), ItemID::uint()) -> boolean().
getItemIsBind(ItemUID, ItemID) ->
    case queryItem(ItemUID, ItemID) of
        #recSaveEquip{isBind = false,isLocked = false} ->
            false;
        #rec_item{isBind = false,isLocked = false} ->
            false;
        #recRune{isBind = 0} ->
            false;
        _ ->
            %% 绑定
            true
    end.

%% 获取道具的品质
-spec getItemQuality(ItemUID::uint(), ItemID::uint()) -> uint().
getItemQuality(ItemUID, ItemID) ->
    case queryItem(ItemUID, ItemID) of
        #recSaveEquip{quality = Quality} ->
            Quality;
        #rec_item{} ->
            %% 普通道具的品质根据固定配置获取
            case getCfg:getCfgPStack(cfg_item, ItemID) of
                #itemCfg{quality = Qu} ->
                    Qu;
                _ ->
                    0
            end;
        #recRune{runeID = RuneID} ->
            case playerRune:getRuneConf(RuneID) of
                #runeCfg{quality = Quality} ->
                    Quality;
                _ ->
                    0
            end;
        _ ->
            0
    end.

%% 获取背包格子数
-spec getBagNumber(ItemID::uint()) -> uint().
getBagNumber(ItemID) ->
    case goods:getItemClass(ItemID) of
        ?Item_Equip ->
            playerPackage:getBagIdleSlotNum(?Item_Location_Equip_Bag);
	    ?Item_Item ->
            playerPackage:getBagIdleSlotNum(?Item_Location_Bag);
		?Item_Gem ->
            playerPackage:getBagIdleSlotNum(?Item_Location_Gem_Bag);
        ?Item_Rune ->
            {Cur, Max} = playerRune:getRuneGridNumber(ItemID),
            Max - Cur
    end.

%% 物品是否能出售
-spec canItemSell(ItemUID::uint(), ItemID::uint()) -> boolean().
canItemSell(ItemUID, ItemID) ->
    IsBind = getItemIsBind(ItemUID, ItemID),

    IsBind =:= false
        andalso goods:itemIsLife(ItemID) =:= false
        andalso goods:itemCanSell(ItemID) =:= true.

-spec canItemMore(ItemUID::uint(), ItemID::uint(), Number::uint()) -> boolean().
canItemMore(ItemUID, ItemID, Number) ->
    case queryItem(ItemUID, ItemID) of
        #recSaveEquip{} ->
            true;
        #rec_item{pileNum = Num} ->
            Num >= Number;
        #recRune{} ->
            true;
        _ ->
            false
    end.

-spec queryItem(ItemUID::uint(), ItemID::uint()) -> #recSaveEquip{} | #rec_item{} | false.
queryItem(ItemUID, ItemID) ->
    case goods:getItemClass(ItemID) of
        ?Item_Equip ->
            playerPackage:getGoodsByUID(ItemUID,?Item_Location_Equip_Bag);
        ?Item_Item ->
            playerPackage:getGoodsByUID(ItemUID,?Item_Location_Bag);
		?Item_Gem ->
            playerPackage:getGoodsByUID(ItemUID,?Item_Location_Gem_Bag);
        ?Item_Rune ->
            playerRune:getSelfRuneObject(ItemUID)
    end.

%% 根据上架时间和类型，获取上架需要的费用，保管费都是铜币
-spec getPutTradeMoney(_TradeClass::uint(), SellTime::uint(), Silver::uint(), Gold::uint()) -> {uint(), uint()}.
getPutTradeMoney(_TradeClass, SellTime, Silver, Gold) ->
    %% 保管费系数
    Coe = getTradeMoneyTime(SellTime),

    %% 元宝交易额外系数
    GoldCoe = if
                  Gold > 0 ->
                      getConfig(?TradeGoldMoney);
                  Silver > 0 ->
                      1;
                  true ->
                      1
              end,

    Money = (Silver + Gold * GoldCoe) * Coe,

    %% 保管费扣的绑定金币
    {?CoinTypeGold, myTrunc(Money)}.

%% 取整，有小数就加1
-spec myTrunc(Money::uint()) -> uint().
myTrunc(Money) ->
    Money2 = trunc(Money),
    Money3 = case Money - Money2 > 0 of
                 true ->
                     Money2 + 1;
                 false ->
                     Money2
             end,
    Money3.

%% 购买物品
-spec buyTrade(#?TradeQueryResult{}, uint(), uint(), uint()) -> ok.
buyTrade(#?TradeQueryResult{} = R, TradeClass, OrderID, PlayerID) ->
    %% 去cs删除订单
	{Ret, Code} =
		case opTradeOrder({TradeClass, OrderID, PlayerID, PlayerID}) of
			true ->
				%% 删除成功，先扣钱
				Silver = R#?TradeQueryResult.silver,
				Gold = R#?TradeQueryResult.gold,

				#?TradeQueryResult{roleID = OwnerID, itemUID = ItemUID, itemID = ItemID,pileNumber = Number} = R,

				case decMoney(TradeClass, Silver, Gold, ?CoinUseTradeBuy, OrderID) of
					true ->
						%% 拥有者改为邮件
						case ItemID < ?Item_RuneIDStart of
							true ->
								Plog = #recPLogTSItem{
									old = Number,
									new = Number,
									change = 0,
									target = ?PLogTS_Mail,
									source = ?PLogTS_Trade,
									gold = 0,
									goldtype = 0,
									changReason = ?ItemDeleteReasonTrade,
									reasonParam = OrderID
								},
								playerPackage:changeGoodsOwner(ItemUID, ItemID, ?Trade_Role_ID, ?Mail_Role_ID, Plog);
							_ ->
								playerRune:changeRuneOwner(ItemUID, ItemID, ?Trade_Role_ID, ?Mail_Role_ID)
						end,

						AttachMent = #recMailItem{itemUID = ItemUID, itemID = ItemID},
						MailID = mail:sendSystemMail(PlayerID, stringCfg:getString(tradeMail_Title),
							stringCfg:getString(tradeMail_BuyItem), [AttachMent], erlang:integer_to_list(OrderID)),

						%% 通知自己，该操作成功
						noticeClientOpResult(TradeClass, OrderID, 1, playerState:getTradeOpCode()),

						dbLog:sendSaveLogTradeOp(#rec_log_trade_op{
							tradeID = OrderID,				%%订单ID bigint(8) unsigned
							downReson = ?LTOR_Success,				%%0过期，1下架，2退回，3交易成功 tinyint(1) unsigned
							roleID = PlayerID,				%%操作者ID bigint(8) unsigned
							param = MailID				%%邮件ID bigint(8) unsigned
						}),

						if
							Silver > 0 ->
								%% 交易行金币交易成就统计
								playerAchieve:achieveEvent(?Achieve_GoldTrade, [1]),
								%% 需要提示扣除多少钱
								TaxCoe = getConfig(?TradeTax),
								Tax = myTrunc(TaxCoe * Silver),
								Attach = #recMailCoin{coinType = ?CoinTypeGold, coinNum = Silver - Tax},
								Text1 = stringCfg:getString(tradeMail_SellItem,[Silver, Tax]),
								mail:sendSystemMail(OwnerID, stringCfg:getString(tradeMail_Title),
									Text1, [Attach], erlang:integer_to_list(OrderID)),
								{true, 0};
							Gold > 0 ->
								%% 交易行钻石交易成就统计
								playerAchieve:achieveEvent(?Achieve_DiamondTrade, [1]),
								%% 需要提示扣除多少钱，元宝交易不扣税
								Attach = #recMailCoin{coinType = ?CoinTypeDiamond, coinNum = Gold},
								Text2 = stringCfg:getString(tradeMail_SellItem, [Gold, 0]),
								mail:sendSystemMail(OwnerID, stringCfg:getString(tradeMail_Title),
									Text2, [Attach], erlang:integer_to_list(OrderID)),
								{true, 0};
							true ->
								{false, ?ErrorCode_TradeError}
						end;
					false ->
						?ERROR_OUT("[~p] ~p decMoney falied:~p", [?MODULE, PlayerID, R]),

						{false, ?ErrorCode_TradeError}
				end;
			_Other ->
				%% 删除失败
				{false, ?ErrorCode_TradeDown}
		end,

	%?LOG_OUT("aa:~p,~p,~p",[R,Ret,Code]),
	case Ret of
		false ->
            playerMsg:sendTipsErrorCodeMsg(Code);
        true ->
            %% 购买成功
            playerMsg:sendTipsErrorCodeMsg(?ErrorCode_TradeSuccess),

            %% 从自己身上的查询结果删除该订单
            decQueryTrade(OrderID)
            %% 重新发送当前页给客户端
            %NowPage = playerState:getTradeNowPage(),
            %nextResult(NowPage)
    end,
    ok.

%% 扣钱
-spec decMoney(TradeClass::uint(), Silver::uint(), Gold::uint(), Reason::uint(), OrderID::uint()) -> boolean().
decMoney(TradeClass, Silver, Gold, Reason, OrderID) ->
    case TradeClass of
        ?TradeType_Silver ->
            playerMoney:decCoin(?CoinTypeGold, Silver, #recPLogTSMoney{reason=Reason,param=OrderID,target=?PLogTS_Trade,source=?PLogTS_PlayerSelf});
        ?TradeType_Gold ->
            playerMoney:decCoin(?CoinTypeDiamond, Gold, #recPLogTSMoney{reason=Reason,param=OrderID,target=?PLogTS_Trade,source=?PLogTS_PlayerSelf});
        ?TradeType_Private ->
            if
                Silver > 0 ->
                    playerMoney:decCoin(?CoinTypeGold, Silver, #recPLogTSMoney{reason=Reason,param=OrderID,target=?PLogTS_Trade,source=?PLogTS_PlayerSelf});
                Gold > 0 ->
                    playerMoney:decCoin(?CoinTypeDiamond, Gold, #recPLogTSMoney{reason=Reason,param=OrderID,target=?PLogTS_Trade,source=?PLogTS_PlayerSelf});
                true ->
                    false
            end
    end.

%% 扣除道具
-spec decItem(PlayerID::uint(), OwnerID::uint(), ItemUID::uint(), ItemID::uint(), Number::uint(), OrderID::uint()) -> uint() | boolean().
decItem(PlayerID, OwnerID, ItemUID, ItemID, Number, OrderID) ->
    Plog = #recPLogTSItem{
        old = Number,
        new = Number,
        change = 0,
        target = ?PLogTS_Trade,
        source = ?PLogTS_PlayerSelf,
        gold = 0,
        goldtype = 0,
        changReason = ?ItemDeleteReasonTrade,
        reasonParam = OrderID
    },
    case queryItem(ItemUID, ItemID) of
        #recRune{} ->
            playerRune:changeRuneOwner(ItemUID, ItemID, PlayerID, OwnerID);
        #recSaveEquip{} ->
            playerPackage:changeGoodsOwner(ItemUID, ItemID, PlayerID, OwnerID, Plog);
        #rec_item{pileNum = Num} = Goods ->
            case Num =:= Number of
                true ->
                    %% 直接删除并改变拥有者
                    playerPackage:changeGoodsOwner(ItemUID, ItemID, PlayerID, OwnerID, Plog);
                false ->
                    %% 拆分道具
                    PlogSplit = #recPLogTSItem{
                        old = Num,
                        new = Num - Number,
                        change = Number,
                        target = ?PLogTS_PlayerSelf,
                        source = ?PLogTS_PlayerSelf,
                        gold = 0,
                        goldtype = 0,
                        changReason = ?ItemSourceSplit,
                        reasonParam = OrderID
                    },
                    Item = playerPackage:splitItem(ItemUID, Number, false, PlogSplit),
                    case Item of
                        #rec_item{pileNum = PNum} ->
                            Plog1 = #recPLogTSItem{
                                old = PNum,
                                new = PNum,
                                change = 0,
                                target = ?PLogTS_Trade,
                                source = ?PLogTS_PlayerSelf,
                                gold = 0,
                                goldtype = 0,
                                changReason = ?ItemDeleteReasonTrade,
                                reasonParam = OrderID
                            },
	                        %%由于拆分出来后的道具是在内存中，不在玩家的背包中，所以这里需要让此道具的原所有者为系统
                            case playerPackage:changeGoodsOwner(Item#rec_item.itemUID, Item#rec_item.itemID, PlayerID, OwnerID, false, Plog1) of
								true ->
									Item#rec_item.itemUID;
								_ ->
									false
                            end;
                        _ ->
                            ?ERROR_OUT("~p decItem failed ~p, ~p", [?MODULE, PlayerID, Goods]),
                            false
                    end
            end;
        _ ->
            false
    end.

%% 是否可以购买道具
-spec canTrade(#?TradeQueryResult{}) -> {boolean(), uint()}.
canTrade(#?TradeQueryResult{sellType = SellType} = R) ->
    %% 判断背包格子是否足够，这里不需要判断背包格子数
    case getBagNumber(R#?TradeQueryResult.itemID) >= 0 of
        true ->
            %% 判断金钱是否足够，注意，这里用的都是非绑定噢
            case SellType of
                ?TradeType_Silver ->
                    %% 判断金币是否足够
                    {playerState:getCoin(?CoinTypeGold) >= R#?TradeQueryResult.silver, ?ErrorCode_TradeGold};
                ?TradeType_Gold ->
                    {playerState:getCoin(?CoinTypeDiamond) >= R#?TradeQueryResult.gold, ?ErrorCode_TradeDiamond};
                ?TradeType_Private ->
                    if
                        R#?TradeQueryResult.silver > 0 ->
                            {playerState:getCoin(?CoinTypeGold) >= R#?TradeQueryResult.silver, ?ErrorCode_TradeGold};
                        R#?TradeQueryResult.gold > 0 ->
                            {playerState:getCoin(?CoinTypeDiamond) >= R#?TradeQueryResult.gold, ?ErrorCode_TradeDiamond};
                        true ->
                            {true, 0}
                    end
            end;
        _ ->
            {false, ?ErrorCode_BuyItemErrorNoEmptyBag}
    end.

%% 通过订单ID获取最新的订单，返回false为失败
getTradeOrder(Msg) ->
	tradeDataQueryLogic:getTradeOrder(Msg).

%% 尝试操作(锁定)订单
opTradeOrder(Msg) ->
    psMgr:call(?TradeOpPIDName, opTradeOrder, Msg, ?Start_Link_TimeOut_ms).

%% 排序结果
-spec sortResult(SortIndex::uint(), SortType::uint()) -> boolean().
sortResult(SortIndex, SortType) ->
    Array = playerState:getTradeQueryResult(),

    %% 得到所有有效数据
    DataList = getResultList([], 0),

    %% 得到总数
    AllNumber = playerState:getTradeQueryResultNumber(),

    %% 取第一条与第二条数据，判断排序方向，得到排序函数
    case getSortFunction(SortIndex, SortType, array:get(0, Array), array:get(AllNumber - 1, Array)) of
        false ->
            false;
        Fun ->
            %% 排序
            NewDataList = lists:sort(Fun, DataList),

            %% 重写数据
            FunWrite = fun(#?TradeQueryResult{} = ResultRec, {Arr, Index}) ->
                {array:set(Index, ResultRec, Arr), Index + 1}
            end,

            %% 插入数组
            {NewArray, NewCount} = lists:foldl(FunWrite, {Array, 0}, NewDataList),

            %% 设置结果
            playerState:setTradeQueryResult(NewArray),
            playerState:setTradeQueryResultNumber(NewCount),

            true
    end.

%% 得到排序的FUN
-spec getSortFunction(uint(), uint(),#?TradeQueryResult{},#?TradeQueryResult{}) -> fun() | false.
getSortFunction(SortIndex, SortType,#?TradeQueryResult{sellType = SE1} = _R1,#?TradeQueryResult{sellType = _SE2} = _R2) ->
    case SortIndex of
        ?TradeSort_Qualith ->
            %% 对品质排序
            getSortFun(?TradeSort_Qualith, SortType);
        ?TradeSort_Level ->
            %% 对装备等级排序
            getSortFun(?TradeSort_Level, SortType);
        ?TradeSort_Time ->
            %% 对剩余时间排序
            getSortFun(?TradeSort_Time, SortType);
        ?TradeSort_Role ->
            %% 对出售人排序
            getSortFun(?TradeSort_Role, SortType);
        ?TradeSort_Price ->
            %% 对出售的钱排序，这里需要区分订单类型
            getSortFun(?TradeSort_Price, SortType, SE1);
        _ ->
            false
    end.

%% 得到所有有效数据
-spec getResultList(List::list(), Index::uint()) -> list().
getResultList(List, Index) ->
    Array = playerState:getTradeQueryResult(),

    %% 得到总数
    AllNumber = playerState:getTradeQueryResultNumber(),

    %% 递归
    if
        Index < AllNumber ->
            R = array:get(Index, Array),
            NR = [R | List],
            getResultList(NR, Index + 1);
        true ->
            List
    end.

%% 发送查询结果给客户端
-spec sendResultToClient() -> ok.
sendResultToClient() ->
    %% 得到当前页
    Page = playerState:getTradeNowPage(),

    %% 得到每页个数
    Number = playerState:getTradeOnePageNumber(),

	Data = getPageNumberData([], (Page - 1) * Number, 0),

	Rec = #pk_GS2U_QueryTrade{
		opCode = playerState:getTradeOpCode(),
		sortIndex = playerState:getTradeSortCol(),
		sortType = playerState:getTradeSortType(),
		pageNumber = Page,
		nowTime = time:getSyncTime1970FromDBS(),
		queryTradeList = Data
	},

    %% 发送结果
    playerMsg:sendNetMsg(Rec),

    %?LOG_OUT("sendResultToClient:~p", [Rec]),

    ok.

%% 告诉客户端操作结果
-spec noticeClientOpResult(TradeClass::uint(), OrderID::uint(), Result::uint(), OpCode::uint()) -> ok.
noticeClientOpResult(TradeClass, OrderID, Result, OpCode) ->
    Rec = #pk_GS2U_OpTradeResult{tradeClass = TradeClass, orderID = OrderID, result = Result, opCode = OpCode},

    %% 发送结果
    playerMsg:sendNetMsg(Rec),

    ok.

%% 打印数组
-spec printTradeArray(StartIndex::uint(), EndIndex::uint()) -> ok.
printTradeArray(StartIndex, EndIndex) ->
    Array = playerState:getTradeQueryResult(),
    AllNumber = playerState:getTradeQueryResultNumber(),

    NewEndIndex = if
                      EndIndex >= 0 andalso EndIndex < AllNumber ->
                          EndIndex;
                      true ->
                          AllNumber - 1
                  end,

    if
        StartIndex >= 0 andalso StartIndex =< NewEndIndex ->
            %% 可以打印
            ?LOG_OUT("printTradeArray: AllNumber:~p, [~p,~p]", [AllNumber,StartIndex,NewEndIndex]),
            Fun = fun(Index) ->
                if
                    Index >= StartIndex andalso Index =< NewEndIndex ->
                        ?LOG_OUT("printTradeArray:[~p],~p", [Index, array:get(Index, Array)]);
                    true ->
                        skip
                end
            end,
            LF = lists:seq(StartIndex, NewEndIndex),
            lists:foreach(Fun, LF),
            ?LOG_OUT("printTradeArray:end"),
            true;
        true ->
            false
    end,
    ok.

%% 在自己的列表中删除该订单
-spec decQueryTrade(OrderID::uint()) -> ok.
decQueryTrade(OrderID) ->
    %% 得到总数
    AllNumber = playerState:getTradeQueryResultNumber(),

    %% 设置标志
    put(decQueryTradePrivateFlag, 0),

    Fun = fun(Index) ->
        Array = playerState:getTradeQueryResult(),
        Record = array:get(Index, Array),

        case Record of
            #?TradeQueryResult{orderID = OrderID2} ->
                %% 获取标志
                Flag = get(decQueryTradePrivateFlag),

                case Flag of
                    0 ->
                        %% 还没找到
                        case OrderID =:= OrderID2 of
                            true ->
                                %% 找到了，把该项置空，并设置找到标志
                                put(decQueryTradePrivateFlag, 1),
                                Array2 = array:reset(Index, Array),
                                playerState:setTradeQueryResult(Array2),
                                playerState:setTradeQueryResultNumber(AllNumber - 1);
                            false ->
                                skip
                        end;
                    _ ->
                        %% 已经找到，往前移动一位，本位置空
                        Array2 = array:reset(Index, Array),
                        Array3 = array:set(Index - 1, Record, Array2),
                        playerState:setTradeQueryResult(Array3)
                end;
            _ ->
                skip
        end
    end,
    L = lists:seq(0, AllNumber - 1),
    lists:foreach(Fun, L),
    ok.

%% 得到第几页的数据
-spec getPageNumberData(Data::list(), Index::uint(), Count::uint()) -> list().
getPageNumberData(Data, Index, Count) ->
    Array = playerState:getTradeQueryResult(),

    %% 得到每页个数
    Number = playerState:getTradeOnePageNumber(),

    %% 得到总数
    AllNumber = playerState:getTradeQueryResultNumber(),

    if
        Index < AllNumber andalso Count < Number ->
            Record = array:get(Index, Array),
            case Record of
                #?TradeQueryResult{} ->
                    NewRecord = #pk_QueryTradeList{
                        orderID = Record#?TradeQueryResult.orderID,
                        itemUID = Record#?TradeQueryResult.itemUID,
                        itemID = Record#?TradeQueryResult.itemID,
                        roleName = onPlayerUID2Name(Record#?TradeQueryResult.roleID),   %%%%%%%%转换 rolename
                        sellType = Record#?TradeQueryResult.sellType,
                        putTime = Record#?TradeQueryResult.putTime,
                        downTime = Record#?TradeQueryResult.downTime,
                        silver = Record#?TradeQueryResult.silver,
                        gold = Record#?TradeQueryResult.gold,
                        destRoleName = onPlayerUID2Name(Record#?TradeQueryResult.destRoleID),   %%%%%%%%转换 rolename
                        quality = Record#?TradeQueryResult.quality,
                        pileCount = Record#?TradeQueryResult.pileNumber,
                        itemLevel = Record#?TradeQueryResult.itemLevel
                    },
                    getPageNumberData([NewRecord | Data], Index + 1, Count + 1);
                _ ->
                    Data
            end;
        true ->
            Data
    end.

%% 获取查询条件组合
getQueryCondition(Flags, Judge, Value) ->
    case Judge of
        true ->
            [{Flags, Value}];
        false ->
            []
    end.

%% 清理相关数据
-spec clearQueryData() -> ok.
clearQueryData() ->
    %% 设置为第1页
    playerState:setTradeNowPage(1),

    %% 清空条件
    playerState:setTradeQueryCondition({}),

    %% 清空查询数据
    clearArray(0),

    %% 清空查询结果总个数
    playerState:setTradeQueryResultNumber(0),

    %% 其它清空
    playerState:setTradeClass(0),
    playerState:setTradeItemClass(0),
    playerState:setTradeItemType([]),
    playerState:setTradeItemSubType(-1),
    playerState:setTradeOnePageNumber(0), % 每页多少个
	%% 设置排序列
	playerState:setTradeSortCol(0),
	%% 设置排序方式
	playerState:setTradeSortType(0),

    ok.

%% 清空数组
-spec clearArray(Index::uint()) -> ok.
clearArray(Index) ->
    Array = playerState:getTradeQueryResult(),
    Size = array:size(Array),
    if
        Index < Size ->
            %% 设置新数组
            NewArray = array:reset(Index, Array),
            playerState:setTradeQueryResult(NewArray),

            %% 回归调用
            clearArray(Index + 1);
        true ->
            ok
    end,
	ok.

%% 判断查询基本条件是否满足
-spec canQuery(TradeClass::uint(), ItemClass::uint()) -> boolean().
canQuery(TradeClass, ItemClass) ->
    if
        TradeClass >= ?TradeType_Silver
            andalso TradeClass =< ?TradeType_Private
            andalso (ItemClass =:= ?Item_Equip orelse ItemClass =:= ?Item_Item orelse ItemClass =:= ?Item_Rune) ->
            true;
        true ->
            false
    end.

%% 获取排序函数
-spec getSortFun(uint(), uint()) -> fun().
getSortFun(?TradeSort_Qualith, SortType) ->
	fun(#?TradeQueryResult{quality = RQU} = _R, #?TradeQueryResult{quality = LQU} = _L) ->
		?Sort(SortType, RQU, LQU)
	end;
getSortFun(?TradeSort_Level, SortType) ->
	fun(#?TradeQueryResult{itemLevel = RIT} = _R, #?TradeQueryResult{itemLevel = LIT} = _L) ->
		?Sort(SortType, RIT, LIT)
	end;
getSortFun(?TradeSort_Time, SortType) ->
	fun(#?TradeQueryResult{downTime = RDO} = _R, #?TradeQueryResult{downTime = LDO} = _L) ->
		?Sort(SortType, LDO, RDO)
	end;
getSortFun(?TradeSort_Role, SortType) ->
	fun(#?TradeQueryResult{roleID = RRO} = _R, #?TradeQueryResult{roleID = LRO} = _L) ->
		?Sort(SortType, RRO, LRO)
	end.

getSortFun(?TradeSort_Price, SortType, SE1) ->
    case SE1 of
        ?TradeType_Silver ->
	        fun(#?TradeQueryResult{silver = RSI} = _R, #?TradeQueryResult{silver = LSI} = _L) ->
		        ?Sort(SortType, RSI, LSI)
	        end;
        ?TradeType_Gold ->
	        fun(#?TradeQueryResult{gold = RGO} = _R, #?TradeQueryResult{gold = LGO} = _L) ->
		        ?Sort(SortType, RGO, LGO)
	        end;
        ?TradeType_Private ->
	        fun(#?TradeQueryResult{destRoleID = RDE} = _R, #?TradeQueryResult{destRoleID = LDE} = _L) ->
		        ?Sort(SortType, RDE, LDE)
	        end;
        _ ->
            false
    end.

%% 獲取配置
getConfig(Flags) ->
    case getCfg:getCfgPStack(cfg_globalsetup, Flags) of
        #globalsetupCfg{setpara = LValue} when erlang:is_list(LValue) andalso LValue =/= [] ->
            [Value] = LValue,
	        Value;
        _ ->
            ?ERROR_OUT("[~p] No Config: [~p]", [?MODULE, Flags]),
            false
    end.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 查询交易行列表
queryTradeResultList(Results) ->
	%% 列表
	Num = queryTradeResult(Results),

	%% 个数
	queryTradeResultNumber(Num),

	%% 发送一页给客户端
	sendResultToClient(),
	ok.