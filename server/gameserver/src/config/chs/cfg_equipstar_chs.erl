%% coding: latin-1
%%: 实现
-module(cfg_equipstar_chs).
-compile(export_all).
-include("cfg_equipstar.hrl").
-include("logger.hrl").

getRow(0,0)->
    #equipstarCfg {
    level = 0,
    type = 0,
    desc = "白色0星",
    limit_level = 31,
    ratio = 0,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 1,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 500,
    allbonus = []
    };
getRow(0,1)->
    #equipstarCfg {
    level = 0,
    type = 1,
    desc = "白色0星",
    limit_level = 31,
    ratio = 0,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 1,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 500,
    allbonus = []
    };
getRow(0,2)->
    #equipstarCfg {
    level = 0,
    type = 2,
    desc = "白色0星",
    limit_level = 31,
    ratio = 0,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 1,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 500,
    allbonus = []
    };
getRow(0,3)->
    #equipstarCfg {
    level = 0,
    type = 3,
    desc = "白色0星",
    limit_level = 31,
    ratio = 0,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 1,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 500,
    allbonus = []
    };
getRow(0,4)->
    #equipstarCfg {
    level = 0,
    type = 4,
    desc = "白色0星",
    limit_level = 31,
    ratio = 0,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 1,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 500,
    allbonus = []
    };
getRow(0,5)->
    #equipstarCfg {
    level = 0,
    type = 5,
    desc = "白色0星",
    limit_level = 31,
    ratio = 0,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 1,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 500,
    allbonus = []
    };
getRow(0,6)->
    #equipstarCfg {
    level = 0,
    type = 6,
    desc = "白色0星",
    limit_level = 31,
    ratio = 0,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 1,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 500,
    allbonus = []
    };
getRow(0,7)->
    #equipstarCfg {
    level = 0,
    type = 7,
    desc = "白色0星",
    limit_level = 31,
    ratio = 0,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 1,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 500,
    allbonus = []
    };
getRow(1,0)->
    #equipstarCfg {
    level = 1,
    type = 0,
    desc = "白色1星",
    limit_level = 31,
    ratio = 0.13,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1000,
    allbonus = [{135,535,0},{136,53,0},{137,53,0},{138,53,0},{139,53,0}],
    starProps = [{136,0,129},{137,0,129},{140,0,147}]
    };
getRow(1,1)->
    #equipstarCfg {
    level = 1,
    type = 1,
    desc = "白色1星",
    limit_level = 31,
    ratio = 0.13,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1000,
    allbonus = [{135,535,0},{136,53,0},{137,53,0},{138,53,0},{139,53,0}],
    starProps = [{135,0,742},{160,0,52}]
    };
getRow(1,2)->
    #equipstarCfg {
    level = 1,
    type = 2,
    desc = "白色1星",
    limit_level = 31,
    ratio = 0.13,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1000,
    allbonus = [{135,535,0},{136,53,0},{137,53,0},{138,53,0},{139,53,0}],
    starProps = [{136,0,55},{137,0,55},{145,0,111}]
    };
getRow(1,3)->
    #equipstarCfg {
    level = 1,
    type = 3,
    desc = "白色1星",
    limit_level = 31,
    ratio = 0.13,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1000,
    allbonus = [{135,535,0},{136,53,0},{137,53,0},{138,53,0},{139,53,0}],
    starProps = [{135,0,1113},{142,0,89}]
    };
getRow(1,4)->
    #equipstarCfg {
    level = 1,
    type = 4,
    desc = "白色1星",
    limit_level = 31,
    ratio = 0.13,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1000,
    allbonus = [{135,535,0},{136,53,0},{137,53,0},{138,53,0},{139,53,0}],
    starProps = [{138,0,55},{146,0,74}]
    };
getRow(1,5)->
    #equipstarCfg {
    level = 1,
    type = 5,
    desc = "白色1星",
    limit_level = 31,
    ratio = 0.13,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1000,
    allbonus = [{135,535,0},{136,53,0},{137,53,0},{138,53,0},{139,53,0}],
    starProps = [{138,0,129},{143,0,75}]
    };
getRow(1,6)->
    #equipstarCfg {
    level = 1,
    type = 6,
    desc = "白色1星",
    limit_level = 31,
    ratio = 0.13,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1000,
    allbonus = [{135,535,0},{136,53,0},{137,53,0},{138,53,0},{139,53,0}],
    starProps = [{139,0,55},{144,0,77}]
    };
getRow(1,7)->
    #equipstarCfg {
    level = 1,
    type = 7,
    desc = "白色1星",
    limit_level = 31,
    ratio = 0.13,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1000,
    allbonus = [{135,535,0},{136,53,0},{137,53,0},{138,53,0},{139,53,0}],
    starProps = [{139,0,129},{141,0,104}]
    };
getRow(2,0)->
    #equipstarCfg {
    level = 2,
    type = 0,
    desc = "白色2星",
    limit_level = 31,
    ratio = 0.16,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1500,
    allbonus = [{135,770,0},{136,77,0},{137,77,0},{138,77,0},{139,77,0}],
    starProps = [{136,0.07,201},{137,0.07,201},{140,0.1,228}]
    };
getRow(2,1)->
    #equipstarCfg {
    level = 2,
    type = 1,
    desc = "白色2星",
    limit_level = 31,
    ratio = 0.16,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1500,
    allbonus = [{135,770,0},{136,77,0},{137,77,0},{138,77,0},{139,77,0}],
    starProps = [{135,0.04,1149},{160,0.1,80}]
    };
getRow(2,2)->
    #equipstarCfg {
    level = 2,
    type = 2,
    desc = "白色2星",
    limit_level = 31,
    ratio = 0.16,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1500,
    allbonus = [{135,770,0},{136,77,0},{137,77,0},{138,77,0},{139,77,0}],
    starProps = [{136,0.03,86},{137,0.03,86},{145,0.1,172}]
    };
getRow(2,3)->
    #equipstarCfg {
    level = 2,
    type = 3,
    desc = "白色2星",
    limit_level = 31,
    ratio = 0.16,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1500,
    allbonus = [{135,770,0},{136,77,0},{137,77,0},{138,77,0},{139,77,0}],
    starProps = [{135,0.06,1724},{142,0.1,138}]
    };
getRow(2,4)->
    #equipstarCfg {
    level = 2,
    type = 4,
    desc = "白色2星",
    limit_level = 31,
    ratio = 0.16,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1500,
    allbonus = [{135,770,0},{136,77,0},{137,77,0},{138,77,0},{139,77,0}],
    starProps = [{138,0.03,86},{146,0.1,114}]
    };
getRow(2,5)->
    #equipstarCfg {
    level = 2,
    type = 5,
    desc = "白色2星",
    limit_level = 31,
    ratio = 0.16,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1500,
    allbonus = [{135,770,0},{136,77,0},{137,77,0},{138,77,0},{139,77,0}],
    starProps = [{138,0.07,201},{143,0.1,117}]
    };
getRow(2,6)->
    #equipstarCfg {
    level = 2,
    type = 6,
    desc = "白色2星",
    limit_level = 31,
    ratio = 0.16,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1500,
    allbonus = [{135,770,0},{136,77,0},{137,77,0},{138,77,0},{139,77,0}],
    starProps = [{139,0.03,86},{144,0.1,120}]
    };
getRow(2,7)->
    #equipstarCfg {
    level = 2,
    type = 7,
    desc = "白色2星",
    limit_level = 31,
    ratio = 0.16,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1500,
    allbonus = [{135,770,0},{136,77,0},{137,77,0},{138,77,0},{139,77,0}],
    starProps = [{139,0.07,201},{141,0.1,161}]
    };
getRow(3,0)->
    #equipstarCfg {
    level = 3,
    type = 0,
    desc = "白色3星",
    limit_level = 31,
    ratio = 0.19,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2000,
    allbonus = [{135,1249,0},{136,124,0},{137,124,0},{138,124,0},{139,124,0}],
    starProps = [{136,0.175,320},{137,0.175,320},{140,0.25,364}]
    };
getRow(3,1)->
    #equipstarCfg {
    level = 3,
    type = 1,
    desc = "白色3星",
    limit_level = 31,
    ratio = 0.19,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2000,
    allbonus = [{135,1249,0},{136,124,0},{137,124,0},{138,124,0},{139,124,0}],
    starProps = [{135,0.1,1833},{160,0.25,129}]
    };
getRow(3,2)->
    #equipstarCfg {
    level = 3,
    type = 2,
    desc = "白色3星",
    limit_level = 31,
    ratio = 0.19,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2000,
    allbonus = [{135,1249,0},{136,124,0},{137,124,0},{138,124,0},{139,124,0}],
    starProps = [{136,0.075,137},{137,0.075,137},{145,0.25,274}]
    };
getRow(3,3)->
    #equipstarCfg {
    level = 3,
    type = 3,
    desc = "白色3星",
    limit_level = 31,
    ratio = 0.19,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2000,
    allbonus = [{135,1249,0},{136,124,0},{137,124,0},{138,124,0},{139,124,0}],
    starProps = [{135,0.15,2749},{142,0.25,220}]
    };
getRow(3,4)->
    #equipstarCfg {
    level = 3,
    type = 4,
    desc = "白色3星",
    limit_level = 31,
    ratio = 0.19,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2000,
    allbonus = [{135,1249,0},{136,124,0},{137,124,0},{138,124,0},{139,124,0}],
    starProps = [{138,0.075,137},{146,0.25,183}]
    };
getRow(3,5)->
    #equipstarCfg {
    level = 3,
    type = 5,
    desc = "白色3星",
    limit_level = 31,
    ratio = 0.19,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2000,
    allbonus = [{135,1249,0},{136,124,0},{137,124,0},{138,124,0},{139,124,0}],
    starProps = [{138,0.175,320},{143,0.25,186}]
    };
getRow(3,6)->
    #equipstarCfg {
    level = 3,
    type = 6,
    desc = "白色3星",
    limit_level = 31,
    ratio = 0.19,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2000,
    allbonus = [{135,1249,0},{136,124,0},{137,124,0},{138,124,0},{139,124,0}],
    starProps = [{139,0.075,137},{144,0.25,192}]
    };
getRow(3,7)->
    #equipstarCfg {
    level = 3,
    type = 7,
    desc = "白色3星",
    limit_level = 31,
    ratio = 0.19,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2000,
    allbonus = [{135,1249,0},{136,124,0},{137,124,0},{138,124,0},{139,124,0}],
    starProps = [{139,0.175,320},{141,0.25,257}]
    };
getRow(4,0)->
    #equipstarCfg {
    level = 4,
    type = 0,
    desc = "白色4星",
    limit_level = 31,
    ratio = 0.22,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2500,
    allbonus = [{135,1902,0},{136,190,0},{137,190,0},{138,190,0},{139,190,0}],
    starProps = [{136,0.245,440},{137,0.245,440},{140,0.35,501}]
    };
getRow(4,1)->
    #equipstarCfg {
    level = 4,
    type = 1,
    desc = "白色4星",
    limit_level = 31,
    ratio = 0.22,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2500,
    allbonus = [{135,1902,0},{136,190,0},{137,190,0},{138,190,0},{139,190,0}],
    starProps = [{135,0.14,2517},{160,0.35,177}]
    };
getRow(4,2)->
    #equipstarCfg {
    level = 4,
    type = 2,
    desc = "白色4星",
    limit_level = 31,
    ratio = 0.22,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2500,
    allbonus = [{135,1902,0},{136,190,0},{137,190,0},{138,190,0},{139,190,0}],
    starProps = [{136,0.105,188},{137,0.105,188},{145,0.35,377}]
    };
getRow(4,3)->
    #equipstarCfg {
    level = 4,
    type = 3,
    desc = "白色4星",
    limit_level = 31,
    ratio = 0.22,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2500,
    allbonus = [{135,1902,0},{136,190,0},{137,190,0},{138,190,0},{139,190,0}],
    starProps = [{135,0.21,3776},{142,0.35,303}]
    };
getRow(4,4)->
    #equipstarCfg {
    level = 4,
    type = 4,
    desc = "白色4星",
    limit_level = 31,
    ratio = 0.22,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2500,
    allbonus = [{135,1902,0},{136,190,0},{137,190,0},{138,190,0},{139,190,0}],
    starProps = [{138,0.105,188},{146,0.35,251}]
    };
getRow(4,5)->
    #equipstarCfg {
    level = 4,
    type = 5,
    desc = "白色4星",
    limit_level = 31,
    ratio = 0.22,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2500,
    allbonus = [{135,1902,0},{136,190,0},{137,190,0},{138,190,0},{139,190,0}],
    starProps = [{138,0.245,440},{143,0.35,256}]
    };
getRow(4,6)->
    #equipstarCfg {
    level = 4,
    type = 6,
    desc = "白色4星",
    limit_level = 31,
    ratio = 0.22,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2500,
    allbonus = [{135,1902,0},{136,190,0},{137,190,0},{138,190,0},{139,190,0}],
    starProps = [{139,0.105,188},{144,0.35,263}]
    };
getRow(4,7)->
    #equipstarCfg {
    level = 4,
    type = 7,
    desc = "白色4星",
    limit_level = 31,
    ratio = 0.22,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2500,
    allbonus = [{135,1902,0},{136,190,0},{137,190,0},{138,190,0},{139,190,0}],
    starProps = [{139,0.245,440},{141,0.35,353}]
    };
getRow(5,0)->
    #equipstarCfg {
    level = 5,
    type = 0,
    desc = "白色5星",
    limit_level = 31,
    ratio = 0.25,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3000,
    allbonus = [{135,2701,0},{136,270,0},{137,270,0},{138,270,0},{139,270,0}],
    starProps = [{136,0.315,532},{137,0.315,532},{140,0.45,605}]
    };
getRow(5,1)->
    #equipstarCfg {
    level = 5,
    type = 1,
    desc = "白色5星",
    limit_level = 31,
    ratio = 0.25,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3000,
    allbonus = [{135,2701,0},{136,270,0},{137,270,0},{138,270,0},{139,270,0}],
    starProps = [{135,0.18,3044},{160,0.45,214}]
    };
getRow(5,2)->
    #equipstarCfg {
    level = 5,
    type = 2,
    desc = "白色5星",
    limit_level = 31,
    ratio = 0.25,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3000,
    allbonus = [{135,2701,0},{136,270,0},{137,270,0},{138,270,0},{139,270,0}],
    starProps = [{136,0.135,228},{137,0.135,228},{145,0.45,456}]
    };
getRow(5,3)->
    #equipstarCfg {
    level = 5,
    type = 3,
    desc = "白色5星",
    limit_level = 31,
    ratio = 0.25,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3000,
    allbonus = [{135,2701,0},{136,270,0},{137,270,0},{138,270,0},{139,270,0}],
    starProps = [{135,0.27,4566},{142,0.45,366}]
    };
getRow(5,4)->
    #equipstarCfg {
    level = 5,
    type = 4,
    desc = "白色5星",
    limit_level = 31,
    ratio = 0.25,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3000,
    allbonus = [{135,2701,0},{136,270,0},{137,270,0},{138,270,0},{139,270,0}],
    starProps = [{138,0.135,228},{146,0.45,304}]
    };
getRow(5,5)->
    #equipstarCfg {
    level = 5,
    type = 5,
    desc = "白色5星",
    limit_level = 31,
    ratio = 0.25,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3000,
    allbonus = [{135,2701,0},{136,270,0},{137,270,0},{138,270,0},{139,270,0}],
    starProps = [{138,0.315,532},{143,0.45,310}]
    };
getRow(5,6)->
    #equipstarCfg {
    level = 5,
    type = 6,
    desc = "白色5星",
    limit_level = 31,
    ratio = 0.25,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3000,
    allbonus = [{135,2701,0},{136,270,0},{137,270,0},{138,270,0},{139,270,0}],
    starProps = [{139,0.135,228},{144,0.45,319}]
    };
getRow(5,7)->
    #equipstarCfg {
    level = 5,
    type = 7,
    desc = "白色5星",
    limit_level = 31,
    ratio = 0.25,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3000,
    allbonus = [{135,2701,0},{136,270,0},{137,270,0},{138,270,0},{139,270,0}],
    starProps = [{139,0.315,532},{141,0.45,427}]
    };
getRow(6,0)->
    #equipstarCfg {
    level = 6,
    type = 0,
    desc = "[13E826]绿色1星[-]",
    limit_level = 31,
    ratio = 0.28,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.85,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3500,
    allbonus = [{135,3631,0},{136,363,0},{137,363,0},{138,363,0},{139,363,0}],
    starProps = [{136,0.35,648},{137,0.35,648},{140,0.5,737}]
    };
getRow(6,1)->
    #equipstarCfg {
    level = 6,
    type = 1,
    desc = "[13E826]绿色1星[-]",
    limit_level = 31,
    ratio = 0.28,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.85,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3500,
    allbonus = [{135,3631,0},{136,363,0},{137,363,0},{138,363,0},{139,363,0}],
    starProps = [{135,0.2,3704},{160,0.5,260}]
    };
getRow(6,2)->
    #equipstarCfg {
    level = 6,
    type = 2,
    desc = "[13E826]绿色1星[-]",
    limit_level = 31,
    ratio = 0.28,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.85,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3500,
    allbonus = [{135,3631,0},{136,363,0},{137,363,0},{138,363,0},{139,363,0}],
    starProps = [{136,0.15,277},{137,0.15,277},{145,0.5,555}]
    };
getRow(6,3)->
    #equipstarCfg {
    level = 6,
    type = 3,
    desc = "[13E826]绿色1星[-]",
    limit_level = 31,
    ratio = 0.28,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.85,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3500,
    allbonus = [{135,3631,0},{136,363,0},{137,363,0},{138,363,0},{139,363,0}],
    starProps = [{135,0.3,5557},{142,0.5,445}]
    };
getRow(6,4)->
    #equipstarCfg {
    level = 6,
    type = 4,
    desc = "[13E826]绿色1星[-]",
    limit_level = 31,
    ratio = 0.28,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.85,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3500,
    allbonus = [{135,3631,0},{136,363,0},{137,363,0},{138,363,0},{139,363,0}],
    starProps = [{138,0.15,277},{146,0.5,370}]
    };
getRow(6,5)->
    #equipstarCfg {
    level = 6,
    type = 5,
    desc = "[13E826]绿色1星[-]",
    limit_level = 31,
    ratio = 0.28,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.85,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3500,
    allbonus = [{135,3631,0},{136,363,0},{137,363,0},{138,363,0},{139,363,0}],
    starProps = [{138,0.35,648},{143,0.5,377}]
    };
getRow(6,6)->
    #equipstarCfg {
    level = 6,
    type = 6,
    desc = "[13E826]绿色1星[-]",
    limit_level = 31,
    ratio = 0.28,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.85,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3500,
    allbonus = [{135,3631,0},{136,363,0},{137,363,0},{138,363,0},{139,363,0}],
    starProps = [{139,0.15,277},{144,0.5,388}]
    };
getRow(6,7)->
    #equipstarCfg {
    level = 6,
    type = 7,
    desc = "[13E826]绿色1星[-]",
    limit_level = 31,
    ratio = 0.28,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.85,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3500,
    allbonus = [{135,3631,0},{136,363,0},{137,363,0},{138,363,0},{139,363,0}],
    starProps = [{139,0.35,648},{141,0.5,519}]
    };
getRow(7,0)->
    #equipstarCfg {
    level = 7,
    type = 0,
    desc = "[13E826]绿色2星[-]",
    limit_level = 31,
    ratio = 0.31,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.84,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4000,
    allbonus = [{135,4680,0},{136,468,0},{137,468,0},{138,468,0},{139,468,0}],
    starProps = [{136,0.385,746},{137,0.385,746},{140,0.55,849}]
    };
getRow(7,1)->
    #equipstarCfg {
    level = 7,
    type = 1,
    desc = "[13E826]绿色2星[-]",
    limit_level = 31,
    ratio = 0.31,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.84,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4000,
    allbonus = [{135,4680,0},{136,468,0},{137,468,0},{138,468,0},{139,468,0}],
    starProps = [{135,0.22,4267},{160,0.55,300}]
    };
getRow(7,2)->
    #equipstarCfg {
    level = 7,
    type = 2,
    desc = "[13E826]绿色2星[-]",
    limit_level = 31,
    ratio = 0.31,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.84,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4000,
    allbonus = [{135,4680,0},{136,468,0},{137,468,0},{138,468,0},{139,468,0}],
    starProps = [{136,0.165,320},{137,0.165,320},{145,0.55,640}]
    };
getRow(7,3)->
    #equipstarCfg {
    level = 7,
    type = 3,
    desc = "[13E826]绿色2星[-]",
    limit_level = 31,
    ratio = 0.31,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.84,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4000,
    allbonus = [{135,4680,0},{136,468,0},{137,468,0},{138,468,0},{139,468,0}],
    starProps = [{135,0.33,6400},{142,0.55,513}]
    };
getRow(7,4)->
    #equipstarCfg {
    level = 7,
    type = 4,
    desc = "[13E826]绿色2星[-]",
    limit_level = 31,
    ratio = 0.31,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.84,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4000,
    allbonus = [{135,4680,0},{136,468,0},{137,468,0},{138,468,0},{139,468,0}],
    starProps = [{138,0.165,320},{146,0.55,426}]
    };
getRow(7,5)->
    #equipstarCfg {
    level = 7,
    type = 5,
    desc = "[13E826]绿色2星[-]",
    limit_level = 31,
    ratio = 0.31,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.84,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4000,
    allbonus = [{135,4680,0},{136,468,0},{137,468,0},{138,468,0},{139,468,0}],
    starProps = [{138,0.385,746},{143,0.55,434}]
    };
getRow(7,6)->
    #equipstarCfg {
    level = 7,
    type = 6,
    desc = "[13E826]绿色2星[-]",
    limit_level = 31,
    ratio = 0.31,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.84,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4000,
    allbonus = [{135,4680,0},{136,468,0},{137,468,0},{138,468,0},{139,468,0}],
    starProps = [{139,0.165,320},{144,0.55,447}]
    };
getRow(7,7)->
    #equipstarCfg {
    level = 7,
    type = 7,
    desc = "[13E826]绿色2星[-]",
    limit_level = 31,
    ratio = 0.31,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.84,
    cost_item = 225,
    cost_num = 3,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4000,
    allbonus = [{135,4680,0},{136,468,0},{137,468,0},{138,468,0},{139,468,0}],
    starProps = [{139,0.385,746},{141,0.55,598}]
    };
getRow(8,0)->
    #equipstarCfg {
    level = 8,
    type = 0,
    desc = "[13E826]绿色3星[-]",
    limit_level = 31,
    ratio = 0.34,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.83,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4500,
    allbonus = [{135,5840,0},{136,584,0},{137,584,0},{138,584,0},{139,584,0}],
    starProps = [{136,0.42,821},{137,0.42,821},{140,0.6,934}]
    };
getRow(8,1)->
    #equipstarCfg {
    level = 8,
    type = 1,
    desc = "[13E826]绿色3星[-]",
    limit_level = 31,
    ratio = 0.34,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.83,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4500,
    allbonus = [{135,5840,0},{136,584,0},{137,584,0},{138,584,0},{139,584,0}],
    starProps = [{135,0.24,4696},{160,0.6,330}]
    };
getRow(8,2)->
    #equipstarCfg {
    level = 8,
    type = 2,
    desc = "[13E826]绿色3星[-]",
    limit_level = 31,
    ratio = 0.34,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.83,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4500,
    allbonus = [{135,5840,0},{136,584,0},{137,584,0},{138,584,0},{139,584,0}],
    starProps = [{136,0.18,352},{137,0.18,352},{145,0.6,704}]
    };
getRow(8,3)->
    #equipstarCfg {
    level = 8,
    type = 3,
    desc = "[13E826]绿色3星[-]",
    limit_level = 31,
    ratio = 0.34,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.83,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4500,
    allbonus = [{135,5840,0},{136,584,0},{137,584,0},{138,584,0},{139,584,0}],
    starProps = [{135,0.36,7044},{142,0.6,565}]
    };
getRow(8,4)->
    #equipstarCfg {
    level = 8,
    type = 4,
    desc = "[13E826]绿色3星[-]",
    limit_level = 31,
    ratio = 0.34,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.83,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4500,
    allbonus = [{135,5840,0},{136,584,0},{137,584,0},{138,584,0},{139,584,0}],
    starProps = [{138,0.18,352},{146,0.6,469}]
    };
getRow(8,5)->
    #equipstarCfg {
    level = 8,
    type = 5,
    desc = "[13E826]绿色3星[-]",
    limit_level = 31,
    ratio = 0.34,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.83,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4500,
    allbonus = [{135,5840,0},{136,584,0},{137,584,0},{138,584,0},{139,584,0}],
    starProps = [{138,0.42,821},{143,0.6,478}]
    };
getRow(8,6)->
    #equipstarCfg {
    level = 8,
    type = 6,
    desc = "[13E826]绿色3星[-]",
    limit_level = 31,
    ratio = 0.34,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.83,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4500,
    allbonus = [{135,5840,0},{136,584,0},{137,584,0},{138,584,0},{139,584,0}],
    starProps = [{139,0.18,352},{144,0.6,492}]
    };
getRow(8,7)->
    #equipstarCfg {
    level = 8,
    type = 7,
    desc = "[13E826]绿色3星[-]",
    limit_level = 31,
    ratio = 0.34,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.83,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4500,
    allbonus = [{135,5840,0},{136,584,0},{137,584,0},{138,584,0},{139,584,0}],
    starProps = [{139,0.42,821},{141,0.6,658}]
    };
getRow(9,0)->
    #equipstarCfg {
    level = 9,
    type = 0,
    desc = "[13E826]绿色4星[-]",
    limit_level = 31,
    ratio = 0.37,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.82,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5000,
    allbonus = [{135,7103,0},{136,710,0},{137,710,0},{138,710,0},{139,710,0}],
    starProps = [{136,0.455,868},{137,0.455,868},{140,0.65,987}]
    };
getRow(9,1)->
    #equipstarCfg {
    level = 9,
    type = 1,
    desc = "[13E826]绿色4星[-]",
    limit_level = 31,
    ratio = 0.37,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.82,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5000,
    allbonus = [{135,7103,0},{136,710,0},{137,710,0},{138,710,0},{139,710,0}],
    starProps = [{135,0.26,4961},{160,0.65,349}]
    };
getRow(9,2)->
    #equipstarCfg {
    level = 9,
    type = 2,
    desc = "[13E826]绿色4星[-]",
    limit_level = 31,
    ratio = 0.37,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.82,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5000,
    allbonus = [{135,7103,0},{136,710,0},{137,710,0},{138,710,0},{139,710,0}],
    starProps = [{136,0.195,372},{137,0.195,372},{145,0.65,744}]
    };
getRow(9,3)->
    #equipstarCfg {
    level = 9,
    type = 3,
    desc = "[13E826]绿色4星[-]",
    limit_level = 31,
    ratio = 0.37,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.82,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5000,
    allbonus = [{135,7103,0},{136,710,0},{137,710,0},{138,710,0},{139,710,0}],
    starProps = [{135,0.39,7442},{142,0.65,597}]
    };
getRow(9,4)->
    #equipstarCfg {
    level = 9,
    type = 4,
    desc = "[13E826]绿色4星[-]",
    limit_level = 31,
    ratio = 0.37,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.82,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5000,
    allbonus = [{135,7103,0},{136,710,0},{137,710,0},{138,710,0},{139,710,0}],
    starProps = [{138,0.195,372},{146,0.65,496}]
    };
getRow(9,5)->
    #equipstarCfg {
    level = 9,
    type = 5,
    desc = "[13E826]绿色4星[-]",
    limit_level = 31,
    ratio = 0.37,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.82,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5000,
    allbonus = [{135,7103,0},{136,710,0},{137,710,0},{138,710,0},{139,710,0}],
    starProps = [{138,0.455,868},{143,0.65,505}]
    };
getRow(9,6)->
    #equipstarCfg {
    level = 9,
    type = 6,
    desc = "[13E826]绿色4星[-]",
    limit_level = 31,
    ratio = 0.37,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.82,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5000,
    allbonus = [{135,7103,0},{136,710,0},{137,710,0},{138,710,0},{139,710,0}],
    starProps = [{139,0.195,372},{144,0.65,520}]
    };
getRow(9,7)->
    #equipstarCfg {
    level = 9,
    type = 7,
    desc = "[13E826]绿色4星[-]",
    limit_level = 31,
    ratio = 0.37,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.82,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5000,
    allbonus = [{135,7103,0},{136,710,0},{137,710,0},{138,710,0},{139,710,0}],
    starProps = [{139,0.455,868},{141,0.65,696}]
    };
getRow(10,0)->
    #equipstarCfg {
    level = 10,
    type = 0,
    desc = "[13E826]绿色5星[-]",
    limit_level = 31,
    ratio = 0.4,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.8,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5500,
    allbonus = [{135,8466,0},{136,846,0},{137,846,0},{138,846,0},{139,846,0}],
    starProps = [{136,0.49,880},{137,0.49,880},{140,0.7,1002}]
    };
getRow(10,1)->
    #equipstarCfg {
    level = 10,
    type = 1,
    desc = "[13E826]绿色5星[-]",
    limit_level = 31,
    ratio = 0.4,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.8,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5500,
    allbonus = [{135,8466,0},{136,846,0},{137,846,0},{138,846,0},{139,846,0}],
    starProps = [{135,0.28,5033},{160,0.7,354}]
    };
getRow(10,2)->
    #equipstarCfg {
    level = 10,
    type = 2,
    desc = "[13E826]绿色5星[-]",
    limit_level = 31,
    ratio = 0.4,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.8,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5500,
    allbonus = [{135,8466,0},{136,846,0},{137,846,0},{138,846,0},{139,846,0}],
    starProps = [{136,0.21,377},{137,0.21,377},{145,0.7,755}]
    };
getRow(10,3)->
    #equipstarCfg {
    level = 10,
    type = 3,
    desc = "[13E826]绿色5星[-]",
    limit_level = 31,
    ratio = 0.4,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.8,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5500,
    allbonus = [{135,8466,0},{136,846,0},{137,846,0},{138,846,0},{139,846,0}],
    starProps = [{135,0.42,7550},{142,0.7,605}]
    };
getRow(10,4)->
    #equipstarCfg {
    level = 10,
    type = 4,
    desc = "[13E826]绿色5星[-]",
    limit_level = 31,
    ratio = 0.4,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.8,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5500,
    allbonus = [{135,8466,0},{136,846,0},{137,846,0},{138,846,0},{139,846,0}],
    starProps = [{138,0.21,377},{146,0.7,503}]
    };
getRow(10,5)->
    #equipstarCfg {
    level = 10,
    type = 5,
    desc = "[13E826]绿色5星[-]",
    limit_level = 31,
    ratio = 0.4,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.8,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5500,
    allbonus = [{135,8466,0},{136,846,0},{137,846,0},{138,846,0},{139,846,0}],
    starProps = [{138,0.49,880},{143,0.7,512}]
    };
getRow(10,6)->
    #equipstarCfg {
    level = 10,
    type = 6,
    desc = "[13E826]绿色5星[-]",
    limit_level = 31,
    ratio = 0.4,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.8,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5500,
    allbonus = [{135,8466,0},{136,846,0},{137,846,0},{138,846,0},{139,846,0}],
    starProps = [{139,0.21,377},{144,0.7,527}]
    };
getRow(10,7)->
    #equipstarCfg {
    level = 10,
    type = 7,
    desc = "[13E826]绿色5星[-]",
    limit_level = 31,
    ratio = 0.4,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.8,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5500,
    allbonus = [{135,8466,0},{136,846,0},{137,846,0},{138,846,0},{139,846,0}],
    starProps = [{139,0.49,880},{141,0.7,706}]
    };
getRow(11,0)->
    #equipstarCfg {
    level = 11,
    type = 0,
    desc = "[4674F9]蓝色1星[-]",
    limit_level = 31,
    ratio = 0.43,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.7,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6000,
    allbonus = [{135,9922,0},{136,992,0},{137,992,0},{138,992,0},{139,992,0}],
    starProps = [{136,0.518,889},{137,0.518,889},{140,0.74,1011}]
    };
getRow(11,1)->
    #equipstarCfg {
    level = 11,
    type = 1,
    desc = "[4674F9]蓝色1星[-]",
    limit_level = 31,
    ratio = 0.43,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.7,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6000,
    allbonus = [{135,9922,0},{136,992,0},{137,992,0},{138,992,0},{139,992,0}],
    starProps = [{135,0.296,5081},{160,0.74,357}]
    };
getRow(11,2)->
    #equipstarCfg {
    level = 11,
    type = 2,
    desc = "[4674F9]蓝色1星[-]",
    limit_level = 31,
    ratio = 0.43,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.7,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6000,
    allbonus = [{135,9922,0},{136,992,0},{137,992,0},{138,992,0},{139,992,0}],
    starProps = [{136,0.222,381},{137,0.222,381},{145,0.74,762}]
    };
getRow(11,3)->
    #equipstarCfg {
    level = 11,
    type = 3,
    desc = "[4674F9]蓝色1星[-]",
    limit_level = 31,
    ratio = 0.43,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.7,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6000,
    allbonus = [{135,9922,0},{136,992,0},{137,992,0},{138,992,0},{139,992,0}],
    starProps = [{135,0.444,7621},{142,0.74,611}]
    };
getRow(11,4)->
    #equipstarCfg {
    level = 11,
    type = 4,
    desc = "[4674F9]蓝色1星[-]",
    limit_level = 31,
    ratio = 0.43,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.7,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6000,
    allbonus = [{135,9922,0},{136,992,0},{137,992,0},{138,992,0},{139,992,0}],
    starProps = [{138,0.222,381},{146,0.74,508}]
    };
getRow(11,5)->
    #equipstarCfg {
    level = 11,
    type = 5,
    desc = "[4674F9]蓝色1星[-]",
    limit_level = 31,
    ratio = 0.43,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.7,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6000,
    allbonus = [{135,9922,0},{136,992,0},{137,992,0},{138,992,0},{139,992,0}],
    starProps = [{138,0.518,889},{143,0.74,517}]
    };
getRow(11,6)->
    #equipstarCfg {
    level = 11,
    type = 6,
    desc = "[4674F9]蓝色1星[-]",
    limit_level = 31,
    ratio = 0.43,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.7,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6000,
    allbonus = [{135,9922,0},{136,992,0},{137,992,0},{138,992,0},{139,992,0}],
    starProps = [{139,0.222,381},{144,0.74,532}]
    };
getRow(11,7)->
    #equipstarCfg {
    level = 11,
    type = 7,
    desc = "[4674F9]蓝色1星[-]",
    limit_level = 31,
    ratio = 0.43,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.7,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6000,
    allbonus = [{135,9922,0},{136,992,0},{137,992,0},{138,992,0},{139,992,0}],
    starProps = [{139,0.518,889},{141,0.74,712}]
    };
getRow(12,0)->
    #equipstarCfg {
    level = 12,
    type = 0,
    desc = "[4674F9]蓝色2星[-]",
    limit_level = 31,
    ratio = 0.46,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.68,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6500,
    allbonus = [{135,11468,0},{136,1146,0},{137,1146,0},{138,1146,0},{139,1146,0}],
    starProps = [{136,0.532,943},{137,0.532,943},{140,0.76,1073}]
    };
getRow(12,1)->
    #equipstarCfg {
    level = 12,
    type = 1,
    desc = "[4674F9]蓝色2星[-]",
    limit_level = 31,
    ratio = 0.46,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.68,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6500,
    allbonus = [{135,11468,0},{136,1146,0},{137,1146,0},{138,1146,0},{139,1146,0}],
    starProps = [{135,0.304,5390},{160,0.76,379}]
    };
getRow(12,2)->
    #equipstarCfg {
    level = 12,
    type = 2,
    desc = "[4674F9]蓝色2星[-]",
    limit_level = 31,
    ratio = 0.46,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.68,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6500,
    allbonus = [{135,11468,0},{136,1146,0},{137,1146,0},{138,1146,0},{139,1146,0}],
    starProps = [{136,0.228,404},{137,0.228,404},{145,0.76,808}]
    };
getRow(12,3)->
    #equipstarCfg {
    level = 12,
    type = 3,
    desc = "[4674F9]蓝色2星[-]",
    limit_level = 31,
    ratio = 0.46,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.68,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6500,
    allbonus = [{135,11468,0},{136,1146,0},{137,1146,0},{138,1146,0},{139,1146,0}],
    starProps = [{135,0.456,8086},{142,0.76,648}]
    };
getRow(12,4)->
    #equipstarCfg {
    level = 12,
    type = 4,
    desc = "[4674F9]蓝色2星[-]",
    limit_level = 31,
    ratio = 0.46,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.68,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6500,
    allbonus = [{135,11468,0},{136,1146,0},{137,1146,0},{138,1146,0},{139,1146,0}],
    starProps = [{138,0.228,404},{146,0.76,539}]
    };
getRow(12,5)->
    #equipstarCfg {
    level = 12,
    type = 5,
    desc = "[4674F9]蓝色2星[-]",
    limit_level = 31,
    ratio = 0.46,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.68,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6500,
    allbonus = [{135,11468,0},{136,1146,0},{137,1146,0},{138,1146,0},{139,1146,0}],
    starProps = [{138,0.532,943},{143,0.76,549}]
    };
getRow(12,6)->
    #equipstarCfg {
    level = 12,
    type = 6,
    desc = "[4674F9]蓝色2星[-]",
    limit_level = 31,
    ratio = 0.46,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.68,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6500,
    allbonus = [{135,11468,0},{136,1146,0},{137,1146,0},{138,1146,0},{139,1146,0}],
    starProps = [{139,0.228,404},{144,0.76,565}]
    };
getRow(12,7)->
    #equipstarCfg {
    level = 12,
    type = 7,
    desc = "[4674F9]蓝色2星[-]",
    limit_level = 31,
    ratio = 0.46,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.68,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6500,
    allbonus = [{135,11468,0},{136,1146,0},{137,1146,0},{138,1146,0},{139,1146,0}],
    starProps = [{139,0.532,943},{141,0.76,756}]
    };
getRow(13,0)->
    #equipstarCfg {
    level = 13,
    type = 0,
    desc = "[4674F9]蓝色3星[-]",
    limit_level = 31,
    ratio = 0.49,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 3,
    odd = 0.66,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7000,
    allbonus = [{135,13102,0},{136,1310,0},{137,1310,0},{138,1310,0},{139,1310,0}],
    starProps = [{136,0.546,982},{137,0.546,982},{140,0.78,1118}]
    };
getRow(13,1)->
    #equipstarCfg {
    level = 13,
    type = 1,
    desc = "[4674F9]蓝色3星[-]",
    limit_level = 31,
    ratio = 0.49,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 3,
    odd = 0.66,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7000,
    allbonus = [{135,13102,0},{136,1310,0},{137,1310,0},{138,1310,0},{139,1310,0}],
    starProps = [{135,0.312,5616},{160,0.78,395}]
    };
getRow(13,2)->
    #equipstarCfg {
    level = 13,
    type = 2,
    desc = "[4674F9]蓝色3星[-]",
    limit_level = 31,
    ratio = 0.49,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 3,
    odd = 0.66,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7000,
    allbonus = [{135,13102,0},{136,1310,0},{137,1310,0},{138,1310,0},{139,1310,0}],
    starProps = [{136,0.234,421},{137,0.234,421},{145,0.78,842}]
    };
getRow(13,3)->
    #equipstarCfg {
    level = 13,
    type = 3,
    desc = "[4674F9]蓝色3星[-]",
    limit_level = 31,
    ratio = 0.49,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 3,
    odd = 0.66,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7000,
    allbonus = [{135,13102,0},{136,1310,0},{137,1310,0},{138,1310,0},{139,1310,0}],
    starProps = [{135,0.468,8425},{142,0.78,676}]
    };
getRow(13,4)->
    #equipstarCfg {
    level = 13,
    type = 4,
    desc = "[4674F9]蓝色3星[-]",
    limit_level = 31,
    ratio = 0.49,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 3,
    odd = 0.66,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7000,
    allbonus = [{135,13102,0},{136,1310,0},{137,1310,0},{138,1310,0},{139,1310,0}],
    starProps = [{138,0.234,421},{146,0.78,561}]
    };
getRow(13,5)->
    #equipstarCfg {
    level = 13,
    type = 5,
    desc = "[4674F9]蓝色3星[-]",
    limit_level = 31,
    ratio = 0.49,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 3,
    odd = 0.66,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7000,
    allbonus = [{135,13102,0},{136,1310,0},{137,1310,0},{138,1310,0},{139,1310,0}],
    starProps = [{138,0.546,982},{143,0.78,572}]
    };
getRow(13,6)->
    #equipstarCfg {
    level = 13,
    type = 6,
    desc = "[4674F9]蓝色3星[-]",
    limit_level = 31,
    ratio = 0.49,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 3,
    odd = 0.66,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7000,
    allbonus = [{135,13102,0},{136,1310,0},{137,1310,0},{138,1310,0},{139,1310,0}],
    starProps = [{139,0.234,421},{144,0.78,588}]
    };
getRow(13,7)->
    #equipstarCfg {
    level = 13,
    type = 7,
    desc = "[4674F9]蓝色3星[-]",
    limit_level = 31,
    ratio = 0.49,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 3,
    odd = 0.66,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7000,
    allbonus = [{135,13102,0},{136,1310,0},{137,1310,0},{138,1310,0},{139,1310,0}],
    starProps = [{139,0.546,982},{141,0.78,787}]
    };
getRow(14,0)->
    #equipstarCfg {
    level = 14,
    type = 0,
    desc = "[4674F9]蓝色4星[-]",
    limit_level = 31,
    ratio = 0.52,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.64,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7500,
    allbonus = [{135,14819,0},{136,1481,0},{137,1481,0},{138,1481,0},{139,1481,0}],
    starProps = [{136,0.56,1006},{137,0.56,1006},{140,0.8,1144}]
    };
getRow(14,1)->
    #equipstarCfg {
    level = 14,
    type = 1,
    desc = "[4674F9]蓝色4星[-]",
    limit_level = 31,
    ratio = 0.52,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.64,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7500,
    allbonus = [{135,14819,0},{136,1481,0},{137,1481,0},{138,1481,0},{139,1481,0}],
    starProps = [{135,0.32,5749},{160,0.8,404}]
    };
getRow(14,2)->
    #equipstarCfg {
    level = 14,
    type = 2,
    desc = "[4674F9]蓝色4星[-]",
    limit_level = 31,
    ratio = 0.52,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.64,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7500,
    allbonus = [{135,14819,0},{136,1481,0},{137,1481,0},{138,1481,0},{139,1481,0}],
    starProps = [{136,0.24,431},{137,0.24,431},{145,0.8,862}]
    };
getRow(14,3)->
    #equipstarCfg {
    level = 14,
    type = 3,
    desc = "[4674F9]蓝色4星[-]",
    limit_level = 31,
    ratio = 0.52,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.64,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7500,
    allbonus = [{135,14819,0},{136,1481,0},{137,1481,0},{138,1481,0},{139,1481,0}],
    starProps = [{135,0.48,8623},{142,0.8,692}]
    };
getRow(14,4)->
    #equipstarCfg {
    level = 14,
    type = 4,
    desc = "[4674F9]蓝色4星[-]",
    limit_level = 31,
    ratio = 0.52,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.64,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7500,
    allbonus = [{135,14819,0},{136,1481,0},{137,1481,0},{138,1481,0},{139,1481,0}],
    starProps = [{138,0.24,431},{146,0.8,574}]
    };
getRow(14,5)->
    #equipstarCfg {
    level = 14,
    type = 5,
    desc = "[4674F9]蓝色4星[-]",
    limit_level = 31,
    ratio = 0.52,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.64,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7500,
    allbonus = [{135,14819,0},{136,1481,0},{137,1481,0},{138,1481,0},{139,1481,0}],
    starProps = [{138,0.56,1006},{143,0.8,585}]
    };
getRow(14,6)->
    #equipstarCfg {
    level = 14,
    type = 6,
    desc = "[4674F9]蓝色4星[-]",
    limit_level = 31,
    ratio = 0.52,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.64,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7500,
    allbonus = [{135,14819,0},{136,1481,0},{137,1481,0},{138,1481,0},{139,1481,0}],
    starProps = [{139,0.24,431},{144,0.8,602}]
    };
getRow(14,7)->
    #equipstarCfg {
    level = 14,
    type = 7,
    desc = "[4674F9]蓝色4星[-]",
    limit_level = 31,
    ratio = 0.52,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.64,
    cost_item = 225,
    cost_num = 5,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7500,
    allbonus = [{135,14819,0},{136,1481,0},{137,1481,0},{138,1481,0},{139,1481,0}],
    starProps = [{139,0.56,1006},{141,0.8,806}]
    };
getRow(15,0)->
    #equipstarCfg {
    level = 15,
    type = 0,
    desc = "[4674F9]蓝色5星[-]",
    limit_level = 31,
    ratio = 0.55,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.62,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 8000,
    allbonus = [{135,16617,0},{136,1661,0},{137,1661,0},{138,1661,0},{139,1661,0}],
    starProps = [{136,0.574,1011},{137,0.574,1011},{140,0.82,1150}]
    };
getRow(15,1)->
    #equipstarCfg {
    level = 15,
    type = 1,
    desc = "[4674F9]蓝色5星[-]",
    limit_level = 31,
    ratio = 0.55,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.62,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 8000,
    allbonus = [{135,16617,0},{136,1661,0},{137,1661,0},{138,1661,0},{139,1661,0}],
    starProps = [{135,0.328,5778},{160,0.82,406}]
    };
getRow(15,2)->
    #equipstarCfg {
    level = 15,
    type = 2,
    desc = "[4674F9]蓝色5星[-]",
    limit_level = 31,
    ratio = 0.55,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.62,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 8000,
    allbonus = [{135,16617,0},{136,1661,0},{137,1661,0},{138,1661,0},{139,1661,0}],
    starProps = [{136,0.246,433},{137,0.246,433},{145,0.82,866}]
    };
getRow(15,3)->
    #equipstarCfg {
    level = 15,
    type = 3,
    desc = "[4674F9]蓝色5星[-]",
    limit_level = 31,
    ratio = 0.55,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.62,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 8000,
    allbonus = [{135,16617,0},{136,1661,0},{137,1661,0},{138,1661,0},{139,1661,0}],
    starProps = [{135,0.492,8667},{142,0.82,695}]
    };
getRow(15,4)->
    #equipstarCfg {
    level = 15,
    type = 4,
    desc = "[4674F9]蓝色5星[-]",
    limit_level = 31,
    ratio = 0.55,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.62,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 8000,
    allbonus = [{135,16617,0},{136,1661,0},{137,1661,0},{138,1661,0},{139,1661,0}],
    starProps = [{138,0.246,433},{146,0.82,577}]
    };
getRow(15,5)->
    #equipstarCfg {
    level = 15,
    type = 5,
    desc = "[4674F9]蓝色5星[-]",
    limit_level = 31,
    ratio = 0.55,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.62,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 8000,
    allbonus = [{135,16617,0},{136,1661,0},{137,1661,0},{138,1661,0},{139,1661,0}],
    starProps = [{138,0.574,1011},{143,0.82,588}]
    };
getRow(15,6)->
    #equipstarCfg {
    level = 15,
    type = 6,
    desc = "[4674F9]蓝色5星[-]",
    limit_level = 31,
    ratio = 0.55,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.62,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 8000,
    allbonus = [{135,16617,0},{136,1661,0},{137,1661,0},{138,1661,0},{139,1661,0}],
    starProps = [{139,0.246,433},{144,0.82,605}]
    };
getRow(15,7)->
    #equipstarCfg {
    level = 15,
    type = 7,
    desc = "[4674F9]蓝色5星[-]",
    limit_level = 31,
    ratio = 0.55,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.62,
    cost_item = 225,
    cost_num = 1,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 8000,
    allbonus = [{135,16617,0},{136,1661,0},{137,1661,0},{138,1661,0},{139,1661,0}],
    starProps = [{139,0.574,1011},{141,0.82,810}]
    };
getRow(_,_)->[].

getKeyList()->[
    {0,0},
    {0,1},
    {0,2},
    {0,3},
    {0,4},
    {0,5},
    {0,6},
    {0,7},
    {1,0},
    {1,1},
    {1,2},
    {1,3},
    {1,4},
    {1,5},
    {1,6},
    {1,7},
    {2,0},
    {2,1},
    {2,2},
    {2,3},
    {2,4},
    {2,5},
    {2,6},
    {2,7},
    {3,0},
    {3,1},
    {3,2},
    {3,3},
    {3,4},
    {3,5},
    {3,6},
    {3,7},
    {4,0},
    {4,1},
    {4,2},
    {4,3},
    {4,4},
    {4,5},
    {4,6},
    {4,7},
    {5,0},
    {5,1},
    {5,2},
    {5,3},
    {5,4},
    {5,5},
    {5,6},
    {5,7},
    {6,0},
    {6,1},
    {6,2},
    {6,3},
    {6,4},
    {6,5},
    {6,6},
    {6,7},
    {7,0},
    {7,1},
    {7,2},
    {7,3},
    {7,4},
    {7,5},
    {7,6},
    {7,7},
    {8,0},
    {8,1},
    {8,2},
    {8,3},
    {8,4},
    {8,5},
    {8,6},
    {8,7},
    {9,0},
    {9,1},
    {9,2},
    {9,3},
    {9,4},
    {9,5},
    {9,6},
    {9,7},
    {10,0},
    {10,1},
    {10,2},
    {10,3},
    {10,4},
    {10,5},
    {10,6},
    {10,7},
    {11,0},
    {11,1},
    {11,2},
    {11,3},
    {11,4},
    {11,5},
    {11,6},
    {11,7},
    {12,0},
    {12,1},
    {12,2},
    {12,3},
    {12,4},
    {12,5},
    {12,6},
    {12,7},
    {13,0},
    {13,1},
    {13,2},
    {13,3},
    {13,4},
    {13,5},
    {13,6},
    {13,7},
    {14,0},
    {14,1},
    {14,2},
    {14,3},
    {14,4},
    {14,5},
    {14,6},
    {14,7},
    {15,0},
    {15,1},
    {15,2},
    {15,3},
    {15,4},
    {15,5},
    {15,6},
    {15,7}
    ].

get1KeyList()->[
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
    15
    ].

get2KeyList(0)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(1)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(2)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(3)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(4)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(5)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(6)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(7)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(8)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(9)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(10)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(11)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(12)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(13)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(14)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(15)->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(_)->[].

