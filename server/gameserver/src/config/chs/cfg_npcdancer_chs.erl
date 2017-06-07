%% coding: latin-1
%%: 实现
-module(cfg_npcdancer_chs).
-compile(export_all).
-include("cfg_npcdancer.hrl").
-include("logger.hrl").

getRow(1)->
    #npcdancerCfg {
    id = 1,
    type = 1,
    dialogue = "!${A}everybody，一起来，跟着我们的节奏，起！来！嗨！！${B}everybody，一起来，跟着我们的节奏，起！来！嗨！！${C}everybody，一起来，跟着我们的节奏，起！来！嗨！！${D}everybody，一起来，跟着我们的节奏，起！来！嗨！！${E}everybody，一起来，跟着我们的节奏，起！来！嗨！！${F}everybody，一起来，跟着我们的节奏，起！来！嗨！！"
    };
getRow(2)->
    #npcdancerCfg {
    id = 2,
    type = 1,
    dialogue = "${A}后面的朋友，让我看到你们的双手✌三✌(\'ω\')✌三✌"
    };
getRow(3)->
    #npcdancerCfg {
    id = 3,
    type = 2,
    dialogue = "${A}不如跳舞(＾＾)ｂ${B}聊天倒不如跳舞(^^)ｂ${C}让自己觉得舒服d(-_^)${D}是每个人的天赋d(⌒ー⌒)${E}啪啪啪(o^-\')b${F}啪啪啪╭( ･ㅂ･)و"
    };
getRow(4)->
    #npcdancerCfg {
    id = 4,
    type = 2,
    dialogue = "${A}继续跳舞(＾＾)ｂ${B}谈恋爱不如跳舞(^^)ｂ${C}用这种方式相处d(-_^)${D}没有人觉得孤独d(⌒ー⌒)${E}咚咚咚(o^-\')b${F}咚咚咚╭( ･ㅂ･)و"
    };
getRow(5)->
    #npcdancerCfg {
    id = 5,
    type = 2,
    dialogue = "${A}<1>${B}<1>${C}<1>${D}<1>${E}<1>${F}<1>"
    };
getRow(6)->
    #npcdancerCfg {
    id = 6,
    type = 3,
    dialogue = "!${A}<6>${B}<6>${C}<6>${D}<6>"
    };
getRow(7)->
    #npcdancerCfg {
    id = 7,
    type = 3,
    dialogue = "!${A}<6>${B}<6>${C}<6>"
    };
getRow(8)->
    #npcdancerCfg {
    id = 8,
    type = 3,
    dialogue = "!${A}<6>${B}<6>"
    };
getRow(9)->
    #npcdancerCfg {
    id = 9,
    type = 3,
    dialogue = "!${A}<6>"
    };
getRow(10)->
    #npcdancerCfg {
    id = 10,
    type = 4,
    dialogue = "${A}A：我非常喜欢C${B}B：没有人喜欢我${C}C：我不喜欢B${D}D：C说的是真话${E}E：他们4个人中只有1个人说了真话${F}F：事实究竟是什么样的呢？？"
    };
getRow(11)->
    #npcdancerCfg {
    id = 11,
    type = 4,
    dialogue = "${A}悄悄的告诉你们：A和B是情侣♡´･ᴗ･`♡"
    };
getRow(12)->
    #npcdancerCfg {
    id = 12,
    type = 4,
    dialogue = "${A}悄悄的告诉你们：C喜欢B♡´･ᴗ･`♡"
    };
getRow(13)->
    #npcdancerCfg {
    id = 13,
    type = 4,
    dialogue = "${A}悄悄的告诉你们：假的，都是假的♡´･ᴗ･`♡"
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {8},
    {9},
    {10},
    {11},
    {12},
    {13}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13
    ].

