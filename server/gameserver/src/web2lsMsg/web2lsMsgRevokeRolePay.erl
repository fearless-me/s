%% @author zhengzhichun
%% @doc @todo Add description to web2lsMsgRevokeRolePay.


-module(web2lsMsgRevokeRolePay).
-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,msgAck/4]).

-spec doMsg( CmdSerial, Data ) ->term() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?WARN_OUT("web2lsMsgRevokeRolePay ~p",[Data]),
	case parseArgs(Data) of
		{OpUser,RoleId,MoneyTupleList,ItemTupleList,Reputation} ->
			?DEBUG_OUT("~p  ~p",[MoneyTupleList,ItemTupleList]),
			Msg = {CmdSerial,self(),RoleId,MoneyTupleList,ItemTupleList,Reputation,OpUser},
			web2lsMsgRevokeRolePay(Msg),
			
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsMsgClearRevokeRolePay,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1  = RoleId
														 }),
			
			web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial}, 
											  #cmdAckInfo{m=?MODULE,gsNum = 1,beginTime=time:getUTCNowSec() }),
			true;
		_ ->
			false
	end.

%% 处理 异步收到的结果
-spec msgAck(CmdSerial,S,GSNum,OldGSResults) -> JsonStr when
		  CmdSerial::integer(),S::port(),GSNum::integer(),OldGSResults::list(),JsonStr::string().
msgAck(CmdSerial,S,GSNum,OldGSResults) ->
	?LOG_OUT("Web2lsMsgClearRevokeRolePayAck json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
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
					 {"command",?Web2lsMsgClearRevokeRolePayAck},
					 {"serial",CmdSerial},
					 {"code",DealCode}
					]},
	rfc4627:encode(SendData).

-spec parseArgs(Data) -> tuple() | false when
		  Data::tuple().
parseArgs(Data) ->
	try
		{ok,OpUserBin} = rfc4627:get_field(Data,"opUser"),
		{ok,RoleIdBin} = rfc4627:get_field(Data,"player_id"),
		{ok,MoneyList} = rfc4627:get_field(Data,"moneyList"),
		MoneyTupleList = [ erlang:list_to_tuple( Money ) || Money <- MoneyList],
		{ok,ItemList} = rfc4627:get_field(Data,"itemList"),
		ItemTupleList = [ erlang:list_to_tuple( Item ) || Item <- ItemList],
		{ok,Reputation} = rfc4627:get_field(Data,"reputation"),
		
		RoleId = erlang:binary_to_integer(RoleIdBin),
		OpUser = erlang:binary_to_list(OpUserBin),
		{OpUser,RoleId,MoneyTupleList,ItemTupleList,Reputation}
	catch
		_:_ERR ->
			?ERROR_OUT("~p",[_ERR]),
			false
	end.

%% 平台gm 扣除指定角色钻石、物品、装备（先要踢人）
web2lsMsgRevokeRolePay({CmdSerial,CallbackPid,RoleID,MoneyList,ItemList,Reputation,OPUser}) ->
	?LOG_OUT( "web2lsMsgRevokeRolePay ~p, roleid:~p, ~p ~p ~p opuser:~ts", [CmdSerial,RoleID,MoneyList,ItemList,Reputation,OPUser] ),
	%%ret=0;-1;-2分别为：成功;缓存清除失败;角色在线，不能清除
	Ret =
		case playerMgrOtp:getOnlinePlayerInfoByID(RoleID) of
			undefined ->
				case core:queryRoleKeyInfoByRoleID(RoleID) of
					#?RoleKeyRec{accountID = AccountID} ->
						playerSave:deleteRoleCache(AccountID, RoleID),

						lsMsgHandler:revokeRoleMoney(MoneyList, RoleID,OPUser),
						lsMsgHandler:revokeRoleReputation(Reputation, RoleID,OPUser),
						ItemList2 = lists:foldl(fun
													({UIDBin,ItemIDBin,NumBin,DecBin},Acc) ->
														[
															{misc:toInteger(UIDBin),misc:toInteger(ItemIDBin),misc:toInteger(NumBin),misc:toInteger(DecBin)}
															| Acc];
													(_,Acc) ->Acc
												end, [], ItemList),
						lsMsgHandler:revokeRoleItem(ItemList2, RoleID,OPUser),
						0;
					_ ->
						-2
				end;
			_ ->-2
		end,
	psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial, Ret}),
	ok.