%% coding: latin-1
%%: 实现
-module(cfg_monthly_signinaward_chs).
-compile(export_all).
-include("cfg_monthly_signinaward.hrl").
-include("logger.hrl").

getRow(1,3)->
    #monthly_signinawardCfg {
    type = 1,
    total = 3,
    item1 = 222,
    num1 = 60,
    tpye1 = 0,
    item2 = 903,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(1,5)->
    #monthly_signinawardCfg {
    type = 1,
    total = 5,
    item1 = 2160,
    num1 = 100,
    tpye1 = 0,
    item2 = 2600,
    num2 = 100,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(1,7)->
    #monthly_signinawardCfg {
    type = 1,
    total = 7,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 1,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(1,10)->
    #monthly_signinawardCfg {
    type = 1,
    total = 10,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(1,15)->
    #monthly_signinawardCfg {
    type = 1,
    total = 15,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 3,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(1,20)->
    #monthly_signinawardCfg {
    type = 1,
    total = 20,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 4,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(2,3)->
    #monthly_signinawardCfg {
    type = 2,
    total = 3,
    item1 = 222,
    num1 = 60,
    tpye1 = 0,
    item2 = 903,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(2,5)->
    #monthly_signinawardCfg {
    type = 2,
    total = 5,
    item1 = 2160,
    num1 = 100,
    tpye1 = 0,
    item2 = 2600,
    num2 = 100,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(2,7)->
    #monthly_signinawardCfg {
    type = 2,
    total = 7,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 1,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(2,10)->
    #monthly_signinawardCfg {
    type = 2,
    total = 10,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(2,15)->
    #monthly_signinawardCfg {
    type = 2,
    total = 15,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 3,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(2,20)->
    #monthly_signinawardCfg {
    type = 2,
    total = 20,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 4,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(3,3)->
    #monthly_signinawardCfg {
    type = 3,
    total = 3,
    item1 = 222,
    num1 = 60,
    tpye1 = 0,
    item2 = 903,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(3,5)->
    #monthly_signinawardCfg {
    type = 3,
    total = 5,
    item1 = 2160,
    num1 = 100,
    tpye1 = 0,
    item2 = 2600,
    num2 = 100,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(3,7)->
    #monthly_signinawardCfg {
    type = 3,
    total = 7,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 1,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(3,10)->
    #monthly_signinawardCfg {
    type = 3,
    total = 10,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(3,15)->
    #monthly_signinawardCfg {
    type = 3,
    total = 15,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 3,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(3,20)->
    #monthly_signinawardCfg {
    type = 3,
    total = 20,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 4,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(4,3)->
    #monthly_signinawardCfg {
    type = 4,
    total = 3,
    item1 = 222,
    num1 = 60,
    tpye1 = 0,
    item2 = 903,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(4,5)->
    #monthly_signinawardCfg {
    type = 4,
    total = 5,
    item1 = 2160,
    num1 = 100,
    tpye1 = 0,
    item2 = 2600,
    num2 = 100,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(4,7)->
    #monthly_signinawardCfg {
    type = 4,
    total = 7,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 1,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(4,10)->
    #monthly_signinawardCfg {
    type = 4,
    total = 10,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(4,15)->
    #monthly_signinawardCfg {
    type = 4,
    total = 15,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 3,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(4,20)->
    #monthly_signinawardCfg {
    type = 4,
    total = 20,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 4,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(5,3)->
    #monthly_signinawardCfg {
    type = 5,
    total = 3,
    item1 = 222,
    num1 = 60,
    tpye1 = 0,
    item2 = 903,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(5,5)->
    #monthly_signinawardCfg {
    type = 5,
    total = 5,
    item1 = 2160,
    num1 = 100,
    tpye1 = 0,
    item2 = 2600,
    num2 = 100,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(5,7)->
    #monthly_signinawardCfg {
    type = 5,
    total = 7,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 1,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(5,10)->
    #monthly_signinawardCfg {
    type = 5,
    total = 10,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(5,15)->
    #monthly_signinawardCfg {
    type = 5,
    total = 15,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 3,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(5,20)->
    #monthly_signinawardCfg {
    type = 5,
    total = 20,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 4,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(6,3)->
    #monthly_signinawardCfg {
    type = 6,
    total = 3,
    item1 = 222,
    num1 = 60,
    tpye1 = 0,
    item2 = 903,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(6,5)->
    #monthly_signinawardCfg {
    type = 6,
    total = 5,
    item1 = 2160,
    num1 = 100,
    tpye1 = 0,
    item2 = 2600,
    num2 = 100,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(6,7)->
    #monthly_signinawardCfg {
    type = 6,
    total = 7,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 1,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(6,10)->
    #monthly_signinawardCfg {
    type = 6,
    total = 10,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(6,15)->
    #monthly_signinawardCfg {
    type = 6,
    total = 15,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 3,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(6,20)->
    #monthly_signinawardCfg {
    type = 6,
    total = 20,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 4,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(7,3)->
    #monthly_signinawardCfg {
    type = 7,
    total = 3,
    item1 = 222,
    num1 = 60,
    tpye1 = 0,
    item2 = 903,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(7,5)->
    #monthly_signinawardCfg {
    type = 7,
    total = 5,
    item1 = 2160,
    num1 = 100,
    tpye1 = 0,
    item2 = 2600,
    num2 = 100,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(7,7)->
    #monthly_signinawardCfg {
    type = 7,
    total = 7,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 1,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(7,10)->
    #monthly_signinawardCfg {
    type = 7,
    total = 10,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(7,15)->
    #monthly_signinawardCfg {
    type = 7,
    total = 15,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 3,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(7,20)->
    #monthly_signinawardCfg {
    type = 7,
    total = 20,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 4,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(8,3)->
    #monthly_signinawardCfg {
    type = 8,
    total = 3,
    item1 = 222,
    num1 = 60,
    tpye1 = 0,
    item2 = 903,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(8,5)->
    #monthly_signinawardCfg {
    type = 8,
    total = 5,
    item1 = 2160,
    num1 = 100,
    tpye1 = 0,
    item2 = 2600,
    num2 = 100,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(8,7)->
    #monthly_signinawardCfg {
    type = 8,
    total = 7,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 1,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(8,10)->
    #monthly_signinawardCfg {
    type = 8,
    total = 10,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(8,15)->
    #monthly_signinawardCfg {
    type = 8,
    total = 15,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 3,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(8,20)->
    #monthly_signinawardCfg {
    type = 8,
    total = 20,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 4,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(9,3)->
    #monthly_signinawardCfg {
    type = 9,
    total = 3,
    item1 = 222,
    num1 = 60,
    tpye1 = 0,
    item2 = 903,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(9,5)->
    #monthly_signinawardCfg {
    type = 9,
    total = 5,
    item1 = 2160,
    num1 = 100,
    tpye1 = 0,
    item2 = 2600,
    num2 = 100,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(9,7)->
    #monthly_signinawardCfg {
    type = 9,
    total = 7,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 1,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(9,10)->
    #monthly_signinawardCfg {
    type = 9,
    total = 10,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(9,15)->
    #monthly_signinawardCfg {
    type = 9,
    total = 15,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 3,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(9,20)->
    #monthly_signinawardCfg {
    type = 9,
    total = 20,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 4,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(10,3)->
    #monthly_signinawardCfg {
    type = 10,
    total = 3,
    item1 = 222,
    num1 = 60,
    tpye1 = 0,
    item2 = 903,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(10,5)->
    #monthly_signinawardCfg {
    type = 10,
    total = 5,
    item1 = 2160,
    num1 = 100,
    tpye1 = 0,
    item2 = 2600,
    num2 = 100,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(10,7)->
    #monthly_signinawardCfg {
    type = 10,
    total = 7,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 1,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(10,10)->
    #monthly_signinawardCfg {
    type = 10,
    total = 10,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(10,15)->
    #monthly_signinawardCfg {
    type = 10,
    total = 15,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 3,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(10,20)->
    #monthly_signinawardCfg {
    type = 10,
    total = 20,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 4,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(11,3)->
    #monthly_signinawardCfg {
    type = 11,
    total = 3,
    item1 = 222,
    num1 = 60,
    tpye1 = 0,
    item2 = 903,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(11,5)->
    #monthly_signinawardCfg {
    type = 11,
    total = 5,
    item1 = 2160,
    num1 = 100,
    tpye1 = 0,
    item2 = 2600,
    num2 = 100,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(11,7)->
    #monthly_signinawardCfg {
    type = 11,
    total = 7,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 1,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(11,10)->
    #monthly_signinawardCfg {
    type = 11,
    total = 10,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(11,15)->
    #monthly_signinawardCfg {
    type = 11,
    total = 15,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 3,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(11,20)->
    #monthly_signinawardCfg {
    type = 11,
    total = 20,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 4,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(12,3)->
    #monthly_signinawardCfg {
    type = 12,
    total = 3,
    item1 = 222,
    num1 = 60,
    tpye1 = 0,
    item2 = 903,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(12,5)->
    #monthly_signinawardCfg {
    type = 12,
    total = 5,
    item1 = 2160,
    num1 = 100,
    tpye1 = 0,
    item2 = 2600,
    num2 = 100,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(12,7)->
    #monthly_signinawardCfg {
    type = 12,
    total = 7,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 1,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(12,10)->
    #monthly_signinawardCfg {
    type = 12,
    total = 10,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 2,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(12,15)->
    #monthly_signinawardCfg {
    type = 12,
    total = 15,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 3,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(12,20)->
    #monthly_signinawardCfg {
    type = 12,
    total = 20,
    item1 = 225,
    num1 = 80,
    tpye1 = 0,
    item2 = 1802,
    num2 = 4,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(_,_)->[].

getKeyList()->[
    {1,3},
    {1,5},
    {1,7},
    {1,10},
    {1,15},
    {1,20},
    {2,3},
    {2,5},
    {2,7},
    {2,10},
    {2,15},
    {2,20},
    {3,3},
    {3,5},
    {3,7},
    {3,10},
    {3,15},
    {3,20},
    {4,3},
    {4,5},
    {4,7},
    {4,10},
    {4,15},
    {4,20},
    {5,3},
    {5,5},
    {5,7},
    {5,10},
    {5,15},
    {5,20},
    {6,3},
    {6,5},
    {6,7},
    {6,10},
    {6,15},
    {6,20},
    {7,3},
    {7,5},
    {7,7},
    {7,10},
    {7,15},
    {7,20},
    {8,3},
    {8,5},
    {8,7},
    {8,10},
    {8,15},
    {8,20},
    {9,3},
    {9,5},
    {9,7},
    {9,10},
    {9,15},
    {9,20},
    {10,3},
    {10,5},
    {10,7},
    {10,10},
    {10,15},
    {10,20},
    {11,3},
    {11,5},
    {11,7},
    {11,10},
    {11,15},
    {11,20},
    {12,3},
    {12,5},
    {12,7},
    {12,10},
    {12,15},
    {12,20}
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
    12
    ].

get2KeyList(1)->[
    3,
    5,
    7,
    10,
    15,
    20
    ];
get2KeyList(2)->[
    3,
    5,
    7,
    10,
    15,
    20
    ];
get2KeyList(3)->[
    3,
    5,
    7,
    10,
    15,
    20
    ];
get2KeyList(4)->[
    3,
    5,
    7,
    10,
    15,
    20
    ];
get2KeyList(5)->[
    3,
    5,
    7,
    10,
    15,
    20
    ];
get2KeyList(6)->[
    3,
    5,
    7,
    10,
    15,
    20
    ];
get2KeyList(7)->[
    3,
    5,
    7,
    10,
    15,
    20
    ];
get2KeyList(8)->[
    3,
    5,
    7,
    10,
    15,
    20
    ];
get2KeyList(9)->[
    3,
    5,
    7,
    10,
    15,
    20
    ];
get2KeyList(10)->[
    3,
    5,
    7,
    10,
    15,
    20
    ];
get2KeyList(11)->[
    3,
    5,
    7,
    10,
    15,
    20
    ];
get2KeyList(12)->[
    3,
    5,
    7,
    10,
    15,
    20
    ];
get2KeyList(_)->[].

