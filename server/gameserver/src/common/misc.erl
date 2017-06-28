%%%一些实用函数
-module(misc).

%%
%% Include files
%%
-include("logger.hrl").
-include("setup.hrl").
-include("type.hrl").

-define(DEFAULT_BASENUM, 10000).
-define(DEFAULT_MIN_PROPNUM, 0).

-define(HTTPC_AUTH_TIMEOUT,1000*10).%%http请求超时设置S

%%Exported Functions
-export([
	closeMyTcp/2,
	ceil/1,
	clamp/3,
	calcDistSquare/4,
	rand/2,
	randUniqueFromList/2,
	rand/3,
	min/2,
	isPossible/1,
	calcOddsByWeightList/1,
	calcOddsByAfterWeightList/1,
	testBit/2,
	setBit/2,
	size/1,
	appendArray/2,
	for/5,
	while/6,
	mapList/2,
	ssplit/2,
	ssplit_all/2,
	intersection/2,
	mapAccList/3,
	catStringID/2,
	formatString/1,
	isZero/1,
	isEqual/2,
	addTwoList/2,
	listForEachAdd/3,
	getListPos/2,
	beginTryCatchFunc/5,
	record_to_list/1,
	list_to_record/2,
	set_sockopt/2,
	getLocalIP/0,
	getRemoteIP_Port/1,
	string_to_term/1,
	term_to_string/1,
	getStackTrace/0,
	convertBool2Int/1,
	convertBoolFromInt/1,
	binToString/1,
	toInteger/1,
	toFloat/1,
	toPercent/2,
	clear_msg_queue/0,
	is_process_alive/1,
	pid_to_integer/1,
	get_pos_state/2,
	set_pos_state/3,
	takeRepeatMember/2,
	removeSameMember/2,
	foldlEx/3,
	httpPost/2,
	httpPost/3,
	isInArea/5,
	shuffle/1,
	listUnit8_to_stringASCII/1,
	listUnit8_to_stringASCII_inverse/1,
	clear_os_cache/0,
	monitor_nodes/0,
	getListValue/2,
	anti_sqlInjectionAttack/1
]).

-compile({inline,
	[
		clamp/3,
		calcDistSquare/4,
		rand/2,
		isPossible/1,
		isPossible/2
	]}).

%% ====================================================================
%% API functions
%% =============		=======================================================
%% 统一关闭socket的入口
-spec closeMyTcp( Socket:: port(), Sender::term() ) ->ok.
closeMyTcp( Socket, Sender ) ->
	?LOG_OUT("server close socket pid:~p,sender:~p",[self(),Sender]),
	gen_tcp:close(Socket).

%%返回大于或者等于指定表达式的最小整数，即向上取整函数
-spec ceil(Number) -> int() when
	Number::number().
ceil(Number) ->
	Int = erlang:trunc(Number),
	case Number - Int of
		Remain when Remain > 0 ->
			Int + 1;
		_ ->
			Int
	end.

%%限定X的范围
-spec clamp(X,Min,Max) -> Min | X | Max when
		  X::number(),Min::number(),Max::number().
clamp(X,Min,Max) when Min =< Max andalso X < Min ->
	Min;
clamp(X,Min,Max) when Min =< Max andalso X > Max ->
	Max;
clamp(X,Min,Max) when Min =< Max ->
	X.

min(X, Y) when X >= Y ->
	Y;
min(X, _Y) ->
	X.

%%计算两点之间的距离平方
-spec calcDistSquare(X1,Y1,X2,Y2) -> number() when
		  X1::number(),Y1::number(),X2::number(),Y2::number().
calcDistSquare(X1,Y1,X2,Y2) ->
	DX = X2 - X1,
	DY = Y2 - Y1,
	DX * DX + DY * DY.

%%随机生成Min到Max之间的数，范围[Min,Max]
-spec rand(Min,Max) -> number()|error when
		  Min::number(),Max::number().
rand(Min,Max) when Min =:= Max ->
	Min;
rand(Min,Max) when (erlang:is_integer(Min) andalso erlang:is_integer(Max)) andalso Min < Max ->
	Diff = Max - Min + 1,
	Min + random:uniform(Diff) - 1;
rand(Min,Max) when (erlang:is_float(Min) orelse erlang:is_float(Max)) andalso Min < Max ->
	Diff = Max - Min,
	Min + random:uniform() * Diff;
rand(Min,Max) ->
	?ERROR_OUT("rand err,min[~w] max[~w] ~p",[Min,Max,getStackTrace()]),
	error.

%%从列表中不重复随机N次
randUniqueFromList(N,List) ->
	L = lists:seq(1,N),
	Len = erlang:length(List),
	Fun = fun(_I,{Result,AccIn,Size}) ->
		{R,RL} = deleteListnth(rand(1,Size),AccIn,[]),
		{[R | Result],RL,Size - 1}
	end,
	{Ret,_,_} = lists:foldl(Fun,{[],List,Len},L),
	Ret.

deleteListnth(1, [H|T],AccIn) -> {H,appendList(T,AccIn)};
deleteListnth(N, [H|T],AccIn) when N > 1 ->
	deleteListnth(N - 1, T,[H | AccIn]).

appendList([],AccIn) ->
	AccIn;
appendList([H|T],AccIn) ->
	appendList(T,[H | AccIn]).


%%随机生成Min到Max之间浮点数据的数据,并带精度
rand(Min, Max, Precision) when erlang:is_integer(Min) andalso erlang:is_integer(Max) andalso Min =< Max andalso Precision >= 0 ->
	rand(Min, Max);
rand(Min, Max, 0) when (erlang:is_float(Min) orelse erlang:is_float(Max)) andalso Min =< Max ->
	rand(trunc(Min), trunc(Max));
rand(Min, Max, Precision) when (erlang:is_float(Min) orelse erlang:is_float(Max)) andalso Min =< Max andalso Precision > 0->
	E = math:pow(10, Precision),
	R = rand(trunc(Min * E), trunc(Max * E)),
	R / E ;
rand(Min,Max, _) ->
	?ERROR_OUT("rand err,min[~w]max[~w]",[Min,Max]),
	error.

%% 概率满足
-spec isPossible(ProbNum) -> Result when
		  ProbNum :: uint(),
		  Result :: boolean().
isPossible(ProbNum) ->
	isPossible(ProbNum, ?DEFAULT_BASENUM).

%% 概率满足
-spec isPossible(ProbNum, BaseNum) -> Result when
		  ProbNum :: uint(),
		  BaseNum :: uint(),
		  Result :: boolean().
isPossible(ProbNum, BaseNum) ->
	isPossible(?DEFAULT_MIN_PROPNUM, ProbNum, BaseNum).

%% 概率满足
-spec isPossible(MinProbNum, MaxProbNum, BaseNum) -> Result when
		  MinProbNum :: uint(),
		  MaxProbNum :: uint(),
		  BaseNum :: uint(),
		  Result :: boolean().
isPossible(MinProbNum, MaxProbNum, BaseNum) when MinProbNum < MaxProbNum
  										andalso erlang:is_integer(MinProbNum) andalso MinProbNum >= 0
  										andalso erlang:is_integer(MaxProbNum) andalso MaxProbNum > 0 ->
	case rand(0, BaseNum) of
		RandomNum when RandomNum >= MinProbNum andalso RandomNum < MaxProbNum ->
			true;
		_ ->
			false
	end.

%%根据权重计算几率，返回自定义的额外信息
-spec calcOddsByWeightList(List) -> ExtInfo when
	List::[{Weight,ExtInfo},...],Weight::number(),ExtInfo::term().
calcOddsByWeightList([]) ->
	throw(badarg);
calcOddsByWeightList(List) ->
	{List1,_List2} = lists:unzip(List),
	Sum = lists:sum(List1),
	R = random:uniform(Sum),
	calcOddsByWeightList(List,R,0).

%%根据权重计算几率，返回自定义的额外信息
-spec calcOddsByAfterWeightList(List) -> ExtInfo when
	List::[{ExtInfo, Weight},...],Weight::number(),ExtInfo::term().
calcOddsByAfterWeightList([]) ->
	throw(badarg);
calcOddsByAfterWeightList(List) ->
	{_List1,List2} = lists:unzip(List),
	Sum = lists:sum(List2),
	R = random:uniform(Sum),
	calcOddsByAfterWeightList(List,R,0).

%测试A中是否有旗标Flag，如果有返回true，否则返回false
-spec testBit(A,Flag) -> boolean() when
          A::uint(),Flag::uint().
testBit(A,Flag) when erlang:is_integer(A) andalso erlang:is_integer(Flag)->
    (A band Flag) /= 0.

%在A中设置旗标Flag，返回一个新的值B
-spec setBit(A,Flag) -> B when
          A::uint(),Flag::uint(),B::uint().
setBit(A,Flag) when erlang:is_integer(A) andalso erlang:is_integer(Flag)->
    A bor Flag.

%计算列表（list）、元组（tuple）、二进制数据以及数组（array）的大小
-spec size(Item) -> non_neg_integer() when
	Item :: list() | tuple() | binary() | array:array().

size(Item) when erlang:is_list(Item) ->
	erlang:length(Item);

size(Item) when erlang:is_binary(Item) ->
	erlang:size(Item);

size(Item) ->
	IsArray = array:is_array(Item),
	if
		%必须先匹配数组，否则会匹配为元组，因为数组也是元组
		IsArray ->
			array:size(Item);
		erlang:is_tuple(Item) ->
			erlang:size(Item);
		true ->
			throw(badarg)
	end.

%将数组B中的所有元素依次添加到数组A的后面，返回一个新的数组
-spec appendArray(ArrayA,ArrayB) -> Array when
		  ArrayA :: array:array(),
		  ArrayB :: array:array(),
		  Array :: array:array().
appendArray(ArrayA,ArrayB) ->
	Flag = array:is_array(ArrayA) andalso array:is_array(ArrayB) andalso (not array:is_fix(ArrayA)),
	case Flag of
		true ->
			SizeA = array:size(ArrayA),
			SizeB = array:size(ArrayB),
            if
                SizeA > 0 andalso SizeB > 0 ->
                    appendArray(ArrayA,SizeA,ArrayB,0,SizeB);
                SizeA =:= 0 ->
                    ArrayB;
                SizeB =:= 0 ->
                    ArrayA
            end;                    
		false ->
			throw(badarg)
	end.

%无参数，带累加器的循环
-spec for(I::integer(),N::integer(),Step::integer(),AccIn::any(),F::function()) -> any().
for(N,N,Step,AccIn,F) when erlang:is_integer(N) andalso erlang:is_integer(Step) andalso erlang:is_function(F, 2)->
	AccIn;
for(I,N,Step,AccIn,F) when erlang:is_integer(N) andalso erlang:is_function(F, 2) andalso I < N ->
	Acc = F(I,AccIn),
	for(I + Step,N,Step,Acc,F).

%带参数，带累加器，支持中断的循环
-spec while(I::integer(),N::integer(),Step::integer(),F::function(),Arg::term(),AccIn::any()) -> any().
while(N,N,Step,F,_Arg,AccIn) when erlang:is_integer(N) andalso erlang:is_integer(Step) andalso erlang:is_function(F, 3) ->
	AccIn;
while(I,N,Step,F,Arg,AccIn) when erlang:is_integer(I) andalso erlang:is_integer(N) andalso erlang:is_integer(Step)
  						andalso erlang:is_function(F, 3) andalso I < N ->
	Acc = F(I,Arg,AccIn),
	case Acc of
		{break,AccOut} ->
			AccOut;
		_ ->
			while(I+Step,N,Step,F,Arg,Acc)
	end.

%%带中断的List遍历,Fun可以返回break以中断遍历
-spec mapList(list(),function()) -> ok.
mapList([],Fun) when erlang:is_function(Fun,1) ->
	ok;
mapList([H|T],Fun) when erlang:is_function(Fun,1) ->
	case Fun(H) of
		break ->
			ok;
		_ ->
			mapList(T,Fun)
	end.

%%带累加器且可中断遍历List的函数，如果要中断遍历，返回{break,AccIn}
-spec mapAccList(List,AccIn,Fun) -> AccIn when
	List::list(),AccIn::term(),Fun::function().
mapAccList([],AccIn,Fun) when erlang:is_function(Fun,2) ->
	AccIn;
mapAccList([H|T],AccIn,Fun) when erlang:is_function(Fun,2) ->
	case Fun(H,AccIn) of
		{break,AccOut} ->
			AccOut;
		AccOut1 ->
			mapAccList(T,AccOut1,Fun)
	end.

catStringID( String, ID )->
	StringValue = io_lib:format( "~p", [ID] ),
	StringValue2 = lists:flatten(StringValue),
	String2 = String ++ StringValue2,
	String2.

%将Value格式化为一个字符串
formatString( Value )->
	StringValue = io_lib:format( "~p", [Value] ),
	lists:flatten(StringValue).

-spec isZero(any()) -> boolean().
isZero( Value ) when erlang:is_float(Value)->
	( Value >= -0.0001 ) andalso ( Value =< 0.0001 );

isZero(Value) when erlang:is_integer(Value) ->
    Value =:= 0;

isZero(_) ->
    false.

-spec isEqual(FA,FB)-> boolean() when
	FA::number(),FB::number().
isEqual(FA,FB)->
	isZero(FA - FB).

%%实现两个list的 ++
addTwoList(L1,[Head|RemainList])->
	ResultList = [Head|L1],
	addTwoList(ResultList,RemainList);
addTwoList(L1,[])->
	L1.
	
%%对List遍历，返回结果是个List，并且是++拼接结果
listForEachAdd( PreFunc, [Head|RemainList],AccList)->
	AccList1 = addTwoList(AccList,PreFunc( Head )),
	listForEachAdd( PreFunc,RemainList ,AccList1);
listForEachAdd( _PreFunc, [],AccList )->
	AccList.

%查找Value在List中的位置，如果找到则返回其位置 > 0，否则返回0
-spec getListPos(Value,List) -> Pos :: non_neg_integer() when 
		  Value :: any(), List :: list().
getListPos(Value,List) ->
	getListPos(Value,List,1).

getListPos(_Value,[],_Pos) ->
	0;
getListPos(Value,[H|T],Pos) ->
	case Value =:= H of
		true ->
			Pos;
		false ->
			getListPos(Value,T,Pos + 1)
	end.

%%由异常包裹的执行函数
beginTryCatchFunc( Func_Module, Func, Param, ExceptionFunc_Module, ExceptionFunc )->
	try
		case Param =:= 0 of
			true->
				Func_Module:Func();
			false->
				Func_Module:Func( Param )
		end
	catch
		_:Why->
			?ERROR_OUT( "Func_Module[~p] Func[~p] Param[~p] Why[~p] ExceptionFunc_Module[~p] ExceptionFunc[~p] stack[~p]",
						[Func_Module, Func, Param, Why, ExceptionFunc_Module, ExceptionFunc, erlang:get_stacktrace()] ),
			
			case (ExceptionFunc_Module =:= 0) or ( ExceptionFunc =:= 0) of
				true->ok;
				false->ExceptionFunc_Module:ExceptionFunc()
			end
	end.

%%记录转化成列表
-spec record_to_list(Record :: tuple()) -> list().
record_to_list(Record) when erlang:is_tuple(Record)->
	List1 = tuple_to_list(Record),
	[_RecordName|List] = List1,
	List.

%%列表转化成记录
-spec list_to_record(List :: list(), Record :: term()) -> tuple().
list_to_record(List,Record)->
	case List of
	[]->
		{};
	_->
		List1 = [Record] ++ List,
		list_to_tuple(List1)
	end.

%% Taken from prim_inet.  We are merely copying some socket options from the
%% listening socket to the new client socket.
-spec set_sockopt(ListSock :: port(), CliSocket :: port()) -> ok | {error,Error} when Error :: any().
set_sockopt(ListSock, CliSocket) when erlang:is_port(ListSock) andalso erlang:is_port(CliSocket) ->
    true = inet_db:register_socket(CliSocket, inet_tcp),
    case prim_inet:getopts(ListSock, [active, nodelay, keepalive, delay_send, priority, tos]) of
	    {ok, Opts} ->
	        case prim_inet:setopts(CliSocket, Opts) of
		        ok    -> ok;
		        Error -> ?MODULE:closeMyTcp(CliSocket, ?MODULE), Error
	        end;
	    Error ->
	        ?MODULE:closeMyTcp(CliSocket, ?MODULE), Error
    end.

%获取本机IP地址
-spec getLocalIP() -> string().
getLocalIP() ->
    {ok, Hostname} = inet:gethostname(),
    {ok, Address}  = inet:getaddr(Hostname, inet),
	AList = tuple_to_list(Address),
	[A1|AList1] = AList,
	[A2|AList2] = AList1,
	[A3|AList3] = AList2,
	[A4|_] = AList3,
	String = io_lib:format( "~w.~w.~w.~w", [A1,A2,A3,A4] ),
	String2 = lists:flatten(String),
	String2.

%获取SOCKET的远程IP
-spec getRemoteIP_Port(Socket) -> {IP,Port} when
	Socket::port(),IP::string(),Port::int().
getRemoteIP_Port(Socket) ->
	case inet:peername(Socket) of
		{ok, {Address, Port}} ->
			AList = tuple_to_list(Address),
			[A1|AList1] = AList,
			[A2|AList2] = AList1,
			[A3|AList3] = AList2,
			[A4|_] = AList3,
			String = io_lib:format( "~w.~w.~w.~w", [A1,A2,A3,A4] ),
			String2 = lists:flatten(String),
			{String2,Port};
		_ ->
			{"0.0.0.0",0}
	end.

%%字符串转换为term()类型
-spec string_to_term(String) ->term() when String::string().
string_to_term(String) ->
	case String of
		[] -> [];
		_ ->
			case erl_scan:string(String++".") of
				{ok, Tokens, _} ->
					case erl_parse:parse_term(Tokens) of
						{ok, Term} -> Term;
						_Err -> undefined
					end;
				_Error ->
					undefined
			end
	end.	

term_to_string(Term) ->
    binary_to_list(list_to_binary(io_lib:format("~w", [Term]))).

-spec getStackTrace() -> list().
getStackTrace() ->
	try
		erlang:error(getStackTrace)
	catch
		_:_ ->
			erlang:get_stacktrace()
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================
appendArray(ArrayA,_IndexA,_ArrayB,_MaxSizeB,_MaxSizeB) ->
	ArrayA;
	
appendArray(ArrayA,IndexA,ArrayB,IndexB,MaxSizeB) ->
	NewAr = array:set(IndexA, array:get(IndexB, ArrayB), ArrayA),
	appendArray(NewAr,IndexA + 1,ArrayB,IndexB + 1,MaxSizeB).

calcOddsByWeightList([{Odd,ExtInfo} | _],R,0) when R =< Odd ->
	ExtInfo;
calcOddsByWeightList([{Odd,ExtInfo} | _],R,AccIn) when R =< Odd + AccIn ->
	ExtInfo;
calcOddsByWeightList([{Odd,_ExtInfo} | T],R,AccIn) ->
	calcOddsByWeightList(T,R,Odd + AccIn).

calcOddsByAfterWeightList([{ExtInfo, Odd} | _],R,0) when R =< Odd ->
	ExtInfo;
calcOddsByAfterWeightList([{ExtInfo, Odd} | _],R,AccIn) when R =< Odd + AccIn ->
	ExtInfo;
calcOddsByAfterWeightList([{_ExtInfo, Odd} | T],R,AccIn) ->
	calcOddsByAfterWeightList(T,R,Odd + AccIn).

convertBool2Int(true) ->
	1;
convertBool2Int(false) ->
	0;
convertBool2Int(1) ->
	1;
convertBool2Int(0) ->
	0.

convertBoolFromInt(0) ->
	false;
convertBoolFromInt(1) ->
	true;
convertBoolFromInt(false) ->
	false;
convertBoolFromInt(true) ->
	true.

binToString(BinStr) when erlang:is_list(BinStr) ->
	BinStr;
binToString(BinStr) ->
	erlang:binary_to_list(BinStr).

%%把参数转为int
-spec toInteger(V::binary()|string()) ->integer().
toInteger(V) when erlang:is_binary(V) ->
	V2 = 
		try
			erlang:binary_to_list(V)
		catch
			_:_ ->
				0
		end,
	toInteger(V2);
toInteger(V) when erlang:is_list(V) ->
	try
		erlang:list_to_integer(V)
	catch
		_:_ ->
			0
	end;
toInteger(V) ->
	V.

%%把参数转为float
-spec toFloat(V::binary()|string()) ->integer().
toFloat(V) when erlang:is_binary(V) ->
	V2 = 
		try
			erlang:binary_to_list(V)
		catch
			_:_ ->
				0.0
		end,
	toFloat(V2);
toFloat(V) when erlang:is_list(V) ->
	try
		erlang:list_to_float(V)
	catch
		_:_ ->
			0.0
	end;
toFloat(V) ->
	V.

toPercent(V, N)->
	doToPercent(trunc(V), trunc(N)).

doToPercent(0, _)->
	0;
doToPercent(_, 0)->
	0;
doToPercent(V, N)->
	trunc(V / N * 100).

%%清除进程的消息队列（慎用）
clear_msg_queue() ->
	receive
		_ ->
			clear_msg_queue()
	after 0 ->
		true
	end.

pid_to_integer(undefined)->
	0;
pid_to_integer(Pid) when is_pid(Pid) ->
	PS = pid_to_list(Pid),
	PSN = [A || A <- PS, A >= 48, A =<57],
	case catch list_to_integer(PSN) of
		V when is_integer(V) ->
			V;
		_ ->
			0
	end;
pid_to_integer(_)->
	0.

is_process_alive(Pid) ->
	try
		if
			is_pid(Pid) ->
				case node() =:= node(Pid) of
					true ->
						erlang:is_process_alive(Pid);
					_ ->
						case rpc:call(node(Pid), erlang, is_process_alive, [Pid]) of
							{badrpc, _Reason}  ->
								false;
							Res ->
								Res
						end
				end;
			true ->
				false
		end
	catch
		_:_ ->
			false
	end.

get_pos_state(Pos, Num)
	when Pos > 0 andalso Num >= 0 ->
	X = get_num(Pos),
	case (X band Num) of
		0 ->
			0;
		_ ->
			1
	end.

set_pos_state(Pos, State, Num)
	when Pos > 0 andalso Num >= 0 ->
	case State of
		1 ->
			X = get_num(Pos),
			Y = X bor Num ;
		0 ->
			X = get_num(Pos),
			X1 = bnot X,
			Y = X1 band Num;
		_ ->
			Y = {error, illegal_state}
	end,
	Y.

get_num(Pos) when Pos > 0 ->
	1 bsl (Pos - 1).

%% 去掉所有重复元素
takeRepeatMember([], Ret) -> Ret;
takeRepeatMember([Member | Right], Ret) ->
	L = removeSameMember(Member, Right),
	takeRepeatMember(L, [Member | Ret]).

%% 删除某个列表中的，某个元素
removeSameMember(_Member, []) -> [];
removeSameMember(Member, List) ->
	lists:filter(fun(Mem) -> Mem =/= Member end, List).

%% 求两个list的交集
intersection(L1, L2)->
	case length(L1) =< length(L2) of
		true ->
			doIntersection(L1, L2);
		_ ->
			doIntersection(L2, L1)
	end.

doIntersection([], _L2)->
	[];
doIntersection(_L1, [])->
	[];
doIntersection(L1, L2)->
	L0 = lists:subtract(L1, L2),
	lists:subtract(L1, L0).

%%
ssplit(N, L)->
	do_ssplit1(N, L, length(L)).

ssplit_all(N, L)->
	Len = length(L),
	do_ssplit(N, L, Len, []).

%%---
do_ssplit(_, [], _, Acc) ->
	Acc;
do_ssplit(N, L1, Len, Acc)->
	{L2, L3} = do_ssplit1(N, L1, Len),
	do_ssplit(N, L3, Len - N, [L2 | Acc]).

%%---
do_ssplit1(N, L, Len) when N =< Len ->
	lists:split(N, L);
do_ssplit1(_N, L, _Len)->
	{L,[]}.

%% 遍历时满足条件则返回以提高性能，适用于比较大的列表
%% 与lists:foldl不同的是，Acc中含有一个布尔值
%% 该值受外部传入函数控制，当期为true时中止遍历并立即返回当前结果
-spec foldlEx(Fun, Acc0, List) -> Acc1 when
	Fun :: fun((Elem :: T, AccIn) -> AccOut),
	Acc0 :: {boolean(), term()},
	Acc1 :: {boolean(), term()},
	AccIn :: {false, term()},
	AccOut :: {boolean(), term()},
	List :: [T],
	T :: term().
foldlEx(_, {true, _} = Accu, _) -> Accu;
foldlEx(F, Accu, [Hd|Tail]) ->
	foldlEx(F, F(Hd, Accu), Tail);
foldlEx(F, Accu, []) when is_function(F, 2) -> Accu.



%% http post
-spec httpPost(Url,SendData) -> {ok,Body} | {err,httpc|funcell|erlangcatch} when
	Url::string(),SendData::string(),Body::string().
httpPost(Url,SendData) ->
	inets:start(),
	case lists:sublist(Url, 5) of
		"https" ->
			ssl:start();
		_ ->
			skip
	end,
	RequestHeader = [{"Content-Type","application/json; charset=utf8"}],
	RequestType = "application/x-www-form-urlencoded",
%%	RequestType = "application/json",
	Result =
		try
			case httpc:request(post,{Url,RequestHeader, RequestType, SendData},[{connect_timeout,?HTTPC_AUTH_TIMEOUT},{timeout,?HTTPC_AUTH_TIMEOUT}],[{sync,true}]) of
				{ok,{
				  {_,200,_},
				  _Head,
				  Body
				  }} ->
					{ok,Body};
				{error, Reason} ->
					?ERROR_OUT("httpPost error:~p",[Reason]),
					{err,httpc};
				Other ->
					?ERROR_OUT("httpc return not ok:~p;url:~s",[Other,Url]),
					{err,funcell}
			end
		catch
			Err:ErrText ->
				?ERROR_OUT("http catch err:~p,~p;url:~s",[Err,ErrText,Url]),
				{err,erlangcatch}
		end,
	Result.

%%可重试的httpPost
-spec httpPost(Url,SendData,Times) -> {ok,Body} | {err,httpc|funcell|erlangcatch} when
	Url::string(),SendData::string(),Body::string(),Times::uint16().
httpPost(Url,SendData,Times) ->
	case httpPost(Url,SendData) of
		{ok,Body} ->
			{ok,Body};
		_ when Times>=1 ->
			httpPost(Url,SendData,Times-1);
		LastReturn ->
			LastReturn
	end.
%% 判断原始坐标是否在四边形区域内
isInArea({CurrentX, CurrentY}, {LT_X, LT_Y}, {RT_X, RT_Y}, {RB_X, RB_Y}, {LB_X, LB_Y}) ->

	[Lx,_,_,MaxX]=lists:sort([LT_X,RT_X,RB_X,LB_X]),
	[Ly,_,_,MaxY]=lists:sort([LT_Y,RT_Y,RB_Y,LB_Y]),
	IsInX = (Lx =< CurrentX) and (CurrentX =< MaxX) ,
	IsInY = (Ly =< CurrentY) and (CurrentY =< MaxY) ,
	IsInX and IsInY	.

%% 简单的洗牌算法，不适用于超长列表
-spec shuffle(ListIn::list()) -> ListOut::list().
shuffle(L) ->
	List1 = [{random:uniform(), X} || X <- L],
	List2 = lists:keysort(1, List1),
	[E || {_, E} <- List2].

%% [uint8(), ...]转换便于DB的写入伪ascii字符串
%% 得出的结果只作为存储使用，是一个反向的列表，不可直接用于数据传输、显示
-spec listUnit8_to_stringASCII(ListUint8::[uint8(), ...]) -> ASCII::string().
listUnit8_to_stringASCII([]) -> [];
listUnit8_to_stringASCII(ListUint8) when erlang:is_list(ListUint8) ->
	FunSplit =
		fun(E, R) when E >= 0, E < 256 ->
			<<A:4, B:4>> = <<E:8>>,
			[A | [B | R]]
		end,
	L1 = lists:foldl(FunSplit, [], ListUint8),
	%% 此处L1为【非最终结果】可以经由listUnit8_to_stringASCII_inverse/1逆运算还原
	%% 该值还需要进行SQL防注入处理再通过SQL写入DB，注意不要用于其它用途
	%% 写入DB后，从DB读出来是【非最终结果】的二进制形式
	anti_sqlInjectionAttack(L1).
%% 这只是listUnit8_to_stringASCII的【非最终结果】逆运算，不保证对任意字符串有效
-spec listUnit8_to_stringASCII_inverse(ASCII::string()|binary()) -> ListUnit8::[uint8(), ...].
listUnit8_to_stringASCII_inverse([]) -> [];
listUnit8_to_stringASCII_inverse(ASCII) when erlang:is_list(ASCII), erlang:length(ASCII) rem 2 =:= 0 ->
	FunCombine =
		fun(E, {Cache, R}) when E >= 0, E < 16 ->
			case Cache of
				-1 ->
					{E, R};
				_ ->
					<<Data:8>> = <<Cache:4, E:4>>,
					{-1, [Data | R]}
			end
		end,
	{_, ListUnit8} = lists:foldl(FunCombine, {-1, []}, ASCII),
	ListUnit8.


clear_os_cache()->
	try
		Cmd = "sync && echo 1 > /proc/sys/vm/drop_caches && echo 0 > /proc/sys/vm/drop_caches",
		os:cmd(Cmd)
	catch
		_ : _  -> skip
	end.

monitor_nodes()->
	net_kernel:monitor_nodes(true, [{node_type, all},nodedown_reason]).

%根据任意Key,取出列表中对应的Value 例子：[{1,10},{3,30},{5,50},{7,100}],用的时候先反转列表,第一个元组的KEY，必须是传进来参数的最小值
-spec getListValue(Key,List) -> Value :: non_neg_integer() when
	Key :: non_neg_integer(), List :: list().
getListValue(_Key,[]) ->
	0;
getListValue(Key,[{K,V}|T]) ->
	if Key>=K ->
		V;
		true->
			getListValue(Key,T)
	end.

%% 简单的字符串防SQL注入处理
%% \92
%% "34
%% '39
-spec anti_sqlInjectionAttack(string()) -> string().
anti_sqlInjectionAttack(StringIn) when erlang:is_list(StringIn) ->
	anti_sqlInjectionAttack(StringIn, []).
anti_sqlInjectionAttack([], StringOut) ->
	lists:reverse(StringOut);
anti_sqlInjectionAttack([92 | T], StringOut) ->
	anti_sqlInjectionAttack(T, [92 | [92 | StringOut]]);
anti_sqlInjectionAttack([34 | T], StringOut) ->
	anti_sqlInjectionAttack(T, [34 | [92 | StringOut]]);
anti_sqlInjectionAttack([39 | T], StringOut) ->
	anti_sqlInjectionAttack(T, [39 | [92 | StringOut]]);
anti_sqlInjectionAttack([H | T], StringOut) ->
	anti_sqlInjectionAttack(T, [H | StringOut]).
