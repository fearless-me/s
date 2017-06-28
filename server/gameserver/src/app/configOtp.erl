%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 19. 六月 2017 16:34
%%%-------------------------------------------------------------------
-module(configOtp).
-author(tiancheng).

-behaviour(myGenServer).

-include("gsInc.hrl").

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([
	init/1,
	handle_call/3,
	handle_cast/2,
	handle_info/2,
	terminate/2,
	code_change/3,
	handle_exception/3
]).

-define(SERVER, ?MODULE).

-record(state, {}).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the server
%%
%% @end
%%--------------------------------------------------------------------
-spec(start_link() ->
	{ok, Pid :: pid()} | ignore | {error, Reason :: term()}).
start_link() ->
	myGenServer:start_link({local, ?PsNameConfigOtp}, ?MODULE, [], []).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Initializes the server
%%
%% @spec init(Args) -> {ok, State} |
%%                     {ok, State, Timeout} |
%%                     ignore |
%%                     {stop, Reason}
%% @end
%%--------------------------------------------------------------------
-spec(init(Args :: term()) ->
	{ok, State :: #state{}} | {ok, State :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term()} | ignore).
init([]) ->
	List = config:getConfigList(),
	F =
		fun({File, EtsName}) ->
			ets:new(EtsName, [public, set, named_table, {keypos, #recConfigValue.key}]),
			loadConfigFileToEts(EtsName, File)
		end,
	lists:foreach(F, List),
	{ok, #state{}}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling call messages
%%
%% @end
%%--------------------------------------------------------------------
-spec(handle_call(Request :: term(), From :: {pid(), Tag :: term()},
	State :: #state{}) ->
	{reply, Reply :: term(), NewState :: #state{}} |
	{reply, Reply :: term(), NewState :: #state{}, timeout() | hibernate} |
	{noreply, NewState :: #state{}} |
	{noreply, NewState :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term(), Reply :: term(), NewState :: #state{}} |
	{stop, Reason :: term(), NewState :: #state{}}).
handle_call(_Request, _From, State) ->
	{reply, ok, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling cast messages
%%
%% @end
%%--------------------------------------------------------------------
-spec(handle_cast(Request :: term(), State :: #state{}) ->
	{noreply, NewState :: #state{}} |
	{noreply, NewState :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term(), NewState :: #state{}}).
handle_cast(_Request, State) ->
	{noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling all non call/cast messages
%%
%% @spec handle_info(Info, State) -> {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
-spec(handle_info(Info :: timeout() | term(), State :: #state{}) ->
	{noreply, NewState :: #state{}} |
	{noreply, NewState :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term(), NewState :: #state{}}).
handle_info(_Info, State) ->
	{noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
%%
%% @spec terminate(Reason, State) -> void()
%% @end
%%--------------------------------------------------------------------
-spec(terminate(Reason :: (normal | shutdown | {shutdown, term()} | term()),
	State :: #state{}) -> term()).
terminate(_Reason, _State) ->
	ok.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Convert process state when code is changed
%%
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%% @end
%%--------------------------------------------------------------------
-spec(code_change(OldVsn :: term() | {down, term()}, State :: #state{},
	Extra :: term()) ->
	{ok, NewState :: #state{}} | {error, Reason :: term()}).
code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%%%===================================================================
%%% Internal functions
%%%===================================================================
loadConfigFileToEts(EtsName, File) ->
	case file:read_file(File) of
		{ok,Data} ->
			parse_config(Data, EtsName),
			?LOG_OUT("Load file:~ts success, ets:~p", [File, EtsName]);
		Error ->
			throw(Error)
	end.

parse_config(Data, EtsName) ->
	BOM = binary:part(Data, 0, 3),
	case BOM of
		<<16#EF,16#BB,16#BF>> ->
			{_,Bin} = erlang:split_binary(Data, 3);
		_ ->
			Bin = Data,
			throw("Error Config Data Encoding,Only support UTF8+BOM")
	end,
	parse_lines(Bin, EtsName, 1).

parse_lines(Data, EtsName, Index) ->
	Found = binary:match(Data, [<<"\r\n">>,<<"\n">>,<<"\r">>]),
	case Found of
		{Pos,Len} ->
			{LineData, Left} = split_to_line(Data,Pos,Len),
			NewIndex =
				case Pos > 0 of
					true ->
						parse_one_line(LineData, EtsName, Index);
					_ ->
						Index
				end,
			parse_lines(Left, EtsName, NewIndex);
		nomatch ->
			%%没找到，可能是最后一行
			case erlang:size(Data) > 0 of
				true ->
					parse_one_line(Data, EtsName, Index);
				_ ->
					Index
			end
	end.

split_to_line(Data,Pos,Len) ->
	{Line,Left} = erlang:split_binary(Data, Pos + Len),
	{LineData,_} = erlang:split_binary(Line,Pos),
	{LineData,Left}.

parse_one_line(Line, EtsName, Index) ->
	%%仅支持整行注释
	NewLine =
		case re:run( Line,"^(//|#|;)") of
			nomatch ->
				Line;
			_ ->
				<<>>
		end,
	case NewLine of
		<<>> ->
			Index;
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
					ets:insert(EtsName, #recConfigValue{key = K, value = V, index = Index}),
					Index + 1;
				Num =:= 0 ->
					Index;
				Num > 1 ->
					Index
			end
	end.