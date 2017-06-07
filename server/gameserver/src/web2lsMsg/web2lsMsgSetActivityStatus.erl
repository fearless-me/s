%% @author zhengzhichun
%% @doc @todo Add description to web2lsMsgSetActivityStatus.


-module(web2lsMsgSetActivityStatus).

-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
-include("setting.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,msgAck/4]).

-spec doMsg( CmdSerial, Data ) ->boolean() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?DEBUG_OUT("web2lsMsgGetActivityStatus:~p",[Data]),
	case parseArgs(Data) of
		{OpUser,ActivityID,Value} ->
			?DEBUG_OUT("~p",[ActivityID]),
			Msg = {CmdSerial, self(), ActivityID,Value},
			web2lsActivityFlag(Msg), %随机只抽一个gs发消息
			
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsGMSetGSActivityVariant,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1 = ActivityID,
														  arg2 = Value
														 }),
			
			web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial}, 
											  #cmdAckInfo{m=?MODULE, gsNum = 1, beginTime = time:getUTCNowSec() }),
			true;
		_ ->
			false
	end.

%% 处理 异步收到的结果
-spec msgAck(CmdSerial,S,GSNum,OldGSResults) -> JsonStr when
		  CmdSerial::integer(),S::port(),GSNum::integer(),OldGSResults::list(),JsonStr::string().
msgAck(CmdSerial,S,GSNum,OldGSResults) ->
	?LOG_OUT("web2lsMsgSetActivityStatusAck json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
	erlang:erase({gmMsg,CmdSerial}),
	return2Web(CmdSerial,OldGSResults).


-spec return2Web( CmdSerial, DealCode ) -> JsonStr when
		  CmdSerial::integer(), DealCode::list(),JsonStr::string().
return2Web( CmdSerial, OldGSResults ) ->
	{DealCode,AckData} = 
		case OldGSResults of
			 [] ->
				{?Web2lsAckTimeout,null};
			[true] ->
				{?Web2lsAckSucc,null};
			_ ->
				{?Web2lsAckFail,OldGSResults}
		end,
	
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	
	SendData = {obj,[
					 {"command",?Web2lsGMSetGSActivityVariantAck},
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
		{ok,ActivityID} = rfc4627:get_field(Data,"activityID"),
		{ok,Value} = rfc4627:get_field(Data,"value"),
		{OpUser,ActivityID,Value}
	catch
		_:_ ->
			false
	end.

%% 平台gm ls2gs设置GS活动变量（活动开关)
web2lsActivityFlag({CmdSerial,CallbackPid,ActivityID,Value}) ->
	?LOG_OUT( "web2lsActivityFlag ~p", [CmdSerial] ),
	Ret = activity:yunyingControlActivitySwitch(ActivityID,Value),
	psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial, Ret}),
	ok.