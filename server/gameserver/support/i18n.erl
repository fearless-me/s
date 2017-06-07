%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 05. 十一月 2015 19:56
%%%-------------------------------------------------------------------

-module(i18n).
-author("ZhongYuanWei").

-include("../../gameserver/src/config/cfg_pet_pvp.hrl").
-include("../../gameserver/src/config/cfg_mapsetting.hrl").
-include("../../gameserver/src/config/cfg_monster.hrl").
-include("../../gameserver/src/config/cfg_npc.hrl").
-include("../../gameserver/src/config/cfg_pet.hrl").
-include("../../gameserver/src/config/cfg_item.hrl").
-include("../../gameserver/src/config/cfg_equipment.hrl").
-include("../../gameserver/src/config/cfg_task_new.hrl").

-define(ExcelColumn, 4).

%% API
-export([
	extract/0,
	build/0
]).

-define(FileNameInfoList,[
	{cfg_npc,[#npcCfg.refname,#npcCfg.name,#npcCfg.title,#npcCfg.commonTalk]},
	{cfg_monster,[#monsterCfg.name,#monsterCfg.showName]},
	{cfg_mapsetting,[#mapsettingCfg.desc,#mapsettingCfg.show_name]},
	{cfg_pet_pvp,[#pet_pvpCfg.name]},
	{cfg_pet,[#petCfg.petName]},
	{cfg_item,[#itemCfg.name]},
	{cfg_equipment,[#equipmentCfg.name]},
	{cfg_task_new,[#task_newCfg.task_name]}
]).

extract() ->
	buildDeps(),
	StringList = getAllString(),
	writeStringList(StringList),
	ok.

build() ->
	buildDeps(),
	case file:open("MultiLangsString.xls",read) of
		{ok,File} ->
			StringList = readStrings(File,[],1),
			file:close(File),
			replaceModuleString(StringList);
		Error ->
			io:format("Open MultiLangsString.xls failed:~p",[Error])
	end,
	io:format("~n------------- build success -------------~n"),
	ok.

buildDeps() ->
	List = [Module || {Module,_} <- ?FileNameInfoList],
	Fun =
		fun(Mod) ->
			Filename = "../../gameserver/src/config/" ++ erlang:atom_to_list(Mod) ++ ".erl",
			io:format("buildDeps filename:~ts~n", [Filename]),
			{ok,Mod} = compile:file(Filename,[{i,"../../gameserver/include"},{i,"../../gameserver/include/common"}]),
			{Mod, Binary, FileName} = code:get_object_code(Mod),
			{module,Mod} = code:load_binary(Mod, FileName, Binary),
			io:format("buildDeps Mod:~p success!~n", [Mod]),
			ok
		end,
	lists:foreach(Fun, List).


replaceModuleString(StringList) ->
	file:del_dir("lang"),
	file:make_dir("lang"),
	SortFun = fun({K1,_V1},{K2,_V2}) ->
		length(K1) > length(K2)
	          end,
	RetList = lists:sort(SortFun,StringList),
	List = [Module || {Module,_} <- ?FileNameInfoList],
	replaceModuleString(List,RetList).

replaceModuleString([],_StringList) ->
	ok;
replaceModuleString([H | T],StringList) ->
	Mod = erlang:atom_to_list(H),
	{ok,Content} = file:read_file("../../gameserver/src/config/" ++ Mod ++ ".erl"),
	[{_,LangStringList} | _] = StringList,
	N = erlang:length(LangStringList),
	io:format("will build [~p] languages:~p\n",[H, N]),
	List = lists:seq(1, N),
	Fun = fun(I) ->
				  replaceLang(I,Mod,StringList,Content)
		  end,
	lists:foreach(Fun, List),
	replaceModuleString(T,StringList).

replaceLang(N,Mod,StringList,Content) ->
	Fun =
		fun({KeyString,LangStringList},CT) ->
			ReplaceLang = lists:nth(N, LangStringList),
			S1 = erlang:list_to_binary(KeyString),
			S2 = erlang:list_to_binary(ReplaceLang),
			Ret = binary:replace(CT,S1,S2,[global]),
			Ret
		end,
	R = lists:foldl(Fun,Content,StringList),
	writeToLangFile(Mod,N,R),
	ok.

writeToLangFile(ModuleStr,LangN,Content) ->
	FileName = case LangN of
				   1 ->
					   ModuleStr ++ "_cht";
				   2 ->
					   ModuleStr ++ "_kor";
				   3 ->
					   ModuleStr ++ "_jp"
			   end,
	ModStr = io_lib:format("-module(~ts).",[ModuleStr]),
	NewModStr = io_lib:format("-module(~ts).",[FileName]),
	CT = binary:replace(Content,erlang:list_to_binary(ModStr),erlang:list_to_binary(NewModStr)),
	ok = file:write_file("lang/" ++ FileName ++ ".erl", CT),
	ok.

readStrings(File, AccInStringList, Number) ->
	case file:read_line(File) of
		{ok, Data} ->
			%% 检查是否读完整行
			case readStringsAllLine(File, Data) of
				eof ->
					AccInStringList;
				Data2 ->
					io:format("read excel line: ~p~n", [Number]),

					%% 去掉控制符
					[_A1|Tail] = lists:reverse(Data2),
					Token = [H|T] = string:tokens(lists:reverse(Tail), "\t"),
%%					Token = [H|T] = tokenString([], lists:reverse(Data2), "\t\0", 2),
%%					Token = [H|T] = tokenString([], lists:reverse(Data2), "\t", 1),
					Len = string:len(Token),
					case Len =:= ?ExcelColumn of
						true ->
							readStrings(File, [{H,T} | AccInStringList], Number + 1);
						_ ->
							io:format("========> read excel error: line=~p, len=~p~n", [Number, Len]),

							Str = io_lib:format("~p,~p,~s~n", [Number, Len, Data2]),
							file:write_file("error.txt", Str),
							AccInStringList
					end
			end;
		_ ->
			AccInStringList
	end.

tokenString(RetList, Str, SubStr, SubLen) ->
	SubIndex = string:str(Str, SubStr),
	case SubIndex > 0 of
		true ->
			Head = string:substr(Str, 1, SubIndex - 1),
			Tail = string:substr(Str, SubIndex + SubLen),
			tokenString(RetList ++ [Head], Tail, SubStr, SubLen);
		_ ->
			RetList ++ [Str]
	end.

readStringsAllLine(_File, Data) ->
	Data;
readStringsAllLine(File, Data) ->
	%% 检查是否读完整行
	case string:str(Data, "\r\0\n") of
		0 ->
			%% 没读完，去掉一个控制符
			[_|Tail] = lists:reverse(Data),
			case file:read_line(File) of
				{ok, Data2} ->
					readStringsAllLine(File, lists:reverse(Tail) ++ Data2);
				eof ->
					eof
			end;
		_ ->
			Data
	end.

getAllString() ->
	Fun = fun({Module,FieldIndexList},AccIn) ->
		KeyList = Module:get1KeyList(),
		getModuleAllRow(Module,KeyList,FieldIndexList,AccIn)
	end,
	StringList = lists:foldl(Fun,[],?FileNameInfoList),
	lists:usort(StringList).

getModuleAllRow(Module,KeyList,FieldIndexList,AccInStringList) ->
	Fun = fun(Key,AccIn) ->
		getModuleRow(Module,Key,FieldIndexList,AccIn)
	end,
	lists:foldl(Fun,AccInStringList,KeyList).

getModuleRow(Module,Key,FieldIndexList,AccInStringList) ->
	R = Module:getRow(Key),
	Fun = fun(Index,AccIn) ->
		Str = erlang:element(Index,R),
		case erlang:is_list(Str) of
			true ->
				[Str | AccIn];
			_ ->
				AccIn
		end
	end,
	lists:foldl(Fun,AccInStringList,FieldIndexList).

writeStringList(StringList) ->
	{ok,File} = file:open("localString.xls",write),
	Fun = fun(String) ->
		file:write(File,String),
		file:write(File,"\n")
	end,
	lists:foreach(Fun,StringList),
	file:close(File).


