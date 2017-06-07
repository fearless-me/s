%% @author luowei
%% @doc @todo Add description to web2lsMsgDenyChat.


-module(web2lsMsgSendString).
-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,msgAck/4]).

-spec doMsg( CmdSerial, Data ) ->term() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
	{ok,String} = rfc4627:get_field(Data,"string"),

	web2lsMsgSendString({CmdSerial, String, self()}),
	
	put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
												  opCode = ?Web2lsMsgClearBan,
												  opUser = OpUser,
												  opSerial = CmdSerial,
												  arg1  = String
												 }),
	
	web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial}, 
									  #cmdAckInfo{m=?MODULE,gsNum = 1,beginTime=time:getUTCNowSec() }).

%% 处理 异步收到的结果
-spec msgAck(CmdSerial,S,GSNum,OldGSResults) -> JsonStr when
		  CmdSerial::integer(),S::port(),GSNum::integer(),OldGSResults::list(),JsonStr::string().
msgAck(CmdSerial,S,GSNum,OldGSResults) ->
	?LOG_OUT("Web2lsMsgSendStringAck json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
	erlang:erase({gmMsg,CmdSerial}),
	DealCode = web2lsNetDispatcher:msgDeal(GSNum, OldGSResults),
	
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	return2Web(CmdSerial,DealCode).

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec return2Web( CmdSerial, DealCode ) -> JsonStr when
		  CmdSerial::integer(), DealCode::integer(),JsonStr::string().
return2Web( CmdSerial, DealCode ) ->
	
	SendData = {obj,[
					 {"command",?Web2lsMsgSendStringAck},
					 {"serial",CmdSerial},
					 {"code",DealCode}
					]},
	rfc4627:encode(SendData).

%% 平台gm 发个万能的字符串过来
web2lsMsgSendString({CmdSerial,String,CallbackPid}) ->
	?LOG_OUT( "web2lsMsgSendString ~p str:~ts", [CmdSerial,String] ),

	String2 = case erlang:is_binary(String) of
				  true -> erlang:binary_to_list(String);
				  _ -> String
			  end,

	%% 处理平台发送过来的命令
	web2lsMsgSendString2(String2),

	Result = 0,

	psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial, Result}),
	ok.

web2lsMsgSendString2("") ->
	ok;
web2lsMsgSendString2(String) ->
	case string:str(String, "<") of
		1 ->
			case string:str(String, ">") of
				0 -> skip;
				EI ->
					Key = string:substr(String, 2, EI - 2),
					Param = string:substr(String, EI + 1),
					do_web2lsMsgSendString(Key, Param),
					ok
			end;
		_ ->
			skip
	end,
	ok.

do_web2lsMsgSendString("addmonitorip", Param) ->
	psMgr:sendMsg2PS(?PsNameLS, monitorsj_addmonitorsjip, {?MonitorTC_Type_AddMonitorIP, Param}),
	gsSendMsg:sendMsg2DBServer(monitorsj_addmonitorsjip, 0, {?MonitorTC_Type_AddMonitorIP, Param}),
	ok;
do_web2lsMsgSendString("addranddataip", Param) ->
	psMgr:sendMsg2PS(?PsNameLS, monitorsj_addmonitorsjip, {?MonitorTC_Type_AddRandIP, Param}),
	gsSendMsg:sendMsg2DBServer(monitorsj_addmonitorsjip, 0, {?MonitorTC_Type_AddRandIP, Param}),
	ok;
do_web2lsMsgSendString("delranddataip", _Param) ->
%%	psMgr:sendMsg2PS(?PsNameLS, monitorsj_addmonitorsjip, {?MonitorTC_Type_DelRandIP, Param}),
%%	gsSendMsg:sendMsg2DBServer(monitorsj_addmonitorsjip, 0, {?MonitorTC_Type_DelRandIP, Param}),
	ok;
do_web2lsMsgSendString("delmonitorip", Param) ->
	psMgr:sendMsg2PS(?PsNameLS, monitorsj_addmonitorsjip, {?MonitorTC_Type_DelMonitorIP, Param}),
	gsSendMsg:sendMsg2DBServer(monitorsj_addmonitorsjip, 0, {?MonitorTC_Type_DelMonitorIP, Param}),
	ok;
do_web2lsMsgSendString("openmonitor", _Param) ->
	core:setGlobalBitVariant(?Setting_GlobalBitVar_Special, true),
	ok;
do_web2lsMsgSendString("closemonitor", _Param) ->
	core:setGlobalBitVariant(?Setting_GlobalBitVar_Special, false),
	ok;
do_web2lsMsgSendString(Key, Param) ->
	?LOG_OUT("do_web2lsMsgSendString:~ts,~ts", [Key, Param]),
	ok.