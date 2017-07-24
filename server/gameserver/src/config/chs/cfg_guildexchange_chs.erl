%% coding: latin-1
%%: 实现
-module(cfg_guildexchange_chs).
-compile(export_all).
-include("cfg_guildexchange.hrl").
-include("logger.hrl").

getRow(1,0)->
    #guildexchangeCfg {
    id = 1,
    level = 0,
    icon = 4,
    property = [{0,140,0}],
    guildlevel = 1,
    cost = 0,
    name = "家族暴击等级",
    describe = "尚未学习"
    };
getRow(1,1)->
    #guildexchangeCfg {
    id = 1,
    level = 1,
    icon = 4,
    property = [{0,140,127}],
    guildlevel = 1,
    cost = 100,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级127点"
    };
getRow(1,2)->
    #guildexchangeCfg {
    id = 1,
    level = 2,
    icon = 4,
    property = [{0,140,229}],
    guildlevel = 1,
    cost = 160,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级229点"
    };
getRow(1,3)->
    #guildexchangeCfg {
    id = 1,
    level = 3,
    icon = 4,
    property = [{0,140,395}],
    guildlevel = 1,
    cost = 282,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级395点"
    };
getRow(1,4)->
    #guildexchangeCfg {
    id = 1,
    level = 4,
    icon = 4,
    property = [{0,140,600}],
    guildlevel = 1,
    cost = 403,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级600点"
    };
getRow(1,5)->
    #guildexchangeCfg {
    id = 1,
    level = 5,
    icon = 4,
    property = [{0,140,834}],
    guildlevel = 1,
    cost = 525,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级834点"
    };
getRow(1,6)->
    #guildexchangeCfg {
    id = 1,
    level = 6,
    icon = 4,
    property = [{0,140,1093}],
    guildlevel = 1,
    cost = 646,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级1093点"
    };
getRow(1,7)->
    #guildexchangeCfg {
    id = 1,
    level = 7,
    icon = 4,
    property = [{0,140,1374}],
    guildlevel = 1,
    cost = 767,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级1374点"
    };
getRow(1,8)->
    #guildexchangeCfg {
    id = 1,
    level = 8,
    icon = 4,
    property = [{0,140,1675}],
    guildlevel = 1,
    cost = 889,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级1675点"
    };
getRow(1,9)->
    #guildexchangeCfg {
    id = 1,
    level = 9,
    icon = 4,
    property = [{0,140,1993}],
    guildlevel = 1,
    cost = 1010,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级1993点"
    };
getRow(1,10)->
    #guildexchangeCfg {
    id = 1,
    level = 10,
    icon = 4,
    property = [{0,140,2327}],
    guildlevel = 1,
    cost = 1131,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级2327点"
    };
getRow(1,11)->
    #guildexchangeCfg {
    id = 1,
    level = 11,
    icon = 4,
    property = [{0,140,2677}],
    guildlevel = 2,
    cost = 1253,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级2677点"
    };
getRow(1,12)->
    #guildexchangeCfg {
    id = 1,
    level = 12,
    icon = 4,
    property = [{0,140,3041}],
    guildlevel = 2,
    cost = 1374,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级3041点"
    };
getRow(1,13)->
    #guildexchangeCfg {
    id = 1,
    level = 13,
    icon = 4,
    property = [{0,140,3418}],
    guildlevel = 2,
    cost = 1495,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级3418点"
    };
getRow(1,14)->
    #guildexchangeCfg {
    id = 1,
    level = 14,
    icon = 4,
    property = [{0,140,3809}],
    guildlevel = 2,
    cost = 1616,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级3809点"
    };
getRow(1,15)->
    #guildexchangeCfg {
    id = 1,
    level = 15,
    icon = 4,
    property = [{0,140,4211}],
    guildlevel = 2,
    cost = 1738,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级4211点"
    };
getRow(1,16)->
    #guildexchangeCfg {
    id = 1,
    level = 16,
    icon = 4,
    property = [{0,140,4625}],
    guildlevel = 2,
    cost = 1859,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级4625点"
    };
getRow(1,17)->
    #guildexchangeCfg {
    id = 1,
    level = 17,
    icon = 4,
    property = [{0,140,5050}],
    guildlevel = 2,
    cost = 1981,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级5050点"
    };
getRow(1,18)->
    #guildexchangeCfg {
    id = 1,
    level = 18,
    icon = 4,
    property = [{0,140,5487}],
    guildlevel = 2,
    cost = 2102,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级5487点"
    };
getRow(1,19)->
    #guildexchangeCfg {
    id = 1,
    level = 19,
    icon = 4,
    property = [{0,140,5933}],
    guildlevel = 2,
    cost = 2223,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级5933点"
    };
getRow(1,20)->
    #guildexchangeCfg {
    id = 1,
    level = 20,
    icon = 4,
    property = [{0,140,6390}],
    guildlevel = 2,
    cost = 2345,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级6390点"
    };
getRow(2,0)->
    #guildexchangeCfg {
    id = 2,
    level = 0,
    icon = 5,
    property = [{0,141,0}],
    guildlevel = 1,
    cost = 0,
    name = "家族抗暴等级",
    describe = "尚未学习"
    };
getRow(2,1)->
    #guildexchangeCfg {
    id = 2,
    level = 1,
    icon = 5,
    property = [{0,141,90}],
    guildlevel = 1,
    cost = 100,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级90点"
    };
getRow(2,2)->
    #guildexchangeCfg {
    id = 2,
    level = 2,
    icon = 5,
    property = [{0,141,161}],
    guildlevel = 1,
    cost = 160,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级161点"
    };
getRow(2,3)->
    #guildexchangeCfg {
    id = 2,
    level = 3,
    icon = 5,
    property = [{0,141,278}],
    guildlevel = 1,
    cost = 282,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级278点"
    };
getRow(2,4)->
    #guildexchangeCfg {
    id = 2,
    level = 4,
    icon = 5,
    property = [{0,141,423}],
    guildlevel = 1,
    cost = 403,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级423点"
    };
getRow(2,5)->
    #guildexchangeCfg {
    id = 2,
    level = 5,
    icon = 5,
    property = [{0,141,588}],
    guildlevel = 1,
    cost = 525,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级588点"
    };
getRow(2,6)->
    #guildexchangeCfg {
    id = 2,
    level = 6,
    icon = 5,
    property = [{0,141,770}],
    guildlevel = 1,
    cost = 646,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级770点"
    };
getRow(2,7)->
    #guildexchangeCfg {
    id = 2,
    level = 7,
    icon = 5,
    property = [{0,141,968}],
    guildlevel = 1,
    cost = 767,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级968点"
    };
getRow(2,8)->
    #guildexchangeCfg {
    id = 2,
    level = 8,
    icon = 5,
    property = [{0,141,1180}],
    guildlevel = 1,
    cost = 889,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级1180点"
    };
getRow(2,9)->
    #guildexchangeCfg {
    id = 2,
    level = 9,
    icon = 5,
    property = [{0,141,1404}],
    guildlevel = 1,
    cost = 1010,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级1404点"
    };
getRow(2,10)->
    #guildexchangeCfg {
    id = 2,
    level = 10,
    icon = 5,
    property = [{0,141,1640}],
    guildlevel = 1,
    cost = 1131,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级1640点"
    };
getRow(2,11)->
    #guildexchangeCfg {
    id = 2,
    level = 11,
    icon = 5,
    property = [{0,141,1886}],
    guildlevel = 2,
    cost = 1253,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级1886点"
    };
getRow(2,12)->
    #guildexchangeCfg {
    id = 2,
    level = 12,
    icon = 5,
    property = [{0,141,2143}],
    guildlevel = 2,
    cost = 1374,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级2143点"
    };
getRow(2,13)->
    #guildexchangeCfg {
    id = 2,
    level = 13,
    icon = 5,
    property = [{0,141,2409}],
    guildlevel = 2,
    cost = 1495,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级2409点"
    };
getRow(2,14)->
    #guildexchangeCfg {
    id = 2,
    level = 14,
    icon = 5,
    property = [{0,141,2684}],
    guildlevel = 2,
    cost = 1616,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级2684点"
    };
getRow(2,15)->
    #guildexchangeCfg {
    id = 2,
    level = 15,
    icon = 5,
    property = [{0,141,2967}],
    guildlevel = 2,
    cost = 1738,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级2967点"
    };
getRow(2,16)->
    #guildexchangeCfg {
    id = 2,
    level = 16,
    icon = 5,
    property = [{0,141,3259}],
    guildlevel = 2,
    cost = 1859,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级3259点"
    };
getRow(2,17)->
    #guildexchangeCfg {
    id = 2,
    level = 17,
    icon = 5,
    property = [{0,141,3559}],
    guildlevel = 2,
    cost = 1981,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级3559点"
    };
getRow(2,18)->
    #guildexchangeCfg {
    id = 2,
    level = 18,
    icon = 5,
    property = [{0,141,3866}],
    guildlevel = 2,
    cost = 2102,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级3866点"
    };
getRow(2,19)->
    #guildexchangeCfg {
    id = 2,
    level = 19,
    icon = 5,
    property = [{0,141,4181}],
    guildlevel = 2,
    cost = 2223,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级4181点"
    };
getRow(2,20)->
    #guildexchangeCfg {
    id = 2,
    level = 20,
    icon = 5,
    property = [{0,141,4503}],
    guildlevel = 2,
    cost = 2345,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级4503点"
    };
getRow(3,0)->
    #guildexchangeCfg {
    id = 3,
    level = 0,
    icon = 14,
    property = [{0,142,0}],
    guildlevel = 1,
    cost = 0,
    name = "家族爆伤等级",
    describe = "尚未学习"
    };
getRow(3,1)->
    #guildexchangeCfg {
    id = 3,
    level = 1,
    icon = 14,
    property = [{0,142,77}],
    guildlevel = 1,
    cost = 100,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级77点"
    };
getRow(3,2)->
    #guildexchangeCfg {
    id = 3,
    level = 2,
    icon = 14,
    property = [{0,142,138}],
    guildlevel = 1,
    cost = 160,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级138点"
    };
getRow(3,3)->
    #guildexchangeCfg {
    id = 3,
    level = 3,
    icon = 14,
    property = [{0,142,239}],
    guildlevel = 1,
    cost = 282,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级239点"
    };
getRow(3,4)->
    #guildexchangeCfg {
    id = 3,
    level = 4,
    icon = 14,
    property = [{0,142,363}],
    guildlevel = 1,
    cost = 403,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级363点"
    };
getRow(3,5)->
    #guildexchangeCfg {
    id = 3,
    level = 5,
    icon = 14,
    property = [{0,142,504}],
    guildlevel = 1,
    cost = 525,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级504点"
    };
getRow(3,6)->
    #guildexchangeCfg {
    id = 3,
    level = 6,
    icon = 14,
    property = [{0,142,661}],
    guildlevel = 1,
    cost = 646,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级661点"
    };
getRow(3,7)->
    #guildexchangeCfg {
    id = 3,
    level = 7,
    icon = 14,
    property = [{0,142,831}],
    guildlevel = 1,
    cost = 767,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级831点"
    };
getRow(3,8)->
    #guildexchangeCfg {
    id = 3,
    level = 8,
    icon = 14,
    property = [{0,142,1012}],
    guildlevel = 1,
    cost = 889,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1012点"
    };
getRow(3,9)->
    #guildexchangeCfg {
    id = 3,
    level = 9,
    icon = 14,
    property = [{0,142,1205}],
    guildlevel = 1,
    cost = 1010,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1205点"
    };
getRow(3,10)->
    #guildexchangeCfg {
    id = 3,
    level = 10,
    icon = 14,
    property = [{0,142,1407}],
    guildlevel = 1,
    cost = 1131,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1407点"
    };
getRow(3,11)->
    #guildexchangeCfg {
    id = 3,
    level = 11,
    icon = 14,
    property = [{0,142,1619}],
    guildlevel = 2,
    cost = 1253,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1619点"
    };
getRow(3,12)->
    #guildexchangeCfg {
    id = 3,
    level = 12,
    icon = 14,
    property = [{0,142,1839}],
    guildlevel = 2,
    cost = 1374,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1839点"
    };
getRow(3,13)->
    #guildexchangeCfg {
    id = 3,
    level = 13,
    icon = 14,
    property = [{0,142,2067}],
    guildlevel = 2,
    cost = 1495,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级2067点"
    };
getRow(3,14)->
    #guildexchangeCfg {
    id = 3,
    level = 14,
    icon = 14,
    property = [{0,142,2303}],
    guildlevel = 2,
    cost = 1616,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级2303点"
    };
getRow(3,15)->
    #guildexchangeCfg {
    id = 3,
    level = 15,
    icon = 14,
    property = [{0,142,2546}],
    guildlevel = 2,
    cost = 1738,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级2546点"
    };
getRow(3,16)->
    #guildexchangeCfg {
    id = 3,
    level = 16,
    icon = 14,
    property = [{0,142,2797}],
    guildlevel = 2,
    cost = 1859,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级2797点"
    };
getRow(3,17)->
    #guildexchangeCfg {
    id = 3,
    level = 17,
    icon = 14,
    property = [{0,142,3054}],
    guildlevel = 2,
    cost = 1981,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级3054点"
    };
getRow(3,18)->
    #guildexchangeCfg {
    id = 3,
    level = 18,
    icon = 14,
    property = [{0,142,3317}],
    guildlevel = 2,
    cost = 2102,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级3317点"
    };
getRow(3,19)->
    #guildexchangeCfg {
    id = 3,
    level = 19,
    icon = 14,
    property = [{0,142,3587}],
    guildlevel = 2,
    cost = 2223,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级3587点"
    };
getRow(3,20)->
    #guildexchangeCfg {
    id = 3,
    level = 20,
    icon = 14,
    property = [{0,142,3864}],
    guildlevel = 2,
    cost = 2345,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级3864点"
    };
getRow(4,0)->
    #guildexchangeCfg {
    id = 4,
    level = 0,
    icon = 17,
    property = [{0,143,0}],
    guildlevel = 2,
    cost = 0,
    name = "家族韧性等级",
    describe = "尚未学习"
    };
getRow(4,1)->
    #guildexchangeCfg {
    id = 4,
    level = 1,
    icon = 17,
    property = [{0,143,65}],
    guildlevel = 2,
    cost = 100,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级65点"
    };
getRow(4,2)->
    #guildexchangeCfg {
    id = 4,
    level = 2,
    icon = 17,
    property = [{0,143,117}],
    guildlevel = 2,
    cost = 160,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级117点"
    };
getRow(4,3)->
    #guildexchangeCfg {
    id = 4,
    level = 3,
    icon = 17,
    property = [{0,143,202}],
    guildlevel = 2,
    cost = 282,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级202点"
    };
getRow(4,4)->
    #guildexchangeCfg {
    id = 4,
    level = 4,
    icon = 17,
    property = [{0,143,307}],
    guildlevel = 2,
    cost = 403,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级307点"
    };
getRow(4,5)->
    #guildexchangeCfg {
    id = 4,
    level = 5,
    icon = 17,
    property = [{0,143,427}],
    guildlevel = 2,
    cost = 525,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级427点"
    };
getRow(4,6)->
    #guildexchangeCfg {
    id = 4,
    level = 6,
    icon = 17,
    property = [{0,143,559}],
    guildlevel = 2,
    cost = 646,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级559点"
    };
getRow(4,7)->
    #guildexchangeCfg {
    id = 4,
    level = 7,
    icon = 17,
    property = [{0,143,703}],
    guildlevel = 2,
    cost = 767,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级703点"
    };
getRow(4,8)->
    #guildexchangeCfg {
    id = 4,
    level = 8,
    icon = 17,
    property = [{0,143,857}],
    guildlevel = 2,
    cost = 889,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级857点"
    };
getRow(4,9)->
    #guildexchangeCfg {
    id = 4,
    level = 9,
    icon = 17,
    property = [{0,143,1019}],
    guildlevel = 2,
    cost = 1010,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级1019点"
    };
getRow(4,10)->
    #guildexchangeCfg {
    id = 4,
    level = 10,
    icon = 17,
    property = [{0,143,1191}],
    guildlevel = 2,
    cost = 1131,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级1191点"
    };
getRow(4,11)->
    #guildexchangeCfg {
    id = 4,
    level = 11,
    icon = 17,
    property = [{0,143,1369}],
    guildlevel = 3,
    cost = 1253,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级1369点"
    };
getRow(4,12)->
    #guildexchangeCfg {
    id = 4,
    level = 12,
    icon = 17,
    property = [{0,143,1556}],
    guildlevel = 3,
    cost = 1374,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级1556点"
    };
getRow(4,13)->
    #guildexchangeCfg {
    id = 4,
    level = 13,
    icon = 17,
    property = [{0,143,1749}],
    guildlevel = 3,
    cost = 1495,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级1749点"
    };
getRow(4,14)->
    #guildexchangeCfg {
    id = 4,
    level = 14,
    icon = 17,
    property = [{0,143,1949}],
    guildlevel = 3,
    cost = 1616,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级1949点"
    };
getRow(4,15)->
    #guildexchangeCfg {
    id = 4,
    level = 15,
    icon = 17,
    property = [{0,143,2154}],
    guildlevel = 3,
    cost = 1738,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级2154点"
    };
getRow(4,16)->
    #guildexchangeCfg {
    id = 4,
    level = 16,
    icon = 17,
    property = [{0,143,2366}],
    guildlevel = 3,
    cost = 1859,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级2366点"
    };
getRow(4,17)->
    #guildexchangeCfg {
    id = 4,
    level = 17,
    icon = 17,
    property = [{0,143,2584}],
    guildlevel = 3,
    cost = 1981,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级2584点"
    };
getRow(4,18)->
    #guildexchangeCfg {
    id = 4,
    level = 18,
    icon = 17,
    property = [{0,143,2807}],
    guildlevel = 3,
    cost = 2102,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级2807点"
    };
getRow(4,19)->
    #guildexchangeCfg {
    id = 4,
    level = 19,
    icon = 17,
    property = [{0,143,3036}],
    guildlevel = 3,
    cost = 2223,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级3036点"
    };
getRow(4,20)->
    #guildexchangeCfg {
    id = 4,
    level = 20,
    icon = 17,
    property = [{0,143,3269}],
    guildlevel = 3,
    cost = 2345,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级3269点"
    };
getRow(5,0)->
    #guildexchangeCfg {
    id = 5,
    level = 0,
    icon = 46,
    property = [{0,144,0}],
    guildlevel = 2,
    cost = 0,
    name = "家族命中等级",
    describe = "尚未学习"
    };
getRow(5,1)->
    #guildexchangeCfg {
    id = 5,
    level = 1,
    icon = 46,
    property = [{0,144,67}],
    guildlevel = 2,
    cost = 100,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级67点"
    };
getRow(5,2)->
    #guildexchangeCfg {
    id = 5,
    level = 2,
    icon = 46,
    property = [{0,144,120}],
    guildlevel = 2,
    cost = 160,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级120点"
    };
getRow(5,3)->
    #guildexchangeCfg {
    id = 5,
    level = 3,
    icon = 46,
    property = [{0,144,208}],
    guildlevel = 2,
    cost = 282,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级208点"
    };
getRow(5,4)->
    #guildexchangeCfg {
    id = 5,
    level = 4,
    icon = 46,
    property = [{0,144,316}],
    guildlevel = 2,
    cost = 403,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级316点"
    };
getRow(5,5)->
    #guildexchangeCfg {
    id = 5,
    level = 5,
    icon = 46,
    property = [{0,144,439}],
    guildlevel = 2,
    cost = 525,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级439点"
    };
getRow(5,6)->
    #guildexchangeCfg {
    id = 5,
    level = 6,
    icon = 46,
    property = [{0,144,576}],
    guildlevel = 2,
    cost = 646,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级576点"
    };
getRow(5,7)->
    #guildexchangeCfg {
    id = 5,
    level = 7,
    icon = 46,
    property = [{0,144,724}],
    guildlevel = 2,
    cost = 767,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级724点"
    };
getRow(5,8)->
    #guildexchangeCfg {
    id = 5,
    level = 8,
    icon = 46,
    property = [{0,144,882}],
    guildlevel = 2,
    cost = 889,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级882点"
    };
getRow(5,9)->
    #guildexchangeCfg {
    id = 5,
    level = 9,
    icon = 46,
    property = [{0,144,1049}],
    guildlevel = 2,
    cost = 1010,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级1049点"
    };
getRow(5,10)->
    #guildexchangeCfg {
    id = 5,
    level = 10,
    icon = 46,
    property = [{0,144,1225}],
    guildlevel = 2,
    cost = 1131,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级1225点"
    };
getRow(5,11)->
    #guildexchangeCfg {
    id = 5,
    level = 11,
    icon = 46,
    property = [{0,144,1409}],
    guildlevel = 3,
    cost = 1253,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级1409点"
    };
getRow(5,12)->
    #guildexchangeCfg {
    id = 5,
    level = 12,
    icon = 46,
    property = [{0,144,1601}],
    guildlevel = 3,
    cost = 1374,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级1601点"
    };
getRow(5,13)->
    #guildexchangeCfg {
    id = 5,
    level = 13,
    icon = 46,
    property = [{0,144,1800}],
    guildlevel = 3,
    cost = 1495,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级1800点"
    };
getRow(5,14)->
    #guildexchangeCfg {
    id = 5,
    level = 14,
    icon = 46,
    property = [{0,144,2005}],
    guildlevel = 3,
    cost = 1616,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级2005点"
    };
getRow(5,15)->
    #guildexchangeCfg {
    id = 5,
    level = 15,
    icon = 46,
    property = [{0,144,2217}],
    guildlevel = 3,
    cost = 1738,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级2217点"
    };
getRow(5,16)->
    #guildexchangeCfg {
    id = 5,
    level = 16,
    icon = 46,
    property = [{0,144,2435}],
    guildlevel = 3,
    cost = 1859,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级2435点"
    };
getRow(5,17)->
    #guildexchangeCfg {
    id = 5,
    level = 17,
    icon = 46,
    property = [{0,144,2659}],
    guildlevel = 3,
    cost = 1981,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级2659点"
    };
getRow(5,18)->
    #guildexchangeCfg {
    id = 5,
    level = 18,
    icon = 46,
    property = [{0,144,2889}],
    guildlevel = 3,
    cost = 2102,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级2889点"
    };
getRow(5,19)->
    #guildexchangeCfg {
    id = 5,
    level = 19,
    icon = 46,
    property = [{0,144,3124}],
    guildlevel = 3,
    cost = 2223,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级3124点"
    };
getRow(5,20)->
    #guildexchangeCfg {
    id = 5,
    level = 20,
    icon = 46,
    property = [{0,144,3365}],
    guildlevel = 3,
    cost = 2345,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级3365点"
    };
getRow(6,0)->
    #guildexchangeCfg {
    id = 6,
    level = 0,
    icon = 54,
    property = [{0,145,0}],
    guildlevel = 2,
    cost = 0,
    name = "家族闪避等级",
    describe = "尚未学习"
    };
getRow(6,1)->
    #guildexchangeCfg {
    id = 6,
    level = 1,
    icon = 54,
    property = [{0,145,96}],
    guildlevel = 2,
    cost = 100,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级96点"
    };
getRow(6,2)->
    #guildexchangeCfg {
    id = 6,
    level = 2,
    icon = 54,
    property = [{0,145,172}],
    guildlevel = 2,
    cost = 160,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级172点"
    };
getRow(6,3)->
    #guildexchangeCfg {
    id = 6,
    level = 3,
    icon = 54,
    property = [{0,145,298}],
    guildlevel = 2,
    cost = 282,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级298点"
    };
getRow(6,4)->
    #guildexchangeCfg {
    id = 6,
    level = 4,
    icon = 54,
    property = [{0,145,452}],
    guildlevel = 2,
    cost = 403,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级452点"
    };
getRow(6,5)->
    #guildexchangeCfg {
    id = 6,
    level = 5,
    icon = 54,
    property = [{0,145,628}],
    guildlevel = 2,
    cost = 525,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级628点"
    };
getRow(6,6)->
    #guildexchangeCfg {
    id = 6,
    level = 6,
    icon = 54,
    property = [{0,145,824}],
    guildlevel = 2,
    cost = 646,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级824点"
    };
getRow(6,7)->
    #guildexchangeCfg {
    id = 6,
    level = 7,
    icon = 54,
    property = [{0,145,1035}],
    guildlevel = 2,
    cost = 767,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级1035点"
    };
getRow(6,8)->
    #guildexchangeCfg {
    id = 6,
    level = 8,
    icon = 54,
    property = [{0,145,1262}],
    guildlevel = 2,
    cost = 889,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级1262点"
    };
getRow(6,9)->
    #guildexchangeCfg {
    id = 6,
    level = 9,
    icon = 54,
    property = [{0,145,1502}],
    guildlevel = 2,
    cost = 1010,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级1502点"
    };
getRow(6,10)->
    #guildexchangeCfg {
    id = 6,
    level = 10,
    icon = 54,
    property = [{0,145,1754}],
    guildlevel = 2,
    cost = 1131,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级1754点"
    };
getRow(6,11)->
    #guildexchangeCfg {
    id = 6,
    level = 11,
    icon = 54,
    property = [{0,145,2017}],
    guildlevel = 3,
    cost = 1253,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级2017点"
    };
getRow(6,12)->
    #guildexchangeCfg {
    id = 6,
    level = 12,
    icon = 54,
    property = [{0,145,2291}],
    guildlevel = 3,
    cost = 1374,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级2291点"
    };
getRow(6,13)->
    #guildexchangeCfg {
    id = 6,
    level = 13,
    icon = 54,
    property = [{0,145,2576}],
    guildlevel = 3,
    cost = 1495,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级2576点"
    };
getRow(6,14)->
    #guildexchangeCfg {
    id = 6,
    level = 14,
    icon = 54,
    property = [{0,145,2870}],
    guildlevel = 3,
    cost = 1616,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级2870点"
    };
getRow(6,15)->
    #guildexchangeCfg {
    id = 6,
    level = 15,
    icon = 54,
    property = [{0,145,3173}],
    guildlevel = 3,
    cost = 1738,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级3173点"
    };
getRow(6,16)->
    #guildexchangeCfg {
    id = 6,
    level = 16,
    icon = 54,
    property = [{0,145,3485}],
    guildlevel = 3,
    cost = 1859,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级3485点"
    };
getRow(6,17)->
    #guildexchangeCfg {
    id = 6,
    level = 17,
    icon = 54,
    property = [{0,145,3805}],
    guildlevel = 3,
    cost = 1981,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级3805点"
    };
getRow(6,18)->
    #guildexchangeCfg {
    id = 6,
    level = 18,
    icon = 54,
    property = [{0,145,4134}],
    guildlevel = 3,
    cost = 2102,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级4134点"
    };
getRow(6,19)->
    #guildexchangeCfg {
    id = 6,
    level = 19,
    icon = 54,
    property = [{0,145,4471}],
    guildlevel = 3,
    cost = 2223,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级4471点"
    };
getRow(6,20)->
    #guildexchangeCfg {
    id = 6,
    level = 20,
    icon = 54,
    property = [{0,145,4815}],
    guildlevel = 3,
    cost = 2345,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级4815点"
    };
getRow(7,0)->
    #guildexchangeCfg {
    id = 7,
    level = 0,
    icon = 55,
    property = [{0,146,0}],
    guildlevel = 3,
    cost = 0,
    name = "家族破甲等级",
    describe = "尚未学习"
    };
getRow(7,1)->
    #guildexchangeCfg {
    id = 7,
    level = 1,
    icon = 55,
    property = [{0,146,64}],
    guildlevel = 3,
    cost = 100,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级64点"
    };
getRow(7,2)->
    #guildexchangeCfg {
    id = 7,
    level = 2,
    icon = 55,
    property = [{0,146,115}],
    guildlevel = 3,
    cost = 160,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级115点"
    };
getRow(7,3)->
    #guildexchangeCfg {
    id = 7,
    level = 3,
    icon = 55,
    property = [{0,146,198}],
    guildlevel = 3,
    cost = 282,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级198点"
    };
getRow(7,4)->
    #guildexchangeCfg {
    id = 7,
    level = 4,
    icon = 55,
    property = [{0,146,301}],
    guildlevel = 3,
    cost = 403,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级301点"
    };
getRow(7,5)->
    #guildexchangeCfg {
    id = 7,
    level = 5,
    icon = 55,
    property = [{0,146,419}],
    guildlevel = 3,
    cost = 525,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级419点"
    };
getRow(7,6)->
    #guildexchangeCfg {
    id = 7,
    level = 6,
    icon = 55,
    property = [{0,146,549}],
    guildlevel = 3,
    cost = 646,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级549点"
    };
getRow(7,7)->
    #guildexchangeCfg {
    id = 7,
    level = 7,
    icon = 55,
    property = [{0,146,690}],
    guildlevel = 3,
    cost = 767,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级690点"
    };
getRow(7,8)->
    #guildexchangeCfg {
    id = 7,
    level = 8,
    icon = 55,
    property = [{0,146,841}],
    guildlevel = 3,
    cost = 889,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级841点"
    };
getRow(7,9)->
    #guildexchangeCfg {
    id = 7,
    level = 9,
    icon = 55,
    property = [{0,146,1001}],
    guildlevel = 3,
    cost = 1010,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级1001点"
    };
getRow(7,10)->
    #guildexchangeCfg {
    id = 7,
    level = 10,
    icon = 55,
    property = [{0,146,1169}],
    guildlevel = 3,
    cost = 1131,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级1169点"
    };
getRow(7,11)->
    #guildexchangeCfg {
    id = 7,
    level = 11,
    icon = 55,
    property = [{0,146,1344}],
    guildlevel = 4,
    cost = 1253,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级1344点"
    };
getRow(7,12)->
    #guildexchangeCfg {
    id = 7,
    level = 12,
    icon = 55,
    property = [{0,146,1527}],
    guildlevel = 4,
    cost = 1374,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级1527点"
    };
getRow(7,13)->
    #guildexchangeCfg {
    id = 7,
    level = 13,
    icon = 55,
    property = [{0,146,1717}],
    guildlevel = 4,
    cost = 1495,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级1717点"
    };
getRow(7,14)->
    #guildexchangeCfg {
    id = 7,
    level = 14,
    icon = 55,
    property = [{0,146,1913}],
    guildlevel = 4,
    cost = 1616,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级1913点"
    };
getRow(7,15)->
    #guildexchangeCfg {
    id = 7,
    level = 15,
    icon = 55,
    property = [{0,146,2115}],
    guildlevel = 4,
    cost = 1738,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级2115点"
    };
getRow(7,16)->
    #guildexchangeCfg {
    id = 7,
    level = 16,
    icon = 55,
    property = [{0,146,2323}],
    guildlevel = 4,
    cost = 1859,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级2323点"
    };
getRow(7,17)->
    #guildexchangeCfg {
    id = 7,
    level = 17,
    icon = 55,
    property = [{0,146,2537}],
    guildlevel = 4,
    cost = 1981,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级2537点"
    };
getRow(7,18)->
    #guildexchangeCfg {
    id = 7,
    level = 18,
    icon = 55,
    property = [{0,146,2756}],
    guildlevel = 4,
    cost = 2102,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级2756点"
    };
getRow(7,19)->
    #guildexchangeCfg {
    id = 7,
    level = 19,
    icon = 55,
    property = [{0,146,2980}],
    guildlevel = 4,
    cost = 2223,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级2980点"
    };
getRow(7,20)->
    #guildexchangeCfg {
    id = 7,
    level = 20,
    icon = 55,
    property = [{0,146,3210}],
    guildlevel = 4,
    cost = 2345,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级3210点"
    };
getRow(8,0)->
    #guildexchangeCfg {
    id = 8,
    level = 0,
    icon = 59,
    property = [{0,160,0}],
    guildlevel = 3,
    cost = 0,
    name = "家族坚固等级",
    describe = "尚未学习"
    };
getRow(8,1)->
    #guildexchangeCfg {
    id = 8,
    level = 1,
    icon = 59,
    property = [{0,160,45}],
    guildlevel = 3,
    cost = 100,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级45点"
    };
getRow(8,2)->
    #guildexchangeCfg {
    id = 8,
    level = 2,
    icon = 59,
    property = [{0,160,81}],
    guildlevel = 3,
    cost = 160,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级81点"
    };
getRow(8,3)->
    #guildexchangeCfg {
    id = 8,
    level = 3,
    icon = 59,
    property = [{0,160,139}],
    guildlevel = 3,
    cost = 282,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级139点"
    };
getRow(8,4)->
    #guildexchangeCfg {
    id = 8,
    level = 4,
    icon = 59,
    property = [{0,160,212}],
    guildlevel = 3,
    cost = 403,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级212点"
    };
getRow(8,5)->
    #guildexchangeCfg {
    id = 8,
    level = 5,
    icon = 59,
    property = [{0,160,295}],
    guildlevel = 3,
    cost = 525,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级295点"
    };
getRow(8,6)->
    #guildexchangeCfg {
    id = 8,
    level = 6,
    icon = 59,
    property = [{0,160,386}],
    guildlevel = 3,
    cost = 646,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级386点"
    };
getRow(8,7)->
    #guildexchangeCfg {
    id = 8,
    level = 7,
    icon = 59,
    property = [{0,160,486}],
    guildlevel = 3,
    cost = 767,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级486点"
    };
getRow(8,8)->
    #guildexchangeCfg {
    id = 8,
    level = 8,
    icon = 59,
    property = [{0,160,592}],
    guildlevel = 3,
    cost = 889,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级592点"
    };
getRow(8,9)->
    #guildexchangeCfg {
    id = 8,
    level = 9,
    icon = 59,
    property = [{0,160,704}],
    guildlevel = 3,
    cost = 1010,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级704点"
    };
getRow(8,10)->
    #guildexchangeCfg {
    id = 8,
    level = 10,
    icon = 59,
    property = [{0,160,822}],
    guildlevel = 3,
    cost = 1131,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级822点"
    };
getRow(8,11)->
    #guildexchangeCfg {
    id = 8,
    level = 11,
    icon = 59,
    property = [{0,160,946}],
    guildlevel = 4,
    cost = 1253,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级946点"
    };
getRow(8,12)->
    #guildexchangeCfg {
    id = 8,
    level = 12,
    icon = 59,
    property = [{0,160,1075}],
    guildlevel = 4,
    cost = 1374,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级1075点"
    };
getRow(8,13)->
    #guildexchangeCfg {
    id = 8,
    level = 13,
    icon = 59,
    property = [{0,160,1208}],
    guildlevel = 4,
    cost = 1495,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级1208点"
    };
getRow(8,14)->
    #guildexchangeCfg {
    id = 8,
    level = 14,
    icon = 59,
    property = [{0,160,1346}],
    guildlevel = 4,
    cost = 1616,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级1346点"
    };
getRow(8,15)->
    #guildexchangeCfg {
    id = 8,
    level = 15,
    icon = 59,
    property = [{0,160,1488}],
    guildlevel = 4,
    cost = 1738,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级1488点"
    };
getRow(8,16)->
    #guildexchangeCfg {
    id = 8,
    level = 16,
    icon = 59,
    property = [{0,160,1635}],
    guildlevel = 4,
    cost = 1859,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级1635点"
    };
getRow(8,17)->
    #guildexchangeCfg {
    id = 8,
    level = 17,
    icon = 59,
    property = [{0,160,1785}],
    guildlevel = 4,
    cost = 1981,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级1785点"
    };
getRow(8,18)->
    #guildexchangeCfg {
    id = 8,
    level = 18,
    icon = 59,
    property = [{0,160,1939}],
    guildlevel = 4,
    cost = 2102,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级1939点"
    };
getRow(8,19)->
    #guildexchangeCfg {
    id = 8,
    level = 19,
    icon = 59,
    property = [{0,160,2097}],
    guildlevel = 4,
    cost = 2223,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级2097点"
    };
getRow(8,20)->
    #guildexchangeCfg {
    id = 8,
    level = 20,
    icon = 59,
    property = [{0,160,2259}],
    guildlevel = 4,
    cost = 2345,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级2259点"
    };
getRow(_,_)->[].

getKeyList()->[
    {1,0},
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
    {1,11},
    {1,12},
    {1,13},
    {1,14},
    {1,15},
    {1,16},
    {1,17},
    {1,18},
    {1,19},
    {1,20},
    {2,0},
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
    {2,11},
    {2,12},
    {2,13},
    {2,14},
    {2,15},
    {2,16},
    {2,17},
    {2,18},
    {2,19},
    {2,20},
    {3,0},
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
    {3,11},
    {3,12},
    {3,13},
    {3,14},
    {3,15},
    {3,16},
    {3,17},
    {3,18},
    {3,19},
    {3,20},
    {4,0},
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
    {4,11},
    {4,12},
    {4,13},
    {4,14},
    {4,15},
    {4,16},
    {4,17},
    {4,18},
    {4,19},
    {4,20},
    {5,0},
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
    {5,11},
    {5,12},
    {5,13},
    {5,14},
    {5,15},
    {5,16},
    {5,17},
    {5,18},
    {5,19},
    {5,20},
    {6,0},
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
    {6,11},
    {6,12},
    {6,13},
    {6,14},
    {6,15},
    {6,16},
    {6,17},
    {6,18},
    {6,19},
    {6,20},
    {7,0},
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
    {7,11},
    {7,12},
    {7,13},
    {7,14},
    {7,15},
    {7,16},
    {7,17},
    {7,18},
    {7,19},
    {7,20},
    {8,0},
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
    {8,11},
    {8,12},
    {8,13},
    {8,14},
    {8,15},
    {8,16},
    {8,17},
    {8,18},
    {8,19},
    {8,20}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8
    ].

get2KeyList(1)->[
    0,
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
    16,
    17,
    18,
    19,
    20
    ];
get2KeyList(2)->[
    0,
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
    16,
    17,
    18,
    19,
    20
    ];
get2KeyList(3)->[
    0,
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
    16,
    17,
    18,
    19,
    20
    ];
get2KeyList(4)->[
    0,
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
    16,
    17,
    18,
    19,
    20
    ];
get2KeyList(5)->[
    0,
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
    16,
    17,
    18,
    19,
    20
    ];
get2KeyList(6)->[
    0,
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
    16,
    17,
    18,
    19,
    20
    ];
get2KeyList(7)->[
    0,
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
    16,
    17,
    18,
    19,
    20
    ];
get2KeyList(8)->[
    0,
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
    16,
    17,
    18,
    19,
    20
    ];
get2KeyList(_)->[].

