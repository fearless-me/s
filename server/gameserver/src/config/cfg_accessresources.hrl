%%: 声明
-ifndef(cfg_accessresources).
-define(cfg_accessresources, 1).

-record(accessresourcesCfg, {
        iD,

        %%: 作者:
        %%: 用于客户端显示，对应系统的名称
        name,

        %%: 作者:
        %%: 程序用于类型区分，1代表货币 2代表道具
        type,

        %%: 作者:
        %%: 代表该行所对应货币ID或道具ID
        %%: 直接填写货币ID或道具ID
        type_id,

        %%: 作者:
        %%: 描述，描述该资源功能
        %%: 建议10-20个字 界面更为美观
        description_1,

        %%: 作者:
        %%: 描述该资源产出渠道
        description_2,

        %%: 作者:
        %%: 我要获取按钮所关联的系统界面ID
        relation_UI,

        %%: 作者:
        %%: 1 代表要显示该资源的数量
        %%: 2 代表不显示
        number_display,

        %%: Administrator:
        %%: 1新增规则
        %%: 0 原规则
        %%: 申请版号的特殊处理，当需要屏蔽某一系统时屏蔽相关对应的资源跳转
        new_rule

 }).

-endif.