%%: 声明
-ifndef(cfg_identity_zodiac).
-define(cfg_identity_zodiac, 1).

-record(identity_zodiacCfg, {
        id,

        %%: 标签名，字符串
        name

 }).

-endif.