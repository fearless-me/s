%% coding: latin-1
%%: 实现
-module(cfg_guildskill_chs).
-compile(export_all).
-include("cfg_guildskill.hrl").
-include("logger.hrl").

getRow(1)->
    #guildskillCfg {
    id = 1,
    skillid = 1,
    skillicon = 151,
    skilllevel = 1,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+7",
    skillresearch = 1000,
    skilllearn = [{1,10000},{4,100}],
    guildlevel = 1,
    skillproperty = [{30,7,0}]
    };
getRow(2)->
    #guildskillCfg {
    id = 2,
    skillid = 1,
    skillicon = 151,
    skilllevel = 2,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+8",
    skillresearch = 2000,
    skilllearn = [{1,20000},{4,200}],
    guildlevel = 1,
    skillproperty = [{30,8,0}]
    };
getRow(3)->
    #guildskillCfg {
    id = 3,
    skillid = 1,
    skillicon = 151,
    skilllevel = 3,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+9",
    skillresearch = 3000,
    skilllearn = [{1,30000},{4,300}],
    guildlevel = 1,
    skillproperty = [{30,9,0}]
    };
getRow(4)->
    #guildskillCfg {
    id = 4,
    skillid = 1,
    skillicon = 151,
    skilllevel = 4,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+10",
    skillresearch = 4000,
    skilllearn = [{1,40000},{4,400}],
    guildlevel = 1,
    skillproperty = [{30,10,0}]
    };
getRow(5)->
    #guildskillCfg {
    id = 5,
    skillid = 1,
    skillicon = 151,
    skilllevel = 5,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+11",
    skillresearch = 5000,
    skilllearn = [{1,50000},{4,500}],
    guildlevel = 1,
    skillproperty = [{30,11,0}]
    };
getRow(6)->
    #guildskillCfg {
    id = 6,
    skillid = 1,
    skillicon = 151,
    skilllevel = 6,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+12",
    skillresearch = 6000,
    skilllearn = [{1,60000},{4,600}],
    guildlevel = 1,
    skillproperty = [{30,12,0}]
    };
getRow(7)->
    #guildskillCfg {
    id = 7,
    skillid = 1,
    skillicon = 151,
    skilllevel = 7,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+13",
    skillresearch = 7000,
    skilllearn = [{1,70000},{4,700}],
    guildlevel = 1,
    skillproperty = [{30,13,0}]
    };
getRow(8)->
    #guildskillCfg {
    id = 8,
    skillid = 1,
    skillicon = 151,
    skilllevel = 8,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+14",
    skillresearch = 8000,
    skilllearn = [{1,80000},{4,800}],
    guildlevel = 1,
    skillproperty = [{30,14,0}]
    };
getRow(9)->
    #guildskillCfg {
    id = 9,
    skillid = 1,
    skillicon = 151,
    skilllevel = 9,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+15",
    skillresearch = 9000,
    skilllearn = [{1,90000},{4,900}],
    guildlevel = 1,
    skillproperty = [{30,15,0}]
    };
getRow(10)->
    #guildskillCfg {
    id = 10,
    skillid = 1,
    skillicon = 151,
    skilllevel = 10,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+16",
    skillresearch = 10000,
    skilllearn = [{1,100000},{4,1000}],
    guildlevel = 1,
    skillproperty = [{30,16,0}]
    };
getRow(11)->
    #guildskillCfg {
    id = 11,
    skillid = 1,
    skillicon = 151,
    skilllevel = 11,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+17",
    skillresearch = 11000,
    skilllearn = [{1,110000},{4,1100}],
    guildlevel = 2,
    skillproperty = [{30,17,0}]
    };
getRow(12)->
    #guildskillCfg {
    id = 12,
    skillid = 1,
    skillicon = 151,
    skilllevel = 12,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+19",
    skillresearch = 12000,
    skilllearn = [{1,120000},{4,1200}],
    guildlevel = 2,
    skillproperty = [{30,19,0}]
    };
getRow(13)->
    #guildskillCfg {
    id = 13,
    skillid = 1,
    skillicon = 151,
    skilllevel = 13,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+20",
    skillresearch = 13000,
    skilllearn = [{1,130000},{4,1300}],
    guildlevel = 2,
    skillproperty = [{30,20,0}]
    };
getRow(14)->
    #guildskillCfg {
    id = 14,
    skillid = 1,
    skillicon = 151,
    skilllevel = 14,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+22",
    skillresearch = 14000,
    skilllearn = [{1,140000},{4,1400}],
    guildlevel = 2,
    skillproperty = [{30,22,0}]
    };
getRow(15)->
    #guildskillCfg {
    id = 15,
    skillid = 1,
    skillicon = 151,
    skilllevel = 15,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+23",
    skillresearch = 15000,
    skilllearn = [{1,150000},{4,1500}],
    guildlevel = 2,
    skillproperty = [{30,23,0}]
    };
getRow(16)->
    #guildskillCfg {
    id = 16,
    skillid = 1,
    skillicon = 151,
    skilllevel = 16,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+25",
    skillresearch = 16000,
    skilllearn = [{1,160000},{4,1600}],
    guildlevel = 2,
    skillproperty = [{30,25,0}]
    };
getRow(17)->
    #guildskillCfg {
    id = 17,
    skillid = 1,
    skillicon = 151,
    skilllevel = 17,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+27",
    skillresearch = 17000,
    skilllearn = [{1,170000},{4,1700}],
    guildlevel = 2,
    skillproperty = [{30,27,0}]
    };
getRow(18)->
    #guildskillCfg {
    id = 18,
    skillid = 1,
    skillicon = 151,
    skilllevel = 18,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+29",
    skillresearch = 18000,
    skilllearn = [{1,180000},{4,1800}],
    guildlevel = 2,
    skillproperty = [{30,29,0}]
    };
getRow(19)->
    #guildskillCfg {
    id = 19,
    skillid = 1,
    skillicon = 151,
    skilllevel = 19,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+32",
    skillresearch = 19000,
    skilllearn = [{1,190000},{4,1900}],
    guildlevel = 2,
    skillproperty = [{30,32,0}]
    };
getRow(20)->
    #guildskillCfg {
    id = 20,
    skillid = 1,
    skillicon = 151,
    skilllevel = 20,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+34",
    skillresearch = 20000,
    skilllearn = [{1,200000},{4,2000}],
    guildlevel = 2,
    skillproperty = [{30,34,0}]
    };
getRow(21)->
    #guildskillCfg {
    id = 21,
    skillid = 1,
    skillicon = 151,
    skilllevel = 21,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+37",
    skillresearch = 22000,
    skilllearn = [{1,220000},{4,2200}],
    guildlevel = 3,
    skillproperty = [{30,37,0}]
    };
getRow(22)->
    #guildskillCfg {
    id = 22,
    skillid = 1,
    skillicon = 151,
    skilllevel = 22,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+40",
    skillresearch = 24000,
    skilllearn = [{1,240000},{4,2400}],
    guildlevel = 3,
    skillproperty = [{30,40,0}]
    };
getRow(23)->
    #guildskillCfg {
    id = 23,
    skillid = 1,
    skillicon = 151,
    skilllevel = 23,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+43",
    skillresearch = 26000,
    skilllearn = [{1,260000},{4,2600}],
    guildlevel = 3,
    skillproperty = [{30,43,0}]
    };
getRow(24)->
    #guildskillCfg {
    id = 24,
    skillid = 1,
    skillicon = 151,
    skilllevel = 24,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+47",
    skillresearch = 28000,
    skilllearn = [{1,280000},{4,2800}],
    guildlevel = 3,
    skillproperty = [{30,47,0}]
    };
getRow(25)->
    #guildskillCfg {
    id = 25,
    skillid = 1,
    skillicon = 151,
    skilllevel = 25,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+50",
    skillresearch = 30000,
    skilllearn = [{1,300000},{4,3000}],
    guildlevel = 3,
    skillproperty = [{30,50,0}]
    };
getRow(26)->
    #guildskillCfg {
    id = 26,
    skillid = 1,
    skillicon = 151,
    skilllevel = 26,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+54",
    skillresearch = 32000,
    skilllearn = [{1,320000},{4,3200}],
    guildlevel = 3,
    skillproperty = [{30,54,0}]
    };
getRow(27)->
    #guildskillCfg {
    id = 27,
    skillid = 1,
    skillicon = 151,
    skilllevel = 27,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+59",
    skillresearch = 34000,
    skilllearn = [{1,340000},{4,3400}],
    guildlevel = 3,
    skillproperty = [{30,59,0}]
    };
getRow(28)->
    #guildskillCfg {
    id = 28,
    skillid = 1,
    skillicon = 151,
    skilllevel = 28,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+63",
    skillresearch = 36000,
    skilllearn = [{1,360000},{4,3600}],
    guildlevel = 3,
    skillproperty = [{30,63,0}]
    };
getRow(29)->
    #guildskillCfg {
    id = 29,
    skillid = 1,
    skillicon = 151,
    skilllevel = 29,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+68",
    skillresearch = 38000,
    skilllearn = [{1,380000},{4,3800}],
    guildlevel = 3,
    skillproperty = [{30,68,0}]
    };
getRow(30)->
    #guildskillCfg {
    id = 30,
    skillid = 1,
    skillicon = 151,
    skilllevel = 30,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+74",
    skillresearch = 40000,
    skilllearn = [{1,400000},{4,4000}],
    guildlevel = 3,
    skillproperty = [{30,74,0}]
    };
getRow(31)->
    #guildskillCfg {
    id = 31,
    skillid = 1,
    skillicon = 151,
    skilllevel = 31,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+80",
    skillresearch = 42000,
    skilllearn = [{1,420000},{4,4200}],
    guildlevel = 4,
    skillproperty = [{30,80,0}]
    };
getRow(32)->
    #guildskillCfg {
    id = 32,
    skillid = 1,
    skillicon = 151,
    skilllevel = 32,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+86",
    skillresearch = 44000,
    skilllearn = [{1,440000},{4,4400}],
    guildlevel = 4,
    skillproperty = [{30,86,0}]
    };
getRow(33)->
    #guildskillCfg {
    id = 33,
    skillid = 1,
    skillicon = 151,
    skilllevel = 33,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+93",
    skillresearch = 46000,
    skilllearn = [{1,460000},{4,4600}],
    guildlevel = 4,
    skillproperty = [{30,93,0}]
    };
getRow(34)->
    #guildskillCfg {
    id = 34,
    skillid = 1,
    skillicon = 151,
    skilllevel = 34,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+100",
    skillresearch = 48000,
    skilllearn = [{1,480000},{4,4800}],
    guildlevel = 4,
    skillproperty = [{30,100,0}]
    };
getRow(35)->
    #guildskillCfg {
    id = 35,
    skillid = 1,
    skillicon = 151,
    skilllevel = 35,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+108",
    skillresearch = 50000,
    skilllearn = [{1,500000},{4,5000}],
    guildlevel = 4,
    skillproperty = [{30,108,0}]
    };
getRow(36)->
    #guildskillCfg {
    id = 36,
    skillid = 1,
    skillicon = 151,
    skilllevel = 36,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+117",
    skillresearch = 52000,
    skilllearn = [{1,520000},{4,5200}],
    guildlevel = 4,
    skillproperty = [{30,117,0}]
    };
getRow(37)->
    #guildskillCfg {
    id = 37,
    skillid = 1,
    skillicon = 151,
    skilllevel = 37,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+126",
    skillresearch = 54000,
    skilllearn = [{1,540000},{4,5400}],
    guildlevel = 4,
    skillproperty = [{30,126,0}]
    };
getRow(38)->
    #guildskillCfg {
    id = 38,
    skillid = 1,
    skillicon = 151,
    skilllevel = 38,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+136",
    skillresearch = 56000,
    skilllearn = [{1,560000},{4,5600}],
    guildlevel = 4,
    skillproperty = [{30,136,0}]
    };
getRow(39)->
    #guildskillCfg {
    id = 39,
    skillid = 1,
    skillicon = 151,
    skilllevel = 39,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+147",
    skillresearch = 58000,
    skilllearn = [{1,580000},{4,5800}],
    guildlevel = 4,
    skillproperty = [{30,147,0}]
    };
getRow(40)->
    #guildskillCfg {
    id = 40,
    skillid = 1,
    skillicon = 151,
    skilllevel = 40,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+159",
    skillresearch = 60000,
    skilllearn = [{1,600000},{4,6000}],
    guildlevel = 4,
    skillproperty = [{30,159,0}]
    };
getRow(41)->
    #guildskillCfg {
    id = 41,
    skillid = 1,
    skillicon = 151,
    skilllevel = 41,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+171",
    skillresearch = 65000,
    skilllearn = [{1,650000},{4,6500}],
    guildlevel = 5,
    skillproperty = [{30,171,0}]
    };
getRow(42)->
    #guildskillCfg {
    id = 42,
    skillid = 1,
    skillicon = 151,
    skilllevel = 42,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+185",
    skillresearch = 70000,
    skilllearn = [{1,700000},{4,7000}],
    guildlevel = 5,
    skillproperty = [{30,185,0}]
    };
getRow(43)->
    #guildskillCfg {
    id = 43,
    skillid = 1,
    skillicon = 151,
    skilllevel = 43,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+200",
    skillresearch = 75000,
    skilllearn = [{1,750000},{4,7500}],
    guildlevel = 5,
    skillproperty = [{30,200,0}]
    };
getRow(44)->
    #guildskillCfg {
    id = 44,
    skillid = 1,
    skillicon = 151,
    skilllevel = 44,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+216",
    skillresearch = 80000,
    skilllearn = [{1,800000},{4,8000}],
    guildlevel = 5,
    skillproperty = [{30,216,0}]
    };
getRow(45)->
    #guildskillCfg {
    id = 45,
    skillid = 1,
    skillicon = 151,
    skilllevel = 45,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+233",
    skillresearch = 85000,
    skilllearn = [{1,850000},{4,8500}],
    guildlevel = 5,
    skillproperty = [{30,233,0}]
    };
getRow(46)->
    #guildskillCfg {
    id = 46,
    skillid = 1,
    skillicon = 151,
    skilllevel = 46,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+251",
    skillresearch = 90000,
    skilllearn = [{1,900000},{4,9000}],
    guildlevel = 5,
    skillproperty = [{30,251,0}]
    };
getRow(47)->
    #guildskillCfg {
    id = 47,
    skillid = 1,
    skillicon = 151,
    skilllevel = 47,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+271",
    skillresearch = 95000,
    skilllearn = [{1,950000},{4,9500}],
    guildlevel = 5,
    skillproperty = [{30,271,0}]
    };
getRow(48)->
    #guildskillCfg {
    id = 48,
    skillid = 1,
    skillicon = 151,
    skilllevel = 48,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+293",
    skillresearch = 100000,
    skilllearn = [{1,1000000},{4,10000}],
    guildlevel = 5,
    skillproperty = [{30,293,0}]
    };
getRow(49)->
    #guildskillCfg {
    id = 49,
    skillid = 1,
    skillicon = 151,
    skilllevel = 49,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+316",
    skillresearch = 105000,
    skilllearn = [{1,1050000},{4,10500}],
    guildlevel = 5,
    skillproperty = [{30,316,0}]
    };
getRow(50)->
    #guildskillCfg {
    id = 50,
    skillid = 1,
    skillicon = 151,
    skilllevel = 50,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+341",
    skillresearch = 110000,
    skilllearn = [{1,1100000},{4,11000}],
    guildlevel = 5,
    skillproperty = [{30,341,0}]
    };
getRow(51)->
    #guildskillCfg {
    id = 51,
    skillid = 1,
    skillicon = 151,
    skilllevel = 51,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+368",
    skillresearch = 115000,
    skilllearn = [{1,1150000},{4,11500}],
    guildlevel = 6,
    skillproperty = [{30,368,0}]
    };
getRow(52)->
    #guildskillCfg {
    id = 52,
    skillid = 1,
    skillicon = 151,
    skilllevel = 52,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+397",
    skillresearch = 120000,
    skilllearn = [{1,1200000},{4,12000}],
    guildlevel = 6,
    skillproperty = [{30,397,0}]
    };
getRow(53)->
    #guildskillCfg {
    id = 53,
    skillid = 1,
    skillicon = 151,
    skilllevel = 53,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+429",
    skillresearch = 125000,
    skilllearn = [{1,1250000},{4,12500}],
    guildlevel = 6,
    skillproperty = [{30,429,0}]
    };
getRow(54)->
    #guildskillCfg {
    id = 54,
    skillid = 1,
    skillicon = 151,
    skilllevel = 54,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+463",
    skillresearch = 130000,
    skilllearn = [{1,1300000},{4,13000}],
    guildlevel = 6,
    skillproperty = [{30,463,0}]
    };
getRow(55)->
    #guildskillCfg {
    id = 55,
    skillid = 1,
    skillicon = 151,
    skilllevel = 55,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+500",
    skillresearch = 135000,
    skilllearn = [{1,1350000},{4,13500}],
    guildlevel = 6,
    skillproperty = [{30,500,0}]
    };
getRow(56)->
    #guildskillCfg {
    id = 56,
    skillid = 1,
    skillicon = 151,
    skilllevel = 56,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+540",
    skillresearch = 140000,
    skilllearn = [{1,1400000},{4,14000}],
    guildlevel = 6,
    skillproperty = [{30,540,0}]
    };
getRow(57)->
    #guildskillCfg {
    id = 57,
    skillid = 1,
    skillicon = 151,
    skilllevel = 57,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+582",
    skillresearch = 145000,
    skilllearn = [{1,1450000},{4,14500}],
    guildlevel = 6,
    skillproperty = [{30,582,0}]
    };
getRow(58)->
    #guildskillCfg {
    id = 58,
    skillid = 1,
    skillicon = 151,
    skilllevel = 58,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+629",
    skillresearch = 150000,
    skilllearn = [{1,1500000},{4,15000}],
    guildlevel = 6,
    skillproperty = [{30,629,0}]
    };
getRow(59)->
    #guildskillCfg {
    id = 59,
    skillid = 1,
    skillicon = 151,
    skilllevel = 59,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+678",
    skillresearch = 155000,
    skilllearn = [{1,1550000},{4,15500}],
    guildlevel = 6,
    skillproperty = [{30,678,0}]
    };
getRow(60)->
    #guildskillCfg {
    id = 60,
    skillid = 1,
    skillicon = 151,
    skilllevel = 60,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+732",
    skillresearch = 160000,
    skilllearn = [{1,1600000},{4,16000}],
    guildlevel = 6,
    skillproperty = [{30,732,0}]
    };
getRow(61)->
    #guildskillCfg {
    id = 61,
    skillid = 1,
    skillicon = 151,
    skilllevel = 61,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+782",
    skillresearch = 170000,
    skilllearn = [{1,1700000},{4,17000}],
    guildlevel = 7,
    skillproperty = [{30,782,0}]
    };
getRow(62)->
    #guildskillCfg {
    id = 62,
    skillid = 1,
    skillicon = 151,
    skilllevel = 62,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+832",
    skillresearch = 180000,
    skilllearn = [{1,1800000},{4,18000}],
    guildlevel = 7,
    skillproperty = [{30,832,0}]
    };
getRow(63)->
    #guildskillCfg {
    id = 63,
    skillid = 1,
    skillicon = 151,
    skilllevel = 63,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+882",
    skillresearch = 190000,
    skilllearn = [{1,1900000},{4,19000}],
    guildlevel = 7,
    skillproperty = [{30,882,0}]
    };
getRow(64)->
    #guildskillCfg {
    id = 64,
    skillid = 1,
    skillicon = 151,
    skilllevel = 64,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+932",
    skillresearch = 200000,
    skilllearn = [{1,2000000},{4,20000}],
    guildlevel = 7,
    skillproperty = [{30,932,0}]
    };
getRow(65)->
    #guildskillCfg {
    id = 65,
    skillid = 1,
    skillicon = 151,
    skilllevel = 65,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+982",
    skillresearch = 210000,
    skilllearn = [{1,2100000},{4,21000}],
    guildlevel = 7,
    skillproperty = [{30,982,0}]
    };
getRow(66)->
    #guildskillCfg {
    id = 66,
    skillid = 1,
    skillicon = 151,
    skilllevel = 66,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+1032",
    skillresearch = 220000,
    skilllearn = [{1,2200000},{4,22000}],
    guildlevel = 7,
    skillproperty = [{30,1032,0}]
    };
getRow(67)->
    #guildskillCfg {
    id = 67,
    skillid = 1,
    skillicon = 151,
    skilllevel = 67,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+1082",
    skillresearch = 230000,
    skilllearn = [{1,2300000},{4,23000}],
    guildlevel = 7,
    skillproperty = [{30,1082,0}]
    };
getRow(68)->
    #guildskillCfg {
    id = 68,
    skillid = 1,
    skillicon = 151,
    skilllevel = 68,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+1132",
    skillresearch = 240000,
    skilllearn = [{1,2400000},{4,24000}],
    guildlevel = 7,
    skillproperty = [{30,1132,0}]
    };
getRow(69)->
    #guildskillCfg {
    id = 69,
    skillid = 1,
    skillicon = 151,
    skilllevel = 69,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+1182",
    skillresearch = 250000,
    skilllearn = [{1,2500000},{4,25000}],
    guildlevel = 7,
    skillproperty = [{30,1182,0}]
    };
getRow(70)->
    #guildskillCfg {
    id = 70,
    skillid = 1,
    skillicon = 151,
    skilllevel = 70,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+1232",
    skillresearch = 260000,
    skilllearn = [{1,2600000},{4,26000}],
    guildlevel = 7,
    skillproperty = [{30,1232,0}]
    };
getRow(71)->
    #guildskillCfg {
    id = 71,
    skillid = 1,
    skillicon = 151,
    skilllevel = 71,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+1282",
    skillresearch = 270000,
    skilllearn = [{1,2700000},{4,27000}],
    guildlevel = 8,
    skillproperty = [{30,1282,0}]
    };
getRow(72)->
    #guildskillCfg {
    id = 72,
    skillid = 1,
    skillicon = 151,
    skilllevel = 72,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+1347",
    skillresearch = 280000,
    skilllearn = [{1,2800000},{4,28000}],
    guildlevel = 8,
    skillproperty = [{30,1347,0}]
    };
getRow(73)->
    #guildskillCfg {
    id = 73,
    skillid = 1,
    skillicon = 151,
    skilllevel = 73,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+1412",
    skillresearch = 290000,
    skilllearn = [{1,2900000},{4,29000}],
    guildlevel = 8,
    skillproperty = [{30,1412,0}]
    };
getRow(74)->
    #guildskillCfg {
    id = 74,
    skillid = 1,
    skillicon = 151,
    skilllevel = 74,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+1477",
    skillresearch = 300000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{30,1477,0}]
    };
getRow(75)->
    #guildskillCfg {
    id = 75,
    skillid = 1,
    skillicon = 151,
    skilllevel = 75,
    skillname = "神圣祝福",
    skilldes = "神圣伤害+1542",
    skillresearch = 310000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{30,1542,0}]
    };
getRow(76)->
    #guildskillCfg {
    id = 76,
    skillid = 2,
    skillicon = 150,
    skilllevel = 1,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+7",
    skillresearch = 1000,
    skilllearn = [{1,10000},{4,100}],
    guildlevel = 1,
    skillproperty = [{31,7,0}]
    };
getRow(77)->
    #guildskillCfg {
    id = 77,
    skillid = 2,
    skillicon = 150,
    skilllevel = 2,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+8",
    skillresearch = 2000,
    skilllearn = [{1,20000},{4,200}],
    guildlevel = 1,
    skillproperty = [{31,8,0}]
    };
getRow(78)->
    #guildskillCfg {
    id = 78,
    skillid = 2,
    skillicon = 150,
    skilllevel = 3,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+9",
    skillresearch = 3000,
    skilllearn = [{1,30000},{4,300}],
    guildlevel = 1,
    skillproperty = [{31,9,0}]
    };
getRow(79)->
    #guildskillCfg {
    id = 79,
    skillid = 2,
    skillicon = 150,
    skilllevel = 4,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+10",
    skillresearch = 4000,
    skilllearn = [{1,40000},{4,400}],
    guildlevel = 1,
    skillproperty = [{31,10,0}]
    };
getRow(80)->
    #guildskillCfg {
    id = 80,
    skillid = 2,
    skillicon = 150,
    skilllevel = 5,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+11",
    skillresearch = 5000,
    skilllearn = [{1,50000},{4,500}],
    guildlevel = 1,
    skillproperty = [{31,11,0}]
    };
getRow(81)->
    #guildskillCfg {
    id = 81,
    skillid = 2,
    skillicon = 150,
    skilllevel = 6,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+12",
    skillresearch = 6000,
    skilllearn = [{1,60000},{4,600}],
    guildlevel = 1,
    skillproperty = [{31,12,0}]
    };
getRow(82)->
    #guildskillCfg {
    id = 82,
    skillid = 2,
    skillicon = 150,
    skilllevel = 7,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+13",
    skillresearch = 7000,
    skilllearn = [{1,70000},{4,700}],
    guildlevel = 1,
    skillproperty = [{31,13,0}]
    };
getRow(83)->
    #guildskillCfg {
    id = 83,
    skillid = 2,
    skillicon = 150,
    skilllevel = 8,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+14",
    skillresearch = 8000,
    skilllearn = [{1,80000},{4,800}],
    guildlevel = 1,
    skillproperty = [{31,14,0}]
    };
getRow(84)->
    #guildskillCfg {
    id = 84,
    skillid = 2,
    skillicon = 150,
    skilllevel = 9,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+15",
    skillresearch = 9000,
    skilllearn = [{1,90000},{4,900}],
    guildlevel = 1,
    skillproperty = [{31,15,0}]
    };
getRow(85)->
    #guildskillCfg {
    id = 85,
    skillid = 2,
    skillicon = 150,
    skilllevel = 10,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+16",
    skillresearch = 10000,
    skilllearn = [{1,100000},{4,1000}],
    guildlevel = 1,
    skillproperty = [{31,16,0}]
    };
getRow(86)->
    #guildskillCfg {
    id = 86,
    skillid = 2,
    skillicon = 150,
    skilllevel = 11,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+17",
    skillresearch = 11000,
    skilllearn = [{1,110000},{4,1100}],
    guildlevel = 2,
    skillproperty = [{31,17,0}]
    };
getRow(87)->
    #guildskillCfg {
    id = 87,
    skillid = 2,
    skillicon = 150,
    skilllevel = 12,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+19",
    skillresearch = 12000,
    skilllearn = [{1,120000},{4,1200}],
    guildlevel = 2,
    skillproperty = [{31,19,0}]
    };
getRow(88)->
    #guildskillCfg {
    id = 88,
    skillid = 2,
    skillicon = 150,
    skilllevel = 13,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+20",
    skillresearch = 13000,
    skilllearn = [{1,130000},{4,1300}],
    guildlevel = 2,
    skillproperty = [{31,20,0}]
    };
getRow(89)->
    #guildskillCfg {
    id = 89,
    skillid = 2,
    skillicon = 150,
    skilllevel = 14,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+22",
    skillresearch = 14000,
    skilllearn = [{1,140000},{4,1400}],
    guildlevel = 2,
    skillproperty = [{31,22,0}]
    };
getRow(90)->
    #guildskillCfg {
    id = 90,
    skillid = 2,
    skillicon = 150,
    skilllevel = 15,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+23",
    skillresearch = 15000,
    skilllearn = [{1,150000},{4,1500}],
    guildlevel = 2,
    skillproperty = [{31,23,0}]
    };
getRow(91)->
    #guildskillCfg {
    id = 91,
    skillid = 2,
    skillicon = 150,
    skilllevel = 16,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+25",
    skillresearch = 16000,
    skilllearn = [{1,160000},{4,1600}],
    guildlevel = 2,
    skillproperty = [{31,25,0}]
    };
getRow(92)->
    #guildskillCfg {
    id = 92,
    skillid = 2,
    skillicon = 150,
    skilllevel = 17,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+27",
    skillresearch = 17000,
    skilllearn = [{1,170000},{4,1700}],
    guildlevel = 2,
    skillproperty = [{31,27,0}]
    };
getRow(93)->
    #guildskillCfg {
    id = 93,
    skillid = 2,
    skillicon = 150,
    skilllevel = 18,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+29",
    skillresearch = 18000,
    skilllearn = [{1,180000},{4,1800}],
    guildlevel = 2,
    skillproperty = [{31,29,0}]
    };
getRow(94)->
    #guildskillCfg {
    id = 94,
    skillid = 2,
    skillicon = 150,
    skilllevel = 19,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+32",
    skillresearch = 19000,
    skilllearn = [{1,190000},{4,1900}],
    guildlevel = 2,
    skillproperty = [{31,32,0}]
    };
getRow(95)->
    #guildskillCfg {
    id = 95,
    skillid = 2,
    skillicon = 150,
    skilllevel = 20,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+34",
    skillresearch = 20000,
    skilllearn = [{1,200000},{4,2000}],
    guildlevel = 2,
    skillproperty = [{31,34,0}]
    };
getRow(96)->
    #guildskillCfg {
    id = 96,
    skillid = 2,
    skillicon = 150,
    skilllevel = 21,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+37",
    skillresearch = 22000,
    skilllearn = [{1,220000},{4,2200}],
    guildlevel = 3,
    skillproperty = [{31,37,0}]
    };
getRow(97)->
    #guildskillCfg {
    id = 97,
    skillid = 2,
    skillicon = 150,
    skilllevel = 22,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+40",
    skillresearch = 24000,
    skilllearn = [{1,240000},{4,2400}],
    guildlevel = 3,
    skillproperty = [{31,40,0}]
    };
getRow(98)->
    #guildskillCfg {
    id = 98,
    skillid = 2,
    skillicon = 150,
    skilllevel = 23,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+43",
    skillresearch = 26000,
    skilllearn = [{1,260000},{4,2600}],
    guildlevel = 3,
    skillproperty = [{31,43,0}]
    };
getRow(99)->
    #guildskillCfg {
    id = 99,
    skillid = 2,
    skillicon = 150,
    skilllevel = 24,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+47",
    skillresearch = 28000,
    skilllearn = [{1,280000},{4,2800}],
    guildlevel = 3,
    skillproperty = [{31,47,0}]
    };
getRow(100)->
    #guildskillCfg {
    id = 100,
    skillid = 2,
    skillicon = 150,
    skilllevel = 25,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+50",
    skillresearch = 30000,
    skilllearn = [{1,300000},{4,3000}],
    guildlevel = 3,
    skillproperty = [{31,50,0}]
    };
getRow(101)->
    #guildskillCfg {
    id = 101,
    skillid = 2,
    skillicon = 150,
    skilllevel = 26,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+54",
    skillresearch = 32000,
    skilllearn = [{1,320000},{4,3200}],
    guildlevel = 3,
    skillproperty = [{31,54,0}]
    };
getRow(102)->
    #guildskillCfg {
    id = 102,
    skillid = 2,
    skillicon = 150,
    skilllevel = 27,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+59",
    skillresearch = 34000,
    skilllearn = [{1,340000},{4,3400}],
    guildlevel = 3,
    skillproperty = [{31,59,0}]
    };
getRow(103)->
    #guildskillCfg {
    id = 103,
    skillid = 2,
    skillicon = 150,
    skilllevel = 28,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+63",
    skillresearch = 36000,
    skilllearn = [{1,360000},{4,3600}],
    guildlevel = 3,
    skillproperty = [{31,63,0}]
    };
getRow(104)->
    #guildskillCfg {
    id = 104,
    skillid = 2,
    skillicon = 150,
    skilllevel = 29,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+68",
    skillresearch = 38000,
    skilllearn = [{1,380000},{4,3800}],
    guildlevel = 3,
    skillproperty = [{31,68,0}]
    };
getRow(105)->
    #guildskillCfg {
    id = 105,
    skillid = 2,
    skillicon = 150,
    skilllevel = 30,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+74",
    skillresearch = 40000,
    skilllearn = [{1,400000},{4,4000}],
    guildlevel = 3,
    skillproperty = [{31,74,0}]
    };
getRow(106)->
    #guildskillCfg {
    id = 106,
    skillid = 2,
    skillicon = 150,
    skilllevel = 31,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+80",
    skillresearch = 42000,
    skilllearn = [{1,420000},{4,4200}],
    guildlevel = 4,
    skillproperty = [{31,80,0}]
    };
getRow(107)->
    #guildskillCfg {
    id = 107,
    skillid = 2,
    skillicon = 150,
    skilllevel = 32,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+86",
    skillresearch = 44000,
    skilllearn = [{1,440000},{4,4400}],
    guildlevel = 4,
    skillproperty = [{31,86,0}]
    };
getRow(108)->
    #guildskillCfg {
    id = 108,
    skillid = 2,
    skillicon = 150,
    skilllevel = 33,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+93",
    skillresearch = 46000,
    skilllearn = [{1,460000},{4,4600}],
    guildlevel = 4,
    skillproperty = [{31,93,0}]
    };
getRow(109)->
    #guildskillCfg {
    id = 109,
    skillid = 2,
    skillicon = 150,
    skilllevel = 34,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+100",
    skillresearch = 48000,
    skilllearn = [{1,480000},{4,4800}],
    guildlevel = 4,
    skillproperty = [{31,100,0}]
    };
getRow(110)->
    #guildskillCfg {
    id = 110,
    skillid = 2,
    skillicon = 150,
    skilllevel = 35,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+108",
    skillresearch = 50000,
    skilllearn = [{1,500000},{4,5000}],
    guildlevel = 4,
    skillproperty = [{31,108,0}]
    };
getRow(111)->
    #guildskillCfg {
    id = 111,
    skillid = 2,
    skillicon = 150,
    skilllevel = 36,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+117",
    skillresearch = 52000,
    skilllearn = [{1,520000},{4,5200}],
    guildlevel = 4,
    skillproperty = [{31,117,0}]
    };
getRow(112)->
    #guildskillCfg {
    id = 112,
    skillid = 2,
    skillicon = 150,
    skilllevel = 37,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+126",
    skillresearch = 54000,
    skilllearn = [{1,540000},{4,5400}],
    guildlevel = 4,
    skillproperty = [{31,126,0}]
    };
getRow(113)->
    #guildskillCfg {
    id = 113,
    skillid = 2,
    skillicon = 150,
    skilllevel = 38,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+136",
    skillresearch = 56000,
    skilllearn = [{1,560000},{4,5600}],
    guildlevel = 4,
    skillproperty = [{31,136,0}]
    };
getRow(114)->
    #guildskillCfg {
    id = 114,
    skillid = 2,
    skillicon = 150,
    skilllevel = 39,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+147",
    skillresearch = 58000,
    skilllearn = [{1,580000},{4,5800}],
    guildlevel = 4,
    skillproperty = [{31,147,0}]
    };
getRow(115)->
    #guildskillCfg {
    id = 115,
    skillid = 2,
    skillicon = 150,
    skilllevel = 40,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+159",
    skillresearch = 60000,
    skilllearn = [{1,600000},{4,6000}],
    guildlevel = 4,
    skillproperty = [{31,159,0}]
    };
getRow(116)->
    #guildskillCfg {
    id = 116,
    skillid = 2,
    skillicon = 150,
    skilllevel = 41,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+171",
    skillresearch = 65000,
    skilllearn = [{1,650000},{4,6500}],
    guildlevel = 5,
    skillproperty = [{31,171,0}]
    };
getRow(117)->
    #guildskillCfg {
    id = 117,
    skillid = 2,
    skillicon = 150,
    skilllevel = 42,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+185",
    skillresearch = 70000,
    skilllearn = [{1,700000},{4,7000}],
    guildlevel = 5,
    skillproperty = [{31,185,0}]
    };
getRow(118)->
    #guildskillCfg {
    id = 118,
    skillid = 2,
    skillicon = 150,
    skilllevel = 43,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+200",
    skillresearch = 75000,
    skilllearn = [{1,750000},{4,7500}],
    guildlevel = 5,
    skillproperty = [{31,200,0}]
    };
getRow(119)->
    #guildskillCfg {
    id = 119,
    skillid = 2,
    skillicon = 150,
    skilllevel = 44,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+216",
    skillresearch = 80000,
    skilllearn = [{1,800000},{4,8000}],
    guildlevel = 5,
    skillproperty = [{31,216,0}]
    };
getRow(120)->
    #guildskillCfg {
    id = 120,
    skillid = 2,
    skillicon = 150,
    skilllevel = 45,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+233",
    skillresearch = 85000,
    skilllearn = [{1,850000},{4,8500}],
    guildlevel = 5,
    skillproperty = [{31,233,0}]
    };
getRow(121)->
    #guildskillCfg {
    id = 121,
    skillid = 2,
    skillicon = 150,
    skilllevel = 46,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+251",
    skillresearch = 90000,
    skilllearn = [{1,900000},{4,9000}],
    guildlevel = 5,
    skillproperty = [{31,251,0}]
    };
getRow(122)->
    #guildskillCfg {
    id = 122,
    skillid = 2,
    skillicon = 150,
    skilllevel = 47,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+271",
    skillresearch = 95000,
    skilllearn = [{1,950000},{4,9500}],
    guildlevel = 5,
    skillproperty = [{31,271,0}]
    };
getRow(123)->
    #guildskillCfg {
    id = 123,
    skillid = 2,
    skillicon = 150,
    skilllevel = 48,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+293",
    skillresearch = 100000,
    skilllearn = [{1,1000000},{4,10000}],
    guildlevel = 5,
    skillproperty = [{31,293,0}]
    };
getRow(124)->
    #guildskillCfg {
    id = 124,
    skillid = 2,
    skillicon = 150,
    skilllevel = 49,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+316",
    skillresearch = 105000,
    skilllearn = [{1,1050000},{4,10500}],
    guildlevel = 5,
    skillproperty = [{31,316,0}]
    };
getRow(125)->
    #guildskillCfg {
    id = 125,
    skillid = 2,
    skillicon = 150,
    skilllevel = 50,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+341",
    skillresearch = 110000,
    skilllearn = [{1,1100000},{4,11000}],
    guildlevel = 5,
    skillproperty = [{31,341,0}]
    };
getRow(126)->
    #guildskillCfg {
    id = 126,
    skillid = 2,
    skillicon = 150,
    skilllevel = 51,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+368",
    skillresearch = 115000,
    skilllearn = [{1,1150000},{4,11500}],
    guildlevel = 6,
    skillproperty = [{31,368,0}]
    };
getRow(127)->
    #guildskillCfg {
    id = 127,
    skillid = 2,
    skillicon = 150,
    skilllevel = 52,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+397",
    skillresearch = 120000,
    skilllearn = [{1,1200000},{4,12000}],
    guildlevel = 6,
    skillproperty = [{31,397,0}]
    };
getRow(128)->
    #guildskillCfg {
    id = 128,
    skillid = 2,
    skillicon = 150,
    skilllevel = 53,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+429",
    skillresearch = 125000,
    skilllearn = [{1,1250000},{4,12500}],
    guildlevel = 6,
    skillproperty = [{31,429,0}]
    };
getRow(129)->
    #guildskillCfg {
    id = 129,
    skillid = 2,
    skillicon = 150,
    skilllevel = 54,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+463",
    skillresearch = 130000,
    skilllearn = [{1,1300000},{4,13000}],
    guildlevel = 6,
    skillproperty = [{31,463,0}]
    };
getRow(130)->
    #guildskillCfg {
    id = 130,
    skillid = 2,
    skillicon = 150,
    skilllevel = 55,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+500",
    skillresearch = 135000,
    skilllearn = [{1,1350000},{4,13500}],
    guildlevel = 6,
    skillproperty = [{31,500,0}]
    };
getRow(131)->
    #guildskillCfg {
    id = 131,
    skillid = 2,
    skillicon = 150,
    skilllevel = 56,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+540",
    skillresearch = 140000,
    skilllearn = [{1,1400000},{4,14000}],
    guildlevel = 6,
    skillproperty = [{31,540,0}]
    };
getRow(132)->
    #guildskillCfg {
    id = 132,
    skillid = 2,
    skillicon = 150,
    skilllevel = 57,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+582",
    skillresearch = 145000,
    skilllearn = [{1,1450000},{4,14500}],
    guildlevel = 6,
    skillproperty = [{31,582,0}]
    };
getRow(133)->
    #guildskillCfg {
    id = 133,
    skillid = 2,
    skillicon = 150,
    skilllevel = 58,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+629",
    skillresearch = 150000,
    skilllearn = [{1,1500000},{4,15000}],
    guildlevel = 6,
    skillproperty = [{31,629,0}]
    };
getRow(134)->
    #guildskillCfg {
    id = 134,
    skillid = 2,
    skillicon = 150,
    skilllevel = 59,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+678",
    skillresearch = 155000,
    skilllearn = [{1,1550000},{4,15500}],
    guildlevel = 6,
    skillproperty = [{31,678,0}]
    };
getRow(135)->
    #guildskillCfg {
    id = 135,
    skillid = 2,
    skillicon = 150,
    skilllevel = 60,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+732",
    skillresearch = 160000,
    skilllearn = [{1,1600000},{4,16000}],
    guildlevel = 6,
    skillproperty = [{31,732,0}]
    };
getRow(136)->
    #guildskillCfg {
    id = 136,
    skillid = 2,
    skillicon = 150,
    skilllevel = 61,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+782",
    skillresearch = 170000,
    skilllearn = [{1,1700000},{4,17000}],
    guildlevel = 7,
    skillproperty = [{31,782,0}]
    };
getRow(137)->
    #guildskillCfg {
    id = 137,
    skillid = 2,
    skillicon = 150,
    skilllevel = 62,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+832",
    skillresearch = 180000,
    skilllearn = [{1,1800000},{4,18000}],
    guildlevel = 7,
    skillproperty = [{31,832,0}]
    };
getRow(138)->
    #guildskillCfg {
    id = 138,
    skillid = 2,
    skillicon = 150,
    skilllevel = 63,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+882",
    skillresearch = 190000,
    skilllearn = [{1,1900000},{4,19000}],
    guildlevel = 7,
    skillproperty = [{31,882,0}]
    };
getRow(139)->
    #guildskillCfg {
    id = 139,
    skillid = 2,
    skillicon = 150,
    skilllevel = 64,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+932",
    skillresearch = 200000,
    skilllearn = [{1,2000000},{4,20000}],
    guildlevel = 7,
    skillproperty = [{31,932,0}]
    };
getRow(140)->
    #guildskillCfg {
    id = 140,
    skillid = 2,
    skillicon = 150,
    skilllevel = 65,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+982",
    skillresearch = 210000,
    skilllearn = [{1,2100000},{4,21000}],
    guildlevel = 7,
    skillproperty = [{31,982,0}]
    };
getRow(141)->
    #guildskillCfg {
    id = 141,
    skillid = 2,
    skillicon = 150,
    skilllevel = 66,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+1032",
    skillresearch = 220000,
    skilllearn = [{1,2200000},{4,22000}],
    guildlevel = 7,
    skillproperty = [{31,1032,0}]
    };
getRow(142)->
    #guildskillCfg {
    id = 142,
    skillid = 2,
    skillicon = 150,
    skilllevel = 67,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+1082",
    skillresearch = 230000,
    skilllearn = [{1,2300000},{4,23000}],
    guildlevel = 7,
    skillproperty = [{31,1082,0}]
    };
getRow(143)->
    #guildskillCfg {
    id = 143,
    skillid = 2,
    skillicon = 150,
    skilllevel = 68,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+1132",
    skillresearch = 240000,
    skilllearn = [{1,2400000},{4,24000}],
    guildlevel = 7,
    skillproperty = [{31,1132,0}]
    };
getRow(144)->
    #guildskillCfg {
    id = 144,
    skillid = 2,
    skillicon = 150,
    skilllevel = 69,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+1182",
    skillresearch = 250000,
    skilllearn = [{1,2500000},{4,25000}],
    guildlevel = 7,
    skillproperty = [{31,1182,0}]
    };
getRow(145)->
    #guildskillCfg {
    id = 145,
    skillid = 2,
    skillicon = 150,
    skilllevel = 70,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+1232",
    skillresearch = 260000,
    skilllearn = [{1,2600000},{4,26000}],
    guildlevel = 7,
    skillproperty = [{31,1232,0}]
    };
getRow(146)->
    #guildskillCfg {
    id = 146,
    skillid = 2,
    skillicon = 150,
    skilllevel = 71,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+1282",
    skillresearch = 270000,
    skilllearn = [{1,2700000},{4,27000}],
    guildlevel = 8,
    skillproperty = [{31,1282,0}]
    };
getRow(147)->
    #guildskillCfg {
    id = 147,
    skillid = 2,
    skillicon = 150,
    skilllevel = 72,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+1347",
    skillresearch = 280000,
    skilllearn = [{1,2800000},{4,28000}],
    guildlevel = 8,
    skillproperty = [{31,1347,0}]
    };
getRow(148)->
    #guildskillCfg {
    id = 148,
    skillid = 2,
    skillicon = 150,
    skilllevel = 73,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+1412",
    skillresearch = 290000,
    skilllearn = [{1,2900000},{4,29000}],
    guildlevel = 8,
    skillproperty = [{31,1412,0}]
    };
getRow(149)->
    #guildskillCfg {
    id = 149,
    skillid = 2,
    skillicon = 150,
    skilllevel = 74,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+1477",
    skillresearch = 300000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{31,1477,0}]
    };
getRow(150)->
    #guildskillCfg {
    id = 150,
    skillid = 2,
    skillicon = 150,
    skilllevel = 75,
    skillname = "嗜血狂歌",
    skilldes = "物理伤害+1542",
    skillresearch = 310000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{31,1542,0}]
    };
getRow(151)->
    #guildskillCfg {
    id = 151,
    skillid = 3,
    skillicon = 149,
    skilllevel = 1,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+7",
    skillresearch = 1000,
    skilllearn = [{1,10000},{4,100}],
    guildlevel = 1,
    skillproperty = [{32,7,0}]
    };
getRow(152)->
    #guildskillCfg {
    id = 152,
    skillid = 3,
    skillicon = 149,
    skilllevel = 2,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+8",
    skillresearch = 2000,
    skilllearn = [{1,20000},{4,200}],
    guildlevel = 1,
    skillproperty = [{32,8,0}]
    };
getRow(153)->
    #guildskillCfg {
    id = 153,
    skillid = 3,
    skillicon = 149,
    skilllevel = 3,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+9",
    skillresearch = 3000,
    skilllearn = [{1,30000},{4,300}],
    guildlevel = 1,
    skillproperty = [{32,9,0}]
    };
getRow(154)->
    #guildskillCfg {
    id = 154,
    skillid = 3,
    skillicon = 149,
    skilllevel = 4,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+10",
    skillresearch = 4000,
    skilllearn = [{1,40000},{4,400}],
    guildlevel = 1,
    skillproperty = [{32,10,0}]
    };
getRow(155)->
    #guildskillCfg {
    id = 155,
    skillid = 3,
    skillicon = 149,
    skilllevel = 5,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+11",
    skillresearch = 5000,
    skilllearn = [{1,50000},{4,500}],
    guildlevel = 1,
    skillproperty = [{32,11,0}]
    };
getRow(156)->
    #guildskillCfg {
    id = 156,
    skillid = 3,
    skillicon = 149,
    skilllevel = 6,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+12",
    skillresearch = 6000,
    skilllearn = [{1,60000},{4,600}],
    guildlevel = 1,
    skillproperty = [{32,12,0}]
    };
getRow(157)->
    #guildskillCfg {
    id = 157,
    skillid = 3,
    skillicon = 149,
    skilllevel = 7,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+13",
    skillresearch = 7000,
    skilllearn = [{1,70000},{4,700}],
    guildlevel = 1,
    skillproperty = [{32,13,0}]
    };
getRow(158)->
    #guildskillCfg {
    id = 158,
    skillid = 3,
    skillicon = 149,
    skilllevel = 8,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+14",
    skillresearch = 8000,
    skilllearn = [{1,80000},{4,800}],
    guildlevel = 1,
    skillproperty = [{32,14,0}]
    };
getRow(159)->
    #guildskillCfg {
    id = 159,
    skillid = 3,
    skillicon = 149,
    skilllevel = 9,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+15",
    skillresearch = 9000,
    skilllearn = [{1,90000},{4,900}],
    guildlevel = 1,
    skillproperty = [{32,15,0}]
    };
getRow(160)->
    #guildskillCfg {
    id = 160,
    skillid = 3,
    skillicon = 149,
    skilllevel = 10,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+16",
    skillresearch = 10000,
    skilllearn = [{1,100000},{4,1000}],
    guildlevel = 1,
    skillproperty = [{32,16,0}]
    };
getRow(161)->
    #guildskillCfg {
    id = 161,
    skillid = 3,
    skillicon = 149,
    skilllevel = 11,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+17",
    skillresearch = 11000,
    skilllearn = [{1,110000},{4,1100}],
    guildlevel = 2,
    skillproperty = [{32,17,0}]
    };
getRow(162)->
    #guildskillCfg {
    id = 162,
    skillid = 3,
    skillicon = 149,
    skilllevel = 12,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+19",
    skillresearch = 12000,
    skilllearn = [{1,120000},{4,1200}],
    guildlevel = 2,
    skillproperty = [{32,19,0}]
    };
getRow(163)->
    #guildskillCfg {
    id = 163,
    skillid = 3,
    skillicon = 149,
    skilllevel = 13,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+20",
    skillresearch = 13000,
    skilllearn = [{1,130000},{4,1300}],
    guildlevel = 2,
    skillproperty = [{32,20,0}]
    };
getRow(164)->
    #guildskillCfg {
    id = 164,
    skillid = 3,
    skillicon = 149,
    skilllevel = 14,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+22",
    skillresearch = 14000,
    skilllearn = [{1,140000},{4,1400}],
    guildlevel = 2,
    skillproperty = [{32,22,0}]
    };
getRow(165)->
    #guildskillCfg {
    id = 165,
    skillid = 3,
    skillicon = 149,
    skilllevel = 15,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+23",
    skillresearch = 15000,
    skilllearn = [{1,150000},{4,1500}],
    guildlevel = 2,
    skillproperty = [{32,23,0}]
    };
getRow(166)->
    #guildskillCfg {
    id = 166,
    skillid = 3,
    skillicon = 149,
    skilllevel = 16,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+25",
    skillresearch = 16000,
    skilllearn = [{1,160000},{4,1600}],
    guildlevel = 2,
    skillproperty = [{32,25,0}]
    };
getRow(167)->
    #guildskillCfg {
    id = 167,
    skillid = 3,
    skillicon = 149,
    skilllevel = 17,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+27",
    skillresearch = 17000,
    skilllearn = [{1,170000},{4,1700}],
    guildlevel = 2,
    skillproperty = [{32,27,0}]
    };
getRow(168)->
    #guildskillCfg {
    id = 168,
    skillid = 3,
    skillicon = 149,
    skilllevel = 18,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+29",
    skillresearch = 18000,
    skilllearn = [{1,180000},{4,1800}],
    guildlevel = 2,
    skillproperty = [{32,29,0}]
    };
getRow(169)->
    #guildskillCfg {
    id = 169,
    skillid = 3,
    skillicon = 149,
    skilllevel = 19,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+32",
    skillresearch = 19000,
    skilllearn = [{1,190000},{4,1900}],
    guildlevel = 2,
    skillproperty = [{32,32,0}]
    };
getRow(170)->
    #guildskillCfg {
    id = 170,
    skillid = 3,
    skillicon = 149,
    skilllevel = 20,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+34",
    skillresearch = 20000,
    skilllearn = [{1,200000},{4,2000}],
    guildlevel = 2,
    skillproperty = [{32,34,0}]
    };
getRow(171)->
    #guildskillCfg {
    id = 171,
    skillid = 3,
    skillicon = 149,
    skilllevel = 21,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+37",
    skillresearch = 22000,
    skilllearn = [{1,220000},{4,2200}],
    guildlevel = 3,
    skillproperty = [{32,37,0}]
    };
getRow(172)->
    #guildskillCfg {
    id = 172,
    skillid = 3,
    skillicon = 149,
    skilllevel = 22,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+40",
    skillresearch = 24000,
    skilllearn = [{1,240000},{4,2400}],
    guildlevel = 3,
    skillproperty = [{32,40,0}]
    };
getRow(173)->
    #guildskillCfg {
    id = 173,
    skillid = 3,
    skillicon = 149,
    skilllevel = 23,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+43",
    skillresearch = 26000,
    skilllearn = [{1,260000},{4,2600}],
    guildlevel = 3,
    skillproperty = [{32,43,0}]
    };
getRow(174)->
    #guildskillCfg {
    id = 174,
    skillid = 3,
    skillicon = 149,
    skilllevel = 24,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+47",
    skillresearch = 28000,
    skilllearn = [{1,280000},{4,2800}],
    guildlevel = 3,
    skillproperty = [{32,47,0}]
    };
getRow(175)->
    #guildskillCfg {
    id = 175,
    skillid = 3,
    skillicon = 149,
    skilllevel = 25,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+50",
    skillresearch = 30000,
    skilllearn = [{1,300000},{4,3000}],
    guildlevel = 3,
    skillproperty = [{32,50,0}]
    };
getRow(176)->
    #guildskillCfg {
    id = 176,
    skillid = 3,
    skillicon = 149,
    skilllevel = 26,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+54",
    skillresearch = 32000,
    skilllearn = [{1,320000},{4,3200}],
    guildlevel = 3,
    skillproperty = [{32,54,0}]
    };
getRow(177)->
    #guildskillCfg {
    id = 177,
    skillid = 3,
    skillicon = 149,
    skilllevel = 27,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+59",
    skillresearch = 34000,
    skilllearn = [{1,340000},{4,3400}],
    guildlevel = 3,
    skillproperty = [{32,59,0}]
    };
getRow(178)->
    #guildskillCfg {
    id = 178,
    skillid = 3,
    skillicon = 149,
    skilllevel = 28,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+63",
    skillresearch = 36000,
    skilllearn = [{1,360000},{4,3600}],
    guildlevel = 3,
    skillproperty = [{32,63,0}]
    };
getRow(179)->
    #guildskillCfg {
    id = 179,
    skillid = 3,
    skillicon = 149,
    skilllevel = 29,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+68",
    skillresearch = 38000,
    skilllearn = [{1,380000},{4,3800}],
    guildlevel = 3,
    skillproperty = [{32,68,0}]
    };
getRow(180)->
    #guildskillCfg {
    id = 180,
    skillid = 3,
    skillicon = 149,
    skilllevel = 30,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+74",
    skillresearch = 40000,
    skilllearn = [{1,400000},{4,4000}],
    guildlevel = 3,
    skillproperty = [{32,74,0}]
    };
getRow(181)->
    #guildskillCfg {
    id = 181,
    skillid = 3,
    skillicon = 149,
    skilllevel = 31,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+80",
    skillresearch = 42000,
    skilllearn = [{1,420000},{4,4200}],
    guildlevel = 4,
    skillproperty = [{32,80,0}]
    };
getRow(182)->
    #guildskillCfg {
    id = 182,
    skillid = 3,
    skillicon = 149,
    skilllevel = 32,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+86",
    skillresearch = 44000,
    skilllearn = [{1,440000},{4,4400}],
    guildlevel = 4,
    skillproperty = [{32,86,0}]
    };
getRow(183)->
    #guildskillCfg {
    id = 183,
    skillid = 3,
    skillicon = 149,
    skilllevel = 33,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+93",
    skillresearch = 46000,
    skilllearn = [{1,460000},{4,4600}],
    guildlevel = 4,
    skillproperty = [{32,93,0}]
    };
getRow(184)->
    #guildskillCfg {
    id = 184,
    skillid = 3,
    skillicon = 149,
    skilllevel = 34,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+100",
    skillresearch = 48000,
    skilllearn = [{1,480000},{4,4800}],
    guildlevel = 4,
    skillproperty = [{32,100,0}]
    };
getRow(185)->
    #guildskillCfg {
    id = 185,
    skillid = 3,
    skillicon = 149,
    skilllevel = 35,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+108",
    skillresearch = 50000,
    skilllearn = [{1,500000},{4,5000}],
    guildlevel = 4,
    skillproperty = [{32,108,0}]
    };
getRow(186)->
    #guildskillCfg {
    id = 186,
    skillid = 3,
    skillicon = 149,
    skilllevel = 36,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+117",
    skillresearch = 52000,
    skilllearn = [{1,520000},{4,5200}],
    guildlevel = 4,
    skillproperty = [{32,117,0}]
    };
getRow(187)->
    #guildskillCfg {
    id = 187,
    skillid = 3,
    skillicon = 149,
    skilllevel = 37,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+126",
    skillresearch = 54000,
    skilllearn = [{1,540000},{4,5400}],
    guildlevel = 4,
    skillproperty = [{32,126,0}]
    };
getRow(188)->
    #guildskillCfg {
    id = 188,
    skillid = 3,
    skillicon = 149,
    skilllevel = 38,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+136",
    skillresearch = 56000,
    skilllearn = [{1,560000},{4,5600}],
    guildlevel = 4,
    skillproperty = [{32,136,0}]
    };
getRow(189)->
    #guildskillCfg {
    id = 189,
    skillid = 3,
    skillicon = 149,
    skilllevel = 39,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+147",
    skillresearch = 58000,
    skilllearn = [{1,580000},{4,5800}],
    guildlevel = 4,
    skillproperty = [{32,147,0}]
    };
getRow(190)->
    #guildskillCfg {
    id = 190,
    skillid = 3,
    skillicon = 149,
    skilllevel = 40,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+159",
    skillresearch = 60000,
    skilllearn = [{1,600000},{4,6000}],
    guildlevel = 4,
    skillproperty = [{32,159,0}]
    };
getRow(191)->
    #guildskillCfg {
    id = 191,
    skillid = 3,
    skillicon = 149,
    skilllevel = 41,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+171",
    skillresearch = 65000,
    skilllearn = [{1,650000},{4,6500}],
    guildlevel = 5,
    skillproperty = [{32,171,0}]
    };
getRow(192)->
    #guildskillCfg {
    id = 192,
    skillid = 3,
    skillicon = 149,
    skilllevel = 42,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+185",
    skillresearch = 70000,
    skilllearn = [{1,700000},{4,7000}],
    guildlevel = 5,
    skillproperty = [{32,185,0}]
    };
getRow(193)->
    #guildskillCfg {
    id = 193,
    skillid = 3,
    skillicon = 149,
    skilllevel = 43,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+200",
    skillresearch = 75000,
    skilllearn = [{1,750000},{4,7500}],
    guildlevel = 5,
    skillproperty = [{32,200,0}]
    };
getRow(194)->
    #guildskillCfg {
    id = 194,
    skillid = 3,
    skillicon = 149,
    skilllevel = 44,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+216",
    skillresearch = 80000,
    skilllearn = [{1,800000},{4,8000}],
    guildlevel = 5,
    skillproperty = [{32,216,0}]
    };
getRow(195)->
    #guildskillCfg {
    id = 195,
    skillid = 3,
    skillicon = 149,
    skilllevel = 45,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+233",
    skillresearch = 85000,
    skilllearn = [{1,850000},{4,8500}],
    guildlevel = 5,
    skillproperty = [{32,233,0}]
    };
getRow(196)->
    #guildskillCfg {
    id = 196,
    skillid = 3,
    skillicon = 149,
    skilllevel = 46,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+251",
    skillresearch = 90000,
    skilllearn = [{1,900000},{4,9000}],
    guildlevel = 5,
    skillproperty = [{32,251,0}]
    };
getRow(197)->
    #guildskillCfg {
    id = 197,
    skillid = 3,
    skillicon = 149,
    skilllevel = 47,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+271",
    skillresearch = 95000,
    skilllearn = [{1,950000},{4,9500}],
    guildlevel = 5,
    skillproperty = [{32,271,0}]
    };
getRow(198)->
    #guildskillCfg {
    id = 198,
    skillid = 3,
    skillicon = 149,
    skilllevel = 48,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+293",
    skillresearch = 100000,
    skilllearn = [{1,1000000},{4,10000}],
    guildlevel = 5,
    skillproperty = [{32,293,0}]
    };
getRow(199)->
    #guildskillCfg {
    id = 199,
    skillid = 3,
    skillicon = 149,
    skilllevel = 49,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+316",
    skillresearch = 105000,
    skilllearn = [{1,1050000},{4,10500}],
    guildlevel = 5,
    skillproperty = [{32,316,0}]
    };
getRow(200)->
    #guildskillCfg {
    id = 200,
    skillid = 3,
    skillicon = 149,
    skilllevel = 50,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+341",
    skillresearch = 110000,
    skilllearn = [{1,1100000},{4,11000}],
    guildlevel = 5,
    skillproperty = [{32,341,0}]
    };
getRow(201)->
    #guildskillCfg {
    id = 201,
    skillid = 3,
    skillicon = 149,
    skilllevel = 51,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+368",
    skillresearch = 115000,
    skilllearn = [{1,1150000},{4,11500}],
    guildlevel = 6,
    skillproperty = [{32,368,0}]
    };
getRow(202)->
    #guildskillCfg {
    id = 202,
    skillid = 3,
    skillicon = 149,
    skilllevel = 52,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+397",
    skillresearch = 120000,
    skilllearn = [{1,1200000},{4,12000}],
    guildlevel = 6,
    skillproperty = [{32,397,0}]
    };
getRow(203)->
    #guildskillCfg {
    id = 203,
    skillid = 3,
    skillicon = 149,
    skilllevel = 53,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+429",
    skillresearch = 125000,
    skilllearn = [{1,1250000},{4,12500}],
    guildlevel = 6,
    skillproperty = [{32,429,0}]
    };
getRow(204)->
    #guildskillCfg {
    id = 204,
    skillid = 3,
    skillicon = 149,
    skilllevel = 54,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+463",
    skillresearch = 130000,
    skilllearn = [{1,1300000},{4,13000}],
    guildlevel = 6,
    skillproperty = [{32,463,0}]
    };
getRow(205)->
    #guildskillCfg {
    id = 205,
    skillid = 3,
    skillicon = 149,
    skilllevel = 55,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+500",
    skillresearch = 135000,
    skilllearn = [{1,1350000},{4,13500}],
    guildlevel = 6,
    skillproperty = [{32,500,0}]
    };
getRow(206)->
    #guildskillCfg {
    id = 206,
    skillid = 3,
    skillicon = 149,
    skilllevel = 56,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+540",
    skillresearch = 140000,
    skilllearn = [{1,1400000},{4,14000}],
    guildlevel = 6,
    skillproperty = [{32,540,0}]
    };
getRow(207)->
    #guildskillCfg {
    id = 207,
    skillid = 3,
    skillicon = 149,
    skilllevel = 57,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+582",
    skillresearch = 145000,
    skilllearn = [{1,1450000},{4,14500}],
    guildlevel = 6,
    skillproperty = [{32,582,0}]
    };
getRow(208)->
    #guildskillCfg {
    id = 208,
    skillid = 3,
    skillicon = 149,
    skilllevel = 58,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+629",
    skillresearch = 150000,
    skilllearn = [{1,1500000},{4,15000}],
    guildlevel = 6,
    skillproperty = [{32,629,0}]
    };
getRow(209)->
    #guildskillCfg {
    id = 209,
    skillid = 3,
    skillicon = 149,
    skilllevel = 59,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+678",
    skillresearch = 155000,
    skilllearn = [{1,1550000},{4,15500}],
    guildlevel = 6,
    skillproperty = [{32,678,0}]
    };
getRow(210)->
    #guildskillCfg {
    id = 210,
    skillid = 3,
    skillicon = 149,
    skilllevel = 60,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+732",
    skillresearch = 160000,
    skilllearn = [{1,1600000},{4,16000}],
    guildlevel = 6,
    skillproperty = [{32,732,0}]
    };
getRow(211)->
    #guildskillCfg {
    id = 211,
    skillid = 3,
    skillicon = 149,
    skilllevel = 61,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+782",
    skillresearch = 170000,
    skilllearn = [{1,1700000},{4,17000}],
    guildlevel = 7,
    skillproperty = [{32,782,0}]
    };
getRow(212)->
    #guildskillCfg {
    id = 212,
    skillid = 3,
    skillicon = 149,
    skilllevel = 62,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+832",
    skillresearch = 180000,
    skilllearn = [{1,1800000},{4,18000}],
    guildlevel = 7,
    skillproperty = [{32,832,0}]
    };
getRow(213)->
    #guildskillCfg {
    id = 213,
    skillid = 3,
    skillicon = 149,
    skilllevel = 63,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+882",
    skillresearch = 190000,
    skilllearn = [{1,1900000},{4,19000}],
    guildlevel = 7,
    skillproperty = [{32,882,0}]
    };
getRow(214)->
    #guildskillCfg {
    id = 214,
    skillid = 3,
    skillicon = 149,
    skilllevel = 64,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+932",
    skillresearch = 200000,
    skilllearn = [{1,2000000},{4,20000}],
    guildlevel = 7,
    skillproperty = [{32,932,0}]
    };
getRow(215)->
    #guildskillCfg {
    id = 215,
    skillid = 3,
    skillicon = 149,
    skilllevel = 65,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+982",
    skillresearch = 210000,
    skilllearn = [{1,2100000},{4,21000}],
    guildlevel = 7,
    skillproperty = [{32,982,0}]
    };
getRow(216)->
    #guildskillCfg {
    id = 216,
    skillid = 3,
    skillicon = 149,
    skilllevel = 66,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+1032",
    skillresearch = 220000,
    skilllearn = [{1,2200000},{4,22000}],
    guildlevel = 7,
    skillproperty = [{32,1032,0}]
    };
getRow(217)->
    #guildskillCfg {
    id = 217,
    skillid = 3,
    skillicon = 149,
    skilllevel = 67,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+1082",
    skillresearch = 230000,
    skilllearn = [{1,2300000},{4,23000}],
    guildlevel = 7,
    skillproperty = [{32,1082,0}]
    };
getRow(218)->
    #guildskillCfg {
    id = 218,
    skillid = 3,
    skillicon = 149,
    skilllevel = 68,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+1132",
    skillresearch = 240000,
    skilllearn = [{1,2400000},{4,24000}],
    guildlevel = 7,
    skillproperty = [{32,1132,0}]
    };
getRow(219)->
    #guildskillCfg {
    id = 219,
    skillid = 3,
    skillicon = 149,
    skilllevel = 69,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+1182",
    skillresearch = 250000,
    skilllearn = [{1,2500000},{4,25000}],
    guildlevel = 7,
    skillproperty = [{32,1182,0}]
    };
getRow(220)->
    #guildskillCfg {
    id = 220,
    skillid = 3,
    skillicon = 149,
    skilllevel = 70,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+1232",
    skillresearch = 260000,
    skilllearn = [{1,2600000},{4,26000}],
    guildlevel = 7,
    skillproperty = [{32,1232,0}]
    };
getRow(221)->
    #guildskillCfg {
    id = 221,
    skillid = 3,
    skillicon = 149,
    skilllevel = 71,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+1282",
    skillresearch = 270000,
    skilllearn = [{1,2700000},{4,27000}],
    guildlevel = 8,
    skillproperty = [{32,1282,0}]
    };
getRow(222)->
    #guildskillCfg {
    id = 222,
    skillid = 3,
    skillicon = 149,
    skilllevel = 72,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+1347",
    skillresearch = 280000,
    skilllearn = [{1,2800000},{4,28000}],
    guildlevel = 8,
    skillproperty = [{32,1347,0}]
    };
getRow(223)->
    #guildskillCfg {
    id = 223,
    skillid = 3,
    skillicon = 149,
    skilllevel = 73,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+1412",
    skillresearch = 290000,
    skilllearn = [{1,2900000},{4,29000}],
    guildlevel = 8,
    skillproperty = [{32,1412,0}]
    };
getRow(224)->
    #guildskillCfg {
    id = 224,
    skillid = 3,
    skillicon = 149,
    skilllevel = 74,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+1477",
    skillresearch = 300000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{32,1477,0}]
    };
getRow(225)->
    #guildskillCfg {
    id = 225,
    skillid = 3,
    skillicon = 149,
    skilllevel = 75,
    skillname = "黑暗祈祷",
    skilldes = "暗影伤害+1542",
    skillresearch = 310000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{32,1542,0}]
    };
getRow(226)->
    #guildskillCfg {
    id = 226,
    skillid = 4,
    skillicon = 152,
    skilllevel = 1,
    skillname = "奥术强化",
    skilldes = "元素伤害+7",
    skillresearch = 1000,
    skilllearn = [{1,10000},{4,100}],
    guildlevel = 1,
    skillproperty = [{33,7,0}]
    };
getRow(227)->
    #guildskillCfg {
    id = 227,
    skillid = 4,
    skillicon = 152,
    skilllevel = 2,
    skillname = "奥术强化",
    skilldes = "元素伤害+8",
    skillresearch = 2000,
    skilllearn = [{1,20000},{4,200}],
    guildlevel = 1,
    skillproperty = [{33,8,0}]
    };
getRow(228)->
    #guildskillCfg {
    id = 228,
    skillid = 4,
    skillicon = 152,
    skilllevel = 3,
    skillname = "奥术强化",
    skilldes = "元素伤害+9",
    skillresearch = 3000,
    skilllearn = [{1,30000},{4,300}],
    guildlevel = 1,
    skillproperty = [{33,9,0}]
    };
getRow(229)->
    #guildskillCfg {
    id = 229,
    skillid = 4,
    skillicon = 152,
    skilllevel = 4,
    skillname = "奥术强化",
    skilldes = "元素伤害+10",
    skillresearch = 4000,
    skilllearn = [{1,40000},{4,400}],
    guildlevel = 1,
    skillproperty = [{33,10,0}]
    };
getRow(230)->
    #guildskillCfg {
    id = 230,
    skillid = 4,
    skillicon = 152,
    skilllevel = 5,
    skillname = "奥术强化",
    skilldes = "元素伤害+11",
    skillresearch = 5000,
    skilllearn = [{1,50000},{4,500}],
    guildlevel = 1,
    skillproperty = [{33,11,0}]
    };
getRow(231)->
    #guildskillCfg {
    id = 231,
    skillid = 4,
    skillicon = 152,
    skilllevel = 6,
    skillname = "奥术强化",
    skilldes = "元素伤害+12",
    skillresearch = 6000,
    skilllearn = [{1,60000},{4,600}],
    guildlevel = 1,
    skillproperty = [{33,12,0}]
    };
getRow(232)->
    #guildskillCfg {
    id = 232,
    skillid = 4,
    skillicon = 152,
    skilllevel = 7,
    skillname = "奥术强化",
    skilldes = "元素伤害+13",
    skillresearch = 7000,
    skilllearn = [{1,70000},{4,700}],
    guildlevel = 1,
    skillproperty = [{33,13,0}]
    };
getRow(233)->
    #guildskillCfg {
    id = 233,
    skillid = 4,
    skillicon = 152,
    skilllevel = 8,
    skillname = "奥术强化",
    skilldes = "元素伤害+14",
    skillresearch = 8000,
    skilllearn = [{1,80000},{4,800}],
    guildlevel = 1,
    skillproperty = [{33,14,0}]
    };
getRow(234)->
    #guildskillCfg {
    id = 234,
    skillid = 4,
    skillicon = 152,
    skilllevel = 9,
    skillname = "奥术强化",
    skilldes = "元素伤害+15",
    skillresearch = 9000,
    skilllearn = [{1,90000},{4,900}],
    guildlevel = 1,
    skillproperty = [{33,15,0}]
    };
getRow(235)->
    #guildskillCfg {
    id = 235,
    skillid = 4,
    skillicon = 152,
    skilllevel = 10,
    skillname = "奥术强化",
    skilldes = "元素伤害+16",
    skillresearch = 10000,
    skilllearn = [{1,100000},{4,1000}],
    guildlevel = 1,
    skillproperty = [{33,16,0}]
    };
getRow(236)->
    #guildskillCfg {
    id = 236,
    skillid = 4,
    skillicon = 152,
    skilllevel = 11,
    skillname = "奥术强化",
    skilldes = "元素伤害+17",
    skillresearch = 11000,
    skilllearn = [{1,110000},{4,1100}],
    guildlevel = 2,
    skillproperty = [{33,17,0}]
    };
getRow(237)->
    #guildskillCfg {
    id = 237,
    skillid = 4,
    skillicon = 152,
    skilllevel = 12,
    skillname = "奥术强化",
    skilldes = "元素伤害+19",
    skillresearch = 12000,
    skilllearn = [{1,120000},{4,1200}],
    guildlevel = 2,
    skillproperty = [{33,19,0}]
    };
getRow(238)->
    #guildskillCfg {
    id = 238,
    skillid = 4,
    skillicon = 152,
    skilllevel = 13,
    skillname = "奥术强化",
    skilldes = "元素伤害+20",
    skillresearch = 13000,
    skilllearn = [{1,130000},{4,1300}],
    guildlevel = 2,
    skillproperty = [{33,20,0}]
    };
getRow(239)->
    #guildskillCfg {
    id = 239,
    skillid = 4,
    skillicon = 152,
    skilllevel = 14,
    skillname = "奥术强化",
    skilldes = "元素伤害+22",
    skillresearch = 14000,
    skilllearn = [{1,140000},{4,1400}],
    guildlevel = 2,
    skillproperty = [{33,22,0}]
    };
getRow(240)->
    #guildskillCfg {
    id = 240,
    skillid = 4,
    skillicon = 152,
    skilllevel = 15,
    skillname = "奥术强化",
    skilldes = "元素伤害+23",
    skillresearch = 15000,
    skilllearn = [{1,150000},{4,1500}],
    guildlevel = 2,
    skillproperty = [{33,23,0}]
    };
getRow(241)->
    #guildskillCfg {
    id = 241,
    skillid = 4,
    skillicon = 152,
    skilllevel = 16,
    skillname = "奥术强化",
    skilldes = "元素伤害+25",
    skillresearch = 16000,
    skilllearn = [{1,160000},{4,1600}],
    guildlevel = 2,
    skillproperty = [{33,25,0}]
    };
getRow(242)->
    #guildskillCfg {
    id = 242,
    skillid = 4,
    skillicon = 152,
    skilllevel = 17,
    skillname = "奥术强化",
    skilldes = "元素伤害+27",
    skillresearch = 17000,
    skilllearn = [{1,170000},{4,1700}],
    guildlevel = 2,
    skillproperty = [{33,27,0}]
    };
getRow(243)->
    #guildskillCfg {
    id = 243,
    skillid = 4,
    skillicon = 152,
    skilllevel = 18,
    skillname = "奥术强化",
    skilldes = "元素伤害+29",
    skillresearch = 18000,
    skilllearn = [{1,180000},{4,1800}],
    guildlevel = 2,
    skillproperty = [{33,29,0}]
    };
getRow(244)->
    #guildskillCfg {
    id = 244,
    skillid = 4,
    skillicon = 152,
    skilllevel = 19,
    skillname = "奥术强化",
    skilldes = "元素伤害+32",
    skillresearch = 19000,
    skilllearn = [{1,190000},{4,1900}],
    guildlevel = 2,
    skillproperty = [{33,32,0}]
    };
getRow(245)->
    #guildskillCfg {
    id = 245,
    skillid = 4,
    skillicon = 152,
    skilllevel = 20,
    skillname = "奥术强化",
    skilldes = "元素伤害+34",
    skillresearch = 20000,
    skilllearn = [{1,200000},{4,2000}],
    guildlevel = 2,
    skillproperty = [{33,34,0}]
    };
getRow(246)->
    #guildskillCfg {
    id = 246,
    skillid = 4,
    skillicon = 152,
    skilllevel = 21,
    skillname = "奥术强化",
    skilldes = "元素伤害+37",
    skillresearch = 22000,
    skilllearn = [{1,220000},{4,2200}],
    guildlevel = 3,
    skillproperty = [{33,37,0}]
    };
getRow(247)->
    #guildskillCfg {
    id = 247,
    skillid = 4,
    skillicon = 152,
    skilllevel = 22,
    skillname = "奥术强化",
    skilldes = "元素伤害+40",
    skillresearch = 24000,
    skilllearn = [{1,240000},{4,2400}],
    guildlevel = 3,
    skillproperty = [{33,40,0}]
    };
getRow(248)->
    #guildskillCfg {
    id = 248,
    skillid = 4,
    skillicon = 152,
    skilllevel = 23,
    skillname = "奥术强化",
    skilldes = "元素伤害+43",
    skillresearch = 26000,
    skilllearn = [{1,260000},{4,2600}],
    guildlevel = 3,
    skillproperty = [{33,43,0}]
    };
getRow(249)->
    #guildskillCfg {
    id = 249,
    skillid = 4,
    skillicon = 152,
    skilllevel = 24,
    skillname = "奥术强化",
    skilldes = "元素伤害+47",
    skillresearch = 28000,
    skilllearn = [{1,280000},{4,2800}],
    guildlevel = 3,
    skillproperty = [{33,47,0}]
    };
getRow(250)->
    #guildskillCfg {
    id = 250,
    skillid = 4,
    skillicon = 152,
    skilllevel = 25,
    skillname = "奥术强化",
    skilldes = "元素伤害+50",
    skillresearch = 30000,
    skilllearn = [{1,300000},{4,3000}],
    guildlevel = 3,
    skillproperty = [{33,50,0}]
    };
getRow(251)->
    #guildskillCfg {
    id = 251,
    skillid = 4,
    skillicon = 152,
    skilllevel = 26,
    skillname = "奥术强化",
    skilldes = "元素伤害+54",
    skillresearch = 32000,
    skilllearn = [{1,320000},{4,3200}],
    guildlevel = 3,
    skillproperty = [{33,54,0}]
    };
getRow(252)->
    #guildskillCfg {
    id = 252,
    skillid = 4,
    skillicon = 152,
    skilllevel = 27,
    skillname = "奥术强化",
    skilldes = "元素伤害+59",
    skillresearch = 34000,
    skilllearn = [{1,340000},{4,3400}],
    guildlevel = 3,
    skillproperty = [{33,59,0}]
    };
getRow(253)->
    #guildskillCfg {
    id = 253,
    skillid = 4,
    skillicon = 152,
    skilllevel = 28,
    skillname = "奥术强化",
    skilldes = "元素伤害+63",
    skillresearch = 36000,
    skilllearn = [{1,360000},{4,3600}],
    guildlevel = 3,
    skillproperty = [{33,63,0}]
    };
getRow(254)->
    #guildskillCfg {
    id = 254,
    skillid = 4,
    skillicon = 152,
    skilllevel = 29,
    skillname = "奥术强化",
    skilldes = "元素伤害+68",
    skillresearch = 38000,
    skilllearn = [{1,380000},{4,3800}],
    guildlevel = 3,
    skillproperty = [{33,68,0}]
    };
getRow(255)->
    #guildskillCfg {
    id = 255,
    skillid = 4,
    skillicon = 152,
    skilllevel = 30,
    skillname = "奥术强化",
    skilldes = "元素伤害+74",
    skillresearch = 40000,
    skilllearn = [{1,400000},{4,4000}],
    guildlevel = 3,
    skillproperty = [{33,74,0}]
    };
getRow(256)->
    #guildskillCfg {
    id = 256,
    skillid = 4,
    skillicon = 152,
    skilllevel = 31,
    skillname = "奥术强化",
    skilldes = "元素伤害+80",
    skillresearch = 42000,
    skilllearn = [{1,420000},{4,4200}],
    guildlevel = 4,
    skillproperty = [{33,80,0}]
    };
getRow(257)->
    #guildskillCfg {
    id = 257,
    skillid = 4,
    skillicon = 152,
    skilllevel = 32,
    skillname = "奥术强化",
    skilldes = "元素伤害+86",
    skillresearch = 44000,
    skilllearn = [{1,440000},{4,4400}],
    guildlevel = 4,
    skillproperty = [{33,86,0}]
    };
getRow(258)->
    #guildskillCfg {
    id = 258,
    skillid = 4,
    skillicon = 152,
    skilllevel = 33,
    skillname = "奥术强化",
    skilldes = "元素伤害+93",
    skillresearch = 46000,
    skilllearn = [{1,460000},{4,4600}],
    guildlevel = 4,
    skillproperty = [{33,93,0}]
    };
getRow(259)->
    #guildskillCfg {
    id = 259,
    skillid = 4,
    skillicon = 152,
    skilllevel = 34,
    skillname = "奥术强化",
    skilldes = "元素伤害+100",
    skillresearch = 48000,
    skilllearn = [{1,480000},{4,4800}],
    guildlevel = 4,
    skillproperty = [{33,100,0}]
    };
getRow(260)->
    #guildskillCfg {
    id = 260,
    skillid = 4,
    skillicon = 152,
    skilllevel = 35,
    skillname = "奥术强化",
    skilldes = "元素伤害+108",
    skillresearch = 50000,
    skilllearn = [{1,500000},{4,5000}],
    guildlevel = 4,
    skillproperty = [{33,108,0}]
    };
getRow(261)->
    #guildskillCfg {
    id = 261,
    skillid = 4,
    skillicon = 152,
    skilllevel = 36,
    skillname = "奥术强化",
    skilldes = "元素伤害+117",
    skillresearch = 52000,
    skilllearn = [{1,520000},{4,5200}],
    guildlevel = 4,
    skillproperty = [{33,117,0}]
    };
getRow(262)->
    #guildskillCfg {
    id = 262,
    skillid = 4,
    skillicon = 152,
    skilllevel = 37,
    skillname = "奥术强化",
    skilldes = "元素伤害+126",
    skillresearch = 54000,
    skilllearn = [{1,540000},{4,5400}],
    guildlevel = 4,
    skillproperty = [{33,126,0}]
    };
getRow(263)->
    #guildskillCfg {
    id = 263,
    skillid = 4,
    skillicon = 152,
    skilllevel = 38,
    skillname = "奥术强化",
    skilldes = "元素伤害+136",
    skillresearch = 56000,
    skilllearn = [{1,560000},{4,5600}],
    guildlevel = 4,
    skillproperty = [{33,136,0}]
    };
getRow(264)->
    #guildskillCfg {
    id = 264,
    skillid = 4,
    skillicon = 152,
    skilllevel = 39,
    skillname = "奥术强化",
    skilldes = "元素伤害+147",
    skillresearch = 58000,
    skilllearn = [{1,580000},{4,5800}],
    guildlevel = 4,
    skillproperty = [{33,147,0}]
    };
getRow(265)->
    #guildskillCfg {
    id = 265,
    skillid = 4,
    skillicon = 152,
    skilllevel = 40,
    skillname = "奥术强化",
    skilldes = "元素伤害+159",
    skillresearch = 60000,
    skilllearn = [{1,600000},{4,6000}],
    guildlevel = 4,
    skillproperty = [{33,159,0}]
    };
getRow(266)->
    #guildskillCfg {
    id = 266,
    skillid = 4,
    skillicon = 152,
    skilllevel = 41,
    skillname = "奥术强化",
    skilldes = "元素伤害+171",
    skillresearch = 65000,
    skilllearn = [{1,650000},{4,6500}],
    guildlevel = 5,
    skillproperty = [{33,171,0}]
    };
getRow(267)->
    #guildskillCfg {
    id = 267,
    skillid = 4,
    skillicon = 152,
    skilllevel = 42,
    skillname = "奥术强化",
    skilldes = "元素伤害+185",
    skillresearch = 70000,
    skilllearn = [{1,700000},{4,7000}],
    guildlevel = 5,
    skillproperty = [{33,185,0}]
    };
getRow(268)->
    #guildskillCfg {
    id = 268,
    skillid = 4,
    skillicon = 152,
    skilllevel = 43,
    skillname = "奥术强化",
    skilldes = "元素伤害+200",
    skillresearch = 75000,
    skilllearn = [{1,750000},{4,7500}],
    guildlevel = 5,
    skillproperty = [{33,200,0}]
    };
getRow(269)->
    #guildskillCfg {
    id = 269,
    skillid = 4,
    skillicon = 152,
    skilllevel = 44,
    skillname = "奥术强化",
    skilldes = "元素伤害+216",
    skillresearch = 80000,
    skilllearn = [{1,800000},{4,8000}],
    guildlevel = 5,
    skillproperty = [{33,216,0}]
    };
getRow(270)->
    #guildskillCfg {
    id = 270,
    skillid = 4,
    skillicon = 152,
    skilllevel = 45,
    skillname = "奥术强化",
    skilldes = "元素伤害+233",
    skillresearch = 85000,
    skilllearn = [{1,850000},{4,8500}],
    guildlevel = 5,
    skillproperty = [{33,233,0}]
    };
getRow(271)->
    #guildskillCfg {
    id = 271,
    skillid = 4,
    skillicon = 152,
    skilllevel = 46,
    skillname = "奥术强化",
    skilldes = "元素伤害+251",
    skillresearch = 90000,
    skilllearn = [{1,900000},{4,9000}],
    guildlevel = 5,
    skillproperty = [{33,251,0}]
    };
getRow(272)->
    #guildskillCfg {
    id = 272,
    skillid = 4,
    skillicon = 152,
    skilllevel = 47,
    skillname = "奥术强化",
    skilldes = "元素伤害+271",
    skillresearch = 95000,
    skilllearn = [{1,950000},{4,9500}],
    guildlevel = 5,
    skillproperty = [{33,271,0}]
    };
getRow(273)->
    #guildskillCfg {
    id = 273,
    skillid = 4,
    skillicon = 152,
    skilllevel = 48,
    skillname = "奥术强化",
    skilldes = "元素伤害+293",
    skillresearch = 100000,
    skilllearn = [{1,1000000},{4,10000}],
    guildlevel = 5,
    skillproperty = [{33,293,0}]
    };
getRow(274)->
    #guildskillCfg {
    id = 274,
    skillid = 4,
    skillicon = 152,
    skilllevel = 49,
    skillname = "奥术强化",
    skilldes = "元素伤害+316",
    skillresearch = 105000,
    skilllearn = [{1,1050000},{4,10500}],
    guildlevel = 5,
    skillproperty = [{33,316,0}]
    };
getRow(275)->
    #guildskillCfg {
    id = 275,
    skillid = 4,
    skillicon = 152,
    skilllevel = 50,
    skillname = "奥术强化",
    skilldes = "元素伤害+341",
    skillresearch = 110000,
    skilllearn = [{1,1100000},{4,11000}],
    guildlevel = 5,
    skillproperty = [{33,341,0}]
    };
getRow(276)->
    #guildskillCfg {
    id = 276,
    skillid = 4,
    skillicon = 152,
    skilllevel = 51,
    skillname = "奥术强化",
    skilldes = "元素伤害+368",
    skillresearch = 115000,
    skilllearn = [{1,1150000},{4,11500}],
    guildlevel = 6,
    skillproperty = [{33,368,0}]
    };
getRow(277)->
    #guildskillCfg {
    id = 277,
    skillid = 4,
    skillicon = 152,
    skilllevel = 52,
    skillname = "奥术强化",
    skilldes = "元素伤害+397",
    skillresearch = 120000,
    skilllearn = [{1,1200000},{4,12000}],
    guildlevel = 6,
    skillproperty = [{33,397,0}]
    };
getRow(278)->
    #guildskillCfg {
    id = 278,
    skillid = 4,
    skillicon = 152,
    skilllevel = 53,
    skillname = "奥术强化",
    skilldes = "元素伤害+429",
    skillresearch = 125000,
    skilllearn = [{1,1250000},{4,12500}],
    guildlevel = 6,
    skillproperty = [{33,429,0}]
    };
getRow(279)->
    #guildskillCfg {
    id = 279,
    skillid = 4,
    skillicon = 152,
    skilllevel = 54,
    skillname = "奥术强化",
    skilldes = "元素伤害+463",
    skillresearch = 130000,
    skilllearn = [{1,1300000},{4,13000}],
    guildlevel = 6,
    skillproperty = [{33,463,0}]
    };
getRow(280)->
    #guildskillCfg {
    id = 280,
    skillid = 4,
    skillicon = 152,
    skilllevel = 55,
    skillname = "奥术强化",
    skilldes = "元素伤害+500",
    skillresearch = 135000,
    skilllearn = [{1,1350000},{4,13500}],
    guildlevel = 6,
    skillproperty = [{33,500,0}]
    };
getRow(281)->
    #guildskillCfg {
    id = 281,
    skillid = 4,
    skillicon = 152,
    skilllevel = 56,
    skillname = "奥术强化",
    skilldes = "元素伤害+540",
    skillresearch = 140000,
    skilllearn = [{1,1400000},{4,14000}],
    guildlevel = 6,
    skillproperty = [{33,540,0}]
    };
getRow(282)->
    #guildskillCfg {
    id = 282,
    skillid = 4,
    skillicon = 152,
    skilllevel = 57,
    skillname = "奥术强化",
    skilldes = "元素伤害+582",
    skillresearch = 145000,
    skilllearn = [{1,1450000},{4,14500}],
    guildlevel = 6,
    skillproperty = [{33,582,0}]
    };
getRow(283)->
    #guildskillCfg {
    id = 283,
    skillid = 4,
    skillicon = 152,
    skilllevel = 58,
    skillname = "奥术强化",
    skilldes = "元素伤害+629",
    skillresearch = 150000,
    skilllearn = [{1,1500000},{4,15000}],
    guildlevel = 6,
    skillproperty = [{33,629,0}]
    };
getRow(284)->
    #guildskillCfg {
    id = 284,
    skillid = 4,
    skillicon = 152,
    skilllevel = 59,
    skillname = "奥术强化",
    skilldes = "元素伤害+678",
    skillresearch = 155000,
    skilllearn = [{1,1550000},{4,15500}],
    guildlevel = 6,
    skillproperty = [{33,678,0}]
    };
getRow(285)->
    #guildskillCfg {
    id = 285,
    skillid = 4,
    skillicon = 152,
    skilllevel = 60,
    skillname = "奥术强化",
    skilldes = "元素伤害+732",
    skillresearch = 160000,
    skilllearn = [{1,1600000},{4,16000}],
    guildlevel = 6,
    skillproperty = [{33,732,0}]
    };
getRow(286)->
    #guildskillCfg {
    id = 286,
    skillid = 4,
    skillicon = 152,
    skilllevel = 61,
    skillname = "奥术强化",
    skilldes = "元素伤害+782",
    skillresearch = 170000,
    skilllearn = [{1,1700000},{4,17000}],
    guildlevel = 7,
    skillproperty = [{33,782,0}]
    };
getRow(287)->
    #guildskillCfg {
    id = 287,
    skillid = 4,
    skillicon = 152,
    skilllevel = 62,
    skillname = "奥术强化",
    skilldes = "元素伤害+832",
    skillresearch = 180000,
    skilllearn = [{1,1800000},{4,18000}],
    guildlevel = 7,
    skillproperty = [{33,832,0}]
    };
getRow(288)->
    #guildskillCfg {
    id = 288,
    skillid = 4,
    skillicon = 152,
    skilllevel = 63,
    skillname = "奥术强化",
    skilldes = "元素伤害+882",
    skillresearch = 190000,
    skilllearn = [{1,1900000},{4,19000}],
    guildlevel = 7,
    skillproperty = [{33,882,0}]
    };
getRow(289)->
    #guildskillCfg {
    id = 289,
    skillid = 4,
    skillicon = 152,
    skilllevel = 64,
    skillname = "奥术强化",
    skilldes = "元素伤害+932",
    skillresearch = 200000,
    skilllearn = [{1,2000000},{4,20000}],
    guildlevel = 7,
    skillproperty = [{33,932,0}]
    };
getRow(290)->
    #guildskillCfg {
    id = 290,
    skillid = 4,
    skillicon = 152,
    skilllevel = 65,
    skillname = "奥术强化",
    skilldes = "元素伤害+982",
    skillresearch = 210000,
    skilllearn = [{1,2100000},{4,21000}],
    guildlevel = 7,
    skillproperty = [{33,982,0}]
    };
getRow(291)->
    #guildskillCfg {
    id = 291,
    skillid = 4,
    skillicon = 152,
    skilllevel = 66,
    skillname = "奥术强化",
    skilldes = "元素伤害+1032",
    skillresearch = 220000,
    skilllearn = [{1,2200000},{4,22000}],
    guildlevel = 7,
    skillproperty = [{33,1032,0}]
    };
getRow(292)->
    #guildskillCfg {
    id = 292,
    skillid = 4,
    skillicon = 152,
    skilllevel = 67,
    skillname = "奥术强化",
    skilldes = "元素伤害+1082",
    skillresearch = 230000,
    skilllearn = [{1,2300000},{4,23000}],
    guildlevel = 7,
    skillproperty = [{33,1082,0}]
    };
getRow(293)->
    #guildskillCfg {
    id = 293,
    skillid = 4,
    skillicon = 152,
    skilllevel = 68,
    skillname = "奥术强化",
    skilldes = "元素伤害+1132",
    skillresearch = 240000,
    skilllearn = [{1,2400000},{4,24000}],
    guildlevel = 7,
    skillproperty = [{33,1132,0}]
    };
getRow(294)->
    #guildskillCfg {
    id = 294,
    skillid = 4,
    skillicon = 152,
    skilllevel = 69,
    skillname = "奥术强化",
    skilldes = "元素伤害+1182",
    skillresearch = 250000,
    skilllearn = [{1,2500000},{4,25000}],
    guildlevel = 7,
    skillproperty = [{33,1182,0}]
    };
getRow(295)->
    #guildskillCfg {
    id = 295,
    skillid = 4,
    skillicon = 152,
    skilllevel = 70,
    skillname = "奥术强化",
    skilldes = "元素伤害+1232",
    skillresearch = 260000,
    skilllearn = [{1,2600000},{4,26000}],
    guildlevel = 7,
    skillproperty = [{33,1232,0}]
    };
getRow(296)->
    #guildskillCfg {
    id = 296,
    skillid = 4,
    skillicon = 152,
    skilllevel = 71,
    skillname = "奥术强化",
    skilldes = "元素伤害+1282",
    skillresearch = 270000,
    skilllearn = [{1,2700000},{4,27000}],
    guildlevel = 8,
    skillproperty = [{33,1282,0}]
    };
getRow(297)->
    #guildskillCfg {
    id = 297,
    skillid = 4,
    skillicon = 152,
    skilllevel = 72,
    skillname = "奥术强化",
    skilldes = "元素伤害+1347",
    skillresearch = 280000,
    skilllearn = [{1,2800000},{4,28000}],
    guildlevel = 8,
    skillproperty = [{33,1347,0}]
    };
getRow(298)->
    #guildskillCfg {
    id = 298,
    skillid = 4,
    skillicon = 152,
    skilllevel = 73,
    skillname = "奥术强化",
    skilldes = "元素伤害+1412",
    skillresearch = 290000,
    skilllearn = [{1,2900000},{4,29000}],
    guildlevel = 8,
    skillproperty = [{33,1412,0}]
    };
getRow(299)->
    #guildskillCfg {
    id = 299,
    skillid = 4,
    skillicon = 152,
    skilllevel = 74,
    skillname = "奥术强化",
    skilldes = "元素伤害+1477",
    skillresearch = 300000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{33,1477,0}]
    };
getRow(300)->
    #guildskillCfg {
    id = 300,
    skillid = 4,
    skillicon = 152,
    skilllevel = 75,
    skillname = "奥术强化",
    skilldes = "元素伤害+1542",
    skillresearch = 310000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{33,1542,0}]
    };
getRow(301)->
    #guildskillCfg {
    id = 301,
    skillid = 5,
    skillicon = 146,
    skilllevel = 1,
    skillname = "蛮熊之力",
    skilldes = "力量+23",
    skillresearch = 1000,
    skilllearn = [{1,10000},{4,100}],
    guildlevel = 1,
    skillproperty = [{1,23,0}]
    };
getRow(302)->
    #guildskillCfg {
    id = 302,
    skillid = 5,
    skillicon = 146,
    skilllevel = 2,
    skillname = "蛮熊之力",
    skilldes = "力量+27",
    skillresearch = 2000,
    skilllearn = [{1,20000},{4,200}],
    guildlevel = 1,
    skillproperty = [{1,27,0}]
    };
getRow(303)->
    #guildskillCfg {
    id = 303,
    skillid = 5,
    skillicon = 146,
    skilllevel = 3,
    skillname = "蛮熊之力",
    skilldes = "力量+29",
    skillresearch = 3000,
    skilllearn = [{1,30000},{4,300}],
    guildlevel = 1,
    skillproperty = [{1,29,0}]
    };
getRow(304)->
    #guildskillCfg {
    id = 304,
    skillid = 5,
    skillicon = 146,
    skilllevel = 4,
    skillname = "蛮熊之力",
    skilldes = "力量+31",
    skillresearch = 4000,
    skilllearn = [{1,40000},{4,400}],
    guildlevel = 1,
    skillproperty = [{1,31,0}]
    };
getRow(305)->
    #guildskillCfg {
    id = 305,
    skillid = 5,
    skillicon = 146,
    skilllevel = 5,
    skillname = "蛮熊之力",
    skilldes = "力量+34",
    skillresearch = 5000,
    skilllearn = [{1,50000},{4,500}],
    guildlevel = 1,
    skillproperty = [{1,34,0}]
    };
getRow(306)->
    #guildskillCfg {
    id = 306,
    skillid = 5,
    skillicon = 146,
    skilllevel = 6,
    skillname = "蛮熊之力",
    skilldes = "力量+36",
    skillresearch = 6000,
    skilllearn = [{1,60000},{4,600}],
    guildlevel = 1,
    skillproperty = [{1,36,0}]
    };
getRow(307)->
    #guildskillCfg {
    id = 307,
    skillid = 5,
    skillicon = 146,
    skilllevel = 7,
    skillname = "蛮熊之力",
    skilldes = "力量+39",
    skillresearch = 7000,
    skilllearn = [{1,70000},{4,700}],
    guildlevel = 1,
    skillproperty = [{1,39,0}]
    };
getRow(308)->
    #guildskillCfg {
    id = 308,
    skillid = 5,
    skillicon = 146,
    skilllevel = 8,
    skillname = "蛮熊之力",
    skilldes = "力量+42",
    skillresearch = 8000,
    skilllearn = [{1,80000},{4,800}],
    guildlevel = 1,
    skillproperty = [{1,42,0}]
    };
getRow(309)->
    #guildskillCfg {
    id = 309,
    skillid = 5,
    skillicon = 146,
    skilllevel = 9,
    skillname = "蛮熊之力",
    skilldes = "力量+46",
    skillresearch = 9000,
    skilllearn = [{1,90000},{4,900}],
    guildlevel = 1,
    skillproperty = [{1,46,0}]
    };
getRow(310)->
    #guildskillCfg {
    id = 310,
    skillid = 5,
    skillicon = 146,
    skilllevel = 10,
    skillname = "蛮熊之力",
    skilldes = "力量+49",
    skillresearch = 10000,
    skilllearn = [{1,100000},{4,1000}],
    guildlevel = 1,
    skillproperty = [{1,49,0}]
    };
getRow(311)->
    #guildskillCfg {
    id = 311,
    skillid = 5,
    skillicon = 146,
    skilllevel = 11,
    skillname = "蛮熊之力",
    skilldes = "力量+53",
    skillresearch = 11000,
    skilllearn = [{1,110000},{4,1100}],
    guildlevel = 2,
    skillproperty = [{1,53,0}]
    };
getRow(312)->
    #guildskillCfg {
    id = 312,
    skillid = 5,
    skillicon = 146,
    skilllevel = 12,
    skillname = "蛮熊之力",
    skilldes = "力量+58",
    skillresearch = 12000,
    skilllearn = [{1,120000},{4,1200}],
    guildlevel = 2,
    skillproperty = [{1,58,0}]
    };
getRow(313)->
    #guildskillCfg {
    id = 313,
    skillid = 5,
    skillicon = 146,
    skilllevel = 13,
    skillname = "蛮熊之力",
    skilldes = "力量+62",
    skillresearch = 13000,
    skilllearn = [{1,130000},{4,1300}],
    guildlevel = 2,
    skillproperty = [{1,62,0}]
    };
getRow(314)->
    #guildskillCfg {
    id = 314,
    skillid = 5,
    skillicon = 146,
    skilllevel = 14,
    skillname = "蛮熊之力",
    skilldes = "力量+67",
    skillresearch = 14000,
    skilllearn = [{1,140000},{4,1400}],
    guildlevel = 2,
    skillproperty = [{1,67,0}]
    };
getRow(315)->
    #guildskillCfg {
    id = 315,
    skillid = 5,
    skillicon = 146,
    skilllevel = 15,
    skillname = "蛮熊之力",
    skilldes = "力量+72",
    skillresearch = 15000,
    skilllearn = [{1,150000},{4,1500}],
    guildlevel = 2,
    skillproperty = [{1,72,0}]
    };
getRow(316)->
    #guildskillCfg {
    id = 316,
    skillid = 5,
    skillicon = 146,
    skilllevel = 16,
    skillname = "蛮熊之力",
    skilldes = "力量+78",
    skillresearch = 16000,
    skilllearn = [{1,160000},{4,1600}],
    guildlevel = 2,
    skillproperty = [{1,78,0}]
    };
getRow(317)->
    #guildskillCfg {
    id = 317,
    skillid = 5,
    skillicon = 146,
    skilllevel = 17,
    skillname = "蛮熊之力",
    skilldes = "力量+84",
    skillresearch = 17000,
    skilllearn = [{1,170000},{4,1700}],
    guildlevel = 2,
    skillproperty = [{1,84,0}]
    };
getRow(318)->
    #guildskillCfg {
    id = 318,
    skillid = 5,
    skillicon = 146,
    skilllevel = 18,
    skillname = "蛮熊之力",
    skilldes = "力量+91",
    skillresearch = 18000,
    skilllearn = [{1,180000},{4,1800}],
    guildlevel = 2,
    skillproperty = [{1,91,0}]
    };
getRow(319)->
    #guildskillCfg {
    id = 319,
    skillid = 5,
    skillicon = 146,
    skilllevel = 19,
    skillname = "蛮熊之力",
    skilldes = "力量+98",
    skillresearch = 19000,
    skilllearn = [{1,190000},{4,1900}],
    guildlevel = 2,
    skillproperty = [{1,98,0}]
    };
getRow(320)->
    #guildskillCfg {
    id = 320,
    skillid = 5,
    skillicon = 146,
    skilllevel = 20,
    skillname = "蛮熊之力",
    skilldes = "力量+106",
    skillresearch = 20000,
    skilllearn = [{1,200000},{4,2000}],
    guildlevel = 2,
    skillproperty = [{1,106,0}]
    };
getRow(321)->
    #guildskillCfg {
    id = 321,
    skillid = 5,
    skillicon = 146,
    skilllevel = 21,
    skillname = "蛮熊之力",
    skilldes = "力量+115",
    skillresearch = 22000,
    skilllearn = [{1,220000},{4,2200}],
    guildlevel = 3,
    skillproperty = [{1,115,0}]
    };
getRow(322)->
    #guildskillCfg {
    id = 322,
    skillid = 5,
    skillicon = 146,
    skilllevel = 22,
    skillname = "蛮熊之力",
    skilldes = "力量+124",
    skillresearch = 24000,
    skilllearn = [{1,240000},{4,2400}],
    guildlevel = 3,
    skillproperty = [{1,124,0}]
    };
getRow(323)->
    #guildskillCfg {
    id = 323,
    skillid = 5,
    skillicon = 146,
    skilllevel = 23,
    skillname = "蛮熊之力",
    skilldes = "力量+133",
    skillresearch = 26000,
    skilllearn = [{1,260000},{4,2600}],
    guildlevel = 3,
    skillproperty = [{1,133,0}]
    };
getRow(324)->
    #guildskillCfg {
    id = 324,
    skillid = 5,
    skillicon = 146,
    skilllevel = 24,
    skillname = "蛮熊之力",
    skilldes = "力量+144",
    skillresearch = 28000,
    skilllearn = [{1,280000},{4,2800}],
    guildlevel = 3,
    skillproperty = [{1,144,0}]
    };
getRow(325)->
    #guildskillCfg {
    id = 325,
    skillid = 5,
    skillicon = 146,
    skilllevel = 25,
    skillname = "蛮熊之力",
    skilldes = "力量+155",
    skillresearch = 30000,
    skilllearn = [{1,300000},{4,3000}],
    guildlevel = 3,
    skillproperty = [{1,155,0}]
    };
getRow(326)->
    #guildskillCfg {
    id = 326,
    skillid = 5,
    skillicon = 146,
    skilllevel = 26,
    skillname = "蛮熊之力",
    skilldes = "力量+168",
    skillresearch = 32000,
    skilllearn = [{1,320000},{4,3200}],
    guildlevel = 3,
    skillproperty = [{1,168,0}]
    };
getRow(327)->
    #guildskillCfg {
    id = 327,
    skillid = 5,
    skillicon = 146,
    skilllevel = 27,
    skillname = "蛮熊之力",
    skilldes = "力量+181",
    skillresearch = 34000,
    skilllearn = [{1,340000},{4,3400}],
    guildlevel = 3,
    skillproperty = [{1,181,0}]
    };
getRow(328)->
    #guildskillCfg {
    id = 328,
    skillid = 5,
    skillicon = 146,
    skilllevel = 28,
    skillname = "蛮熊之力",
    skilldes = "力量+195",
    skillresearch = 36000,
    skilllearn = [{1,360000},{4,3600}],
    guildlevel = 3,
    skillproperty = [{1,195,0}]
    };
getRow(329)->
    #guildskillCfg {
    id = 329,
    skillid = 5,
    skillicon = 146,
    skilllevel = 29,
    skillname = "蛮熊之力",
    skilldes = "力量+211",
    skillresearch = 38000,
    skilllearn = [{1,380000},{4,3800}],
    guildlevel = 3,
    skillproperty = [{1,211,0}]
    };
getRow(330)->
    #guildskillCfg {
    id = 330,
    skillid = 5,
    skillicon = 146,
    skilllevel = 30,
    skillname = "蛮熊之力",
    skilldes = "力量+228",
    skillresearch = 40000,
    skilllearn = [{1,400000},{4,4000}],
    guildlevel = 3,
    skillproperty = [{1,228,0}]
    };
getRow(331)->
    #guildskillCfg {
    id = 331,
    skillid = 5,
    skillicon = 146,
    skilllevel = 31,
    skillname = "蛮熊之力",
    skilldes = "力量+246",
    skillresearch = 42000,
    skilllearn = [{1,420000},{4,4200}],
    guildlevel = 4,
    skillproperty = [{1,246,0}]
    };
getRow(332)->
    #guildskillCfg {
    id = 332,
    skillid = 5,
    skillicon = 146,
    skilllevel = 32,
    skillname = "蛮熊之力",
    skilldes = "力量+265",
    skillresearch = 44000,
    skilllearn = [{1,440000},{4,4400}],
    guildlevel = 4,
    skillproperty = [{1,265,0}]
    };
getRow(333)->
    #guildskillCfg {
    id = 333,
    skillid = 5,
    skillicon = 146,
    skilllevel = 33,
    skillname = "蛮熊之力",
    skilldes = "力量+286",
    skillresearch = 46000,
    skilllearn = [{1,460000},{4,4600}],
    guildlevel = 4,
    skillproperty = [{1,286,0}]
    };
getRow(334)->
    #guildskillCfg {
    id = 334,
    skillid = 5,
    skillicon = 146,
    skilllevel = 34,
    skillname = "蛮熊之力",
    skilldes = "力量+309",
    skillresearch = 48000,
    skilllearn = [{1,480000},{4,4800}],
    guildlevel = 4,
    skillproperty = [{1,309,0}]
    };
getRow(335)->
    #guildskillCfg {
    id = 335,
    skillid = 5,
    skillicon = 146,
    skilllevel = 35,
    skillname = "蛮熊之力",
    skilldes = "力量+334",
    skillresearch = 50000,
    skilllearn = [{1,500000},{4,5000}],
    guildlevel = 4,
    skillproperty = [{1,334,0}]
    };
getRow(336)->
    #guildskillCfg {
    id = 336,
    skillid = 5,
    skillicon = 146,
    skilllevel = 36,
    skillname = "蛮熊之力",
    skilldes = "力量+360",
    skillresearch = 52000,
    skilllearn = [{1,520000},{4,5200}],
    guildlevel = 4,
    skillproperty = [{1,360,0}]
    };
getRow(337)->
    #guildskillCfg {
    id = 337,
    skillid = 5,
    skillicon = 146,
    skilllevel = 37,
    skillname = "蛮熊之力",
    skilldes = "力量+389",
    skillresearch = 54000,
    skilllearn = [{1,540000},{4,5400}],
    guildlevel = 4,
    skillproperty = [{1,389,0}]
    };
getRow(338)->
    #guildskillCfg {
    id = 338,
    skillid = 5,
    skillicon = 146,
    skilllevel = 38,
    skillname = "蛮熊之力",
    skilldes = "力量+419",
    skillresearch = 56000,
    skilllearn = [{1,560000},{4,5600}],
    guildlevel = 4,
    skillproperty = [{1,419,0}]
    };
getRow(339)->
    #guildskillCfg {
    id = 339,
    skillid = 5,
    skillicon = 146,
    skilllevel = 39,
    skillname = "蛮熊之力",
    skilldes = "力量+453",
    skillresearch = 58000,
    skilllearn = [{1,580000},{4,5800}],
    guildlevel = 4,
    skillproperty = [{1,453,0}]
    };
getRow(340)->
    #guildskillCfg {
    id = 340,
    skillid = 5,
    skillicon = 146,
    skilllevel = 40,
    skillname = "蛮熊之力",
    skilldes = "力量+489",
    skillresearch = 60000,
    skilllearn = [{1,600000},{4,6000}],
    guildlevel = 4,
    skillproperty = [{1,489,0}]
    };
getRow(341)->
    #guildskillCfg {
    id = 341,
    skillid = 5,
    skillicon = 146,
    skilllevel = 41,
    skillname = "蛮熊之力",
    skilldes = "力量+527",
    skillresearch = 65000,
    skilllearn = [{1,650000},{4,6500}],
    guildlevel = 5,
    skillproperty = [{1,527,0}]
    };
getRow(342)->
    #guildskillCfg {
    id = 342,
    skillid = 5,
    skillicon = 146,
    skilllevel = 42,
    skillname = "蛮熊之力",
    skilldes = "力量+569",
    skillresearch = 70000,
    skilllearn = [{1,700000},{4,7000}],
    guildlevel = 5,
    skillproperty = [{1,569,0}]
    };
getRow(343)->
    #guildskillCfg {
    id = 343,
    skillid = 5,
    skillicon = 146,
    skilllevel = 43,
    skillname = "蛮熊之力",
    skilldes = "力量+614",
    skillresearch = 75000,
    skilllearn = [{1,750000},{4,7500}],
    guildlevel = 5,
    skillproperty = [{1,614,0}]
    };
getRow(344)->
    #guildskillCfg {
    id = 344,
    skillid = 5,
    skillicon = 146,
    skilllevel = 44,
    skillname = "蛮熊之力",
    skilldes = "力量+663",
    skillresearch = 80000,
    skilllearn = [{1,800000},{4,8000}],
    guildlevel = 5,
    skillproperty = [{1,663,0}]
    };
getRow(345)->
    #guildskillCfg {
    id = 345,
    skillid = 5,
    skillicon = 146,
    skilllevel = 45,
    skillname = "蛮熊之力",
    skilldes = "力量+716",
    skillresearch = 85000,
    skilllearn = [{1,850000},{4,8500}],
    guildlevel = 5,
    skillproperty = [{1,716,0}]
    };
getRow(346)->
    #guildskillCfg {
    id = 346,
    skillid = 5,
    skillicon = 146,
    skilllevel = 46,
    skillname = "蛮熊之力",
    skilldes = "力量+772",
    skillresearch = 90000,
    skilllearn = [{1,900000},{4,9000}],
    guildlevel = 5,
    skillproperty = [{1,772,0}]
    };
getRow(347)->
    #guildskillCfg {
    id = 347,
    skillid = 5,
    skillicon = 146,
    skilllevel = 47,
    skillname = "蛮熊之力",
    skilldes = "力量+834",
    skillresearch = 95000,
    skilllearn = [{1,950000},{4,9500}],
    guildlevel = 5,
    skillproperty = [{1,834,0}]
    };
getRow(348)->
    #guildskillCfg {
    id = 348,
    skillid = 5,
    skillicon = 146,
    skilllevel = 48,
    skillname = "蛮熊之力",
    skilldes = "力量+900",
    skillresearch = 100000,
    skilllearn = [{1,1000000},{4,10000}],
    guildlevel = 5,
    skillproperty = [{1,900,0}]
    };
getRow(349)->
    #guildskillCfg {
    id = 349,
    skillid = 5,
    skillicon = 146,
    skilllevel = 49,
    skillname = "蛮熊之力",
    skilldes = "力量+971",
    skillresearch = 105000,
    skilllearn = [{1,1050000},{4,10500}],
    guildlevel = 5,
    skillproperty = [{1,971,0}]
    };
getRow(350)->
    #guildskillCfg {
    id = 350,
    skillid = 5,
    skillicon = 146,
    skilllevel = 50,
    skillname = "蛮熊之力",
    skilldes = "力量+1048",
    skillresearch = 110000,
    skilllearn = [{1,1100000},{4,11000}],
    guildlevel = 5,
    skillproperty = [{1,1048,0}]
    };
getRow(351)->
    #guildskillCfg {
    id = 351,
    skillid = 5,
    skillicon = 146,
    skilllevel = 51,
    skillname = "蛮熊之力",
    skilldes = "力量+1132",
    skillresearch = 115000,
    skilllearn = [{1,1150000},{4,11500}],
    guildlevel = 6,
    skillproperty = [{1,1132,0}]
    };
getRow(352)->
    #guildskillCfg {
    id = 352,
    skillid = 5,
    skillicon = 146,
    skilllevel = 52,
    skillname = "蛮熊之力",
    skilldes = "力量+1221",
    skillresearch = 120000,
    skilllearn = [{1,1200000},{4,12000}],
    guildlevel = 6,
    skillproperty = [{1,1221,0}]
    };
getRow(353)->
    #guildskillCfg {
    id = 353,
    skillid = 5,
    skillicon = 146,
    skilllevel = 53,
    skillname = "蛮熊之力",
    skilldes = "力量+1318",
    skillresearch = 125000,
    skilllearn = [{1,1250000},{4,12500}],
    guildlevel = 6,
    skillproperty = [{1,1318,0}]
    };
getRow(354)->
    #guildskillCfg {
    id = 354,
    skillid = 5,
    skillicon = 146,
    skilllevel = 54,
    skillname = "蛮熊之力",
    skilldes = "力量+1423",
    skillresearch = 130000,
    skilllearn = [{1,1300000},{4,13000}],
    guildlevel = 6,
    skillproperty = [{1,1423,0}]
    };
getRow(355)->
    #guildskillCfg {
    id = 355,
    skillid = 5,
    skillicon = 146,
    skilllevel = 55,
    skillname = "蛮熊之力",
    skilldes = "力量+1536",
    skillresearch = 135000,
    skilllearn = [{1,1350000},{4,13500}],
    guildlevel = 6,
    skillproperty = [{1,1536,0}]
    };
getRow(356)->
    #guildskillCfg {
    id = 356,
    skillid = 5,
    skillicon = 146,
    skilllevel = 56,
    skillname = "蛮熊之力",
    skilldes = "力量+1658",
    skillresearch = 140000,
    skilllearn = [{1,1400000},{4,14000}],
    guildlevel = 6,
    skillproperty = [{1,1658,0}]
    };
getRow(357)->
    #guildskillCfg {
    id = 357,
    skillid = 5,
    skillicon = 146,
    skilllevel = 57,
    skillname = "蛮熊之力",
    skilldes = "力量+1789",
    skillresearch = 145000,
    skilllearn = [{1,1450000},{4,14500}],
    guildlevel = 6,
    skillproperty = [{1,1789,0}]
    };
getRow(358)->
    #guildskillCfg {
    id = 358,
    skillid = 5,
    skillicon = 146,
    skilllevel = 58,
    skillname = "蛮熊之力",
    skilldes = "力量+1931",
    skillresearch = 150000,
    skilllearn = [{1,1500000},{4,15000}],
    guildlevel = 6,
    skillproperty = [{1,1931,0}]
    };
getRow(359)->
    #guildskillCfg {
    id = 359,
    skillid = 5,
    skillicon = 146,
    skilllevel = 59,
    skillname = "蛮熊之力",
    skilldes = "力量+2085",
    skillresearch = 155000,
    skilllearn = [{1,1550000},{4,15500}],
    guildlevel = 6,
    skillproperty = [{1,2085,0}]
    };
getRow(360)->
    #guildskillCfg {
    id = 360,
    skillid = 5,
    skillicon = 146,
    skilllevel = 60,
    skillname = "蛮熊之力",
    skilldes = "力量+2250",
    skillresearch = 160000,
    skilllearn = [{1,1600000},{4,16000}],
    guildlevel = 6,
    skillproperty = [{1,2250,0}]
    };
getRow(361)->
    #guildskillCfg {
    id = 361,
    skillid = 5,
    skillicon = 146,
    skilllevel = 61,
    skillname = "蛮熊之力",
    skilldes = "力量+2400",
    skillresearch = 170000,
    skilllearn = [{1,1700000},{4,17000}],
    guildlevel = 7,
    skillproperty = [{1,2400,0}]
    };
getRow(362)->
    #guildskillCfg {
    id = 362,
    skillid = 5,
    skillicon = 146,
    skilllevel = 62,
    skillname = "蛮熊之力",
    skilldes = "力量+2550",
    skillresearch = 180000,
    skilllearn = [{1,1800000},{4,18000}],
    guildlevel = 7,
    skillproperty = [{1,2550,0}]
    };
getRow(363)->
    #guildskillCfg {
    id = 363,
    skillid = 5,
    skillicon = 146,
    skilllevel = 63,
    skillname = "蛮熊之力",
    skilldes = "力量+2700",
    skillresearch = 190000,
    skilllearn = [{1,1900000},{4,19000}],
    guildlevel = 7,
    skillproperty = [{1,2700,0}]
    };
getRow(364)->
    #guildskillCfg {
    id = 364,
    skillid = 5,
    skillicon = 146,
    skilllevel = 64,
    skillname = "蛮熊之力",
    skilldes = "力量+2850",
    skillresearch = 200000,
    skilllearn = [{1,2000000},{4,20000}],
    guildlevel = 7,
    skillproperty = [{1,2850,0}]
    };
getRow(365)->
    #guildskillCfg {
    id = 365,
    skillid = 5,
    skillicon = 146,
    skilllevel = 65,
    skillname = "蛮熊之力",
    skilldes = "力量+3000",
    skillresearch = 210000,
    skilllearn = [{1,2100000},{4,21000}],
    guildlevel = 7,
    skillproperty = [{1,3000,0}]
    };
getRow(366)->
    #guildskillCfg {
    id = 366,
    skillid = 5,
    skillicon = 146,
    skilllevel = 66,
    skillname = "蛮熊之力",
    skilldes = "力量+3150",
    skillresearch = 220000,
    skilllearn = [{1,2200000},{4,22000}],
    guildlevel = 7,
    skillproperty = [{1,3150,0}]
    };
getRow(367)->
    #guildskillCfg {
    id = 367,
    skillid = 5,
    skillicon = 146,
    skilllevel = 67,
    skillname = "蛮熊之力",
    skilldes = "力量+3300",
    skillresearch = 230000,
    skilllearn = [{1,2300000},{4,23000}],
    guildlevel = 7,
    skillproperty = [{1,3300,0}]
    };
getRow(368)->
    #guildskillCfg {
    id = 368,
    skillid = 5,
    skillicon = 146,
    skilllevel = 68,
    skillname = "蛮熊之力",
    skilldes = "力量+3450",
    skillresearch = 240000,
    skilllearn = [{1,2400000},{4,24000}],
    guildlevel = 7,
    skillproperty = [{1,3450,0}]
    };
getRow(369)->
    #guildskillCfg {
    id = 369,
    skillid = 5,
    skillicon = 146,
    skilllevel = 69,
    skillname = "蛮熊之力",
    skilldes = "力量+3600",
    skillresearch = 250000,
    skilllearn = [{1,2500000},{4,25000}],
    guildlevel = 7,
    skillproperty = [{1,3600,0}]
    };
getRow(370)->
    #guildskillCfg {
    id = 370,
    skillid = 5,
    skillicon = 146,
    skilllevel = 70,
    skillname = "蛮熊之力",
    skilldes = "力量+3750",
    skillresearch = 260000,
    skilllearn = [{1,2600000},{4,26000}],
    guildlevel = 7,
    skillproperty = [{1,3750,0}]
    };
getRow(371)->
    #guildskillCfg {
    id = 371,
    skillid = 5,
    skillicon = 146,
    skilllevel = 71,
    skillname = "蛮熊之力",
    skilldes = "力量+3900",
    skillresearch = 270000,
    skilllearn = [{1,2700000},{4,27000}],
    guildlevel = 8,
    skillproperty = [{1,3900,0}]
    };
getRow(372)->
    #guildskillCfg {
    id = 372,
    skillid = 5,
    skillicon = 146,
    skilllevel = 72,
    skillname = "蛮熊之力",
    skilldes = "力量+4050",
    skillresearch = 280000,
    skilllearn = [{1,2800000},{4,28000}],
    guildlevel = 8,
    skillproperty = [{1,4050,0}]
    };
getRow(373)->
    #guildskillCfg {
    id = 373,
    skillid = 5,
    skillicon = 146,
    skilllevel = 73,
    skillname = "蛮熊之力",
    skilldes = "力量+4200",
    skillresearch = 290000,
    skilllearn = [{1,2900000},{4,29000}],
    guildlevel = 8,
    skillproperty = [{1,4200,0}]
    };
getRow(374)->
    #guildskillCfg {
    id = 374,
    skillid = 5,
    skillicon = 146,
    skilllevel = 74,
    skillname = "蛮熊之力",
    skilldes = "力量+4350",
    skillresearch = 300000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{1,4350,0}]
    };
getRow(375)->
    #guildskillCfg {
    id = 375,
    skillid = 5,
    skillicon = 146,
    skilllevel = 75,
    skillname = "蛮熊之力",
    skilldes = "力量+4500",
    skillresearch = 310000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{1,4500,0}]
    };
getRow(376)->
    #guildskillCfg {
    id = 376,
    skillid = 6,
    skillicon = 147,
    skilllevel = 1,
    skillname = "迅捷之风",
    skilldes = "敏捷+23",
    skillresearch = 1000,
    skilllearn = [{1,10000},{4,100}],
    guildlevel = 1,
    skillproperty = [{2,23,0}]
    };
getRow(377)->
    #guildskillCfg {
    id = 377,
    skillid = 6,
    skillicon = 147,
    skilllevel = 2,
    skillname = "迅捷之风",
    skilldes = "敏捷+27",
    skillresearch = 2000,
    skilllearn = [{1,20000},{4,200}],
    guildlevel = 1,
    skillproperty = [{2,27,0}]
    };
getRow(378)->
    #guildskillCfg {
    id = 378,
    skillid = 6,
    skillicon = 147,
    skilllevel = 3,
    skillname = "迅捷之风",
    skilldes = "敏捷+29",
    skillresearch = 3000,
    skilllearn = [{1,30000},{4,300}],
    guildlevel = 1,
    skillproperty = [{2,29,0}]
    };
getRow(379)->
    #guildskillCfg {
    id = 379,
    skillid = 6,
    skillicon = 147,
    skilllevel = 4,
    skillname = "迅捷之风",
    skilldes = "敏捷+31",
    skillresearch = 4000,
    skilllearn = [{1,40000},{4,400}],
    guildlevel = 1,
    skillproperty = [{2,31,0}]
    };
getRow(380)->
    #guildskillCfg {
    id = 380,
    skillid = 6,
    skillicon = 147,
    skilllevel = 5,
    skillname = "迅捷之风",
    skilldes = "敏捷+34",
    skillresearch = 5000,
    skilllearn = [{1,50000},{4,500}],
    guildlevel = 1,
    skillproperty = [{2,34,0}]
    };
getRow(381)->
    #guildskillCfg {
    id = 381,
    skillid = 6,
    skillicon = 147,
    skilllevel = 6,
    skillname = "迅捷之风",
    skilldes = "敏捷+36",
    skillresearch = 6000,
    skilllearn = [{1,60000},{4,600}],
    guildlevel = 1,
    skillproperty = [{2,36,0}]
    };
getRow(382)->
    #guildskillCfg {
    id = 382,
    skillid = 6,
    skillicon = 147,
    skilllevel = 7,
    skillname = "迅捷之风",
    skilldes = "敏捷+39",
    skillresearch = 7000,
    skilllearn = [{1,70000},{4,700}],
    guildlevel = 1,
    skillproperty = [{2,39,0}]
    };
getRow(383)->
    #guildskillCfg {
    id = 383,
    skillid = 6,
    skillicon = 147,
    skilllevel = 8,
    skillname = "迅捷之风",
    skilldes = "敏捷+42",
    skillresearch = 8000,
    skilllearn = [{1,80000},{4,800}],
    guildlevel = 1,
    skillproperty = [{2,42,0}]
    };
getRow(384)->
    #guildskillCfg {
    id = 384,
    skillid = 6,
    skillicon = 147,
    skilllevel = 9,
    skillname = "迅捷之风",
    skilldes = "敏捷+46",
    skillresearch = 9000,
    skilllearn = [{1,90000},{4,900}],
    guildlevel = 1,
    skillproperty = [{2,46,0}]
    };
getRow(385)->
    #guildskillCfg {
    id = 385,
    skillid = 6,
    skillicon = 147,
    skilllevel = 10,
    skillname = "迅捷之风",
    skilldes = "敏捷+49",
    skillresearch = 10000,
    skilllearn = [{1,100000},{4,1000}],
    guildlevel = 1,
    skillproperty = [{2,49,0}]
    };
getRow(386)->
    #guildskillCfg {
    id = 386,
    skillid = 6,
    skillicon = 147,
    skilllevel = 11,
    skillname = "迅捷之风",
    skilldes = "敏捷+53",
    skillresearch = 11000,
    skilllearn = [{1,110000},{4,1100}],
    guildlevel = 2,
    skillproperty = [{2,53,0}]
    };
getRow(387)->
    #guildskillCfg {
    id = 387,
    skillid = 6,
    skillicon = 147,
    skilllevel = 12,
    skillname = "迅捷之风",
    skilldes = "敏捷+58",
    skillresearch = 12000,
    skilllearn = [{1,120000},{4,1200}],
    guildlevel = 2,
    skillproperty = [{2,58,0}]
    };
getRow(388)->
    #guildskillCfg {
    id = 388,
    skillid = 6,
    skillicon = 147,
    skilllevel = 13,
    skillname = "迅捷之风",
    skilldes = "敏捷+62",
    skillresearch = 13000,
    skilllearn = [{1,130000},{4,1300}],
    guildlevel = 2,
    skillproperty = [{2,62,0}]
    };
getRow(389)->
    #guildskillCfg {
    id = 389,
    skillid = 6,
    skillicon = 147,
    skilllevel = 14,
    skillname = "迅捷之风",
    skilldes = "敏捷+67",
    skillresearch = 14000,
    skilllearn = [{1,140000},{4,1400}],
    guildlevel = 2,
    skillproperty = [{2,67,0}]
    };
getRow(390)->
    #guildskillCfg {
    id = 390,
    skillid = 6,
    skillicon = 147,
    skilllevel = 15,
    skillname = "迅捷之风",
    skilldes = "敏捷+72",
    skillresearch = 15000,
    skilllearn = [{1,150000},{4,1500}],
    guildlevel = 2,
    skillproperty = [{2,72,0}]
    };
getRow(391)->
    #guildskillCfg {
    id = 391,
    skillid = 6,
    skillicon = 147,
    skilllevel = 16,
    skillname = "迅捷之风",
    skilldes = "敏捷+78",
    skillresearch = 16000,
    skilllearn = [{1,160000},{4,1600}],
    guildlevel = 2,
    skillproperty = [{2,78,0}]
    };
getRow(392)->
    #guildskillCfg {
    id = 392,
    skillid = 6,
    skillicon = 147,
    skilllevel = 17,
    skillname = "迅捷之风",
    skilldes = "敏捷+84",
    skillresearch = 17000,
    skilllearn = [{1,170000},{4,1700}],
    guildlevel = 2,
    skillproperty = [{2,84,0}]
    };
getRow(393)->
    #guildskillCfg {
    id = 393,
    skillid = 6,
    skillicon = 147,
    skilllevel = 18,
    skillname = "迅捷之风",
    skilldes = "敏捷+91",
    skillresearch = 18000,
    skilllearn = [{1,180000},{4,1800}],
    guildlevel = 2,
    skillproperty = [{2,91,0}]
    };
getRow(394)->
    #guildskillCfg {
    id = 394,
    skillid = 6,
    skillicon = 147,
    skilllevel = 19,
    skillname = "迅捷之风",
    skilldes = "敏捷+98",
    skillresearch = 19000,
    skilllearn = [{1,190000},{4,1900}],
    guildlevel = 2,
    skillproperty = [{2,98,0}]
    };
getRow(395)->
    #guildskillCfg {
    id = 395,
    skillid = 6,
    skillicon = 147,
    skilllevel = 20,
    skillname = "迅捷之风",
    skilldes = "敏捷+106",
    skillresearch = 20000,
    skilllearn = [{1,200000},{4,2000}],
    guildlevel = 2,
    skillproperty = [{2,106,0}]
    };
getRow(396)->
    #guildskillCfg {
    id = 396,
    skillid = 6,
    skillicon = 147,
    skilllevel = 21,
    skillname = "迅捷之风",
    skilldes = "敏捷+115",
    skillresearch = 22000,
    skilllearn = [{1,220000},{4,2200}],
    guildlevel = 3,
    skillproperty = [{2,115,0}]
    };
getRow(397)->
    #guildskillCfg {
    id = 397,
    skillid = 6,
    skillicon = 147,
    skilllevel = 22,
    skillname = "迅捷之风",
    skilldes = "敏捷+124",
    skillresearch = 24000,
    skilllearn = [{1,240000},{4,2400}],
    guildlevel = 3,
    skillproperty = [{2,124,0}]
    };
getRow(398)->
    #guildskillCfg {
    id = 398,
    skillid = 6,
    skillicon = 147,
    skilllevel = 23,
    skillname = "迅捷之风",
    skilldes = "敏捷+133",
    skillresearch = 26000,
    skilllearn = [{1,260000},{4,2600}],
    guildlevel = 3,
    skillproperty = [{2,133,0}]
    };
getRow(399)->
    #guildskillCfg {
    id = 399,
    skillid = 6,
    skillicon = 147,
    skilllevel = 24,
    skillname = "迅捷之风",
    skilldes = "敏捷+144",
    skillresearch = 28000,
    skilllearn = [{1,280000},{4,2800}],
    guildlevel = 3,
    skillproperty = [{2,144,0}]
    };
getRow(400)->
    #guildskillCfg {
    id = 400,
    skillid = 6,
    skillicon = 147,
    skilllevel = 25,
    skillname = "迅捷之风",
    skilldes = "敏捷+155",
    skillresearch = 30000,
    skilllearn = [{1,300000},{4,3000}],
    guildlevel = 3,
    skillproperty = [{2,155,0}]
    };
getRow(401)->
    #guildskillCfg {
    id = 401,
    skillid = 6,
    skillicon = 147,
    skilllevel = 26,
    skillname = "迅捷之风",
    skilldes = "敏捷+168",
    skillresearch = 32000,
    skilllearn = [{1,320000},{4,3200}],
    guildlevel = 3,
    skillproperty = [{2,168,0}]
    };
getRow(402)->
    #guildskillCfg {
    id = 402,
    skillid = 6,
    skillicon = 147,
    skilllevel = 27,
    skillname = "迅捷之风",
    skilldes = "敏捷+181",
    skillresearch = 34000,
    skilllearn = [{1,340000},{4,3400}],
    guildlevel = 3,
    skillproperty = [{2,181,0}]
    };
getRow(403)->
    #guildskillCfg {
    id = 403,
    skillid = 6,
    skillicon = 147,
    skilllevel = 28,
    skillname = "迅捷之风",
    skilldes = "敏捷+195",
    skillresearch = 36000,
    skilllearn = [{1,360000},{4,3600}],
    guildlevel = 3,
    skillproperty = [{2,195,0}]
    };
getRow(404)->
    #guildskillCfg {
    id = 404,
    skillid = 6,
    skillicon = 147,
    skilllevel = 29,
    skillname = "迅捷之风",
    skilldes = "敏捷+211",
    skillresearch = 38000,
    skilllearn = [{1,380000},{4,3800}],
    guildlevel = 3,
    skillproperty = [{2,211,0}]
    };
getRow(405)->
    #guildskillCfg {
    id = 405,
    skillid = 6,
    skillicon = 147,
    skilllevel = 30,
    skillname = "迅捷之风",
    skilldes = "敏捷+228",
    skillresearch = 40000,
    skilllearn = [{1,400000},{4,4000}],
    guildlevel = 3,
    skillproperty = [{2,228,0}]
    };
getRow(406)->
    #guildskillCfg {
    id = 406,
    skillid = 6,
    skillicon = 147,
    skilllevel = 31,
    skillname = "迅捷之风",
    skilldes = "敏捷+246",
    skillresearch = 42000,
    skilllearn = [{1,420000},{4,4200}],
    guildlevel = 4,
    skillproperty = [{2,246,0}]
    };
getRow(407)->
    #guildskillCfg {
    id = 407,
    skillid = 6,
    skillicon = 147,
    skilllevel = 32,
    skillname = "迅捷之风",
    skilldes = "敏捷+265",
    skillresearch = 44000,
    skilllearn = [{1,440000},{4,4400}],
    guildlevel = 4,
    skillproperty = [{2,265,0}]
    };
getRow(408)->
    #guildskillCfg {
    id = 408,
    skillid = 6,
    skillicon = 147,
    skilllevel = 33,
    skillname = "迅捷之风",
    skilldes = "敏捷+286",
    skillresearch = 46000,
    skilllearn = [{1,460000},{4,4600}],
    guildlevel = 4,
    skillproperty = [{2,286,0}]
    };
getRow(409)->
    #guildskillCfg {
    id = 409,
    skillid = 6,
    skillicon = 147,
    skilllevel = 34,
    skillname = "迅捷之风",
    skilldes = "敏捷+309",
    skillresearch = 48000,
    skilllearn = [{1,480000},{4,4800}],
    guildlevel = 4,
    skillproperty = [{2,309,0}]
    };
getRow(410)->
    #guildskillCfg {
    id = 410,
    skillid = 6,
    skillicon = 147,
    skilllevel = 35,
    skillname = "迅捷之风",
    skilldes = "敏捷+334",
    skillresearch = 50000,
    skilllearn = [{1,500000},{4,5000}],
    guildlevel = 4,
    skillproperty = [{2,334,0}]
    };
getRow(411)->
    #guildskillCfg {
    id = 411,
    skillid = 6,
    skillicon = 147,
    skilllevel = 36,
    skillname = "迅捷之风",
    skilldes = "敏捷+360",
    skillresearch = 52000,
    skilllearn = [{1,520000},{4,5200}],
    guildlevel = 4,
    skillproperty = [{2,360,0}]
    };
getRow(412)->
    #guildskillCfg {
    id = 412,
    skillid = 6,
    skillicon = 147,
    skilllevel = 37,
    skillname = "迅捷之风",
    skilldes = "敏捷+389",
    skillresearch = 54000,
    skilllearn = [{1,540000},{4,5400}],
    guildlevel = 4,
    skillproperty = [{2,389,0}]
    };
getRow(413)->
    #guildskillCfg {
    id = 413,
    skillid = 6,
    skillicon = 147,
    skilllevel = 38,
    skillname = "迅捷之风",
    skilldes = "敏捷+419",
    skillresearch = 56000,
    skilllearn = [{1,560000},{4,5600}],
    guildlevel = 4,
    skillproperty = [{2,419,0}]
    };
getRow(414)->
    #guildskillCfg {
    id = 414,
    skillid = 6,
    skillicon = 147,
    skilllevel = 39,
    skillname = "迅捷之风",
    skilldes = "敏捷+453",
    skillresearch = 58000,
    skilllearn = [{1,580000},{4,5800}],
    guildlevel = 4,
    skillproperty = [{2,453,0}]
    };
getRow(415)->
    #guildskillCfg {
    id = 415,
    skillid = 6,
    skillicon = 147,
    skilllevel = 40,
    skillname = "迅捷之风",
    skilldes = "敏捷+489",
    skillresearch = 60000,
    skilllearn = [{1,600000},{4,6000}],
    guildlevel = 4,
    skillproperty = [{2,489,0}]
    };
getRow(416)->
    #guildskillCfg {
    id = 416,
    skillid = 6,
    skillicon = 147,
    skilllevel = 41,
    skillname = "迅捷之风",
    skilldes = "敏捷+527",
    skillresearch = 65000,
    skilllearn = [{1,650000},{4,6500}],
    guildlevel = 5,
    skillproperty = [{2,527,0}]
    };
getRow(417)->
    #guildskillCfg {
    id = 417,
    skillid = 6,
    skillicon = 147,
    skilllevel = 42,
    skillname = "迅捷之风",
    skilldes = "敏捷+569",
    skillresearch = 70000,
    skilllearn = [{1,700000},{4,7000}],
    guildlevel = 5,
    skillproperty = [{2,569,0}]
    };
getRow(418)->
    #guildskillCfg {
    id = 418,
    skillid = 6,
    skillicon = 147,
    skilllevel = 43,
    skillname = "迅捷之风",
    skilldes = "敏捷+614",
    skillresearch = 75000,
    skilllearn = [{1,750000},{4,7500}],
    guildlevel = 5,
    skillproperty = [{2,614,0}]
    };
getRow(419)->
    #guildskillCfg {
    id = 419,
    skillid = 6,
    skillicon = 147,
    skilllevel = 44,
    skillname = "迅捷之风",
    skilldes = "敏捷+663",
    skillresearch = 80000,
    skilllearn = [{1,800000},{4,8000}],
    guildlevel = 5,
    skillproperty = [{2,663,0}]
    };
getRow(420)->
    #guildskillCfg {
    id = 420,
    skillid = 6,
    skillicon = 147,
    skilllevel = 45,
    skillname = "迅捷之风",
    skilldes = "敏捷+716",
    skillresearch = 85000,
    skilllearn = [{1,850000},{4,8500}],
    guildlevel = 5,
    skillproperty = [{2,716,0}]
    };
getRow(421)->
    #guildskillCfg {
    id = 421,
    skillid = 6,
    skillicon = 147,
    skilllevel = 46,
    skillname = "迅捷之风",
    skilldes = "敏捷+772",
    skillresearch = 90000,
    skilllearn = [{1,900000},{4,9000}],
    guildlevel = 5,
    skillproperty = [{2,772,0}]
    };
getRow(422)->
    #guildskillCfg {
    id = 422,
    skillid = 6,
    skillicon = 147,
    skilllevel = 47,
    skillname = "迅捷之风",
    skilldes = "敏捷+834",
    skillresearch = 95000,
    skilllearn = [{1,950000},{4,9500}],
    guildlevel = 5,
    skillproperty = [{2,834,0}]
    };
getRow(423)->
    #guildskillCfg {
    id = 423,
    skillid = 6,
    skillicon = 147,
    skilllevel = 48,
    skillname = "迅捷之风",
    skilldes = "敏捷+900",
    skillresearch = 100000,
    skilllearn = [{1,1000000},{4,10000}],
    guildlevel = 5,
    skillproperty = [{2,900,0}]
    };
getRow(424)->
    #guildskillCfg {
    id = 424,
    skillid = 6,
    skillicon = 147,
    skilllevel = 49,
    skillname = "迅捷之风",
    skilldes = "敏捷+971",
    skillresearch = 105000,
    skilllearn = [{1,1050000},{4,10500}],
    guildlevel = 5,
    skillproperty = [{2,971,0}]
    };
getRow(425)->
    #guildskillCfg {
    id = 425,
    skillid = 6,
    skillicon = 147,
    skilllevel = 50,
    skillname = "迅捷之风",
    skilldes = "敏捷+1048",
    skillresearch = 110000,
    skilllearn = [{1,1100000},{4,11000}],
    guildlevel = 5,
    skillproperty = [{2,1048,0}]
    };
getRow(426)->
    #guildskillCfg {
    id = 426,
    skillid = 6,
    skillicon = 147,
    skilllevel = 51,
    skillname = "迅捷之风",
    skilldes = "敏捷+1132",
    skillresearch = 115000,
    skilllearn = [{1,1150000},{4,11500}],
    guildlevel = 6,
    skillproperty = [{2,1132,0}]
    };
getRow(427)->
    #guildskillCfg {
    id = 427,
    skillid = 6,
    skillicon = 147,
    skilllevel = 52,
    skillname = "迅捷之风",
    skilldes = "敏捷+1221",
    skillresearch = 120000,
    skilllearn = [{1,1200000},{4,12000}],
    guildlevel = 6,
    skillproperty = [{2,1221,0}]
    };
getRow(428)->
    #guildskillCfg {
    id = 428,
    skillid = 6,
    skillicon = 147,
    skilllevel = 53,
    skillname = "迅捷之风",
    skilldes = "敏捷+1318",
    skillresearch = 125000,
    skilllearn = [{1,1250000},{4,12500}],
    guildlevel = 6,
    skillproperty = [{2,1318,0}]
    };
getRow(429)->
    #guildskillCfg {
    id = 429,
    skillid = 6,
    skillicon = 147,
    skilllevel = 54,
    skillname = "迅捷之风",
    skilldes = "敏捷+1423",
    skillresearch = 130000,
    skilllearn = [{1,1300000},{4,13000}],
    guildlevel = 6,
    skillproperty = [{2,1423,0}]
    };
getRow(430)->
    #guildskillCfg {
    id = 430,
    skillid = 6,
    skillicon = 147,
    skilllevel = 55,
    skillname = "迅捷之风",
    skilldes = "敏捷+1536",
    skillresearch = 135000,
    skilllearn = [{1,1350000},{4,13500}],
    guildlevel = 6,
    skillproperty = [{2,1536,0}]
    };
getRow(431)->
    #guildskillCfg {
    id = 431,
    skillid = 6,
    skillicon = 147,
    skilllevel = 56,
    skillname = "迅捷之风",
    skilldes = "敏捷+1658",
    skillresearch = 140000,
    skilllearn = [{1,1400000},{4,14000}],
    guildlevel = 6,
    skillproperty = [{2,1658,0}]
    };
getRow(432)->
    #guildskillCfg {
    id = 432,
    skillid = 6,
    skillicon = 147,
    skilllevel = 57,
    skillname = "迅捷之风",
    skilldes = "敏捷+1789",
    skillresearch = 145000,
    skilllearn = [{1,1450000},{4,14500}],
    guildlevel = 6,
    skillproperty = [{2,1789,0}]
    };
getRow(433)->
    #guildskillCfg {
    id = 433,
    skillid = 6,
    skillicon = 147,
    skilllevel = 58,
    skillname = "迅捷之风",
    skilldes = "敏捷+1931",
    skillresearch = 150000,
    skilllearn = [{1,1500000},{4,15000}],
    guildlevel = 6,
    skillproperty = [{2,1931,0}]
    };
getRow(434)->
    #guildskillCfg {
    id = 434,
    skillid = 6,
    skillicon = 147,
    skilllevel = 59,
    skillname = "迅捷之风",
    skilldes = "敏捷+2085",
    skillresearch = 155000,
    skilllearn = [{1,1550000},{4,15500}],
    guildlevel = 6,
    skillproperty = [{2,2085,0}]
    };
getRow(435)->
    #guildskillCfg {
    id = 435,
    skillid = 6,
    skillicon = 147,
    skilllevel = 60,
    skillname = "迅捷之风",
    skilldes = "敏捷+2250",
    skillresearch = 160000,
    skilllearn = [{1,1600000},{4,16000}],
    guildlevel = 6,
    skillproperty = [{2,2250,0}]
    };
getRow(436)->
    #guildskillCfg {
    id = 436,
    skillid = 6,
    skillicon = 147,
    skilllevel = 61,
    skillname = "迅捷之风",
    skilldes = "敏捷+2400",
    skillresearch = 170000,
    skilllearn = [{1,1700000},{4,17000}],
    guildlevel = 7,
    skillproperty = [{2,2400,0}]
    };
getRow(437)->
    #guildskillCfg {
    id = 437,
    skillid = 6,
    skillicon = 147,
    skilllevel = 62,
    skillname = "迅捷之风",
    skilldes = "敏捷+2550",
    skillresearch = 180000,
    skilllearn = [{1,1800000},{4,18000}],
    guildlevel = 7,
    skillproperty = [{2,2550,0}]
    };
getRow(438)->
    #guildskillCfg {
    id = 438,
    skillid = 6,
    skillicon = 147,
    skilllevel = 63,
    skillname = "迅捷之风",
    skilldes = "敏捷+2700",
    skillresearch = 190000,
    skilllearn = [{1,1900000},{4,19000}],
    guildlevel = 7,
    skillproperty = [{2,2700,0}]
    };
getRow(439)->
    #guildskillCfg {
    id = 439,
    skillid = 6,
    skillicon = 147,
    skilllevel = 64,
    skillname = "迅捷之风",
    skilldes = "敏捷+2850",
    skillresearch = 200000,
    skilllearn = [{1,2000000},{4,20000}],
    guildlevel = 7,
    skillproperty = [{2,2850,0}]
    };
getRow(440)->
    #guildskillCfg {
    id = 440,
    skillid = 6,
    skillicon = 147,
    skilllevel = 65,
    skillname = "迅捷之风",
    skilldes = "敏捷+3000",
    skillresearch = 210000,
    skilllearn = [{1,2100000},{4,21000}],
    guildlevel = 7,
    skillproperty = [{2,3000,0}]
    };
getRow(441)->
    #guildskillCfg {
    id = 441,
    skillid = 6,
    skillicon = 147,
    skilllevel = 66,
    skillname = "迅捷之风",
    skilldes = "敏捷+3150",
    skillresearch = 220000,
    skilllearn = [{1,2200000},{4,22000}],
    guildlevel = 7,
    skillproperty = [{2,3150,0}]
    };
getRow(442)->
    #guildskillCfg {
    id = 442,
    skillid = 6,
    skillicon = 147,
    skilllevel = 67,
    skillname = "迅捷之风",
    skilldes = "敏捷+3300",
    skillresearch = 230000,
    skilllearn = [{1,2300000},{4,23000}],
    guildlevel = 7,
    skillproperty = [{2,3300,0}]
    };
getRow(443)->
    #guildskillCfg {
    id = 443,
    skillid = 6,
    skillicon = 147,
    skilllevel = 68,
    skillname = "迅捷之风",
    skilldes = "敏捷+3450",
    skillresearch = 240000,
    skilllearn = [{1,2400000},{4,24000}],
    guildlevel = 7,
    skillproperty = [{2,3450,0}]
    };
getRow(444)->
    #guildskillCfg {
    id = 444,
    skillid = 6,
    skillicon = 147,
    skilllevel = 69,
    skillname = "迅捷之风",
    skilldes = "敏捷+3600",
    skillresearch = 250000,
    skilllearn = [{1,2500000},{4,25000}],
    guildlevel = 7,
    skillproperty = [{2,3600,0}]
    };
getRow(445)->
    #guildskillCfg {
    id = 445,
    skillid = 6,
    skillicon = 147,
    skilllevel = 70,
    skillname = "迅捷之风",
    skilldes = "敏捷+3750",
    skillresearch = 260000,
    skilllearn = [{1,2600000},{4,26000}],
    guildlevel = 7,
    skillproperty = [{2,3750,0}]
    };
getRow(446)->
    #guildskillCfg {
    id = 446,
    skillid = 6,
    skillicon = 147,
    skilllevel = 71,
    skillname = "迅捷之风",
    skilldes = "敏捷+3900",
    skillresearch = 270000,
    skilllearn = [{1,2700000},{4,27000}],
    guildlevel = 8,
    skillproperty = [{2,3900,0}]
    };
getRow(447)->
    #guildskillCfg {
    id = 447,
    skillid = 6,
    skillicon = 147,
    skilllevel = 72,
    skillname = "迅捷之风",
    skilldes = "敏捷+4050",
    skillresearch = 280000,
    skilllearn = [{1,2800000},{4,28000}],
    guildlevel = 8,
    skillproperty = [{2,4050,0}]
    };
getRow(448)->
    #guildskillCfg {
    id = 448,
    skillid = 6,
    skillicon = 147,
    skilllevel = 73,
    skillname = "迅捷之风",
    skilldes = "敏捷+4200",
    skillresearch = 290000,
    skilllearn = [{1,2900000},{4,29000}],
    guildlevel = 8,
    skillproperty = [{2,4200,0}]
    };
getRow(449)->
    #guildskillCfg {
    id = 449,
    skillid = 6,
    skillicon = 147,
    skilllevel = 74,
    skillname = "迅捷之风",
    skilldes = "敏捷+4350",
    skillresearch = 300000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{2,4350,0}]
    };
getRow(450)->
    #guildskillCfg {
    id = 450,
    skillid = 6,
    skillicon = 147,
    skilllevel = 75,
    skillname = "迅捷之风",
    skilldes = "敏捷+4500",
    skillresearch = 310000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{2,4500,0}]
    };
getRow(451)->
    #guildskillCfg {
    id = 451,
    skillid = 7,
    skillicon = 148,
    skilllevel = 1,
    skillname = "贤者智慧",
    skilldes = "智力+23",
    skillresearch = 1000,
    skilllearn = [{1,10000},{4,100}],
    guildlevel = 1,
    skillproperty = [{3,23,0}]
    };
getRow(452)->
    #guildskillCfg {
    id = 452,
    skillid = 7,
    skillicon = 148,
    skilllevel = 2,
    skillname = "贤者智慧",
    skilldes = "智力+27",
    skillresearch = 2000,
    skilllearn = [{1,20000},{4,200}],
    guildlevel = 1,
    skillproperty = [{3,27,0}]
    };
getRow(453)->
    #guildskillCfg {
    id = 453,
    skillid = 7,
    skillicon = 148,
    skilllevel = 3,
    skillname = "贤者智慧",
    skilldes = "智力+29",
    skillresearch = 3000,
    skilllearn = [{1,30000},{4,300}],
    guildlevel = 1,
    skillproperty = [{3,29,0}]
    };
getRow(454)->
    #guildskillCfg {
    id = 454,
    skillid = 7,
    skillicon = 148,
    skilllevel = 4,
    skillname = "贤者智慧",
    skilldes = "智力+31",
    skillresearch = 4000,
    skilllearn = [{1,40000},{4,400}],
    guildlevel = 1,
    skillproperty = [{3,31,0}]
    };
getRow(455)->
    #guildskillCfg {
    id = 455,
    skillid = 7,
    skillicon = 148,
    skilllevel = 5,
    skillname = "贤者智慧",
    skilldes = "智力+34",
    skillresearch = 5000,
    skilllearn = [{1,50000},{4,500}],
    guildlevel = 1,
    skillproperty = [{3,34,0}]
    };
getRow(456)->
    #guildskillCfg {
    id = 456,
    skillid = 7,
    skillicon = 148,
    skilllevel = 6,
    skillname = "贤者智慧",
    skilldes = "智力+36",
    skillresearch = 6000,
    skilllearn = [{1,60000},{4,600}],
    guildlevel = 1,
    skillproperty = [{3,36,0}]
    };
getRow(457)->
    #guildskillCfg {
    id = 457,
    skillid = 7,
    skillicon = 148,
    skilllevel = 7,
    skillname = "贤者智慧",
    skilldes = "智力+39",
    skillresearch = 7000,
    skilllearn = [{1,70000},{4,700}],
    guildlevel = 1,
    skillproperty = [{3,39,0}]
    };
getRow(458)->
    #guildskillCfg {
    id = 458,
    skillid = 7,
    skillicon = 148,
    skilllevel = 8,
    skillname = "贤者智慧",
    skilldes = "智力+42",
    skillresearch = 8000,
    skilllearn = [{1,80000},{4,800}],
    guildlevel = 1,
    skillproperty = [{3,42,0}]
    };
getRow(459)->
    #guildskillCfg {
    id = 459,
    skillid = 7,
    skillicon = 148,
    skilllevel = 9,
    skillname = "贤者智慧",
    skilldes = "智力+46",
    skillresearch = 9000,
    skilllearn = [{1,90000},{4,900}],
    guildlevel = 1,
    skillproperty = [{3,46,0}]
    };
getRow(460)->
    #guildskillCfg {
    id = 460,
    skillid = 7,
    skillicon = 148,
    skilllevel = 10,
    skillname = "贤者智慧",
    skilldes = "智力+49",
    skillresearch = 10000,
    skilllearn = [{1,100000},{4,1000}],
    guildlevel = 1,
    skillproperty = [{3,49,0}]
    };
getRow(461)->
    #guildskillCfg {
    id = 461,
    skillid = 7,
    skillicon = 148,
    skilllevel = 11,
    skillname = "贤者智慧",
    skilldes = "智力+53",
    skillresearch = 11000,
    skilllearn = [{1,110000},{4,1100}],
    guildlevel = 2,
    skillproperty = [{3,53,0}]
    };
getRow(462)->
    #guildskillCfg {
    id = 462,
    skillid = 7,
    skillicon = 148,
    skilllevel = 12,
    skillname = "贤者智慧",
    skilldes = "智力+58",
    skillresearch = 12000,
    skilllearn = [{1,120000},{4,1200}],
    guildlevel = 2,
    skillproperty = [{3,58,0}]
    };
getRow(463)->
    #guildskillCfg {
    id = 463,
    skillid = 7,
    skillicon = 148,
    skilllevel = 13,
    skillname = "贤者智慧",
    skilldes = "智力+62",
    skillresearch = 13000,
    skilllearn = [{1,130000},{4,1300}],
    guildlevel = 2,
    skillproperty = [{3,62,0}]
    };
getRow(464)->
    #guildskillCfg {
    id = 464,
    skillid = 7,
    skillicon = 148,
    skilllevel = 14,
    skillname = "贤者智慧",
    skilldes = "智力+67",
    skillresearch = 14000,
    skilllearn = [{1,140000},{4,1400}],
    guildlevel = 2,
    skillproperty = [{3,67,0}]
    };
getRow(465)->
    #guildskillCfg {
    id = 465,
    skillid = 7,
    skillicon = 148,
    skilllevel = 15,
    skillname = "贤者智慧",
    skilldes = "智力+72",
    skillresearch = 15000,
    skilllearn = [{1,150000},{4,1500}],
    guildlevel = 2,
    skillproperty = [{3,72,0}]
    };
getRow(466)->
    #guildskillCfg {
    id = 466,
    skillid = 7,
    skillicon = 148,
    skilllevel = 16,
    skillname = "贤者智慧",
    skilldes = "智力+78",
    skillresearch = 16000,
    skilllearn = [{1,160000},{4,1600}],
    guildlevel = 2,
    skillproperty = [{3,78,0}]
    };
getRow(467)->
    #guildskillCfg {
    id = 467,
    skillid = 7,
    skillicon = 148,
    skilllevel = 17,
    skillname = "贤者智慧",
    skilldes = "智力+84",
    skillresearch = 17000,
    skilllearn = [{1,170000},{4,1700}],
    guildlevel = 2,
    skillproperty = [{3,84,0}]
    };
getRow(468)->
    #guildskillCfg {
    id = 468,
    skillid = 7,
    skillicon = 148,
    skilllevel = 18,
    skillname = "贤者智慧",
    skilldes = "智力+91",
    skillresearch = 18000,
    skilllearn = [{1,180000},{4,1800}],
    guildlevel = 2,
    skillproperty = [{3,91,0}]
    };
getRow(469)->
    #guildskillCfg {
    id = 469,
    skillid = 7,
    skillicon = 148,
    skilllevel = 19,
    skillname = "贤者智慧",
    skilldes = "智力+98",
    skillresearch = 19000,
    skilllearn = [{1,190000},{4,1900}],
    guildlevel = 2,
    skillproperty = [{3,98,0}]
    };
getRow(470)->
    #guildskillCfg {
    id = 470,
    skillid = 7,
    skillicon = 148,
    skilllevel = 20,
    skillname = "贤者智慧",
    skilldes = "智力+106",
    skillresearch = 20000,
    skilllearn = [{1,200000},{4,2000}],
    guildlevel = 2,
    skillproperty = [{3,106,0}]
    };
getRow(471)->
    #guildskillCfg {
    id = 471,
    skillid = 7,
    skillicon = 148,
    skilllevel = 21,
    skillname = "贤者智慧",
    skilldes = "智力+115",
    skillresearch = 22000,
    skilllearn = [{1,220000},{4,2200}],
    guildlevel = 3,
    skillproperty = [{3,115,0}]
    };
getRow(472)->
    #guildskillCfg {
    id = 472,
    skillid = 7,
    skillicon = 148,
    skilllevel = 22,
    skillname = "贤者智慧",
    skilldes = "智力+124",
    skillresearch = 24000,
    skilllearn = [{1,240000},{4,2400}],
    guildlevel = 3,
    skillproperty = [{3,124,0}]
    };
getRow(473)->
    #guildskillCfg {
    id = 473,
    skillid = 7,
    skillicon = 148,
    skilllevel = 23,
    skillname = "贤者智慧",
    skilldes = "智力+133",
    skillresearch = 26000,
    skilllearn = [{1,260000},{4,2600}],
    guildlevel = 3,
    skillproperty = [{3,133,0}]
    };
getRow(474)->
    #guildskillCfg {
    id = 474,
    skillid = 7,
    skillicon = 148,
    skilllevel = 24,
    skillname = "贤者智慧",
    skilldes = "智力+144",
    skillresearch = 28000,
    skilllearn = [{1,280000},{4,2800}],
    guildlevel = 3,
    skillproperty = [{3,144,0}]
    };
getRow(475)->
    #guildskillCfg {
    id = 475,
    skillid = 7,
    skillicon = 148,
    skilllevel = 25,
    skillname = "贤者智慧",
    skilldes = "智力+155",
    skillresearch = 30000,
    skilllearn = [{1,300000},{4,3000}],
    guildlevel = 3,
    skillproperty = [{3,155,0}]
    };
getRow(476)->
    #guildskillCfg {
    id = 476,
    skillid = 7,
    skillicon = 148,
    skilllevel = 26,
    skillname = "贤者智慧",
    skilldes = "智力+168",
    skillresearch = 32000,
    skilllearn = [{1,320000},{4,3200}],
    guildlevel = 3,
    skillproperty = [{3,168,0}]
    };
getRow(477)->
    #guildskillCfg {
    id = 477,
    skillid = 7,
    skillicon = 148,
    skilllevel = 27,
    skillname = "贤者智慧",
    skilldes = "智力+181",
    skillresearch = 34000,
    skilllearn = [{1,340000},{4,3400}],
    guildlevel = 3,
    skillproperty = [{3,181,0}]
    };
getRow(478)->
    #guildskillCfg {
    id = 478,
    skillid = 7,
    skillicon = 148,
    skilllevel = 28,
    skillname = "贤者智慧",
    skilldes = "智力+195",
    skillresearch = 36000,
    skilllearn = [{1,360000},{4,3600}],
    guildlevel = 3,
    skillproperty = [{3,195,0}]
    };
getRow(479)->
    #guildskillCfg {
    id = 479,
    skillid = 7,
    skillicon = 148,
    skilllevel = 29,
    skillname = "贤者智慧",
    skilldes = "智力+211",
    skillresearch = 38000,
    skilllearn = [{1,380000},{4,3800}],
    guildlevel = 3,
    skillproperty = [{3,211,0}]
    };
getRow(480)->
    #guildskillCfg {
    id = 480,
    skillid = 7,
    skillicon = 148,
    skilllevel = 30,
    skillname = "贤者智慧",
    skilldes = "智力+228",
    skillresearch = 40000,
    skilllearn = [{1,400000},{4,4000}],
    guildlevel = 3,
    skillproperty = [{3,228,0}]
    };
getRow(481)->
    #guildskillCfg {
    id = 481,
    skillid = 7,
    skillicon = 148,
    skilllevel = 31,
    skillname = "贤者智慧",
    skilldes = "智力+246",
    skillresearch = 42000,
    skilllearn = [{1,420000},{4,4200}],
    guildlevel = 4,
    skillproperty = [{3,246,0}]
    };
getRow(482)->
    #guildskillCfg {
    id = 482,
    skillid = 7,
    skillicon = 148,
    skilllevel = 32,
    skillname = "贤者智慧",
    skilldes = "智力+265",
    skillresearch = 44000,
    skilllearn = [{1,440000},{4,4400}],
    guildlevel = 4,
    skillproperty = [{3,265,0}]
    };
getRow(483)->
    #guildskillCfg {
    id = 483,
    skillid = 7,
    skillicon = 148,
    skilllevel = 33,
    skillname = "贤者智慧",
    skilldes = "智力+286",
    skillresearch = 46000,
    skilllearn = [{1,460000},{4,4600}],
    guildlevel = 4,
    skillproperty = [{3,286,0}]
    };
getRow(484)->
    #guildskillCfg {
    id = 484,
    skillid = 7,
    skillicon = 148,
    skilllevel = 34,
    skillname = "贤者智慧",
    skilldes = "智力+309",
    skillresearch = 48000,
    skilllearn = [{1,480000},{4,4800}],
    guildlevel = 4,
    skillproperty = [{3,309,0}]
    };
getRow(485)->
    #guildskillCfg {
    id = 485,
    skillid = 7,
    skillicon = 148,
    skilllevel = 35,
    skillname = "贤者智慧",
    skilldes = "智力+334",
    skillresearch = 50000,
    skilllearn = [{1,500000},{4,5000}],
    guildlevel = 4,
    skillproperty = [{3,334,0}]
    };
getRow(486)->
    #guildskillCfg {
    id = 486,
    skillid = 7,
    skillicon = 148,
    skilllevel = 36,
    skillname = "贤者智慧",
    skilldes = "智力+360",
    skillresearch = 52000,
    skilllearn = [{1,520000},{4,5200}],
    guildlevel = 4,
    skillproperty = [{3,360,0}]
    };
getRow(487)->
    #guildskillCfg {
    id = 487,
    skillid = 7,
    skillicon = 148,
    skilllevel = 37,
    skillname = "贤者智慧",
    skilldes = "智力+389",
    skillresearch = 54000,
    skilllearn = [{1,540000},{4,5400}],
    guildlevel = 4,
    skillproperty = [{3,389,0}]
    };
getRow(488)->
    #guildskillCfg {
    id = 488,
    skillid = 7,
    skillicon = 148,
    skilllevel = 38,
    skillname = "贤者智慧",
    skilldes = "智力+419",
    skillresearch = 56000,
    skilllearn = [{1,560000},{4,5600}],
    guildlevel = 4,
    skillproperty = [{3,419,0}]
    };
getRow(489)->
    #guildskillCfg {
    id = 489,
    skillid = 7,
    skillicon = 148,
    skilllevel = 39,
    skillname = "贤者智慧",
    skilldes = "智力+453",
    skillresearch = 58000,
    skilllearn = [{1,580000},{4,5800}],
    guildlevel = 4,
    skillproperty = [{3,453,0}]
    };
getRow(490)->
    #guildskillCfg {
    id = 490,
    skillid = 7,
    skillicon = 148,
    skilllevel = 40,
    skillname = "贤者智慧",
    skilldes = "智力+489",
    skillresearch = 60000,
    skilllearn = [{1,600000},{4,6000}],
    guildlevel = 4,
    skillproperty = [{3,489,0}]
    };
getRow(491)->
    #guildskillCfg {
    id = 491,
    skillid = 7,
    skillicon = 148,
    skilllevel = 41,
    skillname = "贤者智慧",
    skilldes = "智力+527",
    skillresearch = 65000,
    skilllearn = [{1,650000},{4,6500}],
    guildlevel = 5,
    skillproperty = [{3,527,0}]
    };
getRow(492)->
    #guildskillCfg {
    id = 492,
    skillid = 7,
    skillicon = 148,
    skilllevel = 42,
    skillname = "贤者智慧",
    skilldes = "智力+569",
    skillresearch = 70000,
    skilllearn = [{1,700000},{4,7000}],
    guildlevel = 5,
    skillproperty = [{3,569,0}]
    };
getRow(493)->
    #guildskillCfg {
    id = 493,
    skillid = 7,
    skillicon = 148,
    skilllevel = 43,
    skillname = "贤者智慧",
    skilldes = "智力+614",
    skillresearch = 75000,
    skilllearn = [{1,750000},{4,7500}],
    guildlevel = 5,
    skillproperty = [{3,614,0}]
    };
getRow(494)->
    #guildskillCfg {
    id = 494,
    skillid = 7,
    skillicon = 148,
    skilllevel = 44,
    skillname = "贤者智慧",
    skilldes = "智力+663",
    skillresearch = 80000,
    skilllearn = [{1,800000},{4,8000}],
    guildlevel = 5,
    skillproperty = [{3,663,0}]
    };
getRow(495)->
    #guildskillCfg {
    id = 495,
    skillid = 7,
    skillicon = 148,
    skilllevel = 45,
    skillname = "贤者智慧",
    skilldes = "智力+716",
    skillresearch = 85000,
    skilllearn = [{1,850000},{4,8500}],
    guildlevel = 5,
    skillproperty = [{3,716,0}]
    };
getRow(496)->
    #guildskillCfg {
    id = 496,
    skillid = 7,
    skillicon = 148,
    skilllevel = 46,
    skillname = "贤者智慧",
    skilldes = "智力+772",
    skillresearch = 90000,
    skilllearn = [{1,900000},{4,9000}],
    guildlevel = 5,
    skillproperty = [{3,772,0}]
    };
getRow(497)->
    #guildskillCfg {
    id = 497,
    skillid = 7,
    skillicon = 148,
    skilllevel = 47,
    skillname = "贤者智慧",
    skilldes = "智力+834",
    skillresearch = 95000,
    skilllearn = [{1,950000},{4,9500}],
    guildlevel = 5,
    skillproperty = [{3,834,0}]
    };
getRow(498)->
    #guildskillCfg {
    id = 498,
    skillid = 7,
    skillicon = 148,
    skilllevel = 48,
    skillname = "贤者智慧",
    skilldes = "智力+900",
    skillresearch = 100000,
    skilllearn = [{1,1000000},{4,10000}],
    guildlevel = 5,
    skillproperty = [{3,900,0}]
    };
getRow(499)->
    #guildskillCfg {
    id = 499,
    skillid = 7,
    skillicon = 148,
    skilllevel = 49,
    skillname = "贤者智慧",
    skilldes = "智力+971",
    skillresearch = 105000,
    skilllearn = [{1,1050000},{4,10500}],
    guildlevel = 5,
    skillproperty = [{3,971,0}]
    };
getRow(500)->
    #guildskillCfg {
    id = 500,
    skillid = 7,
    skillicon = 148,
    skilllevel = 50,
    skillname = "贤者智慧",
    skilldes = "智力+1048",
    skillresearch = 110000,
    skilllearn = [{1,1100000},{4,11000}],
    guildlevel = 5,
    skillproperty = [{3,1048,0}]
    };
getRow(501)->
    #guildskillCfg {
    id = 501,
    skillid = 7,
    skillicon = 148,
    skilllevel = 51,
    skillname = "贤者智慧",
    skilldes = "智力+1132",
    skillresearch = 115000,
    skilllearn = [{1,1150000},{4,11500}],
    guildlevel = 6,
    skillproperty = [{3,1132,0}]
    };
getRow(502)->
    #guildskillCfg {
    id = 502,
    skillid = 7,
    skillicon = 148,
    skilllevel = 52,
    skillname = "贤者智慧",
    skilldes = "智力+1221",
    skillresearch = 120000,
    skilllearn = [{1,1200000},{4,12000}],
    guildlevel = 6,
    skillproperty = [{3,1221,0}]
    };
getRow(503)->
    #guildskillCfg {
    id = 503,
    skillid = 7,
    skillicon = 148,
    skilllevel = 53,
    skillname = "贤者智慧",
    skilldes = "智力+1318",
    skillresearch = 125000,
    skilllearn = [{1,1250000},{4,12500}],
    guildlevel = 6,
    skillproperty = [{3,1318,0}]
    };
getRow(504)->
    #guildskillCfg {
    id = 504,
    skillid = 7,
    skillicon = 148,
    skilllevel = 54,
    skillname = "贤者智慧",
    skilldes = "智力+1423",
    skillresearch = 130000,
    skilllearn = [{1,1300000},{4,13000}],
    guildlevel = 6,
    skillproperty = [{3,1423,0}]
    };
getRow(505)->
    #guildskillCfg {
    id = 505,
    skillid = 7,
    skillicon = 148,
    skilllevel = 55,
    skillname = "贤者智慧",
    skilldes = "智力+1536",
    skillresearch = 135000,
    skilllearn = [{1,1350000},{4,13500}],
    guildlevel = 6,
    skillproperty = [{3,1536,0}]
    };
getRow(506)->
    #guildskillCfg {
    id = 506,
    skillid = 7,
    skillicon = 148,
    skilllevel = 56,
    skillname = "贤者智慧",
    skilldes = "智力+1658",
    skillresearch = 140000,
    skilllearn = [{1,1400000},{4,14000}],
    guildlevel = 6,
    skillproperty = [{3,1658,0}]
    };
getRow(507)->
    #guildskillCfg {
    id = 507,
    skillid = 7,
    skillicon = 148,
    skilllevel = 57,
    skillname = "贤者智慧",
    skilldes = "智力+1789",
    skillresearch = 145000,
    skilllearn = [{1,1450000},{4,14500}],
    guildlevel = 6,
    skillproperty = [{3,1789,0}]
    };
getRow(508)->
    #guildskillCfg {
    id = 508,
    skillid = 7,
    skillicon = 148,
    skilllevel = 58,
    skillname = "贤者智慧",
    skilldes = "智力+1931",
    skillresearch = 150000,
    skilllearn = [{1,1500000},{4,15000}],
    guildlevel = 6,
    skillproperty = [{3,1931,0}]
    };
getRow(509)->
    #guildskillCfg {
    id = 509,
    skillid = 7,
    skillicon = 148,
    skilllevel = 59,
    skillname = "贤者智慧",
    skilldes = "智力+2085",
    skillresearch = 155000,
    skilllearn = [{1,1550000},{4,15500}],
    guildlevel = 6,
    skillproperty = [{3,2085,0}]
    };
getRow(510)->
    #guildskillCfg {
    id = 510,
    skillid = 7,
    skillicon = 148,
    skilllevel = 60,
    skillname = "贤者智慧",
    skilldes = "智力+2250",
    skillresearch = 160000,
    skilllearn = [{1,1600000},{4,16000}],
    guildlevel = 6,
    skillproperty = [{3,2250,0}]
    };
getRow(511)->
    #guildskillCfg {
    id = 511,
    skillid = 7,
    skillicon = 148,
    skilllevel = 61,
    skillname = "贤者智慧",
    skilldes = "智力+2400",
    skillresearch = 170000,
    skilllearn = [{1,1700000},{4,17000}],
    guildlevel = 7,
    skillproperty = [{3,2400,0}]
    };
getRow(512)->
    #guildskillCfg {
    id = 512,
    skillid = 7,
    skillicon = 148,
    skilllevel = 62,
    skillname = "贤者智慧",
    skilldes = "智力+2550",
    skillresearch = 180000,
    skilllearn = [{1,1800000},{4,18000}],
    guildlevel = 7,
    skillproperty = [{3,2550,0}]
    };
getRow(513)->
    #guildskillCfg {
    id = 513,
    skillid = 7,
    skillicon = 148,
    skilllevel = 63,
    skillname = "贤者智慧",
    skilldes = "智力+2700",
    skillresearch = 190000,
    skilllearn = [{1,1900000},{4,19000}],
    guildlevel = 7,
    skillproperty = [{3,2700,0}]
    };
getRow(514)->
    #guildskillCfg {
    id = 514,
    skillid = 7,
    skillicon = 148,
    skilllevel = 64,
    skillname = "贤者智慧",
    skilldes = "智力+2850",
    skillresearch = 200000,
    skilllearn = [{1,2000000},{4,20000}],
    guildlevel = 7,
    skillproperty = [{3,2850,0}]
    };
getRow(515)->
    #guildskillCfg {
    id = 515,
    skillid = 7,
    skillicon = 148,
    skilllevel = 65,
    skillname = "贤者智慧",
    skilldes = "智力+3000",
    skillresearch = 210000,
    skilllearn = [{1,2100000},{4,21000}],
    guildlevel = 7,
    skillproperty = [{3,3000,0}]
    };
getRow(516)->
    #guildskillCfg {
    id = 516,
    skillid = 7,
    skillicon = 148,
    skilllevel = 66,
    skillname = "贤者智慧",
    skilldes = "智力+3150",
    skillresearch = 220000,
    skilllearn = [{1,2200000},{4,22000}],
    guildlevel = 7,
    skillproperty = [{3,3150,0}]
    };
getRow(517)->
    #guildskillCfg {
    id = 517,
    skillid = 7,
    skillicon = 148,
    skilllevel = 67,
    skillname = "贤者智慧",
    skilldes = "智力+3300",
    skillresearch = 230000,
    skilllearn = [{1,2300000},{4,23000}],
    guildlevel = 7,
    skillproperty = [{3,3300,0}]
    };
getRow(518)->
    #guildskillCfg {
    id = 518,
    skillid = 7,
    skillicon = 148,
    skilllevel = 68,
    skillname = "贤者智慧",
    skilldes = "智力+3450",
    skillresearch = 240000,
    skilllearn = [{1,2400000},{4,24000}],
    guildlevel = 7,
    skillproperty = [{3,3450,0}]
    };
getRow(519)->
    #guildskillCfg {
    id = 519,
    skillid = 7,
    skillicon = 148,
    skilllevel = 69,
    skillname = "贤者智慧",
    skilldes = "智力+3600",
    skillresearch = 250000,
    skilllearn = [{1,2500000},{4,25000}],
    guildlevel = 7,
    skillproperty = [{3,3600,0}]
    };
getRow(520)->
    #guildskillCfg {
    id = 520,
    skillid = 7,
    skillicon = 148,
    skilllevel = 70,
    skillname = "贤者智慧",
    skilldes = "智力+3750",
    skillresearch = 260000,
    skilllearn = [{1,2600000},{4,26000}],
    guildlevel = 7,
    skillproperty = [{3,3750,0}]
    };
getRow(521)->
    #guildskillCfg {
    id = 521,
    skillid = 7,
    skillicon = 148,
    skilllevel = 71,
    skillname = "贤者智慧",
    skilldes = "智力+3900",
    skillresearch = 270000,
    skilllearn = [{1,2700000},{4,27000}],
    guildlevel = 8,
    skillproperty = [{2,3900,0}]
    };
getRow(522)->
    #guildskillCfg {
    id = 522,
    skillid = 7,
    skillicon = 148,
    skilllevel = 72,
    skillname = "贤者智慧",
    skilldes = "智力+4050",
    skillresearch = 280000,
    skilllearn = [{1,2800000},{4,28000}],
    guildlevel = 8,
    skillproperty = [{2,4050,0}]
    };
getRow(523)->
    #guildskillCfg {
    id = 523,
    skillid = 7,
    skillicon = 148,
    skilllevel = 73,
    skillname = "贤者智慧",
    skilldes = "智力+4200",
    skillresearch = 290000,
    skilllearn = [{1,2900000},{4,29000}],
    guildlevel = 8,
    skillproperty = [{2,4200,0}]
    };
getRow(524)->
    #guildskillCfg {
    id = 524,
    skillid = 7,
    skillicon = 148,
    skilllevel = 74,
    skillname = "贤者智慧",
    skilldes = "智力+4350",
    skillresearch = 300000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{2,4350,0}]
    };
getRow(525)->
    #guildskillCfg {
    id = 525,
    skillid = 7,
    skillicon = 148,
    skilllevel = 75,
    skillname = "贤者智慧",
    skilldes = "智力+4500",
    skillresearch = 310000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{2,4500,0}]
    };
getRow(526)->
    #guildskillCfg {
    id = 526,
    skillid = 8,
    skillicon = 145,
    skilllevel = 1,
    skillname = "耐力强化",
    skilldes = "体质+45",
    skillresearch = 1000,
    skilllearn = [{1,10000},{4,100}],
    guildlevel = 1,
    skillproperty = [{4,45,0}]
    };
getRow(527)->
    #guildskillCfg {
    id = 527,
    skillid = 8,
    skillicon = 145,
    skilllevel = 2,
    skillname = "耐力强化",
    skilldes = "体质+52",
    skillresearch = 2000,
    skilllearn = [{1,20000},{4,200}],
    guildlevel = 1,
    skillproperty = [{4,52,0}]
    };
getRow(528)->
    #guildskillCfg {
    id = 528,
    skillid = 8,
    skillicon = 145,
    skilllevel = 3,
    skillname = "耐力强化",
    skilldes = "体质+57",
    skillresearch = 3000,
    skilllearn = [{1,30000},{4,300}],
    guildlevel = 1,
    skillproperty = [{4,57,0}]
    };
getRow(529)->
    #guildskillCfg {
    id = 529,
    skillid = 8,
    skillicon = 145,
    skilllevel = 4,
    skillname = "耐力强化",
    skilldes = "体质+61",
    skillresearch = 4000,
    skilllearn = [{1,40000},{4,400}],
    guildlevel = 1,
    skillproperty = [{4,61,0}]
    };
getRow(530)->
    #guildskillCfg {
    id = 530,
    skillid = 8,
    skillicon = 145,
    skilllevel = 5,
    skillname = "耐力强化",
    skilldes = "体质+66",
    skillresearch = 5000,
    skilllearn = [{1,50000},{4,500}],
    guildlevel = 1,
    skillproperty = [{4,66,0}]
    };
getRow(531)->
    #guildskillCfg {
    id = 531,
    skillid = 8,
    skillicon = 145,
    skilllevel = 6,
    skillname = "耐力强化",
    skilldes = "体质+71",
    skillresearch = 6000,
    skilllearn = [{1,60000},{4,600}],
    guildlevel = 1,
    skillproperty = [{4,71,0}]
    };
getRow(532)->
    #guildskillCfg {
    id = 532,
    skillid = 8,
    skillicon = 145,
    skilllevel = 7,
    skillname = "耐力强化",
    skilldes = "体质+77",
    skillresearch = 7000,
    skilllearn = [{1,70000},{4,700}],
    guildlevel = 1,
    skillproperty = [{4,77,0}]
    };
getRow(533)->
    #guildskillCfg {
    id = 533,
    skillid = 8,
    skillicon = 145,
    skilllevel = 8,
    skillname = "耐力强化",
    skilldes = "体质+83",
    skillresearch = 8000,
    skilllearn = [{1,80000},{4,800}],
    guildlevel = 1,
    skillproperty = [{4,83,0}]
    };
getRow(534)->
    #guildskillCfg {
    id = 534,
    skillid = 8,
    skillicon = 145,
    skilllevel = 9,
    skillname = "耐力强化",
    skilldes = "体质+89",
    skillresearch = 9000,
    skilllearn = [{1,90000},{4,900}],
    guildlevel = 1,
    skillproperty = [{4,89,0}]
    };
getRow(535)->
    #guildskillCfg {
    id = 535,
    skillid = 8,
    skillicon = 145,
    skilllevel = 10,
    skillname = "耐力强化",
    skilldes = "体质+97",
    skillresearch = 10000,
    skilllearn = [{1,100000},{4,1000}],
    guildlevel = 1,
    skillproperty = [{4,97,0}]
    };
getRow(536)->
    #guildskillCfg {
    id = 536,
    skillid = 8,
    skillicon = 145,
    skilllevel = 11,
    skillname = "耐力强化",
    skilldes = "体质+104",
    skillresearch = 11000,
    skilllearn = [{1,110000},{4,1100}],
    guildlevel = 2,
    skillproperty = [{4,104,0}]
    };
getRow(537)->
    #guildskillCfg {
    id = 537,
    skillid = 8,
    skillicon = 145,
    skilllevel = 12,
    skillname = "耐力强化",
    skilldes = "体质+113",
    skillresearch = 12000,
    skilllearn = [{1,120000},{4,1200}],
    guildlevel = 2,
    skillproperty = [{4,113,0}]
    };
getRow(538)->
    #guildskillCfg {
    id = 538,
    skillid = 8,
    skillicon = 145,
    skilllevel = 13,
    skillname = "耐力强化",
    skilldes = "体质+121",
    skillresearch = 13000,
    skilllearn = [{1,130000},{4,1300}],
    guildlevel = 2,
    skillproperty = [{4,121,0}]
    };
getRow(539)->
    #guildskillCfg {
    id = 539,
    skillid = 8,
    skillicon = 145,
    skilllevel = 14,
    skillname = "耐力强化",
    skilldes = "体质+131",
    skillresearch = 14000,
    skilllearn = [{1,140000},{4,1400}],
    guildlevel = 2,
    skillproperty = [{4,131,0}]
    };
getRow(540)->
    #guildskillCfg {
    id = 540,
    skillid = 8,
    skillicon = 145,
    skilllevel = 15,
    skillname = "耐力强化",
    skilldes = "体质+141",
    skillresearch = 15000,
    skilllearn = [{1,150000},{4,1500}],
    guildlevel = 2,
    skillproperty = [{4,141,0}]
    };
getRow(541)->
    #guildskillCfg {
    id = 541,
    skillid = 8,
    skillicon = 145,
    skilllevel = 16,
    skillname = "耐力强化",
    skilldes = "体质+153",
    skillresearch = 16000,
    skilllearn = [{1,160000},{4,1600}],
    guildlevel = 2,
    skillproperty = [{4,153,0}]
    };
getRow(542)->
    #guildskillCfg {
    id = 542,
    skillid = 8,
    skillicon = 145,
    skilllevel = 17,
    skillname = "耐力强化",
    skilldes = "体质+165",
    skillresearch = 17000,
    skilllearn = [{1,170000},{4,1700}],
    guildlevel = 2,
    skillproperty = [{4,165,0}]
    };
getRow(543)->
    #guildskillCfg {
    id = 543,
    skillid = 8,
    skillicon = 145,
    skilllevel = 18,
    skillname = "耐力强化",
    skilldes = "体质+178",
    skillresearch = 18000,
    skilllearn = [{1,180000},{4,1800}],
    guildlevel = 2,
    skillproperty = [{4,178,0}]
    };
getRow(544)->
    #guildskillCfg {
    id = 544,
    skillid = 8,
    skillicon = 145,
    skilllevel = 19,
    skillname = "耐力强化",
    skilldes = "体质+192",
    skillresearch = 19000,
    skilllearn = [{1,190000},{4,1900}],
    guildlevel = 2,
    skillproperty = [{4,192,0}]
    };
getRow(545)->
    #guildskillCfg {
    id = 545,
    skillid = 8,
    skillicon = 145,
    skilllevel = 20,
    skillname = "耐力强化",
    skilldes = "体质+207",
    skillresearch = 20000,
    skilllearn = [{1,200000},{4,2000}],
    guildlevel = 2,
    skillproperty = [{4,207,0}]
    };
getRow(546)->
    #guildskillCfg {
    id = 546,
    skillid = 8,
    skillicon = 145,
    skilllevel = 21,
    skillname = "耐力强化",
    skilldes = "体质+224",
    skillresearch = 22000,
    skilllearn = [{1,220000},{4,2200}],
    guildlevel = 3,
    skillproperty = [{4,224,0}]
    };
getRow(547)->
    #guildskillCfg {
    id = 547,
    skillid = 8,
    skillicon = 145,
    skilllevel = 22,
    skillname = "耐力强化",
    skilldes = "体质+241",
    skillresearch = 24000,
    skilllearn = [{1,240000},{4,2400}],
    guildlevel = 3,
    skillproperty = [{4,241,0}]
    };
getRow(548)->
    #guildskillCfg {
    id = 548,
    skillid = 8,
    skillicon = 145,
    skilllevel = 23,
    skillname = "耐力强化",
    skilldes = "体质+261",
    skillresearch = 26000,
    skilllearn = [{1,260000},{4,2600}],
    guildlevel = 3,
    skillproperty = [{4,261,0}]
    };
getRow(549)->
    #guildskillCfg {
    id = 549,
    skillid = 8,
    skillicon = 145,
    skilllevel = 24,
    skillname = "耐力强化",
    skilldes = "体质+281",
    skillresearch = 28000,
    skilllearn = [{1,280000},{4,2800}],
    guildlevel = 3,
    skillproperty = [{4,281,0}]
    };
getRow(550)->
    #guildskillCfg {
    id = 550,
    skillid = 8,
    skillicon = 145,
    skilllevel = 25,
    skillname = "耐力强化",
    skilldes = "体质+304",
    skillresearch = 30000,
    skilllearn = [{1,300000},{4,3000}],
    guildlevel = 3,
    skillproperty = [{4,304,0}]
    };
getRow(551)->
    #guildskillCfg {
    id = 551,
    skillid = 8,
    skillicon = 145,
    skilllevel = 26,
    skillname = "耐力强化",
    skilldes = "体质+328",
    skillresearch = 32000,
    skilllearn = [{1,320000},{4,3200}],
    guildlevel = 3,
    skillproperty = [{4,328,0}]
    };
getRow(552)->
    #guildskillCfg {
    id = 552,
    skillid = 8,
    skillicon = 145,
    skilllevel = 27,
    skillname = "耐力强化",
    skilldes = "体质+354",
    skillresearch = 34000,
    skilllearn = [{1,340000},{4,3400}],
    guildlevel = 3,
    skillproperty = [{4,354,0}]
    };
getRow(553)->
    #guildskillCfg {
    id = 553,
    skillid = 8,
    skillicon = 145,
    skilllevel = 28,
    skillname = "耐力强化",
    skilldes = "体质+382",
    skillresearch = 36000,
    skilllearn = [{1,360000},{4,3600}],
    guildlevel = 3,
    skillproperty = [{4,382,0}]
    };
getRow(554)->
    #guildskillCfg {
    id = 554,
    skillid = 8,
    skillicon = 145,
    skilllevel = 29,
    skillname = "耐力强化",
    skilldes = "体质+412",
    skillresearch = 38000,
    skilllearn = [{1,380000},{4,3800}],
    guildlevel = 3,
    skillproperty = [{4,412,0}]
    };
getRow(555)->
    #guildskillCfg {
    id = 555,
    skillid = 8,
    skillicon = 145,
    skilllevel = 30,
    skillname = "耐力强化",
    skilldes = "体质+445",
    skillresearch = 40000,
    skilllearn = [{1,400000},{4,4000}],
    guildlevel = 3,
    skillproperty = [{4,445,0}]
    };
getRow(556)->
    #guildskillCfg {
    id = 556,
    skillid = 8,
    skillicon = 145,
    skilllevel = 31,
    skillname = "耐力强化",
    skilldes = "体质+480",
    skillresearch = 42000,
    skilllearn = [{1,420000},{4,4200}],
    guildlevel = 4,
    skillproperty = [{4,480,0}]
    };
getRow(557)->
    #guildskillCfg {
    id = 557,
    skillid = 8,
    skillicon = 145,
    skilllevel = 32,
    skillname = "耐力强化",
    skilldes = "体质+518",
    skillresearch = 44000,
    skilllearn = [{1,440000},{4,4400}],
    guildlevel = 4,
    skillproperty = [{4,518,0}]
    };
getRow(558)->
    #guildskillCfg {
    id = 558,
    skillid = 8,
    skillicon = 145,
    skilllevel = 33,
    skillname = "耐力强化",
    skilldes = "体质+559",
    skillresearch = 46000,
    skilllearn = [{1,460000},{4,4600}],
    guildlevel = 4,
    skillproperty = [{4,559,0}]
    };
getRow(559)->
    #guildskillCfg {
    id = 559,
    skillid = 8,
    skillicon = 145,
    skilllevel = 34,
    skillname = "耐力强化",
    skilldes = "体质+604",
    skillresearch = 48000,
    skilllearn = [{1,480000},{4,4800}],
    guildlevel = 4,
    skillproperty = [{4,604,0}]
    };
getRow(560)->
    #guildskillCfg {
    id = 560,
    skillid = 8,
    skillicon = 145,
    skilllevel = 35,
    skillname = "耐力强化",
    skilldes = "体质+652",
    skillresearch = 50000,
    skilllearn = [{1,500000},{4,5000}],
    guildlevel = 4,
    skillproperty = [{4,652,0}]
    };
getRow(561)->
    #guildskillCfg {
    id = 561,
    skillid = 8,
    skillicon = 145,
    skilllevel = 36,
    skillname = "耐力强化",
    skilldes = "体质+703",
    skillresearch = 52000,
    skilllearn = [{1,520000},{4,5200}],
    guildlevel = 4,
    skillproperty = [{4,703,0}]
    };
getRow(562)->
    #guildskillCfg {
    id = 562,
    skillid = 8,
    skillicon = 145,
    skilllevel = 37,
    skillname = "耐力强化",
    skilldes = "体质+759",
    skillresearch = 54000,
    skilllearn = [{1,540000},{4,5400}],
    guildlevel = 4,
    skillproperty = [{4,759,0}]
    };
getRow(563)->
    #guildskillCfg {
    id = 563,
    skillid = 8,
    skillicon = 145,
    skilllevel = 38,
    skillname = "耐力强化",
    skilldes = "体质+819",
    skillresearch = 56000,
    skilllearn = [{1,560000},{4,5600}],
    guildlevel = 4,
    skillproperty = [{4,819,0}]
    };
getRow(564)->
    #guildskillCfg {
    id = 564,
    skillid = 8,
    skillicon = 145,
    skilllevel = 39,
    skillname = "耐力强化",
    skilldes = "体质+884",
    skillresearch = 58000,
    skilllearn = [{1,580000},{4,5800}],
    guildlevel = 4,
    skillproperty = [{4,884,0}]
    };
getRow(565)->
    #guildskillCfg {
    id = 565,
    skillid = 8,
    skillicon = 145,
    skilllevel = 40,
    skillname = "耐力强化",
    skilldes = "体质+954",
    skillresearch = 60000,
    skilllearn = [{1,600000},{4,6000}],
    guildlevel = 4,
    skillproperty = [{4,954,0}]
    };
getRow(566)->
    #guildskillCfg {
    id = 566,
    skillid = 8,
    skillicon = 145,
    skilllevel = 41,
    skillname = "耐力强化",
    skilldes = "体质+1030",
    skillresearch = 65000,
    skilllearn = [{1,650000},{4,6500}],
    guildlevel = 5,
    skillproperty = [{4,1030,0}]
    };
getRow(567)->
    #guildskillCfg {
    id = 567,
    skillid = 8,
    skillicon = 145,
    skilllevel = 42,
    skillname = "耐力强化",
    skilldes = "体质+1112",
    skillresearch = 70000,
    skilllearn = [{1,700000},{4,7000}],
    guildlevel = 5,
    skillproperty = [{4,1112,0}]
    };
getRow(568)->
    #guildskillCfg {
    id = 568,
    skillid = 8,
    skillicon = 145,
    skilllevel = 43,
    skillname = "耐力强化",
    skilldes = "体质+1200",
    skillresearch = 75000,
    skilllearn = [{1,750000},{4,7500}],
    guildlevel = 5,
    skillproperty = [{4,1200,0}]
    };
getRow(569)->
    #guildskillCfg {
    id = 569,
    skillid = 8,
    skillicon = 145,
    skilllevel = 44,
    skillname = "耐力强化",
    skilldes = "体质+1295",
    skillresearch = 80000,
    skilllearn = [{1,800000},{4,8000}],
    guildlevel = 5,
    skillproperty = [{4,1295,0}]
    };
getRow(570)->
    #guildskillCfg {
    id = 570,
    skillid = 8,
    skillicon = 145,
    skilllevel = 45,
    skillname = "耐力强化",
    skilldes = "体质+1398",
    skillresearch = 85000,
    skilllearn = [{1,850000},{4,8500}],
    guildlevel = 5,
    skillproperty = [{4,1398,0}]
    };
getRow(571)->
    #guildskillCfg {
    id = 571,
    skillid = 8,
    skillicon = 145,
    skilllevel = 46,
    skillname = "耐力强化",
    skilldes = "体质+1509",
    skillresearch = 90000,
    skilllearn = [{1,900000},{4,9000}],
    guildlevel = 5,
    skillproperty = [{4,1509,0}]
    };
getRow(572)->
    #guildskillCfg {
    id = 572,
    skillid = 8,
    skillicon = 145,
    skilllevel = 47,
    skillname = "耐力强化",
    skilldes = "体质+1629",
    skillresearch = 95000,
    skilllearn = [{1,950000},{4,9500}],
    guildlevel = 5,
    skillproperty = [{4,1629,0}]
    };
getRow(573)->
    #guildskillCfg {
    id = 573,
    skillid = 8,
    skillicon = 145,
    skilllevel = 48,
    skillname = "耐力强化",
    skilldes = "体质+1758",
    skillresearch = 100000,
    skilllearn = [{1,1000000},{4,10000}],
    guildlevel = 5,
    skillproperty = [{4,1758,0}]
    };
getRow(574)->
    #guildskillCfg {
    id = 574,
    skillid = 8,
    skillicon = 145,
    skilllevel = 49,
    skillname = "耐力强化",
    skilldes = "体质+1898",
    skillresearch = 105000,
    skilllearn = [{1,1050000},{4,10500}],
    guildlevel = 5,
    skillproperty = [{4,1898,0}]
    };
getRow(575)->
    #guildskillCfg {
    id = 575,
    skillid = 8,
    skillicon = 145,
    skilllevel = 50,
    skillname = "耐力强化",
    skilldes = "体质+2048",
    skillresearch = 110000,
    skilllearn = [{1,1100000},{4,11000}],
    guildlevel = 5,
    skillproperty = [{4,2048,0}]
    };
getRow(576)->
    #guildskillCfg {
    id = 576,
    skillid = 8,
    skillicon = 145,
    skilllevel = 51,
    skillname = "耐力强化",
    skilldes = "体质+2211",
    skillresearch = 115000,
    skilllearn = [{1,1150000},{4,11500}],
    guildlevel = 6,
    skillproperty = [{4,2211,0}]
    };
getRow(577)->
    #guildskillCfg {
    id = 577,
    skillid = 8,
    skillicon = 145,
    skilllevel = 52,
    skillname = "耐力强化",
    skilldes = "体质+2386",
    skillresearch = 120000,
    skilllearn = [{1,1200000},{4,12000}],
    guildlevel = 6,
    skillproperty = [{4,2386,0}]
    };
getRow(578)->
    #guildskillCfg {
    id = 578,
    skillid = 8,
    skillicon = 145,
    skilllevel = 53,
    skillname = "耐力强化",
    skilldes = "体质+2576",
    skillresearch = 125000,
    skilllearn = [{1,1250000},{4,12500}],
    guildlevel = 6,
    skillproperty = [{4,2576,0}]
    };
getRow(579)->
    #guildskillCfg {
    id = 579,
    skillid = 8,
    skillicon = 145,
    skilllevel = 54,
    skillname = "耐力强化",
    skilldes = "体质+2780",
    skillresearch = 130000,
    skilllearn = [{1,1300000},{4,13000}],
    guildlevel = 6,
    skillproperty = [{4,2780,0}]
    };
getRow(580)->
    #guildskillCfg {
    id = 580,
    skillid = 8,
    skillicon = 145,
    skilllevel = 55,
    skillname = "耐力强化",
    skilldes = "体质+3000",
    skillresearch = 135000,
    skilllearn = [{1,1350000},{4,13500}],
    guildlevel = 6,
    skillproperty = [{4,3000,0}]
    };
getRow(581)->
    #guildskillCfg {
    id = 581,
    skillid = 8,
    skillicon = 145,
    skilllevel = 56,
    skillname = "耐力强化",
    skilldes = "体质+3239",
    skillresearch = 140000,
    skilllearn = [{1,1400000},{4,14000}],
    guildlevel = 6,
    skillproperty = [{4,3239,0}]
    };
getRow(582)->
    #guildskillCfg {
    id = 582,
    skillid = 8,
    skillicon = 145,
    skilllevel = 57,
    skillname = "耐力强化",
    skilldes = "体质+3496",
    skillresearch = 145000,
    skilllearn = [{1,1450000},{4,14500}],
    guildlevel = 6,
    skillproperty = [{4,3496,0}]
    };
getRow(583)->
    #guildskillCfg {
    id = 583,
    skillid = 8,
    skillicon = 145,
    skilllevel = 58,
    skillname = "耐力强化",
    skilldes = "体质+3773",
    skillresearch = 150000,
    skilllearn = [{1,1500000},{4,15000}],
    guildlevel = 6,
    skillproperty = [{4,3773,0}]
    };
getRow(584)->
    #guildskillCfg {
    id = 584,
    skillid = 8,
    skillicon = 145,
    skilllevel = 59,
    skillname = "耐力强化",
    skilldes = "体质+4072",
    skillresearch = 155000,
    skilllearn = [{1,1550000},{4,15500}],
    guildlevel = 6,
    skillproperty = [{4,4072,0}]
    };
getRow(585)->
    #guildskillCfg {
    id = 585,
    skillid = 8,
    skillicon = 145,
    skilllevel = 60,
    skillname = "耐力强化",
    skilldes = "体质+4396",
    skillresearch = 160000,
    skilllearn = [{1,1600000},{4,16000}],
    guildlevel = 6,
    skillproperty = [{4,4396,0}]
    };
getRow(586)->
    #guildskillCfg {
    id = 586,
    skillid = 8,
    skillicon = 145,
    skilllevel = 61,
    skillname = "耐力强化",
    skilldes = "体质+4696",
    skillresearch = 170000,
    skilllearn = [{1,1700000},{4,17000}],
    guildlevel = 7,
    skillproperty = [{4,4696,0}]
    };
getRow(587)->
    #guildskillCfg {
    id = 587,
    skillid = 8,
    skillicon = 145,
    skilllevel = 62,
    skillname = "耐力强化",
    skilldes = "体质+4996",
    skillresearch = 180000,
    skilllearn = [{1,1800000},{4,18000}],
    guildlevel = 7,
    skillproperty = [{4,4996,0}]
    };
getRow(588)->
    #guildskillCfg {
    id = 588,
    skillid = 8,
    skillicon = 145,
    skilllevel = 63,
    skillname = "耐力强化",
    skilldes = "体质+5296",
    skillresearch = 190000,
    skilllearn = [{1,1900000},{4,19000}],
    guildlevel = 7,
    skillproperty = [{4,5296,0}]
    };
getRow(589)->
    #guildskillCfg {
    id = 589,
    skillid = 8,
    skillicon = 145,
    skilllevel = 64,
    skillname = "耐力强化",
    skilldes = "体质+5596",
    skillresearch = 200000,
    skilllearn = [{1,2000000},{4,20000}],
    guildlevel = 7,
    skillproperty = [{4,5596,0}]
    };
getRow(590)->
    #guildskillCfg {
    id = 590,
    skillid = 8,
    skillicon = 145,
    skilllevel = 65,
    skillname = "耐力强化",
    skilldes = "体质+5896",
    skillresearch = 210000,
    skilllearn = [{1,2100000},{4,21000}],
    guildlevel = 7,
    skillproperty = [{4,5896,0}]
    };
getRow(591)->
    #guildskillCfg {
    id = 591,
    skillid = 8,
    skillicon = 145,
    skilllevel = 66,
    skillname = "耐力强化",
    skilldes = "体质+6196",
    skillresearch = 220000,
    skilllearn = [{1,2200000},{4,22000}],
    guildlevel = 7,
    skillproperty = [{4,6196,0}]
    };
getRow(592)->
    #guildskillCfg {
    id = 592,
    skillid = 8,
    skillicon = 145,
    skilllevel = 67,
    skillname = "耐力强化",
    skilldes = "体质+6496",
    skillresearch = 230000,
    skilllearn = [{1,2300000},{4,23000}],
    guildlevel = 7,
    skillproperty = [{4,6496,0}]
    };
getRow(593)->
    #guildskillCfg {
    id = 593,
    skillid = 8,
    skillicon = 145,
    skilllevel = 68,
    skillname = "耐力强化",
    skilldes = "体质+6796",
    skillresearch = 240000,
    skilllearn = [{1,2400000},{4,24000}],
    guildlevel = 7,
    skillproperty = [{4,6796,0}]
    };
getRow(594)->
    #guildskillCfg {
    id = 594,
    skillid = 8,
    skillicon = 145,
    skilllevel = 69,
    skillname = "耐力强化",
    skilldes = "体质+7096",
    skillresearch = 250000,
    skilllearn = [{1,2500000},{4,25000}],
    guildlevel = 7,
    skillproperty = [{4,7096,0}]
    };
getRow(595)->
    #guildskillCfg {
    id = 595,
    skillid = 8,
    skillicon = 145,
    skilllevel = 70,
    skillname = "耐力强化",
    skilldes = "体质+7396",
    skillresearch = 260000,
    skilllearn = [{1,2600000},{4,26000}],
    guildlevel = 7,
    skillproperty = [{4,7396,0}]
    };
getRow(596)->
    #guildskillCfg {
    id = 596,
    skillid = 8,
    skillicon = 145,
    skilllevel = 71,
    skillname = "耐力强化",
    skilldes = "体质+7396",
    skillresearch = 270000,
    skilllearn = [{1,2700000},{4,27000}],
    guildlevel = 8,
    skillproperty = [{4,7396,0}]
    };
getRow(597)->
    #guildskillCfg {
    id = 597,
    skillid = 8,
    skillicon = 145,
    skilllevel = 72,
    skillname = "耐力强化",
    skilldes = "体质+7696",
    skillresearch = 280000,
    skilllearn = [{1,2800000},{4,28000}],
    guildlevel = 8,
    skillproperty = [{4,7696,0}]
    };
getRow(598)->
    #guildskillCfg {
    id = 598,
    skillid = 8,
    skillicon = 145,
    skilllevel = 73,
    skillname = "耐力强化",
    skilldes = "体质+7996",
    skillresearch = 290000,
    skilllearn = [{1,2900000},{4,29000}],
    guildlevel = 8,
    skillproperty = [{4,7996,0}]
    };
getRow(599)->
    #guildskillCfg {
    id = 599,
    skillid = 8,
    skillicon = 145,
    skilllevel = 74,
    skillname = "耐力强化",
    skilldes = "体质+8296",
    skillresearch = 300000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{4,8296,0}]
    };
getRow(600)->
    #guildskillCfg {
    id = 600,
    skillid = 8,
    skillicon = 145,
    skilllevel = 75,
    skillname = "耐力强化",
    skilldes = "体质+8596",
    skillresearch = 310000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{4,8596,0}]
    };
getRow(601)->
    #guildskillCfg {
    id = 601,
    skillid = 9,
    skillicon = 123,
    skilllevel = 1,
    skillname = "禁武者祝福",
    skilldes = "物理防御+59",
    skillresearch = 1000,
    skilllearn = [{1,10000},{4,100}],
    guildlevel = 1,
    skillproperty = [{26,59,0}]
    };
getRow(602)->
    #guildskillCfg {
    id = 602,
    skillid = 9,
    skillicon = 123,
    skilllevel = 2,
    skillname = "禁武者祝福",
    skilldes = "物理防御+69",
    skillresearch = 2000,
    skilllearn = [{1,20000},{4,200}],
    guildlevel = 1,
    skillproperty = [{26,69,0}]
    };
getRow(603)->
    #guildskillCfg {
    id = 603,
    skillid = 9,
    skillicon = 123,
    skilllevel = 3,
    skillname = "禁武者祝福",
    skilldes = "物理防御+74",
    skillresearch = 3000,
    skilllearn = [{1,30000},{4,300}],
    guildlevel = 1,
    skillproperty = [{26,74,0}]
    };
getRow(604)->
    #guildskillCfg {
    id = 604,
    skillid = 9,
    skillicon = 123,
    skilllevel = 4,
    skillname = "禁武者祝福",
    skilldes = "物理防御+80",
    skillresearch = 4000,
    skilllearn = [{1,40000},{4,400}],
    guildlevel = 1,
    skillproperty = [{26,80,0}]
    };
getRow(605)->
    #guildskillCfg {
    id = 605,
    skillid = 9,
    skillicon = 123,
    skilllevel = 5,
    skillname = "禁武者祝福",
    skilldes = "物理防御+86",
    skillresearch = 5000,
    skilllearn = [{1,50000},{4,500}],
    guildlevel = 1,
    skillproperty = [{26,86,0}]
    };
getRow(606)->
    #guildskillCfg {
    id = 606,
    skillid = 9,
    skillicon = 123,
    skilllevel = 6,
    skillname = "禁武者祝福",
    skilldes = "物理防御+93",
    skillresearch = 6000,
    skilllearn = [{1,60000},{4,600}],
    guildlevel = 1,
    skillproperty = [{26,93,0}]
    };
getRow(607)->
    #guildskillCfg {
    id = 607,
    skillid = 9,
    skillicon = 123,
    skilllevel = 7,
    skillname = "禁武者祝福",
    skilldes = "物理防御+101",
    skillresearch = 7000,
    skilllearn = [{1,70000},{4,700}],
    guildlevel = 1,
    skillproperty = [{26,101,0}]
    };
getRow(608)->
    #guildskillCfg {
    id = 608,
    skillid = 9,
    skillicon = 123,
    skilllevel = 8,
    skillname = "禁武者祝福",
    skilldes = "物理防御+109",
    skillresearch = 8000,
    skilllearn = [{1,80000},{4,800}],
    guildlevel = 1,
    skillproperty = [{26,109,0}]
    };
getRow(609)->
    #guildskillCfg {
    id = 609,
    skillid = 9,
    skillicon = 123,
    skilllevel = 9,
    skillname = "禁武者祝福",
    skilldes = "物理防御+117",
    skillresearch = 9000,
    skilllearn = [{1,90000},{4,900}],
    guildlevel = 1,
    skillproperty = [{26,117,0}]
    };
getRow(610)->
    #guildskillCfg {
    id = 610,
    skillid = 9,
    skillicon = 123,
    skilllevel = 10,
    skillname = "禁武者祝福",
    skilldes = "物理防御+127",
    skillresearch = 10000,
    skilllearn = [{1,100000},{4,1000}],
    guildlevel = 1,
    skillproperty = [{26,127,0}]
    };
getRow(611)->
    #guildskillCfg {
    id = 611,
    skillid = 9,
    skillicon = 123,
    skilllevel = 11,
    skillname = "禁武者祝福",
    skilldes = "物理防御+137",
    skillresearch = 11000,
    skilllearn = [{1,110000},{4,1100}],
    guildlevel = 2,
    skillproperty = [{26,137,0}]
    };
getRow(612)->
    #guildskillCfg {
    id = 612,
    skillid = 9,
    skillicon = 123,
    skilllevel = 12,
    skillname = "禁武者祝福",
    skilldes = "物理防御+147",
    skillresearch = 12000,
    skilllearn = [{1,120000},{4,1200}],
    guildlevel = 2,
    skillproperty = [{26,147,0}]
    };
getRow(613)->
    #guildskillCfg {
    id = 613,
    skillid = 9,
    skillicon = 123,
    skilllevel = 13,
    skillname = "禁武者祝福",
    skilldes = "物理防御+159",
    skillresearch = 13000,
    skilllearn = [{1,130000},{4,1300}],
    guildlevel = 2,
    skillproperty = [{26,159,0}]
    };
getRow(614)->
    #guildskillCfg {
    id = 614,
    skillid = 9,
    skillicon = 123,
    skilllevel = 14,
    skillname = "禁武者祝福",
    skilldes = "物理防御+172",
    skillresearch = 14000,
    skilllearn = [{1,140000},{4,1400}],
    guildlevel = 2,
    skillproperty = [{26,172,0}]
    };
getRow(615)->
    #guildskillCfg {
    id = 615,
    skillid = 9,
    skillicon = 123,
    skilllevel = 15,
    skillname = "禁武者祝福",
    skilldes = "物理防御+185",
    skillresearch = 15000,
    skilllearn = [{1,150000},{4,1500}],
    guildlevel = 2,
    skillproperty = [{26,185,0}]
    };
getRow(616)->
    #guildskillCfg {
    id = 616,
    skillid = 9,
    skillicon = 123,
    skilllevel = 16,
    skillname = "禁武者祝福",
    skilldes = "物理防御+200",
    skillresearch = 16000,
    skilllearn = [{1,160000},{4,1600}],
    guildlevel = 2,
    skillproperty = [{26,200,0}]
    };
getRow(617)->
    #guildskillCfg {
    id = 617,
    skillid = 9,
    skillicon = 123,
    skilllevel = 17,
    skillname = "禁武者祝福",
    skilldes = "物理防御+216",
    skillresearch = 17000,
    skilllearn = [{1,170000},{4,1700}],
    guildlevel = 2,
    skillproperty = [{26,216,0}]
    };
getRow(618)->
    #guildskillCfg {
    id = 618,
    skillid = 9,
    skillicon = 123,
    skilllevel = 18,
    skillname = "禁武者祝福",
    skilldes = "物理防御+233",
    skillresearch = 18000,
    skilllearn = [{1,180000},{4,1800}],
    guildlevel = 2,
    skillproperty = [{26,233,0}]
    };
getRow(619)->
    #guildskillCfg {
    id = 619,
    skillid = 9,
    skillicon = 123,
    skilllevel = 19,
    skillname = "禁武者祝福",
    skilldes = "物理防御+252",
    skillresearch = 19000,
    skilllearn = [{1,190000},{4,1900}],
    guildlevel = 2,
    skillproperty = [{26,252,0}]
    };
getRow(620)->
    #guildskillCfg {
    id = 620,
    skillid = 9,
    skillicon = 123,
    skilllevel = 20,
    skillname = "禁武者祝福",
    skilldes = "物理防御+272",
    skillresearch = 20000,
    skilllearn = [{1,200000},{4,2000}],
    guildlevel = 2,
    skillproperty = [{26,272,0}]
    };
getRow(621)->
    #guildskillCfg {
    id = 621,
    skillid = 9,
    skillicon = 123,
    skilllevel = 21,
    skillname = "禁武者祝福",
    skilldes = "物理防御+293",
    skillresearch = 22000,
    skilllearn = [{1,220000},{4,2200}],
    guildlevel = 3,
    skillproperty = [{26,293,0}]
    };
getRow(622)->
    #guildskillCfg {
    id = 622,
    skillid = 9,
    skillicon = 123,
    skilllevel = 22,
    skillname = "禁武者祝福",
    skilldes = "物理防御+316",
    skillresearch = 24000,
    skilllearn = [{1,240000},{4,2400}],
    guildlevel = 3,
    skillproperty = [{26,316,0}]
    };
getRow(623)->
    #guildskillCfg {
    id = 623,
    skillid = 9,
    skillicon = 123,
    skilllevel = 23,
    skillname = "禁武者祝福",
    skilldes = "物理防御+341",
    skillresearch = 26000,
    skilllearn = [{1,260000},{4,2600}],
    guildlevel = 3,
    skillproperty = [{26,341,0}]
    };
getRow(624)->
    #guildskillCfg {
    id = 624,
    skillid = 9,
    skillicon = 123,
    skilllevel = 24,
    skillname = "禁武者祝福",
    skilldes = "物理防御+369",
    skillresearch = 28000,
    skilllearn = [{1,280000},{4,2800}],
    guildlevel = 3,
    skillproperty = [{26,369,0}]
    };
getRow(625)->
    #guildskillCfg {
    id = 625,
    skillid = 9,
    skillicon = 123,
    skilllevel = 25,
    skillname = "禁武者祝福",
    skilldes = "物理防御+398",
    skillresearch = 30000,
    skilllearn = [{1,300000},{4,3000}],
    guildlevel = 3,
    skillproperty = [{26,398,0}]
    };
getRow(626)->
    #guildskillCfg {
    id = 626,
    skillid = 9,
    skillicon = 123,
    skilllevel = 26,
    skillname = "禁武者祝福",
    skilldes = "物理防御+429",
    skillresearch = 32000,
    skilllearn = [{1,320000},{4,3200}],
    guildlevel = 3,
    skillproperty = [{26,429,0}]
    };
getRow(627)->
    #guildskillCfg {
    id = 627,
    skillid = 9,
    skillicon = 123,
    skilllevel = 27,
    skillname = "禁武者祝福",
    skilldes = "物理防御+463",
    skillresearch = 34000,
    skilllearn = [{1,340000},{4,3400}],
    guildlevel = 3,
    skillproperty = [{26,463,0}]
    };
getRow(628)->
    #guildskillCfg {
    id = 628,
    skillid = 9,
    skillicon = 123,
    skilllevel = 28,
    skillname = "禁武者祝福",
    skilldes = "物理防御+500",
    skillresearch = 36000,
    skilllearn = [{1,360000},{4,3600}],
    guildlevel = 3,
    skillproperty = [{26,500,0}]
    };
getRow(629)->
    #guildskillCfg {
    id = 629,
    skillid = 9,
    skillicon = 123,
    skilllevel = 29,
    skillname = "禁武者祝福",
    skilldes = "物理防御+540",
    skillresearch = 38000,
    skilllearn = [{1,380000},{4,3800}],
    guildlevel = 3,
    skillproperty = [{26,540,0}]
    };
getRow(630)->
    #guildskillCfg {
    id = 630,
    skillid = 9,
    skillicon = 123,
    skilllevel = 30,
    skillname = "禁武者祝福",
    skilldes = "物理防御+583",
    skillresearch = 40000,
    skilllearn = [{1,400000},{4,4000}],
    guildlevel = 3,
    skillproperty = [{26,583,0}]
    };
getRow(631)->
    #guildskillCfg {
    id = 631,
    skillid = 9,
    skillicon = 123,
    skilllevel = 31,
    skillname = "禁武者祝福",
    skilldes = "物理防御+629",
    skillresearch = 42000,
    skilllearn = [{1,420000},{4,4200}],
    guildlevel = 4,
    skillproperty = [{26,629,0}]
    };
getRow(632)->
    #guildskillCfg {
    id = 632,
    skillid = 9,
    skillicon = 123,
    skilllevel = 32,
    skillname = "禁武者祝福",
    skilldes = "物理防御+679",
    skillresearch = 44000,
    skilllearn = [{1,440000},{4,4400}],
    guildlevel = 4,
    skillproperty = [{26,679,0}]
    };
getRow(633)->
    #guildskillCfg {
    id = 633,
    skillid = 9,
    skillicon = 123,
    skilllevel = 33,
    skillname = "禁武者祝福",
    skilldes = "物理防御+733",
    skillresearch = 46000,
    skilllearn = [{1,460000},{4,4600}],
    guildlevel = 4,
    skillproperty = [{26,733,0}]
    };
getRow(634)->
    #guildskillCfg {
    id = 634,
    skillid = 9,
    skillicon = 123,
    skilllevel = 34,
    skillname = "禁武者祝福",
    skilldes = "物理防御+791",
    skillresearch = 48000,
    skilllearn = [{1,480000},{4,4800}],
    guildlevel = 4,
    skillproperty = [{26,791,0}]
    };
getRow(635)->
    #guildskillCfg {
    id = 635,
    skillid = 9,
    skillicon = 123,
    skilllevel = 35,
    skillname = "禁武者祝福",
    skilldes = "物理防御+854",
    skillresearch = 50000,
    skilllearn = [{1,500000},{4,5000}],
    guildlevel = 4,
    skillproperty = [{26,854,0}]
    };
getRow(636)->
    #guildskillCfg {
    id = 636,
    skillid = 9,
    skillicon = 123,
    skilllevel = 36,
    skillname = "禁武者祝福",
    skilldes = "物理防御+922",
    skillresearch = 52000,
    skilllearn = [{1,520000},{4,5200}],
    guildlevel = 4,
    skillproperty = [{26,922,0}]
    };
getRow(637)->
    #guildskillCfg {
    id = 637,
    skillid = 9,
    skillicon = 123,
    skilllevel = 37,
    skillname = "禁武者祝福",
    skilldes = "物理防御+995",
    skillresearch = 54000,
    skilllearn = [{1,540000},{4,5400}],
    guildlevel = 4,
    skillproperty = [{26,995,0}]
    };
getRow(638)->
    #guildskillCfg {
    id = 638,
    skillid = 9,
    skillicon = 123,
    skilllevel = 38,
    skillname = "禁武者祝福",
    skilldes = "物理防御+1074",
    skillresearch = 56000,
    skilllearn = [{1,560000},{4,5600}],
    guildlevel = 4,
    skillproperty = [{26,1074,0}]
    };
getRow(639)->
    #guildskillCfg {
    id = 639,
    skillid = 9,
    skillicon = 123,
    skilllevel = 39,
    skillname = "禁武者祝福",
    skilldes = "物理防御+1159",
    skillresearch = 58000,
    skilllearn = [{1,580000},{4,5800}],
    guildlevel = 4,
    skillproperty = [{26,1159,0}]
    };
getRow(640)->
    #guildskillCfg {
    id = 640,
    skillid = 9,
    skillicon = 123,
    skilllevel = 40,
    skillname = "禁武者祝福",
    skilldes = "物理防御+1251",
    skillresearch = 60000,
    skilllearn = [{1,600000},{4,6000}],
    guildlevel = 4,
    skillproperty = [{26,1251,0}]
    };
getRow(641)->
    #guildskillCfg {
    id = 641,
    skillid = 9,
    skillicon = 123,
    skilllevel = 41,
    skillname = "禁武者祝福",
    skilldes = "物理防御+1350",
    skillresearch = 65000,
    skilllearn = [{1,650000},{4,6500}],
    guildlevel = 5,
    skillproperty = [{26,1350,0}]
    };
getRow(642)->
    #guildskillCfg {
    id = 642,
    skillid = 9,
    skillicon = 123,
    skilllevel = 42,
    skillname = "禁武者祝福",
    skilldes = "物理防御+1457",
    skillresearch = 70000,
    skilllearn = [{1,700000},{4,7000}],
    guildlevel = 5,
    skillproperty = [{26,1457,0}]
    };
getRow(643)->
    #guildskillCfg {
    id = 643,
    skillid = 9,
    skillicon = 123,
    skilllevel = 43,
    skillname = "禁武者祝福",
    skilldes = "物理防御+1573",
    skillresearch = 75000,
    skilllearn = [{1,750000},{4,7500}],
    guildlevel = 5,
    skillproperty = [{26,1573,0}]
    };
getRow(644)->
    #guildskillCfg {
    id = 644,
    skillid = 9,
    skillicon = 123,
    skilllevel = 44,
    skillname = "禁武者祝福",
    skilldes = "物理防御+1698",
    skillresearch = 80000,
    skilllearn = [{1,800000},{4,8000}],
    guildlevel = 5,
    skillproperty = [{26,1698,0}]
    };
getRow(645)->
    #guildskillCfg {
    id = 645,
    skillid = 9,
    skillicon = 123,
    skilllevel = 45,
    skillname = "禁武者祝福",
    skilldes = "物理防御+1832",
    skillresearch = 85000,
    skilllearn = [{1,850000},{4,8500}],
    guildlevel = 5,
    skillproperty = [{26,1832,0}]
    };
getRow(646)->
    #guildskillCfg {
    id = 646,
    skillid = 9,
    skillicon = 123,
    skilllevel = 46,
    skillname = "禁武者祝福",
    skilldes = "物理防御+1978",
    skillresearch = 90000,
    skilllearn = [{1,900000},{4,9000}],
    guildlevel = 5,
    skillproperty = [{26,1978,0}]
    };
getRow(647)->
    #guildskillCfg {
    id = 647,
    skillid = 9,
    skillicon = 123,
    skilllevel = 47,
    skillname = "禁武者祝福",
    skilldes = "物理防御+2135",
    skillresearch = 95000,
    skilllearn = [{1,950000},{4,9500}],
    guildlevel = 5,
    skillproperty = [{26,2135,0}]
    };
getRow(648)->
    #guildskillCfg {
    id = 648,
    skillid = 9,
    skillicon = 123,
    skilllevel = 48,
    skillname = "禁武者祝福",
    skilldes = "物理防御+2304",
    skillresearch = 100000,
    skilllearn = [{1,1000000},{4,10000}],
    guildlevel = 5,
    skillproperty = [{26,2304,0}]
    };
getRow(649)->
    #guildskillCfg {
    id = 649,
    skillid = 9,
    skillicon = 123,
    skilllevel = 49,
    skillname = "禁武者祝福",
    skilldes = "物理防御+2487",
    skillresearch = 105000,
    skilllearn = [{1,1050000},{4,10500}],
    guildlevel = 5,
    skillproperty = [{26,2487,0}]
    };
getRow(650)->
    #guildskillCfg {
    id = 650,
    skillid = 9,
    skillicon = 123,
    skilllevel = 50,
    skillname = "禁武者祝福",
    skilldes = "物理防御+2684",
    skillresearch = 110000,
    skilllearn = [{1,1100000},{4,11000}],
    guildlevel = 5,
    skillproperty = [{26,2684,0}]
    };
getRow(651)->
    #guildskillCfg {
    id = 651,
    skillid = 9,
    skillicon = 123,
    skilllevel = 51,
    skillname = "禁武者祝福",
    skilldes = "物理防御+2897",
    skillresearch = 115000,
    skilllearn = [{1,1150000},{4,11500}],
    guildlevel = 6,
    skillproperty = [{26,2897,0}]
    };
getRow(652)->
    #guildskillCfg {
    id = 652,
    skillid = 9,
    skillicon = 123,
    skilllevel = 52,
    skillname = "禁武者祝福",
    skilldes = "物理防御+3127",
    skillresearch = 120000,
    skilllearn = [{1,1200000},{4,12000}],
    guildlevel = 6,
    skillproperty = [{26,3127,0}]
    };
getRow(653)->
    #guildskillCfg {
    id = 653,
    skillid = 9,
    skillicon = 123,
    skilllevel = 53,
    skillname = "禁武者祝福",
    skilldes = "物理防御+3375",
    skillresearch = 125000,
    skilllearn = [{1,1250000},{4,12500}],
    guildlevel = 6,
    skillproperty = [{26,3375,0}]
    };
getRow(654)->
    #guildskillCfg {
    id = 654,
    skillid = 9,
    skillicon = 123,
    skilllevel = 54,
    skillname = "禁武者祝福",
    skilldes = "物理防御+3643",
    skillresearch = 130000,
    skilllearn = [{1,1300000},{4,13000}],
    guildlevel = 6,
    skillproperty = [{26,3643,0}]
    };
getRow(655)->
    #guildskillCfg {
    id = 655,
    skillid = 9,
    skillicon = 123,
    skilllevel = 55,
    skillname = "禁武者祝福",
    skilldes = "物理防御+3932",
    skillresearch = 135000,
    skilllearn = [{1,1350000},{4,13500}],
    guildlevel = 6,
    skillproperty = [{26,3932,0}]
    };
getRow(656)->
    #guildskillCfg {
    id = 656,
    skillid = 9,
    skillicon = 123,
    skilllevel = 56,
    skillname = "禁武者祝福",
    skilldes = "物理防御+4244",
    skillresearch = 140000,
    skilllearn = [{1,1400000},{4,14000}],
    guildlevel = 6,
    skillproperty = [{26,4244,0}]
    };
getRow(657)->
    #guildskillCfg {
    id = 657,
    skillid = 9,
    skillicon = 123,
    skilllevel = 57,
    skillname = "禁武者祝福",
    skilldes = "物理防御+4581",
    skillresearch = 145000,
    skilllearn = [{1,1450000},{4,14500}],
    guildlevel = 6,
    skillproperty = [{26,4581,0}]
    };
getRow(658)->
    #guildskillCfg {
    id = 658,
    skillid = 9,
    skillicon = 123,
    skilllevel = 58,
    skillname = "禁武者祝福",
    skilldes = "物理防御+4944",
    skillresearch = 150000,
    skilllearn = [{1,1500000},{4,15000}],
    guildlevel = 6,
    skillproperty = [{26,4944,0}]
    };
getRow(659)->
    #guildskillCfg {
    id = 659,
    skillid = 9,
    skillicon = 123,
    skilllevel = 59,
    skillname = "禁武者祝福",
    skilldes = "物理防御+5337",
    skillresearch = 155000,
    skilllearn = [{1,1550000},{4,15500}],
    guildlevel = 6,
    skillproperty = [{26,5337,0}]
    };
getRow(660)->
    #guildskillCfg {
    id = 660,
    skillid = 9,
    skillicon = 123,
    skilllevel = 60,
    skillname = "禁武者祝福",
    skilldes = "物理防御+5760",
    skillresearch = 160000,
    skilllearn = [{1,1600000},{4,16000}],
    guildlevel = 6,
    skillproperty = [{26,5760,0}]
    };
getRow(661)->
    #guildskillCfg {
    id = 661,
    skillid = 9,
    skillicon = 123,
    skilllevel = 61,
    skillname = "禁武者祝福",
    skilldes = "物理防御+6160",
    skillresearch = 170000,
    skilllearn = [{1,1700000},{4,17000}],
    guildlevel = 7,
    skillproperty = [{26,6160,0}]
    };
getRow(662)->
    #guildskillCfg {
    id = 662,
    skillid = 9,
    skillicon = 123,
    skilllevel = 62,
    skillname = "禁武者祝福",
    skilldes = "物理防御+6560",
    skillresearch = 180000,
    skilllearn = [{1,1800000},{4,18000}],
    guildlevel = 7,
    skillproperty = [{26,6560,0}]
    };
getRow(663)->
    #guildskillCfg {
    id = 663,
    skillid = 9,
    skillicon = 123,
    skilllevel = 63,
    skillname = "禁武者祝福",
    skilldes = "物理防御+6960",
    skillresearch = 190000,
    skilllearn = [{1,1900000},{4,19000}],
    guildlevel = 7,
    skillproperty = [{26,6960,0}]
    };
getRow(664)->
    #guildskillCfg {
    id = 664,
    skillid = 9,
    skillicon = 123,
    skilllevel = 64,
    skillname = "禁武者祝福",
    skilldes = "物理防御+7360",
    skillresearch = 200000,
    skilllearn = [{1,2000000},{4,20000}],
    guildlevel = 7,
    skillproperty = [{26,7360,0}]
    };
getRow(665)->
    #guildskillCfg {
    id = 665,
    skillid = 9,
    skillicon = 123,
    skilllevel = 65,
    skillname = "禁武者祝福",
    skilldes = "物理防御+7760",
    skillresearch = 210000,
    skilllearn = [{1,2100000},{4,21000}],
    guildlevel = 7,
    skillproperty = [{26,7760,0}]
    };
getRow(666)->
    #guildskillCfg {
    id = 666,
    skillid = 9,
    skillicon = 123,
    skilllevel = 66,
    skillname = "禁武者祝福",
    skilldes = "物理防御+8160",
    skillresearch = 220000,
    skilllearn = [{1,2200000},{4,22000}],
    guildlevel = 7,
    skillproperty = [{26,8160,0}]
    };
getRow(667)->
    #guildskillCfg {
    id = 667,
    skillid = 9,
    skillicon = 123,
    skilllevel = 67,
    skillname = "禁武者祝福",
    skilldes = "物理防御+8560",
    skillresearch = 230000,
    skilllearn = [{1,2300000},{4,23000}],
    guildlevel = 7,
    skillproperty = [{26,8560,0}]
    };
getRow(668)->
    #guildskillCfg {
    id = 668,
    skillid = 9,
    skillicon = 123,
    skilllevel = 68,
    skillname = "禁武者祝福",
    skilldes = "物理防御+8960",
    skillresearch = 240000,
    skilllearn = [{1,2400000},{4,24000}],
    guildlevel = 7,
    skillproperty = [{26,8960,0}]
    };
getRow(669)->
    #guildskillCfg {
    id = 669,
    skillid = 9,
    skillicon = 123,
    skilllevel = 69,
    skillname = "禁武者祝福",
    skilldes = "物理防御+9360",
    skillresearch = 250000,
    skilllearn = [{1,2500000},{4,25000}],
    guildlevel = 7,
    skillproperty = [{26,9360,0}]
    };
getRow(670)->
    #guildskillCfg {
    id = 670,
    skillid = 9,
    skillicon = 123,
    skilllevel = 70,
    skillname = "禁武者祝福",
    skilldes = "物理防御+9760",
    skillresearch = 260000,
    skilllearn = [{1,2600000},{4,26000}],
    guildlevel = 7,
    skillproperty = [{26,9760,0}]
    };
getRow(671)->
    #guildskillCfg {
    id = 671,
    skillid = 9,
    skillicon = 123,
    skilllevel = 71,
    skillname = "禁武者祝福",
    skilldes = "物理防御+10160",
    skillresearch = 270000,
    skilllearn = [{1,2700000},{4,27000}],
    guildlevel = 8,
    skillproperty = [{4,10160,0}]
    };
getRow(672)->
    #guildskillCfg {
    id = 672,
    skillid = 9,
    skillicon = 123,
    skilllevel = 72,
    skillname = "禁武者祝福",
    skilldes = "物理防御+10560",
    skillresearch = 280000,
    skilllearn = [{1,2800000},{4,28000}],
    guildlevel = 8,
    skillproperty = [{4,10560,0}]
    };
getRow(673)->
    #guildskillCfg {
    id = 673,
    skillid = 9,
    skillicon = 123,
    skilllevel = 73,
    skillname = "禁武者祝福",
    skilldes = "物理防御+10960",
    skillresearch = 290000,
    skilllearn = [{1,2900000},{4,29000}],
    guildlevel = 8,
    skillproperty = [{4,10960,0}]
    };
getRow(674)->
    #guildskillCfg {
    id = 674,
    skillid = 9,
    skillicon = 123,
    skilllevel = 74,
    skillname = "禁武者祝福",
    skilldes = "物理防御+11360",
    skillresearch = 300000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{4,11360,0}]
    };
getRow(675)->
    #guildskillCfg {
    id = 675,
    skillid = 9,
    skillicon = 123,
    skilllevel = 75,
    skillname = "禁武者祝福",
    skilldes = "物理防御+11760",
    skillresearch = 310000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{4,11760,0}]
    };
getRow(676)->
    #guildskillCfg {
    id = 676,
    skillid = 10,
    skillicon = 144,
    skilllevel = 1,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+59",
    skillresearch = 1000,
    skilllearn = [{1,10000},{4,100}],
    guildlevel = 1,
    skillproperty = [{28,59,0}]
    };
getRow(677)->
    #guildskillCfg {
    id = 677,
    skillid = 10,
    skillicon = 144,
    skilllevel = 2,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+69",
    skillresearch = 2000,
    skilllearn = [{1,20000},{4,200}],
    guildlevel = 1,
    skillproperty = [{28,69,0}]
    };
getRow(678)->
    #guildskillCfg {
    id = 678,
    skillid = 10,
    skillicon = 144,
    skilllevel = 3,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+74",
    skillresearch = 3000,
    skilllearn = [{1,30000},{4,300}],
    guildlevel = 1,
    skillproperty = [{28,74,0}]
    };
getRow(679)->
    #guildskillCfg {
    id = 679,
    skillid = 10,
    skillicon = 144,
    skilllevel = 4,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+80",
    skillresearch = 4000,
    skilllearn = [{1,40000},{4,400}],
    guildlevel = 1,
    skillproperty = [{28,80,0}]
    };
getRow(680)->
    #guildskillCfg {
    id = 680,
    skillid = 10,
    skillicon = 144,
    skilllevel = 5,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+86",
    skillresearch = 5000,
    skilllearn = [{1,50000},{4,500}],
    guildlevel = 1,
    skillproperty = [{28,86,0}]
    };
getRow(681)->
    #guildskillCfg {
    id = 681,
    skillid = 10,
    skillicon = 144,
    skilllevel = 6,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+93",
    skillresearch = 6000,
    skilllearn = [{1,60000},{4,600}],
    guildlevel = 1,
    skillproperty = [{28,93,0}]
    };
getRow(682)->
    #guildskillCfg {
    id = 682,
    skillid = 10,
    skillicon = 144,
    skilllevel = 7,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+101",
    skillresearch = 7000,
    skilllearn = [{1,70000},{4,700}],
    guildlevel = 1,
    skillproperty = [{28,101,0}]
    };
getRow(683)->
    #guildskillCfg {
    id = 683,
    skillid = 10,
    skillicon = 144,
    skilllevel = 8,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+109",
    skillresearch = 8000,
    skilllearn = [{1,80000},{4,800}],
    guildlevel = 1,
    skillproperty = [{28,109,0}]
    };
getRow(684)->
    #guildskillCfg {
    id = 684,
    skillid = 10,
    skillicon = 144,
    skilllevel = 9,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+117",
    skillresearch = 9000,
    skilllearn = [{1,90000},{4,900}],
    guildlevel = 1,
    skillproperty = [{28,117,0}]
    };
getRow(685)->
    #guildskillCfg {
    id = 685,
    skillid = 10,
    skillicon = 144,
    skilllevel = 10,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+127",
    skillresearch = 10000,
    skilllearn = [{1,100000},{4,1000}],
    guildlevel = 1,
    skillproperty = [{28,127,0}]
    };
getRow(686)->
    #guildskillCfg {
    id = 686,
    skillid = 10,
    skillicon = 144,
    skilllevel = 11,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+137",
    skillresearch = 11000,
    skilllearn = [{1,110000},{4,1100}],
    guildlevel = 2,
    skillproperty = [{28,137,0}]
    };
getRow(687)->
    #guildskillCfg {
    id = 687,
    skillid = 10,
    skillicon = 144,
    skilllevel = 12,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+147",
    skillresearch = 12000,
    skilllearn = [{1,120000},{4,1200}],
    guildlevel = 2,
    skillproperty = [{28,147,0}]
    };
getRow(688)->
    #guildskillCfg {
    id = 688,
    skillid = 10,
    skillicon = 144,
    skilllevel = 13,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+159",
    skillresearch = 13000,
    skilllearn = [{1,130000},{4,1300}],
    guildlevel = 2,
    skillproperty = [{28,159,0}]
    };
getRow(689)->
    #guildskillCfg {
    id = 689,
    skillid = 10,
    skillicon = 144,
    skilllevel = 14,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+172",
    skillresearch = 14000,
    skilllearn = [{1,140000},{4,1400}],
    guildlevel = 2,
    skillproperty = [{28,172,0}]
    };
getRow(690)->
    #guildskillCfg {
    id = 690,
    skillid = 10,
    skillicon = 144,
    skilllevel = 15,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+185",
    skillresearch = 15000,
    skilllearn = [{1,150000},{4,1500}],
    guildlevel = 2,
    skillproperty = [{28,185,0}]
    };
getRow(691)->
    #guildskillCfg {
    id = 691,
    skillid = 10,
    skillicon = 144,
    skilllevel = 16,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+200",
    skillresearch = 16000,
    skilllearn = [{1,160000},{4,1600}],
    guildlevel = 2,
    skillproperty = [{28,200,0}]
    };
getRow(692)->
    #guildskillCfg {
    id = 692,
    skillid = 10,
    skillicon = 144,
    skilllevel = 17,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+216",
    skillresearch = 17000,
    skilllearn = [{1,170000},{4,1700}],
    guildlevel = 2,
    skillproperty = [{28,216,0}]
    };
getRow(693)->
    #guildskillCfg {
    id = 693,
    skillid = 10,
    skillicon = 144,
    skilllevel = 18,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+233",
    skillresearch = 18000,
    skilllearn = [{1,180000},{4,1800}],
    guildlevel = 2,
    skillproperty = [{28,233,0}]
    };
getRow(694)->
    #guildskillCfg {
    id = 694,
    skillid = 10,
    skillicon = 144,
    skilllevel = 19,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+252",
    skillresearch = 19000,
    skilllearn = [{1,190000},{4,1900}],
    guildlevel = 2,
    skillproperty = [{28,252,0}]
    };
getRow(695)->
    #guildskillCfg {
    id = 695,
    skillid = 10,
    skillicon = 144,
    skilllevel = 20,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+272",
    skillresearch = 20000,
    skilllearn = [{1,200000},{4,2000}],
    guildlevel = 2,
    skillproperty = [{28,272,0}]
    };
getRow(696)->
    #guildskillCfg {
    id = 696,
    skillid = 10,
    skillicon = 144,
    skilllevel = 21,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+293",
    skillresearch = 22000,
    skilllearn = [{1,220000},{4,2200}],
    guildlevel = 3,
    skillproperty = [{28,293,0}]
    };
getRow(697)->
    #guildskillCfg {
    id = 697,
    skillid = 10,
    skillicon = 144,
    skilllevel = 22,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+316",
    skillresearch = 24000,
    skilllearn = [{1,240000},{4,2400}],
    guildlevel = 3,
    skillproperty = [{28,316,0}]
    };
getRow(698)->
    #guildskillCfg {
    id = 698,
    skillid = 10,
    skillicon = 144,
    skilllevel = 23,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+341",
    skillresearch = 26000,
    skilllearn = [{1,260000},{4,2600}],
    guildlevel = 3,
    skillproperty = [{28,341,0}]
    };
getRow(699)->
    #guildskillCfg {
    id = 699,
    skillid = 10,
    skillicon = 144,
    skilllevel = 24,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+369",
    skillresearch = 28000,
    skilllearn = [{1,280000},{4,2800}],
    guildlevel = 3,
    skillproperty = [{28,369,0}]
    };
getRow(700)->
    #guildskillCfg {
    id = 700,
    skillid = 10,
    skillicon = 144,
    skilllevel = 25,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+398",
    skillresearch = 30000,
    skilllearn = [{1,300000},{4,3000}],
    guildlevel = 3,
    skillproperty = [{28,398,0}]
    };
getRow(701)->
    #guildskillCfg {
    id = 701,
    skillid = 10,
    skillicon = 144,
    skilllevel = 26,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+429",
    skillresearch = 32000,
    skilllearn = [{1,320000},{4,3200}],
    guildlevel = 3,
    skillproperty = [{28,429,0}]
    };
getRow(702)->
    #guildskillCfg {
    id = 702,
    skillid = 10,
    skillicon = 144,
    skilllevel = 27,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+463",
    skillresearch = 34000,
    skilllearn = [{1,340000},{4,3400}],
    guildlevel = 3,
    skillproperty = [{28,463,0}]
    };
getRow(703)->
    #guildskillCfg {
    id = 703,
    skillid = 10,
    skillicon = 144,
    skilllevel = 28,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+500",
    skillresearch = 36000,
    skilllearn = [{1,360000},{4,3600}],
    guildlevel = 3,
    skillproperty = [{28,500,0}]
    };
getRow(704)->
    #guildskillCfg {
    id = 704,
    skillid = 10,
    skillicon = 144,
    skilllevel = 29,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+540",
    skillresearch = 38000,
    skilllearn = [{1,380000},{4,3800}],
    guildlevel = 3,
    skillproperty = [{28,540,0}]
    };
getRow(705)->
    #guildskillCfg {
    id = 705,
    skillid = 10,
    skillicon = 144,
    skilllevel = 30,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+583",
    skillresearch = 40000,
    skilllearn = [{1,400000},{4,4000}],
    guildlevel = 3,
    skillproperty = [{28,583,0}]
    };
getRow(706)->
    #guildskillCfg {
    id = 706,
    skillid = 10,
    skillicon = 144,
    skilllevel = 31,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+629",
    skillresearch = 42000,
    skilllearn = [{1,420000},{4,4200}],
    guildlevel = 4,
    skillproperty = [{28,629,0}]
    };
getRow(707)->
    #guildskillCfg {
    id = 707,
    skillid = 10,
    skillicon = 144,
    skilllevel = 32,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+679",
    skillresearch = 44000,
    skilllearn = [{1,440000},{4,4400}],
    guildlevel = 4,
    skillproperty = [{28,679,0}]
    };
getRow(708)->
    #guildskillCfg {
    id = 708,
    skillid = 10,
    skillicon = 144,
    skilllevel = 33,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+733",
    skillresearch = 46000,
    skilllearn = [{1,460000},{4,4600}],
    guildlevel = 4,
    skillproperty = [{28,733,0}]
    };
getRow(709)->
    #guildskillCfg {
    id = 709,
    skillid = 10,
    skillicon = 144,
    skilllevel = 34,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+791",
    skillresearch = 48000,
    skilllearn = [{1,480000},{4,4800}],
    guildlevel = 4,
    skillproperty = [{28,791,0}]
    };
getRow(710)->
    #guildskillCfg {
    id = 710,
    skillid = 10,
    skillicon = 144,
    skilllevel = 35,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+854",
    skillresearch = 50000,
    skilllearn = [{1,500000},{4,5000}],
    guildlevel = 4,
    skillproperty = [{28,854,0}]
    };
getRow(711)->
    #guildskillCfg {
    id = 711,
    skillid = 10,
    skillicon = 144,
    skilllevel = 36,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+922",
    skillresearch = 52000,
    skilllearn = [{1,520000},{4,5200}],
    guildlevel = 4,
    skillproperty = [{28,922,0}]
    };
getRow(712)->
    #guildskillCfg {
    id = 712,
    skillid = 10,
    skillicon = 144,
    skilllevel = 37,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+995",
    skillresearch = 54000,
    skilllearn = [{1,540000},{4,5400}],
    guildlevel = 4,
    skillproperty = [{28,995,0}]
    };
getRow(713)->
    #guildskillCfg {
    id = 713,
    skillid = 10,
    skillicon = 144,
    skilllevel = 38,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+1074",
    skillresearch = 56000,
    skilllearn = [{1,560000},{4,5600}],
    guildlevel = 4,
    skillproperty = [{28,1074,0}]
    };
getRow(714)->
    #guildskillCfg {
    id = 714,
    skillid = 10,
    skillicon = 144,
    skilllevel = 39,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+1159",
    skillresearch = 58000,
    skilllearn = [{1,580000},{4,5800}],
    guildlevel = 4,
    skillproperty = [{28,1159,0}]
    };
getRow(715)->
    #guildskillCfg {
    id = 715,
    skillid = 10,
    skillicon = 144,
    skilllevel = 40,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+1251",
    skillresearch = 60000,
    skilllearn = [{1,600000},{4,6000}],
    guildlevel = 4,
    skillproperty = [{28,1251,0}]
    };
getRow(716)->
    #guildskillCfg {
    id = 716,
    skillid = 10,
    skillicon = 144,
    skilllevel = 41,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+1350",
    skillresearch = 65000,
    skilllearn = [{1,650000},{4,6500}],
    guildlevel = 5,
    skillproperty = [{28,1350,0}]
    };
getRow(717)->
    #guildskillCfg {
    id = 717,
    skillid = 10,
    skillicon = 144,
    skilllevel = 42,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+1457",
    skillresearch = 70000,
    skilllearn = [{1,700000},{4,7000}],
    guildlevel = 5,
    skillproperty = [{28,1457,0}]
    };
getRow(718)->
    #guildskillCfg {
    id = 718,
    skillid = 10,
    skillicon = 144,
    skilllevel = 43,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+1573",
    skillresearch = 75000,
    skilllearn = [{1,750000},{4,7500}],
    guildlevel = 5,
    skillproperty = [{28,1573,0}]
    };
getRow(719)->
    #guildskillCfg {
    id = 719,
    skillid = 10,
    skillicon = 144,
    skilllevel = 44,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+1698",
    skillresearch = 80000,
    skilllearn = [{1,800000},{4,8000}],
    guildlevel = 5,
    skillproperty = [{28,1698,0}]
    };
getRow(720)->
    #guildskillCfg {
    id = 720,
    skillid = 10,
    skillicon = 144,
    skilllevel = 45,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+1832",
    skillresearch = 85000,
    skilllearn = [{1,850000},{4,8500}],
    guildlevel = 5,
    skillproperty = [{28,1832,0}]
    };
getRow(721)->
    #guildskillCfg {
    id = 721,
    skillid = 10,
    skillicon = 144,
    skilllevel = 46,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+1978",
    skillresearch = 90000,
    skilllearn = [{1,900000},{4,9000}],
    guildlevel = 5,
    skillproperty = [{28,1978,0}]
    };
getRow(722)->
    #guildskillCfg {
    id = 722,
    skillid = 10,
    skillicon = 144,
    skilllevel = 47,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+2135",
    skillresearch = 95000,
    skilllearn = [{1,950000},{4,9500}],
    guildlevel = 5,
    skillproperty = [{28,2135,0}]
    };
getRow(723)->
    #guildskillCfg {
    id = 723,
    skillid = 10,
    skillicon = 144,
    skilllevel = 48,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+2304",
    skillresearch = 100000,
    skilllearn = [{1,1000000},{4,10000}],
    guildlevel = 5,
    skillproperty = [{28,2304,0}]
    };
getRow(724)->
    #guildskillCfg {
    id = 724,
    skillid = 10,
    skillicon = 144,
    skilllevel = 49,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+2487",
    skillresearch = 105000,
    skilllearn = [{1,1050000},{4,10500}],
    guildlevel = 5,
    skillproperty = [{28,2487,0}]
    };
getRow(725)->
    #guildskillCfg {
    id = 725,
    skillid = 10,
    skillicon = 144,
    skilllevel = 50,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+2684",
    skillresearch = 110000,
    skilllearn = [{1,1100000},{4,11000}],
    guildlevel = 5,
    skillproperty = [{28,2684,0}]
    };
getRow(726)->
    #guildskillCfg {
    id = 726,
    skillid = 10,
    skillicon = 144,
    skilllevel = 51,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+2897",
    skillresearch = 115000,
    skilllearn = [{1,1150000},{4,11500}],
    guildlevel = 6,
    skillproperty = [{28,2897,0}]
    };
getRow(727)->
    #guildskillCfg {
    id = 727,
    skillid = 10,
    skillicon = 144,
    skilllevel = 52,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+3127",
    skillresearch = 120000,
    skilllearn = [{1,1200000},{4,12000}],
    guildlevel = 6,
    skillproperty = [{28,3127,0}]
    };
getRow(728)->
    #guildskillCfg {
    id = 728,
    skillid = 10,
    skillicon = 144,
    skilllevel = 53,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+3375",
    skillresearch = 125000,
    skilllearn = [{1,1250000},{4,12500}],
    guildlevel = 6,
    skillproperty = [{28,3375,0}]
    };
getRow(729)->
    #guildskillCfg {
    id = 729,
    skillid = 10,
    skillicon = 144,
    skilllevel = 54,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+3643",
    skillresearch = 130000,
    skilllearn = [{1,1300000},{4,13000}],
    guildlevel = 6,
    skillproperty = [{28,3643,0}]
    };
getRow(730)->
    #guildskillCfg {
    id = 730,
    skillid = 10,
    skillicon = 144,
    skilllevel = 55,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+3932",
    skillresearch = 135000,
    skilllearn = [{1,1350000},{4,13500}],
    guildlevel = 6,
    skillproperty = [{28,3932,0}]
    };
getRow(731)->
    #guildskillCfg {
    id = 731,
    skillid = 10,
    skillicon = 144,
    skilllevel = 56,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+4244",
    skillresearch = 140000,
    skilllearn = [{1,1400000},{4,14000}],
    guildlevel = 6,
    skillproperty = [{28,4244,0}]
    };
getRow(732)->
    #guildskillCfg {
    id = 732,
    skillid = 10,
    skillicon = 144,
    skilllevel = 57,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+4581",
    skillresearch = 145000,
    skilllearn = [{1,1450000},{4,14500}],
    guildlevel = 6,
    skillproperty = [{28,4581,0}]
    };
getRow(733)->
    #guildskillCfg {
    id = 733,
    skillid = 10,
    skillicon = 144,
    skilllevel = 58,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+4944",
    skillresearch = 150000,
    skilllearn = [{1,1500000},{4,15000}],
    guildlevel = 6,
    skillproperty = [{28,4944,0}]
    };
getRow(734)->
    #guildskillCfg {
    id = 734,
    skillid = 10,
    skillicon = 144,
    skilllevel = 59,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+5337",
    skillresearch = 155000,
    skilllearn = [{1,1550000},{4,15500}],
    guildlevel = 6,
    skillproperty = [{28,5337,0}]
    };
getRow(735)->
    #guildskillCfg {
    id = 735,
    skillid = 10,
    skillicon = 144,
    skilllevel = 60,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+5760",
    skillresearch = 160000,
    skilllearn = [{1,1600000},{4,16000}],
    guildlevel = 6,
    skillproperty = [{28,5760,0}]
    };
getRow(736)->
    #guildskillCfg {
    id = 736,
    skillid = 10,
    skillicon = 144,
    skilllevel = 61,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+6160",
    skillresearch = 170000,
    skilllearn = [{1,1700000},{4,17000}],
    guildlevel = 7,
    skillproperty = [{28,6160,0}]
    };
getRow(737)->
    #guildskillCfg {
    id = 737,
    skillid = 10,
    skillicon = 144,
    skilllevel = 62,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+6560",
    skillresearch = 180000,
    skilllearn = [{1,1800000},{4,18000}],
    guildlevel = 7,
    skillproperty = [{28,6560,0}]
    };
getRow(738)->
    #guildskillCfg {
    id = 738,
    skillid = 10,
    skillicon = 144,
    skilllevel = 63,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+6960",
    skillresearch = 190000,
    skilllearn = [{1,1900000},{4,19000}],
    guildlevel = 7,
    skillproperty = [{28,6960,0}]
    };
getRow(739)->
    #guildskillCfg {
    id = 739,
    skillid = 10,
    skillicon = 144,
    skilllevel = 64,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+7360",
    skillresearch = 200000,
    skilllearn = [{1,2000000},{4,20000}],
    guildlevel = 7,
    skillproperty = [{28,7360,0}]
    };
getRow(740)->
    #guildskillCfg {
    id = 740,
    skillid = 10,
    skillicon = 144,
    skilllevel = 65,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+7760",
    skillresearch = 210000,
    skilllearn = [{1,2100000},{4,21000}],
    guildlevel = 7,
    skillproperty = [{28,7760,0}]
    };
getRow(741)->
    #guildskillCfg {
    id = 741,
    skillid = 10,
    skillicon = 144,
    skilllevel = 66,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+8160",
    skillresearch = 220000,
    skilllearn = [{1,2200000},{4,22000}],
    guildlevel = 7,
    skillproperty = [{28,8160,0}]
    };
getRow(742)->
    #guildskillCfg {
    id = 742,
    skillid = 10,
    skillicon = 144,
    skilllevel = 67,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+8560",
    skillresearch = 230000,
    skilllearn = [{1,2300000},{4,23000}],
    guildlevel = 7,
    skillproperty = [{28,8560,0}]
    };
getRow(743)->
    #guildskillCfg {
    id = 743,
    skillid = 10,
    skillicon = 144,
    skilllevel = 68,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+8960",
    skillresearch = 240000,
    skilllearn = [{1,2400000},{4,24000}],
    guildlevel = 7,
    skillproperty = [{28,8960,0}]
    };
getRow(744)->
    #guildskillCfg {
    id = 744,
    skillid = 10,
    skillicon = 144,
    skilllevel = 69,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+9360",
    skillresearch = 250000,
    skilllearn = [{1,2500000},{4,25000}],
    guildlevel = 7,
    skillproperty = [{28,9360,0}]
    };
getRow(745)->
    #guildskillCfg {
    id = 745,
    skillid = 10,
    skillicon = 144,
    skilllevel = 70,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+9760",
    skillresearch = 260000,
    skilllearn = [{1,2600000},{4,26000}],
    guildlevel = 7,
    skillproperty = [{28,9760,0}]
    };
getRow(746)->
    #guildskillCfg {
    id = 746,
    skillid = 10,
    skillicon = 144,
    skilllevel = 71,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+10160",
    skillresearch = 270000,
    skilllearn = [{1,2700000},{4,27000}],
    guildlevel = 8,
    skillproperty = [{28,10160,0}]
    };
getRow(747)->
    #guildskillCfg {
    id = 747,
    skillid = 10,
    skillicon = 144,
    skilllevel = 72,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+10560",
    skillresearch = 280000,
    skilllearn = [{1,2800000},{4,28000}],
    guildlevel = 8,
    skillproperty = [{28,10560,0}]
    };
getRow(748)->
    #guildskillCfg {
    id = 748,
    skillid = 10,
    skillicon = 144,
    skilllevel = 73,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+10960",
    skillresearch = 290000,
    skilllearn = [{1,2900000},{4,29000}],
    guildlevel = 8,
    skillproperty = [{28,10960,0}]
    };
getRow(749)->
    #guildskillCfg {
    id = 749,
    skillid = 10,
    skillicon = 144,
    skilllevel = 74,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+11360",
    skillresearch = 300000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{28,11360,0}]
    };
getRow(750)->
    #guildskillCfg {
    id = 750,
    skillid = 10,
    skillicon = 144,
    skilllevel = 75,
    skillname = "禁魔者祝福",
    skilldes = "魔法防御+11760",
    skillresearch = 310000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{28,11760,0}]
    };
getRow(751)->
    #guildskillCfg {
    id = 751,
    skillid = 11,
    skillicon = 155,
    skilllevel = 1,
    skillname = "豁免",
    skilldes = "爆击伤害减免+1%",
    skillresearch = 1000,
    skilllearn = [{1,10000},{4,100}],
    guildlevel = 1,
    skillproperty = [{118,0.01,0}]
    };
getRow(752)->
    #guildskillCfg {
    id = 752,
    skillid = 11,
    skillicon = 155,
    skilllevel = 2,
    skillname = "豁免",
    skilldes = "爆击伤害减免+2%",
    skillresearch = 2000,
    skilllearn = [{1,20000},{4,200}],
    guildlevel = 1,
    skillproperty = [{118,0.02,0}]
    };
getRow(753)->
    #guildskillCfg {
    id = 753,
    skillid = 11,
    skillicon = 155,
    skilllevel = 3,
    skillname = "豁免",
    skilldes = "爆击伤害减免+3%",
    skillresearch = 3000,
    skilllearn = [{1,30000},{4,300}],
    guildlevel = 1,
    skillproperty = [{118,0.03,0}]
    };
getRow(754)->
    #guildskillCfg {
    id = 754,
    skillid = 11,
    skillicon = 155,
    skilllevel = 4,
    skillname = "豁免",
    skilldes = "爆击伤害减免+4%",
    skillresearch = 4000,
    skilllearn = [{1,40000},{4,400}],
    guildlevel = 1,
    skillproperty = [{118,0.04,0}]
    };
getRow(755)->
    #guildskillCfg {
    id = 755,
    skillid = 11,
    skillicon = 155,
    skilllevel = 5,
    skillname = "豁免",
    skilldes = "爆击伤害减免+5%",
    skillresearch = 5000,
    skilllearn = [{1,50000},{4,500}],
    guildlevel = 1,
    skillproperty = [{118,0.05,0}]
    };
getRow(756)->
    #guildskillCfg {
    id = 756,
    skillid = 11,
    skillicon = 155,
    skilllevel = 6,
    skillname = "豁免",
    skilldes = "爆击伤害减免+6%",
    skillresearch = 6000,
    skilllearn = [{1,60000},{4,600}],
    guildlevel = 1,
    skillproperty = [{118,0.06,0}]
    };
getRow(757)->
    #guildskillCfg {
    id = 757,
    skillid = 11,
    skillicon = 155,
    skilllevel = 7,
    skillname = "豁免",
    skilldes = "爆击伤害减免+7%",
    skillresearch = 7000,
    skilllearn = [{1,70000},{4,700}],
    guildlevel = 1,
    skillproperty = [{118,0.07,0}]
    };
getRow(758)->
    #guildskillCfg {
    id = 758,
    skillid = 11,
    skillicon = 155,
    skilllevel = 8,
    skillname = "豁免",
    skilldes = "爆击伤害减免+8%",
    skillresearch = 8000,
    skilllearn = [{1,80000},{4,800}],
    guildlevel = 1,
    skillproperty = [{118,0.08,0}]
    };
getRow(759)->
    #guildskillCfg {
    id = 759,
    skillid = 11,
    skillicon = 155,
    skilllevel = 9,
    skillname = "豁免",
    skilldes = "爆击伤害减免+9%",
    skillresearch = 9000,
    skilllearn = [{1,90000},{4,900}],
    guildlevel = 1,
    skillproperty = [{118,0.09,0}]
    };
getRow(760)->
    #guildskillCfg {
    id = 760,
    skillid = 11,
    skillicon = 155,
    skilllevel = 10,
    skillname = "豁免",
    skilldes = "爆击伤害减免+10%",
    skillresearch = 10000,
    skilllearn = [{1,100000},{4,1000}],
    guildlevel = 1,
    skillproperty = [{118,0.1,0}]
    };
getRow(761)->
    #guildskillCfg {
    id = 761,
    skillid = 11,
    skillicon = 155,
    skilllevel = 11,
    skillname = "豁免",
    skilldes = "爆击伤害减免+11%",
    skillresearch = 11000,
    skilllearn = [{1,110000},{4,1100}],
    guildlevel = 2,
    skillproperty = [{118,0.11,0}]
    };
getRow(762)->
    #guildskillCfg {
    id = 762,
    skillid = 11,
    skillicon = 155,
    skilllevel = 12,
    skillname = "豁免",
    skilldes = "爆击伤害减免+12%",
    skillresearch = 12000,
    skilllearn = [{1,120000},{4,1200}],
    guildlevel = 2,
    skillproperty = [{118,0.12,0}]
    };
getRow(763)->
    #guildskillCfg {
    id = 763,
    skillid = 11,
    skillicon = 155,
    skilllevel = 13,
    skillname = "豁免",
    skilldes = "爆击伤害减免+13%",
    skillresearch = 13000,
    skilllearn = [{1,130000},{4,1300}],
    guildlevel = 2,
    skillproperty = [{118,0.13,0}]
    };
getRow(764)->
    #guildskillCfg {
    id = 764,
    skillid = 11,
    skillicon = 155,
    skilllevel = 14,
    skillname = "豁免",
    skilldes = "爆击伤害减免+14%",
    skillresearch = 14000,
    skilllearn = [{1,140000},{4,1400}],
    guildlevel = 2,
    skillproperty = [{118,0.14,0}]
    };
getRow(765)->
    #guildskillCfg {
    id = 765,
    skillid = 11,
    skillicon = 155,
    skilllevel = 15,
    skillname = "豁免",
    skilldes = "爆击伤害减免+15%",
    skillresearch = 15000,
    skilllearn = [{1,150000},{4,1500}],
    guildlevel = 2,
    skillproperty = [{118,0.15,0}]
    };
getRow(766)->
    #guildskillCfg {
    id = 766,
    skillid = 11,
    skillicon = 155,
    skilllevel = 16,
    skillname = "豁免",
    skilldes = "爆击伤害减免+16%",
    skillresearch = 16000,
    skilllearn = [{1,160000},{4,1600}],
    guildlevel = 2,
    skillproperty = [{118,0.16,0}]
    };
getRow(767)->
    #guildskillCfg {
    id = 767,
    skillid = 11,
    skillicon = 155,
    skilllevel = 17,
    skillname = "豁免",
    skilldes = "爆击伤害减免+17%",
    skillresearch = 17000,
    skilllearn = [{1,170000},{4,1700}],
    guildlevel = 2,
    skillproperty = [{118,0.17,0}]
    };
getRow(768)->
    #guildskillCfg {
    id = 768,
    skillid = 11,
    skillicon = 155,
    skilllevel = 18,
    skillname = "豁免",
    skilldes = "爆击伤害减免+18%",
    skillresearch = 18000,
    skilllearn = [{1,180000},{4,1800}],
    guildlevel = 2,
    skillproperty = [{118,0.18,0}]
    };
getRow(769)->
    #guildskillCfg {
    id = 769,
    skillid = 11,
    skillicon = 155,
    skilllevel = 19,
    skillname = "豁免",
    skilldes = "爆击伤害减免+19%",
    skillresearch = 19000,
    skilllearn = [{1,190000},{4,1900}],
    guildlevel = 2,
    skillproperty = [{118,0.19,0}]
    };
getRow(770)->
    #guildskillCfg {
    id = 770,
    skillid = 11,
    skillicon = 155,
    skilllevel = 20,
    skillname = "豁免",
    skilldes = "爆击伤害减免+20%",
    skillresearch = 20000,
    skilllearn = [{1,200000},{4,2000}],
    guildlevel = 2,
    skillproperty = [{118,0.2,0}]
    };
getRow(771)->
    #guildskillCfg {
    id = 771,
    skillid = 11,
    skillicon = 155,
    skilllevel = 21,
    skillname = "豁免",
    skilldes = "爆击伤害减免+21%",
    skillresearch = 22000,
    skilllearn = [{1,220000},{4,2200}],
    guildlevel = 3,
    skillproperty = [{118,0.21,0}]
    };
getRow(772)->
    #guildskillCfg {
    id = 772,
    skillid = 11,
    skillicon = 155,
    skilllevel = 22,
    skillname = "豁免",
    skilldes = "爆击伤害减免+22%",
    skillresearch = 24000,
    skilllearn = [{1,240000},{4,2400}],
    guildlevel = 3,
    skillproperty = [{118,0.22,0}]
    };
getRow(773)->
    #guildskillCfg {
    id = 773,
    skillid = 11,
    skillicon = 155,
    skilllevel = 23,
    skillname = "豁免",
    skilldes = "爆击伤害减免+23%",
    skillresearch = 26000,
    skilllearn = [{1,260000},{4,2600}],
    guildlevel = 3,
    skillproperty = [{118,0.23,0}]
    };
getRow(774)->
    #guildskillCfg {
    id = 774,
    skillid = 11,
    skillicon = 155,
    skilllevel = 24,
    skillname = "豁免",
    skilldes = "爆击伤害减免+24%",
    skillresearch = 28000,
    skilllearn = [{1,280000},{4,2800}],
    guildlevel = 3,
    skillproperty = [{118,0.24,0}]
    };
getRow(775)->
    #guildskillCfg {
    id = 775,
    skillid = 11,
    skillicon = 155,
    skilllevel = 25,
    skillname = "豁免",
    skilldes = "爆击伤害减免+25%",
    skillresearch = 30000,
    skilllearn = [{1,300000},{4,3000}],
    guildlevel = 3,
    skillproperty = [{118,0.25,0}]
    };
getRow(776)->
    #guildskillCfg {
    id = 776,
    skillid = 11,
    skillicon = 155,
    skilllevel = 26,
    skillname = "豁免",
    skilldes = "爆击伤害减免+26%",
    skillresearch = 32000,
    skilllearn = [{1,320000},{4,3200}],
    guildlevel = 3,
    skillproperty = [{118,0.26,0}]
    };
getRow(777)->
    #guildskillCfg {
    id = 777,
    skillid = 11,
    skillicon = 155,
    skilllevel = 27,
    skillname = "豁免",
    skilldes = "爆击伤害减免+27%",
    skillresearch = 34000,
    skilllearn = [{1,340000},{4,3400}],
    guildlevel = 3,
    skillproperty = [{118,0.27,0}]
    };
getRow(778)->
    #guildskillCfg {
    id = 778,
    skillid = 11,
    skillicon = 155,
    skilllevel = 28,
    skillname = "豁免",
    skilldes = "爆击伤害减免+28%",
    skillresearch = 36000,
    skilllearn = [{1,360000},{4,3600}],
    guildlevel = 3,
    skillproperty = [{118,0.28,0}]
    };
getRow(779)->
    #guildskillCfg {
    id = 779,
    skillid = 11,
    skillicon = 155,
    skilllevel = 29,
    skillname = "豁免",
    skilldes = "爆击伤害减免+29%",
    skillresearch = 38000,
    skilllearn = [{1,380000},{4,3800}],
    guildlevel = 3,
    skillproperty = [{118,0.29,0}]
    };
getRow(780)->
    #guildskillCfg {
    id = 780,
    skillid = 11,
    skillicon = 155,
    skilllevel = 30,
    skillname = "豁免",
    skilldes = "爆击伤害减免+30%",
    skillresearch = 40000,
    skilllearn = [{1,400000},{4,4000}],
    guildlevel = 3,
    skillproperty = [{118,0.3,0}]
    };
getRow(781)->
    #guildskillCfg {
    id = 781,
    skillid = 11,
    skillicon = 155,
    skilllevel = 31,
    skillname = "豁免",
    skilldes = "爆击伤害减免+31%",
    skillresearch = 42000,
    skilllearn = [{1,420000},{4,4200}],
    guildlevel = 4,
    skillproperty = [{118,0.31,0}]
    };
getRow(782)->
    #guildskillCfg {
    id = 782,
    skillid = 11,
    skillicon = 155,
    skilllevel = 32,
    skillname = "豁免",
    skilldes = "爆击伤害减免+32%",
    skillresearch = 44000,
    skilllearn = [{1,440000},{4,4400}],
    guildlevel = 4,
    skillproperty = [{118,0.32,0}]
    };
getRow(783)->
    #guildskillCfg {
    id = 783,
    skillid = 11,
    skillicon = 155,
    skilllevel = 33,
    skillname = "豁免",
    skilldes = "爆击伤害减免+33%",
    skillresearch = 46000,
    skilllearn = [{1,460000},{4,4600}],
    guildlevel = 4,
    skillproperty = [{118,0.33,0}]
    };
getRow(784)->
    #guildskillCfg {
    id = 784,
    skillid = 11,
    skillicon = 155,
    skilllevel = 34,
    skillname = "豁免",
    skilldes = "爆击伤害减免+34%",
    skillresearch = 48000,
    skilllearn = [{1,480000},{4,4800}],
    guildlevel = 4,
    skillproperty = [{118,0.34,0}]
    };
getRow(785)->
    #guildskillCfg {
    id = 785,
    skillid = 11,
    skillicon = 155,
    skilllevel = 35,
    skillname = "豁免",
    skilldes = "爆击伤害减免+35%",
    skillresearch = 50000,
    skilllearn = [{1,500000},{4,5000}],
    guildlevel = 4,
    skillproperty = [{118,0.35,0}]
    };
getRow(786)->
    #guildskillCfg {
    id = 786,
    skillid = 11,
    skillicon = 155,
    skilllevel = 36,
    skillname = "豁免",
    skilldes = "爆击伤害减免+36%",
    skillresearch = 52000,
    skilllearn = [{1,520000},{4,5200}],
    guildlevel = 4,
    skillproperty = [{118,0.36,0}]
    };
getRow(787)->
    #guildskillCfg {
    id = 787,
    skillid = 11,
    skillicon = 155,
    skilllevel = 37,
    skillname = "豁免",
    skilldes = "爆击伤害减免+37%",
    skillresearch = 54000,
    skilllearn = [{1,540000},{4,5400}],
    guildlevel = 4,
    skillproperty = [{118,0.37,0}]
    };
getRow(788)->
    #guildskillCfg {
    id = 788,
    skillid = 11,
    skillicon = 155,
    skilllevel = 38,
    skillname = "豁免",
    skilldes = "爆击伤害减免+38%",
    skillresearch = 56000,
    skilllearn = [{1,560000},{4,5600}],
    guildlevel = 4,
    skillproperty = [{118,0.38,0}]
    };
getRow(789)->
    #guildskillCfg {
    id = 789,
    skillid = 11,
    skillicon = 155,
    skilllevel = 39,
    skillname = "豁免",
    skilldes = "爆击伤害减免+39%",
    skillresearch = 58000,
    skilllearn = [{1,580000},{4,5800}],
    guildlevel = 4,
    skillproperty = [{118,0.39,0}]
    };
getRow(790)->
    #guildskillCfg {
    id = 790,
    skillid = 11,
    skillicon = 155,
    skilllevel = 40,
    skillname = "豁免",
    skilldes = "爆击伤害减免+40%",
    skillresearch = 60000,
    skilllearn = [{1,600000},{4,6000}],
    guildlevel = 4,
    skillproperty = [{118,0.4,0}]
    };
getRow(791)->
    #guildskillCfg {
    id = 791,
    skillid = 11,
    skillicon = 155,
    skilllevel = 41,
    skillname = "豁免",
    skilldes = "爆击伤害减免+41%",
    skillresearch = 65000,
    skilllearn = [{1,650000},{4,6500}],
    guildlevel = 5,
    skillproperty = [{118,0.41,0}]
    };
getRow(792)->
    #guildskillCfg {
    id = 792,
    skillid = 11,
    skillicon = 155,
    skilllevel = 42,
    skillname = "豁免",
    skilldes = "爆击伤害减免+42%",
    skillresearch = 70000,
    skilllearn = [{1,700000},{4,7000}],
    guildlevel = 5,
    skillproperty = [{118,0.42,0}]
    };
getRow(793)->
    #guildskillCfg {
    id = 793,
    skillid = 11,
    skillicon = 155,
    skilllevel = 43,
    skillname = "豁免",
    skilldes = "爆击伤害减免+43%",
    skillresearch = 75000,
    skilllearn = [{1,750000},{4,7500}],
    guildlevel = 5,
    skillproperty = [{118,0.43,0}]
    };
getRow(794)->
    #guildskillCfg {
    id = 794,
    skillid = 11,
    skillicon = 155,
    skilllevel = 44,
    skillname = "豁免",
    skilldes = "爆击伤害减免+44%",
    skillresearch = 80000,
    skilllearn = [{1,800000},{4,8000}],
    guildlevel = 5,
    skillproperty = [{118,0.44,0}]
    };
getRow(795)->
    #guildskillCfg {
    id = 795,
    skillid = 11,
    skillicon = 155,
    skilllevel = 45,
    skillname = "豁免",
    skilldes = "爆击伤害减免+45%",
    skillresearch = 85000,
    skilllearn = [{1,850000},{4,8500}],
    guildlevel = 5,
    skillproperty = [{118,0.45,0}]
    };
getRow(796)->
    #guildskillCfg {
    id = 796,
    skillid = 11,
    skillicon = 155,
    skilllevel = 46,
    skillname = "豁免",
    skilldes = "爆击伤害减免+46%",
    skillresearch = 90000,
    skilllearn = [{1,900000},{4,9000}],
    guildlevel = 5,
    skillproperty = [{118,0.46,0}]
    };
getRow(797)->
    #guildskillCfg {
    id = 797,
    skillid = 11,
    skillicon = 155,
    skilllevel = 47,
    skillname = "豁免",
    skilldes = "爆击伤害减免+47%",
    skillresearch = 95000,
    skilllearn = [{1,950000},{4,9500}],
    guildlevel = 5,
    skillproperty = [{118,0.47,0}]
    };
getRow(798)->
    #guildskillCfg {
    id = 798,
    skillid = 11,
    skillicon = 155,
    skilllevel = 48,
    skillname = "豁免",
    skilldes = "爆击伤害减免+48%",
    skillresearch = 100000,
    skilllearn = [{1,1000000},{4,10000}],
    guildlevel = 5,
    skillproperty = [{118,0.48,0}]
    };
getRow(799)->
    #guildskillCfg {
    id = 799,
    skillid = 11,
    skillicon = 155,
    skilllevel = 49,
    skillname = "豁免",
    skilldes = "爆击伤害减免+49%",
    skillresearch = 105000,
    skilllearn = [{1,1050000},{4,10500}],
    guildlevel = 5,
    skillproperty = [{118,0.49,0}]
    };
getRow(800)->
    #guildskillCfg {
    id = 800,
    skillid = 11,
    skillicon = 155,
    skilllevel = 50,
    skillname = "豁免",
    skilldes = "爆击伤害减免+50%",
    skillresearch = 110000,
    skilllearn = [{1,1100000},{4,11000}],
    guildlevel = 5,
    skillproperty = [{118,0.5,0}]
    };
getRow(801)->
    #guildskillCfg {
    id = 801,
    skillid = 11,
    skillicon = 155,
    skilllevel = 51,
    skillname = "豁免",
    skilldes = "爆击伤害减免+51%",
    skillresearch = 115000,
    skilllearn = [{1,1150000},{4,11500}],
    guildlevel = 6,
    skillproperty = [{118,0.51,0}]
    };
getRow(802)->
    #guildskillCfg {
    id = 802,
    skillid = 11,
    skillicon = 155,
    skilllevel = 52,
    skillname = "豁免",
    skilldes = "爆击伤害减免+52%",
    skillresearch = 120000,
    skilllearn = [{1,1200000},{4,12000}],
    guildlevel = 6,
    skillproperty = [{118,0.52,0}]
    };
getRow(803)->
    #guildskillCfg {
    id = 803,
    skillid = 11,
    skillicon = 155,
    skilllevel = 53,
    skillname = "豁免",
    skilldes = "爆击伤害减免+53%",
    skillresearch = 125000,
    skilllearn = [{1,1250000},{4,12500}],
    guildlevel = 6,
    skillproperty = [{118,0.53,0}]
    };
getRow(804)->
    #guildskillCfg {
    id = 804,
    skillid = 11,
    skillicon = 155,
    skilllevel = 54,
    skillname = "豁免",
    skilldes = "爆击伤害减免+54%",
    skillresearch = 130000,
    skilllearn = [{1,1300000},{4,13000}],
    guildlevel = 6,
    skillproperty = [{118,0.54,0}]
    };
getRow(805)->
    #guildskillCfg {
    id = 805,
    skillid = 11,
    skillicon = 155,
    skilllevel = 55,
    skillname = "豁免",
    skilldes = "爆击伤害减免+55%",
    skillresearch = 135000,
    skilllearn = [{1,1350000},{4,13500}],
    guildlevel = 6,
    skillproperty = [{118,0.55,0}]
    };
getRow(806)->
    #guildskillCfg {
    id = 806,
    skillid = 11,
    skillicon = 155,
    skilllevel = 56,
    skillname = "豁免",
    skilldes = "爆击伤害减免+56%",
    skillresearch = 140000,
    skilllearn = [{1,1400000},{4,14000}],
    guildlevel = 6,
    skillproperty = [{118,0.56,0}]
    };
getRow(807)->
    #guildskillCfg {
    id = 807,
    skillid = 11,
    skillicon = 155,
    skilllevel = 57,
    skillname = "豁免",
    skilldes = "爆击伤害减免+57%",
    skillresearch = 145000,
    skilllearn = [{1,1450000},{4,14500}],
    guildlevel = 6,
    skillproperty = [{118,0.57,0}]
    };
getRow(808)->
    #guildskillCfg {
    id = 808,
    skillid = 11,
    skillicon = 155,
    skilllevel = 58,
    skillname = "豁免",
    skilldes = "爆击伤害减免+58%",
    skillresearch = 150000,
    skilllearn = [{1,1500000},{4,15000}],
    guildlevel = 6,
    skillproperty = [{118,0.58,0}]
    };
getRow(809)->
    #guildskillCfg {
    id = 809,
    skillid = 11,
    skillicon = 155,
    skilllevel = 59,
    skillname = "豁免",
    skilldes = "爆击伤害减免+59%",
    skillresearch = 155000,
    skilllearn = [{1,1550000},{4,15500}],
    guildlevel = 6,
    skillproperty = [{118,0.59,0}]
    };
getRow(810)->
    #guildskillCfg {
    id = 810,
    skillid = 11,
    skillicon = 155,
    skilllevel = 60,
    skillname = "豁免",
    skilldes = "爆击伤害减免+60%",
    skillresearch = 160000,
    skilllearn = [{1,1600000},{4,16000}],
    guildlevel = 6,
    skillproperty = [{118,0.6,0}]
    };
getRow(811)->
    #guildskillCfg {
    id = 811,
    skillid = 11,
    skillicon = 155,
    skilllevel = 61,
    skillname = "豁免",
    skilldes = "爆击伤害减免+61%",
    skillresearch = 170000,
    skilllearn = [{1,1700000},{4,17000}],
    guildlevel = 7,
    skillproperty = [{118,0.61,0}]
    };
getRow(812)->
    #guildskillCfg {
    id = 812,
    skillid = 11,
    skillicon = 155,
    skilllevel = 62,
    skillname = "豁免",
    skilldes = "爆击伤害减免+62%",
    skillresearch = 180000,
    skilllearn = [{1,1800000},{4,18000}],
    guildlevel = 7,
    skillproperty = [{118,0.62,0}]
    };
getRow(813)->
    #guildskillCfg {
    id = 813,
    skillid = 11,
    skillicon = 155,
    skilllevel = 63,
    skillname = "豁免",
    skilldes = "爆击伤害减免+63%",
    skillresearch = 190000,
    skilllearn = [{1,1900000},{4,19000}],
    guildlevel = 7,
    skillproperty = [{118,0.63,0}]
    };
getRow(814)->
    #guildskillCfg {
    id = 814,
    skillid = 11,
    skillicon = 155,
    skilllevel = 64,
    skillname = "豁免",
    skilldes = "爆击伤害减免+64%",
    skillresearch = 200000,
    skilllearn = [{1,2000000},{4,20000}],
    guildlevel = 7,
    skillproperty = [{118,0.64,0}]
    };
getRow(815)->
    #guildskillCfg {
    id = 815,
    skillid = 11,
    skillicon = 155,
    skilllevel = 65,
    skillname = "豁免",
    skilldes = "爆击伤害减免+65%",
    skillresearch = 210000,
    skilllearn = [{1,2100000},{4,21000}],
    guildlevel = 7,
    skillproperty = [{118,0.65,0}]
    };
getRow(816)->
    #guildskillCfg {
    id = 816,
    skillid = 11,
    skillicon = 155,
    skilllevel = 66,
    skillname = "豁免",
    skilldes = "爆击伤害减免+66%",
    skillresearch = 220000,
    skilllearn = [{1,2200000},{4,22000}],
    guildlevel = 7,
    skillproperty = [{118,0.66,0}]
    };
getRow(817)->
    #guildskillCfg {
    id = 817,
    skillid = 11,
    skillicon = 155,
    skilllevel = 67,
    skillname = "豁免",
    skilldes = "爆击伤害减免+67%",
    skillresearch = 230000,
    skilllearn = [{1,2300000},{4,23000}],
    guildlevel = 7,
    skillproperty = [{118,0.67,0}]
    };
getRow(818)->
    #guildskillCfg {
    id = 818,
    skillid = 11,
    skillicon = 155,
    skilllevel = 68,
    skillname = "豁免",
    skilldes = "爆击伤害减免+68%",
    skillresearch = 240000,
    skilllearn = [{1,2400000},{4,24000}],
    guildlevel = 7,
    skillproperty = [{118,0.68,0}]
    };
getRow(819)->
    #guildskillCfg {
    id = 819,
    skillid = 11,
    skillicon = 155,
    skilllevel = 69,
    skillname = "豁免",
    skilldes = "爆击伤害减免+69%",
    skillresearch = 250000,
    skilllearn = [{1,2500000},{4,25000}],
    guildlevel = 7,
    skillproperty = [{118,0.69,0}]
    };
getRow(820)->
    #guildskillCfg {
    id = 820,
    skillid = 11,
    skillicon = 155,
    skilllevel = 70,
    skillname = "豁免",
    skilldes = "爆击伤害减免+70%",
    skillresearch = 260000,
    skilllearn = [{1,2600000},{4,26000}],
    guildlevel = 7,
    skillproperty = [{118,0.7,0}]
    };
getRow(821)->
    #guildskillCfg {
    id = 821,
    skillid = 11,
    skillicon = 155,
    skilllevel = 71,
    skillname = "豁免",
    skilldes = "爆击伤害减免+71%",
    skillresearch = 270000,
    skilllearn = [{1,2700000},{4,27000}],
    guildlevel = 8,
    skillproperty = [{118,0.71,0}]
    };
getRow(822)->
    #guildskillCfg {
    id = 822,
    skillid = 11,
    skillicon = 155,
    skilllevel = 72,
    skillname = "豁免",
    skilldes = "爆击伤害减免+72%",
    skillresearch = 280000,
    skilllearn = [{1,2800000},{4,28000}],
    guildlevel = 8,
    skillproperty = [{118,0.72,0}]
    };
getRow(823)->
    #guildskillCfg {
    id = 823,
    skillid = 11,
    skillicon = 155,
    skilllevel = 73,
    skillname = "豁免",
    skilldes = "爆击伤害减免+73%",
    skillresearch = 290000,
    skilllearn = [{1,2900000},{4,29000}],
    guildlevel = 8,
    skillproperty = [{118,0.73,0}]
    };
getRow(824)->
    #guildskillCfg {
    id = 824,
    skillid = 11,
    skillicon = 155,
    skilllevel = 74,
    skillname = "豁免",
    skilldes = "爆击伤害减免+74%",
    skillresearch = 300000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{118,0.74,0}]
    };
getRow(825)->
    #guildskillCfg {
    id = 825,
    skillid = 11,
    skillicon = 155,
    skilllevel = 75,
    skillname = "豁免",
    skilldes = "爆击伤害减免+75%",
    skillresearch = 310000,
    skilllearn = [{1,3000000},{4,30000}],
    guildlevel = 8,
    skillproperty = [{118,0.75,0}]
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
    {16},
    {17},
    {18},
    {19},
    {20},
    {21},
    {22},
    {23},
    {24},
    {25},
    {26},
    {27},
    {28},
    {29},
    {30},
    {31},
    {32},
    {33},
    {34},
    {35},
    {36},
    {37},
    {38},
    {39},
    {40},
    {41},
    {42},
    {43},
    {44},
    {45},
    {46},
    {47},
    {48},
    {49},
    {50},
    {51},
    {52},
    {53},
    {54},
    {55},
    {56},
    {57},
    {58},
    {59},
    {60},
    {61},
    {62},
    {63},
    {64},
    {65},
    {66},
    {67},
    {68},
    {69},
    {70},
    {71},
    {72},
    {73},
    {74},
    {75},
    {76},
    {77},
    {78},
    {79},
    {80},
    {81},
    {82},
    {83},
    {84},
    {85},
    {86},
    {87},
    {88},
    {89},
    {90},
    {91},
    {92},
    {93},
    {94},
    {95},
    {96},
    {97},
    {98},
    {99},
    {100},
    {101},
    {102},
    {103},
    {104},
    {105},
    {106},
    {107},
    {108},
    {109},
    {110},
    {111},
    {112},
    {113},
    {114},
    {115},
    {116},
    {117},
    {118},
    {119},
    {120},
    {121},
    {122},
    {123},
    {124},
    {125},
    {126},
    {127},
    {128},
    {129},
    {130},
    {131},
    {132},
    {133},
    {134},
    {135},
    {136},
    {137},
    {138},
    {139},
    {140},
    {141},
    {142},
    {143},
    {144},
    {145},
    {146},
    {147},
    {148},
    {149},
    {150},
    {151},
    {152},
    {153},
    {154},
    {155},
    {156},
    {157},
    {158},
    {159},
    {160},
    {161},
    {162},
    {163},
    {164},
    {165},
    {166},
    {167},
    {168},
    {169},
    {170},
    {171},
    {172},
    {173},
    {174},
    {175},
    {176},
    {177},
    {178},
    {179},
    {180},
    {181},
    {182},
    {183},
    {184},
    {185},
    {186},
    {187},
    {188},
    {189},
    {190},
    {191},
    {192},
    {193},
    {194},
    {195},
    {196},
    {197},
    {198},
    {199},
    {200},
    {201},
    {202},
    {203},
    {204},
    {205},
    {206},
    {207},
    {208},
    {209},
    {210},
    {211},
    {212},
    {213},
    {214},
    {215},
    {216},
    {217},
    {218},
    {219},
    {220},
    {221},
    {222},
    {223},
    {224},
    {225},
    {226},
    {227},
    {228},
    {229},
    {230},
    {231},
    {232},
    {233},
    {234},
    {235},
    {236},
    {237},
    {238},
    {239},
    {240},
    {241},
    {242},
    {243},
    {244},
    {245},
    {246},
    {247},
    {248},
    {249},
    {250},
    {251},
    {252},
    {253},
    {254},
    {255},
    {256},
    {257},
    {258},
    {259},
    {260},
    {261},
    {262},
    {263},
    {264},
    {265},
    {266},
    {267},
    {268},
    {269},
    {270},
    {271},
    {272},
    {273},
    {274},
    {275},
    {276},
    {277},
    {278},
    {279},
    {280},
    {281},
    {282},
    {283},
    {284},
    {285},
    {286},
    {287},
    {288},
    {289},
    {290},
    {291},
    {292},
    {293},
    {294},
    {295},
    {296},
    {297},
    {298},
    {299},
    {300},
    {301},
    {302},
    {303},
    {304},
    {305},
    {306},
    {307},
    {308},
    {309},
    {310},
    {311},
    {312},
    {313},
    {314},
    {315},
    {316},
    {317},
    {318},
    {319},
    {320},
    {321},
    {322},
    {323},
    {324},
    {325},
    {326},
    {327},
    {328},
    {329},
    {330},
    {331},
    {332},
    {333},
    {334},
    {335},
    {336},
    {337},
    {338},
    {339},
    {340},
    {341},
    {342},
    {343},
    {344},
    {345},
    {346},
    {347},
    {348},
    {349},
    {350},
    {351},
    {352},
    {353},
    {354},
    {355},
    {356},
    {357},
    {358},
    {359},
    {360},
    {361},
    {362},
    {363},
    {364},
    {365},
    {366},
    {367},
    {368},
    {369},
    {370},
    {371},
    {372},
    {373},
    {374},
    {375},
    {376},
    {377},
    {378},
    {379},
    {380},
    {381},
    {382},
    {383},
    {384},
    {385},
    {386},
    {387},
    {388},
    {389},
    {390},
    {391},
    {392},
    {393},
    {394},
    {395},
    {396},
    {397},
    {398},
    {399},
    {400},
    {401},
    {402},
    {403},
    {404},
    {405},
    {406},
    {407},
    {408},
    {409},
    {410},
    {411},
    {412},
    {413},
    {414},
    {415},
    {416},
    {417},
    {418},
    {419},
    {420},
    {421},
    {422},
    {423},
    {424},
    {425},
    {426},
    {427},
    {428},
    {429},
    {430},
    {431},
    {432},
    {433},
    {434},
    {435},
    {436},
    {437},
    {438},
    {439},
    {440},
    {441},
    {442},
    {443},
    {444},
    {445},
    {446},
    {447},
    {448},
    {449},
    {450},
    {451},
    {452},
    {453},
    {454},
    {455},
    {456},
    {457},
    {458},
    {459},
    {460},
    {461},
    {462},
    {463},
    {464},
    {465},
    {466},
    {467},
    {468},
    {469},
    {470},
    {471},
    {472},
    {473},
    {474},
    {475},
    {476},
    {477},
    {478},
    {479},
    {480},
    {481},
    {482},
    {483},
    {484},
    {485},
    {486},
    {487},
    {488},
    {489},
    {490},
    {491},
    {492},
    {493},
    {494},
    {495},
    {496},
    {497},
    {498},
    {499},
    {500},
    {501},
    {502},
    {503},
    {504},
    {505},
    {506},
    {507},
    {508},
    {509},
    {510},
    {511},
    {512},
    {513},
    {514},
    {515},
    {516},
    {517},
    {518},
    {519},
    {520},
    {521},
    {522},
    {523},
    {524},
    {525},
    {526},
    {527},
    {528},
    {529},
    {530},
    {531},
    {532},
    {533},
    {534},
    {535},
    {536},
    {537},
    {538},
    {539},
    {540},
    {541},
    {542},
    {543},
    {544},
    {545},
    {546},
    {547},
    {548},
    {549},
    {550},
    {551},
    {552},
    {553},
    {554},
    {555},
    {556},
    {557},
    {558},
    {559},
    {560},
    {561},
    {562},
    {563},
    {564},
    {565},
    {566},
    {567},
    {568},
    {569},
    {570},
    {571},
    {572},
    {573},
    {574},
    {575},
    {576},
    {577},
    {578},
    {579},
    {580},
    {581},
    {582},
    {583},
    {584},
    {585},
    {586},
    {587},
    {588},
    {589},
    {590},
    {591},
    {592},
    {593},
    {594},
    {595},
    {596},
    {597},
    {598},
    {599},
    {600},
    {601},
    {602},
    {603},
    {604},
    {605},
    {606},
    {607},
    {608},
    {609},
    {610},
    {611},
    {612},
    {613},
    {614},
    {615},
    {616},
    {617},
    {618},
    {619},
    {620},
    {621},
    {622},
    {623},
    {624},
    {625},
    {626},
    {627},
    {628},
    {629},
    {630},
    {631},
    {632},
    {633},
    {634},
    {635},
    {636},
    {637},
    {638},
    {639},
    {640},
    {641},
    {642},
    {643},
    {644},
    {645},
    {646},
    {647},
    {648},
    {649},
    {650},
    {651},
    {652},
    {653},
    {654},
    {655},
    {656},
    {657},
    {658},
    {659},
    {660},
    {661},
    {662},
    {663},
    {664},
    {665},
    {666},
    {667},
    {668},
    {669},
    {670},
    {671},
    {672},
    {673},
    {674},
    {675},
    {676},
    {677},
    {678},
    {679},
    {680},
    {681},
    {682},
    {683},
    {684},
    {685},
    {686},
    {687},
    {688},
    {689},
    {690},
    {691},
    {692},
    {693},
    {694},
    {695},
    {696},
    {697},
    {698},
    {699},
    {700},
    {701},
    {702},
    {703},
    {704},
    {705},
    {706},
    {707},
    {708},
    {709},
    {710},
    {711},
    {712},
    {713},
    {714},
    {715},
    {716},
    {717},
    {718},
    {719},
    {720},
    {721},
    {722},
    {723},
    {724},
    {725},
    {726},
    {727},
    {728},
    {729},
    {730},
    {731},
    {732},
    {733},
    {734},
    {735},
    {736},
    {737},
    {738},
    {739},
    {740},
    {741},
    {742},
    {743},
    {744},
    {745},
    {746},
    {747},
    {748},
    {749},
    {750},
    {751},
    {752},
    {753},
    {754},
    {755},
    {756},
    {757},
    {758},
    {759},
    {760},
    {761},
    {762},
    {763},
    {764},
    {765},
    {766},
    {767},
    {768},
    {769},
    {770},
    {771},
    {772},
    {773},
    {774},
    {775},
    {776},
    {777},
    {778},
    {779},
    {780},
    {781},
    {782},
    {783},
    {784},
    {785},
    {786},
    {787},
    {788},
    {789},
    {790},
    {791},
    {792},
    {793},
    {794},
    {795},
    {796},
    {797},
    {798},
    {799},
    {800},
    {801},
    {802},
    {803},
    {804},
    {805},
    {806},
    {807},
    {808},
    {809},
    {810},
    {811},
    {812},
    {813},
    {814},
    {815},
    {816},
    {817},
    {818},
    {819},
    {820},
    {821},
    {822},
    {823},
    {824},
    {825}
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
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    120,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    147,
    148,
    149,
    150,
    151,
    152,
    153,
    154,
    155,
    156,
    157,
    158,
    159,
    160,
    161,
    162,
    163,
    164,
    165,
    166,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    198,
    199,
    200,
    201,
    202,
    203,
    204,
    205,
    206,
    207,
    208,
    209,
    210,
    211,
    212,
    213,
    214,
    215,
    216,
    217,
    218,
    219,
    220,
    221,
    222,
    223,
    224,
    225,
    226,
    227,
    228,
    229,
    230,
    231,
    232,
    233,
    234,
    235,
    236,
    237,
    238,
    239,
    240,
    241,
    242,
    243,
    244,
    245,
    246,
    247,
    248,
    249,
    250,
    251,
    252,
    253,
    254,
    255,
    256,
    257,
    258,
    259,
    260,
    261,
    262,
    263,
    264,
    265,
    266,
    267,
    268,
    269,
    270,
    271,
    272,
    273,
    274,
    275,
    276,
    277,
    278,
    279,
    280,
    281,
    282,
    283,
    284,
    285,
    286,
    287,
    288,
    289,
    290,
    291,
    292,
    293,
    294,
    295,
    296,
    297,
    298,
    299,
    300,
    301,
    302,
    303,
    304,
    305,
    306,
    307,
    308,
    309,
    310,
    311,
    312,
    313,
    314,
    315,
    316,
    317,
    318,
    319,
    320,
    321,
    322,
    323,
    324,
    325,
    326,
    327,
    328,
    329,
    330,
    331,
    332,
    333,
    334,
    335,
    336,
    337,
    338,
    339,
    340,
    341,
    342,
    343,
    344,
    345,
    346,
    347,
    348,
    349,
    350,
    351,
    352,
    353,
    354,
    355,
    356,
    357,
    358,
    359,
    360,
    361,
    362,
    363,
    364,
    365,
    366,
    367,
    368,
    369,
    370,
    371,
    372,
    373,
    374,
    375,
    376,
    377,
    378,
    379,
    380,
    381,
    382,
    383,
    384,
    385,
    386,
    387,
    388,
    389,
    390,
    391,
    392,
    393,
    394,
    395,
    396,
    397,
    398,
    399,
    400,
    401,
    402,
    403,
    404,
    405,
    406,
    407,
    408,
    409,
    410,
    411,
    412,
    413,
    414,
    415,
    416,
    417,
    418,
    419,
    420,
    421,
    422,
    423,
    424,
    425,
    426,
    427,
    428,
    429,
    430,
    431,
    432,
    433,
    434,
    435,
    436,
    437,
    438,
    439,
    440,
    441,
    442,
    443,
    444,
    445,
    446,
    447,
    448,
    449,
    450,
    451,
    452,
    453,
    454,
    455,
    456,
    457,
    458,
    459,
    460,
    461,
    462,
    463,
    464,
    465,
    466,
    467,
    468,
    469,
    470,
    471,
    472,
    473,
    474,
    475,
    476,
    477,
    478,
    479,
    480,
    481,
    482,
    483,
    484,
    485,
    486,
    487,
    488,
    489,
    490,
    491,
    492,
    493,
    494,
    495,
    496,
    497,
    498,
    499,
    500,
    501,
    502,
    503,
    504,
    505,
    506,
    507,
    508,
    509,
    510,
    511,
    512,
    513,
    514,
    515,
    516,
    517,
    518,
    519,
    520,
    521,
    522,
    523,
    524,
    525,
    526,
    527,
    528,
    529,
    530,
    531,
    532,
    533,
    534,
    535,
    536,
    537,
    538,
    539,
    540,
    541,
    542,
    543,
    544,
    545,
    546,
    547,
    548,
    549,
    550,
    551,
    552,
    553,
    554,
    555,
    556,
    557,
    558,
    559,
    560,
    561,
    562,
    563,
    564,
    565,
    566,
    567,
    568,
    569,
    570,
    571,
    572,
    573,
    574,
    575,
    576,
    577,
    578,
    579,
    580,
    581,
    582,
    583,
    584,
    585,
    586,
    587,
    588,
    589,
    590,
    591,
    592,
    593,
    594,
    595,
    596,
    597,
    598,
    599,
    600,
    601,
    602,
    603,
    604,
    605,
    606,
    607,
    608,
    609,
    610,
    611,
    612,
    613,
    614,
    615,
    616,
    617,
    618,
    619,
    620,
    621,
    622,
    623,
    624,
    625,
    626,
    627,
    628,
    629,
    630,
    631,
    632,
    633,
    634,
    635,
    636,
    637,
    638,
    639,
    640,
    641,
    642,
    643,
    644,
    645,
    646,
    647,
    648,
    649,
    650,
    651,
    652,
    653,
    654,
    655,
    656,
    657,
    658,
    659,
    660,
    661,
    662,
    663,
    664,
    665,
    666,
    667,
    668,
    669,
    670,
    671,
    672,
    673,
    674,
    675,
    676,
    677,
    678,
    679,
    680,
    681,
    682,
    683,
    684,
    685,
    686,
    687,
    688,
    689,
    690,
    691,
    692,
    693,
    694,
    695,
    696,
    697,
    698,
    699,
    700,
    701,
    702,
    703,
    704,
    705,
    706,
    707,
    708,
    709,
    710,
    711,
    712,
    713,
    714,
    715,
    716,
    717,
    718,
    719,
    720,
    721,
    722,
    723,
    724,
    725,
    726,
    727,
    728,
    729,
    730,
    731,
    732,
    733,
    734,
    735,
    736,
    737,
    738,
    739,
    740,
    741,
    742,
    743,
    744,
    745,
    746,
    747,
    748,
    749,
    750,
    751,
    752,
    753,
    754,
    755,
    756,
    757,
    758,
    759,
    760,
    761,
    762,
    763,
    764,
    765,
    766,
    767,
    768,
    769,
    770,
    771,
    772,
    773,
    774,
    775,
    776,
    777,
    778,
    779,
    780,
    781,
    782,
    783,
    784,
    785,
    786,
    787,
    788,
    789,
    790,
    791,
    792,
    793,
    794,
    795,
    796,
    797,
    798,
    799,
    800,
    801,
    802,
    803,
    804,
    805,
    806,
    807,
    808,
    809,
    810,
    811,
    812,
    813,
    814,
    815,
    816,
    817,
    818,
    819,
    820,
    821,
    822,
    823,
    824,
    825
    ].

