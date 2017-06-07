%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%%
%%% @end
%%% Created : 27. 八月 2014 11:10
%%%-------------------------------------------------------------------
-module(guildState).
-author("tiancheng").

-include("guildPrivate.hrl").

%% API
%% -export([]).
-compile(export_all).

%%保存下军团副本发奖名单
-spec setGuildCopyAwardIDList(GuildID::uint(), AwardIDList::list(), OtherIDList::list()) -> OldVal::{list(),list()}|undefined.
setGuildCopyAwardIDList(GuildID, AwardIDList, OtherIDList) ->
	put({guildCopyAwardIDList,GuildID}, {AwardIDList, OtherIDList}).
%%获取下军团副本发奖名单
-spec getGuildCopyAwardIDList(GuildID::uint()) -> {list(),list()}.
getGuildCopyAwardIDList(GuildID) ->
	case get({guildCopyAwardIDList,GuildID}) of
		undefined -> {[],[]};
		Ret -> Ret
	end.

getGuildRewardList() ->
	case get('getGuildRewardList') of
		undefined -> [];
		L -> L
	end.

setGuildRewardList(List) ->
	put('getGuildRewardList', List).

delGuildRewardList() ->
	erlang:erase('getGuildRewardList').

%% 获取军团工资的领取个数
-spec getGuildRewardNumber(GuildID::uint64(), Power::uint()) -> uint().
getGuildRewardNumber(GuildID, Power) ->
	List = getGuildRewardList(),
	Key = {GuildID, Power},
	case lists:keyfind(Key, #getGuildReward.key, List) of
		#getGuildReward{number = Number} -> Number;
		_ -> 0
	end.

%% 增加一个计数
-spec incGuildRewardNumber(GuildID::uint64(), Power::uint()) -> uint().
incGuildRewardNumber(GuildID, Power) ->
	List = getGuildRewardList(),
	Key = {GuildID, Power},
	{NList, Num} =
		case lists:keyfind(Key, #getGuildReward.key, List) of
			#getGuildReward{number = Number} = Value ->
				{lists:keystore(Key, #getGuildReward.key, List, Value#getGuildReward{number = Number + 1}), Number + 1};
			_ ->
				{[#getGuildReward{key = Key, number = 1} | List], 1}
		end,
	setGuildRewardList(NList),
	Num.

%% 军团成员活跃时间
setGuildUpdateTime(List) ->
    put('GuildUpdateTime', List).
getGuildUpdateTime() ->
    case get('GuildUpdateTime') of
        undefined -> [];
        L -> L
    end.

%% 下一次修复军团时间
getNextCheckGuildDataTime() ->
    get('NextCheckGuildDataTime').
setNextCheckGuildDataTime({Time, DiffMinute}) ->
    put('NextCheckGuildDataTime', {Time, DiffMinute}).

%% 游乐场设施ETS基本操作

-spec queryGuildRide(GuildID::uint64()) -> #recGuildRide{}.
queryGuildRide(GuildID) ->
	case ets:lookup(?EtsGuildRide, GuildID) of
		[#recGuildRide{} = GuildRide] ->
			GuildRide;
		_ ->
			#recGuildRide{guildID = GuildID}
	end.

-spec queryRide(GuildIDOrGuildRide::uint64()|#recGuildRide{}, RideID::uint32()) -> #rec_guild_ride{}.
queryRide(#recGuildRide{guildID = GuildID, listRide = ListRide}, RideID) ->
	case lists:keyfind(RideID, #rec_guild_ride.rideID, ListRide) of
		#rec_guild_ride{} = Ride ->
			Ride;
		_ ->
			#rec_guild_ride{guildID = GuildID, rideID = RideID}
	end;
queryRide(GuildID, RideID) ->
	GuildRide = queryGuildRide(GuildID),
	queryRide(GuildRide, RideID).

-spec replaceRide(Ride::#rec_guild_ride{}) -> ok.
replaceRide(#rec_guild_ride{guildID = GuildID, rideID = RideID} = Ride) ->
	case ets:lookup(?EtsGuildRide, GuildID) of
		[#recGuildRide{listRide = ListRide} = GuildRide] ->
			ListRideNew = lists:keystore(RideID, #rec_guild_ride.rideID, ListRide, Ride),
			ets:insert(?EtsGuildRide, GuildRide#recGuildRide{listRide = ListRideNew});
		_ ->
			ets:insert(?EtsGuildRide, #recGuildRide{guildID = GuildID, listRide = [Ride]})
	end.
