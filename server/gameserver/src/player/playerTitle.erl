%%%-------------------------------------------------------------------
%%% @author liushixue
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%	玩家称号系统
%%% @end
%%% Created : 04. 二月 2015 11:55
%%%-------------------------------------------------------------------
-module(playerTitle).
-author("liushixue").

-include("playerPrivate.hrl").
-include("title.hrl").
-include("../netmsg/netmsgRecords.hrl").
%% ===================================================================
%% API functions
%% ===================================================================
-export([
	initTitle/0,
	addTitle/2,
	changeFitState/1,
	getTitleOwnSolt/0,
	useItemAddTitle/0,
	checkTitleExpired/1,
	changeLimittimeTitle/1
]).


%%初始化称号
-spec initTitle() -> ok.
initTitle() ->
	TitleList = playerState:getPlayerTitleList(),
	sendTitleListToClient(TitleList).

%%增加称号词组或称号效果
-spec addTitle(TitleID::uint(),TitleSource::uint()) -> boolean().
addTitle(TitleID,TitleSource) ->
	OwnTitleList = playerState:getPlayerTitleList(),
	OwnTitleIDList = [Rec#recTitle.titleID || Rec <- OwnTitleList],
	case lists:member(TitleID, OwnTitleIDList) of
		true ->
			TitleCfg = getCfg:getCfgPStack(cfg_titlesystem, TitleID),
			case TitleCfg#titlesystemCfg.type1 of
				?TitleType1_Word ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BagTitleWordExist);
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_BagTitleEffectExist)
			end,
			?ERROR_OUT("player [~p] addtitle titleid [~p] exist",[playerState:getRoleID(),TitleID]),
			false;
		_ ->
			Time = time:getSyncTimeFromDBS(),
			EndTime = case getCfg:getCfgByArgs(cfg_titlesystem, TitleID) of
						  {}->
							  -1;
						  Cfg ->
							  case Cfg#titlesystemCfg.time =:= 0 of
								  true->
									  0;
								  _ ->
									  Cfg#titlesystemCfg.time + Time
							  end
					  end,
			case EndTime >= 0 of
				true ->
					RecTitle = #recTitle{titleID = TitleID,timestamp = EndTime },
					playerState:setPlayerTitleList([RecTitle | OwnTitleList]),
					playerSave:saveNewTitle(TitleID,EndTime),
					dbLog:sendSaveLogCreateTitle(playerState:getRoleID(),TitleID,TitleSource),
					sendAddTitleToClient(TitleID,EndTime);
				_ ->
					?ERROR_OUT("title[~p] cfg not exists",[TitleID])
			end,
			true
	end.


%%改变称号或效果的装配状态
-spec changeFitState(#pk_U2GS_ChangeTitleState{}) -> ok.
changeFitState(#pk_U2GS_ChangeTitleState{
	titleSlot1 = TitleSlot1,
	titleSlot2 = TitleSlot2,
	titleSlot3 = TitleSlot3,
	colorSlot  = ColorSlot,
	floorSlot  = FloorSlot
	}) ->
	ChangeIDList = [TitleSlot1,TitleSlot2,TitleSlot3,ColorSlot,FloorSlot],
	NewChangeIDList = checkTitleSlot(ChangeIDList),
	syncVisibleTitleToClient(NewChangeIDList).

-spec getTitleOwnSolt() -> list().
getTitleOwnSolt() ->
    Slot1 = playerPropSync:getProp(?PubProp_TitleSlot1),
    Slot2 = playerPropSync:getProp(?PubProp_TitleSlot2),
    Slot3 = playerPropSync:getProp(?PubProp_TitleSlot3),
    ColorSlot = playerPropSync:getProp(?PubProp_TitleColorSlot),
    FloorSlot = playerPropSync:getProp(?PubProp_TitleFloorSlot),
    [Slot1, Slot2,Slot3, ColorSlot,FloorSlot].

useItemAddTitle() ->
	AllTitleIDList = getCfg:get1KeyList(cfg_titlesystem),

	%%从所有称号ID或者已获得的称号ID中取得可供随机获得的普通ID列表
	Fun = fun(ID,AccIn) ->
		Cfg = getCfg:getCfgPStack(cfg_titlesystem, ID),
		case Cfg#titlesystemCfg.special =:= ?Title_General of
			true ->
				[ID | AccIn];
			_ ->
				AccIn
		end
	end,
	AllGeneralIDList = lists:foldl(Fun, [], AllTitleIDList),
	OwnTitleList = playerState:getPlayerTitleList(),
	OwnGeneralIDList = case OwnTitleList of
						   [] ->
							   [];
						   _ ->
							   Fun1 = fun(Rec) ->
								   Rec#recTitle.titleID
							   end,
							   OwnIDList = lists:map(Fun1, OwnTitleList),
							   lists:foldl(Fun, [], OwnIDList)
					   end,
	case erlang:length(OwnGeneralIDList) < erlang:length(AllGeneralIDList) of
		true ->
			LeftIDList = AllGeneralIDList -- OwnGeneralIDList,
			N = random:uniform(erlang:length(LeftIDList)),
			NewTitleID = lists:nth(N, LeftIDList),
			addTitle(NewTitleID,?TitleSourceGeneralScroll),
			true;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagTitleWordIsFull),
			false
	end.


%% ===================================================================
%% Internal functions
%% ===================================================================

%%发送已获得称号的列表到客户端
-spec sendTitleListToClient(TitleList::[#recTitle{},...]) -> ok.
sendTitleListToClient(TitleList) ->
	Fun = fun(#recTitle{
		titleID = TitleID,
		timestamp = Time
	}) ->
%%		EndTime = case getCfg:getCfgPStack(cfg_titlesystem, TitleID) of
%%					  #titlesystemCfg{time = T} ->
%%						  case T =:= 0 of
%%							  true -> 0;
%%							  _ -> T + Time
%%						  end;
%%			          _ -> 0
%%				  end,
		#pk_TitleInfo{
			titleID = TitleID,
			endTime = Time		}
	end,
	List = lists:map(Fun, TitleList),
	Msg = #pk_GS2U_OwnTitleList{
		titleInfoList = List
	},
	playerMsg:sendNetMsg(Msg).

%%同步已装配的称号到客户端
-spec syncVisibleTitleToClient(NewChangeIDList :: list()) -> ok.
syncVisibleTitleToClient(NewChangeIDList) ->
	playerPropSync:setInt(?PubProp_TitleSlot1,lists:nth(?TitleSlot1,NewChangeIDList)),
	playerPropSync:setInt(?PubProp_TitleSlot2,lists:nth(?TitleSlot2,NewChangeIDList)),
	playerPropSync:setInt(?PubProp_TitleSlot3,lists:nth(?TitleSlot3,NewChangeIDList)),
	playerPropSync:setInt(?PubProp_TitleColorSlot,lists:nth(?TitleColorSlot,NewChangeIDList)),
	playerPropSync:setInt(?PubProp_TitleFloorSlot,lists:nth(?TitleFloorSlot,NewChangeIDList)),
	ok.

%%发送新增称号信息到客户端
-spec sendAddTitleToClient(TitleID :: uint(),EndTime :: int()) ->ok.
sendAddTitleToClient(TitleID,EndTime) ->
	Msg = #pk_GS2U_AddTitle{
				titleID = TitleID,
				endTime = EndTime
			},
	playerMsg:sendNetMsg(Msg).

%%检查称号装配情况
-spec checkTitleSlot(ChangeIDList :: list()) -> list().
checkTitleSlot(ChangeIDList) ->
	TitleList = playerState:getPlayerTitleList(),
	Fun = fun(ID) ->
		case ID =:= ?NoneTitle of
			true ->
				?NoneTitle;
			_ ->
				%%检查要装配的称号ID玩家是否拥有
				case lists:keyfind(ID,#recTitle.titleID,TitleList) of
					false ->
						?ERROR_OUT("player[~ts] not own title: ~p",[playerState:getName(),ID]),
						?NoneTitle;
					_ ->
						ID
				end
		end
	end,
	lists:map(Fun,checkRepeat(ChangeIDList)).

%%检查一个称号重复装到多个槽位的情况，重复的设为?NoneTitle（会保留最后一个）
-spec checkRepeat(IDList :: list()) -> list().
checkRepeat([H|T]) ->
	case lists:member(H,T) of
		true ->
			[?NoneTitle|checkRepeat(T)];
		_ ->
			[H|checkRepeat(T)]
	end;
checkRepeat([]) ->
	[].

-spec checkLimitTitleSlot(TitleList :: list() ) -> ok.
checkLimitTitleSlot(TitleList)->
	SlotTitleID = playerPropSync:getProp(?PubProp_TitleOutDate),
	case SlotTitleID of
		0 ->ok; %未装备称号
		_ ->
			case lists:keyfind(SlotTitleID,#recTitle.titleID,TitleList) of
				false->
					playerMsg:sendNetMsg(#pk_GS2U_DelTitle{ titleID = SlotTitleID }),
					playerPropSync:setInt(?PubProp_TitleOutDate,?NoneTitle );
				_ ->ok
			end
	end,
	ok.

-spec checkTitleExpired(TitleList :: list() ) -> ok.
checkTitleExpired(TitleList)->
	checkLimitTitleSlot(TitleList),
	case TitleList of
		[]->[];
		_ ->
			OutDateTitle = lists:filter(fun(Title)->

				case getCfg:getCfgPStack(cfg_titlesystem, Title#recTitle.titleID ) of
					[]->false;
					TitleCfg ->
						case TitleCfg#titlesystemCfg.time =:= 0  of
							true -> false;
							false->
								CurrTime = time:getSyncTimeFromDBS(),
								case CurrTime > Title#recTitle.timestamp of
									true->true;
									false->false
								end
						end
				end
			end,TitleList),
			case OutDateTitle of
				[]->ok;
				_ ->
					lists:foreach(fun(Title)->
						?DEBUG_OUT("pk_GS2U_DelTitle [~p]",[Title#recTitle.titleID]),
						?LOG_OUT("player [~p] has title [~p] out of date",[playerState:getRoleID(),Title#recTitle.titleID]),
						playerMsg:sendNetMsg(#pk_GS2U_DelTitle{ titleID = Title#recTitle.titleID}),
						case Title#recTitle.titleID =:= playerPropSync:getProp(?PubProp_TitleOutDate) of
							true->
								playerPropSync:setInt(?PubProp_TitleOutDate,?NoneTitle );
							_ ->ok
						end,
						playerSave:deleteTitle(playerState:getRoleID(),Title#recTitle.titleID),
						playerState:setPlayerTitleList(lists:keydelete(Title#recTitle.titleID,#recTitle.titleID,TitleList))
					end,OutDateTitle)
			end,
			ok

	end,
	ok.

-spec changeLimittimeTitle(TitleID :: int() ) -> ok.
changeLimittimeTitle(TitleID)->
	case TitleID of
		0 ->
			playerPropSync:setInt(?PubProp_TitleOutDate,TitleID );
		_ ->
			TitleList = playerState:getPlayerTitleList(),
			LimitTitle = lists:filter(fun(Title)->
				case getCfg:getCfgPStack(cfg_titlesystem, Title#recTitle.titleID ) of
					{}->false;
					TitleCfg->TitleCfg#titlesystemCfg.time > 0
				end
									  end,TitleList),
			case lists:keyfind(TitleID,#recTitle.titleID,LimitTitle) of
				#recTitle{}->
					playerPropSync:setInt(?PubProp_TitleOutDate,TitleID );
				false->ok
			end
	end,
	ok.


