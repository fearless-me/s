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
    property = [{0,140,95}],
    guildlevel = 1,
    cost = 10,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级95点"
    };
getRow(1,2)->
    #guildexchangeCfg {
    id = 1,
    level = 2,
    icon = 4,
    property = [{0,140,123}],
    guildlevel = 1,
    cost = 16,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级123点"
    };
getRow(1,3)->
    #guildexchangeCfg {
    id = 1,
    level = 3,
    icon = 4,
    property = [{0,140,180}],
    guildlevel = 1,
    cost = 30,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级180点"
    };
getRow(1,4)->
    #guildexchangeCfg {
    id = 1,
    level = 4,
    icon = 4,
    property = [{0,140,257}],
    guildlevel = 1,
    cost = 44,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级257点"
    };
getRow(1,5)->
    #guildexchangeCfg {
    id = 1,
    level = 5,
    icon = 4,
    property = [{0,140,352}],
    guildlevel = 1,
    cost = 57,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级352点"
    };
getRow(1,6)->
    #guildexchangeCfg {
    id = 1,
    level = 6,
    icon = 4,
    property = [{0,140,461}],
    guildlevel = 1,
    cost = 71,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级461点"
    };
getRow(1,7)->
    #guildexchangeCfg {
    id = 1,
    level = 7,
    icon = 4,
    property = [{0,140,585}],
    guildlevel = 1,
    cost = 84,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级585点"
    };
getRow(1,8)->
    #guildexchangeCfg {
    id = 1,
    level = 8,
    icon = 4,
    property = [{0,140,723}],
    guildlevel = 1,
    cost = 98,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级723点"
    };
getRow(1,9)->
    #guildexchangeCfg {
    id = 1,
    level = 9,
    icon = 4,
    property = [{0,140,872}],
    guildlevel = 1,
    cost = 111,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级872点"
    };
getRow(1,10)->
    #guildexchangeCfg {
    id = 1,
    level = 10,
    icon = 4,
    property = [{0,140,1033}],
    guildlevel = 1,
    cost = 125,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级1033点"
    };
getRow(1,11)->
    #guildexchangeCfg {
    id = 1,
    level = 11,
    icon = 4,
    property = [{0,140,1205}],
    guildlevel = 2,
    cost = 138,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级1205点"
    };
getRow(1,12)->
    #guildexchangeCfg {
    id = 1,
    level = 12,
    icon = 4,
    property = [{0,140,1388}],
    guildlevel = 2,
    cost = 152,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级1388点"
    };
getRow(1,13)->
    #guildexchangeCfg {
    id = 1,
    level = 13,
    icon = 4,
    property = [{0,140,1581}],
    guildlevel = 2,
    cost = 165,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级1581点"
    };
getRow(1,14)->
    #guildexchangeCfg {
    id = 1,
    level = 14,
    icon = 4,
    property = [{0,140,1784}],
    guildlevel = 2,
    cost = 179,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级1784点"
    };
getRow(1,15)->
    #guildexchangeCfg {
    id = 1,
    level = 15,
    icon = 4,
    property = [{0,140,1997}],
    guildlevel = 2,
    cost = 192,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级1997点"
    };
getRow(1,16)->
    #guildexchangeCfg {
    id = 1,
    level = 16,
    icon = 4,
    property = [{0,140,2219}],
    guildlevel = 2,
    cost = 206,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级2219点"
    };
getRow(1,17)->
    #guildexchangeCfg {
    id = 1,
    level = 17,
    icon = 4,
    property = [{0,140,2449}],
    guildlevel = 2,
    cost = 219,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级2449点"
    };
getRow(1,18)->
    #guildexchangeCfg {
    id = 1,
    level = 18,
    icon = 4,
    property = [{0,140,2689}],
    guildlevel = 2,
    cost = 233,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级2689点"
    };
getRow(1,19)->
    #guildexchangeCfg {
    id = 1,
    level = 19,
    icon = 4,
    property = [{0,140,2938}],
    guildlevel = 2,
    cost = 246,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级2938点"
    };
getRow(1,20)->
    #guildexchangeCfg {
    id = 1,
    level = 20,
    icon = 4,
    property = [{0,140,3195}],
    guildlevel = 2,
    cost = 259,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级3195点"
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
    property = [{0,141,67}],
    guildlevel = 1,
    cost = 10,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级67点"
    };
getRow(2,2)->
    #guildexchangeCfg {
    id = 2,
    level = 2,
    icon = 5,
    property = [{0,141,87}],
    guildlevel = 1,
    cost = 16,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级87点"
    };
getRow(2,3)->
    #guildexchangeCfg {
    id = 2,
    level = 3,
    icon = 5,
    property = [{0,141,127}],
    guildlevel = 1,
    cost = 30,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级127点"
    };
getRow(2,4)->
    #guildexchangeCfg {
    id = 2,
    level = 4,
    icon = 5,
    property = [{0,141,181}],
    guildlevel = 1,
    cost = 44,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级181点"
    };
getRow(2,5)->
    #guildexchangeCfg {
    id = 2,
    level = 5,
    icon = 5,
    property = [{0,141,248}],
    guildlevel = 1,
    cost = 57,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级248点"
    };
getRow(2,6)->
    #guildexchangeCfg {
    id = 2,
    level = 6,
    icon = 5,
    property = [{0,141,325}],
    guildlevel = 1,
    cost = 71,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级325点"
    };
getRow(2,7)->
    #guildexchangeCfg {
    id = 2,
    level = 7,
    icon = 5,
    property = [{0,141,412}],
    guildlevel = 1,
    cost = 84,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级412点"
    };
getRow(2,8)->
    #guildexchangeCfg {
    id = 2,
    level = 8,
    icon = 5,
    property = [{0,141,509}],
    guildlevel = 1,
    cost = 98,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级509点"
    };
getRow(2,9)->
    #guildexchangeCfg {
    id = 2,
    level = 9,
    icon = 5,
    property = [{0,141,614}],
    guildlevel = 1,
    cost = 111,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级614点"
    };
getRow(2,10)->
    #guildexchangeCfg {
    id = 2,
    level = 10,
    icon = 5,
    property = [{0,141,728}],
    guildlevel = 1,
    cost = 125,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级728点"
    };
getRow(2,11)->
    #guildexchangeCfg {
    id = 2,
    level = 11,
    icon = 5,
    property = [{0,141,849}],
    guildlevel = 2,
    cost = 138,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级849点"
    };
getRow(2,12)->
    #guildexchangeCfg {
    id = 2,
    level = 12,
    icon = 5,
    property = [{0,141,978}],
    guildlevel = 2,
    cost = 152,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级978点"
    };
getRow(2,13)->
    #guildexchangeCfg {
    id = 2,
    level = 13,
    icon = 5,
    property = [{0,141,1114}],
    guildlevel = 2,
    cost = 165,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级1114点"
    };
getRow(2,14)->
    #guildexchangeCfg {
    id = 2,
    level = 14,
    icon = 5,
    property = [{0,141,1257}],
    guildlevel = 2,
    cost = 179,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级1257点"
    };
getRow(2,15)->
    #guildexchangeCfg {
    id = 2,
    level = 15,
    icon = 5,
    property = [{0,141,1407}],
    guildlevel = 2,
    cost = 192,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级1407点"
    };
getRow(2,16)->
    #guildexchangeCfg {
    id = 2,
    level = 16,
    icon = 5,
    property = [{0,141,1563}],
    guildlevel = 2,
    cost = 206,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级1563点"
    };
getRow(2,17)->
    #guildexchangeCfg {
    id = 2,
    level = 17,
    icon = 5,
    property = [{0,141,1726}],
    guildlevel = 2,
    cost = 219,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级1726点"
    };
getRow(2,18)->
    #guildexchangeCfg {
    id = 2,
    level = 18,
    icon = 5,
    property = [{0,141,1895}],
    guildlevel = 2,
    cost = 233,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级1895点"
    };
getRow(2,19)->
    #guildexchangeCfg {
    id = 2,
    level = 19,
    icon = 5,
    property = [{0,141,2070}],
    guildlevel = 2,
    cost = 246,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级2070点"
    };
getRow(2,20)->
    #guildexchangeCfg {
    id = 2,
    level = 20,
    icon = 5,
    property = [{0,141,2251}],
    guildlevel = 2,
    cost = 259,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级2251点"
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
    property = [{0,142,57}],
    guildlevel = 1,
    cost = 10,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级57点"
    };
getRow(3,2)->
    #guildexchangeCfg {
    id = 3,
    level = 2,
    icon = 14,
    property = [{0,142,74}],
    guildlevel = 1,
    cost = 16,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级74点"
    };
getRow(3,3)->
    #guildexchangeCfg {
    id = 3,
    level = 3,
    icon = 14,
    property = [{0,142,109}],
    guildlevel = 1,
    cost = 30,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级109点"
    };
getRow(3,4)->
    #guildexchangeCfg {
    id = 3,
    level = 4,
    icon = 14,
    property = [{0,142,155}],
    guildlevel = 1,
    cost = 44,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级155点"
    };
getRow(3,5)->
    #guildexchangeCfg {
    id = 3,
    level = 5,
    icon = 14,
    property = [{0,142,212}],
    guildlevel = 1,
    cost = 57,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级212点"
    };
getRow(3,6)->
    #guildexchangeCfg {
    id = 3,
    level = 6,
    icon = 14,
    property = [{0,142,279}],
    guildlevel = 1,
    cost = 71,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级279点"
    };
getRow(3,7)->
    #guildexchangeCfg {
    id = 3,
    level = 7,
    icon = 14,
    property = [{0,142,354}],
    guildlevel = 1,
    cost = 84,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级354点"
    };
getRow(3,8)->
    #guildexchangeCfg {
    id = 3,
    level = 8,
    icon = 14,
    property = [{0,142,437}],
    guildlevel = 1,
    cost = 98,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级437点"
    };
getRow(3,9)->
    #guildexchangeCfg {
    id = 3,
    level = 9,
    icon = 14,
    property = [{0,142,527}],
    guildlevel = 1,
    cost = 111,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级527点"
    };
getRow(3,10)->
    #guildexchangeCfg {
    id = 3,
    level = 10,
    icon = 14,
    property = [{0,142,624}],
    guildlevel = 1,
    cost = 125,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级624点"
    };
getRow(3,11)->
    #guildexchangeCfg {
    id = 3,
    level = 11,
    icon = 14,
    property = [{0,142,729}],
    guildlevel = 2,
    cost = 138,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级729点"
    };
getRow(3,12)->
    #guildexchangeCfg {
    id = 3,
    level = 12,
    icon = 14,
    property = [{0,142,839}],
    guildlevel = 2,
    cost = 152,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级839点"
    };
getRow(3,13)->
    #guildexchangeCfg {
    id = 3,
    level = 13,
    icon = 14,
    property = [{0,142,956}],
    guildlevel = 2,
    cost = 165,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级956点"
    };
getRow(3,14)->
    #guildexchangeCfg {
    id = 3,
    level = 14,
    icon = 14,
    property = [{0,142,1079}],
    guildlevel = 2,
    cost = 179,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1079点"
    };
getRow(3,15)->
    #guildexchangeCfg {
    id = 3,
    level = 15,
    icon = 14,
    property = [{0,142,1207}],
    guildlevel = 2,
    cost = 192,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1207点"
    };
getRow(3,16)->
    #guildexchangeCfg {
    id = 3,
    level = 16,
    icon = 14,
    property = [{0,142,1341}],
    guildlevel = 2,
    cost = 206,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1341点"
    };
getRow(3,17)->
    #guildexchangeCfg {
    id = 3,
    level = 17,
    icon = 14,
    property = [{0,142,1481}],
    guildlevel = 2,
    cost = 219,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1481点"
    };
getRow(3,18)->
    #guildexchangeCfg {
    id = 3,
    level = 18,
    icon = 14,
    property = [{0,142,1626}],
    guildlevel = 2,
    cost = 233,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1626点"
    };
getRow(3,19)->
    #guildexchangeCfg {
    id = 3,
    level = 19,
    icon = 14,
    property = [{0,142,1776}],
    guildlevel = 2,
    cost = 246,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1776点"
    };
getRow(3,20)->
    #guildexchangeCfg {
    id = 3,
    level = 20,
    icon = 14,
    property = [{0,142,1932}],
    guildlevel = 2,
    cost = 259,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1932点"
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
    property = [{0,143,49}],
    guildlevel = 2,
    cost = 10,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级49点"
    };
getRow(4,2)->
    #guildexchangeCfg {
    id = 4,
    level = 2,
    icon = 17,
    property = [{0,143,63}],
    guildlevel = 2,
    cost = 16,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级63点"
    };
getRow(4,3)->
    #guildexchangeCfg {
    id = 4,
    level = 3,
    icon = 17,
    property = [{0,143,92}],
    guildlevel = 2,
    cost = 30,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级92点"
    };
getRow(4,4)->
    #guildexchangeCfg {
    id = 4,
    level = 4,
    icon = 17,
    property = [{0,143,131}],
    guildlevel = 2,
    cost = 44,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级131点"
    };
getRow(4,5)->
    #guildexchangeCfg {
    id = 4,
    level = 5,
    icon = 17,
    property = [{0,143,180}],
    guildlevel = 2,
    cost = 57,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级180点"
    };
getRow(4,6)->
    #guildexchangeCfg {
    id = 4,
    level = 6,
    icon = 17,
    property = [{0,143,236}],
    guildlevel = 2,
    cost = 71,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级236点"
    };
getRow(4,7)->
    #guildexchangeCfg {
    id = 4,
    level = 7,
    icon = 17,
    property = [{0,143,299}],
    guildlevel = 2,
    cost = 84,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级299点"
    };
getRow(4,8)->
    #guildexchangeCfg {
    id = 4,
    level = 8,
    icon = 17,
    property = [{0,143,369}],
    guildlevel = 2,
    cost = 98,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级369点"
    };
getRow(4,9)->
    #guildexchangeCfg {
    id = 4,
    level = 9,
    icon = 17,
    property = [{0,143,446}],
    guildlevel = 2,
    cost = 111,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级446点"
    };
getRow(4,10)->
    #guildexchangeCfg {
    id = 4,
    level = 10,
    icon = 17,
    property = [{0,143,528}],
    guildlevel = 2,
    cost = 125,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级528点"
    };
getRow(4,11)->
    #guildexchangeCfg {
    id = 4,
    level = 11,
    icon = 17,
    property = [{0,143,616}],
    guildlevel = 3,
    cost = 138,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级616点"
    };
getRow(4,12)->
    #guildexchangeCfg {
    id = 4,
    level = 12,
    icon = 17,
    property = [{0,143,710}],
    guildlevel = 3,
    cost = 152,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级710点"
    };
getRow(4,13)->
    #guildexchangeCfg {
    id = 4,
    level = 13,
    icon = 17,
    property = [{0,143,809}],
    guildlevel = 3,
    cost = 165,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级809点"
    };
getRow(4,14)->
    #guildexchangeCfg {
    id = 4,
    level = 14,
    icon = 17,
    property = [{0,143,913}],
    guildlevel = 3,
    cost = 179,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级913点"
    };
getRow(4,15)->
    #guildexchangeCfg {
    id = 4,
    level = 15,
    icon = 17,
    property = [{0,143,1021}],
    guildlevel = 3,
    cost = 192,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级1021点"
    };
getRow(4,16)->
    #guildexchangeCfg {
    id = 4,
    level = 16,
    icon = 17,
    property = [{0,143,1135}],
    guildlevel = 3,
    cost = 206,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级1135点"
    };
getRow(4,17)->
    #guildexchangeCfg {
    id = 4,
    level = 17,
    icon = 17,
    property = [{0,143,1253}],
    guildlevel = 3,
    cost = 219,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级1253点"
    };
getRow(4,18)->
    #guildexchangeCfg {
    id = 4,
    level = 18,
    icon = 17,
    property = [{0,143,1376}],
    guildlevel = 3,
    cost = 233,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级1376点"
    };
getRow(4,19)->
    #guildexchangeCfg {
    id = 4,
    level = 19,
    icon = 17,
    property = [{0,143,1503}],
    guildlevel = 3,
    cost = 246,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级1503点"
    };
getRow(4,20)->
    #guildexchangeCfg {
    id = 4,
    level = 20,
    icon = 17,
    property = [{0,143,1634}],
    guildlevel = 3,
    cost = 259,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级1634点"
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
    property = [{0,144,50}],
    guildlevel = 2,
    cost = 10,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级50点"
    };
getRow(5,2)->
    #guildexchangeCfg {
    id = 5,
    level = 2,
    icon = 46,
    property = [{0,144,65}],
    guildlevel = 2,
    cost = 16,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级65点"
    };
getRow(5,3)->
    #guildexchangeCfg {
    id = 5,
    level = 3,
    icon = 46,
    property = [{0,144,94}],
    guildlevel = 2,
    cost = 30,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级94点"
    };
getRow(5,4)->
    #guildexchangeCfg {
    id = 5,
    level = 4,
    icon = 46,
    property = [{0,144,135}],
    guildlevel = 2,
    cost = 44,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级135点"
    };
getRow(5,5)->
    #guildexchangeCfg {
    id = 5,
    level = 5,
    icon = 46,
    property = [{0,144,185}],
    guildlevel = 2,
    cost = 57,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级185点"
    };
getRow(5,6)->
    #guildexchangeCfg {
    id = 5,
    level = 6,
    icon = 46,
    property = [{0,144,243}],
    guildlevel = 2,
    cost = 71,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级243点"
    };
getRow(5,7)->
    #guildexchangeCfg {
    id = 5,
    level = 7,
    icon = 46,
    property = [{0,144,308}],
    guildlevel = 2,
    cost = 84,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级308点"
    };
getRow(5,8)->
    #guildexchangeCfg {
    id = 5,
    level = 8,
    icon = 46,
    property = [{0,144,380}],
    guildlevel = 2,
    cost = 98,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级380点"
    };
getRow(5,9)->
    #guildexchangeCfg {
    id = 5,
    level = 9,
    icon = 46,
    property = [{0,144,459}],
    guildlevel = 2,
    cost = 111,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级459点"
    };
getRow(5,10)->
    #guildexchangeCfg {
    id = 5,
    level = 10,
    icon = 46,
    property = [{0,144,544}],
    guildlevel = 2,
    cost = 125,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级544点"
    };
getRow(5,11)->
    #guildexchangeCfg {
    id = 5,
    level = 11,
    icon = 46,
    property = [{0,144,634}],
    guildlevel = 3,
    cost = 138,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级634点"
    };
getRow(5,12)->
    #guildexchangeCfg {
    id = 5,
    level = 12,
    icon = 46,
    property = [{0,144,731}],
    guildlevel = 3,
    cost = 152,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级731点"
    };
getRow(5,13)->
    #guildexchangeCfg {
    id = 5,
    level = 13,
    icon = 46,
    property = [{0,144,832}],
    guildlevel = 3,
    cost = 165,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级832点"
    };
getRow(5,14)->
    #guildexchangeCfg {
    id = 5,
    level = 14,
    icon = 46,
    property = [{0,144,939}],
    guildlevel = 3,
    cost = 179,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级939点"
    };
getRow(5,15)->
    #guildexchangeCfg {
    id = 5,
    level = 15,
    icon = 46,
    property = [{0,144,1051}],
    guildlevel = 3,
    cost = 192,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级1051点"
    };
getRow(5,16)->
    #guildexchangeCfg {
    id = 5,
    level = 16,
    icon = 46,
    property = [{0,144,1168}],
    guildlevel = 3,
    cost = 206,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级1168点"
    };
getRow(5,17)->
    #guildexchangeCfg {
    id = 5,
    level = 17,
    icon = 46,
    property = [{0,144,1290}],
    guildlevel = 3,
    cost = 219,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级1290点"
    };
getRow(5,18)->
    #guildexchangeCfg {
    id = 5,
    level = 18,
    icon = 46,
    property = [{0,144,1416}],
    guildlevel = 3,
    cost = 233,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级1416点"
    };
getRow(5,19)->
    #guildexchangeCfg {
    id = 5,
    level = 19,
    icon = 46,
    property = [{0,144,1547}],
    guildlevel = 3,
    cost = 246,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级1547点"
    };
getRow(5,20)->
    #guildexchangeCfg {
    id = 5,
    level = 20,
    icon = 46,
    property = [{0,144,1682}],
    guildlevel = 3,
    cost = 259,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级1682点"
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
    property = [{0,145,72}],
    guildlevel = 2,
    cost = 10,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级72点"
    };
getRow(6,2)->
    #guildexchangeCfg {
    id = 6,
    level = 2,
    icon = 54,
    property = [{0,145,93}],
    guildlevel = 2,
    cost = 16,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级93点"
    };
getRow(6,3)->
    #guildexchangeCfg {
    id = 6,
    level = 3,
    icon = 54,
    property = [{0,145,135}],
    guildlevel = 2,
    cost = 30,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级135点"
    };
getRow(6,4)->
    #guildexchangeCfg {
    id = 6,
    level = 4,
    icon = 54,
    property = [{0,145,194}],
    guildlevel = 2,
    cost = 44,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级194点"
    };
getRow(6,5)->
    #guildexchangeCfg {
    id = 6,
    level = 5,
    icon = 54,
    property = [{0,145,265}],
    guildlevel = 2,
    cost = 57,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级265点"
    };
getRow(6,6)->
    #guildexchangeCfg {
    id = 6,
    level = 6,
    icon = 54,
    property = [{0,145,348}],
    guildlevel = 2,
    cost = 71,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级348点"
    };
getRow(6,7)->
    #guildexchangeCfg {
    id = 6,
    level = 7,
    icon = 54,
    property = [{0,145,441}],
    guildlevel = 2,
    cost = 84,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级441点"
    };
getRow(6,8)->
    #guildexchangeCfg {
    id = 6,
    level = 8,
    icon = 54,
    property = [{0,145,544}],
    guildlevel = 2,
    cost = 98,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级544点"
    };
getRow(6,9)->
    #guildexchangeCfg {
    id = 6,
    level = 9,
    icon = 54,
    property = [{0,145,657}],
    guildlevel = 2,
    cost = 111,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级657点"
    };
getRow(6,10)->
    #guildexchangeCfg {
    id = 6,
    level = 10,
    icon = 54,
    property = [{0,145,778}],
    guildlevel = 2,
    cost = 125,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级778点"
    };
getRow(6,11)->
    #guildexchangeCfg {
    id = 6,
    level = 11,
    icon = 54,
    property = [{0,145,908}],
    guildlevel = 3,
    cost = 138,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级908点"
    };
getRow(6,12)->
    #guildexchangeCfg {
    id = 6,
    level = 12,
    icon = 54,
    property = [{0,145,1046}],
    guildlevel = 3,
    cost = 152,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级1046点"
    };
getRow(6,13)->
    #guildexchangeCfg {
    id = 6,
    level = 13,
    icon = 54,
    property = [{0,145,1191}],
    guildlevel = 3,
    cost = 165,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级1191点"
    };
getRow(6,14)->
    #guildexchangeCfg {
    id = 6,
    level = 14,
    icon = 54,
    property = [{0,145,1344}],
    guildlevel = 3,
    cost = 179,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级1344点"
    };
getRow(6,15)->
    #guildexchangeCfg {
    id = 6,
    level = 15,
    icon = 54,
    property = [{0,145,1504}],
    guildlevel = 3,
    cost = 192,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级1504点"
    };
getRow(6,16)->
    #guildexchangeCfg {
    id = 6,
    level = 16,
    icon = 54,
    property = [{0,145,1672}],
    guildlevel = 3,
    cost = 206,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级1672点"
    };
getRow(6,17)->
    #guildexchangeCfg {
    id = 6,
    level = 17,
    icon = 54,
    property = [{0,145,1846}],
    guildlevel = 3,
    cost = 219,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级1846点"
    };
getRow(6,18)->
    #guildexchangeCfg {
    id = 6,
    level = 18,
    icon = 54,
    property = [{0,145,2026}],
    guildlevel = 3,
    cost = 233,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级2026点"
    };
getRow(6,19)->
    #guildexchangeCfg {
    id = 6,
    level = 19,
    icon = 54,
    property = [{0,145,2213}],
    guildlevel = 3,
    cost = 246,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级2213点"
    };
getRow(6,20)->
    #guildexchangeCfg {
    id = 6,
    level = 20,
    icon = 54,
    property = [{0,145,2407}],
    guildlevel = 3,
    cost = 259,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级2407点"
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
    property = [{0,146,48}],
    guildlevel = 3,
    cost = 10,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级48点"
    };
getRow(7,2)->
    #guildexchangeCfg {
    id = 7,
    level = 2,
    icon = 55,
    property = [{0,146,62}],
    guildlevel = 3,
    cost = 16,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级62点"
    };
getRow(7,3)->
    #guildexchangeCfg {
    id = 7,
    level = 3,
    icon = 55,
    property = [{0,146,90}],
    guildlevel = 3,
    cost = 30,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级90点"
    };
getRow(7,4)->
    #guildexchangeCfg {
    id = 7,
    level = 4,
    icon = 55,
    property = [{0,146,129}],
    guildlevel = 3,
    cost = 44,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级129点"
    };
getRow(7,5)->
    #guildexchangeCfg {
    id = 7,
    level = 5,
    icon = 55,
    property = [{0,146,176}],
    guildlevel = 3,
    cost = 57,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级176点"
    };
getRow(7,6)->
    #guildexchangeCfg {
    id = 7,
    level = 6,
    icon = 55,
    property = [{0,146,232}],
    guildlevel = 3,
    cost = 71,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级232点"
    };
getRow(7,7)->
    #guildexchangeCfg {
    id = 7,
    level = 7,
    icon = 55,
    property = [{0,146,294}],
    guildlevel = 3,
    cost = 84,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级294点"
    };
getRow(7,8)->
    #guildexchangeCfg {
    id = 7,
    level = 8,
    icon = 55,
    property = [{0,146,363}],
    guildlevel = 3,
    cost = 98,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级363点"
    };
getRow(7,9)->
    #guildexchangeCfg {
    id = 7,
    level = 9,
    icon = 55,
    property = [{0,146,438}],
    guildlevel = 3,
    cost = 111,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级438点"
    };
getRow(7,10)->
    #guildexchangeCfg {
    id = 7,
    level = 10,
    icon = 55,
    property = [{0,146,519}],
    guildlevel = 3,
    cost = 125,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级519点"
    };
getRow(7,11)->
    #guildexchangeCfg {
    id = 7,
    level = 11,
    icon = 55,
    property = [{0,146,605}],
    guildlevel = 4,
    cost = 138,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级605点"
    };
getRow(7,12)->
    #guildexchangeCfg {
    id = 7,
    level = 12,
    icon = 55,
    property = [{0,146,697}],
    guildlevel = 4,
    cost = 152,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级697点"
    };
getRow(7,13)->
    #guildexchangeCfg {
    id = 7,
    level = 13,
    icon = 55,
    property = [{0,146,794}],
    guildlevel = 4,
    cost = 165,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级794点"
    };
getRow(7,14)->
    #guildexchangeCfg {
    id = 7,
    level = 14,
    icon = 55,
    property = [{0,146,896}],
    guildlevel = 4,
    cost = 179,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级896点"
    };
getRow(7,15)->
    #guildexchangeCfg {
    id = 7,
    level = 15,
    icon = 55,
    property = [{0,146,1003}],
    guildlevel = 4,
    cost = 192,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级1003点"
    };
getRow(7,16)->
    #guildexchangeCfg {
    id = 7,
    level = 16,
    icon = 55,
    property = [{0,146,1114}],
    guildlevel = 4,
    cost = 206,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级1114点"
    };
getRow(7,17)->
    #guildexchangeCfg {
    id = 7,
    level = 17,
    icon = 55,
    property = [{0,146,1230}],
    guildlevel = 4,
    cost = 219,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级1230点"
    };
getRow(7,18)->
    #guildexchangeCfg {
    id = 7,
    level = 18,
    icon = 55,
    property = [{0,146,1351}],
    guildlevel = 4,
    cost = 233,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级1351点"
    };
getRow(7,19)->
    #guildexchangeCfg {
    id = 7,
    level = 19,
    icon = 55,
    property = [{0,146,1475}],
    guildlevel = 4,
    cost = 246,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级1475点"
    };
getRow(7,20)->
    #guildexchangeCfg {
    id = 7,
    level = 20,
    icon = 55,
    property = [{0,146,1605}],
    guildlevel = 4,
    cost = 259,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级1605点"
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
    property = [{0,160,33}],
    guildlevel = 3,
    cost = 10,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级33点"
    };
getRow(8,2)->
    #guildexchangeCfg {
    id = 8,
    level = 2,
    icon = 59,
    property = [{0,160,43}],
    guildlevel = 3,
    cost = 16,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级43点"
    };
getRow(8,3)->
    #guildexchangeCfg {
    id = 8,
    level = 3,
    icon = 59,
    property = [{0,160,63}],
    guildlevel = 3,
    cost = 30,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级63点"
    };
getRow(8,4)->
    #guildexchangeCfg {
    id = 8,
    level = 4,
    icon = 59,
    property = [{0,160,91}],
    guildlevel = 3,
    cost = 44,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级91点"
    };
getRow(8,5)->
    #guildexchangeCfg {
    id = 8,
    level = 5,
    icon = 59,
    property = [{0,160,124}],
    guildlevel = 3,
    cost = 57,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级124点"
    };
getRow(8,6)->
    #guildexchangeCfg {
    id = 8,
    level = 6,
    icon = 59,
    property = [{0,160,163}],
    guildlevel = 3,
    cost = 71,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级163点"
    };
getRow(8,7)->
    #guildexchangeCfg {
    id = 8,
    level = 7,
    icon = 59,
    property = [{0,160,207}],
    guildlevel = 3,
    cost = 84,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级207点"
    };
getRow(8,8)->
    #guildexchangeCfg {
    id = 8,
    level = 8,
    icon = 59,
    property = [{0,160,255}],
    guildlevel = 3,
    cost = 98,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级255点"
    };
getRow(8,9)->
    #guildexchangeCfg {
    id = 8,
    level = 9,
    icon = 59,
    property = [{0,160,308}],
    guildlevel = 3,
    cost = 111,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级308点"
    };
getRow(8,10)->
    #guildexchangeCfg {
    id = 8,
    level = 10,
    icon = 59,
    property = [{0,160,365}],
    guildlevel = 3,
    cost = 125,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级365点"
    };
getRow(8,11)->
    #guildexchangeCfg {
    id = 8,
    level = 11,
    icon = 59,
    property = [{0,160,426}],
    guildlevel = 4,
    cost = 138,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级426点"
    };
getRow(8,12)->
    #guildexchangeCfg {
    id = 8,
    level = 12,
    icon = 59,
    property = [{0,160,490}],
    guildlevel = 4,
    cost = 152,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级490点"
    };
getRow(8,13)->
    #guildexchangeCfg {
    id = 8,
    level = 13,
    icon = 59,
    property = [{0,160,559}],
    guildlevel = 4,
    cost = 165,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级559点"
    };
getRow(8,14)->
    #guildexchangeCfg {
    id = 8,
    level = 14,
    icon = 59,
    property = [{0,160,630}],
    guildlevel = 4,
    cost = 179,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级630点"
    };
getRow(8,15)->
    #guildexchangeCfg {
    id = 8,
    level = 15,
    icon = 59,
    property = [{0,160,706}],
    guildlevel = 4,
    cost = 192,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级706点"
    };
getRow(8,16)->
    #guildexchangeCfg {
    id = 8,
    level = 16,
    icon = 59,
    property = [{0,160,784}],
    guildlevel = 4,
    cost = 206,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级784点"
    };
getRow(8,17)->
    #guildexchangeCfg {
    id = 8,
    level = 17,
    icon = 59,
    property = [{0,160,866}],
    guildlevel = 4,
    cost = 219,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级866点"
    };
getRow(8,18)->
    #guildexchangeCfg {
    id = 8,
    level = 18,
    icon = 59,
    property = [{0,160,950}],
    guildlevel = 4,
    cost = 233,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级950点"
    };
getRow(8,19)->
    #guildexchangeCfg {
    id = 8,
    level = 19,
    icon = 59,
    property = [{0,160,1038}],
    guildlevel = 4,
    cost = 246,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级1038点"
    };
getRow(8,20)->
    #guildexchangeCfg {
    id = 8,
    level = 20,
    icon = 59,
    property = [{0,160,1129}],
    guildlevel = 4,
    cost = 259,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级1129点"
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

