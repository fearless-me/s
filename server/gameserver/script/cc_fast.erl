#!/usr/bin/env escript
-module(cc_fast).
-author(tiancheng).

-define(IsOnlyChs, 1).
-define(CompileEts, compileEts).
-define(CompileListDEts, compileServerFileListDEts).

-record(rec_serverfile, {
	fileName = "",
	changeTime = 0
}).


main(_) ->
	ets:new(?CompileEts, [public, named_table, {keypos, 1}]),
	dets:open_file(?CompileListDEts,
		[
			{keypos, #rec_serverfile.fileName},
			{type, set},
			{auto_save, 1000},
			{file, "compileListDEtsFile.data"}
		]),
	menu(),
	ok.

-ifdef(IsOnlyChs).
menu() ->
	dispatchInput(1).
-else.
menu() ->
	io:format(
		"~n##########################################################~n"
		"\t\tLUNA multi-language compile~n"
		"~n"
		"\t1.(chs) China~n"
%%		"\t2.(cht) Taiwan~n"
%%		"\t3.(enu) English~n"
%%		"\t4.(kor) Korea~n"
%%		"\t5.(xmt) Malaysia~n"
%%		"\t6.(tha) Thailand~n"
%%		"\t7.(rus) Russia~n"
%%		"\t8.(jpn) Japan~n"
%%		"\t9.(vietnam)  Vietnam~n"
		"~n"
		"\t[0  ].exit~n"
		"\t[888].package~n"
		"~n##########################################################~n~n"
	),
	%% 现在还没有多语言版本
	InputNoStr = io:get_line("Please enter your choice:"),
	{InputNo, _Rest} = string:to_integer(InputNoStr),
	dispatchInput(InputNo).
-endif.

dispatchInput(0) ->
	dets:close(?CompileListDEts),
	ok;
dispatchInput(1) -> menu2(chs);
dispatchInput(2) -> menu2(cht);
dispatchInput(3) -> menu2(enu);
dispatchInput(4) -> menu2(kor);
dispatchInput(5) -> menu2(xmt);
dispatchInput(6) -> menu2(tha);
dispatchInput(7) -> menu2(rus);
dispatchInput(8) -> menu2(jpn);
dispatchInput(9) -> menu2(vietnam);
dispatchInput(888) -> jump_package();
dispatchInput(_) -> menu().

menu2(Lang) ->
	io:format(
		"~n##########################################################~n"
		"\t\tselect compile sub order~n"
		"~n"
		"\t> 1.   gs(release)~n"
		"~n"
		"\t> 11.  gs(debug)~n"
%%		"~n"
%%		"\t> 2.   gs fast(release)~n"
		"\t> 12.  gs fast(debug)~n"
		"~n"
%%		"\t> 23.  Engineer(release)~n"
		"\t> 24.  Engineer(debug)~n"
		"~n"
		"\t> 0.   exit~n"
		"\t> 8.   clean~n"
		"\t> 9.   return main...~n"
		"\t> 888. package~n"
		"~n##########################################################~n~n"
	),
	set_title(Lang, "unknown"),
	InputNoStr = io:get_line("Please enter your choice:"),
	{InputNo, _Rest} = string:to_integer(InputNoStr),
	dispatchInput2(Lang, InputNo).

dispatchInput2(Lang, 1) ->
	setCompileFastParam(undefined),
	compile(Lang, 1);
%%dispatchInput2(Lang, 2) ->
%%	Data = getChangeFileList(),
%%	setCompileFastParam(Data),
%%	timer:sleep(2000),
%%	compile(Lang, 2);
dispatchInput2(Lang, 11) ->
	setCompileFastParam(undefined),
	compile(Lang, 11);
dispatchInput2(Lang, 12) ->
	Data = getChangeFileList(),
	setCompileFastParam(Data),
	timer:sleep(2000),
	compile(Lang, 12);
dispatchInput2(_, 0) ->
	dets:close(?CompileListDEts),
	erlang:halt();
dispatchInput2(_Lang, 888) ->
	jump_package();
dispatchInput2(_Lang, 9) ->
	menu();
dispatchInput2(_Lang, 8) ->
	dets:delete_all_objects(?CompileListDEts),
	os:cmd("cd ../ebin/ && del /q /s *.*"),
	io:format("===> clean success!! <===~n~n"),
	menu();
%%dispatchInput2(Lang, 23) ->
%%	setSearchFileData(undefined),
%%	searchFile(false, {Lang, 23}, scan_all_files());
dispatchInput2(Lang, 24) ->
	setSearchFileData(undefined),
	searchFile(false, {Lang, 24}, scan_all_files());
dispatchInput2(_Lang, _) ->
	menu().

searchFile(false, {Lang, _XH} = Param1, {_HrlFileList, ErlFileList, _Opts} = Param2) ->
	io:format("\t[0] ===> return to main menu~n", []),
	InputNoStr1 = io:get_line("Input search file key words:"),
	InputNoStr2 = string_strip(string_strip(InputNoStr1), "\n"),
	case InputNoStr2 of
		"0" ->
			setSearchFileData(undefined),
			menu2(Lang);
		_ ->
			F =
				fun(File, {IsEnough, {Number, AccL}} = Data) ->
					case Number >= 30 of
						true ->
							{true, {Number, AccL}};
						_ ->
							LowerFile = string:to_lower(File),
							LowerInput = string:to_lower(InputNoStr2),
							case string:str(LowerFile, LowerInput) > 0 of
								true ->
									{IsEnough, {Number + 1, [{Number + 1, File} | AccL]}};
								_ ->
									Data
							end
					end
				end,
			{_, {Num, List}} = foldlEx(F, {false, {0, []}}, ErlFileList),
			case Num > 0 of
				true ->
					FF =
						fun({N, File}) ->
							io:format("[~p] ===> ~ts~n", [N, File])
						end,
					lists:foreach(FF, lists:reverse(List)),
					setSearchFileData(List),
					searchFile(true, Param1, Param2);
				_ ->
					io:format("No search~n"),
					searchFile(false, Param1, Param2)
			end
	end;
	
searchFile(_, {Lang, _XH} = Param1, {_HrlFileList, _ErlFileList, Opts} = Param2) ->
	
	io:format("[*] ===> compile all searched ~p file(s) ~n", [safe_length(getSearchFileData())]),
	io:format("[0] ===> return to main menu~n", []),
	
	InputNoStr1 = io:get_line("Input compile file index:"),
	InputNoStr2 = string_strip(string_strip(InputNoStr1), "\n"),
	case InputNoStr2 of
		"0" ->
			setSearchFileData(undefined),
			menu2(Lang);
		_ ->
			case InputNoStr2 of
				"*" ->
					compileSearchFile(0, Param1, Opts, getSearchFileData());
				_ ->
				case string:to_integer(InputNoStr2) of
					{Index, []} when erlang:is_integer(Index)->
						compileSearchFile(Index, Param1, Opts, getSearchFileData());
					_ ->
						skip
				end			
			end,
			searchFile(false, Param1, Param2)
	end.
	
safe_length(L) when is_list(L) ->
	length(L);
safe_length(_)->
	0.

compileSearchFile(_Index, _Param1, _Opts, undefined)->
	skip;
compileSearchFile(0, {Lang, XH}, Opts, List)->
	FileList = [File || {_, File} <- List],
	setCompileFastParam({true, FileList, Opts, []}),
	compile(Lang, XH);
compileSearchFile(Index, {Lang, XH}, Opts, List)->
	case lists:keyfind(Index, 1, List) of
		{_, File} ->
			setCompileFastParam({true, [File], Opts, []}),
			compile(Lang, XH);
		_ ->
			skip
	end.	


setSearchFileData(Data) ->
	put('SearchFileData', Data).
getSearchFileData() ->
	get('SearchFileData').

foldlEx(_, {true, _} = Accu, _) -> Accu;
foldlEx(F, Accu, [Hd|Tail]) ->
	foldlEx(F, F(Hd, Accu), Tail);
foldlEx(F, Accu, []) when is_function(F, 2) -> Accu.

getCompileServer(1) -> gs;
getCompileServer(2) -> gs;
getCompileServer(23) -> gs;
getCompileServer(11) -> gsD;
getCompileServer(24) -> gsD;
getCompileServer(_) -> gsD.

jump_package() ->
	os:cmd(" cd ../../tools/ && start ps.ers"),
	ok.

compile(Lang, 1) ->
	%% 用于Release编译打包
	Target = getCompileServer(1),
	FileName = io_lib:format("compile_~p_~p.txt", [Lang, Target]),
	file:write_file(FileName, ""),
	CmdStr = io_lib:format("cd ../ && make all Region=\"~p\" -j8 > script/~ts", [Lang, FileName]),

	io:format("compile [~p,~p] start [~ts], please wait...~n", [Lang, Target, time_format()]),
	os:cmd(CmdStr),

	case checkCompileError(FileName) of
		0 ->
			io:format("@@@compile [~p,~p] success@@@ at ~ts ~n", [Lang, Target, time_format()]);
		_ ->
			io:format("***compile [~p,~p] ERROR ERROR ERROR !!!*** ~ts ~n", [Lang, Target, time_format()])
	end,

	menu2(Lang);
compile(Lang, V) ->
	Target = getCompileServer(V),
	ets:delete_all_objects(?CompileEts),

	{Schedulers, LogFile, Opts, FileList} = make_cfg(Lang, Target, V),

	{TaskNum, Ms} = make_worker(FileList, Schedulers, LogFile, Lang, Target, Opts),

	try
		loop_wait(TaskNum),

		compile_done(Ms, LogFile, Lang, Target)
	catch
		_:Why ->
			io:format("***compile [~p,~p] ERROR ERROR ERROR !!!*** ~ts ~p,~p ~n",
				[Lang, Target, time_format(), Why,erlang:get_stacktrace()])
	end,

	menu2(Lang).

checkCompileError(FileName)->
	{ok,Binary} = file:read_file(FileName),
	Content = binary_to_list(Binary),
	case string:str(Content, "recipe for target") of
		0 ->
			string:str(Content, "failed");
		V ->
			V
	end.

loop_wait(0) ->
	skip;
loop_wait(N) ->
	receive
		{'DOWN', _MRef, _process, _Pid, _normal} ->
			ok;
		{'DOWN', MRef, process, Pid, Reason} ->
			io:format("~p|~p finished ~p~n",[Pid, MRef, Reason]);
		{Pid, Result} ->
			io:format("~p finished ~p~n",[Pid,  Result])
	end,
	loop_wait(N - 1).

compile2(SrcFile, Opts, LogFile) ->
	Ret = compile:file(SrcFile, [return, report_errors, error_summary | Opts]), %% report,
	{IsSuccess, Str} = check_return(SrcFile, Ret),

	case IsSuccess of
		true ->
			CurChangeTime = getFileChangeTime(SrcFile),
			dets:insert(?CompileListDEts, #rec_serverfile{fileName = SrcFile, changeTime = CurChangeTime});
		_ ->
			skip
	end,

	d_log(LogFile, "[~ts] compiled ~s ~p ~ts~n",
		[time_format(), filename:basename(SrcFile), IsSuccess, Str]),
	ok.

check_return(_SrcFile, {ok,_}) ->
	{true, ""};
check_return(_SrcFile, {ok, _Mod, []}) ->
	{true, ""};
check_return(_SrcFile, {ok, _Mod, Binary}) ->
	{true, io_lib:format("~n~ts", [report_warnings(Binary)])};
check_return(_SrcFile, {ok, _Mod, _Binary, Warnings}) ->
	{true, io_lib:format("~n~ts", [report_warnings(Warnings)])};
check_return(SrcFile, {error, Errors, Warnings}) ->
	Msg = report_errors(Errors),
	ets:insert(?CompileEts, {SrcFile, Msg}),
	{false, io_lib:format("~n~ts~n~ts", [Msg, report_warnings(Warnings)])};
check_return(SrcFile, error) ->
	ets:insert(?CompileEts, {SrcFile, "error"}),
	{false, "error"};
check_return(SrcFile, _Reason) ->
	ets:insert(?CompileEts, {SrcFile, "unknow reason"}),
	{false, "unknow reason"}.

check_compile_error(_FileName) ->
	ets:info(?CompileEts, size).

make_worker([], _Schedulers, _LogFile, _Lang, _Target, _Opts) ->
	{0, os:system_time(milli_seconds)};
make_worker(FileList, Schedulers, LogFile, Lang, Target, Opts) ->

	FileNumbers = erlang:length(FileList),
	Once = trunc(FileNumbers / Schedulers),

	L1 = ssplit_all(Once, FileList),
	TaskNum = length(L1),

	d_log(LogFile,
		"~n*********************************************************~n"
		"*********************************************************~n"
		"*  ~ts ~p ~p ~p files ~p workers\t*~n"
		"*********************************************************~n"
		"*********************************************************~n",
		[time_format(), Target, Lang, FileNumbers, TaskNum]),


	StartTime = os:system_time(milli_seconds),
	lists:foldl(
		fun(FLMe, Idx) ->
			erlang:spawn_monitor(
				fun() ->
					try
						Atom = list_to_atom("compile_" ++ integer_to_list(Idx)),
						true = erlang:register(Atom, self()),
						lists:foreach(fun(File) -> compile2(File, Opts, LogFile) end, FLMe)
					catch
						_ : _ ->
							skip
					end
				end),
			Idx + 1
		end, 1, L1),
	{TaskNum, StartTime}.

compile_done(StartTime, LogFile, Lang, Target) ->
	DiffMs = os:system_time(milli_seconds) - StartTime,
	Now = time_format(),

	d_log(LogFile, "~n^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^~n~n"),

	case check_compile_error(LogFile) of
		0 ->
			%% 如果执行单独编译一个文件，则不允许更新头文件
			case getSearchFileData() of
				undefined ->
					F =
						fun(File) ->
							CurChangeTime = getFileChangeTime(File),
							dets:insert(?CompileListDEts, #rec_serverfile{fileName = File, changeTime = CurChangeTime})
						end,
					case getCompileFastParam() of
						{_, _FileList, _Opts, HrlList} ->
							%% 快速编译成功，更新部分头文件
							lists:foreach(F, HrlList);
						_ ->
							%% 全部编译成功，更新头文件
							{HrlFileList, _ErlFileList, _Opts} = scan_all_files(),
							lists:foreach(F, HrlFileList)
					end;
				_ ->
					skip
			end,

			d_log(LogFile, "~n@@@compile [~p,~p] success@@@ at ~ts ~p seconds ~n",
				[Lang, Target, Now, DiffMs / 1000]);
		_ ->
			ets:foldl(
				fun({SrcFile, ErrMsg}, _) ->
					d_log(LogFile, "~ts~n~ts", [filename:basename(SrcFile), ErrMsg]),
					ok
				end, 0, ?CompileEts),
			d_log(LogFile, "~n!!!! compile [~p,~p] ERROR ERROR ERROR !!!*** at ~ts  ~p seconds ~n",
				[Lang, Target, Now, DiffMs / 1000])
	end,

	d_log(LogFile, "~n^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^~n~n"),
	ok.

make_cfg(Lang, Target, _V) ->
	FileName = io_lib:format("compile_~p_~p.txt", [Lang, Target]),
	file:write_file(FileName, ""),

	set_title(Lang, Target),

	{FileList, Opts} = scan_files(getCompileFastParam()),
	Schedulers = erlang:min(schedulers(), erlang:length(FileList)),

	{Schedulers, FileName, make_opts(Opts, Lang, Target), FileList}.

scan_files({_, FileList, Opts, _})->
	{FileList, Opts};
scan_files(undefined)->
	{ok, Config} = file:consult("./mm.config"),
	[{[_IncludeDir, SrcDir], Opts} | _] = Config,
%%	FileList0 = filelib:fold_files(SrcDir, ".app.src$$", true, fun(File, Acc) -> [File | Acc] end, []),
	FileList0 = [],
	FileList1 = filelib:fold_files(SrcDir, ".erl$$", true, fun(File, Acc) -> [File | Acc] end, FileList0),
	{FileList1, Opts}.

scan_all_files()->
	{ok, Config} = file:consult("./mm.config"),
	[{[IncludeDir, SrcDir], Opts} | _] = Config,
%%	FileList0 = filelib:fold_files(SrcDir, ".app.src$$", true, fun(File, Acc) -> [File | Acc] end, []),
	FileList0 = [],
	FileList1 = filelib:fold_files(IncludeDir, ".erl$$", true, fun(File, Acc) -> [File | Acc] end, FileList0),
	FileList2 = filelib:fold_files(SrcDir, ".erl$$", true, fun(File, Acc) -> [File | Acc] end, FileList1),

	FileList3 = filelib:fold_files(IncludeDir, ".hrl$$", true, fun(File, Acc) -> [File | Acc] end, []),
	FileList4 = filelib:fold_files(SrcDir, ".hrl$$", true, fun(File, Acc) -> [File | Acc] end, FileList3),
	{FileList4, FileList2, Opts}.

schedulers()->
	case catch erlang:system_info(schedulers_online) of
		{'EXIT', _} ->
			8;
		Cpu ->
			Cpu * 2
	end.

d_log(File, Fmt) ->
	Str = io_lib:format(Fmt,[]),
	io:format(Str),
	file:write_file(File, Str, [append]).

d_log(File,Fmt, Args)->
	Str = io_lib:format(Fmt, Args),
	io:format(Str),
	file:write_file(File, Str, [append]).

make_opts(Opts, Lang, gsD) ->
	[{d, 'Region', Lang}, debug_info | Opts];
make_opts(Opts, Lang, gs) ->
	[{d, 'Region', Lang},{d,'RELEASE'} | Opts].

set_title(Lang, Mode) ->
	case os:type() of
		{win32, _} ->
			{_, Cwd} = file:get_cwd(),
			os:cmd(io_lib:format('title "~p|~p|~p"', [Cwd, Lang, Mode]));
		_ ->
			skip
	end.

time_format() -> time_format(erlang:timestamp()).

time_format(Now) ->
	{{Y, M, D}, {H, MM, S}} = calendar:now_to_local_time(Now),
	time_format1(Y, M, D, H, MM, S).
time_format1(Y, M, D, H, MM, S) ->
	lists:concat([Y, "-", one_to_two(M), "-", one_to_two(D), " ",
		one_to_two(H), ":", one_to_two(MM), ":", one_to_two(S)]).
one_to_two(One) -> io_lib:format("~2..0B", [One]).


ssplit_all(N, L) ->
	Len = length(L),
	do_ssplit(N, L, Len, []).

%%---
do_ssplit(_, [], _, Acc) ->
	Acc;
do_ssplit(N, L1, Len, Acc) ->
	{L2, L3} = do_ssplit1(N, L1, Len),
	do_ssplit(N, L3, Len - N, [L2 | Acc]).

%%---
do_ssplit1(N, L, Len) when N =< Len ->
	lists:split(N, L);
do_ssplit1(_N, L, _Len) ->
	{L, []}.

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
%%	Ws = lists:sort(Ws1),

	lists:flatten(lists:reverse(Ws)).

format_message(F, P, [{none, Mod, E} | Es], Acc) ->
	Msg = io_lib:format("[~ts] ~ts: ~s~ts\n",
		[time_format(), filename:basename(F), P, Mod:format_error(E)]),
	format_message(F, P, Es, [Msg | Acc]);
format_message(F, P, [{{Line, Column} = _Loc, Mod, E} | Es], Acc) ->
	Msg = io_lib:format("[~ts] ~ts:~w:~w ~s~ts\n",
		[time_format(),filename:basename(F), Line, Column, P, Mod:format_error(E)]),
	format_message(F, P, Es, [Msg | Acc]);
format_message(F, P, [{Line, Mod, E} | Es], Acc) ->
	Msg = io_lib:format("[~ts] ~ts:~w: ~s~ts\n",
		[time_format(),filename:basename(F), Line, P, Mod:format_error(E)]),
	format_message(F, P, Es, [Msg | Acc]);
format_message(F, P, [{Mod, E} | Es], Acc) ->
	%% Not documented and not expected to be used any more, but
	%% keep a while just in case.
	Msg = io_lib:format("[~ts] ~ts: ~s~ts\n",
		[time_format(),filename:basename(F), P, Mod:format_error(E)]),
	format_message(F, P, Es, [Msg | Acc]);
format_message(_, _, [], Acc) -> Acc.

list_errors(F, [{none, Mod, E} | Es], Acc) ->
	Msg = io_lib:format("[~ts] ~ts: ~ts\n",
		[time_format(),filename:basename(F), Mod:format_error(E)]),
	list_errors(F, Es, [Msg | Acc]);
list_errors(F, [{{Line, Column}, Mod, E} | Es], Acc) ->
	Msg = io_lib:format("[~ts] ~ts:~w:~w: ~ts\n",
		[time_format(),filename:basename(F), Line, Column, Mod:format_error(E)]),
	list_errors(F, Es, [Msg | Acc]);
list_errors(F, [{Line, Mod, E} | Es], Acc) ->
	Msg = io_lib:format("[~ts] ~ts:~w: ~ts\n",
		[time_format(),filename:basename(F), Line, Mod:format_error(E)]),
	list_errors(F, Es, [Msg | Acc]);
list_errors(F, [{Mod, E} | Es], Acc) ->
	%% Not documented and not expected to be used any more, but
	%% keep a while just in case.
	Msg = io_lib:format("[~ts] ~ts: ~ts\n",
		[time_format(),filename:basename(F), Mod:format_error(E)]),
	list_errors(F, Es, [Msg | Acc]);
list_errors(_F, [], Acc) -> Acc.

getChangeFileList() ->
	{HrlFileList, ErlFileList, Opts} = scan_all_files(),
	io:format("===> scan files number include[~p] scr[~p]~n", [erlang:length(HrlFileList), erlang:length(ErlFileList)]),
	HrlChangeList = saveFileChangeTime(HrlFileList),
	io:format("===> hrl changs number:~p~n", [erlang:length(HrlChangeList)]),
	ErlChangeList = saveFileChangeTime(ErlFileList),
	io:format("===> erl changs number:~p~n", [erlang:length(ErlChangeList)]),
	case HrlChangeList of
		[] ->
			io:format("===> compile fast ...~n"),
			{true, ErlChangeList, Opts, []};
		_ ->
			io:format("===> compile all ...~n"),
			{false, ErlFileList, Opts, HrlFileList}
	end.

saveFileChangeTime(List) ->
	F =
		fun(File, AccL) ->
			CurChangeTime = getFileChangeTime(File),
			case dets:lookup(?CompileListDEts, File) of
				[#rec_serverfile{changeTime = ChangeTime}] when CurChangeTime =:= ChangeTime ->
					AccL;
				_ ->
					[File | AccL]
			end
		end,
	lists:foldl(F, [], List).

%% 用MD5代替系统修改时间
getFileChangeTime(File) ->
	getFileMd5(File);
getFileChangeTime(File) ->
	case file:read_file_info(File, [{time, posix}]) of
		{ok, Info} ->
			erlang:element(5, Info);
		_ ->
			io:format("===> read getFileChangeTime:~ts failed~n", [File]),
			throw(readfileerror)
	end.

getFileMd5(File) ->
	case file:read_file(File) of
		{ok, Data} ->
			erlang:md5(Data);
		_ ->
			io:format("===> read getFileMd5:~ts failed~n", [File]),
			throw(readfilemd5error)
	end.

setCompileFastParam(Param) ->
	put('CompileFastParam', Param).
getCompileFastParam() ->
	get('CompileFastParam').

string_strip(Str)-> string:strip(Str).

string_strip(Str, [])-> 
	Str;
string_strip(Str, [CH | L])-> 
	string_strip(string:strip(Str, both, CH), L).