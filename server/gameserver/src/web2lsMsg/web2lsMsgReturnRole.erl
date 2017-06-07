%% @author zhengzhichun
%% @doc @todo Add description to web2lsMsgReturnRole.


-module(web2lsMsgReturnRole).


-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,dbAck/4]).

-spec doMsg( CmdSerial, Data ) ->term() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?DEBUG_OUT("web2lsMsgReturnRole:~p",[Data]),
	
	case parseArgs(Data) of
		{OpUser,RoleID} ->
			lsSendMsg:sendMsg2DBServer(returnRole, {CmdSerial,RoleID}),
			
			Msg = {CmdSerial,self(),
				   RoleID
				  },
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsGMReturnRole,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1  = RoleID
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
	?LOG_OUT("web2lsMsgReturnRole CmdSerial:~p  dbAck-Data:~p",[CmdSerial,DealCode]),	
	erlang:erase({waitDBAck,CmdSerial}),
	DealCodeAck = 
		case DealCode of
			true ->0;
			_ -> -1
		end,
	ReturnJsonStr = return2Web(CmdSerial,DealCodeAck),
	web2lsMsg:returnWeb( ReturnJsonStr,State ).

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec return2Web( CmdSerial, DealCode ) -> JsonStr when
		  CmdSerial::integer(), DealCode::integer(),JsonStr::string().
return2Web( CmdSerial, DealCode ) ->

	
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	
	SendData = {obj,[
					 {"command",?Web2lsGMReturnRoleAck},
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
		RoleID = erlang:binary_to_integer(RoleIDBinStr),
		{OpUser,RoleID}
	catch
		_:_ ->
			false
	end.