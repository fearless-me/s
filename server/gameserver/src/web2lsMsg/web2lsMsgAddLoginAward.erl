%% @author zzc
%% @doc @todo Add description to web2lsMsgAddLoginAward.


-module(web2lsMsgAddLoginAward).

-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,msgAck/4,dbAck/4]).

-spec doMsg( CmdSerial, Data ) ->boolean() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?DEBUG_OUT("web2lsMsgAddLoginAward:~p",[Data]),
	case parseArgs(Data) of
		{OpUser,AwardName,BeginTime,EndTime,LeveMin,LeveMax,MailTitle,MailContent,AttachmentList} ->
			LoginAwardConf = #loginAwardConf{
											 award_name = AwardName,
											 time_begin = BeginTime,
											 time_end = EndTime,
											 level_min = LeveMin,
											 level_max = LeveMax,
											 mail_title = erlang:binary_to_list(MailTitle),
											 mail_content = erlang:binary_to_list(MailContent),
											 items = AttachmentList
											},
			ToGsMsg = { CmdSerial, self(), LoginAwardConf },
			
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsGMAddLoginAward,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1  = AwardName
														 }),
			put({dbRet,CmdSerial},false),
			lsSendMsg:sendMsg2DBServer(addLoginAwardConf, {CmdSerial,LoginAwardConf}),

			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsGMAddLoginAward,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1  = MailTitle,
														  arg2  = MailContent
														 }),
			put({waitDbAck,CmdSerial},
				#cmdAckInfo{m=?MODULE,tmpArgs = ToGsMsg}
			   ),
			
			true;
		_ ->
			false
	end.

%% 处理 异步收到的结果
-spec msgAck(CmdSerial,S,GSNum,OldGSResults) -> JsonStr when
		  CmdSerial::integer(),S::port(),GSNum::integer(),OldGSResults::list(),JsonStr::string().
msgAck(CmdSerial,S,GSNum,OldGSResults) ->
	?LOG_OUT("web2lsMsgSendMailAck json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
	erlang:erase({gmMsg,CmdSerial}),
	return2Web(CmdSerial,GSNum,OldGSResults).

%% 处理dbs返回
dbAck(CmdSerial,ok,_S,_State) ->
	?LOG_OUT("Web2lsGMLoginAwardAck CmdSerial:~p dbAck===========",[CmdSerial]),

	web2lsMsgCommonLogic:refreshLoginAwardConf({CmdSerial,self()}),
	web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial}, 
									  #cmdAckInfo{m=?MODULE,gsNum = 1,beginTime=time:getUTCNowSec() }),
	
	put({dbRet,CmdSerial},true),
	erlang:erase({waitDBAck,CmdSerial}).
%% ====================================================================
%% Internal functions
%% ====================================================================
-spec return2Web( CmdSerial, GSNum, DealCode ) -> JsonStr when
		  CmdSerial::integer(), DealCode::list(),JsonStr::string(),GSNum::integer().
return2Web( CmdSerial, GSNum, OldGSResults ) ->
	IsOk = lists:member(?Web2lsAckSucc, OldGSResults),
	AllNum = erlang:length(OldGSResults),
	
	DbRet = get({dbRet,CmdSerial}),
	?DEBUG_OUT("dbret ~p",[DbRet]),
	DealCode = 
		if
			IsOk ->
				?Web2lsAckSucc;
			AllNum =/= GSNum -> %没返回完，也没成功的
				?Web2lsAckTimeout;
			GSNum =:= 0 ->
				?Web2lsAckSucc; %没有GS在线
			true -> %都返回了，也没成功的
				[Head | _] = OldGSResults,
				Head
		end,
	
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	
	SendData = {obj,[
					 {"command",?Web2lsGMLoginAwardAck},
					 {"serial",CmdSerial},
					 {"msgCode",DealCode},
					 {"dbCode",DbRet}
					]},
	erlang:erase({dbRet,CmdSerial}),
	rfc4627:encode(SendData).

-spec parseArgs(Data) -> tuple() | false when
		  Data::tuple().
parseArgs(Data) ->
	try
		{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
%% 		{ok,AwardID} = rfc4627:get_field(Data,"award_id"),
		{ok,AwardName} = rfc4627:get_field(Data,"award_name"),
		{ok,BeginTime} = rfc4627:get_field(Data,"time_begin"),
		{ok,EndTime} = rfc4627:get_field(Data,"time_end"),
		{ok,LeveMin} = rfc4627:get_field(Data,"level_min"),
		{ok,LeveMax} = rfc4627:get_field(Data,"level_max"),
		{ok,MailTitle} = rfc4627:get_field(Data,"mail_title"),
		{ok,MailContent} = rfc4627:get_field(Data,"mail_content"),
		{ok,AttachmentList} = rfc4627:get_field(Data,"items"), %可以是物品列表
		{OpUser,AwardName,BeginTime,EndTime,LeveMin,LeveMax,MailTitle,MailContent,AttachmentList}
	catch
		_:_ ->
			false
	end.
