%% @author zhengzhichun
%% @doc @todo Add description to talkdataLogic.


-module(talkdataLogic).
-include("talkdata.hrl").
-define(TD_HTTPC_TIMES,4).%%td超时重发次数
%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 dealInfo/2
		]).

%%dbs连接成功
dealInfo({asyncInit,_Pid}, State)->
	?LOG_OUT("asyncInit[~w]",[?MODULE]),
	
	inets:start(),
	URL =
		case config:rpc_get_string("talkingDataAppID", "") of
			"" ->
				?LOG_OUT("talkingDataAppID has no,function shutdown"),
				undefined;
			AppID ->
				"http://api.talkinggame.com/api/charge/"++AppID
		end,
	
	AreaID = 
		case gsMainLogic:getDBID4GS() of
			ID when erlang:is_integer(ID) ->
				erlang:integer_to_list(ID);
			_ ->
				""
		end,
	RealName = 
		case gsMainLogic:getAreaName() of
			Name when erlang:is_list(Name) ->
				Name;
			_ ->
				""
		end,
	DBIDName = AreaID ++ "_" ++ RealName,
	DBIDNameBin = erlang:list_to_binary(DBIDName),
	?LOG_OUT("talkingdata gamedbid ~ts",[ erlang:binary_to_list(DBIDNameBin) ]),
	{noreply, State#state{talkingdataChargeApi=URL,gameDBID = DBIDNameBin}};

%%dbs连接成功
dealInfo({alreadyConnectDBServer,_Pid,{}}, State)->
	?LOG_OUT("alreadyConnectDBServer[~w]",[?MODULE]),
	
	{noreply, State};

%%向talkingdata发送充值记录
dealInfo({toTalkData,_Pid,{OrderID,UserID,AmmountIn,OS,CurrencyType,Level}=Debug}, 
		 #state{
				talkingdataChargeApi=URL,
				gameDBID  = AreaIDBinStr
				} = State)->
	?DEBUG_OUT("toTalkData[~p]",[Debug]),
	
	CurrencyTypeBinStr = getRightCurrency(CurrencyType),
	
	Request_Body = makeRequestJson(OrderID,UserID,AmmountIn,OS,CurrencyTypeBinStr,AreaIDBinStr,Level),
	postTalkingData(Request_Body,URL,?TD_HTTPC_TIMES),
	
	{noreply, State};

dealInfo(Info, State) ->
	?ERROR_OUT( "~p ~p @~w handle_info ~p", [?MODULE, self(), node(), Info] ),
	{noreply, State}.

%%funcell操蛋，货币类型不是ios国际标识
-spec getRightCurrency(Type::iolist()) ->iolist().
getRightCurrency(<<"RMB">>) ->
	<<"CNY">>;
getRightCurrency(Type) ->
	Type.

%%给talkingData发送json数据(url为undefined就是该功能关了，不发送充值log)
-spec postTalkingData(Request_Body::binary(),URL::string()|undefined,Times::uint())->ok.
postTalkingData(_Request_Body,undefined,_Times)->
	?ERROR_OUT("postTalkingData function shutdown"),
	ok;
postTalkingData(Request_Body,URL,Times) when Times > 0 ->
	try
		Request_Type = "application/json; charset=utf8",
		Request_Header = [{"Content-Type","application/json; charset=utf8"}],
		?LOG_OUT("postTalkingData:~p,~p",[Request_Body,URL]),
		case httpc:request(post, {URL, Request_Header, Request_Type, Request_Body}, 
							[{connect_timeout,1000*5},{timeout,1000*5}],[{sync,true}]) of
			{error, Reason} ->
				?ERROR_OUT("postTalkingData error ~p",[Reason]),
				postTalkingData(Request_Body,URL,Times - 1);
			{ok, Result}->
				{_Header, _Options, Content} = Result,
				{ok,JsonObj,_}=rfc4627:decode(zlib:gunzip(Content)),
				?LOG_OUT("postTalkingData get JsonObj:~p",[JsonObj]),
				ok
		end
	catch
		_:Err->
			?ERROR_OUT("postTalkingData catch error[~p] stacktrace:~p",[Err,erlang:get_stacktrace()]),
			postTalkingData(Request_Body,URL,Times - 1)
	end;
postTalkingData(_Request_Body,_URL,_Times) ->
	ok.

%%可以添加参数，这些是必须的还有可选的
%%OS::<<"android">>|<<"ios">>
%%CurrencyType::<<"CNY">>
-spec makeRequestJson(OrderID,FeUserID,AmmountIn,OS,CurrencyType,AreaIDBinStr,Level)->JsonBin when
		  OrderID::string(),FeUserID::string(),AmmountIn::number(),
		  OS:: iolist(),CurrencyType::iolist(),AreaIDBinStr::iolist(),
		  Level::integer(),
		  JsonBin::binary().
makeRequestJson(OrderID,FeUserID,AmmountIn,OS,CurrencyType,AreaIDBinStr,Level)->
	Data = { obj,
				[
					{"msgID",list_to_binary("1001")},
					{"status",list_to_binary("success")},
					{"OS",OS},
					{"accountID", list_to_binary(FeUserID)},
					{"orderID",OrderID},
					{"currencyAmount",AmmountIn},
					{"currencyType",CurrencyType},
					{"gameServer",AreaIDBinStr},%%大区编号
					{"level",Level},
					{"virtualCurrencyAmount",AmmountIn*?PayRate}
				]
			},
	DataOut = rfc4627:encode(Data),
	ZipData = "[" ++ DataOut ++ "]",
	?LOG_OUT("tailing data ~p makeRequestJson ~p",[Data, ZipData]),
	zlib:gzip(ZipData).