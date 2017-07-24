%% coding: latin-1
%%: 实现
-module(cfg_pet_skills_upgrading_chs).
-compile(export_all).
-include("cfg_pet_skills_upgrading.hrl").
-include("logger.hrl").

getRow(1601,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1601,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "啊解锁"
    };
getRow(1601,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1601,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3001],
    star_limit = 3,
    reborn_limit = 0,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1602,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1602,
    level = 1,
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1602,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1602,
    level = 2,
    item_cost = [1912,1],
    coin_cost = [100,3003],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1603,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1603,
    level = 1,
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1603,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1603,
    level = 2,
    item_cost = [1913,1],
    coin_cost = [100,3005],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1604,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1604,
    level = 1,
    item_cost = [1921,1],
    coin_cost = [100,3006],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1604,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1604,
    level = 2,
    item_cost = [1921,2],
    coin_cost = [100,3007],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1605,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1605,
    level = 1,
    coin_cost = [100,3008],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1605,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1605,
    level = 2,
    coin_cost = [100,3009],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1606,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1606,
    level = 1,
    coin_cost = [100,3010],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1606,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1606,
    level = 2,
    coin_cost = [100,3011],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1607,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1607,
    level = 1,
    coin_cost = [100,3012],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1607,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1607,
    level = 2,
    coin_cost = [100,3013],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1608,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1608,
    level = 1,
    coin_cost = [100,3014],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1608,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1608,
    level = 2,
    coin_cost = [100,3015],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1609,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1609,
    level = 1,
    coin_cost = [100,3016],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1609,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1609,
    level = 2,
    coin_cost = [100,3017],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1610,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1610,
    level = 1,
    coin_cost = [100,3018],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1610,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1610,
    level = 2,
    coin_cost = [100,3019],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1611,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1611,
    level = 1,
    coin_cost = [100,3020],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1611,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1611,
    level = 2,
    coin_cost = [100,3021],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1612,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1612,
    level = 1,
    coin_cost = [100,3022],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1612,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1612,
    level = 2,
    coin_cost = [100,3023],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1613,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1613,
    level = 1,
    coin_cost = [100,3024],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1613,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1613,
    level = 2,
    coin_cost = [100,3025],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1614,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1614,
    level = 1,
    coin_cost = [100,3026],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1614,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1614,
    level = 2,
    coin_cost = [100,3027],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1615,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1615,
    level = 1,
    coin_cost = [100,3028],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1615,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1615,
    level = 2,
    coin_cost = [100,3029],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1616,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1616,
    level = 1,
    coin_cost = [100,3030],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1616,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1616,
    level = 2,
    coin_cost = [100,3031],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1617,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1617,
    level = 1,
    coin_cost = [100,3032],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1617,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1617,
    level = 2,
    coin_cost = [100,3033],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1618,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1618,
    level = 1,
    coin_cost = [100,3034],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1618,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1618,
    level = 2,
    coin_cost = [100,3035],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1619,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1619,
    level = 1,
    coin_cost = [100,3036],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1619,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1619,
    level = 2,
    coin_cost = [100,3037],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1620,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1620,
    level = 1,
    coin_cost = [100,3038],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1620,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1620,
    level = 2,
    coin_cost = [100,3039],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1621,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1621,
    level = 1,
    coin_cost = [100,3040],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1621,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1621,
    level = 2,
    coin_cost = [100,3041],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1622,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1622,
    level = 1,
    coin_cost = [100,3042],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1622,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1622,
    level = 2,
    coin_cost = [100,3043],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1623,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1623,
    level = 1,
    coin_cost = [100,3044],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1623,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1623,
    level = 2,
    coin_cost = [100,3045],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1624,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1624,
    level = 1,
    coin_cost = [100,3046],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1624,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1624,
    level = 2,
    coin_cost = [100,3047],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1625,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1625,
    level = 1,
    coin_cost = [100,3048],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1625,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1625,
    level = 2,
    coin_cost = [100,3049],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1626,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1626,
    level = 1,
    coin_cost = [100,3050],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1626,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1626,
    level = 2,
    coin_cost = [100,3051],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1627,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1627,
    level = 1,
    coin_cost = [100,3052],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1627,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1627,
    level = 2,
    coin_cost = [100,3053],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1628,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1628,
    level = 1,
    coin_cost = [100,3054],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1628,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1628,
    level = 2,
    coin_cost = [100,3055],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1629,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1629,
    level = 1,
    coin_cost = [100,3056],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1629,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1629,
    level = 2,
    coin_cost = [100,3057],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1630,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1630,
    level = 1,
    coin_cost = [100,3058],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1630,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1630,
    level = 2,
    coin_cost = [100,3059],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1631,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1631,
    level = 1,
    coin_cost = [100,3060],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1631,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1631,
    level = 2,
    coin_cost = [100,3061],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1632,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1632,
    level = 1,
    coin_cost = [100,3062],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1632,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1632,
    level = 2,
    coin_cost = [100,3063],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1633,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1633,
    level = 1,
    coin_cost = [100,3064],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1633,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1633,
    level = 2,
    coin_cost = [100,3065],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1634,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1634,
    level = 1,
    coin_cost = [100,3066],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1634,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1634,
    level = 2,
    coin_cost = [100,3067],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(1635,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1635,
    level = 1,
    coin_cost = [100,3068],
    star_limit = 2,
    reborn_limit = 1,
    level_limit = 10,
    des = "啊解锁"
    };
getRow(1635,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1635,
    level = 2,
    coin_cost = [100,3069],
    star_limit = 3,
    reborn_limit = 2,
    level_limit = 20,
    des = "嗯升级"
    };
getRow(40000,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成XXX伤害"
    };
getRow(40000,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 6,
    reborn_limit = 0,
    level_limit = 20,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成BBB伤害"
    };
getRow(40000,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 11,
    reborn_limit = 0,
    level_limit = 30,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成CCC伤害"
    };
getRow(40001,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成XXX伤害"
    };
getRow(40001,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 6,
    reborn_limit = 0,
    level_limit = 20,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成BBB伤害"
    };
getRow(40001,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 11,
    reborn_limit = 0,
    level_limit = 30,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成CCC伤害"
    };
getRow(40002,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成XXX伤害"
    };
getRow(40002,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成BBB伤害"
    };
getRow(40002,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成CCC伤害"
    };
getRow(40010,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成AAA伤害"
    };
getRow(40010,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 6,
    reborn_limit = 0,
    level_limit = 20,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成BBB伤害"
    };
getRow(40010,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 11,
    reborn_limit = 0,
    level_limit = 30,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成CCC伤害"
    };
getRow(40011,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成AAA伤害且迷晕"
    };
getRow(40011,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 6,
    reborn_limit = 0,
    level_limit = 20,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成BBB伤害且迷晕"
    };
getRow(40011,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 11,
    reborn_limit = 0,
    level_limit = 30,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成CCC伤害且迷晕"
    };
getRow(40012,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成AAA伤害，且迷晕"
    };
getRow(40012,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成BBB伤害，且迷晕"
    };
getRow(40012,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成CCC伤害，且迷晕"
    };
getRow(40020,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成AAA攻击"
    };
getRow(40020,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 6,
    reborn_limit = 0,
    level_limit = 20,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成BBB攻击"
    };
getRow(40020,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 11,
    reborn_limit = 0,
    level_limit = 30,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成CCC攻击"
    };
getRow(40021,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40021,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。每次收到伤害，将提升杀象特的暴击等级5%，最高可叠加10层"
    };
getRow(40021,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40021,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 6,
    reborn_limit = 0,
    level_limit = 20,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。每次收到伤害，将提升杀象特的暴击等级7%，最高可叠加10层"
    };
getRow(40021,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40021,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 11,
    reborn_limit = 0,
    level_limit = 30,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。每次收到伤害，将提升杀象特的暴击等级10%，最高可叠加10层"
    };
getRow(40022,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杀象特召出自己的爱子对敌人发动共同攻击。"
    };
getRow(40022,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "杀象特召出自己的爱子对敌人发动共同攻击。爱子有50%的概率吸引敌方火力"
    };
getRow(40022,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "杀象特召出自己的爱子对敌人发动共同攻击。爱子有100%的概率吸引敌方火力"
    };
getRow(40030,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "机械鸟对前方少数目标进行攻击，造成AAA伤害"
    };
getRow(40030,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "机械鸟对前方少数目标进行攻击，造成BBB伤害"
    };
getRow(40030,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "机械鸟对前方少数目标进行攻击，造成CCC伤害"
    };
getRow(40031,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其攻击力提升AAA防御力提升BBB"
    };
getRow(40031,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其攻击力提升AAA防御力提升BBB"
    };
getRow(40031,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其攻击力提升AAA防御力提升BBB"
    };
getRow(40032,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40032,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "当机械鸟生命值低于30%时将击退周围所有敌方，并进行自身回血"
    };
getRow(40032,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40032,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "当机械鸟生命值低于30%时将击退周围所有敌方，并进行自身回血"
    };
getRow(40032,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40032,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "当机械鸟生命值低于30%时将击退周围所有敌方，并进行自身回血"
    };
getRow(40040,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成AAA伤害"
    };
getRow(40040,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成AAA伤害"
    };
getRow(40040,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成AAA伤害"
    };
getRow(40041,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围30米敌人的眼光吸引过来"
    };
getRow(40041,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围31米敌人的眼光吸引过来"
    };
getRow(40041,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围32米敌人的眼光吸引过来"
    };
getRow(40042,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40042,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "“暂停营业啦！”西瓜鲨的血量低于50%时，给自己一个伤害吸收盾。吸收AAA伤害"
    };
getRow(40042,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40042,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "“暂停营业啦！”西瓜鲨的血量低于51%时，给自己一个伤害吸收盾。吸收AAA伤害"
    };
getRow(40042,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40042,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "“暂停营业啦！”西瓜鲨的血量低于52%时，给自己一个伤害吸收盾。吸收AAA伤害"
    };
getRow(40050,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，共造成AAA伤害"
    };
getRow(40050,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，共造成AAA伤害"
    };
getRow(40050,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，共造成AAA伤害"
    };
getRow(40051,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40051,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "每进行一次攻击，有XX几率触发杀戮意志，造成AAA伤害并使得攻击力提升BBB"
    };
getRow(40051,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40051,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "每进行一次攻击，有XX几率触发杀戮意志，造成AAA伤害并使得攻击力提升BBB"
    };
getRow(40051,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40051,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "每进行一次攻击，有XX几率触发杀戮意志，造成AAA伤害并使得攻击力提升BBB"
    };
getRow(40052,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40052,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "每次释放杀戮意志有AAA几率使得目标防御降低，可叠加"
    };
getRow(40052,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40052,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "每次释放杀戮意志有AAA几率使得目标防御降低，可叠加"
    };
getRow(40052,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40052,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "每次释放杀戮意志有AAA几率使得目标防御降低，可叠加"
    };
getRow(40060,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方单个敌人进行两次攻击，造成AAA伤害"
    };
getRow(40060,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "对前方单个敌人进行两次攻击，造成AAA伤害"
    };
getRow(40060,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "对前方单个敌人进行两次攻击，造成AAA伤害"
    };
getRow(40061,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "主人与自身每秒回血BBB，共持续AA秒"
    };
getRow(40061,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "主人与自身每秒回血BBB，共持续AA秒"
    };
getRow(40061,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "主人与自身每秒回血BBB，共持续AA秒"
    };
getRow(40062,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40062,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "主人防御力提升BBB，持续AAA秒"
    };
getRow(40062,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40062,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "主人防御力提升BBB，持续AAA秒"
    };
getRow(40062,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40062,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "主人防御力提升BBB，持续AAA秒"
    };
getRow(40070,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方单个敌人采用低音符攻击，造成AAA伤害"
    };
getRow(40070,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "对前方单个敌人采用低音符攻击，造成AAA伤害"
    };
getRow(40070,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "对前方单个敌人采用低音符攻击，造成AAA伤害"
    };
getRow(40071,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "弹奏镇魂曲，对周围28米敌人进行镇压攻击，造成AAA伤害并降低对方的防御BBB"
    };
getRow(40071,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "弹奏镇魂曲，对周围29米敌人进行镇压攻击，造成AAA伤害并降低对方的防御BBB"
    };
getRow(40071,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "弹奏镇魂曲，对周围30米敌人进行镇压攻击，造成AAA伤害并降低对方的防御BBB"
    };
getRow(40072,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "弹奏迷魂曲，对周围30米敌人进行迷惑攻击，造成AAA伤害并降低对方的闪避BBB"
    };
getRow(40072,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "弹奏迷魂曲，对周围31米敌人进行迷惑攻击，造成AAA伤害并降低对方的闪避BBB"
    };
getRow(40072,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "弹奏迷魂曲，对周围32米敌人进行迷惑攻击，造成AAA伤害并降低对方的闪避BBB"
    };
getRow(40080,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40080,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对敌方单体造成AAA伤害"
    };
getRow(40080,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40080,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "对敌方单体造成AAA伤害"
    };
getRow(40080,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40080,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "对敌方单体造成AAA伤害"
    };
getRow(40081,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40081,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "寒冰踏焰进行快速的跑动，冰冻范围内所有目标，并使目标受到每秒AAA的持续伤害"
    };
getRow(40081,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40081,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "寒冰踏焰进行快速的跑动，冰冻范围内所有目标，并使目标受到每秒AAA的持续伤害"
    };
getRow(40081,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40081,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "寒冰踏焰进行快速的跑动，冰冻范围内所有目标，并使目标受到每秒AAA的持续伤害"
    };
getRow(40082,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40082,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "寒冰踏焰的嘶鸣将有AAA几率对目标造成冰冻效果"
    };
getRow(40082,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40082,
    level = 2,
    item_cost = [1911,1],
    coin_cost = [100,3000],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 20,
    des = "寒冰踏焰的嘶鸣将有AAA几率对目标造成冰冻效果"
    };
getRow(40082,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40082,
    level = 3,
    item_cost = [1911,10],
    coin_cost = [100,6000],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 30,
    des = "寒冰踏焰的嘶鸣将有AAA几率对目标造成冰冻效果"
    };
getRow(_,_)->[].

getKeyList()->[
    {1601,1},
    {1601,2},
    {1602,1},
    {1602,2},
    {1603,1},
    {1603,2},
    {1604,1},
    {1604,2},
    {1605,1},
    {1605,2},
    {1606,1},
    {1606,2},
    {1607,1},
    {1607,2},
    {1608,1},
    {1608,2},
    {1609,1},
    {1609,2},
    {1610,1},
    {1610,2},
    {1611,1},
    {1611,2},
    {1612,1},
    {1612,2},
    {1613,1},
    {1613,2},
    {1614,1},
    {1614,2},
    {1615,1},
    {1615,2},
    {1616,1},
    {1616,2},
    {1617,1},
    {1617,2},
    {1618,1},
    {1618,2},
    {1619,1},
    {1619,2},
    {1620,1},
    {1620,2},
    {1621,1},
    {1621,2},
    {1622,1},
    {1622,2},
    {1623,1},
    {1623,2},
    {1624,1},
    {1624,2},
    {1625,1},
    {1625,2},
    {1626,1},
    {1626,2},
    {1627,1},
    {1627,2},
    {1628,1},
    {1628,2},
    {1629,1},
    {1629,2},
    {1630,1},
    {1630,2},
    {1631,1},
    {1631,2},
    {1632,1},
    {1632,2},
    {1633,1},
    {1633,2},
    {1634,1},
    {1634,2},
    {1635,1},
    {1635,2},
    {40000,1},
    {40000,2},
    {40000,3},
    {40001,1},
    {40001,2},
    {40001,3},
    {40002,1},
    {40002,2},
    {40002,3},
    {40010,1},
    {40010,2},
    {40010,3},
    {40011,1},
    {40011,2},
    {40011,3},
    {40012,1},
    {40012,2},
    {40012,3},
    {40020,1},
    {40020,2},
    {40020,3},
    {40021,1},
    {40021,2},
    {40021,3},
    {40022,1},
    {40022,2},
    {40022,3},
    {40030,1},
    {40030,2},
    {40030,3},
    {40031,1},
    {40031,2},
    {40031,3},
    {40032,1},
    {40032,2},
    {40032,3},
    {40040,1},
    {40040,2},
    {40040,3},
    {40041,1},
    {40041,2},
    {40041,3},
    {40042,1},
    {40042,2},
    {40042,3},
    {40050,1},
    {40050,2},
    {40050,3},
    {40051,1},
    {40051,2},
    {40051,3},
    {40052,1},
    {40052,2},
    {40052,3},
    {40060,1},
    {40060,2},
    {40060,3},
    {40061,1},
    {40061,2},
    {40061,3},
    {40062,1},
    {40062,2},
    {40062,3},
    {40070,1},
    {40070,2},
    {40070,3},
    {40071,1},
    {40071,2},
    {40071,3},
    {40072,1},
    {40072,2},
    {40072,3},
    {40080,1},
    {40080,2},
    {40080,3},
    {40081,1},
    {40081,2},
    {40081,3},
    {40082,1},
    {40082,2},
    {40082,3}
    ].

get1KeyList()->[
    1601,
    1602,
    1603,
    1604,
    1605,
    1606,
    1607,
    1608,
    1609,
    1610,
    1611,
    1612,
    1613,
    1614,
    1615,
    1616,
    1617,
    1618,
    1619,
    1620,
    1621,
    1622,
    1623,
    1624,
    1625,
    1626,
    1627,
    1628,
    1629,
    1630,
    1631,
    1632,
    1633,
    1634,
    1635,
    40000,
    40001,
    40002,
    40010,
    40011,
    40012,
    40020,
    40021,
    40022,
    40030,
    40031,
    40032,
    40040,
    40041,
    40042,
    40050,
    40051,
    40052,
    40060,
    40061,
    40062,
    40070,
    40071,
    40072,
    40080,
    40081,
    40082
    ].

get2KeyList(1601)->[
    1,
    2
    ];
get2KeyList(1602)->[
    1,
    2
    ];
get2KeyList(1603)->[
    1,
    2
    ];
get2KeyList(1604)->[
    1,
    2
    ];
get2KeyList(1605)->[
    1,
    2
    ];
get2KeyList(1606)->[
    1,
    2
    ];
get2KeyList(1607)->[
    1,
    2
    ];
get2KeyList(1608)->[
    1,
    2
    ];
get2KeyList(1609)->[
    1,
    2
    ];
get2KeyList(1610)->[
    1,
    2
    ];
get2KeyList(1611)->[
    1,
    2
    ];
get2KeyList(1612)->[
    1,
    2
    ];
get2KeyList(1613)->[
    1,
    2
    ];
get2KeyList(1614)->[
    1,
    2
    ];
get2KeyList(1615)->[
    1,
    2
    ];
get2KeyList(1616)->[
    1,
    2
    ];
get2KeyList(1617)->[
    1,
    2
    ];
get2KeyList(1618)->[
    1,
    2
    ];
get2KeyList(1619)->[
    1,
    2
    ];
get2KeyList(1620)->[
    1,
    2
    ];
get2KeyList(1621)->[
    1,
    2
    ];
get2KeyList(1622)->[
    1,
    2
    ];
get2KeyList(1623)->[
    1,
    2
    ];
get2KeyList(1624)->[
    1,
    2
    ];
get2KeyList(1625)->[
    1,
    2
    ];
get2KeyList(1626)->[
    1,
    2
    ];
get2KeyList(1627)->[
    1,
    2
    ];
get2KeyList(1628)->[
    1,
    2
    ];
get2KeyList(1629)->[
    1,
    2
    ];
get2KeyList(1630)->[
    1,
    2
    ];
get2KeyList(1631)->[
    1,
    2
    ];
get2KeyList(1632)->[
    1,
    2
    ];
get2KeyList(1633)->[
    1,
    2
    ];
get2KeyList(1634)->[
    1,
    2
    ];
get2KeyList(1635)->[
    1,
    2
    ];
get2KeyList(40000)->[
    1,
    2,
    3
    ];
get2KeyList(40001)->[
    1,
    2,
    3
    ];
get2KeyList(40002)->[
    1,
    2,
    3
    ];
get2KeyList(40010)->[
    1,
    2,
    3
    ];
get2KeyList(40011)->[
    1,
    2,
    3
    ];
get2KeyList(40012)->[
    1,
    2,
    3
    ];
get2KeyList(40020)->[
    1,
    2,
    3
    ];
get2KeyList(40021)->[
    1,
    2,
    3
    ];
get2KeyList(40022)->[
    1,
    2,
    3
    ];
get2KeyList(40030)->[
    1,
    2,
    3
    ];
get2KeyList(40031)->[
    1,
    2,
    3
    ];
get2KeyList(40032)->[
    1,
    2,
    3
    ];
get2KeyList(40040)->[
    1,
    2,
    3
    ];
get2KeyList(40041)->[
    1,
    2,
    3
    ];
get2KeyList(40042)->[
    1,
    2,
    3
    ];
get2KeyList(40050)->[
    1,
    2,
    3
    ];
get2KeyList(40051)->[
    1,
    2,
    3
    ];
get2KeyList(40052)->[
    1,
    2,
    3
    ];
get2KeyList(40060)->[
    1,
    2,
    3
    ];
get2KeyList(40061)->[
    1,
    2,
    3
    ];
get2KeyList(40062)->[
    1,
    2,
    3
    ];
get2KeyList(40070)->[
    1,
    2,
    3
    ];
get2KeyList(40071)->[
    1,
    2,
    3
    ];
get2KeyList(40072)->[
    1,
    2,
    3
    ];
get2KeyList(40080)->[
    1,
    2,
    3
    ];
get2KeyList(40081)->[
    1,
    2,
    3
    ];
get2KeyList(40082)->[
    1,
    2,
    3
    ];
get2KeyList(_)->[].

