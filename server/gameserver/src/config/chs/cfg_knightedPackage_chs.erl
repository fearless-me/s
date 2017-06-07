%% coding: latin-1
%%: 实现
-module(cfg_knightedPackage_chs).
-compile(export_all).
-include("cfg_knightedPackage.hrl").
-include("logger.hrl").

getRow(1)->
    #knightedPackageCfg {
    iD = 1,
    level = -1,
    name = "平民特权礼包",
    item = [{614,100},{2600,3}],
    diamonds = 30,
    integral = 30,
    explain = "上古神器护体，坐拥敌国财富",
    model_name = "金币",
    model_path = "duang/item_mod_2",
    model_type = 1,
    angle = [15,-170,0],
    size = 1.4
    };
getRow(2)->
    #knightedPackageCfg {
    iD = 2,
    level = 1,
    name = "侍从特权礼包",
    item = [{617,3},{2600,4},{1806,1}],
    diamonds = 100,
    integral = 100,
    explain = "北国寒风之翼，御驾神行天下",
    model_name = "暴雪狮鹫",
    model_path = "monster/m_427",
    model_type = 2,
    size = 0
    };
getRow(3)->
    #knightedPackageCfg {
    iD = 3,
    level = 2,
    name = "兵士特权礼包",
    item = [{617,4},{2600,5},{21103,4}],
    diamonds = 200,
    integral = 200,
    explain = "天降神石——青，战力即刻爆表。",
    model_name = "绿宝石",
    model_path = "duang/item_mod_4",
    model_type = 1,
    size = 0
    };
getRow(4)->
    #knightedPackageCfg {
    iD = 4,
    level = 3,
    name = "士官特权礼包",
    item = [{617,5},{2600,10},{21054,2}],
    diamonds = 600,
    integral = 600,
    explain = "天降神石——兰，护你万世长安。",
    model_name = "蓝宝石",
    model_path = "duang/item_mod_3",
    model_type = 1,
    size = 0
    };
getRow(5)->
    #knightedPackageCfg {
    iD = 5,
    level = 4,
    name = "骑士特权礼包",
    item = [{617,6},{2600,10},{21005,1}],
    diamonds = 1000,
    integral = 1000,
    explain = "天降神石——赤，神力无双战天下。",
    model_name = "红宝石",
    model_path = "duang/item_mod_5",
    model_type = 1,
    size = 0
    };
getRow(6)->
    #knightedPackageCfg {
    iD = 6,
    level = 5,
    name = "勋爵特权礼包",
    item = [{617,7},{2600,10},{1804,1}],
    diamonds = 1500,
    integral = 1500,
    explain = "神驹踏炎而来，伴你纵横天下。",
    model_name = "踏炎战马",
    model_path = "monster/m_407",
    model_type = 2,
    angle = [0,-130,0],
    size = 1.5
    };
getRow(7)->
    #knightedPackageCfg {
    iD = 7,
    level = 6,
    name = "男爵特权礼包",
    item = [{617,8},{2505,1},{1114,1}],
    diamonds = 2000,
    integral = 2000,
    explain = "天界战神，巨斧无坚不摧。",
    model_name = "战神巨斧",
    model_path = "duang/weapon_6",
    model_type = 1,
    angle = [-55,90,90],
    size = 1.5,
    posOffset = [-75,-40,0]
    };
getRow(8)->
    #knightedPackageCfg {
    iD = 8,
    level = 7,
    name = "子爵特权礼包",
    item = [{617,9},{2605,5},{1807,1}],
    diamonds = 3000,
    integral = 3000,
    explain = "古代神兽，先知轮回涅槃；",
    model_name = "银月巨猿",
    model_path = "monster/m_406",
    model_type = 2,
    size = 0
    };
getRow(9)->
    #knightedPackageCfg {
    iD = 9,
    level = 8,
    name = "伯爵特权礼包",
    item = [{617,10},{2605,5},{21106,2}],
    diamonds = 4000,
    integral = 4000,
    explain = "逆天神石——青，释放神兽未知潜能。",
    model_name = "高级绿宝石",
    model_path = "duang/item_mod_4",
    model_type = 1,
    size = 0
    };
getRow(10)->
    #knightedPackageCfg {
    iD = 10,
    level = 9,
    name = "候爵特权礼包",
    item = [{617,11},{2605,5},{21056,2}],
    diamonds = 5000,
    integral = 5000,
    explain = "逆天神石——兰，释放自身强大守护之力。",
    model_name = "高级蓝宝石",
    model_path = "duang/item_mod_3",
    model_type = 1,
    size = 0
    };
getRow(11)->
    #knightedPackageCfg {
    iD = 11,
    level = 10,
    name = "领主特权礼包",
    item = [{617,12},{2605,10},{21006,2}],
    diamonds = 9999,
    integral = 9999,
    explain = "逆天神石——赤，释放潜能毁灭天地。",
    model_name = "高级红宝石",
    model_path = "duang/item_mod_5",
    model_type = 1,
    size = 0
    };
getRow(12)->
    #knightedPackageCfg {
    iD = 12,
    level = 11,
    name = "公爵特权礼包",
    item = [{617,13},{2605,10},{1816,1}],
    diamonds = 20000,
    integral = 20000,
    explain = "迷之精灵，黑色闪光。",
    model_name = "尖牙萌",
    model_path = "monster/m_439",
    model_type = 2,
    size = 0.6
    };
getRow(13)->
    #knightedPackageCfg {
    iD = 13,
    level = 12,
    name = "大公爵特权礼包",
    item = [{617,14},{2605,10},{21007,1}],
    diamonds = 30000,
    integral = 30000,
    explain = "秒天秒地秒世界，无敌才是真正的寂寞。",
    model_name = "高级红宝石",
    model_path = "duang/item_mod_5",
    model_type = 1,
    size = 0
    };
getRow(14)->
    #knightedPackageCfg {
    iD = 14,
    level = 13,
    name = "帝王特权礼包",
    item = [{617,20},{2605,20},{1817,1}],
    diamonds = 50000,
    integral = 50000,
    explain = "神之子嗣，改变过去和未来。",
    model_name = "金甲战龙",
    model_path = "monster/m_405",
    model_type = 2,
    angle = [0,-130,0],
    size = 0
    };
getRow(15)->
    #knightedPackageCfg {
    iD = 15,
    level = 14,
    name = "霸主特权礼包",
    item = [{617,30},{277,12},{1838,1}],
    diamonds = 75000,
    integral = 75000,
    explain = "叱咤风云，成不朽功业。",
    model_name = "远行雷角兽",
    model_path = "monster/m_445",
    model_type = 2,
    angle = [0,-130,0],
    size = 0
    };
getRow(16)->
    #knightedPackageCfg {
    iD = 16,
    level = 15,
    name = "至尊特权礼包",
    item = [{617,50},{1826,1},{1831,1}],
    diamonds = 100000,
    integral = 100000,
    explain = "逆天，尚有例外，逆我，绝无生机。",
    model_name = "星际战神",
    model_path = "monster/m_438",
    model_type = 2,
    angle = [0,-130,0],
    size = 0
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
    {13},
    {14},
    {15},
    {16}
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
    13,
    14,
    15,
    16
    ].

