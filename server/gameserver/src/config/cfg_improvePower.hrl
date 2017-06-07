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
        relation_UI

 }).

-endif.