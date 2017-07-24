%% @author zhengzhichun
%% @doc @todo Add description to web2lsMsgSet4GSMange.


-module(web2lsMsgSet4GSMange).


-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,msgAck/4]).

-spec doMsg( CmdSerial, Data ) ->boolean() when
	CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?DEBUG_OUT("Web2lsMsgGetList4GSMange:~p",[Data]),
	case parseArgs(Data) of
		{OpUser,ServerID,_ServerName,Ip,Port,BeginTime,MaxPlayer,GsState} when ServerID >= ?GSIDMin andalso ServerID =< ?GSIDMax->

			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
				opCode = ?Web2lsMsgSet4GSMange,
				opUser = OpUser,
				opSerial = CmdSerial,
				arg1 = ServerID,
				arg2 = Ip,
				arg3 = Port,
				arg4 = MaxPlayer,
				arg5 = GsState
			}),

			web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial},
				#cmdAckInfo{m=?MODULE,gsNum = 1,beginTime=time:getUTCNowSec() }),

			BTime = time:convertTimeStamp2DateTime(BeginTime + time2:getTimezoneSec()),
			?DEBUG_OUT("=====BTime==~p",[BTime]),
			Stat =
				case ets:lookup(?ETSGameServerInfo, ServerID) of
					[] ->
						{obj,[{"add",false},{"extData",null}]};
					[#recGameServer{} | _] ->
						loginQueueOtp:send2me(canLoginNumInit, MaxPlayer),
						{obj,[{"update",true},{"extData",null}]};
					OtherMatch ->
						?ERROR_OUT("case err:~p",[OtherMatch])
				end,
			erlang:send_after(3000, self(), {handleMsgAck, self(),{CmdSerial,Stat} }),
			true;
		_ ->
			false
	end.

%% 处理 异步收到的结果(不用异步)
-spec msgAck(CmdSerial,S,GSNum,OldGSResults) -> JsonStr when
	CmdSerial::integer(),S::port(),GSNum::integer(),OldGSResults::list(),JsonStr::string().
msgAck(CmdSerial,S,GSNum,OldGSResults) ->
	?LOG_OUT("Web2lsMsgGetList4GSMange json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
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
		{"command",?Web2lsMsgSet4GSMangeAck},
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
		{ok,ServerID} = rfc4627:get_field(Data,"serverID"),
		{ok,ServerName} = rfc4627:get_field(Data,"serverName"),
		{ok,Ip} = rfc4627:get_field(Data,"ip"),
		{ok,Port} = rfc4627:get_field(Data,"port"),
		{ok,BeginTime} = rfc4627:get_field(Data,"beginTime"),
		{ok,MaxPlayer} = rfc4627:get_field(Data,"maxPlayer"),
%% 		{ok,OnlineNumber} = rfc4627:get_field(Data,"onlineNumber"),
		{ok,GsState} = rfc4627:get_field(Data,"gsState"),
		{OpUser,ServerID,ServerName,Ip,Port,BeginTime,MaxPlayer,GsState}
	catch
		_:_ ->
			false
	end.