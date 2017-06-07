%% @author Administrator
%% @doc @todo 全局游戏配置.


-module(stringCfg).

%% ====================================================================
%% API functions
%% ====================================================================

-include("common.hrl").
-include("cfg_serverstrings.hrl").
-include("setupLang.hrl").

-export([
	getString/1,
	getString/2,
	getID/1]).

%% 获取字符拼接串
-spec getString(StringAtom) -> string() when
	StringAtom :: atom().
getString(StringAtom) ->
	getString(StringAtom, []).

%% 获取字符拼接串
-spec getString(StringAtom, Params) -> string() when
	StringAtom :: atom(), Params :: list().
getString(StringAtom, Params) ->
	#serverstringsCfg{id = ID,chs = Content} = getCfg:getCfgPStack(cfg_serverstrings, StringAtom),
	case Content =/= undefined of
		true ->
			StrID = io_lib:format("~ts~p",["\d",ID]),
			Ret = case erlang:length(Params) > 0 of
				true ->
					Fun = fun(Arg,AccIn) ->
								  if
									  erlang:is_list(Arg) ->
										  io_lib:format("~ts~ts~ts",[AccIn,"\b",Arg]);
									  true ->
										  io_lib:format("~ts~ts~w",[AccIn,"\b",Arg])
								  end
						  end,
					lists:foldl(Fun,StrID,Params);
				_ ->
					StrID
			end,
			io_lib:format("~ts~ts",[Ret,"\v"]);
		_ ->
			?ERROR_OUT("stringCfg getString[~p] Error.",[StringAtom]),
			[]
	end.
getID(StringAtom) ->
	#serverstringsCfg{id = ID} = getCfg:getCfgPStack(cfg_serverstrings, StringAtom),
	case ID > 0 of
		true ->
			ID;
		_ ->
			?ERROR_OUT("stringCfg getID[~p].", [StringAtom]),
			0
	end.
%% ====================================================================
%% Internal functions
%% ====================================================================


