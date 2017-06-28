%%: 声明
-ifndef(cfg_fashionCollection).
-define(cfg_fashionCollection, 1).

-record(fashionCollectionCfg, {
        %%: 套装id
        id,

        %%: 策划标记用
        fashionname,

        %%: 策划标记用
        name,

        %%: 策划标记用
        des,

        %%: 性别
        %%: 女：0
        %%: 男：1
        gender,

        %%: 套装中的所有时装id（fashion表id字段）
        fashionIDGroup,

        %%: 战士属性加成
        %%: [{属性id，数值，加法或乘法值}]
        %%: 浮点数加成数据转化显示有问题，配置时保证精确到小数点后4位（即XX.XX%）
        paladin,

        %%: 法师属性加成
        %%: [{属性id，数值，加法或乘法值}]
        %%: 浮点数加成数据转化显示有问题，配置时保证精确到小数点后4位（即XX.XX%）
        wizard,

        %%: 刺客属性加成
        %%: [{属性id，数值，加法或乘法值}]
        %%: 浮点数加成数据转化显示有问题，配置时保证精确到小数点后4位（即XX.XX%）
        assassin

 }).

-endif.