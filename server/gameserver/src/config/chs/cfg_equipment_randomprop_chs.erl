%% coding: latin-1
%%: 实现
-module(cfg_equipment_randomprop_chs).
-compile(export_all).
-include("cfg_equipment_randomprop.hrl").
-include("logger.hrl").

getRow(1,135)->
    #equipment_randompropCfg {
    id = 1,
    propid = 135,
    probability = 1000,
    min = 0,
    max = 25679,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(1,136)->
    #equipment_randompropCfg {
    id = 1,
    propid = 136,
    probability = 3000,
    min = 0,
    max = 2567,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(1,140)->
    #equipment_randompropCfg {
    id = 1,
    propid = 140,
    probability = 2000,
    min = 0,
    max = 2043,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(1,142)->
    #equipment_randompropCfg {
    id = 1,
    propid = 142,
    probability = 1500,
    min = 0,
    max = 1235,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(1,144)->
    #equipment_randompropCfg {
    id = 1,
    propid = 144,
    probability = 1500,
    min = 0,
    max = 1075,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(1,146)->
    #equipment_randompropCfg {
    id = 1,
    propid = 146,
    probability = 1000,
    min = 0,
    max = 1026,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(2,135)->
    #equipment_randompropCfg {
    id = 2,
    propid = 135,
    probability = 2000,
    min = 0,
    max = 25679,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(2,138)->
    #equipment_randompropCfg {
    id = 2,
    propid = 138,
    probability = 1500,
    min = 0,
    max = 2567,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(2,139)->
    #equipment_randompropCfg {
    id = 2,
    propid = 139,
    probability = 1000,
    min = 0,
    max = 2567,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(2,141)->
    #equipment_randompropCfg {
    id = 2,
    propid = 141,
    probability = 3000,
    min = 0,
    max = 1439,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(2,145)->
    #equipment_randompropCfg {
    id = 2,
    propid = 145,
    probability = 1500,
    min = 0,
    max = 1539,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(2,160)->
    #equipment_randompropCfg {
    id = 2,
    propid = 160,
    probability = 1000,
    min = 0,
    max = 721,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(3,136)->
    #equipment_randompropCfg {
    id = 3,
    propid = 136,
    probability = 2000,
    min = 0,
    max = 2567,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(3,140)->
    #equipment_randompropCfg {
    id = 3,
    propid = 140,
    probability = 1500,
    min = 0,
    max = 2043,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(3,142)->
    #equipment_randompropCfg {
    id = 3,
    propid = 142,
    probability = 3000,
    min = 0,
    max = 1235,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(3,143)->
    #equipment_randompropCfg {
    id = 3,
    propid = 143,
    probability = 1000,
    min = 0,
    max = 1045,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(3,144)->
    #equipment_randompropCfg {
    id = 3,
    propid = 144,
    probability = 1500,
    min = 0,
    max = 1075,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(3,146)->
    #equipment_randompropCfg {
    id = 3,
    propid = 146,
    probability = 1000,
    min = 0,
    max = 1026,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(4,135)->
    #equipment_randompropCfg {
    id = 4,
    propid = 135,
    probability = 3000,
    min = 0,
    max = 25679,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(4,141)->
    #equipment_randompropCfg {
    id = 4,
    propid = 141,
    probability = 1500,
    min = 0,
    max = 1439,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(4,143)->
    #equipment_randompropCfg {
    id = 4,
    propid = 143,
    probability = 1000,
    min = 0,
    max = 1045,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(4,144)->
    #equipment_randompropCfg {
    id = 4,
    propid = 144,
    probability = 1000,
    min = 0,
    max = 1075,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(4,146)->
    #equipment_randompropCfg {
    id = 4,
    propid = 146,
    probability = 1500,
    min = 0,
    max = 1026,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(4,160)->
    #equipment_randompropCfg {
    id = 4,
    propid = 160,
    probability = 2000,
    min = 0,
    max = 721,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(5,136)->
    #equipment_randompropCfg {
    id = 5,
    propid = 136,
    probability = 1000,
    min = 0,
    max = 2567,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(5,138)->
    #equipment_randompropCfg {
    id = 5,
    propid = 138,
    probability = 2000,
    min = 0,
    max = 2567,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(5,140)->
    #equipment_randompropCfg {
    id = 5,
    propid = 140,
    probability = 1500,
    min = 0,
    max = 2043,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(5,142)->
    #equipment_randompropCfg {
    id = 5,
    propid = 142,
    probability = 1500,
    min = 0,
    max = 1235,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(5,145)->
    #equipment_randompropCfg {
    id = 5,
    propid = 145,
    probability = 1000,
    min = 0,
    max = 1539,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(5,146)->
    #equipment_randompropCfg {
    id = 5,
    propid = 146,
    probability = 3000,
    min = 0,
    max = 1026,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(6,135)->
    #equipment_randompropCfg {
    id = 6,
    propid = 135,
    probability = 1500,
    min = 0,
    max = 25679,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(6,138)->
    #equipment_randompropCfg {
    id = 6,
    propid = 138,
    probability = 3000,
    min = 0,
    max = 2567,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(6,139)->
    #equipment_randompropCfg {
    id = 6,
    propid = 139,
    probability = 1500,
    min = 0,
    max = 2567,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(6,143)->
    #equipment_randompropCfg {
    id = 6,
    propid = 143,
    probability = 2000,
    min = 0,
    max = 1045,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(6,145)->
    #equipment_randompropCfg {
    id = 6,
    propid = 145,
    probability = 1000,
    min = 0,
    max = 1539,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(6,160)->
    #equipment_randompropCfg {
    id = 6,
    propid = 160,
    probability = 1000,
    min = 0,
    max = 721,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(7,136)->
    #equipment_randompropCfg {
    id = 7,
    propid = 136,
    probability = 1000,
    min = 0,
    max = 2567,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(7,139)->
    #equipment_randompropCfg {
    id = 7,
    propid = 139,
    probability = 2000,
    min = 0,
    max = 2567,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(7,140)->
    #equipment_randompropCfg {
    id = 7,
    propid = 140,
    probability = 1000,
    min = 0,
    max = 2043,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(7,141)->
    #equipment_randompropCfg {
    id = 7,
    propid = 141,
    probability = 1500,
    min = 0,
    max = 1439,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(7,142)->
    #equipment_randompropCfg {
    id = 7,
    propid = 142,
    probability = 1500,
    min = 0,
    max = 1235,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(7,144)->
    #equipment_randompropCfg {
    id = 7,
    propid = 144,
    probability = 3000,
    min = 0,
    max = 1075,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(8,138)->
    #equipment_randompropCfg {
    id = 8,
    propid = 138,
    probability = 1000,
    min = 0,
    max = 2567,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(8,139)->
    #equipment_randompropCfg {
    id = 8,
    propid = 139,
    probability = 3000,
    min = 0,
    max = 2567,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(8,141)->
    #equipment_randompropCfg {
    id = 8,
    propid = 141,
    probability = 1500,
    min = 0,
    max = 1439,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(8,143)->
    #equipment_randompropCfg {
    id = 8,
    propid = 143,
    probability = 1500,
    min = 0,
    max = 1045,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(8,145)->
    #equipment_randompropCfg {
    id = 8,
    propid = 145,
    probability = 2000,
    min = 0,
    max = 1539,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(8,160)->
    #equipment_randompropCfg {
    id = 8,
    propid = 160,
    probability = 1000,
    min = 0,
    max = 721,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(11,135)->
    #equipment_randompropCfg {
    id = 11,
    propid = 135,
    probability = 1000,
    min = 0,
    max = 32099,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(11,136)->
    #equipment_randompropCfg {
    id = 11,
    propid = 136,
    probability = 3000,
    min = 0,
    max = 3209,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(11,140)->
    #equipment_randompropCfg {
    id = 11,
    propid = 140,
    probability = 2000,
    min = 0,
    max = 2555,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(11,142)->
    #equipment_randompropCfg {
    id = 11,
    propid = 142,
    probability = 1500,
    min = 0,
    max = 1544,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(11,144)->
    #equipment_randompropCfg {
    id = 11,
    propid = 144,
    probability = 1500,
    min = 0,
    max = 1345,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(11,146)->
    #equipment_randompropCfg {
    id = 11,
    propid = 146,
    probability = 1000,
    min = 0,
    max = 1283,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(12,135)->
    #equipment_randompropCfg {
    id = 12,
    propid = 135,
    probability = 2000,
    min = 0,
    max = 32099,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(12,138)->
    #equipment_randompropCfg {
    id = 12,
    propid = 138,
    probability = 1500,
    min = 0,
    max = 3209,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(12,139)->
    #equipment_randompropCfg {
    id = 12,
    propid = 139,
    probability = 1000,
    min = 0,
    max = 3209,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(12,141)->
    #equipment_randompropCfg {
    id = 12,
    propid = 141,
    probability = 3000,
    min = 0,
    max = 1800,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(12,145)->
    #equipment_randompropCfg {
    id = 12,
    propid = 145,
    probability = 1500,
    min = 0,
    max = 1925,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(12,160)->
    #equipment_randompropCfg {
    id = 12,
    propid = 160,
    probability = 1000,
    min = 0,
    max = 902,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(13,136)->
    #equipment_randompropCfg {
    id = 13,
    propid = 136,
    probability = 2000,
    min = 0,
    max = 3209,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(13,140)->
    #equipment_randompropCfg {
    id = 13,
    propid = 140,
    probability = 1500,
    min = 0,
    max = 2555,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(13,142)->
    #equipment_randompropCfg {
    id = 13,
    propid = 142,
    probability = 3000,
    min = 0,
    max = 1544,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(13,143)->
    #equipment_randompropCfg {
    id = 13,
    propid = 143,
    probability = 1000,
    min = 0,
    max = 1306,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(13,144)->
    #equipment_randompropCfg {
    id = 13,
    propid = 144,
    probability = 1500,
    min = 0,
    max = 1345,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(13,146)->
    #equipment_randompropCfg {
    id = 13,
    propid = 146,
    probability = 1000,
    min = 0,
    max = 1283,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(14,135)->
    #equipment_randompropCfg {
    id = 14,
    propid = 135,
    probability = 3000,
    min = 0,
    max = 32099,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(14,141)->
    #equipment_randompropCfg {
    id = 14,
    propid = 141,
    probability = 1500,
    min = 0,
    max = 1800,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(14,143)->
    #equipment_randompropCfg {
    id = 14,
    propid = 143,
    probability = 1000,
    min = 0,
    max = 1306,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(14,144)->
    #equipment_randompropCfg {
    id = 14,
    propid = 144,
    probability = 1000,
    min = 0,
    max = 1345,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(14,146)->
    #equipment_randompropCfg {
    id = 14,
    propid = 146,
    probability = 1500,
    min = 0,
    max = 1283,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(14,160)->
    #equipment_randompropCfg {
    id = 14,
    propid = 160,
    probability = 2000,
    min = 0,
    max = 902,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(15,136)->
    #equipment_randompropCfg {
    id = 15,
    propid = 136,
    probability = 1000,
    min = 0,
    max = 3209,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(15,138)->
    #equipment_randompropCfg {
    id = 15,
    propid = 138,
    probability = 2000,
    min = 0,
    max = 3209,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(15,140)->
    #equipment_randompropCfg {
    id = 15,
    propid = 140,
    probability = 1500,
    min = 0,
    max = 2555,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(15,142)->
    #equipment_randompropCfg {
    id = 15,
    propid = 142,
    probability = 1500,
    min = 0,
    max = 1544,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(15,145)->
    #equipment_randompropCfg {
    id = 15,
    propid = 145,
    probability = 1000,
    min = 0,
    max = 1925,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(15,146)->
    #equipment_randompropCfg {
    id = 15,
    propid = 146,
    probability = 3000,
    min = 0,
    max = 1283,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(16,135)->
    #equipment_randompropCfg {
    id = 16,
    propid = 135,
    probability = 1500,
    min = 0,
    max = 32099,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(16,138)->
    #equipment_randompropCfg {
    id = 16,
    propid = 138,
    probability = 3000,
    min = 0,
    max = 3209,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(16,139)->
    #equipment_randompropCfg {
    id = 16,
    propid = 139,
    probability = 1500,
    min = 0,
    max = 3209,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(16,143)->
    #equipment_randompropCfg {
    id = 16,
    propid = 143,
    probability = 2000,
    min = 0,
    max = 1306,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(16,145)->
    #equipment_randompropCfg {
    id = 16,
    propid = 145,
    probability = 1000,
    min = 0,
    max = 1925,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(16,160)->
    #equipment_randompropCfg {
    id = 16,
    propid = 160,
    probability = 1000,
    min = 0,
    max = 902,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(17,136)->
    #equipment_randompropCfg {
    id = 17,
    propid = 136,
    probability = 1000,
    min = 0,
    max = 3209,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(17,139)->
    #equipment_randompropCfg {
    id = 17,
    propid = 139,
    probability = 2000,
    min = 0,
    max = 3209,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(17,140)->
    #equipment_randompropCfg {
    id = 17,
    propid = 140,
    probability = 1000,
    min = 0,
    max = 2555,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(17,141)->
    #equipment_randompropCfg {
    id = 17,
    propid = 141,
    probability = 1500,
    min = 0,
    max = 1800,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(17,142)->
    #equipment_randompropCfg {
    id = 17,
    propid = 142,
    probability = 1500,
    min = 0,
    max = 1544,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(17,144)->
    #equipment_randompropCfg {
    id = 17,
    propid = 144,
    probability = 3000,
    min = 0,
    max = 1345,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(18,138)->
    #equipment_randompropCfg {
    id = 18,
    propid = 138,
    probability = 1000,
    min = 0,
    max = 3209,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(18,139)->
    #equipment_randompropCfg {
    id = 18,
    propid = 139,
    probability = 3000,
    min = 0,
    max = 3209,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(18,141)->
    #equipment_randompropCfg {
    id = 18,
    propid = 141,
    probability = 1500,
    min = 0,
    max = 1800,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(18,143)->
    #equipment_randompropCfg {
    id = 18,
    propid = 143,
    probability = 1500,
    min = 0,
    max = 1306,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(18,145)->
    #equipment_randompropCfg {
    id = 18,
    propid = 145,
    probability = 2000,
    min = 0,
    max = 1925,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(18,160)->
    #equipment_randompropCfg {
    id = 18,
    propid = 160,
    probability = 1000,
    min = 0,
    max = 902,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(21,135)->
    #equipment_randompropCfg {
    id = 21,
    propid = 135,
    probability = 1000,
    min = 0,
    max = 38519,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(21,136)->
    #equipment_randompropCfg {
    id = 21,
    propid = 136,
    probability = 3000,
    min = 0,
    max = 3851,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(21,140)->
    #equipment_randompropCfg {
    id = 21,
    propid = 140,
    probability = 2000,
    min = 0,
    max = 3066,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(21,142)->
    #equipment_randompropCfg {
    id = 21,
    propid = 142,
    probability = 1500,
    min = 0,
    max = 1853,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(21,144)->
    #equipment_randompropCfg {
    id = 21,
    propid = 144,
    probability = 1500,
    min = 0,
    max = 1614,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(21,146)->
    #equipment_randompropCfg {
    id = 21,
    propid = 146,
    probability = 1000,
    min = 0,
    max = 1539,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(22,135)->
    #equipment_randompropCfg {
    id = 22,
    propid = 135,
    probability = 2000,
    min = 0,
    max = 38519,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(22,138)->
    #equipment_randompropCfg {
    id = 22,
    propid = 138,
    probability = 1500,
    min = 0,
    max = 3851,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(22,139)->
    #equipment_randompropCfg {
    id = 22,
    propid = 139,
    probability = 1000,
    min = 0,
    max = 3851,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(22,141)->
    #equipment_randompropCfg {
    id = 22,
    propid = 141,
    probability = 3000,
    min = 0,
    max = 2160,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(22,145)->
    #equipment_randompropCfg {
    id = 22,
    propid = 145,
    probability = 1500,
    min = 0,
    max = 2310,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(22,160)->
    #equipment_randompropCfg {
    id = 22,
    propid = 160,
    probability = 1000,
    min = 0,
    max = 1083,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(23,136)->
    #equipment_randompropCfg {
    id = 23,
    propid = 136,
    probability = 2000,
    min = 0,
    max = 3851,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(23,140)->
    #equipment_randompropCfg {
    id = 23,
    propid = 140,
    probability = 1500,
    min = 0,
    max = 3066,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(23,142)->
    #equipment_randompropCfg {
    id = 23,
    propid = 142,
    probability = 3000,
    min = 0,
    max = 1853,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(23,143)->
    #equipment_randompropCfg {
    id = 23,
    propid = 143,
    probability = 1000,
    min = 0,
    max = 1568,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(23,144)->
    #equipment_randompropCfg {
    id = 23,
    propid = 144,
    probability = 1500,
    min = 0,
    max = 1614,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(23,146)->
    #equipment_randompropCfg {
    id = 23,
    propid = 146,
    probability = 1000,
    min = 0,
    max = 1539,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(24,135)->
    #equipment_randompropCfg {
    id = 24,
    propid = 135,
    probability = 3000,
    min = 0,
    max = 38519,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(24,141)->
    #equipment_randompropCfg {
    id = 24,
    propid = 141,
    probability = 1500,
    min = 0,
    max = 2160,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(24,143)->
    #equipment_randompropCfg {
    id = 24,
    propid = 143,
    probability = 1000,
    min = 0,
    max = 1568,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(24,144)->
    #equipment_randompropCfg {
    id = 24,
    propid = 144,
    probability = 1000,
    min = 0,
    max = 1614,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(24,146)->
    #equipment_randompropCfg {
    id = 24,
    propid = 146,
    probability = 1500,
    min = 0,
    max = 1539,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(24,160)->
    #equipment_randompropCfg {
    id = 24,
    propid = 160,
    probability = 2000,
    min = 0,
    max = 1083,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(25,136)->
    #equipment_randompropCfg {
    id = 25,
    propid = 136,
    probability = 1000,
    min = 0,
    max = 3851,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(25,138)->
    #equipment_randompropCfg {
    id = 25,
    propid = 138,
    probability = 2000,
    min = 0,
    max = 3851,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(25,140)->
    #equipment_randompropCfg {
    id = 25,
    propid = 140,
    probability = 1500,
    min = 0,
    max = 3066,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(25,142)->
    #equipment_randompropCfg {
    id = 25,
    propid = 142,
    probability = 1500,
    min = 0,
    max = 1853,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(25,145)->
    #equipment_randompropCfg {
    id = 25,
    propid = 145,
    probability = 1000,
    min = 0,
    max = 2310,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(25,146)->
    #equipment_randompropCfg {
    id = 25,
    propid = 146,
    probability = 3000,
    min = 0,
    max = 1539,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(26,135)->
    #equipment_randompropCfg {
    id = 26,
    propid = 135,
    probability = 1500,
    min = 0,
    max = 38519,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(26,138)->
    #equipment_randompropCfg {
    id = 26,
    propid = 138,
    probability = 3000,
    min = 0,
    max = 3851,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(26,139)->
    #equipment_randompropCfg {
    id = 26,
    propid = 139,
    probability = 1500,
    min = 0,
    max = 3851,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(26,143)->
    #equipment_randompropCfg {
    id = 26,
    propid = 143,
    probability = 2000,
    min = 0,
    max = 1568,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(26,145)->
    #equipment_randompropCfg {
    id = 26,
    propid = 145,
    probability = 1000,
    min = 0,
    max = 2310,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(26,160)->
    #equipment_randompropCfg {
    id = 26,
    propid = 160,
    probability = 1000,
    min = 0,
    max = 1083,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(27,136)->
    #equipment_randompropCfg {
    id = 27,
    propid = 136,
    probability = 1000,
    min = 0,
    max = 3851,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(27,139)->
    #equipment_randompropCfg {
    id = 27,
    propid = 139,
    probability = 2000,
    min = 0,
    max = 3851,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(27,140)->
    #equipment_randompropCfg {
    id = 27,
    propid = 140,
    probability = 1000,
    min = 0,
    max = 3066,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(27,141)->
    #equipment_randompropCfg {
    id = 27,
    propid = 141,
    probability = 1500,
    min = 0,
    max = 2160,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(27,142)->
    #equipment_randompropCfg {
    id = 27,
    propid = 142,
    probability = 1500,
    min = 0,
    max = 1853,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(27,144)->
    #equipment_randompropCfg {
    id = 27,
    propid = 144,
    probability = 3000,
    min = 0,
    max = 1614,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(28,138)->
    #equipment_randompropCfg {
    id = 28,
    propid = 138,
    probability = 1000,
    min = 0,
    max = 3851,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(28,139)->
    #equipment_randompropCfg {
    id = 28,
    propid = 139,
    probability = 3000,
    min = 0,
    max = 3851,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(28,141)->
    #equipment_randompropCfg {
    id = 28,
    propid = 141,
    probability = 1500,
    min = 0,
    max = 2160,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(28,143)->
    #equipment_randompropCfg {
    id = 28,
    propid = 143,
    probability = 1500,
    min = 0,
    max = 1568,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(28,145)->
    #equipment_randompropCfg {
    id = 28,
    propid = 145,
    probability = 2000,
    min = 0,
    max = 2310,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(28,160)->
    #equipment_randompropCfg {
    id = 28,
    propid = 160,
    probability = 1000,
    min = 0,
    max = 1083,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(31,135)->
    #equipment_randompropCfg {
    id = 31,
    propid = 135,
    probability = 1000,
    min = 0,
    max = 44939,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(31,136)->
    #equipment_randompropCfg {
    id = 31,
    propid = 136,
    probability = 3000,
    min = 0,
    max = 4493,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(31,140)->
    #equipment_randompropCfg {
    id = 31,
    propid = 140,
    probability = 2000,
    min = 0,
    max = 3577,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(31,142)->
    #equipment_randompropCfg {
    id = 31,
    propid = 142,
    probability = 1500,
    min = 0,
    max = 2162,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(31,144)->
    #equipment_randompropCfg {
    id = 31,
    propid = 144,
    probability = 1500,
    min = 0,
    max = 1883,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(31,146)->
    #equipment_randompropCfg {
    id = 31,
    propid = 146,
    probability = 1000,
    min = 0,
    max = 1796,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(32,135)->
    #equipment_randompropCfg {
    id = 32,
    propid = 135,
    probability = 2000,
    min = 0,
    max = 44939,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(32,138)->
    #equipment_randompropCfg {
    id = 32,
    propid = 138,
    probability = 1500,
    min = 0,
    max = 4493,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(32,139)->
    #equipment_randompropCfg {
    id = 32,
    propid = 139,
    probability = 1000,
    min = 0,
    max = 4493,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(32,141)->
    #equipment_randompropCfg {
    id = 32,
    propid = 141,
    probability = 3000,
    min = 0,
    max = 2520,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(32,145)->
    #equipment_randompropCfg {
    id = 32,
    propid = 145,
    probability = 1500,
    min = 0,
    max = 2695,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(32,160)->
    #equipment_randompropCfg {
    id = 32,
    propid = 160,
    probability = 1000,
    min = 0,
    max = 1263,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(33,136)->
    #equipment_randompropCfg {
    id = 33,
    propid = 136,
    probability = 2000,
    min = 0,
    max = 4493,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(33,140)->
    #equipment_randompropCfg {
    id = 33,
    propid = 140,
    probability = 1500,
    min = 0,
    max = 3577,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(33,142)->
    #equipment_randompropCfg {
    id = 33,
    propid = 142,
    probability = 3000,
    min = 0,
    max = 2162,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(33,143)->
    #equipment_randompropCfg {
    id = 33,
    propid = 143,
    probability = 1000,
    min = 0,
    max = 1829,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(33,144)->
    #equipment_randompropCfg {
    id = 33,
    propid = 144,
    probability = 1500,
    min = 0,
    max = 1883,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(33,146)->
    #equipment_randompropCfg {
    id = 33,
    propid = 146,
    probability = 1000,
    min = 0,
    max = 1796,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(34,135)->
    #equipment_randompropCfg {
    id = 34,
    propid = 135,
    probability = 3000,
    min = 0,
    max = 44939,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(34,141)->
    #equipment_randompropCfg {
    id = 34,
    propid = 141,
    probability = 1500,
    min = 0,
    max = 2520,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(34,143)->
    #equipment_randompropCfg {
    id = 34,
    propid = 143,
    probability = 1000,
    min = 0,
    max = 1829,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(34,144)->
    #equipment_randompropCfg {
    id = 34,
    propid = 144,
    probability = 1000,
    min = 0,
    max = 1883,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(34,146)->
    #equipment_randompropCfg {
    id = 34,
    propid = 146,
    probability = 1500,
    min = 0,
    max = 1796,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(34,160)->
    #equipment_randompropCfg {
    id = 34,
    propid = 160,
    probability = 2000,
    min = 0,
    max = 1263,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(35,136)->
    #equipment_randompropCfg {
    id = 35,
    propid = 136,
    probability = 1000,
    min = 0,
    max = 4493,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(35,138)->
    #equipment_randompropCfg {
    id = 35,
    propid = 138,
    probability = 2000,
    min = 0,
    max = 4493,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(35,140)->
    #equipment_randompropCfg {
    id = 35,
    propid = 140,
    probability = 1500,
    min = 0,
    max = 3577,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(35,142)->
    #equipment_randompropCfg {
    id = 35,
    propid = 142,
    probability = 1500,
    min = 0,
    max = 2162,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(35,145)->
    #equipment_randompropCfg {
    id = 35,
    propid = 145,
    probability = 1000,
    min = 0,
    max = 2695,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(35,146)->
    #equipment_randompropCfg {
    id = 35,
    propid = 146,
    probability = 3000,
    min = 0,
    max = 1796,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(36,135)->
    #equipment_randompropCfg {
    id = 36,
    propid = 135,
    probability = 1500,
    min = 0,
    max = 44939,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(36,138)->
    #equipment_randompropCfg {
    id = 36,
    propid = 138,
    probability = 3000,
    min = 0,
    max = 4493,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(36,139)->
    #equipment_randompropCfg {
    id = 36,
    propid = 139,
    probability = 1500,
    min = 0,
    max = 4493,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(36,143)->
    #equipment_randompropCfg {
    id = 36,
    propid = 143,
    probability = 2000,
    min = 0,
    max = 1829,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(36,145)->
    #equipment_randompropCfg {
    id = 36,
    propid = 145,
    probability = 1000,
    min = 0,
    max = 2695,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(36,160)->
    #equipment_randompropCfg {
    id = 36,
    propid = 160,
    probability = 1000,
    min = 0,
    max = 1263,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(37,136)->
    #equipment_randompropCfg {
    id = 37,
    propid = 136,
    probability = 1000,
    min = 0,
    max = 4493,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(37,139)->
    #equipment_randompropCfg {
    id = 37,
    propid = 139,
    probability = 2000,
    min = 0,
    max = 4493,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(37,140)->
    #equipment_randompropCfg {
    id = 37,
    propid = 140,
    probability = 1000,
    min = 0,
    max = 3577,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(37,141)->
    #equipment_randompropCfg {
    id = 37,
    propid = 141,
    probability = 1500,
    min = 0,
    max = 2520,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(37,142)->
    #equipment_randompropCfg {
    id = 37,
    propid = 142,
    probability = 1500,
    min = 0,
    max = 2162,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(37,144)->
    #equipment_randompropCfg {
    id = 37,
    propid = 144,
    probability = 3000,
    min = 0,
    max = 1883,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(38,138)->
    #equipment_randompropCfg {
    id = 38,
    propid = 138,
    probability = 1000,
    min = 0,
    max = 4493,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(38,139)->
    #equipment_randompropCfg {
    id = 38,
    propid = 139,
    probability = 3000,
    min = 0,
    max = 4493,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(38,141)->
    #equipment_randompropCfg {
    id = 38,
    propid = 141,
    probability = 1500,
    min = 0,
    max = 2520,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(38,143)->
    #equipment_randompropCfg {
    id = 38,
    propid = 143,
    probability = 1500,
    min = 0,
    max = 1829,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(38,145)->
    #equipment_randompropCfg {
    id = 38,
    propid = 145,
    probability = 2000,
    min = 0,
    max = 2695,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(38,160)->
    #equipment_randompropCfg {
    id = 38,
    propid = 160,
    probability = 1000,
    min = 0,
    max = 1263,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(41,135)->
    #equipment_randompropCfg {
    id = 41,
    propid = 135,
    probability = 1000,
    min = 0,
    max = 57779,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(41,136)->
    #equipment_randompropCfg {
    id = 41,
    propid = 136,
    probability = 3000,
    min = 0,
    max = 5777,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(41,140)->
    #equipment_randompropCfg {
    id = 41,
    propid = 140,
    probability = 2000,
    min = 0,
    max = 4599,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(41,142)->
    #equipment_randompropCfg {
    id = 41,
    propid = 142,
    probability = 1500,
    min = 0,
    max = 2780,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(41,144)->
    #equipment_randompropCfg {
    id = 41,
    propid = 144,
    probability = 1500,
    min = 0,
    max = 2421,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(41,146)->
    #equipment_randompropCfg {
    id = 41,
    propid = 146,
    probability = 1000,
    min = 0,
    max = 2310,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(42,135)->
    #equipment_randompropCfg {
    id = 42,
    propid = 135,
    probability = 2000,
    min = 0,
    max = 57779,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(42,138)->
    #equipment_randompropCfg {
    id = 42,
    propid = 138,
    probability = 1500,
    min = 0,
    max = 5777,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(42,139)->
    #equipment_randompropCfg {
    id = 42,
    propid = 139,
    probability = 1000,
    min = 0,
    max = 5777,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(42,141)->
    #equipment_randompropCfg {
    id = 42,
    propid = 141,
    probability = 3000,
    min = 0,
    max = 3240,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(42,145)->
    #equipment_randompropCfg {
    id = 42,
    propid = 145,
    probability = 1500,
    min = 0,
    max = 3465,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(42,160)->
    #equipment_randompropCfg {
    id = 42,
    propid = 160,
    probability = 1000,
    min = 0,
    max = 1625,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(43,136)->
    #equipment_randompropCfg {
    id = 43,
    propid = 136,
    probability = 2000,
    min = 0,
    max = 5777,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(43,140)->
    #equipment_randompropCfg {
    id = 43,
    propid = 140,
    probability = 1500,
    min = 0,
    max = 4599,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(43,142)->
    #equipment_randompropCfg {
    id = 43,
    propid = 142,
    probability = 3000,
    min = 0,
    max = 2780,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(43,143)->
    #equipment_randompropCfg {
    id = 43,
    propid = 143,
    probability = 1000,
    min = 0,
    max = 2352,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(43,144)->
    #equipment_randompropCfg {
    id = 43,
    propid = 144,
    probability = 1500,
    min = 0,
    max = 2421,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(43,146)->
    #equipment_randompropCfg {
    id = 43,
    propid = 146,
    probability = 1000,
    min = 0,
    max = 2310,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(44,135)->
    #equipment_randompropCfg {
    id = 44,
    propid = 135,
    probability = 3000,
    min = 0,
    max = 57779,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(44,141)->
    #equipment_randompropCfg {
    id = 44,
    propid = 141,
    probability = 1500,
    min = 0,
    max = 3240,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(44,143)->
    #equipment_randompropCfg {
    id = 44,
    propid = 143,
    probability = 1000,
    min = 0,
    max = 2352,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(44,144)->
    #equipment_randompropCfg {
    id = 44,
    propid = 144,
    probability = 1000,
    min = 0,
    max = 2421,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(44,146)->
    #equipment_randompropCfg {
    id = 44,
    propid = 146,
    probability = 1500,
    min = 0,
    max = 2310,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(44,160)->
    #equipment_randompropCfg {
    id = 44,
    propid = 160,
    probability = 2000,
    min = 0,
    max = 1625,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(45,136)->
    #equipment_randompropCfg {
    id = 45,
    propid = 136,
    probability = 1000,
    min = 0,
    max = 5777,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(45,138)->
    #equipment_randompropCfg {
    id = 45,
    propid = 138,
    probability = 2000,
    min = 0,
    max = 5777,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(45,140)->
    #equipment_randompropCfg {
    id = 45,
    propid = 140,
    probability = 1500,
    min = 0,
    max = 4599,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(45,142)->
    #equipment_randompropCfg {
    id = 45,
    propid = 142,
    probability = 1500,
    min = 0,
    max = 2780,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(45,145)->
    #equipment_randompropCfg {
    id = 45,
    propid = 145,
    probability = 1000,
    min = 0,
    max = 3465,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(45,146)->
    #equipment_randompropCfg {
    id = 45,
    propid = 146,
    probability = 3000,
    min = 0,
    max = 2310,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(46,135)->
    #equipment_randompropCfg {
    id = 46,
    propid = 135,
    probability = 1500,
    min = 0,
    max = 57779,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(46,138)->
    #equipment_randompropCfg {
    id = 46,
    propid = 138,
    probability = 3000,
    min = 0,
    max = 5777,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(46,139)->
    #equipment_randompropCfg {
    id = 46,
    propid = 139,
    probability = 1500,
    min = 0,
    max = 5777,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(46,143)->
    #equipment_randompropCfg {
    id = 46,
    propid = 143,
    probability = 2000,
    min = 0,
    max = 2352,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(46,145)->
    #equipment_randompropCfg {
    id = 46,
    propid = 145,
    probability = 1000,
    min = 0,
    max = 3465,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(46,160)->
    #equipment_randompropCfg {
    id = 46,
    propid = 160,
    probability = 1000,
    min = 0,
    max = 1625,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(47,136)->
    #equipment_randompropCfg {
    id = 47,
    propid = 136,
    probability = 1000,
    min = 0,
    max = 5777,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(47,139)->
    #equipment_randompropCfg {
    id = 47,
    propid = 139,
    probability = 2000,
    min = 0,
    max = 5777,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(47,140)->
    #equipment_randompropCfg {
    id = 47,
    propid = 140,
    probability = 1000,
    min = 0,
    max = 4599,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(47,141)->
    #equipment_randompropCfg {
    id = 47,
    propid = 141,
    probability = 1500,
    min = 0,
    max = 3240,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(47,142)->
    #equipment_randompropCfg {
    id = 47,
    propid = 142,
    probability = 1500,
    min = 0,
    max = 2780,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(47,144)->
    #equipment_randompropCfg {
    id = 47,
    propid = 144,
    probability = 3000,
    min = 0,
    max = 2421,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(48,138)->
    #equipment_randompropCfg {
    id = 48,
    propid = 138,
    probability = 1000,
    min = 0,
    max = 5777,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(48,139)->
    #equipment_randompropCfg {
    id = 48,
    propid = 139,
    probability = 3000,
    min = 0,
    max = 5777,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(48,141)->
    #equipment_randompropCfg {
    id = 48,
    propid = 141,
    probability = 1500,
    min = 0,
    max = 3240,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(48,143)->
    #equipment_randompropCfg {
    id = 48,
    propid = 143,
    probability = 1500,
    min = 0,
    max = 2352,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(48,145)->
    #equipment_randompropCfg {
    id = 48,
    propid = 145,
    probability = 2000,
    min = 0,
    max = 3465,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(48,160)->
    #equipment_randompropCfg {
    id = 48,
    propid = 160,
    probability = 1000,
    min = 0,
    max = 1625,
    prop_probability = [{10,33,6000},{33,57,3500},{57,82,490},{82,100,10}]
    };
getRow(_,_)->[].

getKeyList()->[
    {1,135},
    {1,136},
    {1,140},
    {1,142},
    {1,144},
    {1,146},
    {2,135},
    {2,138},
    {2,139},
    {2,141},
    {2,145},
    {2,160},
    {3,136},
    {3,140},
    {3,142},
    {3,143},
    {3,144},
    {3,146},
    {4,135},
    {4,141},
    {4,143},
    {4,144},
    {4,146},
    {4,160},
    {5,136},
    {5,138},
    {5,140},
    {5,142},
    {5,145},
    {5,146},
    {6,135},
    {6,138},
    {6,139},
    {6,143},
    {6,145},
    {6,160},
    {7,136},
    {7,139},
    {7,140},
    {7,141},
    {7,142},
    {7,144},
    {8,138},
    {8,139},
    {8,141},
    {8,143},
    {8,145},
    {8,160},
    {11,135},
    {11,136},
    {11,140},
    {11,142},
    {11,144},
    {11,146},
    {12,135},
    {12,138},
    {12,139},
    {12,141},
    {12,145},
    {12,160},
    {13,136},
    {13,140},
    {13,142},
    {13,143},
    {13,144},
    {13,146},
    {14,135},
    {14,141},
    {14,143},
    {14,144},
    {14,146},
    {14,160},
    {15,136},
    {15,138},
    {15,140},
    {15,142},
    {15,145},
    {15,146},
    {16,135},
    {16,138},
    {16,139},
    {16,143},
    {16,145},
    {16,160},
    {17,136},
    {17,139},
    {17,140},
    {17,141},
    {17,142},
    {17,144},
    {18,138},
    {18,139},
    {18,141},
    {18,143},
    {18,145},
    {18,160},
    {21,135},
    {21,136},
    {21,140},
    {21,142},
    {21,144},
    {21,146},
    {22,135},
    {22,138},
    {22,139},
    {22,141},
    {22,145},
    {22,160},
    {23,136},
    {23,140},
    {23,142},
    {23,143},
    {23,144},
    {23,146},
    {24,135},
    {24,141},
    {24,143},
    {24,144},
    {24,146},
    {24,160},
    {25,136},
    {25,138},
    {25,140},
    {25,142},
    {25,145},
    {25,146},
    {26,135},
    {26,138},
    {26,139},
    {26,143},
    {26,145},
    {26,160},
    {27,136},
    {27,139},
    {27,140},
    {27,141},
    {27,142},
    {27,144},
    {28,138},
    {28,139},
    {28,141},
    {28,143},
    {28,145},
    {28,160},
    {31,135},
    {31,136},
    {31,140},
    {31,142},
    {31,144},
    {31,146},
    {32,135},
    {32,138},
    {32,139},
    {32,141},
    {32,145},
    {32,160},
    {33,136},
    {33,140},
    {33,142},
    {33,143},
    {33,144},
    {33,146},
    {34,135},
    {34,141},
    {34,143},
    {34,144},
    {34,146},
    {34,160},
    {35,136},
    {35,138},
    {35,140},
    {35,142},
    {35,145},
    {35,146},
    {36,135},
    {36,138},
    {36,139},
    {36,143},
    {36,145},
    {36,160},
    {37,136},
    {37,139},
    {37,140},
    {37,141},
    {37,142},
    {37,144},
    {38,138},
    {38,139},
    {38,141},
    {38,143},
    {38,145},
    {38,160},
    {41,135},
    {41,136},
    {41,140},
    {41,142},
    {41,144},
    {41,146},
    {42,135},
    {42,138},
    {42,139},
    {42,141},
    {42,145},
    {42,160},
    {43,136},
    {43,140},
    {43,142},
    {43,143},
    {43,144},
    {43,146},
    {44,135},
    {44,141},
    {44,143},
    {44,144},
    {44,146},
    {44,160},
    {45,136},
    {45,138},
    {45,140},
    {45,142},
    {45,145},
    {45,146},
    {46,135},
    {46,138},
    {46,139},
    {46,143},
    {46,145},
    {46,160},
    {47,136},
    {47,139},
    {47,140},
    {47,141},
    {47,142},
    {47,144},
    {48,138},
    {48,139},
    {48,141},
    {48,143},
    {48,145},
    {48,160}
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
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48
    ].

get2KeyList(1)->[
    135,
    136,
    140,
    142,
    144,
    146
    ];
get2KeyList(2)->[
    135,
    138,
    139,
    141,
    145,
    160
    ];
get2KeyList(3)->[
    136,
    140,
    142,
    143,
    144,
    146
    ];
get2KeyList(4)->[
    135,
    141,
    143,
    144,
    146,
    160
    ];
get2KeyList(5)->[
    136,
    138,
    140,
    142,
    145,
    146
    ];
get2KeyList(6)->[
    135,
    138,
    139,
    143,
    145,
    160
    ];
get2KeyList(7)->[
    136,
    139,
    140,
    141,
    142,
    144
    ];
get2KeyList(8)->[
    138,
    139,
    141,
    143,
    145,
    160
    ];
get2KeyList(11)->[
    135,
    136,
    140,
    142,
    144,
    146
    ];
get2KeyList(12)->[
    135,
    138,
    139,
    141,
    145,
    160
    ];
get2KeyList(13)->[
    136,
    140,
    142,
    143,
    144,
    146
    ];
get2KeyList(14)->[
    135,
    141,
    143,
    144,
    146,
    160
    ];
get2KeyList(15)->[
    136,
    138,
    140,
    142,
    145,
    146
    ];
get2KeyList(16)->[
    135,
    138,
    139,
    143,
    145,
    160
    ];
get2KeyList(17)->[
    136,
    139,
    140,
    141,
    142,
    144
    ];
get2KeyList(18)->[
    138,
    139,
    141,
    143,
    145,
    160
    ];
get2KeyList(21)->[
    135,
    136,
    140,
    142,
    144,
    146
    ];
get2KeyList(22)->[
    135,
    138,
    139,
    141,
    145,
    160
    ];
get2KeyList(23)->[
    136,
    140,
    142,
    143,
    144,
    146
    ];
get2KeyList(24)->[
    135,
    141,
    143,
    144,
    146,
    160
    ];
get2KeyList(25)->[
    136,
    138,
    140,
    142,
    145,
    146
    ];
get2KeyList(26)->[
    135,
    138,
    139,
    143,
    145,
    160
    ];
get2KeyList(27)->[
    136,
    139,
    140,
    141,
    142,
    144
    ];
get2KeyList(28)->[
    138,
    139,
    141,
    143,
    145,
    160
    ];
get2KeyList(31)->[
    135,
    136,
    140,
    142,
    144,
    146
    ];
get2KeyList(32)->[
    135,
    138,
    139,
    141,
    145,
    160
    ];
get2KeyList(33)->[
    136,
    140,
    142,
    143,
    144,
    146
    ];
get2KeyList(34)->[
    135,
    141,
    143,
    144,
    146,
    160
    ];
get2KeyList(35)->[
    136,
    138,
    140,
    142,
    145,
    146
    ];
get2KeyList(36)->[
    135,
    138,
    139,
    143,
    145,
    160
    ];
get2KeyList(37)->[
    136,
    139,
    140,
    141,
    142,
    144
    ];
get2KeyList(38)->[
    138,
    139,
    141,
    143,
    145,
    160
    ];
get2KeyList(41)->[
    135,
    136,
    140,
    142,
    144,
    146
    ];
get2KeyList(42)->[
    135,
    138,
    139,
    141,
    145,
    160
    ];
get2KeyList(43)->[
    136,
    140,
    142,
    143,
    144,
    146
    ];
get2KeyList(44)->[
    135,
    141,
    143,
    144,
    146,
    160
    ];
get2KeyList(45)->[
    136,
    138,
    140,
    142,
    145,
    146
    ];
get2KeyList(46)->[
    135,
    138,
    139,
    143,
    145,
    160
    ];
get2KeyList(47)->[
    136,
    139,
    140,
    141,
    142,
    144
    ];
get2KeyList(48)->[
    138,
    139,
    141,
    143,
    145,
    160
    ];
get2KeyList(_)->[].

