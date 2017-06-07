%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. 五月 2016 19:46
%%%-------------------------------------------------------------------
-module(testVariant).
-author("Administrator").
-include("gsInc.hrl").
-include("cfg_signinaward.hrl").
-include("playerPrivate.hrl").
%% API
-export([init_var/0, check_var/0]).
%%测试用户签到
init_var() ->
    initBitVar(),
    initPlayerVarent(),
    verifyPlayerVarent(),
    iniClientVarent(),
    check_var()
.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Prvate Method%%%%%%%%%%%%%%%%%%%%%%%%
check_var() ->
    verifyPlayerVarent(),
    verifyClientVarent(),
    RoleId = playerState:getRoleID(),

    OneDay = variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize1),

    TwoDay = variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize2),

    ThreeDay = variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize3),

    FourDay = variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize4),

    FiveDay = variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize5),

    SixDay = variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize6),

    SevenDay = variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize7),

    if
        OneDay =:= false ->
            io:format("#############################error OneDay~n");
        TwoDay =:= false ->
            io:format("#############################error TwoDay~n");
        ThreeDay =:= false ->
            io:format("#############################error ThreeDay~n");
        FourDay =:= false ->
            io:format("#############################error FourDay~n");
        FiveDay =:= false ->
            io:format("#############################error FiveDay~n");
        SixDay =:= false ->
            io:format("#############################error SixDay~n");
        SevenDay =:= false ->
            io:format("#############################error SevenDay~n");
        true ->
            io:format("#################pass####################~p~n", [{OneDay, TwoDay, ThreeDay, FourDay, FiveDay, SixDay, SevenDay}])
    end.
initBitVar() ->
    RoleId = playerState:getRoleID(),
    variant:setPlayerBitVariant(RoleId,?Setting_PlayerBitVarReadOnly_SignPrize1, true),
    variant:setPlayerBitVariant(RoleId,?Setting_PlayerBitVarReadOnly_SignPrize2, true),
    variant:setPlayerBitVariant(RoleId,?Setting_PlayerBitVarReadOnly_SignPrize3, true),
    variant:setPlayerBitVariant(RoleId,?Setting_PlayerBitVarReadOnly_SignPrize4, true),
    variant:setPlayerBitVariant(RoleId,?Setting_PlayerBitVarReadOnly_SignPrize5, true),
    variant:setPlayerBitVariant(RoleId,?Setting_PlayerBitVarReadOnly_SignPrize6, true),
    variant:setPlayerBitVariant(RoleId,?Setting_PlayerBitVarReadOnly_SignPrize7, true),
    variant:setPlayerBitVariant(RoleId,?Setting_PlayerBitVarReadOnly_BindPhonePrize, true),
    initBitVar(?Setting_PlayerBitVarReadOnly_EndBit).
initBitVar(?Setting_GlobalBitVar_StartBit) ->
    ok;
initBitVar(?Setting_PlayerBitVarReadOnly_SignPrize7) ->
    initBitVar(?Setting_PlayerBitVarReadOnly_SignPrize1 - 1);
initBitVar(Value) ->
    RoleId = playerState:getRoleID(),
    IsVaild = isValidPlayerBitIndex(Value),
    if
        IsVaild ->
            variant:setPlayerBitVariant(RoleId,Value, false);
        true -> ok
    end,
    initBitVar(Value - 1).


-spec isValidPlayerBitIndex(VarIndex) -> boolean() when VarIndex :: uint().
isValidPlayerBitIndex(VarIndex) when (VarIndex >= ?Setting_PlayerBitVar_StartBit andalso VarIndex =< ?Setting_PlayerBitVar_EndBit) ->
    lists:member(VarIndex, ?Setting_Server_Needs);
isValidPlayerBitIndex(_) ->
    false.

%%初始化玩家变量
initPlayerVarent() ->
    initPlayerVarent(?Setting_PlayerVar_End)

.
initPlayerVarent(?Setting_PlayerVar_Start) ->
    ok;
initPlayerVarent(Index) ->
    IsValid = isServerValidPlayerIndex(Index),
    RoleId = playerState:getRoleID(),
    if
        IsValid ->
            variant:setPlayerVariant(RoleId,Index, Index);
        true ->
            ok
    end,
    initPlayerVarent(Index - 1).


%%初始化玩家变量
verifyPlayerVarent() ->
    verifyPlayerVarent(?Setting_PlayerVar_End)
.
verifyPlayerVarent(?Setting_PlayerVar_Start) ->
    io:format("=========verifyPlayerVarent==================pass############~n", []),
    ok;
verifyPlayerVarent(Index) ->
    IsValid = isServerValidPlayerIndex(Index),
    RoleId = playerState:getRoleID(),
    if
        IsValid ->
            variant:getPlayerVariant(RoleId, Index);
        true ->
            ok
    end,
    verifyPlayerVarent(Index - 1).


%%服务器可以修改的玩家有效索引
-spec isServerValidPlayerIndex(VarIndex) -> boolean() when VarIndex :: uint().
isServerValidPlayerIndex(VarIndex) when (VarIndex >= ?Setting_PlayerVar_Start andalso VarIndex =< ?Setting_PlayerVar_End)
    orelse (VarIndex >= ?Setting_PlayerVarReadOnly_Start andalso VarIndex =< ?Setting_PlayerVarReadOnly_End)
    orelse (VarIndex >= ?Setting_ClientVar_Start andalso VarIndex =< ?Setting_ClientVar_End)
    orelse (VarIndex >= ?Setting_PlayerBitVar_Start andalso VarIndex =< ?Setting_PlayerBitVar_End) ->
    lists:member(VarIndex, ?Setting_Server_Needs);
isServerValidPlayerIndex(_) ->
    false.


iniClientVarent() ->
    iniClientVarent(?Setting_ClientVar_End)
.
iniClientVarent( ?Setting_ClientVar_Start)->
    ok;
iniClientVarent( Index)->
    saveClientVariant(Index,Index),
    iniClientVarent(Index-1)
.

verifyClientVarent()->

    verifyClientVarent(?Setting_ClientVar_End)
.
verifyClientVarent(?Setting_ClientVar_Start)->
    io:format("=========verifyClientVarentt====pass=============############~n", []),
    ok;
verifyClientVarent(Index) ->
    RoleId = playerState:getRoleID(),
    %%检测是否在存在列表中，代客户端存储的不用检测
    IsExist = case (Index >= ?Setting_ClientVar_Start andalso Index =< ?Setting_ClientVar_End) of
                  true ->
                      true;
                  _ ->
                      lists:member(Index, ?Setting_Server_Needs)
              end,
    case IsExist of
        true ->
            case  variant:getPlayerVariant(RoleId, Index) of
                Index->ok;
                Value->
                    io:format("=============verifyClientVarent===fail============info:~p~n",[{RoleId, Index,Value}])
            end ;
        _ ->
            ok
    end,
    verifyClientVarent(Index-1) .

saveClientVariant(Index, Value) ->
    %%检测是否在存在列表中，代客户端存储的不用检测
    IsExist = case (Index >= ?Setting_ClientVar_Start andalso Index =< ?Setting_ClientVar_End) of
                  true ->
                      true;
                  _ ->
                      lists:member(Index, ?Setting_Server_Needs)
              end,
    case IsExist of
        true ->
            case variant:setPlayerVariant(playerState:getRoleID(), Index, Value) of
                true ->
                    %%变量实时保存
                    playerSave:saveVariant(Index, Value),
                    true;
                _ ->
                    false
            end;
        _ ->
            ?ERROR_OUT("Error Index[~p] update Variant value[~p]", [Index, Value]),
            false
    end.