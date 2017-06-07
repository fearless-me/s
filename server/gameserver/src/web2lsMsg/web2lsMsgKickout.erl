%% @author zzc
%% @doc @todo Add description to web2lsMsgDenyChat.


-module(web2lsMsgKickout).
-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,doGMKickout/2,msgAck/4]).

%% 发送踢人消息
-spec doGMKickout( CmdSerial, AccountID ) ->integer() when
		  CmdSerial::integer(), AccountID::integer().
doGMKickout( CmdSerial, AccountID ) ->
	Msg = {CmdSerial,AccountID,self()},
	psMgr:sendMsg2PS(?PsNameLS, gmKickout, Msg),
	1.

%% 调用处理函数，并设置异步返回的检查结果集
-spec doMsg( CmdSerial, Data ) ->term() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	
	case parseArgs(Data) of
		{OpUser,AccountID} ->
			?LOG_OUT("web2lsMsgKickout json:~p",[Data]),
			GSNum = doGMKickout(CmdSerial,AccountID),
			
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsGMKickout,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1  = AccountID
														 }),
			
			web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial}, 
											  #cmdAckInfo{m=?MODULE,gsNum = GSNum,beginTime=time:getUTCNowSec() });
		_ ->
			false
	end.

%% 处理 异步收到的结果
msgAck(CmdSerial,S,GSNum,OldGSResults) ->
	?LOG_OUT("web2lsMsgKickoutACK json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
	erlang:erase({gmMsg,CmdSerial}),
	DealCode = web2lsNetDispatcher:msgDeal(GSNum, OldGSResults),
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	return2Web(CmdSerial,DealCode).

%% ====================================================================
%% Internal functions
%% ====================================================================




return2Web(CmdSerial,DealCode) ->
	SendData = {obj,[
					 {"command",?Web2lsGMKickoutAck},
					 {"serial",CmdSerial},
					 {"code",DealCode}
					]},
	rfc4627:encode(SendData).


-spec parseArgs(Data) -> tuple() | false when
		  Data::tuple().
parseArgs(Data) ->
	try
		{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
		{ok,AccountIDBin} = rfc4627:get_field(Data,"account_id"),
		AccountID = erlang:binary_to_integer(AccountIDBin),
		{OpUser,AccountID}
	catch
		_:_ ->
			false
	end.
