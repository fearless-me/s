%% @author Administrator
%% @doc @todo Add description to web2lsMsgDelNotice.


-module(web2lsMsgDelNotice).

-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
-include("gsDef.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,msgAck/4,dbAck/4]).

-spec doMsg( CmdSerial, Data ) ->term() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?DEBUG_OUT("delGameNotice:~p",[Data]),
	
	case parseArgs(Data) of
		{OpUser,NoticeID} ->
			lsSendMsg:sendMsg2DBServer(delGameNotice, {CmdSerial,NoticeID}),
			
			Msg = {CmdSerial,self(),
				   NoticeID
				  },
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsGMDelNotice,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1  = NoticeID
														 }),
			put({waitDbAck,CmdSerial},
				#cmdAckInfo{m=?MODULE,tmpArgs=Msg}
			   ),
			
			ets:delete(?GameNoticeEts, NoticeID),
			
			web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial}, 
											  #cmdAckInfo{m=?MODULE,gsNum = 1,beginTime=time:getUTCNowSec() }),
			true;
		_ ->
			false
	end.

%% 处理 异步收到的结果
-spec msgAck(CmdSerial,S,GSNum,OldGSResults) -> JsonStr when
		  CmdSerial::integer(),S::port(),GSNum::integer(),OldGSResults::list(),JsonStr::string().
msgAck(CmdSerial,S,GSNum,OldGSResults) ->
	?LOG_OUT("web2lsMsgDelNoticeAck json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
	erlang:erase({gmMsg,CmdSerial}),
	
	DealCode = web2lsNetDispatcher:msgDeal(GSNum, OldGSResults),
	return2Web(CmdSerial,DealCode).

%% 处理dbs返回
dbAck(CmdSerial,NoticeID,_S,_State) ->	
	?LOG_OUT("web2lsMsgDelNotice CmdSerial:~p  dbAck-Data:~p",[CmdSerial,NoticeID]),
	#cmdAckInfo{tmpArgs={CmdSerial,_Pid,NoticeID} } = get({waitDbAck,CmdSerial}),
	ToGsMsg = {CmdSerial,self(),[NoticeID]},
	?DEBUG_OUT("toGSMsg:~p",[ToGsMsg]),
	web2lsDelNotice(ToGsMsg),
	web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial}, 
									  #cmdAckInfo{m=?MODULE,gsNum = 1 }),
	
	erlang:erase({waitDBAck,CmdSerial}).

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec return2Web( CmdSerial, DealCode ) -> JsonStr when
		  CmdSerial::integer(), DealCode::integer(),JsonStr::string().
return2Web( CmdSerial, DealCode ) ->

	
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	
	SendData = {obj,[
					 {"command",?Web2lsGMAddNoticeAck},
					 {"serial",CmdSerial},
					 {"code",DealCode}
					]},
	rfc4627:encode(SendData).

-spec parseArgs(Data) -> tuple() | false when
		  Data::tuple().
parseArgs(Data) ->
	try
		{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
		{ok,NoticeID} = rfc4627:get_field(Data,"id"),
		{OpUser,NoticeID}
	catch
		_:_ ->
			false
	end.

%% 平台gm ls2gs删除公告id列表
web2lsDelNotice({CmdSerial,CallbackPid,NoticeIDList}) ->
	?LOG_OUT( "web2lsDelNotice ~p  NoticeIDList:~p", [CmdSerial,NoticeIDList] ),
	psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {web2lsDelNotice,{NoticeIDList}}),
	psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial, 0}),%0为成功
	ok.