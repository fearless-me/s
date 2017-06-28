%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 配置位置：server\gameserver\data
%%% @end
%%% Created : 19. 六月 2017 17:38
%%%-------------------------------------------------------------------
-module(config).
-author(tiancheng).

-include("gsInc.hrl").

%% API
-export([
	getConfigList/0
]).

%% 获取GameServer.txt配置
-export([
	getInt/2,
	getString/2,
	saveConfig/0,
	getGameServerEts/0
]).

%% 获取Operations.txt配置
-export([
	getOperationsInt/2,
	getOperationsString/2,
	getOperationsEts/0
]).

%% 获取Cross.txt配置
-export([
	getCrossInt/2,
	getCrossString/2
]).

%% 服务器基本配置
-define(GameServerConfig, {"GameServer.txt", ets_name_config_GameServer}).

%% 运维相关配置
-define(OperationsConfig, {"Operations.txt", ets_name_config_Operations}).

%% 跨服配置
-define(CrossConfig, {"Cross.txt", ets_name_config_Cross}).

%% 可用配置列表，目前Cross.txt不可用
-define(ConfigList, [?GameServerConfig, ?OperationsConfig]).

getConfigList() -> ?ConfigList.

%% 获取游戏配置
-spec getInt(Key::string(), Default::uint32()) -> uint32().
getInt(Key, Default) ->
	getInt(getGameServerEts(), Key, Default).
-spec getString(Key::string(), Default::string()) -> string().
getString(Key, Default) ->
	getString(getGameServerEts(), Key, Default).
-spec saveConfig() -> ok.
saveConfig() ->
	{File, Ets} = ?GameServerConfig,
	saveConfig("BAK_" ++ File, Ets).

%% 获取运维配置
-spec getOperationsInt(Key::string(), Default::uint32()) -> uint32().
getOperationsInt(Key, Default) ->
	getInt(getOperationsEts(), Key, Default).
-spec getOperationsString(Key::string(), Default::string()) -> string().
getOperationsString(Key, Default) ->
	getString(getOperationsEts(), Key, Default).

%% 获取跨服配置
-spec getCrossInt(Key::string(), Default::uint32()) -> uint32().
getCrossInt(Key, Default) ->
	getInt(getCrossEts(), Key, Default).
-spec getCrossString(Key::string(), Default::string()) -> string().
getCrossString(Key, Default) ->
	getString(getCrossEts(), Key, Default).

getGameServerEts() -> getEts(?GameServerConfig).
getOperationsEts() -> getEts(?OperationsConfig).
getCrossEts() -> getEts(?CrossConfig).

getEts(Config) ->
	case lists:member(Config, getConfigList()) of
		true ->
			{_, Ets} = Config,
			Ets;
		_ ->
			undefined
	end.

getInt(undefined, _Key, Default) ->
	Default;
getInt(Ets, Key, Default) ->
	case ets:lookup(Ets, Key) of
		[#recConfigValue{value = Value}] when erlang:is_list(Value) ->
			{Int, _} = string:to_integer(Value),
			case Int of
				error ->
					Default;
				_ ->
					Int
			end;
		[#recConfigValue{value = Value}] when erlang:is_integer(Value) ->
			Value;
		_ ->
			Default
	end.

getString(undefined, _Key, Default) ->
	Default;
getString(Ets, Key, Default) ->
	case ets:lookup(Ets, Key) of
		[#recConfigValue{value = Value}] when erlang:is_list(Value) ->
			Value;
		[#recConfigValue{} = Config] ->
			?ERROR_OUT("error config:~p", [Config]),
			Default;
		_ ->
			Default
	end.

saveConfig(_NewFile, undefined) ->
	ok;
saveConfig(NewFile, Ets) ->
	case file:open(NewFile, [write,raw]) of
		{ok, FileHandle} ->
			%%写UTF8文件格式的BOM
			file:write(FileHandle, <<16#EF,16#BB,16#BF>>),
			file:write(FileHandle, "//newest run server config\r\n"),
			file:write(FileHandle, "//" ++ time2:getLocalDateTimeStr() ++ "\r\n"),

			List = ets:tab2list(Ets),
			NewList = lists:keysort(#recConfigValue.index, List),
			F =
				fun(#recConfigValue{key = Key, value = Value}) ->
					NewValue = case erlang:is_list(Value) of
								   true -> Value;
								   _ -> integer_to_list(Value)
							   end,
					file:write(FileHandle, Key ++ "=" ++ NewValue ++ "\r\n")
				end,
			lists:foreach(F, NewList),
			file:close(FileHandle),
			?LOG_OUT("saveconfig ~ts success!", [NewFile]);
		{error, Reason} ->
			?ERROR_OUT("saveconfig ~ts failed ~p", [NewFile, Reason])
	end,
	ok.