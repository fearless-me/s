%%: 声明
-ifndef(cfg_fashionCollection).
-define(cfg_fashionCollection, 1).

-record(fashionCollectionCfg, {
        %%: 时装件数
        %%: 同时可作为本表的key
        %%: 永久时装件数
        %%: 主手算一件
        %%: 副手算一件
        %%: 衣服算一件
        %%: 数量必须升序
        id,

        %%: 李菡琦:
        %%: 策划看，不用管
        fashionname,

        %%: 李菡琦:
        %%: 显示在客户端的套装名称
        name,

        %%: Windows 用户:
        %%: 描述
        des,

        %%: 李菡琦:
        %%: 性别
        %%: 女：0
        %%: 男：1
        gender,

        %%: Windows 用户
        %%: 区分性别和职业，套装里包含的所有时装，
        %%: 例：
        %%: [头，身体]
        fashionIDGroup,

        %%: 骑士属性
        %%: [{属性id，数值，加法或乘法值}]
        %%: 属性只针对玩家
        paladin,

        %%: 法师系
        %%: [{属性id，数值，加法或乘法值}]
        %%: 属性只针对玩家
        wizard,

        %%: 刺客系
        %%: [{属性id，数值，加法或乘法值}]
        %%: 属性只针对玩家
        assassin

 }).

-endif.