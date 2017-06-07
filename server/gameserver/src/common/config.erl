%%
%%%读取配置文件模块

-module(config).
-author(zhongyuanwei).

-behaviour(myGenServer).

-include("logger.hrl").

%% ====================================================================
%% API functions
%% ====================================================================

%% 外部RPC调用
-export([rpc_get_int/2,
		 rpc_try_get_int/2,
		 rpc_get_string/2,
		 rpc_try_get_string/2,
		 rpc_reload/0
		]).

%%导出为内部使用
-export([start_link/1]).
-export([init/1,
		 handle_call/3,
		 handle_cast/2,
		 handle_info/2,
		 terminate/2,
		 code_change/3,
		 handle_exception/3
		]).

start_link(FileName) when erlang:is_list(FileName)->
	myGenServer:start_link({local,?MODULE}, ?MODULE, FileName,[]).

%重新读取文件
rpc_reload() ->
	gen_server:call(?MODULE, {reload},5000).
	
rpc_get_int(Key,Default) when erlang:is_list(Key)->
	Ret = rpc(Key),
	{Int,_} = string:to_integer(Ret),
	case Int of
		0 ->
			Default;
		_ ->
			Int
	end.

rpc_try_get_int(Key,Default) when erlang:is_list(Key) ->
	Ret = rpc_try(Key),
	case Ret of
		{_,_,_} ->
			Default;
		[] ->
			Default;
		_ ->
			{Int,_} = string:to_integer(Ret),
			case Int of
				0 ->
					Default;
				_ ->
					Int
			end
	end.

rpc_get_string(Key,Default) when erlang:is_list(Key) ->
	case rpc(Key) of
		"" ->
			Default;
		Any ->
			Any
	end.

rpc_try_get_string(Key,Default) when erlang:is_list(Key) ->
	Ret = rpc_try(Key),
	case Ret of
		{_,_,_} ->
			Default;
		_ ->
			Ret
	end.

init([]) ->
	{ok,{1,dict:new()}};
init(FileName) ->
	erlang:process_flag(trap_exit, true),
	?LOG_OUT("config init,Read Cfg File:~p",[FileName]),
	put('ConfigFileName',FileName),
	DictHandle = dict:new(),
	NewDictHandle = read_config(FileName,DictHandle),
	ServerId = 
		case dict:find("ServerId", NewDictHandle) of
			{ok,Value}->
				Value;
			_->
				throw("Error Config Data,No ServerId")
		end,
	?LOG_OUT("config init ok"),
	{ok,{ServerId,NewDictHandle}}.

handle_call({get,Key}, _From, {ServerId,DictHandle}) ->
	Ret = 
		case Key =:= "ServerId" of
			true->ServerId;
			_->
				case dict:find(Key, DictHandle) of
					{ok,Value}->Value;
						_->
							?ERROR_OUT("serverCfg can not find the Key:[~p]",[Key]),
							""
				end
		end,
			  
    {reply, {ok,Ret}, {ServerId,DictHandle}};

handle_call({reload}, _From, {ServerId,DictHandle}) ->
	FileName = get('ConfigFileName'),
	case FileName of
		undefine ->
			{ reply, {failed,"Unknow FileName"},{ServerId,DictHandle} };
		_ ->
			try
				NewDictHandle = read_config(FileName,DictHandle),
				NewServerId = 
				case dict:find("ServerId", NewDictHandle) of
					{ok,Value}->Value;
					Error->throw(Error)
				end,
				{reply,{ok}, {NewServerId,NewDictHandle}}
			catch
				_:Why ->
					{reply,{failed,Why},{ServerId,DictHandle}}
			end
	end.

handle_cast(_Msg, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

handle_info(Info,State) ->
	?ERROR_OUT("unhandle info:[~p] in [~p] [~p,~p]",[Info,node(),?MODULE,self()]),
	{noreply,State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%% ====================================================================
%% Internal functions
%% ====================================================================
% 根据指定的Key获取相应的值
% @spec rpc_get(Key) -> Value | ""
rpc(Key) ->
	Ret = gen_server:call(?MODULE, {get,Key},5000),
	case Ret of
		{ok,Value} ->
			Value;
		_ ->
			""
	end.

% 根据指定的Key获取相应的值
% @spec rpc_get(Key) -> Value | "" | exception
rpc_try(Key) ->
	try
		rpc(Key)
	catch
		A:Why ->
			{A,Why,erlang:get_stacktrace()}
	end.

read_config(FileName,DictHandle) ->
	case file:read_file(FileName) of
		{ok,Data} ->
			parse_config(Data,DictHandle);
		Error ->
			throw(Error)
	end.

split_to_line(Data,Pos,Len) ->
	{Line,Left} = erlang:split_binary(Data, Pos + Len),
	{LineData,_Spliter} = erlang:split_binary(Line,Pos),
	{LineData,Left}.

parse_one_line(Line,DictHandle) ->
	%%仅支持整行注释
	NewLine = 
	case re:run( Line,"^(//|#|;)") of
		nomatch ->
			Line;
		_ ->
			<<>>
	end,
	NewDictHandle = 
	case NewLine of
		<<>> ->
			DictHandle;
		_ ->
			%找=号
			Found = binary:matches(NewLine,[<<"=">>]),
			Num = erlang:length(Found),
			if
				Num =:= 1 ->
					[{Pos,Len}] = Found,
					{Key,Left} = erlang:split_binary(NewLine, Pos),
					{_,Value} = erlang:split_binary(Left,Len),
					%删除两边的空格
					K1 = string:strip(binary:bin_to_list(Key)),
					V1 = string:strip(binary:bin_to_list(Value)),
					%删除两边的制表符
					K = string:strip(K1,both,9),
					V = string:strip(V1,both,9),
					?DEBUG_OUT("~s = ~s",[K,V]),
					dict:store(K, V, DictHandle);
				Num =:= 0 ->
					DictHandle;
				Num > 1 ->
					error
			end
	end,
	NewDictHandle.

parse_lines(Data,DictHandle) ->
	Found = binary:match(Data, [<<"\r\n">>,<<"\n">>,<<"\r">>]),
	case Found of
		{Pos,Len} ->
			{LineData,Left} = split_to_line(Data,Pos,Len),
			if
				Pos > 0 ->
					NewDictHandle = parse_one_line(LineData,DictHandle);
				true ->
					NewDictHandle = DictHandle
			end,
			parse_lines(Left,NewDictHandle);
		nomatch ->
			%%没找到，可能是最后一行
			case erlang:size(Data) > 0 of
				true ->
					parse_one_line(Data,DictHandle);
				_ ->
					DictHandle
			end
	end.

parse_config(Data,DictHandle) ->
	BOM = binary:part(Data, 0, 3),
	case BOM of
		<<16#EF,16#BB,16#BF>> ->
			{_,Bin} = erlang:split_binary(Data, 3);
		_ ->
			Bin = Data,
			throw("Error Config Data Encoding,Only support UTF8+BOM")
	end,
	parse_lines(Bin,DictHandle).

