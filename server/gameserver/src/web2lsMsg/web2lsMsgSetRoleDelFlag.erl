%% @author zhengzhichun
%% @doc @todo Add description to web2lsMsgSetRoleDelFlag.


-module(web2lsMsgSetRoleDelFlag).

-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,dbAck/4]).

-spec doMsg( CmdSerial, Data ) ->term() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?DEBUG_OUT("web2lsMsgSetRoleDelFlag:~p",[Data]),
	
	case parseArgs(Data) of
		{OpUser,Oprate,PlayerIDListStr} ->
			lsSendMsg:sendMsg2DBServer(setRoleDelFlag, {CmdSerial,Oprate,PlayerIDListStr}),
			
			Msg = {CmdSerial,self(),
				  Oprate,PlayerIDListStr
				  },
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsGMSetRoleDelFlag,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1  = Oprate,
														  arg2 = PlayerIDListStr
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
	?LOG_OUT("web2lsMsgSetRoleDelFlag CmdSerial:~p  dbAck-Data:~p",[CmdSerial,Ok]),

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
					 {"command",?Web2lsGMSetRoleDelFlagAck},
					 {"serial",CmdSerial},
					 {"code",DealCode}
					]},
	rfc4627:encode(SendData).

-spec parseArgs(Data) -> tuple() | false when
		  Data::tuple().
parseArgs(Data) ->
	try
		{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
		{ok,PlayerIDListStr} = rfc4627:get_field(Data,"player_id_list"),
		{ok,Oprate} = rfc4627:get_field(Data,"delete"),
		{OpUser,Oprate,PlayerIDListStr}
	catch
		_:_ ->
			false
	end.