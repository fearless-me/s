%% @author zhengzhichun
%% @doc @todo Add description to web2lsMsgRechargeRebateFlagClean.


-module(web2lsMsgRechargeRebateFlagClean).
-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
-include("gsDef.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,msgAck/4]).

-spec doMsg( CmdSerial, Data ) ->boolean() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?DEBUG_OUT("web2lsMsgRechargeRebate:~p",[Data]),
	case parseArgs(Data) of
		{OpUser,Recharge_rebateID} ->
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsMsgRechargeRebateFlagClean,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1 = Recharge_rebateID
														 }),
			
			Msg = {CmdSerial, self(), Recharge_rebateID},
			web2lsRechargeRebateFlagClean(Msg),
			
			web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial}, 
											  #cmdAckInfo{m=?MODULE,gsNum = 1,beginTime=time:getUTCNowSec() }),
			
			
			true;
		_ ->
			false
	end.

%% 处理 异步收到的结果(不用异步)
-spec msgAck(CmdSerial,S,GSNum,OldGSResults) -> JsonStr when
		  CmdSerial::integer(),S::port(),GSNum::integer(),OldGSResults::list(),JsonStr::string().
msgAck(CmdSerial,S,GSNum,OldGSResults) ->
	?LOG_OUT("web2lsMsgRechargeRebateFlagClean json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
	erlang:erase({gmMsg,CmdSerial}),
	return2Web(CmdSerial,OldGSResults).

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec return2Web( CmdSerial, DealCode ) -> JsonStr when
		  CmdSerial::integer(), DealCode::list(),JsonStr::string().
return2Web( CmdSerial, OldGSResults ) ->
	{DealCode,AckData} = 
		if 
			OldGSResults =:= [] ->
				{?Web2lsAckTimeout,[]};
			erlang:is_list(OldGSResults) ->
				[Ret] = OldGSResults,
				{?Web2lsAckSucc,Ret};
			true ->
				{?Web2lsAckFail,[]}
		end,
	
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	
	SendData = {obj,[
					 {"command",?Web2lsMsgRechargeRebateFlagCleanAck},
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
		{ok,Recharge_rebateID} = rfc4627:get_field(Data,"id"),

		{OpUser,Recharge_rebateID}
	catch
		_:_ ->
			false
	end.

%% 平台gm ls2gs 充值返利标记清除
web2lsRechargeRebateFlagClean({CmdSerial,CallbackPid,Recharge_rebateID}) ->
	?LOG_OUT( "web2lsRechargeRebateFlagClean ~p ,~p", [CmdSerial,Recharge_rebateID] ),
	psMgr:sendMsg2PS(?PsNameRecharge, web2lsRechargeRebateFlagClean,  Recharge_rebateID),
	psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial, 0}),%0为成功
	ok.