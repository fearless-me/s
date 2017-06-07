-ifndef(worldBoss_hrl).
-define(worldBoss_hrl,1).

-define(WorldBossWarIng,worldBossWarIng).%%是否开启中
-define(WorldBossNeedMinLevel,30).%%玩家最低等级
-define(WorldBossTurnOff,false).%%全局变量
-define(WorldBossTurnOn,true).%%全局变量

-define(WorldBossMapID,22).%%boss战专用mapid
-define(WorldBossGSDamageRankFrequence,1000*9).%%汇报伤害的频率（秒）
-define(WorldBossGSDamageRankLimit,20).%%gs给CS节点汇总的伤害排行榜人数
%%========boss战位面分配表
-define(ParallelUniversePlayerMaxNum, 10).%%每个位面的玩家数上限
-define(NoneGroupID,0).%%位面没有设置groupID
-define(LastRequestParallelUniverseWaitingMillisecond,1000*2).%%等待2秒

%%===================
-record(playerBossTickTime,{
							noticeTick = 0::integer()
							}).

%%cs与gs上排名后的结构
-record(recPlayerDamageEts,{
							gsPid,%%换gs线后，可累计							
							playerID::integer(),
							roleName::string(),
							damage::float()
						   }).
-endif.