%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%% 数据库加载器
%%% @end
%%% Created : 22. 九月 2016 14:53
%%%-------------------------------------------------------------------
-module(playerDataMgrLoad).
-author("tiancheng").

-include("gsInc.hrl").

%% API
-export([
	loadData/0
]).

-export([
	loadPlayerDataAck/1,
	loadRoleNameAck/1,
	loadUserAccountAck/1,
	loadBaseRoleAck/1,
	loadRoleDataFromDBAck/1,
	loadIdentityAck/1,
	loadFriend2Ack/1,
	loadDaily2Ack/1,
	loadMarriageAck/1,
	loadPetTerritoryAck/1
	]).

%% 需要等待加载完的数据列表
-define(NeedWaitLoadList,
	[
		loadPlayerDataAck,
		loadRoleNameAck,
		loadUserAccountAck,
		loadIdentityAck,
		loadFriend2Ack,
		loadDaily2Ack,
		loadMarriageAck,
		loadPetTerritoryAck
	]).

loadData() ->
	?LOG_OUT("开始加载数据..."),
	loadUserAccount(),
	loadRoleName(),
	loadIdentity(),
	loadFriend2(),
	loadDaily2(),
	loadMarriage(),
	loadPetTerritory(),
	ok.

loadUserAccount() ->
	gsSendMsg:sendMsg2DBServer(loadUserAccount, 0, 0),
	ok.

loadRoleName() ->
	gsSendMsg:sendMsg2DBServer(loadRoleName, 2, 0),
	ok.

loadIdentity() ->
	gsSendMsg:sendMsg2DBServer(loadIdentity, 0, 0),
	ok.

loadFriend2() ->
	gsSendMsg:sendMsg2DBServer(loadFriend2, 0, 0),
	ok.

loadDaily2() ->
	gsSendMsg:sendMsg2DBServer(loadDaily2, 0, 0),
	ok.

loadMarriage() ->
	gsSendMsg:sendMsg2DBServer(loadMarriage, 0, 0),
	ok.

loadPetTerritory() ->
	gsSendMsg:sendMsg2DBServer(loadPetTerritory, 0, 0),
	ok.

loadRoleDataFromDBAck({RoleID, PidFrom, {#rec_base_role{roleID = RoleID} = Base, #rec_playerdata{} = PlayerData}}) ->
	?LOG_OUT("loadRoleDataFromDBAck:~p", [RoleID]),
	ets:insert(ets_rec_base_role, Base),
	ets:insert(ets_rec_playerdata, PlayerData),
	?LOG_OUT("sendLoadOverMsgToPlayer:~p",[RoleID]),
	%%发送读取结束标记
	psMgr:sendMsg2PS(PidFrom,loadRoleAck,[{over,RoleID}]),
	ok.

loadPlayerDataAck(DataList) ->
	ets:insert_new(ets_rec_playerdata, DataList),
	?LOG_OUT("insert ets_rec_playerdata len:~p", [erlang:length(DataList)]),
	loadDataProcess(loadPlayerDataAck),
	ok.

loadRoleNameAck(DataList) ->
	ets:insert_new(ets_rec_RoleName, DataList),
	?LOG_OUT("insert ets_rec_RoleName len:~p", [erlang:length(DataList)]),
	loadDataProcess(loadRoleNameAck),
	ok.

loadIdentityAck({List_rec_player_identity, List_rec_pic_data_main, List_rec_pic_data_sub}) ->
	?LOG_OUT("loadIdentityAck begin ..."),
	%% 初始化身份证信息
	FunInsert1 =
		fun(#rec_player_identity{
			face = FaceBin,
			tags = TagsBin,
			pic1 = Pic1Bin,
			pic2 = Pic2Bin,
			pic3 = Pic3Bin,
			sign = SignBin,
			gifts = GiftsBin
		} = Rec) ->
			RecNew = Rec#rec_player_identity{
				face = misc:listUnit8_to_stringASCII_inverse(erlang:binary_to_list(FaceBin)),
				tags = erlang:binary_to_list(TagsBin),
				pic1 = misc:listUnit8_to_stringASCII_inverse(erlang:binary_to_list(Pic1Bin)),
				pic2 = misc:listUnit8_to_stringASCII_inverse(erlang:binary_to_list(Pic2Bin)),
				pic3 = misc:listUnit8_to_stringASCII_inverse(erlang:binary_to_list(Pic3Bin)),
				sign = erlang:binary_to_list(SignBin),
				gifts = misc:string_to_term(erlang:binary_to_list(GiftsBin))
			},
			ets:insert_new(?EtsIdentityData, RecNew)
		end,
	lists:foreach(FunInsert1, List_rec_player_identity),
	?LOG_OUT("insert ?EtsIdentityData len:~p", [erlang:length(List_rec_player_identity)]),
	%% 初始化相册主表信息
	FunInsert2 =
		fun(#rec_pic_data_main{md5 = MD5Bin, data = DataBin} = Rec) ->
			RecNew = Rec#rec_pic_data_main{
				md5 = misc:listUnit8_to_stringASCII_inverse(erlang:binary_to_list(MD5Bin)),
				data = misc:listUnit8_to_stringASCII_inverse(erlang:binary_to_list(DataBin))
			},
			ets:insert_new(?EtsPicDataMain, RecNew)
		end,
	lists:foreach(FunInsert2, List_rec_pic_data_main),
	?LOG_OUT("insert ?EtsPicDataMain len:~p", [erlang:length(List_rec_pic_data_main)]),
	%% 初始化相册副表信息
	FunInsert3 =
		fun(#rec_pic_data_sub{md5 = MD5Bin} = Rec) ->
			RecNew = Rec#rec_pic_data_sub{
				md5 = misc:listUnit8_to_stringASCII_inverse(erlang:binary_to_list(MD5Bin)),
				data = [],                    %% 副表中不在内存中保存图片数据
				timeLastDown = 0,             %% 副表中不关心该值
				timeLastUp = 0                %% 副表中不关心该值
			},
			ets:insert_new(?EtsPicDataSub, RecNew)
		end,
	lists:foreach(FunInsert3, List_rec_pic_data_sub),
	?LOG_OUT("insert ?EtsPicDataSub len:~p", [erlang:length(List_rec_pic_data_sub)]),
	loadDataProcess(loadIdentityAck),
	?LOG_OUT("loadIdentityAck end ..."),
	ok.

loadFriend2Ack({List_rec_friend2_relation, List_rec_friend2_interaction, List_rec_friend2_cross}) ->
	?LOG_OUT("loadFriend2Ack begin ..."),
	%% 初始化关系表
	FunRelation =
		fun(Relation) ->
			friend2State:replaceRelation(Relation)
		end,
	lists:foreach(FunRelation, List_rec_friend2_relation),
	?LOG_OUT("List_rec_friend2_relation len:~p", [erlang:length(List_rec_friend2_relation)]),
	%% 初始化交互表
	FunInteraction =
		fun(Interaction) ->
			friend2State:replaceInteraction(Interaction)
		end,
	lists:foreach(FunInteraction, List_rec_friend2_interaction),
	?LOG_OUT("List_rec_friend2_interaction len:~p", [erlang:length(List_rec_friend2_interaction)]),
	%% 初始化跨服好友列表
	FunCross =
		fun(#rec_friend2_cross{
			tarRoleName = TarRoleNameBin,
			tarSrvName = TarSrvNameBin,
			tarFace = TarFaceBin
		} = Cross) ->
			friend2State:replaceFriend2CrossF(Cross#rec_friend2_cross{
				tarRoleName = erlang:binary_to_list(TarRoleNameBin),
				tarSrvName = erlang:binary_to_list(TarSrvNameBin),
				tarFace = erlang:binary_to_list(TarFaceBin)
			})
		end,
	lists:foreach(FunCross, List_rec_friend2_cross),
	?LOG_OUT("List_rec_friend2_cross len:~p", [erlang:length(List_rec_friend2_cross)]),
	loadDataProcess(loadFriend2Ack),
	?LOG_OUT("loadFriend2Ack end"),
	ok.

-spec loadDaily2Ack(List::[#rec_player_daily2{}, ...]) -> ok.
loadDaily2Ack(List) ->
	?LOG_OUT("loadDaily2Ack begin ..."),
	daily2State:init(List),
	?LOG_OUT("List len:~p", [erlang:length(List)]),
	loadDataProcess(loadDaily2Ack),
	?LOG_OUT("loadDaily2Ack end ..."),
	ok.

-spec loadMarriageAck({ListR::[#rec_marriage{}, ...], ListS::[#rec_marriage_skill{}, ...]}) -> ok.
loadMarriageAck({ListR, ListS}) ->
	?LOG_OUT("loadMarriageAck begin ..."),
	ets:insert_new(?EtsMarriageData, ListR),
	?LOG_OUT("ListR len:~p", [erlang:length(ListR)]),
	FunLoadSkills =
		fun(#rec_marriage_skill{roleID = RoleID, slotID = SlotID, slotExp = SlotExp}) ->
			case ets:lookup(?EtsMarriageSkill, RoleID) of
				[#recMarriageSkill{slots = Slots}] ->
					ets:update_element(?EtsMarriageSkill, RoleID, {#recMarriageSkill.slots, [{SlotID, SlotExp} | Slots]});
				_ ->
					ets:insert(?EtsMarriageSkill, #recMarriageSkill{roleID = RoleID, slots = [{SlotID, SlotExp}]})
			end
		end,
	lists:foreach(FunLoadSkills, ListS),
	?LOG_OUT("ListS len:~p", [erlang:length(ListS)]),
	loadDataProcess(loadMarriageAck),
	?LOG_OUT("loadMarriageAck end ..."),
	ok.

-spec loadPetTerritoryAck(
	{
		ListPlayer::[#rec_player_territory{}, ...],
		ListPet::[#rec_player_territory_pet{}, ...],
		ListHistoryA::[#rec_player_territory_history_a{}, ...],
		ListHistoryD::[#rec_player_territory_history_d{}, ...]
	}
) ->
	ok.
loadPetTerritoryAck({ListPlayer, ListPet, ListHistoryA, ListHistoryD}) ->
	?LOG_OUT("loadPetTerritoryAck begin ..."),
	acPetTerritoryState:loadDB_Player(ListPlayer),
	?LOG_OUT("ListPlayer len:~p", [erlang:length(ListPlayer)]),
	acPetTerritoryState:loadDB_Pet(ListPet),
	?LOG_OUT("ListPet len:~p", [erlang:length(ListPet)]),
	acPetTerritoryState:loadDB_HistoryA(ListHistoryA),
	?LOG_OUT("ListHistoryA len:~p", [erlang:length(ListHistoryA)]),
	acPetTerritoryState:loadDB_HistoryD(ListHistoryD),
	?LOG_OUT("ListHistoryD len:~p", [erlang:length(ListHistoryD)]),
	loadDataProcess(loadPetTerritoryAck),
	?LOG_OUT("loadPetTerritoryAck end ..."),
	ok.

loadUserAccountAck(DataList) ->
	ets:insert_new(ets_recRoleList, DataList),
	?LOG_OUT("insert ets_recRoleList len:~p", [erlang:length(DataList)]),
	loadDataProcess(loadUserAccountAck),
	ok.

loadBaseRoleAck(DataList) ->
	ets:insert_new(ets_rec_base_role, DataList),
	?LOG_OUT("insert ets_rec_base_role len:~p", [erlang:length(DataList)]),
	ok.

loadDataProcess(Flag) ->
	case lists:member(Flag, ?NeedWaitLoadList) of
		true ->
			Process = playerDataMgrState:addLoadPlayerDataProcess(Flag),
			?LOG_OUT("loadDataProcess:~p,~p", [Flag, Process]),
			case erlang:length(Process) =:= erlang:length(?NeedWaitLoadList) of
				true ->
					psMgr:sendMsg2PS(?PsNameDBS, playerDataLoadSuccess, 0);
				_ ->
					?WARN_OUT("wait load player data..."),
					skip
			end;
		_ ->
			?ERROR_OUT("not register in waitlist:~p", [Flag]),
			skip
	end,
	ok.