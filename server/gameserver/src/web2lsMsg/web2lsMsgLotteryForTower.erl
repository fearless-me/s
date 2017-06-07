%% @author zzc
%% @doc @todo Add description to web2lsMsgAddLoginAward.


-module(web2lsMsgLotteryForTower).

-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
-include("gsDef.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,msgAck/4,dbAck/4]).

-spec doMsg( CmdSerial, Data ) ->boolean() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?DEBUG_OUT("web2lsMsg change lottery for tower data:~p",[Data]),
	case parseArgs(Data) of
		{BeginTime,EndTime,OpUser,IsReloadCfg} ->
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsGMAddLoginAward,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1  = {BeginTime,EndTime}
														 }),
%%			DBSNodeStr = config:rpc_get_string("GSNode", "gameserver@127.0.0.1" ),
			GSNum = 1,
			edit_lottery_for_tower_info({CmdSerial, self(),OpUser,BeginTime,EndTime,IsReloadCfg}),


			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
				opCode = ?Web2lsDenyChat,
				opUser = OpUser,
				opSerial = CmdSerial,
				arg1  = 0,
				arg2  = 0
			}),
			io:format("=======222222222222222222222===GSNum====~p~n",[{GSNum }]),
%%			web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial},
%%				#cmdAckInfo{m=?MODULE,gsNum = GSNum,beginTime=time:getUTCNowSec() }),
			web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial},
				#cmdAckInfo{m=?MODULE,gsNum = GSNum,beginTime=time:getUTCNowSec() }),

			true;
		_ ->
			false
	end.

%% 处理 异步收到的结果
-spec msgAck(CmdSerial,S,GSNum,OldGSResults) -> JsonStr when
		  CmdSerial::integer(),S::port(),GSNum::integer(),OldGSResults::list(),JsonStr::string().
msgAck(CmdSerial,S,GSNum,OldGSResults) ->
	io:format("====xxxxxxxxxxxx===1111111111111111111111111111111111111111111111===~p~n",[{CmdSerial,S,GSNum,OldGSResults}]),
	DealCode = web2lsNetDispatcher:msgDeal(GSNum, OldGSResults),
	return2Web(CmdSerial,DealCode).

%% 处理dbs返回
dbAck(_CmdSerial,ok,_S,_State) ->
	io:format("====xxxxxxxxxxxx===111111111111111111111111111111111111111111111111111111fffffffff===~p~n",[{}]),
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec return2Web( CmdSerial, DealCode ) -> JsonStr when
	CmdSerial::integer(), DealCode::integer(),JsonStr::string().
return2Web( CmdSerial, DealCode ) ->
	SendData = {obj,[
		{"command",?Web2lsMsgLotteryForTowerAck},
		{"serial",CmdSerial},
		{"code",DealCode}
	]},
	rfc4627:encode(SendData).

-spec parseArgs(Data) -> tuple() | false when
		  Data::tuple().
parseArgs(Data) ->
	try
		{ok,BeginTime} = rfc4627:get_field(Data,"beginTime"),
		{ok,EndTime} = rfc4627:get_field(Data,"endTime"),
		{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
		{ok,IsReloadCfg} = rfc4627:get_field(Data,"isReloadCfg"),
		{BeginTime,EndTime,OpUser,IsReloadCfg}
	catch
		_:_ ->
			false
	end.

%% 金宝塔活动
edit_lottery_for_tower_info({CmdSerial,CallbackPid,OpUser,BeginTime,EndTime,IsReloadCfg}) ->
	?LOG_OUT( "lottery_for_tower_change_date ~p,~p,~p", [CmdSerial,OpUser,{CallbackPid,BeginTime,EndTime,IsReloadCfg}] ),
	psMgr:sendMsg2PS(?PsNameLotteryForTower,edit_lottery_for_tower_info, {BeginTime,EndTime,IsReloadCfg} ),
	psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial,0}),
	ok.