%% Author: luowei
%% Created: 2014-3-27
%% Description: TODO: Add description to update
-module(update).

%%
%% Include files
%%
-include_lib("kernel/include/file.hrl").
-include("logger.hrl").

-define(UpdateLogFile, "../data/Log/").
%%
%% Exported Functions
%%
-export([
	c/0,
	c2/0,
	u/0,
	c/1,
	u/1,
	a/0
]).

%%
%% API Functions
%%

a()->
	c(),
	u(),
	ok.

-spec  c() -> ok.
c() ->
    c(5).
c(S) when erlang:is_integer(S) ->
	enter_ebin(),
	case file:list_dir(".") of
		{ok, FileList} -> 
			Files = getNewFile(FileList, S * 60),
			info("---------check modules---------~n~w~n=========updated modules=========", [Files]);
		Why -> 
			info("Error Dir: ~w", [Why])
	end,
	exit_ebin(),
    ok;
c(S) -> 
	info("ERROR======> Badarg ~p ~n", [S]),
	ok.

-spec  c2() -> ok.
c2() ->
    c2(5).
c2(S) when erlang:is_integer(S) ->
	enter_rebar3_ebin(),
	case file:list_dir(".") of
		{ok, FileList} ->
			Files = getNewFile(FileList, S * 60),
			info("---------check modules---------~n~w~n=========updated modules=========", [Files]);
		Why ->
			info("Error Dir: ~w", [Why])
	end,
	exit_rebar3_ebin(),
    ok;
c2(S) ->
	info("ERROR======> Badarg ~p ~n", [S]),
	ok.

-spec  u() -> ok.
u() ->
    u(15).
u(S) when is_number(S) ->
	enter_ebin(),
    case file:list_dir(".") of
        {ok, FileList} -> 
            Files = getNewFile(FileList, S * 60 + 3),
			case Files of
				[] ->
					skip;
				_ ->
					Time = getTime(),
					writeFile(Time),
					load(Files)
			end;
        Any -> info("Error Dir: ~w", [Any])
    end,
	exit_ebin(),
	ok;

u(Files) when is_list(Files) ->
	writeLogHeader(),
	load(Files); 

u(_) -> 
	info("ERROR======> Badarg", []),
    ok.

enter_ebin() ->
	c:cd("../ebin/"),
	ok.
exit_ebin() ->
	c:cd("../data/"),
	ok.
enter_rebar3_ebin() ->
	c:cd("../_build/default/lib/gameserver/ebin"),
	ok.
exit_rebar3_ebin() ->
	c:cd("../../../../../data/"),
	ok.

writeLogHeader() ->
	Time = getTime(),
	writeFile(Time),
	ok.

writeLogFile(FileName,Result) ->
	{ok, #file_info{mtime = {{Y,M,D},{H,MM,S}}}} = file:read_file_info(FileName),
	{ok, Binary} = file:read_file(FileName),
	MD5String = md5:encrypt(Binary),

	case Result of
		true ->
			Str = getStr("loaded: ~ts, ~ts, ~ts OK!", [FileName,  time_format1(Y, M, D, H, MM, S), MD5String]),
			writeFile(Str),
			info("loaded: ~ts OK!", [FileName]);
		_ ->
			Str = getStr("loaded: ~ts, ~ts, ~ts Failed:~p!", [FileName, time_format1(Y, M, D, H, MM, S), MD5String,Result]),
			writeFile(Str),
			info("loaded: ~ts Failed!", [FileName])
	end.

%%
%% Local Functions
%%

getNewFile(Files, S) ->
	getNewFile(Files, S, []).
getNewFile([], _S, Result) -> Result;
getNewFile([H | T], S, Result) ->
	NewResult = case string:tokens(H, ".") of
					[Left, Right] when Right =:= "beam" ->
						case file:read_file_info(H) of
							{ok, FileInfo} -> 
								Now = calendar:local_time(),
								{Days, Times} = calendar:time_difference(FileInfo#file_info.mtime, Now),	
								Seconds = calendar:time_to_seconds(Times), 
								case Days =:= 0 andalso Seconds < S of
									true ->
										FileName = list_to_atom(Left),
										[FileName | Result];
									false ->
										Result
								end;
							_Error ->
								Result
						end;
					_ ->
						Result
				end,
	getNewFile(T, S, NewResult).

load([]) -> 
	writeFile("\n\n");
load([Module | T]) ->
	code:purge(Module),
	case code:get_object_code(Module) of
		{Module, Binary, FileName} ->
			Result = case code:load_binary(Module, FileName, Binary) of
				         {module, Module} ->
					         true;
				         {error, What} ->
					         What
			         end,

			writeLogFile(FileName,Result);
		error ->
			Str = getStr("get_object_code ~p fail~n",[Module]),
			writeFile(Str),
			info("get_object_code ~p fail~n",[Module])
	end,
    load(T).

info(V, P) ->
    io:format(V ++ "~n", P).

getTime() ->
	io_lib:format("update time: ~s\t\n", [time_format(os:timestamp())]).

getStr(V, P) ->
	io_lib:format(V ++ "\t\n", P).

writeFile(Str) ->
	{{Y,M,_},{_,_,_}} = calendar:now_to_local_time(os:timestamp()),
	File = lists:concat([?UpdateLogFile, "update", "-",Y,"-",M]),
	file:write_file(File, Str,[append]).

one_to_two(One) -> io_lib:format("~2..0B", [One]).

time_format(Now) -> 
	{{Y,M,D},{H,MM,S}} = calendar:now_to_local_time(Now),
	time_format1(Y, M, D, H, MM, S).
time_format1(Y, M, D, H, MM, S) ->
	lists:concat([Y, "-", one_to_two(M), "-", one_to_two(D), " ", 
						one_to_two(H) , ":", one_to_two(MM), ":", one_to_two(S)]).


