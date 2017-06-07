%% @author zhengzhichun
%% @doc @todo Add description to web2lsMsgReturnItem.


-module(web2lsMsgReturnItem).

-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,dbAck/4]).

-spec doMsg( CmdSerial, Data ) ->term() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?DEBUG_OUT("web2lsMsgReturnItem:~p",[Data]),
	
	case parseArgs(Data) of
		{OpUser,RoleID,GoodUID} ->
			lsSendMsg:sendMsg2DBServer(returnItem, {CmdSerial,GoodUID,RoleID}),
			
			Msg = {CmdSerial,self(),
				   GoodUID,
				   RoleID
				  },
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsGMKReturnItem,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1  = RoleID,
														  arg2 = GoodUID
														 }),
			
			put({dbRet,CmdSerial},false),
			put({waitDbAck,CmdSerial},
				#cmdAckInfo{m=?MODULE,tmpArgs=Msg}
			   ),
			
			true;
		_ ->
			false
	end.

%% 处理dbs返回
dbAck(CmdSerial,DealCode,_S,State) ->	
	?LOG_OUT("web2lsMsgReturnItem CmdSerial:~p  dbAck-Data:~p",[CmdSerial,DealCode]),	
	erlang:erase({waitDBAck,CmdSerial}),
	ReturnJsonStr = return2Web(CmdSerial,DealCode),
	web2lsMsg:returnWeb( ReturnJsonStr,State ).

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec return2Web( CmdSerial, DealCode ) -> JsonStr when
		  CmdSerial::integer(), DealCode::integer(),JsonStr::string().
return2Web( CmdSerial, DealCode ) ->

	
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	
	SendData = {obj,[
					 {"command",?Web2lsGMKReturnItemAck},
					 {"serial",CmdSerial},
					 {"code",DealCode}
					]},
	rfc4627:encode(SendData).

-spec parseArgs(Data) -> tuple() | false when
		  Data::tuple().
parseArgs(Data) ->
	try
		{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
		{ok,RoleIDBinStr} = rfc4627:get_field(Data,"role_id"),
		{ok,GoodUIDBinStr} = rfc4627:get_field(Data,"goodUID"),
		RoleID = erlang:binary_to_integer(RoleIDBinStr),
		GoodUID = erlang:binary_to_integer(GoodUIDBinStr),
		{OpUser,RoleID,GoodUID}
	catch
		_:_ ->
			false
	end.