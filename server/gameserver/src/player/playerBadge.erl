%%%
%%%-------------------------------------------------------------------
%%% @author 罗维
%%% @copyright (C) 2014, <haowan123>
%%% @doc
%%% 玩家徽章系统
%%% @end
%%% Created : 26. 一月 2015 17:30
%%%-------------------------------------------------------------------

-module(playerBadge).
-author(luowei).

-include("playerPrivate.hrl").

-define(BaseValue, 10000).

-define(MapGuards, 114).
-define(MapWinter, 101).
-define(MapRowland,102).
-define(MapGarden, 103).
%% ====================================================================
%% API functions
%% ====================================================================

-export([
		 initBadge/0,
		 badgeEvent/1,
		 gmBadgeEvent/2
		]).

%%初始化徽章
-spec initBadge() -> ok.
initBadge() ->
	BadgeList = playerState:getPlayerBadgeList(),
	sendBadgeListToClient(BadgeList).

-spec badgeEvent(MapID::uint()) -> ok.
badgeEvent(MapID) ->
	BadgeList = playerState:getPlayerBadgeList(),
	case lists:member(MapID, getCfg:get1KeyList(cfg_achievecollection)) of
		true ->
			CfgAchieveCollect = getCfg:getCfgPStack(cfg_achievecollection, MapID),
			case lists:keyfind(MapID, #recBadge.mapID, BadgeList) of
				#recBadge{isComplete = true} ->
					skip;
				#recBadge{isComplete = false} = Badge->
					updateBadge(Badge, BadgeList, CfgAchieveCollect);
				_ ->
					addBadge(BadgeList, CfgAchieveCollect)
			end;
		_ ->
			skip
	end.

-spec gmBadgeEvent(MapID::uint(), ItemID::uint()) -> ok.
gmBadgeEvent(MapID, ItemID) ->
	BadgeList = playerState:getPlayerBadgeList(),
	case lists:member(MapID, getCfg:get1KeyList(cfg_achievecollection)) of
		true ->
			CfgAchieveCollect = getCfg:getCfgPStack(cfg_achievecollection, MapID),
			case lists:keyfind(MapID, #recBadge.mapID, BadgeList) of
				#recBadge{isComplete = true} ->
					skip;
				#recBadge{isComplete = false} = Badge->
					updateBadge(ItemID, Badge, BadgeList, CfgAchieveCollect);
				_ ->
					addBadge(ItemID, BadgeList, CfgAchieveCollect)
			end;
		_ ->
			skip
	end.			
	

%% ====================================================================
%% Internal functions
%% ====================================================================

-spec isDrop(DropValue::uint()) -> boolean().
isDrop(DropValue) ->
	RandomNum = random:uniform(?BaseValue),   
	if
		DropValue > RandomNum ->
			true;
		true -> 
			false
	end.

-spec addBadge(BadgeList::[#recBadge{},...], CfgAchieveCollect::#achievecollectionCfg{}) -> ok.
addBadge(BadgeList, #achievecollectionCfg{
	map = MapID,
	items = Items,
	drop = DropValue
	} = Cfg) ->
	case isDrop(DropValue) of
		true ->
			RandomNum = random:uniform(length(Items)),
			ItemID = lists:nth(RandomNum, Items),
			RecBadge = #recBadge{
				mapID = MapID,
				itemList = [ItemID],
				isComplete = (lists:sort([ItemID]) =:= lists:sort(Items))
			},
			playerState:setPlayerBadgeList([RecBadge | BadgeList]),
			playerSave:saveBadge(RecBadge),
			sendBadgeToClient(MapID, ItemID, RecBadge#recBadge.isComplete, Cfg);
		_ ->
			skip
	end.

-spec addBadge(ItemID::uint(), BadgeList::[#recBadge{},...], CfgAchieveCollect::#achievecollectionCfg{}) -> ok.
addBadge(ItemID, BadgeList, #achievecollectionCfg{
	map = MapID,
	items = Items
	} = Cfg) ->
	RecBadge = #recBadge{
		mapID = MapID,
		itemList = [ItemID],
		isComplete = (lists:sort([ItemID]) =:= lists:sort(Items))
	},
	playerState:setPlayerBadgeList([RecBadge | BadgeList]),
	playerSave:saveBadge(RecBadge),
	sendBadgeToClient(MapID, ItemID, RecBadge#recBadge.isComplete, Cfg).

-spec updateBadge(Badge::#recBadge{}, BadgeList::[#recBadge{},...], CfgAchieveCollect::#achievecollectionCfg{}) -> ok.
updateBadge(Badge, BadgeList, #achievecollectionCfg{
	map = MapID,
	items = Items,
	drop = DropValue
	} = Cfg) ->
	case isDrop(DropValue) of
		true ->
			RandomNum = random:uniform(length(Items)),
			ItemID = lists:nth(RandomNum, Items),
			case lists:member(ItemID, Badge#recBadge.itemList) of
				false ->
					NewItems = [ItemID | Badge#recBadge.itemList],
					NewBadge = Badge#recBadge{
						itemList = NewItems,
						isComplete = (lists:sort(NewItems) =:= lists:sort(Items))
					},
					NewBadgeList = lists:keyreplace(MapID, #recBadge.mapID, BadgeList, NewBadge),
					playerSave:saveBadge(NewBadge),
					playerState:setPlayerBadgeList(NewBadgeList),
					sendBadgeToClient(MapID, ItemID, NewBadge#recBadge.isComplete, Cfg);
				_ ->
					skip
			end;		
		_ ->
			skip
	end.

-spec updateBadge(ItemID::uint(), Badge::#recBadge{}, BadgeList::[#recBadge{},...], CfgAchieveCollect::#achievecollectionCfg{}) -> ok.
updateBadge(ItemID, Badge, BadgeList, #achievecollectionCfg{
	map = MapID,
	items = Items
	} = Cfg) ->
	case lists:member(ItemID, Badge#recBadge.itemList) of
		false ->
			NewItems = [ItemID | Badge#recBadge.itemList],
			NewBadge = Badge#recBadge{
				itemList = NewItems,
				isComplete = (lists:sort(NewItems) =:= lists:sort(Items))
			},
			NewBadgeList = lists:keyreplace(MapID, #recBadge.mapID, BadgeList, NewBadge),
			playerSave:saveBadge(NewBadge),
			playerState:setPlayerBadgeList(NewBadgeList),
			sendBadgeToClient(MapID, ItemID, NewBadge#recBadge.isComplete, Cfg);
		_ ->
			skip
	end.


-spec sendBadgeToClient(MapID::uint(),ItemID::uint(),IsComplete::boolean(), Cfg::#achievecollectionCfg{}) -> ok.
sendBadgeToClient(MapID, ItemID, IsComplete, Cfg) ->
	Msg = #pk_GS2U_BadgeInfo{
		itemID = ItemID,
		mapID = MapID
	},
	case IsComplete of
		true ->
			playerAchieve:achieveEvent(Cfg#achievecollectionCfg.achieveid, [1]);				
		_ ->
			skip
	end,
	playerMsg:sendNetMsg(Msg).

-spec sendBadgeListToClient(BadgeList::[#recBadge{},...]) -> ok.
sendBadgeListToClient(BadgeList) ->
	Fun = fun(#recBadge{
		mapID = MapID,
		itemList = ItemList
		}) ->
		#pk_BadgeInfo{
			mapID = MapID,
			itemList = ItemList
		}
	end,
	List = lists:map(Fun, BadgeList),
	Msg = #pk_GS2U_BadgeInfoList{
		badgeInfoList = List
	},
	playerMsg:sendNetMsg(Msg).



