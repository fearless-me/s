%%: 声明
-ifndef(cfg_guild_ride).
-define(cfg_guild_ride, 1).

-record(guild_rideCfg, {
        %%: 作者:
        %%: 1旋转木马
        %%: 2摩天轮
        %%: 3海盗船
        %%: 4飞椅
        %%: 5青龙列车
        %%: 6冰淇淋车
        id,

        %%: 作者:
        %%: 设施等级
        level,

        %%: 作者:
        %%: 关联npc表
        npcId,

        %%: 作者:
        %%: 1:开启
        %%: 0:未开启
        open,

        %%: 作者:
        %%: 乘坐消耗代币类型
        costType,

        %%: 作者:
        %%: 乘坐消耗代币数量
        costValue,

        %%: 作者:
        %%: 乘坐人数
        playerMax,

        %%: 作者:
        %%: 维护设施所需家族资金
        maintain,

        %%: 作者:
        %%: 升级消耗资金
        upgrade,

        %%: 作者:
        %%: 升级设施所需权限
        %%: 9族长；3大长老；2长老；1成员
        upgradePower,

        %%: 作者:
        %%: 设施每日开放起始时间
        %%: 配置为空列表或没有配置时表示全天开放
        timeBegin,

        %%: 作者:
        %%: 设施每日开放结束时间
        %%: 配置为空列表或没有配置时表示全天开放
        timeEnd,

        %%: 作者:
        %%: 最小乘坐时间（获得BUFF）
        timeMin,

        %%: 作者:
        %%: 最大乘坐时间
        timeMax,

        %%: 作者:
        %%: 游乐设施获得BUFF
        buffID,

        des,

        rewardDes,

        %%: 作者:
        %%: 0不隐藏
        %%: 1隐藏
        weapon_hiden,

        %%: 作者:
        %%: 奔跑动画的播放速度
        playspeed,

        %%: 乘坐动作
        animation_1,

        %%: 作者:
        %%: 游乐设施名称
        name,

        %%: Coby:背景资源名
        background,

        %%: 作者:
        %%: 乘坐摄像机参数
        %%: [{位置}｛旋转｝]
        camera

 }).

-endif.