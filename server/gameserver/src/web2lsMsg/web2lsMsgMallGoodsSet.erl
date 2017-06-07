%% @author xujian
%% @doc @todo Add description to web2lsMsgMallGoodsSet.


-module(web2lsMsgMallGoodsSet).
-include("lsInc.hrl").
-include("mall.hrl").
-include("web2lsMsgPrivate.hrl").
-include("config.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/3,dbAck/4]).

-spec doMsg( Type, CmdSerial, Data ) ->term() when
		  Type::uint(), CmdSerial::integer(), Data::tuple().
 
%%商城物品设置
doMsg( ?Web2lsGMSetCSMallNewGoods, CmdSerial, Data ) ->
	?DEBUG_OUT("Web2lsGMSetCSMallNewGoods:~p",[Data]),
	case parseArgsSet(Data) of
		{OpUser,MallInfo,Reason} ->
			Msg = {CmdSerial,self(),
				   MallInfo, 
				   Reason},
			lsSendMsg:sendMsg2DBServer(saveMallGoods, {CmdSerial, MallInfo}),%%给dbls改变新数据

			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsGMSetCSMallNewGoods,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1  = misc:term_to_string(MallInfo),
														  arg2  = Reason
														 }),
			
			put({dbRet,CmdSerial},false),
			put({waitDbAck,CmdSerial},
				#cmdAckInfo{m=?MODULE,tmpArgs=Msg}
			   ),
			
			true;
		_ ->
			?LOG_OUT("platfrom set mall failed"),
			false
	end;

%%gm设置商城删除道具
doMsg( ?Web2lsGMSetCSMallDelete, CmdSerial, Data ) ->
	?DEBUG_OUT("web2lsMsgDenyDeviceSet:~p",[Data]),
	case parseArgsDel(Data) of
		{OpUser,DbID, Reason} ->%商品信息
			Msg = {CmdSerial,self(),
				   DbID, 
				   Reason},

			lsSendMsg:sendMsg2DBServer(delMallGoods, {CmdSerial, DbID}),%%发给dbls删除商品

			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsGMSetCSMallDelete,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1  = DbID,
														  arg2  = Reason
														 }),
			
			put({dbRet,CmdSerial},false),
			put({waitDbAck,CmdSerial},
				#cmdAckInfo{m=?MODULE,tmpArgs=Msg}
			   ),
			
			true;
		_ ->
			false
	end.

%% 处理dbs返回 再通知cs需要更新
dbAck(CmdSerial,Ret,_S,State) ->	
	erlang:erase({waitDBAck,CmdSerial}),
	DealCode = 
		if
			Ret =:= {set,ok} orelse Ret=:={del,ok} ->
				?Web2lsAckSucc;
			true ->
				?Web2lsAckFail
		end,
	ReturnJsonStr = return2Web(Ret,CmdSerial,DealCode),
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	web2lsMsg:returnWeb( ReturnJsonStr,State ).
	
%% ====================================================================
%% Internal functions
%% ====================================================================
-spec return2Web( Ret, CmdSerial, DealCode ) -> JsonStr when
		  Ret::tuple(),CmdSerial::integer(), DealCode::integer(),JsonStr::string().
return2Web(Ret, CmdSerial, DealCode ) ->
	case Ret of
		{set,ok}->
			SendData = {obj,[
							 {"command",?Web2lsGMSetCSMallNewGoodsAck},
							 {"serial",CmdSerial},
							 {"code",DealCode}
							]};
		_->
			SendData = {obj,[
							 {"command",?Web2lsGMSetCSMallDeleteAck},
							 {"serial",CmdSerial},
							 {"code",DealCode}
							]}
	end,
	rfc4627:encode(SendData).

-spec parseArgsSet(Data) -> tuple() | false when
		  Data::tuple().
parseArgsSet(Data) ->
	try
		{ok,DbID} = rfc4627:get_field(Data,"area"),
		
		{ok,Price_list} = rfc4627:get_field(Data,"price_list"),
		{ok, [JsonObj1], _} = rfc4627:decode(Price_list),
		
		{ok,Order} = rfc4627:get_field(Data,"order"),
		{ok,Integral} = rfc4627:get_field(Data,"integral"),
		{ok,LimitBuy} = rfc4627:get_field(Data,"limit_num"),
		{ok,LimitDay} = rfc4627:get_field(Data,"limit_day"),
		{ok,LimitType} = rfc4627:get_field(Data,"limit_type"),
		{ok,LimitStart} = rfc4627:get_field(Data,"limit_start"),
		{ok,LimitEnd} = rfc4627:get_field(Data,"limit_end"),
		{ok,LimitLevel} = rfc4627:get_field(Data,"limit_level"),
		{ok,LimitRecharge} = rfc4627:get_field(Data,"limit_recharge"),
		{ok,BeginTime} = rfc4627:get_field(Data,"time_start"),
		{ok,EndTime} = rfc4627:get_field(Data,"time_end"),
		{ok,Rebate} = rfc4627:get_field(Data,"rebate"),
		{ok,RebateStart} = rfc4627:get_field(Data,"rebate_start"),
		{ok,RebateEnd} = rfc4627:get_field(Data,"rebate_end"),
		
		{ok,Giveaway} = rfc4627:get_field(Data,"giveaway"),
		{ok, [JsonObj2], _} = rfc4627:decode(Giveaway),
		
		{ok,Give_limit_player} = rfc4627:get_field(Data,"give_limit_player"),
		{ok,Give_start} = rfc4627:get_field(Data,"give_start"),
		{ok,Give_end} = rfc4627:get_field(Data,"give_end"),
		{ok,OpUser} = rfc4627:get_field(Data,"operator"),
		{ok,Reason} = rfc4627:get_field(Data,"reason"),
		
		BuyDefaultNum = rfc4627:get_field(Data,"item_num",1),
	
		ItemID = DbID div 100,
		Type1 = (DbID rem 100) div 10,
		Type2 = DbID rem 10,
		
		{ok,Diamond} = rfc4627:get_field(JsonObj1,"money_type1"),		
		{ok,BindDiamond} = rfc4627:get_field(JsonObj1,"money_type2"),
		{ok,UseIntegral} = rfc4627:get_field(JsonObj1,"money_type3"),
		
		Item_ID = 
			case rfc4627:get_field(JsonObj2,"item_id") of
				{ok,Item_ID1} ->
					Item_ID1;
				_ ->
					0
			end,
		Item_Num = 
			case rfc4627:get_field(JsonObj2,"item_num") of
				{ok,Item_Num1} ->
					Item_Num1;
				_ ->
					0
			end,
		
		MallInfo= #recSaveMall{
								 dbID = DbID,
								 itemID = ItemID,
								 sort = Order,
								 type = Type1,
								 type1 = Type2,
								 buyDefaultNum = BuyDefaultNum,
								 diamond = Diamond,
								 bindDiamond = BindDiamond,
								 useIntegral = UseIntegral,
								 getIntegral = Integral,
								 limitBuy = LimitBuy,
								 limit_day = LimitDay,
								 limitType = LimitType,
								 limitBeginTime = LimitStart,
								 limitEndTime = LimitEnd,
								 level = LimitLevel,
								 recharge = LimitRecharge,
								 beginTime = BeginTime,
								 endTime = EndTime,
								 rebate = Rebate,
								 rebateBeginTime = RebateStart,
								 rebateEndTime = RebateEnd,
								 buySendItem = Item_ID,
								 buySendNum = Item_Num,
								 buySendLimit = Give_limit_player,
								 buySendBeginTime = Give_start,
								 buySendEndTime = Give_end
						},
		GoodsID = ItemID,
		if
			GoodsID > ?Item_Differentiate ->
				#equipmentCfg{} = getCfg:getCfgByArgs(cfg_equipment,GoodsID);
			GoodsID > 0 andalso GoodsID =< ?Item_Differentiate ->
				#itemCfg{} = getCfg:getCfgByArgs(cfg_item,GoodsID);
			true ->
				?ERROR_OUT("Error GoodsID[~p] in ~p:getGoodsCfg",[GoodsID,?MODULE]),
				throw("Error in getGoodsCfg")
		end,
		{OpUser,MallInfo, Reason}
	catch
		_:ERRContent ->
			Stacktrace = erlang:get_stacktrace(),
			?ERROR_OUT("parseArgsSet err:~w,~p",[ERRContent,Stacktrace]),
			false
	end.

-spec parseArgsDel(Data) -> tuple() | false when
		  Data::tuple().
parseArgsDel(Data) ->
	try
		{ok,OpUser} = rfc4627:get_field(Data,"operator"),
		{ok,Area} = rfc4627:get_field(Data,"area"),
		{ok,Reason} = rfc4627:get_field(Data,"reason"),
		ItemID = Area div 100,
		Type1 = (Area rem 100) div 10,
		Type2 = Area rem 10,
		 DbID = erlang:list_to_integer(erlang:integer_to_list(ItemID) ++ 
										     erlang:integer_to_list(Type1) ++ 
											 erlang:integer_to_list(Type2)),
		{OpUser,DbID, Reason}
	catch
		_:_ ->
			false
	end.
