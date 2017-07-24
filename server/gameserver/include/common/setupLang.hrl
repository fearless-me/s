%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 09. 十一月 2015 21:50
%%%-------------------------------------------------------------------

-author("ZhongYuanWei").

%% 增加语言设定需要修改 cfg.erl

%% 不同语言定义
-define(Lang_CHS, chs).   % 简体中文版
-define(Lang_CHT, cht).   % 繁体中文版
-define(Lang_ENU, enu).   % 英语版本
-define(Lang_KOR, kor).   % 韩国
-define(Lang_XMT, xmt).   % 新马泰
-define(Lang_THA, tha).   % 泰国
-define(Lang_RUS, rus).   % 俄罗斯
-define(Lang_JPN, jpn).   % 日本
-define(Lang_VN,  vietnam).    % 越南

%%服务器当前使用的语言
-ifndef(Region).
-define(Cur_Lang, ?Lang_CHS).
-else.
-define(Cur_Lang,?Region).
-endif.