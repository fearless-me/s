%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 16. 六月 2015 11:04
%%%-------------------------------------------------------------------

-module(web2lsMsgActAddExchange).
-author("ZhongYuanWei").

-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").

%% API
-export([
	doMsg/2,
	msgAck/4,
	test/0
]).

test() ->
	Data = {obj,
		[{"server_id",1},
			{"name",
				<<233,129,147,229,133,183,229,133,145,
				230,141,162>>},
			{"desc",
				<<233,129,147,229,133,183,229,133,145,
				230,141,162>>},
			{"content",
				<<233,129,147,229,133,183,229,133,145,
				230,141,162,233,129,147,229,133,183,
				229,133,145,230,141,162>>},
			{"order",1},
			{"time_begin",1434628052},
			{"time_end",1435664855},
			{"exchange_type",1},
			{"exchange_target",1001},
			{"exchange_num",1001},
			{"limit_count",3},
			{"require",
				[
					{obj,
						[
							{"item_type",1},
							{"item_id",1001},
							{"item_num",5},
							{"item_bind",0}
						]
					},
					{obj,
						[
							{"item_type",1},
							{"item_id",1002},
							{"item_num",5},
							{"item_bind",0}
						]
					},
					{obj,
						[
							{"item_type",1},
							{"item_id",1003},
							{"item_num",5},
							{"item_bind",0}
						]
					},
					{obj,
						[
							{"item_type",1},
							{"item_id",1004},
							{"item_num",5},
							{"item_bind",0}
						]
					},
					{obj,
						[
							{"item_type",1},
							{"item_id",1005},
							{"item_num",5},
							{"item_bind",0}
						]
					},
					{obj,
						[
							{"item_type",1},
							{"item_id",1006},
							{"item_num",5},
							{"item_bind",0}
						]
					},
					{obj,
						[
							{"item_type",1},
							{"item_id",1007},
							{"item_num",5},
							{"item_bind",0}
						]
					},
					{obj,
						[
							{"item_type",1},
							{"item_id",1008},
							{"item_num",5},
							{"item_bind",0}
						]
					}
				]
			},

			{"operator",<<"admin">>},
			{"reason",
				<<233,129,147,229,133,183,229,133,145,
				230,141,162,233,129,147,229,133,183,
				229,133,145,230,141,162>>}]},

	doMsg(1435323362,Data),
	ok.
	

-spec doMsg(CmdSerial, Data) -> boolean() when
	CmdSerial::integer(), Data::tuple().
doMsg(CmdSerial, Data) ->
	?DEBUG_OUT("web2lsMsgActAddExchange:~p ~p",[CmdSerial,Data]),
	case parseArgs(Data) of
		{OpUser,#rec_operate_exchange{} = Exchange } ->
			web2lsMsgCommonLogic:web2lsMsgActExchange({CmdSerial, self(), add, Exchange }),

			put({gmCmdLog,CmdSerial},
				#recWeb2LsCommandLog{
					opCode = ?Web2lsMsgAddExchange,
					opUser = OpUser,
					opSerial = CmdSerial,
					arg1 = 0
				}),
			
			web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial},
				#cmdAckInfo{m=?MODULE, gsNum = 1, beginTime = time:getUTCNowSec() }),
			true;
		_ ->
			false
	end.

-spec msgAck(CmdSerial,S,GSNum,OldGSResults) -> JsonStr when
	CmdSerial::integer(),S::port(),GSNum::integer(),OldGSResults::list(),JsonStr::string().
msgAck(CmdSerial,S,GSNum,OldGSResults) ->
	?LOG_OUT("web2lsMsgActAddExchangeAck json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
	erlang:erase({gmMsg,CmdSerial}),
	DealCode = web2lsNetDispatcher:msgDeal(GSNum, OldGSResults),

	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	return2Web(CmdSerial,DealCode).

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec return2Web( CmdSerial, DealCode ) -> JsonStr when
	CmdSerial::integer(), DealCode::integer(),JsonStr::string().
return2Web( CmdSerial, DealCode ) ->
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),

	SendData = {obj,[
		{"command",?Web2lsMsgAddExchangeAck},
		{"serial",CmdSerial},
		{"code",DealCode}
	]},
	rfc4627:encode(SendData).

isValidGoodsID(GoodsID) ->
	if
		GoodsID > ?Item_Differentiate ->
			%% 装备道具
			getCfg:getCfgByArgs(cfg_equipment, GoodsID) =/= [];
		GoodsID > 0 andalso GoodsID =< ?Item_Differentiate ->
			%% 普通道具
			getCfg:getCfgPStack(cfg_item, GoodsID) =/= [];
		true ->
			false
	end.

parseArgs(Data) ->
	try
		{ok,OpUser} = rfc4627:get_field(Data,"operator"),
		{ok,ExchangeType} = rfc4627:get_field(Data,"exchange_type"),
		{ok,ExchangeArg} = rfc4627:get_field(Data,"exchange_target"),
		{ok,ExchangeNum} = rfc4627:get_field(Data,"exchange_num"),
		{ok,StartTime} = rfc4627:get_field(Data,"time_begin"),
		{ok,EndTime} = rfc4627:get_field(Data,"time_end"),
		{ok,BinName} = rfc4627:get_field(Data,"name"),
		{ok,BinTitle} = rfc4627:get_field(Data,"desc"),
		{ok,BinContent} = rfc4627:get_field(Data,"content"),

		{ok,RequireJsonList} = rfc4627:get_field(Data,"require"),
		{ok,MaxCountPerRole} = rfc4627:get_field(Data,"limit_count"),

		%%require的道具最多只能有8种
		Fun = fun(Req,{N,AccIn}) ->
			case N > 8 of
				true ->
					{break,{N,AccIn}};
				_ ->
					{ok,ItemID} = rfc4627:get_field(Req,"item_id"),
					{ok,ItemNum} = rfc4627:get_field(Req,"item_num"),
					case erlang:is_integer(ItemID) and erlang:is_integer(ItemNum) of
						true ->
							case isValidGoodsID(ItemID) of
								true ->
									{N + 1,[{ItemID,ItemNum} | AccIn]};
								_ ->
									?ERROR_OUT("require ItemID:~p of Exchange Activity not found in cfg",[ItemID,ItemNum])
							end;
						_ ->
							?ERROR_OUT("require Error ItemID:~p ItemNum:~p of Exchange Activity",[ItemID,ItemNum]),
							{N,AccIn}
					end
			end
		end,
		{_,Require} = misc:mapAccList(RequireJsonList,{1,[]},Fun),
		case Require of
			[] ->
				%%如果没兑换的东西，则本条记录无效
				?ERROR_OUT("Exchange Activity not valid require"),
				throw("Error Require");
			_ ->
				skip
		end,

		Name = erlang:binary_to_list(BinName),
		Title = erlang:binary_to_list(BinTitle),
		Content = erlang:binary_to_list(BinContent),
		
		Ret1 = checkExchangeType(ExchangeType),
		Ret2 = checkExchangeNum(Ret1,ExchangeNum),
		Ret3 = checkExchangeCount(Ret2,MaxCountPerRole),
		Ret4 = checkStartAndEndTime(Ret3,StartTime,EndTime),
		Ret5 = checkExchangeArg(Ret4,ExchangeType,ExchangeArg),
		Ret6 = checkString(Ret5,Name,260),      %%6个汉字
		Ret7 = checkString(Ret6,Title,260),       %%20个汉字
		Ret = checkString(Ret7,Content,1300),    %%100个汉字

		case Ret of
			true ->
				{
					OpUser,
					#rec_operate_exchange{
						id = -1,
						exchangeType = ExchangeType,
						exchangeNum = ExchangeNum,
						exchangeTarget = ExchangeArg,
						require = Require,
						limitCount = MaxCountPerRole,
						startTime = StartTime,
						endTime = EndTime,
						name = Name,
						title = Title,
						content = Content
					}
				};
			_ ->
				false
		end
	catch
		_:_ ->
			false
	end.

checkExchangeType(ExchangeType) when erlang:is_integer(ExchangeType) andalso ExchangeType > ?OperateActExchangeType_Start andalso ExchangeType < ?OperateActExchangeType_End ->
	true;
checkExchangeType(_) ->
	false.

checkExchangeNum(true,Num) when erlang:is_integer(Num) andalso Num > 0 andalso Num < 65536 ->
	true;
checkExchangeNum(_,_) ->
	false.

checkExchangeCount(true,Count) when erlang:is_integer(Count) ->
	true;
checkExchangeCount(_,_) ->
	false.

checkExchangeArg(true,ExchangeType,ExchangeArg) when erlang:is_integer(ExchangeArg) ->
	if
		ExchangeType =:= ?OperateActExchangeType_Item ->
			%%如果是道具，则道具的ID不能超限
			ExchangeArg > 0 andalso ExchangeArg < 65536;
		ExchangeType =:= ?OperateActExchangeType_Coin ->
			%%如果是货币则需要检测货币的类型
			if
				ExchangeArg >= ?CoinTypeMin andalso ExchangeArg =< ?CoinTypeMax andalso ExchangeArg =/= ?CoinTypeDiamond ->
					%%不能兑换钻石
					true;
				true ->
					false
			end;
		ExchangeType =:= ?OperateActExchangeType_Custom ->
			true;
		true ->
			false
	end;
checkExchangeArg(_,_,_) ->
	false.

checkStartAndEndTime(true,StartTime,EndTime) when erlang:is_integer(StartTime),erlang:is_integer(EndTime), StartTime < EndTime ->
	true;
checkStartAndEndTime(_,_,_) ->
	false.

checkString(true,String,MaxLen) when erlang:is_list(String) ->
	Len = erlang:length(String),
	Len > 0 andalso Len =< MaxLen;
checkString(_,_,_) ->
	false.



