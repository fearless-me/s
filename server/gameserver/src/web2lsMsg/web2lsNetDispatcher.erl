%% @author zzc
%% @doc @todo Add description to web2lsNetLogic.


-module(web2lsNetDispatcher).
-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
-include_lib("public_key/include/public_key.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 doTcpMsg/3,
		 doTcpMsgAck/4,
		 doDbAck/4,
		 loopCheckMsgAck/2,
		 setCmdResults/2,
		 msgDeal/2,
		 sendOpLog2logDb/2
		]).


%% 密文消息
-spec doTcpMsg( Cmd, Bin, State) -> State when
		  Cmd::integer(),Bin::binary(),State::tuple().
doTcpMsg( ?CMD_Web2LS_Crypto, #pk_Web2LS_Crypto{bodyJsonStr=Msg}, State) ->
	?LOG_OUT("CMD_Web2LS_Crypto:~p",[Msg]),
	Key = config:getString("Web2LsKey", "defaultKeyMustBeErr"),
	BinKey = list_to_binary( Key ),
	case aesDecode( Msg,BinKey) of
		error ->
			?ERROR_OUT("de_crypte_fail :~p",[Msg]),
			returnDecryptFail(?Web2lsAckDecryptFail,State);
		Text ->
			deJson2Dispatcher( Text,State )
	end,
	State;

%% 明文消息
doTcpMsg( ?CMD_Web2LS_Normal, #pk_Web2LS_Normal{bodyJsonStr = Msg}, State) ->
	?LOG_OUT("CMD_Web2LS_Normal:~p",[Msg]),
	deJson2Dispatcher( Msg,State ),
	State;

%% 未知消息
doTcpMsg( Cmd, Msg, State ) ->
	?ERROR_OUT("socketPid[~p] WebNetworkMsg can't match this args:~p",[self(),[ Cmd, Msg, State]] ),
	State.

%% 返回消息  分发
%% 把结果累积到list中，如果接收数与发送数一致，就交给业务函数处理
-spec doTcpMsgAck(CmdSerial,Data,S,State) -> State when
		  CmdSerial::integer(),Data::term()
		  ,S::port(),State::tuple(),State::tuple().
doTcpMsgAck(CmdSerial,Data,S,State) ->
	case get({gmMsg,CmdSerial}) of
		#cmdAckInfo{m=Module, gsNum=GSNum,gsResult=OldGSResult} = _CmdAckInfo ->
			NewGSResult = [Data | OldGSResult],
			ResultNum = erlang:length(NewGSResult),
			if
				ResultNum =:= GSNum -> %本操作序号收到的返回集数与广播出去的数相等

					ReturnJsonStr = Module:msgAck(CmdSerial,S,GSNum,NewGSResult),
					web2lsMsg:returnWeb( ReturnJsonStr,State );
				true -> %未完全收回，继续累积回收结果
					setCmdResults({gmMsg,CmdSerial},_CmdAckInfo#cmdAckInfo{gsResult=NewGSResult})
			end,
			ok;
		_ ->
			?LOG_OUT("no effective CmdSerial[~p]",[CmdSerial])
	end,
	State.

doDbAck(CmdSerial,Data,S,State) ->
	case get({waitDbAck,CmdSerial}) of
		#cmdAckInfo{m=Module} ->
			Module:dbAck(CmdSerial,Data,S,State);
		_ ->
			skip
	end,
	State.

%% 轮询(遍历)     本网络进程的超时的  操作  序号
-spec loopCheckMsgAck(S,State) -> State when
		S::port(),State::tuple(),State::tuple().  
loopCheckMsgAck(S,State) ->
	{dictionary,List} = erlang:process_info(self(),dictionary),
	
	Now = time:getUTCNowSec(),
	Fun = fun( Item ) ->
				  case  Item of
					  {Key, #cmdAckInfo{m=Module, gsNum=GSNum,gsResult=OldGSResult,beginTime=BeginTime} } ->
						  if
							  BeginTime >204 andalso Now - BeginTime >= ?Web2lsMGAckTimeout -> %此操作序号 作超时处理，并清除
								  ?LOG_OUT("[~p]timeout logic in CmdSerial[~p] ~p-~p",[?MODULE,Key,Now , BeginTime]),
								  erlang:erase(Key),
								  ?DEBUG_OUT("~p",[Key]),
								  {gmMsg,CmdSerial} = Key,
								  ReturnJsonStr = Module:msgAck(CmdSerial,S,GSNum,OldGSResult),
								  web2lsMsg:returnWeb( ReturnJsonStr,State );
							  true ->
%% 								  ?LOG_OUT("[~p]timeout logic in [~p]",[?MODULE,Now - BeginTime]),
								  skip
						  end;
					  _ ->
						  skip
				  end
		  end,
	lists:foreach(Fun, List),
	State.


%% 消息返回处理（简单型    可选）
-spec msgDeal( GSNum, OldGSResults) -> integer() when
		  GSNum::integer(),OldGSResults::list().
msgDeal( GSNum, OldGSResults) ->
	IsOk = lists:member(?Web2lsAckSucc, OldGSResults),
	AllNum = erlang:length(OldGSResults),
	
	DealCode = 
	if
		IsOk ->
			?Web2lsAckSucc;
		AllNum =/= GSNum -> %没返回完，也没成功的
			?Web2lsAckTimeout;
		true -> %都返回了，也没成功的
			[Head | _] = OldGSResults,
			Head
	end,
	DealCode.

%%把gm操作日志发到dbs保存
-spec sendOpLog2logDb(CmdSerial::integer(),Result::term() ) -> ok.
sendOpLog2logDb(CmdSerial,Result) ->
	case get( {gmCmdLog,CmdSerial} ) of
		#recWeb2LsCommandLog{} = LogRec ->
			LogRecAddResult = LogRec#recWeb2LsCommandLog{opResult = Result},
			lsSendMsg:sendToLogDBServer( ?LogType_Web2lsCommand, LogRecAddResult),
			ok;
		_ ->
			skip
	end,
	ok.

%% 统一设置操作  序号的广播结果回收
-spec setCmdResults(CmdSerial,CmdAckInfo) ->term() when
CmdSerial::term(),CmdAckInfo::tuple().
setCmdResults(CmdSerial,#cmdAckInfo{} = CmdAckInfo) ->
	put(CmdSerial,CmdAckInfo);
setCmdResults(CmdSerial,CmdAckInfo) ->
	?ERROR_OUT("setCmdResults ArgBad: ~p",[{CmdSerial,CmdAckInfo}]).


%% ====================================================================
%% Internal functions
%% ====================================================================

%% 解密
-spec aesDecode( Cihper,Key ) ->error | binary() when
		  Cihper::term(),Key::binary().
aesDecode( Cihper,Key ) ->
	try
		Txt = base64:decode_to_string( Cihper ),
		TxtBin = list_to_binary(Txt),
		{VI,CT} = erlang:split_binary(TxtBin, 16),
		crypto:block_decrypt(aes_cbc128, Key, VI, CT)
	catch
		_:_ ->
			error
	end.

%% 解出消息json，并根据其 command 分发逻辑处理
-spec deJson2Dispatcher( JsonStr,State ) -> ok when
		  JsonStr::binary(),State::tuple().
deJson2Dispatcher( JsonStr,State ) ->
	try
		case rfc4627:decode( JsonStr ) of
			{ok,{obj,[
					  {"command",Cmd},
					  {"serial",CmdSerial},
					  {"data",Data}
					 ]},[]} ->
				?LOG_OUT("cmdSerial[~p][~p]",[CmdSerial,?MODULE]),

				%% 这里需要检测服务器是否启动成功
				case lsMainOtp:getCanReachGSList(false) of
					false ->
						?ERROR_OUT("The server also didn't start well,cmd:~p,~p,~p", [Cmd,CmdSerial,Data]);
					_ ->
						web2lsMsg:domsg(Cmd,CmdSerial,Data,State)
				end;
			JsonErr ->
				?ERROR_OUT("web2ls json Error:~p",[JsonErr])
		end
	catch
		Type:Err ->
			?ERROR_OUT("Type:~p,Err:~p,~p,web2ls json:~s",[Type,Err,erlang:get_stacktrace(),JsonStr])
	end,
	ok.

-spec returnDecryptFail(Ret,State) ->term() when
		  Ret::int(),State::tuple().
returnDecryptFail(Ret,State) ->
	case Ret < 0 of
		true ->
			SendData = {obj,[
							 {"serial",0},
							 {"code",Ret}
							]},
			JsonStr = rfc4627:encode(SendData),
			web2lsMsg:returnWeb(JsonStr,State),
			ok;
		_ ->
			skip
	end.
