%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%% NPC移动消息
%%% @end
%%% Created : 27. 十月 2014 17:08
%%%-------------------------------------------------------------------
-module(npcMove).
-author("tiancheng").

-include("copyMapScheduleDefine.hrl").

%% API
-export([
	getNpcChangeMoveCDTime/0,
	updateMoveNpcPos/0,
	gmTest_riftnpcmove/1
]).

-spec gmTest_riftnpcmove({Code::uint(), ID::uint(), TX::float(), TY::float()}) -> ok.
gmTest_riftnpcmove({Code, ID, TX, TY}) ->
	npcChangePos(Code, ID, TX, TY),
	ok.

%% 获取时空裂痕npc每次移动的CD时间
-spec getNpcChangeMoveCDTime() -> uint().
getNpcChangeMoveCDTime() ->
	MapID = mapState:getMapId(),
	case lists:member(MapID, getCfg:get1KeyList(cfg_rift)) of
		true ->
			case getCfg:getCfgPStack(cfg_rift, MapID) of
				#riftCfg{cd = CD} ->
					CD;
				_ ->
					0
			end;
		_ ->
			0
	end.

%% 更新移动NPC的位置
-spec updateMoveNpcPos() -> false | uint().
updateMoveNpcPos() ->
	MapID = mapState:getMapId(),
	case lists:member(MapID, getCfg:get1KeyList(cfg_rift)) of
		true ->
			case getCfg:getCfgPStack(cfg_rift, MapID) of
				#riftCfg{cd = CD, move_npc_list = MNList, position = PosList} ->

					Fun = fun({X, Y}) ->
						{erlang:float(X), erlang:float(Y)}
					end,
					NPosList = lists:map(Fun, PosList),

					npcChangePos(MNList, NPosList),

					%% 下次心跳
					CD;
				_ ->
					%% 不再心跳
					false
			end;
		_ ->
			false
	end.

%% NPC位置发生改变
-spec npcChangePos(list() | uint(), list()) -> list().
npcChangePos(_, []) ->
%%	?ERROR_OUT("npcChangePos:~p,~p", [self(), mapState:getMapId()]),
	[];
npcChangePos([], List) ->
	List;
npcChangePos([NpcID|OtherNpc], PosList) when ?IsListValid(PosList) ->
	SurplusPos = npcChangePos(NpcID, PosList),
	npcChangePos(OtherNpc, SurplusPos);
npcChangePos(NpcID, PosList) when ?IsListValid(PosList) ->
	NpcList = getNpcListByID(NpcID),
	Fun = fun(#recMapObject{code = Code, id = ID, x = X, y = Y}, PL) ->
		PList = lists:delete({X, Y}, PL),
		Len = length(PList),
		case Len > 0 of
			true ->
				Index = misc:rand(1, Len),
				{TX, TY} = lists:nth(Index, PList),
				npcChangePos(Code, ID, TX, TY),
%% 				?DEBUG_OUT("AAA:~p,~p/~p,{~p,~p}", [PList,Len,Index,TX,TY]),
				lists:delete({TX, TY}, PL);
			_ ->
%%				?ERROR_OUT("npcChangePos:~p,~p,{~p,~p},~p", [Code,ID,X,Y,PosList]),
				PL
		end
	end,
	lists:foldl(Fun, PosList, NpcList).

-spec getNpcListByID(NpcID::uint()) -> list().
getNpcListByID(NpcID) ->
	NpcEts = mapState:getMapNpcEts(),
	MatchSpec = ets:fun2ms(fun(Obj) when Obj#recMapObject.id =:= NpcID, Obj#recMapObject.type =:= ?ObjTypeNPC ->
		Obj
	end),
	myEts:selectEts(NpcEts, MatchSpec).

%% npc改变位置
-spec npcChangePos(Code::uint(), ID::uint(), TX::uint() | float(), TY::uint() | float()) -> ok.
npcChangePos(Code, ID, TX, TY) ->
	FTX = erlang:float(TX),
	FTY = erlang:float(TY),

	%% 设置改变时间
	mapState:setNpcChangePosTime(Code),

	PlayerEts = mapState:getMapPlayerEts(),
	NpcEts = mapState:getMapNpcEts(),

	%[#recMapObject{actionStatus = AS, rotW = RW, x = OX, y = OY, name=Name,groupID = GroupID, other = Other}] = myEts:lookUpEts(NpcEts, Code),
	[#recMapObject{groupID = GroupID}] = myEts:lookUpEts(NpcEts, Code),

	%% 更新NPC坐标
	myEts:updateEts(NpcEts, Code, [{#recMapObject.x, FTX}, {#recMapObject.y, FTY}]),

	%% 通知这个npc现在所在的位置范围的所有玩家
%%	OList = mapView:getNearAllObject(self(),PlayerEts,?ObjTypePlayer,{OX, OY}),
%%	Fun = fun(#recMapObject{netPid = NetPID}) ->
%%		mapView:sendNetMsgToNetPid(NetPID, #pk_GS2U_NpcMomentMove{npcCode = Code, npcID = ID, tX = FTX, tY = FTY})
%%	end,
%%	lists:foreach(Fun, OList),
	%% 通知全图玩家，NPC移动了
	Msg = #pk_GS2U_NpcMomentMove{npcCode = Code, npcID = ID, tX = FTX, tY = FTY},
	mapView:sendMsg2AllPlayer(self(), PlayerEts, Msg, GroupID),

%%	 通知目标点的玩家，npc出现
%%	Title = case erlang:is_list(Other) of
%%		        true -> Other;
%%		        _ -> []
%%	        end,
%%	NpcInfo = [#pk_LookInfoNpc{
%%		code = Code,
%%		id = ID,
%%		x = FTX,
%%		y = FTY,
%%		rotW = RW,
%%		name = misc:binToString(Name),
%%		title = Title,
%%		actionStatus = AS  %%同步npc状态到客户端%%
%%	}],
%%	Msg = #pk_GS2U_NpcList{npc_list = NpcInfo},
%%	mapView:sendMsg2NearPlayerByPos(self(), PlayerEts, Msg, FTX, FTY, GroupID),
%%	mapView:sendMsg2AllPlayer(self(), PlayerEts, Msg, GroupID),
%% 	?DEBUG_OUT("npcChangePos:~p,~p: {~p,~p} -> {~p,~p}",
%% 		[Code, ID, erlang:trunc(OX), erlang:trunc(OY), erlang:trunc(FTX), erlang:trunc(FTY)]),

	ok.