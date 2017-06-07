%% @author zhengzhichun
%% @doc @todo Add description to web2lsMsgAddXmlNotice.


-module(web2lsMsgAddXmlNotice).
-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,dbAck/4]).

-spec doMsg( CmdSerial, Data ) ->boolean() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?DEBUG_OUT("Web2lsGMAddXMLNotice ~p",[Data]),
	case parseArgs(Data) of
		{OpUser,Type,XmlContent} ->
			
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsGMAddXMLNotice,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1  = Type,
														  arg2 = XmlContent
														 }),
			put({dbRet,CmdSerial},false),
			Md5 = erlang:list_to_binary( md5:encrypt(XmlContent) ),
			lsSendMsg:sendMsg2DBServer(addXmlNotice, {CmdSerial,Type,XmlContent,Md5}),
			
			ets:insert(?XmlNoticeEts, #xmlNoticeRow{type=Type,content =XmlContent,md5=Md5}),
			
			put({waitDbAck,CmdSerial},
				#cmdAckInfo{m=?MODULE }
			   ),
			true;
		_ ->
			false
	end.

%% 处理 异步收到的结果
%% -spec msgAck(CmdSerial,S,GSNum,OldGSResults) -> JsonStr when
%% 		  CmdSerial::integer(),S::port(),GSNum::integer(),OldGSResults::list(),JsonStr::string().
%% msgAck(CmdSerial,S,GSNum,OldGSResults) ->
%% 	?LOG_OUT("web2lsMsgSendMailAck json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
%% 	erlang:erase({gmMsg,CmdSerial}),
%% 	return2Web(CmdSerial,GSNum,OldGSResults).

%% 处理dbs返回
dbAck(CmdSerial,Ok,_S,State) ->
	?LOG_OUT("Web2lsGMLoginAwardAck CmdSerial:~p dbAck======~p=====",[CmdSerial,Ok]),

%%	web2lsMsgCommonLogic:refreshLoginAwardConf({CmdSerial,self()}),
%% 	web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial}, 
%% 									  #cmdAckInfo{m=?MODULE,gsNum = 1,beginTime=time:getUTCNowSec() }),
%% 	
%% 	put({dbRet,CmdSerial},true),

	erlang:erase({waitDBAck,CmdSerial}),
	ReturnJsonStr = return2Web(CmdSerial,0),
	web2lsMsg:returnWeb( ReturnJsonStr,State ).
%% ====================================================================
%% Internal functions
%% ====================================================================
-spec return2Web( CmdSerial, RetCode ) -> JsonStr when
		  CmdSerial::integer(), RetCode::integer(),JsonStr::string().
return2Web( CmdSerial, RetCode ) ->

	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, RetCode),
	
	SendData = {obj,[
					 {"command",?Web2lsGMAddXMLNoticeAck},
					 {"serial",CmdSerial},
					 {"dbCode",RetCode}
					]},
	erlang:erase({dbRet,CmdSerial}),
	rfc4627:encode(SendData).

-spec parseArgs(Data) -> tuple() | false when
		  Data::tuple().
parseArgs(Data) ->
	try
		{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
		{ok,Type} = rfc4627:get_field(Data,"type"),
		{ok,XmlContent} = rfc4627:get_field(Data,"xml_content"),
		{OpUser,Type,XmlContent}
	catch
		_:_ ->
			false
	end.
