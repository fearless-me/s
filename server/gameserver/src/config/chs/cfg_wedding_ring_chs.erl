%% coding: latin-1
%%: 实现
-module(cfg_wedding_ring_chs).
-compile(export_all).
-include("cfg_wedding_ring.hrl").
-include("logger.hrl").

getRow(1)->
    #wedding_ringCfg {
    ring_level = 1,
    exp = 0,
    icon = 615,
    vfx = "buff/ef_marry1",
    ring_buff = 8100,
    extra_exp = 10,
    ring_buff_explain = "伤害+3%,生命上限+3%,暴击伤害+4%",
    extra_exp_explain = "组队任务获得1%经验加成"
    };
getRow(2)->
    #wedding_ringCfg {
    ring_level = 2,
    exp = 300,
    icon = 616,
    vfx = "buff/ef_marry3",
    ring_buff = 8101,
    extra_exp = 20,
    ring_buff_explain = "伤害+5%,生命上限+5%,暴击伤害+6%",
    extra_exp_explain = "组队任务获得2%经验加成"
    };
getRow(3)->
    #wedding_ringCfg {
    ring_level = 3,
    exp = 900,
    icon = 617,
    vfx = "buff/ef_marry2",
    ring_buff = 8102,
    extra_exp = 30,
    ring_buff_explain = "伤害+7%,生命上限+7%,暴击伤害+8%",
    extra_exp_explain = "组队任务获得3%经验加成"
    };
getRow(4)->
    #wedding_ringCfg {
    ring_level = 4,
    exp = 5000,
    icon = 618,
    vfx = "buff/ef_marry4",
    ring_buff = 8103,
    extra_exp = 40,
    ring_buff_explain = "伤害+10%,生命上限+10%,暴击伤害+10%",
    extra_exp_explain = "组队任务获得4%经验加成"
    };
getRow(5)->
    #wedding_ringCfg {
    ring_level = 5,
    exp = 10000,
    icon = 619,
    vfx = "buff/ef_marry5",
    ring_buff = 8104,
    extra_exp = 50,
    ring_buff_explain = "伤害+15%,生命上限+15%,暴击伤害+12%",
    extra_exp_explain = "组队任务获得5%经验加成"
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5
    ].

