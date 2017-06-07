// 支持以下几种数据类型：
// int,list,term,ets,pid,bool.

// 怪物进程字典
struct MonsterPsDict
{
    int absorb,                             // 吸收盾
    int actionStatus,                       // 行为状态
    int afterCast,
    int attackIntervalTime,                 //
    int attackSN,
    int attackTargetCode,
    list battleProp,
    int bossSelSkillTime,
    list buffList,
    int callCarrier,
    int callMonster,
    int camp,
    int carrierAttackList,
    int casterInfo,
    int curHp,
    int curMp,
    int curSelSkill,
    int curUseSkill,
    int curUseSkillEffect,
    int exSkillAttackTargetCode,
    int faceDir,
    int facePos,
    int firstAttackerCode,
    int globalCDEndTime,
    int groupID,
    int guildID,
    int hate,
    int hitRestoreHp,
    int id,
    bool isMapSleep,
    int level,
    int mapID,
    pid mapPid,
    ets mapPlayerEts,
    int monsterAliveTime,
    ets monsterEts,
    int moveOverDist,
    int moveStatus,
    term moveTargetPos,
    int moveType,
    list name,
    list ownSkill,
    ets petEts,
    term pos,
    int skillCD,
    term spawnInfo,
    int startUseSkillTime,
    int status,
    int teamID,
    int timerSelTargetTime,
    int triskill,
    int type
};

