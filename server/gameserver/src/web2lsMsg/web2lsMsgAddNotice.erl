%% @author zzc
%% @doc @todo Add description to web2lsMsgAddNotice.


-module(web2lsMsgAddNotice).
-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
-include("gsDef.hrl").
-define(NoticeTypeImmediately,0).
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,msgAck/4,dbAck/4]).

-spec doMsg( CmdSerial, Data ) ->boolean() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?DEBUG_OUT("addGameNotice:~p",[Data]),
	case parseArgs(Data) of
		{OpUser,NoticePosition,NoticeType,NoticeTime,Duration,Interval,Content,Rgb} ->
			
			Notice = #gameNotice{
								 position = NoticePosition, 
								 type=NoticeType, 
								 content=Content, 
								 rgb=Rgb, 
								 beginTime=NoticeTime, 
								 duration=Duration, 
								 interval=Interval
								},

			lsSendMsg:sendMsg2DBServer(addGameNotice, {CmdSerial,Notice}),
			
			Msg = {CmdSerial,self(),
				   Notice
				  },
				put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
												  opCode = ?Web2lsGMAddLoginAward,
												  opUser = OpUser,
												  opSerial = CmdSerial,
												  arg2  = Content
												  }),
			put({waitDbAck,CmdSerial},
				#cmdAckInfo{m=?MODULE,tmpArgs=Msg}
			   ),
			
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
	?LOG_OUT("web2lsMsgAddNotice json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
	erlang:erase({gmMsg,CmdSerial}),
	
	DealCode = web2lsNetDispatcher:msgDeal(GSNum, OldGSResults),
	return2Web(CmdSerial,DealCode).

%% 处理dbs返回
dbAck(CmdSerial,NoticeID,_S,_State) ->	
	?LOG_OUT("web2lsMsgAddNotice CmdSerial:~p  dbAck-Data:~p",[CmdSerial,NoticeID]),
	#cmdAckInfo{tmpArgs={CmdSerial,_Pid,Notice} } = get({waitDbAck,CmdSerial}),
	Now = time:getUTCNowSec(),
	NoticeInfo = #pk_NoticeInfo{
								id = NoticeID, 
								type =Notice#gameNotice.type, 
								pos = Notice#gameNotice.position, 
								content= binary_to_list( Notice#gameNotice.content ), 
								color=Notice#gameNotice.rgb, 
								afterSecondStart=Notice#gameNotice.beginTime-Now, 
								duration=Notice#gameNotice.duration, 
								interval=Notice#gameNotice.interval 
							   },
	if
		Notice#gameNotice.type /= ?NoticeTypeImmediately ->
			?LOG_OUT("write notic to ets,notice info :~w~n",[Notice#gameNotice{id=NoticeID}]),
			%非即时公告，同步ets表缓存
			ets:insert(?GameNoticeEts, Notice#gameNotice{id=NoticeID});
		true ->
			skip
	end,
	
	Log = get({gmCmdLog,CmdSerial}),
	put({gmCmdLog,CmdSerial},Log#recWeb2LsCommandLog{
													 arg1  = NoticeID
													}),
	
	ToGsMsg = {CmdSerial,self(),[NoticeInfo] },
	?DEBUG_OUT("toGSMsg:~p",[ToGsMsg]),
	
	web2lsAddNotice(ToGsMsg),
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
		{ok,NoticePosition} = rfc4627:get_field(Data,"notice_position"),
		{ok,NoticeType} = rfc4627:get_field(Data,"notice_type"),
		{ok,NoticeTime} = rfc4627:get_field(Data,"notice_time"),
		{ok,Duration} = rfc4627:get_field(Data,"duration"), 
		{ok,Interval} = rfc4627:get_field(Data,"interval"),
		{ok,Content} = rfc4627:get_field(Data,"content"),
		{ok,Rgb} = rfc4627:get_field(Data,"rgb"),
		{OpUser,NoticePosition,NoticeType,NoticeTime,Duration,Interval,Content,Rgb}
	catch
		_:_ ->
			false
	end.

%% 平台gm ls2gs新增公告
web2lsAddNotice({CmdSerial,CallbackPid,NoticeStruct}) ->
	psMgr:sendMsg2PS( ?PsNamePlayerMgr, pidMsg2AllOLPlayer, { web2lsAddNotice,{NoticeStruct} } ),
	psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial, 0}),%0为成功
	ok.