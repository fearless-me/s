%% @author Administrator
%% @doc @todo Add description to web2lsMsgSendMail.


-module(web2lsMsgSendMail).


-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
-include("logdb.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,msgAck/4]).

-spec doMsg( CmdSerial, Data ) ->boolean() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?DEBUG_OUT("mail:~p",[Data]),
	case parseArgs(Data) of
		{OpUser,ToRoleIDList,MailTitle,MailContent,AttachmentList,MailSubjoinMsg} ->
			Msg = {CmdSerial,self(),
				   ToRoleIDList, 
				   erlang:binary_to_list(MailTitle), 
				   erlang:binary_to_list(MailContent), 
				   AttachmentList, 
				   erlang:binary_to_list(MailSubjoinMsg)},
			
			web2lsMail(Msg), %随机只抽一个gs发消息
			
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsGMSendMail,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1  = MailTitle,
														  arg2  = MailContent
														 }),
			
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
	?LOG_OUT("web2lsMsgSendMailAck json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
	erlang:erase({gmMsg,CmdSerial}),
	return2Web(CmdSerial,OldGSResults).

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec return2Web( CmdSerial, DealCode ) -> JsonStr when
		  CmdSerial::integer(), DealCode::list(),JsonStr::string().
return2Web( CmdSerial, OldGSResults ) ->
	{DealCode,FailRoleList} = 
		if 
			OldGSResults =:= [] ->
				{?Web2lsAckTimeout,[]};
			OldGSResults =:= [[]] ->
				{?Web2lsAckSucc,[]};
			true ->
				{?Web2lsAckFail,OldGSResults}
		end,
	
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	
	SendData = {obj,[
					 {"command",?Web2lsGMSendMailAck},
					 {"serial",CmdSerial},
					 {"code",DealCode},
					 {"failRoleList",FailRoleList}
					]},
	rfc4627:encode(SendData).

-spec parseArgs(Data) -> tuple() | false when
		  Data::tuple().
parseArgs(Data) ->
	try
		{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
		{ok,ToRoleIDList} = rfc4627:get_field(Data,"player_list"),
		{ok,MailTitle} = rfc4627:get_field(Data,"mail_title"),
		{ok,MailContent} = rfc4627:get_field(Data,"mail_content"),
		{ok,AttachmentList} = rfc4627:get_field(Data,"items"), %可以是物品列表
		MailSubjoinMsg = rfc4627:get_field(Data,"mailSubjoinMsg",<<"">>),
		{OpUser,ToRoleIDList,MailTitle,MailContent,AttachmentList,MailSubjoinMsg}
	catch
		_:_ ->
			false
	end.

%% 平台gm 发邮件
web2lsMail({CmdSerial,CallbackPid,ToRoleIDList, MailTitle, MailContent, AttachmentList, MailSubjoinMsg}) ->
	?LOG_OUT("web2lsMail ~p", [{CmdSerial,CallbackPid,ToRoleIDList, MailTitle, MailContent, AttachmentList, MailSubjoinMsg}]),

	try
		FailList = systemMail:sendMail(AttachmentList,ToRoleIDList,?ItemSourceFuncell2Ls, MailTitle, MailContent, MailSubjoinMsg),

		psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial, FailList})
	catch
		_ERR:Con ->
			E = erlang:get_stacktrace(),
			?ERROR_OUT("handle_info({web2lsMail  ~p  ~p,~p",[CmdSerial,Con,E])
	end,
	ok.