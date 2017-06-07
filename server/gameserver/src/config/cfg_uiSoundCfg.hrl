%%: 声明
-ifndef(cfg_uiSoundCfg).
-define(cfg_uiSoundCfg, 1).

-record(uiSoundCfgCfg, {
        id,

        sound,

        uiType,

        desc

 }).

-endif.