%% @author zhongyuanwei
%% @doc @todo 命名进程间消息通信接口.


-module(gsSendMsg).
-author(zhongyuanwei).

-include("gsInc.hrl").
-include("dbsDefine.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	sendMsg2Cross/3,
	sendMsg2Main/2,
	sendMsg2Mail/2,
	sendMsg2DBServer/3,
	sendMsg2DBWithDBOPT/3,
	sendMsg2LogDBServer/2,
	sendNetMsg/2,
	sendNetMsgByRoleID/2,
	sendMsg2PublicDataMgr/2,
	sendMsg2PublicDMSaveData/1,
	sendMsg2PlayerDataMgr/2,
	callDBRechargeServer/3,
	sendRolePidMsgByRoleID/3,
	callRolePidMsgByRoleID/3
]).

%% 发消息给玩家数据管理进程
-spec sendMsg2PlayerDataMgr(MsgID::atom(), Msg::term()) -> ok.
sendMsg2PlayerDataMgr(MsgID, Msg) ->
    psMgr:sendMsg2PS(?PlayerDataMgr, MsgID, Msg).

%% 发消息给公共数据管理进程
-spec sendMsg2PublicDataMgr(MsgID::atom(), Msg::term()) -> ok.
sendMsg2PublicDataMgr(MsgID, Msg) ->
    psMgr:sendMsg2PS(?PublicDataMgr, MsgID, Msg).

%% 保存公共数据data
-spec sendMsg2PublicDMSaveData(Data::term()) -> ok.
sendMsg2PublicDMSaveData(Data) ->
    sendMsg2PublicDataMgr(savePublicData, Data).

-spec sendMsg2Cross(OtpName::atom(),MsgID::atom(), Msg::term() ) ->ok.
sendMsg2Cross(OtpName, MsgID, Msg) ->
	case core:isCross() of
		false ->
			%% 发给跨服进程中转
			psMgr:sendMsg2PS(?PsNameCros, sendDataToCrossServer, {OtpName, MsgID, Msg});
		_ ->
			?ERROR_OUT("sendMsg2Cross:~p,~p,~p,~p", [OtpName, MsgID, Msg, misc:getStackTrace()])
	end.

%-spec sendMsg2AllSource(OtpName::atom(), MsgID::atom(), Msg::term()) -> ok.
%sendMsg2AllSource(OtpName, MsgID, Msg) ->
%	case core:isCross() of
%		true ->
%			psMgr:sendMsg2PS(?PsNamePlayerMgr, sendMsg2AllSource, {OtpName, MsgID, Msg});
%		_ ->
%			?ERROR_OUT("sendMsg2AllSource:~p,~p,~p,~p", [OtpName, MsgID, Msg, misc:getStackTrace()])
%	end,
%	ok.
%
%-spec sendMsg2OneSource(TargetServerID::integer(), OtpName::atom(), MsgID::atom(), Msg::term()) -> ok.
%sendMsg2OneSource(TargetServerID, OtpName, MsgID, Msg) ->
%	case core:isCross() of
%		true ->
%			psMgr:sendMsg2PS(?PsNamePlayerMgr, sendMsg2OneSource, {TargetServerID, OtpName, MsgID, Msg});
%		_ ->
%			?ERROR_OUT("sendMsg2AllSource:~p,~p,~p,~p,~p", [TargetServerID, OtpName, MsgID, Msg, misc:getStackTrace()])
%	end,
%	ok.

-spec sendMsg2Main(MsgID,Msg) -> ok when
		  MsgID :: atom(), Msg :: tuple().
sendMsg2Main(MsgID,Msg) ->
	psMgr:sendMsg2PS(?PsNameMain, MsgID, Msg),
	ok.

-spec sendMsg2Mail(MsgID,Msg) -> ok when
		  MsgID :: atom(), Msg :: tuple().
sendMsg2Mail(MsgID,Msg) ->
	psMgr:sendMsg2PS(?PsNameMail, MsgID, Msg),
	ok.

-spec sendMsg2DBServer(MsgID,AccountID,Msg) -> ok when
		  MsgID :: atom(), AccountID::uint(), Msg :: term().
sendMsg2DBServer(MsgID,AccountID,Msg) when erlang:is_atom(MsgID) ->
%%	psMgr:sendMsg2PS(?PsNameDBS, gsMsgToDBserver, {AccountID,MsgID,Msg}),
%%	?PsNameGS ! {gsMsgToDB, {AccountID,MsgID,self(),Msg}},
	dbSendMsg:sendMsg2DBPID(MsgID, {self(), AccountID, Msg}).

-spec sendMsg2DBWithDBOPT(MsgID,AccountID,Msg) -> ok when
		  MsgID :: atom(), AccountID::uint(), Msg :: list().
sendMsg2DBWithDBOPT(MsgID,AccountID,Msg) when erlang:is_atom(MsgID) ->
	FunFilter =
		fun({DBOPT, Data}, R) ->
			case DBOPT of
				?DBOPT_ERROR ->
					R;
				_ ->
					[{DBOPT, Data} | R]
			end
		end,
	case lists:foldl(FunFilter, [], Msg) of
		[] ->
			ok;
		MsgNew ->
			dbSendMsg:sendMsg2DBPID(MsgID, {self(), AccountID, MsgNew})
	end.

-spec sendMsg2LogDBServer(MsgID,Msg) -> ok when
		  MsgID::uint(),Msg::tuple().
sendMsg2LogDBServer(MsgID,Msg) when erlang:is_integer(MsgID) ->
	logDBPID ! {MsgID,Msg},
	ok.
%%call调用db支付服务器
callDBRechargeServer(MsgID,Info,TimeOut)->
	PoolElementPid =gen_server:call(db_recharge_otp_pool, <<"get_pool_element_pid">>, TimeOut),
	?DEBUG_OUT("PoolElementPid============~p~n",[{PoolElementPid, MsgID, Info, TimeOut}]),
	psMgr:call(PoolElementPid, MsgID, Info, TimeOut).

%%发送网络消息
-spec sendNetMsg(NetPid,Msg) -> ok when
		  NetPid::pid(),Msg::tuple().
sendNetMsg(NetPid,Msg) ->
	psMgr:sendMsg2PS(NetPid, sendPackage, core:packNetMsg(Msg)),
	ok.

%%通过角色id给指定的角色发送网络消息
%%ok|fail
sendNetMsgByRoleID(RoleID,Msg)->
	case ets:lookup(ets_rec_OnlinePlayer, RoleID) of
		[#rec_OnlinePlayer{netPid = NetPid}] ->
			case is_process_alive(NetPid) of
				true ->
					sendNetMsg(NetPid, Msg);
				_ ->
					fail
			end;
		_R ->
			fail
	end.
%%给玩家进程发送消息
sendRolePidMsgByRoleID(RoleID,MsgID,Msg)->
	case ets:lookup(ets_rec_OnlinePlayer, RoleID) of
		[#rec_OnlinePlayer{pid = RolePid}] ->
			case is_process_alive(RolePid) of
				true ->
					psMgr:sendMsg2PS(RolePid, MsgID, Msg);
				_ ->
					fail
			end;
		_R ->
			fail
	end.
callRolePidMsgByRoleID(RoleID,MsgID,Msg)->
	case ets:lookup(ets_rec_OnlinePlayer, RoleID) of
		[#rec_OnlinePlayer{pid = RolePid}] ->
			case is_process_alive(RolePid) of
				true ->
					gen_server:call(RolePid,{MsgID, Msg},1000);
				_ ->
					fail
			end;
		_R ->
			fail
	end.
%%%%发送消息给所有其它GS
%%-spec sendMsg2OtherGS(MsgID,Msg) -> ok when
%%	MsgID::atom(),Msg::term().
%%sendMsg2OtherGS(MsgID,Msg) ->
%%	sendMsg2CSServer(send2OtherGS,{MsgID,Msg}).

%% ====================================================================
%% Internal functions
%% ====================================================================


