%%: 声明
-ifndef(cfg_titlesystem).
-define(cfg_titlesystem, 1).

-record(titlesystemCfg, {
        id,

        %%: 位置排序，按照数字从小到大排序
        %%: 2个字 是50开始
        %%: 3个字 是500开始
        rank,

        %%: 1 词组称号 
        %%: 2 特效
        %%: 3 特殊限时称号
        type1,

        %%: 0 不用
        %%: 1 颜色类
        %%: 2 特效类
        %%: 3 边框泪
        type2,

        %%: 废弃没用了这列配置
        %%: 大小  1为图片默认大小
        %%: type2 为3在读
        size,

        %%: 是否显示问号隐藏
        %%: 0 正常显示
        %%: 1 显示为问号隐藏
        hide,

        %%: 0 普通
        %%: 1 就是不在随机词组库里面随机
        special,

        %%: 显示名字
        title,

        %%: 词汇描述
        describe,

        %%: ＞0  特殊处理时限时长 单位秒
        %%: 0 为获得即永久
        time,

        %%: 颜色值
        %%: 特效路径  VFX
        %%: 边框路线
        param,

        %%: 图片位置1前 2剧中 3后
        %%: 0 无 但是如果type3 后面的0就是九宫格拉伸
        position

 }).

-endif.