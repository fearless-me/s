%% @author zhengzhichun
%% @doc @todo Add description to web2lsMsgSetGSLineMaintain.


-module(web2lsMsgSetGSLineMaintain).

-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,msgAck/4]).

-spec doMsg( CmdSerial, Data ) ->term() when
	CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?DEBUG_OUT("Web2lsGMSetGSLineMaintain:~p",[Data]),

	case parseArgs(Data) of
		{OpUser,DoAfterSecond,999} ->

			ToGsMsg = {CmdSerial,self(),
				DoAfterSecond
			},
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
				opCode = ?Web2lsGMSetGSLineMaintain,
				opUser = OpUser,
				opSerial = CmdSerial,
				arg1  = DoAfterSecond,
				arg2  = 999
			}),
			globalSetup:insert(?GSKey_areaMaintain, true), %把本大区置为维护状态
			psMgr:sendMsg2PS(?PsNameLS, web2lsStopGs, ToGsMsg),
			web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial},
				#cmdAckInfo{m=?MODULE,gsNum = 1}),

			true;
		_ ->
			false
	end.

%% 处理 异步收到的结果
-spec msgAck(CmdSerial,S,GSNum,OldGSResults) -> JsonStr when
	CmdSerial::integer(),S::port(),GSNum::integer(),OldGSResults::list(),JsonStr::string().
msgAck(CmdSerial,S,GSNum,OldGSResults) ->
	?LOG_OUT("Web2lsGMSetGSLineMaintainAck json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
	erlang:erase({gmMsg,CmdSerial}),

	DealCode = web2lsNetDispatcher:msgDeal(GSNum, OldGSResults),
	return2Web(CmdSerial,DealCode).

%% %% 处理dbs返回
%% dbAck(CmdSerial,Ok,_S,State) ->	
%% 	?LOG_OUT("web2lsMsgSetRoleDelFlag CmdSerial:~p  dbAck-Data:~p",[CmdSerial,Ok]),
%% 
%% 	erlang:erase({waitDBAck,CmdSerial}),
%% 	ReturnJsonStr = return2Web(CmdSerial,?Web2lsAckSucc),
%% 	web2lsMsg:returnWeb( ReturnJsonStr,State ).

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec return2Web( CmdSerial, DealCode ) -> JsonStr when
	CmdSerial::integer(), DealCode::integer(),JsonStr::string().
return2Web( CmdSerial, DealCode ) ->


	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),

	SendData = {obj,[
		{"command",?Web2lsGMSetGSLineMaintainAck},
		{"serial",CmdSerial},
		{"code",DealCode}
	]},
	rfc4627:encode(SendData).

-spec parseArgs(Data) -> tuple() | false when
	Data::tuple().
parseArgs(Data) ->
	try
		{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
		{ok,DoAfterSecond} = rfc4627:get_field(Data,"doAfterSecond"),
		{ok,LineID} = rfc4627:get_field(Data,"lineID"),
		{OpUser,DoAfterSecond,LineID}
	catch
		_:_ ->
			false
	end.