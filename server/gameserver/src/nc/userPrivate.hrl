%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. 五月 2017 15:32
%%%-------------------------------------------------------------------
-author("Administrator").


-ifndef(UserPrivate_Hrl_).
-define(UserPrivate_Hrl_, 1).

-define(UserTickTime, 1000).

%% 初始化状态
-define(US_EMPTY, 0).
%% 发送Login消息
-define(US_CONNECTED, 1).
%% 验证结束
-define(US_AUTHED, 3).
%% 唯一性检查
-define(US_UNIQUE_CHECK, 4).
%% 排队中
-define(US_Queue, 4).
%% 角色选择创建阶段
-define(US_SELECT_ROLE, 4).
%% 加载数据
-define(US_ROLE_LOAD, 4).
%% 等待客户端进入地图
-define(US_WAITING_FOR_ENTER, 4).
%% 正常游戏中
-define(US_NORMAL, 4).
%% 换地图中
-define(US_CHANGE_MAP, 4).
%% 重复登录等待踢人
-define(US_ANOTHER_KICK, 4).
%% 重复登录等待踢人
-define(US_Dead, 4).

-endif.
