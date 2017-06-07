%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc乱世为王玩家模块
%%%
%%% @end
%%% Created : 22. 九月 2016 10:39
%%%-------------------------------------------------------------------
-module(playerLSBattlefield).
-author("wenshaofei").
-include("playerPrivate.hrl").

%% API
-export([addExp/0,join_active/0,transformPlayerOut/0,changePkState/0]).

addExp()->
    Argu = logicArguLib:getCurrentMapId(),
    Argu2=logicArguLib:getExpValueArgu(10*playerState:getLevel(),?ExpSourceLSBattle,0), 
    logicLib:runLogicGroup(?LOGIC_GROUP_ID_LS_BATTLEFIELD_ADD_EXP,[Argu,Argu2]).

join_active()->
    RoleBaseArgu=logicArguLib:getRoleBaseInfoArgu(),
    logicLib:runLogicGroup(?LOGIC_GROUP_ID_JOIN_LS_BATTLEFIELD,[RoleBaseArgu]).

transformPlayerOut()->
    Argu = logicArguLib:getCurrentMapId(),
    logicLib:runLogicGroup(?LOGIC_GROUP_ID_LS_BATTLEFIELD_TRANSFER_OUT,[Argu]).
changePkState()->
    logicLib:runLogicGroup(?LOGIC_GROUP_ID_LS_BATTLEFIELD_CHANGE_PK_STATE,[]) .
