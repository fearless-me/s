%% @author zhengzhichun
%% @doc @todo Add description to web2lsMsgFunctionFlag.


-module(web2lsMsgFunctionFlag).

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
		{OpUser,VariantID,Value} ->
			case isValidSwitchVar(VariantID) of
				true ->
					web2lsVariantFlag({CmdSerial, self(), VariantID, Value}), %随机只抽一个gs发消息
					
					put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
																  opCode = ?Web2lsGMSetGSWorldVariantFlag,
																  opUser = OpUser,
																  opSerial = CmdSerial,
																  arg1  = VariantID,
																  arg2  = Value
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
	?LOG_OUT("Web2lsGMSetGSWorldVariantFlagAck json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
	erlang:erase({gmMsg,CmdSerial}),
	return2Web(CmdSerial,OldGSResults).

%% ====================================================================
%% Internal functions
%% ====================================================================

isValidSwitchVar(Switch) when Switch > 1 andalso Switch < ?Setting_GlobalBitVarReadOnly_EndBit ->
	true;
isValidSwitchVar(_) ->
	false.

-spec return2Web( CmdSerial, DealCode ) -> JsonStr when
		  CmdSerial::integer(), DealCode::list(),JsonStr::string().
return2Web( CmdSerial, OldGSResults ) ->
	{DealCode,FailRoleList} = 
		if 
			OldGSResults =:= [] ->
				{?Web2lsAckTimeout,[]};
			OldGSResults =:= [true] ->
				{?Web2lsAckSucc,[]};
			true ->
				{?Web2lsAckFail,OldGSResults}
		end,
	
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	
	SendData = {obj,[
					 {"command",?Web2lsGMSetGSWorldVariantFlagAck},
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
		{ok,VariantID} = rfc4627:get_field(Data,"functionID"),
		{ok,Value} = rfc4627:get_field(Data,"flag"),
		
		Tolist = erlang:binary_to_list(VariantID),
		{OpUser,erlang:list_to_integer(Tolist),Value}
	catch
		_:_ ->
			false
	end.

%% 平台gm ls2gs设置GS世界变量（功能开关)
web2lsVariantFlag({CmdSerial,CallbackPid,VariantID,Value}) ->
	?LOG_OUT( "web2lsVariantFlag ~p", [CmdSerial] ),
	Ret = core:setGlobalBitVariant(VariantID,Value),
	psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial, Ret}),
	ok.