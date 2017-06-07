%%: 声明
-ifndef(cfg_needForSpeedRandomAward).
-define(cfg_needForSpeedRandomAward, 1).

-record(needForSpeedRandomAwardCfg, {
        %%: 作者:
        %%: 1~10名次奖励
        %%: 11离线或未取得名次
        id,

        %%: 作者
        %%: 区间，个数，道具id，是否绑定
        reward

 }).

-endif.