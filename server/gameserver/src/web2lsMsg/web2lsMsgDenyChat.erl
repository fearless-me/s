%% @author zzc
%% @doc @todo Add description to web2lsMsgDenyChat.


-module(web2lsMsgDenyChat).
-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
-include("gsInc.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,msgAck/4]).

-define(DenyChatOK, 0).				%% 禁言成功
-define(DenyChatError, 1).			%% 禁言失败

-spec doMsg( CmdSerial, Data ) ->term() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
	{ok,RoleId} = rfc4627:get_field(Data,"player_id"),
	{ok,DateTime} = rfc4627:get_field(Data,"DateTime"),

	GSNum = 1,
	web2lsDenyChat({CmdSerial,RoleId,DateTime,self()}),
	
	put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
												  opCode = ?Web2lsDenyChat,
												  opUser = OpUser,
												  opSerial = CmdSerial,
												  arg1  = RoleId,
												  arg2  = DateTime
												 }),
	
	web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial}, 
									  #cmdAckInfo{m=?MODULE,gsNum = GSNum,beginTime=time:getUTCNowSec() }).

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
					 {"command",?Web2lsDenyChatAck},
					 {"serial",CmdSerial},
					 {"code",DealCode}
					]},
	rfc4627:encode(SendData).

%% 平台gm ls2gs玩家禁言
web2lsDenyChat({CmdSerial,RoleId,DateTime,CallbackPid}) ->
	?LOG_OUT( "web2lsDenyChat ~p", [CmdSerial] ),
	?DEBUG_OUT(" roleID ~p, DateTime ~p, now ~p", [RoleId, DateTime, time:getUTCNowSec()]),
	Result = denyPlayerChat(RoleId, DateTime),

	?LOG_OUT("web2lsDenyChat ack ~p", [Result]),
	psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial, Result}),
	ok.

-spec denyPlayerChat(RoleID :: uint() | binary(), DateTime :: uint()) -> ?DenyChatOK | ?DenyChatError.
denyPlayerChat(RoleID, DateTime) when erlang:is_binary(RoleID)->
	denyPlayerChat(erlang:binary_to_integer(RoleID), DateTime);
denyPlayerChat(RoleID, DateTime) when erlang:is_integer(RoleID) ->
	case playerMgrOtp:getOnlinePlayerInfoByID(RoleID) of
		#rec_OnlinePlayer{pid = PlayerPid} ->
			?DEBUG_OUT("deny chat online"),
			psMgr:sendMsg2PS(PlayerPid, add2ChatDenyList, DateTime);
		_Offline ->
			skip
	end,
	gsSendMsg:sendMsg2DBServer(saveRoleDenyChatTime, RoleID, {RoleID, DateTime}),
	%% 成功为0 ，失败为负数
	?DenyChatOK.

