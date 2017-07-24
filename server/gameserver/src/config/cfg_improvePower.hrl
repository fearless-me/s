%%: 声明
-ifndef(cfg_improvePower).
-define(cfg_improvePower, 1).

-record(improvePowerCfg, {
        iD,

        name,

        %%: 作者:
        %%: 引导类型，用于程序标示引导的项目，不能随意更改
        type,

        %%: 作者:
        %%: 引导的类型
        %%: 0 直接配置 引导等级 
        %%: 1 规则性的等差引导
        %%: 2 规则性的等比引导
        parameterType,

        %%: 作者:
        %%: 配置每个类型的引导初始值 间距 和最大值
        allParameter,

        %%: 作者:
        %%: 填写ICON
        icon,

        %%: 作者:
        %%: 文字描述
        description,

        %%: 作者:
        %%: 配置点击按钮时，跳转的界面
        %%: [20,0]代表有1个跳转途径，值1代表跳转到的界面ID，值2代表书签ID
        %%: 值1通过mainMenu获得
        %%: 值2有三种情况：
        %%:    当值1为商城（编号为24），则配置为0
        %%:    当值1为副本（编号为20），则可在mapsetting中查找对应地图ID
        %%:    当值1为活动（编号为22），则可在DailyInterface查找对应活动ID
        relation_UI

 }).

-endif.