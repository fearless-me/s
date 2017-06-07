%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 自动编译更新
%%% @end
%%% Created : 26. 四月 2017 11:30
%%%-------------------------------------------------------------------
-module(autoCompileUpdate).
-author(tiancheng).

-include("gsInc.hrl").

-record(rec_AutoCompileUpdate, {
	fileName = "",
	changeTime = 0
}).

-define(ETS_AUTO, ets_AutoCompileUpdate).
-define(CheckInterval, 2000).
-define(BreakCheckName, 'BreakCheckName').
-define(CompileOpts, 'CompileOpts').
-define(InitSuccess, 'InitSuccess').

%% API
-export([
	openAutoCompileUpdate/0,
	check_compile_update_tick/0
]).

-export([
	modify_debug_auto_param/1
]).

-ifdef(RELEASE).
openAutoCompileUpdate() -> ok.
modify_debug_auto_param(_Data) -> ok.
check_compile_update_tick() -> ok.
-else.
openAutoCompileUpdate() ->
	ets:new(?ETS_AUTO, [private, named_table, {keypos, #rec_AutoCompileUpdate.fileName}]),
	put(?BreakCheckName, true),
	Success = init(),
	put(?InitSuccess, Success),
	?WARN_OUT("debug init auto compile and update..."),
	ok.
modify_debug_auto_param(Data) ->
	case get(?InitSuccess) of
		true ->
			modify_debug_auto_param2(Data);
		_ ->
			?ERROR_OUT("module init failed, modify failed!")
	end,
	ok.
check_compile_update_tick() ->
	case get(?BreakCheckName) of
		false ->
			check_compile_update_tick2(),

			erlang:send_after(?CheckInterval, self(), check_compile_update_tick);
		_ ->
			?WARN_OUT("AutoCompileUpdate is break off...")
	end.
-endif.

modify_debug_auto_param2(true) ->
	%% 开
	?WARN_OUT("open auto compile and update success!"),
	case get(?BreakCheckName) of
		false ->
			skip;
		_ ->
			put(?BreakCheckName, false),
			erlang:send_after(?CheckInterval, self(), check_compile_update_tick),
			ok
	end,
	ok;
modify_debug_auto_param2(false) ->
	%% 关
	?WARN_OUT("close auto compile and update success!"),
	case get(?BreakCheckName) of
		true ->
			skip;
		_ ->
			put(?BreakCheckName, true),
			ok
	end,
	ok.

init() ->
	try
		IsContinue =
			case file:consult("../auto_rebar.config") of
				{ok, Config} ->
					case lists:keyfind(erl_opts, 1, Config) of
						{_, CompileOtps} ->
							put(?CompileOpts, CompileOtps),
							true;
						_ ->
							false
					end;
				_ ->
					?ERROR_OUT("gameserver dir not found auto_rebar.config"),
					false
			end,
		case IsContinue of
			true ->
				{Hrls, Erls} = scan_all_files(),
				F =
					fun(File) ->
						CTime = getFileChangeTime(File),
						ets:insert(?ETS_AUTO, #rec_AutoCompileUpdate{fileName = File, changeTime = CTime})
					end,
				lists:foreach(F, Hrls),
				lists:foreach(F, Erls),
				ok;
			_ ->
				skip
		end,
		IsContinue
	catch _:Why ->
		?ERROR_OUT("init:~p", [Why]),
		false
	end.

check_compile_update_tick2() ->
	try
		case getChangeErlFiles() of
			false ->
				put(?BreakCheckName, true),
				skip;
			ErlFiles ->
				Opts = get(?CompileOpts),

				F =
					fun({File, CTime}) ->
						Ret = compile:file(File, [return, report_errors, error_summary | Opts]),
						case check_return(Ret) of
							{true, _} ->
								?WARN_OUT("compile file [~ts] success", [File]),

								%% 提取文件名
								FileName = filename:basename(File, ".erl"),
								FileAtom = list_to_atom(FileName),
								case load(FileAtom) of
									true ->
										ets:insert(?ETS_AUTO, #rec_AutoCompileUpdate{fileName = File, changeTime = CTime}),
										ok;
									_ ->
										skip
								end;
							{false, Reason} ->
								?ERROR_OUT("compile file:~ts failed:~ts", [File, Reason])
						end
					end,
				lists:foreach(F, ErlFiles)
		end
	catch
	    _:Why ->
			?ERROR_OUT("check_compile_update_tick2:~p", [Why])
	end,
	ok.

load(Module) ->
	code:purge(Module),
	case code:get_object_code(Module) of
		{Module, Binary, FileName} ->
			case code:load_binary(Module, FileName, Binary) of
				{module, Module} ->
					?WARN_OUT("load file [~p] success", [Module]),
					true;
				{error, What} ->
					?ERROR_OUT("load file error:~p,~p", [Module, What]),
					false
			end;
		error ->
			?ERROR_OUT("load file error:~p", [Module]),
			false
	end.

getChangeErlFiles() ->
	{Hrls, Erls} = scan_all_files(),
	F =
		fun(File, AccL) ->
			CTime = getFileChangeTime(File),
			case ets:lookup(?ETS_AUTO, File) of
				[#rec_AutoCompileUpdate{changeTime = CTime}] ->
					AccL;
				_ ->
					[{File, CTime} | AccL]
			end
		end,
	case lists:foldl(F, [], Hrls) of
		[] ->
			lists:foldl(F, [], Erls);
		ChangeHrls ->
			?ERROR_OUT("found hrl change, exit auto compile and update:~p,~p", [erlang:length(ChangeHrls), ChangeHrls]),
			false
	end.

scan_all_files() ->
	IncludeDir = "../include",
	SrcDir = "../src",

	FileList1 = filelib:fold_files(IncludeDir, ".erl$$", true, fun(File, Acc) -> [File | Acc] end, []),
	FileList2 = filelib:fold_files(SrcDir, ".erl$$", true, fun(File, Acc) -> [File | Acc] end, FileList1),

	FileList3 = filelib:fold_files(IncludeDir, ".hrl$$", true, fun(File, Acc) -> [File | Acc] end, []),
	FileList4 = filelib:fold_files(SrcDir, ".hrl$$", true, fun(File, Acc) -> [File | Acc] end, FileList3),
	{FileList4, FileList2}.

getFileChangeTime(File) ->
	case file:read_file_info(File, [{time, posix}]) of
		{ok, Info} ->
			erlang:element(5, Info);
		_ ->
			?ERROR_OUT("===> read getFileChangeTime:~ts failed", [File]),
			throw(readfileerror)
	end.

check_return({ok,_}) ->
	{true, ""};
check_return({ok, _Mod, []}) ->
	{true, ""};
check_return({ok, _Mod, Binary}) ->
	{true, io_lib:format("~ts", [report_warnings(Binary)])};
check_return({ok, _Mod, _Binary, Warnings}) ->
	{true, io_lib:format("~ts", [report_warnings(Warnings)])};
check_return({error, Errors, Warnings}) ->
	Msg = report_errors(Errors),
	{false, io_lib:format("~ts ~ts", [Msg, report_warnings(Warnings)])};
check_return(error) ->
	{false, "error"};
check_return(_Reason) ->
	{false, "unknow reason"}.

report_errors(Errors) ->
	Es =
		lists:foldl(
			fun({{F, _L}, Eds}, Acc) ->
				list_errors(F, Eds, Acc);
				({F, Eds}, Acc) ->
					list_errors(F, Eds, Acc)
			end, [], Errors),
	lists:flatten(lists:reverse(Es)).

report_warnings(Ws0) ->
	P = "Warning: ",
	Ws = lists:foldl(
		fun({{F, _L}, Eds}, Acc) ->
			format_message(F, P, Eds, Acc);
			({F, Eds}, Acc) ->
				format_message(F, P, Eds, Acc)
		end, [], Ws0),
	lists:flatten(lists:reverse(Ws)).

format_message(F, P, [{none, Mod, E} | Es], Acc) ->
	Msg = io_lib:format("~ts: ~s~ts  ", [ filename:basename(F), P, Mod:format_error(E)]),
	format_message(F, P, Es, [Msg | Acc]);
format_message(F, P, [{{Line, Column} = _Loc, Mod, E} | Es], Acc) ->
	Msg = io_lib:format("~ts:~w:~w ~s~ts  ", [filename:basename(F), Line, Column, P, Mod:format_error(E)]),
	format_message(F, P, Es, [Msg | Acc]);
format_message(F, P, [{Line, Mod, E} | Es], Acc) ->
	Msg = io_lib:format("~ts:~w: ~s~ts  ", [filename:basename(F), Line, P, Mod:format_error(E)]),
	format_message(F, P, Es, [Msg | Acc]);
format_message(F, P, [{Mod, E} | Es], Acc) ->
	%% Not documented and not expected to be used any more, but
	%% keep a while just in case.
	Msg = io_lib:format("~ts: ~s~ts  ", [filename:basename(F), P, Mod:format_error(E)]),
	format_message(F, P, Es, [Msg | Acc]);
format_message(_, _, [], Acc) -> Acc.

list_errors(F, [{none, Mod, E} | Es], Acc) ->
	Msg = io_lib:format("~ts: ~ts  ", [filename:basename(F), Mod:format_error(E)]),
	list_errors(F, Es, [Msg | Acc]);
list_errors(F, [{{Line, Column}, Mod, E} | Es], Acc) ->
	Msg = io_lib:format("~ts:~w:~w: ~ts  ", [filename:basename(F), Line, Column, Mod:format_error(E)]),
	list_errors(F, Es, [Msg | Acc]);
list_errors(F, [{Line, Mod, E} | Es], Acc) ->
	Msg = io_lib:format("~ts:~w: ~ts  ", [filename:basename(F), Line, Mod:format_error(E)]),
	list_errors(F, Es, [Msg | Acc]);
list_errors(F, [{Mod, E} | Es], Acc) ->
	%% Not documented and not expected to be used any more, but
	%% keep a while just in case.
	Msg = io_lib:format("~ts: ~ts  ", [filename:basename(F), Mod:format_error(E)]),
	list_errors(F, Es, [Msg | Acc]);
list_errors(_F, [], Acc) -> Acc.