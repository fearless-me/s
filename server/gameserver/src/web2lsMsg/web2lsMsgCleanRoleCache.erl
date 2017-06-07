%% @author zhengzhichun
%% @doc @todo Add description to web2lsMsgCleanRoleCache.


-module(web2lsMsgCleanRoleCache).

-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,msgAck/4]).

-spec doMsg( CmdSerial, Data ) ->term() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
	{ok,RoleIdBin} = rfc4627:get_field(Data,"player_id"),
	
	RoleId = erlang:binary_to_integer(RoleIdBin),
	Msg = {CmdSerial,self(),RoleId},
	web2lsMsgCleanRoleCache(Msg),
	
	put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
												  opCode = ?Web2lsMsgClearRoleCache,
												  opUser = OpUser,
												  opSerial = CmdSerial,
												  arg1  = RoleId
												 }),
	
	web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial}, 
									  #cmdAckInfo{m=?MODULE,gsNum = 1,beginTime=time:getUTCNowSec() }).

%% 处理 异步收到的结果
-spec msgAck(CmdSerial,S,GSNum,OldGSResults) -> JsonStr when
		  CmdSerial::integer(),S::port(),GSNum::integer(),OldGSResults::list(),JsonStr::string().
msgAck(CmdSerial,S,GSNum,OldGSResults) ->
	?LOG_OUT("Web2lsMsgClearRoleCacheACK json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
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
					 {"command",?Web2lsMsgClearRoleCacheAck},
					 {"serial",CmdSerial},
					 {"code",DealCode}
					]},
	rfc4627:encode(SendData).

%% 平台gm 清除指定角色缓存（先要踢人）
web2lsMsgCleanRoleCache({CmdSerial,CallbackPid,RoleID}) ->
	?LOG_OUT( "web2lsMsgCleanRoleCache ~p, roleid:~p,", [CmdSerial,RoleID] ),
	%%ret=0;-1;-2分别为：成功;缓存清除失败;角色在线，不能清除
	Ret =
		case playerMgrOtp:getOnlinePlayerInfoByID(RoleID) of
			undefined ->
				case playerSave:deleteRoleCache(RoleID) of
					true ->0;
					_ ->-1
				end;
			_ ->-2
		end,
	psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial, Ret}),
	ok.