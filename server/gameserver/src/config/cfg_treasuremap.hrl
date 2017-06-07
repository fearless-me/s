%%: 声明
-ifndef(cfg_treasuremap).
-define(cfg_treasuremap, 1).

-record(treasuremapCfg, {
        id,

        %%: {地图id,x,y}
        pos,

        %%: 范围
        range,

        %%: 事件：
        %%: {事件id,权重}
        event

 }).

-endif.