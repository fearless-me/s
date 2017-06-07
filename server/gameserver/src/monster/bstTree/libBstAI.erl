%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%%
%%% @end
%%% Created : 09. 十月 2014 22:14
%%%-------------------------------------------------------------------
-module(libBstAI).
-author("ZhongYuanWei").

-include("bstTree.hrl").
-include("gsInc.hrl").

%%怪物AI Tick时间
-define(AITickInterval,200).

%% API
-export([spawnAI/4,
	tickAI/0,
	addObj/1,
	delObj/1,
	getAIList/0,
	setAIList/1
]).

-spec spawnAI(MonsterID,Code,MoveType,Params) -> ok when
	MonsterID::uint(),Code::uint(),MoveType::uint(),Params::uint().
spawnAI(MonsterID,Code,MoveType,Params) ->
	%%根据怪物配置的AI ID获取相应的AI数据
	#monsterCfg{monsterAI = AI} = getCfg:getCfgPStack(cfg_monster, MonsterID),
	addObj(Code),
	case monsterAITree:initMonsterAI(Code,AI, MoveType,Params) of
		#bstTree{} = Tree ->
			Actor = #bstActor{
				code = Code
			},
			bstTreeRE:onInit(Actor, Tree),
			monsterAI:initAI(Code,self());
		_ ->
			skip
	end,
	ok.

-spec tickAI() -> ok.
tickAI() ->
	List = getAIList(),
	Fun = fun({Code, _}) ->
				  try
					  bstTreeRE:onExecute(Code)
				  catch
					  _:Why ->
						  %%防止AI错误,刷屏
						  setAIList(lists:keydelete(Code, 1, List)),
						  ?ERROR_OUT( "Monster Ai Tick Exception Why[~p]~n stack[~p]",
									  [Why, erlang:get_stacktrace()])
				  end
		  end,
	lists:foreach(Fun, List).

-spec addObj(Code) -> ok when
	Code::uint().
addObj(Code) ->
	List = getAIList(),
	setAIList([{Code,Code} | List]),
	ok.

-spec delObj(Code) -> ok when
	Code::uint().
delObj(Code) ->
	List = getAIList(),
	L = lists:keydelete(Code, 1, List),
	setAIList(L),
	erase(Code),
	ok.

-spec getAIList() -> list() | undefined.
getAIList() ->
	get(ai).

-spec setAIList(List) -> ok when
	List::list().
setAIList(List) ->
	put(ai,List),
	ok.


