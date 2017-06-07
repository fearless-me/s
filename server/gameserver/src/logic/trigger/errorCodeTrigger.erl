%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 九月 2016 10:30
%%%-------------------------------------------------------------------
-module(errorCodeTrigger).
-author("wenshaofei").
-include("../private_logic.hrl").
%% API
-compile(export_all).

send_error_code_from_condation_argu(#triggerCfg{}=Cfg, FromProgramArgs,FromCondationArgu)->
    {ok,[ErrorCode]}=logicLib:getLogicArguValue(?CK_ERROR_CODE,FromCondationArgu),
    playerMsg:sendErrorCodeMsg(ErrorCode),
    triggerLib:getSuccessReturn(Cfg, FromProgramArgs,FromCondationArgu).

send_error_code_from_argu(#triggerCfg{argu = [ErrorCode]}=Cfg, FromProgramArgs,FromCondationArgu)->
    playerMsg:sendErrorCodeMsg(ErrorCode),
    triggerLib:getSuccessReturn(Cfg, FromProgramArgs,FromCondationArgu).

send_error_code_by_(#triggerCfg{argu = [ErrorCode]}=Cfg, FromProgramArgs,FromCondationArgu)->
    playerMsg:sendErrorCodeMsg(ErrorCode),
    triggerLib:getSuccessReturn(Cfg, FromProgramArgs,FromCondationArgu).