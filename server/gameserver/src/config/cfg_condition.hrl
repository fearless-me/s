%%: 声明
-ifndef(cfg_condition).
-define(cfg_condition, 1).

-record(conditionCfg, {
        %%: 刘渊：
        %%: 条件id，不允许重复，id编号可修改
        id,

        %%: 刘渊：（名称由程序提供）
        %%: 条件所在模块
        %%: playerCondation    人物条件模块
        %%: MapCondation       地图条件模块
        module,

        %%: 刘渊：（名称由程序提供）
        %%: 条件触发的方法
        %%: playerLevelInterregional  角色等级在闭区间内
        %%: 条件参数：                       【levelmin，levelmax】
        %%: playerLeveLe                  角色小于等于目标等级数值
        %%: 条件参数：                       【目标等级数值】
        %%: playerLeveL                    角色小于目标等级数值
        %%: 条件参数：                       【目标等级数值】
        %%: playerLevelGe                 角色大于等于目标等级数值
        %%: 条件参数：                       【目标等级数值】
        %%: playerLevelG                   角色大于目标等级数值
        %%: 条件参数：                       【目标等级数值】
        %%: playerDailyCountLe          每日计数小于等于目标数值
        %%: 条件参数：                       【DailyType,DailyID,Value】  
        %%: 【程序定义的类型，子类型，一般为0，目标数值】
        %%: playerDailyCountL            每日计数小于目标数值
        %%: 条件参数：                       【DailyType,DailyID,Value】  
        %%: 【程序定义的类型，子类型，一般为0，目标数值】
        %%: playerDailyCountGe         每日计数大于等于目标数值
        %%: 条件参数：                      【DailyType,DailyID,Value】  
        %%: 【程序定义的类型，子类型，一般为0，目标数值】
        %%: playerDailyCountG           每日计数大于目标数值
        %%: 条件参数：                      【DailyType,DailyID,Value】  
        %%: 【程序定义的类型，子类型，一般为0，目标数值】
        %%: currentMapIDInCfg          角色在该地图id中
        %%: 条件参数：                      【地图id】
        method,

        %%: 刘渊：
        %%: 条件触发方法下的条件参数，格式参照method批注
        argu,

        %%: 刘渊：
        %%: 不论条件判断成功失败，都传给trigger的key类型
        %%: [] //为空，不向trigger发送key,toTriggleValue也为空
        %%: [1]//发送errorcode，toTriggleValue为errorcode id
        toTriggleValueKey,

        %%: 刘渊：
        %%: 传给trigger的key类型下的数值
        toTriggleValue

 }).

-endif.