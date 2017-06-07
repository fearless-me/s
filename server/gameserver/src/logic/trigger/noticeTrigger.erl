%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 九月 2016 10:30
%%%-------------------------------------------------------------------
-module(noticeTrigger).
-author("wenshaofei").
-include("../private_logic.hrl").
%% API
-compile(export_all).

%%通过condition参数来发送errorCode
send_error_code_from_condation_argu(#triggerCfg{} = Cfg, FromProgramArgs, FromCondationArgu) ->
  {ok, [ErrorCode]} = logicLib:getLogicArguValue(?CK_ERROR_CODE, FromCondationArgu),
  playerMsg:sendErrorCodeMsg(ErrorCode),
  triggerLib:getSuccessReturn(Cfg, FromProgramArgs, FromCondationArgu).
%%通过errorCode配置参数来发送错误信息
send_error_code_from_argu(#triggerCfg{argu = [ErrorCode]} = Cfg, FromProgramArgs, FromCondationArgu) ->
  playerMsg:sendErrorCodeMsg(ErrorCode),
  triggerLib:getSuccessReturn(Cfg, FromProgramArgs, FromCondationArgu).
%%通过程序来发送errorcode信息
%%send_error_code_by_progrom(#triggerCfg{argu = [ErrorCode]}=Cfg, FromProgramArgs,FromCondationArgu)->
%%    playerMsg:sendErrorCodeMsg(ErrorCode),
%%    triggerLib:getSuccessReturn(Cfg, FromProgramArgs,FromCondationArgu).


%%在指定的地图内发送公告
broad_cast_map_notice_by_progrom(#triggerCfg{argu = [ServerStringCfgKey]} = Cfg, FromProgramArgs, FromCondationArgu) ->
  {ok, {MapPidList, FormatStringArgu}} = logicLib:getLogicArguValue(?LK_NOTICE_IN_MAP, FromProgramArgs),
  Notify = stringCfg:getString(ServerStringCfgKey, FormatStringArgu),
  lists:foreach(
    fun(MapPid) ->
      psMgr:sendMsg2PS(MapPid, broadCastPaoMaDengMsgInMap, {Notify})
    end, MapPidList),
  triggerLib:getSuccessReturn(Cfg, FromProgramArgs, FromCondationArgu).

%%发送全服跑马灯公告
broad_cast_server_pmd_notice(#triggerCfg{argu = [ServerStringCfgKey]} = Cfg, FromProgramArgs, FromCondationArgu) ->
  {ok, FormatStringArgu} = logicLib:getLogicArguValue(?LK_NOTICE_ALL_SERVER, FromProgramArgs),

  Notify = stringCfg:getString(ServerStringCfgKey, FormatStringArgu),
  core:sendBroadcastNotice(Notify),
  triggerLib:getSuccessReturn(Cfg, FromProgramArgs, FromCondationArgu).
%%发送系统消息
send_system_msg(#triggerCfg{argu = [ServerStringCfgKey]} = Cfg, FromProgramArgs, FromCondationArgu) ->
  {ok, #rec_base_role{roleID = ID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, FromProgramArgs),
  case logicLib:getLogicArguValue(?LK_SYSTEM_MSG_FORMAT_ARGU, FromProgramArgs) of
    {ok, FormatStringArgu} ->
      ok;
    _ ->
      FormatStringArgu = []
  end,
  Msg = stringCfg:getString(ServerStringCfgKey, FormatStringArgu),
  case playerMgrOtp:getOnlinePlayerInfoByID(ID) of
    #rec_OnlinePlayer{pid = Pid} ->
     psMgr:sendMsg2PS(Pid, sendSystemChatMsg,self(), {Msg});
    _ ->
      ok
  end,
  triggerLib:getSuccessReturn(Cfg, FromProgramArgs, FromCondationArgu).
