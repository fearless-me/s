%% @author luowei
%% @doc @todo 宠物战斗.


-module(petbattle).
-author(luowei).

-include("gsInc.hrl").
-define(MaxBrlNum, 10).
-define(RefreshTime, 4 * 60 * 60).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 addBr/2,
		 getCl/1,
		 getAcl/0,
		 getBrl/1,
		 getInte/1,
		 
		 writeMn/2,
		 updateMn/4
		]).

%%增加战报
-spec addBr(RoleID::uint(), #rec_battle_report{}) -> ok.
addBr(RoleID, #rec_battle_report{} = Br) ->
	L = mnesia:dirty_read(rec_pet_battle_report, RoleID),
	addBr(RoleID, Br, L).
addBr(RoleID, Br, []) ->
	Pbr = #rec_pet_battle_report{
		roleID = RoleID,
		br_list = [Br]
	},
	writeMn(new_rec_pet_battle_report, Pbr);
addBr(RoleID, Br, [#rec_pet_battle_report{roleID = RoleID, br_list = Brl} = Pbr]) ->
	NewPbr = Pbr#rec_pet_battle_report{br_list = getBrl(Brl, Br)},
	updateMn(new_rec_pet_battle_report, update_rec_pet_battle_report, RoleID, NewPbr).

%%获取领地城池列表
-spec getCl(RoleID::uint()) -> [#rec_manor_battle{}, ...].
getCl(RoleID) ->
	Pattern = #rec_manor_battle{roleID = RoleID, _ = '_'},
	case mnesia:dirty_match_object(rec_manor_battle, Pattern) of
		L when is_list(L) ->
			L;
		_ ->
			[]
	end.

%%获取宠物领地战城池列表
-spec getAcl() -> [#rec_manor_battle{}, ...].
getAcl() ->
	edb:readAllRecord(rec_manor_battle).

%%获取自己战报
-spec getBrl(RoleID::uint()) -> list().
getBrl(RoleID) ->
	Vl = mnesia:dirty_read(rec_pet_battle_report, RoleID),
	getBrl1(Vl).
getBrl1([#rec_pet_battle_report{br_list = L}]) ->
	L;
getBrl1(_) ->
	[].

%%获取最新战报列表
-spec getBrl(Brl::[#rec_battle_report{}, ...], #rec_battle_report{}) -> [#rec_battle_report{},...].
getBrl(Brl, Br) when length(Brl) >= ?MaxBrlNum ->
	[Br | lists:delete(lists:last(Brl), Brl)];
getBrl(Brl, Br) ->
	[Br | Brl].

-spec getInte(RoleID::uint()) -> uint().
getInte(RoleID) ->
	PB = mnesia:dirty_read(rec_pet_manor_battle, RoleID),
	getInte(RoleID, PB).
getInte(_RoleID, [#rec_pet_manor_battle{save_time = LastSaveTime, pet_integral = Integral}]) ->
	SaveTime = time:getWeekBeginSecondsByDay(time:getLocalNowDateTime1970()) + ?RefreshTime,
	case LastSaveTime =:= SaveTime of
		true ->
			Integral;
		_ ->
			0
	end;
getInte(_RoleID, _) ->
	0.

writeMn(NewTable, Data) ->
	mnesia:write(Data),
	mnesia:write(NewTable, Data, write).

updateMn(NewTable, UpdateTable, Key, Data) ->
	mnesia:write(Data),
	RL = mnesia:read(NewTable, Key, write),
	updateMn(RL, NewTable, UpdateTable, Key, Data).
updateMn([], _NewTable, UpdateTable, _Key, Data) ->
	mnesia:write(UpdateTable, Data, write);
updateMn(_, NewTable, _UpdateTable, _Key, Data) ->
	mnesia:write(NewTable, Data, write).

