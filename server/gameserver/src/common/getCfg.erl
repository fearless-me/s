%% @author Administrator
%% @doc @todo Add description to getCfg.


-module(getCfg).

-include("common/common.hrl").

-include("setupLang.hrl").


%% ====================================================================
%% API functions
%% ====================================================================

-export([
	getCfgByKey/2,
	getCfgByKey/3,
	getCfgByKey/4,
	getCfgByArgs/2,
	getCfgByArgs/3,
	getCfgByArgs/4,
	getAllCfg/1,
	getCfgPStack/2,
	getCfgPStack/3,
	getCfgPStack/4,

	get1KeyList/1,
	get2KeyList/2,
	getKeyList/1,
	getKey/2,

	getTranslateModule/1,

	getCfgPStackWithDefaultValue/3,
	getCfgPStackWithDefaultValue/4,
	getCfgPStackWithDefaultValue/5
]).

%% ====================================================================
%% Internal functions
%% ====================================================================

getTranslateModule(cfg_gamemapcfg) ->
	cfg_gamemapcfg;
getTranslateModule(Module) ->
	NewMod =
		if
			erlang:is_list(?Cur_Lang) ->	%% @doc 忽略该行警告
				erlang:atom_to_list(Module) ++ "_" ++ ?Cur_Lang;
			erlang:is_atom(?Cur_Lang) ->
				erlang:atom_to_list(Module) ++ "_" ++ erlang:atom_to_list(?Cur_Lang);
			true ->							%% @doc 忽略该行警告
				?ERROR_OUT("Error Type of CurLang:~p",[?Cur_Lang])
		end,
	erlang:list_to_atom(NewMod).

getCfgByKey(Module,undefined)->
	?ERROR_OUT("getCfgByKey:~p,~p", [Module, misc:getStackTrace()]),
	{};
getCfgByKey(Module,Key1)->
	Mod = getTranslateModule(Module),
	case Mod:getRow(Key1) of
		[] ->
			% getCfgByKey 不需要打印，如有需要请替换为 getCfgPStack
			%?ERROR_OUT("getCfgByKey error can not find data Mod=~p,key=~p",[Mod,Key1]),
			{};
		Value ->
			Value
	end.
getCfgByKey(Module,Key1,Key2)->
	Mod = getTranslateModule(Module),
	case Mod:getRow(Key1,Key2) of
		[] ->
			{};
		Value ->
			Value
	end.
getCfgByKey(Module,Key1,Key2,Key3)->
	Mod = getTranslateModule(Module),
	case Mod:getRow(Key1,Key2,Key3) of
		[] ->
			{};
		Value ->
			Value
	end.

getAllCfg(Module)->
	Mod = getTranslateModule(Module),
	Fun = fun(Record,AccIn)->
		case Record of
			{Key1} ->
				[Mod:getRow(Key1) | AccIn];
			{Key1,Key2} ->
				[Mod:getRow(Key1,Key2) | AccIn];
			{Key1,Key2,Key3} ->
				[Mod:getRow(Key1,Key2,Key3) | AccIn];
			_ ->
				AccIn
		end
	end,
	lists:foldl(Fun, [], Mod:getKeyList()).

getCfgByArgs(Module,undefined)->
	?ERROR_OUT("getCfgByArgs:~p,~p", [Module, misc:getStackTrace()]),
	[];
getCfgByArgs(Module,Key1)->
	Mod = getTranslateModule(Module),
	case Mod:getRow(Key1) of
		[] ->
			?ERROR_OUT("cfg_error  infor =~p~n,",[{Mod,Key1}]),
			[];
		Value ->
			Value
	end.

getCfgByArgs(Module,Key1,Key2)->
	Mod = getTranslateModule(Module),
	case Mod:getRow(Key1,Key2) of
		[] ->
			[];
		Value ->
			Value
	end.

getCfgByArgs(Module,Key1,Key2,Key3)->
	Mod = getTranslateModule(Module),
	case Mod:getRow(Key1,Key2,Key3) of
		[] ->
			[];
		Value ->
			Value
	end.

getCfgPStack(Module,Key1)->
	Mod = getTranslateModule(Module),
	case Mod:getRow(Key1) of
		[]->
			?ERROR_OUT("getCfgPStack err Module:~p Key1:~p, ~p",[Mod, Key1, misc:getStackTrace()]),
			[];
		Value->
			Value
	end.

getCfgPStack(Module,Key1,Key2)->
	Mod = getTranslateModule(Module),
	case Mod:getRow(Key1,Key2) of
		[] ->
			?ERROR_OUT("getCfgPStack err Module:~p Key1:~p Key2:~p, ~p",[Mod, Key1, Key2, misc:getStackTrace()]),
			[];
		Value ->
			Value
	end.

getCfgPStack(Module,Key1,Key2,Key3)->
	Mod = getTranslateModule(Module),
	case Mod:getRow(Key1,Key2,Key3) of
		[] ->
			?ERROR_OUT("getCfgPStack err Module:~p Key1:~p Key2:~p Key3 ~p, ~p",[Mod, Key1, Key2, Key3, misc:getStackTrace()]),
			[];
		Value ->
			Value
	end.

get1KeyList(Module) ->
	Mod = getTranslateModule(Module),
	Mod:get1KeyList().

get2KeyList(Module,Key) ->
	Mod = getTranslateModule(Module),
	Mod:get2KeyList(Key).

getKeyList(Module) ->
	Mod = getTranslateModule(Module),
	Mod:getKeyList().

getKey(Module,Key) ->
	Mod = getTranslateModule(Module),
	Mod:getKey(Key).

getCfgPStackWithDefaultValue(Module,DefaultValue,Key1)->
	Mod = getTranslateModule(Module),
	case Mod:getRow(Key1) of
		[]->
			?ERROR_OUT("getCfgPStackWithDefaultValue err Module:~p Key1:~p~n~p",[Mod, Key1, misc:getStackTrace()]),
			DefaultValue;
		Value->
			Value
	end.

getCfgPStackWithDefaultValue(Module,DefaultValue,Key1,Key2)->
	Mod = getTranslateModule(Module),
	case Mod:getRow(Key1,Key2) of
		[] ->
			?ERROR_OUT("getCfgPStackWithDefaultValue err Module:~p Key1:~p Key2:~p~n~p",[Mod, Key1, Key2, misc:getStackTrace()]),
			DefaultValue;
		Value ->
			Value
	end.

getCfgPStackWithDefaultValue(Module,DefaultValue,Key1,Key2,Key3)->
	Mod = getTranslateModule(Module),
	case Mod:getRow(Key1,Key2,Key3) of
		[] ->
			?ERROR_OUT("getCfgPStackWithDefaultValue err Module:~p Key1:~p Key2:~p Key3:~p~n~p",[Mod, Key1, Key2, Key3, misc:getStackTrace()]),
			DefaultValue;
		Value ->
			Value
	end.
