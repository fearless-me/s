%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 交易行头文件夹
%%% @end
%%% Created : 07. 五月 2014 17:59
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(Trade_Define_HHHHHH______).
-define(Trade_Define_HHHHHH______, 1).

%% include
-include("gsInc.hrl").
-include("equip.hrl").

%% 节点间发送的最大数组
-define(NODE_Max_Send, 1000).

%% 交易行操作时间内置CD，秒
-define(TradeOpCDTime, 10).

%% 10分钟回收一次内存
-define(Recover_Trade_Tick, 10 * 60 * 1000).

%% 5分钟判断一次是否到期
-define(DownOrder_Tick, 5 * 60 * 1000).

%% 装备道具
-define(Item_Equip, 1).
%% 普通道具
-define(Item_Item, 2).
%% 宝石道具
-define(Item_Gem, 3).
%% 符文道具
-define(Item_Rune, 4).


%% 金币交易
-define(TradeType_Gold, 1).
%% 钻石交易
-define(TradeType_Diamond, 2).
%% 指定交易
-define(TradeType_Private, 3).

%% 排序方式 1品质，2等级，3剩余时间，4出售人，5售价
-define(TradeSort_Qualith, 1).
-define(TradeSort_Level, 2).
-define(TradeSort_Time, 3).
-define(TradeSort_Role, 4).
-define(TradeSort_Price, 5).

%% 待售状态
-define(TradeST_Normal, 0).
%% 已锁定
-define(TradeST_Lock, 1).
%% 已出售
-define(TradeST_SellOut, 2).
%% 已完成交易
-define(TradeST_Finish, 3).

%% log_trade_op reason
-define(LTOR_TimeOut, 0).		% 过期
-define(LTOR_Down, 1).			% 下架
-define(LTOR_Back, 2).			% 退回
-define(LTOR_Success, 3).		% 交易成功

%% 交易费，对出售者扣的税
-define(TradeTax, selltax).
%% 上架个数
-define(PutTradeNum, normal_sellnum).
%% 指定交易人数
-define(PutTradeNumPrivate, order_sellnum).

%% 金币交易行
-define(MNESIA_Trade_Gold, mnesia_trade_gold).

%% 钻石交易行
-define(MNESIA_Trade_Diamond, mnesia_trade_diamond).

%% 指定交易行
-define(MNESIA_Trade_Private, mnesia_trade_private).

-define(TradeQueryResult, queryResult).
%% 返回的查询过滤结果
-record(?TradeQueryResult,
{
	orderID         = 0, % 订单ID
	itemUID         = 0, % 出售者原装备唯一ID
	itemID          = 0, % 道具编号ID
	roleID          = 0, % 出售者角色ID
	sellType        = 0, % 出售类型,1金币交易,2钻石交易,3指定交易
	sellState       = 0, % 出售状态,0待售,1已锁定,2已出售,3已完成交易,4已下架
	putTime         = 0, % 上架时间
	downTime        = 0, % 下架时间
	silver          = 0, % 银币(金币)
	gold            = 0, % 金币(钻石)
	destRoleID      = 0, % 指定卖给谁
	quality         = 0, % 道具品质
	pileNumber      = 0, % 叠加数量
	itemLevel       = 0  % 道具等级
}).

%% 金币交易表
-record(?MNESIA_Trade_Gold,
{
	orderID         = 0, % 订单ID
	itemUID         = 0, % 出售者原装备唯一ID
	roleID          = 0, % 出售者角色ID
	sellType        = 0, % 出售类型,1金币交易,2钻石交易,3指定交易
	putTime         = 0, % 上架时间
	downTime        = 0, % 下架时间
	silver          = 0, % 银币(金币)
	gold            = 0, % 金币(钻石)
	destRoleID      = 0, % 指定卖给谁
	sellState       = 0, % 出售状态,0待售,1已锁定,2已出售,3已完成交易,4已下架
	relateRoleID    = 0, % 改变当前交易状态的人
	itemID          = 0, % 道具编号ID
	quality         = 0, % 道具品质
	pileNumber      = 0, % 叠加数量
	itemClass       = 0, % 道具分类，1为装备道具equip，2为普通道具item
	itemType        = 0, % 道具主类型
	itemSubType     = 0, % 道具子类型
	itemLevel       = 0, % 道具等级
	itemProfession  = 0  % 道具职业
}).


%% 钻石交易表
-record(?MNESIA_Trade_Diamond,
{
	orderID         = 0, % 订单ID
	itemUID         = 0, % 出售者原装备唯一ID
	roleID          = 0, % 出售者角色ID
	sellType        = 0, % 出售类型,1金币交易,2钻石交易,3指定交易
	putTime         = 0, % 上架时间
	downTime        = 0, % 下架时间
	silver          = 0, % 银币(金币)
	gold            = 0, % 金币(钻石)
	destRoleID      = 0, % 指定卖给谁
	sellState       = 0, % 出售状态,0待售,1已锁定,2已出售,3已完成交易,4已下架
	relateRoleID    = 0, % 改变当前交易状态的人
	itemID          = 0, % 道具编号ID
	quality         = 0, % 道具品质
	pileNumber      = 0, % 叠加数量
	itemClass       = 0, % 道具分类，1为装备道具equip，2为普通道具item
	itemType        = 0, % 道具主类型
	itemSubType     = 0, % 道具子类型
	itemLevel       = 0, % 道具等级
	itemProfession  = 0  % 道具职业
}).


%% 指定交易表
-record(?MNESIA_Trade_Private,
{
	orderID         = 0, % 订单ID
	itemUID         = 0, % 出售者原装备唯一ID
	roleID          = 0, % 出售者角色ID
	sellType        = 0, % 出售类型,1金币交易,2钻石交易,3指定交易
	putTime         = 0, % 上架时间
	downTime        = 0, % 下架时间
	silver          = 0, % 银币(金币)
	gold            = 0, % 金币(钻石)
	destRoleID      = 0, % 指定卖给谁
	sellState       = 0, % 出售状态,0待售,1已锁定,2已出售,3已完成交易,4已下架
	relateRoleID    = 0, % 改变当前交易状态的人
	itemID          = 0, % 道具编号ID
	quality         = 0, % 道具品质
	pileNumber      = 0, % 叠加数量
	itemClass       = 0, % 道具分类，1为装备道具equip，2为普通道具item
	itemType        = 0, % 道具主类型
	itemSubType     = 0, % 道具子类型
	itemLevel       = 0, % 道具等级
	itemProfession  = 0  % 道具职业
}).

%% 交易行道具静态属性
-record(tradeItemStaticRec, {
	orderID         = 0, % 订单ID
	itemUID         = 0, % 出售者原装备唯一ID
	itemID          = 0, % 道具编号ID
	itemType        = 0, % 道具主类型
	itemSubType     = 0, % 道具子类型
	itemLevel       = 0, % 道具等级
	itemProfession  = 0  % 道具职业
}).

%% 交易行成交记录
-record(tradeDealRecord, {
	itemID = 0,	%% 道具编号ID
	sellRoleID = 0,	%% 出售者ID
	buyRoleID = 0,	%% 购买者ID
	sellType = 2,	%% 出售类型,1金币交易,2钻石交易,3指定交易
	pileNumber  = 0, % 叠加数量
	buyorsell = 1,	%% 1购买，2出售，在购买成功的时候记录，则该值永远为1
	dealTime = 0,	%% 成交时间s
	gold = 0,	%% 金币
	diamond = 0,	%% 钻石
	tax = 0	%% 税
}).

-endif. % Trade_Define_HHHHHH______