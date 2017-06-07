%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%% 区域同步处理文件,所有坐标必须为正值
%%% @end
%%% Created : 19. 九月 2016 19:06
%%%-------------------------------------------------------------------
-module(area).
-author("tiancheng").

-include("gsInc.hrl").

%% API
-export([
    addObjToAreaEts/3,
    addObjToAreaEts/4,
    delObjFromAreaEts/3,
    delObjFromAreaEts/4,
    updateObjAreaEts/4,
    updateObjAreaEts/5,
    updateObjAreaEts/6
]).

-export([
    getAreaID/2,
    get9AreaIDList/1,
    getAreaCodeList/2,
    getAreaCodeList/3
]).

%% 根据坐标获取区域ID
-spec getAreaID(X::float(), Y::float()) -> integer().
getAreaID(X, Y) ->
    getAreaID2(trunc(X / mapView:maxGridCellRowNum()), trunc(Y / mapView:maxGridCellColNum())).

%% 新增对象到区域ETS
-spec addObjToAreaEts(Code::uint(), AreaID::uint(), AreaEts::etsTab()) -> boolean().
addObjToAreaEts(Code, AreaID, AreaEts) ->
    case ets:lookup(AreaEts, AreaID) of
        [#recMapArea{codeList = L}] ->
            case lists:member(Code, L) of
                false ->
                    ets:update_element(AreaEts, AreaID, {#recMapArea.codeList, [Code | L]}),
                    true;
                _ ->
                    false
            end;
        [] ->
            ets:insert_new(AreaEts, #recMapArea{areaID = AreaID, codeList = [Code]}),
            true
    end.

-spec addObjToAreaEts(Code::uint(), X::float(), Y::float(), AreaEts::etsTab()) -> boolean().
addObjToAreaEts(_Code, _X, _Y, undefined) -> false;
addObjToAreaEts(Code, X, Y, AreaEts) ->
    AreaID = getAreaID(X, Y),
    addObjToAreaEts(Code, AreaID, AreaEts).

%% 对象从区域中离开
-spec delObjFromAreaEts(Code::uint(), X::float(), Y::float(), AreaEts::etsTab()) -> boolean().
delObjFromAreaEts(Code, X, Y, AreaEts) ->
    AreaID = getAreaID(X, Y),
    delObjFromAreaEts(Code, AreaID, AreaEts).
-spec delObjFromAreaEts(Code::uint(), AreaID::uint(), AreaEts::etsTab()) -> boolean().
delObjFromAreaEts(Code, AreaID, AreaEts) ->
    case ets:lookup(AreaEts, AreaID) of
        [#recMapArea{codeList = L}] ->
            case lists:member(Code, L) of
                true ->
                    ets:update_element(AreaEts, AreaID, {#recMapArea.codeList, lists:delete(Code, L)}),
                    true;
                _ ->
                    false
            end;
        [] ->
            false
    end.

%% 更新对象的区域，返回{消失，不变，新增的区域列表}
-spec updateObjAreaEts(Code::uint(), OldAreaID::uint(), X::float(), Y::float(), AreaEts::etsTab()) -> {list(), list(), list()}.
updateObjAreaEts(Code, OldAreaID, X, Y, AreaEts) ->
    NewAreaID = getAreaID(X, Y),
    updateObjAreaEts(Code, OldAreaID, NewAreaID, AreaEts).

%% 更新对象的区域，返回{消失，不变，新增的区域列表}
-spec updateObjAreaEts(Code::uint(), SX::float(), SY::float(), TX::float(), TY::float(), AreaEts::etsTab()) -> {list(), list(), list()}.
updateObjAreaEts(_Code, SX, SY, TX, TY, _AreaEts) when SX =:= TX andalso SY =:= TY ->
    % 没有新增，没有不变，没有消失
    {[], [], []};
updateObjAreaEts(Code, SX, SY, TX, TY, AreaEts) ->
    OldAreaID = getAreaID(SX, SY),
    NewAreaID = getAreaID(TX, TY),
    updateObjAreaEts(Code, OldAreaID, NewAreaID, AreaEts).
updateObjAreaEts(Code, OldAreaID, NewAreaID, AreaEts) ->
    case OldAreaID =:= NewAreaID of
        false ->
            ?WARN_OUT("updateObjAreaEts:~p,~p --> ~p", [Code, OldAreaID, NewAreaID]),
            delObjFromAreaEts(Code, OldAreaID, AreaEts),
            addObjToAreaEts(Code, NewAreaID, AreaEts);
        _ ->
            skip
    end,
    % 返回变化关系
    getChangeAreaIDList(OldAreaID, NewAreaID).

%% 获取区域内所有Code列表
getAreaCodeList(AreaEts, X, Y) ->
    AreaID = getAreaID(X, Y),
    AreaList = get9AreaIDList(AreaID),
    getAreaCodeList(AreaEts, AreaList).
getAreaCodeList(AreaEts, [_AreaID | _] = AreaIDList) ->
    F =
        fun(AreaID2, AccL) ->
            getAreaCodeList(AreaEts, AreaID2) ++ AccL
        end,
    lists:foldl(F, [], AreaIDList);
getAreaCodeList(AreaEts, AreaID) when erlang:is_integer(AreaID) andalso AreaID >= 0 ->
    case ets:lookup(AreaEts, AreaID) of
        [#recMapArea{codeList = []}] -> [];
        [] -> [];
        [#recMapArea{codeList = L}] -> L
    end;
getAreaCodeList(_AreaEts, _AreaID) -> [].

%% 根据当前区域，获取整个九宫区域，排除不存在的区域
get9AreaIDList(AreaID) ->
    {GX, GY} = getAreaGrid(AreaID),
    %% 中心
    RetL1 = [AreaID],
    %% 左
    RetL2 = getAreaID2(RetL1, GX - 1, GY),
    %% 右
    RetL3 = getAreaID2(RetL2, GX + 1, GY),
    %% 下
    RetL4 = getAreaID2(RetL3, GX, GY - 1),
    %% 上
    RetL5 = getAreaID2(RetL4, GX, GY + 1),
    %% 左下
    RetL6 = getAreaID2(RetL5, GX - 1, GY - 1),
    %% 右上
    RetL7 = getAreaID2(RetL6, GX + 1, GY + 1),
    %% 左上
    RetL8 = getAreaID2(RetL7, GX - 1, GY + 1),
    %% 右下
    RetL9 = getAreaID2(RetL8, GX + 1, GY - 1),
    RetL9.

%% 根据当前区域和目标区域，获取消失，不变，新增的区域列表
getChangeAreaIDList(OldAreaID, NewAreaID) when OldAreaID =:= NewAreaID -> {[], [OldAreaID], []};
getChangeAreaIDList(OldAreaID, NewAreaID) ->
    OldL = get9AreaIDList(OldAreaID),
    NewL = get9AreaIDList(NewAreaID),
    %% 新增区域
    New = NewL -- OldL,
    {OldL -- NewL,  NewL -- New, New}.

%% GY占低16位，GX占高位
getAreaID2(GX, GY) -> (GX bsl 16) bor GY.
getAreaID2(List, GX, _GY) when GX < 0 -> List;
getAreaID2(List, _GX, GY) when GY < 0 -> List;
getAreaID2(List, GX, GY) -> [getAreaID2(GX, GY) | List].
%% 通过区域ID，获取区域位置
getAreaGrid(0) -> {0, 0};
getAreaGrid(AreaID) -> {AreaID bsr 16, AreaID band 16#FFFF}.