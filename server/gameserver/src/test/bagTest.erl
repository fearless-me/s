%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%%
%%% @end
%%% Created : 13. 八月 2014 11:31
%%%-------------------------------------------------------------------
-module(bagTest).
-author("ZhongYuanWei").

-include_lib("eunit/include/eunit.hrl").
-include("gsInc.hrl").

-compile(export_all).

bagTest() ->
	ItemList1 = [
		#rec_item{itemUID = 0,itemID = 11,isBind = false,pileNum = 10},
		#rec_item{itemUID = 0,itemID = 12,isBind = false,pileNum = 990},
		#rec_item{itemUID = 0,itemID = 13,isBind = false,pileNum = 10},
		#rec_item{itemUID = 0,itemID = 14,isBind = false,pileNum = 10},
		#rec_item{itemUID = 0,itemID = 15,isBind = false,pileNum = 10},
		#rec_item{itemUID = 0,itemID = 100,isBind = false,pileNum = 10},
		#rec_item{itemUID = 0,itemID = 100,isBind = false,pileNum = 10},
		#rec_item{itemUID = 0,itemID = 15,isBind = true,pileNum = 10},
		#rec_item{itemUID = 0,itemID = 12,isBind = false,pileNum = 10},
		#rec_item{itemUID = 0,itemID = 12,isBind = true,pileNum = 10},
		#rec_item{itemUID = 0,itemID = 13,isBind = false,pileNum = 10}
	],
	ItemList = [{rec_item,576531121047604021,101,2,0,0},
				 {rec_item,576531121047604019,102,8,0,0},
				 {rec_item,576531121047604013,106,3,0,0},
				 {rec_item,576531121047604011,104,997,0,0},
				 {rec_item,576531121047604009,105,12,0,0},
				 {rec_item,576531121047604007,102,4,0,0},
				 {rec_item,576531121047604005,104,999,0,0}],

	io:format("Before Sort:~n~p~n",[ItemList]),
	List = playerPackage:arrangeItem(ItemList,?Item_Location_Bag),
	io:format("After Sort:~n~p~n",[List]),

	io:format("Before Sort:~n~p~n",[ItemList1]),
	List1 = playerPackage:arrangeItem(ItemList1,?Item_Location_Bag),
	io:format("After Sort:~n~p~n",[List1]),
	ok.


testEquip() ->
	%%playerEquip:makeEquip(31213, 0, ?EquipColorTypeRed),
	List = getCfg:get1KeyList(cfg_equipment),
	Fun = fun(ID) ->
		io:format("makeEquip ID:~p~n",[ID]),
		playerEquip:makeEquip(ID, ?EquipColorTypeRed,?Item_Location_Equip_Bag,false)
		end,
	lists:foreach(Fun,List),
	io:format("completed"),
	ok.
