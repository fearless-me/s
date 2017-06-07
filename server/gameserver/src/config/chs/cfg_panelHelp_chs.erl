%% coding: latin-1
%%: 实现
-module(cfg_panelHelp_chs).
-compile(export_all).
-include("cfg_panelHelp.hrl").
-include("logger.hrl").

getRow(achievementpanel)->
    #panelHelpCfg {
    id = achievementpanel,
    help = "chengjiu",
    tesk = "成就"
    };
getRow(activationcodeinputpanel)->
    #panelHelpCfg {
    id = activationcodeinputpanel,
    help = "jihuoma",
    tesk = "输入激活码"
    };
getRow(bagpanel)->
    #panelHelpCfg {
    id = bagpanel,
    help = "beibao",
    tesk = "背包"
    };
getRow(bravetrialspanel)->
    #panelHelpCfg {
    id = bravetrialspanel,
    help = "yongzheshilian",
    tesk = "女神禁闭室"
    };
getRow(characterattribute)->
    #panelHelpCfg {
    id = characterattribute,
    help = "role",
    tesk = "角色"
    };
getRow(checkinpanel)->
    #panelHelpCfg {
    id = checkinpanel,
    help = "huodong",
    tesk = "日常"
    };
getRow(copypanel)->
    #panelHelpCfg {
    id = copypanel,
    help = "fuben",
    tesk = "副本"
    };
getRow(diamondpanel)->
    #panelHelpCfg {
    id = diamondpanel,
    help = "baoshi",
    tesk = "纹章"
    };
getRow(equipresolve)->
    #panelHelpCfg {
    id = equipresolve,
    help = "fenjie",
    tesk = "装备分解"
    };
getRow(gamesettingpanel)->
    #panelHelpCfg {
    id = gamesettingpanel,
    help = "shezhi",
    tesk = "设置"
    };
getRow(improvforcepanel)->
    #panelHelpCfg {
    id = improvforcepanel,
    help = "woyaobianqiang",
    tesk = "战力提升"
    };
getRow(newfriendspanel)->
    #panelHelpCfg {
    id = newfriendspanel,
    help = "friends",
    tesk = "社交"
    };
getRow(newmarriagepanel)->
    #panelHelpCfg {
    id = newmarriagepanel,
    help = "jiehun",
    tesk = "婚姻"
    };
getRow(noticepanel)->
    #panelHelpCfg {
    id = noticepanel,
    help = "gonggao",
    tesk = "公告"
    };
getRow(npcshoppanel)->
    #panelHelpCfg {
    id = npcshoppanel,
    help = "npcshangdian",
    tesk = "npc商店"
    };
getRow(otherguildpanel)->
    #panelHelpCfg {
    id = otherguildpanel,
    help = "juntuan",
    tesk = "家族"
    };
getRow(petterritorypanel)->
    #panelHelpCfg {
    id = petterritorypanel,
    help = "petcity",
    tesk = "骑宠领地"
    };
getRow(rankpanel)->
    #panelHelpCfg {
    id = rankpanel,
    help = "ranking",
    tesk = "排行榜"
    };
getRow(rechargeactivitypanel)->
    #panelHelpCfg {
    id = rechargeactivitypanel,
    help = "chongzhijiangli",
    tesk = "充值活动"
    };
getRow(redenvelopepanel)->
    #panelHelpCfg {
    id = redenvelopepanel,
    help = "hongbao",
    tesk = "红包"
    };
getRow(resexchangepanel)->
    #panelHelpCfg {
    id = resexchangepanel,
    help = "exchange",
    tesk = "兑换"
    };
getRow(resourcemakepanel)->
    #panelHelpCfg {
    id = resourcemakepanel,
    help = "dazao",
    tesk = "合成"
    };
getRow(ridepetpanel)->
    #panelHelpCfg {
    id = ridepetpanel,
    help = "mount",
    tesk = "骑宠"
    };
getRow(runepanel)->
    #panelHelpCfg {
    id = runepanel,
    help = "rune",
    tesk = "符文"
    };
getRow(secretshop)->
    #panelHelpCfg {
    id = secretshop,
    help = "shenmishangdian",
    tesk = "神秘商店"
    };
getRow(shoppanel)->
    #panelHelpCfg {
    id = shoppanel,
    help = "shangcheng",
    tesk = "商城"
    };
getRow(taskpanel)->
    #panelHelpCfg {
    id = taskpanel,
    help = "renwu",
    tesk = "任务"
    };
getRow(teampanel)->
    #panelHelpCfg {
    id = teampanel,
    help = "ranks",
    tesk = "队伍"
    };
getRow(transformpanel)->
    #panelHelpCfg {
    id = transformpanel,
    help = "nvshen",
    tesk = "女神"
    };
getRow(treasurehousepanel)->
    #panelHelpCfg {
    id = treasurehousepanel,
    help = "niudan",
    tesk = "扭蛋"
    };
getRow(weaponimprovepanel)->
    #panelHelpCfg {
    id = weaponimprovepanel,
    help = "shenqi",
    tesk = "器灵"
    };
getRow(welfarepanel)->
    #panelHelpCfg {
    id = welfarepanel,
    help = "qiandao",
    tesk = "福利"
    };
getRow(wingpanel)->
    #panelHelpCfg {
    id = wingpanel,
    help = "wings",
    tesk = "星空之翼"
    };
getRow(worldmappanel)->
    #panelHelpCfg {
    id = worldmappanel,
    help = "shijieditu",
    tesk = "世界地图"
    };
getRow(_)->[].

getKeyList()->[
    {achievementpanel},
    {activationcodeinputpanel},
    {bagpanel},
    {bravetrialspanel},
    {characterattribute},
    {checkinpanel},
    {copypanel},
    {diamondpanel},
    {equipresolve},
    {gamesettingpanel},
    {improvforcepanel},
    {newfriendspanel},
    {newmarriagepanel},
    {noticepanel},
    {npcshoppanel},
    {otherguildpanel},
    {petterritorypanel},
    {rankpanel},
    {rechargeactivitypanel},
    {redenvelopepanel},
    {resexchangepanel},
    {resourcemakepanel},
    {ridepetpanel},
    {runepanel},
    {secretshop},
    {shoppanel},
    {taskpanel},
    {teampanel},
    {transformpanel},
    {treasurehousepanel},
    {weaponimprovepanel},
    {welfarepanel},
    {wingpanel},
    {worldmappanel}
    ].

get1KeyList()->[
    achievementpanel,
    activationcodeinputpanel,
    bagpanel,
    bravetrialspanel,
    characterattribute,
    checkinpanel,
    copypanel,
    diamondpanel,
    equipresolve,
    gamesettingpanel,
    improvforcepanel,
    newfriendspanel,
    newmarriagepanel,
    noticepanel,
    npcshoppanel,
    otherguildpanel,
    petterritorypanel,
    rankpanel,
    rechargeactivitypanel,
    redenvelopepanel,
    resexchangepanel,
    resourcemakepanel,
    ridepetpanel,
    runepanel,
    secretshop,
    shoppanel,
    taskpanel,
    teampanel,
    transformpanel,
    treasurehousepanel,
    weaponimprovepanel,
    welfarepanel,
    wingpanel,
    worldmappanel
    ].

