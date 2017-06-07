%% @author zhengzhichun
%% @doc @todo Add description to web2lsMsgGetList4GSMange.


-module(web2lsMsgGetList4GSMange).



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
		{OpUser} ->
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
				opCode = ?Web2lsMsgGetList4GSMange,
				opUser = OpUser,
				opSerial = CmdSerial
			}),

			web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial},
				#cmdAckInfo{m=?MODULE,gsNum = 1,beginTime=time:getUTCNowSec() }),

			OldGSResults = lists:foldl(
				fun
					(Itme,Acc) when erlang:is_record(Itme, recGameServer) ->
						NewAcc =[
							{obj,
								[
									{"serverID",Itme#recGameServer.gameServerID},
									{"serverName",erlang:list_to_binary(Itme#recGameServer.gameServerName)},
									{"ip",erlang:list_to_binary(Itme#recGameServer.gameServerIp )},
									{"port",Itme#recGameServer.gameServerPort},
									{"beginTime",0},
									{"maxPlayer",Itme#recGameServer.maxPlayer},
									{"onlineNumber",Itme#recGameServer.gameServerPlayerCount},
									{"gsState",Itme#recGameServer.gameServerState}
								]}
							| Acc],
						NewAcc;
					(_,Acc) ->
						Acc
				end,
				[], ets:tab2list(?ETSGameServerInfo)),
			erlang:send_after(1000, self(), {handleMsgAck, self(),{CmdSerial,OldGSResults} }),
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
		{"command",?Web2lsMsgGetList4GSMangeAck},
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
		{OpUser}
	catch
		_:_ ->
			false
	end.
