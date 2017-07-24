%%%此文件包含GS需要包含的头文件
-author(zhongyuanwei).

-ifndef(GSInc_hrl).
-define(GSInc_hrl,1).

-include("common/common.hrl").
-include("common/config.hrl").

-include("globalSetup.hrl").
-include("netmsgRecords.hrl").
-include("gsDef.hrl").

-include("gameProtect.hrl").
-include("char.hrl").
-include("common/db.hrl").
-include("player.hrl").
-include("gameMap.hrl").
-include("skill.hrl").
-include("item.hrl").
-include("task.hrl").
-include("trigger.hrl").
-include("monster.hrl").
-include("npc.hrl").
-include("mail.hrl").
-include("buff.hrl").
-include("pet.hrl").
-include("mount.hrl").
-include("common/variant.hrl").
-include("common/logdb.hrl").
-include("common/team.hrl").
-include("equip.hrl").
-include("table.hrl").
-include("common/guild.hrl").
-include("achieve.hrl").
-include("wake.hrl").
-include("title.hrl").
-include("common/gamedata.hrl").
-include("common/csMemCacheRec.hrl").
-include("common/logRecord.hrl").
-include("sevendays.hrl").
-include("dataDefine.hrl").
-include("collect.hrl").
-include("home.hrl").
-include("modeOpen.hrl").

%% 进程启动后，延时处理后续逻辑的时间 deprecate
-define(Dealy_Deal_Msg_Time, 1000).

%% gsOtpAccepter 模块中，监听gs节点连接，保存的已经连接GS的对应PID列表deprecate
-define(GSNodeListEts, gsNodeList).

%% 限制“条件-触发”模块使用的DailyType
-define(DailyTypeForConditionTrigger, [
	{?DailyType_EXP_MAP_EFFECT_TIME},
	{?DailyType_GOBLIN_FREE},
	{?DailyType_TREASURE_FREE},
	{?DailyType_Action_Piont_Buy_Number},
	{?DailyType_GOBLIN_FREE_LAST_SEC},
	{?DailyType_TREASURE_FREE_LAST_SEC},
	{?DailyType_NeedForSpeedJoinNumber}
]).
-define(CheckDailyType(DT), case lists:keyfind(DT, 1, ?DailyTypeForConditionTrigger) of false -> erlang:error(badarg); _ -> ok end).

%% 当角色进程扣除道具或货币后，向公共进程发送操作请求，公共进程因为其它原因拒绝操作，此时需要将扣除的资源补回
%% 此处定义了补回资源的一些数据结构便于重复使用
-define(BackType_BEGIN,	1).
-define(BackType_Coin,	1).	% 需要返还货币
-define(BackType_Item,	2).	% 需要返还道具
-define(BackType_END,	2).
-type argsBack() :: [
	{
		?BackType_BEGIN .. ?BackType_END,	%% 资源类型，避免资源ID冲突
		uint(),								%% 资源ID
		uint(),								%% 资源数量
		uint(),								%% PLogTS，参考playerLog.hrl
		uint()								%% 资源变化原因，参考logdb.hrl
	},
	...
].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 跨服活动报名组（目前仅能本服内组
-record(recCrossApply, {										%% 报名组，大家一起报名就一起进图哈
	id				= 0			:: uint64(),					%% 报名组ID
	activityType	= 0			:: uint16(),					%% 活动类型
	leader			= 0			:: uint64(),					%% 队长角色ID
	applicant		= 0			:: uint64(),					%% 报名者角色ID
	members			= []		:: [#pk_CrossRoleBase{}, ...],	%% 成员角色跨服信息
	paramEx			= undefined	:: term()						%% 各活动特殊处理参数
}).
-record(recCrossApplyHelper, {	%% 用于快速查找角色对应组ID防止同一时间多处报名
	roleID	= 0	:: uint64(),	%% 角色ID
	id		= 0	:: uint64()		%% 组ID
}).
-define(EtsCrossApply, recCrossApply).
-define(EtsCrossApplyHelper, recCrossApplyHelper).

-endif.
