%% @author zhengzhichun
%% @doc @todo Add description to web2lsMsgGetFunctionFlag.


-module(web2lsMsgGetFunctionFlag).
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
	?DEBUG_OUT("web2lsMsgFunctionFlag:~p",[Data]),
	case parseArgs(Data) of
		{OpUser,VariantIDList} ->
			TrueList = [ isValidSwitchVar(VariantID) || VariantID <-VariantIDList ],
			
			case lists:member(false, TrueList) of
				false ->
					Msg = {CmdSerial, self(), VariantIDList},
					web2lsGetVariantFlag(Msg), %随机只抽一个gs发消息
					
					put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
																  opCode = ?Web2lsGMGetGSWorldBitVariantFlag,
																  opUser = OpUser,
																  opSerial = CmdSerial
																 }),
					
					web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial}, 
													  #cmdAckInfo{m=?MODULE, gsNum = 1, beginTime = time:getUTCNowSec() }),
					true;
				_ ->
					false
			end;
		_ ->
			false
	end.

%% 处理 异步收到的结果
-spec msgAck(CmdSerial,S,GSNum,OldGSResults) -> JsonStr when
		  CmdSerial::integer(),S::port(),GSNum::integer(),OldGSResults::list(),JsonStr::string().
msgAck(CmdSerial,S,GSNum,OldGSResults) ->
	?LOG_OUT("Web2lsGMGetGSWorldBitVariantFlag json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
	erlang:erase({gmMsg,CmdSerial}),
	return2Web(CmdSerial,OldGSResults).

%% ====================================================================
%% Internal functions
%% ====================================================================

isValidSwitchVar(Switch) when Switch > ?Setting_GlobalBitVarReadOnly_StartBit andalso Switch < ?Setting_GlobalBitVarReadOnly_EndBit ->
	true;
isValidSwitchVar(_) ->
	false.

-spec return2Web( CmdSerial, DealCode ) -> JsonStr when
		  CmdSerial::integer(), DealCode::list(),JsonStr::string().
return2Web( CmdSerial, OldGSResults ) ->
	DealCode = 
		if 
			OldGSResults =:= [] ->
				?Web2lsAckTimeout;
			erlang:is_list(OldGSResults) ->
				?Web2lsAckSucc;
			true ->
				?Web2lsAckFail
		end,
	
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	[GSResults|_] = OldGSResults,
	SendData = {obj,[
					 {"command",?Web2lsGMGetGSWorldBitVariantFlagAck},
					 {"serial",CmdSerial},
					 {"code",DealCode},
					 {"data",GSResults}
					]},
	rfc4627:encode(SendData).

-spec parseArgs(Data) -> tuple() | false when
		  Data::tuple().
parseArgs(Data) ->
	try
		{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
		{ok,VariantIDList} = rfc4627:get_field(Data,"functionIDList"),
		
		{OpUser,VariantIDList}
	catch
		_:_ ->
			false
	end.

%% 平台gm ls2gs取出GS世界变量（功能开关)
web2lsGetVariantFlag({CmdSerial,CallbackPid,VariantIDList}) ->
	?LOG_OUT( "web2lsGetVariantFlag ~p", [CmdSerial] ),
	Fun =
		fun( VariantID,Acc ) ->
			RetValue = variant:getGlobalBitVariant(VariantID),
			VariantIDStr = erlang:integer_to_list(VariantID),
			[{VariantIDStr,RetValue} |Acc]
		end,

	RetList = lists:foldl(Fun, [], VariantIDList),
	psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial, {obj,RetList}}),
	ok.
