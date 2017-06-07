-include("gsInc.hrl").
-include("cfg_lotteryForTower.hrl").


%%%%奖励池里面的数据 cfg_list=[#lotteryForTowerCfg{}],notice_list=[#lottery_for_tower_notice{}]
-record(lottery_for_tower_info,{start_time=0,end_time=0, cfg_list =[],notice_list=[], last_reset_date =calendar:local_time()}).
%%
-record(lottery_for_tower_notice,{role_name,item_id,item_number}).
%%金宝塔奖池个数
-define(AwardPoolNumber,21).

%宝金塔当前层级获胜，向上升一级
-define(WIN,1).
%宝金塔当前层级失败向下降一级
-define(FAIL,-1).
%%最小奖池ID
-define(MIN_POOL_ID,1).
%%最大奖池ID
-define(MAX_POOL_ID,6).
%%无次数限制奖品
-define(AWARD_TIMES_PERDAY_NO_LIMIT,-1).