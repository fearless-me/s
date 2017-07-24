%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 数据操作逻辑模块
%%% @end
%%% Created : 08. 五月 2014 17:39
%%%-------------------------------------------------------------------
-module(tradeDataOpLogic).
-author("tiancheng").

%% API
-export([
	setTradeDataInitResult/1,
	getTradeDataInitResult/0,
	tradeInfo/2,
	saveTradeItemStaticInfo/2,
	downTimeOutOrder/0,
	opTradeOrder/1,
	isHaveNoneStaticRow/0,
	onDeleteRole/1
]).

%% for test
%-compile(export_all).

-include("tradeDefine.hrl").

%% 设置RAM数据库表创建结果
setTradeDataInitResult(Value) ->
	put(tradeDataInitResult, Value).

%% 获取RAM数据库表创建结果
getTradeDataInitResult() ->
	get(tradeDataInitResult).

opTradeOrder({OrderID, ItemUID, PlayerID, TradeClass, SellTime, Silver, Gold, DestRoleID,
	ItemID, Quality, ItemType, ItemSubType, ItemLevel, ItemProfession, SellNum}) ->
	%% 添加订单
	Result = queryTradeOrder(TradeClass, OrderID),
	case Result of
		[] ->
			%% 当前时间，连续两次转换，为了一点点方便，无奈
			NowTime = time:getSyncTime1970FromDBS(),
			NowDateTime = {datetime, time:convertSec2DateTime(NowTime)},
			DownTime = NowTime + SellTime * 3600, % 秒
			DownDateTime = {datetime, time:convertSec2DateTime(DownTime)},
			%% 可以添加
			R = #trade{
				orderID         = OrderID,      % 订单ID
				itemUID         = ItemUID,      % 出售者原装备唯一ID
				roleID          = PlayerID,     % 出售者角色ID
				sellType        = TradeClass,   % 出售类型,1铜币交易,2元宝交易,3指定交易
				putTime         = NowDateTime,  % 上架时间
				downTime        = DownDateTime, % 下架时间
				silver          = Silver,       % 银币(铜币)
				gold            = Gold,         % 金币(元宝)
				destRoleID      = DestRoleID,   % 指定卖给谁
				sellState       = ?TradeST_Normal, % 出售状态,0待售,1已锁定,2已出售,3已完成交易,4已下架
				relateRoleID    = 0,            % 改变当前交易状态的人
				itemID          = ItemID,       % 道具编号ID
				quality         = Quality,      % 道具品质
				pileNumber      = SellNum       % 出售个数
			},

			%% 插入数据库
			inittradeInfo(R, ItemType, ItemSubType, ItemLevel, ItemProfession),

			%% 保存mysql
			saveTradeData(queryTradeOrder(TradeClass, OrderID));
		_ ->
			false
	end;
opTradeOrder({TradeClass, OrderID, SelfID, DestRoleID}) ->
	%% %% 锁定订单,先获取有效订单，也可以用于刪除訂單
	Result = queryTradeOrder(TradeClass, OrderID, DestRoleID),
	case Result of
		[] ->
			%% 失败
			false;
		[R] ->
			%% 更新订单为已完成状态 直接更新状态为已完成交易，理论上来说可靠
			NR = tradeDataQueryLogic:changeTableNameToSilver(R),
			NR2 = NR#?MNESIA_Trade_Gold{sellState = ?TradeST_Finish, relateRoleID = SelfID},

			TableName = getTableNameByClass(TradeClass),

			%% 删除表
			deleteRecord(TableName, OrderID),

			%% 更新mysql
			saveTradeData([NR2]),

			true
	end.

%% 下架过期订单，查询过期的订单
-spec downTimeOutOrder() -> ok.
downTimeOutOrder() ->
	%% 当前时间
	NowTime = time:getSyncTime1970FromDBS(),

	%% 当前utc时间大于下架时间，且状态还有普通状态，则订单已经过期了

	%% 查询铜币交易
	Sql1 = qlc:q([Trade || Trade <- mnesia:table(?MNESIA_Trade_Gold),
		Trade#?MNESIA_Trade_Gold.sellState =:= ?TradeST_Normal, NowTime > Trade#?MNESIA_Trade_Gold.downTime]),

	%% 查询元宝交易
	Sql2 = qlc:q([tradeDataQueryLogic:changeTableNameToSilver(Trade) || Trade <- mnesia:table(?MNESIA_Trade_Diamond),
		Trade#?MNESIA_Trade_Diamond.sellState =:= ?TradeST_Normal, NowTime > Trade#?MNESIA_Trade_Diamond.downTime]),

	%% 查询私有交易
	Sql3 = qlc:q([tradeDataQueryLogic:changeTableNameToSilver(Trade) || Trade <- mnesia:table(?MNESIA_Trade_Private),
		Trade#?MNESIA_Trade_Private.sellState =:= ?TradeST_Normal, NowTime > Trade#?MNESIA_Trade_Private.downTime]),

	%% 处理
	dealDownTimeOutOrder(?MNESIA_Trade_Gold, Sql1),
	dealDownTimeOutOrder(?MNESIA_Trade_Diamond, Sql2),
	dealDownTimeOutOrder(?MNESIA_Trade_Private, Sql3),

	ok.

%% 处理过期订单
dealDownTimeOutOrder(TableName, SqlBin) ->
	Results = edb:selectRecord(SqlBin),
	Fun = fun(#?MNESIA_Trade_Gold{orderID = OrderID} = Trade) ->
		%% 更新表
		case deleteRecord(TableName, OrderID) of
			true ->
				?DEBUG_OUT("dealDownTimeOutOrder:~p", [Trade]),

				%% 设置为已完成交易
				NewTrade = Trade#?MNESIA_Trade_Gold{sellState = ?TradeST_Finish},

				%% 保存mysql
				saveTradeData([NewTrade]),

				ItemUID = Trade#?MNESIA_Trade_Gold.itemUID,
				ItemID = Trade#?MNESIA_Trade_Gold.itemID,
				Attach = #recMailItem{itemUID = ItemUID, itemID = ItemID},
%%				IsEquip = ItemID >= ?Item_Differentiate,

				%% 拥有者改为邮件 509 =:= ItemChangeTrade
				gsSendMsg:sendMsg2DBServer(changeGoodsOwner, 0, {?Trade_Role_ID, ItemUID, ?Mail_Role_ID,ItemID}),

				%% 退出物品给玩家
				MailID = mail:sendSystemMail(Trade#?MNESIA_Trade_Gold.roleID,
					stringCfg:getString(tradeMail_Title, []),
					stringCfg:getString(tradeMail_BackYouItem, []), [Attach], erlang:integer_to_list(Trade#?MNESIA_Trade_Gold.orderID)),

				dbLog:sendSaveLogTradeOp(#rec_log_trade_op{
					tradeID = OrderID,				%%订单ID bigint(8) unsigned
					downReson = ?LTOR_TimeOut,				%%0过期，1下架，2退回，3交易成功 tinyint(1) unsigned
					roleID = ?Trade_Role_ID,				%%操作者ID bigint(8) unsigned
					param = MailID				%%邮件ID bigint(8) unsigned
				}),
				ok;
			false ->
				%% 更新失败，记录日志
				?ERROR_OUT("[~p] dealDownTimeOutOrder Failed ~p", [?MODULE, Trade])
		end
		  end,
	lists:foreach(Fun, Results).

%% 删除角色
-spec onDeleteRole(RoleID::uint64()) -> ok.
onDeleteRole(RoleID) ->
	%% 查询该角色有没有在交易
	%% 查询铜币交易
	Sql1 = qlc:q([Trade || Trade <- mnesia:table(?MNESIA_Trade_Gold),
		Trade#?MNESIA_Trade_Gold.sellState /= ?TradeST_Finish, RoleID =:= Trade#?MNESIA_Trade_Gold.roleID]),

	%% 查询元宝交易
	Sql2 = qlc:q([tradeDataQueryLogic:changeTableNameToSilver(Trade) || Trade <- mnesia:table(?MNESIA_Trade_Diamond),
		Trade#?MNESIA_Trade_Diamond.sellState /= ?TradeST_Finish, RoleID =:= Trade#?MNESIA_Trade_Diamond.roleID]),

	%% 查询私有交易
	Sql3 = qlc:q([tradeDataQueryLogic:changeTableNameToSilver(Trade) || Trade <- mnesia:table(?MNESIA_Trade_Private),
		Trade#?MNESIA_Trade_Private.sellState /= ?TradeST_Finish, RoleID =:= Trade#?MNESIA_Trade_Private.roleID]),

	%% 处理
	onDeleteRole(?MNESIA_Trade_Gold, edb:selectRecord(Sql1)),
	onDeleteRole(?MNESIA_Trade_Diamond, edb:selectRecord(Sql2)),
	onDeleteRole(?MNESIA_Trade_Private, edb:selectRecord(Sql3)),
	ok.
onDeleteRole(_, []) ->
	ok;
onDeleteRole(TableName, List) ->
	Fun =
		fun(#?MNESIA_Trade_Gold{orderID = OrderID} = Trade) ->
			%% 更新表
			case deleteRecord(TableName, OrderID) of
				true ->
					?DEBUG_OUT("dealDownTimeOutOrder:~p", [Trade]),

					%% 设置为已完成交易
					NewTrade = Trade#?MNESIA_Trade_Gold{sellState = ?TradeST_Finish, relateRoleID = ?Trade_Role_ID},

					%% 保存mysql
					saveTradeData([NewTrade]);
				false ->
					%% 更新失败，记录日志
					?ERROR_OUT("[~p] onDeleteRole Failed ~p,~p", [?MODULE, TableName, Trade])
			end
		end,
	lists:foreach(Fun, List),
	ok.

%% 得到查询结果
tradeInfo(Type, TradeInfo) ->
	?LOG_OUT("====Recv====> Type = [~p], Count = [~p]", [Type, length(TradeInfo)]),
	case TradeInfo of
		[] ->
			skip;
		_ ->
			[inittradeInfo(TradeItem,0,0,0,0) || TradeItem <- TradeInfo],
			ok
	end,
	ok.

%% 修改表名，规范SQL字段，包括时间
changeTableNameAndField(List) ->
	case List of
		[] ->
			[];
		_ ->
			Fun = fun(Table, Tuples) ->
				%% 转换成List
				ChileList = misc:record_to_list(Table),

				%% 转换成指定表名
				Record = misc:list_to_record(ChileList, ?MNESIA_Trade_Gold),

				Tuple = #trade{
					orderID         = Record#?MNESIA_Trade_Gold.orderID,
					itemUID         = Record#?MNESIA_Trade_Gold.itemUID,
					roleID          = Record#?MNESIA_Trade_Gold.roleID,
					sellType        = Record#?MNESIA_Trade_Gold.sellType,
					putTime         = listToString(time:convertSec2DateTimeStr(Record#?MNESIA_Trade_Gold.putTime)),
					downTime        = listToString(time:convertSec2DateTimeStr(Record#?MNESIA_Trade_Gold.downTime)),
					silver          = Record#?MNESIA_Trade_Gold.silver,
					gold            = Record#?MNESIA_Trade_Gold.gold,
					destRoleID      = Record#?MNESIA_Trade_Gold.destRoleID,
					sellState       = Record#?MNESIA_Trade_Gold.sellState,
					relateRoleID    = Record#?MNESIA_Trade_Gold.relateRoleID,
					itemID          = Record#?MNESIA_Trade_Gold.itemID,
					quality         = Record#?MNESIA_Trade_Gold.quality
				},

				[Tuple | Tuples]
				  end,

			lists:foldl(Fun, [], List)
	end.

%% 初始化铜币、元宝、指定交易三个表
-spec inittradeInfo(#trade{}, uint(), uint(), uint(), uint()) -> ok.
inittradeInfo(#trade{} = TradeInfo, ItemType, ItemSubType, ItemLevel, ItemProfession) ->
	{Quality, PileNumber}=
		if
			TradeInfo#trade.itemID >= ?Item_RuneIDStart ->
				QQ =
					case getCfg:getCfgPStack(cfg_rune, TradeInfo#trade.itemID) of
						#runeCfg{quality = Q} ->
							Q;
						_ ->
							0
					end,
				{QQ, 1};
			TradeInfo#trade.itemID >= ?Item_Differentiate ->
				{TradeInfo#trade.quality, 1};
			true ->
				PNumber =
					case edb:readRecord(rec_item, TradeInfo#trade.itemUID) of
						[#rec_item{pileNum = PN}] -> PN;
						_ -> 0
					end,
				{TradeInfo#trade.quality, PNumber}
		end,

	%% 有数据
	MnesiaRec = #?MNESIA_Trade_Gold{
		orderID         = TradeInfo#trade.orderID,
		itemUID         = TradeInfo#trade.itemUID,
		roleID          = TradeInfo#trade.roleID,
		sellType        = TradeInfo#trade.sellType,
		putTime         = changeDateTimeToSecond(TradeInfo#trade.putTime),
		downTime        = changeDateTimeToSecond(TradeInfo#trade.downTime),
		silver          = TradeInfo#trade.silver,
		gold            = TradeInfo#trade.gold,
		destRoleID      = TradeInfo#trade.destRoleID,
		sellState       = TradeInfo#trade.sellState,
		relateRoleID    = TradeInfo#trade.relateRoleID,
		itemID          = TradeInfo#trade.itemID,
		quality         = Quality,
		pileNumber      = PileNumber,
		itemClass       = goods:getItemClass(TradeInfo#trade.itemID), % 获取道具大类
		itemType        = ItemType,
		itemSubType     = ItemSubType,
		itemLevel       = ItemLevel,
		itemProfession  = ItemProfession
	},

	%% 转换成需要的表名
	List = misc:record_to_list(MnesiaRec),

	MnesiaRecName = getTableNameByClass(TradeInfo#trade.sellType),

	%% 改表名
	Record = misc:list_to_record(List, MnesiaRecName),

	%% 插入数据库
	edb:writeRecord(Record),
	%?LOG_OUT("~p~n", [edb:readRecord(MnesiaRecName, erlang:element(2, Record))]),

	%?LOG_OUT("===> ~p, ~p, ~p", [MnesiaRecName, TradeInfo#trade.itemUID, MnesiaRec]),
	ok.

%% list转换成string
listToString(List) ->
	case List of
		[] ->
			[];
		_ ->
			binary_to_list(list_to_binary(List))
	end.

%% 转换时间为整数sec
changeDateTimeToSecond({datetime, Time}) ->
	time:convertDateTime1970ToSec(Time).

%% 是否有静态数据为空的数据
-spec isHaveNoneStaticRow() -> ok.
isHaveNoneStaticRow() ->
	Sql1 = qlc:q([{Trade#?MNESIA_Trade_Gold.orderID, Trade#?MNESIA_Trade_Gold.itemUID, Trade#?MNESIA_Trade_Gold.itemID} ||
		Trade <- mnesia:table(?MNESIA_Trade_Gold), Trade#?MNESIA_Trade_Gold.itemType =:= 0]),

	%% 查询元宝交易
	Sql2 = qlc:q([{Trade#?MNESIA_Trade_Diamond.orderID, Trade#?MNESIA_Trade_Diamond.itemUID, Trade#?MNESIA_Trade_Diamond.itemID} ||
		Trade <- mnesia:table(?MNESIA_Trade_Diamond), Trade#?MNESIA_Trade_Diamond.itemType =:= 0]),

	%% 查询私有交易
	Sql3 = qlc:q([{Trade#?MNESIA_Trade_Private.orderID, Trade#?MNESIA_Trade_Private.itemUID, Trade#?MNESIA_Trade_Private.itemID} ||
		Trade <- mnesia:table(?MNESIA_Trade_Private), Trade#?MNESIA_Trade_Private.itemType =:= 0]),

	isHaveNoneStaticRow(?TradeType_Gold, Sql1),
	isHaveNoneStaticRow(?TradeType_Diamond, Sql2),
	isHaveNoneStaticRow(?TradeType_Private, Sql3),

	ok.

isHaveNoneStaticRow(TradeClass, SqlBin) ->
	case edb:selectRecord(SqlBin) of
		[] ->
			skip;
		Result ->
			Fun = fun({OrderID, ItemUID, ItemID}) ->
				case tradeLoadStaticInfo:saveTradeItemList(OrderID, ItemUID, ItemID) of
					#tradeItemStaticRec{} = R ->
						saveTradeItemStaticInfo(TradeClass, R);
					_ ->
						skip
				end
				  end,

			lists:foreach(Fun, Result)
	end,
	ok.

%% 来自gs的消息，补充RAM数据库中缺失的道具静态属性
saveTradeItemStaticInfo(TradeClass, #tradeItemStaticRec{orderID = OrderID} = StaticRec) ->
	%?LOG_OUT("~p", [StaticInfo]),
	%% 保存到RAM数据库
	case queryTradeOrder(TradeClass, OrderID) of
		[] ->
			%% 没有找到，打印日志
			?LOG_OUT("[~p] saveTradeItemStaticInfo not found item [~p][~p]", [?MODULE, OrderID, StaticRec#tradeItemStaticRec.itemID]),
			skip;
		[#?MNESIA_Trade_Gold{} = Ret] ->
			%% 找到，更新
			New = Ret#?MNESIA_Trade_Gold{
				itemType = StaticRec#tradeItemStaticRec.itemType,
				itemSubType = StaticRec#tradeItemStaticRec.itemSubType,
				itemLevel = StaticRec#tradeItemStaticRec.itemLevel,
				itemProfession = StaticRec#tradeItemStaticRec.itemProfession
			},
			updateRecord(OrderID, ?MNESIA_Trade_Gold, New);
		[#?MNESIA_Trade_Diamond{} = Ret] ->
			%% 找到
			New = Ret#?MNESIA_Trade_Diamond{
				itemType = StaticRec#tradeItemStaticRec.itemType,
				itemSubType = StaticRec#tradeItemStaticRec.itemSubType,
				itemLevel = StaticRec#tradeItemStaticRec.itemLevel,
				itemProfession = StaticRec#tradeItemStaticRec.itemProfession
			},
			updateRecord(OrderID, ?MNESIA_Trade_Diamond, New);
		[#?MNESIA_Trade_Private{} = Ret] ->
			%% 找到
			New = Ret#?MNESIA_Trade_Private{
				itemType = StaticRec#tradeItemStaticRec.itemType,
				itemSubType = StaticRec#tradeItemStaticRec.itemSubType,
				itemLevel = StaticRec#tradeItemStaticRec.itemLevel,
				itemProfession = StaticRec#tradeItemStaticRec.itemProfession
			},
			updateRecord(OrderID, ?MNESIA_Trade_Private, New)
	end.

queryTradeItem(OrderID, MNESIA_REC) ->
	edb:dirtyReadRecord(MNESIA_REC, OrderID).

%% 查询指定的订单
queryTradeOrder(TradeClass, OrderID) ->
	case TradeClass of
		?TradeType_Gold ->
			%% 查询铜币交易表
			queryTradeItem(OrderID, ?MNESIA_Trade_Gold);
		?TradeType_Diamond ->
			%% 查询元宝交易表
			queryTradeItem(OrderID, ?MNESIA_Trade_Diamond);
		?TradeType_Private ->
			%% 查询指定交易表
			queryTradeItem(OrderID, ?MNESIA_Trade_Private);
		_ ->
			[]
	end.

%% 查询指定的有效订单，返回原结果，这个函数会判断订单是否有效
queryTradeOrder(TradeClass, OrderID, DestRoleID) ->
	R = queryTradeOrder(TradeClass, OrderID),

	case R of
		[] ->
			[];
		[R2] ->
			%% 判断是否有效
			RS = tradeDataQueryLogic:changeTableNameToSilver(R2),
			IsValide = if
						   RS#?MNESIA_Trade_Gold.sellType =:= ?TradeType_Private ->
							   %% 还需要判断是不是指定的人
							   tradeDataQueryLogic:isValidOrder(RS#?MNESIA_Trade_Gold.sellState,
								   RS#?MNESIA_Trade_Gold.downTime)
								   andalso RS#?MNESIA_Trade_Gold.destRoleID =:= DestRoleID;
						   true ->
							   tradeDataQueryLogic:isValidOrder(RS#?MNESIA_Trade_Gold.sellState,
								   RS#?MNESIA_Trade_Gold.downTime)
					   end,

			case IsValide of
				false ->
					[];
				true ->
					%% 返回原订单结果
					R
			end
	end.

%% 更新表数据
updateRecord(OrderID, MNESIA_REC, NewValue) ->
	F = fun() ->
		%% 获取一个写的锁
		mnesia:read(MNESIA_REC, OrderID, write),
		mnesia:write(NewValue)
		end,
	case mnesia:transaction(F) of
		{atomic, ok} ->
			true;
		_ ->
			false
	end.

%% 删除表数据
deleteRecord(MNESIA_REC, OrderID) ->
	edb:deleteRecord(MNESIA_REC, OrderID).

%% 改变数据时就保存数据
saveTradeData(TradeRowData) ->
	case TradeRowData of
		[] ->
			%% 空列表，不保存
			false;
		_ ->
			%% 保存交易数据
			NewList = changeTableNameAndField(TradeRowData),

			F =
				fun(#trade{orderID = OID, sellState = SS} = Trade, {AddAcc, DelAcc}) ->
					case SS =:= ?TradeST_Finish of
						true ->
							{AddAcc, [OID | DelAcc]};
						_ ->
							{[Trade | AddAcc], DelAcc}
					end
				end,
			{NewList2, DeleteList} = lists:foldl(F, {[], []}, NewList),
			%?LOG_OUT("saveTradeData = ~p~n", [NewList]),
			gsSendMsg:sendMsg2DBServer(saveTradeData, 0, {NewList2, DeleteList}),
			true
	end.

%% 根据类型得到表的名字
-spec getTableNameByClass(uint()) -> atom().
getTableNameByClass(TradeClass) ->
	case TradeClass of
		?TradeType_Gold ->
			%% 铜币交易表
			?MNESIA_Trade_Gold;
		?TradeType_Diamond ->
			%% 元宝交易表
			?MNESIA_Trade_Diamond;
		?TradeType_Private ->
			%% 指定交易表
			?MNESIA_Trade_Private
	end.