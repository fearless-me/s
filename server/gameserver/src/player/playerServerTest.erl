%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 16. 五月 2017 11:02
%%%-------------------------------------------------------------------
-module(playerServerTest).
-author(tiancheng).

-define(ArrayType_Line1, 1).	%% 我为起点，和目标的距离为单段，大于2人的单条直线
-define(ArrayType_Line2, 2).	%% 我为起点，和目标的距离为单段，大于2人的单条直线，正弦90度，双排
-define(ArrayType_Circle1, 3).	%% 我为圆点，和目标的距离为半径的圆，最多支持9个人

-define(ArrayPerform_BQ, 1).	%% 表情
-define(ArrayPerform_DZ, 2).	%% 动作

-include("playerPrivate.hrl").

%% API
-export([
	array/3,
	arrayRot/1,
	arrayPerform/2
]).

-export([
	serverTest_playerTransferPos/1,
	serverTest_Perform/1
]).

array(_ArrayType, _Number, 0) ->
	false;
array(_ArrayType, 2, ReferTarget) ->
	SelfCode = playerState:getPlayerCode(),
	setTargetCodeList([SelfCode, ReferTarget]),
	true;
array(_ArrayType, 1, _ReferTarget) ->
	false;
array(_ArrayType, 0, _ReferTarget) ->
	false;
array(?ArrayType_Circle1, Number, ReferTarget) ->
	SelfCode = playerState:getPlayerCode(),
	circle1(SelfCode, ReferTarget, erlang:min(Number, 9));
array(?ArrayType_Line2, Number, ReferTarget) ->
	SelfCode = playerState:getPlayerCode(),
	line2(SelfCode, ReferTarget, Number);
array(?ArrayType_Line1, Number, ReferTarget) ->
	SelfCode = playerState:getPlayerCode(),
	line1(SelfCode, ReferTarget, Number);
array(Type, Number, ReferTarget) ->
	?ERROR_OUT("array roleID=~p, type=~p, number=~p, refer=~p",
		[playerState:getRoleID(), Type, Number, ReferTarget]),
	error.

arrayRot(Rot) ->
	case getTargetCodeList() of
		[] -> skip;
		List ->
			Msg = #pk_GS2U_GridPlayerRotw{rotw = Rot, codes = List},
			playerMsg:sendMsgToNearPlayer(Msg, true),
			ok
	end.

arrayPerform(?ArrayPerform_BQ, IconIndex) ->
	List = getTargetCodeList(),
	case lists:member(IconIndex, playerChat:getPlayerPerformanceIDList(1)) andalso List /= [] of
		true ->
			sendMsgToNear(List, {serverTest_Perform, {?ArrayPerform_BQ, IconIndex}}),
			true;
		_ ->
			false
	end;
arrayPerform(?ArrayPerform_DZ, IconIndex) ->
	List = getTargetCodeList(),
	case lists:member(IconIndex, playerChat:getPlayerPerformanceIDList(2)) andalso List /= [] of
		true ->
			sendMsgToNear(List, {serverTest_Perform, {?ArrayPerform_DZ, IconIndex}}),
			true;
		_ ->
			false
	end;
arrayPerform(_Type, _ID) ->
	error.

setTargetCodeList(List) ->
	put('TargetCodeList', List),
	erlang:length(List).
getTargetCodeList() ->
	case get('TargetCodeList') of
		undefined -> [];
		List -> List
	end.

sendMsgToNear(0, _) -> ok;
sendMsgToNear([Code | CodeList], Data) ->
	sendMsgToNear(Code, Data),
	sendMsgToNear(CodeList, Data);
sendMsgToNear(Code, {Msg, Data}) ->
	Ets = playerState:getMapPlayerEts(),
	case ets:lookup(Ets, Code) of
		[#recMapObject{pid = Pid}] ->
			psMgr:sendMsg2PS(Pid, Msg, Data);
		_ ->
			skip
	end,
	ok.

circle1(SelfCode, TargetCode, NeedNumber) ->
	Ets = playerState:getMapPlayerEts(),
	List1 = ets:tab2list(Ets),
	case erlang:length(List1) >= NeedNumber of
		true ->
			%% 排队自己
			List2 = lists:filter(
				fun(#recMapObject{code = C}) -> C /= SelfCode end,
				List1
			),
			List3 = misc:randUniqueFromList(NeedNumber - 1, List2),

			%% 计算半径
			[#recMapObject{x = X1, y = Y1}] = ets:lookup(Ets, SelfCode),
			[#recMapObject{x = X2, y = Y2}] = ets:lookup(Ets, TargetCode),
			DX = X1 - X2,
			DY = Y1 - Y2,
			Dist = erlang:trunc(math:sqrt(DX * DX + DY * DY)),

			%% 安置其它玩家
			F =
				fun(#recMapObject{code = Code, pid = Pid}, {AccL, Angle}) ->
					X3 = X1 + Dist * math:cos(Angle * 3.14 / 180),
					Y3 = Y1 + Dist * math:sin(Angle * 3.14 / 180),
					psMgr:sendMsg2PS(Pid, serverTest_playerTransferPos,
						{playerState:getMapPid(), playerState:getMapID(), X3, Y3}),
					{[Code | AccL], Angle + 45}
				end,
			{TL, _} = lists:foldl(F, {[], 0}, List3),
			setTargetCodeList([SelfCode] ++ TL),
			ok;
		_ ->
			error
	end.

line1(SelfCode, TargetCode, NeedNumber) ->
	Ets = playerState:getMapPlayerEts(),
	List1 = ets:tab2list(Ets),
	case erlang:length(List1) >= NeedNumber of
		true ->
			List2 = lists:filter(
				fun(#recMapObject{code = C}) -> C /= SelfCode andalso C /= TargetCode end,
				List1
			),
			List3 = misc:randUniqueFromList(NeedNumber - 2, List2),

			[#recMapObject{x = X1, y = Y1}] = ets:lookup(Ets, SelfCode),
			[#recMapObject{x = X2, y = Y2}] = ets:lookup(Ets, TargetCode),
			DX = X1 - X2,
			DY = Y1 - Y2,
			Dist = erlang:trunc(math:sqrt(DX * DX + DY * DY)),

			F =
				fun(#recMapObject{code = Code, pid = Pid}, {AccL, Number}) ->
					X3 = X1 - DX / Dist * (Dist * Number),
					Y3 = Y1 - DY / Dist * (Dist * Number),
					psMgr:sendMsg2PS(Pid, serverTest_playerTransferPos,
						{playerState:getMapPid(), playerState:getMapID(), X3, Y3}),
					{[Code | AccL], Number + 1}
				end,
			{TL, _} = lists:foldl(F, {[], 2}, List3),
			setTargetCodeList([SelfCode, TargetCode] ++ TL),
			ok;
		_ ->
			error
	end.

line2(SelfCode, TargetCode, NeedNumber) ->
	Ets = playerState:getMapPlayerEts(),
	List1 = ets:tab2list(Ets),
	case erlang:length(List1) >= NeedNumber of
		true ->
			List2 = lists:filter(
				fun(#recMapObject{code = C}) -> C /= SelfCode andalso C /= TargetCode end,
				List1
			),
			List3 = misc:randUniqueFromList(NeedNumber - 2, List2),

			[#recMapObject{x = X1, y = Y1} = Self] = ets:lookup(Ets, SelfCode),
			[#recMapObject{x = X2, y = Y2} = Target] = ets:lookup(Ets, TargetCode),
			DX = X1 - X2,
			DY = Y1 - Y2,
			Dist = erlang:trunc(math:sqrt(DX * DX + DY * DY)),

			Dist2 = math:sqrt(Dist * Dist * 2),

			%% 先处理第一条线
			List4 = [Self | lists:sublist(List3, erlang:length(List3) div 2)],
			F =
				fun(#recMapObject{code = Code, pid = Pid}, {X, Y, AccL, Number}) ->
					X3 = X + Dist * Number,%* math:cos(90 * 3.14 / 180)
					Y3 = Y + Dist * Number,%* math:sin(90 * 3.14 / 180)

					psMgr:sendMsg2PS(Pid, serverTest_playerTransferPos,
						{playerState:getMapPid(), playerState:getMapID(), X3, Y3}),
					{X, Y, [Code | AccL], Number + 1}
				end,
			{_, _, TL1, _} = lists:foldl(F, {X1, Y1, [], 0}, List4),

			%% 再处理第二条线
			List5 = [Target | (List3 -- List4)],
			{_, _, TL2, _} = lists:foldl(F, {X2, Y2, [], 0}, List5),
			setTargetCodeList(TL1 ++ TL2),
			ok;
		_ ->
			error
	end.

serverTest_playerTransferPos({MapPid, MapId, TX, TY}) ->
	case playerState:getMapPid() of
		MapPid ->
			playerMap:onLaterTransferPosAck(MapId, TX, TY);
		_ ->
			skip
	end,
	ok.

serverTest_Perform({?ArrayPerform_BQ, IconIndex}) ->
	playerChat:showHeadEmoticonIcon(IconIndex),
	ok;
serverTest_Perform({?ArrayPerform_DZ, IconIndex}) ->
	Code = playerState:getPlayerCode(),
	Msg = #pk_GS2U_ShowAction{playerCode = Code, actionIndex = IconIndex},
	playerMsg:sendMsgToNearPlayer(Msg, true),
	ok.