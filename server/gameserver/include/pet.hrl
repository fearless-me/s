%%%BUFF相关定义
-author(luowei).
-ifndef(Pet_hrl).
-define(Pet_hrl,1).

%%技能镶嵌需要移除的宠物ID
-define(DelPetID1,                         50004). %%需要移除的宠物ID1
-define(DelPetID2,                         50005). %%需要移除的宠物ID2
-define(DelPetID3,                         50006). %%需要移除的宠物ID3
-define(DelPetID4,                         50007). %%需要移除的宠物ID4
-define(DelPetID5,                         50009). %%需要移除的宠物ID5
-define(DelPetID6,                         50010). %%需要移除的宠物ID6
-define(DelPetID7,                         50011). %%需要移除的宠物ID7
-define(DelPetID8,                         50012). %%需要移除的宠物ID8
-define(DelPetID9,                         50013). %%需要移除的宠物ID9

%%宠物类型
-define(CallPetTypeRMB,                    0).  %%人民币召唤宠物
-define(CallPetTypeSkill,                  1).  %%技能召唤宠物

-define(PetOnMount,				 0).   %%上坐骑
-define(PetOffMount,			 1).   %%下坐骑

-define(DoublePetGuest,          1).
-define(DoublePetOwner,          2).

-define(PetState_Idle,			         0).   %%宠物休息
-define(PetState_Assist,		         1).   %%宠物助战
-define(PetState_Battle_Show,			 2).   %%宠物出战-显示
-define(PetState_Battle_Hide,			 3).   %%宠物出战-隐藏
-define(PetState_Battle_Mount,			 4).   %%宠物出战-骑乘 (这个是服务器专用，用于登录时自动上坐骑)


-define(CommonSkillMaxIndex, 5).
-define(CostMaterialID,		201).

-define(UnLockNum0,			0).	  %%锁定技能数量0
-define(UnLockNum1,			1).	  %%锁定技能数量1
-define(UnLockNum2,			2).	  %%锁定技能数量2
-define(UnLockNum3,			3).	  %%锁定技能数量3

-define(PetQualityWhite,	0).   %%白色品质宠物
-define(PetQualityGreen,    1).   %%绿色品质宠物
-define(PetQualityBlue,     2).   %%蓝色品质宠物
-define(PetQualityPurple,   3).   %%紫色品质宠物
-define(PetQualityOrange,   4).   %%橙色品质宠物
-define(PetQualityRed, 		5).   %%红色品质宠物

-define(PetStar1,			1).   %%宠物一星
-define(PetStar2,			2).   %%宠物二星
-define(PetStar3,			3).   %%宠物三星
-define(PetStar4,			4).   %%宠物四星
-define(PetStar5,			5).   %%宠物五星
-define(PetStar6,			6).   %%宠物六星
-define(PetStar7,			7).   %%宠物七星
-define(PetStar8,			8).   %%宠物八星
-define(PetStar9,			9).   %%宠物九星
-define(PetStar10,			10).   %%宠物十星

-define(PetRaw0,			0).   %%宠物转生
-define(PetRaw1,			1).   %%宠物转生一
-define(PetRaw2,			2).   %%宠物转生二
-define(PetRaw3,			3).   %%宠物转生三
-define(PetRaw4,			4).   %%宠物转生四
-define(PetRaw5,			5).   %%宠物转生五
-define(PetRaw6,			6).   %%宠物转生六
-define(PetRaw7,			7).   %%宠物转生七
-define(PetRaw8,			8).   %%宠物转生八
-define(PetRaw9,			9).   %%宠物转生九
-define(PetRaw10,			10).   %%宠物转生十


-define(PetSkillQualityGreen,    0).   %%绿色品质宠物技能
-define(PetSkillQualityBlue,     1).   %%蓝色品质宠物技能
-define(PetSkillQualityPurple,   2).   %%紫色品质宠物技能
-define(PetSkillQualityOrange,   3).   %%橙色品质宠物技能
-define(PetSkillQualityRed, 	 4).   %%红色品质宠物技能

-define(PetSkillTypeTalent,		 0).   %%天赋技能
-define(PetSkillTypeCommon,		 1).   %%通用技能
-define(PetSkillTypeBase,		 2).   %%基础技能

-define(PetSkillUnLock,		 	 0).   %%技能未解锁
-define(PetSkillLock,		 	 1).   %%技能解锁


-define(PetBattleCDTime,		 10 * 1000). %%宠物出战冷却时间
-define(PetEquipUpLv,			 20).  %%宠物自动进阶等级

%% 召唤宠物信息
-record(recCallPet,{
			pet_id,					%%宠物ID
			pet_pid,				%%宠物PID
			pet_code,				%%宠物Code
			pet_type				%%宠物类型 1:人民币宠物2:技能宠物 
		}).

%% 宠物技能信息
-record(recPetSkill,{
			skill_index = 0,		%%  宠物技能的下标
			skill_id = 0,			%%  宠物技能ID
			skill_cd = 0,			%%  宠物技能CD
			skill_type = 0,			%%  0:天赋技能 1：通用技能 2:基础技能
			skill_level = 0, 		%%  宠物技能等级
			skill_is_unlock = 0		%%  0:未解锁 1:解锁
		}).

%% 宠物信息
-record(recPetInfo,{
			pet_time = 0,			%%  限时
			pet_id = 0,				%%  宠物ID
			pet_star = 0,			%%  宠物星阶
			pet_name = "",			%%  宠物名字
			pet_status = 0,			%%  0:休息  1:出战
			pet_force = 0,			%% 	宠物战力，当前宠物的战斗力
			pet_raw = 0,			%%	宠物转生
			pet_attas = []			%%	宠物属性提升列表
		}).

%% 宠物装备
-record(recPetEquip,{
			equip_id = 0,			%% 装备ID
			equip_lv = 0,			%% 装备强化
			equip_pos = 0			%%  装备位置
		}).

%% 宠物技能洗练
-record(recPetSkillCast,{
		skill_new_id = 0,			%%洗练前技能
		skill_old_id = 0,			%%洗练后技能
		skill_level = 0				%%洗练等级
		}).

%% 宠物召唤
-record(recSpawnPet,{
    caster_code,			%% 宠物主人Code
    caster_id,				%% 宠物主人Id
    caster_pid,				%% 宠物主人Pid
    caster_name,			%% 宠物主人名字
    caster_type,			%% 宠物主人类型
    caster_pkmode,			%% 宠物主人PkMode
    pet_name,				%% 宠物名字
    pet_status,				%% 宠物状态
    pet_mapid,				%% 宠物所在地图ID
    pet_mapPid,				%% 宠物所在地图Pid
    pet_props,				%% 宠物战斗属性
    pet_level,				%% 宠物等级
    pet_id,					%% 宠物ID
    pet_x,					%% 宠物主人X坐标
    pet_y,					%% 宠物主人Y坐标
    pet_camp,				%% 宠物阵营
    pet_skills,				%% 宠物技能列表
    pet_guildID,			%% 宠物所属于公会
    pet_groupID,			%% 宠物所属于分组
    pet_teamID,				%% 宠物主人战队ID
    pet_playerEts,			%% 宠物所在地图的人物表
    pet_monsterEts,			%% 宠物所在地图的怪物表
    pet_petEts,				%% 宠物所在地图的宠物表
    pet_other = []			%% 宠物扩展信息[CallTime,Type] CallTime宠物召唤时间0,永远召唤 Type 1:人民币宠2:技能宠物
}).

-record(recDoublePetMount,{
	petID = 0,
	petCode = 0,
	ownerCode = 0,
	ownerRoleID = 0,
	guestCode = 0,
	guestRoleID = 0
}).

-record(recPetAssistInfo,{
	slot = 0,
	petID = 0
}).

-endif.