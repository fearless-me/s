%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 25. 六月 2015 20:17
%%%-------------------------------------------------------------------

-module(web2lsMsgActDelExchange).
-author("ZhongYuanWei").

-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").

%% API
-export([
	doMsg/2,
	msgAck/4,
	test/1
]).

test(ID) ->
	Data = {obj,
		[{"server_id",1},
			{"id", ID},
			{"operator",<<"admin">>},
			{"reason",
				<<233,129,147,229,133,183,229,133,145,
				230,141,162,233,129,147,229,133,183,
				229,133,145,230,141,162>>}]},

	doMsg(1435323362,Data),
	ok.

-spec doMsg(CmdSerial, Data) -> boolean() when
	CmdSerial::integer(), Data::tuple().
doMsg(CmdSerial, Data) ->
	?DEBUG_OUT("web2lsMsgActDelExchange:~p",[Data]),
	case parseArgs(Data) of
		{OpUser,ActID} when erlang:is_integer(ActID) andalso ActID > 0 ->
			web2lsMsgCommonLogic:web2lsMsgActExchange({CmdSerial, self(), del, ActID}),

			put({gmCmdLog,CmdSerial},
				#recWeb2LsCommandLog{
					opCode = ?Web2lsMsgDelExchange,
					opUser = OpUser,
					opSerial = CmdSerial,
					arg1  = ActID
				}),

			web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial},
				#cmdAckInfo{m=?MODULE, gsNum = 1, beginTime = time:getUTCNowSec() }),
			true;
		_ ->
			false
	end.

-spec msgAck(CmdSerial,S,GSNum,OldGSResults) -> JsonStr when
	CmdSerial::integer(),S::port(),GSNum::integer(),OldGSResults::list(),JsonStr::string().
msgAck(CmdSerial,S,GSNum,OldGSResults) ->
	?LOG_OUT("web2lsMsgActDelExchangeAck json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
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
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),

	SendData = {obj,[
		{"command",?Web2lsMsgDelExchangeAck},
		{"serial",CmdSerial},
		{"code",DealCode}
	]},
	rfc4627:encode(SendData).


parseArgs(Data) ->
	try
		{ok,OpUser} = rfc4627:get_field(Data,"operator"),
		{ok,ActID} = rfc4627:get_field(Data,"id"),
		{OpUser,ActID}
	catch
		_:_ ->
			false
	end.



