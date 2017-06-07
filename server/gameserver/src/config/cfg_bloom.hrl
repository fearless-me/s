%%: 声明
-ifndef(cfg_bloom).
-define(cfg_bloom, 1).

-record(bloomCfg, {
        id,

        content,

        name,

        down_sample,

        blur_inter,

        blursize,

        threshhold,

        intensity,

        down_sample2,

        blur_inter2,

        blursize2,

        threshhold2,

        intensity2,

        %%: Light_Prode_Sampler_Day_RGB
        lPS_Day_R,

        %%: Light_Prode_Sampler_Day_RGB
        lPS_Day_G,

        %%: Light_Prode_Sampler_Day_RGB
        lPS_Day_B,

        %%: Light_Prode_Sampler_Night_RGB
        lPS_Night_R,

        %%: Light_Prode_Sampler_Night_RGB
        lPS_Night_G,

        %%: Light_Prode_Sampler_Night_RGB
        lPS_Night_B

 }).

-endif.