%% @author zhengzhichun
%% @doc @todo Add description to web2lsMsgGetActivityStatus.


-module(web2lsMsgGetActivityStatus).

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
		{OpUser,ActivityIDList} ->
			?DEBUG_OUT("~p",[ActivityIDList]),
			Msg = {CmdSerial, self(), ActivityIDList},
			web2lsGetActivityFlag(Msg), %随机只抽一个gs发消息
			
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsGMGetGSActivityVariant,
														  opUser = OpUser,
														  opSerial = CmdSerial
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
	?LOG_OUT("web2lsMsgGetActivityStatusAck json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
	erlang:erase({gmMsg,CmdSerial}),
	return2Web(CmdSerial,OldGSResults).


-spec return2Web( CmdSerial, DealCode ) -> JsonStr when
		  CmdSerial::integer(), DealCode::list(),JsonStr::string().
return2Web( CmdSerial, OldGSResults ) ->
	{DealCode,AckData} = 
		case OldGSResults of
			 [] ->
				{?Web2lsAckTimeout,[]};
			[Data|_] when erlang:is_list(Data) ->
				{?Web2lsAckSucc,Data};
			_ ->
				{?Web2lsAckFail,OldGSResults}
		end,
	
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	
	SendData = {obj,[
					 {"command",?Web2lsGMGetGSActivityVariantAck},
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
		{ok,ActivityIDList} = rfc4627:get_field(Data,"activityIDList"),
		
		{OpUser,ActivityIDList}
	catch
		_:_ ->
			false
	end.

%% 平台gm ls2gs取出GS活动变量（活动开关)
web2lsGetActivityFlag({CmdSerial,CallbackPid,ActivityIDList}) ->
	?LOG_OUT( "web2lsGetActivityFlag ~p", [CmdSerial] ),
	Fun =
		fun
			( ActivityID,Acc ) when erlang:is_integer(ActivityID)->
				Status = activity:queryActivitySwitch(ActivityID),
				[{obj,[{"activityID",ActivityID},{"status",Status}]}|Acc];
			( _ActivityID,Acc ) ->
				Acc
		end,
	Ret = lists:foldl(Fun, [], ActivityIDList),
	psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial, Ret}),
	ok.