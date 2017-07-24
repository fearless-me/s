%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 九月 2017 15:41
%%%-------------------------------------------------------------------

-module(cfg).
-compile(export_all).

-include("common/common.hrl").
-include("setupLang.hrl").

% 简体中文版
getModule(Module, ?Lang_CHS) ->
	cfg_chs:getMod(Module);
% 繁体中文版
getModule(Module, ?Lang_CHT) ->
	cfg_cht:getMod(Module);
% 英语版本
getModule(Module, ?Lang_ENU) ->
	cfg_enu:getMod(Module);
% 韩国
getModule(Module, ?Lang_KOR) ->
	cfg_kor:getMod(Module);
% 新马泰
getModule(Module, ?Lang_XMT) ->
	cfg_xmt:getMod(Module);
% 泰国
getModule(Module, ?Lang_THA) ->
	cfg_tha:getMod(Module);
% 俄罗斯
getModule(Module, ?Lang_RUS) ->
	cfg_rus:getMod(Module);
% 日本
getModule(Module, ?Lang_JPN) ->
	cfg_jpn:getMod(Module);
% 越南
getModule(Module, ?Lang_VN) ->
	cfg_vietnam:getMod(Module);
%% 默认
getModule(Module, AnyLang) ->
	?ERROR_OUT("fatal error Type of CurLang:[~p_~p]",[Module, AnyLang]),
	undefined.
