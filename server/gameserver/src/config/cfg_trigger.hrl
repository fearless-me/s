%%: 声明
-ifndef(cfg_trigger).
-define(cfg_trigger, 1).

-record(triggerCfg, {
        %%: 刘渊：
        %%: 触发器编号，不允许重复，id编号可修改
        id,

        %%: 刘渊：（名称由程序提供）
        %%: 触发器所在模块
        %%: playerTrigger         人物触发器模块
        %%: mapTrigger            地图触发器模块
        %%: errorCodeTrigger   错误消息触发器模块 
        module,

        %%: 刘渊：（名称由程序提供）
        %%: 触发器的内容
        %%: addPlayerDailyCount                             增加每日计数的值
        %%: 条件参数：                                           【DailyType,DailyID,value】
        %%: DailyType程序定义的类型,DailyID为子类型通常是0，value每次增加的值
        %%: transferCurrentRoleToMap                    将角色传送到指定地图坐标
        %%: 条件参数：                                           【MapId,X,Y】
        %%: transferCurrentRoleToLastMap              将角色传送到进入地图前的坐标
        %%: addPlayerDailyCountByProgram            每次检测计数增加计算模块 
        %%: send_error_code_from_condation_argu  发送errorcode返回
        method,

        %%: 刘渊:
        %%: 条件参数
        argu

 }).

-endif.