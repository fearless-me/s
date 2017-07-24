%%%-------------------------------------------------------------------
%%% @author zhengzhichun
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. 九月 2014 19:53
%%%-------------------------------------------------------------------
-module(funcell).
-include("lsInc.hrl").
-author("Administrator").
-include("globalSetup.hrl").
-define(HTTPC_AUTH_TIMEOUT,1000*3).%%http请求超时设置S
-define(HTTP_BODY,{
	{_,200,_},
	_Head,
	Body
}).
%% API
-export([httpPost/2, httpPost/3]).
-export([getLogin/2,getPay/3,getBindPhone/5]).


%%请求funcell充值验证
%% [{
%% “currency_amount”:100,// 实际支付金额 元	
%% “item_amount”:1,//购买了多少个
%% “amount”:100,//实际多少个骷髅
%% “gift”:100,//赠送多少个骷髅
%% “status”:3,//状态  在3的时候可以做发货处理
%% “oderid”:"11111",// 唯一订单号
%% “category”:"cash"// 类型为骷髅(增值货币)
%% “item_code”:”1212312”
%% }]
-spec getPay(Token::string(), FuncellCilentID, FuncellOrderID) ->
	{FuncellOrderID,skip} |{FuncellOrderID,{err,httpc|funcell|erlangcatch}}| {FuncellOrderID,tuple()} when
	FuncellCilentID::string(),FuncellOrderID::string().
getPay(Token, FuncellCilentID, FuncellOrderID) ->
	try
		DataCenterNode = config:getString("DataCenterNode", "szdc"),
		PlatformType = config:getString("PlatformType", "553"),
		Url = getPayUrl(FuncellCilentID,DataCenterNode,PlatformType),
		UrlAction = lists:concat([Url,"confirm/"]),
		FuncellOrderIDStr = lists:concat(["[\"",FuncellOrderID,"\"]"]),
		Request_Body =  lists:concat(["action=handle&f_orders=",edoc_lib:escape_uri(FuncellOrderIDStr),"&access_token=",edoc_lib:escape_uri(Token)]),
		Result =
			case httpPost(UrlAction,Request_Body,4) of
				{ok,JsonStr} ->
					case checkPayResult(JsonStr) of
						skip ->
							?ERROR_OUT("pay jsondata has errcode url:~s postdata[~ts]",[UrlAction,Request_Body]),
							{FuncellOrderID,skip};
						CheckOk ->
							{FuncellOrderID,CheckOk}
					end;
				{err,ErrType} ->
					?ERROR_OUT("web request err, url:~s ars:~ts",[UrlAction,Request_Body]),
					{FuncellOrderID,{err,ErrType}}
			end,
		Result
	catch
		_:_ ->
			?ERROR_OUT("pay getPay try catch"),
			{FuncellOrderID,{err,erlangcatch}}
	end.

getLogin(Token) ->
	UrlToken = edoc_lib:escape_uri(Token),
	Url = getAuthUrl(),
	UrlAction = lists:concat([Url,"/verify"]),
	Request_Body =  lists:concat(["access_token=",UrlToken]),
	?DEBUG_OUT("getLogin:~ts?~ts", [UrlAction, Request_Body]),
	Result =
		case httpPost(UrlAction,Request_Body,4) of
			{ok,JsonStr} ->
				case checkAuthResult(JsonStr) of
					skip ->
						?ERROR_OUT("AUTH jsondata has errcode url:~s",[UrlAction]),
						ok;
					CheckOk ->
						CheckOk
				end;
			_ ->
				?ERROR_OUT("web request err, url:~s",[UrlAction]),
				skip
		end,
	?DEBUG_OUT("getLogin result:~p", [Result]),
	Result.

%%请求funcell登录验证
-spec getLogin(Token,FuncellCilentID) -> skip | tuple() when Token::string(),FuncellCilentID::string().
getLogin(Token, FuncellCilentID) ->
	DataCenterNode = config:getString("DataCenterNode", "szdc"),
	PlatformType = config:getString("PlatformType", "553"),
	UrlToken = edoc_lib:escape_uri(Token),
	Url = getAuthUrl(FuncellCilentID,DataCenterNode,PlatformType),
	UrlAction = lists:concat([Url,"verify/"]),

	Request_Body =  lists:concat(["access_token=",UrlToken]),

	Result =
		case httpPost(UrlAction,Request_Body,4) of
			{ok,JsonStr} ->
				case checkAuthResult(JsonStr) of
					skip ->
						?ERROR_OUT("AUTH jsondata has errcode url:~s",[UrlAction]);
					CheckOk ->
						CheckOk
				end;
			_ ->
				?ERROR_OUT("web request err, url:~s",[UrlAction]),
				skip
		end,
	Result.
%%请求绑定手机
-spec getBindPhone(FuncellCilentID,Token, PhoneNum, Verifyid, Content) -> skip | tuple() when
	FuncellCilentID::string(),Token::string(),PhoneNum::uint64(),Verifyid::string(),Content::string().
getBindPhone(FuncellCilentID,AccToken, PhoneNum, Verifyid, Content) ->
	?DEBUG_OUT("FuncellCilentID=~p,AccToken=~p, PhoneNum=~p, Verifyid=~p, Content=~p",
		[FuncellCilentID,AccToken, PhoneNum, Verifyid, Content]),
	DataCenterNode = config:getString("DataCenterNode", "szdc"),
	PlatformType = config:getString("PlatformType", "553"),
	Url = getAuthUrl(FuncellCilentID,DataCenterNode,PlatformType),
	UrlAction = lists:concat([Url,"bind/"]),
	Request_Body =  lists:concat(["access_token=",AccToken,"&type=bindphone&tell=",PhoneNum,"&content=",Content,"&verifyid=",Verifyid]),
	Result =
		case httpPost(UrlAction,Request_Body) of
			{ok,JsonStr} ->
				case checkBindResult(JsonStr) of
					skip ->
						?ERROR_OUT("Bind jsondata error url:~s",[UrlAction]),
						skip;
					{failed, ErrorMessage} ->
						{failed, ErrorMessage};
					{success, Message} ->
						{success, Message}
				end;
			_ ->
				?ERROR_OUT("web request err, url:~s",[UrlAction]),
				skip
		end,
	Result.
%% http post
-spec httpPost(Url,SendData) -> {ok,Body} | {err,httpc|funcell|erlangcatch} when
	Url::string(),SendData::string(),Body::string().
httpPost(Url,SendData) ->
	inets:start(),
	case lists:sublist(Url, 5) of
		"https" ->
			ssl:start();
		_ ->
			skip
	end,
	RequestHeader = [{"Content-Type","application/json; charset=utf8"}],
	RequestType = "application/x-www-form-urlencoded",
	Result =
		try
			case httpc:request(post,{Url,RequestHeader, RequestType, SendData},[{connect_timeout,?HTTPC_AUTH_TIMEOUT},{timeout,?HTTPC_AUTH_TIMEOUT}],[{sync,true}]) of
				{ok,?HTTP_BODY} ->
					{ok,Body};
				{error, Reason} ->
					?ERROR_OUT("httpPost error=~p,postInfo=~p",[Reason,{Url,RequestHeader, RequestType, SendData}]),
					{err,httpc};
				Other ->
					?ERROR_OUT("httpc return not ok:~p;postInfo:~p",[Other,{Url,RequestHeader, RequestType, SendData}]),
					{err,funcell}
			end
		catch
			Err:ErrText ->
				?ERROR_OUT("http catch err:~p,~p;postInfo:~p",[Err,ErrText,{Url,RequestHeader, RequestType, SendData}]),
				{err,erlangcatch}
		end,
	Result.

%%可重试的httpPost
-spec httpPost(Url,SendData,Times) -> {ok,Body} | {err,httpc|funcell|erlangcatch} when
	Url::string(),SendData::string(),Body::string(),Times::uint16().
httpPost(Url,SendData,Times) ->
	case httpPost(Url,SendData) of
		{ok,Body} ->
			{ok,Body};
		_ when Times>=1 ->
			httpPost(Url,SendData,Times-1);
		LastReturn ->
			LastReturn
	end.

%%==============================================================
%%内部
%%==============================================================

%%取出funcell充值验证url
-spec getPayUrl(FuncellCilentID,DataCenterNode,PlatformType) -> string() when
	FuncellCilentID::string(),DataCenterNode::string(),PlatformType::string().
getPayUrl(FuncellCilentID,DataCenterNode,PlatformType) ->
	case getUrl(FuncellCilentID,DataCenterNode,PlatformType) of
		{ok,ObjectJson,[]} ->
			{ok,PayUrl} = rfc4627:get_field(ObjectJson, "pay"),
			case erlang:is_binary(PayUrl) of
				true ->
					erlang:binary_to_list(PayUrl);
				_ -> PayUrl
			end;
		_ ->
			""
	end.

%%验证funcell充值接口返回的json结果
-spec checkPayResult(JsonStr) -> skip | tuple() when
	JsonStr::string().
checkPayResult(JsonStr) ->
	case rfc4627:decode(JsonStr) of
		{ok,ObjectJson,[]} ->
			case erlang:is_list(ObjectJson) of
				true ->
					ObjectJson;
				false ->
					?ERROR_OUT("funcell pay return json Err,web ack json[~p]",[ObjectJson]),
					skip
			end;
		_ ->
			?ERROR_OUT("funcell pay return json err[~p]",[JsonStr]),
			skip
	end.

%% 获取登录地址
getAuthUrl() ->
	config:getString("LoginUrl", "http://mainaland.auth.raink.com.cn").

%%取出funcell登录验证url
-spec getAuthUrl(FuncellCilentID,DataCenterNode,PlatformType) -> string() when
	FuncellCilentID::string(),DataCenterNode::string(),PlatformType::string().
getAuthUrl(FuncellCilentID,DataCenterNode,PlatformType) ->
	case ets:lookup(?GlobalSetupTable, {authUrl,FuncellCilentID}) of
		[{_,AuthUrlEts}] ->
			AuthUrlEts;
		[] ->
			case getUrl(FuncellCilentID,DataCenterNode,PlatformType) of
				{ok,ObjectJson,[]} ->
					{ok,AuthUrl} = rfc4627:get_field(ObjectJson, "auth"),
					UrlStr =
						case erlang:is_binary(AuthUrl) of
							true ->
								erlang:binary_to_list(AuthUrl);
							_ -> AuthUrl
						end,
					globalSetup:insert({authUrl,FuncellCilentID},UrlStr),
					UrlStr;
				_ ->
					"undefine"
			end
	end.

%%验证funcell登录接口返回的json结果
-spec checkAuthResult(JsonStr) -> skip | tuple() when
	JsonStr::string().
checkAuthResult(JsonStr) ->
	case rfc4627:decode(JsonStr) of
		{ok,ObjectJson,[]} ->
			case rfc4627:get_field(ObjectJson, "error_code") of
				{ok,ErrCode} ->
					?ERROR_OUT("funcell auth return json ErrCode[~p],web ack json[~p]",[ErrCode,JsonStr]),
					skip;
				not_found ->%没有返回错误码（正确）
					{ok,Account} = rfc4627:get_field(ObjectJson, "account"),
					{ok,Platform} = rfc4627:get_field(ObjectJson, "platform"),
					{ok,ClientID} = rfc4627:get_field(ObjectJson, "client_id"),
					{ok,Fgi} = rfc4627:get_field(ObjectJson, "fgi"),
					%% 			{ok,_ExtParam} = rfc4627:get_field(ObjectJson, "extParam"),
					{Account,Platform,ClientID,Fgi}
			end;
		_ ->
			?ERROR_OUT("funcell auth return json err[~p]",[JsonStr]),
			skip
	end.
%%验证funcell绑定手机邮箱返回结果
-spec checkBindResult(JsonStr) -> skip | tuple() when
	JsonStr::string().
checkBindResult(JsonStr) ->
	case rfc4627:decode(JsonStr) of
		{ok,ObjectJson,[]} ->
			{ok, _Message} = rfc4627:get_field(ObjectJson, "message"),
			case rfc4627:get_field(ObjectJson, "error_code") of
				{ok,ErrCode} ->
					case string:equal(ErrCode, <<"P1111">>) of
						true ->
							{success, ErrCode};
						_ ->
							{failed, ErrCode}
					end;
				not_found ->
					?ERROR_OUT("funcell phonenum return json err[~p]",[JsonStr]),
					skip
			end;
		_ ->
			?ERROR_OUT("funcell phonenum return json err[~p]",[JsonStr]),
			skip
	end.
%%funcell的各种功能的url(发现服务) 返回auth(登录地址),pay(支付地址)
getUrl(FuncellCilentID,DataCenterNode,_PlatformType) ->
	EveUrl = config:getString("EveUrl", "http://mainaland.eve.raink.com.cn/config/"),
	RequestUrl = lists:concat([EveUrl,FuncellCilentID,"/",DataCenterNode]),
	Result =
		case httpPost(RequestUrl,"") of
			{ok,JsonStr} ->
				case rfc4627:decode(JsonStr) of
					{ok,ObjectJson,[]} = JsonTuple ->
						case rfc4627:get_field(ObjectJson, "error_code") of
							{ok,_} ->
								?ERROR_OUT("Err:getUrl:~s;return string:~s",[RequestUrl,JsonStr]),
								skip;
							_ ->
								JsonTuple
						end;
					_ ->
						skip
				end;
			_ ->
				skip
		end,
	Result.

