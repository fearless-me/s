%%: 声明
-ifndef(cfg_identity_tag).
-define(cfg_identity_tag, 1).

-record(identity_tagCfg, {
        %%: id列
        id,

        %%: 身份证标签筛选中的标签名称
        tag,

        %%: 无用字段，资源名称
        resouce

 }).

-endif.