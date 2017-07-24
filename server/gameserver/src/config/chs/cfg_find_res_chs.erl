%% coding: latin-1
%%: 实现
-module(cfg_find_res_chs).
-compile(export_all).
-include("cfg_find_res.hrl").
-include("logger.hrl").

getRow(1)->
    #find_resCfg {
    id = 1,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 31,
    lvl_e = 31,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 7900,
    type_number = [{1,7500}],
    value = 80
    };
getRow(2)->
    #find_resCfg {
    id = 2,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 31,
    lvl_e = 31,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 9900,
    type_number = [{1,7750}],
    value = 80
    };
getRow(3)->
    #find_resCfg {
    id = 3,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 32,
    lvl_e = 32,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 12100,
    type_number = [{1,8000}],
    value = 80
    };
getRow(4)->
    #find_resCfg {
    id = 4,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 33,
    lvl_e = 33,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 13000,
    type_number = [{1,8250}],
    value = 80
    };
getRow(5)->
    #find_resCfg {
    id = 5,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 34,
    lvl_e = 34,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 12500,
    type_number = [{1,8500}],
    value = 80
    };
getRow(6)->
    #find_resCfg {
    id = 6,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 35,
    lvl_e = 35,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 14800,
    type_number = [{1,8750}],
    value = 80
    };
getRow(7)->
    #find_resCfg {
    id = 7,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 36,
    lvl_e = 36,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 20300,
    type_number = [{1,9000}],
    value = 80
    };
getRow(8)->
    #find_resCfg {
    id = 8,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 37,
    lvl_e = 37,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 26400,
    type_number = [{1,9250}],
    value = 80
    };
getRow(9)->
    #find_resCfg {
    id = 9,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 38,
    lvl_e = 38,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 34700,
    type_number = [{1,9500}],
    value = 80
    };
getRow(10)->
    #find_resCfg {
    id = 10,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 39,
    lvl_e = 39,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 40600,
    type_number = [{1,9750}],
    value = 80
    };
getRow(11)->
    #find_resCfg {
    id = 11,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 40,
    lvl_e = 40,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 39200,
    type_number = [{1,10000}],
    value = 80
    };
getRow(12)->
    #find_resCfg {
    id = 12,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 41,
    lvl_e = 41,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 41500,
    type_number = [{1,10250}],
    value = 80
    };
getRow(13)->
    #find_resCfg {
    id = 13,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 42,
    lvl_e = 42,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 43700,
    type_number = [{1,10500}],
    value = 80
    };
getRow(14)->
    #find_resCfg {
    id = 14,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 43,
    lvl_e = 43,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 46300,
    type_number = [{1,10750}],
    value = 80
    };
getRow(15)->
    #find_resCfg {
    id = 15,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 44,
    lvl_e = 44,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 48500,
    type_number = [{1,11000}],
    value = 80
    };
getRow(16)->
    #find_resCfg {
    id = 16,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 45,
    lvl_e = 45,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 51100,
    type_number = [{1,11250}],
    value = 80
    };
getRow(17)->
    #find_resCfg {
    id = 17,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 46,
    lvl_e = 46,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 53700,
    type_number = [{1,11500}],
    value = 80
    };
getRow(18)->
    #find_resCfg {
    id = 18,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 47,
    lvl_e = 47,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 56300,
    type_number = [{1,11750}],
    value = 80
    };
getRow(19)->
    #find_resCfg {
    id = 19,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 48,
    lvl_e = 48,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 59300,
    type_number = [{1,12000}],
    value = 80
    };
getRow(20)->
    #find_resCfg {
    id = 20,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 49,
    lvl_e = 49,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,12250}],
    value = 80
    };
getRow(21)->
    #find_resCfg {
    id = 21,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 50,
    lvl_e = 50,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,12500}],
    value = 80
    };
getRow(22)->
    #find_resCfg {
    id = 22,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 51,
    lvl_e = 51,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,12750}],
    value = 80
    };
getRow(23)->
    #find_resCfg {
    id = 23,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 52,
    lvl_e = 52,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,13000}],
    value = 80
    };
getRow(24)->
    #find_resCfg {
    id = 24,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 53,
    lvl_e = 53,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,13250}],
    value = 80
    };
getRow(25)->
    #find_resCfg {
    id = 25,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 54,
    lvl_e = 54,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,13500}],
    value = 80
    };
getRow(26)->
    #find_resCfg {
    id = 26,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 55,
    lvl_e = 55,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,13750}],
    value = 80
    };
getRow(27)->
    #find_resCfg {
    id = 27,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 56,
    lvl_e = 56,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,14000}],
    value = 80
    };
getRow(28)->
    #find_resCfg {
    id = 28,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 57,
    lvl_e = 57,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,14250}],
    value = 80
    };
getRow(29)->
    #find_resCfg {
    id = 29,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 58,
    lvl_e = 58,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,14500}],
    value = 80
    };
getRow(30)->
    #find_resCfg {
    id = 30,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 59,
    lvl_e = 59,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,14750}],
    value = 80
    };
getRow(31)->
    #find_resCfg {
    id = 31,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 60,
    lvl_e = 60,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,15000}],
    value = 80
    };
getRow(32)->
    #find_resCfg {
    id = 32,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 61,
    lvl_e = 61,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,15250}],
    value = 80
    };
getRow(33)->
    #find_resCfg {
    id = 33,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 62,
    lvl_e = 62,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,15500}],
    value = 80
    };
getRow(34)->
    #find_resCfg {
    id = 34,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 63,
    lvl_e = 63,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,15750}],
    value = 80
    };
getRow(35)->
    #find_resCfg {
    id = 35,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 64,
    lvl_e = 64,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,16000}],
    value = 80
    };
getRow(36)->
    #find_resCfg {
    id = 36,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 65,
    lvl_e = 65,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,16250}],
    value = 80
    };
getRow(37)->
    #find_resCfg {
    id = 37,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 66,
    lvl_e = 66,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,16500}],
    value = 80
    };
getRow(38)->
    #find_resCfg {
    id = 38,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 67,
    lvl_e = 67,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,16750}],
    value = 80
    };
getRow(39)->
    #find_resCfg {
    id = 39,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 68,
    lvl_e = 68,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,17000}],
    value = 80
    };
getRow(40)->
    #find_resCfg {
    id = 40,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 69,
    lvl_e = 69,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,17250}],
    value = 80
    };
getRow(41)->
    #find_resCfg {
    id = 41,
    ac_id = 2,
    name = "公会的委托",
    max_times = 2,
    open_level = 31,
    lvl_s = 70,
    lvl_e = 75,
    diamonds_find = 2,
    use_diamond = 25,
    ext_item = [4200,1],
    reward_exp = 61900,
    type_number = [{1,17500}],
    value = 80
    };
getRow(42)->
    #find_resCfg {
    id = 42,
    ac_id = 1,
    name = "守卫女神",
    max_times = 1,
    open_level = 25,
    lvl_s = 25,
    lvl_e = 75,
    diamonds_find = 2,
    use_diamond = 30,
    ext_item = [20,100],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(43)->
    #find_resCfg {
    id = 43,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 23,
    lvl_s = 23,
    lvl_e = 23,
    diamonds_find = 2,
    use_diamond = 35,
    ext_item = [],
    reward_exp = 0,
    type_number = [{1,60000}],
    value = 100
    };
getRow(44)->
    #find_resCfg {
    id = 44,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 23,
    lvl_s = 24,
    lvl_e = 24,
    diamonds_find = 2,
    use_diamond = 35,
    ext_item = [],
    reward_exp = 0,
    type_number = [{1,63500}],
    value = 100
    };
getRow(45)->
    #find_resCfg {
    id = 45,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 23,
    lvl_s = 25,
    lvl_e = 25,
    diamonds_find = 2,
    use_diamond = 35,
    ext_item = [],
    reward_exp = 0,
    type_number = [{1,67000}],
    value = 100
    };
getRow(46)->
    #find_resCfg {
    id = 46,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 23,
    lvl_s = 26,
    lvl_e = 26,
    diamonds_find = 2,
    use_diamond = 35,
    ext_item = [],
    reward_exp = 0,
    type_number = [{1,70500}],
    value = 100
    };
getRow(47)->
    #find_resCfg {
    id = 47,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 23,
    lvl_s = 27,
    lvl_e = 27,
    diamonds_find = 2,
    use_diamond = 35,
    ext_item = [],
    reward_exp = 0,
    type_number = [{1,74000}],
    value = 100
    };
getRow(48)->
    #find_resCfg {
    id = 48,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 23,
    lvl_s = 28,
    lvl_e = 28,
    diamonds_find = 2,
    use_diamond = 35,
    ext_item = [],
    reward_exp = 0,
    type_number = [{1,77500}],
    value = 100
    };
getRow(49)->
    #find_resCfg {
    id = 49,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 23,
    lvl_s = 29,
    lvl_e = 29,
    diamonds_find = 2,
    use_diamond = 35,
    ext_item = [],
    reward_exp = 0,
    type_number = [{1,81000}],
    value = 100
    };
getRow(50)->
    #find_resCfg {
    id = 50,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 23,
    lvl_s = 30,
    lvl_e = 30,
    diamonds_find = 2,
    use_diamond = 35,
    ext_item = [],
    reward_exp = 0,
    type_number = [{1,84500}],
    value = 100
    };
getRow(51)->
    #find_resCfg {
    id = 51,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 23,
    lvl_s = 31,
    lvl_e = 31,
    diamonds_find = 2,
    use_diamond = 35,
    ext_item = [],
    reward_exp = 0,
    type_number = [{1,88000}],
    value = 100
    };
getRow(52)->
    #find_resCfg {
    id = 52,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 23,
    lvl_s = 32,
    lvl_e = 32,
    diamonds_find = 2,
    use_diamond = 35,
    ext_item = [],
    reward_exp = 0,
    type_number = [{1,91500}],
    value = 100
    };
getRow(53)->
    #find_resCfg {
    id = 53,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 23,
    lvl_s = 33,
    lvl_e = 33,
    diamonds_find = 2,
    use_diamond = 35,
    ext_item = [],
    reward_exp = 0,
    type_number = [{1,95000}],
    value = 100
    };
getRow(54)->
    #find_resCfg {
    id = 54,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 23,
    lvl_s = 34,
    lvl_e = 34,
    diamonds_find = 2,
    use_diamond = 35,
    ext_item = [],
    reward_exp = 0,
    type_number = [{1,98500}],
    value = 100
    };
getRow(55)->
    #find_resCfg {
    id = 55,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 23,
    lvl_s = 35,
    lvl_e = 75,
    diamonds_find = 2,
    use_diamond = 35,
    ext_item = [],
    reward_exp = 0,
    type_number = [{1,100000}],
    value = 100
    };
getRow(56)->
    #find_resCfg {
    id = 56,
    ac_id = 7,
    name = "竞技场",
    max_times = 5,
    open_level = 22,
    lvl_s = 22,
    lvl_e = 75,
    diamonds_find = 2,
    use_diamond = 20,
    ext_item = [902,4],
    reward_exp = 0,
    type_number = [],
    value = 30
    };
getRow(57)->
    #find_resCfg {
    id = 57,
    ac_id = 8,
    name = "萝莉与绅士",
    max_times = 2,
    open_level = 18,
    lvl_s = 18,
    lvl_e = 29,
    diamonds_find = 2,
    use_diamond = 20,
    ext_item = [],
    reward_exp = 6000,
    type_number = [],
    value = 80
    };
getRow(58)->
    #find_resCfg {
    id = 58,
    ac_id = 8,
    name = "萝莉与绅士",
    max_times = 2,
    open_level = 30,
    lvl_s = 30,
    lvl_e = 75,
    diamonds_find = 2,
    use_diamond = 20,
    ext_item = [],
    reward_exp = 10000,
    type_number = [],
    value = 80
    };
getRow(59)->
    #find_resCfg {
    id = 59,
    ac_id = 10,
    name = "元素保卫战",
    max_times = 2,
    open_level = 30,
    lvl_s = 30,
    lvl_e = 75,
    diamonds_find = 2,
    use_diamond = 15,
    ext_item = [7000,50],
    reward_exp = 0,
    type_number = [],
    value = 80
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
    {59}
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
    59
    ].

