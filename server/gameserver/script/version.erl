-module(version).
-author(tiancheng).

-define(VERSIONSTR, "NewVersion:").

main(_) ->
	File = "../src/version/version.erl",
	{OldVersion, NewVersion} = getVersion(File),
	String = getString(OldVersion, NewVersion),
	file:write_file(File, list_to_binary(String)),
	ok.

getString(OldVersion, NewVersion) ->
	Time = time_format(),
	io_lib:format("%%~ts~p
%%OldVersion:~p
%%this file auto generate !!!
%%this file auto generate !!!
%%this file auto generate !!!
%%UpdateTime:~ts
-module(version).
-author(tiancheng).
-export([getVersion/0]).
getVersion() -> ~p.", [?VERSIONSTR, NewVersion, OldVersion, Time, NewVersion]).

time_format() -> time_format(os:timestamp()).
time_format(Now) ->
	{{Y, M, D}, {H, MM, S}} = calendar:now_to_local_time(Now),
	time_format1(Y, M, D, H, MM, S).
time_format1(Y, M, D, H, MM, S) ->
	lists:concat([Y, "-", one_to_two(M), "-", one_to_two(D), " ",
		one_to_two(H), ":", one_to_two(MM), ":", one_to_two(S)]).
one_to_two(One) -> io_lib:format("~2..0B", [One]).

getVersion(File) ->
	Old = getOldVersion(File),
	Svn = getSvnVersion(),
	NewVersion =
		case Old =:= Svn of
			true ->
				Svn + 1;
			_ ->
				%% 不相等则取大的，如果大的正好是老的，则+1
				case erlang:max(Old, Svn) of
					Old -> Old + 1;
					V -> V
				end
		end,
	{Old, NewVersion}.

getOldVersion(File) ->
	case file:open(File, [binary,raw]) of
		{ok, IoDevice} ->
			Ret =
				case file:read_line(IoDevice) of
					{ok, Data} ->
						case binary:matches(Data, [<<?VERSIONSTR>>]) of
							[{S, L}] ->
								{_Left, Right} = erlang:split_binary(Data, S + L),
								Right2 = string_strip(binary:bin_to_list(Right)),
								Right3 = string_strip(Right2, "\r\n"),
								list_to_integer(Right3);
							_ ->
								0
						end;
					_ ->
						0
				end,
			file:close(IoDevice),
			Ret;
		_ ->
			0
	end.

string_strip(Str)-> string:strip(Str).
string_strip(Str, [])->
	Str;
string_strip(Str, [CH | L])->
	string_strip(string:strip(Str, both, CH), L).

getSvnVersion() ->
	Data = os:cmd("cd ../../" ++ " && svn info"),
	Line = getLine(Data,11),
	Pos = string:chr(Line, $:),
	Len = erlang:length(Line),
	S = string:right(Line, Len - Pos - 1),
	Ver = erlang:list_to_integer(S),
	Ver.

getLine(String,N) ->
	getLine(String,1,N).

getLine([],_,_) ->
	ok;
getLine(String,N,N) ->
	Pos = string:str(String, "\n"),
	string:left(String, Pos - 2);
getLine(String,I,N) ->
	Pos = string:str(String, "\n"),
	RemainStr = string:substr(String, Pos + 1),
	getLine(RemainStr,I + 1,N).