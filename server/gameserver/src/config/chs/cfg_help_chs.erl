%% coding: latin-1
%%: 实现
-module(cfg_help_chs).
-compile(export_all).
-include("cfg_help.hrl").
-include("logger.hrl").

getRow(attributeandbag)->
    #helpCfg {
    id = attributeandbag,
    chinese = "背包"
    };
getRow(baoshi)->
    #helpCfg {
    id = baoshi,
    chinese = "纹章"
    };
getRow(bestteam)->
    #helpCfg {
    id = bestteam,
    chinese = "最强家族"
    };
getRow(buji)->
    #helpCfg {
    id = buji,
    chinese = "补给"
    };
getRow(cangku)->
    #helpCfg {
    id = cangku,
    chinese = "仓库"
    };
getRow(chengjiu)->
    #helpCfg {
    id = chengjiu,
    chinese = "成就"
    };
getRow(chongzhijiangli)->
    #helpCfg {
    id = chongzhijiangli,
    chinese = "充值活动"
    };
getRow(dailytask)->
    #helpCfg {
    id = dailytask,
    chinese = "女神日常"
    };
getRow(dazao)->
    #helpCfg {
    id = dazao,
    chinese = "合成"
    };
getRow(exchange)->
    #helpCfg {
    id = exchange,
    chinese = "兑换"
    };
getRow(fenjie)->
    #helpCfg {
    id = fenjie,
    chinese = "装备分解"
    };
getRow(friends)->
    #helpCfg {
    id = friends,
    chinese = "好友"
    };
getRow(fuben)->
    #helpCfg {
    id = fuben,
    chinese = "副本"
    };
getRow(gonggao)->
    #helpCfg {
    id = gonggao,
    chinese = "公告"
    };
getRow(hongbaofasong)->
    #helpCfg {
    id = hongbaofasong,
    chinese = "红包"
    };
getRow(huodong)->
    #helpCfg {
    id = huodong,
    chinese = "活动"
    };
getRow(intensify)->
    #helpCfg {
    id = intensify,
    chinese = "强化"
    };
getRow(jiehunxitong)->
    #helpCfg {
    id = jiehunxitong,
    chinese = "婚姻"
    };
getRow(jihuoma)->
    #helpCfg {
    id = jihuoma,
    chinese = "激活码"
    };
getRow(juexing)->
    #helpCfg {
    id = juexing,
    chinese = "觉醒"
    };
getRow(juntuanfuli)->
    #helpCfg {
    id = juntuanfuli,
    chinese = "家族福利"
    };
getRow(juntuanguanli)->
    #helpCfg {
    id = juntuanguanli,
    chinese = "家族管理"
    };
getRow(lihun)->
    #helpCfg {
    id = lihun,
    chinese = "离婚"
    };
getRow(mail)->
    #helpCfg {
    id = mail,
    chinese = "邮件"
    };
getRow(mount)->
    #helpCfg {
    id = mount,
    chinese = "骑宠"
    };
getRow(niudan)->
    #helpCfg {
    id = niudan,
    chinese = "扭蛋"
    };
getRow(npcshangdian)->
    #helpCfg {
    id = npcshangdian,
    chinese = "npc商店"
    };
getRow(nvshen)->
    #helpCfg {
    id = nvshen,
    chinese = "女神"
    };
getRow(petcity)->
    #helpCfg {
    id = petcity,
    chinese = "骑宠领地"
    };
getRow(qiandao)->
    #helpCfg {
    id = qiandao,
    chinese = "福利"
    };
getRow(ranking)->
    #helpCfg {
    id = ranking,
    chinese = "排行榜"
    };
getRow(ranks)->
    #helpCfg {
    id = ranks,
    chinese = "队伍"
    };
getRow(renwu)->
    #helpCfg {
    id = renwu,
    chinese = "任务"
    };
getRow(role)->
    #helpCfg {
    id = role,
    chinese = "角色"
    };
getRow(rune)->
    #helpCfg {
    id = rune,
    chinese = "符文"
    };
getRow(shangcheng)->
    #helpCfg {
    id = shangcheng,
    chinese = "商城"
    };
getRow(shenfenzheng)->
    #helpCfg {
    id = shenfenzheng,
    chinese = "身份证"
    };
getRow(shenmishangdian)->
    #helpCfg {
    id = shenmishangdian,
    chinese = "神秘商店"
    };
getRow(shenqi)->
    #helpCfg {
    id = shenqi,
    chinese = "器灵"
    };
getRow(shezhi)->
    #helpCfg {
    id = shezhi,
    chinese = "设置"
    };
getRow(shijieditu)->
    #helpCfg {
    id = shijieditu,
    chinese = "世界地图"
    };
getRow(shizhuang)->
    #helpCfg {
    id = shizhuang,
    chinese = "时装"
    };
getRow(skill)->
    #helpCfg {
    id = skill,
    chinese = "技能"
    };
getRow(undefine)->
    #helpCfg {
    id = undefine,
    chinese = "未定义",
    english = "undefine"
    };
getRow(wings)->
    #helpCfg {
    id = wings,
    chinese = "星空之翼"
    };
getRow(woyaobianqiang)->
    #helpCfg {
    id = woyaobianqiang,
    chinese = "我要变强"
    };
getRow(yongzheshilian)->
    #helpCfg {
    id = yongzheshilian,
    chinese = "女神禁闭室"
    };
getRow(yuehuidixiacheng)->
    #helpCfg {
    id = yuehuidixiacheng,
    chinese = "约会地下城"
    };
getRow(_)->[].

getKeyList()->[
    {attributeandbag},
    {baoshi},
    {bestteam},
    {buji},
    {cangku},
    {chengjiu},
    {chongzhijiangli},
    {dailytask},
    {dazao},
    {exchange},
    {fenjie},
    {friends},
    {fuben},
    {gonggao},
    {hongbaofasong},
    {huodong},
    {intensify},
    {jiehunxitong},
    {jihuoma},
    {juexing},
    {juntuanfuli},
    {juntuanguanli},
    {lihun},
    {mail},
    {mount},
    {niudan},
    {npcshangdian},
    {nvshen},
    {petcity},
    {qiandao},
    {ranking},
    {ranks},
    {renwu},
    {role},
    {rune},
    {shangcheng},
    {shenfenzheng},
    {shenmishangdian},
    {shenqi},
    {shezhi},
    {shijieditu},
    {shizhuang},
    {skill},
    {undefine},
    {wings},
    {woyaobianqiang},
    {yongzheshilian},
    {yuehuidixiacheng}
    ].

get1KeyList()->[
    attributeandbag,
    baoshi,
    bestteam,
    buji,
    cangku,
    chengjiu,
    chongzhijiangli,
    dailytask,
    dazao,
    exchange,
    fenjie,
    friends,
    fuben,
    gonggao,
    hongbaofasong,
    huodong,
    intensify,
    jiehunxitong,
    jihuoma,
    juexing,
    juntuanfuli,
    juntuanguanli,
    lihun,
    mail,
    mount,
    niudan,
    npcshangdian,
    nvshen,
    petcity,
    qiandao,
    ranking,
    ranks,
    renwu,
    role,
    rune,
    shangcheng,
    shenfenzheng,
    shenmishangdian,
    shenqi,
    shezhi,
    shijieditu,
    shizhuang,
    skill,
    undefine,
    wings,
    woyaobianqiang,
    yongzheshilian,
    yuehuidixiacheng
    ].

