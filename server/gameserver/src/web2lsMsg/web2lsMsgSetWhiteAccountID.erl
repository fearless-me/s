%% @author zhengzhichun
%% @doc @todo Add description to web2lsMsgSetWhiteAccountID.


-module(web2lsMsgSetWhiteAccountID).

-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,dbAck/4]).

-spec doMsg( CmdSerial, Data ) ->term() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?DEBUG_OUT("web2lsMsgSetWhiteAccountID:~p",[Data]),
	
	case parseArgs(Data) of
		{_,Oprate,_} when Oprate < 0 orelse Oprate >1 ->
			false;
		{OpUser,Oprate,AcountID} ->
			
			case Oprate of
				1 ->
					ets:insert(?ETSWhiteAccount, #whiteAccount{accountID=AcountID});
				0 ->
					ets:delete(?ETSWhiteAccount, AcountID)
			end,
			lsSendMsg:sendMsg2DBServer(setWhiteAccountID, {CmdSerial,Oprate,AcountID}),
			
			Msg = {CmdSerial,self(),
				  Oprate,AcountID
				  },
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsGMSetWhiteAccountID,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1  = Oprate,
														  arg2 = AcountID
														 }),
			put({dbRet,CmdSerial},false),
			put({waitDbAck,CmdSerial},
				#cmdAckInfo{m=?MODULE,tmpArgs=Msg}
			   ),
			
			true;
		_ ->
			false
	end.

%% 处理 异步收到的结果
%% -spec msgAck(CmdSerial,S,GSNum,OldGSResults) -> JsonStr when
%% 		  CmdSerial::integer(),S::port(),GSNum::integer(),OldGSResults::list(),JsonStr::string().
%% msgAck(CmdSerial,S,GSNum,OldGSResults) ->
%% 	?LOG_OUT("web2lsMsgDelNoticeAck json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
%% 	erlang:erase({gmMsg,CmdSerial}),
%% 	
%% 	DealCode = web2lsNetDispatcher:msgDeal(GSNum, OldGSResults),
%% 	return2Web(CmdSerial,DealCode).

%% 处理dbs返回
dbAck(CmdSerial,Ok,_S,State) ->	
	?LOG_OUT("web2lsMsgSetWhiteAccountID CmdSerial:~p  dbAck-Data:~p",[CmdSerial,Ok]),

	erlang:erase({waitDBAck,CmdSerial}),
	ReturnJsonStr = return2Web(CmdSerial,?Web2lsAckSucc),
	web2lsMsg:returnWeb( ReturnJsonStr,State ).

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec return2Web( CmdSerial, DealCode ) -> JsonStr when
		  CmdSerial::integer(), DealCode::integer(),JsonStr::string().
return2Web( CmdSerial, DealCode ) ->

	
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	
	SendData = {obj,[
					 {"command",?Web2lsGMSetWhiteAccountIDAck},
					 {"serial",CmdSerial},
					 {"code",DealCode}
					]},
	rfc4627:encode(SendData).

-spec parseArgs(Data) -> tuple() | false when
		  Data::tuple().
parseArgs(Data) ->
	try
		{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
		{ok,AcountID} = rfc4627:get_field(Data,"account_id"),
		{ok,Oprate} = rfc4627:get_field(Data,"deny"),
		{OpUser,Oprate,AcountID}
	catch
		_:_ ->
			false
	end.