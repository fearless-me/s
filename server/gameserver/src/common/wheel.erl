%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 九月 2017 17:09
%%%-------------------------------------------------------------------
-module(wheel).
-author("mawenhong").

-record(wheelList, {
	cur = 1,
	max = 1,
	wheel = []
}).

-record(wheel, {
	id = 1,
	len = 0,
	dataList = []
}).

%% API
-export([
	init/1
	, add/2
	, pop/1
	, pop_n/2
	, update/1
]).

-export([
	it/2
]).

update(
	#wheelList{
		cur = Cur, max = Max
	} = WheelList
) ->
	WheelList#wheelList{cur = (Cur + 1) rem Max + 1}.

%%%-------------------------------------------------------------------
init(WheelNum) when WheelNum > 0 ->
	L1 = lists:seq(1, WheelNum),
	#wheelList{
		max = WheelNum,
		wheel = [#wheel{id = ID} || ID <- L1]
	}.

%%%-------------------------------------------------------------------
add(
	Data
	, #wheelList{
		wheel = Wheels
		, cur = Cur
	} = WheelList
) ->
	OldWheel = get(Cur, Wheels),
	NewWheel = addData(Data, OldWheel),
	store(NewWheel, WheelList).

%%%-------------------------------------------------------------------
pop(TimeWheel) ->
	pop_n(0, TimeWheel).

pop_n(
	MaxNum
	, #wheelList{
		wheel = Wheels
		, cur = Cur
	} = WheelList
) ->
	#wheel{
		id = ID
		, len = Len
		, dataList = DataList
	} = get(Cur, Wheels),

	{LeftLen, {RetList, LeftList}} =
		case Len > MaxNum andalso MaxNum > 0 of
			true ->
				{Len - MaxNum, lists:split(MaxNum, DataList)};
			_ ->
				{0, {DataList, []}}
		end,
	NewTimeWheel = store(
		#wheel{id = ID, len = LeftLen, dataList = LeftList}
		, WheelList
	),
	{NewTimeWheel, ID, RetList}.

%%%-------------------------------------------------------------------
addData(
	Data
	, #wheel{dataList = L, len = Len} = Wheel
) ->
	Wheel#wheel{
		dataList = [Data | L]
		, len = Len + 1
	}.

get(WheelID, Wheels) ->
%%	io:format("get(~p,~p~n",[WheelID, Wheels]),
	lists:keyfind(WheelID, #wheel.id, Wheels).

store(
	Wheel,
	#wheelList{
		wheel = Wheels
		, cur = Cur
	} = WheelList
) ->
	WheelList#wheelList{
		wheel = lists:keystore(
			Cur
			, #wheel.id
			, Wheels
			, Wheel
		)
	}.

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
it(WheelNum, MaxData) ->
	Wheels1 = init(WheelNum),
	io:format("create:~p~n", [Wheels1]),
	L1 = lists:seq(1, MaxData),
	Wheels2 =
		lists:foldl(
			fun(X, AccWheels) ->
				doIt(op(1), X, AccWheels)
			end, Wheels1, L1),

	for(Wheels2#wheelList.wheel, 1),

	lists:foldl(
		fun(_, Acc) ->
			doIt(op(0), 0, Acc)
		end, Wheels2, L1),

	ok.
%%%-------------------------------------------------------------------
doIt(1, X, Wheels) ->
	NewWheel1 = add(X, Wheels),
	inc(random:uniform(100), NewWheel1);
doIt(2, _X, Wheels) ->
	Split = random:uniform(50) - 1,
	{NewWheel1, WheelID, WheelDataList} = pop_n(Split, Wheels),
	io:format("deal[~p][~p][~w]~n", [Split > 0, WheelID, WheelDataList]),
	NewWheel2 = add(random:uniform(999999999), NewWheel1),
	update(NewWheel2);
doIt(_, _X, Wheels) ->
	Split = 50,
	{NewWheel1, WheelID, WheelDataList} = pop_n(Split, Wheels),
	io:format("deal[~p][~p][~w]~n", [Split > 0, WheelID, WheelDataList]),
	update(NewWheel1).

%%%-------------------------------------------------------------------
for([], N) ->
	io:format("loop finished[~p]!~n", [N-1]);
for([#wheel{dataList = DataList} | Wheels], N) ->
	NewN =
		lists:foldl(
			fun(Data, PreCount) ->
				io:format("for(data:~p),pre:~p.~n", [Data, PreCount]),
				PreCount + 1
			end, N, DataList),
	for(Wheels, NewN).

%%%-------------------------------------------------------------------
inc(N, Wheels) when N < 51 ->
	update(Wheels);
inc(_, Wheels) ->
	Wheels.

%%%-------------------------------------------------------------------
op(1) -> 1;
op(_) -> random:uniform(2) + 1.



