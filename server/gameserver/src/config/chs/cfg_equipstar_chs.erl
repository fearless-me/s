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
    limit_level = 1,
    ratio = 0,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 1,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1000,
    allbonus = [{135,0,0},{136,0,0},{137,0,0},{138,0,0},{139,0,0}],
    starProps = [{136,0,0},{137,0,0},{140,0,0}]
    };
getRow(0,1)->
    #equipstarCfg {
    level = 0,
    type = 1,
    desc = "白色0星",
    limit_level = 1,
    ratio = 0,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 1,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1000,
    allbonus = [{135,0,0},{136,0,0},{137,0,0},{138,0,0},{139,0,0}],
    starProps = [{135,0,0},{160,0,0}]
    };
getRow(0,2)->
    #equipstarCfg {
    level = 0,
    type = 2,
    desc = "白色0星",
    limit_level = 1,
    ratio = 0,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 1,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1000,
    allbonus = [{135,0,0},{136,0,0},{137,0,0},{138,0,0},{139,0,0}],
    starProps = [{136,0,0},{137,0,0},{145,0,0}]
    };
getRow(0,3)->
    #equipstarCfg {
    level = 0,
    type = 3,
    desc = "白色0星",
    limit_level = 1,
    ratio = 0,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 1,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1000,
    allbonus = [{135,0,0},{136,0,0},{137,0,0},{138,0,0},{139,0,0}],
    starProps = [{135,0,0},{142,0,0}]
    };
getRow(0,4)->
    #equipstarCfg {
    level = 0,
    type = 4,
    desc = "白色0星",
    limit_level = 1,
    ratio = 0,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 1,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1000,
    allbonus = [{135,0,0},{136,0,0},{137,0,0},{138,0,0},{139,0,0}],
    starProps = [{138,0,0},{146,0,0}]
    };
getRow(0,5)->
    #equipstarCfg {
    level = 0,
    type = 5,
    desc = "白色0星",
    limit_level = 1,
    ratio = 0,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 1,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1000,
    allbonus = [{135,0,0},{136,0,0},{137,0,0},{138,0,0},{139,0,0}],
    starProps = [{138,0,0},{143,0,0}]
    };
getRow(0,6)->
    #equipstarCfg {
    level = 0,
    type = 6,
    desc = "白色0星",
    limit_level = 1,
    ratio = 0,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 1,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1000,
    allbonus = [{135,0,0},{136,0,0},{137,0,0},{138,0,0},{139,0,0}],
    starProps = [{139,0,0},{144,0,0}]
    };
getRow(0,7)->
    #equipstarCfg {
    level = 0,
    type = 7,
    desc = "白色0星",
    limit_level = 1,
    ratio = 0,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 1,
    cost_item = 225,
    cost_num = 2,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 1000,
    allbonus = [{135,0,0},{136,0,0},{137,0,0},{138,0,0},{139,0,0}],
    starProps = [{139,0,0},{141,0,0}]
    };
getRow(1,0)->
    #equipstarCfg {
    level = 1,
    type = 0,
    desc = "白色1星",
    limit_level = 1,
    ratio = 0.13,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.92,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2000,
    allbonus = [{135,535,0},{136,53,0},{137,53,0},{138,53,0},{139,53,0}],
    starProps = [{136,0,129},{137,0,129},{140,0,147}]
    };
getRow(1,1)->
    #equipstarCfg {
    level = 1,
    type = 1,
    desc = "白色1星",
    limit_level = 1,
    ratio = 0.13,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.92,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2000,
    allbonus = [{135,535,0},{136,53,0},{137,53,0},{138,53,0},{139,53,0}],
    starProps = [{135,0,742},{160,0,52}]
    };
getRow(1,2)->
    #equipstarCfg {
    level = 1,
    type = 2,
    desc = "白色1星",
    limit_level = 1,
    ratio = 0.13,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.92,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2000,
    allbonus = [{135,535,0},{136,53,0},{137,53,0},{138,53,0},{139,53,0}],
    starProps = [{136,0,55},{137,0,55},{145,0,111}]
    };
getRow(1,3)->
    #equipstarCfg {
    level = 1,
    type = 3,
    desc = "白色1星",
    limit_level = 1,
    ratio = 0.13,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.92,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2000,
    allbonus = [{135,535,0},{136,53,0},{137,53,0},{138,53,0},{139,53,0}],
    starProps = [{135,0,1113},{142,0,89}]
    };
getRow(1,4)->
    #equipstarCfg {
    level = 1,
    type = 4,
    desc = "白色1星",
    limit_level = 1,
    ratio = 0.13,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.92,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2000,
    allbonus = [{135,535,0},{136,53,0},{137,53,0},{138,53,0},{139,53,0}],
    starProps = [{138,0,55},{146,0,74}]
    };
getRow(1,5)->
    #equipstarCfg {
    level = 1,
    type = 5,
    desc = "白色1星",
    limit_level = 1,
    ratio = 0.13,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.92,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2000,
    allbonus = [{135,535,0},{136,53,0},{137,53,0},{138,53,0},{139,53,0}],
    starProps = [{138,0,129},{143,0,75}]
    };
getRow(1,6)->
    #equipstarCfg {
    level = 1,
    type = 6,
    desc = "白色1星",
    limit_level = 1,
    ratio = 0.13,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.92,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2000,
    allbonus = [{135,535,0},{136,53,0},{137,53,0},{138,53,0},{139,53,0}],
    starProps = [{139,0,55},{144,0,77}]
    };
getRow(1,7)->
    #equipstarCfg {
    level = 1,
    type = 7,
    desc = "白色1星",
    limit_level = 1,
    ratio = 0.13,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.92,
    cost_item = 225,
    cost_num = 4,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 2000,
    allbonus = [{135,535,0},{136,53,0},{137,53,0},{138,53,0},{139,53,0}],
    starProps = [{139,0,129},{141,0,104}]
    };
getRow(2,0)->
    #equipstarCfg {
    level = 2,
    type = 0,
    desc = "白色2星",
    limit_level = 1,
    ratio = 0.16,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 6,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3000,
    allbonus = [{135,770,0},{136,77,0},{137,77,0},{138,77,0},{139,77,0}],
    starProps = [{136,0.006,174},{137,0.006,174},{140,0.009,198}]
    };
getRow(2,1)->
    #equipstarCfg {
    level = 2,
    type = 1,
    desc = "白色2星",
    limit_level = 1,
    ratio = 0.16,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 6,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3000,
    allbonus = [{135,770,0},{136,77,0},{137,77,0},{138,77,0},{139,77,0}],
    starProps = [{135,0.004,996},{160,0.009,70}]
    };
getRow(2,2)->
    #equipstarCfg {
    level = 2,
    type = 2,
    desc = "白色2星",
    limit_level = 1,
    ratio = 0.16,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 6,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3000,
    allbonus = [{135,770,0},{136,77,0},{137,77,0},{138,77,0},{139,77,0}],
    starProps = [{136,0.003,74},{137,0.003,74},{145,0.009,149}]
    };
getRow(2,3)->
    #equipstarCfg {
    level = 2,
    type = 3,
    desc = "白色2星",
    limit_level = 1,
    ratio = 0.16,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 6,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3000,
    allbonus = [{135,770,0},{136,77,0},{137,77,0},{138,77,0},{139,77,0}],
    starProps = [{135,0.005,1494},{142,0.009,119}]
    };
getRow(2,4)->
    #equipstarCfg {
    level = 2,
    type = 4,
    desc = "白色2星",
    limit_level = 1,
    ratio = 0.16,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 6,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3000,
    allbonus = [{135,770,0},{136,77,0},{137,77,0},{138,77,0},{139,77,0}],
    starProps = [{138,0.003,74},{146,0.009,99}]
    };
getRow(2,5)->
    #equipstarCfg {
    level = 2,
    type = 5,
    desc = "白色2星",
    limit_level = 1,
    ratio = 0.16,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 6,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3000,
    allbonus = [{135,770,0},{136,77,0},{137,77,0},{138,77,0},{139,77,0}],
    starProps = [{138,0.006,174},{143,0.009,101}]
    };
getRow(2,6)->
    #equipstarCfg {
    level = 2,
    type = 6,
    desc = "白色2星",
    limit_level = 1,
    ratio = 0.16,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 6,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3000,
    allbonus = [{135,770,0},{136,77,0},{137,77,0},{138,77,0},{139,77,0}],
    starProps = [{139,0.003,74},{144,0.009,104}]
    };
getRow(2,7)->
    #equipstarCfg {
    level = 2,
    type = 7,
    desc = "白色2星",
    limit_level = 1,
    ratio = 0.16,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 6,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 3000,
    allbonus = [{135,770,0},{136,77,0},{137,77,0},{138,77,0},{139,77,0}],
    starProps = [{139,0.006,174},{141,0.009,139}]
    };
getRow(3,0)->
    #equipstarCfg {
    level = 3,
    type = 0,
    desc = "白色3星",
    limit_level = 1,
    ratio = 0.19,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.87,
    cost_item = 225,
    cost_num = 9,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4000,
    allbonus = [{135,1249,0},{136,124,0},{137,124,0},{138,124,0},{139,124,0}],
    starProps = [{136,0.013,320},{137,0.013,320},{140,0.019,364}]
    };
getRow(3,1)->
    #equipstarCfg {
    level = 3,
    type = 1,
    desc = "白色3星",
    limit_level = 1,
    ratio = 0.19,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.87,
    cost_item = 225,
    cost_num = 9,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4000,
    allbonus = [{135,1249,0},{136,124,0},{137,124,0},{138,124,0},{139,124,0}],
    starProps = [{135,0.008,1833},{160,0.019,129}]
    };
getRow(3,2)->
    #equipstarCfg {
    level = 3,
    type = 2,
    desc = "白色3星",
    limit_level = 1,
    ratio = 0.19,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.87,
    cost_item = 225,
    cost_num = 9,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4000,
    allbonus = [{135,1249,0},{136,124,0},{137,124,0},{138,124,0},{139,124,0}],
    starProps = [{136,0.006,137},{137,0.006,137},{145,0.019,274}]
    };
getRow(3,3)->
    #equipstarCfg {
    level = 3,
    type = 3,
    desc = "白色3星",
    limit_level = 1,
    ratio = 0.19,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.87,
    cost_item = 225,
    cost_num = 9,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4000,
    allbonus = [{135,1249,0},{136,124,0},{137,124,0},{138,124,0},{139,124,0}],
    starProps = [{135,0.011,2749},{142,0.019,220}]
    };
getRow(3,4)->
    #equipstarCfg {
    level = 3,
    type = 4,
    desc = "白色3星",
    limit_level = 1,
    ratio = 0.19,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.87,
    cost_item = 225,
    cost_num = 9,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4000,
    allbonus = [{135,1249,0},{136,124,0},{137,124,0},{138,124,0},{139,124,0}],
    starProps = [{138,0.006,137},{146,0.019,183}]
    };
getRow(3,5)->
    #equipstarCfg {
    level = 3,
    type = 5,
    desc = "白色3星",
    limit_level = 1,
    ratio = 0.19,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.87,
    cost_item = 225,
    cost_num = 9,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4000,
    allbonus = [{135,1249,0},{136,124,0},{137,124,0},{138,124,0},{139,124,0}],
    starProps = [{138,0.013,320},{143,0.019,186}]
    };
getRow(3,6)->
    #equipstarCfg {
    level = 3,
    type = 6,
    desc = "白色3星",
    limit_level = 1,
    ratio = 0.19,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.87,
    cost_item = 225,
    cost_num = 9,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4000,
    allbonus = [{135,1249,0},{136,124,0},{137,124,0},{138,124,0},{139,124,0}],
    starProps = [{139,0.006,137},{144,0.019,192}]
    };
getRow(3,7)->
    #equipstarCfg {
    level = 3,
    type = 7,
    desc = "白色3星",
    limit_level = 1,
    ratio = 0.19,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.87,
    cost_item = 225,
    cost_num = 9,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 4000,
    allbonus = [{135,1249,0},{136,124,0},{137,124,0},{138,124,0},{139,124,0}],
    starProps = [{139,0.013,320},{141,0.019,257}]
    };
getRow(4,0)->
    #equipstarCfg {
    level = 4,
    type = 0,
    desc = "白色4星",
    limit_level = 1,
    ratio = 0.22,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.83,
    cost_item = 225,
    cost_num = 12,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5000,
    allbonus = [{135,1902,0},{136,190,0},{137,190,0},{138,190,0},{139,190,0}],
    starProps = [{136,0.03,440},{137,0.03,440},{140,0.042,501}]
    };
getRow(4,1)->
    #equipstarCfg {
    level = 4,
    type = 1,
    desc = "白色4星",
    limit_level = 1,
    ratio = 0.22,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.83,
    cost_item = 225,
    cost_num = 12,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5000,
    allbonus = [{135,1902,0},{136,190,0},{137,190,0},{138,190,0},{139,190,0}],
    starProps = [{135,0.017,2517},{160,0.042,177}]
    };
getRow(4,2)->
    #equipstarCfg {
    level = 4,
    type = 2,
    desc = "白色4星",
    limit_level = 1,
    ratio = 0.22,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.83,
    cost_item = 225,
    cost_num = 12,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5000,
    allbonus = [{135,1902,0},{136,190,0},{137,190,0},{138,190,0},{139,190,0}],
    starProps = [{136,0.013,188},{137,0.013,188},{145,0.042,377}]
    };
getRow(4,3)->
    #equipstarCfg {
    level = 4,
    type = 3,
    desc = "白色4星",
    limit_level = 1,
    ratio = 0.22,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.83,
    cost_item = 225,
    cost_num = 12,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5000,
    allbonus = [{135,1902,0},{136,190,0},{137,190,0},{138,190,0},{139,190,0}],
    starProps = [{135,0.025,3776},{142,0.042,303}]
    };
getRow(4,4)->
    #equipstarCfg {
    level = 4,
    type = 4,
    desc = "白色4星",
    limit_level = 1,
    ratio = 0.22,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.83,
    cost_item = 225,
    cost_num = 12,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5000,
    allbonus = [{135,1902,0},{136,190,0},{137,190,0},{138,190,0},{139,190,0}],
    starProps = [{138,0.013,188},{146,0.042,251}]
    };
getRow(4,5)->
    #equipstarCfg {
    level = 4,
    type = 5,
    desc = "白色4星",
    limit_level = 1,
    ratio = 0.22,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.83,
    cost_item = 225,
    cost_num = 12,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5000,
    allbonus = [{135,1902,0},{136,190,0},{137,190,0},{138,190,0},{139,190,0}],
    starProps = [{138,0.03,440},{143,0.042,256}]
    };
getRow(4,6)->
    #equipstarCfg {
    level = 4,
    type = 6,
    desc = "白色4星",
    limit_level = 1,
    ratio = 0.22,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.83,
    cost_item = 225,
    cost_num = 12,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5000,
    allbonus = [{135,1902,0},{136,190,0},{137,190,0},{138,190,0},{139,190,0}],
    starProps = [{139,0.013,188},{144,0.042,263}]
    };
getRow(4,7)->
    #equipstarCfg {
    level = 4,
    type = 7,
    desc = "白色4星",
    limit_level = 1,
    ratio = 0.22,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.83,
    cost_item = 225,
    cost_num = 12,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 5000,
    allbonus = [{135,1902,0},{136,190,0},{137,190,0},{138,190,0},{139,190,0}],
    starProps = [{139,0.03,440},{141,0.042,353}]
    };
getRow(5,0)->
    #equipstarCfg {
    level = 5,
    type = 0,
    desc = "白色5星",
    limit_level = 1,
    ratio = 0.25,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.8,
    cost_item = 225,
    cost_num = 15,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6000,
    allbonus = [{135,2701,0},{136,270,0},{137,270,0},{138,270,0},{139,270,0}],
    starProps = [{136,0.054,532},{137,0.054,532},{140,0.078,605}]
    };
getRow(5,1)->
    #equipstarCfg {
    level = 5,
    type = 1,
    desc = "白色5星",
    limit_level = 1,
    ratio = 0.25,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.8,
    cost_item = 225,
    cost_num = 15,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6000,
    allbonus = [{135,2701,0},{136,270,0},{137,270,0},{138,270,0},{139,270,0}],
    starProps = [{135,0.031,3044},{160,0.078,214}]
    };
getRow(5,2)->
    #equipstarCfg {
    level = 5,
    type = 2,
    desc = "白色5星",
    limit_level = 1,
    ratio = 0.25,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.8,
    cost_item = 225,
    cost_num = 15,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6000,
    allbonus = [{135,2701,0},{136,270,0},{137,270,0},{138,270,0},{139,270,0}],
    starProps = [{136,0.023,228},{137,0.023,228},{145,0.078,456}]
    };
getRow(5,3)->
    #equipstarCfg {
    level = 5,
    type = 3,
    desc = "白色5星",
    limit_level = 1,
    ratio = 0.25,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.8,
    cost_item = 225,
    cost_num = 15,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6000,
    allbonus = [{135,2701,0},{136,270,0},{137,270,0},{138,270,0},{139,270,0}],
    starProps = [{135,0.047,4566},{142,0.078,366}]
    };
getRow(5,4)->
    #equipstarCfg {
    level = 5,
    type = 4,
    desc = "白色5星",
    limit_level = 1,
    ratio = 0.25,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.8,
    cost_item = 225,
    cost_num = 15,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6000,
    allbonus = [{135,2701,0},{136,270,0},{137,270,0},{138,270,0},{139,270,0}],
    starProps = [{138,0.023,228},{146,0.078,304}]
    };
getRow(5,5)->
    #equipstarCfg {
    level = 5,
    type = 5,
    desc = "白色5星",
    limit_level = 1,
    ratio = 0.25,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.8,
    cost_item = 225,
    cost_num = 15,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6000,
    allbonus = [{135,2701,0},{136,270,0},{137,270,0},{138,270,0},{139,270,0}],
    starProps = [{138,0.054,532},{143,0.078,310}]
    };
getRow(5,6)->
    #equipstarCfg {
    level = 5,
    type = 6,
    desc = "白色5星",
    limit_level = 1,
    ratio = 0.25,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.8,
    cost_item = 225,
    cost_num = 15,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6000,
    allbonus = [{135,2701,0},{136,270,0},{137,270,0},{138,270,0},{139,270,0}],
    starProps = [{139,0.023,228},{144,0.078,319}]
    };
getRow(5,7)->
    #equipstarCfg {
    level = 5,
    type = 7,
    desc = "白色5星",
    limit_level = 1,
    ratio = 0.25,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.8,
    cost_item = 225,
    cost_num = 15,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 6000,
    allbonus = [{135,2701,0},{136,270,0},{137,270,0},{138,270,0},{139,270,0}],
    starProps = [{139,0.054,532},{141,0.078,427}]
    };
getRow(6,0)->
    #equipstarCfg {
    level = 6,
    type = 0,
    desc = "[13E826]绿色1星[-]",
    limit_level = 1,
    ratio = 0.28,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.77,
    cost_item = 225,
    cost_num = 18,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7000,
    allbonus = [{135,3631,0},{136,363,0},{137,363,0},{138,363,0},{139,363,0}],
    starProps = [{136,0.081,648},{137,0.081,648},{140,0.115,737}]
    };
getRow(6,1)->
    #equipstarCfg {
    level = 6,
    type = 1,
    desc = "[13E826]绿色1星[-]",
    limit_level = 1,
    ratio = 0.28,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.77,
    cost_item = 225,
    cost_num = 18,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7000,
    allbonus = [{135,3631,0},{136,363,0},{137,363,0},{138,363,0},{139,363,0}],
    starProps = [{135,0.046,3704},{160,0.115,260}]
    };
getRow(6,2)->
    #equipstarCfg {
    level = 6,
    type = 2,
    desc = "[13E826]绿色1星[-]",
    limit_level = 1,
    ratio = 0.28,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.77,
    cost_item = 225,
    cost_num = 18,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7000,
    allbonus = [{135,3631,0},{136,363,0},{137,363,0},{138,363,0},{139,363,0}],
    starProps = [{136,0.035,277},{137,0.035,277},{145,0.115,555}]
    };
getRow(6,3)->
    #equipstarCfg {
    level = 6,
    type = 3,
    desc = "[13E826]绿色1星[-]",
    limit_level = 1,
    ratio = 0.28,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.77,
    cost_item = 225,
    cost_num = 18,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7000,
    allbonus = [{135,3631,0},{136,363,0},{137,363,0},{138,363,0},{139,363,0}],
    starProps = [{135,0.069,5557},{142,0.115,445}]
    };
getRow(6,4)->
    #equipstarCfg {
    level = 6,
    type = 4,
    desc = "[13E826]绿色1星[-]",
    limit_level = 1,
    ratio = 0.28,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.77,
    cost_item = 225,
    cost_num = 18,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7000,
    allbonus = [{135,3631,0},{136,363,0},{137,363,0},{138,363,0},{139,363,0}],
    starProps = [{138,0.035,277},{146,0.115,370}]
    };
getRow(6,5)->
    #equipstarCfg {
    level = 6,
    type = 5,
    desc = "[13E826]绿色1星[-]",
    limit_level = 1,
    ratio = 0.28,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.77,
    cost_item = 225,
    cost_num = 18,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7000,
    allbonus = [{135,3631,0},{136,363,0},{137,363,0},{138,363,0},{139,363,0}],
    starProps = [{138,0.081,648},{143,0.115,377}]
    };
getRow(6,6)->
    #equipstarCfg {
    level = 6,
    type = 6,
    desc = "[13E826]绿色1星[-]",
    limit_level = 1,
    ratio = 0.28,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.77,
    cost_item = 225,
    cost_num = 18,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7000,
    allbonus = [{135,3631,0},{136,363,0},{137,363,0},{138,363,0},{139,363,0}],
    starProps = [{139,0.035,277},{144,0.115,388}]
    };
getRow(6,7)->
    #equipstarCfg {
    level = 6,
    type = 7,
    desc = "[13E826]绿色1星[-]",
    limit_level = 1,
    ratio = 0.28,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.77,
    cost_item = 225,
    cost_num = 18,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 7000,
    allbonus = [{135,3631,0},{136,363,0},{137,363,0},{138,363,0},{139,363,0}],
    starProps = [{139,0.081,648},{141,0.115,519}]
    };
getRow(7,0)->
    #equipstarCfg {
    level = 7,
    type = 0,
    desc = "[13E826]绿色2星[-]",
    limit_level = 1,
    ratio = 0.31,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.72,
    cost_item = 225,
    cost_num = 21,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 8000,
    allbonus = [{135,4680,0},{136,468,0},{137,468,0},{138,468,0},{139,468,0}],
    starProps = [{136,0.114,746},{137,0.114,746},{140,0.162,849}]
    };
getRow(7,1)->
    #equipstarCfg {
    level = 7,
    type = 1,
    desc = "[13E826]绿色2星[-]",
    limit_level = 1,
    ratio = 0.31,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.72,
    cost_item = 225,
    cost_num = 21,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 8000,
    allbonus = [{135,4680,0},{136,468,0},{137,468,0},{138,468,0},{139,468,0}],
    starProps = [{135,0.065,4267},{160,0.162,300}]
    };
getRow(7,2)->
    #equipstarCfg {
    level = 7,
    type = 2,
    desc = "[13E826]绿色2星[-]",
    limit_level = 1,
    ratio = 0.31,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.72,
    cost_item = 225,
    cost_num = 21,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 8000,
    allbonus = [{135,4680,0},{136,468,0},{137,468,0},{138,468,0},{139,468,0}],
    starProps = [{136,0.049,320},{137,0.049,320},{145,0.162,640}]
    };
getRow(7,3)->
    #equipstarCfg {
    level = 7,
    type = 3,
    desc = "[13E826]绿色2星[-]",
    limit_level = 1,
    ratio = 0.31,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.72,
    cost_item = 225,
    cost_num = 21,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 8000,
    allbonus = [{135,4680,0},{136,468,0},{137,468,0},{138,468,0},{139,468,0}],
    starProps = [{135,0.097,6400},{142,0.162,513}]
    };
getRow(7,4)->
    #equipstarCfg {
    level = 7,
    type = 4,
    desc = "[13E826]绿色2星[-]",
    limit_level = 1,
    ratio = 0.31,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.72,
    cost_item = 225,
    cost_num = 21,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 8000,
    allbonus = [{135,4680,0},{136,468,0},{137,468,0},{138,468,0},{139,468,0}],
    starProps = [{138,0.049,320},{146,0.162,426}]
    };
getRow(7,5)->
    #equipstarCfg {
    level = 7,
    type = 5,
    desc = "[13E826]绿色2星[-]",
    limit_level = 1,
    ratio = 0.31,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.72,
    cost_item = 225,
    cost_num = 21,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 8000,
    allbonus = [{135,4680,0},{136,468,0},{137,468,0},{138,468,0},{139,468,0}],
    starProps = [{138,0.114,746},{143,0.162,434}]
    };
getRow(7,6)->
    #equipstarCfg {
    level = 7,
    type = 6,
    desc = "[13E826]绿色2星[-]",
    limit_level = 1,
    ratio = 0.31,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.72,
    cost_item = 225,
    cost_num = 21,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 8000,
    allbonus = [{135,4680,0},{136,468,0},{137,468,0},{138,468,0},{139,468,0}],
    starProps = [{139,0.049,320},{144,0.162,447}]
    };
getRow(7,7)->
    #equipstarCfg {
    level = 7,
    type = 7,
    desc = "[13E826]绿色2星[-]",
    limit_level = 1,
    ratio = 0.31,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.72,
    cost_item = 225,
    cost_num = 21,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 8000,
    allbonus = [{135,4680,0},{136,468,0},{137,468,0},{138,468,0},{139,468,0}],
    starProps = [{139,0.114,746},{141,0.162,598}]
    };
getRow(8,0)->
    #equipstarCfg {
    level = 8,
    type = 0,
    desc = "[13E826]绿色3星[-]",
    limit_level = 1,
    ratio = 0.34,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.7,
    cost_item = 225,
    cost_num = 24,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 9000,
    allbonus = [{135,5840,0},{136,584,0},{137,584,0},{138,584,0},{139,584,0}],
    starProps = [{136,0.154,821},{137,0.154,821},{140,0.219,934}]
    };
getRow(8,1)->
    #equipstarCfg {
    level = 8,
    type = 1,
    desc = "[13E826]绿色3星[-]",
    limit_level = 1,
    ratio = 0.34,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.7,
    cost_item = 225,
    cost_num = 24,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 9000,
    allbonus = [{135,5840,0},{136,584,0},{137,584,0},{138,584,0},{139,584,0}],
    starProps = [{135,0.088,4696},{160,0.219,330}]
    };
getRow(8,2)->
    #equipstarCfg {
    level = 8,
    type = 2,
    desc = "[13E826]绿色3星[-]",
    limit_level = 1,
    ratio = 0.34,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.7,
    cost_item = 225,
    cost_num = 24,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 9000,
    allbonus = [{135,5840,0},{136,584,0},{137,584,0},{138,584,0},{139,584,0}],
    starProps = [{136,0.066,352},{137,0.066,352},{145,0.219,704}]
    };
getRow(8,3)->
    #equipstarCfg {
    level = 8,
    type = 3,
    desc = "[13E826]绿色3星[-]",
    limit_level = 1,
    ratio = 0.34,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.7,
    cost_item = 225,
    cost_num = 24,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 9000,
    allbonus = [{135,5840,0},{136,584,0},{137,584,0},{138,584,0},{139,584,0}],
    starProps = [{135,0.132,7044},{142,0.219,565}]
    };
getRow(8,4)->
    #equipstarCfg {
    level = 8,
    type = 4,
    desc = "[13E826]绿色3星[-]",
    limit_level = 1,
    ratio = 0.34,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.7,
    cost_item = 225,
    cost_num = 24,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 9000,
    allbonus = [{135,5840,0},{136,584,0},{137,584,0},{138,584,0},{139,584,0}],
    starProps = [{138,0.066,352},{146,0.219,469}]
    };
getRow(8,5)->
    #equipstarCfg {
    level = 8,
    type = 5,
    desc = "[13E826]绿色3星[-]",
    limit_level = 1,
    ratio = 0.34,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.7,
    cost_item = 225,
    cost_num = 24,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 9000,
    allbonus = [{135,5840,0},{136,584,0},{137,584,0},{138,584,0},{139,584,0}],
    starProps = [{138,0.154,821},{143,0.219,478}]
    };
getRow(8,6)->
    #equipstarCfg {
    level = 8,
    type = 6,
    desc = "[13E826]绿色3星[-]",
    limit_level = 1,
    ratio = 0.34,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.7,
    cost_item = 225,
    cost_num = 24,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 9000,
    allbonus = [{135,5840,0},{136,584,0},{137,584,0},{138,584,0},{139,584,0}],
    starProps = [{139,0.066,352},{144,0.219,492}]
    };
getRow(8,7)->
    #equipstarCfg {
    level = 8,
    type = 7,
    desc = "[13E826]绿色3星[-]",
    limit_level = 1,
    ratio = 0.34,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.7,
    cost_item = 225,
    cost_num = 24,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 9000,
    allbonus = [{135,5840,0},{136,584,0},{137,584,0},{138,584,0},{139,584,0}],
    starProps = [{139,0.154,821},{141,0.219,658}]
    };
getRow(9,0)->
    #equipstarCfg {
    level = 9,
    type = 0,
    desc = "[13E826]绿色4星[-]",
    limit_level = 1,
    ratio = 0.37,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.66,
    cost_item = 225,
    cost_num = 28,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 10000,
    allbonus = [{135,7103,0},{136,710,0},{137,710,0},{138,710,0},{139,710,0}],
    starProps = [{136,0.201,868},{137,0.201,868},{140,0.287,987}]
    };
getRow(9,1)->
    #equipstarCfg {
    level = 9,
    type = 1,
    desc = "[13E826]绿色4星[-]",
    limit_level = 1,
    ratio = 0.37,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.66,
    cost_item = 225,
    cost_num = 28,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 10000,
    allbonus = [{135,7103,0},{136,710,0},{137,710,0},{138,710,0},{139,710,0}],
    starProps = [{135,0.115,4961},{160,0.287,349}]
    };
getRow(9,2)->
    #equipstarCfg {
    level = 9,
    type = 2,
    desc = "[13E826]绿色4星[-]",
    limit_level = 1,
    ratio = 0.37,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.66,
    cost_item = 225,
    cost_num = 28,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 10000,
    allbonus = [{135,7103,0},{136,710,0},{137,710,0},{138,710,0},{139,710,0}],
    starProps = [{136,0.086,372},{137,0.086,372},{145,0.287,744}]
    };
getRow(9,3)->
    #equipstarCfg {
    level = 9,
    type = 3,
    desc = "[13E826]绿色4星[-]",
    limit_level = 1,
    ratio = 0.37,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.66,
    cost_item = 225,
    cost_num = 28,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 10000,
    allbonus = [{135,7103,0},{136,710,0},{137,710,0},{138,710,0},{139,710,0}],
    starProps = [{135,0.172,7442},{142,0.287,597}]
    };
getRow(9,4)->
    #equipstarCfg {
    level = 9,
    type = 4,
    desc = "[13E826]绿色4星[-]",
    limit_level = 1,
    ratio = 0.37,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.66,
    cost_item = 225,
    cost_num = 28,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 10000,
    allbonus = [{135,7103,0},{136,710,0},{137,710,0},{138,710,0},{139,710,0}],
    starProps = [{138,0.086,372},{146,0.287,496}]
    };
getRow(9,5)->
    #equipstarCfg {
    level = 9,
    type = 5,
    desc = "[13E826]绿色4星[-]",
    limit_level = 1,
    ratio = 0.37,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.66,
    cost_item = 225,
    cost_num = 28,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 10000,
    allbonus = [{135,7103,0},{136,710,0},{137,710,0},{138,710,0},{139,710,0}],
    starProps = [{138,0.201,868},{143,0.287,505}]
    };
getRow(9,6)->
    #equipstarCfg {
    level = 9,
    type = 6,
    desc = "[13E826]绿色4星[-]",
    limit_level = 1,
    ratio = 0.37,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.66,
    cost_item = 225,
    cost_num = 28,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 10000,
    allbonus = [{135,7103,0},{136,710,0},{137,710,0},{138,710,0},{139,710,0}],
    starProps = [{139,0.086,372},{144,0.287,520}]
    };
getRow(9,7)->
    #equipstarCfg {
    level = 9,
    type = 7,
    desc = "[13E826]绿色4星[-]",
    limit_level = 1,
    ratio = 0.37,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.66,
    cost_item = 225,
    cost_num = 28,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 10000,
    allbonus = [{135,7103,0},{136,710,0},{137,710,0},{138,710,0},{139,710,0}],
    starProps = [{139,0.201,868},{141,0.287,696}]
    };
getRow(10,0)->
    #equipstarCfg {
    level = 10,
    type = 0,
    desc = "[13E826]绿色5星[-]",
    limit_level = 1,
    ratio = 0.4,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.63,
    cost_item = 225,
    cost_num = 32,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 12000,
    allbonus = [{135,8466,0},{136,846,0},{137,846,0},{138,846,0},{139,846,0}],
    starProps = [{136,0.256,880},{137,0.256,880},{140,0.366,1002}]
    };
getRow(10,1)->
    #equipstarCfg {
    level = 10,
    type = 1,
    desc = "[13E826]绿色5星[-]",
    limit_level = 1,
    ratio = 0.4,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.63,
    cost_item = 225,
    cost_num = 32,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 12000,
    allbonus = [{135,8466,0},{136,846,0},{137,846,0},{138,846,0},{139,846,0}],
    starProps = [{135,0.146,5033},{160,0.366,354}]
    };
getRow(10,2)->
    #equipstarCfg {
    level = 10,
    type = 2,
    desc = "[13E826]绿色5星[-]",
    limit_level = 1,
    ratio = 0.4,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.63,
    cost_item = 225,
    cost_num = 32,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 12000,
    allbonus = [{135,8466,0},{136,846,0},{137,846,0},{138,846,0},{139,846,0}],
    starProps = [{136,0.11,377},{137,0.11,377},{145,0.366,755}]
    };
getRow(10,3)->
    #equipstarCfg {
    level = 10,
    type = 3,
    desc = "[13E826]绿色5星[-]",
    limit_level = 1,
    ratio = 0.4,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.63,
    cost_item = 225,
    cost_num = 32,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 12000,
    allbonus = [{135,8466,0},{136,846,0},{137,846,0},{138,846,0},{139,846,0}],
    starProps = [{135,0.22,7550},{142,0.366,605}]
    };
getRow(10,4)->
    #equipstarCfg {
    level = 10,
    type = 4,
    desc = "[13E826]绿色5星[-]",
    limit_level = 1,
    ratio = 0.4,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.63,
    cost_item = 225,
    cost_num = 32,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 12000,
    allbonus = [{135,8466,0},{136,846,0},{137,846,0},{138,846,0},{139,846,0}],
    starProps = [{138,0.11,377},{146,0.366,503}]
    };
getRow(10,5)->
    #equipstarCfg {
    level = 10,
    type = 5,
    desc = "[13E826]绿色5星[-]",
    limit_level = 1,
    ratio = 0.4,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.63,
    cost_item = 225,
    cost_num = 32,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 12000,
    allbonus = [{135,8466,0},{136,846,0},{137,846,0},{138,846,0},{139,846,0}],
    starProps = [{138,0.256,880},{143,0.366,512}]
    };
getRow(10,6)->
    #equipstarCfg {
    level = 10,
    type = 6,
    desc = "[13E826]绿色5星[-]",
    limit_level = 1,
    ratio = 0.4,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.63,
    cost_item = 225,
    cost_num = 32,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 12000,
    allbonus = [{135,8466,0},{136,846,0},{137,846,0},{138,846,0},{139,846,0}],
    starProps = [{139,0.11,377},{144,0.366,527}]
    };
getRow(10,7)->
    #equipstarCfg {
    level = 10,
    type = 7,
    desc = "[13E826]绿色5星[-]",
    limit_level = 1,
    ratio = 0.4,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.63,
    cost_item = 225,
    cost_num = 32,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 12000,
    allbonus = [{135,8466,0},{136,846,0},{137,846,0},{138,846,0},{139,846,0}],
    starProps = [{139,0.256,880},{141,0.366,706}]
    };
getRow(11,0)->
    #equipstarCfg {
    level = 11,
    type = 0,
    desc = "[4674F9]蓝色1星[-]",
    limit_level = 1,
    ratio = 0.43,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.59,
    cost_item = 225,
    cost_num = 36,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 14000,
    allbonus = [{135,9922,0},{136,992,0},{137,992,0},{138,992,0},{139,992,0}],
    starProps = [{136,0.315,889},{137,0.315,889},{140,0.451,1011}]
    };
getRow(11,1)->
    #equipstarCfg {
    level = 11,
    type = 1,
    desc = "[4674F9]蓝色1星[-]",
    limit_level = 1,
    ratio = 0.43,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.59,
    cost_item = 225,
    cost_num = 36,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 14000,
    allbonus = [{135,9922,0},{136,992,0},{137,992,0},{138,992,0},{139,992,0}],
    starProps = [{135,0.18,5081},{160,0.451,357}]
    };
getRow(11,2)->
    #equipstarCfg {
    level = 11,
    type = 2,
    desc = "[4674F9]蓝色1星[-]",
    limit_level = 1,
    ratio = 0.43,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.59,
    cost_item = 225,
    cost_num = 36,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 14000,
    allbonus = [{135,9922,0},{136,992,0},{137,992,0},{138,992,0},{139,992,0}],
    starProps = [{136,0.135,381},{137,0.135,381},{145,0.451,762}]
    };
getRow(11,3)->
    #equipstarCfg {
    level = 11,
    type = 3,
    desc = "[4674F9]蓝色1星[-]",
    limit_level = 1,
    ratio = 0.43,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.59,
    cost_item = 225,
    cost_num = 36,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 14000,
    allbonus = [{135,9922,0},{136,992,0},{137,992,0},{138,992,0},{139,992,0}],
    starProps = [{135,0.27,7621},{142,0.451,611}]
    };
getRow(11,4)->
    #equipstarCfg {
    level = 11,
    type = 4,
    desc = "[4674F9]蓝色1星[-]",
    limit_level = 1,
    ratio = 0.43,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.59,
    cost_item = 225,
    cost_num = 36,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 14000,
    allbonus = [{135,9922,0},{136,992,0},{137,992,0},{138,992,0},{139,992,0}],
    starProps = [{138,0.135,381},{146,0.451,508}]
    };
getRow(11,5)->
    #equipstarCfg {
    level = 11,
    type = 5,
    desc = "[4674F9]蓝色1星[-]",
    limit_level = 1,
    ratio = 0.43,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.59,
    cost_item = 225,
    cost_num = 36,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 14000,
    allbonus = [{135,9922,0},{136,992,0},{137,992,0},{138,992,0},{139,992,0}],
    starProps = [{138,0.315,889},{143,0.451,517}]
    };
getRow(11,6)->
    #equipstarCfg {
    level = 11,
    type = 6,
    desc = "[4674F9]蓝色1星[-]",
    limit_level = 1,
    ratio = 0.43,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.59,
    cost_item = 225,
    cost_num = 36,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 14000,
    allbonus = [{135,9922,0},{136,992,0},{137,992,0},{138,992,0},{139,992,0}],
    starProps = [{139,0.135,381},{144,0.451,532}]
    };
getRow(11,7)->
    #equipstarCfg {
    level = 11,
    type = 7,
    desc = "[4674F9]蓝色1星[-]",
    limit_level = 1,
    ratio = 0.43,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.59,
    cost_item = 225,
    cost_num = 36,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 14000,
    allbonus = [{135,9922,0},{136,992,0},{137,992,0},{138,992,0},{139,992,0}],
    starProps = [{139,0.315,889},{141,0.451,712}]
    };
getRow(12,0)->
    #equipstarCfg {
    level = 12,
    type = 0,
    desc = "[4674F9]蓝色2星[-]",
    limit_level = 1,
    ratio = 0.46,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.55,
    cost_item = 225,
    cost_num = 40,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 16000,
    allbonus = [{135,11468,0},{136,1146,0},{137,1146,0},{138,1146,0},{139,1146,0}],
    starProps = [{136,0.372,943},{137,0.372,943},{140,0.532,1073}]
    };
getRow(12,1)->
    #equipstarCfg {
    level = 12,
    type = 1,
    desc = "[4674F9]蓝色2星[-]",
    limit_level = 1,
    ratio = 0.46,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.55,
    cost_item = 225,
    cost_num = 40,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 16000,
    allbonus = [{135,11468,0},{136,1146,0},{137,1146,0},{138,1146,0},{139,1146,0}],
    starProps = [{135,0.213,5390},{160,0.532,379}]
    };
getRow(12,2)->
    #equipstarCfg {
    level = 12,
    type = 2,
    desc = "[4674F9]蓝色2星[-]",
    limit_level = 1,
    ratio = 0.46,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.55,
    cost_item = 225,
    cost_num = 40,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 16000,
    allbonus = [{135,11468,0},{136,1146,0},{137,1146,0},{138,1146,0},{139,1146,0}],
    starProps = [{136,0.16,404},{137,0.16,404},{145,0.532,808}]
    };
getRow(12,3)->
    #equipstarCfg {
    level = 12,
    type = 3,
    desc = "[4674F9]蓝色2星[-]",
    limit_level = 1,
    ratio = 0.46,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.55,
    cost_item = 225,
    cost_num = 40,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 16000,
    allbonus = [{135,11468,0},{136,1146,0},{137,1146,0},{138,1146,0},{139,1146,0}],
    starProps = [{135,0.319,8086},{142,0.532,648}]
    };
getRow(12,4)->
    #equipstarCfg {
    level = 12,
    type = 4,
    desc = "[4674F9]蓝色2星[-]",
    limit_level = 1,
    ratio = 0.46,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.55,
    cost_item = 225,
    cost_num = 40,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 16000,
    allbonus = [{135,11468,0},{136,1146,0},{137,1146,0},{138,1146,0},{139,1146,0}],
    starProps = [{138,0.16,404},{146,0.532,539}]
    };
getRow(12,5)->
    #equipstarCfg {
    level = 12,
    type = 5,
    desc = "[4674F9]蓝色2星[-]",
    limit_level = 1,
    ratio = 0.46,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.55,
    cost_item = 225,
    cost_num = 40,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 16000,
    allbonus = [{135,11468,0},{136,1146,0},{137,1146,0},{138,1146,0},{139,1146,0}],
    starProps = [{138,0.372,943},{143,0.532,549}]
    };
getRow(12,6)->
    #equipstarCfg {
    level = 12,
    type = 6,
    desc = "[4674F9]蓝色2星[-]",
    limit_level = 1,
    ratio = 0.46,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.55,
    cost_item = 225,
    cost_num = 40,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 16000,
    allbonus = [{135,11468,0},{136,1146,0},{137,1146,0},{138,1146,0},{139,1146,0}],
    starProps = [{139,0.16,404},{144,0.532,565}]
    };
getRow(12,7)->
    #equipstarCfg {
    level = 12,
    type = 7,
    desc = "[4674F9]蓝色2星[-]",
    limit_level = 1,
    ratio = 0.46,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.55,
    cost_item = 225,
    cost_num = 40,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 16000,
    allbonus = [{135,11468,0},{136,1146,0},{137,1146,0},{138,1146,0},{139,1146,0}],
    starProps = [{139,0.372,943},{141,0.532,756}]
    };
getRow(13,0)->
    #equipstarCfg {
    level = 13,
    type = 0,
    desc = "[4674F9]蓝色3星[-]",
    limit_level = 1,
    ratio = 0.49,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.52,
    cost_item = 225,
    cost_num = 45,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 18000,
    allbonus = [{135,13102,0},{136,1310,0},{137,1310,0},{138,1310,0},{139,1310,0}],
    starProps = [{136,0.434,982},{137,0.434,982},{140,0.62,1118}]
    };
getRow(13,1)->
    #equipstarCfg {
    level = 13,
    type = 1,
    desc = "[4674F9]蓝色3星[-]",
    limit_level = 1,
    ratio = 0.49,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.52,
    cost_item = 225,
    cost_num = 45,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 18000,
    allbonus = [{135,13102,0},{136,1310,0},{137,1310,0},{138,1310,0},{139,1310,0}],
    starProps = [{135,0.248,5616},{160,0.62,395}]
    };
getRow(13,2)->
    #equipstarCfg {
    level = 13,
    type = 2,
    desc = "[4674F9]蓝色3星[-]",
    limit_level = 1,
    ratio = 0.49,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.52,
    cost_item = 225,
    cost_num = 45,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 18000,
    allbonus = [{135,13102,0},{136,1310,0},{137,1310,0},{138,1310,0},{139,1310,0}],
    starProps = [{136,0.186,421},{137,0.186,421},{145,0.62,842}]
    };
getRow(13,3)->
    #equipstarCfg {
    level = 13,
    type = 3,
    desc = "[4674F9]蓝色3星[-]",
    limit_level = 1,
    ratio = 0.49,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.52,
    cost_item = 225,
    cost_num = 45,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 18000,
    allbonus = [{135,13102,0},{136,1310,0},{137,1310,0},{138,1310,0},{139,1310,0}],
    starProps = [{135,0.372,8425},{142,0.62,676}]
    };
getRow(13,4)->
    #equipstarCfg {
    level = 13,
    type = 4,
    desc = "[4674F9]蓝色3星[-]",
    limit_level = 1,
    ratio = 0.49,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.52,
    cost_item = 225,
    cost_num = 45,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 18000,
    allbonus = [{135,13102,0},{136,1310,0},{137,1310,0},{138,1310,0},{139,1310,0}],
    starProps = [{138,0.186,421},{146,0.62,561}]
    };
getRow(13,5)->
    #equipstarCfg {
    level = 13,
    type = 5,
    desc = "[4674F9]蓝色3星[-]",
    limit_level = 1,
    ratio = 0.49,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.52,
    cost_item = 225,
    cost_num = 45,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 18000,
    allbonus = [{135,13102,0},{136,1310,0},{137,1310,0},{138,1310,0},{139,1310,0}],
    starProps = [{138,0.434,982},{143,0.62,572}]
    };
getRow(13,6)->
    #equipstarCfg {
    level = 13,
    type = 6,
    desc = "[4674F9]蓝色3星[-]",
    limit_level = 1,
    ratio = 0.49,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.52,
    cost_item = 225,
    cost_num = 45,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 18000,
    allbonus = [{135,13102,0},{136,1310,0},{137,1310,0},{138,1310,0},{139,1310,0}],
    starProps = [{139,0.186,421},{144,0.62,588}]
    };
getRow(13,7)->
    #equipstarCfg {
    level = 13,
    type = 7,
    desc = "[4674F9]蓝色3星[-]",
    limit_level = 1,
    ratio = 0.49,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.52,
    cost_item = 225,
    cost_num = 45,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 18000,
    allbonus = [{135,13102,0},{136,1310,0},{137,1310,0},{138,1310,0},{139,1310,0}],
    starProps = [{139,0.434,982},{141,0.62,787}]
    };
getRow(14,0)->
    #equipstarCfg {
    level = 14,
    type = 0,
    desc = "[4674F9]蓝色4星[-]",
    limit_level = 1,
    ratio = 0.52,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.49,
    cost_item = 225,
    cost_num = 50,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 20000,
    allbonus = [{135,14819,0},{136,1481,0},{137,1481,0},{138,1481,0},{139,1481,0}],
    starProps = [{136,0.501,1006},{137,0.501,1006},{140,0.716,1144}]
    };
getRow(14,1)->
    #equipstarCfg {
    level = 14,
    type = 1,
    desc = "[4674F9]蓝色4星[-]",
    limit_level = 1,
    ratio = 0.52,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.49,
    cost_item = 225,
    cost_num = 50,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 20000,
    allbonus = [{135,14819,0},{136,1481,0},{137,1481,0},{138,1481,0},{139,1481,0}],
    starProps = [{135,0.287,5749},{160,0.716,404}]
    };
getRow(14,2)->
    #equipstarCfg {
    level = 14,
    type = 2,
    desc = "[4674F9]蓝色4星[-]",
    limit_level = 1,
    ratio = 0.52,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.49,
    cost_item = 225,
    cost_num = 50,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 20000,
    allbonus = [{135,14819,0},{136,1481,0},{137,1481,0},{138,1481,0},{139,1481,0}],
    starProps = [{136,0.215,431},{137,0.215,431},{145,0.716,862}]
    };
getRow(14,3)->
    #equipstarCfg {
    level = 14,
    type = 3,
    desc = "[4674F9]蓝色4星[-]",
    limit_level = 1,
    ratio = 0.52,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.49,
    cost_item = 225,
    cost_num = 50,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 20000,
    allbonus = [{135,14819,0},{136,1481,0},{137,1481,0},{138,1481,0},{139,1481,0}],
    starProps = [{135,0.43,8623},{142,0.716,692}]
    };
getRow(14,4)->
    #equipstarCfg {
    level = 14,
    type = 4,
    desc = "[4674F9]蓝色4星[-]",
    limit_level = 1,
    ratio = 0.52,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.49,
    cost_item = 225,
    cost_num = 50,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 20000,
    allbonus = [{135,14819,0},{136,1481,0},{137,1481,0},{138,1481,0},{139,1481,0}],
    starProps = [{138,0.215,431},{146,0.716,574}]
    };
getRow(14,5)->
    #equipstarCfg {
    level = 14,
    type = 5,
    desc = "[4674F9]蓝色4星[-]",
    limit_level = 1,
    ratio = 0.52,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.49,
    cost_item = 225,
    cost_num = 50,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 20000,
    allbonus = [{135,14819,0},{136,1481,0},{137,1481,0},{138,1481,0},{139,1481,0}],
    starProps = [{138,0.501,1006},{143,0.716,585}]
    };
getRow(14,6)->
    #equipstarCfg {
    level = 14,
    type = 6,
    desc = "[4674F9]蓝色4星[-]",
    limit_level = 1,
    ratio = 0.52,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.49,
    cost_item = 225,
    cost_num = 50,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 20000,
    allbonus = [{135,14819,0},{136,1481,0},{137,1481,0},{138,1481,0},{139,1481,0}],
    starProps = [{139,0.215,431},{144,0.716,602}]
    };
getRow(14,7)->
    #equipstarCfg {
    level = 14,
    type = 7,
    desc = "[4674F9]蓝色4星[-]",
    limit_level = 1,
    ratio = 0.52,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.49,
    cost_item = 225,
    cost_num = 50,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 20000,
    allbonus = [{135,14819,0},{136,1481,0},{137,1481,0},{138,1481,0},{139,1481,0}],
    starProps = [{139,0.501,1006},{141,0.716,806}]
    };
getRow(15,0)->
    #equipstarCfg {
    level = 15,
    type = 0,
    desc = "[4674F9]蓝色5星[-]",
    limit_level = 1,
    ratio = 0.55,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.46,
    cost_item = 225,
    cost_num = 50,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 20000,
    allbonus = [{135,16617,0},{136,1661,0},{137,1661,0},{138,1661,0},{139,1661,0}],
    starProps = [{136,0.574,1011},{137,0.574,1011},{140,0.82,1150}]
    };
getRow(15,1)->
    #equipstarCfg {
    level = 15,
    type = 1,
    desc = "[4674F9]蓝色5星[-]",
    limit_level = 1,
    ratio = 0.55,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.46,
    cost_item = 225,
    cost_num = 50,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 20000,
    allbonus = [{135,16617,0},{136,1661,0},{137,1661,0},{138,1661,0},{139,1661,0}],
    starProps = [{135,0.328,5778},{160,0.82,406}]
    };
getRow(15,2)->
    #equipstarCfg {
    level = 15,
    type = 2,
    desc = "[4674F9]蓝色5星[-]",
    limit_level = 1,
    ratio = 0.55,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.46,
    cost_item = 225,
    cost_num = 50,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 20000,
    allbonus = [{135,16617,0},{136,1661,0},{137,1661,0},{138,1661,0},{139,1661,0}],
    starProps = [{136,0.246,433},{137,0.246,433},{145,0.82,866}]
    };
getRow(15,3)->
    #equipstarCfg {
    level = 15,
    type = 3,
    desc = "[4674F9]蓝色5星[-]",
    limit_level = 1,
    ratio = 0.55,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.46,
    cost_item = 225,
    cost_num = 50,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 20000,
    allbonus = [{135,16617,0},{136,1661,0},{137,1661,0},{138,1661,0},{139,1661,0}],
    starProps = [{135,0.492,8667},{142,0.82,695}]
    };
getRow(15,4)->
    #equipstarCfg {
    level = 15,
    type = 4,
    desc = "[4674F9]蓝色5星[-]",
    limit_level = 1,
    ratio = 0.55,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.46,
    cost_item = 225,
    cost_num = 50,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 20000,
    allbonus = [{135,16617,0},{136,1661,0},{137,1661,0},{138,1661,0},{139,1661,0}],
    starProps = [{138,0.246,433},{146,0.82,577}]
    };
getRow(15,5)->
    #equipstarCfg {
    level = 15,
    type = 5,
    desc = "[4674F9]蓝色5星[-]",
    limit_level = 1,
    ratio = 0.55,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.46,
    cost_item = 225,
    cost_num = 50,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 20000,
    allbonus = [{135,16617,0},{136,1661,0},{137,1661,0},{138,1661,0},{139,1661,0}],
    starProps = [{138,0.574,1011},{143,0.82,588}]
    };
getRow(15,6)->
    #equipstarCfg {
    level = 15,
    type = 6,
    desc = "[4674F9]蓝色5星[-]",
    limit_level = 1,
    ratio = 0.55,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.46,
    cost_item = 225,
    cost_num = 50,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 20000,
    allbonus = [{135,16617,0},{136,1661,0},{137,1661,0},{138,1661,0},{139,1661,0}],
    starProps = [{139,0.246,433},{144,0.82,605}]
    };
getRow(15,7)->
    #equipstarCfg {
    level = 15,
    type = 7,
    desc = "[4674F9]蓝色5星[-]",
    limit_level = 1,
    ratio = 0.55,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 0,
    odd = 0.46,
    cost_item = 225,
    cost_num = 50,
    transform_item = 0,
    transform_num = 0,
    cost_coin = 20000,
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

