%% coding: latin-1
%%: 实现
-module(cfg_vip_power_chs).
-compile(export_all).
-include("cfg_vip_power.hrl").
-include("logger.hrl").

getRow(1,1)->
    #vip_powerCfg {
    powerid = 1,
    level = 1,
    txt = "传送[00ff00]无冷却[-]时间",
    name = "千里之行",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "千里之行：传送无冷却时间",
    icon = "item_184"
    };
getRow(2,1)->
    #vip_powerCfg {
    powerid = 2,
    level = 1,
    txt = "NPC商店购买道具返价格[00ff00]3%[-]金币",
    name = "商会证明Ⅰ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "商会证明：降低在道具商店中购买物品时的金钱消耗，效果会随等级增强。",
    icon = "item_187"
    };
getRow(2,2)->
    #vip_powerCfg {
    powerid = 2,
    level = 2,
    txt = "NPC商店购买道具返价格[00ff00]6%[-]金币",
    name = "商会证明Ⅱ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "商会证明：降低在道具商店中购买物品时的金钱消耗，效果会随等级增强。",
    icon = "item_187"
    };
getRow(2,3)->
    #vip_powerCfg {
    powerid = 2,
    level = 3,
    txt = "NPC商店购买道具返价格[00ff00]9%[-]金币",
    name = "商会证明Ⅲ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "商会证明：降低在道具商店中购买物品时的金钱消耗，效果会随等级增强。",
    icon = "item_187"
    };
getRow(2,4)->
    #vip_powerCfg {
    powerid = 2,
    level = 4,
    txt = "NPC商店购买道具返价格[00ff00]12%[-]金币",
    name = "商会证明Ⅳ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "商会证明：降低在道具商店中购买物品时的金钱消耗，效果会随等级增强。",
    icon = "item_187"
    };
getRow(2,5)->
    #vip_powerCfg {
    powerid = 2,
    level = 5,
    txt = "NPC商店购买道具返价格[00ff00]15%[-]金币",
    name = "商会证明Ⅴ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "商会证明：降低在道具商店中购买物品时的金钱消耗，效果会随等级增强。",
    icon = "item_187"
    };
getRow(3,1)->
    #vip_powerCfg {
    powerid = 3,
    level = 1,
    txt = "通过分解获得精华增加[00ff00]10%[-]",
    name = "精工琢玉Ⅰ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "精工琢玉：通过分解装备所能获得的兑换精华数量上升，效果会随等级增强。",
    icon = "item_185"
    };
getRow(3,2)->
    #vip_powerCfg {
    powerid = 3,
    level = 2,
    txt = "通过分解获得精华增加[00ff00]20%[-]",
    name = "精工琢玉Ⅱ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "精工琢玉：通过分解装备所能获得的兑换精华数量上升，效果会随等级增强。",
    icon = "item_185"
    };
getRow(3,3)->
    #vip_powerCfg {
    powerid = 3,
    level = 3,
    txt = "通过分解获得精华增加[00ff00]30%[-]",
    name = "精工琢玉Ⅲ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "精工琢玉：通过分解装备所能获得的兑换精华数量上升，效果会随等级增强。",
    icon = "item_185"
    };
getRow(3,4)->
    #vip_powerCfg {
    powerid = 3,
    level = 4,
    txt = "通过分解获得精华增加[00ff00]40%[-]",
    name = "精工琢玉Ⅳ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "精工琢玉：通过分解装备所能获得的兑换精华数量上升，效果会随等级增强。",
    icon = "item_185"
    };
getRow(4,1)->
    #vip_powerCfg {
    powerid = 4,
    level = 1,
    txt = "副本结算获得金币增加[00ff00]10%[-]",
    name = "多财多利Ⅰ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "多财多利：副本结算时所能获得的金币奖励数量上升，效果会随等级增强。",
    icon = "item_178"
    };
getRow(4,2)->
    #vip_powerCfg {
    powerid = 4,
    level = 2,
    txt = "副本结算获得金币增加[00ff00]20%[-]",
    name = "多财多利Ⅱ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "多财多利：副本结算时所能获得的金币奖励数量上升，效果会随等级增强。",
    icon = "item_178"
    };
getRow(4,3)->
    #vip_powerCfg {
    powerid = 4,
    level = 3,
    txt = "副本结算获得金币增加[00ff00]30%[-]",
    name = "多财多利Ⅲ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "多财多利：副本结算时所能获得的金币奖励数量上升，效果会随等级增强。",
    icon = "item_178"
    };
getRow(4,4)->
    #vip_powerCfg {
    powerid = 4,
    level = 4,
    txt = "副本结算获得金币增加[00ff00]40%[-]",
    name = "多财多利Ⅳ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "多财多利：副本结算时所能获得的金币奖励数量上升，效果会随等级增强。",
    icon = "item_178"
    };
getRow(4,5)->
    #vip_powerCfg {
    powerid = 4,
    level = 5,
    txt = "副本结算获得金币增加[00ff00]50%[-]",
    name = "多财多利Ⅴ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "多财多利：副本结算时所能获得的金币奖励数量上升，效果会随等级增强。",
    icon = "item_178"
    };
getRow(5,1)->
    #vip_powerCfg {
    powerid = 5,
    level = 1,
    txt = "每日可以领取[00ff00]一次[-]爵位俸禄",
    name = "俸禄相赠",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "俸禄相赠：每日允许领取一次爵位俸禄。",
    icon = "item_180"
    };
getRow(6,1)->
    #vip_powerCfg {
    powerid = 6,
    level = 1,
    txt = "获得橙色装备概率提高[00ff00]10%[-]",
    name = "天赐机缘Ⅰ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "天赐机缘：激活后增加获得橙色装备的概率，效果会随之增加。",
    icon = "item_186"
    };
getRow(6,2)->
    #vip_powerCfg {
    powerid = 6,
    level = 2,
    txt = "获得橙色装备概率提高[00ff00]20%[-]",
    name = "天赐机缘Ⅱ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "天赐机缘：激活后增加获得橙色装备的概率，效果会随之增加。",
    icon = "item_186"
    };
getRow(6,3)->
    #vip_powerCfg {
    powerid = 6,
    level = 3,
    txt = "获得橙色装备概率提高[00ff00]30%[-]",
    name = "天赐机缘Ⅲ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "天赐机缘：激活后增加获得橙色装备的概率，效果会随之增加。",
    icon = "item_186"
    };
getRow(6,4)->
    #vip_powerCfg {
    powerid = 6,
    level = 4,
    txt = "获得橙色装备概率提高[00ff00]40%[-]",
    name = "天赐机缘Ⅳ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "天赐机缘：激活后增加获得橙色装备的概率，效果会随之增加。",
    icon = "item_186"
    };
getRow(6,5)->
    #vip_powerCfg {
    powerid = 6,
    level = 5,
    txt = "获得橙色装备概率提高[00ff00]50%[-]",
    name = "天赐机缘Ⅴ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "天赐机缘：激活后增加获得橙色装备的概率，效果会随之增加。",
    icon = "item_186"
    };
getRow(7,1)->
    #vip_powerCfg {
    powerid = 7,
    level = 1,
    txt = "可额外挑战[00ff00]一次[-]铸币熔炉",
    name = "金碧辉煌",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "金碧辉煌：允许在原有基础上多挑战一次铸币熔炉玩法副本。",
    icon = "item_188"
    };
getRow(9,1)->
    #vip_powerCfg {
    powerid = 9,
    level = 1,
    txt = "打怪获得经验值提升[00ff00]10%[-]",
    name = "千里叠云Ⅰ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "千里叠云：通过打怪所获得的经验值得到提升，效果会随之增加。",
    icon = "item_183"
    };
getRow(9,2)->
    #vip_powerCfg {
    powerid = 9,
    level = 2,
    txt = "打怪获得经验值提升[00ff00]20%[-]",
    name = "千里叠云Ⅱ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "千里叠云：通过打怪所获得的经验值得到提升，效果会随之增加。",
    icon = "item_183"
    };
getRow(9,3)->
    #vip_powerCfg {
    powerid = 9,
    level = 3,
    txt = "打怪获得经验值提升[00ff00]30%[-]",
    name = "千里叠云Ⅲ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "千里叠云：通过打怪所获得的经验值得到提升，效果会随之增加。",
    icon = "item_183"
    };
getRow(9,4)->
    #vip_powerCfg {
    powerid = 9,
    level = 4,
    txt = "打怪获得经验值提升[00ff00]40%[-]",
    name = "千里叠云Ⅳ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "千里叠云：通过打怪所获得的经验值得到提升，效果会随之增加。",
    icon = "item_183"
    };
getRow(9,5)->
    #vip_powerCfg {
    powerid = 9,
    level = 5,
    txt = "打怪获得经验值提升[00ff00]50%[-]",
    name = "千里叠云Ⅴ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "千里叠云：通过打怪所获得的经验值得到提升，效果会随之增加。",
    icon = "item_183"
    };
getRow(10,1)->
    #vip_powerCfg {
    powerid = 10,
    level = 1,
    txt = "坐骑移动速度[00ff00]+0.2[-]",
    name = "快马加鞭Ⅰ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "快马加鞭：增加坐骑移动速度，效果会随之增加。",
    icon = "item_179"
    };
getRow(10,2)->
    #vip_powerCfg {
    powerid = 10,
    level = 2,
    txt = "坐骑移动速度[00ff00]+0.4[-]",
    name = "快马加鞭Ⅱ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "快马加鞭：增加坐骑移动速度，效果会随之增加。",
    icon = "item_179"
    };
getRow(10,3)->
    #vip_powerCfg {
    powerid = 10,
    level = 3,
    txt = "坐骑移动速度[00ff00]+0.6[-]",
    name = "快马加鞭Ⅲ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "快马加鞭：增加坐骑移动速度，效果会随之增加。",
    icon = "item_179"
    };
getRow(10,4)->
    #vip_powerCfg {
    powerid = 10,
    level = 4,
    txt = "坐骑移动速度[00ff00]+0.8[-]",
    name = "快马加鞭Ⅳ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "快马加鞭：增加坐骑移动速度，效果会随之增加。",
    icon = "item_179"
    };
getRow(10,5)->
    #vip_powerCfg {
    powerid = 10,
    level = 5,
    txt = "坐骑移动速度[00ff00]+1[-]",
    name = "快马加鞭Ⅴ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "快马加鞭：增加坐骑移动速度，效果会随之增加。",
    icon = "item_179"
    };
getRow(11,1)->
    #vip_powerCfg {
    powerid = 11,
    level = 1,
    txt = "副本结算经验增加[00ff00]10%[-]",
    name = "辉煌不羁Ⅰ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "辉煌不羁：通过副本结算时能获得的经验得到提升，效果会随之增加。",
    icon = "item_177"
    };
getRow(11,2)->
    #vip_powerCfg {
    powerid = 11,
    level = 2,
    txt = "副本结算经验增加[00ff00]20%[-]",
    name = "辉煌不羁Ⅱ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "辉煌不羁：通过副本结算时能获得的经验得到提升，效果会随之增加。",
    icon = "item_177"
    };
getRow(11,3)->
    #vip_powerCfg {
    powerid = 11,
    level = 3,
    txt = "副本结算经验增加[00ff00]30%[-]",
    name = "辉煌不羁Ⅲ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "辉煌不羁：通过副本结算时能获得的经验得到提升，效果会随之增加。",
    icon = "item_177"
    };
getRow(11,4)->
    #vip_powerCfg {
    powerid = 11,
    level = 4,
    txt = "副本结算经验增加[00ff00]40%[-]",
    name = "辉煌不羁Ⅳ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "辉煌不羁：通过副本结算时能获得的经验得到提升，效果会随之增加。",
    icon = "item_177"
    };
getRow(11,5)->
    #vip_powerCfg {
    powerid = 11,
    level = 5,
    txt = "副本结算经验增加[00ff00]50%[-]",
    name = "辉煌不羁Ⅴ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "辉煌不羁：通过副本结算时能获得的经验得到提升，效果会随之增加。",
    icon = "item_177"
    };
getRow(12,1)->
    #vip_powerCfg {
    powerid = 12,
    level = 1,
    txt = "获得荣誉增加[00ff00]8%[-]",
    name = "百战不殆Ⅰ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "百战不殆：增加荣誉获取速度，效果会随之增加。",
    icon = "item_176"
    };
getRow(12,2)->
    #vip_powerCfg {
    powerid = 12,
    level = 2,
    txt = "获得荣誉增加[00ff00]16%[-]",
    name = "百战不殆Ⅱ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "百战不殆：增加荣誉获取速度，效果会随之增加。",
    icon = "item_176"
    };
getRow(12,3)->
    #vip_powerCfg {
    powerid = 12,
    level = 3,
    txt = "获得荣誉增加[00ff00]24%[-]",
    name = "百战不殆Ⅲ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "百战不殆：增加荣誉获取速度，效果会随之增加。",
    icon = "item_176"
    };
getRow(12,4)->
    #vip_powerCfg {
    powerid = 12,
    level = 4,
    txt = "获得荣誉增加[00ff00]32%[-]",
    name = "百战不殆Ⅳ",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "百战不殆：增加荣誉获取速度，效果会随之增加。",
    icon = "item_176"
    };
getRow(13,1)->
    #vip_powerCfg {
    powerid = 13,
    level = 1,
    txt = "交易行上架数量增加[00ff00]20[-]个",
    name = "商场霸主I",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "商场霸主：增加拍卖行上架数量",
    icon = "item_176"
    };
getRow(14,1)->
    #vip_powerCfg {
    powerid = 14,
    level = 1,
    txt = "交易行指定交易人数增加[00ff00]2[-]个",
    name = "交易巨头I",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "交易巨头：增加拍卖行指定交易人数",
    icon = "item_176"
    };
getRow(15,1)->
    #vip_powerCfg {
    powerid = 15,
    level = 1,
    txt = "可额外购买[00ff00]5[-]次骑宠远征券",
    name = "远征达人1级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "远征达人：额外购买骑宠远征卷",
    icon = "item_176"
    };
getRow(15,2)->
    #vip_powerCfg {
    powerid = 15,
    level = 2,
    txt = "可额外购买[00ff00]10[-]次骑宠远征券",
    name = "远征达人2级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "远征达人：额外购买骑宠远征卷",
    icon = "item_176"
    };
getRow(15,3)->
    #vip_powerCfg {
    powerid = 15,
    level = 3,
    txt = "可额外购买[00ff00]15[-]次骑宠远征券",
    name = "远征达人3级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "远征达人：额外购买骑宠远征卷",
    icon = "item_176"
    };
getRow(15,4)->
    #vip_powerCfg {
    powerid = 15,
    level = 4,
    txt = "可额外购买[00ff00]20[-]次骑宠远征券",
    name = "远征达人4级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "远征达人：额外购买骑宠远征卷",
    icon = "item_176"
    };
getRow(15,5)->
    #vip_powerCfg {
    powerid = 15,
    level = 5,
    txt = "可额外购买[00ff00]25[-]次骑宠远征券",
    name = "远征达人5级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "远征达人：额外购买骑宠远征卷",
    icon = "item_176"
    };
getRow(15,6)->
    #vip_powerCfg {
    powerid = 15,
    level = 6,
    txt = "可额外购买[00ff00]30[-]次骑宠远征券",
    name = "远征达人6级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "远征达人：额外购买骑宠远征卷",
    icon = "item_176"
    };
getRow(15,7)->
    #vip_powerCfg {
    powerid = 15,
    level = 7,
    txt = "可额外购买[00ff00]35[-]次骑宠远征券",
    name = "远征达人7级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "远征达人：额外购买骑宠远征卷",
    icon = "item_176"
    };
getRow(15,8)->
    #vip_powerCfg {
    powerid = 15,
    level = 8,
    txt = "可额外购买[00ff00]40[-]次骑宠远征券",
    name = "远征达人8级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "远征达人：额外购买骑宠远征卷",
    icon = "item_176"
    };
getRow(15,9)->
    #vip_powerCfg {
    powerid = 15,
    level = 9,
    txt = "可额外购买[00ff00]45[-]次骑宠远征券",
    name = "远征达人9级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "远征达人：额外购买骑宠远征卷",
    icon = "item_176"
    };
getRow(15,10)->
    #vip_powerCfg {
    powerid = 15,
    level = 10,
    txt = "可额外购买[00ff00]50[-]次骑宠远征券",
    name = "远征达人10级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "远征达人：额外购买骑宠远征卷",
    icon = "item_176"
    };
getRow(16,1)->
    #vip_powerCfg {
    powerid = 16,
    level = 1,
    txt = "最短聊天间隔",
    name = "艹",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(17,1)->
    #vip_powerCfg {
    powerid = 17,
    level = 1,
    txt = "直接跳过宠物远征战斗过程",
    name = "艹",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(18,1)->
    #vip_powerCfg {
    powerid = 18,
    level = 1,
    txt = "额外购买竞技场次数[00ff00]2[-]次",
    name = "竞技达人1级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "竞技达人1级：额外购买竞技场次数",
    icon = "item_176"
    };
getRow(18,2)->
    #vip_powerCfg {
    powerid = 18,
    level = 2,
    txt = "额外购买竞技场次数[00ff00]4[-]次",
    name = "竞技达人2级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "竞技达人2级：额外购买竞技场次数",
    icon = "item_176"
    };
getRow(18,3)->
    #vip_powerCfg {
    powerid = 18,
    level = 3,
    txt = "额外购买竞技场次数[00ff00]6[-]次",
    name = "竞技达人3级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "竞技达人3级：额外购买竞技场次数",
    icon = "item_176"
    };
getRow(18,4)->
    #vip_powerCfg {
    powerid = 18,
    level = 4,
    txt = "额外购买竞技场次数[00ff00]8[-]次",
    name = "竞技达人4级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "竞技达人4级：额外购买竞技场次数",
    icon = "item_176"
    };
getRow(18,5)->
    #vip_powerCfg {
    powerid = 18,
    level = 5,
    txt = "额外购买竞技场次数[00ff00]10[-]次",
    name = "竞技达人5级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "竞技达人5级：额外购买竞技场次数",
    icon = "item_176"
    };
getRow(18,6)->
    #vip_powerCfg {
    powerid = 18,
    level = 6,
    txt = "额外购买竞技场次数[00ff00]12[-]次",
    name = "竞技达人6级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "竞技达人6级：额外购买竞技场次数",
    icon = "item_176"
    };
getRow(18,7)->
    #vip_powerCfg {
    powerid = 18,
    level = 7,
    txt = "额外购买竞技场次数[00ff00]14[-]次",
    name = "竞技达人7级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "竞技达人7级：额外购买竞技场次数",
    icon = "item_176"
    };
getRow(18,8)->
    #vip_powerCfg {
    powerid = 18,
    level = 8,
    txt = "额外购买竞技场次数[00ff00]16[-]次",
    name = "竞技达人8级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "竞技达人8级：额外购买竞技场次数",
    icon = "item_176"
    };
getRow(18,9)->
    #vip_powerCfg {
    powerid = 18,
    level = 9,
    txt = "额外购买竞技场次数[00ff00]18[-]次",
    name = "竞技达人9级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "竞技达人9级：额外购买竞技场次数",
    icon = "item_176"
    };
getRow(18,10)->
    #vip_powerCfg {
    powerid = 18,
    level = 10,
    txt = "额外购买竞技场次数[00ff00]20[-]次",
    name = "竞技达人10级",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "竞技达人10级：额外购买竞技场次数",
    icon = "item_176"
    };
getRow(19,1)->
    #vip_powerCfg {
    powerid = 19,
    level = 1,
    txt = "获得特有静态表情",
    name = "艹",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(20,1)->
    #vip_powerCfg {
    powerid = 20,
    level = 1,
    txt = "获得特有动态表情",
    name = "艹",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(21,1)->
    #vip_powerCfg {
    powerid = 21,
    level = 1,
    txt = "【[00ff00]VIP1[-]级专属BUFF】攻击+50,生命+500,暴击伤害+1%,暴伤减免+1%",
    name = "VIP1专属BUFF",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(21,2)->
    #vip_powerCfg {
    powerid = 21,
    level = 2,
    txt = "【[00ff00]VIP2[-]级专属BUFF】攻击+60,生命+600,暴击伤害+2%,暴伤减免+2%",
    name = "VIP2专属BUFF",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(21,3)->
    #vip_powerCfg {
    powerid = 21,
    level = 3,
    txt = "【[00ff00]VIP3[-]级专属BUFF】攻击+80,生命+800,暴击伤害+3%,暴伤减免+3%",
    name = "VIP3专属BUFF",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(21,4)->
    #vip_powerCfg {
    powerid = 21,
    level = 4,
    txt = "【[00ff00]VIP4[-]级专属BUFF】攻击+110,生命+1100,暴击伤害+4%,暴伤减免+4%",
    name = "VIP4专属BUFF",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(21,5)->
    #vip_powerCfg {
    powerid = 21,
    level = 5,
    txt = "【[00ff00]VIP5[-]级专属BUFF】攻击+150,生命+1500,暴击伤害+6%,暴伤减免+6%",
    name = "VIP5专属BUFF",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(21,6)->
    #vip_powerCfg {
    powerid = 21,
    level = 6,
    txt = "【[00ff00]VIP6[-]级专属BUFF】攻击+200,生命+2000,暴击伤害+8%,暴伤减免+8%",
    name = "VIP6专属BUFF",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(21,7)->
    #vip_powerCfg {
    powerid = 21,
    level = 7,
    txt = "【[00ff00]VIP7[-]级专属BUFF】攻击+260,生命+2600,暴击伤害+10%,暴伤减免+10%",
    name = "VIP7专属BUFF",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(21,8)->
    #vip_powerCfg {
    powerid = 21,
    level = 8,
    txt = "【[00ff00]VIP8[-]级专属BUFF】攻击+330,生命+3300,暴击伤害+12%,暴伤减免+12%",
    name = "VIP8专属BUFF",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(21,9)->
    #vip_powerCfg {
    powerid = 21,
    level = 9,
    txt = "【[00ff00]VIP9[-]级专属BUFF】攻击+410,生命+4100,暴击伤害+14%,暴伤减免+14%",
    name = "VIP9专属BUFF",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(21,10)->
    #vip_powerCfg {
    powerid = 21,
    level = 10,
    txt = "【[00ff00]VIP10[-]级专属BUFF】攻击+500,生命+5000,暴击伤害+17%,暴伤减免+17%",
    name = "VIP10专属BUFF",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(21,11)->
    #vip_powerCfg {
    powerid = 21,
    level = 11,
    txt = "【[00ff00]VIP11[-]级专属BUFF】攻击+600,生命+6000,暴击伤害+20%,暴伤减免+20%",
    name = "VIP11专属BUFF",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(21,12)->
    #vip_powerCfg {
    powerid = 21,
    level = 12,
    txt = "【[00ff00]VIP12[-]级专属BUFF】攻击+710,生命+7100,暴击伤害+23%,暴伤减免+23%",
    name = "VIP12专属BUFF",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(21,13)->
    #vip_powerCfg {
    powerid = 21,
    level = 13,
    txt = "【[00ff00]VIP13[-]级专属BUFF】攻击+830,生命+8300,暴击伤害+26%,暴伤减免+26%",
    name = "VIP13专属BUFF",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(21,14)->
    #vip_powerCfg {
    powerid = 21,
    level = 14,
    txt = "【[00ff00]VIP14[-]级专属BUFF】攻击+960,生命+9600,暴击伤害+29%,暴伤减免+29%",
    name = "VIP14专属BUFF",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(21,15)->
    #vip_powerCfg {
    powerid = 21,
    level = 15,
    txt = "【[00ff00]VIP15[-]级专属BUFF】攻击+1100,生命+11000,暴击伤害+33%,暴伤减免+33%",
    name = "VIP15专属BUFF",
    powerType = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(22,1)->
    #vip_powerCfg {
    powerid = 22,
    level = 1,
    txt = "获得额外2个骑宠领地",
    name = "VIP1",
    powerType = 0,
    param1 = 2,
    param2 = 0,
    param3 = 0,
    khd = "艹",
    icon = "item_176"
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
    {2,1},
    {2,2},
    {2,3},
    {2,4},
    {2,5},
    {3,1},
    {3,2},
    {3,3},
    {3,4},
    {4,1},
    {4,2},
    {4,3},
    {4,4},
    {4,5},
    {5,1},
    {6,1},
    {6,2},
    {6,3},
    {6,4},
    {6,5},
    {7,1},
    {9,1},
    {9,2},
    {9,3},
    {9,4},
    {9,5},
    {10,1},
    {10,2},
    {10,3},
    {10,4},
    {10,5},
    {11,1},
    {11,2},
    {11,3},
    {11,4},
    {11,5},
    {12,1},
    {12,2},
    {12,3},
    {12,4},
    {13,1},
    {14,1},
    {15,1},
    {15,2},
    {15,3},
    {15,4},
    {15,5},
    {15,6},
    {15,7},
    {15,8},
    {15,9},
    {15,10},
    {16,1},
    {17,1},
    {18,1},
    {18,2},
    {18,3},
    {18,4},
    {18,5},
    {18,6},
    {18,7},
    {18,8},
    {18,9},
    {18,10},
    {19,1},
    {20,1},
    {21,1},
    {21,2},
    {21,3},
    {21,4},
    {21,5},
    {21,6},
    {21,7},
    {21,8},
    {21,9},
    {21,10},
    {21,11},
    {21,12},
    {21,13},
    {21,14},
    {21,15},
    {22,1}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22
    ].

get2KeyList(1)->[
    1
    ];
get2KeyList(2)->[
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(3)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(4)->[
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(5)->[
    1
    ];
get2KeyList(6)->[
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(7)->[
    1
    ];
get2KeyList(9)->[
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(10)->[
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(11)->[
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(12)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(13)->[
    1
    ];
get2KeyList(14)->[
    1
    ];
get2KeyList(15)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(16)->[
    1
    ];
get2KeyList(17)->[
    1
    ];
get2KeyList(18)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(19)->[
    1
    ];
get2KeyList(20)->[
    1
    ];
get2KeyList(21)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15
    ];
get2KeyList(22)->[
    1
    ];
get2KeyList(_)->[].

