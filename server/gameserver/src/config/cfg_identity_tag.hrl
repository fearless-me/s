%%: 声明
-ifndef(cfg_identity_tag).
-define(cfg_identity_tag, 1).

-record(identity_tagCfg, {
        id,

        %%: 标签名，字符串
        tag,

        %%: 对应资源名
        resouce

 }).

-endif.