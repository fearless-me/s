%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%% 数据管理定义
%%% @end
%%% Created : 22. 九月 2016 14:02
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(DATA_DEFINE_hrl).
-define(DATA_DEFINE_hrl,1).

-include("gamedata.hrl").

%% 在线玩家，下线即删除
-record(rec_OnlinePlayer, {
    roleID = 0,
    code = 0,
    accountID = 0,
    pid = undefined,
    netPid = undefined,
    playerSaveTime = 0, %% 最后一次定时保存时间
    loginTime = 0   %% 上线时间
}).

%% 玩家数据，这段名为对应的表名，值为对应的list
-record(rec_playerdata, {
    roleID = 0,                                                 %% 角色ID
    rec_player_prop = [] :: [#rec_player_prop{}, ...],          %% 玩家属性
    rec_task_accepted = [] :: [#rec_task{}, ...],      %% 接受任务列表
    rec_task_submitted = [] :: [#rec_task_submitted{}, ...],    %% 完成任务列表
	activeCode4Many = [] ::[integer(),...],	%% 角色已经领取了的万用礼包keys
	rec_player_monster_book = [] :: [#rec_player_monster_book{}, ...],	%% 怪物图鉴数据
    thisIsEndFlag = undefined
}).

%% 本数据库所有角色加名字列表
-record(rec_RoleName, {
    roleID = 0,             %% 角色ID
    roleName = ""           %% 角色名
}).


-record(rec_OnlineAccount,{
    accountID = 0,
    pid = undefined,
    netPid = undefined
}).
-endif.