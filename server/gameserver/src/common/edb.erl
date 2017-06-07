%% @author zhongyunawei
%% @doc @todo erlang内置数据库相关.


-module(edb).
-author(zhongyuanwei).

-include("common.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	init/0,
	start/0,
	stop/0,
	release/0,
	tran/2,
	createTable/2,
	deleteTable/1,
	deleteRecord/2,
	clearTable/1,
	syncToNode/1,
	writeRecord/1,
	writeRecord/2,
	s_writeRecord/1,
	readAllRecord/1,
	readRecord/2,
	indexReadRecord/3,
	selectRecord/1,
	getTableSize/1,
	readAllKeys/1
]).

-export([
	dirtyReadRecord/2,
	dirtyMatchRecord/2,
	dirtyWriteRecord/1,
	dirtyWriteRecord/2,
	dirtyDeleteRecord/2
]).

-export([
	dirtySave/5,
	checkAndSave/5,
	deleteDBMemSave/4,
	selectTableAndClearTable/1,
	selectTableAndClearTable/2,
	selectTableAndClearTable_Bag/1
]).

-spec init() -> boolean().
init() ->
	case mnesia:create_schema([node()]) of
		ok->
			true;
		{error,{_, {already_exists, _}}} ->
			true;
		{error,Reason1}->
			?LOG_OUT("error,mnesia:create_schema,reason:~p ~n",[Reason1]),
			false
	end.

-spec start() -> boolean().
start() ->
	case mnesia:start() of
		ok->
			true;
		{error,Reason2}->
			io:format("error,mnesia:start,reason:~p ~n",[Reason2]),
			false
	end.

stop() ->
	mnesia:stop().

-spec release() -> ok.
release() ->
	mnesia:delete_schema([node()]),
	ok.

%%同步mnesia到指定节点
-spec syncToNode(Node) -> boolean() when Node::node().
syncToNode(Node) ->
	case mnesia:change_config(extra_db_nodes, [Node]) of
		{ok, ReturnValue} ->
			?LOG_OUT("syncToNode:~p ok,Ret:~p",[Node,ReturnValue]),
			Tables = mnesia:system_info(tables),
			mnesia:wait_for_tables(Tables,10000),
			true;
		{error, Reason} ->
			?ERROR_OUT("syncToNode:~p failed:~p",[Node,Reason]),
			false
	end.

%%创建表
-spec createTable(TabName,Arg) -> boolean() when
	TabName::etsTab(),Arg::list().
createTable(TabName,Arg) ->
	case mnesia:create_table(TabName, Arg) of
		{atomic, ok} ->
			true;
		{aborted, {already_exists, _}} ->
			true;
		{aborted, Reason} -> 
			?ERROR_OUT("create mnesia table failed[~p]",[Reason]),
			false
	end.

%%删除表中的所有数据及表结构
-spec deleteTable(TabName) -> boolean() when
	TabName::etsTab().
deleteTable(TabName) ->
	case mnesia:delete_table(TabName) of
		{atomic, ok} ->
			true;
		{aborted, Reason} -> 
			?ERROR_OUT("delete mnesia table failed[~p]",[Reason]),
			false
	end.

%%清除表中的所有数据
-spec clearTable(TabName) -> boolean() when
	TabName::etsTab().
clearTable(TabName) ->
    case mnesia:clear_table(TabName) of
        {atomic, ok} ->
            true;
        {aborted, Reason} ->
            ?ERROR_OUT("clear mnesia table failed[~p]",[Reason]),
            false
    end.

%%删除指定Key的记录
-spec deleteRecord(TabName, Key) -> boolean() when
	TabName::etsTab(),Key::term().
deleteRecord(TabName, Key) ->
	F = fun() ->
		mnesia:delete({TabName, Key})
	end,
	Ret = mnesia:transaction(F),
	case Ret of
		{atomic,ok} ->
			true;
		Reason ->
			?ERROR_OUT("error delete record:[~p]",[Reason]),
			false
	end.

%%%%使用普通锁写入一条记录
-spec writeRecord(Record) -> ok when
	Record::tuple().
writeRecord(Record) ->
	dirtyWriteRecord(Record).
%writeRecord(Record) ->
%	F = fun() ->
%		mnesia:write(Record)
%	end,
%	Ret = mnesia:transaction(F),
%	case Ret of
%		{atomic,ok} ->
%			skip;
%		Reason ->
%			?ERROR_OUT("error write record:[~p]",[Reason])
%  	end,
%	ok.

%%使用粘锁写记录
-spec s_writeRecord(Record) -> ok when Record::tuple().
s_writeRecord(Record) ->
	F = fun() ->
		mnesia:s_write(Record,write)
	end,
	Ret = mnesia:transaction(F),
	case Ret of
		{atomic,ok} ->
			skip;
		Reason ->
			?ERROR_OUT("error write record:[~p]",[Reason])
	end,
	ok.

-spec writeRecord(Table,Record) -> ok when Table::atom(),Record::tuple().
writeRecord(Table,Record) ->
	dirtyWriteRecord(Table, Record).
%writeRecord(Table,Record) ->
%	F = fun() ->
%		mnesia:write(Table,Record,write)
%	end,
%	Ret = mnesia:transaction(F),
%	case Ret of
%		{atomic,ok} ->
%			skip;
%		Reason ->
%			?ERROR_OUT("error write record:[~p]",[Reason])
%	end,
%	ok.

%%使用普通锁读取指定Key的记录
-spec readRecord(TabName,Key) ->  term() when
		  TabName::atom(),Key::term().
readRecord(TabName,Key) ->
	dirtyReadRecord(TabName,Key).
%readRecord(TabName,Key) ->
%	F = fun() ->
%		mnesia:read(TabName, Key)
%	end,
%	Ret = mnesia:transaction(F),
%	case Ret of
%		{atomic, ResultOfFun} ->
%			ResultOfFun;
%		_ ->
%			[]
%	end.

dirtyDeleteRecord(Table, Key) ->
	mnesia:dirty_delete(Table, Key).

dirtyReadRecord(Table, Key) ->
	case mnesia:dirty_read(Table, Key) of
		List when erlang:is_list(List) ->
			List;
		_Error ->
			?ERROR_OUT("dirtyReadRecord:~p,~p", [Table, Key]),
			[]
	end.

dirtyMatchRecord(Table, Match) ->
	case mnesia:dirty_match_object(Table, Match) of
		List when erlang:is_list(List) ->
			List;
		_Error ->
			?ERROR_OUT("dirtyMatchRecord:~p,~p", [Table, Match]),
			[]
	end.

dirtyWriteRecord(Value) ->
	mnesia:dirty_write(Value).

dirtyWriteRecord(Table, Value) ->
	mnesia:dirty_write(Table, Value).

%%通过索引字段
indexReadRecord(TabName,IndexKey,Pos) ->
	F = fun() ->
		mnesia:index_read(TabName, IndexKey,Pos)
	end,
	Ret = mnesia:transaction(F),
	case Ret of
		{atomic, ResultOfFun} ->
			ResultOfFun;
		_ ->
			[]
	end.

%% 读取表中的所有行
-spec readAllRecord(TabName) -> term() when
	TabName::etsTab().
readAllRecord(TabName) ->
	F =
		fun(Key, Acc) ->
			case mnesia:dirty_read(TabName, Key) of
				[] ->
					Acc;
				Result ->
					Result ++ Acc
			end
		end,
	lists:foldl(F, [], mnesia:dirty_all_keys(TabName)).
%readAllRecord(TabName) ->
%    selectRecord(qlc:q([X || X <- mnesia:table(TabName)])).

%% 按条件查询表
-spec selectRecord(SQLBin) -> term() when
	SQLBin::qlc:query_handle_or_list().
selectRecord(SQLBin) ->
    F = fun() ->
        qlc:e(SQLBin)
    end,
    case mnesia:transaction(F) of
        {atomic, Val} ->
            Val;
        _ ->
            []
    end.


readAllKeys(TabName) ->
	F =
		fun() ->
			mnesia:all_keys(TabName)
	    end,
	case mnesia:transaction(F) of
		{atomic, Val} ->
			Val;
		Error ->
			?WARN_OUT("Error:~p,stack=~p",[Error,misc:getStackTrace()]),
			[]
	end.

%dirtyReadAllKeys(TableName) ->
%	mnesia:dirty_all_keys(TableName).

selectTableAndClearTable(TabName) ->
	F = fun() ->
		AllKey = mnesia:all_keys(TabName),
		Fun = fun(Key,AccIn) ->
			[Row] = mnesia:read(TabName,Key,write),
			mnesia:delete({TabName,Key}),
			[Row | AccIn]
		end,
		lists:foldl(Fun,[],AllKey)
	end,
	case mnesia:transaction(F) of
		{atomic, Val} ->
			Val;
		Error ->
			?WARN_OUT("Error:~p,stack=~p",[Error,misc:getStackTrace()]),
			[]
	end.

selectTableAndClearTable(TabName,0) ->
	selectTableAndClearTable(TabName);
selectTableAndClearTable(TabName,MaxNum) ->
	F = fun() ->
		AllKey = mnesia:all_keys(TabName),
		Fun = fun(Key,{AccIn,N}) ->
			case N > MaxNum of
				true ->
					{break,{AccIn,N}};
				_ ->
					[Row] = mnesia:read(TabName,Key,write),
					mnesia:delete({TabName,Key}),
					{[Row | AccIn],N + 1}
			end
		end,
		{Ret,_} = misc:mapAccList(AllKey,{[],0},Fun),
		Ret
	end,
	case mnesia:transaction(F) of
		{atomic, Val} ->
			Val;
		Error ->
			?WARN_OUT("Error:~p,stack=~p",[Error,misc:getStackTrace()]),
			[]
	end.

%% {type,bag}模式类的表
selectTableAndClearTable_Bag(TabName) ->
	F =
		fun() ->
			Ret = mnesia:foldl(fun(R, Acc) -> [R | Acc] end, [], TabName),
			[mnesia:delete_object(TabName, Row, write) || Row <- Ret],
			Ret
		end,
	case mnesia:transaction(F) of
		{atomic, Val} ->
			Val;
		Error ->
			?WARN_OUT("Error:~p,stack=~p",[Error,misc:getStackTrace()]),
			[]
	end.

getTableSize(Table) ->
	Node = mnesia:table_info(Table,where_to_read),
	rpc:call(Node, mnesia, table_info, [Table,size]).

-spec dirtySave(Table, Key, Record, NewTable, UpdateTable) -> boolean() | ok | error when
	Table::atom(),Key::term(),Record::tuple(),NewTable::atom(),UpdateTable::atom().
dirtySave(Table, Key, Record, NewTable, UpdateTable) ->
	F = fun() ->
				case mnesia:dirty_read(Table, Key) of
					[Record] ->
						ok;
					[] ->
						%% 先写主表
						mnesia:dirty_write(Table, Record),
						mnesia:dirty_write(NewTable, Record),
						true;
					_ ->
						%% 先写主表
						mnesia:dirty_write(Table, Record),
						case mnesia:dirty_read(NewTable, Key) of
							[_H|_T] ->
								%%还没有插入到数据库，可以直接更新此数据
								mnesia:dirty_write(NewTable, Record);
							[] ->
								%%需要更新
								mnesia:dirty_write(UpdateTable, Record)
						end,
						false
				end
		end,
	case mnesia:transaction(F) of
		{atomic, Val} ->
			Val;
		Error ->
			?WARN_OUT("Error:~p,stack=~p",[Error,misc:getStackTrace()]),
			error
	end.
	
%%首先从缓存数据库查找是否有此记录，如果没有则说明是需要新插入，否则是更新
%%添加新记录返回true,更新已有记录返回false,没有不需要更新则返回ok
-spec checkAndSave(TableName,Key,Record,NewTableName,UpdateTableName) -> boolean() | ok | error when
	TableName::atom(),Key::term(),Record::tuple(),NewTableName::atom(),UpdateTableName::atom().
checkAndSave(TableName,Key,Record,NewTableName,UpdateTableName) ->
	F = fun() ->
		case mnesia:read(TableName,Key,write) of
			[Record] ->
				%%如果记录相同，则不更新
				ok;
			[] ->
				%%需要新插入
				mnesia:write(NewTableName,Record,write),
				%%最后写入缓存数据库
				mnesia:write(Record),
				true;
			_ ->
				case mnesia:read(NewTableName,Key,write) of
					[_H|_T] ->
						%%还没有插入到数据库，可以直接更新此数据
						mnesia:write(NewTableName,Record,write);
					[] ->
						%%需要更新
						mnesia:write(UpdateTableName,Record,write)
				end,
				%%最后写入缓存数据库
				mnesia:write(Record),
				%%由于缓存中已经存在，所以这里返回false表示是更新
				false
		end
	end,
	Ret = do(TableName, F),
	case Ret of
		{atomic, Val} ->
			Val;
		Error ->
			?WARN_OUT("Error:~p,stack=~p",[Error,misc:getStackTrace()]),
			error
	end.
-ifdef(RELEASE).

do(_TableName, F) ->
	mnesia:transaction(F).

-else.

do(TableName, F)->
	tran(TableName, F).
-endif.

%%删除内存数据库中的指定Key的记录，同时删除New表与Update表中的相应记录
%%如果从New表中查到有对应Key的记录则返回true，没查找到就返回false，错误返回error
deleteDBMemSave(TableName,NewTableName,UpdateTableName,Key) ->
	F = fun() ->
		Flag = case mnesia:read({NewTableName,Key}) of
				   [_] ->
					   true;
				   _ ->
					   false
			   end,
		mnesia:delete({TableName,Key}),
		mnesia:delete({NewTableName,Key}),
		mnesia:delete({UpdateTableName,Key}),
		Flag
	end,
	case mnesia:transaction(F) of
		{atomic, Val} ->
			Val;
		Error ->
			?WARN_OUT("Error:~p,stack=~p",[Error,misc:getStackTrace()]),
			error
	end.

tran(Table, Fun) ->
	statistics(wall_clock),
	Ret = mnesia:transaction(Fun),
    {_, T1} = statistics(wall_clock),
	case T1 >= 10 of
		true ->
   			?LOG_OUT("table [~p] using time: ~p ms", [Table, T1]);
		_ ->
			skip
	end,
	Ret.

%% ====================================================================
%% Internal functions
%% ====================================================================


