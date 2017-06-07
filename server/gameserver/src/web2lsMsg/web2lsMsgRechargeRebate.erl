%% @author zhengzhichun
%% @doc @todo Add description to web2lsMsgRechargeRebate.


-module(web2lsMsgRechargeRebate).


-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,msgAck/4]).

-spec doMsg( CmdSerial, Data ) ->boolean() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?DEBUG_OUT("web2lsMsgRechargeRebate:~p",[Data]),
	case parseArgs(Data) of
		{OpUser,RebateID,BeginTime,EndTime,Rate,PayMoney,Type} ->
			<< ID:32 >> = << RebateID:24,Type:8 >>,
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsMsgRechargeRebateBindDiamond,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1 = RebateID,
														  arg2 = BeginTime,
														  arg3 = EndTime,
														  arg4 = Rate,
														  arg5 = ID
														 }),
			
			Rec = #recSaveRechargeRebate{
										 id = ID, 
										 type = Type, 
										 rebateId = RebateID, 
										 beginTime = BeginTime, 
										 endTime =EndTime,
										 arg1 = Rate,
										 arg2 = PayMoney
										 },
			Msg = {CmdSerial, self(), Rec},
			web2lsMsgCommonLogic:web2lsRechargeRebate(Msg),
			
			web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial}, 
											  #cmdAckInfo{m=?MODULE,gsNum = 1,beginTime=time:getUTCNowSec() }),
			
			
			true;
		_ ->
			false
	end.

%% 处理 异步收到的结果(不用异步)
-spec msgAck(CmdSerial,S,GSNum,OldGSResults) -> JsonStr when
		  CmdSerial::integer(),S::port(),GSNum::integer(),OldGSResults::list(),JsonStr::string().
msgAck(CmdSerial,S,GSNum,OldGSResults) ->
	?LOG_OUT("web2lsMsgRechargeRebate json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
	erlang:erase({gmMsg,CmdSerial}),
	return2Web(CmdSerial,OldGSResults).

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec return2Web( CmdSerial, DealCode ) -> JsonStr when
		  CmdSerial::integer(), DealCode::list(),JsonStr::string().
return2Web( CmdSerial, OldGSResults ) ->
	{DealCode,AckData} = 
		if 
			OldGSResults =:= [] ->
				{?Web2lsAckTimeout,[]};
			erlang:is_list(OldGSResults) ->
				[Ret] = OldGSResults,
				{?Web2lsAckSucc,Ret};
			true ->
				{?Web2lsAckFail,[]}
		end,
	
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	
	SendData = {obj,[
					 {"command",?Web2lsMsgRechargeRebateBindDiamondAck},
					 {"serial",CmdSerial},
					 {"code",DealCode},
					 {"ackData",AckData}
					]},
	rfc4627:encode(SendData).

-spec parseArgs(Data) -> tuple() | false when
		  Data::tuple().
parseArgs(Data) ->
	try
		{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
		{ok,TypeTmp} = rfc4627:get_field(Data,"type"),
		{ok,RebateID} = rfc4627:get_field(Data,"rebateID"),
		{ok,BeginTime} = rfc4627:get_field(Data,"beginTime"),
		{ok,EndTime} = rfc4627:get_field(Data,"endTime"),
		{ok,Rate} = rfc4627:get_field(Data,"rate"),
		{ok,PayMoney} = rfc4627:get_field(Data,"payMoney"),
		
		Type = 
			case TypeTmp of
				?RechargeRebateBindDiamondFirst ->
					?RechargeRebateBindDiamondFirst;
				?RechargeRebateFirstDouble ->
					?RechargeRebateFirstDouble;
				_ ->
					?RechargeRebateBindDiamondPer
			end,
		{OpUser,RebateID,BeginTime,EndTime,Rate,PayMoney,Type}
	catch
		_:_ ->
			false
	end.