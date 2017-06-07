%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. 五月 2017 11:03
%%%-------------------------------------------------------------------
-module(codeMgr).
-author("Administrator").

%% API

-include("gsInc.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	init/0,
	release/0,
	makeCode/1,
%%	reclaimCode/1,
	isCodeType/2,
	getObjectTypeByCode/1
]).

-define(CodeEts,codeEts).

-define(Bit_Highest, 1).	% 最高位，默认0，空位
-define(Bit_Type,	5).		% 类型?CodeTypePlayer - ?CodeTypeCarrier:1~31
-define(Bit_ADBID,	5).		% ADBID:1~31
-define(Bit_DBID,	10).	% DBID:1~1023
-define(Bit_IDRange,43).	% ID累加值:0~8796093022207

-record(rec_code, {
	type,			%% 类型
	curCode,		%% 当前计数的
	minCode,		%% 最小值
	maxCode			%% 最大上限值
}).
%% ====================================================================


init()->
	?LOG_OUT("CodeMgr init"),
	ets:new(?CodeEts, [public, named_table, {keypos, #rec_code.type},{write_concurrency, true},{read_concurrency, true}]),
	lists:foreach(fun(CodeType) -> initEtsTab(CodeType) end,?CodeTypeList),
	?LOG_OUT("CodeMgr init OK"),
	true.


makeCode(?CodeTypePlayer) ->
	genCode(?CodeTypePlayer);
makeCode(?CodeTypeNPC) ->
	genCode(?CodeTypeNPC);
makeCode(?CodeTypeMonster) ->
	genCode(?CodeTypeMonster);
makeCode(?CodeTypeCollect) ->
	genCode(?CodeTypeCollect);
makeCode(?CodeTypeUseItem) ->
	genCode(?CodeTypeUseItem);
makeCode(?CodeTypeTeam) ->
	genCode(?CodeTypeTeam);
makeCode(?CodeTypePet) ->
	genCode(?CodeTypePet);
makeCode(?CodeTypeCarrier) ->
	genCode(?CodeTypeCarrier);
makeCode(_) ->
	throw(badarg).

%%判断某个Code是否为某种类型
-spec isCodeType(CodeType,Code) -> boolean() when
	CodeType::code_type(),Code::uint().
isCodeType(CodeType,Code) ->
	{Type,_,_,_} = parseCode(Code),
	Type =:= CodeType.

%%根据Code获取类型
-spec getObjectTypeByCode(Code) -> obj_type() when
	Code:: uint().
getObjectTypeByCode(Code) ->
	{CodeType,_,_,_} = parseCode(Code),
	if
		CodeType =:= ?CodeTypePlayer ->
			?ObjTypePlayer;
		CodeType =:= ?CodeTypeNPC ->
			?ObjTypeNPC;
		CodeType =:= ?CodeTypeMonster ->
			?ObjTypeMonster;
		CodeType =:= ?CodeTypeCarrier ->
			?ObjTypeCarrier;
		CodeType =:= ?CodeTypeCollect ->
			?ObjTypeCollect;
		CodeType =:= ?CodeTypeUseItem ->
			?ObjTypeUseItem;
		CodeType =:= ?CodeTypePet ->
			?ObjTypePet;
		true ->
			?ObjTypeActor
	end.

release()-> ets:delete(?CodeEts).

-spec initEtsTab(CodeType) -> ok when CodeType::code_type().
initEtsTab(CodeType) ->
	DBID = gsMainLogic:getDBID4GS(),
	ADBID = gsMainLogic:getADBID4GS(),
	MinCode = genCode(CodeType, ADBID, DBID, 0),
	MaxCode = genCode(CodeType, ADBID, DBID, (1 bsl ?Bit_IDRange) - 1),
	ets:insert(?CodeEts,#rec_code{type = CodeType,curCode = MinCode, minCode = MinCode, maxCode = MaxCode}),
	?LOG_OUT("Type[~w],ADBID[~w],dbid[~w],min[~w],max:[~w]", [CodeType,ADBID,DBID,MinCode,MaxCode]),
	ok.

%%当达到最大值时，会自动从最小值再次开始
-spec genCode(Type) -> uint64() when Type::uid_type().
genCode(Type) ->
	[#rec_code{minCode = MinCode, maxCode = MaxCode}] = ets:lookup(?CodeEts, Type),
	ets:update_counter(?CodeEts, Type, {#rec_code.curCode, 1, MaxCode, MinCode}).

genCode(CodeType, ADBID, DBID, BaseCode) ->
	<<Code:64>> = <<0:?Bit_Highest, CodeType:?Bit_Type, ADBID:?Bit_ADBID, DBID:?Bit_DBID,BaseCode:?Bit_IDRange>>,
	Code.

parseCode(Code) ->
	<<_:?Bit_Highest, CodeType:?Bit_Type, ADBID:?Bit_ADBID, DBID:?Bit_DBID, BaseCode:?Bit_IDRange>> = <<Code:64>>,
	{CodeType,ADBID,DBID,BaseCode}.
