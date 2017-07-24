%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. 七月 2017 20:58
%%%-------------------------------------------------------------------
-module(biInterface).
-author("Administrator").
-include("lsInc.hrl").
-author("Administrator").
-include("globalSetup.hrl").
-include("setupLang.hrl").

-define(HTTP_AUTH_TIMEOUT,1000*3).%%http请求超时设置S
-define(ACU_TIME, 5*60*1000).
%% API
-export([
	acuToBi/2
]).

-ifdef(RELEASE).
acuToBi(Online,TickTime)->
	try
		case needSync(TickTime) of
			true ->
				%% 不能阻碍上层逻辑进程
				erlang:spawn(
					fun()->
						try
							syncAcuToBi(Online)
						catch
						   _ : Err  -> ?WARN_OUT("acuToBi error:~p",[Err])
						end
					end);
			_ ->
				skip
		end
	catch
	   _ : _  -> skip
	end,
	ok.
-else.
acuToBi(_Online,_TickTime)->ok.
-endif.

needSync(TickTime)->
	case get(acuToBiTime) of
		undefined ->
			put(acuToBiTime, TickTime),
			false;
		V ->
			case V + TickTime >= ?ACU_TIME of
				true ->
					put(acuToBiTime, 0),
					true;
				_ ->
					put(acuToBiTime, V + TickTime),
					false
			end
	end.

%% 这个必须可被跨进程访问
syncAcuToBi(Online)->
	BiUrl = getBiUrl(),
	Area = getCountryTAG(),
	ChannelID = "yumo",
	ServerID = gsMainLogic:getADBID4GS() * 10000 + gsMainLogic:getDBID4GS(),
	TimeStamp = time2:getTimestampMS(),
	GameID = config:getInt("GameID", 165),

%%	SendData = "[{\"headers\":{\"sign\":\"Online\",\"area\":\"China\",\"gameID\":\"165\"},\"body\":\"165~@China~@yumo~@10998~@0~@1500540589408\"}]",

	SendData = lists:concat([
		"[{\"headers\":{\"sign\":\"Online\",\"area\":\"",
		makeStrStr(Area),
		"\",\"gameID\":\"", makeStr(GameID),
		"\"},\"body\":\"", makeStr(GameID),
		makeParamStr(Area),
		makeParamStr(ChannelID),
		makeParams(ServerID),
		makeParams(Online),
		makeParams(TimeStamp),
		"\"}]"
		]),
	%% 必须要转换一下
	SendData2 = binary_to_list(list_to_binary(SendData)),
	?DEBUG_OUT("url:~ts,data=~ts",[BiUrl, SendData2]),
	httpPost(BiUrl, SendData2),
	ok.

makeParamStr(Val)->
	io_lib:format("~~@~ts", [Val]).

makeParams(Val)->
	io_lib:format("~~@~p", [Val]).

makeStr(Val)->
	io_lib:format("~p", [Val]).

makeStrStr(Val) ->
	io_lib:format("~ts", [Val]).

getBiUrl()->
	config:getString("biInterface", "http://gather-client-data.funcell123.com").


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
			case httpc:request(
				post,
				{Url,RequestHeader, RequestType, SendData},
				[{connect_timeout,?HTTP_AUTH_TIMEOUT},{timeout,?HTTP_AUTH_TIMEOUT}],
				[{sync,true}]
			) of
				{ok,{{_,200,_}, _Head, Body}} ->
					{ok,Body};
				{error, Reason} ->
					?ERROR_OUT("httpPost error=~ts,postInfo=~ts",
						[Reason,{Url,RequestHeader, RequestType, SendData}]),
					{err,httpc};
				Other ->
					?ERROR_OUT("httpc return not ok:~ts;postInfo:~ts",
						[Other,{Url,RequestHeader, RequestType, SendData}]),
					{err,funcell}
			end
		catch
			Err:ErrText ->
				?ERROR_OUT("http catch err:~p,~p;postInfo:~p",
					[Err,ErrText,{Url,RequestHeader, RequestType, SendData}]),
				{err,erlangcatch}
		end,
	Result.

%%China	中国	Etc/GMT-8
%%Europe	欧洲	Etc/GMT
%%Indonesia	印尼	Etc/GMT-7
%%Japan	日本	Etc/GMT-9
%%Korea	韩国	Etc/GMT-9
%%Malaysia	马来西亚	Etc/GMT-8
%%Russia	俄罗斯	Etc/GMT-3
%%Singapore	新加坡	Etc/GMT-8
%%Taiwan	中国台湾	Etc/GMT-8
%%Thailand	泰国	Etc/GMT-7
%%Vietnam	越南	Etc/GMT-7
getCountryTAG() ->
	case ?Cur_Lang of
		?Lang_CHS -> "China";
		?Lang_CHT -> "Taiwan";
		?Lang_KOR -> "Korea";
		true ->
			"China"
	end.