%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 活动模块字典
%%% @end
%%% Created : 08. 四月 2015 15:27
%%%-------------------------------------------------------------------
-module(acDarknessState).
-author("tiancheng").

-include("acDarknessPrivate.hrl").

%% API
%% -export([]).
-compile(export_all).

%% 设置黑暗之地是否初始化
setDarknessInit(Bool) ->
	put('DarknessInit', Bool).

getDarknessInit() ->
	get('DarknessInit').

%% 特殊BOSS
getSpecialBossInfo() ->
	case get('SpecialBossInfo') of
		#darknessSpecialBoss{} = V ->
			V;
		_ ->
			#darknessSpecialBoss{}
	end.

setSpecialBossInfo(#darknessSpecialBoss{} = Info) ->
	put('SpecialBossInfo', Info).

delSpecialBossInfo() ->
	erlang:erase('SpecialBossInfo').

%% 是否开启
getACIsStart() ->
	case get('ACIsStart') of
		undefined -> false;
		B -> B
	end.

setACIsStart(B) ->
	put('ACIsStart', B).

%% 地图列表
getDarknessMapList() ->
	case get('DarknessMapList') of
		undefined ->
			[];
		L ->
			L
	end.

setDarknessMapList(L) ->
	put('DarknessMapList', L).

delDarknessMapList() ->
	erlang:erase('DarknessMapList').

%% 获取申请进入列表
getDarknessApplyList() ->
	case get('DarknessApplyList') of
		undefined ->
			[];
		L ->
			L
	end.

setDarknessApplyList(L) ->
	put('DarknessApplyList', L).

delDarknessApplyList() ->
	erlang:erase('DarknessApplyList').

%% 报名序号
getApplyNumber() ->
	Number =
		case get('ApplyNumber') of
			undefined ->
				1;
			Num ->
				Num + 1
		end,

	setApplyNumber(Number),
	Number.

setApplyNumber(Number) ->
	put('ApplyNumber', Number).

delApplyNumber() ->
	erlang:erase('ApplyNumber').

%% 进入玩家字典
getDarknessPlayerDict() ->
	case get('DarknessPlayerDict') of
		undefined ->
			dict:new();
		Dict ->
			Dict
	end.

setDarknessPlayerDict(Dict) ->
	put('DarknessPlayerDict', Dict).

delDarknessPlayerDict(RoleID) ->
	D = getDarknessPlayerDict(),
	NewD = dict:erase(RoleID, D),
	setDarknessPlayerDict(NewD),
	ok.

delDarknessPlayerDict() ->
	Dict = getDarknessPlayerDict(),
	KeyList = dict:fetch_keys(Dict),
	F =
		fun(RID) ->
			delDarknessPlayerDict(RID)
		end,
	lists:foreach(F, KeyList),

	%% 最后删掉DICT
	erlang:erase('DarknessPlayerDict').

getDarknessPlayerObject(RoleID) ->
	Dict = getDarknessPlayerDict(),
	case dict:find(RoleID, Dict) of
		{ok, #darknessPlayer{} = Player} -> Player;
		_ -> false
	end.

putDarknessPlayerObject(#darknessPlayer{roleID = RoleID} = Player) ->
	Dict = getDarknessPlayerDict(),
	NDict = dict:store(RoleID, Player, Dict),
	setDarknessPlayerDict(NDict).

%% 地图ETS缓存
getMapEtsCacheList() ->
	case get('MapEtsCacheList') of
		undefined -> [];
		L -> L
	end.

delMapEtsCacheList() ->
	erlang:erase('MapEtsCacheList').

addMapEtsCache({MapPID, _PE, _ME, _CE, _NE} = Data) ->
	L = getMapEtsCacheList(),
	NL = lists:keystore(MapPID, 1, L, Data),
	put('MapEtsCacheList', NL),
	ok.

getMapEtsCache(MapPID) ->
	L = getMapEtsCacheList(),
	lists:keyfind(MapPID, 1, L).

delMapEtsCache(MapPID) ->
	L = getMapEtsCacheList(),
	NL =
		case lists:keymember(MapPID, 1, L) of
			true -> lists:keydelete(MapPID, 1, L);
			_ -> L
		end,
	put('MapEtsCacheList', NL).

setLastAdvertisementTime(Time) ->
	put('LastAdvertisementTime', Time).

getLastAdvertisementTime() ->
	case get('LastAdvertisementTime') of
		undefined -> 0;
		Time -> Time
	end.