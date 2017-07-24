%%: 声明
-ifndef(cfg_fashionCollectionLevel).
-define(cfg_fashionCollectionLevel, 1).

-record(fashionCollectionLevelCfg, {
        %%: 时装ID，确定后不能改动，item表中有id返回
        level,

        %%: 时装部件
        %%: 6 主手
        %%: 7 头盔
        %%: 8 胸甲
        %%: 25 背部
        %%: 26 精灵
        %%: 27 表情
        exp,

        %%: 限制职业,格式[职业1,职业2,...]
        %%: 0 所有职业
        %%: 100 战士系  101 战士  111 守卫  112 斗士
        %%: 121 步兵  122 剑士  123 佣兵
        %%: 200 法师系  201 法师  211修士  212 巫师
        %%: 221 牧师  222 术士  223 僧侣
        %%: 300 刺客系  301刺客  311 旅者  312 流氓
        %%: 321 弓箭手  322 盗贼  323 侦察兵   
        attribute

 }).

-endif.