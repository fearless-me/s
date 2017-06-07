%% @author zhengzhichun
%% @doc @todo Add description to web2lsMsgDenyDeviceSet.

%%已废弃 不再支持
-module(web2lsMsgDenyDeviceSet).

-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,dbAck/4]).

-spec doMsg( CmdSerial, Data ) ->boolean() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?DEBUG_OUT("web2lsMsgDenyDeviceSet:~p",[Data]),
	case parseArgs(Data) of
		{OpUser,DeviceID,OpType} ->
			Msg = {CmdSerial,self(),
				   DeviceID, 
				   OpType},

			lsSendMsg:sendMsg2DBServer(denyDeviceSet, {CmdSerial,DeviceID,OpType}),%%给dbs操作mysql
			

			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsGMDenyDevice,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1  = DeviceID,
														  arg2 = OpType
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
dbAck(CmdSerial,Ok,_S,State) ->	
	?LOG_OUT("web2lsMsgDenyDeviceSet CmdSerial:~p  dbAck-Data:~p",[CmdSerial,Ok]),
	
	LsMainOtpPid = erlang:whereis(?PsNameLS),
	lsSendMsg:sendMsg2DBServer(getDenyDevice, LsMainOtpPid, {}),
	
	erlang:erase({waitDBAck,CmdSerial}),
	DealCode = 
		if
			Ok =:= true ->
				?Web2lsAckSucc;
			true ->
				?Web2lsAckFail
		end,
	ReturnJsonStr = return2Web(CmdSerial,DealCode),
	web2lsMsg:returnWeb( ReturnJsonStr,State ).

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec return2Web( CmdSerial, DealCode ) -> JsonStr when
		  CmdSerial::integer(), DealCode::int(),JsonStr::string().
return2Web( CmdSerial, DealCode ) ->

	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	
	SendData = {obj,[
					 {"command",?Web2lsGMDenyDeviceAck},
					 {"serial",CmdSerial},
					 {"code",DealCode}
					]},
	rfc4627:encode(SendData).

-spec parseArgs(Data) -> tuple() | false when
		  Data::tuple().
parseArgs(Data) ->
	try
		{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
		{ok,DeviceID} = rfc4627:get_field(Data,"deviceID"),
		{ok,OpType} = rfc4627:get_field(Data,"opType"),
		
		OpTypeVal = 
			case OpType of
				<< "denyDeviceAdd" >> ->
					stAddDenyDevice;
				<< "denyDeviceDel" >> ->
					stDelDenyDevice;
				_ ->
					throw(opTypeErr)
			end,
		
		{OpUser,DeviceID,OpTypeVal}
	catch
		_:_ ->
			false
	end.
