%% @author luowei
%% @doc @todo Add description to web2lsMsgDenyChat.


-module(web2lsMsgClearBan).
-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
-include("gsDef.hrl").
-include("dataDefine.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,msgAck/4]).

-spec doMsg( CmdSerial, Data ) ->term() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
	{ok,RoleIdBinStr} = rfc4627:get_field(Data,"player_id"),
	{ok,DateTime} = rfc4627:get_field(Data,"DateTime"),
	
	RoleId=erlang:binary_to_integer(RoleIdBinStr),
	web2lsMsgClearBan({CmdSerial, RoleId, self()}),
	
	put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
												  opCode = ?Web2lsMsgClearBan,
												  opUser = OpUser,
												  opSerial = CmdSerial,
												  arg1  = RoleId,
												  arg2  = DateTime
												 }),
	
	web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial}, 
									  #cmdAckInfo{m=?MODULE,gsNum = 1,beginTime=time:getUTCNowSec() }).

%% 处理 异步收到的结果
-spec msgAck(CmdSerial,S,GSNum,OldGSResults) -> JsonStr when
		  CmdSerial::integer(),S::port(),GSNum::integer(),OldGSResults::list(),JsonStr::string().
msgAck(CmdSerial,S,GSNum,OldGSResults) ->
	?LOG_OUT("web2lsMsgKickoutACK json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
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
					 {"command",?Web2lsMsgClearBanAck},
					 {"serial",CmdSerial},
					 {"code",DealCode}
					]},
	rfc4627:encode(SendData).

%% 平台gm 取消黑名单
web2lsMsgClearBan({CmdSerial, RoleID, CallbackPid}) ->
	?LOG_OUT("web2lsMsgClearBan ~p, ~p",[CmdSerial, RoleID]),
	case playerMgrOtp:getOnlinePlayerInfoByID(RoleID) of
		#rec_OnlinePlayer{pid = Pid} ->
			psMgr:sendMsg2PS(Pid, clearBan, {CallbackPid, CmdSerial});
		_ ->
			%% 通知好友进程进行写入，避免多进程写入问题
			psMgr:sendMsg2PS(?PsNameFriend2, clearBan, {RoleID, CallbackPid, CmdSerial})
	end,
	ok.