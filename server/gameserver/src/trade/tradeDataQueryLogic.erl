%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <好玩123>
%%% @doc
%%% 交易行查询模块逻辑
%%% 注意，三个RAM表查询出的结果，都先统一转换成一个表名，是为了方便的处理
%%% @end
%%% Created : 14. 五月 2014 14:59
%%%-------------------------------------------------------------------
-module(tradeDataQueryLogic).
-author("tiancheng").

%% API
-export([
	queryTradeDataEnter/1,
	querySelfTradeDataEnter/1,
	queryNewestTradeDataEnter/1,
	getTradeOrder/1,
	getTradeOrderNumber/1,

	changeTableNameToSilver/1,
	isValidOrder/2,
	getQueryResult/1    % 内部函数导出给其它模块调用
]).

%% for test
%-compile(export_all).

-include("tradeDefine.hrl").

%% 查询最新的交易订单
queryNewestTradeDataEnter({TradeClass, GetNumber}) ->
	Result = case TradeClass of
				 ?TradeType_Gold ->
					 getNewestQueryResult(?MNESIA_Trade_Gold, GetNumber);
				 ?TradeType_Diamond ->
					 getNewestQueryResult(?MNESIA_Trade_Diamond, GetNumber);
				 _ ->
					 []
			 end,

	%?LOG_OUT("aa:~p,~p,~p",[TradeClass,GetNumber,Result]),
	dealQueryResult(Result).

%% 得到最新交易订单查询结果
getNewestQueryResult(TableName, GetNumber) ->
	F = fun() ->
		Q1 = qlc:q([changeTableNameToSilver(Trade) || Trade <- mnesia:table(TableName), isValidOrder(Trade)]),
		SortFun = fun(Trade1, Trade2) ->
			Trade1#?MNESIA_Trade_Gold.putTime > Trade2#?MNESIA_Trade_Gold.putTime
				  end,
		Q2 = qlc:sort(Q1, [{order, SortFun}]),
		Q3 = qlc:cursor(Q2),
		qlc:next_answers(Q3, GetNumber)
		end,
	Ret = mnesia:transaction(F),
	case Ret of
		{atomic, ResultOfFun} ->
			ResultOfFun;
		Other ->
			?ERROR_OUT("getNewestQueryResult error select:[~p]",[Other]),
			[]
	end.

%% 获取订单个数
getTradeOrderNumber({PlayerID}) ->
	%% 查询铜币交易
	Match1 = #?MNESIA_Trade_Gold{roleID = PlayerID, _ = '_'},

	%% 查询元宝交易
	Match2 = #?MNESIA_Trade_Diamond{roleID = PlayerID, _ = '_'},

	%% 查询私有交易
	Match3 = #?MNESIA_Trade_Private{roleID = PlayerID, _ = '_'},

	%% 查询
	Ret1 = edb:dirtyMatchRecord(?MNESIA_Trade_Gold, Match1),
	Ret2 = edb:dirtyMatchRecord(?MNESIA_Trade_Diamond, Match2),
	Ret3 = edb:dirtyMatchRecord(?MNESIA_Trade_Private, Match3),

	%% 返回交易订单的个数
	{length(Ret1), length(Ret2), length(Ret3)}.

%% 获取有效，能交易的订单，注意，这里获取的有效订单都是返回给gs的结果订单，只是部分数据
getTradeOrder({TradeClass, OrderID, SelfID}) ->
	Result = getTradeOrder({TradeClass, OrderID}),

	IsValid = if
				  Result =:= false ->
					  false;
				  TradeClass =:= ?TradeType_Private ->
					  %% 如果是指定交易，要特殊处理
					  isValidOrder(Result#?TradeQueryResult.sellState, Result#?TradeQueryResult.downTime)
						  andalso (Result#?TradeQueryResult.destRoleID =:= SelfID orelse Result#?TradeQueryResult.roleID =:= SelfID);
				  true ->
					  isValidOrder(Result#?TradeQueryResult.sellState, Result#?TradeQueryResult.downTime)
			  end,

	%% 结果
	case IsValid of
		false ->
			%% 失败
			false;
		_ ->
			Result
	end;
%% 获取指定的订单
getTradeOrder({TradeClass, OrderID}) ->
	Result = case TradeClass of
				 ?TradeType_Gold ->
					 %% 查询铜币交易表
					 edb:dirtyReadRecord(?MNESIA_Trade_Gold, OrderID);
				 ?TradeType_Diamond ->
					 %% 查询元宝交易表
					 edb:dirtyReadRecord(?MNESIA_Trade_Diamond, OrderID);
				 ?TradeType_Private ->
					 %% 查询指定交易表
					 edb:dirtyReadRecord(?MNESIA_Trade_Private, OrderID);
				 _ ->
					 false
			 end,

	%?LOG_OUT("EEEEE:~p,~p,~p",[TradeClass,OrderID, Result]),

	%% 结果
	case Result of
		false ->
			?ERROR_OUT("[~p] getTradeOrder:~p, ~p", [TradeClass, OrderID]),
			false;
		[] ->
			%% 没查询到？
			false;
		[Record] ->
			NewReocrd = changeTableNameToSilver(Record),

			%% 转换为结果表
			getQueryResult(NewReocrd)
	end.

%% 查询自己的交易行
querySelfTradeDataEnter({TradeClass, SelfID}) ->
	%% 查询铜币交易
	Sql1 = qlc:q([Trade || Trade <- mnesia:table(?MNESIA_Trade_Gold),
		Trade#?MNESIA_Trade_Gold.roleID =:= SelfID, isValidOrder(Trade)]),
	%% 查询元宝交易
	Sql2 = qlc:q([changeTableNameToSilver(Trade) || Trade <- mnesia:table(?MNESIA_Trade_Diamond),
		Trade#?MNESIA_Trade_Diamond.roleID =:= SelfID, isValidOrder(Trade)]),
	%% 查询私有交易
	Sql3 = qlc:q([changeTableNameToSilver(Trade) || Trade <- mnesia:table(?MNESIA_Trade_Private),
		Trade#?MNESIA_Trade_Private.roleID =:= SelfID, isValidOrder(Trade)]),

	%% 查询
	Ret = case TradeClass of
			  ?TradeType_Gold ->
				  %% 查询铜币交易表
				  edb:selectRecord(Sql1);
			  ?TradeType_Diamond ->
				  %% 查询元宝交易表
				  edb:selectRecord(Sql2);
			  ?TradeType_Private ->
				  %% 查询指定交易表
				  edb:selectRecord(Sql3);
			  _ ->
				  %% 查询所有交易订单
				  Ret1 = edb:selectRecord(Sql1),
				  Ret2 = edb:selectRecord(Sql2),
				  Ret3 = edb:selectRecord(Sql3),
				  Ret1 ++ Ret2 ++ Ret3
		  end,

	%% 发送结果
	dealQueryResult(Ret);
querySelfTradeDataEnter({TradeClass, SelfID, _GetNumber}) ->
	case TradeClass =:= ?TradeType_Private of
		true ->
			%% 查询私有交易
			Sql3 = qlc:q([changeTableNameToSilver(Trade) || Trade <- mnesia:table(?MNESIA_Trade_Private),
				Trade#?MNESIA_Trade_Private.destRoleID =:= SelfID, isValidOrder(Trade)]),

			%% 查询
			Ret = edb:selectRecord(Sql3),

			%% 发送结果
			dealQueryResult(Ret);
		_ ->
			[]
	end.

%% 查询数据
queryTradeDataEnter({QueryCondition, QueryObj}) ->
%%	?WARN_OUT("queryTradeDataEnter: PidFromGS:~p, QueryCondition:~p", [PidFromGS, Query]),
	queryTradeDataFirst(QueryCondition, QueryObj).

%% 查询数据
%% TradeType    指定的交易类型
%% ItemClass    指定的道具大类，1为装备道具equip，2为普通道具item
%% ItemType     指定的道具主类
%% QueryCondition    查询条件，由子条件组成成的tuple
%%              {subtype, Value}    指定的道具子类型
%%              {itemlist, Value}   指定匹配的道具列表，Value = []
%%              {itemlevel, Value}  指定的道具等级
%%              {quality, Value} 指定的品质
%%              {career, Value}   指定的职业
%%              {itemID, Value}   指定的道具ID
%%              {}
%% QueryPlayer  查询的玩家ID
queryTradeDataFirst({TradeType, ItemClassList, QueryCondition}, {QueryPlayer}) ->
	SqlBin = case TradeType of
				 ?TradeType_Gold ->
					 %% 查询铜币交易表
					 qlc:q([Trade
						 || Trade <- mnesia:table(?MNESIA_Trade_Gold),
						 lists:member(Trade#?MNESIA_Trade_Gold.itemClass, ItemClassList), isValidOrder(Trade)]);
				 ?TradeType_Diamond ->
					 %% 查询元宝交易表
					 qlc:q([changeTableNameToSilver(Trade)
						 || Trade <- mnesia:table(?MNESIA_Trade_Diamond),
						 lists:member(Trade#?MNESIA_Trade_Diamond.itemClass, ItemClassList), isValidOrder(Trade)]);
				 ?TradeType_Private ->
					 %% 查询指定交易表
					 qlc:q([changeTableNameToSilver(Trade)
						 || Trade <- mnesia:table(?MNESIA_Trade_Private),
						 lists:member(Trade#?MNESIA_Trade_Private.itemClass, ItemClassList),
						 Trade#?MNESIA_Trade_Private.destRoleID =:= QueryPlayer,isValidOrder(Trade)]);
				 _ ->
					 false
			 end,

	%% 去查询
	if
		SqlBin =:= false ->
			[];
		true ->
			dealQuery(QueryPlayer, QueryCondition, SqlBin)
	end;
queryTradeDataFirst({TradeType, ItemClassList, ItemTypeList, QueryCondition}, {QueryPlayer}) ->
	SqlBin = case TradeType of
				 ?TradeType_Gold ->
					 %% 查询铜币交易表
					 qlc:q([Trade
						 || Trade <- mnesia:table(?MNESIA_Trade_Gold),
						 lists:member(Trade#?MNESIA_Trade_Gold.itemType, ItemTypeList),
						 lists:member(Trade#?MNESIA_Trade_Gold.itemClass, ItemClassList), isValidOrder(Trade)]);
				 ?TradeType_Diamond ->
					 %% 查询元宝交易表
					 qlc:q([changeTableNameToSilver(Trade)
						 || Trade <- mnesia:table(?MNESIA_Trade_Diamond),
						 lists:member(Trade#?MNESIA_Trade_Diamond.itemType, ItemTypeList),
						 lists:member(Trade#?MNESIA_Trade_Diamond.itemClass, ItemClassList), isValidOrder(Trade)]);
				 ?TradeType_Private ->
					 %% 查询指定交易表
					 qlc:q([changeTableNameToSilver(Trade)
						 || Trade <- mnesia:table(?MNESIA_Trade_Private),
						 lists:member(Trade#?MNESIA_Trade_Private.itemType, ItemTypeList),
						 lists:member(Trade#?MNESIA_Trade_Private.itemClass, ItemClassList),
						 Trade#?MNESIA_Trade_Private.destRoleID =:= QueryPlayer, isValidOrder(Trade)]);
				 _ ->
					 false
			 end,

	%% 去查询
	if
		SqlBin =:= false ->
			[];
		true ->
			dealQuery(QueryPlayer, QueryCondition, SqlBin)
	end;
queryTradeDataFirst({TradeType, ItemClassList, ItemTypeList, ItemSubType, QueryCondition}, {QueryPlayer}) ->
	SqlBin = case TradeType of
				 ?TradeType_Gold ->
					 %% 查询铜币交易表
					 qlc:q([Trade
						 || Trade <- mnesia:table(?MNESIA_Trade_Gold),
						 Trade#?MNESIA_Trade_Gold.itemSubType =:= ItemSubType,
						 lists:member(Trade#?MNESIA_Trade_Gold.itemType, ItemTypeList),
						 lists:member(Trade#?MNESIA_Trade_Gold.itemClass, ItemClassList), isValidOrder(Trade)]);
				 ?TradeType_Diamond ->
					 %% 查询元宝交易表
					 qlc:q([changeTableNameToSilver(Trade)
						 || Trade <- mnesia:table(?MNESIA_Trade_Diamond),
						 Trade#?MNESIA_Trade_Diamond.itemSubType =:= ItemSubType,
						 lists:member(Trade#?MNESIA_Trade_Diamond.itemType, ItemTypeList),
						 lists:member(Trade#?MNESIA_Trade_Diamond.itemClass, ItemClassList), isValidOrder(Trade)]);
				 ?TradeType_Private ->
					 %% 查询指定交易表
					 qlc:q([changeTableNameToSilver(Trade)
						 || Trade <- mnesia:table(?MNESIA_Trade_Private),
						 Trade#?MNESIA_Trade_Private.itemSubType =:= ItemSubType,
						 lists:member(Trade#?MNESIA_Trade_Private.itemType, ItemTypeList),
						 lists:member(Trade#?MNESIA_Trade_Private.itemClass, ItemClassList),
						 Trade#?MNESIA_Trade_Private.destRoleID =:= QueryPlayer, isValidOrder(Trade)]);
				 _ ->
					 false
			 end,

	%% 去查询
	if
		SqlBin =:= false ->
			[];
		true ->
			dealQuery(QueryPlayer, QueryCondition, SqlBin)
	end.

%% 职业过滤
queryTradeData(TradeResult, [{career, Value}|QueryCondition]) ->
	case Value of
		-1 ->
			%% 不限制职业
			queryTradeData(TradeResult, QueryCondition);
		_ ->
			%% 限制职业
			Fun =
				fun(#?MNESIA_Trade_Gold{itemProfession = Career} = _Trade) ->
					Career =:= Value
				end,
			NewResult = lists:filter(Fun, TradeResult),
			queryTradeData(NewResult, QueryCondition)
	end;
%% 子类型过滤
queryTradeData(TradeResult, [{subtype, Value}|QueryCondition]) ->
	case Value of
		-1 ->
			%% 不限制子类型
			queryTradeData(TradeResult, QueryCondition);
		_ ->
			%% 限制子类型
			Fun =
				fun(#?MNESIA_Trade_Gold{itemSubType = SubType} = _Trade) ->
					SubType =:= Value
				end,
			NewResult = lists:filter(Fun, TradeResult),
			queryTradeData(NewResult, QueryCondition)
	end;
%% 指定物品过滤
queryTradeData(TradeResult, [{itemlist, Value}|QueryCondition]) ->
	case Value of
		[] ->
			%% 没有指定物品
			queryTradeData(TradeResult, QueryCondition);
		_ ->
			%% 有指定物品匹配
			Fun =
				fun(#?MNESIA_Trade_Gold{itemID = ItemID} = _Trade) ->
					ItemName =
						if
							ItemID >= ?Item_RuneIDStart ->
								case getCfg:getCfgByArgs(cfg_rune,ItemID) of
									#runeCfg{name = Name3} -> Name3;
									_ -> []
								end;
							ItemID >= ?Item_Differentiate ->
								case getCfg:getCfgByArgs(cfg_equipment,ItemID) of
									#equipmentCfg{name = Name1} -> Name1;
									_ -> []
								end;
							true ->
								case getCfg:getCfgByArgs(cfg_item,ItemID) of
									#itemCfg{name = Name2} -> Name2;
									_ -> []
								end
						end,
					case ItemName of
						[] -> false;
						_ -> length([X || X <- Value, X =:= ItemName]) > 0
					end
				end,
			NewResult = lists:filter(Fun, TradeResult),
			queryTradeData(NewResult, QueryCondition)
	end;
%% 物品等级过滤
queryTradeData(TradeResult, [{itemlevel, Value}|QueryCondition]) ->
	case Value of
		[_, 0] ->
			%% 不过滤等级
			queryTradeData(TradeResult, QueryCondition);
		[Lvl1, Lvl2] ->
			%% 过滤等级
			%% 大小交换
			Min = erlang:min(Lvl1, Lvl2),
			Max = erlang:max(Lvl1, Lvl2),

			Fun =
				fun(#?MNESIA_Trade_Gold{itemLevel = Level} = _Trade) ->
					Level >= Min andalso Level =< Max
				end,
			NewResult = lists:filter(Fun, TradeResult),
			queryTradeData(NewResult, QueryCondition)
	end;
%% 品质过滤
queryTradeData(TradeResult, [{quality, Value}|QueryCondition]) ->
	case Value of
		-1 ->
			%% 不过滤过滤
			queryTradeData(TradeResult, QueryCondition);
		_ ->
			%% 过滤职业
			Fun =
				fun(#?MNESIA_Trade_Gold{quality = Quality} = _Trade) ->
					Quality =:= Value
				end,
			NewResult = lists:filter(Fun, TradeResult),
			queryTradeData(NewResult, QueryCondition)
	end;
%% ItemID过滤
queryTradeData(TradeResult, [{itemID, Value}|QueryCondition]) ->
	case Value of
		-1 ->
			%% 不过滤过滤
			queryTradeData(TradeResult, QueryCondition);
		_ ->
			%% 过滤职业
			Fun =
				fun(#?MNESIA_Trade_Gold{itemID = ItemID} = _Trade) ->
					ItemID =:= Value
				end,
			NewResult = lists:filter(Fun, TradeResult),
			queryTradeData(NewResult, QueryCondition)
	end;
%% 返回结果
queryTradeData(TradeResult, []) ->
	TradeResult.

%% 为方便处理，改变表名为统一的MNESIA_Trade_Silver
changeTableNameToSilver(Trade) ->
	List = misc:record_to_list(Trade),
	misc:list_to_record(List, ?MNESIA_Trade_Gold).

dealQuery(_QueryPlayer, QueryCondition, SqlBin) ->
	%?DEBUG_OUT("QueryCondition = ~p", [QueryCondition]),
	DealResult = case SqlBin of
					 false ->
						 false;
					 _ ->
						 %% 查询并得到查询结果
						 QueryResult = edb:selectRecord(SqlBin),

						 %?DEBUG_OUT("Result = ~p", [QueryResult]),

						 %% 继续处理查询结果
						 queryTradeData(QueryResult, QueryCondition)
				 end,

	if
		DealResult =:= false ->
			%% 查询失败
			[];
		true ->
			%% 查询成功，返回结果
			%?DEBUG_OUT("Count = ~p, Result = ~p", [length(DealResult), DealResult]),

			%% 只返回需要的结果，且需要控制节点中传送的量
			dealQueryResult(DealResult)
	end.

%% 处理查询结果
dealQueryResult(TradeResult) ->
	[getQueryResult(Trade) || #?MNESIA_Trade_Gold{} = Trade <- TradeResult].

%% 得到查询结果表
getQueryResult(#?MNESIA_Trade_Gold{} = Trade) ->
	#?TradeQueryResult{
		orderID     = Trade#?MNESIA_Trade_Gold.orderID,
		itemUID     = Trade#?MNESIA_Trade_Gold.itemUID,
		roleID      = Trade#?MNESIA_Trade_Gold.roleID,
		sellType    = Trade#?MNESIA_Trade_Gold.sellType,
		sellState   = Trade#?MNESIA_Trade_Gold.sellState,
		putTime     = Trade#?MNESIA_Trade_Gold.putTime,
		downTime    = Trade#?MNESIA_Trade_Gold.downTime,
		silver      = Trade#?MNESIA_Trade_Gold.silver,
		gold        = Trade#?MNESIA_Trade_Gold.gold,
		destRoleID  = Trade#?MNESIA_Trade_Gold.destRoleID,
		itemID      = Trade#?MNESIA_Trade_Gold.itemID,
		quality     = Trade#?MNESIA_Trade_Gold.quality,
		pileNumber  = Trade#?MNESIA_Trade_Gold.pileNumber,
		itemLevel   = Trade#?MNESIA_Trade_Gold.itemLevel
	}.

%% 判断是否是有效订单，即还可以交易的订单
isValidOrder(#?MNESIA_Trade_Gold{sellState = SellState, downTime = DownTime} = _Trade) ->
	isValidOrder(SellState, DownTime);
isValidOrder(#?MNESIA_Trade_Diamond{sellState = SellState, downTime = DownTime} = _Trade) ->
	isValidOrder(SellState, DownTime);
isValidOrder(#?MNESIA_Trade_Private{sellState = SellState, downTime = DownTime} = _Trade) ->
	isValidOrder(SellState, DownTime).
isValidOrder(SellState, DownTime) ->
	%% 获取当前时间
	NowTime = time:getSyncTime1970FromDBS(),

	if
	%% 如果有普通状态，且下架时间大于当前时间，则为有效订单
		SellState =:= ?TradeST_Normal andalso DownTime > NowTime ->
			%% 有效
			true;
		true ->
			false
	end.

