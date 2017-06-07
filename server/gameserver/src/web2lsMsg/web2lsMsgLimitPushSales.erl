%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 一月 2016 6:13
%%%-------------------------------------------------------------------
-module(web2lsMsgLimitPushSales).
-author("Administrator").

-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
-include("common/gamedata.hrl").
%% API
-export([doMsg/2,msgAck/4,dbAck/4 ]).

doMsg( CmdSerial, Data ) ->
    case parseArgs(Data) of
        false-> false;
        {OpUser,Result} ->
            put({dbRet,CmdSerial},false),
			lsSendMsg:sendMsg2DBServer(addLimitPushSale, {CmdSerial,Result}),

            put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
                opCode = ?Web2lsGMAddLoginAward,
                opUser = OpUser,
                opSerial = CmdSerial,
                arg1  = "1",
                arg2  = "2"
            }),
            put({waitDbAck,CmdSerial},
                #cmdAckInfo{m=?MODULE,tmpArgs = Result}
            ),

            true
    end,
    ok.

%超时
msgAck(CmdSerial,S,GSNum,OldGSResults) ->
    ?LOG_OUT("web2lsMsgSendMailAck json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
    erlang:erase({gmMsg,CmdSerial}),
    return2Web(CmdSerial,GSNum,OldGSResults).

%% 处理dbs返回
dbAck(CmdSerial,ok,_S,_State) ->
    ?LOG_OUT("Web2lsGMLoginAwardAck CmdSerial:~p dbAck===========",[CmdSerial]),

    refreshLimitSalesPush({CmdSerial,self()}),

    web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial},
        #cmdAckInfo{m=?MODULE,gsNum = 1,beginTime=time:getUTCNowSec() }),

    put({dbRet,CmdSerial},true),
    erlang:erase({waitDBAck,CmdSerial}).

%%----------------------------
%%intenal api
%%----------------------------

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

parseArgs(Data) ->
    try
%%        {ok,OpUser} = rfc4627:get_field(Data,"opUser"),
%%        {ok,Sku} = rfc4627:get_field(Data,"sku"),

        Data
    catch
        _:_ ->
            false
    end.

refreshLimitSalesPush({CmdSerial, PidFrom}) ->
	?LOG_OUT("refreshLimitSalesPush no deal...[~p,~p]", [CmdSerial, PidFrom]),
	ok.