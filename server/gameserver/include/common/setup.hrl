%%% 此文件为服务器的配置设置开关，以及需要包含库的头文件
%%%
-ifndef(Setup_hrl).
-define(Setup_hrl,1).

%%-include("globalSetup.hrl").

-ifdef(RELEASE).
-define(Is_Debug_version,false).
-define(Start_Link_TimeOut_ms,80000).
-else.
-define(Is_Debug_version,true).
-define(Start_Link_TimeOut_ms,388000).
-endif.

-include_lib("stdlib/include/ms_transform.hrl").
-include_lib("stdlib/include/qlc.hrl").

-compile(inline).
-compile({inline_size,100}).

-endif.

