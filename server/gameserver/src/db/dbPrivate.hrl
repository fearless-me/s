%%%数据库进程的私有定义
-ifndef(dbPrivate_hrl).
-define(dbPrivate_hrl,1).

-include("mysql.hrl").
-include("db.hrl").
-include("logger.hrl").
-include("emysql.hrl").
-include("dbsInc.hrl").
-include("netmsgRecords.hrl").


-define(CacheRoleBase,              roleBase).					%%角色基本数据
-define(CacheRoleBuff,              roleBuff).					%%BUFF
-define(CacheRoleAchieve,			roleAchieve).				%%成就
-define(CacheRoleBadge,				roleBadge).					%%徽章
-define(CacheRoleTitle,				roleTitle).					%%称号
-define(CacheRoleRefine,			roleRefine).				%%装备精炼
-define(CacheRolePackage,           rolePackageInfo).			%%背包信息
-define(CacheRoleItem,              roleItem).					%%道具
-define(CacheRoleEquip,             roleEquip).					%%装备
-define(CacheRoleSkill,             roleSkill).					%%技能
-define(CacheRoleSkillSlot,         roleSkillSlot).				%%技能插槽
-define(CacheRolePet,               rolePet).					%%宠物
-define(CacheRolePetSkill,			rolePetSkill).				%%宠物技能
-define(CacheRolePetEquip,			rolePetEquip).				%%宠物装备
-define(CacheRoleFriend,            roleFriendInfo).			%%自己的好友列表
-define(CacheRoleInFriend,          roleInFriendInfo).			%%自己在哪些人的好友列表
-define(CacheRoleTaskAccepted,      roleTaskAccepted).			%%已经接受的任务
-define(CacheRoleTaskSubmit,        roleTaskSubmit).			%%已经提交的任务
-define(CacheRoleDailyCounter,      roleDailyCounter).			%%每日计数器
-define(CacheRoleItemUseTime,		roleItemUseTime).			%%道具使用时间
-define(CacheRoleActiveCode,		roleActiveCode).			%%激活码
-define(CacheRoleVariant,           roleVariant).				%%变量
-define(CacheRoleAwaken,            roleAwaken).				%%觉醒
-define(CacheRoleFashion,           roleFashion).				%%时装
-define(CacheRoleFashionSlot,		roleFashionSlot).			%%玩家正穿戴的时装
-define(CacheRolePersonalityInfo,   rolePersonalityInfo).		%%个人信息，如星座、生日等等
-define(CacheRolePlayerProp,		rolePlayerProp).			%%玩家属性
-define(CacheRolePlayerClock,		rolePlayerClock).			%%玩家计时器

-define(CacheTypeList,
	[
		%%RoleBase需要单独处理
		%%?CacheRoleBase,
		?CacheRoleRefine,
		?CacheRoleBadge,
		?CacheRoleTitle,
		?CacheRoleAchieve,
		?CacheRolePackage,
		?CacheRoleItem,
		?CacheRoleEquip,
		?CacheRoleSkill,
		?CacheRoleSkillSlot,
		?CacheRolePet,
		?CacheRolePetSkill,
		?CacheRolePetEquip,
		?CacheRoleBuff,
		?CacheRoleFriend,
		?CacheRoleInFriend,
		?CacheRoleTaskAccepted,
		?CacheRoleTaskSubmit,
		?CacheRoleDailyCounter,
		?CacheRoleItemUseTime,
		?CacheRoleActiveCode,
        ?CacheRoleVariant,
		?CacheRoleAwaken,
		?CacheRoleFashion,
		?CacheRoleFashionSlot,
		?CacheRolePersonalityInfo,
		?CacheRolePlayerProp,
		?CacheRolePlayerClock
	]).

-endif.
