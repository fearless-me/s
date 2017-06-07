%% @author zhengzhichun
%% @doc @todo Add description to web2lsMsgChangeRoleAccount.


-module(web2lsMsgChangeRoleAccount).

-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,dbAck/4]).

-spec doMsg( CmdSerial, Data ) ->boolean() when
	CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?DEBUG_OUT("=========================web2lsMsgChangeRoleAccount:~p",[{self(),Data}]),
	case parseArgs(Data) of
		{OpUser,DestinationAccountID,SourceAccountID,SourceRoleID} ->
			Msg = {CmdSerial,self(),
				DestinationAccountID,
				SourceAccountID,
				SourceRoleID},

			%% 发给gs操作
			changeRoleOwner({CmdSerial,DestinationAccountID, SourceAccountID,SourceRoleID,self()}),
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
				opCode = ?Web2lsGMChangeRoleOwner,
				opUser = OpUser,
				opSerial = CmdSerial,
				arg1  = DestinationAccountID,
				arg2 = SourceAccountID,
				arg3 = SourceRoleID
			}),

			put({dbRet,CmdSerial},false),
			put({waitDbAck,CmdSerial},
				#cmdAckInfo{m=?MODULE,tmpArgs=Msg}
			),

			true;
		_ ->
			false
	end.

%% 处理dbs返回
dbAck(CmdSerial, AckReturn,_S,State) ->
	?LOG_OUT("web2lsMsgChangeRoleAccount CmdSerial:~p  dbAck-Data:~p",[CmdSerial, AckReturn]),

	erlang:erase({waitDBAck,CmdSerial}),
	DealCode =
		if
			AckReturn =:= true ->
				?Web2lsAckSucc;
			true ->
				?Web2lsAckFail
		end,
	ReturnJsonStr = return2Web(CmdSerial,DealCode),
	web2lsMsg:returnWeb( ReturnJsonStr,State ).

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec return2Web( CmdSerial, DealCode ) -> JsonStr when
	CmdSerial::integer(), DealCode::integer(),JsonStr::string().
return2Web( CmdSerial, DealCode ) ->

	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),

	SendData = {obj,[
		{"command",?Web2lsGMChangeRoleOwnerAck},
		{"serial",CmdSerial},
		{"code",DealCode}
	]},
	rfc4627:encode(SendData).

-spec parseArgs(Data) -> tuple() | false when
	Data::tuple().
parseArgs(Data) ->
	try
		{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
		{ok,DestinationAccountID} = rfc4627:get_field(Data,"destinationAccountID"),
		{ok,SourceAccountID} = rfc4627:get_field(Data,"sourceAccountID"),
		{ok,SourceRoleIDStr} = rfc4627:get_field(Data,"sourceRoleID"),
		SourceRoleID = erlang:list_to_integer(
			erlang:binary_to_list(SourceRoleIDStr)
		),
		{OpUser,DestinationAccountID,SourceAccountID,SourceRoleID}
	catch
		_:_ ->
			false
	end.

%% 转移角色
changeRoleOwner({CmdSerial, DAccountID, SAccountID, SRoleID,GMSocketPid} = Data) ->
	?LOG_OUT("changeRoleOwner start  CmdSerial=~p, DAccountID=~p, SAccountID=~p, SRoleID=~p,GMSocketPid=~p",[CmdSerial, DAccountID, SAccountID, SRoleID,GMSocketPid]),
	psMgr:sendMsg2PS(core:getPlayerDataMgrOtp(), changeRoleOwner, Data),
	ok.