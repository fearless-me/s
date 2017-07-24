%%%-------------------------------------------------------------------
%%% @author burce
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 玩家家园系统_养殖区
%%% @end
%%% Created : 26. 八月 2017 14:14
%%%-------------------------------------------------------------------
-module(homeFarmingLogic).
-author("cxl").
-include("gsInc.hrl").
-include("cfg_home_zoo.hrl").
-include("cfg_home_zoofood.hrl").
%% API
-export([]).



% 放置宠物进入饲养区
%%putInFarming({HomeID,AreaType,RoleID,PetID})->
%%
%%	HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
%%	case HomeRole =:= ?HomeRole_Master orelse HomeRole =:= ?HomeRole_Partner of
%%		 true ->
%%			 case ets:lookup(?HomeAreaEts, {HomeID, AreaType}) of
%%				 [#rec_home_area{areaLvl =  AreaLvl,areaData = StrDataOld} = AreaOld] ->
%%					 ListDataOld = misc:string_to_term(StrDataOld),
%%					 HasNum =   erlang:length(ListDataOld),
%%					 MaxNum =
%%					 case getCfg:getCfgByKey(cfg_home_zoo, AreaLvl) of
%%						 #home_zooCfg{pet_num = Num} ->
%%							 Num
%%                     end,
%%
%%					 case HasNum>=  MaxNum of
%%						   true->
%%							   ?ERROR_CODE(?ErrorCode_PetTaskAcceptmax);
%%						    _->
%%							    TimeNow = time:getSyncTimeFromDBS(),
%%							    case lists:keyfind(PetID, 1, ListDataOld) of
%%								    {D, Time} ->
%%									    ?ERROR_CODE(?ErrorCode_PetTaskAcceptmax),
%%									    skip;	%% 数据相同，不需要更新
%%								    _ ->
%%
%%									    DeltaMinutesTime  =  playerDaily:getDailyCounter(?DailyType_Home_PutPetFarmingTime, PetID),
%%
%%									    ListDataNew = lists:keystore(PetID, 1, ListDataOld, {PetID, TimeNow}),
%%									    StrDataNew = misc:term_to_string(ListDataNew),
%%									    AreaNew = AreaOld#rec_home_area{areaData = StrDataNew},
%%									    ets:insert(?HomeAreaEts, AreaNew),
%%									    homeInterface:saveHome(AreaNew),
%%									    putInFarmingSuccess(HomeID,PetID,1)
%%							    end
%%                     end;
%%				 _ ->
%%					 ?ERROR_OUT("can not find area~n~p~n~p", [HomeID, misc:getStackTrace()])
%%			 end;
%%		_->
%%			?ERROR_OUT(" NOT    HomeRole"),
%%			skip
%%	end.

% 从饲养区 取回宠物
%%putOutFarming({HomeID,AreaType,RoleID,PetID})->
%%
%%	HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
%%	case HomeRole =:= ?HomeRole_Master orelse HomeRole =:= ?HomeRole_Partner of
%%		true ->
%%			case ets:lookup(?HomeAreaEts, {HomeID, AreaType}) of
%%				[#rec_home_area{areaLvl =  AreaLvl,areaData = StrDataOld} = AreaOld] ->
%%					ListDataOld = misc:string_to_term(StrDataOld),
%%
%%					TimeNow = time:getSyncTimeFromDBS(),
%%					case lists:keyfind(PetID, 1, ListDataOld) of
%%						{D, Time} ->
%%
%%							CurTime =  TimeNow - Time,
%%							Minutes =  CurTime/60,
%%							ExpNum =
%%								case getCfg:getCfgByKey(cfg_home_zoo, AreaLvl) of
%%									#home_zooCfg{exp_get = Exp_get} ->
%%
%%
%%										F1= fun({StartTime,EndTime,AddExt},{_, Exp})->
%%												case Minutes>= StartTime  andalso Minutes < EndTime of
%%												 true ->
%%													 {true, AddExt} ;
%%													_->
%%														{false, 0}
%%												end
%%										    end,
%%										{IsIn, AddExp} =   misc:foldlEx(F1,{false,0},Exp_get),
%%										AddExp;
%%									_->
%%										0
%%								end,
%%
%%
%%							DeltaMinutesTime  =  playerDaily:addDailyCounter(?DailyType_Home_PutPetFarmingTime, PetID,Minutes),
%%							Pid = core:queryPlayerPidByRoleID(RoleID),
%%							psMgr:sendMsg2PS(Pid, home_Farming_addExp, {RoleID, ExpNum}),
%%							ListDataNew = lists:delete({D,Time},ListDataOld),
%%							StrDataNew = misc:term_to_string(ListDataNew),
%%							AreaNew = AreaOld#rec_home_area{areaData = StrDataNew},
%%							ets:insert(?HomeAreaEts, AreaNew),
%%							homeInterface:saveHome(AreaNew),
%%							putOutFarmingSuccess(HomeID,PetID,ExpNum,1);
%%						_ ->
%%							skip
%%					end;
%%				_ ->
%%					?ERROR_OUT("can not find area~n~p~n~p", [HomeID, misc:getStackTrace()])
%%			end;
%%		_->
%%			skip
%%	end.

% 从饲养区 喂食物
%%putPetFoodFarming({HomeID,AreaType,RoleID,PetID,ItemID})->
%%
%%	HomeRole = homeInterface:queryHomeRole(HomeID, RoleID),
%%	case HomeRole =:= ?HomeRole_Master orelse HomeRole =:= ?HomeRole_Partner of
%%		true ->
%%			case ets:lookup(?HomeAreaEts, {HomeID, AreaType}) of
%%				[#rec_home_area{areaLvl =  AreaLvl,areaData = StrDataOld} = AreaOld] ->
%%					ListDataOld = misc:string_to_term(StrDataOld),
%%
%%					case lists:keyfind(PetID, 1, ListDataOld) of
%%						{D, Time} ->
%%
%%
%%
%%							{BackItmeID,BackITemNum} =
%%								case getCfg:getCfgByKey(cfg_home_zoofood, ItemID) of
%%									#home_zoofoodCfg{back_item  = Back_item,range = Range} ->
%%
%%										Randm =  misc:rand(1,Range),
%%										F1= fun({GainItem,Min,Max,Star,End},{_, {_,_}})->
%%											case Randm>= Star  andalso Randm < End of
%%												true ->
%%													 Rnum = misc:rand(Min,Max),
%%													{true, {GainItem,Rnum}} ;
%%												_->
%%													{false, {0,0}}
%%											end
%%										    end,
%%										{IsIn, {ItID,ITNum}} =   misc:foldlEx(F1,{false,{0,0}},Back_item),
%%										{ItID,ITNum};
%%									_->
%%										{0,0}
%%								end,
%%							case  BackItmeID >0 andalso BackITemNum >0 of
%%								  true->
%%
%%									  case playerBase:costRes(?BackType_Item, ItemID, 1, ?PLogTS_Home, ?ItemDeleteReasonHomeFarmingOP, ?ItemSourceHomeFarmingHarvest) of
%%										  {true, CostItem} ->
%%
%%											  playerDaily:incDailyCounter(?DailyType_Home_PetFarming, D),
%%											  playerMsg:sendNetMsg(#pk_GS2U_GetPetFoodResults_Sync{
%%												  result = 1,
%%												  petID = PetID,itemID =BackItmeID,num =BackITemNum  }),
%%											  Pid = core:queryPlayerPidByRoleID(RoleID),
%%											  psMgr:sendMsg2PS(Pid, zooFoodSuccess, {RoleID, BackItmeID,BackITemNum});
%%										  _->
%%											  playerMsg:sendNetMsg(#pk_GS2U_GetPetFoodResults_Sync{
%%												result = 3,
%%												  petID = PetID,itemID =BackItmeID,num =BackITemNum })
%%										end;
%%								_->
%%									?ERROR_OUT("BackItmeID BackItmeID (~p)", [ItemID])
%%							end;
%%						_ ->
%%							skip
%%					end;
%%				_ ->
%%					?ERROR_OUT("can not find area~n~p~n~p", [HomeID, misc:getStackTrace()])
%%			end;
%%		_->
%%			skip
%%	end.



