%% coding: latin-1
%%: 实现
-module(cfg_talentProp_chs).
-compile(export_all).
-include("cfg_talentProp.hrl").
-include("logger.hrl").

getRow(1)->
    #talentPropCfg {
    id = 1,
    name = "属性强化",
    icon = 4,
    target = 1,
    maxLevel = 200,
    paladin = [{1,5,0}],
    wizard = [{3,5,0}],
    assassin = [{2,5,0}],
    soulReaper = [{1,5,0}],
    mechanic = [{2,5,0}],
    newplayer_1 = [{1,5,0}],
    newplayer_2 = [{1,5,0}],
    txt = "角色的主属性得到提升，当前技能等级下主属性提升"
    };
getRow(2)->
    #talentPropCfg {
    id = 2,
    name = "物防强化",
    icon = 5,
    target = 1,
    maxLevel = 200,
    paladin = [{26,12.8,0}],
    wizard = [{26,12.8,0}],
    assassin = [{26,12.8,0}],
    soulReaper = [{26,12.8,0}],
    mechanic = [{26,12.8,0}],
    newplayer_1 = [{26,12.8,0}],
    newplayer_2 = [{26,12.8,0}],
    txt = "角色的物理防御能力得到提升，当前技能等级下物理防御提升"
    };
getRow(3)->
    #talentPropCfg {
    id = 3,
    name = "魔防强化",
    icon = 6,
    target = 1,
    maxLevel = 200,
    paladin = [{28,12.8,0}],
    wizard = [{28,12.8,0}],
    assassin = [{28,12.8,0}],
    soulReaper = [{28,12.8,0}],
    mechanic = [{28,12.8,0}],
    newplayer_1 = [{28,12.8,0}],
    newplayer_2 = [{28,12.8,0}],
    txt = "角色的魔法防御能力得到提升，当前技能等级下魔法防御提升"
    };
getRow(4)->
    #talentPropCfg {
    id = 4,
    name = "宠物伤害强化",
    icon = 7,
    target = 2,
    maxLevel = 200,
    paladin = [{30,6,0}],
    wizard = [{33,6,0}],
    assassin = [{31,6,0}],
    soulReaper = [{32,6,0}],
    mechanic = [{32,6,0}],
    newplayer_1 = [{32,6,0}],
    newplayer_2 = [{32,6,0}],
    txt = "宠物的伤害能力得到提升，当前技能等级下宠物伤害提升"
    };
getRow(5)->
    #talentPropCfg {
    id = 5,
    name = "宠物生命强化",
    icon = 8,
    target = 2,
    maxLevel = 200,
    paladin = [{18,180,0}],
    wizard = [{18,180,0}],
    assassin = [{18,180,0}],
    soulReaper = [{18,180,0}],
    mechanic = [{18,180,0}],
    newplayer_1 = [{18,180,0}],
    newplayer_2 = [{18,180,0}],
    txt = "宠物的生命值得到提升，当前技能等级下宠物生命值提升"
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

