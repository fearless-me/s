%%%BUFF相关定义
-author(luowei).
-ifndef(Buff_hrl).
-define(Buff_hrl, 1).


%%特殊buffID
-define(PkBuff, 28). %%Pk保护buff
-define(KillBuff, 91). %%杀戮红名buff
-define(EnergyBuff, 100). %%魔女能量值恢复buff
-define(SpecBuff1, 10). %%镶嵌技能需移除特殊buff1
-define(SpecBuff2, 12). %%镶嵌技能需移除特殊buff2
-define(SpecBuff3, 92). %%镶嵌技能需移除特殊buff3
-define(SpecBuff4, 149). %%切磋结束后增加保护buff
-define(AbsorbBuff1, 4). %%希望圣令主动吸收盾buff
-define(AbsorbBuff2, 9). %%法术结界吸收盾buff
-define(AbsorbBuff3, 38).%%守护之力buff
-define(AbsorbBuff4, 98).%%M吸收盾buff
-define(HoldPlayerBuff, 222).%%定身buff，切场景，下线均删除，其余永久有效
-define(OUTOFCONTROL, 130). %%玩家不受控制BUFF
-define(PLAYERBLUR, 131). %%玩家虚化
-define(RedNameBuff, 243). %%野外boss红名buff
-define(WoldBossInspire, 60008). %%首领入侵鼓舞BUFF
%%施法者类型
-define(SAMECASTER, 0). %%相同施法者
-define(DIFFCASTER, 1). %%不同施法者

%%buff操作
-define(OPERATEADD, 0). %%增加buff
-define(OPERATEREMOVE, 1). %%移除buff
-define(OPERATEREPLACE, 2). %%替换buff

%%buff类型
-define(BuffTypeAdd, 0). %%增益buff
-define(BuffTypeSub, 1). %%减益buff
-define(BuffTypeAll, 2). %%所有Buff


%%豁免检定
-define(BuffCheckDefault, 0).   %%无检定
-define(BuffCheckTough, 1).   %%强韧检定
-define(BuffCheckIntent, 2).   %%意志检定
-define(BuffCheckReflect, 3).   %%反射检定

%%BUFF保存
-define(UnStore, 0).   %%下线不保存
-define(StoreUnTime, 1).   %%下线保存不计时
-define(StoreTime, 2).   %%下线保存计时

%%技能效果
-define(ADDBUFF, 1).   %%增加buff
-define(REMOVEBUFFSTATE, 2).   %%移除指定buff
-define(RANDOMREMOVEBUFF, 3).   %%移除随机buff
-define(CALLMONSTER, 4).   %%召唤怪物
-define(TELEPORTSPRINT, 5).   %%瞬移冲刺
-define(STRONGENMITY, 6).   %%强拉仇恨
-define(GRABTARGET, 7).   %%抓取目标
-define(CALLPET, 8).   %%施法者召唤宠物
-define(TRIGGERSKILL, 9).   %%施法者触发瞬移技能
-define(HURTRETRUNBLOOD, 10).  %%施法者以技能伤害比例回血
-define(ENERGYVALUE, 11).  %%获得能量值
-define(CURRECTNOWHP, 12).  %%修正当前生命值
-define(CURRECTNOWMP, 13).  %%修正当前魔法值
-define(CARRIERSKILL, 14).  %%载体技能
-define(BEATBACK, 15).  %%击退
-define(REDUCECD, 16).  %%减少CD
-define(REMOVEBUFF, 17).  %%移除指定buff
-define(COURAGEVALUE, 18).  %%获得怒气值
-define(CONTROLEFFECT, 19).  %%特殊效果概率

%%buff效果类型
-define(DEFAULT, 0).  %%无特殊效果
-define(INVINCIBLE, 1).  %%无敌
-define(SLEEP, 2).  %%睡眠
-define(FREEZE, 3).  %%冻结
-define(RESHAPE, 4).  %%形变
-define(SLIENCE, 5).  %%沉默
-define(DISARM, 6).  %%缴械
-define(SLOWDOWN, 7).  %%减速
-define(PKPROTECT, 8).  %%PK保护
-define(GETTRISKILL, 9).  %%获得触发技能
-define(PROPCONVERT, 10). %%属性转换
-define(RedName, 11). %%红名
-define(CONVERT, 12). %%buff转换
-define(MODIFYHP, 13). %%修改生命值
-define(MODIFYMP, 14). %%修改魔法值
-define(BLUR, 15). %%虚化
-define(HURTABSORB, 16). %%伤害吸收
-define(SHAPESHIFTE, 17). %%变身
-define(SHAPESKILL, 18). %%变身获取技能
-define(MODIFYENERGY, 19). %%修改能量值
-define(IMMUNE, 20). %%免疫
-define(IMMUNEEFFECT, 21). %%免疫效果
-define(NOCONTROL, 22). %%抓取击退不受控制技能
-define(CALLSKILL, 23). %%调用技能
-define(FIXEDBODY, 24). %%定身
-define(RIDICULE, 25). %%嘲讽
-define(EXPLODE, 26). %%爆炸

%%免疫列表
-define(ImmumeList, [?SLEEP, ?FREEZE, ?RESHAPE, ?SLIENCE,
	?DISARM, ?SLOWDOWN, ?FIXEDBODY]).


%%伤害类型
-define(PROBALITY_WEIGHT, 10000).   %%触发概率
-define(Buff_MAX_COUNTER, 100000000).    %%buff中最大计数器
-define(Buff_DELAY_TIME, 100).           %%延迟时间

-define(BuffRemove_Dead, 1).  %%死亡移除buff
-define(BuffRemove_OutSence, 1).   %%夸场景移除buff


-record(recBuff, {
	buffID,                        %%BUFF ID
	casterCode,                %%施法者的Code
	casterType,                %%施法者的类型
	casterName,                %%施法者名称
	casterPid,                 %%施法者的Pid
	casterLevel,                 %%施法者的Pid
	casterSerial,                %%施法者序列号
	skillID,                   %%施法者使用技能
	damagePlus,				 %%当前等级下的技能加法值
	damageMultiply,			 %%当前等级下的技能乘法值
	casterPropList,
	kMagicFactor = 0.0,
	kPhysicalFactor = 0.0,
	criticalDamageFactor = 0.0,
	layer,                        %%BUFF的层次
	damage,                    %%单层BUFF伤害
	propList,                  %%属性伤害列表
	level,                        %%等级
	type,                      %%buff类型
	remove,                    %%buff可否被移除
	effect,                    %%buff特定状态
	counter,                   %%buff计数器值
	count,                     %%buff次序次数
	multiBuffOneCaster,        %%不同buff相同施法者
	multiBuffMultiCaster,      %%不同buff不同施法者
	endTime,                    %%结束时间
	triggerTime                %%下次触发时间
}).


-record(recBuffInfo, {
	skillID,                   %%攻击者技能ID
	casterSerial,               %%施法者序列号
	damagePlus,				 %%当前等级下的技能加法值
	damageMultiply,			 %%当前等级下的技能乘法值
	attackerLevel,             %%攻击者等级
	buffID,                    %%BUFF ID
	layer = 1,                        %%BUFF的层次
	level,                     %%BUFF等级
	endTime,                   %%BUFF结束时间
	attackerType,              %%攻击者类型
	attackerCode,               %%施法者的Code
	attackerPid,                 %%施法者进程ID
	attackerName,                %%施法者名称
	attackPropList,
	kMagicFactor = 0.0,
	kPhysicalFactor = 0.0,
	criticalDamageFactor = 0.0
}).
-endif.