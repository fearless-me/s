%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 六月 2017 17:08
%%%-------------------------------------------------------------------
-module(monsterWorldBoss).
-author("Administrator").

-include("monsterPrivate.hrl").

%% API
-export([
	isDirectDecHP/1
]).


isDirectDecHP(Code)->
	MonsterID = monsterState:getId(Code),
	case getCfg:getCfgByKey(cfg_monster, MonsterID) of
		#monsterCfg{monsterSubType = ?MonsterSTypeWorldBoss} ->
			false;
		_ ->
			true
	end.