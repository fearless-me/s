%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20161115
%%%-------------------------------------------------------------------
-author("meitianyang").

-ifndef(Hrl_friend2Private__hrl___).
-define(Hrl_friend2Private__hrl___, 1).

-include("gsInc.hrl").

%% 多重操作定义
-define(RELATION2_AddFromBlack,   0).
-define(RELATION2_BanWithUnban,   1).
-define(RELATION2_BanFromFriend,  2).

%% 特定后续操作定义
%% 特定环境下作为返回值返回，仅检测特定的一个或多个值以决定后续逻辑
-define(CONTINUE_BEGIN,             0).
-define(CONTINUE_NONE,              0).   %% 不进行任何特定操作
-define(CONTINUE_AddFromBlackAsk,   1).   %% 询问客户端是否从黑名单中添加好友
-define(CONTINUE_AddDo,             2).   %% 执行添加好友
-define(CONTINUE_AddApply,          3).   %% 执行申请添加好友
-define(CONTINUE_DelFormal,         4).   %% 删除好友
-define(CONTINUE_DelTemp,           5).   %% 删除临时好友
-define(CONTINUE_DelBlack,          6).   %% 删除黑名单
-define(CONTINUE_DelApply,          7).   %% 拒绝好友申请
-define(CONTINUE_SyncFormalA,       8).   %% 同步A好友信息
-define(CONTINUE_SyncTempA,         9).   %% 同步A临时好友信息
-define(CONTINUE_SyncBlackA,        10).  %% 同步A黑名单信息
-define(CONTINUE_SyncApplyA,        11).  %% 同步A好友申请信息
-define(CONTINUE_SyncFormalB,       12).  %% 同步B好友信息
-define(CONTINUE_SyncTempB,         13).  %% 同步B临时好友信息
-define(CONTINUE_SyncBlackB,        14).  %% 同步B黑名单信息
-define(CONTINUE_SyncApplyB,        15).  %% 同步B好友申请信息
-define(CONTINUE_SyncFormalAB,      16).  %% 同步AB好友信息
-define(CONTINUE_SyncTempAB,        17).  %% 同步AB临时好友信息
-define(CONTINUE_SyncBlackAB,       18).  %% 同步AB黑名单信息
-define(CONTINUE_SyncApplyAB,       19).  %% 同步AB好友申请信息
-define(CONTINUE_BanWithUnBan,      20).  %% 黑名单已满，拉黑需要移除一位
-define(CONTINUE_BanFromFormal,     21).  %% 拉黑好友
-define(CONTINUE_Ban,               22).  %% 执行拉黑（包含拉黑临时好友、拉黑正式好友）
-define(CONTINUE_AddDoTemp,         23).  %% 执行添加好友
-define(CONTINUE_Like,              24).  %% 点赞
-define(CONTINUE_GiveAP,            25).  %% 赠送行动点（体力值）
-define(CONTINUE_GainAP,            26).  %% 领取行动点（体力值）
-define(CONTINUE_Transmit,          27).  %% 传送
-define(CONTINUE_FreshInteraction,  28).  %% 刷新正式好友的交互时间
-define(CONTINUE_AddApplyFromBlack, 29).  %% 解除目标的黑名单，并向目标发送好友申请（黑名单之间不存在申请，所以必然只是申请而不是直接加好友）
-define(CONTINUE_DelBlackAndBan,    30).  %% 解除目标A的黑名单，并拉黑目标B
-define(CONTINUE_BanFromFormalDo,   31).  %% 执行拉黑好友（跳转至?CONTINUE_Ban实现）
-define(CONTINUE_BanWithUnBanAndDel,32).  %% 黑名单满的情况下试图拉黑好友
-define(CONTINUE_DelFormalS,        33).  %% 删除正式好友成功（用于配合执行?CONTINUE_BanWithUnBanAndDel）
-define(CONTINUE_END,               33).
-type type_continue() :: ?CONTINUE_BEGIN .. ?CONTINUE_END.

%% 扩展功能定义
-define(EXOP_BEGIN,         0).
-define(EXOP_Like,          0). %% 点赞
-define(EXOP_GiveAP,        1). %% 赠送行动点（体力值）
-define(EXOP_GainAP,        2). %% 领取行动点（体力值）
-define(EXOP_Transmit,      3). %% 传送
-define(EXOP_END,           3).
-type type_exop() :: ?EXOP_BEGIN .. ?EXOP_END.

%% 辅助排序的结构
-record(recSortHelper, {
	targetRoleID = 0,
	isOnline = false,
	level = 0,
	closeness = 0,
	timeRelation = 0,
	timeLastOnline = 0,
	timeLastInteractive = 0
}).

%% 默认值
-define(DefaultValueOfRelation(A,B),
	#rec_friend2_relation{
		roleID = A,
		targetRoleID = B,
		relation = 0,
		closeness = 0,
		timeRelation = 0,
		timeLastInteractive = 0
	}
).
-define(DefaultValueOfInteraction(A,B),
	#rec_friend2_interaction{
		roleID = A,
		targetRoleID = B,
		timeBeApply = 0
	}
).
-define(DefaultValueOfChatMsg(B),
	#recFriend2Chat{
		targetRoleID = B,
		chatMsgs = []
	}
).
-define(DefaultValueOfFriend2Data(A),
	#recFriend2Data{
		roleID = A,
		relations = [],
		interactions = [],
		chatMsgs = []
	}
).
-define(DefaultValueOfFriend2Cross(A),
	#recFriend2Cross{
		roleID = A,
		friends = [],
		applys = []
	}
).

%% 心跳
-define(Friend2HeartBeat, 1000 * 60 * 5).             %% 普通心跳，主要用于清理超时的数据，跨服的延时消息同步
-define(ApplicantLife, 60 * 60 * 72).                 %% 申请者生命周期
-define(OfflineMsgLife, 60 * 60 * 72).                %% 离线消息生命周期

%%%-------------------------------------------------------------------

%% 跨服好友相关列表类型定义
-define(LT_Cross, 0).	%% 跨服好友列表
-define(LT_Apply, 1).	%% 申请者列表

%% 跨服好友相关数据实时同步类型
-define(SYNC_R_BEGIN,			0).
-define(SYNC_R_UpdateApply,		0).	%% 更新申请者列表
-define(SYNC_R_DeleteApply,		1).	%% 删除申请者列表
-define(SYNC_R_UpdateFriend,	2).	%% 更新好友列表
-define(SYNC_R_DeleteFriend,	3).	%% 删除好友
-define(SYNC_R_END,				3).
-type type_syncR() :: ?SYNC_R_BEGIN .. ?SYNC_R_END.

%% 跨服好友相关数据延时同步类型
-define(SYNC_D_BEGIN,			0).
-define(SYNC_D_N2C_Init,		0).	%% 普通服向跨服初始化列表
-define(SYNC_D_C2N_AskRole,		1).	%% 跨服向普通服请求刷新角色状态
-define(SYNC_D_N2C_AckRole,		2).	%% 普通服向跨服反馈角色状态
-define(SYNC_D_C2N_Fix,			3).	%% 跨服向普通服同步校正数据
-define(SYNC_D_END,				3).
-type type_syncD() :: ?SYNC_D_BEGIN .. ?SYNC_D_END.

%% 跨服好友公共进程延时同步状态
-define(SYNC_DS_BEGIN,			0).
-define(SYNC_DS_Tick,			0).	%% 等待心跳，空闲中，下一个Friend2HeartBeat触发下一状态
-define(SYNC_DS_AllRoleID,		1).	%% 收集所有RoleID，计算中，计算完毕后向各个普通服发送消息触发下一个状态
-define(SYNC_DS_AskRole,		2).	%% 等待所有普通服反馈消息，等待中，收到所有数据或下一个Friend2HeartBeat超时触发下一个状态
-define(SYNC_DS_MatchInfo,		3).	%% 匹配刷新消息（更新、删除），计算中，计算完毕后向各个普通服发送消息回归状态0
-define(SYNC_DS_END,			3).
-type type_syncDS() :: ?SYNC_DS_BEGIN .. ?SYNC_DS_END.

-endif. %% Hrl_friend2Private__hrl___
