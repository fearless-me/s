%%%ets操作自定义接口
-module(myEts).

%%
%% Include files
%%
-include("logger.hrl").
-include_lib("stdlib/include/ms_transform.hrl").

-type tab() :: atom() | port().

-compile(export_all).



%更新Ets表Table中Key对应的记录或者元组中字段索引为ValueFieldIndex的值
-spec changeField(Table,Key,ValueFieldIndex,Value) -> boolean() when
  Table :: tab(), Key :: term(), ValueFieldIndex ::  non_neg_integer(), Value :: term().
changeField( Table, Key, Field, Value ) ->
	ets:update_element(Table, Key, {Field,Value}).

%在Ets表Table中插入一条值，值可以是记录，也可以是普通元组
-spec insertRecord(Table, Record) -> true when
		  Table :: tab(), Record :: tuple().
insertRecord( Table, Record ) ->
	ets:insert( Table, Record).

%删除Ets表Table中的Key对应的记录或者元组
-spec deleteRecord(Table, Key ) -> true when
		  Table :: tab(), Key :: term().
deleteRecord(Table, Key ) ->
	ets:delete( Table, Key).

%删除Ets表Table中的所有内容
-spec deleteAllRecord(Table) -> true when
		  Table :: tab().
deleteAllRecord(Table) ->
	ets:delete_all_objects(Table).

%获取Ets表Table中为关键字为Key的记录或者元组
-spec readRecord( Table, Key ) -> {} | tuple() when
		  Table :: tab(), Key :: term().
readRecord( Table, Key ) ->
	%%check Table 
    IsAtom = is_atom(Table),
    case IsAtom orelse (IsAtom =:= false andalso Table =/= 0) of
        false ->
            ?ERROR_OUT("---error,Table:~p, Key:~p",[Table,Key]);
        true->ok
    end,

    RecordList = ets:lookup(Table, Key),
	case RecordList of
		[]->{};
		[R]->R
	end.

%获取Ets表Table中关键字为Key的记录或者元组中字段索引为FieldIndex的值
-spec getRecordField( Table, Key, FieldIndex ) -> term() | [term()]  when
		  Table :: tab(), Key :: term(), FieldIndex :: non_neg_integer().
getRecordField( Table, Key, FieldIndex )->
	ets:lookup_element(Table, Key, FieldIndex).

%对Ets表Table中的所有关键字对应的记录或者元组执行一目函数Func
%这个ETS的遍历效率不高，如果有大量此需求，建议使用kvArray。
-spec etsFor( Table, Func ) -> ok when
		  Table :: tab(), Func :: function().
etsFor( Table, Func ) when erlang:is_function(Func, 1)->
	List = ets:tab2list(Table),
	Fun = fun(X) ->
		Func(X)
	end,
	lists:foreach(Fun,List),
	ok.

%获取Ets表Table中的所有记录或者元组
-spec getAllRecord( Table ) -> [Match] when
  Table :: tab(), Match :: term().
getAllRecord( Table )->
	Q = ets:fun2ms( fun( Record )-> Record end),
	ets:select(Table, Q).

%获取Ets表Table中的记录或者元组数量
-spec getCount(Table) -> NumMatched when
		  Table :: tab(), NumMatched :: non_neg_integer().
getCount(Table)->
	ets:info(Table, size).

selectEts(ObjectEts, MatchSpec) ->
	ets:select(ObjectEts, MatchSpec).

selectEts(ObjectEts, MatchSpec,Limit) ->
	ets:select(ObjectEts, MatchSpec,Limit).


updateEts(Ets, Code, L) ->
	ets:update_element(Ets, Code, L).

lookUpEts(Ets, Code) ->
	ets:lookup(Ets, Code).

deleteEts(Ets, Code) ->
	ets:delete(Ets, Code).

insertEts(Ets, Tuple) ->
	ets:insert(Ets, Tuple).
