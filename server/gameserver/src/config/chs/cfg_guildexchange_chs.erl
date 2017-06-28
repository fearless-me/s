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
    property = [{0,140,63}],
    guildlevel = 1,
    cost = 10,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级63点"
    };
getRow(1,2)->
    #guildexchangeCfg {
    id = 1,
    level = 2,
    icon = 4,
    property = [{0,140,114}],
    guildlevel = 1,
    cost = 16,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级114点"
    };
getRow(1,3)->
    #guildexchangeCfg {
    id = 1,
    level = 3,
    icon = 4,
    property = [{0,140,197}],
    guildlevel = 1,
    cost = 30,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级197点"
    };
getRow(1,4)->
    #guildexchangeCfg {
    id = 1,
    level = 4,
    icon = 4,
    property = [{0,140,300}],
    guildlevel = 1,
    cost = 44,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级300点"
    };
getRow(1,5)->
    #guildexchangeCfg {
    id = 1,
    level = 5,
    icon = 4,
    property = [{0,140,417}],
    guildlevel = 1,
    cost = 57,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级417点"
    };
getRow(1,6)->
    #guildexchangeCfg {
    id = 1,
    level = 6,
    icon = 4,
    property = [{0,140,546}],
    guildlevel = 1,
    cost = 71,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级546点"
    };
getRow(1,7)->
    #guildexchangeCfg {
    id = 1,
    level = 7,
    icon = 4,
    property = [{0,140,687}],
    guildlevel = 1,
    cost = 84,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级687点"
    };
getRow(1,8)->
    #guildexchangeCfg {
    id = 1,
    level = 8,
    icon = 4,
    property = [{0,140,837}],
    guildlevel = 1,
    cost = 98,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级837点"
    };
getRow(1,9)->
    #guildexchangeCfg {
    id = 1,
    level = 9,
    icon = 4,
    property = [{0,140,996}],
    guildlevel = 1,
    cost = 111,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级996点"
    };
getRow(1,10)->
    #guildexchangeCfg {
    id = 1,
    level = 10,
    icon = 4,
    property = [{0,140,1163}],
    guildlevel = 1,
    cost = 125,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级1163点"
    };
getRow(1,11)->
    #guildexchangeCfg {
    id = 1,
    level = 11,
    icon = 4,
    property = [{0,140,1338}],
    guildlevel = 2,
    cost = 138,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级1338点"
    };
getRow(1,12)->
    #guildexchangeCfg {
    id = 1,
    level = 12,
    icon = 4,
    property = [{0,140,1520}],
    guildlevel = 2,
    cost = 152,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级1520点"
    };
getRow(1,13)->
    #guildexchangeCfg {
    id = 1,
    level = 13,
    icon = 4,
    property = [{0,140,1709}],
    guildlevel = 2,
    cost = 165,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级1709点"
    };
getRow(1,14)->
    #guildexchangeCfg {
    id = 1,
    level = 14,
    icon = 4,
    property = [{0,140,1904}],
    guildlevel = 2,
    cost = 179,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级1904点"
    };
getRow(1,15)->
    #guildexchangeCfg {
    id = 1,
    level = 15,
    icon = 4,
    property = [{0,140,2105}],
    guildlevel = 2,
    cost = 192,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级2105点"
    };
getRow(1,16)->
    #guildexchangeCfg {
    id = 1,
    level = 16,
    icon = 4,
    property = [{0,140,2312}],
    guildlevel = 2,
    cost = 206,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级2312点"
    };
getRow(1,17)->
    #guildexchangeCfg {
    id = 1,
    level = 17,
    icon = 4,
    property = [{0,140,2525}],
    guildlevel = 2,
    cost = 219,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级2525点"
    };
getRow(1,18)->
    #guildexchangeCfg {
    id = 1,
    level = 18,
    icon = 4,
    property = [{0,140,2743}],
    guildlevel = 2,
    cost = 233,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级2743点"
    };
getRow(1,19)->
    #guildexchangeCfg {
    id = 1,
    level = 19,
    icon = 4,
    property = [{0,140,2966}],
    guildlevel = 2,
    cost = 246,
    name = "家族暴击等级",
    describe = "技能效果：角色增加暴击等级2966点"
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
    property = [{0,141,45}],
    guildlevel = 1,
    cost = 10,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级45点"
    };
getRow(2,2)->
    #guildexchangeCfg {
    id = 2,
    level = 2,
    icon = 5,
    property = [{0,141,80}],
    guildlevel = 1,
    cost = 16,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级80点"
    };
getRow(2,3)->
    #guildexchangeCfg {
    id = 2,
    level = 3,
    icon = 5,
    property = [{0,141,139}],
    guildlevel = 1,
    cost = 30,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级139点"
    };
getRow(2,4)->
    #guildexchangeCfg {
    id = 2,
    level = 4,
    icon = 5,
    property = [{0,141,211}],
    guildlevel = 1,
    cost = 44,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级211点"
    };
getRow(2,5)->
    #guildexchangeCfg {
    id = 2,
    level = 5,
    icon = 5,
    property = [{0,141,294}],
    guildlevel = 1,
    cost = 57,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级294点"
    };
getRow(2,6)->
    #guildexchangeCfg {
    id = 2,
    level = 6,
    icon = 5,
    property = [{0,141,385}],
    guildlevel = 1,
    cost = 71,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级385点"
    };
getRow(2,7)->
    #guildexchangeCfg {
    id = 2,
    level = 7,
    icon = 5,
    property = [{0,141,484}],
    guildlevel = 1,
    cost = 84,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级484点"
    };
getRow(2,8)->
    #guildexchangeCfg {
    id = 2,
    level = 8,
    icon = 5,
    property = [{0,141,590}],
    guildlevel = 1,
    cost = 98,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级590点"
    };
getRow(2,9)->
    #guildexchangeCfg {
    id = 2,
    level = 9,
    icon = 5,
    property = [{0,141,702}],
    guildlevel = 1,
    cost = 111,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级702点"
    };
getRow(2,10)->
    #guildexchangeCfg {
    id = 2,
    level = 10,
    icon = 5,
    property = [{0,141,820}],
    guildlevel = 1,
    cost = 125,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级820点"
    };
getRow(2,11)->
    #guildexchangeCfg {
    id = 2,
    level = 11,
    icon = 5,
    property = [{0,141,943}],
    guildlevel = 2,
    cost = 138,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级943点"
    };
getRow(2,12)->
    #guildexchangeCfg {
    id = 2,
    level = 12,
    icon = 5,
    property = [{0,141,1071}],
    guildlevel = 2,
    cost = 152,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级1071点"
    };
getRow(2,13)->
    #guildexchangeCfg {
    id = 2,
    level = 13,
    icon = 5,
    property = [{0,141,1204}],
    guildlevel = 2,
    cost = 165,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级1204点"
    };
getRow(2,14)->
    #guildexchangeCfg {
    id = 2,
    level = 14,
    icon = 5,
    property = [{0,141,1342}],
    guildlevel = 2,
    cost = 179,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级1342点"
    };
getRow(2,15)->
    #guildexchangeCfg {
    id = 2,
    level = 15,
    icon = 5,
    property = [{0,141,1483}],
    guildlevel = 2,
    cost = 192,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级1483点"
    };
getRow(2,16)->
    #guildexchangeCfg {
    id = 2,
    level = 16,
    icon = 5,
    property = [{0,141,1629}],
    guildlevel = 2,
    cost = 206,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级1629点"
    };
getRow(2,17)->
    #guildexchangeCfg {
    id = 2,
    level = 17,
    icon = 5,
    property = [{0,141,1779}],
    guildlevel = 2,
    cost = 219,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级1779点"
    };
getRow(2,18)->
    #guildexchangeCfg {
    id = 2,
    level = 18,
    icon = 5,
    property = [{0,141,1933}],
    guildlevel = 2,
    cost = 233,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级1933点"
    };
getRow(2,19)->
    #guildexchangeCfg {
    id = 2,
    level = 19,
    icon = 5,
    property = [{0,141,2090}],
    guildlevel = 2,
    cost = 246,
    name = "家族抗暴等级",
    describe = "技能效果：角色增加抗暴等级2090点"
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
    property = [{0,142,38}],
    guildlevel = 1,
    cost = 10,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级38点"
    };
getRow(3,2)->
    #guildexchangeCfg {
    id = 3,
    level = 2,
    icon = 14,
    property = [{0,142,69}],
    guildlevel = 1,
    cost = 16,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级69点"
    };
getRow(3,3)->
    #guildexchangeCfg {
    id = 3,
    level = 3,
    icon = 14,
    property = [{0,142,119}],
    guildlevel = 1,
    cost = 30,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级119点"
    };
getRow(3,4)->
    #guildexchangeCfg {
    id = 3,
    level = 4,
    icon = 14,
    property = [{0,142,181}],
    guildlevel = 1,
    cost = 44,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级181点"
    };
getRow(3,5)->
    #guildexchangeCfg {
    id = 3,
    level = 5,
    icon = 14,
    property = [{0,142,252}],
    guildlevel = 1,
    cost = 57,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级252点"
    };
getRow(3,6)->
    #guildexchangeCfg {
    id = 3,
    level = 6,
    icon = 14,
    property = [{0,142,330}],
    guildlevel = 1,
    cost = 71,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级330点"
    };
getRow(3,7)->
    #guildexchangeCfg {
    id = 3,
    level = 7,
    icon = 14,
    property = [{0,142,415}],
    guildlevel = 1,
    cost = 84,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级415点"
    };
getRow(3,8)->
    #guildexchangeCfg {
    id = 3,
    level = 8,
    icon = 14,
    property = [{0,142,506}],
    guildlevel = 1,
    cost = 98,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级506点"
    };
getRow(3,9)->
    #guildexchangeCfg {
    id = 3,
    level = 9,
    icon = 14,
    property = [{0,142,602}],
    guildlevel = 1,
    cost = 111,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级602点"
    };
getRow(3,10)->
    #guildexchangeCfg {
    id = 3,
    level = 10,
    icon = 14,
    property = [{0,142,703}],
    guildlevel = 1,
    cost = 125,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级703点"
    };
getRow(3,11)->
    #guildexchangeCfg {
    id = 3,
    level = 11,
    icon = 14,
    property = [{0,142,809}],
    guildlevel = 2,
    cost = 138,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级809点"
    };
getRow(3,12)->
    #guildexchangeCfg {
    id = 3,
    level = 12,
    icon = 14,
    property = [{0,142,919}],
    guildlevel = 2,
    cost = 152,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级919点"
    };
getRow(3,13)->
    #guildexchangeCfg {
    id = 3,
    level = 13,
    icon = 14,
    property = [{0,142,1033}],
    guildlevel = 2,
    cost = 165,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1033点"
    };
getRow(3,14)->
    #guildexchangeCfg {
    id = 3,
    level = 14,
    icon = 14,
    property = [{0,142,1151}],
    guildlevel = 2,
    cost = 179,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1151点"
    };
getRow(3,15)->
    #guildexchangeCfg {
    id = 3,
    level = 15,
    icon = 14,
    property = [{0,142,1273}],
    guildlevel = 2,
    cost = 192,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1273点"
    };
getRow(3,16)->
    #guildexchangeCfg {
    id = 3,
    level = 16,
    icon = 14,
    property = [{0,142,1398}],
    guildlevel = 2,
    cost = 206,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1398点"
    };
getRow(3,17)->
    #guildexchangeCfg {
    id = 3,
    level = 17,
    icon = 14,
    property = [{0,142,1527}],
    guildlevel = 2,
    cost = 219,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1527点"
    };
getRow(3,18)->
    #guildexchangeCfg {
    id = 3,
    level = 18,
    icon = 14,
    property = [{0,142,1658}],
    guildlevel = 2,
    cost = 233,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1658点"
    };
getRow(3,19)->
    #guildexchangeCfg {
    id = 3,
    level = 19,
    icon = 14,
    property = [{0,142,1793}],
    guildlevel = 2,
    cost = 246,
    name = "家族爆伤等级",
    describe = "技能效果：角色增加爆伤等级1793点"
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
    property = [{0,143,32}],
    guildlevel = 2,
    cost = 10,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级32点"
    };
getRow(4,2)->
    #guildexchangeCfg {
    id = 4,
    level = 2,
    icon = 17,
    property = [{0,143,58}],
    guildlevel = 2,
    cost = 16,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级58点"
    };
getRow(4,3)->
    #guildexchangeCfg {
    id = 4,
    level = 3,
    icon = 17,
    property = [{0,143,101}],
    guildlevel = 2,
    cost = 30,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级101点"
    };
getRow(4,4)->
    #guildexchangeCfg {
    id = 4,
    level = 4,
    icon = 17,
    property = [{0,143,153}],
    guildlevel = 2,
    cost = 44,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级153点"
    };
getRow(4,5)->
    #guildexchangeCfg {
    id = 4,
    level = 5,
    icon = 17,
    property = [{0,143,213}],
    guildlevel = 2,
    cost = 57,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级213点"
    };
getRow(4,6)->
    #guildexchangeCfg {
    id = 4,
    level = 6,
    icon = 17,
    property = [{0,143,279}],
    guildlevel = 2,
    cost = 71,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级279点"
    };
getRow(4,7)->
    #guildexchangeCfg {
    id = 4,
    level = 7,
    icon = 17,
    property = [{0,143,351}],
    guildlevel = 2,
    cost = 84,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级351点"
    };
getRow(4,8)->
    #guildexchangeCfg {
    id = 4,
    level = 8,
    icon = 17,
    property = [{0,143,428}],
    guildlevel = 2,
    cost = 98,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级428点"
    };
getRow(4,9)->
    #guildexchangeCfg {
    id = 4,
    level = 9,
    icon = 17,
    property = [{0,143,509}],
    guildlevel = 2,
    cost = 111,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级509点"
    };
getRow(4,10)->
    #guildexchangeCfg {
    id = 4,
    level = 10,
    icon = 17,
    property = [{0,143,595}],
    guildlevel = 2,
    cost = 125,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级595点"
    };
getRow(4,11)->
    #guildexchangeCfg {
    id = 4,
    level = 11,
    icon = 17,
    property = [{0,143,684}],
    guildlevel = 3,
    cost = 138,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级684点"
    };
getRow(4,12)->
    #guildexchangeCfg {
    id = 4,
    level = 12,
    icon = 17,
    property = [{0,143,778}],
    guildlevel = 3,
    cost = 152,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级778点"
    };
getRow(4,13)->
    #guildexchangeCfg {
    id = 4,
    level = 13,
    icon = 17,
    property = [{0,143,874}],
    guildlevel = 3,
    cost = 165,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级874点"
    };
getRow(4,14)->
    #guildexchangeCfg {
    id = 4,
    level = 14,
    icon = 17,
    property = [{0,143,974}],
    guildlevel = 3,
    cost = 179,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级974点"
    };
getRow(4,15)->
    #guildexchangeCfg {
    id = 4,
    level = 15,
    icon = 17,
    property = [{0,143,1077}],
    guildlevel = 3,
    cost = 192,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级1077点"
    };
getRow(4,16)->
    #guildexchangeCfg {
    id = 4,
    level = 16,
    icon = 17,
    property = [{0,143,1183}],
    guildlevel = 3,
    cost = 206,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级1183点"
    };
getRow(4,17)->
    #guildexchangeCfg {
    id = 4,
    level = 17,
    icon = 17,
    property = [{0,143,1292}],
    guildlevel = 3,
    cost = 219,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级1292点"
    };
getRow(4,18)->
    #guildexchangeCfg {
    id = 4,
    level = 18,
    icon = 17,
    property = [{0,143,1403}],
    guildlevel = 3,
    cost = 233,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级1403点"
    };
getRow(4,19)->
    #guildexchangeCfg {
    id = 4,
    level = 19,
    icon = 17,
    property = [{0,143,1518}],
    guildlevel = 3,
    cost = 246,
    name = "家族韧性等级",
    describe = "技能效果：角色增加韧性等级1518点"
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
    property = [{0,144,33}],
    guildlevel = 2,
    cost = 10,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级33点"
    };
getRow(5,2)->
    #guildexchangeCfg {
    id = 5,
    level = 2,
    icon = 46,
    property = [{0,144,60}],
    guildlevel = 2,
    cost = 16,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级60点"
    };
getRow(5,3)->
    #guildexchangeCfg {
    id = 5,
    level = 3,
    icon = 46,
    property = [{0,144,104}],
    guildlevel = 2,
    cost = 30,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级104点"
    };
getRow(5,4)->
    #guildexchangeCfg {
    id = 5,
    level = 4,
    icon = 46,
    property = [{0,144,158}],
    guildlevel = 2,
    cost = 44,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级158点"
    };
getRow(5,5)->
    #guildexchangeCfg {
    id = 5,
    level = 5,
    icon = 46,
    property = [{0,144,219}],
    guildlevel = 2,
    cost = 57,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级219点"
    };
getRow(5,6)->
    #guildexchangeCfg {
    id = 5,
    level = 6,
    icon = 46,
    property = [{0,144,288}],
    guildlevel = 2,
    cost = 71,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级288点"
    };
getRow(5,7)->
    #guildexchangeCfg {
    id = 5,
    level = 7,
    icon = 46,
    property = [{0,144,362}],
    guildlevel = 2,
    cost = 84,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级362点"
    };
getRow(5,8)->
    #guildexchangeCfg {
    id = 5,
    level = 8,
    icon = 46,
    property = [{0,144,441}],
    guildlevel = 2,
    cost = 98,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级441点"
    };
getRow(5,9)->
    #guildexchangeCfg {
    id = 5,
    level = 9,
    icon = 46,
    property = [{0,144,524}],
    guildlevel = 2,
    cost = 111,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级524点"
    };
getRow(5,10)->
    #guildexchangeCfg {
    id = 5,
    level = 10,
    icon = 46,
    property = [{0,144,612}],
    guildlevel = 2,
    cost = 125,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级612点"
    };
getRow(5,11)->
    #guildexchangeCfg {
    id = 5,
    level = 11,
    icon = 46,
    property = [{0,144,704}],
    guildlevel = 3,
    cost = 138,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级704点"
    };
getRow(5,12)->
    #guildexchangeCfg {
    id = 5,
    level = 12,
    icon = 46,
    property = [{0,144,800}],
    guildlevel = 3,
    cost = 152,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级800点"
    };
getRow(5,13)->
    #guildexchangeCfg {
    id = 5,
    level = 13,
    icon = 46,
    property = [{0,144,900}],
    guildlevel = 3,
    cost = 165,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级900点"
    };
getRow(5,14)->
    #guildexchangeCfg {
    id = 5,
    level = 14,
    icon = 46,
    property = [{0,144,1002}],
    guildlevel = 3,
    cost = 179,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级1002点"
    };
getRow(5,15)->
    #guildexchangeCfg {
    id = 5,
    level = 15,
    icon = 46,
    property = [{0,144,1108}],
    guildlevel = 3,
    cost = 192,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级1108点"
    };
getRow(5,16)->
    #guildexchangeCfg {
    id = 5,
    level = 16,
    icon = 46,
    property = [{0,144,1217}],
    guildlevel = 3,
    cost = 206,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级1217点"
    };
getRow(5,17)->
    #guildexchangeCfg {
    id = 5,
    level = 17,
    icon = 46,
    property = [{0,144,1329}],
    guildlevel = 3,
    cost = 219,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级1329点"
    };
getRow(5,18)->
    #guildexchangeCfg {
    id = 5,
    level = 18,
    icon = 46,
    property = [{0,144,1444}],
    guildlevel = 3,
    cost = 233,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级1444点"
    };
getRow(5,19)->
    #guildexchangeCfg {
    id = 5,
    level = 19,
    icon = 46,
    property = [{0,144,1562}],
    guildlevel = 3,
    cost = 246,
    name = "家族命中等级",
    describe = "技能效果：角色增加命中等级1562点"
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
    property = [{0,145,48}],
    guildlevel = 2,
    cost = 10,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级48点"
    };
getRow(6,2)->
    #guildexchangeCfg {
    id = 6,
    level = 2,
    icon = 54,
    property = [{0,145,86}],
    guildlevel = 2,
    cost = 16,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级86点"
    };
getRow(6,3)->
    #guildexchangeCfg {
    id = 6,
    level = 3,
    icon = 54,
    property = [{0,145,149}],
    guildlevel = 2,
    cost = 30,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级149点"
    };
getRow(6,4)->
    #guildexchangeCfg {
    id = 6,
    level = 4,
    icon = 54,
    property = [{0,145,226}],
    guildlevel = 2,
    cost = 44,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级226点"
    };
getRow(6,5)->
    #guildexchangeCfg {
    id = 6,
    level = 5,
    icon = 54,
    property = [{0,145,314}],
    guildlevel = 2,
    cost = 57,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级314点"
    };
getRow(6,6)->
    #guildexchangeCfg {
    id = 6,
    level = 6,
    icon = 54,
    property = [{0,145,412}],
    guildlevel = 2,
    cost = 71,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级412点"
    };
getRow(6,7)->
    #guildexchangeCfg {
    id = 6,
    level = 7,
    icon = 54,
    property = [{0,145,517}],
    guildlevel = 2,
    cost = 84,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级517点"
    };
getRow(6,8)->
    #guildexchangeCfg {
    id = 6,
    level = 8,
    icon = 54,
    property = [{0,145,631}],
    guildlevel = 2,
    cost = 98,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级631点"
    };
getRow(6,9)->
    #guildexchangeCfg {
    id = 6,
    level = 9,
    icon = 54,
    property = [{0,145,751}],
    guildlevel = 2,
    cost = 111,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级751点"
    };
getRow(6,10)->
    #guildexchangeCfg {
    id = 6,
    level = 10,
    icon = 54,
    property = [{0,145,877}],
    guildlevel = 2,
    cost = 125,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级877点"
    };
getRow(6,11)->
    #guildexchangeCfg {
    id = 6,
    level = 11,
    icon = 54,
    property = [{0,145,1008}],
    guildlevel = 3,
    cost = 138,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级1008点"
    };
getRow(6,12)->
    #guildexchangeCfg {
    id = 6,
    level = 12,
    icon = 54,
    property = [{0,145,1145}],
    guildlevel = 3,
    cost = 152,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级1145点"
    };
getRow(6,13)->
    #guildexchangeCfg {
    id = 6,
    level = 13,
    icon = 54,
    property = [{0,145,1288}],
    guildlevel = 3,
    cost = 165,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级1288点"
    };
getRow(6,14)->
    #guildexchangeCfg {
    id = 6,
    level = 14,
    icon = 54,
    property = [{0,145,1435}],
    guildlevel = 3,
    cost = 179,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级1435点"
    };
getRow(6,15)->
    #guildexchangeCfg {
    id = 6,
    level = 15,
    icon = 54,
    property = [{0,145,1586}],
    guildlevel = 3,
    cost = 192,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级1586点"
    };
getRow(6,16)->
    #guildexchangeCfg {
    id = 6,
    level = 16,
    icon = 54,
    property = [{0,145,1742}],
    guildlevel = 3,
    cost = 206,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级1742点"
    };
getRow(6,17)->
    #guildexchangeCfg {
    id = 6,
    level = 17,
    icon = 54,
    property = [{0,145,1902}],
    guildlevel = 3,
    cost = 219,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级1902点"
    };
getRow(6,18)->
    #guildexchangeCfg {
    id = 6,
    level = 18,
    icon = 54,
    property = [{0,145,2067}],
    guildlevel = 3,
    cost = 233,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级2067点"
    };
getRow(6,19)->
    #guildexchangeCfg {
    id = 6,
    level = 19,
    icon = 54,
    property = [{0,145,2235}],
    guildlevel = 3,
    cost = 246,
    name = "家族闪避等级",
    describe = "技能效果：角色增加闪避等级2235点"
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
    property = [{0,146,32}],
    guildlevel = 3,
    cost = 10,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级32点"
    };
getRow(7,2)->
    #guildexchangeCfg {
    id = 7,
    level = 2,
    icon = 55,
    property = [{0,146,57}],
    guildlevel = 3,
    cost = 16,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级57点"
    };
getRow(7,3)->
    #guildexchangeCfg {
    id = 7,
    level = 3,
    icon = 55,
    property = [{0,146,99}],
    guildlevel = 3,
    cost = 30,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级99点"
    };
getRow(7,4)->
    #guildexchangeCfg {
    id = 7,
    level = 4,
    icon = 55,
    property = [{0,146,150}],
    guildlevel = 3,
    cost = 44,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级150点"
    };
getRow(7,5)->
    #guildexchangeCfg {
    id = 7,
    level = 5,
    icon = 55,
    property = [{0,146,209}],
    guildlevel = 3,
    cost = 57,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级209点"
    };
getRow(7,6)->
    #guildexchangeCfg {
    id = 7,
    level = 6,
    icon = 55,
    property = [{0,146,274}],
    guildlevel = 3,
    cost = 71,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级274点"
    };
getRow(7,7)->
    #guildexchangeCfg {
    id = 7,
    level = 7,
    icon = 55,
    property = [{0,146,345}],
    guildlevel = 3,
    cost = 84,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级345点"
    };
getRow(7,8)->
    #guildexchangeCfg {
    id = 7,
    level = 8,
    icon = 55,
    property = [{0,146,420}],
    guildlevel = 3,
    cost = 98,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级420点"
    };
getRow(7,9)->
    #guildexchangeCfg {
    id = 7,
    level = 9,
    icon = 55,
    property = [{0,146,500}],
    guildlevel = 3,
    cost = 111,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级500点"
    };
getRow(7,10)->
    #guildexchangeCfg {
    id = 7,
    level = 10,
    icon = 55,
    property = [{0,146,584}],
    guildlevel = 3,
    cost = 125,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级584点"
    };
getRow(7,11)->
    #guildexchangeCfg {
    id = 7,
    level = 11,
    icon = 55,
    property = [{0,146,672}],
    guildlevel = 4,
    cost = 138,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级672点"
    };
getRow(7,12)->
    #guildexchangeCfg {
    id = 7,
    level = 12,
    icon = 55,
    property = [{0,146,763}],
    guildlevel = 4,
    cost = 152,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级763点"
    };
getRow(7,13)->
    #guildexchangeCfg {
    id = 7,
    level = 13,
    icon = 55,
    property = [{0,146,858}],
    guildlevel = 4,
    cost = 165,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级858点"
    };
getRow(7,14)->
    #guildexchangeCfg {
    id = 7,
    level = 14,
    icon = 55,
    property = [{0,146,956}],
    guildlevel = 4,
    cost = 179,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级956点"
    };
getRow(7,15)->
    #guildexchangeCfg {
    id = 7,
    level = 15,
    icon = 55,
    property = [{0,146,1057}],
    guildlevel = 4,
    cost = 192,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级1057点"
    };
getRow(7,16)->
    #guildexchangeCfg {
    id = 7,
    level = 16,
    icon = 55,
    property = [{0,146,1161}],
    guildlevel = 4,
    cost = 206,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级1161点"
    };
getRow(7,17)->
    #guildexchangeCfg {
    id = 7,
    level = 17,
    icon = 55,
    property = [{0,146,1268}],
    guildlevel = 4,
    cost = 219,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级1268点"
    };
getRow(7,18)->
    #guildexchangeCfg {
    id = 7,
    level = 18,
    icon = 55,
    property = [{0,146,1378}],
    guildlevel = 4,
    cost = 233,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级1378点"
    };
getRow(7,19)->
    #guildexchangeCfg {
    id = 7,
    level = 19,
    icon = 55,
    property = [{0,146,1490}],
    guildlevel = 4,
    cost = 246,
    name = "家族破甲等级",
    describe = "技能效果：角色增加破甲等级1490点"
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
    property = [{0,160,22}],
    guildlevel = 3,
    cost = 10,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级22点"
    };
getRow(8,2)->
    #guildexchangeCfg {
    id = 8,
    level = 2,
    icon = 59,
    property = [{0,160,40}],
    guildlevel = 3,
    cost = 16,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级40点"
    };
getRow(8,3)->
    #guildexchangeCfg {
    id = 8,
    level = 3,
    icon = 59,
    property = [{0,160,69}],
    guildlevel = 3,
    cost = 30,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级69点"
    };
getRow(8,4)->
    #guildexchangeCfg {
    id = 8,
    level = 4,
    icon = 59,
    property = [{0,160,106}],
    guildlevel = 3,
    cost = 44,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级106点"
    };
getRow(8,5)->
    #guildexchangeCfg {
    id = 8,
    level = 5,
    icon = 59,
    property = [{0,160,147}],
    guildlevel = 3,
    cost = 57,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级147点"
    };
getRow(8,6)->
    #guildexchangeCfg {
    id = 8,
    level = 6,
    icon = 59,
    property = [{0,160,193}],
    guildlevel = 3,
    cost = 71,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级193点"
    };
getRow(8,7)->
    #guildexchangeCfg {
    id = 8,
    level = 7,
    icon = 59,
    property = [{0,160,243}],
    guildlevel = 3,
    cost = 84,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级243点"
    };
getRow(8,8)->
    #guildexchangeCfg {
    id = 8,
    level = 8,
    icon = 59,
    property = [{0,160,296}],
    guildlevel = 3,
    cost = 98,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级296点"
    };
getRow(8,9)->
    #guildexchangeCfg {
    id = 8,
    level = 9,
    icon = 59,
    property = [{0,160,352}],
    guildlevel = 3,
    cost = 111,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级352点"
    };
getRow(8,10)->
    #guildexchangeCfg {
    id = 8,
    level = 10,
    icon = 59,
    property = [{0,160,411}],
    guildlevel = 3,
    cost = 125,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级411点"
    };
getRow(8,11)->
    #guildexchangeCfg {
    id = 8,
    level = 11,
    icon = 59,
    property = [{0,160,473}],
    guildlevel = 4,
    cost = 138,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级473点"
    };
getRow(8,12)->
    #guildexchangeCfg {
    id = 8,
    level = 12,
    icon = 59,
    property = [{0,160,537}],
    guildlevel = 4,
    cost = 152,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级537点"
    };
getRow(8,13)->
    #guildexchangeCfg {
    id = 8,
    level = 13,
    icon = 59,
    property = [{0,160,604}],
    guildlevel = 4,
    cost = 165,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级604点"
    };
getRow(8,14)->
    #guildexchangeCfg {
    id = 8,
    level = 14,
    icon = 59,
    property = [{0,160,673}],
    guildlevel = 4,
    cost = 179,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级673点"
    };
getRow(8,15)->
    #guildexchangeCfg {
    id = 8,
    level = 15,
    icon = 59,
    property = [{0,160,744}],
    guildlevel = 4,
    cost = 192,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级744点"
    };
getRow(8,16)->
    #guildexchangeCfg {
    id = 8,
    level = 16,
    icon = 59,
    property = [{0,160,817}],
    guildlevel = 4,
    cost = 206,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级817点"
    };
getRow(8,17)->
    #guildexchangeCfg {
    id = 8,
    level = 17,
    icon = 59,
    property = [{0,160,892}],
    guildlevel = 4,
    cost = 219,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级892点"
    };
getRow(8,18)->
    #guildexchangeCfg {
    id = 8,
    level = 18,
    icon = 59,
    property = [{0,160,969}],
    guildlevel = 4,
    cost = 233,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级969点"
    };
getRow(8,19)->
    #guildexchangeCfg {
    id = 8,
    level = 19,
    icon = 59,
    property = [{0,160,1048}],
    guildlevel = 4,
    cost = 246,
    name = "家族坚固等级",
    describe = "技能效果：角色增加坚固等级1048点"
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

