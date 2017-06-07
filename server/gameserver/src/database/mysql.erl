%%%Mysql数据库相关处理
-module(mysql).
-author(zhongyuanwei).

-include("logger.hrl").
-include("mysql.hrl").
-include("emysql.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	init/0,
	keepalive/0,
	close/0,
	nextResult/1,
	firstRow/1,
	nextRow/1,
	queryScalar/1,
	getFieldValue/2
]).

-import(misc, [
	ini_ReadString/3,
	ini_ReadInt/3
]).

-spec init() -> true.
init() ->
	crypto:start(),
	application:start(emysql),
	addDBPool(),
	addLoginDBPool(),
	addLogDBPool(),
	addActiveCodeDBPool(),
	addRechargePool(),
	true.

-spec close() -> true.
close() ->
	emysql:remove_pool(?GAMEDB_CONNECT_POOL),
	emysql:remove_pool(?LOGDB_CONNECT_POOL),
	emysql:remove_pool(?LOGINDB_CONNECT_POOL),
	emysql:remove_pool(?ACTIVECODEDB_CONNECT_POOL),
	emysql:remove_pool(?RECHARGE_CONNECT_POOL),
	true.

-spec keepalive() -> ok.
keepalive() ->
	Sql = "select now()",
	emysql:execute(?LOGINDB_CONNECT_POOL, Sql),
	emysql:execute(?GAMEDB_CONNECT_POOL, Sql),
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================

%添加游戏数据库连接到连接池
-spec addDBPool() -> true.
addDBPool() ->
	DBIP = config:rpc_get_string("DBIP", "localhost"),
	DBUserName = config:rpc_get_string("DBUserName", "root"),
	DBPassword = config:rpc_get_string("DBPassword", "123"),
	DBPort = config:rpc_get_int("DBPort", 3306),
	DBName = config:rpc_get_string("DBName", "test"),
	?LOG_OUT("Connect DB[~p:~p ~p]", [DBIP, DBPort, DBName]),
	emysql:add_pool(?GAMEDB_CONNECT_POOL, ?GAMEDB_CONNECT_NUM,
		DBUserName,
		DBPassword,
		DBIP,
		DBPort,
		DBName,
		utf8),
	true.


%添加游戏Log数据库连接到连接池
-spec addLogDBPool() -> true.
addLogDBPool() ->
	DBIP = config:rpc_get_string("LogDBIP", "localhost"),
	DBUserName = config:rpc_get_string("LogDBUserName", "root"),
	DBPassword = config:rpc_get_string("LogDBPassword", "123"),
	DBPort = config:rpc_get_int("LogDBPort", 3306),
	DBName = config:rpc_get_string("LogDBName", "test"),
	?LOG_OUT("Connect LogDB[~p:~p ~p]", [DBIP, DBPort, DBName]),
	emysql:add_pool(?LOGDB_CONNECT_POOL, ?LOGDB_CONNECT_NUM,
		DBUserName,
		DBPassword,
		DBIP,
		DBPort,
		DBName,
		utf8),
	true.

%添加激活码数据库连接到连接池
-spec addActiveCodeDBPool() -> true.
addActiveCodeDBPool() ->
	DBIP = config:rpc_get_string("ActiveCodeDBIP", "localhost"),
	DBUserName = config:rpc_get_string("ActiveCodeDBUserName", "root"),
	DBPassword = config:rpc_get_string("ActiveCodeDBPassword", "123"),
	DBPort = config:rpc_get_int("ActiveCodeDBPort", 3306),
	DBName = config:rpc_get_string("ActiveCodeDBName", "test"),
	?LOG_OUT("Connect ActiveCodeDB[~p:~p ~p]", [DBIP, DBPort, DBName]),
	emysql:add_pool(?ACTIVECODEDB_CONNECT_POOL, ?ACTIVECODEDB_CONNECT_NUM,
		DBUserName,
		DBPassword,
		DBIP,
		DBPort,
		DBName,
		utf8),
	true.

%添加游戏数据库连接到连接池
-spec addLoginDBPool() -> true.
addLoginDBPool() ->
	LOGINDBIP = config:rpc_get_string("LOGINDBIP", "localhost"),
	LOGINDBUserName = config:rpc_get_string("LOGINDBUserName", "root"),
	LOGINDBPassword = config:rpc_get_string("LOGINDBPassword", "123"),
	LOGINDBPort = config:rpc_get_int("LOGINDBPort", 3306),
	LOGINDBName = config:rpc_get_string("LOGINDBName", "test"),
	?LOG_OUT("Connect LOGINDB[~p:~p ~p]", [LOGINDBIP, LOGINDBPort, LOGINDBName]),
	emysql:add_pool(?LOGINDB_CONNECT_POOL, ?LOGINDB_CONNECT_NUM,
		LOGINDBUserName,
		LOGINDBPassword,
		LOGINDBIP,
		LOGINDBPort,
		LOGINDBName,
		utf8),
	true.

%添加订单支付数据库连接到连接池
-spec addRechargePool() -> true.
addRechargePool() ->
	DBIP = config:rpc_get_string("DBIP", "localhost"),
	DBUserName = config:rpc_get_string("DBUserName", "root"),
	DBPassword = config:rpc_get_string("DBPassword", "123"),
	DBPort = config:rpc_get_int("DBPort", 3306),
	DBName = config:rpc_get_string("DBName", "test"),
	?LOG_OUT("Connect DB[~p:~p ~p]", [DBIP, DBPort, DBName]),
	emysql:add_pool(?RECHARGE_CONNECT_POOL, ?RECHARGE_CONNECT_NUM,
		DBUserName,
		DBPassword,
		DBIP,
		DBPort,
		DBName,
		utf8),
	true.
%获取下一个结果集
-spec nextResult(List :: list()) -> {#result_packet{}, Left :: any()} | false.
nextResult([H | T]) ->
	case H of
		#result_packet{} ->
			{H, T};
		_ ->
			false
	end;
nextResult(#result_packet{} = R) ->
	{R, []};
nextResult(#error_packet{} = Pkg) ->
	throw(Pkg#error_packet.msg);

nextResult(_) ->
	false.

%根据emysql驱动返回的结果记录集获取第一行记录
-spec firstRow(#result_packet{}) -> #mysqlRows{}.
firstRow(#result_packet{} = Pkg) ->
	FieldNames = emysql_util:field_names(Pkg),
	List = lists:map(fun(X) -> erlang:binary_to_list(X) end, FieldNames),
	Rows = Pkg#result_packet.rows,
	case Rows of
		[Row | LeftRow] ->
			#mysqlRows{fieldNames = List, row = Row, remainRows = LeftRow};
		[] ->
			#mysqlRows{fieldNames = List, row = [], remainRows = []}
	end.


queryScalar(#result_packet{} = Pkg)->
	Row = mysql:firstRow( Pkg ),
	CurRow = Row#mysqlRows.row,
	Size = misc:size(CurRow),
	case Size >= 1 of
		true ->
			lists:nth(1, CurRow);
		false ->
			undefined
	end.

%根据上次获取的行记录信息，获取下一行记录
-spec nextRow(#mysqlRows{}) -> #mysqlRows{}.
nextRow(#mysqlRows{} = Rows) ->
	case Rows#mysqlRows.remainRows of
		[Row | LeftRow] ->
			Rows#mysqlRows{row = Row, remainRows = LeftRow};
		_ ->
			Rows#mysqlRows{row = [], remainRows = []}
	end.

%根据字段名或者字段索引获取字段的值，
%如果明确知道字段的索引，建议直接使用字段的索引，以提高效率。
-spec getFieldValue(FieldName | FieldIndex, #mysqlRows{}) -> any() when
	FieldName :: string(), FieldIndex :: pos_integer().
getFieldValue(FieldName, #mysqlRows{} = Row) when erlang:is_list(FieldName) ->
	Pos = misc:getListPos(FieldName, Row#mysqlRows.fieldNames),
	case Pos > 0 of
		true ->
			lists:nth(Pos, Row#mysqlRows.row);
		false ->
			throw("Can't found FiledName")
	end;

getFieldValue(FieldIndex, #mysqlRows{} = Row) when erlang:is_integer(FieldIndex) ->
	CurRow = Row#mysqlRows.row,
	Size = misc:size(CurRow),
	case FieldIndex > 0 andalso FieldIndex =< Size of
		true ->
			lists:nth(FieldIndex, CurRow);
		false ->
			throw(badarg)
	end.

%% %根据数据库返回的结果，获取结果中所有的字段与值。
%% -spec getDBResult(Result) -> {RowNum, {FieldNames},{Rows} } | true | false when
%% 		  Result :: [ResultPkg|OkPkg] | #result_packet{},
%% 		  ResultPkg :: #result_packet{}, OkPkg :: #ok_packet{},
%% 		  FieldNames :: list(),
%% 		  RowNum :: non_neg_integer(),
%% 		  Rows :: list().
%% getDBResult([#result_packet{} = Result,#ok_packet{} = P]) ->
%% 	RowNum = P#ok_packet.affected_rows,
%% 	FieldName = emysql_util:field_names(Result),
%% 	List = lists:map(fun(X) -> erlang:binary_to_list(X) end, FieldName),
%% 	Rows = Result#result_packet.rows,
%% 	{RowNum,{List} , {Rows}};
%% 
%% getDBResult(#ok_packet{}) ->
%% 	true;
%% 
%% getDBResult(_) ->
%% 	false.
%% 
%% %根据字段名获取结果集中第RowNo行的值
%% -spec getDBField(FieldName,RowNo,{RowNum, {FieldNames},{Rows} }) -> { FieldName, Value } when
%% 		  FieldName :: string(), RowNo:: non_neg_integer(), RowNum :: non_neg_integer(),
%% 		  FieldNames :: list(), Rows :: list(), Value :: any().
%% getDBField(FieldName,RowNo,{RowNum, {FieldNames},{RowNum,Rows} }) when is_list(FieldNames) andalso is_list(Rows) ->
%% 	Pos = misc:getListPos(FieldName,FieldNames),
%% 	case Pos > 0 of
%% 		true ->
%% 			case RowNo > 0 andalso RowNo =< RowNum of
%% 				true ->
%% 					Row = lists:nth(RowNo, Rows),
%% 					{ FieldName,lists:nth(Pos, Row) };
%% 				false ->
%% 					false
%% 			end;
%% 		false ->
%% 			false
%% 	end;
%% 
%% getDBField(_,_,_) ->
%% 	false.


