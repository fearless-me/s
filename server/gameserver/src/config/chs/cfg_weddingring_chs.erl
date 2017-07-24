%% coding: latin-1
%%: 实现
-module(cfg_weddingring_chs).
-compile(export_all).
-include("cfg_weddingring.hrl").
-include("logger.hrl").

getRow(1,1)->
    #weddingringCfg {
    id = 1,
    stage = 1,
    level = 1,
    exp = 30,
    intimacy = 1,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,2227},{136,101},{137,101}],
    levelLimit = 0
    };
getRow(1,2)->
    #weddingringCfg {
    id = 2,
    stage = 1,
    level = 2,
    exp = 50,
    intimacy = 2,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,2316},{136,105},{137,105}],
    levelLimit = 0
    };
getRow(1,3)->
    #weddingringCfg {
    id = 3,
    stage = 1,
    level = 3,
    exp = 70,
    intimacy = 3,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,2405},{136,109},{137,109}],
    levelLimit = 0
    };
getRow(1,4)->
    #weddingringCfg {
    id = 4,
    stage = 1,
    level = 4,
    exp = 90,
    intimacy = 4,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,2494},{136,113},{137,113}],
    levelLimit = 0
    };
getRow(1,5)->
    #weddingringCfg {
    id = 5,
    stage = 1,
    level = 5,
    exp = 110,
    intimacy = 5,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,2583},{136,117},{137,117}],
    levelLimit = 0
    };
getRow(1,6)->
    #weddingringCfg {
    id = 6,
    stage = 1,
    level = 6,
    exp = 130,
    intimacy = 6,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,2673},{136,121},{137,121}],
    levelLimit = 0
    };
getRow(1,7)->
    #weddingringCfg {
    id = 7,
    stage = 1,
    level = 7,
    exp = 150,
    intimacy = 7,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,2762},{136,125},{137,125}],
    levelLimit = 0
    };
getRow(1,8)->
    #weddingringCfg {
    id = 8,
    stage = 1,
    level = 8,
    exp = 170,
    intimacy = 8,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,2851},{136,129},{137,129}],
    levelLimit = 0
    };
getRow(1,9)->
    #weddingringCfg {
    id = 9,
    stage = 1,
    level = 9,
    exp = 190,
    intimacy = 9,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,2940},{136,133},{137,133}],
    levelLimit = 0
    };
getRow(1,10)->
    #weddingringCfg {
    id = 10,
    stage = 1,
    level = 10,
    exp = 210,
    intimacy = 10,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,3029},{136,137},{137,137}],
    break_itemID = [{26003,1},{26004,1},{26005,1}],
    levelLimit = 40
    };
getRow(2,1)->
    #weddingringCfg {
    id = 11,
    stage = 2,
    level = 1,
    exp = 230,
    intimacy = 11,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,3118},{136,141},{137,141}],
    levelLimit = 0
    };
getRow(2,2)->
    #weddingringCfg {
    id = 12,
    stage = 2,
    level = 2,
    exp = 260,
    intimacy = 12,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,3207},{136,145},{137,145}],
    levelLimit = 0
    };
getRow(2,3)->
    #weddingringCfg {
    id = 13,
    stage = 2,
    level = 3,
    exp = 290,
    intimacy = 13,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,3296},{136,149},{137,149}],
    levelLimit = 0
    };
getRow(2,4)->
    #weddingringCfg {
    id = 14,
    stage = 2,
    level = 4,
    exp = 320,
    intimacy = 14,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,3373},{136,153},{137,153}],
    levelLimit = 0
    };
getRow(2,5)->
    #weddingringCfg {
    id = 15,
    stage = 2,
    level = 5,
    exp = 350,
    intimacy = 15,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,3556},{136,161},{137,161}],
    levelLimit = 0
    };
getRow(2,6)->
    #weddingringCfg {
    id = 16,
    stage = 2,
    level = 6,
    exp = 380,
    intimacy = 16,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,3753},{136,170},{137,170}],
    levelLimit = 0
    };
getRow(2,7)->
    #weddingringCfg {
    id = 17,
    stage = 2,
    level = 7,
    exp = 410,
    intimacy = 17,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,3963},{136,180},{137,180}],
    levelLimit = 0
    };
getRow(2,8)->
    #weddingringCfg {
    id = 18,
    stage = 2,
    level = 8,
    exp = 440,
    intimacy = 18,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,4187},{136,190},{137,190}],
    levelLimit = 0
    };
getRow(2,9)->
    #weddingringCfg {
    id = 19,
    stage = 2,
    level = 9,
    exp = 470,
    intimacy = 19,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,4424},{136,201},{137,201}],
    levelLimit = 0
    };
getRow(2,10)->
    #weddingringCfg {
    id = 20,
    stage = 2,
    level = 10,
    exp = 500,
    intimacy = 20,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,4675},{136,212},{137,212}],
    break_itemID = [{26003,1},{26004,1},{26005,1}],
    levelLimit = 45
    };
getRow(3,1)->
    #weddingringCfg {
    id = 21,
    stage = 3,
    level = 1,
    exp = 530,
    intimacy = 21,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,4940},{136,224},{137,224}],
    levelLimit = 0
    };
getRow(3,2)->
    #weddingringCfg {
    id = 22,
    stage = 3,
    level = 2,
    exp = 560,
    intimacy = 22,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,5218},{136,237},{137,237}],
    levelLimit = 0
    };
getRow(3,3)->
    #weddingringCfg {
    id = 23,
    stage = 3,
    level = 3,
    exp = 590,
    intimacy = 23,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,5509},{136,250},{137,250}],
    levelLimit = 0
    };
getRow(3,4)->
    #weddingringCfg {
    id = 24,
    stage = 3,
    level = 4,
    exp = 650,
    intimacy = 24,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,5814},{136,264},{137,264}],
    levelLimit = 0
    };
getRow(3,5)->
    #weddingringCfg {
    id = 25,
    stage = 3,
    level = 5,
    exp = 710,
    intimacy = 25,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,6133},{136,278},{137,278}],
    levelLimit = 0
    };
getRow(3,6)->
    #weddingringCfg {
    id = 26,
    stage = 3,
    level = 6,
    exp = 770,
    intimacy = 26,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,6465},{136,293},{137,293}],
    levelLimit = 0
    };
getRow(3,7)->
    #weddingringCfg {
    id = 27,
    stage = 3,
    level = 7,
    exp = 830,
    intimacy = 27,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,6811},{136,309},{137,309}],
    levelLimit = 0
    };
getRow(3,8)->
    #weddingringCfg {
    id = 28,
    stage = 3,
    level = 8,
    exp = 890,
    intimacy = 28,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,7171},{136,325},{137,325}],
    levelLimit = 0
    };
getRow(3,9)->
    #weddingringCfg {
    id = 29,
    stage = 3,
    level = 9,
    exp = 950,
    intimacy = 29,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,7544},{136,342},{137,342}],
    levelLimit = 0
    };
getRow(3,10)->
    #weddingringCfg {
    id = 30,
    stage = 3,
    level = 10,
    exp = 1010,
    intimacy = 30,
    name = "心心相印",
    model = "Prefab/role/ring/ring1",
    property = [{135,7930},{136,360},{137,360}],
    break_itemID = [{26003,1},{26004,1},{26005,1}],
    levelLimit = 50
    };
getRow(4,1)->
    #weddingringCfg {
    id = 31,
    stage = 4,
    level = 1,
    exp = 1070,
    intimacy = 31,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,8330},{136,378},{137,378},{139,189},{144,75}],
    levelLimit = 0
    };
getRow(4,2)->
    #weddingringCfg {
    id = 32,
    stage = 4,
    level = 2,
    exp = 1130,
    intimacy = 32,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,8744},{136,397},{137,397},{139,198},{144,79}],
    levelLimit = 0
    };
getRow(4,3)->
    #weddingringCfg {
    id = 33,
    stage = 4,
    level = 3,
    exp = 1190,
    intimacy = 33,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,9171},{136,416},{137,416},{139,208},{144,83}],
    levelLimit = 0
    };
getRow(4,4)->
    #weddingringCfg {
    id = 34,
    stage = 4,
    level = 4,
    exp = 1250,
    intimacy = 34,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,9612},{136,436},{137,436},{139,218},{144,87}],
    levelLimit = 0
    };
getRow(4,5)->
    #weddingringCfg {
    id = 35,
    stage = 4,
    level = 5,
    exp = 1310,
    intimacy = 35,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,10066},{136,457},{137,457},{139,228},{144,91}],
    levelLimit = 0
    };
getRow(4,6)->
    #weddingringCfg {
    id = 36,
    stage = 4,
    level = 6,
    exp = 1390,
    intimacy = 36,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,10534},{136,478},{137,478},{139,239},{144,95}],
    levelLimit = 0
    };
getRow(4,7)->
    #weddingringCfg {
    id = 37,
    stage = 4,
    level = 7,
    exp = 1470,
    intimacy = 37,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,11016},{136,500},{137,500},{139,250},{144,100}],
    levelLimit = 0
    };
getRow(4,8)->
    #weddingringCfg {
    id = 38,
    stage = 4,
    level = 8,
    exp = 1550,
    intimacy = 38,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,11511},{136,523},{137,523},{139,261},{144,104}],
    levelLimit = 0
    };
getRow(4,9)->
    #weddingringCfg {
    id = 39,
    stage = 4,
    level = 9,
    exp = 1630,
    intimacy = 39,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,12019},{136,546},{137,546},{139,273},{144,109}],
    levelLimit = 0
    };
getRow(4,10)->
    #weddingringCfg {
    id = 40,
    stage = 4,
    level = 10,
    exp = 1710,
    intimacy = 40,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,12541},{136,570},{137,570},{139,285},{144,114}],
    break_itemID = [{26006,1},{26007,1},{26008,1}],
    levelLimit = 55
    };
getRow(5,1)->
    #weddingringCfg {
    id = 41,
    stage = 5,
    level = 1,
    exp = 1790,
    intimacy = 41,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,13077},{136,594},{137,594},{139,297},{144,118}],
    levelLimit = 0
    };
getRow(5,2)->
    #weddingringCfg {
    id = 42,
    stage = 5,
    level = 2,
    exp = 1870,
    intimacy = 42,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,13626},{136,619},{137,619},{139,309},{144,123}],
    levelLimit = 0
    };
getRow(5,3)->
    #weddingringCfg {
    id = 43,
    stage = 5,
    level = 3,
    exp = 1950,
    intimacy = 43,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,14189},{136,644},{137,644},{139,322},{144,128}],
    levelLimit = 0
    };
getRow(5,4)->
    #weddingringCfg {
    id = 44,
    stage = 5,
    level = 4,
    exp = 2030,
    intimacy = 44,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,14766},{136,671},{137,671},{139,335},{144,134}],
    levelLimit = 0
    };
getRow(5,5)->
    #weddingringCfg {
    id = 45,
    stage = 5,
    level = 5,
    exp = 2110,
    intimacy = 45,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,15356},{136,698},{137,698},{139,349},{144,139}],
    levelLimit = 0
    };
getRow(5,6)->
    #weddingringCfg {
    id = 46,
    stage = 5,
    level = 6,
    exp = 2190,
    intimacy = 46,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,15959},{136,725},{137,725},{139,362},{144,145}],
    levelLimit = 0
    };
getRow(5,7)->
    #weddingringCfg {
    id = 47,
    stage = 5,
    level = 7,
    exp = 2270,
    intimacy = 47,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,16576},{136,753},{137,753},{139,376},{144,150}],
    levelLimit = 0
    };
getRow(5,8)->
    #weddingringCfg {
    id = 48,
    stage = 5,
    level = 8,
    exp = 2370,
    intimacy = 48,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,17207},{136,782},{137,782},{139,391},{144,156}],
    levelLimit = 0
    };
getRow(5,9)->
    #weddingringCfg {
    id = 49,
    stage = 5,
    level = 9,
    exp = 2470,
    intimacy = 49,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,17851},{136,811},{137,811},{139,405},{144,162}],
    levelLimit = 0
    };
getRow(5,10)->
    #weddingringCfg {
    id = 50,
    stage = 5,
    level = 10,
    exp = 2570,
    intimacy = 50,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,18509},{136,841},{137,841},{139,420},{144,168}],
    break_itemID = [{26006,1},{26007,1},{26008,1}],
    levelLimit = 60
    };
getRow(6,1)->
    #weddingringCfg {
    id = 51,
    stage = 6,
    level = 1,
    exp = 2670,
    intimacy = 51,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,19180},{136,871},{137,871},{139,435},{144,174}],
    levelLimit = 0
    };
getRow(6,2)->
    #weddingringCfg {
    id = 52,
    stage = 6,
    level = 2,
    exp = 2770,
    intimacy = 52,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,19865},{136,902},{137,902},{139,451},{144,180}],
    levelLimit = 0
    };
getRow(6,3)->
    #weddingringCfg {
    id = 53,
    stage = 6,
    level = 3,
    exp = 2870,
    intimacy = 53,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,20564},{136,934},{137,934},{139,467},{144,186}],
    levelLimit = 0
    };
getRow(6,4)->
    #weddingringCfg {
    id = 54,
    stage = 6,
    level = 4,
    exp = 2970,
    intimacy = 54,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,21276},{136,967},{137,967},{139,483},{144,193}],
    levelLimit = 0
    };
getRow(6,5)->
    #weddingringCfg {
    id = 55,
    stage = 6,
    level = 5,
    exp = 3070,
    intimacy = 55,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,22001},{136,1000},{137,1000},{139,500},{144,200}],
    levelLimit = 0
    };
getRow(6,6)->
    #weddingringCfg {
    id = 56,
    stage = 6,
    level = 6,
    exp = 3170,
    intimacy = 56,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,22741},{136,1033},{137,1033},{139,516},{144,206}],
    levelLimit = 0
    };
getRow(6,7)->
    #weddingringCfg {
    id = 57,
    stage = 6,
    level = 7,
    exp = 3270,
    intimacy = 57,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,23493},{136,1067},{137,1067},{139,533},{144,213}],
    levelLimit = 0
    };
getRow(6,8)->
    #weddingringCfg {
    id = 58,
    stage = 6,
    level = 8,
    exp = 3370,
    intimacy = 58,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,24260},{136,1102},{137,1102},{139,551},{144,220}],
    levelLimit = 0
    };
getRow(6,9)->
    #weddingringCfg {
    id = 59,
    stage = 6,
    level = 9,
    exp = 3470,
    intimacy = 59,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,25040},{136,1138},{137,1138},{139,569},{144,227}],
    levelLimit = 0
    };
getRow(6,10)->
    #weddingringCfg {
    id = 60,
    stage = 6,
    level = 10,
    exp = 3570,
    intimacy = 60,
    name = "金玉良缘",
    model = "Prefab/role/ring/ring2",
    property = [{135,25833},{136,1174},{137,1174},{139,587},{144,234}],
    break_itemID = [{26006,1},{26007,1},{26008,1}],
    levelLimit = 65
    };
getRow(7,1)->
    #weddingringCfg {
    id = 61,
    stage = 7,
    level = 1,
    exp = 3670,
    intimacy = 61,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,26640},{136,1210},{137,1210},{139,605},{144,242},{140,363},{145,242}],
    levelLimit = 0
    };
getRow(7,2)->
    #weddingringCfg {
    id = 62,
    stage = 7,
    level = 2,
    exp = 3770,
    intimacy = 62,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,27460},{136,1248},{137,1248},{139,624},{144,249},{140,374},{145,249}],
    levelLimit = 0
    };
getRow(7,3)->
    #weddingringCfg {
    id = 63,
    stage = 7,
    level = 3,
    exp = 3870,
    intimacy = 63,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,28295},{136,1286},{137,1286},{139,643},{144,257},{140,385},{145,257}],
    levelLimit = 0
    };
getRow(7,4)->
    #weddingringCfg {
    id = 64,
    stage = 7,
    level = 4,
    exp = 3970,
    intimacy = 64,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,29142},{136,1324},{137,1324},{139,662},{144,264},{140,397},{145,264}],
    levelLimit = 0
    };
getRow(7,5)->
    #weddingringCfg {
    id = 65,
    stage = 7,
    level = 5,
    exp = 4070,
    intimacy = 65,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,30003},{136,1363},{137,1363},{139,681},{144,272},{140,409},{145,272}],
    levelLimit = 0
    };
getRow(7,6)->
    #weddingringCfg {
    id = 66,
    stage = 7,
    level = 6,
    exp = 4170,
    intimacy = 66,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,30878},{136,1403},{137,1403},{139,701},{144,280},{140,421},{145,280}],
    levelLimit = 0
    };
getRow(7,7)->
    #weddingringCfg {
    id = 67,
    stage = 7,
    level = 7,
    exp = 4270,
    intimacy = 67,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,31767},{136,1443},{137,1443},{139,721},{144,288},{140,433},{145,288}],
    levelLimit = 0
    };
getRow(7,8)->
    #weddingringCfg {
    id = 68,
    stage = 7,
    level = 8,
    exp = 4370,
    intimacy = 68,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,32669},{136,1484},{137,1484},{139,742},{144,296},{140,445},{145,296}],
    levelLimit = 0
    };
getRow(7,9)->
    #weddingringCfg {
    id = 69,
    stage = 7,
    level = 9,
    exp = 4470,
    intimacy = 69,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,33584},{136,1526},{137,1526},{139,763},{144,305},{140,457},{145,305}],
    levelLimit = 0
    };
getRow(7,10)->
    #weddingringCfg {
    id = 70,
    stage = 7,
    level = 10,
    exp = 4770,
    intimacy = 70,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,34513},{136,1568},{137,1568},{139,784},{144,313},{140,470},{145,313}],
    break_itemID = [{26009,1},{26010,1},{26011,1}],
    levelLimit = 70
    };
getRow(8,1)->
    #weddingringCfg {
    id = 71,
    stage = 8,
    level = 1,
    exp = 5070,
    intimacy = 71,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,35456},{136,1611},{137,1611},{139,805},{144,322},{140,483},{145,322}],
    levelLimit = 0
    };
getRow(8,2)->
    #weddingringCfg {
    id = 72,
    stage = 8,
    level = 2,
    exp = 5370,
    intimacy = 72,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,36412},{136,1655},{137,1655},{139,827},{144,331},{140,496},{145,331}],
    levelLimit = 0
    };
getRow(8,3)->
    #weddingringCfg {
    id = 73,
    stage = 8,
    level = 3,
    exp = 5670,
    intimacy = 73,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,37382},{136,1699},{137,1699},{139,849},{144,339},{140,509},{145,339}],
    levelLimit = 0
    };
getRow(8,4)->
    #weddingringCfg {
    id = 74,
    stage = 8,
    level = 4,
    exp = 5970,
    intimacy = 74,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,38365},{136,1743},{137,1743},{139,871},{144,348},{140,523},{145,348}],
    levelLimit = 0
    };
getRow(8,5)->
    #weddingringCfg {
    id = 75,
    stage = 8,
    level = 5,
    exp = 6270,
    intimacy = 75,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,39362},{136,1789},{137,1789},{139,894},{144,357},{140,536},{145,357}],
    levelLimit = 0
    };
getRow(8,6)->
    #weddingringCfg {
    id = 76,
    stage = 8,
    level = 6,
    exp = 6570,
    intimacy = 76,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,40372},{136,1835},{137,1835},{139,917},{144,367},{140,550},{145,367}],
    levelLimit = 0
    };
getRow(8,7)->
    #weddingringCfg {
    id = 77,
    stage = 8,
    level = 7,
    exp = 6870,
    intimacy = 77,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,41396},{136,1881},{137,1881},{139,940},{144,376},{140,564},{145,376}],
    levelLimit = 0
    };
getRow(8,8)->
    #weddingringCfg {
    id = 78,
    stage = 8,
    level = 8,
    exp = 7170,
    intimacy = 78,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,42434},{136,1928},{137,1928},{139,964},{144,385},{140,578},{145,385}],
    levelLimit = 0
    };
getRow(8,9)->
    #weddingringCfg {
    id = 79,
    stage = 8,
    level = 9,
    exp = 7470,
    intimacy = 79,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,43485},{136,1976},{137,1976},{139,988},{144,395},{140,592},{145,395}],
    levelLimit = 0
    };
getRow(8,10)->
    #weddingringCfg {
    id = 80,
    stage = 8,
    level = 10,
    exp = 8270,
    intimacy = 80,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,44550},{136,2025},{137,2025},{139,1012},{144,405},{140,607},{145,405}],
    break_itemID = [{26009,1},{26010,1},{26011,1}],
    levelLimit = 75
    };
getRow(9,1)->
    #weddingringCfg {
    id = 81,
    stage = 9,
    level = 1,
    exp = 8270,
    intimacy = 81,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,44550},{136,2025},{137,2025},{139,1012},{144,405},{140,607},{145,405}],
    levelLimit = 0
    };
getRow(9,2)->
    #weddingringCfg {
    id = 82,
    stage = 9,
    level = 2,
    exp = 8270,
    intimacy = 82,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,44550},{136,2025},{137,2025},{139,1012},{144,405},{140,607},{145,405}],
    levelLimit = 0
    };
getRow(9,3)->
    #weddingringCfg {
    id = 83,
    stage = 9,
    level = 3,
    exp = 8270,
    intimacy = 83,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,44550},{136,2025},{137,2025},{139,1012},{144,405},{140,607},{145,405}],
    levelLimit = 0
    };
getRow(9,4)->
    #weddingringCfg {
    id = 84,
    stage = 9,
    level = 4,
    exp = 8270,
    intimacy = 84,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,44550},{136,2025},{137,2025},{139,1012},{144,405},{140,607},{145,405}],
    levelLimit = 0
    };
getRow(9,5)->
    #weddingringCfg {
    id = 85,
    stage = 9,
    level = 5,
    exp = 8270,
    intimacy = 85,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,44550},{136,2025},{137,2025},{139,1012},{144,405},{140,607},{145,405}],
    levelLimit = 0
    };
getRow(9,6)->
    #weddingringCfg {
    id = 86,
    stage = 9,
    level = 6,
    exp = 8270,
    intimacy = 86,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,44550},{136,2025},{137,2025},{139,1012},{144,405},{140,607},{145,405}],
    levelLimit = 0
    };
getRow(9,7)->
    #weddingringCfg {
    id = 87,
    stage = 9,
    level = 7,
    exp = 8270,
    intimacy = 87,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,44550},{136,2025},{137,2025},{139,1012},{144,405},{140,607},{145,405}],
    levelLimit = 0
    };
getRow(9,8)->
    #weddingringCfg {
    id = 88,
    stage = 9,
    level = 8,
    exp = 8270,
    intimacy = 88,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,44550},{136,2025},{137,2025},{139,1012},{144,405},{140,607},{145,405}],
    levelLimit = 0
    };
getRow(9,9)->
    #weddingringCfg {
    id = 89,
    stage = 9,
    level = 9,
    exp = 8270,
    intimacy = 89,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,44550},{136,2025},{137,2025},{139,1012},{144,405},{140,607},{145,405}],
    levelLimit = 0
    };
getRow(9,10)->
    #weddingringCfg {
    id = 90,
    stage = 9,
    level = 10,
    exp = 8270,
    intimacy = 90,
    name = "海誓山盟",
    model = "Prefab/role/ring/ring3",
    property = [{135,44550},{136,2025},{137,2025},{139,1012},{144,405},{140,607},{145,405}],
    break_itemID = [{26009,1},{26010,1},{26011,1}],
    levelLimit = 80
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
    {1,2},
    {1,3},
    {1,4},
    {1,5},
    {1,6},
    {1,7},
    {1,8},
    {1,9},
    {1,10},
    {2,1},
    {2,2},
    {2,3},
    {2,4},
    {2,5},
    {2,6},
    {2,7},
    {2,8},
    {2,9},
    {2,10},
    {3,1},
    {3,2},
    {3,3},
    {3,4},
    {3,5},
    {3,6},
    {3,7},
    {3,8},
    {3,9},
    {3,10},
    {4,1},
    {4,2},
    {4,3},
    {4,4},
    {4,5},
    {4,6},
    {4,7},
    {4,8},
    {4,9},
    {4,10},
    {5,1},
    {5,2},
    {5,3},
    {5,4},
    {5,5},
    {5,6},
    {5,7},
    {5,8},
    {5,9},
    {5,10},
    {6,1},
    {6,2},
    {6,3},
    {6,4},
    {6,5},
    {6,6},
    {6,7},
    {6,8},
    {6,9},
    {6,10},
    {7,1},
    {7,2},
    {7,3},
    {7,4},
    {7,5},
    {7,6},
    {7,7},
    {7,8},
    {7,9},
    {7,10},
    {8,1},
    {8,2},
    {8,3},
    {8,4},
    {8,5},
    {8,6},
    {8,7},
    {8,8},
    {8,9},
    {8,10},
    {9,1},
    {9,2},
    {9,3},
    {9,4},
    {9,5},
    {9,6},
    {9,7},
    {9,8},
    {9,9},
    {9,10}
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
    9
    ].

get2KeyList(1)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(2)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(3)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(4)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(5)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(6)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(7)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(8)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(9)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(_)->[].

